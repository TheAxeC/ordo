# Step 1 refuter report (on .agents/worktrees/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run-1, base 64c500d)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
(exit 0)
$ printf '%s\0' <the 18 paths of "Paths this step writes", the report included> | xargs -0 perl -CSD -ne '<the check of the brief>'; echo "exit $?"
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
965 skills/diagnose/SKILL.md
877 skills/grill/SKILL.md
725 skills/land/SKILL.md
564 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
1018 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
989 skills/refute/SKILL.md
783 skills/repo-setup/SKILL.md
1022 skills/roadmap/SKILL.md
831 skills/session-retro/SKILL.md
1003 skills/spec/SKILL.md
C1, grep -n -F of each dictated sentence after, and grep -c -F on `git show 64c500d:<file>`:
item 1: docs/dev/change-standard.md 55:22. **No breakage testing.** ... (base 0); skills/repo-setup/templates/docs/dev/change-standard.md 53:21. ... (base 0); skills/repo-setup/templates/shared-rules.md 17:- **No breakage testing.** ... (base 0)
item 3: skills/land/SKILL.md 82 (base 0); item 4: skills/land/SKILL.md 83 (base 0)
item 7: shared-rules.md 9 (base 0); item 8: shared-rules.md 7 (base 0)
item 9: plan-orchestration/SKILL.md 97 (base 0); item 11a: 98 (base 0); item 11b: 149 (base 0)
item 10: roadmap/SKILL.md 90 (base 0); item 12: refute/SKILL.md 208 (base 0)
C2: docs/dev/building.md 11:git ls-files -coz --exclude-standard | xargs -0 sh -c 'fo... (base 0); docs/dev/change-standard.md 75:git ls-files -coz ... (base 0)
    whole line 11 of building.md and line 75 of change-standard.md: cmp with item 2's command in the brief printed nothing (equal)
C3: 20:A landing is held to the checks main holds once the step is on it. Each prepa...; grep -c -F 'at that moment' printed 0; on the base the first grep counts 0
C4: base land.test.sh with base land.sh and checks.sh: PASS: land.sh scratch tests
    changed land.test.sh with base land.sh and checks.sh: PASS: land.sh scratch tests
    cmp of base land.sh and checks.sh with the tree's: equal
C6: land 3.0.0 -> 3.1.0, plan-orchestration 5.0.0 -> 6.0.0, refute 3.0.1 -> 3.1.0, spec 5.0.0 -> 5.1.0, roadmap 1.3.1 -> 1.4.0, repo-setup 4.0.0 -> 4.1.0
C7 (no git, $TMPDIR folder holding a.md, run through bash -o pipefail -c):
    new form, a.md z.md: (nothing), exit 0
    new form control, t.txt (a tab) z.md: t.txt:1: a<tab>b, exit 1
    old form, a.md z.md: Can't open z.md: No such file or directory at -e line 1., exit 0
    the proposal's && form, a.md z.md: (nothing), exit 1
C8: ok: the plan-terms block equals the template, exit 0
Report evidence rerun:
$ grep -rn "no-git rule\|never runs a git command" skills docs README.md   -> (nothing), exit 1
$ grep -rln "git ls-files -coz" skills utils docs README.md   -> docs/dev/change-standard.md, docs/dev/building.md
$ git diff --quiet 64c500d -- docs/dev/building.md   -> exit 1 (page changed in the worktree)
$ git diff --quiet 64c500d -- docs/roadmap.md   -> exit 0
$ wc -l <the 17 files of the report's list>   -> 20, 29, 87, 151, 266, 182, 500, 212, 69, 245, 73, 134, 27, 219, 496, 107, 183 (equal to the report)
$ cmp <main ledger 1-report.md> <worktree ledger 1-report.md>   -> equal
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. C1 prints one line per file named; rule 13 bullets 1 and 2 of both change standards, `skills/spec/templates/brief.md` "Verify before you report" 4 and `skills/refute/SKILL.md` Proof say one run on the unchanged tree before the code changes, an edit after it read; `grep -rn -i "unchanged tree\|revert\|old code\|form it has after"` over skills, docs/dev, the glossary and README finds no sentence asking for a run on the old code after the code changed; "names no revert" stays.
- 2: holds. C2 and the cmp of the whole line; `docs/dev/building.md` "The last command" paragraph says "that exists on disk, so a file deleted in a worktree and not yet staged is left out".
- 3: holds. C1, `skills/land/SKILL.md:82`, placed after the small-text-step bullet. See Standards 2.
- 4: holds. C1, `skills/land/SKILL.md:83`. See Standards 2.
- 5: holds. `land` "What it reads" 8 sub-bullet and Steps 2 sub-bullets read the page from the worktree when `git diff --quiet <base> -- <page>` exits 1 (rerun: 1 on a changed page, 0 on an unchanged one), from main otherwise, merged when both changed it; no script in the diff; ADR 0010 sentence per C3.
- 6: holds. The new case at `skills/land/templates/land.test.sh:158-180`, head comment, `docs/dev/building.md` line 6 and `land` "The landing script" name it; both runs reproduced (C4). See Proof 2.
- 7: holds. C1, `shared-rules.md:9`, after "Every question is answered in full".
- 8: holds. C1, `shared-rules.md:7`, after "Reports state the end state."
- 9: holds. C1, `plan-orchestration/SKILL.md:97`.
- 10: holds. C1, `roadmap/SKILL.md:90`; Steps 2 writes the draft whole to the scratch folder, Steps 3 shows the diff against it, each "The step is done when" bullet last.
- 11: holds. C1, `plan-orchestration/SKILL.md:98` and `:149` (sub-bullet of "Dictated text").
- 12: holds as the brief words it. C1, `refute/SKILL.md:208`; "What it reads" 5 names the three commands; `plan-orchestration` Steps 8 saves `agents/reviews/<step>-round-<n>-sent.diff` and the round's commit carries it; `refute` "Over a repair round" 2 and 3 and the term **delta** read it. See Behaviour 1 and 2 on the mechanism the brief chose.
- 13: holds. `skills/spec/SKILL.md:175` and `skills/spec/templates/brief.md:77`.
- 14: holds. `skills/spec/templates/brief.md` "Report"; `plan-orchestration` Steps 6 bullets on the character-set check of the saved report.
- 15: holds. `plan-orchestration` Steps 8 "Before the resume" and Steps 6 (cases ruling), each with the message naming the path.
- 16: holds. `refute` Rules bullet, `templates/report.md` head paragraph, Steps 7 check of the saved report.
- 17: holds. `refute` Steps 6 leaves the line to the session and its "Done when" no longer names it; Steps 7 and "Over a repair round" 6 fill it; both template usage lines say the session fills them.
- 18: holds. `plan-orchestration` Steps 2, the closing-step bullet and its five sub-bullets.
- 19: holds as the brief words it. `plan-orchestration/SKILL.md:93` and `:101`. See Spec 1 on the difference left between them and the rules file.
- 20: holds. `plan-orchestration` "Reports": opening NOT DONE line, then position lines, landed steps, choices; landing report keeps `land` Steps 11 order; last bullet is the closing ledger. See Standards 3.
- 21: holds. **closing step**, **rule clash**, **hand-back**, **delta** changed in `plan-terms.md` and the glossary block; C8 exit 0; **position line** reworded for item 20 (rule 14).

Cases of the brief's "Cases":

- C1: met, the greps above, each 0 on the base.
- C2: met, one line in each file, 0 on the base, and the whole line equal to the brief's.
- C3: met.
- C4: met, PASS after the change, and the changed test PASS against the base `land.sh` and `checks.sh`, which the step leaves byte-equal.
- C5: met, items 5 and 13 to 21 read in place against D9 to D19 and the ruling "Step 1, three clashes in the written rules"; on the base the text is absent (`git show 64c500d:` greps of the no-git rule lines 87 and 93, the "only git" line 41, and the base text of each section read).
- C6: partial, each skill raised one part once with the parts after it 0, but the part chosen for land, spec and repo-setup does not follow `docs/dev/skill-layout.md` "Frontmatter", Standards 1.
- C7: met, the runs above.
- C8: met.

## 1. Spec

- `skills/plan-orchestration/SKILL.md:93` and `:101`: "That the builder runs no git command that changes state (`git add`, ...) and reads only with `git status`, `git diff` and `git show`." and "**The builder.** It runs no git command that changes state (...), reads with `git status`, `git diff` and `git show`, and moves a file with `mv`."; what is wrong: the goal asks that the builder's git rule read the same in `plan-orchestration` and in `skills/repo-setup/templates/docs/dev/change-standard.md`. The prompt bullet says "reads only with"; the "The builder" bullet and both change standards ("Reading with `git status`, `git diff` and `git show` is fine") do not say "only". Brief item 19 asks for "reads only with" in both places and also for "The builder" to state the rule as the template gives it, and the two halves differ; failure scenario: a builder that runs `git log` or `git ls-files` (as builder a7ac8220a5207dd70 did in run finding 7 of `4-report.md`) breaks the prompt and keeps the rules file it reads first, which is the two-way reading the finding reported; verdict: none (item 19 holds as worded; the choice between "only" and "is fine" is the orchestrator's, and the rules file changes with it if "only" is kept).

## 2. Proof

- `.scratch/.../plan.md` "Gate" and step 1's check: "the character-set check of `docs/dev/building.md`, run from the root of a worktree in which a tracked file was deleted, exits 0"; what is wrong: the old form of the check also exits 0 with a missing file. Rerun: the old form over `a.md z.md` printed `Can't open z.md: No such file or directory at -e line 1.` and exited 0. The builder's report says the same under "Anything in the brief that was wrong or impossible", without naming the gate. The landing's gate check rests on this; failure scenario: the orchestrator at landing runs the deleted-file check, sees exit 0 and ticks that part of the gate, a result the unchanged command also gives; only an empty output (stdout and stderr) tells the two apart; verdict: none for the items; it bears on the gate run at landing.
- `skills/land/templates/land.test.sh:162-174` and `skills/land/SKILL.md` "The landing script": "a step that adds a command to the verification page lands with that command in the verify list, which `checks.sh` runs on main after the cherry-pick"; what is wrong: the fixture's `verification: docs/verification.md` and the page are read by nothing (`land.sh` reads only `ledger_root` and `worktree_root`, brief premise and the report's judgment call), and the verify list is set by the fixture. The case proves that `land.sh` brings an uncommitted new script to main and runs it there, and with the page and the key taken out of the fixture it still passes. The compare of `land` Steps 2 is skill text, which the brief leaves to the reviewer's read; failure scenario: a maintainer reads "lands with that command in the verify list" and the building.md comment, takes the Steps 2 compare as covered by the test, and an edit that makes Steps 2 read main's page again leaves `land.test.sh` green; verdict: none (item 6 is built as the brief says; the sentence in "The landing script" and the comment overstate what the case shows).

## 3. Standards

- `skills/land/SKILL.md`, `skills/spec/SKILL.md`, `skills/repo-setup/SKILL.md` frontmatter: `version: "3.1.0"`, `"5.1.0"`, `"4.1.0"`; what is wrong: `docs/dev/skill-layout.md` "Frontmatter" gives the major part when, under the same inputs, "a run that worked before is refused, or its output is changed or removed". land: a landing of a step whose worktree changes the verification page now rewrites the verify list from the worktree's page and runs and books other checks than before, and a landing that fixed a clash between two rulings now stops at that finding. spec: the brief's "Verify before you report" 4 is rewritten, so the brief it writes asks for different runs. repo-setup: the change standard it writes has rule 13's two bullets rewritten, and setup and sync write changed plan-terms entries; repo-setup 4.0.0 was itself raised to major for a plan-terms change (`.scratch/archive/2-i-several-plans-in-one-session/agents/reviews/1-brief-check.md` line 214). The report applies "its output is changed" to raise plan-orchestration to major and not to these three. refute is uncertain: the reviewer no longer writes its usage line, and a run over a round sent before this version has no saved diff to read (see Declined to judge); failure scenario: a user who pins by major version takes land 3.1.0 as compatible and gets landings that rewrite the verify list differently and stop where they landed before; verdict: C6 partial.
- `skills/land/SKILL.md:82-83` (Steps 6) against land "Stops": "it is the stop "A rule clash" of `plan-orchestration`" and "another place its reason reaches is raised as an open item before it is changed"; what is wrong: land's Stops table has no row for either stop (its rows are a red line for the user, a lock held, a required key missing, no ledger folder, no dispatch block, no verify runner, the step not ready, main not clean, agents still running, a worktree that cannot be removed), and Steps 6 runs after the cherry-pick is staged on main (Steps 4), with no sentence on whether the landing then commits with the finding as an open item or is held (`docs/dev/skill-layout.md` "Sections, in order" row 7, and "Lists and tables": a step that can stop comes before what it guards, or says what the stop leaves); failure scenario: at landing a refuter finding is a clash between two of the user's rulings; the session stops as Steps 6 says, with the step staged on main and no row telling it what to show or what resumes it, while ADR 0012 requires the landing to run from its cherry-pick to its commit before any other commit; verdict: none (items 3 and 4 hold as dictated; the row and the staged state are what is missing).
- `skills/plan-orchestration/SKILL.md:408`: "The orchestrator's report ends with a DONE / NOT DONE ledger, one row per step ... naming the landing report or the open item that proves it."; what is wrong: **ledger** is defined in `docs/glossary.md` as a plan's folder, and `docs/dev/skill-layout.md` "Writing for an agent" allows a defined term only in a defined sense; the user's ruling says "table", as rule 7 of the change standard does. The row names a landing report where the shared rule "Reports state the end state" says each row names the command that proves it; failure scenario: an orchestrator reads "ledger" as the plan folder, or writes rows that name a report and no command, and the report then differs from the shared rule it is held to; verdict: none (brief item 20 gives "ledger" and the proof form).
- `skills/refute/SKILL.md` "Over a repair round" 6: "It fills the run's usage line from the completion notice and checks the appended text with the character-set check, as Steps 7 says."; what is wrong: two requirements that can each be broken while the other holds in one bullet (`docs/dev/skill-layout.md` "Lists and tables", first bullet); failure scenario: a reviewer of a later diff cannot tell the two rules apart, and a session that fills the line and skips the check reads the bullet as met; verdict: none.

## 4. Behaviour

- `skills/plan-orchestration/SKILL.md` Steps 8 "Before the resume": "For a repair round, save the output of `git diff <base>`, run from inside the step's worktree, to `agents/reviews/<step>-round-<n>-sent.diff`." and the commit that carries it; what is wrong: the file is committed into the ledger, and the verify list's character-set check reads every tracked file. A `.diff` file is held to `[^\x20-\x7E\n]` (no exception, not even the `<white heavy check mark>`). A round sent to fix a non-ASCII finding saves that line (`+...<em dash>...`) in the diff, and a tab in any changed line (a Makefile or Go source in another repository) does the same. This is the defect class items 14 and 16 close for the builder's and the reviewer's reports, and the report does not state it; failure scenario: the reviewer flags an em dash, the round is sent, the saved diff holds the em dash, and the next landing on main of any plan prints that diff's line and `checks: 1 of 6 commands failed`, also after the folder moves to `.scratch/archive/`; verdict: none (item 12 as the brief words it, the brief's decision 3; the remedy is the orchestrator's).
- Same place, and `skills/refute/SKILL.md` "Over a repair round" 3, glossary **delta**: "the difference between that saved diff and the reviewer's own `git diff <base>`"; what is wrong: `git diff <base>` leaves out untracked files. `git diff 64c500d --stat` in this worktree lists 16 files and not `.scratch/.../agents/reviews/1-report.md`, which `git status --short` shows as `??`. Builders stage nothing, so every new file of a step is untracked; failure scenario: round 0 adds `utils/x.test.sh`, round 1 edits it; neither saved nor later diff holds it, the delta has no line of it, and the reviewer over the round, held to the three git commands, sees `?? utils/x.test.sh` both times and judges the round without its change; verdict: none (brief decision 3; the orchestrator's to rule).
- Builder report, "Host- or user-visible changes": "Steps 2 states the closing step", "Steps 6 checks the saved report's characters and copies a cases ruling into the worktree"; what is wrong: these state the after only; before, Steps 2 and 3 said nothing on the closing step, and Steps 6 saved the report with no check and gave the builder no copy of the cases ruling; failure scenario: a reader of the report cannot tell from it what a run did before; verdict: none.
- Outside the brief's items: `skills/spec/templates/brief-check.md` and `spec` "Steps / The brief check": the brief-check report is saved into the ledger at `agents/reviews/<step>-brief-check.md` and committed at the preparation commit, and `grep -n -i "character\|ascii\|angle" skills/spec/templates/brief-check.md` prints nothing; failure scenario: a brief-check agent quotes an em dash, the preparation commit carries it, and the next landing fails the character-set check, the defect items 14 and 16 close for the other two reports; verdict: none (not among the brief's items; for the orchestrator to place).

## Declined to judge

- The report's row 2 run of the line-75 command in a scratch repository with a tracked `z.md` deleted: it needs `git init`, `git add`, `git commit` and `rm` in a scratch repository, outside the three git commands; the no-git form (C7) is reproduced; `git init && git add -A && git commit -m x && rm z.md && <the command>` in a `$TMPDIR` repository would settle it.
- The report's row 5 claim for a page new and untracked in a worktree: needs a scratch repository; the changed and unchanged cases were reproduced in this worktree with `git diff --quiet 64c500d -- <page>`.
- The booking lines the report quotes from "a scratch copy of the test with one extra printf": not rerun, since it needs an edited copy of the test; the assertions were read in place.
- Whether the builder ran state-changing git commands in its scratch repositories, as rows 2 and 5 imply: the transcript of aa8abf145025a6fc5 would settle it.
- refute's version part: whether moving the usage line from the reviewer to the session, and reading a saved diff a round sent before this version lacks, is "output changed or removed" or "adds to its output" is a reading of `docs/dev/skill-layout.md` "Frontmatter" the evidence does not settle; the orchestrator's call.
- The plan's whole verify list and `checks.sh`: not run, as the review's instructions say; they run at landing on main.

Reviewer usage: a75ecf975eb8af923, claude-opus-5-5, 257289 tokens, 73 tool uses, 710.6 s.
