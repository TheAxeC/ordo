# Landing: step 20

## Open items

- none.

Booked list: 3 items: the links in `~/.agents/skills` for the user at the pin after step 21 (step 20), and two sentence fixes carried by steps 2 and 3.

## NOT DONE

- Nothing inside the brief.

## What landed

Step 20, in the commit that carries this note: the shell-launch route (`launch.sh`, `launch.test.sh`, `allow_list.py` and its test, `launch-note.md`) deleted, and every Codex part of the skills removed. The plan templates and `check_config.py` accept `claude:<model>` only and drop `launch_note`, `worker_allow` and `worker_effort`; `usage.py` reads Claude Code logs only; `land.sh` takes `<pkg> <base>`; `/repo-setup` writes no `AGENTS.md`; `pin.sh` links into Claude Code's skill folders only. The booking is in `plan.md`, "Step 20, Claude only".

## What was found

- Two repair rounds: round 1 with six rulings, round 2 the one round beyond the cap for round 1's unbuilt test case. The review of round 2 found nothing. Every finding is closed in `agents/reviews/20-refuter.md`, Closed.
- Four fixes at landing, each named in the booking.
- `verify.sh` on main: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0.

## Next

Step 21 through `/spec`: `/spec` refuses an unruled step, `/land` requires the ledger's `land.sh`, and a rewrite of a skill needs a rule inventory. After its landing, the release is tagged and the user's yes is asked to pin it.
