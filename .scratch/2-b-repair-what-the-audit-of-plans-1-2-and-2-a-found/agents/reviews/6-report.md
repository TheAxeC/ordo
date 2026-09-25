# Step 6 report: collect_findings.py reads the reports as the reviewers write them

Everything in the brief is done.

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- I (raised 2026-09-25 by step 5's builder, `agents/reviews/5-report.md`): a reproduction run of `utils/pin.sh` with the session's `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` still set created one link in the user's real skill folder, `/Users/axelfaes/.claude-work/skills/alpha`, pointing at a scratch folder that no longer exists; nothing else there changed (`ls /Users/axelfaes/.claude-work/skills/` lists alpha, the ten Ordo skills and synced). The builder's removal was refused by the runner's permission check, so the orchestrator does not remove it either. Options: (a) the user removes it with `! rm /Users/axelfaes/.claude-work/skills/alpha`, and every later brief that runs a tool touching skill folders unsets `CLAUDE_CONFIG_DIR` and names every variable that reaches a real folder; (b) leave it. Recommended (a): it is a dangling link the step made in a folder the user's rules keep untouched. (b) is the lazy option.
- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## DONE / NOT DONE

| # | Item | State | Proof |
|---|---|---|---|
| 1 | Numbered findings (`- `, `<n>. `, `<n>) `, with indented lines) | DONE | reverts 1 and 21 below, red |
| 2 | `###` subheadings in a round give the heading, numbered or not, either case | DONE | reverts 2, 19, 20 and 25, red |
| 3 | Verification, Not checked, Closed, Closures, Usage skipped at `##` and `###`; closure items skipped | DONE | reverts 3, 4 and 5, red |
| 4 | Backtick and tilde fences of three or more, to their closing fence | DONE | reverts 6, 7, 8, 22 and 23, red |
| 5 | `--exclude-listed` reads backtick-quoted paths under "## Reports read", compares by real path | DONE | reverts 12, 13, 14, 15, 16, 18, 24 and 26, red |
| 6 | Test fixtures in the archived shapes, each case red under its revert, head comment names the cases | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1` prints `PASS: collect_findings.py scratch tests`; 26 reverts, 26 red |
| 7 | The count over `.scratch/archive` agrees with a hand count of reports of plans 1, 2 and 2.A | DONE | "The count" below: 18/18, 23/23, 17/17, 29/29 |
| 8 | README.md:119 says what the test covers | DONE | the diff under "User-visible changes" |
| 9 | Output shape unchanged (plan, step, report, run, heading, location, text) | DONE | the test's `rows_of` reads those keys from every line; `skills/plan-retro/SKILL.md:42` unchanged and true |
| 10 | `sh utils/verify.sh <state file>` | DONE | output below, exit 0 |
| 11 | ASCII, no history, lines of about 100 characters | DONE | ASCII check empty (exit 0); `awk 'length > 100'` over both files prints nothing |

### Verification

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
verify exit 0
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as in docs/dev/change-standard.md); echo "ascii exit $?"
ascii exit 0
$ awk 'length > 100 {print FILENAME":"FNR": "length}' skills/plan-retro/templates/collect_findings.py skills/plan-retro/templates/collect_findings.test.sh
(no output)
$ grep -rn -E '\bbullets\(|Reports read|exclude-listed|heading styles' skills utils docs README.md | grep -v '^skills/plan-retro/templates/collect_findings'
skills/plan-retro/SKILL.md:31:3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list.
skills/plan-retro/SKILL.md:40:   python3 <this skill's folder>/templates/collect_findings.py [--exclude-listed <previous retro>] <ledger_root> <archive_root>
skills/plan-retro/SKILL.md:44:   - The previous retro is passed to `--exclude-listed` unless the user asks for a retro over everything.
skills/plan-retro/templates/retro.md:5:## Reports read
README.md:119:- `collect_findings.test.sh` runs the collector over reports ... (the new line)
```

Every grep hit outside the collector still holds: the retro template lists each report as a backtick-quoted path under `## Reports read`, which is what `--exclude-listed` now reads. `bullets()` is renamed `items()`; it has no caller outside the collector.

### The test, red first

The new test run against the collector as it stood on the base (before any change to it):

```
$ sh skills/plan-retro/templates/collect_findings.test.sh; echo "exit $?"
FAIL: rows differ:
two-plan 3 first spec -
one-plan 1 first spec src/a.cpp:10
one-plan 1 first proof -
one-plan 2 first spec docs/b.md:3
expected:
one-plan 1 first spec src/a.cpp:10
one-plan 1 first standards src/a.cpp:12
one-plan 1 round 1 behaviour src/a.cpp:20
one-plan 1 round 1 proof -
one-plan 1 round 1 spec src/a.cpp:30
one-plan 2 first spec docs/b.md:3
plan with space 4 first spec docs/d.md:2
two-plan 3 first spec src/c.py:5
two-plan 3 first spec docs/c.md:7
two-plan 3 first standards src/c.py:9
two-plan 3 round 1 spec src/c.py:11
two-plan 3 round 1 proof -
two-plan 3 round 1 behaviour src/c.py:13
exit 1
```

(That run used the first form of the test; its later cases were added with the changes they cover, each shown red below, and the row mismatch now prints a diff.) The subheaded round's list before its subheadings was added as a case after the rest, and was red on the collector without that rule:

```
$ sh skills/plan-retro/templates/collect_findings.test.sh; echo "exit $?"
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
exit 1
```

### Reverts

Each revert is one edit to a copy of the final collector under `$TMPDIR/rv/<n>/`, with the final test copied beside it and run with `sh`; revert 26 also removes the space case from the copied test so that the spelled-another-way case runs. The edits, as `(label, text in the collector, text it is replaced by[, (text in the test, replacement)])`:

```python
R = [
 ("numbered items not read: ITEM matches '- ' only",
  'ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- )")'),
 ("round subheadings ignored: a subsection keeps the section's heading",
  'yield run, sub if sub in HEADINGS else fixed, lines', 'yield run, fixed, lines'),
 ("Verification, Not checked, Closed, Closures, Usage subsections read",
  '        if NOT_READ.match(sub):\n            continue\n', ''),
 ("a lead 'Closures' is not a closure",
  '|^closures?\\b|', '|'),
 ("a lead 'Checked and holding' is not a closure",
  '|^checked and holding\\b|', '|'),
 ("tilde fences not recognised",
  'FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"\\s*(`{3,})(.*)$")'),
 ("a shorter fence line closes the fence",
  ' and len(match.group(1)) >= len(fence):', ':'),
 ("a fence line with text after it closes the fence",
  '            if not match.group(2).strip():\n                fence = None', '            fence = None'),
 ("an indented paragraph after a blank line ends the item",
  '        elif current is None or not line.strip():\n            continue\n',
  '        elif current is None:\n            continue\n        elif not line.strip():\n            yield current\n            current = None\n'),
 ("a level-one heading does not end a level-two section",
  '        higher = HEADING_LINE.match(line) and len(line) - len(line.lstrip("#")) < level\n',
  '        higher = False\n'),
 ("'None. <more>' is a finding",
  ' or item.lower().startswith("none.")', ''),
 ("excluded paths compared as spelled",
  '            return {os.path.realpath(path) for path in quoted}', '            return set(quoted)'),
 ("excluded paths read from the whole retro",
  '            quoted = re.findall(r"`([^`]+)`", "\\n".join(body))',
  '            quoted = re.findall(r"`([^`]+)`", "\\n".join(lines))'),
 ("a retro with no Reports read heading excludes nothing",
  '    return None\n\n\ndef main', '    return set()\n\n\ndef main'),
 ("a missing retro is not caught",
  '        except (OSError, UnicodeDecodeError):', '        except UnicodeDecodeError:'),
 ("--exclude-listed with no value is not refused",
  '        if len(argv) < 2:\n            print(usage, file=sys.stderr)\n            return 2\n', ''),
 ("folders walked in the file system's order",
  '            dirnames.sort()\n', ''),
 ("an empty Reports read list is refused as no list",
  '            return {os.path.realpath(path) for path in quoted}',
  '            return {os.path.realpath(path) for path in quoted} or None'),
 ("the leading number is kept in a heading's name",
  'heading = NUMBER.sub("", line[len(marker):].strip()).lower()',
  'heading = line[len(marker):].strip().lower()'),
 ("a heading's name keeps its case",
  'heading = NUMBER.sub("", line[len(marker):].strip()).lower()',
  'heading = NUMBER.sub("", line[len(marker):].strip())'),
 ("'<n>) ' items not read",
  'ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- |\\d+\\. )")'),
 ("a backtick line whose info string holds a backtick opens a fence",
  'if match and not (match.group(1)[0] == "`" and "`" in match.group(2)):', 'if match:'),
 ("fences recognised at the start of a line only",
  'FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"(`{3,}|~{3,})(.*)$")'),
 ("a retro that is not UTF-8 is not caught",
  '        except (OSError, UnicodeDecodeError):', '        except OSError:'),
 ("a subheaded round's list before its subheadings is read",
  '    if not any(sub in HEADINGS for sub, _ in subsections):\n', '    if True:\n'),
 ("excluded paths compared as spelled, the space case taken out of the test copy",
  '            return {os.path.realpath(path) for path in quoted}', '            return set(quoted)',
  ('rest=$(exclude retro-space.md)\n', 'rest="one-plan/1 one-plan/2 two-plan/3"\n')),
]
```

Output of every run, verbatim (the scratch folder path shown as `<scratch>`, the copy's folder as `<copy>`):

```
$ python3 $TMPDIR/revert.py
--- 1. numbered items not read: ITEM matches '- ' only (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- plan with space 4 first spec docs/d.md:2
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
--- 2. round subheadings ignored: a subsection keeps the section's heading (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 round 1 unclassified src/c.py:11
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:13
--- 3. Verification, Not checked, Closed, Closures, Usage subsections read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:6
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 4. a lead 'Closures' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 spec src/a.cpp:14
--- 5. a lead 'Checked and holding' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 proof src/a.cpp:40
--- 6. tilde fences not recognised (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
--- 7. a shorter fence line closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 first spec -
--- 8. a fence line with text after it closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 first proof -
--- 9. an indented paragraph after a blank line ends the item (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 round 1 unclassified src/a.cpp:30
--- 10. a level-one heading does not end a level-two section (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 2 first proof src/z.md:1
--- 11. 'None. <more>' is a finding (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first behaviour -
--- 12. excluded paths compared as spelled (exit 1)
FAIL: a listed path holding a space left [one-plan/1 one-plan/2 plan with space/4 two-plan/3]
--- 13. excluded paths read from the whole retro (exit 1)
FAIL: a path spelled another way, or quoted outside Reports read, left [one-plan/2 plan with space/4]
--- 14. a retro with no Reports read heading excludes nothing (exit 1)
FAIL: a retro with no Reports read heading exited 0, expected 2
--- 15. a missing retro is not caught (exit 1)
FAIL: a missing retro exited 1, expected 2
--- 16. --exclude-listed with no value is not refused (exit 1)
FAIL: --exclude-listed with no value exited 1, expected 2
--- 17. folders walked in the file system's order (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 first spec src/c.py:5
+ two-plan 3 first spec docs/c.md:7
+ two-plan 3 first standards src/c.py:9
+ two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 proof -
+ two-plan 3 round 1 behaviour src/c.py:13
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
--- 18. an empty Reports read list is refused as no list (exit 1)
FAIL: an empty Reports read list left []
--- 19. the leading number is kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 unclassified src/c.py:11
--- 20. a heading's name keeps its case (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
- one-plan 2 first spec docs/b.md:3
- one-plan 2 first spec docs/b.md:5
- plan with space 4 first spec docs/d.md:2
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+
--- 21. '<n>) ' items not read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
--- 22. a backtick line whose info string holds a backtick opens a fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 2 first spec docs/b.md:5
--- 23. fences recognised at the start of a line only (exit 1)
FAIL: a fence indented under its finding was read into the finding
--- 24. a retro that is not UTF-8 is not caught (exit 1)
FAIL: a retro that is not UTF-8 exited 1, expected 2
--- 25. a subheaded round's list before its subheadings is read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 26. excluded paths compared as spelled, the space case taken out of the test copy (exit 1)
FAIL: a path spelled another way, or quoted outside Reports read, left [one-plan/1 one-plan/2 plan with space/4 two-plan/3]
```

26 runs, 26 exit 1, no PASS line.

## The count

```
$ python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l
642 findings
     642
$ python3 skills/plan-retro/templates/collect_findings.py .scratch/archive > $TMPDIR/cf-archive.jsonl
547 findings
$ python3 -c '<count rows, reports and headings>' $TMPDIR/cf-archive.jsonl
547 rows, 23 reports, {'spec': 241, 'standards': 116, 'behaviour': 86, 'proof': 104}
```

The hand count: for each report, the line ranges of its read sections, taken from `grep -nE '^(#|```|~~~)'` over the report, and the item lines in each counted with `grep -cE '^(- |[0-9]+[.)] )'`, against the collector's rows for that report:

```
$ item='^(- |[0-9]+[.)] )'; a=.scratch/archive
$ count() { f=$1; shift; t=0; for range in "$@"; do n=$(sed -n "${range}p" "$f" | grep -cE "$item"); printf '%s=%s ' "$range" "$n"; t=$((t+n)); done; printf '| items %s | collector %s\n' "$t" "$(grep -c "\"report\": \"$f\"" $TMPDIR/cf-archive.jsonl)"; }
$ count $a/1-one-layout-for-every-skill/agents/reviews/11-refuter.md 43,56 57,60 61,65 66,70 77,137
43,56=11 57,60=1 61,65=2 66,70=2 77,137=4 | items 20 | collector 18
$ count $a/1-one-layout-for-every-skill/agents/reviews/13-refuter.md 55,68 69,74 75,79 80,85 124,127 128,131 132,135 136,139
55,68=11 69,74=3 75,79=2 80,85=3 124,127=1 128,131=1 132,135=1 136,139=1 | items 23 | collector 23
$ count $a/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md 64,90 91,94 95,106 107,118 162,169 170,173 174,177 178,182
64,90=4 91,94=0 95,106=2 107,118=2 162,169=5 170,173=1 174,177=1 178,182=2 | items 17 | collector 17
$ count $a/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md 7,13 14,21 22,29 30,35 52,57 58,63 64,70 71,75
7,13=4 14,21=5 22,29=5 30,35=3 52,57=3 58,63=3 64,70=4 71,75=2 | items 29 | collector 29
$ sed -n '57,60p;77,137p' $a/1-one-layout-for-every-skill/agents/reviews/11-refuter.md | grep -E "$item" | grep -E '^- (none|Closures)'
- none.
- Closures checked, all hold:
```

- Plan 1, step 11 (dashed findings, a round with no subheadings): 20 item lines, less `- none.` under Proof and the `Closures checked` item in the round, is 18. The collector gives 18.
- Plan 1, step 13 (numbered findings, a round with subheadings): 23 and 23.
- Plan 2, step 3 (numbered findings with nested points, numbering running across sections, a Proof paragraph that is not an item, `### Closures`): 17 and 17.
- Plan 2.A, step 3 (numbered findings, a round with subheadings and a Usage section): 29 and 29.

The per-report totals also match the review's own counts for the reports it named: plan 2.A steps 1 and 3 give 31 and 29, plan 2 steps 4, 5 and 6 give 39, 37 and 45.

## Files

| File | Lines (`wc -l`) | `git diff --stat` |
|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 227 (was 140) | 219 lines changed |
| `skills/plan-retro/templates/collect_findings.test.sh` | 343 (was 96) | 293 lines changed |
| `README.md` | 175 | 2 +- (line 119) |

`git status --short` shows these three files modified and nothing else.

## Judgment calls the brief left open

1. **A round's closure items.** Besides ": closed" and a lead "Closed", an item that opens with "Closure", "Closures" (the brief's "Closures checked" style, plan 1 step 11) or "Checked and holding" (plan 1 step 8, `8-refuter.md:116`, the same kind of confirmation) is not a finding. Plan 1 step 9's round item at `9-refuter.md:113` ("... No finding here. Behaviour.") stays a behaviour finding, since it opens with a path and names its own heading.
2. **A subheaded round's text before its subheadings.** In a round that has at least one Spec, Proof, Standards or Behaviour subheading, the lines before the first subheading are not read. Plan 2.B's open `2-refuter.md:174-190` holds two such lists, closures checked and inventory rows sampled, which came out as 14 unclassified rows otherwise. A round with none of the four subheadings (the plan 1 shape) is read whole, by the trailing heading word.
3. **Other subheadings.** Inside a round, the items of a `###` subsection that is neither one of the four nor a skipped name take the trailing-word rule; inside a first-run section, they keep the section's heading.
4. **What an item is.** A finding is recognised by its shape, as the brief defines it. A numbered item that confirms rather than faults (plan 1 step 13, Proof 3, "The other figures in the report reproduce") counts, and so does it in the hand count. A paragraph that is not an item (plan 2 step 3, Proof, "none. Every figure ...") is not a finding.
5. **Continuation.** An item takes its indented lines, and an indented paragraph after a blank line (plan 1 step 11, `11-refuter.md:134`). An unindented line ends it: joining unindented lines changes no row or text over `.scratch` and `.scratch/archive` (the outputs compared with `cmp` were identical), so that rule was left out.
6. **Fences.** A fence may be indented (plan 2.B's `1-refuter.md:240` holds fences inside numbered findings). A backtick line whose info string holds a backtick is inline code, not a fence (CommonMark). A closing line has the fence's character, at least its length, and nothing after it (plan 1 step 2, `2-refuter.md:146-147`, holds such non-closing lines inside a fence).
7. **Section ends.** A level-two section also ends at a level-one heading.
8. **Order.** Folders are walked in sorted order, so the output is the same on every file system.
9. **`--exclude-listed` inputs.** A relative path under "Reports read" resolves from the current directory, the repository root the skill runs the collector from. A retro that is missing or not UTF-8 is refused with `collect_findings.py: cannot read <retro>`, one with no "## Reports read" heading with `collect_findings.py: <retro> has no '## Reports read' heading`, and `--exclude-listed` with no value with the usage line; each exits 2. An empty list under the heading excludes nothing. A folder argument that does not exist is not refused, as before: the skill passes `<archive_root>`, which a repository with no closed plan does not have yet.
10. **The test's row mismatch** prints the rows that differ, `-` expected and `+` got, instead of both full lists, and its JSON helpers skip blank lines, so a run with no findings shows as missing rows rather than a Python traceback.

## User-visible changes

- The collector's output over the ledgers. Before: `.scratch/archive` gave 276 rows from 18 of the 23 reports, `{'unclassified': 20, 'spec': 135, 'standards': 43, 'behaviour': 40, 'proof': 38}`; `.scratch .scratch/archive` gave 308. After: `.scratch/archive` gives 547 rows from all 23 reports, `{'spec': 241, 'standards': 116, 'behaviour': 86, 'proof': 104}`, none unclassified; `.scratch .scratch/archive` gives 642.
- `--exclude-listed`. Before: any `...-refuter.md` token anywhere in the file, compared as spelled, split on whitespace. After: the backtick-quoted paths under "## Reports read", compared by real path; the three refusals above (exit 2).
- The head comment of `collect_findings.py` states the new reading, the refusals and the path order.
- README.md:119. Before: "`collect_findings.test.sh` checks that the collector reads both heading styles of a refuter report and its repair rounds, skips closures and "none", reads a report once when the archive sits inside the ledger root, and starts after a previous retro." After:

  > - `collect_findings.test.sh` runs the collector over reports in the shapes the refuter writes: dashed and numbered findings under numbered and plain headings, and repair rounds with and without `### Spec` to `### Behaviour` subheadings. It checks that the Verification, Not checked, Closed, Closures and Usage lists, a subheaded round's list before its subheadings, closures and "none" give no finding, and that backtick and tilde fences of any length are skipped, indented ones included. It also checks that a report is read once when the archive sits inside the ledger root. With `--exclude-listed`, the reports quoted under the earlier retro's "Reports read" heading are skipped by real path, a path holding a space included, and a retro with no such heading, a missing retro and one that is not UTF-8 are refused.

## What the brief got wrong or left impossible

- The premises reproduce: `git show HEAD:skills/plan-retro/templates/collect_findings.py | wc -l` gives 140, the test 96, and the base collector printed 308 over `.scratch .scratch/archive` (`wc -l`, 308).
- One effect of the real-path key the brief fixes, for the orchestrator to rule on: a report listed while its plan is open (`.scratch/<plan>/...`) is read again by the next retro once the plan folder moves into `.scratch/archive/`, because its real path changes. Shown on a scratch ledger under `$TMPDIR`:

  ```
  $ python3 collect_findings.py --exclude-listed retro.md .scratch .scratch/archive | wc -l   # retro lists .scratch/p/agents/reviews/1-refuter.md
  0 findings
         0
  $ mv .scratch/p .scratch/archive/p
  $ python3 collect_findings.py --exclude-listed retro.md .scratch .scratch/archive | wc -l
  1 findings
         1
  ```

  A key that survives the move (for example the plan folder's name, the step and the file name) would be a change to the matching the brief specifies, so it is not made here.
