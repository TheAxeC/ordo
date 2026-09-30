# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.H of `docs/roadmap.md`, session-retro. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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
worker: claude:sonnet        # the default worker.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent.
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
reviewer_effort: high        # the effort a reviewer and a brief-check agent run at: low, medium, high, xhigh or max.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Step 2 reading (2026-09-30): step 2, the `session-retro` skill, landed unticked, since its check is your reading of `skills/session-retro/SKILL.md` and `templates/sessions.md` against `docs/dev/skill-layout.md` and the Goal (ruling "Overnight work applies to this plan"). Step 3's round reviewer found one sentence to correct in it: the opening sentence of "The reader" says the script prints the transcripts "with each secret replaced by `<REDACTED>`", while the same section says a YAML value on the line after its name is not redacted; the correction is "with the secrets of the forms it knows replaced by `<REDACTED>`", which the glossary's **reader, of the transcripts** already says. Options: (a) you read it and tick step 2, or name what is wrong, the sentence above corrected as a fix of step 2; (b) tick it unread. Recommendation (a). The lazy option is (b).

- Recurring findings (2026-09-30): the pass over the 22 refuter reports of plans 2.E, 2.F, 2.G and 2.H (`agents/reviews/recurring-findings-2026-09-30.md`, each finding cited) found six kinds in three or more steps. Each proposal changes the `spec` skill's text, which is Ordo's `skills/spec/` and reaches the installed skill only through a pin. For each, the options are (a) the change as proposed, (b) a different wording you give, (c) no change; the lazy option is (c) in each, since the kind then recurs.
  - Kind 1, text a brief dictates word for word that breaks a standard or is false (5 steps, 3 plans). Now: the brief check checks names, the step line, premises, cases, the question and implied inputs. Change: a seventh check in `spec` "Steps / The brief check" 2, "Dictated text. Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout) is read against the prose standard, `docs/dev/skill-layout.md` and the glossary as a diff would be, and each place it breaks one is named." Why: the orchestrator's dictated texts reach main unreviewed until the refuter, and 2.H step 3's five findings were all in them. Recommendation (a).
  - Kind 2, the builder's report leaves out or paraphrases evidence (9 steps, 4 plans). Now: `templates/brief.md` "Report" asks for each case's first-run result and the checks' output verbatim. Change: that sentence becomes "Then the cases' first run: every case of "Cases" by its name, none left out, each with the command or the reading that checked it and its output as printed. Then the DONE / NOT DONE table with the checks above and their output as printed, the ASCII command's line and its exit status included; a line shortened with "..." is not verbatim." Why: each of the nine was a case or a line left out or shortened while the report said verbatim. Recommendation (a).
  - Kind 3, a term used outside its glossary sense, or an entry the change makes false (11 steps, 3 plans). Now: `docs/dev/skill-layout.md` "Writing for an agent" states the rule; no brief asks for the check. Change: `templates/brief.md` "Report" adds "Then the terms: each term of `docs/glossary.md` the diff adds, changes or uses in a new place, each use read against the entry, and each changed entry's "Stated in" checked by `grep -n` of the term in the section it names." Why: the rule is written where the briefs point and breaks in a third of the steps, always found only by the refuter. Recommendation (a).
  - Kind 4, the prose standard's form broken: more than one rule per bullet, a long sentence, a repeated construction, a binary contrast past the limit (9 steps, 3 plans). Now: the prose standard and skill-layout state each rule. Change: `templates/brief.md` "Verify before you report" adds a reading item, "Each new or changed bullet holds one rule and each Steps item one action; each new sentence past 25 words is named in the report with why the mechanism needs its length." Why: a named reading item puts the check before the refuter. Recommendation (a).
  - Kind 5, a test that stays green with the behaviour it names mutated (4 steps, 3 plans). Now: rule 13 asks that each new test fail on the unchanged tree, which a test of a new script passes because the script is absent. Change: `templates/brief.md` "Cases" adds, for a code step, "For each case, the report names one small change to the code under test that the case must catch, and the test's failing line with that change made." Why: every one of the four was found by a reviewer's mutation. This reopens nothing of 2.E step 8's rule 13, which is about naming reverts in test comments; the proposal is about the report. Recommendation (a).
  - Kind 6, an error path that ends in a traceback or fails silently (3 steps, 3 plans). Now: `spec` Steps 4 asks for the inputs the step implies, and `templates/brief.md` "Cases" names them in general terms. Change: `templates/brief.md` "Cases" names, for a script, "each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected". Why: none of the three briefs listed those inputs, and each was found by the refuter. Recommendation (a).

## Closed items (the log of what was raised and how it ended; no report carries it)

none

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.H and the rulings in `plan.md`. Ledger: `.scratch/2-h-session-retro/`, with `agents/briefs/` and `agents/reviews/`.
- The transcripts under `~/.claude/projects/-Users-axelfaes-workspace-ordo/`, read only; the reference mattpocock `retro`: github.com/mattpocock/skills at d81f3a1, `skills/engineering/retro/`.
- Plan 2.E runs at the same time from `.scratch/2-e-grill/`; a step of this plan whose paths meet a 2.E step in flight waits for it to land.

## Current position (rewritten before every step commit)

- 2026-09-30. Step 3 of 5, the skill wired in, landed and ticked (`agents/reviews/3-landing.md`); step 2 is landed unticked, its reading pending; step 1 is landed and ticked.
- Next step: 4, the real run over plan 2.C's sessions, before 2026-10-28; it needs Axel for the decisions on each proposal.
- Open on Axel's side: the open items above.
