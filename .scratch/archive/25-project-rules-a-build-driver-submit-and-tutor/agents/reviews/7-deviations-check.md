# The deviations list checked against the source, step 7: agent aa85f45e56022c96e

The list is neither complete nor true. Nine source-to-copy differences are missing from it, nine of its rows or bullets are false or imprecise, and one instruction of the copy is neither in the source nor listed as an addition. I changed no file.

What I read in full, each with `cat -n`:
- the source: `.scratch/25-project-rules-a-build-driver-submit-and-tutor/sources/teach/` (`SKILL.md`, the four `*-FORMAT.md` pages, `docs-teach.md`, `agents/openai.yaml`);
- the copy: `skills/explain/tutor/SKILL.md` and its four pages under `references/`;
- `deviations.md`, `docs/adr/0048-tutor-is-a-copy-of-mattpocock-s-teach-with-the-name-an-explain-mode-and-its-page-added.md` and `docs/dev/skill-layout.md`;
- for the approvals: the Rulings section of `plan.md`, `agents/briefs/5.md` and `agents/reviews/5-refuter.md`.

A byte count of characters outside ASCII (`LC_ALL=C tr -d '\000-\177' < f | wc -c`) prints 0 for every source file and every copy file.

## 1. Differences the list does not hold

**Changes of meaning**

a. **Learning records are read in every run, not only when the user names no topic.** This is an instruction moved to another condition.
- Source: "The user may specify an exact thing they want to learn. If they don't, figure out their zone of proximal development by: - Reading their `learning-records`"
- Copy, Steps / Teaching item 1: "Read `MISSION.md`, the learning records in `learning-records/` and `NOTES.md`, each that exists." It reads all three at the start of every teaching run.

b. **"Try to" is dropped.** This strengthens the instruction.
- Source: "Try to design lessons which build long-term retention by desirable difficulty:"
- Copy, Teaching item 6: "Build storage strength by desirable difficulty: ..."

c. **"Default posture" is dropped**, so the copy no longer allows an exception. This strengthens the instruction.
- Source: "your default posture should be to attempt to answer - but to ultimately delegate to a **community**."
- Copy, Rules: "attempt an answer and then delegate the question to a community"

d. **"Attempt to" is dropped.** This strengthens the instruction.
- Source: "You should attempt to find high-reputation communities the user can join."
- Copy, Rules: "Find high-reputation communities the user can join, and respect the user's preference when they do not want to join one."

e. **An observation became an absolute instruction.** This is my judgement.
- Source: "For acquiring knowledge, difficulty is the enemy. It eats working memory you need for understanding."
- Copy, Teaching item 6: "Keep the knowledge free of difficulty, which eats the working memory the user needs for understanding."

f. **"Directly" is dropped.** This weakens the instruction slightly.
- Source: "It should be directly tied to the mission"
- Copy, Teaching item 8: "It is tied to the mission."

g. **A possibility became a statement of fact.** This strengthens it.
- Source: "Lessons can reference these documents - they are useful for tracking raw units of knowledge useful across lessons."
- Copy, Teaching item 9: "so the reference documents track the units of knowledge used across lessons, and lessons link to them."

h. **An instruction became a description.** This weakens it.
- Source: "As the workspace grows, so should the component library."
- Copy, Teaching item 7: "The component library grows with the workspace."

i. **The source's documentation page has no row.**
- `docs-teach.md` stands in the saved source folder. The copy has no counterpart for it, and `deviations.md` does not mention it (`grep -rn 'docs-teach' deviations.md` prints nothing).
- This is a page of the source repository's documentation, not a file of the skill's folder. The anti-pattern "Why it fails" cells draw on it, for example the made-up content.

**Pure wording.** I saw about 30 wording differences that the kinds "Second person", "ASCII and the prose standard", "Sections" and "Format pages" cover. Three examples:
- "highly-relevant interactive lessons devised by you" became "highly relevant interactive lessons devised from the knowledge" (Knowledge, skills and wisdom).
- "ask followup questions to the agent" became "ask the agent follow-up questions" (Teaching item 8).
- "titled `0001-<dash-case-name>.md`, where the number increments each time" became "named `0001-<dash-case-name>.md`, the number one higher each time" (The teaching workspace).

Others of the same kind: "directory" became "folder", "very small" became "small", "exactly the same number of words" became "the same number of words", "may change" became "change", and the bold on **lesson**, **components**, **feedback loop** and **community** and the emphasis on _reason_ were dropped.

## 2. Rows and bullets that are false or imprecise

1. **The header is imprecise.** It says the source's "copy as read stands in `sources/teach/`". The saved files are not as read: `agents/briefs/5.md` line 11 says "Two characters of the copies are written in ASCII: the range "1-10" in `GLOSSARY-FORMAT.md` and "{...}" in `MISSION-FORMAT.md`".

2. **The en dash row is false against the saved source.** The row says the source has "A 1<en dash>10 self-rating". Line 23 of `sources/teach/GLOSSARY-FORMAT.md` holds an ASCII hyphen: `od -c` shows "1 - 1 0". The difference cannot be seen from the saved files.

3. **The ellipsis row is false against the saved source.** The row says the source has "{<ellipsis>}". Line 16 of `sources/teach/MISSION-FORMAT.md` is "- {...}" with three full stops, as `od -c` shows. Same situation as item 2.

4. **The format pages row and the "Format pages." bullet are false.** The row says "words unchanged apart from the three rows below"; the bullet says "apart from the link path and the two ASCII characters above". `diff` and `cmp` show that only `resources-format.md` differs, in one line. The glossary, mission and learning-record pages are byte-identical to the saved source.

5. **The `GLOSSARY-FORMAT.md` row is incomplete.** It says the copy names `references/glossary-format.md` from "Teaching" item 9. The copy also names it in "What it reads" item 3 and in "The teaching workspace" (the `reference/GLOSSARY.md` bullet).

6. **The "When to write a learning record" row is incomplete.** It says only that Rules 3 "names that section". The rule also limits itself to one mode: "In the teaching mode, write a learning record whenever ...". In the explain mode a record is written only on the user's yes. The explain row covers the yes; this row does not mention the limit.

7. **The approval of the "no argument checks" row is imprecise.** It cites "ADR 0048, the explain mode and the page". ADR 0048 says nothing about refusing `--page` without `explain` or asking for a missing concept. The text that asks for both is brief 5, "What to build" item 4.

8. **The "no page" row and the "no explain mode" row leave out instructions the copy adds within those modes.**
   - "The page" item 2: "A path that names a folder that exists holds the page under the name of item 1."
   - "The page" item 4: "in a teaching workspace with the components of `assets/` as "Teaching" item 7 says".
   - "What it reads" item 2: "In the explain mode, the folder is a teaching workspace when it holds `MISSION.md`." Brief decision 2 approves this one.

9. **The "Anti-patterns." bullet is imprecise.** It says the table "is made from the source's prohibitions". The "Why it fails" and "Do instead" cells are new text with no counterpart in the source's `SKILL.md`, for example "It can teach what is made up, and the user has nothing to check it against" and "The lessons drift apart and stop looking like one course".

One row I could not check: "the skill in `skills/productivity/teach/`". The saved folder does not record its upstream path; ADR 0048 and brief 5 line 11 state it.

All other rows hold against the files:
- The approvals D2, D11, D12, D13, D and Open item F stand in `plan.md` Rulings.
- Brief decisions 1, 5 and 6 stand at `agents/briefs/5.md` lines 82 to 87.
- Round 1 rulings 3 and 5 are cited at `agents/reviews/5-refuter.md` line 240.
- The Stops table has the six rows the list names.
- Every item of Steps ends on "Done when".
- All ten spaced-hyphen examples and the other rewordings named under "ASCII and the prose standard" are reworded as stated.

## 3. Instructions missing or added unlisted

**Missing from the copy.** None. Every instruction of the source's `SKILL.md` has a counterpart in the copy, some changed as section 1 lists (a to h).

**Added and not listed.** One. Teaching item 1, bullet 3: "No lesson and no reference document is read whole unless a step needs it." The source has no such instruction, and no row or kind of the list holds it.

## 4. The four format pages

`diff` of each source page against its copy:
- `GLOSSARY-FORMAT.md` against `glossary-format.md`: no output.
- `MISSION-FORMAT.md` against `mission-format.md`: no output.
- `LEARNING-RECORD-FORMAT.md` against `learning-record-format.md`: no output.
- `RESOURCES-FORMAT.md` against `resources-format.md`: one line, line 29, where `[SKILL.md](./SKILL.md)` became `[SKILL.md](../SKILL.md)`.

The only difference is the one the list names for `resources-format.md`. The two ASCII differences the list names for the glossary and mission pages do not exist between the saved source and the copy (section 2, items 2 to 4).

## 5. Count

Not complete and true: 9 points under 1, 9 under 2, 1 under 3.
