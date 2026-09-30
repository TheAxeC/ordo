# Step 14, the key of the blind comparison

- The input: roadmap entry 3 of `docs/roadmap.md`, in two identical clones of this repository at 833e2e8 (the commit before step 13's interview), origin removed, in the session's scratch folder `bc14/side-1` and `bc14/side-2`.
- side-1 is the new skill: `grill`, from `skills/grill/` of the clone, invoked as `/grill 3`.
- side-2 is the skill compared against: mattpocock's `grill-with-docs` (github.com/mattpocock/skills at d81f3a1, `skills/engineering/grill-with-docs/` with `skills/productivity/grilling/` and `skills/engineering/domain-modeling/`), invoked as `/grill-with-docs roadmap entry 3 of docs/roadmap.md`.
- Each side ran as a fresh agent on claude:opus with only its clone and its skill; the user was not available, so each side ends at its first message to the user and is judged on it, as `docs/dev/blind-comparison.md` item 1 says.

## Second run

- The input: roadmap entry 3 of `docs/roadmap.md`, in two identical clones of this repository at 833e2e8 with `skills/grill/` as landed at 32a0107, committed in each clone, origin removed, in the session's scratch folder `bc14r/side-1` and `bc14r/side-2`.
- side-1 is the new skill: `grill` 1.2.0, invoked as `/grill 3`.
- side-2 is the skill compared against: mattpocock's `grill-with-docs` at d81f3a1, with `grilling` and `domain-modeling`, invoked as `/grill-with-docs roadmap entry 3 of docs/roadmap.md`.
- Each side ran as a fresh agent on claude:opus with only its clone and its skill, with the prompts of the first run.
- `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'` printed `new is A`: judge 5 had side-1 as A, judge 6 had side-2 as A.

