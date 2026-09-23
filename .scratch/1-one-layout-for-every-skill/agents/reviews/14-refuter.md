# Step 14 refuter

Worktree .agents/worktrees/1-14, base 47a7abc. `git diff 47a7abc --stat`: `3 files changed, 12 insertions(+), 2 deletions(-)`. `git status --short` shows only README.md, docs/dev/building.md and docs/dev/change-standard.md as ` M`, before and after the reviewer's runs.

## Verification lines

All commands run from the worktree root, in the order docs/dev/building.md lists them.

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ python3 -B utils/check_skill_layout.py
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
exit 0
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
(no output)
exit 0
$ npx skills add . --list 2>&1 | grep Found
Found 10 skills (after the CLI's own status glyph)
```

The red proof on the reviewer's scratch copy: `## Rules` renamed `## Ruless` in skills/roadmap/SKILL.md printed `skills/roadmap/SKILL.md:131: section 'Ruless' is outside the place between Steps and Stops`, `skills/roadmap/SKILL.md:136: section 'Rules' is missing`, exit 1; the report's own case on skills/spec/SKILL.md reproduced its two lines verbatim, exit 1; restored, exit 0.

## Spec

1. docs/dev/change-standard.md:53: "The layout check prints each error with its file and line; exit 0 is the pass." No brief item asks for it; report row 2 lists it inside item 2. The sentence is accurate. Fix: keep it, and list it in the report as a change outside the items.
2. No place listing the verify commands was missed (`git grep -ln "check_rule_inventory.test.sh\|check_skill_layout\|pin.test.sh" -- ':!.scratch'`: README.md, the docs/dev pages, the utils scripts). The state file's `verify` list lacks the line, as expected before landing.

## Proof

1. 14-report.md:12: row 4 quotes the output of a landing run that has not happened. The same holds for 14-report.md:23 and :32. Fix: mark it NOT DONE in the worktree, done on main at landing, with no proof until that run exists.
2. 14-report.md:25: the grep for `check_skill_layout`, `standards page` and `the seven` is paraphrased with no command and no output, though the brief and change-standard rule 14 ask for it quoted. The reviewer's run found skills/plan-retro/SKILL.md:59 and :74, skills/ordo-init/SKILL.md:54, skills/repo-setup/templates/docs/dev/change-standard.md:8 and README.md:18, none made false. Fix: quote the command and its hits.
3. Every other figure reproduced.

## Standards

1. docs/dev/building.md:3: "The green check is every test below passing ... Each test builds scratch repositories under `$TMPDIR`". The block now holds two commands that are not tests, and building.md:17's pass rule for a test does not fit the layout check. Fix: "The green check is every command below passing, ...".
2. docs/dev/change-standard.md:39: "its output goes through a filter for its summary lines" now contradicts line 49, which has no filter. Fix: say the layout check and the ASCII check take no filter, or reword line 39 to each test's output.
3. Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false.

## Behaviour

1. docs/dev/change-standard.md:8 drops "a brief that names one points at it"; the report states the before and after.
2. docs/dev/change-standard.md:53: the report describes the new sentence without quoting it. Fix: quote it.

## Not checked

- The `verify` list with the new line and the verify run on main: both belong to the landing.
- Whether the ten names `npx skills add . --list` lists equal `ls skills/`; only the count line was checked.

Reviewer usage: about 16 tool uses, about 10 minutes.

## Repair round 1, refuted

The round changed two lines: docs/dev/building.md:3 and docs/dev/change-standard.md:39. `git diff 47a7abc --stat`: `3 files changed, 14 insertions(+), 4 deletions(-)`.

### Verification lines

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
$ python3 -B utils/check_skill_layout.py
(ten ok: lines, land to spec)
exit 0
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
(no output), exit 0
$ npx skills add . --list 2>&1 | grep Found
Found 10 skills (after the CLI's own status glyph)
```

The red run on a scratch copy (`## Rules` in skills/spec/SKILL.md renamed `## Rule list`) matched the report's two lines verbatim, exit 1.

### Spec

none. Spec 1 and Proof 1 closures hold; no place listing the verify commands was missed.

### Proof

none. The line counts, the diff stat, the row proofs, the 10 `ok:` lines and the quoted grep (the same 14 hits in the same order) reproduced.

### Standards

none. The changed phrases grepped across skills/, utils/, docs/ and README.md; no sentence made false; the change-standard template for other repositories keeps its own sentence, which the round does not make false; no check removed.

### Behaviour

none.

### Not checked

- The `verify` list with the new line and the verify run on main: both at landing.
- Whether the ten names `npx skills add . --list` prints equal `ls skills/`.

## Closed

- First run: every finding closed in repair round 1; the closures are in `14-report.md`, "Repair round 1".
- Run over the round: no findings.
