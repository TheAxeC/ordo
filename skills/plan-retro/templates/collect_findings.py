#!/usr/bin/env python3
"""Collect the findings of every refuter report under the given folders, one JSON object per line.

Usage: collect_findings.py [--exclude-listed <earlier retro>] <folder>...

A refuter report is a file named <step>-refuter.md in an agents/reviews/ folder; its plan is the
name of the folder that holds agents/. Reports are read once each, in path order.

A finding is a top-level item ("- ", "<n>. " or "<n>) ") with its indented lines, an indented
paragraph after a blank line included. It is read under a Spec, Proof, Standards or Behaviour
heading, or in a "Repair round <n>, refuted" section. Inside a round, a "### Spec", "### Proof",
"### Standards" or "### Behaviour" subheading gives its items their heading, and a round that has
one keeps its findings under them. In a round with none, an item takes the heading word it ends
with, is a proof finding when it says a claim was "not reproduced", and is unclassified otherwise.
A heading's name is compared in either case, without a leading number, closing hashes, a trailing
parenthetical, or a trailing colon or full stop.

An item whose first sentence says that nothing was found is not a finding (NOTHING_FOUND and
OTHERS_REPRODUCE below list the forms). Nor is a round's item that says a closure holds: one holding
": closed", or one that opens with "Closed", "Closures checked" or "Checked and holding"; an item
saying a closure does not hold is a finding. Sections and subsections named Verification, Not
checked, Closed, Closures or Usage are not read. Nor is anything inside a fence of three or more
backticks or tildes, indented or not, up to a line of the same character, at least as long, with
nothing after it.

With --exclude-listed, the findings of the runs listed under the retro's "## Reports read" heading
are skipped, so a retro can start where the previous one ended. Each entry there names a report by
its path under the ledger or archive root and the runs read from it:

    - `<plan>/agents/reviews/<step>-refuter.md`: first, round 1

A finding is skipped when its plan folder's name, step and run are listed, so a plan moved into
the archive stays excluded and a round added to a report later is read. A retro that cannot be read
as UTF-8, has no such heading, or holds a line there that is neither blank nor an entry, or a run
that is not "first" or "round <n>", is refused with exit status 2.

Each line: {"plan", "step", "report", "run", "heading", "location", "text"}. The run is "first" or
"round <n>"; the heading is spec, proof, standards, behaviour or unclassified; the location is the
first path:line the finding names, or "".
"""
import json
import os
import re
import sys

HEADINGS = ("spec", "proof", "standards", "behaviour")
NOT_READ = re.compile(r"(verification|not checked|closed|closures|usage)\b")
NUMBER = re.compile(r"^\d+[.)]?\s*")
ITEM = re.compile(r"(- |\d+[.)] )")
HEADING_LINE = re.compile(r"#{1,6}(\s|$)")
FENCE = re.compile(r"\s*(`{3,}|~{3,})(.*)$")
LOCATION = re.compile(r"[\w./-]+\.[A-Za-z]+:\d+(?:-\d+)?")
TRAILING = re.compile(r"\b(Spec|Proof|Standards|Behaviour)\.\s*$")
CLOSURE = re.compile(r"(^closed\b|^closures checked\b|^checked and holding\b|: closed\b)", re.I)
FIRST_SENTENCE = re.compile(r"(.*?)(?:[.:;](?:\s|$)|$)")
# The forms of an item that reports nothing. Its first sentence either opens with one of
# NOTHING_FOUND, or says only that the other or remaining figures or claims reproduce, as in "The
# other figures reproduce", "The rest reproduces" or "Every other figure reproduced".
NOTHING_FOUND = re.compile(
    r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)\b", re.I
)
OTHERS_REPRODUCE = re.compile(
    r"(the |every )?(other|remaining|rest)\b[^.:;]*\breproduc(e|es|ed)", re.I
)
ENTRY = re.compile(r"- `([^`]+)`: (.+)")
ENTRY_FORM = "- `<plan>/agents/reviews/<step>-refuter.md`: <run>, ..."
RUN = re.compile(r"first|round [1-9]\d*")


def reports(folders):
    """Yield each report once, however many of the folders hold it, in path order."""
    seen = set()
    for folder in folders:
        for dirpath, dirnames, files in os.walk(folder):
            dirnames.sort()
            if not dirpath.replace(os.sep, "/").endswith("agents/reviews"):
                continue
            for name in sorted(files):
                if name.endswith("-refuter.md"):
                    path = os.path.join(dirpath, name)
                    real = os.path.realpath(path)
                    if real not in seen:
                        seen.add(real)
                        yield path


def items(lines):
    """Join each top-level item with its indented lines, blank lines between them included.

    An item ends at the next item or at the next line that is neither blank nor indented.
    """
    current = None
    for line in lines:
        if ITEM.match(line):
            if current is not None:
                yield current
            current = ITEM.sub("", line, count=1).strip()
        elif current is None or not line.strip():
            continue
        elif line[0] in " \t":
            current += " " + line.strip()
        else:
            yield current
            current = None
    if current is not None:
        yield current


def unfenced(text):
    """Yield (line number, line) for the lines of the text outside fenced code."""
    fence = None
    for number, line in enumerate(text.splitlines(), 1):
        match = FENCE.match(line)
        if fence is None:
            if match and not (match.group(1)[0] == "`" and "`" in match.group(2)):
                fence = match.group(1)
                continue
            yield number, line
        elif match and match.group(1)[0] == fence[0] and len(match.group(1)) >= len(fence):
            if not match.group(2).strip():
                fence = None


def heading_name(text):
    """Return a heading's name: lower case, without a leading number, closing hashes, a trailing
    parenthetical, or a trailing colon or full stop."""
    name, previous = text.strip(), None
    while name != previous:
        previous = name
        name = re.sub(r"(^|\s)#+$", "", name).strip()
        name = re.sub(r"\([^()]*\)$", "", name).strip()
        name = re.sub(r"[:.]$", "", name).strip()
    return NUMBER.sub("", name).lower()


def sections(lines, level):
    """Yield (heading name, body lines) for every section at the level.

    A section ends at the next heading of its level or a higher one; lines outside every section
    are dropped. The name is given by heading_name.
    """
    marker = "#" * level + " "
    heading, body = None, []
    for line in lines:
        higher = HEADING_LINE.match(line) and len(line) - len(line.lstrip("#")) < level
        if line.startswith(marker) or higher:
            if heading is not None:
                yield heading, body
            heading, body = None, []
            if not higher:
                heading = heading_name(line[len(marker):])
        elif heading is not None:
            body.append(line)
    if heading is not None:
        yield heading, body


def parts(name, body):
    """Yield (run, fixed heading or None, lines) for the readable parts of a level-two section.

    The lines before the first subsection are read only when no subsection is named Spec, Proof,
    Standards or Behaviour: a round that uses those subheadings keeps its findings under them.
    """
    round_match = re.match(r"repair round (\d+), refuted", name)
    if name in HEADINGS:
        run, fixed = "first", name
    elif round_match:
        run, fixed = f"round {round_match.group(1)}", None
    else:
        return
    subsections = list(sections(body, 3))
    if not any(sub in HEADINGS for sub, _ in subsections):
        first = []
        for line in body:
            if line.startswith("### "):
                break
            first.append(line)
        yield run, fixed, first
    for sub, lines in subsections:
        if NOT_READ.match(sub):
            continue
        yield run, sub if sub in HEADINGS else fixed, lines


def reports_nothing(item):
    """Tell whether the item's first sentence says that nothing was found."""
    first = FIRST_SENTENCE.match(item.strip()).group(1)
    return bool(NOTHING_FOUND.match(item.strip()) or OTHERS_REPRODUCE.fullmatch(first))


def findings(path):
    plan = os.path.basename(os.path.dirname(os.path.dirname(os.path.dirname(path))))
    step = os.path.basename(path)[: -len("-refuter.md")]
    text = open(path, encoding="utf-8").read()
    for name, body in sections([line for _, line in unfenced(text)], 2):
        for run, fixed, lines in parts(name, body):
            for item in items(lines):
                if reports_nothing(item):
                    continue
                kind = fixed
                if kind is None:
                    if CLOSURE.search(item):
                        continue
                    trailing = TRAILING.search(item)
                    if trailing:
                        kind = trailing.group(1).lower()
                    elif "not reproduced" in item.lower():
                        kind = "proof"
                    else:
                        kind = "unclassified"
                location = LOCATION.search(item)
                yield {
                    "plan": plan,
                    "step": step,
                    "report": path,
                    "run": run,
                    "heading": kind,
                    "location": location.group(0) if location else "",
                    "text": item,
                }


class RetroError(Exception):
    """A retro that --exclude-listed cannot use; the message says why."""


def listed(retro):
    """Return the (plan, step, run) triples listed under the retro's "## Reports read" heading.

    Each line there is blank or an entry "- `<plan>/agents/reviews/<step>-refuter.md`: <run>, ...",
    where a run is "first" or "round <n>". Raises RetroError when the retro cannot be read, has no
    such heading, or holds a line of another form.
    """
    try:
        text = open(retro, encoding="utf-8").read()
    except (OSError, UnicodeDecodeError):
        raise RetroError(f"cannot read {retro}")
    triples, inside, found = set(), False, False
    for number, line in unfenced(text):
        if HEADING_LINE.match(line) and len(line) - len(line.lstrip("#")) <= 2:
            inside = line.startswith("## ") and heading_name(line[3:]) == "reports read"
            found = found or inside
            continue
        if not inside or not line.strip():
            continue
        entry = ENTRY.fullmatch(line.rstrip())
        parts = entry.group(1).split("/") if entry else []
        if (
            len(parts) != 4
            or parts[0] in ("", ".", "..")
            or parts[1:3] != ["agents", "reviews"]
            or not parts[3].endswith("-refuter.md")
            or parts[3] == "-refuter.md"
        ):
            raise RetroError(f"{retro}:{number}: an entry is {ENTRY_FORM}")
        for run in (run.strip() for run in entry.group(2).split(",")):
            if not RUN.fullmatch(run):
                raise RetroError(f"{retro}:{number}: '{run}' is not a run: first or round <n>")
            triples.add((parts[0], parts[3][: -len("-refuter.md")], run))
    if not found:
        raise RetroError(f"{retro} has no '## Reports read' heading")
    return triples


def main(argv):
    usage = __doc__.strip().splitlines()[2]
    excluded = set()
    if argv and argv[0] == "--exclude-listed":
        if len(argv) < 2:
            print(usage, file=sys.stderr)
            return 2
        try:
            excluded = listed(argv[1])
        except RetroError as error:
            print(f"collect_findings.py: {error}", file=sys.stderr)
            return 2
        argv = argv[2:]
    if not argv:
        print(usage, file=sys.stderr)
        return 2
    count = 0
    for path in reports(argv):
        for finding in findings(path):
            if (finding["plan"], finding["step"], finding["run"]) in excluded:
                continue
            print(json.dumps(finding))
            count += 1
    print(f"{count} findings", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
