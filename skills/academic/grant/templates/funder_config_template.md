# Funder config: <funder>, <programme>, <call year>

The format of a funder config. The config drafter copies this page, fills it from the call documents and removes this paragraph and the notes in angle brackets. The headings, their order and the columns of the tables are fixed, since `templates/check_sections.py` and `templates/check_limits.py` read the tables "Sections" and "Form fields". A fact the call documents do not state is written "not stated in the documents given", and a Limit they do not state is left empty. The file is saved as `<funder>-<programme>-<call year>.md`, in lower case with hyphens, in `grant-config/` in the application's folder.

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

<One row per field of the funder's form that is not part of the application's text, such as a title or an abstract. Field is the key of the field's marker in the application's `form-fields.md`, such as `title_en`, since `templates/check_limits.py` looks for the marker `<!--F:<Field>-->` letter for letter. Source starts with the field's name as the form words it. With no such field stated, the table keeps its two header lines and the line "not stated in the documents given" follows it.>

| Field | Limit | Unit | Source |
|---|---|---|---|
| <marker key> | <number, or empty> | <unit, or empty> | <the form's name of the field; document, p. n> |

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
