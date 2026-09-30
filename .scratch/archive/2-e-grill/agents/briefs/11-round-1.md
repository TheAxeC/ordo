# Step 11, repair round 1

The reviewer's report is `.scratch/2-e-grill/agents/reviews/11-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `.scratch/2-e-grill/agents/reviews/11-round-0.diff` there. The findings are in text the brief dictated, so this round replaces that text. The rules file, the no-git rule (with the same scratch-repository exception as the brief) and the report path are unchanged; the paths widen to the files named below. Every text is written exactly, with plain quotes, one line per bullet or table row. Line numbers are the worktree's as it stands now.

1. Spec 2, the status test. In each of these places, the words "whose status does not read `superseded by NNNN`" become exactly "whose status, or whose opening lines, do not say it is superseded by another record":
   - `skills/spec/SKILL.md:50` and `:239`;
   - `skills/refute/SKILL.md:40`;
   - `skills/plan/SKILL.md:40`;
   - `skills/spec/templates/brief-check.md:43`.

   And in `skills/spec/SKILL.md:86` and `:262`, "an ADR that is not superseded" and "an ADR the step touches that is not superseded" keep their words; in `skills/refute/SKILL.md:98` likewise.

   In the term **ADR** (`skills/repo-setup/templates/plan-terms.md:5`), "A record is in force, `proposed` or `accepted`, until its status reads `superseded by NNNN`." becomes exactly "A record is in force, `proposed` or `accepted`, until its status or its opening lines say it is superseded by another record, in whatever form the repository writes it, such as `Status: superseded by NNNN` or a quoted line `Superseded by ADR NNNN`."

2. Spec 6: `skills/spec/SKILL.md:239`, "in the folder the configuration block's `adr` names" becomes "in the folder the configuration block's `adr` names (`docs/adr` when the block has none)"; `skills/spec/templates/brief-check.md:43`, "in the configured `adr` folder" becomes "in the configured `adr` folder (`docs/adr` when the configuration block has none)".

3. Spec 1: `skills/spec/SKILL.md`, "Steps / A ruling" item 2: after the bullet "   - a ruling that sets a public shape, a vocabulary, a rule or a library choice is also written where the plan keeps its rulings, ..." add, at the same indentation:

   "   - a ruling that answers a rule clash with a new ADR is carried out before `/spec` runs again: the session writes the new record from the ADR folder's `template.md` with the ruled decision and status `proposed`, sets the old record's status to `superseded by NNNN`, and adds the new record's row to the folder's `README.md`; the three files go into the next preparation commit;"

4. Spec 3 and Standards 3: `skills/plan/SKILL.md:76` becomes exactly:

   "   - The commit also removes the rulings file copied at Steps 2: when git tracks it, `git rm -q -f -- <path>`, and its path named in the commit with the others; when git does not, the file deleted before the commit. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied."

5. Spec 4: `skills/plan/SKILL.md:51`: after "; the file's other lines, such as a heading or a blank line, are not copied." append, in the same bullet, exactly: " Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3, so the user places it before the file is removed."

6. Spec 5: `skills/spec/templates/brief.md`, section "What is on the tree": after the bullet "- <each fact the step rests on: ...>." add exactly:

   "- <each ADR the step touches: its number, its title and the sentence of its Decision the step is under; or that no ADR touches the step>."

   And `skills/spec/SKILL.md:98`, "   - The premises as checked, with the command that checked each." gains a new bullet after it, at the same indentation, exactly: "   - The ADRs the step touches, as Steps 2 names them."

7. Standards 1: the term **rule clash** in `skills/repo-setup/templates/plan-terms.md`: its "Stated in:" ending "; `spec`, Steps 2 and Stops; `refute`, "The four headings" and "Finding dispositions"" becomes exactly "; `spec`, Steps 2, "Steps / The brief check" and Stops; `refute`, "Finding dispositions"". Then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`.

8. Standards 2: "A change that contradicts an ADR is a rule clash" becomes "A step that contradicts an ADR is a rule clash" in `docs/adr/README.md:5`, `skills/repo-setup/templates/docs/adr/README.md:5` and `skills/repo-setup/templates/CLAUDE.md:22`, with no other change to those lines. `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md` still prints nothing.

9. Proof 1: the report's scratch section says that `$TMPDIR/s11/scratch.sh` encodes the builder's reading of the text and does not read `skills/plan/SKILL.md`, so the reading, not the script, is the evidence for the text; then redo the scratch case for the new Steps 6 with a fourth mode, a tracked rulings file with an uncommitted appended bullet `- G3: the scratch answer three (the user).`: Rulings holds G1, G2 and G3, `git rm -q -f` exits 0, the commit's `--name-status` lists `D .scratch/rulings/7-scratch-entry.md`, and `ls` of the file fails.

After the changes, rerun from the worktree root: `git grep -n "superseded by NNNN" -- skills docs` (expect only the template's status line, `docs/adr/README.md:5` and its template copy, the two `Status:` examples, "Steps / A ruling"'s new bullet and the term's example; list each), `git grep -n "A change that contradicts an ADR" -- skills docs README.md` (expect nothing), the glossary sync check, the ASCII grep over every changed file, `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md`, the four scratch modes, and the verify list as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`, quoted verbatim.

Reading, over the new text: a cathedra-style record whose first lines are "> **Superseded by ADR 0033**" with no Status line (not in force for all readers); a `Ruled: new ADR supersedes 0001` followed by `/spec` again (the new record exists, 0001 reads `superseded by 0002`, `/spec` no longer stops on it); the term **rule clash** against each place its "Stated in" names. Say what was read against what.

Append to the same report, `.scratch/2-e-grill/agents/reviews/11-report.md` in the worktree, a section "Repair round 1" with each point's change, old beside new, the commands with their output verbatim, and the readings. Your final message is that section.
