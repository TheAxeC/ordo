# Report: step 5, pin.sh

Everything in the brief is done. One thing outside the brief needs the user: a reproduction run by hand linked into the real `~/.claude-work/skills`, and one link it left there is still in place (see "Real folder touched" below). Removing it was denied by the permission classifier.

## Open items of the state file, verbatim

- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## Real folder touched

The reproductions in check 3 were first run with the session's `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` inherited, and `pin.sh` includes `$CLAUDE_CONFIG_DIR/skills` in its default folders. That run created one link. Its state now:

```
$ ls -la /Users/axelfaes/.claude-work/skills/alpha; readlink /Users/axelfaes/.claude-work/skills/alpha
lrwxr-xr-x@ 1 axelfaes  staff  93 Sep 25 16:43 /Users/axelfaes/.claude-work/skills/alpha -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-repro.vQ34tT/stable/skills/alpha
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-repro.vQ34tT/stable/skills/alpha
$ find /Users/axelfaes/.claude-work/skills -maxdepth 1 -type l -lname '*pin-repro*' -print
/Users/axelfaes/.claude-work/skills/alpha
```

No `alpha` existed there before the run. The run exited 0, and `pin.sh` exits 1 before linking when an entry exists as a real directory or as a link outside Ordo, and `$T` was a new `mktemp` folder. The run's cleanup removes only links into `$T/stable`, and none existed. The link is dangling, since `$T` is deleted. To restore the folder, the user runs:

```sh
rm /Users/axelfaes/.claude-work/skills/alpha
```

`utils/pin.test.sh` unsets `CLAUDE_CONFIG_DIR` before its first run of `pin.sh` (line 54) and sets it only to `$HOME/config` under the scratch `HOME`. The reproductions quoted in check 3 ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/home"`.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. Check mode flags every link into the live clone | DONE | test case at `utils/pin.test.sh:110-131`; revert R1 red; check 3 repro 1 |
| 2. Pin mode removes only links into the pinned worktree, reports each removal, leaves and reports a live-clone link for a skill the tag lacks and fails | DONE | cases at `utils/pin.test.sh:85-108, 123-148`; reverts R2, R2a, R2b red; check 3 repro 2 |
| 3. Home folder holding a space; folders read one per line; `ORDO_SKILL_DIRS` in both forms | DONE | every case runs under `HOME="$test_root/my home"`; cases at `utils/pin.test.sh` default-folder and space-separated blocks; reverts R3a, R3b red; check 3 repro 3 |
| 4. `git worktree prune` before `git worktree add` | DONE | case "A pinned worktree deleted by hand"; revert R4 red; check 3 repro 4 |
| 5. Head comment states the behaviours, wrapped at 100 | DONE | `utils/pin.sh:1-20`; width check below |
| 6. Tests for each item and the five untested points | DONE | reverts P1 to P5 red, quoted below |
| 7. README `pin.test.sh` bullet and pin section | DONE | `README.md:122`, `README.md:165-169` |
| Verify list passes | DONE | check 1 |
| `pin.test.sh` passes | DONE | check 2 |

### Check 1: the verify list

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

### Check 2: the pin test, and the same test with pin.sh started under dash

```
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
```

A scratch copy of the test with `sh "$pin"` replaced by `dash "$pin"` (line 22), run with `dash`:

```
22:    dash "$pin" "$@" >"$test_root/out" 2>"$test_root/err"
PASS: pin.sh scratch tests
exit 0
```

```
$ dash -n utils/pin.sh && dash -n utils/pin.test.sh && echo "dash -n ok"
dash -n ok
```

This does not cover `pin.sh` under a shell other than bash's `sh` mode and dash.

### Check 3: the review's reproductions, on scratch folders

Run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/home"`, with `ORDO_STABLE=$T/stable` and `ORDO_SKILL_DIRS=$T/sk` for repros 1 and 2, and a copy of `utils/pin.sh` in a scratch repository `$T/ordo` holding the skill `alpha` at tag `v1`. Output with `$T` substituted for the scratch folder:

```
CLAUDE_CONFIG_DIR set: 
--- repro 1: check mode with a live-clone link
pinned: v1 (0cd2f87), 1 skills linked in: $T/sk
pin: $T/sk/dev links to $T/ordo/skills/dev, in the live clone $T/ordo
pin: the links do not match the pin at v1
exit 1
--- repro 2: pin mode with the same link and a stale link into the pinned worktree
pin: $T/sk/dev links into the live clone $T/ordo; move it away or pin a tag that holds it
pin: removed $T/sk/old, which the tag v1 does not hold
pin: $T/sk/dev links to $T/ordo/skills/dev, in the live clone $T/ordo
pin: the links do not match the pin after linking
exit 1
$T/sk/alpha -> $T/stable/skills/alpha
$T/sk/dev -> $T/ordo/skills/dev
--- repro 3: HOME holding a space, ORDO_SKILL_DIRS unset, run from $T/cwd
pinned: v1 (0cd2f87), 1 skills linked in: $T/my home/.claude/skills, $T/my home/.agents/skills
exit 0
ls -A $T/cwd: []
ls: $T/my: No such file or directory
$T/my home/.claude/skills/alpha -> $T/stable/skills/alpha
$T/my home/.agents/skills/alpha -> $T/stable/skills/alpha
--- repro 4: pinned worktree deleted by hand
pinned: v1 (0cd2f87), 1 skills linked in: $T/my home/.claude/skills, $T/my home/.agents/skills
exit 0
alpha
```

### Check 4: the new test red on the tree as it was

The new `utils/pin.test.sh` run against the unchanged `utils/pin.sh` (main at 25d99c9), before `pin.sh` was changed:

```
$ sh utils/pin.test.sh; echo "exit $?"
FAIL: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.vmo0eM/my home/.claude/skills/alpha does not link into the pin
exit 1
```

### Check 5: each case red under its revert

Each revert was applied to a scratch copy of the finished `utils/pin.sh`, with `utils/pin.test.sh` copied beside it and run there (`$S/reverts.py` in the session scratchpad applies one exact string replacement per revert and asserts it matched once).

R1, item 1: the `"$repo"/*)` branch of `check_links`' second loop deleted.

```
FAIL: check mode passed with a link into the live clone
exit 1
```

R2, item 2: the original cleanup restored (`"$stable"/*|"$repo"/*) [ -f ... ] || rm "$link"`, no message).

```
FAIL: the removal is not reported; expected "pin: removed /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.SodJzf/my home/.claude/skills/alpha, which the tag v2 does not hold" in: pinned: v2 (9e8955f), 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.SodJzf/my home/.claude/skills, /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.SodJzf/my home/.agents/skills
exit 1
```

R2a, item 2: the `pin: removed ...` line deleted.

```
FAIL: the removal is not reported; expected "pin: removed /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.l7Fpae/my home/.claude/skills/alpha, which the tag v2 does not hold" in: pinned: v2 (8de626d), 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.l7Fpae/my home/.claude/skills, /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.l7Fpae/my home/.agents/skills
exit 1
```

R2b, item 2: `rm "$link"` added to the live-clone branch of the cleanup.

```
FAIL: pin mode passed with a link into the live clone left in place
exit 1
```

R3a, item 3: the default folders back to one space-separated string.

```
FAIL: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.6jw4Er/my home/.claude/skills/beta not linked with the default folders
exit 1
```

R3b, item 3: the newline form of `ORDO_SKILL_DIRS` dropped, so the value is always split on spaces.

```
FAIL: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.UVSH7S/my home/.claude/skills/alpha does not link into the pin
exit 1
```

R3c, item 3 edge: the refusal of an `ORDO_SKILL_DIRS` that names no folder deleted.

```
FAIL: the empty ORDO_SKILL_DIRS has no message; expected "pin: ORDO_SKILL_DIRS names no folder" in: mkdir: : No such file or directory
ln: /beta: Read-only file system
ln: /gamma: Read-only file system
pin: /beta does not link to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.y0ab9k/my home/.local/share/ordo-stable/skills/beta
pin: /gamma does not link to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.y0ab9k/my home/.local/share/ordo-stable/skills/gamma
pin: the links do not match the pin after linking
exit 1
```

R4, item 4: the `git worktree prune` line deleted.

```
FAIL: pinning after the worktree was deleted by hand failed:  fatal: '/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L9xR21/my home/.local/share/ordo-stable' is a missing but already registered worktree;
use 'add -f' to override, or 'prune' or 'remove' to clear
pin: could not create the worktree /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L9xR21/my home/.local/share/ordo-stable at v2
exit 1
```

P1: the check-mode report of a link into the worktree whose skill the tag lacks deleted.

```
FAIL: check mode passed with a link to a skill the tag lacks
exit 1
```

P2: the "exists and is not a git worktree" refusal deleted.

```
FAIL: the not-a-worktree refusal has no message; expected "pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4MKL5t/my home/plain exists and is not a git worktree" in: fatal: not a git repository (or any of the parent directories): .git
pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4MKL5t/my home/.claude/skills/beta links to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4MKL5t/my home/.local/share/ordo-stable/skills/beta, outside Ordo; move it away and run again
exit 1
```

P3: the `$CLAUDE_CONFIG_DIR` folder dropped (its append replaced by `:`).

```
FAIL: the CLAUDE_CONFIG_DIR folder was not linked
exit 1
```

P4: the check after linking deleted.

```
FAIL: pin mode passed with a link into the live clone left in place
exit 1
```

P5: the "real directory" refusal deleted.

```
FAIL: the real-directory refusal has no message; expected "pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.hZn3QV/my home/.claude/skills/beta is a real directory; move it away and run again" in: pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.hZn3QV/my home/.claude/skills/beta links to , outside Ordo; move it away and run again
exit 1
```

The cases asserting silence carry their controls in the same file: check mode passing after a repair (lines 120-121) and after the live-clone link is moved away (lines 146-148) follow the red runs on the same folders at lines 112-115 and 127-131.

### Check 6: ASCII, width, no history, the grep of rule 14

```
$ LC_ALL=C grep -n '[^ -~]' utils/pin.sh utils/pin.test.sh README.md; echo "non-ascii grep exit $?"
non-ascii grep exit 1
$ awk 'length > 100 {print FILENAME":"FNR}' utils/pin.sh utils/pin.test.sh
$
```

```
$ grep -rn -e 'ORDO_SKILL_DIRS' -e 'pin\.sh' -e 'live clone' -e 'ordo-stable' skills utils docs README.md | grep -v '^utils/pin'
docs/roadmap.md:22:- Goal: Every finding of the five reports in ... `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, ...
docs/dev/change-standard.md:64:- The pinned worktree `~/.local/share/ordo-stable` is never edited; the installed skills change only through `utils/pin.sh <tag>` (`README.md`, Working on Ordo).
README.md:122:- `pin.test.sh` runs every case under a scratch `HOME` whose path holds a space. ...
README.md:161:utils/pin.sh v1.0.0      # the worktree ~/.local/share/ordo-stable at v1.0.0, every skill linked from it
README.md:162:utils/pin.sh             # checks that every link points into the pinned worktree; changes nothing
README.md:165:`pin.sh` links into `~/.claude/skills`, ...
README.md:167:Moving to a new version is a tag on `main` and `utils/pin.sh <tag>`; ...
README.md:169:Check mode fails on a link into the live clone and ...
```

(The long README lines are shortened here with `...`; the command printed them whole.) No hit outside the three written files says anything this change makes false: `docs/roadmap.md:22` names the tool, `docs/dev/change-standard.md:64` is unchanged in meaning, and `README.md:162` ("checks that every link points into the pinned worktree") is now true.

## Files

```
$ wc -l utils/pin.sh utils/pin.test.sh README.md
     187 utils/pin.sh
     283 utils/pin.test.sh
     173 README.md
$ git diff --stat
 README.md         |   8 +-
 utils/pin.sh      | 124 ++++++++++++++++++-------
 utils/pin.test.sh | 269 ++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 317 insertions(+), 84 deletions(-)
```

Before: `utils/pin.sh` 131, `utils/pin.test.sh` 110, `README.md` 169 (`git show HEAD:<path> | wc -l`). The report `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/5-report.md` is new.

## Judgment calls the brief left open

1. **Check-mode message for a live-clone link**: `pin: <link> links to <target>, in the live clone <repo>`. A live-clone link for a skill the tag holds is reported once, by this line; the per-skill loop skips a target under the live clone (and not under the pinned worktree) so the same link is not reported twice.
2. **Pin mode with a live-clone link the tag lacks** prints the brief's line, then the final check's line for the same link, then `pin: the links do not match the pin after linking`. The two lines differ in content (the advice, then the target).
3. **Streams**: the removal line goes to standard output with the summary; the live-clone report goes to standard error with the other problems.
4. **An `ORDO_SKILL_DIRS` that names no folder** (only spaces, tabs or newlines) is refused with `pin: ORDO_SKILL_DIRS names no folder`. Before, `" "` linked nothing and printed success. Without the refusal the newline reading turns it into one empty folder name, and R3c shows the script then writes to `/`.
5. **The space-separated form** splits on spaces and tabs, as the unquoted loops did before. Empty lines in the one-per-line form are skipped.
6. **The summary line** joins the folders with `, ` so a folder holding a space stays readable.
7. **A failed `git worktree prune`** is its own refusal: `pin: could not prune the worktree list of <repo>`.
8. **Folder loops** read the list one line at a time on descriptor 3 from a here-document, so no path is split or glob-expanded and the loops run in the script's own shell (a `fail` inside one exits the script).

## User-visible changes

| Surface | Before | After |
|---|---|---|
| Check mode, link into the live clone for a skill the tag lacks | `pinned: v1, 1 skills linked in: ...`, exit 0 | `pin: <link> links to <target>, in the live clone <repo>`, `pin: the links do not match the pin at v1`, exit 1 |
| Check mode, link into the live clone for a skill the tag holds | `pin: <dir>/<skill> does not link to <stable>/skills/<skill>`, exit 1 | `pin: <link> links to <target>, in the live clone <repo>`, exit 1 |
| Pin mode, link into the pinned worktree for a skill the tag lacks | removed silently | removed, `pin: removed <link>, which the tag <tag> does not hold` |
| Pin mode, link into the live clone for a skill the tag lacks | removed silently, exit 0 | left in place, `pin: <link> links into the live clone <repo>; move it away or pin a tag that holds it`, exit 1 |
| `HOME` holding a space, `ORDO_SKILL_DIRS` unset | folders split on the space, relative folders created in the current directory, exit 0 | the folders under `HOME` linked, nothing created elsewhere |
| `ORDO_SKILL_DIRS` | space-separated only | space-separated, or one folder per line when it holds a newline; a value naming no folder is refused |
| Pinned worktree deleted by hand | `fatal: ... is a missing but already registered worktree`, exit 1 | created again, exit 0 |
| Summary line | folders joined by a space | folders joined by `, ` |
| Head comment, `README.md:122`, `README.md:165-169` | described the old behaviour | describe the behaviour above |

## Wrong or impossible in the brief

Nothing. The brief's line numbers for `README.md` hold: the bullet is at line 122 and the pin paragraph was at line 165.
