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

## Repair round 1, refuted

### Verification

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
2. Under the same `env -u`, each piped to `tail -1`: `sh skills/land/templates/remove_worktree.test.sh` printed `PASS: remove_worktree.sh scratch tests`. `sh skills/spec/templates/back_out.test.sh` printed `PASS: back_out.sh scratch tests`. `sh utils/pin.test.sh` printed `PASS: pin.sh scratch tests`.
3. Copy run: the four templates copied to `refute-22-r1/copy/`, then `env -u ... HOME=refute-22-r1/eh sh refute-22-r1/copy/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh and usage.py scratch tests`.
4. Reverts on copies under `refute-22-r1/rv/`, first `FAIL:` line of each:
   - R1, `--binary` dropped from both diffs in `back_out.sh`: `FAIL: the patch carries no binary content; expected "GIT binary patch" in: diff --git a/a.txt b/a.txt`
   - R2, `-z` dropped in `remove_worktree.sh`: `FAIL: the untracked path outside the ledger is not named; expected "refused: stray.txt is outside the ledger root .scratch" in: refused: src.txt`
   - R3, the resolved-path compare line removed from `outside_dir` in `pin.sh`: `FAIL: pinning with .../my home/.agents/skills a link to .../my home/.claude/skills failed: pin: removed .../my home/.agents/skills/beta, in a folder pin.sh no longer links into`
   - R4, `"$stable" |` removed from both cases of `links_into_ordo`: `FAIL: the link to the pinned worktree's root was not removed`
   - R5, `landing_worktree` hard-coded to `.agents/worktrees` in `land.sh`: `FAIL: a worktree root set on the ADAPT line: exit 1: preflight failed: worktree not found: .../rooted/.agents/worktrees/rooted`
   All five match the report's quoted lines.
5. End-to-end run with the real `land.sh` (script `refute-22-r1/e2e_setup.sh`, repository `refute-22-r1/e2e/repo`). The ledger `.scratch/L` held the worktree's copies of `land.sh`, `land.test.sh`, `verify.sh` and `usage.py`, and a state file whose dispatch block is a list with two entries: `x`, and step `'22'` with `worktree: .agents/worktrees/2b-22`. The verify list was `sh red.sh`, which exits 1. The builder's work was left uncommitted: `a.txt` line 2 changed, `new.txt` and `sp ace.txt` added, the binaries `img.bin` and `both.bin` changed, `del.txt` changed and `clash.txt` added. The ledger copies were an untracked report and a changed `plan.md`.
   - `sh .scratch/L/land.sh 2b-22 <base>` printed `RED: nope`, `verify list failed`, and `land exit 1`. The worktree was on `2b-22-land`, with ` M .scratch/L/plan.md` and `?? .scratch/L/agents/reviews/22-report.md`.
   - Back-out by the `/land` Steps 6 text: `git restore --staged --worktree`, `git rm --cached` and delete, entry set to `landing: backed-out`, Step 0 written, and the state file, `plan.md` and the report committed.
   - Main then moved on: `a.txt` line 2 and `both.bin` changed, `del.txt` deleted, `clash.txt` added, and a ruling appended to `plan.md` without a commit.
   - `sh <worktree>/skills/spec/templates/back_out.sh .scratch/L/orchestrator-state.md 22` printed `wrote: .scratch/L/agents/reviews/22-backed-out.patch`, `removed: worktree .agents/worktrees/2b-22`, `removed: branch 2b-22`, `removed: branch 2b-22-land` and `removed: dispatch entry 22`, and exited 0. The entry `x` was kept.
   - The same run from the repository reached through `/tmp` (a symbolic link to `/private/tmp`) also exited 0.
   - Then the preparation commit (brief, patch, `plan.md`, state file), then `git worktree add -b 22 .agents/worktrees/22 <new base>`. From inside that worktree, `git apply --3way <repo>/.scratch/L/agents/reviews/22-backed-out.patch` printed `error: del.txt: does not exist in index` among its lines and exited 1. `git status --short` then printed nothing, and `ls` showed that `new.txt`, `sp ace.txt` and the builder's `img.bin` were absent.
   - The same apply with `--exclude=del.txt` gave `UU a.txt`, `UU both.bin`, `AA clash.txt`, `M  img.bin`, `A  new.txt` and `A  "sp ace.txt"`.
6. Back-out with a comment line directly under `dispatch:` (`refute-22-r1/e2c`, same setup): `back_out.sh` printed `wrote: ...patch`, `removed: worktree .agents/worktrees/2b-22`, `removed: branch 2b-22`, `removed: branch 2b-22-land`, `failed: the dispatch block of .scratch/L/orchestrator-state.md would not hold exactly the other entries`, and exited 1. The entry still read `landing: backed-out`. A rerun printed `error: refs/heads/2b-22 does not name a commit` and exited 64.
7. A binary change to a 20000-byte file, run through `git diff --binary` (`refute-22-r1/delta`), printed `GIT binary patch` followed by `delta 15`.
8. `pin.sh` cases (`refute-22-r1/pincases.sh`, `HOME` written through `/tmp`):
   - `~/.agents/skills` a link to `$CLAUDE_CONFIG_DIR/skills`: pin and check both exit 0, and nothing is removed.
   - `~/.agents` a link to `~/.claude`: both exit 0.
   - Links to the pinned worktree root, written both resolved and unresolved, and a relative link into the worktree: check exits 1 naming the three, and pin removes the three.
   - A link into the sibling folder `ordo-stable-old/land` is kept.
   - `~/.agents/skills` a link to a `~/.claude/skills` that does not exist yet: pin and check both exit 0.
9. The ask list: `$CLAUDE_CONFIG_DIR` is `/Users/axelfaes/.claude-work`, and its `settings.json` `permissions.ask` is `['Bash(git push *)', 'Bash(gh pr create *)', 'Bash(gh pr merge *)', 'Bash(gh release *)', 'Bash(git reset --hard *)', 'Bash(git clean *)', 'Bash(git branch -d *)']`. `~/.claude/settings.json` holds the same list. The repository has no `.claude/settings.json`.
10. `LC_ALL=C grep -n '[^ -~]'` over every changed and new file printed nothing (exit 1). `grep -n 'earlier\|v1\.0\.0\|no longer'` finds, in the changed code, only the brief's printed message and `back_out.sh` line 17 ("a patch an earlier back-out of the step left there", which describes a file on disk and is not history). `grep -n 'remove_worktree.test\|back_out.test'` finds `building.md` lines 8 and 14, `change-standard.md` lines 44 and 50, and README lines 108, 114, 123 and 129.

### Closures

1. Ruling 1, the worktree removal as a script: closed. It is proved by the test and by my run on the real `land.sh` state (Verification 5), with a folder name that differs from the step id and a list of two entries, and reverts R2 and the report's others reproduce. Its sentence "stays on the ask list, so the user is asked" is false: see Spec 3.
2. Ruling 2, the back-out as a script: not closed.
   - The ruling says "Files that apply are applied". This fails whenever the patch touches a file that main deleted: `git apply --3way` then applies nothing at all, and `git status --short` is empty (Verification 5). The builder sees nothing to finish, and the old work is dropped as in Behaviour 4 of the first review.
   - The binary-conflict instruction cannot be carried out by a builder (Spec 2).
   - The script removes the worktree and branches before it checks that it can edit the state file (Proof 1).
   - The test cases the ruling lists are present and pass, and R1 reproduces.
3. Ruling 3, the dispatch entry committed under every executor: closed in the text, at `plan-orchestration` lines 52, 55 and 56, `spec` Steps 8 and `plan-help` "build it". One sentence is false under `agent`: see Standards 1.
4. Ruling 4, a stop is a commit: closed, at `plan-orchestration` line 221 and `land` line 64.
5. Ruling 5, only the session's own records: closed in `spec` Steps 1 and 5 and in `plan-orchestration` lines 108-109. The round also added a rule that no ruling asks for: see Spec 1.
6. Ruling 6, `~/.agents/skills` compared by resolved path, with the worktree root counted: closed. The test's case and reverts R3 and R4 are red as the report says, and my cases in Verification 8 pass.
7. Ruling 7, no history: closed. The grep in Verification 10 finds no "earlier pin" or "the pin of v1.0.0" in `pin.test.sh` or `README.md`.
8. Ruling 8, sentence length: closed for the sentences the first review named. The long sentences left in the added lines are older sentences carried into rewritten lines of README.md.
9. Ruling 9, `landing_worktree_root`: closed. It is in `land.sh`, `land.test.sh` (the case "rooted" and the loop of bad roots), `/plan` Steps 5 and `land` "The landing script", and revert R5 is red.
10. Ruling 10, the lists: closed (Verification 10).
11. Ruling 11, the before and after: not closed.
   - The back-out bullet says the old work is "carried by the patch and applied with `--3way`". It does not state the case where nothing is applied (Behaviour 1).
   - The `/land` reordering has no before and after (Behaviour 2).

### Spec

1. `skills/plan-orchestration/SKILL.md` line 111: "A session taking over lists the uncommitted ledger changes by path and asks the user which are records of the session it takes over. Those become its own records; the rest are left alone."
   - No ruling asks for this. Ruling 5 says that a change the session did not make is listed and left alone, and that one on `plan.md` or the state file is a refusal.
   - It is a question put to the user outside the six kinds of stop at line 208. It is not booked as an open item, so an unattended run blocks on a question that has no place in "Stops".
   - It contradicts line 104, under which a session continues "from the files alone".
   - The user can answer only which edits are his own. He cannot tell which files a dead session wrote.
   - The resume-point rule could make the question unneeded in two ways. A handover could itself be a resume point, so the handing-over session commits its records before it stops. Or the records a session writes could be named in the state file, so a successor reads them there instead of asking. The dispatch entry already names `report:` and `reviewer_report:`.
2. `skills/spec/SKILL.md` line 103: "The brief says a binary file in conflict keeps main's copy, and that the builder takes the patch's copy for it. The patch carries that copy, since it is written with `--binary`."
   - For a binary file of any size, `git diff --binary` writes a `delta` against the base's blob, not a literal copy (Verification 7).
   - A small file gets a zlib-compressed base85 `literal`.
   - Under the no-git rule the builder cannot rebuild either one. Only `git apply` of that file would do it, and that changes state.
   - Ruling 2 asked for this sentence, so the ruling was wrong on this point. The report does not say so under "Anything in the brief that was wrong or impossible".
3. `skills/land/SKILL.md` line 128: "The `git worktree remove --force` inside it stays on the ask list, so the user is asked."
   - The harness matches the ask list against the Bash command it runs, which is `sh templates/remove_worktree.sh ...`. The `git worktree remove --force` and `git branch -D` inside the script's Python subprocesses never reach it.
   - Neither ask list names the scripts or `git worktree remove` (Verification 9).
   - So both `/land` Steps 11 and `back_out.sh` now delete a worktree and two branches without asking the user. Brief decision 4 and ruling 1 rest on the user being asked.
4. `skills/spec/SKILL.md` lines 99-103 and 240-251 have no text for what `git apply --3way` prints or its exit status.
   - Exit 1 means some files conflicted, and it also means nothing was applied (Verification 5). The session cannot tell the two apart from the exit status, and the text does not say to read the `error:` lines.
   - The brief is committed at Steps 5, before the apply, so the builder is never told that the patch applied nothing.
5. `skills/land/SKILL.md` lines 73-75 move the worktree removal from after the commit to Steps 11, before the state file rewrite, the landing report and the commit. No ruling asks for this.
   - Ruling 1 asks only that "Removing a step's worktree" run the script.
   - Walking `/land` in order, nothing after Steps 11 needs the worktree: the look (7) and the A/B (8) come before it.
   - Two things are lost:
     - Between Steps 11 and 13, the only refs holding the step's work (`<step>` and `<step>-land`) are deleted, and the work exists only in main's index.
     - A landing interrupted there is not recognised. With the entry still at `landing: cherry-picking`, `plan-orchestration` line 120 says to check main before anything is applied again, but `/land` again runs `land.sh`, whose preflight fails on `worktree not found`. Once the entry is cleared, `/land` refuses with "No dispatch block", whose resume is `/spec`, and `/spec`'s preflight refuses the staged main. No resumption rule covers either state.
   - With `landing_tool_path` narrower than `.`, a file outside it stays changed in the worktree after `land.sh`. `remove_worktree.sh` then refuses, and the landing's commit is blocked with main staged.
   - Removing after the commit, reading the entry from the state file before its rewrite (or from `HEAD~1`), keeps the old safety.

### Proof

1. `skills/spec/templates/back_out.sh` lines 212-225: `remove_worktree.sh` runs at line 212, and `without_entry` and the read-back check run after it.
   - `without_entry` treats the block as a single entry whenever the first line after `dispatch:` is not a list item, for example a comment line or a blank line. It then writes `dispatch: none`, the read-back check refuses, and by then the worktree and both branches are gone.
   - A rerun is refused with exit 64 for good (Verification 6), so the Stops row's "The cause put right, then `/spec` again" cannot resume it. The patch survives, but the entry stays at `landing: backed-out` with no route through.
   - The test has no case with a comment or a blank line under `dispatch:`, and no case proving that the state edit is checked before anything is removed.
2. `skills/spec/templates/back_out.test.sh`: no case has main delete (or rename) a file the patch changes. That one case turns the apply half from "the clean files applied" into "nothing applied" (Verification 5). The report calls the apply half an audit; it does not cover the case where the command does nothing.
3. `back_out.test.sh` and `remove_worktree.test.sh` build the back-out state by hand. `<folder>-land` is checked out at main without the cherry-picks that `land.sh` makes. Ruling 2 says "built as `land.sh` leaves a back-out". My run on the real `land.sh` state passed (Verification 5), so this is a gap in the proof, not a defect found.
4. The report's judgment call 8 (report line 253) still says the `land` Stops row is "a refusal after the landing's commit". The round made it a refusal before the commit, and the round section's list of replaced parts (line 283) does not name call 8.

### Standards

1. `skills/plan-orchestration/SKILL.md` line 52: "The commit comes before the build starts". Line 51 writes the agent id "The moment it is launched", so under `agent` the build has started before the identity exists to commit. The sentence is false for the default executor, and line 113 ("recorded in the state file before the builder starts") says the same thing.
2. `skills/spec/SKILL.md` line 116 says "no path or branch is built from the step id", and line 99 (Steps 6) still builds both from it: `git worktree add -b <step> <worktree_root>/<step> <base>`. This repository's own entry uses `.agents/worktrees/2b-22` for step `22`. Once a step is prepared again, the new worktree gets a different name from the old one, and `land.sh <pkg>` must then be given `22`, not the name this plan used before. The two sentences are not contradictory as written, but the second path is not stated anywhere.

### Behaviour

1. A back-out of a step that changed a file main has since deleted: before this round, the work was lost. After this round, the patch keeps it, but `/spec` Steps 6 applies none of it, the builder sees an empty `git status --short`, and the brief says nothing. The report's "after" for the back-out shows only a case where the apply succeeds.
2. `/land` order. Before: the commit, then the removal of the worktree and one branch, so a failed removal left main committed. After: the removal of the worktree and both branches, then the rewrite of the state file, the landing report and the commit, so a refused removal leaves main with the cherry-pick staged and the booking uncommitted. The report gives this only as judgment call 1 of the round, with no before and after.
3. The deletion of the worktree and branches runs with no prompt (Spec 3). Before, the removal was a bare `git worktree remove` of which the text said nothing about asking. After, the text says the user is asked, and the user is not asked.

### Not checked

- A locked worktree, and a worktree with submodules.
- A rename on main of a file the patch changes. I expect it to fail like the deletion, from the same `does not exist in index` path, but I did not run it.
- The ledger copies of `verify.sh` and `usage.py`, which the orchestrator makes at landing.
