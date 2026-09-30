# Repair round 1 of step 9a

The review is `.scratch/2-e-grill/agents/reviews/9a-refuter.md`. Items 1 to 13 hold. Three findings are sent back, each with its ruling. Work in the same worktree under the same brief, the rules file and the standards; change nothing else. Each text below is written exactly as given, with the indent its place states.

1. Standards 1, `skills/grill/SKILL.md`: a roadmap diff a quoted ruling states is held out of every round, but no sentence says what happens when it is the only open decision.
   - Steps 4, a new sub-bullet after "A decision that depends on another decision still open waits for a later round." and before the completion line:

     ```
     - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is in no round: it is made at the first write of Steps 8.
     ```

   - Steps 6, a new sub-bullet after "The round ends the turn and waits for the answers ("Stops")." and before the completion line:

     ```
     - When the frontier holds no decision to ask, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.
     ```

   - Steps 6's completion line "The step is done when the message is sent and the turn has ended." becomes "The step is done when the message is sent and the turn has ended, or no decision was left to ask and the skill has gone on to Steps 8."

2. Standards 2: an exception added as a sibling bullet of the rule it changes, against `docs/dev/skill-layout.md`, "Lists and tables" ("a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule"). Each exception below becomes a sub-bullet of its rule, two spaces further in than the rule, with its text unchanged except where stated; each item's completion line stays its last line at the item's own sub-bullet indent.
   - `skills/roadmap/SKILL.md`, "Steps / add" 3: under "A gate that could (...) is redrafted and asked again, at most twice." go "Under a quoted ruling the ruled gate is not redrafted." and, under that one, two spaces further in, "Its answer and its reason stand in the draft." and "A ruled gate that could pass without the goal keeps the stop of Steps 4.". Under "A goal whose gate could still pass after the second redraft is a goal whose gate cannot be named (Steps / add 2)." goes the line "The stop "No gate" is not raised for it." rewritten as "The stop "No gate" is not raised for a quoted ruling's gate.".
   - `skills/ordo-init/SKILL.md`, Steps 2: "Under a quoted ruling that states `roadmap`, the key is the ruling's." and "The stop of several candidates is then not raised." go under "Several candidates are a stop ("Stops").".
   - `skills/plan/SKILL.md`, Steps 2: "Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.", "The rest of this step is worked on that list." and "A closing step in the ruled list is dropped for the one `/plan` writes." go under "The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.".
   - `skills/plan/SKILL.md`, Steps 3: "Under a quoted ruling, the draft is written without the stop only when four things hold." with its four sub-bullets (each moved two spaces further in), "Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands." and "The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file." go under "Write `plan.md` once the user has approved or corrected it.". "A step list written under a quoted ruling is the approved list." goes under "Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.", which moves up to stand directly after the "Write `plan.md` ..." bullet and its sub-bullets.
   - `skills/grill/SKILL.md`, "Steps / Writing what settled" 3: the six sub-bullets from "Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, ..." to "A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision." go under "The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.".

3. Standards 3: the shared item "the quoted ruling", in all five skills (`roadmap`, `plan`, `ordo-init`, `repo-setup`, `grill`). An `add` draft holds the gate's answer with its reason and the lines around its place, which no ruling states, so read by its letter no `add` draft is ever the ruled change.
   - The sub-bullet "A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet." becomes "A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet."
   - Under it, two spaces further in, one sub-bullet:

     ```
     - What the skill shows beside the change, such as a gate's answer with its reason or the lines around a place, is not part of what is compared.
     ```

## Checks

Run from the worktree's root and quote each with its output:

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md` ends `checks: 10 commands passed`, exit 0.
2. Each new or changed text above is in its file once (`grep -c -F`), the shared sub-bullets once in each of the five skills.
3. For each moved bullet, `git diff -U2` shows it under its rule at the rule's indent plus two, and each completion line still last in its item.
4. `LC_ALL=C grep -n '[^ -~]'` over the changed files prints nothing.
5. The walk of case R9 again, with a quoted ruling whose roadmap diff is the only open decision: step by step, each step with the line of `grill` it follows, quoted as `grep -n` prints it, ending with the entry written at Steps 8 and the interview closed at Steps 10.

## Report

Append a section "Repair round 1" to `.scratch/2-e-grill/agents/reviews/9a-report.md` in the worktree: per ruling, the change made with its before and after, then each check with its command and output verbatim, then anything not done.
