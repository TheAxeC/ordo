# Landing of step 2, the known cases

Entry 3 of `docs/roadmap.md`, the writing base. Step 2 of 4, the known cases, is landed. Next: step 3, the gate runs.

## Open items

- none.

## NOT DONE

- Nothing of step 2. Steps 3 and 4 of the plan are not started. Step 3 needs the user's ruling on a tag and a pin before `/writing` runs, booked in `plan.md` under "Blocked, and by what".

## The check of Steps 1

- The runner's agent listing (ListAgents) showed no agent of this step: the builder a9e170623ba28cc36, the reviewer a1d4edc40c77a9221 and the reviewer over round 1 a7a8c86524ffc2678 had all ended. The only session listed was the peer session research-hub-ae, which is not an agent of this plan.

## What landed

- The character-set check in `docs/dev/building.md` and `docs/dev/change-standard.md` skips the files under `.scratch/*/cases/` and `.scratch/archive/*/cases/`, and the paragraphs after the command block of `docs/dev/building.md` say so: 2 files, 9 insertions and 3 deletions against the base f241b23.
- The case files in `.scratch/3-the-writing-base/cases/`, copied by the session from the builder's scratch folder before `land.sh` ran: `expected.md` (178 rows), and `engineering/`, `medicine/`, `sciences/` and `social/`, each with `main.tex`, `sections.tex`, `draft.html` and `draft.docx`.
- With the commit: the booking, the tick and the three new agents in `plan.md`, the state file with the dispatch entry removed and the sixth verify command rewritten, the builder's report `2-report.md`, the refuter report `2-refuter.md` with both runs and its Closed heading, and this report.

## Verification on main

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-2 f241b23` printed:

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
$ git ls-files -coz --exclude-standard | ... (the character-set check of docs/dev/building.md, with the skip of the cases/ folders)
checks: 6 commands passed
```

and exited 0, with the case files on disk, the em dash cases of `engineering/sections.tex` among them. After the fixes at landing, `checks.sh` over the same list printed `checks: 6 commands passed` again. The verify list's sixth command was rewritten at Steps 2 to the command of the worktree's `docs/dev/building.md`. A/B: none. Look: none configured.

## What was found

- The first review found Spec 1 to 13, Proof 1 and 2, Standards 1 and 2 and Behaviour 1. Repair round 1 (05be512) sent 17 rulings.
- The reviewer over round 1 confirmed rulings 2 and 11 to 17 closed and the others closed for their named places, and found Spec 1 to 9, Proof 1 and Standards 1: further breaks in the case drafts of the kinds the rulings named, a wrong binary-contrast count, and one long sentence in `docs/dev/building.md`. It also named three contradictions in the drafts under "Declined to judge".

## Fixes at landing

- 12: every finding of the run over round 1 and the three contradictions, made in both forms of the four case drafts with each `draft.docx` made again from its `draft.html`, in 17 lines of `expected.md` (the rows quoting changed passages and every word and paragraph count), and in `docs/dev/building.md`. The Closed heading of `2-refuter.md` lists each change with its place. Every single-place row's passage was compared with its `.tex` line and its `.docx` paragraph after the fixes.

## Agents

- Brief check a0a40444046c6ffdc, claude-opus-5-5: 221286 tokens, 43 tool uses, 13 min 16 s.
- Builder a9e170623ba28cc36, claude-sonnet-5-5: 84056 tokens, 197 tool uses, 51 min 1 s (round 0); 320648 tokens, 182 tool uses, 44 min 2 s (round 1).
- Reviewer a1d4edc40c77a9221, claude-opus-5-5: 256176 tokens, 45 tool uses, 14 min 9 s.
- Reviewer over round 1 a7a8c86524ffc2678, claude-sonnet-5-5: 358931 tokens, 78 tool uses, 17 min 29 s.
- The builder's first report did not pass its bar: the short drafts held breaks their rows did not list, the engineering draft held near-copies, contradictions and unlisted places of listed rules, the list colon had no case, two count rows were wrong, and the paragraph after the block of `docs/dev/building.md` ran to eight sentences.

## Next

- Step 3, the gate runs: `/writing` on the eight case drafts and on the NWO XS `.docx`, after the user rules on a tag and a pin.
