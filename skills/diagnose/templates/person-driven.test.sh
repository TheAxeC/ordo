#!/bin/sh
# Exercises person-driven.sh on scratch files, one function per case, run from a scratch folder
# under $TMPDIR. With no argument every case runs in order; with arguments (c1 c7) only those run.
# The standard input of every run is a file, a here-document or /dev/null, never a terminal. The
# cases prove:
#   c1   three actions and three observations give the six lines of the file in order, and the
#        output in full, under sh and under dash when it is installed;
#   c2   blank lines and lines of only spaces or tabs are no action;
#   c3   a %s, a backslash, $HOME, a backquote, a * and end spaces are written byte for byte and
#        nothing runs;
#   c4   a path with a space works for both files;
#   c5   input that ends after the first of three observations leaves the first pair;
#   c6   input that ends before the first observation leaves no file;
#   c7   an empty or blank observation is asked for again;
#   c8   a last observation with no newline is kept;
#   c9   an observations path that is a file, a folder or a dangling link is refused untouched;
#   c10  an actions file that is missing, a folder or unreadable is refused;
#   c11  an actions file with no action is refused;
#   c12  an observations file in a missing folder is refused before any action is shown;
#   c13  an append that fails ends the run at once;
#   c14  an actions file whose last line has no newline keeps that action;
#   c15  relative paths are taken from the folder the script is started in;
#   c16  paths that start with a dash are file names;
#   c17  an empty path for either file is refused and creates nothing;
#   c18  a folder that is not writable is refused before any action is shown;
#   c19  a standard output that cannot be written ends the run with no pair, closed or a pipe whose
#        reader has exited;
#   c20  a TERM while the script waits for an observation leaves the earlier pairs whole.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/person-driven-test.XXXXXX") || fail "could not create scratch directory"
trap 'chmod -R u+rwx "$test_root" 2>/dev/null; rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) || fail "could not resolve the folder of $0"
script=$script_dir/person-driven.sh
notes=
tab=$(printf '\t')

# Starts the scratch folder of the case $1 and sets work to it.
new_case() {
    work=$test_root/$1
    mkdir "$work" || fail "could not create $work"
}

# Runs the script under the shell $1 with the other arguments, its standard input the file $stdin;
# sets status, and writes the output files out and err in the case folder.
run_with() {
    shell=$1
    shift
    "$shell" "$script" "$@" <"$stdin" >"$work/out" 2>"$work/err"
    status=$?
}

run() {
    run_with sh "$@"
}

show() {
    printf '%s\n--- standard output\n' "$1" >&2
    cat "$work/out" >&2
    printf -- '--- standard error\n' >&2
    cat "$work/err" >&2
    fail "$1"
}

assert_status() {
    [ "$status" -eq "$1" ] || show "$2: exit status $status, expected $1"
}

# Fails unless the file $1 holds exactly the text of the printf format $2; $3 names the check.
assert_text() {
    printf "$2" >"$work/want" || fail "could not write the expected text"
    cmp -s "$1" "$work/want" || {
        diff "$work/want" "$1" >&2
        show "$3: the text differs from the expected one"
    }
}

# Fails unless the file $1 holds the line $2 whole.
assert_line() {
    grep -F -x -e "$2" "$1" >/dev/null || show "$3: missing the line [$2]"
}

# Fails unless the file $1 holds the text $2 somewhere.
assert_contains() {
    grep -F -e "$2" "$1" >/dev/null || show "$3: missing [$2]"
}

assert_absent() {
    [ ! -e "$1" ] && [ ! -L "$1" ] || show "$2: $1 exists"
}

c1() {
    new_case c1
    printf 'open the file\nclick Save\nread the title\n' >"$work/actions.txt"
    printf 'one\ntwo\nthree\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c1"
    assert_text "$work/obs.txt" 'Action 1: open the file\nObserved: one\nAction 2: click Save\nObserved: two\nAction 3: read the title\nObserved: three\n' "c1 observations file"
    prompt='What did you observe? (one line) '
    assert_text "$work/out" "Action 1 of 3: open the file\n${prompt}Action 2 of 3: click Save\n${prompt}Action 3 of 3: read the title\n${prompt}\nperson-driven: wrote 3 of 3 actions, each with its observation, to the observations file $work/obs.txt\n" "c1 standard output"
    if command -v dash >/dev/null 2>&1; then
        run_with dash "$work/actions.txt" "$work/obs-dash.txt"
        assert_status 0 "c1 under dash"
        assert_text "$work/obs-dash.txt" 'Action 1: open the file\nObserved: one\nAction 2: click Save\nObserved: two\nAction 3: read the title\nObserved: three\n' "c1 under dash"
        assert_text "$work/out" "Action 1 of 3: open the file\n${prompt}Action 2 of 3: click Save\n${prompt}Action 3 of 3: read the title\n${prompt}\nperson-driven: wrote 3 of 3 actions, each with its observation, to the observations file $work/obs-dash.txt\n" "c1 standard output under dash"
    else
        notes="$notes${notes:+ }c1 under dash skipped: dash is not installed."
    fi
}

c2() {
    new_case c2
    printf 'first\n\n  \n%s \nsecond\n \n' "$tab" >"$work/actions.txt"
    printf 'a\nb\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c2"
    assert_text "$work/obs.txt" 'Action 1: first\nObserved: a\nAction 2: second\nObserved: b\n' "c2 observations file"
    assert_contains "$work/out" "Action 2 of 2: second" "c2"
}

c3() {
    new_case c3
    text=' 50%s \ $HOME `touch '"$work"'/ran` * '
    printf '%s\n' "$text" >"$work/actions.txt"
    printf '%s\n' "$text" >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c3"
    printf 'Action 1: %s\nObserved: %s\n' "$text" "$text" >"$work/want-obs"
    cmp -s "$work/obs.txt" "$work/want-obs" || show "c3: the observations file is not the text byte for byte"
    sed -n 1p "$work/out" >"$work/first-line"
    printf 'Action 1 of 1: %s\n' "$text" >"$work/want-line"
    cmp -s "$work/first-line" "$work/want-line" || show "c3: the action is not on standard output byte for byte"
    assert_absent "$work/ran" "c3: the backquote ran"
}

c4() {
    new_case c4
    mkdir "$work/my dir"
    printf 'act\n' >"$work/my dir/my actions.txt"
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/my dir/my actions.txt" "$work/my dir/my obs.txt"
    assert_status 0 "c4"
    assert_text "$work/my dir/my obs.txt" 'Action 1: act\nObserved: seen\n' "c4"
}

c5() {
    new_case c5
    printf 'a1\na2\na3\n' >"$work/actions.txt"
    printf 'only\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 1 "c5"
    assert_line "$work/err" "person-driven: the input ended after observation 1 of 3" "c5"
    assert_text "$work/obs.txt" 'Action 1: a1\nObserved: only\n' "c5"
}

c6() {
    new_case c6
    printf 'a1\n' >"$work/actions.txt"
    stdin=/dev/null
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 1 "c6"
    assert_line "$work/err" "person-driven: the input ended after observation 0 of 1" "c6"
    assert_absent "$work/obs.txt" "c6"
}

c7() {
    new_case c7
    printf 'a1\n' >"$work/actions.txt"
    printf '\n \t \nreal\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c7"
    [ "$(grep -c -x -F 'person-driven: type what you observed' "$work/err")" -eq 2 ] || show "c7: the request to type an observation is not printed twice"
    assert_text "$work/obs.txt" 'Action 1: a1\nObserved: real\n' "c7"
}

c8() {
    new_case c8
    printf 'a1\n' >"$work/actions.txt"
    printf 'last' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c8"
    assert_text "$work/obs.txt" 'Action 1: a1\nObserved: last\n' "c8"
}

c9() {
    new_case c9
    printf 'a1\n' >"$work/actions.txt"
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    printf 'earlier run\n' >"$work/file.txt"
    cp "$work/file.txt" "$work/file.copy"
    mkdir "$work/folder"
    ln -s "$work/target-missing" "$work/link.txt"
    for kind in file.txt folder link.txt; do
        run "$work/actions.txt" "$work/$kind"
        assert_status 64 "c9 $kind"
        assert_line "$work/err" "person-driven: the observations file $work/$kind exists; name a new file" "c9 $kind"
    done
    cmp -s "$work/file.txt" "$work/file.copy" || show "c9: the existing file was changed"
    assert_absent "$work/target-missing" "c9: the link's target was created"
}

c10() {
    new_case c10
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    mkdir "$work/folder"
    printf 'a1\n' >"$work/locked.txt"
    unreadable=
    if [ "$(id -u)" -eq 0 ]; then
        notes="$notes${notes:+ }c10 unreadable file skipped: the test runs as root."
    else
        chmod 000 "$work/locked.txt"
        unreadable=locked.txt
    fi
    for kind in missing.txt folder $unreadable; do
        run "$work/$kind" "$work/obs-$kind"
        assert_status 64 "c10 $kind"
        assert_line "$work/err" "person-driven: cannot read the actions file $work/$kind" "c10 $kind"
        assert_absent "$work/obs-$kind" "c10 $kind"
    done
}

c11() {
    new_case c11
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    : >"$work/empty.txt"
    printf '\n \n%s\n' "$tab" >"$work/blank.txt"
    for kind in empty.txt blank.txt; do
        run "$work/$kind" "$work/obs-$kind"
        assert_status 64 "c11 $kind"
        assert_line "$work/err" "person-driven: the actions file $work/$kind holds no action" "c11 $kind"
        assert_absent "$work/obs-$kind" "c11 $kind"
    done
}

c12() {
    new_case c12
    printf 'a1\n' >"$work/actions.txt"
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/nodir/obs.txt"
    assert_status 64 "c12"
    assert_line "$work/err" "person-driven: cannot write the observations file $work/nodir/obs.txt" "c12"
    [ ! -s "$work/out" ] || show "c12: standard output is not empty"
}

c13() {
    new_case c13
    printf 'a1\na2\n' >"$work/actions.txt"
    printf 'seen\nseen\n' >"$work/in.txt"
    stdin=$work/in.txt
    long=$(printf '%0300d' 0)
    run "$work/actions.txt" "$work/$long"
    assert_status 1 "c13"
    assert_line "$work/err" "person-driven: cannot write the observations file $work/$long" "c13"
    assert_line "$work/out" "Action 1 of 2: a1" "c13 first action shown"
    ! grep -F 'Action 2' "$work/out" >/dev/null || show "c13: the second action was shown"
}

c14() {
    new_case c14
    printf 'one\ntwo' >"$work/actions.txt"
    printf 'a\nb\n' >"$work/in.txt"
    stdin=$work/in.txt
    run "$work/actions.txt" "$work/obs.txt"
    assert_status 0 "c14"
    assert_text "$work/obs.txt" 'Action 1: one\nObserved: a\nAction 2: two\nObserved: b\n' "c14"
    assert_contains "$work/out" "Action 2 of 2: two" "c14"
}

c15() {
    new_case c15
    printf 'one\n' >"$work/actions.txt"
    printf 'a\n' >"$work/in.txt"
    stdin=$work/in.txt
    (cd "$work" && sh "$script" actions.txt obs.txt <"$stdin" >"$work/out" 2>"$work/err")
    status=$?
    assert_status 0 "c15"
    assert_text "$work/obs.txt" 'Action 1: one\nObserved: a\n' "c15"
}

c16() {
    new_case c16
    printf 'one\n' >"$work/-a.txt"
    printf 'a\n' >"$work/in.txt"
    stdin=$work/in.txt
    (cd "$work" && sh "$script" -a.txt -obs.txt <"$stdin" >"$work/out" 2>"$work/err")
    status=$?
    assert_status 0 "c16"
    assert_text "$work/-obs.txt" 'Action 1: one\nObserved: a\n' "c16"
}

c17() {
    new_case c17
    printf 'one\n' >"$work/actions.txt"
    printf 'a\n' >"$work/in.txt"
    stdin=$work/in.txt
    (cd "$work" && sh "$script" "" obs.txt <"$stdin" >"$work/out" 2>"$work/err")
    status=$?
    assert_status 64 "c17 empty actions path"
    assert_text "$work/err" 'person-driven: cannot read the actions file \n' "c17 empty actions path"
    (cd "$work" && sh "$script" actions.txt "" <"$stdin" >"$work/out" 2>"$work/err")
    status=$?
    assert_status 64 "c17 empty observations path"
    assert_text "$work/err" 'person-driven: cannot write the observations file \n' "c17 empty observations path"
    assert_absent "$work/obs.txt" "c17"
    [ ! -s "$work/out" ] || show "c17: standard output is not empty"
    ls "$work" >"$work/listing"
    assert_text "$work/listing" 'actions.txt\nerr\nin.txt\nlisting\nout\nwant\n' "c17 nothing was created"
}

c18() {
    new_case c18
    printf 'a1\n' >"$work/actions.txt"
    printf 'seen\n' >"$work/in.txt"
    stdin=$work/in.txt
    mkdir "$work/locked"
    if [ "$(id -u)" -eq 0 ]; then
        notes="$notes${notes:+ }c18 skipped: the test runs as root."
        return
    fi
    chmod 555 "$work/locked"
    run "$work/actions.txt" "$work/locked/obs.txt"
    assert_status 64 "c18"
    assert_line "$work/err" "person-driven: cannot write the observations file $work/locked/obs.txt" "c18"
    [ ! -s "$work/out" ] || show "c18: standard output is not empty"
}

c19() {
    new_case c19
    printf 'a1\na2\n' >"$work/actions.txt"
    printf 'seen\nseen\n' >"$work/in.txt"
    exec 5>"$work/err"
    sh "$script" "$work/actions.txt" "$work/obs.txt" <"$work/in.txt" >&- 2>&5
    status=$?
    exec 5>&-
    stdin=/dev/null
    assert_status 1 "c19 closed"
    assert_contains "$work/err" "person-driven: cannot write to standard output" "c19 closed"
    assert_absent "$work/obs.txt" "c19 closed"
    { sleep 1; sh "$script" "$work/actions.txt" "$work/obs-pipe.txt" <"$work/in.txt" 2>"$work/err-pipe"; echo $? >"$work/status-pipe"; } | true
    [ "$(cat "$work/status-pipe")" -eq 1 ] || show "c19 pipe: exit status $(cat "$work/status-pipe"), expected 1"
    assert_contains "$work/err-pipe" "person-driven: cannot write to standard output" "c19 pipe"
    assert_absent "$work/obs-pipe.txt" "c19 pipe"
}

c20() {
    new_case c20
    printf 'a1\na2\na3\n' >"$work/actions.txt"
    mkfifo "$work/fifo" || fail "could not make a fifo"
    sh "$script" "$work/actions.txt" "$work/obs.txt" <"$work/fifo" >"$work/out" 2>"$work/err" &
    pid=$!
    exec 4>"$work/fifo"
    printf 'first\n' >&4
    tries=0
    until grep -F 'Action 2 of 3' "$work/out" >/dev/null 2>&1; do
        tries=$((tries + 1))
        [ "$tries" -lt 100 ] || { kill -KILL "$pid" 2>/dev/null; exec 4>&-; fail "c20: the second action was never shown"; }
        sleep 0.1
    done
    kill -TERM "$pid"
    wait "$pid"
    status=$?
    exec 4>&-
    stdin=/dev/null
    assert_status 143 "c20"
    assert_text "$work/obs.txt" 'Action 1: a1\nObserved: first\n' "c20"
}

if [ "$#" -eq 0 ]; then
    set -- c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20
fi
for name in "$@"; do
    "$name"
done

[ -z "$notes" ] || printf 'note: %s\n' "$notes"
printf 'PASS: person-driven.sh scratch tests\n'
