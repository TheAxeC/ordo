#!/bin/sh
# Offline proof of reference_docx.py on scratch files: the defaults it writes into the styles and the section properties of pandoc's reference document, each profile field overriding its default, a font name with XML special characters written as its value, every other part of the document byte for byte as pandoc wrote it, the refusal of a file that is not a .docx and of a value outside a field's form, and a conversion by pandoc with the written document as its --reference-doc. Each case is kept because a wrong style, a changed part or a document pandoc cannot use puts a wrong layout, or none, into a DOCX the user submits. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/reference_docx.py" ]; then
    echo "FAIL: $here/reference_docx.py does not exist"
    exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
    echo "FAIL: pandoc is not on the PATH"
    exit 1
fi

scratch=$(mktemp -d "${TMPDIR:-/tmp}/reference-docx-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

pandoc --print-default-data-file reference.docx > "$scratch/base.docx" || {
    echo "FAIL: pandoc did not print its reference document"
    exit 1
}

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import os
import re
import subprocess
import sys
import zipfile

script = os.path.join(sys.argv[1], "reference_docx.py")
scratch = sys.argv[2]
base_path = os.path.join(scratch, "base.docx")
failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def run(*args):
    return subprocess.run([sys.executable, "-B", "-I", script, *args], capture_output=True, text=True)


def parts(path):
    with zipfile.ZipFile(path) as archive:
        return {name: archive.read(name) for name in archive.namelist()}


def block(styles, style_id):
    found = re.search(r'<w:style [^>]*w:styleId="%s".*?</w:style>' % style_id, styles, re.S)
    return found.group(0) if found else ""


def style_blocks(styles):
    return {m.group(1): m.group(0) for m in re.finditer(r'<w:style [^>]*w:styleId="([^"]+)".*?</w:style>', styles, re.S)}


base = parts(base_path)
base_styles = base["word/styles.xml"].decode("utf-8")
base_document = base["word/document.xml"].decode("utf-8")

# T1 the defaults
default_path = os.path.join(scratch, "default.docx")
result = run(default_path)
check("T1 the script exits 0 and prints the file it wrote", result.returncode == 0 and "wrote" in result.stdout and default_path in result.stdout, result.stdout + result.stderr)
out = parts(default_path)
styles = out["word/styles.xml"].decode("utf-8")
document = out["word/document.xml"].decode("utf-8")
defaults = re.search(r"<w:docDefaults>.*?</w:docDefaults>", styles, re.S).group(0)
check("T1 the body font is Times New Roman", 'w:ascii="Times New Roman"' in defaults and 'w:hAnsi="Times New Roman"' in defaults, defaults)
check("T1 the body size is 12 pt", '<w:sz w:val="24"' in defaults, defaults)
check("T1 the line spacing is double", 'w:line="480"' in defaults and 'w:lineRule="auto"' in defaults, defaults)
for style_id, size in (("Heading1", "32"), ("Heading2", "28"), ("Heading3", "24")):
    text = block(styles, style_id)
    check(f"T1 {style_id} is {int(size) // 2} pt, bold, in Times New Roman", f'<w:sz w:val="{size}"' in text and "<w:b " in text and 'w:ascii="Times New Roman"' in text, text)
check("T1 Block Text is indented 0.5 inch and italic", 'w:left="720"' in block(styles, "BlockText") and "<w:i " in block(styles, "BlockText"), block(styles, "BlockText"))
check("T1 Bibliography has a hanging indent of 0.5 inch", 'w:hanging="720"' in block(styles, "Bibliography") and 'w:left="720"' in block(styles, "Bibliography"), block(styles, "Bibliography"))
table = block(styles, "Table")
check("T1 the table style is a full grid", all(f"<w:{side} " in table.split("<w:tblBorders>")[-1] for side in ("top", "left", "bottom", "right", "insideH", "insideV")), table)
margin = re.search(r"<w:pgMar [^>]*/>", document)
check("T1 the margins are 2.54 cm on every side", bool(margin) and all(f'w:{side}="1440"' in margin.group(0) for side in ("top", "right", "bottom", "left")), document[-600:])
reference = re.search(r'<w:headerReference [^>]*r:id="([^"]+)"', document)
check("T1 the section holds a header reference", bool(reference), document[-600:])
header_names = [name for name in out if name.startswith("word/header")]
check("T1 one header part is added", len(header_names) == 1, str(header_names))
if header_names:
    header = out[header_names[0]].decode("utf-8")
    check("T1 the header holds a PAGE field, aligned right", " PAGE " in header and 'w:jc w:val="right"' in header, header)
    relations = out["word/_rels/document.xml.rels"].decode("utf-8")
    check("T1 the relationships name the header part", reference is not None and f'Id="{reference.group(1)}"' in relations and os.path.basename(header_names[0]) in relations, relations)
    types = out["[Content_Types].xml"].decode("utf-8")
    check("T1 the content types name the header part", "/" + header_names[0] in types and "wordprocessingml.header+xml" in types, types)

# T2 the rest of the document byte for byte
check("T2 the parts are those of the base and the header", sorted(out) == sorted(list(base) + header_names), str(sorted(set(out) ^ set(base))))
changed = {"word/styles.xml", "word/document.xml", "word/_rels/document.xml.rels", "[Content_Types].xml"}
for name in base:
    if name not in changed:
        check(f"T2 {name} is byte for byte as pandoc wrote it", out[name] == base[name])
base_blocks = style_blocks(base_styles)
out_blocks = style_blocks(styles)
check("T2 the styles stand in the same order", list(base_blocks) == list(out_blocks))
touched = {"Heading1", "Heading2", "Heading3", "BlockText", "Bibliography", "Table"}
for style_id, text in base_blocks.items():
    if out_blocks.get(style_id) != text:
        check(f"T2 the style {style_id} may change", style_id in touched or re.search(r"<w:rFonts[^>]*Theme", text) is not None, style_id)
    elif style_id in touched:
        check(f"T2 the style {style_id} is changed", False)
strip = lambda text: re.sub(r"<w:style .*?</w:style>", "", re.sub(r"<w:docDefaults>.*?</w:docDefaults>", "", text, flags=re.S), flags=re.S)
check("T2 styles.xml outside the document defaults and the style blocks is as pandoc wrote it", strip(styles) == strip(base_styles))
sect = lambda text: re.sub(r"<w:sectPr>.*?</w:sectPr>", "", text, flags=re.S)
check("T2 document.xml outside its section properties is as pandoc wrote it", sect(document) == sect(base_document))
check("T2 the section keeps its footnote numbering", '<w:numRestart w:val="eachSect"' in document)
rels_base = base["word/_rels/document.xml.rels"].decode("utf-8")
check("T2 the relationships differ only by the header", re.sub(r"<Relationship [^>]*header[^>]*/>", "", out["word/_rels/document.xml.rels"].decode("utf-8")) == rels_base)
types_base = base["[Content_Types].xml"].decode("utf-8")
check("T2 the content types differ only by the header", re.sub(r"<Override [^>]*header[^>]*/>", "", out["[Content_Types].xml"].decode("utf-8")) == types_base)

# T3 each profile field overrides its default
profile_path = os.path.join(scratch, "profile.docx")
result = run(profile_path, "--body-font", "Arial", "--body-size", "11", "--line-spacing", "1.5", "--margins", "2", "--table-borders", "three-line", "--caption-font", "Georgia", "--caption-size", "10", "--caption-align", "center")
check("T3 the script exits 0", result.returncode == 0, result.stdout + result.stderr)
out = parts(profile_path)
styles = out["word/styles.xml"].decode("utf-8")
document = out["word/document.xml"].decode("utf-8")
defaults = re.search(r"<w:docDefaults>.*?</w:docDefaults>", styles, re.S).group(0)
check("T3 the body font is Arial", 'w:ascii="Arial"' in defaults and "Times New Roman" not in styles, defaults)
check("T3 the body size is 11 pt", '<w:sz w:val="22"' in defaults, defaults)
check("T3 the line spacing is 1.5", 'w:line="360"' in defaults and 'w:lineRule="auto"' in defaults, defaults)
check("T3 the headings take the body font and keep their sizes", 'w:ascii="Arial"' in block(styles, "Heading1") and '<w:sz w:val="32"' in block(styles, "Heading1"), block(styles, "Heading1"))
margin = re.search(r"<w:pgMar [^>]*/>", document).group(0)
check("T3 the margins are 2 cm on every side", all(f'w:{side}="1134"' in margin for side in ("top", "right", "bottom", "left")), margin)
table = block(styles, "Table")
check("T3 the table style has a top and a bottom rule and no vertical rule", "<w:top " in table and "<w:bottom " in table and "insideV" not in table and "<w:left " not in table.split("<w:tblBorders>")[-1].split("</w:tblBorders>")[0], table)
caption = block(styles, "Caption")
check("T3 the caption takes its font, size and alignment", 'w:ascii="Georgia"' in caption and '<w:sz w:val="20"' in caption and 'w:jc w:val="center"' in caption, caption)
check("T3 the output names the fields it declared", "declared" in result.stdout, result.stdout)

# T3b a font name with XML special characters reaches the styles as its value
special = 'Garamond & "Sons" <Pro>'
special_path = os.path.join(scratch, "special.docx")
result = run(special_path, "--body-font", special, "--caption-font", special)
check("T3b the script exits 0", result.returncode == 0, result.stdout + result.stderr)
if result.returncode == 0:
    import xml.etree.ElementTree as ElementTree
    raw = parts(special_path)["word/styles.xml"]
    try:
        tree = ElementTree.fromstring(raw)
    except ElementTree.ParseError as error:
        tree = None
        check("T3b styles.xml parses as XML", False, str(error))
    if tree is not None:
        w = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"
        names = {element.get(w + "ascii") for element in tree.iter(w + "rFonts")}
        fixed = {element.get(w + "ascii") for element in ElementTree.fromstring(base["word/styles.xml"]).iter(w + "rFonts")} - {None}
        check("T3b the font elements name the font as given, beside the fixed fonts of the base", special in names and names <= fixed | {special}, str(names))

# T4 a fixed line spacing, four margins and no table rule
fixed_path = os.path.join(scratch, "fixed.docx")
result = run(fixed_path, "--line-spacing", "18pt", "--margins", "3,2,3,2", "--table-borders", "none", "--caption-placement", "above")
check("T4 the script exits 0", result.returncode == 0, result.stdout + result.stderr)
out = parts(fixed_path)
styles = out["word/styles.xml"].decode("utf-8")
document = out["word/document.xml"].decode("utf-8")
defaults = re.search(r"<w:docDefaults>.*?</w:docDefaults>", styles, re.S).group(0)
check("T4 a spacing of 18 pt is exact", 'w:line="360"' in defaults and 'w:lineRule="exact"' in defaults, defaults)
margin = re.search(r"<w:pgMar [^>]*/>", document).group(0)
check("T4 the margins are top 3, right 2, bottom 3 and left 2 cm", 'w:top="1701"' in margin and 'w:right="1134"' in margin and 'w:bottom="1701"' in margin and 'w:left="1134"' in margin, margin)
table = block(styles, "Table")
check("T4 the table style has no rule", "<w:tblBorders>" not in table and 'w:bottom w:val="single"' not in table, table)
check("T4 the caption placement is listed as not honoured", "not honoured: caption placement" in result.stdout, result.stdout)

# T5 refusals
text_path = os.path.join(scratch, "not-a-docx.docx")
with open(text_path, "w", encoding="utf-8") as handle:
    handle.write("this is plain text\n")
result = run(os.path.join(scratch, "refused.docx"), "--base", text_path)
check("T5 a file that is not a .docx exits 2 with a message", result.returncode == 2 and "cannot read" in result.stderr, result.stdout + result.stderr)
check("T5 no output is written for it", not os.path.exists(os.path.join(scratch, "refused.docx")))
result = run(os.path.join(scratch, "refused.docx"), "--base", os.path.join(scratch, "missing.docx"))
check("T5 a missing file exits 2 with a message", result.returncode == 2 and "cannot read" in result.stderr, result.stdout + result.stderr)
result = run(os.path.join(scratch, "refused.docx"), "--line-spacing", "1.3")
check("T5 a line spacing outside the form exits 2 and names the allowed values", result.returncode == 2 and "single, 1.5, double" in result.stderr, result.stdout + result.stderr)
result = run(os.path.join(scratch, "refused.docx"), "--table-borders", "dotted")
check("T5 a table border outside the form exits 2", result.returncode == 2 and "three-line, full-grid, none" in result.stderr, result.stdout + result.stderr)
result = run()
check("T5 a call with no output path exits 2 and prints the usage", result.returncode == 2 and "usage" in result.stderr.lower(), result.stdout + result.stderr)
before = parts(base_path)
result = run(base_path, "--base", base_path)
check("T5 an output equal to the base is refused and leaves the base as it was", result.returncode == 2 and "same file" in result.stderr and parts(base_path) == before, result.stdout + result.stderr)

# T6 pandoc uses the written document as its reference document
source = os.path.join(scratch, "source.md")
with open(source, "w", encoding="utf-8") as handle:
    handle.write("# Heading\n\nBody text.\n")
converted = os.path.join(scratch, "converted.docx")
result = subprocess.run(["pandoc", source, "-s", "--reference-doc", default_path, "-o", converted], capture_output=True, text=True)
check("T6 pandoc converts with the written document as its reference document", result.returncode == 0, result.stderr)
if result.returncode == 0:
    converted_parts = parts(converted)
    check("T6 the converted document carries the font", b"Times New Roman" in converted_parts["word/styles.xml"])
    check("T6 the converted document carries a header with the page number", any(name.startswith("word/header") and b" PAGE " in data for name, data in converted_parts.items()), str(sorted(converted_parts)))
    check("T6 the converted document carries the margins", b'w:top="1440"' in converted_parts["word/document.xml"])

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: reference_docx.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: reference_docx.py writes the layout defaults into the styles and the section properties, lets each profile field override its default, escapes a font name, leaves every other part as pandoc wrote it, refuses a file that is not a .docx and a value outside a field's form, and writes a document pandoc takes as its reference document"
