# Gate run, step 7: agent ac3b8e3d52f4ad011

The run reached the stop "The approval of the sheet" and waits there for the sheet's owner. The sheet is written and passed the check of Steps 5. None of the portal's form was read, because the URL redirects to a sign-in page, and no instructions were read, so the sheet has no questions and every "Asked by" cell reads "Nothing read asks for it". The stop "A sheet with nothing from the folder" was not raised.

**Invocation**
I invoked the skill through the Skill tool, `skill: submit`, with the URL and the folder as its arguments. The call was accepted. Steps 1 and 2 passed: the folder exists, the date was 2026-11-24 (`date +%Y-%m-%d`), and no `submit-runs/` stood under the folder before the run (`ls` said "No such file or directory").

**The message that named the material (Steps 3)**
"The material is the folder [the folder path] with 76 files, its subfolders included, `submit-runs/` and names starting with a dot left out. It has no run folder of `paper` and no funder config."
- The count of 76 comes from `find` with `submit-runs` and dot-names pruned, piped to `wc -l`.
- `ls` showed that `paper-runs/` in the parent and `grant-config/` in the folder do not exist.
- "What it reads" 4 was not given to the agent, because the portal is no journal's manuscript system.

**The sheet agent (Steps 4)**
I ran `mkdir -p` for the run folder and `portal/`, then started one fresh `general-purpose` agent with no model and no effort set. Its prompt held the page's path with the word to read it whole, the template's path, the URL, the 76 files by their paths, the run folder's path, and the run's limits.

Its `curl` calls, both in the page's form and run from the run folder, as it reported them:
1. `curl -sS --fail --proto '=http,https' -w '%{http_code} %{redirect_url}\n' -o 'portal/01.html' 'https://sandbox.zenodo.org/uploads/new'` printed `302 https://sandbox.zenodo.org/login/?next=%2Fuploads%2Fnew`
2. `curl -sS --fail --proto '=http,https' -w '%{http_code} %{redirect_url}\n' -o 'portal/02.html' 'https://sandbox.zenodo.org/login/?next=%2Fuploads%2Fnew'` printed `200 ` with no redirect address.

The files under `portal/`, from `ls -l`:
- `01.html`, 245 bytes: a redirect page.
- `02.html`, 7172 bytes: the sign-in page. Per the page's rules, its fields were not written down and its links were not followed.

**The sheet**
- Path: /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/gate/deposit/submit-runs/2026-11-24/submission-sheet.md
- Lines: 54 (`wc -l`). I read it whole with `cat`.

What its first lines say:
- **Form read:** none of the portal's form, because it stands behind a sign-in. They name the 302 to the sign-in page, `portal/02.html`, followed by the template's sentence on what an approval covers.
- **Instructions read:** "None", in the template's sentence that the questions come only from what the folder lacks.
- **Pages saved:** both addresses, each with its file and status.
- **Pages not read:** None.
- **Files read:** `README.md`, `LICENSE`, `requirements.txt` and `paper.py`, each with its kinds of value. The first lines of the `.py` files and the CSVs were read to judge what each file is.
- **Files not read:** None.

"Fields" has 9 rows. Every "Asked by" is "Nothing read asks for it", and every value and source is filled:

| First cell | Value | Source |
|---|---|---|
| Title | filled | README heading |
| Creator | filled | `LICENSE` line 3, with the README's form noted |
| Description | filled | README first paragraph |
| Resource type | filled | README section "Files" |
| Licence the work is released under | filled | `LICENSE` and README |
| Copyright year | filled | `LICENSE` |
| Related manuscript | filled | README |
| Related publication | filled | README section "The model" |
| Software requirements | filled | `requirements.txt` |

"Files" has 10 rows covering 60 files. Every "Asked by" is "Nothing read asks for it", and every path is filled:
- Source code of the package: `core/`, 11 files
- Experiment drivers: `experiments/`, 7 files
- Entry point: `paper.py`
- Requirements: `requirements.txt`
- README: `README.md`
- Licence file: `LICENSE`
- Input lead field: `data/ny_leadfield.npz`
- Result tables: `results/`, 12 CSVs
- Simulation blocks: `results/paper_sim_blocks.npz`
- Figures: `results/figs/`, 24 files

"Declarations" has 1 row, "External data used and not included". Its "Asked by" is "Nothing read asks for it". Its answer is filled and rests on a quoted passage of the README's section "Install and run".

- **Questions:** None.
- **Kinds left out of "Files":** Python compiled modules, 16 files, with `core/__pycache__/btd_inverse.cpython-313.pyc` as the example path. The total checks: 60 + 16 = 76.
- **Objections:** None.

**Other stops and limits**
- No other stop was raised, and I answered no stop myself. The stop "The approval of the sheet" is open: the sheet is to be shown whole to its owner.
- I did not paste the sheet into this report, because it holds private values. It is at the path above.
- No browser tab or browser tool was used.
- `find -newermt` over the folder, with `submit-runs` left out, listed only the folder itself, whose time changed when the run folder was created. No other file in the folder changed.

**Places where the skill's text or the sheet agent's page left a gap, disagreed or produced something wrong**

1. **The folder's own list of what to leave out of a deposit is never read.** SKILL.md, Steps 3, says "Leave out every file and folder whose name starts with a dot." This hides `.depositignore` from the sheet agent. That file excludes `results/`, `__pycache__/` and `*.py[cod]` from the deposit. As a result the sheet proposes uploading 38 files under `results/` (12 CSVs, 1 `.npz`, 24 figures, plus the result folders) that the folder's own list leaves out. Neither the skill nor the page says what to do with such a file.

2. **A submission that is not to a journal or a funder has no source of instructions.** SKILL.md, "What it reads" 4, gives instructions only for "a journal's manuscript system", and the funder config only for a grant. The page's "Reading the instructions" 1 lists only saved portal pages, the journal guide and the funder config. For a repository deposit whose form is behind a sign-in, nothing is read. So the sheet holds zero questions, and the fields such a form usually asks for (affiliation, version, keywords, publication date) are not raised before the approval.
   - This is the outcome the anti-pattern "Writing the sheet only from what the saved portal pages ask for" says leads to: "the walk asks for every field one page at a time".
   - The page also has no rule for the portal's public help pages, which are on another host and are not linked from the sign-in page.

3. **The sign-in page's links cannot be listed for the user.** The page's "Reading the portal" 2 says "A page that asks for a sign-in is read no further: its fields are never written down and its links are not followed". The same bullet list asks that each link to another host that looks like an instruction page be listed as a page not read. When the URL's page is only a redirect to sign-in, the first rule stops the second, so "Pages not read" reads "None." even if the sign-in page links to instructions. The agent took the strict reading.

4. **A template sentence promises questions that do not exist.** The template's "Instructions read" sentence for no instructions, "None: the questions below come only from what the folder lacks for the rows it gives.", was used in a sheet whose "Questions" reads "None.". The sentence assumes there are questions, and no other wording is offered for this case.

5. **Showing the sheet whole conflicts with this brief.** SKILL.md, Steps 6, says "Show the sheet whole". This brief forbids putting values in my report. I took the reading of giving the sheet's path, so the session that resumes the stop shows the sheet itself.

6. **The material message cannot be read before going on.** SKILL.md, Steps 3, says "Name the material to the user in one message ... and go on without waiting". When the run goes on in the same turn, that message reaches the user only between tool calls. The skill does not say whether it is also repeated at the stop.

7. **A name was chosen from two different forms.** In the row "Creator", `LICENSE` and `README.md` give the name in two forms. The page has no rule for which to choose. The agent took the full form from `LICENSE` and noted the other in the source cell rather than raising a question. This is my judgment of what the page allows, not a stated rule.
