# Landing of step 1, the writing base

Entry 3 of `docs/roadmap.md`, the writing base. Step 1 of 4, the writing base, is landed. Next: step 2, the known cases.

## Open items

- none.

## NOT DONE

- Nothing of step 1. Steps 2, 3 and 4 of the plan are not started. Step 3 needs the user's ruling on a tag and a pin before `/writing` runs, booked in `plan.md` under "Blocked, and by what".

## The check of Steps 1

- The runner's agent listing (ListAgents) showed no agent of this step: the builder aa01d8333770f9878, the reviewer a5914ed9e26f92be4 and the reviewer over round 1 aa07e2ce319421fca had all ended. The only session listed was the peer session research-hub-ae, which is not an agent of this plan.

## What landed

- 21 files, 595 insertions and 30 deletions against the base 724bde5: `skills/writing/` with `SKILL.md` (1.0.0), `references/rules.md`, `references/registers.md` and `templates/docx_paragraphs.py`; the two openers in section C of the `repo-setup` skill's `templates/docs/dev/prose-standard.md`; the term **finding** with its `/writing` sense and the **effort agent** and **reviewer** entries in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`, and `writing` on line 3 of the template glossary (`repo-setup` 5.2.0); coverage rows 76, 100 and 101; the five `agents/ordo-*.md` definitions and the configuration comments of the `plan` skill's templates and `.agents/plan.yaml` (`plan` 5.0.1); `README.md` and `docs/dev/scripts.md`.
- With the commit: the booking and the tick in `plan.md`, the four agents in its Agents section, the state file with the dispatch entry removed, the builder's report `1-report.md` with the two fixes at landing, the refuter report `1-refuter.md` with both runs and its Closed heading, and this report.

## Verification on main

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-1 724bde5` printed:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ git ls-files -coz --exclude-standard | ... (the character-set check of docs/dev/building.md)
checks: 6 commands passed
```

and exited 0. The verify list equals the six commands of `docs/dev/building.md`, which neither main nor the worktree changed since 724bde5, so Steps 2 left it unchanged. A/B: none. Look: none configured.

## What was found

- The first review found Spec 1 to 5, Proof 1 and 2 and Standards 1 to 3. Repair round 1 (908b9cd) closed all ten, and the reviewer over round 1 confirmed each closure.
- The reviewer over round 1 found Proof A and Proof B in the builder's report, and Spec A. Proof A and Proof B are fixed at landing; Spec A is closed with no change. The Closed heading of `1-refuter.md` names each disposition.

## Fixes at landing

- 2, both in `agents/reviews/1-report.md`. Proof A: line 11 now says that no case showed a rule of the brief to be wrong, with no pointer to a misreadable wording. Proof B: lines 193 and 205 quote 593, the description length that the landed `skills/writing/SKILL.md` prints (measured on main after the cherry-pick).

## Agents

- Brief check a0ba76e39b441a3bf, claude-opus-5-5: 227907 tokens, 49 tool uses, 14 min 23 s.
- Builder aa01d8333770f9878, claude-sonnet-5-5: 302421 tokens, 237 tool uses, 41 min 38 s (round 0); 352523 tokens, 21 tool uses, 4 min 2 s (round 1).
- Reviewer a5914ed9e26f92be4, claude-opus-5-5: 325975 tokens, 77 tool uses, 14 min 58 s.
- Reviewer over round 1 aa07e2ce319421fca, claude-sonnet-5-5: 163294 tokens, 30 tool uses, 3 min 50 s.
- The builder's first report did not pass its bar: four rules of `references/rules.md` went beyond their sources, one row of "So what per section" added a position, the record rows named lines that had moved, the thesis title-page case was stated as not met, the prompt's two command bullets were named by position, the description triggered on the bare word "writing", and `README.md` named too few skills that launch the agent definitions.

## Next

- Step 2, the known cases: `/spec 3 2`, with a builder other than step 1's.
