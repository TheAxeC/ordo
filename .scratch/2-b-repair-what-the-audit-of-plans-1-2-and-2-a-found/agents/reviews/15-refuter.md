# Step 15 refuter report (on .agents/worktrees/2b-15, base bef2c67)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
exit 0; 11 PASS: lines; 10 ok: lines; verify: 13 commands passed (the real state file, git ls-files form)
Case 1: 50 hits, none without "The re-run at <hash>" (48 at bef2c67); every quoted PASS: list against its "## Commit <c>" section of 15-rerun.md: rerun quotes 50 bad 0
Case 2: ls .agents/trees-2b-15 | wc -l -> 26; grep -c '^## Commit ' 15-rerun.md -> 26
Case 3: grep -c 'about [0-9]* minutes\|see the refuter report' plan 1 orchestrator-state.md -> 0 (13 at bef2c67)
Case 4: plan 1 rulings 12 closed 12 none 0; 2.A rulings 7 closed 7 none 0; plan 2 rulings 6 closed 6 none 0
Case 5: grep -n 'none until step 7\|owes once step 6' plan 2's ledger -> no output, exit 1
Check 3: python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md -> 10 ok: lines, exit 0
Own re-run of 84ce1f7, e6300be, fe1f5e7, d44092c, 5e9ec86, 7d1f90e against 15-rerun.md: tests equal, layout lines equal, layout exit and ascii exit equal on all six
Inventory check at 7d1f90e 10 ok: exit 0; at a682c14 2 ok: exit 0 (matches 15-rerun.md)
Trees checksum 66c7472a95f6678e59227606711b0bed before and after
The 26 commits are the landing and closing commits of plan 1 (steps 2-14 and close), plan 2 (1-6 and close), plan 2.A (1-4 and close); no other landing commit in 84ce1f7~1..7d1f90e
Usage: all 13 plan 1 steps' reviewer figures equal the session log's task notifications
Paths: the brief's list and git status --short agree (29 modified, 2 untracked)
ASCII over the changed files and both reports: exit 0; no em dashes
docs/roadmap.md unchanged; line 135 as quoted equals the file's
Worktree HEAD bef2c67; main git status --short empty
Session log 7bdaf343-....jsonl lines 1353 to 7295 cited by the bookings: each holds the command and output attributed to it
```

## 1. Spec

1. 15-report.md, "Doc text", the replacement: "the re-run at a866716 (...) shows seven `PASS:` lines with each test exiting 0" still states a count of `PASS:` lines without quoting them, the pattern step 15 exists to end. Quoting the seven lines, or naming the section without a count, fits the step.
2. 15-report.md, "Doc text": the replacement removes "every landing report `Open items: none. Booked list: empty`", which is literally true (`grep -h 'Booked' *-landing.md | sort | uniq -c` prints `13 Open items: none. Booked list: empty.`). The brief does not ask for the removal; it is the user's call when the Doc text is shown.
3. 15-report.md, "Doc text": "the commands of `docs/dev/building.md` last ran on main at step 14's landing" leaves out that the closing ran the layout check, its test, the inventory check and its test on main (log line 3179, result 3180) and the ASCII check (line 3204, `ascii exit 0`), as plan 1's `orchestrator-state.md:84` records.
4. Plan 1 `plan.md:65` ("27 findings in the first run") against usage row 2 ("23"), and `plan.md:152` ("3 in the run over the round, one needing no fix") against usage row 13 ("3 (a fourth needed no fix)"): the same ledger gives two counts for each. 27 counts the three Not checked items; 23 holds. For step 13 the round's Spec 1 and Behaviour 1 are the same defect (`13-refuter.md`), so plan.md's 3 holds.
5. Plan 1 `plan.md:66, :76, :86, :95` and `agents/reviews/2-landing.md` to `5-landing.md` line 9 (the same for plan 2 `plan.md:52, :60`): the old "a clean ASCII check" was observed; the ASCII check was the last, unpiped command of the verify script (verify list at 84ce1f7; the wrapper at log line 1353), so the script's exit 0 carried its status. The new text credits a clean ASCII check to the re-run only, and the fact from the landing is lost. Minor.

## 2. Proof

none. The re-run reproduces on 6 of 6 commits, all 50 quoted lists match their sections, all usage figures match the log, and every cited log line read holds what the booking says.

## 3. Standards

1. Brief, Conventions: "Never run a git command of any kind". The builder ran `git status --short`, the land runner (`git ls-files`), the inventory check (`git show`) and tests with their own scratch repositories, and disclosed them. The breach is forced by the brief: check 1 needs `git ls-files`, check 3 and the re-run need `git show`. Nothing was written: main's `git status --short` is empty, the worktree HEAD is bef2c67, and the worktree lists only the brief's paths. The brief should be corrected.
2. `skills/repo-setup/templates/docs/dev/prose-standard.md:64`: the rewritten "Verification on main" bullets open with sentences of 60 to 90 words joined by semicolons (for example 2.A `plan.md:52`). The quoted `PASS:` list needs its length; the account of the session's run could be split into sentences.

## 4. Behaviour

none. Ledger text only; `docs/roadmap.md` unchanged, its line 135 going to the user as Doc text.

## Not checked

- The re-run on the other 20 commits (checked through the consistency of 15-rerun.md with the bookings).
- Session log line 5719; the dates of 2.A's closed items against the log.
- The findings counts of steps 3, 4, 5, 7, 8, 9, 11, 12 and 14 against their refuter reports.
- The "Bookings changed" section of 15-report.md entry by entry (68 counted, the first four read; the changes read in the diff).

## Usage

Reviewer: claude:opus, agent a47b2f8d813037915, 209,446 tokens, 64 tool uses, 1,288 s.

## Repair round 1, refuted

On .agents/worktrees/2b-15, base bef2c67, round delta `git diff b32f293` plus the rewritten `15-report.md` and `15-rerun.md`; reviewer claude:opus, agent a8936a4bb6ee057ba.

```
worktree HEAD: b32f293 wip
verify runner: exit 0; 11 PASS: lines; 10 ok: lines; verify: 13 commands passed
Case 1: 50 hits; each quoted PASS: list against its "## Commit <c>" section: hits 50 bad 0 sections 26
Case 2: 26 trees; 26 "## Commit" sections
Case 3: 0
Case 4: plan 1 12/12, plan 2 6/6, plan 2.A 7/7 (6 rulings and 1 premise correction), no "- none."
Case 5: no output, grep exit 1
Check 3: 10 ok:, exit 0
Trees checksum 66c7472a95f6678e59227606711b0bed, unchanged
Paths: none outside the brief's list (31); docs/roadmap.md unchanged; main git status --short empty
ASCII and em dash checks over the 31 files: no output
Doc text: the two variants differ only by the clause; the seven PASS: lines equal the a866716 section; log 3179/3180, 3204/3205 and 3150/3151 ("Found 10 skills", during step 14's landing) hold what the variants say
Sentence scan over the 50 bookings: 2 sentences of 36 words (2.A plan.md:81 and 2.A 4-landing.md:9), the rest 30 or fewer
```

### Spec

1. `15-rerun.md:2126`: the round's rule counts an item that restates a finding under another heading once, and on it the builder changed the usage rows of steps 4 to 12 and plan.md:152 and usage row 13 (17 to 14). Each item counted out does restate another (refuter lines checked for all ten steps), but the old figures were not false: they followed the first pass's rule, which counted a restated item under each heading. The extension beyond steps 2 and 13's round is not in ruling 3.
2. Same line: the round's rule collapses only restatements under another heading; restatements under the same heading (`7-refuter.md:56`, `10-refuter.md:51` and `:52`, `13-refuter.md:66`) still count twice, so it does not give one count per finding either.
3. Plans 2 and 2.A count a restating item under each heading (plan 2 step 1's 14 includes `1-refuter.md:42`; 2.A step 4's 5 includes `4-refuter.md:20`). After the round plan 1 counts under one rule and plans 2 and 2.A under another, and neither 15-rerun.md nor 15-report.md says so.
4. `15-report.md`, "Doc text", the reason for variant 2: "the audit's finding 6 ... shows the open, booked and closed lists were never used in plan 1". The audit's own evidence (`1-process-audit.md:74`) names one open item committed in plan 1 (582298b, "Open the plan for roadmap entry 1"). True of the booked and closed lists only.

### Proof

1. `.scratch/archive/2-coverage-inventory-of-the-academic-skills/plan.md:81` and `agents/reviews/4-landing.md:9` cite session log line 5551 (18:38:36Z), which runs in step 5's worktree `.agents/worktrees/2-5`. The run on main at step 4's landing is line 5509 (18:36:25Z, the main checkout), result at 5511: `18` and `verify exit 0`, the same `v.sh >/dev/null 2>&1; echo "verify exit $?"` form.

### Standards

none.

### Behaviour

none.

### Not checked

- The case 1 control was not reproduced; the 26-commit re-run was not redone (checksum and the 50 lists checked).
- Plan 2's closing (5960) and 2.A's step 3 and closing (7050, 7295) checked for the form of the run only.
- The seven step descriptions of the Doc text read against the Closed sections of 4, 6, 7, 8, 10, 11 and 13-refuter.md only.
- The "Bookings changed" section entry by entry; plan 2 and 2.A usage rows other than plan 2 step 1 and 2.A steps 2 and 4.

Reviewer usage: 201,769 tokens, 65 tool uses, 679 s.
