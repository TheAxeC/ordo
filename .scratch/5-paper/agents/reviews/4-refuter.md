# Step 4 refuter report (on .agents/worktrees/5-paper-4, base 95aa872916493c7b541aacd3f9f43e0a50b8f945)

Findings name their place as file:line in code and in skill pages. For a standards page, a spec or a ruling they name the page and section. Every command below was run by the reviewer in this session, from the worktree root unless the line says another place. Nothing in the worktree or in research-hub was changed. Running the two figure scripts rewrote the SVGs, but `shasum` was equal before and after and `git status --short` did not change.

The report is plain ASCII. A character outside printable ASCII in a quoted line would be written by its name in angle brackets. No secret value appears.

## Verification (rerun by the reviewer)

```
$ sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
$ sh skills/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/paper/templates/lookup.test.sh 2>&1 | tail -1
PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, reads the keys a .tex cites with the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, and refuses the one-argument check-urls and the two-argument quote-check
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template            (exit 0)
$ printf '%s\0' <the 57 existing paths of "Paths this step writes", the patterns expanded> | xargs -0 perl -CSD -ne '<the brief's character-set check>'
(no output, exit 0)
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md                           (exit 0)
$ python3 docs/figures/gen_figures.py
wrote 12 files: pipeline.svg 22045, plan-loop.svg 21392, grill.svg 6919, writing.svg 6010, code-comments.svg 6554, paper/full.svg 16947, paper/revision.svg 16437, paper/lit-review.svg 7596, paper/outline-only.svg 7177, paper/abstract-only.svg 4234, paper/citation-check.svg 7493, paper/disclosure.svg 4808 bytes (exit 0)
$ python3 docs/figures/academic-paper-comparison/gen_comparison.py
wrote 16 files (exit 0)
$ ruff format --check docs/figures/gen_figures.py docs/figures/academic-paper-comparison/gen_comparison.py
2 files already formatted                               (exit 0)
$ ruff check docs/figures/gen_figures.py docs/figures/academic-paper-comparison/gen_comparison.py
All checks passed!                                      (exit 0)
$ (copy of gen_figures.py in the scratchpad, run from another directory) and both worktree scripts run from another directory
exit 0; writes only beside the script; nothing written in the cwd; each SVG: LC_ALL=C grep -c '[^ -~]' prints 0
$ python3 -c '<skill-layout.md description count>' on skills/paper/SKILL.md
931 {'version': '2.0.0'}
$ grep -rn -i -E '<C3 pattern>' skills/paper ; grep -rn 'RAISE' skills/paper
skills/paper/SKILL.md:36:| The integrity check of a finished manuscript's references, claims, numbers and figures, and its ethics check | `researcher` |
(RAISE: no output)
$ grep -n 'The findings to apply' skills/paper/SKILL.md ; grep -n -i 'up to 3 times\|at most 3 times' skills/paper/SKILL.md skills/paper/references/intake.md
(no output)
$ grep -n -i 'null result\|null-result\|null finding\|negative result' skills/paper/SKILL.md skills/paper/references/*.md
(no output)
$ grep -n -E 'references/(integrity-verification|ethics|abstract|structure-architect|argument-builder)\.md' docs/academic-coverage.md | grep -v f9a00ab
(no output)
$ grep -c 'rebuild: researcher' docs/academic-coverage.md
11
$ grep -n -i 'integrity\|ethics\|abstract agent\|structure architect\|argument builder\|figures in parallel\|findings to apply' docs/glossary.md
(no output)
$ grep -rn -E '<item 22 pattern>' skills --include='*.md' | grep -v '^skills/paper/'
(no output)
$ grep -n -i 'integrity record' skills/paper/templates/lookup.py skills/paper/templates/lookup.test.sh
(no output, exit 1)
$ for each academic-paper-comparison link in docs/academic-coverage.md: test -f docs/<link>
16 distinct links, none missing
$ git diff 95aa872 -U0 -- docs/dev/building.md docs/dev/scripts.md
@@ -35 +35 @@ (building.md, one line)   @@ -9 +9,2 @@ (scripts.md, under "## Development scripts")
$ git status --short
every changed or new path is in "Paths this step writes" (ADR 0023 unchanged)
$ rsvg-convert -w 1400 -b white <svg> -o scratchpad/refute4/<name>.png  (paper/full, paper/revision, paper/citation-check, paper/lit-review, grill, writing, code-comments, plan-loop, pipeline, and comparison citation-check-detailed, full-simple, academic-pipeline, academic-paper-only-modes, revision-detailed), each PNG read
```

## Verdicts

Items of "What to build":

1. holds
2. violated (Behaviour B1)
3. holds
4. holds
5. violated (Behaviour B2, B4)
6. holds
7. holds
8. holds
9. holds
10. holds
11. violated (Behaviour B3)
12. violated (Behaviour B2)
13. holds
14. holds
15. violated (Spec S1, Standards T1)
16. holds
17. holds
18. violated (Spec S3, Standards T5)
19. violated (Spec S4, Standards T4)
20. violated (Spec S2)
21. holds
22. holds
23. holds

Cases:

- C1 met
- C2 met
- C3 met
- C4 met
- C5 met
- C6 met
- C7 met
- C8 met
- C9 met
- C10 partial (B1)
- C11 met
- C12 met
- C13 partial (S1, P1)
- C14 met
- C15 partial (S3)
- C16 partial (S4)
- C17 met
- C18 met
- C19 partial (S2, P2)
- C20 met: read in the code. `FlowLayout` raises `FigureError` naming the figure, the box key and the label (gen_figures.py:408-411). `figures()` is evaluated inside the `try` of `main()` (gen_figures.py:1703-1707, gen_comparison.py:1369-1373), which prints `error: ...` and returns 1 before `write_figures` writes anything.
- C21 met
- C22 met
- C23 met
- C24 met. The quoting holds; the separate compile defect is under B2.
- C25 met
- C26 partial (B3)
- C27 met
- C28 met

## 1. Spec

S1. Item 15: the Stops table's lead does not state the rule from "The stops of paper".
- Place: skills/paper/SKILL.md:391, "## Stops".
- Hunk: "The first thirteen rows are stops, decisions for the user. They leave no open item, since this skill is not a plan skill. The rows after them are refusals, which name their cause and leave nothing."
- What is wrong: item 15 asks that "The Stops table's lead says the same" as the rule (a run stops only at its mode's stops, other choices are taken with the goal's option and recorded under "Decisions", the user's choices are never taken that way). The lead counts the rows and says nothing of the rule. Rules (435-438) state it.
- Failure scenario: someone who reads only the Stops table, as a stop is looked up, finds no line saying that a choice outside the table is taken with the goal's option and written to `config.md`. A role's question then reads as one more reason to stop the run.
- Verdict: item 15 violated, C13 partial.

S2. Item 20 and C19: two boxes of `citation-check-detailed.svg` are drawn indigo where the spec draws them grey.
- Place: docs/figures/academic-paper-comparison/gen_comparison.py:804 and :806.
- Hunk: `N("RC", "Script: cite-keys, check-urls, quote-check [D50, D22]", "ruled"),` and `N("RC2", "Script: the three checks again, failures left named [L]", "ruled"),`
- What is wrong: the spec's "paper, as ruled" citation-check view draws `RC[...]:::script` and `RC2[...]:::script`, which are grey script boxes. The rendered PNG (scratchpad/refute4/cmp-citation-check-detailed.png) shows both as indigo ruled boxes. Every other box of the 7 paper figures and the 16 comparison figures matches its spec node, kind and edge (read function by function against the spec's mermaid text).
- Failure scenario: a reader of the comparison figure takes the two script runs for steps a ruling changed. The legend says indigo means "differs from academic-paper by your ruling" and grey means a script. The figure's own key then misreads two boxes.
- Verdict: item 20 violated, C19 partial.

S3. Item 18: rows 65 and 195 are read as rows holding only citation-check rules, against the brief's premise, and this is not handed back.
- Place: docs/academic-coverage.md:119 (base row 65, `examples/clinical_citation_verification_checklist.md`) and :249 (base row 195, `agents/source_verification_agent.md`).
- Hunks:
  - Row 119: "The paper skill's citation-check mode takes it, minus the safety note, held in `skills/paper/references/citation-compliance.md` and `skills/paper/SKILL.md`."
  - Row 249: "... sends an unconfirmed reference to the user and removes a fabricated one. The paper skill takes these with ..."
- What is wrong: the brief's "What is on the tree" says "Rows 65, 152 and 195 hold rules citation-check keeps beside rules of the integrity check of a whole manuscript". Item 18 asks that such a row "names the part that goes to `researcher`". Only row 206 (base 152) names one. The builder's C15 reading ("Row 119 ... and row 249 ... hold only rules that citation-check keeps", report line 531) contradicts the premise, but "What the brief got wrong" does not list it. The source file of row 249 holds sections such as "2. Author Credibility", "3. Methodological Scrutiny" and "Conflict of Interest Framework" (`grep -n '^#' deep-research/agents/source_verification_agent.md`). Row 249 names none of them: not taken, not dropped, not sent to `researcher`.
- Failure scenario: when `researcher` (entry 13) is built from the rows marked for it, the author-credibility, methodology and conflict-of-interest checks of the source verifier appear in no row. They are lost without a ruling.
- Verdict: item 18 violated, C15 partial.

S4. Item 19: ADR 0025's Decision names the user's review of the sources for a full run only.
- Place: docs/adr/0025-*.md, "## Decision", the strategist bullet (line 13).
- Hunk: "the literature strategist, which runs by default and is skipped only when the user says so at intake or takes an earlier lit-review or outline-only run's outputs, and whose sources the user reviews before the run goes on"
- What is wrong: item 19 asks that the decision carry J, "the user's review of its sources in full, outline-only and lit-review". The Decision is scoped to "A full run" (line 11). Outline-only and lit-review appear only in the Context.
- Failure scenario: a later ADR that supersedes or follows 0025 reads the Decision as the record. It finds no decision that outline-only and lit-review stop for the sources' review, though SKILL.md raises it in both (SKILL.md outline-only item 2 and lit-review).
- Verdict: item 19 violated, C16 partial.

S5. The builder wrote and used a script that no ruling approves.
- Place: builder report, `.scratch/5-paper/agents/reviews/4-report.md`, C19.
- Hunk: "$ python3 <scratch>/c19.py   (each box label of the spec, in the simple and detailed views and in the last two sections, looked up in the text of the svg that draws it ...)"
- What is wrong: the brief's "Paths this step writes" says "No script is written for this step, by the builder ... other than a script the step builds under 'What to build'. Any other script needs the user's approval ..., quoted from a line of `plan.md`'s Rulings." The report quotes no such approval. Its output is the evidence for C19, and that check compared labels and stop or dashed tags only, so it did not see S2.
- Failure scenario: a script output stands in for the box-by-box reading C19 asks for, and a kind mismatch (S2) passes as met.
- Verdict: none of the item verdicts; it bears on C19 (partial) through P2.

S6. The report's deviation table is narrower than the brief's report part.
- Place: builder report, "## Deviations from academic-paper 3.2.0, per mode", lead at line 1489.
- Hunk: "A place the spec draws as a plain box (no tag) is as academic-paper does it and is not listed."
- What is wrong: the brief's Report asks "for each mode, each place the built skill differs from academic-paper 3.2.0, with the ruling", and says "a difference with no ruling is not built and is named here as handed back". The fresh comparison's list (`4-deviations.md`, "No ruling") names differences the builder neither lists nor hands back. Checked as leads:
  - DF6/DO7: planner.md:174 "the session returns it to the user", where the source sends the section back to the strategist. This text is carried from base structure-architect.md:170.
  - DC7: citation-compliance.md:293 "The lookups show a retraction only when the record of an index says so", where the source cross-checks Retraction Watch.
  - DC8: self-plagiarism screening. Base citation-compliance.md:94 sent it to the removed integrity page, and no paper page holds it now.
  - Not checked one by one: DF7, DF18, DR11, DR14, DS7, DX2, DX19, DX30, DL4 (PART or NO RULING in that list).
  - The builder hands back six subjects only.
- Failure scenario: the user rules on the six handed-back subjects and believes every unruled difference has been raised. The retraction detection, the self-plagiarism screen and the planner's literature gap stay as built with no ruling.
- Verdict: the report part; no numbered item.

## 2. Proof

P1. The C13 claim about the Stops lead does not reproduce.
- Place: builder report line 478.
- Hunk: "the Stops table's lead (391) says the same of the first thirteen rows."
- What is wrong: `sed -n 391p skills/paper/SKILL.md` prints the row-count sentence quoted in S1, which does not state the rule. C13 is marked met on this claim.
- Verdict: C13 partial.

P2. The C19 claim that each figure was read box by box against the spec rests on a scratch script, not a reading.
- Place: builder report, C19 "Reading", line 105 of that section.
- What is wrong: the reading checks labels and the agent, maybe and stop tags. It does not check the script or ruled kind, and S2 shows two boxes of the wrong kind.
- Verdict: C19 partial.

## 3. Standards

T1. Rule 19 (no two statements contradict each other): the "one case" of a second message is contradicted by Steps 10.
- Places: skills/paper/SKILL.md:440, :147; references/literature-strategist.md, "The sources' review".
- Hunks:
  - SKILL.md:440: "The literature strategist and the visualization agent are each started once as a fresh agent and then resumed by a second message. That is the one case in which an agent receives a second message."
  - SKILL.md:147: "The literature strategist and the visualization agent are resumed with the rejection instead."
  - literature-strategist.md: "A rejected patch is answered the same way: the session resumes the agent".
- What is wrong: in full mode the strategist can be resumed once for the sources' review and again for a rejected patch, which is a third message. In revision a rejected patch resumes an agent that had no second-task resumption. Rules says the second message is the one case. The brief's item 15 names that case.
- Failure scenario: a session that follows Rules starts the strategist fresh after a rejection. It loses the search context that Steps 10 means to keep, and it adds an agent start that the cost table does not count.
- Verdict: item 15 violated.

T2. Rule 14 (a head comment lists every error): two errors the code raises are not listed.
- Place: docs/figures/gen_figures.py:33-46 (the errors list) against :417 and :426-429. gen_comparison.py:28-35 points to "the way gen_figures.py names them".
- Hunks: `raise FigureError(f"{self.figure}: two boxes share a key")` and `raise FigureError(f"{self.figure}: the edge {edge.src!r} to {edge.dst!r} has the style {edge.style!r}")`.
- What is wrong: neither error is in the head comment's list.
- Failure scenario: a maintainer who adds a box with a duplicate key gets an error the comment does not describe.
- Verdict: none (items 20 and 22 hold on the main lists); a standards defect to fix.

T3. History in a code comment, against the brief's Conventions ("no ... plan steps in ... a code comment").
- Place: docs/figures/academic-paper-comparison/gen_comparison.py:17-19.
- Hunk: "taken from the files of academic-paper 3.2.0 and academic-pipeline in research-hub, from skills/paper and from the rulings of the plan of the step that wrote it."
- What is wrong: the comment names the step that wrote the file.
- Verdict: none; a standards defect to fix.

T4. Glossary term misused: "findings" for role and script output.
- Place: docs/adr/0025-*.md:31, "## Consequences".
- Hunk: "the draft writer makes at most three passes driven by other roles' or scripts' findings."
- What is wrong: the brief's Conventions and SKILL.md Rules ("Role agents report issues, and the word 'finding' is kept for what `/writing` reports") reserve "finding" for `/writing`.
- Verdict: item 19 violated (with S4).

T5. A sentence the diff makes false.
- Place: docs/academic-coverage.md:249.
- Hunk: "sends an unconfirmed reference to the user and removes a fabricated one. The paper skill takes these with ..."
- What is wrong: the row now names `citation-compliance.md` as the holder. That page and SKILL.md raise the stop "A reference that cannot be confirmed" and remove nothing, so "takes these" is false for the removal.
- Failure scenario: a reader of the coverage list believes citation-check deletes fabricated references.
- Verdict: item 18 violated (with S3).

T6. Rule 19, minor: the command list of the citation compliance prompt disagrees with its page.
- Places: skills/paper/SKILL.md:388 against references/citation-compliance.md:10.
- Hunks:
  - SKILL.md:388 (Agent prompts, Citation compliance row): "the commands `resolve`, `search`, `fetch` and `quote-check`"
  - citation-compliance.md:10: "The agent runs `lookup.py resolve`, `search`, `fetch`, `bibtex` and `quote-check`."
- What is wrong: the retraction replacement (citation-compliance.md:295) needs `bibtex`. SKILL.md:378 lists `bibtex` among the commands role agents run, so the conflict is only with the row.
- Verdict: none; a fix at landing.

## 4. Behaviour

B1. The plain request: "Requests that fit two modes" cannot be reached for three of its four rows.
- Place: skills/paper/references/modes.md:7-8, :18, :42-44.
- Hunks:
  - modes.md:7-8: "compares the request with the rows of the three tables below, in this order: 'Request kinds', 'Requests for a mode this skill does not have', 'Requests that fit two modes'. ... The first row whose kind the request fits decides."
  - Row 18: "A paper improved or revised, such as 'improve my paper', 'revise section 3' ...".
  - Rows 42-44: "Help me write an outline", "Help me with my revision", "Help me search for literature".
- What is wrong: each of these requests fits an earlier "Request kinds" row (outline-only, revision, lit-review), and line 10 says "a different wording of a listed kind fits that kind". By the stated order the first row decides, so the stop "The mode to run" is never raised for them. Item 2 asks that "a request that fits two modes is asked about before intake".
- Before and after: before, `/paper help me with my revision` was "Unknown mode". After, it picks revision silently, though modes.md:43 says it asks between revision and `rebuttal`.
- Verdict: item 2 violated, C10 partial.

B2. Revision's compile runs a file name that may not exist.
- Place: skills/paper/SKILL.md:165, Steps 11.
- Hunk: "Compile in full and revision in a copy. Copy the manuscript's folder to `compile/` in the temporary folder and run `latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex` there".
- What is wrong: in revision the main `.tex` is the `<main.tex>` argument, any name (Quick start :17), and Steps 11 itself quotes it as `'<main.tex>'` at :155. At the base the literal `main.tex` was used in full mode only, where the draft writer writes that name.
- Failure scenario: `/paper revision manuscript/paper.tex comments.md` compiles `main.tex`, which latexmk cannot find, so the compile fails. The draft writer is started for a `compile-fix` it cannot make, and the final message names a compile failure that the manuscript does not have. If the folder also holds an unrelated `main.tex`, that other file is compiled.
- Verdict: items 5 and 12 violated.

B3. With no model identifier, the gap path cannot be reached.
- Place: skills/paper/SKILL.md:97 against :125.
- Hunks:
  - SKILL.md:97: "A model list that gives no identifier for the alias leaves the identifier a gap: the AI disclosure then carries `[GAP: model identifier]`, and the final message lists it."
  - SKILL.md:125: "A served model that differs from the identifier of Steps 4 is the stop 'A model other than the configured one'."
- What is wrong: with a gap there is no identifier to compare. Any served model "differs", so the first agent start stops the run, and the disclosure with the gap is never written. The other reading, that nothing is compared, leaves D47's check off for the whole run. No item asks for the gap path (item 11 has the identifier read and compared).
- Verdict: item 11 violated, C26 partial.

B4. Revision's figure-script permission lets the agent write files that no page names.
- Places: skills/paper/references/visualization.md:12 and :3; skills/paper/SKILL.md:291 and :385.
- Hunks:
  - visualization.md:12: "the permission intake gave: the project's figure script edited and run, or a copy of it in the run folder."
  - visualization.md:3: "It writes the scripts and the images in `figures/` of the run folder ... It changes no other manuscript file."
  - SKILL.md:385 (Writes column): "`figures/`, `figures.md`, the patch with the id `figures`".
- What is wrong: under "edited and run", the agent edits a project file outside the run folder. That file's own outputs land wherever it writes them, such as the manuscript's figure files, outside the `cp -n` copy of SKILL.md:292 and outside the patch route of Rules ("written once"). No page says where those outputs go, and :3 and the Writes column contradict the permission (rule 19).
- Failure scenario: the check run's answer "figures changed by editing and running `code/experiments/figures.py`" lets that script overwrite `manuscript/figures/*.pdf` in place. The images then change with no patch, no `cp -n` and no record in `figures.md`'s "Names".
- Verdict: item 5 violated.

## Declined to judge

- Commands from the builder's report that use git commands outside the three allowed were not run:
  - `git diff HEAD -U0 -- docs/dev/building.md` (report line 1124). The reviewer ran `git diff 95aa872 -U0 -- docs/dev/building.md docs/dev/scripts.md` in its place.
  - `git status --short --untracked-files=all` (1126).
  - `git diff HEAD --name-only --diff-filter=AM` and `git ls-files -o --exclude-standard` (1476).
  - `git status --short --ignored` (3192).
- C23's run of the changed L6 check against a copy of the unchanged tree (`headx`) is asked for by the brief. Whether that run falls under the rule against reverting code to watch a test fail is for the orchestrator. The reviewer did not repeat it.
- Choices the brief dictates, which the deviations list marks as having no ruling, are the brief's and not the builder's:
  - "help me revise my paper" always picks revision (DX10, item 2).
  - The refusal "A manuscript that already exists" kept with the Z exception (DF26, item 10).
  - The rule on instructions inside a text (DX34, C25).
- The date "2026-10-20" and the open-item letters in the comparison legend (gen_comparison.py:77-78) come from the spec's own legend. The builder handed them back for a ruling.
- Whether the box "End: the report; your reply, optional" and the end boxes of `writing.svg` and `code-comments.svg`, drawn solid, read as agent starts under the legend: the spec draws the paper end box the same way, so the spec decides.
- The orchestrator's check run and the later fresh comparison are outside this review.
- Whether each PART or NO RULING row of `4-deviations.md` not checked under S6 is a real difference needs a ruling per row. It is named under S6 and not judged row by row here.

Reviewer usage: a72eb77449241ae96, claude-opus-5-5, 275856 tokens, 122 tool uses, 16.0 min.
