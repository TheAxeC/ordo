Everything in the brief is done and every finding of the review is closed (section "Repair round 1"); two premises of the brief are corrected from the sources: the FWO grid scores 0 to 7, and page 10 of the application form states the layout.

## Open items of the state file

- none

## The cases' first run

On the unchanged tree `ls skills/academic/` printed `paper paper-review-panel referee writing`: neither the skill nor the scripts existed.

Tests of `check_sections.py`. The brief's fifteen cases are in `skills/academic/grant/templates/check_sections.test.sh` (S1 to S15, in the brief's order), and the three cases of the repair round are S16 to S18. Its one run on the unchanged tree, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1`, printed:

`FAIL: /Users/axelfaes/workspace/ordo/.agents/worktrees/8-grant-1/skills/academic/grant/templates/check_sections.py does not exist`

That one line is the failure of each of these cases: every required heading in order; one required heading lacking; two headings swapped; a heading on a commented line, with its control; a heading in a file brought in with `\input`; a heading that differs in case and spacing; a heading the config does not name; a not-required heading the `.tex` lacks; a `\subsection` heading; `\input{part}` for `part.tex`; a commented `\input` inside the file it names; paths that hold a space; a heading with a line break in its braces; a config with no "Sections" table; a brought-in file that does not exist.

S16 (a Required cell that is neither yes nor no), S17 (a file that brings itself in) and S18 (a Sections table that lacks a column) were added in the repair round and run once before any other change of that round. They exercise code that already existed, so a pass was the expected first result, and the run printed a last line starting `PASS: check_sections.py prints ok for each heading of the config`, with no failing case named.

Tests of `check_limits.py`. All seventeen cases are in `skills/academic/grant/templates/check_limits.test.sh` (L1 to L17, in the brief's order). Its one run on the unchanged tree, the same command with `check_limits.test.sh`, printed:

`FAIL: /Users/axelfaes/workspace/ordo/.agents/worktrees/8-grant-1/skills/academic/grant/templates/check_limits.py does not exist`

That one line is the failure of each of these cases: 10 pages of 10 and 11 of 10; 120 words of 100 with the control of 150; a comment and `\emph{...}`; `50\% of the cases`; `\cite`, `\label` and `\includegraphics`; a `\subsection` inside a section; text in a brought-in file; `(whole document)` in words; a required section with a word limit the `.tex` lacks; a form field whose markers are lacking; `(1 page,` and a statement broken across two lines; a form field of 126 characters against 240 and against 100; no `form-fields.md`; a section's limit in pages; a bad Unit and a bad Limit; a page limit with no log; paths that hold a space.

Cases read in the skill's text. First read, unchanged tree: no `skills/academic/grant/` folder, so each had nothing to read. Reading of the built text:

| Case | Where the text settles it |
|---|---|
| `draft` with no `paper` folder: refused before anything is written, naming the `paper` skill | `SKILL.md` "What it reads" 1, Steps 2 ("before anything is written"), Stops row "The `paper` skill is not installed" |
| `draft` with no file in `grant-config/`: refused, naming `/grant config` | "What it reads" 4, Steps 4, Stops row "No funder config" |
| `config` where the documents state no page limit: Limit empty, Source "not stated in the documents given" | `agents/config_drafter_agent.md`, "Writing the config", the bullet "Leave Limit and Unit empty..."; the template's opening paragraph |
| `config` where a config of the same name exists: the stop, before anything is written | `config` item 2, which runs before item 3 makes the run folder; Stops row "A config that exists" |
| `draft <folder> "Scientific research objectives"`: the outline holds that section under the funder's heading with its limit, and the draft writer is given the criteria | `draft` item 2 (outline, "For a run on one section the outline holds that section only"), Steps 7 (every role's prompt holds the funder config and the direction on the criteria), `draft` item 4 |
| The writing findings answered `none`: no patch, and the run ends | `draft` item 9, "A reply `none` writes no patch and runs nothing more of this item", then items 10 and 11 end the run |
| `review` with no CV and a criterion on the applicant's record: "not scored" | `agents/criteria_reviewer_agent.md`, "Scoring a criterion"; `review` item 1's Done line |
| `review`: no file of the application changed, no chance of funding stated | `review` item 2's Done line; the agent page's "What the review leaves out" |
| `check`: no agent starts, and the user reads sentences or a table | `check` item 1; Steps 9, "Tell the user what the scripts found, in sentences or a table"; Anti-patterns row on a script's line |
| No page of `paper`, and no passage of one longer than a sentence, in `skills/academic/grant/` | Read of the eleven files: each role is named by its page with its skill, and the items say "as the `paper` skill's Steps <n> says" |
| No funder's facts outside `examples/fwo-postdoc-2027.md` | `grep -rn -il 'fwo' skills/academic/grant` lists only the example and `SKILL.md`, where the one hit is the Rules bullet that names the example's file; the test scripts' configs use invented headings |

No case showed the brief's own rules to be wrong, so no ruling was asked.

## DONE / NOT DONE

| Check | Result | Output as printed |
|---|---|---|
| 1. `sh skills/academic/grant/templates/check_sections.test.sh 2>&1 \| tail -1` | DONE | `PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, missing for a required heading the .tex lacks or holds only on a commented line, out of order for a heading moved, absent for a heading that is not required, and not in the config for a heading the config does not name; it reads the files the .tex brings in, a name without its extension among them, matches a heading whatever its case and spacing, prints no line for a subsection, reads paths that hold a space, and exits 2 with one error line for a config with no Sections table, for a brought-in file that does not exist, for a Required cell that is neither yes nor no, for a file that brings itself in and for a Sections table that lacks a column` |
| 1. `sh skills/academic/grant/templates/check_limits.test.sh 2>&1 \| tail -1` | DONE | `PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one included, counts a section's words and characters without its comments, command names, citations, labels and figure files and with the text inside braces, after an escaped percent sign, under a subsection and in a brought-in file, counts the whole document and a form field between its markers, prints over and exits 1 past a limit, prints not checked for a section's limit in pages, a section the .tex lacks and a form field with no text, and exits 2 with one error line for a unit or a limit it cannot read and for a page limit with no log or no page count` |
| 1. `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` | DONE | `ok: the plan-terms block equals the template`, exit 0 |
| 1. The character-set check over the eighteen files | DONE | It printed no line; exit status 0 |
| 2. `python3 docs/figures/gen_figures.py`, then `git status --short docs/figures` | DONE | exit 0; ` M docs/figures/gen_figures.py` and `?? docs/figures/grant.svg` |
| 3. The frontmatter print | DONE | `grant 1014 1.0.0` |
| 4. `grep -n '^## ' skills/academic/grant/SKILL.md` | DONE | `12:## Quick start`, `23:## Use instead`, `32:## What it reads`, `49:## Steps`, `218:## Stops`, `237:## Anti-patterns`, `249:## Rules` |
| 5. `git status --short skills/academic/paper` | DONE | It printed nothing |
| 6. `check_sections.py` on the shipped example with a scratch `.tex` of the three required headings | DONE | `absent, not required: Changes to previous project proposal`, `ok: Rationale and positioning with regard to the state-of-the-art`, `ok: Scientific research objectives`, `ok: Research methodology and work plan`, exit 0. With "Scientific research objectives" taken out: the same first two lines, `missing: Scientific research objectives`, `ok: Research methodology and work plan`, exit 1 |
| 7. The reading against the rules on list items and sentence length | DONE | See "Departures" below |

All commands ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

Departures from the sentence-length rule, each kept in its form:

- `SKILL.md` "What it reads" 2 (48 words) and Steps 1's first bullet (40 words): each is one list, of the places a page is found and of the five modes, and splitting it would separate a member from its rule.
- `SKILL.md` Steps 7, the two bullets on the direction (40 and 36 words) and the bullet on every prompt (36 words): each states what one prompt sentence says, and its clauses are the parts of that one sentence.
- `SKILL.md` Steps 9's compile-fix bullet (39 words), `draft` items 6, 7 and 9 and `revise` item 2 (33 to 38 words): each names the `paper` item it follows inside the sentence, since the layout asks that another skill's file is named with its skill.
- `SKILL.md` first lines of `config` items 1 and 3, `revise` item 1 and `review` item 1 (33 to 43 words): each lists the files the agent is given, which is one list.
- `agents/criteria_reviewer_agent.md`, "The criteria review", first bullet (37 words): it repeats the glossary's definition whole. Two bullets of "Scoring a criterion" (38 and 33 words) carry the quoted line "not scored: the files given hold nothing on it".
- `references/intake.md`, "draft", the bullet on the rows from Claim check to Citation Verification (34 words): it names five rows and the page that words them.
- The Descriptors cells of the example are the funder's descriptors and are long by nature.

## Behaviours of the two scripts whose failure costs something

The failing line quoted for every row is the one line each test printed on the unchanged tree, quoted above (`FAIL: ... does not exist`).

| Behaviour | Case |
|---|---|
| A required heading the `.tex` lacks is reported and exits 1 | S2 |
| A heading on a commented line is not counted as present | S4, with its control |
| Headings out of the config's order are reported and exit 1 | S3 |
| A heading in a brought-in file is found, also for a name without `.tex` | S5, S10 |
| A commented `\input` is not followed, so a file is not brought into itself | S11 |
| A config with no Sections table, or a brought-in file that does not exist, exits 2 and prints nothing on standard output | S14, S15 |
| A Required cell that is neither yes nor no, a file that brings itself in and a Sections table that lacks a column exit 2 (first run: a pass, the code existed) | S16, S17, S18 |
| A page count above the limit is `over:` and exits 1, and the count is read from `(1 page,` and from a broken log line | L1, L11 |
| A word count above the limit is `over:` with the count | L2 |
| Comments, command names, citations, labels and figure files add no word, and text in braces, after `\%`, under a `\subsection` and in a brought-in file is counted | L3 to L7 |
| The whole document and a form field are counted | L8, L12 |
| A row the script cannot count prints `not checked:` and does not fail or pass silently | L9, L10, L13, L14 |
| A unit or limit it cannot read, and a page limit with no log, exit 2 | L15, L16 |
| Paths with a space are read as given | S12, L17 |

## Steps of `SKILL.md` that run a role or a script of `paper`

| Step of `grant` | What it names in the `paper` skill's `SKILL.md` |
|---|---|
| "What it reads" 2, Steps 5 | "What it reads" 1; Stops row "No prose standard" |
| Steps 3 | Steps 2 (quoting) |
| Steps 7 | Steps 8 (start and resume a role), "Agent prompts" |
| Steps 8 | Steps 9 (prepare a patch), Steps 10 (apply), `templates/anchorize_tex.py`, `templates/apply_tex_patch.py` |
| Steps 9 | Steps 7 (temporary folder), Steps 11 (compile and compile fix) |
| `draft` item 7 | `agents/intake_agent.md`, Step 5, for the form of the format profile the session writes |
| `draft` items 1, 2, 4, 5, 7 | The pages `agents/intake_agent.md`, `agents/structure_architect_agent.md`, `agents/argument_builder_agent.md`, `agents/draft_writer_agent.md`, `agents/formatter_agent.md` |
| `draft` item 6 | Steps 12 (citation check) |
| `draft` item 9, `revise` item 4 | Steps 13 (a wrong number), Steps 12 (incremental check), `agents/draft_writer_agent.md`, "The `/writing` findings" |
| `draft` item 10, `revise` item 4 | Steps, "full", item 12 |
| `revise` item 2 | Steps, "revision", item 2; `agents/draft_writer_agent.md` |
| Stops row "A stop of the `paper` skill" | Steps 9, 10, 11, 12, "revision" item 2, "full" item 12, and the Stops table |

## Terms

- **criteria review**: used in `SKILL.md` (description, Rules), `agents/criteria_reviewer_agent.md`, `templates/criteria_review_template.md`, the README row and the figure's note, each as the per-criterion review of the author's own application. The entry's "Stated in" now reads `skills/academic/grant/agents/criteria_reviewer_agent.md`, "The criteria review". `grep -n 'criteria review' skills/academic/grant/agents/criteria_reviewer_agent.md` prints line 5 ("criteria reviewer"), line 7, the heading, and line 9, the definition.
- **funder config**: used throughout the skill as the page of one funder's programme and call. The entry's "Stated in" now reads `skills/academic/grant/templates/funder_config_template.md` and keeps ADR 0044. `grep -n 'funder config' skills/academic/grant/templates/funder_config_template.md` prints line 3, the opening paragraph.
- **draft review**, **panel review**, **referee review**: each used once in `SKILL.md` Rules and once in the criteria reviewer's page, only to say the criteria review is none of them.
- **intake agent**: used in a new place, `SKILL.md`, `draft` item 1, and `references/intake.md`, for the agent that holds the intake of a `draft` run. The entry now covers that run and names `skills/academic/grant/SKILL.md`, Steps, "draft" item 1, in its "Stated in"; its other words are unchanged. `grep -n 'intake agent' skills/academic/grant/SKILL.md` prints line 127, that item.
- **incremental citation check**: `draft` item 9 uses "the incremental check" in the entry's sense, by reference to the `paper` skill's Steps 12.
- The definitions' words are unchanged: `git diff docs/glossary.md` changes the "Stated in" clauses of **criteria review** and **funder config** and, in **intake agent**, adds the clause on a `draft` run of `grant` and one "Stated in" place.

## Files with line counts

New: `skills/academic/grant/SKILL.md` 262; `agents/config_drafter_agent.md` 59; `agents/criteria_reviewer_agent.md` 59; `examples/fwo-postdoc-2027.md` 53; `references/intake.md` 92; `templates/check_limits.py` 222; `templates/check_limits.test.sh` 199; `templates/check_sections.py` 251; `templates/check_sections.test.sh` 211; `templates/criteria_review_template.md` 20; `templates/funder_config_template.md` 46; `docs/figures/grant.svg` 69.

Changed (`git diff --stat`: 6 files, 70 insertions, 10 deletions): `README.md` 255; `docs/dev/building.md` 41; `docs/dev/change-standard.md` 95; `docs/dev/scripts.md` 49; `docs/figures/gen_figures.py` 2303; `docs/glossary.md` 163.

## Judgment calls the brief left open

1. `check_limits.py` imports the shared reading code from `check_sections.py` in the same folder and sets `sys.dont_write_bytecode`, so a run leaves no `__pycache__` in the installed skill.
2. A Required cell other than yes or no, a Limit that is no whole number and a Unit outside pages, words and characters are errors (exit 2), since a guessed value would accept a wrong config.
3. Only the text between `\begin{document}` and `\end{document}` is read, when the `.tex` has them.
4. "Out of order" marks the fewest headings that would have to move, the earlier config rows kept as `ok:` on a tie.
5. The counted text: defined in the head comment of `check_limits.py`. A section's own heading is not counted, a subsection's title is, and the whole-document count includes headings.
6. A section with a word or character limit that the `.tex` lacks prints `not checked:` whether required or not; `check_sections.py` reports the missing heading. The reasons for `not checked:` are five: a section's limit in pages, a section the `.tex` lacks, a form field's limit in pages (not among the brief's reasons), no `form-fields.md` beside the `.tex`, and no markers for the field.
7. The page count comes from the log beside the PDF path given, so `SKILL.md` Steps 9 passes the PDF in the compile folder. The PDF file itself is not read.
8. Form fields are read from `form-fields.md` beside the main `.tex`, between `<!--F:<key>-->` and `<!--/F-->`, and the Field cell of the config is that key.
9. Run records go to `grant-runs/<mode>-<date>/` beside the application's folder, so the application's folder gains only `grant-config/`, the `.tex`, the PDF and the `.docx`.
10. `draft` runs the draft writer as one call outside the Generator-Evaluator Contract, with no peer reviewer, and starts no literature strategist: a source the `.bib` lacks is a listed gap. A run with no `.bib` runs no citation check, and its closing message says so.
11. `revise` starts the draft writer on the comments file directly, with comment ids `G<k>`, runs no citation check and names `/paper citation-check` in its closing message.
12. The layout reaches the formatter as `format-profile.yaml`, which the session writes in the run folder from the config's "Layout" in the form the `paper` skill's intake agent page gives a profile; the session adds the row Format Profile to `config.md`. With no layout stated the formatter is not started.
17. The intake of `draft` asks the language (default English) and the citation style (default: the style of an existing `main.tex`, else IEEE, a numbered style).
18. On a runner without `latexmk`, `check_limits.py` runs only when a log of an earlier compile stands beside the PDF of the main `.tex`.
13. The example marks the first heading not required and the other three required, and says under its table that the documents do not state which headings every application carries.
14. The example identifies the application form as "the report of an application submitted in December 2024", with no name, number, title or path.
15. The figure draws three stops of `draft` as boxes (the intake, the outline, the writing findings) and names the other stops the mode can reach in its note, as `referee.svg` does for the round question.
16. The description names the `/writing` findings as "the prose findings", since a description names no neighbouring skill.

## Host- and user-visible changes

| Where | Before | After |
|---|---|---|
| Skills | No `/grant` | `/grant config`, `draft`, `revise`, `review`, `check`, version 1.0.0 |
| `README.md` skills table | Ends the academic rows with `referee` | A `grant` row after `referee` |
| `README.md` group sentence and install text | "`paper`, `paper-review-panel`, `referee` and `writing`", "eighteen skills" twice | `grant` added, "nineteen skills" twice |
| `README.md` figures | Sentence and image list without `grant` | `grant` with its agents in the sentence, and the image line of `docs/figures/grant.svg` after the one of `referee` |
| `README.md` default-agent sentence | "`paper`, `paper-review-panel` and `referee`" | "`paper`, `paper-review-panel`, `referee` and `grant`" |
| `README.md` install loop | `academic/referee academic/writing` | `academic/referee academic/grant academic/writing` |
| `docs/dev/building.md`, `docs/dev/change-standard.md`, `docs/dev/scripts.md` | No grant tests or scripts, no `grant.svg` | The two test commands, the two script rows, the two test rows, `grant.svg` in the figure lists |
| `docs/glossary.md` | Both entries stated in `docs/roadmap.md`, entry 8 | Stated in the skill's pages; ADR 0044 kept for **funder config** |
| `docs/figures/` | No `grant.svg` | `grant.svg`, written by `gen_figures.py`; no other figure changed |

## Anything in the brief that was wrong or impossible

- The brief (line 29 and the build item of the example) describes the FWO grid's scale as 0 to 6. `pdftotext -layout` of the four pages of the score grid prints a header row with the scores 0 to 7 under five labels: 0 Unacceptable, 1 Weak, 2 and 3 Fair/Reasonable, 4 and 5 Good/Very good, 6 and 7 Excellent/Outstanding. The example is written from the source: "whole scores from 0 to 7".
- The brief says that neither source states the font, the spacing or the margins. That holds for page 21 only. Page 10 of the application form prints "The total project outline has a maximum of 10 A4 pages (Font Calibri 11, single line spacing, original template margins ...) herein included all tables, graphs, illustrations, etc." (`pdftotext -f 10 -l 10 -layout`, lines 53 to 55 of its output). The example's "Layout" is filled from page 10, and its page limit cites page 10 beside page 21.
- Neither source states a form-field limit, and the form states no limit per section. The example writes "not stated in the documents given" for each.

## Repair round 1

| Finding | The change that closed it |
|---|---|
| Spec 1, Proof 1 | `examples/fwo-postdoc-2027.md`: "Layout" reads Calibri, 11, single line spacing and "the original template's margins, not given as a measure in the documents given", each with Application form, p. 10. The row `(whole document)` cites p. 10 beside p. 21. "Call" says page 10 holds the form's instructions. The labels are listed in the grid's order with the sentence that the grid prints no boundary between the scores of one label and the next, and with the grid's two own sentences on a score (5 or higher, p. 1; a minimum of 4, p. 4). The claim of this report that no source states a layout is withdrawn above. |
| Spec 2, Standards 1 | `SKILL.md`, Steps 7: every prompt forbids looking a fact of the funder up online, and a new bullet says a role of `paper` keeps every lookup its own page gives it. |
| Spec 3 | `SKILL.md`, `draft` item 7: the session writes `format-profile.yaml` in the run folder from the config's "Layout", in the form the `paper` skill's `agents/intake_agent.md`, Step 5, gives a profile, adds the row Format Profile to `config.md` and gives the profile to the formatter. `draft` item 1 and `references/intake.md` say the intake agent asks nothing on format and writes no profile; the row Format Profile is out of the agent's rows. |
| Spec 4 | `check_sections.test.sh`, cases S16, S17 and S18, with the head comment and the PASS line naming them. First run quoted under "The cases' first run": a pass, as expected for code that existed. |
| Spec 5 | `templates/funder_config_template.md`, "Form fields": Field is the marker key, such as `title_en`, and Source starts with the form's name of the field. `agents/config_drafter_agent.md`: three bullets on reading the keys from an existing `form-fields.md` and listing a field whose key it cannot find. `SKILL.md`: "What it reads" 5 and 10, `config` item 3 (the file is given) and item 4 (the session asks the user for each missing key at the stop "The config"). The agent cannot ask the user itself, so the question goes through the session. |
| Standards 2 | `SKILL.md`, Steps 9: on a runner without `latexmk`, `check_sections.py` runs, `check_limits.py` runs only when `<main>.log` of an earlier compile stands beside `<main>.pdf`, and otherwise it is not run and the user is told in words that no limit was checked and why. |
| Standards 3 | `references/intake.md`, "draft": the default of the materials question is "None". |
| Standards 4 | `SKILL.md`, `revise` item 2: the session writes each narrowed comment into `narrowed-comments.md` in the run folder under its id `G<k>`. Rules lists the file among the run folder's records. |
| Standards 5 | `SKILL.md`, `config` item 2: the hyphens at both ends of each of the three parts are taken off. |
| Standards 6 | `docs/glossary.md`, **intake agent**: covers a `draft` run of `grant`; listed under "Terms". |
| Behaviour 1 | `references/intake.md`, "draft": two questions added, the language (default English) and the citation style (default: the style of an existing `main.tex`, else IEEE, a numbered style); the rows Body Language and Citation Format take the user's answer. The bullet on a run with no `.bib` says the run checks no citation. Judgment calls 10 and 17 state both. |
| Behaviour 2 | Judgment call 6 lists the five `not checked:` reasons, the form field's limit in pages among them. |

Also changed with Spec 1: `agents/criteria_reviewer_agent.md` and `templates/criteria_review_template.md` give a score its label only where the config assigns the score one.

After the round every check of "Verify before you report" was run again; the DONE / NOT DONE table holds those outputs.
