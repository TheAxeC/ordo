# Landing report: step 1

Roadmap entry 19 (codebase-design). Plan step 1 of 3: the skill. Next: step 2, the gate's runs.

## Open items

- Open item A. The skill differs from the two sources in points that `.scratch/19-codebase-design/deviations.md` does not list, and the gate asks for the user's ruling on each deviation. The points: (19) after the pick, "design it twice" runs before `/roadmap add` and `/grill`, and the ADR offer after them, where the source runs both inside its grilling; (20) the user may pick no candidate, and no roadmap entry is then written; (21) the scan agent has a sixth question, "Where does the code break a rule of a standards page?"; (22) the goal given to `/roadmap add` names the source's grilling topics (constraints, dependencies with their categories, the shape of the deepened module, what sits behind the seam, which tests survive) in place of the source walking them itself; (23) words the glossary gives another sense are reworded ("tier-spanning slice", "technical brief", "use cases", "the default case", "Step 2"), and a sentence marks each example as made up; (24) the report's header names each subject that applies and that the repository lacks; (25) the review's aim reads "friction that makes the code hard to understand and to test" where the source says "testability and AI-navigability"; (26) "a good stretch back" for the commit history is kept as the source has it, against the prose standard's rule on vague qualifiers. Options: (a) approve 19 to 26, booked as one ruling and added to `deviations.md`. Pro: the gate's check of the deviations list can pass; 19, 21 and 22 follow from rulings D4 and D5. Con: none found. (b) name the points to change, and each is changed in a step the ruling adds. Pro: a point the user does not want is removed. Con: one more step before the gate. Recommendation: (a). The lazy option is to leave the list as it is, which fails the gate.

## The check before the landing

The runner's agent listing showed the builder and both reviewers ended: one subagent listed, a0f46fdedb82ed703, completed.

## Not done

Nothing of the step. The gate's runs are step 2.


- What landed: the skill `skills/code/codebase-design/` (`SKILL.md`, 208 lines, and `references/vocabulary.md`, `deepening.md`, `design-it-twice.md`, `report.md`), its figure `docs/figures/codebase-design.svg` with the function `codebase_design()` in `docs/figures/gen_figures.py`, its row, group sentence, figure sentence, image line and install loop in `README.md`, with "twenty-two" skills, and the figure's name in `docs/dev/building.md` and `docs/dev/scripts.md`. Ten files, 680 lines added and 7 removed against base 757fde1.
- Premise corrections: none after the brief check.
- The builder's first report did not pass its bar: the first review gave 13 findings, closed in repair round 1 by ten rulings (`agents/briefs/1-round-1.md`).
- Fixes at landing, three, from the run over round 1: the prompt line of agent 2 in `references/design-it-twice.md` reads "support many uses and extension" (P1); the paragraph under the title of `SKILL.md` gives each mode its own sentence (S1); the "Never substitute" line of `references/report.md` is one sentence (S2).
- Raised to the user: Open item A of the state file, the differences from the two sources that `deviations.md` does not list.
- Verification on main, through `checks.sh`: the 15 commands of the verify list, last line `checks: 15 commands passed`. After the fixes at landing: `LC_ALL=C grep -rn '[^ -~]' skills/code/codebase-design README.md docs/dev/scripts.md docs/dev/building.md` printed nothing, the frontmatter check printed `codebase-design 1020`, and `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/codebase-design.svg (11343 bytes)` and left the figure unchanged.
- The verify list: equal to the verification page's commands; the step changed one sentence of the page and no command.
- The look: `look:` names no place; the figure was rendered to an image and read, and every box and label is inside its frame.
- A/B: no `bench:` line.
- Usage: builder ab12944454eff9c48, 230741 tokens, 25 tool uses, 8.5 minutes for the build, and 263874 tokens, 8 tool uses, 2.2 minutes for round 1; brief check abf99cfe27e48f423, 190305 tokens, 23 tool uses, 5.9 minutes; reviewer aec236c414c8142fa, 207055 tokens, 21 tool uses, 5.8 minutes; reviewer over round 1 a0f46fdedb82ed703, 146291 tokens, 20 tool uses, 2.2 minutes.

## Next

The release candidate `v9.4.0-rc.1` tagged and pinned, then step 2: one `standards` run and one `review` run on a scratch copy of Cathedra, each by a separate agent.
