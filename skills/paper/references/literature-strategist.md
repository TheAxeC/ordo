# Literature strategist

The literature strategist agent reads this page to design the search, screen the sources and write the review. It writes `review.md` and `refs.bib` in the run folder, and `screened-<list>.txt` for each list of the screened `.bib` block that holds more than 50 entries. Besides the texts `lookup.py fetch` writes into the run's temporary folder, it changes no other file. When the session gives it the block manifest of a manuscript `.bib`, it also writes the patch that adds the new entries, as `references/patch-file.md` gives. It does all of this in one start. The session resumes the same agent by a second message in four cases. They are a change the user makes at the stop "The sources' review", the sections of the outline that have no source, the review of an expanded revision whose root cause is insufficient evidence, and a patch the script rejected. In revision mode the session starts it for the items that call for a new reference.

## What the agent reads

- `config.md`: Topic, Research question, Discipline, Language, Paper type, Domain evidence profile, Materials in hand, AI use and the Notes.
- In revision mode, the items that call for a new reference stand in place of the Topic and the Research question, which that mode does not ask.
- The sources given: the manuscript's `.bib`, when the call gives one, and the `.bib`, the annotated bibliography or the earlier review that the Materials in hand row names. A research report that row names gives the question, the discipline and the method that the session filled at intake.
- Every lookup is made with `lookup.py` and never with a web search, a fetch of a web page or `curl`.
- The run's temporary folder, which the session gives, for the texts `lookup.py fetch` writes ("Reading a candidate").
- `references/citation-compliance.md`, "Looking a reference up": how a line of `resolve` is read, and how a year and a venue are confirmed.
- In full mode given an earlier plan run, that run's `chapter-plan.md` and `insights.md` ("Starting from a plan run").
- At its resumption for the sections without a source: the sections of `outline.md` marked "needs literature", with their purpose, content summary and arguments. Also the files the agent wrote before when it ran in this run.
- At its resumption for an expanded revision: the last `review-<r>.md` of the draft review, whose root cause is insufficient evidence, with the claims it names as lacking support. Also the files the agent wrote before in this run.

Where an input is missing:

| Missing | The agent does |
|---|---|
| The research question | The agent does not start the search, in any mode that starts it. It reports that it cannot start, and the session asks the question at intake again. The agent never takes the topic as the question. |
| The discipline | Searches without narrowing to a field. |
| The language | Searches in English. |
| The year range | Takes the last 10 years and leaves seminal works unrestricted. |

- In lit-review mode the paper type is Literature Review.
- In full mode the agent screens the sources given and searches for what they miss. In outline-only mode and lit-review mode it does the same with the sources given, which may be none.
- A research question that is vague gets two or three possible search directions listed in the report, and the session returns them to the user.
- A discipline that is too broad, such as "social science", gets a narrower sub-field suggested in the report.

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

- The profile is one of the four values of `references/intake.md`, "The evidence profile". A row that is `unknown_user_defined (requested: <profile>)` with a reserved profile is read as `unknown_user_defined`, and the report says that no profile exists yet for the requested domain. A row that is absent, that holds a value outside the four, or that holds a name of the four with a `(requested: ...)` suffix is read as `unknown_user_defined`. The report says the row could not be read.
- A profile whose discipline differs from the Discipline row, such as `cs_ml` with a Humanities discipline, is used for admission. The Discipline row is used for the choice of search terms, and the report says that the two differ. Nothing is blocked. `general_social_science` fits Social Science and Policy, `cs_ml` fits Computer Science, Engineering and Technology, and `humanities_interpretive` fits Humanities. `unknown_user_defined` and an absent row never give this warning.
- Three gates hold under every profile: the source is relevant (its abstract addresses the research question), its methodology has no fatal design flaw, and it is not predatory or fabricated.
- A profile only relaxes the peer-review requirement, the publication type, the currency window and the provenance expectation.
- A profile adds ways to admit a source and removes none: whatever `unknown_user_defined` admits stays admitted, and the agent combines the two by union and never by replacement.
- `general_social_science` admits expert-panel reports and context-dependent policy analyses, tagged by their evidence type, and surfaces a finding generalized from a single context and weak external validity as critical gaps.
- `cs_ml` admits archival preprints such as arXiv, conference proceedings and industry technical reports, since peer review lags the field. Each such source is tagged by its evidence type. The agent surfaces non-reproducible results and benchmark cherry-picking as critical gaps.
- `humanities_interpretive` admits primary sources, archival material, canonical or older texts and monographs. It does not apply the currency window to a canonical text, since recency is no signal of quality. Each such source is tagged by its evidence type. The agent surfaces interpretive over-reach and missing primary-source grounding as critical gaps.
- Under `unknown_user_defined` the criteria above apply as they stand and no gap is surfaced as critical on account of the profile.
- A source that is off-topic, fatally flawed or predatory is excluded under every profile.
- When the profile admits a source type, the year-range and publication-type filters that the agent applies at screening admit it too. A filter never removes a source that the screening tree would admit.

## Starting from the manuscript's `.bib`

When the call gives a `.bib`, the searching starts there. In full mode that is the manuscript's `refs.bib` when one stands, and otherwise the `.bib` the Materials in hand row names. An earlier lit-review run's `refs.bib` that intake took for outline-only mode is screened the same way.

- Every entry is screened under the criteria above, the same as an external result. No entry is pre-approved.
- An entry's title is always available, and an entry may hold an `abstract` field. Whether an entry is fetched is as "Reading a candidate" says. A missing field narrows the screening and does not skip the entry.
- An entry is skipped only when the criteria cannot be applied at all. Every skipped entry is listed in `review.md` with its reason, and no entry is dropped without a line.
- The entries of the `.bib` are never changed or removed. The new entries are only added.
- The report opens its search strategy with a block of this form, and a list of more than 50 entries is cut as the bullets after the block say:

```
Screened from the manuscript's .bib:
- Entries scanned: <N>
- Included: <K> entries, with their keys
- Excluded by the criteria: <E> entries, with their keys
- Skipped (the criteria cannot be applied): <S> entries, each as <key>: <reason>
- Note: presence in the .bib does not imply inclusion; the same criteria applied to the .bib and to external sources.
```

- A list of the block with more than 50 entries is printed in `review.md` as its first 20 entries and its last 5 entries, in alphabetical order of the key. A line "<n> entries in between, listed in <file name>" follows them.
- The full list is written to a file beside `review.md` in the run folder, `screened-<list>.txt`, where `<list>` is `included`, `excluded` or `skipped`. It has one line `<key>: <reason>` for each entry, in alphabetical order of the key. The reason is the criterion that decided the entry, and for a skipped entry the reason the criteria could not be applied.
- A list of 50 entries or fewer is printed whole in the block, and no file is written for it.

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
- A pass is one run of the four layers. After each pass the agent checks which of the 5 conditions below hold.

| # | Condition | Assessment |
|---|---|---|
| 1 | The source count meets the target. | The minimum of the source-count table is reached. |
| 2 | The latest pass added little that is new. | It added fewer than 10 percent of the existing sources. |
| 3 | Every theme is saturated. | Every theme of the literature matrix has at least 3 sources. |
| 4 | The citation loop closes. | Citation chaining finds no cited work that is not yet collected. |
| 5 | The temporal span is covered. | The set holds foundational works and research of the last 3 years. |

- The search ends when at least 3 conditions hold and condition 2 is among them.
- A pass that adds 10 percent or more of the existing sources leaves condition 2 unmet, and another pass runs. The passes stop at 8, and the agent then records a "search limitation" in the report that names the conditions that hold, and goes on.
- With no condition holding after pass 4, the search ends there with a "search limitation" in the report, and the agent goes on.
- The report names each pass with the sources it added.

## Screening

Records that share a DOI or an arXiv ID are one source, and duplicates are removed before screening. Screening has two stages.

- **Title and abstract.** Each record is tagged Include, Exclude or Maybe against the criteria. The stage narrows the set to 30 to 50 candidates.
- **Full-text assessment.** The abstract and key sections of each Include and Maybe source are read for relevance, quality and strength of evidence, from the file `fetch` wrote for it, as "Reading a candidate" says. A source for which no such file exists is the case "A candidate that cannot be read", and the stage assesses it from what that block leaves. The stage ends on 15 to 30 final sources, a number that varies by paper type.

- **Reading a candidate.** A candidate's abstract is read from the file `lookup.py fetch` writes for it.
  - At the stage "Title and abstract", a candidate the title alone excludes is not fetched.
  - Every other candidate is fetched into the run's temporary folder before its abstract is read, with `lookup.py fetch '<input>' '<temporary folder>' '<input>'`.
  - The input is the candidate's DOI, else its arXiv ID, else its Semantic Scholar ID, else its OpenAlex ID. The key is the same identifier, so no two candidates share a file.
  - The candidate is screened and annotated from `<stem>.txt`, the full text `fetch` writes, read with the Read tool. `<stem>` is the key with each `/` and `:` written `_`.
  - An exit 1 of `fetch` with `<stem>.abstract.txt` written is the abstract case: the candidate is screened and annotated from that file, read with the Read tool.
  - The same holds when `pdftotext` is missing: `fetch` goes on to the next URL and then to the abstract.
  - A source given as a `.bib` entry with an `abstract` field is screened from that field at the stage "Title and abstract", and is not fetched for that stage.
  - A `.bib` entry that the stage "Title and abstract" kept as Include or Maybe without a fetch is fetched before the stage "Full-text assessment" reads it, as every other candidate is.

- **A candidate that cannot be read.** A candidate whose `fetch` wrote neither `<stem>.txt` nor `<stem>.abstract.txt`, or that has none of the four identifiers, is looked up again before it leaves the set.
  - `lookup.py resolve` runs on each identifier the candidate has: its DOI, its arXiv ID and its title. Each index that holds the candidate prints its record and its identifiers.
  - A candidate that stays unread is screened on its record and its `cited-by` count.
  - An unread candidate that layer 2 marked "must include", or that the seminal rule of node 2 below admits, is included and annotated "abstract not read", with the lookups tried.
  - Any other unread candidate is excluded, and `review.md` names the lookups tried for it.
  - `review.md` names, for each such candidate, the URLs `fetch` printed for it, or "no identifier to fetch".
  - No lookup leaves `lookup.py`.

A candidate source passes this tree in order. A "no" ends it at Exclude unless the node says otherwise.

1. Is it peer-reviewed? If not, it is included as grey literature when it is a government report or white paper that addresses the research question directly. Otherwise it goes on only when the profile admits it, tagged by its evidence type, and it still passes the nodes below.
2. Is it within the time range? If not, it is included as a seminal work when it is a foundational work of the field cited more than 100 times, counted from the `cited-by` listing. Otherwise it is excluded.
3. Does its abstract, read from the file `fetch` wrote or from its `.bib` entry's `abstract` field ("Reading a candidate"), address at least one aspect of the research question? If not, it is excluded. A candidate that "A candidate that cannot be read" included as "abstract not read" is not excluded here and goes on to node 4.
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
- Under a profile other than `unknown_user_defined` a source passes the quick assessment when it meets the total or meets the profile's evidence-type expectation on the venue-ranking item alone. The other four items stay in force.

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
- Under a profile other than `unknown_user_defined` the two share gates relax and never tighten. Preprints count toward the peer-reviewed share under `cs_ml`. A canonical or older text does not count against the currency share under `humanities_interpretive`. The thresholds stay as they are.
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
- Every annotation is written from the file `fetch` wrote, the full text or the abstract, or from the `.bib` entry's `abstract` field ("Reading a candidate"), and a field it could not fill is left as "[GAP: <field>]".
- The annotation of an included source whose abstract was not read says "abstract not read" and names the lookups tried. Its fields come from the record and the `cited-by` count only.

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
- In lit-review mode the synthesis has the structure of a review paper, so that the draft of a review can be written from it.
  - It opens with the topic and its rationale, and the scope and boundaries (what is included and excluded, the period, the disciplines, the geographies). It then gives the review methodology (the search, the criteria and the number of sources) and a preview of the themes.
  - It has one part for each of 3 to 5 themes of the matrix. Each part has a paragraph group for each sub-theme and a summary of what the literature says on the theme.
  - It continues with the cross-cutting synthesis: the convergent findings, the divergent findings and the debates, and the methods that dominate or are underused.
  - It ends with the gaps (3 to 5, the ones "The gaps" lists), a proposed research agenda, the key takeaways and the implications for practice or policy.

## The BibTeX entries

- One BibTeX entry per included source comes from `lookup.py bibtex <DOI or arXiv ID>`, written to `refs.bib` in the run folder as the script printed it.
- One blank line stands between entries, so that each entry is a block of its own.
- The entry is not typed from memory.
- A source with neither a DOI nor an arXiv ID, or one for which `lookup.py bibtex` gets no entry, gets its entry from the record `lookup.py resolve '<title>'` prints for it.
  - The entry takes the title, the authors, the year, the venue and the record's open-access URL or index page from the printed line.
  - Its type is `@inproceedings` for a proceedings volume, `@article` for a journal and `@misc` otherwise.
- A source for which no index prints a record has no entry in `refs.bib`. It is listed in `review.md` under "No entry written" with its record, is not cited in the synthesis, and is named in the report.
- How the venue and the year of an entry are confirmed, and how an entry whose year or venue only a left-out index could have given is resolved again, is in `references/citation-compliance.md`, "Looking a reference up".
- An entry that no answering index confirms is named in the report and in `review.md` with the indexes that were left out.
- The agent runs `lookup.py resolve --entry refs.bib <key>` on each entry it wrote, before the synthesis cites it.
  - An entry that prints `CONFIRMED` stays.
  - An entry that prints `NOT_CONFIRMED` is resolved again once by its other identifiers (its DOI, its arXiv ID, its title with its year), and it is corrected from a record that confirms it. The agent runs `resolve --entry` on the corrected entry.
  - An entry still not confirmed is taken out of `refs.bib` and out of the synthesis. It is listed in `review.md` under "No entry written" with its line, and the report names it, so that the session carries it into the final message.
- In full and revision mode the agent does the same for the entries it adds.
- When the call gives a `.bib`, the rules apply in this order to each included source.
  - A source whose DOI, or whose arXiv ID when it has no DOI, is already in the `.bib` gets no new entry and is marked "already in the .bib" in the annotation.
  - Any other source whose key equals an existing key gets the key with the first unused letter appended: `a`, then `b`.
- `refs.bib` holds the new entries only. The patch that adds them to the manuscript's `.bib` inserts them after its last block, and its operations name the id `lit-review` in `roadmap_item_ids` in lit-review mode, the id `full` in full mode, and the ids of the items they answer in revision mode.

## The report

`review.md` has these sections in this order:

1. Search strategy: the screened `.bib` block when there is a `.bib`, the indexes with those left out, the search strings and dates, each pass with the sources it added, the conditions that held when the search ended, the criteria and the profile.
2. Distribution advisory: the advisory blocks, or "No distribution advisory triggered."
3. Screening results: the initial hits, the number after title and abstract screening, the number after full-text assessment and the final included sources, and for each candidate that stayed unread the lookups tried and whether it was included or excluded.
4. Annotated bibliography.
5. Literature matrix.
6. Identified gaps.
7. Synthesis.
8. Recommended sources by paper section, as a table with the columns Section and Key sources for Introduction, Literature Review, Methodology and Discussion.
9. No entry written, when a source has none or an entry was taken out.
10. Search limitations and gate failures, when there are any.
11. AI disclosure: the one line that `references/ai-disclosure.md` gives under "The line of a review".

- The planner reads the matrix, the gaps and the sources by theme with their stance, and the draft writer reads the table of sources by section.

## The sources' review

The session shows the user the sources `review.md` includes, and the user may add or remove sources. The session then resumes this agent with the change as a second message, and the agent updates `review.md`, `refs.bib` and its patch.

- An added source is looked up with `lookup.py resolve`, annotated, entered in the matrix and given its entry by `lookup.py bibtex`, like an included source. The entry is run with `lookup.py resolve --entry`, as "The BibTeX entries" says. The annotation is marked "added by the user", and the source is not screened out.
- A removed source leaves the annotated bibliography, the matrix, `refs.bib` and the patch, and the synthesis is rewritten where it cited the source.
- The agent changes nothing else in the files, and it starts no new search.
- A source the user adds that has neither a DOI nor an arXiv ID gets its entry from the record `lookup.py resolve '<title>'` prints for it, as "The BibTeX entries" says. Only a source for which no index prints a record is listed under "No entry written".
- A rejected patch is answered the same way: the session resumes the agent with the rejection as printed, and the agent writes one new patch.

## The sections without a source

After the planner's outline, the session resumes the agent when the outline marks sections "needs literature". In full mode it starts the agent fresh instead when the sources came from earlier lit-review outputs that the intake took and this run's agent never ran.

- The agent reads the marked sections and runs the search of "The search design" and "The four searches" for each, under the search's end of "The four searches". It screens the records under the criteria above.
- It adds the sources it includes to `review.md`, `refs.bib` and the patch, with annotations and matrix rows, under the rules of "The BibTeX entries". It removes none.
- The report lists, for each marked section, the sources found for it and the searches made.
- A section for which no source meets the criteria is named in the report with the searches made, so that the outline shows it as "needs literature".

## Starting from a plan run

In full mode, intake may take an earlier plan run's outputs (`references/intake.md`, "Earlier outputs"). The agent is then also given that run's `chapter-plan.md` and `insights.md`.

- The seeds are the references the chapter plan names under "Seeds for the literature strategist" and the keywords of the evidence in `insights.md`. The agent looks each seed up with `lookup.py` and screens it under the criteria above like any source.
- The seeds are added to the search string's concepts and synonyms. The full search of "The search design" and "The four searches" still runs, and no source is taken without screening.
- A seed that no index returns is named in the report with the searches made, and is not added to `refs.bib`.
- The research question is the one of `config.md`, which the plan run's `thesis_statement` insight informed.

## An expanded revision

The user may choose an expanded revision at the stop "The draft review does not pass" when the review names insufficient evidence as the root cause. The session then resumes the agent with the review as a second message.

- The agent reads the claims the review names as lacking support, and runs the search of "The search design" and "The four searches" for each, under the search's end of "The four searches". It screens the records under the criteria above.
- It adds the sources it includes to `review.md`, `refs.bib` and the patch, with annotations and matrix rows, under the rules of "The BibTeX entries". It removes none.
- The report lists, for each claim, the sources found for it and the searches made, and names a claim for which no source meets the criteria.
- The session then shows the sources at the stop "The sources' review" again.

## Revision mode

In revision mode the session starts the agent for the items that call for a new reference, when intake allowed new references.

- The agent is given `config.md`, the items, the `.bib` and its manifest.
- It runs the search of "The search design" and "The four searches" for each item's claim, under the search's end of "The four searches", and screens the records under the criteria above.
- It writes `review.md` and `refs.bib` for the new sources and the patch that adds their entries to the `.bib`, whose operations name the ids of the items they answer.
- An item that finds no source meeting the criteria is named in the report with the searches made.
