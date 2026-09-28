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

# Repair round 1

Every ruling of the round is closed. Nothing is left undone. Where this section and the sections above disagree, this section states the tree as it is now. It replaces judgment calls 2, 7 and 8's prune part, and the user-visible rows for pin mode's live-clone link and the deleted worktree.

Every run of `pin.sh` and `pin.test.sh` in this round started with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="<scratch>/my home"`, with scratch `ORDO_STABLE` and `ORDO_SKILL_DIRS`. The verify runner also got `PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13`, where `python3 -c 'import yaml; print(yaml.__file__)'` finds PyYAML, because the scratch HOME hides it.

## Rulings and what closes each

| Ruling | What closes it | Proof |
|---|---|---|
| 1. The stray link is the user's | Not touched. A read-only `ls -la` shows it unchanged: `/Users/axelfaes/.claude-work/skills/alpha -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-repro.vQ34tT/stable/skills/alpha` | check G |
| 2. Keep the empty-list refusal, the tab split and the `, ` summary; README and head comment name each | Head comment `utils/pin.sh:11-17`, `README.md:165` (summary) and `README.md:167` (split, absolute paths, empty list) | the files |
| 3. A test for the summary format, the tab split, a held live-clone link reported once | `utils/pin.test.sh`: summary asserted after the first pin and in check mode; `ORDO_SKILL_DIRS="$plain_root/a  $plain_root/b<TAB>$plain_root/c"` must give three folders; `grep -c -F "$d1/beta"` on check mode's output must be 1. The prune refusal is gone with ruling 6 | reverts M3, M6, M1 red (check C) |
| 4. The space-separated case uses a root of its own with no space; check that nothing outside the scratch roots changed | `plain_root=$(mktemp -d /tmp/pin-plain.XXXXXX)`, removed by the trap. `run_pin` fails when a summary line names a folder outside the two roots. The test records every path that ends just before a space of a skill folder and does not exist, and fails at the end if one appeared. `HOME` is set before the scratch repository's first `git` command | check D; revert R7a red through the summary guard |
| 5. A live-clone link for a skill the tag lacks is refused before anything changes; one for a held skill is replaced and reported | The refusal pass (`utils/pin.sh`, after "Every refusal happens here") scans every link of every folder. A link into the live clone whose skill `tag_holds` rejects fails with the brief's message. The linking loop prints `pin: replaced <link>, which linked into the live clone <repo>`. The cleanup no longer has a live-clone branch. `README.md:171` states both and no longer has the "so a link made by hand" clause | reverts R5a, R5b red; check E |
| 6. No prune; `git worktree add --force --detach`; another missing worktree keeps its record | `git -C "$repo" worktree add -q --force --detach "$stable" "$tag"`. The test registers `$test_root/other`, deletes it and the pinned worktree, pins, and requires `worktree $other` in `git worktree list --porcelain`. Head comment and `README.md:169` say so | reverts R6a, R6b red; check E repro 4 |
| 7. Every folder absolute, with no leading or trailing whitespace, else `pin: <folder> is not an absolute path` before anything changes | A loop right after the folder list is built, for check mode and pin mode alike. The test runs `rel/skills`, `  $d1`, `$d1 ` and `<TAB>$d1` in the newline form, and `rel/skills` in the space form. Each must be refused with its message, with the worktree still at v2, a link unchanged and the run folder empty. Check mode refuses a padded folder too | reverts R7a, R7b red; check E probe F |

## Check A: the verify list

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/my home" ORDO_STABLE="$T/stable" ORDO_SKILL_DIRS="$T/sk" PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
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

## Check B: the pin test, under sh and with pin.sh under dash

```
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
```

A scratch copy of the test with `sh "$pin"` replaced by `dash "$pin"`, run with `dash`:

```
64:    dash "$pin" "$@" >"$test_root/out" 2>"$test_root/err"
PASS: pin.sh scratch tests
exit 0
$ dash -n utils/pin.sh && dash -n utils/pin.test.sh && echo "dash -n ok"
dash -n ok
```

Not covered: shells other than macOS `sh` (bash in POSIX mode) and dash.

## Check C: each case red under its revert

Each revert is one exact replacement on a scratch copy of `utils/pin.sh`, with the test copied beside it. It ran under the safety environment with `HOME`, `ORDO_STABLE` and `ORDO_SKILL_DIRS` in a `mktemp` folder (script `reverts2.py` in the session scratchpad). After the runs, that folder held only `my home` (empty) and `rev`.

```
== M1 check mode: first-loop skip of a live-clone target removed
FAIL: check mode reported the link into the live clone 2 times: pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23wYhw/my home/.claude/skills/beta does not link to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23wYhw/my home/.local/share/ordo-stable/skills/beta
pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23wYhw/my home/.claude/skills/beta links to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23wYhw/ordo/skills/beta, in the live clone /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23wYhw/ordo
pin: the links do not match the pin at v2
exit 1

== M3 summary line prints $skill_dirs instead of $shown_dirs
FAIL: the summary line does not join the folders with a comma; expected ", 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.rYaQZH/my home/.claude/skills, /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.rYaQZH/my home/.agents/skills" in: pinned: v1 (4d8d333), 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.rYaQZH/my home/.claude/skills
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.rYaQZH/my home/.agents/skills
exit 1

== M6 space-separated form split on spaces only
FAIL: /private/tmp/pin-plain.hE5PfN/b/beta not linked from the space-separated list
exit 1

== R5a refusal of a live-clone link for a skill the tag lacks removed
FAIL: pin mode did not refuse the link into the live clone; expected "pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.bly4bf/my home/.claude/skills/dev links into the live clone /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.bly4bf/ordo; move it away or pin a tag that holds it" in: pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.bly4bf/my home/.claude/skills/dev links to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.bly4bf/ordo/skills/dev, in the live clone /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.bly4bf/ordo
pin: the links do not match the pin after linking
exit 1

== R5b "pin: replaced" line removed
FAIL: the replacement of a link into the live clone is not reported; expected "pin: replaced /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L2HBSL/my home/.claude/skills/beta, which linked into the live clone /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L2HBSL/ordo" in: pinned: v2 (57a926f), 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L2HBSL/my home/.claude/skills, /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.L2HBSL/my home/.agents/skills
exit 1

== R6a --force dropped from git worktree add
FAIL: pinning after the worktree was deleted by hand failed:  fatal: '/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.2q160v/my home/.local/share/ordo-stable' is a missing but already registered worktree;
use 'add -f' to override, or 'prune' or 'remove' to clear
pin: could not create the worktree /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.2q160v/my home/.local/share/ordo-stable at v2
exit 1

== R6b git worktree prune run before git worktree add
FAIL: pinning dropped the registration of another missing worktree
exit 1

== R7a absolute-path check removed
FAIL: pin.sh linked into rel/skills, outside the scratch roots
exit 1

== R7b trailing-whitespace check removed
FAIL: pinned with the folder "/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.HYnbzS/my home/.claude/skills " (newline form)
exit 1

== R3c refusal of a list naming no folder removed
FAIL: the empty ORDO_SKILL_DIRS has no message; expected "pin: ORDO_SKILL_DIRS names no folder" in: pin:  is not an absolute path
exit 1

== R1 check mode: live-clone report deleted
FAIL: check mode passed with a link into the live clone
exit 1

== R2a "pin: removed" line deleted
FAIL: the removal is not reported; expected "pin: removed /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.ZNrLaC/my home/.claude/skills/alpha, which the tag v2 does not hold" in: pinned: v2 (2929746), 2 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.ZNrLaC/my home/.claude/skills, /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.ZNrLaC/my home/.agents/skills
exit 1

== R3a default folders back to one space-separated string
FAIL: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.qdWgJ9/my home/.claude/skills/beta not linked with the default folders
exit 1

== R3b newline form of ORDO_SKILL_DIRS dropped
FAIL: first pin failed:  pin: home/.claude/skills is not an absolute path
exit 1

== P1 check mode: report of a worktree link whose skill the tag lacks deleted
FAIL: check mode passed with a link to a skill the tag lacks
exit 1

== P2 not-a-git-worktree refusal deleted
FAIL: the not-a-worktree refusal has no message; expected "pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4dkAFx/my home/plain exists and is not a git worktree" in: fatal: not a git repository (or any of the parent directories): .git
pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4dkAFx/my home/.claude/skills/beta links to /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.4dkAFx/my home/.local/share/ordo-stable/skills/beta, outside Ordo; move it away and run again
exit 1

== P3 CLAUDE_CONFIG_DIR folder dropped
FAIL: the CLAUDE_CONFIG_DIR folder was not linked
exit 1

== P4 check after linking deleted
FAIL: pin mode passed with a link it could not make
exit 1

== P5 real-directory refusal deleted
FAIL: the real-directory refusal has no message; expected "pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.aSs1bN/my home/.claude/skills/beta is a real directory; move it away and run again" in: pin: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.aSs1bN/my home/.claude/skills/beta links to , outside Ordo; move it away and run again
exit 1
```

The check after linking (P4) is now proven by a folder the script cannot write to (`chmod a-w "$d2"` with its `beta` link removed), since a live-clone link no longer reaches that check.

## Check D: a TMPDIR holding a space

```
$ T=$(mktemp -d "${TMPDIR:-/tmp}/pin-tmpdir.XXXXXX"); mkdir "$T/tmp dir"; ls /tmp | grep -c pin-plain
0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/my home" ORDO_STABLE="$T/stable" ORDO_SKILL_DIRS="$T/sk" TMPDIR="$T/tmp dir" sh utils/pin.test.sh; echo "exit $?"
PASS: pin.sh scratch tests
exit 0
find $T after the run:
$T
$T/tmp dir
pin-plain folders left in /tmp: 0
```

## Check E: the review's reproductions and the reviewer's probes, on scratch folders

Scratch repository `$T/ordo` with `alpha` and `beta` at `v1`, run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME="$T/my home"`:

```
CLAUDE_CONFIG_DIR set: []
--- repro 1: check mode with a live-clone link
pinned: v1 (c54a0f0), 2 skills linked in: $T/sk
pin: $T/sk/dev links to $T/ordo/skills/dev, in the live clone $T/ordo
pin: the links do not match the pin at v1
exit 1
--- repro 2: pin mode with the same link and a stale link into the pinned worktree
pin: $T/sk/dev links into the live clone $T/ordo; move it away or pin a tag that holds it
exit 1
$T/sk/alpha -> $T/stable/skills/alpha
$T/sk/beta -> $T/stable/skills/beta
$T/sk/dev -> $T/ordo/skills/dev
$T/sk/old -> $T/stable/skills/old
pin: removed $T/sk/old, which the tag v1 does not hold
pinned: v1 (c54a0f0), 2 skills linked in: $T/sk
exit 0
--- probe: a hand-made live-clone link for a skill the tag holds
pin: replaced $T/sk/alpha, which linked into the live clone $T/ordo
pinned: v1 (c54a0f0), 2 skills linked in: $T/sk
exit 0
$T/sk/alpha -> $T/stable/skills/alpha
--- repro 3: HOME holding a space, ORDO_SKILL_DIRS unset, run from $T/cwd
pinned: v1 (c54a0f0), 2 skills linked in: $T/my home/.claude/skills, $T/my home/.agents/skills
exit 0
ls -A $T/cwd: []
ls: $T/my: No such file or directory
--- repro 4: pinned worktree deleted by hand, beside another missing worktree
pinned: v1 (c54a0f0), 2 skills linked in: $T/my home/.claude/skills, $T/my home/.agents/skills
exit 0
alpha
beta
worktree $T/ordo
worktree $T/other
worktree $T/stable
--- probe F: a folder with leading spaces in the newline form
pin:   $T/sk5 is not an absolute path
exit 1
ls -A $T/cwd: []
ls: $T/sk5: No such file or directory
```

In repro 2, the refused run left `old` in place. The second `pin.sh v1` ran after `rm "$T/sk/dev"` and removed it.

## Check F: ASCII, width, the rule-14 grep

```
$ LC_ALL=C grep -n "[^ -~]" utils/pin.sh utils/pin.test.sh README.md; echo $?
exit 1
$ awk 'length > 100 {print FILENAME":"FNR}' utils/pin.sh utils/pin.test.sh
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (the change standard's ASCII check)
exit 0
$ grep -rn -e 'ORDO_SKILL_DIRS' -e 'worktree prune' -e 'live clone' -e 'ordo-stable' -e 'could not prune' skills utils docs README.md | grep -v '^utils/pin' | cut -c1-160
docs/dev/change-standard.md:64:- The pinned worktree `~/.local/share/ordo-stable` is never edited; the installed skills change only through `utils/pin.sh <tag>`
README.md:122:- `pin.test.sh` runs every case under a scratch `HOME` whose path holds a space, writes only under its two scratch roots, and checks that no path 
README.md:161:utils/pin.sh v1.0.0      # the worktree ~/.local/share/ordo-stable at v1.0.0, every skill linked from it
README.md:167:`ORDO_SKILL_DIRS` replaces the list of folders. It is split on spaces and tabs, or read one folder per line when it holds a newline, which is the 
README.md:171:Check mode fails on a link into the live clone and on a link into the pinned worktree whose skill the tag lacks, and prints each one. Pin mode che
```

No page outside the three files names the prune or the removed message.

## Check G: the real folders, read only

```
$ ls -la /Users/axelfaes/.claude-work/skills/alpha
lrwxr-xr-x@ 1 axelfaes  staff  93 Sep 25 16:43 /Users/axelfaes/.claude-work/skills/alpha -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-repro.vQ34tT/stable/skills/alpha
$ git -C /Users/axelfaes/.local/share/ordo-stable describe --tags --exact-match
v1.0.0
$ git -C /Users/axelfaes/.local/share/ordo-stable status --porcelain | wc -l
       0
```

## Files after the round

```
$ wc -l utils/pin.sh utils/pin.test.sh README.md
     222 utils/pin.sh
     403 utils/pin.test.sh
     175 README.md
$ git diff --stat HEAD
 README.md         |  10 +--
 utils/pin.sh      |  75 ++++++++++++++++------
 utils/pin.test.sh | 184 ++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 213 insertions(+), 56 deletions(-)
```

## User-visible changes in this round

| Surface | After round 0 | Now |
|---|---|---|
| Pin mode, live-clone link for a skill the tag lacks | the pin moved, links rewritten, the link reported, exit 1 after linking | refused before anything changes: `pin: <link> links into the live clone <repo>; move it away or pin a tag that holds it`, exit 1 |
| Pin mode, live-clone link for a skill the tag holds | replaced silently | replaced, `pin: replaced <link>, which linked into the live clone <repo>` |
| Pinned worktree deleted by hand | `git worktree prune` (drops every missing worktree's record), then `worktree add` | `git worktree add --force --detach`; other records kept; the message `could not prune the worktree list` no longer exists |
| A skill folder that is relative or padded with whitespace | used as given (relative folders created in the working directory) | refused in both modes: `pin: <folder> is not an absolute path` |
| Head comment and `README.md:122,165-171` | round-0 behaviour | the behaviour in this table, the tab split, the empty-list refusal and the `, ` summary |
