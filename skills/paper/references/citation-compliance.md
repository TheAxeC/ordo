# Citation compliance

The citation compliance agent reads this page to check the citations of the manuscript against its `.bib`, and to correct what is wrong. It writes `citation-report.md` in the run folder and the patches that carry its corrections, as `references/patch-file.md` gives. It changes no other file.

## What the agent reads

- `config.md`: Citation style, Authors, Discipline and Paper type.
- The main `.tex` and the files it inputs, and the `.bib`.
- `review.md` and `refs.bib` of the literature strategist, when they exist. Each source in them is the ground truth for its citation information. Where an entry of the `.bib` differs from it, the agent corrects the entry to match.
- The output of `lookup.py cite-keys` and of `lookup.py check-urls`, which the session runs and puts in the prompt.
- The path of the temporary folder for fetched texts, which the session gives. The agent runs `lookup.py resolve`, `search`, `fetch` and `quote-check`.

A missing input is handled as follows:

| Missing | The agent does |
|---|---|
| The citation style | Reads it from the `\bibliographystyle` line of the main file. |
| The `.bib` entries of cited keys | Handles them as missing keys, under "Both ways". |
| A DOI that cannot be found | Marks the entry "DOI not available" and does not block the run. |
| The title or journal of an entry | Flags the entry as incomplete and lists the missing fields. |

## Both ways

The output of `lookup.py cite-keys` is the cross-check, and it is read as follows:

- A line `missing: <key>` is a key the `.tex` cites that the `.bib` lacks.
- A line `unused: <key>` is an entry that no `\cite` uses.
- No output means every cited key has an entry and every entry is cited.

The agent handles each line:

- A missing key that is a typing slip of an existing key, with the same author and year, is corrected in the `.tex` by a patch.
- Any other missing key is an unresolved issue. The report marks it "unconfirmed", and the session raises the stop "A reference that cannot be confirmed" for it.
- More than 5 missing keys point to sources the draft writer took from outside the literature report, and the report says so.
- An unused entry is listed in the report and is not removed.

For each citation whose sentence names the author or gives a year, the agent compares the name and the year with the entry:

- The author named in the sentence is the entry's first author, spelled as in the entry.
- A year stated in the sentence is the entry's year.
- "et al." is used only for an entry with 3 or more authors.
- A mismatch is an issue, and it is corrected by a patch when the entry is right.

## The `.bib` entries

The agent checks each cited entry. A deterministic error is corrected by a patch, and an ambiguous one is flagged for review. An uncertain item is never resolved silently.

| Error | Correction |
|---|---|
| A `url` field that holds `dx.doi.org` | Change it to `https://doi.org/<doi>`. |
| A `doi` field that holds a URL prefix or `doi:` | Reduce it to the bare DOI. |
| A period after a DOI or a URL | Remove it. |
| A missing DOI for a source that has one | Add it when `lookup.py resolve '<title>' --year <year>` prints a record whose title, first author and year agree with the entry. Otherwise mark it "DOI not available". |
| An incomplete entry | Flag it, and list the missing fields. |

- The agent compares the `\bibliographystyle` line with the Citation style row. A mismatch is reported and never changed, since the style file belongs to the venue.
- The way a style renders author lists, "&" or "and", the order of the reference list and the capitalization of titles belongs to the bibliography style. The agent does not check or change it.
- A quotation in the text with a `\cite` that carries no page is flagged for the user to supply the page: `\cite[p.~45]{key}` is the form.
- A secondary citation, written "<Original> (as cited in~\cite{citing})", is flagged when the original is not in the `.bib`, and the agent asks whether it is secondary.

## DOI and URL

The output of `lookup.py check-urls` has one line per cited key. The agent reads it as follows:

- A line that holds "title not checked: <index> left out" is about the call or the network. The agent passes it to the user unchanged in its report, whatever the status part of the line says, and writes no issue `C<m>` and no correction for it.
- The rules below read only a line without that text.
- A line with a status that is not in the 2xx range, or "failed, <reason>", is a link that does not work. The agent looks the source up with `lookup.py resolve` and corrects the identifier when the record is certain, otherwise flags the entry.
- A line "no identifier" is a source with no DOI, eprint or url. The agent flags it and does not block the run, since older literature often has none.
- A line "no entry in <file>" repeats a missing key of the cross-check.
- A line that ends in `DOI_MISMATCH` means the entry's title and the title the DOI resolves to are too different. The agent looks the title up with `lookup.py resolve`. It corrects the DOI when a record's title, first author and year agree with the entry, and otherwise flags the entry as unconfirmed.
- A line that ends in "doi not found in Crossref, OpenAlex or Semantic Scholar" is flagged for review.
- A DOI that is complete is present for every source that has one.
- A retrieval date is kept only for content that may change.

## The checks of the whole reference list

The agent computes these over the cited keys:

- **Self-citation ratio.** Self-citations divided by all citations, times 100. A cited entry is a self-citation when one of its authors is an author in the Authors row. A ratio above 15 percent is flagged, with a suggestion to replace some self-citations.
- **Currency.** A source older than 10 years is flagged unless it is seminal or foundational. The report gives the percentage of sources from the last 5 years.
- **Citation density.** A paragraph with no citation is flagged unless it describes the method or is original analysis. A sentence with more than 5 citations is flagged as over-citation.
- **Retractions.** The choice of a replacement for a retracted source has no single right answer, so the agent writes no patch for it. It flags the source as an issue `C<m>` marked "needs the user", with the retraction as the record shows it and up to 3 candidate replacements from `lookup.py search`, each with its record line. The session lists the issue in the final message.
- A source cited to discuss the retraction itself is flagged with the suggested note "[Retracted]" after it. A source where only other results were retracted is flagged with the suggested note "[Partial retraction; cited results unaffected]". The agent changes neither by a patch.
- A source with an expression of concern is flagged for review, with a recommendation to find corroborating evidence from independent sources.

The lookups show a retraction only when the record of an index says so in its title or its text. The report states that the retraction check covers what the records show, and it names every source whose record shows a retraction or an expression of concern.

Adjustments by paper type:

- Theoretical: sources older than 10 years may reach 40 percent.
- Case Study: grey literature with a non-standard citation form is tolerated.
- Policy Brief: government reports without a DOI are tolerated, and the validity of the URL matters more.

The self-plagiarism check belongs to `references/integrity-verification.md`.

## An unsupported claim

- A claim is judged only on text read in this run. A source of which only the abstract was read supports only what the abstract says.
- The agent compares each cited sentence with the annotation of its source in the literature report. When the annotation holds the claim, no fetch is needed.
- A cited sentence whose annotation does not hold the claim is checked against the source's full text.
- In citation-check mode no `review.md` is given, and every cited sentence of the manuscript is checked so.
- For each, the agent fetches the source with `lookup.py fetch '<DOI or arXiv ID>' '<temporary folder>' '<key>'` and reads the passage as `references/integrity-verification.md` "Reading the source" says.
- It copies the passage into `citation-report.md` as a passage line, in the form that section gives, and runs `lookup.py quote-check '<citation-report.md>' '<the .bib>' '<temporary folder>'` before it reports.
- A minor drift in paraphrase gets suggested wording in the report and no patch.
- A claim that cites a source that does not hold it, where another source does hold it, is flagged for review as a possible attribution error.
- A claim that the passage does not hold is marked Critical, stops the check, and the session raises the stop "A claim the run cannot support" for it.
- A source the agent cannot read goes to the same stop, as the table "When the source cannot be read" of `references/integrity-verification.md` says, and the agent judges nothing from the annotation alone.
- The claim audit of the whole manuscript against passages belongs to `references/integrity-verification.md`.

## The corrections

- A correction that has one right answer is written as a patch: a typing slip in a key, a `dx.doi.org` URL, a DOI prefix, a period after a DOI, a name or year in the sentence that the entry corrects.
- Each operation names its issues `C<m>` in `roadmap_item_ids`.
- An ambiguous case is flagged and is never changed.
- A retracted source has no single right replacement, so it is flagged as "needs the user" and no patch changes it.
- A line of `check-urls` that holds "title not checked" gets no correction.
- Every correction is logged in the report, with its location, the error, the correction and the rule it follows.

## The file

`citation-report.md` has this form:

```
## Citation report

### Summary
| Metric | Count |
|---|---|
| Cited keys | <N> |
| Entries in the .bib | <N> |
| Missing keys | <N> |
| Unused entries | <N> |
| Format errors corrected | <N> |
| Format errors flagged for review | <N> |
| Missing DOIs | <N> |
| Self-citation ratio | <N> percent |
| Sources from the last 5 years | <N> percent |

### Corrections made
| # | Location | Error | Correction |
|---|---|---|---|
| C1 | refs.bib, smith2024 | url holds dx.doi.org | Changed to https://doi.org/<doi> |

### Items flagged for review
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C2 | refs.bib, jones2008 | Source from 2008, not clearly seminal | Verify the need or find a newer source |

### Passage lines
> [@smith2024, p. 14, table 2]: "the passage as the text gives it"
```

- Each issue has the number `C<m>` in the order the report lists it, across both tables.
- The report ends with the lines of `check-urls` that it passes on unchanged, if there are any.
- A flagged item that needs a decision only the user can make, such as a retracted source, is marked "needs the user" in its suggested action.
- The report holds the passage lines of "An unsupported claim" under the heading "Passage lines".
- The report names the patch, by the number the session gave it, that carries each correction.
