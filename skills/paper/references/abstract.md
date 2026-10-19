# Abstract

The abstract agent reads this page to write the abstract and the keywords of the paper from the finished draft. It writes the abstract as a patch, as `references/patch-file.md` gives, and changes no other file. In abstract-only mode the paper is already written and its body is stable.

## What the agent reads

- The draft in the main `.tex`, which is its primary input, and the files it inputs.
- `config.md`: Venue, Venue limits (the abstract limit and the keyword range), Language, Paper type, Style profile and the Notes.
- The manuscript's `.bib`, to check that no citation enters the abstract.

## Which abstract

| Type | Form | Length |
|---|---|---|
| Journal article, structured | Labelled sections: Background, Purpose, Method, Results, Conclusion. Many journals in the social sciences and medicine require it. | 150 to 250 words, the usual journal standard |
| Journal article, unstructured | One paragraph without labels, in the flow context, problem, purpose, method, key results, implications. Common in the humanities and some social sciences. | 150 to 250 words, the usual journal standard |
| Conference paper | Four parts: the problem and motivation, the approach, the key results, the significance. | 100 to 200 words |
| Conference abstract | The form the call for papers states. | 200 to 500 words, as the call states |
| Extended conference abstract | Longer, for a conference submission. It may hold a brief literature review and preliminary results. | 500 to 1,000 words |
| Dissertation | The five parts below. | Up to 350 words |

- A journal abstract may run to 300 words when the venue states no limit.
- A limit in the Venue limits row replaces any of the lengths above.
- The paper type and the venue pick the form. A form that the venue states, structured or not, is the form used.
- The keyword range is 5 to 7 keywords, and the Venue limits row replaces it when it states one.

## The five parts

The abstract has these five parts, in this order. A structured abstract labels them, and an unstructured one runs them together.

| Part | Length | Content |
|---|---|---|
| Background | 1 to 2 sentences | The context and the problem. |
| Purpose | 1 sentence | The specific objective or research question. |
| Method | 1 to 2 sentences | The approach, the data and the analysis. |
| Results | 2 to 3 sentences | The key results, the most important ones and not all of them. |
| Implications | 1 to 2 sentences | The significance, the practical implications or the recommendations. |

Patterns that start a part:

- Background: "[Topic] has become increasingly important because ...", "Despite growing interest in [topic], little is known about ...", "Recent developments in [field] have raised questions about ...".
- Purpose: "This study examines [what] in [context].", "The purpose of this research is to [verb] [object].", "This paper proposes [framework] for [application]."
- Method: "Using [method], this study analyzed [data] from [source].", "A [design] approach was employed, involving [participants or data].", "Data were collected through [instrument] and analyzed using [technique]."
- Results: "The results indicate that [result].", "The analysis revealed [main result], with [specific metric]."
- Implications: "These results have implications for [practice, policy or theory].", "The results suggest that [stakeholders] should [action].", "This research contributes to [field] by [contribution]."

## Writing the abstract

1. Extract the key points from the finished draft: the problem and its context, the purpose, the method, 3 to 5 key results and the main implications.
2. Write the parts in formal academic prose.
3. Name the results specifically, with the numbers the paper reports, such as percentages and effect sizes.
4. Use the present tense for established facts and the past tense for what the study did.
5. Check each number and each claim of the abstract against the body of the paper.

The abstract:

- is self-contained and readable without the paper.
- has no citation, unless the field's convention requires one.
- defines each abbreviation it uses.
- does not open with "This paper".
- does not say "results will be discussed", since the abstract holds the results.
- does not state a result vaguely, as in "significant results were found".
- leaves out method detail that does not matter for the reader's decision.
- does not open with a generic statement or a long history of the field.

## The four-part conference form

A conference paper's abstract has these four parts:

1. The problem and motivation, in 1 sentence.
2. The approach, in 1 sentence.
3. The key results, in 1 or 2 sentences.
4. The significance, in 1 sentence.

## The keywords

- The keywords are 5 to 7 terms that are not in the title and complement it.
- They mix broad and specific terms.
- They include 2 to 3 core concepts, 1 to 2 of the context (the place, the institution or the period), 0 to 1 of the method when it is distinctive, and 1 of the field.
- They are lowercase unless a proper noun, and they use established terms. If the venue provides a controlled vocabulary, the keywords come from it.
- They stand in the keywords line of the manuscript's template, or after the abstract as `\textbf{Keywords:}` followed by the terms when the template has none.

## Abstract-only mode

In abstract-only mode the abstract is compiled from a stable body. These protections apply:

- **A word budget below the cap.** Words are counted by splitting the text on whitespace. The abstract keeps 3 to 5 percent below the hard cap of the venue or of this page.
- **Protected hedging.** The hedge that qualifies each result in the body stays in the abstract's statement of that result. So does every phrase that the Notes of `config.md` or an issue of a draft review marks as protected. Compression removes other words first.
- **Explicit time bounds.** A reflexivity statement in the abstract states its time with an explicit year range, a past-tense verb that fixes the time, or the prefix "former". It does not use "during this period" or "at the time".
- **No audit that did not run.** The abstract and the agent's report claim no audit, review or verification that the run did not make, and they state no passed state.

## The patch

- The agent finds the `abstract` environment, the `\abstract{...}` command or the template's equivalent, and the keywords line.
- It replaces the abstract block and the keywords block by a patch whose `roadmap_item_ids` name the mode: `abstract-only` in abstract-only mode and `full` in full mode.
- When the file has no abstract block, it inserts one after the block that holds the title and the authors.
- A placeholder `[GAP: abstract pending]` in the file is the block that the patch replaces.

## The report

The agent's report holds this table, with a value for each row:

| Metric | Value |
|---|---|
| Word count | <N> words |
| Parts covered | <N> of 5 |
| Keywords | <N> |
| Citations in the abstract | <N> |
| Abbreviations defined | yes or no |

- The abstract is complete when it covers all five parts (four for a conference paper), is within the length, has 5 to 7 keywords that complement the title, and has no citation.
