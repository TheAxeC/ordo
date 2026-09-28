# Step 7a, repair round 2: ruling 5 of round 1, built

This round is the one round beyond the cap that plan-orchestration allows when the delta leaves an acceptance item of the brief unbuilt and a verification command red, with a fix too large to make at landing. It holds ruling 5 of round 1 and nothing else. Every other finding of the round 1 review is the orchestrator's, fixed at landing. The brief `agents/briefs/7a.md` and the round 1 rulings `agents/briefs/7a-round-1.md` hold unchanged; the review is `agents/reviews/7a-refuter.md`, section "Repair round 1, refuted", Proof 1, Standards 2 and Behaviour 1.

## What the tree shows

- The land skill stops a shell builder with TERM at the pid in its pid file and KILL two seconds later, then requires the pid gone and the exit file present (`skills/land/SKILL.md:41-43`). `launch.sh`'s head comment (lines 26-28) and `skills/plan-orchestration/SKILL.md:196` promise that this sequence leaves an exit file.
- On TERM the leader's `on_signal` sends TERM to the runner and waits; the runner's `stop(1)` takes the one-second grace plus two process scans, then the leader writes the exit file. Under load that passes two seconds, the KILL ends the leader, and no exit file is written. The reviewer measured `FAIL: land sequence with KILL: no exit file` in 16 of 16 whole-suite runs at 16 at once, on the round's tree and on base df3c6a7, and 1 of 4 at 4 at once.
- Round 1 removed the KILL from the "land sequence" case, so no case exercises a KILL that arrives before the exit file is written.

## The ruling

1. **An exit file under every stop.** When the runner of a builder started by a launch finds its parent (the session leader) gone, it stops the builder and every process of the session as it does now, and then writes the launch's exit file when none is present, as `exit 137` unless the builder had already ended, when it writes the builder's own code. The write is atomic (a `.tmp` beside it, moved into place) and never replaces an exit file the leader wrote. The runner learns the exit file's path from the leader (an argument or the environment); a runner started for a note call writes none.
2. **The land skill waits for it.** `skills/land/SKILL.md` Steps 1: after KILL, the pid must be gone and the exit file present within five seconds, checked every tenth of a second; either missing then is the refusal it is now.
3. **The case restored and a load case added.** The "land sequence" case sends TERM, then KILL two seconds later as the land skill does, then waits (bounded, as `wait_until` is) for the exit file and requires no process of the session left. A new case sends KILL to the leader alone while the builder ignores TERM and requires the exit file `exit 137` and no process left. Each names the revert that turns it red, quoted. The report quotes whole-suite runs, under `sh` and `LAUNCH_SHELL=dash`: 20 one at a time, and 32 at 16 at once, with the count of reds, on the round's tree, and the same counts on base df3c6a7 for the "land sequence with KILL" case.
4. **The texts made true.** `launch.sh`'s head comment (the Body paragraph: the sentence on TERM followed by KILL, and "no exit file is written then"), `skills/plan-orchestration/SKILL.md:196` and every other sentence a grep for `exit file` across `skills/` and `docs/` finds the change makes false.

## Paths this round writes

The brief's list, plus `skills/plan/SKILL.md` line 52 (round 1), plus `skills/land/SKILL.md` lines 39-45.

## Report

Add a section "Repair round 2" to `agents/reviews/7a-report.md` in the worktree's copy of the ledger: each of the four items DONE or NOT DONE with the command that proves it, the counts of item 3, the brief's "Verify before you report" rerun and quoted, and the files the round changed.
