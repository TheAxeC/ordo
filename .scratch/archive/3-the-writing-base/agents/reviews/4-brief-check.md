# Step 4 brief check (on main at 5511b98)

The working tree also holds uncommitted changes (`git status --short`): ` M .scratch/3-the-writing-base/orchestrator-state.md`, ` M .scratch/3-the-writing-base/plan.md`, ` M docs/adr/0013-a-script-and-four-fresh-read-only-agents-review-a-draft.md`, `?? .scratch/3-the-writing-base/agents/briefs/4.md`. I edited no file.

## 1. Names

I ran `git grep -n -i 'review agent' -- . ':(exclude).scratch'`, `git grep -n -E '`writing`|/writing|writing skill|skills/writing' -- . ':(exclude).scratch' ':(exclude)skills/writing'`, `git grep -n 'cases/' -- . ':(exclude).scratch'`, `grep -n 'cases' .scratch/3-the-writing-base/orchestrator-state.md` and `git grep -n -E 'Review agent prompt|`writing`, Steps'`.

Hits inside the brief's paths: `.agents/plan.yaml:10`, `agents/ordo-*.md:3` and `:6`, `skills/plan/templates/plan.yaml:12` and `:27`, `skills/plan/templates/orchestrator-state.md:14` and `:26`, `skills/repo-setup/templates/plan-terms.md:39,41,99`, `docs/glossary.md:44,46,104`, `README.md:26`, `docs/academic-coverage.md:101`, `docs/dev/building.md:11` and `:27`, `docs/dev/change-standard.md:75`, and `skills/writing/SKILL.md:3,10,63,74`. Each is covered by item 5 or item 6.

Hits outside the brief's paths:
- `docs/roadmap.md:24` (Goal): "`/writing` has one fresh agent that changes nothing read a whole draft". The change makes this false.
- `docs/roadmap.md:25` (Gate): "each run's transcript shows the review made by one fresh agent that edits no file". The change makes this false. The ruling "Step 3, the second run" has `/roadmap` rewrite both. `git log --oneline -3 -- docs/roadmap.md` shows the last change was 6f97b05, so the rewrite has not happened, although the state file's "Current position" puts it before `/spec` of step 4. The brief does not mention it. Its case 9 grep does not catch it, because the line does not contain "review agent".
- `.scratch/3-the-writing-base/orchestrator-state.md:13`: the verify list still holds the `case ... esac` skip. Item 6 makes it differ from `docs/dev/building.md`. ADR 0010 has `/land` rewrite it, but the brief does not say so.
- `.scratch/3-the-writing-base/orchestrator-state.md:68`: "over every file the diff touches outside a ledger's `cases/` folder". This becomes stale wording.
- `.scratch/3-the-writing-base/orchestrator-state.md:72`: "ADRs 0001 to 0003". This does not name 0013. It is orchestrator text, not changed by the step.
- `README.md:77` ("The plan skills, `grill` and `writing` launch their agents through five agent definitions") stays true.
- `skills/repo-setup/templates/docs/glossary.md:3` stays true.
- `docs/adr/0003-...md` is superseded, so it is history.
- The ledger briefs and reports are history.
- Skill versions (`grep -n 'version:'`): plan 5.0.1 and repo-setup 5.2.0. At 724bde5 they were 5.0.0 and 5.1.0, so plan 3 has already raised each once. The step changes their templates, and the brief does not say that their versions stay unchanged.
- New names the step introduces have no glossary entry: "sentence agent", "section agent", "whole-draft agent", "checking agent", "finding agents" and "review agents of `writing`". The brief does not decide whether any of them is a term (`docs/dev/skill-layout.md`, "Writing for an agent").

Findings:
- N1: `docs/roadmap.md:24-25` are made false. The brief neither names them nor says that `/roadmap` rewrites them before or at landing. Case 9 cannot see them.
- N2: the state file's verify list and its "Verification, every step" line keep the `cases/` skip. The brief does not say that `/land` rewrites the list under ADR 0010.
- N3: the brief does not say that the versions of `plan` and `repo-setup` stay unchanged.
- N4: the brief does not decide whether the new agent names are glossary terms.

## 2. The step line

Each part of step 4's line in `plan.md`, mapped to the requirement that serves it:
- "first runs a new script `prose_facts.py` on the draft": item 2.2.
- "then starts four fresh agents that change nothing": items 2.3 and 2.4, with "edit nothing" in the item 3 bullets.
- "each given in its prompt the draft's text, the script's facts and only its own rules": item 2.3 serves this for the three finding agents only. Item 2.4 gives the checking agent the findings, the quoted paragraphs and the rules the findings name. It gets neither the draft's text nor the facts, and the rules it gets are not its own. This part has no requirement for the fourth agent.
- Sentence agent: the Sentence row and the bullet at line 59.
- Section agent, for each section's job, its tense, the first sentence of each paragraph and what the register asks: the Section row ("So what per section", "Tense per section", "Paragraphs (all three headings)", "What the reader looks for") and the bullet at line 60.
- Whole-draft agent, for one term per concept, repeated shapes, mirror structure, terms defined at first use, and limitations and alternatives: the Whole draft row.
- Checking agent: item 2.4 and the bullet at line 62.
- "one report grouped by rule": items 2.6 and line 62.
- "each rule ... given to one agent": the item 3 table.
- `prose_facts.py` computes the listed facts "and nothing else": item 1 and its line "computes these and nothing else". Item 1 also reads the "Vague qualifiers" list, which is neither the "banned" nor the "flagged" list that the ruling and ADR 0013 name (see question 5).
- "`docx_paragraphs.py` stays": premise 12 and item 2.2.
- "follows ADR 0013": premise 19 and Read 4.
- "reviewed once by `/refute` and landed by `/land` with no repair round": process only, with no builder requirement. Correct as such.
- "the session deletes this folder's `cases/` at the landing": item 6.
- "then tag `v8.1.0-rc.3` and pin, and `/writing` runs once on the NWO XS application": the brief says only that the run is the check after landing. It does not name the tag. That is process.
- The check (the user reads the report, at most 300,000 tokens, transcripts, report shape): item 4 and the line "The `/writing` run ... are the step's check after landing".

The ruling "Step 3, the second run":
- One step, the rebuild, the 300,000-token cap, the approval of what `prose_facts.py` computes, D1 and D6 replaced, and ADR 0013 superseding 0003 are all served (premises 19 and 20, items 1 to 4).
- "The test drafts in `cases/` are deleted at step 4's landing" is served by item 6.
- Item 6 also removes the character-set skip of `cases/`, which neither the step line nor this ruling names. That skip was ruled by the user in "Step 2, the case files", Question 2 (a), and the brief does not list that ruling among the rulings that touch the step. The removal is needed, because `docs/dev/building.md:27` ("They hold the drafts the `/writing` gate runs on") becomes false once the folder is gone. But the brief does not name the ruling it partly takes back.
- The uncommitted ruling "Step 4, the session's verdict (2026-10-15)" (`git diff .scratch/3-the-writing-base/plan.md`) adds a verdict the session gives after the run. The brief does not name it.

Findings:
- S1: no requirement gives the checking agent the draft's text, the facts or "only its own rules", which the step line and ADR 0013 both require of every one of the four agents.
- S2: the brief does not name that item 6 partly takes back "Step 2, the case files", Question 2.
- S3: the brief does not list the new ruling "Step 4, the session's verdict".

## 3. Premises

Each premise of "What is on the tree", rerun:
- Premise 11 holds. `wc -l skills/writing/SKILL.md` prints `143`. `grep -n version` prints `5:  version: "1.0.0"`. Line 63 is Steps 5 ("Start one fresh agent"), and `74:## Review agent prompt`. `docs/dev/skill-layout.md:23` matches.
- Premise 12 holds, with one line range wrong. `ls skills/writing/templates` prints `docx_paragraphs.py`. The output formats match the docstring. `grep -n '"""' skills/writing/templates/docx_paragraphs.py` prints `2:` and `33:`, so the docstring is lines 2 to 33, not "lines 1 to 35".
- Premise 13 holds. `wc -l` prints 75, 220 and 77. `grep -c '^### '` prints 23 and 16. The prose standard's sections are 0, A to F and "How it is applied".
- Premise 14 holds. The `git grep -n -i 'review agent'` hits outside `.scratch` are exactly those listed, plus `skills/writing/SKILL.md:63` and `:74`. The quotes of `README.md:26` and `docs/academic-coverage.md:101` hold.
- Premise 15 holds. `docs/dev/scripts.md:23` is the `docx_paragraphs.py` row, and there is no `prose_facts.py` row.
- Premise 16 holds. `docs/dev/building.md:11`, `docs/dev/change-standard.md:75` and `building.md:27` match. `find .scratch -type d -name cases` prints only `.scratch/3-the-writing-base/cases`. `git ls-files -co --exclude-standard .scratch/3-the-writing-base/cases | wc -l` prints 17, all of them tracked.
- Premise 17 holds for the run I checked. The transcript `subagents/agent-ac0c8308fb418781e.jsonl` gives a first response with `cache_read_input_tokens: 17163` and `cache_creation_input_tokens: 23037`. The last response's context is 47,500 + 12,331 + 2 = 59,833, so 119,858 - 59,833 = 60,025 tokens are output, which matches "about 60,000". The totals 97352 and 119858 stand in `agents/reviews/3-writing-nwo-xs.md:3` and `3-writing-nwo-xs-run-2.md:3`. I did not check the 97,352 run's transcript.
- Premise 18 holds, read as the printed text. `docx_paragraphs.py ... | wc -l -w` prints `55 2715`, and `wc -c` of that output prints `18059`. The `.docx` itself is 192,645 bytes (`wc -c`). The 2,715 words include the 55 paragraph numbers (see case 1).
- Premise 19 is wrong in two places.
  - "No other ADR touches the step" is false. ADR 0010's decision ("`/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file") governs the verification-page command that item 6 changes. ADR 0012's decision ("Every commit a skill makes on main names its paths") governs the landing commit, which must name the deleted case files.
  - The ADR 0013 sentence the brief relies on for "no test" is not on main. `git show HEAD:docs/adr/0013-...md | tail -3` prints "The script needs its own tests, since a wrong count is a wrong finding." The working copy's "The script is listed on `docs/dev/scripts.md` as a user script." is uncommitted (`git diff docs/adr/0013-...`). A worktree created at a base that lacks it gives the builder an ADR that contradicts the brief's line "The rules file's test rule calls for no test of `prose_facts.py`".
- Premise 20 is incomplete. D3, D4, D16, D18, D22, D29 and D30 exist and say what the brief says. Missing are "Step 2, the case files" (S2), D10 (the term **finding**, which item 5 changes) and the uncommitted "Step 4, the session's verdict" (S3).
- Premise 21 holds. The state file's line 13 equals `docs/dev/building.md:11` and `docs/dev/change-standard.md:75` (a shell string comparison printed `state=building` and `building=change-standard`).

Findings:
- P1: ADR 0013 on main still requires tests. The edit is uncommitted and must be on main before the base, or the brief must say why it is not.
- P2: "No other ADR touches the step" is false for ADR 0010 and ADR 0012.
- P3: the docstring range is "lines 1 to 35" in the brief and lines 2 to 33 on the tree.
- P4: the rulings list misses "Step 2, the case files", D10 and "Step 4, the session's verdict".

## 4. Cases and checks

I reran each case against the rules file and the standards. I ran a model of the brief's own split and word rules as inline `python3 -I -c` commands over `docx_paragraphs.py`'s output and the engineering `.tex`.

- Case 1 (NWO, 55 paragraphs, words sum to 2,715 "for `docx_paragraphs.py`'s output without the numbers"): the expected count is wrong. `sed 's/^[0-9]*\( \[[^]]*\]\)\{0,1\}: //' nwo.txt | wc -w` prints `2660`, because 2,715 includes the 55 `<n>:` tokens. Under the brief's word rule the sum is 2,659. The only token with no letter or digit is one `-` (`tr -s ' ' '\n' | grep -v '[[:alnum:]]' | sort | uniq -c` prints `1 -`). The case's escape clause covers only tokens with no letter or digit, so a correct script fails the case by 55 and the builder must hand back. The case also asks the builder to explain `docx_paragraphs.py`'s output, which the step does not change.
- Case 2 holds. `grep -n -o -i -w -E '<all three lists>' nwo.txt` prints only `6:often`. "usually" stands in paragraph 6, and "mostly", "frequently" and "rarely" in paragraph 27. The apostrophe tokens are applicant's, patient's, readout's, scan's, Barrett's and liver's, with no contraction. The case runs only with the template prose standard as the second argument, so a script that ignores that argument also passes.
- Case 3 holds. My model of the brief's split rule gives paragraph 38 sentence 3 as `82` words, beginning "Overlapping work packages:".
- Case 4 holds.
  - `grep -o ';' sections.tex | wc -l` prints 6, all at `sections.tex:215`.
  - The non-ASCII characters are `177 U+2014 EM DASH`, `179 U+2013 EN DASH`, `203 U+201C`, `203 U+201D`, `205 U+2026` and `211 U+2192`.
  - The only contraction is `63:didn't`.
  - The runs model prints only `RUN ('sections.tex:81', 1) ('sections.tex:83', 2) 5 7`.
  - The case reads `cases/`, which the step does not change (the session deletes it).
- Case 5 holds by the brief's rules. It reads `cases/`.
- Case 6 holds. Paragraph 28 sentence 2 is one sentence of 33 words. "Smith et al. (2019) measured it." is one sentence, and "The p value was 0.05. It held." is two. The builder's scratch folder for the `.txt` is not named, whereas briefs 2 and 3 named theirs.
- Case 7 is consistent with item 1. It does not cover an error in the second argument (see question 5 and implied inputs).
- Case 8 is consistent with `docs/dev/skill-layout.md`. As dictated, the table fails it on the points under section 8.
- Case 9 is too narrow. `README.md:26` ("with one fresh agent"), `skills/writing/SKILL.md:3` and `docs/roadmap.md:24` do not hold "review agent", so the grep passes with them unchanged.

Against the rules file and the standards:
- The rules file, rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case"), applies in two places, and neither has a case:
  - The draft path reaches the session's command `python3 <this skill's folder>/templates/prose_facts.py <draft> <prose standard>` (brief line 44).
  - An `\input{...}` value reaches a file open in `prose_facts.py`, for example `..` or an absolute path.
- The rules file, rule 14, requires the head comment to list every input, every error and every exit status. Item 1 says only "what it reads and prints, as `docx_paragraphs.py`'s does". This is acceptable only because the docstring it points at lists all three.
- `docs/dev/skill-layout.md`, "A rewrite of a skill", says such a rewrite keeps every rule of the old text. Item 3 says "the current prompt's bullets kept where they still apply" but does not name the old rules the ruling replaces. A reviewer holding the rewrite to that section cannot tell a dropped rule from a replaced one. The old rules in question are:
  - The Rules bullet "One agent reads the whole draft in a run".
  - The prompt bullets "Read in full and in this order: ...", "For a `.tex`, `.md` or `.txt` draft, run only `LC_ALL=C grep -n ...`", "For a `.docx` draft, run only `python3 <docx_paragraphs.py>`", "Report each break and leave the decision on it to the user" and "Check each passage you report against every other rule of the three pages".
  - The Anti-patterns "Do instead" cell "Start the agent of Steps 5 and show its report".
- The "Draft refused" row of Stops needs its When column to gain the script's non-zero exit. The brief names only the refusal, not the table row.

Findings:
- C1: case 1's expected 2,715 is wrong. It is 2,660 without the numbers, and 2,659 under the brief's word rule.
- C2: case 9's grep cannot see `README.md:26`, the description at `SKILL.md:3` or `docs/roadmap.md:24`.
- C3: no rule 15 cases (the draft path in the session's command, and an `\input` path outside the main file's folder).
- C4: the brief does not name the old rules that the ruling replaces in the rewrite.
- C5: the case 6 scratch folder is not named.
- Cases that check or explain places the step does not change: case 1 (`docx_paragraphs.py`'s output and `wc`), cases 2, 3 and 6 (the NWO `.docx` in research-hub), and cases 4 and 5 (`.scratch/3-the-writing-base/cases/engineering/`). All of these are inputs that are read, not changed.

## 5. The question

The goal is that `/writing` measures a whole draft with a script, and four fresh agents that change nothing review it, report in one grouped report, at most 300,000 tokens on NWO XS.

Cases:
- Case 1: no for the `.docx` path, but it cannot pass as written (C1).
- Case 2: yes. A script with the lists hard-coded passes, since no case runs another prose standard.
- Case 3: yes. One sentence count does not show the split rule in general. Cases 4 and 6 cover more.
- Case 4: no. Several independent facts are named at their lines.
- Case 5: no.
- Case 6: no.
- Case 7: no for what it covers.
- Case 8: yes. The table and layout can be right while the prompts do not produce a useful report. Only the run after landing shows that.
- Case 9: yes (C2).

The check on the step's line: no for usefulness and tokens, since the user reads a real run and the totals come from the completion notices. Yes for the transcript part. The check asks only that the agents "edit no file". Item 2.3 requires that they run no command and read no file, and an agent that reads the three pages breaks the cost lever while passing the check as worded.

Items of "What to build":
- Item 1: yes for `.md`, which no case runs. Yes for real `.tex`, because the dictated rules give wrong facts on inputs that occur. In the case draft itself, the split model joins the four `\item` lines at `sections.tex:232-235` into one 32-word "sentence". It makes `sections.tex:270` ("... cross-core traffic. \textbf{The fixed pool design ...}") one 20-word sentence, because no split happens before a `\`. It counts `\noindent` (`main.tex:11`) and `\textbf{surprising}` as words.
- Item 2: yes. No check before landing exercises the skill. The run after landing covers it.
- Item 2.4: yes. The checking agent gets only the paragraphs a finding quotes. A finding about something absent cannot be confirmed from those paragraphs, and it is told to "drop every other finding". The rules where that happens are What the reader looks for, Limitations and alternative interpretations, Term defined at first use, No synonym cycling across paragraphs 27 and 33, and Tense per section. The same holds for a count finding (semicolons per 1000 words, five equal sentences) without the facts. These are the section and whole-draft rules that ADR 0013 says the old design missed. The step can therefore pass its build and review while the checking agent removes exactly those findings.
- Item 3: yes. The "exactly one row" read passes with the omissions named in section 8.
- Item 4: no, it is measured. But the brief's own figures make it tight: four agents at about 40,000 tokens of context each before reading, plus about 15,000 tokens of prompt for each finding agent (draft about 18 KB, facts under 20 KB, rules), give about 215,000 before any output. That leaves about 85,000 tokens of output for four agents, against about 60,000 output by the single agent on the same draft (premise 17). The brief names no lever on output.
- Item 5: yes (C2).
- Item 6: yes. No case or check reads `docs/dev/building.md` after the change. The new full command cannot be run green in the worktree, because `cases/` is present there (for example `sections.tex:177` holds an em dash). It is checked only by reading and at landing.

Findings:
- Q1: the checking agent's prompt lacks the draft text and the facts (item 2.4), so it can drop true section and whole-draft findings.
- Q2: item 1's dictated rules give wrong sentence facts on LaTeX markup in running text, which occurs in the case draft and in research-hub.
- Q3: case 2 and case 9 can pass without their part of the goal.
- Q4: the 300,000 cap has no stated lever on output, and the brief's own numbers leave about 85,000 tokens of output for four agents.
- Q5: item 1 adds the Vague qualifiers list beyond the approved "banned and flagged lists". The case relies on that list ("often" (Vague qualifiers)). Either the brief cites the ruling's reading, or the computation needs the user's approval (`docs/dev/change-standard.md`, "Scripts compute facts; judgment is read").

## 6. Implied inputs

Each input below has happened or would cost something if handled wrongly, and none has a case:
- **LaTeX commands inside a text line.** Seen as `\item`, `\textbf{...}`, `\texttt{...}`, `\noindent` and `\cite{...}`. In the case draft: `sections.tex:232-235`, `:243-246`, `:257`, `:259`, `:263`, `:270` and `main.tex:11`. In research-hub (`git ls-files '*.tex' | xargs grep -h -o ...`): 2,527 `\cite{`, 2,452 `\textbf{`, 1,578 `\ref{` and 1,047 `\emph{`; 1,005 `\item` lines and 5,361 lines with `$...$`. A wrong answer is a wrong sentence length or a wrong equal-length run given to the sentence agent as fact. The expected result is unstated: whether a split may happen before `\` and whether commands count as words.
- **A run of non-blank lines that starts or ends with a markup line around text.** Seen as `main.tex:7-9` (`\begin{abstract}`, text, `\end{abstract}`) and `sections.tex:231-236`. Is the place the run's first line (a markup line) or the first text line? The expected result is unstated.
- **An unescaped `%` after text on a line.** It occurs in the case drafts as `95% CI` (`medicine/main.tex:39`, `:47`, `medicine/sections.tex:15` and `sciences/main.tex:37`). It also occurs in 99 research-hub `.tex` files, and research-hub has 7 commented `\input` lines. The brief drops only lines whose first non-blank character is `%`, while `SKILL.md` Steps 3 does not follow a command after an unescaped `%`. The expected result is unstated, for the text and for a commented `\input` of a missing file, which would wrongly refuse.
- **The contraction rule.** "The letters before the apostrophe are one of `n` (as in `don't`), `it`, ..." gives two contradictory results on the brief's own cases. Read as "exactly `n`", "didn't" (letters "didn") is no hit, so case 4 fails. Read as "ends in `n`", with `s` allowed after it, the NWO's "scan's" (paragraph 39) is a hit, so case 2 fails. Possessives such as "unit's" (ends in "it") or "outlet's" (ends in "let") would also hit. The expected result needed is `n` paired with `t` only.
- **A tab or a carriage return in a `.tex` or `.md` source.** In research-hub `.tex` files, 13 hold a tab and 7 a CR (`grep -l`). `python3 -I -c "import unicodedata; print(unicodedata.name('\t','<no name>'))"` prints `<no name>`, so `U+<hex> <Unicode name>` has no value. A plain `unicodedata.name(c)` raises an exception, so a valid draft would be refused or the facts flooded. The expected result is unstated.
- **A non-ASCII character outside a paragraph.** This covers a `\section{...}` or Markdown heading, a comment line, or a fenced block. `## Non-ASCII` reads only paragraphs, so the ASCII-rule break goes unreported. The old design ran `LC_ALL=C grep -n` on every line of every file (`SKILL.md:83`). It has not occurred in the cases. A wrong answer is a missed finding.
- **A prose standard (second argument) that is unreadable, or whose section A lists are missing or worded differently.** ADR 0001 lets a repository's own page take precedence. What should happen is unstated: an error, or `none`. A silent `none` tells the agents that no listed word occurs. An error is mapped by item 2.2 to "Draft refused", which names the wrong file.
- **A `.md` draft** (`#` headings, fenced code). No case runs one.
- **A `\input` cycle** (a file that inputs itself). `SKILL.md` Steps 3 lists a file once. The script is not told the same, and a wrong answer is a run that never ends.
- **The served-model stop for one of three agents running at once.** `SKILL.md` Steps 6 stops "the agent" and uses nothing it wrote. Whether the other two are stopped is unstated, and a wrong answer costs their tokens.

Findings: each item above is missing from "Cases" with its expected result. The contraction rule and the LaTeX-markup items occur in the brief's own case inputs.

## 7. ADRs

I read every `docs/adr/NNNN-*.md` and `README.md`.
- 0001 (proposed). In force. Decision: "`/writing` and the skills that read the writing base read the prose standard where it is ... `skills/writing/` holds no copy of it." It touches "What it reads" 2 and the script's second argument. The brief names it, and nothing in the brief contradicts it.
- 0002 (proposed). In force. Decision: "The prose standard holds for every text the writing skills write or review." It touches the prompt bullets. The brief names it, and the bullet at line 58 ("the prose standard holds") keeps it.
- 0003. Status "superseded by 0013", so not in force. The brief names it.
- 0004 to 0009 and 0011 do not touch the step. 0006 governs plan skills' agents. The four `/writing` agents of the run after landing are recorded by the session, not built by the step.
- 0010 (proposed). It touches the step: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file and names the change in the brief or the booking." Item 6 changes the verification page's command. The brief does not name it, and premise 19 denies that it touches the step.
- 0012 (proposed). It touches the landing: "Every commit a skill makes on main names its paths in the commit command". The session's deletion of `cases/` must be named in the landing commit. The brief does not name this ADR.
- 0013 (proposed). It touches the whole step: "It then starts four fresh agents that change nothing, each given in its prompt the draft's text, the script's facts and only its own rules ... Each rule of the three pages is given to one agent." The brief names it. Two parts of the brief contradict it:
  - Item 2.4's checking agent gets neither the draft's text nor the facts.
  - On main, its Consequences say "The script needs its own tests", against the brief's line "The rules file's test rule calls for no test of `prose_facts.py`". The working copy has replaced that sentence, but the change is uncommitted.

Findings:
- A1: item 2.4 contradicts ADR 0013's decision.
- A2: ADR 0013 on main contradicts the brief's line on tests until the edit is committed.
- A3: the brief does not name ADR 0010 or ADR 0012.

## 8. Dictated text

`grep -n -F` of each piece in `.scratch/3-the-writing-base/agents/briefs/4.md`:
- Lines 32 to 37, the output headings and lines (`## Paragraphs`, `## Sentences`, `## Runs of equal length`, `## Semicolons`, `## Non-ASCII`, `## Listed words`): these hold. The headings are labels (prose standard, section 0, "Headings are labels, not sentences"). The output goes to agents, not to the user as a finding (`docs/dev/change-standard.md`, "Scripts compute facts; judgment is read").
- Line 38 (`## Contractions` and its rule): this breaks. Its rule contradicts cases 2 and 4 (section 6).
- Line 39 (`usage:` and `error: <file>: <reason>`): these hold.
- Line 44 (`python3 <this skill's folder>/templates/prose_facts.py <draft> <prose standard>`, and "Draft refused"): this breaks in two ways.
  - The rules file, rule 15: the draft path reaches a command with no case.
  - A non-zero exit caused by the prose-standard argument is reported under the refusal named for the draft.
- Line 49 (tokens line): this holds.
- Lines 52 to 56, the table. It breaks in five ways:
  - `docs/dev/skill-layout.md`, "Lists and tables", says "A cell holds a phrase or a sentence". The Prose standard cells of the Sentence row (seven parts: "0: ... A: ... B: ... C: ... D: ... E: ... F: ...") and of the Section row (five parts) each hold several sentences.
  - The brief's own Conventions say "each cell naming rules by the page's own section and label". Four labels match no heading or bullet of the prose standard:
    - "the openers to delete": section C's paragraph reads "Delete the opener rather than rewriting it: ...".
    - "Binary contrast at most twice per page": the page's bullet reads "Binary contrast ("not X, Y") at most twice per page".
    - "Three or more list-shaped items in paragraph form become a list, and lists are introduced with a colon": the page has two sentences, "... become a list. Lists are introduced with a colon.".
    - "Arrows": the page's bullet reads "Arrows (`->`) only inside code and code comments".
  - The brief's Decision 3 says "rules that ... count over the whole draft go to the whole-draft agent". Yet B "Semicolons" ("at most 2 per 1000 words") stands in the Sentence row.
  - `references/rules.md` "Flagged terms / Alternatives" stands in the Sentence row, although its own text says "No finding is reported under it, and no finding lists an alternative". Copying it whole puts the alternatives table into the agent's prompt, against D30.
  - Text that no row carries, which an agent needs:
    - The opening paragraphs of `references/registers.md`: "Where a register line and its voice rule differ on the pronoun, the voice rule holds" and "A venue's author guidelines hold over a voice rule when the project names the venue" (D18).
    - The "(manuscripts and grants)" marker on the `## Formality` group heading. The row names "Formality / Full forms", and whether the copied text carries the group heading's marker is unstated.
- Line 58 (the bullets every finding agent gets): this mostly holds. "As the facts name it" gives a hard-wrapped `.tex` paragraph the place of its first line. The old rule, `SKILL.md:108`, gave the passage its own line. The bullet does not say which of the two holds.
- Lines 59 to 61 (the sentence, section and whole-draft agent bullets): these hold.
- Line 62 (the checking agent's bullets): these hold against D29 and D30. They are insufficient for the goal (Q1).
- Line 64 ("`writing` for its review agents", "a review agent of `writing`"): these hold.

The coverage of the table, read heading by heading against the three pages:
- Prose standard, section 0: 8 bullets, each in one row.
- Section A: 3 lists, Sentence.
- Section B: 4 bullets, three in Sentence and one in Section.
- Section C: 3 rules, two in Sentence and one in Section.
- Section D: 7 bullets, one in Sentence, two in Section and four in Whole draft.
- Section E: 8 bullets, six in Sentence and two in Section.
- Section F: 4 bullets, Sentence.
- `references/rules.md`: 23 `###` headings, 14 in Sentence, 6 in Section and 3 in Whole draft. Each is in exactly one row.
- `references/registers.md`: the 16 `###` headings, as Register, Terminology and Voice in Sentence and What the reader looks for in Section, per register. Each is in exactly one row.
- No rule stands in two rows.
- In no row: the prose standard's `## How it is applied` heading (with "A violation a page quotes from elsewhere is fixed at its source") and its opening lines, which the brief does not state as excluded, and the `registers.md` opening rules named above.

Findings:
- D1: the table's prose-standard cells break skill-layout's one-phrase-or-sentence cell rule.
- D2: four labels are not the page's own labels.
- D3: Semicolons is placed against the brief's Decision 3.
- D4: "Flagged terms / Alternatives" is placed in a row although its own text says it is no rule.
- D5: the `registers.md` opening rules and the Formality group marker reach no agent. "How it is applied" stands in no row with no stated exclusion.
- D6: the line 38 contraction rule is self-contradictory.
- D7: line 44 maps a prose-standard error to "Draft refused", and its draft path has no rule 15 case.

## Declined to judge

- Whether 300,000 tokens is reachable. Only the run after landing settles it. I gave the arithmetic from the brief's own figures under question 5.
- Whether the old prompt's prompt bullets stay in force under the ruling. That is for the orchestrator to state (C4).
- The 97,352-token run's transcript. I checked only agent ac0c8308fb418781e's.
- `plan.md`'s Agents section lists the step 3 `/writing` agents as bullets ("/writing review agent of step 3 ..."). `skills/plan-orchestration/templates/plan_cost.py:18` says "Any other role text is an error", so the cost script would reject these at the closing unless they move under "Agents in no role the cost script prices:". This is a ledger matter of step 5, outside this brief.
- How `/land` stages the deletion of `cases/` so the landing commit names it. That is landing mechanics, outside the brief.

Agent usage: a293907a50452e96c, claude-opus-5-5, 252343 tokens, 58 tool uses, 11 min 52 s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- N1: "What is on the tree" names `docs/roadmap.md:24` and `:25` and says the session rewrites them through `/roadmap` after the user's approval; the last case's grep now also finds "one fresh agent" and "one agent", with `docs/roadmap.md` and `docs/adr` left out.
- N2: "What is on the tree" says `/land` rewrites the state file's verify list under ADR 0010 and that the builder does not touch the state file. The state file's prose lines are the session's, changed at landing.
- N3: "What is on the tree", first bullet, says the versions of `writing`, `repo-setup` and `plan` stay unchanged, with the command.
- N4: Decisions 6: the four agent names are section names of `SKILL.md` and get no glossary entry.
- S1, A1, Q1: item 2.4 and the checking agent's bullets give it the draft's text and the facts, and a finding on what the draft lacks is checked against the whole text; Decisions 2 says why.
- S2: "What is on the tree" names "Step 2, the case files", Question 2, and says the skip goes with the folder.
- S3, P4: the rulings bullet names "Step 2, the case files", "Step 4, the session's verdict" and D10.
- P1, A2: the ADR 0013 edit is in the preparation commit, before the base; "What is on the tree" quotes the sentence.
- P2, A3: ADR 0010 and ADR 0012 are named with their decisions; "No other ADR touches the step" now follows them.
- P3: the docstring range reads lines 2 to 33.
- C1: case 1 expects 2,659 words, with the reason; "What is on the tree" gives the 2,660 tokens and the lone `-`.
- C2: the last case's grep is widened as in N1.
- C3: cases for a draft path with a space, an `\input` with `..` and a self-input; item 2.2 quotes each path in the session's command.
- C4: item 2 lists the old rules the ruling replaces and the Anti-patterns cell and Stops rows that change.
- C5: the scratch folders `/tmp/ordo-3-4/` and `/tmp/ordo-3-4-other/` are named under "Paths this step writes" and in the cases.
- Q2: item 1 states how `.tex` markup in running text is read (`\item`, citation and reference commands, one-argument commands, commands with no argument, inline math, `~`, `%`), and the engineering and medicine cases check it at `sections.tex:232`, `:270`, `main.tex:7` and `:11`, and `medicine/main.tex:39`.
- Q3: a case runs the script on an edited copy of the prose standard, so lists read from the file are checked; the last case's grep is widened.
- Q4: item 4 adds the final message that holds the findings and nothing else as a lever, and the bullets say so.
- Q5: Decisions 4: the script counts only the "Banned as filler" and "Flagged, not banned" lists the approval names; "Vague qualifiers" goes to the sentence agent; case 2 expects `none`.
- Implied inputs: the contraction rule is rewritten (`n't`, or a listed pronoun with its ending); `## Non-ASCII` reads every line of every file, prints only characters above U+007E and `no name` where Unicode has none, with tab and carriage return stated; a prose standard missing a list is an error; a `.md` case; a self-input case; Steps 5 of the rewrite stops every running agent on a wrong served model.
- D1: the table is replaced by one bullet list per agent (item 3, Conventions).
- D2: the four labels are the page's own: "Delete the opener rather than rewriting it", "Binary contrast ("not X, Y") at most twice per page", "Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.", "Arrows (`->`) only inside code and code comments".
- D3: "Semicolons" moved to the whole-draft agent.
- D4: Flagged terms / Alternatives goes to no agent, with its reason; the sentence agent gets the opening paragraph and Discipline exceptions.
- D5: `registers.md`'s opening paragraphs go to the sentence agent; rule text is copied with its `##` heading and marker; the prose standard's opening and "How it is applied" go to no agent, with the reason.
- D6: as under implied inputs.
- D7: the refusal of a script's non-zero exit is the new row "No facts", which names the script's line; "Draft refused" keeps its causes.
- Line 58 (place of a hard-wrapped passage): a finding gives the line where its quoted passage starts (Decisions 5).
- Declined, the Agents bullets of the step 3 `/writing` agents: a matter of the closing step, outside this brief.
- Dictated lines added after the check, each held against the rules file and the standards: the four labels of D2 are the page's own words; the refusal name "No facts" is a label (prose standard, 0, "Headings are labels, not sentences"); the agent section names "Sentence agent", "Section agent", "Whole-draft agent", "Checking agent" are labels. Each holds.
