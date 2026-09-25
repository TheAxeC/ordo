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
