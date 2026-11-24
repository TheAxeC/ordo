Final report. The run ended on the stop "The page of the final submit". The tab with the Zenodo draft is left open, and "Publish" was not pressed.

Invocation: I invoked `/submit` through the Skill tool (`skill: submit`) with the URL and the folder. The Skill tool did not refuse the call.

The sheet: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/deposit/submit-runs/2026-11-24/submission-sheet.md, 56 lines (`wc -l`). The sheet agent wrote 49 lines, and the answers to Q1 to Q5 and the three rows added in the walk make up the rest.
- The form: its first lines say none of the portal's form was read, because `/uploads/new` redirects (302) to the sign-in page. Both pages are saved, as `portal/01.html` and `portal/02.html`.
- The instructions: none were read.
- The folder's list: `.depositignore` leaves out 53 files, 37 under `results/` and 16 `.pyc` files under `__pycache__/`. Its `.DS_Store` line matches no file.
- No row of "Files" names a file the list leaves out. `find` counts 11 files in `core/` and 7 in `experiments/` outside `__pycache__`, and 34 with it, and the rows give 11 and 7.

The page walked: Zenodo's upload form is one page, and it holds "Publish".
- Fields filled:
  - DOI radio: "No, I need one", the radio only.
  - Resource type.
  - Title.
  - Authors/Creators: one person entry through "Add author", with family and given name split from the Creator row.
  - Description: first paragraph only (Q1), set whole with the editor's setContent.
  - Licenses: the preset CC BY 4.0 was removed and MIT was added through "Add standard".
  - References: two entries, one per `<br>` line of the row.
  - Programming language.
- Files uploaded: 21. Not uploaded: `core/__init__.py` and `experiments/__init__.py`, because the form's file list is flat (Q4).
- Declarations: none on the page or in the sheet.
- Draft saved with "Save draft". The portal answered "Record successfully saved.".
- Read-back through the draft API (`/api/records/<id>/draft`): state "unsubmitted", submitted false, no DOI reserved, 21 files. Title, resource type, the creator, the licence, both references and Python all match the rows. The description is 624 characters and equal to its row.

Fields the sheet lacked, and how each was resolved:
- Resource type (required): Q2, answered "Software".
- DOI question (required, preset "Yes, I already have one"): Q3, answered "No, I need one", the radio only.
- The two same-named files: Q4, answered "upload neither".
- The controls the sheet does not cover: Q5, answered that each stays unused. That covers community, titles, authors from file, contributors, dates, awards, identifiers, related work, custom fields, Preview, the visibility switch and embargo.
- Optional fields with no usable row stay empty, with no hand-back: Copyright, Related works and the rest, as the coordinator instructed.
- Presets left as they were: Publication date (today) and Visibility "Public".

Read-back differences: none. No field differed on the first read-back, so none was filled a second time, and no difference remains.

Controls left to the user:
- The cookie banner, which does not block the page and was left untouched.
- "Publish".
- "Share".
- No sign-in was asked for, because the session was already signed in.

Stop the run ended on: "The page of the final submit".

walk.md: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/deposit/submit-runs/2026-11-24/walk.md, 56 lines (`wc -l`).

Places where the skill's text produced something wrong in this run:
1. "Files" rows name folders (`core/`, 11 files; `experiments/`, 7 files), not files. Item 4 of the walk says to upload each file "from its path", but a folder path cannot be uploaded to a file input, and uploading the folder whole would include the `__pycache__` files the list leaves out. I expanded the folders to their files myself. Nothing in the skill or the sheet agent's page asks for one row per file.
2. Nothing in the skill warns that a portal's file list can be flat. Neither the sheet agent nor the approval step caught that two files in the folder are both named `__init__.py`. It surfaced only in the walk, as a question.
3. The sheet agent wrote rows the form can hold only partly. "Copyright year" holds a year where the form asks for a statement of ownership, and "Related work" holds a title where the form asks for an identifier and a relation type. The skill has no stop or note for a row whose value does not fit the field it matches, so these became "rows no field asked for".
4. The skill has no rule for a preset value that the form already holds, such as a licence, a DOI radio, a date or a visibility. It covers neither replacing one, as with the CC BY licence and the MIT row, nor keeping one. The coordinator's brief had to supply that rule, and removing the preset licence used a "Remove" control that the walk's list of allowed controls does not name.
5. Step 8 assumes a first page of forms that comes before the final submit, and step 9 walks "page by page". On a one-page form whose only page holds "Publish", steps 8, 9 and 10 meet on the same page. The text does not say this, and I read that page as the page of the final submit.
6. A one-line cell holding several entries, such as the References row split by `<br>`, is read under item 3 as one value with line breaks. To fill a portal that takes one entry per input, I read each line as its own entry, which the text does not state.
7. The portal created the record as a draft on the first file upload, before "Save draft" was pressed. The skill's account of saving and of a "new tab" walk does not foresee that an upload itself creates the record.
