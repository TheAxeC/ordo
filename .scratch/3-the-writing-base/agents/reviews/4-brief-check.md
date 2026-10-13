# Step 4 brief check (on main at 757cbcf)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/4.md`. The brief (untracked), `plan.md` and `orchestrator-state.md` were read as they stand on disk: `git status --short` printed ` M .scratch/3-the-writing-base/orchestrator-state.md`, ` M .scratch/3-the-writing-base/plan.md`, `?? .scratch/3-the-writing-base/agents/briefs/4.md`. `git diff` of `plan.md` shows the premise correction of step 4's Step 0 that the brief describes. I changed no file.

## 1. Names

- The step adds new ledger files and renames nothing. `grep -rn --exclude-dir=.git --exclude-dir=worktrees -e '4-marks' -e '4-run' -e '4-report' .`: every hit outside the brief is in another plan's ledger under `.scratch/archive/` (2-f, 2-e-a, 2-d, 2-c, 2-i) or in `docs/roadmap.md:207` (plan 2.I's `4-report.md` and `4-run/`). Those are other paths, and the change makes none of them false.
- The role names to be booked: `grep -rn --exclude-dir=.git --exclude-dir=archive -e 'run of step 4' -e 'marker 1 of' .` hits only `plan.md:93` and `:95`, which are step 2's roles. None of them is made false.

Findings: none.

## 2. The step line

- "step 2's runs ... repeated on the same copies": served by "What to build", the copies (re-made at step 2's paths, `diff -r` and `cmp` before and after) and runs 1 and 2. Step 0 explains why they are re-made.
- "the two fresh reviewers' marks repeated": served by "The marks", four markers.
- "`/writing` invoked as pinned at `v7.1.0-rc.2`": served by "Each run follows `writing` as pinned" and the premise. No report item asks for evidence of the pin at the time of the runs (see 5, F9).
- "check: every finding of the repeated real runs marked right by both": no requirement. Condition 6 and C9 only ask that findings not marked right by both be listed (F1).
- "each condition of the gate on the repeated runs read from their reports and transcripts": served by conditions 1 to 8 of "What to build". Each condition asks for evidence and a list of failures, but none asks that the condition hold (F1).
- "each finding's two marks recorded in `agents/reviews/4-marks.md`": served by the record's `4-marks.md`.
- "(1 commit; orchestrator, no agent)": served by "How the rules file applies to this step".
- Gate conditions on the runs (`plan.md`, Gate), each mapped:
  - run on a real `.tex` with `\input` files and a real `.docx`: runs 1 and 2.
  - two fresh reviewer agents mark each finding, on copies: the marks and condition 6.
  - each finding not marked right by both is fixed before the gate passes: no requirement (F1).
  - each finding named at its place, an `\input` file included: condition 1 and C1.
  - grouped by rule, most consequential first: condition 2 and C3.
  - transcript shows one fresh agent that edits no file: condition 3, C5 and C6.
  - every finding quotes and proposes a replacement: condition 5 and C4.

Findings:
- F1. The step's check "every finding of the repeated real runs marked right by both", and the gate's "each one not marked right by both is fixed ... before the gate passes", have no requirement in "What to build". Condition 6 reads "every finding marked right by both, or each one that is not listed", C9 reads "lists every finding not marked right by both", and condition 5 reads "each finding that does not is listed". With ten findings marked wrong and condition 3 failing, every item of "What to build" can still be done, so the report's first line can read "Everything in the brief is done". The step-2 refuter's S1 found the same gap. The brief does not say that the step's check holds only when every finding is marked right by both and conditions 1 to 7 hold. Nor does it say what follows a failure: the first line names it as NOT DONE, the step is not ticked, and the failure goes up as an open item for a new fix step (`plan-orchestration`, "What earns a step of its own": "a landed part found wrong or short", which needs a ruling or a self-rule choice under ADR 0004/0005).

## 3. Premises

- Step 3 landed in 68c14d8, ticked: `grep -n '✅ 3' plan.md` prints line 23. `git log --oneline -1` prints `757cbcf Record the tag and pin of v7.1.0-rc.2 for plan 3`. `git rev-parse --short 'v7.1.0-rc.2^{commit}'` prints `68c14d8`. Matches, apart from the wording in F16.
- `sh utils/pin.sh` (check mode, which the script's head comment says changes nothing) prints `pinned: v7.1.0-rc.2, 14 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills` and `pinned: 5 agents linked in: ...`, exit 0. Matches.
- `git -C ~/.local/share/ordo-stable rev-parse --short HEAD` prints `68c14d8`. `readlink ~/.claude-backup/skills/writing` prints `/Users/axelfaes/.local/share/ordo-stable/skills/writing`. `diff ~/.claude-backup/skills/writing/SKILL.md skills/writing/SKILL.md` prints nothing (exit 0), and `diff -r skills/writing ~/.local/share/ordo-stable/skills/writing` prints nothing. Matches.
- Step 3's fixes in `SKILL.md` 1.0.0: read whole. Steps 3 "writes it to no file", Steps 5 "writes them to no file", Steps 7 "writes no file". The prompt's "What you run" names the one grep, the `.docx` command and the pipe. Matches.
- `grep -n 'reviewer\|standards' .agents/plan.yaml` prints line 10 `reviewer: claude:opus` and line 13 `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md]`, and no `reviewer_effort` key. Matches.
- Effort agents: the runner lists `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh`, `ordo-max`, and `ls ~/.claude-backup/agents | grep ordo` prints the five. `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1. Matches.
- `ls -la` of the scratchpad prints `3-table.md`, `mk3.py`, `plan-before-spec-4.md`, `r1.md` and `st.txt`, and no `3-2-run/`. Matches.
- `git -C research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs` prints nothing. `git log -1 --format='%h %ad' --date=short -- projects/manuscripts/hccnet-revision/manuscript` prints `4809064d8 2026-08-24`, and the same for the `.docx` prints `b1ac07d01 2026-09-24`. Matches. `--ignored` shows only `.DS_Store` and `main.pdf`, and `find . -newer 2-run/manuscript-report.md -type f` in the manuscript folder prints nothing, so the copies will hold step 2's text.
- 33 files: `grep -c '\\input{' main.tex` prints 21, and the grep over `sections` prints 11 lines. A loop over the distinct names with `.tex` added prints `32 ok`. No command line contains `%`. Matches.
- `find . -name '*.tex' -exec awk 'length($0)>2000' {} \; | wc -l` prints 0, and `wc -l` prints `202 ./main.tex` as the largest. Matches.
- `python3 -I skills/writing/templates/docx_paragraphs.py <grant> | wc -lw` prints `73 2751`. Part lines are at output lines 64 to 69 (`[word/footnotes.xml]`, `[word/endnotes.xml]`, `[word/header1.xml]`, `[word/footer1.xml]`). Matches.
- Step 2's record: `ls agents/reviews` lists `2-run`, `2-marks.md` and `2-report.md`, and `2-run/` holds the six files. Matches.
- Transcript paths: `ls -la <...>/3998c800-....jsonl` exists, and `subagents/agent-a56140d7966ed9ada.jsonl` and `.meta.json` exist. The meta holds `"agentType":"ordo-high"`, and `grep -o '"model":"[^"]*"' | sort | uniq -c` prints `17 "model":"claude-opus-5-5"`. Matches. The brief gives no command for "the `name` of each `tool_use`" (F10).
- `git diff --quiet aa513eb HEAD -- docs/dev/building.md` exits 0. Matches.
- ADR quotes: each matches the "Decision" section of 0001, 0002, 0003 and 0006, `Status: proposed`.

Findings:
- F16. "Main's head 68c14d8 is tagged `v7.1.0-rc.2` and pinned": main's head is 757cbcf. The tag and the pin are at 68c14d8, and `git show --stat 757cbcf` changes only `orchestrator-state.md` (`git diff --stat 68c14d8 757cbcf -- skills` prints nothing). The sentence should say "68c14d8, main's head before 757cbcf, which changes only the state file, is tagged ...".
- F10. The premise names `grep -o '"model":...'` for the model but no command for the tool names. A raw grep of tool names over a transcript gives false hits. `grep -n -o '"name":"Edit"' agent-a6c38a91aa8778321.jsonl` prints `20:"name":"Edit"` twice, and a raw `grep -o '"name":"[A-Za-z]*"'` count prints `2 "name":"Edit"`, `2 "name":"Write"` and `2 "name":"Agent"`. Counting only the `tool_use` blocks of that transcript's assistant entries (a python read of `message.content[].type == 'tool_use'`) prints `Counter({'Read': 3, 'Bash': 1, 'SubagentHandback': 1})`. Conditions 3 and 4 and C5 and C7 rest on these counts, so the brief should state that counts are taken over `tool_use` blocks of assistant entries only, for both the agent's transcript and the session's.

## 4. Cases and checks

- C1: consistent with `SKILL.md`, "A finding" (place forms). It checks the step's record.
- C2: consistent ("paragraph 31 [word/footnotes.xml]" form).
- C3: consistent with "How you group them".
- C4: consistent with "A finding" (the replacement is text, or "delete").
- C5: consistent with "What you run" (`LC_ALL=C grep -n '[^ -~]' <file>`, "once for each file"; for a `.docx` the command, then the grep on its output through a pipe; no redirect).
- C6: consistent with "What you read". The 2000-line and 2000-character premises hold.
- C7: consistent with Steps 3, 5 and 7.
- C8 and C9: consistent with the rules file, but see F1 and F4.
- The opening note ("the first run of each case is `ls ...` ... noted once for all nine cases"): consistent with the template.

Findings:
- F11. Condition 1 says "by a script the report quotes with its output". `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read", says "A new script needs the user's approval of what it computes before it is written". `plan-orchestration`'s `references/self-rule.md` kind 3 leaves "an option that adds ... a script" to the user. `grep -rn -i 'placecheck\|place check' .scratch/choices.md plan.md orchestrator-state.md agents/briefs/` finds the step-2 script only in the orchestrator's round brief (`2-round-1.md:10`) and no approval by the user. The brief either asks for the place check as commands (`sed -n '<line>p' <file> | grep -qF -- '<quote>'` per place, quoted with output, as step 2's hand checks were), or raises the script's computation for approval.
- F12. "How the rules file applies to this step" says the rules file's "Where the work happens" ("No sub-agents; no background shells ...") "binds a builder agent". The rules file's opening says it governs "How a change is made in this tree, whoever makes it: a session working inline, or an agent dispatched under a brief", and "nothing in a brief overrides anything here". So the stated reading is false as written. The agents the step starts rest on the plan's gate and Open item V (two fresh reviewer agents) and on `writing` Steps 5 (the review agent). The brief should give that as the ground, or name the clash.

## 5. The question

The goal the step delivers: the repeated real runs of the pinned `/writing`, with every finding marked right by both and every gate condition on the runs holding.

- Copies, `diff -r`/`cmp` before and after: no. Verify 2 reruns them.
- The runs, run shape: yes (F2, F3, F8, F9).
- Record of the reports, byte for byte: yes. No item asks the report to show the saved file equal to the agent's final message apart from character names, and the brief does not say where that message is in the transcript (F18, F4).
- The marks: yes (F4, F5, F6, F7, F14).
- `4-marks.md` and condition 6, C8, C9: yes (F1).
- Conditions 1 to 5 and 7 as evidence items: yes, since listing a failure completes each item (F1).
- Condition 8: no. It is a statement of scope.
- C1, C2, C4: no. Each fails on a wrong place or a missing quote.
- C3: no, given condition 2's stated criterion (a line naming what the reader loses).
- C5, C6: no for the agent. They count on F10's method.
- C7: yes, in part. The session's reads of the draft are not checked (F8).
- Step line check: yes (F1).

Findings:
- F2. The turn shape the brief dictates can be broken with no evidence showing it, which was step 2's refuter S3. No condition and no case asks the transcript to show:
  - (a) the grant run's `Skill` call stands after the manuscript agent's completion notice, in the turn that notice starts;
  - (b) the text that ends each of those two turns equals the review agent's final message whole, with nothing added;
  - (c) no turn ends between a completion notice and its report.
  Condition 4 and C7 read only writes. The brief also leaves one case open. If the grant run's Steps 6 finds a served model other than the configured one, that stop's message "ends the turn" (`SKILL.md` Steps 6 and Stops). That turn must also end with the manuscript report (Steps 7). The brief should say which message ends that turn and how the other run's requirement is then met. On the shape itself: it follows Steps 5 to 7 as written. Steps 7 asks only that, when the runner reports the end, the report be the message that ends the turn, so the Skill call and Agent start of the grant run before that message do not break it. Steps 3, 5 and 7 forbid writes, and the brief's no-write span is stricter but consistent.
- F3. Condition 3 asks for "one `Agent` call in the session's transcript between the run's `Skill` call and its report". Under the brief's own shape, the manuscript run's span (its `Skill` call to the end of the turn its notice starts) holds the manuscript `Agent` call, the grant run's `Skill` call and the grant `Agent` call: two `Agent` calls. Step 2's refuter P4 found this, and step 2's report fixed it by counting to "the next `Skill` call or the end of the turn". The condition should count from the run's `Skill` call to the next `Skill` call or the run's report, whichever comes first.
- F4. The markers can break what the brief requires of them without the report showing it, which was step 2's refuter S4. No condition or case asks for:
  - the evidence that each marker's prompt holds the report text byte for byte, with no file path (the `Agent` call's prompt in the session's transcript against the review agent's final message);
  - each marker's `tool_use` names and counts, with its `Read` calls covering the three pages and all 33 files, or the script's command for the grant, and no write, no `Agent` and no `Skill`;
  - its `agentType` and served model;
  - that the two markers of a run saw nothing of each other's marks.
  C8 checks only the marks and that the ids differ. A marker that reads only the report and marks every finding right meets C8 and condition 6.
- F9. "invoked as pinned at `v7.1.0-rc.2`" has no evidence item. Examples are `sh utils/pin.sh` check mode before the first run, and the base directory the `Skill` result names (`~/.claude-backup/skills/writing` resolving into `ordo-stable` at 68c14d8).
- F8. `SKILL.md` Steps 5: "The session reads no part of the draft apart from the lines the `grep` of Steps 3 prints". Condition 4 lists the session's `tool_use` calls in the span "with no `Write`, `Edit` or `NotebookEdit` and no `Bash` command that writes". It does not read them for a read of a draft file (a `Read` of a copy, a `cat` or a `sed`). The brief repeats the requirement but asks for no evidence of it.

## 6. Implied inputs

- Not a code step. The step is a judgment step run by the orchestrator, and its scripts are the existing `docx_paragraphs.py` and, under condition 1, a scratch place check (F11).

Findings: none.

## 7. ADRs

`adr` is not set in `.agents/plan.yaml` (`grep -n '^adr'` prints nothing), so the folder is `docs/adr`. Every record is `Status: proposed`.

- 0001: touches the step (the prose standard read from `standards`). Named.
- 0002: touches the markers' condition 2. Named.
- 0003: touches the runs. Named with its first sentence only. The no-write and nothing-added requirements of the run shape are under its second sentence, "The session shows its report to the user and changes nothing." (F17)
- 0004 and 0005: touched only if the step takes a choice under self-rule, such as the route of F1 or the wait of F13. The brief takes none, and names neither.
- 0006: touches the booking. Named.
- 0007, 0008, 0009: do not touch the step (repair-round model, cost script table and counts).
- 0010: concerns `/spec`'s preflight and `/land`, not the step's work. The brief states the verify list equality.
- 0011: concerns dispatch blocks, not the step's work.
- 0012: concerns commits on main and landing order, not the runs.

Findings:
- F17. ADR 0003 is named by its first sentence. The decision sentence the session's run shape is under, "The session shows its report to the user and changes nothing.", is not named. Step 2's refuter S2 cited it for the same rule. No part of the brief contradicts an ADR.

## 8. Dictated text

- "review agent of the manuscript run of step 4", "review agent of the grant run of step 4", "marker 1 of the manuscript run of step 4" (roles for `plan.md`): `grep -n 'review agent of the manuscript run of step 4' 4.md` prints line 87. Holds.
- "Agents in no role the cost script prices:" (existing heading): `grep -n 'Agents in no role the cost script prices:' 4.md` prints line 87. Holds.
- "What the marks do not check: they judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none" (for `4-report.md`, "in those words"): `grep -n 'no check counts breaks a report missed' 4.md` prints line 86. Holds against the prose standard (21 words after the colon, no dash, no filler).
- "Everything in the brief is done" (the report's first line): `grep -n '"Everything in the brief is done"' 4.md` prints line 163. Holds.
- The markers' four conditions (lines 65 to 69) are words for an `Agent` prompt, not for a file, so they are not dictated text. Their substance is in F5 to F7.
- `LC_ALL=C grep -n '[^ -~]' 4.md` prints nothing. `grep -n -E '[^[:space:]] - | -- ' 4.md` hits only lines 14, 26 and 155, where `--` is a git argument inside code.

Findings: none.

## Further findings (the markers' conditions against the pinned skill text, and other points)

- F5. Marker condition 4, "The replacement ends the break without changing what the passage claims", marks wrong a finding that follows the skill in two places.
  - `SKILL.md`, "A finding": "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." `rules.md`, "Hedging", says "The replacement uses a device of the strength the evidence carries" and "A hedge on a claim of one of those kinds is reported and cut". "Limitations" says "The replacement adds the alternative or the limit".
  - `SKILL.md`: "The added text is the author's fact in square brackets, or a claim that the draft's own data hold." Condition 4 admits the first and not the second.
  `agents/briefs/3-cases.md` rulings 1 and 3 settled both points (ruling 1: "beyond the change the named rule asks of it ... This is the standard both markers applied"; ruling 3: grant 44 "is added text ... it stands"). The brief's Decision 3 carries only ruling 2. Condition 4 should read: the replacement ends the break and changes no claim's scope or strength beyond the change the named rule asks; or it adds the author's fact in square brackets, or a claim the draft's own data hold; or it is "delete" as the condition now says.
- F6. A finding the skill forbids can be marked right under the four conditions.
  - `SKILL.md`, "A finding": the replacement "is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"". Condition 4 does not fail an instruction. The markers' extra list names one, but that is not a mark, so a finding with an instruction replacement can be marked right by both. Step 2's grant 56 and 59 were (`2-refuter.md`, P2).
  - "Findings on one passage, or on two places of one claim, propose changes that can all be applied together": no condition checks this, so two findings whose replacements conflict can each be marked right.
  Condition 4 should require replacement text that reads in place of the passage, and the markers should check findings on one passage together.
- F7. Marker condition 1, "The quoted passage stands at the place the finding names, as the draft has it", is read literally against the skill's own quote forms. A hard-wrapped paragraph "quotes the end of the first line and the start of the next. "..." stands for the rest". A paragraph split quotes two sentences. A finding that adds text quotes the sentence where the text belongs. A marker reading condition 1 literally marks a "..." quote wrong for following the skill. The condition should say the passage is quoted in the form `SKILL.md`, "A finding", gives for its kind. Condition 3 should also say it applies where the finding's rule is a register's or turns on the discipline, so that it is not read against every finding.
- F13. The step's run cannot finish without the user. The brief says "The step then waits for the user's next message, whatever it says". The state file has `self_rule: on` (`grep -n self_rule orchestrator-state.md` prints line 34), so this stalls the unattended loop. The brief does not list it under "Decisions taken in this brief", and it does not give the reason: no turn starts after the grant report otherwise, and starting the markers inside a run's span would add `Agent` calls to it.
- F14. Two marker contingencies are not covered.
  - The brief does not say how a mark a marker leaves out is obtained. Step 2's grant marker 2 left out finding 34 and was resumed (`2-report.md`, DONE table). The brief should say whether a resume of the same marker is allowed and how independence is kept.
  - It does not say that each marker's served model is read right after its start, with the stop when it is not `claude-opus-5-5`, as `writing` Steps 6 and `plan-orchestration`'s "Launching a builder" do for their agents.
- F18. "takes each report from the review agent's final message in its transcript, byte for byte": an `ordo-*` agent ends with a `SubagentHandback` call, so the report is that `tool_use`'s `message` input. Step 2's refuter compared against "each agent's SubagentHandback message". The brief should name that field so that "byte for byte" can be checked.
- F15. "Paths this step writes" ends "The step writes these paths and nothing else". The step also writes the copies under `<scratchpad>/3-2-run/`, and under condition 1 any scratch place-check input. They are outside the repository, and the brief should name them as writes outside the repository.

## Declined to judge

- Whether the runner delivers a background agent's completion notice as a turn of its own when the session is busy in another turn, for example a user message during the manuscript run. The brief's shape assumes it does. A read of the skill texts cannot settle it; the transcripts of the runs will show it.
- Whether the groups' order is "the most consequential first". That is the reading condition 2 asks of the session, and no rerun settles it.
- Whether the term "marker" belongs in `docs/glossary.md`. It is booked as a role, and the user asked what it meant during step 2 (`2-refuter.md`, Declined to judge). The term is the user's call.

Agent usage: ad1ea91040f763510, claude-opus-5-5, 196338 tokens, 47 tool uses, 8.2 minutes.

## Closed

- F1: closed in the brief, "What to build", a bullet before the booking: the step's check holds only when every finding of both runs is marked right by both and conditions 1 to 7 hold; otherwise the first line names each failure as NOT DONE, the step is not ticked, and each failure goes to the user as an open item; C9 says the list must be empty.
- F2: closed in the brief: the run shape adds that no turn ends between a notice and its report, and the case of a model stop in the grant run (the manuscript report whole, then the stop's message, the step NOT DONE); condition 4 and C7 ask the transcript for the turn shape (a), (b) and (c).
- F3: closed in the brief, condition 3: one `Agent` call from the run's `Skill` call to the next `Skill` call or the run's report, whichever comes first.
- F4: closed in the brief, condition 6 and C8: each marker's type, served model, prompt holding the report as text, `tool_use` names and counts with the reads of the three pages and the whole draft, and no sight of the other's marks.
- F5, F6 and F7: closed in the brief, the markers' conditions 1, 3 and 4 rewritten to the pinned skill and to `3-cases.md` 1 to 3, with findings on one passage marked together.
- F8: closed in the brief, condition 4 and C7: no read of a draft file beyond the Steps 3 `grep`.
- F9: closed in the brief, the run shape and condition 4: `sh utils/pin.sh` before the first run and each `Skill` result's base directory, quoted.
- F10 and F18: closed in the brief, "What is on the tree": counts over the `tool_use` blocks of assistant entries only, and the final message as the `SubagentHandback` `message` input; the record bullet names that field.
- F11: closed in the brief, condition 1: one command per place, `sed -n '<line>p' <file> | grep -cF -- '<part of the quote>'`, quoted with its output, and no script file.
- F12: closed in the brief, "How the rules file applies to this step": the agents rest on `writing` Steps 5 under ADR 0003 and on the user's Open item V; no agent does the orchestrator's own work.
- F13: closed in the brief, Decision 6, with its reason.
- F14: closed in the brief, "The marks": each marker's served model read after its start, with the stop; one resume of a marker that leaves out a finding, naming only the findings left out.
- F15: closed in the brief, "Paths this step writes": the copies under `<scratchpad>/3-2-run/` named as the only write outside the repository.
- F16: closed in the brief, "What is on the tree": 68c14d8, main's head before 757cbcf, which changes only the state file.
- F17: closed in the brief, ADR 0003 with its second decision sentence.
