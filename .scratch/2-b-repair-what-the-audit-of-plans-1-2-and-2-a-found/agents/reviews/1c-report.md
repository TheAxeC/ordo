# Step 1c report

Everything in the brief is done. One point in the brief's rules needs the orchestrator's ruling, and one premise was wrong; both are under "What the brief got wrong".

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

The same run held 29 further cases (every other `error:` cause, the shapes of a real state file and brief), each red with the same exit 2 on the missing script; 39 `FAIL:` lines in all, saved at `$TMPDIR/1c-first/first-run.txt`. Three edge cases were added once the script existed: "an empty dispatch list", "a boolean step" and "an empty yaml block"; their red is shown under their reverts below.

No case of the brief's "Cases" is got wrong by the brief's own rules: each expected result follows from the rules in "What to build" item 2. The brief's premise about where the dispatch block is, and a dispatch shape the rules refuse, are under "What the brief got wrong".

## Result table

| Item | State | Command and its output |
|---|---|---|
| 1. Brief template: `## Cases` with the builder's first task, `## Paths this step writes` with both line shapes and the report path, "Report" asks for the cases' first run before the table | DONE | `grep -n '^## ' skills/spec/templates/brief.md` prints `## Cases` at 13 and `## Paths this step writes` at 19, between "What to build" and "Decisions taken in this brief" |
| 2. `skills/spec/templates/check_paths.py` and `check_paths.test.sh` | DONE | `sh skills/spec/templates/check_paths.test.sh 2>&1 \| tail -1` prints `PASS: check_paths.py scratch tests` (also under `dash`) |
| 3. `spec`: Steps 3 writes both sections, Steps 4 runs the check and refuses on exit 1, two Stops rows | DONE | `python3 utils/check_skill_layout.py` prints `ok: skills/spec/SKILL.md` |
| 4. `refute`: two findings under Spec | DONE | `ok: skills/refute/SKILL.md`; `grep -n 'Cases\|first run on' skills/refute/SKILL.md` prints lines 80 and 81 |
| 5. `plan-orchestration`: "Two steps in flight" names the section and the check; Steps 6 rules a wrong case or stops | DONE | `ok: skills/plan-orchestration/SKILL.md`; lines 63-64 and 137-139 |
| 6. `docs/dev/building.md`, `docs/dev/change-standard.md`, `README.md` "Tests" list the test after `launch.test.sh`; README bullet | DONE | `grep -rn check_paths.test.sh docs README.md` prints `docs/dev/building.md:12`, `docs/dev/change-standard.md:48`, `README.md:111`, `README.md:124` |
| Verify 1: the verify list through the runner with the Doc text line | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh "$TMPDIR/state-1c.md"` exits 0, lines below |
| Verify 2: the test | DONE | `PASS: check_paths.py scratch tests` |
| Verify 3: the ledger's own state file | DONE | `python3 skills/spec/templates/check_paths.py .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md 1c` prints `ok: 1c shares no path with no step in flight`, exit 0 (the worktree's copy has `dispatch: none`) |
| Verify 4: every case red under its revert | DONE | 42 reverts, 41 cases, each first `FAIL:` line names its case; list below |
| Rule 14 grep | DONE | below |

The runner's lines (exit 0):

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

The green run does not cover a real `/spec` run: no brief was prepared through the skill with the new Steps 4.

## Reverts and their red lines

Each revert was applied to a copy of `check_paths.py` beside a copy of the test under `$TMPDIR`, and the test run; each exits 1. `$TMPDIR` stands for the temporary folder, and long lines are cut at the case's expectation.

| # | Case | Revert in `check_paths.py` | First `FAIL:` line |
|---|---|---|---|
| 1 | none in flight | `dispatch == "none"` made `"None"` | `FAIL: none in flight: exit 64, expected 0 [] [error: the dispatch: key of ... is neither none nor a list of entries with step:]` |
| 2 | different files | the path comparison in `shared` dropped | `FAIL: different files: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] []` |
| 3 | ranges compared as numbers (next section) | `inside` stays true after the next heading | `FAIL: ranges compared as numbers: exit 1, expected 0 [shared: y (lines 1-2) in 1x and lines 1-2 in 1y] []` |
| 4 | whole against a range | a whole file never shared | `FAIL: whole against a range: exit 0, expected 1 [ok: 1x shares no path with 1y] []` |
| 5 | adjacent ranges | overlap tested with `+ 1` | `FAIL: adjacent ranges: exit 1, expected 0 [shared: README.md (lines 1-9) in 1x and lines 10-12 in 1y] []` |
| 6 | ranges sharing a line (control of 5) | overlap tested with `<` | `FAIL: ranges sharing a line: exit 0, expected 1 [ok: 1x shares no path with 1y] []` |
| 7 | no yaml block | the "has no yaml block" refusal dropped | `FAIL: no yaml block: printed [error: no yaml block of ... has a dispatch: key], expected [error: ...has no yaml block...]` |
| 8 | no paths section | the "has no ... section" refusal dropped | `FAIL: no paths section: printed [error: .../1y.md lists no path under '## Paths this step writes'], expected ...` |
| 9 | a path line in neither shape | a malformed item skipped | `FAIL: a path line in neither shape: printed [error: .../1x.md lists no path under '## Paths this step writes'], expected ...` |
| 10 | a reversed range | the end-before-start refusal dropped | `FAIL: a reversed range: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 11 | the dispatch block in the second yaml block | only the first yaml block read | `FAIL: the dispatch block in the second yaml block: exit 64, expected 1 [] [error: no yaml block of ... has a dispatch: key]` |
| 12 | its own entry | the step not dropped from the steps in flight | `FAIL: its own entry: exit 1, expected 0 [shared: README.md (whole) in 1x and whole in 1x] []` |
| 13 | three steps | a step named twice kept twice | `FAIL: three steps: printed [ok: 1x shares no path with 1y, 1z, 1y], expected [ok: 1x shares no path with 1y, 1z]` |
| 14 | shared with two steps | only the first step in flight compared | `FAIL: shared with two steps: printed [shared: a.sh (whole) in 1x and whole in 1y], expected [...` |
| 15 | a path spelled two ways | `posixpath.normpath` dropped | `FAIL: a path spelled two ways: exit 0, expected 1 [ok: 1x shares no path with 1y] []` |
| 16 | ranges compared as numbers | the `int()` conversions dropped | `FAIL: ranges compared as numbers: exit 1, expected 0 [shared: a.md (lines 2-8) in 1x and lines 10-20 in 1y] []` |
| 17 | prose in the section | every non-blank line read as a path line | `FAIL: prose in the section: exit 64, expected 0 [] [error: .../1x.md:9: 'One path per line.' is not ...]` |
| 18 | a path after a fence (control of 19) | a fence never closes | `FAIL: a path after a fence: exit 64, expected 1 [] [error: .../1y.md has no '## Paths this step writes' section]` |
| 19 | fenced lines | fenced lines read | `FAIL: fenced lines: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] []` |
| 20 | no step argument | argument count test made `< 1` | `FAIL: no step argument: exit 1, expected 64 [] [Traceback (most recent call last):` |
| 21 | a missing state file | an unreadable file read as empty | `FAIL: a missing state file: printed [error: .../missing.md has no yaml block], expected [error: ...cannot read .../missing.md...]` |
| 22 | a state file not UTF-8 | files read with `errors="replace"` | `FAIL: a state file not UTF-8: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 23 | a step naming a path | the step pattern allows `.` and `/` first | `FAIL: a step naming a path: printed [error: cannot read .../agents/briefs/../1x.md: No such file or directory], expected [error: ...step '../1x' is not a step name...]` |
| 24 | an empty step | the step pattern allows empty | `FAIL: an empty step: printed [error: cannot read .../agents/briefs/.md: No such file or directory], expected [error: ...step '' is not a step name...]` |
| 25 | an open yaml block | the "not closed" refusal made `pass` | `FAIL: an open yaml block: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 26 | invalid YAML | an invalid block skipped | `FAIL: invalid YAML: printed [error: no yaml block of ... has a dispatch: key], expected [error: ...is not valid YAML...]` |
| 27 | an empty yaml block | the opening fence line not yielded | `FAIL: an empty yaml block: printed [error: .../orchestrator-state.md has no yaml block], expected [error: ...no yaml block of ...` |
| 28 | no dispatch key | a missing key read as `none` | `FAIL: no dispatch key: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 29 | a dispatch that is a number | a non-list read as no step | `FAIL: a dispatch that is a number: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 30 | an empty dispatch list | `or not dispatch` dropped | `FAIL: an empty dispatch list: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 31 | an entry without step | the entry skipped | `FAIL: an entry without step: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 32 | a boolean step | the `bool` test dropped | `FAIL: a boolean step: printed [error: cannot read .../agents/briefs/True.md: No such file or directory], expected [error: ...is neither none nor a list of entries with step:...]` |
| 33 | a dispatch step naming a path | `step_name` not applied to the block's steps | `FAIL: a dispatch step naming a path: printed [error: cannot read .../agents/briefs/../1y.md: No such file or directory], expected [error: ...step '../1y' is not a step name...]` |
| 34 | a missing brief | a missing brief of a step in flight skipped | `FAIL: a missing brief: exit 0, expected 64 [ok: 1x shares no path with 1y] []` |
| 35 | the step's own brief missing | a missing own brief read as no path | `FAIL: the step's own brief missing: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 36 | a brief not UTF-8 | the brief read with `errors="replace"` | `FAIL: a brief not UTF-8: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 37 | an empty section | the "lists no path" refusal dropped | `FAIL: an empty section: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 38 | a path outside the repository | the `..` test dropped | `FAIL: a path outside the repository: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 39 | an absolute path | the `/` test dropped | `FAIL: an absolute path: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 40 | a range from line 0 | range numbers `\d+` | `FAIL: a range from line 0: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []` |
| 41 | a star item | only `-` read as a list item | `FAIL: a star item: printed [error: .../1x.md lists no path under '## Paths this step writes'], expected ...` |
| 42 | no PyYAML | `sys.exit(69)` made 64 | `FAIL: no PyYAML: exit 64, expected 69 [error: python3 cannot import yaml; install PyYAML]` |

## Rule 14 grep

`grep -rn "Paths this step writes" skills utils docs README.md` prints `skills/spec/templates/check_paths.py` (9, 33, 43), `check_paths.test.sh` (its cases), `skills/spec/templates/brief.md:19`, `skills/spec/SKILL.md` 36, 59, 62, 112, and `skills/plan-orchestration/SKILL.md:137`. `grep -rn '"Cases"\|## Cases' skills utils docs README.md` prints `skills/refute/SKILL.md:80`, `skills/spec/SKILL.md:58`, `skills/spec/templates/brief.md:13` and `:55`, `skills/plan-orchestration/SKILL.md:63`. `grep -rn "check_paths" ...` adds `docs/dev/building.md:12`, `docs/dev/change-standard.md:48`, `README.md:111` and `:124`. `grep -rn "Two steps in flight" ...` prints `skills/plan/templates/plan.yaml:21` and `skills/plan/templates/orchestrator-state.md:21` ("above 1 only for steps with disjoint paths"), still true, and `skills/plan-orchestration/SKILL.md` 45 and 133. `grep -rn "preparation commit" ...` prints `skills/spec/SKILL.md` 49 ("Steps 5", renumbered), 63, 67, and `skills/land/SKILL.md:134`, unaffected. `grep -rn "spec.\{0,30\}Steps [0-9]" ...` prints nothing: no other file names `spec`'s step numbers. `grep -rn "runs alone\|share no file\|lists the paths" ...` finds no other copy of the old rule.

## Files

| File | Lines |
|---|---|
| `skills/spec/templates/check_paths.py` | 223 (new) |
| `skills/spec/templates/check_paths.test.sh` | 346 (new) |
| `skills/spec/templates/brief.md` | 55 (was 41) |
| `skills/spec/SKILL.md` | 125 (was 115) |
| `skills/refute/SKILL.md` | 132 (was 130) |
| `skills/plan-orchestration/SKILL.md` | 274 (was 271) |
| `docs/dev/building.md` | 35 (was 34) |
| `docs/dev/change-standard.md` | 66 (was 65) |
| `README.md` | 177 (was 175) |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1c-report.md` | this report |

## Judgment calls the brief left open

- The script reads the state file's first yaml block that has a `dispatch:` key, not the first yaml block (see "What the brief got wrong", 1).
- Refusals beyond the brief's list, each an edge of an id or a path the script takes from a file (change standard rule 15): a wrong number of arguments; a step name, given or in the block, that is empty or not `[A-Za-z0-9][A-Za-z0-9._-]*` (it becomes a file name); a yaml block never closed or not valid YAML; a state file whose yaml blocks hold no `dispatch:`; an empty dispatch list; a `step:` YAML reads as a boolean; a brief whose section lists no path; a path that is absolute or leaves the repository; a range starting at line 0. Each exits 64 with one `error:` line on stderr.
- A missing PyYAML exits 69 with `error: python3 cannot import yaml; install PyYAML`, as `verify.sh` does, so it is not read as a shared path (1) or a bad state file (64).
- In the section, every list item (`-`, `*`, `+`, `1.` or `1)`) must be a path line, and a line that is not a list item is prose and is not read, so the template can carry a sentence under its placeholders. Lines inside fences are not read.
- Paths are compared in normal form (`posixpath.normpath`), so `./a.sh` and `a.sh` are one file; the `shared:` line prints the normal form.
- The step's own entry in the dispatch block is not compared with itself (a backed-out step specified again).
- `shared:` and `ok:` go to stdout, `error:` to stderr with nothing on stdout, as `sync_rules.py` does.
- On a refusal of Steps 4 the brief written in Steps 3 is removed, since `spec`'s refusals "name their cause and leave nothing".
- "Two steps in flight" said "A step that touches shared files, a configuration file or a rule file runs alone.", which the brief's decision 2 (a shared document split by line range) makes false; it now reads "A shared document is split between steps in flight only by line ranges that do not overlap; a step that touches a configuration file or a rule file runs alone."
- A case the builder reports wrong and whose fix changes the scope is named as a stop of the existing kind "A finding that is the user's", so the Stops table keeps its six kinds.
- `metadata.version` of the three skills is unchanged; the brief does not ask for a bump.

## User-visible changes

- **Brief template.** Before: sections What is on the tree, What to build, Decisions, Read, What it must do, Conventions, Verify, Report. After: `## Cases` (the case list and the builder's first task: tests from the cases, run on the unchanged tree, a wrong case reported with its rule and result before any code change, no prototype script) and `## Paths this step writes` (``- `<path>` ``, ``- `<path>` lines <a>-<b>` ``, the report path) follow What to build; Report asks for "the cases' first run" before the DONE / NOT DONE table.
- **`spec`.** Before: Steps 1-7, the preparation commit at 4, nothing compared a brief's paths with the steps in flight. After: Steps 3 writes the two sections and the report shape with the cases' first run; new Steps 4 runs `python3 templates/check_paths.py <state file> <step>` and refuses on exit 1 (each `shared:` line naming the path and both steps) and on exit 64 or 69, removing the brief and making no commit, worktree or dispatch block; the preparation commit, worktree, base binaries and dispatch block are now Steps 5-8; "What it reads" item 3 names the briefs of the steps in flight; the description names the path check; Stops gains "A path shared with a step in flight" and "An unusable state file or brief".
- **`refute`.** Before: Spec findings ended at an unreproduced premise. After: also "a case of the brief's "Cases" that no test of the step checks" and "a case whose first run on the unchanged tree the report does not give".
- **`plan-orchestration`.** Before: "Each brief lists the paths its step writes, and the lists share no file." and "A step that touches shared files, a configuration file or a rule file runs alone."; Steps 6 said nothing of cases. After: the lists are the briefs' "Paths this step writes", shared means the same file named whole in one or overlapping line ranges, `spec` checks them with the `spec` skill's `templates/check_paths.py` before the dispatch; a shared document is split only by non-overlapping ranges; Steps 6 has the orchestrator rule a case the builder reports wrong when the fix stays inside the scope (the ruling goes back with the findings, Steps 8) and stop when it changes the scope.
- **New script** `skills/spec/templates/check_paths.py` with its output lines `ok: <step> shares no path with <steps or no step in flight>`, `shared: <path> (<range or whole>) in <step> and <range or whole> in <other step>`, `error: ...`; exits 0, 1, 64, 69.
- **Test lists.** `docs/dev/building.md`, `docs/dev/change-standard.md` and `README.md` "Tests" list `sh skills/spec/templates/check_paths.test.sh` after `launch.test.sh`; README gains a one-sentence bullet for it, and its skill table row for `spec` adds "checks the paths it writes against the steps in flight".

## What the brief got wrong

1. **Premise: where the dispatch block is.** The brief says "The dispatch block of a state file is the `dispatch:` key of the first `yaml` block of `orchestrator-state.md`". On the tree it is the second: `grep -n '^```yaml' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md skills/plan/templates/orchestrator-state.md` prints lines 5 and 38 of the ledger's state file and lines 5 and 26 of the template; the first block holds `verify:`, the second `dispatch:`. A script reading the first block only could not pass Verify 3. The script reads the first yaml block that has a `dispatch:` key, and "the dispatch block in the second yaml block" tests it.
2. **Rule to rule on: a dispatch block that is a single mapping.** `skills/plan/templates/orchestrator-state.md:27` reads "dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, ...", which lets the block be one mapping when `workers_at_once` is 1. The brief's rule refuses any `dispatch:` that is neither `none` nor a list of entries with `step:`, and the script does (exit 64). With `workers_at_once: 1`, a block left at `landing: backed-out` (which `spec`'s "A step in flight" row lets the next `/spec` run past) written as a mapping would make Steps 4 refuse. The options: (a) the block is always a list, and the template's comment says so (a change to the `plan` skill's `templates/orchestrator-state.md`, outside this step's paths); (b) the script also reads a single mapping with `step:` as one entry. Recommendation: (a), one shape for every reader and no second parse path; the script needs no change. This ledger's own block (`workers_at_once: 3`) is a list, so nothing here is affected.

## Doc text

The ledger's verify list, `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`. After the line that `grep -n` prints as

```
11:- sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
```

add

```
- sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1
```
