# Plan: 1. One layout for every skill

Execution ledger for entry 1 of `docs/roadmap.md`. One bullet is one step of work; this plan's executor is inline, so the orchestrating session builds each step itself in the step's worktree, and bookkeeping steps are marked. A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A written skill layout standard, `docs/dev/skill-layout.md` (the section order Quick start, Use instead, What it reads, Steps, Stops, Anti-patterns, Rules; a table where the content is a table; one rule per bullet), and all ten skills under `skills/` rewritten to it with no rule lost or changed in meaning.

## Gate

- The user approves `docs/dev/skill-layout.md`.
- A layout check over every `skills/*/SKILL.md` exits 0, and its test fails on a skill with a section missing or out of order.
- Each skill's rule inventory (one line per rule of the old file) maps every rule to its place in the new file; the inventory check exits 0, and its test fails on a rule with no place.
- `/refute` on each step finds no rule dropped or changed in meaning.
- Every command in `docs/dev/building.md` passes, and `npx skills add . --list` lists the ten skills.

## Steps, in execution order

- ✅ 1 `docs/dev/skill-layout.md`: the section order, when a table is used, one rule per bullet, the anti-pattern table, the Quick start and Use instead forms; the user approves it (1 commit; orchestrator, a stop for approval)
- ✅ 2 `utils/check_skill_layout.py` and its test: required sections in order, frontmatter present; the test fails on a missing section and on one out of order (1 commit)
- ✅ 3 `utils/check_rule_inventory.py` and its test: every non-empty line of the old file belongs to an inventory row, every row's new heading exists in the new file; the test fails on an uncovered line and on a missing heading (1 commit)
- ✅ 4 plan-orchestration restyled, with its inventory; the layout and inventory checks exit 0 for it, the building checks pass, `/refute` finds no rule dropped (1 commit)
- ✅ 5 plan restyled, with its inventory; same proof as 4 (1 commit)
- ✅ 6 spec restyled, with its inventory; same proof (1 commit)
- ✅ 7 refute restyled, with its inventory; same proof (1 commit)
- ✅ 8 land restyled, with its inventory; same proof (1 commit)
- ✅ 9 plan-help restyled, with its inventory; same proof (1 commit)
- ✅ 10 ordo-init restyled, with its inventory; same proof (1 commit)
- ✅ 11 roadmap restyled, with its inventory; same proof (1 commit)
- ✅ 12 plan-retro restyled, with its inventory; same proof (1 commit)
- ✅ 13 repo-setup restyled, with its inventory; same proof (1 commit)
- 14 the layout check itself wired in as a check of `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list, run over every `skills/*/SKILL.md`; every check passes and `npx skills add . --list` lists ten skills (1 commit)
- 15 the closing: `/roadmap done 1` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 5 to 13 with each other, after 4.

## Rulings (2026-09-23)

- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step; the user approved this exception to the sub-agent rule.
- The step list above is approved as drafted.
- `docs/dev/skill-layout.md` is approved as written. The ASCII check allows the green checkmark in Markdown files only. No further approval stops in this plan: step 4 lands like the others, and the user reads the restyled skills in the report.
- `__x__` counts as bold for the layout check, as `**x**` does, since it renders the same (orchestrator, at step 2's landing).
- A new script's test joins `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list in the step that adds the script; step 14 wires in the layout check itself (orchestrator, at step 2's landing).
- A row of a rule inventory covers one rule: its range stays inside one block (no blank line, no heading, at most one line opening a list item or table row), so one row cannot cover a whole file; a paragraph that holds several rules gets one row per rule on the same lines. The old commit is a hexadecimal id, never a branch, tag or HEAD (orchestrator, in step 3's repair round).
- An old frontmatter line whose content lives only in the frontmatter (the name, the metadata key, the version, the trigger phrases) maps to Quick start in a rule inventory, since an inventory's places are sections and the layout keeps the version out of the text; this corrects step 4's brief, whose decision 1 named Rules for the version (orchestrator, in step 4's repair round).
- The tables the layout requires restate nothing: a Do instead cell that would repeat a step's rule names the step; a refusal is stated once, as a row of Stops, and the item where it arises points there. The columns the layout requires (What it shows, What resumes it, Why it fails) may hold text the old file does not, provided it contradicts nothing there (orchestrator, in step 5's repair round).
- The findings of the run over the last repair round that are not fixed at landing are booked as their own step in the state file's booked list, never in the open items, which hold only what the user must rule on; refute's old sentence that said "open items" is corrected in step 7 (the user, 2026-09-23).
- Nothing is installed into the user's skill folders (`~/.claude/skills`, `~/.claude-work/skills`, `~/.agents/skills`), no `utils/pin.sh <tag>` is run, and no installed skill, the academic skills included, is removed or replaced without the user's explicit permission, asked for each time (the user, 2026-09-23).
- A row of a rule inventory may name one heading line alone, for a rule the heading carries; a range that holds a heading and any other line is still an error. This amends the one-block ruling above: it adds coverage and makes no failing inventory pass (orchestrator, in step 9's repair round).

## Blocked, and by what

- none.

## Booking

### Step 2, the layout check (landed 2026-09-23)

- Landed: `utils/check_skill_layout.py` (264 lines) and `utils/check_skill_layout.test.sh` (291 lines); the test listed in `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list.
- Reviews: `agents/reviews/2-refuter.md`, 27 findings in the first run, all closed in repair round 1; 9 in the run over the round, all closed at landing, as its Closed section lists. No premise correction; nothing booked.
- Verification on main: the six tests print `PASS:`, the ASCII check prints nothing and exits 0; `python3 utils/check_skill_layout.py` exits 1 on the ten skills not yet restyled, as expected until steps 4 to 13.
- A/B: none (`bench: []`). Look: none (`look:` empty).
- Usage, orchestrator 971121b to landing: 33 messages, 40797 output tokens, 69233 cache-write tokens, 13667350 cache-read tokens, 70 fresh input tokens, 18 minutes.

### Step 3, the rule inventory check (landed 2026-09-23)

- Landed: `utils/check_rule_inventory.py` (390 lines) and `utils/check_rule_inventory.test.sh` (470 lines); the test listed in `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list.
- Premise correction: the brief's example line count was written before the command ran; corrected to 23 at 97c8fdf.
- Ruling: one rule per inventory row, and a hexadecimal old commit (rulings list).
- Reviews: `agents/reviews/3-refuter.md`, the first run's findings closed in repair round 1, the run over the round's closed at landing, as its Closed section lists; one of them a command injection through the old commit, closed by refusing any commit that is not hexadecimal before git runs. Nothing booked.
- Verification on main: seven `PASS:` lines and a clean ASCII check.
- A/B: none. Look: none.
- Usage, orchestrator 84ce1f7 to landing: 36 messages, 69387 output tokens, 96719 cache-write tokens, 18024585 cache-read tokens, 76 fresh input tokens, 26 minutes.

### Step 4, plan-orchestration restyled (landed 2026-09-23)

- Landed: `skills/plan-orchestration/SKILL.md` in the layout, 96 lines to 235, version 2.7.0; the inventory `inventories/plan-orchestration.md`, 132 rows, `check_rule_inventory.py` ok.
- Premise correction: brief line 9, garbled by the shell, restored at 8f7d0ec.
- Ruling: frontmatter-only lines map to Quick start in an inventory (rulings list).
- Reviews: `agents/reviews/4-refuter.md`; the first run's findings closed in repair round 1, among them the interrupted-landing rule narrowed to resumptions with a dispatch block, now restored to every resumption; the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check and the inventory check ok for plan-orchestration.
- A/B: none. Look: none.
- Usage, orchestrator 836f5c5 to landing: 23 messages, 46479 output tokens, 71639 cache-write tokens, 13495331 cache-read tokens, 50 fresh input tokens, 16 minutes.

### Step 5, plan restyled (landed 2026-09-23)

- Landed: `skills/plan/SKILL.md` in the layout, 33 lines to 82, version 1.7.0; the inventory, 41 rows, `check_rule_inventory.py` ok.
- Ruling: the tables the layout requires restate nothing (rulings list).
- Reviews: `agents/reviews/5-refuter.md`; the first run's findings closed in repair round 1, the run over the round's two closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout and inventory checks ok.
- Usage, orchestrator ea8d02d to landing: 10 messages, 20095 output tokens, 32627 cache-write tokens, 6379102 cache-read tokens, 24 fresh input tokens, 11 minutes.

### Step 6, spec restyled (landed 2026-09-23)

- Landed: `skills/spec/SKILL.md` in the layout, 54 lines to 114, version 1.4.0; the inventory, 64 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/6-refuter.md`; the first run's findings closed in repair round 1, among them every refusal called a stop (which would have made a refusal write an open item) and the same-step refusal dropped; the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout and inventory checks ok.
- Usage, orchestrator a682c14 to landing: 15 messages, 29490 output tokens, 47377 cache-write tokens, 10216027 cache-read tokens, 34 fresh input tokens, 13 minutes.

### Step 7, refute restyled (landed 2026-09-23)

- Landed: `skills/refute/SKILL.md` in the layout, 44 lines to 129, version 1.4.0; the inventory, 79 rows, `check_rule_inventory.py` ok; three sentences of `skills/land/SKILL.md` carried to the user's ruling on the booked list.
- Rulings applied: the last round's unfixed findings go to the booked list, never the open items (the user); nothing installed, pinned or removed without the user's permission (the user).
- Reviews: `agents/reviews/7-refuter.md`; the first run's findings closed in repair round 1, among them the reviewer appending to the ledger and the fresh-reviewer rule narrowed to the first run; the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout and inventory checks ok.
- Usage, orchestrator e4950d0 to landing: 22 messages, 32213 output tokens, 55635 cache-write tokens, 16227400 cache-read tokens, 48 fresh input tokens, 14 minutes.

### Step 8, land restyled (landed 2026-09-23)

- Landed: `skills/land/SKILL.md` in the layout, 41 lines to 114, version 1.6.0, steps numbered 1 to 11 as before, the look as its own section; the inventory, 67 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/8-refuter.md`; the first run's findings closed in repair round 1, among them refusals weakened (a dirty step path, an old refuter report, a missing dispatch block) and every red line called a stop; the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout and inventory checks ok.
- Usage, orchestrator e643b34 to landing: 11 messages, 27065 output tokens, 41660 cache-write tokens, 8629012 cache-read tokens, 26 fresh input tokens, 11 minutes.

### Step 9, plan-help restyled (landed 2026-09-23)

- Landed: `skills/plan-help/SKILL.md` in the layout, 47 lines to 91, version 1.6.0, the printed sequence byte for byte unchanged; the inventory, 42 rows; `utils/check_rule_inventory.py` accepts a row naming one heading line, with two new test cases.
- Ruling: a row may name one heading line alone (rulings list).
- Reviews: `agents/reviews/9-refuter.md`; the first run's findings closed in repair round 1, among them the next-command line printed without an entry; the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check ok, every inventory landed so far ok.
- Usage, orchestrator 0fa6d65 to landing: 14 messages, 22128 output tokens, 33413 cache-write tokens, 11517208 cache-read tokens, 32 fresh input tokens, 12 minutes.

### Step 10, ordo-init restyled (landed 2026-09-23)

- Landed: `skills/ordo-init/SKILL.md` in the layout, 108 lines; the inventory, 70 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/10-refuter.md`; a write before the approval, rules narrowed to pages, duplicates and multi-rule bullets; the first run's findings closed in repair round 1, the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check ok, every inventory ok.
- Usage, orchestrator aa7cfe2 to landing: 11 messages, 24522 output tokens, 40770 cache-write tokens, 9450742 cache-read tokens, 26 fresh input tokens, 9 minutes.

### Step 11, roadmap restyled (landed 2026-09-23)

- Landed: `skills/roadmap/SKILL.md` in the layout, 136 lines; the inventory, 73 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/11-refuter.md`; done and drop editing before the approval, rules widened, narrowed and strengthened, duplicates; the first run's findings closed in repair round 1, the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check ok, every inventory ok.
- Usage, orchestrator e6300be to landing: 11 messages, 23328 output tokens, 41676 cache-write tokens, 9899462 cache-read tokens, 26 fresh input tokens, 8 minutes.

### Step 12, plan-retro restyled (landed 2026-09-23)

- Landed: `skills/plan-retro/SKILL.md` in the layout, 103 lines; the inventory, 56 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/12-refuter.md`; multi-action steps, the check commands narrowed to approved proposals, inventory rows with several rules; the first run's findings closed in repair round 1, the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check ok, every inventory ok.
- Usage, orchestrator 9eda91c to landing: 10 messages, 17957 output tokens, 32447 cache-write tokens, 9374598 cache-read tokens, 24 fresh input tokens, 10 minutes.

### Step 13, repo-setup restyled (landed 2026-09-23)

- Landed: `skills/repo-setup/SKILL.md` in the layout, 145 lines; the inventory, 71 rows, `check_rule_inventory.py` ok.
- Reviews: `agents/reviews/13-refuter.md`; 17 findings in the first run and 3 in the run over the round, one needing no fix; the first run's findings closed in repair round 1, the run over the round's closed at landing. Nothing booked.
- Verification on main: seven `PASS:` lines, a clean ASCII check, the layout check ok, every inventory ok.
- Usage, orchestrator 709fcf6 to landing: 25 messages, 31020 output tokens, 100856 cache-write tokens, 4783481 cache-read tokens, 54 fresh input tokens, 14 minutes.
