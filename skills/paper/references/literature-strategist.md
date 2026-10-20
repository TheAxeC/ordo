# Literature strategist

The literature strategist agent reads this page to design the search, screen the sources and write the review. It writes `review.md` and `refs.bib` in the run folder in one start and changes no other file. When the session gives it the block manifest of a manuscript `.bib`, it also writes the patch that adds the new entries in the same start, as `references/patch-file.md` gives.

## What the agent reads

- `config.md`: Topic, Research question, Discipline, Language, Paper type, Domain evidence profile, Materials in hand, AI use and the Notes.
- The manuscript's `.bib`, when the call gives one.
- In revision mode, the numbered items of `items.md` that call for a new reference, and the New references row of `config.md`.
- Every lookup is made with `lookup.py` and never with a web search, a fetch of a web page or `curl`.

Where an input is missing:

| Missing | The agent does |
|---|---|
| The research question | Takes the topic as the question the search answers. With neither, it reports that it cannot start. |
| The discipline | Searches without narrowing to a field. |
| The language | Searches in English. |
| The year range | Takes the last 10 years and leaves seminal works unrestricted. |

- In lit-review mode the paper type is Literature Review.
- A research question that is vague gets two or three possible search directions listed in the report, and the session returns them to the user.
- A discipline that is too broad, such as "social science", gets a narrower sub-field suggested in the report.

## Revision mode

In revision mode the session starts the agent once for the items that call for a new reference, and only when the New references row of `config.md` allows it.

- The research question of the search is the request of those items, and the topic is the manuscript's.
- The agent searches, screens and annotates as the sections below say, and writes `review.md`, `refs.bib` and the patch that adds the new entries to the manuscript's `.bib`.
- Each operation of the patch names the ids of the items it answers in `roadmap_item_ids`.
- The agent adds no reference that no item calls for.

## The search design

- Extract two to four primary concepts from the research question.
- List the secondary concepts, the synonyms and the discipline's terms for each.
- Combine them in a search string of this form:

```
("concept A" OR "synonym A1") AND ("concept B" OR "synonym B1") AND ("concept C") NOT ("exclusion term")
```

- `lookup.py search` has no filter options, so the year range, the publication type and the language apply at screening.
- The searches query the four indexes that `lookup.py` asks, and the report names each index a call left out with the reason it printed.
- A search that is documented is reproducible: the report holds each search string, its date and the number of records it returned.

## Criteria

| Criterion | Include | Exclude |
|---|---|---|
| Publication type | Peer-reviewed journals, books, conference proceedings | Blog posts and news articles, unless they are primary data |
| Date range | The last 10 years by default, and seminal works | Outdated work, unless historically relevant |
| Language | The language the Language row gives | Other languages, unless the source is key |
| Relevance | Directly addresses the research question | Tangentially related |

The domain evidence profile of `config.md` decides which evidence types the criteria admit, and it never changes which indexes are searched.

- Three gates hold under every profile: the source is relevant (its abstract addresses the research question), its methodology has no fatal design flaw, and it is not predatory or fabricated.
- A profile only relaxes the peer-review requirement, the publication type, the currency window and the provenance expectation.
- A profile adds ways to admit a source and removes none: whatever the neutral criteria admit stays admitted.
- `cs_ml` admits archival preprints such as arXiv, conference proceedings and industry technical reports, since peer review lags the field. Each such source is tagged by its evidence type.
- Under `cs_ml` the agent surfaces non-reproducible results and benchmark cherry-picking as critical gaps.
- Under `neutral` the criteria above apply as they stand.
- A preprint that is off-topic, fatally flawed or predatory is excluded under every profile.

## Starting from the manuscript's `.bib`

When the call gives a `.bib`, the searching starts there.

- Every entry is screened under the criteria above, the same as an external result. No entry is pre-approved.
- An entry's title is always available, and its abstract is read when the `.bib` holds one. A missing field narrows the screening and does not skip the entry.
- An entry is skipped only when the criteria cannot be applied at all. Every skipped entry is listed in `review.md` with its reason, and no entry is dropped without a line.
- The entries of the `.bib` are never changed or removed. The new entries are only added.
- The report opens its search strategy with a block of this form:

```
Screened from the manuscript's .bib:
- Entries scanned: <N>
- Included: <K> entries, with their keys
- Excluded by the criteria: <E> entries, with their keys
- Skipped (the criteria cannot be applied): <S> entries, each as <key>: <reason>
- Note: presence in the .bib does not imply inclusion; the same criteria applied to the .bib and to external sources.
```

- When no entry is included, the block adds "zero included after screening".
- The causes of that result are a `.bib` that is stale for the research question, a question that has shifted from what the `.bib` was built for, or entries that are unrelated to it.
- The agent derives the uncovered topics: the subtopics of the research question that the included entries do not cover.
- With uncovered topics, the external search runs on those topics only.
- Without uncovered topics, the external search runs unrestricted and checks for newer work and duplicates.
- When the user asked in the Notes to use the `.bib` only, no external search runs.
- With no uncovered topics, the report then says "external search omitted on user request".
- With uncovered topics, the report then lists them as a known coverage gap.
- The included entries of the `.bib` and the included external sources together are the final set.

## The four searches

| Layer | Made with | Decision |
|---|---|---|
| 1. Boolean search | `lookup.py search '<search string>' --limit 100` with the primary concepts. | Under 20 records: relax the search by removing the NOT term and widening the year range. A search that fills the 100 records an index returns: tighten it with qualifiers or a narrower year range. |
| 2. Citation chaining | `lookup.py refs <DOI>` for each of the 5 to 10 core papers of layer 1. | A work that appears in the references of 3 or more core papers is marked "must include". |
| 3. Forward tracking | `lookup.py cited-by <DOI>` for each foundational work of layer 2. | Prefer the citing works of the last 3 years. A foundational work with no citing work in the last 3 years is marked "possibly outdated". |
| 4. Semantic search | `lookup.py search '<research question>' --limit 100` with the research question as a sentence. | Results that overlap layers 1 to 3 by more than 80 percent mean the search is saturated. |

- Layer 2 typically adds 10 to 20 papers, and layer 4 adds cross-disciplinary work that layers 1 to 3 missed.
- A listing that ends in "first 100, more exist" for an index holds more than 100 works for it, and the agent reads that as 100 or more.
- A pass is one run of the four layers. The search ends when at least 3 of the 5 conditions below hold, or after 4 passes, whichever comes first:

| # | Condition | Assessment |
|---|---|---|
| 1 | The source count meets the target. | The minimum of the source-count table is reached. |
| 2 | The latest search added nothing new. | It added fewer than 10 percent of the existing sources. |
| 3 | Every theme is saturated. | Every theme of the literature matrix has at least 3 sources. |
| 4 | The citation loop closes. | Citation chaining finds no cited work that is not yet collected. |
| 5 | The temporal span is covered. | The set holds foundational works and research of the last 3 years. |

- After 4 passes with fewer than 3 conditions holding, the agent records a "search limitation" in the report that names the conditions that hold, and goes on.

## Screening

Records that share a DOI or an arXiv ID are one source, and duplicates are removed before screening. Screening has two stages.

- **Title and abstract.** Each record is tagged Include, Exclude or Maybe against the criteria. The stage narrows the set to 30 to 50 candidates.
- **Full-text assessment.** The abstract and key sections of each Include and Maybe source are read for relevance, quality and strength of evidence. The stage ends on 15 to 30 final sources, a number that varies by paper type.

A candidate source passes this tree in order. A "no" ends it at Exclude unless the node says otherwise.

1. Is it peer-reviewed? If not, it is included as grey literature when it is a government report or white paper that addresses the research question directly. Otherwise it goes on only when the profile admits it, tagged by its evidence type, and it still passes the nodes below.
2. Is it within the time range? If not, it is included as a seminal work when it is a foundational work of the field cited more than 100 times, counted from the `cited-by` listing. Otherwise it is excluded.
3. Does its abstract address at least one aspect of the research question? If not, it is excluded.
4. Is its methodology reliable, with a reasonable sample size and no obvious design flaw? If that cannot be determined, it is tagged Maybe and goes to the full-text stage. If it is not reliable, it is excluded, unless it is an important opposing viewpoint. Otherwise it is included.

Each included source is scored on five items from 1 to 3 points:

| Item | 3 points | 2 points | 1 point |
|---|---|---|---|
| Venue ranking | Q1 or Q2 journal, or SSCI-indexed | Q3 journal or well-known conference | Q4 journal or unranked |
| Methodological rigor | Well-designed and statistically sound | Reasonable design with minor flaws | Obvious design problems |
| Relevance to the research question | Addresses the core question | Addresses partial aspects | Provides background only |
| Citation count | In the top 25 percent for works of the same age | Near the median | Below the median |
| Evidence quality | Sufficient original data | Secondary data that is reliable | Weak or missing evidence |

- A total of 12 or more is High quality, and the source is assigned to a core section.
- A total of 8 to 11 is Medium quality, and the source is assigned to a supporting section.
- A total of 7 or less is Low quality, and the source is used only when no alternative exists.
- Under a non-neutral profile a source passes the quick assessment when it meets the neutral total or meets the profile's evidence-type expectation on the venue-ranking item alone. The other four items stay in force.

## Source counts and gates

| Paper type | Minimum | Typical range |
|---|---|---|
| IMRaD | 20 | 25 to 40 |
| Literature Review | 30 | 40 to 80 |
| Theoretical | 15 | 20 to 35 |
| Case Study | 15 | 20 to 30 |
| Policy Brief | 10 | 15 to 25 |
| Conference Paper | 10 | 15 to 25 |

Adjustments by type:

- Theoretical: layer 2 weighs more, tracing the theory's origins, and quality assessment emphasizes the theoretical contribution.
- Case Study: grey literature is tolerated more (policy documents and institutional reports), and the agent searches for prior research on similar cases.
- Policy Brief: government reports, white papers and statistical data are included, and at least 60 percent of the sources are from the last 3 years.
- Conference Paper: the minimum is 80 percent of the table's minimum, and high-impact sources come first.

The review passes only when every gate holds:

| Gate | Pass | When it fails |
|---|---|---|
| Search documented | The indexes, search strings and criteria are recorded. | Complete the record. |
| Source count | The minimum for the paper type is met. | Run one more pass of layers 2 to 4. |
| Annotations | Every included source has an annotation. | Write the missing ones. |
| Matrix coverage | Every theme has at least 3 sources. | Search again for the weak themes. |
| Research gaps | At least 2 specific, actionable gaps. | Analyze the matrix again. |
| Peer-reviewed share | At least 70 percent of the sources are peer-reviewed. | Replace non-academic sources. |
| Currency | At least 50 percent of the sources are from the last 5 years, unless the topic is historical. | Search for the last 3 years and check preprints, tagged as preprints. |

- A failed gate is handled once, as its row says. The bullets below say what follows when it still fails.
- Under a non-neutral profile the two share gates relax and never tighten: preprints count toward the peer-reviewed share under `cs_ml`. The thresholds stay as they are.
- When the source count stays short after the extra pass, the agent widens the year range by 5 years and then states "limited literature available" in the report.
- When theme coverage stays uneven, the agent suggests different theme divisions.
- When quality stays low, the agent replaces the sources with a score of 7 or less where it can and states the limitation in their annotations.
- A gate that still fails after these actions is named in the report as not met, and the review goes on.

## The annotated bibliography

Each included source has this annotation:

```
### Author (Year). Title.
- **Type**: Journal article / Book / Chapter / Report / Conference paper
- **Method**: <the research method used>
- **Key results**: <2 to 3 sentences on the main results>
- **Relevance**: <how the source connects to the research question>
- **Quality**: <High, Medium or Low, with the strength or limitation>
- **Stance**: <supports, opposes or neutral toward the paper's position>
- **Potential use**: <the section of the paper that will use the source>
```

- The annotation does not say whether the source came from the `.bib` or from a search.
- Every annotation is written from the abstract or the full text the agent read, and a field it could not fill is left as "[GAP: <field>]".

## The literature matrix

- The matrix has one row per included source and one column per theme, with `main` where a theme is the source's main one and `x` where it also touches the theme.
- It adds the columns Method and Quality, with Quality as High, Medium or Low, so that the planner assigns high-quality sources to the core sections.
- It has no column for provenance.

```
| Source | Theme 1 | Theme 2 | Theme 3 | Method | Quality |
|---|---|---|---|---|---|
| Author1 (Year) | main | x | | Quant | High |
```

## The gaps

The agent lists at least 2 gaps that are specific and actionable, each of one of these types:

1. An under-researched area: a topic that sources mention and none studies.
2. A methodological gap: a method that is missing, such as no qualitative studies.
3. A population gap: an understudied context or population.
4. A temporal gap: a lack of recent data.
5. A geographical gap: research limited to certain regions.

- The gaps inform the paper's contribution statement.
- The uncovered topics and the zero-included note of the `.bib` screening carry into the gaps as stated coverage limits, so that no omission stays silent.

## The distribution advisory

After retrieval, screening and removal of duplicates, the agent checks the distribution of the final set on four dimensions, and it uses only the metadata and annotations that are present.

- Time: publication year, decade or the period the user names.
- Geography: study site, population region or a stated context.
- Method: qualitative, quantitative, mixed methods, review, theoretical, computational or simulation, dataset or tool paper.
- Venue: one journal or conference family, the three most frequent venues, preprints alone, or grey literature.
- A dimension with too few known values is left out, and a missing value is never inferred from a stereotype.
- When one known value accounts for 70 percent or more of the known entries of a dimension, the report holds an advisory of the form below, counted over the known entries of that dimension.
- The advisory does not block the review, does not lower any source and does not judge novelty. The user can keep the concentration when it is justified.

```
Distribution advisory:
- Dimension: <time | geography | method | venue>
- Concentration: <value> = <n>/<known N> (<pct> percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: <a new search string or source family to add, or "no expansion; the user requested this scope">
```

## The synthesis

- The synthesis has one paragraph group per theme of the matrix, and each paragraph states what the included sources show on that theme, where they agree and where they disagree.
- Each claim cites its sources as `[@key]`, with the key of the source's entry in `refs.bib`.
- The synthesis claims only what an annotation supports.

## The BibTeX entries

- One BibTeX entry per included source comes from `lookup.py bibtex <DOI or arXiv ID>`, written to `refs.bib` in the run folder as the script printed it.
- One blank line stands between entries, so that each entry is a block of its own.
- The entry is not typed from memory.
- A source with neither a DOI nor an arXiv ID, or one for which `lookup.py bibtex` gets no entry, has no entry in `refs.bib`. It is listed in `review.md` under "No entry written" with its record, is not cited in the synthesis, and is named in the report.
- When the call gives a `.bib`, the rules apply in this order to each included source.
  - A source whose DOI, or whose arXiv ID when it has no DOI, is already in the `.bib` gets no new entry and is marked "already in the .bib" in the annotation.
  - Any other source whose key equals an existing key gets the key with the first unused letter appended: `a`, then `b`.
- `refs.bib` holds the new entries only. The patch that adds them to the manuscript's `.bib` inserts them after its last block. Its operations name the id `lit-review` in `roadmap_item_ids` in lit-review mode, and the ids of the items they answer in revision mode.

## The report

`review.md` has these sections in this order:

1. Search strategy: the screened `.bib` block when there is a `.bib`, the indexes with those left out, the search strings and dates, the criteria and the profile.
2. Distribution advisory: the advisory blocks, or "No distribution advisory triggered."
3. Screening results: the initial hits, the number after title and abstract screening, the number after full-text assessment and the final included sources.
4. Annotated bibliography.
5. Literature matrix.
6. Identified gaps.
7. Synthesis.
8. Recommended sources by paper section, as a table with the columns Section and Key sources for Introduction, Literature Review, Methodology and Discussion.
9. No entry written, when a source has none.
10. Search limitations and gate failures, when there are any.
11. AI disclosure: the one line that `references/ai-disclosure.md` gives under "The line of a review".

- The planner reads the matrix, the gaps and the sources by theme with their stance, and the draft writer reads the table of sources by section.
