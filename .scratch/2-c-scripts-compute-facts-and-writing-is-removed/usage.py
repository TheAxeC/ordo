#!/usr/bin/env python3
"""The orchestrator's usage row for one step, read from its own session log.

    usage.py <session log> <from ISO time> <to ISO time>

The window runs from the previous landing commit (`git log -1 --format=%cI` on it) to the booking
of this one (`date -Iseconds`). The log is the running Claude Code session's own, the newest
`~/.claude/projects/<slug>/<session>.jsonl`. A file in which no line is an assistant message with a
`message` object is not a Claude Code session log, and is refused with a message naming it and
exit 64.

Both window times carry an offset or a trailing Z, as `%cI` and `date -Iseconds` give them. A time
without one, or one that cannot be read as an ISO time, is refused with a message naming it and
exit 64. A log line whose own timestamp has no offset or cannot be read is skipped.

Claude Code writes one line per content block of an assistant message, each carrying the message's
usage, so a message is counted once, by its id, with the usage of its last line in the window.

Printed as one line:
    <n> messages, <out> output tokens, <cw> cache-write tokens, <cr> cache-read tokens, <fresh> fresh input tokens, <m> minutes
"""

import json
import sys
from datetime import datetime


class NoOffset(ValueError):
    """An ISO time without an offset, which cannot be compared with the log's times."""


def moment(text):
    """An ISO time with an offset or a trailing Z, as an aware datetime.

    Raises ValueError when the text cannot be read as an ISO time, and NoOffset when it has no
    offset.
    """
    when = datetime.fromisoformat(text.replace("Z", "+00:00"))
    if when.tzinfo is None:
        raise NoOffset(text)
    return when


def stamp(entry):
    """The entry's timestamp as an aware datetime, or None when moment() cannot give one."""
    text = entry.get("timestamp")
    if not isinstance(text, str):
        return None
    try:
        return moment(text)
    except ValueError:
        return None


def lines(path):
    with open(path, encoding="utf-8") as handle:
        for raw in handle:
            raw = raw.strip()
            if not raw:
                continue
            try:
                yield json.loads(raw)
            except json.JSONDecodeError:
                continue


def is_assistant(entry):
    return (
        isinstance(entry, dict)
        and entry.get("type") == "assistant"
        and isinstance(entry.get("message"), dict)
    )


def is_claude_log(path):
    return any(is_assistant(entry) for entry in lines(path))


def inside(entry, lo, hi):
    when = stamp(entry)
    return when is not None and lo <= when <= hi


def claude_row(path, lo, hi):
    by_id = {}
    for entry in lines(path):
        if not is_assistant(entry) or not inside(entry, lo, hi):
            continue
        message = entry["message"]
        key = message.get("id") or entry.get("uuid")
        by_id[key] = message.get("usage") or {}
    out = cw = cr = fresh = 0
    for usage in by_id.values():
        out += usage.get("output_tokens", 0) or 0
        cw += usage.get("cache_creation_input_tokens", 0) or 0
        cr += usage.get("cache_read_input_tokens", 0) or 0
        fresh += usage.get("input_tokens", 0) or 0
    return len(by_id), out, cw, cr, fresh


def refuse(which, text, reason):
    print(
        f"usage.py: the {which} time {text} {reason}; "
        "give an ISO time with an offset, such as 2026-09-24T19:00:00+02:00",
        file=sys.stderr,
    )
    return 64


def main(argv):
    if len(argv) != 4:
        print("usage: usage.py <session log> <from ISO time> <to ISO time>", file=sys.stderr)
        return 64
    path, lo_text, hi_text = argv[1:4]
    window = []
    for which, text in (("from", lo_text), ("to", hi_text)):
        try:
            window.append(moment(text))
        except NoOffset:
            return refuse(which, text, "has no offset")
        except ValueError:
            return refuse(which, text, "cannot be read")
    lo, hi = window
    if not is_claude_log(path):
        print(
            f"usage.py: {path} is not a Claude Code session log: no line is an assistant message",
            file=sys.stderr,
        )
        return 64
    row = claude_row(path, lo, hi)
    minutes = round((hi - lo).total_seconds() / 60)
    n, out, cw, cr, fresh = row
    print(
        f"{n} messages, {out} output tokens, {cw} cache-write tokens, "
        f"{cr} cache-read tokens, {fresh} fresh input tokens, {minutes} minutes"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
