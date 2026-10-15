Everything in the brief is done.

The token total of one `/writing` run (the 300,000-token cap of item 4) is not measured here: the brief assigns that run to after landing, and the builder did not run `/writing`.

## Open items of the state file

Verbatim, `.scratch/3-the-writing-base/orchestrator-state.md` line 47, under "Open items":

- none.

## The cases' first run

The first run was made on the tree at 235e36f before any file changed. `prose_facts.py` does not exist there: `git ls-tree --name-only 235e36f skills/writing/templates/` prints only `skills/writing/templates/docx_paragraphs.py`. I ran these commands on the unchanged tree, from the worktree root, with `PS=skills/repo-setup/templates/docs/dev/prose-standard.md`: the NWO XS `.docx` run (cases 1 to 3), the `.txt` of case 4 with the unmodified prose standard, the engineering `main.tex` (cases 5 and 6), the medicine `main.tex` (case 7), the call with no argument and the call with a `/tmp/x.pdf` (case 11). Each printed the same line and exited 2 (the interpreter's own exit for a missing script file), as printed:

```
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-4/skills/writing/templates/prose_facts.py': [Errno 2] No such file or directory
exit 2
```

Cases 4 (modified prose-standard copies), 8, 9, 10 and the missing-`\input` call of case 11 call the same absent script; I did not run each of them on the unchanged tree, and the `ls-tree` line above is the evidence that each fails the same way. `docx_paragraphs.py` on the NWO XS application on the unchanged tree: `python3 skills/writing/templates/docx_paragraphs.py "$NWO" | wc -l -w -c` printed `      55    2715   18059`, the brief's premise.

The text cases, read on the unchanged tree:

- Case 12 (`SKILL.md` against `docs/dev/skill-layout.md`, and the three lists): the old `SKILL.md` followed the layout and held no rule list at all, so no rule of the three pages stood in a list of an agent.
- Case 13, `git grep -n -i -E 'review agent|one fresh agent|one agent' 235e36f -- skills/writing README.md docs/academic-coverage.md .agents/plan.yaml` printed these lines that say `writing` has one review agent: `.agents/plan.yaml:10`, `README.md:26`, `docs/academic-coverage.md:101`, `skills/writing/SKILL.md:3`, `:10`, `:63`, `:74` and `:143`. The same grep over the whole tree outside `.scratch`, `docs/adr` and `docs/roadmap.md` printed 31 lines (`| wc -l`).

Cases the brief's own rules got wrong: none. Every case below gave the result the brief states. One case input is worded loosely: case 4 says "easy" is added to section A's first list, and "easy" is already the first entry of that list. The case result holds on the unmodified list; to show that the script reads the list from the file it is given, I also added "mere" to the list (below).

### The cases after the change

Commands run from the worktree root. `NWO` is `/Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`, `PS` the prose standard, `S=skills/writing/templates/prose_facts.py`, `T=/tmp/ordo-3-4`.

1. `python3 $S "$NWO" $PS > $T/nwo.out; echo "NWO exit $?"` printed `NWO exit 0`. `grep -c '^paragraph [0-9]*: [0-9]* sentences' $T/nwo.out` printed `55`; the first line is `paragraph 1: 1 sentences, 2 words` and the last `paragraph 55: 4 sentences, 47 words`. The awk sum of the words column of `## Paragraphs` printed `sum of words 2659`. Met.
2. In the same output, `grep -n -A1 '^## Listed words\|^## Contractions' $T/nwo.out` printed `245:## Listed words`, `246-none`, `248:## Contractions`, `249-none`. Met.
3. `grep 'paragraph 38 s3' $T/nwo.out` printed `paragraph 38 s3: 82 words`. Met.
4. A copy of the prose standard (`$T/std-mod.md`) with "mere" added to the first list and " delve," removed from the third, and `$T/words.txt` holding `This is easy. We delve into it.`: `python3 $S $T/words.txt $T/std-mod.md` printed under `## Listed words` the line `words.txt:1 s1: "easy" (Banned as filler)` and none for "delve". On the unmodified standard the same file printed `words.txt:1 s1: "easy" (Banned as filler)` and `words.txt:1 s2: "delve" (Flagged, not banned)`. With `$T/words2.txt` holding `This is easy. We delve into it. It is mere luck.` and the modified copy: `words2.txt:1 s1: "easy" (Banned as filler)` and `words2.txt:1 s3: "mere" (Banned as filler)`. A copy without the "Flagged, not banned" line (`grep -v '^Flagged, not banned'`): `error: /tmp/ordo-3-4/std-noflag.md: the "Flagged, not banned" list is not in section A`, `exit 1`. Met.
5. `python3 $S .scratch/3-the-writing-base/cases/engineering/main.tex $PS`: `## Runs of equal length` printed `sections.tex:81 s1 to sections.tex:83 s2: 5 sentences of 7 words` and nothing else. `## Semicolons` printed `6 semicolons in 2698 words, 2.22 per 1000 words` and `sections.tex:215: 6`. `## Non-ASCII` printed `sections.tex:177: U+2014 EM DASH`, `sections.tex:179: U+2013 EN DASH`, `sections.tex:203: U+201C LEFT DOUBLE QUOTATION MARK`, `sections.tex:203: U+201D RIGHT DOUBLE QUOTATION MARK`, `sections.tex:205: U+2026 HORIZONTAL ELLIPSIS`, `sections.tex:211: U+2192 RIGHTWARDS ARROW`. `## Contractions` printed `sections.tex:63 s1: "didn't"` and nothing else. Met.
6. Same run. `grep -n 'section{Implementation}\|begin{enumerate}\|end{enumerate}'` on `sections.tex` printed lines 1, 231, 236, 242 and 247; the paragraph lines of the output near them are `sections.tex:229: 1 sentences, 6 words`, `sections.tex:232: 4 sentences, 28 words`, `sections.tex:238: 2 sentences, 28 words`, so none of those lines is a paragraph. `sections.tex:265: 1 sentences, 16 words` and `sections.tex:265 s1: 16 words` (lines 265 to 266 are one paragraph at 265). `sections.tex:232 s1: 7 words`, `s2: 8 words`, `s3: 7 words`, `s4: 6 words` (four `\item` sentences). `sections.tex:270 s1: 9 words` and `sections.tex:270 s2: 11 words` (split before `\textbf`). `main.tex:11: 1 sentences, 9 words` for the `\noindent Keywords: ...` line (`\noindent` is no word). `main.tex:8: 3 sentences, 49 words` for the abstract paragraph at its text line 8. Met.
7. `python3 $S .scratch/3-the-writing-base/cases/medicine/main.tex $PS`: `main.tex:39: 2 sentences, 18 words`, `main.tex:39 s1: 11 words`, `main.tex:39 s2: 7 words`. The source line 39 is `Early mobilization reduced 30-day readmission from 25 percent to 15 percent. The relative risk (RR) was 0.60 (95% CI [0.41, 0.87], p = .004). One readmission was avoided for every ten patients mobilized early.` The second sentence stops at `(95` (7 words) and the rest after the `%` is not counted. Met.
8. `grep 'paragraph 28 s2' $T/nwo.out` printed `paragraph 28 s2: 33 words`, the whole "We hypothesise ... before diagnosis." sentence as one. `$T/sent.txt` holding `Smith et al. (2019) measured it.` and `The p value was 0.05. It held.` (blank line between): `sent.txt:1: 1 sentences, 6 words` and `sent.txt:3: 2 sentences, 7 words`. Met.
9. `$T/doc.md` with a `#` heading, a fenced block holding a blank line and `more code. Next.`, and two paragraphs: `doc.md:3: 1 sentences, 7 words` and `doc.md:12: 2 sentences, 6 words`; the heading and the block are no paragraph. Met.
10. `$T/self.tex` (`\input{self}`): `self.tex:1: 2 sentences, 6 words`, listed once. `$T/up.tex` (`\input{../ordo-3-4-other/part}`): paragraph lines `up.tex:1: 1 sentences, 3 words` and `../ordo-3-4-other/part.tex:1: 1 sentences, 3 words`. `"$T/a draft.txt"` passed as one argument: `a draft.txt:1: 1 sentences, 3 words`. Met.
11. `python3 $S` printed `usage: prose_facts.py <draft> <prose standard>`, `exit 2`. `python3 $S $T/x.pdf $PS` printed `error: /tmp/ordo-3-4/x.pdf: extension ".pdf" is not .tex, .md, .txt or .docx`, `exit 1`. `$T/miss.tex` (`\input{nothere}`) printed `error: /tmp/ordo-3-4/nothere.tex: No such file or directory`, `exit 1`. Met.
12. `skills/writing/SKILL.md` read against `docs/dev/skill-layout.md`: the sections stand in the layout's order (Quick start, Use instead, What it reads, Steps, reference sections, Stops, Anti-patterns, Rules); `grep -n '^## ' skills/writing/SKILL.md` printed lines 12, 19, 27, 47, 87, 107, 131, 181, 208, 226, 245, 254, 268 and 275. Each rule bullet and heading of the three pages stands once: `grep -c '^- Prose standard, section' skills/writing/SKILL.md` printed `37`, and per section `0: 8`, `A: 3`, `B: 4`, `C: 3`, `D: 7`, `E: 8`, `F: 4`, equal to the page's counts (bullets of 0, B, D, E, F; paragraphs of A and C). A loop over the 23 `###` headings of `references/rules.md` printed `1 |` for each, `Flagged terms / Alternatives` being the one in "Rules given to no agent". `grep -c '^- \`references/registers.md\`,' skills/writing/SKILL.md` printed `5`. Met.
13. `git grep -n -i -E 'review agent|one fresh agent|one agent' -- . ':(exclude).scratch' ':(exclude)docs/adr' ':(exclude)docs/roadmap.md'` prints 23 lines; they are `.agents/plan.yaml:10`, `agents/ordo-*.md:3` and `:6`, `docs/academic-coverage.md:101`, `docs/glossary.md:44` and `:104`, `skills/plan/templates/orchestrator-state.md:14` and `:26`, `skills/plan/templates/plan.yaml:12` and `:27`, `skills/repo-setup/templates/plan-terms.md:39` and `:99` (the lines now say "review agents", or "a review agent of `writing`" on line 6 of each `agents/ordo-*.md`), and `skills/plan-orchestration/templates/plan_cost.py:425`, `skills/plan/templates/plan.md:25`, `skills/spec/SKILL.md:385`, which are about other agents. No line says `writing` has one review agent. Met.

## DONE / NOT DONE

| Item | Command and output | State |
|---|---|---|
| 1. `skills/writing/templates/prose_facts.py` | Cases 1 to 11 above; `wc -l` prints 465; `LC_ALL=C grep -n '[^ -~]'` over it prints nothing | DONE |
| 2. `skills/writing/SKILL.md` rewritten | Cases 12 and 13; `wc -l` prints 280; description length `710` by the layout's command | DONE |
| 3. Agents and rule lists | Case 12 counts: 37 prose standard bullets, 23 `rules.md` bullets plus the one in "Rules given to no agent", 5 `registers.md` bullets | DONE |
| 4. The cost | Levers in the prompts: "Agent prompts" gives each finding agent its own rules only; "Finding agent prompt" and "Checking agent" end on "The final message lists the findings ... and nothing else" and "Work from this prompt alone". The facts of the NWO XS application are 6539 bytes. The token total is not measured | DONE for the levers; total not measured, assigned to the run after landing |
| 5. Pages that name the one agent | Case 13 output; `git diff --numstat` lists the files; `docs/dev/scripts.md` has the `prose_facts.py` row after the `docx_paragraphs.py` row | DONE |
| 6. `cases/` skip removed | `git grep -n 'cases/' -- . ':(exclude).scratch'` prints nothing; `git diff docs/dev/change-standard.md` shows the blob back at `d16b088`, the one before step 2 | DONE |
| Verify 1: sync_rules test | `PASS: sync_rules.py scratch tests` | DONE |
| Verify 1: glossary | `ok: the plan-terms block equals the template`, `glossary exit 0` | DONE |
| Verify 1: check_config test | `PASS: check_config.py scratch tests` | DONE |
| Verify 1: character-set check over the 17 files | prints nothing, `charset exit 0` | DONE |
| Verify 2: every case again | Cases 1 to 13 above | DONE |
| Verify 3: facts size | `python3 $S "$NWO" $PS \| wc -c` printed `    6539` | DONE (under 20,000) |
| Verify 4: list items and sentences read | "Departures from the standards pages" below | DONE |

Tests that touch skill folders ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The rules file's test rule calls for no test of `prose_facts.py`, as the brief says, so none was written. Rule 13 asks for a test only where the change adds a tested behaviour, so the table of rule 13 is empty.

## The terms

- **effort agent** (entry changed): "the review agent of `writing`" became "the review agents of `writing`" in `plan-terms.md` and the synced block; "Stated in" `writing`, Steps 4 and 5 became Steps 4 and 6. `grep -n 'effort agent\|ordo-<reviewer_effort>' skills/writing/SKILL.md` prints line 62 (Steps 4, "the effort agent `ordo-<reviewer_effort>`") and line 70 (Steps 6, `ordo-<reviewer_effort>`).
- **finding** (entry changed): "Stated in" `writing`, "Review agent prompt" became `writing`, "Finding agent prompt" and "Checking agent". `grep -n 'finding' skills/writing/SKILL.md` has hits in both sections (lines 121, 124 and 126 under "Finding agent prompt", which starts at line 107; lines 230 to 240 under "Checking agent", which starts at line 226), and the shape (place, quoted passage, rule with what it asks for, no replacement) is at lines 121 to 126. Read against the entry: the entry's "for `/writing`, a passage of a draft that breaks a named rule" fits the agents' findings.
- **reviewer** (entry changed): "the review agent of `writing`" became "the review agents of `writing`"; "Stated in" `writing`, Steps 5 became Steps 6, where line 70 says "the model `reviewer` names".
- **completion notice** (used in a new place): `SKILL.md` Steps 10 (line 84) gives the four agents' tokens "from their completion notices". The entry reads "what the runner reports when an agent ends, its final message and its tokens, tool uses and time", which is the sense used. Its "Stated in" does not list `writing`; I did not change it, since item 5 names three entries only (see the judgment calls).
- **refusal** and **stop** (used in a new row): the "No facts" row of "Stops" is a refusal, "a skill's end without a decision for the user", and the model row stays the one stop. **runner**, **session**, **step** are used in the senses of their entries.
- The four agent names get no entry, as the brief's decision 6 says; the glossary entries say "the review agents of `writing`".

## Files, with line counts

`wc -l` after the change, and `git diff --numstat` (added, removed) for the changed ones:

- `skills/writing/templates/prose_facts.py`: 465 lines, new.
- `skills/writing/SKILL.md`: 280 lines (was 143), 187 added, 50 removed.
- `.agents/plan.yaml`: 16, 1 and 1 (line 10).
- `agents/ordo-low.md`, `ordo-medium.md`, `ordo-high.md`, `ordo-xhigh.md`, `ordo-max.md`: 6 each, 2 and 2 each (lines 3 and 6).
- `skills/plan/templates/plan.yaml`: 30, 2 and 2 (lines 12 and 27).
- `skills/plan/templates/orchestrator-state.md`: 69, 2 and 2 (lines 14 and 26).
- `skills/repo-setup/templates/plan-terms.md`: 134, 3 and 3 (lines 39, 41, 99).
- `docs/glossary.md`: 151, 3 and 3 (lines 44, 46, 104), written by `sync_rules.py . --write --only glossary`.
- `README.md`: 194, 1 and 1 (line 26).
- `docs/academic-coverage.md`: 235, 1 and 1 (line 101).
- `docs/dev/scripts.md`: 33, 1 and 0 (the new row, line 24).
- `docs/dev/building.md`: 33, 1 and 3 (line 11 and the deleted paragraph).
- `docs/dev/change-standard.md`: 87, 1 and 1 (line 75).
- `.scratch/3-the-writing-base/agents/reviews/4-report.md`: this report.

`git status --short` shows only these paths changed, plus `?? skills/writing/templates/prose_facts.py`.

## Judgment calls the brief left open

1. A listed-word line prints the word as the draft writes it (`"Easy"` for a capitalised hit), with the list's name after it; the brief's form `"<word>"` does not say which spelling.
2. `## Paragraphs` and `## Sentences` print `none` when the draft has no paragraph, like the other sections.
3. A run of lines that holds no word (a `---` line in Markdown, a line of `$$`) is no paragraph. This keeps `W` at 0 only when there is no paragraph at all, and then the rate prints `0.00` (a count of 0 over 0 words).
4. A `.txt` file follows the `.md` rules for headings and fences, since the brief names both for the paragraph rule. A heading line and a fence line end a run, as a markup line does in a `.tex`.
5. The extension is compared in lower case (`.DOCX` is read) and is checked before the file is opened.
6. An error for a missing `\input` file names the file by the absolute path the name resolves to; a place in an included file is named from the main file's folder with `os.path.relpath`, so `../ordo-3-4-other/part.tex` appears as that.
7. A `.tex` text reads only the constructs the brief lists, plus the three escapes `\$`, `\{` and `\}`, which would otherwise read as math or as group delimiters. A `\cite`, `\ref`, `\eqref`, `\autoref` or `\cref` with its argument becomes the one word `ref`, and inline math becomes the one word `math`. Other constructs (an optional argument such as `\cite[p. 3]{a}`, `\\`, display math, `\begin{...}` in the middle of a line) are not read specially; none occurs in the case files.
8. The registers: the brief gives the sentence agent "Register, Terminology and Voice of the draft's register" and the section agent "What the reader looks for, of the draft's register". Choosing one register is a judgment about the draft, which the session does not make, so the lists say "under each register" and the session copies the four registers' text; the common bullets already tell the agent to apply the register of the draft's discipline.
9. The opening paragraph of `references/rules.md` (its four sentences) is in none of the brief's lists, and case 12 requires every part of the three pages to be placed. I put it in "Rules given to no agent", with the reason that the bullets of "Finding agent prompt" give its statements: the prose standard holds, the marker rule, and naming a finding by group and heading. This adds one bullet to the brief's sentence.
10. `SKILL.md` section names: "Agent prompts" (what each prompt holds), "Finding agent prompt" (the bullets of the three finding agents), the four agent sections, and "Rules given to no agent". The brief names the four agent sections only. The 300,000-token figure is not written in `SKILL.md`, since no run has measured it.
11. The old Rules bullet "One agent reads the whole draft in a run" is replaced by "Every agent gets the whole draft's text, since a rule that spans sections is lost between agents that each read one section", which keeps the old reason for the design now in force. Two further Rules bullets state the session's part and the one-list placement (ADR 0013's Consequences).
12. The old bullet "A rule the draft keeps has no group and no line in the report" is not in the brief's replaced list, so it stays, in the checking agent's bullets.
13. `docs/academic-coverage.md:101` now reads "`skills/writing/SKILL.md` gives its review agents the rules of that standard", which says what the four agents do with the standard.
14. The `completion notice` entry's "Stated in" is unchanged (rule 20).

## User-visible changes, before and after

- `/writing`: before, one agent read the draft, ran `grep` and `docx_paragraphs.py` itself and wrote the report. After, the session runs `prose_facts.py` (and `docx_paragraphs.py` for a `.docx`), starts the sentence, section and whole-draft agents at once, then the checking agent, and shows the checking agent's report followed by one line with the four agents' tokens and their sum. A script error is the new refusal "No facts".
- Description (`SKILL.md:3`) before: "Review the prose of a draft with one fresh agent that changes nothing. The agent reads a whole .tex file ..."; after: "Review the prose of a draft with a script and four fresh agents that change nothing. The script computes the counts and word lists that have one right answer. The agents read a whole .tex file ... each checking its own rules." Length 710.
- `README.md:26`: "with one fresh agent that changes nothing" became "with a script and four fresh agents that change nothing".
- `.agents/plan.yaml:10`, `skills/plan/templates/plan.yaml:12` and `:27`, `skills/plan/templates/orchestrator-state.md:14` and `:26`: "the review agent of /writing" became "the review agents of /writing".
- `agents/ordo-*.md` line 3: "`writing` for its review agent" became "`writing` for its review agents"; line 6: "or the review agent of `writing`" became "or a review agent of `writing`".
- `docs/dev/building.md:11` and `docs/dev/change-standard.md:75`: the character-set command lost the `case ... esac` skip of `cases/` folders; `docs/dev/building.md` lost the paragraph that began "The files under the `cases/` folder". The command in the worktree finds the case files' characters until the session deletes `.scratch/3-the-writing-base/cases/` on main.
- `docs/dev/scripts.md`: a "User scripts" row for `prose_facts.py`.

## Departures from the standards pages (Verify 4)

Lists follow "one rule per bullet" with these departures, each in the form the dictated text or the page's own label needs:

- `SKILL.md` line 10, the opening paragraph: three sentences, 60 words in all; it states what the skill does and leaves behind, as the layout's row 1 asks.
- Steps 7, lines 73 to 74 (30 and 35 words): the stop condition names the configured model by a cross-reference to the `refute` skill and the stop by its row of "Stops"; the old Steps 6 had the same two references in the same bullet.
- Steps 8, line 77 (31 words): one action, starting the fourth agent as Steps 6 does, then reading its id as Steps 7 does; both references replace repeating those steps.
- "Agent prompts", line 92 (34 words): the `.tex`, `.md` and `.txt` form of the draft's text needs the `cat -n` form and the path base in one bullet, since they describe one piece.
- "Finding agent prompt", lines 118, 121, 122, 123 (27 to 30 words): bullets dictated by the brief, or kept from the old prompt (line 118 is the old bullet on the (manuscripts and grants) marker); each states one rule with its condition, as the layout asks.
- "Checking agent", line 230 (27 words): the condition and the correction it allows are one rule.
- The rule bullets of the three agent sections are labels, not sentences. `Prose standard, section D: Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.` holds two sentences because that is the page's own label of one bullet; `Prose standard, section D: Binary contrast ("not X, Y") at most twice per page` holds the page's own quotation marks.
- The pages the lists name use "section 0" to "section F" and the `rules.md` and `registers.md` `Group / Heading` form, as the pages and their findings name rules.
- `Done when` is on every step; the new Steps 5 to 10 each end with it.
- `prose_facts.py` prints `1 sentences` for a one-sentence paragraph, the literal form of the brief.

## Anything in the brief that was wrong or impossible

- Case 4 words "easy" as added to the first list; it is already there (`prose-standard.md`, section A, first list: "easy, simple, quick, ..."). The case result holds on the unmodified list.
- The brief's state-file note holds that the verify list differs from `docs/dev/building.md` after the change and `/land` rewrites it. The state file's line 68 ("over every file the diff touches outside a ledger's `cases/` folder") also still names the `cases/` folder; it is the orchestrator's text, and I did not touch it.
- `docs/roadmap.md:24` and `:25` still say `/writing` has one fresh agent; the brief assigns them to `/roadmap`, so they remain.
- The brief's figures held: 55 paragraph lines, 2,659 words, 82 words in paragraph 38's third sentence, and 6,539 bytes of facts for the NWO XS application.
