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

- git, POSIX `sh`, and `python3` with PyYAML; the verify runner also needs `bash` and `ps`.
- `node` and `npx` on `PATH`, for `skills/land/templates/land.sh` (its index-lock wait and the usage rows) and for the skills CLI, which the CLI install and `repo-setup`'s project skills use.
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
        rm -rf "$dir/$skill" && cp -R /tmp/ordo/skills/$skill "$dir/"
    done
done
```

For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders. Updating is the same commands again: each skill folder is replaced whole, so a file a newer version removes does not linger.

## Configuring a repository

A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills; shows the whole tree and every file; and after approval writes `CLAUDE.md` (with `AGENTS.md` as a symlink to it), the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`, installs the project skills (writing `skills-lock.json`), and runs `/ordo-init`.

The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->` and are a copy of `skills/repo-setup/templates/shared-rules.md`. `/repo-setup sync` compares a repository's block with the template, shows the diff and rewrites it after approval; on a repository with no block yet it drafts where the block goes and which existing rules it replaces. The same comparison runs on its own (`<skills>` is `~/.agents/skills`, or `skills/` in a clone):

```sh
python3 <skills>/repo-setup/templates/sync_rules.py <repository>
```

An existing repository opts in with `.agents/plan.yaml` at its root. Run `/ordo-init` from the repository root: it drafts the file from the repository, shows it with any page it would create and the `.gitignore` lines it would add, and writes after you approve. On a repository that already has the file, it checks it. The same check runs on its own:

```sh
python3 <skills>/ordo-init/templates/check_config.py <repository>
```

To write the file by hand, start from one of the two example files in the plan skill's `templates/` folder:

```sh
cp <skills>/plan/templates/plan.yaml .agents/plan.yaml            # one project
cp <skills>/plan/templates/plan.projects.yaml .agents/plan.yaml   # several projects; a plan is then named <project>/<entry>
```

`plan.yaml` describes every key. Eight are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker` and `reviewer`. A skill that needs a missing required key stops and names it. Every other key is optional, and when it is left out it takes the default written beside it in `plan.yaml`; for example, a missing `worktree_paths` means the whole tree and a missing `look` means no look step. `launch_note` holds the absolute path of a command that records each builder the orchestrator starts as its own process, following the interface in the plan-orchestration skill's `templates/launch-note.md`; left empty, nothing is recorded.

Git must ignore `worktree_root` and must not ignore `.agents/plan.yaml`.

## Tests

Each script under a skill's `templates/` or under `utils/` has a test beside it that runs on scratch repositories:

```sh
sh skills/land/templates/land.test.sh
sh skills/ordo-init/templates/check_config.test.sh
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh skills/plan-orchestration/templates/launch.test.sh
sh utils/pin.test.sh
sh utils/verify.test.sh
sh utils/check_skill_layout.test.sh
sh utils/check_rule_inventory.test.sh
sh utils/check_coverage.test.sh
```

- `land.test.sh` proves the landing on scratch repositories, and checks that both example `plan.yaml` files carry exactly the keys the state template's configuration block needs, each optional key's value equal to its stated default.
- `check_config.test.sh` checks that `check_config.py` passes a complete configuration, in both forms, and names each kind of error.
- `collect_findings.test.sh` checks that the collector reads both heading styles of a refuter report and its repair rounds, skips closures and "none", reads a report once when the archive sits inside the ledger root, and starts after a previous retro.
- `sync_rules.test.sh` checks that a block equal to the template passes, a drifted block fails with its diff and is repaired by `--write`, and a missing block or a missing `AGENTS.md` symlink is refused.
- `launch.test.sh` runs `launch.sh` with stub `claude`, `codex` and launch-note commands, in paths that contain spaces. It checks that each recipe runs with its exact arguments and keeps the builder's exit code with no note, an empty note and a note (`start`, the builder, `end`, then `transcript`). It also covers a resumed session for each harness, the ways `start` can fail to give an id, a launch that returns before its builder ends and survives a hangup, an exit file left by an earlier run, relative files, and every usage error with its message.
- `pin.test.sh` runs every case under a scratch `HOME` whose path holds a space, writes only under its two scratch roots, and checks that no path a split of a skill folder on a space would name appears. In pin mode it covers the link of every skill of a tag, the removal of a link to a skill the next tag drops, the replacement of a live-clone link for a skill the tag holds, a line printed for each change and none for a write that failed, and the summary line's folders joined by `, `. Check mode is tested on a link into the live clone, named once, and on a link into the pinned worktree for a skill the tag lacks. Its other cases are the check after linking on a link that could not be made, a pinned worktree deleted by hand and created again while another missing worktree keeps its registration, and the default folders, the `$CLAUDE_CONFIG_DIR` folder and both forms of `ORDO_SKILL_DIRS`, the space-separated form split on spaces and tabs. Each refusal is checked with its message and shown to change nothing: a link into the live clone for a skill the tag lacks, a worktree with local changes, a path that exists and is not a git worktree, a real directory or a foreign link in a skill folder, an unknown tag, an `ORDO_SKILL_DIRS` that names no folder, a folder that is not an absolute path, and one with leading or trailing whitespace.
- `verify.test.sh` checks that `verify.sh` passes a list holding a summary test, a plain command and a command written as a folded scalar, and turns red on a summary test that prints `PASS:` but exits 1, a summary test whose last line does not start with `PASS:`, and a plain command that exits 1. It checks that a test printing `PASS:` and exiting 1 is red under each spelling of a pipe into `tail`: `| tail -n 1`, two spaces before the pipe, no `2>&1`, no spaces, a redirection or `;` after `tail`, a comment holding a pipe, a backslash-newline, `| grep PASS | tail -1`. It checks that a pipe inside quotes runs as written, that a command ending in `; true` is judged on its exit status, that a command reads end-of-file from standard input, that quotes, a newline and a carriage return reach a command as written, that `yml` and `YAML` fences count, and that the run stops at the first red command. Each of INT, HUP, QUIT and TERM stops the running command and its session at once, runs no later command, removes the scratch folder and exits 128 plus the signal number, a command that ignores TERM is killed, and so is a second process group in the command's session. Each state file the runner cannot use exits 64 with its message: a missing file, a file that is not UTF-8, no `yaml` block, a `verify:` list that is missing, empty or not a list, a command that is empty, not a string or holds a NUL, a block that is not valid YAML or never closed, and a list found only in a second `yaml` block. A missing `python3`, PyYAML, `bash` or `ps` exits 69, a command killed by a signal reports exit status 128 plus the signal number, and a scratch folder that cannot be created exits 1. The file runs itself twice, starting the runner with `sh` and, when it is installed, with `dash`; each run ends with its own `PASS:` line, which the outer run checks, and the outer `PASS:` line names the shells the runner ran under.
- `check_skill_layout.test.sh` checks that `check_skill_layout.py` passes a complete `SKILL.md`, and fails one per rule of `docs/dev/skill-layout.md` it enforces: the frontmatter, the title, the section order, what each section holds, the table headers, bold outside a label, a version tag in a heading; and that headings and bold inside fenced code of any form are not read.
- `check_rule_inventory.test.sh` checks that `check_rule_inventory.py` passes a complete inventory and fails each error it exists to catch: a header line missing or given twice, a commit that is not a hexadecimal id or not in the repository, an old or new path outside the repository, a missing new file, an old or new file that is not UTF-8, a table header or cell count that is wrong, a row after the table, an old line with text in no row, a range that is malformed, out of bounds or backwards, a range that crosses a blank line, a heading, a frontmatter delimiter or a fence boundary, or opens more than one list item (at any depth, with any marker), table row or frontmatter key, an empty rule, an unknown section or subsection, and an item number of 0 or past the end. It also checks what is not an error: a YAML comment and a fenced `~~~` line needing a row, a row of dashes that is not a separator, an inventory table without a separator row, a row naming one heading line alone, fenced rows in the inventory, an escaped pipe in a rule, section names holding ` / ` or ending in a digit, and fenced lines, nested bullets, indented tables and table headers not counted as items.
- `check_coverage.test.sh` checks that `check_coverage.py` passes a complete coverage list (a hidden file, a nested file, an escaped pipe, the same file name in two skills' sections, a lettered roadmap entry, an empty table for an empty folder, a skill folder that is a link, fenced lines, a backtick in a fence's info string that opens no fence, and closing hashes), and reads only the sections of the skills named on the command line, with a control that reads a malformed one when it is named; a skill named twice on the command line is checked once, so each of its errors is printed once. It fails each error it exists to catch: a file not listed, listed twice or in the wrong section, a listed path that is no file or is not a plain relative path, a file cell not in backticks, an unknown mark or a mark naming a skill the New skills table does not hold, an empty reason, a wrong cell count or table header, a missing separator row, a row after the table, a section with no table, a missing or repeated section, a fence left open, a link inside a skill folder, and in New skills an entry that is not in the roadmap, including one whose roadmap heading is written with a trailing dot after its letter (`## 6.B.`), a skill named twice, or an empty cell. It exits 2 on each usage error it exercises: no skill argument, a missing skills root, a missing skill folder, a missing coverage list, a missing roadmap, a list that is not UTF-8, and a list outside a git repository; and every run checks that the check changed nothing under its scratch folder.

The skills themselves are checked against `docs/dev/skill-layout.md`, from the repository root; the check prints `ok: <path>` for each skill that follows the layout and each error with its file and line, and exits 0 when every skill passes:

```sh
python3 utils/check_skill_layout.py
```

A plan's verify list, the `verify:` key of the first `yaml` or `yml` block of its `orchestrator-state.md`, runs through `sh utils/verify.sh <state file>` from the root of the checkout it checks. The runner needs `python3` with PyYAML, `bash` and `ps`. It runs each command as written through `bash -o pipefail -c`, so a pipeline fails when any of its stages fails, and a test that exits non-zero in a pipeline into `tail` makes the pipeline fail however the pipe is spelled. The runner judges the status the whole command returns, so a command that consumes a pipeline's status itself (`!`, `if`, `while`, `||`, or a pipeline sent to the background with `&`) passes or fails on what it returns.

A command whose text after its last single pipe is `tail` and its options prints a test's summary: it passes only when it exits 0 and its last line starts with `PASS:`, and the runner prints that line. Any other command, one ending in `; true` included, passes when it exits 0, and the runner prints its whole output. The runner stops at the first red command and prints the command, its exit status and its output.

Each command runs in a session of its own with standard input from `/dev/null`. On INT, HUP, QUIT or TERM the runner sends TERM to every process group of that session and KILL two seconds later, removes its scratch folder and exits 128 plus the signal number. It behaves the same started with `sh`, `bash` or `dash`. Its exit status:

- `0`: every command passed.
- `1`: a command is red, or the scratch folder cannot be created under `$TMPDIR` (default `/tmp`).
- `64`: no single argument; a state file that cannot be read or is not UTF-8; no `yaml` block, or a first one that is never closed or is not valid YAML; no `verify:` key, a `verify:` key that is not a list, or an empty list; a command that is not a string, is empty or holds a NUL character.
- `69`: `python3`, PyYAML, `bash` or `ps` is missing.
- `128` plus the signal number: INT, HUP, QUIT or TERM stopped the run.

## The landing script

`skills/land/templates/land.sh` does the cherry-pick, the checks on `main` and the booking data as one command. A plan copies it into its ledger folder and makes the three `ADAPT` edits: `landing_tool_path` (the directory a step's changes are scoped to), the dependency install and verify commands with their pass rules, and the harness and model names in the usage rows. Copy `land.test.sh` beside it; it reads `landing_tool_path` from `land.sh` and proves the landing on scratch repositories.

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

`pin.sh` links into `~/.claude/skills`, `~/.agents/skills` and, when it is set, `$CLAUDE_CONFIG_DIR/skills`, and works with a home folder whose path holds a space. Every skill folder must be an absolute path with no leading or trailing whitespace, and the refusal quotes the folder. `ORDO_STABLE` moves the worktree. The summary line names the folders joined by `, `.

`ORDO_SKILL_DIRS` replaces the list of folders. It is split on spaces and tabs, or read one folder per line when it holds a newline, which is the form for a folder whose path holds a space. A list that names no folder is refused.

Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; going back is `utils/pin.sh <older tag>`. The pinned worktree is never edited, and `pin.sh` refuses to move one that has local changes. A pinned worktree deleted by hand is created again at the next `utils/pin.sh <tag>`, through `git worktree add --force`, which leaves the registration of every other worktree of the clone as it is.

Check mode fails on a link into the live clone and on a link into the pinned worktree whose skill the tag lacks, and prints each one. Pin mode checks the links before it changes the worktree or any link. A link into the live clone for a skill the tag lacks is a refusal: `pin.sh` prints it, exits 1 and changes nothing. A link into the live clone for a skill the tag holds is replaced, and a link into the pinned worktree whose skill the tag lacks is removed, each with a line that names it.

## License

MIT. See `LICENSE`.
