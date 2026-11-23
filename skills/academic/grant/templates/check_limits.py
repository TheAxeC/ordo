#!/usr/bin/env python3
r"""Check the length of a grant application against the limits of its funder config.

Usage: check_limits.py <config> <pdf> <main.tex>

Reads:

- <config>, a funder config, as UTF-8: the table under "## Sections" (columns Heading, Required, Limit, Unit, Source) and, when the config has one, the table under "## Form fields" (columns Field, Limit, Unit, Source), each read as check_sections.py reads a table. A row with an empty Limit has no limit and prints no line.
- The LaTeX log beside <pdf>, the file of the same base name with the extension .log, only for a limit in pages of the row "(whole document)". The page count is the number in its last statement "Output written on ... (<n> pages" or "(1 page", read with every line break of the log removed, since TeX breaks a long log line. <pdf> itself is not read.
- <main.tex>, as UTF-8, and the files it brings in, read as check_sections.py reads them: comments dropped, each \input or \include replaced by its file's text, the body between \begin{document} and \end{document}.
- form-fields.md in the folder of <main.tex>, as UTF-8, only for a row of "Form fields": the text between the marker <!--F:<field>--> and the next <!--/F-->, <field> being the row's Field cell.

What is counted:

- For the row "(whole document)" with a limit in words or characters, the text of the body.
- For a section row with a limit in words or characters, the section's text: from the end of its \section heading to the next \section heading or the end of the body. The heading's own words are not counted, and the text under a \subsection, its title included, is.
- The counted text of the application is its LaTeX source after these steps. Comments are gone, and \% is a percent sign. A tikzpicture environment is removed whole. A command whose name starts with \cite, and \ref, \eqref, \autoref, \cref, \label, \includegraphics, \input, \include, \begin, \end, \bibliography and \bibliographystyle, is removed with the bracket and brace arguments that follow it directly. Of every other command the name is removed and the text of its arguments kept. \%, \&, \#, \$, \_, \{ and \} are their characters, \- and \/ are nothing, and every other backslash with one sign, ~ and an unescaped & are a space. Braces and square brackets are removed.
- Words are the pieces of that text between whitespace. Characters are the length of that text with each run of whitespace made one space and the ends trimmed.
- For a form field, the text between its markers with its ends trimmed: its words are the pieces between whitespace, and its characters are its length, a line break counting as a character.

Prints, on standard output, one line per row that has a limit, the Sections rows first, each in the config's order:

- "ok: <name>: <count> <unit> of <limit>": the count is at most the limit.
- "over: <name>: <count> <unit> of <limit>": the count is above the limit.
- "not checked: <name>: <reason>". The reasons: a section's limit in pages, which is read on the PDF; a section the .tex lacks; a form field's limit in pages; no form-fields.md beside the .tex; no markers for the field in form-fields.md.

<name> is the row's Heading or Field on one line, and <unit> is the row's Unit.

Errors, each one line "error: <what is wrong>" on standard error, with nothing on standard output: a wrong number of arguments, a config, a .tex, a brought-in file, a log or a form-fields.md that cannot be read, a config with no table under "## Sections", a table that lacks one of its columns, a Required cell that is neither yes nor no, a file that brings itself in, a Limit that is no whole number, a Unit that is none of pages, words and characters, and, for a limit in pages of the whole document, no log beside <pdf> or no page count in it.

Exit status: 0 when no line starts with "over:", 1 when one does, 2 for an error.
"""
from __future__ import annotations

import os
import re
import sys

# Importing check_sections.py from this script's folder would otherwise write a __pycache__ folder into the installed skill.
sys.dont_write_bytecode = True

from check_sections import (  # noqa: E402
    WHOLE_DOCUMENT,
    CheckError,
    closing_brace,
    config_table,
    document_body,
    one_line,
    read_text,
    same_heading,
    section_rows,
    sections,
)

FIELD_COLUMNS = ("Field", "Limit", "Unit", "Source")
UNITS = ("pages", "words", "characters")
REMOVED_WITH_ARGUMENTS = {
    "ref", "eqref", "autoref", "cref", "label", "includegraphics", "input", "include",
    "begin", "end", "bibliography", "bibliographystyle",
}
LITERAL_SIGNS = "%&#$_{}"
TIKZPICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.DOTALL)
COMMAND = re.compile(r"\\([A-Za-z]+)\*?")
PAGES = re.compile(r"Output written on .*?\((\d+) pages?[,)]")


def limit_of(row: dict[str, str], name: str) -> tuple[int, str] | None:
    """The limit and the unit of a row, or None for a row with no limit."""
    if not row["Limit"]:
        return None
    if not re.fullmatch(r"[0-9]+", row["Limit"]):
        raise CheckError(f"the Limit of the row {name} is no whole number: {one_line(row['Limit'])}")
    unit = row["Unit"].lower()
    if unit not in UNITS:
        raise CheckError(f"the Unit of the row {name} is none of pages, words and characters: {one_line(row['Unit'])}")
    return int(row["Limit"]), unit


def after_arguments(text: str, index: int) -> int:
    """The index after the bracket and brace groups that start at `index`, one directly after the other."""
    while index < len(text) and text[index] in "[{":
        if text[index] == "{":
            index = closing_brace(text, index + 1)
        else:
            close = text.find("]", index)
            if close == -1:
                break
            index = close + 1
    return index


def plain_text(source: str) -> str:
    """The counted text of a piece of LaTeX source, as the head comment defines it."""
    source = TIKZPICTURE.sub(" ", source)
    kept = []
    index = 0
    while index < len(source):
        char = source[index]
        if char == "\\":
            command = COMMAND.match(source, index)
            if command:
                index = command.end()
                if command.group(1).startswith("cite") or command.group(1) in REMOVED_WITH_ARGUMENTS:
                    index = after_arguments(source, index)
                    kept.append(" ")
                continue
            sign = source[index + 1:index + 2]
            if sign in LITERAL_SIGNS and sign:
                kept.append(sign)
            elif sign not in ("-", "/"):
                kept.append(" ")
            index += 2
            continue
        if char in "~&":
            kept.append(" ")
        elif char not in "{}[]":
            kept.append(char)
        index += 1
    return "".join(kept)


def count(text: str, unit: str) -> int:
    return len(text.split()) if unit == "words" else len(one_line(text))


def page_count(pdf: str) -> int:
    """The page count the LaTeX log beside the PDF states."""
    log = os.path.splitext(pdf)[0] + ".log"
    try:
        with open(log, encoding="latin-1") as handle:
            text = handle.read()
    except OSError as error:
        raise CheckError(f"the log {one_line(log)} cannot be read, and the page limit needs its page count: {one_line(str(error))}") from error
    found = PAGES.findall(text.replace("\r", "").replace("\n", ""))
    if not found:
        raise CheckError(f"the log {one_line(log)} states no page count")
    return int(found[-1])


def verdict(name: str, counted: int, unit: str, limit: int) -> str:
    return f"{'over' if counted > limit else 'ok'}: {name}: {counted} {unit} of {limit}"


def section_lines(rows: list[dict[str, str]], pdf: str, main_tex: str) -> list[str]:
    """One line per row of the Sections table that has a limit."""
    limits = []
    for row in rows:
        name = one_line(row["Heading"])
        limit = limit_of(row, name)
        if limit is not None:
            limits.append((row, name, limit[0], limit[1]))
    body = document_body(main_tex)
    headings = sections(body)
    lines = []
    for row, name, limit, unit in limits:
        whole = same_heading(row["Heading"]) == same_heading(WHOLE_DOCUMENT)
        if whole and unit == "pages":
            lines.append(verdict(name, page_count(pdf), unit, limit))
        elif whole:
            lines.append(verdict(name, count(plain_text(body), unit), unit, limit))
        elif unit == "pages":
            lines.append(f"not checked: {name}: a section's limit in pages is read on the PDF")
        else:
            places = [index for index, heading in enumerate(headings) if same_heading(heading[0]) == same_heading(row["Heading"])]
            if not places:
                lines.append(f"not checked: {name}: the .tex has no such section")
                continue
            start = headings[places[0]][2]
            end = headings[places[0] + 1][1] if places[0] + 1 < len(headings) else len(body)
            lines.append(verdict(name, count(plain_text(body[start:end]), unit), unit, limit))
    return lines


def field_lines(config_text: str, main_tex: str) -> list[str]:
    """One line per row of the Form fields table that has a limit."""
    rows = config_table(config_text, "Form fields", FIELD_COLUMNS) or []
    limits = []
    for row in rows:
        name = one_line(row["Field"])
        limit = limit_of(row, name)
        if limit is not None:
            limits.append((row, name, limit[0], limit[1]))
    if not limits:
        return []
    path = os.path.join(os.path.dirname(os.path.abspath(main_tex)), "form-fields.md")
    fields = read_text(path, "the file") if os.path.exists(path) else None
    lines = []
    for row, name, limit, unit in limits:
        if unit == "pages":
            lines.append(f"not checked: {name}: a form field's limit in pages cannot be counted")
            continue
        if fields is None:
            lines.append(f"not checked: {name}: no form-fields.md stands beside the .tex")
            continue
        opening = f"<!--F:{row['Field']}-->"
        start = fields.find(opening)
        end = fields.find("<!--/F-->", start + len(opening)) if start != -1 else -1
        if end == -1:
            lines.append(f"not checked: {name}: form-fields.md has no markers for it")
            continue
        text = fields[start + len(opening):end].strip()
        lines.append(verdict(name, len(text.split()) if unit == "words" else len(text), unit, limit))
    return lines


def main(arguments: list[str]) -> int:
    try:
        if len(arguments) != 3:
            raise CheckError("usage: check_limits.py <config> <pdf> <main.tex>")
        config, pdf, main_tex = arguments
        lines = section_lines(section_rows(config), pdf, main_tex)
        lines += field_lines(read_text(config, "the config"), main_tex)
    except CheckError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2
    for line in lines:
        print(line)
    return 1 if any(line.startswith("over: ") for line in lines) else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
