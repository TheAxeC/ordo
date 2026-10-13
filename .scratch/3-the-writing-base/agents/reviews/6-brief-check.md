# Step 6 brief check (on main at 5ebb49a)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/6.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

`git rev-parse --short HEAD` printed `5ebb49a`. `git status --short` printed ` M .scratch/3-the-writing-base/orchestrator-state.md` and `?? .scratch/3-the-writing-base/agents/briefs/6.md`.

## 1. Names

The step renames and changes no existing name. It creates the record names `6-run/`, `6-marks.md` and `6-report.md`, and adds numbered items under the existing line "Agents in no role the cost script prices:" in `plan.md` at landing.

- `6-run/`, `6-marks.md`, `6-report.md`: `git grep -n -e '6-marks' -e '6-run/' -e '6-report' -- . ':!.scratch/archive'` printed three hits outside the brief's paths:
  - `.scratch/3-the-writing-base/plan.md:26` (step 6's line, "each finding's two marks recorded in `agents/reviews/6-marks.md`"). The step makes this line true. It does not make it false.
  - `.scratch/retros/sessions-2026-10-12.md:280` and `:287`: places in another plan's transcripts (`2-c-scripts-compute-facts...`). They are unrelated to this step and are not made false.
- `ls .scratch/3-the-writing-base/agents/reviews/6-run .scratch/3-the-writing-base/agents/reviews/6-marks.md` printed "No such file or directory" for both. This matches the brief's first run of the cases.
- "Agents in no role the cost script prices:": `sed -n 74,117p .scratch/3-the-writing-base/plan.md` shows the line and items 1 to 15. The step adds items and changes none.

Findings: none.

## 2. The step line

Step 6's line (`plan.md:26`) is "The third runs: step 4's runs and the two fresh markers' marks repeated on the same copies, `/writing` invoked as pinned at `v7.1.0-rc.3`; check: every finding of the repeated real runs marked right by both, each condition of the gate on the repeated runs read from their reports and transcripts, and each finding's two marks recorded in `agents/reviews/6-marks.md` (1 commit; orchestrator, no agent) (ruling H)".

- "step 4's runs ... repeated on the same copies": "What to build" covers this with "The copies are step 4's, under `<scratchpad>/3-2-run/`", the `diff -r` and `cmp` before and after, and runs 1 and 2.
- "the two fresh markers' marks repeated": covered by "The marks", two fresh `ordo-high` agents per run.
- "`/writing` invoked as pinned at `v7.1.0-rc.3`": covered by "Before the first run, `git -C ~/.local/share/ordo-stable describe --tags` prints `v7.1.0-rc.3`" and by each `Skill` result's base directory.
- "check: every finding ... marked right by both": covered by "The step's check holds only when every row of both repeated runs is marked right by both markers". A row is wider than a finding (rows also cover further places, splits and list entries).
- "each condition of the gate on the repeated runs read from their reports and transcripts": covered by conditions 1 to 8 of `6-report.md`.
- "each finding's two marks recorded in `agents/reviews/6-marks.md`": covered by the record bullet for `6-marks.md`.
- "(1 commit; orchestrator, no agent)": "How the rules file applies to this step" covers executor `inline`. The one commit is the landing's, which `/land` makes. It is not a requirement of the step's own work.
- Step 6's Step 0, which the line carries in:
  - The three points are the file-reading tool only (marks bullet 2), the served model read with no sleep (run bullet 1 and marks bullet 4), and the classifier-stop cause (marks bullet 1).
  - Each point is in "What to build". `sed -n 148,152p` of `plan.md` was read for this check.

Findings: none.

## 3. Premises

- Step 5 landed in ce30787, ticked, tagged and pinned, and 5ebb49a changes only the ledger:
  - `git log --oneline -6` printed `5ebb49a Pin v7.1.0-rc.3 after step 5 of plan 3` and `ce30787 Land step 5 of plan 3, ...`.
  - `plan.md:25` begins "- <white heavy check mark> 5 The second fixes".
  - `git tag --points-at ce30787` printed `v7.1.0-rc.3`.
  - `git diff --stat ce30787 5ebb49a` printed `orchestrator-state.md | 3 ++-` and `plan.md | 1 -`.
  - `git -C ~/.local/share/ordo-stable rev-parse --short HEAD` printed `ce30787`.
  - `readlink ~/.claude-backup/skills/writing` printed `/Users/axelfaes/.local/share/ordo-stable/skills/writing`.
  - `diff ~/.local/share/ordo-stable/skills/writing/SKILL.md skills/writing/SKILL.md` exited 0, and `diff -r` of the two `skills/writing` folders exited 0.
  - The pin output "pinned: v7.1.0-rc.3 (ce30787), 14 skills linked" is quoted in the state file's Current position. It was not rerun because `pin.sh <tag>` writes.
  - All of this matches the brief.
- Pinned `SKILL.md`, version 1.0.0, with step 5's fixes:
  - `cat -n` of the pinned file shows `version: "1.0.0"` at line 5.
  - The fixes stand at the pinned file's lines 122 and 125 to 126 (passages and replacements written out whole), 142 to 147 (vague qualifiers), 133, 137 and 141 (scope, limit and name rules), 152 to 161 (split and list forms), 117 (full paths in a list of places) and 99 to 102 (one command on the draft).
  - `grep -n 'reviewer\|standards' .agents/plan.yaml` printed lines 1, 10 (`reviewer: claude:opus`), 11 (`repair_reviewer`) and 13 (`standards: [... prose-standard.md ...]`), with no `reviewer_effort` line.
  - This matches the brief.
- Effort agents:
  - `ls ~/.claude-backup/agents/` printed `ordo-high.md ordo-low.md ordo-max.md ordo-medium.md ordo-xhigh.md`, and the runner lists `ordo-low` to `ordo-max` among its agent types.
  - `printenv CLAUDE_CODE_EFFORT_LEVEL; echo $?` printed `1`.
  - This matches the brief.
- The copies equal their sources:
  - `diff -r <scratchpad>/3-2-run/manuscript .../hccnet-revision/manuscript` printed nothing, exit 0.
  - `cmp` of the grant copy against the source printed nothing, exit 0.
  - `git -C /Users/axelfaes/workspace/research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs` printed nothing, exit 0.
  - This matches the brief.
- 33 manuscript files, no line over 2000 characters:
  - `find <copy> -name '*.tex' -exec awk 'length($0)>2000' {} \;` printed nothing.
  - Following `writing`'s Steps 3 rule over the copy (a `python3 -I -c` read that writes nothing) gave `33`, `missing []`.
  - The count matches the brief. Its wording "the 32 files its `\input` commands name" does not quite match: `grep -n -e '\\input{' -e '\\include{' main.tex | wc -l` printed `21`, and the other 11 files are named by `\input` commands of included files, for example `sections/4_experiments/d_results.tex:1:\input{tables/results_finetune}`. See F13.
- The grant:
  - `python3 -I skills/writing/templates/docx_paragraphs.py <copy> | wc -lw` printed `73 2751`.
  - The lines that are not numbered are the four part lines `[word/footnotes.xml]`, `[word/endnotes.xml]`, `[word/header1.xml]` and `[word/footer1.xml]`. Numbers 1 to 69 appear once each (`uniq -d` printed nothing).
  - This matches the brief.
- research-hub is read only: this is a constraint, with nothing on the tree to rerun.
- Step 4's record:
  - `ls agents/reviews/4-run` printed the six files.
  - `grep -n "^#" 4-report.md` shows "## Place checks" at line 52.
  - `4-marks.md` lines 1 to 30 show one row per finding, further place, split and tense clause.
  - This matches the brief.
- Step 6's Step 0 has three points: `sed -n 148,152p plan.md` shows the three bullets as the brief says.
- Open item G: `plan.md:70` ends "(self-rule).", and `.scratch/choices.md` C70 shows "Taken: (a)". `plan.md:152` gives the grant prompts of 44152 characters. This matches the brief.
- Transcript paths and the tool-use method:
  - `ls .../subagents | grep ae6cdd9db984557c9` printed the `.jsonl` and `.meta.json` files.
  - The meta file holds `"agentType":"ordo-high"`.
  - `grep -o '"model":"[^"]*"'` gave `45 "model":"claude-opus-5-5"`.
  - A `python3 -I` count over the assistant entries' `tool_use` blocks printed `Read 36, Bash 2, SubagentHandback 1` and `keys ['message'] 76936`.
  - The session transcript `3998c800-....jsonl` exists, 39274 lines.
  - This matches the brief.
- ADRs: the quoted sentences of 0001, 0002, 0003 and 0006 equal their Decision sections, and each record has `Status: proposed` (`cat docs/adr/0*.md`). This matches the brief.
- Verify list:
  - `git diff --quiet 1c26ac1 HEAD -- docs/dev/building.md; echo $?` printed `0`.
  - The six commands of `docs/dev/building.md` (lines 6 to 11) equal the state file's `verify:` list with its filters.
  - This matches the brief.

Findings: F13 below. It concerns wording only, and the count holds.

## 4. Cases and checks

- C1:
  - It is consistent with `SKILL.md`, "A finding" (pinned lines 112 to 118).
  - It carries the gate's "an `\input` file of the `.tex` included".
- C2: consistent with "A finding", which gives the paragraph forms.
- C3:
  - It is consistent with "How you group them".
  - Whether a group line names a loss is a judgment. The brief gives that judgment both to the session (condition 2) and to the markers (marks bullet 6), but it does not say how a marker's naming enters the condition. See F3.
- C4: inconsistent with `SKILL.md`, "A finding", in two ways (F5):
  - It applies the passage rule ("never a description of the draft's text") to the replacement.
  - It leaves out the replacement rule "It is never an instruction such as ...", which condition 5 and marks bullet 6 both name.
- C5: consistent with "The review agent's prompt", "What you run".
- C6: consistent with "What you read". That section lets a long file take several reads, and C6's "each file whole" still holds under it.
- C7: consistent with `writing` Steps 3, 5 and 7 and with the change standard's "Where the work happens" ("no ... sleeping or polling").
- C8: inconsistent with "What to build" for the grant (F4). C8 asks every marker to read "the whole draft with the file-reading tool". For the grant, the brief's marks bullet 2 and condition 6 make the draft the output of `docx_paragraphs.py`, which a marker gets by running the script, not by reading a file.
- C9: consistent.
- C10: consistent with marks bullet 1. A resume message under marks bullet 5 names "the findings it left out", and a finding's name in this brief includes "the first words of its quoted passage" (marks bullet 6). That puts report text into a message to a marker, which C10's "no marker prompt holds any part of a report" and Step 0's third point are written to avoid. See F7.
- No case asks the builder to check, quote or explain a place the step does not change.
- Conventions, last bullet: "The record's running prose keeps to the change standard's limits on semicolons and sentence length." `grep -n -i "semicolon\|sentence length\|words" docs/dev/change-standard.md` printed nothing. The limits are in the prose standard, section B ("Semicolons: at most 2 per 1000 words") and section E ("Sentence length"). See F1.

Findings: F1, F3, F4, F5, F7.

## 5. The question

"The goal" is the part of the plan's goal that step 6 delivers: `/writing`, as pinned at `v7.1.0-rc.3`, run by one fresh agent that changes nothing on the real manuscript (with its `\input` files) and the real grant, reports right findings, grouped by rule, each with its place, quoted passage and replacement.

- C1: no, it could not pass without the goal. It requires `file:line` with full paths, at least one finding in an included file, and the passage at the line.
- C2: no. The passage must stand in the numbered paragraph.
- C3: yes, in part. The session reads each group line itself, and a line that both markers or one marker name as naming no loss does not fail C3 or condition 2 by any rule of the brief (F3).
- C4: yes, in part. A replacement given as an instruction passes C4 as worded (F5).
- C5: no.
- C6: no as worded ("each file whole"). Its check, condition 3, does not carry "whole" (F6).
- C7: no.
- C8: no for the manuscript. For the grant, the case cannot be met as worded (F4).
- C9: no.
- C10: no. It concerns process and does not test the goal. The resume message is F7.
- The step's check ("every row ... marked right by both markers and conditions 1 to 7 hold"): yes, in three ways.
  - Condition 1 leaves out the gate's "an `\input` file of the `.tex` included", and the check counts conditions 1 to 7, not C1. A manuscript report with every finding in `main.tex` would pass the step's check while the gate condition fails (F2).
  - A group line a marker names as naming no loss does not fail condition 2 (F3).
  - Conditions 3 and 6 count `Read` calls "against the 33 files" without saying each read covers the whole file, so a `Read` with a `limit` passes (F6).
- Items of "What to build":
  - The copies, with their `diff -r` and `cmp` before and after: no.
  - The runs: no, read through conditions 3 and 4. A wrong served model in the manuscript run is not covered by the brief (F10). The read of a served model "with no sleep" has no rule for an empty read (F11).
  - The record of the reports: no. The comparison with the `SubagentHandback` input is quoted. How the report reaches the file is unstated (F8).
  - The marks: no, apart from F3, F7 and F12 (paths not absolute).
  - The record files: no.
  - The booking at landing: no.
- Condition 8 states that no check counts breaks a report missed. A run that reports few findings, all of them right, passes. That gap is the gate's, which the user holds, and the brief names it in the words condition 8 dictates. This is not a finding of the brief.

Findings: F2, F3, F4, F5, F6, F10, F11.

## 6. Implied inputs

- Not a code step. The step runs `/writing` and agents and writes ledger records. It changes no script, test or product code.

Findings: none.

## 7. ADRs

`ls docs/adr` printed 0001 to 0012. Each was read with `cat docs/adr/0*.md`, and all have `Status: proposed`.

- 0001 (prose standard read where it is):
  - It touches the step. The runs read the prose standard from `standards`.
  - The step is under its sentence "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, ...".
  - The brief names it.
- 0002 (prose standard holds): touches the step. The step is under "The prose standard holds for every text the writing skills write or review." The brief names it, in marks condition 2.
- 0003 (fresh read-only agent):
  - It touches the step. The step is under "`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule." and "The session shows its report to the user and changes nothing."
  - The brief names it. The brief's saving of the reports after both runs have ended does not contradict it.
- 0004 (a self-rule decision ends "(self-rule)"):
  - It governs how a ruling's authority is booked and read. Step 6's authority is ruling H, which ends "(the user)." (`plan.md:71`).
  - Decision 5 cites Open item G, which ends "(self-rule).", as precedent and not as authority. The step books no ruling.
  - It does not touch the step.
- 0005 (choices file): governs where self-rule choices go. The step takes none in its brief, so it does not touch the step.
- 0006 (every agent recorded):
  - It touches the step. The step is under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model".
  - The brief names it, and "What to build" books every agent and every stopped start.
- 0007, 0008, 0009 (repair reviewer model; the cost script's price table and response counts): do not touch the step. It starts no refute run and changes no cost script.
- 0010 (verify list kept equal):
  - Its decision binds `/spec` and `/land`, and the step's own work does not change the verify list.
  - The brief records the compare under "What is on the tree".
  - It does not touch the step.
- 0011 (dispatch block per plan): does not touch the step.
- 0012 (commits name their paths): binds the landing's commit, not the step's work. It does not touch the step.

Findings: none. No part of the brief contradicts an ADR, and every ADR the step touches is named.

## 8. Dictated text

- "Everything in the brief is done" (Report, first bullet).
  - Found by `grep -n "Everything in the brief is done" .scratch/3-the-writing-base/agents/briefs/6.md`, which printed line 171.
  - Holds. It matches the change standard rule 7 ("First line: anything NOT DONE, or that everything in the brief is done").
- "they judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none" (condition 8, "the report says so in those words").
  - Found by `grep -n "in those words"`, which printed line 89.
  - Holds. The line is ASCII, 20 words, with no semicolon and no dash. It meets prose standard sections B and E.
- The heading "Agents in no role the cost script prices:" and the roles "review agent of the manuscript run of step 6", "review agent of the grant run of step 6" and "marker 1 of the manuscript run of step 6".
  - Found by `grep -n "Agents in no role"`, which printed line 91.
  - Holds. The roles follow the form of `plan.md` items 1 to 15.
- The code line `sed -n '<line>p' <file> | grep -cF -- '<a part of the quoted passage>'` and the code line `python3 -I <docx_paragraphs.py> <copy> | grep -E '^<n>: ' | grep -cF -- '<a part of the quoted passage>'` (condition 1).
  - Found by `grep -n "Place checks"`, which printed line 82.
  - Each holds against the rules file and the standards when read whole. `^<n>: ` matches the script's output form (`python3 -I ... | sed -n '60,73p'` shows `64: Application Form ...`).
  - Two practical defects remain (F9). A part holding `'` breaks the single quotes. A part copied from the saved report holds a character written by its name, such as `<en dash>` (`grep -o '<[a-z][a-z -]*>' 4-run/*.md` printed `<en dash>` in `grant-report.md` twice), which the draft does not hold, so `grep -cF` prints `0` for a passage that stands at its place.
- The character-set command of "Verify before you report" 1.
  - Found by `grep -n "printf '%s.0'"`, which finds line 161.
  - Holds. Its `perl` body equals the verify list's last command.
- `LC_ALL=C grep -n '[^ -~]' .scratch/3-the-writing-base/agents/briefs/6.md` exited 1, so the brief is ASCII.
- `grep -n -E '[^[:space:]] - | -- '` over the brief hits only `--` options inside code spans (lines 14, 27 and 163). None is a dash aside.

Findings: F9 (not a break of a rule; a dictated code line that prints a wrong `0`).

## Findings

- F1 (Cases and checks): Conventions, last bullet, names "the change standard's limits on semicolons and sentence length". The change standard has none: `grep -n -i "semicolon\|sentence length\|words" docs/dev/change-standard.md` printed nothing. Change to: "The record's running prose keeps to the prose standard's limits, section B on semicolons and section E on sentence length."
- F2 (The question): condition 1 of "What to build" leaves out the gate's "an `\input` file of the `.tex` included". The step's check counts conditions 1 to 7, so a manuscript report with no finding in an included file passes the check. Add to condition 1: "At least one finding of the manuscript report stands in a file the main file includes; with none, condition 1 fails."
- F3 (The question, Cases C3): marks bullet 6 has each marker name group lines that name no loss, and findings with no passage, no replacement, or a replacement given as an instruction or reference. Conditions 2 and 5 are then "read in the report" by the session, and no sentence says what a marker's naming does to them. Step 4's refuter marked C3 unmet on exactly these namings (`4-refuter.md`, Verdicts, C3). Add to conditions 2 and 5: "Each group line or finding that either marker names under marks bullet 6 is listed under the condition as a failure, with the marker's reason, as a row not marked right by both is."
- F4 (Cases and checks): C8's "each having read the report, the four pages and the whole draft with the file-reading tool" cannot hold for a grant marker, whose draft is the script's output (marks bullet 2, condition 6). Change C8's end to: "... the four pages with the file-reading tool, and the whole draft: all 33 manuscript files each read whole with the file-reading tool, or for the grant the whole output of the script's command."
- F5 (Cases and checks): C4 says "no replacement is a reference to another finding or a description of the draft's text". `SKILL.md`, "A finding", applies "a description of the draft's text" to the passage, and gives the replacement the rules "never an instruction" and "never a reference to another finding or to the passage". Change C4 to: "every finding has a quoted passage that is never a description of the draft's text or a reference to another finding, and a replacement written out whole as text, or "delete", that is never an instruction and never a reference to another finding or to the passage."
- F6 (The question): conditions 3 and 6 check the `Read` calls "against the 33 files" and "covering ... all 33 files" without saying each file is read whole. A `Read` with `offset` or `limit` passes, while C6 asks for "each file whole". Add to both conditions: "each file's `Read` calls carry no `offset` or `limit`, or together cover every line `wc -l` gives for the file."
- F7 (Cases C10, marks bullet 5): a marker "resumed once ... with the findings it left out named" gets report text in a message, because a finding is named "by its group, its place and the first words of its quoted passage" (marks bullet 6). Marks bullet 1 and C10 keep report text out of what a marker is sent, which is the cause Step 0 records. Change marks bullet 5 to: "... with the findings it left out named by number, and for a further place, split or list entry by its letter or place, with no quoted words; the message names the saved report's path again". Extend C10 to resume messages.
- F8 (The question, the record of the reports): the brief does not say how each report goes from the `SubagentHandback` `message` input into `6-run/`, or how each marker's final message goes into its marks file.
  - With the `Write` tool, the session's own response holds the whole manuscript report (76936 characters). Step 0 records that a classifier stopped a response of that kind.
  - Step 4 did this with scratch scripts (`extract_handback.py`, `cmp_prompt.py` and `*.body` files, `4-report.md:971`). Brief 6 now forbids them through "Outside it, the step writes nothing".
  - Name the route. Suggested: one `python3 -I -c` command that reads the transcript's `SubagentHandback` input and writes the file under `6-run/` directly, with each character outside the set written by its name in lower case in angle brackets, quoted in the report; and one such command for the comparison.
  - The orchestrator judges whether this one-off command falls under the change standard's "A new script needs the user's approval of what it computes".
- F9 (Dictated text): the place-check code lines take "a part of the quoted passage". Add: "The part is taken from the review agent's final message, holds no `'` and no character outside ASCII, or a `'` in it is written `'\''`." This keeps a passage that stands at its place from printing `0`.
- F10 (The question, the runs): only the grant run's wrong served model is covered. Add: "When the manuscript run's Steps 6 finds a served model other than the configured one, the session stops that agent, the turn ends with the stop's message, the grant run is not invoked, and the step is NOT DONE with the stop going to the user."
- F11 (The question, the runs and the marks): "reads its served model from its transcript with no `sleep` before the read" gives no rule for a read that prints no model line. That case is why step 4 used `sleep 10`.
  - The evidence: `agent-ae6cdd9db984557c9.jsonl`'s first entry is at 12:14:20.911Z and its first assistant entry, which holds the model, at 12:14:22.451Z.
  - Add: "A read that prints no model line is made once more at the session's next tool call, with no `sleep`. With still no model line, the served model is read before anything the agent wrote is shown or used, and a model other than the configured one is then the stop."
- F12 (The marks): marks bullet 1 says "by its absolute path, `agents/reviews/6-run/manuscript-report.md` or `agents/reviews/6-run/grant-report.md` in the main checkout", which are not absolute paths. Marks bullet 2 names `skills/writing/SKILL.md`, `references/rules.md` and `references/registers.md` "as pinned" and "the prose standard" with no paths.
  - Give the paths: `/Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/6-run/manuscript-report.md` (and `grant-report.md`), and `/Users/axelfaes/.local/share/ordo-stable/skills/writing/SKILL.md`, `.../references/rules.md` and `.../references/registers.md`.
  - For the prose standard, give `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`, the page the runs read through `standards`. It equals the pinned copy: `diff` of the two exited 0.
- F13 (Premises): "the 32 files its `\input` commands name". `main.tex`'s `\input` commands name 21 of them (`grep -n -e '\\input{' -e '\\include{' main.tex | wc -l` printed `21`), and the other 11 are named by `\input` commands of included files. Change to: "`main.tex` and the 32 files named by the `\input` commands of `main.tex` and of the files it inputs, 33 files".
- F14 (What to build, the copies): "A copy that differs from its source is made again with `cp -R` or `cp`". `cp -R <source> <scratchpad>/3-2-run/manuscript` onto the existing folder copies into `manuscript/manuscript`, and the second `diff -r` then fails. Change to: "is removed and made again with `cp -R` (the folder) or `cp` (the file)".

## Declined to judge

- Whether Decision 5, which gives all four markers the report by path, needs a choice booked under self-rule. Open item G (C70) is a self-rule ruling for step 4's manuscript markers only, and the user has not yet reviewed it (`.scratch/choices.md`, C70, "Taken: (a)"). This is the orchestrator's call.
- Whether the one-off `python3 -I -c` commands the record needs (the save, the comparison, the `tool_use` counts) are "new scripts" under the change standard's "Scripts compute facts; judgment is read". This is the orchestrator's or the user's call (F8).
- The output of `sh utils/pin.sh v7.1.0-rc.3`, which was not rerun because it writes. Its effects were checked by `rev-parse`, `describe` and `readlink`.
- The drafts' text, which I did not read, as the task allowed. Only the brief's claims about them were checked.
- `docs/dev/skill-layout.md`: the step changes no skill file, so it does not apply. `docs/glossary.md`: the brief uses "finding", "brief check", "step" and "goal" in the senses defined there. "Marker" is not a glossary term and is the plan's own word (`plan.md:25` and `:26`).

Agent usage: a3e0cceb00ecca6b5, claude-opus-5-5, 197104 tokens, 48 tool uses, 7.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- F1: Conventions, last bullet, names the prose standard's section B on semicolons and section E on sentence length.
- F2: condition 1 of "What to build" adds that at least one finding of the manuscript report stands in a file the main file includes, and fails with none.
- F3: conditions 2 and 5 list each group line or finding a marker names under its last bullet as a failure, with the marker's reason.
- F4: C8 says the grant marker reads the whole output of the script's command, and the manuscript marker reads all 33 files each whole with the file-reading tool.
- F5: C4 applies "never a description of the draft's text or a reference to another finding" to the passage, and "never an instruction and never a reference to another finding or to the passage" to the replacement.
- F6: conditions 3 and 6 require each file's `Read` calls to carry no `offset` or `limit` or together cover every line `wc -l` gives.
- F7: the resume of a marker names the findings it left out by number, letter or place, with no quoted words, and names the saved report's path again; C10 covers resume messages.
- F8: "The record of the reports" names the route, `python3 -I <scratchpad>/extract_handback.py <agent transcript> <file>`, the helper step 4 and every refuter record of this plan used, so the session's response never holds a report's text; the comparison is a second run of the helper into the scratchpad and `cmp`; the marks files are saved the same way. "Paths this step writes" names the helper's second output. The helper is not new: it copies one field of a transcript, a fact with one answer.
- F9: condition 1 says the part is taken from the review agent's final message, holds no `'` and no character outside ASCII, or writes a `'` as `'\''`.
- F10: "What to build" adds the stop for a wrong served model in the manuscript run: the agent stopped, the turn ended with the stop's message, the grant run not invoked, the step NOT DONE.
- F11: a read that prints no model line is made once more at the session's next tool call with no `sleep`, and the model is read before anything the agent wrote is shown or used.
- F12: the marks bullets give the absolute paths of the saved reports, the prose standard and the pinned `SKILL.md`, `rules.md` and `registers.md`.
- F13: "What is on the tree" says the 32 files are named by the `\input` commands of `main.tex` and of the files it inputs, with the count 21 from `main.tex`.
- F14: a copy that differs is removed and made again with `cp -R` or `cp`.
- Dictated lines added after the check: the sentence of condition 1 "At least one finding of the manuscript report stands in a file the main file includes; with none, condition 1 fails." and the sentence of condition 8 are unchanged in form; each added sentence is ASCII, has at most one semicolon and no dash, and the brief's character check (`LC_ALL=C grep -n '[^ -~]'`) exits 1.

