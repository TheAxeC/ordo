#!/bin/sh
# Exercise check_config.py on scratch repositories, each case one configuration it must refuse or pass.
# A configuration is refused, with the line that names its error, when it misses a required key (reviewer; worker in the projects: form, named with its project), holds an unknown key, names a page that does not exist, leaves the worktree root not ignored, has .agents/plan.yaml ignored by git, sets worker to a model with no harness or to a harness other than claude, gives repair_rounds a value of the wrong kind, sets libraries to a value other than check or avoid (a word, a boolean, or nothing), writes a key twice (worker_effort or reviewer, and in a project of the projects: form with its name, a project that also holds a merge key included, and a mapping written as the value of a merge key), sets adr to a folder that does not exist or to a file (the default docs/adr as a file included), to a value that is not a non-empty string (nothing, '', a number) or to a path outside the repository root (absolute, or through ..), sets design_bar to a value other than industry, state-of-the-art or novel (a word, another capital, nothing), sets design_references to something other than a list of text (a string, a list holding a number, nothing), or sets worker_effort or reviewer_effort to a value other than low, medium, high, xhigh or max (a word, a boolean, a number, another capital, nothing), sets self_rule or next_entry to a value that is not a boolean (a word, a number, nothing, a spelling YAML reads as text such as oN, or on, On, ON, off, Off or OFF in quotes, which has its own message), sets repair_reviewer to a value other than claude:<model> (a word, a list, a number, nothing), or writes worker or reviewer with no value; each refusal of those eight keys, and of a key written twice, is the one error line.
# The example configuration of each form passes, as does .agents/* with !.agents/plan.yaml after it, and libraries: avoid. The examples write adr, design_bar, design_references, worker_effort and reviewer_effort in each project; the one-project example notes that the default ADR folder docs/adr does not exist yet, and passes with no such note once it does; with the five keys removed it notes each default. adr: docs/decisions with that folder, adr: docs/adr/, design_bar: novel or state-of-the-art, design_references: [WCAG 2.2 AA], worker_effort: max and reviewer_effort: xhigh pass, as does a project that takes another's keys through a merge key (<<: *base) and overrides one of them. The examples also write self_rule, next_entry and repair_reviewer in each project. Two guards show that the shipped examples print none of the three not-set notes; nine probes show that each example, and each project of the projects: example, holds each of the three keys, since a second copy of the key is a key written twice. With the three keys removed each default is noted: off for self_rule and next_entry, the configured reviewer for repair_reviewer (another reviewer, and a missing or invalid one, which names no value). self_rule: on, yes, true and On pass, next_entry: on passes with no note under self_rule: on, and with self_rule off or removed it passes with the note that it acts only under self-rule (with the project's name in the projects: form), a note not printed when self_rule has an error. repair_reviewer: claude:sonnet passes, and a written repair_reviewer is not compared with a missing reviewer. Each of the three keys written twice, and repair_reviewer beside projects:, is refused.

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

# Output of check_config.py on $1 holds the line $2 whole.
has_line() {
    printf '%s\n' "$output" | grep -Fxq -- "$2" || fail "$1: missing the line [$2] in: $output"
}

# Output of check_config.py on $1 does not hold the line $2.
lacks_line() {
    if printf '%s\n' "$output" | grep -Fxq -- "$2"; then
        fail "$1: unexpected line [$2] in: $output"
    fi
}

# A refused configuration: exit 1, the error line $2 whole, and no other error line.
expect_refusal() {
    if output=$(python3 "$check" "$test_root/$1"); then
        fail "$1: expected an error, got a pass: $output"
    fi
    has_line "$1" "error: $2"
    count=$(printf '%s\n' "$output" | grep -c '^error:')
    [ "$count" -eq 1 ] || fail "$1: expected one error line, got $count in: $output"
}

# One-project form: write key $2 of $1's configuration with the value $3, or with no value when $3 is empty, in place of the line the example has.
set_key() {
    file=$test_root/$1/.agents/plan.yaml
    sed -i.bak "/^$2:/d" "$file"
    printf '%s:%s\n' "$2" "${3:+ $3}" >>"$file"
}

# Several-projects form: write key $3 of project $2 in $1's configuration with the value $4, in place of the line the project has.
set_project_key() {
    file=$test_root/$1/.agents/plan.yaml
    awk -v project="  $2:" -v key="    $3:" -v line="    $3: $4" '
        /^  [^ ]/ { in_project = ($0 == project); print; if (in_project) print line; next }
        in_project && index($0, key) == 1 { next }
        { print }' "$file" >"$file.new" && mv "$file.new" "$file"
}

adr_note="note: adr folder docs/adr does not exist yet; repo-setup or grill creates it"
five_notes="adr not set, default 'docs/adr' applies
design_bar not set, default 'industry' applies
design_references not set, default [] applies
worker_effort not set, default 'high' applies
reviewer_effort not set, default 'high' applies"

# The one-project example writes the five keys and passes, with a note for the default ADR folder it lacks. Red when the example lacks one of the keys (an unknown key, or its not-set note) or the note for a missing docs/adr is dropped.
make_repo five-keys
expect_pass five-keys
has_line five-keys "$adr_note"
printf '%s\n' "$five_notes" | while IFS= read -r note; do
    lacks_line five-keys "note: $note"
done || exit 1

# With docs/adr present the example passes with no note for the folder. Red when the note is printed whether or not the folder exists; the case above is its control.
make_repo adr-present
mkdir "$test_root/adr-present/docs/adr"
expect_pass adr-present
lacks_line adr-present "$adr_note"

# The several-projects example writes the five keys in both projects and passes. Red when a project lacks one of them; the control removes one from tool-b.
make_projects_repo projects-five
expect_pass projects-five
for project in tool-a tool-b; do
    printf '%s\n' "$five_notes" | while IFS= read -r note; do
        lacks_line projects-five "note: $project: $note"
    done || exit 1
done
make_projects_repo projects-five-control
file=$test_root/projects-five-control/.agents/plan.yaml
awk '/^  [^ ]/ { in_b = ($0 == "  tool-b:") } !(in_b && /^    worker_effort:/)' "$file" >"$file.new" && mv "$file.new" "$file"
expect_pass projects-five-control
has_line projects-five-control "note: tool-b: worker_effort not set, default 'high' applies"

# With the five keys removed the example passes, and each key's default is named in a note. Red when a key is dropped from the example, which removes its note.
make_repo five-keys-removed
sed -i.bak -e '/^adr:/d' -e '/^design_bar:/d' -e '/^design_references:/d' -e '/^worker_effort:/d' -e '/^reviewer_effort:/d' "$test_root/five-keys-removed/.agents/plan.yaml"
expect_pass five-keys-removed
printf '%s\n' "$five_notes" | while IFS= read -r note; do
    has_line five-keys-removed "note: $note"
done || exit 1

# adr names a folder under the repository root; one that exists passes, a trailing slash included. Red when the adr check refuses an existing folder or a trailing slash.
make_repo adr-decisions
mkdir "$test_root/adr-decisions/docs/decisions"
set_key adr-decisions adr docs/decisions
expect_pass adr-decisions
make_repo adr-slash
mkdir "$test_root/adr-slash/docs/adr"
set_key adr-slash adr docs/adr/
expect_pass adr-slash

# A folder other than the default that does not exist, or a file, is refused. Red when the adr check drops the folder test, or tests existence instead of a folder.
make_repo adr-absent
set_key adr-absent adr docs/decisions
expect_refusal adr-absent "adr names a folder that does not exist: docs/decisions"
make_repo adr-file
set_key adr-file adr docs/roadmap.md
expect_refusal adr-file "adr names a folder that does not exist: docs/roadmap.md"

# adr that is not text, or is empty, is refused with its value. Red when the adr check accepts a value that is not a non-empty string, or the kind check reports it instead.
make_repo adr-empty
set_key adr-empty adr ""
expect_refusal adr-empty "adr is not a folder path: None"
make_repo adr-quoted
set_key adr-quoted adr '""'
expect_refusal adr-quoted "adr is not a folder path: ''"
make_repo adr-number
set_key adr-number adr 5
expect_refusal adr-number "adr is not a folder path: 5"

# adr outside the repository root, absolute or through .., is refused. Red when the adr check drops the root test.
make_repo adr-absolute
set_key adr-absolute adr /tmp
expect_refusal adr-absolute "adr is not a path under the repository root: '/tmp'"
make_repo adr-parent
set_key adr-parent adr ../elsewhere
expect_refusal adr-parent "adr is not a path under the repository root: '../elsewhere'"

# design_bar takes industry, state-of-the-art or novel. Red when the value check refuses one of them.
for value in novel state-of-the-art; do
    make_repo "design-bar-$value"
    set_key "design-bar-$value" design_bar "$value"
    expect_pass "design-bar-$value"
done

# Any other design_bar, another capital or no value included, is refused with the value. Red when the value check is dropped, compares without case, or skips a value of None.
make_repo design-bar-best
set_key design-bar-best design_bar best
expect_refusal design-bar-best "design_bar is not industry, state-of-the-art or novel: 'best'"
make_repo design-bar-capital
set_key design-bar-capital design_bar Industry
expect_refusal design-bar-capital "design_bar is not industry, state-of-the-art or novel: 'Industry'"
make_repo design-bar-empty
set_key design-bar-empty design_bar ""
expect_refusal design-bar-empty "design_bar is not industry, state-of-the-art or novel: None"

# design_references is a list of text. Red when the value check refuses a list of strings.
make_repo references-list
set_key references-list design_references '[WCAG 2.2 AA]'
expect_pass references-list

# A string, a list holding a number, or no value is refused with the value. Red when the value check accepts a string, skips the items, or skips a value of None.
make_repo references-string
set_key references-string design_references WCAG
expect_refusal references-string "design_references is not a list of text: 'WCAG'"
make_repo references-number
set_key references-number design_references '[1]'
expect_refusal references-number "design_references is not a list of text: [1]"
make_repo references-empty
set_key references-empty design_references ""
expect_refusal references-empty "design_references is not a list of text: None"

# worker_effort and reviewer_effort take low, medium, high, xhigh or max. Red when the value check refuses max or xhigh.
make_repo worker-effort-max
set_key worker-effort-max worker_effort max
expect_pass worker-effort-max
make_repo reviewer-effort-xhigh
set_key reviewer-effort-xhigh reviewer_effort xhigh
expect_pass reviewer-effort-xhigh

# Any other effort, a word, a boolean, a number, another capital or no value, is refused with the value. Red when the value check is dropped, compares without case or kind, or skips a value of None.
for case in "huge:'huge'" "yes:True" "3:3" "High:'High'"; do
    value=${case%%:*}
    make_repo "worker-effort-$value"
    set_key "worker-effort-$value" worker_effort "$value"
    expect_refusal "worker-effort-$value" "worker_effort is not low, medium, high, xhigh or max: ${case#*:}"
done
make_repo reviewer-effort-huge
set_key reviewer-effort-huge reviewer_effort huge
expect_refusal reviewer-effort-huge "reviewer_effort is not low, medium, high, xhigh or max: 'huge'"
make_repo reviewer-effort-empty
set_key reviewer-effort-empty reviewer_effort ""
expect_refusal reviewer-effort-empty "reviewer_effort is not low, medium, high, xhigh or max: None"

# A key written twice is refused with its name, one of the five or any other. Red when the file is loaded with a loader that keeps the last value.
make_repo twice-effort
sed -i.bak '/^worker_effort:/d' "$test_root/twice-effort/.agents/plan.yaml"
printf 'worker_effort: low\nworker_effort: max\n' >>"$test_root/twice-effort/.agents/plan.yaml"
expect_refusal twice-effort "key written twice: worker_effort"
make_repo twice-reviewer
printf 'reviewer: claude:sonnet\n' >>"$test_root/twice-reviewer/.agents/plan.yaml"
expect_refusal twice-reviewer "key written twice: reviewer"

# In the several-projects form a wrong value or a key written twice is refused with its project's name. Red when a project's values skip the checks or the duplicate is named without its project.
make_projects_repo projects-effort
set_project_key projects-effort tool-a worker_effort huge
expect_refusal projects-effort "tool-a: worker_effort is not low, medium, high, xhigh or max: 'huge'"
make_projects_repo projects-bar
set_project_key projects-bar tool-b design_bar best
expect_refusal projects-bar "tool-b: design_bar is not industry, state-of-the-art or novel: 'best'"
make_projects_repo projects-adr
set_project_key projects-adr tool-a adr docs/decisions
expect_refusal projects-adr "tool-a: adr names a folder that does not exist: docs/decisions"
make_projects_repo projects-twice
set_project_key projects-twice tool-b worker_effort low
printf '    worker_effort: max\n' >>"$test_root/projects-twice/.agents/plan.yaml"
expect_refusal projects-twice "tool-b: key written twice: worker_effort"

# The default docs/adr that exists as a file is refused, not taken as the default not yet created. Red when the default's note is given whether or not a file is in the way.
make_repo adr-default-file
: >"$test_root/adr-default-file/docs/adr"
expect_refusal adr-default-file "adr names a folder that does not exist: docs/adr"

# Several-projects form where tool-b takes tool-a's keys through a YAML merge key: tool-b: holds <<: *base and its own roadmap, verification and worker_effort: max.
make_merge_repo() {
    make_projects_repo "$1"
    file=$test_root/$1/.agents/plan.yaml
    sed -e 's/^  tool-a:$/  tool-a: \&base/' -e '/^  tool-b:/,$d' "$file" >"$file.new" && mv "$file.new" "$file"
    printf '  tool-b:\n    <<: *base\n    roadmap: tools/tool-b/ROADMAP.md\n    verification: tools/tool-b/docs/building.md\n    worker_effort: max\n' >>"$file"
}

# A merge key is not a key written twice, and a key that overrides a merged value is not one either: the file passes with no error line. Red when the duplicate scan constructs the merge key or counts the keys it merges in.
make_merge_repo merge-key
expect_pass merge-key
if printf '%s\n' "$output" | grep -q '^error:'; then
    fail "merge-key: unexpected error line in: $output"
fi

# A key written twice beside a merge key is still refused with its project. Red when the scan stops at the merge key.
make_merge_repo merge-key-twice
printf '    worker_effort: low\n' >>"$test_root/merge-key-twice/.agents/plan.yaml"
expect_refusal merge-key-twice "tool-b: key written twice: worker_effort"

# A key written twice inside a mapping written as the value of a merge key is refused with the project that holds the merge key. Red when the scan skips the merge key's value.
make_merge_repo merge-inline-twice
file=$test_root/merge-inline-twice/.agents/plan.yaml
sed -e 's/^    <<: \*base$/    <<: [*base, {design_bar: novel, design_bar: industry}]/' "$file" >"$file.new" && mv "$file.new" "$file"
expect_refusal merge-inline-twice "tool-b: key written twice: design_bar"

# Output of check_config.py on $1 does not hold the text $2 anywhere.
lacks_text() {
    case "$output" in
        *"$2"*) fail "$1: unexpected text [$2] in: $output" ;;
    esac
}

# One-project form: remove key $2 from $1's configuration.
remove_key() {
    sed -i.bak "/^$2:/d" "$test_root/$1/.agents/plan.yaml"
}

# Several-projects form: remove key $3 of project $2 from $1's configuration.
remove_project_key() {
    file=$test_root/$1/.agents/plan.yaml
    awk -v project="  $2:" -v key="    $3:" '
        /^  [^ ]/ { in_project = ($0 == project) }
        !(in_project && index($0, key) == 1)' "$file" >"$file.new" && mv "$file.new" "$file"
}

self_rule_note="self_rule not set, default off applies"
next_entry_note="next_entry not set, default off applies"
repair_note="repair_reviewer not set, the reviewer's value 'claude:opus' applies"
three_notes="$self_rule_note
$next_entry_note
$repair_note"

# Guard: the one-project example as shipped passes with none of the three keys' not-set notes; red when the example drops one of the keys (its not-set note is printed). The removed-keys case below is its control, and the probe below proves the example holds each key.
make_repo three-keys
expect_pass three-keys
printf '%s\n' "$three_notes" | while IFS= read -r note; do
    lacks_line three-keys "note: $note"
done || exit 1

# Guard: the several-projects example as shipped passes with none of the three notes for tool-a or tool-b; red when a project drops a key. The control removes repair_reviewer from tool-b and the note names the reviewer's value, and the probe below proves each project holds each key.
make_projects_repo projects-three
expect_pass projects-three
for project in tool-a tool-b; do
    printf '%s\n' "$three_notes" | while IFS= read -r note; do
        lacks_line projects-three "note: $project: $note"
    done || exit 1
done
make_projects_repo projects-three-control
remove_project_key projects-three-control tool-b repair_reviewer
expect_pass projects-three-control
has_line projects-three-control "note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies"

# The shipped one-project example holds each of the three keys: a second copy of the key appended to it is a key written twice. Red when the example lacks the key, since the appended line is then its only one and the error is an unknown key.
for case in "self_rule:off" "next_entry:off" "repair_reviewer:claude:opus"; do
    key=${case%%:*}
    make_repo "holds-$key"
    printf '%s: %s\n' "$key" "${case#*:}" >>"$test_root/holds-$key/.agents/plan.yaml"
    expect_refusal "holds-$key" "key written twice: $key"
done

# The shipped several-projects example holds each of the three keys in tool-a and in tool-b, proved the same way, with the project's name in the error. Red when a project lacks the key.
add_project_key() {
    file=$test_root/$1/.agents/plan.yaml
    awk -v project="  $2:" -v line="    $3: $4" '
        /^  [^ ]/ { in_project = ($0 == project) }
        { print }
        in_project && index($0, "    reviewer_effort:") == 1 { print line }' "$file" >"$file.new" && mv "$file.new" "$file"
}
for project in tool-a tool-b; do
    for case in "self_rule:off" "next_entry:off" "repair_reviewer:claude:opus"; do
        key=${case%%:*}
        make_projects_repo "holds-$project-$key"
        add_project_key "holds-$project-$key" "$project" "$key" "${case#*:}"
        expect_refusal "holds-$project-$key" "$project: key written twice: $key"
    done
done

# With the three keys removed the example passes and each default is named: off for the two switches, the configured reviewer for repair_reviewer. Red when a key is missing from the example's comments, or the repair_reviewer note is the generic one.
make_repo three-keys-removed
for key in self_rule next_entry repair_reviewer; do
    remove_key three-keys-removed "$key"
done
expect_pass three-keys-removed
printf '%s\n' "$three_notes" | while IFS= read -r note; do
    has_line three-keys-removed "note: $note"
done || exit 1

# repair_reviewer left out names the configured reviewer, whatever it is. Red when the note names a fixed model or the default text of the example.
make_repo repair-default-haiku
set_key repair-default-haiku reviewer claude:haiku
remove_key repair-default-haiku repair_reviewer
expect_pass repair-default-haiku
has_line repair-default-haiku "note: repair_reviewer not set, the reviewer's value 'claude:haiku' applies"

# With reviewer missing or wrong, the repair_reviewer note does not name a value, and the reviewer's own error stands alone. Red when the note names a missing or invalid reviewer.
make_repo repair-default-no-reviewer
remove_key repair-default-no-reviewer reviewer
remove_key repair-default-no-reviewer repair_reviewer
expect_refusal repair-default-no-reviewer "required key missing: reviewer"
has_line repair-default-no-reviewer "note: repair_reviewer not set, the reviewer's value applies"
make_repo repair-default-bad-reviewer
set_key repair-default-bad-reviewer reviewer opus
remove_key repair-default-bad-reviewer repair_reviewer
expect_refusal repair-default-bad-reviewer "reviewer is not claude:<model>: 'opus'"
has_line repair-default-bad-reviewer "note: repair_reviewer not set, the reviewer's value applies"

# A written repair_reviewer is not compared with the reviewer, so a missing reviewer gives its one error line. Red when the unknown-key error or the kind check reports repair_reviewer as well.
make_repo repair-set-no-reviewer
remove_key repair-set-no-reviewer reviewer
set_key repair-set-no-reviewer repair_reviewer claude:sonnet
expect_refusal repair-set-no-reviewer "required key missing: reviewer"

# self_rule and next_entry take on and off, which YAML reads as booleans; next_entry on under self_rule on has no note naming next_entry. Red when the keys are unknown or a boolean is refused.
make_repo self-rule-on
set_key self-rule-on self_rule on
set_key self-rule-on next_entry on
expect_pass self-rule-on
lacks_text self-rule-on "next_entry"

# yes, true and On are the same boolean as on. Red when the check compares the written text.
for value in yes true On; do
    make_repo "self-rule-$value"
    set_key "self-rule-$value" self_rule "$value"
    expect_pass "self-rule-$value"
done

# A word that is neither on nor off is refused with the value. Red when the value check is missing or accepts any text.
make_repo self-rule-maybe
set_key self-rule-maybe self_rule maybe
expect_refusal self-rule-maybe "self_rule is neither on nor off: 'maybe'"

# on or off in quotes is text, which plan-orchestration would not read as on, so the error says to write it without quotes. Red when the quoted word is refused as a generic wrong value or accepted.
make_repo self-rule-quoted
set_key self-rule-quoted self_rule '"on"'
expect_refusal self-rule-quoted "self_rule is the text 'on' in quotes; write on or off without quotes"

# A spelling YAML reads as text, not as a boolean (a capital in the middle), is neither on nor off and gets the generic error, not the quotes message. Red when the check lowercases the value before choosing the message.
make_repo self-rule-mixed
set_key self-rule-mixed self_rule oN
expect_refusal self-rule-mixed "self_rule is neither on nor off: 'oN'"

# No value, or a number, is refused with the value. Red when the value check skips a value of None or accepts a number.
make_repo self-rule-empty
set_key self-rule-empty self_rule ""
expect_refusal self-rule-empty "self_rule is neither on nor off: None"
make_repo next-entry-number
set_key next-entry-number next_entry 1
expect_refusal next-entry-number "next_entry is neither on nor off: 1"
make_repo next-entry-empty
set_key next-entry-empty next_entry ""
expect_refusal next-entry-empty "next_entry is neither on nor off: None"

# next_entry on while self_rule is off, or left out, is valid and notes that the key acts only under self-rule; self_rule left out also gets its default note. Red when the note is missing or the combination is an error.
make_repo next-entry-self-off
set_key next-entry-self-off next_entry on
expect_pass next-entry-self-off
has_line next-entry-self-off "note: next_entry is on while self_rule is off; it acts only under self-rule"
make_repo next-entry-self-absent
set_key next-entry-self-absent next_entry on
remove_key next-entry-self-absent self_rule
expect_pass next-entry-self-absent
has_line next-entry-self-absent "note: next_entry is on while self_rule is off; it acts only under self-rule"
has_line next-entry-self-absent "note: self_rule not set, default off applies"

# The note is not printed when self_rule has an error: the one error line stands, and no note names next_entry. Red when the note is printed beside the error.
make_repo next-entry-self-bad
set_key next-entry-self-bad next_entry on
set_key next-entry-self-bad self_rule maybe
expect_refusal next-entry-self-bad "self_rule is neither on nor off: 'maybe'"
lacks_text next-entry-self-bad "next_entry"

# In the several-projects form the note names its project. Red when the prefix is missing.
make_projects_repo projects-next-entry
set_project_key projects-next-entry tool-b next_entry on
set_project_key projects-next-entry tool-b self_rule off
expect_pass projects-next-entry
has_line projects-next-entry "note: tool-b: next_entry is on while self_rule is off; it acts only under self-rule"

# repair_reviewer takes claude:<model>; any other value, a list and a number and no value included, is refused with the value. Red when the key is unchecked, skips a value of None, or accepts a list.
make_repo repair-sonnet
set_key repair-sonnet repair_reviewer claude:sonnet
expect_pass repair-sonnet
make_repo repair-opus
set_key repair-opus repair_reviewer opus
expect_refusal repair-opus "repair_reviewer is not claude:<model>: 'opus'"
make_repo repair-list
set_key repair-list repair_reviewer '[claude:opus]'
expect_refusal repair-list "repair_reviewer is not claude:<model>: ['claude:opus']"
make_repo repair-number
set_key repair-number repair_reviewer 5
expect_refusal repair-number "repair_reviewer is not claude:<model>: 5"
make_repo repair-empty
set_key repair-empty repair_reviewer ""
expect_refusal repair-empty "repair_reviewer is not claude:<model>: None"

# In the several-projects form the error names its project. Red when the prefix is missing.
make_projects_repo projects-repair
set_project_key projects-repair tool-a repair_reviewer opus
expect_refusal projects-repair "tool-a: repair_reviewer is not claude:<model>: 'opus'"

# worker or reviewer written with no value is refused with None, not skipped. Red when the model check skips a value of None.
make_repo worker-empty
set_key worker-empty worker ""
expect_refusal worker-empty "worker is not claude:<model>: None"
make_repo reviewer-empty
set_key reviewer-empty reviewer ""
expect_refusal reviewer-empty "reviewer is not claude:<model>: None"

# Each of the three keys written twice is refused with its name, before any value is read. Red when the duplicate scan stops running on the file as written.
for key in self_rule next_entry repair_reviewer; do
    make_repo "twice-$key"
    remove_key "twice-$key" "$key"
    printf '%s: claude:opus\n%s: claude:sonnet\n' "$key" "$key" >>"$test_root/twice-$key/.agents/plan.yaml"
    expect_refusal "twice-$key" "key written twice: $key"
done

# repair_reviewer at the top of the several-projects form is a key beside projects. Red when the keys of a project are accepted beside projects:.
make_projects_repo projects-beside
printf 'repair_reviewer: claude:sonnet\n' >>"$test_root/projects-beside/.agents/plan.yaml"
expect_refusal projects-beside "keys beside projects: ['repair_reviewer']"

printf 'PASS: check_config.py scratch tests\n'
