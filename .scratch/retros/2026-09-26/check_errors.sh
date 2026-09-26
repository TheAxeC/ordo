#!/bin/sh
# Runs every Python script under utils/ and skills/*/templates/ on a missing path, a directory and a
# non-UTF-8 file, and prints each run that ends in a Python traceback; exits 1 when any does.
# Run from the repository root.
tmp=$(mktemp -d) || exit 1
trap 'rm -rf "$tmp"' EXIT
mkdir "$tmp/dir"
printf 'x\200\n' > "$tmp/notutf8.md"
bad=0
for s in utils/*.py skills/*/templates/*.py; do
    for a in "$tmp/missing.md" "$tmp/dir" "$tmp/notutf8.md"; do
        if python3 "$s" "$a" "$a" </dev/null 2>&1 | grep -q '^Traceback'; then
            echo "traceback: $s $(basename "$a")"
            bad=1
        fi
    done
done
exit $bad
