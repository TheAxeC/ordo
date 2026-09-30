"""Print what was said and done in Claude Code transcripts inside a time window.

Usage:
    transcript_window.py <transcript folder> <start> <end>
    transcript_window.py <transcript folder> --session <session id>

<transcript folder> is a project's transcript folder (for example
~/.claude/projects/<project slug>). <start> and <end> are ISO 8601 times with a zone
(`Z` or `+02:00`, with or without a fraction of a second); an entry is in the window when
start <= its timestamp < end, compared as times. With --session, every entry of the session is
printed and no window applies.

Files read. With a window: every *.jsonl directly in the folder (the main sessions) and every
*/subagents/agent-*.jsonl (the subagents, nested ones included). With --session: <session id>.jsonl
and <session id>/subagents/agent-*.jsonl. A folder with none of these prints nothing. Each file is
read in binary, one line at a time, never whole.

What is printed, in this order: all items of all files sorted by timestamp as a time, then by
file path, then by line number and the place of the block in the entry. Each item starts on a new
line with `<id> <line> <timestamp> <kind>: ` and the text. <id> is the session id for a main
session and `agent-<agent id>` for a subagent (the file name without `.jsonl`), <line> the
1-based line number in the file, <timestamp> as the entry has it. A text of several lines prints
its further lines indented by two spaces. The kinds:
    user        a message the user typed: a `user` entry whose content is a string (unless the
                entry has isMeta or isCompactSummary true, or the string starts with
                <task-notification>, <bash-stdout>, <bash-stderr>, <local-command-stdout> or
                <local-command-stderr>, the output of a command the user ran); each `text`
                block of a `user` entry whose content is an array (unless the entry has isMeta
                true); the prompt of an `attachment` entry
                whose type is queued_command and whose commandMode is prompt (unless
                attachment.isMeta is true). In a subagent file the first such entry is the
                prompt the agent was started with.
    text        each `text` block of an `assistant` entry.
    tool <name> each `tool_use` block of an `assistant` entry, with the first line of its input:
                the value of the first field of `input`, in the entry's key order, whose value
                is a string, up to its first newline. An input with no string field prints
                nothing after `tool <name>: `.
Nothing else is printed: no thinking, no tool_result, no other type, no other attachment.

Redaction. Before printing, every match of these patterns, whatever the case of its letters, is
replaced by <REDACTED> (a tool input is redacted before its first line is taken):
    key and token shapes, each not preceded by a letter or a digit: sk-ant-[A-Za-z0-9_-]{8,},
    sk-[A-Za-z0-9_-]{20,}, [sr]k_(live|test)_[A-Za-z0-9]{16,}, gh[pousr]_[A-Za-z0-9]{20,},
    github_pat_[A-Za-z0-9_]{20,}, glpat-[A-Za-z0-9_-]{20,}, npm_[A-Za-z0-9]{36},
    hf_[A-Za-z0-9]{30,}, AKIA[0-9A-Z]{16}, xox[abprs]-[A-Za-z0-9-]{10,},
    https://hooks.slack.com/services/ and what follows up to whitespace, AIza[0-9A-Za-z_-]{35},
    and a JWT eyJ[A-Za-z0-9_-]{10,}.[A-Za-z0-9_-]{10,}.[A-Za-z0-9_-]{10,};
    a PEM or PGP private key block, from a -----BEGIN ... PRIVATE KEY----- (or ... PRIVATE KEY
    BLOCK-----) line to its END line, or to the end of the text when there is no END line (a
    PUBLIC KEY block is kept);
    the rest of the line after Authorization:, Proxy-Authorization:, Cookie: or Set-Cookie:, and
    the word after `Bearer` or `Basic` and one or more spaces or tabs;
    the value of a name that is, or ends in, password, passwd, secret, secret_key, secret-key,
    token, api_key, api-key, apikey, access_key, access-key, private_key or credentials, written
    name=value,
    name: value, "name": "value", name="value" or name='value': the value inside the quotes when
    quoted, and otherwise up to whitespace, a comma, a quote, ), ], } or ;
    the value of the option form of each of those names, --name value or --name=value, where the
    option is, or ends in, the name (--db-password is redacted; --tokens and --password-file are
    kept);
    the password of a URL scheme://user:password@host.
Commit hashes, UUIDs, agent ids and other hex strings are not redacted.

Lines skipped. A line that is not UTF-8 or not JSON, and a `user`, `assistant` or `attachment`
entry whose timestamp is missing or unparsable, is skipped. After the output, one line per file
with skipped lines goes to stderr: `skipped <n> lines of <file>`. An entry of another type
without a timestamp (mode, ai-title and the rest) is not an item and is not counted.

Errors. Each is one line `error: <what>` on stderr with exit status 2, nothing on stdout, and no
file read:
    error: expected <transcript folder> <start> <end> or <transcript folder> --session <session id>
        (no arguments, or a number of arguments that fits neither form)
    error: --session takes one session id and no times or further arguments
    error: time without a zone: '<time>'
    error: unparsable time: '<time>'
    error: the end is not after the start
    error: no such folder: <folder>
    error: not a folder: <folder>   (the folder is a file)
    error: invalid session id: '<id>'   (empty, or anything but letters, digits, - and _)
    error: no session file: <folder>/<session id>.jsonl
    error: cannot read <path>: <reason>   (the folder or the session file cannot be checked, for
        example when a parent folder cannot be searched)
A file that cannot be opened or read, and a folder that cannot be listed (the transcript folder
itself, and in it every folder, which is searched for a subagents folder, and each subagents
folder), is reported on stderr as
`error: cannot read <file or folder>: <reason>`; the other files are still printed and the exit
status is 1.

Exit statuses: 0 the output printed (an empty window prints nothing and exits 0), and also when
the reader of stdout closes it early (the script then stops writing and prints nothing more on
stderr), 1 a file could not be read or a folder could not be listed and the output lacks it,
whether or not the reader closed stdout early, 2 a usage error.

Standard library only; runs on Python 3.9 and newer.
"""

from __future__ import annotations

import json
import os
import re
import stat
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path
from typing import Any, NamedTuple

_USAGE_ERROR = (
    "expected <transcript folder> <start> <end> or <transcript folder> --session <session id>"
)
_SESSION_ERROR = "--session takes one session id and no times or further arguments"
_SESSION_ID = re.compile(r"[A-Za-z0-9_-]+")
_TIME = re.compile(
    r"([0-9]{4})-([0-9]{2})-([0-9]{2})T([0-9]{2}):([0-9]{2}):([0-9]{2})"
    r"(?:\.([0-9]+))?(?:(Z)|([+-])([0-9]{2}):?([0-9]{2}))?",
    re.IGNORECASE,
)
_ENTRY_TYPES = ("user", "assistant", "attachment")
_REDACTED = "<REDACTED>"

_NOT_AFTER = "(?<![A-Za-z0-9])"
_NOT_TYPED = (
    "<task-notification>",
    "<bash-stdout>",
    "<bash-stderr>",
    "<local-command-stdout>",
    "<local-command-stderr>",
)
_PEM_KEY = re.compile(
    r"-----BEGIN [A-Z ]*PRIVATE KEY(?: BLOCK)?-----.*?"
    r"(?:-----END [A-Z ]*PRIVATE KEY(?: BLOCK)?-----|\Z)",
    re.IGNORECASE | re.DOTALL,
)
_KEY_SHAPES = re.compile(
    _NOT_AFTER
    + "(?:"
    + "|".join(
        [
            r"sk-ant-[A-Za-z0-9_-]{8,}",
            r"sk-[A-Za-z0-9_-]{20,}",
            r"[sr]k_(?:live|test)_[A-Za-z0-9]{16,}",
            r"gh[pousr]_[A-Za-z0-9]{20,}",
            r"github_pat_[A-Za-z0-9_]{20,}",
            r"glpat-[A-Za-z0-9_-]{20,}",
            r"npm_[A-Za-z0-9]{36}",
            r"hf_[A-Za-z0-9]{30,}",
            r"AKIA[0-9A-Z]{16}",
            r"xox[abprs]-[A-Za-z0-9-]{10,}",
            r"https://hooks\.slack\.com/services/\S*",
            r"AIza[0-9A-Za-z_-]{35}",
            r"eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}",
        ]
    )
    + ")",
    re.IGNORECASE,
)
_HEADER = re.compile(
    r"((?:Proxy-)?Authorization:|(?:Set-)?Cookie:)([ \t]*)[^\s][^\n]*", re.IGNORECASE
)
_SCHEME_WORD = re.compile(r"\b(Bearer|Basic)([ \t]+)[^\s\"',;]+", re.IGNORECASE)
_NAMES = (
    r"password|passwd|secret_key|secret-key|secret|token|api_key|api-key|apikey"
    r"|access_key|access-key|private_key|credentials"
)
_VALUE = r"(?P<value>\"[^\"\n]*\"?|'[^'\n]*'?|[^\s,\"')\]};]+)"
_NAMED_VALUE = re.compile(
    rf"(?P<name>{_NAMES})(?P<sep>[\"']?[ \t]*[:=][ \t]*){_VALUE}", re.IGNORECASE
)
_OPTION_VALUE = re.compile(
    rf"(?<![A-Za-z0-9-])(?P<name>--[A-Za-z0-9_-]*?(?:{_NAMES}))(?P<sep>=|[ \t]+){_VALUE}",
    re.IGNORECASE,
)
_URL_PASSWORD = re.compile(r"(?<=://)([^\s:/@]+:)[^\s@/]+(?=@)")


class _Item(NamedTuple):
    when: datetime
    path: str
    line: int
    place: int
    text: str


def _parse_time(text: object) -> datetime:
    """Return the time as an aware UTC datetime, or raise ValueError saying what is wrong."""
    match = _TIME.fullmatch(text) if isinstance(text, str) else None
    if match is None:
        raise ValueError("unparsable time")
    year, month, day, hour, minute, second, fraction, zulu, sign, zone_hour, zone_min = (
        match.groups()
    )
    if not zulu and sign is None:
        raise ValueError("time without a zone")
    offset = timedelta(0)
    if sign is not None:
        offset = timedelta(hours=int(zone_hour), minutes=int(zone_min))
        if sign == "-":
            offset = -offset
    micro = int(((fraction or "") + "000000")[:6])
    try:
        stamp = datetime(
            int(year),
            int(month),
            int(day),
            int(hour),
            int(minute),
            int(second),
            micro,
            tzinfo=timezone(offset),
        )
        return stamp.astimezone(timezone.utc)
    except (ValueError, OverflowError):
        raise ValueError("unparsable time") from None


def _window_time(text: str) -> datetime:
    """A time argument of the command line, or ValueError naming the argument."""
    try:
        return _parse_time(text)
    except ValueError as exc:
        raise ValueError(f"{exc}: {text!r}") from None


def _redact(text: str) -> str:
    text = _PEM_KEY.sub(_REDACTED, text)
    text = _KEY_SHAPES.sub(_REDACTED, text)
    text = _HEADER.sub(lambda m: m.group(1) + m.group(2) + _REDACTED, text)
    text = _SCHEME_WORD.sub(lambda m: m.group(1) + m.group(2) + _REDACTED, text)
    text = _OPTION_VALUE.sub(_redact_value, text)
    text = _NAMED_VALUE.sub(_redact_value, text)
    return _URL_PASSWORD.sub(lambda m: m.group(1) + _REDACTED, text)


def _redact_value(match: re.Match[str]) -> str:
    """Keep the name, the separator and the quotes of a matched name=value, drop the value."""
    value = match.group("value")
    quote = value[0] if value[0] in "\"'" else ""
    closing = quote if len(value) > 1 and value.endswith(quote) else ""
    return match.group("name") + match.group("sep") + quote + _REDACTED + closing


def _user_texts(entry: dict[str, Any]) -> list[str]:
    message = entry.get("message")
    content = message.get("content") if isinstance(message, dict) else None
    if isinstance(content, str):
        if (
            entry.get("isMeta") is True
            or entry.get("isCompactSummary") is True
            or content.startswith(_NOT_TYPED)
        ):
            return []
        return [content]
    if isinstance(content, list) and entry.get("isMeta") is not True:
        return [
            block["text"]
            for block in content
            if isinstance(block, dict)
            and block.get("type") == "text"
            and isinstance(block.get("text"), str)
        ]
    return []


def _attachment_texts(entry: dict[str, Any]) -> list[str]:
    attachment = entry.get("attachment")
    if (
        isinstance(attachment, dict)
        and attachment.get("type") == "queued_command"
        and attachment.get("commandMode") == "prompt"
        and not attachment.get("isMeta")
        and isinstance(attachment.get("prompt"), str)
    ):
        return [attachment["prompt"]]
    return []


def _first_line(tool_input: object) -> str:
    """The first line of the first string value of a tool call's input, or an empty string."""
    if isinstance(tool_input, dict):
        for value in tool_input.values():
            if isinstance(value, str):
                return _redact(value).split("\n")[0]
    return ""


def _pieces(entry: dict[str, Any], kind: str) -> list[tuple[str, str]]:
    """The (label, text) of each item of one entry, redacted, in the order of the entry."""
    if kind == "user":
        return [("user", _redact(text)) for text in _user_texts(entry)]
    if kind == "attachment":
        return [("user", _redact(text)) for text in _attachment_texts(entry)]
    message = entry.get("message")
    content = message.get("content") if isinstance(message, dict) else None
    if not isinstance(content, list):
        return []
    pieces = []
    for block in content:
        if not isinstance(block, dict):
            continue
        if block.get("type") == "text" and isinstance(block.get("text"), str):
            pieces.append(("text", _redact(block["text"])))
        elif block.get("type") == "tool_use" and isinstance(block.get("name"), str):
            pieces.append((f"tool {block['name']}", _first_line(block.get("input"))))
    return pieces


def _format(item_id: str, number: int, stamp: str, label: str, text: str) -> str:
    first, *rest = text.split("\n")
    return "\n".join(
        [f"{item_id} {number} {stamp} {label}: {first}"] + [f"  {row}" for row in rest]
    )


def _parse_line(raw: bytes) -> dict[str, Any] | None:
    """The entry on one line, or None when the line is not UTF-8, not JSON or not an object."""
    try:
        entry = json.loads(raw.decode("utf-8"))
    except (UnicodeDecodeError, ValueError, RecursionError):
        return None
    return entry if isinstance(entry, dict) else None


def _scan_file(path: Path, window: tuple[datetime, datetime] | None) -> tuple[list[_Item], int]:
    """The items of one file inside the window (all of them without one) and its skipped lines."""
    item_id = path.name[: -len(".jsonl")]
    items = []
    skipped = 0
    with path.open("rb") as handle:
        for number, raw in enumerate(handle, 1):
            entry = _parse_line(raw)
            if entry is None:
                skipped += 1
                continue
            kind = entry.get("type")
            if kind not in _ENTRY_TYPES:
                continue
            try:
                when = _parse_time(entry.get("timestamp"))
            except ValueError:
                skipped += 1
                continue
            if window is not None and not window[0] <= when < window[1]:
                continue
            for place, (label, text) in enumerate(_pieces(entry, kind)):
                formatted = _format(item_id, number, entry["timestamp"], label, text)
                items.append(_Item(when, str(path), number, place, formatted))
    return items, skipped


class _Request(NamedTuple):
    folder: Path
    session: str | None
    window: tuple[datetime, datetime] | None


def _reason(exc: OSError) -> str:
    return exc.strerror or str(exc)


def _parse_args(argv: list[str]) -> _Request:
    """The folder, the session id and the window from the command line, or ValueError."""
    if len(argv) >= 2 and argv[1] == "--session":
        if len(argv) != 3:
            raise ValueError(_SESSION_ERROR)
    elif len(argv) != 3:
        raise ValueError(_USAGE_ERROR)
    session = argv[2] if argv[1] == "--session" else None
    window = None
    if session is None:
        start, end = _window_time(argv[1]), _window_time(argv[2])
        if end <= start:
            raise ValueError("the end is not after the start")
        window = (start, end)
    elif _SESSION_ID.fullmatch(session) is None:
        raise ValueError(f"invalid session id: {session!r}")
    return _Request(Path(argv[0]), session, window)


def _stat(path: Path) -> os.stat_result | None:
    """The stat of a path, None when nothing is there; any other failure is a ValueError."""
    try:
        return path.stat()
    except (FileNotFoundError, NotADirectoryError):
        return None
    except OSError as exc:
        raise ValueError(f"cannot read {path}: {_reason(exc)}") from None


def _check_paths(request: _Request) -> None:
    """Raise ValueError when the folder or the session file is not there or cannot be checked."""
    info = _stat(request.folder)
    if info is None:
        raise ValueError(f"no such folder: {request.folder}")
    if not stat.S_ISDIR(info.st_mode):
        raise ValueError(f"not a folder: {request.folder}")
    if request.session is not None:
        main = request.folder / f"{request.session}.jsonl"
        info = _stat(main)
        if info is None or not stat.S_ISREG(info.st_mode):
            raise ValueError(f"no session file: {main}")


def _list(folder: Path, problems: list[str]) -> list[Path]:
    """The entries of a folder; one that cannot be listed is added to problems and gives none."""
    try:
        return sorted(folder.iterdir())
    except (FileNotFoundError, NotADirectoryError):
        return []
    except OSError as exc:
        problems.append(f"cannot read {folder}: {_reason(exc)}")
        return []


def _subagent_files(session_folder: Path, problems: list[str]) -> list[Path]:
    if not any(entry.name == "subagents" for entry in _list(session_folder, problems)):
        return []
    return [
        entry
        for entry in _list(session_folder / "subagents", problems)
        if entry.name.startswith("agent-") and entry.name.endswith(".jsonl")
    ]


def _find_files(request: _Request, problems: list[str]) -> list[Path]:
    """The files to read, sorted by path; folders that cannot be listed are added to problems."""
    if request.session is not None:
        main = request.folder / f"{request.session}.jsonl"
        files = [main, *_subagent_files(request.folder / request.session, problems)]
    else:
        files = []
        for entry in _list(request.folder, problems):
            if entry.name.endswith(".jsonl"):
                files.append(entry)
            else:
                files.extend(_subagent_files(entry, problems))
    return sorted(files, key=str)


def _write(items: list[_Item]) -> None:
    out = sys.stdout.buffer
    for item in items:
        out.write((item.text + "\n").encode("utf-8", "replace"))
    out.flush()


def main(argv: list[str]) -> int:
    problems: list[str] = []
    try:
        request = _parse_args(argv)
        _check_paths(request)
    except ValueError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    files = _find_files(request, problems)
    items: list[_Item] = []
    notes = []
    for path in files:
        try:
            found, skipped = _scan_file(path, request.window)
        except OSError as exc:
            problems.append(f"cannot read {path}: {_reason(exc)}")
            continue
        items.extend(found)
        if skipped:
            notes.append(f"skipped {skipped} lines of {path}")
    for problem in problems:
        print(f"error: {problem}", file=sys.stderr)
    items.sort()
    try:
        _write(items)
    except BrokenPipeError:
        os.dup2(os.open(os.devnull, os.O_WRONLY), sys.stdout.fileno())
        return 1 if problems else 0
    for note in notes:
        print(note, file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
