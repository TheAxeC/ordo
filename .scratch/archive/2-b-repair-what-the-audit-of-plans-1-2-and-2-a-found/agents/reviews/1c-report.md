# Step 1c report

Everything in the brief and in the eight rulings of repair round 1 is done.

## Open items of the state file (verbatim)

- none.

## The cases' first run on the unchanged tree

The cases were written as the tests of `skills/spec/templates/check_paths.test.sh` and run before `check_paths.py` existed, one run per case (a copy of the test under `$TMPDIR` whose `fail` prints and goes on). The brief's nine cases:

```
FAIL: none in flight: exit 2, expected 0 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: different files: exit 2, expected 0 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: whole against a range: exit 2, expected 1 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: adjacent ranges: exit 2, expected 0 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: ranges sharing a line: exit 2, expected 1 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: no yaml block: exit 2, expected 64 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: no paths section: exit 2, expected 64 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: a path line in neither shape: exit 2, expected 64 [] [python3: can't open file check_paths.py: No such file or directory]
FAIL: a reversed range: exit 2, expected 64 [] [python3: can't open file check_paths.py: No such file or directory]
```

The same run held 29 further cases, each red with the same exit 2 on the missing script. `grep -c '^FAIL:' $TMPDIR/1c-first/first-run.txt` prints `38` (9 + 29); the file's 39th line is the copy's closing `PASS:` line. The test now holds 47 cases: those 38, three edges added once the script existed ("an empty dispatch list", "a boolean step", "an empty yaml block") and six added in repair round 1. The red of the nine added later is shown by their reverts below.

No case of the brief's "Cases" is got wrong by the brief's own rules. The brief's premise about where the dispatch block is was wrong ("What the brief got wrong").

## Result table

| Item | State | Command and its output |
|---|---|---|
| 1. Brief template: `## Cases` with the builder's first task and the hand-back, `## Paths this step writes` with both line shapes and the report path, "Report" asks for the cases' first run before the table | DONE | `grep -n '^## ' skills/spec/templates/brief.md` prints `13:## Cases` and `21:## Paths this step writes`, between "What to build" (9) and "Decisions taken in this brief" (29) |
| 2. `skills/spec/templates/check_paths.py` and `check_paths.test.sh` | DONE | `sh skills/spec/templates/check_paths.test.sh 2>&1 \| tail -1` and the same under `dash` print `PASS: check_paths.py scratch tests` |
| 3. `spec`: Steps 3 writes both sections, Steps 4 runs the check and refuses, Stops rows | DONE | `python3 utils/check_skill_layout.py` prints `ok: skills/spec/SKILL.md` |
| 4. `refute`: two findings under Spec | DONE | `ok: skills/refute/SKILL.md`; `grep -n 'Cases\|first run on' skills/refute/SKILL.md` prints 80 and 81 |
| 5. `plan-orchestration`: "Two steps in flight" names the section and the check; Steps 6 rules a wrong case or stops | DONE | `ok: skills/plan-orchestration/SKILL.md`; Steps 6 at 63-65, "Two steps in flight" at 138-140 |
| 6. The test lists and the README bullet | DONE | `grep -n check_paths.test.sh README.md docs/dev/*.md` prints `docs/dev/change-standard.md:48`, `docs/dev/building.md:12`, `README.md:111`, `README.md:124` |
| Verify 1: the verify list through the runner with the Doc text line | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh "$TMPDIR/state-1c.md"` exits 0; `grep -c '^PASS:'` of its output prints 11, `grep -c '^ok:'` prints 10; lines below |
| Verify 2: the test | DONE | `PASS: check_paths.py scratch tests` |
| Verify 3: the ledger's own state file | DONE | `python3 skills/spec/templates/check_paths.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md 1c` prints `ok: 1c shares no path with no step in flight`, exit 0 (the worktree's copy has `dispatch: none`) |
| Verify 4: every case red under its revert | DONE | 50 reverts over the 47 cases, each test run exits 1; the case list of the test and the case list of the reverts are the same (`diff` of the two sorted lists prints nothing); table below |

The runner's lines after the round (exit 0):

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
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
verify: 13 commands passed
```

The green run does not cover a real `/spec` run through the new Steps 4, nor a builder's hand-back of a wrong case through `plan-orchestration`.

## Repair round 1

| Ruling | State | Command and its output |
|---|---|---|
| 1. The mirror of "whole against a range" | DONE | case "a range against a whole file" (1x `README.md` lines 3-4, 1y `README.md` whole) expects `shared: README.md (lines 3-4) in 1x and whole in 1y`, exit 1; revert 43 (revert A) turns it red |
| 2. The de-duplication of `shared:` lines | DONE | case "a path listed twice" (1x lists `a.sh` twice, 1y lists it once) expects one `shared:` line; revert 44 (revert B) turns it red |
| 3. A `###` heading inside the section | DONE | case "a subheading in the section" (`- a.sh`, `### The documents`, `- b.md`; 1y lists `b.md`) expects `shared: b.md (whole) in 1x and whole in 1y`; revert 45 (revert C) turns it red |
| 4. The first-run count | DONE | `grep -c '^FAIL:' $TMPDIR/1c-first/first-run.txt` prints `38`; the section above says 38 |
| 5. A refusal at Steps 4 leaves nothing | DONE | `skills/spec/SKILL.md:66`: "A refusal here leaves nothing: the brief and any amendment of `plan.md` made at Steps 2 are restored to main's copies (`git restore -- <path>`, or the brief deleted when main has none), and no commit, worktree or dispatch block is made."; `:67`: "`/spec` run again redoes Steps 2 from the start, so the premise checks and their amendments are made again on the tree as it then is." `grep -n "leave\|leaves\|refusal" skills/spec/SKILL.md`: the other refusals (30, 33, 35, 38, 46) come before any write, and `:103` ("the rest are refusals, which name their cause and leave nothing") is true of Steps 4 now |
| 6. A dispatch block written as a single mapping | DONE | `check_paths.py:121-124` reads a `dict` as a list of that one entry; the error reads `the dispatch: key of <state> is neither none, an entry with step:, nor a list of entries with step:` (`grep -rn "neither none" skills docs README.md` prints only `check_paths.py:32`, `:121` and `check_paths.test.sh:19`, `:303`; `spec` and the docs do not quote the wording); `skills/spec/SKILL.md:75` (Steps 8): "The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives: one entry, `dispatch:` followed by its keys, when `workers_at_once` is 1; appended to the list of entries when it is above 1."; cases "a single entry" (exit 0), "a single entry sharing a path" (exit 1), "a single entry without step" (exit 64); reverts 46-50 |
| 7. "Before any code changes" gets a mechanism | DONE | `skills/spec/templates/brief.md:19`: the builder stops at a case the brief's rules get wrong and hands back the first run and that case before changing any code; the orchestrator rules and resumes it; the final report carries the ruling. `skills/plan-orchestration/SKILL.md:63-65`: read the hand-back like a report, rule inside the scope, write `agents/briefs/<step>-cases.md` as the round-0 ruling file, commit it, resume the same builder by Steps 8 ("How"), a stop of the kind "A finding that is the user's" when the scope changes. `grep -rn "with the findings (Steps 8)" skills docs README.md` prints nothing. The template's Report (`:57`) and `spec`'s Steps 3 (`:58`) now name the ruling and the hand-back |
| 8. `plan-help` names the new refusal | DONE | `skills/plan-help/SKILL.md:68`: "/spec refuses ... the brief's "Paths this step writes" shares a path with a step in flight, or a state file or brief it reads is unusable: it names the cause and leaves nothing; land the other step or change the paths, then /spec again"; `python3 utils/check_skill_layout.py` prints `ok: skills/plan-help/SKILL.md` |

The README's bullet for the test names the cases the round added (a dispatch block written as one entry, a file named whole in either brief, a path listed twice, a path after a `###` heading).

## Reverts and their red lines

Each revert was applied to a copy of `check_paths.py` beside a copy of the test under `$TMPDIR`, and the test run; every run exits 1. The fourth column is the test's first `FAIL:` line. The fifth is the case's own `FAIL:` line, from a second copy of the test whose `fail` prints and goes on; it is shown where another case fails first under the same revert. Paths under the scratch ledger are shortened to `.../`, and lines are cut at 220 characters. Reverts 43-50 are the round's.

| # | Case | Revert in `check_paths.py` | First `FAIL:` line of the test | The case's own `FAIL:` line |
|---|---|---|---|---|
| 1 | none in flight | `dispatch == "none"` made `"None"` | `` FAIL: none in flight: exit 64, expected 0 [] [error: the dispatch: key of .../orchestrator-state.md is neither none, an entry with step:, nor a list of entries with step:] `` | the same line |
| 2 | different files | the path comparison in `shared` dropped | `` FAIL: different files: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] [] `` | the same line |
| 3 | ranges compared as numbers | `inside` stays true after the next heading | `` FAIL: ranges compared as numbers: exit 1, expected 0 [shared: y (lines 1-2) in 1x and lines 1-2 in 1y] [] `` | the same line |
| 4 | whole against a range | a whole file never shared | `` FAIL: whole against a range: exit 0, expected 1 [ok: 1x shares no path with 1y] [] `` | the same line |
| 5 | adjacent ranges | overlap tested with `+ 1` | `` FAIL: adjacent ranges: exit 1, expected 0 [shared: README.md (lines 1-9) in 1x and lines 10-12 in 1y] [] `` | the same line |
| 6 | ranges sharing a line | overlap tested with `<` | `` FAIL: ranges sharing a line: exit 0, expected 1 [ok: 1x shares no path with 1y] [] `` | the same line |
| 7 | no yaml block | the "has no yaml block" refusal dropped | `` FAIL: no yaml block: printed [error: no yaml block of .../orchestrator-state.md has a dispatch: key], expected [error: ...has no yaml block...] `` | the same line |
| 8 | no paths section | the "has no ... section" refusal dropped | `` FAIL: no paths section: printed [error: .../agents/briefs/1y.md lists no path under '## Paths this step writes'], expected [error: ....../agents/briefs/1y.md has no '## Paths this step writes' section...] `` | the same line |
| 9 | a path line in neither shape | a malformed item skipped | `` FAIL: a path line in neither shape: printed [error: .../agents/briefs/1x.md lists no path under '## Paths this step writes'], expected [error: ....../agents/briefs/1x.md:9: '- README.md, somewhere' is not...] `` | the same line |
| 10 | a reversed range | the end-before-start refusal dropped | `` FAIL: a reversed range: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 11 | the dispatch block in the second yaml block | only the first yaml block read | `` FAIL: the dispatch block in the second yaml block: exit 64, expected 1 [] [error: no yaml block of .../orchestrator-state.md has a dispatch: key] `` | the same line |
| 12 | its own entry | the step not dropped from the steps in flight | `` FAIL: its own entry: exit 1, expected 0 [shared: README.md (whole) in 1x and whole in 1x] [] `` | the same line |
| 13 | three steps | a step named twice kept twice | `` FAIL: three steps: printed [ok: 1x shares no path with 1y, 1z, 1y], expected [ok: 1x shares no path with 1y, 1z] `` | the same line |
| 14 | shared with two steps | only the first step in flight compared | `` FAIL: shared with two steps: printed [shared: a.sh (whole) in 1x and whole in 1y], expected [shared: a.sh (whole) in 1x and whole in 1y `` | the same line |
| 15 | a path spelled two ways | `posixpath.normpath` dropped | `` FAIL: a path spelled two ways: exit 0, expected 1 [ok: 1x shares no path with 1y] [] `` | the same line |
| 16 | ranges compared as numbers | the `int()` conversions dropped | `` FAIL: ranges compared as numbers: exit 1, expected 0 [shared: a.md (lines 2-8) in 1x and lines 10-20 in 1y] [] `` | the same line |
| 17 | prose in the section | every non-blank line read as a path line | `` FAIL: a subheading in the section: exit 64, expected 1 [] [error: .../agents/briefs/1x.md:11: '### The documents' is not - `<path>` or - `<path>` lines <a>-<b>] `` | `` FAIL: prose in the section: exit 64, expected 0 [] [error: .../agents/briefs/1x.md:9: 'One path per line.' is not - `<path>` or - `<path>` lines <a>-<b>] `` |
| 18 | a path after a fence | a fence never closes | `` FAIL: a path after a fence: exit 64, expected 1 [] [error: .../agents/briefs/1y.md has no '## Paths this step writes' section] `` | the same line |
| 19 | fenced lines | fenced lines read | `` FAIL: fenced lines: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] [] `` | the same line |
| 20 | no step argument | argument count test made `< 1` | `` FAIL: no step argument: exit 1, expected 64 [] [Traceback (most recent call last): `` | the same line |
| 21 | a missing state file | an unreadable file read as empty | `` FAIL: a missing state file: printed [error: .../missing.md has no yaml block], expected [error: ...cannot read .../missing.md...] `` | the same line |
| 22 | a state file not UTF-8 | files read with `errors="replace"` | `` FAIL: a state file not UTF-8: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 23 | a step naming a path | the step pattern allows `.` and `/` first | `` FAIL: a step naming a path: printed [error: cannot read .../agents/briefs/../1x.md: No such file or directory], expected [error: ...step '../1x' is not a step name...] `` | the same line |
| 24 | an empty step | the step pattern allows empty | `` FAIL: an empty step: printed [error: cannot read .../agents/briefs/.md: No such file or directory], expected [error: ...step '' is not a step name...] `` | the same line |
| 25 | an open yaml block | the "not closed" refusal made `pass` | `` FAIL: an open yaml block: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 26 | invalid YAML | an invalid block skipped | `` FAIL: invalid YAML: printed [error: no yaml block of .../orchestrator-state.md has a dispatch: key], expected [error: ...is not valid YAML...] `` | the same line |
| 27 | an empty yaml block | the opening fence line not yielded | `` FAIL: an empty yaml block: printed [error: .../orchestrator-state.md has no yaml block], expected [error: ...no yaml block of .../orchestrator-state.md has a dispatch: key...] `` | the same line |
| 28 | no dispatch key | a missing key read as `none` | `` FAIL: no dispatch key: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 29 | a dispatch that is a number | a non-list read as no step | `` FAIL: a dispatch that is a number: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 30 | an empty dispatch list | `or not dispatch` dropped | `` FAIL: an empty dispatch list: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 31 | an entry without step | a list entry without `step:` skipped | `` FAIL: an entry without step: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 32 | a boolean step | the `bool` test dropped | `` FAIL: a boolean step: printed [error: cannot read .../agents/briefs/True.md: No such file or directory], expected [error: ...is neither none, an entry with step:, nor a list of entries with step:...] `` | the same line |
| 33 | a dispatch step naming a path | `step_name` not applied to the block's steps | `` FAIL: a dispatch step naming a path: printed [error: cannot read .../agents/briefs/../1y.md: No such file or directory], expected [error: ...step '../1y' is not a step name...] `` | the same line |
| 34 | a missing brief | a missing brief of a step in flight skipped | `` FAIL: a missing brief: exit 0, expected 64 [ok: 1x shares no path with 1y] [] `` | the same line |
| 35 | the step's own brief missing | a missing own brief read as no path | `` FAIL: the step's own brief missing: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 36 | a brief not UTF-8 | the brief read with `errors="replace"` | `` FAIL: a brief not UTF-8: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 37 | an empty section | the "lists no path" refusal dropped | `` FAIL: an empty section: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 38 | a path outside the repository | the `..` test dropped | `` FAIL: a path outside the repository: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 39 | an absolute path | the `/` test dropped | `` FAIL: an absolute path: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 40 | a range from line 0 | range numbers `\d+` | `` FAIL: a range from line 0: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |
| 41 | a star item | only `-` read as a list item | `` FAIL: a star item: printed [error: .../agents/briefs/1x.md lists no path under '## Paths this step writes'], expected [error: ....../agents/briefs/1x.md:9: '* `a.sh`' is not...] `` | the same line |
| 42 | no PyYAML | `sys.exit(69)` made 64 | `` FAIL: no PyYAML: exit 64, expected 69 [error: python3 cannot import yaml; install PyYAML] `` | the same line |
| 43 | a range against a whole file | revert A: a whole file shared only when it is in the step checked | `` FAIL: a range against a whole file: exit 0, expected 1 [ok: 1x shares no path with 1y] [] `` | the same line |
| 44 | a path listed twice | revert B: `and line not in lines` dropped | `` FAIL: a path listed twice: printed [shared: a.sh (whole) in 1x and whole in 1y `` | the same line |
| 45 | a subheading in the section | revert C: `HEADING` widened to `#{1,6}` | `` FAIL: a subheading in the section: exit 0, expected 1 [ok: 1x shares no path with 1y] [] `` | the same line |
| 46 | a single entry | a single entry refused (the `dict` wrap dropped) | `` FAIL: a single entry: exit 64, expected 0 [] [error: the dispatch: key of .../orchestrator-state.md is neither none, an entry with step:, nor a list of entries with step:] `` | the same line |
| 47 | a single entry sharing a path | a single entry refused (the `dict` wrap dropped) | `` FAIL: a single entry: exit 64, expected 0 [] [error: the dispatch: key of .../orchestrator-state.md is neither none, an entry with step:, nor a list of entries with step:] `` | `` FAIL: a single entry sharing a path: exit 64, expected 1 [] [error: the dispatch: key of .../orchestrator-state.md is neither none, an entry with step:, nor a list of entries with step:] `` |
| 48 | a single entry | a single entry read as no step in flight | `` FAIL: a single entry: printed [ok: 1x shares no path with no step in flight], expected [ok: 1x shares no path with 1y] `` | the same line |
| 49 | a single entry sharing a path | a single entry read as no step in flight | `` FAIL: a single entry: printed [ok: 1x shares no path with no step in flight], expected [ok: 1x shares no path with 1y] `` | `` FAIL: a single entry sharing a path: exit 0, expected 1 [ok: 1x shares no path with no step in flight] [] `` |
| 50 | a single entry without step | a single entry without `step:` read as no step in flight | `` FAIL: a single entry without step: exit 0, expected 64 [ok: 1x shares no path with no step in flight] [] `` | the same line |

## Rule 14 grep

- `grep -rn "Paths this step writes" skills utils docs README.md` prints the script and its test, `skills/spec/templates/brief.md:21`, `skills/spec/SKILL.md` 36, 59, 62, 114, `skills/plan-orchestration/SKILL.md:138` and `skills/plan-help/SKILL.md:68`.
- `grep -rn '"Cases"\|## Cases' skills utils docs README.md` prints `skills/refute/SKILL.md:80`, `skills/spec/SKILL.md:58`, `skills/spec/templates/brief.md:13` and `:57`, and `skills/plan-orchestration/SKILL.md:63`.
- `grep -rn "check_paths" ...` also prints `docs/dev/building.md:12`, `docs/dev/change-standard.md:48`, `README.md:111` and `:124`.
- `grep -rn "Two steps in flight" ...` prints `skills/plan/templates/plan.yaml:21` and `skills/plan/templates/orchestrator-state.md:21` ("above 1 only for steps with disjoint paths"), still true, and `skills/plan-orchestration/SKILL.md` 45 and 134.
- `grep -rn "spec.\{0,30\}Steps [0-9]" skills utils docs README.md` prints only `skills/spec/SKILL.md:67`, `spec`'s own "redoes Steps 2": no other file names `spec`'s step numbers.
- `grep -rn "neither none\|brief is removed\|with the findings (Steps 8)" skills docs README.md` prints only the script's and the test's own lines of the new wording.
- `grep -rn "leave nothing\|leaves nothing" skills` prints `skills/spec/SKILL.md` 66 and 103 and `skills/plan-help/SKILL.md:68`, which Steps 4 now makes true, and the refusal rules of `land`, `refute` and `plan-help` (`land` 47 and 121, `refute` 112, `plan-help` 81), which are about those skills.

## Files

`wc -l` on each file after the round:

| File | Lines |
|---|---|
| `skills/spec/templates/check_paths.py` | 226 (new) |
| `skills/spec/templates/check_paths.test.sh` | 392 (new) |
| `skills/spec/templates/brief.md` | 57 (was 41) |
| `skills/spec/SKILL.md` | 127 (was 115) |
| `skills/refute/SKILL.md` | 132 (was 130) |
| `skills/plan-orchestration/SKILL.md` | 275 (was 271) |
| `skills/plan-help/SKILL.md` | 93 (was 92) |
| `docs/dev/building.md` | 35 (was 34) |
| `docs/dev/change-standard.md` | 66 (was 65) |
| `README.md` | 177 (was 175) |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1c-report.md` | this report |

## Judgment calls the brief left open

- The script reads the state file's first yaml block that has a `dispatch:` key ("What the brief got wrong", 1). A `dispatch:` that is one mapping with `step:` is read as one entry (ruling 6).
- Refusals beyond the brief's list, each an edge of an id or a path the script takes from a file (change standard rule 15): a wrong number of arguments; a step name, given or in the block, that is empty or not `[A-Za-z0-9][A-Za-z0-9._-]*` (it becomes a file name); a yaml block never closed or not valid YAML; a state file whose yaml blocks hold no `dispatch:`; an empty dispatch list; a `step:` YAML reads as a boolean; a brief whose section lists no path; a path that is absolute or leaves the repository; a range starting at line 0. Each exits 64 with one `error:` line on stderr.
- A missing PyYAML exits 69 with `error: python3 cannot import yaml; install PyYAML`, as `verify.sh` does.
- In the section, every list item (`-`, `*`, `+`, `1.` or `1)`) must be a path line; a line that is not a list item, a `###` heading included, is prose and is not read; lines inside fences are not read.
- Paths are compared in normal form (`posixpath.normpath`), and each `shared:` line is printed once.
- The step's own entry in the dispatch block is not compared with itself (a backed-out step specified again).
- `shared:` and `ok:` go to stdout, `error:` to stderr with nothing on stdout, as `sync_rules.py` does.
- "Two steps in flight" said "A step that touches shared files, a configuration file or a rule file runs alone.", which the brief's decision 2 makes false; it reads "A shared document is split between steps in flight only by line ranges that do not overlap; a step that touches a configuration file or a rule file runs alone."
- `metadata.version` of the changed skills is unchanged; neither the brief nor the rulings ask for a bump.

## User-visible changes

- **Brief template.** Before: What is on the tree, What to build, Decisions, Read, What it must do, Conventions, Verify, Report. After: `## Cases` (the case list; the builder's first task, tests from the cases run on the unchanged tree with no prototype script; a builder whose first run finds a case the brief's rules get wrong stops before changing code, hands back the first run and the case with the rule and result, and is resumed with the orchestrator's ruling) and `## Paths this step writes` (``- `<path>` ``, ``- `<path>` lines <a>-<b>` ``, the report path) follow What to build; Report asks for the cases' first run, with the ruling on any wrong case, before the table.
- **`spec`.** Before: Steps 1-7, preparation commit at 4, no path check, Steps 7 silent on the block's shape. After: Steps 3 writes the two sections, the report shape with the first run, and the hand-back; new Steps 4 runs `python3 templates/check_paths.py <state file> <step>` and refuses on exit 1 (each `shared:` line naming the path and both steps) and on exit 64 or 69, restoring the brief and any `plan.md` amendment to main's copies and making no commit, worktree or dispatch block, with `/spec` run again redoing Steps 2; Steps 5-8 are the old 4-7; Steps 8 writes one entry when `workers_at_once` is 1 and appends to the list above 1; "What it reads" names the briefs of the steps in flight; the description names the path check; Stops gains "A path shared with a step in flight" and "An unusable state file or brief".
- **`refute`.** After: also "a case of the brief's "Cases" that no test of the step checks" and "a case whose first run on the unchanged tree the report does not give".
- **`plan-orchestration`.** Before: "Each brief lists the paths its step writes, and the lists share no file." and "A step that touches shared files, a configuration file or a rule file runs alone."; Steps 6 silent on cases. After: the lists are the briefs' "Paths this step writes", shared means the same file named whole in one or overlapping ranges, `spec` checks them with the `spec` skill's `templates/check_paths.py` before the dispatch, a shared document is split only by non-overlapping ranges; Steps 6 reads a builder's hand-back of a wrong case, rules inside the scope, writes `agents/briefs/<step>-cases.md`, commits it and resumes the same builder, or stops when the scope changes.
- **`plan-help`.** Before: "when a command stops" had no line for a refusal of `/spec`. After: a `/spec refuses` line for a shared path or an unusable state file or brief.
- **New script** `skills/spec/templates/check_paths.py`: `ok: <step> shares no path with <steps or no step in flight>`, `shared: <path> (<range or whole>) in <step> and <range or whole> in <other step>`, `error: ...`; exits 0, 1, 64, 69.
- **Test lists.** `docs/dev/building.md`, `docs/dev/change-standard.md` and `README.md` "Tests" list `sh skills/spec/templates/check_paths.test.sh` after `launch.test.sh`; README gains a one-sentence bullet for it, and its skill table row for `spec` adds "checks the paths it writes against the steps in flight".

## What the brief got wrong

1. **Premise: where the dispatch block is.** The brief says "The dispatch block of a state file is the `dispatch:` key of the first `yaml` block of `orchestrator-state.md`". `grep -n '^```yaml'` prints lines 5 and 38 of the ledger's state file and 5 and 26 of `skills/plan/templates/orchestrator-state.md`; the first block holds `verify:`, the second `dispatch:`. The script reads the first yaml block that has a `dispatch:` key, and the case "the dispatch block in the second yaml block" tests it.
2. **A dispatch block written as a single mapping**, raised in the first report, is ruled (ruling 6) and built.

## A rule of the brief not kept

- The brief says to run no git command. In this round the verify list's ASCII check, which starts with `git ls-files -coz --exclude-standard`, was run once directly in the worktree, outside the runner, after the report was written. It reads the file list only, changes nothing, and exited 0. The runner runs the same command as the last item of the verify list.

## Doc text

The ledger's verify list, `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`. After the line that `grep -n` prints as

```
11:- sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
```

add

```
- sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1
```
