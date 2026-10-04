# Step 5 brief check (on main at 1b889be)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/5.md`. The shape is the repository's `skills/spec/templates/brief-check.md`, which has `## 8. Dictated text`. The installed copy at `~/.claude/skills/spec/templates/brief-check.md` (a link into `~/.local/share/ordo-stable`) does not have that section yet (`diff` of the two files). Agent ids are the `agent-<id>` names under `~/.claude/projects/-Users-axelfaes-workspace-ordo/<session>/subagents/`.

## 1. Names

- `agents/agent-roles.md`: `git grep -n "agent-roles" -- ':!.scratch'`. The hits are `skills/plan-orchestration/templates/plan_cost.py:11,39,55,261` and `plan_cost.test.sh:6,147,149,239,693,798,799,817,819,868,871,872`. The step does not make any of them false.
- `## Agents`: `git grep -n "## Agents" -- ':!.scratch'`.
  - `docs/glossary.md:11` (and `skills/repo-setup/templates/plan-terms.md:6`), **Agents section**: "one bullet per agent a plan skill started for the entry". Item 2 puts some agents of a plan in a paragraph, and leaves others out (see 6). In the three `plan.md` files, this sentence then becomes false.
  - `skills/plan/templates/plan.md:35`: "Each agent a plan skill started for this plan has one bullet". Item 2 copies this paragraph word for word into the three files. It becomes false there for the same reason (see 8).
  - `skills/plan/SKILL.md:68,70,71`, `skills/grill/SKILL.md:194,235` and `skills/land/SKILL.md:94` stay true. A paragraph line is not a bullet, so `/plan` does not copy it. An Agents section at the end of the rulings file is the place grill's "Steps / Looking up a fact" 4 gives it.
- Role strings (`builder of step`, `brief check of step`, `reviewer of step`, `grill lookup`): the step adds or changes none.

Findings:
1. `docs/glossary.md:11` (**Agents section**) and the template paragraph that item 2 copies become false in the three `plan.md` files whenever an agent of the plan is put in a paragraph or left out.

## 2. The step line

- "The id and role list of plan 2.E's agents": item 1.
- "read from their `meta.json` and 2.E's bookings": "What it must do", "Finding an agent's plan and role".
- "written to `.scratch/archive/2-e-grill/agents/agent-roles.md` (D5)": item 1.
- "check: each step's count per role equals its booking's": case 3.
- "and the cost script prints 2.E's roles": case 1 and verify 2.
- "(1 commit)": Decision 1, the orchestrator's copy carried by the landing commit.
- Blocked line, "each plan run in part before step 2 landed (the open plans 2.F, 2.G and 2.H) into its `plan.md`'s Agents section": item 2. Item 2 narrows this to "one bullet per agent of that plan's landed steps". The line asks for the plan's id and role list, and these agents are not covered:
  - the agents of the steps the revert 8633553 took back: 2.F 2a, 2b, 3a and 4; 2.G 2a and 2b; 2.H 3a;
  - the stopped agents of a landed step: 2.G step 1's killed brief check and killed reviewer.
- Blocked line, "of the lookup agents of entry 3's `/grill`, read from their `meta.json`, into `3-the-writing-base.md`'s Agents section": item 3.
- Blocked line, "as ADR 0006's consequence says": named under "What is on the tree".
- Ruling D5, "for plan 2.E the orchestrator reads its agents' `meta.json` once and writes the id and role list": the brief gives this to a builder. Nothing in the brief says D5's "the orchestrator" is replaced, or on whose authority. The step line carries no "(orchestrator, no agent)". This is one more reason the rules-file conflict in 4 needs a ruling.

Findings:
1. The Blocked line's "id and role list of each plan" has no item for 2.F, 2.G and 2.H's agents outside the landed steps' bookings (the list is in 6).
2. D5 says the orchestrator does this work, and the brief dispatches a builder without saying why that changes.

## 3. Premises

- 407 meta files in three session folders: `ls ~/.claude/projects/-Users-axelfaes-workspace-ordo/*-*/subagents/*.meta.json | wc -l` now prints 408 (3998c800: 72, 6266a558: 252, 7bdaf343: 84). The extra one is this brief-check agent, af7f592df096cc3fb (`ls -t` shows it newest). The premise held when it was written, and the count grows while the step runs.
- Other folders: `find` over the other `~/.claude/projects/*ordo*` folders found 10 more subagent meta files in scratchpad project folders. They are `effort-probe-proj` (6), `model-probe` (2), `verify7` (1) and `r14b-judge-c` (1). The brief says nothing of them.
- The meta's fields: `cat .../agent-a298a7e61f0556c39.meta.json` matches the brief. Explore and claude-code-guide agents carry no `model` key (8 of them in 3998c800, 2 in 6266a558).
- "The parent session's file holds the tool_use whose id is the meta's toolUseId": false for the 15 agents with `"spawnDepth":2` (`grep -l '"spawnDepth":2' */subagents/*.meta.json | wc -l` prints 15). Their tool_use is in another subagent's transcript. Twelve were started by step 14's comparison sides: a057a43e1e25fb9b1, a7c88bf7079d37350 and acd1b62d9331000e0 under a0b741cdbabe97a3f; a15eebffdc9d21426 and a3efaf56cb0d5b60f under a2d1285df87e5583c; a1c62a294c2aa8fec and a3cd717c563122c6e under ad25c3abcf1869a03; a2d94c00a6978703e, abecf05f3dd97913d and afa40a52e94cee078 under aa1b0dfda08d592a0; a62c8434157c6378e and aa9e1149a5536efd4 under ac33f0594089cb2ab. Five of the twelve have descriptions that start "Lookup:" or "Look up".
- The toolUseId link for a298a7e61f0556c39: the tool_use is at `6266a558-....jsonl:28002`, which matches the brief. The "three lines carry its id with a task notification" (28065, 28068, 28072) are one notification written three times (enqueue, remove, queued_command), all 79172 tokens and 14 tool uses. The round-1 notification (101447 tokens, 8 tool uses, lines 28310, 28313, 28316) carries `<tool-use-id>toolu_01XR5Ug8CSKNUYE1RQZK6Xo9`. That id belongs to a `SendMessage` tool_use, not to the meta's toolUseId. A builder that looks for notifications by the meta's toolUseId finds only round 0. They have to be found by `<task-id>` and the three copies counted once.
- 2.E's Usage lines: `grep -n "^### Step\|Usage" .scratch/archive/2-e-grill/plan.md` matches the brief's step list, and steps 13, 15 and 16 have no Usage line. Step 3's line also names two trial reviewers ("its reviewer" after each trial builder, 175588 and 177523 tokens), which the brief does not mention.
- Every figure of every booking matches exactly one agent's notification. I matched the "(\d+) tokens, (\d+) tool uses" pairs of each Usage line of the four plans against the notifications of all 408 agents, with a python read in memory over the parent session files. Step 9a's seven scratch runs fall inside the booked ranges (53872 to 69504 tokens, 5 to 10 tool uses).
- Steps of a booking appear in more than one plan's sessions: holds. `Refute round N of step N` appears 21 times in 6266a558 and 4 times in 7bdaf343. 6266a558 hosted 2.E, 2.F, 2.G and 2.H.
- 7bdaf343 holds no agent of the four plans. Its agents run from 2026-09-23T12:20 to 2026-09-25T18:22, and 2.E step 1 landed on 2026-09-29. The brief does not say this.
- No Agents section: `grep -c "^## Agents"` on 2.E's `plan.md` prints 0. The three open plans and the rulings file have none either.
- Line numbers: `grep -n "^## Blocked, and by what"` prints 52, 44 and 52, and `wc -l` on the rulings file prints 25. All four match. The rulings file has no `## ` heading at all.
- Cost script rules: `sed -n 1,92p plan_cost.py` matches the brief. The head comment runs to line 92, while the brief's "Read" 1 says lines 1 to 90.
- `ls .scratch/archive/2-e-grill/agents` prints `briefs reviews`, which matches.
- `ledger_root: .scratch`: matches, and `land.sh:377-378` adds with the ledger root excluded.

Findings:
1. "The parent session's file holds the tool_use" is false for 15 agents of depth 2, 12 of them step 14's.
2. "Three lines carry its id with a task notification" is one notification written three times, and the round-1 notification carries the SendMessage tool-use id. The brief should say the notifications are found by `<task-id>` and each one counted once.
3. Step 3's booking also names two trial reviewers.
4. 407 is now 408, and the count grows with each agent of 2.E.A.
5. There are 10 subagents in scratchpad project folders outside the three session folders.
6. The head comment runs to line 92, not 90.

## 4. Cases and checks

- Case 1: `python3 skills/plan-orchestration/templates/plan_cost.py .scratch/archive/2-e-grill` on the unchanged tree prints `error: the ledger names no agent` and exits 1. The case's first alternative, `error: no agent bullet`, is not a text the script prints. The case should quote the real line.
- Case 2: the same command on `.scratch/2-f-diagnose`, `.scratch/2-g-git-guard` and `.scratch/2-h-session-retro` prints `error: the ledger names no agent` and exits 1 for each. This is consistent with the case.
- Case 3: consistent with the rules file. It is in conflict with the `land` skill's Steps 9: "Each first-run reviewer from `reviewer_report`, a stopped one included". 2.G step 1's stopped reviewer a1c460a174ddbb16c and stopped brief check a87b610859b7caa16 are then bullets the booking does not count.
- Case 8: as written, `grep -o '^- a[0-9a-f]*' <six files> | sort | uniq -d` prefixes every match with its file name when given several files. An id repeated across two files then never shows up as a duplicate, and the command prints nothing even when the case is violated. It needs `grep -h` or `cat ... | grep -o`.
- Case 8 also leaves out 2.E.A's agents in flight, which the state file's dispatch entry holds and `plan.md` does not. Item 4 names them: acf87ddb30973c88b, a15fd806c8f78a9ab, a90205aabc898e907, this agent af7f592df096cc3fb, and step 5's builder.
- The builder writes three open plans' `plan.md` and a rulings file. The rules file, "Where the work happens", says: "Nothing under the ledger folder is edited except the report the brief names. The plan, the state file and the briefs belong to the orchestrator." `plan-orchestration` Steps 4 ("The builder") says "In the ledger it writes only its report". The brief opens with "its rules govern this step unchanged". The brief contradicts itself, and the builder's first read of the rules file stops it.
- The helper script: the brief allows "a helper script the builder writes to read the records". The rules file, "Scripts compute facts; judgment is read", says "A new script needs the user's approval of what it computes before it is written." The brief does not say why this rule does not apply to a scratch helper, or that its computation is approved.

Findings:
1. Case 1 names an error text the script does not print. The real one is `error: the ledger names no agent`.
2. Case 8's command cannot fail across files, and it misses the in-flight agents of 2.E.A.
3. Case 3 conflicts with `land` Steps 9 for stopped agents.
4. The step's writes conflict with the rules file's ledger rule and with `plan-orchestration` Steps 4, while the brief says the rules apply unchanged.
5. The helper script has no approval or stated exemption under "Scripts compute facts".

## 5. The question

The goal the step delivers: the cost script prints each role's priced usage for plan 2.E. The other part of this step is the agent lists of 2.F, 2.G, 2.H and entry 3 that the Blocked line asks for.

- Step-line check, case 3: yes, it can pass without the goal. The count is compared with the bookings, and the bookings leave out agents started for 2.E: step 9a's four brief checks of the reverted run, its killed builder and its reviewer; step 14's first-run sides, its four subagent judges and the two stopped rerun sides. A list of booked agents only passes, and 2.E's printed usage is then short of 2.E's cost. The 2.E figures are the baseline D8's gate compares 2.E.A against, and ADR 0006 rejects "drops the plans already run as the baseline".
- Case 1: yes, for the same reason. It checks rows exist and every booked step appears, not that every agent started for 2.E is either priced or named.
- Case 2: yes, for 2.F, 2.G and 2.H. It passes with the agents of their reverted steps and 2.G step 1's stopped agents absent.
- Case 4: no for the bullets it covers. The figures tie each bullet to its notification.
- Case 5: no for the builders. The trial reviewers are not covered.
- Case 6: no.
- Case 7: yes. It passes with step 14's five depth-2 "Lookup:" agents put in `3-the-writing-base.md`. It also cannot pass on the brief's own rule: the three `/grill 3` lookups (a2cd8be14d77ebe85, a9d12b91117bb4165, ac071af1b2da2bf66) match no booking entry (step 13 has no Usage line), and their prompts name no plan. "What it must do" then says they are "left out and not listed".
- Case 8: yes, it passes even with a duplicate (see 4).
- Case 9: no. No agent lacks a transcript (`find ~/.claude/projects -name 'agent-*.jsonl' | sed 's#.*/##' | sort | uniq -d` prints nothing).
- Item 3: yes, it passes with a bullet of the wrong form or model, since no case reads the rulings file's bullets through the script or against the transcripts.
- Item 1's paragraph: yes, it passes when it names only the agents the brief lists. "Any other found" has no search behind it beyond the three folders and the booking match.

Findings:
1. Case 3, case 1 and case 2 tie completeness to the bookings, which leave out agents started for the plans.
2. Case 7 contradicts the brief's own left-out rule, and does not tell `/grill 3`'s lookups apart from step 14's.
3. Case 8 cannot fail.
4. Item 3 has no form or model check.

## 6. Implied inputs

- An agent resumed for a round as a second notification: stated, but with the wrong lookup key. The notification is found by `<task-id>`, not by the meta's toolUseId, and each notification is written three times (see 3). 2.H step 3's builder a79c87e7558835577 has four notifications, all booked. Partly missing.
- An agent stopped and replaced: missing. 2.G step 1 has a87b610859b7caa16 (brief check, `killed`, no figures) and a1c460a174ddbb16c (reviewer, `killed`, replaced by a37c83404490fe650 "(relaunch)"). Expected: a bullet in its role, as `land` Steps 9 does for a stopped reviewer, with case 3's count stated as the booking's count plus the stopped agents named.
- A reviewer stopped for another model: none found by description in 2.E, 2.F, 2.G or 2.H. Not verified beyond the descriptions. The brief should state the handling, a bullet in its role.
- A relaunched agent: missing. 2.G step 1's "Brief check 2.G step 1, second run" is booked, and the first run (killed) is not. a37c83404490fe650 is booked.
- An agent of a plan's `/spec` stop: missing.
  - 2.E 9a: ac1981f7bc7d15672, a0efd11b092676656, a39b4380a345c407e and a51b44de3267fa2f1 (brief checks of the run the revert 8633553 took back).
  - 2.F 3a: ad56ca9da30d15e7e, a72228d39458b07f9 and a49118f1317517195.
  - 2.G 2b: a9b4dbe88a7879eb1 and ab724e6a426ca4d22.
  - 2.H 3a: a567381c0e52c792b and aa1400dfd58c76810.
- Agents of a landed-then-reverted or unlanded step: missing.
  - 2.E 9a: builder a931b2d1ac6c7e98d (killed, then 48769 tokens, 190 tool uses) and reviewer a829573acbc0a1734.
  - 2.F 2a: af6b9c9b5dd7db9e4, aaf2a244958131899, a737b44c11093528b and a5d29dfd61d79bbfc.
  - 2.F 2b: ad9c2bb9acc3d0fed, a065164924d21655a, a56363ce0d37f4326 and a04d091169687c8c9.
  - 2.F step 4's blind comparison: sides a8b8bdb8d0f78214c and ac4cda93b1e0e00ce, judges a37b18740bd105b87 and a1574d0248b23bd4c. The commit "Record the blind comparison of step 4 of plan 2.F" (1da8886) matches their times.
  - 2.G 2a: a19f3b42d959e5119. 2.G 2b: a64c3043b141e586e and a1b3ad4e9df60485a.
  - 2.H 3a: af9906813a8c54544, a1e73ec4e4e8cf564 and a423bdea6bbd17886.
  - Expected: bullets in their roles, as ADR 0006's "every agent" asks, with the counts of case 3 taken only over booked steps, or a ruling that they go in the paragraph.
- Step 3's trial reviewers a9101e85531b9f6e9 and af3f8a357a2c497f3: missing. Expected: `reviewer of step 3`, by the same reasoning as Decision 4, with case 5 counting them.
- Step 14 beyond the booking: missing.
  - First-run sides a0b741cdbabe97a3f and aa1b0dfda08d592a0.
  - Subagent judges ac7b56555b8c0e79b, abb6c9a352153728b, afb497f8e385d0af2 and a60182c30893dd043. The booking's "judges 1 and 2 ... 3 and 4" were subagents, not `claude -p` processes; only judges 5 and 6 were.
  - Stopped rerun sides a2972647de3f84dc8 and ac33f0594089cb2ab, which have no notification.
  - The sides' 12 depth-2 agents.
  - Expected: all in item 1's paragraph, with the reason.
- The session 7bdaf343's plans: not stated. It holds no agent of the four plans (it ends 2026-09-25). The brief should say so.
- Agents whose prompt names no plan: the rule "matches no booking entry and whose prompt names no plan is left out" drops the `/grill 3` lookups, all of step 14's sides and judges (none of their prompts name 2.E), 2.F's step 4 sides and judges, and the claude-code-guide lookups ab9ea8af2b5f1b654 and a8b166abc8ac4a21f. The last two ran on 2026-09-29 about effort settings, probably for 2.E step 3; that attribution is not verified. Expected: attribution by the parent session's timeline and the ledger's commits, not by the prompt.
- The 10 subagents in scratchpad project folders (2.E step 3 and 14b probes): missing. Expected: named in item 1's paragraph, or declared out of scope with the reason.

Findings: every bullet above marked missing or partly missing.

## 7. ADRs

- 0001, 0002, 0003 (proposed): they govern `/writing`. The step adds an Agents section to entry 3's rulings file, which none of their decisions governs. No touch.
- 0004, 0005: self-rule and the choices file. No touch.
- 0006 (proposed), Decision: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model". Consequence: "A plan run before this change gets its id and role list once". Named by the brief. Contradicted in two ways:
  - The brief leaves out agents of plans 2.E to 2.H (see 6), against "every agent".
  - Item 1's paragraph lists each other agent "with its id and what it was", with no served model, against "its served model".
- 0007: governs the model of the run over a repair round. No touch.
- 0008 and 0009: govern the script that case 1 runs. Named by the brief.

Findings:
1. ADR 0006's "every agent" is contradicted by the left-out rule and by the landed-steps-only scope of item 2.
2. ADR 0006's "its served model" is contradicted by item 1's paragraph form, which has no model.

## 8. Dictated text

- `# Agents of plan 2.E` (item 1): `grep -n "# Agents of plan 2.E" agents/briefs/5.md`. Holds (prose standard, "0. Hard rules", headings are labels).
- "Agents of plan 2.E in no role the cost script prices:" followed by "a paragraph, not bullets" listing each agent (item 1; `grep -n "in no role the cost script prices"`): breaks the prose standard, "D. Structure", "Three or more list-shaped items in paragraph form become a list". It will hold 13 or more items. A numbered list (`1. ...`) keeps the cost script blind to them, since `_BULLET` at `plan_cost.py:107` matches only `-`, `*` or `+`, and it meets the standard.
- Item 1's paragraph wording, "their parents' task notifications": breaks "D. Structure", "No synonym cycling", and the glossary rule of `docs/dev/skill-layout.md`, "Writing for an agent". The defined term is **completion notice** (`docs/glossary.md:29`).
- Item 2, "the template's paragraph word for word": the sentence "Each agent a plan skill started for this plan has one bullet" is false in any of the three files where an agent is in a paragraph or left out. This breaks the rules file, rules 14 and 19.
- Item 3, "Each lookup agent `/grill 3` started has one bullet, with its agent id, its role and the model the runner served it.": holds against the prose standard (21 words, the glossary's **runner**). It is a form `grill` does not write, since grill's "Steps / Looking up a fact" 4 gives a rulings file's section no sentence. That is harmless, since `/plan` copies only bullet lines.
- Case 1's quoted `error: no agent bullet`: wrong text (see 4).

Findings:
1. The no-role paragraph form breaks the list rule.
2. "Task notifications" should be "completion notices".
3. The template paragraph, copied word for word, is false in files where agents are in a paragraph or left out.
4. Case 1's error text is wrong.

## Decision 1 against `land`

- `land.sh` adds the worktree with the ledger root excluded (`land.sh:377-378`). The step's range then holds no commit, and land.sh prints `nothing to copy: <base>..<step> holds no commit` and runs the checks on main. A landing therefore carries nothing written only under the ledger root. Only the orchestrator's copy reaches main, and `land` Steps 12 commits "the ledger files the session wrote".
- The `land` skill has no item that copies ledger files from the worktree. `plan-orchestration` Steps 6 copies only the report. Steps 13 runs `git worktree remove --force`, which deletes the copies. The brief has to name the point of the copy: before Steps 13, and before land.sh if main's ASCII check (`checks.sh`) is to cover the files.
- Four of the five paths are tracked files. They are left as modifications in the worktree and carried through `git checkout -b <step>-land main` (`land.sh:400-401`). The ledger ignore file covers only untracked files.
  - If main changes any of them after the base, the checkout fails with git's "local changes would be overwritten".
  - A resumed landing refuses on them: `land.sh` preflight, "`<step>-land` has changes not committed; commit or discard them by hand".
- The way is sound only with these three conditions written into the brief: the copy before Steps 13 (and before land.sh for the checks), main's four tracked files unchanged since the base, and no resumed landing. It also still conflicts with the rules file's ledger rule and with D5 (see 2 and 4).

## Declined to judge

- Whether the reverted runs' agents (2.E 9a; 2.F 2a, 2b, 3a, 4; 2.G 2a, 2b; 2.H 3a) are priced as bullets or named in the paragraph. Either reading fits ADR 0006 as long as each is recorded. The pricing of the 2.E baseline for D8 is the user's call.
- Whether the step should be the orchestrator's (D5's words) or a builder's under an exception to the rules file. That is a reading of the user's ruling D5 against the approved step line.
- Whether the attribution of claude-code-guide agents ab9ea8af2b5f1b654 and a8b166abc8ac4a21f, and of the scratchpad probes, to 2.E is right. I inferred it from times and descriptions only.
- I wrote one scratch file in the session scratchpad (`/private/tmp/claude-502/.../scratchpad/agents.txt`, a table of the 408 meta records). It is outside the repository and `~/.claude`. Nothing else was written.

Agent usage: af7f592df096cc3fb, claude-opus-5-5 (ordo-high), 243237 tokens, 75 tool uses, 13 min 28 s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1.1, 8.3: the four plan files' paragraph is written fresh and states both forms, the bullet and the numbered item (item 2, Decision 3); the template and the glossary term are not changed, since a plan the template opens records every agent as a bullet.
- 2.1, 6 (agents of reverted and unlanded steps, stopped and relaunched agents, `/spec` stop agents), 5.1, 5.2: every agent started for a plan in a priced role is a bullet, booked or not (item 1, item 2, Decision 2), and case 3 counts the booking's agents plus the unbooked ones named; case 2 then fails when one is missing.
- 2.2, 4.4: the executor is `inline` (Decision 1), as D5 gives the reading to the orchestrator and the rules file reserves the ledger files to it; the files are written in the main checkout, the worktree stays at the base, and land.sh finds no commit in the range.
- 3.1, 3.2: "What is on the tree" states the 15 agents of depth 2 and where their tool_use is, and that notifications are found by `<task-id>`, each written three times and counted once; "What it must do" reads them that way.
- 3.3, 6 (trial reviewers): step 3's two trial reviewers are named, and case 5 counts them as `reviewer of step 3`.
- 3.4: the count is given as 408 when the check ran and as growing with this plan's agents; case 4 of item 4 keeps 2.E.A's agents out.
- 3.5, 6 (scratchpad probes): the ten records in scratchpad project folders are named, and each is a numbered item of `agent-roles.md` when its prompt or time ties it to a step of 2.E; case 10 makes every record placed or named as no plan's.
- 3.6: "Read" 1 and "What is on the tree" say lines 1 to 92.
- 4.1, 8.4: case 1 quotes `error: the ledger names no agent`.
- 4.2, 5.3: case 8 uses `cat <files> | grep -o`, includes 2.E.A's `plan.md`, and runs once with a planted duplicate to show it can fail; item 4 names 2.E.A's dispatch block as a source of ids to keep out.
- 4.3: stopped and relaunched agents are bullets in their role, as `land` Steps 9 records a stopped reviewer, and case 3 names them.
- 4.5: no helper script; the reading is done with one-off `python3` commands from the scratchpad that print facts, read and judged by the session ("What it must do", "Commands, not scripts").
- 5.2, 6 (attribution): an agent no booking names is placed by its prompt, or by the parent session's timeline against the ledger's commits, with the evidence in the report; the `/grill 3` lookups are bullets of the rulings file after that check (item 3, case 7), and step 14's depth-2 lookups are numbered items of `agent-roles.md`.
- 5.4: case 9 compares every bullet's model in the five files with its transcript.
- 6 (7bdaf343): stated under "What is on the tree".
- 7.1: every agent of 2.E to 2.H is recorded, as a bullet or a numbered item.
- 7.2, 8.1: the other agents are a numbered list `<n>. <agent id>: <what it was>, <served model>`, which carries the served model and which `_BULLET` (`plan_cost.py:107`) does not read.
- 8.2: the paragraph says "completion notices".
- Decision 1 against `land`: moot, since nothing is written in the worktree; the ledger files are on main, uncommitted and unstaged until the landing commit, and land.sh refuses only staged changes on main (`land.sh:339`).
- Declined 1: taken in the brief as Decision 2 (priced as bullets), since ADR 0006 records every agent a plan skill starts and the cost script is to print a plan's cost; reversible.
- Declined 2: taken as Decision 1 by D5's words.
- Dictated lines added after the check: the paragraph of item 1 and of item 2, and the line "Agents in no role the cost script prices:"; each is held here to the prose standard by reading: one sentence per idea, the glossary's **completion notice** and **runner**, no history, ASCII.
