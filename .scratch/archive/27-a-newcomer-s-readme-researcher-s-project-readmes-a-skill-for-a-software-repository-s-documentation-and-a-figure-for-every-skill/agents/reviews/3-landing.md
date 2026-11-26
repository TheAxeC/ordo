# Landing of step 3

Roadmap entry 27, a newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill; plan step 3 of 9, the skill `handbook` as ADRs 0058 and 0060 decide; next: step 5, a figure for each of the fifteen skills.

## Open items

- Open item H (2026-11-26), step 3's check: your reading of the skill `handbook` against ADRs 0058 and 0060. Step 3 is booked and on main: `skills/code/handbook/SKILL.md`, `references/kinds.md`, `references/diagrams.md` and `templates/manual.py`. Read: which kinds the skill writes and when each is left out (`references/kinds.md`, against ADR 0058's kinds bullet and D34's paths); the diagram file `utils/diagrams.py` drawn by the engine copied into the documented repository's `utils/figures.py` (`references/diagrams.md`, against ADR 0060); the two stops before anything is written (The kinds, The drafts); and the one commit in the documented repository that names its paths (Steps 10, as ADR 0060's Decision has it: `handbook` "commits the `.svg` it draws"). ADR 0058's Status line now reads that 0060 supersedes it in the diagrams part; its Decision text is unchanged. The check "`/ordo-help skills` lists `handbook`" runs at step 8 after the pin.
  - (a) Approve the text as it stands. Pro: the step's check passes, and step 8 runs `/handbook` on the repository you name. Con: what you would word differently waits for a later change.
  - (b) Name what reads wrong. Pro: it is fixed before the pin at step 8. Con: step 3 is booked, so the fix enters the plan only as `plan-orchestration`'s "What earns a step of its own" allows.
  - Recommendation: (a), my judgment after the reviews: the first review's four findings were fixed in the round, and the run over it found two, fixed at landing. The lazy option is (a) taken without reading the text, since the reading is the check.

## The landing

- The check of Steps 1: the runner's agent listing shows no agent of step 3 left; only the user's peer sessions are listed.
- NOT DONE: nothing of the brief. The user's reading (Open item H) is the step's check, left open; the check "`/ordo-help skills` lists `handbook` with its Quick start" runs at step 8 after the pin ("Step 8, carried").
- What landed: `skills/code/handbook/` (`SKILL.md`, `references/kinds.md`, `references/diagrams.md`, `templates/manual.py`), `manual.py`'s row on `docs/dev/scripts.md`, eleven glossary entries, ADR 0058's Status line, and the README's skill count and tree; with this ledger's records of the step.
- Verification on main: `checks: 16 commands passed`, after the cherry-pick and again after the fixes at landing.
- Found: four findings of the first review (remote images, colliding tab ids, the engine that draws the drafts, bullets holding two rules), closed in repair round 1; two findings of the run over the round, fixed at landing: an image whose address starts with `//` is now written as a link and not as `<img>`, and three bullets of `SKILL.md` are split, one rule each.
- Next: step 5 has what it waits on; step 6 follows it.

## Agents

- Brief check af894f369408218fe, claude-opus-5-5: 182732 tokens, 44 tool uses, 7 min 45 s.
- Builder a15970d264f25815b, claude-opus-5-5: 231675 tokens, 51 tool uses, 12 min 36 s; round 1: 273433 tokens, 19 tool uses, 4 min 58 s.
- Reviewer a70dc44bade66da5f, claude-opus-5-5: 184814 tokens, 33 tool uses, 7 min 12 s.
- Reviewer over round 1 af7bdca8540146551, claude-sonnet-5-5: 136257 tokens, 23 tool uses, 2 min 54 s.
- The builder's first report did not pass its bar: one repair round of five rulings. Fixes at landing: the two findings of the run over round 1.
