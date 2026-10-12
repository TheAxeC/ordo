# Step 1 brief check (on main at 1f1e9a5)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. All reads ran on main at 1f1e9a5. The only file not committed is the brief: `git status --short` printed `?? .scratch/2-i-several-plans-in-one-session/agents/briefs/1.md`.

## 1. Names

- `workers_at_once`: I ran `git grep -n workers_at_once -- . ':!.scratch' ':!docs/adr'`. Every hit is inside the paths: `.agents/plan.yaml:14`, `docs/glossary.md:31,55`, `skills/plan-orchestration/SKILL.md:55,93,276`, `skills/plan/SKILL.md:154`, `skills/plan/templates/orchestrator-state.md:21,34`, `skills/plan/templates/plan.projects.yaml:23,50`, `skills/plan/templates/plan.yaml:21`, `skills/repo-setup/templates/plan-terms.md:26,50`, `skills/spec/SKILL.md:213,214`. Outside the paths, `git grep -n workers_at_once -- .scratch ':!.scratch/archive'` printed `.scratch/3-the-writing-base/orchestrator-state.md:27:workers_at_once: 3`. The change makes that line false (see finding 3).
- "one plan at a time": `git grep -n -i -e 'one plan' -e 'an open plan' -e 'the open plan' -e 'several plans' -e 'every open plan' -- skills docs README.md utils .agents ':!docs/adr'`. The hits outside the paths are `skills/grill/SKILL.md:29,48,201,228,264,274,280`, `skills/plan/SKILL.md:29,188` (inside the paths), `skills/roadmap/SKILL.md:31,144,193`, `skills/session-retro/templates/sessions.md:5` and `docs/roadmap.md:21,24,25`. Each one stays true: they speak of one entry's plan, not of how many plans a session runs.
- Worktree and branch naming: `git grep -n -e 'worktree_root>/<step>' -e '\-b <step>' -- skills docs README.md ':!skills/land/templates/land.sh'` hits only paths inside the list (`docs/glossary.md:138`, `skills/land/SKILL.md:152`, `skills/repo-setup/templates/plan-terms.md:133`, `skills/spec/SKILL.md:193`). `git grep -n -e '<step>-land' -e '<base>\.\.<step>' -e 'land.sh <state file> <step>' -- skills docs README.md utils .agents` adds `skills/land/templates/land.sh:8,10,13,15,29,30,32,34,39,62,64,65,88,279`. That file is outside the paths and stays true, because `<step>` there is the script's own argument name. `skills/session-retro/SKILL.md:74,79` matches worktree folders by the prefix `<worktree_root>/` and stays true.
- The dispatch block: `git grep -n -i -e 'dispatch block' -e 'in flight' ... -- skills` hits outside the paths in `skills/diagnose/SKILL.md:43,45,94,357` (one plan's dispatch entry for its own step). These stay true.
- Resume point and the commit that carries a record: `git grep -n -i -e 'resume point' -e 'resume-point' -e 'own records' -e 'the session wrote' -- skills docs README.md utils ':!docs/adr'`. The hits outside the paths are `skills/diagnose/SKILL.md:71` ("The next resume-point commit carries it, as `plan-orchestration`'s ... says."), which D20 makes false (finding 2), and `skills/diagnose/SKILL.md:305,308`, which stay true.
- Commit command form: `git grep -n -i -e 'commit' -- 'skills/*/SKILL.md' 'skills/*/references/*.md' 'skills/*/templates/*.md'`, filtered to sentences that make a commit. The hits outside the paths are `skills/repo-setup/templates/shared-rules.md:21` ("Stage by explicit path; never `git add -A`"), which stays true, and `skills/diagnose/SKILL.md:305-306` and `skills/session-retro/SKILL.md:149`, which already have the form. The places inside the paths that make a commit on main and that the brief does not list are finding 5.

Findings:

1. "What to build" 1 (brief lines 51-57) does not name `skills/spec/SKILL.md` "Stops", row "A step in flight", or "What it reads" 3. Both read the limit from the configuration block without writing the key's name, so the `workers_at_once` greps of "Verify before you report" 3 and "What to build" 17 cannot find them. Evidence: `skills/spec/SKILL.md:398: | A step in flight | A step is already in flight, and the configuration block does not allow more than one | ...` and `skills/spec/SKILL.md:37: - A step already in flight is a refusal, under the condition in "Stops".` Failure scenario: the builder removes the key from the block and leaves this row as it is. After that, `/spec` of a second step of one plan reads a block with no limit and refuses, and its count never looks at another plan's dispatch block. The one limit across plans then does not hold at `/spec`.
2. `skills/diagnose/SKILL.md:71`, outside the paths: "The next resume-point commit carries it". D20 makes this false in the same way as `skills/refute/SKILL.md:80`, which "What to build" 6 rewrites. Failure scenario: the builder, kept to the path list, leaves diagnose saying that any next resume-point commit carries a diagnosis record. The text then disagrees with the rewritten refute and plan-orchestration texts, against the rules file's rule 19.
3. Another plan is open. `for d in .scratch/*/; do ... head -1 $d/plan.md` printed `.scratch/3-the-writing-base/: # Plan: 3. The writing base`, and its state file holds `workers_at_once: 3` at line 27. "Decisions taken in this brief" 6 (line 171) removes that line only from plan 2.I's state file. D25 (a commit of one plan rewrites no other plan's state file) keeps plan 2.I's landing commit from touching plan 3's state file, and "What is on the tree" does not name plan 3. Failure scenario: after the landing, plan 3's configuration block still carries a key that the skill texts and the glossary say the block no longer holds, and no step or record says who removes it or when.
4. Places inside the paths that state a rule a ruling changes. No item of "What to build" names them, and the grep list of "What to build" 17 does not reach them:
   - `skills/plan-orchestration/SKILL.md:47` "Resolve a dispatch block before anything else." (D17). The grep `the dispatch block` misses "a dispatch block".
   - `skills/plan-orchestration/SKILL.md:38` "What it reads" 5, the refuter reports since the last pass (D27, which keeps the pass per plan).
   - `skills/plan-orchestration/SKILL.md:10` and `:165` "The loop ends only at a pause or when nothing unblocked is left". D23 makes a pause hold only the plans it names, and D26 sets the end condition. Item 14 names the introduction only for the invocations.
   - `skills/plan-orchestration/SKILL.md:100,118` "The next resume-point commit carries them." and `skills/spec/SKILL.md:64` (D20). Item 17 greps `resume point`, which does not match the hyphenated "resume-point".
   - `skills/land/SKILL.md:88` "The commit also holds the other ledger records the session wrote since the last one.", `skills/plan-orchestration/SKILL.md:73` and `:127` ("the session's own records since the last resume point") and `skills/spec/SKILL.md:263` ("The ledger files the session wrote"). All four are D20, and "What to build" 6 names none of them.
   - `skills/land/SKILL.md:233` "The state file is rewritten before the commit, so main's head always carries a state file that describes it." and `skills/plan/templates/orchestrator-state.md:3` and `:65` ("Rewritten before every step commit"). These are D25; item 11 names only plan-orchestration "Resuming" and land Steps 10.
   - `skills/plan/templates/orchestrator-state.md:34`, the description of `shared_paths` ("each shared file and why the merge at landing is simple"), is D22. Item 8 names plan-orchestration, spec Steps 5 and 9 and the glossary, but not this template.
   - `skills/plan/templates/orchestrator-state.md:69` "or PAUSED, until <the user> says otherwise" is D23, which says where a pause is written. Item 9 names Steps 5, "Stops" and the glossary **pause**, but not the template line, and not the form of the position line, which has no place for a pause.
   - The glossary entry **session, the** (`docs/glossary.md:114`, "Its own records are the ledger changes it made since the last resume point, ... which its next resume-point commit carries") is D20. The list in "What is on the tree" (line 43) leaves it out, yet names **landing** (60), which no item of 1 to 14 names.
   
   Failure scenario: the builder works from the item lists and from the greps of item 17, leaves these lines as they are, and the landed texts state both the old rule and the new one.
5. Commits on main that a skill text makes, missing from "What is on the tree" ("Commits on main", lines 29-37) and so from item 5:
   - `skills/spec/SKILL.md:222-223` "Run by hand, the session writes itself as the identity. It makes that commit before the build starts." This is the launch commit when the step is run by hand.
   - `skills/land/SKILL.md:133` "Such a ledger file left modified means the commit missed the booking, and the head is amended with its path." This is an amend on main with no command form.
   - The closing step's two commits on main: `git log --format='%h %s' -8 --name-status` shows `1231b70 Write the closing report of plan 2.H` and `1f1e9a5 Close plan 2.H` (42 renames). They are made by the step `skills/plan/SKILL.md:105-116` describes and by `skills/plan/templates/plan.md:21`, and no skill text names a commit or its form for them.
   
   Failure scenario: after the step these commits still have no paths in the commit command. That contradicts ADR 0012 ("Every commit a skill makes on main names its paths") and the step line's "the commit command of every skill that commits on main".

## 2. The step line

- `plan-orchestration` with `references/self-rule.md`: items 1, 3, 5 to 14.
- `spec`: items 1 to 6, 8 and 14 (Use instead only).
- `land`: items 2, 4, 5, 6 and 11.
- `refute`: item 6.
- `plan` with `templates/orchestrator-state.md`: items 1, 4 and 5.
- `ordo-help`: item 14.
- "the commit command of every skill that commits on main": item 5 (see section 1, finding 5, for the places it misses).
- `plan-terms.md` synced into `docs/glossary.md`: item 15.
- `README.md`: items 4 and 14.
- "as the rulings D15 to D28 say": items 1 to 14, one per ruling.
- "each skill's version raised as `docs/dev/skill-layout.md` says": item 16.
- The check "each changed text read in place against its ruling": Cases D15 to D28.
- The `git grep` check: "Verify before you report" 2 and case D19.
- `sync_rules.py ... --only glossary` exits 0: Verify 1.
- `checks.sh <state file>` passes: Verify 1, last bullet (the whole verify list at landing, as the rules file's rule 6 says).

Findings: none.

## 3. Premises

- ADR statuses: `grep -n '^Status' docs/adr/001[012]-*.md` printed `Status: proposed` three times. Matches.
- The `workers_at_once` hits (brief lines 17-24): my grep printed the same files and lines. Matches, except finding 2.
- `grep -n workers skills/ordo-init/templates/check_config.py skills/land/templates/checks.sh skills/plan-orchestration/templates/*.py` printed nothing and exited 1. Matches.
- "One plan at a time", `skills/plan-orchestration/SKILL.md:52-54`: the three quoted lines are at 52, 53 and 54. Matches.
- The dispatch block places: "What it reads" 3 is line 36, "Resuming" runs 196-242, the spec Steps 5 quote is line 164, and ordo-help "What it reads" 3 is line 36 with Steps 3 at line 46. Matches.
- Worktree and branch: `grep -n 'worktree add' skills/spec/SKILL.md` printed line 193 `git worktree add -b <step> <worktree_root>/<step> <base>`. land is at lines 146 and 148, orchestrator-state.md at 54 and README.md at 163. In land.sh, line 195 is `landing_worktree=$landing_root/$landing_worktree_root/$landing_step` and lines 41-42 are the argument comment ("letters, digits, ".", "_" and "-""). The glossary has it at 138 and plan-terms.md at 133. Matches.
- Commits on main: the places cited exist at the lines given (plan-orchestration 73, 107, 127, 205, 211 and 378; self-rule.md 31, 43 and 164; spec 189, 263 and 303; land 52, 87, 124-126 and 212; plan 164-173; grill 207; roadmap 93; plan-retro 64; ordo-init 131; repo-setup 118 and 159; diagnose 306; session-retro 149).
- The commit that carries a record: plan-orchestration 204 and 215, refute 80 and 99, and land 132. Matches.
- The verify list: plan Steps 4 is line 154, spec Steps 1 starts at line 60, and land Steps 6 is line 63 with "The landing script" at line 144. Matches.
- Pause, report and night rule: the recurring-findings pass is line 257, "Reports" runs 329-338, the pace section 348-358 and "Stops" line 390. Matches.
- Next-entry mode: self-rule.md lines 51-94. Matches.
- Invocations: plan-orchestration Quick start is lines 14-18, ordo-help's sequence line is 96, README lines 22, 23 and 48, and the `gen_figures.py` band is lines 688-694. Matches.
- Glossary line numbers (brief line 43): all twelve match. `sync_rules.py` could not be run (see "Declined to judge"). `sed -n '/<!-- ordo:plan-terms begin -->/,/<!-- ordo:plan-terms end -->/p' docs/glossary.md | sed '1d;$d' | diff - skills/repo-setup/templates/plan-terms.md` printed nothing ("block equals template").
- Versions: `grep -m1 'version:'` printed plan-orchestration 4.0.0, spec 4.1.0, land 2.0.0, refute 3.0.0, plan 3.0.0, ordo-help 3.0.0, grill 1.3.0, roadmap 1.3.0, plan-retro 1.2.1, ordo-init 2.0.0 and repo-setup 3.0.0. Matches.
- Description lengths: the brief's `python3 -c` printed 961, 1003, 726, 989, 477, 503, 877, 1022, 616, 632 and 783. Matches.
- Rulings against items: items 1 to 14 carry the words of D15 to D28. Item 13 adds "at the cut-off every open plan is paused", which D27 does not say but which follows from the existing "The plan is paused" and from D23. No requirement of a ruling is left out.

Findings:

1. Brief lines 29-37. The list of commit places is introduced by the command `git git grep -n -e 'git add --' -e 'committed by path' -e 'by explicit path' -e 'Commit by' -- skills`, but that command does not print plan-orchestration 107 ("Commit it by path as a round sent") or 127 ("Commit it as a resume point, by path"), self-rule.md 31 ("commits the choices file by path"), spec 303 ("commits these files by path") or plan 164 ("Commit `plan.md` ... by path"). The grep printed 19 lines, none of them these. Failure scenario: case D19 and Verify 2 are run on this same grep, so the builder and the reviewer read only its hits, and these places can stay without the form (see section 5, finding 1).
2. "What to build" 1, line 56, says of `skills/plan/templates/plan.projects.yaml` lines 23 and 50 that "the comment says the limit holds across every open plan". Those lines have no comment: `cat -n` printed `23        workers_at_once: 1` and `50        workers_at_once: 1`. Failure scenario: the builder either adds a comment the item does not word, or edits the file's head comment (lines 1-2), and the reviewer cannot judge which one the item meant.
3. "Decisions taken in this brief" 1, line 160, gives as its reason that "each project has its own ledger root, worktree root and value". The template gives both projects the same worktree root: `plan.projects.yaml:12` and `:39` both read `worktree_root: .agents/worktrees`. The decision also sets what a configuration key means in the `projects:` form. `skills/spec/SKILL.md:156-157` says "A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken. It is a stop.", and under self-rule such a decision is closed as a choice in the choices file, not decided silently in a brief. The plan's goal says "one limit on steps in flight holds across all plans". Failure scenario: one session runs the open plans of two projects, each with its own limit, so the session runs up to the sum of the two limits, against the goal's one limit. The user never sees the choice.

## 4. Cases and checks

- D15 through D28, the glossary case and the versions case: each is consistent with the rules file and the standards, except as the findings below say. No case asks the builder to check, quote or explain a place the step does not change.

Findings:

1. Brief line 126 says "no script and no test changes", while "What to build" 14 changes `docs/figures/gen_figures.py`. `grep -n 'gen_figures' docs/dev/scripts.md` printed `9:| docs/figures/gen_figures.py | Writes the two SVG figures ...`, so it is a listed development script. Failure scenario: a reviewer holds the label change to "no script" as a breach, or the builder reads the two statements as contradicting each other and stops.
2. "Verify before you report" 1 (lines 204-209) leaves out `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`. The step changes `skills/plan/templates/plan.yaml` and `plan.projects.yaml`, and that test copies both: `check_config.test.sh:24: cp "$script_dir/../../plan/templates/plan.yaml" ...` and `:40: cp ".../plan.projects.yaml" ...`. Spec Steps 4 ("each check of the configuration block's verify list that covers a file the step changes") and the rules file's rule 6 both require it. Failure scenario: a rewritten comment on line 21 breaks the example configuration (section 6, finding 4), and this is found only at landing on main, as a red line.
3. "What to build" 5 (last bullet) and 8 ask for one rule to be stated in several places: the landing's run from its cherry-pick to its commit in both land and plan-orchestration "Two steps in flight", and `shared_paths:` in plan-orchestration, spec Steps 5 and 9, and the glossary ("say the same"). `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in." Failure scenario: the builder writes the order rule in full twice, and the two copies drift, which is the Anti-patterns row "The same rule written in two sections".

## 5. The question

The goal this step delivers is skill texts that make one session run every open plan, and that keep each plan's verify list equal to the verification page.

- Case D15: yes. It reads Steps 2, "Two steps in flight" and the template, and greps two files. It passes with the spec "Stops" row "A step in flight" still reading the limit from the configuration block (section 1, finding 1).
- Case D16: no. It reads the compare and rewrite in both skills. The copy rule it rests on is open (section 6, finding 3).
- Case D17: no, for the shared-and-simple path it reads.
- Case D18: no. It reads the commands in both skills, and Verify 4 greps for the old forms.
- Case D19: yes. The grep does not print the commit places of section 3, finding 1, or of section 1, finding 5, so "read hit by hit" passes with those places lacking the form.
- Case D20: yes. It reads only "Resuming". land Steps 12 ("Such a ledger file left modified means the commit missed the booking, and the head is amended with its path", line 133) can still amend plan A's saved report into plan B's landing commit while the case passes.
- Case D21: no.
- Case D22: no, for the configuration-file path.
- Case D23: no. Where the pause is written is section 1, finding 4.
- Case D24: no.
- Case D25: yes. It reads only `/land`'s rewrite. It passes with `skills/land/SKILL.md:233` still saying main's head carries a state file that describes main's head, which states the old rule for every plan.
- Cases D26, D27 and D28: no.
- The glossary case: no. The sync check and a reading of each entry.
- The versions case: this is bookkeeping, not part of the goal, so the question does not apply.
- The check on step 1's line: yes. Its grep, `-e 'git add --' -e 'committed by path'`, prints even fewer places than the brief's. plan.md's own answer ("the grep shows the commit form of every commit on main") does not hold for "Commit it by path", "Commit it as a resume point, by path", "commits the choices file by path", "commits these files by path", "It makes that commit" or the amend.
- Items 1 (with Verify 3) and 5 (with Verify 2): yes, for the reasons given under cases D15 and D19.
- Item 6: yes. Its places leave out `land:88`, `plan-orchestration:73,127,378` and `spec:263` (section 1, finding 4). Decisions 4's dictated sentence for line 378 also keeps "The ledger files the session wrote" (section 8, finding 4).
- Item 11: yes, for the reason given under case D25.
- Items 2, 3, 4, 7, 8, 9, 10, 12, 13, 14 and 15: no.
- Item 16: bookkeeping.
- Item 17: partly. Its grep list misses "a dispatch block", "resume-point", the spec "Stops" row and "Commit it ... by path".

Findings:

1. The D19 case, the step line's grep check and Verify 2 can all pass with commits on main that do not name their paths. An exhaustive form, such as `git grep -n -i -e 'commit' -- skills`, read sentence by sentence, closes this.
2. The D15 case can pass with spec's "A step in flight" row still reading the limit from the configuration block.
3. The D20 case can pass with land Steps 12's amend still carrying another plan's record into a landing commit.
4. The plan's gate requires that "the second plan's step waits until the first plan's step has landed", and no case covers the branch where a shared file is not simple to merge. Case D17 covers only the simple merge. Nothing says whether the slot freed by the waiting step goes to the next plan under D21. Failure scenario: a text where a waiting step holds its slot, or blocks every later plan, passes every case. Step 2's real run then fails on its gate.

## 6. Implied inputs

This is a text step, so the template's check does not apply to it. These inputs are still missing:

1. A step that renames a file. `git diff --name-only 1f1e9a5^ 1f1e9a5 | wc -l` printed 42, and with `--no-renames` it printed 84, because rename detection lists only the new path. Steps have landed renames before: `6c51194 Land step 10 of plan 2.E, plan-help renamed ordo-help` (`R091 skills/plan-help/SKILL.md skills/ordo-help/SKILL.md`). Item 5's landing commit takes "every path from `git diff --cached --name-only`" into `git commit -m <message> -- <path> ...`, so the old path's deletion stays staged and out of the commit. Expected: the old path is named too, for example from `git diff --cached --name-only --no-renames`.
2. A new, untracked file in a commit whose dictated form has no `git add` (Decisions 4, the sentences for plan-orchestration 378 and self-rule 164). A stop can commit a newly saved report or diagnosis record. The error string exists in git 2.49.0: `strings "$(git --exec-path)/git" | grep "did not match any file(s) known to git"` printed `pathspec '%s' did not match any file(s) known to git`. Expected: `git add -- <path> ...` for every new or changed path, as item 5's first bullet says.
3. The verify list compare. Plan 2.I's state file carries `- sh skills/land/templates/land.test.sh 2>&1 | tail -1` with the comment "Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md". The page's own block reads `sh skills/land/templates/land.test.sh   # land.sh on a conflict, ...` with no filter, and `skills/plan/SKILL.md:154` says only "the verification commands copied from the page". Expected: the brief says how the filters enter the compare. Otherwise every `/spec` and `/land` finds a difference that is not one, and rewrites the list, with or without the filters.
4. The comment on `skills/plan/templates/plan.yaml:21` is parsed. `check_config.py:93` matches `#\s*(required\.|optional, default (.*?)\.\s)`, and a key it does not know is `unknown key` (`:152`). Expected: the comment keeps `optional, default 1.` at its head, or `workers_at_once` becomes an unknown key in every repository that sets it.
5. The `projects:` form. Nothing says which projects' open plans `/plan-orchestration` with no entry runs, how the roadmap order works across several roadmaps, or what happens when two projects share `worktree_root: .agents/worktrees` and have the same slug (`<worktree_root>/<slug>-<step>`).
6. No open plan, for `/plan-orchestration` and `/ordo-help` with no entry (with `next_entry: off` for the first). Nothing says what each prints.
7. A step that must run alone (a configuration or rule file) at the head of the roadmap order while other plans have steps ready. Nothing says whether it counts as "unblocked" under D21 and holds the slot, or whether later plans' steps pass it.
8. The choices file, shared by all plans. `git commit -m <message> -- <ledger_root>/choices.md` commits the whole file, so a commit of plan A carries plan B's uncommitted edits to it, such as a `Builds on it:` line that plan B's `/spec` added before waiting at Steps 5 (`self-rule.md:117-118`). D20's "the choices file when a choice of that plan changed it" does not cover this.

Findings: items 1 to 8 above, each missing from "Cases".

## 7. ADRs

- 0010 touches the step (item 2): "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them." The brief names it.
- 0011 touches the step (item 3): "The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit, to compare a brief's paths with the steps in flight, and to resume." The brief names it.
- 0012 touches the step (item 5): "Every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`." The brief names it.
- 0001 to 0009: none touches the step. 0005's decision sets where the choices file is and that it is never archived. The step changes only which commit carries the file, which that decision does not govern. 0006's ids in dispatch entries are recorded as before.

Findings:

1. The brief leaves out the amend at `land:133`, the hand-run launch commit at `spec:222-223` and the closing commits (section 1, finding 5). After the step, 0012's "Every commit a skill makes on main names its paths in the commit command" does not hold for them, and 0012's consequence "Every skill text that makes a commit names the command form" is not met.
2. 0012's "The landing commit takes its paths from `git diff --cached --name-only`" misses the old path of a rename (section 6, finding 1). The brief copies this sentence. Adding `--no-renames` keeps the record's words, so this is no rule clash, but the brief should state it.

No other part of the brief contradicts a record.

## 8. Dictated text

- `git worktree add -b <slug>-<step> <worktree_root>/<slug>-<step> <base>` (`grep -n -F 'git worktree add -b <slug>-<step>'`, line 67): holds.
- `<slug>-<step>` and `<slug>-<step>-land` (`grep -n -F '<slug>-<step>-land'`, line 68): holds.
- `land.sh <state file> <slug>-<step> <base>` (`grep -n -F 'land.sh <state file> <slug>-<step> <base>'`, line 69): holds.
- `git commit -m <message> -- <path> ...` (`grep -n -F 'git commit -m <message> -- <path> ...'`, lines 15, 73, 74 and 104): holds. It is ADR 0012's form.
- `git rm -q -f -- <path>` (line 75): holds. It is the text that is there now.
- Decisions 4, spec: "The paths are written out in the `git add -- <path> ...` command and again in the commit command, `git commit -m <message> -- <path> ...`." (`grep -n -F 'and again in the commit command'`, line 164): breaks `docs/dev/skill-layout.md` "Lists and tables", first bullet. Naming the paths in `git add` and naming them in `git commit` are two requirements, each of which can be broken while the other holds, joined by "and".
- Decisions 4, land: "The paths are written out in the `git add -- <path> ...` command and in `git commit -m <message> -- <path> ...`, never through a shell variable." (`grep -n -F 'and in \`git commit -m <message> -- <path> ...\`, never through a shell variable'`, line 165): breaks `docs/dev/skill-layout.md` "Lists and tables", first bullet, for the same reason.
- Decisions 4, roadmap: "Commit the files by explicit path list, `git add -- <path> ...` then `git commit -m <message> -- <path> ...`, one commit per change, the subject naming the entry and what changed." (`grep -n -F 'then \`git commit -m <message> -- <path> ...\`, one commit per change'`, line 166): breaks `docs/dev/skill-layout.md` "Lists and tables", first bullet. "then" joins two requirements, and the sentence is a single Steps item.
- Decisions 4, plan-orchestration 378: "The ledger files the session wrote are then committed by path, `git commit -m <message> -- <path> ...`, a resume point, so the stop survives the session." (`grep -n -F 'committed by path, \`git commit -m <message> -- <path> ...\`, a resume point, so the stop'`, line 167): breaks `docs/dev/change-standard.md` rule 19. "The ledger files the session wrote" covers every plan's records, while D20 and item 6 confine a step's stop commit to its own plan's records; a step's stop does not stop the session (`plan-orchestration:10`, "a stop blocks only its own step"). It also leaves out the `git add -- <path> ...` that item 5's first bullet requires for new or changed paths.
- Decisions 4, self-rule 164: "The files the review changed are committed by path at once, `git commit -m <message> -- <path> ...`, a resume point." (`grep -n -F 'committed by path at once, \`git commit -m <message> -- <path> ...\`, a resume point.'`, line 168): leaves out the `git add -- <path> ...` of item 5's first bullet. It holds against the standards pages otherwise.

Findings:

1. Line 164 breaks skill-layout "Lists and tables": two requirements in one bullet.
2. Line 165 breaks skill-layout "Lists and tables" in the same way.
3. Line 166 breaks skill-layout "Lists and tables": "then" joins two requirements.
4. Line 167 contradicts D20 and item 6 (change-standard rule 19), and leaves out item 5's `git add`. Failure scenario: a stop commit of plan A carries plan B's saved report, or fails on a new record with the pathspec error.
5. Line 168 leaves out item 5's `git add`, so the brief gives two forms for the same kind of commit.

## Declined to judge

- `python3 -B skills/repo-setup/templates/sync_rules.py . --only glossary` was refused by the permission classifier, so it did not run. The glossary block was compared with `plan-terms.md` by `diff` instead, which printed nothing.
- Whether `git commit -- <path>` on main fails with "cannot do a partial commit during a cherry-pick." after a cherry-pick conflict on main has been resolved. The string is in git 2.49.0 (`strings ... | grep 'partial commit'`). Whether `cherry-pick -n` leaves a cherry-pick in progress in that case was not run, since this agent is read-only and wrote no scratch repository.
- Whether `git commit -- <untracked path>` prints the pathspec error. The string exists, but the run was not made, for the same reason.
- Decisions 3 raises `repo-setup` by a patch. `skill-layout.md` "Frontmatter" calls for the major part when a run's output changes, and `/repo-setup` writes, and syncs, the glossary block from `templates/plan-terms.md`, which this step changes. Practice is mixed: `git log` over `plan-terms.md` shows `3570071`, `9499e35`, `c3e4741` and `ef9f292` changed it without raising `repo-setup`, while `d3a5b27` raised it to 3.0.0. Which part to raise is the orchestrator's or the user's reading.
- The format of the path line `.agents/plan.yaml` line 14 against the form `lines <a>-<b>` was not judged.

Agent usage: a0a3ea2bc782eb427, claude-opus-5-5, 286488 tokens, 61 tool uses, 13 min 15 s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, finding 1 (spec's limit read without the key's name): "What is on the tree" names `skills/spec/SKILL.md` lines 37 and 398; "What to build" 1 adds spec "What it reads" 3, Steps 9 and the Stops row "A step in flight"; case D15 reads them with a refused `/spec`.
- 1. Names, finding 2 (`skills/diagnose/SKILL.md` line 71): `skills/diagnose/SKILL.md` added to the paths (Decisions 1); "What to build" 6 names line 71; diagnose 2.1.1 in item 16.
- 1. Names, finding 3 (plan 3 open, its block holds `workers_at_once: 3`): "What is on the tree" names plan 3; Decisions 5 has the orchestrator remove the line at plan 3's next resume point, since D25 keeps this plan's commits off plan 3's state file; "What to build" 1 has the texts read a block that still holds the key as if the line were absent.
- 1. Names, finding 4 (places inside the paths no item named): each place is named in "What is on the tree" and in its item: plan-orchestration lines 10, 38, 47, 100, 118, 165 (items 3, 9, 13, 6); land 88 and 233, spec 64 and 263, plan-orchestration 73 and 127 (items 6, 11); template lines 3, 34, 65 and 69 (items 8, 9, 11); the glossary entry **session, the** (item 6). Item 17's grep list adds `dispatch block`, `resume-point`, `own records`, `the session wrote`, `PAUSED` and `describes`.
- 1. Names, finding 5 (commits with no form: spec 222-223, land 133, the closing): all three named in "What is on the tree" and "What to build" 5, with the revert of land line 229, found by the session's own sentence-by-sentence grep.
- 3. Premises, finding 1 (the grep missed commit places): "What is on the tree" lists the places from `git grep -n -i -e '\bcommit\b' -e 'commits ' -e 'committed' -e 'amend' -- skills` read sentence by sentence; case D19 and Verify 2 use that grep.
- 3. Premises, finding 2 (`plan.projects.yaml` has no comment): `plan.projects.yaml` leaves the paths and item 1; the projects form is stated in `plan-orchestration` by item 14.
- 3. Premises, finding 3 (the projects form decided silently): raised as the stop "A user-visible choice" and closed under self-rule as C39, Rulings bullet "Open item Step 1, the projects form"; step 1's line carries its tag; items 4 and 14 and a case carry it.
- 4. Cases, finding 1 (no script vs `gen_figures.py`): the brief says no script's behaviour changes and `gen_figures.py` changes only its labels.
- 4. Cases, finding 2 (`check_config.test.sh` missing): added to Verify 1, with a case; item 1 keeps the comment's opening `# optional, default 1.`.
- 4. Cases, finding 3 (one rule in several places): items 1, 2, 5, 6, 8 and 14 state each rule once and have the other places name its section; Decisions 6 says where the pick and pair rules sit; "What is on the tree" quotes "Where a rule goes" and "Read" 10 names it.
- 5. The question, finding 1: answered by 3. Premises, finding 1.
- 5. The question, finding 2: answered by 1. Names, finding 1.
- 5. The question, finding 3 (the amend carrying another plan's record): item 5 gives the amend the form `git add -- <path>` and `git commit --amend --no-edit -- <path>`, and item 6 limits the landing's ledger files to its own plan's; case D20 has another plan's report stay uncommitted.
- 5. The question, finding 4 (the not-simple branch and the freed slot): item 7 says a waiting step is blocked and its slot goes to the next pick; a new case covers it.
- 6. Implied inputs 1 (renames): item 5 takes `git diff --cached --name-only --no-renames`; a case covers it; ADR 0012's sentence is kept in its words, so no clash.
- 6. Implied inputs 2 (a new file): the form is two parts, `git add -- <path> ...` for every new or changed path, then the commit; a case covers a new report at a stop.
- 6. Implied inputs 3 (filters in the compare): item 2 states the copy rule once in `/plan` Steps 4, each test command with the filter the page names, and the compare uses it; case D16 holds a list equal with its filters as not rewritten.
- 6. Implied inputs 4 (the parsed comment): item 1 and a case keep `# optional, default 1.`.
- 6. Implied inputs 5 (the projects form): C39, items 4 and 14.
- 6. Implied inputs 6 (no open plan): item 14 says what `/plan-orchestration` and `/ordo-help` do with no open plan; case D28 covers it.
- 6. Implied inputs 7 (a step that must run alone at the head): item 7 has it hold the loop until nothing else is in flight; case D22 covers it.
- 6. Implied inputs 8 (the shared choices file): item 6 says a commit that names the choices file records the whole file, every plan's changes to it included (ADR 0005).
- 7. ADRs, finding 1: answered by 1. Names, finding 5.
- 7. ADRs, finding 2: answered by 6. Implied inputs 1.
- 8. Dictated text, findings 1 to 5: Decisions 3 is rewritten. Each sentence keeps its words and gains one bullet per requirement, or names the place that states the form; line 378 reads "The ledger files of the step's plan that the session wrote".
- Declined to judge, the version of `repo-setup`: raised to major, 4.0.0, by `docs/dev/skill-layout.md` "Frontmatter", since its setup and its sync write the changed plan-terms block (Decisions 2).
- Dictated lines added after the check, held line by line against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md` and the prose standard:
  - "The commit names the same paths: `git commit -m <message> -- <path> ...`." (`grep -n -F 'The commit names the same paths'` over the brief, Decisions 3): holds; one requirement, plain, ASCII.
  - "Each file is staged with `git add -- <path> ...`." (`grep -n -F 'Each file is staged with'`): holds.
  - "The ledger files of the step's plan that the session wrote" (`grep -n -F "The ledger files of the step's plan"`): holds; the term "plan" as the glossary uses it.
