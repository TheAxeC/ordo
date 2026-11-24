The list is close to complete but not fully complete or true. I found 3 differences it does not hold, 3 places where it is imprecise, and no source instruction missing from the copy beyond those 3 differences.

What I read in full: every file in `.scratch/25-project-rules-a-build-driver-submit-and-tutor/sources/teach/` (`SKILL.md`, `docs-teach.md`, the four `*-FORMAT.md` pages and `agents/openai.yaml`), `/Users/axelfaes/workspace/ordo/skills/explain/tutor/SKILL.md`, its four pages under `references/`, the deviations list, ADR 0048 and `docs/dev/skill-layout.md`. I read nothing under `agents/` of the ledger. `LC_ALL=C grep -c '[^ -~]'` gives 0 for every source and copy file, so no quote below needs a named character.

## 1. Differences the list does not hold

**1a. Teaching item 1 is a step the source does not have.** Meaning changed: an instruction was added and an order fixed.
- Source: "This should be used to ground all teaching." This is a description of `MISSION.md` in the workspace list. The source has no read step and does not say when each file is read.
- Copy ("Steps / Teaching" item 1): "Read `MISSION.md` when it exists, since it grounds all teaching and items 2 and 3 depend on it." Its bullet adds: "The learning records are read by item 5 when the user names no exact thing to learn, `RESOURCES.md` by items 4 and 6, and `assets/` by item 7, before the lesson is written."
- The "Sections" kind says the source's sections became the layout's sections. It does not cover a new read step, or the fixed order the ten items impose on the source's unordered prose. Under that order, reference documents (item 9) come after the lesson file (item 8), where the source says "While creating lessons", and opening the lesson (item 10) comes last.

**1b. Teaching item 4 narrows the source's priority on finding resources.** Meaning changed: the instruction is weakened.
- Source (Philosophy): "Before the `RESOURCES.md` is well-populated, your focus should be to find high-quality resources which will help the user acquire knowledge."
- Copy ("Steps / Teaching" item 4): "While `RESOURCES.md` is not well populated, focus on finding high-quality, high-trust resources that help the user acquire knowledge, and record them there in the format of `references/resources-format.md`." Its criterion: "Done when `RESOURCES.md` lists the resources the lesson draws on."
- The criterion lets the step end once the current lesson's resources are listed, and the run goes on to write that lesson. In the source, finding resources is the focus until the list is well populated; `docs-teach.md` says "`RESOURCES.md` fills up before the lessons do".
- Row 22 ("each item of Steps ends on 'Done when'") covers adding criteria in general. Row 21 shows the list does give a criterion its own row when the criterion changes the instruction, and this one has none.

**1c. The Stops table adds a criterion for ending the mission interview.** Meaning: a condition added to `SKILL.md`, taken from a format page.
- Source: not in `SKILL.md`. `MISSION-FORMAT.md` has "**Concrete over abstract.**" and "If the user cannot articulate why, interview them before writing anything."
- Copy (Stops, row "The mission interview", column "What resumes it"): "The user's answers, until the mission is concrete enough to write".
- Row 27 lists the Stops table, but not this new end condition for the interview. The meaning of the skill as a whole is unchanged, because the unchanged mission page already says it.

**Wording only, covered by the list's kinds.** I counted about 40 such changes (Second person; ASCII and the prose standard; Sections). Three examples:
- "A shared stylesheet is the first component every workspace earns: every lesson links it, so the lessons look like one consistent course rather than a pile of one-offs." became "A shared stylesheet is the first component every workspace gets, and every lesson links it, so that the lessons look like one course." ("Teaching" item 7)
- "Missions may change as the user develops more skills and knowledge. This is normal - make sure to update the `MISSION.md`" became "Missions may change as the user develops more skills and knowledge." plus "On the user's yes, update `MISSION.md`" ("Teaching" item 3). "This is normal" is dropped.
- "These should be used to calculate the zone of proximal development." became "from which the zone of proximal development is worked out" ("The teaching workspace", learning-records bullet).

The same class includes: "should" written as "It is" throughout "Teaching" item 8, "may need to be revised later" written as "may be revised later", "See [Assets](#assets)." dropped, "There are several tools at your disposal" dropped, and the order of the workspace files changed (`RESOURCES.md` now comes before `reference/`).

One wording point that is not a source deviation: the Quick start comment "/tutor  the next lesson of this workspace, chosen from its learning records" leaves out the mission. Under "Teaching" item 5, the choice uses both the learning records and the mission.

## 2. Rows or bullets of the list that are false or imprecise

**2a. Row 30 misdescribes the source sentence.**
- The list says: "Never trust your parametric knowledge.", said of lessons".
- The files show: in the source's Philosophy section the sentence stands alone after the `RESOURCES.md` sentence and has no qualifier. It is not "said of lessons".
- The copy's Rules bullet, "Never trust the model's parametric knowledge: every lesson and every explanation draws its knowledge from high-quality, high-trust resources.", uses the colon to scope the rule to lessons and explanations. The row presents this as a widening (from lessons to lessons and explanations). Measured against the unqualified source sentence, the copy states the rule's reach explicitly, and other output such as an answer to a wisdom question is not named.

**2b. The "Sections" bullet points to a document outside the list.**
- The list says: "The heading map of the step's report gives where each source section went."
- The list claims to hold every difference, but where each source section went is not in it. I did not read that report, since it is presumably among the files I was told not to read.

**2c. Row 23's source cell has no clear referent.**
- The list says: "`/teach` and its sections".
- The files show: the source `SKILL.md` names `/teach` once, in line 12 ("resolve from the directory `/teach` was run in"), and has no sections belonging to `/teach`. The copy's counterpart of that sentence is "What it reads" item 2: "Its paths resolve from the folder `/tutor` was run in".

**Not verified, not counted:** rows 14 and 15 say the saved pages differ from the source "as read" in exactly two characters. The saved files cannot settle that. `LEARNING-RECORD-FORMAT.md` line 12 ("{1-3 sentences") and `MISSION-FORMAT.md` line 11 ("{1-3 sentences.") use the same range form as the "1-10" that row 14 says was an en dash upstream. Whether they were en dashes upstream is not verified.

**Checked and true:**
- Row 13: `diff` results, as in part 4.
- Row 16: the link path.
- Row 17: `grep -n GLOSSARY` on the source `SKILL.md` finds nothing. The copy names the page at lines 33, 105 and 147.
- Row 18: two format pages name `GLOSSARY.md`.
- Rows 19, 20, 21, 25 and 31: the quoted text matches the copy.
- Row 22: every Steps item ends on "Done when".
- Row 27.
- Row 29: `skills/explain/` holds `tutor` and `wait-what`.
- The `README.md` row of `tutor` exists (line 26).
- The line on `wait-what`: `git log --follow --name-status` shows `R100 skills/ordo/wait-what/SKILL.md -> skills/explain/wait-what/SKILL.md` in 6c12304.
- The Anti-patterns kind: five rows, four from source prohibitions and one for the explain mode.
- Each ASCII/prose example in the list appears in the copy as stated.

## 3. Missing source instructions and unlisted additions

- **Source instructions missing from the copy:** none, other than the weakening in 1b. Every other sentence of the source `SKILL.md` that gives an instruction has a counterpart in the copy, in "Steps / Teaching", "The teaching workspace", "Knowledge, skills and wisdom" or Rules.
- **Copy instructions not in the source and not listed as additions:** none beyond 1a and 1c. Each explain-mode and page instruction is covered by rows 24 to 26.

## 4. The format pages

I ran `diff` of each saved source page against its copy.
- `GLOSSARY-FORMAT.md` against `glossary-format.md`: exit 0, no output.
- `LEARNING-RECORD-FORMAT.md` against `learning-record-format.md`: exit 0, no output.
- `MISSION-FORMAT.md` against `mission-format.md`: exit 0, no output.
- `RESOURCES-FORMAT.md` against `resources-format.md`: one change, line 29, `[SKILL.md](./SKILL.md)` became `[SKILL.md](../SKILL.md)`.

These are exactly the differences the list names (row 13, row 16 and the "Format pages" bullet).

## 5. Result

3 points under 1, 3 under 2, 0 under 3.
