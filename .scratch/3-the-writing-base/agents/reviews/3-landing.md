# Landing of step 3's repair round

Roadmap entry 3 (The writing base). Plan step 3 of 4: the gate runs. Next: the new tag and pin, then the nine `/writing` runs once more.

## Open items

- none.

## NOT DONE

- Step 3's check, the nine `/writing` runs on the new tag, has not run yet. Step 3 stays unticked until it has.

## The check of Steps 1

- The runner's agent listing (ListAgents) showed the reviewer a57bba76c73b503b3 as completed and no other agent of this step; the only session listed besides this one was the peer session research-hub-ae, which is not an agent of this plan.

## What landed

- `skills/writing/SKILL.md`, "Review agent prompt": the agent checks each rule that judges a section against every section, applies a rule whose words name a type of section only to sections of that type, checks each first-sentence rule against every paragraph and each whole-draft rule once over the whole draft, gives a count only inside a finding, writes no line for a rule kept, and checks each reported passage against every other rule, naming each one on its own line. Version 1.0.0.
- The case files under `.scratch/3-the-writing-base/cases/`, copied from the builder's scratch folder before `land.sh` ran and fixed at landing: `expected.md` and the four drafts, each `.tex` with its `\input` file, `draft.html` and `draft.docx`.
- With the commit: the brief-check, builder and refuter reports, the booking and the three agents in `plan.md`, the state file with the dispatch entry removed, and this report.

## Verification on main

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-3 8ff6ed7` printed:

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

and exited 0. After the fixes at landing, `checks.sh` over the same list printed `checks: 6 commands passed`. The verify list was not changed. A/B: none. Look: none configured.

## What was found

- The brief check found 12 points, each closed in the brief (`3-brief-check.md`, Closed).
- The review found Spec 1 to 7, Proof 1 and 2, Standards 1 and 2 and Behaviour 1 and 2: a prompt bullet that took "Reader's four questions" off every section, a two-requirement bullet, list introductions that read as closed lists, and clean or unlisted passages in the drafts that broke rules, most made by the round's own edits.

## Fixes at landing

- 10: Spec 1 to 7, Proof 1, Standards 1 and Behaviour 1, each named with its place under the Closed heading of `3-refuter.md`; each `draft.docx` made again with `textutil`; the word counts, the semicolon rates, two sentence-count lists and one word range of `expected.md` updated. Every single-place row compared with its `.tex` line and `.docx` paragraph: 142 held, 0 missed.

## Agents

- Brief check acaa4055895146282, claude-opus-5-5: 178028 tokens, 40 tool uses, 8 min 41 s.
- Builder a2772a0b72fc9ee89, claude-sonnet-5-5: 304559 tokens, 255 tool uses, 49 min 11 s. Its report did not pass its bar.
- Reviewer a57bba76c73b503b3, claude-opus-5-5: 289143 tokens, 57 tool uses, 13 min 20 s.

## Next

- Tag `v8.1.0-rc.2` on the landing commit and pin it, as the ruling "Step 3, the case reports" says, then the nine `/writing` runs once more.
