# Review of step 2 of plan 2.I (base c93adae)

I changed nothing in Ordo, its worktrees or the scratch repository. I invoked no skill and started no agent. Two scratch files went under $TMPDIR (`rv-calls.txt` and the cost-script outputs); the cost outputs are removed and `rv-calls.txt` is a listing of transcript calls. Where this report says "T", it means the transcript `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl`.

## Verification lines (verbatim, from Ordo's root)

Verify 1 (the record and the report, with Ordo's check copied from `docs/dev/building.md` line 11, then `echo "exit $?"`):

```
exit 0
```

It printed no line. `git ls-files -coz --exclude-standard -- <the two paths> | tr '\0' '\n' | wc -l` printed `32`, so all 31 record files and the report were checked.

Verify 2, in the report's form: `find .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md; echo "exit $?"`

```
exit 0
```

It printed no path. The brief's form, `! -name '*.txt' ! -name report.md`, prints all 29 `.txt.md` copies, as the report's "wrong or impossible" section expects.

Verify 3: `grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run` printed 40 lines. Among them is the booking line:

```
.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:81:  PASS: docs/guide.md
```

Verify 4:

```
$ git -C ~/.local/share/ordo-stable log --oneline -1
ea0add9 Book the review of C36 to C39 and the rulings on step 2 and ADR 0012
$ git -C ~/.local/share/ordo-stable describe --tags
v6.0.0-rc.1
```

In the worktree:

```
$ git diff c93adae; echo "diff exit $?"; git status --short; echo "status exit $?"
diff exit 0
status exit 0
```

Both printed nothing else. On main, `git status --short` lists only `?? .../agents/reviews/2-report.md` and `?? .../agents/reviews/2-run/`. Since c93adae, `git log c93adae..HEAD --name-status` shows three commits (5ee5e52, 47d23db, d3a1e15), and they touch only `plan.md` and `orchestrator-state.md` of this ledger.

Record checks:

- **Copies.** `cmp` of each of the 28 files under the scratch `.scratch/` against `2-run/<path>.txt.md` printed `same` for all 28. A `diff` of the two path lists exited 0. `cmp docs/dev/building.md 2-run/building.md.txt.md` printed nothing ("building same").
- **git-log.txt.** I ran `git log --format='%h %ad %s' --date=iso-strict --name-status | tr '\t' ' '` in the scratch repository, and `cmp` against `git-log.txt` printed nothing ("git-log same with tabs as spaces"). `wc -l` gives `108`. The raw log holds 66 lines with a tab.
- **report.md.** `cmp scratchpad/run-report.md 2-run/report.md` printed nothing.
- **Steps in flight.** `git show <c>:<state file> | grep -c '^- step:'` printed these counts (plan 3, plan 5): 87d13fc 0,1; 7a0a3f6 1,1; 3938710 1,0; 9534017 1,1; 6a2738f 1,1. These equal the report's table.
- **Skill calls.** Listing T's `tool_use` records named Skill from line 27230 to 28437 gives 21 calls, with the line numbers, times and arguments the report's row 10 gives.
- **Timeline.** The first and last timestamp and the `model` of each of the 10 `subagents/agent-<id>.jsonl` files equal the timeline table row for row, all `claude-sonnet-5-5`. T holds exactly 10 Agent calls between 15:50:08 and 16:11:58.
- **Landings.** For the landings of plan 5 step 1 and plan 3 step 2, `land.sh`'s calls printed `2026-10-12T15:53:52Z` and `2026-10-12T15:57:08Z`. For the other two, the wip commits printed `Date: Mon Oct 12 18:14:24 2026 +0200` and `18:15:37 +0200`. In the scratch `git reflog --date=iso-strict`, the four landing commits sit at 17:54:54, 17:57:41, 18:15:18 and 18:16:06 +02:00, with no commit between each cherry-pick and its commit. Between each landing's `land.sh` call and its commit, T holds Bash calls only, no Skill or Agent call.
- **Cost.** Rerunning `python3 ~/.local/share/ordo-stable/skills/plan-orchestration/templates/plan_cost.py .scratch/<plan>` in the scratch repository exited 0 for both plans, and `diff` against each `closing.md` copy printed nothing.
- **Choices file.** `cat .scratch/choices.md` in the scratch repository printed `cat: .scratch/choices.md: No such file or directory`.

## Verdicts, conditions 1 to 11

1. **Holds.** T line 27517 (15:49:10), `spec 5 1`, is the first `/spec`. f10ad2a, which opens plan 3, comes before 9736cff. `git show 989d581:docs/roadmap.md` lists `## 5.` before `## 3.`.
2. **Holds.** The launch commits 87d13fc (17:50:18 +02:00) and 7a0a3f6 (17:51:58 +02:00) both come before 1d789a9 (17:54:54 +02:00).
3. **Holds.** At T 27590 (result 27591) the session read plan 5 step 1's paths (`docs/guide.md` lines 3-3). At 27614 (result 27615) it deleted the brief, printed `plan.md unchanged`, and ran `ls .agents/worktrees`, which showed only plan 5's worktree. No scratch commit falls between 87d13fc and f2145b1. Plan 3's step 1 was prepared only in aaa430c, after 1d789a9.
4. **Holds.** Plan 3 step 2 was launched in 7a0a3f6, where the count is 1 and 1, while plan 3 step 1 waited.
5. **Holds.** The counts at the launch commits are 1, 2, 1, 2. `spec 5 2` (T 27828) is the first Skill call after 1d789a9, and `spec 3 1` (T 27963) comes after 5c00750. The slot plan 5 step 2 held while its `/spec` ran is in no dispatch block; see Behaviour 1.
6. **Holds.** See the landings check above.
7. **Holds as worded.** Plan 3's `plan.md` copy line 75 names the rewrite, and lines 80 and 81 quote the command and `PASS: docs/guide.md`. The order that made this possible came from the orchestrator holding a landing against the installed text; see Spec 1.
8. **Holds.** `2-run/report.md` lines 3 and 7 are the position lines. The open items on lines 5 and 9 are each found verbatim in their own plan's state file by `grep -c -F`, 1 hit each.
9. **Holds.** The stop before the second setup commit was ruled `(a)` by the user at T 27313 (15:45:34), before the run proper, and the report discloses it. The only later user-role text is T 28274, which is `isMeta: true` (the wakeup prompt). The landing hold was a choice that was never booked; see Spec 1.
10. **Holds.** All 21 Skill calls are in T. The pin read `ea0add9` at T 27227 (15:42:30), at T 28470 (16:17:48) and in my Verify 4.
11. **Holds.** This review ran with the scratch repository in place (`git worktree list` there prints only `2i-run 9907c22 [main]`).

Scratch setup:

- **`git init -b main`, one branch, no Ordo history: holds.** `git branch -a` prints `* main`. The root commit is a1525e9, and `git rev-list --all | wc -l` prints `21`.
- **`.agents/plan.yaml`: holds.** A `diff` against the template differs only in `worker`, `reviewer`, `libraries`, `workers_at_once: 2`, `self_rule: on` and `repair_reviewer`. `next_entry: off` is the template default.
- **`.gitignore`: holds.** It contains `.agents/worktrees/`.
- **Change standard and prose standard: holds.** The ruled sentence is at `docs/dev/change-standard.md:76`. The only angle-bracket tokens left are `<REDACTED>` and `<file>`, which are literal text.
- **`docs/dev/building.md`: holds.** At a1525e9 it holds one paragraph and one `sh` command.
- **`docs/guide.md`: holds.** At a1525e9 it holds the title and two sentences.
- **`docs/roadmap.md`: holds.** Entry 5 comes first. Each entry has `- Status: [ ]`, a two-sentence goal and the ruled gate (989d581).
- **Rulings files: hold.** Each holds one bullet ending "(the user)." that quotes both rulings with their date and their place in Ordo's `plan.md`. Plan 5's step 2 sub-bullet carries the script's computation, and plan 3's file has "Could run in parallel: 1 with 2".
- **One setup commit: holds, with the ruled second commit.** a1525e9 is the setup commit, and 989d581 is the second setup commit the ruling "the scratch gates that could pass without their goals" orders.

Record:

- **`2-run/` copies: hold.** 28 of 28 equal (cmp). The `.txt.md` names are a stated deviation.
- **`building.md` copy: holds.** It equals the scratch file (cmp), named `building.md.txt.md`; the name is stated.
- **`git-log.txt`: holds.** It equals the scratch log with each tab written as a space; this is stated.
- **`report.md`: holds as a copy.** It equals the scratchpad `run-report.md`. It was not the run's final message; see Spec 4.
- **`2-report.md`: partial.** Every part is present except "The files with line counts", which gives a count only for `git-log.txt`; see Spec 3.
- **The run's agents in `plan.md`: not applicable.** They are written at landing.
- **`rm -r` of the scratch repository: not applicable.** It happens at landing.

## Verdicts, cases

1. **First `/spec` is plan 5's step 1: met.** T 27517.
2. **Plan 3's step 1 waits on `docs/guide.md`: met.** T 27590 to 27615. The record under `2-run/` holds no trace of this wait; the evidence is T and the scratchpad's `run-notes.txt` line 1.
3. **Plan 3's step 2 beside plan 5's step 1: met.** The count at 7a0a3f6 is 2.
4. **Plan 5's step 2 takes the freed slot, beside plan 3's step 2: partial.** Its `/spec` started at 15:55:21 while plan 3's step 2 was in flight. Its launch, 9534017 at 18:03:11 +02:00, came after plan 3 step 2 landed (5c00750, 17:57:41) and after plan 3 step 1 launched (3938710, 18:00:22). So it was never in flight beside plan 3's step 2. Plan 3 step 1 had no `/spec` until 5c00750: met.
5. **Plan 3's first landing after plan 5's step 2 runs the new command: met.** Copy lines 75 to 82. The order came from an orchestrator hold; see Spec 1.
6. **Both closings wait on their roadmap diffs, and the one report lists them: met.** 24c3280 and 9907c22, and `report.md` lines 3 to 9.
7. **No open item outside the six kinds, no question to the user: met.** The unbooked hold choice is covered in Spec 1.

## Spec

**1. The report gives the wrong rule for the landing order, and the hold that broke the stated order is not reported as a deviation.**
- **Place:** `2-report.md:141`, finding 5, "the order of two landings ready at once is not stated ... plan 3's step 1 was refuted at 16:03:40 and held until 9374825 landed". Also lines 148, 11 ("No case is one the brief's own rules get wrong") and 17.
- **What the installed text says:** `~/.local/share/ordo-stable/skills/plan-orchestration/SKILL.md:318` reads "Landings are one at a time across all plans, in the order the steps are verified." Steps 8 says that after the rounds "the loop goes to step 9", which is `/land`.
- **What happened:**
  - Plan 3 step 1's reviewer finished at 16:02:55 (`agent-a0dfcb46f7a99aa64.jsonl`).
  - At 16:03:40 plan 5 step 2 was not ready to land. Its builder started at 16:02:57, its review ran 16:07:25 to 16:09:40, and the review over round 1 ended at 16:13:53. So two landings were never ready at once.
  - At T 28141 (16:03:39) the orchestrator wrote "I have not landed this step yet, on purpose. Condition 7 needs..." and "Holding plan 3's step 1 until plan 5's step 2 lands is my choice as orchestrator. The skills do not say what order landings take".
- **What is wrong:**
  - The hold departs from line 318 and from Steps 8.
  - The choice is booked nowhere: there is no scratch `choices.md`, and `report.md:55` says "None".
  - The cases' first run (scratchpad `2-cases-first-run.md` line 9) assumed this order without checking it against line 318. Under the brief's line 109 rule, the builder stops when the first run finds a case the brief's rules get wrong. That stop was due either before the run or at 16:03.
- **Failure scenario:** A reader of the report concludes that `plan-orchestration` is silent on landing order and that the run's ordering was the skills' own. They then propose or accept a text change for a rule that already exists. They also take condition 7 as evidence that the installed loop by itself sends the new command to the other plan's next landing. What the run actually shows is that the `land` Steps 2 rewrite works once the order is arranged by hand. Following line 318, plan 3 would have landed first, and condition 7 would have been NOT DONE.

**2. Case 4 is partial, and the report does not say so.**
- **Place:** `2-report.md:31` (row 5, DONE) and line 16.
- **What happened:** The brief's case 4 (brief line 99) asks for plan 5's step 2 "beside plan 3's step 2". The counts the report itself gives show plan 5 step 2's launch, 9534017, beside plan 3's step 1, not its step 2.
- **Failure scenario:** The gate reviewer reads every case as met and does not see that plan 5's step 2 never ran beside plan 3's step 2. The three-in-sequence shape the brief designed was not exercised.

**3. "The files with line counts" gives no line counts.**
- **Place:** `2-report.md:126-127`.
- **What is wrong:** It gives `git-log.txt (108 lines)` and nothing for the other 30 record files or for `2-report.md`, which `wc -l` gives as 155. The brief's Report bullet "The files with line counts" asks for them.
- **Failure scenario:** The booking at landing has no per-file sizes to quote. A reader cannot tell an empty copy, such as the two `.gitkeep.txt.md`, from a truncated one without rerunning `wc`.

**4. The run's one report was not the run's final message.**
- **Place:** brief "The run" 3, "Its final message is the run's one report", against T 28475 (16:18:09, a Write of `run-report.md`) and the session's later text at T 28621.
- **What is wrong:** The report was written as a file, and the session's message after the run was a different summary. The step report does not state this deviation.
- **Failure scenario:** A reader takes `2-run/report.md` to be the message the orchestrator ended the run with, the shape D24 governs. In fact it was a file composed for the record. Low severity, since the content meets D24.

## Proof

**1. The evidence cited for the roadmap order does not show the order.**
- **Place:** `2-report.md:27`, row 1, "The scratch roadmap lists entry 5 before entry 3 (`2-run/.scratch/5-.../plan.md.txt.md` and the roadmap diff in `2-run/report.md`)".
- **What is wrong:** Neither file shows the order. The plan copy holds one entry, and the diff hunks `@@ entry 5 @@` and `@@ entry 3 @@` carry no positions. Only `git show 989d581:docs/roadmap.md` in the scratch repository shows it, and that repository is removed at landing.
- **Failure scenario:** After the landing's `rm -r`, nothing in the record supports condition 1's premise, and a later reviewer cannot check it.

**2. The first `plan 3` call did not stop on the open item.**
- **Place:** `2-report.md:39`, "The first two `plan 3` calls (15:42:33 and 15:42:38) stopped on the open item".
- **What happened:** The call at T 27230 was re-invoked at T 27241, 5 s later, with no tool call between them. Only the second ran and stopped (T 27248, then 27257 at 15:43:42). No decision rests on this.

**3. The time of plan 3 step 1's review is not when the reviewer finished.**
- **Place:** `2-report.md:141`, "refuted at 16:03:40".
- **What happened:** The reviewer's transcript ends at 16:02:55. 16:03:40 is when the report was saved (`run-notes.txt` line 7). This only matters through Spec 1.

All other counts, times, line numbers and paths I checked reproduce: rows 2 to 10, the timeline, landings, counts and cost tables, line 75 and line 81 of plan 3's copy, and the 31 files.

## Standards

**1. Code fences carry no language tag.**
- **Place:** `2-report.md:84`, `:94` and `:105`, each an opening "```" with no tag.
- **Rule broken:** `prose-standard.md` F, "code fences carry a language tag".
- **Failure scenario:** A reader copying the fence gets no hint whether it is a shell transcript or plain output. This is low severity.

**2. Quoted evidence is shortened with "...".**
- **Place:**
  - `2-report.md:29`, the quote of `run-notes.txt` with "...".
  - `2-report.md:120`, Verify 3 given as `.../2-run/.../plan.md.txt.md:81:  PASS: docs/guide.md`, one of 40 lines printed.
  - Rows 27 and 33, which shorten paths.
- **Rule broken:** The brief's Report says "A line shortened with '...' is not verbatim", and its Conventions say "A line the record quotes from a command is verbatim".
- **Failure scenario:** A reader rerunning Verify 3 gets 40 lines where the report shows one shortened line, and has to work out which one was meant.

**3. Sentences run well past the sentence-length rule.**
- **Place:**
  - `2-report.md:154`: "A `.txt` copy of a scratch `plan.md` fails the character-set check, which allows the tick glyph only in a file whose name ends `.md`: run on a copy named `plan.md.txt`, the check printed its lines 19 and 20 (...), and on a copy named `plan.md.txt.md` it printed nothing." This is about 55 words.
  - Line 141 has a sentence of about 35 words.
- **Rule broken:** `prose-standard.md` E, under roughly 20 words unless the mechanism needs more. The report's Verify 5 covers only the table cells.

No non-ASCII outside the allowed glyph (Verify 1). No history in the text: line 39 states end-state facts the gate needs.

## Behaviour

**1. A finding the run produced is missing from the report: the texts count and compare only dispatch blocks, so a step still in `/spec` is invisible to a concurrent `/spec`.**
- **Place:** installed `spec/SKILL.md` "What it reads" 3 and Steps 5, and `plan-orchestration/SKILL.md:300`.
- **Text:** The limit is "counted over the dispatch blocks of every open plan". Steps 5 compares "with the brief of every other step in flight in the dispatch block of every open plan".
- **What happened:**
  - `/spec 5 2` ran from 15:55:21 to its preparation commit at 16:02:43 (T 27828 to 28096). It compared paths only with plan 3 step 2 (T 27854, "No shared path with plan 3's step 2").
  - Inside that window, the session ran `/land 3 2` (T 27871) and the whole of `/spec 3 1` (T 27963, with commits aaa430c and 3938710).
  - By the text, `/spec 3 1` saw no step in flight; `run-notes.txt` line 4 records "in flight at launch: 1 (plan 5 step 2 still in /spec)". The orchestrator counted plan 5 step 2 as holding a slot and read its uncommitted brief's paths (T 27997, `grep -n 'Paths this step writes' -A4 .scratch/5-*/agents/briefs/2.md`). Neither action is in the text.
  - Plan 5 step 2's `/spec` never compared with plan 3 step 1's brief, although plan 3 step 1 was dispatched before plan 5 step 2's commit.
- **Failure scenario:**
  - With a third unblocked step, an orchestrator following the texts would count 0 in flight at 15:59 and could `/spec` and dispatch two steps beside plan 5 step 2's pending `/spec`, which makes three in flight against `workers_at_once: 2`.
  - Two steps that share a file can be dispatched without either `/spec` comparing them, which is the failure D17 and ADR 0011 exist to prevent.
  - The texts are also silent on whether one `/spec` may be suspended across other skills and commits while its brief check runs.

**2. A smaller silence is also missing from the report.**
- **Place:** `plan-orchestration` "Reports".
- **What happened:** The position-line form "Next: step <k+1>, <step name>." has no form for a plan at its last step. The run wrote "Next: the closing's roadmap diff, then the entry commit and the move of the folder, after the user's ruling." (`report.md:3` and `:7`).
- **Failure scenario:** Different sessions word the line differently for a plan at its closing. This is low severity.

No change outside the ledger: the worktree diff and status are empty, and main's untracked files are the two record paths.

Judgment of the report's "Findings of the run":

- **Finding 1: borne out, with an omission.** The builder of plan 3 step 1 was told by the orchestrator's prompt to use `printf` (T 28010, "give it the file list another way (for example `printf '%s\0' ...`"). The builders of plan 5 step 1, plan 3 step 2 and plan 5 step 2 were not told, and their prompts contain no `printf`.
- **Finding 2: borne out.** Plan 5's `plan.md` copy line 63.
- **Finding 3: borne out.** Plan 3's copy line 64.
- **Finding 4: borne out.** Plan 3's copy lines 25 to 27 and 35.
- **Finding 5: not borne out.** See Spec 1.
- **Finding 6: borne out.** Plan 5's copy lines 78 and 81.
- **Finding 7: borne out.** T 28231.
- **Finding 8: borne out.** Plan 3's `1-refuter` copy line 96.

## Declined to judge

- The quality of the scratch deliverables (`tests/guide.test.sh`, `docs/faq.md`, the guide sentences) and of the scratch builders' and reviewers' reports. They are inputs to the run, not this step's work.
- Whether each of the ten brief-check findings of plan 5 step 2, and the three round-1 findings, was closed correctly. I did not read those reports in full.
- Whether ADR 0012's `git diff --cached --name-only --no-renames` was the source of each landing commit's path list. I checked only that every skill commit command in the run names its paths after ` -- ` (T 27809, 27901, 27997, 28096, 28345, 28381 and the rest). The paths were typed in the commands, and I did not compare them against `--no-renames` output.
- Verify 5, sentence by sentence over the whole report. I spot-checked the lines named under Standards 3.
- The round-1 start time "16:10:33" in the timeline, beyond `run-notes.txt` line 10 and the SendMessage at T 28219 (16:10:27).

## Usage

About 230k tokens, 52 tool uses, about 30 minutes (estimates; the runner's figures are not available to me).
