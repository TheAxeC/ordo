Everything in the brief is done. The dry run of the case "a dry run on paper" names four points where the skill's text leaves a choice open, under "Judgment calls".

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
| Description length at most 1024 | the `skill-layout.md` command, filtered to `diagnose` | `812 skills/diagnose/SKILL.md` | DONE |
| Verify 3, ASCII | `LC_ALL=C grep -n '[^ -~]' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` | no output, exit 1 | DONE |
| Verify 4, no test added or changed | `git status --short` | ` M docs/glossary.md`, ` M skills/repo-setup/templates/plan-terms.md`, `?? skills/diagnose/` (no test file) | DONE |
| Verify 1, the verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"` | below | DONE |

The lines `checks.sh` printed, verbatim:

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

`git status --short` also shows `.scratch/2-f-diagnose/agents/reviews/1-report.md` once this report is written; it is the one path of the brief outside the three above.

## Reading results, after the change

### `skills/diagnose/SKILL.md` against `docs/dev/skill-layout.md`

- Frontmatter: `name: diagnose` equals the folder; `description` is one paragraph of 812 characters that ends with `Triggers on:`; its first words are "Find the cause of a defect"; it names no other skill; the triggers cover a person's request (`diagnose`, `debug this`, `find the cause of`, `why does this fail`) and a plan's (`the cause is not known`, `diagnose the finding`); `metadata.version` is `"1.0.0"` and the text carries no version, date or history.
- Sections in order: `grep -n '^## '` prints Quick start (12), Use instead (21), What it reads (29), Steps (46), Ways to build a red command (132, a reference section read at Steps 4), Stops (146), Anti-patterns (162), Rules (175); the title and its two sentences open the file; no other `##` heading.
- Quick start: one code block, four invocations, each with a comment, the first the one a new user types.
- Use instead: table with When and Use. What it reads: numbered, one input per item; items 3 and 5 say their absence is a refusal.
- Steps: 17 numbered items in execution order, one action each; each ends on a "Done when" line; the refusal (Steps 1) precedes the item that writes (Steps 3).
- Stops: four columns; Anti-patterns: three columns; Rules: one rule per bullet.
- Where a rule goes: each shortcut is an Anti-patterns row with its reason and a Do instead that names the Steps item; the steps that hold a shortcut name Anti-patterns (Steps 4, 9, 13); throughout rules are in Rules. The condition that makes a cause not found is stated in Steps 11 and again in the "The cause not found" Stops row's When cell, which a Stops table gives.
- Lists and tables: no bold; the git block carries `sh`; no table cell holds a rule that needs a list.
- Writing for an agent: every prohibition in Rules carries its instead in the bullet; no term outside the glossary (below); no reference material in `templates/`.
- Paths and names: `templates/diagnosis.md`, "the `spec` skill's 'What it reads' 5", `utils/pin.test.sh`, `/spec`, `plan-orchestration`, `.agents/plan.yaml` are named as the page says.
- Prose standard: `grep -n ';'` finds semicolons only in the code block and a table cell; no em dash, no spaced dash, no double blank line, the prose standard's filler words found by grep only in the required heading "Quick start".

### The skill against each requirement of item 1

- Invocations: Quick start lines 15 to 18.
- Who is present: Rules bullet 1, "Who is present decides the waits".
- Use instead: `/refute <entry> <step>`, `/spec <entry> <step>`, `/ordo-help <entry>`.
- What it reads: items 1 to 5 (symptom, rules file and standards, ledger and dispatch entry, brief, report); refusals named in items 3 and 5 and in Stops; the no-rules-file rules in Rules bullets 6 and 7 and the secrets bullet 4.
- Where probes run: Steps 2, with the four git commands, the `$TMPDIR` redirection, and Rules bullets 2 and 3.
- The red command: Steps 4 to 5, "Ways to build a red command" 1 to 11; the anti-pattern row for a hypothesis first; the flaky, slow, text and credential bullets; the no-red-command stop.
- The shrunk case: Steps 6. The hypotheses: Steps 7 and 8, Stops row "The hypotheses". Probes: Steps 9. The cause not found: Steps 11, Stops row. The cause: Steps 11. The fix and its test: Steps 12 to 15. Cleanup: Steps 16. Where the cause is written: Steps 3 (record path, appending) and 17. Redaction: Rules bullets 4 and 5, Steps 4 (credential), Stops row "Not enough output after redaction". Stops: the Stops table. Anti-patterns: the eight rows the brief lists. Rules: bullets 3, 6 and 7.

### The six parts of the Goal

- One command red on the exact symptom before any theory: Steps 4, Anti-patterns row 1.
- The case shrunk: Steps 6.
- Three to five ranked hypotheses that each name what would falsify it, shown to the user: Steps 7 and 8.
- One change per probe: Steps 9, Anti-patterns rows 3 and 4.
- The fix with a test red without it: Steps 12 to 14, Anti-patterns row 5.
- The cause written in the booking: Steps 17 (the last commit bullet outside a plan; the round brief and the landing's booking inside one).

### The skill against `diagnosing-bugs` (d81f3a1), phase by phase

- Redact: Rules bullets 4 and 5, Steps 4 (credential in the environment), Stops "Not enough output after redaction".
- Phase 1, a loop that goes red: Steps 4 and 5, "Ways to build a red command" (its ten ways plus the bisect and differential loops kept as 9 and 10, the human-driven script as 11), the three-runs criterion, the seconds-long criterion, the unattended criterion (Steps 5), the flaky rate (Steps 4), the slow-symptom baseline (Steps 4, replacing the perf branch), no loop: the "No red command" stop, and the ban on hypothesising without one (Anti-patterns row 1). `diagnosing-bugs` has no stop on a symptom that the scratch copy cannot reproduce; the skill adds it.
- Phase 2, reproduce and minimise: Steps 4 (the exact symptom), Steps 6 (cut one at a time, put back a cut that turns it green, done when each remaining part is needed).
- Phase 3, hypothesise: Steps 7 and 8 (three to five, falsifiable, the "If ... then" form, shown to the user). It differs on the wait: `diagnosing-bugs` does not block; the skill waits when a person runs it and goes on under `plan-orchestration` (ruling "Step list" D2).
- Phase 4, instrument: Steps 9 (one change, tied to a hypothesis, debugger first, boundaries, the tag `DIAG-<4 hex digits>`, Anti-patterns rows 7 and 8).
- Phase 5, fix and regression test: Steps 12 to 14, with "No test reaches it" for a missing seam and the rules file's rule on tests replacing "the missing seam is the finding" (Ordo's term **finding** is a reviewer's).
- Phase 6, cleanup: Steps 16 (tag grep, throwaway files, the red command again) and Steps 17 (the cause in the commit message's last bullet).

### The dry run on paper, on the defect of 2.E step 3 (`db9bbec^` with `3-round-0.diff` applied; `utils/pin.sh` compares `"${dir%/}"` with the agent folder)

Nothing was run. The skill's steps followed as far as the hypotheses, for `/diagnose a pin does not refuse the skill folder <HOME>/.claude/agents// and moves the pinned worktree before failing`:

- Steps 2: by hand, the probes run in the user's checkout; a red command that pins would move the pinned worktree, so it runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` under `$TMPDIR`.
- Steps 4, the red command (way 5, scratch repository and folders under `$TMPDIR`, in the form `utils/pin.test.sh` uses): pin tag v3, then run `utils/pin.sh v4` with `ORDO_SKILL_DIRS` holding `$HOME/.claude/agents//`, asserting the exit status is non-zero, the output holds the refusal `is both a skill folder and an agent folder`, and the pinned worktree is still at v3. It goes red on the exact symptom: status 1, "the links do not match the pin after linking", worktree at v4. Run three times from a freshly pinned v3 each time, the same verdict.
- Steps 5: the scratch repository built once by a setup function and reset from a copy, `HOME` pinned under `$TMPDIR`, the network not used.
- Steps 6, the cuts: the second folder of `ORDO_SKILL_DIRS` (still red, cut); the `.agents/skills` link setup (still red, cut); the second skill in the tag (still red, cut); the doubled trailing slash cut to one (green, put back); the pin at v3 before the run cut (the refusal is the same, the move is not observable, so the worktree assertion goes green, put back). Shrunk case: an `ORDO_SKILL_DIRS` folder equal to the agents folder with a doubled trailing slash, a prior pin, a tag to move to.
- Steps 7, hypotheses: (1) If the comparison at `utils/pin.sh:317` strips one trailing slash from the skill folder while the agent folder has every trailing slash stripped, then stripping every trailing slash from both turns the red command green; falsified if it stays red after that change, or if a print of both operands at line 317 shows them equal. (2) If the refusal exists but runs after the worktree moves, then moving the both-folders check before the pin's first change turns the worktree assertion green; falsified if the worktree is at v4 when the refusal is reached, or if the refusal never prints in the run. (3) If the agent folder keeps its doubled slash because line 112's strip is skipped for this input, then a single-slash `agents/` in `ORDO_SKILL_DIRS` stays red; falsified because the single slash is refused (that cut already went green).
- Steps 8: shown to the user with the red command, its output and the shrunk case; the skill waits.

Where the skill's text leaves a choice open:

- The tree of a defect that never reached main: outside a plan the probes run in the user's checkout, and the skill has no scratch checkout for a by-hand run, so the choice of building `db9bbec^` with the diff in a scratch copy is left to the person.
- Which of the two symptoms the red command asserts (the missing refusal, the moved worktree): Steps 4 says "the exact symptom" and the symptom in the user's words names both.
- Whether the red command is a new case in `utils/pin.test.sh` (way 1) or a scratch harness (way 5): the order prefers way 1, and Steps 12 writes the test after the shrink, so the text leaves open whether the red command and the test are the same file.
- How a run that changes state (a pin) is reset between the three runs: Steps 4 requires the same verdict three times and Steps 5 isolates the file system, and neither says the state is rebuilt for each run.

### Every term the skill uses against `docs/glossary.md` after the sync

- Defined by this step: red command, hypothesis, shrunk case, case (the scenario of a diagnosis), diagnosis record, cause not found, probe (both senses), at `docs/glossary.md` lines 20, 21, 33, 47, 70, 76, 97.
- Used in the sense the glossary defines: stop, refusal, open item, ruling (the orchestrator's decision on a finding sent in a repair round), booking (the landing's), finding (a reviewer's), Step 0, ledger, state file, dispatch entry, base, worktree, brief, brief check, refuter report, red line, resume point, rules file, standards, repair round, orchestrator.
- The word "case" appears only as the diagnosis sense; "booking" appears once (line 129, the landing's booking) and "finding" only for a finding of a plan's report (`grep -n -o -i -w 'booking\|finding'` lines 3, 16, 18, 33, 40, 41, 44, 64, 129, 159, 160, 178); outside a plan the skill says "the last bullet of the commit message".

## Files changed

- `skills/diagnose/SKILL.md`, new, 183 lines.
- `skills/diagnose/templates/diagnosis.md`, new, 93 lines.
- `skills/repo-setup/templates/plan-terms.md`, 7 lines added, none changed.
- `docs/glossary.md`, 7 lines added by `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, none changed.

### Lines added to `plan-terms.md` and `docs/glossary.md` (before: absent; after: the line)

```
- **case, of a diagnosis**: the scenario that reproduces a symptom: its input, callers, configuration, data and stages of the run. The original case is that scenario before it is shrunk. Stated in: `diagnose`, Steps 4 and 6.
- **cause not found**: the end of a diagnosis whose second list of hypotheses is falsified, or whose probes cannot separate the hypotheses left, or under `plan-orchestration` whose red command cannot be built. The record says so with every probe. Inside a plan it is raised to the user as an open item and is not sent to the builder. Stated in: `diagnose`, Steps 11 and "Stops".
- **diagnosis record**: the copy of the `diagnose` skill's `templates/diagnosis.md` that a diagnosis fills in, holding the symptom, the red command with its runs, the cuts of the shrunk case, the hypotheses, the probes, the cause and the fix with its test. Inside a plan it is `agents/reviews/<step>-diagnosis.md` in the ledger. Stated in: `diagnose`, Steps 3.
- **hypothesis**: one of the three to five ranked causes of a diagnosis, written "If <cause>, then <change> turns the red command green" with the result that would falsify it. Stated in: `diagnose`, Steps 7.
- **probe**: a command run to check a claim about the tree. Stated in: `spec`, "What it reads" 5 and Steps 2. Also, in a diagnosis, one change tied to one hypothesis with the red command run after it. Stated in: `diagnose`, Steps 9.
- **red command**: the one command of a diagnosis that drives the code path of the symptom and goes red on the exact symptom, run and its output quoted before any hypothesis. Stated in: `diagnose`, Steps 4.
- **shrunk case**: the case of a diagnosis after each part of it has been cut one at a time, a cut that turned the red command green put back, so that removing any remaining part turns it green. Stated in: `diagnose`, Steps 6.
```

Alphabetical places: `case, of a diagnosis` and `cause not found` after `case`; `diagnosis record` after `design tree`; `hypothesis` after `handover`; `probe` after `preparation commit`; `red command` after `recurring finding`; `shrunk case` after `shared-rules block`. The existing **premise** entry is unchanged.

## Judgment calls

- The ways to build a red command are a reference section of `SKILL.md`, since the brief's paths allow no `references/` file and every run reads them at Steps 4.
- Steps 2 chooses where the probes run and Steps 3 opens the record with the symptom, so each item holds one action; the record inside a plan is created at its ledger path at Steps 3 and appended to for a later diagnosis, outside a plan it is a copy in `$TMPDIR` shown whole at Steps 17.
- A defect in code whose failure costs nothing gets no test (Steps 12); the brief names only "No test reaches it" for a place no test can reach, and the template has a separate line "No test is written" for this case.
- For `red line` the report is the failure the landing booked in the state file's open items and under the step's Step 0, as `land` Steps 6 and the glossary's **Step 0** entry say.
- The first five rows of Stops are stops and the last four refusals; the cause not found inside a plan leaves an open item and the others none, as the glossary's two senses of **stop** allow.
- Quick start has four lines, one per form of `<finding>` the brief names.
- The template names `plan-orchestration` in one placeholder line ("none, run under `plan-orchestration`").

## User-visible changes

- New skill `/diagnose`; before: no such skill (`ls skills/diagnose` failed), after: `skills/diagnose/SKILL.md` and `skills/diagnose/templates/diagnosis.md`.
- Glossary: before, no entry for the seven terms; after, seven entries (lines above).
- No wiring: `plan-orchestration`'s "Only known fixes" still says "diagnosed by the orchestrator, read-only" without naming `/diagnose`, and the README and `ordo-help` do not list the skill; these are step 2's.

## Anything in the brief that was wrong or impossible

Nothing. The dry run's four open choices are in the text the brief asked for, not errors in the brief. `plan-orchestration` line 100 uses "slow case" in a sense the glossary's **case** does not define; the brief puts that text in step 2.

## The step's tests

The step adds and changes no test: `git status --short` lists no test file.

## New files, whole

### `skills/diagnose/SKILL.md`

````markdown
---
name: diagnose
description: "Find the cause of a defect before changing anything: one command run red on the exact symptom, the case shrunk until each remaining part is needed for the red, three to five ranked hypotheses that each name the result that would falsify them, one change per probe tied to one hypothesis, the fix with a test run red without it where the failure costs something, and the cause written where it is kept. Run by a person, it waits for the reply to the hypotheses before the first probe. Run unattended in a plan's loop, it probes on a scratch copy, leaves the step's worktree unchanged and hands the fix to the builder as the round's ruling. It leaves behind the diagnosis record. Triggers on: diagnose, diagnose this, debug this, find the cause of, why does this fail, the cause is not known, diagnose the finding."
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
3. Inside a plan, the ledger folder and `orchestrator-state.md`, whose dispatch entry for the step names the worktree and the base.
   - `<entry>` resolves to its folder as the `spec` skill's "What it reads" 2 says.
   - No such folder, or no dispatch entry for the step, is a refusal ("Stops").
4. Inside a plan, the step's brief `agents/briefs/<step>.md`.
5. Inside a plan, the report the finding is in.
   - For a finding written as a heading and a number, the refuter report `agents/reviews/<step>-refuter.md`.
   - For `brief check <n>`, the brief check's report `agents/reviews/<step>-brief-check.md`.
   - For `red line`, the failure the step's landing booked in the open items of the state file and under the step's Step 0.
   - No such report or finding is a refusal ("Stops").

## Steps

1. Inside a plan, refuse when "What it reads" 3 or 5 finds an input missing.
   - Done when every input inside a plan exists, or the refusal names the missing one.
2. Choose where the probes run.
   - Outside a plan, the probes run in the user's checkout or worktree.
   - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with the step's worktree, made with these commands.
     ```sh
     git worktree add --detach "$tmp/tree" <base>     # from the main checkout; <base> is the dispatch entry's base
     git diff <base>                                  # from inside the step's worktree, saved to "$tmp/step.diff"
     git apply "$tmp/step.diff"                       # from inside "$tmp/tree"
     git status --porcelain --untracked-files=all     # from inside the step's worktree; each file listed with ?? is copied to the same path in "$tmp/tree"
     ```
   - A red command that would touch the user's real home, the installed skills or the pinned checkout runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` set under `$TMPDIR`, as `utils/pin.test.sh` sets them.
   - Done when the probes have a place to run, and inside a plan `git status --short` and `git diff <base>` from inside the step's worktree print what they printed before the copy was made.
3. Open the diagnosis record with the symptom quoted in its Symptom section.
   - Outside a plan, the record is a copy of `templates/diagnosis.md` in `$TMPDIR`, filled as the steps below run.
   - Inside a plan, the record is `agents/reviews/<step>-diagnosis.md` beside the state file, a copy of `templates/diagnosis.md` filled as the steps below run.
   - A later diagnosis of the same step is appended to that file under its own heading, which names its finding.
   - Inside a plan, the record is written to disk in the main checkout and not committed on its own.
     - The next resume-point commit carries it, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
   - Done when the record exists and its Symptom section holds the symptom as "What it reads" 1 gives it, word for word.
4. Build the red command: one command that drives the code path of the symptom and goes red on the exact symptom.
   - A hypothesis formed, or code read to form one, before the command has been run red is an Anti-patterns row.
   - The red command asserts the symptom itself, the error text or the wrong output, and never that something ran.
   - The ways to build one are in "Ways to build a red command", in the order to try them.
   - A symptom seen only sometimes gets a failure rate measured over a stated number of runs, raised by more runs, parallel runs or narrower timing until it is high enough to probe against.
   - A slow symptom gets a baseline first: the known-good version or the requirement measured over repeated runs with the mean and the spread, and red is a threshold stated from them.
   - A defect in text (a skill, a page, a rule or a brief whose instructions led to the wrong behaviour) has as its red the quoted text beside the line of a run or transcript that shows the wrong behaviour it led to.
   - A credential the red command needs is taken from the environment, never from a file into its command line or the record.
   - When no red command can be built by any of the ways, or the scratch copy cannot reproduce because the symptom needs the real environment or a credential the environment lacks, the skill stops ("Stops"): run by a person, it lists every way tried with what it gave and asks for what the "No red command" row names.
   - Under `plan-orchestration`, that is the cause not found, and the record says so with every way tried (Steps 11).
   - Done when the command has been run and its output quoted in the record, with the same verdict on three runs in a row, or the measured failure rate for a symptom seen only sometimes.
5. Tighten the red command.
   - It gets a faster setup, a sharper assertion on the symptom, pinned time, fixed random seeds, the file system isolated under `$TMPDIR` and the network cut, as far as the symptom allows.
   - Done when it runs unattended in seconds where the symptom allows, and its runs after the tightening are quoted.
6. Shrink the case: cut each part of it (an input, a caller, a configuration value, a piece of data, a stage of the run) one at a time, running the red command after each cut and putting back a cut that turns it green.
   - Done when removing any remaining part turns the red command green, and the record's Shrunk case section lists each cut with its result.
7. Form three to five ranked hypotheses, each written as "If <cause>, then <change> turns the red command green" and naming the result that would falsify it.
   - Where it helps, a hypothesis adds "<another change> makes it worse".
   - A hypothesis whose falsifying result cannot be named is sharpened or dropped.
   - Done when the record's Hypotheses section holds three to five hypotheses in rank order, each with its falsifying result.
8. Show the red command, its output, the shrunk case and the hypotheses.
   - Run by a person, the skill shows them and waits for the reply before the first probe ("Stops"), then ranks, drops or adds hypotheses as the reply says.
   - Under `plan-orchestration`, the hypotheses are written into the record, quoted in the round brief and in the landing report beside the record's path, and the skill goes on to Steps 9.
   - Done when a person has replied, or under `plan-orchestration` when the hypotheses are quoted in both places.
9. Probe one hypothesis at a time, in rank order.
   - Each probe is tied to one hypothesis, named by its rank, and changes one thing.
   - The red command is run after the probe, and the record's Probes section holds the hypothesis's rank, the one change, the run and the verdict, falsified or still standing.
   - The change is undone before the next probe, unless it is the fix.
   - A debugger or an interactive session is used where the language has one, and otherwise logging at the boundaries that separate the hypotheses.
   - Every line of logging a probe adds carries one tag unique to the diagnosis, `DIAG-` and four hexadecimal digits.
   - Logging without that tag, and logging everything to search afterwards, are Anti-patterns rows.
   - Done when each hypothesis probed has a recorded verdict, and one is still standing or all are falsified.
10. When every hypothesis is falsified, form a second list from what the probes showed, and show it as Steps 8 says.
    - Done when the record holds the second list with its falsifying results, and Steps 9 has run over it.
11. State the cause: the hypothesis the probes left standing, with the probe that shows it, the red command green with the change and red without it.
    - The cause is not found when the second list is falsified too, or when no probe can separate the hypotheses left.
    - For a cause not found, the record says so with every probe, and the skill goes to Steps 16.
    - Inside a plan, a cause not found is raised to the user as an open item, as `plan-orchestration`'s "Only known fixes" says, and is not sent to the builder.
    - Run by a person, a cause not found is shown and the skill stops ("Stops").
    - Done when the record's Cause section names the cause with its probe, or says "cause not found" with every probe.
12. For a defect in code whose failure costs something, write a test that reproduces the shrunk case at the place the defect occurs, and run it on the tree before the fix.
    - The rules file's rule that a test exists only for behaviour whose failure costs something decides whether the failure costs something.
    - A defect in code whose failure costs nothing gets no test.
    - A place no test can reach the defect as it occurs is written in the record under "No test reaches it", with the reason.
    - A defect in text is fixed by reading, with the text quoted before and after and no test.
    - Done when the record quotes the test's failure on the unfixed tree and that failure shows the symptom, or holds the reason no test is written, or for a defect in text quotes the text before.
13. Make the fix at the cause.
    - Anti-patterns names the guard that is not a fix and the test written after the fix.
    - Done when the fix is in the tree the probes ran in and the record quotes it, or for a defect in text quotes the text after.
14. Run the test, the red command and the original, unshrunk case.
    - Done when the test is green, the red command is green and the original case is green, each quoted in the record.
15. Inside a plan, write the fix and its test as the ruling of the repair round, as `plan-orchestration`'s Steps 8 sends a round.
    - The ruling quotes the cause, the fix, and both runs of the test.
    - The red command is the round's check.
    - The fix and the test were made on the scratch copy, and the skill does not change the step's worktree.
    - Done when the ruling is written and the step's worktree still prints what Steps 2 recorded.
16. Clean up.
    - Done when the grep of the tag over the tree the probes ran in prints nothing, and the scratch copy, removed with `git worktree remove --force "$tmp/tree"` from the main checkout, and every throwaway file are gone, a credential or `.env` file copied into `$TMPDIR` among them.
    - Run by a person outside a plan, done also when the red command run again on the original case is green.
17. Write where the cause is kept.
    - Outside a plan, the last bullet of the commit message states the cause, the red command and the fix's test, and the record is shown to the user whole, then its copy in `$TMPDIR` is removed.
    - Inside a plan, the round brief quotes the cause, and the landing's booking names it.
    - Done when the cause stands in that place.

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
| The hypotheses | Run by a person, once Steps 7 has formed them, or Steps 10 a second list | The red command with its output, the shrunk case and the ranked hypotheses with their falsifying results | The user's reply, then the probes with the ranking the reply gives |
| No red command | Run by a person, when every way in "Ways to build a red command" has been tried, or the scratch copy cannot reproduce | Every way tried with what it gave, and a request for access to where the symptom occurs, a captured artifact (redacted, with only the lines that carry the symptom), leave to add temporary instrumentation, or the credential set in the environment | What the request names, then Steps 4 again |
| A red command a person drives | Run by a person, when only a person can trigger the symptom | The script that prints each action for the user to take | The user's actions and what they observed, read back by the script |
| Not enough output after redaction | Run by a person, when the output with each secret written `<REDACTED>` cannot show the cause | That the redacted output is not enough, and what else the diagnosis needs | The user's answer, then the step that was running again |
| The cause not found | The second list is falsified, or no probe can separate the hypotheses left, or under `plan-orchestration` no red command can be built or the redacted output is not enough | The record with every probe | Inside a plan, the user's ruling on the open item; run by a person, the user's next direction |
| No ledger folder | Inside a plan, no folder holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/diagnose` again |
| No dispatch entry | Inside a plan, the state file has no dispatch entry for the step | A refusal that names the step | The step prepared with `/spec`, then `/diagnose` again |
| No report | Inside a plan, the report the finding is in is not on disk | The path where the report is read | The report written, then `/diagnose` again |
| No finding | Inside a plan, the report holds no finding under the name given | A refusal that names the finding and lists the findings the report has | `/diagnose` again with a name the report holds |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A hypothesis, or code read to form one, before the red command has been run red | The theory anchors on the first plausible cause while nothing shows the symptom | Build the red command first, as Steps 4 says |
| A red command that asserts only that something ran | It goes green on a nearby failure, and the fix is then judged against another defect | Assert the error text or the wrong output of the symptom, as Steps 4 says |
| Two changes in one probe | The verdict cannot say which change moved the result | One change per probe, as Steps 9 says |
| A probe tied to no hypothesis | Its result falsifies nothing, so it narrows nothing | Name the rank of the hypothesis it tests, as Steps 9 says |
| A test written after the fix | It has never failed, so nothing shows it catches the defect | Write the test and run it red on the unfixed tree, as Steps 12 says |
| A guard for a fix | A null check, an early return or a fallback silences the symptom while the cause stays, as the rules file's rule that a guard is not a fix says | Change the code at the cause Steps 11 states |
| Untagged logging | It survives the cleanup and reaches the commit | Tag every line with the diagnosis's one tag, as Steps 9 says |
| Logging everything and searching afterwards | The output does not separate the hypotheses, and the search finds what the reader already expects | Log at the boundaries that separate the hypotheses, as Steps 9 says |

## Rules

- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session running under `plan-orchestration` gets none.
- Inside a plan, the step's worktree is never changed and every probe runs on the scratch copy of Steps 2, so `plan-orchestration`'s rule that a finding whose cause is not known is diagnosed read-only holds.
- The skill never runs against the user's real home, the installed skills or the pinned checkout without the user's leave, and a red command that would touch them runs with those paths redirected, as Steps 2 says.
- Every quoted command output carries `<REDACTED>` in place of the value of a secret in it (a password, an API key, an access token, a private key, a session cookie, a credential inside a URL or a connection string), and keeps the rest of the line as printed, as the rules file's rule on secrets in quoted command output says.
- A captured artifact is quoted only in the lines that carry the symptom.
- With no rules file, a defect in code begins with a test that fails on the tree as it is.
- With no rules file, a guard is not a fix: a null check, an early return or a fallback does not close a defect, and the fix reaches the code that lacks the thing it needs.
````

### `skills/diagnose/templates/diagnosis.md`

````markdown
# Diagnosis: <the symptom in a few words>

Every quoted command output carries `<REDACTED>` in place of the value of a secret in it, as the rules file's rule on secrets in quoted command output says. A diagnosis of the same step later is appended below under its own heading, which names its finding.

## Symptom

<the symptom, quoted exactly: the user's words, or the failure scenario of the finding in the report that holds it, with the report's path and the finding's name>

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

Where the probes run: <the checkout or worktree, or the scratch copy's path>. The paths redirected under `$TMPDIR`: <HOME, ORDO_STABLE, ORDO_SKILL_DIRS, or none>.

Runs after the tightening, with the output of each quoted:

```
<the command and its output>
```

## Shrunk case

| Cut | Result of the red command after it | Kept or put back |
|---|---|---|
| <the part of the case cut: an input, a caller, a configuration value, a piece of data, a stage of the run> | <the verdict and the line that shows it> | <cut, or put back because it turned the red command green> |

The shrunk case, as it stands: <each part left, each one needed for the red>.

## Hypotheses

1. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
2. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
3. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.

The reply to the hypotheses, or "none, run under `plan-orchestration`": <what the user ranked, dropped or added>.

The second list, when every hypothesis was falsified, in the same form: <the hypotheses, or "not needed">.

## Probes

| Hypothesis rank | The one change | The run | Verdict |
|---|---|---|---|
| <the rank> | <the one change, and the tag `DIAG-<4 hex digits>` on any logging it adds> | <the red command's output after the change> | <falsified, or still standing> |

## Cause

<the hypothesis the probes left standing, with the probe that shows it: the red command green with the change and red without it; or "cause not found", with every probe above and the reason no probe separates the hypotheses left>

## Fix and test

Test, run on the tree before the fix:

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
