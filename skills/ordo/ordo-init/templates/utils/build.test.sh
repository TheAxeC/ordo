#!/bin/sh
# Exercise build.py, the build driver, on scratch trees that each hold a copy of the template with its mode, its lists and its root value filled.
# Each case is kept because its failure lets a gate exit 0 on a failing command, runs a command other than the one the verification page names, runs it from another folder or with other input, or leaves a file in the repository.
# build, test and check run their list in order, each command echoed, and stop at the first that fails, a failing command inside a pipe or an && chain included, with a last line that names it and its exit status.
# gate runs build, test and check in that order, stops at the first that fails, skips an empty list and fails when all three are empty; build on an empty list fails.
# No subcommand, an unknown one or an extra argument prints the usage and exits 2.
# A command keeps its quotes, its $, its backslashes and its comment as written, runs from the repository root whatever the folder before it changed to and whatever folder the driver is called from, a driver in tools/a/utils/ included, and reads no input.
# A command ended by a signal fails, ./utils/build.py runs with no python3 in front, and no run leaves a __pycache__ folder.
# Each case prints "ok: <case>: exit <status>"; the last line is "PASS: build.py scratch tests" with exit 0, or a line starting "FAIL:" with exit 1.

set -u
unset PYTHONDONTWRITEBYTECODE

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/build-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
template=$script_dir/build.py
usage='usage: build.py build|test|check|gate'

# A scratch tree $test_root/<tree> with the template copied, mode included, to <driver path> and filled with <root value>.
# The lists are read from $test_root/<tree>.build, .test and .check, one command per line, and written as the mode writes them; a file that is absent leaves its list empty.
make_tree() {
    tree=$test_root/$1
    driver=$tree/$2
    mkdir -p "$(dirname "$driver")" || fail "$1: cannot make the folder of $2"
    cp -p "$template" "$driver" || fail "$1: cannot copy the template $template"
    python3 -B - "$driver" "$3" "$test_root/$1" <<'PY' || fail "$1: cannot fill the lists of $2"
import re
import sys


def quote(value):
    """The string as the mode writes it: in double quotes, each backslash and double quote escaped."""
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"') + '"'


driver, root, lists = sys.argv[1], sys.argv[2], sys.argv[3]
text = open(driver, encoding="utf-8").read()
text, count = re.subn(r'^ROOT = ".*"$', lambda _: "ROOT = " + quote(root), text, flags=re.M)
if count != 1:
    sys.exit("the template has no single ROOT line")
for name, suffix in (("BUILD", "build"), ("TEST", "test"), ("CHECK", "check")):
    try:
        commands = open(f"{lists}.{suffix}", encoding="utf-8").read().splitlines()
    except FileNotFoundError:
        commands = []
    if not commands:
        continue
    body = "".join(f"    {quote(command)},\n" for command in commands)
    filled = f"{name}: list[str] = [\n{body}]"
    text, count = re.subn(rf"^{name}: list\[str\] = \[\]$", lambda _: filled, text, flags=re.M)
    if count != 1:
        sys.exit(f"the template has no single empty {name} list")
open(driver, "w", encoding="utf-8").write(text)
PY
}

# Runs the command given and checks its exit status; $output holds its standard output and error together, $last its last line.
expect() {
    label=$1
    status=$2
    shift 2
    "$@" >"$test_root/output" 2>&1 </dev/null
    actual=$?
    output=$(cat "$test_root/output")
    last=$(tail -n 1 "$test_root/output")
    [ "$actual" = "$status" ] || fail "$label: exit $actual, expected $status: [$output]"
    printf 'ok: %s: exit %s\n' "$label" "$actual"
}

# Checks that $output holds the line given, whole.
has_line() {
    printf '%s\n' "$output" | grep -Fqx -e "$2" || fail "$1: no line [$2] in [$output]"
}

# Checks that $output holds no line equal to the one given.
lacks_line() {
    if printf '%s\n' "$output" | grep -Fqx -e "$2"; then
        fail "$1: the line [$2] is in [$output]"
    fi
}

# gate with a passing command in each list: every command echoed and run in the order build, test, check, and exit 0.
printf 'echo b1\n' >"$test_root/passing.build"
printf 'echo t1\n' >"$test_root/passing.test"
printf 'echo c1\n' >"$test_root/passing.check"
make_tree passing utils/build.py ..
expect "gate, three passing lists" 0 python3 "$test_root/passing/utils/build.py" gate
wanted='$ echo b1
b1
build.py build: 1 command passed
$ echo t1
t1
build.py test: 1 command passed
$ echo c1
c1
build.py check: 1 command passed
build.py gate: 3 commands passed'
[ "$output" = "$wanted" ] || fail "gate, three passing lists: output is [$output], expected [$wanted]"

# gate whose second test command fails inside a pipe that ends in tail: the failure line last, the command's status, and no check run.
printf 'true\n' >"$test_root/piped.build"
printf 'true\nsh -c "exit 3" 2>&1 | tail -1\n' >"$test_root/piped.test"
printf 'touch check-ran\n' >"$test_root/piped.check"
make_tree piped utils/build.py ..
expect "gate, a failing test command filtered by tail" 3 python3 "$test_root/piped/utils/build.py" gate
[ "$last" = 'build.py test: failed with exit 3: sh -c "exit 3" 2>&1 | tail -1' ] ||
    fail "gate, a failing filtered command: last line is [$last]"
lacks_line "gate, a failing filtered command" '$ touch check-ran'
[ ! -e "$test_root/piped/check-ran" ] || fail "gate ran a check command after a failing test command"

# test whose first of two commands fails: exit 1 and the second not run.
printf 'false\ntouch second-ran\n' >"$test_root/first.test"
make_tree first utils/build.py ..
expect "test, the first of two commands failing" 1 python3 "$test_root/first/utils/build.py" test
[ "$last" = 'build.py test: failed with exit 1: false' ] || fail "test, the first command failing: last line is [$last]"
[ ! -e "$test_root/first/second-ran" ] || fail "test ran the command after a failing one"

# An && chain whose first part fails: exit 1 and the second part not run.
printf 'false && echo reached\n' >"$test_root/chain.build"
make_tree chain utils/build.py ..
expect "build, false && echo reached" 1 python3 "$test_root/chain/utils/build.py" build
lacks_line "build, false && echo reached" reached
[ "$last" = 'build.py build: failed with exit 1: false && echo reached' ] || fail "build, an && chain: last line is [$last]"

# A command with a trailing comment: run, the comment ignored by the shell.
printf 'echo commented # a comment the shell ignores\n' >"$test_root/comment.check"
make_tree comment utils/build.py ..
expect "check, a command with a trailing comment" 0 python3 "$test_root/comment/utils/build.py" check
has_line "check, a trailing comment" commented
[ "$last" = 'build.py check: 1 command passed' ] || fail "check, a trailing comment: last line is [$last]"

# build on an empty list: the line that no command is named for build, and exit 1.
printf 'true\n' >"$test_root/empty-build.test"
printf 'true\n' >"$test_root/empty-build.check"
make_tree empty-build utils/build.py ..
expect "build on an empty list" 1 python3 "$test_root/empty-build/utils/build.py" build
[ "$output" = 'build.py build: no command is named' ] || fail "build on an empty list: output is [$output]"

# gate with build empty and test and check passing: build skipped and exit 0.
expect "gate, build empty, test and check passing" 0 python3 "$test_root/empty-build/utils/build.py" gate
has_line "gate, build empty" 'build.py build: no command is named, skipped'
[ "$last" = 'build.py gate: 2 commands passed' ] || fail "gate, build empty: last line is [$last]"

# gate on the template's own empty lists: the line that no command is named, and exit 1.
make_tree all-empty utils/build.py ..
expect "gate, all three lists empty" 1 python3 "$test_root/all-empty/utils/build.py" gate
[ "$output" = 'build.py gate: no command is named for build, test or check' ] ||
    fail "gate, all three lists empty: output is [$output]"

# No subcommand, an unknown one and an extra argument: the usage and exit 2.
expect "no subcommand" 2 python3 "$test_root/passing/utils/build.py"
[ "$output" = "$usage" ] || fail "no subcommand: output is [$output]"
expect "frobnicate" 2 python3 "$test_root/passing/utils/build.py" frobnicate
[ "$output" = "$usage" ] || fail "frobnicate: output is [$output]"
expect "gate extra" 2 python3 "$test_root/passing/utils/build.py" gate extra
[ "$output" = "$usage" ] || fail "gate extra: output is [$output]"

# A command with a pipe and a quoted argument that holds a space: run as written.
printf "printf '%%s\\\\n' 'two words' | tr a-z A-Z > piped.txt\n" >"$test_root/pipe.build"
make_tree pipe utils/build.py ..
expect "build, a pipe and a quoted argument with a space" 0 python3 "$test_root/pipe/utils/build.py" build
[ "$(cat "$test_root/pipe/piped.txt")" = 'TWO WORDS' ] ||
    fail "a pipe and a quoted argument: piped.txt holds [$(cat "$test_root/pipe/piped.txt")]"

# A command whose single-quoted argument holds ', ", $ and the backslash sequences \0 and \x20, printed to a file: the file holds those characters as written.
cat >"$test_root/special.build" <<'EOF'
printf '%s' 'q'\''d"s$v\0\x20' > special.txt
EOF
cat >"$test_root/special.wanted" <<'EOF'
q'd"s$v\0\x20
EOF
make_tree special utils/build.py ..
expect "build, quotes, a dollar and backslashes" 0 python3 "$test_root/special/utils/build.py" build
printf '\n' >>"$test_root/special/special.txt"
cmp -s "$test_root/special.wanted" "$test_root/special/special.txt" ||
    fail "quotes and backslashes: special.txt holds [$(cat "$test_root/special/special.txt")], expected [$(cat "$test_root/special.wanted")]"

# A command that changes folder: the next command still runs from the repository root.
printf 'mkdir -p sub && cd sub\npwd -P > where.txt\n' >"$test_root/cd.test"
make_tree cd utils/build.py ..
expect "test, a command that changes folder" 0 python3 "$test_root/cd/utils/build.py" test
[ "$(cat "$test_root/cd/where.txt")" = "$test_root/cd" ] ||
    fail "a command that changes folder: the next ran in [$(cat "$test_root/cd/where.txt")]"

# The driver called by its path from another folder: the commands run from the repository root.
printf 'pwd -P > where.txt\n' >"$test_root/elsewhere.build"
make_tree elsewhere utils/build.py ..
mkdir -p "$test_root/other"
expect "build, called from another folder" 0 sh -c 'cd "$1" && python3 "$2" build' sh "$test_root/other" "$test_root/elsewhere/utils/build.py"
[ "$(cat "$test_root/elsewhere/where.txt")" = "$test_root/elsewhere" ] ||
    fail "called from another folder: the command ran in [$(cat "$test_root/elsewhere/where.txt")]"
[ ! -e "$test_root/other/where.txt" ] || fail "called from another folder: the command ran in that folder"

# A driver in tools/a/utils/ with its root value filled for that place: the commands run from the tree's root.
printf 'pwd -P > where.txt\n' >"$test_root/project.build"
make_tree project tools/a/utils/build.py ../../..
expect "build, a driver in tools/a/utils/" 0 python3 "$test_root/project/tools/a/utils/build.py" build
[ "$(cat "$test_root/project/where.txt")" = "$test_root/project" ] ||
    fail "a driver in tools/a/utils/: where.txt is missing or wrong"

# A command that reads standard input: it ends at once with no input, whatever input the driver was given.
printf 'cat\n' >"$test_root/stdin.check"
make_tree stdin utils/build.py ..
expect "check, a command that reads standard input" 0 sh -c 'printf "leaked\n" | python3 "$1" check' sh "$test_root/stdin/utils/build.py"
lacks_line "a command that reads standard input" leaked

# A command ended by a signal: a failure, with 128 plus the signal's number as its status.
printf '(kill -TERM $$)\n' >"$test_root/signal.test"
make_tree signal utils/build.py ..
expect "test, a command ended by a signal" 1 python3 "$test_root/signal/utils/build.py" test
[ "$last" = 'build.py test: failed with exit 143: (kill -TERM $$)' ] || fail "a command ended by a signal: last line is [$last]"

# The copy called by its path with no python3 in front: it runs.
expect "./utils/build.py gate" 0 sh -c 'cd "$1" && ./utils/build.py gate' sh "$test_root/passing"
[ "$last" = 'build.py gate: 3 commands passed' ] || fail "./utils/build.py gate: last line is [$last]"

# After every run: no __pycache__ folder in the scratch trees.
found=$(find "$test_root" -name __pycache__)
[ -z "$found" ] || fail "a run left a bytecode folder: [$found]"
printf 'ok: no __pycache__ folder after the runs\n'

printf 'PASS: build.py scratch tests\n'
