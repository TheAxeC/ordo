#!/usr/bin/env python3
"""Compare a repository's shared-rules block with the template, and rewrite it on request.

Usage: sync_rules.py <repository root> [--write]

The block is the text of CLAUDE.md between the lines "<!-- ordo:shared-rules begin -->" and
"<!-- ordo:shared-rules end -->"; the template is shared-rules.md beside this script. AGENTS.md
must be a symlink to CLAUDE.md, so both runners read the same text. The block is compared line by
line, so a CRLF file whose block holds the template's lines equals it.

--write replaces the text between the two markers with the template and keeps every byte outside
them. It writes the block with the file's own line ending: CRLF or LF, whichever most of its lines
end with, and the first line's ending on a tie. It then reads the file back to check that it holds
what was written.

Exit status: 0 when the block equals the template (or was just rewritten with --write), 1 when it
differs (the unified diff is printed), 2 when CLAUDE.md is missing, has no single block, or
AGENTS.md is not a symlink to it; when CLAUDE.md or shared-rules.md cannot be read or is not UTF-8;
and when --write cannot write CLAUDE.md or the file does not read back as written. The "ok:" and
"written:" lines and the diff go to stdout; each "error:" line goes to stderr.

The error lines of exit 2. The first two name a block or a link to draft:
    error: CLAUDE.md has no single shared-rules block (<begin marker> ... <end marker>)
    error: AGENTS.md is not a symlink to CLAUDE.md
The others name a file to fix before the check can run:
    error: no CLAUDE.md in <root>
    error: <path> is not UTF-8 (byte <n>)
    error: cannot read <path>: <reason>
    error: cannot write <path>: <reason>
    error: <path> does not read back as written
The usage line, on stderr, also exits 2.
"""
import difflib
import os
import sys

BEGIN = "<!-- ordo:shared-rules begin -->"
END = "<!-- ordo:shared-rules end -->"


def read(path):
    """The file's text with its line endings as written, or None after an error line on stderr."""
    try:
        with open(path, encoding="utf-8", newline="") as handle:
            return handle.read()
    except UnicodeDecodeError as error:
        print(f"error: {path} is not UTF-8 (byte {error.start})", file=sys.stderr)
    except OSError as error:
        print(f"error: cannot read {path}: {error.strerror}", file=sys.stderr)
    return None


def line_ending(text):
    """The ending most of the text's lines use, CRLF or LF; a tie takes the first line's."""
    crlf = text.count("\r\n")
    lf = text.count("\n") - crlf
    if crlf != lf:
        return "\r\n" if crlf > lf else "\n"
    first_newline = text.find("\n")
    return "\r\n" if first_newline > 0 and text[first_newline - 1] == "\r" else "\n"


def main(argv):
    write = "--write" in argv
    args = [a for a in argv if a != "--write"]
    if len(args) != 1:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    root = os.path.abspath(args[0])
    here = os.path.dirname(os.path.realpath(__file__))
    template = read(os.path.join(here, "shared-rules.md"))
    if template is None:
        return 2
    template = template.replace("\r\n", "\n").strip("\n")
    claude = os.path.join(root, "CLAUDE.md")
    agents = os.path.join(root, "AGENTS.md")
    if not os.path.isfile(claude):
        print(f"error: no CLAUDE.md in {root}", file=sys.stderr)
        return 2
    if not (os.path.islink(agents) and os.path.realpath(agents) == os.path.realpath(claude)):
        print("error: AGENTS.md is not a symlink to CLAUDE.md", file=sys.stderr)
        return 2
    text = read(claude)
    if text is None:
        return 2
    if text.count(BEGIN) != 1 or text.count(END) != 1 or text.index(BEGIN) > text.index(END):
        print(
            f"error: CLAUDE.md has no single shared-rules block ({BEGIN} ... {END})",
            file=sys.stderr,
        )
        return 2
    start = text.index(BEGIN) + len(BEGIN)
    stop = text.index(END)
    block = text[start:stop].replace("\r\n", "\n").strip("\n")
    if block == template:
        print("ok: the shared-rules block equals the template")
        return 0
    if write:
        eol = line_ending(text)
        rewritten = text[:start] + eol + template.replace("\n", eol) + eol + text[stop:]
        try:
            with open(claude, "w", encoding="utf-8", newline="") as out:
                out.write(rewritten)
        except OSError as error:
            print(f"error: cannot write {claude}: {error.strerror}", file=sys.stderr)
            return 2
        reread = read(claude)
        if reread is None:
            return 2
        if reread != rewritten:
            print(f"error: {claude} does not read back as written", file=sys.stderr)
            return 2
        print("written: the shared-rules block now equals the template")
        return 0
    diff = difflib.unified_diff(
        block.splitlines(),
        template.splitlines(),
        "CLAUDE.md (shared rules)",
        "template",
        lineterm="",
    )
    print("\n".join(diff))
    return 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
