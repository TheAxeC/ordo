#!/usr/bin/env python3
"""Compare a repository's shared-rules block and plan-terms block with their templates, and rewrite them on request.

Usage: sync_rules.py <repository root> [--write] [--only glossary]

The shared-rules block is the text of CLAUDE.md between the lines "<!-- ordo:shared-rules begin -->" and "<!-- ordo:shared-rules end -->"; its template is shared-rules.md beside this script. The plan-terms block is the text of docs/glossary.md between "<!-- ordo:plan-terms begin -->" and "<!-- ordo:plan-terms end -->"; its template is plan-terms.md beside this script. A marker string is counted wherever it stands, inside a line of prose too. Each block is compared line by line, so a CRLF file whose block holds the template's lines equals it.

The shared-rules block is checked first, then the plan-terms block. --only glossary checks the plan-terms block alone, for a repository with no shared-rules block, and then neither CLAUDE.md nor shared-rules.md is read. Every file is read and every block located before anything is written or printed on stdout, so an error in any file writes nothing. Each file in error prints its own "error:" line, in the order the files are read: shared-rules.md, CLAUDE.md, plan-terms.md, docs/glossary.md.

--write replaces the text between the two markers of each block that differs with its template and keeps every byte outside them. It writes the block with the file's own line ending: CRLF or LF, whichever most of its lines end with, and the first line's ending on a tie. It then reads the file back to check that it holds what was written. CLAUDE.md is written first, and a failed write or read-back of it stops before docs/glossary.md is written.

Exit status: 0 when every block checked equals its template (or was just rewritten with --write); 1 when a block differs, with the unified diff of each differing block printed under its file's name; 2 when CLAUDE.md is missing, when CLAUDE.md or docs/glossary.md has no single block (a missing docs/glossary.md included), when a file cannot be read or is not UTF-8, and when --write cannot write a file or the file does not read back as written. The "ok:" and "written:" lines and the diffs go to stdout, the shared-rules block's first; each "error:" line goes to stderr.

The lines on stdout, besides the diffs, which are labelled "CLAUDE.md (shared rules)" or "docs/glossary.md (plan terms)" against "template":
    ok: the shared-rules block equals the template
    ok: the plan-terms block equals the template
    written: the shared-rules block now equals the template
    written: the plan-terms block now equals the template

The error lines of exit 2. The first two name a block to draft:
    error: CLAUDE.md has no single shared-rules block (<begin marker> ... <end marker>)
    error: docs/glossary.md has no single plan-terms block (<begin marker> ... <end marker>)
The others name a file to fix before the check can run:
    error: no CLAUDE.md in <root>
    error: <path> is not UTF-8 (byte <n>)
    error: cannot read <path>: <reason>
    error: cannot write <path>: <reason>
    error: <path> does not read back as written
The usage line, on stderr, also exits 2: for no path or a second path, and for --only with no value, with a value other than glossary, given twice, or written as --only=glossary.
"""
import difflib
import os
import sys

SHARED_RULES = {
    "name": "shared-rules",
    "page": "CLAUDE.md",
    "label": "CLAUDE.md (shared rules)",
    "template": "shared-rules.md",
    "begin": "<!-- ordo:shared-rules begin -->",
    "end": "<!-- ordo:shared-rules end -->",
}
PLAN_TERMS = {
    "name": "plan-terms",
    "page": "docs/glossary.md",
    "label": "docs/glossary.md (plan terms)",
    "template": "plan-terms.md",
    "begin": "<!-- ordo:plan-terms begin -->",
    "end": "<!-- ordo:plan-terms end -->",
}


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


def arguments(argv):
    """The root, --write and --only glossary, in any order; None when the usage line is due."""
    root = None
    write = False
    only = False
    rest = list(argv)
    while rest:
        arg = rest.pop(0)
        if arg == "--write":
            write = True
        elif arg == "--only":
            if only or not rest or rest.pop(0) != "glossary":
                return None
            only = True
        elif arg.startswith("--only") or root is not None:
            return None
        else:
            root = arg
    if root is None:
        return None
    return root, write, only


def load(root, here, block):
    """The block's path, its file's text, the span between its markers and its template; None after the error line of each file in error."""
    template = read(os.path.join(here, block["template"]))
    path = os.path.join(root, block["page"])
    if block is SHARED_RULES and not os.path.isfile(path):
        print(f"error: no CLAUDE.md in {root}", file=sys.stderr)
        return None
    text = read(path) if os.path.exists(path) else ""
    if text is None:
        return None
    begin, end = block["begin"], block["end"]
    if text.count(begin) != 1 or text.count(end) != 1 or text.index(begin) > text.index(end):
        print(
            f"error: {block['page']} has no single {block['name']} block ({begin} ... {end})",
            file=sys.stderr,
        )
        return None
    if template is None:
        return None
    start = text.index(begin) + len(begin)
    stop = text.index(end)
    return path, text, start, stop, template.replace("\r\n", "\n").strip("\n")


def rewrite(path, text, start, stop, template):
    """Writes the template between the markers and reads the file back; False after an error line."""
    eol = line_ending(text)
    rewritten = text[:start] + eol + template.replace("\n", eol) + eol + text[stop:]
    try:
        with open(path, "w", encoding="utf-8", newline="") as out:
            out.write(rewritten)
    except OSError as error:
        print(f"error: cannot write {path}: {error.strerror}", file=sys.stderr)
        return False
    reread = read(path)
    if reread is None:
        return False
    if reread != rewritten:
        print(f"error: {path} does not read back as written", file=sys.stderr)
        return False
    return True


def main(argv):
    parsed = arguments(argv)
    if parsed is None:
        print(__doc__.strip().splitlines()[2], file=sys.stderr)
        return 2
    root, write, only = parsed
    root = os.path.abspath(root)
    here = os.path.dirname(os.path.realpath(__file__))
    blocks = [PLAN_TERMS] if only else [SHARED_RULES, PLAN_TERMS]
    loaded = [load(root, here, block) for block in blocks]
    if None in loaded:
        return 2
    status = 0
    for block, (path, text, start, stop, template) in zip(blocks, loaded):
        current = text[start:stop].replace("\r\n", "\n").strip("\n")
        if current == template:
            print(f"ok: the {block['name']} block equals the template")
        elif write:
            if not rewrite(path, text, start, stop, template):
                return 2
            print(f"written: the {block['name']} block now equals the template")
        else:
            diff = difflib.unified_diff(
                current.splitlines(), template.splitlines(), block["label"], "template", lineterm=""
            )
            print("\n".join(diff))
            status = 1
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
