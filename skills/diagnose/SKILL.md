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
/diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, written as the refuter report names it: Spec 1 for the first run, round 1 Spec 1 for the run over repair round 1
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
   - For a finding of a reviewer's report and for a red line, the dispatch entry for the step names the worktree and the base.
   - For a red line, the entry reads `landing: backed-out`: a red line the landing could not fix on main has taken the step back out of main, as the `land` skill's Steps 6 says.
   - No dispatch entry for the step, for a reviewer's finding or a red line, or for a red line an entry that does not read `landing: backed-out`, is a refusal ("Stops").
   - A brief-check finding has no dispatch entry yet, and none is read for it.
4. Inside a plan, the step's brief `agents/briefs/<step>.md`.
5. Inside a plan, the report the finding is in.
   - For a finding written as a heading and a number, the refuter report `agents/reviews/<step>-refuter.md`: the finding of that name in the first run, before any heading "Repair round <n>, refuted".
   - For a finding written `round <n>` and a heading and a number, the finding of that name under the heading "Repair round <n>, refuted" of the same report.
   - For `brief check <n>`, the brief check's report `agents/reviews/<step>-brief-check.md`, read as it stands on disk.
   - For `red line`, the failure the step's landing recorded under the step's Step 0 in `plan.md`, and the open item in the state file when the landing booked one, which `land` Steps 6 does only when what to do is a decision for the user.
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
   - Outside a plan, a defect that is not on the checkout (an older commit, with or without a patch) gets a scratch copy built as the next bullets say, run by a person too: `<commit>` is that commit, and the patch, read from where the user names it, is applied with the last line of the block.
   - Inside a plan, the probes run on a scratch copy under `$TMPDIR` that shares no file with the step's worktree.
   - `$tmp` is made by `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`, and the copy is a detached worktree made from the main checkout.
   - The commands for each source of the defect are these.
     ```sh
     tmp=$(mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX")
     git worktree add --detach "$tmp/tree" <commit>                # from the main checkout
     git diff --binary <base>                                      # a reviewer's finding: from inside the step's worktree, saved to "$tmp/step.diff"
     git apply --allow-empty "$tmp/step.diff"                      # a reviewer's finding: from inside "$tmp/tree"
     git status --porcelain --untracked-files=all                  # a reviewer's finding: from inside the step's worktree, listing the files to copy
     git diff --binary <base> <branch>                             # a red line: from the main checkout, saved to "$tmp/step.diff"
     git apply --3way --allow-empty "$tmp/step.diff"               # a red line: from inside "$tmp/tree"
     git apply --3way --allow-empty <patch>                        # outside a plan, a defect at an older commit with a patch: from inside "$tmp/tree"
     ```
   - For a finding of a reviewer's report, `<commit>` is the dispatch entry's base, the step's diff is taken from inside the step's worktree, and each file listed with `??` is copied to the same path in the copy.
   - For a red line, `<commit>` is `HEAD` and the step's whole range is taken from the branch of the kept worktree, which is named after the worktree's folder as the `land` skill's "Removing a step's worktree" says.
   - `--allow-empty` lets a step whose only changes are new files, with an empty tracked diff, be copied.
   - For a brief-check finding, `<commit>` is `HEAD` and nothing is applied, since the brief and its report are read as they stand on disk.
   - Before the copy of a reviewer's finding is made, the output of `git status --short` and of `git diff --binary <base> | shasum`, run from inside the step's worktree, is written into the record.
   - A red command that would touch the user's real home, the installed skills or the pinned checkout runs with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` set under `$TMPDIR`, as `utils/pin.test.sh` sets them.
   - Done when the probes have a place to run and the record's section names it, and for a reviewer's finding the record holds the two outputs.
4. Build the red command: one command that drives the code path of the symptom and goes red on the exact symptom.
   - A hypothesis formed, or code read to form one, before the command has been run red is an Anti-patterns row.
   - The red command asserts every part of the exact symptom, both halves of a two-part symptom included, so that the shrink keeps what either part needs.
   - Its output shows the result of each part: a suite that stops at its first failed assertion is run as one command per part, joined so that every one runs, so a cut that changes one part is seen.
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
   - With no person present, that is the cause not found (Steps 15).
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
   - The rank is by how much of the evidence (the red output, the shrunk case, the code read) each hypothesis explains, then by how cheap its probe is.
   - When the shrink and the code leave fewer than three causes standing, the list holds those, with the reason no other is live, and is never filled with one already falsified.
   - Done when the record's Hypotheses section holds three to five hypotheses in rank order, or fewer with the reason, each with its falsifying result.
8. Show the red command, its output, the shrunk case and the hypotheses.
   - Run by a person, the skill shows them to the user.
   - With no person present, the skill writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run.
   - Done when the user has been shown them, or with no person present when the record holds them.
9. Run by a person, wait for the user's reply before the first probe ("Stops").
   - Done when the user's reply is in.
10. Rank, drop or add hypotheses as the reply says.
    - Done when the record's Hypotheses section holds the list the reply leaves, with the reply quoted.
11. Make the one change of a probe: pick the next hypothesis in rank order and change one thing.
    - Two changes in one probe, and a probe tied to no hypothesis, are Anti-patterns rows.
    - A debugger or an interactive session is used where the language has one, and otherwise logging at the boundaries that separate the hypotheses.
    - A hypothesis a debugger or logging probe leaves standing gets one more probe, the change the hypothesis names, so that Steps 15 has the red command green with it and red without it.
    - For a slow symptom, a probe is a measurement: a timing harness or a profiler at the boundaries, compared with the baseline of Steps 4, or `git bisect run` between two known states; a log line does not measure time.
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
    - Run by a person, the skill waits for the reply and re-ranks as Steps 9 and 10 say before the first probe of the second list.
    - Done when the record holds the second list with its falsifying results, Steps 9 and 10 have run over it when run by a person, and Steps 11 to 13 have run over it.
15. State the cause: the hypothesis the probes left standing, with the probe that shows it, the red command green with the change and red without it.
    - The cause is not found when the second list is falsified too, when no probe can separate the hypotheses left, or, with no person present, when no red command can be built or the redacted output is not enough to diagnose.
    - For a cause not found, the record says so in its Cause section, with every probe or, when no red command could be built, a pointer to its "No red command" section, which lists every way tried.
    - Inside a plan, a cause not found is raised to the user as an open item, the one `plan-orchestration`'s "Stops" row "A finding that is the user's" leaves.
    - That open item quotes the hypotheses and every probe, or every way tried from the record's "No red command" section, and names the record's path.
    - A cause not found is never sent to the builder.
    - With no person present outside a plan, a cause not found is stated in the session's final message with the record's path.
    - After a cause not found the skill goes to Steps 21 and 22, then inside a plan to Steps 23; outside a plan Steps 23 and 24 are not run, so the record stays in `$TMPDIR` and its path is shown.
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
20. Inside a plan, hand the fix over by where the defect was found, and leave the step's worktree unchanged as "Rules" says.
    - A finding of the reviewer's first run: its fix and its test are the ruling of the next repair round, as `plan-orchestration`'s Steps 8 sends a round.
      - The ruling quotes the hypotheses with their results, the cause, the fix, both runs of the test and the record's path.
      - The red command is the round's check.
    - A finding of the run over the last repair round: its fix is made at landing on main when it is small and inside the brief, and otherwise raised to the user as an open item, as the `refute` skill's "Over a repair round" 7 says, and it is never sent to the builder.
    - A red line: the step is already out of main (`landing: backed-out`), so the cause, the fix and the record's path are written in the step's Step 0 in `plan.md`, for `/spec` to carry into the step's new brief.
      - The fix is never made on main outside a landing, and never sent to the builder.
    - A brief-check finding: its fix goes into the brief, as the `spec` skill's "Steps / The brief check" 4 closes a finding.
    - Done when the fix and its test stand in the place the defect's source names, and for a reviewer's finding `git status --short` and `git diff --binary <base> | shasum` from inside the step's worktree print what the record holds.
21. Run by a person, show the record whole to the user, before the cleanup.
    - With no person present outside a plan, the record's path is named in the session's final message instead, and Steps 24 is not run, so the record stays for whoever reads the run.
    - Done when the user has been shown the record, or the final message names its path.
22. Clean up, keeping the record.
    - Done when the grep of the tag over the tree the probes ran in prints nothing, and the scratch copy, removed with `git worktree remove --force "$tmp/tree"` from the main checkout, and every throwaway file are gone, a credential or `.env` file copied into `$TMPDIR` among them.
    - Run by a person outside a plan, done also when the red command run again on the original case is green.
23. Write where the cause is kept.
    - Outside a plan, the session drafts the last bullet of the commit message, which states the cause, the red command and the fix's test, and names "No test reaches it" with its reason when the record holds one.
    - Outside a plan, the session commits only as the repository's commit rule allows, and otherwise shows the bullet to the user.
    - Inside a plan, the orchestrator books the record at the step's landing, as the `land` skill's Steps 9 says.
    - Done when the bullet is drafted and shown or committed, or, inside a plan, when the record's path and the cause are written for the landing's booking.
24. Outside a plan, run by a person, remove the copy of the record in `$TMPDIR` once it has been shown.
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
| The hypotheses | Run by a person, once Steps 7 has formed them, or Steps 14 a second list (Steps 9 and 10) | The red command with its output, the shrunk case and the ranked hypotheses with their falsifying results | The user's reply, then the probes with the ranking the reply gives |
| No red command | Run by a person, when the record's "No red command" section is written | Every way tried with what it gave, and a request for access to where the symptom occurs, a captured artifact (redacted, with only the lines that carry the symptom), leave to add temporary instrumentation, or the credential set in the environment | What the request names, then Steps 4 again |
| A red command a person drives | Run by a person, when only a person can trigger the symptom | The script that prints each action for the user to take | The user's actions and what they observed, read back by the script |
| Not enough output after redaction | Run by a person, when the output with each secret written `<REDACTED>` cannot show the cause; with no person present, Steps 15 gives it as a cause not found | That the redacted output is not enough, and what else the diagnosis needs | The user's answer, then the step that was running again |
| The cause not found | One of the conditions Steps 15 gives | The record with every probe, or every way tried from its "No red command" section, and inside a plan the open item | Inside a plan, the user's ruling on the open item or, under `self_rule: on`, the choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; run by a person, the user's next direction |
| No ledger folder | Inside a plan, no folder holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/diagnose` again |
| No dispatch entry | Inside a plan, for a finding of a reviewer's report or a red line, the state file has no dispatch entry for the step, or for a red line one that does not read `landing: backed-out` | A refusal that names the step and its landing state | For a finding, the step prepared with `/spec`, then `/diagnose` again; for a red line, `/diagnose` again once `/land` has taken the step back out of main, before `/spec` prepares it again, and after that `/diagnose <symptom>` with the failure in the step's Step 0 as the symptom; for a step already landed, `/diagnose <symptom>` with the finding's failure scenario as the symptom |
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

- Who is present decides the waits: a person running the skill, by hand or inside a plan they run step by step, gets the waits of "Stops", and a session with no person present, under `plan-orchestration` or running `/diagnose <symptom>` on its own, gets none.
- Inside a plan, the step's worktree is never changed and every probe runs on the scratch copy of Steps 3, so `plan-orchestration`'s rule that a finding whose cause is not known is diagnosed read-only holds.
- The skill never runs against the user's real home, the installed skills or the pinned checkout without the user's leave, and a red command that would touch them runs with those paths redirected, as Steps 3 says.
- Every quoted command output carries `<REDACTED>` in place of the value of a secret in it (a password, an API key, an access token, a private key, a session cookie, a credential inside a URL or a connection string), and keeps the rest of the line as printed, as the rules file's rule on secrets in quoted command output says.
- A captured artifact is quoted only in the lines that carry the symptom.
- With no rules file, a defect in code whose failure costs something (lost work, a broken installation, a wrong configuration accepted) begins with a test that fails on the tree as it is.
- With no rules file, a guard is not a fix: a null check, an early return or a fallback does not close a defect, and the fix reaches the code that lacks the thing it needs.
