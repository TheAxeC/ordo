#!/usr/bin/env python3
"""Check a coverage list: every file of the named skill folders is listed once, with a mark and a reason.

Usage: check_coverage.py <coverage.md> <skills root> <skill>...

The coverage list is a Markdown file:

    # <title>

    <paragraphs>

    ## New skills

    | Skill | Roadmap entry |
    |---|---|
    | writing | 3 |

    ## <skill folder name>

    | File | Mark | Reason |
    |---|---|---|
    | `SKILL.md` | rebuild: writing | <reason> |

- New skills: one row per skill a mark may name, with the number of the roadmap entry that builds
  it. The entry is a heading "## <n>. " or "## <n>.<letter> ", or a Done line "- [x] <n>. " or
  "- [x] <n>.<letter> ", of docs/roadmap.md in the repository that holds the coverage list.
- A skill section is a "## " heading whose name is a <skill> given on the command line. Its table
  lists every file that `find -H <skills root>/<skill> -type f` lists exactly once, as a path relative
  to the skill folder, in backticks. Sections of folders not given on the command line are not read.
- A section's table is its first run of lines outside fenced code that start with "|" (after at most
  three spaces); a blank line or any other line ends it, and a table row after that end is an error.
- A link inside a skill folder is an error, since its target's files would be neither required nor
  accepted; the skill folder itself may be a link.
- Mark: "rebuild: <skill>", "rebuild later: <skill>" or "drop", the skill a row of New skills.
- Reason: not empty. A pipe inside a cell is written \\|.

Fenced code is ``` or ~~~, of any length, at any indentation, closed by a line of the same character
at least as long; a backtick fence's info string holds no backtick. This is the fence reading of
utils/check_skill_layout.py. A "## " line inside fenced code is not a heading, a table row inside it
is not read, and a fence left open is an error. A heading's closing hashes are not part of its name.

Prints one line per error as <coverage.md>:<line>: <what is wrong> (line 0 for an error that no line
of the list carries, such as a file the section does not list), and "ok: <coverage.md>" when there is
none. Exits 0 when there is no error, 1 when there is one, 2 on a usage error: a missing argument; a
skills root or skill folder that does not exist; a coverage list outside a git repository; a coverage
list or docs/roadmap.md that does not exist or is not UTF-8; a find that fails.
"""

import os
import re
import subprocess
import sys

NEW_SKILLS = "New skills"
NEW_SKILLS_HEADER = ["Skill", "Roadmap entry"]
SECTION_HEADER = ["File", "Mark", "Reason"]
MARK = re.compile(r"^(rebuild|rebuild later): (\S+)$")
SEPARATOR = re.compile(r"^\|(\s*:?-+:?\s*\|)+\s*$")
FENCE = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
TABLE_ROW = re.compile(r"^ {0,3}\|")
CLOSING_HASHES = re.compile(r"\s+#+\s*$")
ROADMAP_ENTRY = re.compile(r"^(?:## |- \[x\] )([0-9]+\.(?:[A-Z](?= )|(?= )))")


class UsageError(Exception):
    pass


def read_text(path):
    try:
        with open(path, "rb") as f:
            return f.read().decode("utf-8")
    except UnicodeDecodeError:
        raise UsageError(f"{path}: not UTF-8")
    except OSError as e:
        raise UsageError(f"{path}: {e.strerror}")


def split_row(line):
    """The cells of a table row, with \\| read as a pipe inside a cell."""
    body = line.strip()
    body = body[1:] if body.startswith("|") else body
    body = body[:-1] if body.endswith("|") and not body.endswith("\\|") else body
    cells, cell, i = [], "", 0
    while i < len(body):
        if body[i] == "\\" and i + 1 < len(body) and body[i + 1] == "|":
            cell += "|"
            i += 2
            continue
        if body[i] == "|":
            cells.append(cell.strip())
            cell = ""
        else:
            cell += body[i]
        i += 1
    cells.append(cell.strip())
    return cells


def fence_opener(line):
    """Return the fence a line opens, or None; a backtick fence's info string holds no backtick."""
    m = FENCE.match(line)
    if not m or (m.group(1)[0] == "`" and "`" in m.group(2)):
        return None
    return m.group(1)


def sections(lines, errors):
    """Map each "## " heading name outside fenced code, closing hashes removed, to [(heading line
    number, [(line number, text, inside fenced code or on a fence line)] of its body)], one entry per
    time the heading appears; an unclosed fence is appended to errors."""
    found, current = {}, None
    opener, opened_at = None, 0
    for number, line in enumerate(lines, 1):
        fenced_line = False
        if opener is None:
            opener = fence_opener(line)
            if opener:
                opened_at = number
            elif line.startswith("## "):
                current = CLOSING_HASHES.sub("", line[3:]).strip()
                found.setdefault(current, []).append((number, []))
                continue
        else:
            stripped = line.strip()
            if stripped and set(stripped) == {opener[0]} and len(stripped) >= len(opener):
                opener = None
                fenced_line = True
        if current is not None:
            found[current][-1][1].append((number, line, opener is not None or fenced_line))
    if opener is not None:
        errors.append((opened_at, f"the fence {opener} opened here is never closed"))
    return found


def table(heading_line, body, header, errors, where):
    """The body rows of the one table of a section, as (line number, cells); errors appended."""
    table_rows, started, ended = [], False, False
    for n, l, fenced in body:
        if not fenced and TABLE_ROW.match(l):
            if ended:
                errors.append((n, f"a table row after the end of the table in {where}"))
                continue
            started = True
            table_rows.append((n, l))
        elif started:
            ended = True
    if not table_rows:
        errors.append((heading_line, f"{where} holds no table"))
        return []
    first_n, first = table_rows[0]
    if split_row(first) != header:
        errors.append((first_n, f"the table header of {where} is not | {' | '.join(header)} |"))
        return []
    if len(table_rows) < 2 or not SEPARATOR.match(table_rows[1][1].strip()):
        errors.append((first_n, f"the table of {where} has no separator row"))
        return []
    body_rows = []
    for n, l in table_rows[2:]:
        cells = split_row(l)
        if len(cells) != len(header):
            errors.append((n, f"a row of {where} has {len(cells)} cells, not {len(header)}"))
            continue
        body_rows.append((n, cells))
    return body_rows


def roadmap_entries(coverage_path):
    folder = os.path.dirname(os.path.abspath(coverage_path))
    top = subprocess.run(["git", "-C", folder, "rev-parse", "--show-toplevel"],
                         capture_output=True, text=True)
    if top.returncode != 0:
        raise UsageError(f"{coverage_path}: not inside a git repository")
    roadmap = os.path.join(top.stdout.strip(), "docs", "roadmap.md")
    entries = set()
    for line in read_text(roadmap).splitlines():
        m = ROADMAP_ENTRY.match(line)
        if m:
            entries.add(m.group(1).rstrip("."))
    return entries


def find(folder, kind):
    listed = subprocess.run(["find", "-H", folder, "-type", kind], capture_output=True, text=True)
    if listed.returncode != 0:
        raise UsageError(f"{folder}: find failed: {listed.stderr.strip()}")
    return sorted(os.path.relpath(p, folder) for p in listed.stdout.splitlines())


def check(coverage_path, root, skills):
    lines = read_text(coverage_path).splitlines()
    errors = []
    found = sections(lines, errors)

    new_skills = {}
    if NEW_SKILLS not in found:
        errors.append((0, f"no '## {NEW_SKILLS}' section"))
    else:
        if len(found[NEW_SKILLS]) > 1:
            errors.append((found[NEW_SKILLS][1][0], f"'## {NEW_SKILLS}' appears more than once"))
        heading_line, body = found[NEW_SKILLS][0]
        entries = roadmap_entries(coverage_path)
        for n, (skill, entry) in table(heading_line, body, NEW_SKILLS_HEADER, errors, f"'{NEW_SKILLS}'"):
            if not skill or not entry:
                errors.append((n, "an empty cell in New skills"))
                continue
            if skill in new_skills:
                errors.append((n, f"new skill '{skill}' is named twice"))
                continue
            if entry not in entries:
                errors.append((n, f"roadmap entry '{entry}' of '{skill}' is not in docs/roadmap.md"))
            new_skills[skill] = entry

    for skill in skills:
        folder = os.path.join(root, skill)
        on_disk = find(folder, "f")
        for link in find(folder, "l"):
            errors.append((0, f"'{skill}/{link}' is a link; its target is not listed or read"))
        if skill not in found:
            errors.append((0, f"no '## {skill}' section"))
            continue
        if len(found[skill]) > 1:
            errors.append((found[skill][1][0], f"'## {skill}' appears more than once"))
        heading_line, body = found[skill][0]
        seen = {}
        for n, (file_cell, mark, reason) in table(heading_line, body, SECTION_HEADER, errors, f"'{skill}'"):
            m = re.match(r"^`([^`]+)`$", file_cell)
            if not m:
                errors.append((n, f"the file cell {file_cell!r} is not one path in backticks"))
                continue
            path = m.group(1)
            if os.path.isabs(path) or ".." in path.split("/") or os.path.normpath(path) != path:
                errors.append((n, f"'{path}' is not a plain path relative to the skill folder"))
                continue
            if path in seen:
                errors.append((n, f"'{path}' is listed twice in '{skill}' (first at line {seen[path]})"))
                continue
            seen[path] = n
            if path not in on_disk:
                errors.append((n, f"'{path}' is not a file of {skill}"))
            mm = MARK.match(mark)
            if mark != "drop" and not mm:
                errors.append((n, f"the mark {mark!r} is not 'rebuild: <skill>', 'rebuild later: <skill>' or 'drop'"))
            elif mm and mm.group(2) not in new_skills:
                errors.append((n, f"the mark names '{mm.group(2)}', which is not a row of New skills"))
            if not reason:
                errors.append((n, f"'{path}' has no reason"))
        for path in on_disk:
            if path not in seen:
                errors.append((0, f"'{skill}/{path}' is not listed"))
    return errors


def main(argv):
    if len(argv) < 3:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    coverage_path, root, skills = argv[0], argv[1], list(dict.fromkeys(argv[2:]))
    try:
        if not os.path.isdir(root):
            raise UsageError(f"{root}: not a folder")
        for skill in skills:
            if not os.path.isdir(os.path.join(root, skill)):
                raise UsageError(f"{os.path.join(root, skill)}: not a folder")
        errors = check(coverage_path, root, skills)
    except UsageError as e:
        print(f"usage error: {e}", file=sys.stderr)
        return 2
    for number, message in sorted(errors):
        print(f"{coverage_path}:{number}: {message}")
    if errors:
        return 1
    print(f"ok: {coverage_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
