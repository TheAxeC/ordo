# Step 20, repair round 2: the one round beyond the cap

Round 1's ruling 1 asked for a case that proves `land.sh` runs with the new arguments. That case is unbuilt: every call in `land.test.sh` passes `--no-browser`, and changing `-lt 2` back to `-lt 3` leaves the suite green (`agents/reviews/20-refuter.md`, "Repair round 1, refuted", Proof). An acceptance item of the round left unbuilt is the one case that earns this round. The orchestrator writes no test code at landing, so the case is built here.

## Ruling

1. **The minimal command line proven.** In `skills/land/templates/land.test.sh`, add a case that calls `land.sh` with exactly `<pkg> <base>` and asserts it gets past the argument-count check, and a control that calls it with one argument and asserts exit 64 with the usage line on stderr. Name the revert (`-lt 2` changed to `-lt 3`) and quote the first `FAIL:` line it gives.

Nothing else changes in this round. The round's other findings are the orchestrator's at landing.

## Report

Add a section "Repair round 2" to `agents/reviews/20-report.md` in the worktree's copy of the ledger: the ruling DONE or NOT DONE with the command that proves it, the revert's first `FAIL:` line quoted, "Verify before you report" rerun and quoted, and the file changed with its line count.
