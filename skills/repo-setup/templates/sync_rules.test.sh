#!/bin/sh
# Exercise sync_rules.py on scratch repositories. A block equal to the template passes, with the
# CLAUDE.md or the template in LF or in CRLF. A drifted block fails with its diff on stdout, and
# --write repairs it, keeping every byte outside the block and writing the block in the ending most
# lines use (CRLF in a file CRLF on every line but its first), the first line's on a tie. Each
# of these is refused with exit 2 and one error line on stderr, stdout empty: a missing block,
# reversed markers, a second begin or end marker, a second block, a missing AGENTS.md symlink, a
# missing CLAUDE.md, a CLAUDE.md or shared-rules.md that is not UTF-8, a missing shared-rules.md, a
# CLAUDE.md --write cannot open and a write that does not read back as written.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/sync-rules-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'chmod -R u+w "$test_root" 2>/dev/null; rm -rf "$test_root"' 0 1 2 3 15
test_root=$(CDPATH= cd "$test_root" && pwd -P) || fail "could not resolve the scratch directory"
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
sync=$script_dir/sync_rules.py
begin='<!-- ordo:shared-rules begin -->'
end='<!-- ordo:shared-rules end -->'
cr=$(printf '\r')

# A repository whose CLAUDE.md is the template with the shared rules filled in, and AGENTS.md
# linked to it.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo"
    python3 -B - "$script_dir" "$repo/CLAUDE.md" <<'PY'
import sys
here, out = sys.argv[1], sys.argv[2]
text = open(f"{here}/CLAUDE.md").read()
rules = open(f"{here}/shared-rules.md").read().strip("\n")
begin = "<!-- ordo:shared-rules begin -->\n"
text = text.replace(begin, begin + rules + "\n")
open(out, "w").write(text)
PY
    ln -s CLAUDE.md "$repo/AGENTS.md"
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

# Writes the bytes of a file before its begin marker and from its end marker on, for cmp.
outside_block() {
    python3 -B - "$1" <<'PY'
import sys
text = open(sys.argv[1], "rb").read()
begin = text.index(b"<!-- ordo:shared-rules begin -->")
end = text.index(b"<!-- ordo:shared-rules end -->")
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

make_repo same
expect 0 python3 -B "$sync" "$test_root/same"
case "$output" in
    "ok: "*) ;;
    *) fail "a block equal to the template does not print ok: [$output]" ;;
esac

make_repo same-crlf
to_crlf "$test_root/same-crlf/CLAUDE.md"
expect 0 python3 -B "$sync" "$test_root/same-crlf"

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

# A file CRLF on every line but its first: the block takes the ending most lines use.
make_repo mixed
drift mixed
to_crlf "$test_root/mixed/CLAUDE.md"
perl -pi -e 's/\r\n/\n/ if $. == 1' "$test_root/mixed/CLAUDE.md"
mixed_lines=$(grep -c "$cr\$" "$test_root/mixed/CLAUDE.md")
outside_block "$test_root/mixed/CLAUDE.md" >"$test_root/mixed/outside-before"
expect 0 python3 -B "$sync" "$test_root/mixed" --write
mixed_after=$(grep -c "$cr\$" "$test_root/mixed/CLAUDE.md")
[ "$mixed_after" = "$mixed_lines" ] ||
    fail "mixed: --write left $mixed_after CRLF lines of $mixed_lines"
mixed_lf=$(grep -vc "$cr\$" "$test_root/mixed/CLAUDE.md")
[ "$mixed_lf" = 1 ] ||
    fail "mixed: --write left $mixed_lf lines without CR, expected the first one only"
outside_block "$test_root/mixed/CLAUDE.md" >"$test_root/mixed/outside-after"
cmp -s "$test_root/mixed/outside-before" "$test_root/mixed/outside-after" ||
    fail "mixed: --write changed bytes outside the block"

# Makes a drifted repository whose lines are half CRLF and half LF, the first line in the ending
# given ($2: crlf or lf); --write must then write the block in the first line's ending.
tie_case() {
    make_repo "$1"
    drift "$1"
    python3 -B - "$test_root/$1/CLAUDE.md" "$2" <<'PY'
import sys
path, first = sys.argv[1], sys.argv[2]
lines = open(path, newline="").read().split("\n")[:-1]
if len(lines) % 2:
    lines.append("")
half = len(lines) // 2
crlf = [i < half for i in range(len(lines))]
if first == "lf":
    crlf.reverse()
open(path, "w", newline="").write("".join(l + ("\r\n" if c else "\n") for l, c in zip(lines, crlf)))
PY
    expect 0 python3 -B "$sync" "$test_root/$1" --write
    tie_endings=$(python3 -B - "$test_root/$1/CLAUDE.md" <<'PY'
import sys
text = open(sys.argv[1], "rb").read()
block = text[text.index(b"begin -->") + 9:text.index(b"<!-- ordo:shared-rules end -->")]
lines = block.split(b"\n")[:-1]
ends = {l.endswith(b"\r") for l in lines}
print("crlf" if ends == {True} else "lf" if ends == {False} else "mixed")
PY
)
    [ "$tie_endings" = "$2" ] ||
        fail "$1: a tie wrote the block in $tie_endings, expected $2 as the first line"
}
tie_case tie-crlf crlf
tie_case tie-lf lf

make_repo no-block
sed -i.bak '/ordo:shared-rules/d' "$test_root/no-block/CLAUDE.md"
expect_refusal "no block" "no single shared-rules block" python3 -B "$sync" "$test_root/no-block"

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

make_repo two-ends
perl -pi -e "print \"$end\\n\" if /\\Q$end\\E/" "$test_root/two-ends/CLAUDE.md"
expect_refusal "two end markers" "no single shared-rules block" \
    python3 -B "$sync" "$test_root/two-ends"

make_repo two-blocks
printf '%s\nrules\n%s\n' "$begin" "$end" >>"$test_root/two-blocks/CLAUDE.md"
expect_refusal "two blocks" "no single shared-rules block" \
    python3 -B "$sync" "$test_root/two-blocks"

make_repo no-link
rm "$test_root/no-link/AGENTS.md"
cp "$test_root/no-link/CLAUDE.md" "$test_root/no-link/AGENTS.md"
expect_refusal "no symlink" "AGENTS.md is not a symlink to CLAUDE.md" \
    python3 -B "$sync" "$test_root/no-link"

# No CLAUDE.md, while AGENTS.md is a symlink to where it would be.
mkdir -p "$test_root/no-claude"
ln -s CLAUDE.md "$test_root/no-claude/AGENTS.md"
expect_refusal "no CLAUDE.md" "no CLAUDE.md in $test_root/no-claude" \
    python3 -B "$sync" "$test_root/no-claude"

mkdir -p "$test_root/not-utf8"
printf 'a\n%s\n\377\n%s\n' "$begin" "$end" >"$test_root/not-utf8/CLAUDE.md"
ln -s CLAUDE.md "$test_root/not-utf8/AGENTS.md"
expect_refusal "CLAUDE.md not UTF-8" "$test_root/not-utf8/CLAUDE.md is not UTF-8" \
    python3 -B "$sync" "$test_root/not-utf8"

# The script copied to a folder with no shared-rules.md, then with a CRLF one, then with one that
# is not UTF-8.
mkdir -p "$test_root/no-template"
cp "$sync" "$test_root/no-template/sync_rules.py"
expect_refusal "no shared-rules.md" "cannot read $test_root/no-template/shared-rules.md" \
    python3 -B "$test_root/no-template/sync_rules.py" "$test_root/same"
cp "$script_dir/shared-rules.md" "$test_root/no-template/shared-rules.md"
to_crlf "$test_root/no-template/shared-rules.md"
expect 0 python3 -B "$test_root/no-template/sync_rules.py" "$test_root/same"
printf 'rules \377\n' >"$test_root/no-template/shared-rules.md"
expect_refusal "shared-rules.md not UTF-8" "$test_root/no-template/shared-rules.md is not UTF-8" \
    python3 -B "$test_root/no-template/sync_rules.py" "$test_root/same"

make_repo read-only
drift read-only
chmod a-w "$test_root/read-only/CLAUDE.md"
expect_refusal "read-only CLAUDE.md" "cannot write $test_root/read-only/CLAUDE.md" \
    python3 -B "$sync" "$test_root/read-only" --write

# A write that does not take: the script's open() sends what it writes to the null device.
make_repo lost-write
drift lost-write
cat >"$test_root/lost-write.py" <<'PY'
import importlib.util
import os
import sys

spec = importlib.util.spec_from_file_location("sync_rules", sys.argv[1])
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
real_open = open


def lost_write(path, mode="r", *args, **kwargs):
    return real_open(os.devnull if "w" in mode else path, mode, *args, **kwargs)


module.open = lost_write
sys.exit(module.main(sys.argv[2:]))
PY
expect_refusal "lost write" "does not read back as written" \
    python3 -B "$test_root/lost-write.py" "$sync" "$test_root/lost-write" --write

printf 'PASS: sync_rules.py scratch tests\n'
