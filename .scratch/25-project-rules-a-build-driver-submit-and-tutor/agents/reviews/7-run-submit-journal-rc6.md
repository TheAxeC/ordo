The walk ended where you asked: on the page "Check or add your title, abstract and keywords", after it was filled and read back. "Save and continue" was not pressed there. The new submission is an unsent draft, and its tab, id 812158589, is still open on that page.

**Invocation**
I invoked the skill through the Skill tool (`skill: submit`) with the URL and the folder.

**Sheet**
- Path: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal/submit-runs/2026-11-24/submission-sheet.md, 82 lines by `wc -l`.
- Your answers Q1 to Q5 and your corrections are written into it. Taking out the LaTeX source under Q3 also took out the row "References" (`refs.bib`); I read refs.bib as part of that source.
- One question added during the walk is written in as Q6, with its answer: the optional upload field gets no file.

**Pages walked, by heading**
1. "Your submissions". I pressed "Start a new submission". No terms checkbox stood on the page. The page opened a new submission and changed nothing in the earlier draft.
2. "Choose your article type". One field filled: the article type radio, from the row "Article type". The read-back shows it selected.
3. "Upload your submission files".
   - I chose the file type "Manuscript" and uploaded `submission/manuscript.pdf`. The page lists it under "File added".
   - The optional and supplementary upload was left empty.
   - The page had no declarations.
4. "Check or add your title, abstract and keywords". The portal reported it could not take the values from the PDF, and showed all three fields empty. Each value was set whole, in one form_input action. Read-back used a JS value length and a SHA-256 hash compared with the row's text:
   - Title: 146 characters in the row and 146 on the page, same hash. No second fill.
   - Abstract: 1402 characters in the row and 1402 on the page, same hash. The portal's counter shows 193/250 words. No second fill.
   - Keywords: 139 characters in the row and 139 on the page, same hash. No second fill.
   - A screenshot shows the text in the fields.

**Other fields whose read-back differed:** none.

**Fields the sheet lacked, and how each was resolved:** one. The optional and supplementary file-type field on the upload page was resolved by your standing answer and your change (no optional file), and is written into the sheet as Q6.

**Controls left to the user**
- None blocked the walk.
- Each page has a non-blocking cookie notice in its footer, with a "Cookie Settings" button. I did not touch it.

**Where the run ended:** you ended it during the walk, at Steps 9, after page 4 was filled and read back. The skill's last stop, "The page of the final submit", was not reached.

**walk.md**
- Path: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal/submit-runs/2026-11-24/walk.md, 43 lines by `wc -l`.
- It lists the pages walked, the values set with their lengths, and that no difference remained. It also lists that no declaration was answered, the controls left to the user, and the rows of the sheet that no walked page asked for.

**The other tabs and the portal**
- I did not touch the two tabs that were already open (the earlier draft's review page and a Zenodo upload).
- No sign-in was asked for, and nothing was ticked, accepted or submitted.

**Places where the skill's text produced something wrong in this run**
1. The sheet agent took values from the portal's own PDF of an earlier draft (`BSPC-S-26-24907.pdf`): the rows "Manuscript number", "Transferred from" and "Corresponding author, institution", and it proposed that PDF as a file to upload. You had to take these out by hand. `agents/sheet_agent.md` gives no rule that an artefact of an earlier submission is not a source of values for a new one.
2. The sheet agent also listed files no instruction asks for as rows of "Files": the LaTeX sources of the cover letter and of the highlights, `abstract.md`, `refs.bib`, and three manuscript PDFs where one is wanted. That made a question (Q3) and several corrections necessary.
3. "The walk of one page" 2 turns every field with no row into a stop, optional ones included. The upload page alone has an optional file-type field with more than six choices, so without your standing answers each walk page would have handed back for optional fields. The skill has no reading for an optional field left empty.
4. Steps 9 says that when you end the run at a stop of the walk, the closing message of Steps 11 is written and the run ends. Steps 12, which shows the closing message, is tied only to the page of the final submit. So for an early end the skill does not say whether the closing message is shown, or that the final submit still lies ahead for you. I wrote that sentence into `walk.md` anyway.
5. "The walk of one page" 7 says how to compare a text field with its row. It says nothing on how to read back a radio button or an uploaded file. I used the page's selected state and its "File added" list.
