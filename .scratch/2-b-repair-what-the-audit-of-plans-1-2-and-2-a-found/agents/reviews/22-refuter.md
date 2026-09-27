# Refuter report: step 22

## Verification

1. From the worktree root: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: check_paths.py scratch tests
PASS: check_step.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 13 commands passed
exit 0
```
2. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1` printed `PASS: pin.sh scratch tests`.
3. Copy run: the four templates copied into `refute-22/copy/`, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch>/eh sh <scratch>/copy/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh and usage.py scratch tests`. Control with only `land.sh` and `land.test.sh` in `copy2/` printed `FAIL: verify.sh not found beside this test or in the land skill's templates`. Both reproduce the report.
4. `grep -rn -i 'commit' skills/*/SKILL.md README.md docs/dev/*.md | wc -l` printed `85`, as the report says.
5. `LC_ALL=C grep -n '[^ -~]'` over the eleven changed files and the report printed nothing.
6. `git status --short` in the worktree: the eleven modified files and the untracked report only; `git diff 3371bbc --stat`: 11 files changed, 241 insertions(+), 53 deletions(-).
7. Reverts on copies under `refute-22/R3`, `R7` and `R8` (2 changed lines each), each first `FAIL:` line:
   - R3 (folder resolution replaced by `return 1`): `FAIL: the link into the pinned worktree through a linked folder was not removed`
   - R7 (`ORDO_SKILL_DIRS` condition replaced by `if true`): `FAIL: the link in /private/var/folders/.../pin-test.CSeEBF/my home/.agents/skills was removed with ORDO_SKILL_DIRS set`
   - R8 (list check made a no-op): `FAIL: pinning with CLAUDE_CONFIG_DIR at .../my home/.agents failed: pin: replaced .../my home/.agents/skills/beta, which linked into the live clone .../ordo`
   These match the report's R3, R7 and R8.
8. The backed-out path, run end to end in a scratch repository (`refute-22/bo/r`). Setup: main with a ledger at `.scratch/L`, worktree `wt/s1` on branch `s1` at base. In it the builder changes `a.txt` line 2, adds `new.txt` and `sp ace.txt`, and changes the binary `img.bin`. An untracked report copy and a modified `plan.md` copy sit in the ledger. land.sh's commands then ran: add with the ledger excluded, `commit -m wip`, `checkout -b s1-land main` with the ledger ignored, cherry-pick. After that main moved on with another change to `a.txt` line 2 and `b.txt`, and a ruling was appended to `plan.md` without a commit. Then the spec text, in order:
   - `git diff $BASE s1 > <patch>` exit 0; `git diff $BASE s1 | cmp - <patch>` exit 0. The patch holds `Binary files a/img.bin and b/img.bin differ` and no content for `img.bin`.
   - The status from inside the worktree listed ` M .scratch/L/plan.md` and `?? .scratch/L/agents/reviews/s1-report.md`, both under the ledger.
   - `git worktree remove --force wt/s1` exit 0. `git branch -D` of `s1` and `s1-land` (guarded by `rev-parse -q --verify`) printed `Deleted branch s1 (was b556f70).` and `Deleted branch s1-land (was b556f70).`
   - `git apply --check --cached <patch>` from main exit 1: `error: patch failed: a.txt:1`, `error: a.txt: patch does not apply`, `error: cannot apply binary patch to 'img.bin' without full index line`, `error: img.bin: patch does not apply`.
   - Preparation commit, then `git worktree add -b s1 wt/s1 <new base>` exit 0.
   - `git apply --check <patch>` in the new worktree exit 1, with the same four error lines. `git apply <patch>` exit 1, and `git status --short` was empty afterwards: nothing was applied. `new.txt` and `sp ace.txt`, which apply cleanly, were not applied either. `git apply --reject` confirmed both apply cleanly.
   - With `git sparse-checkout set src` in a worktree, `git apply --check .scratch/L/agents/reviews/s1-backed-out.patch` gave `error: can't open patch ...: No such file or directory`, exit 128.
9. pin.sh edge cases under a scratch `HOME` holding a space (`refute-22/pin`), current `pin.sh`, `ORDO_SKILL_DIRS`, `CLAUDE_CONFIG_DIR` and `ORDO_STABLE` unset:
   - Removed, each with its line: a relative link `../../.local/share/ordo-stable/land`, a link whose target folder `ordo-stable/gone/deeper` does not exist, a link into the live clone, and a link to the live clone's `skills` folder. Check mode exited 1 naming the same four.
   - Kept: a foreign link into `fold er/x` (a folder path holding a space), and a link to the pinned worktree root itself (`-> .../ordo-stable`).
   - With `~/.agents/skills` itself a symbolic link to `~/.claude/skills`: check mode on a correct pin exits 1 (`pin: .../.agents/skills/alpha links to .../ordo-stable/skills/alpha, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it`). `pin.sh v1` then prints `pin: removed .../.agents/skills/alpha, ...` and `pin: .../.claude/skills/alpha does not link to ...`, ends with `pin: the links do not match the pin after linking`, and exits 1 with `~/.claude/skills` left empty. Control: the base `pin.sh` (`git show 3371bbc:utils/pin.sh`) on the same layout printed `pinned: v1 (96dbc01), 1 skills linked in: .../.claude/skills` and exit 0, and its check mode exited 0.
10. Read-only check mode on the real home: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.sh`. It printed one `pin: /Users/axelfaes/.agents/skills/<skill> links to /Users/axelfaes/.local/share/ordo-stable/<skill>, in a folder pin.sh no longer links into; utils/pin.sh <tag> removes it` line per link (repo-setup, roadmap and spec among the tail), then `pin: the links do not match the pin at v1.0.0`.

## Spec

1. `skills/spec/SKILL.md` line 108, `1. Write `git diff <base> <step>` to `agents/reviews/<step>-backed-out.patch``. A plain `git diff` writes no content for a binary file: the patch line is `Binary files a/img.bin and b/img.bin differ` (Verification 8). `git apply` then refuses that file with `cannot apply binary patch to 'img.bin' without full index line`, even when main has not touched it. Item 2 of the same path then deletes `<step>` and `<step>-land`, the only refs that hold the binary content. Any step that changes a binary file therefore loses that change on a back-out, and the builder cannot "redo from the patch by hand" what the patch does not contain. `git diff --binary` would carry the content. The brief's own text says `git diff <base> <step>`; the report says nothing in the brief was wrong.
2. `skills/spec/SKILL.md` lines 93-94 and 76-77: "When that check fails, nothing is applied, and the brief lists the files the patch does not apply to, for the builder to redo from the patch by hand". Verification 8 shows `git apply` is all-or-nothing. When one file fails, the files that apply cleanly (`new.txt`, `sp ace.txt`) are not applied either, and they are not on the `error:` lines. The brief then lists only `a.txt` and `img.bin`, and the builder redoes those two, so every clean file of the old work is silently dropped. The text should either apply per file (`git apply --reject`, or the clean files applied and the failing ones listed), or make the brief say that nothing was applied and the whole patch is to be redone. This also comes from the brief's own wording; the report does not raise it.
3. `skills/spec/SKILL.md` lines 106-110 and `skills/land/SKILL.md` lines 121-122 name the kept worktree and branches `<worktree_root>/<step>`, `<step>` and `<step>-land`. "What it reads" 3 (line 36) says the path "reads the entry's `base` and `worktree`", but no command uses the entry's `worktree`. In this repository's own dispatch entry, `step: '22'` has `worktree: .agents/worktrees/2b-22`, and `git status` in it prints `On branch 2b-22`. So `git diff <base> 22`, `git worktree remove --force .agents/worktrees/22` and `git branch -D 22` would all name refs and paths that do not exist. The path runs destructive commands on names derived from the step id, not the recorded worktree and its branch.
4. `skills/spec/SKILL.md` line 101 says the dispatch entry "is committed once, when the builder's identity is in it, by `plan-orchestration`'s Steps 4 at launch, or, run by hand, by the session when it starts to build". `skills/plan-orchestration/SKILL.md` line 51 commits only under **`agent`**. The **`inline`** bullet (line 54) and the **`academic-paper`** bullet (line 55) write no identity and no commit. Under those executors the dispatch entry, a resume point under ruling AA, is committed by nothing before the landing. `skills/plan-help/SKILL.md` line 55 ("build it") does not say the session commits the entry either.
5. The resume point "a stop (its open item and Step 0)" (`plan-orchestration` line 102) is committed only in `skills/spec/SKILL.md` line 120 ("A stop"). `skills/plan-orchestration/SKILL.md` Stops, line 211, "A stop is booked in the state file's open items the moment it is raised", has no commit. Neither has `/land`'s back-out, which writes Step 0 and `landing: backed-out` (land line 60). So a stop the orchestrator raises (after a refutation, at landing, or on a case hand-back) is a listed resume point that no text commits.
6. `skills/spec/SKILL.md` line 88, Steps 5, commits "every other ledger record written on disk since the last resume-point commit", listed by `git status --short -- <ledger>` (line 89). Line 49, unchanged, says "Any unrelated change of the user's is listed by path and left alone". Line 50 now accepts any uncommitted change on `plan.md` and the state file. A user's unrelated edit to `plan.md` or to any other ledger file is therefore swept into the preparation commit, where it used to be refused (`plan.md`) or left alone. The two sentences contradict each other, and the preflight cannot tell a record from a user's edit.

## Proof

1. The report's Verify 6 table covers only `pin.sh`. Items 1, 4 and 5 are text changes and have no executable test. The report says so and names `check_skill_layout.py` as their check, but that check is a layout audit that no revert of the new text turns red. The commands of the backed-out path were never run by the builder: judgment call 5 cites "a probe on a scratch repository" for `git apply --check` only. That probe missed the binary case and the all-or-nothing apply (Spec 1 and 2), which one run of the text's own commands shows (Verification 8).
2. `utils/pin.test.sh` never exercises `~/.agents/skills` as a link to a folder of the list. That layout is a textual non-match of the `case "$nl$skill_dirs$nl"` check at `utils/pin.sh` lines 61-66, and it breaks the pin (Behaviour 1). R8's test covers only the literal `CLAUDE_CONFIG_DIR=$HOME/.agents` case.
3. The report's first-run table marks the `find-skills` and `ORDO_SKILL_DIRS` cases "green" on the unchanged tree, and the report names `find-skills` an audit. That is stated correctly. Reverts R3, R7 and R8 reproduced as quoted (Verification 7).

## Standards

1. `utils/pin.test.sh`, new comment at line 336: "~/.agents/skills, a folder an earlier pin linked into and the default list does not hold", and line 340: "The links into the pinned worktree take the shape an earlier pin made". `README.md` line 183: "and the pin of v1.0.0 linked into it". These describe what an earlier version did, which is history in a comment and a doc (`docs/dev/change-standard.md` rule 10; `skills/repo-setup/templates/shared-rules.md`, last rule). The printed message "in a folder pin.sh no longer links into" is the brief's and is not counted here.
2. Prose standard E, sentence length. Some new sentences run well past about 20 words where the mechanism does not need it. `skills/spec/SKILL.md` line 88, the Steps 5 sentence, is about 50 words. `skills/plan-orchestration/SKILL.md` line 51 runs to about 55 words. `skills/land/SKILL.md` line 66, Removing 2, is about 40 words.
3. `utils/pin.sh` lines 97-107: a link to the pinned worktree root itself (`-> .../ordo-stable`) is not matched, because `"$stable"/*` needs a trailing path, and it is kept (Verification 9). That is an edge of rule 15 for a link into Ordo; the brief says "inside", so this is minor.
4. `skills/land/SKILL.md` lines 118-119: `git status --porcelain --untracked-files=all` quotes a path holding a space or a special character (`?? "sp ace.txt"`, Verification 8). A ledger file with such a name is then read as a path outside the ledger root, and the removal is refused. `-z` is the form that does not quote (change standard rule 15).
5. No SKILL.md changed without a version bump: spec 1.6.0, land 1.8.0, plan 1.9.0, plan-orchestration 2.9.0, plan-help 1.8.0 and refute 1.6.0. No non-ASCII characters. No em dashes or hard wraps were seen in the Markdown hunks.

## Behaviour

1. `utils/pin.sh` lines 60-66 compare `$HOME/.agents/skills` with the list only as text. When `~/.agents/skills` is a symbolic link to `~/.claude/skills` or to `$CLAUDE_CONFIG_DIR/skills`, pin mode deletes every link it has just made, prints `removed` lines for them, and exits 1 with the skill folder empty. Check mode also fails on a correct pin (Verification 9). The base `pin.sh` passes on the same layout. The report states no such case.
2. Check mode on the user's current install now fails. `sh utils/pin.sh` on the real home prints a line for each of the ten links in `~/.agents/skills`, then `pin: the links do not match the pin at v1.0.0` (Verification 10). Those links currently point at existing v1.0.0 skill folders, so they work today. The report's before and after for the pin names only what pin mode would remove. It does not say that the check of the current pin goes from pass to fail, or that the removal applies to links that still work while v1.0.0 is pinned.
3. `/spec` now commits a user's uncommitted edit on the ledger's `plan.md` (and any other ledger file) in the preparation commit, where it was refused before (Spec 6). The report's before and after says only that "`/spec` accepts an uncommitted `plan.md` and state file". It does not say that such a change, whoever made it, is committed.
4. After a back-out, the work of a step that changed a binary file, or of any file the builder is not told to redo, is lost once `/spec` deletes the branches (Spec 1 and 2). The report's before and after for the backed-out path says "a new worktree with the patch applied uncommitted" and does not state this.

## Not checked

- Whether `git worktree remove --force` is on this repository's ask list in the harness permission settings.
- A real run of `land.sh` into a back-out. The land state was reproduced with land.sh's own git commands in a scratch repository, not by running the ledger's `land.sh`.
- A locked worktree (`git worktree remove` then needs `--force` twice) and a worktree with submodules.
- The ledger copy at landing (`verify.sh` and `usage.py` into this plan's ledger), which is the orchestrator's to do.

## Usage

- Reviewer: claude:opus, a fresh background agent: 194,988 tokens, 42 tool uses, 666 s.
