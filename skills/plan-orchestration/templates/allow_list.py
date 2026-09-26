#!/usr/bin/env python3
"""Print the allow list of a step's builder: the command prefixes it may run, one per line.

Usage: allow_list.py <state file> [<command>]...

The state file's configuration block is its first yaml or yml block (any case of the fence word).
When the block's worker_allow: is a non-empty list, its entries are the list, in order, each
stripped of surrounding blanks. When it is [], empty or left out, the list is built from each
command of the block's verify: list and then each <command> given (the brief's own check commands).

Each command is split into its simple commands at |, ||, &&, ;, & and a newline outside quotes.
Each redirection is removed with its target (2>&1, >file, >>file, <file, 0<&3, >|file, <>file,
2>/dev/null, and the same with a space before the target). A comment (a word starting with #) is
removed to the end of its line. The prefix of a simple command is its words, joined by one space,
up to the first word holding a character no permission rule can hold: a quote, $, a backtick, a
backslash, (, ), {, }, [, ], a comma, * or ?. A claude rule holding such a word is cut apart or
ignored, while the prefix before it matches the command with any further arguments.

A command that holds $( or a backtick outside single quotes, or (, ), { or } outside quotes, is
refused, since its parts are not simple commands. So is a simple command whose first word holds
such a character or is a shell keyword. Each prefix is printed once, where it is first seen.
launch.sh passes each line to a claude builder as --allowedTools "Bash(<line>:*)".

Exit status and output:
  0   the list on stdout, one prefix per line.
  64  one "allow_list.py: " line on stderr and nothing on stdout: no state file argument; a state
      file that cannot be read or is not UTF-8; no yaml block, or a first yaml block that is never
      closed, is not valid YAML or is not a mapping; a worker_allow that is not a list, or holds an
      entry that is not a non-empty one-line string or holds a character no rule can hold; a
      verify that is not a list, or holds a command that is not a string; a command that is
      empty, has a quote that is not closed, holds a carriage return, or is refused as above;
      an empty list.
  69  python3 cannot import yaml (PyYAML).
"""
import re
import sys

FENCE_OPEN = re.compile(r" {0,3}(`{3,}|~{3,})\s*([^`\s]*)[^`]*")
# || and && split as two | or two &, and the empty command between them is dropped.
SEPARATORS = ("|", ";", "&", "\n")
# <> is read as < then >, which removes the same target.
REDIRECTIONS = (">>", ">&", "<&", ">|", ">", "<")
# The characters a word of a permission rule cannot hold, and the shell keywords a simple command
# cannot start with.
UNRULY = set("'\"$`\\(){}[],*?")
KEYWORDS = {"if", "then", "else", "elif", "fi", "for", "while", "until", "do", "done", "case",
            "esac", "!"}


class Refusal(Exception):
    """A state file, an argument or a value the script cannot use; the message says why."""


def read(path):
    try:
        with open(path, encoding="utf-8") as handle:
            return handle.read()
    except UnicodeDecodeError:
        raise Refusal(f"{path} is not UTF-8")
    except OSError as error:
        raise Refusal(f"cannot read {path}: {error.strerror or error}")


def configuration(state):
    """Return the first yaml or yml block of the state file, parsed, as a mapping."""
    import yaml

    blocks, fence, lines = [], None, None
    for line in read(state).split("\n"):
        if fence is None:
            match = FENCE_OPEN.fullmatch(line)
            if match:
                fence = match.group(1)
                lines = [] if match.group(2).lower() in ("yaml", "yml") else None
                if lines is not None:
                    blocks.append(lines)
        elif re.fullmatch(r" {0,3}" + re.escape(fence[0]) + "{" + str(len(fence)) + r",}\s*", line):
            fence, lines = None, None
        elif lines is not None:
            lines.append(line)
    if not blocks:
        raise Refusal(f"{state} has no yaml block")
    first = blocks[0]
    if first is lines:
        raise Refusal(f"the first yaml block of {state} is not closed")
    try:
        data = yaml.safe_load("\n".join(first))
    except yaml.YAMLError as error:
        raise Refusal(f"the first yaml block of {state} is not valid YAML: "
                      + str(error).replace("\n", " "))
    if not isinstance(data, dict):
        raise Refusal(f"the first yaml block of {state} is not a mapping")
    return data


def simple_commands(command):
    """Return the simple commands of a command line, each the list of its words.

    Quotes and backslashes are kept as written; a separator, a redirection or a comment inside
    quotes, or after a backslash, is part of its word. $( or a backtick outside single quotes, and
    (, ), { or } outside quotes, are refused.
    """
    grouped = Refusal(f"holds $( or a backtick outside single quotes, or (, ), {{ or }} outside "
                      f"quotes: {command}")
    commands, words, word = [], [], None
    drop_next = False
    i, n = 0, len(command)

    def end_word():
        nonlocal word, drop_next
        if word is not None:
            if drop_next:
                drop_next = False
            else:
                words.append(word)
        word = None

    def end_command():
        nonlocal words, drop_next
        end_word()
        drop_next = False
        if words:
            commands.append(words)
        words = []

    while i < n:
        c = command[i]
        if c in " \t":
            end_word()
            i += 1
            continue
        separator = next((s for s in SEPARATORS if command.startswith(s, i)), None)
        if separator:
            end_command()
            i += len(separator)
            continue
        redirection = next((r for r in REDIRECTIONS if command.startswith(r, i)), None)
        if redirection:
            if word is not None and word.isdigit():
                word = None
            end_word()
            drop_next = True
            i += len(redirection)
            continue
        if c == "#" and word is None:
            while i < n and command[i] != "\n":
                i += 1
            continue
        if c == "\\":
            if command.startswith("\n", i + 1):
                i += 2
                continue
            word = (word or "") + command[i:i + 2]
            i += 2
            continue
        if c in "'\"":
            j = i + 1
            while j < n and command[j] != c:
                if c == '"' and (command[j] == "`" or command.startswith("$(", j)):
                    raise grouped
                j += 2 if c == '"' and command[j] == "\\" else 1
            if j >= n:
                raise Refusal(f"has a quote that is not closed: {command}")
            word = (word or "") + command[i:j + 1]
            i = j + 1
            continue
        if c in "(){}`" or command.startswith("$(", i):
            raise grouped
        word = (word or "") + c
        i += 1
    end_command()
    return commands


def rule_prefix(words, command):
    """Return the words up to the first one holding a character no rule can hold, joined."""
    first = words[0]
    if first in KEYWORDS or UNRULY & set(first):
        raise Refusal(f"the command starts a simple command with {first}, which no rule can hold: "
                      f"{command}")
    kept = []
    for word in words:
        if UNRULY & set(word):
            break
        kept.append(word)
    return " ".join(kept)


def one_line(entry):
    if not isinstance(entry, str) or "\n" in entry or "\r" in entry:
        return False
    return entry.strip() != ""


def allow_list(state, commands):
    config = configuration(state)
    allow = config.get("worker_allow")
    if allow is not None and not isinstance(allow, list):
        raise Refusal(f"worker_allow is not a list: {allow!r}")
    for entry in allow or []:
        if not one_line(entry):
            raise Refusal(f"worker_allow holds an entry that is not a non-empty one-line string: "
                          f"{entry!r}")
        if UNRULY & set(entry):
            raise Refusal(f"worker_allow holds an entry with a character no rule can hold: "
                          f"{entry!r}")
    if allow:
        prefixes = [entry.strip() for entry in allow]
    else:
        verify = config.get("verify")
        if verify is None:
            verify = []
        if not isinstance(verify, list):
            raise Refusal(f"verify is not a list: {verify!r}")
        for entry in verify:
            if not isinstance(entry, str):
                raise Refusal(f"verify holds a command that is not a string: {entry!r}")
        prefixes = []
        for command in verify + commands:
            if not command.strip():
                raise Refusal("a command is empty")
            if "\r" in command:
                raise Refusal(f"the command holds a carriage return: {command!r}")
            try:
                found = simple_commands(command)
            except Refusal as refusal:
                raise Refusal(f"the command {refusal}")
            prefixes += [rule_prefix(words, command) for words in found]
    unique = []
    for prefix in prefixes:
        if prefix not in unique:
            unique.append(prefix)
    if not unique:
        raise Refusal(f"the allow list is empty: {state} gives no command")
    return unique


def main(argv):
    if not argv:
        raise Refusal("usage: allow_list.py <state file> [<command>]...")
    print("\n".join(allow_list(argv[0], argv[1:])))
    return 0


if __name__ == "__main__":
    try:
        import yaml  # noqa: F401
    except ImportError:
        print("allow_list.py: python3 cannot import yaml; install PyYAML", file=sys.stderr)
        sys.exit(69)
    try:
        sys.exit(main(sys.argv[1:]))
    except Refusal as refusal:
        print(f"allow_list.py: {refusal}", file=sys.stderr)
        sys.exit(64)
