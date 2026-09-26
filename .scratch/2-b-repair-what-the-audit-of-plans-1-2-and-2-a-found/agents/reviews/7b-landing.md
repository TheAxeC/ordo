# Landing: step 7b

## Open items

- none.

Booked list: 3 items, carried by steps 2, 3 and 7c.

## NOT DONE

- A killed session leader that its parent does not reap stays a zombie, and the guard's `kill 0` succeeds on it, so the guard keeps waiting and writes no exit file. It is step 7c: a zombie check in the guard and a case that keeps a killed leader a zombie.

## What landed

Step 7b, in the commit that carries this note: the guard the builder's runner leaves, which writes the builder's code once the leader is gone and checks that it is in the leader's process group; the lock held by the leader, the runner and the guard; a 2-second deadline on the session scanner; one temporary file per writer, and their removal at the launch; the checked open of the runner's handle on the lock; the texts of `launch.sh`, `plan-orchestration/SKILL.md` and `launch-note.md`; the README bullet for `launch.test.sh`.

## What was found

- Two repair rounds, the second the one round beyond the cap: round 1's 10-second bound on the guard left a KILL to a leader alive past it with no exit file, and round 2 removed the bound. Every finding of the runs over both rounds is closed in `agents/reviews/7b-refuter.md`, Closed: 4 fixes at landing, 1 finding booked as step 7c.
- The builder ran the read-only `git diff` and `git status` in the worktree during the first build and round 1, against its brief; it reported this itself.
- `verify.sh` on main: `verify: 14 commands passed`, exit 0.

## Next

Step 7c, then step 17 (the approved retro proposals), 17a (the library check), 18 and 19.
