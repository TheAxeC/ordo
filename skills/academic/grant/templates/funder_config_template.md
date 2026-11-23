# Funder config: <funder>, <programme>, <call year>

The format of a funder config. The config drafter copies this page, fills it from the call documents and removes this paragraph, the notes in angle brackets and the last section, "The file of form-field texts", which is no part of a funder config. The headings, their order and the columns of the tables are fixed, since `templates/check_sections.py` and `templates/check_limits.py` read the tables "Sections" and "Form fields". A fact the call documents do not state is written "not stated in the documents given", and a Limit they do not state is left empty. The file is saved as `<funder>-<programme>-<call year>.md`, in lower case with hyphens, in `grant-config/` in the application's folder.

## Call

- Funder: <the funder's name>
- Programme: <the programme, as the funder names it>
- Call year: <the year of the call>
- Documents read:
  - <the document's name, the version or year it carries, and its number of pages>

## Sections

<One row per section of the application's text, in the order the funder requires them. Heading is the section's title as the funder words it. Required is `yes` or `no`. Limit is a whole number, or empty when the funder states none. Unit is `pages`, `words` or `characters`, and empty when Limit is empty. The row `(whole document)` holds the limit of the whole application text. Source names the call document and the page the fact stands on.>

| Heading | Required | Limit | Unit | Source |
|---|---|---|---|---|
| (whole document) | yes | <number> | <unit> | <document, p. n> |
| <heading> | <yes or no> | <number, or empty> | <unit, or empty> | <document, p. n> |

## Form fields

<One row per field of the funder's form that is not part of the application's text, such as a title or an abstract. Field is the field's name as the funder's form words it. With no such field stated, the table keeps its two header lines and the line "not stated in the documents given" follows it.>

| Field | Limit | Unit | Source |
|---|---|---|---|
| <the field's name> | <number, or empty> | <unit, or empty> | <document, p. n> |

## Layout

- Font: <the font, with its source>
- Font size: <the size, with its source>
- Line spacing: <the spacing, with its source>
- Margins: <the margins, with their source>

## Criteria

- Scale: <the lowest and the highest score, and the step between scores, with its source>
- Labels: <the labels as the document prints them, with the scores each covers only where the document prints that, with its source>

<One row per criterion, in the funder's order and under the funder's number. Descriptors holds what the funder asks the panel to assess, then the descriptor of each level, in the funder's words.>

| Criterion | Descriptors | Source |
|---|---|---|
| <number and name> | <what is assessed, then the descriptor of each level> | <document, p. n> |

## The file of form-field texts

The texts of the form's fields stand in the file of form-field texts, `grant-fields.md`, in the application's folder beside the main `.tex`. `templates/check_limits.py` counts each text against the Limit of its row in "Form fields". The format of that file:

- A line `## <Field>` opens a form field. `<Field>` is the Field cell of the field's row, taken after the two characters `## ` with the spaces at both ends taken off.
- A heading matches a Field letter for letter, case included, since a form's field names can differ in case alone.
- The field's text is every line after that heading up to the next line that starts with `## `, or the end of the file, with the empty lines at both ends taken off.
- A line before the first `## ` line belongs to no field.
- A `### ` line, a fence and every other line inside a field are text of the field.
- A `## ` heading that is no Field of the config gives no line of `templates/check_limits.py`.
- The same `## ` heading twice is an error of `templates/check_limits.py`.

A made-up example, for a config whose form fields are Title and Summary:

```markdown
## Title

Sediment transport in braided rivers

## Summary

Braided rivers move most of their sediment during a few floods a year.
This project measures that transport at three sites.
```
