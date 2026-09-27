# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.B of `docs/roadmap.md`, the repair of what the audit of plans 1, 2 and 2.A found. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/spec/templates/check_paths.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh skills/land/templates/verify.test.sh 2>&1 | tail -1
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
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent (ruled: Opus).
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # ruled: up to three steps in flight, with disjoint paths.
bench: []                    # no A/B.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- none.

## Booked, no ruling needed

- Found by step 20's review (Behaviour 1), for the pin of ruling W after step 21: `~/.agents/skills` holds ten links into `~/.local/share/ordo-stable` that `pin.sh` no longer manages; the user removes them at that pin, since no session edits a skill folder's links.
- Found by step 2's builder, for the step that holds the file: `skills/plan/templates/plan.md:3` still says "one agent dispatch" (step 2's landing, the plan skill being step 2's); `skills/land/SKILL.md:70` opens the landing report with the open items, not the position line (fixed in step 3's worktree, item 12, and lands with step 3); a builder's report keeps the change standard's shape (step 2's Reports), so step 3's landing takes the position line back out of `skills/spec/templates/brief.md:40`, which step 3's worktree added.
- Found by step 3's builder, sentences in files no step in flight holds, to fix at the landing of the step that touches them or at step 3's landing: `skills/repo-setup/templates/shared-rules.md:19` makes any "premise found wrong" a stop, against ruling 3c (step 3's landing, the repo-setup folder being step 3's); `skills/plan/templates/plan.yaml:2` and `plan.projects.yaml:3` say every path is relative to the repository root without the `launch_note` exception (step 2's landing, the plan skill's templates being step 2's).

## Closed items

- 2026-09-27: open item X, how a step line names its authority: ruled (a), each step line ends with `(approved)` or `(ruling <name>)`, checked by `skills/spec/templates/check_step.py`, run by `/spec`, written by `/plan`.
- 2026-09-27: open item W, when to pin: ruled (a), a tag and a pin once step 21 has landed, the pin run only on the user's yes to that tag.
- 2026-09-27: open item V, the verify-list review: ruled (a), `land.sh`, `check_rule_inventory.py` and `sync_rules.py` kept and each made part of a process (steps 20 and 21).
- 2026-09-27: open item U, launch.sh and steps 7a to 7d: ruled 1 (a), Claude only, the shell-launch route and every Codex part of the skills removed, steps 7a to 7d out of the plan (step 20); 2 (a), the verify-list scripts read and tabled for the user's ruling; 3 (a), new commits, no reset; 4 (a), the `/spec` check against unruled steps (step 21). Step 7d's worktree and step 17's worktree deleted with their branches by the user. Step 17's brief is kept and re-checked by `/spec` after step 21.
- 2026-09-26: open item T, the library check in `/spec`: ruled 1 (a), new step 17a after 17; 2 (a), `libraries: check | avoid`, required, per project, asked by `/ordo-init`; 3 (a), this repository's value `avoid`.
- 2026-09-26: open item S, the allow-list key: ruled (a), `worker_allow:`, a list of command prefixes that `launch.sh` passes to a `claude` builder as `--allowedTools "Bash(<prefix>:*)"`; absent, built from the verify list and the brief's gate commands.
- 2026-09-26: open item R, how a shell-launched `claude` builder may run commands: ruled (a), an allow list that `launch.sh` passes as `--allowedTools`, from a new optional key; new step 7a builds it, then step 7's builder is resumed with the list.
- 2026-09-26: booked item, roadmap entry 14's cover letter and blind-review removal: entry 14's goal names both (step 10, 9095ecc).
- 2026-09-26: open item Q, the roadmap diff of step 10: ruled (a), approved as drafted in `agents/reviews/10-roadmap.md`, entry 15.A's gate naming `--built paper --built paper-review --built literature`.
- 2026-09-26: open item P, the retro's 19 proposals: ruled all (a) (`Ruled: P: all (a)`); written beside each proposal in `.scratch/retros/2026-09-26.md`; step 17 makes them.
- 2026-09-26: open item O, plan 1's Done line: ruled (b), the line without the clause on the landing reports' lists; it goes into `docs/roadmap.md:135` through `/roadmap` with step 10's diff.
- 2026-09-26: open item N, step 7's shell launch: ruled account (a), the builder launches with the account the main session uses (`CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` kept); oculus (a), the user runs oculus at http://127.0.0.1:8790/ and the orchestrator checks the builder's row in its Agents view.
- 2026-09-26: open item M, the roadmap's gates and order: ruled choice 1 (a), entry 9 before entry 5 with entry 5 waiting on 9 for the reference lookups; choice 2 (a), entry 14's goal names the cover letter and the blind-review removal. Changes 1 to 7 are shown for approval as the diff step 10 writes through `/roadmap`.
- 2026-09-26: booked item, the two ethics rows of the audit's finding 13: checked at step 14 and re-marked `rebuild: paper` (`plan.md`, Step 14).
- 2026-09-25: open item L, style calibration in the `intake_agent.md` coverage row: ruled (a); the paper skill (entry 5) learns the author's voice from past papers, subordinate to the prose standard, and the row names it; carried into step 11.
- 2026-09-25: the plan cut to its goal: step 1b removed, step 1a cut to the runner's move, step 6a replaced by the collector keeping every finding; step 1c stays.
- 2026-09-25: open item K, how a brief's cases are checked: ruled, no prototype scripts; the scripts of step 6a removed; the builder runs the brief's cases as tests first and reports any case the brief's rules get wrong before it changes code (step 1c).
- 2026-09-25: open item J, a brief's decisions checked against its own cases: ruled (a); new step 1c after 1a, which also takes the checked path list from 1a.
- 2026-09-24: how to get back on track after the audit: ruled option C, this plan (see `plan.md`, Rulings).
- 2026-09-24: the audit's recommendations 2a to 2h, and contradictions 3a, 3b, 3c: ruled as recommended (see `plan.md`, Rulings).
- 2026-09-24: the step list of this plan: approved, with `workers_at_once: 3`.
- 2026-09-25: open item H, where the verify runner lives: ruled (a); the runner and its test move into the land skill's `templates/`, and step 1a carries the move and the skill texts that name it.
- 2026-09-25: open item I, the stray link `alpha` in the user's skill folder: ruled (a); the user removed it (`ls /Users/axelfaes/.claude-work/skills/` lists the ten Ordo skills and synced), and every brief that runs a tool touching skill folders clears `CLAUDE_CONFIG_DIR`.
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
- The cuts ruled 2026-09-25: (1) the findings collector skips nothing and its no-finding and closure word lists go; `plan-retro` sets aside, by reading, a finding that reports no defect; step 6a is re-scoped to that. (2) A README bullet for a test is one sentence saying what the test covers. (3) No extra review of the orchestrator's landing fixes. (4) A builder's report is the result table and a short list of the planted faults with their red line; no pasted output beyond that. (5) Ledger bookkeeping batched: one commit per event, not one per field.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main, through `sh skills/land/templates/verify.sh <state file>`, and the lines it prints are what a report or a booking quotes.
- The step's own check command, named in its brief.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Ledger: `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/`, with `agents/briefs/` and `agents/reviews/`.
- The findings: `.scratch/reviews/2026-09-24-audit/`.
- The files the coverage steps read: `/Users/axelfaes/workspace/research-hub/.agents/skills/{academic-paper,academic-paper-reviewer,academic-pipeline,deep-research}`, read only.
- Must not be disturbed: `~/.local/share/ordo-stable`, the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`, and research-hub.

## Current position (rewritten before every step commit)

- 2026-09-27. Steps 1, 1a, 1c, 2, 3, 4, 5, 6, 6a, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 and 20 landed (step 20 in the commit that carries this line); steps 7a, 7b and 7c landed and were then removed by ruling U through step 20. The tree is clean after it.
- Roadmap entry 2.B. Step 20 landed; next: step 21, then the tag and the pin on the user's yes (ruling W), then 17, 17a, 18, 19.
- Open on Axel's side: none.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | claude:opus agent, effort high: 129,970 tokens, 36 tool uses, 979 s; round 1: 207,120 tokens, 28 tool uses, 1,293 s; round 2: 352,270 tokens, 52 tool uses, 4,615 s | 111,656 tokens, 24 tool uses, 421 s; round 1: 124,041 tokens, 29 tool uses, 778 s; round 2: 144,379 tokens, 34 tool uses, 1,123 s; landing fixes: 91,589 tokens, 19 tool uses, 314 s | 2 (one under the exception, ruling F) | 17, then 12 | 5 files changed, 781 insertions(+), 1 deletion(-) | no | 10 | 1 (open item F) | 61 | 51853 | 121761 | 33845304 | 136 | 172 | none |
| 2 | claude:opus agent, effort high: 209,393 tokens, 73 tool uses, 777 s; round 1: 238,449 tokens, 13 tool uses, 264 s | 174,608 tokens, 36 tool uses, 433 s; round 1: 155,407 tokens, 26 tool uses, 341 s; landing fixes: 74,661 tokens, 19 tool uses, 315 s | 1 | 20 (12 rulings) | 9 files changed, 120 insertions(+), 104 deletions(-) | no | 6 | 0 | 68 | 75477 | 182612 | 48311299 | 154 | 44 | none |
| 3 | claude:opus agent, effort high: 208,057 tokens, 60 tool uses, 623 s; round 1: 238,866 tokens, 11 tool uses, 270 s | 179,173 tokens, 49 tool uses, 460 s; round 1: 143,412 tokens, 35 tool uses, 402 s; landing fixes: 85,655 tokens, 17 tool uses, 315 s | 1 | 12 (8 rulings) | 16 files changed, 145 insertions(+), 122 deletions(-) | no | 12 | 0 | 10 | 9732 | 20013 | 8130367 | 22 | 10 | none |
| 5 | claude:opus agent, effort high: 133,678 tokens, 31 tool uses, 606 s; round 1: 203,386 tokens, 22 tool uses, 559 s | 126,518 tokens, 28 tool uses, 433 s; round 1: 135,722 tokens, 31 tool uses, 484 s; landing fixes: 72,526 tokens, 15 tool uses, 342 s | 1 | 12 (7 rulings) | 3 files changed, 513 insertions(+), 86 deletions(-) | no | 13 | 1 (open item I) | 23 | 16145 | 30037 | 19419115 | 50 | 13 | none |
| 6 | claude:opus agent, effort high: 214,647 tokens, 61 tool uses, 922 s; round 1: 313,152 tokens, 38 tool uses, 781 s | 151,111 tokens, 47 tool uses, 513 s; round 1: 167,715 tokens, 46 tool uses, 480 s; landing fixes: 105,908 tokens, 26 tool uses, 375 s | 1 | 10 (7 rulings) | 5 files changed, 628 insertions(+), 99 deletions(-) | no | 14 | 0 | 83 | 75259 | 217318 | 49232763 | 184 | 63 | none |
| 8 | claude:opus agent, effort high: 183,627 tokens, 37 tool uses, 1,479 s; round 1: 233,528 tokens, 23 tool uses, 2,257 s | 136,212 tokens, 34 tool uses, 539 s; round 1: 115,791 tokens, 24 tool uses, 431 s; landing fixes: 113,847 tokens, 15 tool uses, 299 s | 1 | 7 (5 rulings) | 4 files changed, 334 insertions(+), 31 deletions(-) | no | 10 | 0 | 57 | 49938 | 105681 | 11615352 | 122 | 27 | none |
| 9 | claude:opus agent, effort high: 238,605 tokens, 70 tool uses, 2,222 s; round 1: 294,367 tokens, 92 tool uses, 3,581 s | 152,366 tokens, 29 tool uses, 664 s; round 1: 130,235 tokens, 28 tool uses, 540 s | 1 | 6 (6 rulings) | 8 files changed, 843 insertions(+), 81 deletions(-) | no | 3 | 0 | 117 | 83680 | 363787 | 31728288 | 252 | 184 | none |
| 4 | claude:opus agent, effort high: 310,799 tokens, 80 tool uses, 4,353 s; round 1: 408,123 tokens, 55 tool uses, 2,934 s | 155,977 tokens, 43 tool uses, 898 s; round 1: 166,201 tokens, 29 tool uses, 1,060 s | 1 | 10 (10 rulings) | 7 files changed, 1248 insertions(+), 198 deletions(-) | no | 10 | 0 | 111 | 107879 | 312647 | 22253056 | 226 | 38 | none |
| 6a | claude:opus agent, effort high: 95,179 tokens, 18 tool uses, 339 s; round 1: 118,218 tokens, 12 tool uses, 529 s | 98,347 tokens, 23 tool uses, 329 s; round 1: 95,799 tokens, 26 tool uses, 325 s | 1 | 7 (6 rulings) | 5 files changed, 106 insertions(+), 106 deletions(-) | no | 3 | 0 | 11 | 7751 | 10221 | 1963904 | 22 | 4 | none |
| 11 | claude:opus agent, effort high: 226,019 tokens, 98 tool uses, 875 s; round 1: 355,519 tokens, 35 tool uses, 863 s; round 2: 124,171 tokens, 26 tool uses, 637 s | 270,192 tokens, 46 tool uses, 470 s; round 1: 247,793 tokens, 54 tool uses, 648 s; round 2: 277,802 tokens, 40 tool uses, 533 s | 2 (one under the exception) | 10 (12 rulings), then 13 (12 rulings) | 2 files changed, 51 insertions(+), 51 deletions(-) | no | 14 | 0 | 35 | 33466 | 61996 | 7840516 | 76 | 38 | none |
| 1a | claude:opus agent, effort high: 133,171 tokens, 44 tool uses, 697 s; round 1: 223,764 tokens, 42 tool uses, 931 s | 100,494 tokens, 20 tool uses, 490 s; round 1: 134,695 tokens, 34 tool uses, 833 s | 1 | 7 (8 rulings) | 13 files changed, 234 insertions(+), 90 deletions(-) | no | 6 | 0 | 38 | 34463 | 76696 | 11356769 | 82 | 58 | none |
| 1c | claude:opus agent, effort high: 199,787 tokens, 61 tool uses, 1,692 s; round 1: 257,183 tokens, 38 tool uses, 833 s | 130,251 tokens, 35 tool uses, 572 s; round 1: 100,387 tokens, 21 tool uses, 384 s | 1 | 8 (8 rulings) | 11 files changed, 674 insertions(+), 15 deletions(-) | no | 4 | 0 | 47 | 41917 | 134263 | 7721087 | 102 | 66 | none |
| 12 | claude:opus agent, effort high: 259,411 tokens, 58 tool uses, 692 s; round 1: 315,936 tokens, 20 tool uses, 547 s | 186,224 tokens, 36 tool uses, 451 s; round 1: 101,372 tokens, 25 tool uses, 424 s | 1 | 10 (8 rulings) | 1 file changed, 15 insertions(+), 15 deletions(-) | no | 7 | 0 | 89 | 80935 | 186307 | 21832166 | 186 | 47 | none |
| 13 | claude:opus agent, effort high: 341,486 tokens, 63 tool uses, 1,139 s; round 1: 69,054 tokens, 15 tool uses, 542 s | 270,063 tokens, 43 tool uses, 488 s; round 1: 167,958 tokens, 38 tool uses, 458 s | 1 | 4 (5 rulings) | 1 file changed, 7 insertions(+), 7 deletions(-) | no | 6 | 0 | 60 | 54060 | 170161 | 10545292 | 136 | 51 | none |
| 14 | claude:opus agent, effort high: 215,673 tokens, 128 tool uses, 1,289 s; round 1: 288,032 tokens, 22 tool uses, 518 s | 212,129 tokens, 67 tool uses, 638 s; round 1: 140,991 tokens, 46 tool uses, 525 s | 1 | 13 (9 rulings) | 1 file changed, 24 insertions(+), 24 deletions(-) | no | 7 | 0 | 15 | 15993 | 32470 | 2858340 | 32 | 7 | none |
| 15 | claude:opus agent, effort high: 139,013 tokens, 146 tool uses, 6,742 s; round 1: 312,799 tokens, 59 tool uses, 888 s | 209,446 tokens, 64 tool uses, 1,288 s; round 1: 201,769 tokens, 65 tool uses, 679 s | 1 | 7 (5 rulings) | 29 files changed, 92 insertions(+), 70 deletions(-) | no | 3 | 1 (open item O) | 35 | 31761 | 73082 | 8778410 | 78 | 66 | none |
| 10 | orchestrator, no agent | none (the diff approved by the user, open item Q) | 0 | 0 | 1 file changed, 22 insertions(+), 22 deletions(-) | yes | 0 | 1 (open item Q) | 101 | 102285 | 664529 | 19671793 | 202 | 375 | none; shared with step 16, step 7's relaunch and the wait on the rulings |
| 7a | claude:opus agent, effort high: 246,290 tokens, 76 tool uses, 2,315 s; round 1: 365,182 tokens, 63 tool uses, 3,644 s; round 2: 218,816 tokens, 101 tool uses, 12,118 s | 149,503 tokens, 34 tool uses, 1,028 s; round 1: 165,597 tokens, 42 tool uses, 991 s; round 2: 170,557 tokens, 39 tool uses, 1,563 s | 2 (one under the exception, ruling 5 unbuilt) | 9 (9 rulings), then 1 (4 items) | 17 files changed, 1167 insertions(+), 91 deletions(-) | no | 10 | 0 | 115 | 98508 | 535522 | 23186713 | 242 | 405 | none; shared with step 7's wait |
| 7 | claude:opus, `claude -p` from a shell through `launch.sh` with the launch note: resumed run 55,437 output tokens, 141 turns, 2,811 s; round 1: 42,481 output tokens, 143 turns, 2,602 s | 147,356 tokens, 33 tool uses, 2,172 s; round 1: 120,890 tokens, 27 tool uses, 875 s | 1 | 10 (10 rulings) | 5 files changed, 385 insertions(+), 47 deletions(-) | no | 6 | 0 | 87 | 69187 | 206121 | 24108442 | 202 | 154 | none; shared with step 7b's review and round 1, and ruling T |
| 7b | claude:opus agent, effort high: 258,005 tokens, 97 tool uses, 6,205 s; round 1: 316,580 tokens, 37 tool uses, 3,126 s; round 2: 356,254 tokens, 27 tool uses, 2,146 s (the agent's notification totals) | 163,825 tokens, 41 tool uses, 2,071 s; round 1: 132,302 tokens, 34 tool uses, 1,532 s; round 2: 132,373 tokens, 32 tool uses, 1,448 s | 2 (one under the exception, the brief's What it must do item 1 unbuilt by round 1) | 8 (8 rulings), then 4 (4 rulings) | 5 files changed, 539 insertions(+), 85 deletions(-) | no | 4 | 0 | 49 | 37730 | 91373 | 8081914 | 114 | 137 | none |
| 7c | claude:opus agent, effort high: 191,457 tokens, 77 tool uses, 3,046 s; round 1: 59,184 tokens, 158 tool uses, 18,823 s (the agent's notification totals) | 99,985 tokens, 25 tool uses, 1,409 s; round 1: 135,664 tokens, 43 tool uses, 4,961 s | 1 | 7 (7 rulings) | 6 files changed, 408 insertions(+), 39 deletions(-) | no | 6 | 0 | 38 | 37268 | 557266 | 9246203 | 82 | 486 | none |
| 20 | claude:opus agent: 276,603 tokens, 74 tool uses, 1,238 s; round 1: 305,557 tokens, 14 tool uses, 454 s; round 2: 317,425 tokens, 7 tool uses, 322 s (the agent's notification totals) | 175,814 tokens, 47 tool uses, 698 s; round 1: 133,901 tokens, 38 tool uses, 625 s; round 2: 62,230 tokens, 16 tool uses, 300 s | 2 (round 2 the one beyond the cap) | 7 (6 rulings, then 1) | 29 files changed, 213 insertions(+), 4066 deletions(-) | no | 4 | 0 | 184 | 162453 | 383584 | 46277719 | 408 | 339 (from step 7c's landing; shares the user's rulings U to W, the removal of 7d and the brief of step 20) | none |
