Everything in the brief is done, and every finding of the reviewer is closed (see "Repair round 1" at the end, which replaces what the sections above say on the same points).

## Open items of the state file

- none

## The cases' first run

The 16 test cases below were added to `skills/academic/grant/templates/check_limits.test.sh` and run once on the unchanged `check_limits.py` (base b683b68) with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_limits.test.sh`. Every one failed; the run's last line was `FAIL: check_limits.py does not hold the behaviour above`. The lines as printed:

| Case of the brief | Test | Failing line on the unchanged tree |
|---|---|---|
| A config field with no `## ` heading in the file | L10 | `L10 not checked (0, ['not checked: Abstract: no form-fields.md stands beside the .tex'], [])` |
| `## Title` with 126 characters against 240 | L12 ok | `L12 ok (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| The same against 100 | L12 over | `L12 over (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| No `grant-fields.md`, the path in the reason | L13 | `L13 not checked (0, ['not checked: Abstract: no form-fields.md stands beside the .tex'], [])` |
| Two lines, empty lines at both ends count as none | L18 (the two-line text is also L12's) | `L18 empty lines at both ends (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A text followed by another `## ` heading | L19 | `L19 the next heading (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A `### ` line inside a field | L20 | `L20 a deeper heading (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| Windows line endings | L21 | `L21 Windows line endings (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A byte-order mark | L22 | `L22 a byte-order mark (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A heading with no text | L23 | `L23 no text (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| Not valid UTF-8 | L24 | `L24 not UTF-8 (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| The same heading twice | L25 | `L25 a heading twice (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| `-` as `<pdf>`, a page limit and a field of 126 under 240 | L26 | `L26 no compile (2, [], ["error: the log -.log cannot be read, and the page limit needs its page count: [Errno 2] No such file or directory: '-.log'"])` |
| `-` as `<pdf>`, a section over its limit in words | L27 | `L27 no compile, a section over (2, [], ["error: the log -.log cannot be read, and the page limit needs its page count: [Errno 2] No such file or directory: '-.log'"])` |
| A trailing space in the heading line | L28 | `L28 a trailing space (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A field with a limit in words | L29 | `L29 words (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| The cases the test already holds pass unchanged | L1 to L9, L11, L14 to L17 | No line printed for them in that run, and the test passes after the build (the PASS line below). L10 and L12 are the two rewritten to `grant-fields.md`. |

After that run one expectation of L13 was changed by reading: the path it expects is `os.path.abspath(scratch)`, since the script prints the absolute path.

Cases read in the skill's text, each with the place that states it (`skills/academic/grant/SKILL.md` unless named):

| Case | Reading |
|---|---|
| No engine package, no `% !TEX program` line, no log: `latexmk -pdf` | Steps 9, the engine list's last bullet "pdfLaTeX otherwise", and "the flag `-pdf` for pdfLaTeX" |
| `fontspec`, no line, no log: `latexmk -xelatex` | Steps 9, "XeLaTeX, when such a line loads `fontspec`, `unicode-math` or `polyglossia`" |
| A log starting `This is XeTeX`, no `fontspec`: `-xelatex` | Steps 9, the log bullet stands second, before the package bullets |
| `% !TEX program = lualatex`: `-lualatex` whatever the log | Steps 9, the `% !TEX program =` bullet stands first |
| 9 pages under a limit of 10: both rows, both directions | `draft` item 2 (the two rows, the structure architect's direction), item 5 (the draft writer's direction), `references/intake.md`, the table "The session adds these rows" |
| 11 pages of 10 after 9 before | `draft` item 11, "gives the page count before the draft and the page count of the last compile, and says which of the two was over the page limit" |
| `/grant review main.tex cv.pdf letter.pdf`, and a missing file | Quick start, "What it reads" 9, `review` items 1 and 2, the Stops row "A missing input" |
| A `thebibliography` list: the style's default, no item rewritten | `references/intake.md`, "draft", the citation style row; `draft` item 6 |
| One section with an `\input` line; the whole application | `draft` item 6 (the section named, `cite-keys` and `check-urls` on the whole `.tex`, "A run on the whole application checks the whole application") and item 9 (`review/`, `section.tex`) |
| `/grant config` with a file in another format | `config` items 1, 2 and 6, the Stops row "The form fields", `agents/field_texts_agent.md` |
| `/grant draft <folder> field Title` | "draft of a form field" items 1 to 6 |
| `/grant draft <folder> field Nothing` | "draft of a form field" item 1, the Stops row "A missing input" |
| `/grant draft <folder> notes.md` | Quick start keeps the line, and Steps 1 sends only a call whose second argument is the word `field` to the other items |
| A runner without `latexmk` | Steps 9, "On such a runner `check_limits.py` runs with `-`" |
| `grep -rn 'form-fields\|<!--F' skills/academic/grant` prints nothing | Run: no output, exit 1 |
| No file under `paper/` or `writing/` changed | `git status --short skills/academic/paper skills/academic/writing` printed nothing |
| No file names a file, folder, person or document of one application | Read: the fixtures are `## Title`, `## Keywords`, "A title", runs of one letter; the template's example is marked made up (a river project); the field texts agent's page names no file of an application |

No case of the brief's rules gave a wrong result on the first run.

## DONE / NOT DONE

| Item | State | Where, and the check |
|---|---|---|
| 1.1 engine order | DONE | SKILL.md Steps 9, the five-bullet list |
| 1.2 engine in `checks.md` and the closing message | DONE | Steps 9 ("Write the engine and the rule", "The message that ends a run that compiled"), named from `draft` 11, `revise` 5, `review` 3, `check` 1 |
| 1.3 flags | DONE | Steps 9, "`latexmk <flag> -interaction=nonstopmode -halt-on-error`" |
| 1.4 one engine per run, format-convert too | DONE | Steps 9 "Every compile of the run takes that engine"; `draft` item 10 |
| 1.5 formatter's direction on the engine | DONE | `draft` item 7 |
| 2.1 compile before the draft, `compile-0/` | DONE | `draft` item 2; Steps 9 "`<k>` is 0 for the compile before a draft" |
| 2.2 the two rows | DONE | `draft` item 2; `references/intake.md` |
| 2.3 both directions | DONE | `draft` items 2 and 5 |
| 2.4 closing message | DONE | `draft` item 11 |
| 3.1 Quick start of `review`, the refusal | DONE | Quick start; "What it reads" 9 |
| 3.2 compile first, the PDF given | DONE | `review` items 1 to 3 |
| 3.3 field texts and further files | DONE | `review` item 2 |
| 3.4 reviewer page and template | DONE | `agents/criteria_reviewer_agent.md`, "What you are given" and "The file"; `templates/criteria_review_template.md`, "Files read". The rule on a criterion the files hold nothing on is unchanged |
| 3.5 no file changed, no PDF copied | DONE | `review` item 3's done criterion |
| 4.1 the style's order | DONE | `references/intake.md`, "draft" and "revise" |
| 4.2 citation compliance direction | DONE | `draft` item 6 |
| 4.3 closing message | DONE | `draft` item 11 |
| 5.1 formatter names what it could not set | DONE | `draft` item 7 |
| 5.2 font lines in `checks.md` | DONE | Steps 9 |
| 5.3 repeated in the message; `check` reports them | DONE | Steps 9, `draft` 11, `revise` 5, `check` 1 |
| 6.1 citation check on one section | DONE | `draft` item 6 |
| 6.2 `/writing` on `section.tex` | DONE | `draft` item 9 |
| 6.3 whole application, `revise` | DONE | `draft` items 6 and 9; `revise` item 4 |
| 6.4 incremental check | DONE | `draft` item 9 |
| 7.1 one file, `grant-fields.md` | DONE | "What it reads" 10; verify 2 |
| 7.2 the format | DONE | `templates/funder_config_template.md`, "The file of form-field texts"; head comment of `check_limits.py` |
| 7.3 Field is the form's name; no marker | DONE | template, `agents/config_drafter_agent.md`, SKILL.md `config` items 3 and 4 |
| 7.4 `check_limits.py` | DONE | the test, L10, L12, L13, L18 to L29 |
| 7.5 a file the user provides | DONE | `config` items 1, 2, 6 and 7; `agents/field_texts_agent.md`; `references/intake.md`, "config" |
| 7.6 `draft` writes a field | DONE, with point 1 of the last part | "draft of a form field"; Steps 8 |
| 7.7 no `latexmk` | DONE | Steps 9 |
| 7.8 Stops, Rules, run folder | DONE | Stops table (nine rows that wait), each mode's line, Rules |
| 8.1 to 8.7 the gaps of text | DONE | 8.1 `draft` item 1 and intake.md; 8.2 Steps 7; 8.3 `draft` item 2; 8.4 `draft` item 7; 8.5 Steps 9; 8.6 Rules; 8.7 Steps 9 |
| Places 1 | DONE | version 1.0.0, description 1022 characters, Quick start |
| Places 2 | DONE | `docs/dev/scripts.md`, `docs/dev/building.md` |
| Places 3 | DONE | `gen_figures.py`, `grant()`, the note; `grant.svg` written again. The nodes are unchanged, since the draft mode's agents and stops are |
| Places 4 | DONE | `README.md`, the row of `grant` and the sentence on the agents |
| Places 5 | DONE, no change | The example's "Form fields" table is empty and names no marker, so the format change does not reach it |

The checks, as printed:

1. `sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1`: `PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, missing for a required heading the .tex lacks or holds only on a commented line, out of order for a heading moved, absent for a heading that is not required, and not in the config for a heading the config does not name; it reads the files the .tex brings in, a name without its extension among them, matches a heading whatever its case and spacing, prints no line for a subsection, reads paths that hold a space, and exits 2 with one error line for a config with no Sections table, for a brought-in file that does not exist, for a Required cell that is neither yes nor no, for a file that brings itself in and for a Sections table that lacks a column`
   `sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1`: `PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one included, counts a section's words and characters without its comments, command names, citations, labels and figure files and with the text inside braces, after an escaped percent sign, under a subsection and in a brought-in file, counts the whole document and a form field under its heading in grant-fields.md, with a line break as one character under either line ending, without the empty lines at both ends, up to the next heading, with a deeper heading, after a byte-order mark and with a space after the heading, prints over and exits 1 past a limit, prints not checked for a section's limit in pages, a section the .tex lacks, a form field with no file, no heading or no text and a page limit with - as the PDF, and exits 2 with one error line for a unit or a limit it cannot read, for a page limit with no log or no page count and for a grant-fields.md that is not UTF-8 or holds a heading twice`
   `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
   The character-set check over the 15 changed or new files: no output, exit 0.
2. `grep -rn 'form-fields\|<!--F' skills/academic/grant`: no output, exit 1.
3. The frontmatter command: `grant 1022 1.0.0`.
4. `grep -n '^## ' skills/academic/grant/SKILL.md`: `12:## Quick start`, `24:## Use instead`, `33:## What it reads`, `52:## Steps`, `326:## Stops`, `347:## Anti-patterns`, `359:## Rules`.
5. `git status --short skills/academic/paper skills/academic/writing`: no output.
6. `python3 docs/figures/gen_figures.py`: exit 0; `git status --short docs/figures`: ` M docs/figures/gen_figures.py` and ` M docs/figures/grant.svg`.
7. Read against the list and sentence rules. Departures: the engine bullets of Steps 9, the bullets that name a command with its arguments, and the "given ..." sentences that list an agent's files run past 20 words, since each holds one command or one list. `config` item 6 and `draft` item 2 hold several bullets with two sentences where the second is the qualifier of the first. The description is one long paragraph, as the layout asks.

The green results cover the scripts' behaviour on scratch files. They do not cover whether a session follows the skill's text; that is step 2's run.

## Behaviours of `check_limits.py` whose failure costs something

| Behaviour | Case | Failing line on the unchanged tree |
|---|---|---|
| A field's text under `## <Field>` is counted against its limit, over exits 1 | L12 | `L12 over (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| A line break is one character under either line ending | L12, L21 | `L21 Windows line endings (0, ['not checked: Title: no form-fields.md stands beside the .tex'], [])` |
| Empty lines at both ends are not counted | L18 | quoted above |
| The count ends at the next `## ` heading | L19 | quoted above |
| A `### ` line is counted | L20 | quoted above |
| A byte-order mark does not hide the first heading | L22 | quoted above |
| A trailing space after the heading still matches | L28 | quoted above |
| Words are counted for a limit in words | L29 | quoted above |
| A field not written yet is "not checked", not a pass with a count | L10, L13, L23 | quoted above |
| A file that cannot be read, or holds a heading twice, is refused | L24, L25 | quoted above |
| `-` as `<pdf>` still counts words and characters and exits 1 past a limit | L26, L27 | quoted above |

## Sections of `paper` and `writing` named in new or changed sentences

- "the `paper` skill's Steps 7" and "Steps 13" (Steps 9): `skills/academic/paper/SKILL.md` Steps item 7 "Make the temporary folder" and item 13 "The closing review" exist.
- "the `paper` skill's Steps 11" and "Steps 12" (Steps 9, `draft` items 6 and 9): items 11 "Check the references, and compile" and 12 "Check the citations against their sources" exist.
- "the `paper` skill's \"Agent prompts\"" ("draft of a form field" item 3): `## Agent prompts` exists, with the pieces "the file the agent writes" and "For a role that writes a patch".
- "the Generator-Evaluator Contract of the agent's page": the draft writer's page is named as in the existing `draft` item 5.
- "the `paper` skill's format-convert" (`draft` item 10): `### format-convert` exists.
- "the `paper` skill's `agents/formatter_agent.md`, \"Format Profile\"": the section exists.
- `/writing <main.tex>`: the Quick start of `skills/academic/writing/SKILL.md` takes one file.

## Terms

The diff adds no glossary term (decision 13). It uses "funder config", "criteria review" and "intake agent" in the senses of their entries; the intake agent's entry says it holds "the intake of a `draft` run of `grant`", which a draft of a form field is.

## Files, with line counts

- `skills/academic/grant/SKILL.md` 373
- `skills/academic/grant/agents/config_drafter_agent.md` 56
- `skills/academic/grant/agents/criteria_reviewer_agent.md` 63
- `skills/academic/grant/agents/field_texts_agent.md` 44 (new)
- `skills/academic/grant/references/intake.md` 114
- `skills/academic/grant/templates/funder_config_template.md` 71
- `skills/academic/grant/templates/criteria_review_template.md` 20
- `skills/academic/grant/templates/check_limits.py` 257
- `skills/academic/grant/templates/check_limits.test.sh` 263
- `skills/academic/grant/examples/fwo-postdoc-2027.md` 54 (unchanged)
- `README.md` 255
- `docs/dev/building.md` 41
- `docs/dev/scripts.md` 49
- `docs/figures/gen_figures.py` 2310
- `docs/figures/grant.svg` 74

## Judgment calls the brief left open

1. The format of `grant-fields.md` is a last section of `templates/funder_config_template.md`, "The file of form-field texts", which the config drafter leaves out of a config, and not a note in angle brackets, since it holds a list and a fenced example.
2. A draft of a form field has its own subsection, "draft of a form field", so that the item numbers of `draft` stay as the brief names them (items 9 and 10).
3. The page count before the draft is the first part of `draft` item 2, for the same reason.
4. In the engine list LuaLaTeX stands before XeLaTeX, so that a `.tex` that loads both `fontspec` and `luacode` compiles with the engine that runs both.
5. A `% !TEX program =` line counts only when it names `pdflatex`, `xelatex` or `lualatex`.
6. The compile folders are `compile-<k>/` throughout, with `<k>` 1 for the first compile that is not the one before a draft; the name `compile/` is gone.
7. With no `main.tex`, or a limit not in pages, the row Pages before the draft reads "not known: no compile was made before the draft".
8. In `check_limits.py` a line that holds only spaces or tabs is an empty line at the ends of a field's text. A file with form fields that all have limits in pages is not read.
9. The not-checked reasons are worded `no file <path> exists`, `grant-fields.md has no heading for it` and `grant-fields.md has no text under its heading`.
10. The stop "A file of form-field texts that exists" is raised only when the `grant-fields.md` that stands is another file than the one the user named.
11. The records in the run folder are named `field-texts-report.md` and `grant-fields-before.md`.
12. The sentence on a reference list set by hand is in the closing message of `draft`, which is the run that adds cited text and has the citation report to name the sources from.
13. In a draft of a form field the findings the user picks are written by the draft writer into `grant-fields.md`, with no patch, and the count runs again.

## User-visible changes

| Before | After |
|---|---|
| The compile took the engine rule of `paper`, XeLaTeX when nothing named another | The engine is read from the application: its `% !TEX program =` line, its own log, its packages, else pdfLaTeX; the message names it |
| `draft` gave no page count to the roles | `config.md` holds Pages before the draft and Page limit, and the closing message gives the count before and after |
| `/grant review <main.tex>` | `/grant review <main.tex> [<file> ...]`; the reviewer reads this run's PDF, `grant-fields.md` and the further files |
| Citation style default: `\bibliographystyle`, else IEEE | `\bibliographystyle`, then the form of a list set by hand, else IEEE |
| A replaced font was not reported | The log's font lines stand in `checks.md` and in the closing message |
| A one-section draft was checked and reviewed on the whole application | It is checked and reviewed on that section |
| Form-field texts in `form-fields.md` between markers, the Field cell a marker key | `grant-fields.md`, one `## <Field>` heading per form field, the Field cell the form's own name |
| `check_limits.py <config> <pdf> <main.tex>` needed a log for a page limit | `-` as `<pdf>` prints `not checked: (whole document): no compile was made` and counts the rest |
| No `latexmk`: `check_limits.py` not run | It runs with `-` |
| `/grant config` asked three questions | It also asks for a file of field texts and makes `grant-fields.md` from it |
| No draft of a form field | `/grant draft <application folder> field <field> [<materials>]` |
| `check_limits.py`: `not checked: <field>: no form-fields.md stands beside the .tex` | `not checked: <field>: no file <path> exists`; two new errors with exit 2 |

## Wrong or impossible in the brief

1. Item 7.6 has the session run `check_limits.py` with `-` after a draft of a form field, and gives the draft writer "the main `.tex` when it exists". `check_limits.py` reads `<main.tex>` in every run (`section_lines` calls `document_body(main_tex)`), and item 7.4 keeps its three arguments, so with no main `.tex` the script exits 2. The skill now says that with no main `.tex` the script is not run and the closing message says the field's limit was not checked ("draft of a form field" item 4). Counting a field with no main `.tex` needs a ruling on what the script prints for the Sections rows then.
2. Item 7.6 drops only the questions on the citation check from the intake of a draft of a form field. The questions on the `.bib`, the citation style and the `.docx` are therefore still asked, though that run cites nothing and makes no `.docx`. Built as the brief says (`references/intake.md`, "draft of a form field").
3. `docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md`, line 7, names `form-fields.md` inside a path of one application. The file is outside this step's paths and was not changed. Found with `grep -rn 'form-fields' docs README.md skills utils`.
4. The `paper` skill's "Agent prompts" says a direction never narrows a role's page. Item 6.1 has the direction keep the citation compliance agent's judging to one section. Built as the brief says.

## Repair round 1

Every finding of `.scratch/8-grant/agents/reviews/1b-refuter.md` is closed as ruled. The parts above that this round replaces: point 1 and point 2 of "Wrong or impossible in the brief", judgment calls 10 and 12, the row 7.6 of the table, and the line counts of the files named below. Paths are under `skills/academic/grant/` unless they start with `docs/`.

The new test's first run, on the script as it stood before this round's change, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_limits.test.sh`:

- `L30 no main .tex (2, [], ["error: the .tex /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-limits-test.h0B3ZF/l30/main.tex cannot be read: [Errno 2] No such file or directory: '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//check-limits-test.h0B3ZF/l30/main.tex'"])`
- `FAIL: check_limits.py does not hold the behaviour above`
- The second check of L30, a missing `<main.tex>` with a PDF path, is a behaviour the change keeps: it printed no line in that run, and it passes after the change.

| Finding | Place changed | What shows it closed |
|---|---|---|
| Spec 1 | `SKILL.md`, `config` item 2 (the stop is raised when a `grant-fields.md` stands, "also when the file that stands is the file the user named"), item 6 (the copy to `field-texts-source.md` with `cp` and `cmp`, the agent given the copy, `shasum` on the copy), item 7 (the message names the copy's path), the Stops row, the Rules list of the run folder; `agents/field_texts_agent.md`, "What you are given" | Read: `grep -n 'field-texts-source' skills/academic/grant/SKILL.md` gives the three places |
| Spec 2 | `SKILL.md`, `revise` item 5: "With a reference list set by hand, the message holds the sentences and the keys that `draft` item 11 gives for such a list." | Read |
| Spec 3 | `SKILL.md`, `draft` item 11: the session finds the keys with `grep`, each key a cite command names in the `new_text` of the run's patches, or in a `main.tex` the run wrote whole, for which the file that holds the list has no `\bibitem{<key>}`. The citation agent's direction in item 6 is unchanged | Read |
| Spec 4 | `templates/check_limits.py`, `section_lines` and the head comment (the reading of `<main.tex>`, the reason "no main .tex exists", the errors); `templates/check_limits.test.sh`, L30, its head comment and PASS line; `docs/dev/scripts.md` and `docs/dev/building.md`, the rows of `check_limits.py`; `SKILL.md`, "draft of a form field" item 4, which now always runs the script | L30, failing line above; the PASS line below |
| Spec 5 | `SKILL.md`, "draft of a form field" item 3: the direction replaces every piece that bounds what the agent writes, each named by what it says, the rule on files outside the run folder among them | Read against the three pieces of the `paper` skill's "Agent prompts" |
| Standards 1 | `SKILL.md`, Rules: the bullet on a role's page names its two exceptions | Read |
| Standards 3 | `SKILL.md`, Rules: "A form field is plain text, written and reviewed under the prose standard alone."; "draft of a form field" item 3, the direction's sentence on the prose standard | Read |
| Standards 2 | `SKILL.md`, Stops, row "The intake": `"draft of a form field" item 2` added | Read |
| Standards 4 | `SKILL.md`: `config` item 6 (the two `cp` rules, the stop and the correction, the two `shasum` rules, each a bullet), `draft` item 2 (the count with no compile, and the two rows), "draft of a form field" item 4 (the call, and the path with no main `.tex`) | Read |
| Behaviour 2 | `SKILL.md`, "draft of a form field" item 2; `references/intake.md`, "draft of a form field": three questions, and fixed values for Citation Format, Output Format, Existing Materials and the rows of the citation check | Read |
| Behaviour 1 | This report, the row below | |
| LuaLaTeX before XeLaTeX | Unchanged, as ruled | |

User-visible changes, added to the table above:

| Before | After |
|---|---|
| `revise`, the row Citation Format of `config.md`: the style of the `\bibliographystyle` line of the main `.tex`, or "none stated" | The style of the `\bibliographystyle` line; else the form of a reference list set by hand; else "IEEE, a numbered style". An application with neither, such as one that sets its references with `biblatex`, now gets IEEE where it got "none stated" |
| `check_limits.py` with a `<main.tex>` that does not exist: exit 2 | With `-` as `<pdf>`: `not checked: <name>: no main .tex exists` for each Sections row with a limit, and the form fields counted. With a PDF path: exit 2, as before |
| A draft of a form field asked every question of `draft` but those on the citation check | It asks for the materials, the language and the closing review only |

The checks of "Verify before you report", rerun after the round, as printed:

1. `sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1`: `PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, missing for a required heading the .tex lacks or holds only on a commented line, out of order for a heading moved, absent for a heading that is not required, and not in the config for a heading the config does not name; it reads the files the .tex brings in, a name without its extension among them, matches a heading whatever its case and spacing, prints no line for a subsection, reads paths that hold a space, and exits 2 with one error line for a config with no Sections table, for a brought-in file that does not exist, for a Required cell that is neither yes nor no, for a file that brings itself in and for a Sections table that lacks a column`
   `sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1`: `PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one included, counts a section's words and characters without its comments, command names, citations, labels and figure files and with the text inside braces, after an escaped percent sign, under a subsection and in a brought-in file, counts the whole document and a form field under its heading in grant-fields.md, with a line break as one character under either line ending, without the empty lines at both ends, up to the next heading, with a deeper heading, after a byte-order mark and with a space after the heading, prints over and exits 1 past a limit, prints not checked for a section's limit in pages, a section the .tex lacks, a form field with no file, no heading or no text, a page limit with - as the PDF and every section's limit with - as the PDF and no main .tex, and exits 2 with one error line for a unit or a limit it cannot read, for a page limit with no log or no page count, for a main .tex that does not exist beside a PDF path and for a grant-fields.md that is not UTF-8 or holds a heading twice`
   `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
   The character-set check over the changed files: no output, exit 0.
2. `grep -rn 'form-fields\|<!--F' skills/academic/grant`: no output, exit 1.
3. The frontmatter command: `grant 1022 1.0.0`.
4. `grep -n '^## ' skills/academic/grant/SKILL.md`: `12:## Quick start`, `24:## Use instead`, `33:## What it reads`, `52:## Steps`, `338:## Stops`, `359:## Anti-patterns`, `371:## Rules`.
5. `git status --short skills/academic/paper skills/academic/writing`: no output.
6. `python3 docs/figures/gen_figures.py`: exit 0; `git status --short docs/figures`: ` M docs/figures/gen_figures.py` and ` M docs/figures/grant.svg`. The figure's note needed no change in this round.
7. The new and changed bullets were read against the list and sentence rules. The bullet of "draft of a form field" item 3 that names the three replaced pieces, and the `draft` item 11 bullet on the keys, run past 20 words, since each holds one list.

Line counts after the round: `SKILL.md` 386, `references/intake.md` 130, `agents/field_texts_agent.md` 44, `templates/check_limits.py` 259, `templates/check_limits.test.sh` 272, `docs/dev/scripts.md` 49, `docs/dev/building.md` 41. The other files are as listed above.

Judgment calls of this round: the copy of a user's file that is the standing `grant-fields.md` is named `field-texts-source.md`; with no main `.tex` the call of `check_limits.py` gives the path `main.tex` in the application's folder; the fixed rows of a draft of a form field read "not applicable: a form field is plain text and cites nothing" for Citation Format and "Plain text in `grant-fields.md`" for Output Format.
