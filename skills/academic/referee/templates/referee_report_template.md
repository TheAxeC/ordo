# Referee report template

The referee fills this template as `referee-report.md`. Text in `[brackets]` is replaced. Each `##` heading is one field of the journal's form, so the user pastes each field from its heading. Every rule of this template holds whatever the reasons, as "The rules hold" of the referee's page says.

The first block is the form of a first round. The second block is the form "Comments to the author" takes in a second round. The headings below are the default fields. When `intake.md` names the journal's fields, one `##` heading per named field replaces them, in the journal's order, and the content below goes under the field that takes it.

```markdown
# Referee report

## Recommendation

[One value: accept, minor revision, major revision or reject, or one of the journal's values]

## Comments to the author

### General comments

[A summary of the paper in two to four sentences: what it claims and on what evidence. Then the overall assessment, in two or three sentences.]

### Major points

[The major points, or "None."]

1. [The point, tied to its passage: section, page, line, table or figure, or a short quotation. What is wrong, which main claim fails or has no evidence, and what would settle it. One paragraph of at most five sentences.]

### Minor points

[The minor points, or "None."]

1. [The point, tied to its passage, in one or two sentences.]

## Confidential comments to the editor

[What the referee tells the editor and not the authors: how sure the recommendation is and what it rests on. At most four sentences.]
```

In a second round, "Recommendation" and "Confidential comments to the editor" stand as above. "Comments to the author" takes this form:

```markdown
## Comments to the author

### General comments

[What the revision changed. One sentence that names the first-round points it resolved. One or two sentences on whether the revision answers the first round. No first-round point left out because the authors did not answer it.]

### Major points

[Any new point first, then the remaining first-round points, in the order of `selected-points.md`, or "None."]

1. [New in the revision: the point, tied to its passage. What the revision added or changed, which main claim fails or has no evidence under it, and what would settle it. One paragraph of at most five sentences.]
2. [First-round point [its first-round number]: the point, tied to its passage, what is still missing, and what would settle it. One paragraph of at most five sentences.]

### Minor points

[The remaining first-round points, or "None."]

1. [First-round point [its first-round number]: the point, tied to its passage, and what is still missing, in one or two sentences.]
```
