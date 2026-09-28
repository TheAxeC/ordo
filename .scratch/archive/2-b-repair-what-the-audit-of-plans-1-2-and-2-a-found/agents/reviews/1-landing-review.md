# Step 1: review of the fixes made at landing

A fresh read-only reviewer read the orchestrator's first pass of landing fixes (the unstaged changes on main over the cherry-picked step). Usage: 91,589 tokens, 19 tool uses, 314 s (the runner's completion notification).

Two of the four landing fixes are not complete. Proof 6 is not closed in the one line the runner books, and the rewritten Standards 3 sentence is still false for three spellings. The `ps` fix left two pages and a test head comment stale, and one head-comment line breaks the brief's 100-character limit. The two new tests both turn red when their fix is reverted, and both runs are green.

Scope of the unstaged diff (`git diff`): `utils/verify.sh`, `utils/verify.test.sh`, `README.md`, `docs/dev/building.md` and the state file. The state file changes are the new verify line and `landing: not-started` to `landing: cherry-picking`. Nothing outside the stated fixes was changed. Since my first `git status --short`, `1-refuter.md` has also picked up a new unstaged change: its "## Closed" section, which is the landing record.

## Findings

1. **Standards 3 is not closed.**
   - Where: `utils/verify.sh:8-10`, `README.md:134`, and `docs/dev/building.md:22`, which says "a test that exits non-zero in a foreground pipeline into `tail` is red".
   - Hunk (README): "a test that exits non-zero in a pipeline into `tail` is red however the pipe is spelled, unless the pipeline runs in the background (`&`), whose status `pipefail` never sees."
   - The sentence is still false for foreground spellings. I ran each through `sh utils/verify.sh s.md`, where `pe1.test.sh` prints `PASS: x` and exits 1:
     - `'! sh pe1.test.sh 2>&1 | tail -1'` prints `PASS: x` / `verify: 1 commands passed`, exit 0. It is even taken as a summary test.
     - `if sh pe1.test.sh 2>&1 | tail -1; then :; fi` exits 0.
     - `sh pe1.test.sh 2>&1 | tail -1 || true` exits 0.
   - Background is not the only exception. Any pipeline whose status is consumed by `!`, `if`/`while` or `||` also escapes. The Closed entry in `1-refuter.md` marks Standards 3 closed, and that claim is wrong too.

2. **Proof 6 is not closed in what the runner books.**
   - Where: `utils/verify.test.sh:22-31`.
   - Hunk: `printf 'note: %s is not installed; the runner was not run under it\n' "$shell"`, followed later by the unchanged `printf 'PASS: verify.sh scratch tests\n'`.
   - Check: a copy with `dash` replaced by `nosuchdash` in the loop. `sh verify.test.sh 2>&1 | tail -1` prints `PASS: verify.sh scratch tests`, the same line as a run under both shells.
   - The note never reaches the verify list's filter (`2>&1 | tail -1`), so the booked green line still does not say that dash was skipped (change standard rule 9).

3. **The `ps` change was not carried to every page that names the requirements or the covered cases (rule 14).**
   - `README.md:123`, the `verify.test.sh` bullet, still says "A missing `python3`, PyYAML or `bash` exits 69". It does not mention the new no-`ps` case, the killed-command case (exit status 137), or the per-shell `PASS` lines and the dash note.
   - `utils/verify.test.sh:2-9`, the head comment's list of cases, still ends "a missing python3, PyYAML or bash; and a scratch folder it cannot make". It does not name `ps` or the killed command, and lines 11-13 do not mention the per-shell `PASS` line or the note.
   - `README.md:43`, under Requirements: "- git, POSIX `sh`, and `python3` with PyYAML." It names neither `bash` nor `ps`. The `bash` omission comes from the staged step; `ps` is this landing's addition.

4. **Line too long.**
   - Where: `utils/verify.sh:10`, 112 characters (`awk 'length>100'` over both files prints only this line).
   - Line: "# pipefail never sees. A command whose text after its last single pipe (not ||) is a tail stage (tail, or a path"
   - The rewrap of the head comment stopped at this line, and brief line 60 sets "Script lines about 100 characters at most".

5. **The new per-shell `PASS` line is printed but never checked.**
   - Where: `utils/verify.test.sh:28`, `VERIFY_TEST_SHELL=$shell sh "$0" || exit 1`.
   - The outer loop only tests the child's exit status. If the per-shell `printf` at line 495 were removed, nothing would go red. The fix for Standards 2 is therefore shown only by running it by hand.

## Checks that passed

- **The `ps` check test turns red when its fix is reverted.** On a copy with the four lines removed: `FAIL: no ps: exit 1, expected 69; output: RED: sh green.test.sh 2>&1 | tail -n 2 / exit status: 127 / bash: tail: command not found (runner under sh)`, exit 1.
  - The red comes from `tail` being missing on the test's `PATH`, not from `ps`. It still fails for the right reason, because the runner did not exit 69.
- **The killed-command test turns red when its fix is reverted.** With `status = code`: `FAIL: a command killed by a signal: output differs; got: RED: kill -9 $$ / exit status: -9 (runner under sh)`, exit 1.
- **Standards 2 in part.** `VERIFY_TEST_SHELL=dash sh utils/verify.test.sh` now ends `PASS: verify.sh scratch tests (runner under dash)`, exit 0.
- **ASCII.** `LC_ALL=C grep -n '[^ -~]'` over the changed files: no output, exit 1. The diff has no dash-as-aside.
- **Last lines of the requested runs:**
  - `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` ends with `verify: 12 commands passed`, exit 0, in 1:18. Its lines include `PASS: verify.sh scratch tests` and ten `ok:` lines.
  - `sh utils/verify.test.sh` ends `PASS: verify.sh scratch tests (runner under sh)`, `PASS: verify.sh scratch tests (runner under dash)`, `PASS: verify.sh scratch tests`, exit 0.

## Not checked

- The test file under `dash` as the outer shell, and on Linux or busybox.
- The ASCII check command from `docs/dev/change-standard.md` over the whole tree. Only the changed files were scanned.
- The prose standard, read sentence by sentence against the whole README and building.md. Only the changed sentences were read.
- Whether the step 1a booking in `1-refuter.md` also reached `plan.md` or the state file. The state file diff has no such entry, and I did not read `plan.md`.
- Line 10's length against any rule other than the brief's.
