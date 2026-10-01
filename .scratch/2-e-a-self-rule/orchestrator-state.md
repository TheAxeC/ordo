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
self_rule: off               # the default: every open item waits for the user; step 6b sets it on.
next_entry: off              # the default: the orchestrator stops at the closing.
repair_reviewer: claude:sonnet # from .agents/plan.yaml: the run of /refute over a repair round runs on Sonnet.
```

```yaml
dispatch:
- step: 4
  executor: agent
  worker: claude:sonnet
  worktree: .agents/worktrees/2ea-4
  base: 4aa05f2
  launched: 2026-10-01
  report: .scratch/2-e-a-self-rule/agents/reviews/4-report.md
  brief_check: .scratch/2-e-a-self-rule/agents/reviews/4-brief-check.md (aa5bff28e5e1bed90, claude-opus-5-5 (ordo-high), 209247 tokens, 56 tool uses, 10 min 47 s)
  landing: not-started
  round: 0
  session_id: ae1c05d01d496c9b9 (claude-sonnet-5-5)
  builder_usage: 334341 tokens, 81 tool uses, 41 min 7 s
  reviewer_report:
  - .scratch/2-e-a-self-rule/agents/reviews/4-refuter.md (a7eae9ce124bd2bd6, claude-opus-5-5 (ordo-high), 251863 tokens, 67 tool uses, 16 min 58 s)
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by the user's ruling; what is settled belongs in the closed list.

- Open item A (2026-10-01): step 4, where the cost script takes each response's output count. Stop "A wrong premise", raised from finding Spec 1 of `agents/reviews/4-refuter.md`.
  - What the tree shows against the step's text. The goal says the script prices each role "from the agents' transcripts", and the brief's Decision 2 takes the last entry of a `message.id` and `requestId` pair as the response's final counts. A subagent's transcript does not record the final output count of most responses. Its last entry is written mid-stream with `stop_reason` null. `agent-af948d39c18780b67.jsonl:202` (builder of step 2) is a 59,564-character tool call recorded with `output_tokens` 4. Over this plan's 15 agents, 470 of 498 responses end with a null `stop_reason`. The recorded output is 10,303 tokens ($0.17). The visible text and tool input of the same responses is about 168,544 tokens at 4 characters per token ($2.50), and 372 thinking blocks are not counted. The input and cache counts are final: over all 14,552 repeated entries of the project's subagent files, none differs in input or cache counts from the entry before it. The main session's transcript has no null `stop_reason` in its 838 responses. The Claude Code documentation (code.claude.com/docs/en/monitoring-usage) gives the exact count in the telemetry event `claude_code.api_request`, which carries `request_id`, `model`, `input_tokens`, `output_tokens`, `cache_read_tokens` and `cache_creation_tokens`. No hook input, Agent tool result or completion notice carries a token breakdown.
  - Option A, output from telemetry. You turn on Claude Code telemetry (`CLAUDE_CODE_ENABLE_TELEMETRY=1` with a logs exporter that keeps the `claude_code.api_request` events in a file: a local OTLP collector, or `OTEL_LOG_RAW_API_BODIES=file:<dir>`, which writes every request and response body). The script then reads input and cache counts from the transcript, and each response's output from the event whose `request_id` equals the transcript's `requestId`. A response with no event is an error. Pros: exact output for every agent from the day it is on. Cons: a setting and a running exporter on your machine, outside the repository. Plan 2.E and steps 1 to 4 of this plan ran without it, so the gate's figures for plan 2.E and for this plan cannot be produced, and the gate needs rewording. The goal's "from the agents' transcripts" changes, which needs a new ADR beside 0008.
  - Option B, transcripts only, output as a floor. The script keeps the transcript as its only source. The output column and every cost are headed as a floor. Each agent row gives the number of responses whose last entry has no stop reason. Pros: inside the repository, and it prices plan 2.E and this plan alike. Cons: the output is understated by an amount nobody knows. In this plan it is 10,303 tokens recorded against about 168,544 visible, with thinking unknown. The comparison of 2.E with 2.E.A is then a comparison of input and cache, plus a floor on output.
  - Option C, both. The script takes output from the telemetry event where one exists, and otherwise uses the transcript's count, marked as a floor in that agent's row. You turn on telemetry as in A. Pros: exact output from now on, and every earlier agent still priced, with what is exact and what is a floor visible per row. Pros, continued: the gate keeps its plan 2.E figure. Cons: two sources in one script, and your setting as in A. The goal and ADR change as in A, with "a floor where no event exists" added.
  - Recommendation: C. It is the only option that ends the missing count for every plan from now on while still pricing plan 2.E and the steps of this plan already run. A leaves the gate's plan 2.E figure impossible. The lazy option is B: it costs least and leaves the output count missing for every plan.
  - Held with this ruling: the review's other four findings (an indented bullet with no case; the README sentence of 43 words and its placement; a plan number in the test's head comment; the closing bullet of `plan` against the definition of "A red check"). They go to the builder in repair round 1 together with the change the ruling makes, so the one round the cap allows carries everything. Step 5 waits on step 4. Steps 6 onwards do not.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none.

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

- 2026-10-01. Steps 1, 2 and 3 landed; step 3's booking is in `plan.md` and its landing report at `agents/reviews/3-landing.md`.
- Verified: `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` on main after the fixes at landing printed `checks: 10 commands passed`.
- Step 4 is built and refuted once (`agents/reviews/4-report.md`, `agents/reviews/4-refuter.md`) and stopped on Open item A; its builder is kept for repair round 1, which follows the ruling. Its run over a repair round is the first dispatched on `repair_reviewer` (claude:sonnet); its booking carries step 3's check ("Blocked, and by what").
- Next step: 6, self-rule in the loop. Step 5 waits on step 4.
- Open on Axel's side: Open item A.
