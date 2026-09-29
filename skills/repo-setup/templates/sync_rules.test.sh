#!/bin/sh
# Exercise sync_rules.py on scratch repositories whose CLAUDE.md holds a drifted shared-rules block.
# The check exits 1 on the drifted block and prints its diff, and --write then makes the block equal the template, keeping every byte outside the block, in an LF file under a preamble holding a tab, trailing spaces and a UTF-8 letter, and in a CRLF file, where the block is written in CRLF too.
# Each of these is refused with exit 2 and one error line on stderr, stdout empty: reversed markers, a second begin marker, a second block, a CLAUDE.md that is not UTF-8 (whose bytes --write leaves as they were), and a --write whose file does not read back as written.

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
cr=$(printf '\r')

# A repository whose CLAUDE.md is the template with the shared rules filled in, and no other file. Red when the check requires another file beside CLAUDE.md, as a symlink AGENTS.md.
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
