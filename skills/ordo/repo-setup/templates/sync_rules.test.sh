#!/bin/sh
# Exercise sync_rules.py, with --write and with --glossary, on scratch repositories whose CLAUDE.md holds the shared-rules block and whose docs/glossary.md holds the plan-terms block, each filled from its template.
# Each case is kept because its failure loses text of the user's outside the block, leaves a file written that does not hold what was meant, or writes one file when the run was refused.
# --write makes a drifted block equal the template and keeps every byte outside the block, in an LF file under a preamble holding a tab, trailing spaces and a UTF-8 letter, and in a CRLF glossary, where the block is written in CRLF too.
# A CLAUDE.md that is not UTF-8 is refused and its bytes stay as they were, and a --write whose file does not read back as written is refused.
# --only glossary --write rewrites the glossary alone and leaves a drifted CLAUDE.md byte for byte.
# A drifted shared-rules block beside a missing glossary writes nothing, since every input is checked before anything is written.
# --glossary <path> checks and rewrites the plan-terms block in the file named and makes no docs/glossary.md, and a missing file named gets the no-single-block error under its own path.
# --glossary with no path, given twice, written with "=", or naming a path that resolves outside the root gets the usage line and writes nothing, inside the root or outside it.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/sync-rules-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
sync=$script_dir/sync_rules.py
terms_begin='<!-- ordo:plan-terms begin -->'
terms_end='<!-- ordo:plan-terms end -->'
cr=$(printf '\r')

# A repository whose CLAUDE.md and docs/glossary.md are the templates with their blocks filled in, and no other file.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo/docs"
    python3 -B - "$script_dir" "$repo" <<'PY'
import sys
here, repo = sys.argv[1], sys.argv[2]
for page, source, marker in (
    ("CLAUDE.md", "shared-rules.md", "<!-- ordo:shared-rules begin -->\n"),
    ("docs/glossary.md", "plan-terms.md", "<!-- ordo:plan-terms begin -->\n"),
):
    text = open(f"{here}/{page}").read()
    block = open(f"{here}/{source}").read().strip("\n")
    open(f"{repo}/{page}", "w").write(text.replace(marker, marker + block + "\n"))
PY
}

# Runs the command given and checks its exit status; $output holds its stdout, $errors its stderr.
expect() {
    status=$1
    shift
    "$@" >"$test_root/stdout" 2>"$test_root/stderr"
    actual=$?
    output=$(cat "$test_root/stdout")
    errors=$(cat "$test_root/stderr")
    [ "$actual" = "$status" ] || fail "$*: exit $actual, expected $status: [$output] [$errors]"
}

# A refusal: exit 2, nothing on stdout, and one line on stderr, "error: " and then the text given.
expect_refusal() {
    label=$1
    text=$2
    shift 2
    expect 2 "$@"
    [ -z "$output" ] || fail "$label: stdout is not empty: [$output]"
    case "$errors" in
        *"
"*) fail "$label: more than one line on stderr: [$errors]" ;;
        "error: "*"$text"*) ;;
        *) fail "$label: stderr is not [error: ...$text...]: [$errors]" ;;
    esac
}

# Writes the bytes of a file before its begin marker and from its end marker on, for cmp; the markers are the shared-rules ones, or the plan-terms ones when "terms" follows the file.
outside_block() {
    python3 -B - "$1" "${2:-rules}" <<'PY'
import sys
text = open(sys.argv[1], "rb").read()
name = b"plan-terms" if sys.argv[2] == "terms" else b"shared-rules"
begin = text.index(b"<!-- ordo:" + name + b" begin -->")
end = text.index(b"<!-- ordo:" + name + b" end -->")
sys.stdout.buffer.write(text[:begin] + text[end:])
PY
}

# Changes one rule of a repository's block.
drift() {
    sed -i.bak 's/^- \*\*Zero warnings\.\*\*.*/- **Zero warnings.** Mostly./' \
        "$test_root/$1/CLAUDE.md"
}

# Replaces every LF of a file with CRLF.
to_crlf() {
    perl -pi -e 's/\n/\r\n/' "$1"
}

# Changes the first entry of a repository's plan-terms block, in docs/glossary.md or in the file named after the repository.
drift_terms() {
    drifted=$test_root/$1/${2:-docs/glossary.md}
    perl -pi -e 'if (!$done && s/^- \*\*.*/- **drifted**: a changed entry./) { $done = 1 }' "$drifted"
    grep -q '^- \*\*drifted\*\*' "$drifted" || fail "drift_terms changed nothing in $1"
}

# Checks that stdout is exactly the lines given, one per argument.
expect_lines() {
    label=$1
    shift
    wanted=$(printf '%s\n' "$@")
    [ "$output" = "$wanted" ] || fail "$label: stdout is [$output], expected [$wanted]"
}

# The usage line: exit 2, nothing on stdout, and on stderr the one line that names every argument.
usage='Usage: sync_rules.py <repository root> [--write] [--only glossary] [--glossary <path>]'
expect_usage() {
    label=$1
    shift
    expect 2 "$@"
    [ -z "$output" ] || fail "$label: stdout is not empty: [$output]"
    [ "$errors" = "$usage" ] || fail "$label: stderr is [$errors], expected [$usage]"
}

# Moves a repository's glossary to pages/glossary.md, so that the repository holds no docs/glossary.md.
move_glossary() {
    mkdir "$test_root/$1/pages"
    mv "$test_root/$1/docs/glossary.md" "$test_root/$1/pages/glossary.md"
    rmdir "$test_root/$1/docs"
}

# A drifted block, under a preamble holding a tab, trailing spaces and a UTF-8 letter.
make_repo drift
drift drift
printf '# Title\t  \ncaf\303\251  \n' >"$test_root/drift/preamble"
cat "$test_root/drift/preamble" "$test_root/drift/CLAUDE.md" >"$test_root/drift/joined"
mv "$test_root/drift/joined" "$test_root/drift/CLAUDE.md"
outside_block "$test_root/drift/CLAUDE.md" >"$test_root/drift/outside-before"
expect 0 python3 -B "$sync" "$test_root/drift" --write
case "$output" in
    "written: "*) ;;
    *) fail "--write does not print written: [$output]" ;;
esac
expect 0 python3 -B "$sync" "$test_root/drift"
outside_block "$test_root/drift/CLAUDE.md" >"$test_root/drift/outside-after"
cmp -s "$test_root/drift/outside-before" "$test_root/drift/outside-after" ||
    fail "--write changed bytes outside the block"

# A CLAUDE.md that is not UTF-8, with a Latin-1 letter outside a drifted block, is refused by --write and left byte for byte as it was.
make_repo not-utf8
drift not-utf8
printf 'Caf\351 notes\n' >"$test_root/not-utf8/preamble"
cat "$test_root/not-utf8/preamble" "$test_root/not-utf8/CLAUDE.md" >"$test_root/not-utf8/joined"
mv "$test_root/not-utf8/joined" "$test_root/not-utf8/CLAUDE.md"
cp "$test_root/not-utf8/CLAUDE.md" "$test_root/not-utf8/before"
python3 -B "$sync" "$test_root/not-utf8" --write >/dev/null 2>&1
cmp -s "$test_root/not-utf8/before" "$test_root/not-utf8/CLAUDE.md" ||
    fail "--write changed a CLAUDE.md that is not UTF-8"
expect_refusal "CLAUDE.md not UTF-8" "$test_root/not-utf8/CLAUDE.md is not UTF-8" \
    python3 -B "$sync" "$test_root/not-utf8" --write

# Runs sync_rules.py with its open() changed so that what it writes to a path ending in the suffix given goes to the null device.
cat >"$test_root/fake-open.py" <<'PY'
import importlib.util
import os
import sys

suffix, script = sys.argv[1:3]
spec = importlib.util.spec_from_file_location("sync_rules", script)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
real_open = open


def fake_open(path, mode="r", *args, **kwargs):
    if "w" in mode and str(path).endswith(suffix):
        path = os.devnull
    return real_open(path, mode, *args, **kwargs)


module.open = fake_open
sys.exit(module.main(sys.argv[3:]))
PY

# A write that does not take: the script's open() sends what it writes to the null device.
make_repo lost-write
drift lost-write
expect_refusal "lost write" "does not read back as written" \
    python3 -B "$test_root/fake-open.py" CLAUDE.md "$sync" "$test_root/lost-write" --write

# --write with both blocks differing, the glossary in CRLF under a preamble: both rewritten, CRLF kept, every byte outside the markers kept.
make_repo both-write
drift both-write
drift_terms both-write
glossary=$test_root/both-write/docs/glossary.md
printf '# Title\t  \ncaf\303\251  \n' >"$test_root/both-write/preamble"
cat "$test_root/both-write/preamble" "$glossary" >"$test_root/both-write/joined"
mv "$test_root/both-write/joined" "$glossary"
to_crlf "$glossary"
crlf_lines=$(grep -c "$cr\$" "$glossary")
outside_block "$test_root/both-write/CLAUDE.md" >"$test_root/both-write/rules-before"
outside_block "$glossary" terms >"$test_root/both-write/terms-before"
expect 0 python3 -B "$sync" "$test_root/both-write" --write
expect_lines "--write of both blocks" "written: the shared-rules block now equals the template" "written: the plan-terms block now equals the template"
expect 0 python3 -B "$sync" "$test_root/both-write"
crlf_after=$(grep -c "$cr\$" "$glossary")
[ "$crlf_after" = "$crlf_lines" ] || fail "--write left $crlf_after CRLF lines of $crlf_lines in the glossary"
lf_only=$(grep -vc "$cr\$" "$glossary")
[ "$lf_only" = 0 ] || fail "--write left $lf_only lines without CR in a CRLF glossary"
outside_block "$test_root/both-write/CLAUDE.md" >"$test_root/both-write/rules-after"
outside_block "$glossary" terms >"$test_root/both-write/terms-after"
cmp -s "$test_root/both-write/rules-before" "$test_root/both-write/rules-after" ||
    fail "--write changed bytes outside the shared-rules block"
cmp -s "$test_root/both-write/terms-before" "$test_root/both-write/terms-after" ||
    fail "--write changed bytes outside the plan-terms block"

# --only glossary --write on a differing glossary: only the glossary rewritten, a drifted CLAUDE.md left byte for byte.
make_repo only-write
drift only-write
drift_terms only-write
cp "$test_root/only-write/CLAUDE.md" "$test_root/only-write/claude-before"
expect 0 python3 -B "$sync" "$test_root/only-write" --only glossary --write
expect_lines "--only glossary --write" "written: the plan-terms block now equals the template"
cmp -s "$test_root/only-write/claude-before" "$test_root/only-write/CLAUDE.md" ||
    fail "--only glossary --write changed CLAUDE.md"
expect 0 python3 -B "$sync" "$test_root/only-write" --only glossary

# A drifted shared-rules block and no glossary under --write: the glossary's error alone, nothing on stdout, CLAUDE.md unchanged.
no_block="docs/glossary.md has no single plan-terms block ($terms_begin ... $terms_end)"
make_repo drift-no-glossary
drift drift-no-glossary
rm "$test_root/drift-no-glossary/docs/glossary.md"
cp "$test_root/drift-no-glossary/CLAUDE.md" "$test_root/drift-no-glossary/before"
expect_refusal "drifted rules, no glossary, --write" "$no_block" \
    python3 -B "$sync" "$test_root/drift-no-glossary" --write
cmp -s "$test_root/drift-no-glossary/before" "$test_root/drift-no-glossary/CLAUDE.md" ||
    fail "--write changed CLAUDE.md beside a missing glossary"

# --glossary on a repository whose glossary is pages/glossary.md and equals the template: both blocks checked, the glossary alone with --only glossary, and no docs/glossary.md made.
make_repo moved
move_glossary moved
expect 0 python3 -B "$sync" "$test_root/moved" --glossary pages/glossary.md
expect_lines "--glossary on an equal block" "ok: the shared-rules block equals the template" "ok: the plan-terms block equals the template"
expect 0 python3 -B "$sync" "$test_root/moved" --glossary pages/glossary.md --only glossary
expect_lines "--glossary with --only glossary" "ok: the plan-terms block equals the template"
[ ! -e "$test_root/moved/docs/glossary.md" ] || fail "--glossary made a docs/glossary.md"

# --glossary on a drifted block under a preamble: the diff is labelled with the path given, and --write rewrites that file's block, keeps every byte outside it and makes no docs/glossary.md.
make_repo moved-drift
move_glossary moved-drift
drift_terms moved-drift pages/glossary.md
glossary=$test_root/moved-drift/pages/glossary.md
printf '# Title\t  \ncaf\303\251  \n' >"$test_root/moved-drift/preamble"
cat "$test_root/moved-drift/preamble" "$glossary" >"$test_root/moved-drift/joined"
mv "$test_root/moved-drift/joined" "$glossary"
outside_block "$glossary" terms >"$test_root/moved-drift/terms-before"
expect 1 python3 -B "$sync" "$test_root/moved-drift" --glossary pages/glossary.md
case "$output" in
    *"--- pages/glossary.md (plan terms)"*) ;;
    *) fail "--glossary does not label the diff with the path given: [$output]" ;;
esac
expect 0 python3 -B "$sync" "$test_root/moved-drift" --glossary pages/glossary.md --write
expect_lines "--glossary --write" "ok: the shared-rules block equals the template" "written: the plan-terms block now equals the template"
expect 0 python3 -B "$sync" "$test_root/moved-drift" --glossary pages/glossary.md
outside_block "$glossary" terms >"$test_root/moved-drift/terms-after"
cmp -s "$test_root/moved-drift/terms-before" "$test_root/moved-drift/terms-after" ||
    fail "--glossary --write changed bytes outside the plan-terms block"
[ ! -e "$test_root/moved-drift/docs/glossary.md" ] || fail "--glossary --write made a docs/glossary.md"

# --glossary with no path after it, given twice, and written with "=" after the root, before it and with no root: the usage line, and both drifted files left byte for byte under --write.
make_repo bad-option
drift bad-option
drift_terms bad-option
cp "$test_root/bad-option/CLAUDE.md" "$test_root/bad-option/claude-before"
cp "$test_root/bad-option/docs/glossary.md" "$test_root/bad-option/glossary-before"
expect_usage "--glossary with no path" python3 -B "$sync" "$test_root/bad-option" --write --glossary
expect_usage "--glossary given twice" \
    python3 -B "$sync" "$test_root/bad-option" --glossary docs/glossary.md --glossary docs/glossary.md --write
expect_usage "--glossary=<path>" python3 -B "$sync" "$test_root/bad-option" --glossary=docs/glossary.md --write
expect_usage "--glossary=<path> before the root" \
    python3 -B "$sync" --glossary=docs/glossary.md "$test_root/bad-option" --write
expect_usage "--glossary=<path> with no root" python3 -B "$sync" --glossary=docs/glossary.md
cmp -s "$test_root/bad-option/claude-before" "$test_root/bad-option/CLAUDE.md" ||
    fail "a refused --glossary changed CLAUDE.md"
cmp -s "$test_root/bad-option/glossary-before" "$test_root/bad-option/docs/glossary.md" ||
    fail "a refused --glossary changed docs/glossary.md"

# --glossary naming a file outside the root, by "..", by an absolute path and by a link inside the root: the usage line under --write, the drifted file outside and the drifted CLAUDE.md left byte for byte.
make_repo outside
drift outside
drift_terms outside
cp "$test_root/outside/docs/glossary.md" "$test_root/out.md"
cp "$test_root/out.md" "$test_root/out-before"
cp "$test_root/outside/CLAUDE.md" "$test_root/outside/claude-before"
ln -s ../out.md "$test_root/outside/link.md"
expect_usage "--glossary ../out.md" python3 -B "$sync" "$test_root/outside" --glossary ../out.md --write
expect_usage "--glossary with an absolute path outside the root" \
    python3 -B "$sync" "$test_root/outside" --glossary "$test_root/out.md" --write
expect_usage "--glossary with a link to a file outside the root" \
    python3 -B "$sync" "$test_root/outside" --glossary link.md --write
cmp -s "$test_root/out-before" "$test_root/out.md" || fail "--glossary --write changed a file outside the root"
cmp -s "$test_root/outside/claude-before" "$test_root/outside/CLAUDE.md" ||
    fail "a --glossary outside the root changed CLAUDE.md"

# --glossary naming a file that does not exist: the no-single-block error under the path given, and the file not made.
make_repo missing
expect_refusal "--glossary on a missing file" \
    "pages/missing.md has no single plan-terms block ($terms_begin ... $terms_end)" \
    python3 -B "$sync" "$test_root/missing" --glossary pages/missing.md
[ ! -e "$test_root/missing/pages/missing.md" ] || fail "--glossary made the missing file"

printf 'PASS: sync_rules.py scratch tests\n'
