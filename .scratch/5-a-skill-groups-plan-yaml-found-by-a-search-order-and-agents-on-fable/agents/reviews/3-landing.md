# Step 3 landing

Entry 5.A of `docs/roadmap.md`, Skill groups, plan.yaml found by a search order, and agents on Fable; step 3 of 5, plan.yaml found by a search order, landed on main; next, step 4, the checks on the pinned skills, with the user.

## Open items

- none

## The check of Steps 1

The builder (a235f7278dcf9dd9a) and the two reviewers (a5a88f7bf8c87a8df, a5832b59f2e35e98e) had each ended with a completion notice before the landing.

## NOT DONE

Nothing of the step. The pinned skills read `.agents/plan.yaml`, which is no longer on main, so they refuse in this repository until step 4 pins the new tag.

## What landed

39 files changed, 800 insertions(+), 353 deletions(-).

- The plan configuration is the first `plan.yaml` found in the folder named in the call, then in `.scratch/`, `docs/` and `.agents/` at the repository root.
- The folder stands in front of the entry in a call.
- Paths in a `plan.yaml` are read from the folder that holds it; `worktree_root` is optional.
- `check_config.py <path>` checks one file; `check_config.py --find <repository root> [<folder>]` prints the file found.
- `land.sh` takes the path of the `plan.yaml` as a fourth argument.
- Ordo's configuration is `docs/plan.yaml`.
- A new configuration is written to `docs/plan.yaml` by `ordo-init` and `repo-setup`.
- Thirteen skills have their first version part raised.

## What was found

- The first review found ten points, sent back as ten rulings in repair round 1; the run over the round found three, fixed at landing with two more.
- Fourteen files conflicted with steps 1 and 2 and were resolved by the session.
- An existing `.agents/plan.yaml` whose paths are written from the repository root is still found, and its paths are now read from `.agents/`: its owner puts `../` in front of each path or moves the file.

## Verification on main

`checks.sh` exited 0: the ten tests each printed their `PASS:` line, the glossary check printed `ok: the plan-terms block equals the template`, the character-set check printed nothing, and the last line was `checks: 12 commands passed`. `check_config.py docs/plan.yaml` ended with its `ok:` line, and `--find .` printed `docs/plan.yaml`.

## Usage

brief check a4d3ffc7dd382169a claude-fable-5-2 156175 tokens, 19 tool uses, 5.6 minutes; builder a235f7278dcf9dd9a claude-fable-5-2 343849 tokens, 55 tool uses, 23.6 minutes (build) and 360579 tokens in all, 4 tool uses, 2.5 minutes (round 1); reviewer a5a88f7bf8c87a8df claude-fable-5-2 288132 tokens, 29 tool uses, 10.1 minutes; reviewer over round 1 a5832b59f2e35e98e claude-sonnet-5-5 121493 tokens, 18 tool uses, 2.4 minutes.

The builder's first report did not pass its bar. Fixes at landing: 5.
