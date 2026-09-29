# Plan draft: 2.F diagnose

The step list `/plan 2.F` drafted, stopped at "The drafted step list" for Axel's approval or correction. No ledger folder is opened: on his approval `/plan 2.F` writes `.scratch/2-f-diagnose/plan.md` from this draft, each step line ending with `(approved)`, and the state file.

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

- 1 The `diagnose` skill, `skills/diagnose/SKILL.md` (and a template only where a step needs one): a red command on the exact symptom, run and quoted, before any hypothesis; the case shrunk until each remaining part is needed for the red; three to five ranked hypotheses, each naming the result that would falsify it, shown to Axel; one change per probe, each probe tied to one hypothesis; the fix with a test that is run red without the fix and quoted, where the defect's failure costs something by the rule "scripts compute facts"; the cause written in the booking; check: the skill read by Axel against `docs/dev/skill-layout.md` and the goal (1 commit)
- 2 The skill wired in: `plan-orchestration`'s Steps 8 rule for a finding whose cause is not known points at `/diagnose`; the README's skill table, Quick start and install loop; the sequence and "Use instead" of `ordo-help`; new terms (such as **red command** and **hypothesis**) in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`; check: each changed text read in place, and `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` exits 0 (1 commit)
- 3 The real run: the defect put back on a scratch copy of the tree at the commit before its fix, and `/diagnose` run on it in a fresh session; check: the run reaches the cause the ledger books, its red command, hypotheses, fix and red test quoted, reviewed by Axel (1 commit; orchestrator, no agent)
- 4 The blind comparison against mattpocock's `diagnosing-bugs` (github.com/mattpocock/skills at d81f3a1, `skills/engineering/diagnosing-bugs/`) on the same defect, as `docs/dev/blind-comparison.md` says; check: `diagnose` wins or ties by Axel's call (1 commit; orchestrator, no agent)
- 5 the closing: the roadmap entry ticked with the gate's output (`/roadmap done 2.F`), this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

- 1 and 2 after 2.E's step 10 (the rename of `plan-help` to `ordo-help`), since step 2 changes `ordo-help`.
- 3 after 1 and 2; 4 after 3.

## Blocked, and by what

- 2: 2.E's step 10 renames `plan-help` to `ordo-help`; step 2 edits whichever name is on main when it is prepared.

## Questions for Axel with the draft

- D1. The defect for steps 3 and 4. Options:
  - (a) 2.E step 3's `utils/pin.sh` refusal "a folder that is both a skill folder and an agent folder", which compared the paths as spelled, so `ORDO_SKILL_DIRS` naming `<agents folder>//` moved the pinned worktree before failing; the cause and fix (`same_folder`) are booked in `.scratch/2-e-grill/plan.md` step 3, and the two cases of `utils/pin.test.sh` are the red commands a run should find. 2.E is archived at its closing, before 2.F reaches step 3.
  - (b) 2.B step 9's `land.sh`: a builder that committed everything made the worktree's `git commit` fail with exit 1 (`.scratch/archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md`, step 9's before and after). Its cause is short to find, so it tests the loop less.
  - Recommendation: (a). The symptom (a pin that moves the worktree, then fails) is far from its cause (a string comparison of two paths), which is the case the skill is for. (b) is the lazy option: a defect whose cause the symptom names.
- D2. "Shown to you" for the hypotheses. mattpocock's skill shows them and goes on when the user is away. Options: (a) the skill shows the ranked list and waits for Axel's reply before the first probe; (b) it shows the list and goes on, taking a reply when one comes. The blind comparison judges a side that stops on what it produced, so (a) needs Axel present in steps 3 and 4, and the other side's run does not wait. Recommendation: (a) when run by hand, (b) under `plan-orchestration`, where the orchestrator runs it and Axel is not in the loop; the lazy option is (b) everywhere, which drops "shown to you" in practice.
- D3. The draft is made without `grill`, which 2.E is building. Options: (a) approve or correct this draft as it stands; (b) run `grill` on entry 2.F once 2.E lands, and draft again from its rulings. Recommendation: (a), since the goal and gate are already specific; (b) delays 2.F until 2.E closes.
