# Step 1b refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/8-grant-1b, base b683b68)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
PASS: check_sections.py prints ok for each heading of the config that the .tex holds in the config's order, missing for a required heading the .tex lacks or holds only on a commented line, out of order for a heading moved, absent for a heading that is not required, and not in the config for a heading the config does not name; it reads the files the .tex brings in, a name without its extension among them, matches a heading whatever its case and spacing, prints no line for a subsection, reads paths that hold a space, and exits 2 with one error line for a config with no Sections table, for a brought-in file that does not exist, for a Required cell that is neither yes nor no, for a file that brings itself in and for a Sections table that lacks a column

env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
PASS: check_limits.py reads the page count of the log beside the PDF, a statement of one page and a broken one included, counts a section's words and characters without its comments, command names, citations, labels and figure files and with the text inside braces, after an escaped percent sign, under a subsection and in a brought-in file, counts the whole document and a form field under its heading in grant-fields.md, with a line break as one character under either line ending, without the empty lines at both ends, up to the next heading, with a deeper heading, after a byte-order mark and with a space after the heading, prints over and exits 1 past a limit, prints not checked for a section's limit in pages, a section the .tex lacks, a form field with no file, no heading or no text and a page limit with - as the PDF, and exits 2 with one error line for a unit or a limit it cannot read, for a page limit with no log or no page count and for a grant-fields.md that is not UTF-8 or holds a heading twice

env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
(exit 0)

The character-set check over README.md, docs/dev/building.md, docs/dev/scripts.md, docs/figures/gen_figures.py, docs/figures/grant.svg and every file under skills/academic/grant/ (SKILL.md, agents/, references/, templates/, examples/)
(no output, exit 0)

grep -rn 'form-fields\|<!--F' skills/academic/grant
(no output, exit 1)

python3 -c 'import yaml; d=yaml.safe_load(open("skills/academic/grant/SKILL.md").read().split("---")[1]); print(d["name"], len(d["description"]), d["metadata"]["version"])'
grant 1022 1.0.0

grep -n '^## ' skills/academic/grant/SKILL.md
12:## Quick start
24:## Use instead
33:## What it reads
52:## Steps
326:## Stops
347:## Anti-patterns
359:## Rules

git status --short skills/academic/paper skills/academic/writing
(no output)

git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/grant.svg

python3 docs/figures/gen_figures.py
not run: the script writes files, and the reviewer writes none. See "Declined to judge".

Commands the builder's report quotes as evidence:

grep -rn 'form-fields' docs README.md skills utils
one hit, docs/adr/0044-a-funder-config-lives-with-the-application-and-grant-ships-no-funder-s-facts.md:7, as the report says

wc -l over the files of the report's list
373 SKILL.md, 56 config_drafter_agent.md, 63 criteria_reviewer_agent.md, 44 field_texts_agent.md, 114 intake.md, 71 funder_config_template.md, 20 criteria_review_template.md, 257 check_limits.py, 263 check_limits.test.sh, 54 fwo-postdoc-2027.md, 255 README.md, 41 building.md, 49 scripts.md, 2310 gen_figures.py, 74 grant.svg: each equals the report's count

git status --short (whole worktree)
13 files modified and skills/academic/grant/agents/field_texts_agent.md untracked, all inside the brief's "Paths this step writes"; examples/fwo-postdoc-2027.md unchanged, as the report says

git show b683b68:skills/academic/grant/templates/check_limits.py | grep -n 'no form-fields.md stands\|cannot be read, and the page limit'
133 and 193: the base script holds the two messages the report's failing lines quote
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1.1: holds, SKILL.md Steps 9, the five-bullet engine list; LuaLaTeX stands before XeLaTeX, which the report lists as judgment call 4.
- 1.2: holds, Steps 9 ("Write the engine and the rule that gave it into `checks.md`", "The message that ends a run that compiled names the engine"), named from `draft` 11, `revise` 5, `review` 3, `check` 1.
- 1.3: holds, Steps 9, "`latexmk <flag> -interaction=nonstopmode -halt-on-error '<main file name>'`".
- 1.4: holds, Steps 9 "Every compile of the run takes that engine"; `draft` item 10.
- 1.5: holds, `draft` item 7.
- 2.1: holds, `draft` item 2 and Steps 9 ("`<k>` is 0 for the compile before a draft").
- 2.2: holds, `draft` item 2; `references/intake.md`, "draft", the table "The session adds these rows".
- 2.3: holds, `draft` items 2 and 5.
- 2.4: holds, `draft` item 11.
- 3.1: holds, Quick start; "What it reads" 9.
- 3.2: holds, `review` items 1 to 3.
- 3.3: holds, `review` item 2.
- 3.4: holds, `agents/criteria_reviewer_agent.md`, "What you are given" and "The file"; the rule on a criterion the files hold nothing on is unchanged in "Scoring a criterion"; `templates/criteria_review_template.md`, "Files read".
- 3.5: holds, `review` item 3's done criterion.
- 4.1: holds, `references/intake.md`, "draft" and "revise".
- 4.2: holds, `draft` item 6.
- 4.3: violated, Spec 2 and Spec 3.
- 5.1: holds, `draft` item 7.
- 5.2: holds, Steps 9.
- 5.3: holds, Steps 9, `draft` 11, `revise` 5, `check` 1.
- 6.1: holds, `draft` item 6; see Standards 1 for the sentence it now contradicts.
- 6.2: holds, `draft` item 9; `/writing` takes a `.tex` with no preamble, since the `writing` skill's Steps 3 and 4 ask only that the file and the files it inputs exist.
- 6.3: holds, `draft` items 6 and 9; `revise` item 4.
- 6.4: holds, `draft` item 9.
- 7.1: holds, "What it reads" 10; the grep for `form-fields` and `<!--F` prints nothing.
- 7.2: holds, `templates/funder_config_template.md`, "The file of form-field texts"; head comment of `check_limits.py`.
- 7.3: holds, the template, `agents/config_drafter_agent.md`, "Writing the config".
- 7.4: holds, `check_limits.py:186-238` read against each bullet, and L10, L12, L13, L18 to L29 of the test.
- 7.5: violated, Spec 1.
- 7.6: violated, Spec 4 and Spec 5.
- 7.7: holds, Steps 9.
- 7.8: holds, the sentence above the Stops table counts nine rows that wait, one that passes a stop on and four refusals, which the table has; each mode's line names the stops its items reach; Rules. See Standards 2 for one cell of the table.
- 8.1 to 8.7: holds, `draft` item 1 and `references/intake.md` (8.1), Steps 7 (8.2), `draft` item 2 (8.3), `draft` item 7, whose three keys stand in the field map of the `paper` skill's `agents/formatter_agent.md`, "Format Profile" (8.4), Steps 9 (8.5), Rules (8.6), Steps 9 (8.7).
- Places 1: holds, `grant 1022 1.0.0` and the Quick start.
- Places 2: holds, `docs/dev/scripts.md` and `docs/dev/building.md`, the rows of `check_limits.py`.
- Places 3: holds by reading, the note of `grant()` and the same sentences in `docs/figures/grant.svg`; the script's run is under "Declined to judge".
- Places 4: holds, `README.md`, the row of `grant` and the sentence on the agents.
- Places 5: holds, the example is unchanged and its "Form fields" table holds no row.

Cases of the brief's "Cases":

- `## Title` of 126 characters against 240 and against 100: met, L12.
- A text of two lines, empty lines at both ends: met, L12 and L18.
- A text followed by another `## ` heading: met, L19.
- A config field with no heading: met, L10.
- No `grant-fields.md`: met, L13.
- A `### ` line inside a field: met, L20.
- Windows line endings: met, L21.
- A byte-order mark: met, L22.
- A heading with no text: met, L23.
- Not valid UTF-8: met, L24.
- The same heading twice: met, L25.
- `-` as `<pdf>` with a page limit and a field: met, L26.
- `-` as `<pdf>` with a section over its limit: met, L27.
- A trailing space in the heading line: met, L28.
- A limit in words: met, L29.
- The cases the test already holds: met, the PASS line.
- No engine package, no line, no log, `latexmk -pdf`: met, Steps 9.
- `fontspec`, `latexmk -xelatex`: met, Steps 9.
- A log that starts `This is XeTeX`: met, Steps 9, the log bullet stands second.
- `% !TEX program = lualatex`: met, Steps 9, first bullet.
- 9 pages under a limit of 10: met, `draft` items 2 and 5.
- 11 pages of 10 after 9 before: met, `draft` item 11.
- `/grant review main.tex cv.pdf letter.pdf` and a missing file: met, Quick start, "What it reads" 9, `review` item 2.
- A `thebibliography` list: met, `references/intake.md`, "draft"; `draft` item 6.
- One section with an `\input` line, and the whole application: met, `draft` items 6 and 9.
- `/grant config` with a file in another format: partial, the user's file keeps its `shasum` only when it is not the `grant-fields.md` of the application's folder, Spec 1.
- `/grant draft <folder> field Title`: partial, with no main `.tex` in the folder `check_limits.py` does not run, Spec 4.
- `/grant draft <folder> field Nothing`: met, "draft of a form field" item 1.
- `/grant draft <folder> notes.md`: met, Steps 1 sends only a call whose second argument is the word `field` to the other items.
- A runner without `latexmk`: met, Steps 9.
- The grep for `form-fields` and `<!--F`: met, no output.
- No file under `paper/` or `writing/` changed: met, `git status --short` prints nothing for them.
- No file names a file, a folder, a person or a document of one application: met, read of every changed shipped file and a grep of `skills/academic/grant` and `README.md` for the author's name, the application's folder names and paths outside the repository; the template's example says it is made up.

## 1. Spec

- 1. `skills/academic/grant/SKILL.md`, Steps, "config" items 2 and 6: "When the user named a file of field texts and a `grant-fields.md` that is another file stands in the application's folder, that is the stop" and "A file in another format goes to the field texts agent (Steps 7), given `agents/field_texts_agent.md`, the funder config, `templates/funder_config_template.md`, the user's file, the path `grant-fields.md` in the application's folder"; what is wrong: the stop is raised only when the standing file is another file than the one named, where the brief raises it for a `grant-fields.md` that already stands, and item 6 then gives the agent the user's file and the same path to write whole (`agents/field_texts_agent.md`, "Writing the file": "Write `grant-fields.md` whole"); failure scenario: the user keeps the form's texts in `grant-fields.md` in the application's folder with headings that are not the config's Fields letter for letter, such as `## Abstract (max 2000)`, and names that file at the intake; no stop is raised, the grep of item 6 finds the file in another format, the agent overwrites the user's file, the parts it matched to no field are gone from disk, and the run only names a `shasum` that differs; verdict: item 7.5 violated, case "`/grant config` with a file of field texts in another format" partial.
- 2. `skills/academic/grant/SKILL.md`, Steps, "revise" item 5: "The message says that the run checked no citation, and names `/paper citation-check <main.tex>`."; what is wrong: the sentence of item 4.3 on a reference list set by hand stands only in `draft` item 11, while item 4 of the brief covers `revise` (4.1 changes its row) and a `revise` writer adds cited sentences when a comment asks for one; failure scenario: `/grant revise` on an application whose list is a `thebibliography` environment, a comment asks for a source, the writer adds `\cite{key}`, the PDF prints an undefined citation, and the closing message says nothing of a list set by hand; verdict: item 4.3 violated. The report lists this as judgment call 12.
- 3. `skills/academic/grant/SKILL.md`, Steps, "draft" items 6 and 11: "each key the `.tex` cites and the `.bib` lacks is listed with whether the list holds an item for it" and "names each such source"; what is wrong: no item gives the session the sources the message is to name. The draft writer cites only entries of the `.bib` (`draft` item 5), so a source the new text cites is in the `.bib` and is not among the keys the direction has listed; what the message needs is each key the new text cites for which the list set by hand holds no item; failure scenario: a one-section draft cites three `.bib` entries the hand-set list lacks, the citation report lists no key (the `.bib` has all three), and the session either names no source or builds the list by a route the skill does not state; verdict: item 4.3 violated. The brief's 4.2 words the listing this way; the gap is between 4.2 and 4.3.
- 4. `skills/academic/grant/SKILL.md`, Steps, "draft of a form field" items 4 and 6: "With no main `.tex` the script is not run, since it reads the main `.tex`, and the message that ends the run says that the field's limit was not checked." and "its count against its limit as `check_limits.py` printed it"; what is wrong: item 7.6 has the session run `check_limits.py` with `-` in every draft of a form field, and the script needs `<main.tex>` (`check_limits.py:162`, `document_body(main_tex)`); item 6 then asks for a count the run does not have; failure scenario: the user makes the config, then drafts the field Title before any `main.tex` exists; the field is written, no script counts it, the one resend for a field over its limit cannot happen, and the only count is the writer's own; verdict: item 7.6 violated, case "`/grant draft <folder> field Title`" partial. The report hands this to the orchestrator as point 1; the brief's 7.4 and 7.6 cannot both hold as written.
- 5. `skills/academic/grant/SKILL.md`, Steps, "draft of a form field" item 3: "The direction replaces, for this start, the two pieces of the `paper` skill's \"Agent prompts\" on the file the agent writes: the one file it writes is `grant-fields.md` in the application's folder, and it writes no patch."; what is wrong: a third piece of that list stays in the prompt, the `paper` skill's "Agent prompts": "the rule that the agent writes no script and runs none of its own, and writes no file outside the run folder besides its patch files and the files its page names". `grant-fields.md` is outside the run folder, is no patch file, and the draft writer's page does not name it; failure scenario: the draft writer's prompt holds both sentences, and it writes the field into the run folder or ends without writing, so item 3's done criterion fails; verdict: item 7.6 violated. The brief names "the two pieces", so the build follows it.

## 2. Proof

- none. The tests of `check_limits.test.sh` were read: each of L10, L12, L13 and L18 to L29 compares the script's whole output and exit status with the expected lines on a made-up file, and none asserts over source text or a constant. L24 and L25 assert one `error:` line and exit 2 without its words; the configs they use are the valid one of the other cases.

## 3. Standards

- 1. `skills/academic/grant/SKILL.md`, Rules, and Steps, "draft" item 6: "A role's page of the `paper` skill holds for the role whole, and this skill restates none of it." against "the agent judges the cited sentences of that section only and keeps its results check to that section"; what is wrong: `docs/dev/change-standard.md`, rule 19, a change leaves no two statements that contradict each other. The citation compliance agent's page checks the whole manuscript, and the `paper` skill's "Agent prompts", which Steps 7 names for a start's prompt, says "The direction never narrows the role's page"; failure scenario: a session that reads the Rules bullet and that sentence writes no narrowing direction, or the agent given its page and the direction checks every cited sentence of the application, which is the cost the ruling "What the first run showed" ends. The brief asked for 6.1; the Rules bullet is the place to name the two directions that narrow a page (this one and the one of "draft of a form field" item 3).
- 2. `skills/academic/grant/SKILL.md`, Stops, row "The intake": "`config` item 1, `draft` item 1, `revise` item 1"; what is wrong: `docs/dev/change-standard.md`, rule 14, a sentence the change makes false. "draft of a form field" item 2 runs the intake and its line "Stops this mode can reach" lists the intake, and the row's When cell does not name it, while the row "The writing findings" was given its item; failure scenario: a reader who looks up where the intake is raised finds no draft of a form field, and a later reviewer takes the mode's line for the error.
- 3. `skills/academic/grant/SKILL.md`, Rules, and Steps, "draft of a form field" items 3 and 5: "Every role of `paper` writes under the manuscript prose standard, as that skill's \"Agent prompts\" gives it, so a grant application is held to the same prose rules as a manuscript." against "invoke `/writing` through the Skill tool on a copy of the field's text ... The copy is `field.txt`"; what is wrong: `docs/dev/change-standard.md`, rule 19. `/writing` holds a `.txt` to the prose standard alone (`skills/academic/writing/SKILL.md`, "What it reads" 1: "A manuscript is a `.tex` draft"), so the field is written under one standard and reviewed under another; failure scenario: the writer sets a summary of 150 words as one paragraph of six sentences with accented names, as the manuscript prose standard allows; `/writing` reports the paragraph length and the non-ASCII characters; the user replies `all`, and the writer is sent to change text its own standard allows. The brief's premise on ADR 0026 chose `.txt`, so the choice is the orchestrator's or the user's.
- 4. `skills/academic/grant/SKILL.md`, Steps, "config" item 6, "draft" item 2 and "draft of a form field" item 4: "A file in the format that stands elsewhere is copied with `cp` ... A file in the format that is that `grant-fields.md` is left as it is.", "The session adds two rows to `config.md`: ... With no `main.tex`, or no limit in pages, no compile is made and the count is ...", "Run `check_limits.py` as Steps 9 gives its call ... With no main `.tex` the script is not run"; what is wrong: `docs/dev/skill-layout.md`, "Lists and tables", one rule per bullet: each bullet holds two rules that can each be broken while the other holds, where the second sentence is no qualifier of the first; failure scenario: a reviewer of a later diff to one of these bullets cannot tell which of its two rules the diff changes. The report's check 7 names two of the three places and calls the second sentence a qualifier.

## 4. Behaviour

- 1. `skills/academic/grant/references/intake.md`, "revise", row Citation Format: "The first of these that the main `.tex` gives: ...; else IEEE, a numbered style"; what is wrong: the row read "or \"none stated\"" at the base, and the report's table of user-visible changes gives the before and after of the `draft` default only; failure scenario: `/grant revise` on an application that sets its references with `biblatex` in an author-year style: `config.md` now tells the draft writer the citation format is IEEE, a numbered style, where it said "none stated". The brief's 4.1 asks for this value; the report should state it.
- 2. `skills/academic/grant/references/intake.md`, "draft of a form field": "The five questions on the citation check are not asked"; what is wrong: the questions on the `.bib`, the citation style and the `.docx` are still asked, and the closing message of "draft of a form field" item 6 says nothing of an answer that has no effect; failure scenario: the user answers yes to a `.docx` in a draft of the field Title; the row Output Format reads DOCX, no `.docx` is made, and no message says so. The report states this as point 2 of "Wrong or impossible in the brief" without the before and after.

## The four points of the report's "Wrong or impossible in the brief"

- Point 1, no `check_limits.py` run with no main `.tex`: yes, the build leaves a defect a user meets: a field drafted before `main.tex` exists is counted by no script, and item 6 of the mode asks for a line the run does not have (Spec 4). It needs a ruling on what the script prints for the Sections rows with no `.tex`.
- Point 2, the `.bib`, citation style and `.docx` questions in a draft of a form field: yes, a small one: three questions whose answers change nothing, and a yes to the `.docx` is dropped without a word (Behaviour 2).
- Point 3, ADR 0044 line 7 names `form-fields.md`: no. The line is the record's Context, it names a file of one application and not a file of the skill, `docs/adr/` is not among the shipped folders of the rule in `CLAUDE.md`, and no run reads it.
- Point 4, the direction that keeps the citation compliance agent to one section against "The direction never narrows the role's page": yes, a small one, and it is inside `grant` too: its Rules bullet says a role's page holds whole (Standards 1). The same clash holds for the draft writer's prompt in a draft of a form field (Spec 5).

## Declined to judge

- `python3 docs/figures/gen_figures.py`, check 6 of the brief: not run, since it writes every figure file and the reviewer writes none. Read instead: the note of `grant()` and `docs/figures/grant.svg` hold the same new sentences (`grep -c 'field texts' docs/figures/grant.svg` prints 2). The landing's run settles that the committed SVG equals the script's output.
- The failing lines of the 16 new tests on the unchanged tree: not rerun, since that takes a copy of the base script written to disk. The base script holds the two messages the quoted lines carry (`git show b683b68:...check_limits.py`, lines 133 and 193).
- Whether a session follows the changed `SKILL.md` on an application: a read cannot settle it; step 2's run does.
- The order LuaLaTeX before XeLaTeX in Steps 9 (the report's judgment call 4): the brief's bullet names both in one line with XeLaTeX first; which wins for a `.tex` that loads both `fontspec` and `luacode` is the orchestrator's call.
- That the findings of a form field's `/writing` review are written into `grant-fields.md` with no patch (judgment call 13), against ruling D5, "applies the ones the user picks as patches, with `paper`'s patch scripts": the patch scripts read `.tex` files, so whether D5 holds for a form field is the user's call.
- Whether `git` ignores a file the step wrote: `git status --short` shows no ignored file; `git status --short --ignored` would settle it.

Reviewer usage: a30d052b6fe70f7e5, claude-fable-5-2, 218,024 tokens, 25 tool uses, 7.2 minutes.

## Repair round 1, refuted

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
PASS: check_sections.py prints ok for each heading of the co... (line cut by me to 60 characters; it begins as the first report's line does)

env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
PASS: check_limits.py reads the page count of the log beside... (cut by me to 60 characters; the full line holds the L30 clause "a page limit with - as the PDF and every section's limit with - as the PDF and no main .tex ... for a main .tex that does not exist beside a PDF path")

env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)

LC_ALL=C grep -n '[^ -~<tab>]' README.md docs/dev/building.md docs/dev/scripts.md docs/figures/gen_figures.py docs/figures/grant.svg and every file under skills/academic/grant
(no output)

grep -rn 'form-fields\|<!--F' skills/academic/grant
(no output, exit 1)

python3 -c 'import yaml; ...SKILL.md frontmatter...'
grant 1022 1.0.0

grep -n '^## ' skills/academic/grant/SKILL.md
12 Quick start, 24 Use instead, 33 What it reads, 52 Steps, 338 Stops, 359 Anti-patterns, 371 Rules   (the builder's report gives the same lines)

git status --short skills/academic/paper skills/academic/writing
(no output)

git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/grant.svg
grep -c 'field texts' docs/figures/grant.svg  -> 2

python3 docs/figures/gen_figures.py
not run (see Declined to judge)

for each path of files.txt: diff -u snapshot worktree
changed this round: docs/dev/building.md, docs/dev/scripts.md, SKILL.md, references/intake.md, templates/check_limits.py, templates/check_limits.test.sh, agents/field_texts_agent.md. cmp reports README.md, docs/figures/*, config_drafter_agent.md, criteria_reviewer_agent.md, criteria_review_template.md, funder_config_template.md unchanged. No path outside files.txt changed since the snapshot (git status --short lists the same 14 paths as files.txt).

builder's quoted commands: grep -n 'field-texts-source' SKILL.md -> lines 151, 159, 383 (and the Stops/Rules places by reading); line counts SKILL.md 386, check_limits.py 259, check_limits.test.sh 272 equal the report's.
Stops table: 9 rows wait (mode, intake, config, config exists, file exists, form fields, which config, outline, writing findings), 1 passes a paper stop on, 4 refusals; the sentence above the table says so.
```

### Verdicts

Items, for the whole diff since b683b68:

- 1.1 to 1.5: holds, SKILL.md Steps 9 and `draft` items 7 and 10; unchanged this round; LuaLaTeX before XeLaTeX stays as ruled.
- 2.1 to 2.4: holds, `draft` items 2, 5, 11; the round only split the bullet of item 2 into two bullets with the same content.
- 3.1 to 3.5: holds, unchanged this round.
- 4.1: holds, `references/intake.md` "draft" and "revise".
- 4.2: holds, `draft` item 6.
- 4.3: holds, `draft` item 11 (the sentence, then the keys found with `grep` against `\bibitem{<key>}`) and `revise` item 5 (the same sentences and keys).
- 5.1 to 5.3: holds, unchanged.
- 6.1 to 6.4: holds, `draft` items 6 and 9; the Rules bullet now names this narrowing as an exception.
- 7.1 to 7.4: holds; 7.4 read against `check_limits.py` `section_lines` and L10 to L30.
- 7.5: holds, `config` items 2 and 6 and the Stops row (stop raised whenever a `grant-fields.md` stands; copy to `field-texts-source.md` with `cp` and `cmp`; agent given the copy; message names the copy's path). See Behaviour 1 for a statement the report lacks.
- 7.6: holds, "draft of a form field" items 2 to 4: the script is always run, with `main.tex` in the application's folder when none exists, and the direction replaces the three pieces of the `paper` skill's "Agent prompts" (lines on "the file the agent writes ... only file it writes besides the files of a patch", "the path, manifest and patch path of each file", "writes no file outside the run folder besides its patch files and the files its page names"). Read against `skills/academic/paper/SKILL.md`, "Agent prompts".
- 7.7: holds, Steps 9.
- 7.8: holds, Stops count sentence, the row "The intake" now names "draft of a form field" item 2, Rules lists `grant-fields.md` and the run folder's list holds `field-texts-source.md`.
- 8.1 to 8.7, Places 1 to 5: hold, as in the first report; Places 2 now also name the missing-`.tex` behaviour (scripts.md, building.md).

Cases:

- All cases of the first report that were met stay met (L10, L12, L13, L18 to L29: the PASS line of the test).
- `/grant config` with a file in another format: met, `config` item 6, the copy and `shasum` on the copy.
- `/grant draft <folder> field Title` before any `main.tex`: met, item 4 runs the script with `main.tex` in the application's folder; L30 (`not checked: ... no main .tex exists` and `ok: Title: 126 characters of 240`, and exit 2 with a PDF path), read against `section_lines` in `check_limits.py`.
- A reference list set by hand, draft and revise: met, `draft` item 11 and `revise` item 5.
- No file names a private file, folder or person: met, grep of the added lines for the author's name, `/Users`, years and an application's name finds nothing.

### Findings

Closure of the first report's findings:

- Spec 1: closed. `config` item 2 raises the stop when a `grant-fields.md` stands "also when the file that stands is the file the user named"; item 6 copies it to `field-texts-source.md` in the run folder with `cp`, checks with `cmp`, gives the agent the copy; `shasum` runs on the copy; item 7 names the copy's path. My reading reproduces it.
- Spec 2: closed. `revise` item 5: "With a reference list set by hand, the message holds the sentences and the keys that `draft` item 11 gives for such a list."
- Spec 3: closed. `draft` item 11 gives the `grep` over cite commands in the `new_text` of the run's patches (the patch format has `new_text`, `revision_patch_protocol.md`) or in a `main.tex` the run wrote whole, against `\bibitem{<key>}` in the file that holds the list.
- Spec 4: closed, not by removing a check. `check_limits.py`: `if pdf == NO_COMPILE and not os.path.exists(main_tex): return [not checked ... no main .tex exists]` for each Sections row with a limit; `field_lines` still runs; a real PDF path keeps the error. L30 reads both outputs whole; its first failing run is quoted (exit 2 error line). The first failing run was not rerun by me (see Declined).
- Spec 5: closed, three pieces named by what they say.
- Standards 1: closed, Rules bullet names two exceptions (but see Standards 1 below).
- Standards 2: closed, Stops row "The intake" holds "draft of a form field" item 2.
- Standards 3: closed in Rules and in the writer's direction (but see Standards 1 below).
- Standards 4: closed for the three places (`config` item 6, `draft` item 2, "draft of a form field" item 4); each bullet holds one rule.
- Behaviour 1: closed, the report's before and after row for `revise` Citation Format.
- Behaviour 2: closed for the questions (three) and the fixed rows; see Spec 1 below.

New findings:

## Spec

- `skills/academic/grant/references/intake.md`, "draft of a form field": "The agent writes `config.md` with the rows of "draft", these rows holding fixed values:" followed by a table of 9 rows; what is wrong: the ruling says the other rows have fixed values, and the rows of "draft" Topic, Research Question, Discipline, Body Language, Closing review and Funder config are in neither the questions table nor the fixed table, so the page gives them no value or source for a form field (in "draft" they come from the materials, the answer or the session); failure scenario: the intake agent, with no source named, asks for a Topic or Discipline of a one-field run, or leaves Body Language empty so the draft writer's language is unset; verdict: item 7.6 holds in behaviour, the text is incomplete (minor).

## Proof

- none. L30 read: both checks compare the whole output and status on made-up files, none asserts over source text.

## Standards

- 1. `skills/academic/grant/SKILL.md`, Rules: "Every role of `paper` writes under the manuscript prose standard, as that skill's "Agent prompts" gives it, so a grant application is held to the same prose rules as a manuscript." directly above "A form field is plain text, written and reviewed under the prose standard alone."; what is wrong: `docs/dev/change-standard.md` rule 19, no two statements that contradict: the first bullet says every role, the second makes the draft writer of a form field an exception without the first saying so (the bullet on a role's page names its exceptions but not this one); failure scenario: a reader or session reading the first bullet sets the manuscript prose standard for the field's writer; the direction for the field then tells it the opposite, and a later edit of one bullet drops the other; verdict: none (standards).

## Behaviour

- 1. `skills/academic/grant/SKILL.md`, Stops row "A file of form-field texts that exists" and `config` item 6: "The user named a file of field texts, and a `grant-fields.md` stands in the application's folder, the named file itself included"; what is wrong: the round's report table of user-visible changes lists three rows (revise Citation Format, `check_limits.py` with no main `.tex`, the form-field intake) and no before and after for this: before, a user who named the application's own `grant-fields.md` was asked nothing and the file was used; now the stop is asked, and a file in another format is copied to the run folder's `field-texts-source.md` and rewritten in place; failure scenario: a user who runs `/grant config` naming their own `grant-fields.md` gets a stop they did not get before and finds their file replaced, with only the closing message naming the copy. verdict: none (behaviour, statement missing).

### Declined to judge

- `python3 docs/figures/gen_figures.py`: not run, it writes files. Read instead: the note of `grant()` and `docs/figures/grant.svg` are unchanged this round (`cmp` against the snapshot), and the Stops table's row count did not change.
- The first failing run of L30 on the pre-round script: not rerun, it needs a copy of the old script written to disk; the builder's quoted line (exit 2, `cannot be read: [Errno 2]`) is what `git show` of the base `section_lines` path would give for a missing file, but I did not run it.
- Whether a session given the changed SKILL.md follows the stop and the copy in a run: a read cannot settle it.
- That `grep` over cite commands finds every cite command form a patch can hold (`\citep`, `\parencite`, `\cite[p.~1]{k}`): the page does not list the forms; a run settles it.

Reviewer usage: a2dd1cafa6974ce55, claude-sonnet-5-5 (one recorded call on claude-opus-5-5), 124,683 tokens, 19 tool uses, 2.0 minutes.

## Closed

- First run, Spec 1 to 5, Standards 1 to 4, Behaviour 1 and 2: closed by the builder in repair round 1, each read as closed by the reviewer over the round.
- Round 1, Spec (the rows of `config.md` in a draft of a form field): fixed at landing in `references/intake.md`.
- Round 1, Standards 1 (the Rules bullet on the manuscript prose standard): fixed at landing in `SKILL.md`, Rules.
- Round 1, Behaviour 1 (the before and after of the stop for a standing `grant-fields.md`): stated in the booking of step 1b in `plan.md`.
