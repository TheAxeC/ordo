Everything in the brief is done. Two points in text the brief dictates are reported for a ruling under "Anything in the brief that was wrong or impossible"; neither leaves an item undone.

# Step 2 builder report: every agent's id recorded with its role

## Open items of the state file (verbatim)

- none.

## The cases' first run, on the unchanged tree (15eb6fd)

Each case is a text case, read on the unchanged tree with the `grep` named. No case is one the brief's rules get wrong; nothing was handed back.

- The plan template holds `## Agents` after Rulings and before `## Blocked, and by what`: unmet. `grep -n '## Agents' skills/plan/templates/plan.md` printed nothing (exit 1); the template's sections are `## Rulings (<date>)` (line 29) and `## Blocked, and by what` (line 33).
- A rulings file with `# Rulings: 9`, two ruling bullets, `## Agents` and `- a1: grill lookup, claude-opus-5-5`: unmet for the agent bullet. `skills/plan/SKILL.md:68` copies "Each bullet line (`- ...`) of the rulings file" into Rulings and does not copy a heading, so the agent bullet is copied into Rulings as a ruling and no Agents section exists. The two ruling bullets are copied as the case wants; no line is shown to place, as now.
- A rulings file with no `## Agents` heading: partial. Line 68 copies every bullet into Rulings, as the case wants; the new plan's Agents section with its sentence and no bullet does not exist (`grep -n '## Agents' skills/plan/templates/plan.md` printed nothing).
- `/grill` with a plan open starts a lookup agent: unmet. `skills/grill/SKILL.md:193-195` reads the served model and checks it; `grep -n 'lookup' skills/grill/SKILL.md` shows no line that writes the agent down.
- `/grill` with no plan open and no rulings file starts a lookup agent before any answer is settled: unmet. The rulings file is created only by "Steps / Writing what settled" 1 (line 231) when a ruling is written, and holds no agent.
- A lookup agent served another model is stopped and still written as a bullet: unmet. Line 194 stops it and writes nothing.
- `/refute` first run and run over round 1: unmet. `skills/refute/SKILL.md:69` records the path, the served model and the usage with no agent id, line 85 says "It records the run as Steps 7 says", and `skills/refute/templates/report.md:42` and `:63` read `Reviewer usage: <tokens>, <tool uses>, <minutes>.`
- The brief check, `brief_check: <path> (<agent id>, <served model>, ...)` and a usage line that opens with the agent id: unmet. `skills/spec/SKILL.md:250`, `:262` and `:275` name only the served model; `skills/spec/templates/brief-check.md:51` reads `Agent usage: <served model>, <tokens>, <tool uses>, <minutes>.`
- `/land` of a step with a builder agent, a brief check, a first reviewer and one reviewer over round 1, four bullets: unmet. `skills/land/SKILL.md:92` copies no id and `plan.md` has no Agents section.
- `/land` of a step built `inline`, no builder bullet and the other agents' bullets written: unmet, for the same reason (no agent is booked).
- A step taken back out of main, its agents' bullets written with the back-out's commit, and no second brief-check bullet at the later landing: unmet. `skills/land/SKILL.md:82-83` commits the state file and `plan.md` with the other ledger records and books no agent.
- A builder served another model, stopped, and a new one launched: unmet. `skills/plan-orchestration/SKILL.md:235` writes the new builder over `session_id`; `grep -n 'builders_before'` over the three files printed nothing.
- A dead builder taken over by a continuation builder: unmet. `skills/plan-orchestration/SKILL.md:182` names the takeover and keeps no record of the dead builder.
- A brief-check agent served another model, its bullet in `plan.md`'s Agents section committed by the stop: unmet. `skills/spec/SKILL.md:251` stops the agent and writes no bullet.
- A first reviewer served another model, stopped, and a second first-run reviewer: unmet. `skills/refute/SKILL.md:53` stops the reviewer and no line records it.
- `/plan` meets "The plan exists" while the rulings file holds Agents bullets: unmet. `skills/plan/SKILL.md:124` shows the folder and the rulings file for removal and names no Agents bullets.
- (preserved) `session_id` keeps `<agent id> (<served model>)`, and `inline` and `academic-paper` are unchanged: holds. `skills/plan-orchestration/SKILL.md:235` writes `session_id: <agent id> (<served model>)` and lines 70 and 73 write `inline` and `academic-paper`.
- (preserved) A ruling bullet of a rulings file with no `## Agents` heading reaches Rulings, and carried rulings are the bullets ending "(the user)": holds. `skills/plan/SKILL.md:68` and `skills/grill/SKILL.md:50`.

## The cases after the change

- Plan template: `skills/plan/templates/plan.md:33-38` holds `## Agents`, the sentence (line 35) and the two placeholder bullets (lines 37 and 38), after `## Rulings (<date>)` (line 29) and before `## Blocked, and by what` (line 40). Met.
- Rulings file with an agent bullet: `skills/plan/SKILL.md:68` copies the two ruling bullets into Rulings, line 70 copies the agent bullet into the new plan's `## Agents` section and says it is "never copied into Rulings nor shown as a line to place". Met.
- Rulings file with no `## Agents` heading: line 68 copies every bullet into Rulings; line 71 writes the Agents section "with its sentence and no bullet". Met.
- `/grill` with a plan open: `skills/grill/SKILL.md:194-195` writes `- <agent id>: grill lookup, <served model>` to the open plan's `plan.md` Agents section. Met.
- `/grill` with no plan and no rulings file: line 195 creates the rulings file "with its heading line as 'Steps / Writing what settled' 1 says", line 196 gives it the Agents section at its end, and line 235 writes a later ruling above `## Agents`. Met.
- A lookup agent served another model: line 197 stops it and writes its bullet "all the same, since it ran". Met.
- `/refute`: `skills/refute/SKILL.md:69` gives `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)` and line 86 gives `over round <n>: <agent id>, <served model>, ...` in the same field after the first record. Met.
- Brief check: `skills/spec/SKILL.md:277` gives `<path> (<agent id>, <served model>, ...)` and line 264 and `skills/spec/templates/brief-check.md:51` open the usage line with the agent id. Met.
- `/land` with builder, brief check, first reviewer and one reviewer over round 1: `skills/land/SKILL.md:94-98` names the four roles `builder of step <n>`, `brief check of step <n>`, `reviewer of step <n>`, `reviewer of step <n> over round <r>`; line 102 reads the section back for exactly one bullet per agent. Met.
- `/land` of an `inline` step: line 99 gives the builder no bullet; lines 96 to 98 book the brief check and the reviewers. Met.
- A step taken back out of main: `skills/land/SKILL.md:82` books its agents before the commit, reads them back, and skips agents already in the section at the later landing; line 100 states the skip. Met.
- A builder stopped for another model, a new one launched: `skills/plan-orchestration/SKILL.md:239` moves the stopped builder to `builders_before:` as `<agent id> (<served model>, stopped)` and `session_id` takes the new one; `skills/land/SKILL.md:95` books both as `builder of step <n>`. Met.
- A dead builder taken over: `skills/plan-orchestration/SKILL.md:183` and `:239` record it with `dead`; `skills/land/SKILL.md:95` books both builders. Met.
- A brief-check agent served another model: `skills/spec/SKILL.md:252` writes `- <agent id>: brief check of step <n>, <served model>` into `plan.md`'s Agents section and reads it back, and line 253 has the stop's commit carry `plan.md`. Met.
- A first reviewer stopped, then a second: `skills/refute/SKILL.md:70` records the stopped reviewer with `stopped` in place of its usage; `skills/land/SKILL.md:97` books each first-run reviewer, a stopped one included. Met (see the first point under "Anything in the brief that was wrong or impossible" for the stopped reviewer's record).
- "The plan exists": `skills/plan/SKILL.md:126` names the Agents bullets, to be copied into the open plan's Agents section before the file is removed. Met.
- (preserved) `session_id`: `skills/plan-orchestration/SKILL.md:236` still reads `session_id: <agent id> (<served model>)`; lines 70 and 73 are unchanged. Holds.
- (preserved) Ruling bullets and carried rulings: `skills/plan/SKILL.md:68` copies every bullet not under `## Agents` into Rulings, and `skills/grill/SKILL.md:50` is unchanged. An agent bullet is `- <agent id>: <role>, <served model>` and never ends "(the user)". Holds.

## DONE / NOT DONE

| Item | Status | Command and output |
|---|---|---|
| 1 plan template, `## Agents` | DONE | `grep -n '## Agents' skills/plan/templates/plan.md` prints `33:## Agents` |
| 2 `plan` skill | DONE | lines 41, 68, 70, 71, 84, 126 of `skills/plan/SKILL.md`; the closing sentence of Steps 6 (line 114, "whose bullet lines Steps 2 has already copied") is read and still holds, since Steps 2 copies the Agents bullets as bullet lines too |
| 3 `grill` skill | DONE | lines 3, 10, 170, 194 to 198, 235 of `skills/grill/SKILL.md`; the commit sentence (line 176, "commit the files written by explicit path list in one commit") covers the Agents bullets, since they are written to a plan's `plan.md` or to the rulings file, both files written, so it is unchanged |
| 4 `refute` skill and report template | DONE | lines 52, 67, 69, 70, 86 of `skills/refute/SKILL.md`; lines 42 and 63 of `skills/refute/templates/report.md` |
| 5 `spec` skill and brief-check template | DONE | lines 250, 252, 253, 264, 277 of `skills/spec/SKILL.md`; line 51 of `skills/spec/templates/brief-check.md` |
| 6 `plan-orchestration` | DONE | lines 97, 112, 183, 239 of `skills/plan-orchestration/SKILL.md`; the `session_id` form of "Launching a builder" (line 236) is unchanged |
| 7 `land` | DONE | lines 82 and 94 to 102 of `skills/land/SKILL.md` |
| 8 state template dispatch comment | DONE | line 34 of `skills/plan/templates/orchestrator-state.md` |
| 9 the terms | DONE | `skills/repo-setup/templates/plan-terms.md` lines 6, 10, 33, 95 and `docs/glossary.md` lines 11, 15, 38, 100, with the same text; verification 4 below |
| 10 `README.md:16` | DONE | line 16 of `README.md` |
| 11 no version change | DONE | verification 5 below |
| The orchestrator's own `## Agents` section of this plan | NOT written by this builder, as the brief says | `.scratch/2-e-a-self-rule/plan.md` is not in this step's paths |

Verification, in the brief's order:

1. The plan's verify list through the runner, `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit status 0, printed (verbatim):

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

2. `grep -n '## Agents' skills/plan/templates/plan.md skills/plan/SKILL.md skills/grill/SKILL.md skills/land/SKILL.md` on the unchanged tree printed nothing (exit 1). After the change it prints at least one line for each file, with each line cut at 140 characters:

```
$ grep -n '## Agents' skills/plan/templates/plan.md skills/plan/SKILL.md skills/grill/SKILL.md skills/land/SKILL.md
skills/plan/templates/plan.md:33:## Agents
skills/plan/SKILL.md:41:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's se
skills/plan/SKILL.md:68:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is
skills/plan/SKILL.md:70:   - Each bullet line under the rulings file's `## Agents` heading is copied into the new plan's `## Agents` section
skills/plan/SKILL.md:71:   - With no agent bullet in the rulings file, and with no rulings file, the `## Agents` section is written with its
skills/land/SKILL.md:94:   - The booking also appends to `plan.md`'s `## Agents` section one bullet per agent the step's dispatch entry name
skills/grill/SKILL.md:194:4. Right after the start, read the agent's id and the model the runner served it, from the runner's record of the 
skills/grill/SKILL.md:235:   - In a rulings file that has an `## Agents` section, a ruling bullet is written above that heading, so the ruli
```

3. `grep -n '<agent id>, <served model>' skills/refute/SKILL.md skills/spec/SKILL.md skills/refute/templates/report.md skills/spec/templates/brief-check.md` and `grep -n 'builders_before' skills/plan-orchestration/SKILL.md skills/plan/templates/orchestrator-state.md skills/land/SKILL.md` both printed nothing on the unchanged tree (exit 1 each). After the change, each line cut at 140 characters:

```
$ grep -n '<agent id>, <served model>' skills/refute/SKILL.md skills/spec/SKILL.md skills/refute/templates/report.md skills/spec/templates/brief-check.md
skills/refute/templates/report.md:42:Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
skills/refute/templates/report.md:63:Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
skills/spec/templates/brief-check.md:51:Agent usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
skills/refute/SKILL.md:69:   - It records the report's path under the dispatch block's `reviewer_report` field, followed by, in parentheses,
skills/refute/SKILL.md:86:   - It records the run in the same field, after the first record, as `over round <n>: <agent id>, <served model>,
skills/spec/SKILL.md:277:5. The dispatch entry (Steps 9) records the report's path under `brief_check` with the agent's id, its served model
$ grep -n 'builders_before' skills/plan-orchestration/SKILL.md skills/plan/templates/orchestrator-state.md skills/land/SKILL.md
skills/land/SKILL.md:95:     - The builder from `session_id`, and each builder under `builders_before`: `builder of step <n>`.
skills/plan/templates/orchestrator-state.md:34:dispatch: none               # or the block /spec writes (a list with workers_at_once above 1
skills/plan-orchestration/SKILL.md:183:- The dead builder's record moves to `builders_before:` as "Launching a builder" says, and `session_i
skills/plan-orchestration/SKILL.md:239:- A builder that is replaced keeps its record: its agent id and served model move to the dispatch ent
```

The changed lines of items 6 and 8 are read in the diff blocks below.

4. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` (it is the seventh command in the runner's output above, and run on its own after the last edit).

5. No git command was run for this check, since the builder's instructions forbid one. The `version:` lines, `grep -n 'version:' skills/*/SKILL.md` sorted, are identical before and after the change (`diff` of the two sorted outputs printed nothing): every skill keeps its version, among them `grill` 1.2.0, `plan` 1.10.1, `refute` 1.7.1, `spec` 1.7.0, `land` 1.8.2, `plan-orchestration` 2.10.1.

6. Every changed line, before (`<`) and after (`>`), is quoted in the next section; the cases' first reads and reads after the change are above.

7. The `grep -rn -F` of each name across `skills/`, `docs/` and `README.md`, with the hits outside the step's paths, and what the change does to each, are in the last section.

## Every changed line, before and after

Each block is `diff <the file on the unchanged tree> <the file now>`, in diff's normal format. `docs/glossary.md` lines 11, 15, 38 and 100 carry the same text as lines 6, 10, 33 and 95 of `skills/repo-setup/templates/plan-terms.md` shown below; the sync check proves the two equal.

```
### skills/plan/templates/plan.md
32a33,39
> ## Agents
> 
> Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; `/land` writes a step's agents at its booking, and `/grill` writes its lookup agents.
> 
> - <agent id>: <role, such as builder of step <n>>, <served model>
> - <agent id>: grill lookup, <served model>
> 
### skills/plan/SKILL.md
41c41
< 4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open.
---
> 4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open, and, under its `## Agents` heading, the lookup agents `/grill` started while no plan was open.
68c68
<    - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
---
>    - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
69a70,71
>    - Each bullet line under the rulings file's `## Agents` heading is copied into the new plan's `## Agents` section as it stands and in its order, in place of the template's placeholder bullets, and is never copied into Rulings nor shown as a line to place.
>    - With no agent bullet in the rulings file, and with no rulings file, the `## Agents` section is written with its sentence and no bullet.
82c84
<    - The step is done when the draft holds the goal, the gate, the answers of "## Gate", the Rulings and the step list with the closing step last.
---
>    - The step is done when the draft holds the goal, the gate, the answers of "## Gate", the Rulings, the Agents section and the step list with the closing step last, and when the draft, read back, holds every agent bullet of the rulings file once, in its Agents section.
124c126
< | The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove | Nothing |
---
> | The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove, with its Agents bullets named when it holds any, to be copied into the open plan's Agents section before the file is removed | Nothing |
### skills/grill/SKILL.md
3c3
< description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
---
> description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, each lookup agent into the Agents section of the same file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
10c10
< `/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.
---
> `/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, each lookup agent it started as a bullet of the Agents section of the same file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.
169a170
>     - List each lookup agent written to an Agents section ("Steps / Looking up a fact" 4), with its bullet and its `<path>:<line>`.
193,195c194,198
< 4. Right after the start, read the model the runner served the agent, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
<    - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it found is used.
<    - The item is done when the served model is the configured one, or the stop is raised.
---
> 4. Right after the start, read the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says, and write the agent as one bullet `- <agent id>: grill lookup, <served model>` to the `## Agents` section of the file the interview writes its rulings to.
>    - That file is the open plan's `plan.md`, or else the rulings file, created with its heading line as "Steps / Writing what settled" 1 says.
>    - A `plan.md` without the section gets it before `## Blocked, and by what`, and a rulings file without it gets it at its end.
>    - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, nothing it found is used, and its bullet is written all the same, since it ran.
>    - The item is done when the file, read back, holds the bullet, and the served model is the configured one or the stop is raised.
231a235
>    - In a rulings file that has an `## Agents` section, a ruling bullet is written above that heading, so the rulings stay together and `/plan` reads the agents under their heading.
### skills/refute/SKILL.md
52c52
<    - Right after the dispatch, the orchestrator or the session reads the model the runner served the reviewer, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
---
>    - Right after the dispatch, the orchestrator or the session reads the reviewer's agent id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
67c67
<    - Then the reviewer's usage.
---
>    - Then the reviewer's usage line: its agent id, its served model, its tokens, its tool uses and its minutes.
69,70c69,71
<    - It records the report's path under the dispatch block's `reviewer_report` field, with the reviewer's served model (Steps 1) and its tokens, tool uses and time from its completion notice beside it.
<    - Both are written to disk in the main checkout and not committed on their own. The next resume-point commit carries them, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
---
>    - It records the report's path under the dispatch block's `reviewer_report` field, followed by, in parentheses, the reviewer's agent id, its served model (Steps 1), and its tokens, tool uses and time from its completion notice: `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)`.
>    - A reviewer stopped for another model is recorded the same way, with `stopped` in place of its usage.
>    - The report and its record are written to disk in the main checkout and not committed on their own. The next resume-point commit carries them, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
85c86
<    - It records the run as Steps 7 says.
---
>    - It records the run in the same field, after the first record, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>`.
### skills/refute/templates/report.md
42c42
< Reviewer usage: <tokens>, <tool uses>, <minutes>.
---
> Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
63c63
< Reviewer usage: <tokens>, <tool uses>, <minutes>.
---
> Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
### skills/spec/SKILL.md
250c250
<    - Right after the start, the session reads the model the runner served the agent, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
---
>    - Right after the start, the session reads the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
251a252,253
>    - A brief-check agent stopped for another model has no dispatch entry to be recorded in, since "Steps / A stop" 2 leaves none, so the session writes its bullet `- <agent id>: brief check of step <n>, <served model>` straight into `plan.md`'s Agents section, creating the section before `## Blocked, and by what` when `plan.md` has none, and reads the section back.
>    - The stop's commit carries `plan.md` among the ledger files it commits ("Steps / A stop" 1).
262c264
<    - The session saves it at `agents/reviews/<step>-brief-check.md` beside the state file, the usage line filled with the agent's served model (item 1) and its tokens, tool uses and time from its completion notice.
---
>    - The session saves it at `agents/reviews/<step>-brief-check.md` beside the state file, the usage line filled with the agent's id, its served model (item 1) and its tokens, tool uses and time from its completion notice.
275c277
< 5. The dispatch entry (Steps 9) records the report's path under `brief_check`, with the check's served model and its tokens, tool uses and time, read from the report's usage line in a later `/spec` run of the step.
---
> 5. The dispatch entry (Steps 9) records the report's path under `brief_check` with the agent's id, its served model, and its tokens, tool uses and time, in the form `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)`, read from the report's usage line in a later `/spec` run of the step.
### skills/spec/templates/brief-check.md
51c51
< Agent usage: <served model>, <tokens>, <tool uses>, <minutes>.
---
> Agent usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.
### skills/plan-orchestration/SKILL.md
97c97
<      - Write its path, with the reviewer's served model and its tokens, tool uses and time from its completion notice, into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.
---
>      - Write its path, with the reviewer's agent id, its served model and its tokens, tool uses and time from its completion notice, into the dispatch block under `reviewer_report` in the form of the `refute` skill's Steps 7, on disk; the next resume-point commit carries them.
112c112
<      - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its path and its usage recorded under `reviewer_report` beside the first.
---
>      - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its run recorded under `reviewer_report` beside the first as the `refute` skill's "Steps / Over a repair round" 6 says.
182a183
> - The dead builder's record moves to `builders_before:` as "Launching a builder" says, and `session_id` takes the continuation builder.
237a239
> - A builder that is replaced keeps its record: its agent id and served model move to the dispatch entry's `builders_before:` key, `<agent id> (<served model>, stopped)` for a builder stopped for another model and `<agent id> (<served model>, dead)` for a dead builder, one after another, and `session_id` takes the new builder.
### skills/land/SKILL.md
81a82
>    - The step's agents are booked in `plan.md`'s Agents section by the rules of Steps 9, written and read back before that commit, since `/spec` later removes the step's dispatch entry; the agents of its later landing are appended when it lands, those already in the section skipped.
92a94,102
>    - The booking also appends to `plan.md`'s `## Agents` section one bullet per agent the step's dispatch entry names, `- <agent id>: <role>, <served model>`, with the roles below.
>      - The builder from `session_id`, and each builder under `builders_before`: `builder of step <n>`.
>      - The brief-check agent from `brief_check`: `brief check of step <n>`.
>      - Each first-run reviewer from `reviewer_report`, a stopped one included: `reviewer of step <n>`.
>      - Each reviewer over a round: `reviewer of step <n> over round <r>`.
>    - An `inline` or `academic-paper` builder has no agent id and gets no bullet.
>    - An agent whose id already has a bullet in the section gets none, so a brief-check agent booked at a back-out, or at a stop of `/spec`, is not booked twice.
>    - A `plan.md` without the section gets it before `## Blocked, and by what`.
>    - The section is read back after the write, and each agent of the entry has exactly one bullet.
### skills/plan/templates/orchestrator-state.md
34c34
< dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with its served model, tokens, tool uses and time), landing, round. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's served model, tokens, tool uses and time) at the review. A step dispatched while another in flight names a file its brief also names carries shared_paths: each shared file and why the merge at landing is simple; with no shared file the key is left out.
---
> dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time), landing, round. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time) at the review. A step dispatched while another in flight names a file its brief also names carries shared_paths: each shared file and why the merge at landing is simple; with no shared file the key is left out.
### skills/repo-setup/templates/plan-terms.md
5a6
> - **Agents section**: the `## Agents` section of `plan.md`, and of a rulings file, one bullet per agent a plan skill started for the entry, `- <agent id>: <role>, <served model>`. Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, "Steps / Looking up a fact".
9c10
< - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the diagnosis records with their causes, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
---
> - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the diagnosis records with their causes, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. It also copies each agent of the step, with its id, role and served model, into `plan.md`'s Agents section. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
32c33
< - **dispatch entry**: the record of one step in flight in the dispatch block: step, executor, worker, worktree, base, launched, report, `brief_check`, `landing` (`not-started`, `cherry-picking` or `backed-out`), `round`, and `shared_paths` when a file is shared. The orchestrator adds the builder's identity under `session_id` (its agent id followed by the model the runner served it, or `inline` or `academic-paper`), `builder_usage` and `reviewer_report`. `brief_check` and `reviewer_report` also carry each agent's served model. Stated in: `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7 and "Launching a builder"; `land`, Steps 2 and 6.
---
> - **dispatch entry**: the record of one step in flight in the dispatch block: step, executor, worker, worktree, base, launched, report, `brief_check`, `landing` (`not-started`, `cherry-picking` or `backed-out`), `round`, and `shared_paths` when a file is shared. The orchestrator adds the builder's identity under `session_id` (its agent id followed by the model the runner served it, or `inline` or `academic-paper`), `builders_before` (each replaced builder's id and served model), `builder_usage` and `reviewer_report`. `brief_check` and `reviewer_report` also carry each agent's id and served model. Stated in: `spec`, Steps 9 and "Steps / The brief check" 5; `refute`, Steps 7 and "Steps / Over a repair round" 6; `plan-orchestration`, Steps 4, 6 and 7 and "Launching a builder"; `land`, Steps 2 and 6.
94c95
< - **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
---
> - **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, and, under `## Agents`, the lookup agents `/grill` started, while no plan is open. `/plan` copies its Agents bullets into the new plan's Agents section, its other bullet lines into the new plan's Rulings, and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6, "Steps / Looking up a fact" and "Steps / Writing what settled".
### README.md
16c16
< | `grill` | Interviews the user about one roadmap entry, in rounds. Each round asks every decision whose prerequisites are settled, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, while agents look up the facts. It writes each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry and the glossary, and on the user's yes a proposed ADR |
---
> | `grill` | Interviews the user about one roadmap entry, in rounds. Each round asks every decision whose prerequisites are settled, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, while agents look up the facts. It writes each answer as it settles into the plan's Rulings or the entry's rulings file, each lookup agent it starts as a bullet of the Agents section of that file, the roadmap entry and the glossary, and on the user's yes a proposed ADR |
```

## Files changed, with line counts

- `skills/plan/templates/plan.md`: 35 to 42 lines.
- `skills/plan/SKILL.md`: 139 to 141 lines.
- `skills/grill/SKILL.md`: 332 to 336 lines.
- `skills/refute/SKILL.md`: 181 to 182 lines.
- `skills/refute/templates/report.md`: 67 lines, 2 changed.
- `skills/spec/SKILL.md`: 313 to 315 lines.
- `skills/spec/templates/brief-check.md`: 55 lines, 1 changed.
- `skills/plan-orchestration/SKILL.md`: 340 to 342 lines.
- `skills/land/SKILL.md`: 207 to 217 lines.
- `skills/plan/templates/orchestrator-state.md`: 70 lines, 1 changed.
- `skills/repo-setup/templates/plan-terms.md`: 120 to 121 lines.
- `docs/glossary.md`: 137 to 138 lines.
- `README.md`: 180 lines, 1 changed (line 16).
- `.scratch/2-e-a-self-rule/agents/reviews/2-report.md`: this report.

## Judgment calls the brief left open

- The wording of each sentence that carries the brief's item is the builder's, in the form the brief gives. The recorded forms are the brief's exactly: `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)`, `over round <n>: <agent id>, <served model>, ...`, `<agent id> (<served model>, stopped)` and `<agent id> (<served model>, dead)`.
- `skills/refute/SKILL.md:70` (the stopped reviewer) is placed directly after the record bullet, and the bullet that follows it now begins "The report and its record are written to disk" in place of "Both are written to disk", since "Both" would otherwise point at the stopped-reviewer bullet. The sentence means what it meant; it serves item 4.
  - Landing note: repair round 1 moved the stopped-reviewer rule to Steps 1, so the reason above no longer holds; the landing restored "Both are written to disk", the base text, and Steps 1 now gives the stopped record in sub-bullets. `skills/refute/SKILL.md` is 181 lines at the base and 185 after the landing.
- `skills/refute/SKILL.md:67` (Steps 6's usage bullet) names the usage line's five parts, the form of the template's line, as item 4 asks.
- `skills/plan/SKILL.md:84` is one sentence with two requirements joined by "and when", as the brief's item 2 asks for both in the "done when" bullet.
- The Agents bullets of a step go to `plan.md`'s Agents section also when the plan names a part file for bookings; item 7 names `plan.md`, and the **Agents section** term says `plan.md`.
- Before the first change, one `git diff --stat` and one `git status --short` ran, read-only, on the unchanged tree; both printed nothing. No other git command was run by the builder; the only git in the verification is inside the runner's last command (`git ls-files`).

## Behaviour a skill's reader or the ledger sees change

- A `grill` lookup agent now appears as a bullet in the Agents section of the open plan's `plan.md` or of the rulings file (before: it was recorded nowhere).
- A `/plan` run copies a rulings file's Agents bullets into the new plan's Agents section and its other bullets into Rulings (before: every bullet went into Rulings).
- The dispatch entry's `reviewer_report` and `brief_check` carry the agent id in the form `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)` (before: the served model and the usage, with no id); a run over a repair round is `over round <n>: ...`.
- The usage line of a refuter report and of a brief-check report opens with the agent id.
- A replaced builder is kept under `builders_before:` in the dispatch entry (before: `session_id` was overwritten).
- A `/land` booking appends the step's agents to `plan.md`'s Agents section, a back-out does so at its commit, and a `/spec` stop for a brief-check agent served another model writes that agent's bullet.
- A new plan's `plan.md` holds an `## Agents` section between Rulings and `## Blocked, and by what`.
- The glossary's terms **booking**, **dispatch entry** and **rulings file** change as item 9 says, and **Agents section** is new.

## The sentences about a changed file as a whole, reread (change standard, rule 14)

- `skills/plan/SKILL.md:10`, "It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`": holds; the Agents section is part of `plan.md`.
- `skills/plan/SKILL.md:3`, the description: holds; it lists what `plan.md` holds by example and names no complete list.
- `skills/plan/SKILL.md:87`, "show each line of the rulings file that Steps 2 did not copy as a bullet line": holds; Steps 2 copies each agent bullet as a bullet line, into the Agents section.
- `skills/plan/SKILL.md:114`, "whose bullet lines Steps 2 has already copied": holds, as the DONE table says.
- `skills/plan/SKILL.md:121`, the stop "The drafted step list" and its "What it shows": holds; it lists what the draft shows and names the Rulings in no list the change falsifies.
- `skills/plan/SKILL.md:141`, the last rule, "the ledger records decisions with their dates in `plan.md`'s rulings list; the templates and this file carry none": holds; an Agents bullet carries no date.
- `skills/grill/SKILL.md:3` and `:10`: changed by item 3. `skills/grill/SKILL.md:176`, the commit sentence: holds, as the DONE table says. The Rules bullet "Every answer is written in the turn it settles" (line 334): holds; an agent is not an answer. The Stops intro, "The first three rows are stops": holds.
- `skills/refute/SKILL.md:10`, the introduction: holds; it names the report, the verdicts and the findings, not the dispatch record. Line 3, the description: holds.
- `skills/spec/SKILL.md:10`, "It leaves behind the brief and its brief check's report in the preparation commit, and the dispatch entry written to the state file": holds for a run that reaches the preparation commit; a stop leaves what "Steps / A stop" 1 lists, which includes `plan.md`, the file that now also carries the Agents bullet. Line 282, "The first six rows are stops, which leave an open item as 'Steps / A stop' says": holds.
- `skills/land/SKILL.md:10`, the introduction, and line 3, the description ("the booking in the plan with each agent's tokens, tool uses and time"): hold; the booking still states each agent's usage, and the description names no complete list. Steps 12's "ledger files the session wrote since the last resume point" covers `plan.md`.
- `skills/plan-orchestration/SKILL.md:152`, "Such records are a builder's report saved, the builder's usage under `builder_usage`, a refuter report saved, a reviewer recorded and a ruling booked": holds; the reviewer's record is still one of them.
- `skills/plan/templates/orchestrator-state.md:34`, the dispatch comment: changed by item 8; the sentence "the block /spec writes ... step, executor, worker, ..." lists the keys /spec writes, and the new key `builders_before` is named among the keys the orchestrator adds.
- `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: the block stays in alphabetical order (**Agents section** between **ADR** and **authority**); the glossary's first paragraph makes no count and holds.

## Anything in the brief that was wrong or impossible

- A reviewer stopped for another model: `refute` Steps 7 says it is "recorded the same way, with `stopped` in place of its usage". The record's first part is the report's path, and a stopped reviewer's output is not used ("nothing it wrote is used"), so it has no path. The text in `skills/refute/SKILL.md:70` is the brief's sentence unchanged; the form of a stopped reviewer's record, with or without a path, is the brief's to rule. Options: (a) `(<agent id>, <served model>, stopped)` with no path, which `land` reads as a first-run reviewer from the parenthesis; (b) a path-less line `stopped: <agent id>, <served model>`. Recommendation: (a), since it is the form the brief already uses for a stopped builder and keeps one parenthesis shape in the field. The text stands as the brief has it until the ruling.
- The plan template's sentence under `## Agents` and the **Agents section** term's "Stated in" name `/land` and `/grill` as the writers, while item 5 also has `/spec` write one bullet, for a brief-check agent stopped for another model. Both are the brief's text and are left as dictated. Options: (a) add a `/spec` clause to the template's sentence and `spec`, "Steps / The brief check" to the term's "Stated in" in both term files; (b) leave the dictated text. Recommendation: (a), since the template sentence is false for that one bullet.
- The `dispatch entry` term's "Stated in" (item 9) gains `refute` and `spec` as the brief says. It still omits `plan-orchestration`, Steps 8 and "Resuming, and handing the plan over" (which now name `builders_before` and the over-round record) and `land`, Steps 9 (which reads both); it also omitted them for `builder_usage` and `reviewer_report` before. Not changed, since item 9 lists what is added.
- No premise of "What is on the tree" was found wrong; the line numbers cited for the unchanged tree were each read at the place quoted.

## Hits outside the step's paths, for each name the step changes

The commands are `grep -rn -F -- '<name>' skills docs README.md`, with the hits inside the brief's paths removed (`README.md:16` only) and each line cut at 200 characters.

```
=== grep -rn -F -- 'reviewer_report' skills docs README.md, hits outside the paths
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11:Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `sessio
=== grep -rn -F -- 'brief_check' skills docs README.md, hits outside the paths
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11:Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `sessio
=== grep -rn -F -- 'session_id' skills docs README.md, hits outside the paths
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:7:A script prices each agent role's usage of a plan from the agents' transcripts (`docs/roadmap.md`, entry 2.E.A). A script computes 
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11:Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `sessio
docs/dev/blind-comparison.md:27:     - The files it loaded are the `files` of the `instructions` attachment in the session transcript the process writes under `~/.claude/projects/` for its `session_id
=== grep -rn -F -- 'served model' skills docs README.md, hits outside the paths
skills/ordo-help/SKILL.md:74:/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choic
skills/ordo-help/SKILL.md:79:/refute stops                 the reviewer was served a model other than the configured one: it stops the reviewer, uses nothing it wrote, and shows the configured value, 
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11:Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `sessio
docs/dev/blind-comparison.md:25:   - The judge's served model is the `model` of the process's `init` message.
docs/dev/blind-comparison.md:41:   - each judge's command, its served model, every key of its `modelUsage`, and the global instruction files it loaded (item 4);
=== grep -rn -F -- 'rulings file' skills docs README.md, hits outside the paths
skills/grill/references/decision-form.md:46:The Rulings, or the rulings file when no plan is open, gain two bullets, in the same turn as the answers:
skills/roadmap/SKILL.md:43:   - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
skills/roadmap/SKILL.md:44:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullet
skills/roadmap/SKILL.md:53:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
skills/ordo-init/SKILL.md:36:   - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
skills/ordo-init/SKILL.md:37:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bull
skills/ordo-init/SKILL.md:46:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
skills/repo-setup/SKILL.md:37:   - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
skills/repo-setup/SKILL.md:38:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bul
skills/repo-setup/SKILL.md:47:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
=== grep -rn -F -- 'Rulings' skills docs README.md, hits outside the paths
skills/grill/references/decision-form.md:3:The example is a roadmap entry for a command-line tool `tally`, which counts the words of text files. The Rulings of its plan already hold bullets `D1` to `D
skills/grill/references/decision-form.md:46:The Rulings, or the rulings file when no plan is open, gain two bullets, in the same turn as the answers:
skills/grill/references/decision-form.md:65:- **B. Keep it a Rulings line.** *Pro:* no new file. *Con:* the plan's ledger is archived when the plan closes, and the reason for the count goes with it.
skills/grill/references/decision-form.md:74:On `D6 Agree`, the Rulings gain the bullet of the answer, in the same turn:
skills/roadmap/SKILL.md:44:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullet
skills/roadmap/SKILL.md:53:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
skills/ordo-init/SKILL.md:37:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bull
skills/ordo-init/SKILL.md:46:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
skills/repo-setup/SKILL.md:38:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bul
skills/repo-setup/SKILL.md:47:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
docs/adr/0005-the-choices-of-every-plan-go-to-one-file-at-the-ledger-root.md:16:- The choices only as "(self-rule)" bullets of the Rulings: a bullet cannot hold the options, their pros and cons and th
docs/dev/blind-comparison.md:13:     - The orchestrator keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry.
=== grep -rn -F -- 'booking' skills docs README.md, hits outside the paths
skills/land/templates/land.sh:4:# the booking data is printed.
skills/land/templates/land.sh:21:# landing with checks.sh's output printed. It then prints the booking data between
skills/land/templates/land.sh:22:# "=== booking ===" and "=== end booking ===": the diff stat against <base> and the paths staged
skills/land/templates/land.sh:454:    fail "booking diff stat failed" "$landing_status"
skills/land/templates/land.sh:461:    fail "booking staged paths failed" "$landing_status"
skills/land/templates/land.sh:464:printf '%s\n' '=== booking ==='
skills/land/templates/land.sh:469:printf '%s\n' '=== end booking ==='
skills/ordo-help/SKILL.md:70:/land <entry> <step>          stops the step's agents, then onto main, checks on main, small fixes, the look where plan.yaml's look: says, the A/B, the booking, the commit
skills/diagnose/SKILL.md:182:    - Done when the bullet is drafted and shown or committed, or, inside a plan, when the record's path and the cause are written for the landing's booking.
skills/repo-setup/templates/shared-rules.md:11:- **Never take the lazy option.** The lazy option costs less now and leaves the work undone: a booking instead of a fix, a later step instead of this one
skills/repo-setup/templates/docs/adr/README.md:5:A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on. A builder's change that contradicts one against its brief is r
skills/repo-setup/templates/docs/dev/change-standard.md:69:A step's verify list runs through the `land` skill's `templates/checks.sh` from the root of the checkout it checks, as `sh <the land skill's 
docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11:Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `sessio
docs/adr/README.md:5:A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on. A builder's change that contradicts one against its brief is repaired like any other findi
docs/roadmap.md:31:- Goal: A `diagnose` skill: one command red on the exact symptom before any theory; the case shrunk; three to five ranked hypotheses that each name what would falsify it, shown to y
docs/figures/plan-loop.svg:91:<text x="860" y="101" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11.5" fill="#0f172a" font-weight="400" text-
docs/figures/gen_figures.py:636:            "Onto main, the checks there, the booking, the commit; the worktree is removed.",
README.md:44:/land <entry> <step>          onto main, checks on main, the booking, the commit
README.md:153:`land.sh` reads `worktree_root` and `ledger_root` from `.agents/plan.yaml`, and refuses with exit 64 when either is missing. In the `projects:` form it reads those of the project whose `
=== grep -rn -F -- '## Agents' skills docs README.md, hits outside the paths
```

- `docs/adr/0006-...:7` (Context: "The state file records a builder's agent id in `session_id` and no reviewer's or brief check's id") describes the tree when the decision was taken; the change does not make the record's reason false. `docs/adr/0006-...:11` is the decision the step carries out.
- `docs/dev/blind-comparison.md:13`, `:25`, `:27`, `:41`: the Rulings bullets copied for a comparison, and the judge's own `session_id` and served model; unrelated to the ledger's records. Not made false.
- `skills/ordo-help/SKILL.md:70`, `:74`, `:79`: a command list and the stop texts that say "the served model"; the stops still show the configured value, the served model and the Claude Code version. Not made false.
- `skills/grill/references/decision-form.md:3`, `:46`, `:65`, `:74`: a worked example whose Rulings gain bullets; an agent bullet is not a ruling and the example is unchanged. Not made false.
- `skills/roadmap/SKILL.md`, `skills/ordo-init/SKILL.md` and `skills/repo-setup/SKILL.md` ("the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file"): a quoted ruling is a bullet whose first line ends "(the user)", and an agent bullet never does. Not made false.
- `docs/adr/0005-...:16`, `skills/land/templates/land.sh`, `skills/diagnose/SKILL.md:182`, `skills/repo-setup/templates/shared-rules.md:11`, `skills/repo-setup/templates/docs/adr/README.md:5`, `skills/repo-setup/templates/docs/dev/change-standard.md:69`, `docs/adr/README.md:5`, `docs/roadmap.md:31`, `docs/figures/*`, `README.md:44` and `:153`: "booking" in the sense the glossary already gives, the `land.sh` booking data, or a ledger note; none states what the booking holds in a way the Agents bullets contradict. Not made false.
- `## Agents`: no hit outside the paths.

## Repair round 1

No git command of any kind was run in this round. The changed lines are quoted from `diff <the file before the round> <the file now>`; `docs/glossary.md` line 11 carries the same text as `skills/repo-setup/templates/plan-terms.md` line 6.

Rulings, each carried out:

1. The record of a reviewer stopped for another model. `skills/refute/SKILL.md` Steps 7 no longer holds the sentence "A reviewer stopped for another model is recorded the same way, with `stopped` in place of its usage." The rule is in Steps 1's stop bullet (line 53): a first-run reviewer is recorded as `(<agent id>, <served model>, stopped)` and a reviewer over round `<n>` as `over round <n>: <agent id>, <served model>, stopped`, after the records before it, written to disk in the main checkout and carried by the next resume-point commit. `skills/land/SKILL.md` Steps 9 booked a stopped first-run reviewer but did not say it books a stopped reviewer over a round; line 98 now reads "Each reviewer over a round, a stopped one included". Case reread, "A first reviewer served another model, stopped, then a second first-run reviewer": met. `skills/refute/SKILL.md:53` records the stopped one as `(<agent id>, <served model>, stopped)` and a record written later follows the records before it, so the second reviewer's `<path> (<agent id>, <served model>, ...)` of line 69 follows it; `skills/land/SKILL.md:97` books each first-run reviewer, a stopped one included, as `reviewer of step <n>`.
2. The writers of the Agents section. The sentence under `## Agents` in `skills/plan/templates/plan.md` (line 35) names `/land` at a step's booking and when it takes a step back out of main, `/grill` for its lookup agents, `/spec` for a brief-check agent stopped for another model, and `/plan` when it copies the bullets of a rulings file. The **Agents section** term adds `spec`, "Steps / The brief check" to its "Stated in", in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` alike.
3. The commit rule of a run over a round. `skills/refute/SKILL.md` "Steps / Over a repair round" 6 (line 85) records the run "after the records before it", written to disk and carried by the next resume-point commit as Steps 7 says; the form `over round <n>: ...` is unchanged.
4. The **dispatch entry** term's "Stated in": no change, as ruled.

Every changed line, before (`<`) and after (`>`):

```
### skills/refute/SKILL.md
53c53
<    - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used.
---
>    - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, nothing it wrote is used, and it is recorded under the dispatch block's `reviewer_report`, a first-run reviewer as `(<agent id>, <served model>, stopped)` and a reviewer over round `<n>` as `over round <n>: <agent id>, <served model>, stopped`, after the records before it, written to disk in the main checkout and carried by the next resume-point commit.
70d69
<    - A reviewer stopped for another model is recorded the same way, with `stopped` in place of its usage.
86c85
<    - It records the run in the same field, after the first record, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>`.
---
>    - It records the run in the same field, after the records before it, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>`, written to disk and carried by the next resume-point commit as Steps 7 says.
### skills/land/SKILL.md
98c98
<      - Each reviewer over a round: `reviewer of step <n> over round <r>`.
---
>      - Each reviewer over a round, a stopped one included: `reviewer of step <n> over round <r>`.
### skills/plan/templates/plan.md
35c35
< Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; `/land` writes a step's agents at its booking, and `/grill` writes its lookup agents.
---
> Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, and `/plan` copies the bullets of a rulings file.
### skills/repo-setup/templates/plan-terms.md
6c6
< - **Agents section**: the `## Agents` section of `plan.md`, and of a rulings file, one bullet per agent a plan skill started for the entry, `- <agent id>: <role>, <served model>`. Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, "Steps / Looking up a fact".
---
> - **Agents section**: the `## Agents` section of `plan.md`, and of a rulings file, one bullet per agent a plan skill started for the entry, `- <agent id>: <role>, <served model>`. Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, "Steps / Looking up a fact"; `spec`, "Steps / The brief check".
### docs/glossary.md
11c11
< - **Agents section**: the `## Agents` section of `plan.md`, and of a rulings file, one bullet per agent a plan skill started for the entry, `- <agent id>: <role>, <served model>`. Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, "Steps / Looking up a fact".
---
> - **Agents section**: the `## Agents` section of `plan.md`, and of a rulings file, one bullet per agent a plan skill started for the entry, `- <agent id>: <role>, <served model>`. Stated in: `plan`, `templates/plan.md` and Steps 2; `land`, Steps 6 and 9; `grill`, "Steps / Looking up a fact"; `spec`, "Steps / The brief check".
```

Verification again:

1. The verify list through the runner, `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit status 0, printed (verbatim):

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

2. `grep -c '## Agents'` over the four files of verification 2 prints 1, 4, 2 and 1; `grep -c '<agent id>, <served model>'` over the four files of verification 3 prints at least 1 for each (3, 1, 2 and 1); `grep -c 'builders_before'` over its three files prints 2, 1 and 1.
3. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` (the seventh runner command above).
4. The sorted `version:` lines of `skills/*/SKILL.md` are identical to those before the step (`diff` printed nothing).
5. `LC_ALL=C grep -n '[^ -~]'` over the five files changed in this round printed nothing.
6. Line references of the sections above that moved: the first-run reviewer's record is `skills/refute/SKILL.md:69`, the stopped-reviewer rule is line 53 (the former line 70 is gone), and the over-round record is line 85.
