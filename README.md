# Ordo

Ordo is a set of agent skills for Claude Code that run a multi-step change as a plan. The skills carry no project name and no path. Everything specific to a repository comes from that repository's `.agents/plan.yaml`. The same skills therefore run a C++ engine, a TypeScript tool or a research project.

One roadmap entry becomes a plan, kept in a ledger folder. Each step of the plan gets a brief, its written specification, and is built in its own git worktree. A fresh reviewer that changes nothing reviews the step. The step is cherry-picked onto `main` only after its checks pass there.

Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, `grill` settles an entry's design decisions before its plan opens, `diagnose` finds the cause of a defect, inside a plan's loop or on its own, and `plan-retro` turns what the reviewers keep finding into rules. `session-retro` reads the transcripts of Claude Code sessions and proposes a change to a named rule, skill or brief for what went well and for what went wrong.

## The skills

| Skill | What it does |
|---|---|
| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. It can install the git guard, a hook that refuses an agent's `git push`, `git reset --hard`, forced `git clean` and whole-tree `git checkout` or `git restore`, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
| `ordo-init` | Sets a repository up for the other skills. It drafts `.agents/plan.yaml` from the repository, offers the pages it lacks and fixes the ignore rules. On an existing file, it checks the file |
| `roadmap` | Keeps the roadmap that `/plan` opens entries from. It shows the open entries in order and the entries not yet specified. It adds an entry with its goal, a gate that could not pass without the goal being reached, and its place, or puts work whose gate cannot yet be named under "Not yet specified". It moves an entry, marks one done with the gate's output, and drops one. It learns the file's own format, including an ordered build plan over a capability map |
| `grill` | Interviews the user about one roadmap entry, in rounds. Each round asks every decision whose prerequisites are settled, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, while agents look up the facts. It writes each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry and the glossary, and on the user's yes a proposed ADR |
| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, `orchestrator-state.md`. It refuses an entry not yet specified |
| `spec` | Prepares one step. It checks that the user approved the step and checks the step's premises against the tree. It writes the brief and checks the paths it writes against the steps in flight. A fresh read-only agent checks the brief against the tree, and each finding is closed in the brief. It creates the worktree and stages the base binaries |
| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes a verdict per item of the brief and per case, and findings each with its failure scenario |
| `diagnose` | Finds the cause of a defect before anything is changed. It runs one command red on the exact symptom, shrinks the case, ranks three to five hypotheses, makes one change per probe, and writes the fix with its test and a diagnosis record. Inside a plan it probes on a scratch copy and leaves the step's worktree unchanged; run by a person it waits for the reply to the hypotheses |
| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, books the step, commits by explicit path, removes the worktree |
| `plan-orchestration` | Runs an open plan unattended, step by step, and stops only where a decision belongs to the user |
| `ordo-help` | Prints the command sequence, and for a named plan its position and the command that comes next |
| `plan-retro` | Reads every refuter report and groups the findings by kind. For each kind that recurs, it proposes the rule sentence, the change to the text that should have prevented it, or the standards page that stops it, and a check only for a fact a machine computes, which the user approves |
| `session-retro` | Reads the transcripts of a plan's Claude Code sessions, of one session or of a time window. It reports what went well, to keep, and what went wrong, to change. Each point quotes its place and proposes a change to a rule, skill or brief, which the user decides on |

The order of use, shortened from what `/ordo-help` prints:

```
/repo-setup                   once, for a new repository: the tree, the shared rules, the standards, then /ordo-init
/ordo-init                    once per existing repository: writes .agents/plan.yaml, or checks the one there
/roadmap add <goal>           an entry with its goal, gate and place in the order
/roadmap add <entry>          for an entry not yet specified: its gate and place in the order, before /plan opens it
/grill <entry>                optional: an interview in rounds that settles the entry's design decisions, written as they settle
/plan <entry>                 once per entry: opens the plan, shows the step list for approval

for every step:
/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree once per step (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries
"build it"                    the session writes the code in the worktree, runs the checks, writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings
/diagnose <entry> <step> <finding>
                              optional: when a finding's cause is not known, finds it before "close them"
"close them"                  a repair round, up to repair_rounds times
/land <entry> <step>          onto main, checks on main, the booking, the commit

/plan-orchestration <entry>   instead of the step lines: runs them for every step unattended
/plan-retro                   after plans have run: the findings that recur, and the rule sentence, text change or page that stops each, a check only for a fact
/session-retro <entry>        for a plan, open or closed: what went well and what went wrong in its Claude Code sessions, each with a proposed change
/diagnose <symptom>           at any time, outside a plan: the cause of a defect, from a command red on it, before any fix
```

`/ordo-help` prints the full sequence, including what to do when a command stops.

The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".

![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)

The loop of one step carries the same marks, with the band that runs the loop unattended below it.

![The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)

## Requirements

- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/checks.sh`, also needs `bash`. The git guard that `repo-setup` can install needs `python3` 3.9 or later.
- `perl`, for the ASCII check of `docs/dev/building.md` and for `sync_rules.test.sh`.
- `node` and `npx` on `PATH`, for the skills CLI only. Both the CLI install and `repo-setup`'s project skills use that CLI.
- Claude Code.

## Install

The skills call each other and read each other's templates, so install all of them. Claude Code reads skills from `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills` for a second account). Remove any copy of these skills under a repository's `.agents/skills` or `.claude/skills`, so that the installed copy is the only one loaded.

The plan skills launch their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, which Claude Code reads from `~/.claude/agents` (or `$CLAUDE_CONFIG_DIR/agents`). `CLAUDE_CODE_EFFORT_LEVEL` must be unset, since it overrides the effort each definition sets.

### With the skills CLI

```sh
npx skills add TheAxeC/ordo --skill '*' -g -a claude-code
```

This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`. After an update, `npx skills ls -g` lists the installed skills, and `npx skills remove --global <skill>` removes a skill a newer version of Ordo no longer ships.

The CLI installs and updates skills only. After `npx skills add`, and after each `npx skills update -g`, copy the agents from a clone:

```sh
rm -rf /tmp/ordo && git clone --depth 1 https://github.com/TheAxeC/ordo.git /tmp/ordo
mkdir -p ~/.claude/agents
rm -f ~/.claude/agents/ordo-*.md
cp /tmp/ordo/agents/*.md ~/.claude/agents/
```

For a second Claude Code account, run the last three commands again with `$CLAUDE_CONFIG_DIR/agents` in place of `~/.claude/agents`.

### By copying the folders

```sh
rm -rf /tmp/ordo && git clone --depth 1 https://github.com/TheAxeC/ordo.git /tmp/ordo
for dir in ~/.claude/skills; do
    mkdir -p "$dir"
    for skill in diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec; do
        rm -rf "$dir/$skill" && cp -R /tmp/ordo/skills/$skill "$dir/"
    done
    agents=$(dirname "$dir")/agents
    mkdir -p "$agents"
    rm -f "$agents"/ordo-*.md && cp /tmp/ordo/agents/*.md "$agents/"
done
```

The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger. The loop replaces only the skill folders it copies. Remove a skill a newer version of Ordo no longer ships from each folder of the list by hand: `rm -rf ~/.claude/skills/<skill>`, and for a second account `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"`.

## Configuring a repository

A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, the project skills, and whether to install the git guard. It then shows the whole tree and every file's text, the git guard hook named by its source. After your approval it writes `CLAUDE.md`, the change and prose standards, the standards pages (by default the design principles, the coding standards for its languages and, with a user interface, the UI standard), a roadmap, a glossary, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. On yes to the git guard, it also copies the guard into `.claude/hooks/`, which stays in the clone. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`. After `/ordo-init` and the checks it prints the guard's settings text for you to add; it writes no settings file.

The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->`. They are a copy of `skills/repo-setup/templates/shared-rules.md`. The plan terms in `docs/glossary.md` sit between `<!-- ordo:plan-terms begin -->` and `<!-- ordo:plan-terms end -->`. They are a copy of `skills/repo-setup/templates/plan-terms.md`, and the project's own terms follow them.

`/repo-setup sync` compares both blocks with their templates, shows the diff of each block that differs and rewrites it after approval. On a repository with no block yet, it drafts where the block goes and which existing rules or glossary entries it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone), and `--only glossary` compares the plan-terms block alone, for a repository whose `CLAUDE.md` has no shared-rules block:

```sh
python3 <skills>/repo-setup/templates/sync_rules.py <repository>
python3 <skills>/repo-setup/templates/sync_rules.py <repository> --only glossary
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

Every other key is optional. A key left out takes the default the comment beside it in the example `plan.yaml` gives. For example, a missing `worktree_paths` means the whole tree, and a missing `look` means that no changed view is opened at landing.

Git must ignore `worktree_root` and must not ignore `.agents/plan.yaml`.

A plan's verify list is the `verify:` key of the first `yaml` or `yml` block of its `orchestrator-state.md`. It runs through `sh <the land skill's folder>/templates/checks.sh <state file>`, from the root of the repository it checks.

Each command runs through `bash -o pipefail -c` and passes when it exits 0. The run stops at the first command that fails. Each command in the list exits non-zero when it fails, as written, and a command with long output uses its tool's quiet mode or a filter under `pipefail`. The head comment of `skills/land/templates/checks.sh` states what it prints and its exit statuses.

## The landing script

`skills/land/templates/land.sh` does the cherry-pick and the checks on `main` as one command, run from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It runs from the `land` skill itself, and nothing is copied into the ledger.

`land.sh` reads `worktree_root` and `ledger_root` from `.agents/plan.yaml`, and refuses with exit 64 when either is missing. In the `projects:` form it reads those of the project whose `ledger_root` holds the state file. After main's cherry-pick it runs the verify list through the `checks.sh` in its own folder. It then prints the data for the step's booking in the plan: the diff stat against the base and the staged paths.

A ledger file left uncommitted in the worktree, such as a builder's report, never reaches `main`, while one that a commit of the step holds does. `land.test.sh` proves `land.sh` on scratch repositories, and `checks.test.sh` proves `checks.sh` on scratch state files. The land skill's section "The landing script" in `skills/land/SKILL.md` states the rest, including the refusals and the exit statuses.

## Working on Ordo

While Ordo is being changed, the installed skills and agents must not change with it: the plan skills run the change, so they stay at a fixed version until the change is done. The installed skills and agents are links into a pinned checkout, a detached git worktree of the clone at a tag, and the clone's `main` is where the work happens.

```sh
git clone https://github.com/TheAxeC/ordo.git ~/workspace/ordo
cd ~/workspace/ordo
utils/pin.sh v1.1.0      # the worktree ~/.local/share/ordo-stable at v1.1.0, every skill and every agent linked from it
utils/pin.sh             # checks that every link points into the pinned worktree; changes nothing
```

`pin.sh` links the skills into `~/.claude/skills` and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into the `agents` folder beside each skill folder: `~/.claude/agents`, `$CLAUDE_CONFIG_DIR/agents`, or the sibling of each folder of `ORDO_SKILL_DIRS`. `ORDO_STABLE` moves the pinned worktree to another path.

Check mode, `utils/pin.sh` with no tag, changes nothing and fails on each link into the clone and on each link into the pinned worktree for a skill or an agent the pinned tag lacks. Pin mode, `utils/pin.sh <tag>`, checks the links first and refuses, changing nothing, a link into the clone for a skill or an agent the tag lacks. It then links every skill and every agent of the tag, replaces each link into the clone, and removes each link into the pinned worktree for a skill or an agent the tag lacks.

Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; going back is `utils/pin.sh <older tag>`. The pinned worktree is never edited, and `pin.sh` refuses to move one that has local changes. A pinned worktree deleted by hand is created again at the next `utils/pin.sh <tag>`, through `git worktree add --force`, which leaves the registration of every other worktree of the clone as it is.

`pin.sh` also removes the links into Ordo that it finds in `~/.agents/skills`. The head comment of `utils/pin.sh` states the rest: the format of `ORDO_SKILL_DIRS`, folders whose path holds a space, what an agent of a tag is, the refusals, the rules for `~/.agents/skills` and the lines each mode prints.

`docs/dev/building.md` lists the tests and checks to run before a change is committed.

## License

MIT. See `LICENSE`.
