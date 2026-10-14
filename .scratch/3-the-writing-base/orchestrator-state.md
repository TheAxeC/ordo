# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 3 of `docs/roadmap.md`, the writing base. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # steps in flight at once, from .agents/plan.yaml.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch:
- step: 9
  brief_check: "running: aa2534267459358b5"
  landing: preparing
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

none

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-05: Open items Gate 3 and Gate 3b, the gate's conditions, and Open item A, the step list: ruled by Axel.
- 2026-10-13: Open item B, the project argument of `/writing` (brief check of step 1, finding F7): closed under self-rule, C68.
- 2026-10-13: Open item C, the comments of `.agents/plan.yaml`: ruled (a) by the user.
- 2026-10-13: Open item D, `/writing` not installed for step 2: ruled (a) by the user, tag `v7.1.0-rc.1` and pin.
- 2026-10-13: Open item E, where the gate failures of step 2's runs are fixed (refuter of step 2, finding S1): closed under self-rule, C69.
- 2026-10-13: Open item F, the rerun of step 3 needs a pin: ruled (a) by the user, step 3 split, tag `v7.1.0-rc.2` and pin after step 3 lands.
- 2026-10-13: Open item G, how the manuscript markers of step 4 get the report: closed under self-rule, C70.
- 2026-10-13: Open item H, step 4's check failed: ruled (a) by the user, step 5 the second fixes with tag `v7.1.0-rc.3` and pin, step 6 the third runs, step 7 the closing.
- 2026-10-13: Open item I, step 6's check failed: ruled (a) with a stopping rule by the user, step 7 the third fixes with tag `v7.1.0-rc.4` and pin, step 8 the last runs, step 9 the last fixes only when step 8 leaves a failure, with tag `v7.1.0-rc.5` and pin, step 10 the closing.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 3, the rulings in `plan.md`, and ADRs 0001, 0002 and 0003. Sources: research-hub's `.agents/skills/academic-paper/references/academic_writing_style.md`, `writing_judgment_framework.md` and `writing_quality_check.md`, read only. Ledger: `.scratch/3-the-writing-base/`, with `agents/briefs/` and `agents/reviews/`.

## Current position (rewritten before every step commit)

- 2026-10-13. Step 1 stopped after its brief check, on Open item C, which the user ruled (a); Open item B closed under self-rule (C68). The brief check's report is `agents/reviews/1-brief-check.md`, its Closed heading listing the change to the brief for each finding.
- 2026-10-13. Step 1 prepared at base 4c51680 and its builder launched (ad8dec496562b2dbf, claude-sonnet-5-5).
- 2026-10-13. Step 1 built and refuted (`agents/reviews/1-refuter.md`); repair round 1 sent with the rulings in `agents/briefs/1-round-1.md`.
- 2026-10-13. Step 1 landed (`agents/reviews/1-landing.md`).
- 2026-10-13. Step 2 stopped at its `/spec` premise check on Open item D: `/writing` is not installed.
- 2026-10-13. Open item D ruled (a) by the user: main's head tagged `v7.1.0-rc.1` and pinned.
- 2026-10-13. Step 2 prepared at base e00f6bd, executor inline (orchestrator, no agent).
- 2026-10-13. Step 2 run inline: both `/writing` runs and four markers; refuted (`agents/reviews/2-refuter.md`); repair round 1 sent (`agents/briefs/2-round-1.md`); Open item E closed under self-rule (C69), widening step 3.
- 2026-10-13. Step 2 landed (`agents/reviews/2-landing.md`).
- 2026-10-13. Step 3 stopped at its `/spec` premise check on Open item F: the rerun needs the fixes tagged and pinned, which a step cannot do before it lands.
- 2026-10-13. Open item F ruled (a) by the user: step 3 the fixes, then tag `v7.1.0-rc.2` and pin, step 4 the repeated runs, step 5 the closing.
- 2026-10-13. Step 3 prepared at base aa513eb (brief check `agents/reviews/3-brief-check.md`, 17 findings closed in the brief) and its builder launched (a248d03293a97a4ad, claude-sonnet-5-5).
- 2026-10-13. Step 3's builder handed back a case its brief got wrong; ruled in `agents/briefs/3-cases.md` (7a2d3a4) and the builder resumed.
- 2026-10-13. The user asked to pause once step 3's builder reports: its report is saved and read, and nothing further (no `/refute`) runs until the user says to go on.
- 2026-10-13. Step 3 built; its report saved at `agents/reviews/3-report.md` and the diff read. Paused, as the user asked.
- 2026-10-13. The user said to go on. Step 3 refuted (11 findings); repair round 1 sent to the builder with `agents/briefs/3-round-1.md`.
- 2026-10-13. Step 3's builder closed repair round 1; the run over round 1 found three findings, fixed at landing.
- 2026-10-13. Step 3 landed (`agents/reviews/3-landing.md`).
- 2026-10-13. Main's head 68c14d8 tagged `v7.1.0-rc.2` and pinned (`sh utils/pin.sh v7.1.0-rc.2`: "pinned: v7.1.0-rc.2 (68c14d8), 14 skills linked"), as ruling F approves.
- 2026-10-13. Step 4 prepared at base 295b1e8 (brief check `agents/reviews/4-brief-check.md`, 18 findings closed in the brief), executor inline (orchestrator, no agent).
- 2026-10-13. Step 4 prepared at base 295b1e8, executor inline; both `/writing` runs and four markers done; the check failed (`agents/reviews/4-report.md`); Open item G closed under self-rule (C70); Open item H ruled (a) by the user: steps 5 and 6 added, the closing becomes step 7; `/refute 3 4` running.
- 2026-10-13. Step 4's repair round 1 built inline and refuted over the round (three findings, fixed at landing).
- 2026-10-13. Step 4 landed unticked, as ruling H says (`agents/reviews/4-landing.md`).
- 2026-10-13. Step 5 prepared at base e691c84 (brief check `agents/reviews/5-brief-check.md`, 25 findings closed in the brief) and its builder launched (a2237d2ff6d37342a, claude-sonnet-5-5).
- 2026-10-13. Step 5 refuted (`agents/reviews/5-refuter.md`); repair round 1 sent with `agents/briefs/5-round-1.md` (8fbedf7); the run over round 1 found three findings in the report, fixed at landing.
- 2026-10-13. Step 5 landed (`agents/reviews/5-landing.md`).
- 2026-10-13. Main's head ce30787 tagged `v7.1.0-rc.3` and pinned (`sh utils/pin.sh v7.1.0-rc.3`: "pinned: v7.1.0-rc.3 (ce30787), 14 skills linked"), as ruling H approves.
- 2026-10-13. Step 6 prepared at base 178bc42 (brief check `agents/reviews/6-brief-check.md`, 14 findings closed in the brief), executor inline (orchestrator, no agent).
- 2026-10-13. Step 6 run inline: both `/writing` runs and four markers; the check failed (`agents/reviews/6-report.md`); refuted, repair round 1 sent (`agents/briefs/6-round-1.md`, c4a25f1); the run over round 1 found three findings in the report, fixed at landing.
- 2026-10-13. Step 6 landed unticked (`agents/reviews/6-landing.md`); Open item I raised to the user.
- 2026-10-13. Open item I ruled (a) with a stopping rule by the user: step 7 the third fixes, step 8 the last runs, step 9 the last fixes when step 8 leaves a failure, step 10 the closing.
- 2026-10-13. Step 7 prepared at base c99b4a6 (brief check `agents/reviews/7-brief-check.md`, every finding closed in the brief) and its builder launched (a09a39ebd2fcccd6b, claude-sonnet-5-5).
- 2026-10-13. Step 7's builder handed back case C1 after its first read; ruled in `agents/briefs/7-cases.md` and the builder resumed.
- 2026-10-13. Step 7 built and refuted (`agents/reviews/7-refuter.md`); repair round 1 sent with `agents/briefs/7-round-1.md`.
- 2026-10-13. Step 7's round 1 built; the run over round 1 found ten findings, fixed at landing.
- 2026-10-13. Step 7 landed (`agents/reviews/7-landing.md`).
- 2026-10-13. Main's head 09601dc tagged `v7.1.0-rc.4` and pinned (`sh utils/pin.sh v7.1.0-rc.4`: "pinned: v7.1.0-rc.4 (09601dc), 14 skills linked"), as ruling I approves.
- 2026-10-13. Step 8 prepared at base a34bfbf (brief check `agents/reviews/8-brief-check.md`, eight findings closed in the brief), executor inline (orchestrator, no agent).
- 2026-10-13. Step 8's manuscript run done (review agent ad512c438c546f57c, claude-opus-5-5, 179068 tokens, 38 tool uses, 28.7 min); its report shown whole. The user asked to pause once the agent was done, so the grant run was not invoked in the turn the manuscript agent's notice started; the user then said to continue, and the grant run starts in that later turn. Step 8's report states this under gate condition 4.
- 2026-10-14. Step 8's grant run done (review agent ab89cdca00b160e9a, claude-opus-5-5, 175667 tokens, 6 tool uses, 15.8 min); its report shown whole. At the user's next message both reports were saved into `agents/reviews/8-run/` (helper rerun and `cmp` exit 0 for both) and the four markers started, each served claude-opus-5-5 as `ordo-high`: manuscript a8f3e0b981dc00ca4 and aa83277990558acd9, grant a5b964c740016412e and a136ed68531e76d65.
- 2026-10-14. Three markers done, marks saved in `8-run/`: grant marker 1 (a5b964c740016412e, 192438 tokens, 9 tool uses, 15.0 min), grant marker 2 (a136ed68531e76d65, 166605 tokens, 7 tool uses, 11.3 min), manuscript marker 1 (a8f3e0b981dc00ca4, 285965 tokens, 43 tool uses, 21.0 min).
- 2026-10-14. Manuscript marker 2 done (aa83277990558acd9, 213568 tokens, 40 tool uses, 29.4 min), marks saved in `8-run/manuscript-marks-2.md`.
- 2026-10-14. Grant marker 1 and manuscript marker 2 resumed once for missing reasons, no mark changed; `agents/reviews/8-marks.md` and `agents/reviews/8-report.md` written. The check fails: 48 manuscript and 35 grant rows not marked right by both, gate conditions 2, 5 and 6 failing; by ruling I step 9 follows.
- 2026-10-14. Step 8 refuted (`agents/reviews/8-refuter.md`, aa417a503739647c4); repair round 1 sent with `agents/briefs/8-round-1.md` (3328be4) and built inline: the six rulings applied in `8-report.md` and `8-marks.md`, manuscript marker 1 resumed once (`8-run/manuscript-marks-1-resume.md`, no mark changed).
- 2026-10-14. The run over round 1 (ab480b5eb42266865, claude-sonnet-5-5) found Proof 1, Standards 1 and Standards 2, all fixed at landing. Step 8 landed unticked, its check failed (`agents/reviews/8-landing.md`); by ruling I step 9 follows.
- Next: `/spec 3 9`, the last fixes, then tag `v7.1.0-rc.5` and pin after it lands (approved by ruling I), then step 10, the closing.
