#!/usr/bin/env python3
"""Write a reference .docx with the DOCX layout of academic-paper, for pandoc's --reference-doc.

Usage: reference_docx.py <output.docx> [--base <document.docx>] [--body-font <name>] [--body-size <pt>]
       [--caption-font <name>] [--caption-size <pt>] [--caption-align left|center|right]
       [--caption-placement above|below] [--line-spacing single|1.5|double|<n>pt]
       [--margins <cm> | <top>,<right>,<bottom>,<left>] [--table-borders three-line|full-grid|none]

The base document is pandoc's default reference document (`pandoc --print-default-data-file reference.docx`) unless --base names another .docx. The script writes these defaults into it:

- Body: Times New Roman 12 pt, double line spacing. The font replaces every theme font of the styles, so the headings and the title take it too.
- Heading 1, 2 and 3: 16, 14 and 12 pt, bold.
- Block Text: indented 0.5 inch, italic. Bibliography: hanging indent of 0.5 inch.
- Table: a full grid.
- Page: margins of 2.54 cm on every side, and the page number at the top right, in a header part it adds.

Each option is a field of the format profile and overrides its default. A caption's placement is fixed by pandoc (a table's caption above, a figure's below), so --caption-placement is accepted and printed as not honoured. Nothing else of the document changes: every part but the styles, the document body's section properties, the relationships and the content types is copied byte for byte, and in the styles only the blocks named above change.

Reads: the base document. Writes: the output document. Prints: one line "wrote <output>", then one line for each field with its value and whether it is the default or declared, and a line "not honoured: <field> (<reason>)" for a field a reference document cannot carry.

Runs: pandoc, to print its default reference document, when --base is not given.

Errors, each printed on standard error with exit status 2: a call without an output path (the usage line is printed), an unknown option or a missing value, a value outside its field's form, "cannot read pandoc's default reference document: pandoc is missing or failed" when --base is not given, a base that is missing, is not a .docx or lacks the styles or the section properties, an output that is the base file, and "cannot write <output>: <reason>" when the output cannot be written. A font name is written into the styles as an escaped XML attribute value. Exit status 0 otherwise.
"""

from __future__ import annotations

import io
import os
import re
import shutil
import subprocess
import sys
import zipfile
from xml.sax.saxutils import quoteattr

USAGE = (
    "usage: reference_docx.py <output.docx> [--base <document.docx>] [--body-font <name>] [--body-size <pt>] "
    "[--caption-font <name>] [--caption-size <pt>] [--caption-align left|center|right] "
    "[--caption-placement above|below] [--line-spacing single|1.5|double|<n>pt] "
    "[--margins <cm>|<top>,<right>,<bottom>,<left>] [--table-borders three-line|full-grid|none]"
)
OPTIONS = (
    "base",
    "body-font",
    "body-size",
    "caption-font",
    "caption-size",
    "caption-align",
    "caption-placement",
    "line-spacing",
    "margins",
    "table-borders",
)
DEFAULT_FONT = "Times New Roman"
DEFAULT_SIZE = "12"
HEADING_SIZES = {"Heading1": 16, "Heading2": 14, "Heading3": 12}
HEADER_TYPE = (
    "application/vnd.openxmlformats-officedocument.wordprocessingml.header+xml"
)
HEADER_RELATION = (
    "http://schemas.openxmlformats.org/officeDocument/2006/relationships/header"
)
HEADER_XML = (
    '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n'
    '<w:hdr xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" '
    'xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'
    '<w:p><w:pPr><w:jc w:val="right" /></w:pPr>'
    '<w:r><w:fldChar w:fldCharType="begin" /></w:r>'
    '<w:r><w:instrText xml:space="preserve"> PAGE </w:instrText></w:r>'
    '<w:r><w:fldChar w:fldCharType="separate" /></w:r>'
    "<w:r><w:t>1</w:t></w:r>"
    '<w:r><w:fldChar w:fldCharType="end" /></w:r></w:p></w:hdr>\n'
)


def fail(message: str) -> None:
    print(f"reference_docx.py: error: {message}", file=sys.stderr)
    sys.exit(2)


def parse(argv: list[str]) -> tuple[str, dict[str, str]]:
    if not argv or argv[0].startswith("--"):
        print(USAGE, file=sys.stderr)
        sys.exit(2)
    output = argv[0]
    values: dict[str, str] = {}
    rest = argv[1:]
    index = 0
    while index < len(rest):
        name = rest[index]
        if not name.startswith("--") or name[2:] not in OPTIONS:
            fail(f"unknown option {name!r}; {USAGE}")
        if index + 1 >= len(rest):
            fail(f"{name} needs a value")
        values[name[2:]] = rest[index + 1]
        index += 2
    return output, values


def points(value: str, field: str) -> float:
    try:
        number = float(value)
    except ValueError:
        fail(f"{field} {value!r} is not a number of points")
    if number <= 0 or number * 2 != int(number * 2):
        fail(f"{field} {value!r} must be a positive number of points in steps of 0.5")
    return number


def spacing(value: str) -> tuple[int, str]:
    if value == "single":
        return 240, "auto"
    if value == "1.5":
        return 360, "auto"
    if value == "double":
        return 480, "auto"
    found = re.fullmatch(r"([0-9]+(?:\.[0-9]+)?)pt", value)
    if found and float(found.group(1)) > 0:
        return round(float(found.group(1)) * 20), "exact"
    fail(
        f"--line-spacing {value!r} is outside the form: single, 1.5, double or a number of points such as 18pt"
    )
    raise AssertionError


def margins(value: str) -> list[int]:
    pieces = value.split(",")
    if len(pieces) not in (1, 4):
        fail(
            f"--margins {value!r} is outside the form: one number of centimetres, or top,right,bottom,left"
        )
    twips = []
    for piece in pieces:
        try:
            centimetres = float(piece)
        except ValueError:
            fail(
                f"--margins {value!r} holds {piece!r}, which is not a number of centimetres"
            )
        if centimetres <= 0:
            fail(f"--margins {value!r} holds {piece!r}, which is not positive")
        twips.append(round(centimetres / 2.54 * 1440))
    return twips * 4 if len(twips) == 1 else twips


def read_base(path: str | None) -> dict[str, tuple[zipfile.ZipInfo, bytes]]:
    if path is None:
        result = (
            subprocess.run(
                ["pandoc", "--print-default-data-file", "reference.docx"],
                capture_output=True,
                check=False,
            )
            if shutil.which("pandoc")
            else None
        )
        if result is None or result.returncode != 0:
            fail(
                "cannot read pandoc's default reference document: pandoc is missing or failed"
            )
        source: str | io.BytesIO = io.BytesIO(result.stdout)
        label = "pandoc's default reference document"
    else:
        source = path
        label = path
    try:
        with zipfile.ZipFile(source) as archive:
            return {
                info.filename: (info, archive.read(info.filename))
                for info in archive.infolist()
            }
    except (OSError, zipfile.BadZipFile) as error:
        fail(f"cannot read {label}: it is not a .docx ({error})")
    raise AssertionError


def style_block(styles: str, style_id: str) -> re.Match[str] | None:
    pattern = f'<w:style [^>]*w:styleId="{style_id}"[^>]*>.*?</w:style>'
    return re.search(pattern, styles, re.DOTALL)


def replace_style(styles: str, style_id: str, change) -> str:
    found = style_block(styles, style_id)
    if found is None:
        return styles
    return styles[: found.start()] + change(found.group(0)) + styles[found.end() :]


def fonts(name: str) -> str:
    value = quoteattr(name)
    return (
        f"<w:rFonts w:ascii={value} w:hAnsi={value} w:eastAsia={value} w:cs={value} />"
    )


def half_points(size: float) -> str:
    return str(int(size * 2))


def set_defaults(styles: str, font: str, size: float, line: tuple[int, str]) -> str:
    found = re.search(r"<w:docDefaults>.*?</w:docDefaults>", styles, re.DOTALL)
    if (
        found is None
        or "<w:rPrDefault>" not in found.group(0)
        or "<w:pPrDefault>" not in found.group(0)
    ):
        fail("cannot read the base document: its styles hold no document defaults")
    text = found.group(0)
    text = re.sub(r"<w:sz [^>]*/>", f'<w:sz w:val="{half_points(size)}" />', text)
    text = re.sub(r"<w:szCs [^>]*/>", f'<w:szCs w:val="{half_points(size)}" />', text)
    spacing_found = re.search(r"<w:spacing ([^>]*?)\s*/>", text)
    if spacing_found is None:
        text = text.replace(
            "<w:pPrDefault>\n      <w:pPr>",
            f'<w:pPrDefault>\n      <w:pPr>\n        <w:spacing w:line="{line[0]}" w:lineRule="{line[1]}" />',
            1,
        )
    else:
        kept = re.sub(r'\s*w:line(Rule)?="[^"]*"', "", spacing_found.group(1))
        new = f'<w:spacing {kept} w:line="{line[0]}" w:lineRule="{line[1]}" />'
        text = text[: spacing_found.start()] + new + text[spacing_found.end() :]
    return styles[: found.start()] + text + styles[found.end() :]


def set_theme_fonts(styles: str, font: str) -> str:
    pattern = r"<w:rFonts[^>]*Theme=[^>]*/>"
    element = fonts(font)
    return re.sub(pattern, lambda _: element, styles, flags=re.DOTALL)


def set_heading(block: str, size: int) -> str:
    block = re.sub(r"<w:sz [^>]*/>", f'<w:sz w:val="{size * 2}" />', block)
    block = re.sub(r"<w:szCs [^>]*/>", f'<w:szCs w:val="{size * 2}" />', block)
    if "<w:b " not in block and "<w:b/>" not in block:
        block = re.sub(r"(<w:rFonts[^>]*/>)", r"\1\n      <w:b />", block, count=1)
    return block


def set_block_text(block: str) -> str:
    block = re.sub(r'(<w:ind [^>]*?)w:left="[0-9]+"', r'\1w:left="720"', block)
    if "<w:rPr>" not in block:
        block = block.replace(
            "</w:pPr>", "</w:pPr>\n    <w:rPr>\n      <w:i />\n    </w:rPr>", 1
        )
    return block


def set_bibliography(block: str) -> str:
    return re.sub(
        r"<w:pPr\s*/>",
        '<w:pPr>\n      <w:ind w:left="720" w:hanging="720" />\n    </w:pPr>',
        block,
        count=1,
    )


def set_table(block: str, borders: str) -> str:
    sides = {
        "full-grid": ("top", "left", "bottom", "right", "insideH", "insideV"),
        "three-line": ("top", "bottom"),
        "none": (),
    }[borders]
    pattern = r"\s*<w:tblBorders>.*?</w:tblBorders>"
    block = re.sub(pattern, "", block, flags=re.DOTALL)
    if sides:
        rules = "".join(
            f'\n        <w:{side} w:val="single" w:sz="4" w:space="0" w:color="auto" />'
            for side in sides
        )
        element = f"\n      <w:tblBorders>{rules}\n      </w:tblBorders>"
        if "<w:tblInd " in block:
            block = re.sub(
                r"(<w:tblInd [^>]*/>)",
                lambda found: found.group(1) + element,
                block,
                count=1,
            )
        else:
            block = block.replace("<w:tblPr>", "<w:tblPr>" + element, 1)
    if borders == "none":
        block = block.replace('<w:bottom w:val="single"/>', '<w:bottom w:val="nil"/>')
    return block


def set_caption(
    block: str, font: str | None, size: float | None, align: str | None
) -> str:
    if font is not None or size is not None:
        if "<w:rPr>" not in block:
            block = block.replace("</w:style>", "<w:rPr>\n    </w:rPr>\n  </w:style>")
        inner = ""
        if font is not None:
            inner += "\n      " + fonts(font)
        block = block.replace("<w:rPr>", "<w:rPr>" + inner, 1)
        if size is not None:
            sizes = f'\n      <w:sz w:val="{half_points(size)}" />\n      <w:szCs w:val="{half_points(size)}" />'
            block = block.replace("</w:rPr>", sizes + "\n    </w:rPr>", 1)
    if align is not None:
        jc = f'\n      <w:jc w:val="{align}" />'
        if "<w:pPr>" in block:
            block = block.replace("</w:pPr>", jc + "\n    </w:pPr>", 1)
        else:
            block = block.replace(
                "<w:rPr>", f"<w:pPr>{jc}\n    </w:pPr>\n    <w:rPr>", 1
            )
    return block


def edit_styles(styles: str, values: dict[str, str]) -> str:
    font = values.get("body-font", DEFAULT_FONT)
    size = (
        points(values["body-size"], "--body-size")
        if "body-size" in values
        else float(DEFAULT_SIZE)
    )
    line = spacing(values.get("line-spacing", "double"))
    borders = values.get("table-borders", "full-grid")
    styles = set_defaults(styles, font, size, line)
    styles = set_theme_fonts(styles, font)
    for style_id, heading_size in HEADING_SIZES.items():
        styles = replace_style(
            styles,
            style_id,
            lambda block, heading_size=heading_size: set_heading(block, heading_size),
        )
    styles = replace_style(styles, "BlockText", set_block_text)
    styles = replace_style(styles, "Bibliography", set_bibliography)
    styles = replace_style(styles, "Table", lambda block: set_table(block, borders))
    caption_font = values.get("caption-font")
    caption_size = (
        points(values["caption-size"], "--caption-size")
        if "caption-size" in values
        else None
    )
    caption_align = values.get("caption-align")
    if (
        caption_font is not None
        or caption_size is not None
        or caption_align is not None
    ):
        styles = replace_style(
            styles,
            "Caption",
            lambda block: set_caption(block, caption_font, caption_size, caption_align),
        )
    return styles


def edit_document(document: str, margin_twips: list[int], relation_id: str) -> str:
    found = re.search(r"<w:sectPr(?:\s[^>]*)?>.*?</w:sectPr>", document, re.DOTALL)
    if found is None:
        fail("cannot read the base document: its body holds no section properties")
    section = found.group(0)
    margin = (
        f'<w:pgMar w:top="{margin_twips[0]}" w:right="{margin_twips[1]}" w:bottom="{margin_twips[2]}" '
        f'w:left="{margin_twips[3]}" w:header="720" w:footer="720" w:gutter="0" />'
    )
    section = re.sub(r"\s*<w:headerReference [^>]*/>", "", section)
    section = re.sub(r"\s*<w:pgMar [^>]*/>", "", section)
    opening = re.match(r"<w:sectPr(?:\s[^>]*)?>", section).group(0)
    section = section.replace(
        opening,
        opening
        + f'\n      <w:headerReference w:type="default" r:id="{relation_id}" />',
        1,
    )
    if "<w:pgSz " in section:
        section = re.sub(
            r"(<w:pgSz [^>]*/>)",
            lambda hit: hit.group(1) + "\n      " + margin,
            section,
            count=1,
        )
    elif "</w:footnotePr>" in section:
        section = section.replace(
            "</w:footnotePr>", "</w:footnotePr>\n      " + margin, 1
        )
    else:
        section = section.replace("</w:sectPr>", "  " + margin + "\n    </w:sectPr>", 1)
    return document[: found.start()] + section + document[found.end() :]


def unused(taken: set[str], pattern: str) -> str:
    number = 1
    while pattern % number in taken:
        number += 1
    return pattern % number


def main() -> None:
    output, values = parse(sys.argv[1:])
    margin_twips = margins(values.get("margins", "2.54"))
    if values.get("line-spacing") is not None:
        spacing(values["line-spacing"])
    if values.get("table-borders", "full-grid") not in (
        "three-line",
        "full-grid",
        "none",
    ):
        fail(
            f"--table-borders {values['table-borders']!r} is outside the form: three-line, full-grid, none"
        )
    if values.get("caption-align", "left") not in ("left", "center", "right"):
        fail(
            f"--caption-align {values['caption-align']!r} is outside the form: left, center, right"
        )
    if values.get("caption-placement", "above") not in ("above", "below"):
        fail(
            f"--caption-placement {values['caption-placement']!r} is outside the form: above, below"
        )
    base_path = values.get("base")
    if (
        base_path is not None
        and os.path.exists(output)
        and os.path.samefile(base_path, output)
    ):
        fail(f"the output {output!r} and the base are the same file")
    members = read_base(base_path)
    for name in (
        "word/styles.xml",
        "word/document.xml",
        "word/_rels/document.xml.rels",
        "[Content_Types].xml",
    ):
        if name not in members:
            fail(f"cannot read {base_path or 'the base document'}: it holds no {name}")
    names = set(members)
    header_name = unused(names, "word/header%d.xml")
    relations = members["word/_rels/document.xml.rels"][1].decode("utf-8")
    taken_ids = set(re.findall(r'Id="([^"]+)"', relations))
    relation_id = unused(taken_ids, "rIdPageNumber%d")
    styles = edit_styles(members["word/styles.xml"][1].decode("utf-8"), values)
    document = edit_document(
        members["word/document.xml"][1].decode("utf-8"), margin_twips, relation_id
    )
    new_relation = f'<Relationship Type="{HEADER_RELATION}" Id="{relation_id}" Target="{os.path.basename(header_name)}" />'
    relations = relations.replace(
        "</Relationships>", new_relation + "</Relationships>", 1
    )
    types = members["[Content_Types].xml"][1].decode("utf-8")
    types = types.replace(
        "</Types>",
        f'<Override PartName="/{header_name}" ContentType="{HEADER_TYPE}" /></Types>',
        1,
    )
    changed = {
        "word/styles.xml": styles,
        "word/document.xml": document,
        "word/_rels/document.xml.rels": relations,
        "[Content_Types].xml": types,
    }
    try:
        with zipfile.ZipFile(output, "w") as archive:
            for name, (info, data) in members.items():
                copy = zipfile.ZipInfo(name, info.date_time)
                copy.compress_type = info.compress_type
                copy.external_attr = info.external_attr
                archive.writestr(
                    copy, changed[name].encode("utf-8") if name in changed else data
                )
            header = zipfile.ZipInfo(
                header_name, members["word/styles.xml"][0].date_time
            )
            header.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(header, HEADER_XML.encode("utf-8"))
    except OSError as error:
        fail(f"cannot write {output}: {error}")
    print(f"wrote {output}")
    report(values, margin_twips)


def report(values: dict[str, str], margin_twips: list[int]) -> None:
    def line(label: str, key: str, default: str, unit: str = "") -> None:
        value = values.get(key)
        print(
            f"{label}: {value if value is not None else default}{unit} ({'declared' if value is not None else 'default'})"
        )

    line("body font", "body-font", DEFAULT_FONT)
    line("body size", "body-size", DEFAULT_SIZE, " pt")
    line("line spacing", "line-spacing", "double")
    line("margins", "margins", "2.54", " cm")
    line("table borders", "table-borders", "full-grid")
    line("caption font", "caption-font", "the body font")
    line("caption size", "caption-size", "the body size")
    line("caption alignment", "caption-align", "left")
    print("page number: top right (default)")
    if "caption-placement" in values:
        print(
            "not honoured: caption placement (pandoc puts a table's caption above it and a figure's below it, whatever the reference document says)"
        )


if __name__ == "__main__":
    main()
