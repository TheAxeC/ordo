# Step 2 brief check (on main at 70b513c)

This is the report of the fresh agent that the `spec` skill's "Steps / The brief check" starts, on `agents/briefs/2.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section and never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

Main's head: `git rev-parse HEAD` printed `70b513c5a83858fe073a72a83efd38ad279a9ad3`. `git status --short` printed the session's own uncommitted records: ` M .scratch/3-the-writing-base/orchestrator-state.md`, ` M .scratch/3-the-writing-base/plan.md`, `?? .scratch/3-the-writing-base/agents/briefs/2.md`.

## 1. Names

The step changes no existing name in the repository: no heading, key, function or term. It adds new ledger files only.

- `2-run/`, `2-marks.md`, `2-report.md`, `3-2-run`: `grep -rn --exclude-dir=.git --exclude-dir=archive -e '2-marks' -e '2-run' -e '2-report' -e '3-2-run' .`. The hits outside the brief:
  - `.scratch/3-the-writing-base/plan.md:21: - 2 The runs: ... recorded in agents/reviews/2-marks.md (1 commit; orchestrator, no agent) ...`. The change makes it true, not false.
  - `.scratch/3-the-writing-base/agents/reviews/1-landing.md:58: Step 2: ... the marks in agents/reviews/2-marks.md.` The change makes it true, not false.
- No skill globs `agents/reviews/` in a way that a `2-run/` folder or extra `.md` files would break: `grep -rn 'agents/reviews/\*\|reviews/\*\|reviews/<' skills utils docs`. Every hit names one fixed file per step (`<step>-refuter.md`, `<step>-report.md`, `<step>-landing.md`, `<step>-diagnosis.md`, `<step>-brief-check.md`, `<step>-backed-out.patch`).
- Terms the record uses:
  - "mark" and "marker": `grep -n -o '\*\*mark[^*]*\*\*\|\*\*marker[^*]*\*\*' docs/glossary.md skills/repo-setup/templates/plan-terms.md` printed only `docs/glossary.md:149:**mark, of a figure**`. That entry is qualified "of a figure", and the plan's gate and step line already use "mark" in the user's words, so the record makes no entry false.
  - "finding" is used in the `/writing` sense that `docs/glossary.md` **finding** gives ("Also a passage of a draft that `/writing` reports ...").
- `plan.md`'s Agents section is written at landing, outside "Paths this step writes". Its form is a finding under 7 (F15).

Findings: none.

## 2. The step line

The plan's step 2 line is `grep -n '^- 2 ' .scratch/3-the-writing-base/plan.md`, line 21.

- "`/writing` on copies, under the session's scratch folder, of `research-hub/projects/manuscripts/hccnet-revision/manuscript/`": served by "What to build", the copies (`manuscript/` with `cp -R` under `<scratchpad>/3-2-run/`) and run 1.
- "and of one grant `.docx` of the user's under `research-hub/funding/`": served by the grant copy, run 2 and Decision 1. Decision 1's stated reason is false (F2, under 3).
- "two fresh reviewer agents each mark each finding of the two real reports right or wrong": served by "The marks" and Decision 4.
- "check: each condition of the gate on the runs read from the reports and the transcripts": served by the record's `2-report.md` items 1 to 6.
- "and each finding's two marks recorded in `agents/reviews/2-marks.md`": served by the record's `2-marks.md` bullet and C8.
- "(1 commit; orchestrator, no agent)": served by "How the rules file applies to this step" (executor `inline`, the record in the main checkout's ledger, carried by the landing). "What to build" names no commit, and none is needed there, since `land` makes it.
- "(approved) (ruling Plan 2.1 ruling C) (ruling D)": ruling D is in "What is on the tree", first bullet. Plan 2.1 ruling C (real runs only) is served by runs 1 and 2 on the real drafts, with no planted text.

Findings:

- F3. The line's "`/writing` on copies" depends on how the session runs `/writing` as installed, and the brief's account of that run does not match the skill.
  - `skills/writing/SKILL.md` Steps 7 says: "show its report to the user whole, as the message that ends the turn", and "The session writes no file and adds no finding of its own." Its "Stops" section says "`/writing` keeps no ledger, so every row shows its message as the message that ends the turn".
  - The brief's "What to build" says instead: "Each run follows `writing` as installed: ... starts the one review agent, reads its served model, and takes its final message whole."
  - "What it must do" then orders "the manuscript run; the grant run; the four markers, started together once both reports are saved; the record" as one sequence.
  - Run as installed, each `/writing` invocation ends the orchestrator's turn with the report. Under `self_rule: on` the loop then halts after the manuscript run until the user's next message. `plan-orchestration` is written so that "the loop never ends its turn for a report" (`skills/plan-orchestration/SKILL.md:196`).
  - The brief does not say what the session does at each of the two turn ends, or what resumes the step.
  - It also does not say that saving the report into `2-run/` happens after the skill's run has ended, which is what keeps it clear of Steps 7's "The session writes no file".
  - Either the brief states the two turn ends and what resumes the step after each, or the conflict between the skill's turn end and the unattended loop is raised as an open item. Running the skill other than as installed is not an option under the user's rule that a skill's work is done by invoking the skill.

## 3. Premises

- Step 1 landed in b9f9831 and is ticked: `git log --oneline -1 b9f9831` printed `b9f9831 Land step 1 of plan 3, the writing base and /writing`. `grep -n '<white heavy check mark> 1' plan.md` shows line 20 ticked; the tick glyph is written here by its name, `<white heavy check mark>`. Matches.
- Tag and pin:
  - `git rev-parse 'v7.1.0-rc.1^{commit}'` printed `70b513c5a83858fe073a72a83efd38ad279a9ad3`.
  - `git -C ~/.local/share/ordo-stable rev-parse HEAD` printed `70b513c5a83858fe073a72a83efd38ad279a9ad3`, and `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.1`.
  - `ls ~/.claude-backup/skills/writing/` printed `references`, `SKILL.md`, `templates`. The entry is a link to `/Users/axelfaes/.local/share/ordo-stable/skills/writing` (`ls -la ~/.claude-backup/skills/`).
  - `diff -r skills/writing ~/.local/share/ordo-stable/skills/writing` printed nothing.
  - This agent cannot run the runner's skill listing as a command. Its own system listing of invocable skills includes `writing`.
  - Matches.
- `skills/writing/SKILL.md` and Ordo's configuration:
  - `grep -n 'version' skills/writing/SKILL.md` printed `5:  version: "1.0.0"`.
  - `grep -n 'reviewer\|standards' .agents/plan.yaml` printed line 1 (a comment), `10:reviewer: claude:opus ...`, `11:repair_reviewer: claude:sonnet ...` and `13:standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] ...`.
  - `grep -n '^ *reviewer_effort:' .agents/plan.yaml` printed nothing and exited 1, so there is no key and the agent is `ordo-high`.
  - The description of Steps 1 to 7 matches the file.
  - Matches.
- Effort agents: `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "exit $?"` printed `exit 1`. `ls ~/.claude-backup/agents/` printed `ordo-high.md ordo-low.md ordo-max.md ordo-medium.md ordo-xhigh.md`, and this agent's runner lists `ordo-low` to `ordo-max` among its agent types. Matches.
- The manuscript:
  - `du -sh .` printed `5.1M`, `grep -c input main.tex` printed `21`, and `grep -rn -e '\\input{' -e '\\include{' sections` printed 11 lines in six files (`2_reliability.tex`, `1_baseline.tex`, `1_conv_layer.tex`, `3_hyperparams.tex`, `b_architecture.tex`, `d_results.tex`).
  - The existence loop (run under `bash`) printed `32 names, 32 ok`.
  - The 11 files under `tables/` and `figures/` hold no further `\input` or `\include` (a loop of `grep -Hn` over them printed nothing).
  - `sort | uniq -d` over the names printed `0`. So the draft is 33 files.
  - Matches.
- The grant: `python3 -I skills/writing/templates/docx_paragraphs.py <file> | wc -lw` printed `73 2751`. Matches. "With one paragraph each from `word/footnotes.xml`, `word/endnotes.xml`, `word/header1.xml` and `word/footer1.xml`" does not match (F1).
- research-hub read only: a rule, with no command to rerun.
- Transcript path:
  - `ls` of `~/.claude-backup/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/subagents` lists 376 entries of the form `agent-<id>.jsonl` and `agent-<id>.meta.json`.
  - On `agent-a15e1830c0fcc52fe.jsonl`, `grep -o '"model":"[^"]*"' | sort | uniq -c` printed `85 "model":"claude-sonnet-5-5"`.
  - The `tool_use` names printed `49 name:"Bash"`, `1 name:"Read"`, `1 name:"SubagentHandback"`.
  - Matches.
- ADRs 0001 to 0003 `Status: proposed`, with the quoted sentences: `cat -n docs/adr/000[123]-*.md`. Each quoted sentence stands in its Decision section. Matches.
- Verify list: read against `docs/dev/building.md`'s code block and the change standard's "Commands and their filters". The six commands of the state file's `verify:` are the page's six with the filters `2>&1 | tail -1` on the four test scripts. Matches.

Findings:

- F1. Brief, "What is on the tree", the grant bullet: "with one paragraph each from `word/footnotes.xml`, `word/endnotes.xml`, `word/header1.xml` and `word/footer1.xml`". Now:
  - `python3 -I skills/writing/templates/docx_paragraphs.py <grant> | grep -n '\[word/'` printed `64:[word/footnotes.xml]`, `65:[word/endnotes.xml]`, `66:[word/header1.xml]`, `69:[word/footer1.xml]`.
  - The footnotes and endnotes parts print no paragraph. `unzip -p <grant> word/footnotes.xml | grep -o '<w:footnote [^>]*>'` printed only `w:type="separator"` and `w:type="continuationSeparator"`, and the same holds for the endnotes.
  - The header part holds paragraphs 64 and 65, and the footer part holds 66 to 69. Paragraph 64 reads `Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026`, and paragraph 66 reads `3 / 4`.
  - The 73 lines are 69 numbered paragraphs plus 4 part lines (`grep -c '^[0-9]*: '` printed `59`, which counts the non-empty paragraph lines only).
- F2. Decision 1 says the grant is "the only candidate whose script output holds a paragraph from each of the footnotes, endnotes, header and footer parts", and that Veni has "302 paragraphs, no header part". No candidate holds paragraphs from all four parts.
  - The ENW-XS form holds header and footer paragraphs only (F1).
  - Veni (`veni2026-preproposal-FILLED.docx`): `wc -lw` printed `302 3277`, which is 302 lines and 299 numbered paragraphs. It holds one footnote paragraph, `298:  To avoid gender effects, please do not state your first name.`, which is the funder's form text, then an empty endnotes part and footer paragraph `299: 15`. It has no header part.
  - `final_version.docx`: `194 5696`, 194 numbered paragraphs, body only. This part of the claim holds.
  - The choice of ENW-XS may stand on its other reasons: the version submitted, the user's own prose, and a header and a footer. The stated reason is false, and C2's paragraphs outside the body can come only from the header and the footer.

## 4. Cases and checks

Each case against the rules file and the standards:

- C1, the manuscript places: consistent with "The review agent's prompt", "A finding", in `skills/writing/SKILL.md`. Its example `sections/1_introduction/introduction.tex` exists (`find . -name '*.tex'`).
- C2, the grant places: consistent with the same section. See F1 for which parts can occur.
- C3, the grouping: consistent with "How you group them".
- C4, quote and replacement: consistent with "A finding".
- C5, the agent and its tools: consistent with "What you run" and ADR 0003.
- C6, what the agent read: consistent with "What you read".
- C7, two marks from distinct agents: consistent with the gate and Open item V.
- C8, the unmarked list: consistent with the step line.

Findings:

- F4. "Cases", lead sentence: "the first run of each, before the runs start, is a reading of `skills/writing/SKILL.md` as installed that says what the record must then show." That asks the builder, for every case C1 to C8, to explain a place the step does not change (`skills/writing/SKILL.md`). On the unchanged tree the record does not exist, so the first run of each case reads the absent record. The brief template's "Cases" says that no case asks the builder to quote or explain a place the step does not change.
- F5. The brief says the rules file governs "this step unchanged". The rules file's "Where the work happens" says: "In the git worktree the brief names, never in the main checkout", "Nothing under the ledger folder is edited except the report the brief names" and "No sub-agents; no background shells, sleeping or polling".
  - "How the rules file applies to this step" covers the main checkout and the ledger: the record is written there as the orchestrator's own records.
  - It does not say how "No sub-agents; no background shells" applies to the six agents the step starts in the background. Two of them are started by `/writing`, and the four markers are started by the session directly, through no skill.
  - The archived precedent, `2-i-several-plans-in-one-session/agents/reviews/2-brief-check.md` finding 6, raised the same gap.
- F6. Rule 7 of the rules file ("The report states the end state only") requires "every user-visible change with the before and after". The brief's "Report" lists no such part, and the `spec` skill's `templates/brief.md` "Report" holds it. Here it would read "none".
- F7. Marker condition 1 says "the quoted passage stands at the place the finding names, as the draft has it". "Conventions" has the record write every character outside the set by its name.
  - The drafts hold such characters: `LC_ALL=C grep -n '[^ -~]'` found `main.tex:75` (an accented letter in an author's name) and grant paragraph 64 (two `<en dash>`).
  - The brief does not say whether a marker reads the agent's final message or the saved `2-run/*-report.md`.
  - A marker reading the saved copy compares `<en dash>` with the draft's character and can mark a correct quote wrong, which step 3 would then "fix".
- F8. "Conventions": "No secret appears in the draft's copies" cannot hold together with Verify 2 (`diff -r` and `cmp` print nothing) if a draft held a secret, since a copy equals its source byte for byte. Either the convention covers the record only, or it says what is done for a draft with a secret.

## 5. The question

"The goal" is the part of the plan's goal and gate that step 2 delivers: on the real manuscript (with its `\input` files) and the real grant, `/writing` reports its findings, each named at its place, an `\input` file included. Each report is grouped by rule, the most consequential first. The transcript shows one fresh agent that edits no file. Every finding quotes its passage and proposes a replacement. Two fresh reviewer agents mark each finding right or wrong, on copies.

- C1: No. Each finding's line is read with `sed -n`, and at least one included file must hold a finding.
- C2: No for the gate, which asks only that each finding is named at its place. A run with no finding outside the body passes, and the gate asks for none.
- C3: No, provided the order itself is judged by the reading. The item reads "each group with its line saying why it stands where it does, read in the report", which checks that the line exists. Only the session judges the order, and the markers do not.
- C4: No.
- C5: Yes (F9).
- C6: Yes, narrowly (F10).
- C7: Yes, narrowly (F14).
- C8: No.
- The check on the step's line ("each condition of the gate on the runs read from the reports and the transcripts, and each finding's two marks recorded"): Yes (F12).
- What to build, the copies and `diff -r`: No.
- What to build, the runs: No against the gate's conditions, which are read from the record. See F3 for the run's shape.
- What to build, the marks: Yes (F11, F12).
- What to build, the record's item 1 (places): No.
- What to build, item 2 (grouping): as C3.
- What to build, item 3 (transcript): Yes for "one" and "fresh as `ordo-high`" (F13).
- What to build, item 4 (quotes and replacements): No.
- What to build, item 5 (two marks from distinct agents): No.
- What to build, item 6 (copies equal sources): No.
- What to build, the Agents booking: not part of the goal. Its form is F15.
- Verify 3: it can fail without the step writing in research-hub (F17).

Findings:

- F9. C5 checks "no `Edit`, `Write` or `NotebookEdit` call" and "whose only `Bash` command for the grant is the script's command". A `Bash` command that writes a file in the manuscript run (`sed -i`, a redirect) passes C5, yet the gate requires an agent "that edits no file". The review prompt allows no draft command for a `.tex` ("The one command you run for the draft is the one the prompt gives for a `.docx`"). C5 can say that the manuscript run holds no `Bash` command that reads or writes the draft, and that every `Bash` command of either run is read for a write. Item 3 lists "each `Bash` command it ran", but C5 does not hold that list to anything.
- F10. C6 counts the files the agent read. A `Read` with `offset` or `limit` that covers part of a file passes it. Every one of the 33 files is under the `Read` tool's default 2000 lines: the largest is `main.tex` at 202 lines (`wc -lc` over the 33 files), and no line is over 2000 characters. So a `Read` call without `offset` and `limit` reads a whole file, and the check can say that every `Read` call on a draft file has neither.
- F11. "Each marker reads ... the copy of the draft". It does not say the whole draft (all 33 files for the manuscript). Rules that span the draft (`references/rules.md`, "Terms defined at first use" and "Clarity test"; the prose standard, section D, "No synonym cycling") cannot be judged from the lines a finding names. A marker that reads only those lines can mark such a finding right or wrong without the evidence.
- F12. The marks judge only the findings the report gives. A review that reports a handful of right findings and misses most breaks in the draft passes the step's check and every case. The goal says `/writing` "reports the findings". The gate's wording ("each one right or wrong") asks for no check of missed breaks. Adding one, such as each marker also naming breaks the report missed, would change what the step builds, so it is the user's to rule. The session can close this by stating the limit in the step's report or by raising it.
- F13. C5 requires a review agent "started as `ordo-high`" and "one review agent". Item 3 of the record names no evidence for either.
  - The type is in `<id>.meta.json`. For example, `cat .../subagents/agent-a1f33775f8646df06.meta.json` printed `{"agentType":"ordo-high","description":"Brief check of step 2, plan 3",...,"model":"opus"}`.
  - The type is also in the main session transcript's `Agent` `tool_use` `subagent_type`.
  - The count of `Agent` calls in the main session between the `Skill` call and the report shows that one agent was started per run.
- F14. The marks key each finding "by its group and its number in the group", and the review prompt does not number findings. Two markers counting a group's findings differently (for example, one finding listing two places) put two marks on different findings under one number, and C7 still passes. `2-marks.md` rows hold the place, so the join between the two markers can be the place with the quoted passage, which the markers then also give.
- F17. Verify 3: "`git -C /Users/axelfaes/workspace/research-hub status --short` prints the same before and after the step". research-hub is being changed by other work now:
  - `git status --short | wc -l` printed `163`. `docs/DATA-MAP.md` was modified at `Oct 13 11:08:30 2026` against `date` `Tue Oct 13 11:10:36 CEST 2026`, and the other 162 lines are under `tools/oculus`.
  - The check can fail with no write by the step.
  - Limited to the two sources, `git -C research-hub status --short -- projects/manuscripts/hccnet-revision funding/2026-nwo-enw-xs` printed nothing and exited 0.

## 6. Implied inputs

- This is not a code step. It writes ledger records only and changes no script.

Findings: none.

## 7. ADRs

`ls docs/adr` lists 0001 to 0012. Each is `Status: proposed`, and none supersedes another (`cat -n docs/adr/*.md`).

- 0001, the writing base reads the prose standard where it is: touches the step. Under "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists ...". Named in the brief. No contradiction.
- 0002, the prose standard holds over the academic sources: touches the step. Under "The prose standard holds for every text the writing skills write or review." Named in the brief, and marker condition 2 carries it.
- 0003, a fresh read-only agent reviews a draft: touches the step. Under "`/writing` starts one fresh agent that changes nothing, ...". Named in the brief. Its second sentence, "The session shows its report to the user and changes nothing.", is contradicted by the brief's "takes its final message whole" (F3).
- 0004 and 0005 (self-rule endings, the choices file): do not touch the step, which takes no self-rule decision.
- 0006, the ledger records every agent's id with its role: touches the step, which starts six agents and books them. Under "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model ... The cost script takes the ids and roles from the plan's ledger only." Not named in the brief (F16).
- 0007 (repair reviewer model), 0008 and 0009 (the cost script's prices and counts), 0010 (the verify list kept equal; the brief states the fact without the record), 0011 (dispatch blocks) and 0012 (commits name their paths): the step changes nothing these govern.

Findings:

- F15. The brief books every agent "in `plan.md`'s Agents section, with its id, its role (review agent of the manuscript run or the grant run, marker 1 or 2 of a run) and its served model". As bullets, these roles break the closing step's cost script.
  - `skills/plan-orchestration/templates/plan_cost.py` reads every bullet `- <agent id>: <role>, <served model>` of the Agents section.
  - It knows only the role kinds builder, brief check, reviewer, reviewer over a round and grill lookup (its head comment).
  - It errors with `error: agent <id> has an unknown role: <role>` on any other role.
  - The glossary's **Agents section** and the `plan` skill's `templates/plan.md` give the form for such an agent: "a numbered item `<n>. <agent id>: <role>, <served model>` under the heading "Agents in no role the cost script prices:"".
  - Booked as bullets, the six agents make step 4's cost script exit non-zero. The brief can give the numbered form and the heading.
- F16. ADR 0006 touches the step and is not named under "What is on the tree".

## 8. Dictated text

- "Everything in the brief is done", the report's first line: `grep -n 'Everything in the brief is done' .scratch/3-the-writing-base/agents/briefs/2.md` found line 140. Holds.
- `right` or `wrong`, the words of each mark: `grep -n '`right` or `wrong`' .scratch/3-the-writing-base/agents/briefs/2.md` found lines 51 and 79. Holds.
- `<REDACTED>`, the stand-in for a secret: `grep -n 'written `<REDACTED>`' .scratch/3-the-writing-base/agents/briefs/2.md` found line 124. Holds.
- `<em dash>` and `<tab>`, the form of a character's name: `grep -n '`<em dash>`' .scratch/3-the-writing-base/agents/briefs/2.md` found lines 123 and 138. Holds.
- The role texts for the Agents booking, "review agent of the manuscript run or the grant run, marker 1 or 2 of a run": `grep -n 'review agent of the manuscript run' .scratch/3-the-writing-base/agents/briefs/2.md` found line 67. As prose this holds: ASCII, plain, no flagged word. Their form in `plan.md` is F15.
- `LC_ALL=C grep -n '[^ -~]' .scratch/3-the-writing-base/agents/briefs/2.md` printed nothing and exited 1, so the brief is ASCII.

Findings: none.

## Declined to judge

- The user's global rule that manuscript and grant content is reviewed through `academic-paper-reviewer`, against this step's `/writing` review of copies of a manuscript and a grant. The plan's gate and step line, ruled and approved by the user, require `/writing` on the real drafts, and the step writes no manuscript content. Whether the rule reaches a test review of a copy is the user's to say.
- Whether ENW-XS remains the right grant once Decision 1's reason is corrected (F2). The choice is the session's, and nothing in a reread settles it.
- Whether to add a check on breaks the review missed (F12). It changes what the step builds, so it is the user's.
- Whether the copies under `/private/tmp/...` survive until step 3 lands, which the brief requires. macOS may clear old files under `/private/tmp`. Nothing run here settles that, and recopying with `diff -r` before step 3 would answer it then.
- Step 3's reruns use the installed skill pinned at `v7.1.0-rc.1`, so fixes made in `skills/writing/` on main reach the runs only after another pin. That is step 3's concern, not step 2's.
- This agent wrote two temporary files during its reads, `/tmp/x` (a list of the manuscript's `.tex` paths) and `<scratchpad>/bc_out.txt` (the Veni script output), and removed both with `rm`. If a file named `/tmp/x` existed before this run, it was overwritten. No file in Ordo or research-hub was written.

Agent usage: a1f33775f8646df06, claude-opus-5-5, 192280 tokens, 52 tool uses, 9.5 min.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- F1: "What is on the tree", the grant bullet now says the output is 69 numbered paragraphs and 4 part lines, the header part holding paragraphs 64 and 65 and the footer part 66 to 69, and the footnotes and endnotes parts printing no paragraph.
- F2: "Decisions taken in this brief" 1 now gives the reason as the only candidate with paragraphs outside the body from both a header and a footer part, and says Veni holds only the funder's footnote and a page number outside the body.
- F3: "What to build", the runs: both runs are invoked in one turn, the grant run's agent started while the manuscript run's runs, and the turn ends with one message holding both reports whole, which is each run's Steps 7; the step resumes at the user's next message, whatever it says, and the reports are saved from the completion notices after the skill's run has ended. "What it must do" gives that order.
- F4: "Cases", the lead sentence: the first run of each case is the `ls` of the record's paths, which prints that they do not exist, noted once for all eight cases.
- F5: "How the rules file applies to this step" gains a bullet: the rule against sub-agents and background shells binds a builder agent; this step has none, and its six agents are started as `/writing`'s Steps 5 and this brief say, in the background, each changing no file and starting no agent.
- F6: "Report" gains the part "Every user-visible change with its before and after: none".
- F7: "What to build", the marks: each marker's prompt holds the report as the review agent's final message, byte for byte, never the saved copy.
- F8: "Conventions": the rule on secrets covers the record only; the copies equal their sources byte for byte.
- F9: C5 now requires that the manuscript run holds no `Bash` command naming a draft file, that the grant run's only `Bash` command on the draft is the script's, and that every `Bash` command of either run writes nothing; item 3 of the record quotes each and reads it for a write.
- F10: C6 and item 3 of the record require each `Read` call on a draft file to have no `offset` or `limit`, with the 202-line maximum stated.
- F11: "What to build", the marks: each marker reads the whole copy of the draft, all 33 files or the whole script output.
- F12: the record gains item 7, which states in the report that the marks judge only the findings the reports give and that no check counts missed breaks, since the gate asks for none. Adding such a check would change what the step builds, which is the user's to rule; the step's report names the limit so the user sees it.
- F13: item 3 of the record names the agent's type from its `agent-<id>.meta.json` and the count of `Agent` calls in the session's transcript between the run's `Skill` call and its report.
- F14: the marks name each finding by its group, its place and the first words of its passage, and `2-marks.md` joins the two markers on the place and the passage.
- F15: the Agents booking is the numbered form under the heading "Agents in no role the cost script prices:", with the roles named.
- F16: "What is on the tree" names ADR 0006 with its decision sentence.
- F17: Verify 3 is limited to `projects/manuscripts/hccnet-revision` and `funding/2026-nwo-enw-xs`, which printed nothing.
- Declined to judge, the copies under `/private/tmp`: "What to build" now says step 3 runs `diff -r` and `cmp` again before its runs and copies again from the sources when a copy is gone.
- Dictated lines added after the check: the heading "Agents in no role the cost script prices:" (`grep -n 'Agents in no role' .scratch/3-the-writing-base/agents/briefs/2.md`), copied from the glossary's **Agents section**, holds; the roles "review agent of the manuscript run of step 2", "review agent of the grant run of step 2" and "marker 1 of the manuscript run of step 2" (`grep -n 'review agent of the manuscript run of step 2' .scratch/3-the-writing-base/agents/briefs/2.md`) hold: ASCII, plain nouns, no word of the prose standard's section C.
