# Step 1 brief check (on main at f8cd6ea)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `/Users/axelfaes/workspace/ordo/.scratch/8-grant/agents/briefs/1.md`. `git rev-parse --short HEAD` printed `f8cd6ea`. Nothing was written or changed. Pages are cited by section; code and grep hits keep `file:line`.

## 1. Names

Command for each name: `grep -rnI --exclude-dir=.git --exclude-dir=.scratch -e '<name>' .` (and `grep -rnIw ... -e 'grant'`), run from the repository root.

- `check_limits`, `check_sections`, `grant.svg`, `grant-config`, `grant-runs`, `criteria-review.md`, `config-draft`, `funder_config_template`, `criteria_review_template`, `config_drafter`, `criteria_reviewer`, `config drafter`, `criteria reviewer`, `nineteen`, `4.1.3`: no hit anywhere outside `.scratch/`.
- `4.1.2`: `skills/academic/paper/SKILL.md:5` only, inside the paths.
- `eighteen`: `README.md:32` and `README.md:165` only, inside the paths. `ls -d skills/*/*/ | wc -l` printed `18`, so "nineteen" is right after the step.
- `funder config`, outside the paths: `docs/roadmap.md:26` (entry 8's goal), `docs/adr/0044-...md:1,7,11`, `docs/adr/README.md:53`. None made false.
- `criteria review`, outside the paths: `docs/roadmap.md:26,27`. Not made false.
- `form-fields`, outside the paths: `docs/adr/0044-...md:7`, which names `research-hub/funding/2026-fwo-senior-transplant/admin/form-fields.md` as the file where FWO's character limits stand. Not made false, but see finding 1.
- `fwo-postdoc`: `docs/roadmap.md:27` (the gate's folder name). Not made false.
- `grant` as a word, outside the paths:
  - `docs/roadmap.md:23,26,27` (entry 8, open until the closing) and `:114` (`submit-grant`, dropped): not false.
  - `docs/adr/0001-...md:7`, `0003-...md:7,11`, `0019-...md:20`, `0021-...md:20`, `0022`, `0023-...md:21`, `0025`, `0027`: context or consequence lines that name `grant` as a later writing skill. None made false.
  - `skills/academic/writing/SKILL.md:23` (`| The findings of a grant are to be applied | \`grant\` |`): becomes true. `:110`, `:243` and `references/rules.md:3` ("manuscripts and grants"): not false.
  - `skills/academic/paper/SKILL.md:121` (`revision-coach` trigger "grant panel response", scope "grant-panel") and `skills/academic/paper/references/mode_selection_guide.md:187,330`: see finding 2.
  - `skills/academic/paper/references/funding_statement_guide.md`, `credit_authorship_guide.md:73`, `agents/intake_agent.md:190,192,287`, `templates/funding_statement_template.md`: the common noun. Not false.
- Other places that list the skills: `grep -rlI -e 'referee' .` outside the three academic skill folders printed `README.md`, `docs/glossary.md`, `docs/roadmap.md`, `docs/adr/0043`, `docs/adr/0020`, `docs/figures/gen_figures.py`, `docs/figures/referee.svg`, `docs/figures/paper/revision.svg`, `docs/figures/paper/lifecycle.svg`, `docs/dev/scripts.md`, `docs/dev/building.md`. The skill lists among them are all in the brief's paths. `grep -n 'eighteen\|18 \|academic/' utils/*.sh utils/*.test.sh` printed nothing.

Findings:

1. `form-fields.md`: the brief's Decision 2 takes this file name for a new format (one `## <field>` heading per field, the text under it counted). The user's existing files of that name have another format. `sed -n '1,30p' research-hub/funding/2026-fwo-senior-transplant/proposal/proposal/form-fields.md` shows `## 1. General` as a group heading, each field as `### 1.1 English title`, a quoted question, a line `Limit 240. Measured: 126 characters.`, and the field's text between `<!--F:title_en-->` and `<!--/F-->`. Under the brief's rule `check_limits.py` finds the file, finds no `## English title` heading, and prints `not checked:` for every field; a field whose name did equal a `##` heading would be counted with the question and the "Limit" line in it. The brief's own test value (126 characters against 240) comes from this file.
2. `skills/academic/paper/SKILL.md:121` keeps "grant panel response" as a trigger of `/paper revision-coach`, and `/grant revise` takes "a panel's feedback" as its comments. The new "Use instead" row sends a grant application to revise to `grant`, in the same file, and the brief says "No other line of the file changes". The line is not made false; the same request is then pointed two ways (change standard, rule 19).

## 2. The step line

- `skills/academic/grant/` with its `SKILL.md` in the skill layout: "The files of the skill" 1.
- five modes (`config`, `draft`, `revise`, `review`, `check`): "The behaviour", one block per mode.
- its own pages, the config drafter: "The files of the skill" 2. The criteria reviewer: 3. The config's format: 4 and "The funder config". One filled FWO example: 6.
- its own pages, the intake: no page. The brief gives the intake of `draft` to the `paper` skill's intake agent and the intake of `config` to the session (Decision 7), as D8 lists the intake among `paper`'s roles.
- the two check scripts with their tests: "The files of the skill" 7, "The two scripts", and the tests under "Cases".
- `paper`'s roles started from the `paper` skill's pages: "Every mode" 2, 5, 6, 7 and the `draft` items.
- listed in README: "The places that list a skill" 1. Glossary: 8. The dev pages: 4 and 5. The scripts page: 6. The verification page: 4. Its figure: 2 and 3.
- the two scripts' tests pass: "Verify before you report" 1.
- a reviewer reads `SKILL.md` and the pages against each ruling, and both folders for a copy: the reviewer's part; the last two read cases serve it.
- the verify list of `docs/dev/building.md` passes: "Verify" 1, the whole list at landing.

Rulings read against "What to build": D1, D2, D3, D5, D6, D7, D11, D13, D14, D15, D16, D17, D20, D21, D22 and the shapes bullet are carried out. D9, D18, D19 and the call-documents bullet concern step 2.

Findings:

1. The step line's "its own pages ... the intake" has no requirement as a page of `grant`. The step line and D8 differ; the brief follows D8 and says so only as Decision 7.
2. D12 says "with `paper` unchanged". "The places that list a skill" 7 changes `skills/academic/paper/SKILL.md` (a "Use instead" row and the version). No part of the step line names that file.
3. D4 says `paper`'s format-convert makes the `.docx` where a funder wants Word. `draft` item 6 makes it "only when the user asked for it at the intake", and `draft` item 1 lists what the intake asks without it (section, materials, `.bib`, writing review). Item 6 also has the formatter make the `.docx`; no mode but `draft` makes one.
4. D10 has one script read "each section's length against the config". A section whose limit is in pages gets `not checked:` (Decision 3). The brief states it as a decision; it is the ruling carried out in part.
5. D8 names four stops (the intake, the config confirmed, the outline, the `/writing` findings). The brief's Stops table adds three: the mode, a config that exists, which config.
6. D5 and D16 ("as `paper` does") for `revise`: `revise` runs the writing review "as item 7 of `draft` says", and item 7 runs "when the intake kept it". `revise` has no intake and no stop that asks, and the Stops table lists the intake "of `config` and of `draft`" only.
7. D8's citation compliance role: `draft` item 4 says it "checks the cited sentences against the `.bib`, as in `paper`". `grep -n 'Claim check' skills/academic/paper/agents/citation_compliance_agent.md` shows the role reads the rows Claim check, Earlier papers, Claims not to make and others from `config.md` (line 417), and `agents/intake_agent.md:253-255` shows the intake agent asks Closing review, Claim check and Incremental checks. The brief has the intake agent ask four things only and does not say what those rows hold in a `grant` run, or whether the check against each source's text runs.

## 3. Premises

- No skill `grant`: `ls skills/academic/` printed `paper`, `paper-review-panel`, `referee`, `writing`. Matches.
- `sed -n '5p' skills/academic/paper/SKILL.md` printed `  version: "4.1.2"`. `sed -n '64,72p'`: heading on 64, rows for `paper-review-panel`, `referee`, `researcher`, `writing` on 68 to 71. Matches.
- `sed -n '160p;166p'`: line 160 "Every role starts as a fresh agent on the runner's general-purpose agent with the runner's defaults. The prompt sets no model and no effort.", under Steps 4; line 166 "The run folder is `paper-runs/<mode>-<date>/` in the parent of the manuscript's folder.", under Steps 5. Matches.
- `grep -n '^## ' skills/academic/paper/SKILL.md` printed `770:## Agent prompts`; the table there has twelve rows. Matches.
- `grep -n 'Step 7' skills/academic/paper/agents/intake_agent.md` printed `139:### Step 7: Word Count`; `grep -n 'section_words' .../structure_architect_agent.md` printed `193:  -> section_words = round(total_word_count x section_percentage)`. Matches.
- `ls skills/academic/paper/templates/*.py` printed five scripts, `anchorize_tex.py` and `apply_tex_patch.py` among them. The command does not show the tests; `ls ...*.test.sh` shows both. Matches in substance.
- `grep -n "skill's \`agents/" skills/academic/referee/SKILL.md` printed lines 69 and 75; line 69 holds the quoted words. "What it reads" 1 holds the refusal. Matches.
- `sed -n '23p' skills/academic/writing/SKILL.md` printed `| The findings of a grant are to be applied | \`grant\` |`. Matches.
- `grep -n 'referee' README.md docs/dev/building.md docs/dev/scripts.md docs/figures/gen_figures.py`: README 30, 32, 72, 80, 127, 154 as the brief says (also 88, a `paper` figure line, no list); `building.md:37`; `scripts.md:9`; `gen_figures.py:12`, `:1918`, `:2211`. `grep -n 'eighteen' README.md` printed 32 and 165. Matches.
- Test commands: `grep -n 'sh \|python3 \|git ls' docs/dev/building.md` printed lines 6 to 17; 6 to 16 are the tests and the glossary check, 17 the ASCII check. `docs/dev/scripts.md` "Test scripts" rows stand on 36 to 45. Matches.
- `grep -n 'criteria review\*\*\|funder config\*\*' docs/glossary.md` printed 148 and 151, with the "Stated in" the brief gives. Matches.
- ADR 0044's Decision, read whole: equal to the brief's quotation, word for word. ADR 0023, 0030, 0043 Decision 2: as the brief describes.
- FWO sources: `pdfinfo` printed `Pages: 4`; `pdftotext -layout` shows `v. 2027` on each page and the criteria 1.a, 1.b, 2.a, 2.b and 3. `sed -n '1,14p' .../proposal/proposal/main.tex`: line 4 "Four top-level headings are fixed verbatim by the FWO template. Maximum 10 pages including references."; line 10 "FWO PROJECT OUTLINE template, page 19: Carlito 11 under LaTeX, line spacing 1, margins 2.5 cm."

Findings:

1. The scale. The brief says each criterion is "on a scale from 0 to 6 with a descriptor per level". `pdftotext -layout .../postdoc-preselection-scoring-grids.pdf - | grep -n '^ *0 \+1 \+2\|Unacceptable'` printed, on each of the four pages, `0 1 2 3 4 5 6 7` and under it `Unacceptable Weak Fair/Reasonable Good/Very good Excellent/Outstanding`: eight numbers, 0 to 7, and five labels.
2. The second FWO source does not give what the example needs. `main.tex` is an application for the "FWO Senior Postdoctoral Fellowship 2026" (line 1), and the example is named for the postdoctoral fellowship of call year 2027. Line 4 gives the 10-page limit with no page of a call document. Lines 4 and 10 name no section heading; the headings stand on lines 82, 120, 148 and 264 (`grep -n '\\section' main.tex`), outside the lines the brief names. So the example cannot give "the document's name and page" for the limit (ADR 0044: "each fact with the page of the call it came from"), its only source for the limit and the layout is an application file ("no text of an application", "never by a path of another repository"), and its "Sections" table has no source for a heading.
3. The brief says the test scripts end with `PASS: <script> scratch tests` "as the other test scripts of the repository do", with `anchorize_tex.test.sh` as the model. `tail -5 skills/academic/paper/templates/anchorize_tex.test.sh` shows `PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block ...`: the model's PASS line names the behaviour proved. `docs/dev/building.md` asks only for a last line starting with `PASS:`.

## 4. Cases and checks

- The nine tests of `check_sections.py` and the nine of `check_limits.py`: consistent with the change standard's rule 13 (each is run first on the unchanged tree, the commented heading carries its control) and with "Scripts compute facts; judgment is read" (each is a count or a comparison).
- The eleven cases read in the skill's text: consistent; each is read in files the step writes.
- The three bullets on the first run and the hand-back: consistent with rules 1, 13 and 4.

Findings:

1. The case "A config path and a `.tex` path that hold a space" stands under `check_limits.py` only. `check_sections.py` takes the same two paths, and the `<pdf>` path with the log beside it is a third supplied path (change standard, rule 15). `ls research-hub/funding/2024-fwo-postdoc-fbttr/fwo-postdoc/` shows `main copy.pdf` and `main-old (1).pdf`.
2. Rule 15 makes each place where a supplied value reaches a path or printed text a case. The brief says the arguments are "treated as untrusted" and gives no expected result for a heading of the config or the `.tex` that reaches a printed line, or for an `\input` path that leaves the folder of `<main.tex>`.
3. No case asks the builder to check, quote or explain a place the step does not change.

## 5. The question

- Tests of `check_sections.py` and `check_limits.py`: no for the cases stated, each asserts a line and an exit status on a scratch input; the inputs they leave out are under 6.
- Read cases 1, 2, 4 (refusals and the replace stop), 5 (the outline and the criteria), 6 (`none`), 7 and 8 (`review`), 9 (`check`), 10 (no copy), 11 (no funder's facts): no, each is a sentence the reviewer finds or does not find in the skill; whether a run behaves so is step 2's.
- Read case 3 (no page limit stated): no.
- The step line's check: no, as the plan answers it, with the exceptions below.
- "Verify" 1 to 5 and 7: no; each prints a fact of the files.

Findings (each could pass without the goal being reached):

1. "Verify" 6 runs `check_sections.py` on the shipped example with "a scratch .tex with the example's required headings". With no source for a heading (3, finding 2) the example's "Sections" table can hold no required row, and the command then exits 0 on any `.tex`.
2. `draft` items 5 and 6: the compile and the two scripts run before the formatter applies the config's "Layout" (font, size, spacing, margins), which changes the page count. When the intake did not keep the writing review, nothing compiles or checks again, and item 8 reports the page count of the PDF before the layout.
3. "Every mode" 6 gives each role "the prompt pieces the `paper` skill's 'Agent prompts' gives a start". Those pieces hold the paths of `config.md`, of the prose standard and `references/manuscript-prose-standard.md`, and for the draft writer the writing rules and the registers page (`sed -n '770,813p' skills/academic/paper/SKILL.md`). The brief has no step that finds the prose standard, no refusal when the `writing` or `repo-setup` folder is missing (`paper`'s "What it reads" 1 has both), and no `config.md` in `revise`, which has no intake. A reviewer can find item 6 carried out in words while a `revise` run has no `config.md` to name.
4. `revise`'s writing review and the rows the citation compliance agent reads: 2, findings 6 and 7.
5. The `.docx`: 2, finding 3.
6. The words counted (Decision 5): the test "the comment's words and the command's name are not counted" passes while the argument of every command is counted as words: a cite key, a label, a file path of `\includegraphics`, an environment's name, and the TikZ code of a brought-in figure file (`main.tex:112` of the 2026 application reads `\input{figs/fig-concept}`). The count the user is told is then higher than the funder's.
7. Whether the heading's own words count toward its section is not stated ("the text from the section's heading to the next top-level heading"), so the test "a section of 120 words" has no fixed count.
8. "The application's folder" is not defined for `revise`, `review` and `check`, which are given `<main.tex>`; the config's folder and the run folder's place rest on it.
9. `check` and `draft` item 5 state no result for a compile that fails or a runner without `latexmk`; `check_limits.py` then has no PDF and no log.

## 6. Implied inputs

Listed under "Cases": a commented heading; a heading in a brought-in file; case and spacing; a heading the config does not name; no "Sections" table; a missing brought-in file; the page count at and over the limit; a section over and under a word limit; a comment and a command in counted text; a form field under and over; no `form-fields.md`; a section limit in pages; a bad Unit and a bad Limit; no log; paths with a space.

Findings (each missing, and it has happened or a wrong answer costs):

1. `\input{name}` with no extension. Happened: `research-hub/funding/2026-fwo-senior-transplant/proposal/proposal/main.tex:112` and `:224` read `\input{figs/fig-concept}` and `\input{figs/fig-timeline}`; the files are `figs/fig-concept.tex` and `figs/fig-timeline.tex`. Expected: `name.tex` is read. A wrong answer exits 2 on every application split into files.
2. An `\input` on a commented line. Happened: `figs/fig-timeline.tex:5` reads `% Include with: \input{figs/fig-timeline}`, and `fig-concept.tex:8` and `fig-wp-overview.tex:6` the same for themselves. Expected: not followed. A wrong answer reads the file into itself without end.
3. An escaped percent sign in a section's text. Happened: `grep -c '\\%' research-hub/funding/2024-fwo-postdoc-fbttr/fwo-postdoc/main.tex` printed `6` (lines 104, 106, 110 among them). Expected: `\%` starts no comment, and the words after it on the line are counted. A wrong answer undercounts and passes a section that is over.
4. A section with `\subsection` and `\subsubsection` headings. Happened: the 2024 `main.tex` lines 54, 72, 117. Expected: they are no top-level heading, print no line in `check_sections.py`, and their text counts in the section that holds them. A wrong answer ends the count early and passes a section that is over.
5. A section whose text stands partly in a brought-in file, for `check_limits.py`. "What to build" states it; no case does. Expected: the brought-in text is counted. A wrong answer undercounts.
6. A heading that is not required and absent. Happened: the 2024 `main.tex:48` holds `\section{Changes to previous project proposal}`, which the 2026 application lacks. Expected: `absent, not required: <heading>`, exit 0. The line is dictated and has no case; a wrong answer fails a complete application.
7. The row `(whole document)` with a limit in words or characters. "What to build" states it; no case does. Expected: `ok:` or `over:` with the count of the document body. A wrong answer passes an application over its limit.
8. A required section with a word limit that the `.tex` lacks, and a form field whose heading `form-fields.md` lacks. Both are named reasons of `not checked:` with no case. Expected: `not checked:` with the reason, and no failure.
9. A `form-fields.md` in the format of the user's existing files (1, finding 1). Happened. Expected: `not checked:` for each field, never a count that takes in the question and the "Limit" line.
10. The log's page line in its other forms. `grep -n 'Output written' .../proposal/proposal/main.log` printed `988:Output written on main.pdf (10 pages, 279574 bytes).` TeX writes `(1 page,` for one page and breaks a log line at 79 characters, so a long output path can split the line. Expected: the count read, or exit 2 with the `error:` line, never another number. A wrong number passes an application over its page limit.

## 7. ADRs

Every record `0001` to `0044` in `docs/adr/` was read for its status line and its Decision (`awk` over each file; `0015` does not exist).

- 0044 (proposed): touches. The step is under its whole Decision, "`grant` ships the format of a funder config and one filled example, and holds no funder's facts. ..." Named in the brief.
- 0023 (in force except the parts 0029, 0031 and 0043 supersede): touches through D5 and D16. "Full mode and revision mode invoke `/writing` on the manuscript through the Skill tool after the compile, and the final message shows its numbered report." Named.
- 0031 (in force except its sentence on what a reply starts): touches through D5. "Intake asks in full and revision mode whether the run ends with the `/writing` review, default yes." Named only inside the ADR 0023 bullet.
- 0030 (in force in "`paper` and `writing` read no `plan.yaml`"): named.
- 0043 (proposed): touches in Decision 2, "`skills/academic/paper/SKILL.md` is academic-paper's `SKILL.md`, each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text." Named.
- 0001 (in force except the `standards` key): touches. Its context names `grant` among the writing skills, and its Decision reads "`/writing` and the skills that read the writing base read the prose standard where it is". Not named.
- 0002 (in force except for a manuscript): touches. "The prose standard holds for every text the writing skills write or review." Not named.
- 0026 (proposed): touches. "The prose of a manuscript is the text of a paper, its abstract, its statements and its cover letter. It is held to the prose standard ... with the differences `skills/academic/writing/references/manuscript-prose-standard.md` lists." A `grant` run gives each role the manuscript prose standard through the prompt pieces, and `/writing` reads a `.tex` as a manuscript (`skills/academic/writing/SKILL.md`, "What it reads" 1). Not named.
- 0029 (in force in the check of the cited sentences of each later patch) and 0024, 0033, 0034 (the citation compliance agent's reading): they decide for `paper`'s modes; they bear on the step only through "as in `paper`" (2, finding 7). Not named.
- 0020 (the run folder of `paper`), 0035 and 0036 (the agents of `paper` and `writing`): they decide for `paper`; D17 has `grant` do the same. Not touched as decisions.
- 0003, 0016, 0018, 0019, 0021, 0022, 0025, 0027 in its superseded parts, 0028, 0037, 0041: superseded. 0004 to 0014, 0017, 0032, 0038 to 0042: do not touch the step.

Findings:

1. ADRs 0001, 0002 and 0026 touch the step and "What is on the tree" names none of them. "What to build" does not say which prose standard a grant application's text is held to, and has no step that finds it (5, finding 3).
2. ADR 0044: "each fact with the page of the call it came from". The example's page limit, layout and headings have no call document among the two sources (3, finding 2). The brief's rule would have them written from an application's comment lines.
3. No part of the brief contradicts ADR 0023, 0030, 0031 or 0043 Decision 2.

## 8. Dictated text

Each located with `grep -nF -- '<text>' .scratch/8-grant/agents/briefs/1.md`; the number is the brief's line.

- `name: grant`, `metadata.version: "1.0.0"` (40): holds.
- "not stated in the documents given" (49, 123, 203): holds.
- "Call", "Sections", "Form fields", "Layout", "Criteria" (58): holds; each is a label.
- `Heading, Required, Limit, Unit, Source` (60); `yes` or `no` (62); `pages`, `words` or `characters` (64); `(whole document)` (65); `Field, Limit, Unit, Source` (67); `Criterion, Descriptors, Source` (69): hold.
- `ok: <heading>`, `missing: <heading>`, `out of order: <heading>`, `absent, not required: <heading>` (82); `not in the config: <heading>` (83); `error: <what is wrong>` (85, 100): hold.
- `ok: <name>: <count> <unit> of <limit>`, `over: <name>: <count> <unit> of <limit>`, `not checked: <name>: <reason>` (97): hold.
- `PASS: <script> scratch tests` (102), `PASS: check_sections.py scratch tests` (300), `PASS: check_limits.py scratch tests` (301): hold against `docs/dev/building.md` (a last line starting with `PASS:`).
- The stop names "The config" (124), "The intake" (129), "The outline" (130), "The writing findings" (135): hold.
- "not scored: the files given hold nothing on it" (144): holds.
- `"4.1.3"` (168) and "nineteen skills" (158): hold; `docs/dev/skill-layout.md`, "Frontmatter", gives the patch part for a change of wording, and the skill count after the step is 19.
- File names `config-draft.md` (123), `criteria-review.md` (143), `form-fields.md` (96): hold as text; the format behind `form-fields.md` is finding 1 of check 1.

Findings: none.

## Declined to judge

- Whether D12's "with `paper` unchanged" allows a "Use instead" row and a patch version: the user's ruling.
- Whether a section limit in pages left as `not checked:` meets D10, and whether the three added stops are within D8: the orchestrator's or the user's call.
- Whether Decision 5's definition of a word is the right one for a funder's limit: a design choice; the fact it rests on is finding 6 of check 5.
- Whether a grant application is a manuscript in the sense of ADR 0026: the user's call; the record's words name a paper.
- The text of the scoring descriptors and the level each label covers in the FWO grid: read only as far as the header rows `pdftotext` printed.
- Whether `python3 docs/figures/gen_figures.py` leaves every other figure file byte-identical ("Verify" 2): not run, since it writes files.
- The `.scratch/archive/` hits of the word `grant`: counted by file only (`grep -rnIwc`), not read line by line; they are closed ledgers.

Agent usage: af4851eb920202757, claude-fable-5-2, 220228 tokens, 25 tool uses, 6.8 minutes.

## Closed

Each finding is closed by a change to the brief, on 2026-11-23, unless it says otherwise.

- 1.1, 6.9: the form fields are read between the markers `<!--F:<field>-->` and `<!--/F-->`, the form of the user's existing files ("The two scripts", Decision 2, the cases).
- 1.2, 2.2: no file under `skills/academic/paper/` is changed, as D12 says; the row and the version change are taken out of "The places that list a skill", the paths and the checks, and `grant`'s "Use instead" names `/paper revision-coach` for a panel's comments to parse.
- 2.1: the intake has its page `references/intake.md` (files 6, Decision 13).
- 2.3, 5.5: the intake of `draft` and of `revise` asks whether the funder wants a `.docx`, and the formatter makes it last.
- 2.4: kept as Decision 3, and named to the user in the session's report: a section's limit in pages is read by the user on the PDF.
- 2.5: kept: the three added stops are a question the run cannot go on without, and D8 names the stops of a drafting run.
- 2.6: `revise` asks at its own intake whether the run ends with the writing review, default yes, as ADR 0031 has it.
- 2.7, 5.3, 5.4, 7.1: `references/intake.md` names every row of `config.md` the roles of `paper` read; "What it reads" finds the prose standard and names the `writing` and `repo-setup` folders with their refusals; `revise` writes `config.md`; ADRs 0001, 0002, 0026 and 0031 are named under "What is on the tree" (Decision 11).
- 3.1: the brief names the scale as the grid prints it, 0 to 6 under five labels; `pdftotext -layout` of the grid, lines 9 and 10, prints the seven numbers 0 to 6.
- 3.2, 5.1, 7.2: the example's second source is page 21 of the funder's application form of the 2024 submission, which prints the limit and the form's four headings; the layout reads "not stated in the documents given"; "Verify" 6 runs on the three required headings and on one taken out (file 7, Decision 12).
- 3.3: a test ends with a last line that starts with `PASS:` and names what was proved.
- 4.1, 4.2: a path with a space is a case of both scripts and of the PDF path; a heading with a line break is printed on one line.
- 5.2: the formatter applies the layout before the compile and the scripts.
- 5.6, 5.7: the definition of the counted text names the commands removed with their arguments, the `tikzpicture` environment, and that the heading's own words are not counted.
- 5.8: the application's folder is defined in "Every mode" 3.
- 5.9: a compile that fails is handled as the `paper` skill's Steps on the compile say, and the scripts are not run.
- 6.1 to 6.8, 6.10: each is a case under "Cases" with its rule under "The two scripts".

