The list is nearly complete and true, but not quite: I found one unlisted difference in meaning and four rows that are false or imprecise. No instruction of the source is missing from the copy, and the copy has no unlisted added instruction beyond the point under section 1.

I read every file of `.scratch/25-project-rules-a-build-driver-submit-and-tutor/sources/teach/` (`SKILL.md`, the four `*-FORMAT.md` pages, `docs-teach.md`, `agents/openai.yaml`) in full. I also read in full `skills/explain/tutor/SKILL.md`, its four `references/*-format.md` pages, the deviations list, ADR 0048 and `docs/dev/skill-layout.md`. I compared the source's `SKILL.md` with the copy sentence by sentence. Supporting commands:
- `LC_ALL=C grep -n '[^ -~]'` over all source and copy files printed nothing (exit 1): every file is ASCII.
- `grep -c '/teach'` on the source `SKILL.md` printed 1.
- `git log --follow -M --name-status` on `skills/explain/wait-what/SKILL.md` shows `R100 skills/ordo/wait-what/SKILL.md -> skills/explain/wait-what/SKILL.md` in 6c12304.
- `grep -n tutor README.md` shows the `tutor` row at line 26.

## 1. Differences the list does not hold

**1.1 "Teaching" item 4 turns a focus into a precondition (strengthened).** This is a judgment on how strong "your focus should be" is.
- Source, "Philosophy": "Before the `RESOURCES.md` is well-populated, your focus should be to find high-quality resources which will help the user acquire knowledge."
- Copy, "Teaching" item 4: "While `RESOURCES.md` is not well populated, focus on finding high-quality resources that will help the user acquire knowledge, and record them there in the format of `references/resources-format.md`." Its criterion: "Done when `RESOURCES.md` is well populated."
- Because the Steps are a numbered list in execution order, items 5 to 9 (choosing, designing, writing and opening the lesson) now cannot start until `RESOURCES.md` is well populated. The source makes finding resources the priority, but it does not forbid a lesson while the file is still thin.
- No row names this. Row 22 lists "resources while `RESOURCES.md` is not well populated" as item 4 of the order, and row 24 says each criterion "adds no condition the source does not state", which does not hold for this criterion.
- `docs-teach.md`, "It's working if" ("`RESOURCES.md` fills up before the lessons do") points the same way as the copy, but that page is not the skill's text.

**Pure wording differences covered by the list's kinds.** I counted about 40 (second person made into instructions, reworded spaced-hyphen asides, sentences merged or moved, ASCII and prose-standard rewordings). Three examples the list does not quote one by one:
- Source "Assets": "A shared stylesheet is the first component every workspace earns: every lesson links it, so the lessons look like one consistent course rather than a pile of one-offs." Copy, "Teaching" item 7: "A shared stylesheet is the first component every workspace gets, and every lesson links it, so that the lessons look like one course."
- Source "Teaching Workspace": "These should be used to calculate the zone of proximal development." Copy, "The teaching workspace": "from which the zone of proximal development is worked out."
- Source "The Mission": "your first job should be to question the user on why they want to learn this." Copy, "Teaching" item 2: "Interview the user on why they want to learn the topic". The words "This is normal" from "This is normal - make sure to update the `MISSION.md`" are also dropped from item 3. The list names that aside among the reworded ones but does not say it was dropped.

## 2. Rows or bullets that are false or imprecise

**2.1 Row 24 is false for "Teaching" item 4.** It says each criterion in "Teaching" "adds no condition the source does not state, apart from item 1 and item 9". Item 4's criterion "Done when `RESOURCES.md` is well populated." adds the gate described in 1.1. This is the same fact as 1.1, seen from the row's claim.

**2.2 Row 21 contradicts itself.**
- Its first cell says the source "names no point at which `MISSION.md` or `RESOURCES.md` is read".
- Its reason cell says "the bullet adds no read the source does not name".
- The bullet of item 1 that it quotes names reads of `RESOURCES.md` at "items 4 and 6". By the row's own first cell, the source names no such read point. The second claim should be limited to the learning records and `assets/`, or the `RESOURCES.md` reads should be noted as implied by the source rather than named in it.

**2.3 Row 22: one stated order may not be kept (a judgment).**
- The row says "each order the source states is kept" and includes "Before authoring a lesson, read `./assets/`".
- In the copy, `assets/` is read in item 7. That is after item 6 has set "the lesson's knowledge, its task and the task's feedback", including the quiz and the in-browser task, which are the kind of thing the source's components (quiz widgets, simulators) exist for.
- The row's own reason is "the design before the components it uses".
- If designing the task counts as "authoring" the lesson, this order is not the source's. If only writing the HTML counts (item 8), the row holds. The source does not settle which.

**2.4 Row 30 is imprecise.**
- It says `docs-teach.md` has "no counterpart" in `tutor`.
- The copy's Use instead row ("The last message did not land and is to be said again | `/wait-what`") comes from that page's table row "The agent's last message re-pitched because it didn't land | wait-what".
- The list's own "Anti-patterns" bullet also says one "Why it fails" cell "draws on the source's page `docs-teach.md`, 'Common questions'".
- So parts of the page do have counterparts. The "Sections" bullet names the `/wait-what` row but not where it comes from.

**Checked and true.**
- Rows 13, 16, 17, 18, 19, 20, 23, 25, 29, 32 and 33, by the files.
- Row 31's `wait-what` location and the closing `wait-what` line, by the git rename.
- The section map, the format-page naming lists (each page's naming places match lines 33, 56, 62, 105, 124, 145 to 150, 176 and 195 of the copy) and the ten spaced-hyphen asides. These are all ten in the source.
- The six other quoted rewordings of the "ASCII and the prose standard" bullet.
- The two ASCII rows (14 and 15) say themselves that they cannot be checked from the saved files. The saved files are ASCII, which agrees with what the rows say about them. The approvals cited (open items, rulings D, D2, D11 and so on) were not verified, since they are in ledger files outside the brief.

## 3. Instructions missing from the copy, and unlisted additions

- **Source instructions missing from the copy:** none. Every instruction of the source's `SKILL.md`, in every section, has a place in the copy, as the list's section map says.
- **Copy instructions neither in the source nor listed as additions:** none beyond 1.1. The explain mode, the page, the call checks, the read step, the criteria, the glossary file, Rules 3, the Stops rows and the Anti-patterns cells are each covered by a row or a kind.

## 4. The format pages

The only difference is the one the list names.
- `diff` of `MISSION-FORMAT.md` against `mission-format.md`: exit 0, no output.
- `diff` of `LEARNING-RECORD-FORMAT.md` against `learning-record-format.md`: exit 0, no output.
- `diff` of `GLOSSARY-FORMAT.md` against `glossary-format.md`: exit 0, no output.
- `diff` of `RESOURCES-FORMAT.md` against `resources-format.md`: exit 1. It prints one changed line, 29c29: `[SKILL.md](./SKILL.md)` became `[SKILL.md](../SKILL.md)`. That is row 16.

## 5. Count

Not complete and true: 1 point under section 1, 4 under section 2 (of which 2.1 is the same fact as 1.1 and 2.3 rests on a judgment), and 0 under section 3.

Files read:
- /Users/axelfaes/workspace/ordo/.scratch/25-project-rules-a-build-driver-submit-and-tutor/sources/teach/
- /Users/axelfaes/workspace/ordo/skills/explain/tutor/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/explain/tutor/references/
- /Users/axelfaes/workspace/ordo/.scratch/25-project-rules-a-build-driver-submit-and-tutor/deviations.md
- /Users/axelfaes/workspace/ordo/docs/adr/0048-tutor-is-a-copy-of-mattpocock-s-teach-with-the-name-an-explain-mode-and-its-page-added.md
- /Users/axelfaes/workspace/ordo/docs/dev/skill-layout.md
