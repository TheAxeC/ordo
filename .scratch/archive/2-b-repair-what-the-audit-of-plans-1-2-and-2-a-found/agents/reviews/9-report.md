# Step 9 report: sync_rules.py, land.sh and usage.py

Everything in the brief and in repair round 1 is done.

## Open items of the state file, verbatim

- none.

## DONE / NOT DONE

| # | Item | State | Proof |
|---|---|---|---|
| 1 | `sync_rules.py`: exit 2 with an `error:` line on what it cannot read | DONE | Cases "no CLAUDE.md", "CLAUDE.md not UTF-8", "no shared-rules.md", "shared-rules.md not UTF-8" in `sync_rules.test.sh`; reproduction A below |
| 2 | `--write` keeps every byte outside the block and the file's line ending | DONE | Cases "drift" (preamble with a tab, trailing spaces and a UTF-8 letter, `cmp` of the bytes outside the block) and "crlf"; reproduction B below |
| 3 | `error:` lines on stderr; `ok:`, `written:` and the diff on stdout | DONE | `expect_refusal` asserts stdout empty and one `error:` line on stderr for every refusal; the drift case asserts stderr empty and the diff on stdout |
| 4 | Tests for each case, each red under its revert, the five planted faults included | DONE | 17 planted faults, all RED (below) |
| 5 | Wip commit only when something is staged, with a test | DONE | Case "committed" in `land.test.sh`; reproduction C below |
| 6 | The example check fails inside an Ordo checkout, skips only outside one, tested both ways | DONE | `check_examples` cases; reproduction D below |
| 7 | Bounded lock wait, stale removal kept, test with a stand-in `git` process and `LANDING_LOCK_WAIT` | DONE | Cases "locked", "stale", "released", "bad bound"; reproduction E below (default bound, 60 s) |
| 8 | Codex count from assistant messages, tokens from `token_count` | DONE | Codex fixture: 3 assistant messages and 2 `token_count` events in the window; fault U1 red |
| 9 | A window time without an offset or unreadable refused, exit 64; log lines without an offset skipped | DONE | Four window cases (both arguments, both reasons); naive lines in both fixtures; reproduction F below |
| 10 | Texts: `skills/land/SKILL.md` Steps 3, `README.md` lines 117 and 120, head comments and docstrings | DONE | `diff` against main shows only lines 117 and 120 of README.md changed by this step (line 126 differs by step 8's landing on main); `python3 -B utils/check_skill_layout.py` prints `ok: skills/land/SKILL.md` |
| 11 | Paths written: only the seven named, `skills/repo-setup/SKILL.md` (added by repair round 1) and this report | DONE | `diff -rq -x .git -x .agents -x .scratch -x .claude . .agents/worktrees/2b-9` from the main checkout lists the seven paths, plus `docs/academic-coverage.md`, `utils/check_coverage.py` and `utils/check_coverage.test.sh`, which this step did not write (main moved past the base; not verified with git, which the brief bars) |
| 12 | ASCII only, no `__pycache__` | DONE | `LC_ALL=C grep -n '[^ -~]'` over the seven files prints nothing; `find . -name __pycache__` prints nothing; the verify list's ASCII command passed |

### Verify list

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, run from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch> PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13` (PyYAML is in the user site under the real home), and also run plainly, both with this output:

```
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
```

### The two test commands

`sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`:

```
PASS: sync_rules.py scratch tests
```

`sh skills/land/templates/land.test.sh 2>&1 | tail -3` (the examples line of a checked run):

```
examples: skipped outside an Ordo checkout, a missing example fails inside one
examples: plan.yaml and plan.projects.yaml match the state template, every key marked
PASS: land.sh and usage.py scratch tests
```

The whole progress output of `land.test.sh`:

```
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
```

### The review's reproductions, rerun

A. A `CLAUDE.md` that is not UTF-8 (`printf 'a\n<!-- ordo:shared-rules begin -->\n\377\n<!-- ordo:shared-rules end -->\n'`, `AGENTS.md` linked):

```
error: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/repro9.Nv8OZI/a/CLAUDE.md is not UTF-8 (byte 35)
exit 2
```

B. A CRLF `CLAUDE.md` with a drifted block, then `--write` (`grep -c` of carriage returns before and after):

```
CRs before: 55
check exit 1
written: the shared-rules block now equals the template
write exit 0
CRs after: 55
```

C. The landing with nothing pending: a copy of `land.test.sh` with the `pending.txt` line of the clean case removed. The landing exits 0; the only failure is the copy's own staged-path assertion, which expects `pending.txt`:

```
130d129
< printf 'pending\n' >"$clean_repo/.agents/worktrees/clean/$tool_path/pending.txt"
FAIL: clean staged paths differ: [tools/oculus/committed.txt]
```

D. `land.test.sh` copied with its templates to a scratch folder outside any repository (`tail -3`), then run in place (`tail -3`, quoted under "The two test commands"):

```
examples: skipped outside an Ordo checkout, a missing example fails inside one
examples: not in an Ordo checkout (no git repository around /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/repro9.j26uMz/t holds skills/plan/templates/), not checked
PASS: land.sh and usage.py scratch tests
```

E. A lock held (mtime 2020) while a `git` process runs (`git hash-object --stdin` reading a FIFO), `land.sh` with the default bound:

```
git
index lock: waiting for /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/repro9.nUf6v9/repo/.git/worktrees/pkg/index.lock
index lock failed: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/repro9.nUf6v9/repo/.git/worktrees/pkg/index.lock still held after 60 s of waiting; remove it once no git command uses it, then land again
exit 1 after 64 s
```

F. `usage.py <log> 2026-09-24T19:00:00 2026-09-24T20:00:00+02:00`:

```
usage.py: the from time 2026-09-24T19:00:00 has no offset; give an ISO time with an offset, such as 2026-09-24T19:00:00+02:00
usage exit 64
```

### Red on the tree as it was

Each test was written first and run against the unchanged script:

- `sync_rules.test.sh` on the old `sync_rules.py`: `FAIL: --write left 0 CRLF lines of 55`.
- `land.test.sh` on the old `usage.py` (the log line without an offset): `TypeError: can't compare offset-naive and offset-aware datetimes` then `FAIL: usage.py failed on the Claude Code log`.
- `land.test.sh` on the old `land.sh`: `nothing to commit, working tree clean`, `worktree git commit failed`, `FAIL: a landing with nothing pending exited 1, expected 0`.

### Each case red under its revert

Each fault below was planted in a copy of the `skills/` tree by a scratch driver, which ran the copied test and printed its last `FAIL:` line (paths shortened to `<copy>` and `<scratch>`).

`sync_rules.py` under `sync_rules.test.sh`. The review's five planted faults are `reversed-check`, `begin-count`, `reread`, `no-claude-branch` and `keep-before`:

```
RED      reversed-check | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/reversed: exit 1, expected 2: [--- CLAUDE.md (shared rules)
RED      begin-count | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/two-begins: exit 1, expected 2: [--- CLAUDE.md (shared rules)
RED      end-count | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/two-ends: exit 0, expected 2: [ok: the shared-rules block equals the template] []
RED      reread | FAIL: python3 -B <scratch>/lost-write.py <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/lost-write --write: exit 0, expected 2: [written:
RED      no-claude-branch | FAIL: no CLAUDE.md: stderr is not [error: ...no CLAUDE.md in <scratch>/no-claude...]: [error: cannot read <scratch>/no-claude/CLAUDE.md: No such file or directory]
RED      keep-before | FAIL: --write changed bytes outside the block
RED      keep-after | FAIL: --write changed bytes outside the block
RED      universal-newlines | FAIL: --write left 0 CRLF lines of 55
RED      eol-always-lf | FAIL: --write left 31 CRLF lines of 55
RED      block-crlf-normalise | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/same-crlf: exit 1, expected 0: [--- CLAUDE.md (shared rules)
RED      template-crlf-normalise | FAIL: python3 -B <scratch>/no-template/sync_rules.py <scratch>/same: exit 1, expected 0: [] []
RED      errors-on-stdout | FAIL: CLAUDE.md not UTF-8: stdout is not empty: [error: <scratch>/not-utf8/CLAUDE.md is not UTF-8 (byte 35)]
RED      block-error-stdout | FAIL: no block: stdout is not empty: [error: CLAUDE.md has no single shared-rules block (<!-- ordo:shared-rules begin --> ... <!-- ordo:shared-rules end -->)]
RED      no-utf8-catch | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/not-utf8: exit 1, expected 2: [] [Traceback (most recent call last):
RED      no-read-oserror-catch | FAIL: python3 -B <scratch>/no-template/sync_rules.py <scratch>/same: exit 1, expected 2: [] [Traceback (most recent call last):
RED      no-write-catch | FAIL: python3 -B <copy>/skills/repo-setup/templates/sync_rules.py <scratch>/read-only --write: exit 1, expected 2: [] [Traceback (most recent call last):
RED      diff-on-stderr | FAIL: a drifted block printed on stderr: [--- CLAUDE.md (shared rules)
```

The reverts: `reversed-check` drops `or text.index(BEGIN) > text.index(END)`; `begin-count` and `end-count` drop one marker count; `reread` makes the read-back comparison `if False:`; `no-claude-branch` deletes the `os.path.isfile(claude)` branch; `keep-before` and `keep-after` alter the text before or after the block on `--write`; `universal-newlines` reads without `newline=""`; `eol-always-lf` writes the block with LF; `block-crlf-normalise` and `template-crlf-normalise` drop the CRLF-to-LF comparison of the block or the template; `errors-on-stdout` and `block-error-stdout` print an `error:` line to stdout; `no-utf8-catch`, `no-read-oserror-catch` and `no-write-catch` drop a handler; `diff-on-stderr` prints the diff to stderr.

`land.sh` under `land.test.sh`:

```
RED      L1-commit-always | FAIL: a landing with nothing pending exited 1, expected 0
RED      L2-no-bound | FAIL: locked: the lock wait did not stop at its bound
RED      L3-no-stale-removal | FAIL: stale: exit 1, expected 0: index lock: waiting for <scratch>/stale/.git/worktrees/stale/index.lock
RED      L4-removal-ignores-git | FAIL: locked: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made
RED      L5-bound-at-once | FAIL: locked message: missing [index lock failed: <scratch>/locked/.git/worktrees/locked/index.lock still held after 2 s of waiting]
RED      L6-env-ignored | FAIL: locked: the lock wait did not stop at its bound
RED      L7-no-validation | FAIL: bad bound: exit 0, expected 64: worktree git commit: nothing staged, no wip commit made
RED      L8-empty-refused | FAIL: a landing with nothing pending exited 64, expected 0
```

The reverts: L1 makes the wip commit whatever is staged (the old line 191); L2 removes the bound (the old loop); L3 removes the stale-lock removal; L4 removes a stale lock even while `git` runs; L5 stops at once; L6 ignores `LANDING_LOCK_WAIT`; L7 drops its validation; L8 refuses an empty value.

`usage.py` under `land.test.sh`:

```
RED      U1-count-token-events | FAIL: Codex usage row differs: [2 messages, 60 output tokens, 20 cache-write tokens, 250 cache-read tokens, 230 fresh input tokens, 60 minutes]
RED      U2-any-role | FAIL: Codex usage row differs: [4 messages, 60 output tokens, 20 cache-write tokens, 250 cache-read tokens, 230 fresh input tokens, 60 minutes]
RED      U3-naive-accepted | FAIL: usage.py failed on the Claude Code log
RED      U4-no-offset-unhandled | FAIL: usage.py 2026-09-24T19:00:00 2026-09-24T20:00:00+02:00: message differs: [usage.py: the from time 2026-09-24T19:00:00 cannot be read; give an ISO time with an offset, such as 2026-09-24T19:00:00+02:00]
RED      U5-unreadable-unhandled | FAIL: usage.py yesterday 2026-09-24T20:00:00+02:00 exited 1, expected 64: Traceback (most recent call last):
RED      U6-exit-1 | FAIL: usage.py 2026-09-24T19:00:00 2026-09-24T20:00:00+02:00 exited 1, expected 64: usage.py: the from time 2026-09-24T19:00:00 has no offset; give an ISO time with an offset, such as 2026-09-24T19:00:00+02:00
RED      U7-message-to-stdout | FAIL: usage.py 2026-09-24T19:00:00 2026-09-24T20:00:00+02:00: message differs: []
```

The reverts: U1 counts `token_count` events again (the old count); U2 counts a message of any role; U3 accepts a time without an offset (the old `moment()`); U4 and U5 drop the handler for a time without an offset or unreadable; U6 exits 1; U7 prints the refusal to stdout.

The example check in `land.test.sh`:

```
RED      E1-skip-when-missing | FAIL: examples in an Ordo checkout without its examples exited 0, expected 1
RED      E2-never-skip | FAIL: examples outside a repository exited non-zero
```

E1 skips when an example is missing (the old guard); E2 never skips.

What the tests do not cover: the stale-lock case controls `git_process_alive` through a stub `pgrep` on `PATH` that exits 1, since a real machine can run other `git` processes at any time; the `ps` fallback of `git_process_alive` (no `pgrep` installed) is not exercised.

## Files changed

`wc -l` in the worktree, on the files as they stand after repair round 1:

| File | Lines |
|---|---|
| `skills/repo-setup/templates/sync_rules.py` | 127 |
| `skills/repo-setup/templates/sync_rules.test.sh` | 282 |
| `skills/land/templates/land.sh` | 537 |
| `skills/land/templates/usage.py` | 170 |
| `skills/land/templates/land.test.sh` | 599 |
| `skills/land/SKILL.md` | 130 |
| `skills/repo-setup/SKILL.md` (added to the path list by repair round 1) | 152 |
| `README.md` (lines 117 and 120) | 175 |

## Judgment calls

1. **The environment variable's name and rules.** `LANDING_LOCK_WAIT`, in whole seconds. Unset or empty keeps the 60 s bound; any other value that is not a whole number is refused with exit 64 before anything is touched. The head comment of `land.sh` names it.
2. **What "60 s of waiting" counts.** The bound counts one-second sleeps, so the wall time is the bound plus the time of the `node` age checks: 64 s for the default bound in reproduction E.
3. **The stand-in `git` process.** A copy of a binary named `git` did not run under this sandbox, and a shell script named `git` shows as `sh` to `pgrep`. The test therefore runs a real `git hash-object --stdin` reading a FIFO the test holds open. The test asserts that the process is named `git`, and it ends when the test closes the FIFO.
4. **The file's own line ending.** Ruled in repair round 1: `--write` writes the block in the ending most of the file's lines use, and the first line's ending on a tie.
5. **Beyond the brief's list, inside the same files.** `--write` on a `CLAUDE.md` it cannot open is an `error:` line and exit 2, not a traceback. A CRLF `shared-rules.md` compares equal to an LF block. The read-back after writing compares the whole file with what was written, not only the block. Each has a test that its revert turns red.
6. **The Codex row with no `token_count` event in the window.** It prints the assistant-message count with zero tokens; before, it printed zeros throughout.
7. **Where the example check looks.** Inside an Ordo checkout it reads `skills/plan/templates/` at the top of the git repository around the test (`git -C <dir> rev-parse --show-toplevel`), not `../..` from the test. A copy in an Ordo ledger folder is therefore checked too.
8. **The skill's version.** `metadata.version` of the land skill is left at 1.6.0. Nothing in the brief or the change standard asks for a bump.

## User-visible changes

- `sync_rules.py` on a `CLAUDE.md` that is not UTF-8. Before, it printed a traceback and exited 1, which the sync steps read as "block differs". Now it prints `error: <path> is not UTF-8 (byte <n>)` on stderr and exits 2. A missing or non-UTF-8 `shared-rules.md` is also refused this way.
- `sync_rules.py --write` on a CRLF file. Before, every line of the file became LF. Now every byte outside the block is kept and the block is written in CRLF.
- `sync_rules.py --write` on a mixed file, LF on its first line and CRLF on the other 54. Before, every line became LF (0 CRs after). Now the block takes the ending most lines use: 54 CRs before and 54 after, the first line the only one without CR (the run is quoted under Repair round 1, ruling 6).
- `sync_rules.py` error lines. Before, they went to stdout. Now they go to stderr.
- `land.sh` when the builder committed everything. Before, it failed with `worktree git commit failed`, exit 1. Now it prints `worktree git commit: nothing staged, no wip commit made` and goes on.
- `land.sh` with a lock held while any `git` process runs. Before, it waited with no bound. Now it stops after 60 s with exit 1 and `index lock failed: <lock> still held after 60 s of waiting; main is untouched; the worktree is on <pkg>. Remove the lock once no git command uses it, then land again to resume.` After the worktree's checkout the message says `the worktree is on <pkg>-land, which landing again removes before it starts over`. `LANDING_LOCK_WAIT` shortens or lengthens the bound.
- `land.sh` run again with the worktree on `<pkg>-land`. Before, it refused (`preflight failed: package worktree is on <pkg>-land, expected <pkg>`). Now it returns the worktree to `<pkg>`, deletes `<pkg>-land`, prints `resume: the worktree is back on <pkg>, <pkg>-land removed` and lands. It refuses, keeping the branch, when a cherry-pick is in progress there, when it has changes not committed, or when it holds a commit that is not a cherry-pick of the package's.
- `usage.py` on a Codex rollout. Before, `<n> messages` counted `token_count` events. Now it counts assistant messages.
- `usage.py` with a window time that has no offset or cannot be read. Before, it printed a traceback and exited 1. Now it prints `usage.py: the <from|to> time <text> has no offset` (or `cannot be read`), with a hint, and exits 64.
- `land.test.sh` run inside an Ordo checkout that lacks an example file. Before, it skipped the check and passed. Now it fails, naming the missing file. The skip line now names the folder it judged from.

## Wrong or out of reach in the brief, with evidence

1. A process from a probe of this step is still on the machine: pid 72228, state `UE`, command `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//pgt.OKIttV/git` (a copy of `/bin/sleep`, started Fri Sep 25 18:53:59 2026). `ps -p 72228 -o pid,stat` still prints `72228 UE` at the end of repair round 1, and `kill -9` does not end it. While it lives, `pgrep -x git` finds a `git` process, so a real `land.sh` never removes a stale lock and waits out the bound instead. A reboot clears it. The tests do not depend on it. No process started in repair round 1 is left: `ps -ax -o pid,stat,command | grep -E 'land-test|sync-rules-test|repro9|r1b|hash-object'` prints nothing.

## Repair round 1

The rulings of the orchestrator on `agents/reviews/9-refuter.md`, and what closes each.

| # | Finding and ruling | State | What closes it |
|---|---|---|---|
| 1 | Spec 1: the block takes the ending most lines use; a tie takes the first line's | DONE | `line_ending()` in `sync_rules.py`; the docstring states the rule; cases "mixed" (first line LF, 54 lines CRLF), "tie-crlf" and "tie-lf" in `sync_rules.test.sh` |
| 2 | Proof 1: the report gives the counts `wc -l` prints on the final files | DONE | "Files changed" above, from the `wc -l` run below |
| 3 | Standards 1: the sync steps and Stops tell the drafted exit-2 causes from the others by the `error:` line; the docstring states the lines | DONE | `sync_rules.py` docstring lists every exit-2 line in two groups; `skills/repo-setup/SKILL.md` Steps / sync 4 (the two drafted lines), 7 (the other lines: draft nothing, the file named is fixed first), 8 (run again), 9 (commit), the Stops rows "The drafted sync change" and "A file sync cannot use", the note "The first seven rows are stops"; the layout check prints `ok: skills/repo-setup/SKILL.md` |
| 4 | Standards 2: a Stops row for the lock bound, and Steps 3 names "Stops" | DONE | `skills/land/SKILL.md` Steps 3 ends "at the bound the landing stops ("Stops")"; Stops row "A lock held" with When, What it shows and What resumes it; the notes under the table name it a stop that leaves no open item |
| 5 | Behaviour 1: a rerun after a lock stop lands | DONE | The preflight of `land.sh` recognises `<pkg>-land` and resumes; the head comment says why this option (the held lock may be the worktree's own, which blocks the checkout that would undo the branch at the stop). Cases "resumed", "handmade" and the conflict rerun in `land.test.sh` |
| 6 | Behaviour 2: `--write` on a mixed file, before and after | DONE | "User-visible changes" above, and the run below |

### The resume choice

The option taken is the second of the ruling: the preflight recognises its own `<pkg>-land` branch. Returning the worktree at the stop was not taken because a stop can come at the worktree's own `index.lock` (the waits before the worktree's cherry-pick), where the `git checkout` that would undo the branch cannot run. On the rerun, once the lock is gone, the preflight checks three things before it deletes `<pkg>-land`:

- no cherry-pick is in progress (`CHERRY_PICK_HEAD`);
- no change is left uncommitted (`git status --porcelain --untracked-files=no`);
- `git cherry <pkg> <pkg>-land main` marks no commit `+`, meaning every commit on the branch is a cherry-pick of the package's own.

Any of these left refuses with the branch kept. The conflict exit keeps its behaviour: the orchestrator resolves the conflict by hand.

### Checks

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=<scratch> PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13`:

```
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
```

`sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`:

```
PASS: sync_rules.py scratch tests
```

`sh skills/land/templates/land.test.sh` (whole output):

```
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
```

`python3 -B utils/check_skill_layout.py` printed the ten `ok:` lines above, `skills/land/SKILL.md` and `skills/repo-setup/SKILL.md` among them, and exited 0.

Ruling 6: `sync_rules.py --write` on a file whose first line ends in LF and whose other 54 lines end in CRLF:

```
lines       55, CR before 54
written: the shared-rules block now equals the template
CR after 54, lines without CR 1
```

### Red on the tree as it was at the round's start

- `sync_rules.test.sh` with the "mixed" case added: `FAIL: mixed: --write left 30 CRLF lines of 54`.
- `land.test.sh` with the conflict rerun added: `FAIL: conflict landing again: missing [preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand]`.

### Each new case red under its revert

Planted in a copy of `skills/` by the same scratch driver, the copied test run:

```
RED      S1-first-line-rule | FAIL: mixed: --write left 30 CRLF lines of 54
RED      S2-tie-takes-lf | FAIL: tie-crlf: a tie wrote the block in lf, expected crlf as the first line
RED      S3-tie-takes-crlf | FAIL: tie-lf: a tie wrote the block in crlf, expected lf as the first line
RED      R1-landing-branch-refused | FAIL: conflict landing again: missing [preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand]
RED      R2-no-cherry-pick-check | FAIL: conflict landing again: missing [preflight failed: a cherry-pick is in progress on conflict-land; resolve or abort it by hand]
RED      R3-no-dirty-check | FAIL: handmade: dirty rerun exit 0, expected 1: resume: the worktree is back on handmade, handmade-land removed
RED      R4-no-foreign-check | FAIL: handmade: rerun exit 0, expected 1: resume: the worktree is back on handmade, handmade-land removed
RED      R5-state-not-updated | FAIL: resumed state: missing [main is untouched; the worktree is on resumed-land]
```

The reverts:
- S1 takes the first line's ending always, the rule before this round.
- S2 and S3 give a tie to LF or to CRLF whatever the first line.
- R1 refuses `<pkg>-land` as the preflight did before this round.
- R2, R3 and R4 drop one of the three checks before the branch is deleted.
- R5 leaves the stop message saying the worktree is on `<pkg>` after its checkout.

R1 on its own reaches the conflict rerun first. To show the "resumed" case red under R1, the same revert was run with the conflict rerun block taken out of the copied test:

```
FAIL: resumed: second run exit 1, expected 0: preflight failed: package worktree is on resumed-land, expected resumed
```

### Files changed in the round, with line counts

`wc -l` on the final files:

```
     127 skills/repo-setup/templates/sync_rules.py
     282 skills/repo-setup/templates/sync_rules.test.sh
     537 skills/land/templates/land.sh
     170 skills/land/templates/usage.py
     599 skills/land/templates/land.test.sh
     130 skills/land/SKILL.md
     152 skills/repo-setup/SKILL.md
     175 README.md
```

`usage.py` is unchanged in this round. `README.md` changed on lines 117 and 120 only: the resume and hand-change cases, and the line-ending rule. `LC_ALL=C grep -n '[^ -~]'` over the changed files prints nothing, and `find . -name __pycache__` prints nothing.
