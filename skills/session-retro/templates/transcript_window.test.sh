#!/bin/sh
# Exercise transcript_window.py on scratch transcript folders, each case one folder and one run, checking stdout, stderr and the exit status.
# A folder holds a main session s1.jsonl, its subagent s1/subagents/agent-a1.jsonl, a nested subagent agent-a2.jsonl in the same folder, a second main session s2.jsonl and its subagent agent-b1.jsonl.
# Order: entries stamped 10:10:00Z and 10:10:00.500Z in two files, and one stamped 12:05:00+02:00 beside one stamped 10:06:00Z, print in time order, which differs from the order of the stamps as strings.
# Window: entries at 10:00:00.000Z and 10:59:59.999Z are printed, entries at 09:59:59.999Z and 11:00:00.000Z are not, each boundary also checked alone; the same window written with +02:00 offsets, with and without fractions of a second, and mixed, prints the same; an entry stamped 10:30:00+00:00 is compared as a time and printed with its own stamp; an empty window prints nothing; a folder with no .jsonl file prints nothing; a folder path holding a space works.
# Files: a subagent entry in the window prints with the prefix agent-a1 and one outside does not; the subagent file of another session and the nested subagent file print; entries of s1, agent-a1 and s2 interleave by timestamp, and equal timestamps in s1.jsonl and s2.jsonl print in path order; the prefix carries the line number of the entry; --session s1 prints every entry of s1.jsonl, agent-a1 and agent-a2 and none of s2; the script runs under /usr/bin/python3 as under python3.
# Printed as user: a user string, a user string starting <command-name>, a text block of a user array, a queued_command attachment with commandMode prompt and humanTurn, the first user string of a subagent. Not printed: a user string with isMeta or isCompactSummary, one starting <task-notification>, a text block of a user array with isMeta, a tool_result block, a queued_command with attachment.isMeta, one with commandMode task-notification, an attachment of another type, a queue-operation entry, a thinking block, a user string starting <bash-stdout>, <bash-stderr>, <local-command-stdout> or <local-command-stderr>. Printed as user beside them: a user string starting <bash-input> or <command-message>.
# Assistant entries: a text block prints as text; a Bash call prints its first command line only; a Read call its file_path; an Agent call its description; a call with input {} and a call whose first string value starts with a newline print the prefix and nothing after it; a number before the first string value is passed over; a text of three lines indents its second and third lines by two spaces; the blocks of one entry print in their order, checked with a Read call before a Bash call.
# Redaction: an sk-ant key, an sk_live key, a ghp token, a glpat token, an AKIA key, a JWT, a Slack webhook URL, Authorization: Bearer and Basic, Cookie: session=, password=hunter2 unquoted and quoted, api_key= and "api_key": quoted, AWS_SECRET_ACCESS_KEY=, x-api-key:, a PEM private key block, a URL password, and the other key shapes (sk-, github_pat_, npm_, hf_, xoxb-, AIza, a Bearer word) print as <REDACTED>; a PEM private key block with no END line is redacted to the end of the text and a PUBLIC KEY block is kept; SECRET_KEY=abc, my_secret_key=abc and secret_key: abc are redacted and secretary: Anna is kept; --password hunter2, --api-key abc123, --token=abc123, the option form of every name of the list and an option that ends in a name (--db-password, --client-secret, --access-token, --secret-key) are redacted, secret-key=abc is redacted, and --tokens 5, --password-file ./p, --max-tokens 5 and --token-file ./t are kept; a PGP PRIVATE KEY BLOCK is redacted and a PGP PUBLIC KEY BLOCK is kept; a tab or several spaces after Bearer or Basic is accepted; an unquoted value ends at ), ], } and ; (def f(password: str) -> None: prints password: <REDACTED>) -> None:); a secret in a tool input is redacted; a 40-character commit hash, a UUID, an agent id, max_tokens: 100 and a task- word of 20 letters print as they are.
# Lines skipped, each with exit 0 and the rest printed: a line that is not JSON, two such lines, a torn last line with no newline, a line with a byte that is not UTF-8, a user entry with no timestamp, and an entry with a timestamp that has no zone give skipped <n> lines of <file> on stderr; a mode and an ai-title entry with no timestamp are not counted and give no stderr line.
# A file that cannot be read (mode 000, skipped when the test runs as root) gives error: cannot read <file> on stderr, the other files print, and the exit status is 1; so does a session folder that cannot be listed (mode 000), in window mode and with --session, and a transcript folder that cannot be listed.
# The output closed early: the script over more than 100000 bytes of output piped into head -n 1 exits 0 with nothing on stderr and one line out; with a file at mode 000 beside it (skipped as root) it exits 1 with the error line.
# Errors, each exit 2 with one error: line on stderr and nothing on stdout: no arguments, a missing folder, a folder argument naming a file, a time without a zone, an unparsable time, an end equal to the start, an end before the start, --session naming no file, --session a1 (a subagent id), --session "", --session ../x, --session '*', --session s1 with two times, a fourth argument, a folder whose parent cannot be searched (mode 000), in window mode and with --session, which gives error: cannot read <folder> and exit 2.

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
    dest=$test_root/$1
    mkdir -p "$dest/s1/subagents" "$dest/s2/subagents"
    {
        text_line 2026-09-30T09:59:59.999Z s1 "s1 before"
        text_line 2026-09-30T10:00:00.000Z s1 "s1 at start"
        text_line 2026-09-30T10:30:00+00:00 s1 "s1 other zone form"
        text_line 2026-09-30T10:59:59.999Z s1 "s1 last"
        text_line 2026-09-30T11:00:00.000Z s1 "s1 at end"
    } >"$dest/s1.jsonl"
    {
        user_line 2026-09-30T10:10:00.000Z s1 "a1 prompt" ""
        text_line 2026-09-30T10:20:00.000Z s1 "a1 in"
        text_line 2026-09-30T11:30:00.000Z s1 "a1 out"
    } >"$dest/s1/subagents/agent-a1.jsonl"
    text_line 2026-09-30T10:40:00.000Z s1 "a2 nested" >"$dest/s1/subagents/agent-a2.jsonl"
    {
        text_line 2026-09-30T10:15:00.000Z s2 "s2 first"
        text_line 2026-09-30T10:30:00.000Z s2 "s2 tie"
    } >"$dest/s2.jsonl"
    text_line 2026-09-30T10:50:00.000Z s2 "b1 in" >"$dest/s2/subagents/agent-b1.jsonl"
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

# Run the fixed window over the folder named by the first argument and check the wanted stdout lines after the second (the check's name).
window_case() {
    dir=$1
    name=$2
    shift 2
    run "$test_root/$dir" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
    want_out "$@"
    want_err
    check "$name" 0
}

# Write a folder holding the session file one.jsonl, whose lines come from stdin.
one_case() {
    mkdir "$test_root/$1"
    cat >"$test_root/$1/one.jsonl"
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

for tag in bash-stdout bash-stderr local-command-stdout local-command-stderr; do
    user_line 2026-09-30T10:01:00.000Z one "<$tag>output</$tag>" "" | one_case "tag-$tag"
    window_case "tag-$tag" "not printed: a user string starting <$tag>"
done
for tag in bash-input command-message; do
    user_line 2026-09-30T10:01:00.000Z one "<$tag>ls</$tag>" "" | one_case "tag-$tag"
    window_case "tag-$tag" "printed: a user string starting <$tag>" "one 1 2026-09-30T10:01:00.000Z user: <$tag>ls</$tag>"
done

mkdir "$test_root/times"
{
    text_line 2026-09-30T10:10:00.500Z ta "half a second past"
    text_line 2026-09-30T12:05:00+02:00 ta "five past, two hours ahead"
} >"$test_root/times/ta.jsonl"
{
    text_line 2026-09-30T10:10:00Z tb "on the minute"
    text_line 2026-09-30T10:06:00Z tb "six past"
} >"$test_root/times/tb.jsonl"
window_case times "order as a time, not as a string" \
    "ta 2 2026-09-30T12:05:00+02:00 text: five past, two hours ahead" \
    "tb 2 2026-09-30T10:06:00Z text: six past" \
    "tb 1 2026-09-30T10:10:00Z text: on the minute" \
    "ta 1 2026-09-30T10:10:00.500Z text: half a second past"

assistant_line 2026-09-30T10:01:00.000Z one '{"type":"tool_use","id":"t1","name":"Read","input":{"file_path":"/a"}},{"type":"tool_use","id":"t2","name":"Bash","input":{"command":"ls"}}' | one_case blocks
window_case blocks "the blocks of one entry in their order" \
    "one 1 2026-09-30T10:01:00.000Z tool Read: /a" \
    "one 1 2026-09-30T10:01:00.000Z tool Bash: ls"

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

# One redaction case: the name, the planted text, then the printed text (each further argument is a further printed line).
redact_case() {
    label=$1
    printed=$3
    text_line 2026-09-30T10:01:00.000Z one "$2" | one_case "redact-$label"
    shift 3
    window_case "redact-$label" "redaction: $label" "one 1 2026-09-30T10:01:00.000Z text: $printed" "$@"
}

tab=$(printf '\t')
redact_case pem-no-end 'key -----BEGIN PRIVATE KEY-----\nMIIabc\nmore' 'key <REDACTED>'
redact_case pem-public-kept 'pub -----BEGIN PUBLIC KEY-----\nMIIabc\n-----END PUBLIC KEY-----' 'pub -----BEGIN PUBLIC KEY-----' '  MIIabc' '  -----END PUBLIC KEY-----'
redact_case secret-key 'SECRET_KEY=abc end' 'SECRET_KEY=<REDACTED> end'
redact_case secret-key-suffix 'my_secret_key=abc end' 'my_secret_key=<REDACTED> end'
redact_case secret-key-colon 'secret_key: abc end' 'secret_key: <REDACTED> end'
redact_case secretary-kept 'secretary: Anna end' 'secretary: Anna end'
redact_case option-password 'run --password hunter2 now' 'run --password <REDACTED> now'
redact_case option-api-key 'run --api-key abc123 now' 'run --api-key <REDACTED> now'
redact_case option-token-equals 'run --token=abc123 now' 'run --token=<REDACTED> now'
redact_case option-quoted 'run --password \"a b\" now' 'run --password "<REDACTED>" now'
redact_case option-tokens-kept 'run --tokens 5 now' 'run --tokens 5 now'
redact_case option-password-file-kept 'run --password-file ./p now' 'run --password-file ./p now'
redact_case option-suffix-password 'run --db-password hunter2 now' 'run --db-password <REDACTED> now'
redact_case option-suffix-secret 'run --client-secret abc123 now' 'run --client-secret <REDACTED> now'
redact_case option-suffix-token 'run --access-token abc123 now' 'run --access-token <REDACTED> now'
redact_case option-secret-key 'run --secret-key abc123 now' 'run --secret-key <REDACTED> now'
redact_case secret-key-hyphen 'secret-key=abc end' 'secret-key=<REDACTED> end'
redact_case option-suffix-kept 'run --max-tokens 5 --token-file ./t now' 'run --max-tokens 5 --token-file ./t now'
redact_case pgp-private 'k -----BEGIN PGP PRIVATE KEY BLOCK-----\nlQOYBF\n-----END PGP PRIVATE KEY BLOCK----- after' 'k <REDACTED> after'
redact_case pgp-public-kept 'k -----BEGIN PGP PUBLIC KEY BLOCK-----' 'k -----BEGIN PGP PUBLIC KEY BLOCK-----'
redact_case bearer-tab 'x Bearer\tabc123 y' "x Bearer$tab<REDACTED> y"
redact_case basic-spaces 'x Basic   dXNlcjpwYXNz y' 'x Basic   <REDACTED> y'
redact_case ends-at-paren 'def f(password: str) -> None:' 'def f(password: <REDACTED>) -> None:'
redact_case ends-at-bracket 'a[password=abc] b' 'a[password=<REDACTED>] b'
redact_case ends-at-brace '{token: abc} b' '{token: <REDACTED>} b'
redact_case ends-at-semicolon 'password=abc; echo' 'password=<REDACTED>; echo'

# The option form of every name of the list, one entry per name.
mkdir "$test_root/options"
n=0
: >"$exp_out"
for name in password passwd secret token api_key api-key apikey access_key access-key private_key credentials secret_key; do
    tick
    text_line "$ts" opt "run --$name value1 --$name=value2 end" >>"$test_root/options/opt.jsonl"
    printf 'opt %s %s text: run --%s <REDACTED> --%s=<REDACTED> end\n' "$n" "$ts" "$name" "$name" >>"$exp_out"
done
run "$test_root/options" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
want_err
check "redaction: the option form of every name" 0

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

    make_base unlist
    chmod 000 "$test_root/unlist/s1"
    run "$test_root/unlist" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
    chmod 755 "$test_root/unlist/s1"
    want_out \
        "s1 2 2026-09-30T10:00:00.000Z text: s1 at start" \
        "s2 1 2026-09-30T10:15:00.000Z text: s2 first" \
        "s1 3 2026-09-30T10:30:00+00:00 text: s1 other zone form" \
        "s2 2 2026-09-30T10:30:00.000Z text: s2 tie" \
        "agent-b1 1 2026-09-30T10:50:00.000Z text: b1 in" \
        "s1 4 2026-09-30T10:59:59.999Z text: s1 last"
    want_err "error: cannot read $test_root/unlist/s1: Permission denied"
    check "a session folder that cannot be listed" 1

    chmod 000 "$test_root/unlist/s1"
    run "$test_root/unlist" --session s1
    chmod 755 "$test_root/unlist/s1"
    want_out \
        "s1 1 2026-09-30T09:59:59.999Z text: s1 before" \
        "s1 2 2026-09-30T10:00:00.000Z text: s1 at start" \
        "s1 3 2026-09-30T10:30:00+00:00 text: s1 other zone form" \
        "s1 4 2026-09-30T10:59:59.999Z text: s1 last" \
        "s1 5 2026-09-30T11:00:00.000Z text: s1 at end"
    want_err "error: cannot read $test_root/unlist/s1: Permission denied"
    check "a session folder that cannot be listed, with --session" 1

    mkdir "$test_root/nolist"
    text_line 2026-09-30T10:01:00.000Z nl "hidden" >"$test_root/nolist/nl.jsonl"
    chmod 000 "$test_root/nolist"
    run "$test_root/nolist" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
    chmod 755 "$test_root/nolist"
    want_out
    want_err "error: cannot read $test_root/nolist: Permission denied"
    check "a transcript folder that cannot be listed" 1

    mkdir -p "$test_root/locked/inner"
    chmod 000 "$test_root/locked"
    run "$test_root/locked/inner" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z
    chmod 755 "$test_root/locked"
    want_out
    want_err "error: cannot read $test_root/locked/inner: Permission denied"
    check "a folder whose parent cannot be searched" 2
    chmod 000 "$test_root/locked"
    run "$test_root/locked/inner" --session s1
    chmod 755 "$test_root/locked"
    check "a folder whose parent cannot be searched, with --session" 2
fi

# The output closed early: the reader of stdout stops after one line.
mkdir "$test_root/big"
long=$(awk 'BEGIN { for (i = 0; i < 1000; i++) printf "xxxxxxxxxx" }')
n=0
while [ "$n" -lt 30 ]; do
    tick
    text_line "$ts" big "$long"
done >"$test_root/big/big.jsonl"
(
    python3 "$reader" "$test_root/big" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z 2>"$err"
    echo $? >"$test_root/pipe-status"
) | head -n 1 >"$out"
status=$(cat "$test_root/pipe-status")
printf 'big 1 2026-09-30T10:01:00.000Z text: %s\n' "$long" >"$exp_out"
want_err
check "the output closed early" 0

# The output closed early while a file could not be read: the exit status stays 1.
if [ "$(id -u)" -ne 0 ]; then
    : >"$test_root/big/locked.jsonl"
    chmod 000 "$test_root/big/locked.jsonl"
    (
        python3 "$reader" "$test_root/big" 2026-09-30T10:00:00Z 2026-09-30T11:00:00Z 2>"$err"
        echo $? >"$test_root/pipe-status"
    ) | head -n 1 >"$out"
    chmod 644 "$test_root/big/locked.jsonl"
    status=$(cat "$test_root/pipe-status")
    want_err "error: cannot read $test_root/big/locked.jsonl: Permission denied"
    check "the output closed early while a file could not be read" 1
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
