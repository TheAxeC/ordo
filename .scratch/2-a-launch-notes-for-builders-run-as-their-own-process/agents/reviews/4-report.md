# Step 4 report

Built inline in `.agents/worktrees/2a-4` from base 2764bb9, with repair round 1 worked inline.

Open items in the state file: none.

Everything in the brief is done; item 4 (the state file's `verify:` block) is made on main at landing, as the brief says. The round widened the step's paths to `launch.test.sh`, so that the README's description of the test is true.

`git diff 2764bb9 --stat`:

```text
 README.md                                          |  2 +
 docs/dev/building.md                               |  1 +
 docs/dev/change-standard.md                        |  1 +
 skills/plan-orchestration/templates/launch.test.sh | 66 ++++++++++++++--------
 4 files changed, 45 insertions(+), 25 deletions(-)
```

| # | Item | Done | Proof |
|---|---|---|---|
| 1 | README | DONE | `grep -n launch.test.sh README.md` prints `109:sh skills/plan-orchestration/templates/launch.test.sh` and line 120, the bullet that says what the test checks. |
| 2 | `docs/dev/building.md` | DONE | `grep -n launch.test.sh docs/dev/building.md` prints `10:sh skills/plan-orchestration/templates/launch.test.sh  # launch.sh with stub builders and a stub launch-note command`; `awk 'NR==6\|\|NR==10{print index($0,"#")}' docs/dev/building.md` prints 56 twice. |
| 3 | `docs/dev/change-standard.md` | DONE | `grep -n launch.test.sh docs/dev/change-standard.md` prints `46:sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1`. |
| 4 | The state file's `verify:` block | at landing | The ledger is written on main. |

## Repair round 1

- Proof 1 and Standards 1: `launch.test.sh` has a codex launch with an empty note (case c5, exit file `exit 8`, no id file), and case a1 checks its exit file. The head comment and the README bullet now say what the test checks. Plant 7 turns the test red.
- Proof 2: the usage loop is replaced by `usage_error <message> <arguments>`, which checks exit 64 and the message for every `fail_usage` call in `launch.sh`: each `--<x> is required`, each `--<x> is not a transcript option`, the codex-only and codex-required options, the note options, the absolute `--note`, the unknown mode and option, the unexpected argument, the missing value and the transcript path. Plants 1 to 6, 8, 9 and 10 turn it red; plant 10 changes only a message, so exit 64 alone would stay green.
- Proof 3 and 4: this report quotes the commands and their output.
- The README bullet is split into three sentences.

## What changes for a user

- The documented green check now runs `launch.test.sh` too: before, eight tests; after, nine, in the same order in all three lists.

## Planted failures

Ten plants in `launch.sh`, each turning `launch.test.sh` red (exit 1); the first failing line of each is in `agents/reviews/4-plants.md`.

## Verification

`grep -n 'test.sh' README.md docs/dev/building.md docs/dev/change-standard.md`, the command lines:

```text
README.md:105:sh skills/land/templates/land.test.sh
README.md:106:sh skills/ordo-init/templates/check_config.test.sh
README.md:107:sh skills/plan-retro/templates/collect_findings.test.sh
README.md:108:sh skills/repo-setup/templates/sync_rules.test.sh
README.md:109:sh skills/plan-orchestration/templates/launch.test.sh
README.md:110:sh utils/pin.test.sh
README.md:111:sh utils/check_skill_layout.test.sh
README.md:112:sh utils/check_rule_inventory.test.sh
README.md:113:sh utils/check_coverage.test.sh
docs/dev/building.md:6:sh skills/land/templates/land.test.sh                  # the landing script and usage.py; the example plan.yaml files against the state template
docs/dev/building.md:7:sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
docs/dev/building.md:8:sh skills/plan-retro/templates/collect_findings.test.sh
docs/dev/building.md:9:sh skills/repo-setup/templates/sync_rules.test.sh
docs/dev/building.md:10:sh skills/plan-orchestration/templates/launch.test.sh  # launch.sh with stub builders and a stub launch-note command
docs/dev/building.md:11:sh utils/pin.test.sh
docs/dev/building.md:12:sh utils/check_skill_layout.test.sh             # the layout check on complete and broken SKILL.md files
docs/dev/building.md:13:sh utils/check_rule_inventory.test.sh           # the rule inventory check on complete and broken inventories
docs/dev/building.md:14:sh utils/check_coverage.test.sh                 # the coverage check on complete and broken coverage lists
docs/dev/change-standard.md:42:sh skills/land/templates/land.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:43:sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:44:sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:45:sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:46:sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:47:sh utils/pin.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:48:sh utils/check_skill_layout.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:49:sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:50:sh utils/check_coverage.test.sh 2>&1 | tail -1
```

From the worktree root, the verify list exits 0 and prints:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
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
```

The ASCII check prints nothing. `sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` prints `PASS: launch.sh scratch tests`.
