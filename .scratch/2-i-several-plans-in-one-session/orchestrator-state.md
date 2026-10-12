# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.I of `docs/roadmap.md`, several plans in one session. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
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
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- Open item ADR 0012, the landing commit's paths (2026-10-12, kind 3: a decision record the user ruled, D29). `docs/adr/0012-every-commit-on-main-names-its-paths.md` says "The landing commit takes its paths from `git diff --cached --name-only`." For a step that renames a file that command lists only the new path, so a commit naming only those paths leaves the old path's deletion staged, and the next commit on main sweeps it in (scratch run in `agents/reviews/1-refuter.md`, Verification). Step 1's `land` text uses `git diff --cached --name-only --no-renames`, which lists both.
  - Option (a), recommended: add "with `--no-renames`" to the ADR's sentence, so the record names the command the skill runs. Pro: the record and the skill agree, and a reader of the ADR gets a complete commit. Con: a change to the text of a record you ruled.
  - Option (b): leave the ADR as it is. Pro: your record stays word for word. Con: the ADR names a command that leaves a rename's old path out, and a reader who follows the ADR gets that defect.
  - Recommendation: (a). The lazy option is (b).

- Open item Step 2, how the real run invokes step 1's texts (2026-10-12, kinds 3 and 4: your rule that a skill's work is done by invoking the skill, and a tag and a pin). Step 2's line has the orchestrator run "the loop of step 1's texts, read from the repository". The Skill tool loads the pinned install: `~/.claude-backup/skills/spec` links to `~/.local/share/ordo-stable/skills/spec`, the pinned worktree is at `v5.0.0`, and its `plan-orchestration` is version 4.0.0 and its `spec` 4.1.0, where main holds step 1's 5.0.0 of both (`grep -n 'version:'` over both copies). A run through the Skill tool today would run the texts from before step 1, and a run that reads step 1's files and follows them by hand breaks your rule. No brief is written until this is ruled.
  - Option (a), recommended: tag main's head as `v6.0.0-rc.1` and run `utils/pin.sh v6.0.0-rc.1`; the orchestrator then runs step 2 in this session, in the scratch repository, invoking `/plan-orchestration`, `/spec`, `/refute` and `/land` through the Skill tool, which load step 1's texts from the pin. The closing tags `v6.0.0` and pins it as usual. Pro: every skill is invoked, and the run tests the install a user gets. Con: until the closing, every Claude Code session on this machine, the research-hub session included, runs the unreleased texts of the pin, and a defect step 2 finds is live there until its fix lands and is pinned.
  - Option (b): you start a fresh Claude Code session with `CLAUDE_CONFIG_DIR` set to a scratch folder whose `skills` entries link to this repository's `skills/`, log in there, and that session runs step 2 as its orchestrator; this session books the run. Pro: the stable pin and your other sessions are untouched. Con: it needs your login and your hands, against the step's "with nothing asked of the user", and the run is not the installed path a user gets.
  - Option (c): this session reads step 1's skill files from the repository and follows them by hand, without the Skill tool. Pro: no pin and nothing asked of you. Con: it breaks your rule that a skill's work is done by invoking the skill, and it tests texts read by hand, not the skills as installed.
  - Recommendation: (a). The lazy option is (c).

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-05: Open item A, the step list as drafted: closed under self-rule, C34.
- 2026-10-12: Open item Step 1, the projects form (the brief check `agents/reviews/1-brief-check.md`, section 3, finding 3): closed under self-rule, C39.
- 2026-10-07: C5, goal part, every open plan in one session: agreed by the user.
- 2026-10-07: C6, goal part, the roadmap's order: agreed by the user.
- 2026-10-07: C7, goal part, paths compared across plans: agreed by the user.
- 2026-10-07: C8, goal part, one limit across plans: agreed by the user.
- 2026-10-07: C9, goal part, landings one at a time across plans: agreed by the user.
- 2026-10-07: C10, goal part, one report: agreed by the user.
- 2026-10-07: C11, goal part, the current verify list: agreed by the user.
- 2026-10-07: C12, gate part, one real run over two plans sharing a file: agreed by the user.
- 2026-10-07: C13, gate part, the first plan in roadmap order starts: agreed by the user.
- 2026-10-07: C14, gate part, the second plan's step waits: agreed by the user.
- 2026-10-07: C15, gate part, the limit never exceeded: agreed by the user.
- 2026-10-07: C16, gate part, no overlapping landings: agreed by the user.
- 2026-10-07: C17, gate part, a new test command reaches the other plan: agreed by the user.
- 2026-10-07: C18, where the limit on steps in flight is read: agreed by the user.
- 2026-10-07: C19, how each plan's verify list stays equal to the verification page: agreed by the user.
- 2026-10-07: C20, where the steps in flight of every plan are recorded: agreed by the user.
- 2026-10-07: C21, worktree and branch names across plans: agreed by the user.
- 2026-10-07: C22, commits that cannot take another plan's staged landing: agreed by the user.
- 2026-10-07: C23, which plan's commit carries a record: agreed by the user.
- 2026-10-07: C24, the order steps of several plans are picked in: agreed by the user.
- 2026-10-07: C25, the rules of two steps in flight across plans: agreed by the user.
- 2026-10-07: C26, the scope of a pause: agreed by the user.
- 2026-10-07: C27, the shape of the one report: agreed by the user.
- 2026-10-07: C28, what a plan's state file describes after another plan's commit: agreed by the user.
- 2026-10-07: C29, next-entry mode while other plans are open: agreed by the user.
- 2026-10-07: C30, the recurring-findings pass and the night rule across plans: agreed by the user.
- 2026-10-07: C31, the invocations that run several plans: agreed by the user.
- 2026-10-07: C32, record as ADR?: agreed by the user.
- 2026-10-07: C33, the roadmap diff of entry 2.I: agreed by the user.
- 2026-10-07: C34, the step list of plan 2.I as drafted: agreed by the user.

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

- Design: `docs/roadmap.md` entry 2.I, the rulings in `plan.md`, and ADRs 0010, 0011 and 0012. Ledger: `.scratch/2-i-several-plans-in-one-session/`, with `agents/briefs/` and `agents/reviews/`.

## Current position (rewritten before every step commit)

- 2026-10-12. Step 1 of 3 landed: several plans in one session in the skill texts, booked in `plan.md` with its landing report `agents/reviews/1-landing.md`.
- Next step: 2, the real run in a scratch repository (orchestrator, no agent).
- Plan 3's configuration block still holds `workers_at_once: 3` at line 27, removed at plan 3's next resume point (brief 1, Decisions 5); the texts read it as absent until then.
- Step 2 stopped at /spec: open item "Step 2, how the real run invokes step 1's texts"; no brief, worktree or dispatch entry.
- Open on Axel's side: the open items "ADR 0012, the landing commit's paths" and "Step 2, how the real run invokes step 1's texts".
