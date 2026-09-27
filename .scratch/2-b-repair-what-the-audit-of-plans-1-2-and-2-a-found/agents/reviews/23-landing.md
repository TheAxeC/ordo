# Landing: step 23 of plan 2.B, the process scripts cut, with the work of step 22

Roadmap entry 2.B, step 23 landed; next: step 17 (the approved retro proposals without the five script proposals), then 17a, 18, 19, and the tag and the pin on the user's yes (ruling W).

## Open items

None.

## Not done

Nothing of step 23. The worktree `.agents/worktrees/2b-23` and its branches `2b-23` and `2b-23-land` are removed after the landing commit, as `/land` now says; if the removal stops, it is booked as an open item.

## What landed

- The ten process-script files deleted (ruling CC and part 2), and the skill texts that used them rewritten as plain steps: `/spec` reads a step's authority itself; a file two steps in flight share goes to the orchestrator's judgment, recorded as `shared_paths:`; the back-out in plain git steps; `/land` removes the worktree after its commit without asking (ruling BB (b)); no rule inventory; `/plan-retro` reads the reports itself.
- Step 22's work (ruling EE): commits only at resume points (ruling AA), the handover as a resume point, `pin.sh` removing old links in `~/.agents/skills`, `land.sh`'s `landing_worktree_root`, `/plan` copying `verify.sh` and `usage.py` into a ledger.
- 31 files changed, 474 insertions(+), 3689 deletions(-).

## What was found

- The first review: two findings, both closed in repair round 1.
- The review over the round: one finding, fixed at landing.
- Verification on main: `verify: 7 commands passed`, exit 0; the ledger's `land.test.sh` on its own with an empty `HOME`: `PASS: land.sh and usage.py scratch tests`.
