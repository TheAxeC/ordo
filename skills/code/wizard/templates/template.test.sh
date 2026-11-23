#!/bin/sh
# Exercise the helpers of template.sh that run commands: run_cmd, have and WIZARD_OS. Each scratch script is the template's own lines above "run_wizard() {" followed by stages this test writes, run with bash and its answers on standard input.
# Each case is kept because its failure changes a person's machine in a way the person did not choose.
# A yes: run_cmd prints the command on a line of its own before its question, runs it and the script exits 0. A failure leaves a confirmed install not run, or asks before the person has seen the command.
# A no, and the end of input: the command does not run, the closing summary lists it under "still to do by hand:" and the script exits 0. A failure runs a command the person did not confirm, or drops it from the summary unseen.
# A failing command: the script exits with the command's status and no later stage runs. A failure goes on to stages that need what the failed command was to install.
# No command: run_cmd with no word, or with an empty first word, as an empty unquoted variable or an empty quoted one leaves it, asks nothing, runs nothing and ends the script with status 2. A failure reports a stage as done whose install never ran.
# One word stays one word: an argument holding a space and a ";" reaches the command whole and is printed as one quoted word. A failure runs a second command the person never saw as one.
# have: it succeeds for an installed tool, fails for a missing one in the condition of an if, and prints nothing. A wrong answer runs an install that was not needed, or skips one that was.
# WIZARD_OS: macos, linux, windows or unknown from the name uname prints, and unknown with no uname on PATH, the script going on. A wrong answer runs the command of another system.
# The test starts no installer, contacts no network and writes only under its scratch folder.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
template=$script_dir/template.sh
[ -f "$template" ] || fail "no template.sh beside the test"
bash_path=$(command -v bash) || fail "bash is not installed"

test_root=$(mktemp -d "${TMPDIR:-/tmp}/wizard-test.XXXXXX") ||
    fail "could not create scratch directory"
test_root=$(CDPATH= cd "$test_root" && pwd -P)
trap 'rm -rf "$test_root"' 0 1 2 3 15

# The library: every line of the template above the function that holds the stages.
library=$test_root/library.sh
sed '/^run_wizard() {/,$d' "$template" >"$library"
[ -s "$library" ] || fail "the template holds no line above run_wizard() {"

# A name no tool has, for the case of have.
missing_tool=wizard-test-no-such-tool
if command -v "$missing_tool" >/dev/null 2>&1; then
    fail "a tool named $missing_tool is installed"
fi

# build <name>: writes the scratch script <name> from the library and the stages on standard input.
build() {
    { cat "$library"; cat; } >"$test_root/$1.sh"
}

# run <name> <answers>: runs the scratch script with the answers on standard input and sets out, standard output and standard error together, and status. The stages read the scratch folder from T and the missing tool's name from MISSING_TOOL. The script runs under the PATH in script_path, which a case sets to choose the uname the script finds.
script_path=$PATH
run() {
    printf '%s' "$2" |
        PATH="$script_path" T="$test_root" MISSING_TOOL="$missing_tool" ENV_FILE="$test_root/.env" \
            "$bash_path" "$test_root/$1.sh" >"$test_root/out" 2>&1
    status=$?
    out=$(cat "$test_root/out")
}

# quoted <word>: the word as bash's printf %q writes it.
quoted() {
    "$bash_path" -c 'printf "%q" "$1"' bash "$1"
}

# expect_in <text> <expected part> <what failed>
expect_in() {
    case "$1" in
        *"$2"*) ;;
        *) fail "$3; expected \"$2\" in: $1" ;;
    esac
}

# expect_shown_before_question <text> <command line> <what failed>: the text holds the command line whole, on a line above the first question.
expect_shown_before_question() {
    shown_at=$(printf '%s\n' "$1" | grep -n -x -F -e "$2" | head -1 | cut -d: -f1)
    asked_at=$(printf '%s\n' "$1" | grep -n -F -e '[y/N]' | head -1 | cut -d: -f1)
    [ -n "$shown_at" ] || fail "$3; expected the line \"$2\" in: $1"
    [ -n "$asked_at" ] || fail "$3; no question in: $1"
    [ "$shown_at" -lt "$asked_at" ] || fail "$3; the command's line $shown_at is not above the question's line $asked_at in: $1"
}

# expect_left_by_hand <text> <command> <what failed>: the closing summary lists the command under "still to do by hand:".
expect_left_by_hand() {
    printf '%s\n' "$1" | sed -n '/still to do by hand:/,$p' | sed 1d | grep -q -F -e "$2" ||
        fail "$3; expected \"$2\" under \"still to do by hand:\" in: $1"
}

build touch-made <<'EOF'
TOTAL_STAGES=1
stage "A command"
run_cmd touch "$T/made"
finish
EOF
made_line="  touch $(quoted "$test_root/made")"

case_yes() {
    rm -f "$test_root/made"
    run touch-made 'y
'
    [ "$status" -eq 0 ] || fail "a yes: the script exited $status: $out"
    [ -f "$test_root/made" ] || fail "a yes: the command did not run: $out"
    expect_shown_before_question "$out" "$made_line" "a yes: the command is not shown before the question"
}

case_no() {
    rm -f "$test_root/made"
    run touch-made 'n
'
    [ "$status" -eq 0 ] || fail "a no: the script exited $status: $out"
    [ ! -e "$test_root/made" ] || fail "a no: the command ran: $out"
    expect_shown_before_question "$out" "$made_line" "a no: the command is not shown before the question"
    expect_left_by_hand "$out" "touch $(quoted "$test_root/made")" "a no: the declined command is not in the closing summary"
}

case_end_of_input() {
    rm -f "$test_root/made"
    run touch-made ''
    [ "$status" -eq 0 ] || fail "the end of input: the script exited $status: $out"
    [ ! -e "$test_root/made" ] || fail "the end of input: the command ran: $out"
    expect_left_by_hand "$out" "touch $(quoted "$test_root/made")" "the end of input: the command is not in the closing summary"
}

case_failing_command() {
    build failing <<'EOF'
TOTAL_STAGES=2
stage "A command that fails"
run_cmd sh -c 'exit 7'
stage "A later stage"
touch "$T/second"
finish
EOF
    run failing 'y
'
    [ "$status" -eq 7 ] || fail "a failing command: the script exited $status, not 7: $out"
    [ ! -e "$test_root/second" ] || fail "a failing command: the later stage ran: $out"
    expect_in "$out" "command failed with status 7" "a failing command: no warning with the status"
}

case_no_command() {
    build no-word <<'EOF'
TOTAL_STAGES=2
stage "No command"
empty=""
run_cmd $empty
stage "A later stage"
touch "$T/after-no-word"
finish
EOF
    build empty-word <<'EOF'
TOTAL_STAGES=2
stage "An empty first word"
empty=""
run_cmd "$empty" --flag
stage "A later stage"
touch "$T/after-empty-word"
finish
EOF
    for name in no-word empty-word; do
        run "$name" 'y
'
        [ "$status" -eq 2 ] || fail "no command: $name exited $status, not 2: $out"
        [ ! -e "$test_root/after-$name" ] || fail "no command: the later stage of $name ran: $out"
        expect_in "$out" "no command given" "no command: $name printed no warning"
        case "$out" in
            *'[y/N]'*) fail "no command: $name asked a question: $out" ;;
        esac
        case "$out" in
            *'ok ran'*) fail "no command: $name reported a command as run: $out" ;;
        esac
    done
}

case_one_word() {
    build one-word <<'EOF'
TOTAL_STAGES=1
stage "One word"
run_cmd touch "$T/a b; touch $T/c"
finish
EOF
    word="$test_root/a b; touch $test_root/c"
    # The word is one path, so the folders its slashes name are made first.
    mkdir -p "$(dirname "$word")"
    run one-word 'y
'
    [ "$status" -eq 0 ] || fail "one word stays one word: the script exited $status: $out"
    [ -f "$word" ] || fail "one word stays one word: no file has the whole name: $out"
    [ ! -e "$test_root/c" ] || fail "one word stays one word: the part after the ; ran as a second command: $out"
    expect_shown_before_question "$out" "  touch $(quoted "$word")" "one word stays one word: the argument is not shown as one quoted word"
    expect_in "$out" 'a\ b\;\ touch\ ' "one word stays one word: the space and the ; are not escaped"
}

case_have() {
    build have <<'EOF'
TOTAL_STAGES=1
stage "have"
if have sh; then printf 'branch: sh is installed\n'; fi
if ! have "$MISSING_TOOL"; then run_cmd touch "$T/have-made"; fi
{ have sh || true; have "$MISSING_TOOL" || true; } >"$T/have-out" 2>&1
finish
EOF
    run have 'y
'
    [ "$status" -eq 0 ] || fail "have: the script exited $status: $out"
    expect_in "$out" "branch: sh is installed" "have: the branch of an installed tool was not taken"
    [ -f "$test_root/have-made" ] || fail "have: run_cmd was not reached for a missing tool: $out"
    [ ! -s "$test_root/have-out" ] || fail "have: it printed: $(cat "$test_root/have-out")"
}

case_wizard_os() {
    build os <<'EOF'
TOTAL_STAGES=1
stage "The operating system"
printf 'os=%s\n' "$WIZARD_OS"
EOF
    for pair in Darwin:macos Linux:linux MINGW64_NT-10.0:windows MSYS_NT-10.0:windows CYGWIN_NT-10.0:windows FreeBSD:unknown; do
        name=${pair%%:*}
        want=${pair#*:}
        mkdir -p "$test_root/bin-$name"
        printf '#!/bin/sh\nprintf "%%s\\n" "%s"\n' "$name" >"$test_root/bin-$name/uname"
        chmod +x "$test_root/bin-$name/uname"
        script_path="$test_root/bin-$name:$PATH"
        run os ''
        [ "$status" -eq 0 ] || fail "WIZARD_OS: the script exited $status with uname printing $name: $out"
        expect_in "$out" "os=$want" "WIZARD_OS: uname printing $name does not give $want"
    done
    mkdir -p "$test_root/bin-empty"
    script_path="$test_root/bin-empty"
    run os ''
    [ "$status" -eq 0 ] || fail "WIZARD_OS: the script exited $status with no uname on PATH: $out"
    expect_in "$out" "os=unknown" "WIZARD_OS: no uname on PATH does not give unknown"
}

# Each case runs in a subshell, so a case that fails leaves the others to run, and the last line names every case that failed.
failed=""
count=0
for case_name in case_yes case_no case_end_of_input case_failing_command case_no_command case_one_word case_have case_wizard_os; do
    count=$((count + 1))
    if ( "$case_name" ); then
        printf 'ok: %s\n' "$case_name"
    else
        failed="$failed $case_name"
    fi
done

if [ -n "$failed" ]; then
    printf 'FAIL: template.sh scratch tests, of %s cases these failed:%s\n' "$count" "$failed"
    exit 1
fi
printf 'PASS: template.sh scratch tests, %s cases\n' "$count"
