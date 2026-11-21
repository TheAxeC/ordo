# 0043. Paper's modes are academic-paper's, copied, with the deviations the goal and the rulings keep

Status: proposed

## Context

Paper's modes other than lit-review had grown a structure of their own beside academic-paper 3.2.0: a planner in place of the structure architect and the argument builder, the draft writer in place of the abstract agent, an intake agent in every mode, stops and agent starts academic-paper does not have, and pages that summarised academic-paper's files instead of holding them.

- Step 5.P made lit-review academic-paper's, with the strategist's page copied and the search left to the session (ADR 0042). In the rc.17 lit-review comparison the judges picked `paper` 4 of 4 against academic-paper (`.scratch/5-paper/agents/reviews/5.P-check-blind-comparison.md`, section "Lit-review").
- The same run took 3 h 30 min, 79 min over its bar, and no strategist's brief named a target number of sources (`.scratch/5-paper/agents/reviews/5.P-check-run.md`, section "The slower stage and its cause").
- The user ruled that every mode of `paper` is academic-paper's, copied and not rewritten, and that a deviation from academic-paper stands only where it makes the output better (`.scratch/5-paper/plan.md`, Rulings: "The rest of paper as academic-paper's", Open items 5.Q-rebuttal, 5.Q-letter-place, 5.Q held, 5.Q-target-modes, 5.Q-entry7 and AD16).

## Decision

1. Each academic-paper file that a `rebuild: paper` row of `docs/academic-coverage.md` names, the four files `workflow_phase_details.md`, `imrad_template.md`, `latex_article_template.tex` and `literature_review_example.md`, and the seven files that were `rebuild: rebuttal` are each copied into one page of `skills/paper/`, section by section with the same words in the same order. A role's page is `references/<role>.md`, every other Markdown file `references/<file name with hyphens>.md`, and the `.tex` template `templates/latex-article-template.tex`. The only edits are these:
   - `paper`'s names for academic-paper's files, roles and records;
   - a sentence on a role, a skill or a mechanism `paper` has no counterpart for, left out;
   - a reference to another academic-paper file named as the page that holds it;
   - the character set and the no-history rule of this repository;
   - the Chinese-language rules left out, the English text kept;
   - a rule that contradicts the manuscript prose standard left out, as ADR 0002 decides.
2. `skills/paper/SKILL.md` is academic-paper's `SKILL.md`, each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text. Version Info and Version History are left out.
3. Each mode's roles, agent starts, stops and cycles are academic-paper's: twelve roles, the intake agent only in full, outline-only, abstract-only, lit-review and plan, the outline approval, the Generator-Evaluator Contract's four calls in full mode, at most two revision rounds in full and revision mode, and a Critical issue blocking Phase 7. Each part below is kept in its place in that structure, since the plan's goal requires it:
   - The LaTeX manuscript and its `.bib` are the manuscript's form, since the goal runs every mode on a LaTeX manuscript and its `.bib`.
   - Every change to the manuscript or its `.bib` is a patch applied by `anchorize_tex.py` and `apply_tex_patch.py`, since the goal moves the two scripts in for the revision patches.
   - The compile and its fix follow the patches, since a patch that breaks the LaTeX is otherwise found only by the user.
   - Academic-paper's rewrite of the whole draft after the peer review is made as one patch, since every change is a patch.
   - The claim check against each source's full text runs in full, revision and citation-check mode, as the goal names it.
   - The claim calibration with `calibration_counts.py` is kept, since it is part of the claim check.
   - The citation check of the cited sentences of each later patch is kept (ADR 0029), since a cited sentence a later patch adds is otherwise never checked and the claim check would not hold for the finished manuscript.
   - The `lookup.py` check of every reference the skill keeps, every other reference lookup and the `\cite` key check are kept (ADR 0017), as the goal names them.
   - Lit-review's identifier check is kept, since it is the `lookup.py` check of the references lit-review keeps.
   - The `/writing` review at the end of full and revision, with the findings the user accepts applied, is kept, since the goal applies the `/writing` findings the user accepts.
   - The draft writer's pass that judges and applies the `/writing` findings when the user asks is kept (ADR 0023), as the goal names it.
   - Intake's question whether full and revision end with `/writing` is kept (ADR 0031), asked by the session in revision, which has no intake agent, since the review is the user's choice.
   - Academic-paper's mode names stand under `/paper <mode>`, as the goal names them.
   - The run folder with `config.md` is kept (ADR 0020), since the records of these checks are written there.
   - The compile's engine is pdfLaTeX, since the scripts and the compile need one engine named.
   The RAISE compliance agent is left out, since `docs/academic-coverage.md` gives it to another skill. Every other choice of `paper` that academic-paper's text does not have is removed, except the deviations below, each kept for the reason given and under the ruling named:
   - Four refusals end a call before any agent starts: "Unknown mode", "An argument that does not exist", "The `.bib` is not one file" and "No prose standard". `docs/dev/skill-layout.md` asks that an input whose absence is a refusal says so; the third follows from the LaTeX manuscript and its `.bib`, and the fourth from Decision 4.
   - In the modes with no intake agent (revision, response-letter, format-convert, citation-check, disclosure, revision-coach, rebuttal-audit and the two calls) the session asks the user, in one message, only what the mode's items name, as academic-paper's modes without an intake agent take what they need from the call. Revision asks the rows Closing review, Claims not to make and Earlier papers, and citation-check the rows Claims not to make and Earlier papers.
   - The intake row Claims not to make, asked in full and revision and by the session in citation-check, is read by the citation compliance agent, which flags each sentence that states such a claim (ruling Open item AI2), since academic-paper's claim intent manifest carries these negative constraints and the claim check otherwise does not see them.
   - The intake row Earlier papers, asked in full and revision and by the session in citation-check, is read by the citation compliance agent, which flags the passages that closely repeat the authors' earlier papers (ruling Open item AD8), as academic-paper's citation compliance agent does.
   - A negative or null result is never written up, with one exception: a manuscript the user asks for as internal only, which the intake row Internal only records and the intake confirmation shows (ruling Open item AT), since the user does not publish such a result and an internal record of every attempt is asked for by name.
   - The calls `draft-review` and `figures` run the peer reviewer and the visualization agent on an existing manuscript (ruling Open item AD14), as academic-paper's Phase-by-phase Invocation Contract runs one role per call.
   - The stop "The citation style to confirm" is raised when the citation compliance agent finds that more than half the entries fail the same check (ruling AV14), as academic-paper's failure path F5 confirms the citation format with the user before fixing each entry.
   - The stop "A reference that cannot be confirmed" is raised only under strict, as academic-paper's intake question gives it; under mark only the reference is marked in `citation-report.md` and named in the final message.
   - The response letter, its check and the mode `response-letter` stand as Decision 5 gives them (rulings Open item 5.Q-rebuttal and 5.Q-letter-place), since academic-paper has no step that answers referee comments with a letter and academic-pipeline's external review protocol gives both steps.
   - The intake row Number of sources stands as Decision 6 gives it (rulings Open item 5.Q held and 5.Q-target-modes), since no strategist's brief in the 5.P check run named a target number of sources and that run went 79 min over its bar.
4. The manuscript prose standard stands in every role's prompt (ADR 0026), and lit-review mode and the strategist's page stay as step 5.P left them.
5. Revision-coach and rebuttal-audit are `paper`'s modes, with the revision coach's page and academic-paper's Rebuttal-Audit Mode section. Rebuttal-audit marks nothing as verified. Revision mode, when its comments are referee comments, ends with the response letter beside the revised manuscript, written by a fresh draft writer, and its check by a fresh peer reviewer with a verdict for each point, as steps 3 and 4 of academic-pipeline's external review protocol give them. `/paper response-letter <main.tex> <comments file>` writes and checks the same letter for a revision already made.
6. Intake has an optional row "Number of sources" in lit-review, full and outline-only mode. Given, the session splits it into one target range per literature strategist start, the ranges summing to the number.

## Alternatives rejected

- Keeping `paper`'s structure and running only the revision and full comparisons again: the structure that judges and the user had already ruled out for lit-review would stay in every other mode, and the result of such a comparison would not show which deviation made the difference.
- Widening step 5.P to every mode: 5.P was built and checked for lit-review alone, and its brief had not read the other modes against academic-paper.

## Consequences

- Each page of `skills/paper/references/` can be read against its source by `diff`, and a new deviation has to be argued against academic-paper's text with a run that shows it is better.
- `paper` has twelve modes and two calls. The pages `ai-disclosure.md`, `latex-template.md`, `modes.md`, `patch-file.md`, `planner.md` and `statements.md` are removed, and their content that the goal keeps stands as `paper`'s addition in the page of the source file whose step it serves.
- Removed from `paper`: the planner, the draft writer's abstract and statements, the intake agent of revision, format-convert, citation-check and disclosure, the unfinished-run stop, the stop on a research question the materials do not answer and the parts of the research question (ADR 0038), the approval of the revision items, the draft-review stops that academic-paper does not have, the anonymous copy, the palette outline, the one stop for every unsupported claim (ADR 0036), the check of each number against the result files (ADR 0028) and the reading of the findings pass (ADR 0029), and the plan's handoff stop.
- `rebuttal`, roadmap entry 7, has no work left, and `docs/academic-coverage.md` lists no `rebuild: rebuttal` row.
- The figures of `docs/figures/paper/` and `docs/figures/academic-paper-comparison/` draw `paper` as built, and `docs/glossary.md`, `docs/academic-coverage.md` and `README.md` describe it.
