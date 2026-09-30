# Step 3, the cases ruling (round 0)

The builder's first run found that item 6 of the brief names two places that are not alphabetical, while the block is sorted without regard to case (`grep -o '^- \*\*[^*]*\*\*' skills/repo-setup/templates/plan-terms.md` lists **plan-terms block** at 59, **position line** at 60, **verify list** at 104 and **wip** at 105).

Ruling: the entries go at their alphabetical places, as item 6's first sentence says.

- **point, of a sessions report** goes between **plan-terms block** and **position line**.
- **window, of the transcripts** goes between **verify list** and **wip**.
- The other five places stand as item 6 gives them.
- The report quotes the headword list of the block after the change, run through `LC_ALL=C sort -f -c`, which prints nothing and exits 0.

Everything else in the brief stands. Go on with items 1 to 6 and the cases.
