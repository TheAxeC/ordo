# Landing report: plan 2.G, step 2

Roadmap entry 2.G, the git guard. Plan step 2 of 3, the git guard offered by `repo-setup`, landed unticked, its reading pending. Next: step 3, the closing, once step 2 is ticked.

## Open items

- Git aliases (2026-09-30, step 1): a git alias defined in a configuration file (`git config alias.p push`, then `git p`) runs a blocked operation under another name, and the guard does not see it; an alias given inline in the command (`git -c alias.p=push p`, `GIT_CONFIG_KEY_0=alias.p`) is resolved by step 1 without running git. Options: (a) the guard resolves an unknown subcommand with `git config --get alias.<name>` in the command's directory and checks the expansion (a `!` alias as a shell command); pros: every alias is covered; cons: the script runs git on each call that uses an unknown subcommand, a computation beyond the approved one that needs your approval. (b) Configuration-file aliases stay outside the guard, and the docstring and the offer say so; pros: nothing runs; cons: such an alias gets through. Recommendation (a). The lazy option is (b). Step 1 is built without it; a yes adds it as a step by your ruling.
- Other commands that discard work (2026-09-30, step 1): `git checkout -f <branch>`, `git switch --discard-changes`, `git stash drop` and `git stash clear` discard work, and `git send-pack` and `git subtree push` push, by commands the approved list of five does not name, so the guard lets them through (the brief check's "Declined to judge"). Options: (a) a step adds them to the guard's blocks; pros: the guard covers what the five cover in effect; cons: widens the approved list, and `git checkout -f <branch>` is a form the plan skills may need. (b) The docstring and the offer name them as not blocked. Recommendation (a) for `send-pack`, `subtree push`, `stash drop`, `stash clear` and `switch --discard-changes`, with `checkout -f` left allowed after a grep of the skills. The lazy option is (b). Step 1 is built with the five only; a yes adds a step by your ruling.
- pyright for Python templates (2026-09-30, step 1): `skills/repo-setup/templates/docs/dev/coding-standards/python.md` says pyright type-checks every module, and `git_guard.py` is Ordo's first Python template script under it, but pyright is not installed here (`which pyright` prints `pyright not found`), so neither the builder nor the reviewers ran it. Options: (a) you install pyright (`npm install -g pyright`, a download from outside Ordo), and a later step adds `pyright skills/repo-setup/templates/hooks/git_guard.py` to the verify list and fixes what it finds; pros: the standard the template sets for Python holds for Ordo's own Python; cons: a new tool on the machine and a new verify command. (b) The verify list stays without pyright; pros: nothing to install; cons: Ordo's Python is held to less than the standard it hands to other repositories. Recommendation (a). The lazy option is (b).
- Step 2 reading (2026-09-30): step 2, the git guard offered by `repo-setup`, landed unticked, since its check is your reading of the offer's text: question 10 and Steps 3, 5, 10 and 11 of `skills/repo-setup/SKILL.md`, its tree row and Rules, and `README.md` lines 13 and 111 (ruling "Overnight work applies to this plan"). One point for the reading, not verified: the hook runs the `python3` on Claude Code's PATH, and Steps 10 checks the one on the setup session's; an older one there makes the guard let every call through. Options: (a) you read it and tick step 2, or name what is wrong; (b) tick it unread. Recommendation (a). The lazy option is (b). Ordo's own settings text is in `agents/reviews/2-landing.md`, for you to add to `.claude/settings.json` or `.claude/settings.local.json` if you want the guard in Ordo.

## The landing

- Agents stopped before the landing: `ListAgents` showed the step's builder and both reviewers no longer running.
- NOT DONE: Axel's reading of the offer's text, the step's check.

- Landed: `skills/repo-setup/templates/hooks/git_guard.settings.json` (15 lines, matcher `*`, a command that runs `$CLAUDE_PROJECT_DIR/.claude/hooks/git_guard.py` with `python3` and refuses every call with a `git-guard: ... is missing` line when the file is gone); `skills/repo-setup/SKILL.md` (178 to 187 lines): question 10 "Install the git guard? [no]", the copy at Steps 5, the Python 3.9 check at Steps 10, the print at Steps 11 with its completion criterion, the tree row, the Stops rows "The questions" (ten) and "The draft", the Rules bullets on settings files and on the drafted files, the description (861 characters), version 1.2.1 kept; `README.md` lines 13, 62 and 111; "the ten questions" in `plan-terms.md` and `docs/glossary.md`.
- Not ticked: the step's check is Axel's reading of the offer's text (ruling "Overnight work applies to this plan"); it is the open item "Step 2 reading". The scratch run of the check holds: the copy is the one file added under `.claude/`, beside a `settings.local.json` written first, no settings file written, `cmp` 0 and `git check-ignore` 0, and the printed command gives exit 2 on a push, 0 on `git status` and on a `Read` input, and 2 with the missing line when the hook is moved away, on a path holding a space (the builder's run and both reviewers' reruns).
- Premise corrections (at /spec): the brief check's findings closed in the brief (`2-brief-check.md`, Closed).
- Ruling decided by the orchestrator overnight: "Step 2, the hook's settings text".
- Review: `2-refuter.md`, 6 findings; repair round 1 (`agents/briefs/2-round-1.md`) with a ruling per finding, points 1 to 6. The run over the round: 1 finding, fixed at landing.
- Fixes at landing: the description and README line 111 say the draft shows every file's text with the git guard hook named by its source (the round's finding). 1 fix.
- Verification on main: `sh ~/.claude/skills/land/templates/land.sh .scratch/2-g-git-guard/orchestrator-state.md 2g-2 e29e95e8f8c8a3eb0ff120072b368174233e002c` exited 0 with `checks: 10 commands passed` and `5 files changed, 37 insertions(+), 13 deletions(-)`, `README.md`, `plan-terms.md` and `docs/glossary.md` merged with 2.F step 2's lines; after the fix at landing `checks.sh` printed `checks: 10 commands passed`.
- Ordo's own settings text (D3), with the command pointing at the tracked script, is in `2-landing.md`; run with `CLAUDE_PROJECT_DIR=/Users/axelfaes/workspace/ordo` from `docs/`, it exits 2 with `git-guard: blocked: git push origin main (git push is run by the user by hand)` on a push, 0 on `git status --short`, and 2 with the missing line when the root is wrong.
- A/B: none. Look: none, no view changes.
- Usage (models from the transcripts): brief check claude-opus-5-5 156313 tokens, 51 tool uses, 489 s, $1.70 to $4.59; builder claude-sonnet-5-5 94135 tokens, 21 tool uses, 229 s (round 0) and 110514 tokens, 5 tool uses, 104 s (round 1), $0.80 to $2.41 for both; reviewer claude-opus-5-5 130146 tokens, 26 tool uses, 278 s, $0.94 to $3.05; reviewer over round 1 claude-opus-5-5 128025 tokens, 29 tool uses, 276 s, $0.97 to $3.08.
- The builder's first report did not pass its bar: the review found the README's order and wording of the offer wrong, Steps 11 without its completion criterion, first runs and rule-14 greps missing from the report, and a read-only git command against the brief. Fixes at landing: 1. Sonnet 5.5 measurement (ruling "Overnight work" 1): every finding of the builder's is closed at landing, so `worker:` stays Sonnet.

## Ordo's own settings text

For `.claude/settings.json` or `.claude/settings.local.json` in Ordo, if you want the guard here. It runs the tracked script, so nothing is copied:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "f=\"$CLAUDE_PROJECT_DIR/skills/repo-setup/templates/hooks/git_guard.py\"; if [ -f \"$f\" ]; then exec python3 \"$f\"; fi; echo \"git-guard: $f is missing, so every tool call is refused; restore it or remove the hook from the settings\" >&2; exit 2"
          }
        ]
      }
    ]
  }
}
```
