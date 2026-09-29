Everything in the brief is done. No case of "Cases" was wrong under the brief's rules on the first run, so no hand-back.

## Open items of the state file

- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## First run, on the unchanged tree (HEAD f4e63ff, before any change)

| Case | Result on the unchanged tree |
|---|---|
| `git grep -n "names the revert" -- skills docs README.md utils` | 3 lines: `docs/dev/change-standard.md:39`, `skills/repo-setup/templates/docs/dev/change-standard.md:39`, `skills/spec/templates/brief.md:62` (as the brief expects) |
| `git grep -n -i -E "revert that\|turns (it )?red\|change reverted\|failing without it\|red line it produced"` over the five path groups | 6 lines: both change-standard line 39, `skills/plan-retro/SKILL.md:67`, `skills/refute/SKILL.md:107`, `common.md:13`, `skills/spec/templates/brief.md:62` |
| diff of line 39 in the two change-standard copies | prints nothing, rc 0 (identical, old text) |
| `grep -c -F "A test proves the change by failing on the unchanged tree, ..."` over the three files | 0, 0, 0 |
| `git diff --stat HEAD -- . ':!.scratch'` | empty |
| `grep -n -F '"a test that cannot fail"' skills/plan-retro/SKILL.md` | nothing, rc 1 |
| Reading, rule 13 against the ruling; rules 17 and 19; skill-layout "Writing for an agent" | read on the old text: the old rule 13 names a revert per test, which the ruling removes; the other rules of the old text are the ones the brief lists (audit examples, control, table, table limit, verbatim quote). No case the brief's rules get wrong. |

## DONE / NOT DONE (after the change)

| Item | Command and output | State |
|---|---|---|
| 1 rule 13, both copies | `diff <(sed -n 39p docs/dev/change-standard.md) <(sed -n 39p skills/repo-setup/templates/docs/dev/change-standard.md)` printed nothing, rc 0; a python comparison of each line 39 against the brief's item 1 text printed True for both | DONE |
| 2 brief.md:62 | comparison against item 2 text printed True | DONE |
| 3 refute two bullets | comparison of lines 107 and 108 against the brief's two quoted bullets printed True, True; lines 106-109 show the two bullets at the bullets' indentation | DONE |
| 4 common.md:13 | `grep -c -F "A test proves the change by failing on the unchanged tree, and the report quotes the failure"` printed `docs/dev/change-standard.md:1`, `skills/repo-setup/templates/docs/dev/change-standard.md:1`, `skills/repo-setup/templates/docs/dev/coding-standards/common.md:1` | DONE |
| 5 plan-retro:67 | `grep -n -F '"a test that cannot fail"' skills/plan-retro/SKILL.md` printed line 67 (text below) | DONE |
| Case 1 | `git grep -n "names the revert" -- skills docs README.md utils` prints nothing, rc 1 | DONE |
| Case 2 | the `git grep -n -i -E "revert that\|turns (it )?red\|change reverted\|failing without it\|red line it produced" -- docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/ skills/spec/ skills/refute/ skills/plan-retro/` prints nothing, rc 1 | DONE |
| Case 5 | `git diff --stat HEAD -- . ':!.scratch'`: the six files (docs/dev/change-standard.md 2, skills/plan-retro/SKILL.md 2, skills/refute/SKILL.md 3, the template change-standard 2, common.md 2, brief.md 2), `6 files changed, 7 insertions(+), 6 deletions(-)` | DONE |
| Verify 3 | `LC_ALL=C grep -n '[^ -~]'` over the six changed files printed nothing, rc 1 | DONE |
| Verify 4 | The step adds and changes no test; the template item does not apply | not applicable |
| Verify 1 | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, lines below | DONE |

Verify list lines as printed:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '<the ASCII check as in the verify list>'
checks: 8 commands passed
```

(The ASCII check printed no offending line. The exit status of the runner was not captured because of a pipe through `cut`; the final line is `checks: 8 commands passed`.)

## Files changed

| File | Lines changed |
|---|---|
| `docs/dev/change-standard.md` | 39 (1 line) |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 39 (1 line) |
| `skills/spec/templates/brief.md` | 62 (1 line) |
| `skills/refute/SKILL.md` | 107 replaced by 107 and 108 (1 removed, 2 added) |
| `skills/repo-setup/templates/docs/dev/coding-standards/common.md` | 13 (1 line) |
| `skills/plan-retro/SKILL.md` | 67 (1 line) |

`$TMPDIR/apply8.py` wrote these lines (it computes nothing; it replaces a line number's text after asserting the old text is there); each result was compared with the brief's quoted text.

## Each changed line, before and after


```diff
diff --git a/docs/dev/change-standard.md b/docs/dev/change-standard.md
index 88a09b3..8e77eed 100644
--- a/docs/dev/change-standard.md
+++ b/docs/dev/change-standard.md
@@ -39 +39 @@ Every rule on this page that names a script, a test or a check is read under thi
-13. **A test proves the change by failing without it, and the report quotes the red.** Every new or changed test names the revert that turns it red, and the report carries that revert and the failing output it produced, verbatim. A test that no revert turns red is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the control's red output is quoted beside it. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case, the revert and the red line it produced. The table covers those behaviours, not every branch or every rule a head comment states.
+13. **A test proves the change by failing on the unchanged tree, and the report quotes the failure.** The unchanged tree is the tree before the change; for a plan step it is the tree at the step's base. Every new test, and every test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, except a case asserting that a rule stays silent. The report quotes that failing output verbatim beside the test's name. No revert is named per test. A test changed only for a behaviour the change preserves passes on the unchanged tree and after the change, and the report quotes both runs. A test that cannot fail, whatever the code under it does, is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the report quotes beside it the failure on the unchanged tree of the case or of its control, whichever fails there. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case and the failing line that the case, or for a silent case its control, printed on the unchanged tree. The table covers those behaviours, not every branch or every rule a head comment states.
diff --git a/skills/plan-retro/SKILL.md b/skills/plan-retro/SKILL.md
index af0aadb..d58721d 100644
--- a/skills/plan-retro/SKILL.md
+++ b/skills/plan-retro/SKILL.md
@@ -67 +67 @@ metadata:
-- A kind is a sentence that states the defect in general terms, the way a rule would forbid it: "a test that stays green with the change reverted", "a comment that names the step that wrote it", "a document sentence the diff makes false".
+- A kind is a sentence that states the defect in general terms, the way a rule would forbid it: "a test that cannot fail", "a comment that names the step that wrote it", "a document sentence the diff makes false".
diff --git a/skills/refute/SKILL.md b/skills/refute/SKILL.md
index 9c895b5..1dec02e 100644
--- a/skills/refute/SKILL.md
+++ b/skills/refute/SKILL.md
@@ -107 +107,2 @@ metadata:
-  - a test that stays green with the change reverted, named with the revert that leaves it green (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
+  - a new or changed test whose run on the unchanged tree the report does not quote: its failure there, or for a case asserting that a rule stays silent the failure there of the case or of its control, or for a test changed only for a behaviour the change preserves its passing runs before and after the change;
+  - a test that cannot fail, whatever the code under it does, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
diff --git a/skills/repo-setup/templates/docs/dev/change-standard.md b/skills/repo-setup/templates/docs/dev/change-standard.md
index 9111fba..e42d02d 100644
--- a/skills/repo-setup/templates/docs/dev/change-standard.md
+++ b/skills/repo-setup/templates/docs/dev/change-standard.md
@@ -39 +39 @@ Every rule on this page that names code, a script, a test or a check is read und
-13. **A test proves the change by failing without it, and the report quotes the red.** Every new or changed test names the revert that turns it red, and the report carries that revert and the failing output it produced, verbatim. A test that no revert turns red is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the control's red output is quoted beside it. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case, the revert and the red line it produced. The table covers those behaviours, not every branch or every rule a head comment states.
+13. **A test proves the change by failing on the unchanged tree, and the report quotes the failure.** The unchanged tree is the tree before the change; for a plan step it is the tree at the step's base. Every new test, and every test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, except a case asserting that a rule stays silent. The report quotes that failing output verbatim beside the test's name. No revert is named per test. A test changed only for a behaviour the change preserves passes on the unchanged tree and after the change, and the report quotes both runs. A test that cannot fail, whatever the code under it does, is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the report quotes beside it the failure on the unchanged tree of the case or of its control, whichever fails there. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case and the failing line that the case, or for a silent case its control, printed on the unchanged tree. The table covers those behaviours, not every branch or every rule a head comment states.
diff --git a/skills/repo-setup/templates/docs/dev/coding-standards/common.md b/skills/repo-setup/templates/docs/dev/coding-standards/common.md
index ec3d0a4..66f21d8 100644
--- a/skills/repo-setup/templates/docs/dev/coding-standards/common.md
+++ b/skills/repo-setup/templates/docs/dev/coding-standards/common.md
@@ -13 +13 @@ The language pages in `docs/dev/coding-standards/` add to this page and never re
-- **Tests.** A test proves behaviour whose failure costs something, under the change standard's section "Scripts compute facts; judgment is read". Its rule "A test proves the change by failing without it, and the report quotes the red" sets how the proof is shown.
+- **Tests.** A test proves behaviour whose failure costs something, under the change standard's section "Scripts compute facts; judgment is read". Its rule "A test proves the change by failing on the unchanged tree, and the report quotes the failure" sets how the proof is shown.
diff --git a/skills/spec/templates/brief.md b/skills/spec/templates/brief.md
index 9a135a5..16a5275 100644
--- a/skills/spec/templates/brief.md
+++ b/skills/spec/templates/brief.md
@@ -62 +62 @@ Run from <directory>, each must hold, each output piped through the filter the r
-4. Each new or changed test names the revert that turns it red. A test that no revert turns red is an audit, not a proof, and this brief says which it is.
+4. Each new test, and each test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, or, for a case asserting that a rule stays silent, the case or its control fails there; the report quotes that failure. A test that cannot fail, whatever the code under it does, is an audit, not a proof, and this brief says which it is.
```


## Reading cases

- Rule 13 new text against the ruling: it says a new test, and a test changed for added or changed behaviour, is run once on the unchanged tree and fails there ("is run once on the unchanged tree and fails there"); the report quotes that failing output verbatim beside the test's name ("The report quotes that failing output verbatim beside the test's name"); no revert is named per test ("No revert is named per test."); a test that cannot fail is found by reading ("The reviewer finds such a test by reading it."). Holds.
- Rule 17, each rule of the old rule 13 in the new text: audit examples (source text, a name alone, a constant, a path the suite never executes) are in "A test that cannot fail ... is an audit, not a proof: an assertion over source text, ..."; the control for a silent case is in "A case asserting that a rule stays silent carries a control, the near-miss the same rule must report"; the table per behaviour whose failure costs something is in "Each behaviour the change adds or changes whose failure costs something ... has a case, and the report lists them in a table"; the table's limit is in the last sentence "The table covers those behaviours, not every branch or every rule a head comment states."; the verbatim quote is in "quotes that failing output verbatim". Added beyond the ruling, each from a decision of the brief: the definition of the unchanged tree (decision 5), the sentence on a test changed for a preserved behaviour (decision 6) and the silent-case exception (decision 3). Holds.
- Rule 19: the new rule 13's sentences read against each other: "fails there, except a case asserting that a rule stays silent" matches the later silent-case sentence, and "A test changed only for a behaviour the change preserves passes on the unchanged tree" does not conflict with "fails there" because that sentence covers only tests for added or changed behaviour. `skills/refute/SKILL.md:100` ("a "seen failing first" claim with no quoted failing check") read against the first new bullet (line 107): both name a missing quote; line 100 covers any check, the bullet covers a new or changed test; a claim about a new test with no quote falls under both, and neither says otherwise. The new rule 13 against rule 1 of both copies (line 27, "begins with a test that fails on the tree as it is", "The report quotes the failing check"): same demand, no contradiction; rule 1's "one that would have passed before it, is not a test of the defect" holds for a silent case only through its control, which rule 13 requires. `skills/spec/templates/brief.md:20` (cases run on the unchanged tree first) and `:62`: agree. `skills/refute/SKILL.md:98` (a case whose first run on the unchanged tree is not given) and the two new bullets: agree. The glossary's **case** (`docs/glossary.md:18`, "The first run is the run of every case on the unchanged tree"): agrees. Nothing contradicts another.
- `docs/dev/skill-layout.md` "Writing for an agent", one rule per bullet: the first new bullet states one rule (a new or changed test's unchanged-tree run is quoted), with its two variants as qualifiers of the same rule in the same bullet, as "Lists and tables" says a qualifier stays; the second states one rule (a test that cannot fail, found by reading). Holds.
- Final grep over the tree after the change: `git grep -n -i -E "revert that|turns (it )?red|change reverted|failing without it|red line it produced|names the revert|stays green" -- skills docs README.md utils` printed nothing.

## Judgment calls the brief left open

None. The dictated text was written as given.

## User-visible changes

The six lines above, before and after, are the whole change; no script, test or host behaviour changed. The installed change standard of a repository set up by `/repo-setup` gets the new rule 13 and the `common.md` title through its templates.

## Anything in the brief that was wrong or impossible

Nothing found. One observation for the orchestrator, no action taken: the two `/refute` bullets and line 100 overlap for a "seen failing first" claim about a new test with no quote (it is a finding under both). They do not contradict.


## Repair round 1

Everything in the round's brief is done. Nothing is NOT DONE. The dictated text of items 1 to 3 was written exactly (a python comparison of each written line with the quoted line in `8-round-1.md` printed True for rule 13 in both copies, True for `brief.md:62`, and True, True, True for `skills/refute/SKILL.md` lines 107, 108, 109). The edit was made by `$TMPDIR/apply8r1.py`, which asserts each old line's opening words and replaces lines 39, 39, 62 and 107-108 with the dictated text; it computes nothing else.

### Changes, old beside new

Rule 13, `docs/dev/change-standard.md:39` and `skills/repo-setup/templates/docs/dev/change-standard.md:39` (same line in both; `diff` of the two lines prints nothing, rc=0).

Old (round 0):

```
13. **A test proves the change by failing on the unchanged tree, and the report quotes the failure.** The unchanged tree is the tree before the change; for a plan step it is the tree at the step's base. Every new test, and every test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, except a case asserting that a rule stays silent. The report quotes that failing output verbatim beside the test's name. No revert is named per test. A test changed only for a behaviour the change preserves passes on the unchanged tree and after the change, and the report quotes both runs. A test that cannot fail, whatever the code under it does, is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the report quotes beside it the failure on the unchanged tree of the case or of its control, whichever fails there. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case and the failing line that the case, or for a silent case its control, printed on the unchanged tree. The table covers those behaviours, not every branch or every rule a head comment states.
```

New:

```
13. **A test proves the change by failing on the unchanged tree, and the report quotes the failure.** The unchanged tree is the tree before the change; for a plan step it is the tree at the step's base. A test of a behaviour the change adds or changes is run on the unchanged tree and fails there, and it is run there again after every change to the test. The report quotes that failure verbatim beside the test's name, and it names no revert. A test of a behaviour the change preserves, new or changed, passes after the change; the report quotes that run and, for a test that existed on the unchanged tree, its run there in the form it had. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the quoted failure comes from whichever of the two is the test of a behaviour the change adds or changes. A test that cannot fail when the behaviour it is listed for is broken is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The reviewer finds such a test by reading it. Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case and the failing line quoted for it. The table covers those behaviours, not every branch or every rule a head comment states.
```

`skills/spec/templates/brief.md:62`.

Old:

```
4. Each new test, and each test changed for a behaviour the change adds or changes, is run once on the unchanged tree and fails there, or, for a case asserting that a rule stays silent, the case or its control fails there; the report quotes that failure. A test that cannot fail, whatever the code under it does, is an audit, not a proof, and this brief says which it is.
```

New:

```
4. Each test of a behaviour the change adds or changes is run on the unchanged tree and fails there, and the report quotes that failure; each test of a behaviour the change preserves passes after the change, and the report quotes that run. A test that cannot fail when the behaviour it is listed for is broken is an audit, not a proof, and this brief says which it is.
```

`skills/refute/SKILL.md`, lines 107-108 (two bullets) become lines 107-109 (three bullets).

Old:

```
  - a new or changed test whose run on the unchanged tree the report does not quote: its failure there, or for a case asserting that a rule stays silent the failure there of the case or of its control, or for a test changed only for a behaviour the change preserves its passing runs before and after the change;
  - a test that cannot fail, whatever the code under it does, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
```

New:

```
  - a new or changed test of a behaviour the change adds or changes with no failure on the unchanged tree quoted for it (for a case asserting that a rule stays silent, the failure of the case or of its control);
  - a new or changed test of a behaviour the change preserves with no passing run after the change quoted for it;
  - a test that cannot fail when the behaviour it is listed for is broken, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
```

Point 4 (Proof 2) is the runner output below, quoted whole with the exit status captured in the same command (`...; echo "rc=$?"`, no pipe). Point 5 (Proof 1) is the readings below.

### Commands and output, verbatim

Run from the worktree root after the change.

```
$ git grep -n "names the revert" -- skills docs README.md utils
rc=1
$ case 2 grep
rc=1
$ wider grep
rc=1
$ diff line 39 copies
rc=0
$ grep -c -F title
skills/repo-setup/templates/docs/dev/change-standard.md:1
skills/repo-setup/templates/docs/dev/coding-standards/common.md:1
docs/dev/change-standard.md:1
$ git diff --stat HEAD -- . :!.scratch
 docs/dev/change-standard.md                                     | 2 +-
 skills/plan-retro/SKILL.md                                      | 2 +-
 skills/refute/SKILL.md                                          | 4 +++-
 skills/repo-setup/templates/docs/dev/change-standard.md         | 2 +-
 skills/repo-setup/templates/docs/dev/coding-standards/common.md | 2 +-
 skills/spec/templates/brief.md                                  | 2 +-
 6 files changed, 8 insertions(+), 6 deletions(-)
$ grep plan-retro
67:- A kind is a sentence that states the defect in general 
$ ASCII grep six files
rc=1
$ runner
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

Case 5 now prints `6 files changed, 8 insertions(+), 6 deletions(-)`, the count the round names. Case 6 is quoted cut to 60 characters; its line 67 is unchanged by this round. The step still adds and changes no test.

### Point 5: rule 19 read again over the new rule 13

The sentences of the new rule 13, numbered in order: (S1) title; (S2) the unchanged tree is the tree before the change, for a plan step the tree at the step's base; (S3) a test of a behaviour the change adds or changes is run on the unchanged tree and fails there, and is run there again after every change to the test; (S4) the report quotes that failure verbatim beside the test's name and names no revert; (S5) a test of a behaviour the change preserves, new or changed, passes after the change, and the report quotes that run and, for a test that existed on the unchanged tree, its run there in the form it had; (S6) a case asserting that a rule stays silent carries a control, and the quoted failure comes from whichever of the two is the test of a behaviour the change adds or changes; (S7) a test that cannot fail when the behaviour it is listed for is broken is an audit; (S8) the reviewer finds such a test by reading; (S9) each behaviour the change adds or changes whose failure costs something has a case, and the report lists them in a table with the failing line quoted for it; (S10) the table covers those behaviours only.

1. A new rule with a silent case and its control. The rule does not exist on the unchanged tree. The control (the near-miss the rule must report) tests the added behaviour, so under S3 it is run on the unchanged tree and fails there. The silent case tests that the rule stays quiet on a valid input, which is preserved behaviour on the unchanged tree (nothing reports), so under S5 it passes after the change, and the report quotes that run; it is not asked to fail. S6 says the quoted failure is the control's, and S9 puts the control's failing line in the table. Which test fails where: the control fails on the unchanged tree; the silent case passes on both. Sentences: S3 for the control, S5 for the silent case, S6 and S9 for what is quoted. No sentence asks the silent case to fail.
2. A fix of a false report. The rule reports on the unchanged tree where it should stay silent. The silent case tests the changed behaviour (it must now stay silent), so under S3 it fails on the unchanged tree, and S6 makes it the source of the quoted failure, quoted in the table by S9. The control (the near-miss the rule must still report) tests a behaviour the change preserves, so under S5 it passes after the change and the report quotes that run; S5's "for a test that existed on the unchanged tree, its run there" adds its passing run on the unchanged tree if it existed there, and if it is new, only the run after the change is asked. Which test fails where: the silent case fails on the unchanged tree; the control passes on both. Sentences: S3 for the silent case, S5 for the control, S6 for choosing which is quoted. No sentence asks the control to fail, which is the contradiction round 0 had.
3. A refactor that renames a function and changes its test. The behaviour is preserved, so S3 does not apply and S5 does: the test passes after the change, and the report quotes that run and, since the test existed on the unchanged tree, its run there in the form it had, the old test calling the old name, which passes there. Which test fails where: none fails; the old form passes on the unchanged tree, the new form passes after the change. The new form run on the unchanged tree would fail with a name error, and no sentence asks for that run. Sentences: S5 only; S3 is not triggered because no behaviour is added or changed, and S7 applies to it only if the renamed test could not fail when the behaviour breaks, which is read by the reviewer under S8.

No pair of sentences contradicts in these three cases: S3 and S5 cover disjoint tests (added or changed behaviour against preserved behaviour), S6 chooses between two tests by that same division, and S9's column ("the failing line quoted for it") names the line S3, S4 and S6 quote. The `/refute` bullets read against S3 to S6: bullet 1 (a test of an added or changed behaviour, no failure quoted, silent case by its case or control) matches S3, S4, S6; bullet 2 (a test of a preserved behaviour, no passing run after) matches S5; bullet 3 (cannot fail when the behaviour is broken, by reading) matches S7 and S8. `skills/refute/SKILL.md:100` is unchanged and reads against bullet 1 as before: it covers any check that carries a "seen failing first" claim, bullet 1 a test's missing failure. The rule against rule 1 of both copies (line 27, "begins with a test that fails on the tree as it is") and `skills/spec/templates/brief.md:20` and `:62`, `skills/refute/SKILL.md:98`, and the glossary's **case** (`docs/glossary.md:18`): agree, as in round 0; `brief.md:62` now uses the same division as S3 and S5.

### Left for the orchestrator (not changed, outside the round's dictated text)

- Behaviour 1 of the refuter report (game-engine and cathedra keep the old rule 13 in their own change standards) is outside the worktree and outside this round's items; nothing was touched there.
- Spec 5's widened words ("cannot fail when the behaviour it is listed for is broken") were written as dictated; the brief's decision 7 still says the per-behaviour proof rests on "a test that cannot fail" and is the orchestrator's to reword in the ledger.
