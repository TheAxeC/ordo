# Scripts

Every script in this repository outside `.scratch/` is listed here with its kind and its job. A development script is run by the person who works on Ordo. A user script is run by a skill or by the user of a repository that has Ordo set up. A test script runs scratch repositories or scratch files and proves a script. The change standard says that a change that adds, removes or renames a script updates this page ("Scripts compute facts; judgment is read" in `docs/dev/change-standard.md`).

## Development scripts

| Script | Job |
|---|---|
| `docs/figures/gen_figures.py` | Writes the SVG figures of the README from the labels written in the file: `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `paper-review.svg`, `code-comments.svg` and, under `docs/figures/paper/`, one figure for each of the twelve modes of `paper`, `lifecycle.svg` for the path of a manuscript through the modes and `run-folder.svg` for the files of a full run from agent to agent |
| `docs/figures/academic-pipeline/gen_academic_pipeline.py` | Writes `academic-pipeline.svg`, the stages of academic-pipeline and the skill each goes to, into its own folder, from the labels written in the file, using the layout code of `gen_figures.py` |
| `utils/pin.sh` | Pins the installed skills and agents to a tag of this repository, or checks the pin |

## User scripts

| Script | Job |
|---|---|
| `skills/code/code-comments/templates/strip_comments.py` | Prints the code of a C, C++ or CMake file without its comments, and with `--compare` says whether two files have the same code, so that a rewrite of comments is kept only when it changed no code |
| `skills/orchestration/land/templates/checks.sh` | Runs a plan's verify list and says whether every command exited 0 |
| `skills/orchestration/land/templates/land.sh` | Commits a step's work in its worktree, copies it onto main, runs the verify list there and prints the booking data |
| `skills/ordo/ordo-init/templates/check_config.py` | Checks the `plan.yaml` at a path against the plan skill's template and prints each error and note, or with `--find` prints the `plan.yaml` the search order finds |
| `skills/academic/paper/templates/anchorize_tex.py` | Writes the block manifest of a LaTeX manuscript beside it, with each block's offset and hash, and leaves the `.tex` unchanged |
| `skills/academic/paper/templates/apply_tex_patch.py` | Applies a patch of replaced, inserted and deleted blocks to a LaTeX manuscript by the manifest's hashes, rejects a stale or structural patch, and writes the apply report |
| `skills/academic/paper/templates/calibration_counts.py` | Counts the misses and false alarms per label against the limits 0.15 and 0.10. Its input is a table of pairs, each with its built label and the label the citation compliance agent's result gave |
| `skills/academic/paper/templates/lookup.py` | Looks references up in Crossref, OpenAlex, Semantic Scholar and arXiv, searches PubMed's E-utilities beside them, and with `resolve` over several DOIs and arXiv IDs asks each index for 50 of them in one request, printing one block per identifier. Lists with `refs` and `cited-by` the works a source cites and the works that cite it, up to 1000 per source, from OpenAlex, Semantic Scholar and, for a PMID, Europe PMC, `cited-by --since` keeping the works of a year on. Writes with `index-abstract` the abstract the first index gives into a folder, one file per identifier, and lists with `dblp` the records DBLP's SPARQL endpoint holds for a title, asked first by the title's exact forms and then by its words when the exact forms find no record or only CoRR records, with venue, year, pages, type and key, and a line when a reply is cut at 1000 rows. Prints the retraction and expression-of-concern notices that Crossref lists for a DOI. Gives a preprint with a published version the entry doi.org gives for the published DOI an index names, or with `bibtex --page` builds it from the citation tags of the venue's page, printing the entry alone on standard output and its notes on standard error. Prints every entry in ASCII: an accented letter, a Greek letter or a typographic sign as its LaTeX form, a `url` or `doi` percent-encoded, the key in ASCII, and a character with no form as `{?}` with a warning line on standard error; a title is compared with the LaTeX forms read back as their characters. Compares the keys a `.tex` cites with a `.bib`, reading the `cite` commands of natbib and biblatex. Checks each cited entry's URL and title, fetches full texts by a DOI, an arXiv ID, a Semantic Scholar ID or an OpenAlex ID, with `--page` first the PDF a venue's page names, and checks quoted passages against them. Prints the PMCID an OpenAlex record names, and with `text` writes the text of a page or PDF a role saved, or with `text --abstract` the text of a page that holds only the abstract, so that a passage in it is checked the same way. Paces its requests to each index across processes, waits out a 429 whose `Retry-After` names 60 seconds or less, leaves out at once one that names more and skips that index until then, and caches the index replies of `resolve`, `search`, `refs`, `cited-by` and `dblp` for 30 days |
| `skills/academic/paper/templates/reference_docx.py` | Writes a reference `.docx` for `pandoc --reference-doc` from `pandoc`'s default reference document, with the DOCX layout of academic-paper (Times New Roman 12 pt, double spacing, 2.54 cm margins, the page number at the top right, heading, block-text, bibliography and table styles), each field of the format profile given as an option overriding its default, and every other part of the document unchanged |
| `skills/orchestration/plan-orchestration/templates/plan_cost.py` | Prices the usage of each agent role of a plan from the response bodies and the agents' transcripts |
| `skills/ordo/repo-setup/templates/sync_rules.py` | Compares the shared-rules block and the plan-terms block of a repository with their templates, and rewrites them on request, the plan-terms block in `docs/glossary.md` or in the file `--glossary <path>` names |
| `skills/ordo/session-retro/templates/transcript_window.py` | Prints what was said and done in Claude Code transcripts, for a time window or for one Claude Code session, with secrets replaced |
| `skills/academic/writing/templates/docx_paragraphs.py` | Prints the text of each paragraph of a `.docx` file, numbered, with tracked insertions kept and tracked deletions and comments left out |
| `skills/academic/writing/templates/prose_facts.py` | Prints the facts of a draft with one right answer: words per sentence, sentences and words per paragraph, semicolons per 1000 words, runs of sentences of equal length, non-ASCII characters, the words of the prose standard's banned and flagged lists, and contractions |

## Test scripts

| Script | Proves |
|---|---|
| `skills/code/code-comments/templates/strip_comments.test.sh` | `skills/code/code-comments/templates/strip_comments.py` |
| `skills/orchestration/land/templates/land.test.sh` | `skills/orchestration/land/templates/land.sh` |
| `skills/ordo/ordo-init/templates/check_config.test.sh` | `skills/ordo/ordo-init/templates/check_config.py` |
| `skills/academic/paper/templates/anchorize_tex.test.sh` | `skills/academic/paper/templates/anchorize_tex.py` |
| `skills/academic/paper/templates/apply_tex_patch.test.sh` | `skills/academic/paper/templates/apply_tex_patch.py` |
| `skills/academic/paper/templates/calibration_counts.test.sh` | `skills/academic/paper/templates/calibration_counts.py` |
| `skills/academic/paper/templates/lookup.test.sh` | `skills/academic/paper/templates/lookup.py` |
| `skills/academic/paper/templates/reference_docx.test.sh` | `skills/academic/paper/templates/reference_docx.py` |
| `skills/ordo/repo-setup/templates/sync_rules.test.sh` | `skills/ordo/repo-setup/templates/sync_rules.py` with `--write` and with `--glossary` |
| `utils/pin.test.sh` | `utils/pin.sh` |
