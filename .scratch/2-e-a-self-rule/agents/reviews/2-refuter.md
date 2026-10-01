# Step 2 refuter report (on .agents/worktrees/2ea-2, base 15eb6fd)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

The plan's verify list, run as `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` from the worktree root. It exited 0 and printed:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

Brief verification 2 to 5, and the commands the builder's report quotes. Lines are cut at 160 characters, as the builder's were.

```
$ grep -n '## Agents' skills/plan/templates/plan.md skills/plan/SKILL.md skills/grill/SKILL.md skills/land/SKILL.md
skills/land/SKILL.md:94:   - The booking also appends to `plan.md`'s `## Agents` section one bullet per agent the step's dispatch entry names, `- <agent id>: <r
skills/plan/templates/plan.md:33:## Agents
skills/plan/SKILL.md:41:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers
skills/plan/SKILL.md:68:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is copied into the Rul
skills/plan/SKILL.md:70:   - Each bullet line under the rulings file's `## Agents` heading is copied into the new plan's `## Agents` section as it stands and in
skills/plan/SKILL.md:71:   - With no agent bullet in the rulings file, and with no rulings file, the `## Agents` section is written with its sentence and no bul
skills/grill/SKILL.md:194:4. Right after the start, read the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orche
skills/grill/SKILL.md:235:   - In a rulings file that has an `## Agents` section, a ruling bullet is written above that heading, so the rulings stay together an
$ grep -n '<agent id>, <served model>' skills/refute/SKILL.md skills/spec/SKILL.md skills/refute/templates/report.md skills/spec/templates/brief-check.md
skills/refute/templates/report.md:42:Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
skills/refute/templates/report.md:63:Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
skills/refute/SKILL.md:69:   - It records the report's path under the dispatch block's `reviewer_report` field, followed by, in parentheses, the reviewer's agen
skills/refute/SKILL.md:86:   - It records the run in the same field, after the first record, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <t
skills/spec/SKILL.md:277:5. The dispatch entry (Steps 9) records the report's path under `brief_check` with the agent's id, its served model, and its tokens, to
skills/spec/templates/brief-check.md:51:Agent usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
$ grep -n 'builders_before' skills/plan-orchestration/SKILL.md skills/plan/templates/orchestrator-state.md skills/land/SKILL.md
skills/land/SKILL.md:95:     - The builder from `session_id`, and each builder under `builders_before`: `builder of step <n>`.
skills/plan-orchestration/SKILL.md:183:- The dead builder's record moves to `builders_before:` as "Launching a builder" says, and `session_id` takes the continu
skills/plan-orchestration/SKILL.md:239:- A builder that is replaced keeps its record: its agent id and served model move to the dispatch entry's `builders_befor
skills/plan/templates/orchestrator-state.md:34:dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, w
$ (the same three patterns on the base, `git show 15eb6fd:<file> | grep -c <pattern>` for each of the 11 files)
0 (printed once for each of the 11 files)
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ git diff 15eb6fd | grep -nE '^[+-][^+-].*version:'
(no output, exit 1)
$ git diff 15eb6fd --name-only | xargs -I{} sh -c 'LC_ALL=C grep -n "[^ -~]" {} && echo "in {}"'
(no output)
$ LC_ALL=C grep -n '[^ -~]' .scratch/2-e-a-self-rule/agents/reviews/2-report.md
(no output, exit 1)
$ (line counts, base and now, of each changed file)
35 to 42 skills/plan/templates/plan.md; 139 to 141 skills/plan/SKILL.md; 332 to 336 skills/grill/SKILL.md; 181 to 182 skills/refute/SKILL.md; 67 to 67 skills/refute/templates/report.md; 313 to 315 skills/spec/SKILL.md; 55 to 55 skills/spec/templates/brief-check.md; 340 to 342 skills/plan-orchestration/SKILL.md; 207 to 217 skills/land/SKILL.md; 70 to 70 skills/plan/templates/orchestrator-state.md; 120 to 121 skills/repo-setup/templates/plan-terms.md; 137 to 138 docs/glossary.md; 180 to 180 README.md
$ grep -rn -F -- '<name>' skills docs README.md, for rulings file, served model and ## Agents, with the step's paths filtered out
the same hits the builder's report lists (grill/references/decision-form.md:46; roadmap, ordo-init and repo-setup SKILL.md "Rulings section, or ... rulings file"; ordo-help:74 and :79; ADR 0006:11; blind-comparison.md:25 and :41); none for ## Agents
$ python3 -c '... description lengths ...'
808 skills/grill/SKILL.md (the only description changed; under 1,024)
```

Every output the builder's report quotes for these commands matches the rerun, its line numbers included.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/plan/templates/plan.md:33-38` has `## Agents` between `## Rulings (<date>)` (line 29) and `## Blocked, and by what` (line 40), with the sentence the brief dictates and the two placeholder bullets of Decision 2. The sentence names the writers incompletely: Standards 2. That sentence is the brief's own text.
- 2: holds. `skills/plan/SKILL.md` covers it at "What it reads" 4 (line 41), Steps 2 (lines 68, 70, 71), the done-when bullet (line 84) and the Stops row "The plan exists" (line 126). The closing sentence of Steps 6 ("whose bullet lines Steps 2 has already copied") is unchanged and still holds, since the Agents bullets are copied as bullet lines.
- 3: holds. `skills/grill/SKILL.md` covers it at the description (line 3), the introduction (line 10), the Steps 10 list (line 170), "Steps / Looking up a fact" 4 (lines 194-198) and "Steps / Writing what settled" 1 (line 235). The commit sentence of Steps 10 ("commit the files written by explicit path list") already covers `plan.md` and the rulings file.
- 4: holds. `skills/refute/SKILL.md` covers it at Steps 1 (line 52), Steps 6 (line 67), Steps 7 (lines 69-71) and "Steps / Over a repair round" 6 (line 86). `skills/refute/templates/report.md:42` and `:63` also change. The stopped-reviewer sentence is the brief's text and has no form a stopped reviewer can be written in: Standards 1. The over-round record no longer carries Steps 7's commit rule: Standards 3.
- 5: holds. `skills/spec/SKILL.md` covers it at "Steps / The brief check" 1 (lines 250, 252, 253), 3 (line 264) and 5 (line 277, the record form written out). `skills/spec/templates/brief-check.md:51` also changes. "Steps / A stop" 1 commits "the ledger files the session wrote", and that includes `plan.md`.
- 6: holds. `skills/plan-orchestration/SKILL.md` covers it at Steps 7 (line 97), Steps 8 (line 112), "Resuming, and handing the plan over" (line 183) and "Launching a builder" (line 239). The `session_id: <agent id> (<served model>)` form at line 236 is unchanged.
- 7: holds. `skills/land/SKILL.md` covers it at Steps 6 (line 82, before the commit at line 83) and Steps 9 (lines 94-102: the roles, inline and academic-paper builders with no bullet, the skip of an id already in the section, the section created before `## Blocked, and by what`, and the read-back).
- 8: holds. `skills/plan/templates/orchestrator-state.md:34` names the agent id under `brief_check` and `reviewer_report`, and names `builders_before` with both of its forms.
- 9: holds. **booking**, **dispatch entry** (with `builders_before`, "each agent's id and served model", and the four "Stated in" places the brief lists), **rulings file** and the new **Agents section** (alphabetical, between **ADR** and **authority**) carry the same text in both files: `sync_rules.py` prints ok. The writers the **Agents section** term names are incomplete: Standards 2. That text is the brief's.
- 10: holds. `README.md:16` names the Agents bullet of each lookup agent.
- 11: holds. No added or removed line touches `version:`. The six versions are the same before and after (`grep 'version:'` on the base and on the tree).

Cases of the brief's "Cases":

- Plan template with `## Agents`, its sentence and two placeholder bullets: met, `skills/plan/templates/plan.md:33-38`.
- Rulings file with `# Rulings: 9`, two ruling bullets, `## Agents` and one agent bullet: met. `skills/plan/SKILL.md:68` copies only the bullets not under `## Agents` into Rulings, and line 70 copies the agent bullet into the Agents section and never shows it as a line to place.
- Rulings file with no `## Agents` heading: met. Line 68 copies every bullet into Rulings, and line 71 writes the section with its sentence and no bullet.
- `/grill` with a plan open starts a lookup agent: met, `skills/grill/SKILL.md:194-195` (the open plan's `plan.md`).
- `/grill` with no plan and no rulings file: met. Lines 195-196 create the rulings file with its heading line and the section at its end, and line 235 writes a later ruling above `## Agents`.
- A lookup agent served another model: met, line 197 ("its bullet is written all the same").
- `/refute` first run and the run over round 1: met, `skills/refute/SKILL.md:69` and `:86`.
- The brief check's record and its usage line: met, `skills/spec/SKILL.md:277` and `:264`, and `skills/spec/templates/brief-check.md:51`.
- `/land` with a builder agent, a brief check, a first reviewer and a reviewer over round 1: met, `skills/land/SKILL.md:94-98`, four roles.
- `/land` of an `inline` step: met, line 99 (no builder bullet) and lines 96-98.
- A step taken back out of main and landed again: met. `skills/land/SKILL.md:82` books the agents before the back-out's commit, and line 100 skips an id already in the section. The brief check is not run again for the step (`spec`, "Steps / The brief check" 4, "The check runs once per step"), so the reused brief-check agent is skipped.
- A builder stopped for another model and replaced: met, `skills/plan-orchestration/SKILL.md:239` (`<agent id> (<served model>, stopped)` under `builders_before`) and `skills/land/SKILL.md:95`.
- A dead builder taken over: met, `skills/plan-orchestration/SKILL.md:183` and `:239`, and `skills/land/SKILL.md:95`.
- A brief-check agent served another model: met. `skills/spec/SKILL.md:252-253` writes the bullet into `plan.md`'s Agents section, and "Steps / A stop" 1 commits it.
- A first reviewer served another model, stopped, then a second first-run reviewer: partial. The missing part is a form the stopped reviewer's record can be written in, and a step that writes it: Standards 1.
- "The plan exists" with Agents bullets in the rulings file: met, `skills/plan/SKILL.md:126`.
- (preserved) `session_id` form and the `inline` and `academic-paper` identities: met, `skills/plan-orchestration/SKILL.md:236`, `:70` and `:73`, unchanged.
- (preserved) Ruling bullets with no `## Agents` heading reach Rulings, and carried rulings are read as before: met. `skills/plan/SKILL.md:68` copies them. `skills/grill/SKILL.md` "What it reads" 6 is unchanged; it reads only sections whose heading begins `## Rulings` and bullets whose first line ends "(the user)", and an agent bullet ends with a model id.

## 1. Spec

- none.

## 2. Proof

- none.

## 3. Standards

- Place: `skills/refute/SKILL.md`, Steps 7, read with Steps 1 and "Steps / Over a repair round" 6. Quoted hunk: "   - A reviewer stopped for another model is recorded the same way, with `stopped` in place of its usage."
  - What is wrong: the record "the same way" begins with `<path>`, the report's path. A reviewer stopped at Steps 1 leaves no report ("nothing it wrote is used"), so the record's first part has no defined content.
  - The rule sits in Steps 7, which a run stopped at Steps 1 never reaches. Steps 1's stop bullet says nothing about recording the agent. This breaks `docs/dev/skill-layout.md`, "Where a rule goes": a rule for one point of the work goes in that step's item.
  - A reviewer over a repair round is also dispatched "as Steps 1 says" and can be stopped the same way, but `over round <n>: ...` has no stopped form.
  - Nothing says whether the second first-run reviewer's record follows the stopped one's or replaces it.
  - The sentence is the brief's item 4 verbatim, and it is the builder's point (1). My verdict: a finding.
  - Failure scenario: the orchestrator stops step 3's first reviewer at Steps 1 and raises the stop. After the ruling it dispatches a second reviewer and at Steps 7 writes only `reviewer_report: agents/reviews/3-refuter.md (<second id>, ...)`, because nothing at the stop told it to record the first. `/land` then books one reviewer. The stopped agent is missing from the Agents section and from the cost script's roles, against ADR 0006 ("Every agent a plan skill starts is recorded in the ledger").
  - The alternative failure: the orchestrator writes the stopped reviewer with the second reviewer's report path, and the record names a report that agent never wrote.
  - A fix of landing size: move the rule to Steps 1's stop bullet, with the form `(<agent id>, <served model>, stopped)` for a first run (the builder's option (a)) and `over round <n>: <agent id>, <served model>, stopped` for a run over a round. A later record follows the earlier one in the field.
  - Verdict: the case "A first reviewer served another model ..." is partial.
- Place: `skills/plan/templates/plan.md`, `## Agents` (line 35), and the **Agents section** term (`skills/repo-setup/templates/plan-terms.md:6`, `docs/glossary.md:11`). Quoted hunks: "`/land` writes a step's agents at its booking, and `/grill` writes its lookup agents." and "Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, \"Steps / Looking up a fact\"."
  - What is wrong: three other places write Agents bullets:
    - `spec`, "Steps / The brief check" 1 (the brief-check agent stopped for another model);
    - `land` Steps 6, at a back-out, which is not a booking;
    - `/plan` Steps 2, which copies the bullets from a rulings file.
  - The template sentence names only `/land` at its booking and `/grill`. The term's "Stated in" leaves out `spec`, "Steps / The brief check".
  - This breaks `docs/dev/change-standard.md` rule 19 (a change leaves no two statements that contradict each other) and rule 14 (a sentence the change makes false).
  - The text is the brief's items 1 and 9 as dictated, and it is the builder's point (2). My verdict: a finding.
  - Failure scenario: a maintainer changes the bullet form, for example for step 4's cost script. They follow the term's "Stated in" to `plan`, `land` and `grill`, and leave `spec`'s `- <agent id>: brief check of step <n>, <served model>` in the old form. The section then holds two forms, and the script misreads one of them.
  - A second failure: someone auditing the plan reads the template sentence and looks for a `brief check of step <n>` bullet with no landing behind it among `/land`'s bookings only.
  - Verdict: none, since items 1 and 9 hold as dictated.
- Place: `skills/refute/SKILL.md`, "Steps / Over a repair round" 6. Quoted hunk: "-   - It records the run as Steps 7 says." / "+   - It records the run in the same field, after the first record, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>`."
  - What is wrong: the old cross-reference applied Steps 7's whole rule to the run over a round. That rule includes "The report and its record are written to disk in the main checkout and not committed on their own. The next resume-point commit carries them". The new sentence gives only the form, so `refute` no longer states that commit rule for the over-round record.
  - This breaks `docs/dev/change-standard.md` rule 17: a rewrite keeps every rule it carries.
  - "after the first record" also places a round-2 record before round 1's.
  - Failure scenario: a session runs `/refute` by hand over a round, writes the record and commits the state file on its own. That commit is not one of the resume points `plan-orchestration`'s "Resuming, and handing the plan over" lists. Under the loop, that page's own rule ("a reviewer recorded" is carried by the next resume-point commit) still covers it.
  - A fix of landing size: "after the records before it, written as Steps 7 says".
  - Verdict: none, since item 4 holds as its text says.
- The builder's point (3): not a finding. The **dispatch entry** term's "Stated in" names the places that state a key, as the block's other terms do: **dispatch block** names `spec` Steps 9 and the template, not `land`, which reads the block.
  - `builders_before` is stated in "Launching a builder", which is listed.
  - `plan-orchestration` Steps 8 and "Resuming, and handing the plan over" refer to `refute`'s "Steps / Over a repair round" 6 and to "Launching a builder", both now listed, instead of stating a form.
  - `land` Steps 9 reads the entry and states none of its keys.

## 4. Behaviour

- none. The builder's report lists each changed record with its before and after: the lookup agent bullet, `/plan`'s copy, the `reviewer_report` and `brief_check` forms, the usage lines, `builders_before`, the booking's Agents bullets, the new template section and the terms.

## Declined to judge

- The plan's check on step 2 ("step 3's landing booking carries its reviewer's and brief check's ids"): reason, it can be settled only when step 3 lands.
- Whether ADR 0006 (proposed) should be refined to name `builders_before` and the Agents section: reason, it is outside this step's paths and is the orchestrator's or the user's call. I judge that the diff does not contradict its decision. Every agent is recorded with its id, role and served model, and the landing copies the ids into `plan.md`. A replaced builder stays in the dispatch entry, and a stopped brief-check agent goes straight into the Agents section.
- The builder states that it ran `git diff --stat` and `git status --short` read-only before its first change. `docs/dev/change-standard.md`, "Where the work happens", allows read-only git; `plan-orchestration` Steps 4 ("The builder. It never runs a git command") does not. Reason: the builder's launch prompt is not on disk, so I cannot check which rule it was given. Nothing in the diff depends on it.
- Whether "Steps / A stop" 1's "Leave three things and nothing else" in `spec` reads as excluding the stopped brief-check agent's Agents bullet: reason, I read the bullet as part of its third thing ("The ledger files the session wrote, committed by path"), the same reading that already covers the brief-check report at a stop. I raise no finding.

Reviewer usage: aec84f54a17e39016, claude-opus-5-5 (ordo-high), 219054 tokens, 46 tool uses, 9.1 minutes.
