#!/bin/sh
# Exercise collect_findings.py on a scratch ledger whose reports take the shapes of the archived
# refuter reports:
# - dashed findings under numbered and plain headings, a finding on two lines, "none" in both forms;
# - numbered findings, "1." and "3)", with nested points, under "## Spec" and the other headings;
# - a repair round with no subheadings: kinds from the trailing word, a "not reproduced" claim, a
#   ": closed" bullet, a "Closures checked" paragraph, a "Checked and holding" bullet, a finding
#   whose indented second paragraph follows a blank line, and a closure that does not hold, which
#   is a finding;
# - a "## Repair round 1, refuted" section with "### Spec" to "### Behaviour" subheadings, one
#   numbered and one lower case, and a list before them and "### Verification lines",
#   "### Closures", "### Not checked" and "### Usage" lists that are not read;
# - "## Not checked", "## Usage" and "## Closed" lists, and a list under a later "# " heading,
#   that are not read;
# - headings ending in a colon, a full stop, closing hashes or a parenthetical, and a round's
#   "### Spec:";
# - every form of an item that reports nothing ("None found.", "None: ...", "Nothing ...",
#   "No finding ...", "No defect ...", "Otherwise none ...", "Checked, no defect ...", and "the
#   other figures reproduce" in four wordings), beside near misses that are findings;
# - a tilde fence holding a heading and a bullet, a four-tilde fence holding a three-tilde line, a
#   four-backtick fence holding a three-backtick line, a fence line with text after it that does
#   not close its fence, a fence indented under its finding, and a line opening with inline code
#   that is not a fence;
# - a continuation line indented with a tab;
# - an archive inside the ledger root, each report read once;
# - --exclude-listed on a second ledger: runs listed under "## Reports read" by plan folder, step
#   and run, a plan folder holding a space, an entry given twice, a plan moved into the archive
#   after the retro, a round added after the retro, a path quoted outside "## Reports read" and an
#   empty list that exclude nothing, and the refusals of a retro with no "## Reports read" heading,
#   a missing retro, a retro that is not UTF-8, an entry in another form, a run that is not a run,
#   an entry naming ".." as its plan and a missing value.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/collect-findings-test.XXXXXX") ||
    fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
collect=$script_dir/collect_findings.py

# Print "plan step run heading location" for each JSON line on standard input.
rows_of() {
    python3 -c '
import json, sys
for line in sys.stdin:
    if line.strip():
        r = json.loads(line)
        print(r["plan"], r["step"], r["run"], r["heading"], r["location"] or "-")
'
}

reviews=$test_root/.scratch/archive/one-plan/agents/reviews
mkdir -p "$reviews"
cat >"$reviews/1-refuter.md" <<'MD'
# Step 1 refuter report (on .agents/worktrees/one-1, base abc)

## Verification (rerun by the reviewer)

```
- a bullet inside a fence is not a finding
```

## 1. Spec

- src/a.cpp:10: the brief asked for two cases,
  the diff has one.

## 2. Proof

- none.

```text
``` a line with text after the backticks does not close the fence
- a bullet still inside the fence
```

## 3. Standards

- src/a.cpp:12: a comment names the step.

## 4. Behaviour

- None. Nothing changes for a user.

## Not checked

- the benchmark.

## Repair round 1, refuted

```
$ git diff --stat
```

- The second case: closed. It is at src/a.cpp:14.
- src/a.cpp:20: the new guard skips work silently. Behaviour.
- Report row 3, "0 warnings": not reproduced (no clean build).
- src/a.cpp:30: the retry loop never ends.

  Its second paragraph names the kind. Spec.
- Closures checked, all hold:
  - The second case is at src/a.cpp:14.
  - The guard's message names the file.

  Apart from the bullets above, reading the old file again found nothing lost. Spec.
- Checked and holding: the step numbers other files cite are unchanged (src/a.cpp:40). Proof.

## Closed

- src/a.cpp:20: fixed at landing.
MD
cat >"$reviews/2-refuter.md" <<'MD'
# Step 2 refuter report

## Spec

- docs/b.md:3: the page still names the old flag.

```x``` at the start of a line is inline code, not a fence.

- docs/b.md:5: the flag's default is wrong.

## Proof

- none.

# Appendix

- src/z.md:1: a bullet under a level-one heading after the last section is not a finding.
MD
reviews_two=$test_root/.scratch/archive/two-plan/agents/reviews
mkdir -p "$reviews_two"
cat >"$reviews_two/3-refuter.md" <<'MD'
# Step 3 refuter report (on .agents/worktrees/two-3, base def)

## Verification lines

Eight `PASS:` lines of the verify list.

## Spec

1. `src/c.py:5`: the brief asked for a flag,
   the diff has none.
   - The usage line does not name it either.

2. **The page names the wrong default.**
   - Where: docs/c.md:7.
   - Fix: name the default.

````
```
- a bullet after a shorter backtick line is still fenced
````

## Proof

none. Every figure of the report reproduces.

## Standards

~~~text
## Closed
- a bullet inside a tilde fence is not a finding
~~~

3) src/c.py:9: a comment names the step.

## Behaviour

1. none.

## Not checked

1. The real binary.

## Usage

1. 10 tool uses.

## Repair round 1, refuted

HEAD def; the delta is each file against its copy. I checked each closure against the delta:

- Rulings 1 to 3 are real fixes.
- Steps: 1, 2 and 4.

### Verification lines

1. Eight `PASS:` lines of the verify list.

### Closures

1. Spec 1 closed at src/c.py:6.

### 1. Spec

1. src/c.py:11: the round's flag is ignored.

### proof

1. The report's figure is not the command's.

### Standards

- none.

### Behaviour

1. src/c.py:13: the flag now exits 0.

### Not checked

- A real run of the binary.
- Builder plants 1 to 3 were not rerun.

### Usage

1. 5 tool uses.

## Closed

1. Spec 1: fixed at landing.
MD
reviews_space="$test_root/.scratch/archive/plan with space/agents/reviews"
mkdir -p "$reviews_space"
cat >"$reviews_space/4-refuter.md" <<'MD'
# Step 4 refuter

## Spec

1. docs/d.md:2: a finding in a plan whose folder name holds a space.
   ```sh
   - a line inside a fence indented under its finding
   ```
   Its last line follows the fence.
MD
reviews_three=$test_root/.scratch/archive/three-plan/agents/reviews
mkdir -p "$reviews_three"
cat >"$reviews_three/5-refuter.md" <<'MD'
# Step 5 refuter

## Spec

1. None found.
2. None: every figure reproduces.
3. Nothing else: the ASCII check is clean.
4. No finding here.
5. No defect in the new check.
6. Otherwise none: the rest of the brief holds.
7. Checked, no defect found: the renamed flag in every caller.
8. The other figures reproduce.
9. The rest reproduces.
10. Every other figure reproduced.
11. The remaining claims in the report reproduce: 143 lines, 74 rows.
12. Nonempty lists are refused at src/n.py:2.
13. src/n.py:4: nothing rejects a relative path.
14. The other figures reproduce except the line count, which reads 140 where wc -l prints 141.
15. Checked the fix, and the defect remains at src/n.py:6.

## Repair round 1, refuted

- Closure of Spec 2 does not hold: src/n.py:8 still reads the old flag. Proof.
- Closures checked, all hold: Spec 1 and Spec 3.
MD
cat >"$reviews_three/6-refuter.md" <<'MD'
# Step 6 refuter

## Spec:

1. src/h.py:1: under a heading ending in a colon.

~~~~
~~~
- a bullet after a shorter tilde line is still fenced
~~~~

2. src/h.py:7: after a four-tilde fence.

## Proof.

1. src/h.py:2: under a heading ending in a full stop.

## Standards ##

1. src/h.py:3: under a heading with closing hashes.

## Behaviour (none found)

1. src/h.py:4: under a heading with a parenthetical.

## Repair round 1, refuted

### Spec:

1. src/h.py:5: under a round subheading ending in a colon.
MD
printf '2. src/h.py:6: a finding whose second line\n\tis indented with a tab.\n' \
    >>"$reviews_three/6-refuter.md"

# The archive sits inside the ledger root, as in the example plan.yaml; each report is read once.
out=$(python3 "$collect" "$test_root/.scratch" "$test_root/.scratch/archive" 2>/dev/null) ||
    fail "collect_findings.py exited non-zero"
rows=$(printf '%s\n' "$out" | rows_of)
expected='one-plan 1 first spec src/a.cpp:10
one-plan 1 first standards src/a.cpp:12
one-plan 1 round 1 behaviour src/a.cpp:20
one-plan 1 round 1 proof -
one-plan 1 round 1 spec src/a.cpp:30
one-plan 2 first spec docs/b.md:3
one-plan 2 first spec docs/b.md:5
plan with space 4 first spec docs/d.md:2
three-plan 5 first spec src/n.py:2
three-plan 5 first spec src/n.py:4
three-plan 5 first spec -
three-plan 5 first spec src/n.py:6
three-plan 5 round 1 proof src/n.py:8
three-plan 6 first spec src/h.py:1
three-plan 6 first spec src/h.py:7
three-plan 6 first proof src/h.py:2
three-plan 6 first standards src/h.py:3
three-plan 6 first behaviour src/h.py:4
three-plan 6 round 1 spec src/h.py:5
three-plan 6 round 1 spec src/h.py:6
two-plan 3 first spec src/c.py:5
two-plan 3 first spec docs/c.md:7
two-plan 3 first standards src/c.py:9
two-plan 3 round 1 spec src/c.py:11
two-plan 3 round 1 proof -
two-plan 3 round 1 behaviour src/c.py:13'
printf '%s\n' "$expected" >"$test_root/expected"
printf '%s\n' "$rows" >"$test_root/got"
[ "$rows" = "$expected" ] || fail "rows differ from the expected rows (- expected, + got):
$(diff "$test_root/expected" "$test_root/got" | grep '^[<>]' | sed 's/^</-/; s/^>/+/')"
case "$out" in
    *"the diff has one."*) ;;
    *) fail "a finding's continuation line was not joined" ;;
esac
case "$out" in
    *"the diff has none. - The usage line does not name it either."*) ;;
    *) fail "a numbered finding's nested point was not joined" ;;
esac
case "$out" in
    *"never ends. Its second paragraph names the kind. Spec."*) ;;
    *) fail "a finding's second paragraph was not joined" ;;
esac
case "$out" in
    *"holds a space. Its last line follows the fence."*) ;;
    *) fail "a fence indented under its finding was read into the finding" ;;
esac
case "$out" in
    *"a finding whose second line is indented with a tab."*) ;;
    *) fail "a continuation line indented with a tab was not joined" ;;
esac

# --exclude-listed runs on a second ledger, with an open plan "p" and an archived plan "q r".
ex=$test_root/ex
mkdir -p "$ex/.scratch/p/agents/reviews" "$ex/.scratch/archive/q r/agents/reviews"
printf '# Step 1 refuter\n\n## Spec\n\n1. a.md:1: a first-run finding.\n' \
    >"$ex/.scratch/p/agents/reviews/1-refuter.md"
cat >"$ex/.scratch/archive/q r/agents/reviews/2-refuter.md" <<'MD'
# Step 2 refuter

## Spec

1. b.md:1: a first-run finding.

## Repair round 1, refuted

- b.md:2: a round finding. Spec.
MD
cd "$ex" || fail "could not enter the second ledger"
# Print the sorted distinct "plan/step/run" of the findings left after the given retro.
exclude() {
    python3 "$collect" --exclude-listed "$1" .scratch .scratch/archive 2>/dev/null | python3 -c '
import json, sys
rows = [json.loads(l) for l in sys.stdin if l.strip()]
print(", ".join(sorted({"%s/%s/%s" % (r["plan"], r["step"], r["run"]) for r in rows})))
'
}
cat >retro.md <<'MD'
# Retro

## Reports read

- `p/agents/reviews/1-refuter.md`: first
- `q r/agents/reviews/2-refuter.md`: first
MD
rest=$(exclude retro.md)
[ "$rest" = "q r/2/round 1" ] || fail "the runs listed left [$rest], expected [q r/2/round 1]"
mv "$ex/.scratch/p" "$ex/.scratch/archive/p" || fail "could not move the plan into the archive"
rest=$(exclude retro.md)
[ "$rest" = "q r/2/round 1" ] ||
    fail "after the move into the archive the runs listed left [$rest], expected [q r/2/round 1]"
printf '\n## Repair round 1, refuted\n\n- a.md:2: a round added after the retro. Spec.\n' \
    >>"$ex/.scratch/archive/p/agents/reviews/1-refuter.md"
rest=$(exclude retro.md)
[ "$rest" = "p/1/round 1, q r/2/round 1" ] ||
    fail "a round added after the retro left [$rest], expected [p/1/round 1, q r/2/round 1]"
cat >retro-twice.md <<'MD'
# Retro

## Reports read

- `q r/agents/reviews/2-refuter.md`: first
- `q r/agents/reviews/2-refuter.md`: round 1
MD
rest=$(exclude retro-twice.md)
[ "$rest" = "p/1/first, p/1/round 1" ] ||
    fail "an entry given twice left [$rest], expected [p/1/first, p/1/round 1]"
cat >retro-outside.md <<'MD'
# Retro

Collected with `python3 collect_findings.py .scratch .scratch/archive`.

## Reports read

## Recurring kinds

- `p/agents/reviews/1-refuter.md`: first
MD
rest=$(exclude retro-outside.md)
[ "$rest" = "p/1/first, p/1/round 1, q r/2/first, q r/2/round 1" ] ||
    fail "an empty Reports read list, with an entry quoted outside it, left [$rest]"

# Check that the retro file $1 is refused with exit status 2 and the message $2.
refused() {
    err=$(python3 "$collect" --exclude-listed "$1" .scratch 2>&1 >/dev/null)
    status=$?
    [ "$status" = 2 ] || fail "retro $1 exited $status, expected 2"
    [ "$err" = "$2" ] || fail "retro $1 printed [$err], expected [$2]"
}
printf '# Retro\n\nReports read: `p/agents/reviews/1-refuter.md`: first\n' >retro-no-heading.md
refused retro-no-heading.md \
    "collect_findings.py: retro-no-heading.md has no '## Reports read' heading"
refused no-such-retro.md "collect_findings.py: cannot read no-such-retro.md"
printf '\377\n' >retro-binary.md
refused retro-binary.md "collect_findings.py: cannot read retro-binary.md"
entry_form='- `<plan>/agents/reviews/<step>-refuter.md`: <run>, ...'
printf '# Retro\n\n## Reports read\n\n- `%s`\n' \
    "$ex/.scratch/archive/p/agents/reviews/1-refuter.md" >retro-old-form.md
refused retro-old-form.md "collect_findings.py: retro-old-form.md:5: an entry is $entry_form"
printf '# Retro\n\n## Reports read\n\n- `../agents/reviews/1-refuter.md`: first\n' >retro-dots.md
refused retro-dots.md "collect_findings.py: retro-dots.md:5: an entry is $entry_form"
printf '# Retro\n\n## Reports read\n\n- `p/agents/reviews/1-refuter.md`: first, round one\n' \
    >retro-run.md
refused retro-run.md \
    "collect_findings.py: retro-run.md:5: 'round one' is not a run: first or round <n>"
err=$(python3 "$collect" --exclude-listed 2>&1 >/dev/null)
status=$?
[ "$status" = 2 ] || fail "--exclude-listed with no value exited $status, expected 2"
[ "$err" = "Usage: collect_findings.py [--exclude-listed <earlier retro>] <folder>..." ] ||
    fail "--exclude-listed with no value printed [$err]"

printf 'PASS: collect_findings.py scratch tests\n'
