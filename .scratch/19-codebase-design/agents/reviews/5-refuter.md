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
