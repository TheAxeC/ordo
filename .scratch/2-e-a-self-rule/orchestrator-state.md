# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.E.A of `docs/roadmap.md`, self-rule. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
- sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # the default worker, from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check and the lookups of /grill run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # from .agents/plan.yaml; two steps share a file only when the merge at landing is judged simple.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder.
design_bar: industry         # the default.
design_references: []        # none.
worker_effort: high          # the default.
reviewer_effort: high        # the default.
self_rule: on                # step 6b: the steps after step 6 run under self-rule (D9).
next_entry: off              # the default: the orchestrator stops at the closing.
repair_reviewer: claude:sonnet # from .agents/plan.yaml: the run of /refute over a repair round runs on Sonnet.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.

- Open item J (2026-10-01): your reading of step 10's page, `.scratch/2-e-a-self-rule/agents/reviews/10-cost.md`, the priced usage of plans 2.E and 2.E.A and the brief checks that met dictated text. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.
- Open item K (2026-10-01): your reading of step 11's page, `.scratch/2-e-a-self-rule/agents/reviews/11-self-rule.md`, how this plan's open items ended under self-rule. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-01: Open item A, where the cost script takes each response's output count: ruled C by the user. Each response's counts come from its response body under `OTEL_LOG_RAW_API_BODIES` where the body exists, and from the transcript otherwise, that agent's row marked as a lower bound; ADR 0009; the user turns the setting on; the goal's sentence changes through a roadmap diff, Open item C.
- 2026-10-01: Open item B, self-rule against the written rules and the reach of kind 3: ruled (a) and (a) by the user. An exception sentence joins the shared-rules template, and the user adds it to `~/.claude/CLAUDE.md`; kind 3 is read narrow.
- 2026-10-01: Open item C, the roadmap diff of Open item A's ruling: ruled (a) by the user. `docs/roadmap.md` entry 2.E.A's Goal names the response bodies, and the transcripts as a lower bound; the Rulings line "Open item C".
- 2026-10-01: Open item D, the body folder a tool shell cannot see: ruled (a) by the user. The script falls back to the key `env.OTEL_LOG_RAW_API_BODIES` of the three Claude Code settings files; ADR 0009 amended; fixed at step 4's landing.
- 2026-10-01: Open item E, `/grill` against ADR 0004 on a "(self-rule)" quoted ruling's roadmap diff: ruled (c), changed, by the user. `/grill` accepts it as ADR 0004 says, round brief item 7 undone at step 6's landing; step 7 makes `/roadmap add` accept a "(self-rule)" bullet for work a finding names; the Rulings line "Open item E".
- 2026-10-01: Open item F, how `/grill` and `/plan` know that the loop runs them in next-entry mode: closed under self-rule, C1.
- 2026-10-01: Open item G, how a quoted ruling ending "(self-rule)" names the finding whose work `/roadmap add` may write: closed under self-rule, C2.
- 2026-10-01: Open item H, whether the shared rule on self-rule covers `/grill` and `/plan` run with `--self-rule`: ruled (a) by the user. The template sentence joins step 8; the user puts the same words in `~/.claude/CLAUDE.md`.
- 2026-10-01: C1, how `/grill` and `/plan` know that the loop runs them in next-entry mode: agreed by the user.
- 2026-10-01: C2, how a quoted ruling ending "(self-rule)" names the finding whose work `/roadmap add` may write: agreed by the user.
- 2026-10-01: Open item M, the closing of a plan whose ledger names no agent: closed under self-rule, C3.
- 2026-10-01: Open item I, how step 9's run reaches the skill text of steps 6 to 8: ruled (a) by the user. Main's head is tagged `v2.8.0-rc.1` and pinned before step 9's run, and the pin restored to v2.7.0 after it.
- 2026-10-01: Open item L, when and which part of a skill's version is raised: ruled (a) by the user. Step 12 writes the rule into `docs/dev/skill-layout.md` and raises the eleven versions by it.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and its rules files: the skills' agents do the work; no claim about state without a command; the end state only; plain prose and ASCII; open items in plain text with options, one recommendation and the lazy option named.
- Commits: a capitalised imperative subject, then `- Verb` bullets; add by path. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above, each command from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.E.A, the Rulings of `plan.md`, ADRs 0004 to 0008. Ledger: `.scratch/2-e-a-self-rule/`, with `agents/briefs/` and `agents/reviews/`.
- The data the steps read: the agents' transcripts under `~/.claude/projects/`, read only.
- Anything running that a step must not disturb: none. Plan 2.F is paused until this plan lands (`.scratch/2-f-diagnose/orchestrator-state.md`).

## Current position (rewritten before every step commit)

- 2026-10-01. Steps 1 to 8 and 6b landed; their bookings are in `plan.md`, step 8's landing report at `agents/reviews/8-landing.md`. Steps 10 and 11 landed, their pages waiting for the user's reading (Open items J and K). Step 11b, added by Open item M (closed under self-rule, C3), is in preparation; then step 12 under ruling L, then step 9 under ruling I, so the tag `v2.8.0-rc.1` and the pin carry steps 11b and 12. `self_rule: on`: an open item outside the six kinds is closed with its recommendation and written to `.scratch/choices.md`.
- Verified: `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` on main after step 8's merge with step 7 and its fix at landing printed `checks: 11 commands passed`, exit 0.
- Open items A to H ruled; C1 and C2 agreed by the user, and `.scratch/choices.md` holds no choice. The setting of ADR 0009 is in `~/.claude/settings.json`. Ruling H's sentence, now at `skills/repo-setup/templates/shared-rules.md:20`, is for the user to put in `~/.claude/CLAUDE.md`, in place of ruling B's.
