# Landing: step 21 of plan 2.B, the process checks

Roadmap entry 2.B, "Repair what the audit of plans 1, 2 and 2.A found"; step 21 landed; next: the tag and the pin on the user's yes (ruling W), then 17, 17a, 18, 19.

## Open items, verbatim

- Open item Z (step 21, how a step taken back out of main is prepared again, raised 2026-09-27): after ruling Y, `land`, `plan-orchestration` and `plan-help` say that a step a red line took back out of main keeps its tag and is worked again "through `/spec`, with no new ruling". `/spec` has no text for that case: its worktree add fails on the kept branch, it writes over the committed brief, and it writes a second dispatch block for the step (the round review's Spec 2, read from `skills/spec/SKILL.md` Steps 3, 6 and 8, not run). The fix is larger than a fix at landing and needs a step, so it needs your ruling. (a) Step 21a: `/spec` of a step at `landing: backed-out` saves the kept worktree's diff into the ledger as a patch, removes the kept worktree and branch, and prepares the step again from main's head, with the failure and the patch in its brief. Pro: every step is prepared the same way, from main's head, and `/refute` and `/land` need no second path. Con: the builder applies the old work again. (b) Step 21a: `/spec` reuses the kept worktree, branch and base, adds the failure to the brief, and resets the dispatch block to `round: 0` and `landing: not-started`. Pro: the work stays where it is. Con: the step builds on an older base, and `/spec`, `/refute` and `/land` each need a second path for it. (c) Change the texts to name no route, the lazy option: a backed-out step is then left with no written way back. Recommendation (a).
- The pin of ruling W (raised 2026-09-27): step 21 has landed, and ruling W asks your yes before the release is tagged and pinned. The yes asked: tag main's head as `v1.1.0` (the one tag today is `v1.0.0`, `git tag -l`) and run `utils/pin.sh v1.1.0`. After the pin, `~/.agents/skills` still holds ten links into `~/.local/share/ordo-stable` (land, ordo-init, plan, plan-help, plan-orchestration, plan-retro, refute, repo-setup, roadmap, spec; `ls -la ~/.agents/skills`) that `pin.sh` no longer manages; you remove them yourself, since no session edits a skill folder's links. Until the pin, the ledger's copy of `land.test.sh` fails with `FAIL: verify.sh not found beside this test or in the land skill's templates`, since the installed `land` skill of v1.0.0 holds no `verify.sh`.

## Not done

- The ledger's copy of `land.test.sh` is not verified: from the repository root it prints `FAIL: verify.sh not found beside this test or in the land skill's templates` until the pin of ruling W installs a `land` skill that holds `verify.sh`.

## What landed

- The step's changes in one commit on main, with the booking in `plan.md` ("Step 21, the process checks") and the state file rewritten.
- Three fixes at landing, from the review over repair round 1, listed in the booking and under the refuter report's Closed heading.
- `land.sh` and `land.test.sh` copied into this ledger; `check_step.test.sh` added to the verify list, which prints `verify: 13 commands passed` on main.

## What was found

- The first review: 13 findings, one of them put to the user as open item Y and ruled (a); the rest closed in repair round 1 or at landing (`agents/reviews/21-refuter.md`, Closed).
- The review over round 1: six findings; three fixed at landing, one needing no change, and two (Spec 2 and Behaviour 1) raised together as open item Z.
