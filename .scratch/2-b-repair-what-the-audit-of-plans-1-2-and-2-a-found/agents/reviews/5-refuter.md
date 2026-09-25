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
