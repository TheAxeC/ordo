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

## Repair round 1, refuted

I changed nothing in Ordo, its worktrees, the scratch repository or the ledger. I started no agent and invoked no skill. `T` is the session transcript `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl`. The reports are under `.scratch/2-i-several-plans-in-one-session/agents/reviews/`, and a report line is `2-report.md:<n>`.

### Verification (rerun from Ordo's root, verbatim)

Verify 1: the last `verify` command of the state file's configuration block, over `git ls-files -coz --exclude-standard -- <2-run> <2-report.md>`, then `echo "exit $?"`:

```text
exit 0
```

It printed no other line. The same `git ls-files ... | tr '\0' '\n' | wc -l` printed `34`, so the 33 record files and the report were checked.

Verify 2: `find .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run -type f ! -name '*.txt.md' ! -name git-log.txt ! -name report.md; echo "exit $?"`:

```text
exit 0
```

It printed no path.

Verify 3: `grep -rn 'PASS: docs/guide.md' .scratch/2-i-several-plans-in-one-session/agents/reviews/2-run | wc -l` printed `44`, which equals `2-report.md:125`. The three lines in plan 3's copies:

```text
.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md.txt.md:69:- Verified: `checks.sh` on main printed `PASS: docs/guide.md` and `checks: 2 commands passed`.
.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/plan.md.txt.md:81:  PASS: docs/guide.md
.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-landing.md.txt.md:29:PASS: docs/guide.md
```

Verify 4:

```text
$ git -C ~/.local/share/ordo-stable log --oneline -1
ea0add9 Book the review of C36 to C39 and the rulings on step 2 and ADR 0012
$ git -C ~/.local/share/ordo-stable describe --tags
v6.0.0-rc.1
```

Verify 5 is under Standards 2 below.

Other reruns:
- **Worktree and main.** In the step's worktree, `git diff c93adae` and `git status --short` print nothing (exit 0 each). On main, `git status --short` lists only `?? .../2-report.md` and `?? .../2-run/`. `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1.
- **New record files.** `git show 989d581:docs/roadmap.md | cmp - 2-run/roadmap.md.txt.md` is identical, and so is `cmp <scratchpad>/run-notes.txt 2-run/run-notes.txt.md`. In the roadmap, `grep -n '^## '` gives `21:## 5. The guide's install line and its test` and `28:## 3. The guide's usage line and its FAQ`, as row 1 says.
- **Other copies.** All 28 files under the scratch `.scratch/` equal their `.txt.md` copies by `cmp`. `docs/dev/building.md`, `git-log.txt` (with tabs turned to spaces) and `run-report.md` equal `report.md`.
- **Line-count list.** `wc -l` over the 33 record files plus the report matches the report's list of 34 entries line for line (diff only in padding). `2-report.md` is 197 lines.
- **Run notes quote.** `grep -cF` of `run-notes.txt.md` line 1 against `2-report.md` printed `1`, so row 3's quote is whole and verbatim.
- **Cost and booking tables.** Every line of the two cost tables is a whole line of its `closing.md.txt.md` copy (`grep -cxF` printed 1 each). The three booking lines at 90 to 92 are whole lines of plan 3's `plan.md.txt.md`.
- **T lines and times.**
  - T 27854 reads "No shared path with plan 3's step 2 (`docs/faq.md`)..." (15:56:13).
  - T 27997 is `grep -n 'Paths this step writes' -A4 .scratch/5-*/agents/briefs/2.md` (15:59:48).
  - T 28010 is the plan 3 step 1 builder prompt, and it contains `printf '%s\0'`.
  - T 28475 is the Write of `run-report.md` (16:18:09); T 28621 is a different summary text (16:22:18).
  - Neither line 27231 to 27240 nor anything between T 27230 and 27241 holds a tool call.
  - The reviewers' last handback results are at 16:02:55 (`a0dfcb46f7a99aa64`) and 16:13:53 (`a23e65e6307fe3c6a`).
- **Skill calls.** 21 Skill calls from 27230 to 28437, with the lines and times of row 10.
- **Installed text.** `plan-orchestration/SKILL.md` line 318 reads "Landings are one at a time across all plans, in the order the steps are verified." Steps 8 ends "the loop goes to step 9", and step 9 is `/land`. Line 300 is the "limit" bullet, "counted over the dispatch blocks of every open plan".
- **Scratch git.** The launch-commit counts (plan 3, plan 5) are 87d13fc 0,1; 7a0a3f6 1,1; 3938710 1,0; 9534017 1,1; 6a2738f 1,1. At aaa430c and 5c00750 they are 0,0. Commit times in UTC match every time the report gives (2d68984 16:02:43, 9534017 16:03:11, 3938710 16:00:22, 5c00750 15:57:41, 9374825 16:15:18, cad4c19 16:16:06).
- **Pre-round claims in the wrong-or-impossible section.** A tick-glyph check run on stdin for each plan copy printed lines 19 and 20 only, reproducing the `.txt` claim without writing a file.
- **Not rerun.** I did not rerun the cost script this round. The cherry-pick times 16:14:24 and 16:15:37 were found in T, and the 15:53:52Z and 15:57:08Z `land.sh` lines are in T.

### Verdicts, conditions 1 to 11

1. **Holds.** T 27517 (15:49:10) is the first `/spec`, `spec 5 1`. Roadmap copy lines 21 and 28 show entry 5 before entry 3. f10ad2a (opens plan 3) comes before 9736cff.
2. **Holds.** 87d13fc and 7a0a3f6 come before 1d789a9.
3. **Holds.** The T 27590 to 27615 reads, run notes line 1, and no scratch commit between 87d13fc and f2145b1 (`git-log.txt`). Plan 3's step 1 was prepared in aaa430c, after 1d789a9.
4. **Holds.** 7a0a3f6 counts 1,1 while plan 3's step 1 waited.
5. **Holds.** Counts are 1, 2, 1, 2. `spec 5 2` (T 27828) is the first Skill call after 1d789a9. `spec 3 1` (T 27963) comes after 5c00750. Proof 3 below is a low note on the count.
6. **Holds.** The four land calls and their next Skill calls are as row 6 lists. Between each cherry-pick and its commit I found no commit or Skill call.
7. **Holds as worded, against the goal only through a departure.** `plan.md.txt.md` lines 75, 80 and 81 give the rewrite, the command and `PASS: docs/guide.md`. The ordering that made it possible is the hold of line 318, which the report now states (line 5, row 7, finding 5). The Spec finding that the first review raised is closed in this respect (closure 1). Whether a DONE-as-worded result satisfies the gate is the orchestrator's call, see Declined to judge.
8. **Holds.** `2-run/report.md` lines 3 and 7 are the position lines. Lines 5 and 9 are found verbatim in the plans' state files (1 hit each).
9. **Holds as worded.** Nothing was asked, and the stop before the second setup commit was ruled (a) at T 27313 before the run. The unbooked hold is disclosed in row 9 and line 24.
10. **Holds.** 21 of 21 Skill calls are in T. The pin read `ea0add9` at T 27227 and 28470, and again in my Verify 4.
11. **Holds.** The first review (a4f34743273779a48) ran with the scratch repository in place. It is still in place for this run: `git rev-parse --show-toplevel` prints `.../scratchpad/2i-run` and `git log` there ends at 9907c22.

Scratch setup:
- **`git init -b main`: holds.** One branch, `main`; 21 commits in `rev-list --all`; the single root commit is a1525e9.
- **`.agents/plan.yaml`: holds.** It differs from the template only in worker, reviewer, libraries, `workers_at_once: 2`, `self_rule: on` and `repair_reviewer`. `next_entry: off` is the default.
- **`.gitignore`: holds.**
- **Change standard and prose standard: hold.** The ruled sentence is at `docs/dev/change-standard.md:76`.
- **`docs/dev/building.md` and `docs/guide.md`: hold.** The guide has the title and two sentences.
- **Roadmap: holds.** Entry 5 comes first, with the gates from 989d581.
- **Rulings files: hold.** Each has one bullet naming the ruling and its step list. The parallel line is "1 with 2" for plan 3 and "none; step 2 follows step 1" for plan 5.
- **Setup commits: hold.** a1525e9 is the set-up commit, and 989d581 is the ruled second commit.

Record:
- **`2-run/` copies: hold.** 28 of 28, plus `building.md.txt.md`, `git-log.txt`, `report.md`, `roadmap.md.txt.md` and `run-notes.txt.md` (33 files).
- **`2-report.md`: partial.** Every part and the line counts are present. Proof 1 and Proof 2 are false statements in it.
- **The agents in `plan.md`, and `rm -r` of the scratch repository: not applicable.** Both happen at landing.

### Verdicts, cases

1. **First `/spec` is plan 5's step 1: met.** T 27517.
2. **Plan 3's step 1 waits on `docs/guide.md`: met.** T 27590 to 27615, and `run-notes.txt.md` line 1, which is now in the record.
3. **Plan 3's step 2 beside plan 5's step 1: met.** 7a0a3f6 counts 2.
4. **Plan 5's step 2 takes the freed slot beside plan 3's step 2: partial, and the report says so.** Its launch 9534017 (16:03:11) came after plan 3's step 2 landed (5c00750, 15:57:41) and after plan 3's step 1 launched (3938710, 16:00:22). Plan 3's step 1 got no `/spec` until 5c00750: met.
5. **Plan 3's first landing after plan 5's step 2 runs the new command: met, through the hold.** Under line 318 it would be unmet (Spec section of the first review, now stated in the report).
6. **Both closings wait on their roadmap diffs, and the one report lists them: met.** Commits 24c3280 and 9907c22.
7. **No open item outside the six kinds, no question: met.** The unbooked hold is disclosed.

### 1. Spec

None new. Two wording points:

- **`2-report.md:3-6`:** "Conditions 1 to 11 hold as worded. Two of them rest on less than the installed texts:". The second bullet is Case 4, a case, and case 4 is a partial about the order of launches, not about resting on less than a text. What is wrong: the lead sentence counts a case as a condition. Failure scenario: a reader counts two conditions short of their texts, looks for a second condition, and finds none. Verdict: no item changes (condition 5 holds as worded).
- **`2-report.md:21`:** it presents "plan 5's step 2 takes the slot plan 5's step 1 frees, beside plan 3's step 2" as what the first reading said. The scratchpad `2-cases-first-run.md` line 8 says only "its step 2 takes the slot". The words "beside plan 3's step 2" are the brief's case 4, not the reading's. Failure scenario: a reader concludes the reading anticipated plan 3's step 2 still in flight, when the reading did not check it. Verdict: none.

### 2. Proof

1. **`2-report.md:176`, finding 1:** "Every builder of the run fed the file list with `printf` instead. The orchestrator's prompt told plan 3's step 1 builder to do so (`T` line 28010); the builders of plan 5's step 1, plan 3's step 2 and plan 5's step 2 chose it themselves."
   - What is wrong: the briefs of plan 3's step 2 and plan 5's step 2 already write the `printf` form. `2-run/.scratch/3-the-guide-s-usage-line-and-its-faq/agents/briefs/2.md.txt.md:76` reads "The character-set check of the verify list over the file the step writes: `printf 'docs/faq.md\0' | xargs -0 perl ...`". `2-run/.scratch/5-the-guide-s-install-line-and-its-test/agents/briefs/2.md.txt.md:113` reads the same with `printf`. Those two builders followed their briefs and chose nothing. Only the plan 5 step 1 builder chose it (its report `1-report.md.txt.md:39`), and the plan 3 step 1 builder was told by the prompt. The briefs of plan 3's and plan 5's step 1 have `git ls-files`.
   - The decision that rests on it: the finding asks for a skill-text change on how a verify command that starts with git is given to a builder who runs no git, and "instead" and "chose it themselves" change who is the actor.
   - Failure scenario: a reader proposes teaching builders not to improvise, when two of four were given the form by briefs written after the orchestrator met the gap (run notes line 2, 15:51:06Z, before `/spec 3 2` at 15:51:11).
   - Verdict: closure 13 does not hold. The ruling's sentence was copied from the first review, which checked the builders' prompts only.
2. **`2-report.md:131`:** "The two `.gitkeep` copies are empty, as their sources are." `find 2-run -name '.gitkeep*' | wc -l` prints `4`, and four files show `0 lines` in the report's own list (lines 133, 136, 146, 150). Also, the same paragraph says "`wc -l` of each file under `agents/reviews/`", but the list holds only `2-run/` and `2-report.md`, and `agents/reviews/` also holds `1-report.md`, `1-refuter.md` and others. Failure scenario: a reader checking for a truncated copy expects two empty files and finds four, or looks for the other files' counts. Verdict: closure 3 holds for the list but the two sentences around it are false.
3. **`2-report.md:80` and row 5:** the third launch commit 3938710 is counted `1` and row 5 says "Counts below: 1, 2, 1, 2". Finding 9 and run notes line 4 say plan 5's step 2 held a slot in `/spec` at that moment, so the real count was 2 and under the limit. The table says it counts dispatch entries and finding 9 discloses the gap, but row 5 and the table do not point to finding 9. Failure scenario: a reader reading row 5 alone takes the 1 as the number in flight. Verdict: none (low).

### 3. Standards

1. **Lines cited for a skill's text.** `2-report.md:5`, `:22`, `:38`, `:180` cite "line 318" and `:184` cites "line 300" of the installed `plan-orchestration` `SKILL.md`. The template header and `docs/dev/change-standard.md`, "Where the work happens", say a ledger file cites a skill's text by its section, never by line. The sections are "Two steps in flight", the bullet "Landings are one at a time...", and the bullet "The limit." The round brief's ruling 1 names line 318, so the report followed the ruling, but the standard stands. Failure scenario: after the next pin the line numbers point at other text. Verdict: none (low).
2. **Sentence length and the Verify 5 line.**
   - The round split the two sentences the first review named. The same rule (`prose-standard.md` E, "under roughly 20 words") is still broken. I counted words with inline code reduced to one token. Sentences of 32 words or more remain at `2-report.md:21` (32), `:22` (39), `:127` (44), `:176` (43 and 34), `:177` (32), `:181` (33) and `:183` (45). Lines 21 and 22 are text written in this round.
   - Prose lines outside tables and code hold 10 semicolons in about 2100 words, against `prose-standard.md` B, "at most 2 per 1000 words".
   - `:127` Verify 5 says "Each list item and sentence of this report was read against the prose standard's rules on list items and sentence length". Its own sentence is the longest one.
   - Failure scenario: the reviewer of the landing reads Verify 5 as a check that sentence length holds, and it does not. Verdict: closure 10 is partial.
3. **`2-report.md:190`:** "each was closed by a change to the brief before the preparation commit, named under the report's Closed heading." This report has no Closed heading. The heading is in plan 5's `2-brief-check.md.txt.md:139`. Failure scenario: a reader looks for it here. Verdict: none (low).

Other standard checks: no non-ASCII (Verify 1), no em dash, no `...` anywhere in the report (`grep -n '\.\.\.'` prints nothing), no double blank line, all three fences tagged `text` (89, 99, 110), no hard wraps.

### 4. Behaviour

None. The report says "None in Ordo outside the ledger", and the worktree diff, the worktree status and main's status confirm it.

### Closure check of findings 1 to 13

1. Holds. Line 5, row 7, finding 5, the cases section (line 22) and the judgment calls (line 189) carry the ruling. Line 318 is quoted exactly, and 16:02:55 and 16:13:53 reproduce. The sentence "lands at about 16:04" is an estimate, labelled "about".
2. Holds. Case 4 is partial at line 21, and the times reproduce. Row 4 is unchanged.
3. Holds for the list, which equals `wc -l`. Two sentences next to it are false (Proof 2).
4. Holds at line 196. T 28475 and T 28621 reproduce.
5. Holds. `2-run/roadmap.md.txt.md` equals `git show 989d581:docs/roadmap.md` and row 1 gives lines 21 and 28.
6. Holds at line 44. T 27230 and 27241 are 5 s apart with no tool call between, and the second stopped.
7. Holds. 16:02:55 is the reviewer's end and 16:03:40 is the save, in finding 5.
8. Holds. Three fences are tagged `text`.
9. Holds. There is no `...` in the report, `run-notes.txt.md` is in the record and row 3 quotes its line 1 whole.
10. Partial. The two named sentences are split, but the same rule is still broken elsewhere (Standards 2).
11. Holds. Finding 9 reproduces: T 27828 to 28096, 27854, 27871, 27963, 27997, aaa430c, 3938710, 2d68984, and run notes line 4.
12. Holds. Finding 10 reproduces; `2-run/report.md` lines 3 and 7 hold the quoted form.
13. Does not hold in substance. The sentence is in the report as ruled, but it is false for two of the three builders (Proof 1).

### Declined to judge

- The report as it stood before the round: no copy was kept. I compared the whole current report against the first review's quoted places and the round brief's 13 changes. A change outside those 13 that touched no quoted place cannot be compared, so I cannot say whether a sentence the round added beyond them exists, apart from the text I found new in lines 3 to 6, 21, 22 and 184.
- Whether "DONE as worded, through a hold against the text" for condition 7 satisfies the gate is for the orchestrator or the user. The step shows `land` Steps 2's rewrite works once the order is arranged by hand, and shows nothing about the loop's own order.
- The cost script was not rerun this round, and I did not re-reread the scratch builders' and reviewers' reports or the scratch deliverables.
- ADR 0012's `--no-renames` as the source of each commit's path list; T 28381 shows one command with it, and I did not read the other three.
- The agent timeline, landing times for plan 5's step 2 and plan 3's step 1 (derived from wip commit dates in T), and `git worktree list` inside the scratch repository for row 11.
- Words per sentence: counted by a rough split over the prose lines; table cells were not counted.

Reviewer usage: agent id not known to me; served model claude-sonnet-5-5; about 170k tokens, 38 tool uses, about 25 minutes (estimates; the runner's figures are not available to me).

## Closed

The first run's findings, closed in repair round 1 (`agents/briefs/2-round-1.md`, f2992ed), as the run over the round checked them:

- Spec 1: the report now states the landing order of `plan-orchestration` "Two steps in flight" and the unbooked hold (round finding 1, holds). What it leaves, condition 7 shown only through a hold against the text, goes to the user as the open item "Step 2, condition 7 shown only through a hold" at landing, with Behaviour 1 as a defect of the texts.
- Spec 2, Spec 3, Spec 4, Proof 1, Proof 2, Proof 3, Standards 1, Behaviour 1 and Behaviour 2: closed in round 1 (round findings 2 to 9, 11 and 12, each holds).
- Standards 2 and Standards 3: closed in round 1 in part (round findings 9 and 10); the sentences the run over the round still names are fixed at landing.
- The note on run finding 1: the round's sentence was wrong for two builders (round finding 13, does not hold); fixed at landing.

The run over round 1, its findings fixed at landing on main, each small and inside the brief:

- Spec, lines 3 to 6: the lead counts case 4 as a condition; fixed at landing.
- Spec, line 21: the reading's words and the brief's case 4 run together; fixed at landing.
- Proof 1, run finding 1: the briefs of plan 3's step 2 and plan 5's step 2 gave the `printf` form; only plan 5's step 1 builder chose it, and plan 3's step 1 builder was told by the prompt; fixed at landing.
- Proof 2: four empty `.gitkeep` copies, and the list's scope sentence; fixed at landing.
- Proof 3: row 5 and the in-flight table point at finding 9; fixed at landing.
- Standards 1: a skill's text is cited by its section, not its line; fixed at landing.
- Standards 2: the long sentences, the semicolons and Verify 5's line; fixed at landing.
- Standards 3: the Closed heading named is plan 5's brief check's; fixed at landing.
