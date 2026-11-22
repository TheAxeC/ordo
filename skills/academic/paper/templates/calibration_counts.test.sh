#!/bin/sh
# Offline proof of calibration_counts.py on scratch tables: a table of 25 pairs the agent judged without error passes, a table whose miss rate is at the limit exits 1, a table whose false-alarm rate is at the limit exits 1, and a table with a label outside the three exits 2. Each case is kept because a wrong count or a wrong exit status lets a judgment that misses unsupported claims be relied on. Prints a last line starting PASS: and exits 0, or prints a line starting FAIL: and exits 1.
set -u

here=$(cd "$(dirname "$0")" && pwd)

if [ ! -f "$here/calibration_counts.py" ]; then
    echo "FAIL: $here/calibration_counts.py does not exist"
    exit 1
fi

scratch=$(mktemp -d "${TMPDIR:-/tmp}/calibration-counts-test.XXXXXX") || {
    echo "FAIL: could not create a scratch folder"
    exit 1
}
trap 'rm -rf "$scratch"' 0 1 2 3 15

output=$(python3 -B -I - "$here" "$scratch" 2>&1 <<'PYTHON'
import os
import subprocess
import sys

script = os.path.join(sys.argv[1], "calibration_counts.py")
scratch = sys.argv[2]
failures = []


def check(name, condition, detail=""):
    if not condition:
        failures.append(f"{name} {detail}".strip())


def table(name, rows):
    path = os.path.join(scratch, name)
    lines = ["Notes before the table.", "", "| pair | label | judged |", "|---|---|---|"]
    lines += [f"| P{index} | {label} | {judged} |" for index, (label, judged) in enumerate(rows, 1)]
    with open(path, "w", encoding="utf-8") as handle:
        handle.write("\n".join(lines) + "\n")
    return path


def run(path):
    return subprocess.run([sys.executable, "-B", "-I", script, path], capture_output=True, text=True)


def build(counts, judged_as):
    rows = []
    for label, number in counts.items():
        rows += [(label, judged_as.get((label, index), label)) for index in range(number)]
    return rows


counts = {"supported": 9, "unsupported": 8, "partly supported": 8}

result = run(table("exact.md", build(counts, {})))
check("T1 a table judged without error passes", result.returncode == 0 and result.stdout.rstrip().splitlines()[-1].startswith("PASS:"), result.stdout + result.stderr)
check("T1 the first line counts the supported pairs", result.stdout.splitlines()[0] == "supported: 9 pairs, misses 0 (0.00), false alarms 0 of 16 (0.00)", result.stdout)

result = run(table("miss.md", build(counts, {("unsupported", 0): "supported", ("unsupported", 1): "supported"})))
check("T2 two misses of eight is a miss rate of 0.25 and exits 1", result.returncode == 1 and "FAIL: the miss rate of 'unsupported' is 0.25" in result.stdout, result.stdout + result.stderr)
check("T2 the supported label counts the two false alarms", "false alarms 2 of 16 (0.12)" in result.stdout, result.stdout)

result = run(table("alarm.md", build({"supported": 10, "unsupported": 10, "partly supported": 5}, {("partly supported", 0): "supported"})))
check("T3 one miss of five is 0.20 and exits 1", result.returncode == 1 and "FAIL: the miss rate of 'partly supported' is 0.20" in result.stdout, result.stdout + result.stderr)
check("T3 one false alarm of fifteen stays below its limit", "false alarms 1 of 15 (0.07)" in result.stdout and "false-alarm rate" not in result.stdout, result.stdout)

result = run(table("limit.md", build({"supported": 20, "unsupported": 20, "partly supported": 20}, {("supported", index): "unsupported" for index in range(3)})))
check("T4 three misses of twenty is 0.15 and exits 1", result.returncode == 1 and "FAIL: the miss rate of 'supported' is 0.15" in result.stdout, result.stdout + result.stderr)

result = run(table("badlabel.md", build(counts, {}) + [("maybe", "supported")]))
check("T5 a label outside the three exits 2", result.returncode == 2 and "'maybe' is not one of" in result.stderr, result.stdout + result.stderr)

for failure in failures:
    print(failure)
sys.exit(1 if failures else 0)
PYTHON
)
status=$?

if [ "$status" -ne 0 ]; then
    printf '%s\n' "$output"
    echo "FAIL: calibration_counts.py does not hold the behaviour above"
    exit 1
fi

echo "PASS: calibration_counts.py counts misses and false alarms per label, exits 0 below the limits 0.15 and 0.10, exits 1 at or above one, and exits 2 for a label outside the three"
