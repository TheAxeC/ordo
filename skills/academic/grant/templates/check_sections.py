#!/usr/bin/env python3
r"""Check the section headings of a grant application against its funder config.

Usage: check_sections.py <config> <main.tex>

Reads:

- <config>, a funder config, as UTF-8: the first table under its heading "## Sections", with the columns Heading, Required, Limit, Unit and Source in any order. A cell is trimmed, and a pipe inside a cell is written \|. The row whose Heading is "(whole document)" is left out.
- <main.tex>, as UTF-8, and each file it brings in with \input{...} or \include{...}, in document order. A path of those commands is read relative to the folder of <main.tex>, and .tex is added to a name without an extension. The text from an unescaped % to the end of its line is a comment and is dropped before anything else is read, so a command on a commented line is not followed. A percent sign after an odd number of backslashes, as in \%, starts no comment.

The headings of the application are the arguments of the \section{...} and \section*{...} commands between \begin{document} and \end{document}, or of the whole text when it has no \begin{document}. A \subsection or a deeper heading is no heading here. A heading of the config and a heading of the application are the same when they are equal after each run of whitespace is made one space and case is ignored.

Prints, on standard output, one line per row of the config, in the config's order:

- "ok: <heading>": the application holds the heading, in the config's order.
- "missing: <heading>": a required heading the application lacks.
- "out of order: <heading>": the application holds the heading at another place in the order than the config gives it. The headings printed so are the fewest that would have to move, and of two equal choices the headings earlier in the config are kept as ok.
- "absent, not required: <heading>": a heading that is not required and that the application lacks.

Then one line "not in the config: <heading>" for each heading of the application the config does not name, in document order, which is no failure. Each heading is printed on one line, a run of whitespace in it made one space.

Errors, each one line "error: <what is wrong>" on standard error, with nothing on standard output: a wrong number of arguments, a config or a .tex that cannot be read or is not UTF-8, a config with no table under "## Sections", a table that lacks one of the five columns, a Required cell that is neither yes nor no, a brought-in file that does not exist or cannot be read, and a file that brings itself in.

Exit status: 0 when no line starts with "missing:" or "out of order:", 1 when one does, 2 for an error.
"""
from __future__ import annotations

import os
import re
import sys

WHOLE_DOCUMENT = "(whole document)"
SECTION_COLUMNS = ("Heading", "Required", "Limit", "Unit", "Source")
BRING_IN = re.compile(r"\\(?:input|include)\s*\{([^{}]*)\}")
SECTION = re.compile(r"\\section\*?\s*(?:\[[^\]]*\]\s*)?\{")


class CheckError(Exception):
    """A condition that ends the run with one error line and exit status 2."""


def one_line(text: str) -> str:
    """The text with each run of whitespace made one space and its ends trimmed."""
    return " ".join(text.split())


def same_heading(text: str) -> str:
    """The form in which two headings are compared: one-line and without case."""
    return one_line(text).casefold()


def read_text(path: str, what: str) -> str:
    try:
        with open(path, encoding="utf-8") as handle:
            return handle.read()
    except (OSError, UnicodeDecodeError) as error:
        raise CheckError(f"{what} {one_line(path)} cannot be read: {one_line(str(error))}") from error


def split_row(line: str) -> list[str]:
    """The cells of one table line, trimmed, with \\| read as a pipe inside a cell."""
    inner = line.strip()
    if inner.startswith("|"):
        inner = inner[1:]
    if inner.endswith("|") and not inner.endswith("\\|"):
        inner = inner[:-1]
    return [cell.replace("\\|", "|").strip() for cell in re.split(r"(?<!\\)\|", inner)]


def config_table(config_text: str, heading: str, columns: tuple[str, ...]) -> list[dict[str, str]] | None:
    """The rows of the first table under "## <heading>", or None when the config has no such table.

    Each row maps the names of `columns` to its cells. A table that lacks one of the columns is an error.
    """
    lines = config_text.splitlines()
    start = None
    for index, line in enumerate(lines):
        if line.startswith("## ") and same_heading(line[3:]) == same_heading(heading):
            start = index + 1
            break
    if start is None:
        return None
    table: list[str] = []
    for line in lines[start:]:
        if line.startswith("## "):
            break
        if line.strip().startswith("|"):
            table.append(line)
        elif table:
            break
    if len(table) < 2 or not re.fullmatch(r"[|\s:-]+", table[1].strip()):
        return None
    header = [same_heading(cell) for cell in split_row(table[0])]
    places = {}
    for column in columns:
        if same_heading(column) not in header:
            raise CheckError(f'the table under "## {heading}" of the config lacks the column {column}')
        places[column] = header.index(same_heading(column))
    rows = []
    for line in table[2:]:
        cells = split_row(line)
        rows.append({column: cells[place] if place < len(cells) else "" for column, place in places.items()})
    return rows


def section_rows(config_path: str) -> list[dict[str, str]]:
    """The rows of the Sections table, each Required cell checked and written in lower case."""
    rows = config_table(read_text(config_path, "the config"), "Sections", SECTION_COLUMNS)
    if rows is None:
        raise CheckError('the config has no table under "## Sections"')
    for row in rows:
        row["Required"] = row["Required"].lower()
        if row["Required"] not in ("yes", "no"):
            raise CheckError(f'the Required cell of the row {one_line(row["Heading"])} is neither yes nor no')
    return rows


def without_comments(text: str) -> str:
    """The text with each comment dropped, from an unescaped % to the end of its line."""
    kept = []
    for line in text.split("\n"):
        cut = len(line)
        for match in re.finditer(r"(\\*)%", line):
            if len(match.group(1)) % 2 == 0:
                cut = match.end(1)
                break
        kept.append(line[:cut])
    return "\n".join(kept)


def expanded(path: str, folder: str, what: str, chain: tuple[str, ...] = ()) -> str:
    """The text of a .tex file without its comments, each brought-in file's text in place of its command."""
    real = os.path.realpath(path)
    if real in chain:
        raise CheckError(f"the file {one_line(path)} brings itself in")
    text = without_comments(read_text(path, what))

    def bring_in(match: re.Match[str]) -> str:
        name = match.group(1).strip()
        if not os.path.splitext(name)[1]:
            name += ".tex"
        return "\n" + expanded(os.path.join(folder, name), folder, "the brought-in file", chain + (real,)) + "\n"

    return BRING_IN.sub(bring_in, text)


def document_body(main_tex: str) -> str:
    """The text of the application between \\begin{document} and \\end{document}, or all of it without them."""
    text = expanded(main_tex, os.path.dirname(os.path.abspath(main_tex)), "the .tex")
    begin = text.find("\\begin{document}")
    if begin != -1:
        text = text[begin + len("\\begin{document}"):]
    end = text.find("\\end{document}")
    if end != -1:
        text = text[:end]
    return text


def closing_brace(text: str, start: int) -> int:
    """The index after the brace that closes the group whose opening brace stands just before `start`."""
    depth = 1
    index = start
    while index < len(text):
        char = text[index]
        if char == "\\":
            index += 2
            continue
        if char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return index + 1
        index += 1
    return len(text)


def sections(body: str) -> list[tuple[str, int, int]]:
    """Each top-level heading of the body in document order: its text, where its command starts and where it ends."""
    found = []
    for match in SECTION.finditer(body):
        end = closing_brace(body, match.end())
        found.append((body[match.end():end - 1], match.start(), end))
    return found


def kept_in_order(positions: list[int]) -> set[int]:
    """The indexes of the longest run of rising positions, the earlier indexes kept where two runs are equal."""
    count = len(positions)
    longest = [1] * count
    for index in range(count - 1, -1, -1):
        for later in range(index + 1, count):
            if positions[later] > positions[index]:
                longest[index] = max(longest[index], 1 + longest[later])
    kept: set[int] = set()
    needed = max(longest, default=0)
    last = -1
    for index in range(count):
        if needed and longest[index] == needed and positions[index] > last:
            kept.add(index)
            last = positions[index]
            needed -= 1
    return kept


def report(rows: list[dict[str, str]], headings: list[str]) -> tuple[list[str], bool]:
    """The lines to print and whether one of them is a failure."""
    rows = [row for row in rows if same_heading(row["Heading"]) != same_heading(WHOLE_DOCUMENT)]
    place = {}
    for index, heading in enumerate(headings):
        place.setdefault(same_heading(heading), index)
    present = [row for row in rows if same_heading(row["Heading"]) in place]
    kept = kept_in_order([place[same_heading(row["Heading"])] for row in present])
    in_order = {same_heading(present[index]["Heading"]) for index in kept}
    lines = []
    failed = False
    for row in rows:
        name = one_line(row["Heading"])
        key = same_heading(row["Heading"])
        if key in in_order:
            lines.append(f"ok: {name}")
        elif key in place:
            lines.append(f"out of order: {name}")
            failed = True
        elif row["Required"] == "yes":
            lines.append(f"missing: {name}")
            failed = True
        else:
            lines.append(f"absent, not required: {name}")
    named = {same_heading(row["Heading"]) for row in rows}
    lines += [f"not in the config: {one_line(heading)}" for heading in headings if same_heading(heading) not in named]
    return lines, failed


def main(arguments: list[str]) -> int:
    try:
        if len(arguments) != 2:
            raise CheckError("usage: check_sections.py <config> <main.tex>")
        rows = section_rows(arguments[0])
        headings = [text for text, _, _ in sections(document_body(arguments[1]))]
        lines, failed = report(rows, headings)
    except CheckError as error:
        print(f"error: {error}", file=sys.stderr)
        return 2
    for line in lines:
        print(line)
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
