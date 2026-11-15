# Intake

The session reads this page at intake, before any agent starts. Intake is an interview the session holds with the user, since a role agent cannot ask the user anything. The answers are written to `config.md` in the run folder, and every role agent reads that file.

## The interview

- The session asks the questions of the table below that the mode needs, all in one message and numbered, with a default beside each question that has one.
- A question whose answer the call or the manuscript already gives is not asked: the session states the answer and the user confirms it with the rest.
- A plain request (`references/modes.md`) is shown with the mode picked from it and each argument taken from it, for the user to confirm or correct with the rest.
- An argument given in words is shown with the path the session found and the words it came from. When several files fit, the session lists them with the words before the interview, and the user chooses one.
- When an earlier run's `config.md` stands beside the manuscript, the session shows its values as the answers, and the user confirms or changes each.
- An answer that is vague is refined with the user into one that the roles can use, such as a topic into a research question that can be researched.
- A fact the user does not know is recorded as `[GAP: <what is missing>]` in its row, and never filled from the model.
- A user's answer to a later stop is appended to `config.md` under "Decisions", verbatim, by the session.
- The user may change the record as often as the user wants. The session shows it again after each change, and the record the user confirms ends the stop.
- A run continued from an unfinished run (SKILL.md, Steps 5) shows that run's `config.md` for confirmation, and asks only the questions whose rows it lacks.
- A question is asked once. A permission or an answer the record holds is never asked again during the run.

## Questions, marked by mode

The modes are full, outline-only, revision, abstract-only, lit-review, citation-check, disclosure, plan and format-convert, and the calls are draft-review and figures. Plan mode asks only the rows marked for it, since its mentor builds the research question, the discipline and the rest in the dialogue. Format-convert asks only the rows marked for it.

| Row of `config.md` | The question | Asked in |
|---|---|---|
| Topic | What the paper is about. In plan mode the topic may be as rough as a field or an idea. | full, outline-only, lit-review, plan |
| Research question | The question or thesis statement the paper answers, written in full. The literature strategist does not start without one, so full, outline-only and lit-review modes do not go on until the user gives one. A topic is never taken as the question. | full, outline-only, lit-review |
| Paper type | One type of the table below. A manuscript's type is proposed from the manuscript. When the user names none, the type is chosen by the table "Paper type and length" and shown with the reason. In plan mode the row is a structure preference: IMRaD, Literature Review, another of the six types, or "not sure", and "not sure" leaves the structure to the dialogue. In format-convert the type decides the layout of a conference paper, a policy brief and a thesis chapter (`references/formatter.md`, "The paper type"). | full, outline-only, revision, abstract-only, citation-check, draft-review, plan, format-convert |
| Discipline | The discipline and its sub-field. | full, outline-only, revision, abstract-only, lit-review, citation-check |
| Language | The language of the paper. | full, outline-only, revision, abstract-only, lit-review, disclosure |
| Venue | The target journal or conference, "General", or "no venue yet", which keeps the generic AI disclosure statement. In format-convert a venue is a target: the formatter applies its template and required elements. | full, outline-only, revision, abstract-only, disclosure, draft-review, figures, format-convert |
| Venue AI policy | The venue's AI policy text, pasted, for a venue `references/ai-disclosure.md` does not list. | full, disclosure |
| Policy anchor | In disclosure mode, the policy anchor the author targets in place of a venue: `prisma-trAIce`, `icmje`, `nature`, `ieee`, or "none". | disclosure |
| Venue limits | The venue's limits the user states. | full, outline-only, revision, abstract-only, draft-review, figures, format-convert |
| Cover letter | For a journal venue: the article type (Research Article, Review Article or Brief Communication), the editor's name when known, the reason the paper fits the journal in one sentence, suggested reviewers and excluded reviewers with a reason, each optional. | full, format-convert |
| Target formats | One or more of `docx`, `pdf`, `markdown` and `latex`, a citation style of the table below, or a venue. A request that names no target takes Markdown, and the confirmation shows it. A target outside these, such as HTML or Harvard, is asked again with the supported targets listed. A `.bib` given takes one citation style and the targets `docx` and `markdown` only, and is asked again otherwise. | format-convert |
| Format profile | For a target of DOCX, PDF or LaTeX only, the user's layout values: body font and size, caption font, placement and alignment, line spacing (single, 1.5, double or a fixed number of points), margins in centimetres, and table borders (three-line, full grid or none). The session never infers a value. A declined question writes no row, and a value outside this form is asked again. | format-convert |
| Citation style | One style of the table below. For Chicago in format-convert, the form is asked too: notes and bibliography, or author-date. | full, revision, citation-check, figures, format-convert |
| Length | The target word count. | full, outline-only |
| Materials in hand | Which of the materials below the user has: the first eight in every mode that asks this row, and the ninth, Ideas, in plan mode only. Lit-review mode asks for the literature list or `.bib` only, and the figures call for the data or results only. Plan mode asks for all nine, with its question put as literature, data and ideas, and the mentor reads what is held. Format-convert asks for the reference `.docx` and the CSL file of "Materials in hand" below, and for the `.bib` and the venue's template when held. | full, outline-only, revision, lit-review, figures, plan, format-convert |
| Literature search | Whether to skip the search and use the sources given only. Default: no. | full |
| Earlier outputs | Which of the earlier runs' outputs of "Earlier outputs" below to take. | full, outline-only |
| Domain evidence profile | One of the four profiles of "The evidence profile" below. | full, outline-only, lit-review, revision |
| DOI checking | Strict or mark-only. | full, revision, citation-check, lit-review |
| Instructions | A comments file, instructions as text, or none. | revision |
| New references | Whether the run may add references that the manuscript's `.bib` lacks. | revision |
| Numbers from saved results | Whether the run may compute numbers from the project's saved results, and from which files. | revision |
| Figure changes | Whether the run may change figures, and whether it may edit and run the project's figure script or only a copy of it in the run folder. | revision, figures |
| Authors | One row per author: name, affiliation, ORCID and whether the author is the corresponding author. | full, revision, citation-check, disclosure, format-convert when the formatter writes a cover letter |
| Contributions | For each author, the CRediT roles of `references/statements.md` taken, each marked Lead or Supporting. | full, disclosure |
| Funding | One row per funder, or "no funding". | full, disclosure |
| Conflicts of interest | Each conflict, or "none". | full, disclosure |
| Data availability | Open (repository and URL or DOI), restricted (source), on request, or no new data. | full, disclosure |
| Human or patient data | Whether the study used any, and then the approving board, the approval number, the consent obtained and the de-identification applied. | full, disclosure, format-convert when the formatter writes a cover letter |
| AI use | Whether any AI was used, each category of `references/ai-disclosure.md` marked used, not used or uncertain, and the tools with their versions. In disclosure mode the categories come pre-marked from the records of "Disclosure records". | full, outline-only, revision, lit-review, disclosure, format-convert when the formatter writes a cover letter |
| Style profile | Three or more past papers or writing samples, or none. | full, revision, abstract-only |
| Claims not to make | The claims the paper must not make, each as a sentence, or "none". | full, revision, abstract-only, citation-check, draft-review |
| Earlier papers | The authors' earlier papers that the paper may repeat passages of, each as a path, a DOI or a citation, or "none". | full, revision, citation-check |
| Internal only | Whether the user asks for the manuscript as an internal record, such as a record of every attempt, and not as work to publish. Default: no. The session never sets it from the materials. | full, outline-only, revision, abstract-only, draft-review |
| Existing main.tex | Asked only when a `main.tex` stands in the manuscript's folder. The session states that the first draft replaces it and that the original is kept in the run folder as `existing-main.tex`. Its text is read as existing draft sections. | full |
| Earlier run record | The path of the latest earlier `config.md`, when one stands. A paused plan run's `config.md` is the record a continued plan run takes. | every mode |

- A mode that gives a main `.tex` reads the language, the venue and the citation style from it when it states them, and asks only for what it does not state.
- The mode of the call is the row "Mode" of `config.md`, and it is not asked.
- The session does not ask a question whose row the mode does not use.
- The permission rows New references and Numbers from saved results are asked one question per row, in revision only. Figure changes is asked in revision and in the figures call. Full mode's roles draw figures and compute from the materials by their pages.
- The rows Claims not to make, Earlier papers and Internal only are read by the agents that run in the modes listed against them. A mode that does not list a row records no value, and the agent reads it as "none" or "no".
- The row Internal only is shown at the intake confirmation with its value. A value "yes" is shown as "the manuscript is marked internal only and may present a negative result". It is "yes" only when the user's request or an answer here asks for an internal record.
- The row Existing main.tex is shown at the intake confirmation, and the run does not go on until the user confirms the record that holds it.
- The row Instructions takes the second argument of the call or the request's text: a path to an existing file is the comments file, any other text is the instructions, and a call with neither asks the question.
- The session shows the Instructions row at the confirmation as "comments file: <path>", "text: <the instructions>" or "none", so that a path mistyped into text is seen.
- The plan-mode interview asks the rows marked for plan and no others: Topic, Materials in hand, Paper type and Earlier run record. The Research question, the Discipline and the Language come from the dialogue and stay out of the record.
- The format-convert interview asks the rows marked for format-convert. A row that the manuscript states is shown with the manuscript's value, as the first bullet below the table says, for the user to confirm.
- The formatter writes a cover letter when the venue is a journal and no `cover-letter.tex` stands beside the manuscript. Then the format-convert interview also asks the rows Authors, Human or patient data and AI use, which the letter reads (`references/draft-writer.md`, "The cover letter").
- Each of those rows, and the row Paper type, is offered from the latest earlier run's `config.md` beside the manuscript when one stands, as "Earlier outputs" offers other rows. It is asked when no such record holds it.
- A target of format-convert that is a citation style or a venue is a target of the same run as a format target, so one run may hold `docx` and `ieee`.
- The confirmation names each file the run will change or write. They are each output file, `cover-letter.tex` when the formatter writes one, `<name>.tex` and `refs.bib` for a `.md` or a `.docx` given, `<main>-figure-<n>.png` beside `<main>.md` for each drawing of a Markdown target (`<main>` the main `.tex`'s name without `.tex`), and `<name>-<style>.md` and `<name>-<style>.docx` beside a `.bib` given.
- The main `.tex` and the files it inputs stand among them only when a target is `latex`, a citation style other than the manuscript's, or a venue. With only `docx`, `markdown` and `pdf` targets, they stay as they were.
- The confirmation names an output file that already stands beside the main `.tex` as replaced. An output whose path equals the input's, such as a `.docx` given with the target `docx`, takes `<name>-2.<extension>`, and the confirmation shows that path.
- The input manuscript is never replaced.

## Paper type and length

| Type | Best for | Typical length |
|---|---|---|
| IMRaD | Empirical research with data and results | 5,000 to 8,000 words |
| Literature Review | Synthesizing existing research on a topic | 6,000 to 10,000 words |
| Theoretical | Developing or analyzing theoretical frameworks | 5,000 to 8,000 words |
| Case Study | In-depth analysis of specific cases | 4,000 to 7,000 words |
| Policy Brief | Evidence-based policy recommendations | 2,000 to 4,000 words |
| Conference Paper | Concise presentation of research | 2,000 to 5,000 words |

- When the user names no type, the session chooses it by this table, and the confirmation shows the type with the row that decided it.

| If the paper | The type is |
|---|---|
| Has original data collection | IMRaD |
| Synthesizes existing literature | Literature Review |
| Develops or critiques a theory | Theoretical |
| Analyzes specific cases in depth | Case Study |
| Recommends policy actions | Policy Brief |
| Is presented at a conference (the Venue row names a conference) | Conference Paper |

- A paper that fits no row, or two rows, is shown with the candidates and the user chooses. Without an answer the type is IMRaD for empirical work with data or results, and Literature Review for a synthesis of existing research, as `references/planner.md` says.
- The length defaults to the typical length of the type, and the user can override it.
- A length below the low end of the type's typical length is flagged to the user at the confirmation, such as 2,000 words for an IMRaD paper.

## Citation style

| Style | Default disciplines |
|---|---|
| APA 7th | Education, Psychology, Social Sciences |
| Chicago 17th | History, Humanities, some Social Sciences |
| MLA 9th | Literature, Languages, Cultural Studies |
| IEEE | Engineering, Computer Science, Technology |
| Vancouver | Medicine, Biomedical Sciences, Nursing |

- APA 7th is the default.
- The session suggests the style of the discipline's row, and the user can override it.
- A style that does not match the discipline's row is warned about at the confirmation.
- Chicago 17th has two forms, notes and bibliography or author-date. Format-convert asks which one, since the formatter writes a different citation command for each.
- A style outside this table, such as Harvard, is not a supported target. The session asks again with the five styles listed.

## Format profile

- The row Format profile exists only when a target is DOCX, PDF or LaTeX. A Markdown-only run does not ask it.
- The fields are body font and size, caption font, placement and alignment, line spacing (single, 1.5, double or a fixed number of points), margins in centimetres, and table borders (three-line, full grid or none).
- Every value comes from the user's answer. The session never infers a value from the venue, the discipline or the manuscript.
- A DOCX target takes its layout from a reference `.docx`, since `pandoc` reads fonts, margins and spacing from it. With none held, the session writes one with `templates/reference_docx.py`, so each declared field reaches the DOCX except the caption's placement, which `pandoc` fixes. With one held, its layout wins, and the formatter's report lists each declared field as not honoured for the DOCX target (`references/formatter.md`, "The format profile").
- A declined question writes no row. A value outside the form of a field, such as a line spacing of 1.3, is asked again with the allowed values.
- A declared field that would take the manuscript past a limit of the Venue limits row takes the venue's value. The formatter names each such field in `format-report.md`, and the final message names it. The confirmation promises none, since only the formatter finds them.

## Venue limits

- The venue limits are the venue's word limit, abstract limit, keyword range, required sections, reference ceiling and blind-review model.
- A blind-review model of double-blind makes the draft writer write the anonymous submission copy that `references/draft-writer.md` gives, and the confirmation says so.
- Every value comes from the user's answer, and a limit the user does not state is recorded as "not stated".
- A limit is never filled from memory of the venue, its website or its name.
- A check against a limit that is "not stated" is not made, and the report says so.
- A declined question leaves the row empty.

## The evidence profile

- The profile decides which evidence types the literature search admits. It never changes which databases are searched and never blocks the run.
- The record holds one of four values, and the session shows them as an explicit choice:

| Profile | Evidence types it admits | Provenance it expects | Gaps it surfaces as critical |
|---|---|---|---|
| `general_social_science` | Peer-reviewed empirical studies, mixed-methods studies, and expert-panel or context-dependent policy analyses | A journal or proceedings, and expert-panel reports where the context decides | A finding generalized from a single context, and weak external validity |
| `cs_ml` | Peer-reviewed papers, archival preprints such as arXiv, conference proceedings and industry technical reports | A preprint server or proceedings, since peer review lags the field | Non-reproducible results and benchmark cherry-picking |
| `humanities_interpretive` | Primary sources, archival material, canonical or older texts and monographs | Primary-source provenance, and recency is no signal of quality | Interpretive over-reach and missing primary-source grounding |
| `unknown_user_defined` | Peer-reviewed work under the standard peer-review expectation | The standard peer-review expectation | None, and nothing is loosened |

- `unknown_user_defined` is the default and the fallback.
- The user confirms the profile. The session may suggest one from the discipline or from a research report in the materials, and never sets one the user did not confirm.
- A profile the user asks for that is none of the four is recorded as `unknown_user_defined (requested: <profile>)`. The session tells the user that no profile exists for it yet. The reserved profiles are `clinical`, `wet_lab`, `materials_physics`, `legal_case_based` and `education`, and each gets this answer.
- Some runs start no literature strategist: a full run with the search skipped, or a revision that does not allow new references. Such a run records `unknown_user_defined` without asking, with the line "this run skips literature screening, so a profile has no reader".
- A research report or an annotated bibliography in the materials does not skip the question, since the strategist still screens its sources.
- A profile changed after the strategist has run does not screen the sources again. The session tells the user that the sources stay as screened and that a new lit-review run applies the profile.

## Materials in hand

The user marks each of these as held or not:

- A research question or thesis statement.
- A literature list or a `.bib`.
- Data or results.
- Existing draft sections.
- Reviewer feedback.
- A style guide or template from the venue.
- A research report: a document that states a research question, a method and a synthesis of the evidence on a topic.
- An annotated bibliography: a list of sources that each carry an annotation.
- Ideas, asked in plan mode: rough ideas for the paper that are not yet a question, a source or a draft. The user states them in the answer, and the mentor builds on them in the dialogue.

Format-convert marks two more, asked in that mode only:

- A reference `.docx`: a Word file whose styles and page settings a DOCX target takes, which `pandoc` reads through `--reference-doc`. With none held, the session writes one with `templates/reference_docx.py` (`references/formatter.md`, "The format profile").
- A CSL file: a citation style file that a DOCX or Markdown target takes through `--csl`, and that makes the reference list of a `.bib` given in a style with no `.bst` on the installation. Without one, `pandoc` uses its default citation style, which is author-date and may differ from the style the manuscript's bibliography style names. A numbered manuscript style needs no CSL file, since the formatter's conversion patch prints its numbers and its reference list (`references/formatter.md`, "The conversion patch").

- A material the user holds is read by the roles and is not asked for again.
- The session finds a research report and an annotated bibliography by what each is, and never by a fixed path or file name. The user gives the path, and when several files fit the words, the session lists them and the user chooses.
- In plan mode a research report among the materials is read by the mentor and fills no row, since the research question comes from the dialogue.
- In every other mode, when the materials hold a research report or an annotated bibliography, the session reads it at intake and fills the answers it gives. The Topic and the Research question come from the report's question, and the Discipline and the method from what the report states. The sources come from the bibliography, and the other rows from what the document answers.
- Each answer filled this way is shown at the confirmation with the document and the place it came from, and the user confirms or changes it. A row it fills is not asked, and a row the documents do not answer is asked as usual.
- The sources of an annotated bibliography stand in the Materials in hand row as a list the literature strategist screens, like a `.bib`.
- The literature strategist screens a `.bib` that is held and searches for what it misses, unless the user skips the search in the row Literature search.
- When the materials hold data, the visualization agent draws the figures the outline plans, beside the draft writer.
- The row records the path of the folder or the files that hold the project's results when the user holds data or results. The peer reviewer reads them to check the numbers and the descriptions of the data handling (`references/peer-reviewer.md`, "Numbers and data handling").
- In full and disclosure mode, when the project folder is a git repository, the session reads its tags with `git -C '<project folder>' tag --list` and records the printed tags, or "no tags", in the Notes of `config.md`. The statements take the code's release tag from them (`references/statements.md`, "Facts and gaps").
- A `main.tex` that stands in the manuscript's folder in full mode is existing draft sections. The session reads it at intake and gives it to the planner, and the row Existing main.tex records that the first draft replaces it.

## Earlier outputs

- The session lists the outputs of earlier runs from `<project folder>/paper-runs/` and from the `paper-runs/` of the folder the session runs in, where a lit-review run with no `.tex` keeps its folder.
- The offer for full mode is the latest lit-review run's `review.md` and `refs.bib`, and the latest outline-only run's approved `outline.md` and `arguments.md`.
- An outline-only run is approved when the Decisions of its `config.md` hold the approval of its outline.
- The offer for full mode also holds the latest finished plan run's `chapter-plan.md`, `insights.md`, `dialogue.md`, `outline.md` and `arguments.md`. A plan run is finished when its folder holds `final.md` and `chapter-plan.md`, and a paused plan run is offered as an unfinished run and not here.
- A plan run taken in full mode does not skip the literature strategist, the sources' review or the outline's approval. Its named references and keywords seed the search, and its files go to the planner (SKILL.md, full mode items 1 and 4).
- The offer for outline-only mode is the latest lit-review run's `review.md` and `refs.bib`, which become the sources its strategist screens.
- Latest means the folder with the latest date, and of those the highest number, a folder with no number counting as 1.
- The user takes each offered output or leaves it, and the row Earlier outputs holds the paths taken, or "none".
- A lit-review run taken in full mode skips the literature strategist and the sources' review.
- An outline-only run taken in full mode brings its own `review.md` and `refs.bib` and skips the literature strategist, the sources' review, the planner and the outline's approval.

## DOI checking

- **Mark-only** is the default. A reference that still fails after its fix is marked in `checks.md` and named in the final message, and the run goes on.
- **Strict** treats a reference that still fails after its fix as a reference that cannot be confirmed, which stops the run at the stop "A reference that cannot be confirmed".
- In citation-check mode there is no fix before the check, and a citation whose exact DOI or arXiv ID provably fails lookup is that stop at once under strict.
- Mark-only suits fields that cite reports, standards or grey literature, where real but unindexed citations are common.
- Strict suits fields that cite by DOI.
- No answer records mark-only.

## Style calibration

- The session offers the calibration with the words "Past papers or writing samples help the agents match your voice; three or more work best; this is optional."
- With three or more samples, the session reads each one and records the style dimensions it shows in the row "Style profile", such as paragraph structure, citation style and modifier density.
- The session tells the user the traits it found.
- The profile is a soft guide. The manuscript prose standard and the discipline's conventions win wherever a sample departs from them.
- With fewer than three samples, the profile is partial and carries a warning that it is less reliable.
- For a co-authored sample the session asks which sections the user wrote and reads only those.
- A sample in a language other than the paper's gives the transferable dimensions only: paragraph structure, citation style and modifier density.
- Without samples the row is "none", and the roles write under the manuscript prose standard alone.

## Disclosure records

In disclosure mode the session reads the records of earlier runs, to mark each category of AI use before it asks.

- The records are the run folders of `paper-runs/` beside the manuscript's folder, the `config.md`, `final.md` and the other files of each.
- The session reads each run folder and marks each category of `references/ai-disclosure.md` by what the folders hold:

| Category | A trace in the records |
|---|---|
| Research assistance | A `review.md`, a `citation-report.md`, or a lit-review or citation-check run. |
| Drafting assistance | An `outline.md`, a first draft written by the draft writer, or an abstract-only run. |
| Revision assistance | A revision run, or a patch with an id `R<n>-<m>`, `W<k>`, `T<m>`, `V<m>` or `D<r>-<m>`. |
| Editing assistance | A patch with an id `F<k>`, `reference-fix` or `compile-fix`. |
| Analysis assistance | A `figures.md`, or a patch with the id `figures`. |
| Peer review simulation | A `review-<r>.md` of a draft review. |

- A category with a trace is marked used, with the run that shows it.
- A category with no trace, in records that are complete, is marked "not used as far as the records show". Records are complete when every run folder has its `final.md`.
- A category that a run folder without a `final.md` might hold is marked uncertain, and the session asks about it.
- The tools and versions come from the Notes of each run's `config.md`, which hold the served model.
- The records show only what runs of this skill did. The session says so, and the user changes any mark at the confirmation.
- With no run folder, the session asks every category.
- The session asks only the categories marked uncertain, and shows the others with their marks for the user to confirm with the rest.

## Authors and statements

- The inputs of the six statements are collected here because a role agent cannot ask the user, and `references/statements.md` and `references/ai-disclosure.md` write only what these rows hold.
- A single-author paper is recorded as "single author", and its Contributions row is empty.
- The user's expected contributions are formalized into the CRediT matrix of `references/statements.md` at this point, and the user confirms the matrix with the rest.
- An equal-contribution declaration is recorded in the Authors row.
- A study with no funding is recorded as "no funding", which still gets its own statement in the paper.
- An uncertain AI-use category is confirmed here with the user, and one the user cannot confirm stays "uncertain".
- The session asks whether the venue or the user wants a responsible-use statement or a reproducibility statement, and records each yes in the Notes.
- A venue the user names that `references/ai-disclosure.md` does not list gets the question for its pasted AI policy, and the answer "no venue yet" keeps the generic statement.
- Disclosure mode asks which policy anchor of `references/ai-disclosure.md` the author targets, in the same message as the venue, and records the answer in the Policy anchor row. A venue and an anchor together are accepted only as a Nature Portfolio venue with `nature`. Any other pair is shown at the confirmation as a conflict, and the user drops one of the two before the run goes on. `prisma-trAIce` is asked only of a paper that reports a systematic literature review, and the session asks whether AI was used as a method in it.

## The record

`config.md` is a table with the columns Parameter and Value. Its first row is Mode and its second row is Arguments with the absolute path of each argument. One row follows for each row name of the table "Questions, marked by mode" that the mode asked, in that order.

- A call by plain request, and a call with an argument in words, add two rows. Request holds the request as the user wrote it. Taken from the request lists each argument taken and the words it was taken from.
- The session writes the path it found in the Arguments row.
- A section "Notes" holds a requirement or preference the user gave that fits no row.
- An instruction the user gives, at intake or later in the run, not to stop for a choice whose recommendation the run would take is recorded in the Notes. The stops of SKILL.md "Stops" stay as they are, except that the stop "A research question the materials do not answer" then takes its second option, as that table says.
- A section "Decisions" holds the user's answer at each stop and each choice the run took by its goal with its reason, appended by the session.
- The record is shown to the user whole, and the run goes on when the user confirms it.
