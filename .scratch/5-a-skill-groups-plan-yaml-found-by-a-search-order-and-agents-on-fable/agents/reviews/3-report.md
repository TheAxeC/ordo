# Report: step 3, `plan.yaml` found by a search order, its paths read from its own folder

Everything in the brief is done. One line of case C16 still tells a reader that Ordo's configuration is at `.agents/plan.yaml`: ADR 0007, line 11, which the brief says to leave alone because step 1 of the plan removes it. Case C14's command, as the brief writes it, prints `.agents/plan.yaml` in the worktree, because the move is not staged there; the runs under "Cases C14 to C17" show the file gone from the worktree and `docs/plan.yaml` present.

Open items of the state file, verbatim:

- none

All commands ran from the worktree's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. Nothing is staged in the worktree, so `git grep` ran with `--untracked` and `git ls-files` with `--cached --others --exclude-standard` where the report says so.

## The cases' first run, on the unchanged tree

Each case was run by hand on a scratch repository under `$TMPDIR`, with the scripts as they stood at the base (0c93942). `<scratch>` is the scratch folder and `<worktree>` the worktree. No case showed a rule of the brief giving a wrong result, so nothing was handed back.

```
C1 find: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C1 check: exit 1
    error: no .agents/plan.yaml in <scratch>/c1/apps/web/plan.yaml
C2: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C3: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C4: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C5 docs+agents: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C5 scratch+docs: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C5 named: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C6 pages under apps/web: exit 1
    error: no .agents/plan.yaml in <scratch>/c6/apps/web/plan.yaml
C6 page only at root: exit 1
    error: no .agents/plan.yaml in <scratch>/c6/apps/web/plan.yaml
C7 none: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C7 named folder without a file: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C8: exit 1
    error: no .agents/plan.yaml in <scratch>/c8/docs/plan.yaml
C9 ignored: exit 1
    error: no .agents/plan.yaml in <scratch>/c9/docs/plan.yaml
C9 not ignored: exit 1
    error: no .agents/plan.yaml in <scratch>/c9/docs/plan.yaml
C10 no argument, in a repository whose configuration is sound for the script run: exit 0
    note: adr folder docs/adr does not exist yet; repo-setup or grill creates it
    ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
C10 repository root in place of a file: exit 0
    note: adr folder docs/adr does not exist yet; repo-setup or grill creates it
    ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
C10 plan.yaml in no git repository: exit 1
    error: no .agents/plan.yaml in <scratch>/norepo/plan.yaml
C10a: exit 1
    error: no .agents/plan.yaml in <scratch>/c10a/docs/plan.yaml
C10b: exit 1
    error: no .agents/plan.yaml in <scratch>/c10b/.scratch/plan.yaml
C10c trailing slash: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C10c outside: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C10d find through link: exit 1
    error: no .agents/plan.yaml in <worktree>/--find
C10d check through link: exit 1
    error: no .agents/plan.yaml in <scratch>/c10d-link/docs/plan.yaml
C10d check through real path: exit 1
    error: no .agents/plan.yaml in <scratch>/c10d/docs/plan.yaml
C11: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
C11 staged on main: exit 0
    
C12 three arguments: exit 64
    configuration failed: .agents/plan.yaml not found
C12 staged on main: exit 0
    
C13: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
C13a [ledger_root: ../..|worktree_root: ../.agents/wt]: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
C13a [ledger_root: ..|worktree_root: ../.agents/wt]: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
C13a [ledger_root: ../ledger|worktree_root: ../..]: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
C13a [ledger_root: ../ledger|worktree_root: ..]: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
```

What the first run shows, per case:

- C1 to C5, C7, C10c, C10d (search): `--find` was read as a repository root, and every run failed with `error: no .agents/plan.yaml in <worktree>/--find`.
- C1, C6, C8, C9, C10a, C10b, C10d (check of a path): the path of the file was read as a repository root, and every run failed with `error: no .agents/plan.yaml in <the path>`.
- C10: no argument and a repository root both passed with exit 0 on the configuration at `.agents/plan.yaml`; a file in no git repository failed for the reason above.
- C11, C13, C13a: four arguments were refused with the usage line of three arguments, exit 64.
- C12: three arguments in a repository with `docs/plan.yaml` only exited 64 with `configuration failed: .agents/plan.yaml not found`. The test's case therefore puts a sound `.agents/plan.yaml` in the repository, where the unchanged script lands the step.
- C14: `git ls-files docs/plan.yaml .agents/plan.yaml` printed `.agents/plan.yaml`.
- C15: `python3 skills/ordo-init/templates/check_config.py docs/plan.yaml` printed `error: no .agents/plan.yaml in <worktree>/docs/plan.yaml`, exit 1.
- C16: 161 lines in 39 files.

The two test files, rewritten before the scripts were changed, run on the unchanged scripts:

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
FAIL: complete: expected a pass, got: error: no .agents/plan.yaml in <TMPDIR>/check-config-test.bhGOWm/complete/docs/plan.yaml
$ sh skills/land/templates/land.test.sh 2>&1 | tail -2
Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>
FAIL: conflict exited 64, expected 2
```

Each test stops at its first failing case, so the failing line of each later case is the one the hand run above gives for it.

## DONE / NOT DONE

| Item | State | What changed and where | Proof |
|---|---|---|---|
| 1. The search order | DONE | Stated in full in `skills/plan/SKILL.md`, "What it reads" 1. Each other skill that reads the configuration says it is "found and its paths read as `/plan`'s "What it reads" 1 says": `spec`, `refute`, `land`, `grill`, `roadmap`, `plan-retro`, `session-retro` ("What it reads" 1), `ordo-help` ("What it reads" 4), `diagnose` ("What it reads" 3), `plan-orchestration` ("What it reads" 1); `code-comments` ("What it reads" 1) and `ordo-init` ("What it reads" 2) point at it for a call that names no folder. The refusals for a missing configuration name the places looked in: the Stops rows "No configuration" of `plan`, `grill`, `roadmap`, `session-retro` and `plan-orchestration`. | C17, by reading; `git grep -n --untracked 'found and its paths' -- skills | wc -l` prints 10 |
| 2. The folder in a call | DONE | A Quick start line, the "What it reads" item and a Stops row in `plan`, `spec`, `refute`, `land`, `grill`, `diagnose`, `ordo-help`, `roadmap`, `plan-orchestration`, `plan-retro` and `session-retro`; `plan-orchestration`'s `references/self-rule.md`, "Next-entry mode"; the README's setup text. | Reading; decision 1's five calls under C17 |
| 3. Paths in a `plan.yaml` | DONE | `skills/plan/SKILL.md`, "What it reads" 1 (the rule, the keys, the links, `..`, the repository root refused, the text keys, the defaults read from the repository root, the meaning of `<ledger_root>`, `<archive_root>` and `<worktree_root>` in every skill's text) and Steps 4 (the configuration block holds each path as it reads from the repository root); `templates/orchestrator-state.md`; `check_config.py`; `land.sh`. | check_config cases C6, C8, C10a, C10b, C10d; land cases C11, C13a |
| 4. `worktree_root` optional | DONE | `templates/plan.yaml` marks it `optional, default .agents/worktrees.`, which is where `check_config.py` reads the required keys from; its note reads `worktree_root not set, default '.agents/worktrees' at the repository root applies`; `land.sh`; `skills/land/SKILL.md`; `skills/ordo-init/SKILL.md` Steps 5 and 9; `skills/session-retro/SKILL.md` "What it reads" 1; README ("Eight are required"). | C9, C11 |
| 5. `check_config.py` | DONE | `skills/ordo-init/templates/check_config.py`: the two forms, the head comment, every check kept with its path resolved from the file's folder, every line naming the file. | `PASS: check_config.py scratch tests`; C1 to C10d below |
| 6. `land.sh` | DONE | `skills/land/templates/land.sh`: the fourth argument, the head comment; `skills/land/SKILL.md`, "The landing script" and Steps 3; `templates/orchestrator-state.md`; README, "The landing script". | `PASS: land.sh scratch tests`; C11 to C13a below |
| 7. Ordo's configuration | DONE | `.agents/plan.yaml` moved to `docs/plan.yaml` with `mv`, the seven lines of the brief rewritten and the head comment; no other value changed and no key added (`diff <(git show HEAD:.agents/plan.yaml) docs/plan.yaml` prints lines 2 to 8 and 15 only). `.gitignore` loses `!.agents/plan.yaml`, and its comment loses "The plan configuration stays tracked." | C14, C15 |
| 8. A new configuration | DONE | `skills/ordo-init/SKILL.md` (the description, the introduction, Quick start, "What it reads" 2, Steps 5, 8, 9, 10, 11 and 13, "Checking an existing file" 1 and 2, Rules); `skills/repo-setup/SKILL.md` (description, Steps 8 and 10, "The tree"); the two example files; `skills/repo-setup/templates/gitignore/common.gitignore`; README (the setup text and the paragraph for the owner of an existing `.agents/plan.yaml`). | The example files pass at `docs/plan.yaml` in the test's cases `complete` and `projects` |
| 9. Every place that names `.agents/plan.yaml` | DONE | Each of the 161 lines read and settled; 19 lines remain, each quoted under C16 with its clause. The glossary entries were changed in `skills/repo-setup/templates/plan-terms.md` and synced into `docs/glossary.md` with `sync_rules.py . --only glossary --write`. | C16 |
| 10. Versions | DONE | `land` 5.0.0 to 5.1.0, `ordo-init` 2.0.1 to 2.1.0, `repo-setup` 5.3.2 to 5.4.0, `roadmap` 2.0.0 to 2.1.0, `plan-retro` 1.2.2 to 1.3.0, `session-retro` 2.1.0 to 2.2.0. The eight skills step 1 raises keep their version line. | `git diff -U0 -- 'skills/*/SKILL.md' | grep 'version:'` prints those six pairs and no other |

## The cases' run after

The same hand run on the changed scripts. The fixture holds the required keys only, so each check prints a note per optional key; 160 such note lines are left out below, and the notes for `worktree_root` and `adr` are kept.

```
C1 find: exit 0
    apps/web/plan.yaml
C1 check: exit 0
    note: apps/web/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: apps/web/plan.yaml carries every required key, no unknown key, and every page it names exists
C2: exit 0
    .scratch/plan.yaml
C3: exit 0
    docs/plan.yaml
C4: exit 0
    .agents/plan.yaml
C5 docs+agents: exit 0
    docs/plan.yaml
C5 scratch+docs: exit 0
    .scratch/plan.yaml
C5 named: exit 0
    apps/web/plan.yaml
C6 pages under apps/web: exit 0
    note: apps/web/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: apps/web/plan.yaml carries every required key, no unknown key, and every page it names exists
C6 page only at root: exit 1
    error: apps/web/plan.yaml: verification names a file that does not exist: apps/web/dev/building.md
    note: apps/web/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
C7 none: exit 1
    error: no plan.yaml in .scratch, docs, .agents of <scratch>/c7
C7 named folder without a file: exit 0
    docs/plan.yaml
C8: exit 1
    error: docs/plan.yaml: ledger_root is not a path under the repository root: '../../elsewhere'
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
C9 ignored: exit 0
    note: docs/plan.yaml: worktree_root not set, default '.agents/worktrees' at the repository root applies
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
C9 not ignored: exit 1
    error: docs/plan.yaml: worktree_root is not ignored by git: .agents/worktrees
    note: docs/plan.yaml: worktree_root not set, default '.agents/worktrees' at the repository root applies
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
C10 no argument, in a repository whose configuration is sound for the script run: exit 1
    error: give the path of one plan.yaml: check_config.py <path of plan.yaml>, or check_config.py --find <repository root> [<folder>]
C10 repository root in place of a file: exit 1
    error: not a file: <scratch>/c10
C10 plan.yaml in no git repository: exit 1
    error: in no git repository: <scratch>/norepo/plan.yaml
C10a: exit 0
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
C10b: exit 0
    note: .scratch/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: .scratch/plan.yaml carries every required key, no unknown key, and every page it names exists
C10c trailing slash: exit 0
    apps/web/plan.yaml
C10c outside: exit 1
    error: the folder ../outside is outside the repository <scratch>/c10c
C10d find through link: exit 0
    docs/plan.yaml
C10d check through link: exit 0
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
C10d check through real path: exit 0
    note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
    ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
C11: exit 0
    worktree git commit: nothing staged, no wip commit made
    Switched to a new branch 'c11-land'
    [c11-land 8f11a6c] change
     Date: Sun Nov 22 14:03:15 2026 +0100
     1 file changed, 1 insertion(+)
     create mode 100644 apps/web/change.txt
    $ true
    checks: 1 commands passed
    === booking ===
    Diff stat against 02a581190c1e41de8c982126638cdd4437b1481d:
     apps/web/change.txt | 1 +
     1 file changed, 1 insertion(+)
    Staged paths:
    apps/web/change.txt
    === end booking ===
C11 staged on main: exit 0
    apps/web/change.txt
C12 three arguments: exit 64
    Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base> <plan.yaml>
C12 staged on main: exit 0
    
C13: exit 0
    worktree git commit: nothing staged, no wip commit made
    Switched to a new branch 'c13-land'
    [c13-land f69e5a9] change
     Date: Sun Nov 22 14:03:18 2026 +0100
     1 file changed, 1 insertion(+)
     create mode 100644 apps/web/change.txt
    $ true
    checks: 1 commands passed
    === booking ===
    Diff stat against 8844529fd9f414ebd6b00d3390a0ff6e2342cdaf:
     apps/web/change.txt | 1 +
     1 file changed, 1 insertion(+)
    Staged paths:
    apps/web/change.txt
    === end booking ===
C13a [ledger_root: ../..|worktree_root: ../.agents/wt]: exit 64
    configuration failed: ledger_root in docs/plan.yaml must be a folder inside the repository and not its root: ../..
C13a [ledger_root: ..|worktree_root: ../.agents/wt]: exit 64
    configuration failed: ledger_root in docs/plan.yaml must be a folder inside the repository and not its root: ..
C13a [ledger_root: ../ledger|worktree_root: ../..]: exit 64
    configuration failed: worktree_root in docs/plan.yaml must be a folder inside the repository and not its root: ../..
C13a [ledger_root: ../ledger|worktree_root: ..]: exit 64
    configuration failed: worktree_root in docs/plan.yaml must be a folder inside the repository and not its root: ..
```

The behaviours whose failure costs something, each with its test case and the line it failed with on the unchanged tree:

| Behaviour | Case in the test | Failing line on the unchanged tree |
|---|---|---|
| The file checked is the one at the path given | `check_config.test.sh`, `complete` and every case after it | `FAIL: complete: expected a pass, got: error: no .agents/plan.yaml in <TMPDIR>/check-config-test.bhGOWm/complete/docs/plan.yaml` |
| The search order (C1 to C5, C7, C10c) | `find-named`, `find-scratch`, `find-docs`, `find-agents`, `find-order`, `find-none` | `error: no .agents/plan.yaml in <worktree>/--find` |
| Paths read from the file's folder (C6) | `nested` | `error: no .agents/plan.yaml in <scratch>/c6/apps/web/plan.yaml` |
| A path outside the repository refused; a ledger root that is the repository root refused; `ledger_root: .` passes (C8, C10b) | `outside`, `ledger-is-root`, `ledger-dot` | `error: no .agents/plan.yaml in <scratch>/c8/docs/plan.yaml` |
| The default worktree root (C9) | `no-worktree-root` | `error: no .agents/plan.yaml in <scratch>/c9/docs/plan.yaml` |
| The default `adr` read from the repository root (C10a) | `no-adr` | `error: no .agents/plan.yaml in <scratch>/c10a/docs/plan.yaml` |
| The argument errors (C10) | "no argument", "a repository root", "a file in no git repository" | `C10 no argument ...: exit 0` with `ok: .agents/plan.yaml carries every required key ...` |
| A repository reached through a link (C10d) | `linked` | `error: no .agents/plan.yaml in <scratch>/c10d-link/docs/plan.yaml` |
| `land.sh` reads the file given, from its folder, with the default worktree root (C11) | `land.test.sh`, `nested` | `Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`, exit 64 |
| Three arguments refused (C12) | `three` | The unchanged script takes three arguments and reads `.agents/plan.yaml`; the test's first failing line is `FAIL: conflict exited 64, expected 2` |
| A second file not read (C13) | `second` | The usage line above, exit 64 |
| A root outside the repository, or the repository root, refused (C13a) | `outside-1` to `outside-4` | The usage line above, exit 64 |

What the green tests do not cover: no skill was run, so the skills' text on the search and on the folder in a call is checked by reading only. The plan's whole verify list was not run in the worktree.

## Verification, as printed

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ LC_ALL=C grep -n '[^ -~]' skills/ordo-init/templates/check_config.py
(no output) exit 1
```

Check 5, the character-set check of `docs/dev/change-standard.md` over the 40 files the step changes (every path `git status --short` lists, the deleted `.agents/plan.yaml` left out), printed nothing and exited 0.

## Cases C14 to C17

C14:

```
$ git ls-files docs/plan.yaml .agents/plan.yaml
.agents/plan.yaml
$ git ls-files --cached --others --exclude-standard docs/plan.yaml .agents/plan.yaml
docs/plan.yaml
.agents/plan.yaml
$ git ls-files --deleted .agents/plan.yaml
.agents/plan.yaml
$ test -e .agents/plan.yaml; echo $?
1
```

The first command is the brief's. It prints `.agents/plan.yaml` because the worktree's index still holds that file and does not hold `docs/plan.yaml`. The other three show the worktree's files as they stand: `docs/plan.yaml` exists, and `.agents/plan.yaml` is deleted.

C15, `python3 skills/ordo-init/templates/check_config.py docs/plan.yaml`: no `error:` line, no note that names `docs/docs/`, exit 0.

```
note: docs/plan.yaml: worktree_paths not set, default [] applies
note: docs/plan.yaml: review not set, default 'every' applies
note: docs/plan.yaml: refute_after_repair not set, default True applies
note: docs/plan.yaml: repair_rounds not set, default 1 applies
note: docs/plan.yaml: review_minutes not set, default 0 applies
note: docs/plan.yaml: look not set, default '' applies
note: docs/plan.yaml: bench not set, default [] applies
note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
note: docs/plan.yaml: design_bar not set, default 'industry' applies
note: docs/plan.yaml: design_references not set, default [] applies
ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
exit 0
```

C16, `git grep -n --untracked -F '.agents/plan.yaml' -- ':!.scratch'`, 19 lines, each with its clause:

- states the place as the fourth of the search, for the owner of an existing file:

  ```
  README.md:194:A repository whose `.agents/plan.yaml` holds paths written from the repository root still has its file found, in the fourth place of the search, and its paths are now read from `.agents/`. Its owner puts `../` in front of each path, or moves the file to `docs/plan.yaml` and rewrites each path relative to `docs/`. `check_config.py` names each page it does not find by the path it resolved, which shows the cause.
  ```
- left as the brief says: step 1 of the plan removes this sentence:

  ```
  docs/adr/0007-the-run-over-a-repair-round-runs-on-its-own-reviewer-model.md:11:The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`. Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`. The served-model check applies to it as to every agent.
  ```
- the goal of entry 5.A, which states the move from the place:

  ```
  docs/roadmap.md:26:- Goal: The skill folders grouped under `skills/`: `skills/orchestration/` holds `roadmap`, `grill`, `plan`, `spec`, `refute`, `land`, `plan-orchestration` and `plan-retro`; `skills/ordo/` holds `repo-setup`, `ordo-init`, `ordo-help` and `session-retro`; `skills/code/` holds `code-comments` and `diagnose`; `skills/academic/` holds `paper` and `writing`. `utils/pin.sh`, its test and the README's install routes read the grouped layout, each skill stays installed under its own name, and every path in the tracked files that names a skill folder names its new place. The skills find `plan.yaml` by a search order: the folder named in the call, then `.scratch/`, then `docs/`, then `.agents/`, each of the last three at the repository root, and the first file found is the one used. Every path in a `plan.yaml` is read relative to the folder that holds it; a `plan.yaml` that names no `worktree_root` uses `.agents/worktrees` at the repository root; `land.sh` and `check_config.py` are given the path of the file the skill found and open no other. Ordo's own configuration moves from `.agents/plan.yaml` to `docs/plan.yaml`, each of its paths rewritten relative to `docs/`, and `.gitignore` no longer keeps `.agents/plan.yaml` tracked. The agents a plan starts may run on Claude Fable: the rule in `plan-orchestration` that no agent runs on Fable, and the two comments in the template that say so, are removed. `writing` and `code-comments` start their agents as `paper` starts its roles: on the runner's default agent, the prompt setting no model and no effort, so they follow the session, and `code-comments` reads no `plan.yaml`. When the runner lists no `ordo-<level>` agent for the configured effort, `spec`, `refute`, `plan-orchestration`, `grill` and `diagnose` print a warning that names the missing agent and start the agent the same way, following the session, in place of refusing.
  ```
- the gate of entry 5.A, which quotes this command and C14's:

  ```
  docs/roadmap.md:27:- Gate: `utils/pin.test.sh` passes with a case for a tag in the grouped layout and one for a tag in the layout before it; `utils/pin.sh <tag>` on a tag of this change links each of the 16 skills by its name, and `utils/pin.sh` with no tag then reports every link resolving to a folder that holds `SKILL.md`; `npx skills add <checkout of the tag> --list` lists the 16 skills; the README's copy loop, run from a clone of the tag into a scratch folder, leaves the 16 skill folders, each with its `SKILL.md`; `git ls-files -z -- ':!.scratch' | xargs -0 perl -ne 'print "$ARGV:$.: $_" if m{(?<![\w./~\$-])skills/(?!(orchestration|ordo|code|academic)/)[a-z]}; close ARGV if eof'`, which prints each line outside the ledgers that names a folder under `skills/` outside the four groups, prints nothing; `sh skills/ordo-init/templates/check_config.test.sh` passes with a case for a `plan.yaml` in a named folder, in `.scratch/`, in `docs/` and in `.agents/`, each alone, a case with two of them present in which the earlier in the order is read, and a case in which a nested file's relative `ledger_root` resolves under that file's folder; `sh skills/land/templates/land.test.sh` passes with a case in which the `plan.yaml` sits in a project folder, the landing reads its `ledger_root` from that file and the step's worktree is under the repository root's `.agents/worktrees`; one real run on a scratch repository whose only `plan.yaml` sits in a project folder, in which `/plan` opens a plan whose ledger is under that folder and `/land` lands one step of it, reviewed by you; every line `git grep -n -F '.agents/plan.yaml' -- ':!.scratch'` prints, read by you, states the search order or names the file it found; `git ls-files docs/plan.yaml .agents/plan.yaml` prints only `docs/plan.yaml`, and `check_config.py`, given `docs/plan.yaml`, prints no error and exits 0; the steps of this entry's plan are built and refuted on Fable, and each dispatch entry records `claude-fable-5-2` as the agent's served model; `grep -n -i -E 'opus|ordo-' skills/academic/writing/SKILL.md` prints nothing, `grep -n -F 'plan.yaml' skills/code/code-comments/SKILL.md` prints nothing, and `git grep -n -F 'The configured effort cannot apply'` prints no line that refuses for a missing `ordo-` agent, read by a fresh agent; the verify list of `docs/dev/building.md` passes on main.
  ```
- head comment of the test: names the fourth place as the file the cases build:

  ```
  skills/land/templates/land.test.sh:17:# .agents/plan.yaml present; a second plan.yaml at .agents/plan.yaml is not read when another
  ```
- comment of the three-argument case, which builds the fourth place:

  ```
  skills/land/templates/land.test.sh:222:# Three arguments: exit 64 and nothing changed, in a repository whose .agents/plan.yaml names
  ```
- builds the fourth place in the three-argument case:

  ```
  skills/land/templates/land.test.sh:225:worktree_root: .agents/wt' ledger/plan/orchestrator-state.md .agents/wt .agents/plan.yaml <<'EOF'
  ```
- comment of the case of a second file, which builds the fourth place:

  ```
  skills/land/templates/land.test.sh:239:# A second plan.yaml at .agents/plan.yaml, with another ledger_root and worktree_root, is not
  ```
- builds the fourth place as the second file:

  ```
  skills/land/templates/land.test.sh:248:printf 'ledger_root: other\nworktree_root: .agents/other\n' >"$second_repo/.agents/plan.yaml"
  ```
- commits the second file in the scratch repository:

  ```
  skills/land/templates/land.test.sh:249:(cd "$second_repo" && git add .agents/plan.yaml && git commit -q -m "A second plan.yaml") || fail "could not commit the second plan.yaml"
  ```
- head comment of the test: names the fourth place as a file a case builds:

  ```
  skills/ordo-init/templates/check_config.test.sh:4:# The check is run on the path of the file. The example configuration of each form passes at docs/plan.yaml, as does a file at .agents/plan.yaml under .agents/* with !.agents/plan.yaml after it, and a project that takes another's keys through a merge key (<<: *base) and overrides one of them.
  ```
- comment of the case that builds the fourth place:

  ```
  skills/ordo-init/templates/check_config.test.sh:158:# A file in the fourth place of the search, .agents/plan.yaml, under a rule that ignores the rest of .agents/.
  ```
- builds the fourth place:

  ```
  skills/ordo-init/templates/check_config.test.sh:161:write_config "$test_root/agents-star/.agents/plan.yaml" ../docs/ ../
  ```
- the ignore rule of that case:

  ```
  skills/ordo-init/templates/check_config.test.sh:162:printf '.agents/*\n!.agents/plan.yaml\n' >"$test_root/agents-star/.gitignore"
  ```
- checks the file in the fourth place:

  ```
  skills/ordo-init/templates/check_config.test.sh:163:expect_pass agents-star .agents/plan.yaml
  ```
- builds the fourth place for the search with one file:

  ```
  skills/ordo-init/templates/check_config.test.sh:239:write_config "$test_root/find-agents/.agents/plan.yaml" "" ../
  ```
- the search prints the fourth place:

  ```
  skills/ordo-init/templates/check_config.test.sh:240:expect_found find-agents .agents/plan.yaml
  ```
- builds the fourth place for the search with several files:

  ```
  skills/ordo-init/templates/check_config.test.sh:244:write_config "$test_root/find-order/.agents/plan.yaml" "" ../
  ```
- builds the fourth place in the repository of the no-argument case:

  ```
  skills/ordo-init/templates/check_config.test.sh:317:write_config "$test_root/arguments/.agents/plan.yaml" ../docs/ ../
  ```

C17, by reading:

- `skills/plan/SKILL.md`, "What it reads" 1, opens: "The plan configuration, the only place a project specific lives: the first `plan.yaml` found in the folder named in the call, then in `.scratch/`, `docs/` and `.agents/` at the repository root, in that order."
- `/plan 12`: "A call that names no folder reads the first file found in the three places at the repository root." That is `docs/plan.yaml`, and the `projects:` form refuses it as before.
- `/plan x/12`: "With no such folder, the file is the first found in the three places at the repository root, and the whole part in front of the entry names a project of it: `/plan x/12` reads the project `x` of `docs/plan.yaml`."
- `/plan apps/web/12`: "The folder stands in the call in front of the entry, as a path from the repository root: `/plan apps/web/12` reads `apps/web/plan.yaml`."
- `/plan tools/a/12`: "The folder is the longest leading part of what stands in front of the entry that is a folder holding a `plan.yaml`, and what is left of that part names a project of the file's `projects:` form: `/plan tools/a/12` reads the project `a` of `tools/plan.yaml`."
- `/spec apps/web/12 2`: `skills/spec/SKILL.md`, "What it reads" 1, reads "The plan configuration, found and its paths read as `/plan`'s "What it reads" 1 says, a folder named in front of `<entry>` as a path from the repository root", and its Quick start holds `/spec <folder>/<entry> <step>`.

## Files changed, with lines added and removed

`git diff --numstat`, with the new file added by hand:

```
+0 -18  .agents/plan.yaml
+1 -2  .gitignore
+18 -13  README.md
+1 -1  docs/adr/0001-the-writing-base-reads-the-prose-standard-where-it-is.md
+1 -1  docs/adr/0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md
+1 -1  docs/adr/0017-one-standard-library-script-makes-every-reference-lookup-of-the-paper-skill.md
+3 -3  docs/adr/0030-paper-and-writing-name-the-model-and-effort-of-each-agent-and-read-no-plan-configuration.md
+2 -2  docs/dev/building.md
+1 -1  docs/dev/change-standard.md
+1 -1  docs/dev/scripts.md
+1 -1  docs/dev/skill-layout.md
+10 -10  docs/glossary.md
+2 -2  docs/roadmap.md
+4 -4  skills/code-comments/SKILL.md
+4 -2  skills/diagnose/SKILL.md
+7 -6  skills/grill/SKILL.md
+14 -9  skills/land/SKILL.md
+51 -39  skills/land/templates/land.sh
+139 -30  skills/land/templates/land.test.sh
+8 -6  skills/ordo-help/SKILL.md
+24 -18  skills/ordo-init/SKILL.md
+138 -45  skills/ordo-init/templates/check_config.py
+222 -45  skills/ordo-init/templates/check_config.test.sh
+15 -8  skills/plan-orchestration/SKILL.md
+4 -4  skills/plan-orchestration/references/self-rule.md
+7 -5  skills/plan-retro/SKILL.md
+21 -7  skills/plan/SKILL.md
+4 -4  skills/plan/templates/orchestrator-state.md
+1 -1  skills/plan/templates/plan.md
+18 -18  skills/plan/templates/plan.projects.yaml
+10 -10  skills/plan/templates/plan.yaml
+3 -2  skills/refute/SKILL.md
+9 -8  skills/repo-setup/SKILL.md
+1 -1  skills/repo-setup/templates/docs/dev/ui-standard.md
+1 -2  skills/repo-setup/templates/gitignore/common.gitignore
+10 -10  skills/repo-setup/templates/plan-terms.md
+2 -2  skills/repo-setup/templates/shared-rules.md
+7 -5  skills/roadmap/SKILL.md
+5 -4  skills/session-retro/SKILL.md
+10 -9  skills/spec/SKILL.md
+18 -0  docs/plan.yaml (new, moved from .agents/plan.yaml)
```

`.agents/plan.yaml` is deleted (18 lines), moved to `docs/plan.yaml`. No file outside the brief's list was written.

## User-visible changes, before and after

- `check_config.py`. Before: `check_config.py [repository root]`, lines such as `error: required key missing: reviewer` and `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`. After: `check_config.py <path of plan.yaml>` and `check_config.py --find <repository root> [<folder>]`, lines such as `error: docs/plan.yaml: required key missing: reviewer`, `error: docs/plan.yaml is ignored by git`, `note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies` and `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`. A page not found is named by its path from the repository root. New errors: `<key> is not a path under the repository root: '<value>'` for every path key, `<key> is the repository root: '<value>'` for `ledger_root` and `worktree_root`, `error: give the path of one plan.yaml: ...`, `error: not a file: <path>`, `error: in no git repository: <path>`, and for `--find`, `error: no plan.yaml in <places> of <root>`, `error: the folder <folder> is outside the repository <root>`, `error: the repository root is not a folder: <root>` and `error: --find takes a repository root and at most one folder`.
- `land.sh`. Before: three arguments, `.agents/plan.yaml` read, `worktree_root` required, refusals such as `configuration failed: no worktree_root in .agents/plan.yaml`. After: four arguments, the file given read, `worktree_root` optional, refusals such as `configuration failed: ledger_root in docs/plan.yaml must be a folder inside the repository and not its root: ..`, `configuration failed: the plan.yaml is not a file: <path>` and `configuration failed: no ledger_root in <path>`.
- The example files: values written for `docs/plan.yaml` (`roadmap: roadmap.md`, `ledger_root: ../.scratch`, `adr: adr`), `worktree_root` optional.
- Each skill's call: a folder in front of the entry, or alone for `/ordo-help`, `/plan-orchestration`, `/roadmap` and `/plan-retro`.

## Sentences about a changed file as a whole, reread

- README, "Eight are required": `grep -c '# required\.' skills/plan/templates/plan.yaml` prints 8.
- `skills/plan-orchestration/SKILL.md`, Stops: "seven kinds of stop ... and two refusals, the last two rows": the table holds seven stop rows, then "No configuration" and "The configured effort cannot apply".
- `skills/repo-setup/SKILL.md`, Steps 10: "the first three exit 0, the second prints `docs/plan.yaml`": the block holds five commands, the first three being `sync_rules.py .`, `check_config.py --find .` and `check_config.py docs/plan.yaml`.
- The head comments of `check_config.py`, `land.sh` and the two tests were rewritten against the files as they stand; each error and exit status the scripts gained is listed in them.
- `docs/dev/scripts.md`, the row of `check_config.py`, and `docs/dev/building.md`, the comments of the two test commands, name the new behaviour and cases.

## Judgments taken

1. Item 5 says "Every line it prints names the file by its path from the repository root." It is built as written: every `error:`, `note:` and `ok:` line of a check starts with the file's path. The three argument errors name the path as given, since no repository root is known there.
2. `check_config.py` keeps refusing an absolute `adr`, which it refused before. An absolute value of another path key is accepted when it resolves inside the repository, since item 3 refuses only a path that resolves outside it.
3. `land.sh` keeps refusing a `ledger_root` or `worktree_root` that is empty, starts with `/` or holds a newline, which it refused before; the refusal of `.` and of a `..` part is replaced by the rule of item 3.
4. `/ordo-init` takes no folder argument: it checks the file found in the three places at the repository root. The brief names no new argument for it, and a `plan.yaml` in a project folder is checked with `check_config.py <path>`.
5. `plan-orchestration` gains the Stops row "No configuration", a refusal, since item 2 asks each skill's Stops to state the folder and the skill had no row about the configuration. `diagnose` states it in its row "No ledger folder".
6. `skills/plan/SKILL.md`, "What it reads" 1, says that `<ledger_root>`, `<archive_root>` and `<worktree_root>` in every skill's text stand for the folder as it reads from the repository root. Without that sentence the commands the skills quote, such as `git worktree add ... <worktree_root>/<slug>-<step>`, would read the raw value.
7. `docs/roadmap.md`, the done entries 2.C and 2.I: "`.agents/plan.yaml`" reworded to "the plan configuration" in each, as item 9 asks of every line. The goal and the gate of entry 5.A are left as they are.
8. ADR 0030: the three sentences name `plan.yaml` in place of `.agents/plan.yaml`; the decision, that `paper` and `writing` read no plan configuration, is unchanged. ADR 0017 names `docs/plan.yaml` as the file that sets `libraries: avoid`. ADR 0001 and 0014 name `plan.yaml`.
9. `code-comments` gets a rewording of its four lines and no folder in its call, as the brief's conventions say.
10. `ordo-init` Steps 5 leaves `worktree_root` out of a draft unless the repository keeps its worktrees elsewhere, since the key is optional and Steps 7 leaves each optional key out.
11. `session-retro`, "What it reads" 1: `worktree_root` left out is `.agents/worktrees` at the repository root, in place of a refusal for that key.
12. The notes of `check_config.py` for `adr` and `worktree_root` left out say "at the repository root", since their defaults are the two that are paths.

## Handed back

Nothing.
