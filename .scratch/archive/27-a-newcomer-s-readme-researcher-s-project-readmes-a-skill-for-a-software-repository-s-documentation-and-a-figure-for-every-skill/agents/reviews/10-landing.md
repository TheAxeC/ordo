# Landing of step 10

Roadmap entry 27, a newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill: step 10 of 10, researcher's rule for `.depositignore` and two gaps of `handbook`, landed. Next: step 8, the tag v11.2.1 and its pin after Open item N, then the reruns.

## Open items

- Open item N, step 10's check: the user reads the changed text of step 10 against the two runs' findings and approves.
  - What changed: `skills/academic/researcher/references/project_layout.md`, "The deposit" (the four anchored folder lines, `secrets/` unanchored, the rule for a `.depositignore` that exists, the made-up example); `researcher`'s readme item 3; `skills/code/handbook/references/kinds.md` (`untested`); `skills/code/handbook/SKILL.md` Steps 2, 3, 5, the new Steps 8, Steps 9 to 12, the Stops, the Rules, the description; ADR 0058; the glossary lines 148, 167 and 191; `docs/figures/code/handbook.svg`.
  - (a) Approve the text as landed: then tag v11.2.1 at main, pin it, and run the three reruns of rulings L and M. Pro: the reruns read the text you approved. Con: none found.
  - (b) Correct it: the corrections are made at main, then (a). Pro: the reruns read the corrected text. Con: a further commit before the tag.
  - Recommendation: (a) once you have read it, since the reviews found nothing left open. The lazy option: tagging before your reading.

## The landing

- Agents stopped before the landing: ListAgents listed no agent of step 10 running (its last reviewer completed).
- NOT DONE: nothing inside the brief.
- Verification on main: `checks: 16 commands passed`, after the cherry-pick and again after the fixes at landing.

- Landed: `references/project_layout.md`, "The deposit", writes `/data/`, `/attic/`, `/results/` and `/figures/` anchored and `secrets/` unanchored, and holds once the rule for a `.depositignore` that exists (a folder line had only by a line that excludes the whole folder, a `!` line having nothing, the added lines above the first `!` line), with a made-up example; `researcher`'s readme item 3 names that section. `handbook`'s `references/kinds.md` gains `untested`; `handbook`'s `SKILL.md` gains Steps 8, the repository's format and lint commands run on a copy of its working tree in the scratch folder before and after the drafts, at most three rounds, a drafted exclusion for a generated file, and a search of each linked folder after each run; Steps 9 to 12 renumbered; ADR 0058 edited to its current state; the glossary lines 148, 167 and 191; the `handbook` figure with the step and its return. Files: 8, 222 insertions and 125 deletions by `land.sh`'s stat, before the fixes at landing.
- Premise corrections: the step line's version clause (a plan raises a skill's version once, `docs/dev/skill-layout.md`), `secrets/` left unanchored, the rule for a line already had, and the copy of the working tree, each in `plan.md` before the brief, with the brief check's findings closed under "Closed" in `agents/reviews/10-brief-check.md`.
- The plan's verify list is unchanged: the step did not change `docs/dev/building.md`.
- Fixes at landing, the findings of the run over round 1 and one gap of the round (`agents/reviews/10-refuter.md`, "Closed"): the search after each run with a fresh marker, so the drafts stop names the command that wrote a file; the cache bullet kept from contradicting `ruff check`; two long bullets split; the Rules bullet on writes.
- Raised: Open item N, the user's reading of the changed text, the step's check.
- Verification on main: `checks: 16 commands passed`, by `land.sh` after the cherry-pick and again after the fixes at landing; `git grep -n -e '^data/$' -e '^results/$' -e '^figures/$' -e '^attic/$' -- skills/academic/researcher/` prints nothing.
- The builder's first report did not pass its bar: one repair round of five rulings (`agents/briefs/10-round-1.md`); the run over the round found three findings, fixed at landing.
- Usage: brief check 165475 tokens, 36 tool uses, 8 min 36 s; builder 203519 tokens, 51 tool uses, 10 min 41 s, and round 1: 235462 tokens, 20 tool uses, 3 min 7 s; reviewer 187333 tokens, 36 tool uses, 7 min 17 s; reviewer over round 1: 123000 tokens, 26 tool uses, 2 min 38 s.

