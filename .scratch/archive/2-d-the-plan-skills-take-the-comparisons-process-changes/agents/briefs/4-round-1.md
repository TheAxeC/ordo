# Step 4, repair round 1

The reviewer's report is `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/4-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `agents/reviews/4-round-0.diff` there. Each point below carries the orchestrator's ruling. The brief, the rules file, the no-git rule and the report path are unchanged; the path list gains `skills/plan/templates/plan.md` for ruling 4.

1. Spec 1 (the anchor of `move`): "Steps / move" 1 and its Stops row refuse a `move` when either entry, the one moved or the one it is placed before or after, stands under "Not yet specified", naming `/roadmap add <entry>` for the one that does.
2. Standards 1 (the template's introduction): the sentence reads "An entry of the open order is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on.", so the next paragraph on "Not yet specified" is the only statement about those entries.
3. Standards 2 (the description as a trigger): the description quotes the section name ("Not yet specified") and is rewritten so each item of its list reads as one item, with no "and" before a non-final item; `Triggers on:` gains a phrase for each of the two new cases, such as "not yet specified", "park on the roadmap until its gate is known" and "name the gate of an entry". It stays at most 1,024 characters by the gate's length command.
4. Standards 3 (where the answer is written):
   - `/roadmap`: the answer and its reason are written in the draft Steps / add 6 shows, and never in the roadmap entry, whose form stays goal, gate and what it waits on. Steps / add 3's completion criterion names that place.
   - `/plan`: the answers are written in `plan.md`, in the section "## Gate", as one line for the gate and one line per step, each "could this pass without the goal being reached?" answered with its reason; step lines keep their shape, ending with their authority tag. `skills/plan/templates/plan.md` "## Gate" shows that form with a placeholder for the gate and for a step. `/plan` Steps 2 names that place, and Steps 3's show and the Stops row read it from there.
   - For a step's check, the question keeps the ruled words, and the text says "the goal" there is the part of the goal the step delivers; one clause, in `/plan` Steps 2.
5. Standards 4 (long sentences, one meaning in one place):
   - "Steps / add" 1's sub-bullet becomes three bullets: the title and goal are that entry's; the draft moves it out of "Not yet specified" to the place of Steps / add 5, with the gate of Steps / add 2 and 3 and what it waits on; it keeps its number.
   - "Steps / add" 2's second sub-bullet is rewritten so the verb comes before the quoted labels, for example "At that stop the user may put the entry under "Not yet specified": it is drafted in the form of "The format is the file's", bullet "Not yet specified", and the draft goes to Steps / add 6 without Steps / add 3 to 5."
   - Rules bullet 2 keeps its rule about this skill's entries and drops the clause about `/plan`, which `skills/plan/SKILL.md` states.
   - "Steps / Show" 3 reads "After naming the next one, list every entry under "Not yet specified", ..." so it cannot be read as a filter by number.
   - Each other sentence the step wrote is read against prose standard E and cut where it runs past the mechanism's need.
6. Declined to judge, second point (numbering): "The format is the file's" says an entry put under "Not yet specified" takes the next number free in the file, as the "Numbering" bullet gives numbers, and keeps it when it moves to the open order.
7. Declined to judge, first point (what "the goal" is for a step's check): settled by ruling 4's last bullet.
8. Declined to judge, third point (README, `plan-help`, `check_coverage.py`): not sent; the README and `plan-help` lines are applied by the orchestrator at landing from the report's "Doc text", and `check_coverage.py` is outside this step.

After the changes: rerun the verify list through `checks.sh`, the length command and the ASCII grep, and read the four cases again against the new text. Append to the same report a section "Repair round 1" with each item's change, the command that shows it and its output verbatim, the new text quoted, and the updated line counts.
