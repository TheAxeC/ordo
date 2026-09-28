# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 3 of `docs/roadmap.md`, the writing base. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
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
standards: [docs/dev/skill-layout.md, skills/writing/references/prose-standard.md] # files every brief tells the builder to read in full (ruling A).
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

- None.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-09-28: open item J (the report shape of `/writing`): superseded by the user's ruling on the review of Ordo: `/writing` is thrown out whole, plan 3 stops at step 5, and entry 3 is redone.

- 2026-09-28: open item I (three kinds of wrong flags of the checking script on the FWO proposal): closed by the user: the script is an indication and never the truth, and it is not made more exact; its flags are judged by reading.

- 2026-09-28: open item H (step 5 needs `/writing`, and the installed skills are pinned at v2.0.0): ruled (a); main is tagged v2.1.0 at step 4's landing commit f05fb35 and `utils/pin.sh v2.1.0` is run, so step 5 invokes `/writing` as installed.

- 2026-09-28: open item G (the no-history rule in the prose standard, raised in step 4's repair round): ruled (a); prose standard section 0 carries the rule, with past-events text exempt.

- 2026-09-28: open item F (the verify list red at land.test.sh in this session): ruled (a); step 2a is widened to make land.test.sh keep the caller's Python user site, sent in its repair round.

- 2026-09-28: open item E (the LaTeX data-row rule of step 2a): ruled (b); a one-command line is prose when its command carries prose or it is a brace group opened by a size or font switch, and step 2a's line is rewritten to it.

- 2026-09-28: open item D (whether the `contrast` check counts the one-sentence form joined by a dash, a colon or a semicolon): ruled (c); the check is not widened, and step 2a corrects `anti-patterns.md`'s row. Step 5's draft named: research-hub `funding/2026-fwo-senior-transplant/proposal/main.tex`.

- 2026-09-28: open item C (the work the review over step 2's last round left on the checking script): ruled (a); step 2a added before step 4.

- 2026-09-28: open item B (whether change standard rule 10's "no double blank lines" covers Python code): ruled (b); rule 10 is reworded at step 2's landing so the blank-line limit is for prose and comments, and Python code keeps two blank lines between top-level definitions.

- 2026-09-28: open item A (the files every brief tells the builder to read): ruled (a); `standards` added to `.agents/plan.yaml` and to the block above, and step 1 changes the prose standard's path in both.

- 2026-09-28: the step list, and questions 1 and 2 of the draft: approved; question 1 (a), question 2 (a).

## The standing demands (from Axel, in force)

- `~/.claude-work/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- The ledger's landing script, from the repository root: `sh .scratch/3-the-writing-base/land.sh <step branch> <base> --session <session log> --since <previous landing commit time>`. It commits a wip in the worktree, copies the step's commits onto main (or prints `nothing to copy` when there are none), runs the verify list on main through `verify.sh`, and prints the booking data; exit 0 passes, 1 is a red check or a stop, 2 a conflict. `land.test.sh` beside it proves it.
- The `verify` list above runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, the worktree and then main, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 3, `docs/academic-coverage.md` (the three `rebuild: writing` rows), `docs/dev/skill-layout.md`. Ledger: `.scratch/3-the-writing-base/`, with `agents/briefs/` and `agents/reviews/`.
- The source files the steps read, read only: `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/references/academic_writing_style.md`, `writing_judgment_framework.md` and `writing_quality_check.md`.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-28. Steps 1, 2, 3, 2a and 4 landed: the prose standard is `skills/writing/references/prose-standard.md`, `skills/writing/templates/check_prose.py` with its test is in the verify list and every branch has a case, the reference pages are in `skills/writing/references/`, and `skills/writing/SKILL.md` gives `/writing <file>`. The installed skills are v2.0.0.
- Next: step 5, a real draft of the user's: the orchestrator runs `/writing` on `/Users/axelfaes/workspace/research-hub/funding/2026-fwo-senior-transplant/proposal/main.tex` (read only), and the user reviews what it flags.
- Open on Axel's side: the plan for the fix of Ordo, the usage table, and how far "everything of /writing" reaches.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | claude:opus agent: 91,634 tokens, 28 tool uses, 371 s; round 1: 132,384 tokens, 14 tool uses, 302 s | 113,019 tokens, 20 tool uses, 470 s; round 1: 121,092 tokens, 23 tool uses, 530 s | 1 | 5 (4 rulings) | 5 files changed, 11 insertions(+), 9 deletions(-) | no | 1 | 0 | 66 | 54292 | 223787 | 16479072 | 140 | 62 | none |
| 2 | claude:opus agent: 304,209 tokens, 56 tool uses, 3,007 s (a cases hand-back at 933 s); round 1: 267,170 tokens, 97 tool uses, 5,083 s | 209,060 tokens, 44 tool uses, 891 s; round 1: 222,949 tokens, 48 tool uses, 980 s | 1 | 18 (12 rulings) | 4 files changed, 2064 insertions(+) | no | 5 | 1 (open item C) | 73 | 69778 | 150164 | 16379009 | 156 | 180 | none |
| 3 | claude:opus agent: 174,888 tokens, 34 tool uses, 1,299 s (a cases hand-back at 363 s); round 1: 279,075 tokens, 26 tool uses, 775 s | 156,305 tokens, 34 tool uses, 542 s; round 1: 183,552 tokens, 41 tool uses, 601 s | 1 | 15 (14 rulings) | 3 files changed, 220 insertions(+) | no | 11 | 1 (open item D) | 53 | 49542 | 170570 | 12031800 | 116 | 66 | none |
| 2a | claude:opus agent: 294,024 tokens, 77 tool uses, 2,597 s; round 1: 340,972 tokens, 33 tool uses, 1,713 s | 193,551 tokens, 59 tool uses, 1,506 s; round 1: 163,742 tokens, 46 tool uses, 1,408 s | 1 | 7 (9 rulings, with ruling F) | 4 files changed, 384 insertions(+), 48 deletions(-) | no | 5 | 1 (open item F) | 66 | 74190 | 370808 | 15085270 | 140 | 159 | none |
| 4 | claude:opus agent: 139,752 tokens, 31 tool uses, 627 s; round 1: 197,913 tokens, 24 tool uses, 718 s | 138,084 tokens, 38 tool uses, 491 s; round 1: 155,647 tokens, 37 tool uses, 650 s | 1 | 6 (7 rulings, with ruling G) | 5 files changed, 119 insertions(+), 5 deletions(-) | no | 5 | 1 (open item G) | 60 | 42542 | 194569 | 10521498 | 128 | 55 | none |
