# Step 6: rulings on the cases the brief's rules get wrong

The rulings on the hand-back `agents/reviews/6-cases-handback.md`, each inside the step's scope and the written rules. They join the brief: where a ruling and the brief differ, the ruling holds. Build the whole brief with them, and carry each ruling into the report under the item it changes.

## A. The recurring-findings pass

Ruled (a). In "The recurring-findings pass", lines 209 and 216 say: a proposal whose change is a rule sentence in the rules file, a standards page or the shared rules, or a check (a command in the verification list, or a script), is kind 3 and waits for the user; any other proposal is closed under self-rule as "Self-rule" says. Line 215 stays as it is. The reason: line 215 and the rules file's "A new script needs the user's approval of what it computes before it is written" keep a check's approval with the user, and a check's command joins the `verify:` list of the configuration block, which kind 3 already names.

## B. A "(self-rule)" bullet replaced outside a review

Ruled (a).

- `plan-orchestration` "Self-rule", "The choices file", states once, for a bullet ending "(self-rule)" that a ruling of the user replaces outside a review (a `Ruled:` reply, or `/grill`): the old bullet's ending is rewritten to "(self-rule, replaced by <the ruling's name>).", its choice leaves the choices file, and the Closed items of its plan gain `- <date>: C<n>: replaced by <the ruling's name>.`
- `spec` "Steps / A ruling" 2 gains one sentence: a ruling that replaces a bullet ending "(self-rule)" is booked as `plan-orchestration`'s "Self-rule", "The choices file" says.
- Each of `grill`'s two new sub-bullets (Steps 3 at line 113, and "Steps / An answer that contradicts" 1 at line 214) gains one sentence pointing at the same place for the choice's removal and the Closed items line.

## C. `C<n> =>` and the steps of `Builds on it:`

Ruled (a).

- A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling, and its tag too, to `(ruling C<n> <the decision, as a phrase>)`, when the tag names the old bullet. A step tagged `(approved)` keeps its tag.
- At the landing of a step whose tag or Step 0 names a bullet ending "(self-rule, replaced by C<n>).", the orchestrator adds its fix step in the form item 1.6 gives. "Self-rule" states this, and `plan-orchestration` Steps 9 gains a sub-bullet pointing at it.

## The sentences outside the brief's list

- `skills/plan-orchestration/SKILL.md:298`, the Stops row "A finding that is the user's": carry it, with the same replacement as lines 57, 258, 267 and 346.
- `skills/land/SKILL.md:214`, "A landed commit is reverted only on the user's ruling.": under ruling B (2), removing a step the user approved is kind 3. The line becomes: "A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`, on a choice `plan-orchestration`'s "Self-rule" books when the step's authority is a bullet ending "(self-rule)" alone; the revert of a step the user approved, or one a ruling of the user added, is kind 3." The kind 3 text of "Self-rule" names the revert of such a landed step beside the removal of an approved step.

## The open items the report quotes

Quote the open items from the state file in the main checkout, `/Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, read only; the worktree's copy is older. Open item C there is ruled and closed, and the file lists no open item.
