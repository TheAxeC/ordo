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

## Repair round 1, refuted

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
(exit 0)
$ printf '%s\0' <the 18 paths of "Paths this step writes", skills/spec/templates/brief-check.md added by the round, and the report> | xargs -0 perl -CSD -ne '<the check of the brief>'; echo "exit $?"
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
C1 (grep -n -F of each dictated sentence, run by hand and by the builder's $K/c1.sh; both agree):
  item 1: docs/dev/change-standard.md 55 count=1; skills/repo-setup/templates/docs/dev/change-standard.md 53 count=1; skills/repo-setup/templates/shared-rules.md 17 count=1
  item 3: skills/land/SKILL.md count=0
  item 4: skills/land/SKILL.md count=0
  item 7: shared-rules.md 9 count=1; item 8: shared-rules.md 7 count=1
  item 9: plan-orchestration/SKILL.md 97 count=1; item 11a: 98 count=1; item 11b: 149 count=1
  item 10: roadmap/SKILL.md 90 count=1; item 12: refute/SKILL.md 211 count=1
C2: docs/dev/building.md:11 and docs/dev/change-standard.md:75 hold the filter; cmp of each whole line with item 2's command printed nothing (equal)
C3: 20:A landing is held to the checks main holds once the step is on it. Each preparation and ...; grep -c -F 'at that moment' printed 0; the same first grep on git show 64c500d:<ADR 0010> counts 0
C4: the changed land.test.sh with land.sh and checks.sh from git show 64c500d: PASS: land.sh scratch tests; git diff 64c500d --stat -- skills/land/templates lists only land.test.sh
C6: land 3.0.0 -> 4.0.0, plan-orchestration 5.0.0 -> 6.0.0, refute 3.0.1 -> 4.0.0, spec 5.0.0 -> 6.0.0, roadmap 1.3.1 -> 1.4.0, repo-setup 4.0.0 -> 5.0.0
C7 (no git, $TMPDIR folder, bash -o pipefail -c; also the builder's $K/c7.sh $K/chk1.txt, same output):
  new form, a.md z.md: (nothing), exit 0
  new form control, t.txt z.md: t.txt:1: a<tab>b, exit 1
  old form, a.md z.md: Can't open z.md: No such file or directory at -e line 1., exit 0
C7 gate form in a scratch repository (a.md and z.md committed, z.md then deleted, git commands mine): new form: (nothing), exit 0; old form: Can't open z.md: No such file or directory at -e line 1., exit 0
C8: ok: the plan-terms block equals the template, exit 0
Round report evidence rerun:
$ grep -n 'reads only\|only with' skills/plan-orchestration/SKILL.md   -> (nothing), exit 1
$ grep -n 'verification:' skills/land/templates/land.test.sh   -> (nothing), exit 1
$ grep -n '^  version:' skills/{land,plan-orchestration,refute,spec,roadmap,repo-setup}/SKILL.md   -> refute 4.0.0, land 4.0.0, spec 6.0.0, plan-orchestration 6.0.0, roadmap 1.4.0, repo-setup 5.0.0
$ grep -n -i 'ledger' skills/plan-orchestration/SKILL.md | grep -i 'table\|DONE'   -> (nothing), exit 1
$ grep -rn 'sent.diff\|saved diff\|diff saved' skills docs   -> (nothing), exit 1
$ bash -o pipefail $K/cs.sh   -> (nothing), exit 0 (19 paths)
Line numbers the report names (land 82-88, 204, 220, 230, 241-246; plan-orchestration 93, 101, 153-159, 233, 413-414; refute 96-99, 106-107; plan-terms 31; glossary 36; brief-check 5; spec 389, 431, 432, 436; land.test.sh 9-12, 159-162, 168, 174): each read in place, each holds.
$K ($TMPDIR/2k) still holds c1.sh, c7.sh, cs.sh, gl.sh, chk1.txt and s/; c1.sh, c7.sh and cs.sh were rerun.
The round's delta: for the 16 paths of files.txt, diff -u of the snapshot copy against the worktree file; for skills/spec/templates/brief-check.md, git diff 64c500d. Changed paths: docs/dev/building.md, docs/glossary.md, skills/land/SKILL.md, skills/land/templates/land.test.sh, skills/plan-orchestration/SKILL.md, skills/refute/SKILL.md, skills/repo-setup/SKILL.md, skills/repo-setup/templates/plan-terms.md, skills/spec/SKILL.md, skills/spec/templates/brief-check.md. Unchanged since the snapshot: the ADR, the change standard, the refute report template, the template change standard, shared-rules, roadmap, brief.md.
```

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. C1 prints one line per file named. Rule 13 bullets 1 and 2 of both change standards, `skills/spec/templates/brief.md` "Verify before you report" 4 and `skills/refute/SKILL.md` Proof say one run on the unchanged tree before the code changes, an edit after it read; "names no revert" stays. Unchanged by the round.
- 2: holds. C2 and the cmp of the whole line; `docs/dev/building.md` "The last command" paragraph says "that exists on disk, so a file deleted in a worktree and not yet staged is left out".
- 3: holds against round ruling 4, which replaced the dictated sentence with the bullet and two sub-bullets at `skills/land/SKILL.md` Steps 6 (lines 82 to 84) and the row "A rule clash at landing" in "Stops". The brief's C1 sentence is no longer there; see Spec 1.
- 4: holds against round ruling 4, `skills/land/SKILL.md` Steps 6 (lines 85 to 88): the ruling is carried out on what it names, the other place is booked as an open item and named in the booking, "This is no stop." See Spec 1.
- 5: holds. `land` "What it reads" 8 and Steps 2 read the page from the worktree when `git diff --quiet <base> -- <page>` exits 1, from main otherwise, merged when both changed it; no script changes; ADR 0010 per C3.
- 6: holds. The case at `skills/land/templates/land.test.sh` lines 159 to 180 passes with the changed test against the base `land.sh` and `checks.sh` (C4); the head comment, `docs/dev/building.md` line 6 and `land` "The landing script" name it as ruling 2 words it. See Proof 1.
- 7: holds. C1, `shared-rules.md:9`.
- 8: holds. C1, `shared-rules.md:7`.
- 9: holds. C1, `plan-orchestration/SKILL.md:97`.
- 10: holds. C1, `roadmap/SKILL.md:90`; Steps 2 writes the draft whole to the scratch folder, Steps 3 shows the diff against it, each "The step is done when" bullet last.
- 11: holds. C1, `plan-orchestration/SKILL.md:98` and `:149`.
- 12: holds as the brief and round ruling 7 word it. C1 `refute/SKILL.md:211`; "What it reads" 5 names the three commands; `plan-orchestration` Steps 8 "Before the resume" snapshots the round's changed files into `<worktree_root>/<slug>-<step>-round-<n>/` with `files.txt`; `refute` "Over a repair round" 2 and 3, the term **delta** in `plan-terms.md` and the glossary, `land` "Removing a step's worktree" 4 and "Resuming, and handing the plan over" carry it; no `sent.diff` text is left. See Standards 1 and 2.
- 13: holds. `skills/spec/SKILL.md` (Steps 4 sub-bullet) and `skills/spec/templates/brief.md` "Verify before you report" 1.
- 14: holds. `skills/spec/templates/brief.md` "Report"; `plan-orchestration` Steps 6 check of the saved report.
- 15: holds. `plan-orchestration` Steps 8 "Before the resume" and Steps 6 (cases ruling), each with the message naming the path.
- 16: holds. `refute` Rules bullet, `templates/report.md` head paragraph, Steps 7 check of the saved report.
- 17: holds. `refute` Steps 6 leaves the line to the session and its "Done when" no longer names it; Steps 7 and "Over a repair round" 6 fill it; both template usage lines say the session fills them.
- 18: holds. `plan-orchestration` Steps 2, the closing-step bullet and its five sub-bullets.
- 19: holds. `plan-orchestration/SKILL.md:93` and `:101` now give the change standards' words with no "only"; `grep -n 'reads only\|only with'` prints nothing; the two change standards are unchanged.
- 20: holds. `plan-orchestration` "Reports": the opening NOT DONE line, then the position lines, landed steps and choices, and the closing table; `grep -n -i 'ledger' ... | grep -i 'table\|DONE'` prints nothing.
- 21: holds. **closing step**, **rule clash**, **hand-back**, **delta** changed in `plan-terms.md` and the glossary block (C8 exit 0); **position line** reworded for item 20.

Cases of the brief's "Cases":

- C1: partial, items 1, 7, 8, 9, 10, 11 (both) and 12 give one line per file; items 3 and 4 print 0 because round ruling 4 replaced both sentences; Spec 1.
- C2: met, one line in each file, whole lines equal to item 2's command.
- C3: met.
- C4: met, PASS after the change, and PASS for the changed test against the base `land.sh` and `checks.sh`, which the step leaves byte-equal.
- C5: met, items 5 and 13 to 21 read in place; on the base the text is absent (the base lines of the no-git rule, the "only git" line and the sections read at the base).
- C6: met, each skill raised one part once with the parts after it 0, and every part is the major raise `docs/dev/skill-layout.md` "Frontmatter" gives for a changed output, except roadmap (minor, adds a step that did not exist).
- C7: met, the runs above; the gate's own run in a scratch repository also gives nothing and exit 0 with a deleted tracked file, and so does the old form with a `Can't open` line on stderr.
- C8: met.

### Findings

Closure of the ten rulings, each read and rerun:

- 1: closed. Both bullets read in the change standards' words; the change standards are not in the delta.
- 2: closed. The four places say the case shows a new test script and its command left uncommitted reach main and that `checks.sh` runs the command there, with the fixture's verify list; `verification:` is gone from the case's `plan.yaml`; the page stays in the fixture; the changed test passes against the base `land.sh`. See Proof 1 for what the wording still claims.
- 3: closed. All six versions reproduced.
- 4: closed. The Stops row and the three counting bullets match; both sub-bullet groups read as the ruling words them.
- 5: closed. "table", the rows name the landing report and the command it quotes, or the open item.
- 6: closed. Two bullets.
- 7: closed in `plan-orchestration`, `refute`, the term **delta** and `land` "Removing a step's worktree"; see Standards 2 for a place that lists the removal commands and was not carried.
- 8: closed. Every bullet of "Host- or user-visible changes" gives a before beside the after.
- 9: closed. Template line, `spec` "Steps / The brief check" 1 and 3, and the "Done when".
- 10: not reproduced from the tree (the report says only `git status --short` and `git diff` were run); see Declined to judge.

No finding is closed by removing a check. No hunk of the delta reaches beyond a ruling.

#### 1. Spec

- Brief "Cases" C1 against `skills/land/SKILL.md` Steps 6, lines 82 to 88: "- A finding that is a clash between two of the user's rulings is never fixed at landing." and "- A place a ruling's reason reaches beyond what the ruling names is not changed at landing."; what is wrong: the brief's items 3 and 4 dictate two sentences word for word and C1 greps for them; after round ruling 4 the grep prints nothing for both (rerun: `C1 item 3 ... count=0`, `C1 item 4 ... count=0`). The builder did what ruling 4 asked and its report says so. The brief and the tree now name different words; failure scenario: the orchestrator at landing runs C1 as the brief words it, reads two zero counts as items 3 and 4 not built, or a later reader takes the bullets for the words the brief took from the approved proposals when they are the words of ruling 4; verdict: C1 partial (items 3 and 4 themselves hold).

#### 2. Proof

- `skills/land/templates/land.test.sh` lines 159 to 180, `skills/land/SKILL.md` "The landing script", `docs/dev/building.md` line 6: "a step whose new test script and its command, left uncommitted in the worktree, reach main and run there"; what is wrong: the case asserts `$ sh utils/added.test.sh` (a line from the verify list the fixture writes into the state file), `PASS: added test` (the script ran on main, so the script reached main) and `checks: 1 commands passed`. No assertion reads `docs/verification.md` or the command's line on main, so "its command ... reach main" is shown for the script only; failure scenario: a maintainer reads that the test covers a step's page edit reaching main, then changes `land.sh` so a modified tracked page is left out of the range, and the test stays green; verdict: none (item 6 holds, and the words follow round ruling 2; either the sentence says "script" alone or the case asserts the page on main, and the orchestrator chooses).

#### 3. Standards

- `skills/refute/SKILL.md` Rules and "What it reads" 5 against "Over a repair round" 3: Rules, "The reviewer runs no git command other than `git diff <base>`, `git status --short` and `git show <base>:<path>`", and "What it reads" 5, "are the only git the reviewer runs"; "Over a repair round" 3, "its change since the base, `git diff <base> -- <path>`"; what is wrong: the reviewer over a round is told to run a fourth command line that the two sentences exclude (`docs/dev/change-standard.md` rule 19, no two statements that contradict; `docs/dev/skill-layout.md` "Where a rule goes", a rule written once). The builder's judgment call reads `git diff <base> -- <path>` as `git diff <base>` limited to one path; the Rules sentence is dictated by item 12; failure scenario: a reviewer over a round reads the Rules sentence literally, runs no `git diff <base> -- <path>`, and either skips the change since the base of a path `files.txt` does not list or names it under "Declined to judge" in every round; verdict: none (item 12 holds as worded; the sentence or the step 3 form is the orchestrator's to settle).
- `skills/spec/SKILL.md` "Steps / A step taken back out of main" 4: "Remove the worktree and branches, as the `land` skill's "Removing a step's worktree" says: `git worktree remove --force <worktree>`, then `git branch -D` for `<branch>` and `<branch>-land`, each only when it exists."; what is wrong: "Removing a step's worktree" now has a step 4, `rm -r` on each `<worktree>-round-<n>` folder, and its introduction says `spec` does it "the same way for a kept worktree"; the `spec` list names the two git commands and not the folder removal (rule 14, a change carried to every place that names it; the file is a path of the step); failure scenario: a step backed out after a repair round is prepared again, the session follows the list in `spec`, and `<worktree>-round-1` stays under the worktree root beside the new worktree, to be overwritten by the next round's snapshot with stale copies still in it; verdict: none.
- `docs/figures/gen_figures.py` (the /land box, `("A red line for the user", "A lock held", "A worktree that cannot be removed")`) against `skills/land/SKILL.md` "Stops": the table gained the row "A rule clash at landing", and `docs/dev/building.md` says "A change to a skill's Stops table ... changes the labels in that script, which is then run again"; what is wrong: the figure lists the stops of the land box from that table, and the new stop (the user is asked, an open item is left) is not in it; the script and the two SVGs are not among the step's paths, and neither the report nor the round's report states this as a stop for the brief's path list (rules file, "Where the work happens" and rule 20); failure scenario: a reader of `docs/figures/plan-loop.svg` sees the /land box without the stop and does not expect a landing to end in an open item for a clash; verdict: none (a change outside the brief's paths; the orchestrator widens the paths at landing or rules otherwise).

#### 4. Behaviour

- none. The round's visible changes (the Stops row, the snapshot folder and `files.txt`, the `rm -r` of round folders, the brief-check report's character set, the six versions) each stand with their before and after in "Host- or user-visible changes, before and after".

### Declined to judge

- Ruling 10 (the builder ran only `git status --short` and `git diff` in the worktree this round): the claim sits in the builder's report and the tree cannot show it; the transcript of builder aa8abf145025a6fc5 for the round settles it.
- Proof 1 of the first refuter report (the gate's deleted-file run counts only when it prints nothing and exits 0): not sent back and not mine; the scratch-repository run above (empty output, exit 0 for the new form; a `Can't open` line for the old) is the reviewer's, and the run in a worktree with a tracked file deleted is the orchestrator's at landing.
- Whether the words of items 3 and 4, taken from the approved proposals, may be replaced by round ruling 4 (the orchestrator's text in place of dictated text): a call for the orchestrator, or the user if the proposals' wording is the user's ruling; the brief does not say.
- The booking lines the report quotes from "a scratch copy of the test with one extra `printf`": not rerun, since it needs an edited copy of the test; the assertions were read in place and the changed test was run against the base `land.sh` and `checks.sh`.
- The plan's whole verify list and `checks.sh`: not run, as the review's instructions say; they run at landing on main.
- Whether `<worktree>-round-<n>` folders are found by the `rm -r` step of "Removing a step's worktree" when `<n>` runs past 2 or a back-out left an older folder: the text says "each ... folder beside the worktree, when it exists" and names no listing command; `ls -d <worktree>-round-*` run from the repository root would settle which folders it matches, and `git` is not needed.

Reviewer usage: ada9ebae51d5ff033, claude-sonnet-5-5, 237582 tokens, 53 tool uses, 7.9 minutes.

## Closed

First run:

- Spec 1 (the builder's git rule in two forms): sent back as round 1 ruling 1; the run over round 1 found it closed.
- Proof 1 (the gate's deleted-file run also passes with the old form): not sent back; at landing the new form of the `docs/dev/building.md` check, run in a scratch worktree of main's head with the tracked `README.md` deleted, printed nothing and exited 0, which the old form does only with a `Can't open` line on stderr.
- Proof 2 (the `land.test.sh` case described as more than it shows): sent back as round 1 ruling 2; the rest of it is Proof 1 of the run over round 1, below.
- Standards 1 (the version parts): round 1 ruling 3; closed.
- Standards 2 (the two new `land` bullets with no stop): round 1 ruling 4; the wording is Spec 1 of the run over round 1, below.
- Standards 3 ("ledger" used for a table): round 1 ruling 5; closed.
- Standards 4 (two rules in one bullet): round 1 ruling 6; closed.
- Behaviour 1 and 2 (the saved round diff): round 1 ruling 7; closed, the rest of it Standards 1 and 2 of the run over round 1, below.
- Behaviour 3 (before and after): round 1 ruling 8; closed.
- Behaviour 4 (the brief-check report's characters): round 1 ruling 9; closed.

Run over round 1, each fixed on main at landing:

- Spec 1: `skills/land/SKILL.md` Steps 6 holds again, word for word, the two approved sentences of brief items 3 and 4, each with round ruling 4's sub-bullets under it, and the Stops row is named "A rule clash", the stop of the same name of `plan-orchestration`; `grep -c -F` of each sentence prints 1.
- Proof 1: the case of `skills/land/templates/land.test.sh` asserts that main's `docs/verification.md` holds the added command (`grep -qxF`), so "its command reach main" is checked; `sh skills/land/templates/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests` with the unchanged `land.sh`.
- Standards 1: `skills/refute/SKILL.md` "Over a repair round" 3 reads "the part of `git diff <base>` for that path", within the three commands of Rules.
- Standards 2: `skills/spec/SKILL.md` "Steps / A step taken back out of main" 4 runs `rm -r` on each `<worktree>-round-<n>` folder, as `land` "Removing a step's worktree" 4 does.
- Standards 3: `docs/figures/gen_figures.py` lists "A rule clash" in the /land box, and `python3 docs/figures/gen_figures.py` rewrote `docs/figures/plan-loop.svg`; the paths of the step were widened to both.
- Declined to judge, ruling 10: the builder's round-1 Bash calls, read from its transcript, ran `git status` and `git diff` in the worktree; the other git words in them are text the builder wrote into files.
