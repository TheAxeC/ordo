# Step 9, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/9-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/9-round-0.diff` there. The findings are in text the brief dictated, so this round replaces that text. The rules file, the no-git rule and the report path are unchanged; the paths widen to the files named below. Every text is written exactly, with plain quotes, one line per bullet or table row. Line numbers are the worktree's as it stands now.

The approval exception moves from a separate Rules bullet into the stops it excepts (Standards 2, skill layout "Lists and tables": an exception stays with its rule), through one glossary term, **approved by a ruling**, that carries the mechanics once: the invocation quotes the ruling, the draft is the change it stated, and the commit names it (Spec 3). `/plan` gets the same exception (Spec 2). An approval of work not yet done stays a stop (Spec 1).

1. Spec 3, Standards 2: remove the bullet "- A change whose content the user already approved in full, by a ruling on an open item that stated it, is written without stopping for approval again, and the report names that ruling." from `skills/roadmap/SKILL.md`, `skills/ordo-init/SKILL.md` and `skills/repo-setup/SKILL.md`.

2. The term, in `skills/repo-setup/templates/plan-terms.md`, a new line after the line of **acceptance item**, exactly:

   "- **approved by a ruling**: a change whose content a ruling of the user on an open item stated in full, when the invocation quotes that ruling and the drafted change is the change it stated. The skill writes it without its approval stop and names the ruling in the commit message. Stated in: `plan`, Steps 3; `roadmap`, Steps 4; `ordo-init`, Steps 11; `repo-setup`, Steps 4 and Steps / sync 6."

   Then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` writes it into `docs/glossary.md`.

3. `skills/roadmap/SKILL.md`:
   - Steps 4 becomes exactly "4. Write the change once the user approves or corrects it ("Stops"), or at once when it is approved by a ruling."
   - The Stops row "The change": its When cell becomes exactly "Every change of `add`, `move`, `done` or `drop`, at Steps 3, unless it is approved by a ruling".

4. `skills/ordo-init/SKILL.md`:
   - Steps 11 becomes exactly "11. Stop for the approval ("Stops"), unless the draft is approved by a ruling."
   - "Checking an existing file" 5 becomes exactly "5. Make each fix the user approved, or that is approved by a ruling."
   - The Stops row "The draft": its When cell becomes exactly "Every setup, at Steps 11, unless the draft is approved by a ruling".
   - The Stops row "A fix in the check": its When cell becomes exactly "The check reports an error in an existing file, and the fix is not approved by a ruling".
   - Rules, the first bullet, becomes exactly "- The skill writes nothing until the user approves or corrects the draft, or the draft is approved by a ruling. The one exception is Steps 3, where each verification command runs once before the draft is shown."

5. `skills/repo-setup/SKILL.md`:
   - Steps 4 becomes exactly "4. Show the draft, the tree and every file's text together ("Stops"), unless the draft is approved by a ruling."
   - Steps 5 becomes exactly "5. Write the files the user approved, or the draft approved by a ruling."
   - "sync" 6 becomes exactly "6. Write it once the user approves, or at once when it is approved by a ruling."
   - The Stops row "The draft": its When cell becomes exactly "Every setup, at Steps 4, unless the draft is approved by a ruling".
   - The Stops row "The drafted sync change": its When cell becomes exactly "`sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, unless the change is approved by a ruling".
   - Rules, "In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4)." becomes exactly "- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft, or the draft is approved by a ruling (Steps 4)."

6. Spec 2, `skills/plan/SKILL.md`:
   - Steps 3's sub-bullet "   - Write `plan.md` once the user has approved or corrected it." becomes exactly "   - Write `plan.md` once the user has approved or corrected it, or at once when the step list is approved by a ruling."
   - The Stops row "The drafted step list": its When cell gains at its end, after "the design half", exactly ", unless the step list is approved by a ruling".

7. Spec 1, `skills/plan-orchestration/SKILL.md:298`: the sub-bullet is replaced by two sub-bullets, exactly:

   "  - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes, a change to the configuration or the verification list, or a diff the user must see; the user's ruling on the item then approves them too, with no second stop."
   "  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own."

   And `skills/spec/SKILL.md:193` is replaced by two sub-bullets at its indentation, exactly:

   "     - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes, a change to the configuration or the verification list, or a diff the user must see; the user's ruling then approves them too."
   "     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own."

8. Standards 3, Standards 1, Spec 4: `skills/roadmap/SKILL.md` lines 158-159 become three bullets, exactly:

   "- A goal names another repository only where the entry reads or changes it, such as the source of a migration."
   "- A gate and a dependency name another repository only under the same condition, such as the target of a switch-over or the repository a gate runs on."
   "- A file or folder in another repository is written as its path from the folder that holds this repository, such as `<other-repository>/tools/scripts`, the one exception to the next rule; a quoted command and its output keep the paths they had."

9. Spec 5: the report's "Open items" section quotes the state file's two open items verbatim, and the reading cases get their first read on the unchanged tree (`git show <base>:<path>`), noted in the round section.

After the changes, rerun from the worktree root: the brief's cases, with these changes to them: the "already approved in full" grep now expects nothing in `skills`; `git grep -n "approved by a ruling" -- skills docs` expects the term in `plan-terms.md` and `docs/glossary.md` and the uses in `plan`, `roadmap`, `ordo-init` and `repo-setup` (list each line); `git grep -n "names another repository" -- skills` expects nothing, and `git grep -n "another repository" -- skills/roadmap/SKILL.md` the three bullets; `git grep -n "research-hub" -- skills ':!skills/repo-setup/templates'` expects nothing; the diff-stat case lists the files and counts it prints. Then the ASCII grep over every changed file, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`, quoted verbatim.

Reading, over the new text: each changed stop with its exception in the same row or step; `ordo-init`'s Rules first bullet against its Steps 11; the term against each place that uses it; the two new `plan-orchestration` sub-bullets against plan.md's ruling "Overnight work" 2 (a reading step stays unticked until Axel approves). Say what was read against what.

Append to the same report, `.scratch/2-e-grill/agents/reviews/9-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings. Your final message is that section.
