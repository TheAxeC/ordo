# Peer reviewer

The peer reviewer agent reads this page to run the draft review of full mode and, in revision mode, to turn the comments file into numbered items and to read each item's change again. It changes no manuscript file. It writes `review-<r>.md` in the run folder for a draft review, with `<r>` the draft review round, and `items.md` in revision mode.

## What the agent reads

- The draft: the main `.tex` and the files it inputs.
- `config.md`, `outline.md` and `arguments.md`.
- The outputs of `lookup.py cite-keys` and `lookup.py check-urls`, which the session runs and puts in the prompt. In draft review round 1 each failure line of the two outputs is an issue. In revision mode reading 1 is given the two outputs, run again after the patches.
- The draft writer's report with the draft metadata and, from the second draft review round on, the revision log and the apply reports of the patches.
- The previous `review-<r>.md`, from the second draft review round on.
- In revision mode, the comments file the call names.

A missing input is handled as follows:

| Missing | The agent does |
|---|---|
| The outline | Reverse-engineers the structure from the draft. The Argument Coherence score may be limited, and the review says so. |
| The output of `cite-keys` or `check-urls` | Names the missing output in the review, scans the citations for consistency itself and counts citation issues in the Writing Quality score. |
| The word count of the draft | Counts it itself. |

## The draft review

### The five dimensions

| Dimension | Weight | Criteria |
|---|---|---|
| Originality | 20% | A novel contribution, a unique perspective, an advance in the field. |
| Methodological Rigor | 25% | An appropriate method, a valid design, transparent limitations. |
| Evidence Sufficiency | 25% | Claims supported by data and citations, with no unsupported assertion. |
| Argument Coherence | 15% | Logical flow, clear transitions, thesis and conclusion in line. |
| Writing Quality | 15% | Clarity, conciseness, grammar, format compliance and readability. |

Each dimension is scored from 1 to 10:

| Score | Label | Meaning |
|---|---|---|
| 9 to 10 | Excellent | Top 10 percent of submissions; publishable as it is. |
| 7 to 8 | Good | Above average; minor improvements needed. |
| 5 to 6 | Acceptable | Average; needs revision but is salvageable. |
| 3 to 4 | Below average | Significant issues; major revision required. |
| 1 to 2 | Poor | Fundamental flaws; likely reject. |

The overall score is `Originality x 0.20 + Rigor x 0.25 + Evidence x 0.25 + Coherence x 0.15 + Writing x 0.15`.

### What each score means

Originality:

| Score | Description |
|---|---|
| 9 to 10 | A new theoretical framework or method; it fills a clear gap in the literature; it advances the field significantly. |
| 7 to 8 | A new application or extension of a framework; new empirical evidence; a unique perspective. |
| 5 to 6 | It replicates known conclusions in a new context; the contribution is limited but has value. |
| 3 to 4 | It largely repeats existing research; the claim of contribution is vague or exaggerated. |
| 1 to 2 | It restates existing knowledge; the claim of contribution does not hold. |

- The cues:
  - The literature review identifies a gap and the paper fills it.
  - The contribution statement of the introduction is specific and verifiable.
  - The discussion engages with prior research and does not only list it.

Methodological Rigor:

| Score | Description |
|---|---|
| 9 to 10 | A rigorous, reproducible design; limitations clearly discussed; validity and reliability explained. |
| 7 to 8 | An appropriate, clearly described method; minor flaws that do not affect the conclusions; limitations mentioned. |
| 5 to 6 | A sound method with too little detail; some choices lack justification. |
| 3 to 4 | The method does not match the research question; significant design flaws; limitations not discussed. |
| 1 to 2 | A fundamentally flawed method that cannot support any conclusion. |

- The cues:
  - The design addresses the research question.
  - The sample or data source is appropriate.
  - The analysis methods are applied correctly.
  - The method section is detailed enough to replicate.

Evidence Sufficiency:

| Score | Description |
|---|---|
| 9 to 10 | Every claim has sufficient evidence from several reliable sources, with no logical leap. |
| 7 to 8 | Most claims are supported; a few have slightly weak evidence, and none is fatal. |
| 5 to 6 | The core claims have evidence, but some secondary claims lack support; citation density is uneven. |
| 3 to 4 | Several important claims lack evidence; the paper relies on a single source; the data are insufficient. |
| 1 to 2 | Numerous unsupported assertions; evidence that does not match the claims; serious selection bias. |

- The cues:
  - Every factual claim has a citation.
  - The cited sources are of high quality.
  - The evidence is not cherry-picked.
  - The inferences of the discussion do not exceed what the data support.

Argument Coherence:

| Score | Description |
|---|---|
| 9 to 10 | The argument flows without a break; each paragraph connects; thesis, evidence and conclusion align. |
| 7 to 8 | The logic is clear overall; a few transitions could improve; the conclusion matches the introduction. |
| 5 to 6 | The basic logic holds with some breaks between paragraphs; some transitions feel forced. |
| 3 to 4 | Several logical gaps; the connection between sections is unclear; the conclusion is disconnected from the text before it. |
| 1 to 2 | The main argument cannot be discerned; the sections feel patched together; the text contradicts itself. |

- The cues:
  - After the introduction the reader can predict the paper's course.
  - Each section's end leads to the next.
  - The conclusion answers the question of the introduction.
  - No passage contradicts another.

Writing Quality:

| Score | Description |
|---|---|
| 9 to 10 | Precise, fluent language; faultless format; no grammar errors; highly readable. |
| 7 to 8 | Clear language; minor errors that do not affect understanding; neat format. |
| 5 to 6 | Readable, with several grammar or word-choice issues; some paragraphs too long. |
| 3 to 4 | Several grammar errors; imprecise word choice; inconsistent format. |
| 1 to 2 | Difficult to understand; numerous errors; a colloquial tone that fails academic standards. |

- The cues:
  - The register is consistent.
  - The paragraphs follow the order of `references/draft-writer.md`.
  - No repetition is unnecessary.
  - The citation form is consistent.

Adjustments by paper type:

- Theoretical: Methodological Rigor judges the rigor of the reasoning and not the experimental design.
- Case Study: Evidence Sufficiency accepts the in-depth analysis of a single case in place of a large sample.
- Policy Brief: Originality judges the policy innovation, and Writing Quality judges readability for decision-makers.
- Conference Paper: the standard of every dimension is lowered by 1 point, because of the length limit.

### The verdict

| Overall score | Verdict | What happens |
|---|---|---|
| 8.0 to 10.0 | Accept | The run goes on. |
| 6.5 to 7.9 | Minor Revision | The draft goes back to the draft writer, and the second draft review round reads it again. |
| 4.0 to 6.4 | Major Revision | The draft goes back to the draft writer, and the second draft review round reads it again. A second return follows only as "The second draft review round" says. |
| 1.0 to 3.9 | Reject | The run stops for the user at the stop "The draft review does not pass". |

- The table gives the verdict of draft review round 1. A verdict Reject in either draft review round is the stop.
- After draft review round 2 the rule of "The second draft review round" decides, whatever verdict the table gives the score.

### The process

1. **First read.** The agent reads the whole paper once without marking. It records its impression in 2 or 3 sentences, with a score from 1 to 10: whether the argument is clear and the contribution evident.
2. **Section review.** For each section the agent:
   - compares the section with its purpose in the outline.
   - checks the evidence density, looking for factual claims without citations.
   - checks that the claim-evidence-reasoning chain of the argument blueprint is complete.
   - checks the transitions to the sections before and after.
   - records at least one strength and the issues, each with a severity and a suggested fix.
   - records line-level comments, each with its location.
3. **Cross-section checks.** The agent records pass or fail with a note for each of these:
   - the title matches the content.
   - the abstract reflects the results of the paper.
   - the research question of the introduction is answered by the conclusion.
   - every table and figure is referred to in the text.
   - the citation form is consistent.
   - every cited key has an entry in the `.bib`, as the output of `lookup.py cite-keys` shows. A `missing:` line is an issue, and an `unused:` line is an issue marked "needs the user".
   - every cited entry's identifier resolves, as the output of `lookup.py check-urls` shows. A status outside the 2xx range, `failed, <reason>`, `no identifier`, `no entry in <file>`, `DOI_MISMATCH` and `doi not found in Crossref, OpenAlex or Semantic Scholar` are each an issue. A `title not checked` line is an issue marked "needs the user".
   - the word count is within the target.
   - the closing checks of the skill's full mode, which are the pre-output checklist and the six statements.
4. **Scoring.** The agent scores each dimension and records the passages that show the score. A score must agree with its evidence.
5. **Verdict.** The agent computes the overall score and maps it to the verdict. When the impression score of the first read and the overall score differ by more than 2 points, the agent checks once more for a missed major issue or for too heavy a penalty, and keeps the score it then holds.
6. **Instructions.** The agent writes the revision instructions for the verdict:
   - for Minor Revision, 3 to 5 specific items to address.
   - for Major Revision, all issues in order of Critical, Major, then Minor, which sections need rewriting and which editing, and what new content is needed.

### The issues

| Severity | Meaning | Handling |
|---|---|---|
| Critical | Blocks publication; the paper cannot be published without the fix. A fundamentally flawed method, a main conclusion the evidence does not support, a serious suspicion of plagiarism. | All must be resolved in draft review round 1. |
| Major | Lowers the quality significantly without making the paper unpublishable. A section with too little argument, a missing important counter-argument, unclear data presentation. | Should be resolved in draft review round 1 and must be resolved by draft review round 2. |
| Minor | Does not affect the conclusions but affects reading. An awkward transition, a paragraph that is too long, a few citation errors. | Resolve as many as possible in draft review rounds 1 and 2. |
| Suggestion | Not an issue, but could be better. A sub-analysis, a chart, a reorganized paragraph. | Considered if there is capacity. |

- Each issue has the number `D<r>-<m>`, with `<r>` the draft review round and `<m>` its place in the report, Critical first.
- Each issue has its section down to the section number, the passage that shows it, a suggested fix and an estimated effort.
- The effort is Quick fix (under 10 minutes), Moderate (10 to 30 minutes), Significant (30 to 60 minutes) or Major rework (over 60 minutes).
- A suggested fix is specific. "Improve the writing" is not one, and the agent names the paragraphs, the problem and the approach.
- An issue that only the user can resolve, such as a `[GAP: ...]` placeholder or an `unused:` entry of the `.bib`, is marked "needs the user" and is not sent back to the draft writer. It goes to the final message.
- An empty section or one that holds only a placeholder is a Critical issue, and the score rests on the completed parts.
- A word count more than 30 percent off the target is a Critical issue listed first.
- A register that is extremely inconsistent is penalized in Writing Quality, and the review acknowledges the strengths of the content.
- The strengths are at least 3, each citing a specific passage. A generic praise is not a strength.

### The file

`review-<r>.md` has this form:

```
## Peer review report

### Summary
| Metric | Value |
|---|---|
| Title | <title> |
| Draft review round | <1 or 2> |
| Verdict | <Accept, Minor Revision, Major Revision or Reject> |
| Overall score | <N>/10 |

### Initial impression
<2 or 3 sentences, and the score.>

### Dimension scores
| Dimension | Weight | Score | Weighted | Key evidence |
|---|---|---|---|---|

### Strengths
1. <strength, citing a passage>

### Issues
#### Critical
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| D1-1 | | | | | |

#### Major, Minor and Suggestions
<The same table for each.>

### Cross-section checks
| Check | Status | Notes |
|---|---|---|

### Revision instructions
<Specific instructions for the draft writer.>

### Reviewer confidence
<High, Medium or Low, with a short justification.>
```

- The agent states each issue and the verdict directly and does not pad them with repeated qualifiers or apologetic framing. It keeps every material uncertainty and limit.

### The second draft review round

The second draft review round re-reads the revised sections and what the first draft review round flagged.

- The agent checks each item the revision log calls resolved and confirms that it is resolved and not only changed on the surface.
- The agent checks whether the revisions introduced new problems, and numbers them `D2-<m>`.
- It re-scores only the dimensions that changed, and updates the overall score and the verdict.
- A verdict Reject in either draft review round stops the run at the stop "The draft review does not pass".
- After draft review round 2, a Critical issue left unresolved stops the run at the same stop, whatever the score.
- Otherwise an overall score of 6.5 or more goes on, and the issues that remain go to the final message as acknowledged limitations.
- Otherwise a lower score sends the Major and Minor issues of `review-2.md` back to the draft writer once more, with the ids `D2-<m>`. The run then goes on without a third draft review round, and the issues still open go to the final message as acknowledged limitations.
- The agent adds the likely root cause to the report at that stop:
  - a structural problem, for which the outline needs rework.
  - insufficient evidence, for which the literature or the data need supplementing.
  - a writing problem, for which the sections need rewriting.
  - an originality problem, for which the contribution needs repositioning.
- The draft goes back to the draft writer at most twice in all: once after draft review round 1 and once after draft review round 2.

## Revision mode

### The items

The agent reads the comments file the call names, and `items.md` holds each comment as an item.

- A referee comments file gives items `R<n>-<m>`, with `<n>` the number of the reviewer as the file gives it and `<m>` the number of the comment in that reviewer's section.
- A comment that holds separate requests gets a letter, such as `R2-1a` and `R2-1b`.
- A `/writing` report gives items `W<k>`, with `<k>` the number the report gives the finding.
- Each item holds the comment quoted as the file gives it, what it asks, the section of the manuscript it concerns, a severity and a suggested fix.
- The agent does not decide whether to accept or decline an item. It numbers and locates each one, and the draft writer states in its report each item it left unchanged and why.

### The reading of the changes

After the patches of the draft writer and the two scripts, the agent reads each item's change again.

- For each item, it reads the patched text and the apply reports, and records the item resolved, partly resolved or not resolved.
- It records a problem a change introduced as a new item of the same reviewer, the next number of that reviewer's items.
- The agent writes each reading as a section "Reading 1" or "Reading 2" of `items.md`.
- The items not resolved after reading 1 go back to the draft writer once.
- The items not resolved after reading 2 go to the final message as acknowledged limitations.
- A reading is not a draft review: it gives no score and no verdict.
