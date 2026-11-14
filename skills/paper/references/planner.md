# Planner

The planner agent reads this page to choose the structure of the paper, write its outline and build its argument, in one start. The session resumes its latest start by a second message for the review of an expanded revision whose root cause is structural or one of originality. It writes `outline.md` and `arguments.md` in the run folder, and `structure-options.md` when the user disagrees with the structure. It changes no other file. The draft writer and the visualization agent follow the outline, the draft writer follows the argument, and the user approves both at the stop "The outline's approval" before either runs. In outline-only mode the files are the result of the run.

## What the agent reads

- `config.md`: Paper type, Length, Discipline, Research question, Venue, Venue limits, Materials in hand, Internal only and the Notes.
- `review.md` of the literature strategist: the literature matrix, the gaps and the annotations with their stance and potential use.
- The manuscript's `.bib` or `refs.bib`, when no `review.md` exists: its entries are the sources to assign.
- A section of the project that already holds draft text, when the Materials in hand row lists existing draft sections.
- The project's own results that the Materials in hand row names.
- The user's changes to the outline, when the session starts the planner again after the stop "The outline's approval".
- The sources the literature strategist found for the sections that needed literature, when the session starts the planner again to assign them.
- The user's answer about the structure, the structure the user chose from `structure-options.md` or insists on, when the session gives them.
- At its resumption for an expanded revision: the last `review-<r>.md` of the draft review, whose root cause is structural or one of originality, with the issues it names. Also `outline.md` and `arguments.md` as it wrote them before. It writes both files again, changing the parts the issues name, and the overview states what changed and which issue each change answers.

Where an input is missing:

| Missing | The agent does |
|---|---|
| The literature search report | Infers the likely distribution of topics from the research question and marks "sources pending" in the outline. |
| The length | Takes the median of the typical length of the paper type. |
| The paper type | Picks it by the table of "The structure". When no row fits, it lists 2 or 3 suggested structures with their pros and cons in the outline's overview, and the user chooses at the outline's approval. |
| The "Potential use" of a source | Infers the section from the source's content and marks the assignment "auto-inferred". |

The evidence of an argument is a result that a source reports, taken from its annotation and cited as `[@key]`, or a result of the project's own work. A claim with no such evidence is listed as unsupported in the argument strength assessment, and the agent adds no evidence from memory.

## The structure

- The paper type of `config.md` picks the structure.
- When `config.md` names no paper type, the agent picks it by this table and states the type and the row that decided it in the overview:

| If the paper | The type is |
|---|---|
| Has original data collection | IMRaD |
| Synthesizes existing literature | Literature Review |
| Develops or critiques a theory | Theoretical |
| Analyzes specific cases in depth | Case Study |
| Recommends policy actions | Policy Brief |
| Is presented at a conference | Conference Paper |

- A paper that fits no row, or two rows, gets the IMRaD skeleton when it reports empirical work with data or results. It gets the Literature Review skeleton when it synthesizes existing research. The overview lists 2 or 3 other structures with their pros and cons for the user to choose from at the stop.
- A paper type with no skeleton on this page gets a section list that the agent builds from the type and the research question. It keeps the proportions of the allocation table below.
- A paper with partial drafts takes the structure of the existing draft first.
- A research question that spans several types gets a hybrid structure, and the overview says why.
- A user who insists on a non-standard structure gets it, recorded as "user-customized" in the Structure line of `outline.md`, and the agent follows it.
- When the session gives the user's answer to what is wrong with the structure, the agent writes `structure-options.md` with 2 alternative structures, each with its sections and its pros and cons. It writes no other file in that start.
- When the session gives the structure the user chose, the agent writes the outline with it.
- The sections follow the paper's argument, so that a reader finds any piece of information where they expect it, and the share of words reflects the importance of each section.

### Adjustments by type

- Theoretical: the Framework share rises to 30 percent, and the section holds the theoretical lineage, the concept definitions and the derivation of propositions.
- Case Study: a Case Context section is added with the institutional background and the data sources, and the analysis uses several dimensions.
- Policy Brief: an Executive Summary replaces the abstract, and a Recommendations section takes 25 to 30 percent of the words.
- Interdisciplinary: the literature groups in the Literature Review are labelled by discipline.
- A paper of any type plans no section, paragraph or table around an approach that failed or a result that does not beat its baseline. An outline marked Internal only in `config.md` is the one exception, and its first line says so.

### The structure check

Before the agent writes the files it tests the structure against the research question, the materials and the length, and it lists each mismatch.

| Indicator | The mismatch |
|---|---|
| The research question is causal | A Literature Review structure, which can describe what is known and cannot test a cause |
| The Materials in hand row lists no data or results | An IMRaD structure, whose Method and Results sections no data feeds |
| The topic is one case or institution studied in depth | A Policy Brief structure in place of a Case Study structure |
| The length is far below the typical length of the type, such as 3,000 words for IMRaD | A structure whose sections cannot hold their proportions in that length |

- The agent lists any other mismatch it finds between the question and the structure in the same way.
- For each mismatch the agent states the mismatch and explains why the two do not fit. It offers 1 or 2 alternative structures, and explains how each alternative answers the research question better.
- The check changes no structure by itself. The outline keeps the structure chosen, and a mismatch does not block the outline. The user decides at the stop "The outline's approval" to keep the structure or to choose an alternative. The session handles an alternative as the choice from `structure-options.md`.
- With no mismatch the section reads "No mismatch found."

### The Conference Paper skeleton

The skeleton is written for machine learning. Its sections are the introduction, related work, method, experiments, results, discussion and conclusion.

```
Title, authors and affiliations
Abstract (150 words) and keywords
1. Introduction
   1.1 Motivation: the problem and why it matters
   1.2 Research question: the specific question or questions
   1.3 Contribution: one paragraph that states specifically what is new
2. Related work
   2.1 The key prior approaches, each with its most relevant studies
   2.2 The gap this paper addresses, ending the section
3. Method
   3.1 The approach and why it was chosen
   3.2 The model or algorithm
4. Experiments
   4.1 Datasets and materials
   4.2 Baselines, metrics and implementation
   4.3 The analysis
5. Results
   5.1 One subsection per result, with its tables and figures
6. Discussion
   6.1 What the results mean and how they relate to the prior work
   6.2 Limitations
7. Conclusion and future work
AI disclosure, acknowledgments, references
```

- A conference paper typically has 15 to 25 references.

### The IMRaD skeleton

The skeleton is written for machine learning and is the structure for a journal paper with original data.

```
Title page
Abstract (250 words) and keywords (5 to 7)
1. Introduction
   1.1 Context and background
   1.2 Problem statement
   1.3 Research gap
   1.4 Purpose and research questions
   1.5 Significance
2. Related work
   2.1 Theoretical framework
   2.2 One subsection per theme of the literature matrix
   2.3 Summary and conceptual framework
3. Method
   3.1 Research design
   3.2 Data and participants or sample
   3.3 The model, instruments or measures
   3.4 Analysis
   3.5 Validity, reliability and ethical considerations
4. Experiments
   4.1 Datasets, baselines, metrics and implementation
5. Results
   5.1 Descriptive statistics, when the data are quantitative
   5.2 One subsection per result, aligned with the research questions
6. Discussion
   6.1 Summary of the results
   6.2 Interpretation and comparison with the literature
   6.3 Theoretical and practical implications
   6.4 Limitations
   6.5 Future research
7. Conclusion
References and appendices, when there are any
```

### The Literature Review skeleton

```
Title, authors and affiliations
Abstract (250 words) and keywords
1. Introduction
   1.1 Topic and rationale: why the review is needed and why now
   1.2 Scope and boundaries: what is included and excluded, the period, the disciplines, the geographies
   1.3 Review methodology: the search strategy, the databases, the criteria and the number of sources
   1.4 Organization of the review: a preview of the thematic structure
2. to 4. One section per theme of the literature matrix (a review keeps 3 to 5)
   x.1 and x.2 One subsection per sub-theme, each of 2 or 3 paragraphs with citations
   x.3 Summary of the theme: what the literature collectively says
5. Cross-cutting synthesis
   5.1 Convergent findings: what the themes agree on
   5.2 Divergent findings and debates: where researchers disagree
   5.3 Methodological observations: the methods that dominate and the ones that are underused
6. Research gaps and future directions
   6.1 Identified gaps: 3 to 5 specific gaps in the literature
   6.2 Proposed research agenda: what to investigate and with which methods
7. Conclusion
   7.1 Key takeaways: the 3 to 5 most important insights
   7.2 Implications for practice and policy
AI disclosure, references
```

- The thematic sections take the share of "Thematic sections" in the allocation table, and sections 5 and 6 take "Synthesis and gaps".

### The Theoretical skeleton

```
Title, authors and affiliations
Abstract (250 words) and keywords
1. Introduction
   1.1 The theoretical problem: the issue or gap that motivates the paper
   1.2 Why the theory matters: the practical or intellectual consequences
   1.3 Purpose and contribution: whether the paper develops, critiques, extends or synthesizes
2. Background: the theory in context
   2.1 Origins and development, with the key thinkers and milestones
   2.2 Key concepts and definitions: the constructs, their relationships and boundaries
   2.3 Current state of the theory: dominant interpretations and applications
3. Critical analysis
   3.1 Strengths of the framework
   3.2 Limitations and gaps of the framework
   3.3 Competing perspectives and how they compare
   3.4 Empirical support: what the cited studies report about the theory's predictions
4. Proposed extension or revision
   4.1 New dimensions or modifications
   4.2 Conceptual model, with a figure when one helps
   4.3 Propositions for testing, as a table with the columns Proposition, Description and Testable via
5. Applications and implications
   5.1 Theoretical implications
   5.2 Practical applications
   5.3 Methodological implications
6. Conclusion
   6.1 Summary of the contribution
   6.2 Limitations of the analysis
   6.3 Future directions
AI disclosure, references
```

### The Case Study skeleton

```
Title, authors and affiliations
Abstract (250 words) and keywords
1. Introduction
   1.1 Background and rationale: why the case is significant or instructive
   1.2 Case selection justification: intrinsic interest, typicality, or an extreme or deviant case
   1.3 Research questions
2. Literature context
   2.1 The theoretical framework that informs the analysis
   2.2 Prior research on similar cases
3. Case description
   3.1 Context and setting
   3.2 Key actors and stakeholders, with their roles and interests
   3.3 Timeline of events, as a table with the columns Period, Key event and Significance
   3.4 Data sources: documents, interviews, observations and archival data
4. Analysis
   4.1 Analysis framework: the coding strategy and the analytical lens
   4.2 to 4.4 One subsection per theme or finding, with evidence from the case data
5. Discussion
   5.1 Cross-theme synthesis
   5.2 Comparison with the literature
   5.3 Theoretical insights
   5.4 Transferability: a case study aims at transferability and not at generalizability
6. Lessons learned and recommendations
   6.1 For practitioners
   6.2 For policymakers
   6.3 For researchers
7. Conclusion
AI disclosure, references, appendices (case documents, interview protocol or data summary)
```

### The Policy Brief skeleton

```
Title (clear and action-oriented), authors, affiliation, date and target audience
Executive summary: the policy problem, the key evidence and the primary recommendation, then the key recommendations as 3 one-sentence items
1. Background
   1.1 The policy problem: who is affected and how severely, with specific data
   1.2 Current policy context: the relevant policies and what has been tried
   1.3 Why action is needed now: the urgency and what happens if nothing changes
2. Evidence base
   2.1 to 2.3 One subsection per key finding, with citations and a figure or table when it helps
   2.4 International comparisons, when relevant
3. Policy options analysis
   One subsection per option (3 options), each with a description of 1 or 2 paragraphs and a table of Effectiveness, Feasibility, Cost, Timeline and Political acceptability
4. Recommendations
   4.1 Recommended option and why
   4.2 Implementation steps with their timing
   4.3 Success metrics, as a table with the columns Metric, Baseline, Target and Timeline
   4.4 Risk mitigation, as a table with the columns Risk, Likelihood and Mitigation
5. Conclusion: one paragraph on the urgency and the recommended action
AI disclosure, references, and a methodology note on how the evidence was gathered and analyzed
```

- The Executive summary replaces the abstract, and the references stay concise for the decision-makers who read it.

## Negative results

The outline plans no section, paragraph or table around an approach that failed or a result that does not beat its baseline.

- A failed approach or a null comparison in the project's notes or results gets no place in the outline, in the evidence map or in the argument.
- The limitations section of an outline names the scope boundaries of what the paper does show.
- One exception stands: `config.md` marks the manuscript Internal only, a record of every attempt that the user asked for in words. The agent then plans the sections of that record, and the first line of `outline.md` and of `arguments.md` reads "Internal only".
- The agent never takes a manuscript for internal only from the materials. Only the row Internal only of `config.md` says so.

## The outline

### Section descriptions

Each section of the outline has:

- **Purpose.** What the section accomplishes.
- **Content summary.** 2 or 3 sentences on what goes in the section. The draft writer starts from it.
- **Key sources.** The literature sources that support the section.
- **Key arguments.** The claims the section makes.

### Depth

| Total words | Level 1 | Level 2 | Level 3 |
|---|---|---|---|
| 3,000 or fewer | Required | At most 2 per chapter | Not used |
| 3,001 to 6,000 | Required | 2 to 3 per chapter | Only in the core chapters (the related work and the results) |
| 6,001 to 10,000 | Required | 2 to 4 per chapter | At most 3 per section, when needed |
| More than 10,000 | Required | 3 to 5 per chapter | Used freely, with level 4 only when necessary |

- Level 1 holds 3 to 6 major sections, and the headings stay within the 5 levels of APA.
- The content under the lowest heading of a section is at least 150 words. A heading under 150 words is merged upward.

### Word counts

The allocation takes the paper type's column of the table, scaled to the total word count.

| Section | IMRaD | Lit Review | Theoretical | Case Study | Policy Brief | Conference |
|---|---|---|---|---|---|---|
| Abstract | 250 fixed | 250 fixed | 250 fixed | 250 fixed | none | 150 fixed |
| Introduction | 15% | 10% | 12% | 12% | 10% | 15% |
| Literature or background | 25% | spread over the themes | 20% | 15% | 15% | 20% |
| Framework or method | 15% | none | 30% | 10% | none | 15% |
| Analysis or results | 20% | none | 25% | 30% | 30% | 25% |
| Discussion | 20% | none | none | 20% | none | 20% |
| Thematic sections | none | 60%, equally divided | none | none | none | none |
| Synthesis and gaps | none | 15% | none | none | none | none |
| Recommendations | none | none | none | none | 30% | none |
| Conclusion | 5% | 10% | 8% | 8% | 10% | 5% |
| Future directions | none | 5% | 5% | 5% | 5% | none |

- The abstract figure is a planning figure, and it is not counted in the total. The finished abstract follows `references/draft-writer.md`, "The abstract and the keywords".
- In the Conference Paper and IMRaD skeletons the Experiments and Results sections together take the share of "Analysis or results". The agent splits it by what the paper needs.
- For Literature Review each thematic section takes its base share times the share of the sources on its theme, times an adjustment factor. The factor is 1.1 when the average quality score of the sources is 12 or more, and 0.9 when it is 8 or less.
- The sum of the section word counts deviates by at most 5 percent from the total. If it deviates more, the agent trims the largest section or adds to the smallest in proportion.
- No section has fewer than 200 words, and the agent suggests merging a section that would.
- A section above 35 percent of the total is split into two sections, or part of its content moves to the adjacent sections.

### The evidence map

The map assigns the sources to sections in a table of this form:

```
| Section | Assigned sources | Evidence type |
|---|---|---|
| Introduction | key1, key2 | Context, problem framing |
| Related work 2.1 | key3, key4 | Theme 1 results |
```

- Every source of the literature report, or of the `.bib` when no report exists, is assigned to at least one section. A source left over is assigned, or the outline says why it is removed.
- Each source carries its tag supports, opposes or neutral from the report.
- A section that needs literature and has no source is a gap. The agent lists it in the outline as "needs literature", and the session sends it back to the literature strategist. The strategist searches for sources of that section before the stop "The outline's approval".
- When the session starts the agent again with the sources found, the agent assigns them to the sections that needed them. A section that still has no source stays on the list "Needs literature:", and the session shows it to the user at the stop.
- A methodology section or a section of original analysis may need no external source.
- A summary in the existing draft that mentions an argument with no source in the matrix is marked "needs literature supplementation".
- A literature matrix with fewer than 3 themes is reported with a suggestion to split a theme or search again.
- A matrix with more than 6 themes is reported with a suggestion to merge similar themes, and a literature review keeps 3 to 5 thematic sections.

### The planned figures

The evidence map ends with a table of the figures the outline plans, in this form:

```
| Label | Section | What it shows | Data |
|---|---|---|---|
| ablation-curve | Results 5.2 | Accuracy against model size | results/ablation.csv |
```

- The agent plans a figure only for a result of the Results section that the Materials in hand row gives data for and that a figure shows better than a sentence or a table.
- A label is lowercase letters, digits and hyphens, and no two figures of the outline share one.
- The draft writer marks the figure's place with the label, and the visualization agent names the figure with it, so the label is the one name both use.
- An outline that plans no figure says "No figure planned." under the table's heading.

### Transitions

Each boundary between adjacent sections states:

- how the current section leads into the next.
- what the reader should understand before moving on.
- the theme or argument that connects them.

## The argument

### The thesis

The thesis is clear, specific and arguable. It has this form:

```
This paper argues that <claim> because <reason 1>, <reason 2> and <reason 3>, based on <evidence type>.
```

- It is specific: neither too broad nor too narrow.
- It is arguable: reasonable people could disagree with it.
- It is supportable: the evidence exists or can be gathered.
- It is relevant: it addresses the research question.

### The sub-arguments

The thesis breaks into 3 to 5 sub-arguments. Each rests on a chain of claim, evidence and reasoning:

| Component | What it holds | Example |
|---|---|---|
| Claim | What the paper asserts. | The method lowers the variance of the estimates. |
| Evidence | What supports it. | `[@key]` reports a 23 percent lower variance on the benchmark. |
| Reasoning | Why the evidence supports the claim. | A lower variance means the estimates agree more across runs. |

The sub-arguments are written as a tree:

```
Central thesis: <main claim>
|- Sub-argument 1: <supporting claim>
|  |- Evidence A: <source and result>
|  |- Evidence B: <source and result>
|  `- Reasoning: <why A and B support the claim>
|- Sub-argument 2: <supporting claim>
`- Synthesis: <how the sub-arguments together support the thesis>
```

### Counter-arguments and rebuttals

Each sub-argument gets its strongest counter-argument and a rebuttal strategy:

| Sub-argument | Counter-argument | Rebuttal strategy |
|---|---|---|
| <claim> | <the strongest objection> | One of the four strategies below. |

The four rebuttal strategies:

1. **Refute.** Show that the counter-argument is factually wrong.
2. **Concede and limit.** Accept part of the objection and show that it does not defeat the argument.
3. **Reframe.** Show that the counter-argument supports the thesis from a different angle.
4. **Acknowledge as a limitation.** Discuss the scope boundary honestly.

### The logical flow

The flow maps the argument section by section onto the outline:

```
Introduction: problem, gap, purpose, research question
Related work: context, theme 1, theme 2, theme 3, gap confirmed
Method: approach justified, data described, analysis explained
Results: result 1 (supports sub-argument 1), result 2 (supports sub-argument 2)
Discussion: interpretation, comparison with the literature, counter-arguments addressed
Conclusion: thesis restated, implications, future research
```

The pattern of the discipline shapes the argument:

| Discipline | Pattern |
|---|---|
| Natural sciences | Hypothesis, test, support or reject |
| Social sciences | Theory, evidence, interpretation |
| Humanities | Close reading, analysis, argument |
| Engineering | Problem, solution, validation |
| Education | Context, intervention, outcome, implication |
| Policy | Problem, evidence, options, recommendation |

### The weak-argument signs

The agent checks each core argument for these signs:

- Circular reasoning: the conclusion restates the premise in other words.
- An appeal to authority without evidence: "Expert X says so" with no data.
- A hasty generalization: a single case generalized to a whole population.
- A false dichotomy: two options presented when more exist.
- Correlation treated as causation without controlling for confounds.
- Evidence from a single cultural or geographic context generalized globally.
- A key term that is undefined or used inconsistently across sections.
- A counter-argument that is stronger than the paper's own argument.

- Two or more signs in a core argument stop the drafting.
- The agent lists those signs under "Weak-argument signs" with the argument they belong to, and the session shows them to the user at the stop "The outline's approval".
- One sign is noted in the argument strength assessment and does not stop the drafting.
- No sign found is written as "No weak-argument signs."

## The files

`outline.md` has this form:

```
## Paper outline

### Structure: <Conference Paper | IMRaD | Literature Review | Theoretical | Case Study | Policy Brief | hybrid | user-customized>

### Overview
<One paragraph on the paper's flow.>

### Structure check
<Each mismatch of "The structure check" with its reason and its alternatives, or "No mismatch found.">

### Detailed outline

#### 1. <Section title> (about <N> words)
**Purpose**: <what the section does>
**Content**:
- 1.1 <Subsection>
  - <Key point>
**Sources**: <keys>
**Transition to next**: <how it connects to section 2>

### Evidence map
<The table of the evidence map, then the table of the planned figures.>

### Word count summary
| Section | Target words |
|---|---|
| Total | <N> words |
```

- The overview holds the suggested structures when the paper type was not specified.
- The first line of `outline.md` and of `arguments.md` is "Internal only" when `config.md` marks the manuscript Internal only, and the files have no such line otherwise.
- The file ends with the lines "Needs literature:" and "Sources pending:" for the sections and sources of the lists above, or says that there are none.

`structure-options.md` has this form, and the agent writes it only when the session gives the user's answer about the structure:

```
## Structure options

### What the user found wrong
<The user's answer, in the user's words.>

### Option 1: <name>
<The sections with their shares of the words.>
**Pros**: <what the structure does well for this paper>
**Cons**: <what it costs>

### Option 2: <name>
<The same.>
```

`arguments.md` has this form:

```
## Argument blueprint

### Central thesis
<One or two sentences.>

### Sub-arguments
#### Sub-argument 1: <claim>
- **Evidence**: <source and result>
- **Reasoning**: <the logical connection>
- **Counter-argument**: <the strongest objection>
- **Rebuttal**: <the strategy and its response>

### Logical flow
<The progression section by section.>

### Argument strength assessment
| Sub-argument | Evidence strength | Logic validity | Counter-argument risk |
|---|---|---|---|
| 1 | Strong, Moderate or Weak | Valid or Qualified | Low, Medium or High |

### Weak-argument signs
<The signs found, or "No weak-argument signs.">

### Notes for the draft writer
<Guidance on tone, hedging language and emphasis.>
```

## The checks before the files are shown

The agent checks both files against these before it writes them, and corrects what fails.

| Check | Passes when |
|---|---|
| Structure | The outline follows a skeleton of this page, a section list built under "The structure", or a justified hybrid. |
| The structure check | Every indicator of "The structure check" was tested, and each mismatch is listed with its reason and its alternatives. |
| Purpose | Every section has a Purpose. |
| Word count | The sum deviates by at most 5 percent from the target. |
| Evidence | Every source is assigned to a section. |
| Transitions | Every pair of adjacent sections has a transition. |
| Headings | They stay within 5 levels. |
| The research question | Each aspect of the question has a section, and an aspect with none gets a section or a change to an existing one. |
| Figures | Every planned figure has a unique label, a section and data. |
| The thesis | It is clear, specific and arguable. |
| Sub-arguments | At least 3 support the thesis, and every claim has at least one cited evidence source. |
| Counter-arguments | Every sub-argument has a counter-argument, and every counter-argument has a rebuttal strategy. |
| The flow | It covers all major sections of the outline. |
| The assessment | It flags the weak points honestly. |
| Fallacies | No argument commits a logical fallacy such as a straw man, an attack on the person or a false dichotomy. |

- The files are a proposal until the user approves them at the stop "The outline's approval".
