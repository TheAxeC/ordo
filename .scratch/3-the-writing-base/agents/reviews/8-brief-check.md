# Step 8 brief check (on main at 8e0e29e)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/8.md`. Pages are cited by section. A line of the brief or a grep hit keeps its `file:line` as `grep -n` printed it.

What was read in full: the brief; plan.md (Goal, Gate, the step list, Rulings with Open item I, Agents, the Step 0 of steps 6 and 8, every booking); `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, `skills/repo-setup/templates/docs/dev/prose-standard.md`, `docs/glossary.md`; the pinned `skills/writing/SKILL.md`, `references/rules.md`, `references/registers.md`; ADRs 0001 to 0012; `6-report.md` lines 1 to 200 (everything before "Place checks", plus the first five manuscript place checks), and a sample of its "Place checks": manuscript entries for report lines 6, 11, 16, 20 and 25, grant entries for report lines 6, 10, 14, 18, 22 and 355, plus "Files".

## 1. Names

The step renames nothing. It creates three ledger paths: `8-run/`, `8-marks.md` and `8-report.md`.

- `grep -rn --exclude-dir=.git -e '8-marks\.md' -e '8-run/' -e '8-run\b' -e '8-report\.md' . | grep -v '^./.scratch/3-the-writing-base/agents/briefs/8.md'`. Hits outside the brief:
  - `.scratch/3-the-writing-base/plan.md:28`, step 8's own line ("each finding's two marks recorded in `agents/reviews/8-marks.md`"). The step makes this line true, not false.
  - Under `.scratch/archive/` (2-e-a-self-rule, 2-e-grill, 2-b-repair-..., 1-one-layout-...), each one another plan's own `8-report.md` or `8-refuter.md`. These are other ledgers, and the step leaves them true.
- The booking roles in "What to build" ("review agent of the manuscript run of step 8" and the others) are new lines that `/land` writes. They rename no existing term.

Findings: none.

## 2. The step line

Step 8's line: "The fourth runs, the last runs: step 6's runs and the two fresh markers' marks repeated on the same copies, `/writing` invoked as pinned at `v7.1.0-rc.4`; check: every finding of the repeated real runs marked right by both, each condition of the gate on the repeated runs read from their reports and transcripts, and each finding's two marks recorded in `agents/reviews/8-marks.md` (1 commit; orchestrator, no agent) (ruling I)".

- "the last runs" and "(ruling I)": "What is on the tree", the bullet on ruling I; "What to build", the bullet that starts "The step's check holds only when" (step 9 fixes with no further run, and no open item).
- "step 6's runs ... repeated": "What to build", runs 1 and 2, and the bullets under them.
- "on the same copies": the copies paragraph of "What to build" and Decision 1.
- "the two fresh markers' marks repeated": "What to build", "The marks" and its bullets.
- "`/writing` invoked as pinned at `v7.1.0-rc.4`": the `describe` bullet and the `Skill` result's base directory, plus gate condition 4's quote of the pin.
- "every finding ... marked right by both": C9, and the check bullet of "What to build".
- "each condition of the gate ... read from their reports and transcripts": the `8-report.md` bullet, conditions 1 to 8.
- "two marks recorded in `agents/reviews/8-marks.md`": the `8-marks.md` bullet, and C8 and C9.
- "orchestrator, no agent": "How the rules file applies to this step" (executor `inline`, the six agents resting on ADR 0003 and Open item V).
- "1 commit": no requirement of "What to build" names it. The record is written in the main checkout's ledger and committed by `/land`, as in steps 2, 4 and 6 (`land.sh`: "nothing to copy" in each booking). No item is needed for it.

Findings: none.

## 3. Premises

- Pin and tag:
  - `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.4`.
  - `git -C ~/.local/share/ordo-stable rev-parse --short HEAD` printed `09601dc`.
  - `git tag --points-at 09601dc` printed `v7.1.0-rc.4`.
  - `readlink ~/.claude-backup/skills/writing` printed `/Users/axelfaes/.local/share/ordo-stable/skills/writing`.
  - `diff -r ~/.local/share/ordo-stable/skills/writing skills/writing` printed nothing (`diff exit 0`).
  - All of these match the brief.
- The pin output "pinned: v7.1.0-rc.4 (09601dc), 14 skills linked" is quoted at `orchestrator-state.md:117`. The check mode (`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.sh`, which the head comment says changes nothing) printed `pinned: v7.1.0-rc.4, 14 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills` and `pinned: 5 agents linked in: ...`, exit 0. This matches.
- `git log --oneline 09601dc..HEAD` printed one line, `8e0e29e Pin v7.1.0-rc.4 after step 7 of plan 3`. `git show --stat 8e0e29e` shows only `orchestrator-state.md` and `plan.md` changed. This matches. Step 7 is ticked at `plan.md:27`.
- Step 7's fixes: `git diff c99b4a6 09601dc -- skills/writing/SKILL.md` shows the following, all as the brief's sub-bullets state them:
  - "The last pass".
  - The rule that a passage breaking two or more rules is given once, in the first group that reaches it, with one replacement, and names the other rules "by its page and section in a line of its own". SKILL.md also says "or the other term", which the brief leaves out without changing the meaning.
  - "Every list of places gives each place as its own entry".
  - The bracket sub-bullets.
  - `git diff --stat` also shows `references/rules.md` changed (12 lines). The version is `1.0.0` (`grep -n version`). This matches.
- `.agents/plan.yaml`: `grep -n 'reviewer\|standards'` printed line 10 `reviewer: claude:opus` and line 13 `standards: [..., skills/repo-setup/templates/docs/dev/prose-standard.md, ...]`. `grep -n '^ *reviewer_effort:'` exited 1, so the key is absent and the agent is `ordo-high`, since SKILL.md "What it reads" 1 says `high` when the key is absent. `diff` of the pinned prose standard with main's exited 0. This matches.
- Effort agents: the runner's agent types list `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, and `ls ~/.claude-backup/agents/` shows the five files. `printenv CLAUDE_CODE_EFFORT_LEVEL` printed nothing, `effort exit 1`. This matches.
- Copies:
  - `diff -r <scratchpad>/3-2-run/manuscript <research-hub>/projects/manuscripts/hccnet-revision/manuscript` gave `ms diff exit 0`.
  - `cmp` of the grant copy with its source gave `cmp exit 0`.
  - `git -C research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs` printed nothing (`rh status exit 0`).
  - All three match.
- Manuscript files:
  - `grep -n -e '\\input{' -e '\\include{' main.tex | wc -l` printed `21`.
  - The same grep over those 21 files printed 11 `\input` lines, in `b_architecture.tex` (1), `d_results.tex` (6), `1_conv_layer.tex` (1), `3_hyperparams.tex` (1), `1_baseline.tex` (1) and `2_reliability.tex` (1).
  - The 11 nested files exist and hold no further command (`grep -c` printed 0 for each).
  - So 1 + 21 + 11 = 33.
  - `find . -name '*.tex' | wc -l` printed `49`, and `find . -name '*.tex' -exec awk 'length($0)>2000' {} \; | wc -l` printed `0`.
  - All of this matches. One more fact supports "one read reads each file whole": the largest draft file is `d_results.tex`, at 8753 bytes, and the longest is `main.tex`, at 202 lines (`wc -c`, `wc -l`). Both are far below the file-reading tool's cut.
- Grant: `python3 -I skills/writing/templates/docx_paragraphs.py <copy> | wc -lw` printed `73 2751`. `grep -cE '^[0-9]+:'` printed `69` (10 of them empty paragraphs), and `grep -cE '^\['` printed `4`. This matches.
- Step 6's record: `ls 6-run` lists the two reports, the four marks files and the two `-reasons` files. `6-report.md` has "Place checks" at line 180. `6-report.md` lines 117 to 120 are the marker-command bullets the brief cites. This matches.
- Transcripts:
  - The session transcript `3998c800-....jsonl` exists, and `subagents/` holds 460 files.
  - `agent-a99cdbe7fbe41e52f.meta.json` reads `"agentType":"ordo-high"`, and `grep -o '"model":"[^"]*"'` printed `78 "model":"claude-opus-5-5"`.
  - The helper `extract_handback.py` reads the `message` input of the hand-back `tool_use` and prints `dst len chars`.
  - This matches, apart from F1.
- Verify list: `git diff --quiet c99b4a6 HEAD -- docs/dev/building.md` gave `building exit 0`. `c99b4a6` is "Prepare step 7 of plan 3". This matches.
- ADR quotes: 0001, 0002, 0003 and 0006 are quoted word for word from each record's Decision. This matches.

Findings:

- F1. The helper the brief names cannot save a resumed marker's messages.
  - The brief's "What to build", in "The record of the reports" (`8.md:66`), says "Each marker's final message is saved the same way". The `8-run` bullet (`8.md:89`) saves a resume reply "with the suffix `-resume`" and names no helper.
  - `extract_handback.py` holds `assert len(msgs) == 1, len(msgs)`.
  - A resumed marker's transcript holds two hand-backs. Step 6's resumed markers show this: a `python3 -I` count of `SubagentHandback` `tool_use` blocks printed `agent-af9e18c06b5359637.jsonl 2` and `agent-a497a69fded97a0ab.jsonl 2`.
  - Once a marker is resumed, the named helper exits with `AssertionError: 2` for both its marks file and its `-resume` file.
  - The scratchpad also holds `extract_last_handback.py`, which takes the last hand-back. The brief names it nowhere, and no helper takes the first hand-back after a resume.
  - The helper also adds a final newline when the message lacks one (`if not text.endswith('\n'): text += '\n'`). "Byte for byte ... apart from character names" is therefore not exact.
  - Fix: name the helper for each file, or say that each marker's marks file is saved before any resume.
  - Fix: state the added final newline beside "verbatim apart from character names".

## 4. Cases and checks

- C1, C2: consistent with SKILL.md, "A finding", the place forms and the list-of-places rule. Each reads the unchanged draft copies to check that a passage stands at its place, which gate condition 1 requires.
- C3: inconsistent. See F4.
- C4: consistent with SKILL.md, "A finding" (passage and replacement rules).
- C5: consistent with SKILL.md, "What you run". C6 is consistent with "What you read", and C7 with Steps 5 and 7 and the brief's turn shape.
- C8: consistent with the user's Open item V and the change standard's "Scripts compute facts; judgment is read" (a gate for a judgment is a fresh reviewer agent's review where the user rules so).
- C9, C10: consistent.
- C11: inconsistent for the grant markers. See F3.
- C12: consistent with SKILL.md's rule that a passage is given once. It is narrower than that rule. See F6.
- Every case is checked through the record the step writes. The first run is one `ls`, which is consistent with the brief template's rule for a record that does not yet exist.
- The cases also read places the step does not change: the draft copies (C1, C2) and the transcripts (C5, C6, C7). They read them because the gate's conditions are read there, not to explain them. I raise no finding for this.
- The record is written in the main checkout, against the rules file's "Where the work happens" ("never in the main checkout"). The brief's "How the rules file applies to this step" states this. It matches how ledger records reach main: the glossary's **wip** leaves the ledger root out of the worktree commit, and the orchestrator copies a report to main. I raise no finding for this.

Findings:

- F2. The brief contradicts itself on whether the session's response holds a report.
  - The brief's "What to build" (`8.md:58`) says "The report is shown whole, with nothing added, as the message that ends the turn", as SKILL.md Steps 7 requires.
  - The same section (`8.md:66`) says "The session's own response never holds a report's text."
  - Decision 5 (`8.md:141`) says "so the session never writes a report into its own response".
  - The text that ends each run's turn is the session's response, and it holds the whole report. Read literally, `8.md:66` and `:141` forbid what Steps 7 and gate condition 4 require.
  - The cause step 4 recorded is a marker prompt that held the report. The two sentences need to name what they mean: no `Agent` prompt, resume message or command of the session holds a report's text, outside the text that ends each run's turn.
- F3. C11 and gate condition 6, read literally, fail every grant marker.
  - C11 (`8.md:117`) and gate condition 6 (`8.md:97`) say "no command that prints a draft file". Condition 6 also says "no `grep` on ... a file outside the draft".
  - The grant markers must run `python3 -I <pinned skill folder>/templates/docx_paragraphs.py <copy>` (`8.md:71`), which prints the draft.
  - The marks bullet (`8.md:72`) says "every `grep` names each file it searches by its path, one of the files the prompt lists". A grant marker's `grep` on the script's output through a pipe names no file.
  - Step 6's grant markers each ran that one command (`6-report.md`, condition 6: "The one command is the script's command on the copy").
  - Fix: C11, condition 6 and the marks bullet should make an exception for the grant markers' script command and for a `grep` on its output through a pipe.
- F4. The group-line rule given to the markers is narrower in one place and wider in another than SKILL.md's "How you group them".
  - The marker bullet (`8.md:83`) asks the marker to name a group "whose line does not name what the reader of this draft loses". C3 (`8.md:109`) and gate condition 2 (`8.md:93`) use the same words.
  - SKILL.md, "How you group them", also says: "A group whose breaks change no claim says so in its line. That line names what the break costs the reader instead". Under the brief's words, a line that does this, as SKILL.md asks, is named a failure. Step 6's own reading kept such lines ("names a cost", 11 lines in `6-report.md`, condition 2), so the brief's words would set the session and the markers at odds.
  - The bullet also leaves out "as one of the group's own findings shows" and "The loss holds in the draft's own text and data". Step 6's manuscript line 16 failed on the second, and only one marker named it. A line that names a loss the draft does not hold passes the marker bullet.
  - Fix: the marker bullet, C3 and condition 2 should read each group line against SKILL.md's "How you group them" whole.

## 5. The question

The goal is the part of the plan's goal that this step delivers: real runs whose every finding both markers mark right, with every gate condition on the runs holding.

- C1, C2: yes, alone, because they check places and not rightness. Together with C9, no.
- C3: yes, with the rule as written. See F4.
- C4: no. Each finding's passage and replacement are read in the reports.
- C5, C6, C7: no. Each is a fact counted over the transcripts' `tool_use` blocks.
- C8: yes, in a limit the user ruled. Two markers on the same model as the review agent can both mark a wrong finding right. Open item V accepts two fresh reviewer agents in place of the user's marks.
- C9 and the step line's check: yes, in two ways.
  - First, when a marker condition is narrower than the rule the review agent was given: F4, F5, F6.
  - Second, when a report holds few findings, because nothing counts what a report leaves out. Gate condition 8 states this, and step 7's last pass now drops findings. See F8.
- C10, C11: no for C10. C11 can fail although the goal is reached (F3), which is the reverse of the question.
- C12: yes, for a passage that breaks a rule the finding does not name. See F6.
- The copies, the pin, the turn shape and the report saving: no. Each is a command's output or a transcript fact. For the marker's served model, see F7.
- The marks: matched against what the pinned SKILL.md now asks:
  - The last pass's "still breaks" line: named by the marker (`8.md:83`) and listed under condition 5. This matches.
  - The rule that a passage breaking two rules is given once: "any passage or place the report gives twice" and conditions 2 and 4 cover a named further rule. A passage with an unnamed further rule is not covered (F6).
  - The list-of-places rule: each entry is a row with conditions 1 and 4, and an entry with no passage or replacement is named. This matches.
  - The vague-qualifier bracket: condition 4 reads every rule of "A finding" for a replacement. This matches.
  - A term a replacement brings in under another rule: not covered (F5).
  - Group lines: see F4.
- The record (`8-report.md`, conditions 1 to 8): no for conditions 1, 3, 4, 5 and 7, each a command or a reading quoted. Condition 2 inherits F4, and condition 6 inherits F3 and F7.

Findings:

- F5. Condition 4 misses the rule that now governs a term any replacement brings in.
  - Condition 4 (`8.md:80`) judges a replacement against "each rule `SKILL.md`, "A finding", gives for a replacement and for the finding's kind, as pinned, and the named rule's own rule for its replacement".
  - Step 7 widened `references/rules.md`, "Terms defined at first use", to every replacement under any rule: "A replacement brings in a technical term whenever its passage does not hold the term ... Such a term is used only where the draft defines it at or before the passage. Otherwise the replacement defines it, or names its definition in square brackets". SKILL.md's last pass checks "Each technical term the replacement brings in meets `references/rules.md`, "Terms defined at first use"".
  - A "Hedging", "Formality" or section A finding whose replacement brings in an undefined term follows "A finding" and its named rule, so it passes condition 4 although the review agent was told to avoid exactly that. Step 6 had two rows of this kind ("A term brought in and not defined").
  - Fix: condition 4 should also name `references/rules.md`, "Terms defined at first use", for every term a replacement brings in.
- F6. A finding that leaves out a further rule its passage breaks passes both marks.
  - SKILL.md, "A finding": "A passage that breaks two or more rules ... has one replacement that ends every break ... It names each other rule it breaks".
  - Condition 2 (`8.md:78`) and condition 4 (`8.md:80`, "ends the break of every rule the finding names") judge only the rules the finding names. C12 says the same ("every break it names").
  - A finding whose passage also breaks a rule it does not name, and whose replacement leaves that break in place, is marked right by both markers.
  - This concerns the reported passage only. It is not a count of breaks the report missed, which condition 8 leaves out.
  - Fix: condition 4 adds that the replacement leaves no break of a rule of the four pages in the passage. A finding whose passage breaks a further rule names it in a line of its own, as SKILL.md asks.
- F7. The markers' model read has no rule for a read that prints no model line.
  - The marks bullet (`8.md:74`) says "Right after each marker's start, the session reads its served model from its transcript, with no `sleep` before the read".
  - For the review agent, the brief (`8.md:56`) gives a second read at the next tool call, and a read before anything the agent wrote is shown or used.
  - The marker bullet gives neither. The four markers are started together. Step 4 recorded two starts with "no model line in its record" (plan.md, Agents 13 and 14).
  - Fix: the marker bullet should take the same rule as `8.md:56`.
- F8. A collapse in the number of findings stays out of view.
  - The check holds for a report with any number of findings, however small. The last pass now drops a finding "whose passage an earlier group already gives".
  - Gate condition 8 says that no check counts what a report missed, which is the gate's own limit under Open item V and plan 2.1 ruling C.
  - The record gives the reader no figure to see a collapse against: step 6's runs had 191 manuscript rows and 74 grant rows (`6-marks.md`, plan.md booking).
  - Fix: `8-report.md` states each run's row count beside step 6's, as a fact for the user. This is a count and gates nothing.

## 6. Implied inputs

Not a code step: the step changes no script, test or configuration file and writes only ledger records.

Findings: none.

## 7. ADRs

- 0001: touches the step. The runs read the prose standard through Ordo's `standards`. Decision: "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, ...". Named in the brief, which does not contradict it.
- 0002: touches the step through the markers' condition 2. Decision: "The prose standard holds for every text the writing skills write or review." Named, not contradicted.
- 0003: touches the step through the run shape and the transcript conditions. Decision: "`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule." and "The session shows its report to the user and changes nothing." Named. The brief's `8.md:66` and `:141` (F2) read against "shows its report", but the brief's "What to build" (`8.md:58`) follows it.
- 0006: touches the step through the booking of its six agents. Decision: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model". Named, not contradicted.
- 0004 (self-rule endings): the step takes no decision under self-rule (Decision 6, and the check bullet's "no open item is raised"), so it does not touch the step.
- 0005 (choices file): no choice is taken, so it does not touch the step.
- 0007 (`repair_reviewer`): governs a `/refute` run over a repair round, not the step's work, so it does not touch the step.
- 0008, 0009 (cost script): the step's agents are booked "in no role the cost script prices", so they do not touch the step.
- 0010 (verify list): governs `/spec` and `/land`. The step changes neither the list nor the page, and the brief states the list is equal. It does not touch the step.
- 0011 (dispatch block): the step's own work does not change it, so it does not touch the step.
- 0012 (commits name their paths): the step makes no commit, since `/land` commits the record. It does not touch the step.

Findings: none.

## 8. Dictated text

The brief dictates three lines, all of which hold:

- "What the marks do not check: they judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none" (to appear "in those words" in `8-report.md`). `grep -n -e 'in those words' 8.md` printed `99`. It holds: the sentence has 21 words, within the prose standard's section E "under roughly 20", with no semicolon inside the dictated words and no word from section A.
- The roles "review agent of the manuscript run of step 8", "review agent of the grant run of step 8", "marker 1 of the manuscript run of step 8" and the others, under "Agents in no role the cost script prices:". `grep -n -e 'review agent of the manuscript run of step 8' 8.md` printed `101`. They hold, and match the glossary's **Agents section** form and plan.md's items 16 to 21.
- The first line "Everything in the brief is done". `grep -n -e 'Everything in the brief is done' 8.md` printed `184`. It holds, as the rules file's rule 7.

"the sentence that there are none" (`8.md:90`) names a sentence without dictating its words. Every other record file is written from agents' output or from commands.

Findings: none.

## Declined to judge

- Whether two markers on the same model as the review agent are a strong enough check: that is Open item V, the user's ruling.
- Whether the markers' "right" marks will be correct: that is what the step itself measures.
- Whether `extract_last_handback.py`, or a helper that takes the first hand-back, needs the user's approval as a new script. These are scratchpad helpers, not repository scripts. Whether the change standard's rule ("A new script needs the user's approval of what it computes") reaches them is the orchestrator's reading.
- I did not reread all of "Place checks" of `6-report.md`. The sample is named at the top.

Agent usage: a4f02d8519832d0b6, claude-opus-5-5, 218117 tokens, 45 tool uses, 7.1 minutes.

## Closed

Each finding is closed by a change to `agents/briefs/8.md`. No finding changes the part the step builds or makes a choice the user would see.

- F1: "The record of the reports" now says each marker's final message is saved with `extract_handback.py` when its completion notice arrives, before any resume, since that helper stops on a transcript with more than one hand-back (`assert len(msgs) == 1`, line 13). A reply to a resume is saved with `extract_last_handback.py`, which takes the last hand-back. Both helpers add a final newline when the message has none (line 20 of each), and the brief says a saved file is verbatim apart from character names and that newline.
- F2: "The session's own response never holds a report's text" is replaced by: no `Agent` prompt, resume message or command of the session holds a report's text, and the only text of the session that holds a report is the text that ends each run's turn. Decision 5 says the same.
- F3: the marks bullet, C11 and gate condition 6 except a grant marker's script command on the copy and a `grep` on its output through a pipe.
- F4: the marker bullet, C3 and gate condition 2 read each group line against `SKILL.md`, "How you group them", whole, the loss shown by one of the group's findings and held in the draft, or for a group whose breaks change no claim, the line that says so and names the cost.
- F5: marker condition 4 adds that every technical term a replacement brings in meets `references/rules.md`, "Terms defined at first use".
- F6: marker condition 4 adds that the replacement leaves no break of a rule of the four pages in the passage, a further rule the passage breaks named by the finding in a line of its own. C12 reads the same.
- F7: the marker bullet takes the review agent's rule for a read that prints no model line: a second read at the next tool call with no `sleep`, and the model read before anything the marker wrote is used.
- F8: gate condition 8 of `8-report.md` states each run's row count beside step 6's (191 and 74), as a fact that gates nothing; the old condition 8 is now condition 9, and the Report section names conditions 1 to 9.
- Dictated text: no dictated line was rewritten or added. The sentences about the two helpers say how a script behaves, and were read against each helper's code (`grep -n 'assert\|endswith\|msgs\[' extract_handback.py` printed lines 13 and 20; `extract_last_handback.py` keeps `msgs[-1:]` and the same newline line).
