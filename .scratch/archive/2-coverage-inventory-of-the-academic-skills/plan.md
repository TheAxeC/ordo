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
- ✅ 2 the check's test joined to `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list; every check passes (1 commit)
- ✅ 3 academic-paper, 61 files, each read in full and marked with its reason; the check passes for its section (1 commit)
- ✅ 4 academic-paper-reviewer, 26 files, the same; the check passes for its section (1 commit)
- ✅ 5 academic-pipeline, 30 files, the same; the check passes for its section (1 commit)
- ✅ 6 deep-research, 52 files, the same; the check passes over the whole list (1 commit)
- ✅ 7 the user approves the list (orchestrator, a stop for approval)
- ✅ 8 the closing: `/roadmap done 2` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 3 to 6 with each other, after 2.

## Rulings (2026-09-23)

- The step list above is approved as drafted, with option A for the marks: each mark names the new skill that takes the file (the user).
- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step, as in plan 1; the user approved it with the step list.
- A new script's test joins `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list in its own step, step 2 here.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill, the academic skills included, is removed or replaced without the user's explicit permission, asked for each time (the user). The academic skills are read in `research-hub/.agents/skills/` and never changed.
- 2026-09-23: the user approves `docs/academic-coverage.md` as landed at c1ff193, and asks that it be kept for later work, the `rebuild later` rows in particular.

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

### Step 2, the coverage test joined to the checks (landed 2026-09-23)

- Landed: `sh utils/check_coverage.test.sh` in `README.md` (the Tests block and a bullet saying what it passes and fails), `docs/dev/building.md`, `docs/dev/change-standard.md` and this plan's `verify` list.
- Reviews: `agents/reviews/2-refuter.md`; 3 findings in the first run, closed in repair round 1; 3 in the run over the round, fixed at landing, all in the README bullet's wording. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Usage, orchestrator d44092c to landing: 14 messages, 12803 output tokens, 26079 cache-write tokens, 4156461 cache-read tokens, 32 fresh input tokens, 9 minutes.
- Reviewer usage: first run 77,262 tokens, 18 tool uses, 167 seconds; run over the round 63,707 tokens, 12 tool uses, 169 seconds.

### Step 3, academic-paper marked (landed 2026-09-23)

- Landed: `docs/academic-coverage.md`, 108 lines: the introduction, the New skills table and the `## academic-paper` section, 61 rows; `check_coverage.py` over `academic-paper` prints `ok`.
- Marks: 24 `rebuild: paper`, 8 `rebuild later: paper`, 5 `rebuild: rebuttal`, 3 `rebuild: writing`, 2 `rebuild: literature`, 2 `rebuild later: literature`, 1 `rebuild: paper-review`, 1 `rebuild: submit-manuscript`, 15 `drop`.
- The paper skill holds the venue AI-use policies and venue limits until roadmap entry 13 writes the researcher's `venues/` files; the introduction's check command names the skills that have a section, and steps 4 to 6 add theirs.
- Reviews: `agents/reviews/3-refuter.md`; 8 findings in the first run, closed in repair round 1; the run over the round's findings fixed at landing (sentence length, the policy-anchor rules and table, the CRediT row, the clauses saying where the rest of a file goes, the gap rule, the introduction's first sentence). Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Usage, orchestrator 64e50ce to landing: 137 messages, 110118 output tokens, 949568 cache-write tokens, 54128563 cache-read tokens, 272 fresh input tokens, 23 minutes.
- Reviewer usage: first run 270,436 tokens, 47 tool uses, 321 seconds; run over the round 124,139 tokens, 30 tool uses, 250 seconds.

### Step 4, academic-paper-reviewer marked (landed 2026-09-23)

- Landed: the `## academic-paper-reviewer` section of `docs/academic-coverage.md`, 26 rows, and the introduction's check command naming both skills; `check_coverage.py` over `academic-paper academic-paper-reviewer` prints `ok`. The file is 139 lines.
- Marks in the section: 18 `rebuild: paper-review`, 3 `rebuild later: paper-review`, 1 `rebuild: rebuttal`, 4 `drop`.
- The review skill keeps the 0-to-100 scale of `references/quality_rubrics.md`; the reviewer asks the user for the target venue.
- The `academic-paper` section's reasons were rewritten to the prose standard (no label-and-colon openers, varied endings); no mark changed.
- Reviews: `agents/reviews/4-refuter.md`; 11 spec findings and 2 standards findings in the first run, closed in repair round 1; the run over the round's findings fixed at landing. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Usage, orchestrator b6fadc8 to landing: 95 messages, 84572 output tokens, 318887 cache-write tokens, 48322651 cache-read tokens, 192 fresh input tokens, 22 minutes.
- Reviewer usage: first run 207,415 tokens, 34 tool uses, 275 seconds; run over the round 153,996 tokens, 57 tool uses, 409 seconds.

### Step 5, academic-pipeline marked (landed 2026-09-23)

- Landed: the `## academic-pipeline` section of `docs/academic-coverage.md`, 30 rows, and the check command naming three skills; `check_coverage.py` over the three prints `ok`. The file is 174 lines.
- Marks in the section: 6 `rebuild: paper`, 1 `rebuild later: paper`, 5 `rebuild: researcher`, 1 `rebuild: literature`, 1 `rebuild: paper-review`, 1 `rebuild: rebuttal`, 15 `drop`.
- The integrity check, its lookup rules and the originality screen go to the paper skill; the orchestration goes to the researcher, with Ordo's plan ledger standing in for the state record.
- Earlier rows reworded to the prose standard (full sentences, no recurring endings); no earlier mark changed.
- Reviews: `agents/reviews/5-refuter.md`; 12 spec and 5 standards findings in the first run, closed in repair round 1; the run over the round's findings fixed at landing. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Usage, orchestrator ed16ff2 to landing: 30 messages, 40013 output tokens, 65747 cache-write tokens, 20828687 cache-read tokens, 64 fresh input tokens, 20 minutes.
- Reviewer usage: first run 305,282 tokens, 50 tool uses, 393 seconds; run over the round 149,888 tokens, 38 tool uses, 341 seconds.

### Step 6, deep-research marked; the check over the whole list (landed 2026-09-23)

- Landed: the `## deep-research` section of `docs/academic-coverage.md`, 52 rows; the introduction covers all four skills and its command names them; `check_coverage.py` over the four prints `ok`. The file is 231 lines, 169 rows.
- Marks in the section: 16 `rebuild: literature`, 4 `rebuild later: literature`, 3 `rebuild: idea`, 1 `rebuild: paper-review`, 2 `rebuild later: paper`, 1 `rebuild: researcher`, 1 `rebuild later: researcher`, 24 `drop`.
- Marks over the whole list: 30 `rebuild: paper`, 11 `rebuild later: paper`, 21 `rebuild: paper-review`, 3 `rebuild later: paper-review`, 19 `rebuild: literature`, 6 `rebuild later: literature`, 7 `rebuild: rebuttal`, 6 `rebuild: researcher`, 1 `rebuild later: researcher`, 3 `rebuild: writing`, 3 `rebuild: idea`, 1 `rebuild: submit-manuscript`, 58 `drop`.
- Earlier rows reworded to the prose standard; no earlier mark changed.
- Reviews: `agents/reviews/6-refuter.md`; the first run's findings closed in repair round 1; the run over the round's findings fixed at landing. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Usage, orchestrator 7752a76 to landing: 28 messages, 40613 output tokens, 76631 cache-write tokens, 21610160 cache-read tokens, 60 fresh input tokens, 23 minutes.
- Reviewer usage: first run 256,733 tokens, 62 tool uses, 455 seconds; run over the round 166,848 tokens, 52 tool uses, 419 seconds.

### Step 7, the user's approval (2026-09-23)

- The user approved `docs/academic-coverage.md` as landed at c1ff193 and asked that it stay available for later work, the `rebuild later` rows in particular. The file stays at `docs/academic-coverage.md`.

### Step 8, the closing (2026-09-23)

- Gate on main: `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0; 169 rows against 169 files from `find`; `sh utils/check_coverage.test.sh` printed `PASS: check_coverage.py scratch tests`; every command in `docs/dev/building.md` passed (eight `PASS:` lines, ten `ok:` lines, a clean ASCII check).
- Roadmap entry 2 ticked done with that output; this folder moved to `.scratch/archive/`.
