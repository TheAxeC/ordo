# Intake

The session reads this page at intake, before any agent starts. Intake is an interview the session holds with the user, since a role agent cannot ask the user anything. The answers are written to `config.md` in the run folder, and every role agent reads that file.

## The interview

- The session asks the questions of the table below that the mode needs, all in one message and numbered, with a default beside each question that has one.
- A question whose answer the call or the manuscript already gives is not asked: the session states the answer and the user confirms it with the rest.
- When an earlier run's `config.md` stands beside the manuscript, the session shows its values as the answers, and the user confirms or changes each.
- An answer that is vague is refined with the user into one that the roles can use, such as a topic into a research question that can be researched.
- A fact the user does not know is recorded as `[GAP: <what is missing>]` in its row, and never filled from the model.
- A user's answer to a later stop is appended to `config.md` under "Decisions", verbatim, by the session.

## Questions, marked by mode

The modes are full, outline-only, revision, abstract-only, lit-review, citation-check and disclosure.

| Row of `config.md` | The question | Asked in |
|---|---|---|
| Topic | What the paper is about. | full, outline-only, lit-review |
| Research question | The question or thesis statement the paper answers. | full, outline-only |
| Paper type | One type of the table below. | full, outline-only |
| Discipline | The discipline and its sub-field. | full, outline-only, revision, abstract-only, lit-review |
| Language | The language of the paper. | full, outline-only, lit-review |
| Venue | The target journal or conference, or "General". | full, outline-only, revision, abstract-only, disclosure |
| Venue limits | The venue's limits the user states. | full, outline-only, revision, abstract-only |
| Citation style | One style of the table below. | full, revision, citation-check |
| Length | The target word count. | full, outline-only |
| Materials in hand | Which of the six materials below the user has. | full, outline-only, revision |
| Domain evidence profile | The profile of "The evidence profile" below. | full, outline-only, lit-review |
| New references | Whether the roles may add a reference that the `.bib` does not hold, and which the user names. | full, revision |
| Computed numbers | Whether the roles may compute a number from the project's saved results, and from which files. | full, revision |
| Figure changes | Whether the roles may change a figure, and whether they may edit and run the project's figure script or only a copy of it in the run folder. | full, revision |
| DOI checking | Strict or mark-only. | citation-check |
| Authors | One row per author: name, affiliation, ORCID and whether the author is the corresponding author. | full, revision, disclosure |
| Contributions | For each author, the CRediT roles of `references/statements.md` taken, each marked Lead or Supporting. | full, disclosure |
| Funding | One row per funder, or "no funding". | full, disclosure |
| Conflicts of interest | Each conflict, or "none". | full, disclosure |
| Data availability | Open (repository and URL or DOI), restricted (source), on request, or no new data. | full, disclosure |
| Human or patient data | Whether the study used any, and then the approving board, the approval number, the consent obtained and the de-identification applied. | full, disclosure |
| AI use | Whether any AI was used, each category of `references/ai-disclosure.md` marked used, not used or uncertain, and the tools with their versions. | full, lit-review, disclosure |
| Venue AI policy | The venue's AI policy text, pasted, for a venue `references/ai-disclosure.md` does not list. | full, disclosure |
| Style profile | Three or more past papers or writing samples, or none. | full, revision, abstract-only |
| Earlier run record | The path of the latest earlier `config.md`, when one stands. | every mode |

- A mode that gives a main `.tex` reads the language, the venue and the citation style from it when it states them, and asks only for what it does not state.
- The mode of the call is the row "Mode" of `config.md`, and it is not asked.
- The session does not ask a question whose row the mode does not use.

## Paper type and length

| Type | Best for | Typical length |
|---|---|---|
| IMRaD | Empirical research with data and results | 5,000 to 8,000 words |
| Literature Review | Synthesizing existing research on a topic | 6,000 to 10,000 words |
| Theoretical | Developing or analyzing theoretical frameworks | 5,000 to 8,000 words |
| Case Study | In-depth analysis of specific cases | 4,000 to 7,000 words |
| Policy Brief | Evidence-based policy recommendations | 2,000 to 4,000 words |
| Conference Paper | Concise presentation of research | 2,000 to 5,000 words |

- The default type is Conference Paper, which is the default skeleton of `references/planner.md`; a synthesis topic suggests Literature Review, and a journal venue that asks for it suggests IMRaD.
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
- Every value comes from the user's answer, and a limit the user does not state is recorded as "not stated".
- A limit is never filled from memory of the venue, its website or its name.
- A check against a limit that is "not stated" is not made, and the report says so.
- A declined question leaves the row empty.

## The evidence profile

- The profile decides which evidence types the literature search admits. It never changes which databases are searched and never blocks the run.
- `cs_ml` is the default for a machine learning paper. It admits peer-reviewed papers, archival preprints such as arXiv, conference proceedings and industry technical reports, and it surfaces non-reproducible results and benchmark cherry-picking as critical gaps.
- Any other discipline takes `neutral`, which admits peer-reviewed work under the standard peer-review expectation and loosens nothing.
- The user confirms the profile, and the session may suggest one from the discipline and never sets one the user did not confirm.
- A profile the user asks for that is neither `cs_ml` nor `neutral` is recorded as `neutral (requested: <profile>)`, and the session tells the user that no profile exists for it yet.
- A run that skips the literature strategist records `neutral` without asking, with the line "this run skips literature screening, so a profile has no reader".

## Materials in hand

The user marks each of these as held or not:

- A research question or thesis statement.
- A literature list or a `.bib`.
- Data or results.
- Existing draft sections.
- Reviewer feedback.
- A style guide or template from the venue.

- The literature strategist runs in a full or outline-only run when no `.bib` is held, and in lit-review mode.
- A material the user holds is read by the roles and is not asked for again.
- When the materials hold data for a figure, the visualization agent starts together with the draft writer of the first draft, and the user is not asked.

## Permissions

- The three permission rows are asked at intake in full and revision mode, one question per row, and are never asked again after intake.
- A row answered no, or not answered, is a no: the roles do not do what the row covers.
- New references: a yes lets the strategist add references to the `.bib` in revision mode, and lets the draft writer add them in full mode, only from the sources the user names or that `lookup.py` resolves.
- Computed numbers: a yes names the files of saved results the numbers may come from, and a number is computed only from those files.
- Figure changes: a yes says whether the visualization agent may edit and run the project's own figure script, or only a copy of it in the run folder. Without the first, the project's script and its outputs stay unchanged.

## DOI checking

The question is asked in citation-check mode only. In every other mode a failed DOI is an issue of draft review round 1 or of reading 1.

- **Mark-only** is the default. A citation whose DOI fails the check is marked in `citation-report.md` and named in the final message, and the run goes on.
- **Strict** treats a citation whose exact DOI or arXiv ID provably fails lookup as a reference that cannot be confirmed, which stops the run at the stop "A reference that cannot be confirmed".
- Mark-only suits fields that cite reports, standards or grey literature, where real but unindexed citations are common.
- Strict suits fields that cite by DOI.
- No answer records mark-only.

## Style calibration

- The session offers the calibration with the words "Past papers or writing samples help the agents match your voice; three or more work best; this is optional."
- With three or more samples, the session reads each one and records the style dimensions it shows in the row "Style profile", such as paragraph structure, citation style and modifier density.
- The session tells the user the traits it found.
- The profile is a soft guide. The prose standard and the discipline's conventions win wherever a sample departs from them.
- With fewer than three samples, the profile is partial and carries a warning that it is less reliable.
- For a co-authored sample the session asks which sections the user wrote and reads only those.
- A sample in a language other than the paper's gives the transferable dimensions only: paragraph structure, citation style and modifier density.
- Without samples the row is "none", and the roles write under the prose standard alone.

## Authors and statements

- The inputs of the six statements are collected here because a role agent cannot ask the user, and `references/statements.md` and `references/ai-disclosure.md` write only what these rows hold.
- A single-author paper is recorded as "single author", and its Contributions row is empty.
- The user's expected contributions are formalized into the CRediT matrix of `references/statements.md` at this point, and the user confirms the matrix with the rest.
- An equal-contribution declaration is recorded in the Authors row.
- A study with no funding is recorded as "no funding", which still gets its own statement in the paper.
- An uncertain AI-use category is confirmed here with the user, and one the user cannot confirm stays "uncertain".
- A responsible-use statement or a reproducibility statement that the venue or the user asks for is recorded in the Notes, and `references/statements.md` writes it from there.

## The record

`config.md` is a table with the columns Parameter and Value. Its first row is Mode, and one row follows for each row name of the table "Questions, marked by mode" that the mode asked, in that order.

- A section "Notes" holds a requirement or preference the user gave that fits no row.
- A section "Decisions" holds the user's answer at each stop, appended by the session.
- The record is shown to the user whole, and the run goes on when the user confirms it.
