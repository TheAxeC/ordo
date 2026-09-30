Everything in the brief is done.

## Open items of 2.H's state file (`.scratch/2-h-session-retro/orchestrator-state.md`, "Open items")

none

## The cases' first run, on the unchanged tree

The tree has no `skills/session-retro/templates/transcript_window.py`. The test was written first and run before the script existed: `sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -3` printed

```
FAIL: window in UTC: exit status 2, expected 0; stderr: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '.../skills/session-retro/templates/transcript_window.py': [Errno 2] No such file or directory
```

and exited 1. The test stops at its first failure, so the result of every case was taken from a run of a scratch copy of the same test file in which `fail` returns instead of exiting (script absent beside it). It gave 37 cases, every one failing; each line is the case and its first failed check:

```
window in UTC: exit status 2, expected 0; stderr
window with +02:00 offsets: exit status 2, expected 0; stderr
window with fractions of a second: exit status 2, expected 0; stderr
window with mixed forms: exit status 2, expected 0; stderr
boundary just before the start: exit status 2, expected 0; stderr
boundary at the start: exit status 2, expected 0; stderr
boundary just before the end: exit status 2, expected 0; stderr
boundary at the end: exit status 2, expected 0; stderr
empty window: exit status 2, expected 0; stderr
folder with no .jsonl file: exit status 2, expected 0; stderr
folder path holding a space: exit status 2, expected 0; stderr
under /usr/bin/python3: exit status 2, expected 0; stderr
--session s1: exit status 2, expected 0; stderr
kinds of items: exit status 2, expected 0; stderr
redaction: exit status 2, expected 0; stderr
a line that is not JSON: exit status 2, expected 0; stderr
two lines that are not JSON: exit status 2, expected 0; stderr
a torn last line with no newline: exit status 2, expected 0; stderr
a line with a byte that is not UTF-8: exit status 2, expected 0; stder
a user entry with no timestamp: exit status 2, expected 0; stderr
an entry with a timestamp that has no zone: exit status 2, expected 0;
mode and ai-title entries with no timestamp: exit status 2, expected 0
a file that cannot be read: exit status 2, expected 1; stderr
no arguments: stderr differs, got
a missing folder: stderr differs, got
a folder argument naming a file: stderr differs, got
a time without a zone: stderr differs, got
an unparsable time: stderr differs, got
an end equal to the start: stderr differs, got
an end before the start: stderr differs, got
--session naming no file: stderr differs, got
--session with a subagent id: stderr differs, got
--session with an empty id: stderr differs, got
--session with a path: stderr differs, got
--session with a glob character: stderr differs, got
--session with two times: stderr differs, got
a fourth argument: stderr differs, got
```

No case of the brief's rules gave a wrong result on this run or on reading the rules against the cases, so the build went on.

## DONE / NOT DONE

| Item | Command | Result |
|---|---|---|
| 1 The script | `skills/session-retro/templates/transcript_window.py` | DONE, whole file below |
| 2 The test | `skills/session-retro/templates/transcript_window.test.sh` | DONE, whole file below |
| 3 The two command blocks | `docs/dev/building.md`, `docs/dev/change-standard.md` | DONE, lines below |
| V1 The plan's verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/orchestrator-state.md; echo "rc=$?"` | DONE, output below |
| V2 test under `python3` and `/usr/bin/python3` | see below | DONE |
| V3 test fails on the unchanged tree | see above | DONE |
| V4 ruff | see below | DONE |
| V5 timed run | see below | DONE |
| V6 user count against jq | see below | DONE, equal |
| V7 ASCII grep | see below | DONE |

V1 output (verbatim):

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 9 commands passed
rc=0
```

V2, `sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1` with `python3` (3.13.4 from pyenv) first on PATH:

```
PASS: transcript_window.py scratch tests
```

and with a directory holding only a symlink `python3` to `/usr/bin/python3` first on PATH (`python3 --version` printed `Python 3.9.6` there):

```
PASS: transcript_window.py scratch tests
```

The test also runs the base window case under `/usr/bin/python3` itself (case "under /usr/bin/python3").

V3 is the run quoted under "The cases' first run".

V4:

```
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 skills/session-retro/templates/transcript_window.py
All checks passed!
$ ruff format --check --line-length 100 --target-version py39 skills/session-retro/templates/transcript_window.py
1 file already formatted
```

V5, `time (python3 skills/session-retro/templates/transcript_window.py ~/.claude/projects/-Users-axelfaes-workspace-ordo 2026-09-29T10:00:00Z 2026-09-29T11:00:00Z | wc -l)`:

```
     348
( python3 ... | wc )  1.37s user 0.10s system 81% cpu 1.790 total
```

The run exited 0 and wrote nothing to stderr.

V6: printed lines of kind `user` for that window, `grep -c '^[^ ]* [0-9]* [^ ]* user: '` over the output: 6 (4 of session 6266a558-ed92-43a1-ac08-9bf8f4bc78a8, 1 of agent-a90e54167601b9413, 1 of agent-aa7c9f7235df0acd8). The jq selection over the same files (`cat *.jsonl */subagents/agent-*.jsonl | jq -c -f sel.jq | wc -l` from the transcript folder; `sel.jq` selects on `type`, `timestamp`, `message.content` type, `isMeta`, `isCompactSummary`, `attachment.type`, `attachment.commandMode`, `attachment.isMeta` and the `<task-notification>` prefix only, and counts one per string entry, one per `text` block of an array entry, one per queued prompt): 6, and per file the same 4, 1 and 1. Equal, so no difference to name. On a second window, 2026-09-30T00:00:00Z to 2026-09-30T06:00:00Z, the printed count is 31 and the jq count is 31, with nothing on stderr.

V7: `LC_ALL=C grep -n '[^ -~]'` over `skills/session-retro/templates/transcript_window.py`, `skills/session-retro/templates/transcript_window.test.sh`, `docs/dev/building.md` and `docs/dev/change-standard.md` printed nothing (exit 1 from grep, no match).

Mutation check of the test on scratch copies of the script (each changed one behaviour, the test went red on it): the start bound made exclusive, the end bound made inclusive, the `user` label renamed, the PEM pattern removed, the key-shape pattern's boundary removed, the item sort removed, the `attachment.isMeta` exclusion removed, the `<task-notification>` exclusion removed, the indent of further lines removed, exit status 1 replaced by 0, and the skipped-line count removed. Sorting the file list before reading only fixes the order of the stderr lines across files, and no case observes it.

## Files

New: `skills/session-retro/templates/transcript_window.py` (385 lines) and `skills/session-retro/templates/transcript_window.test.sh` (442 lines). Changed: `docs/dev/building.md` (one line added, 10 to 11 lines in the block), `docs/dev/change-standard.md` (one line added).

### `skills/session-retro/templates/transcript_window.py`

```python
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
                <task-notification>); each `text` block of a `user` entry whose content is an
                array (unless the entry has isMeta true); the prompt of an `attachment` entry
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
    a PEM private key block, from a -----BEGIN ... PRIVATE KEY----- line to its
    -----END ... PRIVATE KEY----- line;
    the rest of the line after Authorization:, Proxy-Authorization:, Cookie: or Set-Cookie:, and
    the word after `Bearer ` or `Basic `;
    the value of a name that is, or ends in, password, passwd, secret, token, api_key, api-key,
    apikey, access_key, access-key, private_key or credentials, written name=value, name: value,
    "name": "value", name="value" or name='value': the value inside the quotes when quoted, and
    otherwise up to whitespace, a comma or a quote;
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
A file that cannot be opened or read is reported on stderr as
`error: cannot read <file>: <reason>`; the other files are still printed and the exit status is 1.

Exit statuses: 0 the output printed (an empty window prints nothing and exits 0), 1 a file could
not be read and the output lacks it, 2 a usage error.

Standard library only; runs on Python 3.9 and newer.
"""

from __future__ import annotations

import json
import re
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
_PEM_KEY = re.compile(
    r"-----BEGIN [A-Z ]*PRIVATE KEY-----.*?-----END [A-Z ]*PRIVATE KEY-----",
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
_SCHEME_WORD = re.compile(r"\b(Bearer|Basic)( +)[^\s\"',;]+", re.IGNORECASE)
_NAMED_VALUE = re.compile(
    r"(?P<name>password|passwd|secret|token|api_key|api-key|apikey|access_key|access-key"
    r"|private_key|credentials)(?P<sep>[\"']?[ \t]*[:=][ \t]*)"
    r"(?P<value>\"[^\"\n]*\"?|'[^'\n]*'?|[^\s,\"']+)",
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
            or content.startswith("<task-notification>")
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
    files: list[Path]
    window: tuple[datetime, datetime] | None


def _parse_args(argv: list[str]) -> _Request:
    """The files to read and the window from the command line, or ValueError with the error."""
    if len(argv) >= 2 and argv[1] == "--session":
        if len(argv) != 3:
            raise ValueError(_SESSION_ERROR)
    elif len(argv) != 3:
        raise ValueError(_USAGE_ERROR)
    folder = Path(argv[0])
    session = argv[2] if argv[1] == "--session" else None
    window = None
    if session is None:
        start, end = _window_time(argv[1]), _window_time(argv[2])
        if end <= start:
            raise ValueError("the end is not after the start")
        window = (start, end)
    elif _SESSION_ID.fullmatch(session) is None:
        raise ValueError(f"invalid session id: {session!r}")
    if not folder.is_dir():
        raise ValueError(
            f"not a folder: {folder}" if folder.exists() else f"no such folder: {folder}"
        )
    if session is None:
        files = list(folder.glob("*.jsonl")) + list(folder.glob("*/subagents/agent-*.jsonl"))
    else:
        main = folder / f"{session}.jsonl"
        if not main.is_file():
            raise ValueError(f"no session file: {main}")
        files = [main, *(folder / session / "subagents").glob("agent-*.jsonl")]
    return _Request(sorted(files, key=str), window)


def main(argv: list[str]) -> int:
    try:
        request = _parse_args(argv)
    except ValueError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2
    items: list[_Item] = []
    notes = []
    status = 0
    for path in request.files:
        try:
            found, skipped = _scan_file(path, request.window)
        except OSError as exc:
            print(f"error: cannot read {path}: {exc.strerror or exc}", file=sys.stderr)
            status = 1
            continue
        items.extend(found)
        if skipped:
            notes.append(f"skipped {skipped} lines of {path}")
    items.sort()
    out = sys.stdout.buffer
    for item in items:
        out.write((item.text + "\n").encode("utf-8", "replace"))
    out.flush()
    for note in notes:
        print(note, file=sys.stderr)
    return status


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
```

### `skills/session-retro/templates/transcript_window.test.sh`

```sh
#!/bin/sh
# Exercise transcript_window.py on scratch transcript folders, each case one folder and one run, checking stdout, stderr and the exit status.
# A folder holds a main session s1.jsonl, its subagent s1/subagents/agent-a1.jsonl, a nested subagent agent-a2.jsonl in the same folder, a second main session s2.jsonl and its subagent agent-b1.jsonl.
# Window: entries at 10:00:00.000Z and 10:59:59.999Z are printed, entries at 09:59:59.999Z and 11:00:00.000Z are not, each boundary also checked alone; the same window written with +02:00 offsets, with and without fractions of a second, and mixed, prints the same; an entry stamped 10:30:00+00:00 is compared as a time and printed with its own stamp; an empty window prints nothing; a folder with no .jsonl file prints nothing; a folder path holding a space works.
# Files: a subagent entry in the window prints with the prefix agent-a1 and one outside does not; the subagent file of another session and the nested subagent file print; entries of s1, agent-a1 and s2 interleave by timestamp, and equal timestamps in s1.jsonl and s2.jsonl print in path order; the prefix carries the line number of the entry; --session s1 prints every entry of s1.jsonl, agent-a1 and agent-a2 and none of s2; the script runs under /usr/bin/python3 as under python3.
# Printed as user: a user string, a user string starting <command-name>, a text block of a user array, a queued_command attachment with commandMode prompt and humanTurn, the first user string of a subagent. Not printed: a user string with isMeta or isCompactSummary, one starting <task-notification>, a text block of a user array with isMeta, a tool_result block, a queued_command with attachment.isMeta, one with commandMode task-notification, an attachment of another type, a queue-operation entry, a thinking block.
# Assistant entries: a text block prints as text; a Bash call prints its first command line only; a Read call its file_path; an Agent call its description; a call with input {} and a call whose first string value starts with a newline print the prefix and nothing after it; a number before the first string value is passed over; a text of three lines indents its second and third lines by two spaces; the blocks of one entry print in their order.
# Redaction: an sk-ant key, an sk_live key, a ghp token, a glpat token, an AKIA key, a JWT, a Slack webhook URL, Authorization: Bearer and Basic, Cookie: session=, password=hunter2 unquoted and quoted, api_key= and "api_key": quoted, AWS_SECRET_ACCESS_KEY=, x-api-key:, a PEM private key block, a URL password, and the other key shapes (sk-, github_pat_, npm_, hf_, xoxb-, AIza, a Bearer word) print as <REDACTED>; a secret in a tool input is redacted before its first line is taken; a 40-character commit hash, a UUID, an agent id, max_tokens: 100 and a task- word of 20 letters print as they are.
# Lines skipped, each with exit 0 and the rest printed: a line that is not JSON, two such lines, a torn last line with no newline, a line with a byte that is not UTF-8, a user entry with no timestamp, and an entry with a timestamp that has no zone give skipped <n> lines of <file> on stderr; a mode and an ai-title entry with no timestamp are not counted and give no stderr line.
# A file that cannot be read (mode 000, skipped when the test runs as root) gives error: cannot read <file> on stderr, the other files print, and the exit status is 1.
# Errors, each exit 2 with one error: line on stderr and nothing on stdout: no arguments, a missing folder, a folder argument naming a file, a time without a zone, an unparsable time, an end equal to the start, an end before the start, --session naming no file, --session a1 (a subagent id), --session "", --session ../x, --session '*', --session s1 with two times, a fourth argument.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/transcript-window-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
reader=$script_dir/transcript_window.py
out=$test_root/out
err=$test_root/err
exp_out=$test_root/exp-out
exp_err=$test_root/exp-err

# Run the reader with the given arguments, keeping stdout, stderr and the exit status.
run() {
    python3 "$reader" "$@" >"$out" 2>"$err"
    status=$?
}

# Write each argument as one line of the file named by the first argument; no further argument gives an empty file.
lines() {
    dest=$1
    shift
    : >"$dest"
    for text in "$@"; do
        printf '%s\n' "$text" >>"$dest"
    done
}

want_out() {
    lines "$exp_out" "$@"
}

want_err() {
    lines "$exp_err" "$@"
}

# Compare the last run with the wanted stdout, stderr and exit status.
check() {
    [ "$status" -eq "$2" ] || fail "$1: exit status $status, expected $2; stderr: $(cat "$err")"
    cmp -s "$out" "$exp_out" || fail "$1: stdout differs, got: $(cat "$out")"
    cmp -s "$err" "$exp_err" || fail "$1: stderr differs, got: $(cat "$err")"
}

# A usage error: exit 2, the one error line, nothing on stdout.
check_error() {
    want_out
    want_err "$2"
    check "$1" 2
}

usage_line='error: expected <transcript folder> <start> <end> or <transcript folder> --session <session id>'
session_line='error: --session takes one session id and no times or further arguments'

# Entry builders: each prints one transcript line with the field names and nesting of a real entry.
user_line() {
    printf '{"type":"user"%s,"message":{"role":"user","content":"%s"},"uuid":"u1","timestamp":"%s","sessionId":"%s"}\n' "$4" "$3" "$1" "$2"
}

user_array_line() {
    printf '{"type":"user"%s,"message":{"role":"user","content":[%s]},"uuid":"u2","timestamp":"%s","sessionId":"%s"}\n' "$4" "$3" "$1" "$2"
}

assistant_line() {
    printf '{"type":"assistant","message":{"role":"assistant","content":[%s]},"uuid":"a1","timestamp":"%s","sessionId":"%s"}\n' "$3" "$1" "$2"
}

text_line() {
    assistant_line "$1" "$2" "{\"type\":\"text\",\"text\":\"$3\"}"
}

tool_line() {
    assistant_line "$1" "$2" "{\"type\":\"tool_use\",\"id\":\"t1\",\"name\":\"$3\",\"input\":$4}"
}

attachment_line() {
    printf '{"type":"attachment","attachment":%s,"uuid":"t1","timestamp":"%s","sessionId":"%s"}\n' "$3" "$1" "$2"
}

# The base folder: two main sessions, a subagent of each, and a nested subagent in the folder of s1.
make_base() {
    base=$test_root/$1
    mkdir -p "$base/s1/subagents" "$base/s2/subagents"
    {
        text_line 2026-09-30T09:59:59.999Z s1 "s1 before"
        text_line 2026-09-30T10:00:00.000Z s1 "s1 at start"
        text_line 2026-09-30T10:30:00+00:00 s1 "s1 other zone form"
        text_line 2026-09-30T10:59:59.999Z s1 "s1 last"
        text_line 2026-09-30T11:00:00.000Z s1 "s1 at end"
    } >"$base/s1.jsonl"
    {
        user_line 2026-09-30T10:10:00.000Z s1 "a1 prompt" ""
        text_line 2026-09-30T10:20:00.000Z s1 "a1 in"
        text_line 2026-09-30T11:30:00.000Z s1 "a1 out"
    } >"$base/s1/subagents/agent-a1.jsonl"
    text_line 2026-09-30T10:40:00.000Z s1 "a2 nested" >"$base/s1/subagents/agent-a2.jsonl"
    {
        text_line 2026-09-30T10:15:00.000Z s2 "s2 first"
        text_line 2026-09-30T10:30:00.000Z s2 "s2 tie"
    } >"$base/s2.jsonl"
    text_line 2026-09-30T10:50:00.000Z s2 "b1 in" >"$base/s2/subagents/agent-b1.jsonl"
}

want_base_window() {
    want_out \
        "s1 2 2026-09-30T10:00:00.000Z text: s1 at start" \
        "agent-a1 1 2026-09-30T10:10:00.000Z user: a1 prompt" \
        "s2 1 2026-09-30T10:15:00.000Z text: s2 first" \
        "agent-a1 2 2026-09-30T10:20:00.000Z text: a1 in" \
        "s1 3 2026-09-30T10:30:00+00:00 text: s1 other zone form" \
        "s2 2 2026-09-30T10:30:00.000Z text: s2 tie" \
        "agent-a2 1 2026-09-30T10:40:00.000Z text: a2 nested" \
        "agent-b1 1 2026-09-30T10:50:00.000Z text: b1 in" \
        "s1 4 2026-09-30T10:59:59.999Z text: s1 last"
    want_err
}

make_base base
base=$test_root/base

# The window, its boundaries, its forms, the files it reaches, their order and the prefix.
run "$base" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_base_window
check "window in UTC" 0

run "$base" 2026-09-30T12:00:00+02:00 2026-09-30T13:00:00+02:00
want_base_window
check "window with +02:00 offsets" 0

run "$base" 2026-09-30T10:00:00.000Z 2026-09-30T11:00:00.000Z
want_base_window
check "window with fractions of a second" 0

run "$base" 2026-09-30T12:00:00.000+02:00 2026-09-30T11:00:00Z
want_base_window
check "window with mixed forms" 0

run "$base" 2026-09-30T09:59:59.999Z 2026-09-30T10:00:00.000Z
want_out "s1 1 2026-09-30T09:59:59.999Z text: s1 before"
want_err
check "boundary just before the start" 0

run "$base" 2026-09-30T10:00:00.000Z 2026-09-30T10:00:00.001Z
want_out "s1 2 2026-09-30T10:00:00.000Z text: s1 at start"
want_err
check "boundary at the start" 0

run "$base" 2026-09-30T10:59:59.999Z 2026-09-30T11:00:00.000Z
want_out "s1 4 2026-09-30T10:59:59.999Z text: s1 last"
want_err
check "boundary just before the end" 0

run "$base" 2026-09-30T11:00:00.000Z 2026-09-30T11:00:00.001Z
want_out "s1 5 2026-09-30T11:00:00.000Z text: s1 at end"
want_err
check "boundary at the end" 0

run "$base" 2026-09-30T11:00:00.001Z 2026-09-30T11:29:59.999Z
want_out
want_err
check "empty window" 0

mkdir "$test_root/empty-folder"
run "$test_root/empty-folder" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_out
want_err
check "folder with no .jsonl file" 0

cp -R "$base" "$test_root/with space"
run "$test_root/with space" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_base_window
check "folder path holding a space" 0

if [ -x /usr/bin/python3 ]; then
    /usr/bin/python3 "$reader" "$base" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z >"$out" 2>"$err"
    status=$?
    want_base_window
    check "under /usr/bin/python3" 0
fi

run "$base" --session s1
want_out \
    "s1 1 2026-09-30T09:59:59.999Z text: s1 before" \
    "s1 2 2026-09-30T10:00:00.000Z text: s1 at start" \
    "agent-a1 1 2026-09-30T10:10:00.000Z user: a1 prompt" \
    "agent-a1 2 2026-09-30T10:20:00.000Z text: a1 in" \
    "s1 3 2026-09-30T10:30:00+00:00 text: s1 other zone form" \
    "agent-a2 1 2026-09-30T10:40:00.000Z text: a2 nested" \
    "s1 4 2026-09-30T10:59:59.999Z text: s1 last" \
    "s1 5 2026-09-30T11:00:00.000Z text: s1 at end" \
    "agent-a1 3 2026-09-30T11:30:00.000Z text: a1 out"
want_err
check "--session s1" 0

# What is printed, by kind: one main session whose n-th line is stamped 10:nn:00.000Z.
kinds=$test_root/kinds
mkdir "$kinds"
n=0
tick() {
    n=$((n + 1))
    ts=$(printf '2026-09-30T10:%02d:00.000Z' "$n")
}
{
    tick; user_line "$ts" k1 "typed message" ""
    tick; user_line "$ts" k1 "<command-name>/plan</command-name>" ""
    tick; user_array_line "$ts" k1 '{"type":"text","text":"[Request interrupted by user]"}' ""
    tick; attachment_line "$ts" k1 '{"type":"queued_command","prompt":"queued while busy","commandMode":"prompt","humanTurn":true}'
    tick; user_line "$ts" k1 "skill body" ',"isMeta":true'
    tick; user_line "$ts" k1 "compaction summary" ',"isCompactSummary":true'
    tick; user_line "$ts" k1 "<task-notification>task done" ""
    tick; user_array_line "$ts" k1 '{"type":"text","text":"meta array"}' ',"isMeta":true'
    tick; user_array_line "$ts" k1 '{"type":"tool_result","tool_use_id":"t9","content":"tool output"}' ""
    tick; attachment_line "$ts" k1 '{"type":"queued_command","prompt":"hand-back","commandMode":"prompt","isMeta":true,"origin":{"kind":"peer"}}'
    tick; attachment_line "$ts" k1 '{"type":"queued_command","prompt":"notified","commandMode":"task-notification"}'
    tick; attachment_line "$ts" k1 '{"type":"skill_listing","content":"listing"}'
    tick; printf '{"type":"queue-operation","operation":"enqueue","content":"queued","timestamp":"%s","sessionId":"k1"}\n' "$ts"
    tick; assistant_line "$ts" k1 '{"type":"thinking","thinking":"private thoughts","signature":"x"}'
    tick; text_line "$ts" k1 "assistant says"
    tick; tool_line "$ts" k1 Bash '{"command":"ls -la\nsecond line","description":"list"}'
    tick; tool_line "$ts" k1 Read '{"file_path":"/tmp/a.txt"}'
    tick; tool_line "$ts" k1 Agent '{"description":"Check the tree","prompt":"long prompt"}'
    tick; tool_line "$ts" k1 ListAgents '{}'
    tick; tool_line "$ts" k1 Bash '{"command":"\nls"}'
    tick; text_line "$ts" k1 'one\ntwo\nthree'
    tick; tool_line "$ts" k1 Foo '{"count":3,"command":"x"}'
    tick; assistant_line "$ts" k1 '{"type":"text","text":"first block"},{"type":"tool_use","id":"t2","name":"Bash","input":{"command":"echo hi"}}'
} >"$kinds/k1.jsonl"
run "$kinds" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_out \
    "k1 1 2026-09-30T10:01:00.000Z user: typed message" \
    "k1 2 2026-09-30T10:02:00.000Z user: <command-name>/plan</command-name>" \
    "k1 3 2026-09-30T10:03:00.000Z user: [Request interrupted by user]" \
    "k1 4 2026-09-30T10:04:00.000Z user: queued while busy" \
    "k1 15 2026-09-30T10:15:00.000Z text: assistant says" \
    "k1 16 2026-09-30T10:16:00.000Z tool Bash: ls -la" \
    "k1 17 2026-09-30T10:17:00.000Z tool Read: /tmp/a.txt" \
    "k1 18 2026-09-30T10:18:00.000Z tool Agent: Check the tree" \
    "k1 19 2026-09-30T10:19:00.000Z tool ListAgents: " \
    "k1 20 2026-09-30T10:20:00.000Z tool Bash: " \
    "k1 21 2026-09-30T10:21:00.000Z text: one" \
    "  two" \
    "  three" \
    "k1 22 2026-09-30T10:22:00.000Z tool Foo: x" \
    "k1 23 2026-09-30T10:23:00.000Z text: first block" \
    "k1 23 2026-09-30T10:23:00.000Z tool Bash: echo hi"
want_err
check "kinds of items" 0

# Redaction: each line of the first table is planted in a text and printed as the second field says; each line of the second table is planted and printed unchanged.
redact=$test_root/redact
mkdir "$redact"
cat >"$test_root/changed" <<'EOF'
key sk-ant-abcdEFGH1234 end|key <REDACTED> end
key sk-abcdefghij0123456789KLMN end|key <REDACTED> end
key sk_live_abcdefghij0123456789 end|key <REDACTED> end
key ghp_abcdefghij0123456789ABCD end|key <REDACTED> end
key github_pat_abcdefghij0123456789 end|key <REDACTED> end
key glpat-abcdefghij0123456789 end|key <REDACTED> end
key npm_abcdefghij0123456789abcdefghij012345 end|key <REDACTED> end
key hf_abcdefghij0123456789abcdefghij end|key <REDACTED> end
key AKIAABCDEFGHIJKLMNOP end|key <REDACTED> end
key xoxb-0123456789-abcdefghij end|key <REDACTED> end
key AIzaabcdefghij0123456789abcdefghij01234 end|key <REDACTED> end
jwt eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0NTY3ODkwIn0.abcdefghij1234 end|jwt <REDACTED> end
hook https://hooks.slack.com/services/T0000/B0000/abcdEFGH end|hook <REDACTED> end
Authorization: Bearer abcDEF123xyz|Authorization: <REDACTED>
Authorization: Basic dXNlcjpwYXNz|Authorization: <REDACTED>
Cookie: session=abc123; theme=dark|Cookie: <REDACTED>
use Bearer abcDEF123xyz here|use Bearer <REDACTED> here
password=hunter2 end|password=<REDACTED> end
password='hunter2' end|password='<REDACTED>' end
api_key=\"abc123def456\" end|api_key="<REDACTED>" end
\"api_key\": \"abc123def456\" end|"api_key": "<REDACTED>" end
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMIabc end|AWS_SECRET_ACCESS_KEY=<REDACTED> end
x-api-key: abc123def456 end|x-api-key: <REDACTED> end
key -----BEGIN PRIVATE KEY-----\nMIIabc\n-----END PRIVATE KEY----- end|key <REDACTED> end
see https://u:pw@host/x end|see https://u:<REDACTED>@host/x end
EOF
cat >"$test_root/kept" <<'EOF'
commit 0123456789abcdef0123456789abcdef01234567 end
id 123e4567-e89b-12d3-a456-426614174000 end
agent af66dae24a3304e3e end
max_tokens: 100 end
word task-abcdefghijklmnopqrst end
EOF
n=0
: >"$exp_out"
{
    while IFS='|' read -r planted printed; do
        tick
        text_line "$ts" r1 "$planted"
        printf 'r1 %s %s text: %s\n' "$n" "$ts" "$printed" >>"$exp_out"
    done <"$test_root/changed"
    while IFS= read -r kept; do
        tick
        text_line "$ts" r1 "$kept"
        printf 'r1 %s %s text: %s\n' "$n" "$ts" "$kept" >>"$exp_out"
    done <"$test_root/kept"
    tick
    tool_line "$ts" r1 Bash '{"command":"export API_KEY=abc123\nsecond line"}'
    printf 'r1 %s %s tool Bash: export API_KEY=<REDACTED>\n' "$n" "$ts" >>"$exp_out"
} >"$redact/r1.jsonl"
run "$redact" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_err
check "redaction" 0

# Lines skipped: each case a folder with one session file.
skip_case() {
    mkdir "$test_root/$1"
    cat >"$test_root/$1/sk.jsonl"
}

good_before=$(text_line 2026-09-30T10:01:00.000Z sk "good before")
good_after=$(text_line 2026-09-30T10:02:00.000Z sk "good after")
want_two_lines() {
    want_out \
        "sk 1 2026-09-30T10:01:00.000Z text: good before" \
        "sk 3 2026-09-30T10:02:00.000Z text: good after"
}
window_args="2026-09-30T10:00:00Z 2026-09-30T11:00:00Z"

printf '%s\nthis is not json\n%s\n' "$good_before" "$good_after" | skip_case skip-json
run "$test_root/skip-json" $window_args
want_two_lines
want_err "skipped 1 lines of $test_root/skip-json/sk.jsonl"
check "a line that is not JSON" 0

printf '%s\nthis is not json\nnor is this\n%s\n' "$good_before" "$good_after" | skip_case skip-two
run "$test_root/skip-two" $window_args
want_out \
    "sk 1 2026-09-30T10:01:00.000Z text: good before" \
    "sk 4 2026-09-30T10:02:00.000Z text: good after"
want_err "skipped 2 lines of $test_root/skip-two/sk.jsonl"
check "two lines that are not JSON" 0

printf '%s\n%s\n{"type":"assistant","message":{"role":"assis' "$good_before" "$good_after" | skip_case skip-torn
run "$test_root/skip-torn" $window_args
want_out \
    "sk 1 2026-09-30T10:01:00.000Z text: good before" \
    "sk 2 2026-09-30T10:02:00.000Z text: good after"
want_err "skipped 1 lines of $test_root/skip-torn/sk.jsonl"
check "a torn last line with no newline" 0

printf '%s\n{"type":"assistant","x":"\377"}\n%s\n' "$good_before" "$good_after" | skip_case skip-bytes
run "$test_root/skip-bytes" $window_args
want_two_lines
want_err "skipped 1 lines of $test_root/skip-bytes/sk.jsonl"
check "a line with a byte that is not UTF-8" 0

printf '%s\n{"type":"user","message":{"role":"user","content":"no stamp"},"sessionId":"sk"}\n%s\n' "$good_before" "$good_after" | skip_case skip-stamp
run "$test_root/skip-stamp" $window_args
want_two_lines
want_err "skipped 1 lines of $test_root/skip-stamp/sk.jsonl"
check "a user entry with no timestamp" 0

printf '%s\n{"type":"assistant","timestamp":"2026-09-30T10:01:30","message":{"content":[]}}\n%s\n' "$good_before" "$good_after" | skip_case skip-zone
run "$test_root/skip-zone" $window_args
want_two_lines
want_err "skipped 1 lines of $test_root/skip-zone/sk.jsonl"
check "an entry with a timestamp that has no zone" 0

printf '%s\n{"type":"mode","mode":"plan"}\n{"type":"ai-title","aiTitle":"a title"}\n%s\n' "$good_before" "$good_after" | skip_case skip-none
run "$test_root/skip-none" $window_args
want_out \
    "sk 1 2026-09-30T10:01:00.000Z text: good before" \
    "sk 4 2026-09-30T10:02:00.000Z text: good after"
want_err
check "mode and ai-title entries with no timestamp" 0

# A file that cannot be read.
if [ "$(id -u)" -ne 0 ]; then
    mkdir "$test_root/unreadable"
    text_line 2026-09-30T10:01:00.000Z ok "readable" >"$test_root/unreadable/ok.jsonl"
    text_line 2026-09-30T10:02:00.000Z no "locked" >"$test_root/unreadable/no.jsonl"
    chmod 000 "$test_root/unreadable/no.jsonl"
    run "$test_root/unreadable" $window_args
    want_out "ok 1 2026-09-30T10:01:00.000Z text: readable"
    want_err "error: cannot read $test_root/unreadable/no.jsonl: Permission denied"
    check "a file that cannot be read" 1
fi

# Errors.
run
check_error "no arguments" "$usage_line"

run "$test_root/missing" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
check_error "a missing folder" "error: no such folder: $test_root/missing"

: >"$test_root/afile"
run "$test_root/afile" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
check_error "a folder argument naming a file" "error: not a folder: $test_root/afile"

run "$base" 2026-09-30T10:00:00 2026-09-30T11:00:00Z
check_error "a time without a zone" "error: time without a zone: '2026-09-30T10:00:00'"

run "$base" 2026-09-30T10:00:00Z yesterday
check_error "an unparsable time" "error: unparsable time: 'yesterday'"

run "$base" 2026-09-30T10:00:00Z 2026-09-30T10:00:00Z
check_error "an end equal to the start" "error: the end is not after the start"

run "$base" 2026-09-30T11:00:00Z 2026-09-30T10:00:00Z
check_error "an end before the start" "error: the end is not after the start"

run "$base" --session nothere
check_error "--session naming no file" "error: no session file: $base/nothere.jsonl"

run "$base" --session a1
check_error "--session with a subagent id" "error: no session file: $base/a1.jsonl"

run "$base" --session ""
check_error "--session with an empty id" "error: invalid session id: ''"

run "$base" --session ../x
check_error "--session with a path" "error: invalid session id: '../x'"

run "$base" --session '*'
check_error "--session with a glob character" "error: invalid session id: '*'"

run "$base" --session s1 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
check_error "--session with two times" "$session_line"

run "$base" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z extra
check_error "a fourth argument" "$usage_line"

printf 'PASS: transcript_window.py scratch tests\n'
```

## Changed lines of the other files

`docs/dev/building.md`, after line 10 (the `git_guard.test.sh` line), before: the next line was line 11, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary   # ...`. After, new line 11:

```
sh skills/session-retro/templates/transcript_window.test.sh  # transcript_window.py on scratch transcript folders: the window and its boundaries in each time form, the main and subagent files, the order and the prefix, what counts as a user message, assistant text and tool calls, each redaction pattern, skipped lines, an unreadable file and the usage errors
```

`docs/dev/change-standard.md`, after line 71 (`sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1`), before: line 72 was `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`. After, new line 72:

```
sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
```

The command blocks now end at `docs/dev/building.md` line 16 and `docs/dev/change-standard.md` line 77 (the brief's paths list 5-15 and 66-76; each gains the one line). `grep -rn -e "git_guard.test.sh" -e "check_coverage.test.sh" skills utils docs README.md` finds the two blocks and `docs/roadmap.md:218` (an unrelated sentence), so no other list of the tests exists to carry the line to. `docs/dev/building.md` closing sentence ("a new script under a skill's `templates/` ... adds its test here and to the command block of `docs/dev/change-standard.md`") still holds and is what this step fulfils.

## Judgment calls the brief left open

1. A printed item with an empty text (a call with no string input, or one whose first string starts with a newline) ends with the prefix's trailing space: the line is `<id> <line> <timestamp> tool ListAgents: ` with a space after the colon. The brief's prefix is defined as ending in `: `, and its case says "the prefix with nothing after it"; the test writes the space.
2. "By file path" in the order is the string of the path, so at equal timestamps `s1.jsonl` comes before `s1/subagents/agent-a1.jsonl` (the character `.` sorts before `/`). A `pathlib` comparison would put the subagent file first.
3. Time argument syntax: `YYYY-MM-DDTHH:MM:SS`, an optional fraction of any length (cut to microseconds), then `Z` or `+HH:MM` or `+HHMM`, letters in any case. Seconds are required. A date alone or a time with no zone gives `time without a zone` when it matches the shape and `unparsable time` otherwise; a value out of range (month 13, offset of 24 hours or more) is `unparsable time`. Entry timestamps are parsed by the same function, so an entry timestamp in another form is skipped and counted.
4. The wording of each error line (the brief gives the form `error: <what>` and the conditions): the strings are listed in the script's head docstring and in the test.
5. An entry of type `user`, `assistant` or `attachment` whose JSON is valid but whose top-level value is not an object (a list, a number) counts as a skipped line, as does an empty line in the middle of a file.
6. A file that fails while it is being read (not only at opening) contributes none of its items and is reported as `cannot read`, so the output lacks the whole file, as exit status 1 says.
7. A `text` block or prompt whose text is not a string, and a `tool_use` without a string `name`, is not an item; the survey (`jq` over every file: `assistant` content is always an array, `attachment.prompt` always a string, `text` blocks always strings) finds none of these in the real transcripts.
8. Standard output is written as UTF-8 bytes with unencodable characters (lone surrogates from JSON escapes) replaced by `?`.
9. A `Bearer`/`Basic` word is redacted after the header pattern; the word is what follows the scheme up to whitespace, a quote, a comma or a semicolon. A name-value pattern matches the keyword itself (`token`, `secret`, ...) followed directly by an optional quote, optional blanks on the line and `:` or `=`, so the "ends in" rule needs no prefix match. Blanks between the separator and the value do not cross a newline. A quoted value with no closing quote on its line is redacted to the end of the quote.
10. A read-only `git show HEAD:<file>` was run twice, against `docs/dev/building.md` and `docs/dev/change-standard.md`, to print the before and after of the two command-block lines; no other git command was run and nothing was changed by it.

## User-visible changes

A new command exists, `python3 skills/session-retro/templates/transcript_window.py <transcript folder> <start> <end>` (or `--session <session id>`), and a new test line in the two command blocks. Before: no such command, no such lines. After: as the head docstring of the script states, and as the two lines above show.

## Anything in the brief that was wrong or impossible

- The brief's redaction rule takes "the word after `Bearer ` or `Basic `" in any letter case, so ordinary English (`Basic setup`, `basic ...`) has its next word replaced by `<REDACTED>` as well. Over the real folder for 2026-09-29T00:00:00Z to 2026-09-30T12:00:00Z (`... | grep -ci 'basic <REDACTED>'`, `grep -ci 'bearer <REDACTED>'` over the output) 1 printed line holds `Basic <REDACTED>` and 2 hold `Bearer <REDACTED>`, out of 76 lines holding `<REDACTED>` in 13098 printed lines; whether those hits are prose or secrets is not verified, since no message text was read. The script follows the brief as written. If the reader should redact only where a scheme word is followed by a token-shaped word, the brief's rule needs a change, which is the orchestrator's to write.
- The name-value rule redacts prose like `token: <word>` and type annotations (`token: str`), as the brief's rule says; not changed.
- The brief's "Read" list names `docs/dev/design-principles.md`, which does not exist (the brief check found the page at `skills/repo-setup/templates/docs/dev/design-principles.md`); I read that one.
- The typing check `python.md` names (pyright) is not run here, as the brief says; the ruff `ANN` selection passes.
