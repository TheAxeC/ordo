# Step 9 refuter report (on .agents/worktrees/2b-9, base 163e9c2)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch>/home PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
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
verify: 12 commands passed
exit 0

$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests

$ sh skills/land/templates/land.test.sh   (whole output, exit 0)
clean: exit 0, staged paths, usage rows and the orchestrator row verified
conflict: exit 2, conflicting path and retained landing branch verified
committed: nothing pending, no wip commit made, exit 0
locked: a lock held while git runs stops the landing at the bound, exit 1, main untouched
stale: a stale lock with no git process running removed, exit 0
released: a lock gone before the bound waited for, exit 0
bad bound: LANDING_LOCK_WAIT=2s refused with exit 64
adapted: tools/demo landed, the file outside it left unstaged
usage: Claude Code and Codex rows verified, one message per id, the window across offsets
usage: a window time without an offset or unreadable refused, exit 64, both arguments
examples: skipped outside an Ordo checkout, a missing example fails inside one
examples: plan.yaml and plan.projects.yaml match the state template, every key marked
PASS: land.sh and usage.py scratch tests

Review reproductions (brief "Verify before you report" item 3), rerun under $TMPDIR:
A  non-UTF-8 CLAUDE.md: "error: <scratch>/a/CLAUDE.md is not UTF-8 (byte 35)", A exit 2
B  CRLF CLAUDE.md, drifted: CRs before: 55; check exit 1; "written: the shared-rules block now equals the template"; write exit 0; CRs after: 55
C  land.test.sh copy with line 130 (pending.txt) deleted: only "FAIL: clean staged paths differ: [tools/oculus/committed.txt]" (the landing itself exits 0)
D  skills/land/templates/* copied outside any repository, tail -3:
   examples: skipped outside an Ordo checkout, a missing example fails inside one
   examples: not in an Ordo checkout (no git repository around <scratch>/d/t holds skills/plan/templates/), not checked
   PASS: land.sh and usage.py scratch tests
   In place: the checked "examples: plan.yaml and plan.projects.yaml match ..." line (above).
E  lock held with a git process running: the "locked" case (LANDING_LOCK_WAIT=2), green; the default 60 s bound not rerun (Not checked).
F  usage.py <log> 2026-09-24T19:00:00 2026-09-24T20:00:00+02:00:
   "usage.py: the from time 2026-09-24T19:00:00 has no offset; give an ISO time with an offset, such as 2026-09-24T19:00:00+02:00", exit 64

Reverts, each on a copy of skills/ under $TMPDIR, the copied test run (python3 -B mut.py):
RED 1a-utf8-uncaught (UnicodeDecodeError handler removed) | FAIL: ... <scratch>/not-utf8 ... exit 1, expected 2
RED 1b-template-oserror-uncaught (shared-rules.md read with bare open) | FAIL: ... no-template/sync_rules.py .../same: exit 1, expected 2
RED 1c-exit1-on-unreadable (unreadable CLAUDE.md returns 1) | FAIL: ... not-utf8 ...
RED 2a-eol-lf (block always written LF) | FAIL: --write left 31 CRLF lines of 55
RED 2b-universal-read (read without newline="") | FAIL: --write left 0 CRLF lines of 55
RED 2c-keep-before (tabs before the block altered on --write) | FAIL: --write changed bytes outside the block
RED 3-errors-stdout (cannot-read error to stdout) | FAIL: no shared-rules.md: stdout is not empty: [error: cannot read ...]
RED 4-reversed (reversed-marker check removed) | FAIL: ... reversed ...
RED 4-count (marker counts replaced by "in") | FAIL: ... two-begins ...
RED 4-reread (read-back comparison "if False:") | FAIL: ... lost-write.py ...
RED 4-noclaude ("no CLAUDE.md" branch removed) | FAIL: no CLAUDE.md: stderr is not [error: ...no CLAUDE.md in ...]: [error: cannot read .../no-claude/CLAUDE.md: No such file or directory]
RED 5-commit-always (wip commit whatever is staged) | FAIL: a landing with nothing pending exited 1, expected 0
RED 6-skip-missing (missing example skips) | FAIL: examples in an Ordo checkout without its examples exited 0, expected 1
RED 7-no-bound (bound check "if false") | FAIL: locked: the lock wait did not stop at its bound
RED 8-old-count (token_count events counted again) | FAIL: Codex usage row differs: [2 messages, 60 output tokens, 20 cache-write tokens, 250 cache-read tokens, 230 fresh input tokens, 60 minutes]
RED 9-naive-accepted (old moment(), no offset check) | FAIL: usage.py failed on the Claude Code log

Premises of "What is on the tree" on 163e9c2 (git show 163e9c2:<path> | wc -l / grep -n): sync_rules.py 66, test 64, land.sh 462, usage.py 124, land.test.sh 290; sync_rules.py:30 and :39 bare open(), :34/:37/:41/:54 error prints to stdout, :26 usage to stderr; land.sh:191 unconditional commit, :118 git_process_alive, :134 wait_for_index; usage.py:26 moment, :55 except ValueError, :112 unguarded moment(lo_text); land.test.sh:288 "not in an Ordo checkout, not checked"; SKILL.md:46 unbounded wait. All reproduce.

git diff 163e9c2 --stat: 7 files (README.md, skills/land/SKILL.md, land.sh, land.test.sh, usage.py, sync_rules.py, sync_rules.test.sh), 597+/69-; README hunk touches only lines 117 and 120. git status --short: those 7 plus the untracked report.
LC_ALL=C grep -n '[^ -~]' over the six changed code/skill files: nothing. No history words in added lines (grep for previously/no longer/used to/step N/audit/revert: no comment hits).
The three extra exit-2 cases, judged: the --write OSError exit 2 and the whole-file read-back sit under item 4 ("a write that does not take is an error") and change-standard rule 16; the CRLF normalisation of shared-rules.md keeps the behaviour universal-newline reading gave before, which the shared read() with newline="" would otherwise break. None is beyond the brief.
ps -p 72228 -o pid,stat,lstart,comm: "72228 UE Fri Sep 25 18:53:59 2026 /var/folders/.../T//pgt.OKIttV/git" (the builder's probe process, still present; not touched). While it lives, pgrep -x git finds a git process on this machine.
ps -ax after my runs: no process of mine left (grep refute9|land-test prints nothing).
```

## 1. Spec

1. skills/repo-setup/templates/sync_rules.py:79-80, `eol = "\r\n" if first_newline > 0 and text[first_newline - 1] == "\r" else "\n"`. Brief item 2 says the block is written "with the file's own line ending (CRLF when the file uses CRLF)". The line ending of the first line decides it. Rerun: a CLAUDE.md whose first line ends in LF and whose other 54 lines end in CRLF gave "CR before: 54", `--write` exit 0, "CR after: 30". The block went in as LF in a file that uses CRLF on every line but the first. Taking the majority ending, or refusing a mixed file, would meet the brief. The report states this as judgment call 4 and does not flag it as a departure from the brief.

## 2. Proof

1. 9-report.md, "Files changed": the report gives `skills/land/templates/land.sh` 495 lines and `skills/land/templates/land.test.sh` 528. `wc -l` in the worktree prints 496 and 529. The other five counts reproduce.

## 3. Standards

1. skills/repo-setup/SKILL.md:74-81 (outside the step's path list): "4. Exit 2 (no block, or `AGENTS.md` not a symlink to `CLAUDE.md`): draft the change." and "7. Exit 2: run the check again, until it exits 0." The diff makes both sentences false (change-standard rule 14). Exit 2 now also covers four other causes: a `CLAUDE.md` or `shared-rules.md` that is missing or not UTF-8, a `--write` that cannot write, and a write that does not read back. For those, drafting a block and re-running until exit 0 is the wrong action; on a non-UTF-8 file the re-run never reaches exit 0. The Stops row "The drafted sync change | `sync` exits 2" in the same file has the same defect. The builder names this (report, "Wrong or out of reach" 1). It is still a false sentence the change creates, and it has to be fixed before or at landing: widen the path list, or fix it at landing.
2. skills/land/SKILL.md:49 adds a new stop ("At the bound the landing stops before main is touched, with a message that names the lock, and the ledger's landing script exits 1"), but the Stops table (skills/land/SKILL.md, "## Stops") has no row for it: no "What it shows" and no "What resumes it". This breaks docs/dev/skill-layout.md, Sections row 7 (Stops: "A table with the columns Stop, When, What it shows and What resumes it") and "A rule is written once. Another place that needs it names the section it is in". Every other stop and refusal of Steps 1-6 points at "Stops".

## 4. Behaviour

1. skills/land/templates/land.sh:162-163, `fail "index lock failed: $landing_lock still held after $landing_waited s of waiting; \ remove it once no git command uses it, then land again"`. The message tells the user to land again, but after a stop at the waits at land.sh:227, :230 or :250 the worktree has already been switched to `<pkg>-land` (land.sh:228), and running the landing again fails. Reproduced on a copy of land.test.sh under $TMPDIR, with a fresh lock placed on main's `.git/index.lock` once `locked-land` exists and `LANDING_LOCK_WAIT=2`:
   ```
   FIRST RUN exit 1:
   ...
   Switched to a new branch 'locked-land'
   index lock: waiting for <t>/locked/.git/index.lock
   index lock failed: <t>/locked/.git/index.lock still held after 2 s of waiting; remove it once no git command uses it, then land again
   BRANCH: locked-land
   RERUN exit 1:
   preflight failed: package worktree is on locked-land, expected locked
   ```
   The text is new in this diff. The message and skills/land/SKILL.md Steps 3 should state the state that is left and what resumes it, or the rerun should work. The report says this was "read from the code and was not run" and puts the rerun out of scope. The message it added is still false for three of the six waits.
2. The report's "User-visible changes" list does not give the mixed line-ending behaviour of `--write` (Spec 1) with a before and after. Before: the whole file became LF. Now: every byte outside the block is kept, and the block takes the first line's ending, so a file that is CRLF except for its first line gets an LF block.

## Not checked

- The default 60 s bound end to end (reproduction E with no LANDING_LOCK_WAIT). Only the 2 s case was rerun, through the test.
- The Codex assistant-message count against a real `~/.codex/sessions` rollout. Reading one was denied by the permission classifier, so the check that real rollouts write assistant replies as `response_item`/`message`/`assistant` rests on the fixture alone.
- The `ps` fallback of `git_process_alive` (no `pgrep`). It is not exercised, as the report says.
- The builder's reverts L3, L4, L5, L6, L8, U2, U4-U7, E2, and the sync_rules reverts end-count, keep-after, template-crlf-normalise, block-crlf-normalise, no-write-catch and diff-on-stderr. I reran equivalents for items 1, 2, 3, 4, 5, 6, 7, 8 and 9 only.

Reviewer usage: not known.

## Repair round 1, refuted

### Verification

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch>/home PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
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
verify: 12 commands passed
exit 0

$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests

$ sh skills/land/templates/land.test.sh   (exit 0, whole output)
clean: exit 0, staged paths, usage rows and the orchestrator row verified
conflict: exit 2, conflicting path and retained landing branch verified, landing again refused
committed: nothing pending, no wip commit made, exit 0
locked: a lock held while git runs stops the landing at the bound, exit 1, main untouched
stale: a stale lock with no git process running removed, exit 0
released: a lock gone before the bound waited for, exit 0
resumed: a lock stop after the checkout, then landing again lands, exit 0
handmade: a change made by hand on the landing branch refused, the branch kept
bad bound: LANDING_LOCK_WAIT=2s refused with exit 64
adapted: tools/demo landed, the file outside it left unstaged
usage: Claude Code and Codex rows verified, one message per id, the window across offsets
usage: a window time without an offset or unreadable refused, exit 64, both arguments
examples: skipped outside an Ordo checkout, a missing example fails inside one
examples: plan.yaml and plan.projects.yaml match the state template, every key marked
PASS: land.sh and usage.py scratch tests

$ python3 -B utils/check_skill_layout.py
(the ten ok: lines above, skills/land/SKILL.md and skills/repo-setup/SKILL.md among them), exit 0

Reverts of this round, each on a copy of skills/{land,repo-setup,plan} under $TMPDIR, the copied test run (python3 -B mut.py):
RED   S1-first-line (line_ending: majority branch disabled) | FAIL: mixed: --write left 30 CRLF lines of 54
RED   S2-tie-lf (a tie always LF)   | FAIL: tie-crlf: a tie wrote the block in lf, expected crlf as the first line
RED   S3-tie-crlf (a tie always CRLF) | FAIL: tie-lf: a tie wrote the block in crlf, expected lf as the first line
RED   R1-refuse-land (the <pkg>-land branch of the preflight removed) | FAIL: conflict landing again: missing [preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand]
RED   R2-no-cherry-pick-check | FAIL: conflict landing again: missing [preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand]
RED   R3-no-dirty-check  | FAIL: handmade: dirty rerun exit 0, expected 1: resume: the worktree is back on handmade, handmade-land removed
RED   R4-no-foreign-check | FAIL: handmade: rerun exit 0, expected 1: resume: the worktree is back on handmade, handmade-land removed
RED   R5-left-not-updated (landing_left not set after the checkout) | FAIL: resumed state: missing [main is untouched; the worktree is on resumed-land]

wc -l on the final files: sync_rules.py 127, sync_rules.test.sh 282, land.sh 537, usage.py 170, land.test.sh 599, skills/land/SKILL.md 130, skills/repo-setup/SKILL.md 152, README.md 175; all equal the report's round-1 table (ruling 2).
git diff 27aef76 --stat: README.md, skills/land/SKILL.md, land.sh, land.test.sh, skills/repo-setup/SKILL.md, sync_rules.py, sync_rules.test.sh, 9-report.md; usage.py unchanged. git diff -U0 27aef76 -- README.md: hunks @@ -117 and @@ -120 only.
Ruling 3: every error line that skills/repo-setup/SKILL.md sync 4 and 7 name matches a print in sync_rules.py (lines 47, 49, 78, 81, 88, 105, 111); Stops rows keep the four columns; "The first seven rows are stops" counts 7 rows before "Tracked files".
LC_ALL=C grep -n '[^ -~]' over the six changed skill/code files: exit 1, nothing. Added lines grepped for previous|no longer|used to|round|revert|audit|step N|formerly: no comment hits.
grep of sync_rules / exit 2 / -land / LANDING_LOCK_WAIT / preflight across README.md, docs/, skills/: no other sentence made false (README:80, docs/roadmap.md:86, change-standard.md:45, building.md:9, spec/SKILL.md:43-99, plan-orchestration/SKILL.md:105 read).
Deleting <pkg>-land, judged: the three checks (CHERRY_PICK_HEAD, tracked changes, git cherry "+") leave only commits patch-equal to <pkg>'s; untracked files survive the checkout. No case found where the deletion loses work.
ps after my runs: no process of mine left (grep refute9r1|land-test|sync-rules prints nothing); 72228 untouched.
```

### Spec

none

### Proof

none

### Standards

1. skills/land/SKILL.md:105, `| A lock held | ... | The lock's path, and what the stop leaves: main untouched, the worktree on `<step>` or, after its checkout, on `<step>-land`; ... | The lock removed once no git command uses it, then `/land` again, which returns the worktree to `<step>`, deletes `<step>-land` and lands from the start |`. The skill's own Steps never create `<step>-land`: Steps 3 commits in the worktree and Steps 4 runs `git cherry-pick -n <base>..<step>` on main directly. Only the ledger's landing script (`templates/land.sh`) checks out `<pkg>-land`, and only it removes that branch on a rerun. The row says `/land` does both, which is false for a landing run by the Steps without the script (change-standard: a sentence the diff makes false). The row should say which of these belongs to the ledger's landing script.
2. skills/land/templates/land.sh:243-244, `fail "preflight failed: package worktree is on $landing_worktree_branch, expected $landing_pkg"` followed by `landing_left=$landing_pkg`. `fail` exits, so line 244 never runs. It is dead code that the round added.

### Behaviour

1. skills/land/templates/land.sh:212-241 (the new `<pkg>-land` branch of the preflight) and its head comment at lines 15-21, `Every stop at a lock leaves main untouched. A stop after the worktree's checkout leaves the worktree on <pkg>-land, and landing again resumes`. The resume is not limited to lock stops, and it does not check main. Any earlier run that left `<pkg>-land` clean passes the three checks, including a stop at a failed check (land.sh:308 and the run_step checks after it) and a finished landing (exit 0) before its booking commit. In both cases main still holds the first run's staged `cherry-pick -n`. The rerun deletes `<pkg>-land`, rebuilds it and cherry-picks onto that main again. Before this round the preflight refused both. Reproduced on a scratch repository under $TMPDIR. The copied land.sh's `npm test` fails while a flag file exists. The first run exits 1, `npm test -- --reporter=dot failed`, with the worktree on fc-land and main staged `tools/oculus/committed.txt`. With the flag removed:
   ```
   27aef76 land.sh:  RERUN exit 1  preflight failed: package worktree is on fc-land, expected fc
   this round:       RERUN exit 0  resume: the worktree is back on fc, fc-land removed ... (landed onto the already-staged main)
   same, with a landing fix staged on main (committed.txt rewritten and git add-ed) before the rerun:
                     RERUN exit 1  resume: the worktree is back on fc, fc-land removed
                                   CONFLICT (add/add): Merge conflict in tools/oculus/committed.txt
                                   main git cherry-pick failed
                     git status --short on main: AA tools/oculus/committed.txt (conflict markers in the working file; the fix kept only as index stage 2)
   ```
   The worktree side loses nothing. On main, a rerun after a non-lock stop now writes a conflict into a main the orchestrator had fixed, where the old preflight refused before touching anything. None of this is stated. The head comment, the Stops row and the report's user-visible change describe the resume as the answer to a lock stop, with "main untouched". Before resuming, the preflight should refuse when main holds staged or unmerged changes (`git diff --cached --quiet` on the root). The alternative is to state and test the rerun after a failed check.

### Not checked

- The resume after a stop at the worktree's own `index.lock` after the checkout (the wait at land.sh:271). This is the case the head comment gives as the reason for resuming on the next run. The "resumed" case stops at main's lock (land.sh:291). I reasoned through the worktree-lock path but did not run it.
- The builder's "Red on the tree as it was at the round's start" runs. The R1 revert above covers the same ground.
- The default 60 s bound end to end. It is unchanged in this round.

Reviewer usage: 130,235 tokens, 28 tool uses, 540 s (the runner's completion notification).

## Closed

- Spec 1 (the block took the first line's ending in a mixed file): closed in the round, `line_ending()` in `skills/repo-setup/templates/sync_rules.py` takes the ending most lines use, the first line's on a tie; the cases "mixed", "tie-crlf" and "tie-lf" of `sync_rules.test.sh`, red under the reverts S1, S2 and S3 of the round's review.
- Proof 1 (line counts of `land.sh` and `land.test.sh`): closed in the round, the report's round table equals `wc -l` on the final files (the round's review, Verification).
- Standards 1 (`skills/repo-setup/SKILL.md` sync steps and Stops false for the new exit-2 causes): closed in the round, sync 4 and 7 split the drafted causes from the files to fix by the `error:` line, the Stops rows "The drafted sync change" and "A file sync cannot use"; the round's review matched each named line to a print in `sync_rules.py`.
- Standards 2 (no Stops row for the lock bound): closed in the round, the Stops row "A lock held" in `skills/land/SKILL.md`, and Steps 3 names "Stops".
- Behaviour 1 (the lock-stop message told the user to land again, which failed): closed in the round, the preflight of `land.sh` resumes from `<pkg>-land`; the cases "resumed" and "handmade" of `land.test.sh`, red under the reverts R1 to R5 of the round's review.
- Behaviour 2 (the mixed-file `--write` not stated with before and after): closed in the round, the report's "User-visible changes".
- Round 1, Standards 1 (the Stops row said `/land` creates and removes `<step>-land`, which only the ledger's landing script does): fixed at landing, `skills/land/SKILL.md` Stops row "A lock held" names the ledger's landing script for the branch, its exit, and the resume on a main with nothing staged.
- Round 1, Standards 2 (dead `landing_left=$landing_pkg` after `fail`): fixed at landing, the line removed from `skills/land/templates/land.sh`.
- Round 1, Behaviour 1 (the resume ran onto a main holding a failed or finished run's staged cherry-pick): fixed at landing, the preflight of `land.sh` refuses the resume while `git diff --cached --quiet` on main exits 1, keeping `<pkg>-land`, and the head comment says so; the new case "staged main" of `land.test.sh` (a lock stop after the checkout, a file staged on main, a rerun refused with both trees kept) prints `FAIL: staged-main refusal: missing [preflight failed: main holds staged or unmerged changes, so staged-main-land is kept]` with the check replaced by `if false`; `README.md` and the test's head comment name the case.
