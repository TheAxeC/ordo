# Report: step 5, the skill `repo-setup` merged into `ordo-init`

Everything in the brief is done. Three points need the orchestrator at landing: `.gitignore` is changed although the brief's paths do not name it (judgment call 1), the README row of `codebase-design` now stands on line 29 instead of line 30 with its text unchanged, and the state file's verify list and `standards` line still name the old paths, as the brief leaves to the orchestrator.

## Open items of the state file

- none

## The cases' first run, on the unchanged tree

1. Read. The old `/ordo-init` drafts only `docs/plan.yaml` in an empty folder, and the questions and the tree belong to `/repo-setup`. The expected result does not hold before the change.
2. Read. The old `/ordo-init` never writes `CLAUDE.md` (`grep -n 'CLAUDE.md'` on it showed the two lines the brief names). The shared-rules draft exists only as `/repo-setup sync`, "Steps / sync" 4. Does not hold before the change.
3. Read. No text of either old skill offers `CLAUDE.md` from the template in an existing repository. Does not hold before the change.
4. Read. The old `/ordo-init` checks the configuration and stops there, and the diff per hunk is `/repo-setup sync`. Does not hold before the change.
5. Read. Same as case 4: the check alone. Does not hold before the change.
6. Run at the old path, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`: `PASS: sync_rules.py scratch tests`.
7. Run at the old path, `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
8. `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`.
9. The grep printed 112 lines outside `skills/code/codebase-design/` and ADR 0047, the roadmap included, in the files the brief lists. It also printed `CLAUDE.md: No such file or directory`: the worktree has no root `CLAUDE.md`, since `.gitignore` line 6 ignores it.
10. `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml`: exit 0, last line `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`.

No case was found wrong by the brief's rules, so nothing was handed back.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. The templates moved, `skills/ordo/repo-setup/` gone | DONE | `ls skills/ordo` prints `ordo-help ordo-init session-retro wait-what`. A loop of `git show HEAD:<old path> \| cmp -s - <new path>` over the 21 moved files printed `differs:` for `templates/docs/glossary.md`, `templates/plan-terms.md` and `templates/shared-rules.md` only, the three the brief names. |
| 2. `ordo-init/SKILL.md`, one skill for three cases | DONE | The frontmatter command prints `ordo-init 972 4.0.0`. `grep -n '^## \|^### '` prints Quick start, Use instead, What it reads, Steps, "A new repository", "An existing repository", "A configured repository", The questions, The tree, Stops, Anti-patterns, Rules. Cases 1 to 5 read below. |
| 3. Every other file names `ordo-init` | DONE | Case 9: the grep prints 4 lines in ADR 0047 and 9 in `skills/code/codebase-design/SKILL.md`, and the `CLAUDE.md: No such file` warning. `git grep -n -I 'repo-setup\|repo_setup' -- . ':!.scratch' ':!skills/code/codebase-design' ':!docs/adr/0047*'` prints only `docs/roadmap.md` lines 77, 79, 81, 85, 86, 106 and 109, the done and dropped entries. |
| 4. `skills/code/codebase-design/` not touched | DONE | `git status --short` lists no path under it. |
| 5. Root `CLAUDE.md` | DONE, nothing to change | The worktree has no root `CLAUDE.md`. `grep -c repo-setup /Users/axelfaes/workspace/ordo/CLAUDE.md`, read only, prints `0`. |

The checks of "Verify before you report", as printed:

1. The character-set check printed nothing, then `exit status 0`.
2. Case 6: `PASS: sync_rules.py scratch tests`. Case 7: `ok: the plan-terms block equals the template`, exit 0. Case 8: `PASS: check_config.py scratch tests`. Case 9: as in the row of item 3. Case 10: exit 0, `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`.
3. `ordo-init 972 4.0.0`.
4. `ls skills/ordo` prints no `repo-setup`. `grep -c 'twenty-one' README.md` prints `2`, and `grep -c 'twenty-two' README.md` prints `0`.
5. `python3 docs/figures/gen_figures.py` exits 0, and `git status --short docs/figures` lists ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg` only. The figure was rendered with `rsvg-convert` and looked at: the one lane `/ordo-init` holds twelve stops in three rows of four, and every box and label stands inside the frame.
6. The commands of `docs/dev/building.md` that name a moved path are lines 16 and 17, which are cases 6 and 7 at the new path. Both pass.
7. The departures from the standards pages are under "Departures from the skill layout".

Cases 1 to 5 read on the new text:

1. Met. Steps 1 sends a folder with no tracked file to "Steps / A new repository": the questions (2), the tree with every file's text (3, 4), the write (5), the plan configuration through "Steps / An existing repository" (8).
2. Met. "Steps / An existing repository" 10 gives a `CLAUDE.md` with no block the change of "Steps / A configured repository" 10, which lists each existing rule the block now states for removal. Item 12 shows it, and item 13 stops before item 14 writes.
3. Met. "Steps / An existing repository" 10: "With no `CLAUDE.md`, the file is offered from `templates/CLAUDE.md`".
4. Met. "Steps / A configured repository" 1 to 6 are the check, then 7 runs `sync_rules.py` and 9 shows the diff per hunk.
5. Met. Item 8: "Exit 0: both blocks equal their templates, so nothing is written, and the two `ok:` lines are shown with the check's output."

## What each part of the two old skills became

| Old part | New place in `ordo-init` |
|---|---|
| `repo-setup` introduction, `ordo-init` introduction | The introduction |
| `repo-setup` Quick start, three lines; `ordo-init` Quick start, two lines | Quick start, two lines: `[<path>] [<folder>]` and `--ruling` |
| `repo-setup` Use instead: `/ordo-init` row | Removed, the skill itself |
| `repo-setup` Use instead: `/roadmap add` row; `ordo-init` Use instead: `/roadmap add` row | Use instead, row 1, once |
| `ordo-init` Use instead: `/repo-setup` row | Removed, the skill itself |
| `ordo-init` Use instead: `/plan` row | Use instead, row 2 |
| `repo-setup` What it reads 1 | What it reads 1, with `check_config.py` added |
| `repo-setup` What it reads 2 | What it reads 6 |
| `repo-setup` What it reads 3 | What it reads 5, sub-bullets |
| `repo-setup` What it reads 4 | What it reads 1 (`check_config.py`) and 3 (the roadmap template) |
| `repo-setup` What it reads 5 | What it reads 8, and for `<folder>` What it reads 4 |
| `repo-setup` What it reads 6, `ordo-init` What it reads 5 | What it reads 9, once |
| `ordo-init` What it reads 1 | What it reads 2 |
| `ordo-init` What it reads 2 | What it reads 4, and Steps 1 for "checks instead of drafting" |
| `ordo-init` What it reads 3 | What it reads 7 |
| `ordo-init` What it reads 4 | What it reads 5 |
| `repo-setup` Steps 1 to 12 | "Steps / A new repository" 1 to 12. The bullet of Steps 1 on tracked files is removed, as the brief says. Steps 8, "Run `/ordo-init`", is now "Follow Steps / An existing repository on the tree written". |
| `repo-setup` "Steps / sync" 1 to 9 | "Steps / A configured repository" 7 to 15 |
| `ordo-init` Steps 1 to 9 | "Steps / An existing repository" 1 to 9 |
| `ordo-init` Steps 10 to 14 | "Steps / An existing repository" 12 to 16 |
| New, from item 2 of the brief | Steps 1 (the case), "Steps / An existing repository" 10 (the shared rules) and 11 (the plan terms) |
| `ordo-init` "Steps / Checking an existing file" 1 to 6 | "Steps / A configured repository" 1 to 6 |
| `repo-setup` "The questions" | "The questions" |
| `repo-setup` "The tree" | "The tree" |
| `repo-setup` stop "The questions" | Stops, "The questions" |
| `repo-setup` stop "The draft" | Stops, "The draft of the tree" |
| `ordo-init` stop "The draft" | Stops, "The draft of the configuration" |
| `ordo-init` stops "Several roadmaps", "Worker, reviewer and libraries", "A failing command", "A fix in the check" | Stops, the same names |
| `repo-setup` stops "A hunk to rule on", "The drafted sync change", "A file sync cannot use", "The check still fails" | Stops, the same names |
| "No commit allowed", in both | Stops, "No commit allowed", once |
| `repo-setup` refusal "Tracked files" and the two lines under the table that tell stops from the refusal | Removed, as the brief says: such a folder is the second or third case, and the table holds stops only |
| `repo-setup` anti-patterns 1, 3 and 4 | Anti-patterns rows 1, 3 and 4 |
| `repo-setup` anti-pattern 2 and `ordo-init` anti-pattern 1, both a rule nobody stated written into a page | Anti-patterns row 2, once |
| `ordo-init` anti-pattern 2 | Anti-patterns row 5 |
| `repo-setup` Rules 1, `ordo-init` Rules 2 | Rules 1 |
| `repo-setup` Rules 2, `ordo-init` Rules 1 | Rules 2, with its two exceptions (`git init`, the one run of each verification command) |
| `repo-setup` Rules 3 | Rules 3 |
| `repo-setup` Rules 4 | Rules 4 |
| `ordo-init` Rules 3 | Rules 5 |
| `ordo-init` Rules 4 and 5 | Rules 6 and 7 |
| `repo-setup` Rules 5 to 9 | Rules 8 to 12 |
| `ordo-init` Rules 6 | Rules 13 |

## Departures from the skill layout

- "The questions" and "The tree" stay reference sections of `SKILL.md`, though only a new repository reads them whole and "Writing for an agent" sends such material to `references/`. The brief asks for citations re-pointed to sections of the merged skill and names no `references/` file among the paths.
- The sub-lists carried from the old skills (the quoted ruling under What it reads 9, the placeholders under "Steps / A new repository" 3, the errors under "Steps / A configured repository" 2) keep their old form, several bullets to a rule, so that no rule's meaning changes (rule 17).
- "Steps / An existing repository" 2 and 3 each hold a stop inside a drafting step, as the old Steps 2 and 3 did.
- Every item of Steps now ends on a completion criterion. The 18 criteria added to items that had none are new sentences that state what the old item left implied.

## The terms

- Added to `templates/plan-terms.md` and the glossary's block: **configured repository**, **existing repository**, **new repository**, the three cases the skill's headings name.
- Changed: **commit rule**, **plan-terms block**, **shared-rules block**, **questions, the**, **standards** (its second sense), **sync**.
- Citation re-pointed only: **booking**, **gate**, **lazy option**, **rule clash**, **plan configuration**, **plan skills**, **project skills**, **`projects:` form**, **quoted ruling**, **stop**, **verification page**.
- Used in a new place: **sync**, in `grill` ("since the sync of `/ordo-init` undoes it") and in the merged skill's introduction, stops and What it reads 8.

## The files

Changed, as `git diff --numstat` prints added and removed lines:

- `skills/ordo/ordo-init/SKILL.md` +287 -55, 449 lines
- `skills/ordo/ordo-init/templates/check_config.py` +1 -1
- `README.md` +17 -19
- `docs/glossary.md` +21 -18
- `docs/figures/gen_figures.py` +16 -23, `docs/figures/pipeline.svg` +118 -121
- `skills/orchestration/grill/SKILL.md` +7 -7 (2.0.1), `skills/orchestration/spec/SKILL.md` +2 -2 (8.0.1), `skills/orchestration/plan-orchestration/SKILL.md` +3 -3 (8.0.1), `skills/orchestration/plan-orchestration/references/self-rule.md` +1 -1
- `skills/ordo/ordo-help/SKILL.md` +2 -3 (5.0.0)
- `skills/code/wizard/SKILL.md` +2 -3 (1.0.1), `skills/code/code-comments/SKILL.md` +2 -2 (1.1.1)
- `skills/academic/writing/SKILL.md` +2 -2 (2.1.2), `skills/academic/paper/SKILL.md` +2 -2 (4.1.3), `skills/academic/grant/SKILL.md` +3 -3 (1.0.1)
- `docs/dev/building.md` +2 -2, `docs/dev/change-standard.md` +3 -3, `docs/dev/scripts.md` +2 -2, `docs/dev/skill-layout.md` +2 -2, `docs/plan.yaml` +1 -1, `docs/roadmap.md` +3 -3
- `docs/adr/0001-*.md` +4 -4, and `0002`, `0014`, `0026`, `0030` +1 -1 each
- `.gitignore` +1 -1

Moved into `skills/ordo/ordo-init/templates/`, 21 files, 1188 lines by `wc -l`: `CLAUDE.md` 34, `LICENSE-MIT` 21, `docs/adr/README.md` 10, `docs/adr/template.md` 19, `docs/dev/change-standard.md` 72, `docs/dev/coding-standards/common.md` 13, `cpp.md` 77, `python.md` 43, `typescript.md` 49, `docs/dev/design-principles.md` 16, `docs/dev/prose-standard.md` 75, `docs/dev/ui-standard.md` 11, `docs/glossary.md` 13, `gitignore/common.gitignore` 16, `cpp.gitignore` 35, `python.gitignore` 15, `typescript.gitignore` 10, `plan-terms.md` 137, `shared-rules.md` 27, `sync_rules.py` 189, `sync_rules.test.sh` 306.

Removed: `skills/ordo/repo-setup/`, whole (22 files, `SKILL.md` 255 lines).

A file changed that "Paths this step writes" does not name: `.gitignore`.

## Judgment calls

1. `.gitignore` line 6, `CLAUDE.md`, is now `/CLAUDE.md`. The unanchored line ignores the moved template: `git check-ignore -v skills/ordo/ordo-init/templates/CLAUDE.md` printed `.gitignore:6:CLAUDE.md`, and `git status --short` did not list the file, so a landing would have dropped it. At the old path the file was tracked, so the line did not reach it. Anchored, the line still ignores the root file (`git -C /Users/axelfaes/workspace/ordo status --short --ignored | grep -i claude.md` prints `!! CLAUDE.md`), and `git status` in the worktree now lists `?? skills/ordo/ordo-init/templates/CLAUDE.md`. It serves item 1.
2. The three cases are named "A new repository", "An existing repository" and "A configured repository", and the glossary defines each. The brief uses "configured repository" for the third.
3. `<folder>` names the `plan.yaml` for the whole run of a configured repository: the check runs `check_config.py --find . [<folder>]`, which the script already takes, so the file checked and the file whose `standards` list names the glossary are one file.
4. In an existing repository, questions 1, 5 and 9 are asked at "Steps / An existing repository" 6, with the keys, only when `CLAUDE.md` is missing and only for what the repository does not show. When question 5 is asked there, its answer is the commit rule and the commit question of item 12 is left out.
5. A `CLAUDE.md` written from the template in an existing repository: each line of "Read before you act" names the page of that kind the drafted `plan.yaml` names or the draft offers, and a line whose page is neither is left out. The Skills section is kept only when the repository has a `skills-lock.json`. The template's fixed lines would otherwise name pages the repository does not have.
6. In an existing repository a block that is already there is left as it is, and the next `/ordo-init`, which then finds the plan configuration, compares it. The brief gives the second case the offer of what is missing and the third case the comparison.
7. In a configured repository with no `CLAUDE.md`, the stop "A file sync cannot use" stands as before, and the fix the skill offers there is the file from the template ("Steps / A configured repository" 13). It serves the first bullet of "What it must do".
8. After a block is written in an existing repository, item 15 runs the comparison and the setup is done when it prints the `ok:` line of each block written.
9. The two stops named "The draft" are "The draft of the tree" and "The draft of the configuration", since a new repository meets both.
10. The pipeline figure's row title "SET THE REPOSITORY UP, ONCE: ONE OF THE TWO" is "SET THE REPOSITORY UP, ONCE", and the lane has four columns.
11. In ADR 0001 the name is replaced in the sentence on the rejected alternative too ("installed by `ordo-init` from there").
12. Carried unchanged from the old text: the commit of "Steps / A configured repository" 15 covers the sync change, and no item commits a fix that the check of items 4 and 5 made to the plan configuration. The old check committed nothing. Changing it would add a rule the brief does not ask for.

## User-visible changes

| Before | After |
|---|---|
| `/repo-setup [<path>]` sets up a new repository and refuses a folder with tracked files | `/ordo-init [<path>]` in a folder with no tracked file does that setup. No refusal: a folder with tracked files is the second or third case. |
| `/repo-setup sync [<path>] [<folder>]` | `/ordo-init [<path>] [<folder>]` in a repository with a `plan.yaml`: the check of the file, then the comparison of the two blocks. `/ordo-init sync` is not a call. |
| `/ordo-init` in a repository with no `plan.yaml` drafts `docs/plan.yaml` and offers a roadmap, a building page and a change standard | It also drafts the shared rules for `CLAUDE.md` (the block inserted, or the file from the template) and the plan terms for the glossary (the block inserted, or `docs/glossary.md` from the template), in the same draft |
| `/ordo-init` in a repository with a `plan.yaml` checks the file | It then compares the shared-rules block and the plan-terms block with their templates |
| Stops "The draft" in each skill | "The draft of the tree" and "The draft of the configuration" |
| The sequence of `/ordo-help` and of the README: a line for `/repo-setup` and a line for `/ordo-init` | One line, the same text in both: `/ordo-init                    once per repository: sets up a new one from an empty folder, writes docs/plan.yaml and what an existing one lacks, or checks the plan.yaml there with the shared rules and the plan terms` |
| `check_config.py` note: `adr folder docs/adr does not exist yet; repo-setup or grill creates it` | `...; ordo-init or grill creates it` |
| `templates/shared-rules.md` line 3: "`/repo-setup sync` keeps this section identical to the template" | "`/ordo-init` keeps this section identical to the template". A repository whose block is a copy of the old text differs from the template by this line until its next sync. |
| `templates/docs/glossary.md` line 3, outside the plan-terms block: "which `/repo-setup sync` keeps equal to the `repo-setup` skill's template" | "which `/ordo-init` keeps equal to the `ordo-init` skill's template". The line is outside the block, so no sync rewrites it: a glossary written earlier keeps the old sentence until its owner edits it. |
| `/repo-setup sync` on a repository with no `plan.yaml` compared both blocks, with `docs/glossary.md` as the glossary | `/ordo-init` on such a repository is the second case: it drafts `docs/plan.yaml` with what is missing, stops for `worker`, `reviewer` and `libraries` and for the approval, and after the write runs the sync in the same run, a block that differs shown per hunk. A person who wants only the sync is led through the draft of the plan configuration first. |
| The templates under `skills/ordo/repo-setup/templates/`, installed as `<skills>/repo-setup/templates/` | Under `skills/ordo/ordo-init/templates/`, installed as `<skills>/ordo-init/templates/` |
| README: twenty-two skills, a row for `repo-setup`, `ordo/repo-setup` in the install loop | Twenty-one skills, one row for `ordo-init` covering the three cases, no `ordo/repo-setup` in the loop |
| Pipeline figure: two lanes, `/repo-setup` and `/ordo-init` | One lane `/ordo-init` with the twelve stops of the merged Stops table, and the README's alternative text lists them |

## Wrong or impossible in the brief

- Item 5 and case 9 name a root `CLAUDE.md`. The worktree has none, since `.gitignore` ignores it, so case 9's grep prints `CLAUDE.md: No such file or directory` beside its lines. The file in the main checkout was read and holds no `repo-setup`.
- "README.md (every line but line 30)": removing the `repo-setup` row moves the `codebase-design` row from line 30 to line 29. Its text is unchanged (`sed -n 29p README.md` prints the row).
- The brief's paths do not name `.gitignore`, and the move of `templates/CLAUDE.md` cannot land without the change of judgment call 1.

## Round 1

Nothing is NOT done: each of the thirteen rulings is carried out.

### The rulings

| Ruling | Where the change stands |
|---|---|
| 1 (S1) | `ordo-init/SKILL.md`, "Steps / A configured repository" 1: "The configuration check writes nothing by itself and drafts no plan configuration." The sentence on pages is gone. |
| 2 (S2) | "What it reads" 4: "The folder is the longest leading part of `<folder>` that is a folder holding a `plan.yaml`, and what is left of `<folder>` names a project of that file", and "The command takes the folder alone: a project's name is taken off `<folder>` before the command runs, and is used afterwards to choose the project in the file found." "Steps / A configured repository" 1 runs "the command of "What it reads" 4". The two scratch runs are under the checks. |
| 3 (S3) | "Steps / A configured repository" 10 now takes `error: no CLAUDE.md in` with the two no-single-block lines: the file is drafted from `templates/CLAUDE.md` as "Steps / An existing repository" 11 says, after questions 1, 5 and 9 are asked, each only for what the repository does not show. Items 11 and 12 show and write it like every other drafted change. Item 13 no longer lists that line. The Stops row "The questions" covers "Steps / An existing repository" 6 and "Steps / A configured repository" 10, and the row "The drafted sync change" names a missing `CLAUDE.md`. "Steps / An existing repository" 11: "A placeholder with no value is shown to the user and never written as `<...>`". |
| 4 (S4) | "What it reads" 7 names the three cases: "In a configured repository it is what the repository's rules state, in its `CLAUDE.md` or in the page its `rules` key names", "When they state none, the skill asks whether it may commit at the stop that shows the change ("Steps / A configured repository" 9 and 11), with the change". The Stops rows "A hunk to rule on" and "The drafted sync change" show the commit question and resume on its answer. The glossary's **commit rule** says the same. |
| 5 (P1) | "A configured repository" 7 ends on "The item is done when the sync has run and its exit status is known." "A new repository" 11 ends on its criterion. A script that reads the last sub-bullet of every item of Steps printed no item without one. |
| 6 (T1) | `check_config.py`'s run is "the configuration check" and `sync_rules.py`'s is "the sync" in every item. The stops are "A fix in the configuration check" and "The sync still fails", in the Stops table, in `gen_figures.py`, in `pipeline.svg` and in the README's alternative text. Case 14 prints nothing. |
| 7 (T2) | "Steps / An existing repository" 15: "The sync runs at most twice after a block is written or rewritten, and a second run that does not print the `ok:` line of each block is the stop "The sync still fails"". The Stops row names that item beside "Steps / A configured repository" 14. |
| 8 (T3, T5) | `templates/plan-terms.md` and the glossary's block. **standards** cites `ordo-init`, `references/new-repository.md`, "The questions" 6 and "The tree", and no longer `ordo-help`. **questions, the** adds "Questions 1, 5 and 9 are also asked where `CLAUDE.md` is written from the template in an existing or a configured repository, each only for what the repository does not show." |
| 9 (T4) | `skills/ordo/ordo-init/references/new-repository.md`, 46 lines, holds "The questions" and "The tree". `SKILL.md` has no such section. "What it reads" 6 names the page and who reads which part, and "Steps / A new repository" 2 and 3 say to read it. The citations name the page: in the skill, in `plan-terms.md` and the glossary (**commit rule**, **new repository**, **questions, the**, **standards**), and in `grill` line 302. `gen_figures.py` cites neither section: its "The questions" is the stop's label. |
| 10 (T6) | "Steps / An existing repository" 7 finds the glossary and drafts or offers its plan terms, and item 8 drafts `standards` from it. The old items 7 to 10 are items 8 to 11. |
| 11 (B1) | "Steps / An existing repository" 15: after the configuration check, "run the sync, as "Steps / A configured repository" 7 to 14 say, on the blocks written and on a block that was already there", and "A block that differs is shown per hunk". Items 7 and 11 say that nothing is drafted for a block that is there and that the sync of item 15 compares it in the same run. Item 16 commits a block the sync rewrote with the files written. The frontmatter description, the introduction, the glossary's **sync**, **shared-rules block**, **plan-terms block** and **existing repository**, line 3 of `templates/shared-rules.md` and of `templates/docs/glossary.md`, and the README's paragraph on an existing repository say so. |
| 12 (B2) | The table "User-visible changes" above has the two rows: line 3 of `templates/docs/glossary.md`, and the sync of a repository with no `plan.yaml`. Its row on `templates/shared-rules.md` quotes the line as it now stands. |
| 13 | `.gitignore` stays as built, and the case names, the three terms and the lines of "Read before you act" stay as built. |

### The checks, as printed

1. The character-set check printed nothing, then `exit status 0`.
2. Case 6: `PASS: sync_rules.py scratch tests`. Case 7: `ok: the plan-terms block equals the template`, exit 0. Case 8: `PASS: check_config.py scratch tests`. Case 9: 4 lines in ADR 0047, 9 in `skills/code/codebase-design/SKILL.md`, and the warning `CLAUDE.md: No such file or directory`. Case 10: exit 0, `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`.
3. The frontmatter command prints `ordo-init 1013 4.0.0`.
4. `ls skills/ordo` prints `ordo-help ordo-init session-retro wait-what`. `grep -c 'twenty-one' README.md` prints `2`, and `grep -c 'twenty-two' README.md` prints `0`.
5. `python3 docs/figures/gen_figures.py` exits 0, and `git status --short docs/figures` lists ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg` only. The figure was rendered again with `rsvg-convert` and looked at: twelve stops in three rows of four, "A fix in the configuration check" on two lines, every box and label inside the frame.
6. `docs/dev/building.md` lines 16 and 17 are cases 6 and 7. Both pass.
7. The new and changed items were read against the skill layout and the prose standard. One departure stays: the sub-lists carried from the old skills keep several bullets to a rule, so that no rule's meaning changes.

The scratch runs of ruling 2, in a scratch git repository outside the worktree whose `tools/plan.yaml` is in the `projects:` form with a project `a`:

```
$ check_config.py --find . tools
tools/plan.yaml
exit 0
$ check_config.py --find . tools/a
error: no plan.yaml in tools/a, .scratch, docs, .agents of .
exit 1
```

The first is the command the skill now runs for `/ordo-init . tools/a`, the project's name taken off. The second is the same call with the name left on, which the skill's text now rules out.

### The cases

1. Met. Steps 1, then "Steps / A new repository": the page `references/new-repository.md` read and its questions asked (2), the tree drafted and shown with every file's text (3, 4), written after approval (5), the plan configuration through "Steps / An existing repository" (8).
2. Met. "Steps / An existing repository" 11 gives a `CLAUDE.md` with no block the change of "Steps / A configured repository" 10, with each existing rule the block now states listed for removal. Item 12 shows it, item 13 stops, item 14 writes.
3. Met. "Steps / An existing repository" 11: "With no `CLAUDE.md`, the file is offered from `templates/CLAUDE.md`", its questions asked at item 6.
4. Met. "Steps / A configured repository" 1 to 6 are the configuration check, then 7 runs the sync and 9 shows the diff per hunk.
5. Met. Item 8: "both blocks equal their templates, so nothing is written, and the two `ok:` lines are shown with the configuration check's output."
6. Run: `PASS: sync_rules.py scratch tests`.
7. Run: `ok: the plan-terms block equals the template`, exit 0.
8. Run: `PASS: check_config.py scratch tests`.
9. Run: lines only under `skills/code/codebase-design/` and in ADR 0047.
10. Run: exit 0 and the `ok:` line.
11. Met. "What it reads" 4 takes `a` off `tools/a`, the command `--find . tools` prints `tools/plan.yaml` (the run above), Steps 1 makes it a configured repository, and the project is `a`, by "used afterwards to choose the project in the file found" and "What it reads" 8, "the glossary is read from the `standards` list of the project the call names".
12. Met. "Steps / A configured repository" 1 to 6, then 7 exits 2 with `error: no CLAUDE.md in`, and item 10 asks questions 1, 5 and 9 and drafts the file from the template. Item 11 shows it and item 12 writes only after approval.
13. Met. "Steps / An existing repository" 1 to 13 draft and show the plan configuration, item 11 drafts nothing for the block that is there, and item 15 runs the sync after the write, where "Steps / A configured repository" 9 shows the diff of the block per hunk.
14. Run: `grep -n 'the check\b\|the comparison' skills/ordo/ordo-init/SKILL.md` prints nothing, exit 1.

### Judgment calls the rulings left open

1. Ruling 3. The missing `CLAUDE.md` of a configured repository is drafted at item 10, with the two no-single-block lines, so that items 11 and 12 show and write it under the stop "The drafted sync change". It left item 13, the item of files the sync cannot use.
2. Ruling 3. The stop "The questions" now also covers the questions asked in an existing repository at item 6, so one row holds every place the questions are asked. The row "Worker, reviewer and libraries" no longer names them.
3. Ruling 4. The commit question of a configured repository is asked at the stops "A hunk to rule on" and "The drafted sync change", the two stops that show a change the skill would commit. Where item 10 asks question 5 for a `CLAUDE.md` written from the template, its answer is the commit rule.
4. Ruling 9. The page is named `references/new-repository.md`, the name the ruling gives. Inside it, the two citations of the skill's steps name `SKILL.md`.
5. Ruling 11. The sync in an existing repository follows "Steps / A configured repository" 7 to 14 and not 15: item 16 of the existing repository makes the one commit. A block the user declined at the approval stop is not drafted again by that sync.
6. Ruling 11. The sentences that said `/ordo-init` syncs "on a configured repository" now name both cases: the glossary's **sync**, **shared-rules block** and **plan-terms block**, and the README. Line 3 of `templates/shared-rules.md` and of `templates/docs/glossary.md` reads "`/ordo-init` keeps" with no condition.
7. Ruling 8. **standards** cites "The questions" 6 beside "The tree", since question 6 is where the term "standards pages" is stated.

Files this round changed: `skills/ordo/ordo-init/SKILL.md` (418 lines), `skills/ordo/ordo-init/references/new-repository.md` (new, 46 lines), `skills/ordo/ordo-init/templates/plan-terms.md`, `templates/shared-rules.md`, `templates/docs/glossary.md`, `docs/glossary.md`, `skills/orchestration/grill/SKILL.md`, `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg`, `README.md`, and this report.
