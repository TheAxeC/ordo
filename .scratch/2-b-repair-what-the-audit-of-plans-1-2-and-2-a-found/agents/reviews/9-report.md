# Step 9 report: sync_rules.py, land.sh and usage.py

Everything in the brief is done.

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
| 11 | Paths written: only the seven named and this report | DONE | `diff -rq -x .git -x .agents -x .scratch -x .claude . .agents/worktrees/2b-9` from the main checkout lists the seven paths, plus `docs/academic-coverage.md`, `utils/check_coverage.py` and `utils/check_coverage.test.sh`, which this step did not write (main moved past the base; not verified with git, which the brief bars) |
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

`wc -l` in the worktree:

| File | Lines |
|---|---|
| `skills/repo-setup/templates/sync_rules.py` | 106 |
| `skills/repo-setup/templates/sync_rules.test.sh` | 230 |
| `skills/land/templates/land.sh` | 495 |
| `skills/land/templates/usage.py` | 170 |
| `skills/land/templates/land.test.sh` | 528 |
| `skills/land/SKILL.md` | 128 |
| `README.md` (lines 117 and 120) | 175 |

## Judgment calls

1. **The environment variable's name and rules.** `LANDING_LOCK_WAIT`, in whole seconds. Unset or empty keeps the 60 s bound; any other value that is not a whole number is refused with exit 64 before anything is touched. The head comment of `land.sh` names it.
2. **What "60 s of waiting" counts.** The bound counts one-second sleeps, so the wall time is the bound plus the time of the `node` age checks: 64 s for the default bound in reproduction E.
3. **The stand-in `git` process.** A copy of a binary named `git` did not run under this sandbox, and a shell script named `git` shows as `sh` to `pgrep`. The test therefore runs a real `git hash-object --stdin` reading a FIFO the test holds open. The test asserts that the process is named `git`, and it ends when the test closes the FIFO.
4. **The file's own line ending.** `--write` takes the line ending that ends the file's first line. A file with mixed endings gets the block in that one.
5. **Beyond the brief's list, inside the same files.** `--write` on a `CLAUDE.md` it cannot open is an `error:` line and exit 2, not a traceback. A CRLF `shared-rules.md` compares equal to an LF block. The read-back after writing compares the whole file with what was written, not only the block. Each has a test that its revert turns red.
6. **The Codex row with no `token_count` event in the window.** It prints the assistant-message count with zero tokens; before, it printed zeros throughout.
7. **Where the example check looks.** Inside an Ordo checkout it reads `skills/plan/templates/` at the top of the git repository around the test (`git -C <dir> rev-parse --show-toplevel`), not `../..` from the test. A copy in an Ordo ledger folder is therefore checked too.
8. **The skill's version.** `metadata.version` of the land skill is left at 1.6.0. Nothing in the brief or the change standard asks for a bump.

## User-visible changes

- `sync_rules.py` on a `CLAUDE.md` that is not UTF-8. Before, it printed a traceback and exited 1, which the sync steps read as "block differs". Now it prints `error: <path> is not UTF-8 (byte <n>)` on stderr and exits 2. A missing or non-UTF-8 `shared-rules.md` is also refused this way.
- `sync_rules.py --write` on a CRLF file. Before, every line of the file became LF. Now every byte outside the block is kept and the block is written in CRLF.
- `sync_rules.py` error lines. Before, they went to stdout. Now they go to stderr.
- `land.sh` when the builder committed everything. Before, it failed with `worktree git commit failed`, exit 1. Now it prints `worktree git commit: nothing staged, no wip commit made` and goes on.
- `land.sh` with a lock held while any `git` process runs. Before, it waited with no bound. Now it stops after 60 s with `index lock failed: <lock> still held after 60 s of waiting; remove it once no git command uses it, then land again` and exit 1. `LANDING_LOCK_WAIT` shortens or lengthens the bound.
- `usage.py` on a Codex rollout. Before, `<n> messages` counted `token_count` events. Now it counts assistant messages.
- `usage.py` with a window time that has no offset or cannot be read. Before, it printed a traceback and exited 1. Now it prints `usage.py: the <from|to> time <text> has no offset` (or `cannot be read`), with a hint, and exits 64.
- `land.test.sh` run inside an Ordo checkout that lacks an example file. Before, it skipped the check and passed. Now it fails, naming the missing file. The skip line now names the folder it judged from.

## Wrong or out of reach in the brief, with evidence

1. `skills/repo-setup/SKILL.md:74` reads "4. Exit 2 (no block, or `AGENTS.md` not a symlink to `CLAUDE.md`): draft the change." Exit 2 now also means that `CLAUDE.md` or `shared-rules.md` is missing or not UTF-8, or that `--write` failed. For those, drafting a change is the wrong action. The file is outside the paths this step may write, so it is left for the orchestrator to place.
2. After a stop at a lock wait that comes after the worktree's `git checkout -b "$2-land" main` (`land.sh:228`), the worktree is on `<step>-land`. A second run then fails at `land.sh:204`: "preflight failed: package worktree is on <step>-land, expected <step>". The conflict exit leaves the same state. `skills/land/SKILL.md` Steps 3 therefore states the stop and does not promise that `/land` resumes it. Running `land.sh` again after such a stop is a separate concern, since it applies to every exit after the checkout. This is read from the code and was not run.
3. A process from a probe of this step is still on the machine: pid 72228, state `UE`, command `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//pgt.OKIttV/git` (a copy of `/bin/sleep`, started Fri Sep 25 18:53:59 2026, shown by `ps -p 72228 -o pid,stat,lstart,comm`). `kill -9` does not end it. While it lives, `pgrep -x git` finds a `git` process, so a real `land.sh` never removes a stale lock and waits out the bound instead. A reboot clears it. The tests do not depend on it.
