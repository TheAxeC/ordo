#!/usr/bin/env python3
"""Check rule inventories: every rule of an old SKILL.md has a place in the new one.

Usage: check_rule_inventory.py <inventory.md>...

An inventory is a Markdown file:

    # Rule inventory: <skill>

    - Old: `skills/<skill>/SKILL.md` at `<commit>`
    - New: `skills/<skill>/SKILL.md`

    | Old lines | Rule | New place |
    |---|---|---|
    | 12-14 | <the rule, quoted or stated> | Steps 3 |

- Old: a relative path, and a commit written as its hexadecimal id (7 to 40 digits); the old file is
  `git show <commit>:<path>` in the repository that holds the inventory. A branch, a tag or HEAD is
  refused, since each can later name the new file.
- New: a relative path inside that repository, read from its working tree.
- Old lines: one line number or a range a-b of the old file. A range stays inside one block: it
  holds no blank line and no heading, crosses no frontmatter delimiter and no fence boundary (a fenced
  block, its fence lines included, is a block of its own), and opens at most one item: a list item at
  any depth (- * + 1. 1)), a table row other than a separator, or a frontmatter key or comment line.
- Rule: not empty. A pipe inside it is written \\|.
- New place: a "## " section of the new file, optionally followed by " / " and a "### " subsection
  under it, then optionally by an item number n >= 1: the n-th top-level list item (- * + 1. 1))
  or unindented table body row of that section (its own, before any subsection) or of that
  subsection, counted outside fenced code. Section and subsection names are matched whole, so a name may hold " / " or
  end in a digit.

What is checked, besides the above:
- each header line appears exactly once, the table's header row is | Old lines | Rule | New place |,
  and no table row follows the end of that table;
- every old line that carries text falls in some row's range. A line carries no text when it is
  blank, a frontmatter delimiter, a heading outside the frontmatter and outside fenced code, the line
  that opens or closes a fence, or a table's separator row (the line right after a table's first row).
Fenced code is ``` or ~~~, of any length, at any indentation, closed by a line of the same character
at least as long; a backtick fence's info string holds no backtick. This is the fence reading of
utils/check_skill_layout.py.

Prints one line per error as <inventory>:<line>: <what is wrong> (line 0 when the error has no row,
uncovered old lines in their order) and "ok: <inventory>" for one with none. Exits 1 when any
inventory has an error, and 2 when no inventory is named.
"""
import os
import re
import subprocess
import sys

OLD = re.compile(r"^- Old: `([^`]+)` at `([^`]+)`\s*$")
NEW = re.compile(r"^- New: `([^`]+)`\s*$")
COMMIT = re.compile(r"^[0-9a-f]{7,40}$")
RANGE = re.compile(r"^(\d+)(?:-(\d+))?$")
HEADER = ["Old lines", "Rule", "New place"]
FENCE = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
HEADING = re.compile(r"^#{1,6} ")
ITEM = re.compile(r"^(?:[-*+] |\d+[.)] )")
ANY_ITEM = re.compile(r"^\s*(?:[-*+] |\d+[.)] )")
YAML_KEY = re.compile(r"^(?:[A-Za-z_][\w-]*\s*:|#)")
SEPARATOR_CELLS = re.compile(r"^\s*\|?(\s*:?-+:?\s*\|)+\s*(:?-+:?)?\s*$")
CLOSING_HASHES = re.compile(r"\s+#+\s*$")
ITEM_NUMBER = re.compile(r"^(.*) (\d+)$")


def fence_flags(lines):
    """Return, per line, (inside a fence or on a fence line, is the fence's opening or closing line)."""
    flags, opener = [], None
    for line in lines:
        if opener is None:
            m = FENCE.match(line)
            if m and not (m.group(1)[0] == "`" and "`" in m.group(2)):
                opener = m.group(1)
                flags.append((True, True))
                continue
            flags.append((False, False))
        else:
            stripped = line.strip()
            if stripped and set(stripped) == {opener[0]} and len(stripped) >= len(opener):
                opener = None
                flags.append((True, True))
                continue
            flags.append((True, False))
    return flags


def is_table_row(line):
    return line.lstrip().startswith("|")


def separator_rows(lines, flags):
    """Return the indices of table separator rows: the line right after a table's first row."""
    result = set()
    for i in range(1, len(lines)):
        if flags[i][0]:
            continue
        if not (is_table_row(lines[i - 1]) and SEPARATOR_CELLS.match(lines[i])):
            continue
        if i >= 2 and is_table_row(lines[i - 2]) and not flags[i - 2][0]:
            continue
        result.add(i)
    return result


def frontmatter_end(lines):
    if lines and lines[0].strip() == "---":
        for i in range(1, len(lines)):
            if lines[i].strip() == "---":
                return i
    return -1


def carries_text(lines, flags, separators, index, end):
    line = lines[index]
    if not line.strip():
        return False
    if index <= end:
        return not (index in (0, end) and line.strip() == "---")
    fenced, fence_line = flags[index]
    if fence_line:
        return False
    if fenced:
        return True
    if HEADING.match(line) or index in separators:
        return False
    return True


def places(lines):
    """Return {(section, sub or None): number of items} for the new file; a section's own count
    holds only the items before its first subsection."""
    flags = fence_flags(lines)
    separators = separator_rows(lines, flags)
    counts, section, sub = {}, None, None
    for index, line in enumerate(lines):
        if flags[index][0]:
            continue
        if line.startswith("## "):
            section, sub = CLOSING_HASHES.sub("", line[3:]).strip(), None
            counts.setdefault((section, None), 0)
            continue
        if line.startswith("### ") and section is not None:
            sub = CLOSING_HASHES.sub("", line[4:]).strip()
            counts.setdefault((section, sub), 0)
            continue
        if section is None or index in separators:
            continue
        is_header = (index + 1) in separators
        if ITEM.match(line) or (line.startswith("|") and not is_header):
            counts[(section, sub)] = counts.get((section, sub), 0) + 1
    return counts


def resolve_place(place, known):
    """Return (((section, sub), item), None) for a place, or (None, an error message)."""
    candidates = [(place, None)]
    m = ITEM_NUMBER.match(place)
    if m:
        candidates.append((m.group(1), int(m.group(2))))
    for text, number in candidates:
        if (text, None) in known:
            return ((text, None), number), None
        for section, sub in known:
            if sub is not None and text == f"{section} / {sub}":
                return ((section, sub), number), None
    for section in sorted({s for s, _ in known}, key=len, reverse=True):
        if place.startswith(section + " / "):
            rest = place[len(section) + 3:]
            m2 = ITEM_NUMBER.match(rest)
            return None, f"no subsection '### {m2.group(1) if m2 else rest}' under '## {section}'"
    name = m.group(1) if m else place
    return None, f"no section '## {name.split(' / ')[0]}'"


def split_cells(line):
    """Split a table row on pipes that are not escaped; an escaped pipe becomes a pipe."""
    body = line.strip()
    if body.startswith("|"):
        body = body[1:]
    if body.endswith("|"):
        body = body[:-1]
    return [c.strip().replace("\\|", "|") for c in re.split(r"(?<!\\)\|", body)]


def inventory_rows(lines, errors):
    """Return [(line number, cells)] for the body rows of the inventory's first table, outside fences."""
    flags = fence_flags(lines)
    rows, header_at, ended = [], None, False
    for i, line in enumerate(lines):
        if ended:
            if not flags[i][0] and is_table_row(line):
                errors.append((i + 1, "a table row after the inventory's table has ended"))
            continue
        if flags[i][0] or not is_table_row(line):
            if header_at is not None and i > header_at + 1:
                ended = True
            continue
        if header_at is None:
            header_at = i
            cells = split_cells(line)
            if cells != HEADER:
                errors.append((i + 1, f"the table header is | {' | '.join(cells)} |, not | {' | '.join(HEADER)} |"))
            continue
        if i == header_at + 1 and SEPARATOR_CELLS.match(line):
            continue
        rows.append((i + 1, split_cells(line)))
    return rows


def read_text(path):
    try:
        return open(path, encoding="utf-8").read(), None
    except UnicodeDecodeError as exc:
        return None, f"not UTF-8: {exc.reason}"


def inside(root, path):
    """True when path is relative and resolves inside root."""
    if os.path.isabs(path) or path.startswith("-"):
        return False
    real_root = os.path.realpath(root)
    real = os.path.realpath(os.path.join(root, path))
    return real.startswith(real_root + os.sep)


def blocks(lines, flags, end):
    """Return, per line, (block key, whether the line opens an item). A blank line and a heading are
    blocks of their own and end the block before them; each frontmatter delimiter is a block, the
    frontmatter between them is one, and each fenced block, its fence lines included, is one. An item
    is a list item at any depth, a table row other than a separator, or a frontmatter key or comment."""
    separators = separator_rows(lines, flags)
    result, fence_start, text_start = [], None, None
    for index, line in enumerate(lines):
        fenced, fence_line = flags[index]
        if index <= end:
            if index in (0, end):
                result.append((("delimiter", index), False))
            else:
                result.append((("frontmatter",), bool(YAML_KEY.match(line))))
            continue
        if fenced:
            if fence_start is None:
                fence_start = index
            result.append((("fence", fence_start), False))
            if fence_line and index != fence_start:
                fence_start = None
            text_start = None
            continue
        if not line.strip() or HEADING.match(line):
            result.append((("break", index), False))
            text_start = None
            continue
        if text_start is None:
            text_start = index
        opens = bool(ANY_ITEM.match(line)) or (is_table_row(line) and index not in separators)
        result.append((("text", text_start), opens))
    return result


def check_range_block(old_lines, flags, end, first, last):
    """Return an error message when a range spans more than one block or item, or None."""
    info = blocks(old_lines, flags, end)
    ids = {info[i][0] for i in range(first - 1, last)}
    for index in range(first - 1, last):
        if not old_lines[index].strip():
            return f"old lines {first}-{last} hold a blank line at {index + 1}; a range stays inside one block"
        if index > end and not flags[index][0] and HEADING.match(old_lines[index]):
            return f"old lines {first}-{last} hold a heading at {index + 1}; a range stays inside one block"
    if len(ids) > 1:
        crossing = next(i for i in range(first, last) if info[i][0] != info[first - 1][0])
        return f"old lines {first}-{last} cross into another block at {crossing + 1}; a range stays inside one block"
    openers = sum(1 for i in range(first - 1, last) if info[i][1])
    if openers > 1:
        return f"old lines {first}-{last} open {openers} list items, table rows or frontmatter keys; one row per item"
    return None


def check_inventory(path):
    if not os.path.isfile(path):
        return [(0, "no such file")]
    text, problem = read_text(path)
    if problem:
        return [(0, problem)]
    lines = text.splitlines()
    errors = []
    olds = [(i + 1, OLD.match(l)) for i, l in enumerate(lines) if OLD.match(l)]
    news = [(i + 1, NEW.match(l)) for i, l in enumerate(lines) if NEW.match(l)]
    if not olds:
        errors.append((1, "no '- Old: `<path>` at `<commit>`' line"))
    if not news:
        errors.append((1, "no '- New: `<path>`' line"))
    for found, label in ((olds, "Old"), (news, "New")):
        for number, _ in found[1:]:
            errors.append((number, f"a second '- {label}:' line"))
    if errors:
        return errors
    old_at, old_m = olds[0]
    new_at, new_m = news[0]
    old_path, commit, new_path = old_m.group(1), old_m.group(2), new_m.group(1)
    repo = subprocess.run(["git", "-C", os.path.dirname(os.path.abspath(path)), "rev-parse", "--show-toplevel"],
                          capture_output=True, text=True)
    if repo.returncode != 0:
        return [(old_at, "the inventory is not inside a git repository")]
    root = repo.stdout.strip()
    if not COMMIT.match(commit):
        errors.append((old_at, f"the old commit '{commit}' is not a hexadecimal commit id"))
    if not inside(root, old_path):
        errors.append((old_at, f"the old path '{old_path}' is not a relative path inside the repository"))
    if not inside(root, new_path):
        errors.append((new_at, f"the new path '{new_path}' is not a relative path inside the repository"))
    if errors:
        return errors
    full = subprocess.run(["git", "-C", root, "rev-parse", "--verify", "--quiet", f"{commit}^{{commit}}"],
                          capture_output=True, text=True)
    if full.returncode != 0 or not full.stdout.strip().startswith(commit):
        return [(old_at, f"no commit {commit} in the repository")]
    shown = subprocess.run(["git", "-C", root, "show", f"{full.stdout.strip()}:{old_path}"], capture_output=True)
    if shown.returncode != 0:
        errors.append((old_at, f"git show {commit}:{old_path} failed: the path is not in that commit"))
    new_file = os.path.join(root, new_path)
    if not os.path.isfile(new_file):
        errors.append((new_at, f"the new file {new_path} does not exist"))
    if errors:
        return errors
    try:
        old_lines = shown.stdout.decode("utf-8").splitlines()
    except UnicodeDecodeError as exc:
        return [(old_at, f"the old file is not UTF-8: {exc.reason}")]
    new_text, problem = read_text(new_file)
    if problem:
        return [(new_at, f"the new file is {problem}")]
    known = places(new_text.splitlines())
    flags = fence_flags(old_lines)
    separators = separator_rows(old_lines, flags)
    end = frontmatter_end(old_lines)
    covered = set()
    rows = inventory_rows(lines, errors)
    if not rows:
        errors.append((1, "no table rows"))
    for number, cells in rows:
        if len(cells) != 3:
            errors.append((number, f"a row has {len(cells)} cells, not 3"))
            continue
        span, rule, place = cells
        m = RANGE.match(span)
        if not m:
            errors.append((number, f"old lines '{span}' is not a number or a range a-b"))
        else:
            first, last = int(m.group(1)), int(m.group(2) or m.group(1))
            if first < 1 or last > len(old_lines) or first > last:
                errors.append((number, f"old lines {span} lie outside the old file's 1-{len(old_lines)} or run backwards"))
            else:
                block = check_range_block(old_lines, flags, end, first, last)
                if block:
                    errors.append((number, block))
                covered.update(range(first, last + 1))
        if not rule:
            errors.append((number, "the rule is empty"))
        resolved, problem = resolve_place(place, known)
        if problem:
            errors.append((number, f"{problem} in {new_path}"))
            continue
        key, item = resolved
        if item is not None and (item < 1 or item > known[key]):
            where = key[0] if key[1] is None else f"{key[0]} / {key[1]}"
            errors.append((number, f"item {item} of '{where}' does not exist; it has {known[key]}"))
    for index in range(len(old_lines)):
        if carries_text(old_lines, flags, separators, index, end) and (index + 1) not in covered:
            errors.append((0, f"old line {index + 1} is in no row: {old_lines[index].strip()[:60]}"))
    return errors


def main(argv):
    if not argv:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    failed = False
    for path in argv:
        errors = check_inventory(path)
        for number, message in errors:
            print(f"{path}:{number}: {message}")
        if errors:
            failed = True
        else:
            print(f"ok: {path}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
