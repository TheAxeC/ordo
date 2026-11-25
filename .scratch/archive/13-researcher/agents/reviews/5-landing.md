# Step 5 landing

Entry 13 of `docs/roadmap.md`, researcher; step 5 of 7, `ordo-help` covers every skill, landed on main; step 1, the copied pages, is in flight, and step 2, the modes `integrity` and `manuscript`, is next.

## Open items

- none.

## The check of Steps 1

The builder (a6b13ac6347fbb68a) and the two reviewers (a0f7721f21de23fac, a3dcc47add2b65486) had each ended with a completion notice before the landing. The runner's agent listing showed one agent running, a90f7dfac5ca2a866, the builder of step 1.

## Not done

Nothing.

## What landed

`skills/ordo/ordo-help/SKILL.md` at version 5.2.0 and line 22 of `README.md`.

- `/ordo-help skills` prints, per skill, its name, one line on what it is for, and its Quick start block.
- `/ordo-help <a sentence on what you want to do>`, such as `/ordo-help I want to revise a paper`, names at most three skills, each with its mode, the command to type and why it fits. It writes nothing, invokes no skill and starts no agent.
- A title is read as an entry only when that entry has an open plan, as ruling D33 says. `/ordo-help paper` is a sentence and names the skill `paper`.
- The number of an entry with no open plan, alone or followed by its title, gets one line from the roadmap: `/plan <entry>`, `/roadmap add <entry>`, or that the entry is done or dropped.
- With no `plan.yaml`, or one with a required key missing, a sentence is still answered.

## What was found

The first review found that the title of an entry with no open plan was read as an entry, against ruling D33. Repair round 1 put the skill on D33 and carried five smaller rulings. The run over round 1 gives every item of the brief and every case as holding. One finding of that run was fixed at landing: the bullet on a missing `plan.yaml` now says which folder it means.

## Verification

`checks: 16 commands passed`, printed by `templates/checks.sh` on the state file, on main after the fix at landing.

## Usage

- Builder a6b13ac6347fbb68a, claude-opus-5-5: 166884 tokens, 21 tool uses, 342 s; round 1: 189423 tokens, 18 tool uses, 140 s.
- Brief check af1105b279c18c7ed, claude-opus-5-5: 159691 tokens, 22 tool uses, 267 s.
- Reviewer a0f7721f21de23fac, claude-opus-5-5: 151881 tokens, 31 tool uses, 351 s.
- Reviewer over round 1 a3dcc47add2b65486, claude-sonnet-5-5: 123214 tokens, 11 tool uses, 133 s.

The builder's first report did not pass its bar. Fixes at landing: one.

## Next

Step 1's builder is running. Steps 2, 3 and 4 follow it, one after another.
