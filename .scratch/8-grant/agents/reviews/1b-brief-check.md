# Step 1b brief check (on main at 7a1ffeb)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/8-grant/agents/briefs/1b.md`. Nothing was edited or written. `git rev-parse --short HEAD` printed `7a1ffeb`; `git status --short` printed ` M .scratch/8-grant/orchestrator-state.md`, ` M .scratch/8-grant/plan.md`, `?? .scratch/8-grant/agents/briefs/1b.md`.

There are 35 findings. The ones that would make the built step fail or miss the goal are 1.1, 4.1, 4.2, 5.1, 5.2, 5.3, 6.1, 6.2, 7a.1, 7a.2, 7a.3, 7a.4 and 9.1.

## 1. Names

- `form-fields`, `<!--F`: `grep -rn --exclude-dir=.git --exclude-dir=.scratch -e 'form-fields' -e '<!--F' .` printed hits in `skills/academic/grant/SKILL.md:38,43,113`, `agents/config_drafter_agent.md:13,36,37`, `templates/funder_config_template.md:24`, `templates/check_limits.py:11,25,29,185,193,195,199`, `templates/check_limits.test.sh:2,136,139,153,159`, all inside the paths, and one outside: `docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md:7`, in the ADR's Context ("in characters for form fields (`research-hub/funding/2026-fwo-senior-transplant/admin/form-fields.md`)"). The change does not make it false: it describes a folder of the gate's application, not the skill.
- `grant-fields.md`, `field_texts_agent`, `section.tex`, "The form fields", "A file of form fields that exists": `grep -rn --exclude-dir=.git <name> . | grep -v 'briefs/1b.md'` printed nothing for each. No hit outside the paths.
- The Quick start lines: `grep -rn --exclude-dir=.git -e '/grant review' -e '/grant draft' -e '/grant config' -e '/grant check' -e '/grant revise' . | grep -v .scratch` printed, outside `skills/academic/grant/`, only `docs/glossary.md:151`, `docs/roadmap.md:26,27` and `docs/adr/0044-...md:11`, each naming `/grant config` in a sentence the change leaves true.
- `fit`: `grep -rnw 'fit' skills/academic README.md docs` printed no use as a patch id. The patch ids of `paper` (`grep -n 'with the id' skills/academic/paper/SKILL.md`) are `format-convert`, `format-convert-copy`, `abstract`, `figures`, `disclosure`, and `compile-fix`, `reference-fix`. No clash.
- The agents of `grant` named outside the skill: `grep -rn -e 'config drafter' -e 'criteria reviewer' . | grep -v skills/academic/grant` printed `README.md:31`, `README.md:73`, `docs/figures/gen_figures.py:2017`, `docs/figures/grant.svg:53,55`. All are in the paths. `README.md:73` ("`grant` a config drafter, a criteria reviewer and six roles of `paper`") becomes false with the field texts agent. The note of `grant()` (`gen_figures.py:2014-2018`: "The config mode starts the config drafter and shows you its draft to confirm", "The review mode starts the criteria reviewer", "The check mode starts no agent: it compiles") becomes incomplete: `config` gains an agent and two stops, `review` gains a compile.
- `check_limits`: `grep -n 'check_limits' docs/dev/scripts.md docs/dev/building.md` printed `scripts.md:26`, `scripts.md:46`, `building.md:14`. All in the paths; line 46 only maps the test to its script and stays true.

Findings:

1. The brief's item "The places that describe the changed behaviour" 3 says the figure is "changed only when a label of the figure is no longer true, such as a stop it draws". `docs/dev/building.md`, the paragraph on the figures (`sed -n '39p' docs/dev/building.md`), says "A change to a skill's Stops table, its sequence, its agents, its cycles or its name changes the labels in the script that draws it, which is then run again". The step changes the Stops table (two rows), the agents (one more) and the sequence (a compile before the draft, a compile in `review`). The brief's condition is narrower than the page's rule, and a builder following the brief can leave the figure's note unchanged.
2. `README.md:73` is made false by the field texts agent, and the brief's item 4 on `README.md` does not name it. The item covers it only through "where a sentence on `grant` is no longer true".
3. `docs/glossary.md` and `skills/academic/grant/templates/criteria_review_template.md` are in "Paths this step writes" and no item of "What to build" says what changes in them. For the template, its line "Files read: <each file read, the PDF among them when one was given>" is the likely place (item 3). For the glossary, `docs/dev/change-standard.md`, "The rules" 4, reserves a vocabulary for the user, so the brief has to say whether "form field" and "file of form-field texts" get entries, or that the glossary is not changed.

## 2. The step line

- (1) the compile runs with the engine the application itself uses: item 1.
- (2) `draft` compiles before it drafts and gives the structure architect and the draft writer the page count and the limit: items 2.1 to 2.3.
- (3) `review` is given the form-field texts and the further files, and reads the compiled PDF: item 3.
- (4) a reference list set by hand gives the citation style's default: item 4.
- (5) the closing message names a font that stands in: item 5.
- (6) a one-section `draft` has the citation check and the `/writing` review on that section only: item 6.
- (7) one file of form-field texts, which `draft` can write and `check_limits.py` counts, a user's file used as it is or copied by an agent, no file name or marker of one application: item 7.
- "the gaps of text the run agent listed closed": item 8, seven gaps.
- "the two scripts' tests pass with a case for each changed behaviour": "Cases" and "Verify before you report" 1.

Findings:

1. Item 2.4, the `fit` patch, serves no part of the line: the line's point (2) ends at giving the two roles the page count and the limit. The brief lists it as decision 7. It is new behaviour (a further writer pass and a further compile) taken in a brief, under a ruling that says "Step 1b makes the seven changes its line names".
2. Item 7.4's fourth argument serves no part of the line. See 4.2.
3. Point (4) is carried for `draft` only. `references/intake.md`, "revise", holds the row "Citation Format: The style of the `\bibliographystyle` line of the main `.tex`, or "none stated"" (`sed -n '83p' skills/academic/grant/references/intake.md`), and the brief leaves it. A `revise` run on an application with a list set by hand then writes "none stated".

## 3. Premises

- `metadata.version`: `sed -n '5p' skills/academic/grant/SKILL.md` printed `  version: "1.0.0"`. Matches.
- The sections: `grep -n '^## \|^### ' skills/academic/grant/SKILL.md` printed Quick start 12, Use instead 23, What it reads 32, Steps 49, config 103, draft 122, revise 176, review 198, check 208, Stops 217, Anti-patterns 236, Rules 248. Quick start on lines 14 to 21 and items 1 to 14 match.
- The engine: `grep -n 'engine' skills/academic/grant/SKILL.md` printed line 90 only, with "the engine and the flags the `paper` skill's Steps 11 gives the compile". `grep -n -A8 '### The engine of the compile' skills/academic/paper/references/latex_template_reference.md` printed the four rules in the brief's order, ending "XeLaTeX". Matches.
- The five files: `grep -rn -c 'form-fields.md' skills/academic/grant` printed `SKILL.md:3`, `config_drafter_agent.md:3`, `check_limits.test.sh:5`, `funder_config_template.md:1`, `check_limits.py:6`, and 0 for the six other files. Matches. `sed -n '174,200p'` of `check_limits.py` is `field_lines`, which reads `form-fields.md` beside the `.tex` and the markers. Matches.
- `grep -n 'check_limits' docs/dev/scripts.md docs/dev/building.md` printed `scripts.md:26`, `scripts.md:46`, `building.md:14`. The brief names lines 26 and 14, which are the two that describe the script.
- `sed -n '18p;42p' skills/academic/grant/SKILL.md` printed the `review` line with one argument and "What it reads" 9. Matches.
- `grep -n 'citation style' skills/academic/grant/references/intake.md` printed line 23 with the default the brief quotes. Matches.
- `sed -n '150,172p' skills/academic/grant/SKILL.md`: item 6 at line 150, item 9 at line 163. Matches.
- ADR 0044, 0023 and 0031: read. 0044 is "proposed"; 0023 is "proposed; superseded by 0029 ... 0031 ... 0043" in parts; 0031 is "proposed; superseded by 0043" in one sentence. The parts the brief relies on are in force.
- `CLAUDE.md`: `git check-ignore -v CLAUDE.md` printed `.gitignore:6:CLAUDE.md`. Not tracked, as the brief says, and its text is as the brief gives it.
- The two tests on main: `sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1` and the same for `check_sections.test.sh`, under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, each printed a line starting `PASS:`.

Findings:

1. "Cases" says "the three that used the marker file rewritten to the new file". `grep -n 'form-fields' skills/academic/grant/templates/check_limits.test.sh` shows two cases that write the file, L10 (line 139) and L12 (line 153). L13 (line 159) writes none.
2. The description has 10 characters of room: the frontmatter command of "Verify" 3 printed `grant 1014 1.0.0`. "Says that `draft` also writes a form field" cannot be added without cutting other words. The brief does not say so.
3. The brief cites ruling D12 for "no file under `skills/academic/paper/` or `skills/academic/writing/` is changed". D12 in `plan.md` names `paper` only.

## 4. Cases and checks

Each case was read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, the prose standard and the glossary. The ones not listed below are consistent.

Findings:

1. The case "A file `form-fields.md` beside the `.tex` holding a marker pair, and no `grant-fields.md`: `not checked:`" contradicts the case "`grep -rn 'form-fields\|<!--F' skills/academic/grant` prints nothing" and "Verify" 2. The test's fixture has to write a file named `form-fields.md` with `<!--F:`, both inside `check_limits.test.sh`, which the grep reads. It also contradicts point (7) of the step line, "no file name or marker of one application is in the skill". One of the two must go; the grep is the one the plan's line asks for.
2. Item 7.4's fourth argument breaks `docs/dev/change-standard.md`, "The rules" 11: "no member, parameter or file whose only user is a test or a hypothetical caller". Item 7.7 says no mode passes it, and decision 3 says "it serves a user who runs the script on a file elsewhere". Two cases and one error path exist only for it.
3. Two test cases pass on the unchanged tree, against the brief's "run once, where it fails" and against "The rules" 13, first bullet. "A fourth argument naming a file that does not exist: exit 2, one `error:` line": `python3 skills/academic/grant/templates/check_limits.py a b c d; echo "exit $?"` on main printed `error: usage: check_limits.py <config> <pdf> <main.tex>` and `exit 2`. "A config field with no `## ` heading in the file: `not checked:`, and no failure": main prints `not checked: <field>: no form-fields.md stands beside the .tex` and exits 0. Each fails on the unchanged tree only when the case asserts the reason's words, which the brief does not ask.
4. "Verify" 1's character-set check is looser than the repository's. The brief's class for a file that is no `.md` is `[^\x20-\x7E\n\t]`; `docs/dev/change-standard.md`, "Commands and their filters", and `docs/dev/building.md` have `[^\x20-\x7E\n]`, and `building.md` names a tab among what the check prints. A tab added by the step passes the brief's check and fails at landing. "The rules" 9: no check is loosened.
5. The report part "For each sentence of `SKILL.md` that names a section of `paper` or `writing`, that the section exists under that name" covers every such sentence of the file, the unchanged ones included. It asks the builder to check places the step does not change.
6. `metadata.version` 1.1.0 (item "The places" 1, decision 10, "Verify" 3) does not follow `docs/dev/skill-layout.md`, "Frontmatter". "A plan that changes a skill raises one part of its `metadata.version` once": this plan made the skill at 1.0.0 in step 1, and only a release candidate holds it, so one reading keeps 1.0.0. Under the other reading, a run that counted a form field between markers before now prints `not checked:`, which is "its output is changed or removed" under the same inputs, the major part. 1.1.0 fits neither reading without a ruling.
7. The stop name "A file of form fields that exists" uses a second term for the thing the brief's "Conventions" fix as "the file of form-field texts" (prose standard, D, "No synonym cycling").
8. Item 7.6 gives an argument that is both a heading and a Field to the stop "The mode". The Stops row of that name shows "The five modes and what each does" (`sed -n '223p' skills/academic/grant/SKILL.md`). The row's cells would then be false for this use; the ambiguity needs a row of its own or a changed row, and the brief names neither.

## 5. The question

Could it pass without the goal being reached, the goal being that the seven points work on a real application?

- Item 1 and its three read cases: yes, see finding 1.
- Item 2 and its three read cases: no for the gate's application. The counts come from a compile, and the cases fix the rows and the `fit` rule.
- Item 3 and its case: no, with the gap of finding 6.
- Item 4 and its case: yes, see finding 4.
- Item 5: yes, see finding 5.
- Item 6 and its case: yes, see finding 2.
- Item 7 and its cases: yes, see findings 3 and 7 and 9.1.
- Item 8: not judged against the run agent's list, see "Declined to judge". Each of the seven sentences can be checked by reading.
- The test cases of `check_limits.py`: no for the counts they state, with 4.1 and 4.3.
- "Verify" 1, 3, 4, 5, 6: checks of facts, they do not bear on the goal. "Verify" 2: no. "Verify" 7: it repeats the first test case and adds nothing.
- "Verify" 8: a reading, no.

Findings:

1. Item 1 can pass with the first run's wrong result still reached. A pdfLaTeX application that loads neither `inputenc` nor `fontenc` (current LaTeX needs neither), has no `% !TEX program` line and no log beside it falls to the last rule and compiles with XeLaTeX. A `grant` run copies the PDF and not the log beside the main `.tex`, so a later run meets the same rules. The gate's application is not such a case: `grep -n 'inputenc\|fontenc\|fontspec\|TEX program' .agents/gate-8/submitted/main.tex` printed `7:\usepackage[T1]{fontenc}` and `8:\usepackage[utf8]{inputenc}`, and `ls *.log` there found none, so the fourth rule gives pdfLaTeX.
2. Item 6.2 fails on a section that holds an `\input` line. `/writing` lists the files a `.tex` inputs and resolves each name against the main file's folder (`skills/academic/writing/SKILL.md`, Steps 3), and `prose_facts.py` does the same (`tex_files`, `os.path.join(folder, name)`). The copy `section.tex` stands in the run folder, so `\input{figs/x}` names a file that is not there, and `/writing` refuses ("A file that does not exist, an input or include file included, is a refusal"). The gate's application has such lines: `grep -n '\\input' .agents/gate-8/submitted/main.tex` printed `112:\input{figs/fig-concept}` and `224:\input{figs/fig-timeline}`, inside the sections that start on lines 82 and 148. Item 6.2 also assumes that the `\section` line stands in `main.tex`; a section whose heading stands in a brought-in file has no such line, though `check_sections.py` reads headings there.
3. Item 7.6's "The session runs `check_limits.py`" exits 2 with no line on standard output whenever the config's row `(whole document)` has a limit in pages, since the run makes no compile and the script then finds no log: `section_lines` calls `page_count(pdf)` before any field is read (`check_limits.py:158`, `:133`), and case L16 of the test proves the exit 2. The gate's config has that row. The field's count is then never printed, and "a field over its limit goes to the draft writer once more" never applies.
4. Item 4.2 never applies in the usual case of a list set by hand, an application with no `.bib`: `draft` item 6 says "A run with no `.bib` skips this item". With a `.bib` among the materials and the list set by hand, the new text cites `.bib` keys the list lacks, and the compile prints undefined citations; item 4.3 only reports them. Whether that meets point (4) is the orchestrator's reading; the line asks only for the default.
5. Item 5 can pass while a font stands in unreported. The formatter reports what it set; a font TeX replaces at compile (a log line on an undefined font shape) is seen by no role. Nothing in item 5 has the session read the compile's log for it.
6. Item 3.2 does not say what the reviewer is given when the compile fails or the runner has no `latexmk` and a PDF stands beside the main `.tex` ("What it reads" 9). "Reads the `.tex` alone" then drops a PDF the reviewer has today.
7. Item 7.5's `cmp` after `cp`, and item 6.2's `cmp` or `diff` of the `sed -n` copy against "those lines of `main.tex`", compare a copy with its own source by the same command. They pass whatever range was copied. What can go wrong is the range (a commented `% \section` line, `\section*`, the last section before `\end{document}`), and no check reads that.

## 6. Implied inputs

For `check_limits.py`, read against `read_text` of `check_sections.py` (UTF-8, universal newlines) and the format of item 7.2.

- A heading line `##Title` without a space: not listed. By the format it opens no field: the field prints `not checked:` and the line counts in the field before it. The result is visible; no case needed.
- A `### ` line inside a field's text: missing. Expected: it is text of the field and counts. A script that takes it for a heading cuts the count and accepts a field over its limit. It has happened: `grep -n '^#\|<!--' .agents/gate-8/submitted/form-fields.md` shows `## ` lines for groups and `### ` lines for fields.
- A `## ` line inside a fenced block: not listed. By the format it opens a field. A form field is plain text; no case needed, and the format should say that a fence means nothing.
- A Windows line ending: missing. Expected: a line break inside a field's text counts as one character. `read_text` opens with universal newlines, so it holds today; the test's `write` uses `newline=""`, so a case can state it. A count of two per break prints a false `over:`.
- An empty field, a heading with no text: missing. Expected by the brief's format: `ok: <field>: 0 <unit> of <limit>`. It will happen, since item 7.6 has the draft writer add a heading. The orchestrator may prefer a `not checked:` line for it; the brief should say which.
- A field whose name holds a `|`: not listed. `split_row` reads `\|` as a pipe, so the Field is `A | B` and `## A | B` matches. Not known to have happened; no case needed.
- A file with a byte-order mark: missing. `read_text` opens as `utf-8`, so the first line is `<U+FEFF>## Title` and does not start with `## `: the first field prints `not checked:`. Expected: the heading is read. A file saved by a Windows editor has one.
- A `grant-fields.md` that is not valid UTF-8, with no fourth argument: missing. The brief gives exit 2 only for a fourth argument that cannot be read. Today an unreadable `form-fields.md` is an error (head comment, "Errors"). Expected: exit 2 with one `error:` line.
- A heading that differs from the Field in case (`## title` for `Title`): not listed. By "letter for letter" it prints `not checked:`. The Sections table is compared without case (`same_heading`); the brief should say that the difference is meant.
- A `## ` heading that is no Field of the config: covered in part by "the count ends before that heading". Expected: no line for it.

Findings:

1. Missing from "Cases", each with the expected result above: a `### ` line inside a field's text; a Windows line ending; an empty field; a byte-order mark; a default `grant-fields.md` that is not valid UTF-8.
2. The format of item 7.2 does not say how a file with `## ` headings that are not the config's fields is judged at item 7.5, "a file already in the format above". The gate's own file has `## ` lines, `### ` lines and marker lines. Taken as "in the format" and copied with `cp`, its marker lines and sub-headings count as characters of whatever field they fall under. The brief has to state the test: for example, every `## ` heading of the file is a Field of the config.

## 7a. Does it hold together

- Item 1: a session can carry it out. `paper`'s format-convert compile reads "with the engine of Steps 11" (`paper/SKILL.md`, format-convert items 3, 5, 8 and 9), and `draft` item 10 reaches it. Item 1.4 states that the `.docx` compile takes the run's engine, so the clash is settled once the skill's text says it at item 10.
- Item 2: workable. It does not say who writes the two rows, and the intake agent writes `config.md` before the compile exists; the session adding them, as it adds the row Format Profile, fits. A runner without `latexmk` is not a "compile that fails" and has no stated value.
- Item 3: workable.
- Item 4: workable only with a `.bib`, see 5.4. The detection must match `\begin{thebibliography}`: the gate's `main.tex` also has `\renewenvironment{thebibliography}` at line 62.
- Item 5: workable. The formatter's page already asks for it: "When the chosen target cannot faithfully honor a declared field, say so in the Final Quality Checklist" (`formatter_agent.md`, "Apply it").
- Item 6.1: the citation compliance agent's page allows it by direction, with gaps. `lookup.py cite-keys` and `check-urls` run on the whole `.tex`, "The checks of the whole reference list" are computed over the cited keys, and "The results check" reads every statement on the study's results. The brief does not say which of these stay on the whole application.
- Item 6.2: `/writing` accepts a `.tex` fragment with no preamble. `prose_facts.py` (`tex_paragraphs`, `read_draft`) reads lines and needs no `\documentclass` or `\begin{document}`, and `writing/SKILL.md`, "What it reads" 3, tests only the extension. It fails on a brought-in file, see 5.2.
- Item 7.6: the draft writer of `paper` cannot write `grant-fields.md` under the prompt as built, see finding 1.
- Item 8.4: the formatter's page names the keys `body_font`, `line_spacing` and `margins_cm` (`formatter_agent.md`, "Apply it", the field map). It names no sub-key `family`, `size`, `top`, `bottom`, `left` or `right`, and for `line_spacing` it reads "a fixed point value when `mode == fixed_pt`", which implies a sub-key `mode`. The shape of item 8.4 is the brief's own.
- Items 8.1, 8.2, 8.3, 8.5, 8.6, 8.7: workable.

Findings:

1. Item 7.6: Steps 7 of `grant` builds a role's prompt from "the pieces the `paper` skill's "Agent prompts" gives a start's prompt". Two of those pieces forbid the write: "the file the agent writes, which is the only file it writes besides the files of a patch" and "writes no file outside the run folder besides its patch files and the files its page names". `grant-fields.md` stands in the application's folder and no page of `paper` names it. The brief says the skill states the exception; it does not say that the prompt's two pieces are changed for this start, so the agent is sent a rule and its opposite. The draft writer's page is also written for LaTeX, and the brief does not have the direction say that a form field is plain text with no LaTeX command, which `check_limits.py` would count.
2. Item 7.6, last bullet: "One that is neither is the refusal "A missing input"" refuses a call that works today. The Quick start line is `/grant draft <application folder> [<section heading>] [<materials>]`, so the second argument can be a materials path, which is neither a heading nor a Field. The rule needs "and is no existing file or folder".
3. Item 7.6: "A change outside it is put back from the copy" names no command, and the session changing a file of the application's text is the Anti-patterns row "The session writing or changing the application's text". A whole-file `cp` from the copy also removes the field just written. With no `grant-fields.md` before the run there is no copy to compare with.
4. Item 7.3: "the config drafter no longer reads any file of the application's folder" forbids the call documents when they stand in that folder, and `/grant config <application folder> <call documents>` allows that. In the gate's run the guidelines stand in a folder of the application.
5. Item 7.5 does not place its two stops in `config`'s order. The field texts agent needs the confirmed config's fields, so it runs after item 4 of `config`; the stop "A file of form fields that exists" has to come before anything is written (`docs/dev/skill-layout.md`, "Lists and tables": a step that can stop comes before every step that writes what it guards). The brief leaves the order to the builder.
6. Items 1 and 5 interact. A formatter that sets the config's font with `fontspec` in a pdfLaTeX application changes the engine the third rule finds at the next run. The formatter's direction should say that the layout is set with what the run's engine can compile.
7. Item 7.6's closing review is "invoked on a copy of the field's text" with no file name. The extension decides the rules: `/writing` holds a `.tex` to the manuscript prose standard and a `.md` or `.txt` to the prose standard alone (`writing/SKILL.md`, "What it reads" 1).
8. Item 6.4 and item 2.4: the patch `fit` is not among the patches `paper`'s Steps 12 gives an incremental check (the rewrite, the results-check patch, the reference fix, the compile fix, the findings pass). The brief does not say whether a `fit` patch that changes a cited sentence is checked.
9. The Rules line on the run folder (`sed -n '259p' skills/academic/grant/SKILL.md`) gains, by item 7.8, only "the files this item adds". `section.tex` (item 6), the field texts agent's report and the copies of item 7 are named; `section.tex` is not, and nothing names the per-mode lines "Stops this mode can reach" or the count in the Stops section's first sentence ("The first seven rows wait for the user ... the last four are refusals"), which two new rows make false.
10. "Read, with sections or line ranges" omits `paper`'s `agents/intake_agent.md` and `agents/structure_architect_agent.md`, whose behaviour items 8.1, 8.3 and 2.3 word.
11. Item 6.2's bullet "`section.tex` is copied again before a later `/writing` run of the same run": `draft` item 9 invokes `/writing` once, and no item of the brief adds a second run.

## 7. ADRs

Every `docs/adr/00*.md` was read for its status and Decision (`awk '/^## Decision/'` over the 43 records).

- 0044, in force: "`grant` ships the format of a funder config and one filled example, and holds no funder's facts" and "A config is one Markdown page with fixed headings and tables". The step is under both: the "Form fields" table keeps its columns. Named by the brief. No contradiction.
- 0023, in force in the part "A reply in one line ... starts the draft writer for those findings": the step changes which file `/writing` reads, not the reply. Named.
- 0031, in force: the intake asks whether the run ends with the review. Item 7.6 keeps the question. Named.
- 0026, in force: "The prose of a manuscript ... is held to the prose standard ... with the differences `manuscript-prose-standard.md` lists". The step touches it: `section.tex` is a `.tex` and is read as a manuscript, and a field's copy is read by its extension (7a.7). Not named.
- 0013, in force: `/writing` gives each agent "the draft's text". The step gives `/writing` a file that is one section. `/writing` is unchanged, so no contradiction. Not named.
- 0029, in force in the part on the incremental check of a later patch, for `paper`'s full and revision mode. Item 6.4 and the patch `fit` rest on `paper`'s Steps 12 (7a.8). Not named.
- 0024 and 0033, in force in parts: each claim the citation compliance agent judges rests on a passage read in the run. Item 6.1 narrows which sentences are checked and keeps the lookups. No contradiction. Not named.
- 0020 and 0036, in force in parts, on `paper`'s run folder and its caps on a fix: they bind `paper`'s runs. `grant`'s run folder is ruling D17. Not touched.
- 0014, 0030, 0035: `grant` reads no `plan.yaml` and starts its agents on the runner's defaults (Steps 7). The field texts agent starts the same way when the builder follows Steps 7. Not touched by the brief's text.
- 0001, 0002, 0004 to 0012, 0017, 0032, 0034, 0038 to 0040, 0042, 0043, and the superseded 0003, 0016, 0018, 0019, 0021, 0022, 0025, 0027, 0028, 0037, 0041: not touched.

Findings:

1. ADR 0026 is touched and not named: the brief should say which prose standard the review of `section.tex` and of a field's copy runs under.
2. ADR 0029 is touched and not named, with the open point of 7a.8.

## 8. Dictated text

- `/grant review <main.tex> [<file> ...]` (`grep -n 'grant review <main.tex> \[' .scratch/8-grant/agents/briefs/1b.md`): holds.
- `/grant draft <application folder> <field>`: holds as a line; see 7a.2 for the clash with the existing `draft` line.
- `check_limits.py <config> <pdf> <main.tex> [<fields file>]`: breaks "The rules" 11, see 4.2.
- `not checked: <field>: <reason>`: holds; the existing lines have this form.
- "not known: the application did not compile before the draft": holds.
- The rows "Pages before the draft" and "Page limit", and "no limit stated": hold; "no limit stated" is the value the intake page already uses.
- "the form of the reference list set by hand": holds.
- The stop "The form fields": holds, a noun-phrase label.
- The stop "A file of form fields that exists": breaks the prose standard, D, "No synonym cycling", see 4.7.
- The refusal "A missing input" and the stop "The mode" for item 7.6: see 7a.2 and 4.8.
- `grant-fields.md`, `agents/field_texts_agent.md`, `section.tex`, `compile-0/`, the patch id `fit`: hold as names.
- The format's three lines (`## <Field>`, the text up to the next `## ` line, a line before the first heading): hold, with 6.2.
- The log's first-line words `This is pdfTeX`, `This is XeTeX`, `This is LuaHBTeX`, `This is LuaTeX`: hold.
- `format-profile.yaml` keys `body_font` with `family` and `size`, `line_spacing`, `margins_cm` with `top`, `bottom`, `left`, `right`: the three keys hold against the formatter's page; the sub-keys stand on no page of `paper`, see 7a, item 8.4.
- `metadata.version` `"1.1.0"`: see 4.6.

Findings:

1. "A file of form fields that exists": a second term for the file of form-field texts.
2. The fourth argument of the usage line, under "The rules" 11.
3. `"1.1.0"`, under `docs/dev/skill-layout.md`, "Frontmatter".

## 9. Private material

Read against `CLAUDE.md`, "A shipped file names nothing private".

- The brief names no path outside the repository, no person and no document of one application. `cv.pdf`, `letter.pdf`, `missing.pdf` and `Title` are made up. `examples/fwo-postdoc-2027.md` is written from the funder's documents and the brief changes it only for the template's format.

Findings:

1. The test case "A file `form-fields.md` beside the `.tex` holding a marker pair" leads the builder to write the file name and the marker of the gate's application into the shipped `check_limits.test.sh`. ADR 0044's Context gives that file as `research-hub/funding/2026-fwo-senior-transplant/admin/form-fields.md`, and `grep -n '<!--' .agents/gate-8/submitted/form-fields.md` shows the same `<!--F:key-->` markers. It is the case of 4.1.

## Declined to judge

- Whether the seven gaps of item 8 are the gaps the run agent listed: the list is in no file. `ls -R .scratch/8-grant` shows no report of the run, and `grep -rln` over `.agents/gate-8/grant-runs` found no such list. The orchestrator holds the run agent's final message.
- Whether `fit`, the fourth argument and the stop for a heading that is also a Field are wanted: each is a decision of the brief under self-rule, and the findings above give the rule each meets.
- Whether point (4) asks more than the default (5.4): the orchestrator's reading of the ruling.
- The version number (4.6): a ruling on how "a plan that changes a skill" reads for a skill the plan itself made.
- No test was run on a changed tree and no file was written, so each expected result under "Implied inputs" is read from `check_sections.py` and the brief, not run.

Agent usage: a362fcb5d89d0e667, claude-fable-5-2, 219,055 tokens, 37 tool uses, 7.8 minutes.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1.1: the figure's labels and note follow the changed stops, agents and sequence. 1.2: `README.md` line 73 is named. 1.3: the criteria review template's "Files read" line is named, and the glossary is taken out of the paths (decision 13).
- 2.1: the `fit` patch is taken out; the run reports both page counts. 2.2: the fourth argument is taken out. 2.3: the row Citation Format of "revise" takes the same default.
- 3.1: "the two that wrote the marker file". 3.2: the description is reworded within its 1024 characters. 3.3: D12 is cited for `paper` only.
- 4.1 and 9.1: the test case with a marker file is taken out; the grep stands. 4.2: as 2.2. 4.3: the fourth-argument case is gone, and the no-heading case asserts its reason. 4.4: the character-set check has the repository's class. 4.5: the report part covers added and changed sentences only. 4.6: the version stays 1.0.0. 4.7: the stop is "A file of form-field texts that exists". 4.8: a field is drafted with the word `field`, so no argument is both.
- 5.1: pdfLaTeX when nothing names another engine, and the closing message names the engine and the `% !TEX program =` line. 5.2: the section's copy stands in a copy of the application's folder, and the heading may stand in a brought-in file. 5.3: `check_limits.py` takes `-` as `<pdf>`. 5.4: item 4.2 holds with a `.bib`; point (4) asks the default. 5.5: the session reads the log's font lines after each compile. 5.6: the PDF beside the `.tex` is given when the compile fails. 5.7: the stop gives the file and the range's first and last line, which the user reads.
- 6.1: the five cases are added, an empty field being `not checked:`. 6.2: a file is in the format when each `## ` line names a Field of the config.
- 7a.1: the direction replaces the two pieces for this start and says a field is plain text. 7a.2: as 4.8, and a materials path still works. 7a.3: the session restores nothing and names the changed line with the copy's path. 7a.4: the config drafter reads the call documents. 7a.5: the order of the two stops is stated. 7a.6: the formatter sets the layout with what the run's engine compiles. 7a.7: `field.txt`. 7a.8: no `fit` patch. 7a.9: the run folder's list, the count sentence and the modes' stop lines are named. 7a.10: the two pages are in the read list. 7a.11: the sentence is taken out.
- 7.1 and 7.2: ADR 0026 and ADR 0029 are named under "What is on the tree".
- 8.1 to 8.3: as 4.7, 4.2 and 4.6.
- Item 8.4, the sub-keys of `format-profile.yaml`: kept as the brief's own shape, which the brief says.
