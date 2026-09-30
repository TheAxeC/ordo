# Step 9a, repair round 1

The refuter report is `.scratch/2-e-grill/agents/reviews/9a-refuter.md` in the main checkout. Its findings are ruled below. The work is in the same worktree, `.agents/worktrees/2e-9a`, under the same brief and the same rules. Each ruling gives the text now in the file and the text it becomes; a new sub-bullet stands at the indent of the sub-bullet it follows. Where a ruling names five skills, they are `roadmap`, `plan`, `ordo-init`, `repo-setup` and `grill`.

No git command that changes state is run, by hand or by a script: no `git reset`, `git checkout`, `git restore`, `git clean`, `git stash`, `git commit`, `git add`, and nothing that holds the text "git push". No text read from a file is passed to a shell inside double quotes or unquoted; a pattern goes into a pattern file written with a quoted heredoc and is read with `grep -F -f`.

## Rulings

1. Spec 1, which keys `/ordo-init` derives from the tree. `skills/ordo-init/SKILL.md`, Steps 11: the sub-bullet "Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated." becomes these two sub-bullets:

   ```
   - Under `/repo-setup`, the keys `roadmap`, `rules` and `standards`, which this skill reads from the files `/repo-setup` wrote, count as stated.
   - `verification`, `ledger_root`, `archive_root` and `worktree_root` are compared with the ruling like any other key.
   ```

2. Spec 2, a quoted ruling that holds no step list. `skills/plan/SKILL.md`:
   - Steps 2: "Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check." becomes "Under a quoted ruling ("What it reads" 6) whose sub-bullets hold a step list, the step list is the ruling's, each step with its check."
   - Steps 2, after "A closing step in the ruled list is dropped for the one `/plan` writes.", one sub-bullet: "Under a quoted ruling whose sub-bullets hold no step list, the step list is drafted from the gate."
   - Steps 3: "Under a quoted ruling, the draft is written without the stop only when four things hold." becomes "Under a quoted ruling, the draft is written without the stop only when five things hold.", and the first of the nested bullets under it is new: "The ruling's sub-bullets hold a step list."

3. Spec 3, where `/grill` reads the quoted ruling and drafts the ruled diff. `skills/grill/SKILL.md`:
   - Steps 1, before its "The step is done when" sub-bullet, two sub-bullets: "The quoted ruling ("What it reads" 11) is read here." and "With no ruling, the skill says which case it found before the first round."
   - Steps 3, before its "The step is done when" sub-bullet, one sub-bullet: "Under a quoted ruling whose sub-bullets hold the entry's changed text, the roadmap diff is drafted here, as "Steps / Writing what settled" 3 says, and is not a decision of the tree when it is written."
   - "Steps / Writing what settled" 3: "Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8." becomes "Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at Steps 3, before the first round."
   - The same item: "A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision." becomes "A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as a decision of the first round."

4. Standards 1 and 2, whether a draft under a covering quoted ruling is shown. The draft is shown in every run; a quoted ruling that covers it removes the wait and nothing else. The description of `repo-setup`, `README.md` lines 17, 35 and 117, the line of `ordo-help` and the figure then stay true and are not changed.
   - `skills/repo-setup/SKILL.md`, Steps 4: before "Under a quoted ruling, the draft is written without the stop only when four things hold.", one sub-bullet: "The draft is shown in every run, under a quoted ruling too." "Otherwise the draft is shown whole, and the stop stands." becomes "Otherwise the stop stands."
   - `skills/repo-setup/SKILL.md`, "Steps / sync" 3: "A diff whose hunks are not the ruling's is shown whole, and the stop stands." becomes the two sub-bullets "The diff is shown in every run, under a quoted ruling too." and "For a diff whose hunks are not the ruling's, the stop stands."
   - `skills/repo-setup/SKILL.md`, "Steps / sync" 5: "A draft that differs from it is shown whole with each difference named, and the stop stands." becomes the three sub-bullets "The drafted change is shown in every run, under a quoted ruling too.", "A draft that differs from the ruled change is shown with each difference named." and "The stop then stands."
   - `skills/plan/SKILL.md`, Steps 3: before "Under a quoted ruling, the draft is written without the stop only when five things hold.", one sub-bullet: "The draft is shown in every run, under a quoted ruling too." "Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands." becomes the two sub-bullets "Otherwise the stop stands." and "The draft then names each step or check that differs from the ruling's."
   - `skills/roadmap/SKILL.md`, Steps 4: "A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands." becomes the two sub-bullets "For a draft that differs in anything, such as a place or a number the skill's own rules give, each difference is named with the diff Steps 3 shows." and "The stop then stands."
   - `skills/ordo-init/SKILL.md`, Steps 11: "A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written." becomes the two sub-bullets "For a draft that differs in anything, or a page whose text the ruling does not hold, each difference is named with what Steps 10 shows." and "The stop then stands, with nothing written."
   - `skills/ordo-init/SKILL.md`, Rules: "Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say." becomes "Under a quoted ruling that states the change, it is made without waiting for the approval, as Steps 11 and "Steps / Checking an existing file" 4 say."
   - `README.md` line 113: after the sentence that ends "and whether to install the git guard." the sentence "A question a quoted ruling answers is not asked." is added, on the same line.

5. Standards 3, two rules in one bullet.
   - In each of the five skills, the last sub-bullet of the quoted-ruling item of "What it reads", "With no ruling, the skill says which of these it found, and every stop stands.", becomes the two sub-bullets "With no ruling, the skill says which of these it found." and "Every stop then stands.", at the same indent.
   - `skills/plan/SKILL.md`, Steps 2: "A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place." becomes the two sub-bullets "A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks." and "None of those lines is a line left to place."

6. Standards 5, who runs the skill after a ruling by hand. By hand the user types it, as the user types `/spec`.
   - `skills/spec/SKILL.md`, "Steps / A ruling" 2: after the sub-bullet "the change the option stated is copied under that bullet as sub-bullets, ...", one sub-bullet, in the form of its neighbours: "the session then prints that skill's command whole, with `--ruling <ledger file> "<name>"` filled in, for the user to type;"
   - "Steps / A ruling" 3: "After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`." becomes "After a ruling on an option that runs a skill and states the change in full, the user first types the command the session printed."
   - `skills/ordo-help/SKILL.md`: the text of the line "after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again" becomes "after a ruling on an option that runs a skill and states the change, the session prints that skill's command with --ruling <ledger file> "<name>"; type it before /spec", in the same column.

7. Standards 4, the sentence "unless the run is under a quoted ruling that states the change" against the stops a quoted ruling does not lift: raised to the user as an open item. Nothing is changed for it in this round.

8. Standards 6, the git commands a helper script ran: nothing to change in the diff, which equals the saved patch. The rule at the head of this file holds for this round.

## Verify before you report

1. The plan's verify list, run as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, ends `checks: 11 commands passed` and exits 0.
2. Each new text of rulings 1 to 6 stands once in its file (`grep -c -F -f <pattern file> <file>` gives 1), except "Every stop then stands." and "With no ruling, the skill says which of these it found.", which give 1 in each of the five skills, and "The draft is shown in every run, under a quoted ruling too.", which gives 1 in `plan` and 1 in `repo-setup`. "The stop then stands." gives 1 in `roadmap` and 1 in `repo-setup`. Each replaced text gives 0 in its file.
3. `git grep -n 'shown whole' -- skills` is read: no hit is left in a sentence about a quoted ruling.
4. Reading: `grill` Steps 1 to 10 with an entry whose decisions are all settled and a quoted ruling that holds the entry's changed text: the entry is written and the end lists it. `plan` Steps 2 and 3 with a quoted ruling that holds no step list: the stop stands. Each with the lines that decide it.
5. `LC_ALL=C grep -c '[^ -~]'` gives 0 for each changed file, and no added line holds a tab.
6. `git diff --stat 9f85c25167de344c56879d5dcefb63456848df11` shows the fourteen files of the step and no other outside the ledger.

## Report

Append a section "Repair round 1" to `.scratch/2-e-grill/agents/reviews/9a-report.md` in the worktree: each ruling with the file and line of each change, the output of each check, and `git diff 9f85c25167de344c56879d5dcefb63456848df11 | md5 -q`. Anything not done is stated first.
