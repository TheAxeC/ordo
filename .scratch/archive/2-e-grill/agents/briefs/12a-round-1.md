# Step 12a, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/12a-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/12a-round-0.diff` there. The rules file, the no-git rule and the report path are unchanged. The paths are the brief's. Wording is yours unless a text is given exactly; plain quotes, ASCII, one line per bullet, no history. Line numbers are the worktree's as it stands now.

1. Spec 1: `plan-loop.svg` names `/ordo-help`: a dashed card marked "optional", `/ordo-help <entry>`, saying it prints where the plan stands and the next command to type. Place it where it reads as available at any point of the row (for example beside the halt cards, or as a narrower card in that row); every label legible, nothing overlapping.

2. Spec 2: the `/plan-orchestration` band carries the "optional" mark by its word as well as its dash: `Group(OPTIONAL)` first in its groups, as `/grill`, `/plan-retro` and `/ordo-help` have it. It is optional because the row can be run by hand, which `/ordo-help`'s sequence gives as the alternative ("instead of the lines above").

3. Spec 3: the band's stops gain "The roadmap diff" (the `plan-orchestration` Stops row of that name; its When is the closing step's `/roadmap done`), marked "only when" with the name written so the reader sees it is at the closing (such as "The roadmap diff, at the closing"). The band's sentence becomes true across both figures: under `/plan-orchestration` only the stops marked in these two figures reach the user, and the rest of the row runs without asking. The `/land` rows are marked on the `/land` box, which is in this figure, so the sentence covers them.

4. Spec 4: the `/ordo-init` box's body says only what the marked stops hold for: "For an existing repository: writes .agents/plan.yaml." Add a note under its stops: with `.agents/plan.yaml` present it checks the file instead and writes nothing, and its only stop is then "A fix in the check" (the `ordo-init` skill's "Steps / Checking an existing file").

5. Spec 5: "close them" carries an "only when" row "A contradiction of an ADR the brief asked for", in place of "No stop of its own." (the `refute` skill's "Finding dispositions" and `/ordo-help`'s "close them" line: raised to the user as an open item). The second `/refute` box (over the round) gains an "only when" row for what the last refutation or the read of the delta leaves, such as "A finding left after the last round" (the sequence: "raised to you as an open item"). "build it" keeps "No stop of its own."

6. Standards 1: the four forwarding properties of `Box` (`x`, `y`, `w`, `h`) are removed; the code reads the rectangle's fields directly (`box.area.x`), or `Box` holds them itself. One name per position.

7. Standards 2: the row arrows (`gen_figures.py:488-489` and `:593-594`) are one function both figures call.

8. Standards 3: the docstring's run line says to run it from the repository root as `python3 docs/figures/gen_figures.py`, and that the script finds its paths from its own location, so any directory works with the path to the script. The error list names every error form the script prints, the caption, note and legend errors (which name "a caption", "a note" or "the legend") and the word-too-long error among them, each with what the message names.

9. Standards 4: each README line introducing a figure is a full sentence with a main verb, about 20 words or fewer; two sentences where the marks need their own.

10. Behaviour 1: the script runs on Python 3.9, as the other scripts of the tree do and as `/usr/bin/python3` on macOS is: `itertools.pairwise` and `zip(..., strict=True)` are replaced by their 3.9 forms (item 7's function can hold the pairing). Run it with `/usr/bin/python3` and quote the run. Run ruff with `--target-version py39` added to the brief's selection and quote it.

11. Proof 1: the report's first line and table state the end state truthfully; the section "Repair round 1" says which item of the brief each change closes.

After the changes, rerun from the worktree root: every case of the brief (the two-runs identity, the error cases on a scratch copy under `$TMPDIR` with no `.git`, minidom, the ASCII grep, the plan-help grep, ruff, the contrast of any new colour pair), render both SVGs with `rsvg-convert` and read the PNGs, check each changed box against the Stops table or the text it now cites, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`, quoted verbatim.

Append to the same report, `.scratch/2-e-grill/agents/reviews/12a-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings. Your final message is that section.
