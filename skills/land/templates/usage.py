#!/usr/bin/env python3
"""The orchestrator's usage row for one step, read from its own session log.

    usage.py <session log> <from ISO time> <to ISO time>

The window runs from the previous landing commit (`git log -1 --format=%cI` on it) to the booking
of this one (`date -Iseconds`). The log is the running session's own: under Claude Code the newest
`~/.claude/projects/<slug>/<session>.jsonl`, under Codex the newest `~/.codex/sessions/.../rollout-*.jsonl`.
The format is told from the file itself.

Both window times carry an offset or a trailing Z, as `%cI` and `date -Iseconds` give them. A time
without one, or one that cannot be read as an ISO time, is refused with a message naming it and
exit 64. A log line whose own timestamp has no offset or cannot be read is skipped.

Claude Code writes one line per content block of an assistant message, each carrying the message's
usage, so a message is counted once, by its id, with the usage of its last line in the window.

Codex writes one `response_item` line per item of a turn; the messages are those whose payload is a
`message` of role `assistant`, so `<n> messages` means the same for both harnesses. Its tokens come
from `token_count` events, whose `total_token_usage` is cumulative for the session, so the token
figures are the last total inside the window less the last total before it; its `input_tokens`
include the cached and cache-written ones, which are taken out to give the fresh input.

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


def is_codex(path):
    for entry in lines(path):
        return entry.get("type") in ("session_meta", "event_msg", "response_item", "turn_context")
    return False


def inside(entry, lo, hi):
    when = stamp(entry)
    return when is not None and lo <= when <= hi


def claude_row(path, lo, hi):
    by_id = {}
    for entry in lines(path):
        if entry.get("type") != "assistant" or not inside(entry, lo, hi):
            continue
        message = entry.get("message") or {}
        key = message.get("id") or entry.get("uuid")
        by_id[key] = message.get("usage") or {}
    out = cw = cr = fresh = 0
    for usage in by_id.values():
        out += usage.get("output_tokens", 0) or 0
        cw += usage.get("cache_creation_input_tokens", 0) or 0
        cr += usage.get("cache_read_input_tokens", 0) or 0
        fresh += usage.get("input_tokens", 0) or 0
    return len(by_id), out, cw, cr, fresh


def codex_row(path, lo, hi):
    before = None
    last = None
    count = 0
    for entry in lines(path):
        payload = entry.get("payload") or {}
        when = stamp(entry)
        if when is None:
            continue
        if entry.get("type") == "response_item":
            message = payload.get("type") == "message" and payload.get("role") == "assistant"
            if message and lo <= when <= hi:
                count += 1
            continue
        if entry.get("type") != "event_msg" or payload.get("type") != "token_count":
            continue
        total = (payload.get("info") or {}).get("total_token_usage")
        if not isinstance(total, dict):
            continue
        if when < lo:
            before = total
        elif when <= hi:
            last = total
    if last is None:
        return count, 0, 0, 0, 0

    def field(name):
        base = (before or {}).get(name, 0) or 0
        return (last.get(name, 0) or 0) - base

    cr = field("cached_input_tokens")
    cw = field("cache_write_input_tokens")
    fresh = max(0, field("input_tokens") - cr - cw)
    return count, field("output_tokens"), cw, cr, fresh


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
    row = codex_row(path, lo, hi) if is_codex(path) else claude_row(path, lo, hi)
    minutes = round((hi - lo).total_seconds() / 60)
    n, out, cw, cr, fresh = row
    print(
        f"{n} messages, {out} output tokens, {cw} cache-write tokens, "
        f"{cr} cache-read tokens, {fresh} fresh input tokens, {minutes} minutes"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
