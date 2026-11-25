# Step 5, repair round 1

The findings are those of `.scratch/13-researcher/agents/reviews/5-refuter.md`. Each ruling below says what to change in `skills/ordo/ordo-help/SKILL.md`. The paths of the step stay as the brief lists them. No text is dictated: you word each sentence, under the rules file and the standards.

1. Spec 1, the reading with a required key missing. The rule on a missing `plan.yaml` or a missing required key is moved in front of the bullets that match an entry, so that the first-match order reaches it. It names its two exceptions in words: no argument, and a folder named alone, are refused with the key. Every other argument, `<folder>/<entry>` and `<project>/<entry>` included, is then a sentence on what you want to do, and no roadmap is read for it. The Stops row and "What it reads" 4 and 8 say the same, with "a folder named alone" in place of "the folder forms".
2. Spec 2, ruling D33. A title of a roadmap entry with no open plan is no longer read as an entry: it is a sentence on what you want to do, so that `/ordo-help paper` and `/ordo-help wizard` name the skill. Decision 2 of the brief is narrowed to this: only the number of an entry with no open plan, alone or followed by its title, is answered from the roadmap. A title matches an entry only when that entry has an open plan.
3. Spec 3. The number followed by the title is accepted for an entry with no open plan, as for one with an open plan.
4. Standards 1. The two bullets on a folder or a project in front of the rest name the bullets they mean by what each matches, never by "the next three bullets", and both name the same set: an entry with an open plan, the number of an entry with no open plan, and a number that matches no entry.
5. Standards 2. The Rules bullet on what prints no sequence, no choices and no position also names a number that matches no entry.
6. Standards 3. The sentence on the mode says that a placeholder in angle brackets is no mode word: a line such as `/referee <manuscript>` has no mode word, and its mode is what the line's comment says it runs.

Every other sentence of the skill that these changes make false is corrected in the same round: the opening paragraph, Quick start, the description, "What it reads", Steps, Stops, Anti-patterns and Rules, and `README.md` line 22 where it no longer holds. Grep each name you change.

Cases, by reading the new text, each walked through "What it reads" 1 in its order:

- `/ordo-help paper`, `/ordo-help wizard`: a sentence; the skill of that name is printed.
- `/ordo-help researcher`: the position of plan 13, since that entry has an open plan.
- `/ordo-help 4.A`, `/ordo-help 4.A ordo-help skills`: one line that the entry is done.
- `/ordo-help 13` with a `plan.yaml` that lacks a required key: a sentence, answered, with no roadmap read.
- `/ordo-help` and `/ordo-help <folder>` with a required key missing: the refusal with the key.
- `/ordo-help <folder>/37` with no entry 37: the line that no skill fits, by either of the two bullets on a folder in front.
- `/ordo-help I want to review a step`: `/refute` with the mode its comment gives, never `<entry>`.
- Every case of the brief still gives its expected result.

Run the checks of the brief's "Verify before you report" again. Rewrite your report at the same path as the end state of the whole step, with the first reading of these cases on the text as it stood before this round.
