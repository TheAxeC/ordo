#!/usr/bin/env python3
"""Print the text of each paragraph of a Word document, numbered, one line per paragraph.

Usage: docx_paragraphs.py <file.docx>

Input: the zip archive <file.docx>. The parts read are word/document.xml, then each of these that exists, in this order: word/footnotes.xml, word/endnotes.xml, each word/header<k>.xml by <k>, each word/footer<k>.xml by <k>. word/comments.xml and every other part are not read.

Output, on standard output in UTF-8 whatever the locale:
    <n>: <text>      one line per paragraph, numbered from 1 across all the parts; an empty paragraph is "<n>:"
    [<part path>]    opens each part after the body, such as [word/footnotes.xml]; the numbering goes on from the part before

Within a part the paragraphs come in document order. A paragraph of a table cell is counted in its place, each paragraph of a cell on its own line, and a table nested in a cell prints where it stands in the cell. The separator and continuation-separator notes of the footnotes and endnotes are left out.

A paragraph of a text box (w:txbxContent) prints as its own numbered line, right after the line of the paragraph that holds the text box, in document order, and its text is not in that paragraph's line. Of each mc:AlternateContent the first mc:Choice is read and mc:Fallback is never read, so a text box that both hold prints once; an mc:AlternateContent with no mc:Choice ends with Python's traceback and exit status 1.

The text of a paragraph keeps every character as the document has it, from these elements of its runs:
    w:t              kept, including inside w:hyperlink, a run-level content control (w:sdt) and a tracked insertion (w:ins)
    w:delText        dropped, so tracked deletions print nothing
    w:tab, w:br, w:cr    each prints one space
    w:instrText and the code part of a field    dropped; the result part of a field is kept

A field runs from a w:fldChar of type begin to its end, and its code part runs from the begin to its separate. A stack of fields is kept across paragraphs, so a field nested in a code part prints nothing and each paragraph of a result that runs over several paragraphs prints its own text. The stack starts empty in each part. A w:fldChar of type separate or end with no field begun before it ends the run with Python's traceback and exit status 1.

Errors, one line each on standard error, with exit status 1:
    error: <file.docx> is not a zip file
    error: <file.docx> has no word/document.xml
Any other failure to read the file or a part, such as a file that does not exist or a part that is not well-formed XML, ends with Python's traceback and exit status 1.

Exit status: 0 when the text was printed; 1 for the errors above; 2 for a usage error, which prints the usage line on standard error and nothing on standard output.
"""
import re
import sys
import xml.etree.ElementTree as ET
import zipfile

USAGE = "Usage: docx_paragraphs.py <file.docx>"
W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"
MC = "{http://schemas.openxmlformats.org/markup-compatibility/2006}"
SEPARATOR_NOTES = ("separator", "continuationSeparator")
NOTE_TAGS = (W + "footnote", W + "endnote")
SPACE_TAGS = (W + "tab", W + "br", W + "cr")
BODY = "word/document.xml"
NOTE_PARTS = ("word/footnotes.xml", "word/endnotes.xml")


def part_names(names):
    """The parts after the body that exist, in the order they are printed."""
    notes = [name for name in NOTE_PARTS if name in names]
    headers = sorted((n for n in names if re.fullmatch(r"word/header\d+\.xml", n)), key=part_number)
    footers = sorted((n for n in names if re.fullmatch(r"word/footer\d+\.xml", n)), key=part_number)
    return notes + headers + footers


def part_number(name):
    """The number <k> of word/header<k>.xml or word/footer<k>.xml."""
    return int(re.search(r"(\d+)\.xml$", name).group(1))


def first_choice(alternate):
    """The first mc:Choice of an mc:AlternateContent."""
    return next(child for child in alternate if child.tag == MC + "Choice")


def paragraphs(element):
    """The w:p elements under element in document order, without the separator notes and without mc:Fallback."""
    for child in element:
        if child.tag == W + "p":
            yield child
        elif child.tag in NOTE_TAGS and child.get(W + "type") in SEPARATOR_NOTES:
            continue
        elif child.tag == MC + "AlternateContent":
            yield from paragraphs(first_choice(child))
        else:
            yield from paragraphs(child)


def paragraph_text(paragraph, open_fields):
    """The text of one paragraph and the w:txbxContent elements it holds, in document order.

    open_fields is the stack of fields begun and not yet ended. An entry of the stack is True while the field is in its code part and False once its result begins.
    """
    pieces = []
    boxes = []

    def visit(element):
        for child in element:
            if child.tag == W + "pPr":
                continue
            if child.tag == W + "txbxContent":
                boxes.append(child)
            elif child.tag == MC + "AlternateContent":
                visit(first_choice(child))
            elif child.tag == W + "fldChar":
                kind = child.get(W + "fldCharType")
                if kind == "begin":
                    open_fields.append(True)
                elif kind == "separate":
                    open_fields[-1] = False
                elif kind == "end":
                    open_fields.pop()
            elif child.tag == W + "t":
                if not any(open_fields):
                    pieces.append(child.text or "")
            elif child.tag in SPACE_TAGS:
                if not any(open_fields):
                    pieces.append(" ")
            else:
                visit(child)

    visit(paragraph)
    return "".join(pieces), boxes


def part_lines(root, first_number):
    """The numbered lines of one part, from first_number on."""
    open_fields = []
    lines = []

    def add_paragraph(paragraph):
        text, boxes = paragraph_text(paragraph, open_fields)
        number = first_number + len(lines)
        lines.append(f"{number}: {text}" if text else f"{number}:")
        for box in boxes:
            for inner in paragraphs(box):
                add_paragraph(inner)

    for paragraph in paragraphs(root):
        add_paragraph(paragraph)
    return lines


def main(argv):
    if len(argv) != 2:
        print(USAGE, file=sys.stderr)
        return 2
    path = argv[1]
    try:
        archive = zipfile.ZipFile(path)
    except zipfile.BadZipFile:
        print(f"error: {path} is not a zip file", file=sys.stderr)
        return 1
    with archive:
        names = set(archive.namelist())
        if BODY not in names:
            print(f"error: {path} has no {BODY}", file=sys.stderr)
            return 1
        output = part_lines(ET.fromstring(archive.read(BODY)), 1)
        count = len(output)
        for name in part_names(names):
            lines = part_lines(ET.fromstring(archive.read(name)), count + 1)
            count += len(lines)
            output += [f"[{name}]"] + lines
    if output:
        sys.stdout.buffer.write(("\n".join(output) + "\n").encode("utf-8"))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
