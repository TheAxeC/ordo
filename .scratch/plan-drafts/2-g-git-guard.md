# Plan draft: 2.G git guard

The step list `/plan 2.G` drafted, stopped at "The drafted step list" for Axel's approval or correction. No ledger folder is opened: on his approval `/plan 2.G` writes `.scratch/2-g-git-guard/plan.md` from this draft, each step line ending with `(approved)`, and the state file.

## Goal

`repo-setup` offers a PreToolUse hook that blocks `git push`, `git reset --hard`, `git clean -f`, `git checkout .` and `git restore .`, and lets `git branch -D` and `git worktree remove` through for `/land`; you install it yourself.

## Gate

The hook script's test runs each blocked command and expects the block, and runs `git branch -D` and `git worktree remove` and expects them allowed; each block removed in a scratch copy turns the test red; `repo-setup`'s text for the offer read by you.

- The gate: could this pass without the goal being reached? Yes, in part. The test covers the commands as the goal spells them, but not the other forms the same operation takes (`git -C <dir> push`, `cd x && git push`, `git clean -fdx`, `git checkout -- .`), and not the git commands the plan skills themselves run (`git restore --staged --worktree -- <paths>` in `/land`, `git restore -- <path>` and `git checkout --theirs -- <path>` in `/spec`, `git checkout <branch>` in `land.sh`), which a guard that blocks them would break. Step 1's check adds both sets of cases, so the plan reaches the goal, but the roadmap's gate stays as written unless Axel changes it.
- Step 1: could this pass without the goal being reached? No, each case fails on the unchanged tree (no script), each blocked form is refused and each allowed form passes, and each block removed in a scratch copy turns the test red.
- Step 2: could this pass without the goal being reached? No, Axel reads the offer's text, and the scratch run shows the script copied and the settings text printed, with no settings file written.

## Steps, in execution order

- 1 The hook script `skills/repo-setup/templates/hooks/git-guard.sh` and its test `git-guard.test.sh`. What the script computes, for Axel's approval of a new script: it reads the PreToolUse JSON on stdin, takes the Bash tool's command, splits it into its simple commands (on `&&`, `||`, `;`, `|` and newlines), and for each `git` command (after any `-C <dir>`, `-c <key=value>` and environment assignments) exits 2 with one line on stderr naming the command and the rule when it is `push` in any form, `reset` with `--hard`, `clean` with `-f` or `--force` in any combined flag, `checkout` or `restore` whose only pathspec is `.` (with or without `--`); it exits 0 otherwise, `git branch -D`, `git worktree remove`, `git restore -- <paths>`, `git restore --staged --worktree -- <paths>`, `git checkout --theirs -- <path>` and `git checkout <branch>` included. The test runs each form as a JSON input; the test is added to `docs/dev/building.md`'s verify list; check: the test passes, each case fails on the unchanged tree, and each block removed in a scratch copy turns it red (1 commit)
- 2 `repo-setup` offers the hook: a question "Install the git guard? [no]"; on yes, the setup copies the script to `.claude/hooks/git-guard.sh` in the repository and prints the `hooks` text for `.claude/settings.json` for the user to add, and never writes a settings file; the README's `repo-setup` row names the offer; check: the offer's text read by Axel, and a scratch run of the copy shows the script in place and the printed text, with no settings file written (1 commit)
- 3 the closing: the roadmap entry ticked with the gate's output (`/roadmap done 2.G`), this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

- 1 with anything; 2 after 1, and after 2.E's step 7, which rewrites `repo-setup`'s question 6 and its tree.

## Blocked, and by what

- 2: 2.E's step 7 changes `skills/repo-setup/SKILL.md`'s questions and tree; step 2 is prepared on main after it lands.

## Questions for Axel with the draft

- D1. Where the offer puts the script. Options: (a) copied into the repository at `.claude/hooks/git-guard.sh`, the settings text printed for the user to add to `.claude/settings.json`; (b) left in the pinned Ordo worktree and referenced by its path, so a pin updates it; (c) copied to `~/.claude/hooks/` for every project. Recommendation: (a): the repository carries what guards it, a pin never changes a hook under a running session, and you add the settings line yourself, as the goal says. (b) ties every repository to one machine's Ordo path; (c) is a global change the setup of one repository should not make. The lazy option is (b), which skips the copy.
- D2. Which forms of the five operations the guard blocks. Options: (a) every form of each operation, as step 1 lists; (b) the five commands as the goal spells them, matched as text, as mattpocock's `git-guardrails-claude-code` does. Recommendation: (a). (b) misses `git -C <dir> push` and `git clean -fdx`, and its text match on `git branch -D` would block `/land`. (b) is the lazy option.
- D3. Ordo's own repository. The goal says you install the hook yourself; the plan installs it nowhere. Options: (a) as drafted, nothing installed; (b) step 2 also prints the text for Ordo's own `.claude/settings.json` in its landing report for you to add. Recommendation: (b), since Ordo's sessions run the git commands the guard is for, and printing the text installs nothing.
