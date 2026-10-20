# Draft writer

The draft writer agent reads this page to write the first draft of a paper, to write the patches that change a manuscript file, and to write the statements and the AI disclosure. In full mode it writes the first draft whole to `main.tex` in the manuscript's folder, at the path the session gives. Every later change is a patch, written as `references/patch-file.md` gives. The agent writes no other file.

## What the agent reads

- `config.md`: Citation style, Length, Venue, Venue limits, Language, Style profile, the statement rows, the Notes and the Decisions.
- `outline.md` and `arguments.md`, for the first draft.
- `review.md` and `refs.bib` of the literature strategist, or the manuscript's `.bib`, for the sources.
- The project's own results, data and code that the Materials in hand row names.
- For a patch: the file, its block manifest, the path of its patch and what to change, with `references/patch-file.md`.
- For a revision: the numbered items of `items.md`. For a draft review: the issues of `review-<r>.md`. For a citation fix: `citation-report.md`. For an integrity fix: the integrity record the prompt names. For an accepted `/writing` finding of the closing review: its number and text.
- `references/statements.md` and `references/ai-disclosure.md`, for the statements.

A missing input is handled as follows:

| Missing | The agent does |
|---|---|
| The argument blueprint | Infers the claim-evidence-reasoning chain from the outline's key arguments and marks it "argument inferred". |
| The assigned sources of a section that is not original analysis | Writes `[GAP: literature needed]` at the place. |
| An outline without a content summary | Infers the section's content from the literature matrix, and says in the report that quality may be reduced. |
| A chain with too little evidence | Writes with hedging language and marks `[GAP: evidence needs strengthening]`. |
| The key results of a source | Writes no claim from that source and marks `[GAP: key results of <key>]`. |
| The citation style | Uses the style `config.md` states. If it states none, the agent writes `\bibliographystyle{plain}` and the report says so. |

## The anti-leakage rule

The draft is built from the project's materials and not from the agent's memory.

- Every claim traces to a source in the literature report or the `.bib`, or to the project's own data.
- Every citation is of a source in the literature report or the `.bib`. A reference outside them is added only when the user asked for it in `config.md`.
- The method section describes only what the project's materials document. It does not infer or interpolate a procedure.
- A topic the materials do not cover is written as `[GAP: <what is missing>]` at its place and listed in the report. It is never filled from memory.
- A gap is filled from the agent's knowledge only where `config.md` grants permission for it, and the filled passage then carries the tag `[LLM-SUPPLEMENTED]` and is listed in the report.
- The rule restricts factual content: claims, citations, data and the description of methods. The agent uses its knowledge of academic conventions, argument and the discipline's norms freely.

## The first draft

### Setup

Before the first section the agent checks that it holds `config.md`, the literature report or `.bib`, the outline with its word counts, and the argument blueprint. A missing one is handled under "What the agent reads".

### The file

- `main.tex` holds `\documentclass`, the title and the authors, an `abstract` environment, the sections of the outline as `\section` and `\subsection`, `\bibliographystyle{<style>}` and `\bibliography{refs}`.
- The abstract environment holds the single line `[GAP: abstract pending]`, which the abstract agent replaces by a patch.
- The style in `\bibliographystyle` is the style of the Venue row or of the venue's template among the Materials in hand.
- Citations are a plain `\cite{key}`. The key is the entry's key in the `.bib`.
- A figure or table is a `figure` or `table` environment, one block of the file.
- The draft has no reference list text, since BibTeX builds it.

### Each section

For each section of the outline, in the outline's order, the agent:

1. Reads the section's purpose, content summary, sources and arguments, and the section's chains of the argument blueprint.
2. Writes the section from them.
3. Cites its sources.
4. Ends the section on a link to the next one.
5. Checks the word count against the allocation.
6. Reads the section for clarity, logic and completeness.

A section opens with its point and ends on its link to the next section. It has no preview of itself and no summary of itself.

### Paragraphs

A paragraph moves in this order, and each part is one sentence where it can be:

1. The topic sentence states the paragraph's point.
2. The evidence supports the point with a citation.
3. The explanation says how the evidence supports the point.
4. The link joins the paragraph to the next one, or ties it back to the section's argument.

- A paragraph stays within the prose standard's length of about four sentences, which makes each part short.
- A paragraph with several sources gives each source's result in the evidence sentence or sentences, and does not list data without an explanation.
- Each section has at least three paragraphs in this order, except the first paragraph of the introduction and the last of the conclusion.
- At least 80 percent of the paragraphs follow this order.
- Paragraphs carry unequal weight, following the clarity test. A load-bearing paragraph, one whose removal breaks the argument, is written with the most care and read and revised once more after its section is written. A supporting paragraph, one whose removal loses context but not the argument, stays short and is written once.
- A draft in which every paragraph has the same weight fails the clarity test.
- Transitions are carried by the topic sentences. A transition word is used only where the relation between two sentences is not obvious, and it is varied within a page.
- A transition between sections is a complete sentence and not a single word.
- Direct quotes are limited to one per section, and only where the exact wording matters, where the quote is a definition, or where it is particularly strong. The quote carries its page: `\cite[p.~45]{key}`.

### Citations

| Situation | The agent writes |
|---|---|
| One source, and its author matters | The author in the sentence, then `\cite{key}`: "Smith~\cite{smith2024} showed that ...". |
| One source, and the point matters more | The sentence, then `\cite{key}` at its end. |
| Several sources for one point | "Several studies confirm this~\cite{a,b,c}." |
| A source whose view differs from the paper's | "While Smith~\cite{smith2024} argued X, this paper contends Y because ...". |
| A source the agent has not read, known from a citing source | "<Original> (as cited in~\cite{citing})". The paper has at most 3 of these. |

- A factual claim has at least one citation. A claim with none is rewritten with hedging language, or marked `[GAP: citation needed]`.
- A source cited for an event or a result is one that existed before it. The agent identifies the date of each cited document and of each event from the year of the entry in the `.bib` or the literature report.
- A sentence that says one event led to, enabled or superseded another has the date of the first before the date of the second. If the dates are absent from the `.bib` and the report, the agent hedges the sentence or leaves the claim unwritten.
- A sentence with a present-tense or relative-time word such as "currently", "the latest" or "recently" is anchored to a date or a version: "as of <year>" or "the <year> edition".
- A claim about a forthcoming version is allowed when the sentence says it is forthcoming.

### Statistics and language

Statistics:

- Statistical symbols are italic: *M*, *SD*, *t*, *F*, *p*, *N*, *n*, *r* and *R* squared.
- A *p* value is exact, such as *p* = .032, unless it is below .001, where it is written *p* < .001.
- An effect size is always reported, such as Cohen's *d*, eta squared or *r*.
- A confidence interval is written as 95% CI [lower, upper].
- Proportions, correlations and inferential statistics take 2 decimal places, percentages 0 or 1, means and standard deviations 2 or the precision of the measurement, and *p* values 3.

Bias-free language:

- The agent generally prefers person-first language, such as "people with disabilities", and follows the community's own preference where it is known, such as "Deaf community".
- It uses singular "they" and not "he or she", and "women and men" and not "males and females", unless the sex is biological.
- It gives ages as ranges: "older adults (65+)" and not "the elderly".
- It capitalizes Black, White and Indigenous, and gives the specific group when it is known: "Korean American" and not "Asian".

### Word counts

After each section the agent records the section's target, actual and deviation, and the running total against the total target.

- A section is within 15 percent of its allocation.
- The total is within 10 percent of the target.
- A section more than 15 percent over is trimmed: the agent finds its 3 longest paragraphs, removes redundant argument and recounts. If it is still over, the report marks it "requires user decision on whether to keep".
- A section more than 15 percent under is expanded: the agent finds its 2 weakest-argued paragraphs and its unused assigned sources, adds paragraphs and recounts. If it is still under, the report marks it "requires additional analysis".
- A total more than 10 percent off is corrected in the section with the largest deviation. If that section cannot change, the report says why.
- When the total is more than 20 percent over, the agent trims redundant citations in the related work first, then merges paragraphs with overlapping arguments, then shortens the introduction's background.
- When the total is more than 20 percent under, the agent adds the dialogue with prior research in the discussion, then detail in the results, then problem context in the introduction.

### Adjustments by type

- Theoretical: the evidence of a paragraph is theoretical literature and not empirical data, and the explanation emphasizes the reasoning.
- Case Study: the results use descriptive narrative and include the context.
- Policy Brief: the register favours the decision-maker's reading, with less jargon and more practical recommendation.

### Figures in the first draft

The first draft includes no figure environment. The agent adds the figures by a patch after the first draft, from `figures.md`, with their image names.

- When the Notes of `config.md` say "figures in parallel", the session starts the visualization agent together with the draft writer of the first draft. The patch adds the figure environments after both have ended.
- Without it, the visualization agent runs after the first draft, and the patch follows it.

## Patches

Every change to a manuscript file after the first draft is a patch, written as `references/patch-file.md` gives.

- The agent changes only the blocks that an item, issue or finding names, and writes each rewritten block whole in `new_text`.
- A rationale is one line that says why the operation answers its items.
- `roadmap_item_ids` holds the ids of the items the operation answers, as `references/patch-file.md` lists them.
- The `round` field holds the number of the draft review round whose issues the patch answers, and 1 for any other patch.
- A relocation is a `delete_block` of the block and an `insert_after` of the same text.
- When an item needs a change to a heading or to most of the blocks, the agent writes the patch anyway.
- The agent names that item in its report as structural, so that the user is told before the stop "A structural patch".
- A patch for a rejected patch is written once against the manifest the session gives, and in whole. The agent does not edit the rejected patch.
- The agent does not apply a patch, and it does not compute a hash.

### Severity

The agent handles the items of a draft review or of a revision in this order: Critical, Major, Minor, then Suggestion.

- The first time the agent works on a set of items, it addresses every Critical and Major item and attempts the Minor items when the word count allows.
- The second time, it addresses the Critical and Major items that remain, then the Minor ones, and takes up the Suggestions that are viable.
- The SERIOUS, MEDIUM and MINOR issues of an integrity record rank as Critical, Major and Minor.
- An item it does not address is named in its report as an acknowledged limitation, with the reason.
- The report holds a revision log with one row per item:

```
| # | Source | Severity | Feedback | Section | Action taken | Status |
|---|---|---|---|---|---|---|
| 1 | Reviewer | Critical | Weak justification of the method | 3.1 | Added 2 paragraphs | Resolved |
```

## Statements and disclosure

- The agent writes the six statements, in full mode and in disclosure mode, from `references/statements.md` and `references/ai-disclosure.md` and from the rows of `config.md`.
- A statement that the manuscript already holds is left unchanged.
- The statements are written as one patch per file, with the id of the mode in `roadmap_item_ids`.
- The AI disclosure names the model by the identifier the agent's runtime states for itself. When the session gives the served model in the prompt, the agent writes that identifier.
- In disclosure mode the agent also writes `disclosure.md` in the run folder. It holds the venue, the policy source and the access date, the place of the disclosure, and the list of the gaps.

## The report

The agent's report holds:

- The draft metadata: the total word count and the target, the deviation, the sections completed, the number of citations, and the table of words per section with target, actual and deviation.
- The list of gaps with the place of each, the passages tagged `[LLM-SUPPLEMENTED]`, and the sections marked "argument inferred".
- The statements the co-authors must agree on, as `references/statements.md` says.
- For a patch, the revision log and the items it did not address.
