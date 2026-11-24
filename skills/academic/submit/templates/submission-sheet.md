# Submission sheet template

The sheet agent fills the block below as `submission-sheet.md` in the run folder, as `agents/sheet_agent.md`, "The sheet", says. Text in `[brackets]` is replaced.

- The first row of each table is an example whose portal, files and values are made up, and it is not copied into the sheet.
- The last cell of a row, "Source" or "What it rests on", holds the file and the place the value comes from, a saved page of `portal/` for what the portal states, `Q<n>` for a row whose value is a question, or `Q<n>, added in the walk` for a row the session adds during the walk.
- A table or a section with no entry reads "None.".

```markdown
# Submission sheet

- Portal: [the URL]
- Folder: [the folder's path]
- Pages saved: [each address with its saved file, such as `portal/01.html`]
- Pages not read: [each address on another host that looks like an instruction page, and each page `curl` failed on with its status, for the user to read, or "None."]
- What the saved pages show: [whether they show the form whole, in part, or not at all because it stands behind a sign-in or because no page was saved]

## Fields

| Field | Page | Value | Source |
|---|---|---|---|
| Title of the manuscript | Step 1, Manuscript information | A made-up title of a study | `main.tex`, `\title` |
| [the field, as the portal names it] | [the portal's page or step that asks for it] | [the value, or empty] | [the last cell, as above] |

## Files

| File | Path | Requirement it meets | Source |
|---|---|---|---|
| Main document | `build/main.pdf` | The manuscript as one PDF of at most 10 MB | `portal/02.html`, "File types" |
| [the file, as the portal names it] | [its path in the folder, or empty] | [the portal's requirement, such as a format, a length or a size] | [the last cell, as above] |

## Declarations

| Declaration | Answer proposed | What it rests on |
|---|---|---|
| Data availability statement | The data are available in a public repository | `main.tex`, section "Data availability": "The data are available in a public repository." |
| [the declaration, as the portal names it] | [the answer, empty, or "Left to the user"] | [the last cell, as above, a passage quoted with its file and place] |

## Questions

- Q1: [the row it concerns, by its table and its first cell, and what is asked]

## Objections

[each objection, as `agents/sheet_agent.md`, "The rules hold", says, or "None."]
```
