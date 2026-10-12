# Step 2a refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2a, base c5cca8fc99c74767d3078414938e822781a0bd21)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in code keeps its `file:line`. Line numbers of skill and doc files below are those of the worktree tree, given only to locate a hunk.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md      (exit 0)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
checks: 11 commands passed

$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ (git diff --name-only <base>; git ls-files -o --exclude-standard | grep -v '^.scratch') | xargs env LC_ALL=C grep -n '[^ -~]'
(no output, exit 1)
$ grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
docs/dev/building.md:10: ... git_guard.test.sh ...
docs/dev/building.md-11-sh skills/diagnose/templates/person-driven.test.sh  # person-driven.sh on scratch files: ...
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md-72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
$ python3 -c 'import glob,yaml; ...'   (largest counts: roadmap 1022, spec 987, diagnose 965; none above 1024)
$ git diff -U0 -- 'skills/*/SKILL.md' | grep '^[-+]  version'
diagnose 1.1.0 -> 1.2.0, land 1.9.0 -> 1.10.0, spec 2.0.0 -> 2.1.0, plan-orchestration 3.0.0 -> 3.1.0, ordo-help, plan and repo-setup 2.0.0 -> 2.1.0 (seven skills, one minor raise each)
$ git status --short | wc -l
19
```

Commands the builder's report quotes, rerun, and what they printed against the claim:

- `wc -l` of the three new files: 75 (script), 392 (test), 20 (reference). Report says 75, 392, 20. Reproduced.
- `grep -n 'person-driven' skills/diagnose/SKILL.md`: lines 234 and 244, as claimed. `grep -n 'premise' skills/diagnose/SKILL.md`: 19 35 47 49 51 52 62 63 69 70 100 119 120 122 171 201 206 251 274 286, as claimed. `grep -n 'quotes its part\|premise'` on `diagnosis.md`: 3 9 96 120, as claimed. `grep -n 'premise'` on `ordo-help`: 68 and 84; on `plan-orchestration`: 28 56 92 358. `grep -c 'find why' skills/spec/SKILL.md`: 1, line 92. All as claimed.
- `git show c5cca8f:...` reads for R1 to R5 (premise count 0 in `diagnose`; item 11 and the Stops row naming no file; `spec` line 133; `ordo-help` line 82 only; `plan-orchestration` lines 28, 125, 165; `docs/dev/building.md` with no `person-driven`; no "diagnosis agent" at the base): all reproduced.
- `grep -n -i diagnos docs/figures/gen_figures.py`: lines 6 421 543 545 553 569 615 621, as claimed. `git status --short` lists 15 modified files and the report, the `references/` folder and two new templates, as claimed.
- Not rerun: `sync_rules.py . --only glossary --write` (it writes a file; the read-only form above prints the `ok:` line).
- The first run of C1 to C20 on the unchanged tree, rerun for c1, c9, c17, c19, c20 with the test file alone in a scratch folder: `FAIL: c1: exit status 127, expected 0`, `FAIL: c9 file.txt: exit status 127, expected 64`, `FAIL: c17 empty actions path: exit status 127, expected 64`, `FAIL: c19 closed: exit status 127, expected 1`, `FAIL: c20: the second action was never shown`. Same as the report.

Mutation sample, each applied to a copy of `person-driven.sh` in a scratch folder under `$TMPDIR` and run as `sh person-driven.test.sh <case>` (the worktree file never changed). Sample: C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19 (both variants), C20.

```
C1  FAIL: c1 standard output: the text differs from the expected one
C2  FAIL: c2: missing [Action 2 of 2: second]
C3  FAIL: c3: the action is not on standard output byte for byte
C4  FAIL: c4: exit status 64, expected 0
C5  FAIL: c5: missing the line [person-driven: the input ended after observation 1 of 3]
C6  FAIL: c6: .../c6/obs.txt exists
C7  FAIL: c7: the request to type an observation is not printed twice
C8  FAIL: c8: exit status 1, expected 0
C9  FAIL: c9 link.txt: exit status 0, expected 64
C10 FAIL: c10 folder: exit status 1, expected 64
C11 FAIL: c11 empty.txt: exit status 0, expected 64
C12 (mutation "the folder is always .")  FAIL: c12: exit status 1, expected 64
C13 FAIL: c13: exit status 0, expected 1
C14 FAIL: c14: the text differs from the expected one
C15 FAIL: c15: exit status 64, expected 0
C16 (the report's mutation: dir=${obs%/*} becomes dir=$(dirname "$obs"))  PASS: person-driven.sh scratch tests
C17 FAIL: c17 empty observations path: exit status 1, expected 64
C18 FAIL: c18: exit status 1, expected 64
C19 closed   FAIL: c19 closed: exit status 0, expected 1
C19 pipe (trap '' PIPE removed)  FAIL: c19 pipe: exit status 141, expected 1
C20 (the append moved before the read, two lines changed)  FAIL: c20: the text differs from the expected one
```

I also ran the unchanged script under `dash` with standard output closed, with a reader-less pipe, and with text holding a backslash, `%s` and end spaces: exit 1 with `person-driven: cannot write to standard output` in the first two, and the pairs written byte for byte in the third.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds, `wc -l` prints 75 (limit 120); read whole; `cat -n skills/diagnose/templates/person-driven.sh` against 1 to 10 of "What the script must do" (9a below). The head comment lists the usage, the output, the files read and written, every error line and the statuses 0, 1, 64 and 128+n.
  - 9a: holds, `trap '' PIPE` (line 38) and `|| cannot_show` on the action line (line 66); C19 closed and the pipe variant both met, and rerun under `dash` as above.
- 2: holds, `person-driven.test.sh` has `c1` to `c20`; it passes; each case I mutated fails (see the finding under "2. Proof" on the C16 row).
- 3: holds, `skills/diagnose/references/person-driven.md` has a `#` title, one sentence and one rule per bullet, and states each element of the brief's item 3; one standards finding on a repeat with no count (3. Standards, finding 2).
- 4: holds, `grep -n 'person-driven' skills/diagnose/SKILL.md` prints 234 (item 11 names `templates/person-driven.sh` and `references/person-driven.md` and keeps the stop) and 244 (the Stops row shows the actions file and the command; resumed by the user's word that the script has ended, then the observations file read by the skill).
- 5: holds, `skills/diagnose/templates/diagnosis.md` lines 38 and 41, before line 44 "Runs after the tightening".
- 6: holds, Verify 5 above.
- 7: holds, read in `skills/diagnose/SKILL.md`: Quick start line 19 with its text in column 44 (checked with `awk index`); "What it reads" 1 and 3 (lines 35 to 37, 47 to 50); Steps 1 (line 62), Steps 2 (lines 68 and 69), Steps 3 (line 100), Steps 4 (lines 119 to 122), Steps 15 (line 171), Steps 20 (lines 201 to 206); the Stops row "No part to investigate" (line 251), the opening sentence "The last five rows are refusals", and "No report" and "No finding" saying "for a finding" (lines 249 and 250); the description's sentence on the hand-over. I read each of the 44 hits of the brief's last-bullet grep; each names the forms it applies to or holds for `premise`. The report does not list those hits (see 2. Proof, finding 2).
- 8: holds, `diagnosis.md` line 3 ("names its finding or quotes its part"), the Symptom placeholder (line 9), the last placeholder (line 120), and the test's source block (line 96 area).
- 9: holds, `skills/spec/SKILL.md` Steps 2 lines 92 to 101 carry each outcome the brief lists; line 133 and its two sub-bullets are gone from Steps 4 (`grep -c 'find why' skills/spec/SKILL.md` prints 1, in Steps 2). One finding on the wording of who is present (1. Spec, finding 2).
- 10: holds, `skills/ordo-help/SKILL.md` line 68 is the form and line 69 its text, from column 31 (checked with `awk`).
- 11: holds, `skills/plan-orchestration/SKILL.md` line 28 lists `premise`.
- 12: holds, `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`; **Step 0**, **premise** (second sense), **actions file**, **observations file** and **diagnosis agent** are in `skills/repo-setup/templates/plan-terms.md` and the glossary block.
- 13: violated, 1. Spec, finding 1 (the diagnosis agent's numbered item is lost when a step waits at Steps 5 of `/spec`). Every other place the item lists states the agent: `diagnose` "Rules" (lines 273 to 289), `plan-orchestration` Steps 8 and 9 (lines 125 to 127, 149), "The two tiers, and the models" (lines 168, 173, 180) and the model-stop row (line 363), `spec` Steps 2 and "Steps / The brief check" 4 (lines 93, 346) and its Stops row (line 372), `land` Steps 9 (lines 96, 103, 104, 108), `plan.yaml` line 27, `orchestrator-state.md` lines 27 and 34, `plan.md` line 36, and the glossary terms. `plan_cost.py` is unchanged (`git status --short` does not list it); numbered items are passed over by `_read_bullets` (`_BULLET.match`).
- 14: holds, Verify 10 above.
- 15: holds, `grep -n -i diagnos docs/figures/gen_figures.py` prints the eight lines the report names; none names a form, the new refusal or the person-driven stop. The `/diagnose` box lists only "The hypotheses" and "The cause not found", and the `build it` box already reads "No stop of its own" although a builder has the model stop, so the figures list skill-level stops and the diagnosis agent's model stop adds none to a figure box.
- 16: holds, `git grep -n -e 'brief check and the lookups' -e 'a brief-check agent and a lookup agent' -e 'brief-check agent' -e 'brief-check agents' -- README.md skills docs` leaves no hit that lists the agent kinds without the diagnosis agent (`skills/grill/SKILL.md` lines 216 and 221 and `skills/refute/SKILL.md` name one kind on purpose). `README.md` lines 20, 41 and 51 name `<finding>` and `<symptom>` only and were already incomplete, so they are not made false.

Cases of the brief's "Cases":

- C1 to C20: met, each by its test case in `person-driven.test.sh` (all pass: `PASS: person-driven.sh scratch tests`) and by the mutation rerun above, where the case fails for its behaviour. C1's second run under `dash` runs (dash is installed at `/bin/dash`). C16 is met by its test; the table row for it is not reproduced (2. Proof, finding 1).
- R1 to R5: met, each result on the unchanged tree reproduced with `git show c5cca8f:<file>` as listed above.
- W1: met, `diagnose` lines 47 to 50, 62, 68 to 69, 100, 140, 201 to 206 and `spec` lines 92 to 100.
- W2: met, `spec` line 93 and `diagnose` lines 274 to 289; with the wording issue of 1. Spec, finding 2.
- W3: met, `diagnose` line 251 resumes with `/spec <entry> <step>`.
- W4: met, `diagnose` lines 68 and 69.
- W5: met, `diagnose` line 171 and `spec` lines 98 and 99 agree.
- W6: met, `diagnose` lines 119 to 121 and `spec` line 101.
- W7: met, `plan-orchestration` lines 125 to 127, `diagnose` lines 276 to 289, `land` lines 96, 103 to 104, 108.
- W8: met, `diagnose` line 280, `plan-orchestration` line 363, `spec` line 372.
- W9: met, `diagnose` lines 273 and 275.
- W10: met, `references/person-driven.md` lines 5 to 18.
- W11: met, `diagnose` line 287 and `land` lines 96 and 108; the brief-check diagnosis runs after Steps 5, so the wait path of 1. Spec, finding 1 does not reach it.
- W12: met for a cause found, `diagnose` lines 203 to 205; see 1. Spec, finding 3 for the other two endings.

## 1. Spec

1. `skills/spec/SKILL.md` Steps 1 and Steps 5 (lines 66, 73 and 160 to 161): "A step that waits at Steps 5 restores it with the session's own records, the text a diagnosis wrote in Step 0 among them" and "`plan.md` is put back from the copy Steps 1 saved, with the session's own records, the text a diagnosis wrote in Step 0 among them."; what is wrong: `diagnose` "Rules" (line 287) has the `/spec` session write the diagnosis agent's numbered item into `plan.md`'s Agents section right after the start, and Steps 2 starts that agent before Steps 5; the lists of "the session's own records" name the diagnosis record and the Step 0 text and not that item, so the restore from the copy saved before Steps 2 drops it; ADR 0006 ("Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model") and the brief's item 13 ask that it be recorded for every form; failure scenario: `/spec` runs a `premise` diagnosis in a diagnosis agent for step 5, the path comparison finds a shared file whose merge is not simple, the step waits and `plan.md` is restored from the copy, so the numbered item is gone; the next `/spec` run finds the cause already in Step 0 and starts no agent, so nothing rewrites it, and `land` Steps 9 (line 104, "A diagnosis agent has its numbered item already ... so the booking adds none") then books an Agents section that lacks the agent; verdict: 13 violated.
2. `skills/spec/SKILL.md:93` and `:346`, and `skills/diagnose/SKILL.md:273` to `:275`: "The diagnosis runs in a diagnosis agent, as the `diagnose` skill's "Rules" say." and "which runs in a diagnosis agent as the `diagnose` skill's "Rules" say"; what is wrong: `diagnose` "Rules" gives the agent only "inside a plan with no person present" and says that run by a person "the skill stays in the person's session", with the waits of "Stops"; `spec` states the agent without that condition, although `/spec` is also run by hand ("Run by hand, the session judges", Steps 5) and the brief's item 13 limits the agent to no person present; failure scenario: a person runs `/spec <entry> <step>` by hand, Steps 2 meets a "find why" part and reads that the diagnosis runs in a diagnosis agent; the agent has no way to show the hypotheses and wait for the person's reply (`diagnose` "Stops", "The hypotheses"), while "Rules" sends the same run to the person's session, so the two texts give two runs; verdict: none (W2 and W9 are met under each text read alone).
3. `skills/diagnose/SKILL.md:203` to `:205`: "Run by a person outside a `/spec` run, the session commits the record and Step 0 by path at once, as a resume point."; what is wrong: the brief asked for this commit only for a cause found, and the two other endings of a `premise` run by a person write to the ledger with no commit: a cause not found raises an open item in the state file (line 168) and a red command green on main's head leaves the record on disk; failure scenario: a person runs `/diagnose <entry> <step> premise`, the cause is not found, the open item sits uncommitted in the state file, and the next `/spec` in another session refuses at Steps 1 ("An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal"), the same situation the commit sentence exists to prevent; verdict: none (W12 is met for a cause found).
4. `skills/diagnose/SKILL.md:203`, under ADR 0012 ("Every commit a skill makes on main names its paths in the commit command ... Every skill text that makes a commit names the command form."): the brief's "What is on the tree" says ADR 0012 "governs commit commands, which this step does not write", while the sentence of item 7 that the brief dictates makes a commit; what is wrong: the text says "by path" and gives no command form, as `plan-orchestration` also does for its resume-point commits; failure scenario: a session reads "commits the record and Step 0 by path" and stages named paths with a bare `git commit`, which records whatever else is staged, the case the ADR's context describes; verdict: none (the brief asked for the sentence and the tree's other skills phrase a commit the same way); raised so the orchestrator rules whether the ADR's "names the command form" applies.

## 2. Proof

1. `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, "Mutations", the C16 row: "`dir=${obs%/*}` becomes `dir=$(dirname "$obs")`" with `FAIL: c16: exit status 64, expected 0`; what is wrong: applied to the finished script (line 58, `case $obs in */*) dir=${obs%/*}; dir=${dir:-/} ;; esac`) this mutation changes a line that runs only when the path holds a `/`, and C16's paths are `-a.txt` and `-obs.txt`, so the rerun prints `PASS: person-driven.sh scratch tests`; the mutation `dir=$(dirname $obs)` in place of the whole `case` line does give `FAIL: c16: exit status 64, expected 0`, so the case guards its behaviour but the table row is not the mutation that fails it. The C20 row ("the action is appended before its observation is read") is a two-line change, where the brief asks one line changed or removed; its failure reproduces as `FAIL: c20: the text differs from the expected one`. Change standard, rule 13 asks the table to quote the failure for each behaviour; failure scenario: a reader or a later reviewer reruns the C16 row, sees a green test and concludes C16 does not guard the dash-path behaviour, or fits another test to the row; verdict: none (C16 and C20 are met).
2. `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, DONE / NOT DONE table, rows 7 and "Verify 9": "the hits of the grep the brief names are read in "Hits" below" and "\"Departures from the prose standard\" below"; what is wrong: the "Hits" section holds only the greps of item 16 and the figures, with no hit of item 7's last-bullet grep over `skills/diagnose/SKILL.md` (44 lines match), and no section "Departures from the prose standard" exists (`grep -n -i departures` finds only the table row); the brief's "Verify before you report" 6 and 9 ask for each hit with whether it holds and each departure named with its reason; failure scenario: the orchestrator accepts "Everything in the brief is done" on two checks whose evidence the report does not hold; verdict: none (my own read of the 44 hits found each holding, 7 holds).

## 3. Standards

1. `skills/diagnose/SKILL.md:287`, `skills/plan-orchestration/SKILL.md:125` and `:149`: "Right after the diagnosis agent's start, the session writes `<n>. <agent id>: diagnosis of step <k>, <served model>` into `plan.md`'s Agents section, under the heading "Agents in no role the cost script prices:", which it makes when the section has none." (42 words; the `plan-orchestration` bullets are 72 and 40 words, the first lengthened from 61); what is wrong: `docs/dev/skill-layout.md`, "Lists and tables" asks one rule per bullet (this bullet holds the item to write, the heading to put it under and the heading to make), and the prose standard, "E. Sentence shapes", asks sentences under roughly 20 words unless the mechanism needs more; the report's judgment call 7 says the long bullet sentences were split, and these were not; failure scenario: a session following line 287 writes the item and not the heading, or the heading and not the section, since three requirements share one sentence; verdict: none.
2. `skills/diagnose/references/person-driven.md:15` to `:16`: "Fewer `Observed:` lines than actions is an unfinished run, and the skill runs the script again with a new observations file."; what is wrong: `docs/dev/skill-layout.md`, "Writing for an agent": "A repeat that ends only when a condition holds ... is given a count", and the sentence has none; the brief dictated the repeat without a count, so this is raised for the orchestrator's ruling on the clash between the brief and the standard; failure scenario: a person who stops before the last action, each time, makes the skill run the script again with no end; verdict: 3 holds (the brief's text is met).
3. `skills/diagnose/SKILL.md:283`: "The diagnosis agent starts no agent and invokes no skill other than reading this skill's text."; what is wrong: `docs/dev/skill-layout.md`, "Writing for an agent": a rule written as a prohibition names the behaviour to do instead in the same bullet; the `refute` skill's matching rule ends "every read and every command of the review runs in the reviewer's own session", and this bullet does not; failure scenario: an agent that needs a probe the scratch copy cannot run has no stated alternative and starts a helper agent; verdict: none.

## 4. Behaviour

1. `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, "User-visible changes": the list gives the new form, the agent, the script, the sequence and the versions; what is wrong: it omits four visible changes, each with its before and after: the `land` booking (`skills/land/SKILL.md:96`, `:353`-area text) now states each diagnosis agent's usage from the record's head and adds none to the Agents section, where before it read only `builder_usage`, `reviewer_report` and `brief_check`; `plan.md`'s Agents section gains numbered items under "Agents in no role the cost script prices:" written at the start of each diagnosis agent; the diagnosis record gains a "Diagnosis agent:" line in its head (`diagnosis.md` line 5); and a `premise` run by a person now makes a git commit of the record and Step 0 (`diagnose` line 203); failure scenario: a user reads the report as the whole list of what changed and is surprised by a commit made on main and by a booking line that now holds agent usage; verdict: none.

## Declined to judge

- Whether `/diagnose ... premise` run by a diagnosis agent yields a useful diagnosis on a real "find why" step: neither a read nor a rerun can settle it; the roadmap's step 3 real run is the gate.
- Whether the diagnosis agent should be priced in `plan_cost.py`: the brief reserves it to the user (open item of the orchestrator's).
- Whether `README.md` line 20 ("Inside a plan it probes on a scratch copy and leaves the step's worktree unchanged") should now say the run happens in a fresh agent: the sentence is incomplete, not false, and the brief's item 16 asks only for hits the step makes false.
- The test's behaviour on a filesystem whose name limit is above 300 characters (C13) and on an interrupt of the test itself (its `trap` runs the cleanup and the script continues, the same form `checks.test.sh` uses): not run.
- `sync_rules.py --write` was not rerun, since it writes; its read-only form was.

Reviewer usage: a70e4f918b4ed2894, claude-sonnet-5-5, 266542 tokens, 66 tool uses, 19.8 minutes.
