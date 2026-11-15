# Landing of step 5 of plan 5

Roadmap entry 5, paper. Plan step 5 of 8 in order (1, 2, 3, 4, 4.A, 5, 5.A, 6), the gate's comparisons, landed. Next: step 5.A, the repair of paper.

## Open items

None.

## The check of Steps 1

Step 5 ran inline, so it had no builder. Its reviewer, ae35f1410f792b5fa, had ended; the runner's agent listing showed no agent of this session.

## NOT DONE

- C15: lit-review and revision are losses and full is a tie. Step 5.A takes the repair and runs each comparison again (rulings "The calls and the repair's scope" and "The full call").
- C8: Kolda_2009, Agueh_2011 and Bonneel_2016 do not resolve by title. Step 5.A changes how `lookup.py resolve` confirms an entry and runs the resolve again.

## What landed

The step's records under `.scratch/5-paper/`. The range b8a5947..5-paper-5 holds no commit, since step 5 ran on main.

- The release candidate `v8.4.0-rc.2` on 678a5a7, pinned (ruling "The pins of plan 5").
- The three blind comparisons with their judgments, key, outputs as judged and the seven scripts that blinded and checked them (`5-blind-comparison.md` and its folder).
- The single-mode runs, among them single-6, the rerun of item 8 with the one-line pick `all but 13, 14, 23` (`5-single-mode-runs.md`).
- The trace of the revision faults to the patches that wrote them (`5-revision-fault-trace.md`).
- In `plan.md`: step 5.A's line with the four causes of the faults and the comparison setup with research-hub's `tools/manuscript/` and `CLAUDE.md`, the rulings "The causes of the revision faults" and "The setup of the comparison sides", and this booking.

## What was found

The review found 17 findings (5 Spec, 9 Proof, 2 Standards, 1 Behaviour). Fourteen were fixed in the records before landing. Three were decisions: BD and BF ruled (a) by the user, and BE closed under self-rule (C110) by running item 8 again. `5-refuter.md`, "Closed", gives each one.

## Verification on main

`land.sh` printed "nothing to copy: b8a5947e8eda16c220bc2862ba63600fc07f2104..5-paper-5 holds no commit" and ran the 12 commands of the verify list, each PASS or with no output, ending "checks: 12 commands passed"; exit 0. A/B: none. Look: none configured.

## Usage

- Brief check a988d4d9e4f90bf1e, claude-opus-5-5: 234954 tokens, 61 tool uses, 12.4 min.
- Builder: inline, the orchestrator, no agent.
- Reviewer ae35f1410f792b5fa, claude-opus-5-5: 283470 tokens, 93 tool uses, 20.9 min.

The first report did not pass its bar: the review found 17 findings. Fixes at landing: none.

## Next

Step 5.A, the repair of paper, through `/spec 5 5.A`. Then step 6, the closing.
