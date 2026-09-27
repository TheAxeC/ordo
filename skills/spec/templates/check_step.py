#!/usr/bin/env python3
"""Check that a step of a plan carries the user's authority before /spec prepares it.

Usage: check_step.py <plan.md> <step>

The step list is the "## Steps, in execution order" section of plan.md, and the rulings are its
"## Rulings" section (the heading may go on, as in "## Rulings (<date>)"); each section runs to the
next heading of level one or two. A step is a line of the step list that starts with "- ", with
no indent. Its name is the first word after "- ", after the checkmark a ticked step carries; a
line that starts with "Removed by" names its step as the first word after its first colon.

A step's authority is the tags that end its line, read from the end: "(approved)", for a step of
the list the user approved when the plan opened, and "(ruling <name>)", for a step a ruling of the
user added. A ruling of the user is a line of the Rulings section that starts with "- " and ends
with "(the user)", in either case, with or without a full stop inside or after the parentheses.
Its name is its letter or letters for a line "- Open item <L> (" or "- Open item <L>:", and the
text before its first " (" for any other line.

Exit status and output:
  0   one line on stdout: "ok: step <step> has the user's authority: <each tag that counts>", when
      the line ends with (approved) or with a (ruling <name>) that names a ruling of the user.
  1   one line on stdout, "refused: step <step> <the reason>; the user's ruling is needed", when
      the line starts with "Removed by", ends with no tag, or names only rulings the Rulings
      section does not hold as the user's.
  64  one "error: " line on stderr and nothing on stdout: a wrong number of arguments; a plan.md
      that is missing or not UTF-8; no step list or no Rulings section; a "Removed by" line with
      no step after its colon; a step listed twice; a step not in the list, the list printed.
"""
import re
import sys

STEPS = "## Steps, in execution order"
RULINGS = re.compile(r"## Rulings(\s.*)?")
HEADING = re.compile(r"#{1,2}(\s|$)")
CHECKMARK = "\u2705"
TAG = re.compile(r"\((approved|ruling ([^()]*[^()\s]))\)$")
USER = re.compile(r"\(the user\.?\)\.?$", re.IGNORECASE)
OPEN_ITEM = re.compile(r"Open item ([A-Za-z]+)(?: \(|:)")
REMOVED = re.compile(r"Removed by [^:]*:\s+(\S+)")


class Refusal(Exception):
    """A plan.md or an argument the check cannot use; the message says why."""


def read_lines(path):
    try:
        with open(path, encoding="utf-8", newline="") as handle:
            text = handle.read()
    except UnicodeDecodeError:
        raise Refusal(f"{path} is not UTF-8")
    except OSError as error:
        raise Refusal(f"cannot read {path}: {error.strerror or error}")
    return [line.rstrip() for line in text.split("\n")]


def section(lines, path, matches, label):
    """Return (line number, line) for each line of the first section whose heading matches."""
    found, inside, body = False, False, []
    for number, line in enumerate(lines, 1):
        if HEADING.match(line):
            inside = not found and matches(line)
            found = found or inside
            continue
        if inside:
            body.append((number, line))
    if not found:
        raise Refusal(f"{path} has no '{label}' section")
    return body


def steps(lines, path):
    """Return the step list as (name, line number, text after the name's marker, removed)."""
    listed = []
    for number, line in section(lines, path, lambda line: line == STEPS, STEPS):
        if not line.startswith("- "):
            continue
        item = line[2:].strip()
        if item.startswith(CHECKMARK):
            item = item[len(CHECKMARK):].strip()
        if item.startswith("Removed by"):
            match = REMOVED.match(item)
            if not match:
                raise Refusal(f"{path}:{number}: a line that starts with Removed by names no "
                              "step after its colon")
            listed.append((match.group(1), number, item, True))
        elif item:
            listed.append((item.split()[0], number, item, False))
    return listed


def user_rulings(lines, path):
    """Return the names of the Rulings section's lines that end with the user's mark."""
    names = set()
    for _, line in section(lines, path, RULINGS.fullmatch, "## Rulings"):
        if not line.startswith("- "):
            continue
        body = line[2:].strip()
        if not USER.search(body):
            continue
        match = OPEN_ITEM.match(body)
        if match:
            names.add(match.group(1))
        elif " (" in body:
            names.add(body[:body.index(" (")].strip())
    return names


def tags(text):
    """Return the tags that end the text, in the text's order, as (tag, ruling name or None)."""
    found = []
    rest = text
    match = TAG.search(rest)
    while match:
        found.insert(0, (match.group(0), match.group(2)))
        rest = rest[:match.start()].rstrip()
        match = TAG.search(rest)
    return found


def main(argv):
    if len(argv) != 2:
        raise Refusal("usage: check_step.py <plan.md> <step>")
    path, step = argv
    lines = read_lines(path)
    listed = steps(lines, path)
    names = user_rulings(lines, path)
    mine = [entry for entry in listed if entry[0] == step]
    if not mine:
        raise Refusal(f"step {step} is not in the step list of {path}: "
                      + (", ".join(entry[0] for entry in listed) or "no step"))
    if len(mine) > 1:
        raise Refusal(f"step {step} is listed twice in {path}, at lines "
                      + " and ".join(str(entry[1]) for entry in mine))
    _, _, text, removed = mine[0]
    needed = "the user's ruling is needed"
    if removed:
        print(f"refused: step {step} is removed: its line starts with Removed by; {needed}")
        return 1
    found = tags(text)
    if not found:
        print(f"refused: step {step} ends with neither (approved) nor (ruling <name>); {needed}")
        return 1
    counted = [tag for tag, name in found if name is None or name in names]
    if not counted:
        print(f"refused: step {step} names no ruling of the user in the Rulings section: "
              f"{' '.join(tag for tag, _ in found)}; {needed}")
        return 1
    print(f"ok: step {step} has the user's authority: {' '.join(counted)}")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main(sys.argv[1:]))
    except Refusal as refusal:
        print(f"error: {refusal}", file=sys.stderr)
        sys.exit(64)
