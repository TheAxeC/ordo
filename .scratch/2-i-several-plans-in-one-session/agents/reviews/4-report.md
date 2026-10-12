# Report: step 4, the second real run of several plans in one session

NOT DONE: the cases' first run was not written down before the run started. The section "The cases' first run" below gives each case's reading of the installed texts as it was made when this report was written, and says so for each case. Condition 11 is this step's `/refute`, which runs after this report with the scratch repository in place.

Conditions 1 to 10 hold. Condition 7 holds through the texts alone: plan 3's step 3 waited by the pair judgment at the pick, and no landing was held back.

## Open items of the state file

- none.

## The cases' first run

The brief asks for a reading of the installed texts before the run, saying what the record must show. No such reading was written before `/plan` was invoked in the scratch repository at 20:53:35: the transcript holds none between the brief check's closing at 20:51:43 and that call, and the scratchpad holds no file for it. Each case below gives the reading as made now, against the same installed texts (pin 61d3eab, unchanged through the run), and then its verdict against the record.

1. The first `/spec` is plan 5's step 1. `plan-orchestration` Steps 2 gives each free slot the next unblocked step of the earliest plan in the roadmap's order, and `roadmap.md.txt.md` lists entry 5 on line 21 and entry 3 on line 28. Met: row 1.
2. Plan 3's step 1 waits while plan 5's step 1 is in flight. Both write `docs/guide.md` line 3, and plan 3's sentence goes right after plan 5's, which "Two steps in flight" judges a dependency that forces an order. Met: row 3, by the pair judged at the pick (`run-notes.txt.md` line 7).
3. Plan 3's step 2 runs beside plan 5's step 1, two steps in flight, one of each plan. Met: row 2.
4. Plan 5's step 2 takes the slot plan 5's step 1 frees, its `preparing` entry standing while plan 3's step 2 is unlanded. Met: row 4.
5. Plan 3's first `/spec` or `/land` after plan 5's step 2's landing commit rewrites plan 3's verify list, and plan 3's next booking quotes `PASS: docs/guide.md`; plan 3's step 3 gets no `/spec` before that landing. Met: row 7.
6. Every landing comes in the order its step was verified, none held back. Met: row 6.
7. Both plans stop at their closing steps on their roadmap diffs, and the one report lists both position lines and the two open items. Met: row 8.
8. No open item outside the six kinds, and no question to the user. Met: row 9.

## DONE / NOT DONE

Times are UTC. The scratch commits carry `+02:00` in `git-log.txt`; the times below subtract two hours. `T` is this session's transcript, `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl`, its Skill calls read from its `tool_use` records named `Skill`.

| # | Condition | Status | Evidence |
|---|---|---|---|
| 1 | The run starts with the plan whose entry comes first in the roadmap | DONE | `T`, 20:55:10, Skill `spec 5 1`, the first `/spec` of the run; `git-log.txt`, 4bfa048 "Prepare step 1 of plan 5" at 20:57:01, the first preparation commit, after 41b86f4 opened plan 3 first at 20:54:40 |
| 2 | Steps of both plans in flight at once | DONE | Launch commits c540ae3 (plan 5 step 1, 20:57:29) and 150e6e8 (plan 3 step 2, 20:58:41), both before the first landing, 37845b0 at 21:00:51; the dispatch count at 150e6e8 is 2 (counts table) |
| 3 | Plan 3's step 1 waits while plan 5's step 1 is in flight | DONE | `run-notes.txt.md` line 7, 20:57:40: the pick judges plan 3 step 1 against plan 5 step 1 a dependency that forces an order; Skill `spec 3 1` at 21:03:20 and its preparation commit b7d8bd2 at 21:04:05, after plan 5 step 1's landing commit 37845b0 at 21:00:51 |
| 4 | Plan 5's step 2 in flight beside plan 3's step 2 | DONE | Skill `spec 5 2` at 21:01:15; `run-notes.txt.md`, 21:01:28, its preflight writes the `preparing` entry with plan 3 step 2 in flight; plan 3 step 2 lands at c59dbea, 21:03:11; the `preparing` entry stood on disk in plan 5's state file from 21:01:28 to its preparation commit 52682d0 at 21:07:40 |
| 5 | Never more than two steps in flight | DONE | The counts table: the count read at each pick and preflight is 0, 1 or 2, and the count at each commit that changes a dispatch block is at most 2 |
| 6 | No two landings overlap, in the order verified | DONE | The landings table: each landing runs from its `/land` call to its commit before the next Skill call, and the five landings come in the order of their last review's end |
| 7 | The verify list rewritten after plan 5's step 2 lands, the PASS line booked, plan 3's step 3 held by the pair judgment | DONE | `run-notes.txt.md` line 44, 21:08:47: plan 3 step 3 held by the pair judgment with plan 5 step 2 (it names the command step 2 adds); Skill `spec 3 3` at 21:21:57, after 8439f8f at 21:20:39; `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/3.md.txt.md` line 15 names the rewrite; `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md` line 89, `  - `PASS: docs/guide.md``, in the booking of step 3 |
| 8 | The one report lists both position lines and open items | DONE | `4-run/report.md`: "Roadmap entry 5 (The guide's install line and its test). Plan step 3 of 3: the closing. Next: the roadmap diff of `/roadmap done 5`, for the user's approval.", then its open item; the same for entry 3, step 4 of 4 |
| 9 | Nothing asked of the user | DONE | `T` holds no `tool_use` named AskUserQuestion after 20:53, and no user message other than skill loads, agent hand-backs and two compaction summaries (20:56:02, 21:14:58); both plans opened under the quoted rulings without the stop (41b86f4, fce74d0); the only open items are the two kind-4 roadmap diffs; `.scratch/choices.md` was not written (`ls` prints "No such file or directory") |
| 10 | Every plan skill call through the Skill tool; the pin 61d3eab before and after | DONE | `T`, 21 Skill calls from 20:53:35 to 21:28:44: `plan 3 --ruling ...`, `plan 5 --ruling ...`, `plan-orchestration`, `spec 5 1`, `spec 3 2`, `refute 5 1`, `refute 3 2`, `land 5 1`, `spec 5 2`, `land 3 2`, `spec 3 1`, `refute 3 1`, `land 3 1`, `refute 5 2`, `refute 5 2` (over round 1), `land 5 2`, `roadmap done 5`, `spec 3 3`, `refute 3 3`, `land 3 3`, `roadmap done 3`; `run-notes.txt.md` line 1, "run starts; pin 61d3eab"; after the run, `git -C ~/.local/share/ordo-stable log --oneline -1` printed `61d3eab Land step 3 of plan 2.I, the skill texts after the real run` |
| 11 | A fresh reviewer checks the report against the scratch ledgers in place | NOT DONE yet | This step's `/refute`, run after this report and before the scratch repository is removed |

Checks of "Verify before you report", run from Ordo's root after the record was written:

1. The character-set check over the record and this report, `git ls-files -coz --exclude-standard -- .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run .scratch/2-i-several-plans-in-one-session/agents/reviews/4-report.md | xargs -0 perl -CSD -ne '<the check of docs/dev/building.md>'; echo "exit $?"`, printed nothing, then `exit 0`. The same `git ls-files` piped through `tr '\0' '\n' | wc -l` printed `40`, so the 39 record files and this report were checked.
2. `find .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md` printed nothing.
3. `grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/4-run` printed 47 lines, among them `.scratch/2-i-several-plans-in-one-session/agents/reviews/4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:89:  - `PASS: docs/guide.md``, the booking of plan 3's step 3, plan 3's first landing after 8439f8f.
4. `git -C ~/.local/share/ordo-stable log --oneline -1` printed `61d3eab Land step 3 of plan 2.I, the skill texts after the real run`.
5. Each list item and sentence of this report was read against the prose standard's rules on list items and sentence length; the table cells hold evidence lists, which are longer than a sentence by design.

## Timeline of the scratch agents

The launch and completion times are the first and last `timestamp` of each agent's transcript under `subagents/agent-<id>.jsonl`. Every agent ran as `ordo-high` and was served claude-sonnet-5-5 (read from each transcript's `model` fields).

| Agent | Plan, step | Role | Model | Launch | Completion |
|---|---|---|---|---|---|
| afc9aa3f92bc74bf1 | 5, 1 | builder | claude-sonnet-5-5 | 20:57:20 | 20:57:56 |
| aa0e9d44326c1ae87 | 3, 2 | builder | claude-sonnet-5-5 | 20:58:32 | 20:59:15 |
| a5daed14247e301df | 5, 1 | reviewer | claude-sonnet-5-5 | 20:58:58 | 20:59:50 |
| a9ee783bdb416bde3 | 3, 2 | reviewer | claude-sonnet-5-5 | 20:59:39 | 21:00:40 |
| a3a6121993983092e | 5, 2 | brief check | claude-sonnet-5-5 | 21:02:20 | 21:06:25 |
| a115b0da88ae3351b | 3, 1 | builder | claude-sonnet-5-5 | 21:04:16 | 21:05:17 |
| a8a41fe99a8b7fb42 | 3, 1 | reviewer | claude-sonnet-5-5 | 21:05:39 | 21:06:29 |
| a7ac8220a5207dd70 | 5, 2 | builder, and repair round 1 | claude-sonnet-5-5 | 21:07:52; round 1 21:15:12 | 21:09:40; round 1 21:16:22 |
| affe0b4b29ffefabd | 5, 2 | reviewer | claude-sonnet-5-5 | 21:10:04 | 21:13:35 |
| a3df69c2e3d5202dc | 5, 2 | reviewer over round 1 | claude-sonnet-5-5 | 21:16:59 | 21:18:47 |
| a762551a7c79dd83a | 3, 3 | builder | claude-sonnet-5-5 | 21:23:04 | 21:23:49 |
| ab949a5723e4a311d | 3, 3 | reviewer | claude-sonnet-5-5 | 21:24:10 | 21:27:06 |

## Landings

The last review's end is its transcript's last timestamp; the `/land` call is the Skill call in `T`; the cherry-pick is `land.sh`'s run, from `run-notes.txt.md` and, for plan 5 step 2 and plan 3 step 3, the `wip` commit `land.sh` printed; the commit is the landing commit in `git-log.txt`.

| Plan, step | Last review ended | `/land` call | Cherry-pick | Landing commit |
|---|---|---|---|---|
| 5, 1 | 20:59:50 | 21:00:08 | 21:00:18 to 21:00:20 | 37845b0, 21:00:51 |
| 3, 2 | 21:00:40 | 21:02:28 | 21:02:36 to 21:02:40 | c59dbea, 21:03:11 |
| 3, 1 | 21:06:29 | 21:08:02 | 21:08:09 to 21:08:11 | cf5c5b6, 21:08:41 |
| 5, 2 | 21:18:47 (over round 1) | 21:19:06 | 21:19:37 | 8439f8f, 21:20:39 |
| 3, 3 | 21:27:06 | 21:27:31 | 21:27:40 | 6379a69, 21:28:22 |

Between the landing of plan 5's step 1 and the `/land 3 2` call, the free slot went to `/spec 5 2` first (Skill call 21:01:15), as decision 4 of the brief says. Plan 3's step 2 review ended during the landing of plan 5's step 1 and was saved after its commit (`run-notes.txt.md`, 21:00:51).

## Steps in flight

At each pick and each `/spec` preflight, from `run-notes.txt.md`, read from both plans' dispatch blocks on disk:

| Time | Point | Count read |
|---|---|---|
| 20:55:09 | pick, slot 1 | 0 |
| 20:56:29 | `/spec 5 1` preflight | 0 |
| 20:57:40 | pick, slot 2 | 1 (plan 5 step 1) |
| 20:57:51 | `/spec 3 2` preflight | 1 (plan 5 step 1) |
| 21:01:13 | pick after the landing of plan 5 step 1 | 1 (plan 3 step 2) |
| 21:01:28 | `/spec 5 2` preflight | 1 (plan 3 step 2) |
| 21:03:21 | pick after the landing of plan 3 step 2 | 1 (plan 5 step 2, preparing) |
| 21:03:28 | `/spec 3 1` preflight | 1 (plan 5 step 2, preparing) |
| 21:08:47 | pick after the landing of plan 3 step 1 | 1 (plan 5 step 2); nothing unblocked |
| 21:22:11 | `/spec 3 3` preflight | 0 |

At each commit that changes a dispatch block, as committed (`git show <commit>:<state file>` for both plans):

| Commit | Plan 3 | Plan 5 | Count |
|---|---|---|---|
| 4bfa048 | none | 1 preparing | 1 |
| c540ae3 | none | 1 not-started | 1 |
| 23e472f | 2 preparing | 1 not-started | 2 |
| 150e6e8 | 2 not-started | 1 not-started | 2 |
| 37845b0 | 2 not-started | none | 1 |
| c59dbea | none | none committed; 2 preparing on disk | 1 on disk |
| b7d8bd2 | 1 preparing | none committed; 2 preparing on disk | 2 on disk |
| bb47d79 | 1 not-started | none committed; 2 preparing on disk | 2 on disk |
| 52682d0 | 1 not-started | 2 preparing | 2 |
| 7dbe29a | 1 not-started | 2 not-started | 2 |
| cf5c5b6 | none | 2 not-started | 1 |
| 9f0858e | none | 2 not-started | 1 |
| 8439f8f | none | none | 0 |
| c1b3023 | 3 preparing | none | 1 |
| d599ab7 | 3 not-started | none | 1 |
| 6379a69 | none | none | 0 |

Plan 5's step 2 `preparing` entry stood on disk from 21:01:28 and was first committed in its preparation commit 52682d0, as the `spec` skill's "Steps / The brief check" 1 carries a `/spec` waiting on its brief check; the commits of plan 3 in between do not name plan 5's state file. On disk the count agrees with the count read at each pick and preflight.

## The added test command in plan 3's booking

`4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md`, the booking of step 3, lines 86 to 90:

```text
- Verification on main, `templates/checks.sh`, after the fix at landing:
  - `$ <the character-set check>`
  - `$ sh tests/guide.test.sh 2>&1 | tail -1`
  - `PASS: docs/guide.md`
  - `checks: 2 commands passed`
```

## The cost script's output of each scratch closing

Plan 5, `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/closing.md.txt.md`:

```text
Role                   Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     2        0     60          171911               0     1757023   28943        1.07
brief check                 1        0     26           82165               0      920934   21076        0.60
reviewer                    2        0     34          144180               0     1154275   24902        0.84
reviewer over a round       1        0     28           80053               0      972848   12182        0.52
Total                       6        0    148          478309               0     4805080   87103        3.03
```

Plan 3, `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/closing.md.txt.md`:

```text
Role      Agents  No body  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder        3        0     54          125407               0     1308415   17144        0.75
reviewer       3        0     44          150163               0     1113962   23164        0.83
Total          6        0     98          275570               0     2422377   40308        1.58
```

The per-agent rows are in the two copies.

## Files

Under `.scratch/2-i-several-plans-in-one-session/agents/reviews/`, counted with `wc -l`:

- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/.gitkeep.txt.md`: 0 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/1.md.txt.md`: 95 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/2.md.txt.md`: 93 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/3.md.txt.md`: 96 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/.gitkeep.txt.md`: 0 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-landing.md.txt.md`: 32 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-refuter.md.txt.md`: 83 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-report.md.txt.md`: 56 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-landing.md.txt.md`: 32 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-refuter.md.txt.md`: 75 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md.txt.md`: 66 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-landing.md.txt.md`: 32 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-refuter.md.txt.md`: 67 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/3-report.md.txt.md`: 53 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/closing.md.txt.md`: 17 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md.txt.md`: 71 lines
- `4-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md`: 93 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/.gitkeep.txt.md`: 0 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/1.md.txt.md`: 93 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2-round-1.md.txt.md`: 12 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2.md.txt.md`: 143 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/.gitkeep.txt.md`: 0 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-landing.md.txt.md`: 32 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-refuter.md.txt.md`: 87 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-report.md.txt.md`: 56 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-brief-check.md.txt.md`: 134 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-landing.md.txt.md`: 35 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-refuter.md.txt.md`: 213 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-report.md.txt.md`: 214 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/closing.md.txt.md`: 19 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md.txt.md`: 71 lines
- `4-run/.scratch/5-the-guide-s-install-line-and-its-test/plan.md.txt.md`: 78 lines
- `4-run/building.md.txt.md`: 8 lines
- `4-run/git-log.txt`: 125 lines
- `4-run/report.md`: 31 lines
- `4-run/roadmap-done-3.diff.txt.md`: 25 lines
- `4-run/roadmap-done-5.diff.txt.md`: 25 lines
- `4-run/roadmap.md.txt.md`: 51 lines
- `4-run/run-notes.txt.md`: 66 lines
- `4-report.md`: this report

## User-visible changes

None in Ordo outside the ledger.

## Findings of the run

1. `land` Steps 2 does not say which copy of the verification page the verify list is compared with. At `/land 5 2`, main's page before the cherry-pick held one command and the page as the cherry-pick brings it held two, the second being the step's own test. Compared with main's copy, the list stays at one command and the step's own check does not run at its own landing. The run compared with the page as the cherry-pick brings it, rewrote plan 5's list to both commands and named it in the booking (`run-notes.txt.md`, 21:19:33; plan 5's booking of step 2).
2. A reviewer's report that quotes a character outside ASCII fails the character-set check on main when the report is saved into the ledger and committed with the landing. At `/land 3 1` the saved `1-refuter.md` held an em dash and an en dash the reviewer had quoted; they were written as `<em dash>` and `<en dash>` as a fix at landing (`run-notes.txt.md`, 21:08:20). Neither the `refute` skill nor its report template tells the reviewer to quote no such character; every later prompt in the run did.
3. The `refute` skill's Steps 6 asks the reviewer to write its own usage line, with its agent id, tokens, tool uses and minutes, which the reviewer does not know. Two reviewers wrote figures that differ from their completion notices: a3df69c2e3d5202dc wrote "9 tool uses, about 8 minutes" where its notice gives 16 tool uses and 108 s, and ab949a5723e4a311d gave no id or tokens. The saved reports carry the notices' figures.
4. The reviewer ab949a5723e4a311d ran `git log --oneline -3` and `git rev-parse HEAD` in the worktree, outside the `refute` skill's allowance of `git diff <base>` and `git status --short`; it said so under "Declined to judge". Both are read-only and no result rests on them.
5. `plan-orchestration` does not say whether a closing step marked "orchestrator, no agent" goes through `/spec` or takes a slot. The run ran both closings without `/spec` or a dispatch entry, writing the closing report with `plan_cost.py`, invoking `/roadmap done` through the Skill tool and committing the stop, as step 2's run did.

## Judgment calls the brief left open

- The closing of plan 5 ran before the `/spec` of plan 3's step 3: after plan 5's step 2 landed, the earliest plan in the roadmap's order with an unblocked step was plan 5, whose next step was its closing.
- The roadmap diffs of both closings were drafted in the scratchpad and copied into the record as `roadmap-done-5.diff.txt.md` and `roadmap-done-3.diff.txt.md`, with each tab written as one space; the brief's record list does not name them.
- Finding S2 of plan 5 step 2's run over round 1 and finding B1 of plan 3 step 3's review were fixed at landing, each small and inside its brief; B1 and B2 of plan 5 step 2's first review and P1 and S1 of plan 3 step 3's review were closed with no change, each with its reason under its refuter report's "Closed" heading.

## Anything in the brief that was wrong or impossible

- none.
