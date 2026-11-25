#!/bin/sh
# Exercise check_config.py on scratch repositories, each case one configuration it must refuse or pass, or one search it must answer.
# Each case is kept because its failure accepts a wrong configuration, reads another file than the one meant, or refuses a right one so that a setup cannot finish.
# The check is run on the path of the file. The example configuration of each form passes at docs/plan.yaml, as does a file at .agents/plan.yaml under .agents/* with !.agents/plan.yaml after it, a project that takes another's keys through a merge key (<<: *base) and overrides some of them, and two projects whose ledger roots are two folders, one inside the other.
# A configuration is refused, with the line that names the file and its error, when it misses a required key (reviewer; worker in a project of the projects: form, named with its project), holds an unknown key, gives two projects of the projects: form ledger_root values that resolve to one folder (named with the folder and both projects), names a page that does not exist, leaves the worktree root not ignored, is itself ignored by git, writes a key twice (in a project with its name, beside a merge key and inside a merge key's mapping included), or holds a wrong value: a worker that is not claude:<model>, repair_rounds of the wrong kind, libraries, design_bar, design_references, worker_effort, self_rule, repair_reviewer and adr, which names a folder that does not exist or one outside the repository.
# The search: --find prints the first plan.yaml of the folder named, .scratch, docs and .agents, with one file, with two, with a folder named with a trailing slash and with a folder that holds no file; it exits 1 with the places named when there is no file, and with the folder named when the folder lies outside the repository.
# The paths: a file in apps/web reads its pages and its ledger root from apps/web, and a page that exists only at the repository root is named missing by its path from the repository root; a path that resolves outside the repository is refused with its key, and so is a ledger root that is the repository root, while ledger_root: . in .scratch/plan.yaml passes; a file with no worktree_root passes when git ignores .agents/worktrees and is refused when it does not; a file with no adr key at docs/plan.yaml is noted with the default docs/adr; a repository reached through a symbolic link prints what its real path prints.
# The arguments: no argument, a repository root in place of a file, and a file in no git repository each exit 1 with an error line.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/check-config-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
check=$script_dir/check_config.py
# The plan skill's templates: in the folder plan beside this skill's folder, or else in a group folder beside this skill's group folder.
plan_templates=$script_dir/../../plan/templates
[ -f "$plan_templates/plan.yaml" ] || for folder in "$script_dir"/../../../*/plan/templates; do
    [ -f "$folder/plan.yaml" ] && plan_templates=$folder && break
done
[ -f "$plan_templates/plan.yaml" ] || fail "no templates/plan.yaml of the plan skill beside $script_dir/../.. or in a group folder beside its group folder"

# A repository whose configuration is the one-project example at docs/plan.yaml, with its pages present and its worktree root ignored.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo/docs/dev"
    git -C "$repo" init -q
    cp "$plan_templates/plan.yaml" "$repo/docs/plan.yaml"
    : >"$repo/docs/roadmap.md"
    : >"$repo/docs/dev/building.md"
    : >"$repo/docs/dev/change-standard.md"
    printf '/.agents/worktrees/\n' >"$repo/.gitignore"
}

# A repository whose configuration is the several-projects example at docs/plan.yaml, with each project's pages present.
make_projects_repo() {
    make_repo "$1"
    for tool in tool-a tool-b; do
        mkdir -p "$repo/tools/$tool/docs"
        : >"$repo/tools/$tool/ROADMAP.md"
        : >"$repo/tools/$tool/docs/building.md"
        : >"$repo/tools/$tool/docs/change-standard.md"
    done
    cp "$plan_templates/plan.projects.yaml" "$repo/docs/plan.yaml"
}

# A repository with no configuration and no page, its worktree root ignored.
make_bare_repo() {
    repo=$test_root/$1
    mkdir -p "$repo"
    git -C "$repo" init -q
    printf '/.agents/worktrees/\n' >"$repo/.gitignore"
}

# Write the configuration file $1 with the required keys only: its pages under the prefix $2 and its ledger, archive and worktree roots under the prefix $3, both read from the file's folder.
write_config() {
    mkdir -p "$(dirname "$1")"
    printf 'roadmap: %sroadmap.md\nverification: %sdev/building.md\nrules: %sdev/change-standard.md\n' "$2" "$2" "$2" >"$1"
    printf 'ledger_root: %s.scratch\narchive_root: %s.scratch/archive\nworktree_root: %s.agents/worktrees\n' "$3" "$3" "$3" >>"$1"
    printf 'worker: claude:opus\nreviewer: claude:opus\nlibraries: check\n' >>"$1"
}

# The three pages write_config names, empty, in the folder $1.
write_pages() {
    mkdir -p "$1/dev"
    : >"$1/roadmap.md"
    : >"$1/dev/building.md"
    : >"$1/dev/change-standard.md"
}

# Write key $2 of the configuration file $1 with the value $3, in place of the line the file has.
set_file_key() {
    sed -i.bak "/^$2:/d" "$1"
    printf '%s: %s\n' "$2" "$3" >>"$1"
}

# One-project form: write key $2 of $1's docs/plan.yaml with the value $3.
set_key() {
    set_file_key "$test_root/$1/docs/plan.yaml" "$2" "$3"
}

# Several-projects form: write key $3 of project $2 in $1's configuration with the value $4, in place of the line the project has.
set_project_key() {
    file=$test_root/$1/docs/plan.yaml
    awk -v project="  $2:" -v key="    $3:" -v line="    $3: $4" '
        /^  [^ ]/ { in_project = ($0 == project); print; if (in_project) print line; next }
        in_project && index($0, key) == 1 { next }
        { print }' "$file" >"$file.new" && mv "$file.new" "$file"
}

# The check of the file $2 of the repository $1, docs/plan.yaml when $2 is left out, passes.
expect_pass() {
    output=$(python3 "$check" "$test_root/$1/${2:-docs/plan.yaml}") || fail "$1: expected a pass, got: $output"
    case "$output" in
        *"ok: ${2:-docs/plan.yaml} carries"*) ;;
        *) fail "$1: missing [ok: ${2:-docs/plan.yaml} carries] in: $output" ;;
    esac
}

# The check of the file $3 of the repository $1, docs/plan.yaml when $3 is left out, exits non-zero with the error $2 on a line that names the file.
expect_error() {
    if output=$(python3 "$check" "$test_root/$1/${3:-docs/plan.yaml}"); then
        fail "$1: expected an error, got a pass: $output"
    fi
    case "$output" in
        *"error: ${3:-docs/plan.yaml}$2"*) ;;
        *) fail "$1: missing [error: ${3:-docs/plan.yaml}$2] in: $output" ;;
    esac
}

# --find on the repository $1, with the folder $3 when given, prints $2 and exits 0.
expect_found() {
    if [ "$#" -eq 3 ]; then
        output=$(python3 "$check" --find "$test_root/$1" "$3") || fail "$1: --find $3 failed: $output"
    else
        output=$(python3 "$check" --find "$test_root/$1") || fail "$1: --find failed: $output"
    fi
    [ "$output" = "$2" ] || fail "$1: --find ${3:-} printed [$output], expected [$2]"
}

# --find on the repository $1, with the folder $3 when given, exits 1 with an error line that holds $2.
expect_not_found() {
    if [ "$#" -eq 3 ]; then
        output=$(python3 "$check" --find "$test_root/$1" "$3")
    else
        output=$(python3 "$check" --find "$test_root/$1")
    fi
    status=$?
    [ "$status" -eq 1 ] || fail "$1: --find ${3:-} exited $status, expected 1: $output"
    case "$output" in
        "error: "*"$2"*) ;;
        *) fail "$1: --find ${3:-} missing [$2] in: $output" ;;
    esac
}

make_repo complete
expect_pass complete

make_repo missing-key
sed -i.bak '/^reviewer:/d' "$test_root/missing-key/docs/plan.yaml"
expect_error missing-key ": required key missing: reviewer"

make_repo unknown-key
printf 'reviewers: claude:opus\n' >>"$test_root/unknown-key/docs/plan.yaml"
expect_error unknown-key ": unknown key: reviewers"

make_repo missing-page
rm "$test_root/missing-page/docs/dev/building.md"
expect_error missing-page ": verification names a file that does not exist: docs/dev/building.md"

make_repo not-ignored
: >"$test_root/not-ignored/.gitignore"
expect_error not-ignored ": worktree_root is not ignored by git: .agents/worktrees"

make_repo config-ignored
printf '/.agents/worktrees/\n/docs/plan.yaml\n' >"$test_root/config-ignored/.gitignore"
expect_error config-ignored " is ignored by git"

# A file in the fourth place of the search, .agents/plan.yaml, under a rule that ignores the rest of .agents/.
make_repo agents-star
rm "$test_root/agents-star/docs/plan.yaml"
write_config "$test_root/agents-star/.agents/plan.yaml" ../docs/ ../
printf '.agents/*\n!.agents/plan.yaml\n' >"$test_root/agents-star/.gitignore"
expect_pass agents-star .agents/plan.yaml

# A wrong value is refused with the line that names the key and the value.
case_number=0
while IFS='|' read -r key value want; do
    case_number=$((case_number + 1))
    name=value-$case_number
    make_repo "$name"
    set_key "$name" "$key" "$value"
    expect_error "$name" ": $want"
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
adr|decisions|adr names a folder that does not exist: docs/decisions
adr|../../elsewhere|adr is not a path under the repository root: '../../elsewhere'
CASES

# A key written twice is refused with its name, whatever its position and the loader's last-value rule.
make_repo twice-effort
sed -i.bak '/^worker_effort:/d' "$test_root/twice-effort/docs/plan.yaml"
printf 'worker_effort: low\nworker_effort: max\n' >>"$test_root/twice-effort/docs/plan.yaml"
expect_error twice-effort ": key written twice: worker_effort"

# A key written twice inside a mapping that is the value of a merge key is refused with its name.
make_repo merge-twice-inside
sed -i.bak '/^worker_effort:/d' "$test_root/merge-twice-inside/docs/plan.yaml"
printf '<<: {worker_effort: low, worker_effort: max}\n' >>"$test_root/merge-twice-inside/docs/plan.yaml"
expect_error merge-twice-inside ": key written twice: worker_effort"

# The several-projects form: the example passes, a missing key, a wrong value and a key written twice are each named with their project.
make_projects_repo projects
expect_pass projects
sed -i.bak '/^    worker: /d' "$test_root/projects/docs/plan.yaml"
expect_error projects ": tool-a: required key missing: worker"
make_projects_repo projects-bar
set_project_key projects-bar tool-b design_bar best
expect_error projects-bar ": tool-b: design_bar is not industry, state-of-the-art or novel: 'best'"
make_projects_repo projects-twice
set_project_key projects-twice tool-b worker_effort low
printf '    worker_effort: max\n' >>"$test_root/projects-twice/docs/plan.yaml"
expect_error projects-twice ": tool-b: key written twice: worker_effort"

# Two projects whose ledger_root values are two strings that resolve to one folder are refused with the folder and both projects; two ledger roots that resolve to two folders, one inside the other, pass.
make_projects_repo projects-one-ledger
set_project_key projects-one-ledger tool-a ledger_root .scratch
set_project_key projects-one-ledger tool-b ledger_root ./.scratch
expect_error projects-one-ledger ": the projects tool-a and tool-b have one ledger_root: docs/.scratch"
make_projects_repo projects-two-ledgers
set_project_key projects-two-ledgers tool-a ledger_root .scratch
set_project_key projects-two-ledgers tool-b ledger_root ./.scratch/tool-b
expect_pass projects-two-ledgers

# Several-projects form where tool-b takes tool-a's keys through a YAML merge key and overrides roadmap, verification, ledger_root, archive_root and worker_effort: a merge key is not a key written twice, and a key written twice beside it is still refused with its project.
make_merge_repo() {
    make_projects_repo "$1"
    file=$test_root/$1/docs/plan.yaml
    sed -e 's/^  tool-a:$/  tool-a: \&base/' -e '/^  tool-b:/,$d' "$file" >"$file.new" && mv "$file.new" "$file"
    printf '  tool-b:\n    <<: *base\n    roadmap: ../tools/tool-b/ROADMAP.md\n    verification: ../tools/tool-b/docs/building.md\n    ledger_root: ../tools/tool-b/.scratch\n    archive_root: ../tools/tool-b/.scratch/archive\n    worker_effort: max\n' >>"$file"
}
make_merge_repo merge-key
expect_pass merge-key
make_merge_repo merge-key-twice
printf '    worker_effort: low\n' >>"$test_root/merge-key-twice/docs/plan.yaml"
expect_error merge-key-twice ": tool-b: key written twice: worker_effort"

# The search with one file: the folder named, then .scratch, docs and .agents at the repository root.
make_bare_repo find-named
write_config "$test_root/find-named/apps/web/plan.yaml" "" ../../
write_pages "$test_root/find-named/apps/web"
expect_found find-named apps/web/plan.yaml apps/web
expect_found find-named apps/web/plan.yaml apps/web/
expect_pass find-named apps/web/plan.yaml
make_bare_repo find-scratch
write_config "$test_root/find-scratch/.scratch/plan.yaml" "" ../
expect_found find-scratch .scratch/plan.yaml
make_bare_repo find-docs
write_config "$test_root/find-docs/docs/plan.yaml" "" ../
expect_found find-docs docs/plan.yaml
make_bare_repo find-agents
write_config "$test_root/find-agents/.agents/plan.yaml" "" ../
expect_found find-agents .agents/plan.yaml

# The search with several files: docs before .agents, .scratch before docs, the folder named before all three.
make_bare_repo find-order
write_config "$test_root/find-order/.agents/plan.yaml" "" ../
write_config "$test_root/find-order/docs/plan.yaml" "" ../
expect_found find-order docs/plan.yaml
write_config "$test_root/find-order/.scratch/plan.yaml" "" ../
expect_found find-order .scratch/plan.yaml
write_config "$test_root/find-order/apps/web/plan.yaml" "" ../../
expect_found find-order apps/web/plan.yaml apps/web

# No file in any place is an error that names the places; a folder named that holds no file falls through to the three places at the root; a folder outside the repository is refused by its name.
make_bare_repo find-none
expect_not_found find-none ".scratch, docs, .agents"
mkdir -p "$test_root/find-none/apps/web"
expect_not_found find-none "apps/web, .scratch, docs, .agents" apps/web
write_config "$test_root/find-outside/plan.yaml" "" ""
expect_not_found find-none "the folder ../find-outside is outside the repository" ../find-outside
write_config "$test_root/find-none/docs/plan.yaml" "" ../
expect_found find-none docs/plan.yaml apps/web

# A file in apps/web reads its paths from apps/web: the ledger root ../../ledger is the repository's ledger folder, and the pages are the ones under apps/web. A page that exists only at the repository root is missing, named by its path from the repository root.
make_bare_repo nested
write_config "$test_root/nested/apps/web/plan.yaml" "" ../../
set_file_key "$test_root/nested/apps/web/plan.yaml" ledger_root ../../ledger
write_pages "$test_root/nested/apps/web"
expect_pass nested apps/web/plan.yaml
rm "$test_root/nested/apps/web/dev/building.md"
write_pages "$test_root/nested"
expect_error nested ": verification names a file that does not exist: apps/web/dev/building.md" apps/web/plan.yaml

# A path that resolves outside the repository is refused with its key, and so is a ledger root that is the repository root; ledger_root: . in .scratch/plan.yaml is the folder .scratch and passes.
make_repo outside
set_key outside ledger_root ../../elsewhere
expect_error outside ": ledger_root is not a path under the repository root: '../../elsewhere'"
make_repo ledger-is-root
set_key ledger-is-root ledger_root ..
expect_error ledger-is-root ": ledger_root is the repository root: '..'"
make_bare_repo ledger-dot
write_config "$test_root/ledger-dot/.scratch/plan.yaml" ../docs/ ../
write_pages "$test_root/ledger-dot/docs"
set_file_key "$test_root/ledger-dot/.scratch/plan.yaml" ledger_root .
set_file_key "$test_root/ledger-dot/.scratch/plan.yaml" archive_root archive
expect_pass ledger-dot .scratch/plan.yaml

# A file with no worktree_root uses .agents/worktrees at the repository root: it passes with the note when git ignores that folder, and is refused when git does not.
make_repo no-worktree-root
sed -i.bak '/^worktree_root:/d' "$test_root/no-worktree-root/docs/plan.yaml"
expect_pass no-worktree-root
case "$output" in
    *"note: docs/plan.yaml: worktree_root not set, default '.agents/worktrees' at the repository root applies"*) ;;
    *) fail "no-worktree-root: missing the note of the default in: $output" ;;
esac
: >"$test_root/no-worktree-root/.gitignore"
expect_error no-worktree-root ": worktree_root is not ignored by git: .agents/worktrees"

# A file with no adr key at docs/plan.yaml reads the default docs/adr from the repository root, not from docs/.
make_repo no-adr
sed -i.bak '/^adr:/d' "$test_root/no-adr/docs/plan.yaml"
expect_pass no-adr
case "$output" in
    *"note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies"*) ;;
    *) fail "no-adr: missing the note of the default in: $output" ;;
esac

# The arguments: no argument inside a repository whose configuration is sound, a repository root in place of a file, and a file in no git repository each exit 1 with an error line.
expect_argument_error() {
    [ "$2" -eq 1 ] || fail "$1: exited $2, expected 1: $3"
    case "$3" in
        "error: "*) ;;
        *) fail "$1: missing an error line in: $3" ;;
    esac
}
make_repo arguments
write_config "$test_root/arguments/.agents/plan.yaml" ../docs/ ../
output=$(cd "$test_root/arguments" && python3 "$check")
expect_argument_error "no argument" "$?" "$output"
output=$(python3 "$check" "$test_root/arguments")
expect_argument_error "a repository root" "$?" "$output"
write_config "$test_root/no-repository/plan.yaml" "" ""
output=$(python3 "$check" "$test_root/no-repository/plan.yaml")
expect_argument_error "a file in no git repository" "$?" "$output"
case "$output" in
    *"in no git repository"*) ;;
    *) fail "a file in no git repository: missing [in no git repository] in: $output" ;;
esac

# A repository reached through a symbolic link prints what its real path prints, for the search and for the check.
make_repo linked
ln -s "$test_root/linked" "$test_root/linked-link"
expect_found linked-link docs/plan.yaml
expect_pass linked
real_output=$output
output=$(python3 "$check" "$test_root/linked-link/docs/plan.yaml") || fail "linked: expected a pass through the link, got: $output"
[ "$output" = "$real_output" ] || fail "linked: through the link [$output], through the real path [$real_output]"
set_key linked ledger_root ../../elsewhere
expect_error linked-link ": ledger_root is not a path under the repository root: '../../elsewhere'"

printf 'PASS: check_config.py scratch tests\n'
