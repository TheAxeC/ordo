# Step 14c brief check (on main at 1084a63)

This is the brief-check report for `agents/briefs/14c.md`, the uncommitted file on disk. I read the brief, its input, `plan.md` (Goal, step line 14c, the Rulings), the rules file, the three standards, `skills/grill/SKILL.md` whole, the 14a refuter report's "Repair round 1, refuted" Behaviour 3, the archived plans, the ADRs and the tree at 1084a63. I changed nothing.

## 1. Names

- **The term "carried ruling".** `git grep -n -i 'carried ruling' -- . ':!.scratch'` finds hits only in three files:
  - `docs/glossary.md:19`
  - `skills/repo-setup/templates/plan-terms.md:14`
  - `skills/grill/SKILL.md` lines 51-54, 90-100, 108, 133, 151, 217, 219, 286, 309 and 311.
  - All three files are in "Paths this step writes". There is no hit outside the paths. The hits inside `grill` that the new lines interact with (50, 96, 98, 99, 133, 218) are covered under 4 and 5.
- **The version "1.1.0".** `git grep -n '1\.1\.0' -- . ':!.scratch'` finds `README.md:164` (`utils/pin.sh v1.1.0`, the pin example, which the change does not make false) and `skills/grill/SKILL.md:5`.
- **The words "set aside", "thrown out" and "is redone".** `git grep -n -i -E 'set aside|sets aside|thrown out|is redone' -- . ':!.scratch'` finds only `skills/plan-retro/SKILL.md:57,70,72`. Those lines use "set aside" for findings, in another sense, and the change does not make them false. Neither the glossary nor `plan-terms.md` defines "set aside". `grep -n -i 'set aside\|redone' skills/grill/SKILL.md` exits 1.
- **References to "What it reads" 6.** `git grep -n 'What it reads" 6' -- . ':!.scratch'`: outside `grill`, the hits in `plan`, `repo-setup` and `roadmap` refer to each skill's own item 6. None refers to `grill`.
- **Mentions of archiving.** `git grep -n -i archiv` over the glossary, `plan-terms.md`, `ordo-help`, `plan` and `README.md` finds `plan/SKILL.md:80` ("the ledger folder moved to `<archive_root>/`") and the "closing step" term. The change makes neither false.

Findings: none.

## 2. The step line

- "`grill`, "What it reads" 6": served by item 1.
- "an archived plan of the entry that a ruling of the user sets aside ... carries no ruling, and its bullets settle nothing": served by item 1, new line 1.
- "(a bullet ending "(the user)" that says the entry is redone or that plan is set aside, judged by reading)": item 1, new line 2, serves it only in part (finding 1).
- "the **carried ruling** term in `plan-terms.md` and `docs/glossary.md` says the same": served by items 2 and 3.
- "check: the changed text read in place, and a reading of `/grill` on an entry whose archived plan a ruling sets aside, which asks the old plan's decisions again": served by Verify 2, 3 and 6, and case K1.

Findings:
1. The step line defines the set-aside ruling as "a bullet ending "(the user)"". New line 2 does not carry that form, and new line 1 says only "a ruling of the user", which `grill` does not define. The 2.E plan's own Rulings hold bullets without "(the user)", such as "Step 8, a test of preserved behaviour (2026-09-30, decided by the orchestrator overnight ...)", and a reader could take such a bullet as a set-aside ruling. Line 2 needs "a bullet whose first line ends with "(the user)", with or without a full stop after it", as lines 50 and 52 write it.
2. The step line says "that plan is set aside": one particular plan. Line 2 has "the plan", and "the entry is redone" with nothing that ties the ruling to one plan. This is the cause of finding 5.2.

## 3. Premises

- The ruling and the step line.
  - `grep -n '^- Step 14a, an archived plan' .scratch/2-e-grill/plan.md` prints `132:- Step 14a, an archived plan the entry has since set aside (2026-09-30): Axel ruled (b). ...`
  - `grep -n '^- 14c' .scratch/2-e-grill/plan.md` prints line 50.
  - The ruling matches the brief's summary. It also says "so the user's rulings stay in force until the user ends them", which the brief leaves out. That sentence bears on finding 5.5.
- Behaviour 3 of the 14a refuter report's "Repair round 1, refuted": it matches the brief. Its option (b) is "a ruling that sets an archived plan of the entry aside makes that plan's bullets settle nothing".
- `sed -n '50,53p' skills/grill/SKILL.md` prints the four lines exactly as the brief quotes them.
- The term.
  - `grep -n 'carried ruling' skills/repo-setup/templates/plan-terms.md docs/glossary.md` prints lines 14 and 19.
  - `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` and exits 0.
  - The block runs from `docs/glossary.md:5` (begin marker) to `:126` (end marker), so the range "lines 5-125" covers the change at line 19.
- Plan 3's copy.
  - `git show 6c41c02^:.scratch/3-the-writing-base/plan.md | cmp - <the input copy> && echo SAME` prints `SAME`.
  - 6c41c02 is "Land step 1 of plan 2.C, /writing removed".
  - The copy has `## Rulings (2026-09-28)` at line 29, and Question 1 at line 32 as quoted.
- The 2.C ruling: `grep -n 'The review of Ordo' .scratch/archive/2-c-*/plan.md` prints line 30 as quoted. Both it and plan 3's bullets are dated 2026-09-28.
- The ADRs: `ls docs/adr` prints 0001 to 0003, `README.md` and `template.md`.
- One fact not in the brief: `git ls-tree -d --name-only HEAD .scratch/ .scratch/archive/ | grep -E '/3-'` prints nothing. Entry 3 has no plan folder, open or archived, and `.scratch/rulings/3-the-writing-base.md` (D1 to D24) is its rulings file.

Findings:
1. The brief says plan 3's Rulings hold "(the user)" bullets "such as Question 1". It leaves out that the same section holds its own set-aside ruling:
   - `3-the-writing-base-plan.md:45`: "- Open item J and the review of Ordo (2026-09-28): the user rules: Ordo is fixed, not reset; plan 3 stops at step 5, and everything of `/writing` is thrown out rather than repaired; roadmap entry 3 is redone from its sources after a new entry ... (the user)."
   - `:46`: "- The fix of Ordo, decisions B, C and D (2026-09-28): B (a), plan 3's ledger folder is deleted from the tree, not archived; ... (the user)."
   - The command `grep -n '(the user)' .scratch/2-e-grill/agents/briefs/14c-input/3-the-writing-base-plan.md` prints both lines. This fact decides K1 and K2 (see 4).

## 4. Cases and checks

- **K1.** Its own input breaks the rules file's rule 19 ("A change leaves no two statements that contradict each other").
  - Plan 3's line 45 is a set-aside ruling that stands inside the plan it sets aside.
  - New line 1 says that plan "carries no ruling, and its bullets settle nothing". New line 3 says "The ruling that sets the plan aside is itself a carried ruling". Both cannot hold for line 45.
  - K1's expected result "each decision of the tree they would have settled is asked" also conflicts with `grill` Steps 3 ("A decision that a line of the Rulings or the rulings file settles ... is marked settled and is not asked again") on a tree that holds `.scratch/rulings/3-the-writing-base.md`. For example, D3 settles where the prose standard lives, which plan 3's Question 1 would have settled. The expected result should read "is asked, unless the entry's Rulings or rulings file settles it".
- **K2.** Its expected result is wrong under the brief's own rule. Without the 2.C ruling, plan 3 still holds line 45 ("roadmap entry 3 is redone"). By new lines 1 and 2, plan 3 then sets itself aside, and its bullets are not carried. As written, K2 is not the control it is meant to be. A control input needs lines 45 and 46 removed from the copy, or K2 should state the self-set-aside result.
- **K3.** Consistent. `grep -c '(the user)\.\?$' .scratch/archive/2-d-*/plan.md` prints 8, and all 8 are the bullets of `## Rulings` (lines 35 to 42).
- **K4.** Consistent. `sed -n 98p .scratch/archive/2-b-*/plan.md` prints the quoted line. It names "entry 3", so line 50 already makes it a carried ruling.
- **K5.** Consistent with the ruling's "judged by reading". "Whatever the dates" causes finding 5.2.
- **K6.** Consistent.
- **The new text against the standards:**
  - **Scope.** New line 1 sits at seven spaces under line 52, so it limits only line 52's reading. Line 50 still reads "every other section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, an archived plan's included" for bullets that name the entry. In K1, plan 3's line 45 names "roadmap entry 3", so it is still carried through line 50. The new term's first clause ("of another plan's Rulings ... that names the entry") has no qualifier either. The term and line 50 therefore carry a bullet of a set-aside plan, while line 1 says that plan carries no ruling. This breaks rule 19. Fix: put the set-aside lines at five spaces (siblings of 51 to 54), say they apply to line 50's reading as well, and add the same qualifier to the term's first clause.
  - **New line 3.** It calls every set-aside ruling "a carried ruling". A set-aside ruling can stand in the entry's own Rulings or rulings file, for example a D<n> of a later interview that says the entry is redone, and such a bullet is not a carried ruling by the glossary's definition ("of another plan's Rulings or of another rulings file"). Line 3 needs "when it stands outside the entry's Rulings and rulings file". This follows `docs/dev/skill-layout.md` "Writing for an agent": a glossary term is used only in the sense the glossary defines.
  - **New line 2 against the prose standard.** It is one sentence of 44 words (`wc -w`), against "Sentence shapes" (sentence length). It joins two clauses with a semicolon, against "Punctuation". "this is judged by reading" is passive with a relevant actor (the skill), against "Sentence shapes" (passive voice). "the dates of the two" does not say which two dates: the ruling's, and whose else, given that a plan has no single date.

Findings:
1. K1 is inconsistent with rule 19 on its own input (line 45 inside plan 3), and its expected result conflicts with `grill` Steps 3 on a tree that holds the entry's rulings file.
2. K2's expected result is wrong under the brief's own rule (plan 3's line 45 sets plan 3 aside).
3. New line 1's scope leaves line 50 and the term's first clause carrying bullets of a set-aside plan (rule 19).
4. New line 3 calls a set-aside ruling in the entry's own Rulings or rulings file a "carried ruling" (skill layout, "Writing for an agent").
5. New line 2 breaks the prose standard on sentence length, semicolon and passive voice, and "the dates of the two" is unclear.

## 5. The question

The goal this step delivers: `grill` does not treat as settled the rulings of an archived plan that a ruling of the user sets aside, and keeps treating as settled those of an archived plan not set aside.

- **K1: yes, it could pass without the goal.** A reading can pass on the 2.C ruling alone. It never meets the in-plan ruling at line 45, carried copies, a reversal, or a part set-aside (items 5.3 to 5.7).
- **K2: yes.** It passes only when line 45 is overlooked.
- **K3: yes, for the second half of the goal.** No ruling anywhere says 2.D is redone, so K3 passes whatever the text does to a plan of an entry that does have a set-aside ruling somewhere.
- **K4: no.** It tests the boundary of what counts as a set-aside ruling.
- **K5: no** for the same-date pair, but see 5.2.
- **K6.** A fact check (the block equals the template). It checks no part of the goal and could pass without it, as expected of a sync check.
- **The step line's check:** yes, for the second half of the goal, for the same reason as K3.
- **Item 1's checks (Verify 2, 3, 4):** they check form only, so they could pass without the goal. The goal rests on Verify 6.
- **Items 2 and 3's check (Verify 5):** equality only. **Item 4:** not a goal check.

Findings:
1. Nothing tests the second half of the goal where it can fail. See 5.2.
2. **The redo plan is set aside by the ruling that ordered the redo.**
   - On this tree, entry 3 has no archived plan (see 3). The next archived plan of entry 3 will be the redo plan: at its closing its folder moves to `<archive_root>/` (`plan/SKILL.md:80`), and its title "3. The writing base" matches line 52.
   - The 2.C ruling ("roadmap entry 3 is redone from its sources", carried through line 50 because it names entry 3) still says that the entry is redone.
   - New line 2 ("this is judged by reading, whatever the dates of the two") makes it set aside every archived plan of entry 3, the redo plan included. Every later `/grill 3` would then drop the redo's rulings.
   - The ruling says "sets that archived plan aside", one plan. The text needs to tie the set-aside ruling to the plan it names or the plan that stood when it was given, never to a plan of the entry opened after it. It also needs a case (K7): the redo plan archived beside the 2.C ruling keeps its rulings carried.
   - Decision 2 of the brief ("Dates do not decide") is the cause. A shared date in one pair does not show that dates never decide. Dates can order two rulings when they differ, with reading only when they are equal, or the ruling's naming of the plan can decide.
3. **A set-aside ruling inside the plan it sets aside** (the real input, plan 3 line 45). New lines 1 and 3 contradict each other (4.1). The text needs to say which holds, for example that such a ruling is the one bullet of that plan still carried, as Decision 3 intends. A case is needed.
4. **A set-aside ruling that a later ruling reverses.**
   - Steps 3 line 96 makes a replaced carried ruling "settle nothing". New line 2, however, reads what a ruling "says", and a replaced ruling still says the entry is redone. After the user reverses the set-aside, the old plan stays set aside.
   - Ruling 14a says "the user's rulings stay in force until the user ends them", so a reversal should bring them back.
   - The text needs "A ruling that a later ruling names as the one it replaces sets no plan aside" and a case.
5. **A plan set aside only in part.**
   - New line 2 names only words for a whole plan ("set aside, thrown out or stopped for the entry to be done again"). A ruling that throws out named bullets or steps of an archived plan, for example "plan 3's Question 1 is set aside", has no rule. Line 96 does not reach it, because it does not name the bullet "as the one it replaces".
   - A reader then either carries the thrown-out bullets or applies line 1 to the whole plan.
   - The text needs to say which, and a case is needed. Whether a part set-aside is in the scope of ruling 14a (b) may be the user's call (see "Declined to judge").
6. **"Settle nothing" and the "replaces" and "clash" rules of Steps 3.**
   - The clash rule (line 99) speaks only of carried rulings, so "carries no ruling" covers it.
   - Lines 96 and 98 speak of "a later ruling", not of a carried one. A bullet of a set-aside plan that names another ruling as the one it replaces would still make that ruling settle nothing (96), or replace the carried rulings on the same decision (98).
   - New line 1 should say that a set-aside plan's bullets settle nothing and replace nothing, and a case is needed.
7. **Carried copies already in the entry's file.**
   - An earlier `/grill` session writes each carried bullet into the entry's Rulings or rulings file as "carried from `<path>:<line>`" ("Steps / Writing what settled" 1). After a later set-aside, those copies still settle their decisions through Steps 3 ("A decision that a line of the Rulings or the rulings file settles ... is not asked again", and line 218), and `/plan` copies them on into the next plan.
   - The set-aside does not reach them, so the old plan's rulings are still treated as settled.
   - The text needs a line (a bullet of the entry's file carried from a set-aside plan settles nothing) and a case.
8. **Decision 3's reason does not hold.**
   - Decision 3 of the brief says the set-aside ruling "is quoted in the first round like any other, and the user sees why the old plan's rulings are asked again". Steps 6 line 133 lists only "each decision a carried ruling settles", and Steps 10 lists only decisions. K1 says the 2.C ruling "settles no design decision", so it is never shown.
   - Either a line in Steps 6 names each set-aside archived plan with its ruling quoted and its `path:line`, or Decision 3's reason is dropped.

## 6. Implied inputs

Not a code step: the brief says "This is a text step ... It has no test, since no script changes", and the paths are `SKILL.md`, `plan-terms.md` and the glossary. The text inputs the rule implies are listed under 5.2 to 5.7.

Findings: none.

## 7. ADRs

- 0001, the writing base reads the prose standard where it is (proposed, in force): it governs `/writing` and the prose standard, and does not touch `grill`'s reading of rulings.
- 0002, the prose standard holds over the academic sources (proposed, in force): it does not touch the step.
- 0003, a fresh read-only agent reviews a draft (proposed, in force): it does not touch the step.
- No record says it is superseded (`cat docs/adr/0*.md`, Status lines). The brief's "What is on the tree" names all three and says none touches the step, which holds.

Findings: none.

## Declined to judge

- Whether the bullets of a set-aside plan that name another entry stay carried for that entry. Plan 3's Question 2 names "entries 4 and 5", and line 50 would carry it for `/grill 4`. Ruling 14a speaks of the entry's own archived plan, so widening the rule is the user's call.
- Whether a part set-aside (5.5) falls under ruling 14a (b) or is a new decision. I name the gap; the scope is the user's or the orchestrator's call.
- Which binding picks "the plan a ruling sets aside" (5.2): the plan the ruling names, dates when they differ, or a reading of which plan stood when the ruling was given. This is a choice among options for the orchestrator or the user.
- Overlap of this brief's paths with briefs of steps in flight: that comparison is the preparing session's job.
- I did not run Verify 1 (`checks.sh`), since it is the builder's verification. I did confirm that the state file's verify list holds 10 commands (`orchestrator-state.md` lines 7 to 17).

Agent usage: claude-opus-5-5 (the model I was served, as far as I can see), tokens not visible to me, about 31 tool uses, minutes not visible to me.

Usage from the completion notice: 153480 tokens, 34 tool uses, 431619 ms; served model claude-opus-5-5 (from its transcript).
