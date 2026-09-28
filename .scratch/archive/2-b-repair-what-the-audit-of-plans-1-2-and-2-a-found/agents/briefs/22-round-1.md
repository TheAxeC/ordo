# Step 22, repair round 1: the rulings

The round starts from the worktree as the builder left it. The findings are in `agents/reviews/22-refuter.md`; read it whole, with its Verification 8 and 9, which show the commands run. The brief `agents/briefs/22.md` holds unchanged, and every check of its "Verify before you report" is run again after the round.

The paths are the brief's, plus:

- `skills/spec/templates/back_out.sh` and `skills/spec/templates/back_out.test.sh`
- `skills/land/templates/remove_worktree.sh` and `skills/land/templates/remove_worktree.test.sh`
- `docs/dev/building.md`
- `docs/dev/change-standard.md` (its test list, beyond item 4's sentences)
- `utils/check_skill_layout.py` only if a new template needs it; say so in the report if it does

The two scripts exist because the back-out and the worktree removal are commands run in order on git state, and the review found their defects only by running them (Proof 1). A script with a test proves them; a paragraph of skill text cannot.

## Rulings

1. **The worktree removal as a script** (Spec 3, Standards 4). `skills/land/templates/remove_worktree.sh <state file> <step>`, run from the repository root:
   - It reads the step's dispatch entry from the state file (PyYAML, as `check_paths.py` does) and takes its `worktree`; the branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them from its package argument. It never builds a path or a branch from the step id.
   - From inside the worktree, `git status --porcelain -z --untracked-files=all` lists every change; each path must be under the ledger root (`.agents/plan.yaml`'s `ledger_root`, or the one the state file's folder sits under). A path outside it prints `refused: <path> is outside the ledger root` for each, exits 1 and removes nothing.
   - Otherwise it runs `git worktree remove --force <worktree>` and `git branch -D` for `<branch>` and `<branch>-land`, each only when it exists, prints one line per thing removed, and exits 0. Exit 64 on an argument, a state file or an entry it cannot use.
   - `remove_worktree.test.sh` proves it on scratch repositories: a worktree holding only ledger copies (an untracked report, a modified `plan.md`, a file whose name holds a space and one holding a quote) removed with both branches; a path outside the ledger refused with nothing removed; a missing `<branch>-land` skipped; a worktree whose folder name differs from the step id (`2b-22` for step `22`) removed by its entry; each refusal. Each case names its revert.
   - `skills/land/SKILL.md` "Removing a step's worktree" becomes: run the script; what it prints and its exits; the Stops row. The `git worktree remove --force` inside it stays on the ask list, so the user is asked.
2. **The back-out as a script** (Spec 1, Spec 2, Spec 3, Behaviour 4). `skills/spec/templates/back_out.sh <state file> <step>`, run from the repository root on main, for a step whose entry reads `landing: backed-out`:
   - `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch`, the branch the entry's worktree folder name; confirmed with `cmp`; an empty diff writes no patch and removes an old one.
   - Then `remove_worktree.sh` for the entry; its refusal is the script's refusal, the patch kept.
   - Then the entry removed from the state file, the rest of the file byte for byte as it was.
   - `/spec` Steps 6, for a step whose ledger holds the patch: from inside the new worktree, `git apply --3way <patch>`. Files that apply are applied; a file that conflicts is left with conflict markers and shows as `UU` (or `AA`, `DU` and the like) in `git status --short`, which the builder may run. The brief says the patch was applied that way and that every file `git status --short` shows as unmerged is the builder's to finish from the patch; nothing is listed at Steps 3, and `git apply --check --cached` is gone. A binary file in conflict keeps main's copy, and the brief says the builder takes the patch's copy for it (the patch carries it with `--binary`). `/land`'s wip `git add -A` stages the finished files, so no builder runs git.
   - `back_out.test.sh` proves on scratch repositories, built as `land.sh` leaves a back-out (the worktree on `<branch>-land`, `<branch>` holding the wip commit, ledger copies untracked in the worktree): a text change, a new file, a file whose name holds a space and a binary change all carried by the patch and restored by `git apply --3way` in a new worktree from a later main; a file main changed since the base left unmerged with its markers while the clean files are applied; the entry removed and the rest of the state file unchanged; the worktree and both branches gone; an empty diff; a refusal of `remove_worktree.sh` leaving the patch and the entry. Each case names its revert.
   - `skills/spec/SKILL.md` "Steps / A step taken back out of main" and Steps 3 and 6 say this, and point at the scripts.
3. **The dispatch entry committed under every executor** (Spec 4). `plan-orchestration` Steps 4: under `inline` and `academic-paper`, the session writes the executor as the builder's identity into the entry and commits it by path before it starts to build, a resume point. `/spec` line 101 and `plan-help` "build it" say the same.
4. **A stop is a commit** (Spec 5). `plan-orchestration`'s Stops ("A stop is booked in the state file's open items the moment it is raised") and `/land`'s back-out (Steps 6, the entry at `landing: backed-out` and the failure in Step 0) commit the ledger by path, a resume point, with every record on disk since the last one.
5. **Only the session's own records go into a resume-point commit** (Spec 6, Behaviour 3). The preflight lists every uncommitted ledger change by path. The session commits only the paths it wrote since the last resume point, named in the `git add -- <path> ...` command; a ledger file it did not write is listed and left alone; an uncommitted change on `plan.md` or the state file that the session did not make is a refusal, named by path, as before. `/spec` lines 49-50 and 88-89 and `plan-orchestration`'s handoff rules say so, with no contradiction.
6. **`~/.agents/skills` compared by resolved path** (Behaviour 1, Proof 2). `pin.sh` compares `$HOME/.agents/skills` with each folder of the list after resolving both (`cd ... && pwd -P`, for a folder that exists); when it is the same folder as one of the list, it is not read. A case in `pin.test.sh`: `~/.agents/skills` a link to `~/.claude/skills`, pin and check both pass, nothing removed. A link to the pinned worktree's root itself counts as into Ordo (Standards 3), with a case.
7. **No history** (Standards 1). `pin.test.sh` lines 336 and 340 and `README.md` line 183 say what the folder is and what `pin.sh` does with it now, in present terms, with no "earlier pin" or "the pin of v1.0.0".
8. **Sentence length** (Standards 2). The sentences the review names, and any other new sentence of this step over about 25 words, are split, one idea each.
9. **`land.sh`'s worktree folder.** `land.sh` builds the worktree path as `.agents/worktrees/<pkg>` (`land.sh` line 115), ignoring `.agents/plan.yaml`'s `worktree_root`. Make it an `ADAPT` setting, `landing_worktree_root=.agents/worktrees` by default, which `/plan` Steps 5 sets from `worktree_root`; `land.test.sh` reads it as it reads `landing_tool_path`, with a case for a worktree root set on the line. `skills/land/SKILL.md` "The landing script" names it among the `ADAPT` edits.
10. **The lists.** `back_out.test.sh` and `remove_worktree.test.sh` are added to `docs/dev/building.md`, `docs/dev/change-standard.md` and the README's test list, with a README bullet for each. The orchestrator adds both to this plan's verify list at landing.
11. **The report's before and after** (Behaviour 2, 3, 4). Add: check mode on an install with links in `~/.agents/skills`, before pass, after fail with a line per link; a user's uncommitted ledger edit, before refused or left alone, after still left alone (ruling 5); a back-out of a step with binary or conflicting files, before lost, after carried by the patch and applied with `--3way`.

## Not sent back

- The ledger copies of `verify.sh` and `usage.py`, and the two new verify-list lines: the orchestrator's, at landing.
- Whether `git worktree remove --force` is on the ask list of the harness: the user is asked when it runs.

## Report

Add a section "Repair round 1" to `agents/reviews/22-report.md` in the worktree's copy of the ledger: each ruling DONE or NOT DONE with the command that proves it, each new or changed case with its revert's first `FAIL:` line quoted, "Verify before you report" rerun and quoted (the verify list must still print `verify: 13 commands passed`; run the two new tests on their own as well), and the files changed with line counts. Update the report's first line to what is true after the round.
