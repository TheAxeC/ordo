# Step 4 brief check (on main at 6442647)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check" on `agents/briefs/4.md`. Pages are cited by section. Brief lines are cited as `4.md:<n>`, the number that `cat -n` printed.

The brief is not ready to dispatch as written. Two of its central conditions can come out either way depending on timing or on an order the orchestrator picks, and the new check it adds is likely to make `/plan` stop and ask the user. The details are under section 5.

## 1. Names

The step renames nothing in Ordo. The new names it writes are `4-run/`, `4-report.md`, `2i-run-2` and `run-report.md`.

- `git grep -n -e '4-run' -e '4-report' -e '2i-run-2' -e 'run-report.md' -- . ':!.scratch/2-i-several-plans-in-one-session/agents/reviews/2-run'`:
  - Hits in plan 2.I: `briefs/2-round-1.md:8`, `reviews/2-refuter.md:52,91,132,273` and `reviews/2-report.md:196`. All of them describe step 2's own `run-report.md` in `2i-run`. The step makes none of them false.
  - Every other hit is an archived plan's own `4-report.md`. The step makes none of them false.
- `plan.md`'s `## Agents` section is changed at this step's landing, not by the step. The section's opening sentence (`plan.md:96`) gives numbered items to agents whose role the cost script does not price, which is what 4.md:102 asks for. That sentence stays true.

Findings: none.

## 2. The step line

Each part of the step 4 line (`plan.md:22`), with the part of "What to build" that serves it:

- "in a new scratch repository under the session's scratch folder": 4.md:67 to 77, `<scratchpad>/2i-run-2`. `ls -d <scratchpad>/2i-run*` matched nothing, so the folder does not yet exist.
- "the scratch content of the rulings ... 'what the scratch run needs approved' and '... the scratch gates that could pass without their goals'": 4.md:70 to 76.
  - The third ruling says the gates are written "as a second setup commit before `/plan` runs again".
  - The brief makes one commit, `Set up the scratch repository` (4.md:77). That reading fits a new repository, but it departs from the ruling's words and is not listed under "Decisions taken in this brief".
- "plan 3 gains a step before its closing that names in `docs/faq.md` the test command plan 5's step 2 adds": change 1 (4.md:81 to 84) and condition 7.
- "so the texts' 'a dependency that forces an order' holds it until plan 5's step 2 lands": no requirement guarantees that this text is what holds the step.
  - Decision 3 (4.md:136) writes the wait on the step's line in the rulings file.
  - The orchestrator then reads plan 3's step 3 as blocked at `plan-orchestration` Steps 2 and never judges the pair under "Two steps in flight".
  - Condition 7 (4.md:61) accepts either route: "or the step is not yet picked".
  - The walk in section 5 shows the likely route is "not yet picked". The text the line names is then never exercised.
- "and plan 5's step 2 is in flight beside plan 3's step 2": change 2 (4.md:85) says "This needs no change to the content" and "Condition 4 records whether it held".
  - The line lists this as one of the two changes to the scratch content.
  - The brief makes no change and leaves the outcome to the run (section 5, condition 4).
- "the orchestrator runs the loop of the texts over both plans in its own session": "The run" 2 (4.md:90).
- "invoking each skill through the Skill tool from the pin `v6.0.0-rc.2`": 4.md:51, 87 and condition 10.
- "with nothing asked of the user": condition 9.
- "and no order the texts do not give": 4.md:51. The brief does not say what the orchestrator does at the two points where the texts allow either order (section 5, conditions 3 and 4), so this part is only partly served.
- "check: ... each condition of step 2's check": conditions 1 to 11. One part of step 2's check is lost: "the second plan's step waiting until the first plan's step landed" (section 5, condition 3).
- "with the order of every landing the one the texts give": condition 6.
- "the added test command's line quoted from the booking of plan 3's landing of that step": condition 7.
- "the one report checked by a fresh reviewer agent against the two plans' ledgers": condition 11.
- "(1 commit; orchestrator, no agent)": "How the rules file applies to this step" (4.md:45).

Findings:
1. The part "so the texts' 'a dependency that forces an order' holds it" has no requirement that makes that text the one that holds the step. Decision 3 routes the hold through the step list instead.
2. The part "plan 5's step 2 is in flight beside plan 3's step 2" is a content change on the line. The brief declines to make any change and leaves it to timing (section 5).
3. Writing the setup as one commit departs from the third ruling's "second setup commit" and is not booked as a decision of the brief.

## 3. Premises

Each fact of "What is on the tree", rerun from Ordo's root:

- **Step 3 landed and is ticked (4.md:11).** `git log --oneline -6` printed `61d3eab Land step 3 of plan 2.I, the skill texts after the real run` under the head `6442647`. `grep -n '^- ✅ 3 ' plan.md` printed line 21. Matches.
- **The three rulings are in Rulings (4.md:12 to 15).** All three bullets were read in `plan.md`'s Rulings section. Matches.
- **The pin (4.md:16).**
  - `git -C ~/.local/share/ordo-stable log --oneline -1` printed `61d3eab Land step 3 of plan 2.I, the skill texts after the real run`. Matches.
  - `git -C ~/.local/share/ordo-stable describe --tags` printed `v6.0.0-rc.2`. Matches.
- **The installed texts equal main's (4.md:16).** `diff -rq skills ~/.local/share/ordo-stable/skills` printed two lines and exited 1:
  ```
  Only in skills/ordo-init/templates: __pycache__
  Only in skills/repo-setup/templates: hooks
  ```
  - The brief says it lists only the second line.
  - `git check-ignore -v` shows both folders ignored by `.gitignore:5:__pycache__/`.
  - `git diff --stat 61d3eab HEAD -- skills` printed nothing.
  - So the conclusion holds, but the premise as written does not match the output.
- **The effort agents and the effort variable (4.md:17).**
  - `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max` are in the runner's agent types list given to this agent.
  - `printenv CLAUDE_CODE_EFFORT_LEVEL` printed nothing and exited 1.
  - Matches.
- **The quoted texts (4.md:19 to 23).** Grepped in `~/.local/share/ordo-stable/skills`:
  - `plan-orchestration/SKILL.md:310,311,316,331` hold the limit, the in-flight rule, the dependency list and the landing order. `:57` holds the earliest-plan pick and `:174` holds "10. Continue with step 2."
  - `spec/SKILL.md:114,118,199,211` hold the verify-list compare, the `preparing` entry, the path compare and the wait. `land/SKILL.md:52` holds the land-side compare.
  - `plan-orchestration/SKILL.md:374` holds the closing's position line.
  - All match.
- **`plan` "What it reads" 6 and Steps 3 (4.md:24).** The premise is incomplete.
  - Steps 3 writes a ruled list without the stop "only when four things hold". One of them is "Every answer in '## Gate' is no".
  - The brief leaves this condition out. Condition 9 depends on it (section 5).
- **The closing (4.md:25).** `plan` Steps 2 has the closing report written before `/roadmap done`. `self-rule.md:19` reads `4. The closing's roadmap diff, tag and pin.` Matches.
- **The cost script and the transcripts (4.md:26).**
  - `echo $CLAUDE_CONFIG_DIR` printed `/Users/axelfaes/.claude-backup`.
  - `ls -la ~/.claude-backup/projects` printed `projects -> /Users/axelfaes/.claude/projects`.
  - `ls ~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/` lists `3998c800-...jsonl`.
  - The script's head comment says it finds `agent-<id>.jsonl` anywhere under the root, so the folder's key does not matter.
  - Matches.
- **Ordo's own configuration (4.md:27).** `grep -n workers_at_once .agents/plan.yaml` printed line 14 with `workers_at_once: 3`. The open plans are `2-i-several-plans-in-one-session` and `3-the-writing-base`. Matches.
- **The templates (4.md:28).** `ls` printed all four paths. Matches.
- **`transcript_window.py` (4.md:29).** Its head comment matches the brief.
- **Step 2's record (4.md:30).** `ls 2-run/` shows `*.txt.md` names. `grep -c $'\t' 2-run/git-log.txt` printed `0`. Matches.
- **The verify list (4.md:41).**
  - The state file's `verify:` equals `docs/dev/building.md`'s block with the filters of the change standard.
  - `git diff` of the state file shows only the dispatch entry of step 4.
  - Matches.

Findings:
1. 4.md:16: the `diff -rq` output has a second line, `Only in skills/ordo-init/templates: __pycache__`, which the brief does not list. That folder is ignored too.
2. 4.md:24 leaves out the four conditions of `plan` Steps 3, and condition 9 depends on one of them.
3. Decision 3 (4.md:136) gives a reason no text supports: "so plan 3 opens and runs beside plan 5".
   - Neither `plan` nor `plan-orchestration` Steps 2 reads an entry's waits-on line. `grep -n -i 'waits on'` in both found it only in `self-rule.md:72` (next-entry mode, which is off in the scratch repository).
   - The `roadmap` skill's "Steps / add" 4 defines waits-on as "the entries ... the work depends on".
   - So "Waits on: nothing" understates entry 3's dependency without a reason the texts give.

## 4. Cases and checks

- Each case checks the record the step writes, by reading. This is consistent with the change standard's "Scripts compute facts; judgment is read" and its rule 1 for a judgment step, and with `spec` Steps 4 ("A case of a text or judgment step is checked by reading").
- The first run is a reading of the installed skill texts, which the step does not change. This is the template's first-run convention and not a case. Step 2 showed it is where a case the brief gets wrong is caught (`2-report.md`, case 5), so it is kept.
- Case 2 (4.md:110) and condition 3 require the `/spec` route for plan 3's step 1. Case 5 (4.md:113) and condition 7 accept either route for plan 3's step 3. The brief treats the two holds by different standards with no reason given.
- Case 5 ties the rewrite of the verify list to plan 3's step 3. Section 5 shows that the texts may give that rewrite to plan 3's step 1.

Findings:
1. Case 2 and case 5 are inconsistent with each other: case 2 requires the `/spec` route, case 5 accepts either route.
2. Case 5 places the verify-list rewrite at step 3, where the texts do not guarantee it.

## 5. The question

The goal is the texts installed from `v6.0.0-rc.2` shown, in a real run with no ordering by the orchestrator, to run several plans in one session, with condition 7 of step 2's gate shown by the texts.

**How the picks go under the texts.** Plan 5 has steps 1, 2 and 3 (the closing), in sequence. Plan 3 has steps 1 to 4: steps 1 and 2 can run in parallel, step 3 waits on plan 5's step 2 and comes after plan 3's step 2, and step 4 is the closing. `workers_at_once` is 2.

- Start: the first slot takes plan 5's step 1. For the second slot, plan 5's step 2 is blocked, so plan 3's step 1 is picked; it waits on `docs/guide.md`. The slot goes to plan 3's step 2. In flight: plan 5's step 1 and plan 3's step 2.
- **Path A, plan 5's step 1 is verified first.**
  - It lands. Steps 10 returns to Steps 2, and the freed slot takes plan 5's step 2, written as a `preparing` entry. Condition 4 holds.
  - Plan 3's step 2 lands. The slot goes to plan 3's step 1, which is unblocked now, and runs beside plan 5's step 2.
  - Plan 3's step 1 is small and likely verified first (in step 2 it was verified at 16:02:55, plan 5's step 2 at 16:13:53). Its landing finds no new command on the page.
  - Plan 3's step 3 stays blocked by its line until plan 5's step 2 lands. Its `/spec` then rewrites the verify list and its landing quotes the `PASS` line. Condition 7 holds.
- **Path A, but plan 5's step 2 lands before plan 3's step 1.**
  - Plan 3's step 1's `/land`, Steps 2, rewrites the list and its booking quotes `PASS: docs/guide.md`. That reaches the goal (the gate's "next landing of the other plan").
  - Plan 3's step 3 then finds no difference, so condition 7's "Its `/spec` or its `/land` rewrites" is NOT DONE even though the texts worked.
- **Path B, plan 3's step 2 is verified before plan 5's step 1.**
  - Landings follow the order of verification, so plan 3's step 2 lands first.
  - When plan 5's step 1 lands, plan 5's step 2 and plan 3's step 1 take the two slots. Plan 5's step 2 is never in flight beside plan 3's step 2, and condition 4 fails.
- **Path A', plan 3's step 2 is verified during plan 5's step 1's landing.**
  - Condition 4 then depends on whether `/spec 5 2` begins before `/land 3 2`. The texts allow either order.
  - Step 2's run had this timing: plan 5's step 1 reviewer ended at 15:53:18, its landing ran from 15:53:40 to 15:54:54, and plan 3's step 2 reviewer ended at 15:54:34, during that landing (`2-report.md`, Timeline and Landings).
  - Condition 4 held there only because `/spec 5 2` (15:55:21) came before `/land 3 2` (15:56:40).

**Condition by condition:**

- **Condition 1 (first `/spec` is plan 5's step 1). No.** Only the roadmap's order puts 5 before 3: number order, folder order and opening order all put 3 first.
- **Condition 2 (both plans in flight). No.** Both launch commits must come before either landing.
- **Condition 3 (plan 3's step 1 waits). Yes.**
  - It records only that one `/spec` waited. Step 2's brief also required "plan 3's step 1 is prepared again only after plan 5's step 1 has its landing commit", and step 4 dropped that (seen by diffing the two briefs). A second `/spec` that judged the merge simple before plan 5's step 1 landed would pass condition 3 while breaking the gate's "waits until the first plan's step has landed".
  - Condition 3 also depends on an orchestrator choice. `plan-orchestration` Steps 2 judges each pair "under 'Two steps in flight'" at the pick. Plan 3's step 1 line ("right after the install sentence") is a dependency that forces an order and can be judged from the lines alone, so a faithful orchestrator may never run `/spec 3 1`. Condition 3 then fails although the texts worked.
- **Condition 4 (plan 5's step 2 beside plan 3's step 2).** It cannot pass without the goal, but it can fail with the texts right.
  - Path B fails it on timing.
  - In path A', the result rests on an order the brief does not settle. "No step is held back from a pick, a `/spec` or a landing" (4.md:51) does not choose between `/spec 5 2` and `/land 3 2`.
  - Change 2 (4.md:85) says the texts deliver condition 4, but they deliver it only on path A.
- **Condition 5 (the limit). Yes.**
  - A `preparing` entry sits on disk in its plan's state file. Only a commit of that same plan carries it (`spec` "Steps / The brief check" 1).
  - So the count "at any commit of the run" (4.md:59 and 4.md:99) misses a `/spec` in progress whose entry is not yet committed. That is the gap of finding 9 of `2-report.md`.
  - A third step whose `/spec` overlapped another's could exceed 2 without any commit showing it. The evidence must be the dispatch blocks as read at each `/spec` preflight and each pick, from the transcript, as well as at commits.
- **Condition 6 (no overlap, verification order). No.** It is read from the timestamps of review end, `/land`, cherry-pick and commit.
- **Condition 7 (plan 3's step 3 and the `PASS` line). Yes.**
  - On the ordering where plan 5's step 2 lands before plan 3's step 1, suppose plan 3's step 1's `/land` failed to rewrite the list. That is the D7/D14 failure. Plan 3's step 3's `/spec` would still rewrite it, and its landing would quote `PASS`, so condition 7 passes while "the next landing of the other plan" never ran the command.
  - On the opposite ordering, condition 7 fails with the goal reached (path A above).
  - The condition should read: plan 3's first `/spec` or `/land` after plan 5's step 2's landing commit rewrites the verify list and names the change, and the booking of plan 3's first landing after that commit quotes `PASS: docs/guide.md`. That is step 2's own wording at its condition 7.
  - Its hold clause ("or the step is not yet picked") cannot pass without a hold. It does not show the text the step line names (section 2).
- **Condition 8 (one report). No.**
- **Condition 9 (nothing asked of the user). No, it cannot pass without the goal. It is at risk of failing.**
  - `plan` Steps 3 writes a ruled list without the stop only when every answer in "## Gate" is no.
  - Step 3's dictated check (4.md:82), `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1 and the `## ` count still prints 2, passes when the sentence is in the first answer, or names the command without saying it checks the guide's form.
  - The step's part is "one sentence added at the end of the second answer ... that names `sh tests/guide.test.sh` as the command that checks the guide's form" (4.md:81).
  - A careful `/plan 3` answers yes, so the stop stands and goes to the user. In step 2's run, `/plan 3` stopped this same way on gates of this kind (`2-report.md`, after the DONE table).
  - The same applies to entry 3's added gate part (4.md:84), against the goal sentence "The FAQ names the command that checks the guide's form".
  - The ruled FAQ gate already adds "read in place". Step 3's check needs the same: the sentence, read in place, ends the second answer and names the command as the one that checks the guide's form.
- **Condition 10 (Skill tool calls, the pin). No.**
- **Condition 11 (fresh reviewer). No.**
- **The cases.**
  - Case 2: as condition 3.
  - Case 4: as condition 4.
  - Case 5: as condition 7.
  - The other cases mirror conditions 1, 2, 6, 8 and 9, with the same answers.
- **The step line's check.** "Each condition of step 2's check": yes, through condition 3's dropped clause and condition 7's narrowing.

Findings:
1. Condition 4 and case 4 can fail with the texts working correctly. Path B, plan 3's step 2 verified before plan 5's step 1, is a matter of timing. Step 2's run came within 76 s of path A'. In path A', the outcome rests on an order (`/spec 5 2` before `/land 3 2`) that the brief neither settles nor records as the texts' reading.
   - The step line lists this as a content change. The brief makes none, and the user ruled "counted as met through the hold" the lazy option.
   - The brief should either change the content so the texts force it, or state the reading it applies at path A' (Steps 10's return to Steps 2 before the next landing) and what happens on path B.
2. Condition 3 lost step 2's clause that plan 3's step 1 is prepared only after plan 5's step 1's landing commit. The condition also requires the `/spec` route, where the texts' pair judgment at Steps 2 may hold the step without a `/spec`.
3. Condition 5 counts only at commits, which do not show a `preparing` entry left uncommitted on disk.
4. Condition 7 ties the rewrite and the `PASS` line to plan 3's step 3, where the gate (D14) says "the next landing of the other plan". It can pass without that, and can fail with the goal reached.
5. Step 3's check (4.md:82) and entry 3's added gate part (4.md:84) can pass without their goal. That makes `/plan 3` keep its stop and ask the user, against condition 9.

## 6. Implied inputs

This is not a code step. It is a run by the orchestrator, executor `inline`, and its record. The scratch script `tests/guide.test.sh` is built by the scratch plan's own step, not by this step.

Findings: none.

## 7. ADRs

- 0001, 0002 and 0003 (the writing base and its reviewer) do not touch the step. The brief says so (4.md:40).
- **0004** touches the step. The decision sentence it falls under: "A decision taken under self-rule is booked as a bullet whose first line ends '(self-rule)'."
  - The brief names it (4.md:32), but with a wrong title. The brief writes "A decision taken under self-rule ends self-rule until the user agrees". The record's title is `A decision taken under "(self-rule)" ends "(self-rule)" until the user agrees` in the form `ends "(self-rule)" until the user agrees`. The brief's version reads as ending the self-rule mode.
  - The scratch rulings bullets end "(the user)." (4.md:76). They will also carry words that no ruling of the user gives: step 3's check (4.md:82), the goal sentence and gate part for entry 3 (4.md:84), and Decision 2's placement.
  - ADR 0004 rejects "The bullet ends '(the user)' at once: it records the user's authority for a decision the user did not make." Its Consequences say "Every ruling says who decided it."
  - Decision 1 calls these files test data. The bullet should still say which words are the brief's.
- **0005** touches the step: "Every choice taken under self-rule ... is written to `<ledger_root>/choices.md`". Named (4.md:33).
- **0006** touches the step: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model". Named (4.md:34). 4.md:102 follows it.
- **0007** touches the step: "The run over a repair round runs on the model an optional key `repair_reviewer` names". Named (4.md:35).
- **0008 and 0009** touch the step: "The script reads a price table kept beside it", and "The script takes a response's counts from its response body when the body's file exists". Named (4.md:36).
- **0010** touches the step: "`/spec` at its preflight, and `/land` before it runs the verify list, compare ... On a difference, the session rewrites the list in the state file and names the change in the brief or the booking." Named (4.md:37). Condition 7's narrowing (section 5) does not contradict it, but fails to test it on one landing order.
- **0011** touches the step: "The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit, to compare a brief's paths with the steps in flight, and to resume." Named (4.md:38).
- **0012** touches the step: "A landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill." Named (4.md:39). Condition 6 follows it.

Findings:
1. 4.md:32 misquotes 0004's title. The brief's "ends self-rule" changes what the record decides.
2. 4.md:76 writes words chosen in the brief into bullets ending "(the user).", which records the user's authority for wording the user did not rule. ADR 0004 rejects exactly this.

No ADR the step touches is missing from "What is on the tree".

## 8. Dictated text

Each line was read against the change standard and against the prose standard's sections 0, A to F and `skill-layout`'s "Lists and tables". `B=.scratch/2-i-several-plans-in-one-session/agents/briefs/4.md` in each command.

- "The verification page `docs/dev/building.md` is not a configuration file: a step that changes it runs beside other steps.": `grep -n -F 'is not a configuration file: a step that changes it runs beside other steps.' $B` printed line 72. Holds. Word for word from the user's ruling "Open item Step 2, what the scratch run needs approved".
- `# Guide`: `grep -n -F '`# Guide`' $B` printed line 74. Holds.
- `Set up the scratch repository` (commit subject): `grep -n -F '`Set up the scratch repository`' $B` printed line 77. Holds.
- `# FAQ`: `grep -n -F '`# FAQ`' $B` printed line 81. Holds. From the user's ruling.
- "1, the usage sentence right after the install sentence; 2, ...; 3, one sentence added at the end of the second answer of `docs/faq.md` that names `sh tests/guide.test.sh` as the command that checks the guide's form; 4, the closing." (the step list): `grep -n -F 'one sentence added at the end of the second answer' $B` printed line 81. Holds.
  - Steps 1, 2 and 4 come from the ruling, step 3 from the brief.
  - Prose standard B allows at most 2 semicolons per 1000 words, and D turns three or more list-shaped items in paragraph form into a list. The rulings file writes these as sub-bullets (4.md:76), so the line becomes a list there.
- "The FAQ names the command that checks the guide's form.": `grep -n -F 'The FAQ names the command that checks the guide' $B` printed line 84. Holds. The brief's own words. It uses the ruling's term "checks the guide's form" (entry 5's goal), with no synonym cycling (prose standard D).
- Step 3's check, "`grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1, and `grep -c '^## .*?$' docs/faq.md` still prints 2.": `grep -n -F "Step 3's check:" $B` printed line 82. The command lines hold as code and the prose holds. It is the check found able to pass without its goal in section 5, finding 5.
- Entry 3's gate part, "`grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1": line 84, as above. Holds as text. Same finding as step 3's check.
- `.agents/worktrees/` (`.gitignore` line): `grep -n -F '`.agents/worktrees/`' $B` printed line 71. Holds.
- The `.agents/plan.yaml` values (`roadmap: docs/roadmap.md` ... `next_entry: off`): `grep -n -F 'roadmap: docs/roadmap.md' $B` printed line 70. Holds. `worker`, `reviewer`, `repair_reviewer` on Sonnet, `workers_at_once: 2`, `self_rule: on` and `next_entry: off` come from the user's ruling.
- "(the user)." and "Steps 1 and 2 can run in parallel": `grep -n -F 'ends "(the user)."' $B` and `grep -n -F '"Steps 1 and 2 can run in parallel"' $B` each printed line 76. Hold. From the user's ruling. The ending is the subject of ADR finding 2.
- `git init -b main`: `grep -n -F 'git init -b main' $B` printed line 69. Holds.
- `/plan 3 --ruling .scratch/rulings/3-the-guide-s-usage-line-and-its-faq.md "<name>"`: `grep -n -F "/plan 3 --ruling" $B` printed line 89. Holds. `<name>` is a placeholder the orchestrator fills; `plan` "What it reads" 6 refuses a placeholder, so it must be replaced.
- "Everything in the brief is done": `grep -n -F 'Everything in the brief is done' $B` printed line 178. Holds. From the change standard's rule 7.

Findings: none against the rules. The step 3 check and the entry 3 gate part are findings under section 5.

## Declined to judge

- Whether a content change exists, within the ruled scratch content plus the step line's two changes and `workers_at_once: 2`, that makes the texts deliver condition 4 whatever the timing. That is a design choice for the orchestrator or the user. Section 5 shows that the brief's design does not.
- How likely path B and path A' are in the second run. Only the run settles it. Step 2's timings show path A' happened once.
- Whether ADR 0004 binds bullets the brief calls test data (Decision 1). It is reported as a finding because of the Consequences sentence "Every ruling says who decided it". Whether it binds is the user's call.
- Whether `plan-orchestration` Steps 2's pair judgment at the pick may hold plan 3's step 1 from the step lines before any `/spec`. The texts allow both readings. Which one the run applies is for the orchestrator to state.

Agent usage: a7bbcb94c44630b82, claude-opus-5-5, 246418 tokens, 40 tool uses, 10 min 17 s.


## Closed

Each finding is closed by a change to `agents/briefs/4.md` before the preparation commit.

- 2. The step line, 1: step 3's line states no wait, and Decision 3 says the texts' pair judgment holds it; condition 7 asks the run notes to record the pair judged as "a dependency that forces an order".
- 2. The step line, 2: change 2 says why no content change within the ruled `workers_at_once: 2` and step lists forces it, what the texts give when plan 5's step 1 is verified first, and that condition 4 is NOT DONE with the times when plan 3's step 2 is verified first. Decision 4 settles the order at path A': after a landing, Steps 10 returns to Steps 2 and fills the free slots before the next landing; condition 4 states it.
- 2. The step line, 3: the setup is two commits, as the third ruling says, the second `Write the ruled gates and step checks`.
- 3. Premises, 1: the `diff -rq` premise quotes both lines it prints, both ignored folders, with `git diff --stat 61d3eab HEAD -- skills` printing nothing.
- 3. Premises, 2: the `plan` premise names the four things of Steps 3 and that every gate answer must be no.
- 3. Premises, 3: Decision 3 gives the reason no text of a run reads the waits-on line, and entry 3's waits-on names entry 5's test command for the FAQ's naming of it only.
- 4. Cases and checks, 1: case 2 and condition 3 accept either route the texts give for plan 3's step 1, the pair judged at the pick or a `/spec` whose Steps 5 waits, as case 5 and condition 7 do.
- 4. Cases and checks, 2: case 5 and condition 7 tie the rewrite and the `PASS` line to plan 3's first `/spec` or `/land` and first landing after plan 5's step 2's landing commit, step 2's own wording.
- 5. The question, 1: as 2. The step line, 2.
- 5. The question, 2: condition 3 restores "Plan 3's step 1 is prepared only after plan 5's step 1 has its landing commit" and accepts the pick route.
- 5. The question, 3: condition 5 counts the dispatch blocks as they stand on disk at each pick and each `/spec` preflight, recorded in the run notes, and at each commit; the report's count list says the same.
- 5. The question, 4: as 4. Cases and checks, 2; "Verify before you report" 3 and the report's line on the `PASS` line follow it.
- 5. The question, 5: step 3 is written in the words of step 4's line, "names in `docs/faq.md` the test command plan 5's step 2 adds", whose goal the `grep -c -F` check covers whole; entry 3's goal sentence is "`docs/faq.md` names the test command of entry 5." with the same gate part. Both answer no.
- 7. ADRs, 1: 0004's title is quoted as the record writes it.
- 7. ADRs, 2: Decision 2 marks step 3's check and entry 3's added goal sentence and gate part as written by the orchestrator in the rulings file, so no bullet ending "(the user)." claims them as the user's.

Dictated lines added after the check, each held against the change standard and the prose standard (plain, ASCII, one fact, under 20 words): "names in `docs/faq.md` the test command plan 5's step 2 adds" (`grep -n -F` line 81, the words of step 4's line), "`docs/faq.md` names the test command of entry 5." (line 84), "entry 5's test command, for the FAQ's naming of it only" (line 84) and `Write the ruled gates and step checks` (line 77). Each holds.
