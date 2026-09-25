# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.B of `docs/roadmap.md`, the repair of what the audit of plans 1, 2 and 2.A found. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_skill_layout.test.sh 2>&1 | tail -1
- sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- python3 utils/check_skill_layout.py
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # files every brief tells the builder to read in full.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # ruled: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # the default worker (ruled: Opus).
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent (ruled: Opus).
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # ruled: up to three steps in flight, with disjoint paths.
bench: []                    # no A/B.
launch_note:                 # none recorded.
```

```yaml
dispatch:
  step: 1
  executor: agent
  worker: claude:opus, a native background agent of the orchestrating session
  session_id: afbadfe4ba23d1a3d (the runner's agent id)
  worktree: .agents/worktrees/2b-1
  base: 2ce1804
  launched: 2026-09-25
  report: .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/1-report.md
  landing: not-started
  round: 1 (sent 2026-09-25: the findings of 1-refuter.md with a ruling each, to the same builder; the worktree at the round's start is commit 00e8f8b on branch 2b-1)
  builder_usage: 129,970 tokens, 36 tool uses, 979 s; round 1: 207,120 tokens, 28 tool uses, 1,293 s (the runner's completion notifications)
  round_reviewer: agent a500487f692781184, claude:opus, through /refute over round 1: 124,041 tokens, 29 tool uses, 778 s
  reviewer_report: agents/reviews/1-refuter.md (dispatched 2026-09-25 through /refute; reviewer claude:opus, agent ad7e4caff71a0f039; 111,656 tokens, 24 tool uses, 421 s)
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- F (raised 2026-09-25 by the review over step 1's repair round, `agents/reviews/1-refuter.md`, "Repair round 1, refuted"): the runner finds a test's filter by reading the command's text with a regular expression, and the review found red tests that still pass (a redirection or a trailing `;` on `tail`, a comment holding a pipe, a backslash-newline, `| grep ... | tail -1`) and a false red on a quoted pipe; and under dash, where `set -m` has no terminal, a signal does not stop the running command. Mending the expression spelling by spelling cannot end this, so the fix is a change of mechanism, beyond a fix at landing. Options: (a) one repair round beyond the cap, which plan-orchestration allows when an acceptance item of the brief is unbuilt and the fix is too large for landing: the runner stops reading the command's text and lets the shell judge it, running each command as written through `bash -o pipefail -c` (so any stage's failure, the test's included, fails the pipeline, whatever the spelling), started from the embedded Python in a new session with standard input closed, and killing that session on INT, HUP, QUIT or TERM; the `PASS:` last-line rule stays for commands that end in a pipe into `tail`; `bash` becomes a stated requirement (dash has no `pipefail`: `dash -c 'set -o pipefail'` prints `Illegal option -o pipefail`); tests for every spelling the review found and for each of the four signals; (b) land as it is, with the pages narrowed to the spellings it handles, and book the mechanism change as its own step; (c) land as it is and book the gaps. Recommended (a): it ends the class of defect instead of listing it, and it is the step's own acceptance item. (b) and (c) land a runner that can still pass a red test, the defect the step exists to end; (c) is the lazy option.

## Booked, no ruling needed

- Step 3: the `land`, `plan-orchestration`, `refute` and `spec` texts (`land/SKILL.md` step 5, `refute/SKILL.md` "What the reviewer runs", `spec/templates/brief.md` "Verify before you report") name `utils/verify.sh` as how a step's verify list is run and booked, since step 1's pages say so (`docs/dev/building.md`, `docs/dev/change-standard.md`; found by step 1's builder and its review, Standards 1 and 2). Carried into step 3's brief.

## Closed items

- 2026-09-24: how to get back on track after the audit: ruled option C, this plan (see `plan.md`, Rulings).
- 2026-09-24: the audit's recommendations 2a to 2h, and contradictions 3a, 3b, 3c: ruled as recommended (see `plan.md`, Rulings).
- 2026-09-24: the step list of this plan: approved, with `workers_at_once: 3`.
- 2026-09-25: the greenlight to start: given by the user; the loop runs from step 1.
- 2026-09-24: open item E, one end-to-end run of the launch note: ruled (b), step 7 launched from a shell after step 4 and the oculus fixes.
- 2026-09-24: open items A to D from the review of the oculus changes: ruled A (a), B (a), C (b), D (a); written into steps 2, 3, 4 and 19 (see `plan.md`, Rulings).

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; a named thing is its whole (a skill is its folder, templates included); never take the lazy option; no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file or a comment; questions as plain text, never a question-box tool.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time.
- research-hub is read only.
- Commits: a capitalised imperative subject, a blank line, `- Verb ...` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main, from step 2 on through `utils/verify.sh`.
- The step's own check command, named in its brief.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Ledger: `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/`, with `agents/briefs/` and `agents/reviews/`.
- The findings: `.scratch/reviews/2026-09-24-audit/`.
- The files the coverage steps read: `/Users/axelfaes/workspace/research-hub/.agents/skills/{academic-paper,academic-paper-reviewer,academic-pipeline,deep-research}`, read only.
- Must not be disturbed: `~/.local/share/ordo-stable`, the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`, and research-hub.

## Current position (rewritten before every step commit)

- 2026-09-25. Step 1 briefed (2ce1804) and its worktree made; its review is in; the review over round 1 is in; the stop F is with the user.
- Next step: 1, the verify runner.
- Open on Axel's side: none.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
