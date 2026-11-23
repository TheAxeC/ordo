# Round 1 of step 5: the findings of the review, each with its ruling

Read `.scratch/19-codebase-design/agents/reviews/5-refuter.md` for the findings in full. Each ruling below says what to change. The brief `agents/briefs/5.md` and every rule of the first build still hold. Change nothing these rulings do not name.

## Rulings

1. Finding S1. "Steps / A configured repository" 1 says what the old check said: the check of the plan configuration writes nothing by itself and drafts no plan configuration. It no longer says that no page is drafted, since the later items of the same case draft a missing glossary and a missing `CLAUDE.md`.
2. Finding S2. The command that finds the plan configuration takes the folder only. Where the call's `<folder>` ends with a project's name in the `projects:` form, the skill says that the name is taken off before the command and used afterwards to choose the project. Run `check_config.py --find` on a scratch folder outside the worktree for a call with and without a project name, and quote both runs in the report.
3. Finding S3. A configured repository with no `CLAUDE.md` is offered the file from the template; that stays, since a repository gets the shared rules from `/ordo-init` in every case. It is made to work: the item says which of the questions are asked at that point (those the repository does not answer, as in an existing repository), the stop "The questions" covers it, and no placeholder is written unfilled.
4. Finding S4. "What it reads" on the commit rule names all three cases. In a configured repository the commit rule is what the repository's rules state (its `CLAUDE.md` or the page its `rules` key names); when they state none, the skill asks at the stop that shows the change, with it.
5. Finding P1. Every item of Steps ends on its completion criterion, "A configured repository" 7 and "A new repository" 11 included.
6. Finding T1, one name each. `check_config.py`'s run is "the configuration check" everywhere in the skill, and the comparison and rewrite of the two blocks through `sync_rules.py` is "the sync", the glossary's term. No bare "the check" and no "the comparison" is left for either. The two stops are named "A fix in the configuration check" and "The sync still fails"; the pipeline figure, the README's alternative text and every citation follow.
7. Finding T2. The sync that follows a block written in an existing repository runs at most twice; a second run that does not print the `ok:` line of each block is the stop "The sync still fails".
8. Findings T3 and T5. The glossary's entries **standards** and **questions, the**, in `docs/glossary.md` and `templates/plan-terms.md`: the first cites only places that state the term, the second says the questions are also asked, in part, where `CLAUDE.md` is written from the template outside a new repository.
9. Finding T4. "The questions" and "The tree" move to `skills/ordo/ordo-init/references/new-repository.md`, as the skill layout says of material not every run reads. The steps that need them say to read that page. Every citation of the two sections, in the skill, the glossary, `plan-terms.md`, `grill` and `gen_figures.py`, names the page.
10. Finding T6. In "Steps / An existing repository" the offer of a glossary is settled before the item that drafts the `standards` list, so each item uses only what an earlier item produced.
11. Finding B1. In an existing repository a shared-rules block or a plan-terms block that is already there is not left for a later run: the sync runs on it in the same run, after the draft is written, and a block that differs is shown as in a configured repository. So a person who runs `/ordo-init` to sync a repository without a plan configuration gets the sync in that run.
12. Finding B2. The report's table of user-visible changes gains the row for the line of `templates/docs/glossary.md` outside the block, and the row for ruling 11.
13. `.gitignore` is accepted as a path of this step. The three case names, the three glossary terms and the lines of "Read before you act" left out of a written `CLAUDE.md` are accepted as built.

Not sent: P2 and S5 need no change.

## Paths this round adds

- `skills/ordo/ordo-init/references/new-repository.md`
- `.gitignore`

## Verify before you report

Run every check of the brief's "Verify before you report" again, with cases 1 to 10 read or run again, and these added:

11. `/ordo-init . tools/a` in a repository whose `tools/plan.yaml` is in the `projects:` form with a project `a`. Expected: the plan configuration is found, the case is the configured repository, the project is `a`.
12. A configured repository with no `CLAUDE.md`. Expected: the configuration check, then the file offered from the template with its questions asked, nothing written before approval.
13. An existing repository with no `plan.yaml` whose `CLAUDE.md` holds a shared-rules block that differs from the template. Expected: the draft of the plan configuration, and in the same run the diff of the block per hunk.
14. `grep -n 'the check\b\|the comparison' skills/ordo/ordo-init/SKILL.md` prints no line where either stands for the configuration check or the sync.

## Report

Append to `.scratch/19-codebase-design/agents/reviews/5-report.md` in the worktree a section "Round 1" with: anything NOT done first; one row per ruling with where the change stands; the checks' output as printed; cases 1 to 14; every judgment call the rulings left open. End with that section as your final message.
