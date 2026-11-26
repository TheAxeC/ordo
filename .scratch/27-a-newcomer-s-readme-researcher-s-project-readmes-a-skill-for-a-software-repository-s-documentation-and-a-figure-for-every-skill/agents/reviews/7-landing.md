# Landing of step 7

Roadmap entry 27, a newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill; plan step 7 of 9, research-hub's README standard names researcher's layout of ADR 0057; next: land step 3 after its review, then step 5.

## Open items

- Open item G (2026-11-26), step 7's check: your reading of research-hub's `README.md` against ADR 0057. Step 7 is booked; the change stands uncommitted in research-hub (`git diff README.md` there), sections `### The private README.md` and `### The code/ folder` and the tree's `README.md` and `notes/` lines. Places outside the step's paths where the hub and researcher's layout still differ, each with the words that would bring it in line in `agents/reviews/7-report.md`: the hub's `CLAUDE.md` line 88 (the six old sections); `.oculus/config.yml` lines 41-44 (`default_ignore: [attic/]`); README line 124 (the deposit check runs `paper.py` alone); the project tree, lines 30 to 39 (no `logs/`, proofs in `theory/`); the 51 project READMEs still in the old layout, which `/researcher readme` brings over once step 8 pins it. The hub's README is best committed after that pin.
  - (a) Approve the text as it stands, and commit it in research-hub yourself after step 8's pin. Pro: the step's check passes. Con: the places listed stay as they are until you change them.
  - (b) Name what reads wrong. Pro: it is fixed before you commit. Con: the change becomes a step of its own only as `plan-orchestration`'s "What earns a step of its own" allows, since step 7 is booked.
  - Recommendation: (a), my judgment after the reviews: the one finding was fixed in the round, and the run over it found nothing. The lazy option is (a) taken without reading the text, since the reading is the check.

## The landing

- The check of Steps 1: the runner's agent listing shows no agent of step 7 left; only step 3's reviewer runs.
- NOT DONE: nothing of the brief. The user's reading (Open item G) is the step's check, left open.
- What landed: research-hub's `README.md`, uncommitted in research-hub for the user; in Ordo, this ledger's records of the step. The range `ada4e20..` held no commit, so nothing was cherry-picked.
- Verification on main: `checks: 16 commands passed`.
- Found: one finding of the first review (what `run_all.sh` does, and an unlisted difference in the project tree), closed in repair round 1; the run over the round found nothing.
- Next: step 3 lands after its review; step 5 then has what it waits on.

## Agents

- Brief check a9a2fe5d909e6aec9, claude-opus-5-5: 128993 tokens, 25 tool uses, 4 min 22 s.
- Builder a657185e09bea583a, claude-opus-5-5: 154376 tokens, 36 tool uses, 5 min 57 s; round 1: 164398 tokens, 4 tool uses, 58 s.
- Reviewer aff4b9ac101cacafe, claude-opus-5-5: 143431 tokens, 19 tool uses, 3 min 8 s.
- Reviewer over round 1 aca6b0752431a7acd, claude-sonnet-5-5: 97713 tokens, 9 tool uses, 46 s.
- The builder's first report did not pass its bar: one repair round of two rulings. Fixes at landing: none.
