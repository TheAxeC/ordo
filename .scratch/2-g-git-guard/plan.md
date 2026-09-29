# Plan: 2.G git guard

Execution ledger for entry 2.G of `docs/roadmap.md`. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

`repo-setup` offers a PreToolUse hook that blocks `git push`, `git reset --hard`, `git clean -f`, `git checkout .` and `git restore .`, and lets `git branch -D` and `git worktree remove` through for `/land`; you install it yourself.

## Gate

The hook script's test runs each blocked command and expects the block, and runs `git branch -D` and `git worktree remove` and expects them allowed; each block removed in a scratch copy turns the test red; `repo-setup`'s text for the offer read by you.

- The gate: could this pass without the goal being reached? Yes, in part. The test covers the commands as the goal spells them, but not the other forms the same operation takes (`git -C <dir> push`, `cd x && git push`, `git clean -fdx`, `git checkout -- .`), and not the git commands the plan skills themselves run (`git restore --staged --worktree -- <paths>` in `/land`, `git restore -- <path>` and `git checkout --theirs -- <path>` in `/spec`, `git checkout <branch>` in `land.sh`), which a guard that blocks them would break. Step 1's check adds both sets of cases, so the plan reaches the goal, but the roadmap's gate stays as written unless Axel changes it.
- Step 1: could this pass without the goal being reached? No, each case fails on the unchanged tree (no script), each blocked form is refused and each allowed form passes, and each block removed in a scratch copy turns the test red.
- Step 2: could this pass without the goal being reached? No, Axel reads the offer's text, and the scratch run shows the script copied and the settings text printed, with no settings file written.

## Steps, in execution order

- 1 The hook script `skills/repo-setup/templates/hooks/git-guard.sh` and its test `git-guard.test.sh`. What the script computes, for Axel's approval of a new script: it reads the PreToolUse JSON on stdin, takes the Bash tool's command, splits it into its simple commands (on `&&`, `||`, `;`, `|` and newlines), and for each `git` command (after any `-C <dir>`, `-c <key=value>` and environment assignments) exits 2 with one line on stderr naming the command and the rule when it is `push` in any form, `reset` with `--hard`, `clean` with `-f` or `--force` in any combined flag, `checkout` or `restore` whose only pathspec is `.` (with or without `--`); it exits 0 otherwise, `git branch -D`, `git worktree remove`, `git restore -- <paths>`, `git restore --staged --worktree -- <paths>`, `git checkout --theirs -- <path>` and `git checkout <branch>` included. The test runs each form as a JSON input; the test is added to `docs/dev/building.md`'s verify list; check: the test passes, each case fails on the unchanged tree, and each block removed in a scratch copy turns it red (1 commit) (approved)
- 2 `repo-setup` offers the hook: a question "Install the git guard? [no]"; on yes, the setup copies the script to `.claude/hooks/git-guard.sh` in the repository and prints the `hooks` text for `.claude/settings.json` for the user to add, and never writes a settings file; the README's `repo-setup` row names the offer; the landing report prints the text for Ordo's own `.claude/settings.json` for Axel to add (ruling "Step list" D3); check: the offer's text read by Axel, and a scratch run of the copy shows the script in place and the printed text, with no settings file written (1 commit) (approved)
- 3 the closing: the roadmap entry ticked with the gate's output (`/roadmap done 2.G`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

- 1 with anything; 2 after 1, and after 2.E's step 7, which rewrites `repo-setup`'s question 6 and its tree.

## Rulings (2026-09-30)

- Step list (2026-09-30): Axel approved the drafted step list, "All 3 plans are approved", with each question's recommendation: D1 (a), the script copied into the repository at `.claude/hooks/git-guard.sh` and the settings text printed for the user, the lazy option (b) referencing the pinned Ordo path; D2 (a), every form of the five operations, the lazy option (b) a text match; D3 (b), step 2's landing report prints the settings text for Ordo's own `.claude/settings.json`, which Axel adds himself. The approval of the list is the approval of what step 1's script computes, as step 1 states it. The gate stays as the roadmap writes it, step 1's check adding the other forms and the plan skills' own commands (the user).

## Blocked, and by what

- 2: 2.E's step 7 changes `skills/repo-setup/SKILL.md`'s questions and tree; step 2 is prepared on main after it lands.
