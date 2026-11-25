# Landing of step 8

- Roadmap entry 13 (researcher). Plan step 8 of 8: the mode `revision`, landed. Next: step 6, the gate runs, which waits on the user's word for the release candidate's tag and pin, the idea of the `novelty` run and the sentence of the `/ordo-help` run.

## Open items

- none.

## The landing

- The check of Steps 1: the runner's agent listing showed the builder and both reviewers of the step no longer running; only completed agents were listed.
- NOT DONE: nothing of the brief. Not verified: a run of the mode, and the SLURM behaviours, as for step 4.
- Landed with the commit: `### revision` in `skills/academic/researcher/SKILL.md` with its Quick start line, two stops and two refusals; the two `references/` pages; the glossary entries; `docs/figures/researcher-revision.svg` and `researcher_revision()`; `README.md`, `docs/dev/building.md` and `docs/dev/scripts.md`; ADR 0055's second Decision bullet corrected.
- Found: the first review gave items 2 and 7 as violated (Consolidate skipped off a cluster, the comment missing from a campaign's brief, the README's stage after a revision, `pipeline_state` during the campaigns, the figure's missing stops); repair round 1 closed them. The run over round 1 found four Standards and two Behaviour findings, fixed at landing.
- Verification on main, after the fixes at landing: `checks: 16 commands passed`.
- Next: step 6, the gate.

## Usage

- Builder a96f07919efa565ec (claude-opus-5-5): 282054 tokens, 76 tool uses, 887 s; round 1 341355 tokens, 24 tool uses, 266 s.
- Brief check a0516fcf1aaec457a (claude-opus-5-5): 202392 tokens, 45 tool uses, 438 s.
- Reviewer a2ec2be82468551b2 (claude-opus-5-5): 175561 tokens, 39 tool uses, 408 s.
- Reviewer over round 1 a5d978c0616308574 (claude-sonnet-5-5): 117299 tokens, 19 tool uses, 139 s.
- The builder's first report did not pass its bar. Fixes at landing: the six findings of the run over round 1, ADR 0055's false sentence, the deviations booked.
