#!/bin/sh
# Exercise collect_findings.py on a scratch ledger: both heading styles, a repair round with a
# closure, a "none" bullet, a finding on two lines, an archive inside the ledger root, and
# --exclude-listed.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/collect-findings-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
collect=$script_dir/collect_findings.py

reviews=$test_root/.scratch/archive/one-plan/agents/reviews
mkdir -p "$reviews"
cat >"$reviews/1-refuter.md" <<'MD'
# Step 1 refuter report (on .agents/worktrees/one-1, base abc)

## Verification (rerun by the reviewer)

```
- a bullet inside a fence is not a finding
```

## 1. Spec

- src/a.cpp:10: the brief asked for two cases,
  the diff has one.

## 2. Proof

- none.

## 3. Standards

- src/a.cpp:12: a comment names the step.

## 4. Behaviour

- none.

## Not checked

- the benchmark.

## Repair round 1, refuted

- The second case: closed. It is at src/a.cpp:14.
- src/a.cpp:20: the new guard skips work silently. Behaviour.
- Report row 3, "0 warnings": not reproduced (no clean build).
MD
cat >"$reviews/2-refuter.md" <<'MD'
# Step 2 refuter report

## Spec

- docs/b.md:3: the page still names the old flag.

## Proof

- none.
MD
# The archive sits inside the ledger root, as in the example plan.yaml; each report is read once.
out=$(python3 "$collect" "$test_root/.scratch" "$test_root/.scratch/archive" 2>/dev/null) || fail "collect_findings.py exited non-zero"
rows=$(printf '%s\n' "$out" | python3 -c '
import json, sys
for line in sys.stdin:
    r = json.loads(line)
    print(r["plan"], r["step"], r["run"], r["heading"], r["location"] or "-")
')
expected='one-plan 1 first spec src/a.cpp:10
one-plan 1 first standards src/a.cpp:12
one-plan 1 round 1 behaviour src/a.cpp:20
one-plan 1 round 1 proof -
one-plan 2 first spec docs/b.md:3'
[ "$rows" = "$expected" ] || fail "rows differ:
$rows
expected:
$expected"
case "$out" in
    *"the diff has one."*) ;;
    *) fail "a finding's continuation line was not joined" ;;
esac

printf 'Reports read: `%s`\n' "$reviews/1-refuter.md" >"$test_root/retro.md"
rest=$(python3 "$collect" --exclude-listed "$test_root/retro.md" "$test_root/.scratch" 2>/dev/null | python3 -c '
import json, sys
print(" ".join(sorted({json.loads(l)["step"] for l in sys.stdin})))
')
[ "$rest" = "2" ] || fail "--exclude-listed left [$rest], expected [2]"

printf 'PASS: collect_findings.py scratch tests\n'
