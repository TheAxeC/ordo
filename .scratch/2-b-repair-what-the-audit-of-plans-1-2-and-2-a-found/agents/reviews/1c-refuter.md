# Step 1c refuter report (on .agents/worktrees/2b-1c, base 7ccbe7b)

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh "$TMPDIR/refute1c.Wgby/state-1c.md"
  (the copy has "- sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1" after the launch.test.sh line)
  eleven PASS: lines, "PASS: check_paths.py scratch tests" sixth; ten ok: lines; "verify: 13 commands passed"; exit 0
sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1      -> PASS: check_paths.py scratch tests
dash skills/spec/templates/check_paths.test.sh 2>&1 | tail -1    -> PASS: check_paths.py scratch tests
python3 skills/spec/templates/check_paths.py .scratch/2-b-.../orchestrator-state.md 1c   (worktree copy, dispatch: none)
  -> ok: 1c shares no path with no step in flight; exit 0
python3 skills/spec/templates/check_paths.py /Users/axelfaes/workspace/ordo/.scratch/2-b-.../orchestrator-state.md 1c   (main, block lists 1c)
  -> ok: 1c shares no path with no step in flight; exit 0
python3 utils/check_skill_layout.py   -> ten ok: lines (spec, refute, plan-orchestration among them); exit 0
grep -n '^```yaml' <main ledger state file> skills/plan/templates/orchestrator-state.md   -> 5 and 38; 5 and 26 (dispatch: is in the second block)
grep -n '^## ' skills/spec/templates/brief.md   -> ## Cases at 13, ## Paths this step writes at 19, ## Report at 53
grep -n 'Cases\|first run on' skills/refute/SKILL.md   -> 80, 81
grep -rn check_paths.test.sh docs README.md   -> building.md:12, change-standard.md:48, README.md:111, :124
grep -rn "spec.\{0,30\}Steps [0-9]" skills utils docs README.md   -> nothing
grep -cE '^(expect_out|expect_error) ' check_paths.test.sh   -> 40 (plus the PyYAML case: 41, as reported)
wc -l on the seven changed files   -> 55, 125, 132, 274, 35, 66, 177, as reported
cmp worktree and main copies of 1c-report.md   -> same
Reverts planted on copies under $TMPDIR (report numbers), each test exit 1, first FAIL line:
  1  FAIL: none in flight: exit 64, expected 0 [] [error: the dispatch: key of ...
  2  FAIL: different files: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] []
  3  FAIL: ranges compared as numbers: exit 1, expected 0 [shared: y (lines 1-2) in 1x and lines 1-2 in 1y] []
  4  FAIL: whole against a range: exit 0, expected 1 [ok: 1x shares no path with 1y] []
  5  FAIL: adjacent ranges: exit 1, expected 0 [shared: README.md (lines 1-9) in 1x and lines 10-12 in 1y] []
  6  FAIL: ranges sharing a line: exit 0, expected 1 [ok: 1x shares no path with 1y] []
  7  FAIL: no yaml block: printed [error: no yaml block of ... has a dispatc...
  9  FAIL: a path line in neither shape: printed [error: .../1x.md lists no path un...
  10 FAIL: a reversed range: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []
  11 FAIL: the dispatch block in the second yaml block: printed [], expected [shared: README.md (whole) in 1x and whole in 1y]
  12 FAIL: its own entry: exit 1, expected 0 [shared: README.md (whole) in 1x and whole in 1x] []
  15 FAIL: a path spelled two ways: exit 0, expected 1 [ok: 1x shares no path with 1y] []
  16 FAIL: ranges compared as numbers: exit 1, expected 0 [shared: a.md (lines 2-8) in 1x and lines 10-20 in 1y] []
  19 FAIL: fenced lines: exit 1, expected 0 [shared: a.sh (whole) in 1x and whole in 1y] []
  22 FAIL: a state file not UTF-8: exit 0, expected 64 [ok: 1x shares no path with no step in flight] []
  30 FAIL: an empty dispatch list: exit 0, expected 64 [ok: ...] []
  38 FAIL: a path outside the repository: exit 0, expected 64 [ok: ...] []
  42 FAIL: no PyYAML: exit 64, expected 69 [error: python3 cannot import yaml; install PyYAML]
Reverts of the reviewer's own, each stays green (exit 0, PASS: check_paths.py scratch tests):
  A  shared(): "if mine[1] is None: return True; if theirs[1] is None: return False"
  B  "and line not in lines" dropped from main()
  C  HEADING widened to #{1,6}
python3 <revert A copy> <scratch state> 1x   (1x: README.md lines 3-4, 1y: README.md whole)  -> ok: 1x shares no path with 1y; exit 0
python3 check_paths.py <same>   -> shared: README.md (lines 3-4) in 1x and whole in 1y; exit 1
python3 check_paths.py <scratch state with "dispatch:\n  step: 3\n  landing: backed-out"> 4
  -> error: the dispatch: key of ... is neither none nor a list of entries with step:; exit 64
grep -c '^FAIL:' $TMPDIR/1c-first/first-run.txt   -> 38 (39 lines, the last "PASS: check_paths.py scratch tests")
```

## 1. Spec

- Every item of "What to build" (1 to 6) is in the diff as the brief words it. The builder's additions, each judged:
- skills/plan-orchestration/SKILL.md:139: the rule "A step that touches shared files, a configuration file or a rule file runs alone." is reworded to allow a shared document split by non-overlapping line ranges. No item asks for it, but the brief's decision 2 and plan.md step 1c ("a shared document with its line range") make the old sentence false, so change-standard rule 14 (the brief's "What it must do") requires it. Inside the brief, and right.
- skills/spec/templates/check_paths.py:36, 217-218: exit 69 for a missing PyYAML. Not in the brief's exit list (0, 1, 64). It follows `skills/land/templates/verify.sh:35`, which exits 69 for the same cause, and keeps a missing module from reading as a bad state file. Outside the brief's text, and right.
- check_paths.test.sh: 32 cases beyond the brief's nine. The brief asks the test to cover "each exit and each error: cause", and rule 15 asks for the edges. Inside the brief.
- skills/spec/SKILL.md:65 and :113: spec refuses on exit 64 and 69 as well as 1, with a new Stops row "An unusable state file or brief". Brief item 3 names exit 1 only. Going on past an unusable file would skip the check, so refusing is the only correct reading. Outside the brief's letter, and right.
- skills/spec/SKILL.md:66: "On a refusal the brief is removed". This is the builder's own call. It is consistent with the Stops intro (:101, "leave nothing"), but see Behaviour for what it does not remove.
- Premise of the brief not reproduced: "The dispatch block of a state file is the `dispatch:` key of the first `yaml` block". `grep -n '^```yaml'` prints lines 5 and 38 of main's ledger state file and 5 and 26 of `skills/plan/templates/orchestrator-state.md`. `dispatch:` sits in the second block in both (main ledger line 39, template line 27). The builder's report is right. The script reads the first yaml block that has a `dispatch:` key, and the test case "the dispatch block in the second yaml block" covers this. Every reader was grepped for where it says the dispatch block is (`grep -rn -i "first .yaml. block\|dispatch block is\|dispatch: key"` over skills, docs, README.md and utils). None says "first block": `skills/land/SKILL.md`, `plan/SKILL.md`, `plan-help/SKILL.md:39`, `plan-orchestration/SKILL.md` and `spec/SKILL.md` all say only "the dispatch block". The "first yaml block" wording belongs to `verify.sh` and README.md:144 / building.md:27, and it is about the verify: list, where it is correct.

## 2. Proof

- check_paths.py:186-187: only one direction of "one names it whole" is tested. In every case with a whole file against a range, the whole file is in the step being checked ("whole against a range": 1x whole, 1y lines 10-12). With revert A, a checked step naming a range of a file that a step in flight names whole passes (my scratch run: `ok: 1x shares no path with 1y`, exit 0), and the suite stays green. The rule is symmetric in the brief ("at least one names it whole"), so the mirror case is untested.
- check_paths.py:204: the de-duplication of `shared:` lines is untested. Revert B stays green. Change-standard rule 15 asks for an id or key "exercised ... duplicated", and a brief that lists the same path twice is never tried.
- check_paths.py:9 and :45: the docstring says the section runs "up to the next heading of level one or two", and a `###` line inside the section is meant to stay inside it. Revert C, which widens the pattern to `#{1,6}`, stays green, so no test checks that claim.
- Report, "The cases' first run": it says 29 further cases gave "39 `FAIL:` lines in all". The saved file `$TMPDIR/1c-first/first-run.txt` holds 38 `FAIL:` lines (9 + 29) and a closing `PASS:` line. The count is wrong by one. The nine brief cases are all present and red with exit 2, as quoted.
- Report revert 11: the quoted red line (`exit 64, expected 1 ... no yaml block of ... has a dispatch: key`) depends on how the revert is written. My form of "first block only" gave a different first FAIL line on the same case, which was still red. This is not a defect.
- Each of the brief's nine cases is a test, and each turned red under its revert (18 of the report's 42 reverts reproduced above).

## 3. Standards

- skills/spec/SKILL.md:101: "the rest are refusals, which name their cause and leave nothing". The change makes this sentence false for the new Steps 4 refusal. Steps 2 (:48) writes premise corrections into `plan.md` before the brief exists, and Steps 4 (:66) removes only the brief. A refusal at Steps 4 therefore leaves an uncommitted `plan.md` edit on main. The next preflight (:45) then treats it as "an unrelated change of the user's" and leaves it alone. This is change-standard rule 14 ("A sentence ... that the change makes false is a defect of the change"). The rule-14 grep in the report does not cover it.
- No non-ASCII (the verify list's perl check passes over the untracked files too). No line in the two new files is over 100 characters (awk check). No history in comments or docstrings. The layout check passes on all three changed SKILL.md files. The `the spec skill's templates/check_paths.py` wording at plan-orchestration:138 follows skill-layout.md:54.
- The renumbering was grepped (`grep -rnE "[Ss]teps? [4-8]([^0-9]|$)"` over skills, docs, README.md and utils). The only hits naming spec's steps are spec's own (:36, :49, :112, :113), all correct after the shift. No other skill cites spec's step numbers. The "Two steps in flight" mentions in `skills/plan/templates/plan.yaml:21` and `orchestrator-state.md:21` ("above 1 only for steps with disjoint paths") are still true.

## 4. Behaviour

- The builder's open question, run: the state template (`skills/plan/templates/orchestrator-state.md:27`, "a list with workers_at_once above 1") lets a block be a single mapping when workers_at_once is 1. spec's own Steps 8 (`skills/spec/SKILL.md:73`) does not say to write a list either, so on such a plan spec itself can write the mapping.
- What /spec does on a plan with workers_at_once: 1 and a leftover `landing: backed-out` mapping:
  - It passes "A step in flight" (:110 lets a backed-out block through).
  - It checks premises, possibly amends `plan.md`, and writes the brief.
  - At Steps 4 the script exits 64 with `error: the dispatch: key of <state> is neither none nor a list of entries with step:` (reproduced above).
  - spec refuses with "An unusable state file or brief" and removes the brief. The `plan.md` amendment is left uncommitted.
  - The resume, "the state file put right", means the user rewrites the block as a list by hand. Nothing in any skill tells them that shape.
- The plan is blocked by a shape the plan skill's template allows and spec may itself write. None of the ledgers on main has a mapping (`grep -A1 "^dispatch:"` over `.scratch/*/` and `.scratch/archive/*/`: one list and three `none`), so no current plan is affected.
- I agree with the builder's option (a), one shape. It must also cover spec's Steps 8 (":73, the entry appended to the dispatch list"), which is in this step's paths and can be fixed in the repair round, not only the plan template's comment. The template comment is outside the paths, so it is a landing fix or a widening of the path list. The lazy option is to book the template comment and leave spec's Steps 8 silent.
- `skills/spec/templates/brief.md:17` and `plan-orchestration/SKILL.md:63`: the builder is told to report a wrong case "before any code changes", but the orchestrator rules on it only at Steps 6, on the final report, after the build. Nothing says the builder stops after reporting. This is as the brief worded it (item 5), so it is not the builder's defect, but the "before code" ordering has no mechanism behind it.
- `skills/plan-help/SKILL.md:54-69`: the printed sequence lists "/land refuses" but has no line for spec's new refusal on a shared path. No sentence there is false, but a user running two steps by hand meets a refusal the help does not name. The report does not list plan-help among the user-visible changes.
- Every other user-visible change (brief template sections, spec Steps 3-8 and the two Stops rows, refute's two Spec findings, the plan-orchestration rules and Steps 6, the script's output lines and exits, the test lists and the README spec row) is stated in the report with its before and after, and matches the diff.

## Not checked

- A real /spec run through the skill with the new Steps 4.
- 24 of the report's 42 reverts (18 planted).
- Git history of past ledgers for a dispatch block written as a mapping (only the current files on main were grepped).

Reviewer usage: not known.
