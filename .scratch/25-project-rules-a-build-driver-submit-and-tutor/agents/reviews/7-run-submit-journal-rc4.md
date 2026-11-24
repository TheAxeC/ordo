Part 1 of the `/submit` run is done. The run is held at the stop "The approval of the sheet". I opened no browser tab and used no browser tool.

**The call**
- I invoked the skill through the Skill tool, with `skill: submit` and both arguments (the URL and the folder). It was accepted ("Launching skill: submit").
- Steps 1: the URL is `https` and the folder exists.
- Steps 2: no `submit-runs/` stood under the folder (`ls` gave "No such file or directory"). The date from `date +%Y-%m-%d` is 2026-11-24, so the run folder is `submit-runs/2026-11-24/`. I created it and its `portal/` with `mkdir -p`.

**The message that named the material (Steps 3)**
"The material of /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal holds 27 files. No run folder of `paper`, no funder config and no list of what is left out."
- The count is from `find -type f | wc -l`, which gave 27.
- The folder holds no dot-files. Its only file at the root is `cover_letter_bspc.tex`, whose first lines are LaTeX, so it is no list of what is left out.
- There is no `paper-runs/` in the parent folder and no `grant-config/` in the folder.
- The journal guide was found at `/Users/axelfaes/.local/share/ordo-stable/skills/academic/paper/references/journal_submission_guide.md`, which holds a section "3. Required Components".

**The sheet agent (Steps 4)**
- It was started fresh on `general-purpose`, with no model and no effort set.
- Its brief gave the paths of `agents/sheet_agent.md` (to be read whole) and of the template, the URL, the 27 material paths, "no list of what is left out", the guide's path and the run folder.

**The `curl` calls**
There was one call, as the agent reports it:
- `https://submit.editorialmanager.com/BSPC/submissions?dgcid=em_nse_redirect_authormainmenu`: status 200, no redirect, saved as `portal/01.html`.
- `ls portal/` holds only `01.html`, 56268 bytes.
- `grep -c "<form"` on it gives 0.
- There were no other fetches.

**The sheet**
- Path: `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal/submit-runs/2026-11-24/submission-sheet.md`, 82 lines (`wc -l`).

What its first lines say:
- **How much of the form was read:** none. The page at the URL is one a script fills in the browser and holds no form: only scripts, a stylesheet link and an empty root `div`. The sentence on what an approval covers is there.
- **Instructions read:** only the journal guide's "Required Components". No saved portal page states what the submission asks for.
- **Pages saved:** `portal/01.html`, status 200.
- **Pages not read:** none. The page links no page, only a script on another host, its own script and stylesheet, and icons.
- **Files read:** `main.tex`, `abstract.md`, `highlights.tex`, `highlights.pdf`, `cover_letter_bspc.tex`, plus further files (the line is long). The figures and `refs.bib` were not chosen.
- **Files not read:** "None."
- **Left out of "Files":** LaTeX build files, 8, `manuscript/main.aux`.
- **What a list of the folder leaves out:** "None: the folder holds no list of what is left out of a submission."

Table "Fields", 21 rows (first cell / Asked by / value):
1. Journal / Nothing read asks for it / filled
2. Article type / Nothing / filled
3. Title / guide, Title page / filled
4. Author 1 / guide, Title page / filled
5. Author 1, e-mail / guide, Title page / filled
6. Author 2 / guide, Title page / filled
7. Author 2, e-mail / guide, Title page / filled
8. Order of authors / guide, Title page / filled
9. Affiliation of both authors / guide, Title page / filled
10. Corresponding author / guide, Title page / filled
11. Corresponding author, e-mail / guide, Title page / filled
12. Corresponding author, institution as given in the earlier draft / Nothing / filled
13. First author / Nothing / filled
14. Abstract / guide, Abstract / filled
15. Keywords / guide, Keywords / filled
16. Highlights / Nothing / filled
17. Transferred from / Nothing / filled
18. Manuscript number of the earlier draft in this portal / Nothing / filled
19. Code availability address / Nothing / filled
20. Funder / guide, Funding statement / filled
21. Grant number / guide, Funding statement / empty (Q1)

Table "Files", 15 rows (first cell / Asked by / path):
1. Manuscript (main text) as PDF / guide, Main text / filled
2. Manuscript (main text) as PDF, build folder copy / guide, Main text / filled
3. Earlier manuscript PDF / Nothing / filled
4. Manuscript LaTeX source / guide, Main text / filled
5. References / guide, References / filled
6. Tables / guide, Tables / filled
7. Figures / guide, Figures / filled (a folder entry for 7 PNGs)
8. Cover letter as PDF / guide, Cover letter / filled
9. Cover letter LaTeX source / guide, Cover letter / filled
10. Highlights as PDF / Nothing / filled
11. Highlights LaTeX source / Nothing / filled
12. Declaration of interests / guide, Conflict of interest / filled
13. Abstract and keywords as text / guide, Abstract and Keywords / filled
14. Earlier draft built by the portal / Nothing / filled
15. Supplementary materials / guide, Supplementary materials / empty (Q2)

Table "Declarations", 10 rows, every answer filled:
1. Conflict of interest statement / guide, Conflict of interest
2. Declaration of interests (form) / guide, Conflict of interest
3. Data availability statement / guide, Data availability
4. Funding statement / guide, Funding statement
5. Ethics statement / guide, Ethics statement
6. Author contributions (CRediT) / guide, Author contributions
7. AI disclosure / guide, AI disclosure
8. The manuscript is original and not under consideration elsewhere / Nothing (a yes/no answer)
9. All authors have approved the submission / Nothing (a yes/no answer)
10. New human-subjects data collected / guide, Ethics statement (a yes/no answer)

**Length and content of the text cells**
I checked each one against its source file with a Python comparison. Each cell holds the text itself, never a description of it:
- **Abstract:** 1402 characters. It equals `submission/abstract.md` with whitespace normalised.
- **Highlights:** 413 characters. It equals the five `\item` lines of `submission/highlights.tex` (with `\%` read as `%`), separated by `<br>`.
- **Conflict of interest statement:** 70 characters. It equals the `main.tex` section "Conflicts of Interest".
- **Declaration of interests (form):** 170 characters. It equals the ticked option of `declarationStatement.docx`.
- **Data availability statement:** 404 characters. It equals the `main.tex` section with the markup removed. The citations are shown as [23], [34] and [27], and `pdftotext` of `main.pdf` shows those same numbers.
- **Funding statement:** 167 characters. It equals the `main.tex` section.
- **Ethics statement:** 316 characters. It equals the `main.tex` section.
- **Author contributions (CRediT):** 217 characters. It equals the `main.tex` section without the `\textbf` markup.
- **AI disclosure:** 246 characters. It equals the `main.tex` section, with the trailing `\appendix` correctly not included.

**Questions**
- Q1: Fields "Grant number". The guide asks for grant numbers, and the folder names only the funder.
- Q2: Files "Supplementary materials". Is any supplementary file to be uploaded?

**Kinds of file left out:** LaTeX build files, 8 (`main.aux`, `main.bbl`, `main.blg`, `main.fdb_latexmk`, `main.fls`, `main.log`, `main.spl`, `main.synctex.gz`). Nothing is left out by a list.

**Objections:** "None."

Steps 5 holds: the sheet has filled Fields values, Files paths and Declarations answers that quote passages of the folder.

---

**The stop: The approval of the sheet**
The sheet is to be shown whole from `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal/submit-runs/2026-11-24/submission-sheet.md`, with its first lines, its questions Q1 and Q2 and its objections (none). I do not copy it into this report because of the limit that no value goes into a report. It waits for:
- an approval;
- answers to Q1 and Q2;
- any corrections.

The sheet agent raised points it judged the user should see before approving:
- `manuscript/bttn-axel-faes.pdf` is an older build whose text differs from `main.tex`, and its data statement differs too. It is still offered under Files as "Earlier manuscript PDF".
- `manuscript/main.pdf` and `submission/manuscript.pdf` have identical text, and both are offered as uploads.
- `submission/BSPC-S-26-24907.pdf` is the portal's own build of an earlier draft, and it is offered under Files too.

---

**Places where the skill's text or the sheet agent's page left us without an instruction, disagreed, or produced something wrong**

1. **SKILL.md, Steps 6, against my brief's limits.** Steps 6 says "Show the sheet whole, its first lines and its objections included", but the brief forbids values in reports. I gave the stop by the sheet's path instead of its text.
2. **SKILL.md, Steps 3.** "Name the material to the user in one message ... and go on without waiting" assumes a session that talks to the user. Run as an agent, I wrote the message in my turn's text, and it reaches the user only through this report.
3. **The sheet's first line "Instructions read".** It names the guide by a relative path, `skills/academic/paper/references/journal_submission_guide.md`, not the path it was given. The template asks for "its path". This is a small error in the sheet.
4. **sheet_agent.md, "Reading the folder" 1.** "Read a Word document's text from its `word/document.xml` ..." and "A file whose text you cannot read in this way or with the Read tool" give no way to read a PDF. The agent used `pdftotext`. For the duplicate 35-page and 39-page PDFs it compared the extracted text with `diff` instead of reading each one whole. Of the old build PDF it read only the first page and the statement sections.
5. **sheet_agent.md "Reading the folder" 1 against the template line "Files not read".** The page counts any file whose text cannot be read, "such as an image", as a file not read. The template lists only "each file chosen". The agent wrote "None." and named the figures and `refs.bib` as not chosen.
6. **sheet_agent.md "The sheet" 2.** "every value the folder holds, by kind" gives no rule for two sources that disagree on one value: the capitals in the keywords, and the old PDF's data statement. The agent took `main.tex` and `abstract.md`.
7. **sheet_agent.md "The sheet" 2.** "the value's whole text as it is to be typed" gives no rule for LaTeX markup (`\cite`, `\textbf`, `\url`, `\%`). The agent removed the markup and used the citation numbers of the compiled PDF.
8. **sheet_agent.md "Reading the folder" 4.** "Done when each file of the material is noted as a file that could be uploaded or as a file left out" allows only two kinds of left-out file: build products and files a list leaves out. It has no place for a superseded build or the portal's own earlier draft. As a result, an outdated manuscript PDF and the portal-built draft PDF are offered for upload. In my judgment this is the wrong result here.
9. **Duplicates.** Neither the page nor the template says what to do with duplicate copies of one file. Two identical manuscript PDFs are listed as separate rows, and the conflict of interest appears twice: once as a statement in Declarations, and once as the docx form in Files plus its own Declarations row.
10. **The guide as the only instruction.** It has no row for highlights. "Highlights" is therefore marked "Nothing read asks for it", even though highlights are a regular item for this kind of journal. This is my judgment, not checked against the journal's own guide, which the agent could not read: no instruction page was linked on the portal's host.

The walk has ended on the page of the final submit, "Review and submit", and the tab is open there. The run is at the stop "The page of the final submit": the user presses "Complete your submission". I did not press it, and I ticked none of that page's five checkboxes.

The title, the abstract and the keywords in the portal still carry the characters the typing dropped on page 4. They must be corrected in the tab before the final submit.

**Answers written into the sheet**
- Q14 correction: the row "Classifications" holds "ELECTROCARDIOGRAPHY (ECG)" with the other three, and the question records the correction.
- Q15: share data No, option "Other" with your text.
- New rows and questions for the "Review and submit" controls: Q16 for the ethics and copyright acceptances, Q17 for the three confirmations.
- `grep -c "Answer:\|Correction:"` gives 15.
- `submission-sheet.md` now has 108 lines (`wc -l`).

**Final report of part 2**

**Pages walked, by heading**
1. **"Your Biomedical Signal Processing and Control submissions"** (the page before the form)
   - The terms and privacy checkbox blocked "Start a new submission". The user ticked it, and I pressed "Start a new submission".
   - No existing submission was touched; the list showed 0.
2. **"Choose your article type"**
   - Article type set from its row.
3. **"Upload your submission files"**
   - Uploaded: the manuscript PDF as Manuscript; the declaration docx as "Declaration of competing interests"; the cover letter PDF as "Cover letter"; the highlights PDF as "Highlights"; the 7 figure PNGs as "Figure".
   - Nothing went up for Table, Supplementary material, Response to reviewers, Graphical abstract, Audio / Video or either co-submission (Q2, Q5<U+2013>Q10).
4. **"Check or add your title, abstract and keywords"**
   - Filled: Title, Abstract and Keywords. They differ from the sheet (see Differences below).
5. **"Check or add your author details"**
   - Two authors, the second added with "Add another author".
   - For each: first and last name, e-mail, institution "Hasselt University" (Q11) and contributor roles (from the CRediT declaration row).
   - Author 1 is marked as the corresponding author.
   - The author order equals the sheet.
6. **"Add your funder details"**
   - Funding answered Yes (from the "Funding statement" row).
   - Funder 1 is "Government of Flanders" (Q12).
   - Grant numbers are empty (Q1) and the grant recipient is empty (Q13).
7. **"Select your classifications"**
   - Ticked: ELECTROCARDIOGRAPHY (ECG), BIOMEDICAL SIGNALS, INVERSE PROBLEMS, MACHINE LEARNING.
   - I first ticked EEG from the first answer. I then went back through the step list, unticked EEG, ticked ECG and saved.
   - Read-back by JavaScript: exactly these four are checked.
8. **"Provide additional information"**
   - "Do you want to share data?": No. The portal had preset Yes.
   - Availability option: "Other", with the Q15 text set whole. Read-back: the value equals the text exactly, 166/200 characters.
   - Preprint: "NO, I don't want to share my research early and openly as a preprint." This answers a yes/no question with no row, using your instruction (no preprint server posting).
   - After the classification fix, the page was read again and had kept these values.
9. **"Review and submit"**
   - The page shows every section "Done": 2 authors, 1 funder, 4 classifications.
   - Left untouched: the five checkboxes and "Complete your submission".
   - A JavaScript read shows all five checkboxes unchecked.

**Fields the sheet lacked, and how each was resolved**
- Q3, Q4: two rows matched one file type (cover letter, highlights). Resolved: PDF only.
- Q5<U+2013>Q10: optional file types with no row (Table, Response to reviewers, Graphical abstract, Audio / Video, the two co-submissions). Resolved: nothing goes up.
- Q11: institution search. Resolved: "Hasselt University".
- Q12: funder search. Resolved: "Government of Flanders".
- Q13: grant recipient. Resolved: empty.
- Q14: classifications. Resolved: ECG, BIOMEDICAL SIGNALS, INVERSE PROBLEMS, MACHINE LEARNING, after the correction.
- Q15: data sharing and availability. Resolved: No, "Other" with your text.
- Preprint question: answered No by your rule for a yes/no question with no row. It is named in `walk.md`.
- Q16, Q17: the "Review and submit" checkboxes. Left to the user, unticked.

**Controls left to the user**
- The terms and privacy checkbox before the form (the user ticked it).
- The cookie preference dialog, which stood in the page, was not shown and was left untouched.
- On "Review and submit":
  - "I have read and accept the publishing ethics policy."
  - "I have read and accept the copyright terms."
  - "I confirm the above submission declarations"
  - "I confirm that all authors have made substantial contributions"
  - "I confirm I have mentioned all organizations that have funded this research."
  - "Complete your submission"

**Differences the read-back found**
- **Title:** 146 characters in the sheet, 144 on the page; 2 words differ.
- **Abstract:** 1402 characters in the sheet, 1375 on the page; 26 words differ.
- **Keywords:** 139 characters in the sheet, 137 on the page; 2 words differ.
- `walk.md` holds the sheet's value, the page's value and the differing words for each. I re-read them from the page with JavaScript on the "title, abstract and keywords" step, then returned to "Review and submit" through the step list without saving anything.
- The file types on the upload page could not be read back, because the page does not show them.

**The stop the run ended on:** "The page of the final submit".

**`walk.md`:** `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/journal/submit-runs/2026-11-24/walk.md`, 110 lines (`wc -l`).
- It also lists the rows no field asked for: Journal, First author, the Highlights text, Code availability address, the LaTeX sources, References, "Abstract and keywords as text", and the conflict, ethics, AI and human-subjects declarations, among others.

**Files written:** `find -newer` shows only four files in the run folder: `portal/01.html`, `portal/06-classifications.txt`, `submission-sheet.md` and `walk.md`. No other file of the folder changed.

**Places where the skill's text left me without an instruction, disagreed with itself, or produced something wrong**
1. **Long values typed one key at a time.** SKILL.md, "The walk of one page" 3: "Type the value's text as its cell holds it". The skill does not say how. Typing long values key by key dropped characters, while setting the whole value at once did not.
2. **"Fill no field a second time".** "The walk of one page" 7 says it, and the anti-pattern behind it covers a portal that rewrites the value. Here the typing tool caused the difference, and the rule left three misspelled fields in the draft.
3. **One row, several fields.** "The walk of one page" 1: "Match each field ... to the row of the sheet that holds its value". No rule covers:
   - a field that takes only an entry from the portal's own list (institution, funder, classifications, data-availability option);
   - two rows that match one field (cover letter, highlights);
   - one row split into several fields (name);
   - a list that offers the same entry twice.
4. **Length limits.** The skill has no rule for a field whose limit is shorter than the row's whole text: the data-availability "Other" field takes 200 characters, and the row holds 404.
5. **Values the portal fills in.** The skill has no rule for an answer the portal presets ("Do you want to share data?" was Yes), or for fields that appear only after another answer.
6. **Required fields.** The skill makes every field with no row a stop ("The walk of one page" 2). It gives no way to tell a required field from an optional one when the page marks neither ("selecting 3 to 5").
7. **Long lists of choices.** The skill gives no place for the choices of a question that are too many for the sheet. I saved them in `portal/06-classifications.txt`, which is not a saved page.
8. **Read-back of uploads.** "The walk of one page" 7 has no instruction for an upload whose type the page does not show.
9. **The final page.** Steps 10 says to walk that page "as items 1 to 7 of 'The walk of one page' say", so its declarations would be filled from the sheet.
   - Here each confirmation is one checkbox bundling several statements, and the sheet settles only some of them.
   - Two other checkboxes there are a policy acceptance and a copyright acceptance, which the Rules leave to the user.
   - The skill does not say whether a bundled confirmation counts as a declaration or as a consent. I left all five to the user, which also matches your instruction to press nothing there.
10. **Going back to an earlier page.** The skill has no instruction for returning to a page already walked to apply a correction, here the Q14 correction. I went back through the portal's step list and walked the page again, then re-read page 7, which had kept its values.
11. **Answers that come from the user rather than the sheet.** Your rule for the last page, to answer a yes/no question with no row from the manuscript's statements without stopping, departs from "The walk of one page" 2, which makes it a stop. Your answer was written into the sheet as a row, so the Rules' "the sheet as approved is the only source" still holds.
