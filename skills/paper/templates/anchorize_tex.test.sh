#!/bin/sh
# Offline proof of anchorize_tex.py on scratch .tex files: a .tex of three paragraphs gives three blocks and is left byte-identical, a table with a blank line inside is one block, the paragraphs inside a document environment are separate blocks, and the manifest's blocks and the separators between them hold the whole file. Each case is kept because a wrong block span lets a patch overwrite text outside the block it names. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/anchorize_tex.py" ]; then
    echo "FAIL: $here/anchorize_tex.py does not exist"
    exit 1
fi

scratch=$(mktemp -d "${TMPDIR:-/tmp}/anchorize-tex-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import hashlib
import json
import os
import subprocess
import sys

script = os.path.join(sys.argv[1], "anchorize_tex.py")
scratch = sys.argv[2]
failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def write(name, text):
    path = os.path.join(scratch, name)
    with open(path, "w", encoding="utf-8", newline="") as handle:
        handle.write(text)
    return path


def read(path):
    with open(path, "rb") as handle:
        return handle.read()


def anchorize(name, text):
    """(exit status, standard output, the manifest, the .tex bytes before the run, the .tex bytes after it)."""
    path = write(name, text)
    before = read(path)
    done = subprocess.run([sys.executable, "-B", script, path], capture_output=True, text=True)
    manifest_path = path + ".block-manifest.json"
    manifest = None
    if os.path.exists(manifest_path):
        with open(manifest_path, encoding="utf-8") as handle:
            manifest = json.load(handle)
    return done.returncode, done.stdout, manifest, before, read(path)


def block_texts(text, manifest):
    return [text[block["char_start"]:block["char_end"]] for block in manifest["blocks"]]


# A1: three paragraphs separated by blank lines give three blocks, and the .tex is not changed.
paragraphs = "First paragraph, line one.\nline two.\n\nSecond paragraph.\n\nThird paragraph.\n"
status, stdout, manifest, before, after = anchorize("a1.tex", paragraphs)
check("A1 exit status", status == 0, repr(stdout))
check("A1 three blocks", manifest is not None and manifest["n_blocks"] == 3, repr(manifest))
check("A1 the blocks", manifest is not None and block_texts(paragraphs, manifest) == ["First paragraph, line one.\nline two.", "Second paragraph.", "Third paragraph."], repr(manifest))
check("A1 the .tex is byte-identical", before == after)
check("A1 the manifest sits beside the .tex", os.path.exists(os.path.join(scratch, "a1.tex.block-manifest.json")))

# A2: a table environment with a blank line between two paragraphs is one block.
table = "Intro paragraph.\n\n\\begin{table}\nRow one.\n\nRow two.\n\\end{table}\n\nClosing paragraph.\n"
status, stdout, manifest, before, after = anchorize("a2.tex", table)
check("A2 exit status", status == 0, repr(stdout))
check("A2 the environment is one block", manifest is not None and block_texts(table, manifest) == ["Intro paragraph.", "\\begin{table}\nRow one.\n\nRow two.\n\\end{table}", "Closing paragraph."], repr(manifest))

# A3: the paragraphs inside \begin{document} are separate blocks.
document = "\\documentclass{article}\n\n\\begin{document}\n\nParagraph one.\n\nParagraph two.\n\n\\end{document}\n"
status, stdout, manifest, before, after = anchorize("a3.tex", document)
check("A3 exit status", status == 0, repr(stdout))
check("A3 the paragraphs are separate blocks", manifest is not None and block_texts(document, manifest) == ["\\documentclass{article}", "\\begin{document}", "Paragraph one.", "Paragraph two.", "\\end{document}"], repr(manifest))

# A4: the blocks and the separators between them hold the whole file, and the manifest records the file's hash.
for name, text in (("a1.tex", paragraphs), ("a2.tex", table), ("a3.tex", document), ("a4.tex", "No final newline.\n\nLast paragraph")):
    status, stdout, manifest, before, after = anchorize(name, text)
    check("A4 exit status " + name, status == 0, repr(stdout))
    if manifest is None:
        continue
    cursor, rebuilt, outside = 0, [], []
    for block in manifest["blocks"]:
        gap = text[cursor:block["char_start"]]
        outside.append(gap)
        rebuilt += [gap, text[block["char_start"]:block["char_end"]]]
        cursor = block["char_end"]
    outside.append(text[cursor:])
    rebuilt.append(text[cursor:])
    check("A4 the spans rebuild the file " + name, "".join(rebuilt) == text)
    check("A4 only whitespace lies outside the blocks " + name, all(not gap.strip() for gap in outside), repr(outside))
    check("A4 the characters in blocks " + name, manifest["chars_in_blocks"] == sum(block["n_chars"] for block in manifest["blocks"]) and manifest["n_chars"] == len(text), repr(manifest))
    check("A4 the file's hash " + name, manifest["base_sha256"] == hashlib.sha256(text.encode("utf-8")).hexdigest())

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: anchorize_tex.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file"
