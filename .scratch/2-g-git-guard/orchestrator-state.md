# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.G of `docs/roadmap.md`, git guard. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
- sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # the default worker.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # steps in flight at once, from .agents/plan.yaml.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer and a brief-check agent run at: low, medium, high, xhigh or max.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Step 2a, what the alias lookup reads (2026-09-30, stop at /spec, from the brief check `agents/reviews/2a-brief-check.md`): your ruling "Git aliases" approved one computation: for a git subcommand the guard does not know, it runs `git config --get alias.<name>` in the command's directory (after `-C`) and checks the expansion. The brief check probed git 2.49.0 and found that this sentence, built as written, misses aliases that git runs, and that the brief added a block you have not approved. What the probes show:
  - git compares an alias name without regard to case over the whole key: with `[alias "A.b"] c = version` in a configuration file, `git a.b.c` runs the alias and `git config --get alias.a.b.c` prints nothing.
  - git finds its configuration through more than the directory: `--git-dir`, `-c include.path=<file>`, `--config-env`, and `GIT_DIR`, `GIT_CONFIG_GLOBAL`, `HOME` or `XDG_CONFIG_HOME` assigned in front of the command each ran an alias that the brief's lookup did not find.
  - `git -C "$PWD" p`: the guard reads the word `$PWD` and not its value, the lookup cannot enter a folder of that name, and the brief then allowed the command, an alias of the global file included.
  - `cd <repo> && git p` is looked up in the directory of the hook event, not in `<repo>`.
  - A limit of 5 seconds for each lookup is no limit for a command with many subcommands: by Claude Code's hook documentation a hook that runs past 60 seconds is ignored and the command runs (the 60 seconds are not verified on the running version).
  - An alias value that is not UTF-8 ends the guard in a traceback, which Claude Code treats as "allow".
  - The brief blocked a command whose lookup does not end. That is a sixth kind of block with its own message, outside your ruling.
  Options:
  - (a) The lookup reads the configuration the command itself would read. Your ruling on (a) approves that the guard computes the following, and nothing else new:
    - The lookup. For a git command whose subcommand is none of the operations the guard checks and is no alias given inline, the guard runs `git <options> config --null --get-regexp '^alias\.'` once and reads every alias from its output. `<options>` are the command's own `-C`, `--git-dir`, `--work-tree`, `-c` and `--config-env` options, in the order written. The process runs without a shell, from the command's directory, with its standard input closed and its standard error discarded; its output is decoded as UTF-8 with a replacement character for a byte that is not. Its environment is the guard's own, plus these variables when the command assigns them in front of `git`: `GIT_DIR`, `GIT_WORK_TREE`, `GIT_COMMON_DIR`, `GIT_CONFIG_GLOBAL`, `GIT_CONFIG_SYSTEM`, `GIT_CONFIG_NOSYSTEM`, `HOME`, `XDG_CONFIG_HOME`, `GIT_CONFIG_COUNT` with its `GIT_CONFIG_KEY_<n>` and `GIT_CONFIG_VALUE_<n>`, and `GIT_CONFIG_PARAMETERS`.
    - The name. The subcommand is compared with the text after `alias.` of each key without regard to case, and the last value git prints for a name is the alias, as git itself chooses.
    - The command's directory. It is the hook event's `cwd` (the guard's own directory when the event has none), changed by each `cd <dir>` or `pushd <dir>` with one literal operand that stands earlier in the same command list and is joined to the git command by `;`, a newline or `&&`, up to the `)` that closes the subshell or substitution it stands in, and by the directory option of a wrapper the guard reads (`env -C <dir>`, `sudo -D <dir>`). A `cd` in a pipeline, in the background or after `||`, `cd -`, `cd` with no operand and `popd` change nothing.
    - A value the guard cannot read. An option value, an assigned value or a `cd` operand that the shell would expand (it holds `$`, a backtick, a substitution, a glob character or a leading `~`) is left out of the lookup, which then runs with the rest, so the global file is still read. The form is listed in the head comment under "Not seen".
    - A `!` alias. Its text is checked from the repository's top folder, where git runs it, read with `git <options> rev-parse --show-toplevel`; when that fails, from the command's directory.
    - The results. Exit 0 gives the aliases. Exit 1 gives none. Any other exit status (a malformed configuration file, a folder that cannot be entered) gives none and the command is allowed, since git refuses the command itself for the same reason.
    - Two new blocks. All lookups of one run of the guard share 5 seconds. A lookup that has not ended when they are used up blocks the command with `git-guard: blocked: <command> (git config did not answer within 5 seconds, so what git <name> runs is not known; it is run by the user by hand)`. A `git` that cannot be started from the guard's `PATH` blocks it with `git-guard: blocked: <command> (git could not be started to read the aliases, so what git <name> runs is not known; it is run by the user by hand)`. Neither applies to a subcommand the guard checks, which is never looked up.
    - An alias named as one of git's own commands (`status = push`) is expanded by the guard, though git ignores it: the guard holds no list of git's commands, and `git status` is then blocked in a repository with that alias. The head comment says so.
    - Listed under "Not seen": an alias written to a configuration file and used in the same command (`git config alias.x push && git x`), since the lookup runs before the command and any program can write the file.
    - Pro: the lookup finds what git would run in each form the probes found, with one process for each distinct set of options. Con: the guard follows `cd`, which needs the lexer to keep how each simple command is joined to the one before it, the largest change of the step; and a machine whose hook has no `git` on its `PATH` has every git command outside the checked operations refused until `PATH` is put right.
  - (b) The ruled sentence as written: `git -C <directory> config --get alias.<name in lower case>`, the directory being the event's `cwd` with each literal `-C`, 5 seconds for each lookup, and a lookup that fails or does not end allows the command. Every form of the list above is named under "Not seen". Pro: the smallest change, and no new block. Con: each probed form runs its alias unchecked, among them `git -C "$PWD" <alias>`, which the plan skills' own commands resemble. This is the lazy option.
  - (c) (a), and the guard also reads an alias written earlier in the same command: `git config [--global | --local | --worktree | --system | --file <file>] [set] alias.<name> <value>` as a simple command before the git command counts as an alias given inline. Pro: the direct form of writing and using an alias in one command is blocked. Con: a file written by `echo`, `sed` or a script is still not seen, so the cause stays, and the guard gains a second reader of `git config`'s own options.
  - Recommendation (a). It is what the ruling asked for, a guard that knows what an aliased command runs, made true for the forms git accepts. (c) adds a reader for one way of writing a file that any program can write. Step 2b does not wait for this ruling and is built first; both steps write `git_guard.py`, so 2a is prepared after 2b lands.

- Step 2b, the forced checkout and switch (2026-09-30, raised at /spec of step 2b): your ruling "Other commands that discard work" blocks `git switch --discard-changes` and leaves `git checkout -f <branch>` allowed "after a grep of the skills for it". Probes on git 2.49.0 in a scratch repository, and that grep, show three things. `git switch -f` and `git switch --force` are git's other names for `--discard-changes`: each switched branch and discarded a modified file. `git checkout -f <branch>` and `git checkout --force <branch>` (any prefix from `--f`) do the same, and `git checkout -f` with no branch discards every change in the tree, as `git checkout .` does, which the guard blocks. No skill and no script under `utils/` runs a forced checkout or any `git switch`: `git grep -n -e 'git checkout' -e 'git switch' -- skills utils` prints `land.sh` (two plain checkouts), `spec` (`git checkout --theirs -- <path>`) and `pin.sh` with its test (`checkout -q --detach`, `checkout -q -- <path>`), none with `-f` or `--force`. Options:
  - (a) Step 2b blocks `git switch` with `--discard-changes` (or a prefix from `--di`), `-f` or `--force`, and `git checkout` with `-f` in a short-option word or `--force` (or a prefix from `--f`), with the messages `git switch --discard-changes discards work and is run by the user by hand` and `git checkout --force discards work and is run by the user by hand`. Pro: the same operation is blocked under each of its names, and no command of the skills is refused. Con: it reverses the part of your ruling that leaves `git checkout -f <branch>` allowed; an agent that must leave a modified tree for another branch asks you.
  - (b) Step 2b blocks `git switch` with `--discard-changes`, `-f` or `--force`, and `git checkout -f` stays allowed, as ruled. Pro: the ruling stands as given. Con: `git checkout -f`, with or without a branch, discards the same work unchecked.
  - (c) Step 2b blocks only the spelling `--discard-changes`. Con: `git switch -f` does the same and passes. This is the lazy option.
  - Recommendation (a). Until you rule, step 2b is prepared with (b), the reading of your ruling that blocks the most without reversing it.

## Closed items (the log of what was raised and how it ended; no report carries it)

- Git aliases (2026-09-30): Axel ruled (a), approving the `git config --get alias.<name>` computation; step 2a.

- Other commands that discard work (2026-09-30): Axel agreed with the recommendation; step 2b.

- pyright for Python templates (2026-09-30): Axel ruled (a), the orchestrator installing pyright; step 2c.

- Step 2 reading (2026-09-30): approved by Axel; step 2 ticked.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.G and the rulings in `plan.md`. Ledger: `.scratch/2-g-git-guard/`, with `agents/briefs/` and `agents/reviews/`.
- The reference mattpocock `git-guardrails-claude-code`: github.com/mattpocock/skills at d81f3a1, `skills/misc/git-guardrails-claude-code/`.
- Plan 2.E runs at the same time from `.scratch/2-e-grill/`; a step of this plan whose paths meet a 2.E step in flight waits for it to land.

## Current position (rewritten before every step commit)

- 2026-09-30. Steps 1 and 2 landed and ticked.
- Step 2a is stopped at /spec on the open item "Step 2a, what the alias lookup reads".
- Next: step 2b, then step 2a once ruled, then 2c alone, then step 3, the closing.
