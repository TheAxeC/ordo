# Step 4 report: the rulings file named by its entry's number

Everything in the brief is done, under the cases ruling `agents/briefs/4-cases.md` (round 0) and the repair round `agents/briefs/4-round-1.md` (round 1). "What to build" 8, the user's reading of `grill` and `plan` on the rulings file, is the step's check and stays open for landing as an open item of kind 5. One sub-bullet, judgment call 3, waits on the orchestrator's ruling.

## Open items of the state file, verbatim

These are the open items of the worktree's state file, as `awk '/^## Open items/,/^## Closed items/'` printed them. The round brief says the user has ruled Open item C: D33's check is `git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'`, which must print nothing.

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.
- Open item C (2026-11-25, step 4, kind 3, ruling D33): D33's check "`git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing" can never print nothing, because `docs/roadmap.md` line 27, entry 27's own gate, holds the pattern (`git grep -n 'rulings/<slug>' -- docs/roadmap.md` prints line 27). Step 4 goes on meanwhile: it rewrites ADR 0059's Context line so it no longer holds the pattern, and runs the check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The check reads "`git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'` prints nothing", in D33 and in entry 27's gate, written by `/roadmap` at the closing. Pro: it checks every page that states the rule; the one line left out is the check itself. Con: none found.
  - (b) The gate keeps D33's words, and the closing records that the check printed its own line. Pro: no change to the ruling. Con: the gate's output then shows a part that did not pass as written.
  - Lazy option: (b), since it changes nothing now and leaves a failed check in the record.

## The cases' first run, on the unchanged tree

The unchanged tree is the base, e4e0198. A case that a later ruling replaced is given with the ruling's wording.

- **Case 1, the greps.**
  - `git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'` exited 0 with seven lines. They are `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md:7`, `docs/glossary.md:115`, `skills/orchestration/grill/SKILL.md:49`, `skills/orchestration/plan-orchestration/references/self-rule.md:115`, `skills/orchestration/plan-orchestration/references/self-rule.md:142`, `skills/orchestration/plan/SKILL.md:61` and `skills/ordo/ordo-init/templates/plan-terms.md:110`, each holding `<ledger_root>/rulings/<slug>.md`.
  - Without the exclusion, it exited 0 with those seven lines and `docs/roadmap.md:27`.
  - The `rulings/<number>.md` grep over the four places printed nothing and exited 1.
- **Case 2, the number rule.** Read in `plan` "What it reads" 4 and Steps 1: the base states no number rule. The file is named by the slug of the whole entry, so `27` gives `27-a-newcomer-s-readme-...-for-every-skill.md` and not `27.md`, and so for every number listed.
- **Case 3, a title changed by `grill`'s own roadmap diff** (cases ruling, item 5). Read in `grill` "What it reads" 6 and line 50: the path comes from the slug of the title, so the files before and after the diff are two paths. Line 282 writes the heading only "when it is absent".
- **Case 4a, `rulings/12.md` headed `# Rulings: 13. Another entry`, `plan` for entry 12** (cases ruling, item 4). Read in `plan`: the base reads only `rulings/<slug>.md`, so `rulings/12.md` is not read, shown or removed.
- **Case 4b, projects `a` and `b` with `ledger_root: .scratch` and `ledger_root: ./.scratch`** (cases ruling, item 4). On a scratch repository at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/case4b`, `python3 <worktree>/skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` exited 0, after its note lines:
  ```
  ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
  ```
- **Case 5, `rulings/12-old-title.md` headed `# Rulings: 12`.** The base reads it only when the entry's slug is `12-old-title`. Otherwise neither skill names it.
- **Case 6, the sync.** `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0.
- **Round 1, case of ruling 1: `grill` on `rulings/12.md` headed `# Rulings: 13. Another entry`, for entry 12.**
  - On the base, `grill` reads `rulings/<slug>.md` (`git show e4e0198:skills/orchestration/grill/SKILL.md`, lines 49 and 50). No stop exists.
  - On the tree before the round, `grill` read the file as the entry's own and rewrote its heading. That is the reviewer's Behaviour 1.
- **Round 1, case of ruling 3: `plan` on `rulings/12-one-object-per-file.md` headed `# Rulings: One object per file`, for entry `12. One object per file`.**
  - On the base, that path is the entry's slug path, so `plan` reads and copies the file.
  - On the tree before the round, the file is neither read nor named.
- **Round 1, ruling 2: `rulings/one-object-per-file.md` headed `# Rulings: One object per file`, holding a bullet that names entry 30 and ends "(the user)", for `/grill 30`.**
  - On the base, every other rulings file is read for carried rulings (`git show e4e0198:skills/orchestration/grill/SKILL.md`, line 52), so the bullet is carried.
  - On the tree before the round, the qualifier "whose heading line holds another number" left the file out.
- **The case the brief's rules got wrong (round 0).**
  - The case: case 3 together with "What to build" 7, first bullet. `grill` wrote the heading with number and title once, and `plan` matched the heading "by number or by number and title".
  - The result: after a title change, `plan` would have read the entry's own file as another entry's and copied nothing. `git show 082b363 -M -- .scratch/rulings | grep -n '^[-+]# Rulings'` printed the heading of entry 27's file changing with its title.
  - The orchestrator's ruling, `agents/briefs/4-cases.md`:
    - `grill` rewrites the heading at every write.
    - `plan` compares the heading's number only.
    - `check_config.py` refuses two projects of one form whose `ledger_root` values resolve to one folder, with its tests and head comment.
    - `plan` "What it reads" 1 says each project has a ledger root of its own.
    - Case 4 becomes cases 4a and 4b.
    - `ordo-init` goes to 6.0.0.
    - Two paths and two verify lines are added.

## The test of the behaviour the change adds, and the preserved cases

| Behaviour | Case | Run on the unchanged script |
|---|---|---|
| Two projects whose `ledger_root` values are two strings resolving to one folder are refused with the folder and both projects | `projects-one-ledger` (`.scratch` and `./.scratch`) | `FAIL: projects-one-ledger: expected an error, got a pass: note: docs/plan.yaml: tool-a: adr folder docs/adr does not exist yet; ordo-init or grill creates it` |

- **The failing run.** The new `check_config.test.sh` ran on a scratch layout holding `git show e4e0198:` of `check_config.py`, `plan/templates/plan.yaml` and `plan/templates/plan.projects.yaml`. The command was `sh <layout>/skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | grep 'FAIL\|PASS'`, and it printed the FAIL line in the table.
- **The preserved cases, run by hand on the unchanged script** (ruling 7), in the layout at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/r1`.
  - Each fixture was built by the test's own commands: `make_projects_repo`, `set_project_key`, and the sed and printf of `make_merge_repo` with the new `ledger_root` and `archive_root` lines.
  - Each was checked by `python3 /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/r1/base/skills/ordo/ordo-init/templates/check_config.py <fixture>/docs/plan.yaml`.
  - `merge-key`, the changed fixture: `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`, and `merge-key exit 0`.
  - `projects-two-ledgers`, the control: `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`, and `two exit 0`.
- **After the change.** `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests`. That covers the error case, the control and the merge-key fixture.

## Repair round 1

1. **`grill`'s stop "Another entry's rulings file".**
   - `grill` "What it reads" 6 reads the file at the number path only when its heading's number equals the entry's, as `plan` "What it reads" 4 says.
   - A file there whose heading holds another number is the stop. Steps 2 raises it before the first round and before anything is written.
   - The Stops table gains the row, and its opening line reads "The first four rows are stops".
   - Evidence: `grep -n "Another entry" skills/orchestration/grill/SKILL.md` prints lines 52, 107 and 394. The row shows "The file's path and its heading line" and resumes on "The user moves or renames the file, then `/grill <entry>` again".
   - The case, read after the change: on `rulings/12.md` headed `# Rulings: 13. Another entry` for entry 12, `grill` stops at Steps 2, with nothing read as the entry's rulings and nothing written.
2. **The carried-rulings qualifier** reads "whose heading line does not hold the entry's number".
   - The case, read after the change: the heading of `rulings/one-object-per-file.md` holds no number, and its title is not entry 30's. `/grill 30` reads it for carried rulings.
   - The glossary entry **carried ruling** ("of another rulings file under the ledger root"), read against it, still holds.
3. **Title-only headings named as not read.**
   - `plan` "What it reads" 4 and `grill` "What it reads" 6 each gain: "A file under `<ledger_root>/rulings/` whose heading line holds no number, its text after `# Rulings: ` being the entry's title, is not read."
   - The places that name the files not read cover it by the same words: `plan` Steps 3, Open item A and the row "The drafted step list", and `grill` Steps 6 and 10.
   - The case, read after the change: `plan` names `rulings/12-one-object-per-file.md` at Steps 3 as not read, with `<ledger_root>/rulings/12.md`.
4. **The ledger-root sentence in `plan` "What it reads" 1** (lines 51 to 55). No new check was added.
   - Each `plan.yaml` of the repository, and each project of the `projects:` form, has a ledger root of its own.
   - `check_config.py` refuses two projects of one form that share one.
   - Two `plan.yaml` files that share one are not checked.
   - On such a root, another entry's file is `grill`'s stop.
   - On such a root, Steps 3 shows that file.
5. **ADR 0059's Consequences** gain this paragraph, as `tail -1` of the file prints it:
   ```
   `plan` copies the file at the number path only when the number in its heading equals the entry's, and `grill` stops on another entry's file there. Since a file name holds the number alone, each project of a `projects:` form, and each `plan.yaml`, has a ledger root of its own, and the `ordo-init` skill's `check_config.py` refuses two projects of one form whose ledger roots resolve to one folder.
   ```
6. **The joined bullets split.**
   - `grill`'s old line 51 is now four bullets: read only when, the stop, not read at another path, and the first round naming the files.
   - `plan` "What it reads" 4 has split:
     - the two examples;
     - the heading rule, and "the title in the heading is not compared";
     - another entry's file, with the sub-bullets "Steps 3 shows it" and "neither copied nor removed";
     - the not-read rules;
     - the naming at Steps 3.
   - `plan` Steps 3 is two bullets, and the shared-root sentence of `plan` "What it reads" 1 is two bullets.
   - Every added line of `git diff -U0 skills docs/adr | grep '^+'` was read for " and ", "; " and ": ". The lines kept whole are under "Each new or changed item".
7. **The fixtures on the unchanged script.** Quoted above.
8. **The versions** are unchanged: `grill` 3.0.0, `plan` 7.0.0, `plan-orchestration` 9.0.1, `ordo-init` 6.0.0. `git diff` of each `SKILL.md` line 5 shows them.
9. **The verify runs** are below.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. `grill`: the number path, the number by `plan` "What it reads" 4, the heading at every write, and the stop | DONE | the `<number>` grep prints `grill` 49, 173, 291 and 394 |
| 2. `plan` "What it reads" 4: path, number rule, examples; Steps 1 unchanged | DONE | the grep prints `plan` 66 and 77; Steps 1 (lines 100 to 103) has no hunk |
| 3. `self-rule.md` 115 and 142 | DONE | the `<number>` grep |
| 4. `plan-terms.md`, glossary synced | DONE | `--write --only glossary` printed `written: the plan-terms block now equals the template`; `git diff -U0 docs/glossary.md`: `@@ -115 +115 @@` |
| 5. Other pages; ADR 0059 line 7 in words; roadmap and ADR 0018 untouched | DONE | the greps below; neither file is in `git diff --name-only` |
| 6. Versions | DONE | round item 8 |
| 7a and 7b | DONE | `plan` "What it reads" 4 and Steps 3; `grill` "What it reads" 6, Steps 6 and 10 |
| Cases ruling 3 | DONE | the test table; `check_config.py` head comment line 19; `plan` lines 51 to 55 |
| Repair round 1, rulings 1 to 9 | DONE | "Repair round 1" |
| 8. The user's reading | OPEN for landing | open item of kind 5 |

The verify lines, run from the worktree root after the round:

- **The character-set check**, over the ten changed files and this report: `printf '%s\0' $(git diff --name-only) .scratch/27-*/agents/reviews/4-report.md | xargs -0 perl -CSD -ne '<the brief's program>'` printed nothing. `exit 0`.
- **The sync check.** `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` and exited 0. It also passed on the unchanged tree, so it shows the block stays in sync, not the change.
- **The sync test.** `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
- **The config test.** `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
- **The repository's own configuration.** `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` printed `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists` after its note lines, and exited 0.
- **D33's check, as the user ruled it.** `git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'` printed nothing and exited 1.
- **Case 1, with the exclusion.** `git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'` printed nothing and exited 1.
- **Case 1, without the exclusion.** `git grep -n 'rulings/<slug>' -- skills docs utils README.md` printed:
  ```
docs/roadmap.md:27:- Gate: you read the rewritten `README.md` and approve it; each image path in `README.md` names a file that exists, and there are three; for each figure `git ls-files docs/figures` lists, the folders between `docs/figures/` and the file name are a group of `skills/`, or a group and a skill folder of it, the figures of academic-pipeline under `researcher`'s; each of the fifteen skills named in the goal has a figure there; `python3` of each of the two figure scripts exits 0 and `git status --short docs/figures` then prints nothing; every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists; you read the new figures, the lifecycle figure, `researcher`'s text on the two READMEs and on the new mode, the layout of `code/README.md` and the text of `handbook`, and approve them; one run of `/researcher readme` on each of two projects under `research-hub/projects/` that you name and one run of `/handbook` on one software repository that you name, each made by a separate agent that invokes the installed skill, its drafts shown to you and written on your approval, and each old file read by you beside its new one and approved; you read the text of `grill` and `plan` on the rulings file and approve it; `git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing; the verify list of `docs/dev/building.md` passes on main.
  ```
- **Case 1, the `<number>` grep.** `git grep -n 'rulings/<number>.md' -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration/references/self-rule.md skills/ordo/ordo-init/templates/plan-terms.md` printed:
  ```
skills/orchestration/grill/SKILL.md:49:6. The Rulings of the open plan, when a folder under `<ledger_root>/`, outside the folder `archive_root` names, holds a `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, and otherwise the rulings file `<ledger_root>/rulings/<number>.md` when it exists.
skills/orchestration/grill/SKILL.md:173:   - The first round also names each file under `<ledger_root>/rulings/` that "What it reads" 6 does not read, with its path, saying that it is not read and giving the path `<ledger_root>/rulings/<number>.md` it would be read at.
skills/orchestration/grill/SKILL.md:291:   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file `<ledger_root>/rulings/<number>.md` ("What it reads" 6), created when it is absent.
skills/orchestration/grill/SKILL.md:394:| Another entry's rulings file | The file at `<ledger_root>/rulings/<number>.md` has a heading line that holds another number ("What it reads" 6, Steps 2); nothing is read or written | The file's path and its heading line | The user moves or renames the file, then `/grill <entry>` again |
skills/orchestration/plan-orchestration/references/self-rule.md:115:  - Before a plan is open for the entry, `Booked:` names the rulings file `<ledger_root>/rulings/<number>.md`, the number as the `plan` skill's "What it reads" 4 writes it.
skills/orchestration/plan-orchestration/references/self-rule.md:142:- The session finds the choice's bullet by the opening words its `Booked:` line gives, in the file that line names: the Rulings section of a plan's `plan.md` (for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`) or the entry's rulings file `<ledger_root>/rulings/<number>.md`.
skills/orchestration/plan/SKILL.md:66:4. The rulings file `<ledger_root>/rulings/<number>.md`, when it exists and its heading line names the entry: the settled design answers for the entry, the user's and those `/grill --self-rule` wrote, written while no plan was open, and, under its `## Agents` heading, the lookup agents `/grill` started while no plan was open.
skills/orchestration/plan/SKILL.md:77:   - Steps 3 names each file that is not read with the draft, saying that it is not read and giving the path `<ledger_root>/rulings/<number>.md` it would be read at.
skills/ordo/ordo-init/templates/plan-terms.md:110:- **rulings file**: `<ledger_root>/rulings/<number>.md`, the entry's number written as `plan` "What it reads" 4 writes it, which holds the settled design answers for a roadmap entry, the user's and those `/grill --self-rule` wrote, one bullet line each, and a quoted ruling with its sub-bullets, and, under `## Agents`, the lookup agents `/grill` started, while no plan is open. `/plan` copies its Agents bullets into the new plan's Agents section, its other bullet lines into the new plan's Rulings, and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6, "Steps / Looking up a fact" and "Steps / Writing what settled".
  ```
- **Case 4b, after the change**, on the same scratch repository: exit 1, and after its note lines:
  ```
  error: docs/plan.yaml: the projects a and b have one ledger_root: docs/.scratch
  ```

The cases after the change, by reading:

- **Case 2.** `plan` "What it reads" 4 gives each listed result: `27.md` for `27` and for `27.`, `3-a.md`, `7-a.md`, `2-e.md`, `2-e-a.md`, `5.md`, `13.md`, and `12.md` for `web/12` under the project's `ledger_root`. `grill` names the rule without restating it.
- **Case 3.** The path is `rulings/12.md` before and after the diff, and the heading holds the new title after the write ("Writing what settled" 1).
- **Case 4a.** `plan` shows the file as another entry's and neither copies nor removes it. For `grill`, ruling 1's case applies.
- **Case 5.** Neither skill reads the file. `plan` Steps 3 and `grill` Steps 6 and 10 name it, with `<ledger_root>/rulings/12.md`.

## Each new or changed item against the rules on list items and sentence length

- **`plan` "What it reads" 4, the number-rule bullet (about 45 words).** It is one rule with its qualifiers, as the brief's "one statement of the number rule" asks.
- **The naming bullets of `plan` "What it reads" 4 and `grill` Steps 6.** "saying that it is not read and giving the path" states what one naming holds, in the wording of "What to build" 7.
- **`grill` "What it reads" 6, "read only when ...: the number in the heading equals the entry's".** The colon gives the rule's condition.
- **The `grill` Stops row.** Its "; nothing is read or written" is a cell phrase.
- **The carried-rulings bullet, Open item A and "The drafted step list" row.** They were long already, and each gains one qualifier or one item.
- **The `check_config.py` head comment item** has the list's form.

## Terms

- **rulings file.** The entry is changed: the path is `<ledger_root>/rulings/<number>.md`, the number as `plan` "What it reads" 4 writes it. Its "Stated in" names `plan` "What it reads" 4, and `grep -n '^4\. The rulings file' skills/orchestration/plan/SKILL.md` prints line 66.
- **carried ruling.** Read against ruling 2, it holds.
- **slug.** It is used in ADR 0059 line 7, in the entry's sense.
- **stop.** "Another entry's rulings file" is a point of a Stops table where `grill` waits on the user, which is the entry's second sense.
- **round, of an interview.** "The first round" is used in the entry's sense.

## Files with line counts (lines after the change; `git diff --numstat` added and removed)

| File | Lines | Added | Removed |
|---|---|---|---|
| `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md` | 23 | 3 | 1 |
| `docs/glossary.md` | 190 | 1 | 1 |
| `skills/orchestration/grill/SKILL.md` | 422 | 20 | 9 |
| `skills/orchestration/plan-orchestration/SKILL.md` | 530 | 1 | 1 |
| `skills/orchestration/plan-orchestration/references/self-rule.md` | 175 | 2 | 2 |
| `skills/orchestration/plan/SKILL.md` | 262 | 22 | 4 |
| `skills/ordo/ordo-init/SKILL.md` | 587 | 2 | 1 |
| `skills/ordo/ordo-init/templates/check_config.py` | 357 | 10 | 1 |
| `skills/ordo/ordo-init/templates/check_config.test.sh` | 355 | 14 | 4 |
| `skills/ordo/ordo-init/templates/plan-terms.md` | 138 | 1 | 1 |

This report is the eleventh path written. `git status --short` also lists `agents/briefs/4-cases.md`, `agents/briefs/4-round-1.md` and `agents/reviews/4-refuter.md` as untracked in the worktree's ledger, which I did not write.

## Judgment calls the brief left open

1. **`skills/ordo/ordo-init/SKILL.md` line 359, outside the listed paths.** It gains the new error in the list of errors the configuration check reports, under rules 5 and 14. The reviewer found it justified.
2. **The error line.**
   - It is printed once per shared folder and names every project of that folder.
   - A project whose `ledger_root` is missing or already refused is left out.
   - `check_project` returns the folder its project's ledger root resolves to.
3. **For the orchestrator to rule: a sub-bullet beside ruling 2.**
   - The sub-bullet: `grill` "What it reads" 6 gains "A file this item names as not read is not read for carried rulings either."
   - Why: with ruling 2's qualifier alone, a title-only file of the entry itself (ruling 3) holds no number. `grill` would read it for carried rulings while the first round says it is not read, and rule 19 forbids that contradiction.
   - What it changes: only the entry's own files named as not read. Ruling 2's case, another entry's file, is still read.
   - Ruled out, the "not read" message would be false for such a file.
4. **`grill` Steps 10, and `plan`'s Open item A and Stops row,** list the files not read, so that they reach the user under `--self-rule` when no round is sent.
5. **The new stop** stands among the stops of `grill`'s Stops table, and the opening line reads "first four".
6. **`archive_root` is not compared** between projects, since the rulings name `ledger_root` only.

## Host- and user-visible changes, before and after

- **`grill`.**
  - Before: it read and wrote `<ledger_root>/rulings/<slug>.md`, and wrote the heading once.
  - After:
    - It reads and writes `<ledger_root>/rulings/<number>.md` and rewrites the heading at every write.
    - On another entry's file at that path it stops, showing the path and the heading.
    - It names the entry's files that it does not read, with the path they would be read at.
- **`plan`.**
  - Before: it read `<ledger_root>/rulings/<slug>.md` and copied any file there.
  - After:
    - It copies `<ledger_root>/rulings/<number>.md` only when the heading's number is the entry's.
    - It shows another entry's file at Steps 3 and does not copy or remove it.
    - It names the entry's files that are not read.
  - A file at the old path is no longer read, which is why `plan` is 7.0.0 and `grill` 3.0.0.
- **`check_config.py`, and `/ordo-init` on a configured repository.**
  - Before: two projects of one form could share a ledger root.
  - After: such a configuration exits 1 with `error: <file>: the projects <a> and <b> have one ledger_root: <folder>`, which is why `ordo-init` is 6.0.0.
- **`self-rule.md`, the `Booked:` path before a plan is open and the review of a choice.** Before: `<ledger_root>/rulings/<slug>.md`. After: `<ledger_root>/rulings/<number>.md`.
- **The glossary entry rulings file.** Before: it opened with `<ledger_root>/rulings/<slug>.md`. After: it opens with `<ledger_root>/rulings/<number>.md`, the entry's number written as `plan` "What it reads" 4 writes it.
- **ADR 0059.** Line 7 names the old file in words, and the Consequences gain the paragraph in round item 5.

## Anything in the brief that was wrong or impossible

- **Case 3 and "What to build" 7, first bullet.** They could not both hold, and the cases ruling settled it.
- **Round 1, rulings 2 and 3 together.** For a title-only file of the entry itself, they leave two contradicting statements. Judgment call 3 resolves it and waits on the orchestrator's ruling.
