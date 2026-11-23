# Selection template

This template holds the forms of two files. Text in `[brackets]` is replaced. Every rule of this template holds whatever the reasons, as "The rules hold" of the page of the agent that fills it says.

- The lines Status, "First-round point", "Still missing" and "What the revision added or changed" stand only in a second round.
- The section "First-round points resolved" stands only in a second round.
- A heading with no entry under it reads "None.".

## The selection

The referee fills this block as `selection.md` at the selection. Every major point stands in full, and every minor point in one line.

```markdown
# Selection

## Points found

- Major points the paper has: [n]
- Minor points the paper has: [n]

## Major points

#### M1: [the point, as a phrase]

- Passage: [section, page, line, table or figure, or a short quotation]
- The weakness: [one or two sentences]
- Why it is major: [the main claim, and which of the two holds: it fails on the evidence given, or it has no evidence]
- Status: [a first-round point not resolved, a first-round point resolved in part, or a new point of the revision]
- First-round point: [a remaining first-round point only: its first-round number and title]
- Still missing: [a remaining first-round point only: what the first-round point asked that the revision does not give]
- What the revision added or changed: [a new point only: the material of the revision the defect stands in]
- Comments merged into this point:
  - [report], [comment number]: [the comment, in a phrase]

## Minor points

- m1: [the point, as a phrase]. Comments: [report], [comment number]; [report], [comment number].

## Left-out comments

| # | Report | Comment | Why it was left out |
|---|---|---|---|
| 1 | [report], [comment number] | [the comment, in a phrase] | [one clause] |

## First-round points resolved

| # | First-round point | How the revision resolved it |
|---|---|---|
| 1 | [its first-round number and title] | [one clause] |

## Objections

[Each objection to a rule: the rule, the point or sentence it concerns and the result the referee would have chosen.]

## Count

Comments in the reports: [n]. With a point: [n]. Left out: [n]. Resolved first-round points: [n].
```

In a second round the count line counts the entries of `revision-check.md` in place of the comments in the reports.

## The selected points

The session writes this block as `selected-points.md`, with each point as it stands in `selection.md`. The referee writes each minor point of it in full, in the form below, and carries out the section "Changes to write" when the file has one.

```markdown
# Selected points

## Major points

#### M1: [a major point, in the form of the first block]

## Minor points

#### m1: [the point, as a phrase]

- Passage: [section, page, line, table or figure, or a short quotation]
- The weakness: [one sentence]
- Status: [as in the first block]
- First-round point: [as in the first block]
- Still missing: [as in the first block]
- Comments merged into this point:
  - [report], [comment number]: [the comment, in a phrase]

## First-round points resolved

| # | First-round point | How the revision resolved it |
|---|---|---|
| 1 | [its first-round number and title] | [one clause] |

## Changes to write

- [One change the user made, in the session's words: a comment to write as a point with its grade, a comment to join to a point, a point to regrade, or a first-round point to move into or out of the resolved list.]

## Objections

[Each objection to a rule written after the selection.]
```
