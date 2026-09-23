# Plan: 2. Coverage inventory of the academic skills

Execution ledger for entry 2 of `docs/roadmap.md`. One bullet is one step of work; this plan's executor is inline, so the orchestrating session builds each step itself in the step's worktree, and bookkeeping steps are marked. A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A list of every file of the four installed academic skills (academic-paper, academic-paper-reviewer, academic-pipeline, deep-research), each marked `rebuild: <new skill>`, `rebuild later: <new skill>` or `drop`, with its reason; the new skill is the roadmap entry's skill that takes the file.

## Gate

- `docs/academic-coverage.md` names each of the 169 files once with its mark and reason.
- A check that every file `find` lists under the four skill folders appears exactly once exits 0; its test fails on a missing file, a file listed twice, an unknown mark or new skill, an empty reason, and a listed file that does not exist.
- The user approves the list.

## Steps, in execution order

- ✅ 1 `utils/check_coverage.py` and its test: given the four skill folders and `docs/academic-coverage.md`, exit 0 only when every file `find` lists appears exactly once with a mark whose new skill is a roadmap entry's skill and a reason that is not empty; the test fails on a missing file, a file listed twice, an unknown mark or new skill, an empty reason, and a listed file that does not exist (1 commit)
- 2 the check's test joined to `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list; every check passes (1 commit)
- 3 academic-paper, 61 files, each read in full and marked with its reason; the check passes for its section (1 commit)
- 4 academic-paper-reviewer, 26 files, the same; the check passes for its section (1 commit)
- 5 academic-pipeline, 30 files, the same; the check passes for its section (1 commit)
- 6 deep-research, 52 files, the same; the check passes over the whole list (1 commit)
- 7 the user approves the list (orchestrator, a stop for approval)
- 8 the closing: `/roadmap done 2` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 3 to 6 with each other, after 2.

## Rulings (2026-09-23)

- The step list above is approved as drafted, with option A for the marks: each mark names the new skill that takes the file (the user).
- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step, as in plan 1; the user approved it with the step list.
- A new script's test joins `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list in its own step, step 2 here.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill, the academic skills included, is removed or replaced without the user's explicit permission, asked for each time (the user). The academic skills are read in `research-hub/.agents/skills/` and never changed.

## Blocked, and by what

- 7: the user's approval of the list, a decision the user owes once step 6 has landed.

## Booking

### Step 1, the coverage check (landed 2026-09-23)

- Landed: `utils/check_coverage.py` (278 lines) and `utils/check_coverage.test.sh` (396 lines). The test joins the README, `building.md`, `change-standard.md` and the verify list in step 2.
- Decisions recorded in the report: lettered roadmap entries read as the roadmap writes them (`## 2.A <title>`); a link inside a skill folder is an error, the folder itself may be a link; the fence reading is `check_skill_layout.py`'s.
- Reviews: `agents/reviews/1-refuter.md`; 14 findings in the first run, closed in repair round 1; 6 in the run over the round, fixed at landing, each with a case its revert turns red. Nothing booked.
- Verification on main: seven `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check, and `PASS: check_coverage.py scratch tests`.
- Usage, orchestrator a866716 to landing: 46 messages, 65884 output tokens, 270920 cache-write tokens, 10403186 cache-read tokens, 96 fresh input tokens, 150 minutes. The window also holds the discussion with the user, the roadmap changes and the plan's opening, and the wait for the user's answers.
- Reviewer usage: first run 80,660 tokens, 13 tool uses, 240 seconds; run over the round 93,021 tokens, 21 tool uses, 445 seconds.
