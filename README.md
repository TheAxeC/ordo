# Ordo

Ordo is a set of agent skills for Claude Code that run a multi-step change as a plan. The skills carry no project name and no path. Everything specific to a repository comes from that repository's `.agents/plan.yaml`. The same skills therefore run a C++ engine, a TypeScript tool or a research project.

One roadmap entry becomes a plan, kept in a ledger folder. Each step of the plan gets a brief, its written specification, and is built in its own git worktree. A fresh reviewer that changes nothing reviews the step. The step is cherry-picked onto `main` only after its checks pass there.

Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, and `plan-retro` turns what the reviewers keep finding into rules.

## The skills

| Skill | What it does |
|---|---|
| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, a roadmap, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. `sync` keeps an existing repository's shared rules equal to the template |
| `ordo-init` | Sets a repository up for the other skills. It drafts `.agents/plan.yaml` from the repository, offers the pages it lacks and fixes the ignore rules. On an existing file, it checks the file |
| `roadmap` | Keeps the roadmap that `/plan` opens entries from. It shows the open entries in order and adds an entry with its goal, gate and place. It moves an entry, marks one done with the gate's output, and drops one. It learns the file's own format, including an ordered build plan over a capability map |
| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, `orchestrator-state.md`, the landing script |
| `spec` | Prepares one step. It checks that the user approved the step and checks the step's premises against the tree. It writes the brief and checks the paths it writes against the steps in flight. It creates the worktree and stages the base binaries |
| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes findings |
| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, books the step, commits by explicit path, removes the worktree |
| `plan-orchestration` | Runs an open plan unattended, step by step, and stops only where a decision belongs to the user |
| `plan-help` | Prints the command sequence, and for a named plan its position and the command that comes next |
| `plan-retro` | Reads every refuter report and groups the findings by kind. For each kind that recurs, it proposes the rule, the standards page or the check that stops it |

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

- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/verify.sh`, also needs `bash` and `ps`.
- `perl`, for the ASCII check of `docs/dev/building.md` and for `sync_rules.test.sh`.
- `node` and `npx` on `PATH`. `skills/land/templates/land.sh` needs them for its wait on git's index lock and for the usage rows. The skills CLI needs them too, and both the CLI install and `repo-setup`'s project skills use that CLI.
- Claude Code.

## Install

The skills call each other and read each other's templates, so install all of them. Claude Code reads skills from `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills` for a second account). Remove any copy of these skills under a repository's `.agents/skills` or `.claude/skills`, so that the installed copy is the only one loaded.

### With the skills CLI

```sh
npx skills add TheAxeC/ordo --skill '*' -g -a claude-code
```

This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`.

### By copying the folders

```sh
rm -rf /tmp/ordo && git clone --depth 1 https://github.com/TheAxeC/ordo.git /tmp/ordo
for dir in ~/.claude/skills; do
    mkdir -p "$dir"
    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do
        rm -rf "$dir/$skill" && cp -R /tmp/ordo/skills/$skill "$dir/"
    done
done
```

For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders. Updating is the same commands again: each skill folder is replaced whole, so a file a newer version removes does not linger.

## Configuring a repository

A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills. It then shows the whole tree and every file. After your approval it writes `CLAUDE.md`, the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`.

The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->`. They are a copy of `skills/repo-setup/templates/shared-rules.md`.

`/repo-setup sync` compares a repository's block with the template, shows the diff and rewrites the block after approval. On a repository with no block yet, it drafts where the block goes and which existing rules it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone):

```sh
python3 <skills>/repo-setup/templates/sync_rules.py <repository>
```

An existing repository opts in with `.agents/plan.yaml` at its root. Run `/ordo-init` from the repository root. It drafts the file from the repository and shows it, with any page it would create and the `.gitignore` lines it would add. It writes after you approve.

On a repository that already has the file, `/ordo-init` checks it. The same check runs on its own:

```sh
python3 <skills>/ordo-init/templates/check_config.py <repository>
```

To write the file by hand, start from one of the two example files in the plan skill's `templates/` folder:

```sh
cp <skills>/plan/templates/plan.yaml .agents/plan.yaml            # one project
cp <skills>/plan/templates/plan.projects.yaml .agents/plan.yaml   # several projects; a plan is then named <project>/<entry>
```

The example `plan.yaml` describes every key. Nine are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker`, `reviewer` and `libraries`. A skill that needs a missing required key stops and names it.

Every other key is optional. A key left out takes the default written beside it in the example `plan.yaml`. For example, a missing `worktree_paths` means the whole tree, and a missing `look` means that no changed view is opened at landing.

Git must ignore `worktree_root` and must not ignore `.agents/plan.yaml`.

A plan's verify list is the `verify:` key of the first `yaml` or `yml` block of its `orchestrator-state.md`. It runs through `sh <skills>/land/templates/verify.sh <state file>`, from the root of the repository it checks.

A command ending in a pipe into `tail` passes only when it exits 0 and its last line starts with `PASS:`. Any other command passes when it exits 0. The run stops at the first command that fails. The head comment of `skills/land/templates/verify.sh` states the rest: the pipe rule in full, what the runner prints, how each command is started, the signals and the exit statuses.

## The landing script

`skills/land/templates/land.sh` does the cherry-pick and the checks on `main` as one command. It also prints the data for the step's booking in the plan: the diff stat, the usage rows (the tokens, tool uses and time of each agent) and the staged paths. `/plan` copies it into the ledger folder when it opens the plan, with `land.test.sh`, `verify.sh` and `usage.py` beside it. `/land` refuses a ledger without it. `/plan` also makes the `ADAPT` edits from `.agents/plan.yaml`:

- `landing_worktree_root`: the `worktree_root` key, the folder that holds a step's worktree, `.agents/worktrees` by default.
- `landing_tool_path`: the directory a step's changes are scoped to, `.` for the whole tree by default.
- `landing_ledger_root`: the `ledger_root` key.
- The `ADAPT` block: the dependency install and any check beyond the verify list with their pass rules. It is empty by default, so the template runs no step that belongs to one project.
- The model names in the usage rows.

`land.sh` finds `verify.sh` and `usage.py` beside itself, and otherwise in the land skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`). A ledger file left uncommitted in the worktree, such as a builder's report, never reaches `main`, while one that a commit of the step holds does. `land.test.sh` reads `landing_tool_path` and `landing_ledger_root` from the `land.sh` beside it. The land skill's section "The landing script" in `skills/land/SKILL.md` states the rest, including the check on `main`, the refusals and what `land.test.sh` proves.

## Working on Ordo

While Ordo is being changed, the installed skills must not change with it: the plan skills run the change, so they stay at a fixed version until the change is done. The installed skills are links into a pinned checkout, a detached git worktree of the clone at a tag, and the clone's `main` is where the work happens.

```sh
git clone https://github.com/TheAxeC/ordo.git ~/workspace/ordo
cd ~/workspace/ordo
utils/pin.sh v1.1.0      # the worktree ~/.local/share/ordo-stable at v1.1.0, every skill linked from it
utils/pin.sh             # checks that every link points into the pinned worktree; changes nothing
```

`pin.sh` links the skills into `~/.claude/skills` and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`. `ORDO_SKILL_DIRS` replaces that list of folders. `ORDO_STABLE` moves the pinned worktree to another path.

Check mode, `utils/pin.sh` with no tag, changes nothing and fails on each link into the clone and on each link into the pinned worktree for a skill the pinned tag lacks. Pin mode, `utils/pin.sh <tag>`, checks the links first and refuses, changing nothing, a link into the clone for a skill the tag lacks. It then links every skill of the tag, replaces each link into the clone, and removes each link into the pinned worktree for a skill the tag lacks.

Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; going back is `utils/pin.sh <older tag>`. The pinned worktree is never edited, and `pin.sh` refuses to move one that has local changes. A pinned worktree deleted by hand is created again at the next `utils/pin.sh <tag>`, through `git worktree add --force`, which leaves the registration of every other worktree of the clone as it is.

`pin.sh` also removes the links into Ordo that it finds in `~/.agents/skills`. The head comment of `utils/pin.sh` states the rest: the format of `ORDO_SKILL_DIRS`, folders whose path holds a space, the refusals, the rules for `~/.agents/skills` and the lines each mode prints.

`docs/dev/building.md` lists the tests and checks to run before a change is committed.

## License

MIT. See `LICENSE`.
