# Report: step 2, the real run of several plans in one session

Conditions 1 to 11 hold as worded. Condition 7 rests on less than the installed texts, and case 4 is partial:

- Condition 7 holds only because the orchestrator held plan 3's step 1 back from landing until plan 5's step 2 had landed. That hold goes against `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans", which lands steps in the order they are verified. Under that bullet plan 3's step 1 lands first, and condition 7 is not shown. The hold was booked nowhere.
- Case 4 is partial: plan 5's step 2 ran beside plan 3's step 1, never beside plan 3's step 2.

Condition 11 is this step's `/refute`, `agents/reviews/2-refuter.md`, run with the scratch repository in place.

## Open items of the state file

- none.

## The cases' first run (read from the installed texts before the run)

Read before `/plan-orchestration` was invoked in the scratch repository. Both scratch plans were open (scratch commits f10ad2a and 9736cff) and nothing was in flight. The full reading is in the scratchpad file `2-cases-first-run.md`. Each case below gives what the reading said the record must show, then the case's verdict against the run.

1. The first `/spec` is plan 5's step 1. `plan-orchestration` Steps 2 has each free slot take the next unblocked step of the earliest plan in the roadmap's order, and the scratch roadmap lists entry 5 first. Met: row 1.
2. Plan 3's step 1 waits on the shared file. Its `/spec` Steps 5 compares its paths with plan 5's step 1 brief, both naming `docs/guide.md` line 3. The merge is not simple, since plan 3's sentence goes right after plan 5's, so `spec` Steps 5 leaves no commit, worktree or dispatch entry. Met: row 3.
3. Plan 3's step 2 runs beside plan 5's step 1. The slot goes to the next pick after a step that waits, so two steps are in flight, one of each plan, equal to `workers_at_once: 2`. Met: row 4.
4. The reading: plan 5's step 2 takes the slot plan 5's step 1 frees. Plan 3's step 1 gets a `/spec` only after a later landing frees a slot. The brief's case 4 also asks that plan 5's step 2 run beside plan 3's step 2. Partial. Plan 5's step 2 had its `/spec` from 15:55:21 while plan 3's step 2 was in flight. Its launch commit 9534017 (16:03:11) came after plan 3's step 2 landed (5c00750, 15:57:41). It also came after plan 3's step 1 was launched (3938710, 16:00:22). So it was in flight beside plan 3's step 1 and never beside plan 3's step 2. The rest is met: plan 3's step 1 had no `/spec` until 5c00750.
5. The verify list is rewritten. `spec` Steps 1 or `land` Steps 2 compares plan 3's verify list with the page that plan 5's step 2 changes. So plan 3's next landing runs `sh tests/guide.test.sh 2>&1 | tail -1`, and its booking quotes `PASS: docs/guide.md`. Met as worded, through the orchestrator's hold of row 7. The reading assumed that plan 3's step 1 lands after plan 5's step 2. It did not check that order against `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans". Under that bullet the case is not met. The brief's rule on a case its own rules get wrong then called for a stop before the run.
6. Both closings stop at their roadmap diffs, kind 4 of `references/self-rule.md`, "The six kinds left open", and the one report lists both position lines and the two open items. Met: rows 8 and 9.
7. No question goes to the user. Both plans open under the quoted rulings without the stop, and every other open item outside the six kinds is closed under self-rule. Met for the questions: none was asked. The hold of row 7 was a choice outside the six kinds that was not booked.

## DONE / NOT DONE

Times are UTC. The scratch commits carry local time, `+02:00` (`git-log.txt`), and the times below subtract two hours. `T` is this session's transcript, `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl`, its Skill calls listed with their line numbers by a read of its `tool_use` records named `Skill`.

| # | Condition | Status | Evidence |
|---|---|---|---|
| 1 | The run starts with the plan whose entry comes first in the roadmap | DONE | `T` line 27517, 15:49:10, Skill `spec 5 1`, the first `/spec` of the run; `2-run/git-log.txt`: b461ff8 "Prepare step 1 of plan 5, the install sentence" is the first preparation commit. The scratch roadmap at 989d581, copied as `2-run/roadmap.md.txt.md`, holds `## 5. The guide's install line and its test` at line 21 and `## 3. The guide's usage line and its FAQ` at line 28. |
| 2 | Steps of both plans in flight together | DONE | Launch commits 87d13fc (15:50:18, plan 5 step 1) and 7a0a3f6 (15:51:58, plan 3 step 2) both come before the first landing commit 1d789a9 (15:54:54), `git-log.txt`. |
| 3 | Plan 3's step 1 waits on `docs/guide.md` | DONE | `T` line 27577, 15:50:21, Skill `spec 3 1`. The run's notes, copied as `2-run/run-notes.txt.md`, line 1: "2026-10-12T15:51:06Z /spec 3 1: Steps 5 compared its paths with plan 5 step 1 brief (in flight, dispatch entry in plan 5 state file): both name docs/guide.md lines 3-3; the merge is not simple because plan 3s sentence must stand right after the install sentence plan 5 step 1 adds, which main does not hold; the step waits until plan 5 step 1 lands; brief deleted (main has none), plan.md unchanged, no commit, worktree or dispatch entry." `T` lines 27590 to 27615 hold the read of plan 5's step 1 paths, the brief's deletion and `ls .agents/worktrees` showing plan 5's worktree alone. `git-log.txt` holds no commit between 87d13fc and f2145b1 (15:51:39, plan 3 step 2). Plan 3's step 1 was prepared only in aaa430c (15:59:48), after 1d789a9. |
| 4 | A third step in flight beside those two | DONE | Plan 3's step 2 was launched in 7a0a3f6 while plan 5's step 1 was in flight (its dispatch entry in that commit, count below) and plan 3's step 1 waited (row 3). |
| 5 | The limit 2 never exceeded; plan 5's step 2 takes the freed slot | DONE | Counts below: 1, 2, 1, 2 at the four launch commits, counted over the dispatch entries. At 3938710 plan 5's step 2 was still in `/spec` and held a slot the count does not show (finding 9). `T` line 27828, 15:55:21, `spec 5 2` came right after 1d789a9; `spec 3 1` came at 15:59:15 (`T` line 27963), after 5c00750 freed the second slot. |
| 6 | No two landings overlap | DONE | Landings table below: each `/land` Skill call, its `land.sh` run and its commit come before the next commit or Skill call (`T` lines 27755, 27871, 28300, 28349 and the next Skill calls at 27828, 27963, 28349, 28400). |
| 7 | Plan 3's next landing after plan 5's step 2 runs the new command | DONE as worded, through a hold against the text | Plan 5's step 2 landed in 9374825 (16:15:18); plan 3's next landing, step 1, cad4c19 (16:16:06). Its verify list was rewritten at `land` Steps 2 and named in the booking: `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md` line 75, "The verify list was rewritten at Steps 2 from `docs/dev/building.md`". Its booking quotes `PASS: docs/guide.md` at line 81 of the same file. Plan 3's step 1 was verified first, its reviewer ending at 16:02:55, against 16:13:53 for plan 5's step 2. `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans" lands steps in the order they are verified, so plan 3's step 1 would have landed first. The orchestrator held it until 9374825 (run notes line 7) and booked the hold nowhere. |
| 8 | The run's one report lists both plans' position lines and open items | DONE | `2-run/report.md` lines 3 and 7, the two position lines, each followed by its open item verbatim. |
| 9 | Nothing asked of the user during the run | DONE | Both plans opened under their quoted rulings with no stop (f10ad2a, 9736cff). No question went to the user, and the run ends at the two kind-4 roadmap diffs. No open item was raised; `cat .scratch/choices.md` in the scratch repository printed "No such file or directory". The hold of row 7 was a choice outside the six kinds and was not booked as one. |
| 10 | Every plan-skill invocation is a Skill tool call; the pin reads ea0add9 before and after | DONE | `T` holds 21 Skill calls from 15:42:33 to 16:17:13: `plan 3` (27230, 27241, 27387), `plan 5` (27456), `plan-orchestration` (27494), `spec` (27517, 27577, 27619, 27828, 27963), `refute` (27657, 27713, 28050, 28161, 28250), `land` (27755, 27871, 28300, 28349), `roadmap done 5` (28400), `roadmap done 3` (28437). `git -C ~/.local/share/ordo-stable log --oneline -1` printed `ea0add9` before the run and after it. |
| 11 | A fresh reviewer checks this report and the run's report in place | DONE | This step's `/refute`, `agents/reviews/2-refuter.md`, by reviewer a4f34743273779a48 on claude-opus-5-5. In the scratch repository it ran `git worktree list`, which printed `2i-run 9907c22 [main]`, and reran the copies' `cmp`, the cost script and the counts there. |

The `plan 3` call at 15:42:33 was invoked again 5 s later, with no tool call between them. The second call stopped on the open item "Step 2, the scratch gates that could pass without their goals", which went to the user and was ruled (a). The scratch commit 989d581 then rewrote the gates as ruled, and the run proper starts with the third call at 15:46:53.

## Timeline

One row per agent the run started, read from each agent's transcript under the session's `subagents/` folder: the first and last timestamp and the model of its messages.

| Agent | Plan, step | Role | Served model | Launched | Completed |
|---|---|---|---|---|---|
| a5398469161450042 | 5, 1 | builder | claude-sonnet-5-5 | 15:50:08 | 15:50:51 |
| ab5877438987b60c0 | 3, 2 | builder | claude-sonnet-5-5 | 15:51:49 | 15:52:41 |
| a0406117ec1eed592 | 5, 1 | reviewer | claude-sonnet-5-5 | 15:52:22 | 15:53:18 |
| a1f38991e8921cbad | 3, 2 | reviewer | claude-sonnet-5-5 | 15:53:12 | 15:54:34 |
| ab9154be194d9c2f8 | 5, 2 | brief check | claude-sonnet-5-5 | 15:56:26 | 16:01:18 |
| a46806818cc0e299c | 3, 1 | builder | claude-sonnet-5-5 | 16:00:07 | 16:01:07 |
| a0dfcb46f7a99aa64 | 3, 1 | reviewer | claude-sonnet-5-5 | 16:01:34 | 16:02:55 |
| a9c4b36b1a7ccc304 | 5, 2 | builder, and repair round 1 from 16:10:33 | claude-sonnet-5-5 | 16:02:57 | 16:11:34 |
| a99b21923806479bc | 5, 2 | reviewer | claude-sonnet-5-5 | 16:07:25 | 16:09:40 |
| a23e65e6307fe3c6a | 5, 2 | reviewer over round 1 | claude-sonnet-5-5 | 16:11:59 | 16:13:53 |

## Landings

| Landing | `/land` Skill call | Cherry-pick (`land.sh`) | Commit |
|---|---|---|---|
| Plan 5, step 1 | 15:53:40 | 15:53:52 | 1d789a9, 15:54:54 |
| Plan 3, step 2 | 15:56:40 | 15:57:08 | 5c00750, 15:57:41 |
| Plan 5, step 2 | 16:14:10 | 16:14:24 | 9374825, 16:15:18 |
| Plan 3, step 1 | 16:15:21 | 16:15:37 | cad4c19, 16:16:06 |

## Steps in flight at each launch commit

Counted as the dispatch entries in both state files at the commit, `git show <commit>:<state file> | grep -c '^- step:'` in the scratch repository. A step still in `/spec` has no dispatch entry and is not in these counts (finding 9):

| Launch commit | Plan 3 | Plan 5 | In flight |
|---|---|---|---|
| 87d13fc, plan 5 step 1 | 0 | 1 | 1 |
| 7a0a3f6, plan 3 step 2 | 1 | 1 | 2 |
| 3938710, plan 3 step 1 | 1 | 0 | 1 |
| 9534017, plan 5 step 2 | 1 | 1 | 2 |

The commit of repair round 1, 6a2738f, also held 1 and 1.

## The line the added test command printed in plan 3's landing booking

`2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md`, the booking of step 1:

```text
  $ sh tests/guide.test.sh 2>&1 | tail -1
  PASS: docs/guide.md
  checks: 2 commands passed
```

## The cost script's output of each scratch closing

Plan 5, `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/closing.md.txt.md`:

```text
Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2        0     76          157875               0     2803526   45818        1.41
brief check                 1        0     30           85517               0      976537   35289        0.76
reviewer                    2        0     34          128712               0     1056978   22473        0.76
reviewer over a round       1        0     20           69780               0      623127   14607        0.45
Total                       6        0    160          441884               0     5460168  118187        3.38
```

Plan 3, `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/closing.md.txt.md`:

```text
Role      Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder        2        0     32           86223               0      764110   15131        0.52
reviewer       2        0     34          106721               0      900453   19994        0.65
Total          4        0     66          192944               0     1664563   35125        1.17
```

The per-agent rows are in the two copies.

## Verify before you report

Run from Ordo's root after the record was written:

1. The character-set check over the record and this report, `git ls-files -coz --exclude-standard -- .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run .scratch/2-i-several-plans-in-one-session/agents/reviews/2-report.md | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'`: printed nothing, exit 0. `git ls-files -coz --exclude-standard -- <the same two paths> | tr '\0' '\n' | wc -l` printed `34`, so the 33 record files and this report were checked.
2. `find .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md`: printed nothing.
3. `grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run` printed 44 lines. The line in plan 3's booking is `.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:81:  PASS: docs/guide.md`.
4. `git -C ~/.local/share/ordo-stable log --oneline -1` printed `ea0add9 Book the review of C36 to C39 and the rulings on step 2 and ADR 0012`.
5. Each list item and sentence of this report was read against the prose standard's rules on list items, sentence length and semicolons. The cells of the DONE / NOT DONE table hold several sentences each, since each cell carries its evidence with its command.

## The files with line counts

`wc -l` of each file of the record and of this report. The record `2-run/` holds 33 files: the 28 copies of the scratch `.scratch/` folder, `building.md.txt.md`, `git-log.txt`, `report.md`, the scratch roadmap at 989d581 and the run's notes. The four `.gitkeep` copies are empty, as their sources are.

- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/.gitkeep.txt.md`: 0 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/1.md.txt.md`: 91 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/2.md.txt.md`: 95 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/.gitkeep.txt.md`: 0 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-landing.md.txt.md`: 46 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-refuter.md.txt.md`: 107 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md.txt.md`: 70 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-landing.md.txt.md`: 43 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-refuter.md.txt.md`: 125 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md.txt.md`: 63 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/closing.md.txt.md`: 15 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md.txt.md`: 71 lines
- `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md`: 88 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/.gitkeep.txt.md`: 0 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/1.md.txt.md`: 92 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2-round-1.md.txt.md`: 9 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2.md.txt.md`: 134 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/.gitkeep.txt.md`: 0 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-landing.md.txt.md`: 43 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-refuter.md.txt.md`: 109 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md.txt.md`: 60 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-brief-check.md.txt.md`: 154 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-landing.md.txt.md`: 47 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-refuter.md.txt.md`: 334 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md.txt.md`: 220 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/closing.md.txt.md`: 19 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md.txt.md`: 70 lines
- `2-run/.scratch/5-the-guide-s-install-line-and-its-test/plan.md.txt.md`: 90 lines
- `2-run/building.md.txt.md`: 8 lines
- `2-run/git-log.txt`: 108 lines
- `2-run/report.md`: 69 lines
- `2-run/roadmap.md.txt.md`: 51 lines
- `2-run/run-notes.txt.md`: 15 lines
- `2-report.md`: 197 lines

## User-visible changes

None in Ordo outside the ledger.

## Findings of the run

Each is a place where a skill text was wrong, unclear or silent, or where the run departed from it, with what happened.

1. `spec`, Steps 4, "Verify before you report", writes the character-set check of the verify list as `git ls-files -coz --exclude-standard -- <files> | xargs -0 perl -CSD -ne '<the check>'`. `plan-orchestration` Steps 4, "The prompt", gives the builder the no-git rule. The briefs of both step 1s carry the `git ls-files` form. Plan 5's step 1 builder fed the file list with `printf` on its own (its report, `1-report.md.txt.md` line 39). The briefs of plan 3's step 2 and plan 5's step 2, written after that report, give the `printf` form. The orchestrator's prompt told plan 3's step 1 builder to use `printf` (`T` line 28010). Plan 3's step 1 reviewer named the form as a finding. The skill does not say how a verify command that starts with git is given to a builder who runs no git.
2. `land`, Steps 6, and `spec`, Steps 1: the character-set check reads untracked files, so another plan's uncommitted record failed a landing. Plan 3's step 2 report, saved on disk in main with tabs, failed plan 5's step 1 landing (`checks: 1 of 1 commands failed`). It was fixed at landing in that record. The skills do not cover a red line caused by another plan's uncommitted record.
3. `plan-orchestration`, Steps 6: a builder's report copied from its worktree keeps the tabs of quoted output, which then fail the character-set check. The skill does not say the saved report must pass that check.
4. `plan`, Steps 2: no rule copies a quoted ruling's "Could run in parallel" sub-bullet into the plan's section of that name. `/plan` wrote the section from the sub-bullet.
5. `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans" lands steps one at a time "in the order the steps are verified". Steps 8 sends a step to `/land` once its rounds end. Plan 3's step 1 was verified first: its reviewer ended at 16:02:55, and the report was saved at 16:03:40. Plan 5's step 2 was verified at 16:13:53, at the end of the review over its round 1. The orchestrator held plan 3's step 1 against that bullet until 9374825 landed, and booked the hold nowhere. Two landings were never ready at once. Under that bullet plan 3's step 1 lands at about 16:04, before the page gains the new command. Plan 3 then has no later landing, so the command never reaches its verify list through a landing. Condition 7 is not shown by the texts.
6. `land`, Steps 2, compares the verify list with the page before the cherry-pick. So a step that adds a command to the page does not run that command at its own landing. Plan 5's step 2 landed with `checks: 1 commands passed`, and its booking quotes a separate run of the new command.
7. `plan-orchestration`, Steps 8: a repair round's brief is committed on main after the worktree was made, so the worktree holds no copy. The builder of plan 5's step 2 read it from the main checkout, as its message said.
8. `refute`, "What it reads" 5: the reviewer of plan 3's step 1 ran `git show <base>:docs/guide.md`, read-only, to run the cases on the unchanged file. That command is outside the two git commands the skill allows. The skill gives a reviewer no way to read the unchanged tree.
9. `spec` "What it reads" 3 and Steps 5 count the steps in flight and compare paths over the dispatch blocks alone. `plan-orchestration` "Two steps in flight", bullet "The limit.", counts the same way. A step whose `/spec` is still running has no dispatch entry, so another `/spec` neither counts it nor compares with its brief. Plan 5's step 2 was in `/spec` from 15:55:21 to its preparation commit 2d68984 at 16:02:43 (`T` lines 27828 to 28096). Inside that window the session ran `/land 3 2` and the whole of `/spec 3 1`, with commits aaa430c and 3938710. The orchestrator counted plan 5's step 2 as holding a slot (run notes line 4) and read its uncommitted brief's paths (`T` line 27997). The texts ask for neither. `/spec 5 2` compared its paths only with plan 3's step 2 (`T` line 27854) and never with plan 3's step 1, which was launched before its preparation commit. With a third unblocked step, an orchestrator following the texts would count none in flight at 15:59 and could put three steps in flight against `workers_at_once: 2`. The texts are also silent on one `/spec` waiting on its brief check while other skills run and commit.
10. `plan-orchestration` "Reports" gives the position line as "Next: step <k+1>, <step name>." and has no form for a plan at its closing. The run wrote "Next: the closing's roadmap diff, then the entry commit and the move of the folder, after the user's ruling." (`2-run/report.md` lines 3 and 7).

## Judgment calls the brief left open

- None about the landings: the brief left their order to the texts, and the hold of plan 3's step 1 departed from them (finding 5).
- The brief check of plan 5's step 2 found ten points. Each was closed by a change to the brief before the preparation commit, named under the Closed heading of `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-brief-check.md.txt.md`.
- The round-1 review's three findings of plan 5's step 2 were fixed at landing, each small and inside the brief.

## Anything in the brief that was wrong or impossible

- The record's names: the brief says `.txt` is appended to every copied file's name. The character-set check allows the tick glyph only in a file whose name ends `.md`, so a `.txt` copy of a scratch `plan.md` fails it. Run on a copy named `plan.md.txt`, the check printed that file's lines 19 and 20, the step lines with the tick. Run on a copy named `plan.md.txt.md`, it printed nothing. The copies carry `.txt.md` instead, a name that matches none of the file names Ordo's skills read as a ledger file. `building.md` is copied as `building.md.txt.md`, and Verify 2's `find` names `*.txt.md`, `git-log.txt` and `report.md`. The run's notes are copied as `run-notes.txt.md` under the same rule.
- The run's one report: the brief's "The run" 3 makes the run's final message its one report. The report was written as the file `run-report.md` (`T` line 28475, 16:18:09) and is copied as `2-run/report.md`. The session's message after the run was a different summary.
- `git-log.txt`: `git log --name-status` puts a tab after each status letter, which the character-set check refuses (`charset exit 1` on its lines). Each tab is written as one space.
