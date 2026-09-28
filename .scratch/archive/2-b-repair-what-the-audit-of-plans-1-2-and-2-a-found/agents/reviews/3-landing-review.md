# Step 3: review of the fixes made at landing

A fresh read-only reviewer read the orchestrator's first pass of landing fixes. Usage: 85,655 tokens, 17 tool uses, 315 s (the runner's completion notification).

Review of the landing fixes for step 3 of plan 2.B (the unstaged `git diff` on top of the staged cherry-pick)

**Check results.** Both checks pass:
- `python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md` printed ten `ok:` lines, the last `ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md`, with exit=0.
- `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` ended with `ok: skills/spec/SKILL.md` and `verify: 12 commands passed`. A separate run gave `verify exit=0`.

**Scope of the fixes.** `git diff --stat` shows 8 files changed, 15 insertions and 13 deletions. Every hunk matches one of the claimed fixes, with one exception: `orchestrator-state.md:51`, `landing: not-started` changed to `landing: cherry-picking`. That line is the land skill's own state change, not a review fix.

**ordo-init against repo-setup: who stops when.** The two texts now agree.
- When the commit rule allows a commit under `/repo-setup`: ordo-init commits at its Steps 14, and repo-setup Steps 13 commits the other files.
- When it does not allow one: ordo-init Steps 14 goes on without stopping (line 78), and its Stops row applies only "when the skill runs alone" (line 98). repo-setup Steps 13 then names every file written, because none was committed at its Steps 9, and raises the one "No commit allowed" stop (repo-setup:125). repo-setup:128 ("The first six rows are stops: each waits on the user") is still true.

**Inventory rows.**
- `ordo-init.md:25` points at "What it reads 4" resolves to the repository-files item (SKILL.md:31). Old line 16 at `aa7cfe2` is that item.
- `:24` points at What it reads 2 (line 29) and `:23` points at What it reads 1 (line 28) still resolve.
- `:34` "Stops 2" is Several roadmaps and `:42` "Stops 4" is A failing command. The Stops row order did not change.
- `:61` Steps 10 and `:66` Steps 14 still hold their rules.
- No row names the "No commit allowed" row or What it reads 3.

## Findings

1. `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/3-report.md:309-313` and `:402`/`:405`.
   - The Spec 1 fix makes the report's "Repair round 1" section false:
     - Item 8 still says "`skills/spec/templates/brief.md:40` opens the report with the position line, then the open items" and quotes the old line 40.
     - "Files changed in the round" lists `skills/spec/templates/brief.md`.
   - With the unstaged fix, `git diff HEAD -- skills/spec/templates/brief.md` prints nothing, so step 3 now makes no net change to brief.md.
   - The new note at line 5 says "'Repair round 1' [describes] the step at the end of its rounds". That wording covers this, but the section is still not the end state that change-standard rule 7 asks for.
2. `3-report.md:5` (Proof 1). The note labels the stale sections but does not correct them. Judgment call 8, judgment call 3's quote, "Outside this step's paths" bullet 2 and the `/repo-setup` user-visible bullet still state what the round made false. Change-standard rule 7 ("The report states the end state only") is met only by the label.
3. The note's first pointer, "The fixes made at landing are in `plan.md` (the booking of step 3)", names text that does not exist yet.
   - `grep -n "^### " plan.md` shows booking sections for Step 1 and Step 2 only.
   - The `3-refuter.md` "Closed" section at line 249 also says Behaviour 2 is "in step 3's booking in `plan.md`".
   - Both hold only if the booking written at landing contains that before and after.
4. `skills/ordo-init/SKILL.md:30`: "or the user's answer at Steps 10 when it runs alone."
   - Steps 10 shows the question. The answer comes at the Steps 11 stop.
   - The Stops row "The draft" (line 93) is resumed by "The user's approval or correction" and does not name the commit answer.
   - So the item points at the step that asks the question, not the one where it is answered, and the stop that collects the answer does not say it collects it.
5. `skills/ordo-init/SKILL.md:78`: "except under `/repo-setup`, where the setup goes on and its own Steps 13 raises the one stop."
   - "its own" has to mean repo-setup's, but the sentence's subject is ordo-init.
   - docs/dev/skill-layout.md "Paths and names" says a part of another skill is named with its skill: "`repo-setup`'s Steps 13".
6. `skills/refute/SKILL.md:3`: "One round more is run when a verification command is left red or an item of the brief unbuilt, and the fix is too large for landing."
   - The sentence is 27 words, still over the prose standard E limit of about 20.
   - It is passive with an unnamed actor (E, passive voice).
   - "an item of the brief unbuilt" is elliptical.
   - The same rule in `plan-orchestration/SKILL.md:263` says "an acceptance item of the brief" (D, synonym cycling).
7. `skills/plan-help/SKILL.md:69`, the printed line: "The next unblocked step comes next. The booked step waits its turn in the queue, or your ruling when it is an open item."
   - As a line in a by-hand sequence, it does not say what the user types. The next thing is `/spec <entry> <step>` for the next unblocked step, and the line should name that command.
   - "comes next" repeats "next".
   - "waits ... your ruling" is a zeugma. "Waits its turn" works, but "waits your ruling" needs "for" or "on".
   - It is the only line in the block written as full sentences with capitals. The other lines use lowercase clauses joined by colons and semicolons.
8. `skills/land/SKILL.md:41` "KILL two seconds later" matches `utils/verify.sh:21`. No other skill text says "grace" for this sequence (`grep -n "grace\|KILL\|TERM"` over skills). No finding here, apart from Behaviour 1, which is booked at `orchestrator-state.md:79`.
9. Spec 1, `skills/spec/templates/brief.md:40`: the working-tree text equals HEAD and base `5eaec19` word for word. It matches change-standard rule 7 (`docs/dev/change-standard.md:19`), and it matches `plan-orchestration/SKILL.md:199` ("A builder's report keeps the shape of the repository's change standard"). No finding on the text. Its effect on the report is finding 1.

## Not checked

- Whether the booking the orchestrator writes into `plan.md` for step 3 will carry Behaviour 2's before and after. It is not written yet.
- The staged cherry-pick outside the fixed hunks (spec, plan-retro, roadmap, repo-setup, shared-rules.md and the other inventories) was not re-reviewed.
- The non-ASCII and spaced-dash scans were not rerun on the changed lines. I read them and they contain no dash or non-ASCII character.
- Whether question 5's default, "commit only when told", counts as "allows" at ordo-init Steps 14. Neither skill defines this.
