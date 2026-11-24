# Step 5, repair round 1

The rules file `docs/dev/change-standard.md` and the brief `agents/briefs/5.md` govern this round as they governed the step. The round is the one repair round of the step. Each finding below is from the reviewer's report; each ruling says what to change. Nothing else is changed.

## Findings and rulings

1. Spec 1, `skills/explain/tutor/SKILL.md`, the lesson's form and the reference documents: two sentences of the source are weakened. Ruling: the lesson's bullet says, as the source does, that a lesson is beautiful, with clean, readable typography and layout, since the user returns to it to review. The reference documents' bullets say, as the source does, that glossaries in particular are an essential reference.
2. Spec 2, "Teaching" item 1: the copy reads every file and folder of the workspace on each run, which the source does not ask. Ruling: the item reads what the source reads at the start of a run: `MISSION.md`, the learning records, `NOTES.md`, and the components under `assets/` before a lesson is written; `RESOURCES.md` where the source's text reads it. No lesson and no reference document is read whole unless a step needs it.
3. Spec 2, the completion criterion "or the user is given its path" of the item that opens the lesson: kept, since the layout asks each item to end on a criterion that holds when no command can open the file. It gets a row in "Deviations" that names the layout's rule.
4. Spec 3, "Deviations": the two characters of the public source that the copies write in ASCII, the range in the glossary format page and the braces' content in the mission format page, each get a row, approved by ADR 0048's ASCII point.
5. Standards 1, the Stops table: two rows are added, "No concept" (the call holds `explain` with no concept; the session asks for it; the concept resumes it) and "`--page` without `explain`" (a refusal that names the three calls; the call typed again resumes it), in the form of the table's other rows. Item 1 of the brief is changed by this ruling to six rows.
6. Standards 4, "Explaining" item 5: its completion criterion gains the branch for a folder that is no teaching workspace and for a user who has not shown understanding: the item is done at once and offers nothing.
7. Standards 2, the format pages that name `GLOSSARY.md`: nothing is changed in this round. The point is raised to the user.
8. Standards 3, the rule on difficulty in two sections: nothing is changed. The source states it in "Lessons" and in "Philosophy", and the copy keeps both.

## After the changes

- Read `skills/explain/tutor/SKILL.md` once more against the source's `SKILL.md`, sentence by sentence, and bring "Deviations" in line: every sentence of the source the copy drops, weakens or changes in meaning, and every behaviour the copy adds, has a row, or is put back as the source has it. A difference found on this read is put back as the source has it unless the layout, ASCII or the prose standard forces it.
- Run the checks of the brief's "Verify before you report" again and quote the lines.
- Append a section "Repair round 1" to the report `agents/reviews/5-report.md` in the worktree: each finding by its number here, what was changed and where, the checks' lines, and the whole section "Deviations" as it now stands.

## Paths this round writes

- `skills/explain/tutor/SKILL.md`
- `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-report.md`
