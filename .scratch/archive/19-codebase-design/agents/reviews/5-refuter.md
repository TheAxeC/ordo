# Review of step 5, `repo-setup` merged into `ordo-init`

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-5, base 7219d6c. Nothing was changed there. Two scratch runs were made outside the repository, under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/ (`fig5/`, a copy of `gen_figures.py` run there; `find5/`, a scratch `plan.yaml` for `check_config.py --find`).

Line numbers of the merged skill are those of /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-5/skills/ordo/ordo-init/SKILL.md.

## Checks of "Verify before you report", as printed here

1. Character-set check over the changed files: printed nothing, then `exit status 0`.
2. Cases:
   - Case 6: `PASS: sync_rules.py scratch tests`.
   - Case 7: `ok: the plan-terms block equals the template`, exit 0.
   - Case 8: `PASS: check_config.py scratch tests`.
   - Case 9: `ugrep: warning: CLAUDE.md: No such file or directory`, then 9 lines in `skills/code/codebase-design/SKILL.md` (24, 31, 35, 42, 49, 74, 109, 171, 179) and 4 lines in `docs/adr/0047-...md` (7, 11, 17, 38). Nothing else.
   - Case 10: last lines `note: docs/plan.yaml: design_references not set, default [] applies` and `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0.
3. Frontmatter: `ordo-init 972 4.0.0`.
4. `ls skills/ordo` prints `ordo-help ordo-init session-retro wait-what`. `grep -c 'twenty-one' README.md` prints `2`, `grep -c 'twenty-two' README.md` prints `0`. `ls -d skills/*/*/ | wc -l` prints `21`.
5. `gen_figures.py` was not run inside the worktree, since it writes there. A copy run in the scratchpad exited 0, and `cmp` of every `.svg` it wrote against `docs/figures/` printed no difference. `git status --short` lists under `docs/figures` only `gen_figures.py` and `pipeline.svg`. `pipeline.svg` rendered with `rsvg-convert -w 1600` and looked at: one lane `/ordo-init` with twelve stops in three rows of four, every box and label inside the frame.
6. `docs/dev/building.md` lines 16 and 17 are cases 6 and 7 at the new path. Both pass (above).
7. Read by me; results under "Findings".

## The builder's quoted evidence, rerun

- Moved files: a loop of `git show 7219d6c:<old path> | cmp -s - <new path>` over the deleted template paths printed `differs:` for `templates/docs/glossary.md`, `templates/plan-terms.md` and `templates/shared-rules.md` only. Reproduced.
- `git diff 7219d6c --numstat`: every count in the report's file list reproduced (`ordo-init/SKILL.md` 287/55 and 449 lines by `wc -l`, README 17/19, glossary 21/18, `gen_figures.py` 16/23, `pipeline.svg` 118/121, the rest as listed).
- 21 moved files and 1188 lines (`find ... | wc -l`, `cat | wc -l`), 22 deletions under `skills/ordo/repo-setup` (`git status --short | grep -c`). Reproduced.
- `grep -c repo-setup /Users/axelfaes/workspace/ordo/CLAUDE.md` prints `0`. Reproduced.
- README line 29 equals line 30 of the base (`cmp`). Reproduced.
- A recursive `grep` for `repo-setup|repo_setup` outside `.scratch`, `.agents`, `codebase-design` and ADR 0047 prints only `docs/roadmap.md` lines 77, 79, 81, 85, 86, 106, 109. This reproduces the content of the builder's `git grep` claim by another command.
- Not reproduced: "Every item of Steps now ends on a completion criterion" (finding P1).

## Verdicts on "What to build"

1. Holds. `skills/ordo/repo-setup/` is gone, 21 files stand under `skills/ordo/ordo-init/templates/`, 18 byte-equal, 3 changed in the lines that name the skill.
2. Violated, by findings S1, S2, S3, S4, T1, T2, T4. The three cases, their order, the arguments, the frontmatter and the carried stops, anti-patterns and rules are there. The merged text contradicts itself in one place, has one command that sends a call to the wrong case, and leaves the commit rule of the third case unstated.
3. Violated, by findings T3 and T5 (two glossary entries the change leaves stale). Every other named file was read and its sentences hold.
4. Holds. `git status --short` lists no path under `skills/code/codebase-design/`.
5. Not applicable. The worktree has no root `CLAUDE.md`, and the main checkout's file holds no `repo-setup` (the grep above).

## Verdicts on the cases

1. Met. Steps 1 (line 74) sends a folder with no tracked file to "A new repository": `git init` (1), the questions (2), the tree drafted with every file's text (3), shown together (4), written after approval (5), the plan configuration through "An existing repository" (8), then the checks and the commit.
2. Met. "An existing repository" 1 to 9 draft `plan.yaml` and offer missing pages. Item 10 (lines 227-228) gives a `CLAUDE.md` with no block the change of "A configured repository" 10, which holds "Each rule of the existing `CLAUDE.md` that the block now states, listed for removal". Item 12 shows it, item 13 stops, item 14 writes. Before that only the verification commands of item 3 run.
3. Met. Line 229: "With no `CLAUDE.md`, the file is offered from `templates/CLAUDE.md`". Item 6 asks questions 1, 5 and 9 for it.
4. Met for a call without a project name. "A configured repository" 1 to 6, then 7 and 9. With `<folder>/<project>` the call does not reach this case (finding S2).
5. Met. Line 324: "nothing is written, and the two `ok:` lines are shown with the check's output".
6. Met. 7. Met. 8. Met. 9. Met. 10. Met. Output above.

## Old text against new text

Every numbered item, bullet, stop, anti-pattern and rule of both old files was looked up in the merged file. Carried with the same meaning unless listed here.

Missing or changed in meaning:

- Old `ordo-init`, "Checking an existing file" 1: "With a plan configuration present ("What it reads" 2), write nothing." New line 280: "No plan configuration and no page is drafted for a repository that has a plan configuration." The old sentence said the check writes nothing. The new one is a different rule, and it is false of the same subsection (finding S1).
- Old `repo-setup`, "What it reads" 5: "With no `plan.yaml`, or one whose `standards` list names no glossary, the glossary is `docs/glossary.md`." New line 49 keeps the second half only. With it goes the old behaviour: `/repo-setup sync` compared the blocks of a repository with no `plan.yaml`; now such a repository is the second case (finding B1).
- Old `repo-setup`, "Steps / sync" 7: "The file named in the line is fixed first, by the user or with the user's approval." Kept at line 351, with a rule added at line 352 (finding S3).
- Old `ordo-init`, Rules 3: "A page the skill writes states what the repository already does or says." New line 439 adds "in an existing repository" and "beside its template's text". The narrowing is needed for the template pages. It leaves open whether the building page written from "A new repository" 8 falls under it. No failure found from it; named for the orchestrator.
- Old `ordo-init`, "What it reads" 3: the ruling states the commit rule "When the skill runs alone under a quoted ruling". New line 44 drops "runs alone". In a new repository the ruling that answers question 5 gives the same result, so no failure found.
- Removed as the brief says: the refusal "Tracked files", the two lines under the old Stops table, the two "Use instead" rows that named the other skill.

Additions that no old item holds: Steps 1 (the case), "An existing repository" 10 and 11, the bullet in item 6 on questions 1, 5 and 9, the bullet in item 7 on an offered glossary, the comparison in item 15, line 352, the `ok:` lines shown at line 324, and the completion criteria.

## The twelve judgment calls

1. `.gitignore`: outside "Paths this step writes". Serves item 1 and is listed with it, as rule 20 allows. The orchestrator's to accept, since the path comparison with step 4 did not cover the file. It also stops ignoring every `CLAUDE.md` below the root.
2. The three case names and three new glossary terms: a vocabulary, which rule 4 names as a shape for the user. The brief's report shape expects added terms, so the addition is inside the brief; the names are the user's call.
3. `<folder>` passed to `--find`: inside the brief (the arguments stay), and defective (finding S2).
4. Questions 1, 5 and 9 at item 6: inside the brief ("the rest asked with the questions the first case asks for them").
5. Lines of "Read before you act" left out, Skills section dropped without `skills-lock.json`: not inside the brief, which speaks of placeholders. The lines for `docs/roadmap.md`, `docs/adr/` and `docs/dev/building.md` are fixed template text. A decision on what the written file holds; the orchestrator's.
6. An existing block left until the next run: inside the brief's split of the second and third case. Its consequence is finding B1.
7. The offer of `CLAUDE.md` in a configured repository: a rule added to "Steps / sync" 7, which the brief asks to keep as it is. Rule 17 makes that a stop, not a judgment call (finding S3).
8. The comparison after a block is written: inside, under rule 16. It states no outcome for a comparison that does not print `ok:` (finding T2).
9. The two stops renamed: inside; two rows named "The draft" could not stand in one table.
10. Figure title and four columns: inside.
11. ADR 0001, the name in the rejected alternative: inside; case 9 requires it.
12. No commit of a fix to the plan configuration: inside, carried unchanged.

## Findings

### Spec

S1. Two statements of the merged skill contradict each other. Item 2, violated.
- Place: `ordo-init/SKILL.md`, "Steps / A configured repository" 1, line 280, against items 10 and 13, lines 336 and 352.
- Text: "No plan configuration and no page is drafted for a repository that has a plan configuration." Against: "With no file at the glossary's path, the file written there from `templates/docs/glossary.md`" and "For `no CLAUDE.md in`, the fix the skill offers is the file "Steps / An existing repository" 10 drafts from `templates/CLAUDE.md`." Line 246 counts both as pages: "Each page it would create, `CLAUDE.md` and the glossary included".
- Wrong: rule 19 of the change standard. The first sentence also replaces the old rule "write nothing" with another rule (rule 17).
- Scenario: a session in a configured repository with no glossary file reads line 280, drafts nothing for the missing glossary, and reports the exit-2 line as unfixable. Or it follows line 336 and the user, reading line 280, sees a page drafted that the skill said it would not draft.

S2. The command of Steps 1 sends a call that names a project to the wrong case. Item 2, violated; case 4 for such a call.
- Place: lines 32-33, 72 and 279.
- Text: "`python3 <this skill's folder>/templates/check_config.py --find . [<folder>]` prints its path, or exits 1" and "`<folder>` names the `plan.yaml` as the part in front of the entry does in a call of `/plan`: the folder that holds it, as a path from the repository root, with a project's name after it in the `projects:` form."
- Wrong: `--find` takes a folder only. On a scratch folder with `tools/plan.yaml` in the `projects:` form, `check_config.py --find . tools` prints `tools/plan.yaml`, exit 0; `--find . tools/a` prints `error: no plan.yaml in tools/a, .scratch, docs, .agents of .`, exit 1; `--find . tools a` prints `error: --find takes a repository root and at most one folder`, exit 1. The skill does not say that the project name is taken off before the command. The old sync text gave no command for this, so the session resolved the file itself.
- Scenario: `/ordo-init . tools/a` in a configured repository. The session passes `tools/a`, the command exits 1, Steps 1 reads "no plan configuration", and "An existing repository" drafts a second `docs/plan.yaml` in a repository that has one.

S3. A rule added to a carried item, taken as a judgment call. Item 2, violated.
- Place: line 352, judgment call 7.
- Text: "For `no CLAUDE.md in`, the fix the skill offers is the file "Steps / An existing repository" 10 drafts from `templates/CLAUDE.md`."
- Wrong: the brief says "every rule of 'Steps / sync' 1 to 9 kept"; rule 17 says none is added and a change of meaning is a stop. The cited item also does not work from here: line 231 fills a placeholder with "the answer to its question of "The questions" ("Steps / An existing repository" 6)", and item 6 never runs in a configured repository.
- Scenario: a session in a configured repository with no `CLAUDE.md` drafts the file and has no step that asks questions 1, 5 and 9. It writes placeholders it cannot fill, against the anti-pattern at line 429, or invents a stop the Stops table does not hold.

S4. The commit rule of a configured repository is stated nowhere. Item 2, violated.
- Place: "What it reads" 7, lines 41-44, against line 357 and the Stops row at line 420.
- Text: "In a new repository it is the answer to question 5. In an existing repository it is the answer to question 5 when ... 6 asks it, and otherwise the user's answer at the approval stop". Line 357: "commit the change ... when the repository's commit rule allows it".
- Wrong: the item lists two of three cases. The old sync text had the same gap; the merged item now reads as a complete list. No step of "A configured repository" asks.
- Scenario: after `--write` in a configured repository the session cannot tell whether it may commit. It commits in a repository whose rule is "commit only when told", or raises "No commit allowed" every time.

S5. `.gitignore` changed with no brief item naming it. Judged: the change serves item 1 (the unanchored `CLAUDE.md` line hid the moved template from `git status`; the worktree now lists `?? skills/ordo/ordo-init/templates/CLAUDE.md`) and the report lists it as rule 20 asks. Not a violation. Acceptance is the orchestrator's (see "Declined to judge").

No contradiction of an ADR found. ADRs 0001, 0002, 0014, 0026 and 0030 change in the name only; each changed sentence was read and stays true.

### Proof

P1. A claim of the report that the file does not bear out.
- Place: 5-report.md, "Departures from the skill layout", last bullet.
- Text: "Every item of Steps now ends on a completion criterion."
- Wrong: a scan of the last sub-bullet of each item prints two without one. "A configured repository" 7 (lines 320-323) ends on "8 to 15 follow its exit status and, on exit 2, its `error:` lines." and has no criterion at all. "A new repository" 11 has its criterion on line 146 and ends on line 147.
- Scenario: the orchestrator books the layout rule "Each item of Steps ends on its completion criterion" as met for this skill.

P2. The table of what each old part became does not have the form rule 18 asks.
- Place: 5-report.md, "What each part of the two old skills became".
- Text: rows such as "`repo-setup` Steps 1 to 12 | "Steps / A new repository" 1 to 12" and "`repo-setup` Rules 5 to 9 | Rules 8 to 12".
- Wrong: rule 18 asks one rule per row and, for each row, the quoted line of the place that states it. No row quotes a line, and rows cover up to twelve items.
- Scenario: the changes of meaning listed above (line 280, line 49, line 352) sit inside rows that read as carried whole.

### Standards

T1. One thing under three names, and one name for two things. Item 2, violated.
- Place: lines 45, 265, 324, 354-356, 415-419.
- Text: "For the sync of a configured repository" (45); "run the comparison of "Steps / A configured repository" 7" (265); "run the check again, at most twice" (354); beside "After the fixes, run the check again" (317) and "the two `ok:` lines are shown with the check's output" (324), where "the check" is `check_config.py`. Stops: "A fix in the check" and "The check still fails".
- Wrong: prose standard, D, "No synonym cycling. One term per concept"; skill layout, "Writing for an agent", "One meaning has one place". In the old `repo-setup` "the check" was `sync_rules.py` only.
- Scenario: `check_config.py` still reports an error after the fixes of item 5. The session reads the row "The check still fails ... does not exit 0 on its second run" as covering it and reruns the configuration check twice, or reads item 14 as a rerun of `check_config.py`.

T2. A repeat and a failure with no stated outcome.
- Place: line 266.
- Text: "The setup is done only when the check exits 0 and the comparison prints the `ok:` line of each block written."
- Wrong: skill layout, "Writing for an agent": a repeat that ends only when a condition holds is given a count and what happens at it. No row of Stops covers a comparison that fails here.
- Scenario: the block just written does not compare equal. The session rewrites and reruns without bound, or commits at item 16 with the setup not done.

T3. A glossary citation the change makes false. Item 3, violated.
- Place: `docs/glossary.md` line 125 and the same entry in `skills/ordo/ordo-init/templates/plan-terms.md`, entry **standards**.
- Text: "Also the standard pages `/ordo-init` writes into `docs/dev/` of a new repository ... Stated in: `ordo-init`, "The tree"; `ordo-help`, "The sequence, printed verbatim"."
- Wrong: `grep -n standards skills/ordo/ordo-help/SKILL.md` prints nothing. At the base the sequence line of `/repo-setup` held "the standards"; the merged line does not. Rule 14: a sentence the change makes false is a defect of the change.
- Scenario: a reader follows the citation to `ordo-help` and finds no use of the term; a later brief that lists this entry's places sends a builder to a section that does not state it.

T4. Reference sections that not every run reads. Item 2, violated.
- Place: "## The questions" (line 362) and "## The tree" (line 380).
- Wrong: skill layout, "Writing for an agent": "A reference section of row 6 ... holds only material every run reads", and material some runs need goes in `references/<name>.md`; the rules "apply to a skill's text when it is written or rewritten". The builder names the departure and gives as reason that the brief names no `references/` file. The brief says "The skill follows `docs/dev/skill-layout.md`". Under rule 4 this is a stop for the orchestrator, not a departure to take.
- Scenario: every run on a configured repository loads the nine questions and the tree, which none of its steps reads.

T5. A glossary entry narrower than the merged skill. Item 3, violated.
- Place: `docs/glossary.md` line 94 and `templates/plan-terms.md`, entry **questions, the**.
- Text: "the nine questions `/ordo-init` asks before it drafts a new repository".
- Wrong: line 203 of the skill asks questions 1, 5 and 9 in an existing repository with no `CLAUDE.md`. The entry **commit rule** in the same file already says so for question 5.
- Scenario: a reader of the glossary concludes the questions are never asked outside a new repository and takes the stop at "An existing repository" 6 for a defect.

T6. Step order.
- Place: lines 209 and 238.
- Text: item 7: "A glossary that "Steps / An existing repository" 11 offers is listed as the repository's glossary." Item 11: "The glossary is the page "Steps / An existing repository" 7 lists under the file name `glossary.md`."
- Wrong: skill layout, "Sections, in order", row 5: Steps is "in execution order". Item 7 needs the result of item 11, and item 11 defines its subject by item 7.
- Scenario: a session working in order writes `standards` at item 7 with no glossary, and at item 11 finds no page listed under `glossary.md`; the offered glossary may then be left out of `standards`, and no brief names it.

History in shipped text: none found (added lines of the diff were searched for "merged", "formerly", "no longer", "previously", "renamed", "moved", and the merged skill, the glossary, the README and the template lines were read). Non-ASCII: none (check 1). Private names: none in any added line. Every other citation of a section of `ordo-init` in `docs/glossary.md`, `templates/plan-terms.md`, `grill` (lines 73, 302, 310, 311, 338), `spec` 169, `plan-orchestration` 485 and 528, `references/self-rule.md` 27, `ordo-help` 99, `wizard` 22, `gen_figures.py` and the README was followed and points at a section that exists and says what is cited. The sequence line of `ordo-help` line 99 and README line 40 are the same text. The merged skill holds no bare "Steps <n>" citation.

### Behaviour

B1. A change the report does not state with before and after.
- Before: `/repo-setup sync` on a repository with no `plan.yaml` compared both blocks, with `docs/glossary.md` as the glossary (old "What it reads" 5, last bullet).
- After: such a repository is the second case. `/ordo-init` drafts a `plan.yaml`, stops for `worker`, `reviewer` and `libraries`, and line 235 leaves a block that is there uncompared until a second run.
- The report's table row for `sync` speaks only of "a repository with a `plan.yaml`"; judgment call 6 gives the rule and not the change.
- Scenario: a user who kept the shared rules in a repository without a plan configuration runs `/ordo-init` to sync and is led into setting the repository up for plans; a differing block is not shown in that run.

B2. A second change not stated.
- Place: `skills/ordo/ordo-init/templates/docs/glossary.md` line 3, outside the plan-terms block.
- Before: "which `/repo-setup sync` keeps equal to the `repo-setup` skill's template". After: "which `/ordo-init`, run in a repository that has a plan configuration, keeps equal to the `ordo-init` skill's template".
- The report's table gives the like change of `shared-rules.md` and not this one. This line is outside the block, so no sync rewrites it.
- Scenario: a repository set up earlier keeps a sentence in its glossary that names a command and a skill that no longer exist, and nothing tells its user.

## Declined to judge

- `git check-ignore -v skills/ordo/ordo-init/templates/CLAUDE.md`, `git -C /Users/axelfaes/workspace/ordo status --short --ignored` and the builder's `git grep`: git commands outside the three allowed. The `git grep` result was checked with `grep -rn` instead; the two `check-ignore` claims are not verified, beyond `git status --short` listing the moved `CLAUDE.md` as untracked.
- `python3 docs/figures/gen_figures.py` inside the worktree: not run, since it writes files there. Checked by a copy in the scratchpad.
- "The 18 criteria added": the count was not checked.
- The cases' first run on the unchanged tree: the old tree is not checked out here, so the runs at the old path were not repeated.
- Whether the three case names and the three new glossary terms are the ones wanted: the user's call (vocabulary, rule 4).
- Whether `.gitignore` may change in this step, and whether the lines of "Read before you act" may be left out of a written `CLAUDE.md` (judgment calls 1 and 5): the orchestrator's.
- The state file's verify list and `standards` line, which still name the old paths: the brief leaves them to the orchestrator at landing; not read.
- The plan's whole verify list: not run, as instructed.
- `skills/code/codebase-design/` and ADR 0047, which still name `repo-setup`: step 4's.
- A folder with untracked files and no git repository, which Steps 1 sends to "A new repository" where "The tree" names `README.md` and `.gitignore`: the old `repo-setup` treated it the same way, so it is outside this step's diff.

Agent usage: a5a056ebb96ece6ae, claude-fable-5-2, 192040 tokens, 25 tool uses, 7.1 minutes.

## Repair round 1, refuted

# Review of repair round 1 of step 5 (worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-5)

Nothing was changed anywhere. I ran only `git status --short`, read-only commands, and scratch runs outside the worktree (`rev5r1/` and `rev5r1fig/` under the scratchpad). I did not run `python3 docs/figures/gen_figures.py` in the worktree because it writes files there. I ran a copy in the scratchpad instead.

Line numbers below are those of `skills/ordo/ordo-init/SKILL.md` as it now stands. It has 418 lines.

## Checks, as printed here

1. The character-set check over the changed files printed nothing, then `exit status 0`.
2. Cases 6 to 10:
   - Case 6: `PASS: sync_rules.py scratch tests`.
   - Case 7: `ok: the plan-terms block equals the template`, exit 0.
   - Case 8: `PASS: check_config.py scratch tests`.
   - Case 9: `ugrep: warning: CLAUDE.md: No such file or directory`, then 9 lines in `skills/code/codebase-design/SKILL.md` and 4 lines in ADR 0047. Nothing else.
   - Case 10: `note: docs/plan.yaml: design_references not set, default [] applies`, then `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`. I did not read the exit status for this case: my `$PIPESTATUS` expansion printed `exit ` with no value, so the exit status of case 10 is not verified here.
3. Frontmatter: `ordo-init 1013 4.0.0`.
4. `ls skills/ordo` prints `ordo-help ordo-init session-retro wait-what`. `grep -c 'twenty-one' README.md` prints `2` and `grep -c 'twenty-two' README.md` prints `0`.
5. Figures:
   - The copy of `gen_figures.py` run in the scratchpad exited 0, and every `.svg` it wrote is byte-equal (`cmp`) to the one in the worktree's `docs/figures/`.
   - `git status --short docs/figures` lists only `gen_figures.py` and `pipeline.svg`.
   - I rendered `pipeline.svg` with `rsvg-convert -w 1600` and looked at it. The `/ordo-init` lane shows twelve stops in three rows of four, "A fix in the configuration check" on two lines, and every box and label inside the frame.
6. `docs/dev/building.md` lines 16 and 17 are cases 6 and 7 at the new path, and both pass above.
7. Case 14, `grep -n 'the check\b\|the comparison' skills/ordo/ordo-init/SKILL.md`, prints nothing (exit 1).
8. The delta:
   - `diff -u` between the round's snapshot and the worktree differs for `README.md`, `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg`, `docs/glossary.md`, `grill/SKILL.md`, `ordo-init/SKILL.md`, `templates/docs/glossary.md`, `templates/plan-terms.md` and `templates/shared-rules.md`.
   - `git status --short --untracked-files=all` against `files.txt` also shows the new `skills/ordo/ordo-init/references/new-repository.md` (read whole).
9. Script scan: the last line of every item of Steps contains "done". That is 47 parsed blocks, 44 items plus the 3 `###` headings, which my script flagged only as an artefact of its parse.
10. `check_config.py --find` in a scratch git repository whose `tools/plan.yaml` is in the `projects:` form with a project `a`:
    - `--find . tools` prints `tools/plan.yaml`, exit 0.
    - `--find . tools/a` prints `error: no plan.yaml in tools/a, .scratch, docs, .agents of .`, exit 1.
    - With a `docs/plan.yaml` added, `--find . tools/a` prints `docs/plan.yaml`, exit 0.
    - `--find . nothing` prints `docs/plan.yaml`, exit 0.
    - The builder's two runs are reproduced.
11. `sync_rules.py .` in a folder with no `CLAUDE.md` and a glossary with no block prints both `error: no CLAUDE.md in <root>` and `error: docs/glossary.md has no single plan-terms block (...)`, exit 2. This agrees with "A configured repository" 10.

## Rulings 1 to 13

1. Carried out. Line 289 reads "The configuration check writes nothing by itself and drafts no plan configuration." The sentence about pages is gone.
2. Carried out. "What it reads" 4 (lines 32 to 37) takes the project name off before the command and uses it afterwards. I reproduced both runs. See Behaviour finding B3, which is a gap the ruling did not ask to close.
3. Carried out in text. "A configured repository" 10 asks questions 1, 5 and 9, the stop "The questions" covers it, and placeholders are never written unfilled. The item it points to has a defect. See S2.
4. Carried out. "What it reads" 7 (lines 45 to 51) names all three cases and the ask at the stop that shows the change. The glossary's **commit rule** says the same.
5. Carried out, by my own scan. Nothing was removed to get there.
6. Carried out as written. Case 14 prints nothing. The Stops table, `gen_figures.py`, `pipeline.svg` and the README alternative text all use "A fix in the configuration check" and "The sync still fails", and no leftover of the old names exists. See T1 for the residual uses of "check" and "comparison".
7. Carried out (line 274). Its count nests with the count of "A configured repository" 14. See B2.
8. Carried out as read in the diffs of `docs/glossary.md` and `templates/plan-terms.md`.
9. Carried out. The page exists with 46 lines. `SKILL.md` has no such sections. "What it reads" 6 and the steps name the page, and the citations in the skill, the glossary, `plan-terms.md` and `grill` 302 name it. The `gen_figures.py` hit is only a stop label. The page itself has a stale pointer. See P1.
10. Carried out. Item 7 settles the glossary, item 8 drafts `standards`, and item 11 comes after item 9. I found no item of Steps that uses something produced later within a case, except item 11 (S2).
11. Carried out in text, at "An existing repository" 15. It breaks when the user declines the plan configuration. See B1.
12. Carried out. Report lines 163 and 164 hold both rows.
13. The acceptance matches the report. Not a code matter.

No finding is closed by removing something. Two fixes reach slightly beyond their rulings:
- The Stops row "The questions" absorbed "Existing" 6 (judgment call 2 of the round).
- Ruling 11 changed `templates/shared-rules.md` and `templates/docs/glossary.md` line 3. It also changes the text a synced block takes, so every set-up repository differs from the template until its next sync. This is stated in the report.

## Verdicts on the whole diff

Items of "What to build":
1. Holds. `skills/ordo/repo-setup/` is gone and the templates are under `skills/ordo/ordo-init/templates/`.
2. Violated by S1, S2, B1 and T2 below (the frontmatter, the three cases, their order and the arguments are in place).
3. Holds. Every named file reads true, and the glossary, `plan-terms.md`, `grill`, the README and the figure now agree.
4. Holds. No path under `skills/code/codebase-design/` is changed.
5. Not applicable. The worktree has no root `CLAUDE.md`.

Cases:
1. Met.
2. Met. "Existing" 11 gives a `CLAUDE.md` with no block the change of "Configured" 10, and removal listings are covered.
3. Met.
4. Met for a call without a project name. With a project name it is met by "What it reads" 4 (B3 is the residual risk).
5. Met.
6. Met.
7. Met.
8. Met.
9. Met.
10. Met in its output (the `ok:` line printed). Its exit status is not verified here.
11. Partial. The text is correct (project name off, `--find . tools`, case configured, project `a`). The skill gives no way to decide which leading part holds the `plan.yaml` (B3).
12. Met in text. Walk: configuration check 1 to 6, sync 7 exits 2 with `error: no CLAUDE.md in`, item 10 asks questions 1, 5 and 9, items 11 and 12 show and write after approval. The drafted file reaches S2.
13. Met except when the user declines the plan configuration (B1). Walk: "Existing" 1 to 13 draft and show, item 14 writes, item 15 syncs, the differing block is shown per hunk through "Configured" 9, and item 16 commits.
14. Met.

Walks of the folder states:
- Empty folder: Steps 1, then "New" 1 to 12, with "Existing" 1 to 16 at "New" 8. The two sync runs are redundant but consistent.
- Existing repository with its own `CLAUDE.md`: "Existing" 1 to 16.
- Existing repository without `CLAUDE.md`: "Existing" 11, which uses the draft's `plan.yaml` (S2).
- Configured repository: "Configured" 1 to 15.
- Configured repository without `CLAUDE.md`: "Configured" 10 asks and drafts.
- Existing repository with a differing block: "Existing" 15 shows the diff.

## Judgments over the merged skill

- Two sentences that contradict: the introduction (line 10) against "Configured" 15 (S3).
- Cases: the three cases cannot be confused. The order of tests in Steps 1 is stated, and no argument chooses the case.
- A folder state where the session cannot tell what applies: a user who declines or corrects the plan configuration draft at "Existing" 13 (B1), and a user who declines one block (B2).
- Every item uses only what an earlier item produced, except "Existing" 11 reading "the draft's `plan.yaml`" when run from "Configured" 10 (S2).
- Citations of sections and items in the skill, `docs/glossary.md`, `plan-terms.md`, `grill`, the README and `gen_figures.py` all point at something that exists. The sole exception is the stale pointer in the reference page (P1).
- Stops table: each of the twelve rows names items that raise it, and each item that stops has a row. "The sync still fails" says "does not exit 0" for both citations while "Existing" 15 says "does not print the `ok:` line". They are the same condition for `sync_rules.py`.

## The builder's seven judgment calls

1. The missing `CLAUDE.md` of a configured repository is drafted at item 10 and left out of item 13. Inside ruling 3, which says the offer stays and must work.
2. The stop "The questions" now also covers "Existing" 6. Inside ruling 3 ("the stop covers it"). It widens one row, not another stop.
3. The commit question sits at "A hunk to rule on" and "The drafted sync change". Inside ruling 4 ("the stop that shows the change").
4. The page name `references/new-repository.md`. Inside ruling 9. The two citations inside it name `SKILL.md`.
5. The sync after the write follows "Configured" 7 to 14, not 15. Inside ruling 11. It creates the count nesting in B2.
6. The condition "on a configured repository" in the glossary, README and the two template lines now names both cases. Inside ruling 11, but it changes a template line that propagates to every set-up repository. That is a user-visible change and the report states it.
7. **standards** also cites "The questions" 6. Inside ruling 8 (the term appears there).

None of the seven was a decision that was not the builder's.

## Findings

### Spec

S1. A carried rule says "existing repository" where it covered all cases (small, a few lines).
- Place: Rules, line 408.
- Text: "A page the skill writes in an existing repository states, beside its template's text, what the repository already does or says." The Anti-patterns row at line 396 states the same rule with no case.
- Wrong: "existing repository" is a glossary term (tracked file, no plan configuration). A `CLAUDE.md` or glossary written in a configured repository falls outside it. The row and the rule disagree on scope.
- Failure: in a configured repository without `CLAUDE.md`, a session writes the file from the template and does not state or cite what the repository already says about its commands or rules.

S2. "A configured repository" 10 sends the session to an item that assumes a drafted `plan.yaml` (small).
- Place: lines 245 to 246 ("Existing" 11), reached from lines 348 to 349.
- Text: "Each line of "Read before you act" names the page of that kind the draft's `plan.yaml` names or the draft offers".
- Wrong: in a configured repository there is no draft `plan.yaml` and no page offers.
- Failure: the session cannot name the pages for the lines of "Read before you act" and writes them from guesswork or leaves them all out. It violates the ruling "no placeholder written unfilled".

S3. The introduction and the steps disagree on what is committed (small).
- Place: line 10 against "A configured repository" 15, lines 369 to 372.
- Text: "...the fixed configuration and the synced blocks, committed when the repository's commit rule allows it." Item 15 commits only "After exit 1 or exit 2".
- Wrong: no step commits a configuration fix made at item 5.
- Failure: a reader believes the fixed `plan.yaml` is committed. In a repository that passes the sync, it is left uncommitted.

### Proof

P1. The reference page cites a statement that is not there (small).
- Place: `references/new-repository.md` line 17.
- Text: "The draft at "Steps / A new repository" 4 of `SKILL.md` says so."
- Wrong: `SKILL.md` has no sentence that says a language without a template page gets none. The old skill had the same pointer with the same gap.
- Failure: a session shows the draft for a language such as Go without telling the user it gets no language page.

### Standards

T1. Residual one-term-two-meanings (small).
- Place: line 141 ("Run the checks:"), line 152 ("each check's output"), line 259 ("The comparison covers the form, ...").
- Wrong: "the checks" here are the five commands of "A new repository" 10, one of which is the sync and one the configuration check. "The comparison" at 259 is draft against ruling, while the glossary's **sync** is also "the comparison". Case 14 does not see the capitalised form.
- Failure: a reader takes "the checks" at "New" 10 as the configuration check alone.
- Also: "configuration check" has no glossary entry while "sync" does. The layout asks a new term in a sense of its own to be added to `plan-terms.md`.

T2. "What it reads" 6 mixes a file and the user's answers in one input (small).
- Text: "`references/new-repository.md` ..., and the user's answers to the questions."
- Wrong: the layout says one input per item.
- Failure: minor. A reviewer cannot tell whether an absent answer is a refusal.

T3. Rules line 418 says "Every path in this skill's text is relative to the repository root" while the skill names `templates/...` and `references/...`, relative to the skill's folder (carried, small).

### Behaviour

B1. Declining the plan configuration leaves "Existing" 15 with no outcome.
- Place: lines 268 to 275, after item 13 "stop then stands with nothing written".
- Wrong: item 15 assumes "The path printed is `docs/plan.yaml`". A user who approves a block change but declines or corrects the plan configuration reaches it, and no Stops row covers it. This is the person ruling 11 means: "runs /ordo-init to sync a repository without a plan configuration".
- Failure: `--find` exits 1 or the session invents a branch. The block sync the user asked for does not run. Not small: it needs an item or a clause saying what runs when no plan configuration was written.

B2. The count of reruns nests (small).
- Place: lines 271 to 274 against 366 to 368.
- Wrong: item 15 says "runs at most twice", and it also follows "Configured" 7 to 14, whose item 14 has its own "at most twice". It is unclear whether the total is two or three runs. A block the user declined at item 13 makes `sync_rules.py` exit 2 "has no single block", yet item 15 says it is "not drafted again" while "Configured" 10 says to draft. No row names that outcome.
- Failure: the session reruns three times, or drafts the declined block again.

B3. The skill gives no way to find "the longest leading part of `<folder>` that holds a `plan.yaml`" (small).
- Place: lines 32 to 37.
- Wrong: `--find . tools/a` cannot do it, because it falls back to `docs/plan.yaml` with exit 0 (scratch run above).
- Failure: with `/ordo-init . tools/a` and no `tools/plan.yaml`, a session may take a `docs/plan.yaml` as the file of project `a`. The text says it checks existence but names no command.

## Declined to judge

- The exit status of case 10: not read here (`$PIPESTATUS` printed nothing). Output lines only.
- `python3 docs/figures/gen_figures.py` inside the worktree: not run. A copy in the scratchpad was run.
- The plan's whole verify list, the state file and the ruling file: not run, not read.
- `git check-ignore` claims and the `.gitignore` change (ruling 13, accepted by the orchestrator).
- The cases' first run on the unchanged tree: not repeated.
- Whether the three case names, "configuration check" and the new glossary terms are the user's wording: the user's call.
- `skills/code/codebase-design/` and ADR 0047: step 4's.
- README sentences outside the skill ("The same comparison runs on its own", "The same check runs on its own"): outside ruling 6's scope, not judged.

Agent usage: add1fddfd58c551b7, claude-sonnet-5-5, 190174 tokens, 24 tool uses, 4.8 minutes.

## Closed

- First review: S1 to S4, P1, T1 to T6, B1 and B2 closed by the builder in round 1, as the rulings of `agents/briefs/5-round-1.md` say; P2 and S5 needed no change.
- Round 1, S1, S2, S3, P1, T1, T2, T3, B1, B2 and B3: each fixed at landing, named in the booking.
