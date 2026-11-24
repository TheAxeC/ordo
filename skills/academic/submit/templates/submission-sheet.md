# Submission sheet template

The sheet agent fills the block below as `submission-sheet.md` in the run folder, as `agents/sheet_agent.md`, "The sheet", says. Text in `[brackets]` is replaced, and of a choice written `[a | b]` one is kept.

- The first row of each table is an example whose portal, files and values are made up, and it is not copied into the sheet.
- The cell "Asked by" names what asks for the row: a saved page of the form, such as `portal/03.html`, step 1, a saved page of the portal's instructions with its heading, the journal guide's "Required Components", a table of the funder config, or "Nothing read asks for it" for a row only the folder gives.
- The last cell of a row, "Source" or "What it rests on", holds the file and the place the value comes from, `Q<n>` for a row whose value is a question, or `Q<n>, added in the walk` for a row the session adds during the walk.
- A table or a section with no entry reads "None.".

```markdown
# Submission sheet

- Portal: [the URL]
- Folder: [the folder's path]
- The portal's form: [All of the portal's form was read from the saved pages. | Part of the portal's form was read from the saved pages, [the pages read], and the rest was not, because [the reason]. | None of the portal's form was read, because [it stands behind a sign-in | the page at the URL is one a script fills in the browser and holds no form | no page was saved, since `curl` failed on the page at the URL].] An approval of this sheet approves its rows, and no field of the form that was not read: in the walk each field of the form is matched to a row, and each field with no row is a question then.
- Instructions read: [each instruction by its saved file or its path, such as `portal/02.html`, "Instructions for authors", the journal guide's "Required Components" or the funder config, or "None: the questions below come only from what the folder lacks for the rows it gives."]
- Pages saved: [each address with its saved file, such as `portal/01.html`, or "None."]
- Pages not read: [each address on another host that looks like an instruction page, and each page `curl` failed on with its status, for the user to read, or "None."]
- Files read: [each file of the material read, with the kinds of value it held or "no value"]
- Files not read: [each file chosen whose text could not be read, or "None."]
- Left out of "Files": [each kind of build product, with the number of its files and one path, such as "LaTeX build files, 4, `manuscript/main.aux`", or "None."]

## Fields

| Field | Asked by | Value | Source |
|---|---|---|---|
| Title | The journal guide, "Required Components", Title page | A made-up title of a study | `main.tex`, `\title` |
| [the kind of value, or the field as the form or the instruction names it] | [the cell "Asked by", as above] | [the value, or empty] | [the last cell, as above] |

## Files

| File | Path | What it is | Asked by | Source |
|---|---|---|---|---|
| Main document | `build/main.pdf` | The manuscript as one PDF | `portal/02.html`, "File types": one PDF of at most 10 MB | The PDF's first page, the title of `main.tex` |
| [the file, as the form or the instruction names it, or by what it is] | [its path in the folder, a folder with its number of files, or empty] | [what the file is] | [the cell "Asked by", as above, with the requirement it states, such as a format, a length or a size] | [the last cell, as above: what shows what the file is] |

## Declarations

| Declaration | Asked by | Answer proposed | What it rests on |
|---|---|---|---|
| Data availability statement | The journal guide, "Required Components", Data availability statement | The data are available in a public repository | `main.tex`, section "Data availability": "The data are available in a public repository." |
| [the declaration, as the form or the instruction names it, or by what it states] | [the cell "Asked by", as above] | [the answer, empty, or "Left to the user"] | [the last cell, as above, a passage quoted with its file and place] |

## Questions

- Q1: [the row it concerns, by its table and its first cell, and what is asked]

## Objections

[each objection, as `agents/sheet_agent.md`, "The rules hold", says, or "None."]
```
