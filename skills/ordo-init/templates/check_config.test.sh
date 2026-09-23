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

# A launch-note command: an absolute path to an executable file passes; a relative path (a path
# starting with ~ and a blank value among them), a missing file, a file that is not executable and a
# directory are errors, in the one-project form and, with the project's name before them, in the
# projects form.
set_note() {
    sed -i.bak "s|^launch_note: \"\"|launch_note: \"$2\"|" "$test_root/$1/.agents/plan.yaml"
}
make_repo note-ok
printf '#!/bin/sh\n' >"$test_root/note-ok/recorder"
chmod +x "$test_root/note-ok/recorder"
set_note note-ok "$test_root/note-ok/recorder"
expect_pass note-ok
grep -q "^launch_note: \"$test_root/note-ok/recorder\"" "$test_root/note-ok/.agents/plan.yaml" || fail "note-ok: the key was not set"

make_repo note-relative
set_note note-relative "tools/recorder"
expect_error note-relative "launch_note is not an absolute path: 'tools/recorder'"

make_repo note-missing
set_note note-missing "$test_root/note-missing/recorder"
expect_error note-missing "launch_note names a file that does not exist: '$test_root/note-missing/recorder'"

make_repo note-not-executable
: >"$test_root/note-not-executable/recorder"
set_note note-not-executable "$test_root/note-not-executable/recorder"
expect_error note-not-executable "launch_note names a file that is not executable: '$test_root/note-not-executable/recorder'"

make_repo note-directory
mkdir -p "$test_root/note-directory/recorder"
set_note note-directory "$test_root/note-directory/recorder"
expect_error note-directory "launch_note names a directory, not a command: '$test_root/note-directory/recorder'"

make_repo note-home
set_note note-home "~/bin/recorder"
expect_error note-home "launch_note is not an absolute path: '~/bin/recorder'"

make_repo note-blank
set_note note-blank "   "
expect_error note-blank "launch_note is not an absolute path: '   '"

make_repo projects
mkdir -p "$test_root/projects/tools/tool-a/docs" "$test_root/projects/tools/tool-b/docs"
for tool in tool-a tool-b; do
    : >"$test_root/projects/tools/$tool/ROADMAP.md"
    : >"$test_root/projects/tools/$tool/docs/building.md"
    : >"$test_root/projects/tools/$tool/docs/change-standard.md"
done
cp "$script_dir/../../plan/templates/plan.projects.yaml" "$test_root/projects/.agents/plan.yaml"
expect_pass projects
python3 -c 'import sys; p = sys.argv[1]; t = open(p).read(); open(p, "w").write(t.replace("    launch_note: \"\"", "    launch_note: \"rel/recorder\"", 1))' "$test_root/projects/.agents/plan.yaml"
expect_error projects "tool-a: launch_note is not an absolute path: 'rel/recorder'"
set_project_note() {
    cp "$script_dir/../../plan/templates/plan.projects.yaml" "$test_root/projects/.agents/plan.yaml"
    python3 -c 'import sys; p = sys.argv[1]; t = open(p).read(); open(p, "w").write(t.replace("    launch_note: \"\"", "    launch_note: \"" + sys.argv[2] + "\"", 1))' "$test_root/projects/.agents/plan.yaml" "$1"
}
mkdir -p "$test_root/projects/recorder-dir"
: >"$test_root/projects/recorder-plain"
set_project_note "$test_root/projects/recorder-dir"
expect_error projects "tool-a: launch_note names a directory, not a command: '$test_root/projects/recorder-dir'"
set_project_note "$test_root/projects/recorder-missing"
expect_error projects "tool-a: launch_note names a file that does not exist: '$test_root/projects/recorder-missing'"
set_project_note "$test_root/projects/recorder-plain"
expect_error projects "tool-a: launch_note names a file that is not executable: '$test_root/projects/recorder-plain'"
cp "$script_dir/../../plan/templates/plan.projects.yaml" "$test_root/projects/.agents/plan.yaml"
sed -i.bak '/^    worker: /d' "$test_root/projects/.agents/plan.yaml"
expect_error projects "tool-a: required key missing: worker"

printf 'PASS: check_config.py scratch tests\n'
