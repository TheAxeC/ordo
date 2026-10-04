# Step 2 brief check (on main at 97cbc5c)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/2.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

- Paths filter used for every grep below: `P='skills/plan/templates/plan.md|skills/plan/SKILL.md|skills/grill/SKILL.md|skills/refute/SKILL.md|skills/refute/templates/report.md|skills/spec/SKILL.md|skills/spec/templates/brief-check.md|skills/plan-orchestration/SKILL.md|skills/land/SKILL.md|skills/plan/templates/orchestrator-state.md|skills/repo-setup/templates/plan-terms.md|docs/glossary.md'`, then `grep -rn -- "<name>" skills docs README.md utils agents | grep -Ev "^($P):"`.
- `reviewer_report`, `brief_check`: one hit outside the paths, `docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11` (the Decision). Not made false: the brief puts the ids exactly where the Decision says.
- `session_id`: `docs/adr/0006-...md:7` (Context: "The state file records a builder's agent id in `session_id` and no reviewer's or brief check's id, and the dispatch entry is removed at landing"), `:11`, and `docs/dev/blind-comparison.md:27` (the CLI's own `session_id`, a different thing). The ADR's Context describes the tree when the decision was taken. The change makes it untrue of the tree after the step, but that is the record's context, not a rule, so it is not a defect. blind-comparison is unrelated.
- "served model": `skills/ordo-help/SKILL.md:74`, `:79` ("shows the configured value, the served model and the Claude Code version"), `docs/adr/0006-...md:11`, `docs/dev/blind-comparison.md:25`, `:41`. None is made false.
- "rulings file" and "Rulings": `skills/grill/references/decision-form.md:46` ("The Rulings, or the rulings file when no plan is open, gain two bullets"); the quoted-ruling readers `skills/roadmap/SKILL.md:43,44,53`, `skills/ordo-init/SKILL.md:36,37,46`, `skills/repo-setup/SKILL.md:37,38,47`; `README.md:16` (grill row: "It writes each answer as it settles into the plan's Rulings or the entry's rulings file, ..."); `docs/adr/0005-...md:16`; `docs/dev/blind-comparison.md:13`. None is made false. An agent bullet never ends "(the user)", so the quoted-ruling readers can never take it for a ruling, and decision-form.md shows ruling bullets only.
- `## Agents`, "Agents section": no hit anywhere on the tree.
- "booking": `skills/land/templates/land.sh:4,21,22,454,461,464,469` (the script's "=== booking ===" data), `skills/ordo-help/SKILL.md:70`, `skills/diagnose/SKILL.md:182`, `skills/repo-setup/templates/shared-rules.md:11`, `skills/repo-setup/templates/docs/adr/README.md:5`, `docs/adr/README.md:5`, `docs/figures/plan-loop.svg:91`, `docs/figures/gen_figures.py:636`, `README.md:44`. None is made false: each names the booking without listing what it holds.
- "agent id": `skills/session-retro/SKILL.md:155`, `skills/session-retro/templates/transcript_window.py:21,62`, `transcript_window.test.sh:9,13,601` (transcript file names), and `docs/adr/0006-...md:7,11`. None is made false.
- "lookup agent": `skills/plan/templates/plan.yaml:27`, `docs/figures/pipeline.svg:73`, `docs/figures/gen_figures.py:482`. None is made false.
- "tool uses", "completion notice", "Reviewer usage", "Agent usage", "backed-out": no hit outside the paths that describes the dispatch record (the `backed-out` hits in `skills/diagnose/SKILL.md:40,41,168,212` read the landing state only).
- Inside the paths, a sentence no item reaches: `skills/grill/SKILL.md:10`, the introduction: "It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR ... and one commit". `docs/dev/skill-layout.md`, "Sections, in order", row 1, says the introduction states what the skill leaves behind. After item 3, grill also leaves one Agents bullet per lookup agent, so the introduction is incomplete. The same holds for grill's frontmatter `description` (line 3) and, outside the paths, `README.md:16`, which is incomplete but not false.
- Inside the paths, the term **dispatch entry** (`plan-terms.md:32`, `glossary.md:37`) has "Stated in: `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7 and "Launching a builder"; `land`, Steps 2 and 6". After items 4 and 5, the form of `reviewer_report` is stated in `refute` Steps 7 and "Steps / Over a repair round" 6, and the form of `brief_check` in `spec` "Steps / The brief check" 5. Item 9 changes the term's text but does not add these places to its "Stated in".
- The term **plan** (`plan-terms.md:63`, `glossary.md:68`): "`plan.md` holds the goal, the gate, the step list and the rulings". Not false, since it has no "only", but it does not name the Agents section. No change is needed.

Findings: (1) grill's introduction (`skills/grill/SKILL.md:10`) and its `description` do not name the Agents bullets grill will leave behind, and no item changes them; README.md:16 is outside the paths and incomplete. (2) Item 9 leaves **dispatch entry**'s "Stated in" without `refute` Steps 7 and "Steps / Over a repair round" 6, and `spec` "Steps / The brief check" 5.

## 2. The step line

- "Every agent's id recorded with its role (D5, ADR 0006)": items 1 to 9 together.
- "`reviewer_report` ... gain the agent id beside the served model": items 4, 6 and 8.
- "`brief_check` ... gain the agent id beside the served model": items 5 and 8.
- "each `grill` lookup gain the agent id beside the served model": item 3, with items 1, 2 and 9 giving the lookups their place.
- "`/land`'s booking copies the ids into `plan.md`": item 7, with item 1 (the section) and item 9 (**booking** amended to include the copy).
- "in `refute`, `spec`, `grill`, `land`, `plan-orchestration` and the state file template": items 4, 5, 3, 7, 6 and 8. `plan`, the plan template, the report templates and the terms are added, with the reasons given in Decision 5 and in the change standard's rule 14.
- "check: each changed text read in place": verification 6.
- "and step 3's landing booking carries its reviewer's and brief check's ids": this is a plan check run at step 3's landing, so no item of this brief can serve it. The brief's last paragraph of "What to build" has the orchestrator write this plan's Agents section at step 2's landing. Under item 9's amended **booking**, the check reads the Agents bullets that step 3's `/land` appends.

Findings: none.

## 3. Premises

- `grep -ln 'ordo-<\|effort agent' skills/*/SKILL.md` printed `skills/refute/SKILL.md`, `skills/grill/SKILL.md`, `skills/spec/SKILL.md`, `skills/ordo-help/SKILL.md`, `skills/plan-orchestration/SKILL.md`. This matches. ordo-help's hits are the refusal lines 78 and 80. `grep -n -i agent` over diagnose, plan-retro, session-retro, roadmap, ordo-init and repo-setup shows that none of them starts an agent: the diagnose hits are `.agents/` and `agents/briefs` paths.
- `plan-orchestration` lines 63, 70, 73 and 235 read as the brief quotes them. `sed -n` shows 63 "The moment it is launched, write its agent id into the dispatch block under `session_id`." and 235 "as `session_id: <agent id> (<served model>)`". This matches.
- `refute` lines 52, 67, 69 and 85, `plan-orchestration` lines 97 and 112, and `refute/templates/report.md` lines 42 and 63 (`Reviewer usage: <tokens>, <tool uses>, <minutes>.`) all match as quoted.
- `spec` lines 250, 262 and 275 and `spec/templates/brief-check.md:51` (`Agent usage: <served model>, <tokens>, <tool uses>, <minutes>.`) all match.
- `grill` lines 193-195 match. `grep -n 'lookup' skills/grill/SKILL.md` printed lines 128, 130, 138, 140-142, 144, 183, 184, 187, 188, 194, 196, 205 and 308, and none of them writes the agent down. This matches.
- `grill` line 231 and `plan` lines 41, 68, 82 (the "done when" of Steps 2) and 112 all match. Line 112's "whose bullet lines Steps 2 has already copied" is there.
- `grill` Steps 10: the brief says "lines 165-172", but the item runs from 165 to 179. The list is lines 166-173, the commit is line 175 ("commit the files written by explicit path list in one commit") and `git status --short` is line 177. The text quoted is right and the range is short.
- `land` line 92 and lines 63-84 (Steps 6, with the commit at line 82) match, and so does `spec` "Steps / A step taken back out of main" 5 (line 186, "Remove the entry from the dispatch block.").
- `skills/plan/templates/plan.md`: line 29 `## Rulings (<date>)`, line 31 the placeholder bullet, line 33 `## Blocked, and by what`. This matches.
- `skills/plan/templates/orchestrator-state.md:34` matches the brief's quote.
- Term line numbers: `grep -n '^- \*\*' skills/repo-setup/templates/plan-terms.md` gives booking at 9, dispatch entry at 32 and rulings file at 94, and the glossary has them at 14, 37 and 99. This matches. The block is alphabetical ignoring case, so **Agents section** goes between **ADR** (line 5) and **authority** (line 6).
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- `grep -n 'version:' skills/*/SKILL.md` gives grill "1.2.0" and plan "1.10.1", and plan step 12 is the step that raises versions (plan.md line 39). This matches.
- `ls docs/adr` lists 0001 to 0008, README.md and template.md. This matches.
- Decision 2's five agents: `git show 8837b0b:.scratch/2-e-a-self-rule/orchestrator-state.md` shows `session_id: a15eaa0740335c7a3 (ordo-high, claude-sonnet-5-5 at the launch, from its transcript)`, `brief_check: ... (ordo-high, agent a392a12ca146ff975, claude-opus-5-5, ...)` and `reviewer_report: ... (ordo-high, agent ae9f3748642ce9c1e, claude-opus-5-5, ...)`. `grep -o '"model":"[^"]*"' agent-<id>.jsonl | sort | uniq -c` gives 87 `claude-sonnet-5-5` for a15eaa0740335c7a3 and only `claude-opus-5-5` for a392a12ca146ff975, ae9f3748642ce9c1e, a96acd76fe31399ad and a508428b7705f46eb. The meta.json description of a508428b7705f46eb is "Lookup: agent autonomy modes". This matches.

Findings: (1) grill Steps 10 is cited as lines 165-172, but it runs to line 179, and the commit sentence item 3 asks the builder to check is line 175.

## 4. Cases and checks

- The plan template case, both rulings-file cases, the four `/grill` cases, the `/refute` case, the brief-check case, both `/land` cases, the back-out case and both preserved cases are consistent with `docs/dev/change-standard.md` and the standards.
- Verification 3, `grep -n 'agent id' ...`, run on the unchanged tree, already prints `skills/plan-orchestration/SKILL.md:63,65,99,169,180,234,235,240` and `skills/plan/templates/orchestrator-state.md:34`. For items 6 and 8 it therefore shows nothing about the change. Under the rules file, "Scripts compute facts; judgment is read", it proves only that some line holds the words. The brief words it as "prints the changed lines of items 4, 5, 6 and 8", which a reader could take as proof. A grep for the new form, such as `grep -n '<agent id>, <served model>'`, fails on the unchanged tree and would prove the change.
- Rule 16 of the rules file ("A write verifies its own result"): item 3 gives grill's write a read-back ("The item is done when the file, read back, holds the bullet"). Item 7's two writes of Agents bullets (land Steps 9, and Steps 6 at a back-out) and item 2's copy of the agent bullets in `/plan` Steps 2 give none.
- Item 5 tells the builder to write `brief_check` "in the form Item 4 of this brief gives for `reviewer_report`". A skill's text cannot cite a brief, so the form must be written out in `spec` or pointed at in `refute` Steps 7. The brief does not say which.

Findings: (1) Verification 3 passes on the unchanged tree for items 6 and 8. (2) Items 7 and 2 give the Agents writes no read-back, where rule 16 asks for one. (3) Item 5's pointer to "Item 4 of this brief" has no stated wording for the skill.

## 5. The question

- The step line's check ("each changed text read in place, and step 3's landing booking carries its reviewer's and brief check's ids"): yes, in part. Step 3's landing runs only the `reviewer_report`, `brief_check`, `session_id` and `/land` path. The grill lookups and `/plan`'s carry of rulings-file agents are only read in place until plan step 9 runs `/grill` and `/plan` on a scratch roadmap, and step 9's check does not ask for the Agents bullets. So the check can pass while grill's recording has never run.
- Case, plan template: no, the section and its form are what the later writers and the script read.
- Case, rulings file with `## Agents`: no, it needs the new Steps 2 rule on the unchanged tree. On the unchanged tree `/plan` copies the agent bullet into Rulings.
- Case, rulings file without `## Agents`: no for the new empty Agents section. Its first half keeps current behaviour.
- The three `/grill` cases (a lookup with a plan open, a lookup before any answer, a lookup served another model): no, each needs grill to write the bullet.
- Case, `/refute` first run and the run over a round: no, the id must be in the record.
- Case, brief check: no for a brief check that ran. For one stopped for another model, see item 5 below.
- Case, `/land` with four agents: no, it names each role.
- Case, `/land` inline: no.
- Case, back-out: no for the back-out itself. It does not cover the later landing, see item 7 below.
- Preserved cases: yes, by design. They pass on the unchanged tree and guard behaviour; they deliver none of the goal.
- Item 1: no in combination with items 2, 3 and 7. Alone it only gives the place.
- Item 2: no.
- Item 3: no.
- Item 4: no for a first run and a run over a round. A first reviewer stopped for another model and replaced after the ruling gives two first-run records in `reviewer_report`. Item 7 maps only "the first reviewer" to `reviewer of step <n>`, so the role of the second one is undefined.
- Item 5: yes. The brief says a brief-check agent stopped for another model "is recorded with `stopped` in place of its usage" under `brief_check`. But the stop happens inside `/spec` before Steps 9, and "Steps / A stop" 2 says "No brief, no worktree and no dispatch block exist for the stopped step". No `brief_check` field exists to write to, so the agent is recorded nowhere and never reaches `/land`. This falls short of Decision 3 and of ADR 0006's "Every agent a plan skill starts is recorded".
- Item 6: yes. It leaves the builder's record as `session_id` only. A builder stopped for another model ("Launching a builder", `plan-orchestration` line 237) and then relaunched after the ruling, or a dead builder replaced by "a fresh continuation builder" ("Resuming, and handing the plan over", line 182), overwrites `session_id`. The first builder's id is then lost before `/land` copies it.
- Item 7: yes for a step taken back out of main and landed again. The brief-check report stays in the ledger, so the step is not checked again (`spec` Steps 5, and "Steps / The brief check" 4). The new dispatch entry's `brief_check` is filled from that report's usage line ("Steps / The brief check" 5), which names the same agent. `/land` then appends `brief check of step <n>` for that agent a second time, after the back-out already wrote it, and the cost script counts that role twice.
- Item 8: no.
- Item 9: no by reading. The sync check only compares the two copies.
- The closing sentence of "What to build" (this plan's Agents section "with step 1's four agents and step 2's"): yes. It leaves out the three lookup agents of 2.E.A's own `/grill`. The subagent meta.json files show three `ordo-high` lookups: a508428b7705f46eb "Lookup: agent autonomy modes", af464f4a770b333a6 "Lookup: cost from transcripts" and aea0212a318abe908 "Lookup: decision-log practice". All three started at 2026-09-30T21:50:03Z, before `fdf1f09 2026-10-01 00:22:51 +0200 Settle the design decisions of 2.E.A`. Without them, the gate's cost figure for plan 2.E.A has no grill-lookup role.

Findings: (1) The step line's check can pass with grill's recording never run. (2) Item 5: a brief-check agent stopped for another model has no dispatch entry to be recorded in. (3) Item 6: a relaunched builder or a continuation builder overwrites `session_id`. (4) Item 7: a step landed again after a back-out books its brief-check agent twice, and a replacement first reviewer has no role. (5) This plan's Agents section as briefed leaves out 2.E.A's three grill lookups.

## 6. Implied inputs

- This is a text step, not a code step. The inputs below are situations the described behaviour implies, and the brief gives none of them an expected result.
- A builder served another model, stopped and relaunched after the ruling (`plan-orchestration` "Launching a builder"). Expected: both agents recorded, the stopped one as `builder of step <n>` marked stopped. The brief is silent.
- A dead builder and its continuation builder ("Resuming, and handing the plan over"). Expected: both recorded as `builder of step <n>`. The brief is silent.
- A brief-check agent served another model. Expected: recorded where it survives the stop, for example `/spec` writing its bullet to `plan.md`'s Agents section among the ledger files the stop commits. The brief's `brief_check` place does not exist at that moment.
- A first reviewer served another model, then a second first-run reviewer after the ruling. Expected: its form in `reviewer_report` and its role at `/land`. The brief gives neither.
- A step taken back out of main and landed again, with its brief-check report reused. Expected: one bullet per agent, with no duplicate. The brief gives none.
- `/plan` refusing at "The plan exists" while the entry's rulings file holds Agents bullets. The Stops row shows the file "for the user to remove", so its agent bullets would be lost. No expected result is given.
- Agents started before this step lands and outside plan 2.E (which plan step 5 covers). These are the entry-3 rulings file `.scratch/rulings/3-the-writing-base.md`, whose lookups ran on 2026-09-30, and the open plans 2.F, 2.G and 2.H, which have 2, 2 and 3 steps ticked (`grep -c '^- ✅'`, whose pattern holds the checkmark `plan.md` uses as its status mark). Their next landings will create an Agents section without these agents. The brief does not say whether they are left out or written in.
- A plan whose bookings go to a part file (`land` Steps 9, "or the part file the plan names"). Item 7 says the Agents bullets go to `plan.md`'s section, which covers it by its wording.
- A grill lookup made by the session's own reads because the effort checks failed ("Steps / Looking up a fact" 1). No agent starts, so no bullet is written, which follows from item 3's wording.

Findings: every item above except the last two has no expected result in the brief: the relaunched builder, the continuation builder, the stopped brief-check agent, the replacement first reviewer, the reused brief-check agent after a back-out, the rulings file at "The plan exists", and the agents started before the step lands.

## 7. ADRs

- 0001, 0002, 0003: they govern the writing skills and `/writing`'s review agent. `/writing` is not a plan skill, and no `skills/writing/` exists (`ls skills`). They do not touch the step.
- 0004 ("A decision taken under self-rule ends "(self-rule)" until the user agrees"): its decision governs how `/spec`, `/plan` and `/grill` read a bullet's ending. Item 2 sorts rulings-file bullets by the `## Agents` heading, not by their ending, so the step does not change what 0004 decides. It does not touch the step.
- 0005 (the choices file): it does not touch the step.
- 0006 ("The ledger records every agent's id with its role"): it touches the step and the brief names it. The step is under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `session_id`, each reviewer in `reviewer_report`, the brief check in `brief_check`, and each `grill` lookup where `grill` records it. The landing booking copies the ids into `plan.md`." Nothing in the brief contradicts these words. The gaps in section 5, items 5, 6 and 7, leave agents a plan skill starts unrecorded, so the brief falls short of "Every agent".
- 0007 ("The run over a repair round runs on its own reviewer model"): it touches the step through the record of the run over a round, and the brief names it. The step is under "The served-model check applies to it as to every agent". Item 4 records that run's served model and agent id, which agrees with it.
- 0008 (the price table): it governs the cost script, which this step does not build. It does not touch the step.

Findings: none that contradict an ADR, and none that the brief fails to name. Items 5, 6 and 7 fall short of 0006's "Every agent a plan skill starts is recorded", as section 5 says.

## Declined to judge

- Decision 1, one `## Agents` section rather than a line in each booking, is a choice the brief takes and the orchestrator may reverse. It is not a defect a read can settle.
- Whether the agents that `academic-paper` starts for a step count as agents "a plan skill starts" is a question of the scope of ADR 0006, which is the user's to rule. The brief gives an `academic-paper` builder no bullet, which follows the ADR's words.
- Whether this plan's own Agents section and the backfill of the other open plans belong to step 2's landing or to plan step 5 is the orchestrator's call.

Agent usage: abe95054772aeb0bc, claude-opus-5-5 (ordo-high), 217811 tokens, 40 tool uses, 7.8 minutes.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names 1 (grill's introduction and `description`, `README.md:16`): item 3 gains a bullet changing grill's introduction (line 10) and `description` (line 3); item 10 changes `README.md:16`, added to "Paths this step writes" as `README.md` lines 16-16; Decision 5 gives the reason.
- Names 2 (**dispatch entry**'s "Stated in"): item 9's **dispatch entry** bullet adds `refute` Steps 7 and "Steps / Over a repair round" 6 and `spec` "Steps / The brief check" 5.
- Premises 1 (grill Steps 10's range): item 3 cites lines 165-179, the list at 166-173 and the commit sentence at line 175.
- Cases and checks 1 (verification 3 passes on the unchanged tree): verification 3 is now `grep -n '<agent id>, <served model>'` over the four files of items 4 and 5, and `grep -n 'builders_before'` over the three files that name the new key; both print nothing on the unchanged tree and the report quotes both runs; items 6 and 8 are read under verification 6.
- Cases and checks 2 (no read-back for the Agents writes of `/land` and `/plan`): item 7's Steps 9 bullet ends with the read-back (each agent of the entry has exactly one bullet), its Steps 6 bullet writes and reads back before the commit, and item 2's "done when" bullet says the draft, read back, holds every agent bullet of the rulings file once.
- Cases and checks 3 (item 5's pointer to the brief): item 5 writes the form out for the skill.
- The question 1 (the step line's check can pass with grill's recording never run): booked in `plan.md` under "Blocked, and by what": step 9's `/grill` and `/plan` runs are also read for the Agents bullets. The step line's check itself is the approved one and is left as it is.
- The question 2 and Implied inputs (the stopped brief-check agent): item 5 gains a bullet: `/spec` writes the stopped agent's bullet straight into `plan.md`'s Agents section, reads it back, and the stop's commit carries it; a case added.
- The question 3 and Implied inputs (a relaunched or continuation builder overwrites `session_id`): item 6 gains the `builders_before` key for each replaced builder, marked `stopped` or `dead`; item 7 books each as `builder of step <n>`; Decision 6 gives the reason; two cases added.
- The question 4 and Implied inputs (a re-landing books the brief-check agent twice; a replacement first reviewer has no role): item 7 skips an agent whose id already has a bullet, and books each first-run reviewer, a stopped one included, as `reviewer of step <n>`; the back-out case and a replacement-reviewer case extended or added.
- The question 5 (this plan's Agents section leaves out 2.E.A's three grill lookups): the closing paragraph of "What to build" names a508428b7705f46eb, af464f4a770b333a6 and aea0212a318abe908 beside step 1's and step 2's agents.
- Implied inputs, "The plan exists" with Agents bullets in the rulings file: item 2 changes that Stops row to name the Agents bullets for the user to copy into the open plan's Agents section before removing the file; a case added.
- Implied inputs, agents started before the step lands in other plans: Decision 7; booked in `plan.md` under "Blocked, and by what" for plan step 5, which writes the lists for the open plans 2.F, 2.G and 2.H and for entry 3's `/grill` lookups, as ADR 0006's consequence says of a plan run before the change.
