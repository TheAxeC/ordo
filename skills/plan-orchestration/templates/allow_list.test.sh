#!/bin/sh
# Exercise allow_list.py on scratch state files under $TMPDIR, in a folder whose path holds a
# space. Each case writes a state file whose first yaml block is the configuration block, runs the
# script with the extra commands the case gives, and checks its exit status, its standard output
# and its standard error. Each case names the change to allow_list.py that turns it red.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

scratch=$(mktemp -d "${TMPDIR:-/tmp}/allow-list-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$scratch"' 0 1 2 3 15
test_root="$scratch/a test root"
mkdir -p "$test_root" || fail "could not create the test root"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
list=$script_dir/allow_list.py
n=0

# state <yaml block>: write a fresh state file whose first yaml block is the text given, followed
# by a dispatch block, as the state template has them; sets state to its path.
state() {
    n=$((n + 1))
    state="$test_root/case $n.md"
    printf '# Orchestrator state\n\n```yaml\n%s\n```\n\n' "$1" >"$state"
    printf '```yaml\ndispatch: none\n```\n' >>"$state"
}

# expect_list <case> <expected output> [<command>...]: the script on the current state file exits
# 0, prints exactly the expected lines on standard output and nothing on standard error.
expect_list() {
    what=$1
    want=$2
    shift 2
    python3 "$list" "$state" "$@" >"$test_root/out" 2>"$test_root/err"
    status=$?
    [ "$status" -eq 0 ] || fail "$what: exited $status, expected 0: $(cat "$test_root/err")"
    got=$(cat "$test_root/out")
    [ "$got" = "$want" ] || fail "$what: printed
$got
expected
$want"
    [ ! -s "$test_root/err" ] || fail "$what: wrote to standard error: $(cat "$test_root/err")"
}

# expect_refusal <case> <message part> <state file> [<command>...]: the script exits 64, prints
# nothing on standard output, and one line starting with "allow_list.py: " and holding the part on
# standard error.
expect_refusal() {
    what=$1
    want=$2
    shift 2
    python3 "$list" "$@" >"$test_root/out" 2>"$test_root/err"
    status=$?
    [ "$status" -eq 64 ] || fail "$what: exited $status, expected 64: $(cat "$test_root/err")"
    [ ! -s "$test_root/out" ] || fail "$what: printed $(cat "$test_root/out")"
    err=$(cat "$test_root/err")
    case "$err" in
        "allow_list.py: "*"$want"*) ;;
        *) fail "$what: standard error was [$err], expected a line holding [$want]" ;;
    esac
    [ "$(wc -l <"$test_root/err")" -eq 1 ] ||
        fail "$what: more than one line on standard error: $err"
}

# The verify list's simple commands, each once, in the order first seen. Red when the split at |
# is removed, when the redirection 2>&1 is kept, or when the result is not made unique.
state 'verify: ["sh a.test.sh 2>&1 | tail -1", "python3 utils/x.py"]'
expect_list "the verify list alone" "sh a.test.sh
tail -1
python3 utils/x.py"
expect_list "the verify list and one command" "sh a.test.sh
tail -1
python3 utils/x.py
sh b.test.sh" "sh b.test.sh 2>&1 | tail -1"

# A | inside quotes does not split, and the prefix stops before the quoted word. Red when quotes
# are not read, which splits at the | between a and b; the verify list's folded scalar gives the
# same.
state 'verify: []'
expect_list "a pipe inside quotes" "git ls-files -coz --exclude-standard
xargs -0 perl -CSD -ne" \
    "git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'print if /a|b/'"
state "verify:
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'print if /a|b/'"
expect_list "a pipe inside quotes in the verify list" "git ls-files -coz --exclude-standard
xargs -0 perl -CSD -ne"
state 'verify: []'
expect_list "a pipe inside double quotes and an escaped pipe" 'grep -e
wc -l
grep' 'grep -e "a|b" x | wc -l; grep a\|b y'

# The prefix stops before the first word holding a character no permission rule can hold. Red when
# the cut is removed (the whole simple command is printed), or when a quote, $, a backslash, [, ],
# a comma, * or ? is not in the set. The backtick here sits inside single quotes, whose quote cuts
# the word first; the worker_allow entry cases hold the backtick, (, ), { and }.
expect_list "the cut before each character" "sh a.sh
sh b.sh --x
sh c.sh
sh d.sh
sh e.sh
sh f.sh
sh g.sh
sh h.sh
sh i.sh
sh j.sh" "sh a.sh 'q' z; sh b.sh --x \"q\" z; sh c.sh \$HOME z; sh d.sh '\`' z; sh e.sh a\\b z" \
    "sh f.sh [a z; sh g.sh a] z; sh h.sh a,b z; sh i.sh *.py z; sh j.sh a? z"

# A command whose parts are not simple commands is refused, naming the command: $( or a backtick
# outside single quotes, and (, ), { or } outside quotes. Red when the check is removed (the
# parts are printed as prefixes).
for command in 'echo $(git ls-files | wc -l)' 'echo `git ls-files | wc -l`' \
    '(cd x && sh a.sh) | tail -1' '{ sh a.sh; } 2>&1 | tail -1' 'echo "$(date)" | wc -l' \
    'sh a.sh "`date`"' 'sh a.sh )'; do
    expect_refusal "the command $command" \
        "holds \$( or a backtick outside single quotes, or (, ), { or } outside quotes: $command" \
        "$state" "$command"
done
# The control: the same characters inside single quotes are part of a word.
expect_list "grouping characters inside single quotes" "sh a.sh" "sh a.sh '\$(x) \`y\` (z) {w}'"

# A simple command whose first word is a shell keyword, or holds a character no rule can hold, is
# refused, naming the word and the command. Red when the check is removed (the keyword or the
# empty prefix is printed).
for pair in 'if|if true; then sh a.sh; fi' '!|! sh a.sh' 'while|sh a.sh; while x; do y; done' \
    '[|[ -f x ] && sh a.sh' '*.sh|*.sh --x' '"sh"|"sh" a.sh'; do
    word=${pair%%"|"*}
    command=${pair#*"|"}
    expect_refusal "the first word $word" \
        "the command starts a simple command with $word, which no rule can hold: $command" \
        "$state" "$command"
done
# The control: a keyword that is not the first word is an argument.
expect_list "a keyword as an argument" "grep if x.sh" "grep if x.sh"

# Each separator splits: &&, ;, ||, and the forms without spaces. Red when | (the || case), ; or
# & (the && case) is not a separator.
expect_list "the separators" "a
b
c
d" "a && b; c || d"
expect_list "the separators without spaces" "a
b
c
d
e" "a&&b;c||d|e"

# A newline and a single & split as well: sh one.sh is seen twice and printed once. Red when the
# newline, or &, is not a separator (sh one.sh is then printed twice).
state 'verify:
- |-
  sh one.sh
  sh one.sh & sh two.sh'
expect_list "a newline and &" "sh one.sh
sh two.sh"

# A carriage return is refused, naming the command: claude would receive it inside a rule. Red when
# the check is removed (sh a\rb.sh is printed).
state 'verify: ["sh a\rb.sh z"]'
expect_refusal "a carriage return inside a word" "the command holds a carriage return" "$state"
state 'verify: ["sh c.sh\r"]'
expect_refusal "a carriage return at the end" "the command holds a carriage return" "$state"

# A line break inside quotes stays in its word, which the prefix stops before. Red when a newline
# inside quotes splits (a prefix y' is refused as an unclosed quote).
state 'verify: ["sh a.sh '"'"'x\ny'"'"' z"]'
expect_list "a line break inside quotes" "sh a.sh"
state 'verify: []'

# Each redirection is removed with its target, attached or after a space. Red when any of the
# forms is kept.
expect_list "the redirections" "sh t.sh
cat
sort -u" "sh t.sh 2>&1 >out.txt 2>/dev/null | cat <in.txt >>log.txt" \
    "sort -u > sorted.txt 2> err.txt"

# The redirections that read or duplicate a descriptor or force a write: 0<&3, >|file, <>file.
# Red when <& or >| is not a redirection (its & or | then splits the command and the target is
# printed as a command of its own).
expect_list "the other redirections" "sh t.sh" "sh t.sh 0<&3 >|forced.txt <>rw.txt"
expect_list "the other redirections, spaced" "sh t.sh --x" "sh t.sh 0<& 3 >| forced.txt --x"

# A comment is removed to the end of its line, a | in it included. Red when # is read as a word.
expect_list "a comment" "sh a.sh" "sh a.sh # run it | tail -1"

# A backslash inside double quotes escapes the quote after it, so the quote does not close there.
# Red when the backslash is not read (the | after the quote splits, then a quote is left open).
expect_list "an escaped quote inside double quotes" "grep
wc -l" 'grep "a\"|b" x | wc -l'

# A backslash before a newline joins the two lines into one simple command. Red when the pair is
# kept (the word holds a backslash and the prefix stops before it).
state 'verify:
- |-
  sh a.sh \
    --flag'
expect_list "a backslash-newline" "sh a.sh --flag"
state 'verify: []'

# A command left empty once its redirections are removed is not printed, and an empty command
# between separators is not either. Red when an empty line is printed.
expect_list "an empty simple command" "sh t.sh" ">out.txt; sh t.sh ;"

# The extra commands are read after the verify list, and a command given twice is printed once.
state 'verify: ["sh a.sh"]'
expect_list "a command given twice" "sh a.sh
sh b.sh" "sh b.sh" "sh a.sh | sh b.sh"

# A non-empty worker_allow is printed alone, in order, each entry once; the verify list and the
# extra commands are not read. Red when worker_allow is ignored, or when the verify list is added
# to it.
state 'verify: ["sh a.test.sh 2>&1 | tail -1"]
worker_allow: ["sh only.sh"]'
expect_list "worker_allow set" "sh only.sh"
expect_list "worker_allow set, with a command" "sh only.sh" "sh b.sh"
state 'verify: ["sh a.sh"]
worker_allow: ["python3 utils/", "sh only.sh", "python3 utils/"]'
expect_list "worker_allow with an entry twice" "python3 utils/
sh only.sh"

# A worker_allow entry is stripped of surrounding blanks, and one holding a character no rule can
# hold is refused, naming the entry. Red when the entry is printed as written, or not checked.
state 'verify: ["sh a.sh"]
worker_allow: [" sh a.sh ", "sh b.sh", "sh b.sh  "]'
expect_list "worker_allow entries with blanks" "sh a.sh
sh b.sh"
for entry in "sh 'q'" 'sh "q"' 'sh $X' 'sh `x`' 'sh a\\b' 'sh (' 'sh b.sh)' 'sh {' 'sh }' \
    'sh [a' 'sh a]' 'sh a,b' 'sh *.sh' 'sh a?'; do
    state "verify: [\"sh a.sh\"]
worker_allow: ['$(printf '%s' "$entry" | sed "s/'/''/g")']"
    want=$(python3 -c 'import sys; print(repr(sys.argv[1]))' "$entry")
    expect_refusal "worker_allow entry $entry" \
        "worker_allow holds an entry with a character no rule can hold: $want" "$state"
done

# worker_allow that is [] or empty (null) takes the default list. Red when an empty worker_allow is
# printed as the list, which is then empty.
state 'verify: ["sh a.sh"]
worker_allow: []'
expect_list "worker_allow []" "sh a.sh"
state 'verify: ["sh a.sh"]
worker_allow:'
expect_list "worker_allow empty" "sh a.sh"

# worker_allow that is not a list of non-empty one-line strings is refused, the message naming the
# key and the value. Red when the value is not checked, or an entry is not.
state 'verify: ["sh a.sh"]
worker_allow: "sh only.sh"'
expect_refusal "worker_allow a string" "worker_allow is not a list: 'sh only.sh'" "$state"
state 'verify: ["sh a.sh"]
worker_allow: [""]'
expect_refusal "worker_allow holding an empty string" \
    "worker_allow holds an entry that is not a non-empty one-line string: ''" "$state"
state 'verify: ["sh a.sh"]
worker_allow: ["   "]'
expect_refusal "worker_allow holding blanks" \
    "worker_allow holds an entry that is not a non-empty one-line string: '   '" "$state"
state 'verify: ["sh a.sh"]
worker_allow: ["a\nb"]'
expect_refusal "worker_allow holding two lines" \
    "worker_allow holds an entry that is not a non-empty one-line string: 'a\\nb'" "$state"
state 'verify: ["sh a.sh"]
worker_allow: ["sh a.sh", 3]'
expect_refusal "worker_allow holding a number" \
    "worker_allow holds an entry that is not a non-empty one-line string: 3" "$state"

# An empty result is refused. Red when an empty list is printed with exit 0.
state 'verify: []
worker_allow: []'
expect_refusal "an empty result" "the allow list is empty" "$state"
state 'rules: docs/dev/change-standard.md'
expect_refusal "no verify list and no command" "the allow list is empty" "$state"
state 'verify: []'
expect_refusal "a command that is only a redirection" "the allow list is empty" "$state" ">out.txt"

# A verify list or a command the script cannot read is refused.
state 'verify: sh a.sh'
expect_refusal "verify not a list" "verify is not a list: 'sh a.sh'" "$state"
state 'verify: ["sh a.sh", 3]'
expect_refusal "a verify command that is not a string" \
    "verify holds a command that is not a string: 3" \
    "$state"
state 'verify: ["sh a.sh '"'"'unclosed"]'
expect_refusal "an unclosed quote" "has a quote that is not closed: sh a.sh 'unclosed" "$state"

# The state file: missing, no yaml block, a first yaml block that is not valid YAML, not closed, or
# not a mapping. Red when any of them is read as an empty configuration.
expect_refusal "a missing state file" "cannot read $test_root/no such state.md" \
    "$test_root/no such state.md"
n=$((n + 1))
state="$test_root/case $n.md"
printf '# Orchestrator state\n\n- none.\n' >"$state"
expect_refusal "no yaml block" "has no yaml block" "$state"
state 'verify: [unclosed'
expect_refusal "a yaml block that is not valid YAML" "is not valid YAML" "$state"
n=$((n + 1))
state="$test_root/case $n.md"
printf '# Orchestrator state\n\n```yaml\nverify: ["sh a.sh"]\n' >"$state"
expect_refusal "a yaml block not closed" "is not closed" "$state"
state '- sh a.sh'
expect_refusal "a yaml block that is not a mapping" "is not a mapping" "$state"
printf '\377\376\n' >"$test_root/binary.md"
expect_refusal "a state file that is not UTF-8" "is not UTF-8" "$test_root/binary.md"

# The fence word is yaml or yml in any case. Red when yml or YAML is not a yaml block.
n=$((n + 1))
state="$test_root/case $n.md"
printf '# State\n\n```yml\nverify: ["sh yml.sh"]\n```\n' >"$state"
expect_list "a yml fence" "sh yml.sh"
n=$((n + 1))
state="$test_root/case $n.md"
printf '# State\n\n```YAML\nverify: ["sh upper.sh"]\n```\n' >"$state"
expect_list "a YAML fence" "sh upper.sh"

# Only the first yaml block is read: a verify list in the second one is not. Red when a later block
# is read.
n=$((n + 1))
state="$test_root/case $n.md"
printf '# State\n\n```yaml\nrules: x\n```\n\n```yaml\nverify: ["sh late.sh"]\n```\n' >"$state"
expect_refusal "a verify list in the second yaml block" "the allow list is empty" "$state"

# Usage errors: no argument, an empty command.
out=$(python3 "$list" 2>&1)
status=$?
[ "$status" -eq 64 ] || fail "no argument: exited $status, expected 64"
case "$out" in
    "allow_list.py: usage: allow_list.py <state file> [<command>]..."*) ;;
    *) fail "no argument: printed $out" ;;
esac
state 'verify: ["sh a.sh"]'
expect_refusal "an empty command" "a command is empty" "$state" ""

printf 'PASS: allow_list.py scratch tests\n'
