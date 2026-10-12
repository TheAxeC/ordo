Everything in the brief and in repair round 1 is done.

## Open items of 2.F's state file (verbatim)

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

none
```

## The cases, first run on the unchanged tree (base 3145b85)

- `ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md`:

```
ls: skills/diagnose/SKILL.md: No such file or directory
ls: skills/diagnose/templates/diagnosis.md: No such file or directory
```

- The description length command of `docs/dev/skill-layout.md`: `skills/diagnose/SKILL.md` is not listed; the eleven skills that exist print 748 grill, 726 land, 386 ordo-help, 632 ordo-init, 788 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 776 repo-setup, 997 roadmap, 1022 spec.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, rc=0.
- Reading `skills/diagnose/SKILL.md` against `docs/dev/skill-layout.md`, against each requirement of item 1 and the six parts of the Goal, against `diagnosing-bugs`, and the dry run: not possible, the file does not exist.
- Reading every term the skill uses against `docs/glossary.md`: `git show HEAD:docs/glossary.md | grep -c -E '^- \*\*(red command|hypothesis|shrunk case|case, of a diagnosis|diagnosis record|cause not found|probe)\*\*'` prints `0`, so the glossary holds none of the entries the skill's terms need (`probe` has its sense in the **premise** entry only).
- No case found a rule of the brief that is wrong.

## DONE / NOT DONE

| Item | Command | Output | Status |
|---|---|---|---|
| 1 `skills/diagnose/SKILL.md` | `ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md` | `skills/diagnose/SKILL.md` and `skills/diagnose/templates/diagnosis.md` | DONE |
| 2 `skills/diagnose/templates/diagnosis.md` | same command | same lines | DONE |
| 3 the terms, synced | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` | DONE |
| Description length at most 1024 | the `skill-layout.md` command, filtered to `diagnose` | `905 skills/diagnose/SKILL.md` | DONE |
| Verify 3, ASCII | `LC_ALL=C grep -n '[^ -~]' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` | no output, exit 1 | DONE |
| Verify 4, no test added or changed | `git status --short` | ` M docs/glossary.md`, ` M skills/repo-setup/templates/plan-terms.md`, `?? skills/diagnose/` (no test file) | DONE |
| Verify 1, the verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"` | below | DONE |

The lines `checks.sh` printed, verbatim, after repair round 1:

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

## Judgment calls

- The ways to build a red command are a reference section of `SKILL.md`, since the brief's paths allow no `references/` file and every run reads them at Steps 4.
- Steps 2 opens the record and Steps 3 chooses where the probes run, so the record can hold the state of the step's worktree taken before the copy; each Steps item holds one action.
- A defect in code whose failure costs nothing gets no test (Steps 16); the template's "No test is written" line records it.
- The first five rows of Stops are stops and the last four refusals; the cause not found inside a plan leaves an open item and the other stops none, as the glossary's two senses of **stop** allow.
- Quick start has four lines, one per form of `<finding>`.
- For a repair of a red line, the copy is main's head with the step's range applied by `git apply --3way`, as the round brief says.

## User-visible changes

- New skill `/diagnose`; before: no such skill (`ls skills/diagnose` failed), after: `skills/diagnose/SKILL.md` and `skills/diagnose/templates/diagnosis.md`.
- Glossary: before, no entry for the seven terms; after, seven entries (below).
- No wiring: `plan-orchestration`'s "Only known fixes" still says "diagnosed by the orchestrator, read-only" without naming `/diagnose`, and the README and `ordo-help` do not list the skill; `land` carries nothing of a diagnosis in its booking text; these are step 2's.

## Anything in the brief that was wrong or impossible

Nothing. `plan-orchestration` line 100 uses "slow case" in a sense the glossary's **case** does not define; the brief puts that text in step 2.

## The step's tests

The step adds and changes no test: `git status --short` lists no test file.

## Repair round 1

Each point: the text before, then after. Line numbers are the worktree's after the round.

1. Spec 1, where the hypotheses and the cause reach the user inside a plan.
   - Before, Steps 8: "Under `plan-orchestration`, the hypotheses are written into the record, quoted in the round brief and in the landing report beside the record's path, and the skill goes on to Steps 9." with "Done when ... under `plan-orchestration` when the hypotheses are quoted in both places"; Steps 17: "Inside a plan, the round brief quotes the cause, and the landing's booking names it."
   - After, Steps 8: under `plan-orchestration` the skill "writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run", done when the record holds them. Steps 20, first bullet: the ruling quotes "the hypotheses with their results, the cause, the fix, both runs of the test and the record's path". Steps 15: the open item of a cause not found "quotes the hypotheses and every probe or every way tried and names the record's path". Steps 23: "the orchestrator's booking at the step's landing names the record's path and states its cause, as `plan-orchestration`'s 'Only known fixes' says a cause is noted at landing".
2. Spec 2, where a found cause goes. Before, Steps 15: one bullet, the fix and test as the repair round's ruling. After, Steps 20 has four bullets, one per kind (the reviewer's first run: the next round's ruling; the run over the last round: fixed at landing when small and inside the brief, otherwise an open item, never sent; a red line: fixed at landing when inside the brief, otherwise the cause in Step 0 for `/spec`, never sent; a brief-check finding: the fix goes into the brief), and one Done line for all four.
3. Spec 3, a brief-check finding. Before, "What it reads" 3 required a dispatch entry for every kind and Steps 2 built the copy from its base. After, "What it reads" 3 reads a dispatch entry for a reviewer's finding and a red line only, the Stops row "No dispatch entry" names those two kinds, and Steps 3 makes the copy at `HEAD` with nothing applied and reads the brief and report as they stand on disk.
4. Spec 4, a red line. Before, the copy was `<base>` plus the step's diff. After, Steps 3: `<commit>` is `HEAD`, the range is `git diff --binary <base> <branch>` (the branch named after the kept worktree's folder, as `land`'s "Removing a step's worktree" says) applied inside the copy with `git apply --3way`; "What it reads" 3 says the entry reads `landing: backed-out`.
5. Spec 5. Before, the template had no place for the ways tried. After, `templates/diagnosis.md` has the section "No red command"; Steps 4 (its last bullet and its Done line), the Stops row "No red command" and Steps 15 name it.
6. Spec 6. Before, Steps 9: "The change is undone before the next probe, unless it is the fix." After, Steps 13 undoes each probe's change, "the one that turned the red command green included", the change stays in the record as a diff, Steps 17 runs the test on "the tree Steps 13 left" and Steps 18 makes the change again.
7. Spec 7. Before, "What it reads" 5: "the failure the step's landing booked in the open items of the state file and under the step's Step 0". After: the failure recorded under the step's Step 0 in `plan.md`, "and the open item in the state file when the landing booked one, which `land` Steps 6 does only when only the user can decide".
8. Standards 1. The restated rules at old lines 70, 93 and 122 are now pointers: Steps 4 "A red command that asserts only that something ran is an Anti-patterns row.", Steps 11 "Two changes in one probe, and a probe tied to no hypothesis, are Anti-patterns rows.", and Steps 20 "as \"Rules\" says". The Anti-patterns pointers name the new Steps numbers (4, 4, 11, 12, 17, 15, 11, 11).
9. Standards 2. Old items 12 (write and run the test), 17 (commit bullet, show, remove), 9 (run and record) and 8 (show and wait, re-rank) are split: Steps 8, 9, 10 (show; wait; re-rank), 11, 12, 13 (change; run and record; undo), 16, 17 (write the test; run it without the fix), 21, 23, 24 (show the record; commit bullet; remove the copy). Twenty-four items, each with its Done line (`awk` count below).
10. Standards 3. `Triggers on:` now also has "this is broken", "why is this slow", "this got slower", "this test is flaky", "fails only sometimes"; the description is 905 characters.
11. Standards 4. **case, of a diagnosis** now reads "Stated in: `diagnose`, Steps 6, 8, 16, 19 and 22, and \"Stops\"", from `grep -n -w -i case skills/diagnose/SKILL.md` (lines 3, 99, 100, 106, 135, 148, 149, 160, 189); **probe**'s first sense now reads "Stated in: `spec`, \"What it reads\" 5." Synced with `sync_rules.py . --only glossary --write`.
12. Standards 5. The cause not found has one definition in Steps 15, the Stops row (which points at Steps 15) and the glossary: the second list falsified, no probe separates the hypotheses left, and under `plan-orchestration` no red command can be built or the redacted output is not enough. "verdict" is gone from the skill and the template (`grep -n -i verdict` prints nothing); the template's columns read "Result".
13. Standards 6. Rules bullet 6 now reads "With no rules file, a defect in code whose failure costs something (lost work, a broken installation, a wrong configuration accepted) begins with a test that fails on the tree as it is." Steps 16 says the rules file's rule decides the cost and, with no rules file, "Rules" does.
14. Behaviour 1. The diff is `git diff --binary <base>`; `$tmp` is `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`; before the copy of a reviewer's finding, the output of `git status --short` and `git diff --binary <base> | shasum` is written into the record's new section "Where the probes run"; Steps 3 and Steps 20 compare against it.
15. Behaviour 2. Steps 3: a defect not on the checkout gets the same scratch copy from its commit and patch, by a person too. Steps 4: the red command asserts every part of the symptom; each of the three runs starts from the same state; a way-1 red command may be the test of Steps 16 and the record says so. Steps 23: the session drafts the commit bullet and commits only as the commit rule allows, otherwise shows it. Steps 15, 21, 22 and 24: after a cause not found the record is shown whole (Steps 21) before the cleanup, the cleanup keeps it, Steps 23 and 24 are not run.
16. Behaviour 3. Steps 23: the commit bullet also names "No test reaches it" with its reason when the record holds one. The person-driven red command stays described in words (way 11). A shipped script for it is not built here; it needs Axel's approval of what it computes, and the orchestrator raises it.
17. Proof 1, the dry run, below.

### Commands, run from the worktree root after the round

```
$ ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md
skills/diagnose/SKILL.md
skills/diagnose/templates/diagnosis.md
$ python3 -c '<the skill-layout description-length command>' | grep -E 'diagnose|spec'
905 skills/diagnose/SKILL.md
1022 skills/spec/SKILL.md
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ LC_ALL=C grep -n '[^ -~]' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
(no output, exit 1)
$ git status --short
 M docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/1-report.md
?? skills/diagnose/
```

The verify list, verbatim, is the block under "The lines `checks.sh` printed" above: `checks: 8 commands passed`, `rc=0`.

### The skill read again against `docs/dev/skill-layout.md`

- Frontmatter: name equals the folder; one paragraph of 905 characters ending in `Triggers on:`; first words "Find the cause of a defect"; no other skill named; a trigger phrase for a person's request, a slow symptom, an intermittent one and a plan's finding; the version only in `metadata.version`.
- Sections: `grep -n '^## '` prints Quick start (12), Use instead (21), What it reads (29), Steps (49), Ways to build a red command (169), Stops (183), Anti-patterns (199), Rules (212); no other `##` heading.
- Steps: `awk` counts 24 numbered items and 25 "Done when" or "done also when" lines (item 22 has two); every item has one; each item is one action.
- Where a rule goes: Steps 4, 11, 17, 18 name Anti-patterns rows instead of restating; Steps 20 names "Rules" for the worktree; the cause not found is defined once (Steps 15).
- One rule per bullet: read in full; Steps 20's first bullet is long and states one rule, the ruling's content.
- A step that can refuse or stop precedes what it guards: the refusal is Steps 1; the stop "No red command" (Steps 4) precedes the fix, the commit bullet and the booking.
- Tables and code: three tables with the required columns; the git block carries `sh`; no bold.
- Writing for an agent: each prohibition has its instead in its bullet or its Anti-patterns row; the terms are read against the glossary below.
- Paths and names: as before; the new names are `mktemp`, `git apply --3way` and the `land` skill's "Removing a step's worktree".
- Prose standard: `grep -n ';'` finds semicolons only in two table cells; `cat -s` leaves the file unchanged (no double blank line); no em dash.
- Terms: red command, hypothesis, shrunk case, case (a diagnosis), diagnosis record, cause not found and probe are in the glossary; "verdict" is not used; "booking" appears once (Steps 23) and "finding" only for a finding of a plan's report.

### The dry run on paper, redone against the skill as it stands

The defect: `db9bbec^` with `.scratch/2-e-grill/agents/reviews/3-round-0.diff` applied. Nothing was run. `/diagnose a pin does not refuse the skill folder <HOME>/.claude/agents// and moves the pinned worktree before failing`, run by a person:

- Steps 3: the defect is not on the checkout, so the scratch copy is `git worktree add --detach "$tmp/tree" db9bbec^` from the main checkout, the round-0 diff applied inside it with `git apply`, and the record's "Where the probes run" names both. `pin.sh` moves a pinned worktree, so the red command runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` under `$TMPDIR`.
- Steps 4, the red command, way 1: a case in `utils/pin.test.sh` beside the existing both-folders case, with `ORDO_SKILL_DIRS` holding `$d1` and `$a1//`, pinning v3, then running v4, asserting both halves of the symptom: the exit status is non-zero with "is both a skill folder and an agent folder" in the output, and the pinned worktree is still at v3. On the scratch copy it is red on both halves (status 1, "the links do not match the pin after linking", worktree at v4). `pin.test.sh` builds its own scratch root for each run, so the three runs start from the same state and give the same result. The record says this red command is also the test of Steps 16.
- Steps 6, the cuts: `$d1` cut (red, cut); the second skill in the tag cut (red, cut); `$a1//` cut to `$a1/` (green, put back); the pin at v3 cut (the worktree half can no longer be asserted and the message half stays red, put back since the red command asserts both halves). Shrunk case: the agents folder with a doubled trailing slash in `ORDO_SKILL_DIRS`, a prior pin at v3, a tag to move to.
- Steps 7, hypotheses, none falsified by the shrink:
  1. If the comparison `"${dir%/}" = "$agent_dir"` strips one trailing slash while `agent_dirs` strips all of them, then stripping every trailing slash from `dir` before the comparison turns the red command green. Falsified if it stays red after that change, or if a `DIAG-` print of both operands shows equal strings.
  2. If `agent_dirs` derives a path other than `$a1` from `$a1//`, then correcting the derivation turns the red command green. Falsified if the `DIAG-` print shows exactly `$a1`.
  3. If the refusal loop runs after the pinned worktree has moved, then moving it before the first change turns the worktree half green. Falsified if the message half stays red after the move, since the refusal then never fires for `$a1//`.
- Steps 8 and 9: shown to the user, the skill waits.

The choices the text still leaves: the ranking of the three hypotheses has no criterion beyond "ranked" (here the reviewer's report naming line 317 ranks the first); the patch's path is the person's to supply; whether moving a block (hypothesis 3) is one change is the person's call.

Corrected at landing: hypothesis 3 above does not stand. The red run's own output already gives its falsifying result (the message half is red with no refusal message), and the refusal loop sits before the move (round-0 diff lines 475-477). The run over repair round 1, in `1-refuter.md` under "Repair round 1, refuted", "My dry run on paper", gives three live hypotheses for this defect.

### The skill against item 1, the Goal and `diagnosing-bugs`, after the round

- Invocations: Quick start lines 15 to 18. Who is present: Rules bullet 1. Use instead: `/refute`, `/spec`, `/ordo-help`.
- What it reads: items 1 to 5, refusals in items 3 and 5 and in Stops. Where probes run: Steps 3, Rules bullets 2 and 3.
- The red command: Steps 4 and 5 and "Ways to build a red command"; the shrunk case: Steps 6; the hypotheses: Steps 7 to 10 and the Stops row "The hypotheses"; probes: Steps 11 to 13; the cause not found: Steps 15 and the Stops row; the cause: Steps 15; the fix and its test: Steps 16 to 20; cleanup: Steps 22; where the cause is written: Steps 2 (record path), 20 and 23; redaction: Rules bullets 4 and 5, Steps 4, the Stops row "Not enough output after redaction"; Anti-patterns: the eight rows; Rules: bullets 3, 6 and 7.
- The Goal's six parts: one command red on the exact symptom (Steps 4), the case shrunk (Steps 6), three to five ranked hypotheses shown to the user (Steps 7 to 10), one change per probe (Steps 11 to 13), the fix with a test red without it (Steps 16 to 19), the cause written in the booking (Steps 23, and the round's ruling and open item at Steps 15 and 20).
- `diagnosing-bugs`: Redact (Rules 4 and 5, Steps 4); Phase 1 (Steps 4 and 5, "Ways to build a red command", the "No red command" stop and section); Phase 2 (Steps 4 and 6); Phase 3 (Steps 7 to 10; the wait is the difference the ruling "Step list" D2 sets); Phase 4 (Steps 11 to 13, Anti-patterns rows 7 and 8); Phase 5 (Steps 16 to 19, with "No test reaches it" named in the commit bullet at Steps 23); Phase 6 (Steps 22 and 23).

## Files changed

- `skills/diagnose/SKILL.md`, new, 220 lines.
- `skills/diagnose/templates/diagnosis.md`, new, 106 lines.
- `skills/repo-setup/templates/plan-terms.md`, 7 lines added, none changed.
- `docs/glossary.md`, 7 lines added by `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, none changed.

### Lines added to `plan-terms.md` and `docs/glossary.md` (before: absent; after: the line)

```
- **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 6, 8, 16, 19 and 22, and "Stops".
- **cause not found**: the end of a diagnosis when the second list of hypotheses is falsified, when no probe separates the hypotheses left, or, under `plan-orchestration`, when no red command can be built or the redacted output is not enough to diagnose. The record says so with every probe, or every way tried. Inside a plan it is raised to the user as an open item and is not sent to the builder. Stated in: `diagnose`, Steps 15 and "Stops".
- **diagnosis record**: the copy of the `diagnose` skill's `templates/diagnosis.md` that a diagnosis fills in, holding the symptom, the red command with its runs, the cuts of the shrunk case, the hypotheses, the probes, the cause and the fix with its test. Inside a plan it is `agents/reviews/<step>-diagnosis.md` in the ledger. Stated in: `diagnose`, Steps 3.
- **hypothesis**: one of the three to five ranked causes of a diagnosis, written "If <cause>, then <change> turns the red command green" with the result that would falsify it. Stated in: `diagnose`, Steps 7.
- **probe**: a command run to check a claim about the tree. Stated in: `spec`, "What it reads" 5. Also, in a diagnosis, one change tied to one hypothesis with the red command run after it. Stated in: `diagnose`, Steps 9.
- **red command**: the one command of a diagnosis that drives the code path of the symptom and goes red on the exact symptom, run and its output quoted before any hypothesis. Stated in: `diagnose`, Steps 4.
- **shrunk case**: the case of a diagnosis after each part of it has been cut one at a time, a cut that turned the red command green put back, so that removing any remaining part turns it green. Stated in: `diagnose`, Steps 6.
```

## New files, whole

The files below are as the builder left them. The files as landed carry the fixes at landing that the booking of step 1 in `plan.md` lists.

### `skills/diagnose/SKILL.md`

````markdown
---
name: diagnose
description: "Find the cause of a defect before changing anything: one command run red on the exact symptom, the case shrunk until each remaining part is needed for the red, three to five ranked hypotheses that each name the result that would falsify them, one change per probe tied to one hypothesis, the fix with a test run red without it where the failure costs something, and the cause written where it is kept. Run by a person, it waits for the reply to the hypotheses before the first probe. Run unattended in a plan's loop, it probes on a scratch copy, leaves the step's worktree unchanged and hands the fix to the builder as the round's ruling. It leaves behind the diagnosis record. Triggers on: diagnose, diagnose this, debug this, this is broken, find the cause of, why does this fail, why is this slow, this got slower, this test is flaky, fails only sometimes, the cause is not known, diagnose the finding."
metadata:
  version: "1.0.0"
---

# Diagnose a defect

`/diagnose` finds the cause of a symptom with a command that is red on it, before any theory. It leaves behind the cause, stated with the probe that shows it, the fix with its test, and the diagnosis record, which holds every command and result of the run.

## Quick start

```
/diagnose <symptom>                        find the cause of a symptom, given in the user's words, in the checkout the skill is run in
/diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, written as the refuter report names it, such as Spec 1
/diagnose <entry> <step> red line          find the cause of a red line at the step's landing whose cause is not known
/diagnose <entry> <step> brief check <n>   find the cause of finding <n> of the step's brief check
```

## Use instead

| When | Use |
|---|---|
| A built step is to be reviewed | `/refute <entry> <step>` |
| The cause is known and a step is to be prepared | `/spec <entry> <step>` |
| Where a plan stands and which command comes next | `/ordo-help <entry>` |

## What it reads

1. The symptom, quoted exactly.
   - For `/diagnose <symptom>`, the user's words.
   - For a finding, the failure scenario in the report that holds it.
2. The rules file and the standards `.agents/plan.yaml` names, `docs/glossary.md` and the ADRs in force as the `spec` skill's "What it reads" 5 says, each when the repository has it.
   - With no rules file, "Rules" states the rules this skill needs.
3. Inside a plan, the ledger folder and `orchestrator-state.md`.
   - `<entry>` resolves to its folder as the `spec` skill's "What it reads" 2 says.
   - No such folder is a refusal ("Stops").
   - For a finding of a reviewer's report and for a red line, the dispatch entry for the step names the worktree and the base, and for a red line it reads `landing: backed-out`.
   - No dispatch entry for the step, for those two kinds, is a refusal ("Stops").
   - A brief-check finding has no dispatch entry yet, and none is read for it.
4. Inside a plan, the step's brief `agents/briefs/<step>.md`.
5. Inside a plan, the report the finding is in.
   - For a finding written as a heading and a number, the refuter report `agents/reviews/<step>-refuter.md`.
   - For `brief check <n>`, the brief check's report `agents/reviews/<step>-brief-check.md`, read as it stands on disk.
   - For `red line`, the failure the step's landing recorded under the step's Step 0 in `plan.md`, and the open item in the state file when the landing booked one, which `land` Steps 6 does only when only the user can decide.
   - No such report or finding is a refusal ("Stops").

## Steps

1. Inside a plan, refuse when "What it reads" 3 or 5 finds an input missing.
   - Done when every input inside a plan exists, or the refusal names the missing one.
2. Open the diagnosis record with the symptom quoted in its Symptom section.
   - Outside a plan, the record is a copy of `templates/diagnosis.md` in `$TMPDIR`, filled as the steps below run.
   - Inside a plan, the record is `agents/reviews/<step>-diagnosis.md` beside the state file, a copy of `templates/diagnosis.md` filled as the steps below run.
   - A later diagnosis of the same step is appended to that file under its own heading, which names its finding.
   - Inside a plan, the record is written to disk in the main checkout and not committed on its own.
     - The next resume-point commit carries it, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
   - Done when the record exists and its Symptom section holds the symptom as "What it reads" 1 gives it, word for word.
3. Choose where the probes run, and write into the record's "Where the probes run" section what it names.
   - Outside a plan, the probes run in the user's checkout or worktree.
   - Outside a plan, a defect that is not on the checkout (an older commit, with or without a patch) gets a scratch copy built as the next bullets say, from that commit and patch, run by a person too.
   - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with the step's worktree.
   - `$tmp` is made by `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`, and the copy is a detached worktree made from the main checkout.
   - The commands for each kind of finding are these.
     ```sh
     tmp=$(mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX")
     git worktree add --detach "$tmp/tree" <commit>                # from the main checkout
     git diff --binary <base>                                      # a reviewer's finding: from inside the step's worktree, saved to "$tmp/step.diff"
     git apply "$tmp/step.diff"                                    # a reviewer's finding: from inside "$tmp/tree"
     git status --porcelain --untracked-files=all                  # a reviewer's finding: from inside the step's worktree, listing the files to copy
     git diff --binary <base> <branch>                             # a red line: from the main checkout, saved to "$tmp/step.diff"
     git apply --3way "$tmp/step.diff"                             # a red line: from inside "$tmp/tree"
     ```
   - For a finding of a reviewer's report, `<commit>` is the dispatch entry's base, the step's diff is taken from inside the step's worktree, and each file listed with `??` is copied to the same path in the copy.
   - For a red line, `<commit>` is `HEAD` and the step's whole range is taken from the branch of the kept worktree, which is named after the worktree's folder as the `land` skill's "Removing a step's worktree" says.
   - For a brief-check finding, `<commit>` is `HEAD` and nothing is applied, since the brief and its report are read as they stand on disk.
   - Before the copy of a reviewer's finding is made, the output of `git status --short` and of `git diff --binary <base> | shasum`, run from inside the step's worktree, is written into the record.
   - A red command that would touch the user's real home, the installed skills or the pinned checkout runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` set under `$TMPDIR`, as `utils/pin.test.sh` sets them.
   - Done when the probes have a place to run and the record's section names it, and for a reviewer's finding the record holds the two outputs.
4. Build the red command: one command that drives the code path of the symptom and goes red on the exact symptom.
   - A hypothesis formed, or code read to form one, before the command has been run red is an Anti-patterns row.
   - The red command asserts every part of the exact symptom, both halves of a two-part symptom included, so that the shrink keeps what either part needs.
   - A red command that asserts only that something ran is an Anti-patterns row.
   - The ways to build one are in "Ways to build a red command", in the order to try them.
   - A red command of the first way, a failing test at the place the defect occurs, may be the test of Steps 16, and the record says so.
   - Each of the three runs starts from the same state: the red command sets its state up itself, or each run gets a fresh scratch folder.
   - A symptom seen only sometimes gets a failure rate measured over a stated number of runs, raised by more runs, parallel runs or narrower timing until it is high enough to probe against.
   - A slow symptom gets a baseline first: the known-good version or the requirement measured over repeated runs with the mean and the spread, and red is a threshold stated from them.
   - A defect in text (a skill, a page, a rule or a brief whose instructions led to the wrong behaviour) has as its red the quoted text beside the line of a run or transcript that shows the wrong behaviour it led to.
   - A credential the red command needs is taken from the environment, never from a file into its command line or the record.
   - When no red command can be built by any of the ways, or the scratch copy cannot reproduce because the symptom needs the real environment or a credential the environment lacks, the skill writes each way tried, with what it gave, into the record's "No red command" section.
   - Run by a person, that ends in the stop "No red command" ("Stops").
   - Under `plan-orchestration`, that is the cause not found (Steps 15).
   - Done when the command has been run and its output quoted in the record, with the same result on three runs in a row, or the measured failure rate for a symptom seen only sometimes, or the "No red command" section is written.
5. Tighten the red command.
   - It gets a faster setup, a sharper assertion on the symptom, pinned time, fixed random seeds, the file system isolated under `$TMPDIR` and the network cut, as far as the symptom allows.
   - Done when it runs unattended in seconds where the symptom allows, and its runs after the tightening are quoted.
6. Shrink the case: cut each part of it (an input, a caller, a configuration value, a piece of data, a stage of the run) one at a time, running the red command after each cut and putting back a cut that turns it green.
   - Done when removing any remaining part turns the red command green, and the record's Shrunk case section lists each cut with its result.
7. Form three to five ranked hypotheses, each written as "If <cause>, then <change> turns the red command green" and naming the result that would falsify it.
   - Where it helps, a hypothesis adds "<another change> makes it worse".
   - A hypothesis whose falsifying result cannot be named is sharpened or dropped.
   - A hypothesis the shrink has already falsified is not one of the three to five.
   - Done when the record's Hypotheses section holds three to five hypotheses in rank order, each with its falsifying result.
8. Show the red command, its output, the shrunk case and the hypotheses.
   - Run by a person, the skill shows them to the user.
   - Under `plan-orchestration`, the skill writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run.
   - Done when the user has been shown them, or under `plan-orchestration` when the record holds them.
9. Run by a person, wait for the user's reply before the first probe ("Stops").
   - Done when the user's reply is in.
10. Rank, drop or add hypotheses as the reply says.
    - Done when the record's Hypotheses section holds the list the reply leaves, with the reply quoted.
11. Make the one change of a probe: pick the next hypothesis in rank order and change one thing.
    - Two changes in one probe, and a probe tied to no hypothesis, are Anti-patterns rows.
    - A debugger or an interactive session is used where the language has one, and otherwise logging at the boundaries that separate the hypotheses.
    - Every line of logging a probe adds carries one tag unique to the diagnosis, `DIAG-` and four hexadecimal digits.
    - Logging without that tag, and logging everything to search afterwards, are Anti-patterns rows.
    - Steps 11 to 13 repeat for each hypothesis until each has a result.
    - Done when the tree differs from what it was before the probe by that one change.
12. Run the red command after the probe, and record the probe.
    - The record's Probes section holds the hypothesis's rank, the one change as a diff, the run and the result, falsified or still standing.
    - Done when the row is written.
13. Undo the change of the probe, the one that turned the red command green included.
    - Done when the tree is as it was before the probe, and the change stands in the record as a diff.
14. When every hypothesis is falsified, form a second list from what the probes showed, and show it as Steps 8 says.
    - Done when the record holds the second list with its falsifying results, and Steps 11 to 13 have run over it.
15. State the cause: the hypothesis the probes left standing, with the probe that shows it, the red command green with the change and red without it.
    - The cause is not found when the second list is falsified too, when no probe can separate the hypotheses left, or, under `plan-orchestration`, when no red command can be built or the redacted output is not enough to diagnose.
    - For a cause not found, the record says so in its Cause section, with every probe or, when no red command could be built, every way tried.
    - Inside a plan, a cause not found is raised to the user as an open item, as `plan-orchestration`'s "Only known fixes" says, which quotes the hypotheses and every probe or every way tried and names the record's path, and it is not sent to the builder.
    - After a cause not found the skill goes to Steps 21 and 22, and Steps 23 and 24 are not run.
    - Run by a person, a cause not found ends in a stop after Steps 22 ("Stops").
    - Done when the record's Cause section names the cause with its probe, or says "cause not found".
16. For a defect in code whose failure costs something, write a test that reproduces the shrunk case at the place the defect occurs.
    - The rules file's rule that a test exists only for behaviour whose failure costs something decides whether the failure costs something, and with no rules file "Rules" decides it.
    - A defect in code whose failure costs nothing gets no test, and the record says so.
    - A place no test can reach the defect as it occurs is written in the record under "No test reaches it", with the reason.
    - A defect in text is fixed by reading, with the text quoted before and after and no test.
    - Done when the test is written, or the record holds the reason no test is written.
17. Run the test on the tree without the fix and quote its failure.
    - The tree is the one Steps 13 left, with every probe's change undone.
    - A test written after the fix is an Anti-patterns row.
    - Done when the record quotes a failure that shows the symptom, or, for a defect in text, quotes the text before.
18. Make the fix at the cause, which is the change Steps 13 undid.
    - A guard for a fix is an Anti-patterns row.
    - Done when the fix is in the tree the probes ran in and the record quotes it, or for a defect in text quotes the text after.
19. Run the test, the red command and the original, unshrunk case.
    - Done when the test is green, the red command is green and the original case is green, each quoted in the record.
20. Inside a plan, hand the fix over by the kind of finding, and leave the step's worktree unchanged as "Rules" says.
    - A finding of the reviewer's first run: its fix and its test are the ruling of the next repair round, as `plan-orchestration`'s Steps 8 sends a round, quoting the hypotheses with their results, the cause, the fix, both runs of the test and the record's path, with the red command as the round's check.
    - A finding of the run over the last repair round: its fix is made at landing on main when it is small and inside the brief, and otherwise raised to the user as an open item, as the `refute` skill's "Over a repair round" 7 says, and it is never sent to the builder.
    - A red line: its fix is made at landing when it is inside the brief, as the `land` skill's Steps 6 says, and otherwise the cause is written in the step's Step 0 in `plan.md` for `/spec` to carry, and it is never sent to the builder.
    - A brief-check finding: its fix goes into the brief, as the `spec` skill's "Steps / The brief check" 4 closes a finding.
    - Done when the fix and its test stand in the place the kind of finding names, and for a reviewer's finding `git status --short` and `git diff --binary <base> | shasum` from inside the step's worktree print what the record holds.
21. Run by a person, show the record whole to the user, before the cleanup.
    - Done when the user has been shown the record.
22. Clean up, keeping the record.
    - Done when the grep of the tag over the tree the probes ran in prints nothing, and the scratch copy, removed with `git worktree remove --force "$tmp/tree"` from the main checkout, and every throwaway file are gone, a credential or `.env` file copied into `$TMPDIR` among them.
    - Run by a person outside a plan, done also when the red command run again on the original case is green.
23. Write where the cause is kept.
    - Outside a plan, the session drafts the last bullet of the commit message, which states the cause, the red command and the fix's test, and names "No test reaches it" with its reason when the record holds one.
    - Outside a plan, the session commits only as the repository's commit rule allows, and otherwise shows the bullet to the user.
    - Inside a plan, the orchestrator's booking at the step's landing names the record's path and states its cause, as `plan-orchestration`'s "Only known fixes" says a cause is noted at landing.
    - Done when the bullet is drafted and shown or committed, or, inside a plan, when the record's path and the cause are written for the landing's booking.
24. Outside a plan, remove the copy of the record in `$TMPDIR`.
    - Done when the copy is gone.

## Ways to build a red command

1. A failing test at the level that reaches the defect.
2. A command-line run on a fixture, its output compared with the expected output.
3. An HTTP request against a running server.
4. A headless-browser script that drives the view and asserts on what it shows.
5. Scratch files or a scratch repository under `$TMPDIR` that reproduce the state.
6. A replay of a captured input.
7. A small harness that calls the code path directly.
8. A loop over generated inputs, for a symptom that is sometimes wrong.
9. `git bisect run` on a scratch clone, when the defect appeared between two known states.
10. The same input through two versions, with the outputs compared.
11. For a symptom only a person can trigger, a script that prints each action for the user to take and reads back what they observed, which is the stop "A red command a person drives".

## Stops

The first five rows are stops. The cause not found, inside a plan, is a decision for the user and leaves an open item, and the other stops leave none. The last four rows are refusals.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The hypotheses | Run by a person, once Steps 7 has formed them, or Steps 14 a second list | The red command with its output, the shrunk case and the ranked hypotheses with their falsifying results | The user's reply, then the probes with the ranking the reply gives |
| No red command | Run by a person, when the record's "No red command" section is written | Every way tried with what it gave, and a request for access to where the symptom occurs, a captured artifact (redacted, with only the lines that carry the symptom), leave to add temporary instrumentation, or the credential set in the environment | What the request names, then Steps 4 again |
| A red command a person drives | Run by a person, when only a person can trigger the symptom | The script that prints each action for the user to take | The user's actions and what they observed, read back by the script |
| Not enough output after redaction | Run by a person, when the output with each secret written `<REDACTED>` cannot show the cause; under `plan-orchestration`, Steps 15 gives it as a cause not found | That the redacted output is not enough, and what else the diagnosis needs | The user's answer, then the step that was running again |
| The cause not found | One of the conditions Steps 15 gives | The record with every probe or every way tried, and inside a plan the open item | Inside a plan, the user's ruling on the open item; run by a person, the user's next direction |
| No ledger folder | Inside a plan, no folder holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/diagnose` again |
| No dispatch entry | Inside a plan, for a finding of a reviewer's report or a red line, the state file has no dispatch entry for the step | A refusal that names the step | The step prepared with `/spec`, then `/diagnose` again |
| No report | Inside a plan, the report the finding is in is not on disk | The path where the report is read | The report written, then `/diagnose` again |
| No finding | Inside a plan, the report holds no finding under the name given | A refusal that names the finding and lists the findings the report has | `/diagnose` again with a name the report holds |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A hypothesis, or code read to form one, before the red command has been run red | The theory anchors on the first plausible cause while nothing shows the symptom | Build the red command first, as Steps 4 says |
| A red command that asserts only that something ran | It goes green on a nearby failure, and the fix is then judged against another defect | Assert the error text or the wrong output of the symptom, as Steps 4 says |
| Two changes in one probe | The result cannot say which change moved it | One change per probe, as Steps 11 says |
| A probe tied to no hypothesis | Its result falsifies nothing, so it narrows nothing | Name the rank of the hypothesis it tests, as Steps 12 says |
| A test written after the fix | It has never failed, so nothing shows it catches the defect | Write the test and run it red on the tree without the fix, as Steps 17 says |
| A guard for a fix | A null check, an early return or a fallback silences the symptom while the cause stays, as the rules file's rule that a guard is not a fix says | Change the code at the cause Steps 15 states |
| Untagged logging | It survives the cleanup and reaches the commit | Tag every line with the diagnosis's one tag, as Steps 11 says |
| Logging everything and searching afterwards | The output does not separate the hypotheses, and the search finds what the reader already expects | Log at the boundaries that separate the hypotheses, as Steps 11 says |

## Rules

- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session running under `plan-orchestration` gets none.
- Inside a plan, the step's worktree is never changed and every probe runs on the scratch copy of Steps 3, so `plan-orchestration`'s rule that a finding whose cause is not known is diagnosed read-only holds.
- The skill never runs against the user's real home, the installed skills or the pinned checkout without the user's leave, and a red command that would touch them runs with those paths redirected, as Steps 3 says.
- Every quoted command output carries `<REDACTED>` in place of the value of a secret in it (a password, an API key, an access token, a private key, a session cookie, a credential inside a URL or a connection string), and keeps the rest of the line as printed, as the rules file's rule on secrets in quoted command output says.
- A captured artifact is quoted only in the lines that carry the symptom.
- With no rules file, a defect in code whose failure costs something (lost work, a broken installation, a wrong configuration accepted) begins with a test that fails on the tree as it is.
- With no rules file, a guard is not a fix: a null check, an early return or a fallback does not close a defect, and the fix reaches the code that lacks the thing it needs.
````

### `skills/diagnose/templates/diagnosis.md`

````markdown
# Diagnosis: <the symptom in a few words>

Every quoted command output carries `<REDACTED>` in place of the value of a secret in it, as the rules file's rule on secrets in quoted command output says. A diagnosis of the same step later is appended below under its own heading, which names its finding.

## Symptom

<the symptom, quoted exactly: the user's words, or the failure scenario of the finding in the report that holds it, with the report's path and the finding's name>

## Where the probes run

<the checkout or worktree, or the scratch copy's path with its commit and what was applied to it>. The paths redirected under `$TMPDIR`: <HOME, ORDO_STABLE, ORDO_SKILL_DIRS, or none>.

For a finding of a reviewer's report, taken before the copy was made, from inside the step's worktree:

```
<the output of git status --short>
<the output of git diff --binary <base> | shasum>
```

## Red command

```
<the one command>
```

Runs, with the output of each quoted:

```
<run 1: the command and its output>
<run 2: the command and its output>
<run 3: the command and its output>
```

<for a symptom seen only sometimes: the failure rate and the number of runs it was measured over; for a slow symptom: the baseline with its mean and spread, and the threshold red is defined as; for a defect in text: the quoted text beside the line of the run or transcript that shows the wrong behaviour it led to>

Runs after the tightening, with the output of each quoted:

```
<the command and its output>
```

## No red command

<written only when no red command could be built: each way tried from "Ways to build a red command", with what it gave, and why the scratch copy could not reproduce the symptom when that is so; otherwise "not applicable">

## Shrunk case

| Cut | Result of the red command after it | Kept or put back |
|---|---|---|
| <the part of the case cut: an input, a caller, a configuration value, a piece of data, a stage of the run> | <the result, red or green, and the line that shows it> | <cut, or put back because it turned the red command green> |

The shrunk case, as it stands: <each part left, each one needed for the red>.

## Hypotheses

1. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
2. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
3. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.

The reply to the hypotheses, or "none, run under `plan-orchestration`": <what the user ranked, dropped or added>.

The second list, when every hypothesis was falsified, in the same form: <the hypotheses, or "not needed">.

## Probes

| Hypothesis rank | The one change, as a diff | The run | Result |
|---|---|---|---|
| <the rank> | <the one change, with the tag `DIAG-<4 hex digits>` on any logging it adds> | <the red command's output after the change> | <falsified, or still standing> |

## Cause

<the hypothesis the probes left standing, with the probe that shows it: the red command green with the change and red without it; or "cause not found", with every probe above, or every way tried under "No red command", and the condition that makes it not found>

## Fix and test

Test, run on the tree without the fix:

```
<the test's command and its failing output, showing the symptom>
```

Fix:

```
<the change, as a diff>
```

Runs after the fix:

```
<the test's command and its passing output>
<the red command and its output>
<the original, unshrunk case and its output>
```

<for a defect in text: the text before and the text after, with no test>

No test reaches it: <the reason no test can reach the defect as it occurs, or "not applicable">. No test is written: <"the failure costs nothing", or "not applicable">.

## Cleanup

```
<the grep of the tag over the tree the probes ran in, and its empty output>
```

<the scratch copy and each throwaway file removed, a credential or .env file copied into `$TMPDIR` among them; the red command run again on the original case and its output, or "carried by the round as its check">
````
