# Round 1 of step 1: the findings of the review, each with its ruling

Read `.scratch/19-codebase-design/agents/reviews/1-refuter.md` for the findings in full. Each ruling below says what to change. The brief `agents/briefs/1.md` and every rule of the first build still hold. Change nothing these rulings do not name.

## Rulings

1. Finding 1.2, a language page of the coding standards. The coding standards are held page by page: the common page is one subject, and each language page is a subject of its own. A repository that uses a language and has no rules for that language in its pages lacks that language's page, so `standards` drafts it and `review` holds the code to the default page of that language and says so. Change "What it reads" 4 and 7, "Steps / standards" and "Steps / review" 4 so that this follows from the text, and the README row where it counts the subjects.
2. Finding 1.4, the subjects the repository lacks. Wherever the skill and `references/report.md` list or name the subjects a repository lacks, they mean the subjects that apply ("What it reads" 7) and that no page of place 1 or 2 holds. A repository with no user interface never has the UI standard named as lacking.
3. Finding 1.3 and Proof 2.1, two more places. `docs/dev/scripts.md`, the row of `docs/figures/gen_figures.py`: add `codebase-design.svg` to the figures it lists. `README.md`, the sentence that lists the skills that start every agent on the runner's default agent with the runner's defaults: add `codebase-design`. Then grep `code-comments` across `README.md`, `docs/` and `utils/`, read every hit, and change each further sentence that lists the skills, the figures or the skills that start agents and that the step makes false or incomplete. The report lists every hit read, with what was done.
4. Finding 1.5, the folder of a new ADR. In "Steps / review" 12, a repository with no ADR folder gets it at the path the `adr` key of its `plan.yaml` names when it has one, and otherwise at `docs/adr/`.
5. Finding 1.6, the glossary for the call with no mode. The glossary and the ADRs of "What it reads" 8 are read wherever `references/design-it-twice.md` is followed, the call with no mode included. Change "What it reads" 8 and "Steps / The call with no mode" 3.
6. Finding 3.3. The paragraph under the title holds at most three sentences, as the skill layout's row 1 says, and still names both modes, the call with no mode and what each leaves behind.
7. Finding 3.4, the ADR offer as a stop. The Stops table gets a row for the offer of "Steps / review" 12, and the bullet under the table that speaks of it goes. The figure shows that stop as it shows a stop that happens only in some runs: change its labels in `docs/figures/gen_figures.py`, run the script, and change the image line of `README.md` to the figure's new label.
8. Finding 3.6, the prose standard in the reference pages. Bring the running prose of the four reference pages within the prose standard's limit on semicolons, and replace "typically" and "many uses" by the specific claim, keeping the sources' content and order.
9. From the builder's difference 9, the source's list for the grilling. "Steps / review" 11 gives `/roadmap add` a goal that names, for the picked candidate, its constraints, its dependencies with their categories, the shape of the deepened module, what sits behind the seam and which tests survive, so that `/grill` settles each.
10. The `projects:` form. In "Steps / standards" 6, a new page is added to the `standards` list of the project whose pages it stands beside, and the draft names that project.

Not sent: finding 3.5, "a good stretch back", stays as the source has it. Finding 1.1 is the orchestrator's: the order of the three parts and the option to pick no candidate go to the user as deviations.

## Paths this round adds

- `docs/dev/scripts.md` line 9
- `README.md` line 135
- any further line ruling 3's reading finds, named in the report

## Verify before you report

Run every check of the brief's "Verify before you report" again, with `docs/dev/scripts.md` added to the character-set check's file list.

## Report

Append a section "Round 1" to `.scratch/19-codebase-design/agents/reviews/1-report.md`: one line per ruling with what changed and where, the hits of ruling 3 each with what was done, the checks with their output as printed, and anything NOT done first.
