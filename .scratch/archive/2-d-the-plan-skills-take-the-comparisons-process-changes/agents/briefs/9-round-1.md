# Step 9, repair round 1

The reviewer's report is `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/9-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `agents/reviews/9-round-0.diff` there, the new files included. Each point below carries the orchestrator's ruling. The brief, the rules file, the no-git rule and the report path are unchanged. The path list gains one path, for point 6: `skills/plan-orchestration/SKILL.md` (the version line and the line of "The pace when a deadline is set" that says "fix round").

1. Spec 1 (entries that restate a rule). An entry says what the term names and points at the section that states the rule; it never carries the rule's numbers, thresholds or conditions. In `plan-terms.md`:
   - A/B: drop "run alternately after warm-ups, at least ten runs each".
   - acceptance item: drop the clause after "What to build"; the entry is the requirement and its "Stated in".
   - dead builder: drop "it is reported to the user, and a continuation builder takes over its worktree only when the user says so".
   - kind: replace "a kind is recurring when it appears in at least three steps or two plans" with "a kind is recurring when its count reaches the threshold that section states".
   - night rule: drop the clause after "may run".
   - recurring finding: drop "every tenth landed step and at any pause," and replace "finds in three or more steps" with "finds across steps".
   - repair round: drop "the round cap allows at most `repair_rounds`, and one more only when the delta leaves a verification command red or an acceptance item unbuilt with a fix too large for landing", and say instead that the number of rounds is the round cap in `plan-orchestration`, Rules.
   - shared path: replace "allowed only when the orchestrator judges the merge at landing simple and names it" with "which the later step's dispatch entry names".
   - Then apply the same test to every other entry of the file, and remove each number, threshold or condition of a rule that an entry carries in the same way. The report lists every entry changed under this point, old beside new.
2. Spec 2 (two entries that state what their section does not):
   - base: drop "; the base binaries are the build `/spec` stages from it for the A/B", and drop Steps 8 from its `spec` source (it then reads `spec`, Steps 6 and 7).
   - dispatch block: its "Stated in" becomes `spec`, Steps 9; `plan`, `templates/orchestrator-state.md`. The definition stays.
3. Spec 3, "stop": add the sense of ending a running agent through the runner's stop tool, with "Stated in: `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set"."
4. Spec 3, "refuter": the reviewer entry says the reviewer is also called the refuter, and adds `plan-retro`, the introduction, to its sources.
5. Declined to judge, semicolons and entry length. A definition is running prose under prose standard B; a "Stated in" list is a one-line data row. Rewrite each definition without semicolons, using full stops, and keep each sense of an entry to at most two sentences plus its "Stated in". Every fact an entry keeps after points 1 to 4 is kept.
6. Spec 3, "fix round": the fix is one name for one thing, so the skill's word changes, not the glossary. In `skills/plan-orchestration/SKILL.md`, "The pace when a deadline is set", "A reviewer or a fix round is dispatched" becomes "A reviewer or a repair round is dispatched", and the version goes from 2.10.0 to 2.10.1. `docs/academic-coverage.md` line 98 is a different sense (a vision model's rounds) and stays.
7. Standards 1 ("plan skills" used wider than its entry). The entry stays as it is, since `ordo-init`'s introduction lists the same six skills. The two texts change:
   - `skills/repo-setup/templates/docs/glossary.md`, the paragraph: "The plan skills' terms stand in the block below" becomes "The terms the plan skills, `roadmap`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below". The rest of the paragraph stays.
   - `skills/repo-setup/templates/CLAUDE.md`, the `docs/glossary.md` bullet: "the terms of this repository and of the plan skills, each in the sense the repository uses it" becomes "the terms this repository and the skills it is set up with use in a sense of their own, each defined once".
   - `docs/glossary.md`'s own paragraph already says "the Ordo skills" and stays.
8. Standards 2 (sync items 4 and 7 both apply when two lines print). `skills/repo-setup/SKILL.md`, "Steps / sync" item 7 becomes: "Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names. A no-single-block line of the same run is still drafted, as step 4 says." Its two sub-bullets stay. The version goes from 1.2.0 to 1.2.1; the description does not change.

After the changes:
- rerun `checks.sh` from the worktree root, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` (the Ordo glossary's block must still equal `plan-terms.md`, so `docs/glossary.md` carries every change of points 1 to 5), the length command and the ASCII grep;
- count the semicolons of `plan-terms.md` outside the "Stated in" lists and its words, and give both numbers with the command;
- grep `plan-terms.md` for "at least", "every tenth", "three or more" and "only when", and quote the output.

Append to the same report a section "Repair round 1" with each point's change, old beside new, the command that shows it and its output verbatim, and the updated line counts.
