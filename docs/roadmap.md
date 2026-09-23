# Roadmap

What is open, in the order it is built, and what is done. An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`).

Status: `[ ]` open, `[~]` in progress, `[x]` done (its gate ran and passed, with the output beside it).

# Open, in execution order

<!-- An entry:

## <n>. <title>

- Status: [ ]
- Goal: <what exists when it is done, in one or two sentences>
- Gate: <the command, the test and what it asserts, or the observable result>
- Waits on: <entry numbers with the reason, or nothing>
-->

## 1. One layout for every skill

- Status: [ ]
- Goal: A written skill layout standard, `docs/dev/skill-layout.md` (the section order Quick start, Use instead, What it reads, Steps, Stops, Anti-patterns, Rules; a table where the content is a table; one rule per bullet), and all ten skills under `skills/` rewritten to it with no rule lost or changed in meaning.
- Gate: you approve `docs/dev/skill-layout.md`; a layout check over every `skills/*/SKILL.md` exits 0, and its test fails on a skill with a section missing or out of order; each skill's rule inventory (one line per rule of the old file) maps every rule to its place in the new file, the inventory check exits 0, and its test fails on a rule with no place; `/refute` on each step finds no rule dropped or changed in meaning; every command in `docs/dev/building.md` passes and `npx skills add . --list` lists the ten skills.
- Waits on: nothing.

## 2. Coverage inventory of the academic skills

- Status: [ ]
- Goal: A list of every file of the four installed academic skills (academic-paper, academic-paper-reviewer, academic-pipeline, deep-research), each marked rebuild, rebuild later or drop, with its reason.
- Gate: `docs/academic-coverage.md` names each of the 169 files once with its mark and reason; a check that every file `find` lists under the four skill folders appears exactly once exits 0; you approve the list.
- Waits on: nothing.

## 3. The writing base

- Status: [ ]
- Goal: A `writing` skill folder the writing skills share: the prose standard, the anti-pattern table, and the checks for non-ASCII, dash asides, history words and word counts per section.
- Gate: each check has a test that fails on a planted violation and passes on a clean file; the skill follows `docs/dev/skill-layout.md` and the layout check passes on it.
- Waits on: 1, for the layout; 2, for what the base covers.

## 4. code-comments

- Status: [ ]
- Goal: A skill that checks and rewrites the comments of a diff: what the code does and why, no history, no step numbers, ASCII only.
- Gate: its check flags history words, step numbers, dates and non-ASCII in a diff's comments, and its test fails on each planted case; one real run on a cathedra or game-engine diff that you review.
- Waits on: 3, for the checks.

## 5. paper

- Status: [ ]
- Goal: The paper skill: drafting, structure, citations, figures and statistics, disclosure statements and revision patches, as the coverage inventory marks them rebuild, with the `tools/manuscript` scripts moved in.
- Gate: `anchorize_tex.py` and `apply_tex_patch.py` pass their tests in the skill; the `\cite`-against-`.bib` check and the DOI check pass their tests; a side-by-side run against academic-paper on a real revision round, compared blind, wins or ties.
- Waits on: 3, for the writing base; 2, for the coverage.

## 6. paper-review

- Status: [ ]
- Goal: The internal review skill: the reviewer roles, the editor's synthesis and the re-review mode.
- Gate: every finding cites a line; a side-by-side run against academic-paper-reviewer on a paper with known referee reports, compared blind, wins or ties.
- Waits on: 3, for the writing base; 2, for the coverage.

## 7. rebuttal

- Status: [ ]
- Goal: The response letter for a real submission round, from the referee comments and the revision's apply report.
- Gate: every referee point has a response and a pointer to its change; a check that no point is left unanswered, with a test that fails on a missing response.
- Waits on: 5, for the apply report; 6, for the point table.

## 8. grant

- Status: [ ]
- Goal: The grant skill with per-funder config: required sections, page limits, evaluation criteria and the funding statement.
- Gate: the checks for limits, required sections and the statement text pass their tests; a side-by-side run on a section of a past application, compared with what was submitted.
- Waits on: 3, for the writing base; 2, for the coverage.

## 9. literature

- Status: [ ]
- Goal: The literature skill: search through Crossref, OpenAlex, Semantic Scholar and arXiv, source verification, synthesis and the `.bib`.
- Gate: every source it cites resolves; a side-by-side run against deep-research on a real topic, compared blind, wins or ties.
- Waits on: 3, for the writing base; 2, for the coverage.

## 10. idea

- Status: [ ]
- Goal: The idea skill: the interview that sharpens an idea, and the novelty check with cited literature.
- Gate: one real run that you review, whose novelty claim cites the sources it checked.
- Waits on: 9, for the literature search.

## 11. scaffold

- Status: [ ]
- Goal: `repo-setup` renamed to `scaffold`, with the `library` and `research-project` profiles, the Python standard (ruff, pyright in standard mode, Python 3.10 or newer) and the C++ standard, hub-specific config, and Ordo's own `CLAUDE.md`.
- Gate: no file names `repo-setup` (a grep prints nothing); each profile scaffolds a scratch folder that passes `sync_rules.py` and `check_config.py`; `sync_rules.py` exits 0 on Ordo.
- Waits on: 1, for the layout.

## 12. project-docs

- Status: [ ]
- Goal: A skill that writes and keeps the main README and `code/README.md` of a project.
- Gate: one real run on a research project that you review.
- Waits on: 11, for the profiles.

## 13. researcher

- Status: [ ]
- Goal: The researcher skill: the new-project and revise roadmap templates, venue files in `venues/`, and plan-orchestration's support for SLURM jobs.
- Gate: a test that every template entry has a gate and that its dependencies exist; the SLURM support has a test on a stub scheduler.
- Waits on: 5 to 12, for the skills its entries call.

## 14. submit-manuscript

- Status: [ ]
- Goal: A skill that fills a submission portal from the project and the venue file, stops for every approval, never presses the final Submit, and writes a submission record.
- Gate: one real run on a portal up to its last page, with the record written.
- Waits on: 13, for the venue files; 5, for the documents.

## 15. submit-grant

- Status: [ ]
- Goal: The same for grant portals, reusing the per-portal notes.
- Gate: one real run on a grant portal up to its last page, with the record written.
- Waits on: 14, for the portal notes; 8, for the documents.

## 16. Switch over

- Status: [ ]
- Goal: The new writing skills replace the installed academic skills.
- Gate: your global `CLAUDE.md` and research-hub's `CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `tools/manuscript` points at `paper`.
- Waits on: 5 to 10, each with its side-by-side run passed.

# Done

<!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->

# Dropped

<!-- - <n>. <title>: <the reason> -->
