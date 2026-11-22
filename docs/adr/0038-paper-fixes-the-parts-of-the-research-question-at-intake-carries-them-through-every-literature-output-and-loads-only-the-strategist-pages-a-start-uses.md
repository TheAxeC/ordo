# 0038. Paper fixes the parts of the research question at intake, carries them through every literature output, and loads only the strategist pages a start uses

Status: proposed; superseded by the ruling The academic-paper strategist of plan 5 in its parts for the literature strategist in every mode, for lit-review mode's intake and for the split of the strategist's page, the planner's reading of the parts in full and outline-only mode standing. By the same ruling, the intake agent splits the research question into its parts in full, outline-only and lit-review mode. That supersedes the Decision's sentence that the session splits it; superseded by 0042 in lit-review mode's split and in the strategist's use of the parts; superseded by 0043 in its standing parts, the intake agent's split of the research question and the planner's reading of the parts, so that no part of it stands

## Context

The lit-review comparison of `paper` on `v8.4.0-rc.8` against two runs of academic-paper 3.2.0 on the same request gave `paper` 0 of 4 verdicts (`.scratch/5-paper/agents/reviews/5.G-check-blind-comparison.md`, "Verdicts"). The judges held these causes against it (same file, "What the judges held against `paper`"):

- The parts of the research question were numbered two ways: theme run 4 numbered P1 to P3 otherwise, and its annotations kept its numbering. Judges 1 to 4.
- The annotations and the matrix recorded no part per source. Judges 2, 3 and 4.
- The gaps named sources and no search that found nothing. Judges 1, 2 and 4.
- One sentence set "458 of 464 lesions" against an F1 of 0.797, and one "divergent finding" set two results under different assumptions against each other. Judges 1 and 2.
- Harshman 1972 was reported with no index record and no readable copy, while a copy stands at `https://psychology.uwo.ca/faculty/harshman/wpppfac2.pdf`. Judges 3 and 4.
- Two sources were included with their abstracts not read. Judges 2, 3 and 4.
- The AI disclosure said "A person oversaw the process" in a run whose user had told it not to stop. The sentence is the template of the `paper` skill's `references/ai-disclosure.md`, "The line of a review". Judge 3.
- Tool names and run records stood in the review body, such as the lookup script's calls and "node 4 of the screening tree". Judges 1 and 2.

academic-paper's text fixes none of these fields. Its sessions wrote them into the brief of each theme agent. The first theme agent's brief of academic-paper's second run reads, in its item 5: "**Correspondence handling** (one of: assumes aligned mode / registration to common space / learned template or barycenter / transport coupling / permutation invariance / other, with one sentence), **Pipeline relation** ..., **Supervised?** ...". `grep -c 'Correspondence handling'` prints 173 on the second academic-paper run's `literature_review.tex`, 151 on the first academic-paper run's `literature_review.tex`, and 0 on the rc.8 run's `review.md`. The merge agent's brief of the second run asked for gaps "grounded in the matrix and in the theme agents' documented null searches, citing those searches" (item 3 of that brief). The judges' points on these fields stand in `.scratch/5-paper/agents/reviews/5.G-check-blind-comparison.md`.

The rule-by-rule check of the rc.8 run (`.scratch/5-paper/agents/reviews/5.H-rule-check.md`) read 384 rules against the run: 40 rules were dropped by at least one agent, 67 drops in all (section 2). The drops sit in lines 102 to 304 of the `paper` skill's `agents/literature_strategist_agent.md` at commit b8819b0, the four searches, screening, reading a candidate, scoring, the gates and the currency passes, at 15.2 percent of the settled verdicts against 3.4 to 5.9 percent in the other fifths of the page (section 3). Every start loaded the whole page of 10059 words and `references/patch-file.md` of 1015 words (`wc -w`), and a theme run never reaches the sections on a given `.bib`, a plan run, the sources' review, the sections without a source, an expanded revision, revision mode, the synthesis or the merge run.

The rulings of plan 5 are "Open item BS", "The rule-by-rule check", "Open item BT" and "Open item BU" (`.scratch/5-paper/plan.md`, Rulings).

## Decision

Each item below is a deviation from academic-paper 3.2.0, whose text leaves the shape of the review to its session.

- At intake, in full, outline-only and lit-review mode, the session splits the research question into its parts, numbers them once as P1 to Pn, gives each a closed list of answers ending with "other", and writes them in the row "Parts of the research question" of `config.md`, shown at the intake confirmation. Every start of the literature strategist uses them as recorded, and never renumbers, merges, splits or adds one. Reason: the run's shape then follows the question, and one numbering holds across theme runs.
- Each part is a field of every annotation (a value of its list and one sentence, "not addressed" or `[GAP: P<n>]`), a column of the literature matrix, a check of the gaps and a section of the synthesis. A theme run states by number which parts it covers. Reason: a reader finds each source's answer to each part, as academic-paper's sessions gave theirs.
- The merge run refuses a theme report whose parts differ from the recorded ones, once per theme run. The session resumes that theme run with the recorded parts and starts the merge run again, and a report that still differs is mapped and named in the limitations and the final message. Reason: a run never loops, and a mismatch never passes silently.
- Each gap names a search that found nothing, by its string or number, database and record count, a search run for the gap where none was, and the closest works on each side of it with their counts. The synthesis compares only like measures, calls a finding divergent only when two results conflict on the same question, and names for each part the searches that found nothing. Reason: a gap and a comparison can then be checked against the record.
- A work the search needs that no index holds is searched for a readable copy before it is called unfindable. A work no index confirms still gets no entry and no citation, as ADR 0032 decides. A candidate whose abstract no way gave is not included, and stands under "Not included: not read" in section 3 of `review.md`. Reason: an included source is a source read.
- The review's AI disclosure says whether a person reviewed the sources, from a line the session writes in `config.md` "Decisions" at the stop "The sources' review", and claims no oversight that did not take place. Reason: the line states only what took place.
- The commands, request addresses, reply statuses, notes of `lookup.py`, file names and screening-node names go to `search-log.md` in the run folder, or `search-log-theme-<k>.md` for a theme run; `review.md` keeps for each search the database, the string, the filters, the date, the count and the records taken, and names the log once. Reason: the review reads as a review, and the run's record is kept.
- The strategist page is a core page and nine pages, one for each section only some starts read: a given `.bib`, a plan run, the synthesis, the sources' review, the sections without a source, an expanded revision, revision mode, a theme run and the merge run. Each start's prompt names the core page and the pages of its kind of start, and `references/patch-file.md` only for a start that writes a patch. Reason: a start loads only the rules it applies, as `docs/dev/skill-layout.md` says for material only some runs need.

## Alternatives rejected

- Leaving the shape of the review to the session, which is academic-paper's text: academic-paper's sessions wrote the part fields into each brief, and `paper`'s runs carried none, so the shape depended on a session's choice.
- Running the same comparison again on `v8.4.0-rc.8`: the skill would be unchanged, and so would every cause the judges named.
- Keeping the whole strategist page in one load: each theme run left about 65 of the page's rules not reached (258 such verdicts over the four theme runs, section 2 of the check), and the drops sit in the sections every start applies.

## Consequences

The run's shape follows the research question in every run that searches the literature. Each annotation carries one more field per part, and the matrix one more column per part. The run folder holds two more kinds of file, `search-log.md` and `search-log-theme-<k>.md`. The strategist page is ten pages, and `skills/academic/paper/SKILL.md`, its Agent prompts row, `agents/intake_agent.md`, `references/planner.md`, `references/ai-disclosure.md`, `docs/academic-coverage.md`, the glossary and ADRs 0032 and 0037 carry the change.
