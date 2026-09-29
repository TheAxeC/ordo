#!/bin/sh
# Exercise sync_rules.py on scratch repositories whose CLAUDE.md holds the shared-rules block and whose docs/glossary.md holds the plan-terms block, each filled from its template.
# The check exits 1 on a drifted block and prints its diff, and --write then makes the block equal the template, keeping every byte outside the block, in an LF file under a preamble holding a tab, trailing spaces and a UTF-8 letter, and in a CRLF file, where the block is written in CRLF too.
# Each of these is refused with exit 2 and one error line on stderr, stdout empty: reversed markers, a second begin marker, a second block, a CLAUDE.md that is not UTF-8 (whose bytes --write leaves as they were), and a --write whose file does not read back as written.
# The glossary's block is checked after the shared-rules block, with its own ok:, written: and diff lines. A missing glossary, one with no single block (none, two, reversed, or a marker quoted in prose), a directory, a glossary that is not UTF-8, a missing plan-terms.md, and a write of the glossary that fails or does not read back are each refused with exit 2.
# Every input is checked before anything is written or printed on stdout: a drifted shared-rules block beside a missing glossary writes nothing, and two files in error print two error lines, CLAUDE.md's first. With --write, a failed write of CLAUDE.md leaves the glossary unwritten.
# --only glossary checks the glossary alone and never reads CLAUDE.md. --only with no value, with another value, twice or as --only=glossary, and a second path, print the usage line and exit 2.

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
begin='<!-- ordo:shared-rules begin -->'
end='<!-- ordo:shared-rules end -->'
terms_begin='<!-- ordo:plan-terms begin -->'
terms_end='<!-- ordo:plan-terms end -->'
usage='Usage: sync_rules.py <repository root> [--write] [--only glossary]'
cr=$(printf '\r')

# A repository whose CLAUDE.md and docs/glossary.md are the templates with their blocks filled in, and no other file. Red when the check requires another file beside them, as a symlink AGENTS.md.
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

# Changes the first entry of a repository's plan-terms block.
drift_terms() {
    perl -pi -e 'if (!$done && s/^- \*\*.*/- **drifted**: a changed entry./) { $done = 1 }' \
        "$test_root/$1/docs/glossary.md"
    grep -q '^- \*\*drifted\*\*' "$test_root/$1/docs/glossary.md" || fail "drift_terms changed nothing in $1"
}

# A refusal with the usage line: exit 2, nothing on stdout, the usage line alone on stderr.
expect_usage() {
    label=$1
    shift
    expect 2 "$@"
    [ -z "$output" ] || fail "$label: stdout is not empty: [$output]"
    [ "$errors" = "$usage" ] || fail "$label: stderr is not the usage line: [$errors]"
}

# Checks that stdout is exactly the lines given, one per argument.
expect_lines() {
    label=$1
    shift
    wanted=$(printf '%s\n' "$@")
    [ "$output" = "$wanted" ] || fail "$label: stdout is [$output], expected [$wanted]"
}

# A drifted block, under a preamble holding a tab, trailing spaces and a UTF-8 letter.
make_repo drift
drift drift
printf '# Title\t  \ncaf\303\251  \n' >"$test_root/drift/preamble"
cat "$test_root/drift/preamble" "$test_root/drift/CLAUDE.md" >"$test_root/drift/joined"
mv "$test_root/drift/joined" "$test_root/drift/CLAUDE.md"
outside_block "$test_root/drift/CLAUDE.md" >"$test_root/drift/outside-before"
expect 1 python3 -B "$sync" "$test_root/drift"
[ -z "$errors" ] || fail "a drifted block printed on stderr: [$errors]"
case "$output" in
    *"-- **Zero warnings.** Mostly."*) ;;
    *) fail "the diff does not show the drifted line: $output" ;;
esac
expect 0 python3 -B "$sync" "$test_root/drift" --write
case "$output" in
    "written: "*) ;;
    *) fail "--write does not print written: [$output]" ;;
esac
expect 0 python3 -B "$sync" "$test_root/drift"
outside_block "$test_root/drift/CLAUDE.md" >"$test_root/drift/outside-after"
cmp -s "$test_root/drift/outside-before" "$test_root/drift/outside-after" ||
    fail "--write changed bytes outside the block"

# The same drift in a CRLF file: --write keeps CRLF on every line, the block's included.
make_repo crlf
drift crlf
to_crlf "$test_root/crlf/CLAUDE.md"
crlf_lines=$(grep -c "$cr\$" "$test_root/crlf/CLAUDE.md")
outside_block "$test_root/crlf/CLAUDE.md" >"$test_root/crlf/outside-before"
expect 1 python3 -B "$sync" "$test_root/crlf"
expect 0 python3 -B "$sync" "$test_root/crlf" --write
expect 0 python3 -B "$sync" "$test_root/crlf"
crlf_after=$(grep -c "$cr\$" "$test_root/crlf/CLAUDE.md")
[ "$crlf_after" = "$crlf_lines" ] || fail "--write left $crlf_after CRLF lines of $crlf_lines"
lf_only=$(grep -vc "$cr\$" "$test_root/crlf/CLAUDE.md")
[ "$lf_only" = 0 ] || fail "--write left $lf_only lines without CR in a CRLF file"
outside_block "$test_root/crlf/CLAUDE.md" >"$test_root/crlf/outside-after"
cmp -s "$test_root/crlf/outside-before" "$test_root/crlf/outside-after" ||
    fail "--write changed bytes outside the block of a CRLF file"

make_repo reversed
perl -pi -e "s/\\Q$begin\\E/MARK/; s/\\Q$end\\E/$begin/; s/MARK/$end/" \
    "$test_root/reversed/CLAUDE.md"
grep -q "$end" "$test_root/reversed/CLAUDE.md" || fail "the reversed fixture lost its markers"
expect_refusal "reversed markers" "no single shared-rules block" \
    python3 -B "$sync" "$test_root/reversed"

make_repo two-begins
perl -pi -e "print \"$begin\\n\" if /\\Q$begin\\E/" "$test_root/two-begins/CLAUDE.md"
expect_refusal "two begin markers" "no single shared-rules block" \
    python3 -B "$sync" "$test_root/two-begins"

make_repo two-blocks
printf '%s\nrules\n%s\n' "$begin" "$end" >>"$test_root/two-blocks/CLAUDE.md"
expect_refusal "two blocks" "no single shared-rules block" \
    python3 -B "$sync" "$test_root/two-blocks"

# A CLAUDE.md that is not UTF-8, with a Latin-1 letter outside a drifted block, is refused by --write and left byte for byte as it was. Red when the file is decoded with replacement characters, which --write would then write over the user's letter.
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

# Runs sync_rules.py with its open() changed for a write to a path ending in the suffix given: "lost" sends what it writes to the null device, "denied" raises a permission error.
cat >"$test_root/fake-open.py" <<'PY'
import errno
import importlib.util
import os
import sys

how, suffix, script = sys.argv[1:4]
spec = importlib.util.spec_from_file_location("sync_rules", script)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
real_open = open


def fake_open(path, mode="r", *args, **kwargs):
    if "w" in mode and str(path).endswith(suffix):
        if how == "denied":
            raise PermissionError(errno.EACCES, os.strerror(errno.EACCES), path)
        path = os.devnull
    return real_open(path, mode, *args, **kwargs)


module.open = fake_open
sys.exit(module.main(sys.argv[4:]))
PY

# A write that does not take: the script's open() sends what it writes to the null device.
make_repo lost-write
drift lost-write
expect_refusal "lost write" "does not read back as written" \
    python3 -B "$test_root/fake-open.py" lost CLAUDE.md "$sync" "$test_root/lost-write" --write

# Both blocks equal their templates: an ok: line for each, the shared-rules block's first.
make_repo equal
expect 0 python3 -B "$sync" "$test_root/equal"
[ -z "$errors" ] || fail "equal blocks printed on stderr: [$errors]"
expect_lines "equal blocks" "ok: the shared-rules block equals the template" "ok: the plan-terms block equals the template"

# The glossary block differs by one line: exit 1, the shared-rules ok: line, then the glossary's diff under its labels.
make_repo terms-drift
drift_terms terms-drift
expect 1 python3 -B "$sync" "$test_root/terms-drift"
[ -z "$errors" ] || fail "a drifted glossary printed on stderr: [$errors]"
case "$output" in
    "ok: the shared-rules block equals the template
--- docs/glossary.md (plan terms)
+++ template
"*"-- **drifted**: a changed entry."*) ;;
    *) fail "a drifted glossary does not print the ok: line and its diff: [$output]" ;;
esac

# Both blocks differ: exit 1, both diffs, CLAUDE.md's first.
make_repo both-drift
drift both-drift
drift_terms both-drift
expect 1 python3 -B "$sync" "$test_root/both-drift"
case "$output" in
    "--- CLAUDE.md (shared rules)"*"-- **Zero warnings.** Mostly."*"--- docs/glossary.md (plan terms)"*"-- **drifted**: a changed entry."*) ;;
    *) fail "two drifted blocks do not print both diffs in order: [$output]" ;;
esac

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

no_block="docs/glossary.md has no single plan-terms block ($terms_begin ... $terms_end)"

# No docs/glossary.md.
make_repo no-glossary
rm "$test_root/no-glossary/docs/glossary.md"
expect_refusal "no glossary" "$no_block" python3 -B "$sync" "$test_root/no-glossary"

# A glossary with no block, with two blocks, and with the end marker before the begin marker.
make_repo no-terms-block
perl -ni -e "print unless /\\Q$terms_begin\\E|\\Q$terms_end\\E/" "$test_root/no-terms-block/docs/glossary.md"
expect_refusal "glossary with no block" "$no_block" python3 -B "$sync" "$test_root/no-terms-block"
make_repo two-terms-blocks
printf '%s\nterms\n%s\n' "$terms_begin" "$terms_end" >>"$test_root/two-terms-blocks/docs/glossary.md"
expect_refusal "glossary with two blocks" "$no_block" python3 -B "$sync" "$test_root/two-terms-blocks"
make_repo reversed-terms
perl -pi -e "s/\\Q$terms_begin\\E/MARK/; s/\\Q$terms_end\\E/$terms_begin/; s/MARK/$terms_end/" \
    "$test_root/reversed-terms/docs/glossary.md"
grep -q "$terms_end" "$test_root/reversed-terms/docs/glossary.md" || fail "the reversed glossary lost its markers"
expect_refusal "glossary with reversed markers" "$no_block" python3 -B "$sync" "$test_root/reversed-terms"

# A marker string quoted in a line of prose counts as a marker, so the glossary has no single block.
make_repo quoted-marker
printf 'The block opens with `%s`.\n' "$terms_begin" >>"$test_root/quoted-marker/docs/glossary.md"
expect_refusal "a marker quoted in prose" "$no_block" python3 -B "$sync" "$test_root/quoted-marker"

# A glossary that is not UTF-8, checked and under --write, whose bytes stay as they were.
make_repo terms-not-utf8
drift_terms terms-not-utf8
printf 'Caf\351 notes\n' >>"$test_root/terms-not-utf8/docs/glossary.md"
cp "$test_root/terms-not-utf8/docs/glossary.md" "$test_root/terms-not-utf8/before"
expect_refusal "glossary not UTF-8" "$test_root/terms-not-utf8/docs/glossary.md is not UTF-8 (byte " \
    python3 -B "$sync" "$test_root/terms-not-utf8"
expect_refusal "glossary not UTF-8, --write" "$test_root/terms-not-utf8/docs/glossary.md is not UTF-8 (byte " \
    python3 -B "$sync" "$test_root/terms-not-utf8" --write
cmp -s "$test_root/terms-not-utf8/before" "$test_root/terms-not-utf8/docs/glossary.md" ||
    fail "--write changed a glossary that is not UTF-8"

# A glossary that is a directory.
make_repo terms-dir
rm "$test_root/terms-dir/docs/glossary.md"
mkdir "$test_root/terms-dir/docs/glossary.md"
expect_refusal "glossary a directory" "cannot read $test_root/terms-dir/docs/glossary.md: Is a directory" \
    python3 -B "$sync" "$test_root/terms-dir"

# plan-terms.md missing beside the script: a copy of the script with shared-rules.md and no plan-terms.md.
mkdir "$test_root/lone-script"
cp "$sync" "$script_dir/shared-rules.md" "$test_root/lone-script/"
make_repo lone
expect_refusal "no plan-terms.md" "cannot read $test_root/lone-script/plan-terms.md: No such file or directory" \
    python3 -B "$test_root/lone-script/sync_rules.py" "$test_root/lone"

# --only glossary with no CLAUDE.md: exit 0 on an equal block, 1 on a differing one.
make_repo only-no-claude
rm "$test_root/only-no-claude/CLAUDE.md"
expect 0 python3 -B "$sync" "$test_root/only-no-claude" --only glossary
expect_lines "--only glossary, equal" "ok: the plan-terms block equals the template"
drift_terms only-no-claude
expect 1 python3 -B "$sync" "$test_root/only-no-claude" --only glossary
case "$output" in
    "--- docs/glossary.md (plan terms)"*"-- **drifted**: a changed entry."*) ;;
    *) fail "--only glossary on a drifted block does not print its diff: [$output]" ;;
esac

# --only glossary beside a drifted shared-rules block, and beside none: the glossary alone decides.
make_repo only-drifted-rules
drift only-drifted-rules
expect 0 python3 -B "$sync" "$test_root/only-drifted-rules" --only glossary
expect_lines "--only glossary beside a drifted shared-rules block" "ok: the plan-terms block equals the template"
make_repo only-no-rules-block
perl -ni -e "print unless /\\Q$begin\\E|\\Q$end\\E/" "$test_root/only-no-rules-block/CLAUDE.md"
expect 0 python3 -B "$sync" "$test_root/only-no-rules-block" --only glossary
expect_lines "--only glossary beside no shared-rules block" "ok: the plan-terms block equals the template"

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

# The arguments: --only glossary before the path is accepted; the rest print the usage line.
make_repo args
expect 0 python3 -B "$sync" --only glossary "$test_root/args"
expect_lines "--only glossary before the path" "ok: the plan-terms block equals the template"
expect_usage "--only with another value" python3 -B "$sync" "$test_root/args" --only rules
expect_usage "two paths" python3 -B "$sync" "$test_root/args" "$test_root/args"
expect_usage "--only last with no value" python3 -B "$sync" "$test_root/args" --only
expect_usage "--only=glossary" python3 -B "$sync" "$test_root/args" --only=glossary
expect_usage "--only=glossary with no other argument" python3 -B "$sync" --only=glossary
expect_usage "--only glossary twice" python3 -B "$sync" "$test_root/args" --only glossary --only glossary

# A drifted shared-rules block and no glossary, with and without --write: the glossary's error alone, nothing on stdout, CLAUDE.md unchanged.
make_repo drift-no-glossary
drift drift-no-glossary
rm "$test_root/drift-no-glossary/docs/glossary.md"
cp "$test_root/drift-no-glossary/CLAUDE.md" "$test_root/drift-no-glossary/before"
expect_refusal "drifted rules, no glossary" "$no_block" python3 -B "$sync" "$test_root/drift-no-glossary"
expect_refusal "drifted rules, no glossary, --write" "$no_block" \
    python3 -B "$sync" "$test_root/drift-no-glossary" --write
cmp -s "$test_root/drift-no-glossary/before" "$test_root/drift-no-glossary/CLAUDE.md" ||
    fail "--write changed CLAUDE.md beside a missing glossary"

# CLAUDE.md with no single block and no glossary: two error lines, CLAUDE.md's first, nothing on stdout.
make_repo two-errors
perl -ni -e "print unless /\\Q$begin\\E/" "$test_root/two-errors/CLAUDE.md"
rm "$test_root/two-errors/docs/glossary.md"
expect 2 python3 -B "$sync" "$test_root/two-errors"
[ -z "$output" ] || fail "two files in error printed on stdout: [$output]"
[ "$errors" = "error: CLAUDE.md has no single shared-rules block ($begin ... $end)
error: $no_block" ] || fail "two files in error do not print both error lines in order: [$errors]"

# --write with only the glossary block differing: the shared-rules ok: line, the glossary's written: line, CLAUDE.md unchanged.
make_repo terms-write
drift_terms terms-write
cp "$test_root/terms-write/CLAUDE.md" "$test_root/terms-write/before"
expect 0 python3 -B "$sync" "$test_root/terms-write" --write
expect_lines "--write of the glossary alone" "ok: the shared-rules block equals the template" "written: the plan-terms block now equals the template"
cmp -s "$test_root/terms-write/before" "$test_root/terms-write/CLAUDE.md" ||
    fail "--write of the glossary alone changed CLAUDE.md"

# --write where CLAUDE.md cannot be written: its error line, and the drifted glossary not written.
make_repo claude-denied
drift claude-denied
drift_terms claude-denied
cp "$test_root/claude-denied/docs/glossary.md" "$test_root/claude-denied/before"
expect_refusal "CLAUDE.md not writable" "cannot write $test_root/claude-denied/CLAUDE.md: Permission denied" \
    python3 -B "$test_root/fake-open.py" denied CLAUDE.md "$sync" "$test_root/claude-denied" --write
cmp -s "$test_root/claude-denied/before" "$test_root/claude-denied/docs/glossary.md" ||
    fail "a failed write of CLAUDE.md went on to write the glossary"

# The glossary cannot be written, or does not read back as written.
make_repo terms-denied
drift_terms terms-denied
expect 2 python3 -B "$test_root/fake-open.py" denied glossary.md "$sync" "$test_root/terms-denied" --write
[ "$errors" = "error: cannot write $test_root/terms-denied/docs/glossary.md: Permission denied" ] ||
    fail "a glossary that cannot be written does not print its error line: [$errors]"
make_repo terms-lost
drift_terms terms-lost
expect 2 python3 -B "$test_root/fake-open.py" lost glossary.md "$sync" "$test_root/terms-lost" --write
[ "$errors" = "error: $test_root/terms-lost/docs/glossary.md does not read back as written" ] ||
    fail "a glossary that does not read back does not print its error line: [$errors]"

printf 'PASS: sync_rules.py scratch tests\n'
