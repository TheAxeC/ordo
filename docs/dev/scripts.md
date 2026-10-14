# Scripts

Every script in this repository outside `.scratch/` is listed here with its kind and its job. A development script is run by the person who works on Ordo. A user script is run by a skill or by the user of a repository that has Ordo set up. A test script runs scratch repositories or scratch files and proves a script. The change standard says that a change that adds, removes or renames a script updates this page ("Scripts compute facts; judgment is read" in `docs/dev/change-standard.md`).

## Development scripts

| Script | Job |
|---|---|
| `docs/figures/gen_figures.py` | Writes the two SVG figures of the README from the labels written in the file |
| `utils/check_coverage.py` | Checks that a coverage list names every file of the named skill folders once, with a mark and a reason |
| `utils/pin.sh` | Pins the installed skills and agents to a tag of this repository, or checks the pin |

## User scripts

| Script | Job |
|---|---|
| `skills/land/templates/checks.sh` | Runs a plan's verify list and says whether every command exited 0 |
| `skills/land/templates/land.sh` | Commits a step's work in its worktree, copies it onto main, runs the verify list there and prints the booking data |
| `skills/ordo-init/templates/check_config.py` | Checks `.agents/plan.yaml` against the plan skill's template and prints each error and note |
| `skills/plan-orchestration/templates/plan_cost.py` | Prices the usage of each agent role of a plan from the response bodies and the agents' transcripts |
| `skills/repo-setup/templates/sync_rules.py` | Compares the shared-rules block and the plan-terms block of a repository with their templates, and rewrites them on request |
| `skills/session-retro/templates/transcript_window.py` | Prints what was said and done in Claude Code transcripts, for a time window or for one Claude Code session, with secrets replaced |

## Test scripts

| Script | Proves |
|---|---|
| `skills/land/templates/land.test.sh` | `skills/land/templates/land.sh` |
| `skills/ordo-init/templates/check_config.test.sh` | `skills/ordo-init/templates/check_config.py` |
| `skills/repo-setup/templates/sync_rules.test.sh` | `skills/repo-setup/templates/sync_rules.py` with `--write` |
| `utils/pin.test.sh` | `utils/pin.sh` |
