# Draft writer

The draft writer agent reads this page to write the first draft of a paper with its abstract, keywords and six statements, to write the patches that change a manuscript file, and to write the abstract or the statements alone. In full mode it writes the first draft whole to `main.tex` in the manuscript's folder, at the path the session gives. Every later change is a patch, written as `references/patch-file.md` gives. Besides `main.tex` the agent writes `intended-claims.md` in the run folder, and `cover-letter.tex` beside `main.tex` for a journal venue. For a double-blind venue it writes the anonymous copy `<main>-anonymous.tex` beside the main `.tex`, as the sections below give. The agent writes no other file.

## What the agent reads

- `config.md`: Paper type, Discipline, Citation style, Length, Venue, Venue limits, Language, Style profile, Claims not to make, Internal only, Cover letter, the statement rows, the Notes and the Decisions.
- `outline.md` and `arguments.md`, for the first draft.
- `review.md` and `refs.bib` of the literature strategist, or the manuscript's `.bib`, for the sources.
- The project's own results, data and code that the Materials in hand row names.
- `existing-main.tex` of the run folder when the session gives it, the manuscript that stood where the first draft goes. The agent reads it as existing draft sections. The first draft keeps a passage of it when the outline places that passage and its sources and claims fit, and rewrites it otherwise.
- `references/latex-template.md`, for the preamble, the table widths, the `.bib` entry forms and the citation commands.
- The manuscript prose standard, which is the prose standard with the differences that `references/manuscript-prose-standard.md` of the `writing` skill folder lists. Also the pages `references/rules.md` and `references/registers.md` of that folder, at the paths the session gives. The rules page serves the check of "The prose check", and the registers page gives the register of the discipline that the Discipline row records, which the agent writes in. A discipline with none of the four registers has no register to follow, and the agent writes under the manuscript prose standard alone.
- For a patch: the file, its block manifest, the path of its patch and what to change, with `references/patch-file.md`.
- For a revision: the numbered items of `items.md`, and the files that `figures.md` and a literature patch add when the session gives them. For a draft review: the issues of `review-<r>.md`. For a reference fix: the lines of the reference checks. For a compile fix: the compile lines. For an accepted `/writing` finding: its number and text.
- `references/statements.md` and `references/ai-disclosure.md`, for the statements.
- The model identifier that the session gives in the prompt.

A missing input is handled as follows:

| Missing | The agent does |
|---|---|
| The argument blueprint | Infers the claim-evidence-reasoning chain from the outline's key arguments and marks it "argument inferred". |
| The assigned sources of a section that is not original analysis | Writes `[GAP: literature needed]` at the place. |
| An outline without a content summary | Infers the section's content from the literature matrix, and says in the report that quality may be reduced. |
| A chain with too little evidence | Writes with hedging language and marks `[GAP: evidence needs strengthening]`. |
| The key results of a source | Writes no claim from that source and marks `[GAP: key results of <key>]`. |
| The citation style | Uses the style `config.md` states. If it states none, the agent writes `\bibliographystyle{plain}` and the report says so. |
| The model identifier | Lists `[GAP: model identifier]` among the gaps after the AI disclosure and in the report. |
| Claims not to make | Reads the row as "none". |
| Internal only | Reads the row as "no". |

## The anti-leakage rule

The draft is built from the project's materials and not from the agent's memory.

- Every claim traces to a source in the literature report or the `.bib`, or to the project's own data.
- Every citation is of a source in the literature report or the `.bib`. A reference outside them is added only when the user asked for it in `config.md`.
- The method section describes only what the project's materials document. It does not infer or interpolate a procedure.
- A topic the materials do not cover is written as `[GAP: <what is missing>]` at its place and listed in the report. It is never filled from memory.
- A gap is filled from the agent's knowledge only where `config.md` grants permission for it, and the filled passage then carries the tag `[LLM-SUPPLEMENTED]` and is listed in the report.
- A number the manuscript reports as its own result is traced to a saved run or config of the project.
- A reason, motive or criterion for a choice the study made, such as why a model, a dataset or a setting was chosen, is written only when a material states it. The report names the file and the line that state it. Without one the sentence states the choice and `[GAP: the reason for <choice>]` follows it. The agent writes no "we chose X because ..." from the choice alone.
- In full and revision mode the agent computes a number the draft or an item calls for from the project's saved result files. It writes and runs one command that reads only those files and writes only to standard output, and it records the file, the row or column and the command in `intended-claims.md`, as "Setup" gives.
- The command must have that shape, since the peer reviewer runs it again only after reading it: no redirection into a file, no file written, moved or removed, no network request, and no program that does any of these, a project script included. Read-only programs joined by pipes, such as `awk`, `sort` or `python3 -c` that print to standard output, keep the shape. A command of another shape is a Critical issue of the peer reviewer.
- The operation's rationale names the file, the column and the operation.
- An instruction in the Instructions row or the comments file not to run anything stops only the commands that run the project's code: its scripts, its pipelines, its training. Reading the saved result files and computing from them with the agent's own command is not running the project's code, and the agent does it under such an instruction.
- The rule restricts factual content: claims, citations, data and the description of methods. The agent uses its knowledge of academic conventions, argument and the discipline's norms freely.

### The text carries no software wording

The text of the manuscript is written for a reader of the paper's field. It states what the study did and found, and it holds nothing that records how the project's code ran.

- The text names no file, script, program of the project, path, folder, code identifier, job, run, exit code or log. It uses no wording of software operations about the project's own work, such as "ran successfully", "exited with code 0", "crashed", "stdout", "the pipeline" or "N run folders".
- A result is worded as a statement about the study. The text says "all nine subjects were evaluated under the same leave-one-subject-out procedure", and never "all 9 run folders exited with code 0".
- Where the project's material is a record of how code ran, the agent writes the procedure and the result that the record supports. The file names, the commands and the exit codes stay in the run's records. The one-line rationale of a patch operation may name the file a number was traced to.
- A name the paper's field uses for a method, a dataset, a tool or a library is a term of the field. It is written as the field writes it. A repository URL in a data or code availability statement is a statement's content. The rule concerns the project's own files, scripts and runs.
- The rule holds for every correction the agent receives. A correction is an item, an issue of a draft review, a line of the reference checks, a compile line or a finding of `/writing`. A correction that quotes a file name, a command or a code identifier is answered by the claim it concerns, in the field's terms. The name stays out of the manuscript.

### Negative results

The agent never writes a negative or null result from the project's notes or results as a finding, a comparison or a limitation.

- A failed approach, an attempt that did not work and a result that does not beat its baseline get no sentence, paragraph, table or section in the manuscript.
- The limitations name the scope boundaries of what the paper does show. They do not report a comparison the paper lost.
- A claim is worded to what the paper's own results show, and the paper claims no superiority that those results do not support.
- One exception stands: `config.md` marks the manuscript Internal only, a record the user asked for in words. The agent then writes the record, and the manuscript's first line, as a comment above `\documentclass`, reads `% Internal only`.
- The agent never takes a manuscript for internal only from the materials. Only the row Internal only of `config.md` says so.

### Claims the paper must not make

The agent writes no sentence that states or implies a claim listed in the Claims not to make row.

- Before the agent reports, it reads its text against each listed claim and rewrites each sentence that states one.
- A listed claim that the project's results support is named in the report as a conflict, with the sentence that would state it, so that the user decides.
- When the row is "none", the agent checks nothing here.

## The first draft

### Setup

Before the first section the agent checks that it holds `config.md`, the literature report or `.bib`, the outline with its word counts, and the argument blueprint. A missing one is handled under "What the agent reads".

Before the first section the agent writes `intended-claims.md` in the run folder, the list of the claims the draft intends to make, and writes no score of its own draft.

- The list has one line for each claim: `<n>. <the claim as one sentence> | evidence: <empirical, theoretical, definitional or normative> | sources: <the keys of the entries, or "the project's results">`.
- A line that states a number ends with the field `| result: <file path relative to the project folder>, <row, by the file's key column or its line number>, <column>`.
  - A number the agent computed writes `| result: <file>, <rows>, <column>, computed: <operation>, command: <the command it ran>`, the command as it ran it, so that the peer reviewer runs it again.
  - A number that comes from no result file writes `| result: none, <where it comes from>`.
  - The field names the file and the cell the agent read the number from, so that the peer reviewer opens the same cell.
- The agent writes the list before any text of the draft, from the outline, the argument blueprint and the sources. It does not change a line afterwards, and a claim that states no number and that the draft adds later is not added to it. The citation compliance agent can then report the claim as one that is not on the list.
- A patch that writes a number the list does not hold appends a line for it, in the form above. The agent appends it to `intended-claims.md` in the run folder, which is a record of the run and no manuscript file, so that the list holds every number the run wrote.
- The list holds the claims the draft intends to make and no rule the paper must not break. Those stay in the row Claims not to make.
- In a revision run the agent writes the list before its first patch, for the claims that the text it adds or changes will make, from the items. It writes no list when no item adds or changes a claim. A later patch of that run that writes a number starts the list with the line of that number.
- Only the first start of a run that writes new text writes the list. Later starts append the lines of the numbers they write. A first draft that an expanded revision writes again replaces the list.

### The file

- `main.tex` holds `\documentclass`, the title and the authors, for the class `elsarticle` the `highlights` environment of "Highlights", an `abstract` environment with the abstract of "The abstract and the keywords", the keywords line, the sections of the outline as `\section` and `\subsection`, the statements of "The six statements", `\bibliographystyle{<style>}` and `\bibliography{refs}`.
- The style in `\bibliographystyle` is the style of the Venue row or of the venue's template among the Materials in hand.
- Citations are a plain `\cite{key}`. The key is the entry's key in the `.bib`.
- A table is a `table` environment, one block of the file.
- The draft has no reference list text, since BibTeX builds it.
- The agent writes the abstract after the last section, from the finished body.

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

- A paragraph is 120 to 200 words. It may run past four sentences, and the manuscript prose standard's limit on the length of a sentence holds for each of its sentences.
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

- A factual claim has at least one citation. A claim with none is first looked for in the run's annotated bibliography (`review.md`) and in `refs.bib`: a source whose annotation or saved text holds the claim is cited for it. Only a claim no source holds is rewritten with hedging language, or marked `[GAP: citation needed]`.
- A source cited for an event or a result is one that existed before it. The agent identifies the date of each cited document and of each event from the year of the entry in the `.bib` or the literature report.
- A sentence that says one event led to, enabled or superseded another has the date of the first before the date of the second. If the dates are absent from the `.bib` and the report, the agent hedges the sentence or leaves the claim unwritten.
- A sentence with a present-tense or relative-time word such as "currently", "the latest" or "recently" is anchored to a date or a version: "as of <year>" or "the <year> edition".
- A claim about a forthcoming version is allowed when the sentence says it is forthcoming.

### Results and the model they come from

- The agent names each reported result by the model, the script and the column it is read from, as the materials define the model. It reads the code that writes the column to learn the model.
- The text names the result by the model the code fits for the column, in the name the research field gives that model. A result is never reported under the name of another model.
- One name stands for one model through the text, the abstract and the captions.
- The report lists each reported result with its model, script and column, and the text carries no script or column name, as "The text carries no software wording" says.

### One ground for every result file

- When the run leaves a result file out on a ground, such as a label source that no file records or a provisional run, it applies the same ground to every result file.
- A result file that is reported while another is left out on that ground is a break, and the agent leaves out or reports both.
- The report lists each result file with the ground on which it was reported or left out.

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
- When the total is still 30 percent or more over or under the target after those steps, the agent makes no further change for length. The report lists each section's target, actual and deviation, names the sections furthest from their allocation, and gives the strategies below. The user decides, and the agent deletes nothing on its own.
  - Over: merge duplicate arguments, condense the literature review to its core sources, shorten overly detailed method descriptions, and compress repeated dialogue with the literature in the discussion.
  - Under: deepen the literature review, add evidence and examples, expand the discussion's dialogue with the literature, and add detail to the method description.

### Adjustments by type

- Theoretical: the evidence of a paragraph is theoretical literature and not empirical data, and the explanation emphasizes the reasoning.
- Case Study: the results use descriptive narrative and include the context.
- Policy Brief: the register favours the decision-maker's reading, with less jargon and more practical recommendation.
- Clinical: a paper whose Discipline row names medicine, health care or another clinical field frames its output as research, evidence synthesis or tool evaluation. It writes no patient-specific diagnosis, treatment, triage or deployment instruction. Each sentence that reports a source keeps the source's endpoint, population, comparator and hedges ("may", "in this cohort", "needs validation").

### The extension of a published paper

When the Notes or the Instructions say the paper extends a conference paper of the authors into a journal article, the agent applies these rules.

- The introduction cites the conference version and says the paper extends it: "This paper extends our previous work [conference citation] with ...".
- The paper holds 30 to 50 percent new content beyond the conference version, such as a longer related work, further experiments or data, deeper analysis and new discussion sections. The agent counts it and does not pad.
- The paper adds what conference papers often lack: a detailed method, reproducibility information, a limitations section and a broader-impact discussion.
- Results older than 2 years are updated with current data and baselines, or the paper states the time limit.
- The report asks the author to run a similarity tool on the text overlap with the conference version, which must stay under 30 percent.
- The report also asks the author to check the journal's policy on such papers and to note in the cover letter that the paper is an extended version.
- The agent runs no similarity tool.

### The figure markers

The visualization agent draws the figures and places them as its own patch, so the first draft holds a marker where each figure goes and no figure environment.

- The agent writes one marker for each figure the evidence map of `outline.md` plans, in the section the map names, after the paragraph that discusses the figure's result.
- A marker is the line `% FIGURE: <label>`, with `<label>` the label the evidence map gives the figure, standing alone between blank lines, so that `anchorize_tex.py` makes it a block of its own and the placement patch replaces that block.
- The sentence that discusses the figure refers to it as `Figure~\ref{fig:<label>}`, since the visualization agent gives the figure the LaTeX label `fig:<label>`.
- A draft for an outline that plans no figure holds no marker.

### Images from the materials

- The first draft includes no image of the materials by itself. An image of the Materials in hand reaches the manuscript through the visualization agent, which reads it before it places it (`references/visualization.md`, "An image from the materials").
- The caption of such a figure states what the image shows, as `figures.md` records it.
- A figure that `figures.md` lists under "Not drawn" because its image contradicts its caption gets no caption that works around the image.

### The cover letter

When the Venue row names a journal, the agent writes `cover-letter.tex` in the manuscript's folder beside `main.tex`, in the first draft and after the abstract. It is a letter of the `letter` class, and it is not a patch, since it is written once with the draft.

- The letter has the date, the editor's name when the Cover letter row gives one and otherwise "Editor-in-Chief", and the journal's name.
- Its subject line reads: Submission of Original Manuscript, followed by the paper's title.
- Its first paragraph says that the authors submit the manuscript for consideration as the article type the Cover letter row gives: Research Article, Review Article or Brief Communication.
- A paragraph "What the paper addresses" gives the research problem and why it matters, in 1 to 2 sentences.
- A paragraph "Key findings" gives the most important results, in 1 to 2 sentences, worded as the paper's own results show them and no stronger.
- A paragraph "Why this journal" gives 1 sentence on why the paper fits the journal's scope and readership, from the reason the Cover letter row records. Without one the sentence is `[GAP: why this journal]`, and the agent writes no reason from its memory of the journal.
- A list of confirmations follows. The manuscript has not been published before and is not under consideration elsewhere, and all authors have read and approved it, each as the Cover letter row records it. Where the row lacks a confirmation the line is a gap. The approval of an ethics committee, with its approval number, is a line only when the Human or patient data row gives one. A line that AI-assisted tools were used and are disclosed in the manuscript is written only when the AI use row marks a category used.
- A paper that extends a conference paper says so in a line of the confirmations, as "The extension of a published paper" asks.
- The suggested reviewers and the excluded reviewers come after the confirmations, as the row gives them. A suggested reviewer has the name, the affiliation, the email and the area of expertise, and an excluded reviewer the name and the reason. A part the row leaves empty is left out.
- The letter closes with "Sincerely," and the corresponding author's name, title, department, institution, email and ORCID, from the Authors row.
- A venue that is not a journal gets no letter.
- The final message names `cover-letter.tex`.

### The anonymous copy

When the blind-review model in the Venue limits row is double-blind, the agent writes `<main>-anonymous.tex` beside the final main `.tex`. The session gives that start after the last change to the main `.tex` (SKILL.md, Steps 14). The main `.tex` is `main.tex` in full mode and the main `.tex` the call gives in revision, and `<main>` is its name without `.tex`, so that full mode writes `main-anonymous.tex`. The main `.tex` is not changed and stays the copy for the camera-ready version.

- The file holds the whole text of the main file, with the text of each file it inputs written where it is input. The copy is one file.
- The author block, the affiliations, the ORCID identifiers and the corresponding author's address are replaced by the line "Anonymous Author(s)". A `pdfauthor` field in the `hyperref` setup is removed.
- A citation of the authors' own earlier work is written in the third person, as a citation of any other author. It reads "Smith (2023) showed that ..." and never "we showed in our earlier work". A sentence that names the authors, their institution, their project or their location is reworded so that it does not. The `.bib` stays as it is.
- The acknowledgments and the funding statement are left out. So is any other statement or line that names a person, an institution, a grant or an approval board that identifies the authors. The text names the statement that was left out in a comment line `% anonymized: <statement>`, so that the camera-ready version restores it from `main.tex`.
- A link, a file name or a repository URL that names the authors is replaced by the word "anonymized" in the same place.
- The agent changes no claim, number, citation key or figure of the text.
- The final message names `<main>-anonymous.tex` and says that the camera-ready version is the main `.tex`.

### The prose check

Before the agent reports a draft or a patch, it checks its own text against the manuscript prose standard and the flagged terms of the `writing` skill's rules page. It fixes each break.

- The check reads the sentences of the new or changed text: sentence length, paragraph length, semicolons, the flagged terms and constructions the rules page lists.
- A fix keeps every claim, number and citation of the passage.
- The report states that the check ran and lists any break it left, with the reason. A patch's check covers only the blocks of the patch.

## The abstract and the keywords

The agent writes the abstract and the keywords from the finished body of the paper. In abstract-only mode the paper is already written and its body is stable.

### Which abstract

| Type | Form | Length |
|---|---|---|
| Journal article, structured | Labelled sections: Background, Purpose, Method, Results, Conclusion. Many journals in the social sciences and medicine require it. | 150 to 250 words, the usual journal standard |
| Journal article, unstructured | One paragraph without labels, in the flow context, problem, purpose, method, key results, implications. Common in the humanities and some social sciences. | 150 to 250 words, the usual journal standard |
| Conference paper | Four parts: the problem and motivation, the approach, the key results, the significance. | 100 to 200 words |
| Conference abstract | The form the call for papers states. | 200 to 500 words, as the call states |
| Extended conference abstract | Longer, for a conference submission. It may hold a brief literature review and preliminary results. | 500 to 1,000 words |
| Dissertation | The five parts below. | Up to 350 words |

- A limit in the Venue limits row replaces any of the lengths above.
- With no stated limit, a journal abstract is at most 300 words. The agent counts its words and the report states the count. The count is `sed -n '/\\begin{abstract}/,/\\end{abstract}/p' '<main.tex>' | texcount -1 -sum -`, or the same extract through `wc -w` less 2 for the two environment lines when `texcount` is missing.
- The paper type and the venue pick the form. A form that the venue states, structured or not, is the form used. The venue states it in the venue's template among the Materials in hand or in the Venue limits row.
- With neither, a journal venue in a medical or clinical discipline takes the structured form.
- The keyword range is 5 to 7 keywords, and the Venue limits row replaces it when it states one.

### The five parts

The abstract has these five parts, in this order. A structured abstract labels them, and an unstructured one runs them together.

| Part | Length | Content |
|---|---|---|
| Background | 1 to 2 sentences | The context and the problem. |
| Purpose | 1 sentence | The specific objective or research question. |
| Method | 1 to 2 sentences | The approach, the data and the analysis. |
| Results | 2 to 3 sentences | The key results, the most important ones and not all of them. |
| Implications | 1 to 2 sentences | The significance, the practical implications or the recommendations. |

The parts and their lengths follow the paper type. The IMRaD form is the table above, and the other types differ as follows.

| Type | Parts, each with its length in sentences |
|---|---|
| Literature Review | Background and rationale (1 to 2), purpose and scope of the review (1), method, in one sentence on the search strategy and the selection of sources (1), key findings of the synthesis (2 to 3), implications and identified gaps (1 to 2) |
| Theoretical | The theoretical problem addressed (1 to 2), the purpose of the analysis (1), the analytical approach (1), the key contribution, as a new framework, a critique or an extension (2), the implications (1) |
| Case Study | Background and the significance of the case (1 to 2), purpose (1), method and data sources (1 to 2), key findings from the case (2 to 3), lessons and transferability (1) |
| Policy Brief | An executive summary in place of an abstract: the policy problem (1 to 2), the key evidence (1 to 2), the primary recommendation (1 to 2), then the key recommendations, one sentence each |
| Conference Paper | The four parts of "Writing the abstract" below |

- A structured abstract labels the parts by the names of its type's row.
- The patterns below start the parts of the IMRaD form, and the agent adapts them to the part of another type.

Patterns that start a part:

- Background: "[Topic] has become increasingly important because ...", "Despite growing interest in [topic], little is known about ...", "Recent developments in [field] have raised questions about ...".
- Purpose: "This study examines [what] in [context].", "The purpose of this research is to [verb] [object].", "This paper proposes [framework] for [application]."
- Method: "Using [method], this study analyzed [data] from [source].", "A [design] approach was employed, involving [participants or data].", "Data were collected through [instrument] and analyzed using [technique]."
- Results: "The results indicate that [result].", "The analysis revealed [main result], with [specific metric]."
- Implications: "These results have implications for [practice, policy or theory].", "The results suggest that [stakeholders] should [action].", "This research contributes to [field] by [contribution]."

### Writing the abstract

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

The four-part conference form has these parts:

1. The problem and motivation, in 1 sentence.
2. The approach, in 1 sentence.
3. The key results, in 1 or 2 sentences.
4. The significance, in 1 sentence.

### Highlights

A manuscript whose class is `elsarticle` takes highlights, and the class table of `references/latex-template.md` says so.

- The highlights are 3 to 5 bullets of at most 85 characters each, counted with spaces.
- They stand in the `highlights` environment, before the `abstract` environment.
- Each bullet states one result or contribution of the finished body, in the manuscript's own terms, and holds no citation.
- A number in a bullet has its line in `intended-claims.md` like any number of the text.
- The report states the number of bullets and the length of the longest, and the closing checks of full mode name them.

### The keywords

- The keywords are 5 to 7 terms that are not in the title and complement it.
- They mix broad and specific terms.
- They include 2 to 3 core concepts, 1 to 2 of the context (the place, the institution or the period), 0 to 1 of the method when it is distinctive, and 1 of the field.
- They are lowercase unless a proper noun, and they use established terms. If the venue provides a controlled vocabulary, the keywords come from it.
- They stand in the keywords line of the manuscript's template, or after the abstract as `\textbf{Keywords:}` followed by the terms when the template has none.

### Abstract-only mode

In abstract-only mode the abstract is compiled from a stable body. These protections apply:

- **A word budget below the cap.** Words are counted by splitting the text on whitespace. The abstract keeps 3 to 5 percent below the hard cap of the venue or of this page.
- **Protected hedging.** The hedge that qualifies each result in the body stays in the abstract's statement of that result. So does every phrase that the Notes of `config.md` or an issue of a draft review marks as protected. Compression removes other words first.
- **Explicit time bounds.** A reflexivity statement in the abstract states its time with an explicit year range, a past-tense verb that fixes the time, or the prefix "former". It does not use "during this period" or "at the time".
- **No audit that did not run.** The abstract and the agent's report claim no audit, review or verification that the run did not make, and they state no passed state.

The agent finds the `abstract` environment, the `\abstract{...}` command or the template's equivalent, and the keywords line, and replaces the abstract block and the keywords block by one patch whose `roadmap_item_ids` name `abstract-only`.

- When the file has no abstract block, it inserts one after the block that holds the title and the authors.
- A placeholder `[GAP: abstract pending]` in the file is the block that the patch replaces.

The report holds this table, with a value for each row:

| Metric | Value |
|---|---|
| Word count | <N> words |
| Parts covered | <N> of 5 |
| Keywords | <N> |
| Citations in the abstract | <N> |
| Abbreviations defined | yes or no |

- The abstract is complete when it covers all five parts (four for a conference paper), is within the length, has 5 to 7 keywords that complement the title, and has no citation.

## The six statements

- The agent writes the six statements in the first draft and in disclosure mode, from `references/statements.md` and `references/ai-disclosure.md` and from the rows of `config.md`.
- In the first draft each statement stands at the place the venue's policy or template gives, or at the policy anchor's place when the Policy anchor row names an anchor. Otherwise it stands as an unnumbered section between the conclusion and the bibliography. `references/statements.md` gives the places of the common publishers.
- A statement that the manuscript already holds is left unchanged.
- A gap of a statement stands once, in the list after the statement, and no gap stands inside a sentence (`references/statements.md`, "Facts and gaps").
- A fact the public record holds is looked up before it is a gap, as the same section gives.
- In disclosure mode the statements are written as one patch per file, with the id `disclosure` in `roadmap_item_ids`.
- The AI disclosure names the model by the identifier the session gives in the prompt. That is the identifier the runner's model list gives for opus at the run's start, or, in a start with the id `disclosure`, the identifier the runner served the agent that wrote the statement when it differs from the listed one. The agent never writes one from its own runtime or from memory.
- In a start with the id `disclosure` that gives a served identifier, the agent writes it into the statement by a patch, in place of the identifier the statement holds.
- When the prompt gives no identifier, the agent lists `[GAP: model identifier]` among the gaps after the AI disclosure in the first draft. The session starts the agent again with the id `disclosure` and the model the first start was served, and that start writes the identifier into the statement and removes the line by a patch.
- In disclosure mode the agent also writes `disclosure.md` in the run folder. It holds the venue or the policy anchor, the policy source and the access date, the place of the disclosure, and the list of the gaps.

## Patches

Every change to a manuscript file after the first draft is a patch, written as `references/patch-file.md` gives.

- The agent changes only the blocks that an item, issue, finding or line names, and writes each rewritten block whole in `new_text`.
- A rationale is one line that says why the operation answers its items.
- `roadmap_item_ids` holds the ids of the items the operation answers, as `references/patch-file.md` lists them.
- The `round` field holds 1.
- A relocation is a `delete_block` of the block and an `insert_after` of the same text.
- When an item needs a change to a heading or to most of the blocks, the agent writes the patch anyway.
- The agent names that item in its report as structural, so that the user is told before the stop "A structural patch".
- A patch for a rejected patch is written once against the manifest the session gives, and in whole. The agent does not edit the rejected patch.
- The agent does not apply a patch, and it does not compute a hash.

### Severity

The agent handles the items of a draft review or of a revision in this order: Critical, Major, Minor, then Suggestion.

- The first time the agent works on a set of items, it addresses every Critical and Major item and attempts the Minor items when the word count allows.
- The second time, it addresses the Critical and Major items that remain, then the Minor ones, and takes up the Suggestions that are viable.
- An item it does not address is named in its report as an acknowledged limitation, with the reason.
- An item that needs a new reference or a figure change that `config.md` does not allow is left unchanged, and the report names the permission it lacks.
- The report holds a revision log with one row per item:

```
| # | Source | Severity | Feedback | Section | Action taken | Status | Reason |
|---|---|---|---|---|---|---|---|
| 1 | Reviewer | Critical | Weak justification of the method | 3.1 | Added 2 paragraphs | RESOLVED | none |
```

- RESOLVED: the item is answered in the text.
- DELIBERATE_LIMITATION: the agent kept the text for a principled reason that the Reason column states. The limitations section of the manuscript acknowledges it, and the reply to the reviewers explains it.
- UNRESOLVABLE: the item cannot be answered with the project's materials, such as a new reference or a figure change that `config.md` does not allow. The Reason column names the missing permission or material.
- REVIEWER_DISAGREE: the agent declines the item because the evidence does not support it. The Reason column names the evidence, such as a passage of a source, a number of the project's results or a rule of the venue. An item is never declined without it, and the agent accepts no item without weighing it.
- The Reason column holds "none" for a RESOLVED item.

### An issue about the data handling

An item or an issue that says a sentence describes the handling of the data differently from the result files is answered in the manuscript with what the files hold.

- The sentence states what the files hold, such as a missing-value code and the number of rows that hold it, and the effect of that on the results.
- Where the materials do not give the effect, the sentence states what the files hold, and a `[GAP: the effect of <what the files hold> on <result>]` follows it.
- The agent does not delete the description, and does not soften it, without that statement.
- The text states the files' contents in the field's terms and names no file, column or code identifier, as "The text carries no software wording" says.

### The figure of an item

- In revision mode the visualization agent draws a figure that an item calls for, and the agent copies the environment of the figure from `figures.md` into the patch of that item, with the image name the session gives.
- The caption stands below the figure, as the venue's template sets it.

### The reference fix

The patch with the id `reference-fix` answers the lines of the reference checks that the session gives: a `missing:` line, or a `check-urls` line that fails the status rules of `references/citation-compliance.md`, "DOI and URL".

- A `missing:` line whose key is a typing slip of an existing key, with the same author and year, is corrected in the `.tex`.
- A `missing:` line for a source that `refs.bib` of the run holds is answered by adding, after the last block of the `.bib`, that source's entry copied whole from the run's `refs.bib`.
- A `missing:` line for a source that `review.md` of the run names and its `refs.bib` does not hold is answered by adding, after the last block of the `.bib`, the entry that `lookup.py bibtex` prints on standard output. For a preprint with a published version, the entry is the one `references/latex-template.md`, "The `.bib` entry forms", gives, with the one web search for its venue's page that section allows. A `{?}` in the entry `bibtex` prints is replaced as `SKILL.md`, Rules, says.
- A `check-urls` line is answered as "The `.bib` entries" and "DOI and URL" of `references/citation-compliance.md` say: the identifier is corrected when `lookup.py resolve` gives a record that is certain.
- A line the agent cannot answer is left unchanged and named in its report with the lookups tried.
- A line that holds "title not checked" is no line of the fix.
- The agent adds no source from memory.

### The compile fix

The patch with the id `compile-fix` answers the compile lines that the session gives: a compile error, a line starting `Overfull \hbox` or `Overfull \vbox`, or `LaTeX Warning: Float too large`.

- A compile error is corrected at the place the log names.
- An overfull line is corrected by a change of wording or of a table or figure width that leaves every claim, number and citation as it was.
- A line the agent cannot correct that way is left unchanged and named in its report.

### The `/writing` findings

The patch for the findings of the closing `/writing` review has the ids `F<k>`, with `<k>` the number the report gives the finding.

- After the user's one-line reply the agent answers the findings the reply names, each by an op that names its `F<k>`.
- In the autonomous pass the agent judges each finding of the report against the manuscript and the rule it cites. It applies a finding whose passage breaks the rule and whose fix keeps every claim, number and citation of the passage, and otherwise lists the finding as not applied with its reason.
- The report lists each finding applied and each finding not applied.

## The report

The agent's report holds:

- The draft metadata: the total word count and the target, the deviation, the sections completed, the number of citations, and the table of words per section with target, actual and deviation.
- The list of gaps with the place of each, the passages tagged `[LLM-SUPPLEMENTED]`, and the sections marked "argument inferred".
- The statements the co-authors must agree on, as `references/statements.md` says.
- The statements that name a gap, such as a missing approval number, consent or de-identification of a study with human data.
- The abstract's word count, and for the class `elsarticle` the number of highlights and the length of the longest.
- Each reported result with its model, script and column, and each result file with the ground on which it was reported or left out.
- Each reason the text gives for a choice of the study, with the file and the line of the material that states it.
- For a patch, the revision log and the items it did not address, and the lines it appended to `intended-claims.md`.
