# Step 1, repair round 1

The reviewer's report is `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/1-refuter.md` in the main checkout; read it whole first. The tree as it stood when the round was sent is `agents/reviews/1-round-0.diff` there. Each finding below carries the orchestrator's ruling. The brief, the rules file, the path list, the no-git rule and the report path are unchanged.

1. Spec 1: the builder's scope stands: the section "Writing for an agent" applies to a skill's text when it is written or rewritten, and roadmap entry 23 applies it to every existing skill. The brief's "This page's rules" would have put the page's existing layout rules under that condition, which is wrong. The Frontmatter rules on the description bind every skill now; the report lists each of the ten descriptions against them, its first words quoted.
2. Spec 2: the builder's first bullet stands; it states what the brief asked.
3. Spec 3: not sent; raised to the user as open item A, and applied at landing as the user rules.
4. Spec 4: the fifth bullet of "Writing for an agent" gains this clause: reference material goes in `references/`, never in `templates/`, which holds the files a skill copies into a repository or runs from its own folder.
5. Standards 1: row 6 of "Sections, in order" states the limit in its cell by pointing at the section: "... material the steps point at that every run reads (a script, a file format, a launch command); material only some runs need goes in `references/`, as "Writing for an agent" says."
6. Standards 2: the introduction says every `SKILL.md` follows this layout, and that the section "Writing for an agent" binds a skill's text as that section's last bullet says. The report lists the introduction under the reread of rule 14 with the line that shows it holds.
7. Standards 3: the third and the last bullet of "Writing for an agent" lose their semicolons: each becomes two sentences, the words otherwise unchanged. The page's running prose keeps at most 2 semicolons per 1000 words; the report gives the count before and after with the command.

After the changes: rerun the verify list through `checks.sh`, the length command and the ASCII grep. Append to the same report a section "Repair round 1" with each item's change, the command that shows it and its output verbatim, and the updated line counts.
