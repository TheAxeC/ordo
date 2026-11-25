# Step 4 report: the rulings file named by its entry's number

Everything in the brief is done, under the cases ruling `agents/briefs/4-cases.md` (round 0). "What to build" 8, the user's reading of `grill` and `plan` on the rulings file, is the step's check and stays open for landing as an open item of kind 5.

## Open items of the state file, verbatim

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.
- Open item C (2026-11-25, step 4, kind 3, ruling D33): D33's check "`git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing" can never print nothing, because `docs/roadmap.md` line 27, entry 27's own gate, holds the pattern (`git grep -n 'rulings/<slug>' -- docs/roadmap.md` prints line 27). Step 4 goes on meanwhile: it rewrites ADR 0059's Context line so it no longer holds the pattern, and runs the check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The check reads "`git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'` prints nothing", in D33 and in entry 27's gate, written by `/roadmap` at the closing. Pro: it checks every page that states the rule; the one line left out is the check itself. Con: none found.
  - (b) The gate keeps D33's words, and the closing records that the check printed its own line. Pro: no change to the ruling. Con: the gate's output then shows a part that did not pass as written.
  - Lazy option: (b), since it changes nothing now and leaves a failed check in the record.

## The cases' first run, on the unchanged tree

- **Case 1, the greps.**
  - `git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'` exited 0 and printed seven lines, at `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md:7`, `docs/glossary.md:115`, `skills/orchestration/grill/SKILL.md:49`, `skills/orchestration/plan-orchestration/references/self-rule.md:115`, `skills/orchestration/plan-orchestration/references/self-rule.md:142`, `skills/orchestration/plan/SKILL.md:61` and `skills/ordo/ordo-init/templates/plan-terms.md:110`. Each line holds `<ledger_root>/rulings/<slug>.md`.
  - The same command without the exclusion exited 0 and printed those seven lines and `docs/roadmap.md:27`.
  - `git grep -n 'rulings/<number>.md' -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration/references/self-rule.md skills/ordo/ordo-init/templates/plan-terms.md` printed nothing and exited 1.
- **Case 2, the number rule.** Read in `plan` "What it reads" 4 and Steps 1. The unchanged tree states no number rule: the file is named by the slug of the whole entry, so `27` gives `27-a-newcomer-s-readme-...-for-every-skill.md`, not `27.md`, and so for every number listed. The brief's rule, applied by reading, gives each listed result: `27.md`, `27.md` for `27.`, `3-a.md`, `7-a.md`, `2-e.md`, `2-e-a.md` for `2.E.A.`, `5.md`, `13.md`, and `12.md` for `web/12`.
- **Case 3, a title changed by `grill`'s own roadmap diff** (as the ruling's item 5 words it). Read in `grill` "What it reads" 6 and line 50. The path comes from the slug of the title, so the file before the diff (`rulings/12-old-title.md`) and the file after it (`rulings/12-new-title.md`) are two paths. Line 282 writes the heading only "when it is absent", so it keeps the old title.
- **Case 4a, `rulings/12.md` with the heading `# Rulings: 13. Another entry`, plan opened for entry 12** (ruling item 4). Read in `plan`: the unchanged `plan` reads only `rulings/<slug>.md`, so `rulings/12.md` is not read, shown or removed, and no heading check exists.
- **Case 4b, `check_config.py` on a `projects:` form whose projects `a` and `b` give `ledger_root: .scratch` and `ledger_root: ./.scratch`** (ruling item 4). The run was made on a scratch repository at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/case4b`, its `docs/plan.yaml` holding those two projects. `python3 <worktree>/skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` printed the line below, after its note lines, and exited 0:
  ```
  ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
  ```
- **Case 5, `rulings/12-old-title.md` with the heading `# Rulings: 12`.** Read in `plan` and `grill`: on the unchanged tree that file is read only when the entry's slug is `12-old-title`. Otherwise neither skill names it, and no check names a file at another path.
- **Case 6, the sync.** `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0.
- **The case the brief's rules got wrong.**
  - The cases: case 3 together with the first bullet of "What to build" 7.
  - The rule: `grill` wrote `# Rulings: <number>. <title>` once, and `plan` copied the file only when the heading named the entry "by number or by number and title".
  - The result: after a title change, the heading kept the old title, so `/plan` would have shown the entry's own file as another entry's and copied nothing. Entry 27's own history is this case. `git show 082b363 -M -- .scratch/rulings | grep -n '^[-+]# Rulings'` printed a heading that changed with the title.
  - The ruling, `agents/briefs/4-cases.md` round 0, in short:
    - `grill` rewrites the heading with the current number and title at every write.
    - `plan` compares the heading's number only.
    - `check_config.py` refuses two projects of one `projects:` form whose `ledger_root` values resolve to one folder, with its test cases and head comment.
    - `plan` "What it reads" 1 says that each project has a ledger root of its own.
    - Case 4 is replaced by cases 4a and 4b, and case 3 also checks the heading's new title.
    - `ordo-init` goes to 6.0.0.
    - The paths widen by `check_config.py` and `check_config.test.sh`, and verify gains two lines.

## The test of the behaviour the change adds

| Behaviour | Case | Failing line on the unchanged script |
|---|---|---|
| Two projects whose `ledger_root` values are two strings resolving to one folder are refused with the folder and both projects | `projects-one-ledger` in `check_config.test.sh` (`.scratch` and `./.scratch`) | `FAIL: projects-one-ledger: expected an error, got a pass: note: docs/plan.yaml: tool-a: adr folder docs/adr does not exist yet; ordo-init or grill creates it` |

- **How the unchanged script was run.** The new `check_config.test.sh` ran on a scratch layout at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/base`, which holds `git show HEAD:` of `check_config.py`, `plan/templates/plan.yaml` and `plan/templates/plan.projects.yaml`. The command was `sh .../base/skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | grep 'FAIL\|PASS'`. It printed only the FAIL line above.
- **The control.** `projects-two-ledgers` gives the two projects the ledger roots `.scratch` and `./.scratch/tool-b`, two folders, one inside the other, and must pass. The suite stops at its first FAIL, and `projects-one-ledger` comes before the control. On the unchanged script the run therefore stopped before the control and before the changed `merge-key` fixture. Neither has a run on the unchanged script.
- **The changed fixture.** The `merge-key` fixture now gives `tool-b` its own `ledger_root: ../tools/tool-b/.scratch` and `archive_root: ../tools/tool-b/.scratch/archive`. Without them `tool-b` merges `tool-a`'s ledger root and the new error refuses the fixture. The case still tests that a merge key is not a key written twice.
- **After the change.** `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests`.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. `grill` "What it reads" 6 names `<ledger_root>/rulings/<number>.md` and the number by `plan` "What it reads" 4; the heading is rewritten at every write (ruling 1) | DONE | `git grep -n 'rulings/<number>.md' -- skills/orchestration/grill` prints lines 49, 167 and 285 |
| 2. `plan` "What it reads" 4: the path, the one number rule and a worked example; Steps 1 unchanged | DONE | `git grep -n 'rulings/<number>.md' -- skills/orchestration/plan` prints lines 63 and 68; Steps 1 (lines 91 to 94) is not in the diff |
| 3. `self-rule.md` lines 115 and 142 | DONE | the grep of case 1 prints `self-rule.md:115` and `:142` |
| 4. `plan-terms.md` **rulings file**, and the glossary synced | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --write --only glossary` printed `written: the plan-terms block now equals the template`; `git diff -U0 docs/glossary.md` has the one hunk `@@ -115 +115 @@` |
| 5. Every other page names the new path; ADR 0059 line 7 in words; roadmap line 50 and ADR 0018 line 7 untouched | DONE | the greps below; `git diff --name-only` lists neither `docs/roadmap.md` nor ADR 0018 |
| 6. Versions `grill` 3.0.0, `plan` 7.0.0, `plan-orchestration` 9.0.1, `ordo-init` 6.0.0 | DONE | `git diff` of each `SKILL.md` line 5 |
| 7a. `plan` copies the number-path file only when its heading's number is the entry's; otherwise shown at Steps 3, not copied or removed (ruling 2) | DONE | `plan` "What it reads" 4, sub-bullets 3 and 4; Steps 3, the new bullet |
| 7b. `plan` at Steps 3 and `grill` in the first round name a file at another path whose heading holds the entry's number, saying it is not read and giving the path | DONE | `plan` "What it reads" 4, sub-bullet 5, and Steps 3; `grill` "What it reads" 6 and Steps 6 |
| Ruling 3: `check_config.py` error, head comment, two test cases | DONE | the test table above; head comment line 19 |
| Ruling 3: `plan` "What it reads" 1 says each project has a ledger root of its own | DONE | `skills/orchestration/plan/SKILL.md` lines 51 and 52 |
| 8. The user's reading of `grill` and `plan` | OPEN for landing | open item of kind 5 |

The verify lines, each run from the worktree root after the change:

- **The character-set check** over the ten files `git diff --name-only` lists: `printf '%s\0' $(git diff --name-only) | xargs -0 perl -CSD -ne '<the brief's program>'` printed nothing. `exit 0`.
- **The sync check.** `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0. It also passed on the unchanged tree, so it shows that the block stays in sync, not the change.
- **The sync test.** `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
- **The `<slug>` grep with the exclusion.** `git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'` printed nothing and exited 1.
- **The `<slug>` grep without the exclusion.** `git grep -n 'rulings/<slug>' -- skills docs utils README.md` printed only entry 27's gate line:
  ```
docs/roadmap.md:27:- Gate: you read the rewritten `README.md` and approve it; each image path in `README.md` names a file that exists, and there are three; for each figure `git ls-files docs/figures` lists, the folders between `docs/figures/` and the file name are a group of `skills/`, or a group and a skill folder of it, the figures of academic-pipeline under `researcher`'s; each of the fifteen skills named in the goal has a figure there; `python3` of each of the two figure scripts exits 0 and `git status --short docs/figures` then prints nothing; every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists; you read the new figures, the lifecycle figure, `researcher`'s text on the two READMEs and on the new mode, the layout of `code/README.md` and the text of `handbook`, and approve them; one run of `/researcher readme` on each of two projects under `research-hub/projects/` that you name and one run of `/handbook` on one software repository that you name, each made by a separate agent that invokes the installed skill, its drafts shown to you and written on your approval, and each old file read by you beside its new one and approved; you read the text of `grill` and `plan` on the rulings file and approve it; `git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing; the verify list of `docs/dev/building.md` passes on main.
  ```
- **The `<number>` grep.** `git grep -n 'rulings/<number>.md' -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration/references/self-rule.md skills/ordo/ordo-init/templates/plan-terms.md` printed a line in each of the four:
  ```
skills/orchestration/grill/SKILL.md:49:6. The Rulings of the open plan, when a folder under `<ledger_root>/`, outside the folder `archive_root` names, holds a `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, and otherwise the rulings file `<ledger_root>/rulings/<number>.md` when it exists.
skills/orchestration/grill/SKILL.md:167:   - The first round also names each file under `<ledger_root>/rulings/` that "What it reads" 6 does not read, with its path, saying that it is not read and giving the path `<ledger_root>/rulings/<number>.md` it would be read at.
skills/orchestration/grill/SKILL.md:285:   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file `<ledger_root>/rulings/<number>.md` ("What it reads" 6), created when it is absent.
skills/orchestration/plan-orchestration/references/self-rule.md:115:  - Before a plan is open for the entry, `Booked:` names the rulings file `<ledger_root>/rulings/<number>.md`, the number as the `plan` skill's "What it reads" 4 writes it.
skills/orchestration/plan-orchestration/references/self-rule.md:142:- The session finds the choice's bullet by the opening words its `Booked:` line gives, in the file that line names: the Rulings section of a plan's `plan.md` (for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`) or the entry's rulings file `<ledger_root>/rulings/<number>.md`.
skills/orchestration/plan/SKILL.md:63:4. The rulings file `<ledger_root>/rulings/<number>.md`, when it exists and its heading line names the entry: the settled design answers for the entry, the user's and those `/grill --self-rule` wrote, written while no plan was open, and, under its `## Agents` heading, the lookup agents `/grill` started while no plan was open.
skills/orchestration/plan/SKILL.md:68:   - A file under `<ledger_root>/rulings/` at another path whose heading line holds the entry's number is not read: Steps 3 names it with the draft, saying that it is not read and giving the path `<ledger_root>/rulings/<number>.md` it would be read at.
skills/ordo/ordo-init/templates/plan-terms.md:110:- **rulings file**: `<ledger_root>/rulings/<number>.md`, the entry's number written as `plan` "What it reads" 4 writes it, which holds the settled design answers for a roadmap entry, the user's and those `/grill --self-rule` wrote, one bullet line each, and a quoted ruling with its sub-bullets, and, under `## Agents`, the lookup agents `/grill` started, while no plan is open. `/plan` copies its Agents bullets into the new plan's Agents section, its other bullet lines into the new plan's Rulings, and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6, "Steps / Looking up a fact" and "Steps / Writing what settled".
  ```
- **The config test.** `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
- **The repository's own configuration.** `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` printed `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`, after its note lines, and exited 0.

The cases after the change, by reading:

- **Case 2.** `plan` "What it reads" 4 drops a full stop that ends the number and a project prefix, then writes the rest in lower case with each run of other characters as one `-`. It gives `27.md`, `27.md`, `3-a.md`, `7-a.md`, `2-e.md`, `2-e-a.md`, `5.md`, `13.md`, and `12.md` for `web/12` under the project's `ledger_root`. `grill` "What it reads" 6 names that rule.
- **Case 3.** `grill` writes to `rulings/12.md` before the diff and after it. "Writing what settled" 1 rewrites the first line at every write to `# Rulings: <entry>`, the number and title as the roadmap writes them after the round's roadmap diff, so the heading holds the new title.
- **Case 4a.** The heading `# Rulings: 13. Another entry` holds the number `13`, which is not `12`. `plan` "What it reads" 4 makes it another entry's file: Steps 3 shows it with the draft, and Steps 2 and 6 do not copy or remove it, since "the rulings file" is the file whose heading names the entry.
- **Case 4b.** The same scratch run printed the line below, after its note lines, and exited 1:
  ```
  error: docs/plan.yaml: the projects a and b have one ledger_root: docs/.scratch
  ```
- **Case 5.** `rulings/12-old-title.md` with the heading `# Rulings: 12` stands at another path and its heading holds `12`.
  - `plan` "What it reads" 4 does not read it, and Steps 3 names it with the path `<ledger_root>/rulings/12.md`.
  - `grill` "What it reads" 6 does not read it, either as the entry's file or for carried rulings, and the first round names it with that path. Steps 10 also names it, for a run that sends no round.

## Each new or changed item against the rules on list items and sentence length

- **`plan` "What it reads" 4, the number rule bullet (about 45 words).** It is one sentence holding one rule with its two qualifiers, the dropped full stop and the dropped prefix. The brief asks for "the one statement of the number rule", so splitting it would split the rule.
- **`plan` "What it reads" 4, the heading bullet.** It joins with a semicolon "the title in the heading is not compared". That is a limit of the same rule, and "Lists and tables" keeps a qualifier that limits a rule in the rule's bullet.
- **`plan` Steps 3, the self-rule bullet, and the "The drafted step list" row.** Both were already long lists of what the stop shows, and each gains one item.
- **`grill` "Writing what settled" 1, the heading bullet (about 40 words).** It is one rule, with the example the reader needs for the form of `<entry>`.
- **`grill` "What it reads" 6, the carried-rulings bullet.** It was already one long sentence, and it gains one qualifier, "whose heading line holds another number".
- **`check_config.py` head comment, the new error item.** It follows the form of the list's other items: the line printed, then when it is printed.
- **Every other new bullet** is under 30 words and holds one rule.

## Terms

- **rulings file.** The entry is changed: the path is now `<ledger_root>/rulings/<number>.md`, the number written as `plan` "What it reads" 4 writes it. "Stated in" names `plan` "What it reads" 4. `grep -n '^4\. The rulings file' skills/orchestration/plan/SKILL.md` prints line 63. The diff's uses in `grill`, `plan` and `self-rule.md` mean the file the entry defines.
- **slug.** It is used in ADR 0059 line 7, "named by the slug of its title". The entry defines the slug as the ledger folder's name derived from the roadmap entry, and line 7 states the old naming in those terms. `plan` Steps 1 still derives the ledger folder's slug.
- **carried ruling.** The entry says "of another rulings file under the ledger root". The narrowed `grill` bullet reads carried rulings from rulings files whose heading holds another number, which are the files of other entries. The entry still holds.
- **round, of an interview.** It is used in "the first round" in `grill` Steps 6 and Steps 10, in the entry's sense.

## Files with line counts (lines after the change; added and removed lines from `git diff --numstat`)

| File | Lines | Added | Removed |
|---|---|---|---|
| `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md` | 21 | 1 | 1 |
| `docs/glossary.md` | 190 | 1 | 1 |
| `skills/orchestration/grill/SKILL.md` | 415 | 11 | 7 |
| `skills/orchestration/plan-orchestration/SKILL.md` | 530 | 1 | 1 |
| `skills/orchestration/plan-orchestration/references/self-rule.md` | 175 | 2 | 2 |
| `skills/orchestration/plan/SKILL.md` | 252 | 12 | 4 |
| `skills/ordo/ordo-init/SKILL.md` | 587 | 2 | 1 |
| `skills/ordo/ordo-init/templates/check_config.py` | 357 | 10 | 1 |
| `skills/ordo/ordo-init/templates/check_config.test.sh` | 355 | 14 | 4 |
| `skills/ordo/ordo-init/templates/plan-terms.md` | 138 | 1 | 1 |

This report, `agents/reviews/4-report.md`, is the eleventh path written.

## Judgment calls the brief left open

1. **`skills/ordo/ordo-init/SKILL.md` line 359, outside the listed paths.** "Steps / A configured repository" 2 lists each error the configuration check reports. It gains "Two projects of the `projects:` form whose `ledger_root` values resolve to one folder." Without it, the list that says the skill "reports each of these" leaves out an error the script now prints (rule 5 and rule 14). It serves ruling 3.
2. **The error line's form** is `the projects <a> and <b> have one ledger_root: <folder from the repository root>`.
   - It is printed once per shared folder, naming every project that names it, joined by "and".
   - A project whose `ledger_root` is missing or refused by an earlier error is left out of the comparison, since it has no folder to compare.
   - `check_project` now returns the folder that the project's `ledger_root` resolves to, and its docstring says so.
3. **`grill`'s carried rulings.** "What it reads" 6 now reads carried rulings only from rulings files "whose heading line holds another number". The reason is item 7's "saying it is not read": a file at another path whose heading holds the entry's number is otherwise still read for carried rulings, and the round's message would then be false (rule 19).
4. **`grill` Steps 10** also lists the files not read, since under `--self-rule` the first round may not be sent and item 7 would otherwise go unmet there.
5. **`plan` under `--self-rule`.** Open item A and the "The drafted step list" row list the files shown as another entry's or named as not read, so that they reach the user under `--self-rule` too.
6. **`plan` "What it reads" 1.** The ruled sentence is two bullets: the rule that each project has its own ledger root, and the check that enforces it.
7. **Shared archive roots are not checked.** `check_config.py` does not compare `archive_root` between projects, since the ruling names `ledger_root` only. Case 4b's two projects also share `.scratch/archive`, and that run reports no error for it.

## Host- and user-visible changes, before and after

- **`grill`.**
  - Before: the file was written at `<ledger_root>/rulings/<slug>.md`, and its heading was written once when the file was created.
  - After: the file is written at `<ledger_root>/rulings/<number>.md`, and its heading is rewritten at every write with the current number and title. The first round, and the closing list, name each rulings file of the entry at another path as not read, with the path it would be read at.
- **`plan`.**
  - Before: `plan` read `<ledger_root>/rulings/<slug>.md`, and any file there was copied and removed.
  - After: `plan` reads `<ledger_root>/rulings/<number>.md` and copies and removes it only when the heading's number is the entry's. Otherwise Steps 3 shows it as another entry's file. Steps 3 names a file at another path whose heading holds the entry's number as not read.
  - A rulings file written at the old path is no longer read, and that is the reason for 7.0.0 and `grill` 3.0.0.
- **`check_config.py`, and so `/ordo-init` on a configured repository.**
  - Before: two projects of one `projects:` form could share a ledger root.
  - After: such a configuration exits 1 with `error: <file>: the projects <a> and <b> have one ledger_root: <folder>`. That is the reason for `ordo-init` 6.0.0.
- **The `Booked:` path of a choice before a plan is open.**
  - Before: `<ledger_root>/rulings/<slug>.md`.
  - After: `<ledger_root>/rulings/<number>.md` (`self-rule.md` line 115). The review of a choice looks the file up at the same path (line 142).
- **The glossary entry rulings file.**
  - Before: `<ledger_root>/rulings/<slug>.md`, which holds...
  - After: `<ledger_root>/rulings/<number>.md`, the entry's number written as `plan` "What it reads" 4 writes it, which holds...
- **ADR 0059 line 7.**
  - Before: "the rulings file `<ledger_root>/rulings/<slug>.md` while no plan is open".
  - After: "a rulings file under `<ledger_root>/rulings/` named by the slug of its title while no plan is open".

## Anything in the brief that was wrong or impossible

- **Case 3 and "What to build" 7, first bullet.** The two could not both hold. The cases ruling settled this, as "The cases' first run" records.
- **Item 1's "the file keeps its heading line `# Rulings: <entry>`".** Ruling 1 replaces it: the heading keeps that form, and its number and title are rewritten at every write.
- Nothing else in the brief was wrong or impossible.
