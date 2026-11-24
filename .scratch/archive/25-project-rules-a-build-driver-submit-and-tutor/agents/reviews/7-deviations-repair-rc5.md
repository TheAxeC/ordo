All six points and the two further ones are done, and the verify commands pass. One judgment call needs your approval: I changed the frontmatter description of `tutor` and its `README.md` row, which the brief asked only to check (item 3 below).

`git diff --stat`:
```
 .../deviations.md                                  | 47 ++++++++++----
 .../plan.md                                        |  5 ++
 README.md                                          |  2 +-
 skills/explain/tutor/SKILL.md                      | 72 +++++++++++-----------
 4 files changed, 76 insertions(+), 50 deletions(-)
```
The `plan.md` change was already in the tree when I started; I did not touch it. `git status --short` also lists four untracked `agents/reviews/7-*-rc4.md` files. I did not write them.

Files changed:
- `/Users/axelfaes/workspace/ordo/skills/explain/tutor/SKILL.md`
- `/Users/axelfaes/workspace/ordo/README.md`
- `/Users/axelfaes/workspace/ordo/.scratch/25-project-rules-a-build-driver-submit-and-tutor/deviations.md`

## The six points

**1a. Teaching item 1 and the fixed order.**
- **Order put back to the source.** The source says "While creating lessons, you should also create reference documents". The old items 8 (write the lesson) and 9 (write its reference documents) put the reference documents after the lesson, which contradicts that sentence. They are now one item.
  - Before: "8. Write the lesson as one self-contained HTML file in `lessons/` ..." and "9. Write the reference documents of the lesson in `reference/` ..." Item 9 ended "Done when each reference document the lesson needs stands in `reference/`."
  - After: "8. Write the lesson as one self-contained HTML file in `lessons/`, named `0001-<dash-case-name>.html`, the number one higher than the last lesson's, and while writing it, write its reference documents in `reference/`." It has two sub-lists, "The lesson:" and "The reference documents, as HTML files except the glossary, are the compressed essence of the lesson in a form made for reference at a glance:". Their bullets are unchanged. It ends "Done when the lesson stands in `lessons/` and the reference documents that hold its compressed essence stand in `reference/`."
  - The old item 10 (open the lesson) is now item 9.
- **References to the old numbers.** I updated every one I found. "The page" item 4 now reads "the lesson's form that "Teaching" item 8, "The lesson", gives". Anti-patterns row 1 ("items 4 and 8") still holds.
- **Two new rows in the list:**
  - The added read step: what the source names about when each file is read; the text of item 1, its bullet and its criterion; why the layout needs it before items 2 and 3. Approved by ADR 0048, the layout point, and open item I.
  - The fixed order of items 1 to 9: which orders the source states and are kept (mission first, resources first, `assets/` before authoring, reference documents while creating lessons), and which order was fixed where the source leaves it open. Same approvals.

**1b. Teaching item 4.**
- Before: "focus on finding high-quality, high-trust resources that help the user acquire knowledge ... Done when `RESOURCES.md` lists the resources the lesson draws on."
- After: "focus on finding high-quality resources that will help the user acquire knowledge ... Done when `RESOURCES.md` is well populated."
- I also took out "high-trust", which the source's sentence does not have.

I checked the other criteria of "Teaching" against the source's sentence for each:
- **Item 2** ended too early, since it was already done whenever `MISSION.md` existed and the user was still unclear about the mission.
  - Before: "Done when `MISSION.md` holds the mission."
  - After: "Done when `MISSION.md` is populated and the user is clear about the mission."
- **Item 3** limited the confirmation to two causes, where the source's "Confirm with the user before changing the mission." covers any change.
  - Before: "Confirm with the user before changing the mission, when the request or what the user has learned would change it" ... "Done when the user has answered, and after a yes ..."
  - After: "Confirm with the user before changing the mission" ... "Done when the run changes nothing in the mission, or the user has answered, and after a yes `MISSION.md` and the learning record are written."
  - The Stops row's When cell went from "the request, or what the user has learned, would change the mission" to "the mission is to be changed".
- **Items 5 to 8** add no condition the source does not state.
- **Items 1 and 9** add conditions, and each has its own row.
- The row "no completion criteria" now says all of this.

**1c. Stops row "The mission interview".** I worded the cell from the source's own sentences rather than adding a row to the list. This keeps the copy closest to the source and adds no condition of its own.
- Before: "The user's answers, until the mission is concrete enough to write"
- After: "The user's answers on why they want to learn the topic; if the user cannot articulate why, the interview goes on before anything is written, as `references/mission-format.md`, "Push back on vagueness", says"
- The Stops row of the list names this.

**2a. "Never trust your parametric knowledge."**
- Copy, before: "Never trust the model's parametric knowledge: every lesson and every explanation draws its knowledge from high-quality, high-trust resources."
- Copy, after: "Never trust the model's parametric knowledge, in either mode."
- List row, before: "said of lessons". After: "a sentence of its own in "Philosophy", after the sentence on `RESOURCES.md`, with no qualifier". The reason now says: second person written as an instruction, plus "in either mode" for the explain mode. Approved by ADR 0048, the layout point and the explain mode.

**2b. The heading map.**
- The pointer "The heading map of the step's report gives ..." is replaced by the map itself under "Sections".
- It has one line per source section, per format page and per frontmatter key, plus `agents/openai.yaml`, each naming the section of the copy that holds it.
- I wrote it from the copy as it stands now. The old map in `5-report.md` is out of date: it says `disable-model-invocation` was "kept" and uses the old item numbers.

**2c. The `/teach` row.**
- Before: "`/teach` and its sections"
- After: "`/teach`, named once in `SKILL.md`, in "resolve from the directory `/teach` was run in"". The copy's cell now names `/tutor` in the same sentence ("What it reads" item 2) and the four calls in Quick start, "The call" and Stops.

## The two further points

1. **Quick start comment.**
   - Before: "the next lesson of this workspace, chosen from its learning records"
   - After: "the next lesson of this workspace, chosen from its learning records and its mission"
2. **The ASCII rows and the header.** They now say plainly that the difference in the two characters rests on brief 5, "What is on the tree", and on the report of step 5, and cannot be checked from the saved files, which hold only the ASCII forms.
   - The brief says only that the two characters "are written in ASCII". The names "range character" and "ellipsis character" come from step 5's report, and the rows now say so.
   - The "Format pages" bullet says the same. It now cites `cmp` and `diff`, which I ran: `cmp` prints nothing for the glossary, mission and learning-record pages, and `diff` prints one line for `resources-format.md`, the link path.

## Other corrections

1. **List:**
   - "ruling F" is now "open item F", which is the name `plan.md` Rulings uses.
   - The glossary-format and glossary rows name "Teaching" item 8, not item 9.
   - The open-lesson row names item 9, not item 10.
2. **Copy, wording put closer to the source in "Knowledge, skills and wisdom" and Rules:**
   - Knowledge, before: "and acquired best without difficulty". After: "; for acquiring knowledge, difficulty is the enemy".
   - Skills, before: "and made durable and flexible by difficulty, which is the tool here". After: "; skills are about durability and flexibility, and for skill acquisition, difficulty is the tool".
   - Rules, the community bullet: "where the user tests the skills" became "where the user can test the skills", as the source has it.
3. **Description and README row (judgment call).** Both said the next lesson is chosen from the learning records, which is the same claim the Quick start comment made. I changed both so the three places agree.
   - Description: "learning records from which the next lesson is chosen" became "learning records from which, with the mission, the next lesson is chosen". Its length is now 773 characters, and `metadata.version` is still "1.0.0", as the YAML check prints.
   - README row: the same change.
4. **ADR 0048** has no sentence these changes make false: the two stops, the workspace files and the explain mode are unchanged.

I left "Teaching" item 7 (read `assets/`) after item 6 (design the lesson). My judgment is that the source's "Before authoring a lesson" means before the writing in item 8, and item 7 needs the design to know what new component to write. The order row states this reason.

## Verify output
All run from the repository root with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front:
- `LC_ALL=C grep -n '[^ -~]'` on `skills/explain/tutor/SKILL.md`, `README.md` and `deviations.md` prints nothing for any of the three.
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
- `python3 docs/figures/gen_figures.py` exits 0.
- `git status --short` then lists only `deviations.md`, `plan.md`, `README.md`, `skills/explain/tutor/SKILL.md` and the four untracked rc4 reports. No file under `docs/figures/` is listed.

## Not done
Nothing.
