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

The modes are full, outline-only, revision, abstract-only, lit-review, citation-check and disclosure, and the calls are draft-review and figures.

| Row of `config.md` | The question | Asked in |
|---|---|---|
| Topic | What the paper is about. | full, outline-only, lit-review |
| Research question | The question or thesis statement the paper answers, written in full. The literature strategist does not start without one, so full, outline-only and lit-review modes do not go on until the user gives one. A topic is never taken as the question. | full, outline-only, lit-review |
| Paper type | One type of the table below. A manuscript's type is proposed from the manuscript. When the user names none, the type is chosen by the table "Paper type and length" and shown with the reason. | full, outline-only, revision, abstract-only, citation-check, draft-review |
| Discipline | The discipline and its sub-field. | full, outline-only, revision, abstract-only, lit-review, citation-check |
| Language | The language of the paper. | full, outline-only, revision, abstract-only, lit-review, disclosure |
| Venue | The target journal or conference, "General", or "no venue yet", which keeps the generic AI disclosure statement. | full, outline-only, revision, abstract-only, disclosure, draft-review, figures |
| Venue AI policy | The venue's AI policy text, pasted, for a venue `references/ai-disclosure.md` does not list. | full, disclosure |
| Policy anchor | In disclosure mode, the policy anchor the author targets in place of a venue: `prisma-trAIce`, `icmje`, `nature`, `ieee`, or "none". | disclosure |
| Venue limits | The venue's limits the user states. | full, outline-only, revision, abstract-only, draft-review, figures |
| Cover letter | For a journal venue: the article type (Research Article, Review Article or Brief Communication), the editor's name when known, the reason the paper fits the journal in one sentence, suggested reviewers and excluded reviewers with a reason, each optional. | full |
| Citation style | One style of the table below. | full, revision, citation-check, figures |
| Length | The target word count. | full, outline-only |
| Materials in hand | Which of the eight materials below the user has. Lit-review mode asks for the literature list or `.bib` only, and the figures call for the data or results only. | full, outline-only, revision, lit-review, figures |
| Literature search | Whether to skip the search and use the sources given only. Default: no. | full |
| Earlier outputs | Which of the earlier runs' outputs of "Earlier outputs" below to take. | full, outline-only |
| Domain evidence profile | One of the four profiles of "The evidence profile" below. | full, outline-only, lit-review, revision |
| DOI checking | Strict or mark-only. | full, revision, citation-check, lit-review |
| Instructions | A comments file, instructions as text, or none. | revision |
| New references | Whether the run may add references that the manuscript's `.bib` lacks. | revision |
| Numbers from saved results | Whether the run may compute numbers from the project's saved results, and from which files. | revision |
| Figure changes | Whether the run may change figures, and whether it may edit and run the project's figure script or only a copy of it in the run folder. | revision, figures |
| Authors | One row per author: name, affiliation, ORCID and whether the author is the corresponding author. | full, revision, citation-check, disclosure |
| Contributions | For each author, the CRediT roles of `references/statements.md` taken, each marked Lead or Supporting. | full, disclosure |
| Funding | One row per funder, or "no funding". | full, disclosure |
| Conflicts of interest | Each conflict, or "none". | full, disclosure |
| Data availability | Open (repository and URL or DOI), restricted (source), on request, or no new data. | full, disclosure |
| Human or patient data | Whether the study used any, and then the approving board, the approval number, the consent obtained and the de-identification applied. | full, disclosure |
| AI use | Whether any AI was used, each category of `references/ai-disclosure.md` marked used, not used or uncertain, and the tools with their versions. In disclosure mode the categories come pre-marked from the records of "Disclosure records". | full, outline-only, revision, lit-review, disclosure |
| Style profile | Three or more past papers or writing samples, or none. | full, revision, abstract-only |
| Claims not to make | The claims the paper must not make, each as a sentence, or "none". | full, revision, abstract-only, citation-check, draft-review |
| Earlier papers | The authors' earlier papers that the paper may repeat passages of, each as a path, a DOI or a citation, or "none". | full, revision, citation-check |
| Internal only | Whether the user asks for the manuscript as an internal record, such as a record of every attempt, and not as work to publish. Default: no. The session never sets it from the materials. | full, outline-only, revision, abstract-only, draft-review |
| Existing main.tex | Asked only when a `main.tex` stands in the manuscript's folder. The session states that the first draft replaces it and that the original is kept in the run folder as `existing-main.tex`. Its text is read as existing draft sections. | full |
| Earlier run record | The path of the latest earlier `config.md`, when one stands. | every mode |

- A mode that gives a main `.tex` reads the language, the venue and the citation style from it when it states them, and asks only for what it does not state.
- The mode of the call is the row "Mode" of `config.md`, and it is not asked.
- The session does not ask a question whose row the mode does not use.
- The permission rows New references and Numbers from saved results are asked one question per row, in revision only. Figure changes is asked in revision and in the figures call. Full mode's roles draw figures and compute from the materials by their pages.
- The rows Claims not to make, Earlier papers and Internal only are read by the agents that run in the modes listed against them. A mode that does not list a row records no value, and the agent reads it as "none" or "no".
- The row Internal only is shown at the intake confirmation with its value. A value "yes" is shown as "the manuscript is marked internal only and may present a negative result". It is "yes" only when the user's request or an answer here asks for an internal record.
- The row Existing main.tex is shown at the intake confirmation, and the run does not go on until the user confirms the record that holds it.
- The row Instructions takes the second argument of the call or the request's text: a path to an existing file is the comments file, any other text is the instructions, and a call with neither asks the question.
- The session shows the Instructions row at the confirmation as "comments file: <path>", "text: <the instructions>" or "none", so that a path mistyped into text is seen.

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

- A material the user holds is read by the roles and is not asked for again.
- The session finds a research report and an annotated bibliography by what each is, and never by a fixed path or file name. The user gives the path, and when several files fit the words, the session lists them and the user chooses.
- When the materials hold a research report or an annotated bibliography, the session reads it at intake and fills the answers it gives. The Topic and the Research question come from the report's question, and the Discipline and the method from what the report states. The sources come from the bibliography, and the other rows from what the document answers.
- Each answer filled this way is shown at the confirmation with the document and the place it came from, and the user confirms or changes it. A row it fills is not asked, and a row the documents do not answer is asked as usual.
- The sources of an annotated bibliography stand in the Materials in hand row as a list the literature strategist screens, like a `.bib`.
- The literature strategist screens a `.bib` that is held and searches for what it misses, unless the user skips the search in the row Literature search.
- When the materials hold data, the visualization agent draws the figures the outline plans, beside the draft writer.
- A `main.tex` that stands in the manuscript's folder in full mode is existing draft sections. The session reads it at intake and gives it to the planner, and the row Existing main.tex records that the first draft replaces it.

## Earlier outputs

- The session lists the outputs of earlier runs from `<project folder>/paper-runs/` and from the `paper-runs/` of the folder the session runs in, where a lit-review run with no `.tex` keeps its folder.
- The offer for full mode is the latest lit-review run's `review.md` and `refs.bib`, and the latest outline-only run's approved `outline.md` and `arguments.md`.
- An outline-only run is approved when the Decisions of its `config.md` hold the approval of its outline.
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
- A section "Decisions" holds the user's answer at each stop and each choice the run took by its goal with its reason, appended by the session.
- The record is shown to the user whole, and the run goes on when the user confirms it.
