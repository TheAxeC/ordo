#!/bin/sh
# Exercise plan_cost.py on scratch ledger folders and transcript roots, each case one fixture and one run, checking stdout, stderr and the exit status.
# Response bodies are read from the folder OTEL_LOG_RAW_API_BODIES names, and every other case runs with the variable unset: the hand-computed fixture with bodies for one response of ab1 (output 900000 in place of the transcript's 300000) and for ar1, giving 35.02 with one response lacking a body and 14.00 with none, a lower bound shown as >= in the agent row, the role row and the Total, the header line naming the folder; a relative body folder; a folder with no body, the value 1 and an empty value, each with no body folder and the header line saying so; a folder that does not exist and one that is a file; a body with another id, one that is not JSON, one that is [], a negative count, fast speed and no model; a body with no usage, a usage that is not an object, no id or a cache-write sum that does not match; a body that cannot be read; a model the table lacks named by a body; a requestId of ../r1 with and without a body folder, a decoy body beside the folder never read; an indented bullet read as an agent; an index.jsonl and a request file in the folder never read; a folder with a body's name an error; a zero-count entry passed over before its body is looked up.
# The body folder from Claude Code's settings files, under a scratch HOME and a working folder outside any repository: the home settings file with the variable unset; the variable set empty, the settings not read; a repository's settings.json read after a settings.local.json without the key, the home file not read; settings.local.json first; a settings file not valid JSON, not an object, with env not an object and with a value not a string; a folder from the settings that does not exist.
# Hand-computed fixture: a ledger of five agents (a builder with a response written as two entries, a brief check, a reviewer, a reviewer over a round, a grill lookup) over a transcript root with a main session and one subagent file per agent; the whole stdout is compared with the text computed by hand, 29.02, 4.50, 14.00, 4.20 and 2.20 for the agents and 53.92 in all, the Opus 5.5 cache read at 0.20, the two entries of one response counted once with the counts of the last, the agents listed in the ledger out of order, the ledger's Steps, Rulings and booking bullets of the agent form passed over, the main session never read, and an assistant entry with no usage passed over.
# Same stdout as the hand-computed fixture: the last agent listed in agents/agent-roles.md instead of plan.md's Agents section; HOME set with one argument; a relative ledger path run from another working folder, the table path printed absolute; a ledger and a transcript root whose paths hold a space; the script run under /usr/bin/python3 as under python3, when that exists; a copy of the script beside a copy of the table with a blank line and a third comment line in it.
# Own fixtures: an agent whose responses are on two models, each priced at its own model and listed in the order met; responses sharing only a message id or only a request id counted apart; every row of prices.txt priced by hand from 1,000,000 of each count; rounding half up of an agent's cost (0.005 gives 0.01) and of a role's and the total's exact sum (two agents of one role and two roles of one agent each, 0.004 and 0.004, give 0.00 and 0.00 and 0.01); the agent table ordered by role kind, step as a number and then its letter, round as a number, then id; a ledger with no Agents heading and every agent in agent-roles.md, one of them step 14b; an agent with only a zero-count entry; agents in nested and separate session folders; standard speed, geo, tier and no web search priced; a copy of the table with a price of 0.15 on 100000 tokens, exactly 0.015, priced from the table's text as 0.02.
# Errors, each exit 1 with nothing on stdout and the exact error: lines: a model the table lacks in three responses, one line; two missing models of one agent and one of another, one line each; an agent with no transcript and one with two; the missing model and the missing transcript in one run; an id listed twice; ids a*b and ../x; a bullet not of the form in the section and in agent-roles.md, a * bullet, an empty id; roles planner of step 1 and four near misses; no agent bullet; a plan.md whose first line is # Notes and one with an empty entry; a plan.md that is not UTF-8; agent-roles.md that is a directory; a transcript line that is not JSON, one that is not UTF-8 and one that is []; a response with no message.model, a null, a negative, a fractional, a true and a missing count, a usage, a cache_creation and a server_tool_use that are not objects; the zero-count entry with output 5 and no requestId, and an entry with counts and no message.id; cache_creation_input_tokens not the sum of the cache writes and above 0 with no cache_creation, with a valid entry beside them; fast speed, us geo, batch tier and two web searches; an unreadable folder under the transcript root and an unreadable transcript file, both skipped when the test runs as root.
# The table, on a copy of the script beside a copy of the table, each exit 1 with the exact error: line naming the table's path and line: missing, empty, a first line that is not a comment, a row of five fields and of seven, a price abc, NaN and -4, a model listed twice, two bad rows both reported.
# Usage errors, each exit 2 with the error: line and the usage line: no argument, three arguments, a ledger folder that does not exist, a ledger path that is a file, a ledger folder with no plan.md, a transcript root that does not exist and one that is a file.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/plan-cost-test.XXXXXX") || fail "could not create scratch directory"
trap 'chmod -R u+rwx "$test_root" 2>/dev/null; rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
unset OTEL_LOG_RAW_API_BODIES
# A scratch home and a working folder outside any repository, so no settings file of the person running the test is read.
HOME=$test_root/home
export HOME
mkdir -p "$HOME/.claude"
cd "$test_root" || fail "could not enter scratch directory"
tool=$script_dir/plan_cost.py
table=$script_dir/prices.txt
out=$test_root/out
err=$test_root/err
exp_out=$test_root/exp-out
exp_err=$test_root/exp-err
opus=claude-opus-5-5
sonnet=claude-sonnet-5-5
haiku=claude-haiku-4-5-20251001
usage_line='usage: python3 plan_cost.py <ledger folder> [<transcript root>]'
form_error='the bullet is not of the form "- <agent id>: <role>, <served model>"'

# Run the script with the given arguments, keeping stdout, stderr and the exit status.
run() {
    python3 "$tool" "$@" >"$out" 2>"$err"
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

want_err() {
    lines "$exp_err" "$@"
}

# Run the script with OTEL_LOG_RAW_API_BODIES set to the first argument and the other arguments as its own.
run_bodies() {
    value=$1
    shift
    env OTEL_LOG_RAW_API_BODIES="$value" python3 "$tool" "$@" >"$out" 2>"$err"
    status=$?
}

# A run that printed the expected stdout, nothing on stderr, exit 0.
check_ok() {
    [ "$status" -eq 0 ] || fail "$1: exit status $status, expected 0; stderr: $(cat "$err")"
    [ ! -s "$err" ] || fail "$1: stderr is not empty: $(cat "$err")"
    cmp -s "$out" "$exp_out" || fail "$1: stdout differs, got: $(cat "$out")"
}

# A run that printed the expected error lines, nothing on stdout, the given exit status.
check_error() {
    [ "$status" -eq "$2" ] || fail "$1: exit status $status, expected $2; stderr: $(cat "$err")"
    [ ! -s "$out" ] || fail "$1: stdout is not empty: $(cat "$out")"
    cmp -s "$err" "$exp_err" || fail "$1: stderr differs, got: $(cat "$err")"
}

# A usage error: exit 2, the error line and the usage line.
check_usage() {
    want_err "$2" "$usage_line"
    check_error "$1" 2
}

# The number of the first line of a file that equals the text.
line_of() {
    grep -n -x -F -- "$2" "$1" | head -n 1 | cut -d: -f1
}

# Entry builders: each prints one transcript line with the field names and nesting of a real entry.
entry() {
    printf '{"type":"assistant","message":{"model":"%s","id":"%s","type":"message","role":"assistant","usage":%s},"requestId":"%s","timestamp":"2026-09-30T10:00:00.000Z"}\n' "$3" "$1" "$4" "$2"
}

# usage <input> <5m write> <1h write> <read> <output> [extra usage fields, each starting with a comma]
usage() {
    printf '{"input_tokens":%s,"cache_creation_input_tokens":%s,"cache_read_input_tokens":%s,"output_tokens":%s,"cache_creation":{"ephemeral_5m_input_tokens":%s,"ephemeral_1h_input_tokens":%s}%s}' "$1" "$(($2 + $3))" "$4" "$5" "$2" "$3" "${6:-}"
}

# resp <message id> <request id> <model> <input> <5m write> <1h write> <read> <output> [extra usage fields]
resp() {
    entry "$1" "$2" "$3" "$(usage "$4" "$5" "$6" "$7" "$8" "${9:-}")"
}

# The entry the runner writes for a failed request: model <synthetic>, no requestId, every count 0.
synthetic() {
    printf '{"type":"assistant","message":{"model":"<synthetic>","id":"%s","type":"message","role":"assistant","usage":%s},"timestamp":"2026-09-30T10:00:00.000Z"}\n' "$1" "$(usage 0 0 0 0 0)"
}

# body <folder> <request id> <message id> <model> <usage object>: the response body Claude Code writes for a request.
body() {
    mkdir -p "$1"
    printf '{"model":"%s","id":"%s","type":"message","role":"assistant","content":[],"stop_reason":"end_turn","usage":%s}\n' "$4" "$3" "$5" >"$1/$2.response.json"
}

user_entry() {
    printf '{"type":"user","message":{"role":"user","content":"a prompt"},"timestamp":"2026-09-30T10:00:00.000Z"}\n'
}

# put <transcript root> <session folder> <agent id>: standard input becomes the agent's transcript file.
put() {
    mkdir -p "$1/$2/subagents" && cat >"$1/$2/subagents/agent-$3.jsonl"
}

# ledger <folder> <bullet>...: plan.md with each bullet in its Agents section, and bullets of the agent form in its Steps, Rulings and booking.
ledger() {
    dest=$1
    shift
    mkdir -p "$dest/agents"
    {
        printf '%s\n' '# Plan: 9.Z Fixture' '' 'The plan opens with its goal.' ''
        printf '%s\n' '## Steps, in execution order' '' '- 1 builder of step 1 (approved)' "- ghost1: builder of step 9, $opus" ''
        printf '%s\n' '## Rulings (2026-09-30)' '' "- ghost2: reviewer of step 9, $opus (the user)." ''
        printf '%s\n' '## Agents' '' 'Each agent has one bullet.' ''
        for bullet in "$@"; do
            printf '%s\n' "$bullet"
        done
        printf '%s\n' '' '## Blocked, and by what' '' "- ghost3: grill lookup, $opus" ''
        printf '%s\n' '## Booking of step 1' '' "- Usage: brief check ordo-high, agent ab1, $opus, 1 tokens"
    } >"$dest/plan.md"
}

# roles <ledger folder> <bullet>...: agents/agent-roles.md holding the bullets.
roles() {
    dest=$1/agents/agent-roles.md
    shift
    mkdir -p "$(dirname "$dest")"
    lines "$dest" '# Agent roles' '' 'The agents of the plan.' ''
    for bullet in "$@"; do
        printf '%s\n' "$bullet" >>"$dest"
    done
}

b_ab1="- ab1: builder of step 1, $sonnet"
b_abc="- abc: brief check of step 1, $opus"
b_ar1="- ar1: reviewer of step 1, $opus"
b_ar2="- ar2: reviewer of step 1 over round 1, $sonnet"
b_ag1="- ag1: grill lookup, $opus"

# The transcript root of the hand-computed fixture: a main session that is never read and one file per agent.
main_root() {
    root=$1
    mkdir -p "$root/p"
    {
        resp m9 r9 $opus 1 1 1 1 1
        printf 'not json\n'
    } >"$root/p/s1.jsonl"
    {
        resp m1 r1 $sonnet 1000000 2000000 0 0 500000
        printf '{"type":"assistant","message":{"role":"assistant","content":[]},"timestamp":"2026-09-30T10:00:00.000Z"}\n'
        resp m2 r2 $sonnet 10000 0 1000000 50000000 100000
        user_entry
        resp m2 r2 $sonnet 10000 0 1000000 50000000 300000
    } | put "$root" p/s1 ab1
    resp m3 r3 $opus 500000 1000000 0 10000000 250000 | put "$root" p/s1 ar1
    resp m4 r4 $sonnet 100000 0 500000 5000000 100000 | put "$root" p/s1 ar2
    resp m5 r5 $opus 250000 400000 0 2500000 50000 | put "$root" p/s1 abc
    resp m6 r6 $opus 125000 0 125000 1000000 25000 | put "$root" p/s1 ag1
}

# The hand-computed fixture in <folder>/ledger and <folder>/root, the agents listed out of order.
main_fixture() {
    ledger "$1/ledger" "$b_ag1" "$b_ar2" "$b_abc" "$b_ar1" "$b_ab1"
    main_root "$1/root"
}

# The first lines of a successful run: the plan, the table's path, its first comment line, the line on the response bodies, then a blank line.
header() {
    printf 'Plan %s: priced usage of its agents\n' "$1"
    printf 'Prices from %s:\n' "${shown_table:-$table}"
    printf '%s\n' 'Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.'
    printf '%s\n\n' "${bodies_line:-Response bodies: none, so every cost is a lower bound.}"
}

main_tables() {
    cat <<'EOF'
Role                   Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     1        2  1010000         2000000         1000000    50000000   800000     >=29.02
brief check                 1        1   250000          400000               0     2500000    50000      >=4.50
reviewer                    1        1   500000         1000000               0    10000000   250000     >=14.00
reviewer over a round       1        1   100000               0          500000     5000000   100000      >=4.20
grill lookup                1        1   125000               0          125000     1000000    25000      >=2.20
Total                       5        6  1985000         3400000         1625000    68500000  1225000     >=53.92

Agent  Role                             Model              No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab1    builder of step 1                claude-sonnet-5-5        2  1010000         2000000         1000000    50000000  800000     >=29.02
abc    brief check of step 1            claude-opus-5-5          1   250000          400000               0     2500000   50000      >=4.50
ar1    reviewer of step 1               claude-opus-5-5          1   500000         1000000               0    10000000  250000     >=14.00
ar2    reviewer of step 1 over round 1  claude-sonnet-5-5        1   100000               0          500000     5000000  100000      >=4.20
ag1    grill lookup                     claude-opus-5-5          1   125000               0          125000     1000000   25000      >=2.20
EOF
}

want_main() {
    {
        header "9.Z Fixture"
        main_tables
    } >"$exp_out"
}

# ---- The hand-computed fixture ----

d=$test_root/main
main_fixture "$d"
run "$d/ledger" "$d/root"
want_main
check_ok "the hand-computed fixture"

d=$test_root/roles-file
ledger "$d/ledger" "$b_ar2" "$b_abc" "$b_ar1" "$b_ab1"
roles "$d/ledger" "$b_ag1"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_main
check_ok "ag1 listed in agent-roles.md instead of plan.md"

d=$test_root/default-root
ledger "$d/ledger" "$b_ag1" "$b_ar2" "$b_abc" "$b_ar1" "$b_ab1"
main_root "$d/home/.claude/projects"
HOME="$d/home" python3 "$tool" "$d/ledger" >"$out" 2>"$err"
status=$?
want_main
check_ok "the default transcript root, one argument"

d=$test_root/main
(cd "$d" && python3 "$tool" ledger root >"$out" 2>"$err")
status=$?
want_main
check_ok "a relative ledger path from another working folder"

d="$test_root/with space"
main_fixture "$d"
mv "$d/ledger" "$d/led ger"
mv "$d/root" "$d/ro ot"
run "$d/led ger" "$d/ro ot"
want_main
check_ok "a space in the ledger folder and in the transcript root"

if [ -x /usr/bin/python3 ]; then
    d=$test_root/main
    /usr/bin/python3 "$tool" "$d/ledger" "$d/root" >"$out" 2>"$err"
    status=$?
    want_main
    check_ok "/usr/bin/python3"
fi

# ---- Response bodies ----

d=$test_root/bodies
main_fixture "$d"
body "$d/bodies" r2 m2 $sonnet "$(usage 10000 0 1000000 50000000 900000)"
body "$d/bodies" r3 m3 $opus "$(usage 500000 1000000 0 10000000 250000)"
printf '{}\n' >"$d/bodies/index.jsonl"
printf 'not json\n' >"$d/bodies/0a1b2c3d.request.json"
run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
bodies_line="Response bodies from $d/bodies."
{
    header "9.Z Fixture"
    cat <<'EOF'
Role                   Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     1        1  1010000         2000000         1000000    50000000  1400000     >=35.02
brief check                 1        1   250000          400000               0     2500000    50000      >=4.50
reviewer                    1        0   500000         1000000               0    10000000   250000       14.00
reviewer over a round       1        1   100000               0          500000     5000000   100000      >=4.20
grill lookup                1        1   125000               0          125000     1000000    25000      >=2.20
Total                       5        4  1985000         3400000         1625000    68500000  1825000     >=59.92

Agent  Role                             Model              No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
ab1    builder of step 1                claude-sonnet-5-5        1  1010000         2000000         1000000    50000000  1400000     >=35.02
abc    brief check of step 1            claude-opus-5-5          1   250000          400000               0     2500000    50000      >=4.50
ar1    reviewer of step 1               claude-opus-5-5          0   500000         1000000               0    10000000   250000       14.00
ar2    reviewer of step 1 over round 1  claude-sonnet-5-5        1   100000               0          500000     5000000   100000      >=4.20
ag1    grill lookup                     claude-opus-5-5          1   125000               0          125000     1000000    25000      >=2.20
EOF
} >"$exp_out"
check_ok "bodies for one response of ab1 and for ar1: their counts replace the transcript's, the rest are lower bounds"
cp "$exp_out" "$test_root/exp-bodies"

(cd "$d" && env OTEL_LOG_RAW_API_BODIES=file:bodies python3 "$tool" ledger root >"$out" 2>"$err")
status=$?
bodies_line="Response bodies from bodies."
{
    header "9.Z Fixture"
    cat <<'EOF'
Role                   Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     1        1  1010000         2000000         1000000    50000000  1400000     >=35.02
brief check                 1        1   250000          400000               0     2500000    50000      >=4.50
reviewer                    1        0   500000         1000000               0    10000000   250000       14.00
reviewer over a round       1        1   100000               0          500000     5000000   100000      >=4.20
grill lookup                1        1   125000               0          125000     1000000    25000      >=2.20
Total                       5        4  1985000         3400000         1625000    68500000  1825000     >=59.92

Agent  Role                             Model              No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
ab1    builder of step 1                claude-sonnet-5-5        1  1010000         2000000         1000000    50000000  1400000     >=35.02
abc    brief check of step 1            claude-opus-5-5          1   250000          400000               0     2500000    50000      >=4.50
ar1    reviewer of step 1               claude-opus-5-5          0   500000         1000000               0    10000000   250000       14.00
ar2    reviewer of step 1 over round 1  claude-sonnet-5-5        1   100000               0          500000     5000000   100000      >=4.20
ag1    grill lookup                     claude-opus-5-5          1   125000               0          125000     1000000    25000      >=2.20
EOF
} >"$exp_out"
check_ok "a relative body folder, read from the working folder"

d=$test_root/main
mkdir -p "$d/no-bodies"
run_bodies "file:$d/no-bodies" "$d/ledger" "$d/root"
bodies_line="Response bodies from $d/no-bodies."
want_main
check_ok "a body folder that holds no body"

bodies_line=
run_bodies 1 "$d/ledger" "$d/root"
want_main
check_ok "OTEL_LOG_RAW_API_BODIES set to 1 is no body folder"

run_bodies "" "$d/ledger" "$d/root"
want_main
check_ok "OTEL_LOG_RAW_API_BODIES empty is no body folder"

run_bodies "file:$d/nothere" "$d/ledger" "$d/root"
want_err "error: OTEL_LOG_RAW_API_BODIES names $d/nothere, which is not a folder"
check_error "a body folder that does not exist" 1

: >"$d/afile"
run_bodies "file:$d/afile" "$d/ledger" "$d/root"
want_err "error: OTEL_LOG_RAW_API_BODIES names $d/afile, which is not a folder"
check_error "a body folder that is a file" 1

d=$test_root/err-bodies
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
b=$d/bodies
{
    resp m1 r1 $sonnet 1 0 0 0 1
    resp m2 r2 $sonnet 1 0 0 0 1
    resp m3 r3 $sonnet 1 0 0 0 1
    resp m4 r4 $sonnet 1 0 0 0 1
    resp m5 r5 $sonnet 1 0 0 0 1
    resp m6 r6 $sonnet 1 0 0 0 1
} | put "$d/root" p/s1 ab1
body "$b" r1 mX $sonnet "$(usage 1 0 0 0 1)"
printf 'not json\n' >"$b/r2.response.json"
body "$b" r3 m3 $sonnet "$(usage 1 0 0 0 1 | sed 's/"output_tokens":1/"output_tokens":-1/')"
body "$b" r4 m4 $sonnet "$(usage 1 0 0 0 1 ',"speed":"fast"')"
printf '{"id":"m5","usage":%s}\n' "$(usage 1 0 0 0 1)" >"$b/r5.response.json"
printf '[]\n' >"$b/r6.response.json"
run_bodies "file:$b" "$d/ledger" "$d/root"
want_err "error: $b/r1.response.json: id mX is not the transcript's message.id m1" "error: $b/r2.response.json: not valid JSON" "error: $b/r3.response.json: usage.output_tokens is not a whole number of 0 or more: -1" "error: $b/r4.response.json: usage.speed is \"fast\", which the table does not price" "error: $b/r5.response.json: no model" "error: $b/r6.response.json: not a JSON object"
check_error "a body with another id, one that is not JSON, a negative count, fast speed, no model, and one that is []" 1

d=$test_root/err-body-fields
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
b=$d/bodies
{
    resp m1 r1 $sonnet 1 0 0 0 1
    resp m2 r2 $sonnet 1 0 0 0 1
    resp m3 r3 $sonnet 1 0 0 0 1
    resp m4 r4 $sonnet 1 0 0 0 1
} | put "$d/root" p/s1 ab1
mkdir -p "$b"
printf '{"id":"m1","model":"%s"}\n' $sonnet >"$b/r1.response.json"
printf '{"id":"m2","model":"%s","usage":"x"}\n' $sonnet >"$b/r2.response.json"
printf '{"model":"%s","usage":%s}\n' $sonnet "$(usage 1 0 0 0 1)" >"$b/r3.response.json"
printf '{"id":"m4","model":"%s","usage":{"input_tokens":1,"cache_creation_input_tokens":1,"cache_read_input_tokens":0,"output_tokens":1,"cache_creation":{"ephemeral_5m_input_tokens":0,"ephemeral_1h_input_tokens":0}}}\n' $sonnet >"$b/r4.response.json"
run_bodies "file:$b" "$d/ledger" "$d/root"
want_err "error: $b/r1.response.json: usage is missing" "error: $b/r2.response.json: usage is not an object" "error: $b/r3.response.json: no id" "error: $b/r4.response.json: usage.cache_creation_input_tokens is 1, but the two cache writes sum to 0"
check_error "a body with no usage, a usage that is not an object, no id, and a cache-write sum that does not match" 1

d=$test_root/err-body-model
ledger "$d/ledger" "$b_ab1"
resp m1 r1 $sonnet 1 0 0 0 1 | put "$d/root" p/s1 ab1
body "$d/bodies" r1 m1 claude-opus-9 "$(usage 1 0 0 0 1)"
run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
want_err "error: model claude-opus-9 of agent ab1 is not in $table"
check_error "a model the table lacks, named by a body" 1

d=$test_root/err-request-id
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
resp m1 ../r1 $sonnet 1 0 0 0 1 | put "$d/root" p/s1 ab1
mkdir "$d/bodies"
printf 'not json\n' >"$d/r1.response.json"
run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
want_err "error: $f:1: invalid requestId '../r1'"
check_error "a requestId of ../r1 with a body beside the body folder" 1

run "$d/ledger" "$d/root"
check_error "a requestId of ../r1 with no body folder" 1

if [ "$(id -u)" -ne 0 ]; then
    d=$test_root/err-body-unreadable
    main_fixture "$d"
    body "$d/bodies" r3 m3 $opus "$(usage 500000 1000000 0 10000000 250000)"
    chmod 000 "$d/bodies/r3.response.json"
    run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
    chmod 644 "$d/bodies/r3.response.json"
    want_err "error: cannot read $d/bodies/r3.response.json: Permission denied"
    check_error "a body that cannot be read" 1
fi

# ---- The body folder from Claude Code's settings files ----

bodies_dir=$test_root/bodies/bodies
settings_value() {
    printf '{"env":{"OTEL_LOG_RAW_API_BODIES":"%s"}}\n' "$2" >"$1"
}

settings_value "$HOME/.claude/settings.json" "file:$bodies_dir"
run "$test_root/bodies/ledger" "$test_root/bodies/root"
cp "$test_root/exp-bodies" "$exp_out"
check_ok "the variable unset: the folder from the home settings file"

bodies_line=
run_bodies "" "$test_root/main/ledger" "$test_root/main/root"
want_main
check_ok "the variable set empty in the environment: no body folder, the settings file not read"

r=$test_root/repo
mkdir -p "$r/.git" "$r/.claude" "$r/sub"
printf '{"env":{}}\n' >"$r/.claude/settings.local.json"
settings_value "$r/.claude/settings.json" "file:$bodies_dir"
settings_value "$HOME/.claude/settings.json" "file:$test_root/nothere"
(cd "$r/sub" && python3 "$tool" "$test_root/bodies/ledger" "$test_root/bodies/root" >"$out" 2>"$err")
status=$?
cp "$test_root/exp-bodies" "$exp_out"
check_ok "the repository's settings.json read when settings.local.json lacks the key, the home file not read"

mkdir -p "$test_root/main/nob"
settings_value "$r/.claude/settings.local.json" "file:$test_root/main/nob"
(cd "$r/sub" && python3 "$tool" "$test_root/main/ledger" "$test_root/main/root" >"$out" 2>"$err")
status=$?
bodies_line="Response bodies from $test_root/main/nob."
want_main
check_ok "the repository's settings.local.json first"
bodies_line=

printf '{"env":\n' >"$r/.claude/settings.local.json"
(cd "$r/sub" && python3 "$tool" "$test_root/main/ledger" "$test_root/main/root" >"$out" 2>"$err")
status=$?
want_err "error: $r/.claude/settings.local.json: not valid JSON"
check_error "a settings file that is not valid JSON" 1

printf '[]\n' >"$r/.claude/settings.local.json"
(cd "$r/sub" && python3 "$tool" "$test_root/main/ledger" "$test_root/main/root" >"$out" 2>"$err")
status=$?
want_err "error: $r/.claude/settings.local.json: not a JSON object"
check_error "a settings file that is not a JSON object" 1

printf '{"env":[]}\n' >"$r/.claude/settings.local.json"
(cd "$r/sub" && python3 "$tool" "$test_root/main/ledger" "$test_root/main/root" >"$out" 2>"$err")
status=$?
want_err "error: $r/.claude/settings.local.json: env is not an object"
check_error "a settings file whose env is not an object" 1

printf '{"env":{"OTEL_LOG_RAW_API_BODIES":5}}\n' >"$r/.claude/settings.local.json"
(cd "$r/sub" && python3 "$tool" "$test_root/main/ledger" "$test_root/main/root" >"$out" 2>"$err")
status=$?
want_err "error: $r/.claude/settings.local.json: env.OTEL_LOG_RAW_API_BODIES is not a string"
check_error "a settings value that is not a string" 1

run "$test_root/main/ledger" "$test_root/main/root"
want_err "error: OTEL_LOG_RAW_API_BODIES names $test_root/nothere, which is not a folder"
check_error "a folder from the home settings file that does not exist" 1
rm -f "$HOME/.claude/settings.json"

d=$test_root/body-folder-named
main_fixture "$d"
mkdir -p "$d/bodies/r3.response.json"
run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
want_err "error: cannot read $d/bodies/r3.response.json: Is a directory"
check_error "a folder with a body's name is an error, not a missing body" 1

d=$test_root/zero-before-body
ledger "$d/ledger" "$b_ab1"
{
    resp m1 r1 $sonnet 0 0 0 0 0
    resp m2 r2 $sonnet 1000000 0 0 0 0
} | put "$d/root" p/s1 ab1
mkdir -p "$d/bodies"
printf 'not json\n' >"$d/bodies/r1.response.json"
body "$d/bodies" r2 m2 $sonnet "$(usage 1000000 0 0 0 0)"
run_bodies "file:$d/bodies" "$d/ledger" "$d/root"
[ "$status" -eq 0 ] || fail "a zero-count entry is passed over before its body is looked up: exit status $status, expected 0; stderr: $(cat "$err")"
[ ! -s "$err" ] || fail "a zero-count entry is passed over before its body is looked up: stderr is not empty: $(cat "$err")"
grep -q '^ab1 .* 0 .*  2\.00$' "$out" || fail "a zero-count entry is passed over before its body is looked up: no exact row of 2.00, got: $(cat "$out")"

# ---- Own fixtures ----

d=$test_root/mixed
ledger "$d/ledger" "- am1: builder of step 1, $haiku" "- am2: reviewer of step 1, $haiku"
{
    resp m1 r1 $opus 1000000 0 0 0 100000
    resp m2 r2 $sonnet 1000000 0 0 0 100000
    resp m3 r3 $opus 500000 0 0 0 0
} | put "$d/root" p/s1 am1
{
    resp m4 r4 $sonnet 1000000 0 0 0 50000
    resp m5 r5 $opus 0 0 0 5000000 0
} | put "$d/root" p/s1 am2
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role      Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder        1        3  2500000               0               0           0  200000     >=11.00
reviewer       1        2  1000000               0               0     5000000   50000      >=3.50
Total          2        5  3500000               0               0     5000000  250000     >=14.50

Agent  Role                Model                               No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
am1    builder of step 1   claude-opus-5-5, claude-sonnet-5-5        3  2500000               0               0           0  200000     >=11.00
am2    reviewer of step 1  claude-sonnet-5-5, claude-opus-5-5        2  1000000               0               0     5000000   50000      >=3.50
EOF
} >"$exp_out"
check_ok "responses on two models, each priced at its own model"

d=$test_root/pairs
ledger "$d/ledger" "- ad1: grill lookup, $haiku"
{
    resp m1 r1 $haiku 1000000 0 0 0 0
    resp m1 r2 $haiku 1000000 0 0 0 0
    resp m2 r1 $haiku 1000000 0 0 0 0
} | put "$d/root" p/s1 ad1
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
grill lookup       1        3  3000000               0               0           0       0      >=3.00
Total              1        3  3000000               0               0           0       0      >=3.00

Agent  Role          Model                      No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ad1    grill lookup  claude-haiku-4-5-20251001        3  3000000               0               0           0       0      >=3.00
EOF
} >"$exp_out"
check_ok "responses sharing only a message id or only a request id are counted apart"

d=$test_root/rows
ledger "$d/ledger" "- p1: grill lookup, $opus" "- p2: grill lookup, $sonnet" "- p3: grill lookup, claude-sonnet-5" "- p4: grill lookup, $haiku"
resp m1 r1 $opus 1000000 1000000 1000000 1000000 1000000 | put "$d/root" p/s1 p1
resp m2 r2 $sonnet 1000000 1000000 1000000 1000000 1000000 | put "$d/root" p/s1 p2
resp m3 r3 claude-sonnet-5 1000000 1000000 1000000 1000000 1000000 | put "$d/root" p/s1 p3
resp m4 r4 $haiku 1000000 1000000 1000000 1000000 1000000 | put "$d/root" p/s1 p4
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
grill lookup       4        4  4000000         4000000         4000000     4000000  4000000     >=83.95
Total              4        4  4000000         4000000         4000000     4000000  4000000     >=83.95

Agent  Role          Model                      No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
p1     grill lookup  claude-opus-5-5                  1  1000000         1000000         1000000     1000000  1000000     >=37.20
p2     grill lookup  claude-sonnet-5-5                1  1000000         1000000         1000000     1000000  1000000     >=18.70
p3     grill lookup  claude-sonnet-5                  1  1000000         1000000         1000000     1000000  1000000     >=18.70
p4     grill lookup  claude-haiku-4-5-20251001        1  1000000         1000000         1000000     1000000  1000000      >=9.35
EOF
} >"$exp_out"
check_ok "every row of prices.txt priced from 1000000 of each count"

d=$test_root/round-agent
ledger "$d/ledger" "- ah1: grill lookup, $haiku"
resp m1 r1 $haiku 5000 0 0 0 0 | put "$d/root" p/s1 ah1
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
grill lookup       1        1   5000               0               0           0       0      >=0.01
Total              1        1   5000               0               0           0       0      >=0.01

Agent  Role          Model                      No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ah1    grill lookup  claude-haiku-4-5-20251001        1   5000               0               0           0       0      >=0.01
EOF
} >"$exp_out"
check_ok "0.005 rounds half up to 0.01"

d=$test_root/round-total
ledger "$d/ledger" "- ah2: grill lookup, $haiku" "- ah3: grill lookup, $haiku"
resp m1 r1 $haiku 4000 0 0 0 0 | put "$d/root" p/s1 ah2
resp m2 r2 $haiku 4000 0 0 0 0 | put "$d/root" p/s1 ah3
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
grill lookup       2        2   8000               0               0           0       0      >=0.01
Total              2        2   8000               0               0           0       0      >=0.01

Agent  Role          Model                      No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ah2    grill lookup  claude-haiku-4-5-20251001        1   4000               0               0           0       0      >=0.00
ah3    grill lookup  claude-haiku-4-5-20251001        1   4000               0               0           0       0      >=0.00
EOF
} >"$exp_out"
check_ok "two rows of 0.004 sum to 0.008 and print 0.01 in the role row and the total"

d=$test_root/round-roles
ledger "$d/ledger" "- ab1: builder of step 1, $haiku" "- ah3: grill lookup, $haiku"
resp m1 r1 $haiku 4000 0 0 0 0 | put "$d/root" p/s1 ab1
resp m2 r2 $haiku 4000 0 0 0 0 | put "$d/root" p/s1 ah3
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder            1        1   4000               0               0           0       0      >=0.00
grill lookup       1        1   4000               0               0           0       0      >=0.00
Total              2        2   8000               0               0           0       0      >=0.01

Agent  Role               Model                      No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab1    builder of step 1  claude-haiku-4-5-20251001        1   4000               0               0           0       0      >=0.00
ah3    grill lookup       claude-haiku-4-5-20251001        1   4000               0               0           0       0      >=0.00
EOF
} >"$exp_out"
check_ok "two role rows of 0.004 print 0.00 and the total prints 0.01"

d=$test_root/sorting
ledger "$d/ledger" "- ra: reviewer of step 2 over round 10, $haiku" "- ab10: builder of step 10, $haiku" "- rz: reviewer of step 2 over round 2, $haiku" "- ab2a: builder of step 2a, $haiku" "- ab2: builder of step 2, $haiku" "- ab0: builder of step 2, $haiku"
resp m1 r1 $haiku 1000000 0 0 0 0 | put "$d/root" p/s1 ab0
resp m2 r2 $haiku 2000000 0 0 0 0 | put "$d/root" p/s1 ab2
resp m3 r3 $haiku 3000000 0 0 0 0 | put "$d/root" p/s1 ab2a
resp m4 r4 $haiku 4000000 0 0 0 0 | put "$d/root" p/s1 ab10
resp m5 r5 $haiku 5000000 0 0 0 0 | put "$d/root" p/s1 rz
resp m6 r6 $haiku 6000000 0 0 0 0 | put "$d/root" p/s1 ra
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role                   Agents  No body     Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     4        4  10000000               0               0           0       0     >=10.00
reviewer over a round       2        2  11000000               0               0           0       0     >=11.00
Total                       6        6  21000000               0               0           0       0     >=21.00

Agent  Role                              Model                      No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab0    builder of step 2                 claude-haiku-4-5-20251001        1  1000000               0               0           0       0      >=1.00
ab2    builder of step 2                 claude-haiku-4-5-20251001        1  2000000               0               0           0       0      >=2.00
ab2a   builder of step 2a                claude-haiku-4-5-20251001        1  3000000               0               0           0       0      >=3.00
ab10   builder of step 10                claude-haiku-4-5-20251001        1  4000000               0               0           0       0      >=4.00
rz     reviewer of step 2 over round 2   claude-haiku-4-5-20251001        1  5000000               0               0           0       0      >=5.00
ra     reviewer of step 2 over round 10  claude-haiku-4-5-20251001        1  6000000               0               0           0       0      >=6.00
EOF
} >"$exp_out"
check_ok "the agent table ordered by kind, step as a number and then its letter, round as a number, id"

d=$test_root/no-agents-heading
mkdir -p "$d/ledger/agents"
lines "$d/ledger/plan.md" '# Plan: 9.Z Fixture' '' '## Goal' '' 'A plan with no Agents section.' '' '- ghost1: builder of step 9, claude-opus-5-5'
roles "$d/ledger" "$b_ag1" "$b_ar2" "$b_abc" "$b_ar1" "- ab1: builder of step 14b, $sonnet"
main_root "$d/root"
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role                   Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read   Output  Cost (USD)
builder                     1        2  1010000         2000000         1000000    50000000   800000     >=29.02
brief check                 1        1   250000          400000               0     2500000    50000      >=4.50
reviewer                    1        1   500000         1000000               0    10000000   250000     >=14.00
reviewer over a round       1        1   100000               0          500000     5000000   100000      >=4.20
grill lookup                1        1   125000               0          125000     1000000    25000      >=2.20
Total                       5        6  1985000         3400000         1625000    68500000  1225000     >=53.92

Agent  Role                             Model              No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab1    builder of step 14b              claude-sonnet-5-5        2  1010000         2000000         1000000    50000000  800000     >=29.02
abc    brief check of step 1            claude-opus-5-5          1   250000          400000               0     2500000   50000      >=4.50
ar1    reviewer of step 1               claude-opus-5-5          1   500000         1000000               0    10000000  250000     >=14.00
ar2    reviewer of step 1 over round 1  claude-sonnet-5-5        1   100000               0          500000     5000000  100000      >=4.20
ag1    grill lookup                     claude-opus-5-5          1   125000               0          125000     1000000   25000      >=2.20
EOF
} >"$exp_out"
check_ok "a ledger with no Agents heading, every agent in agent-roles.md, one of them step 14b"

d=$test_root/idle
ledger "$d/ledger" "$b_ab1"
synthetic m1 | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role     Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder       1        0      0               0               0           0       0        0.00
Total         1        0      0               0               0           0       0        0.00

Agent  Role               Model  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab1    builder of step 1  -            0      0               0               0           0       0        0.00
EOF
} >"$exp_out"
check_ok "an agent with only a zero-count entry"

d=$test_root/nested
ledger "$d/ledger" "- x: builder of step 1, $haiku" "- y: reviewer of step 1, $haiku" "- z: grill lookup, $haiku"
resp m1 r1 $haiku 1000000 0 0 0 0 | put "$d/root" p/s1 x
resp m2 r2 $haiku 2000000 0 0 0 0 | put "$d/root" q/s2 y
mkdir -p "$d/root/r/s3/deeper/folders"
resp m3 r3 $haiku 3000000 0 0 0 0 >"$d/root/r/s3/deeper/folders/agent-z.jsonl"
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder            1        1  1000000               0               0           0       0      >=1.00
reviewer           1        1  2000000               0               0           0       0      >=2.00
grill lookup       1        1  3000000               0               0           0       0      >=3.00
Total              3        3  6000000               0               0           0       0      >=6.00

Agent  Role                Model                      No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
x      builder of step 1   claude-haiku-4-5-20251001        1  1000000               0               0           0       0      >=1.00
y      reviewer of step 1  claude-haiku-4-5-20251001        1  2000000               0               0           0       0      >=2.00
z      grill lookup        claude-haiku-4-5-20251001        1  3000000               0               0           0       0      >=3.00
EOF
} >"$exp_out"
check_ok "subagent files of separate sessions and a nested folder"

d=$test_root/flags-ok
ledger "$d/ledger" "$b_ab1"
resp m1 r1 $haiku 1000000 0 0 0 0 ',"speed":"standard","inference_geo":"not_available","service_tier":"standard","server_tool_use":{"web_search_requests":0,"web_fetch_requests":0}' | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
{
    header "9.Z Fixture"
    cat <<'EOF'
Role     Agents  No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder       1        1  1000000               0               0           0       0      >=1.00
Total         1        1  1000000               0               0           0       0      >=1.00

Agent  Role               Model                      No body    Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ab1    builder of step 1  claude-haiku-4-5-20251001        1  1000000               0               0           0       0      >=1.00
EOF
} >"$exp_out"
check_ok "standard speed, not_available geo, standard tier and no web search are priced"

# ---- Errors of the ledger ----

d=$test_root/err-model
ledger "$d/ledger" "$b_ab1"
{
    resp m1 r1 claude-opus-9 1 0 0 0 1
    resp m2 r2 claude-opus-9 1 0 0 0 1
    resp m3 r3 claude-opus-9 1 0 0 0 1
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: model claude-opus-9 of agent ab1 is not in $table"
check_error "a model the table lacks in three responses" 1

d=$test_root/err-models
ledger "$d/ledger" "$b_ab1" "$b_ar1"
{
    resp m1 r1 claude-opus-9 1 0 0 0 1
    resp m2 r2 claude-opus-8 1 0 0 0 1
    resp m3 r3 claude-opus-9 1 0 0 0 1
} | put "$d/root" p/s1 ab1
resp m4 r4 claude-opus-9 1 0 0 0 1 | put "$d/root" p/s1 ar1
run "$d/ledger" "$d/root"
want_err "error: model claude-opus-9 of agent ab1 is not in $table" "error: model claude-opus-8 of agent ab1 is not in $table" "error: model claude-opus-9 of agent ar1 is not in $table"
check_error "two missing models of one agent and the same model of another, one line each" 1

d=$test_root/err-transcripts
ledger "$d/ledger" "$b_ab1" "$b_ar1"
resp m1 r1 $opus 1 0 0 0 1 | put "$d/root" p/s1 ar1
resp m2 r2 $opus 1 0 0 0 1 | put "$d/root" q/s2 ar1
run "$d/ledger" "$d/root"
want_err "error: no transcript of agent ab1 under $d/root" "error: agent ar1 has 2 transcripts: $d/root/p/s1/subagents/agent-ar1.jsonl, $d/root/q/s2/subagents/agent-ar1.jsonl"
check_error "an agent with no transcript and one with two" 1

d=$test_root/err-collected
ledger "$d/ledger" "$b_ab1" "$b_ar1"
resp m1 r1 claude-opus-9 1 0 0 0 1 | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: model claude-opus-9 of agent ab1 is not in $table" "error: no transcript of agent ar1 under $d/root"
check_error "the missing model and the missing transcript in one run" 1

d=$test_root/err-twice
ledger "$d/ledger" "$b_ab1" "$b_ar1"
roles "$d/ledger" "$b_ab1"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: agent ab1 is listed twice: $d/ledger/plan.md:$(line_of "$d/ledger/plan.md" "$b_ab1") and $d/ledger/agents/agent-roles.md:$(line_of "$d/ledger/agents/agent-roles.md" "$b_ab1")"
check_error "an id listed in plan.md and in agent-roles.md" 1

d=$test_root/err-ids
ledger "$d/ledger" "- a*b: builder of step 1, $sonnet" "- ../x: builder of step 1, $sonnet" "- : builder of step 1, $sonnet"
mkdir -p "$d/root/p/s1/subagents"
: >"$d/root/p/s1/subagents/agent-axb.jsonl"
: >"$d/root/x.jsonl"
run "$d/ledger" "$d/root"
f=$d/ledger/plan.md
want_err "error: $f:$(line_of "$f" "- a*b: builder of step 1, $sonnet"): invalid agent id 'a*b'" "error: $f:$(line_of "$f" "- ../x: builder of step 1, $sonnet"): invalid agent id '../x'" "error: $f:$(line_of "$f" "- : builder of step 1, $sonnet"): invalid agent id ''"
check_error "agent ids a*b, ../x and an empty id" 1

d=$test_root/err-form
ledger "$d/ledger" "$b_ab1" "- ab1 builder of step 1" "* ar1: reviewer of step 1, $opus" "- ar2: reviewer of step 1 over round 1,"
roles "$d/ledger" "- abc brief check of step 1"
main_root "$d/root"
run "$d/ledger" "$d/root"
f=$d/ledger/plan.md
g=$d/ledger/agents/agent-roles.md
want_err "error: $f:$(line_of "$f" '- ab1 builder of step 1'): $form_error" "error: $f:$(line_of "$f" "* ar1: reviewer of step 1, $opus"): $form_error" "error: $f:$(line_of "$f" '- ar2: reviewer of step 1 over round 1,'): $form_error" "error: $g:$(line_of "$g" '- abc brief check of step 1'): $form_error"
check_error "a bullet not of the form, a * bullet and a bullet with no model, in the section and in agent-roles.md" 1

d=$test_root/err-indented
ledger "$d/ledger" "$b_ab1" "  - ab9: builder of step 3, $opus"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: no transcript of agent ab9 under $d/root"
check_error "an indented bullet is read as an agent" 1

d=$test_root/err-roles
ledger "$d/ledger" "- ab1: planner of step 1, $sonnet" "- ab2: builder of step A, $sonnet" "- ab3: Builder of step 1, $sonnet" "- ab4: reviewer of step 1 over round, $sonnet" "- ab5: builder of step 1b2, $sonnet" "- ab6: grill lookup of step 1, $sonnet"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: agent ab1 has an unknown role: planner of step 1" "error: agent ab2 has an unknown role: builder of step A" "error: agent ab3 has an unknown role: Builder of step 1" "error: agent ab4 has an unknown role: reviewer of step 1 over round" "error: agent ab5 has an unknown role: builder of step 1b2" "error: agent ab6 has an unknown role: grill lookup of step 1"
check_error "a role that is not a role kind, and near misses" 1

d=$test_root/err-no-agent
ledger "$d/ledger"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: the ledger names no agent"
check_error "no agent bullet in the ledger" 1

d=$test_root/err-first-line
ledger "$d/ledger" "$b_ab1"
sed '1s/.*/# Notes/' "$d/ledger/plan.md" >"$d/plan.md" && mv "$d/plan.md" "$d/ledger/plan.md"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: $d/ledger/plan.md:1: the first line is not \"# Plan: <entry>\""
check_error "a plan.md whose first line is # Notes" 1

d=$test_root/err-empty-entry
ledger "$d/ledger" "$b_ab1"
sed '1s/.*/# Plan: /' "$d/ledger/plan.md" >"$d/plan.md" && mv "$d/plan.md" "$d/ledger/plan.md"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: $d/ledger/plan.md:1: the first line is not \"# Plan: <entry>\""
check_error "a plan.md whose first line names no entry" 1

d=$test_root/err-utf8
ledger "$d/ledger" "$b_ab1"
printf '\377\n' >>"$d/ledger/plan.md"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: cannot read $d/ledger/plan.md: not valid UTF-8"
check_error "a plan.md that is not UTF-8" 1

d=$test_root/err-roles-dir
ledger "$d/ledger" "$b_ab1" "$b_abc" "$b_ar1" "$b_ar2" "$b_ag1"
mkdir -p "$d/ledger/agents/agent-roles.md"
main_root "$d/root"
run "$d/ledger" "$d/root"
want_err "error: cannot read $d/ledger/agents/agent-roles.md: Is a directory"
check_error "agent-roles.md that is a directory" 1

# ---- Errors of the transcripts ----

d=$test_root/err-json
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
{
    resp m1 r1 $sonnet 1 0 0 0 1
    printf 'not json\n'
    printf '[]\n'
    printf '\377\n'
    resp m2 r2 $sonnet 1 0 0 0 1
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: $f:2: not valid JSON" "error: $f:3: not a JSON object" "error: $f:4: not valid JSON"
check_error "a line that is not JSON, one that is [] and one that is not UTF-8" 1

d=$test_root/err-fields
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
{
    resp m1 r1 $sonnet 1 0 0 0 1
    printf '{"type":"assistant","message":{"id":"m2","usage":%s},"requestId":"r2"}\n' "$(usage 1 0 0 0 1)"
    entry m3 r3 $sonnet "$(usage 1 0 0 0 1 | sed 's/"output_tokens":1/"output_tokens":null/')"
    entry m4 r4 $sonnet "$(usage 1 0 0 0 1 | sed 's/"input_tokens":1,/"input_tokens":-1,/')"
    entry m5 r5 $sonnet "$(usage 1 0 0 0 1 | sed 's/"input_tokens":1,/"input_tokens":1.5,/')"
    entry m6 r6 $sonnet "$(usage 1 0 0 0 1 | sed 's/"output_tokens":1/"output_tokens":true/')"
    entry m7 r7 $sonnet "$(usage 1 0 0 0 1 | sed 's/"output_tokens":1,//')"
    entry m8 r8 $sonnet '"x"'
    entry m9 r9 $sonnet "$(usage 1 0 0 0 1 | sed 's/"cache_creation":{[^}]*}/"cache_creation":5/')"
    entry m10 r10 $sonnet "$(usage 1 0 0 0 1 ',"server_tool_use":5')"
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: $f:2: no message.model" "error: $f:3: usage.output_tokens is not a whole number of 0 or more: null" "error: $f:4: usage.input_tokens is not a whole number of 0 or more: -1" "error: $f:5: usage.input_tokens is not a whole number of 0 or more: 1.5" "error: $f:6: usage.output_tokens is not a whole number of 0 or more: true" "error: $f:7: usage.output_tokens is missing" "error: $f:8: usage is not an object" "error: $f:9: usage.cache_creation is not an object" "error: $f:10: usage.server_tool_use is not an object"
check_error "a response with no model, a null, a negative, a fractional, a true and a missing count, and a usage, a cache_creation and a server_tool_use that are not objects" 1

d=$test_root/err-ids-entry
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
{
    resp m1 r1 $sonnet 1 0 0 0 1
    printf '{"type":"assistant","message":{"model":"<synthetic>","id":"m2","usage":%s}}\n' "$(usage 0 0 0 0 5)"
    printf '{"type":"assistant","message":{"model":"%s","usage":%s},"requestId":"r3"}\n' $sonnet "$(usage 1 0 0 0 1)"
    synthetic m4
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: $f:2: no requestId" "error: $f:3: no message.id"
check_error "the zero-count entry with output 5 and an entry with no message.id" 1

d=$test_root/err-cache
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
{
    resp m1 r1 $sonnet 1 0 0 0 1
    entry m2 r2 $sonnet '{"input_tokens":1,"cache_creation_input_tokens":100,"cache_read_input_tokens":0,"output_tokens":1,"cache_creation":{"ephemeral_5m_input_tokens":60,"ephemeral_1h_input_tokens":30}}'
    entry m3 r3 $sonnet '{"input_tokens":1,"cache_creation_input_tokens":100,"cache_read_input_tokens":0,"output_tokens":1}'
    entry m4 r4 $sonnet '{"input_tokens":1,"cache_creation_input_tokens":0,"cache_read_input_tokens":0,"output_tokens":1}'
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: $f:2: usage.cache_creation_input_tokens is 100, but the two cache writes sum to 90" "error: $f:3: usage.cache_creation_input_tokens is 100 and usage has no cache_creation"
check_error "cache_creation_input_tokens that is not the sum, and above 0 with no cache_creation" 1

d=$test_root/err-flags
ledger "$d/ledger" "$b_ab1"
f=$d/root/p/s1/subagents/agent-ab1.jsonl
{
    resp m1 r1 $sonnet 1 0 0 0 1
    resp m2 r2 $sonnet 1 0 0 0 1 ',"speed":"fast"'
    resp m3 r3 $sonnet 1 0 0 0 1 ',"inference_geo":"us"'
    resp m4 r4 $sonnet 1 0 0 0 1 ',"service_tier":"batch"'
    resp m5 r5 $sonnet 1 0 0 0 1 ',"server_tool_use":{"web_search_requests":2,"web_fetch_requests":0}'
} | put "$d/root" p/s1 ab1
run "$d/ledger" "$d/root"
want_err "error: $f:2: usage.speed is \"fast\", which the table does not price" "error: $f:3: usage.inference_geo is \"us\", which the table does not price" "error: $f:4: usage.service_tier is \"batch\", which the table does not price" "error: $f:5: usage.server_tool_use.web_search_requests is 2, which the table does not price"
check_error "fast speed, us geo, batch tier and two web searches" 1

if [ "$(id -u)" -ne 0 ]; then
    d=$test_root/err-locked
    main_fixture "$d"
    mkdir "$d/root/locked"
    chmod 000 "$d/root/locked"
    run "$d/ledger" "$d/root"
    chmod 755 "$d/root/locked"
    want_err "error: cannot read $d/root/locked: Permission denied"
    check_error "a folder under the transcript root that cannot be read" 1

    d=$test_root/err-unreadable
    main_fixture "$d"
    chmod 000 "$d/root/p/s1/subagents/agent-ar1.jsonl"
    run "$d/ledger" "$d/root"
    chmod 644 "$d/root/p/s1/subagents/agent-ar1.jsonl"
    want_err "error: cannot read $d/root/p/s1/subagents/agent-ar1.jsonl: Permission denied"
    check_error "a transcript file that cannot be read" 1
fi

# ---- The table ----

tbl=$test_root/tbl
mkdir -p "$tbl"
cp "$tool" "$tbl/plan_cost.py"
shown_table=$tbl/prices.txt
d=$test_root/main
comment_1='# Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.'
comment_2='# Columns, separated by spaces: model, input, cache write 5m, cache write 1h, cache read, output.'
row_opus='claude-opus-5-5 4 5 8 0.20 20'
row_sonnet='claude-sonnet-5-5 2 2.50 4 0.20 10'

# Run the copy of the script, whose table is the copy beside it.
run_copy() {
    python3 "$tbl/plan_cost.py" "$d/ledger" "$d/root" >"$out" 2>"$err"
    status=$?
}

lines "$tbl/prices.txt" "$comment_1" "$comment_2" '' "$row_opus" '# a third comment line' "$row_sonnet"
run_copy
want_main
check_ok "a copy of the table with a blank line and a third comment line"

rm "$tbl/prices.txt"
run_copy
want_err "error: cannot read $tbl/prices.txt: No such file or directory"
check_error "a missing table" 1

: >"$tbl/prices.txt"
run_copy
want_err "error: $tbl/prices.txt:1: the first line is not a # comment"
check_error "an empty table" 1

lines "$tbl/prices.txt" "$row_opus" "$comment_2" "$row_sonnet"
run_copy
want_err "error: $tbl/prices.txt:1: the first line is not a # comment"
check_error "a table whose first line is a row" 1

lines "$tbl/prices.txt" "$comment_1" "$comment_2" 'claude-opus-5-5 4 5 8 0.20' "$row_sonnet"
run_copy
want_err "error: $tbl/prices.txt:3: a row has 5 fields, expected 6"
check_error "a row of five fields" 1

lines "$tbl/prices.txt" "$comment_1" "$comment_2" 'claude-opus-5-5 4 5 8 0.20 20 1' "$row_sonnet"
run_copy
want_err "error: $tbl/prices.txt:3: a row has 7 fields, expected 6"
check_error "a row of seven fields" 1

for price in abc NaN -4; do
    lines "$tbl/prices.txt" "$comment_1" "$comment_2" "claude-opus-5-5 4 5 8 $price 20" "$row_sonnet"
    run_copy
    want_err "error: $tbl/prices.txt:3: price '$price' is not a number"
    check_error "a price $price" 1
done

lines "$tbl/prices.txt" "$comment_1" "$comment_2" "$row_opus" "$row_sonnet" 'claude-opus-5-5 1 1 1 1 1'
run_copy
want_err "error: $tbl/prices.txt:5: model claude-opus-5-5 is listed twice, first on line 3"
check_error "a model listed twice" 1

lines "$tbl/prices.txt" "$comment_1" "$comment_2" 'claude-opus-5-5 4 5 8 0.20' 'claude-sonnet-5-5 2 2.50 4 abc 10'
run_copy
want_err "error: $tbl/prices.txt:3: a row has 5 fields, expected 6" "error: $tbl/prices.txt:4: price 'abc' is not a number"
check_error "two bad rows are both reported" 1
d=$test_root/decimal
ledger "$d/ledger" "- ah1: grill lookup, $opus"
resp m1 r1 $opus 100000 0 0 0 0 | put "$d/root" p/s1 ah1
lines "$tbl/prices.txt" "$comment_1" "$comment_2" 'claude-opus-5-5 0.15 5 8 0.20 20'
run_copy
{
    header "9.Z Fixture"
    cat <<'EOF'
Role          Agents  No body   Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
grill lookup       1        1  100000               0               0           0       0      >=0.02
Total              1        1  100000               0               0           0       0      >=0.02

Agent  Role          Model            No body   Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
ah1    grill lookup  claude-opus-5-5        1  100000               0               0           0       0      >=0.02
EOF
} >"$exp_out"
check_ok "a price of 0.15 on 100000 tokens is exactly 0.015 and rounds up to 0.02"
shown_table=

# ---- Usage errors ----

d=$test_root/usage
mkdir -p "$d/empty"
: >"$d/afile"
main_fixture "$d/ok"

run
check_usage "no argument" "error: expected <ledger folder> and, optionally, <transcript root>"

run "$d/ok/ledger" "$d/ok/root" extra
check_usage "three arguments" "error: expected <ledger folder> and, optionally, <transcript root>"

run "$d/nothere" "$d/ok/root"
check_usage "a ledger folder that does not exist" "error: no such folder: $d/nothere"

run "$d/afile" "$d/ok/root"
check_usage "a ledger path that is a file" "error: not a folder: $d/afile"

run "$d/empty" "$d/ok/root"
check_usage "a ledger folder with no plan.md" "error: no plan.md in $d/empty"

run "$d/ok/ledger" "$d/noroot"
check_usage "a transcript root that does not exist" "error: no such folder: $d/noroot"

run "$d/ok/ledger" "$d/afile"
check_usage "a transcript root that is a file" "error: not a folder: $d/afile"

printf 'PASS: plan_cost.py scratch tests\n'
