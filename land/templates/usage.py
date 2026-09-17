#!/usr/bin/env python3
"""The orchestrator's usage row for one step, read from its own session log.

    usage.py <session log> <from ISO time> <to ISO time>

The window runs from the previous landing commit (`git log -1 --format=%cI` on it) to the booking
of this one (`date -Iseconds`). The log is the running session's own: under Claude Code the newest
`~/.claude/projects/<slug>/<session>.jsonl`, under Codex the newest `~/.codex/sessions/.../rollout-*.jsonl`.
The format is told from the file itself.

Claude Code writes one line per content block of an assistant message, each carrying the message's
usage, so a message is counted once, by its id, with the usage of its last line in the window. Codex
writes `token_count` events whose `total_token_usage` is cumulative for the session, so the row is the
last total inside the window less the last total before it; its `input_tokens` include the cached and
cache-written ones, which are taken out to give the fresh input.

Printed as one line:
    <n> messages, <out> output tokens, <cw> cache-write tokens, <cr> cache-read tokens, <fresh> fresh input tokens, <m> minutes
"""

import json
import sys
from datetime import datetime


def moment(text):
    """An ISO time with an offset or a trailing Z, as an aware datetime."""
    return datetime.fromisoformat(text.replace("Z", "+00:00"))


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
    stamp = entry.get("timestamp")
    if not isinstance(stamp, str):
        return False
    try:
        return lo <= moment(stamp) <= hi
    except ValueError:
        return False


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
        if entry.get("type") != "event_msg" or payload.get("type") != "token_count":
            continue
        total = (payload.get("info") or {}).get("total_token_usage")
        stamp = entry.get("timestamp")
        if not isinstance(total, dict) or not isinstance(stamp, str):
            continue
        when = moment(stamp)
        if when < lo:
            before = total
        elif when <= hi:
            last = total
            count += 1
    if last is None:
        return 0, 0, 0, 0, 0

    def field(name):
        base = (before or {}).get(name, 0) or 0
        return (last.get(name, 0) or 0) - base

    cr = field("cached_input_tokens")
    cw = field("cache_write_input_tokens")
    fresh = max(0, field("input_tokens") - cr - cw)
    return count, field("output_tokens"), cw, cr, fresh


def main(argv):
    if len(argv) != 4:
        print("usage: usage.py <session log> <from ISO time> <to ISO time>", file=sys.stderr)
        return 64
    path, lo_text, hi_text = argv[1:4]
    lo, hi = moment(lo_text), moment(hi_text)
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
