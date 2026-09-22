#!/bin/sh
# Exercise sync_rules.py on scratch repositories: a block equal to the template passes, a drifted
# block fails with its diff and --write repairs it, and a missing block or a missing AGENTS.md
# symlink is refused.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/sync-rules-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
sync=$script_dir/sync_rules.py

# A repository whose CLAUDE.md is the template with the shared rules filled in, and AGENTS.md linked to it.
make_repo() {
    repo=$test_root/$1
    mkdir -p "$repo"
    python3 - "$script_dir" "$repo/CLAUDE.md" <<'PY'
import sys
here, out = sys.argv[1], sys.argv[2]
text = open(f"{here}/CLAUDE.md").read()
rules = open(f"{here}/shared-rules.md").read().strip("\n")
text = text.replace("<!-- ordo:shared-rules begin -->\n", "<!-- ordo:shared-rules begin -->\n" + rules + "\n")
open(out, "w").write(text)
PY
    ln -s CLAUDE.md "$repo/AGENTS.md"
}

expect() {
    status=$1
    shift
    output=$(python3 "$sync" "$@")
    actual=$?
    [ "$actual" = "$status" ] || fail "$*: exit $actual, expected $status: $output"
}

make_repo same
expect 0 "$test_root/same"

make_repo drift
sed -i.bak 's/^- \*\*Zero warnings\.\*\*.*/- **Zero warnings.** Mostly./' "$test_root/drift/CLAUDE.md"
expect 1 "$test_root/drift"
case "$output" in
    *"-- **Zero warnings.** Mostly."*) ;;
    *) fail "the diff does not show the drifted line: $output" ;;
esac
expect 0 "$test_root/drift" --write
expect 0 "$test_root/drift"
grep -q '^## Project rules' "$test_root/drift/CLAUDE.md" || fail "--write lost the text after the block"

make_repo no-block
sed -i.bak '/ordo:shared-rules/d' "$test_root/no-block/CLAUDE.md"
expect 2 "$test_root/no-block"

make_repo no-link
rm "$test_root/no-link/AGENTS.md"
cp "$test_root/no-link/CLAUDE.md" "$test_root/no-link/AGENTS.md"
expect 2 "$test_root/no-link"

printf 'PASS: sync_rules.py scratch tests\n'
