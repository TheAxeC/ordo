#!/usr/bin/env python3
"""Collect the findings of every refuter report under the given folders, one JSON object per line.

Usage: collect_findings.py [--exclude-listed <earlier retro>] <folder>...

A refuter report is a file named <step>-refuter.md in an agents/reviews/ folder; its plan is the folder
that holds agents/. A finding is a bullet under a Spec, Proof, Standards or Behaviour heading (numbered
or not), or a bullet in a "Repair round <n>, refuted" section, whose heading is the word it ends with.
A bullet that says "none" is not a finding, and neither is a round's bullet that reports a closure
(": closed" or a leading "Closed"). A round's bullet that ends with no heading word and says a claim was
"not reproduced" is a proof finding. The Verification, Closed and Not checked sections are not read.
With --exclude-listed, a report whose path appears in the given file is skipped, so a retro can start
where the previous one ended.

Each line: {"plan", "step", "report", "run", "heading", "location", "text"}. The run is "first" or
"round <n>"; the heading is spec, proof, standards, behaviour or unclassified; the location is the first
path:line the bullet names, or "".
"""
import json
import os
import re
import sys

HEADINGS = ("spec", "proof", "standards", "behaviour")
LOCATION = re.compile(r"[\w./-]+\.[A-Za-z]+:\d+(?:-\d+)?")
TRAILING = re.compile(r"\b(Spec|Proof|Standards|Behaviour)\.\s*$")
CLOSURE = re.compile(r"(^closed\b|: closed\b)", re.I)


def reports(folders, excluded):
    """Yield each report once, however many of the folders hold it."""
    seen = set()
    for folder in folders:
        for dirpath, _, files in os.walk(folder):
            if not dirpath.replace(os.sep, "/").endswith("agents/reviews"):
                continue
            for name in sorted(files):
                if name.endswith("-refuter.md"):
                    path = os.path.join(dirpath, name)
                    real = os.path.realpath(path)
                    if path not in excluded and real not in seen:
                        seen.add(real)
                        yield path


def bullets(lines):
    """Join each top-level bullet with its continuation lines."""
    current = None
    for line in lines:
        if line.startswith("- "):
            if current is not None:
                yield current
            current = line[2:].strip()
        elif current is not None and line.startswith("  ") and line.strip():
            current += " " + line.strip()
        elif current is not None and not line.strip():
            yield current
            current = None
    if current is not None:
        yield current


def sections(text):
    """Yield (heading line, body lines) for every level-two section, code fences skipped."""
    heading, body, fenced = None, [], False
    for line in text.splitlines():
        if line.startswith("```"):
            fenced = not fenced
            continue
        if fenced:
            continue
        if line.startswith("## "):
            if heading is not None:
                yield heading, body
            heading, body = line[3:].strip(), []
        elif heading is not None:
            body.append(line)
    if heading is not None:
        yield heading, body


def findings(path):
    plan = os.path.basename(os.path.dirname(os.path.dirname(os.path.dirname(path))))
    step = os.path.basename(path)[: -len("-refuter.md")]
    text = open(path, encoding="utf-8").read()
    for heading, body in sections(text):
        name = re.sub(r"^\d+\.\s*", "", heading).strip().lower()
        round_match = re.match(r"repair round (\d+), refuted", name)
        if name in HEADINGS:
            run, fixed = "first", name
        elif round_match:
            run, fixed = f"round {round_match.group(1)}", None
        else:
            continue
        for item in bullets(body):
            if re.fullmatch(r"none\.?", item.strip(), re.I) or item.lower().startswith("none."):
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


def main(argv):
    excluded = set()
    if len(argv) >= 2 and argv[0] == "--exclude-listed":
        listed = open(argv[1], encoding="utf-8").read()
        excluded = {token for token in re.findall(r"[^\s`()]+-refuter\.md", listed)}
        argv = argv[2:]
    if not argv:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    count = 0
    for path in reports(argv, excluded):
        for finding in findings(path):
            print(json.dumps(finding))
            count += 1
    print(f"{count} findings", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
