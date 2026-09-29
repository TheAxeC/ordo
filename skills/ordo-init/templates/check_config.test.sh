#!/bin/sh
# Exercise check_config.py on scratch repositories, each case one configuration it must refuse or pass.
# A configuration is refused, with the line that names its error, when it misses a required key (reviewer; worker in the projects: form, named with its project), holds an unknown key, names a page that does not exist, leaves the worktree root not ignored, has .agents/plan.yaml ignored by git, sets worker to a model with no harness or to a harness other than claude, gives repair_rounds a value of the wrong kind, or sets libraries to a value other than check or avoid (a word, a boolean, or nothing).
# The example configuration of each form passes, as does .agents/* with !.agents/plan.yaml after it, and libraries: avoid.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-config-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_config.py

# A repository whose configuration is the one-project example, with its pages present and its worktree root ignored.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo/.agents" "$repo/docs/dev"
    git -C "$repo" init -q
    cp "$script_dir/../../plan/templates/plan.yaml" "$repo/.agents/plan.yaml"
    : >"$repo/docs/roadmap.md"
    : >"$repo/docs/dev/building.md"
    : >"$repo/docs/dev/change-standard.md"
    printf '/.agents/worktrees/\n' >"$repo/.gitignore"
}

expect_pass() {
    output=$(python3 "$check" "$test_root/$1") || fail "$1: expected a pass, got: $output"
}

expect_error() {
    if output=$(python3 "$check" "$test_root/$1"); then
        fail "$1: expected an error, got a pass: $output"
    fi
    case "$output" in
        *"error: $2"*) ;;
        *) fail "$1: missing [error: $2] in: $output" ;;
    esac
}

make_repo complete
expect_pass complete

make_repo missing-key
sed -i.bak '/^reviewer:/d' "$test_root/missing-key/.agents/plan.yaml"
expect_error missing-key "required key missing: reviewer"

make_repo unknown-key
printf 'reviewers: claude:opus\n' >>"$test_root/unknown-key/.agents/plan.yaml"
expect_error unknown-key "unknown key: reviewers"

make_repo missing-page
rm "$test_root/missing-page/docs/dev/building.md"
expect_error missing-page "verification names a file that does not exist: docs/dev/building.md"

make_repo not-ignored
: >"$test_root/not-ignored/.gitignore"
expect_error not-ignored "worktree_root is not ignored by git: .agents/worktrees"

make_repo config-ignored
printf '.agents/\n' >"$test_root/config-ignored/.gitignore"
expect_error config-ignored ".agents/plan.yaml is ignored by git"

make_repo agents-star
printf '.agents/*\n!.agents/plan.yaml\n' >"$test_root/agents-star/.gitignore"
expect_pass agents-star

make_repo bad-harness
sed -i.bak 's/^worker: claude:opus/worker: opus/' "$test_root/bad-harness/.agents/plan.yaml"
expect_error bad-harness "worker is not claude:<model>: 'opus'"

make_repo bad-type
sed -i.bak 's/^repair_rounds: 1 /repair_rounds: one /' "$test_root/bad-type/.agents/plan.yaml"
expect_error bad-type "repair_rounds is a str, its default is a int"

# A worker on any harness but claude is refused. Red when the check accepts codex:<model>.
make_repo codex-worker
sed -i.bak 's/^worker: claude:opus/worker: codex:gpt-5.6-sol/' "$test_root/codex-worker/.agents/plan.yaml"
expect_error codex-worker "worker is not claude:<model>: 'codex:gpt-5.6-sol'"

# A repository whose configuration is the several-projects example, with each project's pages present.
make_projects_repo() {
    make_repo "$1"
    for tool in tool-a tool-b; do
        mkdir -p "$repo/tools/$tool/docs"
        : >"$repo/tools/$tool/ROADMAP.md"
        : >"$repo/tools/$tool/docs/building.md"
        : >"$repo/tools/$tool/docs/change-standard.md"
    done
    cp "$script_dir/../../plan/templates/plan.projects.yaml" "$repo/.agents/plan.yaml"
}

make_projects_repo projects
expect_pass projects
sed -i.bak '/^    worker: /d' "$test_root/projects/.agents/plan.yaml"
expect_error projects "tool-a: required key missing: worker"

# libraries takes check or avoid, and any other value is refused with the value. Red when check_config.py drops the libraries value check, or skips a value that is not a string.
for case in "maybe:maybe:'maybe'" "boolean:yes:True"; do
    name=libraries-${case%%:*}
    value=${case#*:}
    shown=${value#*:}
    value=${value%%:*}
    make_repo "$name"
    sed -i.bak '/^libraries:/d' "$test_root/$name/.agents/plan.yaml"
    printf 'libraries: %s\n' "$value" >>"$test_root/$name/.agents/plan.yaml"
    expect_error "$name" "libraries is neither check nor avoid: $shown"
done

# An empty libraries value is refused, not taken as missing or as a pass. Red when the value check skips a value of None, as the review check does.
make_repo libraries-empty
sed -i.bak '/^libraries:/d' "$test_root/libraries-empty/.agents/plan.yaml"
printf 'libraries:\n' >>"$test_root/libraries-empty/.agents/plan.yaml"
expect_error libraries-empty "libraries is neither check nor avoid: None"

# avoid passes; check passes in the complete configuration. Red when the value check refuses avoid.
make_repo libraries-avoid
sed -i.bak '/^libraries:/d' "$test_root/libraries-avoid/.agents/plan.yaml"
printf 'libraries: avoid\n' >>"$test_root/libraries-avoid/.agents/plan.yaml"
expect_pass libraries-avoid

printf 'PASS: check_config.py scratch tests\n'
