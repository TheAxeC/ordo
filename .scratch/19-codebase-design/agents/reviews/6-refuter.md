# Step 6 refuter report

Agent usage: a7057f07033744b86, claude-fable-5-2, tokens, tool uses and time not given in the completion notice.

Review of step 6, roadmap entry 19 (worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/19-codebase-design-6, base 3e30f8b)

Nothing was changed. Two of the brief's commands use git forms outside the three I was allowed, so I ran equivalents: check 1 with `git status --short` in place of `git status --porcelain --untracked-files=all` (same columns; the only untracked file is the report under `.scratch/`, which the check excludes), and check 4 with `grep -rn` in place of `git grep -n`.

## Checks rerun (from the worktree root)

1. Character-set check over the changed files: printed nothing, `exit 0`.
2. With `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front:
   - `PASS: sync_rules.py scratch tests`
   - `PASS: check_config.py scratch tests`
   - `ok: the plan-terms block equals the template` (exit 0)
3. Frontmatter: `ordo-init 1013 4.0.0` and `codebase-design 1019 1.0.0`.
4. `grep -rn 'beside this skill\|beside it\|standing beside' skills docs/adr README.md`: the hits are the ones the builder's report lists. The new order: `ordo-init/SKILL.md:30`, `codebase-design/SKILL.md:32`, `writing/SKILL.md:30`, `code-comments/SKILL.md:32`, `paper/SKILL.md:76` and `:77`, `grant/SKILL.md:35`, `referee/SKILL.md:29`, ADR 0047 line 17. The script's own statement: `check_config.py:9` and `:111`, `check_config.test.sh:21` and `:26`. ADR 0001 line 20 ("installed beside it"), unchanged. Every other hit uses "beside" of something that is not a skill's folder. No old sentence is left.
5. `git status --short`: ten modified files, all on the brief's path list, plus the report. `ls -d skills/*/<name>` prints `skills/ordo/ordo-init`, `skills/orchestration/plan`, `skills/orchestration/roadmap`, `skills/orchestration/grill`, `skills/academic/{paper,writing,paper-review-panel,grant,referee}`, `skills/code/{code-comments,codebase-design}`.

Every command the builder's report quotes that I could run without writing anything gave the output the report states. The scratch-repository git runs under "Run before written" were not rerun (see "Declined to judge").

## Verdict per item

1. holds. "Steps / A new repository" 8, "Steps / An existing repository" 3 and 12, the Rules exception, the Stops row, the new Rules sentence, one Anti-patterns row, and the `docs/dev/building.md` line of `references/new-repository.md`.
2. holds. One sentence of `templates/shared-rules.md` changed to the brief's wording. `templates/CLAUDE.md` unchanged, and no sentence of it became false.
3. holds, with Behaviour finding 3.
4. holds, with Standards finding 2.
5. holds, with Behaviour finding 2.
6. holds for `ordo-init`, `codebase-design`, `writing`, `code-comments`, `paper` line 76 and ADR 0047. For `grant`, `referee` and `paper` line 77 the brief's premise was wrong and the builder wrote a substitute: Spec finding 1. Standards finding 1 and Behaviour finding 1 also attach here.
7. holds.
8. holds.
9. holds.

## Verdict per case, with the walk

1. met. Steps 1 gives a new repository. Items 1 to 7 write the tree. Item 8 follows the existing-repository steps: item 3 there offers `docs/dev/building.md`, the exception in its fourth bullet sends the session to item 8, which says no command is run, each is written as named, the draft says beside each that it was not run and why, and "A failing command" is not raised. Item 12 shows the note. Rules forbids writing a file so that a command passes. This is the expected result.
2. met. "Steps / An existing repository" 3: the command is run once, fails, "is not written as a check", and is the stop. Unchanged from the base.
3. met. The Prose rule of the block reads "The standard is the repository's prose standard"; the block names no path.
4. met. Configured case: the sync exits 2 with the glossary's no-single-block line (`sync_rules.py` head comment: "a missing glossary included"). Item 10 drafts the file at `docs/glossary.md`, adds `../docs/glossary.md` to `standards` of `.agents/plan.yaml` as a diff, and with no `standards` key writes the key with that path and its comment. Item 14 reruns the sync with `--glossary`.
5. met. "Steps / An existing repository" 11 offers `CLAUDE.md`; the Rules check runs `git check-ignore -q -- CLAUDE.md` before the draft; item 12 marks the file with the line `git check-ignore -v` prints; item 16 keeps it out of `git add` and `git commit`; Rules has the last message name it apart. No text touches the ignoring line.
6. met. Item 16 stops; the Stops row "No commit allowed" applies since other files are not ignored, and shows the ignored file apart.
7. met where the commit rule allows a commit: item 9 checks and marks the diff, `--write` rewrites the block, item 15 makes no commit and the last message says so. Under a commit rule that forbids committing the text reads two ways: Standards finding 2.
8. met. Lines 8 to 10 of the Python page (what only the tools do) are left out; each "ruff's ... fails ..." sentence is left out and its requirement sentence kept, as the made-up `X100` example shows; the common page's Formatting rule goes by the bullets "What only the tool can do is left out" and "A placeholder for a check that only such a tool runs is left out with it"; the draft lists the tools per page. Whether "a line length of 100" survives as a plain requirement is left to the session; either outcome meets the case.
9. met. Ruff "the user named ... in an answer" counts as configured and its lines stay; pyright's line goes.
10. met. From `<pinned tree>/skills/ordo/ordo-init`, `skills/ordo/plan` does not exist, and the second place gives `skills/orchestration/plan` and `skills/orchestration/roadmap`. From `skills/code/codebase-design` the second place gives `skills/ordo/ordo-init`. The order matches `plan_skill()` in `check_config.py`.
11. met. "about 33 of 60", within 6 of 30, group 4.
12. met. "about 55 of 60", group 3.
13. met. On a noted page, or as a described practice on a compared page, Present fails (no rule on the requirement on a compared page), and "A difference by contradiction" gives group 1. As a rule asking the opposite on a compared page, neither Present bullet fits and group 1 follows. Step 10 quotes the sentence with "describes".
14. met. The first default sentence falls under "asks the same or more"; the second "takes ... a kind of defect out of a requirement" and is an exemption. Present.
15. met. On the API the default "allows what the repository's rule forbids" (an exemption); outside it the default says more where the repository is silent. The Present line's "each part ... falls under one of the two bullets" joins them.
16. met. The repository asks more; Present is tried before group 1.
17. met. The sub-bullet "A repository rule that sets a limit expressly allows what stays within the limit" keeps the pair out of "the default says more where the repository is silent", and "A difference between two rules" gives group 1.
18. met. Output quoted under check 2.

## The two skills read as wholes

Citations followed, each exists and says what is cited: `ordo-init` to "Steps / A new repository" 3, 8, 10 and 12, "Steps / An existing repository" 3, 9, 10, 11 and 12, "Steps / A configured repository" 2, 7 and 10, "What it reads" 2, 3 and 7, `grill` "Steps / Writing what settled" 2 (lines 300 to 315 hold the two additions of the path), `plan` "What it reads" 1 (holds how a path is read), `codebase-design` "Steps / standards" 5 (holds the split of a rule that names a tool); `codebase-design` to "What it reads" 2, Steps / standards 3, 5, 8, 10 and 11. No item number changed in either skill, and the citations in `docs/glossary.md` and `templates/plan-terms.md` still point at what they name.

Stops rows: every row of both tables names items that raise it. The changed rows are "The draft of the tree", "A failing command" and "No commit allowed" in `ordo-init`, and "No ordo-init folder" in `codebase-design`. `ordo-init` has no row for a `plan` or `roadmap` folder found in neither place: Behaviour finding 1.

Contradicting pairs and unclear states: Standards findings 1 and 2, Behaviour findings 1 and 2.

## Item 6, place by place

- `writing` line 30, `code-comments` line 32, `paper` line 76: `ordo-init` stands in `skills/ordo/`, these skills in `skills/academic/` or `skills/code/`. The old sentence was false in this repository's layout with links resolved; the new one is true. Needed.
- `codebase-design` "What it reads" 2 and its Stops row: same. Needed.
- ADR 0047 lines 7, 17 and 38: old false, new true. Line 7 is a third place the brief did not count; it stated the same false location. Needed.
- `paper` line 77 (the `writing` folder): `writing` and `paper` both stand in `skills/academic/`. The old sentence was true. The new one is also true, by its first place. Not needed, harmless.
- `grant` line 35 and its Stops row (the `paper` folder): both in `skills/academic/`. Old true, new true. Not needed, harmless. The row now shows both paths, which is consistent with line 35.
- `referee` line 29 and its Stops row (the `paper-review-panel` folder): same. Not needed, harmless.

None of the three is wrong. Whether they stay is the orchestrator's ruling (Spec finding 1).

## Items 7 to 9: cases 11 to 17 by the text alone

11 group 4; 12 group 3; 13 group 1; 14 present; 15 present; 16 present; 17 group 1. All as the brief expects.

Pairs the text sorts two ways:

- A default narrowing worded as a prohibition against a repository requirement. Made up: default "A test exists only for a script", repository "Every fix begins with a failing test". Read as an exemption ("takes ... a kind of defect out of a requirement ... however it is worded") it is present; read as "the default rule forbids ... something that the repository's rule ... expressly sets otherwise", or as "a rule that asks the opposite", it is group 1. Present is tried first, so the outcome depends on which reading the session takes at the Present bullet. The base example's pair (the whole verify list before reporting, against "runs once, at landing") is of the same family: "once" read as a cap is a difference, read as an allowance is present.
- An estimate exactly one tenth away from half (36 of 60, or 24 of 60). "within one tenth of <m> of half" does not say whether the edge is inside. 36 goes to group 4 or group 3.
- Which counts are estimates. A count per file by a pattern (`grep -L '#pragma once'` over a file list) lists each place and is also "a pattern over lines". The example draft writes the header count as an estimate and the pointer-declaration count ("1,180 of 1,204 declarations"), which no command lists without a parser, as exact.

One pair the text sorts one way and that is worth knowing: a default rule that a compared page states and a noted page contradicts is present, and nothing is shown, since Present is the first that fits. The brief asks only that such a rule never stands in group 2, 3 or 4, so this is within the brief.

## The builder's judgment calls

- The same order written into `grant`, `referee` and `paper` line 77 with the folder each names: not the builder's decision. Change standard rule 4: "the substitute is the orchestrator's to write, not the builder's", and such a point "is reported as a stop; the report never decides it as a judgment call". The builder reported the wrong premise with evidence and then wrote the substitute.
- ADR 0047 line 7: inside the brief (item 6 names the ADR, and the sentence stated the false location).
- Item 4 stated once in Rules and named from the steps: inside the brief and the skill layout ("A rule that holds throughout the skill goes in Rules").
- The When cell of "No commit allowed" narrowed to runs with a file git does not ignore: inside the brief ("When every file written is ignored, no commit is made and the last message says so"), but the three step sentences were not aligned with it (Standards finding 2).
- The bullet on a placeholder for a check only an unconfigured tool runs: inside the brief; case 8 needs it.
- 61 to 62 in the example: inside the brief ("kept consistent").
- The sub-bullet on a repository rule that sets a limit: inside the brief; case 17 rests on it.
- The five Anti-patterns rows: inside the brief ("everywhere the skill states the behaviour ... Anti-patterns").
- The made-up examples: inside the brief.

## Findings

### Spec

1. `skills/academic/grant/SKILL.md` "What it reads" 1 (line 35) and Stops row "The `paper` skill is not installed"; `skills/academic/referee/SKILL.md` "What it reads" 1 (line 29) and Stops row "The panel skill is not installed"; `skills/academic/paper/SKILL.md` "What it reads" 1, second bullet (line 77). Quoted, `grant`: "The `paper` skill's folder, with its `SKILL.md`, found from this skill's folder with every link resolved: the folder of that name beside it, and otherwise the folder of that name in a group folder beside this skill's group folder." What is wrong: the brief's item 6 says these places name the `ordo-init` folder; they name `paper`, `paper-review-panel` and `writing`, whose old sentences were true. The builder wrote a substitute where rule 4 of the change standard leaves the substitute to the orchestrator. Failure scenario: none for a session running these skills, since the first place of the order finds the folder; the cost is five changed places in three skills on a ruling nobody gave. Wording only. The orchestrator rules: keep, or put the five places back.

### Proof

none

### Standards

1. `skills/academic/writing/SKILL.md` "What it reads" 1 (lines 30 and 31) and Stops row "No prose standard" (line 279); `skills/code/code-comments/SKILL.md` lines 32 and 33 and row at line 322; `skills/academic/paper/SKILL.md` line 76 and row at line 948. Quoted, `paper`: "A folder found in neither place is named, with both paths, in the message the skill then gives. Neither is a refusal that names both paths." What is wrong: "neither place" and "both paths" now have two referents in adjacent sentences: the two places the `ordo-init` folder is looked for, and the two places the prose standard is looked for. The Stops rows still read "Neither of the two places of "What it reads" 1" and show "Both paths". Skill layout, "One meaning has one place"; change standard rule 19. Failure scenario: a session with no prose standard in the repository and no `ordo-init` folder writes a refusal with "both paths" and cannot tell whether that is the repository's path and one template path (which does not exist as one path) or the two candidate folders; a reader of `paper` line 76 takes "Neither is a refusal" to be about the folder's two places. Changes what the refusal message holds; otherwise wording.
2. `skills/ordo/ordo-init/SKILL.md`, "Steps / A new repository" 12 (line 181: "Otherwise the skill stops ("Stops")."), "Steps / An existing repository" 16 (line 304), "Steps / A configured repository" 15 (line 401: "and otherwise stop ("Stops")"), against the Stops row "No commit allowed" (line 422: "... and a file written or changed is not ignored by git"). What is wrong: the steps say the skill stops whenever the commit rule forbids the commit; the row says the stop is raised only when a file is not ignored; each step's completion bullet has a third outcome the "otherwise" sentence does not allow for. Change standard rule 19. "What it reads" 7 also still has the skill ask whether it may commit at the stop of items 9 and 11 when the only file changed is ignored and no commit can follow. Failure scenario: case 7 under "commit only when told": the session follows item 15, raises "No commit allowed" with an empty list of files to commit, and waits for "The user's commit" of nothing; or asks the commit question for a change it will not commit. Changes what a session does.

### Behaviour

1. `skills/ordo/ordo-init/SKILL.md`, "What it reads" 2 (line 32) and 3 (line 34): "A folder found in neither place is named, with both paths, in the message the skill then gives." What is wrong: the text does not say whether the run ends, no Steps item reads the folder before a draft, and the Stops table has no row, while the layout asks that "An input whose absence is a refusal says so in its item". The sentence is the brief's own wording, so this is a gap the brief carried into the skill; `codebase-design` ties the same sentence to its refusal "No ordo-init folder", `ordo-init` ties it to nothing. Failure scenario: an installation without the `plan` skill: the session gives the message and then either goes on and drafts `docs/plan.yaml` without the key list, or stops at a point of its own choosing after files were written. Changes what a session does.
2. `skills/ordo/ordo-init/SKILL.md`, "Steps / A new repository" 3, the bullets on a tool (lines 113 to 123), against the common page's rule "Each language has one formatter, with its configuration pinned in the repository. The verify list runs each formatter as <the format check>." What is wrong: the text decides per tool, and the common page's Formatting rule speaks of every language's formatter at once. Failure scenario: a new repository in Python and C++ where the user names ruff and no C++ formatter: the session cannot tell whether the Formatting rule is written (it then states a formatter for C++ that nobody configured), left out (it then drops ruff, which the user named), or rewritten for one language, and the text gives no form for the third. Changes what a session writes.
3. `skills/ordo/ordo-init/SKILL.md`, "Steps / A configured repository" 10 (lines 373 to 377), 12 and 14. Quoted: "The glossary's path, as it reads from the repository root, is also added to the `standards` line of the configuration block of each open plan of that `plan.yaml`, as the `grill` skill's "Steps / Writing what settled" 2 adds the path". What is wrong: two things `grill`'s step has are not stated here. `grill` names where the open plans are found (`plan-orchestration`'s "What it reads" 1) and ends on "the `plan.yaml` and each open plan's configuration block, read back, hold its path"; `ordo-init` names neither, its "What it reads" lists no state file, item 12 is done "when the approved change is on disk", and item 14 reruns the sync only, so the configuration check never runs on the changed `plan.yaml`. Failure scenario: the session writes a path relative to the wrong folder into `standards` (the two forms, from the file's folder and from the repository root, stand side by side in the same bullets); nothing in the run reads it back, and the next `/plan` or `/spec` refuses on a page that does not exist. Changes what a session does.
4. `skills/code/codebase-design/SKILL.md`, "Steps / standards" 10, the example draft (lines 201 and 202): "1. A pointer binds to its type: `T* p`, never `T *p`. 1,180 of 1,204 declarations." beside "2. Every header opens with `#pragma once`. About 310 of 322 headers." What is wrong: the example shows as exact the count that needs a pattern over lines, and as an estimate the one a per-file listing gives. Failure scenario: a session takes the example as the model and writes a pattern-made count of declarations without "about". Wording only.
5. `skills/code/codebase-design/SKILL.md`, "Steps / standards" 5 (line 119): "An estimate within one tenth of <m> of half of <m>, on either side, puts the rule in group 4". What is wrong: the edge is not placed. Failure scenario: "about 36 of 60" goes to group 3 in one run and group 4 in another, and in group 3 it is added unless struck. Changes what a session does at the edge only.
6. `skills/code/codebase-design/SKILL.md`, "Steps / standards" 5 (lines 106, 110 and 112). Quoted: "A default sentence that takes a kind of file or a kind of defect out of a requirement ... is an exemption however it is worded" and "the default rule forbids or requires something that the repository's rule expressly allows or expressly sets otherwise". What is wrong: a default sentence that narrows by forbidding ("A test exists only for a script") fits both, as the first pair under "Pairs the text sorts two ways" shows. Failure scenario: two runs on the same repository show the same pair once as difference A and once not at all. Changes what a session does; the brief's cases 14 and 16 fix the outcome for their own wordings only.

## Declined to judge

- The builder's scratch-repository git runs ("Run before written": `git check-ignore` exit statuses, `git add` exiting 1 on an ignored path while staging the others, `git status --short` not listing an ignored file). Rerunning them needs a scratch repository, which I may not create. The shipped sentence "since `git add` exits 1 on an ignored path even when it stages the others" rests on them: not verified by me.
- The builder's first-run readings of cases 1 to 17 on the unchanged tree, beyond the base text of `codebase-design` "Steps / standards" 5, which I read with `git show 3e30f8b:...` and which matches what the report quotes.
- `git diff --numstat` counts in the report: not rerun; no decision rests on them.
- Whether the brief's decisions are right (commands written unrun, no path for the prose standard, the one-tenth band, no version raised): the brief's, not the step's.
- Whether ADR 0001 line 20 ("installed beside it") should change: the file is outside the step's paths and speaks of the installation.
- The whole verify list: it runs at landing on main.
