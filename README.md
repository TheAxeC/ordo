# Ordo

Ordo is a set of agent skills for running a multi-step change as a plan: one roadmap entry becomes a ledger folder, each step is briefed, built in its own git worktree, reviewed by a fresh reviewer that changes nothing, and cherry-picked onto `main` only after its checks pass there. Around that loop, `repo-setup` and `ordo-init` set a repository up for it, `roadmap` keeps the entries the plans open, and `plan-retro` turns what the reviewers keep finding into rules. The skills carry no project name and no path. Everything specific to a repository comes from that repository's `.agents/plan.yaml`, so the same skills run a C++ engine, a TypeScript tool or a research project, under Claude Code or Codex, with either as the worker.

## The skills

| Skill | What it does |
|---|---|
| `repo-setup` | Sets up a new repository: `CLAUDE.md` with the shared rules and `AGENTS.md` linked to it, the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE`, the project skills, then `/ordo-init`; `sync` keeps an existing repository's shared rules equal to the template |
| `ordo-init` | Sets a repository up for the others: drafts `.agents/plan.yaml` from the repository, offers the pages it lacks, fixes the ignore rules; on an existing file, checks it |
| `roadmap` | Keeps the roadmap `/plan` opens entries from: shows the open entries in order, adds an entry with its goal, gate and place, moves, marks done with the gate's output, drops; learns the file's own format, including an ordered build plan over a capability map |
| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, `orchestrator-state.md` |
| `spec` | Prepares one step: checks the step's premises against the tree, writes the brief, creates the worktree, stages the base binaries |
| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes findings |
| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, books the step, commits by explicit path, removes the worktree |
| `plan-orchestration` | Runs an open plan unattended, step by step, and stops only where a decision belongs to the user |
| `plan-help` | Prints the command sequence, and for a named plan its position and the command that comes next |
| `plan-retro` | Reads every refuter report, groups the findings by kind, and for each kind that recurs proposes the rule, the standards page or the check that stops it |

The order of use, shortened from what `/plan-help` prints:

```
/repo-setup                   once, for a new repository: the tree, the shared rules, the standards, then /ordo-init
/ordo-init                    once per existing repository: writes .agents/plan.yaml, or checks the one there
/roadmap add <goal>           an entry with its goal, gate and place in the order
/plan <entry>                 once per entry: opens the plan, shows the step list for approval

for every step:
/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries
"build it"                    the session writes the code in the worktree, runs the checks, writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings
"close them"                  a repair round, up to repair_rounds times
/land <entry> <step>          onto main, checks on main, the booking, the commit

/plan-orchestration <entry>   instead of the step lines: runs them for every step unattended
/plan-retro                   after plans have run: the findings that recur, and the rule, page or check that stops each
```

`/plan-help` prints the full sequence, including what to do when a command stops.

## Requirements

- git, POSIX `sh`, and `python3` with PyYAML.
- `node` and `npx` on `PATH`, for `land/templates/land.sh` (its index-lock wait and the usage rows) and for the skills CLI, which the CLI install and `repo-setup`'s project skills use.
- Claude Code, Codex, or both.

## Install

The skills call each other and read each other's templates, so install all of them. Claude Code reads skills from `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills` for a second account); Codex reads `~/.agents/skills`. Remove any copy of these skills under a repository's `.agents/skills` or `.claude/skills`, so that the installed copy is the only one loaded.

### With the skills CLI

```sh
npx skills add TheAxeC/ordo --skill '*' -g -a claude-code -a codex
```

This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`.

### By copying the folders

```sh
rm -rf /tmp/ordo && git clone --depth 1 https://github.com/TheAxeC/ordo.git /tmp/ordo
for dir in ~/.claude/skills ~/.agents/skills; do
    mkdir -p "$dir"
    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do
        rm -rf "$dir/$skill" && cp -R /tmp/ordo/$skill "$dir/"
    done
done
```

For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders. Updating is the same commands again: each skill folder is replaced whole, so a file a newer version removes does not linger.

## Configuring a repository

A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills; shows the whole tree and every file; and after approval writes `CLAUDE.md` (with `AGENTS.md` as a symlink to it), the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`, installs the project skills (writing `skills-lock.json`), and runs `/ordo-init`.

The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->` and are a copy of `repo-setup/templates/shared-rules.md`. `/repo-setup sync` compares a repository's block with the template, shows the diff and rewrites it after approval; on a repository with no block yet it drafts where the block goes and which existing rules it replaces. The same comparison runs on its own:

```sh
python3 <skills>/repo-setup/templates/sync_rules.py <repository>
```

An existing repository opts in with `.agents/plan.yaml` at its root. Run `/ordo-init` from the repository root: it drafts the file from the repository, shows it with any page it would create and the `.gitignore` lines it would add, and writes after you approve. On a repository that already has the file, it checks it. The same check runs on its own:

```sh
python3 <skills>/ordo-init/templates/check_config.py <repository>
```

To write the file by hand, start from one of the two example files in the plan skill's `templates/` folder (`<skills>` is `~/.agents/skills` or `~/workspace/ordo`):

```sh
cp <skills>/plan/templates/plan.yaml .agents/plan.yaml            # one project
cp <skills>/plan/templates/plan.projects.yaml .agents/plan.yaml   # several projects; a plan is then named <project>/<entry>
```

`plan.yaml` describes every key. Eight are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker` and `reviewer`. A skill that needs a missing required key stops and names it. Every other key is optional, and when it is left out it takes the default written beside it in `plan.yaml`; for example, a missing `worktree_paths` means the whole tree and a missing `look` means no look step.

Git must ignore `worktree_root` and must not ignore `.agents/plan.yaml`.

## Tests

Each script under a skill's `templates/` has a test beside it that runs on scratch repositories:

```sh
sh land/templates/land.test.sh
sh ordo-init/templates/check_config.test.sh
sh plan-retro/templates/collect_findings.test.sh
sh repo-setup/templates/sync_rules.test.sh
sh utils/pin.test.sh
```

- `land.test.sh` proves the landing on scratch repositories, and checks that both example `plan.yaml` files carry exactly the keys the state template's configuration block needs, each optional key's value equal to its stated default.
- `check_config.test.sh` checks that `check_config.py` passes a complete configuration, in both forms, and names each kind of error.
- `collect_findings.test.sh` checks that the collector reads both heading styles of a refuter report and its repair rounds, skips closures and "none", reads a report once when the archive sits inside the ledger root, and starts after a previous retro.
- `sync_rules.test.sh` checks that a block equal to the template passes, a drifted block fails with its diff and is repaired by `--write`, and a missing block or a missing `AGENTS.md` symlink is refused.
- `pin.test.sh` checks that `pin.sh` links every skill of a tag from the pinned worktree, drops a skill the next tag removes, repairs a link into the live clone, and refuses, changing nothing, a worktree with local changes, a real directory or a foreign link in a skill folder, and an unknown tag.

## The landing script

`land/templates/land.sh` does the cherry-pick, the checks on `main` and the booking data as one command. A plan copies it into its ledger folder and makes the three `ADAPT` edits: `landing_tool_path` (the directory a step's changes are scoped to), the dependency install and verify commands with their pass rules, and the harness and model names in the usage rows. Copy `land.test.sh` beside it; it reads `landing_tool_path` from `land.sh` and proves the landing on scratch repositories.

`land.sh` finds `usage.py` beside itself, then in the land skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).

## Working on Ordo

This section is for changing Ordo itself. To use the skills, install them as above.

While Ordo is being changed, the installed skills must not change with it: the plan skills run the change, so they stay at a fixed version until the change is done. The installed skills are links into a pinned checkout, a detached git worktree of the clone at a tag, and the clone's `main` is where the work happens.

```sh
git clone https://github.com/TheAxeC/ordo.git ~/workspace/ordo
cd ~/workspace/ordo
utils/pin.sh v1.0.0      # the worktree ~/.local/share/ordo-stable at v1.0.0, every skill linked from it
utils/pin.sh             # checks that every link points into the pinned worktree; changes nothing
```

`pin.sh` links into `~/.claude/skills`, `~/.agents/skills` and, when it is set, `$CLAUDE_CONFIG_DIR/skills`; `ORDO_SKILL_DIRS` (space-separated) replaces that list and `ORDO_STABLE` moves the worktree. Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; going back is `utils/pin.sh <older tag>`. The pinned worktree is never edited, and `pin.sh` refuses to move one that has local changes.

## License

MIT. See `LICENSE`.
