# Step 2a refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2a, base c5cca8fc99c74767d3078414938e822781a0bd21)

This report cites pages (the rules file, a standard, a skill's text) by section, never by line number, because a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 11 commands passed
(exit 0; the worktree's state file is the copy at the base, and its verify list does not hold person-driven.test.sh)

Verify 2: sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
(the full run prints no note line, so the c1 run under dash took place: /bin/dash is installed)

Verify 3: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

Verify 4: LC_ALL=C grep -n '[^ -~]' over the 19 files from git diff --name-only <base> and git ls-files --others --exclude-standard
(no output); a grep for a literal tab over the same files: (no output)

Verify 5: grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
docs/dev/building.md:10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands ...
docs/dev/building.md-11-sh skills/diagnose/templates/person-driven.test.sh  # person-driven.sh on scratch files: ...
--
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md-72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1

Verify 7: description lengths
965 skills/diagnose/SKILL.md, 877 grill, 726 land, 503 ordo-help, 632 ordo-init, 961 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 861 repo-setup, 1022 roadmap, 779 session-retro, 987 spec

Verify 10: git diff -U0 -- 'skills/*/SKILL.md' | grep '^[-+]  version'
1.1.0 -> 1.2.0, 1.9.0 -> 1.10.0, 2.0.0 -> 2.1.0, 3.0.0 -> 3.1.0, 2.0.0 -> 2.1.0, 2.0.0 -> 2.1.0, 2.0.0 -> 2.1.0 (seven skills, one minor raise each)

The builder's claims, rerun:
- First run on the unchanged tree. The test file was copied alone into a scratch folder and run as sh person-driven.test.sh <case>:
  FAIL: c1: exit status 127, expected 0
  FAIL: c6: exit status 127, expected 1
  FAIL: c9 file.txt: exit status 127, expected 64
  FAIL: c12: exit status 127, expected 64
  FAIL: c17 empty actions path: exit status 127, expected 64
  FAIL: c19 closed: exit status 127, expected 1
  FAIL: c20: the second action was never shown
  (each is identical to the report's line)
- Mutation sample. Each mutation was made in a copy of the script under $TMPDIR and run with a copy of the test:
  C3, the action's %s replaced by the text inside the format: FAIL: c3: the action is not on standard output byte for byte (reproduced)
  C7, the blank-observation case made *): FAIL: c7: the request to type an observation is not printed twice (reproduced)
  C9, [ -e ] alone: FAIL: c9 link.txt: exit status 0, expected 64 (reproduced)
  C11, -gt becomes -ge: FAIL: c11 empty.txt: exit status 0, expected 64 (reproduced)
  C13, the append's failure branch becomes || :: FAIL: c13: exit status 0, expected 1 (reproduced)
  C16, dir=${obs%/*} becomes dir=$(dirname "$obs") as the table writes it: PASS (not reproduced, Proof 4); line 57 replaced and line 58 removed: FAIL: c16: exit status 64, expected 0
  C17, [ -n "$obs" ] && removed: FAIL: c17 empty observations path: exit status 1, expected 64 (reproduced)
  C19 pipe, trap '' PIPE removed: FAIL: c19 pipe: exit status 141, expected 1 (reproduced)
  Reviewer's own: line 73's single printf split into two printfs: the whole suite prints PASS: person-driven.sh scratch tests (Proof 5)
- Every case C1 to C20 with the script run under dash (a PATH shim makes sh resolve to /bin/dash, and the test runs under bash): each prints PASS: person-driven.sh scratch tests.
- Usage: sh person-driven.sh a, and sh person-driven.sh a b c, each print "person-driven: usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>" and exit 64.
- Report counts and lines. Each was rerun and each matches:
  - grep -n 'person-driven' skills/diagnose/SKILL.md gives 234 and 244.
  - The premise lines of diagnose are 19 ... 286.
  - plan-orchestration's premise lines are 28, 56, 92 and 358.
  - diagnosis.md gives lines 3, 9, 96 and 120, and lines 38 and 41.
  - grep -c 'find why' skills/spec/SKILL.md gives 1.
  - The wc -l of every changed file equals the report's Files table.
  - The report's open items equal the state file's (cmp).
  - plan.projects.yaml has no comment on its reviewer keys.
- Columns: the Quick start text starts at column 44 on all five lines, and the ordo-help text starts at column 31 on lines 66, 69 and 71.
- Brief premises, sample checked on the base:
  - skills/diagnose/SKILL.md has 259 lines, and grep -c premise gives 0.
  - diagnosis.md has 106 lines.
  - ordo-help lines 67, 68 and 72, plan-terms.md line 114, plan.yaml lines 12 and 27, and orchestrator-state.md lines 14 and 27 are as stated.
  - 'find why' occurs only at spec line 133.
- plan_cost.py reads only lines that match _BULLET " *[-*+](?: |$)", so a numbered item is passed over, as the brief states.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds.
  - The script is 75 lines.
  - Each of "What the script must do" 1 to 10 checks out by reading `skills/diagnose/templates/person-driven.sh` and by the reruns above: the usage, the refusal order at lines 49 to 59, IFS= read -r on fd 3 and on stdin, %s-only text, one printf per pair, the closing line, paths reaching only `[` and redirections, and the head comment with 0, 1, 64 and 128+n.
  - Under 9a: line 66 `|| cannot_show` runs before any read, and C19 passes under sh and under dash.
- 2: holds, with the gaps of Proof 4, Proof 5 and Proof 6. The test has the shape of `checks.test.sh`: set -u, fail, mktemp -d, a trap, the script found from the test's folder, and a last line PASS. It has one function per case, c1 to c20.
- 3: violated. See Spec 3: line 16 tells the skill to run the script, against line 11.
- 4: holds. `skills/diagnose/SKILL.md:234` names both files and keeps the stop, and `:244` shows the actions file and the command and is resumed by the user's word.
- 5: holds. `skills/diagnose/templates/diagnosis.md:38-42` sits after the "seen only sometimes" placeholder and before "Runs after the tightening".
- 6: holds, by Verify 5. No state file was edited (`git status --short`).
- 7: holds for every bullet: the Quick start line, "What it reads" 1 and 3, Steps 1, 2, 3, 4 and 20, the "No part to investigate" row, the opening sentence ("last five rows", counted: five), the "for a finding" cells and the description. Standards 4 covers the one unscoped bullet among the hits of its last grep.
- 8: holds. `diagnosis.md:3`, `:9` and `:96-100`, and `:120`.
- 9: holds as the brief dictates it: `skills/spec/SKILL.md:92-101`, and the line 133 bullet is gone from Steps 4. The gap at Steps 5 is Spec 2, a gap the brief shares.
- 10: holds. `skills/ordo-help/SKILL.md:68-69`.
- 11: holds. `skills/plan-orchestration/SKILL.md:28`.
- 12: holds. Step 0, premise, actions file and observations file are in plan-terms.md, synced (Verify 3).
- 13: violated. See Spec 1: `spec` starts a diagnosis agent unconditionally, also when a person runs `/spec`. Every other sub-bullet holds:
  - diagnose "Rules", lines 273 to 289.
  - plan-orchestration Steps 8 and 9, "The two tiers" and the Stops row.
  - spec "The brief check" 4 and its Stops row.
  - land Steps 9.
  - The three plan templates.
  - The Agents section, dispatch entry, effort agent, reviewer, tiers and diagnosis agent terms.
  - No dispatch key was added, and plan_cost.py is unchanged.
- 14: holds, by Verify 10. Whether minor is the right part is under Declined to judge.
- 15: holds for the tree as it stands. The labels at gen_figures.py lines 6, 421, 545 to 547, 569, 615, 621 and 583 to 595 (the /spec box) match the Stops tables as they now read. If Standards 2 adds a row to spec's Stops, the /spec box label changes with it.
- 16: violated. See Standards 1: `skills/ordo-help/SKILL.md:84` is a hit of the item 16 grep, and the change makes it false.

Cases of the brief's "Cases":

- C1: partial. The sh run compares the observations file and standard output whole. The dash run compares the exit status and the observations file only, not standard output. The reviewer's dash run of c1 passes with standard output compared, so the behaviour holds and only the test's assertion is missing (Proof 6).
- C2: met. Test c2, the observations file compared whole, and "Action 2 of 2: second".
- C3: met. Test c3 compares the file and the first output line with cmp, and checks that the file `ran` does not exist. The mutation was reproduced.
- C4: met. Test c4.
- C5: met. Test c5.
- C6: met. Test c6. The mutation's FAIL line is in the report and the case is first-run red. This mutation was not rerun.
- C7: met. Test c7. The mutation was reproduced.
- C8: met. Test c8.
- C9: met. Test c9, with cmp on the regular file and no link target created. The mutation was reproduced.
- C10: met. Test c10.
- C11: met. Test c11. The mutation was reproduced.
- C12: met. Test c12: the output is empty.
- C13: met. Test c13. The mutation was reproduced.
- C14: met. Test c14.
- C15: met. Test c15.
- C16: met. Test c16 passes, and a mutation that reaches dirname makes it fail. The table's description of that mutation does not reproduce (Proof 4).
- C17: met. Test c17, with the listing compared. The mutation was reproduced.
- C18: met. Test c18 (run as non-root).
- C19: met. Test c19, with stdout closed and with a pipe. The pipe mutation was reproduced.
- C20: met. Test c20 shows the first pair and 143. It cannot see the one-printf property its cost names (Proof 5).
- R1: met. Read on the base: item 11 and the Stops row name no file. The builder's quoted grep agrees.
- R2: met. Read on the base template: it has no observations placeholder.
- R3: met. Neither page at the base lists person-driven.
- R4: met. `git show <base>:skills/diagnose/SKILL.md | grep -c premise` prints 0, spec line 133 is as stated, and the ordo-help and plan-orchestration lines are read.
- R5: met. The base diff context shows "the builders, the reviewers and the brief-check agents" and no diagnosis agent.
- W1: met.
  - `skills/diagnose/SKILL.md:47-49` reads plan.md with no dispatch entry or brief.
  - `:66` gives the record path.
  - `:100` gives HEAD with nothing applied.
  - `:136` and `:140` show the hypotheses and wait for the reply.
  - `:201-205` writes Step 0 and never fixes on main.
  - `skills/spec/SKILL.md:96-97` puts the cause into the item and the red command into the checks.
- W2: met. `spec:93`, and `diagnose:276-289` covers the start, the check, the saving and the numbered item. The first Rules bullet gives a diagnosis agent no waits.
- W3: met. `diagnose:62` and `:251`, with the "No part to investigate" row resumed by `/spec`.
- W4: met. `diagnose:35-37` and `:68-69`.
- W5: met. `diagnose:171` and `spec:98-99` agree. Standards 2: the stop has no row in spec's Stops.
- W6: met for a run under `/spec`. See `diagnose:119-121` and `spec:100`. For a person-run variant outside `/spec`, see Behaviour 2.
- W7: met.
  - `plan-orchestration:125-127` covers the start, the read, the ruling and the fix carried.
  - `diagnose:279-280` covers the served model.
  - `land:96`, `:104` and `:108` cover the booking with usage and the numbered item already there.
- W8: met. `diagnose:280` and `:288`, and the Stops rows in `plan-orchestration:363` and `spec:372`.
- W9: met. `diagnose:273-275`.
- W10: partial. The main path is met (reference lines 5 to 18). On the unfinished-run branch, line 16 tells the skill to run the script itself (Spec 3).
- W11: met. `diagnose:287` writes the numbered item at the start, for every form. `land:96` and `:108` book the usage from the record's head, and `plan-orchestration:149-150` and `spec:346` cover a red line and a brief check.
- W12: met for a found cause. `diagnose:203-205` commits the record and Step 0, so `spec` Steps 1 sees no change on plan.md. For a cause not found and a false premise, see Behaviour 2.

## 1. Spec

- Spec 1, `skills/spec/SKILL.md:93`: "The diagnosis runs in a diagnosis agent, as the `diagnose` skill's "Rules" say."; and `skills/spec/SKILL.md:346`: "which runs in a diagnosis agent as the `diagnose` skill's "Rules" say".
  - What is wrong: both sentences start an agent with no condition. Brief item 13 says the agent runs "Inside a plan with no person present", and "Run by a person, `/diagnose` stays in the person's session". `diagnose`'s Rules carry that condition (`diagnose:274-275`), so the two texts disagree when a person runs `/spec` (change standard rule 19).
  - Failure scenario: Axel runs `/spec 2.X 4` by hand on a step whose line says "find why the sync check prints a stale block and end it". spec Steps 2 tells the session to start `ordo-high` as a diagnosis agent. Under `diagnose:273` a diagnosis agent gets no waits, so it probes without showing him the hypotheses. Ruling "Step list" D2 (a) says a run by hand waits for the reply.
  - Fix: "with no person present" in both sentences.
  - Verdict: item 13 violated.
- Spec 2, `skills/spec/SKILL.md:64`: "A change the session itself made since the last resume-point commit is one of its own records: a ruling it booked, a report or a reviewer it recorded, or a diagnosis record with the text the diagnosis wrote in Step 0."; and `:161`: "`plan.md` is put back from the copy Steps 1 saved, with the session's own records, the text a diagnosis wrote in Step 0 among them."
  - What is wrong: the diagnosis agent's numbered item, which the session writes into plan.md's Agents section right after the start (`diagnose:287`), is not among the named own records that survive the restore at Steps 5. ADR 0006, Decision: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model."
  - The brief did not ask for this contradiction: its item 9 names only "the record and what the diagnosis wrote in Step 0", so the gap is in the brief too. Whether to close it at landing is the orchestrator's call.
  - Failure scenario: under the loop, `/spec` runs a premise diagnosis, which writes "1. <id>: diagnosis of step 4, claude-opus-5-5". Steps 5 then judges a shared path not simple, and plan.md is restored from the copy made before Steps 2 with only the listed own records. The agent's item is dropped, and the agent is in no ledger file.
  - Verdict: none (item 9 holds as dictated).
- Spec 3, `skills/diagnose/references/person-driven.md:16`: "Fewer `Observed:` lines than actions is an unfinished run, and the skill runs the script again with a new observations file."
  - What is wrong: line 11 of the same page says "The session never runs the script itself, since the script reads what the user types". Brief item 3 says an unfinished run is "run again with a new observations file", by the user from the command shown.
  - Failure scenario: a session reading line 16 after an unfinished run calls `sh .../person-driven.sh` itself through its shell tool. The script reads the tool's standard input, not the user's, and ends at once with "the input ended after observation 0 of <m>", or it hangs on the prompt. No observation is recorded.
  - Fix: "the skill shows the command again with a new observations file".
  - Verdict: item 3 violated, W10 partial.

## 2. Proof

- Proof 1, `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, the DONE / NOT DONE row "Verify 6" and the section "Walks": "`git diff` read whole; the walks and the hits are below".
  - What is wrong: Verify 6 asks for each walk W1 to W12 with the changed tree's lines quoted as `grep -n` prints them, and for each hit of item 7's last grep with whether it holds. The "Walks" section gives four walks of its own with line numbers and no quoted lines. No walk is named W1 to W12, and the hits of item 7's grep are not listed ("Hits" lists only item 16's grep).
  - Decision resting on it: the step's check ("each changed text read in place against its ruling") and the orchestrator's acceptance of the text cases. The reviewer read the walks itself (Verdicts above). The report still claims DONE for a check it did not do.
  - Failure scenario: the orchestrator lands on the report's DONE and finds no record of W5, W6 or W12 being read. Those walks are where Behaviour 2 sits.
  - Verdict: none (the walks are met or partial by the reviewer's own reading).
- Proof 2, the same report, row "Verify 9": "\"Departures from the prose standard\" below".
  - What is wrong: no section of that name exists. `grep -n -i departure` finds only the row itself, and the "Judgment calls" item 7 names no departure.
  - Departures do exist, see Standards 3.
  - Failure scenario: a reader who trusts the row believes the long sentences and the two-rule bullets were each weighed. None was named.
  - Verdict: none.
- Proof 3, the same report, section "Terms": the table gives "Term / New or changed / What it says now".
  - What is wrong: brief "Report" 6 asks for "the line that uses it and whether the use is in its sense" for each term the diff adds, changes or uses. The table holds neither.
  - Failure scenario: a use of "premise" in its first sense where the second is meant, or the reverse, goes unchecked by the builder.
  - The reviewer found no misuse in the lines read: `spec:100`, `diagnose:119` and `glossary` premise.
  - Verdict: none.
- Proof 4, the same report, mutation row C16: "`dir=${obs%/*}` becomes `dir=$(dirname "$obs")`" with "FAIL: c16: exit status 64, expected 0".
  - What is wrong: applied as written, that line sits inside `case $obs in */*)` at `person-driven.sh:58`. C16's `-obs.txt` has no slash, so the reviewer's run of c16 prints `PASS: person-driven.sh scratch tests`. The FAIL line is reproduced only when line 57 `dir=.` becomes `dir=$(dirname "$obs")` and line 58 is removed.
  - Decision resting on it: rule 13's table is the proof for C16.
  - Failure scenario: a later reviewer reproducing the row gets a green run and concludes that C16 tests nothing.
  - Verdict: none (C16 met by the corrected mutation).
- Proof 5, `skills/diagnose/templates/person-driven.test.sh:361-382` (c20), against `person-driven.sh:73`: "printf 'Action %s: %s\nObserved: %s\n' ... >> "$obs"".
  - What is wrong: C20's cost is "a half pair quoted in the record", and item 7 and decision 2 require each pair in one printf. With line 73 split into two printfs, `{ printf 'Action %s: %s\n' ... && printf 'Observed: %s\n' ...; } >> "$obs"`, the whole suite still prints `PASS: person-driven.sh scratch tests`. The TERM arrives while the script waits in `read`, never between the two writes. For the one-printf property the test is an audit (change standard rule 13, fourth bullet).
  - The case is as the brief wrote it. The builder's C20 mutation tests the order of append and read, not the pair's unity.
  - Failure scenario: a later edit splits the append into two lines and the suite stays green. A signal or a full disk between the two writes then leaves an `Action` line with no `Observed` line, which the record quotes as a run.
  - Whether to accept C20 as it is or to ask for a case that can see the split is the orchestrator's call.
  - Verdict: none (C20 met as briefed).
- Proof 6, `skills/diagnose/templates/person-driven.test.sh:108-111`: the dash run asserts `assert_status 0` and the observations file only.
  - What is wrong: brief C1 says "The same case is run once more with the script under dash", and the case compares standard output whole too. A dash-only defect in the output, such as the prompt or the closing line, would pass this test.
  - The reviewer's run of c1 with `sh` resolving to dash passes with standard output compared, so the behaviour holds today.
  - Verdict: C1 partial.

## 3. Standards

- Standards 1, `skills/ordo-help/SKILL.md:84`: "/spec stops ... the step has stopped twice already and would stop a third time, or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief".
  - What is wrong: change standard rule 14 and brief item 16. The line is a hit of item 16's grep ('brief-check agent'). The diff changed spec's row "A model other than the configured one" to "the brief-check agent or a diagnosis agent" (`spec:372`) and added a `/spec` stop for a premise cause not found (`spec:99`). The line now lists neither.
  - The report's "Hits" names neither this line nor why it stays.
  - Failure scenario: a user whose `/spec` stopped because the diagnosis agent was served Sonnet, or because a premise cause was not found, reads `/ordo-help`. The line lists no such stop, so the user takes the open item for an error of the skill.
  - Verdict: item 16 violated.
- Standards 2, `skills/spec/SKILL.md:99`: "The open item `diagnose` Steps 15 raises is the one open item for it, and a step with no other part stops there, as "Steps / A stop" says."; with spec "Stops", opening "The first six rows are stops, which leave an open item as "Steps / A stop" says."
  - What is wrong: `docs/dev/skill-layout.md`, "Sections, in order" row 7, puts every stop in the Stops table. The diff adds a `/spec` stop that leaves an open item, and the table has no row for it. `gen_figures.py`'s /spec box (lines 583 to 595) and `ordo-help:84` are both drawn from that table, so neither shows it.
  - Failure scenario: after a cause not found on a step with no other part, the user looks up the stop in spec's "Stops" to learn what resumes it. The table has no row. Run again, `/spec` finds no cause in Step 0 and investigates the same part again.
  - Verdict: none (item 9 holds as dictated).
- Standards 3, three bullets that each carry two requirements joined by "and", against `docs/dev/skill-layout.md`, "Lists and tables" (one rule per bullet). Verify 9 asked the report to name each departure, and it named none (Proof 2):
  - `skills/diagnose/SKILL.md:280`: "A served model that is not the configured one is the stop "A model other than the configured one", the agent is stopped, and nothing it wrote is used." (three requirements)
  - `skills/diagnose/SKILL.md:286`: "The session, not the diagnosis agent, raises a cause not found as Steps 15 says and writes what Steps 20 says into the step's Step 0 for `red line` and `premise`."
  - `skills/spec/SKILL.md:99` (quoted under Standards 2).
  - Failure scenario: a reviewer checking a later diff against one of these bullets cannot tell which of the two rules a change breaks. A session that stops the agent may also take the "nothing it wrote is used" rule as satisfied by the stop alone.
  - Verdict: none.
- Standards 4, `skills/diagnose/SKILL.md:50`: "   - A step that is not in the step list is a refusal ("Stops")."
  - What is wrong: brief item 7 makes this a `premise` refusal, made at Steps 1. The bullet stands in "What it reads" 3 among the bullets for every form, with no "For `premise`", and the only Stops row that names the case is "No part to investigate ... for `premise`".
  - Failure scenario: `/diagnose 2.F 9 Spec 1` for a step not in the list. The bullet says it is a refusal, but no row covers a finding form, so the session cannot tell which refusal to print or what resumes it. Before the change, "No dispatch entry" covered this case.
  - Verdict: none.
- Standards 5, `skills/spec/SKILL.md:160`: "This run leaves nothing but the diagnosis record and the text a diagnosis wrote in Step 0: the brief is restored to main's copy ...".
  - What is wrong: change standard rule 14, a sentence of "only" made false. Line 161 and `spec:70` restore plan.md "with the session's own records", which includes a ruling the session booked. A premise cause not found also leaves its open item in the state file (`diagnose:168`, `spec:99`). The sentence names neither.
  - Failure scenario: a session that waits at Steps 5 reads "nothing but" and drops a ruling it booked when it puts plan.md back. That loss is the one `spec:70` exists to prevent.
  - Verdict: none.

## 4. Behaviour

- Behaviour 1, `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, section "User-visible changes".
  - What is wrong: four changes a user or host sees are not stated with a before and after:
    - The new `/diagnose` refusal "No part to investigate" (`diagnose:251`).
    - The numbered item a session now writes into plan.md's Agents section at a diagnosis agent's start, with its stopped form (`diagnose:287-288`, `plan/templates/plan.md:36`).
    - The diagnosis agent's usage in the landing's booking (`land:96`, `:108`).
    - `/spec`'s new stop on a premise cause not found (`spec:99`).
  - The new trigger phrase "find the cause a step's text asks for" is named only under the judgment calls.
  - Failure scenario: Axel reads the landing and does not learn that plan.md now holds numbered Agents items written outside a landing. When the cost script later prices no diagnosis agent, he does not see why.
  - Verdict: none.
- Behaviour 2, `skills/diagnose/SKILL.md:168-173` (cause not found: an open item, then Steps 21 to 23, with no commit), `:119-121` (false premise: ends after Steps 21 and 22, with nothing written to Step 0) and `:203`: "Run by a person outside a `/spec` run, the session commits the record and Step 0 by path at once, as a resume point."
  - What is wrong: the commit that keeps a person-run premise diagnosis from blocking a later `/spec` covers only a found cause. A person-run premise that ends in a cause not found writes its open item into the state file and commits nothing. One that ends in a false premise leaves the record uncommitted and writes nothing that `/spec` reads.
  - `spec` Steps 1 (`spec:68`) refuses "An uncommitted change on the ledger's `plan.md` or state file that the session did not make", and leaves "any other change under the ledger folder" alone, never committed.
  - The brief's W12 covers only the found path, so the gap is in the brief too.
  - Failure scenario: Axel runs `/diagnose 2.X 4 premise` by hand, and the cause is not found. The open item sits uncommitted in orchestrator-state.md, and the next `/spec 2.X 4` in another session stops at "A failed preflight" on the state file. With a false premise instead, `/spec` finds no cause in Step 0 and runs the diagnosis again. It appends to a record it did not make, which it is told never to commit.
  - The fix (commit at the end of Steps 15 and Steps 4 for `premise` run by a person outside `/spec`) is small, but it is outside the brief's text, so the orchestrator rules on it.
  - Verdict: none (W12 met as written).

## Declined to judge

- Whether the raises for `spec` and `plan-orchestration` should be major rather than minor. Under `docs/dev/skill-layout.md`, "Frontmatter", a run whose output changes is a major raise, and these runs now start a diagnosis agent and write an Agents item. The brief's item 14 dictates minor, and the choice belongs to the user or the orchestrator.
- Whether `git worktree add` from the main checkout, which writes `.git/worktrees/` entries, breaks "The diagnosis agent changes no file of the main checkout" (`diagnose:282`). It depends on what "a file of the checkout" covers, a reading the brief and the existing Steps 3 design leave open.
- Whether c19's pipe variant is flaky on a loaded machine. It relies on `sleep 1` for `true` to have exited, and no repeated runs were made to measure it.
- Pricing the diagnosis agent in plan_cost.py. The brief makes it an open item of the orchestrator's, and the user must approve what the script computes.
- ADR 0006's sentence "The landing booking copies the ids into plan.md", against a diagnosis agent written straight into plan.md at its start. The reviewer judges this no contradiction: the ADR's Consequences say "A skill added later that starts an agent records its id and role", and brief decision 10 asks for it. The user may read it otherwise.
- The mutation rows the reviewer did not rerun: C1, C2, C4, C5, C6, C8, C10, C12, C14, C15, C18, C19 closed and C20 as the builder ran them. A sample of eight was rerun (C3, C7, C9, C11, C13, C16, C17, C19 pipe), and the full suite was run under dash.

Reviewer usage: a4609b37e96a4c34e, claude-opus-5-5, 264422 tokens, 55 tool uses, 15.5 minutes.

## Repair round 1, refuted

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md
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
(exit 0 on a rerun with output discarded; the worktree's state file is the copy at the base, so its verify list does not hold person-driven.test.sh, which is the orchestrator's at landing under ADR 0010)

$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
(no note line, so the c1 run under dash took place)

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)

$ (git diff --name-only <base>; git ls-files --others --exclude-standard) | grep -v '^.scratch' | xargs env LC_ALL=C grep -n '[^ -~]'
(no output, exit 1, over 21 files); the same list with a literal tab: (no output, exit 1); the report 2a-report.md: (no output)

$ grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
docs/dev/building.md:10:...git_guard.test.sh  # ...
docs/dev/building.md-11-sh skills/diagnose/templates/person-driven.test.sh  # person-driven.sh on scratch files: ...
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md-72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1

$ python3 -c 'import glob,yaml; ...'   (largest: 1022 roadmap, 987 spec, 965 diagnose; none above 1024)
$ git diff -U0 <base> -- 'skills/*/SKILL.md' | grep '^[-+]  version'
1.1.0 -> 1.2.0, 1.9.0 -> 1.10.0, 2.0.0 -> 2.1.0, 3.0.0 -> 3.1.0, 2.0.0 -> 2.1.0 (x3)   (seven skills, one minor raise each, matching the seven touched SKILL.md files)

$ git status --short   (18 modified paths, the report, skills/diagnose/references/, person-driven.sh, person-driven.test.sh; no state file, no plan_cost.py)
$ wc -l person-driven.sh person-driven.test.sh references/person-driven.md   76, 393, 20 (as the report says; the script is 76 lines against the limit of 120)
```

Rerun of the report's quoted commands:
- `grep -n 'person-driven' skills/diagnose/SKILL.md` gives 238 and 248. The `premise` lines of `diagnose` are 19, 35, 47, 49, 50, 51, 52, 62, 63, 69, 70, 100, 119, 120, 121, 123, 169, 172, 173, 174, 204, 206, 210, 255, 278, 293. The other `premise` greps and the `wc -l` counts of the changed files equal the report's. The 44 hits of the item 7 grep over `diagnose` are 44 rows in the report's table. The walk lines and the Terms lines I sampled (13 places) say what the report quotes.
- Item 6's figure: `python3 docs/figures/gen_figures.py` run on a copy of `docs/figures` under $TMPDIR writes `plan-loop.svg` and `pipeline.svg` byte-identical to the worktree's (`cmp`). In the SVG the `/spec` box rect is height 304, its last text line is at y=326 (20 px above the bottom, as before the change at 290 with last line y=312). The added row is one 14 px line, so the height change is exactly what the new row needs.
- The script's code is unchanged by the round: every quoted line (trap, `dir=.`, `case`, the action line, the append) sits one line lower than in the first review (39, 58, 59, 67, 74), and the only added line is in the head comment. The test grew by one line (392 to 393), the dash assertion.
- Unchanged-tree first run, test file alone in a scratch folder, `sh person-driven.test.sh <case>`: `FAIL: c1: exit status 127, expected 0`, `FAIL: c10 missing.txt: exit status 127, expected 64`, `FAIL: c13: exit status 127, expected 1`, `FAIL: c16: exit status 127, expected 0`, `FAIL: c18: exit status 127, expected 64`, `FAIL: c20: the second action was never shown` (same as the report's lines).
- Mutation sample, each made on a copy of the script and the test under `$TMPDIR/refmut.*` (removed afterwards; the worktree files never changed). Sample: C1 under dash, C3, C8, C9, C13, C14, C16, C17, C18, C19 closed, C20.
  - C1 under dash (script prompt `(one line) '` becomes `(one line)'`, the test copy with its `sh` stdout assertion deleted): `FAIL: c1 standard output under dash: the text differs from the expected one`
  - C3: `FAIL: c3: the action is not on standard output byte for byte`
  - C8: `FAIL: c8: exit status 1, expected 0`
  - C9: `FAIL: c9 link.txt: exit status 0, expected 64`
  - C13: `FAIL: c13: exit status 0, expected 1`
  - C14: `FAIL: c14: the text differs from the expected one`
  - C16, the table's one-line form (the `case $obs in */*)` line replaced by `dir=$(dirname "$obs")`): `FAIL: c16: exit status 64, expected 0`
  - C17: `FAIL: c17 empty observations path: exit status 1, expected 64`
  - C18: `FAIL: c18: exit status 1, expected 64`
  - C19 closed (`|| cannot_show` on the action line becomes `|| :`): `FAIL: c19 closed: exit status 0, expected 1`
  - C20, the table's one-line form (the action line gains `; printf 'Action %s: %s\n' "$n" "$text" 2>/dev/null >> "$obs"`, line 67 only): `FAIL: c20: the text differs from the expected one`
- Commit command of Steps 20, run in a scratch repository under $TMPDIR with a tracked `plan.md` changed and an untracked `rev/diag.md`: `git commit -q -m "x" -- rev/diag.md plan.md` printed `error: pathspec 'rev/diag.md' did not match any file(s) known to git`, exit 1, and `git status --short` still showed ` M plan.md` and `?? rev/`. With the tracked path alone, `git commit -q -m "x" -- plan.md` exited 0.

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. The script is 76 lines. Its code is read whole against "What the script must do" 1 to 10 and 9a. The head comment states the one-printf rule (item 13 of the round) and every error and exit status. C19 closed and the pipe variant are in the test and pass.
- 2: holds. The test has c1 to c20, passes, and its c1 now compares standard output under dash (reproduced by the mutation above).
- 3: holds. `references/person-driven.md:16` reads "the skill shows the command again with a new observations file", and `grep -c 'runs the script again'` is 0 by line 11 and 16 together.
- 4: holds. `skills/diagnose/SKILL.md:238` and `:248`.
- 5: holds. `skills/diagnose/templates/diagnosis.md:38-42`.
- 6: holds. Verify 5 above, and no state file in `git status --short`.
- 7: violated. The Steps 20 commit bullet (`skills/diagnose/SKILL.md:207`) does not commit a record that is new. See Spec 1. Every other bullet of the item holds: Quick start line 19, "What it reads" 1 and 3 (including line 50), Steps 1, 2, 3, 4 (lines 119-122), 15 (lines 172-174), the Stops rows and the opening sentences (five stops, five refusals, counted), the description.
- 8: holds. `diagnosis.md:3`, `:9`, `:96`, `:120`.
- 9: holds. `skills/spec/SKILL.md:92-104`, and the item-1 and item-2 sentences read exactly as the round dictates them. The item-4 sentence at `:95` reads as dictated.
- 10: holds. `skills/ordo-help/SKILL.md:68-69`, and the `/spec stops` line at `:84` names the cause not found and the diagnosis agent's served model.
- 11: holds. `skills/plan-orchestration/SKILL.md:28`.
- 12: holds. `sync_rules.py . --only glossary` prints the `ok:` line, and the terms Step 0, premise, actions file, observations file and diagnosis agent are in `plan-terms.md`.
- 13: holds. The conditional "With no person present" is in `spec:93` and `:349`, and `diagnose` Rules (lines 277-299) states the agent, its start and check, the saving, the numbered item and the record head. `spec` names the numbered item at `:64`, `:70`, `:103`, `:162`, `:164`. `land:96,103,104,108`, the three plan templates and the glossary terms carry it. No dispatch key was added and `plan_cost.py` is not in `git status --short`.
- 14: holds. Seven minor raises, one per touched skill.
- 15: holds. The `/spec` box lists the new row (`gen_figures.py:593`), and the SVG regenerates byte-identical.
- 16: holds. The item 16 grep over `README.md skills docs` leaves no hit that lists the agent kinds or the forms without the diagnosis agent or `premise`, except hits that name one kind on purpose (`grill`, `refute`). `README.md:20` carries the round's sentence.
- 9a: holds. Line 67 `|| cannot_show` runs before any read; c19 closed passes and its mutation fails.

Cases (C1 to C20 by the test, run and mutated as listed; the unsampled ones by reading the test case against its brief text and the report's FAIL line):

- C1: met. Standard output and the file compared whole under `sh` and under dash; the dash assertion fails under the prompt mutation.
- C2 to C15: met. Each is a case of the passing test; C3, C8, C9, C13 and C14 reproduced by mutation.
- C16: met. The test passes, and the table's mutation now fails it (`FAIL: c16: exit status 64, expected 0`).
- C17, C18, C19: met. Mutations reproduced (C19 pipe not rerun).
- C20: met for what it checks: the first pair kept and exit 143. The row names that, and the one-printf rule is checked by reading (`person-driven.sh:74` is one `printf`).
- R1 to R5: met. Re-read with `git show <base>:<file>`: `diagnose` has 0 `premise`, no script or reference file named at base line 223 (the row) or item 11, `diagnosis.md` has no `observ`, `docs/dev` has no `person-driven`, `spec` base line 133 is the "find why" bullet, `ordo-help` base line 82 is the only `premise`, `plan-orchestration` base line 165 lists three agent kinds, no "diagnosis agent" anywhere at base.
- W1: met. `diagnose:47-50,62,69,100,141,204`; `spec:97-98`.
- W2: met. `spec:93` now states the agent only for "no person present", and `diagnose:278-299` covers the start, check, saving and numbered item.
- W3: met. `diagnose:62`, `:50`, `:255`.
- W4: met. `diagnose:37,68,69`.
- W5: met for a step with one part. See Spec 2 for a step with two parts.
- W6: met under `/spec` (`diagnose:119-121`, `spec:102,95`). For a person-run `premise`, the false-premise commit goes through the command of Spec 1.
- W7: met. `plan-orchestration:125-132`, `diagnose:284-297`, `land:96,104,108`.
- W8: met. `diagnose:284-286,297`, `plan-orchestration:367`, `spec:376`.
- W9: met. `diagnose:277,279`.
- W10: met. `references/person-driven.md:5-18` now never has the session run the script.
- W11: met. `diagnose:294-297`, `plan-orchestration:152-153`, `spec:349`, `land:104,108`.
- W12: unmet. The first session's commit command fails on the record it is the first to add. See Spec 1.

### Findings

**1. Spec**

- Spec 1, `skills/diagnose/SKILL.md:207`: "The session then commits the record, `plan.md` and, for a cause not found, the state file at once, as a resume point, with `git commit -q -m "<message>" -- <path> ...`."; what is wrong: `<path> ...` includes the record `agents/reviews/<step>-diagnosis.md`, which is a file the commit is the first to add. `git commit -- <path>` accepts only paths git already tracks, so the whole commit stops with `error: pathspec '...' did not match any file(s) known to git` and nothing is committed (reproduced above in a scratch repository, exit 1, `plan.md` still ` M`). The form that works for a new file is the one `skills/session-retro/SKILL.md:139` writes: `git add -- "<report>" && git commit -m "..." -- "<report>"`. The round's item 4 dictated this text, so the builder followed it; the defect is in the dictation. Item 4's claim "A `/spec` in another session then finds no uncommitted change on `plan.md` or the state file" is not reproduced; the record is also left uncommitted, which `spec` Steps 1 leaves alone but never commits. Failure scenario: Axel runs `/diagnose 2.X 4 premise` by hand and the cause is found. The session follows Steps 20, the commit command errors, and `plan.md` (with Step 0 written) stays uncommitted. The next `/spec 2.X 4` in another session refuses at Steps 1 on the uncommitted `plan.md`, which is the case the bullet exists to prevent. The same holds for a cause not found (state file) and a false premise (`plan.md`). Heading: spec (an item whose diff does not do what its text asks). Verdict: item 7 violated, W12 unmet; the round's item 4 closure for the commit is not reproduced. Small fix at landing: name the add, for example `git add -- <record> && git commit -q -m "<message>" -- <path> ...`.
- Spec 2, `skills/diagnose/SKILL.md:169,172-173` and `skills/spec/SKILL.md:375`: "Inside a plan, for every form but `premise`, a cause not found is raised to the user as an open item, the one `plan-orchestration`'s "Stops" row "A finding that is the user's" leaves." / "For `premise`, the open item is raised as the `spec` stop "A cause not found" ("Stops") shows it." / row "A cause not found | A part of the step's text asks for a cause to be found and the diagnosis did not find it, and the step has no other part (Steps 2) | The open item the `diagnose` skill's Steps 15 raised, with the diagnosis record's path"; what is wrong: Steps 15's `premise` bullet is the builder's own wording beyond the round's literal text (judgment call 9). It excludes `premise` from the `plan-orchestration` row and points to a `spec` stop that exists only "when the step has no other part". For a step with two parts where one cause is found and the other is not, no text says where the open item for the second is raised or booked, and the two texts each point to the other for what the item holds (the content is stated only at `diagnose:170`, in the bullet that now reads as excluding `premise`). Before the edit, the generic bullet covered `premise` in every case. Failure scenario: `/spec` runs `premise` on a step whose text has two "find why" parts, one found, one not found. Steps 15 says the open item is raised as the `spec` stop shows it, the stop's condition is not met, and `spec` Steps 2 leaves the second cause out of the brief with "the one open item" that nothing says where to book. The brief is written without the item, and Axel never learns that a cause was not found. Heading: spec (two texts that do not agree for a case the step's text can hold, change standard rule 19). Verdict: none (W5 and item 9 hold as briefed for a step with one part). Small fix at landing: Steps 15's `premise` bullet says the open item is raised as the `spec` stop shows it when the step has no other part, and as the `plan-orchestration` row otherwise, and it points to line 170 for what the item quotes.

**2. Proof**

- none. Every claim of the round that a decision rests on reproduced: the mutation rows of C16 and C20 (one line each, failing as quoted), the dash assertion, the first runs, the greps, the counts and the figure.

**3. Standards**

- Standards 1, `.scratch/2-f-diagnose/agents/reviews/2a-report.md`, "Departures from the prose standard" and `skills/spec/SKILL.md:64`: "A change the session itself made since the last resume-point commit is one of its own records: a ruling it booked, a report or a reviewer it recorded, a diagnosis record with the text the diagnosis wrote in Step 0, or the diagnosis agent's numbered item in the Agents section."; what is wrong: the section names the sentences over about 20 words (92 listed), but 60 of the rows carry one of two phrases ("one rule with its condition and the pointer that makes it checkable; splitting it would separate the condition from the rule", "a template comment or placeholder: one cell that lists its parts"), not a reason read per sentence (prose standard, "How it is applied": each line is judged per instance). `spec:64` is a 50-word sentence holding four list items in paragraph form, which the prose standard, D "Structure" (three or more list-shaped items in paragraph form become a list), makes a list; the same holds for `spec:70` and `spec:164` after item 2's addition. The reason in the table does not address that. Failure scenario: a later reviewer reading the table takes each long sentence as weighed and one-rule, and a session following `spec:64` has to find the four kinds of own record in one sentence. Heading: standards. Verdict: none.
- Standards 2, `skills/diagnose/SKILL.md:282`: "The runner lists the effort agent, and `CLAUDE_CODE_EFFORT_LEVEL` is unset."; what is wrong: two checks that can each fail while the other holds, joined by "and", in one bullet (`docs/dev/skill-layout.md`, "Lists and tables"). The `refute` skill's Steps 1 that this bullet copies keeps them as two bullets. The round's item 9 split three other bullets and did not name this one. Failure scenario: a session that finds `CLAUDE_CODE_EFFORT_LEVEL` set cannot tell from the bullet whether the stop is "The configured effort cannot apply" or a missing agent, and a later diff to one check is judged against a two-rule bullet. Heading: standards. Verdict: none.

**4. Behaviour**

- none. The round's list of user-visible changes gives before and after for each change the round names (refusal, numbered item and stopped form, usage in the booking, the record head line, the `/spec` stop, the person-run commit, the trigger phrase). The person-run commit's before and after are stated; Spec 1 shows the after does not occur for a new record.

Reach beyond the finding, judged one by one:
- `diagnose` Steps 15's `premise` bullets (172-174): beyond the round's text, disclosed (judgment call 9). Lines 172 and 173 serve item 6 but leave the case in Spec 2. Line 174 serves item 4's pointer and holds.
- `spec` Steps 5, the clause "the diagnosis agent's numbered item in the Agents section among them" appended to item 8's dictated sentence: item 2 asks for it in "the two restore bullets" of Steps 5, so the append is inside the round. Holds.
- `gen_figures.py` box height 290 to 304 and the regenerated `plan-loop.svg`: sized to the one added row (20 px margin before and after), SVG reproduces from the generator. Holds.
- Glossary Step 0 (names the cause not found and the false premise a `premise` run ends with): item 4 writes both into Step 0, the entry is synced from `plan-terms.md` (`ok:` line). Holds.
No finding was closed by removing a check: the test lost no assertion (one added), the script's code did not change, no row of the mutation table was dropped.

### Declined to judge

- Whether `spec` and `plan-orchestration` take a minor or a major raise: the round brief closes it as the orchestrator's and I did not re-open it.
- Pricing the diagnosis agent in `plan_cost.py` (an open item of the orchestrator's, the user's approval) and the verify list of this plan's state file lacking `person-driven.test.sh` (ADR 0010, at landing).
- Whether a real `/diagnose ... premise` run yields a useful diagnosis on a "find why" step: a read and a rerun cannot settle it; the plan's step 3 is that run.
- Whether `git worktree add` from the main checkout, which writes `.git/worktrees/` entries, breaks "changes no file of the main checkout" (`diagnose:288`): depends on what "file of the checkout" covers.
- The mutation rows not rerun: C1 under `sh`, C2, C4, C5, C6, C7, C10, C11, C12, C15 and C19 (pipe). Those cases are judged by reading their test case against the brief and by the report's quoted FAIL lines. The sampled rows above all reproduced.
- Whether c19's pipe variant is stable on a loaded machine: it relies on `sleep 1`; it passed in each of the four full runs I made, none measured for flakiness.
- Whether the one-printf property holds against a signal mid-write: no test can interleave there; by reading, line 74 is one `printf` to an append redirect.

Reviewer usage: aaedc9dacd15f269f, claude-sonnet-5-5, 246375 tokens, 50 tool uses, 11.2 minutes.

## Closed

First run (the review the landing uses), each closed in repair round 1 by the item of `agents/briefs/2a-round-1.md` named, and found closed by the run over round 1 except where that run says otherwise below:

- Spec 1: round item 1.
- Spec 2: round item 2.
- Spec 3: round item 3.
- Proof 1, Proof 2, Proof 3: round item 15.
- Proof 4: round item 14.
- Proof 5: round item 13 (the one-printf rule stated in the head comment and checked by reading; no test can stop the script between two writes).
- Proof 6: round item 12.
- Standards 1: round item 5.
- Standards 2: round item 6.
- Standards 3: round item 9.
- Standards 4: round item 7.
- Standards 5: round item 8.
- Behaviour 1: round item 15.
- Behaviour 2: round item 4.
- Declined to judge, the minor raises: closed by the orchestrator in the round brief, under `docs/dev/skill-layout.md`, "Frontmatter" (no earlier run is refused or loses output).
- Declined to judge, pricing the diagnosis agent in `plan_cost.py`: raised to the user as an open item (a new computation of a script needs the user's approval).

Trial review (`2a-refuter-sonnet-trial.md`), findings not already among the first run's:

- Spec 4 (ADR 0012's command form): round item 4.
- Standards 2 (a repeat with no count): no change, since `docs/dev/skill-layout.md`, "Writing for an agent", exempts a repeat the user ends by answering.
- Standards 3 (a prohibition with no alternative): round item 10.

Run over round 1, each fixed at landing on main (small and inside the brief):

- Spec 1 (the commit command fails on a new record): `skills/diagnose/SKILL.md` Steps 20 names `git add -- <path> ...` before the commit.
- Spec 2 (a step with two parts, one cause not found): `skills/diagnose/SKILL.md` Steps 15's `premise` bullet raises the open item as the `spec` stop shows it when the step has no other part, and as `plan-orchestration`'s row "A finding that is the user's" otherwise, its content as the bullet on what the open item quotes says.
- Standards 1 (list-shaped sentences): `skills/spec/SKILL.md` Steps 1's own-records sentence becomes a list, and the two restore bullets point to it. The report's departures table is the builder's record and is left as written.
- Standards 2 (two checks in one bullet): `skills/diagnose/SKILL.md` "Rules", the effort check split into two bullets.
