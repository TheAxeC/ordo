# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 29, paper edit. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
- sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
- sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
- sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
- sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/ordo/ordo-init/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from docs/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # from docs/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, run on.
libraries: avoid             # from docs/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: medium        # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: medium      # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from docs/plan.yaml; after the closing, next-entry mode reads docs/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```
```yaml
dispatch: none               # one entry per step in flight, written by /spec, since docs/plan.yaml's workers_at_once is 5.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- Open item G (2026-11-28), kind 3 (each recommended option changes ADR 0062, which is in force), raised by the brief check of step 1 (`.scratch/29-paper-edit/agents/reviews/1-brief-check.md`, "Implied inputs" and "ADRs"). Three manuscripts the mode will meet are not covered by the shapes ADR 0062 fixes, and each needs a ruling before the brief is written.
  - (1) A gap and a change in one paragraph. Example, made up: the paragraph `Funded by [GAP: funder]. Contact: J. Doe, Example University.` with the items `G1: [GAP: funder] => the Example Foundation` and `E1: "Example University" => "Example Institute"`. ADR 0062 Decision 4 allows `fill_gap` alone on a block that holds a marker, and the script takes one op kind per block, so one patch cannot make both items.
    - Option (a), recommended: a file that holds such a block gets two patches in a row. The gap patch first; then the session anchorizes the file again, runs `--find` for the changes on the filled file, writes a new file of allowed blocks, and the writer's change patch follows. ADR 0062 Decision 6 ("the one patch") reads "one patch per file, and a second, for the changes, on a file where a block holds both". Pro: every item is made, and the gap keeps the guarantee that only its marker changes. Con: one more writer turn and apply on such a file.
    - Option (b): the change in that block is left, named in the final message with the reason, and the user runs `/paper edit` again for it once the gap is filled. Pro: no change to the ADR. Con: an item the user asked for is not made in the run. This is the lazy option.
    - Option (c): a block that holds both gets `replace_block` for both items. Pro: one patch. Con: the writer rewrites the gap's paragraph, which ends the guarantee `fill_gap` exists for, and contradicts Decision 4's "alone".
  - (2) One marker standing in several places. Example: the draft writer writes `[GAP: citation needed]` after each claim no source holds, so a draft can hold it five times. The item `G1: [GAP: citation needed] => \cite{doe2020}` cannot say which of the five it fills, since Decision 2's line names only the marker.
    - Option (a), recommended: the left side of a `G<n>` line may also carry words from the `.tex` around the marker, such as `G1: memory improves with sleep [GAP: citation needed] => \cite{doe2020}`. `--find` searches the whole left side, and the op names the marker and its occurrence in the block found. A marker that, with the words given, stands in more than one place is refused alone and named with each place it stands, and the final message says to give more words around it. Decision 2 gains the optional words; a line with the marker alone, as now, works when the marker stands once. Pro: every gap can be filled, and none is filled where the user did not mean it. Con: the edits file format grows.
    - Option (b): such an item is refused alone and named with each place the marker stands. Pro: no change to the format. Con: `[GAP: citation needed]` standing more than once can never be filled in `edit`, the result ADR 0062's Alternatives reject for citation gaps. This is the lazy option.
    - Option (c): the answer fills every place the marker stands. Pro: one line fills a gap repeated on purpose, such as an email in the title page and the hyperref settings. Con: one citation is put after five different claims, a false citation in four places.
  - (3) A text wrapped across lines. Example: a `.tex` written at 80 columns holds `J. Doe, Example` at the end of one line and `University` at the start of the next. The item `E1: "Example University" => "Example Institute"` is found nowhere by Decision 3's exact search, and is refused although the text stands in the file.
    - Option (a), recommended: `--find` treats a run of spaces, tabs and single line breaks in the text and in the block as one space, and stays exact otherwise; a blank line still ends a block. Decision 3 reads "an exact search, up to the whitespace between words". Pro: a hard-wrapped manuscript, the common form of LaTeX, is searched as it reads. Con: the writer's `replace_block` has to keep the block's own line breaks, which the brief then states.
    - Option (b): the exact search stays, and an item found nowhere is named in the final message with the sentence that the text may be wrapped in the file. Pro: no change to the ADR. Con: every change in a hard-wrapped manuscript whose text crosses a line end is refused. This is the lazy option.
  - The ruling's form: `Ruled: (1) <a, b or c>; (2) <a, b or c>; (3) <a or b>`. On options (1a), (2a) and (3a), ADR 0062's Decisions 2, 3 and 6 are rewritten to them by the step's builder, the ADR keeping status `proposed`, and the brief is written with them; this ruling approves those edits of ADR 0062.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-11-28: the drafted step list of three steps: approved by the user, with the five design decisions `/plan` listed (the shape of the script's new refusals, the edits file's format, the refusal tag, the word-level diff command, whether `edit` asks the session's questions) left to the builder and judged by the reviewer.

## The standing demands (from the user, in force)

- `CLAUDE.md`, "A shipped file names nothing private". The ones that bite here: `skills/academic/paper/`, `docs/figures/`, `README.md`, `docs/glossary.md` and ADR 0062 name no file, folder, manuscript or person of the user's own, and an example in them is made up or public and says which.
- Commits: a capitalised imperative subject and `- Verb` bullets, every commit naming its paths. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.
- No breakage testing. The gate makes no run of `/paper edit` (Rulings, Open item E). The text on the other modes of a copied page stays as it is (Rulings, Open item F).

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: ADR 0043 under `docs/adr/`, ADR 0062 added at step 1, and the Rulings of `plan.md`. Ledger: `.scratch/29-paper-edit/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: `skills/academic/paper/`, `docs/figures/`, `docs/adr/`, `README.md`, `docs/dev/building.md` and `docs/glossary.md`, changed by step 1's builder only.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-28. Nothing has landed. Step 1 stopped before its build: its brief check (`agents/reviews/1-brief-check.md`) found three cases ADR 0062 does not cover, raised as Open item G. No brief, worktree or dispatch entry stands for it.
- Verified: `grep -n "^dispatch" .scratch/29-paper-edit/orchestrator-state.md` prints `dispatch: none`.
- Next step: 1, `/spec 29 1` once Open item G is ruled.
- Open on the user's side: Open item G.
