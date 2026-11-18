# Literature strategist: starting from the manuscript's `.bib`

The literature strategist agent reads this page when the call gives it a `.bib`.

## Starting from the manuscript's `.bib`

When the call gives a `.bib`, the searching starts there. In full mode that is the manuscript's `refs.bib` when one stands, and otherwise the `.bib` the Materials in hand row names. An earlier lit-review run's `refs.bib` that intake took for outline-only mode is screened the same way.

- Every entry is screened under the criteria, as an external result is, and no entry is pre-approved.
- An entry with an `abstract` field is screened from that field at the stage "Title and abstract", and is not read for that stage. An entry that stage kept as Include or Maybe without a reading is read before the stage "Full-text assessment", as "Reading a candidate" says.
- A missing field narrows the screening and does not skip the entry.
- An entry is skipped only when the criteria cannot be applied at all. Every skipped entry is listed in `review.md` with its reason.
- The entries of the `.bib` are never changed or removed. The new entries are only added.
- No annotation and no matrix column says whether a source came from the `.bib` or from a search.
- The report opens its search strategy with a block of this form:

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
- The agent derives the uncovered topics: the parts of the research question, by number, and the subtopics within them that the included entries do not cover.
- With uncovered topics, the external search runs on those topics only.
- Without uncovered topics, the external search runs unrestricted and checks for newer work and duplicates.
- When the user asked in the Notes to use the `.bib` only, no external search runs.
- With no uncovered topics, the report then says "external search omitted on user request".
- With uncovered topics, the report then lists them as a known coverage gap.
- The uncovered topics and the zero-included note carry into the gaps as stated coverage limits.
- The included entries of the `.bib` and the included external sources together are the final set.

## The entries against the `.bib`

- The rules apply in this order to each included source.
  - A source whose DOI or whose arXiv ID is already in the `.bib`, either one, gets no new entry and is marked "already in the .bib" in the annotation. A `.bib` that holds the `@misc` entry of an arXiv ID (its `eprint`, an `arxiv.org/abs/` address in its `url`, or a DOI `10.48550/arXiv.<id>`) so holds the work whose published version the agent now finds.
  - Any other source whose key equals an existing key gets the key with the first unused letter appended: `a`, then `b`.
- `refs.bib` holds the new entries only.
- A start given the `.bib` with its block manifest writes the patch that adds the new entries, as `references/patch-file.md` gives. The patch inserts them after the `.bib`'s last block, and its operations name the id `lit-review` in `roadmap_item_ids` in lit-review mode, the id `full` in full mode, and the ids of the items they answer in revision mode.
