# Step 1 landing

Entry 13 of `docs/roadmap.md`, researcher; step 1 of 7, the copied pages, landed on main; next, step 2, the modes `integrity` and `manuscript`, with `/spec 13 2`.

## Open items

- none.

## The check of Steps 1

The builder (a90f7dfac5ca2a866) and the two reviewers (aa05eb7854278e73e, a13bf81b661469dae) had each ended with a completion notice before the landing.

## Not done

Nothing.

## What landed

- `skills/academic/researcher/`, 27 pages: 20 copied from academic-pipeline v3.13.0, six documents from the same version of its public repository, and `references/ethics.md`. It has no `SKILL.md` yet, so no skill is installed until step 2.
- `NOTICE.md` at the repository root: the adapted parts, their author and copyright line, the CC BY-NC 4.0 licence with its disclaimer, and MIT for the rest.
- `README.md` line 263: the licence line names `NOTICE.md`.
- `.scratch/13-researcher/deviations.md`: every difference of the copy from its source, 25 kinds with the ruling behind each, and a list per file.

## What was found

The first review found ten things, all closed in one repair round:

- The check of claims against the record of the experiments picked its claims through a field that `paper` does not write, so it could not fail a manuscript. It now picks them by reading the manuscript (Open item C, C146).
- The ethics check ran only in the final check. It now runs at both depths (D17).
- The worked example of a whole run skipped the check before the review. It has both integrity scenes now (Open item C).
- An example in the schema page wrote a null result into a manuscript. It is replaced (D20).
- Four places where more of the source was removed than a ruling allows are put back.

The run over the round found one thing, fixed at landing: with the ethics check now at both depths, the ethics page would have stopped the run for the user on any fabricated reference, while the integrity agent sends it to a correction round. The ethics page now says the correction round comes first.

## Verification

`checks: 16 commands passed`, printed by `templates/checks.sh` on the state file, on main after the fix at landing.

## Usage

- Builder a90f7dfac5ca2a866, claude-opus-5-5: 305562 tokens, 215 tool uses, 2297 s; round 1: 168875 tokens, 98 tool uses, 619 s.
- Brief check a88f2b2030a881ff2, claude-opus-5-5: 234088 tokens, 48 tool uses, 448 s.
- Reviewer aa05eb7854278e73e, claude-opus-5-5: 131902 tokens, 83 tool uses, 793 s.
- Reviewer over round 1 a13bf81b661469dae, claude-sonnet-5-5: 250100 tokens, 47 tool uses, 291 s.

The builder's first report did not pass its bar. Fixes at landing: one.

## Next

Step 2 writes `SKILL.md` with the modes `integrity` and `manuscript`. Steps 3 and 4 follow it.
