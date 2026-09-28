# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.C of `docs/roadmap.md`, scripts compute facts, and /writing is removed. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/verify.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- sh skills/writing/templates/check_prose.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/writing/references/prose-standard.md] # files every brief tells the builder to read in full, from .agents/plan.yaml; step 1's landing rewrites the second path.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # the default worker.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 1           # steps in flight at once.
bench: []                    # no A/B.
```

```yaml
dispatch:
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Open item A (2026-09-28): who runs the verify list at landing, reopened before step 2 is prepared. Question 2 was ruled (a), the session runs each command at `/land` Steps 6. Under (a) nothing records that every command ran, from the repository root, and that each exit status was read right; a session can skip one or read a red line as green. Running a fixed list and reading each exit status has one exact answer, which the rule "scripts compute facts" gives to a script. Options: (a) as ruled, the session runs the list; `land.sh` does only the git work. (b) `land.sh` runs the state file's `verify:` list itself after the cherry-pick: each command through `bash -o pipefail -c` from the repository root, stopping at the first non-zero exit and printing that command and its output; no `PASS:` line reading, no signal handling and no exit-code table, since decision E makes each command fail by its own exit status; `land.test.sh` gains one case, a red command fails the landing and nothing is committed. Recommendation: (b), since it removes the failure mode (a) has and costs about twenty lines. The lazy option is (a): less code now, and the check left to the session's care.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- The ledger's landing script, from the repository root: `sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/land.sh <step branch> <base>`. It commits a wip in the worktree, copies the step's commits onto main (or prints `nothing to copy` when there are none), runs the verify list on main through `verify.sh`, and prints the booking data; exit 0 passes, 1 is a red check or a stop, 2 a conflict. `land.test.sh` beside it proves it. Step 2's landing is the last that uses it; its landing deletes the four copies, and later steps land through `skills/land/templates/land.sh` as installed after step 3.
- The `verify` list above runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, the worktree and then main, and the lines it prints are what a report or a booking quotes. Step 1's landing removes the `check_prose` line, and step 2's landing rewrites the list from the new `docs/dev/building.md`.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.C, and the rulings in `plan.md`. Ledger: `.scratch/2-c-scripts-compute-facts-and-writing-is-removed/`, with `agents/briefs/` and `agents/reviews/`.
- The v2.0.0 tag holds the text step 1 restores: `git show v2.0.0:<path>`.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-28. The plan is opened; nothing of it has landed. Plan 3's ledger `.scratch/3-the-writing-base/` is still on the tree until step 1's landing.
- Next step: 1, the first of the list and blocked by nothing.
- Open on Axel's side: open item A.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds (up to repair_rounds, or one more under the exception) | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look (views, themes, what was seen) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
