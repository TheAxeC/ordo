# Anti-patterns

The patterns in the table below are judged by hand. Some are patterns `templates/check_prose.py` does not find. Others are script reports that need judgment: a flagged discipline term, or sentence-length variation by section. The `writing` skill, and each writing skill built on it, consults the page when it weighs a report.

## Patterns judged by hand

| Pattern | Why it fails | Fix |
|---|---|---|
| Forced groups of three: every argument has three sub-points and every list has three items | Real analysis does not always come in threes, and two strong points carry more than three padded ones | Prose standard, section D. Two points are fine, and so are five |
| Uniform paragraph length: every paragraph about the same length, such as 150 to 200 words each | Natural writing varies its paragraphs, with short ones for emphasis and longer ones for complex arguments | Prose standard, section D |
| Synonym cycling: three or more synonyms for one concept within a paragraph, such as "students", "learners", "participants" and "subjects" | Consistent terminology is a virtue in academic writing, and the swapped terms confuse the reader | Prose standard, section D |
| Mirror structure: every section with the same internal structure, such as a topic sentence, three evidence points and a synthesis | Sections serve different purposes and need different internal rhythms, and the repeated structure reads as a template | Prose standard, section D. Methods can be procedural, and a discussion can be exploratory |
| A binary contrast split over two sentences, "Not X. Y.", such as "Not speed. Accuracy." | The device works once and becomes a tic when repeated. The `contrast` check reads one sentence at a time and misses this form | Prose standard, section D, sets the limit, and this form counts toward it |
| A binary contrast within one sentence joined by a dash, a colon or a semicolon, such as "It's not about speed: it's about accuracy." | The `contrast` check counts the one-sentence form only when a comma or "but" joins it. The check `dash-aside` reports an em dash, an en dash and a spaced dash, and in LaTeX `---` and a spaced `--`; an unspaced `--` between two words in LaTeX is judged by hand, since LaTeX also writes ranges and joint names such as `Navier--Stokes` that way. The colon and semicolon forms are judged by hand, since a pattern that finds them all flags mostly sentences that are not contrasts | Prose standard, section D, sets the limit, and this form counts toward it |
| A flagged word that is standard terminology in the text's discipline: "paradigm shift" in philosophy of science, "landscape" used literally in ecology or geography, "robust estimator" in statistics, "navigate" used literally in wayfinding research | A `flagged` report on it is a false alarm under the exemption in prose standard, section A | Keep the word |
| Five or more consecutive sentences within a narrow range wider than 2 words, such as all between 20 and 25 words | The `equal-length` check does not flag it, and the run still reads as metronomic | The fixes of the next row |
| A run of sentences of equal length in a section whose content calls for variation in length | The variation a section needs depends on the section, as the list below gives it | Insert a sentence of 10 words or fewer, combine two short sentences into one if the pattern is monotonously short, or read the paragraph aloud and vary what sounds metronomic |

Prose standard, section E, sets the minimum variation, and its rule holds in every section. The variation each section needs beyond that minimum, for judging an `equal-length` report:

- **Abstract.** Moderate, at a factual and steady pace.
- **Introduction.** High: short sentences for the hook, long ones to build.
- **Literature review.** Moderate, at a steady analytical pace with an occasional short synthesis.
- **Method.** The least variation of the sections, since procedural text runs to a uniform length. Section E's rule still holds.
- **Results.** Moderate: short sentences for key findings, longer ones for detailed descriptions.
- **Discussion.** The highest: short for emphasis, long for interpretation, and the shortest for conclusions.

## Roadmap sentence

An introduction's roadmap sentence, such as "Section 2 reviews the literature, and Section 3 describes the method", is kept. It names other sections of the text, while prose standard, section C, bans describing the section a sentence stands in.

## Patterns the script finds

Each of these is reported by a check of `templates/check_prose.py`, and every check of the script has one entry. Each entry names where the rule is, a section of the prose standard or the user's `--limit`, and some add the fix:

- **Filler, vague and flagged words.** The checks `filler`, `vague` and `flagged`, prose standard, section A.
- **Em dashes and dash asides.** The check `dash-aside`, prose standard, sections 0 and B.
- **Semicolons.** The check `semicolons`, prose standard, section B. A semicolon that is kept joins closely related parallel structures, and any other semicolon becomes a full stop.
- **Colon-and-list paragraphs in a row.** The check `colon-lists`, prose standard, section B. The two paragraphs' lists become one consolidated list. A list of fewer than three items may go into the prose, as section D allows.
- **Throat-clearing openers and meta-commentary.** The check `throat-clearing` finds the phrases prose standard, section C, holds, and six more: `In today's rapidly evolving`, `It is important to note that`, `As a matter of fact`, `We now turn our attention to`, `This section will discuss` and `The following paragraph examines`. The fix for an opener is to delete it and state the point, and for meta-commentary to turn to the subject.
- **Binary contrasts within one sentence.** The check `contrast` finds "not X, Y" and "not X but Y" within one sentence, prose standard, section D.
- **Runs of equal-length sentences.** The check `equal-length` flags a run of five or more sentences whose longest and shortest differ by at most 2 words. The rule is prose standard, section E.
- **Words of history.** The check `history`, prose standard, section 0. The fix moves the history to the log or cuts it.
- **Characters outside ASCII.** The check `non-ascii`, prose standard, section B.
- **Sections over a word limit.** The check `section-words` flags a section over the word limit the user passes with `--limit`, such as a funder's or a venue's limit, and the fix is to cut the section to the limit. It also flags line 1 when no heading of the file matches a `--limit`, and the fix is to correct that `--limit`.
