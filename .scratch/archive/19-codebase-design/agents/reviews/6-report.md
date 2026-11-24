# Report: step 6, the defects the runs of step 2 showed

Everything in the brief is done. One premise of item 6 is wrong and is reported under "Premises found wrong", with what was written in its place: `grant` and `referee` name the `paper` and the `paper-review-panel` folder, not the `ordo-init` folder, and one of `paper`'s two places names the `writing` folder.

Open items of the state file: none.

## The first run of each case, on the unchanged tree

Cases 1 to 17 were read against the text at the base, case 18 was run.

1. Unmet. "Steps / A new repository" 8 follows "Steps / An existing repository" 3, which says "Each command is run once, as it is to be written, before it is written" and "A command that fails is not written as a check. It is a stop". The tree holds no source, the test command fails, and the run ends at the stop "A failing command".
2. Met. The same two sentences give the one run and the stop.
3. Unmet. `templates/shared-rules.md` read "The standard is `docs/dev/prose-standard.md`", and `sync_rules.py` holds the block equal to it.
4. Unmet. "Steps / A configured repository" 10 writes the glossary file, and no item of those steps changes `standards`.
5. Unmet. The file is offered, nothing in the draft says git ignores it, and step 16 stages each file with `git add -- <path> ...`. Run in a scratch repository: `git add -- docs.md CLAUDE.md .gitignore` printed "The following paths are ignored by one of your .gitignore files: CLAUDE.md" and exited 1.
6. Unmet. The stop "No commit allowed" names `git status --short` as the command that shows the files. Run in the scratch repository: `git status --short` printed `?? .gitignore` and `?? docs.md`, and no line for `CLAUDE.md`.
7. Unmet. Step 15 commits "the change" in the form of "Steps / A new repository" 12, which stages the ignored file.
8. Unmet. `SKILL.md` named no tool (`grep -c 'ruff\|pyright\|clang'` printed 0), so the Python page is written with its ruff and pyright lines and the common page with its Formatting rule.
9. Unmet. No sentence tells the two tools apart by what the user named.
10. Unmet. "What it reads" 2 and 3 lead to `<pinned tree>/skills/ordo/plan` and `<pinned tree>/skills/ordo/roadmap`, which do not exist (`ls -d skills/*/plan skills/*/roadmap` prints `skills/orchestration/plan` and `skills/orchestration/roadmap`). `codebase-design`'s text leads to `<pinned tree>/skills/code/ordo-init`, which does not exist.
11. Unmet. The count is written "33 of 60", and 33 is more than half, so the rule goes to group 3.
12. Partly met. Group 3, written "55 of 60" without "about".
13. Unmet. Item 3 says only the compared pages are compared. On a noted page the sentence is not read, and the rule goes to group 2. On a compared page, group 1 asks for "a rule ... that asks something else", and a described practice is no rule.
14. Unmet. Group 1 took a rule "that asks something else ... whether or not the two can both be followed", so the default's sentence on a defect in text makes the pair a difference.
15. Unmet. The same clause makes the pair a difference.
16. Unmet. The same clause makes the pair a difference ("a different check"), as the example's difference A showed.
17. Met. A different limit on the same requirement is group 1.
18. Run: `PASS: sync_rules.py scratch tests`, `PASS: check_config.py scratch tests`, `ok: the plan-terms block equals the template`.

No case contradicts the brief's rules.

## Items

| Item | State | Where |
|---|---|---|
| 1 | DONE | `skills/ordo/ordo-init/SKILL.md`: "Steps / A new repository" 8 (four new bullets), "Steps / An existing repository" 3 and 12, Stops row "A failing command", Rules (the exception on the one run, and the new bullet "A command that fails is shown as failing and left as it is, and no step writes a test, a source file or any other file so that a command passes"), one Anti-patterns row; `references/new-repository.md`, the line of `docs/dev/building.md` |
| 2 | DONE | `templates/shared-rules.md`, the Prose rule: "The standard is the repository's prose standard, and it applies to every comment, page and message." `git diff --numstat` gives 1 line added and 1 removed. `templates/CLAUDE.md` is unchanged: no sentence of it became false |
| 3 | DONE | `SKILL.md`, "Steps / A configured repository" 10, five sub-bullets under "With no file at the glossary's path", and 14 for `--glossary` |
| 4 | DONE | `SKILL.md`, Rules, the bullet "Before the skill drafts a file to create or a change to a file that exists" with seven sub-bullets; named from "Steps / A new repository" 3 and 12, "Steps / An existing repository" 12 and 16, "Steps / A configured repository" 9, 10 and 15; Stops row "No commit allowed"; one Anti-patterns row; the introduction |
| 5 | DONE | `SKILL.md`, "Steps / A new repository" 3, the bullet "A default coding-standards page written into a repository" with ten sub-bullets; Stops row "The draft of the tree"; one Anti-patterns row; `references/new-repository.md`, the lines of the common page and the language pages. The template pages are unchanged (`git diff --stat -- skills/ordo/ordo-init/templates/docs` prints nothing) |
| 6 | DONE, with the premise below | `ordo-init` "What it reads" 2 and 3 and Rules; `codebase-design` "What it reads" 2 and Stops row "No ordo-init folder"; `writing`, `code-comments`, `paper` (two), `grant` (two), `referee` (two); ADR 0047 (three) |
| 7 | DONE | `skills/code/codebase-design/SKILL.md`, "Steps / standards" 5 (five sub-bullets under the bullet on the count, and the lines of groups 3 and 4), 8 (the audit file's line), 10 (the forms of groups 3 and 4, and line 2 of the example, "About 310 of 322 headers"); one Anti-patterns row |
| 8 | DONE | "Steps / standards" 3 (two bullets reworded, one added), 5 (the bullet "A difference by contradiction"), 10 (the form and the words of group 1, "says" and "describes", the sentence on the noted pages), 11; one Anti-patterns row |
| 9 | DONE | "Steps / standards" 5: "Present, the repository asks at least as much" with one made-up exemption and one made-up default that allows what the repository forbids; "Present, the default says more where the repository is silent"; "A difference between two rules"; the example's difference A is now a file-length limit of 2,000 against 1000 lines, and its count of rules present reads 62 |

## Cases after the step

| Case | State | Where |
|---|---|---|
| 1 | DONE | "Steps / A new repository" 8: "No command meant for the verification page is run ...", "The stop "A failing command" is not raised from this item"; Rules, "no step writes a test, a source file or any other file so that a command passes" |
| 2 | DONE | "Steps / An existing repository" 3: "Each command is run once ... except when these steps run from "Steps / A new repository" 8" |
| 3 | DONE | `grep -n 'prose-standard' skills/ordo/ordo-init/templates/shared-rules.md` prints nothing |
| 4 | DONE | "Steps / A configured repository" 10, the sub-bullets on `standards`, with `../docs/glossary.md` in `.agents/plan.yaml` as the example, and the one on a configuration with no `standards` key |
| 5 | DONE | Rules, the bullet on a file git ignores; "Steps / An existing repository" 12 and 16 |
| 6 | DONE | Stops row "No commit allowed", "apart from them each file written and ignored by git" |
| 7 | DONE | "Steps / A configured repository" 9 and 15: "no commit is made when every file changed is ignored" |
| 8 | DONE | "Steps / A new repository" 3, the bullets on a tool; the bullet on a placeholder for a check that only such a tool runs takes the common page's Formatting rule out |
| 9 | DONE | The same item: "A tool counts as configured only when the repository holds its configuration file or section, or the user named it in an answer" |
| 10 | DONE | `ordo-init` "What it reads" 2 and 3; `codebase-design` "What it reads" 2. From `<pinned tree>/skills/ordo/ordo-init` the second place is `<pinned tree>/skills/*/plan`, which holds `skills/orchestration/plan` |
| 11 | DONE | "Steps / standards" 5: "An estimate within one tenth of <m> of half of <m>, on either side, puts the rule in group 4" |
| 12 | DONE | The same item: "Any other estimate sorts by "more than half" as an exact count does" |
| 13 | DONE | "Steps / standards" 5, "A difference by contradiction"; 10, the form of group 1 |
| 14 | DONE | "Steps / standards" 5, the sub-bullet on an exemption |
| 15 | DONE | The line "Present" ("each part of what the default rule covers falls under one of the two bullets"), with both bullets on a present rule |
| 16 | DONE | "Present, the repository asks at least as much", which is tried before group 1 |
| 17 | DONE | "A difference between two rules", and its sub-bullet on a repository rule that sets a limit |
| 18 | DONE | The run under "Verify before you report" 2 |

## Verify before you report

1. The character-set check over the changed files printed nothing; `echo $?` printed 0.
2. With `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front of each:
   - `PASS: sync_rules.py scratch tests`
   - `PASS: check_config.py scratch tests`
   - `ok: the plan-terms block equals the template`
3. The frontmatter command printed `ordo-init 1013 4.0.0` and `codebase-design 1019 1.0.0`. No description and no version changed.
4. `git grep -n 'beside this skill\|beside it\|standing beside' -- skills docs/adr README.md`, the hits left:
   - The new order itself, which holds "beside it" and "beside this skill's group folder": `ordo-init/SKILL.md` "What it reads" 2, `codebase-design/SKILL.md` "What it reads" 2, `writing/SKILL.md:30`, `code-comments/SKILL.md:32`, `paper/SKILL.md:76` and `:77`, `grant/SKILL.md:35`, `referee/SKILL.md:29`, ADR 0047 line 17.
   - `ordo-init/templates/check_config.py:9` and `:111` and `check_config.test.sh:21`, `:26`: the script's own statement of the order, which the brief leaves unchanged.
   - `docs/adr/0001...:20`, "`writing` needs the `ordo-init` skill installed beside it": left as it is. It speaks of the installation, where each skill is linked or copied under its name into one skills folder (`README.md`, "Installed, the twenty-one skills stand side by side in one folder"), and the file is not among the step's paths.
   - Every other hit uses "beside" of something else than a skill's folder: `ordo-init/SKILL.md` ("shown beside it", twice, and "beside its template's text"), `README.md:207`, ADRs 0008 and 0009, `paper/SKILL.md:591` and `:801`, the `paper` formatter page, `lookup.test.sh`, the `referee` pages, `grill`, `land`, `plan-retro`, `roadmap`, `spec`, `check_config.test.sh:218`, and the templates `common.md` and `typescript.md`.
   - What each changed hit was and now reads: "in the `plan` folder beside this skill's folder", "in the `roadmap` folder beside this skill's folder", "which stands beside this skill's folder" and "standing beside this skill's folder" each now read "found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder", followed by "A folder found in neither place is named, with both paths, in the message the skill then gives." Rules of `ordo-init` reads "the `plan` and `roadmap` skills, found as "What it reads" 2 and 3 say". The Stops rows of `codebase-design`, `grant` and `referee` read "is in neither place of "What it reads" <n>" and show both paths. ADR 0047 line 38 reads "The skill depends on the `ordo-init` skill's folder being found in one of those two places".
5. Read against the standards pages, and each citation followed:
   - `grill`, "Steps / Writing what settled" 2 is "Write the glossary term" and holds the two additions of a created glossary's path. `plan`, "What it reads" 1 holds how a path is read. `codebase-design`, "Steps / standards" 5 holds the split of a rule that names a tool. "Steps / A configured repository" 2 holds "A configuration file git ignores". No item number of either skill changed.
   - One semicolon was added, in the Stops row "A failing command", a table cell.
   - Departures from "one sentence per bullet": the replaced sentences in `writing`, `code-comments`, `paper`, `grant` and `referee` stand as two sentences inside the bullet or item that held the old sentence, since those items already hold several sentences and the brief changes one sentence there.

## Run before written

Run in a scratch repository outside the worktree, whose `.gitignore` holds the line `CLAUDE.md`:

- `git check-ignore -q -- CLAUDE.md` exited 0, also with no such file on disk; for a path not ignored it exited 1; for a tracked file whose name an ignore line matches it exited 1, and `git add` of that file exited 0.
- `git check-ignore -v -- CLAUDE.md` printed `.gitignore:1:CLAUDE.md`, a tab and `CLAUDE.md`, and for a name in the user's global ignore file it printed that file's absolute path, outside the repository.
- `git add -- docs.md CLAUDE.md .gitignore` exited 1 and staged the two other files (`A  .gitignore`, `A  docs.md`).
- `git status --short` listed no line for the ignored file.

## Premises found wrong

- Item 6 says `grant` (two places) and `referee` (two places) say that the `ordo-init` folder stands beside their own. At the base, `grant/SKILL.md:35` and `:361` name the `paper` skill's folder, and `referee/SKILL.md:29` and `:227` name the `paper-review-panel` skill's folder. `paper/SKILL.md:77` names the `writing` skill's folder; only `:76` names `ordo-init`. Those folders stand in the same group folder, so the old sentences were true in the repository and in an installation.
- ADR 0047 holds three places, not two: line 7 said `paper` reads "from the `ordo-init` folder beside its own".

## Judgment calls

- Item 6, the places of the wrong premise: each got the same order in the same words with the folder its sentence names (`paper`, `paper-review-panel`, `writing`) in place of `ordo-init`. Writing `ordo-init` there would be false, and leaving the places unchanged would leave the item's places unbuilt. The orchestrator may rule to put the four `grant` and `referee` places back.
- ADR 0047 line 7 now reads "and then from the `ordo-init` skill's folder", since it cites `paper`'s "What it reads" 1, which no longer says "beside".
- Item 4 is stated once, in Rules, since it holds in all three cases, and the steps that draft, show or commit name it. Its last sub-bullet says that the checks of the worktree root and of the configuration file keep their own results, so that the new rule and those checks do not disagree on an ignored `docs/plan.yaml`.
- Item 4, the stop "No commit allowed": its When cell gained "and a file written or changed is not ignored by git", so that a run whose every file is ignored ends with the last message and no stop.
- Item 5: one bullet says that a placeholder for a check that only an unconfigured tool runs is left out with the tool, so that the rule on "checked by reading at review" and the new rule give one result for the common page's Formatting rule (case 8).
- Item 9, the count of the example: 61 became 62, the pair that was difference A now counting as present.
- Item 9: one sub-bullet was added under "A difference between two rules", that a repository rule that sets a limit expressly allows what stays within it, which case 17 rests on.
- Items 7 and 8: two Anti-patterns rows were added to `codebase-design`, and items 1, 4 and 5 added three to `ordo-init`, each pointing at the place that states the rule.
- The examples written into the two skills are made up and say so: the licence header, the boolean parameter, the commented-out code, the linter rule `X100`, the counts 33 and 55 of 60, and the lines of the example draft.

## Files changed

`git diff --numstat` (added, removed):

- `skills/ordo/ordo-init/SKILL.md` 60, 17
- `skills/code/codebase-design/SKILL.md` 44, 23
- `skills/ordo/ordo-init/references/new-repository.md` 3, 3
- `skills/ordo/ordo-init/templates/shared-rules.md` 1, 1
- `docs/adr/0047-...md` 3, 3
- `skills/academic/grant/SKILL.md` 2, 2
- `skills/academic/paper/SKILL.md` 2, 2
- `skills/academic/referee/SKILL.md` 2, 2
- `skills/academic/writing/SKILL.md` 1, 1
- `skills/code/code-comments/SKILL.md` 1, 1

Unchanged, since no sentence of theirs became false: `README.md`, `docs/glossary.md`, `skills/ordo/ordo-init/templates/plan-terms.md`, `skills/ordo/ordo-init/templates/CLAUDE.md`. No path beyond the brief's list was changed. No script and no test was written or changed.

## User-visible changes

- A repository synced by `/ordo-init` gets one hunk in its shared-rules block: the Prose rule names "the repository's prose standard" in place of `docs/dev/prose-standard.md`.
- A new repository's verification commands are written without a run, and its coding-standards pages name only the tools the repository configures or the user named.
- A file git ignores is written and left out of the commit, and listed apart.
- `codebase-design standards` writes "about <n> of <m>" for an estimate, sorts an estimate near half into group 4, shows a contradicted default rule in group 1, and no longer shows as a difference a pair where the repository asks at least as much.

## Repair round 1

Every ruling is carried out. Only what a ruling names was changed.

| # | State | Place |
|---|---|---|
| 1 | DONE, no change | `grant`, `referee` and `paper`'s sentence on the `writing` folder stand as written |
| 2 | DONE | `skills/academic/writing/SKILL.md`, `skills/code/code-comments/SKILL.md` and `skills/academic/paper/SKILL.md`, "What it reads" 1: the sentence on the folder now reads "When the `ordo-init` folder is in neither of those two folders, that refusal names the repository's path and the two folder paths." It stands after the sentence on the prose standard, which keeps "Neither" and "both paths" for the two places of the prose standard. The three Stops rows "No prose standard" are unchanged |
| 3 | DONE | `skills/ordo/ordo-init/SKILL.md`: "Steps / A new repository" 12, "Steps / An existing repository" 16 and "Steps / A configured repository" 15 each state, in this order, every file ignored (no commit, no stop, the last message says so), otherwise the commit without the ignored paths when the commit rule allows it, otherwise the stop; "What it reads" 7 gained the bullet that the commit question is not asked when every file of the change is ignored |
| 4 | DONE | `ordo-init`, "What it reads" 2 and 3 (a folder in neither of the two folders is a refusal made at Steps 1 before anything is drafted or written, naming the folder and the two folder paths); Steps 1 (the check, and its completion criterion); Stops, new first row "A skill's folder not found" |
| 5 | DONE | `ordo-init`, "Steps / A new repository" 3, two bullets under the rule on tools: the Formatting rule written for the languages whose formatter is configured, each named, left out only when none is; the form for one language out of two, with the made-up formatter `pyfmt` in a made-up repository of C++ and Python |
| 6 | DONE | `ordo-init`, "Steps / A configured repository" 10 (the open plans found as `plan-orchestration`'s "What it reads" 1 says; each path with the folder it is relative to in its sentence), 12 (the read-back of the `plan.yaml` and of each open plan's block, the configuration check run again before the sync, and the completion criterion), 14 (the first sync run follows that read-back and check) |
| 7 | DONE | `skills/code/codebase-design/SKILL.md`, the example draft: "About 1,180 of 1,204 declarations." and "310 of 322 headers." |
| 8 | DONE | `codebase-design`, "Steps / standards" 5: "An estimate that lies no more than one tenth of <m> from half of <m>, on either side", and the made-up "about 36 of 60", which lies exactly 6 from 30 and goes to group 4 |
| 9 | DONE | `codebase-design`, "Steps / standards" 5: the bullet on a difference between two rules says that Present is tried first and that the criterion applies only to what is left after the exemptions, to "the very thing the repository's rule expressly allows or expressly sets otherwise"; under "Present, the repository asks at least as much", a bullet on an exemption worded as a prohibition ("exists only for", "never for") with the made-up pair of the header comment |

Verify before you report, rerun on the tree after the round:

1. The character-set check printed nothing and exited 0.
2. `PASS: sync_rules.py scratch tests`, `PASS: check_config.py scratch tests`, `ok: the plan-terms block equals the template`.
3. `ordo-init 1013 4.0.0` and `codebase-design 1019 1.0.0`.
4. The grep prints 43 lines, each of a kind the first report explains.
5. The citations the round wrote were followed: `plan-orchestration`, "What it reads" 1 holds how the open plans of a call are found; "Steps / A configured repository" 4 holds how an error of the configuration check is handled; Steps 1 of `ordo-init` holds the new check. No item number changed.

Judgment call of the round: for ruling 6, an error the second configuration check reports is handled as "Steps / A configured repository" 4 says, since the ruling names the run and not what follows a failure.
