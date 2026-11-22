#!/bin/sh
# Offline proof of apply_tex_patch.py on scratch .tex files and the manifests anchorize_tex.py makes of them. A patch with a good hash replaces, inserts or deletes only the blocks it names and writes the apply report; a patch with a hash that is not the manifest's, a manifest of an earlier version of the file, two ops on one block, or one stale op among good ones is rejected with exit 2 and writes nothing; a patch that rewrites or deletes a section heading, or touches more than 0.6 of the blocks, gets exit 3 and no output unless --acknowledge-structural is given; an output equal to the patched .tex is rejected; --check-only writes nothing. Each case is kept because a wrong answer overwrites manuscript text outside the block a patch names. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

for script in anchorize_tex.py apply_tex_patch.py; do
    if [ ! -f "$here/$script" ]; then
        echo "FAIL: $here/$script does not exist"
        exit 1
    fi
done

scratch=$(mktemp -d "${TMPDIR:-/tmp}/apply-tex-patch-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import json
import os
import subprocess
import sys

anchorize = os.path.join(sys.argv[1], "anchorize_tex.py")
apply_patch = os.path.join(sys.argv[1], "apply_tex_patch.py")
scratch = sys.argv[2]
failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def read(path):
    with open(path, "rb") as handle:
        return handle.read()


def write(path, text):
    with open(path, "w", encoding="utf-8", newline="") as handle:
        handle.write(text)


def prepare(name, text):
    """(base path, manifest) of a scratch .tex written from text and anchored."""
    base = os.path.join(scratch, name + ".tex")
    write(base, text)
    done = subprocess.run([sys.executable, "-B", anchorize, base], capture_output=True, text=True)
    check("anchorize " + name, done.returncode == 0, done.stderr)
    with open(base + ".block-manifest.json", encoding="utf-8") as handle:
        return base, json.load(handle)


def op(manifest, number, kind, new_text=None, op_id="OP001", old_hash=None, items=("R1",)):
    """An op on block <number> (from 1) with the hash the manifest holds, unless old_hash says otherwise."""
    block = manifest["blocks"][number - 1]
    result = {
        "op_id": op_id,
        "kind": kind,
        "block_id": block["block_id"],
        "old_hash": block["sha256"] if old_hash is None else old_hash,
        "roadmap_item_ids": list(items),
        "rationale": "scratch",
    }
    if new_text is not None:
        result["new_text"] = new_text
    return result


def patch_for(name, manifest, ops):
    path = os.path.join(scratch, name + ".patch.json")
    write(path, json.dumps({"schema": "tex_revision_patch/1", "base_file": name + ".tex", "base_sha256": manifest["base_sha256"], "round": 1, "ops": ops}))
    return path


def run(base, patch, *options):
    """(exit status, the JSON on standard output) of apply_tex_patch.py."""
    done = subprocess.run([sys.executable, "-B", apply_patch, base, patch, *options], capture_output=True, text=True)
    try:
        report = json.loads(done.stdout)
    except ValueError:
        report = {}
        check("standard output is JSON", False, repr((done.stdout, done.stderr)))
    return done.returncode, report


FIVE = "Para 1.\n\nPara 2.\n\nPara 3.\n\nPara 4.\n\nPara 5.\n"

# P1: one replace_block with the manifest's hash.
text = "Para one.\n\nPara two.\n\nPara three.\n"
base, manifest = prepare("p1", text)
output = os.path.join(scratch, "p1.out.tex")
patch = patch_for("p1", manifest, [op(manifest, 2, "replace_block", "Para two, revised.", items=("R2-1b", "R2-2a"))])
status, report = run(base, patch, "--output", output)
check("P1 exit status", status == 0, repr(report))
check("P1 the output", os.path.exists(output) and read(output) == b"Para one.\n\nPara two, revised.\n\nPara three.\n", repr(read(output) if os.path.exists(output) else None))
check("P1 the base is byte-identical", read(base) == text.encode("utf-8"))
report_path = output + ".apply-report.json"
check("P1 the apply report is written", os.path.exists(report_path))
if os.path.exists(report_path):
    with open(report_path, encoding="utf-8") as handle:
        written = json.load(handle)
    applied = written.get("ops_applied", [])
    check("P1 the report names the op, its block and its items", len(applied) == 1 and applied[0]["op_id"] == "OP001" and applied[0]["kind"] == "replace_block" and applied[0]["block_id"] == "B0002" and applied[0]["roadmap_item_ids"] == ["R2-1b", "R2-2a"], repr(applied))
    check("P1 the report is the one printed", written == report)

# P2: an old_hash that is not the manifest's.
base, manifest = prepare("p2", text)
output = os.path.join(scratch, "p2.out.tex")
patch = patch_for("p2", manifest, [op(manifest, 2, "replace_block", "Changed.", old_hash="0" * 64)])
status, report = run(base, patch, "--output", output)
check("P2 exit status", status == 2 and report.get("kind") == "validation", repr((status, report)))
check("P2 no output", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
check("P2 the base is byte-identical", read(base) == text.encode("utf-8"))

# P3: the .tex changed after anchorize.
base, manifest = prepare("p3", text)
changed = text + "\nPara four.\n"
write(base, changed)
output = os.path.join(scratch, "p3.out.tex")
patch = patch_for("p3", manifest, [op(manifest, 2, "replace_block", "Changed.")])
status, report = run(base, patch, "--output", output)
check("P3 exit status and kind", status == 2 and report.get("kind") == "stale-manifest", repr((status, report)))
check("P3 no output", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
check("P3 the base is byte-identical", read(base) == changed.encode("utf-8"))

# P4: two ops on one block.
base, manifest = prepare("p4", text)
output = os.path.join(scratch, "p4.out.tex")
patch = patch_for("p4", manifest, [op(manifest, 2, "replace_block", "First.", op_id="OP001"), op(manifest, 2, "replace_block", "Second.", op_id="OP002")])
status, report = run(base, patch, "--output", output)
check("P4 exit status", status == 2 and report.get("kind") == "validation", repr((status, report)))
check("P4 the problem names the second op", any("OP002" in problem and "OP001" in problem for problem in report.get("problems", [])), repr(report))
check("P4 no output", not os.path.exists(output))
check("P4 the base is byte-identical", read(base) == text.encode("utf-8"))

# P5: a patch that rewrites a \section heading.
heading = "\\section{Introduction}\n\nPara 1.\n\nPara 2.\n\nPara 3.\n\nPara 4.\n"
base, manifest = prepare("p5", heading)
patch = patch_for("p5", manifest, [op(manifest, 1, "replace_block", "\\section{Background}")])
output = os.path.join(scratch, "p5.out.tex")
status, report = run(base, patch, "--output", output)
check("P5 exit 3 without the flag", status == 3 and report.get("kind") == "structural" and any("heading rewritten" in problem for problem in report.get("problems", [])), repr((status, report)))
check("P5 no output without the flag", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
status, report = run(base, patch, "--output", output, "--acknowledge-structural")
check("P5 exit status with the flag", status == 0, repr(report))
check("P5 the output with the flag", os.path.exists(output) and read(output) == heading.replace("Introduction", "Background").encode("utf-8"))
check("P5 the flag is in the report", report.get("structural_acknowledged") is True and any("heading rewritten" in flag for flag in report.get("structural_flags", [])), repr(report))
if os.path.exists(output + ".apply-report.json"):
    with open(output + ".apply-report.json", encoding="utf-8") as handle:
        written = json.load(handle)
    check("P5 the flag is in the written report", written.get("structural_acknowledged") is True and written.get("structural_flags") == report.get("structural_flags"), repr(written))
else:
    check("P5 the apply report is written", False)

# P6: --output equal to the base, written as the same path and as another spelling of it.
base, manifest = prepare("p6", text)
patch = patch_for("p6", manifest, [op(manifest, 2, "replace_block", "Changed.")])
other_spelling = os.path.join(scratch, ".", "p6.tex")
for label, target in (("the same path", base), ("another spelling", other_spelling)):
    status, report = run(base, patch, "--output", target)
    check("P6 exit status, " + label, status == 2 and report.get("kind") == "output", repr((status, report)))
    check("P6 the base is byte-identical, " + label, read(base) == text.encode("utf-8"))
check("P6 no apply report", not os.path.exists(base + ".apply-report.json"))

# P7: --check-only writes no output and no apply report.
base, manifest = prepare("p7", text)
patch = patch_for("p7", manifest, [op(manifest, 2, "replace_block", "Changed.")])
output = os.path.join(scratch, "p7.out.tex")
before = sorted(os.listdir(scratch))
status, report = run(base, patch, "--check-only")
check("P7 exit status", status == 0 and report.get("result") == "checked", repr((status, report)))
status_with_output, _ = run(base, patch, "--check-only", "--output", output)
check("P7 exit status with --output", status_with_output == 0)
check("P7 nothing written", sorted(os.listdir(scratch)) == before, repr(sorted(set(os.listdir(scratch)) - set(before))))
check("P7 the base is byte-identical", read(base) == text.encode("utf-8"))

# P8: an insert_after on block 2 and a delete_block on block 4 of five paragraph blocks.
base, manifest = prepare("p8", FIVE)
output = os.path.join(scratch, "p8.out.tex")
patch = patch_for("p8", manifest, [op(manifest, 2, "insert_after", "New para.", op_id="OP001"), op(manifest, 4, "delete_block", op_id="OP002")])
status, report = run(base, patch, "--output", output)
check("P8 exit status", status == 0, repr(report))
check("P8 the output", os.path.exists(output) and read(output) == b"Para 1.\n\nPara 2.\n\nNew para.\n\nPara 3.\n\nPara 5.\n", repr(read(output) if os.path.exists(output) else None))
check("P8 the base is byte-identical", read(base) == FIVE.encode("utf-8"))

# P9: one op with the manifest's hash and one with a stale hash: no op is applied.
base, manifest = prepare("p9", FIVE)
output = os.path.join(scratch, "p9.out.tex")
patch = patch_for("p9", manifest, [op(manifest, 2, "replace_block", "Good.", op_id="OP001"), op(manifest, 4, "replace_block", "Stale.", op_id="OP002", old_hash="f" * 64)])
status, report = run(base, patch, "--output", output)
check("P9 exit status and kind", status == 2 and report.get("kind") == "validation", repr((status, report)))
check("P9 the problem names the stale op only", len(report.get("problems", [])) == 1 and "OP002" in report["problems"][0], repr(report))
check("P9 no output", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
check("P9 the base is byte-identical", read(base) == FIVE.encode("utf-8"))

# P10: four of five blocks touched, 0.8 above 0.6.
base, manifest = prepare("p10", FIVE)
output = os.path.join(scratch, "p10.out.tex")
patch = patch_for("p10", manifest, [op(manifest, number, "replace_block", f"New {number}.", op_id=f"OP00{number}") for number in (1, 2, 3, 4)])
status, report = run(base, patch, "--output", output)
check("P10 exit status and kind", status == 3 and report.get("kind") == "structural", repr((status, report)))
check("P10 the flag", any(problem.startswith("block_touched_ratio 0.800") and "exceeds 0.6" in problem for problem in report.get("problems", [])), repr(report))
check("P10 no output", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
check("P10 the base is byte-identical", read(base) == FIVE.encode("utf-8"))

# P11: deleting the block that holds a \section heading.
sections = "\\section{A}\n\nPara 1.\n\n\\section{B}\n\nPara 2.\n\nPara 3.\n"
base, manifest = prepare("p11", sections)
output = os.path.join(scratch, "p11.out.tex")
patch = patch_for("p11", manifest, [op(manifest, 3, "delete_block")])
status, report = run(base, patch, "--output", output)
check("P11 exit status and kind", status == 3 and report.get("kind") == "structural", repr((status, report)))
check("P11 the flag", any("section count changes from 2 to 1" in problem for problem in report.get("problems", [])), repr(report))
check("P11 no output", not os.path.exists(output) and not os.path.exists(output + ".apply-report.json"))
check("P11 the base is byte-identical", read(base) == sections.encode("utf-8"))

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: apply_tex_patch.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only"
