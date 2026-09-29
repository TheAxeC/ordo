# Plan: 2.H session-retro

Execution ledger for entry 2.H of `docs/roadmap.md`. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `session-retro` skill that reads the transcripts of Claude Code sessions and reports both what went well, to keep and repeat, and what went wrong, to change, each point with the place in the transcript quoted and the change it proposes to a rule, a skill or a brief; you rule on each proposal.

## Gate

One real run over the sessions of plan 2.C, its report holding points of both kinds, each with its quoted place, reviewed by you, with your ruling written beside each proposal.

- The gate: could this pass without the goal being reached? No. The report's points are checked against the transcript by their quoted places, Axel reviews them, and his rulings are on disk beside each proposal.
- Step 1: could this pass without the goal being reached? No, each case of the script's test fails on the unchanged tree, and the time window is checked against entries just inside and just outside it.
- Step 2: could this pass without the goal being reached? No, Axel reads the skill against `docs/dev/skill-layout.md` and the goal.
- Step 3: could this pass without the goal being reached? No, each changed text is read in place, and the glossary sync check fails while plan-terms and the glossary differ.
- Step 4: could this pass without the goal being reached? No, as the gate.

## What is on the tree and the machine

- Plan 2.C ran from its opening commit `ab2cb50` (2026-09-28 22:51) to `75c987f` (2026-09-29 12:04) (`git log` on its ledger folder). Its sessions are in `~/.claude/projects/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8.jsonl` (87 MB, from 2026-09-25, still being written) and its `subagents/` folder (324 agent transcripts). The file is too large to read whole, so the skill needs the entries of a window.
- Claude Code removes transcripts older than its `cleanupPeriodDays` setting, which `~/.claude/settings.json` does not set (grep finds no such key), so the default applies; the default of 30 days is from memory of the Claude Code documentation, not verified. Under it, 2.C's entries are gone around 2026-10-28, so step 4 runs before that date.
- mattpocock's `retro` (github.com/mattpocock/skills at d81f3a1, `skills/engineering/retro/SKILL.md`) is a reference: it reads one session and proposes environment changes by category, with no quoted place and no record of the user's ruling.

## Steps, in execution order

- 1 The transcript reader `skills/session-retro/templates/transcript_window.py` and its test. What the script computes, for Axel's approval of a new script: given a project's transcript folder and a window (two ISO times, or a session id), it prints, in time order, each user message, assistant text and tool call (tool name and its first line of input) of the main session and of every subagent transcript whose entries fall in the window, each line prefixed with the session or agent id, the line number in its file and the timestamp, and every value that looks like a key or a token replaced by `<REDACTED>`; nothing else. Check: the test on scratch transcripts with entries just inside and just outside the window, a subagent file, and a planted token, each case failing on the unchanged tree (1 commit) (approved)
- 2 The `session-retro` skill, `skills/session-retro/SKILL.md`: the window from a plan's ledger (its opening and closing commits) or from a session id; the reader of step 1; points of two kinds, each quoting its place by id, line and timestamp, and each wrong point with the change it proposes to a named rule, skill or brief, as a sentence to add or change; the report at `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md`; Axel's ruling written beside each proposal; check: the skill read by Axel against `docs/dev/skill-layout.md` and the goal (1 commit) (approved)
- 3 The skill wired in: the README's skill table, Quick start and install loop; `ordo-help`'s sequence and "Use instead"; `plan-retro`'s "Use instead" (refuter reports there, transcripts here); new terms in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`; check: each changed text read in place, and `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` exits 0 (1 commit) (approved)
- 4 The real run over plan 2.C's sessions, before 2026-10-28; check: the report holds points of both kinds with quoted places, reviewed by Axel, his ruling beside each proposal (1 commit; orchestrator, no agent) (approved)
- 5 the closing: the roadmap entry ticked with the gate's output (`/roadmap done 2.H`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

- 1 with anything; 2 after 1; 3 after 2 and after 2.E's step 10 (the rename of `plan-help` to `ordo-help`); 4 after 3.

## Rulings (2026-09-30)

- Step list (2026-09-30): Axel approved the drafted step list, "All 3 plans are approved", with each question's recommendation: D1 (a), a skill of its own, the lazy option (b) a mode of `plan-retro`; D2 (a), the report at `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md`; D3 (a), the skill reads only the transcripts Claude Code keeps and step 4 runs before 2026-10-28. The approval of the list is the approval of what step 1's script computes, as step 1 states it (the user).

## Blocked, and by what

- 3: 2.E's step 10 renames `plan-help` to `ordo-help`.
- 4: the transcripts of 2.C last until about 2026-10-28.
