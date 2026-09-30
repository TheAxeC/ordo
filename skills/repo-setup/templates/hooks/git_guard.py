"""Refuse the git commands an agent must not run by itself, as a Claude Code PreToolUse hook.

Run it as the command of a PreToolUse hook: `python3 <path>/git_guard.py`. Claude Code writes the
event as JSON on stdin. When `tool_input` holds a string `command`, that command is checked,
whatever the tool (Bash, Monitor and any other tool that runs a shell command are guarded alike).
Any other input, including text that is not JSON and empty input, is allowed.

The command is read with a lexer written in this file that follows the POSIX shell and bash as far
as the forms below go. It splits the text into simple commands on newlines and the operators ; & &&
|| | |& ( ) and looks inside command substitutions ($( ) and backticks), process substitutions,
$( ) inside double quotes, ${ } expansions (${NAME:-word}, ${NAME-word}, ${NAME:=word} and
${NAME=word} give their word), arithmetic in (( )) and $(( )), here-documents, here-strings, brace
expansions with a comma list (a word that expands to nothing is removed), $'...' and $"..."
quoting, `sh -c` strings (after combined option words such as -co errexit), a shell reading its
script from stdin (no operand, -s, - or /dev/stdin), `eval` and these wrappers: env, command,
builtin, exec, nohup, nice, time, timeout, sudo, doas, stdbuf, setsid, unbuffer, ionice, chrt,
script (its -c string, or the words after its file), xargs (with the words an echo or printf pipes
into it, appended or put in place of the string of -I), watch, and find with -exec, -execdir, -ok
and -okdir. printf's output is its format filled with its arguments, %b decoding
their escapes. It reads `function NAME` and `coproc` as reserved words. Each simple command whose
command word is git (or a glob pattern that matches git, such as gi?) is checked, after git's
global options (-C, -c, --git-dir, --work-tree and the others) and after configuration given
inline: -c, --config-env with the variable assigned in the same command, GIT_CONFIG_KEY_<n> with
GIT_CONFIG_VALUE_<n>, and GIT_CONFIG_PARAMETERS. An alias defined by that configuration is
expanded; an alias that starts with ! is checked as its text followed by the arguments git appends,
and the inline configuration is carried into the git commands that text runs.

Blocked, because the user runs these by hand (they publish work or destroy it):
- git push, with any arguments, --dry-run included.
- git reset with --hard, or a long option that is a unique prefix of it (--ha and longer).
- git clean with --force (or a prefix from --fo), with a short-option word holding f (-f, -fd,
  -xdf), or with clean.requireForce set to false, no, off, the empty string or an integer 0 (00,
  -0, 0x0, 0k) by inline configuration and no -n or --dry-run.
- git checkout or git restore with a whole-tree pathspec among its arguments: ., ./, ./., *, **,
  .., ../, :/, :/., :/*, :(top), :(top)., :(literal)., a glob pathspec of * or **, or a set of
  pathspecs that are all excludes (:!x, :^x, :(exclude)x). git restore that restores only the index
  (--staged or -S without --worktree or -W) discards no work and is allowed.

Allowed, so the plan skills' own commands run: everything else, among it git branch -D, git
worktree remove, git restore -- <paths>, git restore --staged --worktree -- <paths>, git checkout
--theirs -- <path>, git checkout <branch>, git checkout -b, git reset --soft, git clean -n, git log,
git diff -- . and text that only names a blocked command, such as echo "git push" or a commit
message. A command the shell would refuse (an unbalanced quote) is allowed, and the words read
before the fault are still checked. A command of any nesting depth is read.

Not seen: a command another program runs (a script, make, python3 -c); a git alias defined in a
configuration file; git configuration from variables exported by an earlier command (export
GIT_CONFIG_COUNT=1 or GIT_CONFIG_PARAMETERS=..., then git in a later command); a command word or
option that a variable's value, a positional parameter, $@ or a substitution supplies ($g push,
$(echo git) push); the output of a command piped into a shell or into xargs other than the
arguments of echo and printf; a brace expansion of more than 256 words or of a word longer than
4096 characters; and any form of shell syntax this list of forms does not name.

Not blocked, because they are not among the five operations above: git checkout -f <branch>,
git switch --discard-changes, git stash drop, git stash clear, git send-pack and git subtree push.

Output and exit status. The script gives two exit statuses. Exit 0 lets the command run and prints
nothing. Exit 2 blocks it and prints one line on stderr, which Claude Code gives to the agent:
    git-guard: blocked: <the simple command, its words joined by spaces> (<the rule>)
The first blocked simple command decides. The script reads stdin only and prints nothing else.
"""

from __future__ import annotations

import json
import re
import sys
from collections import deque
from dataclasses import dataclass, field
from fnmatch import fnmatchcase

_MAX_BRACE_WORDS = 256
_MAX_BRACE_LENGTH = 4096

_PLAIN = re.compile(r"[^ \t\n\\'\"$`;&|()<>]+")
_DOUBLE_QUOTED = re.compile(r'[^"\\$`]+')
_ASSIGNMENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*=")
_CONFIG_KEY = re.compile(r"GIT_CONFIG_KEY_([0-9]{1,6})\Z")
_ECHO_FLAGS = re.compile(r"-[neE]+\Z")
_DESCRIPTOR = re.compile(r"[0-9]+\Z")
_CONVERSION = re.compile(r"%[-+ #0]*[0-9*]*(?:\.[0-9*]*)?([A-Za-z%])")
_DEFAULT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*:?[-=]")
_INNER_BRACE = re.compile(r"\$\{([^{}]*)\}")
_OCTAL = re.compile(r"[0-7]{1,3}")
_HEX = {
    "x": re.compile(r"[0-9A-Fa-f]{1,2}"),
    "u": re.compile(r"[0-9A-Fa-f]{1,4}"),
    "U": re.compile(r"[0-9A-Fa-f]{1,8}"),
}

_ESCAPES = {
    "a": "\a", "b": "\b", "e": "\x1b", "E": "\x1b", "f": "\f", "n": "\n", "r": "\r", "t": "\t",
    "v": "\v", "\\": "\\", "'": "'", '"': '"', "?": "?",
}  # fmt: skip

# Longest first, so a run of operator characters splits the way the shell splits it.
_OPERATORS = (
    ";;&", "<<<", "<<-", "&>>", ";;", ";&", "&&", "||", "|&", "&>", ">>", ">|", "<>", ">&", "<&",
    "<<", "<(", ">(", ";", "&", "|", "(", ")", "<", ">",
)  # fmt: skip
_REDIRECTIONS = frozenset({"<<<", "<<-", "&>>", "&>", ">>", ">|", "<>", ">&", "<&", "<<", "<", ">"})
_PIPES = frozenset({"|", "|&"})

# Words that open or close a compound command; at the start of a simple command they are not one.
_COMPOUND_WORDS = frozenset(
    {"if", "then", "elif", "else", "do", "while", "until", "!", "{", "fi", "done", "}"}
)
_LIST_HEADS = frozenset({"for", "select"})

_SHELLS = frozenset({"sh", "bash", "zsh", "dash", "ksh"})
_SHELL_VALUED_LONG = frozenset({"--rcfile", "--init-file"})
_STDIN_PATHS = frozenset({"/dev/stdin", "/dev/fd/0", "/proc/self/fd/0"})

# For each wrapper: its options that take a value, and the positional words it takes before the
# command it runs.
_WRAPPERS = {
    "env": (frozenset({"-u", "-C", "-S", "--unset", "--chdir", "--split-string"}), 0),
    "command": (frozenset(), 0),
    "builtin": (frozenset(), 0),
    "exec": (frozenset({"-a"}), 0),
    "nohup": (frozenset(), 0),
    "nice": (frozenset({"-n", "--adjustment"}), 0),
    "time": (frozenset(), 0),
    "timeout": (frozenset({"-s", "-k", "--signal", "--kill-after"}), 1),
    "stdbuf": (frozenset({"-i", "-o", "-e", "--input", "--output", "--error"}), 0),
    "doas": (frozenset({"-u", "-C"}), 0),
    "setsid": (frozenset(), 0),
    "unbuffer": (frozenset(), 0),
    "ionice": (
        frozenset({"-c", "-n", "-p", "-P", "-u", "--class", "--classdata", "--pid", "--pgid"})
        | frozenset({"--uid"}),
        0,
    ),
    "chrt": (
        frozenset({"-T", "-P", "-D", "--sched-runtime", "--sched-period", "--sched-deadline"}),
        1,
    ),
    # script runs the string of -c (util-linux), or the words after its file (BSD)
    "script": (
        frozenset({"-c", "--command", "-E", "--echo", "-F", "-t", "-I", "--log-in", "-O"})
        | frozenset({"--log-out", "-B", "--log-io", "-T", "--log-timing", "-m"})
        | frozenset({"--logging-format"}),
        1,
    ),
    "sudo": (
        frozenset(
            {"-u", "-g", "-C", "-D", "-h", "-p", "-r", "-t", "-T", "-U", "--user", "--group"}
            | {"--chdir", "--host", "--prompt", "--role", "--type", "--command-timeout"}
            | {"--other-user", "--close-from"}
        ),
        0,
    ),
    "xargs": (
        frozenset(
            {"-I", "-L", "-n", "-P", "-s", "-d", "-E", "-a", "--max-lines", "--max-args"}
            | {"--max-procs", "--max-chars", "--delimiter", "--eof", "--arg-file"}
        ),
        0,
    ),
}
# Commands that join their arguments into one string and run it as a shell command.
_TEXT_WRAPPERS = {"eval": frozenset(), "watch": frozenset({"-n", "--interval"})}
_FIND_EXEC = frozenset({"-exec", "-execdir", "-ok", "-okdir"})

_GIT_VALUED_OPTIONS = frozenset(
    {"-C", "--git-dir", "--work-tree", "--namespace", "--super-prefix", "--attr-source"}
)
_CHECKOUT_VALUED = frozenset({"-b", "-B", "--orphan", "--conflict", "--pathspec-from-file"})
_RESTORE_VALUED = frozenset({"-s", "--source", "--conflict", "--pathspec-from-file"})

_FALSE_WORDS = frozenset({"false", "no", "off", ""})

_PUSH_RULE = "git push is run by the user by hand"
_RESET_RULE = "git reset --hard discards work and is run by the user by hand"
_CLEAN_RULE = "git clean deletes untracked files without asking and is run by the user by hand"
_TREE_RULE = "git {} with a whole-tree pathspec discards work and is run by the user by hand"


@dataclass
class _Simple:
    """One simple command: its words, the bodies fed to its stdin, and the command piped into it."""

    words: list[str] = field(default_factory=list)
    bodies: list[str] = field(default_factory=list)
    pipe_from: _Simple | None = None
    discard: bool = False


@dataclass
class _Heredoc:
    """A here-document whose body starts on the line after the current one."""

    delimiter: str
    strip_tabs: bool
    quoted: bool
    owner: _Simple


class _Frame:
    """One open construct of the text being read.

    Its kind is "cmd" (a command context: the text itself, a $( ), <( ) or >( ) text or a backtick
    text), "dq" (double-quoted text or a here-document body) or "brace" (a ${ } expansion).
    """

    def __init__(self, kind: str) -> None:
        self.kind = kind
        self.placeholder = ""  # what the construct leaves in the word it stands in
        self.closer = ""  # ")" for a $( ), <( ) or >( ) text
        self.restore: tuple[str, int] | None = None  # the text and position to return to
        self.unclosed = False
        self.closing_quote = True
        self.level = 0
        self.sink: list[tuple[str, bool]] = []  # where a "dq" frame puts its text
        self.current = _Simple()
        self.parts: list[tuple[str, bool]] = []
        self.in_word = False
        self.quoted = False
        self.redirect = ""
        self.heredocs: list[_Heredoc] = []
        self.parens = 0
        self.cases = 0
        self.skip = 0
        self.coproc = False
        self.arith: list[int] = []  # the paren levels at which an arithmetic (( )) opened
        self.source = ""  # for a "brace" frame, the text it was opened in
        self.start = 0  # for a "brace" frame, where its text starts
        self.stop = 0  # for a "brace" frame, where its closing brace is


class _Lexer:
    """Reads shell text into its simple commands, with an explicit stack of the open constructs."""

    def __init__(self, text: str) -> None:
        self.text = text
        self.pos = 0
        self.stack: list[_Frame] = []
        self.commands: list[_Simple] = []  # every simple command, in the order it ends
        self.unbalanced = False

    def run(self) -> list[_Simple]:
        self._push("cmd")
        while self.stack and not self.unbalanced:
            frame = self.stack[-1]
            if self.pos >= len(self.text):
                self._end_of_text(frame)
            elif frame.kind == "cmd":
                self._step_command(frame)
            elif frame.kind == "dq":
                self._step_double(frame)
            else:
                self._step_braced(frame)
        while self.stack:  # an unbalanced text: what was read so far stands
            self._pop(self.stack[-1])
        return self.commands

    def _push(self, kind: str) -> _Frame:
        frame = _Frame(kind)
        self.stack.append(frame)
        return frame

    def _pop(self, frame: _Frame) -> None:
        self.stack.pop()
        if frame.kind == "cmd":
            self._end_command(frame)
        if frame.restore is not None:
            self.text, self.pos = frame.restore
        if frame.unclosed:
            self.unbalanced = True
        if not self.stack:
            return
        parent = self.stack[-1]
        default = _default_word(frame)
        if default is not None and parent.kind == "cmd":
            for index, piece in enumerate(default.split() or [""]):
                if index:
                    self._end_word(parent)
                self._add(parent, piece, quoted=True)
        elif default is not None:
            self._emit(parent, default, quoted=True)
        elif frame.placeholder:
            self._emit(parent, frame.placeholder, quoted=True)

    def _end_of_text(self, frame: _Frame) -> None:
        if frame.kind == "cmd":
            if frame.closer:
                self.unbalanced = True
            else:
                self._pop(frame)
        elif frame.kind == "dq" and not frame.closing_quote:
            self._pop(frame)
        else:
            self.unbalanced = True

    def _emit(self, frame: _Frame, text: str, quoted: bool = False) -> None:
        """Adds text to the word or double-quoted text the frame is reading."""
        if frame.kind == "cmd":
            self._add(frame, text, quoted)
        elif frame.kind == "dq":
            frame.sink.append((text, True))

    def _add(self, frame: _Frame, text: str, quoted: bool = False) -> None:
        frame.parts.append((text, quoted))
        frame.in_word = True
        frame.quoted = frame.quoted or quoted

    def _open_command(self, parent: _Frame, placeholder: str) -> None:
        frame = self._push("cmd")
        frame.closer = ")"
        frame.placeholder = placeholder

    def _step_command(self, frame: _Frame) -> None:
        text = self.text
        char = text[self.pos]
        if char in " \t":
            self._end_word(frame)
            self.pos += 1
        elif char == "\n":
            self._newline(frame)
        elif char == "\\":
            self._backslash(frame)
        elif char == "'":
            self._single_quoted(frame)
        elif char == '"':
            self.pos += 1
            self._add(frame, "", quoted=True)
            double = self._push("dq")
            double.sink = frame.parts
        elif char == "$":
            self._dollar(frame, ansi=True)
        elif char == "`":
            self._backtick(frame)
        elif char == "#" and not frame.in_word:
            end = text.find("\n", self.pos)
            self.pos = len(text) if end < 0 else end
        elif char in ";&|()<>":
            self._operator(frame)
        else:
            match = _PLAIN.match(text, self.pos)
            assert match is not None  # every character _PLAIN excludes is taken by a branch above
            self._add(frame, match.group())
            self.pos = match.end()

    def _step_double(self, frame: _Frame) -> None:
        text = self.text
        char = text[self.pos]
        if char == '"' and frame.closing_quote:
            self.pos += 1
            self._pop(frame)
        elif char == "\\":
            following = text[self.pos + 1 : self.pos + 2]
            if following == "\n":
                self.pos += 2
            elif following and following in '"\\$`':
                self._emit(frame, following)
                self.pos += 2
            else:
                self._emit(frame, "\\")
                self.pos += 1
        elif char == "$":
            self._dollar(frame, ansi=False)
        elif char == "`":
            self._backtick(frame)
        else:
            match = _DOUBLE_QUOTED.match(text, self.pos)
            if match is None:  # a double quote inside a here-document body
                self._emit(frame, char)
                self.pos += 1
            else:
                self._emit(frame, match.group())
                self.pos = match.end()

    def _step_braced(self, frame: _Frame) -> None:
        """Reads ${ }, a parameter expansion; a substitution inside it still runs."""
        text = self.text
        char = text[self.pos]
        if char == "{":
            frame.level += 1
            self.pos += 1
        elif char == "}":
            frame.level -= 1
            self.pos += 1
            if frame.level == 0:
                frame.stop = self.pos - 1
                self._pop(frame)
        elif char == "\\":
            self.pos += 2
        elif char == "'":
            end = text.find("'", self.pos + 1)
            if end < 0:
                self.unbalanced = True
            else:
                self.pos = end + 1
        elif char == '"':
            self.pos += 1
            self._push("dq")
        elif char == "$":
            self._dollar(frame, ansi=False)
        elif char == "`":
            self._backtick(frame)
        else:
            self.pos += 1

    def _backslash(self, frame: _Frame) -> None:
        following = self.text[self.pos + 1 : self.pos + 2]
        if following == "\n":
            self.pos += 2
        elif following:
            self._add(frame, following, quoted=True)
            self.pos += 2
        else:
            self._add(frame, "\\")
            self.pos += 1

    def _single_quoted(self, frame: _Frame) -> None:
        end = self.text.find("'", self.pos + 1)
        if end < 0:
            self._add(frame, self.text[self.pos + 1 :], quoted=True)
            self.pos = len(self.text)
            self.unbalanced = True
        else:
            self._add(frame, self.text[self.pos + 1 : end], quoted=True)
            self.pos = end + 1

    def _dollar(self, frame: _Frame, ansi: bool) -> None:
        """Reads $( ) and $(( ), whose text is read as a command, ${ } and $'...'.

        Bash reads $(( as arithmetic only when it closes with )); the text between is read as a
        command, which reads the arithmetic form as words and the $( ( ... ) ) form as a subshell.
        """
        text = self.text
        if text.startswith("$(", self.pos):
            self.pos += 2
            self._open_command(frame, "$(...)")
            if text.startswith("(", self.pos):
                self.stack[-1].arith.append(0)
        elif text.startswith("${", self.pos):
            self.pos += 2
            braced = self._push("brace")
            braced.level = 1
            braced.placeholder = "${...}"
            braced.source = text
            braced.start = self.pos
        elif ansi and text.startswith("$'", self.pos):
            self._ansi_quoted(frame)
        elif ansi and text.startswith('$"', self.pos):
            self.pos += 1  # $"..." is read as the double-quoted text it translates
        else:
            self._emit(frame, "$")
            self.pos += 1

    def _ansi_quoted(self, frame: _Frame) -> None:
        text = self.text
        index = self.pos + 2
        while index < len(text) and text[index] != "'":
            index += 2 if text[index] == "\\" else 1
        self._add(frame, _unescape(text[self.pos + 2 : index]), quoted=True)
        self.pos = index + 1
        if index >= len(text):
            self.unbalanced = True

    def _backtick(self, frame: _Frame) -> None:
        """Reads a backtick substitution as a command text of its own."""
        text = self.text
        index = self.pos + 1
        chars: list[str] = []
        while index < len(text) and text[index] != "`":
            if text[index] == "\\" and text[index + 1 : index + 2] in ("\\", "`", "$"):
                chars.append(text[index + 1])
                index += 2
            else:
                chars.append(text[index])
                index += 1
        inner = self._push("cmd")
        inner.placeholder = "`...`"
        inner.unclosed = index >= len(text)
        inner.restore = (text, index + 1)
        self.text = "".join(chars)
        self.pos = 0

    def _operator(self, frame: _Frame) -> None:
        operator = next(op for op in _OPERATORS if self.text.startswith(op, self.pos))
        if operator in ("<(", ">("):
            self.pos += 2
            self._open_command(frame, operator + "...)")
        elif operator in _REDIRECTIONS and frame.arith:
            self._add(frame, operator)  # a comparison or a shift inside (( )), not a redirection
            self.pos += len(operator)
        elif operator in _REDIRECTIONS:
            if frame.in_word and not frame.quoted and _DESCRIPTOR.match(_word(frame.parts)):
                frame.parts = []  # a file descriptor number, not a word
                frame.in_word = False
            self._end_word(frame)
            frame.redirect = operator
            self.pos += len(operator)
        elif operator == "(":
            self._end_command(frame)
            if self.text.startswith("((", self.pos):
                frame.arith.append(frame.parens)
                frame.parens += 1
                self.pos += 1
            frame.parens += 1
            self.pos += 1
        elif operator == ")":
            self._close_paren(frame)
        else:
            self._end_command(frame, pipe=operator in _PIPES)
            self.pos += len(operator)

    def _close_paren(self, frame: _Frame) -> None:
        self.pos += 1
        if frame.parens > 0:
            frame.parens -= 1
            if frame.arith and frame.parens <= frame.arith[-1]:
                frame.arith.pop()
            self._end_command(frame)
        elif frame.cases > 0:
            self._end_word(frame)
            frame.current = _Simple()  # a case pattern, not a command
        elif frame.closer:
            self._pop(frame)
        else:
            self._end_command(frame)

    def _newline(self, frame: _Frame) -> None:
        self._end_command(frame)
        self.pos += 1
        text = self.text
        expanded: list[str] = []
        for heredoc in frame.heredocs:
            lines: list[str] = []
            while self.pos < len(text):
                end = text.find("\n", self.pos)
                line_end = len(text) if end < 0 else end
                line = text[self.pos : line_end]
                self.pos = min(len(text), line_end + 1)
                if (line.lstrip("\t") if heredoc.strip_tabs else line) == heredoc.delimiter:
                    break
                lines.append(line)
            body = "\n".join(lines)
            heredoc.owner.bodies.append(body)
            if not heredoc.quoted:
                expanded.append(body)
        frame.heredocs = []
        if expanded:  # an unquoted body has the shell run the substitutions in it
            body_frame = self._push("dq")
            body_frame.closing_quote = False
            body_frame.restore = (text, self.pos)
            self.text = "\n".join(expanded)
            self.pos = 0

    def _end_word(self, frame: _Frame) -> None:
        if not frame.in_word:
            return
        parts = frame.parts
        quoted = frame.quoted
        frame.parts = []
        frame.in_word = False
        frame.quoted = False
        if frame.redirect:
            operator = frame.redirect
            frame.redirect = ""
            word = _word(parts)
            if operator in ("<<", "<<-"):
                frame.heredocs.append(_Heredoc(word, operator == "<<-", quoted, frame.current))
            elif operator == "<<<":
                frame.current.bodies.append(word)
            return
        words = _expand_braces(parts)
        if len(words) > 1:
            words = [word for word in words if word]  # bash removes a word that expands to nothing
        for word in words:
            self._add_word(frame, word, quoted)

    def _add_word(self, frame: _Frame, word: str, quoted: bool) -> None:
        current = frame.current
        if frame.skip:
            frame.skip -= 1
            return
        if frame.coproc and word == "{" and not quoted and len(current.words) == 1:
            current.words.clear()  # coproc NAME { ...; }
            frame.coproc = False
            return
        if not current.words and not quoted:
            if word == "esac":
                frame.cases = max(0, frame.cases - 1)
                return
            if word in _COMPOUND_WORDS:
                return
            if word == "function":
                frame.skip = 1  # the function's name
                return
            if word == "coproc":
                frame.coproc = True
                return
            if word in _LIST_HEADS:
                current.discard = True  # the words after `for NAME in` are a list, not a command
            elif word == "case":
                current.discard = True
                frame.cases += 1
        current.words.append(word)

    def _end_command(self, frame: _Frame, pipe: bool = False) -> None:
        self._end_word(frame)
        current = frame.current
        emitted = current if current.words and not current.discard else None
        if emitted is not None:
            self.commands.append(emitted)
        frame.redirect = ""
        frame.skip = 0
        frame.coproc = False
        frame.current = _Simple(pipe_from=emitted if pipe else None)


def _default_word(frame: _Frame) -> str | None:
    """The word ${NAME:-word}, ${NAME-word}, ${NAME:=word} or ${NAME=word} gives when NAME is unset.

    The quotes of the word are removed; a substitution inside it is read as a command by the lexer.
    """
    if frame.kind != "brace" or not frame.source:
        return None
    match = _DEFAULT.match(frame.source, frame.start)
    if match is None:
        return None
    body = frame.source[match.end() : frame.stop] if frame.stop >= match.end() else ""
    while True:  # an inner ${NAME:-word} gives its word, any other inner ${...} nothing
        inner = _INNER_BRACE.search(body)
        if inner is None:
            break
        default = _DEFAULT.match(inner.group(1))
        body = (
            body[: inner.start()]
            + (inner.group(1)[default.end() :] if default else "")
            + body[inner.end() :]
        )
    return body.replace("'", "").replace('"', "")


def _word(parts: list[tuple[str, bool]]) -> str:
    return "".join(text for text, _ in parts)


def _unescape(text: str, echo: bool = False) -> str:
    """Decodes the backslash escapes of $'...', a printf format or (with echo) an echo -e text."""
    out: list[str] = []
    index = 0
    while index < len(text):
        char = text[index]
        following = text[index + 1 : index + 2]
        if char != "\\" or not following:
            out.append(char)
            index += 1
        elif following in _ESCAPES:
            out.append(_ESCAPES[following])
            index += 2
        elif following in "01234567" and not (echo and following != "0"):
            start = index + 2 if echo else index + 1  # echo writes \0 and then up to three digits
            match = _OCTAL.match(text, start)
            out.append(chr(int(match.group(), 8) & 0xFF) if match else "\x00")
            index = match.end() if match else start
        elif following in _HEX:
            match = _HEX[following].match(text, index + 2)
            code = int(match.group(), 16) if match else -1
            if match and code <= 0x10FFFF:
                out.append(chr(code))
                index = match.end()
            else:
                out.append("\\" + following)
                index += 2
        elif following == "c" and index + 2 < len(text):
            out.append(chr(ord(text[index + 2]) & 0x1F))
            index += 3
        else:
            out.append("\\" + following)
            index += 2
    return "".join(out)


def _expand_braces(parts: list[tuple[str, bool]]) -> list[str]:
    """The words an unquoted word with a comma list in braces expands to, as bash expands it."""
    whole = _word(parts)
    if len(whole) > _MAX_BRACE_LENGTH or not any(
        "{" in text and not quoted for text, quoted in parts
    ):
        return [whole]
    pending = deque([[(char, quoted) for text, quoted in parts for char in text]])
    done: list[str] = []
    while pending:
        if len(pending) + len(done) > _MAX_BRACE_WORDS:
            return [whole]
        chars = pending.popleft()
        group = _first_group(chars)
        if group is None:
            done.append("".join(char for char, _ in chars))
            continue
        start, stop, commas = group
        bounds = [start, *commas, stop]
        for left, right in zip(bounds, bounds[1:]):
            pending.append(chars[:start] + chars[left + 1 : right] + chars[stop + 1 :])
    return done


def _first_group(chars: list[tuple[str, bool]]) -> tuple[int, int, list[int]] | None:
    """The first braced group, innermost first, that holds a comma outside nested braces."""
    opens: list[int] = []
    commas: list[list[int]] = []
    for index, (char, quoted) in enumerate(chars):
        if quoted:
            continue
        if char == "{":
            opens.append(index)
            commas.append([])
        elif char == "," and opens:
            commas[-1].append(index)
        elif char == "}" and opens:
            start = opens.pop()
            found = commas.pop()
            if found:
                return start, index, found
    return None


def _basename(word: str) -> str:
    return word.rsplit("/", 1)[-1]


def _is_git(name: str) -> bool:
    """Whether a command word names git, as itself or as a glob pattern that matches it."""
    if name == "git":
        return True
    try:
        return any(char in name for char in "*?[") and fnmatchcase("git", name)
    except re.error:  # Python 3.9 refuses a pattern such as [z-a] that names no character
        return False


def _quote(word: str) -> str:
    return "'" + word.replace("'", "'\\''") + "'"


def _line(shown: list[str], rule: str) -> str:
    command = " ".join(" ".join(shown).split())
    return f"git-guard: blocked: {command} ({rule})"


# What a simple command asks the checker to look at next: a command text or a simple command, with
# the inline git configuration that reaches it.
_Todo = tuple["str | _Simple", dict[str, str]]


def _check_text(text: str) -> str | None:
    """The line for the first blocked simple command of `text`, or None."""
    stack: list[tuple[list[_Simple], dict[str, str]]] = [(_Lexer(text).run(), {})]
    positions = [0]
    while stack:
        commands, inherited = stack[-1]
        if positions[-1] >= len(commands):
            stack.pop()
            positions.pop()
            continue
        command = commands[positions[-1]]
        positions[-1] += 1
        outcome = _check_simple(command, inherited)
        if isinstance(outcome, str):
            return outcome
        for item, config in reversed(outcome or []):
            stack.append((_Lexer(item).run() if isinstance(item, str) else [item], config))
            positions.append(0)
    return None


def _check_simple(command: _Simple, inherited: dict[str, str]) -> str | list[_Todo] | None:
    env: dict[str, str] = {}
    words = command.words
    todos: list[_Todo] = []
    index = 0
    while True:
        while index < len(words) and _ASSIGNMENT.match(words[index]):
            variable, _, value = words[index].partition("=")
            env[variable] = value
            index += 1
        if index >= len(words):
            return todos or None
        name = _basename(words[index])
        config = {**inherited, **_config_of(env)}
        if _is_git(name):
            outcome = _check_git(command.words, words[index + 1 :], config, env)
            return outcome if isinstance(outcome, str) else todos + (outcome or []) or None
        if name in _TEXT_WRAPPERS:
            index += 1
            if name == "eval":
                while index < len(words) and words[index] in ("eval", "--"):
                    index += 1
            else:
                _, index = _take_options(words, index, _TEXT_WRAPPERS[name])
            return [*todos, (" ".join(words[index:]), config)]
        if name in _SHELLS:
            return [*todos, *_shell_todos(command, words[index + 1 :], config)] or None
        if name == "find":
            return [*todos, *_find_todos(words[index + 1 :], config)] or None
        if name not in _WRAPPERS:
            return todos or None
        valued, positionals = _WRAPPERS[name]
        options, index = _take_options(words, index + 1, valued)
        index += positionals
        if name == "env":
            todos.extend(
                (value, config) for option, value in options if option in ("-S", "--split-string")
            )
        if name == "script":
            todos.extend(
                (value, config) for option, value in options if option in ("-c", "--command")
            )
        if name == "xargs" and command.pipe_from is not None and index < len(words):
            piped = _piped_texts(command.pipe_from)
            replace = next((value for option, value in options if option == "-I" and value), "")
            if piped and replace:  # xargs -I puts each input line in place of the string
                return [
                    *todos,
                    *(
                        (_Simple(words=[w.replace(replace, line) for w in words[index:]]), config)
                        for text in piped
                        for line in text.splitlines() or [""]
                    ),
                ]
            if piped:
                return [
                    *todos,
                    *((_Simple(words=words[index:] + text.split()), config) for text in piped),
                ]


def _take_options(
    words: list[str], start: int, valued: frozenset[str]
) -> tuple[list[tuple[str, str]], int]:
    """Reads the options from `start`, each with its value, and gives the index after them."""
    options: list[tuple[str, str]] = []
    index = start
    while index < len(words):
        word = words[index]
        if word == "--":
            index += 1
            break
        if len(word) < 2 or not word.startswith("-"):
            break
        index += 1
        if word.startswith("--"):
            name, has_value, value = word.partition("=")
            if not has_value and name in valued and index < len(words):
                value = words[index]
                index += 1
            options.append((name, value))
            continue
        for offset, letter in enumerate(word[1:], start=2):
            if "-" + letter in valued:
                value = word[offset:]
                if not value and index < len(words):
                    value = words[index]
                    index += 1
                options.append(("-" + letter, value))
                break
    return options, index


def _shell_arguments(words: list[str]) -> tuple[str | None, bool]:
    """The -c string of a shell's arguments, and whether the shell reads a script from stdin.

    The string is the first operand after all of the shell's options.
    """
    index = 0
    has_c = False
    reads_stdin = False
    while index < len(words):
        word = words[index]
        if word == "--":
            index += 1
            break
        if word == "-":
            reads_stdin = True
        elif len(word) < 2 or word[0] not in "-+":
            break
        elif word in _SHELL_VALUED_LONG:
            index += 1
        elif word[1] != "-":
            letters = word[1:]
            # -o and -O each take the next word as their value
            index += letters.count("o") + letters.count("O")
            if word[0] == "-":
                has_c = has_c or "c" in letters
                reads_stdin = reads_stdin or "s" in letters
        index += 1
    operands = words[index:]
    if has_c:
        return (operands[0] if operands else ""), False
    return None, reads_stdin or not operands or operands[0] in _STDIN_PATHS


def _shell_todos(command: _Simple, arguments: list[str], config: dict[str, str]) -> list[_Todo]:
    script, reads_stdin = _shell_arguments(arguments)
    if script is not None:
        return [(script, config)]
    if not reads_stdin:
        return []
    texts = list(command.bodies)
    if command.pipe_from is not None:
        texts.extend(_piped_texts(command.pipe_from))
    return [(text, config) for text in texts]


def _find_todos(arguments: list[str], config: dict[str, str]) -> list[_Todo]:
    """The commands find runs with -exec, -execdir, -ok and -okdir, up to ; or +."""
    todos: list[_Todo] = []
    for index, word in enumerate(arguments):
        if word in _FIND_EXEC:
            end = index + 1
            while end < len(arguments) and arguments[end] not in (";", "+"):
                end += 1
            if end > index + 1:
                todos.append((_Simple(words=arguments[index + 1 : end]), config))
    return todos


def _piped_texts(source: _Simple) -> list[str]:
    """What an echo or printf command writes into a pipe, as texts."""
    if not source.words:
        return []
    arguments = source.words[1:]
    name = _basename(source.words[0])
    if name == "echo":
        while arguments and _ECHO_FLAGS.match(arguments[0]):
            arguments = arguments[1:]
        text = " ".join(arguments)
        return [text, _unescape(text, echo=True)] if "\\" in text else [text]
    if name == "printf" and arguments:
        return [_printf(arguments[0], arguments[1:])]
    return []


def _printf(template: str, arguments: list[str]) -> str:
    """What printf writes: its format, reused while arguments remain, %b decoding escapes."""
    template = _unescape(template)
    remaining = list(arguments)
    out: list[str] = []
    while True:
        consumed = False
        index = 0
        while index < len(template):
            match = _CONVERSION.match(template, index)
            if match is None:
                out.append(template[index])
                index += 1
                continue
            index = match.end()
            if match.group(1) == "%":
                out.append("%")
                continue
            value = remaining.pop(0) if remaining else ""
            consumed = True
            out.append(_unescape(value) if match.group(1) == "b" else value)
        if not remaining or not consumed:
            return "".join(out)


def _config_of(env: dict[str, str]) -> dict[str, str]:
    """The git configuration that GIT_CONFIG_PARAMETERS and GIT_CONFIG_COUNT with its pairs give."""
    config: dict[str, str] = {}
    parameters = env.get("GIT_CONFIG_PARAMETERS")
    if parameters:
        for word in (w for command in _Lexer(parameters).run() for w in command.words):
            key, has_value, value = word.partition("=")
            config[key.lower()] = value if has_value else "true"
    try:
        count = int(env.get("GIT_CONFIG_COUNT", "0"))
    except ValueError:
        return config
    for name, key in env.items():
        match = _CONFIG_KEY.match(name)
        if match and int(match.group(1)) < count:
            config[key.lower()] = env.get(f"GIT_CONFIG_VALUE_{match.group(1)}", "")
    return config


def _check_git(
    shown: list[str], arguments: list[str], config: dict[str, str], env: dict[str, str]
) -> str | list[_Todo] | None:
    """The line for a blocked git command, or the command texts an alias runs.

    `arguments` are the words after `git`, `config` the configuration inline so far and `env` the
    variables assigned in the same simple command.
    """
    config = dict(config)
    seen: set[str] = set()
    while True:
        index = 0
        while index < len(arguments) and arguments[index].startswith("-"):
            option = arguments[index]
            if option == "-c" and index + 1 < len(arguments):
                key, has_value, value = arguments[index + 1].partition("=")
                config[key.lower()] = value if has_value else "true"
                index += 2
            elif option == "--config-env" and index + 1 < len(arguments):
                _config_env(arguments[index + 1], config, env)
                index += 2
            elif option.startswith("--config-env="):
                _config_env(option.partition("=")[2], config, env)
                index += 1
            elif option in _GIT_VALUED_OPTIONS:
                index += 2
            else:
                index += 1
        if index >= len(arguments):
            return None
        subcommand = arguments[index]
        rest = arguments[index + 1 :]
        check = _CHECKS.get(subcommand)
        if check is not None:
            rule = check(rest, config)
            return None if rule is None else _line(shown, rule)
        name = subcommand.lower()
        expansion = config.get("alias." + name)
        if expansion is None or name in seen:
            return None
        seen.add(name)
        if expansion.startswith("!"):
            text = expansion[1:] + "".join(" " + _quote(argument) for argument in rest)
            return [(text, config)]
        words = [word for command in _Lexer(expansion).run() for word in command.words]
        arguments = words + rest


def _config_env(spec: str, config: dict[str, str], env: dict[str, str]) -> None:
    """Sets the configuration key of `key=VARIABLE` to the value of a variable assigned inline."""
    key, _, variable = spec.partition("=")
    if variable in env:
        config[key.lower()] = env[variable]


def _options(arguments: list[str]) -> list[str]:
    """The words before `--` that start with a dash."""
    found: list[str] = []
    for argument in arguments:
        if argument == "--":
            break
        if argument.startswith("-"):
            found.append(argument)
    return found


def _is_long(argument: str, name: str, shortest: int) -> bool:
    """Whether `argument` is `name` or a prefix of it at least `shortest` characters long."""
    return argument.startswith("--") and len(argument) >= shortest and name.startswith(argument)


def _is_short(argument: str, letter: str) -> bool:
    """Whether `argument` is a short-option word that holds `letter`."""
    return argument.startswith("-") and not argument.startswith("--") and letter in argument[1:]


def _is_false(value: str) -> bool:
    """Whether git reads `value` as the boolean false: false, no, off, empty or an integer 0.

    An integer is read as git reads it: a sign, then decimal, octal (0...) or hex (0x...), then an
    optional unit k, m or g.
    """
    text = value.strip().lower()
    if text in _FALSE_WORDS:
        return True
    digits = text.lstrip("+-")
    if digits[-1:] in ("k", "m", "g"):
        digits = digits[:-1]
    if digits.startswith("0x") and len(digits) > 2:
        digits = digits[2:]
        return all(char in "0123456789abcdef" for char in digits) and not digits.strip("0")
    return digits.isascii() and digits.isdigit() and not digits.strip("0")


def _rule_push(arguments: list[str], config: dict[str, str]) -> str | None:
    return _PUSH_RULE


def _rule_reset(arguments: list[str], config: dict[str, str]) -> str | None:
    if any(_is_long(option, "--hard", 4) for option in _options(arguments)):
        return _RESET_RULE
    return None


def _rule_clean(arguments: list[str], config: dict[str, str]) -> str | None:
    options = _options(arguments)
    if any(_is_long(option, "--force", 4) or _is_short(option, "f") for option in options):
        return _CLEAN_RULE
    dry_run = any(_is_long(option, "--dry-run", 3) or _is_short(option, "n") for option in options)
    require_force = config.get("clean.requireforce")
    if require_force is not None and _is_false(require_force) and not dry_run:
        return _CLEAN_RULE
    return None


def _rule_checkout(arguments: list[str], config: dict[str, str]) -> str | None:
    before, after = _split_pathspecs(arguments, _CHECKOUT_VALUED)
    words = before + (after or [])
    # The first word before `--` may be a revision, and after `--` every word is a pathspec.
    if after is not None:
        candidates = after
    elif before and _kind(before[0]) != "exclude":
        candidates = before[1:]
    else:
        candidates = before
    if _whole_tree(words, candidates):
        return _TREE_RULE.format("checkout")
    return None


def _rule_restore(arguments: list[str], config: dict[str, str]) -> str | None:
    options = _options(arguments)
    staged = any(_is_long(option, "--staged", 4) or _is_short(option, "S") for option in options)
    worktree = any(
        _is_long(option, "--worktree", 3) or _is_short(option, "W") for option in options
    )
    if staged and not worktree:
        return None  # restoring only the index discards no work
    before, after = _split_pathspecs(arguments, _RESTORE_VALUED)
    words = before + (after or [])
    if _whole_tree(words, words):
        return _TREE_RULE.format("restore")
    return None


def _split_pathspecs(
    arguments: list[str], valued: frozenset[str]
) -> tuple[list[str], list[str] | None]:
    """The non-option words before `--`, and the words after it (None when there is no `--`)."""
    before: list[str] = []
    after: list[str] | None = None
    index = 0
    while index < len(arguments):
        argument = arguments[index]
        if after is not None:
            after.append(argument)
        elif argument == "--":
            after = []
        elif argument.startswith("-") and len(argument) > 1:
            if argument in valued:
                index += 1
        else:
            before.append(argument)
        index += 1
    return before, after


def _whole_tree(words: list[str], candidates: list[str]) -> bool:
    """Whether a word is a whole-tree pathspec, or the candidates are all excludes."""
    if any(_kind(word) == "tree" for word in words):
        return True
    return bool(candidates) and all(_kind(word) == "exclude" for word in candidates)


def _kind(word: str) -> str:
    """Whether a pathspec is the "tree", an "exclude" or an ordinary "path", as written."""
    magic, pattern, has_magic = _magic(word)
    if "exclude" in magic:
        return "exclude"
    if not (has_magic or pattern):
        return "path"
    parts = [part for part in pattern.split("/") if part not in ("", ".")]
    while parts and parts[0] == "..":
        parts.pop(0)
    if not parts:
        return "tree"
    # literal magic turns off globbing, so * and ** name a file called * or **
    return "tree" if parts in (["*"], ["**"]) and "literal" not in magic else "path"


def _magic(word: str) -> tuple[set[str], str, bool]:
    """The magic of a pathspec, its pattern, and whether it starts with magic."""
    if not word.startswith(":"):
        return set(), word, False
    magic: set[str] = set()
    if word.startswith(":("):
        end = word.find(")")
        if end < 0:
            return magic, word, False
        magic.update(word[2:end].split(","))
        return magic, word[end + 1 :], True
    index = 1
    while index < len(word) and word[index] in "!^/":
        magic.add("top" if word[index] == "/" else "exclude")
        index += 1
    if index < len(word) and word[index] == ":":
        index += 1
    return magic, word[index:], True


_CHECKS = {
    "push": _rule_push,
    "reset": _rule_reset,
    "clean": _rule_clean,
    "checkout": _rule_checkout,
    "restore": _rule_restore,
}


def _command_of(raw: str) -> str | None:
    """The shell command in a hook event's `tool_input`, or None when there is none."""
    try:
        event = json.loads(raw)
    except (ValueError, RecursionError):
        return None
    if not isinstance(event, dict):
        return None
    tool_input = event.get("tool_input")
    if not isinstance(tool_input, dict):
        return None
    command = tool_input.get("command")
    return command if isinstance(command, str) else None


def main() -> int:
    raw = sys.stdin.buffer.read().decode("utf-8", errors="replace")
    command = _command_of(raw)
    if command is None:
        return 0
    line = _check_text(command)
    if line is None:
        return 0
    print(line, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())
