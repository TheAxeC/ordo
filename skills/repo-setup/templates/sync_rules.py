#!/usr/bin/env python3
"""Compare a repository's shared-rules block with the template, and rewrite it on request.

Usage: sync_rules.py <repository root> [--write]

The block is the text of CLAUDE.md between the lines "<!-- ordo:shared-rules begin -->" and
"<!-- ordo:shared-rules end -->"; the template is shared-rules.md beside this script. AGENTS.md must be
a symlink to CLAUDE.md, so both runners read the same text.

Exit status: 0 when the block equals the template (or was just rewritten with --write), 1 when it
differs (the unified diff is printed), 2 when CLAUDE.md is missing, has no block, or AGENTS.md is not
a symlink to it.
"""
import difflib
import os
import sys

BEGIN = "<!-- ordo:shared-rules begin -->"
END = "<!-- ordo:shared-rules end -->"


def main(argv):
    write = "--write" in argv
    args = [a for a in argv if a != "--write"]
    if len(args) != 1:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    root = os.path.abspath(args[0])
    here = os.path.dirname(os.path.realpath(__file__))
    template = open(os.path.join(here, "shared-rules.md"), encoding="utf-8").read().strip("\n")
    claude = os.path.join(root, "CLAUDE.md")
    agents = os.path.join(root, "AGENTS.md")
    if not os.path.isfile(claude):
        print(f"error: no CLAUDE.md in {root}")
        return 2
    if not (os.path.islink(agents) and os.path.realpath(agents) == os.path.realpath(claude)):
        print("error: AGENTS.md is not a symlink to CLAUDE.md")
        return 2
    text = open(claude, encoding="utf-8").read()
    if text.count(BEGIN) != 1 or text.count(END) != 1 or text.index(BEGIN) > text.index(END):
        print(f"error: CLAUDE.md has no single shared-rules block ({BEGIN} ... {END})")
        return 2
    start = text.index(BEGIN) + len(BEGIN)
    stop = text.index(END)
    block = text[start:stop].strip("\n")
    if block == template:
        print("ok: the shared-rules block equals the template")
        return 0
    if write:
        with open(claude, "w", encoding="utf-8") as out:
            out.write(text[:start] + "\n" + template + "\n" + text[stop:])
        reread = open(claude, encoding="utf-8").read()
        if reread[reread.index(BEGIN) + len(BEGIN):reread.index(END)].strip("\n") != template:
            print("error: the rewritten block does not equal the template")
            return 2
        print("written: the shared-rules block now equals the template")
        return 0
    diff = difflib.unified_diff(
        block.splitlines(), template.splitlines(), "CLAUDE.md (shared rules)", "template", lineterm=""
    )
    print("\n".join(diff))
    return 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
