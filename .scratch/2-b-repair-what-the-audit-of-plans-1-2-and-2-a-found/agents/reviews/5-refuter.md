# Step 5 refuter report (on .agents/worktrees/2b-5, base 25d99c9)

## Verification (rerun by the reviewer)

Every run below used `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/my home"`, with `$T` = the reviewer's scratchpad `r5`. `PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13` was added only so that `verify.sh` finds PyYAML under the scratch HOME; without it the runner printed `verify: python3 cannot import yaml; install PyYAML`, exit 69.

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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
ok: skills/land/SKILL.md ... ok: skills/spec/SKILL.md   (10 ok: lines)
verify: 12 commands passed
exit 0

$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests

$ (scratch copy, sh "$pin" replaced by dash "$pin" at line 22) dash pin.test.sh | tail -1
PASS: pin.sh scratch tests
$ dash -n utils/pin.sh && dash -n utils/pin.test.sh && echo "dash -n ok"
dash -n ok

$ (new pin.test.sh against git show 25d99c9:utils/pin.sh)
FAIL: .../pin-test.TD0Vzm/my home/.claude/skills/alpha does not link into the pin

Review reproductions (scratch repo $T/ordo, tag v1 with alpha and beta):
--- repro 1
pin: $T/sk/dev links to $T/ordo/skills/dev, in the live clone $T/ordo
pin: the links do not match the pin at v1
exit 1
--- repro 2
pin: $T/sk/dev links into the live clone $T/ordo; move it away or pin a tag that holds it
pin: removed $T/sk/old, which the tag v1 does not hold
pin: $T/sk/dev links to $T/ordo/skills/dev, in the live clone $T/ordo
pin: the links do not match the pin after linking
exit 1          (ls $T/sk: alpha beta dev)
--- repro 3 (HOME "$T/my home", ORDO_SKILL_DIRS unset, run from $T/cwd)
pinned: v1 (fb4826e), 2 skills linked in: $T/my home/.claude/skills, $T/my home/.agents/skills
exit 0          (ls -A $T/cwd: empty; ls: $T/my: No such file or directory)
--- repro 4 (rm -rf $T/stable; pin v1)
pinned: v1 (fb4826e), 2 skills linked in: ...
exit 0          (ls $T/stable/skills: alpha beta)

Reverts reproduced (scratch copy of pin.sh plus pin.test.sh, one exact replacement each):
R1 live-clone branch of check_links deleted: FAIL: check mode passed with a link into the live clone
R2b rm added to live-clone cleanup branch: FAIL: pin mode passed with a link into the live clone left in place
R3a default folders one space-separated line: FAIL: .../my home/.claude/skills/beta not linked with the default folders
R4 prune deleted: FAIL: pinning after the worktree was deleted by hand failed: fatal: '...ordo-stable' is a missing but already registered worktree; ...
P2 not-a-worktree refusal deleted: FAIL: the not-a-worktree refusal has no message; expected "pin: .../my home/plain exists and is not a git worktree" in: fatal: not a git repository ...
P3 CLAUDE_CONFIG_DIR append dropped: FAIL: the CLAUDE_CONFIG_DIR folder was not linked
P4 check after linking deleted: FAIL: pin mode passed with a link into the live clone left in place
P5 real-directory refusal deleted: FAIL: the real-directory refusal has no message; expected "... is a real directory; ..." in: pin: ... links to , outside Ordo; ...
M2 check_links' second loop back to `for dir in $skill_dirs`: FAIL: check mode passed with a link to a skill the tag lacks
M4 empty-line removal (sed '/^$/d') dropped: red (exit 1)
M5 pin-mode live-clone report line deleted: FAIL: pin mode did not report the link into the live clone; ...
M7 newline form ignored: FAIL: .../my home/.claude/skills/alpha does not link into the pin
M1 first-loop `"$repo"/*) continue ;;` removed: PASS: pin.sh scratch tests (green)
M3 summary line prints "$skill_dirs" instead of "$shown_dirs": PASS: pin.sh scratch tests (green)
M6 tr ' \t' reduced to tr ' ': PASS: pin.sh scratch tests (green)

$ awk 'length > 100' utils/pin.sh utils/pin.test.sh      -> no output
$ LC_ALL=C grep -n '[^ -~]' utils/pin.sh utils/pin.test.sh README.md; echo $?   -> 1
$ git diff 25d99c9 --stat | tail -1
 3 files changed, 317 insertions(+), 84 deletions(-)
```

## 1. Spec

1. The brief's "What it must do" says the real `~/.claude-work/skills` is never changed. `ls -A /Users/axelfaes/.claude-work/skills` still lists `alpha`. `ls -la` shows `alpha -> /private/var/folders/7r/.../T/pin-repro.vQ34tT/stable/skills/alpha`, dated Sep 25 16:43. It is a dangling link made by the builder's reproduction run. The report discloses it, and it is open item I; it is not undone.
2. `utils/pin.sh:40` `[ -n "$skill_dirs" ] || fail "ORDO_SKILL_DIRS names no folder"`, `pin.sh:37` (tab treated as a separator), `pin.sh:48` (the summary line joins folders with `, `) and `pin.sh:155` (`fail "could not prune the worktree list of $repo"`): no brief item asks for any of these. The first stops an empty list from writing to `/` (the builder's revert R3c), and the report states it. The tab split, the summary format and the prune message appear only as judgment calls. The two messages are new user-visible refusals the brief did not name.

## 2. Proof

1. `utils/pin.sh:48,114,187` (`"$shown_dirs"`): revert M3, which prints `"$skill_dirs"` again, leaves `pin.test.sh` green. The summary-line change listed in the report's user-visible table has no test.
2. `utils/pin.sh:37` `tr ' \t' '\n\n'`: revert M6 (`tr ' ' '\n'`) leaves the test green. Judgment call 5 ("splits on spaces and tabs") is not proven.
3. `utils/pin.sh:73` `"$repo"/*) continue ;;`: revert M1 leaves the test green. Judgment call 1's claim that a live-clone link for a held skill "is not reported twice" has no test.
4. `utils/pin.sh:155`: the new prune refusal has no case and no revert.
5. `utils/pin.test.sh:523` `export ORDO_SKILL_DIRS="$test_root/plain-a  $test_root/plain-b"`: the case assumes `$test_root` holds no space. With `TMPDIR="$T/tmp dir"` the test goes red (`FAIL: .../tmp dir/pin-test.vwU1nS/plain-a/beta not linked from the space-separated list`). Worse, it created `$T/tmp/beta` and `$T/tmp/gamma` outside its scratch root, and the trap does not remove them (`ls -laR "$T/tmp"`). So the test's claim that it touches only its scratch folders depends on a TMPDIR without a space.

## 3. Standards

1. `README.md:169`: "A link into the live clone for a skill the tag lacks is left in place and reported, and the pin then fails its final check, so a link made by hand is never deleted without a message." This is false for a hand-made link into the live clone for a skill the tag holds. `pin.sh:164` (`ln -sfn`) replaces it with no line. Probe: after `ln -sfn "$R/skills/alpha" "$T/sk/alpha"`, `pin.sh v1` printed only `pinned: v1 (b343518), 2 skills linked in: $T/sk`, exit 0, and `readlink` then gave `$T/stable/skills/alpha`. The clause is also a justifying closer (prose standard, E "restating closes").
2. `utils/pin.sh:8`: "A pinned worktree deleted by hand is pruned from git's list and created again." and `README.md:167`. `git -C "$repo" worktree prune` (`pin.sh:155`) removes the registration of every worktree of the clone whose folder is missing, not only the pinned one. Both sentences describe it as acting on the pinned worktree alone.

## 4. Behaviour

1. `utils/pin.sh:155`: pin mode now runs `git worktree prune` on the live clone whenever the pinned worktree folder is absent. That drops git's record of any other missing worktree of the clone, for example a plan step's worktree under `.agents/worktrees` that was deleted by hand. The report's user-visible table states only "Pinned worktree deleted by hand ... created again". The new message `pin: could not prune the worktree list of <repo>` is not in the table either.
2. `utils/pin.sh:151-184`: with a link into the live clone for a skill the tag lacks, pin mode exits 1 after it has checked the worktree out at the new tag and rewritten every link. The head comment at `pin.sh:127` says "Every refusal happens here, before the worktree or a link changes", so a user reading the exit 1 as a refusal would be wrong. The report's table row ("left in place, `pin: ...`, exit 1") and `README.md:169` do not say that the pin has already moved.
3. `utils/pin.sh:36`: the newline form takes each line verbatim, so a line with leading spaces becomes a relative folder under the current directory. Probe F: `ORDO_SKILL_DIRS="  $T/sk5 <newline>$T/sk"` printed `pinned: v1 (e6758af), 2 skills linked in:   $T/sk5 , $T/sk`, exit 0, and created a folder named by two spaces in the working directory. That is the defect class item 3 exists to end (folders created in the current directory while success is reported). Before the change, the space-separated reading trimmed such a value. No refusal of a relative or space-padded folder is added (change standard rule 15), and the report does not state the behaviour.

## Not checked

- `pin.sh` under shells other than macOS `sh` (bash in POSIX mode) and `dash`: zsh as sh, ksh and busybox ash were not run.
- A pin against the user's real v1.0.0 layout and folders: forbidden by the safety rule. The real folders were listed read-only before and after the reviewer's runs and did not change: `~/.claude/skills`, `~/.claude-work/skills` (still holding the builder's `alpha`), `~/.agents/skills`, and `~/.local/share/ordo-stable` at `v1.0.0` with 0 porcelain lines.
- `pin.test.sh` lines 40-45 run `git commit` in the scratch repository before `HOME` is replaced, so they read the user's global git config. These lines are unchanged by the diff, and `git config --global --get core.hooksPath` is unset (exit 1). With `CLAUDE_CONFIG_DIR`, `ORDO_SKILL_DIRS` and `ORDO_STABLE` pointed at scratch sentinel folders when the test started, the test passed and left the sentinels unchanged (`find` listed only the pre-made `cfg/skills/keep`).

Reviewer usage: 126,518 tokens, 28 tool uses, 433 s (the runner's completion notification).

## Repair round 1, refuted

Every run started with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/my home"`. `$T` was the reviewer's scratchpad folder `rr5`. Runs of pin.sh by hand also got a scratch `ORDO_STABLE` and `ORDO_SKILL_DIRS`, and verify.sh also got `PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13`. The real folders were listed before and after with `ls -la ~/.claude-work/skills ~/.claude/skills ~/.agents/skills` and `git -C ~/.local/share/ordo-stable describe --tags --exact-match`. `diff` of the two listings printed "real folders unchanged", and `status --porcelain | wc -l` printed 0. No `pin-*` folder was left in /tmp.

```
$ ... ORDO_STABLE="$T/stable-x" ORDO_SKILL_DIRS="$T/sk" PYTHONUSERBASE=... sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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

$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ ... TMPDIR="$T/tmp dir" sh utils/pin.test.sh; echo "exit $?"
PASS: pin.sh scratch tests
exit 0          (find $T afterwards: nothing from the test; no new pin-* folder in /tmp)

Reverts (one exact replacement each, on a scratch copy of pin.sh with the test beside it):
M1  first-loop "$repo"/*) continue removed  exit 1  FAIL: check mode reported the link into the live clone 2 times: ...
M3  summary prints $skill_dirs (both lines)   exit 1  FAIL: the summary line does not join the folders with a comma; ...
M6  tr ' \t' -> tr ' '                        exit 1  FAIL: /private/tmp/pin-plain.QTpDRj/b/beta not linked from the space-separated list
R5a live-clone refusal removed                exit 1  FAIL: pin mode did not refuse the link into the live clone; ...
R5b "pin: replaced" printf removed            exit 1  FAIL: the replacement of a link into the live clone is not reported; ...
R6a --force dropped                           exit 1  FAIL: pinning after the worktree was deleted by hand failed: fatal: '...ordo-stable' is a missing but already registered worktree;
R6b worktree prune added before add           exit 1  FAIL: pinning dropped the registration of another missing worktree
R7a relative-path refusal removed             exit 1  FAIL: pin.sh linked into rel/skills, outside the scratch roots
R7b trailing-whitespace refusal removed       exit 1  FAIL: pinned with the folder ".../my home/.claude/skills " (newline form)
R3c empty-list refusal removed                exit 1  FAIL: the empty ORDO_SKILL_DIRS has no message; expected "pin: ORDO_SKILL_DIRS names no folder" in: pin:  is not an absolute path
L   local-changes refusal moved after checkout exit 1 FAIL: a refused pin moved the worktree

git worktree add --force probes (scratch repo):
existing folder holding a file, direct      fatal: '.../nw' already exists, exit 128, file kept
registered and present worktree with an edit, direct   fatal: '.../wt' already exists, exit 128, edit kept
dangling symlink, direct                    fatal: '.../dang' already exists, exit 128
pin.sh, ORDO_STABLE a non-worktree folder   pin: .../nw2 exists and is not a git worktree, exit 1, file kept
pin.sh, ORDO_STABLE an empty folder         pin: .../empty2 exists and is not a git worktree, exit 1
pin.sh, ORDO_STABLE a registered present worktree with an edit   pin: .../wt has local changes; ..., exit 1, edit kept
pin.sh, pinned worktree deleted, record locked   fatal: ... is a missing but locked worktree; ... pin: could not create the worktree ..., exit 1
pin.sh, pinned worktree deleted, record unlocked   pinned: v1 (ad88c89), ..., exit 0; marker file placed in .git/worktrees/stable before: gone after

$ awk 'length > 100' utils/pin.sh utils/pin.test.sh              -> no output
$ LC_ALL=C grep -n '[^ -~]' utils/pin.sh utils/pin.test.sh README.md -> exit 1
$ git diff --stat dfa1f83   -> README.md 10, utils/pin.sh 75, utils/pin.test.sh 184, the report 271
$ git status --short        -> the report, README.md, utils/pin.sh, utils/pin.test.sh
```

### 1. Spec

None. Each part of the round's delta falls under one of rulings 2 to 7. The `chmod a-w` case for the check after linking is also inside them: it is needed because ruling 5 removed the route that used to reach that check. The rule-14 grep (`grep -rn -e 'could not prune' -e 'worktree prune' -e 'live clone' -e 'not an absolute path' -e 'pin: replaced' -e 'names no folder' -e 'reuse' -e '--force' README.md utils docs skills`) finds no page outside README.md and utils/pin.sh that names the changed messages.

### 2. Proof

1. `utils/pin.test.sh:16-19`, together with `README.md:122` ("writes only under its two scratch roots"). The test can write outside its scratch roots.
   - Reproduction: `TMPDIR="$T/a<newline>$T/outside"`. The test failed with `FAIL: pin.sh linked into $T/a, outside the scratch roots`.
   - It left links `$T/a/alpha` and `$T/a/beta`, and the folders `$T/outside/pin-test.7pPlTO/my home/{.claude,.agents}/skills/{alpha,beta}`. Both are outside TMPDIR and outside both scratch roots, and the trap did not remove them.
   - Cause: `d1` and `d2` carry the newline into `ORDO_SKILL_DIRS="$d1$nl$d2"`, which pin.sh splits into two absolute folders. The summary guard in `run_pin` notices only after the write.
   - `plain_root` is refused when it holds whitespace (lines 24-26). `test_root` gets no such refusal.

### 3. Standards

1. `utils/pin.sh:9` ("which reuses its registration") and `utils/pin.sh:186` ("--force lets git reuse that record") are false. A marker file placed in `.git/worktrees/stable` before the re-pin was gone after it: git deletes the stale record and writes a new one under the same name. The comments also do not say that a locked record is still refused (`missing but locked worktree`, exit 1). This breaks change-standard rule 14: a head comment made false by the change.
2. `README.md:167` states the absolute-path rule only in the `ORDO_SKILL_DIRS` paragraph. The head comment (`utils/pin.sh:15-16`, "Every folder, in either form") ties it to the two forms of the variable. The check also refuses the default folders and the `$CLAUDE_CONFIG_DIR` folder. Probes: `CLAUDE_CONFIG_DIR=relcfg` gives `pin: relcfg/skills is not an absolute path`, exit 1, and `HOME=relhome` gives `pin: relhome/.claude/skills is not an absolute path`, exit 1. Neither page says so, which breaks change-standard rule 5.
3. `README.md:122`: four sentences in a row open with "It checks". This breaks prose standard D, "No repeated construction".

### 4. Behaviour

1. `utils/pin.sh:54` gives a false refusal message. A folder that is absolute but has trailing whitespace is refused with `pin: <folder> is not an absolute path`, and the whitespace cannot be seen in the message.
   - Probe (od -c): `pin: .../p/sk  is not an absolute path`.
   - A folder with leading whitespace gets the same message, and a line of spaces prints `pin:    is not an absolute path`.
   - `utils/pin.test.sh:355` asserts this message for `"$d1 "`, so the test pins the wrong wording.
   - Elsewhere the tree quotes the value, which makes whitespace visible: `skills/ordo-init/templates/check_config.py:72` prints `{note!r}`.
   - The round's user-visible table does not state the message for the whitespace case.
2. `utils/pin.sh:195-203`: `pin: replaced <link>, which linked into the live clone <repo>` is printed even when `ln -sfn` failed.
   - Probe: a live-clone link for `alpha` in a folder made read-only printed `ln: ...: Permission denied`, then `pin: replaced .../sk3/alpha ...`, then `pin: .../sk3/alpha links to .../ordo/skills/alpha, in the live clone ...`, then exit 1. The link still pointed into the live clone.
   - `utils/pin.sh:210-211` has the same defect. `pin: removed <link>, which the tag v1 does not hold` was printed after `rm: ...: Permission denied`, and `old` was still there (`ls` listed alpha, beta, old). This part comes from the whole diff since 25d99c9, not from this round.
   - The run exits 1 through the check after linking, so the wrong state does not pass silently. The two lines still report changes that did not happen.

### Not checked

- pin.sh under zsh as sh, ksh and busybox ash. Only macOS `sh` and `dash` were run: the validation probes ran under both, and the full test ran under `sh`.
- TMPDIR values holding glob characters, a leading `-`, or `", "`. The last would break the `awk -F ', '` split in `run_pin`.
- A pin against the user's real v1.0.0 layout, which the safety rule forbids.

Reviewer usage: 135,722 tokens, 31 tool uses, 484 s (the runner's completion notification).
