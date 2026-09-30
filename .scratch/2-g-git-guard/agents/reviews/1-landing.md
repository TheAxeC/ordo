# Landing report: 2.G step 1

Roadmap entry 2.G, git guard. Plan step 1 of 3, the git guard. Next: step 2, the offer in `repo-setup`, blocked until 2.E's step 7 lands.

## Open items (verbatim from the state file)

- Git aliases (2026-09-30, step 1): a git alias defined in a configuration file (`git config alias.p push`, then `git p`) runs a blocked operation under another name, and the guard does not see it; an alias given inline in the command (`git -c alias.p=push p`, `GIT_CONFIG_KEY_0=alias.p`) is resolved by step 1 without running git. Options: (a) the guard resolves an unknown subcommand with `git config --get alias.<name>` in the command's directory and checks the expansion (a `!` alias as a shell command); pros: every alias is covered; cons: the script runs git on each call that uses an unknown subcommand, a computation beyond the approved one that needs your approval. (b) Configuration-file aliases stay outside the guard, and the docstring and the offer say so; pros: nothing runs; cons: such an alias gets through. Recommendation (a). The lazy option is (b). Step 1 is built without it; a yes adds it as a step by your ruling.
- Other commands that discard work (2026-09-30, step 1): `git checkout -f <branch>`, `git switch --discard-changes`, `git stash drop` and `git stash clear` discard work, and `git send-pack` and `git subtree push` push, by commands the approved list of five does not name, so the guard lets them through (the brief check's "Declined to judge"). Options: (a) a step adds them to the guard's blocks; pros: the guard covers what the five cover in effect; cons: widens the approved list, and `git checkout -f <branch>` is a form the plan skills may need. (b) The docstring and the offer name them as not blocked. Recommendation (a) for `send-pack`, `subtree push`, `stash drop`, `stash clear` and `switch --discard-changes`, with `checkout -f` left allowed after a grep of the skills. The lazy option is (b). Step 1 is built with the five only; a yes adds a step by your ruling.
- pyright for Python templates (2026-09-30, step 1): `skills/repo-setup/templates/docs/dev/coding-standards/python.md` says pyright type-checks every module, and `git_guard.py` is Ordo's first Python template script under it, but pyright is not installed here (`which pyright` prints `pyright not found`), so neither the builder nor the reviewers ran it. Options: (a) you install pyright (`npm install -g pyright`, a download from outside Ordo), and a later step adds `pyright skills/repo-setup/templates/hooks/git_guard.py` to the verify list and fixes what it finds; pros: the standard the template sets for Python holds for Ordo's own Python; cons: a new tool on the machine and a new verify command. (b) The verify list stays without pyright; pros: nothing to install; cons: Ordo's Python is held to less than the standard it hands to other repositories. Recommendation (a). The lazy option is (b).

## The check of Steps 1

`ListAgents` listed no agent of this session, only the peer session research-hub-f2: the builder (a9bba431490a852e7) and both reviewers had finished, and the first reviewer was stopped.

## NOT DONE

Nothing of step 1. The step is ticked.

## What landed

`skills/repo-setup/templates/hooks/git_guard.py` and `git_guard.test.sh`, and the test's line in `docs/dev/building.md` and `docs/dev/change-standard.md`, in one commit with this report, the booking in `plan.md`, and the test added to the verify list of the four open plans' state files.

## What was found

The first review's findings were sent in repair round 1. The run over the round found 10, each fixed at landing on main, and three of the points it declined to judge were settled with git and fixed at landing (`clean.requireForce` integers, `:(literal).`, five more wrappers); `1-refuter.md`, "Closed", lists each fix. One open item came from the review: pyright for Python templates.

## Verification on main

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl ... (the ASCII check)
checks: 9 commands passed
```

The step's own check: the test passes under Python 3.13.4 and 3.9.6, and a scratch copy with each of the five rules removed prints `FAIL: block git push`, `FAIL: block git reset --hard`, `FAIL: block git clean -f`, `FAIL: block git checkout .` and `FAIL: block git restore .`.

## Usage, the bar and the fixes at landing

- Usage (models from the transcripts): brief check claude-opus-5-5 139503 tokens, 37 tool uses, 439 s; builder claude-sonnet-5-5 237370 tokens, 45 tool uses, 1580 s (round 0) and 89033 tokens, 71 tool uses, 2660 s (round 1), $8.87 to $23.24 for both; reviewer claude-opus-5-5 173997 tokens, 42 tool uses, 748 s, $2.16 to $5.21, after a first reviewer stopped on a permission prompt ($0.83 to $3.21); reviewer over round 1 claude-opus-5-5 184214 tokens, 40 tool uses, 1123 s, $2.32 to $9.04.
- The builder's first report did not pass its bar: the review found a nesting limit that exited 2 and crashed past it, `sh -c` options, `!` aliases, `clean.requireForce` values and forms the lexer did not read. Fixes at landing: 13. Sonnet 5.5 measurement (ruling "Overnight work" 1): every finding of the builder's is closed at landing, so `worker:` stays Sonnet.
