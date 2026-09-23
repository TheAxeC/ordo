#!/bin/sh
# Start a builder as a detached process of its own, by the claude -p or codex exec recipe of
# plan-orchestration, and return at once with the detached process's pid in the pid file.
#
# The claude and codex modes check their options and start this script again under nohup in the
# matching internal mode (_body_claude, _body_codex), which runs in that detached process: the
# launch note's start, the builder, the note's end, then the exit file. With no launch-note command,
# or an empty one, the detached process runs the recipe's command alone. With --resume, the builder
# continues the session of that id, as a repair round does, and a note records the run as a new
# record under the same label. The launch removes an exit file left by an earlier run before it
# detaches, so a monitor never reads a stale one. The transcript mode passes a transcript or rollout
# path to the note. The note command's interface is in launch-note.md beside this script; every
# call to it is a record only, so its failure never stops the builder or this script.

set -u

self=$0

usage() {
    printf 'Usage: %s claude --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file> --exit <file> --pid <file> [--resume <session id>] [--note <command> --id <file> --label <step> --parent <session id>]\n' "$self" >&2
    printf '       %s codex --cwd <dir> --model <model> --prompt <file> --report <file> --stderr <file> --exit <file> --pid <file> --events <file> --effort <effort> [--network] [--resume <session id>] [--note <command> --id <file> --label <step> --parent <session id>]\n' "$self" >&2
    printf '       %s transcript --note <command> --id <file> <path>\n' "$self" >&2
    exit 64
}

fail_usage() {
    printf '%s: %s\n' "$self" "$1" >&2
    usage
}

[ "$#" -ge 1 ] || usage
mode=$1
shift

case "$mode" in
    claude | codex | _body_claude | _body_codex | transcript) ;;
    *) fail_usage "unknown mode $mode" ;;
esac

opt_cwd='' opt_model='' opt_prompt='' opt_report='' opt_stderr='' opt_exit='' opt_pid=''
opt_events='' opt_effort='' opt_network=0
opt_note='' opt_id='' opt_label='' opt_parent='' opt_resume=''
opt_path=''

while [ "$#" -gt 0 ]; do
    case "$1" in
        --network)
            opt_network=1
            shift
            ;;
        --cwd | --model | --prompt | --report | --stderr | --exit | --pid | --events | --effort | --note | --id | --label | --parent | --resume)
            [ "$#" -ge 2 ] || fail_usage "$1 needs a value"
            name=$1
            value=$2
            shift 2
            case "$name" in
                --cwd) opt_cwd=$value ;;
                --model) opt_model=$value ;;
                --prompt) opt_prompt=$value ;;
                --report) opt_report=$value ;;
                --stderr) opt_stderr=$value ;;
                --exit) opt_exit=$value ;;
                --pid) opt_pid=$value ;;
                --events) opt_events=$value ;;
                --effort) opt_effort=$value ;;
                --note) opt_note=$value ;;
                --id) opt_id=$value ;;
                --label) opt_label=$value ;;
                --parent) opt_parent=$value ;;
                --resume)
                    case "$value" in
                        '' | -*) fail_usage "--resume needs a session id, not ${value:-an empty value}" ;;
                    esac
                    opt_resume=$value
                    ;;
            esac
            ;;
        --*)
            fail_usage "unknown option $1"
            ;;
        *)
            [ "$mode" = transcript ] || fail_usage "unexpected argument $1"
            [ -z "$opt_path" ] || fail_usage "unexpected argument $1"
            opt_path=$1
            shift
            ;;
    esac
done

# A launch-note command is an absolute path, so it resolves the same before and after the claude
# recipe changes directory.
[ -z "$opt_note" ] || case "$opt_note" in
    /*) ;;
    *) fail_usage "--note must be an absolute path" ;;
esac

# The id the note's start wrote, first line only, or a failure when there is none.
read_id() {
    [ -n "$opt_note" ] && [ -n "$opt_id" ] && [ -s "$opt_id" ] || return 1
    note_id=$(head -n 1 "$opt_id")
    [ -n "$note_id" ]
}

require_launch_options() {
    for pair in "cwd:$opt_cwd" "model:$opt_model" "prompt:$opt_prompt" "report:$opt_report" \
        "stderr:$opt_stderr" "exit:$opt_exit" "pid:$opt_pid"; do
        [ -n "${pair#*:}" ] || fail_usage "--${pair%%:*} is required"
    done
    case "$mode" in
        codex | _body_codex)
            [ -n "$opt_events" ] || fail_usage "--events is required for codex"
            [ -n "$opt_effort" ] || fail_usage "--effort is required for codex"
            ;;
        *)
            [ -z "$opt_events" ] || fail_usage "--events is for codex only"
            [ -z "$opt_effort" ] || fail_usage "--effort is for codex only"
            [ "$opt_network" -eq 0 ] || fail_usage "--network is for codex only"
            ;;
    esac
    if [ -n "$opt_note" ]; then
        [ -n "$opt_id" ] || fail_usage "--id is required with --note"
        [ -n "$opt_label" ] || fail_usage "--label is required with --note"
        [ -n "$opt_parent" ] || fail_usage "--parent is required with --note"
        case "$opt_id" in
            /*) ;;
            *) opt_id=$(pwd -P)/$opt_id ;;
        esac
    fi
}

# The claude recipe changes directory in the detached shell itself, so the exit file and the other
# relative paths resolve from the builder's working directory, as they do in the recipe.
run_claude() {
    cd "$opt_cwd" || return
    set -- -p
    [ -z "$opt_resume" ] || set -- "$@" --resume "$opt_resume"
    claude "$@" --model "$opt_model" --permission-mode acceptEdits \
        --output-format json <"$opt_prompt" >"$opt_report" 2>"$opt_stderr"
}

# codex exec resume takes no -C and no -s, so a resumed codex builder runs in --cwd with the sandbox
# set through -c; its files resolve from the caller's directory, as those of a first run do, so a
# relative report path is made absolute before it changes directory.
run_codex() {
    report=$opt_report
    if [ -n "$opt_resume" ]; then
        set -- exec resume -c 'sandbox_mode="workspace-write"'
        case "$report" in
            /*) ;;
            *) report=$(pwd -P)/$report ;;
        esac
    else
        set -- exec -C "$opt_cwd" -s workspace-write
    fi
    [ "$opt_network" -eq 0 ] || set -- "$@" -c "sandbox_workspace_write.network_access=true"
    set -- "$@" -c "model_reasoning_effort=\"$opt_effort\"" -m "$opt_model" -o "$report" --json
    if [ -n "$opt_resume" ]; then
        (cd "$opt_cwd" && exec codex "$@" "$opt_resume" -) <"$opt_prompt" >"$opt_events" 2>"$opt_stderr"
    else
        codex "$@" - <"$opt_prompt" >"$opt_events" 2>"$opt_stderr"
    fi
}

run_body() {
    harness=$1
    if [ -n "$opt_note" ]; then
        "$opt_note" start --launcher plan-orchestration --label "$opt_label" --harness "$harness" \
            --model "$opt_model" --parent "$opt_parent" --cwd "$opt_cwd" --pid "$$" >"$opt_id" 2>/dev/null ||
            : >"$opt_id"
    fi
    "run_$harness"
    status=$?
    if read_id; then
        "$opt_note" end "$note_id" >/dev/null 2>&1 || :
    fi
    echo "exit $status" >"$opt_exit"
}

case "$mode" in
    claude | codex)
        require_launch_options
        set -- "_body_$mode" --cwd "$opt_cwd" --model "$opt_model" --prompt "$opt_prompt" --report "$opt_report" \
            --stderr "$opt_stderr" --exit "$opt_exit" --pid "$opt_pid"
        [ "$mode" = claude ] || set -- "$@" --events "$opt_events" --effort "$opt_effort"
        [ "$opt_network" -eq 0 ] || set -- "$@" --network
        [ -z "$opt_resume" ] || set -- "$@" --resume "$opt_resume"
        [ -z "$opt_note" ] || set -- "$@" --note "$opt_note" --id "$opt_id" --label "$opt_label" --parent "$opt_parent"
        # The exit file resolves where the detached process writes it: from --cwd for claude.
        case "$mode:$opt_exit" in
            claude:/* | codex:*) rm -f "$opt_exit" ;;
            claude:*) rm -f "$opt_cwd/$opt_exit" ;;
        esac
        nohup sh "$self" "$@" </dev/null >/dev/null 2>&1 &
        echo $! >"$opt_pid"
        ;;
    _body_claude | _body_codex)
        require_launch_options
        run_body "${mode#_body_}"
        ;;
    transcript)
        for pair in "cwd:$opt_cwd" "model:$opt_model" "prompt:$opt_prompt" "report:$opt_report" "stderr:$opt_stderr" \
            "exit:$opt_exit" "pid:$opt_pid" "events:$opt_events" "effort:$opt_effort" "label:$opt_label" "parent:$opt_parent" \
            "resume:$opt_resume"; do
            [ -z "${pair#*:}" ] || fail_usage "--${pair%%:*} is not a transcript option"
        done
        [ "$opt_network" -eq 0 ] || fail_usage "--network is not a transcript option"
        [ -z "$opt_note" ] || [ -n "$opt_id" ] || fail_usage "--id is required with --note"
        [ -n "$opt_path" ] || fail_usage "the transcript path is required"
        if read_id; then
            "$opt_note" transcript "$note_id" "$opt_path" >/dev/null 2>&1 || :
        fi
        ;;
esac
