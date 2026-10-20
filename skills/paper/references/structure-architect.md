# Structure architect

The structure architect agent reads this page to choose the structure of the paper and to write its outline. It writes `outline.md` in the run folder and changes no other file. The outline is the blueprint the argument builder and the draft writer follow, and the user approves it at the stop "The outline's approval" before the draft writer runs.

## What the agent reads

- `config.md`: Paper type, Length, Discipline, Research question, Venue, Venue limits and the Notes.
- `review.md` of the literature strategist, when it ran: the literature matrix, the gaps and the annotations with their stance and potential use.
- The manuscript's `.bib` or `refs.bib`, when the literature strategist did not run: its entries are the sources to assign.
- A section of the project that already holds draft text, when the Materials in hand row lists existing draft sections.

Where an input is missing:

| Missing | The agent does |
|---|---|
| The literature search report | Infers the likely distribution of topics from the research question and marks "sources pending" in the outline. |
| The length | Takes the median of the typical length of the paper type. |
| The paper type | Lists 2 or 3 suggested structures with their pros and cons in the outline's overview, and the user chooses at the outline's approval. |
| The "Potential use" of a source | Infers the section from the source's content and marks the assignment "auto-inferred". |

## The structure

- The paper type of `config.md` picks the structure.
- The Conference Paper skeleton is the default, since it suits a machine learning paper bound for a conference.
- A paper type with no skeleton on this page gets a section list that the agent builds from the type and the research question. It keeps the proportions of the allocation table below.
- A paper with partial drafts takes the structure of the existing draft first.
- A research question that spans several types gets a hybrid structure, and the overview says why.
- A paper type that is not specified and has no original data suggests Literature Review for a synthesis, Theoretical for a framework, and Case Study for one institution or case.
- A user who insists on a non-standard structure gets it, recorded as "user-customized".
- The sections follow the paper's argument, so that a reader finds any piece of information where they expect it, and the share of words reflects the importance of each section.

### Adjustments by type

- Theoretical: the Framework share rises to 30 percent, and the section holds the theoretical lineage, the concept definitions and the derivation of propositions.
- Case Study: a Case Context section is added with the institutional background and the data sources, and the analysis uses several dimensions.
- Policy Brief: an Executive Summary replaces the abstract, and a Recommendations section takes 25 to 30 percent of the words.
- Interdisciplinary: the literature groups in the Literature Review are labelled by discipline.

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

- The abstract figure is a planning figure, and it is not counted in the total. The finished abstract follows `references/abstract.md`.
- In the two skeletons above the Experiments and Results sections together take the share of "Analysis or results", and the agent splits it by what the paper needs.
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
- A section that needs literature and has no source is a gap. The agent lists it in the outline as "needs literature", and the session returns it to the user.
- A methodology section or a section of original analysis may need no external source.
- A summary in the existing draft that mentions an argument with no source in the matrix is marked "needs literature supplementation".
- A literature matrix with fewer than 3 themes is reported with a suggestion to split a theme or search again.
- A matrix with more than 6 themes is reported with a suggestion to merge similar themes, and a literature review keeps 3 to 5 thematic sections.

### Transitions

Each boundary between adjacent sections states:

- how the current section leads into the next.
- what the reader should understand before moving on.
- the theme or argument that connects them.

## The file

`outline.md` has this form:

```
## Paper outline

### Structure: <Conference Paper | IMRaD | Literature Review | Theoretical | Case Study | Policy Brief | hybrid | user-customized>

### Overview
<One paragraph on the paper's flow.>

### Detailed outline

#### 1. <Section title> (about <N> words)
**Purpose**: <what the section does>
**Content**:
- 1.1 <Subsection>
  - <Key point>
**Sources**: <keys>
**Transition to next**: <how it connects to section 2>

### Evidence map
<The table of the evidence map.>

### Word count summary
| Section | Target words |
|---|---|
| Total | <N> words |
```

- The overview holds the suggested structures when the paper type was not specified.
- The file ends with the lines "Needs literature:" and "Sources pending:" for the sections and sources of the lists above, or says that there are none.

## The checks before the outline is shown

The agent checks the outline against these before it writes the final file, and corrects what fails.

| Check | Passes when |
|---|---|
| Structure | It follows a skeleton of this page, a section list built under "The structure", or a justified hybrid. |
| Purpose | Every section has a Purpose. |
| Word count | The sum deviates by at most 5 percent from the target. |
| Evidence | Every source is assigned to a section. |
| Transitions | Every pair of adjacent sections has a transition. |
| Headings | They stay within 5 levels. |
| The research question | Each aspect of the question has a section, and an aspect with none gets a section or a change to an existing one. |

- The outline is a proposal until the user approves it at the stop "The outline's approval".
