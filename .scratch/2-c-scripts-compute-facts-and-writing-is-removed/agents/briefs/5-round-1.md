# Step 5, repair round 1

The reviewer's report is `.scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/reviews/5-refuter.md` in the main checkout; read it whole first. Each finding below carries the orchestrator's ruling. The brief `agents/briefs/5.md`, the rules file, the path list, the no-git rule and the report path are unchanged.

1. Spec 1: the cost condition on ids, keys and concurrent paths in rule 15 stays, in both change standards: the section's test bullet binds them, and the unconditional wording would contradict it. The untrusted-input sentence ties its case to its cost in the same sentence: each such place is a case, since a wrong answer there runs a command, writes outside its folder or puts the supplied text where it was not meant to go. The report lists both under the user-visible changes (item 13) as changes of rule meaning, for the user's reading.
2. Spec 2 and Standards 3: the exception in the citing bullet of "Where the work happens" stays, in both change standards, and is widened to a "Doc text" entry: it quotes the current line with the number `grep -n` prints, and the quoted text is what locates it. `skills/spec/templates/brief.md` "Report" stays as it is.
3. Spec 3: not sent; a defect of the orchestrator's brief, closed at landing.
4. Proof 1: the report's "Doc text" closing paragraph gives `skills/plan-orchestration/SKILL.md` lines 203-204.
5. Standards 1: `skills/refute/SKILL.md`, the opening paragraph and Steps 6, say each finding has its place: a file and a line in code, a page and its section in a page.
6. Standards 2: `skills/refute/templates/report.md`: every finding placeholder `<file:line>` becomes `<file:line, or page and section>`.
7. Standards 4, first pair: `skills/repo-setup/templates/shared-rules.md` line 5 says to cite `file:line` for code and the section for a page. Second pair: not sent; "A failing check is a finding" is about a check of the verify list and the tests, and the new rule's helper-script clause is about a script's indication, so they do not collide.
8. Standards 5: `skills/plan-orchestration/SKILL.md`, "The recurring-findings pass": the check bullet becomes a bullet with sub-bullets, one requirement each.
9. Standards 6: `skills/plan-retro/SKILL.md`, item 4's label reads "Whether the rule is kept is a fact a machine computes."
10. Standards 7: `docs/dev/building.md`, the sentence says a file that is not valid UTF-8 makes the check exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line.
11. Standards 8: the `plan-retro` description names a change to the text that should have prevented the defect beside the rule sentence and the page; the "Doc text" items 2 to 4 of the report do the same.
12. Behaviour 1: the report gains a section "User-visible changes", each with before and after: `/repo-setup sync` on a repository carrying the current shared-rules block (exits 1 with a diff until synced), what a new repository gets, the ASCII check on an untracked `.pyc` and the `__pycache__/` line, the ASCII check on a file that is not UTF-8, and the changes of rule meaning in rules 1, 6, 13 and 15 of both change standards.
13. "Declined to judge", the word "script" in the template change standard and the shared rules: not sent; raised to the user as an open item, and applied at landing as the user rules.

After the changes: rerun the verify list through `checks.sh` as the brief says, the new ASCII command on the clean tree and on the `\377\376` file, and the ASCII grep over the changed files. Append to the same report a section "Repair round 1" with each item's change, the command that shows it and its output verbatim, and the updated line counts.
