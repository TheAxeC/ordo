#!/bin/sh
# Exercise sync_rules.py --write on scratch repositories whose CLAUDE.md holds the shared-rules block and whose docs/glossary.md holds the plan-terms block, each filled from its template.
# Each case is kept because its failure loses text of the user's outside the block, leaves a file written that does not hold what was meant, or writes one file when the run was refused.
# --write makes a drifted block equal the template and keeps every byte outside the block, in an LF file under a preamble holding a tab, trailing spaces and a UTF-8 letter, and in a CRLF glossary, where the block is written in CRLF too.
# A CLAUDE.md that is not UTF-8 is refused and its bytes stay as they were, and a --write whose file does not read back as written is refused.
# --only glossary --write rewrites the glossary alone and leaves a drifted CLAUDE.md byte for byte.
# A drifted shared-rules block beside a missing glossary writes nothing, since every input is checked before anything is written.

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

# Changes the first entry of a repository's plan-terms block.
drift_terms() {
    perl -pi -e 'if (!$done && s/^- \*\*.*/- **drifted**: a changed entry./) { $done = 1 }' \
        "$test_root/$1/docs/glossary.md"
    grep -q '^- \*\*drifted\*\*' "$test_root/$1/docs/glossary.md" || fail "drift_terms changed nothing in $1"
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

printf 'PASS: sync_rules.py scratch tests\n'
