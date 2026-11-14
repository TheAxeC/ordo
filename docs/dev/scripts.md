# Scripts

Every script in this repository outside `.scratch/` is listed here with its kind and its job. A development script is run by the person who works on Ordo. A user script is run by a skill or by the user of a repository that has Ordo set up. A test script runs scratch repositories or scratch files and proves a script. The change standard says that a change that adds, removes or renames a script updates this page ("Scripts compute facts; judgment is read" in `docs/dev/change-standard.md`).

## Development scripts

| Script | Job |
|---|---|
| `docs/figures/gen_figures.py` | Writes the SVG figures of the README from the labels written in the file: `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `code-comments.svg` and one figure for each of the seven modes of `paper` under `docs/figures/paper/` |
| `docs/figures/academic-paper-comparison/gen_comparison.py` | Writes the 16 SVG figures that set `paper` beside academic-paper 3.2.0 and academic-pipeline into its own folder, from the labels written in the file, using the layout code of `gen_figures.py` |
| `utils/check_coverage.py` | Checks that a coverage list names every file of the named skill folders once, with a mark and a reason |
| `utils/pin.sh` | Pins the installed skills and agents to a tag of this repository, or checks the pin |

## User scripts

| Script | Job |
|---|---|
| `skills/code-comments/templates/strip_comments.py` | Prints the code of a C, C++ or CMake file without its comments, and with `--compare` says whether two files have the same code, so that a rewrite of comments is kept only when it changed no code |
| `skills/land/templates/checks.sh` | Runs a plan's verify list and says whether every command exited 0 |
| `skills/land/templates/land.sh` | Commits a step's work in its worktree, copies it onto main, runs the verify list there and prints the booking data |
| `skills/ordo-init/templates/check_config.py` | Checks `.agents/plan.yaml` against the plan skill's template and prints each error and note |
| `skills/paper/templates/anchorize_tex.py` | Writes the block manifest of a LaTeX manuscript beside it, with each block's offset and hash, and leaves the `.tex` unchanged |
| `skills/paper/templates/apply_tex_patch.py` | Applies a patch of replaced, inserted and deleted blocks to a LaTeX manuscript by the manifest's hashes, rejects a stale or structural patch, and writes the apply report |
| `skills/paper/templates/calibration_counts.py` | Counts the misses and false alarms per label against the limits 0.15 and 0.10. Its input is a table of pairs, each with its built label and the label the citation compliance agent's result gave |
| `skills/paper/templates/lookup.py` | Looks references up in Crossref, OpenAlex, Semantic Scholar and arXiv, and prints the retraction and expression-of-concern notices that Crossref lists for a DOI. Compares the keys a `.tex` cites with a `.bib`, reading the `cite` commands of natbib and biblatex. Checks each cited entry's URL and title, fetches full texts, and checks quoted passages against them |
| `skills/plan-orchestration/templates/plan_cost.py` | Prices the usage of each agent role of a plan from the response bodies and the agents' transcripts |
| `skills/repo-setup/templates/sync_rules.py` | Compares the shared-rules block and the plan-terms block of a repository with their templates, and rewrites them on request |
| `skills/session-retro/templates/transcript_window.py` | Prints what was said and done in Claude Code transcripts, for a time window or for one Claude Code session, with secrets replaced |
| `skills/writing/templates/docx_paragraphs.py` | Prints the text of each paragraph of a `.docx` file, numbered, with tracked insertions kept and tracked deletions and comments left out |
| `skills/writing/templates/prose_facts.py` | Prints the facts of a draft with one right answer: words per sentence, sentences and words per paragraph, semicolons per 1000 words, runs of sentences of equal length, non-ASCII characters, the words of the prose standard's banned and flagged lists, and contractions |

## Test scripts

| Script | Proves |
|---|---|
| `skills/code-comments/templates/strip_comments.test.sh` | `skills/code-comments/templates/strip_comments.py` |
| `skills/land/templates/land.test.sh` | `skills/land/templates/land.sh` |
| `skills/ordo-init/templates/check_config.test.sh` | `skills/ordo-init/templates/check_config.py` |
| `skills/paper/templates/anchorize_tex.test.sh` | `skills/paper/templates/anchorize_tex.py` |
| `skills/paper/templates/apply_tex_patch.test.sh` | `skills/paper/templates/apply_tex_patch.py` |
| `skills/paper/templates/calibration_counts.test.sh` | `skills/paper/templates/calibration_counts.py` |
| `skills/paper/templates/lookup.test.sh` | `skills/paper/templates/lookup.py` |
| `skills/repo-setup/templates/sync_rules.test.sh` | `skills/repo-setup/templates/sync_rules.py` with `--write` |
| `utils/pin.test.sh` | `utils/pin.sh` |
