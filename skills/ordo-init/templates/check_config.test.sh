#!/bin/sh
# Exercise check_config.py on scratch repositories, each case one configuration it must refuse or pass.
# Each case is kept because its failure accepts a wrong configuration, or refuses a right one so that a setup cannot finish.
# The example configuration of each form passes, as does .agents/* with !.agents/plan.yaml after it and a project that takes another's keys through a merge key (<<: *base) and overrides one of them.
# A configuration is refused, with the line that names its error, when it misses a required key (reviewer; worker in a project of the projects: form, named with its project), holds an unknown key, names a page that does not exist, leaves the worktree root not ignored, has .agents/plan.yaml ignored by git, writes a key twice (in a project with its name, beside a merge key and inside a merge key's mapping included), or holds a wrong value: a worker that is not claude:<model>, repair_rounds of the wrong kind, libraries, design_bar, design_references, worker_effort, self_rule, repair_reviewer and adr, which names a folder that does not exist or one outside the repository root.

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

# One-project form: write key $2 of $1's configuration with the value $3, in place of the line the example has.
set_key() {
    file=$test_root/$1/.agents/plan.yaml
    sed -i.bak "/^$2:/d" "$file"
    printf '%s: %s\n' "$2" "$3" >>"$file"
}

# Several-projects form: write key $3 of project $2 in $1's configuration with the value $4, in place of the line the project has.
set_project_key() {
    file=$test_root/$1/.agents/plan.yaml
    awk -v project="  $2:" -v key="    $3:" -v line="    $3: $4" '
        /^  [^ ]/ { in_project = ($0 == project); print; if (in_project) print line; next }
        in_project && index($0, key) == 1 { next }
        { print }' "$file" >"$file.new" && mv "$file.new" "$file"
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

# A wrong value is refused with the line that names the key and the value.
case_number=0
while IFS='|' read -r key value want; do
    case_number=$((case_number + 1))
    name=value-$case_number
    make_repo "$name"
    set_key "$name" "$key" "$value"
    expect_error "$name" "$want"
done <<'CASES'
worker|opus|worker is not claude:<model>: 'opus'
worker|codex:gpt-5.6-sol|worker is not claude:<model>: 'codex:gpt-5.6-sol'
repair_rounds|one|repair_rounds is a str, its default is a int
libraries|maybe|libraries is neither check nor avoid: 'maybe'
design_bar|best|design_bar is not industry, state-of-the-art or novel: 'best'
design_references|WCAG|design_references is not a list of text: 'WCAG'
worker_effort|huge|worker_effort is not low, medium, high, xhigh or max: 'huge'
self_rule|maybe|self_rule is neither on nor off: 'maybe'
repair_reviewer|sonnet|repair_reviewer is not claude:<model>: 'sonnet'
adr|docs/decisions|adr names a folder that does not exist: docs/decisions
adr|../elsewhere|adr is not a path under the repository root: '../elsewhere'
CASES

# A key written twice is refused with its name, whatever its position and the loader's last-value rule.
make_repo twice-effort
sed -i.bak '/^worker_effort:/d' "$test_root/twice-effort/.agents/plan.yaml"
printf 'worker_effort: low\nworker_effort: max\n' >>"$test_root/twice-effort/.agents/plan.yaml"
expect_error twice-effort "key written twice: worker_effort"

# A key written twice inside a mapping that is the value of a merge key is refused with its name.
make_repo merge-twice-inside
sed -i.bak '/^worker_effort:/d' "$test_root/merge-twice-inside/.agents/plan.yaml"
printf '<<: {worker_effort: low, worker_effort: max}\n' >>"$test_root/merge-twice-inside/.agents/plan.yaml"
expect_error merge-twice-inside "key written twice: worker_effort"

# The several-projects form: the example passes, a missing key, a wrong value and a key written twice are each named with their project.
make_projects_repo projects
expect_pass projects
sed -i.bak '/^    worker: /d' "$test_root/projects/.agents/plan.yaml"
expect_error projects "tool-a: required key missing: worker"
make_projects_repo projects-bar
set_project_key projects-bar tool-b design_bar best
expect_error projects-bar "tool-b: design_bar is not industry, state-of-the-art or novel: 'best'"
make_projects_repo projects-twice
set_project_key projects-twice tool-b worker_effort low
printf '    worker_effort: max\n' >>"$test_root/projects-twice/.agents/plan.yaml"
expect_error projects-twice "tool-b: key written twice: worker_effort"

# Several-projects form where tool-b takes tool-a's keys through a YAML merge key and overrides worker_effort: a merge key is not a key written twice, and a key written twice beside it is still refused with its project.
make_merge_repo() {
    make_projects_repo "$1"
    file=$test_root/$1/.agents/plan.yaml
    sed -e 's/^  tool-a:$/  tool-a: \&base/' -e '/^  tool-b:/,$d' "$file" >"$file.new" && mv "$file.new" "$file"
    printf '  tool-b:\n    <<: *base\n    roadmap: tools/tool-b/ROADMAP.md\n    verification: tools/tool-b/docs/building.md\n    worker_effort: max\n' >>"$file"
}
make_merge_repo merge-key
expect_pass merge-key
make_merge_repo merge-key-twice
printf '    worker_effort: low\n' >>"$test_root/merge-key-twice/.agents/plan.yaml"
expect_error merge-key-twice "tool-b: key written twice: worker_effort"

printf 'PASS: check_config.py scratch tests\n'
