#!/bin/sh
# Exercises person-driven.sh on scratch actions files, observations files and input files, never on a
# terminal. Cases C1 to C14 cover, in order: a complete run, also under dash; blank lines in the
# actions file; text that holds format characters, a backslash, shell syntax and outer spaces; paths
# with a space; input that ends after some observations and before the first; a blank observation
# asked for again; a last line with no newline in the input; an observations file that already
# exists, its path holding a space in one part; an actions file that cannot be read; an actions file
# with no action; an observations file in a missing folder, in a folder that is not writable, or
# named by an empty path; an append that fails during the run; and a last action with no newline.
#
# Input: sh <the diagnose skill's folder>/templates/person-driven.test.sh, with no argument. The
# script under test is person-driven.sh in this file's own folder, run from a scratch folder under
# $TMPDIR, which is removed at the end.
#
# Output: a failing check prints "FAIL: <case>: <reason>" on standard error and exits 1. A part that
# cannot run here (an unreadable file or a folder that is not writable as root, dash not installed)
# prints a "note:" line and is skipped. When every case passes the last line is "PASS:
# person-driven.sh scratch tests" and the exit status is 0.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/person-driven-test.XXXXXX") || fail "could not create scratch folder"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P) || fail "could not resolve the folder of $0"
script=$script_dir/person-driven.sh
out_file=$test_root/stdout
err_file=$test_root/stderr
tab=$(printf '\t')
prompt='What did you observe? (one line) '

# Makes the folder of case $1 and sets d to it.
new_case() {
    d=$test_root/$1
    mkdir "$d" || fail "$1: could not create $d"
}

# Runs person-driven.sh under the shell $1 with the actions file $2, the observations file $3 and
# standard input from the file $4, from the scratch folder; sets run_status and fills out_file and
# err_file.
run_script() {
    [ -f "$script" ] || fail "person-driven.sh does not exist at $script"
    (cd "$test_root" && "$1" "$script" "$2" "$3" <"$4" >"$out_file" 2>"$err_file")
    run_status=$?
}

show_run() {
    printf -- '--- standard output\n' >&2
    cat "$out_file" >&2
    printf -- '--- standard error\n' >&2
    cat "$err_file" >&2
}

expect_status() {
    [ "$run_status" -eq "$2" ] || {
        show_run
        fail "$1: exit status $run_status, expected $2"
    }
}

# Compares the file $2 with the text of the file $d/expected, byte for byte.
expect_same() {
    cmp -s "$2" "$d/expected" || {
        diff "$d/expected" "$2" >&2
        fail "$1: $2 differs from the expected text"
    }
}

# Expects the file $2 to hold the whole text of $3, one line.
expect_line_only() {
    printf '%s\n' "$3" >"$d/expected"
    expect_same "$1" "$2"
}

expect_absent() {
    { [ ! -e "$2" ] && [ ! -L "$2" ]; } || fail "$1: $2 exists"
}

expect_contains() {
    grep -F -q -- "$3" "$2" || {
        show_run
        fail "$1: missing [$3]"
    }
}

expect_missing() {
    if grep -F -q -- "$3" "$2"; then
        show_run
        fail "$1: found [$3]"
    fi
}

case_c1_with() {
    printf 'first\nsecond\nthird\n' >"$d/actions"
    printf 'one\ntwo\nthree\n' >"$d/in"
    run_script "$1" "$d/actions" "$d/obs" "$d/in"
    expect_status "C1 under $1" 0
    printf 'Action 1: first\nObserved: one\nAction 2: second\nObserved: two\nAction 3: third\nObserved: three\n' >"$d/expected"
    expect_same "C1 under $1" "$d/obs"
    {
        printf 'Action 1 of 3: first\n%s' "$prompt"
        printf 'Action 2 of 3: second\n%s' "$prompt"
        printf 'Action 3 of 3: third\n%s' "$prompt"
        printf '\nperson-driven: wrote 3 of 3 actions, each with its observation, to the observations file %s\n' "$d/obs"
    } >"$d/expected"
    expect_same "C1 under $1" "$out_file"
}

case_c1() {
    new_case c1
    case_c1_with sh
    if command -v dash >/dev/null 2>&1; then
        rm -f "$d/obs"
        case_c1_with dash
    else
        printf 'note: C1 under dash skipped, dash is not installed\n'
    fi
}

case_c2() {
    new_case c2
    printf '\n%s\nalpha\n%s\n%s\nbeta\n\n' '  ' "$tab$tab" " $tab " >"$d/actions"
    printf 'one\ntwo\n' >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C2 0
    expect_contains C2 "$out_file" 'Action 1 of 2: alpha'
    expect_contains C2 "$out_file" 'Action 2 of 2: beta'
    printf 'Action 1: alpha\nObserved: one\nAction 2: beta\nObserved: two\n' >"$d/expected"
    expect_same C2 "$d/obs"
}

case_c3() {
    new_case c3
    action='  100%s \n \\ $HOME `touch ran` *  '
    observed='  %d $(touch ran2) ~ \x41 \\ `id` *  '
    printf '%s\n' "$action" >"$d/actions"
    printf '%s\n' "$observed" >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C3 0
    printf 'Action 1: %s\nObserved: %s\n' "$action" "$observed" >"$d/expected"
    expect_same C3 "$d/obs"
    printf 'Action 1 of 1: %s\n%s\nperson-driven: wrote 1 of 1 actions, each with its observation, to the observations file %s\n' "$action" "$prompt" "$d/obs" >"$d/expected"
    expect_same C3 "$out_file"
    expect_absent C3 "$test_root/ran"
    expect_absent C3 "$test_root/ran2"
}

case_c4() {
    new_case c4
    mkdir "$d/with space" || fail "C4: could not create the folder with a space"
    printf 'only\n' >"$d/with space/actions file.txt"
    printf 'seen\n' >"$d/in"
    run_script sh "$d/with space/actions file.txt" "$d/with space/observations file.txt" "$d/in"
    expect_status C4 0
    printf 'Action 1: only\nObserved: seen\n' >"$d/expected"
    expect_same C4 "$d/with space/observations file.txt"
}

case_c5() {
    new_case c5
    printf 'first\nsecond\nthird\n' >"$d/actions"
    printf 'one\n' >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C5 1
    expect_line_only C5 "$err_file" 'person-driven: the input ended after observation 1 of 3'
    printf 'Action 1: first\nObserved: one\n' >"$d/expected"
    expect_same C5 "$d/obs"
}

case_c6() {
    new_case c6
    printf 'first\n' >"$d/actions"
    run_script sh "$d/actions" "$d/obs" /dev/null
    expect_status C6 1
    expect_line_only C6 "$err_file" 'person-driven: the input ended after observation 0 of 1'
    expect_absent C6 "$d/obs"
    printf 'one\n' >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status "C6, the same command run again" 0
}

case_c7() {
    new_case c7
    printf 'first\n' >"$d/actions"
    printf '\n%s\nreal\n' " $tab " >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C7 0
    printf 'person-driven: type what you observed\nperson-driven: type what you observed\n' >"$d/expected"
    expect_same C7 "$err_file"
    printf 'Action 1: first\nObserved: real\n' >"$d/expected"
    expect_same C7 "$d/obs"
}

case_c8() {
    new_case c8
    printf 'first\nsecond\n' >"$d/actions"
    printf 'one\ntwo' >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C8 0
    printf 'Action 1: first\nObserved: one\nAction 2: second\nObserved: two\n' >"$d/expected"
    expect_same C8 "$d/obs"
}

case_c9() {
    new_case c9
    printf 'first\n' >"$d/actions"
    printf 'one\n' >"$d/in"

    mkdir "$d/a folder" || fail "C9: could not create the folder with a space"
    printf 'kept\n' >"$d/a folder/an obs.txt"
    cp "$d/a folder/an obs.txt" "$d/copy" || fail "C9: could not copy the observations file"
    run_script sh "$d/actions" "$d/a folder/an obs.txt" "$d/in"
    expect_status "C9, a regular file" 64
    expect_line_only "C9, a regular file" "$err_file" "person-driven: the observations file $d/a folder/an obs.txt exists; name a new file"
    cmp -s "$d/a folder/an obs.txt" "$d/copy" || fail "C9, a regular file: its bytes changed"

    refusal="person-driven: the observations file $d/obs exists; name a new file"
    mkdir "$d/obs" || fail "C9: could not create the folder"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status "C9, a folder" 64
    expect_line_only "C9, a folder" "$err_file" "$refusal"
    [ -d "$d/obs" ] || fail "C9, a folder: the folder is gone"
    rmdir "$d/obs"

    ln -s "$d/target" "$d/obs" || fail "C9: could not create the symbolic link"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status "C9, a link without a target" 64
    expect_line_only "C9, a link without a target" "$err_file" "$refusal"
    expect_absent "C9, a link without a target" "$d/target"
}

case_c10() {
    new_case c10
    printf 'one\n' >"$d/in"

    run_script sh "$d/missing" "$d/obs" "$d/in"
    expect_status "C10, a missing file" 64
    expect_line_only "C10, a missing file" "$err_file" "person-driven: cannot read the actions file $d/missing"
    expect_absent "C10, a missing file" "$d/obs"

    mkdir "$d/folder" || fail "C10: could not create the folder"
    run_script sh "$d/folder" "$d/obs" "$d/in"
    expect_status "C10, a folder" 64
    expect_line_only "C10, a folder" "$err_file" "person-driven: cannot read the actions file $d/folder"
    expect_absent "C10, a folder" "$d/obs"

    if [ "$(id -u)" -eq 0 ]; then
        printf 'note: C10 with an unreadable file skipped, the test runs as root\n'
    else
        printf 'first\n' >"$d/unreadable"
        chmod 000 "$d/unreadable" || fail "C10: could not change the mode of the actions file"
        run_script sh "$d/unreadable" "$d/obs" "$d/in"
        expect_status "C10, an unreadable file" 64
        expect_line_only "C10, an unreadable file" "$err_file" "person-driven: cannot read the actions file $d/unreadable"
        expect_absent "C10, an unreadable file" "$d/obs"
    fi
}

case_c11() {
    new_case c11
    printf 'one\n' >"$d/in"
    : >"$d/empty"
    run_script sh "$d/empty" "$d/obs" "$d/in"
    expect_status "C11, an empty file" 64
    expect_line_only "C11, an empty file" "$err_file" "person-driven: the actions file $d/empty holds no action"
    expect_absent "C11, an empty file" "$d/obs"

    printf '\n%s\n%s\n' '  ' "$tab" >"$d/blank"
    run_script sh "$d/blank" "$d/obs" "$d/in"
    expect_status "C11, blank lines only" 64
    expect_line_only "C11, blank lines only" "$err_file" "person-driven: the actions file $d/blank holds no action"
    expect_absent "C11, blank lines only" "$d/obs"
}

case_c12() {
    new_case c12
    printf 'first\n' >"$d/actions"
    printf 'one\n' >"$d/in"
    run_script sh "$d/actions" "$d/nofolder/obs" "$d/in"
    expect_status "C12, a missing folder" 64
    expect_line_only "C12, a missing folder" "$err_file" "person-driven: cannot write the observations file $d/nofolder/obs"
    expect_missing "C12, a missing folder" "$out_file" 'Action'
    expect_absent "C12, a missing folder" "$d/nofolder"

    if [ "$(id -u)" -eq 0 ]; then
        printf 'note: C12 with a folder that is not writable skipped, the test runs as root\n'
    else
        mkdir "$d/readonly" || fail "C12: could not create the folder"
        chmod 555 "$d/readonly" || fail "C12: could not change the mode of the folder"
        run_script sh "$d/actions" "$d/readonly/obs" "$d/in"
        chmod 755 "$d/readonly" || fail "C12: could not put the mode of the folder back"
        expect_status "C12, a folder that is not writable" 64
        expect_line_only "C12, a folder that is not writable" "$err_file" "person-driven: cannot write the observations file $d/readonly/obs"
        expect_missing "C12, a folder that is not writable" "$out_file" 'Action'
        expect_absent "C12, a folder that is not writable" "$d/readonly/obs"
    fi

    run_script sh "$d/actions" "" "$d/in"
    expect_status "C12, an empty path" 64
    expect_line_only "C12, an empty path" "$err_file" "person-driven: cannot write the observations file "
    expect_missing "C12, an empty path" "$out_file" 'Action'
}

case_c13() {
    new_case c13
    printf 'first\nsecond\n' >"$d/actions"
    printf 'one\ntwo\n' >"$d/in"
    long=$(printf '%300s' '' | tr ' ' 'a')
    run_script sh "$d/actions" "$d/$long" "$d/in"
    expect_status C13 1
    expect_line_only C13 "$err_file" "person-driven: cannot write the observations file $d/$long"
    expect_contains C13 "$out_file" 'Action 1 of 2: first'
    expect_missing C13 "$out_file" 'Action 2'
}

case_c14() {
    new_case c14
    printf 'first\nlast' >"$d/actions"
    printf 'one\ntwo\n' >"$d/in"
    run_script sh "$d/actions" "$d/obs" "$d/in"
    expect_status C14 0
    expect_contains C14 "$out_file" 'Action 2 of 2: last'
    printf 'Action 1: first\nObserved: one\nAction 2: last\nObserved: two\n' >"$d/expected"
    expect_same C14 "$d/obs"
}

case_c1
case_c2
case_c3
case_c4
case_c5
case_c6
case_c7
case_c8
case_c9
case_c10
case_c11
case_c12
case_c13
case_c14

printf 'PASS: person-driven.sh scratch tests\n'
