# Landing of step 6 of roadmap entry 27

Roadmap entry 27, a newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill. Step 6 of 9, Ordo's README for a newcomer, landed. Next: step 8, which waits on Open item J and on your naming the tag, the two projects and the software repository.

## Open items

- Open item J (2026-11-26), step 6's check: your reading of the new `README.md`. Step 6 is booked and on main. Read `README.md` (151 lines) and `docs/dev/working-on-ordo.md`. One point to look at: the subsection `` #### `plan.yaml` `` is 1891 characters of text, against the brief's about 1500, since the review over the round asked for two facts back (the `.agents/plan.yaml` advice both ways, and when the cost script runs).
  - (a) Approve the README as it stands. Pro: step 8's pin follows, and the pinned tag carries this README. Con: none known.
  - (b) Name what is wrong; it is fixed on main before the pin. Pro: a sentence that misleads a newcomer is fixed before the tag. Con: step 8 waits for the fix.
  - Recommendation: (a), in my judgment, since two reviewers read the README against the brief and every finding of the last review is fixed on main; the lazy option is (a) if you have not read it, since only your reading is the step's check.

## The check of Steps 1

The runner's agent listing showed no agent of the step left: the builder and both reviewers had finished.

## NOT DONE

Nothing inside the step. The step's check is your reading of the README, Open item J.

## What landed

`README.md` rewritten for a newcomer (151 lines, 17931 bytes, against 270 and 76528), `docs/dev/working-on-ordo.md` new, and the citations in `docs/dev/change-standard.md`, `docs/glossary.md` and ADR 0044 naming the new page.

## What was found

The first review found four Spec findings and two Standards findings, sent to the builder in repair round 1. The run over the round found six findings, all fixed on main at landing (`agents/reviews/6-refuter.md`, "Closed").

## Verification on main

`checks: 16 commands passed`, by `land.sh` after the cherry-pick and again after the fixes at landing. The README holds three images, each path exists, and `git grep -n --untracked 'Working on Ordo' -- ':!.scratch'` prints only `docs/dev/working-on-ordo.md:1:# Working on Ordo`.

## Usage

The builder's first report did not pass its bar: one repair round. Brief check 187448 tokens, 40 tool uses, 8 min 16 s; builder 256957 tokens, 58 tool uses, 11 min 39 s, and round 1: 257053 tokens, 96 tool uses, 20 min 37 s; reviewer 218158 tokens, 34 tool uses, 6 min 18 s; reviewer over round 1: 178316 tokens, 35 tool uses, 4 min 20 s.
