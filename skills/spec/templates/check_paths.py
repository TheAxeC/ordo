#!/usr/bin/env python3
"""Check that a step's brief writes no path a brief of a step in flight writes.

Usage: check_paths.py <state file> <step>

The steps in flight are the entries of the dispatch block: the dispatch: key of the first yaml or
yml block of the state file that has one: "none", one entry with a step: key (the shape the state
template gives when workers_at_once is 1), or a list of entries each with a step: key. A step's
brief is agents/briefs/<step>.md beside the state file, and the paths it writes are the list items
of its "## Paths this step writes" section, up to the next heading of level one or two; lines
inside a fence of three or more backticks or tildes are not read. Each list item there is one of

    - `<path>`
    - `<path>` lines <a>-<b>

the first naming the whole file, the second lines a to b of it (1 <= a <= b); a line that is not a
list item is prose and is not read. A path is relative to the repository root and is compared in
normal form, so ./a.sh and a.sh are one file.

The step's brief is compared with the brief of every other step in the block, whatever its landing
state. Two briefs share a path when they name the same file and one of them names it whole, or
both name ranges of it that overlap.

Exit status and output:
  0   one line on stdout: "ok: <step> shares no path with <the steps compared, or no step in
      flight>".
  1   one line on stdout per shared path: "shared: <path> (<range or whole>) in <step> and <range
      or whole> in <other step>", a range written "lines <a>-<b>".
  64  one "error: " line on stderr and nothing on stdout: a wrong number of arguments, a step name
      that is empty or is not letters, digits, ".", "_" and "-" starting with a letter or digit;
      a state file or brief that is missing or not UTF-8; no yaml block, a yaml block not closed
      or not valid YAML, no yaml block with a dispatch: key, or a dispatch: that is neither none,
      an entry with step:, nor a list of entries with step:; a brief with no "## Paths this step
      writes" section or no list item in it, a list item in neither shape, a range whose end is
      before its start, or a path that is absolute or leaves the repository.
  69  python3 cannot import yaml (PyYAML).
"""
import os
import posixpath
import re
import sys

SECTION = "## Paths this step writes"
FENCE_OPEN = re.compile(r" {0,3}(`{3,}|~{3,})\s*([^`\s]*)[^`]*")
HEADING = re.compile(r"#{1,2}(\s|$)")
LIST_ITEM = re.compile(r"\s*([-*+]|\d+[.)])(\s|$)")
PATH_LINE = re.compile(r"- `([^`]+)`(?: lines ([1-9]\d*)-([1-9]\d*))?")
PATH_FORM = "- `<path>` or - `<path>` lines <a>-<b>"
STEP = re.compile(r"[A-Za-z0-9][A-Za-z0-9._-]*")


class Refusal(Exception):
    """A state file, a brief or an argument the check cannot use; the message says why."""


def read(path):
    try:
        with open(path, encoding="utf-8") as handle:
            return handle.read()
    except UnicodeDecodeError:
        raise Refusal(f"{path} is not UTF-8")
    except OSError as error:
        raise Refusal(f"cannot read {path}: {error.strerror or error}")


def unfenced(text):
    """Yield (line number, line, block) for each line of the text but a fence's closing line.

    The block is None for a line outside every fence, and (index, info word in lower case) for a
    fence's opening line and each line inside it, the index counting the fences from 0, so a caller
    reads the lines of each yaml block and skips the rest. An opening line is yielded with the line
    None, so an empty block is still seen. The last item is (None, None, block) when a fence is
    never closed.
    """
    fence, block, count = None, None, 0
    for number, line in enumerate(text.split("\n"), 1):
        if fence is None:
            match = FENCE_OPEN.fullmatch(line)
            if match:
                fence, block = match.group(1), (count, match.group(2).lower())
                count += 1
                yield number, None, block
                continue
            yield number, line, None
        elif re.fullmatch(r" {0,3}" + re.escape(fence[0]) + "{" + str(len(fence)) + r",}\s*", line):
            fence, block = None, None
        else:
            yield number, line, block
    if fence is not None:
        yield None, None, block


def steps_in_flight(state):
    """Return the step names of the state file's dispatch block, in order, each once."""
    import yaml

    blocks = {}
    for number, line, block in unfenced(read(state)):
        if block is None or block[1] not in ("yaml", "yml"):
            continue
        if number is None:
            raise Refusal(f"a yaml block of {state} is not closed")
        lines = blocks.setdefault(block[0], [])
        if line is not None:
            lines.append(line)
    if not blocks:
        raise Refusal(f"{state} has no yaml block")
    for block in blocks.values():
        try:
            data = yaml.safe_load("\n".join(block))
        except yaml.YAMLError as error:
            raise Refusal(f"a yaml block of {state} is not valid YAML: "
                          + str(error).replace("\n", " "))
        if isinstance(data, dict) and "dispatch" in data:
            break
    else:
        raise Refusal(f"no yaml block of {state} has a dispatch: key")
    dispatch = data["dispatch"]
    if dispatch == "none":
        return []
    shape = (f"the dispatch: key of {state} is neither none, an entry with step:, nor a list of "
             "entries with step:")
    if isinstance(dispatch, dict):
        dispatch = [dispatch]
    if not isinstance(dispatch, list) or not dispatch:
        raise Refusal(shape)
    names = []
    for entry in dispatch:
        value = entry.get("step") if isinstance(entry, dict) else None
        if isinstance(value, bool) or not isinstance(value, (str, int, float)):
            raise Refusal(shape)
        name = step_name(str(value))
        if name not in names:
            names.append(name)
    return names


def step_name(name):
    if not STEP.fullmatch(name):
        raise Refusal(f"step '{name}' is not a step name: letters, digits, '.', '_' and '-', "
                      "starting with a letter or digit")
    return name


def paths_written(brief):
    """Return (path, range) for each list item of the brief's paths section, in order.

    The range is None for the whole file, or the pair (a, b) of its first and last line.
    """
    found, inside, paths = False, False, []
    for number, line, block in unfenced(read(brief)):
        if block is not None:
            continue
        if HEADING.match(line):
            inside = line.rstrip() == SECTION
            found = found or inside
            continue
        if not inside or not LIST_ITEM.match(line):
            continue
        match = PATH_LINE.fullmatch(line.rstrip())
        if not match:
            raise Refusal(f"{brief}:{number}: '{line.rstrip()}' is not {PATH_FORM}")
        path = posixpath.normpath(match.group(1))
        if path.startswith("/") or path == ".." or path.startswith("../"):
            raise Refusal(f"{brief}:{number}: {match.group(1)} is not a relative path inside "
                          "the repository")
        span = None
        if match.group(2):
            span = (int(match.group(2)), int(match.group(3)))
            if span[1] < span[0]:
                raise Refusal(f"{brief}:{number}: the range {span[0]}-{span[1]} ends before it "
                              "starts")
        paths.append((path, span))
    if not found:
        raise Refusal(f"{brief} has no '{SECTION}' section")
    if not paths:
        raise Refusal(f"{brief} lists no path under '{SECTION}'")
    return paths


def described(span):
    return "whole" if span is None else f"lines {span[0]}-{span[1]}"


def shared(mine, theirs):
    """Return whether two (path, range) items name a line of the same file."""
    if mine[0] != theirs[0]:
        return False
    if mine[1] is None or theirs[1] is None:
        return True
    return mine[1][0] <= theirs[1][1] and theirs[1][0] <= mine[1][1]


def main(argv):
    if len(argv) != 2:
        raise Refusal("usage: check_paths.py <state file> <step>")
    state, step = argv[0], step_name(argv[1])
    briefs = os.path.join(os.path.dirname(state), "agents", "briefs")
    others = [name for name in steps_in_flight(state) if name != step]
    mine = paths_written(os.path.join(briefs, step + ".md"))
    lines = []
    for other in others:
        for theirs in paths_written(os.path.join(briefs, other + ".md")):
            for item in mine:
                line = (f"shared: {item[0]} ({described(item[1])}) in {step} and "
                        f"{described(theirs[1])} in {other}")
                if shared(item, theirs) and line not in lines:
                    lines.append(line)
    if lines:
        print("\n".join(lines))
        return 1
    print(f"ok: {step} shares no path with {', '.join(others) or 'no step in flight'}")
    return 0


if __name__ == "__main__":
    try:
        import yaml  # noqa: F401
    except ImportError:
        print("error: python3 cannot import yaml; install PyYAML", file=sys.stderr)
        sys.exit(69)
    try:
        sys.exit(main(sys.argv[1:]))
    except Refusal as refusal:
        print(f"error: {refusal}", file=sys.stderr)
        sys.exit(64)
