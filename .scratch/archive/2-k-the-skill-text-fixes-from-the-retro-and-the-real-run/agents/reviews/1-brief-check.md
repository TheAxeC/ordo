# Step 1 brief check (on main at d687f03)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. A page this report cites is named with its section where the agent gave one; a grep hit keeps its `file:line`.

## 1. Names

Each name the step changes was grepped over skills/, docs/, utils/, README.md and agents/. Hits outside "Paths this step writes" are listed, and so are hits inside the paths that no item names but that the change makes false.

- The character-set command: `grep -rn -F 'git ls-files -coz' skills docs utils README.md` printed only `docs/dev/change-standard.md:74` and `docs/dev/building.md:11`, both in the paths. `grep -rn -i 'untracked file git does not ignore\|every tracked file' ...` printed only `docs/dev/building.md:25`, which item 2 covers. No hit outside the paths.
- "No breakage testing" and "revert proof": `grep -rn -i 'breakage\|revert proof' skills docs utils README.md agents` (docs/roadmap.md left out) printed nothing. Related sentences in the paths, from `grep -n -F 'unchanged tree' ...`: `docs/dev/change-standard.md:42-43` and the template's `:41-42` (rule 13, bullets 1 and 2), `skills/spec/templates/brief.md:81-83` and `skills/refute/SKILL.md:129-130`. Bullet 1 of rule 13 says the test "is run there again after every change to the test". After the code has changed, a run on the unchanged tree needs the old code put back into a copy. Item 1 leaves the builder to decide whether such sentences are "a test run on code with its behaviour taken out". Hits outside the paths: `skills/diagnose/SKILL.md:178,214,257` ("red without it", "on the tree without the fix"). The new rule does not make these false, because they run on the real tree before the fix and nothing is broken on purpose.
- The `land.test.sh` case list (item 6): `grep -rn 'land.test.sh' ...` printed:
  - `docs/dev/building.md:6`, comment `# land.sh on a conflict, a ledger file left in the worktree, a failing check and a clean landing`. This file is in the paths, but no item names this line. The new case makes the list incomplete.
  - `skills/land/SKILL.md:191`, "proves `land.sh` on scratch repositories: a conflict ..., and a clean landing ...". In the paths, no item names it, and the new case makes it incomplete.
  - `README.md:168`, `skills/plan/templates/orchestrator-state.md:53` and `docs/dev/scripts.md:28`, all outside the paths. None lists the cases, so none is made false.
- "The no-git rule" and "never runs a git command": `grep -rn -i 'no-git\|never runs a git command\|runs no git\|no git command' ...` printed:
  - `skills/plan-orchestration/SKILL.md:87,93` (items 19).
  - `skills/spec/SKILL.md:251`, "the builder runs no git command that changes state". In the paths; it still holds.
  - The two change standards, `:59` and `:57`, which are unchanged.
- The reviewer's git (item 12): `grep -rn -F 'only git' ...` printed `skills/refute/SKILL.md:41` only. `grep -rn -i 'tree state\|delta of the round' skills` also printed `skills/refute/SKILL.md:92`, "Its diff is the delta of the round (from the commit or tree state recorded when the round was sent)". That file is in the paths, but no item names this line. The glossary entry **delta** (`docs/glossary.md:36`, `skills/repo-setup/templates/plan-terms.md:31`) is outside the paths. With item 12, the reviewer over a round may run only `git diff <base>`, `git status --short` and `git show <base>:<path>`, so it cannot compute that delta. Item 12 makes these two places contradict the rule.
- The usage line (item 17): `grep -rn -i 'usage line\|Reviewer usage\|Agent usage' ...` printed `refute/SKILL.md:75-76` and `refute/templates/report.md:42,63`, all in the paths. It also printed `spec/SKILL.md:428,432` and `spec/templates/brief-check.md:57`. The brief-check report's usage line is already filled by the session, so those hits are consistent with the change. The glossary **refuter report** entry (`docs/glossary.md:99`) is outside the paths and still holds.
- The ADR sentence: `grep -rn -F 'main holds at that moment'` printed only `docs/adr/0010-...md:20`, which is in the paths.
- The closing step and its mark (item 18): `grep -rn -i 'closing step\|orchestrator, no agent\|no agent)' ...` printed:
  - `skills/plan/SKILL.md:206`, "A step the orchestrator runs without an agent keeps the mark `orchestrator, no agent` on its line".
  - `skills/plan/templates/plan.md:19`, a non-closing step marked "(<n> commit; orchestrator, no agent)".

  Both are outside the paths. Item 18 calls the closing step "(marked "orchestrator, no agent")", but that mark also stands on non-closing steps. If item 18 is written as the brief words it, its no-`/spec`, no-slot rule reaches those steps too. The glossary **closing step** entry (`docs/glossary.md:28`, `plan-terms.md:23`) says "Stated in: `plan`, Steps 2", which item 18 makes incomplete. Neither file is in the paths.
- NOT DONE (item 20): `grep -rn -i 'NOT DONE' skills --include=SKILL.md` printed `plan-orchestration/SKILL.md:391` and `:462`; the second is the Anti-patterns row "Put anything NOT DONE first", in the paths. `skills/repo-setup/templates/shared-rules.md:6` reads "The first line says what is NOT done". Item 20 puts NOT DONE "after the landed steps and the choices", which contradicts both.
- Rule clash (item 3): the glossary **rule clash** entry (`docs/glossary.md:108`) has a "Stated in" list without `land`. Item 3 makes it incomplete, and the file is outside the paths.
- Hand-back (items 9 and 11): the glossary **hand-back** entry (`docs/glossary.md:52`) defines it as "a builder's stop before changing any code, returning its first run and a case the brief's rules get wrong". Items 9 and 11 use "handed back" for other returns. That is a new sense, and `plan-terms.md` is outside the paths.
- Ruling and commit rule (item 7): `grep -n -i 'commit rule\|Commit only when told' ...` printed `skills/repo-setup/templates/CLAUDE.md:10`, "**Commits.** <Commit only when told, each time. | Committing is allowed.>", and `skills/repo-setup/SKILL.md:174`, "5. The commit rule for this repository [commit only when told]". Item 7's "committed in the same turn" contradicts a repository whose commit rule is "commit only when told". `templates/CLAUDE.md` is outside the paths, and `repo-setup/SKILL.md` is in them for its version only.
- The roadmap draft (item 10): `skills/roadmap/SKILL.md` Steps 2 says "Nothing is written yet" and Steps 3 says "Show each change as a diff of the roadmap file". No step keeps the draft as a whole file, so the dictated `diff <file> <draft>` has no `<draft>` to read. The file is in the paths, but no item covers this.
- Saved reports and the character set: `skills/spec/SKILL.md:428` (the brief-check report saved by the session) carries no character-set rule. The step does not make this false, and it is outside the goal.

Findings:
1. `docs/dev/building.md:6` and `skills/land/SKILL.md:191` list the four `land.test.sh` cases, and item 6 makes both incomplete. No item names them.
2. `skills/refute/SKILL.md:92` ("Over a repair round" 3) and the glossary **delta** entry read the round's delta "from the commit or tree state recorded when the round was sent". Item 12's rule leaves the reviewer no git command that computes it.
3. The mark "orchestrator, no agent" is not unique to the closing step (`plan/SKILL.md:206`, `plan/templates/plan.md:19`). Item 18 should name the closing step by its place, the last step, and not by that mark.
4. The glossary entries **closing step**, **rule clash**, **hand-back** and possibly **ruling** become incomplete or are used in a new sense. Neither `skills/repo-setup/templates/plan-terms.md` nor `docs/glossary.md` is in the paths, although the step line asks for "`docs/glossary.md` synced where a plan term changes".
5. Item 7 contradicts the commit rule "commit only when told" (`repo-setup/templates/CLAUDE.md:10`, `repo-setup/SKILL.md:174`).
6. Item 20 contradicts `shared-rules.md:6` and `plan-orchestration` Anti-patterns "Put anything NOT DONE first".
7. Item 10's `diff <file> <draft>` has no draft file in `roadmap` Steps 2 to 4.
8. Item 1 does not say which sentences of rule 13 (both change standards), `spec/templates/brief.md` "Verify before you report" 4 and `refute` "The four headings", Proof, it changes. The builder is left to rewrite rule text by its own judgment. Change standard rule 17 reserves a change of meaning, and rule 4 the rewrite of a rule, to the orchestrator.

## 2. The step line

- No breakage testing: item 1.
- The character-set check reads only files on disk: item 2.
- `land` never settles a clash of two rulings: item 3.
- Carries out a ruling only on what it names: item 4.
- Compares the verify list with the page as the cherry-pick brings it: item 5.
- ADR 0010's Consequences sentence edited as D13 says: item 5.
- A `land.test.sh` case for it: item 6.
- A ruling given outside a plan is written down: item 7.
- A proposal says what exists now: item 8.
- The builder's prompt says a shortcut is a finding: item 9.
- `roadmap` compares the written file with the draft: item 10.
- A dictated sentence about a script is run first: item 11.
- `refute`'s reviewer git commands: item 12.
- A git verify command reaches a builder as D11 says: item 13.
- Builders' and reviewers' saved reports pass the character-set check: items 14 and 16.
- A repair round's brief reaches the builder in its worktree: item 15.
- The session writes the reviewer's usage line: item 17.
- A closing step as D17 says: item 18.
- The builder's git rule reads the same in both places: item 19.
- "Reports" names the report that holds NOT DONE: item 20.
- Every file of each changed skill checked against the change: the preamble of "What to build". The paths leave out `spec/templates/brief-check.md`, `roadmap/templates/roadmap.md`, `repo-setup/templates/CLAUDE.md`, `repo-setup/templates/plan-terms.md` and `plan-orchestration/templates/*`. "Read, with sections" names `roadmap` Steps only and not the other files of these skills.
- Each changed skill's version raised: the preamble, and C6.
- `docs/glossary.md` synced where a plan term changes: no requirement. No item asks for it, and neither `plan-terms.md` nor `docs/glossary.md` is in the paths. "Report" also leaves out the template's clause "each changed entry's 'Stated in' checked by `grep -n`".
- The check: grep of each fix's sentence is C1 to C3; the read in place is the reviewer's; `land.test.sh` is C4; the deleted-file run is C7; versions are C6; `sync_rules.py --only glossary` is Verify 1; `checks.sh` runs at landing.

Findings: the part "`docs/glossary.md` synced where a plan term changes" has no requirement and no path. Check 1, finding 4, names the entries that need it.

## 3. Premises

- Line 11: `grep -n 'git ls-files -coz' docs/dev/building.md docs/dev/change-standard.md` printed `docs/dev/change-standard.md:74:git ls-files -coz ...` and `docs/dev/building.md:11:git ls-files -coz ...`. The same grep on the template printed nothing (exit 1). `building.md:25` begins "The last command is the ASCII check over every tracked file and every untracked file git does not ignore". Matches. Run in a scratch repository with `z.md` committed and then deleted, the current command printed `Can't open z.md: No such file or directory at -e line 1.` and exited 0. The brief does not claim an exit status here, but check 5 depends on this exit 0.
- Line 12: `grep -n -i 'breakage\|revert proof'` over the three files printed nothing (exit 1). Matches.
- Line 13: `cat -n skills/repo-setup/templates/shared-rules.md` shows the bullets on lines 5 to 24, "Reports state the end state." on 6, "Every question is answered in full..." on 7 and "A failing check is a finding." on 14. Matches.
- Line 14: the git rule is at `docs/dev/change-standard.md:59` and at template `:57`; `plan-orchestration/SKILL.md:87` reads "- The no-git rule." and `:93` reads "**The builder.** It never runs a git command.". Matches.
- Line 15: `land/SKILL.md` Steps 2 is lines 51 to 56; "What it reads" 8 is line 43; the bullets are at 73 and 75; no clash or ruling-reach sentence. Matches.
- Line 16: `land.test.sh` has four cases, its head comment is lines 2 to 9, and `printf 'PASS: land.sh scratch tests\n'` is line 156. Matches. `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`.
- Line 17: "The prompt" is lines 85 to 92 with seven items; Steps 6 is lines 106 to 123 with no character-set rule; "Dictated text" is line 136; "Before the resume" is lines 137 to 139 and commits the round's brief on main with no copy to the worktree; Steps 2 and 3 say nothing on a closing step; "Reports" last bullet is line 391. Matches.
- Line 18: `refute/SKILL.md:41` matches as quoted, as do Steps 6 at line 75, Steps 7 from line 77 and Rules from line 195 (no git rule, no character-set rule). `report.md:42,63` hold the usage lines. Matches.
- Line 19: `spec/SKILL.md:174` and `spec/templates/brief.md:76` match; the template's "Report" section (line 91 on) has no character-set rule. Matches.
- Line 20: `roadmap/SKILL.md:88` matches; there is no compare with the draft.
- Line 21: `grep -m1 'version:'` printed land 3.0.0, plan-orchestration 5.0.0, refute 3.0.1, spec 5.0.0, roadmap 1.3.1 and repo-setup 4.0.0. Matches skill-layout "Frontmatter".
- Line 22: the state file's `verify:` list, parsed with PyYAML and compared with `docs/dev/change-standard.md` lines 69 to 74, printed `True 6 6`. `git diff` of the state file shows only the dispatch entry added. Matches.
- Line 23: ADR 0010's status, Decision and Consequences sentences, and the README refinement sentence, match. "No other ADR touches the step" does not hold (check 7).

Findings: one premise does not hold. Line 23, "No other ADR touches the step", is false; see check 7.

## 4. Cases and checks

- C1, C2, C3: consistent. Run on main, each `grep -n -F` printed nothing (exit 1), as the cases expect for the unchanged tree.
- C4: consistent with rule 13, bullet 2 (a test of preserved behaviour). The case adds nothing over the existing clean-landing case (`test -f change.txt` already proves the check runs on main after the cherry-pick). The scratch "verification page" in its fixture is read by nothing, since `land.sh` reads only `ledger_root` and `worktree_root` (`land.sh` lines 125 to 187). That is close to rule 11, "no ... file whose only user is a test".
- C5, C6: consistent.
- C7 is inconsistent with the brief's own case rule "Every other case of a code step is checked by a run the report quotes" and with rule 13, bullet 3: "A case asserting that a rule stays silent carries a control, the near-miss the same rule must report". C7 is checked "by reading", but a run needs no git: run the D11 form in a `$TMPDIR` folder, `printf '%s\0' a.md z.md | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl ...`, with `z.md` absent. C7 has no control: a file holding a tab beside the deleted file, which must still print and exit 1.

No case asks the builder to check, quote or explain a place the step does not change.

Findings: C7 (reading in place of a run, and no control).

## 5. The question

The goal is the step's whole part of plan.md's Goal.

- C1: could pass without the goal? Yes, for items 7, 10 and 12. The sentences can stand while the commit-rule clash, the missing draft file and the round-delta contradiction remain. The grep shows presence only; placement and fit rest on the reviewer's read.
- C2: yes. It proves the text is there, not that the check passes on a deleted file.
- C3: no. The sentence is the whole change.
- C4: yes. The case passes on the unchanged tree by design, and it hands `land.sh` a verify list that already holds the command. It cannot fail whatever `land` Steps 2 says, so it cannot show that "a step that adds a command to the verification page runs that command at its own landing".
- C5, item 5: yes, and the goal is not reached even when item 5 is written as dictated. Steps 2 runs before `land.sh`, whose Steps 3 makes the wip commit. Builders make no commit (change standard "Where the work happens"; `spec/SKILL.md:251`: "Nothing is committed in the worktree: `/land`'s wip `git add -A` stages the files the builder finishes"). So at Steps 2 the range `<base>..<slug>-<step>` holds none of the builder's work, and the item's "read from the step's branch when the range ... changes the page" always falls to "from main otherwise". That is the 2.I finding 6 again. A reviewer reading item 5 against D13 would pass it. The mechanism has to read the page as the step's worktree holds it, which is what Steps 3 commits, for example when `git diff --quiet <base> -- <page>` run from inside the worktree exits 1. D13 is the user's ruling. Whether "the step's branch" may be read that way, or the point needs a ruling, is the orchestrator's call.
- C5, items 13 to 20: no for 13 to 17 and 19 (a read in place against the ruling settles each). Yes for 18: written with the mark, it passes while reaching non-closing orchestrator steps. Yes for 20: it passes while contradicting "Reports state the end state" and the anti-pattern.
- C6: no.
- C7, and the step line's check "the character-set check ... run from the root of a worktree in which a tracked file was deleted, exits 0": yes. The current command already exits 0 there; my scratch run printed `Can't open z.md: No such file or directory at -e line 1.` and exit 0. The check needs "prints nothing and exits 0". The new command printed nothing and exited 0 in the same state, and with a tab in a tracked `t.txt` it printed `t.txt:1: bad<tab>` and exited 1.
- The other parts of the step-line check: `sync_rules.py --only glossary` exits 0 trivially when no plan term changes, so it passes without the glossary part of the goal. `checks.sh` runs the old verify list at this landing, as the brief's item 2 says.
- Item 1: yes. The rule sentence can stand while rule 13's bullets 1 and 2 (both standards), `spec/templates/brief.md` Verify 4 and `refute` Proof still ask for runs on the unchanged tree after the change.
- Items 3, 4, 8, 9, 11: no. The read settles each.

Findings: C4, item 5 with D13's mechanism, C7 and the step-line deleted-file check, C1 for items 7, 10 and 12, items 1, 18 and 20, and the `sync_rules.py` check against the glossary part.

## 6. Implied inputs

For the new `land.test.sh` case:
- The step's change left uncommitted in the worktree. This has happened in every builder run, since builders do not commit. The case uses "a committed change". Expected: `land.sh`'s wip commit carries the script and the page, `checks.sh` on main prints `$ <command>` and the script's `PASS:` line, and the exit is 0. Missing.
- A verify list that lacks the step's new command. This happened in the 2.I run (2-report finding 6). Expected: `land.sh` runs only the list it is given. This belongs to `land` Steps 2's text, not to `land.sh`, so no case is owed. Noted so the case is not read as covering it.

For the character-set command:
- A tracked file deleted and not staged, listed last. This happened in the brief's Decision 1 scratch run and in the 2.C run with seven deleted files. Expected: no output and exit 0 under `bash -o pipefail`. C7 asks only for exit 0 and does not place the file last. Missing as stated.
- The control: the same state with a tracked file holding a tab. Expected: the line printed and exit 1. Missing.
- A path list from the D11 `printf` form that names a file the step deletes. Steps that delete files have happened. Expected: skipped, exit 0. Missing, though it can be run without git.
- File names with spaces or a leading dash, symlinks, submodules: `git ls-files -co --exclude-standard | grep -c ' '` printed 0, the leading-dash count printed 0, and mode 120000 and 160000 entries counted 0 each. None has happened, so none is owed.

Findings: the uncommitted-change input of the `land.test.sh` case; the deleted-file-last input with "prints nothing"; the control; the D11 form with a deleted path.

## 7. ADRs

- 0010 touches items 5 and 6, under "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". Named by the brief. No contradiction; the Consequences edit is a refinement, as `docs/adr/README.md` says.
- 0011 touches item 18, under "The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit". A closing step with no dispatch entry takes no slot, which is consistent. Not named by the brief.
- 0012 touches item 18 ("makes its commits outside any landing") and item 15 (the round's commit), under "Every commit a skill makes on main names its paths in the commit command" and "A landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill". Consistent. Not named.
- 0006 touches item 17, under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: ... each reviewer in `reviewer_report`". Consistent. Not named.
- 0004 touches item 3, under "A later ruling of the user replaces it without a rule clash". Item 3's "two of the user's rulings" keeps that. Not named.
- 0001, 0002, 0003 (about the writing skills and `/writing`), 0005, 0007 (the model only), 0008 and 0009: none governs a file, name, rule or behaviour the step changes.

Findings: no part of the brief contradicts an ADR. The brief's "No other ADR touches the step" leaves out 0011, 0012, 0006 and 0004.

## 8. Dictated text

Item 3's and item 4's lines and items 7 to 11 are fixed by approved proposals in `.scratch/retros/sessions-2026-10-12.md`, "Approved proposals". Item 1 is fixed by an approved proposal too. Item 2's command is the approved computation, written in the `if` form of Decision 1. Item 12 is the approved proposal widened by D10 (self-rule), item 5's ADR sentence comes from D13 (the user), and item 13's fragment from D11 (self-rule).

- `grep -n -F '**No breakage testing.** Code is never deliberately broken'` gives line 31: holds. The prohibition names the behaviour to do instead, "A test is judged by reading it".
- `grep -n -F "xargs -0 sh -c 'for f; do if [ -e"` gives line 37: holds. I checked that its perl part is byte-identical to `change-standard.md:74`'s (`cmp` printed "perl part identical"). Run in a scratch repository, it printed nothing and exited 0 with the last listed file deleted. Decision 1's claim reproduced: the `&&` form printed `a.md` and exited 1, and the `if` form printed `a.md` and exited 0.
- `grep -n -F 'is never fixed at landing; it is the stop "A rule clash"'` gives line 43: holds. The stop "A rule clash" exists in `plan-orchestration` "Stops".
- `grep -n -F 'A ruling is carried out on what it names'` gives line 46: holds. The semicolon joins a rule and its qualifier, which skill-layout "Lists and tables" keeps in one bullet.
- `grep -n -F '**A ruling is written down when it is given.**'` gives line 51. It breaks change standard rule 19 (no two contradicting statements): "committed in the same turn" against the commit rule "commit only when told" (`repo-setup/templates/CLAUDE.md` "Project rules", `repo-setup` "The questions" 5). Its use of "ruling" for a decision given outside a plan's ledger is wider than the glossary entry **ruling** ("the user's decision on an open item, typed as `Ruled:`"), against skill-layout "Writing for an agent" on terms. Its 42 words exceed prose standard E's "under roughly 20". The words are fixed by an approved proposal, so this is a finding the brief cannot close by rewording.
- `grep -n -F '**A proposal says what exists now.**'` gives line 54: holds.
- `grep -n -F 'That a shortcut is a finding'` gives line 57. It uses "handed back" in a sense wider than the glossary **hand-back** (skill-layout "Writing for an agent"). Its 38 words exceed prose standard E. Fixed by an approved proposal.
- `grep -n -F 'The file is then compared with the approved draft'` gives line 60: holds against the standards. The `<draft>` it diffs against does not exist in `roadmap` Steps 2 to 4 (check 1). Fixed by an approved proposal; the gap is closed by an added requirement that the draft be kept as a whole file, not by changing these words.
- `grep -n -F 'That a sentence the brief or a round gives word for word'` gives line 65. It has the same **hand-back** sense issue and 39 words. Fixed by an approved proposal.
- `grep -n -F 'A dictated sentence that says how a script behaves is run on the script'` gives line 69. The brief gives it without a bullet marker. Appended as a second sentence to the bold-label bullet "**Dictated text.**", it would break skill-layout "Lists and tables", "One rule per bullet", because holding the text and running the script can each be broken alone. Written as a sub-bullet, it holds. Fixed by an approved proposal; the form is the brief's to state.
- `grep -n -F 'The reviewer runs no git command other than'` gives line 72. It contradicts `refute` "Steps / Over a repair round" 3 and the glossary **delta** (check 1), against change standard rule 19. At 50 words it exceeds prose standard E. The words are the approved proposal as widened by D10 (self-rule).
- `grep -n -F 'A landing is held to the checks main holds once the step is on it.'` gives line 47: holds.
- `grep -n -F '<the files the step changes> |'` gives line 75 (the `printf '%s\0' ... |` fragment): holds.
- `grep -n -F '<em dash>'` gives line 76 (`<tab>` or `<em dash>`): holds.

Findings:
- Line 51 contradicts the commit rule, and the term "ruling" needs a glossary sense. Its words are fixed by an approved proposal, so this is the stop "A brief check finding the brief cannot absorb", unless the orchestrator reads it as not breaking a rule.
- Lines 57 and 65 use "hand-back" in a new sense; glossary entry needed, outside the paths.
- Line 69 needs to be a sub-bullet.
- Line 72 contradicts "Over a repair round" 3 and the **delta** entry.
- Lines 51, 57, 65 and 72 are longer than prose standard E's "roughly 20 words". These are departures fixed by approvals, which the builder names under Verify 5.

## Declined to judge

- Whether rule 13's "run there again after every change to the test", and the "passes on the unchanged tree" sentences in both change standards, the brief template and `refute`, are revert proofs under the new rule. It is a reading of the user's rule, kind 3 of `plan-orchestration` `references/self-rule.md`, so it is the user's call or the orchestrator's ruling, not mine. The brief has to state it so the builder does not decide it.
- Whether D13's "the step's branch" may be read to include the worktree's uncommitted changes that `land` Steps 3 commits, or whether item 5's mechanism needs a new ruling. D13 ends "(the user)".
- Which part of each changed skill's version should be raised (major or minor). The brief leaves it to the builder and C6.
- I ran neither the plan's whole verify list nor `sync_rules.test.sh`. Only `land.test.sh` was run, and it printed `PASS: land.sh scratch tests`.

Agent usage: a0f13c4670d9a0bcb, claude-opus-5-5, 296448 tokens, 71 tool uses, 764.8 s.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

The step stopped on findings 1.5, 1.6 and 1.8, which are the user's (the open item "Step 1, three clashes in the written rules"). At the stop the brief is removed, as `spec` "Steps / The brief check" 4 says, and the next `/spec 2.K 1` writes it again with each change below and the user's ruling, without a second brief check.

- 1.1 (`docs/dev/building.md:6` and `skills/land/SKILL.md:191` list four `land.test.sh` cases): item 6 names both places, and each gains the new case.
- 1.2 (`refute` "Over a repair round" 3 and the term **delta** against item 12's git rule): `plan-orchestration` Steps 8 "Before the resume" has the session save the worktree's `git diff <base>`, run from inside it, to `agents/reviews/<step>-round-<n>-sent.diff` before the resume; `refute` "Over a repair round" 3 and the term **delta** read the round's delta as the difference between that file and the reviewer's own `git diff <base>`. `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` join the paths.
- 1.3 (the mark "orchestrator, no agent" is not the closing step's alone): item 18 names the closing step as the plan's last step, the closing that `/plan` writes.
- 1.4 (glossary terms): the brief asks that **closing step** and **rule clash** gain `plan-orchestration` and `land` in "Stated in", and that **hand-back** covers a builder's return, before its report, of work it did not do with the reason, as items 9 and 11 use it; `plan-terms.md` and `docs/glossary.md` are in the paths, and the report checks each changed entry's "Stated in" by `grep -n`.
- 1.5 (item 7 against the commit rule "commit only when told", and the term **ruling**): a stop, the open item's question 2.
- 1.6 (item 20 against the shared rule "Reports state the end state" and the anti-pattern "Put anything NOT DONE first"): a stop, the open item's question 3.
- 1.7 (item 10's `<draft>` has no file): item 10 adds that `roadmap` Steps 2 writes the drafted roadmap file whole to the session's scratch folder, Steps 3 shows its diff against the file, and Steps 4 writes it and compares.
- 1.8 (item 1 against rule 13's runs on the unchanged tree after the change): a stop, the open item's question 1.
- 2 (the glossary part of the step line had no requirement): closed by 1.4.
- 3 ("No other ADR touches the step" is false): the brief names ADRs 0011, 0012, 0006 and 0004 with their sentences, as check 7 gives them.
- 4 and 6 (C7 checked by reading, with no control; implied inputs): C7 becomes a run without git in a `$TMPDIR` folder of the D11 `printf` form, `z.md` absent and listed last: prints nothing and exits 0; its control, a `t.txt` holding a tab beside it: prints the line and exits 1. The orchestrator still runs the gate's worktree run at landing.
- 5, C4, and 6 (the `land.test.sh` case passes whatever `land` Steps 2 says; the step's change uncommitted): the case lands a step whose change is left uncommitted in the worktree, as builders leave it, the page and the test script among it, and `land.sh` exits 0 with the `$ <command>` line and the script's PASS line. The case checks the landing script's half of item 5; the text half is read by the reviewer.
- 5, item 5 (the range holds none of the builder's work at Steps 2): item 5 reads the page as the cherry-pick will bring it: from the step's worktree when its page differs from the base's (`git diff --quiet <base> -- <page>` run from inside the worktree exits 1), from main otherwise, and as the merge of the two when both changed it. This is the user's ruling D13, "the page as the cherry-pick brings it", applied to a worktree whose work `land.sh`'s Steps 3 commits.
- 5, C1 for items 7, 10 and 12: closed by 1.5, 1.7 and 1.2.
- 5, the step line's deleted-file check: C7 and the orchestrator's run ask for "prints nothing and exits 0".
- 8, line 69 (item 11's second sentence): written as a sub-bullet of "**Dictated text.**".
- 8, the dictated lines longer than prose standard E: their words are fixed by approved proposals; the builder names each under Verify 5.
- 8, lines 57 and 65 ("handed back"): closed by 1.4.
- The ruling "Step 1, three clashes in the written rules" (the user): question 1 is item 1's second paragraph, question 2 is item 7, question 3 is item 20; findings 1.5, 1.6 and 1.8 are closed by it.
- The dictated line added after the check, item 7, "- **A decision is written down when it is given.** A decision the user gives outside a plan's ledger is written into a file in the repository in the same turn, and committed in that turn where the repository's commit rule allows it, so a compaction or a new session finds it.": holds against the rules file and the standards pages; it uses "decision", which the glossary does not reserve, and its length past prose standard E's guide is fixed by the user's ruling, named under the brief's Verify 5.
