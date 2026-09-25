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
- sh utils/verify.test.sh 2>&1 | tail -1
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
- step: 4
  executor: agent
  worker: claude:opus, a native background agent of the orchestrating session
  session_id: ad3f887161cb31e53 (the runner's agent id)
  worktree: .agents/worktrees/2b-4
  base: ec6586e
  launched: 2026-09-25
  report: .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/4-report.md
  landing: not-started
  round: 0
- step: 6
  executor: agent
  worker: claude:opus, a native background agent of the orchestrating session
  session_id: af0886ca919e9c3db (the runner's agent id)
  builder_usage: 214,647 tokens, 61 tool uses, 922 s (the runner's completion notification)
  reviewer_report: agents/reviews/6-refuter.md (through /refute; reviewer claude:opus)
  worktree: .agents/worktrees/2b-6
  base: f7dd354
  launched: 2026-09-25
  report: .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6-report.md
  landing: not-started
  round: 1 (sent 2026-09-25: the findings of 6-refuter.md with a ruling each, to the same builder; the worktree at the round's start is commit 5b8354c on branch 2b-6)
- step: 8
  executor: agent
  worker: claude:opus, a native background agent of the orchestrating session
  session_id: adadaa3f3a92b7215 (the runner's agent id)
  worktree: .agents/worktrees/2b-8
  base: f052f57
  launched: 2026-09-25
  report: .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/8-report.md
  landing: not-started
  round: 0
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- I (raised 2026-09-25 by step 5's builder, `agents/reviews/5-report.md`): a reproduction run of `utils/pin.sh` with the session's `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` still set created one link in the user's real skill folder, `/Users/axelfaes/.claude-work/skills/alpha`, pointing at a scratch folder that no longer exists; nothing else there changed (`ls /Users/axelfaes/.claude-work/skills/` lists alpha, the ten Ordo skills and synced). The builder's removal was refused by the runner's permission check, so the orchestrator does not remove it either. Options: (a) the user removes it with `! rm /Users/axelfaes/.claude-work/skills/alpha`, and every later brief that runs a tool touching skill folders unsets `CLAUDE_CONFIG_DIR` and names every variable that reaches a real folder; (b) leave it. Recommended (a): it is a dangling link the step made in a folder the user's rules keep untouched. (b) is the lazy option.
- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## Booked, no ruling needed

- Step 1b: the ASCII check of the verify list (`docs/dev/change-standard.md`, `docs/dev/building.md`, the state file) exits 0 when perl dies on a file that is not valid UTF-8, so the runner counts it as passed (found by step 2's builder: a scratch file holding `\xf3\r\r\n` printed `Malformed UTF-8 character (fatal)` and exited 0); and `__pycache__/` is not in `.gitignore`, so a folder Python writes is read by the check. A step of its own: it changes a rule page's command.
- Found by step 2's builder, for the step that holds the file: `skills/plan/templates/plan.md:3` still says "one agent dispatch" (step 2's landing, the plan skill being step 2's); `skills/land/SKILL.md:70` opens the landing report with the open items, not the position line (fixed in step 3's worktree, item 12, and lands with step 3); a builder's report keeps the change standard's shape (step 2's Reports), so step 3's landing takes the position line back out of `skills/spec/templates/brief.md:40`, which step 3's worktree added; `skills/plan-orchestration/templates/launch.sh:20-21` usage says `--label <step>` (step 4).
- Found by step 3's builder, sentences in files no step in flight holds, to fix at the landing of the step that touches them or at step 3's landing: `skills/plan-orchestration/SKILL.md:206` says `/land` makes the usage row "at its step 8" (now Steps 9, for step 4, the next step to edit that file); `skills/repo-setup/templates/shared-rules.md:19` makes any "premise found wrong" a stop, against ruling 3c (step 3's landing, the repo-setup folder being step 3's); `skills/plan/templates/plan.yaml:2` and `plan.projects.yaml:3` say every path is relative to the repository root without the `launch_note` exception (step 2's landing, the plan skill's templates being step 2's).
- Step 1a: the runner's summary-test detection and the untested parts of its signal handling (`plan.md`, step 1a; from `agents/reviews/1-refuter.md`, Closed).
- Step 4: the process in `launch.sh`'s pid file owns the builder's whole session (the builder started in a session or process group of its own), so the TERM, grace, KILL that `land`'s Steps 1 sends ends the builder and the exit file is still written; `launch.test.sh` runs that sequence (found by step 3's last review, Behaviour 1: today TERM ends only the wrapper shell and the builder keeps running).
- Step 4: `plan-orchestration`'s resumption list gains the case of a dispatch block at `landing: backed-out` (the step taken back out of main by a red line: its worktree and branch kept, the step unticked, the failure booked), which step 3 defines in `land` (brief 3, decision 1).
- Step 3: the `land`, `plan-orchestration`, `refute` and `spec` texts (`land/SKILL.md` step 5, `refute/SKILL.md` "What the reviewer runs", `spec/templates/brief.md` "Verify before you report") name `utils/verify.sh` as how a step's verify list is run and booked, since step 1's pages say so (`docs/dev/building.md`, `docs/dev/change-standard.md`; found by step 1's builder and its review, Standards 1 and 2). Carried into step 3's brief.

## Closed items

- 2026-09-24: how to get back on track after the audit: ruled option C, this plan (see `plan.md`, Rulings).
- 2026-09-24: the audit's recommendations 2a to 2h, and contradictions 3a, 3b, 3c: ruled as recommended (see `plan.md`, Rulings).
- 2026-09-24: the step list of this plan: approved, with `workers_at_once: 3`.
- 2026-09-25: open item G, the round cap stated where it cannot be missed: ruled (a), written into step 2.
- 2026-09-25: open item F, how the runner recognises a test's filter: ruled (a), one repair round beyond the cap under plan-orchestration's exception; the runner runs each command through `bash -o pipefail -c` from its Python in a new session and kills that session on INT, HUP, QUIT or TERM; `bash` a stated requirement.
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

- 2026-09-25. Steps 1, 2, 3 and 5 landed (5fdaa98, 6458d52, fafda10; step 5 in the commit that carries this line). The tree is clean after it.
- Steps 4, 6 and 8 are with their builders (8's README line comes as "Doc text", since step 6 holds README.md); 9 follows as a slot frees; 1a waits on open item H.
- Open on Axel's side: none.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | claude:opus agent, effort high: 129,970 tokens, 36 tool uses, 979 s; round 1: 207,120 tokens, 28 tool uses, 1,293 s; round 2: 352,270 tokens, 52 tool uses, 4,615 s | 111,656 tokens, 24 tool uses, 421 s; round 1: 124,041 tokens, 29 tool uses, 778 s; round 2: 144,379 tokens, 34 tool uses, 1,123 s; landing fixes: 91,589 tokens, 19 tool uses, 314 s | 2 (one under the exception, ruling F) | 17, then 12 | 5 files changed, 781 insertions(+), 1 deletion(-) | no | 10 | 1 (open item F) | 61 | 51853 | 121761 | 33845304 | 136 | 172 | none |
| 2 | claude:opus agent, effort high: 209,393 tokens, 73 tool uses, 777 s; round 1: 238,449 tokens, 13 tool uses, 264 s | 174,608 tokens, 36 tool uses, 433 s; round 1: 155,407 tokens, 26 tool uses, 341 s; landing fixes: 74,661 tokens, 19 tool uses, 315 s | 1 | 20 (12 rulings) | 9 files changed, 120 insertions(+), 104 deletions(-) | no | 6 | 0 | 68 | 75477 | 182612 | 48311299 | 154 | 44 | none |
| 3 | claude:opus agent, effort high: 208,057 tokens, 60 tool uses, 623 s; round 1: 238,866 tokens, 11 tool uses, 270 s | 179,173 tokens, 49 tool uses, 460 s; round 1: 143,412 tokens, 35 tool uses, 402 s; landing fixes: 85,655 tokens, 17 tool uses, 315 s | 1 | 12 (8 rulings) | 16 files changed, 145 insertions(+), 122 deletions(-) | no | 12 | 0 | 10 | 9732 | 20013 | 8130367 | 22 | 10 | none |
| 5 | claude:opus agent, effort high: 133,678 tokens, 31 tool uses, 606 s; round 1: 203,386 tokens, 22 tool uses, 559 s | 126,518 tokens, 28 tool uses, 433 s; round 1: 135,722 tokens, 31 tool uses, 484 s; landing fixes: 72,526 tokens, 15 tool uses, 342 s | 1 | 12 (7 rulings) | 3 files changed, 513 insertions(+), 86 deletions(-) | no | 13 | 1 (open item I) | 23 | 16145 | 30037 | 19419115 | 50 | 13 | none |
