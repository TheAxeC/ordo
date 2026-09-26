# Landing: step 7a

## Open items

- none.

Booked list: 3 items, carried by steps 2, 3 and 7b.

## NOT DONE

- The exit file's remaining cases in `launch.sh` are step 7b: a KILL after the builder ended, while the note's `end` runs, leaves no exit file; a killed run's runner can write `exit 137` after a relaunch with the same exit file removed it; a KILL between the leader's two writes leaves only `<exit file>.tmp`; the no-replace guards lack red cases; the scanner's answer has no time limit. The texts on main state these cases.

## What landed

Step 7a, in the commit that carries this note: `allow_list.py` and its test; `launch.sh`'s `--allow-file` and the exit file under every stop; `check_config.py`'s `worker_allow` check; the `plan` templates and `SKILL.md:52`; the `plan-orchestration` recipe; the land skill's five-second wait; the README test bullets; this plan's verify list with `allow_list.test.sh` and its configuration block with `worker_allow: []`. The booking is in `plan.md`, "Step 7a, the allow list for a shell-launched claude builder".

## What was found

- Two repair rounds, the second the one round beyond the cap (the land-sequence red unbuilt after round 1). Every finding of the runs over both rounds is closed in `agents/reviews/7a-refuter.md`, Closed: 10 fixes at landing, 5 findings booked as step 7b.
- A real `claude -p` run under the printed allow list ran a verify command and the ASCII check's pipeline with no permission denial.
- `verify.sh` on main: `verify: 14 commands passed`, exit 0.

## Next

Step 7's builder is resumed through `launch.sh --resume` with an allow file, and step 7b is prepared by `/spec` and dispatched beside it.
