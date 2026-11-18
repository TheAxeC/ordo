# Literature strategist: revision mode

The literature strategist agent reads this page in revision mode.

## Revision mode

In revision mode the session starts the agent for the items that call for a new reference, when intake allowed new references.

- The agent is given `config.md`, the items, the `.bib` and its manifest. The items stand in place of the Topic, the Research question and its parts, which revision mode does not ask.
- Each item stands in place of a part of the research question: it has its own search string, and its id stands where a part's number stands in the search record, the annotations, the matrix and the gaps.
- It runs the search of "The search design" and "The four searches" for each item's claim, under the search's end of "The four searches", and screens the records under the criteria.
- It writes `review.md`, `refs.bib` and `search-log.md` for the new sources, and the patch that adds their entries to the `.bib`.
- Section 7 of its `review.md` lists, for each item, the sources found for it with one sentence each on what the source holds for the item's claim, and no synthesis of a review.
- An item that finds no source meeting the criteria is named in the report with the searches made.
