# Step 5 refuter report (on the main checkout /Users/axelfaes/workspace/ordo, uncommitted change against 847807c; worktree .agents/worktrees/2ea-5 at base 3c6119e)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

Where the step is. `git -C .agents/worktrees/2ea-5 status --short` prints nothing, and that worktree's head is 3c6119e. In the main checkout, `git status --short` prints the six paths of the brief and nothing else: ` M .scratch/2-f-diagnose/plan.md`, ` M .scratch/2-g-git-guard/plan.md`, ` M .scratch/2-h-session-retro/plan.md`, ` M .scratch/rulings/3-the-writing-base.md`, `?? .scratch/2-e-a-self-rule/agents/reviews/5-report.md`, `?? .scratch/archive/2-e-grill/agents/agent-roles.md`. `git diff --stat` gives +31, +20, +22 and +8 lines.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md   (from the main checkout's root)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 11 commands passed
(exit 0)

Verify 2, cases 1 and 2: python3 skills/plan-orchestration/templates/plan_cost.py <ledger>, each exit 0. Role tables, identical to the report's:
.scratch/archive/2-e-grill: builder 20, brief check 21, reviewer 20, reviewer over a round 17, Total 78 agents, >=146.48 USD (91 lines of output; 78 agent rows)
.scratch/2-f-diagnose:      builder 4, brief check 7, reviewer 4, reviewer over a round 4, Total 19, >=33.04
.scratch/2-g-git-guard:     builder 3, brief check 6, reviewer 4, reviewer over a round 2, Total 15, >=38.22
.scratch/2-h-session-retro: builder 4, brief check 5, reviewer 4, reviewer over a round 4, Total 17, >=27.03
Bullets parsed from the files (my parse of "- <id>: <role>, <model>" and "<n>. <id>: <what>, <model>"):
2.E 78 bullets + 66 items; 2.F 19 + 4; 2.G 15; 2.H 17; rulings file 3; duplicates over all 202 entries: none.

Verify 3, cases 3 and 4 (my own table of the 420 meta records and the completion notices found by <task-id>, in $TMPDIR/rv5):
Every "<n> tokens, <m> tool uses" pair of every Usage line of the four plans at HEAD (128 pairs) maps to exactly one agent, that agent is in the files, in the right plan and step, and the role word before the pair matches its listed role: "pairs 128", no MISMATCH line.
Each bullet with no booked pair (32: 2.E 9a's six, 2.F 2a/2b/3a's eleven, 2.G's seven, 2.H 3a's five, the rulings file's three) was placed by me from its tool_use prompt in the parent session file: each prompt names its plan and step (for example ac1981f7bc7d15672 "brief-check agent of the spec skill for step 9a of plan 2.E", aaf2a244958131899 "builder of step 2a of plan 2.F ... worktrees/2f-2a", a1c460a174ddbb16c "reviewer ... for step 1 of plan 2.G", notice status killed with no usage).

Verify 4:
$ cat <five files> .scratch/2-e-a-self-rule/plan.md | grep -o "^- a[0-9a-f]*" | sort | uniq -d
(nothing)
$ the same over copies in $TMPDIR with "- a9a57fb6f85b48b52: grill lookup, claude-opus-5-5" appended to the rulings-file copy
- a9a57fb6f85b48b52
$ ids of 2.E.A's plan.md and state file (24) found anywhere in the five files (bullets and items)
(nothing)
Case 9: per entry of the five files (202), the model with most non-<synthetic> assistant entries in its transcript (agent-<id>.jsonl, or <session id>.jsonl for a claude -p session) against the file's model: "checked 202 bad 0 multi []".
Case 10: records with a first timestamp in the report's window 2026-09-29T17:59:33Z to 2026-09-30T22:31:16Z: "179 27 206". Every record not in the five files, over all dates: before 2.E's opening only plan 2.C and 2.D agents and five design-conversation agents of 2026-09-29 16:30Z to 17:42Z; inside the window only e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8 and 2.E.A's three grill lookups; after 2.E.A's opening only 2.E.A's agents and the claude-code-guide a22b34da4ff11f1fa of 2026-10-01T02:35Z. No non-ordo project folder holds a session of the window tied to these plans (only research-hub settings sessions).

Verify 5:
$ LC_ALL=C grep -n '[^ -~]' <five files>
only the tick lines already on main: 2.F 21-22, 2.G 19-20, 2.H 27-29
$ { git diff -U0 | grep '^+'; cat agent-roles.md; } | LC_ALL=C grep -c '[^ -~]'
0
tabs 0 in each file; lines 151, 128, 94, 117, 33
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated in one point, Spec 1. Everything else in the item holds. The heading and paragraph are word for word as the brief gives them. There are 78 bullets in the bookings' step order (1, 2, 4, 5, 3, 6 to 12a, 9a, 14a to 14c), and within each step they run brief check, builder, reviewer, then over round 1. Each bullet is tied to its booking by figures or placed by its prompt. Step 9a's reverted run and step 3's trials are included. The numbered list holds 66 items, and each one I checked against its record is right: the scratch runs, probes, sides, judges, depth-2 agents and judges 5 and 6.
- 2: holds. Each of the three files has `## Agents` right before `## Blocked, and by what`, with the paragraph word for word. The bullets include the reverted and unlanded steps (2.F 2a, 2b, 3a; 2.G 2a, 2b; 2.H 3a) and 2.G step 1's stopped brief check and reviewer. 2.F also has the numbered list of step 4's sides and judges.
- 3: holds. The section is appended at the end with the paragraph word for word and three `grill lookup` bullets. On the timeline, session 3998c800 invokes `Skill grill 3` at line 171 (16:55:43Z), the Agent calls for a2cd8be14d77ebe85 and a9d12b91117bb4165 are at lines 235 and 236, and the one for ac071af1b2da2bf66 is at line 711. All three served claude-opus-5-5.
- 4: holds. Case 8's check finds no duplicate, the check with a planted duplicate prints it, and none of 2.E.A's 24 ids appears in the five files.

Cases of the brief's "Cases":

- 1: met. The script exits 0 and prints four role rows, and its Total of 78 equals the 78 bullets. The first run on the unchanged tree, quoted in the report, gave `error: the ledger names no agent`.
- 2: met. Exit 0 with Totals of 19, 15 and 17, equal to the bullets in each file.
- 3: met. The figure match gives each booked agent of each step and role, and each unbooked bullet is placed by its prompt. The report's table agrees with this row for row.
- 4: met. All 128 booked pairs tie to the right bullet, and every untied bullet is one of the agents named in case 3.
- 5: met. Step 3 has three builders (a4e5bce8772d0d657; afb733385e80a6b22, served claude-sonnet-5; ae2714d2e377ffba9) and three reviewers (a616958f65947f02b; a9101e85531b9f6e9 "Refute the Sonnet build of step 3"; af3f8a357a2c497f3 "Refute the Sonnet 5.5 build of step 3"), each matching the booking's trial figures.
- 6: met. Step 9a's seven scratch runs (69504/9 down to 53872/7, inside the booked range) and step 14's sides, judges and depth-2 agents are numbered items, and the cost script counts 78 agents for 2.E, not 144.
- 7: met. Items 45-47 and 61-62 of `agent-roles.md` hold the depth-2 lookups, and I traced each one's parent through its `toolUseId` in the side's transcript. 2.E.A's lookups (a508428b7705f46eb and two others) are in none of the five files.
- 8: met, as in Verify 4.
- 9: met, as in Verify 4.
- 10: met. Every record of the brief's window is placed, and I found no record of the four plans outside it.

## 1. Spec

- `.scratch/2-e-a-self-rule/agents/reviews/5-report.md`, "Judgment calls" and "Records named as no plan's": "ab9ea8af2b5f1b654 ... it started 48 minutes before 2.E's opening commit, in the design conversation, so it is named above as no plan's". What is wrong: item 1's numbered list takes in "the claude-code-guide agents ... when their prompt or time ties them to a step of 2.E", and "What is on the tree" lists ab9ea8af2b5f1b654 among the agents started for the four plans. Its prompt (6266a558 line 24348) asks whether a subagent can be given a reasoning effort level, and in what field of a custom agent definition. That is the subject of 2.E step 3, the effort agents, whose check in the 2.E plan ("a definition's `effort` overrides the session level") rests on that documentation. The report applied a time test (before the opening commit) where the brief named a prompt-or-time test. The report's stated reason, "No plan skill started them", is not the criterion it applied elsewhere: it also holds for a8b166abc8ac4a21f, the step 3 and 14b probes and the 9a scratch runs, all of which it lists. Failure scenario: someone reading 2.E's agent list next to 2.E.A's, for the comparison of step 10 and D8, finds no record of the documentation lookup that step 3's design rests on, although the brief's rule covers it. Closing it is a one-line fix: a numbered item `<n>. ab9ea8af2b5f1b654: claude-code-guide lookup of subagent effort settings, before the plan opened, for step 3, claude-haiku-4-5-20251001`. The other option is for the orchestrator to record that the brief's premise was wrong. Verdict: item 1 violated in this point.
- The session's scratchpad `s5/table.py` and `s5/assign.py`, which the report cites as "`python3` over `recs.json`". What is wrong: "What it must do", "Commands, not scripts", asks for one-off `python3 -c` or heredoc commands. The brief check's finding 4.5 was closed on "no helper script". The reading was done with two saved files instead: `table.py`, which extracts the records and notices, and `assign.py`, a hand-typed table of placements. Neither is in the repository, and `table.py` computes only facts, so the output is unaffected; my own reading reproduces it. Failure scenario: the placements rest on files in a session scratchpad that is not kept. A later reader, at landing or at step 10, cannot rerun the step's reading from the ledger alone, which the brief's shape was meant to allow. Verdict: none.

## 2. Proof

- `5-report.md`, "DONE / NOT DONE", Verify 1 to 4. Quoted hunks: "printed each of its 11 commands with `PASS` or `ok` and ended `checks: 11 commands passed`"; "(the head of each run; the per-agent rows follow in the script's output)"; "Case 4: every bullet whose step has a booking matched its booking's figures ... (`python3` over `recs.json` ...)"; "Case 9: a bash loop ... printed a line only on a difference"; and for case 10, no command at all. What is wrong: "Verify before you report" asks for the lines `checks.sh` prints, each script run's output whole, case 4's figures, and the commands of cases 9 and 10 with their output. The report paraphrases each of these instead of quoting it. One paraphrase is also inexact: the 11th command, the perl ASCII check, prints nothing, not "PASS or ok". My reruns reproduce every claim (above), so no decision rests on a wrong figure. Failure scenario: the landing booking and step 10 read this report as the step's record. The per-agent rows (for example the claude-sonnet-5 trial builder) and the figure tie behind each bullet appear nowhere in the ledger, so a reader cannot check one bullet's placement from the report. Closable at landing by pasting the outputs. Verdict: none.
- `5-report.md`, "Verify 4", case 10: "to 2.E.A's opening commit 9fc91dc (2026-09-30T22:31:16Z), which holds 2.H's last booking". What is wrong: 9fc91dc touches only 2.E.A's ledger and `.scratch/rulings/2-e-a-self-rule.md` (`git show --stat 9fc91dc`), and 2.H's `plan.md` was last changed at 8633553 (2026-09-30T15:45:29Z, `git log -- .scratch/2-h-session-retro/plan.md`). The decision that rests on it is the end of case 10's window. The window the report used is wider than the brief's, so nothing is missed. Two smaller details in the same section are also inexact. e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8 is called "the `claude -p` session", but its entrypoint is `cli` (an interactive session, the only one among the 30 scratchpad sessions), so "27 `claude -p` sessions" is 26 plus that one. Its folder is `-private-tmp-ordo-diagnose-3`, not `scratchpad-mp-ordo-diagnose-3`. The conclusion that it is Axel's own session holds. Failure scenario: a reader who reuses the window for a later plan's check takes 9fc91dc as 2.H's last booking and dates 2.H's work wrongly. Verdict: none.

## 3. Standards

none

## 4. Behaviour

- `.scratch/2-f-diagnose/plan.md`, the new `## Agents` section, which ends with "Agents in no role the cost script prices:" and items 1 to 4. What is wrong: `land` Steps 9 "appends to `plan.md`'s `## Agents` section one bullet per agent the step's dispatch entry names". 2.F still has steps 2a, 2b, 2c, 3 and 4 to land, so each of those landings will place its priced bullets after the numbered list, under the line that says its items are unpriced. Pricing is not affected, since `plan_cost.py` reads every bullet of the section. The order comes from item 2's wording, not from a deviation by the session. The report does not state this effect. Failure scenario: after 2.F step 2a lands, its `- <id>: builder of step 2a, claude-sonnet-5-5` sits under "Agents in no role the cost script prices:", and a reader of 2.F's Agents section takes the new builder for an unpriced agent. The fix is the orchestrator's choice at landing: move 2.F's numbered list above the bullets, or end the list with a sentence that bullets after it are priced. Verdict: none.

## Declined to judge

- Whether the four general-purpose agents of 2.E's design conversation (a432f885c9164e19d, a87e3855655e33f19, a5f748843ab789cc0, ae64bcf0b2ed543b4) belong in 2.E's numbered list. Their prompts feed steps 3 to 5 and the plan's first rulings, but they started before the opening, and both the brief's case 10 window and its list leave them out. Which agents count as started for a plan before it opened is a reading of ADR 0006 that the orchestrator or Axel settles.
- Whether the glossary's **Agents section** ("one bullet per agent a plan skill started for the entry") stays true for 2.F's section, which now holds numbered items. Brief Decision 3 decides not to change the glossary or the template, so this is the brief's call, not the step's.
- The claude-code-guide agent a22b34da4ff11f1fa (2026-10-01T02:35Z), which is in no Agents section. It falls in 2.E.A's time and is outside step 5's scope, which keeps 2.E.A's agents out of the five files.
- Whether "every cost is a lower bound" is exact for every agent. I checked that `~/.claude/api-bodies` starts on 2026-10-01 (oldest file 13:37) and that one agent's No body count (a7e2d8da2f7e6b429, 18) is consistent with none of its responses having a body. I did not check every row.

Reviewer usage: a8ec4aa6dab9bc81e, claude-opus-5-5 (ordo-high), 241181 tokens, 65 tool uses, 12 min 29 s.