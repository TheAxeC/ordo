#!/bin/sh
# Exercise check_paths.py on scratch ledgers under $TMPDIR. Each case builds a state file whose
# dispatch block names the steps in flight and a brief per step under agents/briefs/, runs the
# script for one step, and checks its exit status, its standard output and its standard error.
# Each case names the change to check_paths.py that turns it red.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-paths-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_paths.py
shape_error="is neither none, an entry with step:, nor a list of entries with step:"
n=0

# Start a fresh ledger for a case and write its state file with the yaml block $1.
ledger() {
    n=$((n + 1))
    led=$test_root/case-$n
    mkdir -p "$led/agents/briefs"
    state=$led/orchestrator-state.md
    printf '# Orchestrator state\n\n```yaml\n%s\n```\n\n## Open items\n\n- none.\n' "$1" >"$state"
}

# Write the brief of step $1 with the path lines $2 under "## Paths this step writes".
brief() {
    printf '# Brief: %s\n\n## What to build\n\n- `x`\n\n## Paths this step writes\n\n%s\n\n' \
        "$1" "$2" >"$led/agents/briefs/$1.md"
    printf '## Report\n\n- `y` lines 1-2\n' >>"$led/agents/briefs/$1.md"
}

# Run the script on the state file for step $2 and check it exits $3 and prints exactly $4 on
# standard output and nothing on standard error; $1 names the case and the revert that turns it
# red.
expect_out() {
    out=$(python3 "$check" "$state" "$2" 2>"$test_root/err")
    status=$?
    err=$(cat "$test_root/err")
    [ "$status" = "$3" ] || fail "$1: exit $status, expected $3 [$out] [$err]"
    [ "$out" = "$4" ] || fail "$1: printed [$out], expected [$4]"
    [ -z "$err" ] || fail "$1: printed [$err] on standard error, expected nothing"
}

# Run the script with the arguments after $1 and check it exits 64, prints nothing on standard
# output and one line on standard error that starts with "error: " and holds the text $2.
expect_error() {
    label=$1
    text=$2
    shift 2
    out=$(python3 "$check" "$@" 2>"$test_root/err")
    status=$?
    err=$(cat "$test_root/err")
    [ "$status" = 64 ] || fail "$label: exit $status, expected 64 [$out] [$err]"
    [ -z "$out" ] || fail "$label: printed [$out] on standard output, expected nothing"
    [ "$(printf '%s\n' "$err" | wc -l | tr -d ' ')" = 1 ] ||
        fail "$label: printed [$err] on standard error, expected one line"
    case "$err" in
        "error: "*"$text"*) ;;
        *) fail "$label: printed [$err], expected [error: ...$text...]" ;;
    esac
}

# The brief's first case.

# Red when dispatch: none is not read as no step in flight, or the ok line takes another shape.
ledger 'dispatch: none'
brief 1x '- `README.md`'
expect_out "none in flight" 1x 0 "ok: 1x shares no path with no step in flight"

# Further cases, run first: the brief's other cases also depend on what they check.

# Red when the step being checked is compared with its own entry in the dispatch block.
ledger 'dispatch:
- step: 1x
  landing: backed-out'
brief 1x '- `README.md`'
expect_out "its own entry" 1x 0 "ok: 1x shares no path with no step in flight"

# Red when the numbers of a range are compared as text ("10" before "8"), or when the list items
# of the section after "Paths this step writes" are read (both briefs list y under "Report").
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.md` lines 2-8'
brief 1y '- `a.md` lines 10-20'
expect_out "ranges compared as numbers" 1x 0 "ok: 1x shares no path with 1y"

# The rest of the brief's cases.

# Red when two different files count as shared (the path comparison dropped).
ledger 'dispatch:
- step: 1x
  landing: not-started
- step: 1y
  landing: not-started'
brief 1x '- `a.sh`'
brief 1y '- `b.sh`'
expect_out "different files" 1x 0 "ok: 1x shares no path with 1y"

# Red when a file named whole in one brief and by a range in the other is not shared.
ledger 'dispatch:
- step: 1x
- step: 1y'
brief 1x '- `README.md`'
brief 1y '- `README.md` lines 10-12'
expect_out "whole against a range" 1x 1 \
    "shared: README.md (whole) in 1x and lines 10-12 in 1y"

# Red when two ranges that only touch count as overlapping (the comparison made a <= b + 1).
ledger 'dispatch:
- step: 1x
- step: 1y'
brief 1x '- `README.md` lines 1-9'
brief 1y '- `README.md` lines 10-12'
expect_out "adjacent ranges" 1x 0 "ok: 1x shares no path with 1y"

# The control of the case above: red when ranges that share one line do not overlap (the
# comparison made strict).
ledger 'dispatch:
- step: 1x
- step: 1y'
brief 1x '- `README.md` lines 5-10'
brief 1y '- `README.md` lines 10-12'
expect_out "ranges sharing a line" 1x 1 \
    "shared: README.md (lines 5-10) in 1x and lines 10-12 in 1y"

# Red when a state file with no yaml block is not refused.
ledger 'dispatch: none'
printf '# Orchestrator state\n\ndispatch: none\n' >"$state"
brief 1x '- `a.sh`'
expect_error "no yaml block" "has no yaml block" "$state" 1x

# Red when a brief of a step in flight with no "Paths this step writes" section is not refused.
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.sh`'
printf '# Brief: 1y\n\n## What to build\n\n- `a.sh`\n' >"$led/agents/briefs/1y.md"
expect_error "no paths section" \
    "$led/agents/briefs/1y.md has no '## Paths this step writes' section" "$state" 1x

# Red when a list item under the section that is in neither shape is not refused.
ledger 'dispatch: none'
brief 1x '- README.md, somewhere'
expect_error "a path line in neither shape" \
    "$led/agents/briefs/1x.md:9: '- README.md, somewhere' is not" "$state" 1x

# Red when a range whose end is before its start is not refused.
ledger 'dispatch: none'
brief 1x '- `README.md` lines 12-10'
expect_error "a reversed range" "$led/agents/briefs/1x.md:9: the range 12-10 ends before" \
    "$state" 1x

# Further cases: the shapes of a real brief and of a real state file, and the edges.

# Red when a fence never closes, so the section after it is not read: the control of the next
# case.
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.sh`'
printf '# Brief: 1y\n\n```\n- `c.sh`\n```\n\n## Paths this step writes\n\n- `a.sh`\n' \
    >"$led/agents/briefs/1y.md"
expect_out "a path after a fence" 1x 1 "shared: a.sh (whole) in 1x and whole in 1y"

# Red when the lines inside a fence are read.
printf '# Brief: 1y\n\n```\n## Paths this step writes\n- `a.sh`\n```\n\n' \
    >"$led/agents/briefs/1y.md"
printf '## Paths this step writes\n\n- `b.sh`\n\n```text\n## Report\n- `a.sh`\n```\n' \
    >>"$led/agents/briefs/1y.md"
expect_out "fenced lines" 1x 0 "ok: 1x shares no path with 1y"

# Red when the dispatch block is read from the first yaml block only: a real state file holds
# the verify list first and the dispatch block in a second one.
ledger 'dispatch:
- step: 1y'
printf '# Orchestrator state\n\n```yaml\nverify:\n- sh a.test.sh 2>&1 | tail -1\n```\n\n' \
    >"$state"
printf '```yaml\ndispatch:\n- step: 1y\n```\n' >>"$state"
brief 1x '- `README.md`'
brief 1y '- `README.md`'
expect_out "the dispatch block in the second yaml block" 1x 1 \
    "shared: README.md (whole) in 1x and whole in 1y"

# Red when a range in the step checked against a file named whole by a step in flight is not
# shared: the mirror of "whole against a range" (a whole file shared only when it is the step's).
ledger 'dispatch:
- step: 1y'
brief 1x '- `README.md` lines 3-4'
brief 1y '- `README.md`'
expect_out "a range against a whole file" 1x 1 \
    "shared: README.md (lines 3-4) in 1x and whole in 1y"

# Red when a path the brief lists twice gives two shared: lines for one pair of steps.
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.sh`
- `a.sh`'
brief 1y '- `a.sh`'
expect_out "a path listed twice" 1x 1 "shared: a.sh (whole) in 1x and whole in 1y"

# Red when a level-three heading ends the section, so the paths after it are not compared.
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.sh`

### The documents

- `b.md`'
brief 1y '- `b.md`'
expect_out "a subheading in the section" 1x 1 "shared: b.md (whole) in 1x and whole in 1y"

# Red when a dispatch block written as one entry (the state template's shape when
# workers_at_once is 1) is refused or read as no step in flight: one that names no shared path.
ledger 'dispatch:
  step: 1y
  landing: backed-out'
brief 1x '- `a.sh`'
brief 1y '- `b.sh`'
expect_out "a single entry" 1x 0 "ok: 1x shares no path with 1y"

# Red when a dispatch block written as one entry is refused or its brief not compared: one that
# names a shared path.
brief 1y '- `a.sh`'
expect_out "a single entry sharing a path" 1x 1 "shared: a.sh (whole) in 1x and whole in 1y"

# Red when the ok line names only one of the steps compared, or a step twice.
ledger 'dispatch:
- step: 1y
- step: 1z
- step: 1y'
brief 1x '- `a.sh`'
brief 1y '- `b.sh`'
brief 1z '- `c.sh`'
expect_out "three steps" 1x 0 "ok: 1x shares no path with 1y, 1z"

# Red when a step's shared paths are reported against the first step in flight only.
ledger 'dispatch:
- step: 1y
- step: 1z'
brief 1x '- `a.sh`
- `docs/b.md` lines 3-4'
brief 1y '- `a.sh`'
brief 1z '- `docs/b.md` lines 4-8'
expect_out "shared with two steps" 1x 1 "shared: a.sh (whole) in 1x and whole in 1y
shared: docs/b.md (lines 3-4) in 1x and lines 4-8 in 1z"

# Red when paths are compared as written: ./a.sh and a.sh are one file.
ledger 'dispatch:
- step: 1y'
brief 1x '- `./a.sh`'
brief 1y '- `a.sh`'
expect_out "a path spelled two ways" 1x 1 "shared: a.sh (whole) in 1x and whole in 1y"

# Red when a prose line in the section is read as a path line.
ledger 'dispatch: none'
brief 1x 'One path per line.

- `a.sh`'
expect_out "prose in the section" 1x 0 "ok: 1x shares no path with no step in flight"

# The refusals, one per cause.

ledger 'dispatch: none'
brief 1x '- `a.sh`'
# Red when a call with the wrong number of arguments is not refused.
expect_error "no step argument" "usage: check_paths.py <state file> <step>" "$state"
# Red when a missing state file is not refused.
expect_error "a missing state file" "cannot read $led/missing.md" "$led/missing.md" 1x
# Red when a state file that is not UTF-8 is not refused.
printf '```yaml\ndispatch: none\n```\n\377\n' >"$led/binary.md"
expect_error "a state file not UTF-8" "$led/binary.md is not UTF-8" "$led/binary.md" 1x
# Red when a step name that leaves agents/briefs/ is not refused.
expect_error "a step naming a path" "step '../1x' is not a step name" "$state" ../1x
# Red when an empty step name is not refused.
expect_error "an empty step" "step '' is not a step name" "$state" ''

# Red when a yaml block that is never closed is not refused.
ledger 'dispatch: none'
printf '```yaml\ndispatch: none\n' >"$state"
brief 1x '- `a.sh`'
expect_error "an open yaml block" "is not closed" "$state" 1x

# Red when a yaml block that is not valid YAML is not refused.
ledger 'dispatch: [none'
brief 1x '- `a.sh`'
expect_error "invalid YAML" "is not valid YAML" "$state" 1x

# Red when a state file whose yaml blocks hold no dispatch: key is not refused.
ledger 'verify: []'
brief 1x '- `a.sh`'
expect_error "no dispatch key" "no yaml block of $state has a dispatch: key" "$state" 1x

# Red when an empty yaml block is not counted as a yaml block.
ledger 'dispatch: none'
printf '# Orchestrator state\n\n```yaml\n```\n' >"$state"
brief 1x '- `a.sh`'
expect_error "an empty yaml block" "no yaml block of $state has a dispatch: key" "$state" 1x

# Red when a dispatch: value that is neither none, an entry nor a list is not refused.
ledger 'dispatch: 3'
brief 1x '- `a.sh`'
expect_error "a dispatch that is a number" "$shape_error" "$state" 1x

# Red when an empty dispatch list is taken as no step in flight.
ledger 'dispatch: []'
brief 1x '- `a.sh`'
expect_error "an empty dispatch list" "$shape_error" "$state" 1x

# Red when an entry of the dispatch list with no step: key is not refused.
ledger 'dispatch:
- landing: not-started'
brief 1x '- `a.sh`'
expect_error "an entry without step" "$shape_error" "$state" 1x

# Red when a dispatch block written as one entry with no step: key is taken as no step in flight.
ledger 'dispatch:
  landing: backed-out'
brief 1x '- `a.sh`'
expect_error "a single entry without step" "$shape_error" "$state" 1x

# Red when a step: that YAML reads as a boolean is taken as a step name.
ledger 'dispatch:
- step: yes'
brief 1x '- `a.sh`'
expect_error "a boolean step" "$shape_error" "$state" 1x

# Red when a step name in the dispatch block that leaves agents/briefs/ is not refused.
ledger 'dispatch:
- step: ../1y'
brief 1x '- `a.sh`'
expect_error "a dispatch step naming a path" "step '../1y' is not a step name" "$state" 1x

# Red when a brief that is not UTF-8 is not refused.
ledger 'dispatch: none'
printf '## Paths this step writes\n\n- `a.sh`\n\377\n' >"$led/agents/briefs/1x.md"
expect_error "a brief not UTF-8" "$led/agents/briefs/1x.md is not UTF-8" "$state" 1x

# Red when a missing brief of a step in flight is not refused.
ledger 'dispatch:
- step: 1y'
brief 1x '- `a.sh`'
expect_error "a missing brief" "cannot read $led/agents/briefs/1y.md" "$state" 1x

# Red when the step's own missing brief is not refused.
ledger 'dispatch: none'
expect_error "the step's own brief missing" "cannot read $led/agents/briefs/1x.md" "$state" 1x

# Red when a section that lists no path is not refused.
ledger 'dispatch: none'
brief 1x 'No path.'
expect_error "an empty section" "$led/agents/briefs/1x.md lists no path under" "$state" 1x

# Red when a path outside the repository is not refused.
ledger 'dispatch: none'
brief 1x '- `../a.sh`'
expect_error "a path outside the repository" \
    "$led/agents/briefs/1x.md:9: ../a.sh is not a relative path inside the repository" \
    "$state" 1x

# Red when an absolute path is not refused.
ledger 'dispatch: none'
brief 1x '- `/etc/a.sh`'
expect_error "an absolute path" "/etc/a.sh is not a relative path inside the repository" \
    "$state" 1x

# Red when a range starting at line 0 is not refused.
ledger 'dispatch: none'
brief 1x '- `a.md` lines 0-3'
expect_error "a range from line 0" "$led/agents/briefs/1x.md:9: '- \`a.md\` lines 0-3' is not" \
    "$state" 1x

# Red when a list item of another marker is read as prose.
ledger 'dispatch: none'
brief 1x '* `a.sh`'
expect_error "a star item" "$led/agents/briefs/1x.md:9: '* \`a.sh\`' is not" "$state" 1x

# Red when a missing PyYAML is not refused with exit 69.
mkdir -p "$test_root/noyaml"
printf 'raise ImportError("no yaml")\n' >"$test_root/noyaml/yaml.py"
ledger 'dispatch: none'
brief 1x '- `a.sh`'
err=$(PYTHONPATH=$test_root/noyaml python3 "$check" "$state" 1x 2>&1 >/dev/null)
status=$?
[ "$status" = 69 ] || fail "no PyYAML: exit $status, expected 69 [$err]"
[ "$err" = "error: python3 cannot import yaml; install PyYAML" ] ||
    fail "no PyYAML: printed [$err]"

printf 'PASS: check_paths.py scratch tests\n'
