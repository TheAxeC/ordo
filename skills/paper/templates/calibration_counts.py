#!/usr/bin/env python3
"""Count the misses and false alarms of the citation compliance agent's judgment per label.

Usage: calibration_counts.py <table.md>

The table is a Markdown table with the columns pair, label and judged, one row per pair. The label is how the pair was built and the judged label is the one the agent's result gave. Both are one of: supported, unsupported, partly supported. Text outside the table is ignored. Row order and extra columns do not matter.

For each label the script counts the pairs of that label that the agent judged as another label (misses) and the pairs that the agent judged as that label and that are of another label (false alarms). A miss rate is the misses divided by the pairs of the label. A false-alarm rate is the false alarms divided by the pairs of the other labels.

Reads: the table, as UTF-8.

Writes: nothing.

Prints: one line per label, "<label>: <n> pairs, misses <m> (<rate>), false alarms <f> of <o> (<rate>)", then a last line starting PASS: or FAIL:.

Errors, each printed on standard error with exit status 2: a call without exactly one argument (the usage line is printed), a table that is missing, unreadable, without the three columns, with a row whose number of cells differs from the header's, with a label outside the three, with a pair listed twice, or with no pair of one of the labels.

Exit status: 0 when every miss rate is below 0.15 and every false-alarm rate is below 0.10, 1 when one is at or above its limit, 2 for the errors above.
"""
from __future__ import annotations

import sys

LABELS = ("supported", "unsupported", "partly supported")
MISS_LIMIT = 0.15
FALSE_ALARM_LIMIT = 0.10


def fail(message: str) -> None:
    print(f"calibration_counts.py: error: {message}", file=sys.stderr)
    sys.exit(2)


def cells(line: str) -> list[str]:
    return [cell.strip() for cell in line.strip().strip("|").split("|")]


def read_rows(path: str) -> list[tuple[str, str, str]]:
    try:
        with open(path, encoding="utf-8") as handle:
            lines = handle.read().splitlines()
    except (OSError, UnicodeDecodeError) as error:
        fail(f"cannot read {path}: {error}")
    header = None
    rows: list[tuple[str, str, str]] = []
    seen: set[str] = set()
    for line in lines:
        if not line.strip().startswith("|"):
            continue
        row = cells(line)
        if header is None:
            names = [name.lower() for name in row]
            if all(name in names for name in ("pair", "label", "judged")):
                header = names
            continue
        if all(set(cell) <= set("-: ") for cell in row):
            continue
        if len(row) != len(header):
            fail(f"a row does not have {len(header)} cells: {line.strip()}")
        pair = row[header.index("pair")]
        label = row[header.index("label")].lower()
        judged = row[header.index("judged")].lower()
        for value in (label, judged):
            if value not in LABELS:
                fail(f"pair {pair}: '{value}' is not one of {', '.join(LABELS)}")
        if pair in seen:
            fail(f"pair {pair} is listed twice")
        seen.add(pair)
        rows.append((pair, label, judged))
    if header is None:
        fail("no table with the columns pair, label and judged")
    for label in LABELS:
        if not any(row[1] == label for row in rows):
            fail(f"no pair of the label '{label}'")
    return rows


def main() -> None:
    if len(sys.argv) != 2:
        print(__doc__.split("\n\n")[0], file=sys.stderr)
        print("Usage: calibration_counts.py <table.md>", file=sys.stderr)
        sys.exit(2)
    rows = read_rows(sys.argv[1])
    failures = []
    for label in LABELS:
        own = [row for row in rows if row[1] == label]
        others = [row for row in rows if row[1] != label]
        misses = sum(1 for row in own if row[2] != label)
        false_alarms = sum(1 for row in others if row[2] == label)
        miss_rate = misses / len(own)
        false_alarm_rate = false_alarms / len(others)
        print(f"{label}: {len(own)} pairs, misses {misses} ({miss_rate:.2f}), false alarms {false_alarms} of {len(others)} ({false_alarm_rate:.2f})")
        if miss_rate >= MISS_LIMIT:
            failures.append(f"the miss rate of '{label}' is {miss_rate:.2f}, at or above {MISS_LIMIT}")
        if false_alarm_rate >= FALSE_ALARM_LIMIT:
            failures.append(f"the false-alarm rate of '{label}' is {false_alarm_rate:.2f}, at or above {FALSE_ALARM_LIMIT}")
    if failures:
        for failure in failures:
            print(f"FAIL: {failure}")
        sys.exit(1)
    print(f"PASS: every miss rate is below {MISS_LIMIT} and every false-alarm rate is below {FALSE_ALARM_LIMIT}")


if __name__ == "__main__":
    main()
