#!/usr/bin/env python3
r"""Build a block manifest for a LaTeX manuscript, without modifying it.

Usage: anchorize_tex.py <tex> [--print-blocks]

The manifest anchors each block of the manuscript by its offset and its hash. An HTML comment marker such as <!--block:B0001--> is not a comment in LaTeX and would land in the output, so the .tex stays byte-identical and the anchors live in a sidecar manifest. The manifest is the only source of the hashes a patch carries: a writer copies them and does not compute them, so a writer that was looking at different text than the file holds is caught when the patch is applied.

Blocks are the runs of non-blank lines at environment depth zero, so a table, figure or equation environment is one block and never splits. A \begin{document} or \begin{frontmatter} and its \end do not count toward the depth. The blank lines between blocks are separators, and no operation can address them.

Run it at the start of every revision round and rewrite nothing between this and apply_tex_patch.py, since any rewrite of the .tex invalidates the manifest.

Reads: the .tex, as UTF-8.

Writes: <tex>.block-manifest.json beside the .tex, replaced when it exists. It holds the schema name tex_block_manifest/1, the .tex's path, hash and size, and for each block its id (B0001, B0002, ...), hash, character span, section and first line. Once the manifest is written, the script checks that its blocks and the text between them rebuild the .tex.

Prints: "<manifest path>: <n> blocks, <c>/<t> chars in blocks", and with --print-blocks one line per block with its id, its section and its first line.

Errors, each printed on standard error:

- argparse's usage message and "anchorize_tex.py: error: ...", for a missing <tex> or an unknown option.
- A Python traceback, for any other failure, such as a .tex that does not exist, cannot be read or is not valid UTF-8. No manifest is written for such a .tex.
- An AssertionError traceback, "manifest spans do not reconstruct the file", when the blocks and the text between them do not rebuild the .tex. The manifest is already written then.

Exit status: 0 when the manifest was written or --help was printed, 2 for argparse's usage error, 1 for either traceback.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

BEGIN = re.compile(r"\\begin\{([^}]+)\}")
END = re.compile(r"\\end\{([^}]+)\}")
# Containers that wrap the whole paper or a whole front block. They never close within a
# paragraph, so counting them would make the entire body one block.
CONTAINERS = {"document", "frontmatter"}
SECTION = re.compile(r"\\(section|subsection|subsubsection)\*?\{(.*?)\}")


def sha256(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def blocks_of(text: str) -> list[tuple[int, int]]:
    """Spans of the blocks. A blank line only ends a block at environment depth zero."""
    lines = text.split("\n")
    offsets, pos = [], 0
    for line in lines:
        offsets.append(pos)
        pos += len(line) + 1

    spans, depth, start = [], 0, None
    for i, line in enumerate(lines):
        stripped = line.strip()
        if start is None and stripped:
            start = i
        if start is not None:
            opened = [e for e in BEGIN.findall(line) if e not in CONTAINERS]
            closed = [e for e in END.findall(line) if e not in CONTAINERS]
            depth += len(opened) - len(closed)
            depth = max(depth, 0)
            nxt = lines[i + 1].strip() if i + 1 < len(lines) else ""
            last = i == len(lines) - 1
            if depth == 0 and (last or not nxt):
                end_char = offsets[i] + len(lines[i])
                spans.append((offsets[start], end_char))
                start = None
    return spans


def current_section(text: str, upto: int) -> str:
    hits = SECTION.findall(text[:upto])
    return hits[-1][1] if hits else "frontmatter"


def build(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    spans = blocks_of(text)
    blocks = []
    for n, (a, b) in enumerate(spans, start=1):
        body = text[a:b]
        first = body.split("\n", 1)[0].strip()
        blocks.append({
            "block_id": f"B{n:04d}",
            "sha256": sha256(body),
            "char_start": a,
            "char_end": b,
            "n_chars": b - a,
            "section": current_section(text, a),
            "first_line_excerpt": first[:110],
        })
    covered = sum(b["n_chars"] for b in blocks)
    return {
        "schema": "tex_block_manifest/1",
        "base_file": str(path),
        "base_sha256": sha256(text),
        "n_chars": len(text),
        "n_blocks": len(blocks),
        "chars_in_blocks": covered,
        "blocks": blocks,
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("tex")
    ap.add_argument("--print-blocks", action="store_true",
                    help="also print each block's id, section and first line")
    args = ap.parse_args()
    path = Path(args.tex)
    manifest = build(path)
    out = Path(str(path) + ".block-manifest.json")
    out.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")

    # A block manifest that cannot rebuild the file is useless; prove it can.
    text = path.read_text(encoding="utf-8")
    rebuilt, cursor = [], 0
    for b in manifest["blocks"]:
        rebuilt.append(text[cursor:b["char_start"]])
        rebuilt.append(text[b["char_start"]:b["char_end"]])
        cursor = b["char_end"]
    rebuilt.append(text[cursor:])
    assert "".join(rebuilt) == text, "manifest spans do not reconstruct the file"

    print(f"{out}: {manifest['n_blocks']} blocks, "
          f"{manifest['chars_in_blocks']}/{manifest['n_chars']} chars in blocks")
    if args.print_blocks:
        for b in manifest["blocks"]:
            print(f"  {b['block_id']}  {b['section'][:28]:30s} {b['first_line_excerpt'][:70]}")


if __name__ == "__main__":
    main()
