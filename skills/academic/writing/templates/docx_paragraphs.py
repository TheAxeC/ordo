#!/usr/bin/env python3
"""Print the text of each paragraph of a .docx file, numbered.

Usage: docx_paragraphs.py <file.docx>

Reads, from the .docx zip:

- word/document.xml, which must be present.
- word/footnotes.xml and word/endnotes.xml, when present.

Headers, footers and word/comments.xml are not read.

Every w:p of each part is read in document order, those inside table cells and content controls included. A paragraph's text is the text of every w:t it holds, in order, those inside w:ins, w:moveTo, w:hyperlink, w:sdt and w:smartTag included. Not part of the text:

- w:delText and w:instrText, which no w:t holds.
- Every w:t inside w:moveFrom.
- The mc:Fallback copy of content written under both mc:Choice and mc:Fallback.

A w:tab or w:br inside a w:r becomes one space. A tab-stop definition (w:tab inside w:pPr) adds nothing.

A w:p inside a text box of another paragraph is printed once, as its own paragraph right after the paragraph that holds the box, and its text is not part of the outer paragraph's text.

A paragraph whose text is empty or only spaces is not printed and takes no number.

Prints each other paragraph on one line as "<n>: <text>" for word/document.xml, "<n> [word/footnotes.xml]: <text>" for the footnotes and "<n> [word/endnotes.xml]: <text>" for the endnotes. <n> counts the printed paragraphs from 1, across the three parts in the order above. The text is printed as UTF-8, whatever the locale.

Errors, each printed as one line on standard error:

- "usage: docx_paragraphs.py <file.docx>", for no argument or more than one.
- "error: <file>: <reason>", for a file that cannot be opened (the reason is the operating system's), a file that is not a zip, a zip without word/document.xml, and a part that is not well-formed XML.

Exit status: 0 when every part was printed, 1 on an "error:" line, 2 on the usage line.
"""

import sys
import xml.etree.ElementTree as ET
import zipfile

W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"
MC = "{http://schemas.openxmlformats.org/markup-compatibility/2006}"

PARAGRAPH = W + "p"
RUN = W + "r"
TEXT = W + "t"
SPACE_TAGS = (W + "tab", W + "br")
DROPPED = (MC + "Fallback", W + "moveFrom")

PARTS = ("word/document.xml", "word/footnotes.xml", "word/endnotes.xml")


class DocxError(Exception):
    pass


def paragraph_text(paragraph):
    """The text of a w:p, and the w:p elements nested in it (text boxes)."""
    pieces = []
    nested = []
    collect(paragraph, pieces, nested)
    return "".join(pieces), nested


def collect(element, pieces, nested):
    for child in element:
        if child.tag in DROPPED:
            continue
        if child.tag == PARAGRAPH:
            nested.append(child)
        elif child.tag == TEXT:
            pieces.append(child.text or "")
        elif child.tag in SPACE_TAGS and element.tag == RUN:
            pieces.append(" ")
        else:
            collect(child, pieces, nested)


def paragraphs_in(element):
    """The text of each w:p under element in document order, a nested w:p right after its holder."""
    for child in element:
        if child.tag in DROPPED:
            continue
        if child.tag == PARAGRAPH:
            yield from with_nested(child)
        else:
            yield from paragraphs_in(child)


def with_nested(paragraph):
    text, nested = paragraph_text(paragraph)
    yield text
    for inner in nested:
        yield from with_nested(inner)


def read_part(archive, name):
    try:
        return ET.fromstring(archive.read(name))
    except ET.ParseError as problem:
        raise DocxError(f"{name}: not well-formed XML ({problem})")


def numbered_paragraphs(path):
    """The lines to print, "<n>: <text>" with the part in square brackets outside word/document.xml."""
    try:
        with zipfile.ZipFile(path) as archive:
            names = archive.namelist()
            if PARTS[0] not in names:
                raise DocxError(f"no {PARTS[0]}")
            roots = [(name, read_part(archive, name)) for name in PARTS if name in names]
    except OSError as problem:
        raise DocxError(problem.strerror or str(problem))
    except zipfile.BadZipFile:
        raise DocxError("not a zip file")
    lines = []
    for name, root in roots:
        label = "" if name == PARTS[0] else f" [{name}]"
        for text in paragraphs_in(root):
            if text.strip(" ") != "":
                lines.append(f"{len(lines) + 1}{label}: {text}")
    return lines


def main(argv):
    if len(argv) != 2:
        print("usage: docx_paragraphs.py <file.docx>", file=sys.stderr)
        return 2
    try:
        lines = numbered_paragraphs(argv[1])
    except DocxError as problem:
        print(f"error: {argv[1]}: {problem}", file=sys.stderr)
        return 1
    sys.stdout.reconfigure(encoding="utf-8")
    for line in lines:
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
