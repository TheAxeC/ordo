#!/usr/bin/env python3
r"""Apply a block patch to a LaTeX manuscript, fail-closed.

Usage:

    apply_tex_patch.py <base> <patch> --output <output> [--manifest <manifest>] [--acknowledge-structural]
    apply_tex_patch.py <base> <patch> --check-only [--manifest <manifest>] [--acknowledge-structural]

The script applies the operations of a patch to the blocks that anchorize_tex.py recorded in the manifest of <base>. A block no operation names cannot be silently rewritten, because no generation pass runs over it. That property belongs to this script and not to the model, and it does not make the edits themselves better. Structural rewrites are not protected by it: they are flagged and refused unless acknowledged. Validation is complete before a byte is written, and the base file is never modified.

Patch document, JSON:

    {
      "schema": "tex_revision_patch/1",
      "base_file": "manuscript/main.tex",
      "base_sha256": "<copied from the manifest>",
      "round": 1,
      "ops": [
        {"op_id": "OP001",
         "kind": "replace_block" | "insert_after" | "delete_block",
         "block_id": "B0023",
         "old_hash": "<copied from the manifest, never computed>",
         "roadmap_item_ids": ["R2-1b", "R2-2a"],
         "rationale": "one line, why this edit answers those items",
         "new_text": "<replacement text, or the text inserted after the block>"}
      ]
    }

- replace_block replaces the block with new_text, insert_after puts a blank line and new_text after the block, and delete_block removes the block and the separator up to the next block, or only the block when it is the last.
- new_text is required for replace_block and insert_after and must not be blank. roadmap_item_ids must name at least one item.
- base_file is not read. base_sha256, when the patch has it, must equal the manifest's. round is copied to the apply report.
- A block takes at most one op. An op's old_hash must equal the manifest's hash of its block, and the manifest must describe <base> as it is on disk.

Reads:

- <base>, as UTF-8.
- The manifest anchorize_tex.py wrote, <base>.block-manifest.json unless --manifest names another.
- <patch>, a JSON document.

Writes: with --output, the patched text to <output>, and the apply report to <output>.apply-report.json. With --check-only nothing is written, and --output is ignored. The base is never written.

Prints the apply report as JSON on standard output when the patch is applied or, with --check-only, checked. It holds the result ("applied" or "checked"), the base file and hash, the round, the number of blocks and of blocks touched, each op applied (its id, kind, block, section, roadmap items, rationale and the characters before and after), blocks_untouched, the roadmap items covered, the ratios block_touched_ratio, preserved_ratio and char_churn_ratio, net_growth_chars, the structural flags, whether they were acknowledged, and, for an output written, its path and hash. How much a touched block grows is reported and does not gate.

When the patch is not applied, the script prints {"result": "rejected", "kind": "<kind>", "problems": [...]} as JSON on standard output, and the kind is one of:

- stale-manifest, when the manifest does not describe <base> as it is on disk. The check stops the validation at once.
- schema, when the patch's ops are missing or empty. The check stops the validation at once, and the problems found before it are listed with it.
- validation, for every other problem of the patch: a schema that is not tex_revision_patch/1, a base_sha256 that differs from the manifest's, an unknown kind, a block_id the manifest does not hold, a block addressed twice, an old_hash that is not the manifest's, a block whose text in <base> is not the text the manifest hashes, no roadmap item, and a missing or blank new_text. All the problems found are listed, and none of the ops is applied.
- structural, when the patch touches more than 0.6 of the blocks, changes the number of \section, \subsection and \subsubsection headings (starred or not), or rewrites the kind or the title of one. --acknowledge-structural applies the patch anyway and keeps the flags in the apply report.
- output, when --output is the base file.
- self-check, when a block no op names is not in the written output, or when the output is not the one the ops rebuild. The output is removed then.

Errors, each printed on standard error:

- argparse's usage message and "apply_tex_patch.py: error: ...", for a missing <base> or <patch>, an unknown option, and "--output is required unless --check-only is used". The last one is printed after the patch has passed validation.
- A Python traceback, for any other failure, such as a base, a manifest or a patch that cannot be read, is not valid UTF-8 or is not valid JSON, or an output that cannot be written.

Exit status:

- 0 when the patch was applied or checked, or --help was printed.
- 2 for a validation rejection (kinds stale-manifest, schema, validation and output) and for argparse's usage error. The base is untouched.
- 3 for a structural flag that was not acknowledged. Rerun with --acknowledge-structural if the structural change is intended.
- 4 for a self-check failure, which is a defect of this script.
- 1 for a traceback.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path

SCHEMA = "tex_revision_patch/1"
KINDS = {"replace_block", "insert_after", "delete_block"}
BLOCK_RATIO_LIMIT = 0.6      # fraction of BLOCKS an op may touch before this reads as a rewrite
SECTION_RE = re.compile(r"\\(section|subsection|subsubsection)\*?\{(.*?)\}")


def sha256(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def fail(code: int, kind: str, problems: list[str]) -> None:
    print(json.dumps({"result": "rejected", "kind": kind, "problems": problems}, indent=2))
    sys.exit(code)


def validate(base: str, manifest: dict, patch: dict) -> list[dict]:
    problems: list[str] = []
    if patch.get("schema") != SCHEMA:
        problems.append(f"schema must be {SCHEMA!r}, got {patch.get('schema')!r}")
    if manifest.get("base_sha256") != sha256(base):
        problems.append(
            "the manifest does not describe the file on disk. Re-run anchorize_tex.py and have "
            "the writer re-emit the patch against the fresh manifest.")
        fail(2, "stale-manifest", problems)
    if patch.get("base_sha256") and patch["base_sha256"] != manifest["base_sha256"]:
        problems.append(
            "the patch's base_sha256 does not match the manifest. The writer was looking at a "
            "different version of the manuscript.")

    by_id = {b["block_id"]: b for b in manifest["blocks"]}
    order = [b["block_id"] for b in manifest["blocks"]]
    ops = patch.get("ops")
    if not isinstance(ops, list) or not ops:
        problems.append("ops must be a non-empty list")
        fail(2, "schema", problems)

    seen_blocks: dict[str, str] = {}
    resolved: list[dict] = []
    for i, op in enumerate(ops):
        tag = op.get("op_id") or f"ops[{i}]"
        kind, bid = op.get("kind"), op.get("block_id")
        if kind not in KINDS:
            problems.append(f"{tag}: kind must be one of {sorted(KINDS)}, got {kind!r}")
            continue
        if bid not in by_id:
            problems.append(f"{tag}: block_id {bid!r} is not in the manifest")
            continue
        if bid in seen_blocks:
            problems.append(
                f"{tag}: block {bid} is already addressed by {seen_blocks[bid]}; a block takes "
                "at most one op")
            continue
        seen_blocks[bid] = tag
        blk = by_id[bid]
        live = base[blk["char_start"]:blk["char_end"]]
        if op.get("old_hash") != blk["sha256"]:
            problems.append(
                f"{tag}: old_hash does not match the manifest entry for {bid}. Copy it from the "
                f"manifest, do not compute it. Block starts {blk['first_line_excerpt'][:60]!r}")
            continue
        if sha256(live) != blk["sha256"]:
            problems.append(f"{tag}: the file no longer holds the block {bid} the manifest records")
            continue
        if not op.get("roadmap_item_ids"):
            problems.append(f"{tag}: roadmap_item_ids must name at least one reviewer item")
        if kind != "delete_block" and not isinstance(op.get("new_text"), str):
            problems.append(f"{tag}: kind {kind} requires new_text")
            continue
        if kind != "delete_block" and not (op.get("new_text") or "").strip():
            problems.append(f"{tag}: new_text is empty; use delete_block to remove a block")
            continue
        nxt = order.index(bid) + 1
        resolved.append({**op, "op_id": tag, "block": blk,
                         "next_start": by_id[order[nxt]]["char_start"] if nxt < len(order) else None,
                         "old_text": live})

    if problems:
        fail(2, "validation", problems)
    resolved.sort(key=lambda o: o["block"]["char_start"])
    return resolved


def apply_ops(base: str, resolved: list[dict]) -> str:
    out = base
    for op in sorted(resolved, key=lambda o: o["block"]["char_start"], reverse=True):
        blk, new = op["block"], op.get("new_text") or ""
        a, b = blk["char_start"], blk["char_end"]
        if op["kind"] == "replace_block":
            out = out[:a] + new + out[b:]
        elif op["kind"] == "insert_after":
            out = out[:b] + "\n\n" + new + out[b:]
        else:                                   # delete_block: take the trailing separator too
            end = op["next_start"] if op["next_start"] is not None else b
            out = out[:a] + out[end:]
    return out


def structural_flags(base: str, out: str, resolved: list[dict], n_blocks: int) -> list[str]:
    """What makes a patch structural: it rewrites or removes a heading, it changes the section
    count, or it touches so many blocks that it is a rewrite in patch clothing. The measure is the
    fraction of BLOCKS touched, which is what the blast-radius guarantee is about. How much a
    touched block grows is reported (char_churn_ratio, net_growth_chars) but does not gate: a
    section that triples because a referee asked for a table that did not exist is not a
    restructure."""
    flags = []
    ratio = len(resolved) / max(n_blocks, 1)
    if ratio > BLOCK_RATIO_LIMIT:
        flags.append(f"block_touched_ratio {ratio:.3f} ({len(resolved)} of {n_blocks} blocks) "
                     f"exceeds {BLOCK_RATIO_LIMIT}")
    before, after = SECTION_RE.findall(base), SECTION_RE.findall(out)
    if len(before) != len(after):
        flags.append(f"section count changes from {len(before)} to {len(after)}")
    else:
        for (k1, t1), (k2, t2) in zip(before, after):
            if k1 != k2 or t1 != t2:
                flags.append(f"heading rewritten: \\{k1}{{{t1}}} becomes \\{k2}{{{t2}}}")
    return flags


def self_check(base: str, written: str, resolved: list[dict], manifest: dict) -> list[str]:
    """Every block no op names must survive byte-identically in the output."""
    problems = []
    touched = {o["block"]["block_id"] for o in resolved}
    for blk in manifest["blocks"]:
        if blk["block_id"] in touched:
            continue
        body = base[blk["char_start"]:blk["char_end"]]
        if body not in written:
            problems.append(
                f"{blk['block_id']} was named by no op but is not present verbatim in the output")
    if apply_ops(base, resolved) != written:
        problems.append("rebuilt output differs from the written output")
    return problems


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("base")
    ap.add_argument("patch")
    ap.add_argument("--manifest", help="default: <base>.block-manifest.json")
    ap.add_argument("--output")
    ap.add_argument("--check-only", action="store_true")
    ap.add_argument("--acknowledge-structural", action="store_true",
                    help="proceed despite structural flags; a deliberate decision, never a default")
    args = ap.parse_args()

    base_path = Path(args.base)
    base = base_path.read_text(encoding="utf-8")
    man_path = Path(args.manifest or (str(base_path) + ".block-manifest.json"))
    manifest = json.loads(man_path.read_text(encoding="utf-8"))
    patch = json.loads(Path(args.patch).read_text(encoding="utf-8"))

    resolved = validate(base, manifest, patch)
    out = apply_ops(base, resolved)
    flags = structural_flags(base, out, resolved, manifest["n_blocks"])
    if flags and not args.acknowledge_structural:
        fail(3, "structural", flags + [
            "Narrow the patch, or rerun with --acknowledge-structural if the structural change is "
            "intended. The flags stay in the apply report either way."])

    churn = sum(len(o["old_text"]) if o["kind"] != "insert_after" else 0 for o in resolved) \
        + sum(len(o.get("new_text") or "") for o in resolved)
    block_ratio = len(resolved) / max(manifest["n_blocks"], 1)
    report = {
        "result": "checked" if args.check_only else "applied",
        "base_file": str(base_path), "base_sha256": sha256(base), "round": patch.get("round"),
        "n_blocks": manifest["n_blocks"], "n_blocks_touched": len(resolved),
        "ops_applied": [{"op_id": o["op_id"], "kind": o["kind"],
                         "block_id": o["block"]["block_id"],
                         "section": o["block"]["section"],
                         "roadmap_item_ids": o.get("roadmap_item_ids"),
                         "rationale": o.get("rationale"),
                         "chars_before": len(o["old_text"]),
                         "chars_after": len(o.get("new_text") or "")} for o in resolved],
        "blocks_untouched": manifest["n_blocks"] - len(resolved),
        "roadmap_items_covered": sorted({i for o in resolved
                                         for i in o.get("roadmap_item_ids", [])}),
        "block_touched_ratio": round(block_ratio, 4),
        "preserved_ratio": round(1 - block_ratio, 4),
        "char_churn_ratio": round(churn / max(len(base), 1), 4),
        "net_growth_chars": len(out) - len(base),
        "structural_flags": flags,
        "structural_acknowledged": bool(flags) and args.acknowledge_structural,
    }

    if args.check_only:
        print(json.dumps(report, indent=2))
        return
    if not args.output:
        ap.error("--output is required unless --check-only is used")
    out_path = Path(args.output)
    if out_path.resolve() == base_path.resolve():
        fail(2, "output", ["--output must differ from the base; the base is never modified"])

    out_path.write_text(out, encoding="utf-8")
    written = out_path.read_text(encoding="utf-8")
    problems = self_check(base, written, resolved, manifest)
    if problems:
        out_path.unlink(missing_ok=True)
        fail(4, "self-check", problems)

    report["output_file"] = str(out_path)
    report["output_sha256"] = sha256(written)
    Path(str(out_path) + ".apply-report.json").write_text(
        json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
