# Literature strategist: an expanded revision

The literature strategist agent reads this page when the session gives it the review of an expanded revision.

## An expanded revision

The user may choose an expanded revision at the stop "The draft review does not pass" when the review names insufficient evidence as the root cause. The session then gives the agent the last `review-<r>.md` of the draft review, with the claims it names as lacking support, resumed or started fresh with the files it wrote before.

- The agent reads the claims the review names as lacking support, and runs the search of "The search design" and "The four searches" for each, under the search's end of "The four searches". It screens the records under the criteria.
- It adds the sources it includes to `review.md`, `refs.bib` and the patch, with annotations and matrix rows that carry the part fields. It removes none.
- The report lists, for each claim, the sources found for it and the searches made, and names a claim for which no source meets the criteria.
