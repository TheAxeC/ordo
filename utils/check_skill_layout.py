#!/usr/bin/env python3
"""Check SKILL.md files against docs/dev/skill-layout.md.

Usage: check_skill_layout.py [SKILL.md or skill folder]...

A skill folder stands for the SKILL.md inside it. With no argument, every skills/*/SKILL.md in the
repository that holds this script is checked, and paths are printed relative to the current directory.
Prints one line per error as <path>:<line>: <what is wrong>, and "ok: <path>" for a file with none;
exits 1 when any file has an error.

What is checked:
- the frontmatter: a YAML mapping whose name equals the folder's name, whose description holds
  "Triggers on:", and whose metadata.version is <n>.<n>.<n>;
- the first line after the frontmatter is a "# " title, followed by a paragraph before the first
  "## " heading, and no other "# " heading follows;
- the "## " headings in order: Quick start, Use instead, What it reads, Steps, any reference sections,
  Stops, Anti-patterns, Rules, each once, and nothing after Rules;
- a code block in Quick start, a numbered list in What it reads and in Steps (its "### " subsections
  count), a bulleted list (- or *) in Rules;
- the header row of the tables in Use instead, Stops and Anti-patterns;
- bold (** or __) only as a list item's label, at any list depth, italics inside the label allowed; a
  heading is not a label;
- no version tag in any heading, code spans included.
Fenced code blocks (``` or ~~~, of any length, at any indentation, closed by a line of the same
character at least as long; a backtick fence's info string holds no backtick) are not read for
headings, lists, tables or bold, and a fence left open is an error. Code spans are not read for bold.
A heading's closing hashes are not part of its name. A missing file is reported at line 0.
"""
import os
import re
import sys

import yaml

BEFORE = ["Quick start", "Use instead", "What it reads", "Steps"]
AFTER = ["Stops", "Anti-patterns", "Rules"]
REQUIRED = BEFORE + AFTER
TABLES = {
    "Use instead": ["When", "Use"],
    "Stops": ["Stop", "When", "What it shows", "What resumes it"],
    "Anti-patterns": ["Anti-pattern", "Why it fails", "Do instead"],
}
FENCE = re.compile(r"^\s*(`{3,}|~{3,})(.*)$")
HEADING = re.compile(r"^(#{1,6}) ")
NUMBERED = re.compile(r"^\s*\d+\. ")
BULLET = re.compile(r"^\s*[-*] ")
LABEL = re.compile(r"^\s*(?:[-*] |\d+\. )(\*\*(?:[^*]|\*(?!\*))+\*\*|__(?:[^_]|_(?!_))+__)")
BOLD = re.compile(r"\*\*|__")
VERSION_TAG = re.compile(r"\bv\d+\.")
CODE_SPAN = re.compile(r"`[^`]*`")
PARAGRAPH = re.compile(r"^(?!\s*(?:#|\||[-*] |\d+\. |`{3,}|~{3,}))\s*\S")
CLOSING_HASHES = re.compile(r"\s+#+\s*$")


def split_frontmatter(lines):
    """Return (frontmatter text, index of the first body line), or (None, 0)."""
    if not lines or lines[0].strip() != "---":
        return None, 0
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            return "\n".join(lines[1:i]), i + 1
    return None, 0


def check_frontmatter(path, text, errors):
    if text is None:
        errors.append((1, "no frontmatter between two --- lines"))
        return
    try:
        data = yaml.safe_load(text)
    except yaml.YAMLError as exc:
        errors.append((1, f"frontmatter is not YAML: {str(exc).splitlines()[0]}"))
        return
    if not isinstance(data, dict):
        errors.append((1, f"frontmatter is a {type(data).__name__}, not a mapping"))
        return
    folder = os.path.basename(os.path.dirname(os.path.abspath(path)))
    if data.get("name") != folder:
        errors.append((1, f"name is {data.get('name')!r}, the folder is {folder!r}"))
    description = data.get("description")
    if not isinstance(description, str) or "Triggers on:" not in description:
        errors.append((1, "description does not hold 'Triggers on:'"))
    metadata = data.get("metadata")
    version = metadata.get("version") if isinstance(metadata, dict) else None
    if not (isinstance(version, str) and re.fullmatch(r"\d+\.\d+\.\d+", version)):
        errors.append((1, f"metadata.version is {version!r}, not <n>.<n>.<n>"))


def fence_opener(line):
    """Return the fence a line opens, or None; a backtick fence's info string holds no backtick."""
    m = FENCE.match(line)
    if not m or (m.group(1)[0] == "`" and "`" in m.group(2)):
        return None
    return m.group(1)


def mark_fences(lines, start, errors):
    """Return, for each line from start on, (number, text, inside a fence); fence lines count as inside.
    A fence closes on a line holding only the same character, at least as many times."""
    marked, opener, opened_at = [], None, 0
    for i in range(start, len(lines)):
        line = lines[i]
        if opener is None:
            opener = fence_opener(line)
            if opener:
                opened_at = i + 1
            marked.append((i + 1, line, opener is not None))
            continue
        stripped = line.strip()
        if stripped and set(stripped) == {opener[0]} and len(stripped) >= len(opener):
            opener = None
        marked.append((i + 1, line, True))
    if opener is not None:
        errors.append((opened_at, f"the fence {opener} opened here is never closed"))
    return marked


def check_headings_and_bold(marked, errors):
    for number, line, fenced in marked:
        if fenced:
            continue
        heading = HEADING.match(line)
        if heading:
            if VERSION_TAG.search(line):
                errors.append((number, f"version tag in heading: {line.strip()}"))
            if BOLD.search(CODE_SPAN.sub("", line)):
                errors.append((number, "bold in a heading"))
            continue
        plain = CODE_SPAN.sub("", line)
        if not BOLD.search(plain):
            continue
        label = LABEL.match(plain)
        rest = plain[label.end():] if label else plain
        if BOLD.search(rest):
            errors.append((number, "bold outside a list item's label"))


def split_sections(marked):
    """Return (title, sections): title is (number, body) or None; sections are (name, number, body)."""
    title, sections, current = None, [], None
    for number, line, fenced in marked:
        if not fenced and line.startswith("# "):
            if title is None and current is None:
                title = (number, [])
                continue
        if not fenced and line.startswith("## "):
            current = (CLOSING_HASHES.sub("", line[3:]).strip(), number, [])
            sections.append(current)
            continue
        if current is not None:
            current[2].append((number, line, fenced))
        elif title is not None:
            title[1].append((number, line, fenced))
    return title, sections


def check_title(marked, title, errors, first_line):
    first = next(((n, l) for n, l, f in marked if l.strip()), None)
    if title is None:
        errors.append((first[0] if first else first_line, "no '# ' title after the frontmatter"))
        return
    if first is not None and first[0] != title[0]:
        errors.append((first[0], "text before the title"))
    if not any(not f and PARAGRAPH.match(l) for _, l, f in title[1]):
        errors.append((title[0], "no paragraph between the title and the first section"))
    for number, line, fenced in marked:
        if not fenced and line.startswith("# ") and number != title[0]:
            errors.append((number, f"a second '# ' heading: {line.strip()}"))


def check_order(sections, errors, last_line):
    seen = {}
    for name, number, _ in sections:
        if name in REQUIRED:
            if name in seen:
                errors.append((number, f"section '{name}' appears twice"))
            else:
                seen[name] = number
    for index, name in enumerate(REQUIRED):
        if name not in seen:
            following = [seen[n] for n in REQUIRED[index + 1:] if n in seen]
            errors.append((following[0] if following else max(last_line, 1), f"section '{name}' is missing"))
    placed = [(n, num) for n, num, _ in sections if n in REQUIRED and seen.get(n) == num]
    expected = [n for n in REQUIRED if n in seen]
    for (name, number), want in zip(placed, expected):
        if name != want:
            errors.append((number, f"section '{name}' is out of order: '{want}' belongs here"))
            break
    after_steps, before_stops = False, True
    for name, number, _ in sections:
        if name == "Steps":
            after_steps = True
        elif name == "Stops":
            before_stops = False
        elif name not in REQUIRED and not (after_steps and before_stops):
            errors.append((number, f"section '{name}' is outside the place between Steps and Stops"))


def check_section_body(name, number, body, errors):
    text_lines = [(n, l) for n, l, fenced in body if not fenced]
    if name == "Quick start" and not any(fenced for _, _, fenced in body):
        errors.append((number, "Quick start holds no code block"))
    if name in ("What it reads", "Steps") and not any(NUMBERED.match(l) for _, l in text_lines):
        errors.append((number, f"{name} holds no numbered list"))
    if name == "Rules" and not any(BULLET.match(l) for _, l in text_lines):
        errors.append((number, "Rules holds no bulleted list"))
    if name in TABLES:
        rows = [(n, l) for n, l in text_lines if l.lstrip().startswith("|")]
        want = TABLES[name]
        if not rows:
            errors.append((number, f"{name} holds no table; its header is | {' | '.join(want)} |"))
        else:
            cells = [c.strip() for c in rows[0][1].strip().strip("|").split("|")]
            if cells != want:
                errors.append((rows[0][0], f"{name} table header is | {' | '.join(cells)} |, not | {' | '.join(want)} |"))


def check_file(path):
    if not os.path.isfile(path):
        return [(0, "no such file")]
    try:
        lines = open(path, encoding="utf-8").read().splitlines()
    except UnicodeDecodeError as exc:
        return [(0, f"not UTF-8: {exc.reason}")]
    errors = []
    frontmatter, start = split_frontmatter(lines)
    check_frontmatter(path, frontmatter, errors)
    marked = mark_fences(lines, start, errors)
    check_headings_and_bold(marked, errors)
    title, sections = split_sections(marked)
    check_title(marked, title, errors, start + 1)
    for name, number, body in sections:
        check_section_body(name, number, body, errors)
    check_order(sections, errors, len(lines))
    return sorted(errors)


def targets(argv):
    if argv:
        for arg in argv:
            yield os.path.join(arg, "SKILL.md") if os.path.isdir(arg) else arg
        return
    root = os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "skills")
    for name in sorted(os.listdir(root)):
        path = os.path.join(root, name, "SKILL.md")
        if os.path.isfile(path):
            yield os.path.relpath(path)


def main(argv):
    failed = False
    for path in targets(argv):
        errors = check_file(path)
        for number, message in errors:
            print(f"{path}:{number}: {message}")
        if errors:
            failed = True
        else:
            print(f"ok: {path}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
