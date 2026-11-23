# The intake of a grant run

What `config`, `draft` and `revise` each ask, and the rows of `config.md` that a `draft` or `revise` run holds for the roles of `paper`. `review` and `check` ask nothing.

## config

The session asks, in one message, each of these that the call and the names of the call documents do not give:

- The funder.
- The programme, as the funder names it.
- The call year.

## draft

The `paper` skill's intake agent holds this intake. It asks only the questions below, each only when the call does not answer it, and runs no other step of its page's interview. The session puts them to the user in one message.

| Question | Default |
|---|---|
| Which section is drafted, by the funder's heading, or the whole application | The whole application |
| The materials to write from, each as a path: earlier applications, slides, notes, papers, result files | None |
| The `.bib` the application cites from | `refs.bib` in the application's folder when it stands there, else none |
| The language the application is written in | English |
| The citation style | The style of the `\bibliographystyle` line of an existing `main.tex`, else IEEE, a numbered style |
| Whether the funder wants a `.docx` beside the PDF | No |
| Whether the run ends with the `/writing` review of the application | Yes |
| Claim check: whether each cited claim is read against its source's text | Yes |
| Incremental checks: whether each later patch that adds or changes a cited sentence gets a check of its own | Yes |
| Claims not to make: the claims the application must not make | None |
| Earlier papers: the applicant's earlier texts the application may repeat passages of | None |
| Citation Verification: mark only, or strict | Mark only |

- The four rows from Claim check to Earlier papers and the row Citation Verification are asked in the words of the `paper` skill's `agents/intake_agent.md`, Step 13 and Step 14 of its Interview Protocol.
- The agent asks nothing on the format or the layout and writes no format profile: the session writes the profile from the funder config's "Layout" (the `grant` skill's `SKILL.md`, Steps, "draft" item 7).
- With no `.bib`, the run checks no citation, the five questions on the citation check are not asked, and their rows read "no", "no", "none", "none" and "advisory (mark only, default)".
- The message also shows each row below that is not asked, with its value, so that the user can change one in the same reply.

The agent writes `config.md` in the run folder, in the form of its page's Paper Configuration Record, with these rows:

| Row | Value | From |
|---|---|---|
| Topic | The application's subject, in one sentence | The materials |
| Research Question | The question or aim the materials state, or "not stated in the materials" | The materials |
| Paper Type | Grant application: the sections of the funder config | Fixed |
| Discipline | The discipline and sub-field | The materials |
| Target Journal | General | Fixed |
| Venue Profile | absent | Fixed |
| Citation Format | The citation style | The user's answer |
| Output Format | LaTeX and PDF, with DOCX when the funder wants a `.docx` | The user's answer |
| Body Language | The language of the application | The user's answer |
| Abstract | None: a summary the funder asks for is a section or a form field of the funder config | Fixed |
| Word Count Target | The limit and unit of the section drafted, or of the row `(whole document)` for the whole application, or "no limit stated" | The funder config |
| Existing Materials | The materials and the `.bib`, each with its path, and `main.tex` when it exists | The user's answer |
| Co-Authors | not asked | Fixed |
| Funding | not applicable: the text is an application for funding | Fixed |
| Style Profile | null | Fixed |
| Domain Evidence Profile | absent | Fixed |
| Citation Verification | strict, or advisory (mark only, default) | The user's answer |
| Operational Mode | grant draft | Fixed |
| Number of sources | empty | Fixed |
| Claims not to make | Each as a sentence, or "none" | The user's answer |
| Earlier papers | Each as a path, a DOI or a citation, or "none" | The user's answer |
| Internal only | no | Fixed |
| Closing review | yes or no | The user's answer |
| Claim check | yes or no | The user's answer |
| Incremental checks | yes or no | The user's answer |
| Funder config | The path of the funder config | The session |
| Section drafted | The funder's heading of the section, or "the whole application" | The user's answer |

## revise

The session asks, in one message:

| Question | Default |
|---|---|
| Whether the run ends with the `/writing` review of the application | Yes |
| Whether the funder wants a `.docx` beside the PDF | No |

The session writes `config.md` in the run folder with these rows:

| Row | Value | From |
|---|---|---|
| Paper Type | Grant application: the sections of the funder config | Fixed |
| Citation Format | The style of the `\bibliographystyle` line of the main `.tex`, or "none stated" | The main `.tex` |
| Output Format | LaTeX and PDF, with DOCX when the funder wants a `.docx` | The user's answer |
| Word Count Target | The limit and unit of the row `(whole document)`, or "no limit stated" | The funder config |
| Existing Materials | The comments file, with its path | The call |
| Operational Mode | grant revise | Fixed |
| Internal only | no | Fixed |
| Closing review | yes or no | The user's answer |
| Claim check | no: a `revise` run starts no citation compliance agent | Fixed |
| Incremental checks | no | Fixed |
| Funder config | The path of the funder config | The session |
