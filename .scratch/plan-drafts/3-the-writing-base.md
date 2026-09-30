# Roadmap draft: 3. The writing base

Entry 3 says it is "drafted again, from its sources, before it is opened" (`docs/roadmap.md` line 51), so `/plan 3` cannot open it until its goal and gate are redrafted and approved. This is that redraft, done as `/roadmap add 3` drafts one and stopped where that command stops: at the diff, for Axel's approval or correction. Nothing in `docs/roadmap.md` is changed until then.

## What the entry says now (`sed -n 49,54p docs/roadmap.md`)

- Goal: A `writing` skill folder the writing skills share: the prose standard, the anti-pattern table, and the checks for non-ASCII, dash asides, history words and word counts per section.
- Gate: the checks run on one sample file holding one planted violation per check, flag each of them, and flag nothing in a clean file; the checks run on a real draft of yours, and you review what they flag; the skill follows `docs/dev/skill-layout.md`; the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, checked by reading both.
- Waits on: 1, 2, 2.B and 2.C, all done.

## Why it is redrafted

- The current gate passes when a script "flags" violations. Under the rule "scripts compute facts; judgment is read" (`docs/dev/change-standard.md`, its section), whether a dash is an aside, whether a word is history, or whether a sentence is filler is judged by reading; a script may only count, and its count is never a finding. So the checks as written cannot be the gate.
- Its sources, read in full for this draft: the three `rebuild: writing` rows of `docs/academic-coverage.md` (lines 76, 100, 101), which name `research-hub`'s `academic-paper/references/academic_writing_style.md` (188 lines: precision, antecedents, the hedging scale, tense per section, the discipline registers), `writing_judgment_framework.md` (59 lines: the paragraph-removal clarity test, the reader's four questions, the discipline voice, the "so what" per section) and `writing_quality_check.md` (173 lines: flagged terms, dash and semicolon limits, throat-clearing, rule of three, synonym cycling, binary contrast, mirror structure, sentence-length runs); and Ordo's `skills/repo-setup/templates/docs/dev/prose-standard.md` (75 lines), which already holds most of `writing_quality_check.md` in stricter form (em dash zero, the same flagged terms, the same throat-clearing list).
- What the three sources add beyond the prose standard: terms defined at first use, clear antecedents, the hedging scale with when to hedge and when not, tense per section, the Engineering and CS register, the clarity test, the reader's four questions and the "so what" per section. The revision decision matrix belongs with `rebuttal` (the coverage row says so).

## The draft

- Goal: A `writing` skill folder that the writing skills read from (`literature`, `paper`, `paper-review` and `grant` wait on it in the roadmap): `references/` holding Ordo's prose standard and, from the three `rebuild: writing` sources, the rules for academic prose it lacks; and a `/writing <file>` review that reads a draft against those rules section by section and reports each violation with its line quoted and its rule named, the user deciding on each.
- Gate: `/writing` run on a real draft of yours reports its violations, each with its line quoted and its rule named, and you mark each report right or wrong; the ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, checked by reading both; the skill follows `docs/dev/skill-layout.md`.
- The gate's answer to "could this pass without the goal being reached?": No. The review's findings are judged by you on a real draft, and the records are checked by reading the source and the new file side by side.
- Waits on: 1, for the layout; 2, for what the base covers; 2.C, for the rule it is built under. All three are done.
- Place: where it stands, before 4, 9, 5, 6 and 8, which wait on it (`awk` over the roadmap's "Waits on" lines).

## Decisions for Axel

- D1, a counting helper. Options: (a) a script `skills/writing/templates/counts.py` that computes only counts, shown beside the review as an indication and never as a finding: non-ASCII characters by line, em and en dashes and spaced hyphens by line, semicolons per 1000 words, words per sentence, and runs of five or more sentences whose word counts differ by at most 5; its approval of what it computes is this decision; pros: the reading is pointed at the lines where a count is high, and the counts are exact; cons: a script and its test to keep, and the pull to treat its output as a verdict. (b) No script; the review reads, and `LC_ALL=C grep -n '[^ -~]'` is named for the ASCII rule as the prose standard already does; pros: nothing to maintain, and the rule "judgment is read" holds without a boundary to police; cons: a long draft's sentence-length runs are found by reading only. Recommendation (b), since the prose standard's own "How it is applied" already names the one fact check it needs, and every other rule is judged per instance. The lazy option is none: (b) costs more reading per run.
- D2, entry 4 (`code-comments`), which "waits on 3, for the checks": with the gate above there are no checks to wait for. Options: (a) entry 4 redrafted after entry 3 is approved, waiting on 3 for the prose rules only; (b) entry 4 redrafted now alongside. Recommendation (a), since its redraft follows from D1. The lazy option is none.
