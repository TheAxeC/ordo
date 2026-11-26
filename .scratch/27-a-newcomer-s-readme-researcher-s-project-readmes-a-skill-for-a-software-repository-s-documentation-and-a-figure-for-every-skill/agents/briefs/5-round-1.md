# Repair round 1 of step 5

The findings of `agents/reviews/5-refuter.md`, each with its ruling. Every rule of the brief `agents/briefs/5.md` still holds. Work in the same worktree, under the same git rules. When the round is done, add a section "Repair round 1" to your report `agents/reviews/5-report.md` that answers each ruling by its number, with the checks rerun and their output, and keep the rest of the report true for the tree as it then stands.

1. **Behaviour 1: the text alternative of a rounded box.** The engine's kind `choice` carries the word "question", which `describe()` writes into each box's `<title>` and `aria-label`, so every rounded box that `gen_figures.py` draws reads as "(question)" to a screen reader. The same holds for the existing rounded boxes, whose legends say "the session reads and judges" (`gen_figures.py`, the legend rows at lines 203, 1151 and 1267) and "a folder, with the files that end up in it" (line 731).
   - In `gen_figures.py`, `FIGURE_KINDS` gains three kinds beside `paper`, each with the style of the engine's `choice` kind (read from the engine's `KINDS`, never copied by hand), and these words:
     - `step`: "a step of the session";
     - `judge`: "the session reads and judges";
     - `folder`: "a folder".
   - Each box of kind `choice` in `gen_figures.py` takes the kind its figure's legend gives it: `step` in the fifteen figures of a skill's steps, `judge` where the legend says the session reads and judges, `folder` in `academic/paper/run-folder.svg`. Each legend row names the new kind.
   - Afterwards `grep -c '"choice"' docs/figures/gen_figures.py` prints 0, and `grep -l '(question)' docs/figures/*/*.svg docs/figures/*/*/*.svg` prints nothing.
   - The engine `skills/code/handbook/templates/figures.py` and `docs/figures/ordo_kinds.py` stay unchanged.
   - The head comment's paragraph on the mapping of kinds names the three new kinds, and `docs/dev/scripts.md` line 9, which names the kind `paper`, names them too.
   - Every figure whose SVG changes by this ruling alone is named in the report. The paths of the step widen to every figure `gen_figures.py` writes.
2. **Standards 1: the README frame of the lifecycle figure.** The caption "The project's README.md, which each mode reads first and writes" is false for `novelty`, which writes its page and its `.bib` into `notes/` and reads no README. The legend row "Solid box: a part of the mode or the stage named above it", the note's "a frame is a mode or a stage" and the head comment's "a frame is a mode or a stage of research" are false for the README frame.
   - The caption names the modes that read the README and write it, as `skills/academic/researcher/SKILL.md` "What it reads" 18, 20 and 25 and each mode's Steps give them, and leaves `novelty` out.
   - The legend row, the note and the head comment say that a frame is a mode, a stage of research or the project's README.
   - Ruling D19 asks for the README "as the file each mode reads first and writes"; the exact list of modes carries that out on what D19 names.
3. **Spec 1: the report's terms.** "The terms" lists the glossary term **step** in its second sense, "an item of a skill's Steps", where the head comment and the legend use it, read against the entry.
4. **The paper mode figures, for the review over this round.** The report gains a table: for each of the twelve figures `academic/paper/<mode>.svg`, each row of `skills/academic/paper/SKILL.md` "Stops" that waits on the user in that mode, and the box of the figure that draws it, or the note sentence that names it (such as `STOPS_NOT_DRAWN`), or why it does not apply to the mode. A row found missing from a figure is added to the figure, with its alt text in `README.md`, under item 11 of the brief.
5. **`plan`'s row "The plan exists".** It stays drawn as a refusal: the row's resume is "Nothing", since a plan is opened once, as the brief's rule on refusals has it. No change.

Run again every check of the brief's "Verify before you report" and every case of its "Cases", with the case "The figures that stand" read with the figures ruling 1 changes left out, each named.
