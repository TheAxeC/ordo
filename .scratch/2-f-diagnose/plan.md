# Plan: 2.F diagnose

Execution ledger for entry 2.F of `docs/roadmap.md`. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `diagnose` skill: one command red on the exact symptom before any theory; the case shrunk; three to five ranked hypotheses that each name what would falsify it, shown to you; one change per probe; the fix with a test that is red without it; the cause written in the booking. `plan-orchestration`'s rule for a finding whose cause is not known points at it.

## Gate

One real run on a defect of an archived plan whose cause the ledger books, put back on a scratch copy of the tree: the run reaches that cause, its red command and its hypotheses quoted, reviewed by you; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `diagnosing-bugs` on the same defect, wins or ties.

- The gate: could this pass without the goal being reached? Yes, in part. The real run shows the red command, the hypotheses and that the cause was reached, but the gate reads neither the fix with its test red without it, nor the cause written in the booking, nor `plan-orchestration`'s pointer. Steps 1 to 3 below check those parts, so the plan reaches the whole goal, but the roadmap's gate stays as written unless Axel changes it.
- Step 1: could this pass without the goal being reached? No, Axel reads the skill against `docs/dev/skill-layout.md` and the goal's six parts.
- Step 2: could this pass without the goal being reached? No, each changed text is read in place, and the glossary sync check fails while plan-terms and the glossary differ.
- Step 3: could this pass without the goal being reached? No, the run's transcript quotes the red command, the hypotheses, the fix and its test run red without the fix, and Axel reviews it against the cause the ledger books.
- Step 4: could this pass without the goal being reached? No, the protocol hides which side is which and Axel makes the call.

## Steps, in execution order

- 1 The `diagnose` skill, `skills/diagnose/SKILL.md` (and a template only where a step needs one): a red command on the exact symptom, run and quoted, before any hypothesis; the case shrunk until each remaining part is needed for the red; three to five ranked hypotheses, each naming the result that would falsify it, shown to Axel, the skill waiting for his reply before the first probe when run by hand and going on under `plan-orchestration` (ruling "Step list" D2); one change per probe, each probe tied to one hypothesis; the fix with a test that is run red without the fix and quoted, where the defect's failure costs something by the rule "scripts compute facts"; the cause written in the booking; check: the skill read by Axel against `docs/dev/skill-layout.md` and the goal (1 commit) (approved)
- 2 The skill wired in: `plan-orchestration`'s Steps 8 rule for a finding whose cause is not known points at `/diagnose`; the README's skill table, Quick start and install loop; the sequence and "Use instead" of `ordo-help`; new terms (such as **red command** and **hypothesis**) in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`; check: each changed text read in place, and `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` exits 0 (1 commit) (approved)
- 3 The real run: the defect of ruling "Step list" D1 (the `utils/pin.sh` refusal of a folder that is both a skill folder and an agent folder, as it stood before 2.E step 3's `same_folder`) put back on a scratch copy of the tree at the commit before its fix, and `/diagnose` run on it in a fresh session; check: the run reaches the cause the ledger books, its red command, hypotheses, fix and red test quoted, reviewed by Axel (1 commit; orchestrator, no agent) (approved)
- 4 The blind comparison against mattpocock's `diagnosing-bugs` (github.com/mattpocock/skills at d81f3a1, `skills/engineering/diagnosing-bugs/`) on the same defect, as `docs/dev/blind-comparison.md` says; check: `diagnose` wins or ties by Axel's call (1 commit; orchestrator, no agent) (approved)
- 5 the closing: the roadmap entry ticked with the gate's output (`/roadmap done 2.F`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

- 1 and 2 after 2.E's step 10 (the rename of `plan-help` to `ordo-help`), since step 2 changes `ordo-help`.
- 3 after 1 and 2; 4 after 3.

## Rulings (2026-09-30)

- Step list (2026-09-30): Axel approved the drafted step list, "All 3 plans are approved", with each question's recommendation: D1 (a), the defect of steps 3 and 4 is the `utils/pin.sh` both-folders refusal of 2.E step 3, the lazy option (b) being a defect whose cause its symptom names; D2 (a) by hand and (b) under `plan-orchestration`, the lazy option being (b) everywhere; D3 (a), this draft opened as it stands without a `grill` run; the gate stays as the roadmap writes it, the steps checking the parts it does not read (the user).

## Blocked, and by what

- 2: 2.E's step 10 renames `plan-help` to `ordo-help`; step 2 edits whichever name is on main when it is prepared.
