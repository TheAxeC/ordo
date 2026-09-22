#!/bin/sh
# Exercise check_config.py on scratch repositories: a complete configuration passes, and each kind of
# error it exists to catch fails with the line that names it.

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
expect_error bad-harness "worker is not harness:model"

make_repo bad-type
sed -i.bak 's/^repair_rounds: 1 /repair_rounds: one /' "$test_root/bad-type/.agents/plan.yaml"
expect_error bad-type "repair_rounds is a str, its default is a int"

make_repo projects
mkdir -p "$test_root/projects/tools/tool-a/docs" "$test_root/projects/tools/tool-b/docs"
for tool in tool-a tool-b; do
    : >"$test_root/projects/tools/$tool/ROADMAP.md"
    : >"$test_root/projects/tools/$tool/docs/building.md"
    : >"$test_root/projects/tools/$tool/docs/change-standard.md"
done
cp "$script_dir/../../plan/templates/plan.projects.yaml" "$test_root/projects/.agents/plan.yaml"
expect_pass projects
sed -i.bak '/^    worker: /d' "$test_root/projects/.agents/plan.yaml"
expect_error projects "tool-a: required key missing: worker"

printf 'PASS: check_config.py scratch tests\n'
