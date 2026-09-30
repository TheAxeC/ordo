Everything in the brief is done.

## Open items of the state file

The section "Open items" of `.scratch/2-g-git-guard/orchestrator-state.md`, verbatim:

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Step 2b, the offer's text in question 10, for your reading (2026-09-30, raised at /spec of step 2b; the step is built meanwhile and is not landed before you answer): you approved the text of `repo-setup`'s question 10 by reading it ("Step 2 reading"), and step 2b changes it, since it lists what the guard refuses. The new text, four sub-bullets under "10. Install the git guard? [no]":
  - "It is a hook that refuses, in an agent's commands, the git commands that publish work or discard it: `git push`, `git send-pack`, `git subtree push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`."
  - "The user runs these by hand."
  - "The hook is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself."
  - "It needs `python3` 3.9 or later."
  - (a) The text as above. (b) The text with your correction, given in your answer. There is no lazy option: both are a reading.
  - Recommendation (a): it is the text you approved with the six commands added and its four requirements in a bullet each.
```

## The cases' first run on the unchanged tree

Every case ran on the unchanged tree before any change to the guard. The guard was a copy of `skills/repo-setup/templates/hooks/git_guard.py` at the base (`cmp` against `git show HEAD:...` printed `base-same`), named through `GIT_GUARD`. The test was a scratch copy under `$TMPDIR` of the unchanged `git_guard.test.sh` whose `fail` prints and goes on, with the 95 case lines of B1 to B9 added to its case file and the seven `expect_line` calls of B10 added, so that each case prints its own line: `ok: <case>` or `FAIL: <case>: ...`. The command: `GIT_GUARD=<scratch>/git_guard_base.py sh <scratch>/scratch.test.sh > firstrun.txt`. It printed 381 `ok:` lines and 54 `FAIL:` lines (`grep -c '^ok:' firstrun.txt`, `grep -c '^FAIL' firstrun.txt`). The 54 are the blocked cases of B1, B2, B4, B6, B8, B9 and B10 that are not one of the five preserved lines; the controls and the five preserved lines print `ok:`. No case is one the brief's own rules get wrong: each case's expected result agrees with the rule the brief states for it, so there is no hand-back.

The same 95 lines and 7 calls were run again from the finished test against the same base copy (`GIT_GUARD=<scratch>/git_guard_base.py PATH=/usr/bin:$PATH sh <scratch>/nonstop_status.test.sh`, which also prints `exit <status>: <case>` before each verdict); its 54 `FAIL:` lines are byte for byte those of the first run (`cmp` printed nothing). Each case's exit status on the base tree is quoted in the appendix "Exit statuses on the unchanged tree".

### B1

Cost of a wrong answer: work published that the user did not publish.

```
FAIL: block git send-pack ../remote.git main: expected exit 2, got 0: 
FAIL: block git send-pack --dry-run ../remote.git main: expected exit 2, got 0: 
FAIL: block git send-pack --all ../remote.git: expected exit 2, got 0: 
FAIL: block git -C /tmp/x send-pack ../remote.git main: expected exit 2, got 0: 
FAIL: block sudo git send-pack ../remote.git main: expected exit 2, got 0: 
```

### B2

Cost: the same. Three lines are of a behaviour the change preserves and are blocked on the unchanged tree: `git subtree -P; git push`, `git -c alias.subtree=push subtree origin main` and `git -c alias.subtree=push SUBTREE origin main`.

```
FAIL: block git subtree push --prefix=sub origin main: expected exit 2, got 0: 
FAIL: block git subtree -P sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree --pref sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree -q --prefix sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree push -Psub origin main: expected exit 2, got 0: 
FAIL: block git subtree -qP sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree --rejoin -m msg -P sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree --annotate x -b br --onto y -P sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree --p sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree --pr sub push origin main: expected exit 2, got 0: 
FAIL: block git subtree -P sub -- push origin main: expected exit 2, got 0: 
FAIL: block git subtree -Psub push origin main: expected exit 2, got 0: 
FAIL: block git SUBTREE -P sub push origin main: expected exit 2, got 0: 
FAIL: block git Subtree push -P sub origin main: expected exit 2, got 0: 
ok: block git subtree -P; git push
ok: block git -c alias.subtree=push subtree origin main
ok: block git -c alias.subtree=push SUBTREE origin main
```

### B3

Controls of B2; each must be allowed. Cost: a subtree command the user expects to run refused because a folder or a remote is named `push`.

```
ok: allow git subtree add --prefix=sub origin main
ok: allow git subtree pull -P sub origin main
ok: allow git subtree split -P push
ok: allow git subtree -P push add origin main
ok: allow git subtree merge --prefix push main
ok: allow git subtree --prefix=push pull push main
ok: allow git subtree --p push split
ok: allow git subtree --a push split -P sub
ok: allow git subtree -P sub -- split
ok: allow git subtree -Ppush split
ok: allow git subtree
ok: allow git subtree -P
ok: allow git subtree --
ok: allow git subtree --prefix
ok: allow git subtree -qP
ok: allow git subtree ''
```

### B4

Cost: stashed work lost.

```
FAIL: block git stash drop: expected exit 2, got 0: 
FAIL: block git stash drop -q: expected exit 2, got 0: 
FAIL: block git stash drop 'stash@{0}': expected exit 2, got 0: 
FAIL: block git stash clear: expected exit 2, got 0: 
FAIL: block env git stash clear: expected exit 2, got 0: 
```

### B5

Controls of B4; each must be allowed. Cost: the everyday stash commands refused.

```
ok: allow git stash
ok: allow git stash push -m drop
ok: allow git stash pop
ok: allow git stash apply
ok: allow git stash show -p
ok: allow git stash -q drop
ok: allow git stash branch clear
ok: allow git stash ''
```

### B6

Cost: work in the tree discarded.

```
FAIL: block git switch --discard-changes main: expected exit 2, got 0: 
FAIL: block git switch main --discard-changes: expected exit 2, got 0: 
FAIL: block git switch --discard main: expected exit 2, got 0: 
FAIL: block git switch --di main: expected exit 2, got 0: 
FAIL: block git switch -f main: expected exit 2, got 0: 
FAIL: block git switch --force main: expected exit 2, got 0: 
FAIL: block git switch -qf main: expected exit 2, got 0: 
FAIL: block git switch -fc new other: expected exit 2, got 0: 
FAIL: block git switch -f -c new: expected exit 2, got 0: 
FAIL: block git -c core.pager=cat switch -f main: expected exit 2, got 0: 
```

### B7

Controls of B6; each must be allowed. Cost: a plain change of branch refused.

```
ok: allow git switch main
ok: allow git switch -c new
ok: allow git switch -cfix
ok: allow git switch -Cfix
ok: allow git switch -C new
ok: allow git switch --force-create new
ok: allow git switch --detach HEAD~1
ok: allow git switch --d main
ok: allow git switch --forc main
ok: allow git switch -
```

### B8

Cost: work in the tree discarded.

```
FAIL: block git checkout -f other: expected exit 2, got 0: 
FAIL: block git checkout --force other: expected exit 2, got 0: 
FAIL: block git checkout --forc other: expected exit 2, got 0: 
FAIL: block git checkout --f other: expected exit 2, got 0: 
FAIL: block git checkout -f: expected exit 2, got 0: 
FAIL: block git checkout -qf other: expected exit 2, got 0: 
FAIL: block git checkout other -f: expected exit 2, got 0: 
FAIL: block git checkout -fb new: expected exit 2, got 0: 
FAIL: block git checkout -f -b new: expected exit 2, got 0: 
FAIL: block git checkout -f -- f: expected exit 2, got 0: 
```

### B8a

Controls of B8; each must be allowed. Cost: a plain checkout, or one of the skills' own, refused.

```
ok: allow git checkout other
ok: allow git checkout -b new
ok: allow git checkout -bfix
ok: allow git checkout -Bfix
ok: allow git checkout --no-force other
ok: allow git checkout -- f
ok: allow git checkout --theirs -- f
ok: allow git checkout main -- -f
```

### B9

Through an alias given inline. `git -c alias.stash=push Stash` is of a behaviour the change preserves and is blocked on the unchanged tree; `git -c alias.sl='stash list' sl` must be allowed.

```
FAIL: block git -c alias.d='stash drop' d: expected exit 2, got 0: 
FAIL: block git -c alias.sp=send-pack sp origin main: expected exit 2, got 0: 
FAIL: block git -c alias.sw='switch -f' sw main: expected exit 2, got 0: 
FAIL: block git -c alias.co='checkout -f' co other: expected exit 2, got 0: 
ok: block git -c alias.stash=push Stash
ok: allow git -c alias.sl='stash list' sl
```

### B10

The lines, by `expect_line`, on the unchanged tree:

```
FAIL: git send-pack ../remote.git main: expected exit 2, got 0: 
FAIL: git subtree push --prefix=sub origin main: expected exit 2, got 0: 
FAIL: git stash drop: expected exit 2, got 0: 
FAIL: git stash clear: expected exit 2, got 0: 
FAIL: git switch -f main: expected exit 2, got 0: 
FAIL: git checkout -f other: expected exit 2, got 0: 
ok: line git checkout -f .
```

The first six fail (exit 0, the guard allows the command); `git checkout -f .` prints `ok: line git checkout -f .` because the whole-tree rule already blocks it and gives its text.

### B11

Each existing case on the unchanged tree: the unchanged test (a copy of `git_guard.test.sh` at the base) against the base guard copy, `GIT_GUARD=<scratch>/git_guard_base.py PATH=/usr/bin:$PATH sh <scratch>/base.test.sh`:

```
PASS: git_guard.py scratch tests
exit 0
```

No `FAIL:` line of the first run belongs to a case of the unchanged test (the first `FAIL:` is at line 334 of `firstrun.txt`, `grep -n '^FAIL' firstrun.txt | head -1`, the first of the new cases).

### R1

Read on the unchanged tree (`git show HEAD:...`):

```
$ git show HEAD:skills/repo-setup/templates/hooks/git_guard.py | sed -n 28,37p
Blocked, because the user runs these by hand (they publish work or destroy it):
- git push, with any arguments, --dry-run included.
- git reset with --hard, or a long option that is a unique prefix of it (--ha and longer).
- git clean with --force (or a prefix from --fo), with a short-option word holding f (-f, -fd,
  -xdf), or with clean.requireForce set to false, no, off, the empty string or an integer 0 (00,
  -0, 0x0, 0k) by inline configuration and no -n or --dry-run.
- git checkout or git restore with a whole-tree pathspec among its arguments: ., ./, ./., *, **,
  .., ../, :/, :/., :/*, :(top), :(top)., :(literal)., a glob pathspec of * or **, or a set of
  pathspecs that are all excludes (:!x, :^x, :(exclude)x). git restore that restores only the index
  (--staged or -S without --worktree or -W) discards no work and is allowed.
$ git show HEAD:skills/repo-setup/templates/hooks/git_guard.py | sed -n 54,55p
Not blocked, because they are not among the five operations above: git checkout -f <branch>,
git switch --discard-changes, git stash drop, git stash clear, git send-pack and git subtree push.
$ git show HEAD:skills/repo-setup/templates/hooks/git_guard.py | grep -n -i five
54:Not blocked, because they are not among the five operations above: git checkout -f <branch>,
$ git show HEAD:skills/repo-setup/templates/hooks/git_guard.test.sh | sed -n 3,5p
# Blocked, push: git push with arguments, --force and --dry-run; behind -C, -c, --git-dir (both spellings), --attr-source (both spellings) and --no-pager; through an absolute path, a glob pattern in the command word, a backslash and quotes; behind an environment assignment, env (with -u), command -p, nohup, nice -n, time -p, timeout (with -s), sudo (with -u and -Eu), doas, stdbuf, setsid (with -f), unbuffer, ionice (with -c 3 and -c3 -n7), chrt (with -f), script (its -c or --command string, before and after its file, and the words after its file), xargs (with -I{}, -n, a redirection and the words an echo or printf pipes into it, appended or put in place of the string of -I{} and -I %), watch (with -n, --interval and a command in one string), find with -exec, -execdir, -ok and -okdir, eval (bare, quoted and after --) and exec; after cd &&, ;, ||, &, a newline, a line continuation and an arithmetic (( )) or $(( )) holding << or > (on the same line and the line before); in a subshell (also written with the operators run together), braces, after !, in if, for, while and case, after function NAME and coproc (with and without a name); in $( ), "$( )", $(( ) ) as a subshell, backticks, "` `", A=$( ), <( ) and nested $( ); in a word written as a brace expansion with a comma list (whole word, inside a word, nested, and with an empty alternative that bash removes); in a word written with $'...' escapes (\x, \u and octal) or as $"..."; in the word of ${x:-word}, ${x-word} and ${x:=word} (quoted, inside double quotes, nested and followed by a later }) in the command word; in sh -c, bash -c, bash -lc, sh -ec, env -S and a shell whose -c string follows further options (-c -- str, -c -e str, -c -x str, -c -o errexit str, combined as -co errexit and -eco pipefail, and after +o); in a here-document, a here-string, an echo pipe, an echo -e pipe and a printf pipe (the format with \n, \t, \x and octal escapes, typed and as a newline, and filled from its arguments by %s and %b) into a shell, also into bash -, bash -s and a shell given /dev/stdin or /dev/fd/0; through an alias given as -c alias.<name>=, as a ! alias (with the arguments git appends to it and with inline configuration carried into the git command it runs), as GIT_CONFIG_KEY_<n> with GIT_CONFIG_VALUE_<n>, as --config-env=<key>=<variable> (both spellings) and as GIT_CONFIG_PARAMETERS; after a redirection of file descriptors and a pipe.
# Blocked, reset, clean, checkout and restore: reset --hard in each position, behind -C and as the prefixes --har and --ha; clean with -f in each combined flag, --force and its prefix --forc, -fn and -c clean.requireForce set to false (empty, 00, -0, 0x0, 0k, 0G, OFF and false); checkout and restore with . ./ .. :/ * ** :(glob)** :(top) :(literal). :(literal)./ and exclude-only pathspec sets, with and without --, after -p, -s, --source= and revisions, and beside another path.
# Allowed: git branch -D, git worktree remove, git restore -- paths, git restore --staged --worktree -- paths, git restore --staged . and -S ., git checkout --theirs -- path, git checkout of a branch, -b, ./a, -- ../x.md and an exclude beside a path, -c core.excludesFile=f, git apply, git reset --soft, --help and HEAD -- path, git clean -n and -nd, git clean with clean.requireForce true, 1, 0x1, 1k, given with no value, or absent, git checkout and restore of :(literal)* and :(literal)**, git status, log, diff -- ., add -- ., stash list and an alias to status (also a ! alias to status and configuration from --config-env or GIT_CONFIG_PARAMETERS that names status); text that names git push inside echo, in single quotes, in a commit message, in grep, in a here-document not fed to a shell, in for-list words and in a case pattern; $((1 + 2)); a comment; ${x} without a command; a brace expansion (also one with an empty alternative outside the command word), a $'...' or $"..." word, the word of ${x:-word} outside the command word or inside double quotes, a shell option -o or -co with its value, arithmetic with << before git status, a printf %d or %% format, xargs -I{} and eval -- naming git status, a shell given a script file on a here-string, setsid, chrt and script (its -c string and the words after its file) naming git status, a glob word (also a pattern that names no character),  a printf or echo pipe, watch, find -exec, stdbuf, doas and a bash -c string that name git status or no git; a command with no git, an empty command, and a command the shell would refuse.
```

What the reading found: the "Blocked" list has four bullets (push, reset, clean, and checkout or restore) for the five operations; its opening line says "(they publish work or destroy it)"; lines 54 to 55 list `git checkout -f <branch>`, `git switch --discard-changes`, `git stash drop`, `git stash clear`, `git send-pack` and `git subtree push` as not blocked "because they are not among the five operations above"; `grep -n -i five` prints only that line. Test lines 3 to 5 name the push cases on line 3, the reset, clean, checkout and restore cases on line 4 and the allowed cases on line 5; no line names a forced checkout, a send-pack, a subtree, a stash or a switch. Each of these is what the brief says.

## DONE / NOT DONE

Every row is DONE. The output of each check is quoted in the section "Check outputs" below, under the number shown.

| Item | Status | Command that proves it and what it printed |
|---|---|---|
| What to build 1: `git_guard.py`: four entries of `_CHECKS`, the forced checkout in `_rule_checkout`, `subtree` found in any capital letters, the head comment | DONE | `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 \| tail -1` printed `PASS: git_guard.py scratch tests` (V2); entries at lines 1274 to 1284, rules at lines 1131 to 1157 and 1176 to 1192, texts at lines 203 to 207 |
| What to build 2: `git_guard.test.sh`: the cases as lines and `expect_line` calls, the head comment | DONE | 95 lines of the case file (lines 400 to 494), 7 `expect_line` calls (lines 526 to 532), head comment lines 4 to 6; the run in V2 passes; V5 shows the test failing on the base guard; the table shows each case failing under its change |
| What to build 3: `SKILL.md`, question 10, four sub-bullets | DONE | V8, "after", lines 126 to 129, the four texts of the brief |
| What to build 4: `README.md`, the `repo-setup` row | DONE | V8, "after", line 13, the sentence of the brief |
| What to build 5: `docs/dev/building.md`, the comment of the test's line | DONE | V8, "after", line 10, the comment of the brief |
| Verify 1: the plan's verify list through `checks.sh` | DONE | Exit 0; last line `checks: 11 commands passed` (V1) |
| Verify 2: the test under the default `python3` and under `/usr/bin/python3` | DONE | Both print `PASS: git_guard.py scratch tests`; `/usr/bin/python3 --version` printed `Python 3.9.6` (V2) |
| Verify 3: ruff check, ruff format, pyright | DONE | `All checks passed!`, `1 file already formatted`, `0 errors, 0 warnings, 0 informations`, each exit 0 (V3) |
| Verify 4: the ASCII grep over the guard and the test | DONE | Printed nothing; exit status 1, which `grep` gives for no match (V4) |
| Verify 5: the test on the base guard, each blocked case on the base guard | DONE | The test failed with `FAIL: block git send-pack ../remote.git main: expected exit 2, got 0: `, exit 1 (V5); each case's exit status is in the appendix |
| Verify 6: the table of "Cases" | DONE | The section "The table of the cases" below: 39 rows, one per behaviour of B1 to B10 and B8a, the five preserved lines included |
| Verify 7: the grep of the names across `skills utils docs README.md` | DONE | V7: every hit is in one of the five changed files and written by this change; no hit of `destroy it` or `five operations` remains |
| Verify 8: the three page texts before and after, and the grep of the skills for a forced checkout | DONE | V8 |
| Verify 9: the head comments reread against the code | DONE | The section "Head comments reread" below |
| Verify 10: the added and changed sentences of pages and skills read against the standards | DONE | The section "Sentences longer than the standards allow" below |

## Check outputs

### V1

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-g-git-guard/orchestrator-state.md`, run from the worktree's root, exit 0 (`echo "exit $?"` printed `exit 0`). It printed:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

### V2

`sh skills/repo-setup/templates/hooks/git_guard.test.sh` (output and exit status kept in a file):

```
PASS: git_guard.py scratch tests
exit 0
```

`PATH=/usr/bin:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh` runs the guard under `/usr/bin/python3`; then `/usr/bin/python3 --version`:

```
PASS: git_guard.py scratch tests
exit 0
Python 3.9.6
```

### V3

`ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py`, `ruff format --check --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py` and `pyright skills/repo-setup/templates/hooks/git_guard.py`, each with its exit status appended:

```
All checks passed!
exit 0
1 file already formatted
exit 0
0 errors, 0 warnings, 0 informations
exit 0
```

### V4

`LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.py skills/repo-setup/templates/hooks/git_guard.test.sh` printed nothing; the exit status line:

```
exit 1
```

`grep -c "$(printf '\t')"` over the two files printed `0` for each (no literal tab in either).

### V5

`GIT_GUARD=<scratch>/git_guard_base.py sh skills/repo-setup/templates/hooks/git_guard.test.sh` (the finished test, the guard at the base):

```
FAIL: block git send-pack ../remote.git main: expected exit 2, got 0: 
exit 1
```

The test stops at its first failure. Each blocked case of B1, B2, B4, B6, B8, B9 and B10, the five preserved lines left out, was fed to the base guard by a scratch copy of the finished test (`nonstop_status.test.sh`: the test's own `write_request` and `run_guard`, with `fail` printing and going on and one `exit <status>: <case>` line printed after each run). Its 54 `FAIL:` lines are those of the first run (`cmp` printed nothing), and the exit status of every case is in the appendix "Exit statuses on the unchanged tree". Run against the finished guard the same copy printed 0 `FAIL:` lines over 444 cases (`grep -c '^FAIL'` and `grep -c '^exit'` over its output), 288 of them `exit 2`.

### V7

`grep -rn -i 'send-pack\|subtree push\|stash drop\|stash clear\|discard-changes\|checkout --force\|checkout -f\|destroy it\|five operations' skills utils docs README.md`, then `echo "exit $?"`:

```
skills/repo-setup/SKILL.md:126:    - It is a hook that refuses, in an agent's commands, the git commands that publish work or discard it: `git push`, `git send-pack`, `git subtree push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`.
skills/repo-setup/templates/hooks/git_guard.py:26:alias named subtree is expanded when the command is not a subtree push, since git runs it where it
skills/repo-setup/templates/hooks/git_guard.py:32:- git send-pack, with any arguments, --dry-run included.
skills/repo-setup/templates/hooks/git_guard.py:33:- git subtree push, found after the options of git subtree and their values (-P sub, -qP sub,
skills/repo-setup/templates/hooks/git_guard.py:47:  the new branch's name, as in -bfix). git checkout -f -- <path> is blocked too.
skills/repo-setup/templates/hooks/git_guard.py:48:- git switch with --discard-changes or a prefix of it (--di and longer), with --force, or with a
skills/repo-setup/templates/hooks/git_guard.py:51:- git stash drop and git stash clear, the subcommand being the first word after stash, written
skills/repo-setup/templates/hooks/git_guard.py:203:_SEND_PACK_RULE = "git send-pack is run by the user by hand"
skills/repo-setup/templates/hooks/git_guard.py:204:_SUBTREE_RULE = "git subtree push is run by the user by hand"
skills/repo-setup/templates/hooks/git_guard.py:206:_SWITCH_RULE = "git switch --discard-changes discards work and is run by the user by hand"
skills/repo-setup/templates/hooks/git_guard.py:207:_FORCE_RULE = "git checkout --force discards work and is run by the user by hand"
skills/repo-setup/templates/hooks/git_guard.py:1151:            _is_long(option, "--discard-changes", 4)
skills/repo-setup/templates/hooks/git_guard.py:1276:    "send-pack": _rule_send_pack,
skills/repo-setup/templates/hooks/git_guard.test.sh:5:# Blocked, send-pack, subtree, stash and switch: send-pack with --dry-run and --all, behind -C and behind sudo; subtree push after -P, --prefix=, --pref, -q --prefix, -Psub, -qP, --rejoin -m, --annotate -b --onto, --p, --pr and --, with the word subtree written SUBTREE and Subtree, git push after a semicolon that ends git subtree -P, and through an alias named subtree; stash drop (also with -q or a stash name, and behind env) and stash clear; switch with --discard-changes (also after the branch), --discard, --di, -f, --force, -qf, -fc with a start point, -f -c and behind -c core.pager=cat; and an alias given as -c alias.<name>= to stash drop, send-pack, switch -f and checkout -f, and an alias named stash reached as Stash.
skills/repo-setup/templates/hooks/git_guard.test.sh:400:block git send-pack ../remote.git main
skills/repo-setup/templates/hooks/git_guard.test.sh:401:block git send-pack --dry-run ../remote.git main
skills/repo-setup/templates/hooks/git_guard.test.sh:402:block git send-pack --all ../remote.git
skills/repo-setup/templates/hooks/git_guard.test.sh:403:block git -C /tmp/x send-pack ../remote.git main
skills/repo-setup/templates/hooks/git_guard.test.sh:404:block sudo git send-pack ../remote.git main
skills/repo-setup/templates/hooks/git_guard.test.sh:405:block git subtree push --prefix=sub origin main
skills/repo-setup/templates/hooks/git_guard.test.sh:409:block git subtree push -Psub origin main
skills/repo-setup/templates/hooks/git_guard.test.sh:418:block git Subtree push -P sub origin main
skills/repo-setup/templates/hooks/git_guard.test.sh:438:block git stash drop
skills/repo-setup/templates/hooks/git_guard.test.sh:439:block git stash drop -q
skills/repo-setup/templates/hooks/git_guard.test.sh:440:block git stash drop 'stash@{0}'
skills/repo-setup/templates/hooks/git_guard.test.sh:441:block git stash clear
skills/repo-setup/templates/hooks/git_guard.test.sh:442:block env git stash clear
skills/repo-setup/templates/hooks/git_guard.test.sh:451:block git switch --discard-changes main
skills/repo-setup/templates/hooks/git_guard.test.sh:452:block git switch main --discard-changes
skills/repo-setup/templates/hooks/git_guard.test.sh:471:block git checkout -f other
skills/repo-setup/templates/hooks/git_guard.test.sh:472:block git checkout --force other
skills/repo-setup/templates/hooks/git_guard.test.sh:475:block git checkout -f
skills/repo-setup/templates/hooks/git_guard.test.sh:478:block git checkout -fb new
skills/repo-setup/templates/hooks/git_guard.test.sh:479:block git checkout -f -b new
skills/repo-setup/templates/hooks/git_guard.test.sh:480:block git checkout -f -- f
skills/repo-setup/templates/hooks/git_guard.test.sh:489:block git -c alias.d='stash drop' d
skills/repo-setup/templates/hooks/git_guard.test.sh:490:block git -c alias.sp=send-pack sp origin main
skills/repo-setup/templates/hooks/git_guard.test.sh:492:block git -c alias.co='checkout -f' co other
skills/repo-setup/templates/hooks/git_guard.test.sh:526:expect_line 'git send-pack ../remote.git main' 'git-guard: blocked: git send-pack ../remote.git main (git send-pack is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:527:expect_line 'git subtree push --prefix=sub origin main' 'git-guard: blocked: git subtree push --prefix=sub origin main (git subtree push is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:528:expect_line 'git stash drop' 'git-guard: blocked: git stash drop (git stash drop discards stashed work and is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:529:expect_line 'git stash clear' 'git-guard: blocked: git stash clear (git stash clear discards stashed work and is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:530:expect_line 'git switch -f main' 'git-guard: blocked: git switch -f main (git switch --discard-changes discards work and is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:531:expect_line 'git checkout -f other' 'git-guard: blocked: git checkout -f other (git checkout --force discards work and is run by the user by hand)'
skills/repo-setup/templates/hooks/git_guard.test.sh:532:expect_line 'git checkout -f .' 'git-guard: blocked: git checkout -f . (git checkout with a whole-tree pathspec discards work and is run by the user by hand)'
docs/dev/building.md:10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, send-pack, subtree push, reset --hard, clean --force, checkout and restore of the whole tree, checkout --force, switch --discard-changes, stash drop and clear, reached through separators, substitutions, wrappers, shells and aliases) and on the commands it must let through
exit 0
```

Each hit, by file (all are written by this change; the file's other lines are not hits):

- `skills/repo-setup/SKILL.md:126`: the first sub-bullet of question 10, written by item 3.
- `docs/dev/building.md:10`: the comment of the test's line, written by item 5.
- `skills/repo-setup/templates/hooks/git_guard.py:26 32 33 47 48 51 203 204 206 207 1151 1276`: the alias sentence and the bullets of the head comment (item 1 and R1), the rule texts `_SEND_PACK_RULE`, `_SUBTREE_RULE`, `_SWITCH_RULE` and `_FORCE_RULE`, the `--discard-changes` clause of `_rule_switch` and the `send-pack` entry of `_CHECKS`.
- `skills/repo-setup/templates/hooks/git_guard.test.sh:5`: the head comment line of the new blocked cases; lines 400 to 494: case-file lines; lines 526 to 531: `expect_line` calls.
- No hit is in another file: `docs/roadmap.md` entry 2.G states the goal with the five it was opened on and is changed only through `/roadmap`, and the goal stays true; it holds none of the searched words. The other places that name the guard (`skills/repo-setup/SKILL.md` lines 3, 28, 42, 60, 80, 154, 189 and 190, `README.md` lines 64 and 113, `docs/dev/change-standard.md` line 71) name the hook, its copy and its test and list no blocked command (read from `grep -rn -i 'git guard\|git_guard\|git-guard' skills utils docs README.md`), so the change does not make them false.

```
$ grep -rn -i 'destroy it\|five operations' skills utils docs README.md
exit 1
```

### V8

Before, from `git show HEAD:<page>`:

```
$ git show HEAD:skills/repo-setup/SKILL.md | grep -n "It is a hook that refuses" -A3
126:    - It is a hook that refuses `git push`, `git reset --hard`, `git clean` with force and `git checkout` or `git restore` of the whole tree in an agent's commands, which the user then runs by hand; it is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself, and it needs `python3` 3.9 or later.
127-
128-## The tree
129-
$ git show HEAD:README.md | grep -n "It can install the git guard"
13:| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. It can install the git guard, a hook that refuses an agent's `git push`, `git reset --hard`, forced `git clean` and whole-tree `git checkout` or `git restore`, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
$ git show HEAD:docs/dev/building.md | grep -n "git_guard.test.sh"
10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clean --force, checkout and restore of the whole tree, reached through separators, substitutions, wrappers, shells and aliases) and on the commands it must let through
```

After, from the worktree:

```
$ grep -n 'It is a hook that refuses' -A3 skills/repo-setup/SKILL.md
126:    - It is a hook that refuses, in an agent's commands, the git commands that publish work or discard it: `git push`, `git send-pack`, `git subtree push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`.
127-    - The user runs these by hand.
128-    - The hook is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself.
129-    - It needs `python3` 3.9 or later.
$ grep -n 'It can install the git guard' README.md
13:| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. It can install the git guard, a hook that refuses in an agent's commands the git commands that publish work or discard it, such as `git push` and `git reset --hard`, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
$ grep -n 'git_guard.test.sh' docs/dev/building.md
10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, send-pack, subtree push, reset --hard, clean --force, checkout and restore of the whole tree, checkout --force, switch --discard-changes, stash drop and clear, reached through separators, substitutions, wrappers, shells and aliases) and on the commands it must let through
```

The grep of the skills for a forced checkout, on the tree at the base (`HEAD`) and on the finished tree:

```
$ git grep -n -E checkout HEAD -- skills utils ':!skills/repo-setup/templates/hooks' | grep -E ' -[A-Za-z]*f[A-Za-z]*( |$)| --f[a-z-]*'
HEAD:skills/diagnose/SKILL.md:176:    - Done when the grep of the tag over the tree the probes ran in prints nothing, and the scratch copy, removed with `git worktree remove --force "$tmp/tree"` from the main checkout, and every throwaway file are gone, a credential or `.env` file copied into `$TMPDIR` among them.
exit 0
```

```
$ git grep -n -E checkout -- skills utils ':!skills/repo-setup/templates/hooks' | grep -E ' -[A-Za-z]*f[A-Za-z]*( |$)| --f[a-z-]*'
skills/diagnose/SKILL.md:176:    - Done when the grep of the tag over the tree the probes ran in prints nothing, and the scratch copy, removed with `git worktree remove --force "$tmp/tree"` from the main checkout, and every throwaway file are gone, a credential or `.env` file copied into `$TMPDIR` among them.
skills/repo-setup/SKILL.md:126:    - It is a hook that refuses, in an agent's commands, the git commands that publish work or discard it: `git push`, `git send-pack`, `git subtree push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`.
exit 0
```

Each line read: `skills/diagnose/SKILL.md:176` is `git worktree remove --force "$tmp/tree"`, a forced worktree removal on a line that also holds the word "checkout" ("the main checkout"); it is not a forced `git checkout`. `skills/repo-setup/SKILL.md:126` appears only on the finished tree: it is the new text of question 10, which names `git checkout --force` as a command the hook refuses; it runs nothing. No skill and no script under `utils/` runs a forced `git checkout`. The grep for any `git switch`, on the tree at the base (`HEAD`) and on the finished tree:

```
$ git grep -n 'git switch\|[a-z"] switch ' HEAD -- skills utils ':!skills/repo-setup/templates/hooks'
exit 1
```

```
$ git grep -n 'git switch\|[a-z"] switch ' -- skills utils ':!skills/repo-setup/templates/hooks'
skills/repo-setup/SKILL.md:126:    - It is a hook that refuses, in an agent's commands, the git commands that publish work or discard it: `git push`, `git send-pack`, `git subtree push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`.
exit 0
```

On the tree at the base it printed nothing (exit 1, no match), as the brief says: no skill and no script under `utils/` runs `git switch`. On the finished tree its one hit is the new text of question 10, which names `git switch --discard-changes` as a command the hook refuses; it runs nothing.

## The table of the cases

Five columns: the behaviour; the case; the run on the unchanged tree (the `FAIL:` line for a blocked case, the passing run for a control or a preserved line); the change made in a scratch copy of the finished guard; the `FAIL:` line the test printed against that copy. Every change is one edit of a scratch copy under `$TMPDIR` (`m_<id>.py`, made by one script from the finished guard); the worktree's guard is unchanged by them. The test is run through `GIT_GUARD=<copy>` under `PATH=/usr/bin:$PATH sh git_guard.test.sh`. The test stops at its first failure; where that failure is an earlier case than the row's, the fifth column quotes the row's own case from a non-stop copy of the test (the same file with `fail` printing and going on, made by `mkscratch2.py`) and says so.

| Behaviour | Case | Unchanged tree | Change | With the change |
|---|---|---|---|---|
| git send-pack blocked with any arguments | B1: `block git send-pack ../remote.git main` | `FAIL: block git send-pack ../remote.git main: expected exit 2, got 0: ` | Remove the entry `"send-pack": _rule_send_pack,` from `_CHECKS`. | `FAIL: block git send-pack ../remote.git main: expected exit 2, got 0: ` |
| git subtree push blocked | B2: `block git subtree push --prefix=sub origin main` | `FAIL: block git subtree push --prefix=sub origin main: expected exit 2, got 0: ` | In `_rule_subtree`, `arguments[index] == "push"` becomes `arguments[index] == "pus"`. | `FAIL: block git subtree push --prefix=sub origin main: expected exit 2, got 0: ` |
| -P, -b and -m take a value, also inside a word of short options | B2: `block git subtree -P sub push origin main` | `FAIL: block git subtree -P sub push origin main: expected exit 2, got 0: ` | Remove `"-P"` from `_SUBTREE_VALUED`. | `FAIL: block git subtree -P sub push origin main: expected exit 2, got 0: ` |
| a long option of git subtree is read at any length from one letter | B2: `block git subtree --pref sub push origin main` | `FAIL: block git subtree --pref sub push origin main: expected exit 2, got 0: ` | `range(1, len(name) + 1)` in `_SUBTREE_VALUED` becomes `range(len(name), len(name) + 1)`. | `FAIL: block git subtree --pref sub push origin main: expected exit 2, got 0: ` |
| the word after -- is the subtree command | B2: `block git subtree -P sub -- push origin main` | `FAIL: block git subtree -P sub -- push origin main: expected exit 2, got 0: ` | `_rule_subtree` reads only the words before a `--`. | `FAIL: block git subtree -P sub -- push origin main: expected exit 2, got 0: ` |
| the word subtree is matched in any capital letters | B2: `block git SUBTREE -P sub push origin main` | `FAIL: block git SUBTREE -P sub push origin main: expected exit 2, got 0: ` | `is_program = name in _PROGRAMS` becomes `is_program = subcommand in _PROGRAMS`. | `FAIL: block git SUBTREE -P sub push origin main: expected exit 2, got 0: ` |
| an alias named subtree is expanded when the rule blocks nothing | B2 (preserved): `block git -c alias.subtree=push subtree origin main` | passes: `exit 2: block git -c alias.subtree=push subtree origin main` | In `_check_git`, `if not is_program:` and its `return None` become an unconditional `return None`. | `FAIL: block git -c alias.subtree=push subtree origin main: expected exit 2, got 0: ` |
| the same, with the subcommand written SUBTREE | B2 (preserved): `block git -c alias.subtree=push SUBTREE origin main` | passes: `exit 2: block git -c alias.subtree=push SUBTREE origin main` | The same change as the row above. | `FAIL: block git -c alias.subtree=push SUBTREE origin main: expected exit 2, got 0: ` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: block git -c alias.subtree=push subtree origin main: expected exit 2, got 0: `)) |
| a subtree command that ends after an option does not stop the reading of the next simple command | B2 (preserved): `block git subtree -P; git push` | passes: `exit 2: block git subtree -P; git push` | In `_check_text`, `if isinstance(outcome, str): return outcome` becomes `if not isinstance(outcome, list): return outcome`, so a git command that gives None ends the reading. | `FAIL: block git subtree -P; git push: expected exit 2, got 0: ` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: block cd x && git push: expected exit 2, got 0: `)) |
| a folder or a remote named push after an option or a value is not the subcommand | B3: `allow git subtree split -P push` | passes: `exit 0: allow git subtree split -P push` | `if index < len(arguments) and arguments[index] == "push":` becomes `if "push" in arguments:`. | `FAIL: allow git subtree split -P push: expected exit 0, got 2: git-guard: blocked: git subtree split -P push (git subtree push is run by the user by hand)` |
| words that end before a subtree command (git subtree, -P, --, --prefix, -qP) give None and no traceback | B3: `allow git subtree` | passes: `exit 0: allow git subtree` | Remove `index < len(arguments) and ` from that condition. Full output of the test's first `FAIL:` (its case is `block git subtree -P; git push`, exit 1): appendix "Outputs quoted whole", b3b. | `FAIL: allow git subtree: expected exit 0, got 1: Traceback (most recent call last): ... (traceback, see the appendix)` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: block git subtree -P; git push: expected exit 2, got 1: Traceback (most recent call last):`)) |
| an empty word after subtree gives no traceback | B3: `allow git subtree ''` | passes: `exit 0: allow git subtree ''` | The condition compares `arguments[index][0] == "p"` in place of `arguments[index] == "push"`. | `FAIL: allow git subtree '': expected exit 0, got 1: Traceback (most recent call last): ... (traceback, see the appendix)` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: allow git subtree pull -P sub origin main: expected exit 0, got 2: git-guard: blocked: git subtree pull -P sub origin main (git subtree push is run by the user by hand)`)) |
| git stash drop blocked | B4: `block git stash drop` | `FAIL: block git stash drop: expected exit 2, got 0: ` | In `_rule_stash`, `("drop", "clear")` becomes `("clear",)`. | `FAIL: block git stash drop: expected exit 2, got 0: ` |
| git stash clear blocked | B4: `block git stash clear` | `FAIL: block git stash clear: expected exit 2, got 0: ` | `("drop", "clear")` becomes `("drop",)`. | `FAIL: block git stash clear: expected exit 2, got 0: ` |
| only the first word after stash is the subcommand | B5: `allow git stash push -m drop` | passes: `exit 0: allow git stash push -m drop` | `arguments[0] in ("drop", "clear")` becomes `any(word in ("drop", "clear") for word in arguments)`. | `FAIL: allow git stash push -m drop: expected exit 0, got 2: git-guard: blocked: git stash push -m drop (git stash push discards stashed work and is run by the user by hand)` |
| an empty word after stash gives no traceback | B5: `allow git stash ''` | passes: `exit 0: allow git stash ''` | `arguments[0] in ("drop", "clear")` becomes `arguments[0][0] in "dc"`. Full output: appendix "Outputs quoted whole", b5b. | `FAIL: allow git stash '': expected exit 0, got 1: Traceback (most recent call last): ... (traceback, see the appendix)` |
| git switch --discard-changes blocked | B6: `block git switch --discard-changes main` | `FAIL: block git switch --discard-changes main: expected exit 2, got 0: ` | Remove the clause `_is_long(option, "--discard-changes", 4)` from `_rule_switch`. | `FAIL: block git switch --discard-changes main: expected exit 2, got 0: ` |
| a prefix of --discard-changes from --di blocked | B6: `block git switch --discard main` | `FAIL: block git switch --discard main: expected exit 2, got 0: ` | `_is_long(option, "--discard-changes", 4)` becomes `_is_long(option, "--discard-changes", 17)`. | `FAIL: block git switch --discard main: expected exit 2, got 0: ` |
| git switch --force blocked | B6: `block git switch --force main` | `FAIL: block git switch --force main: expected exit 2, got 0: ` | Remove the clause `option == "--force"` from `_rule_switch`. | `FAIL: block git switch --force main: expected exit 2, got 0: ` |
| -f in a word of short options before any c or C blocked | B6: `block git switch -f main` | `FAIL: block git switch -f main: expected exit 2, got 0: ` | Remove the clause `_is_short_before(option, "f", "cC")` from `_rule_switch`. | `FAIL: block git switch -f main: expected exit 2, got 0: ` |
| what follows c or C is the branch name, not options (-cfix) | B7: `allow git switch -cfix` | passes: `exit 0: allow git switch -cfix` | `_is_short_before(option, "f", "cC")` becomes `_is_short_before(option, "f", "")`. | `FAIL: allow git switch -cfix: expected exit 0, got 2: git-guard: blocked: git switch -cfix (git switch --discard-changes discards work and is run by the user by hand)` |
| --force is matched whole, so --forc is not blocked | B7: `allow git switch --forc main` | passes: `exit 0: allow git switch --forc main` | `option == "--force"` becomes `_is_long(option, "--force", 3)`. | `FAIL: allow git switch --forc main: expected exit 0, got 2: git-guard: blocked: git switch --forc main (git switch --discard-changes discards work and is run by the user by hand)` |
| --d is not a prefix of --discard-changes for the rule | B7: `allow git switch --d main` | passes: `exit 0: allow git switch --d main` | `_is_long(option, "--discard-changes", 4)` becomes `_is_long(option, "--discard-changes", 3)`. | `FAIL: allow git switch --d main: expected exit 0, got 2: git-guard: blocked: git switch --d main (git switch --discard-changes discards work and is run by the user by hand)` |
| git checkout --force blocked | B8: `block git checkout --force other` | `FAIL: block git checkout --force other: expected exit 2, got 0: ` | In `_rule_checkout`, remove the clause `_is_long(option, "--force", 3)`. | `FAIL: block git checkout --force other: expected exit 2, got 0: ` |
| a prefix of --force from --f blocked | B8: `block git checkout --forc other` | `FAIL: block git checkout --forc other: expected exit 2, got 0: ` | `_is_long(option, "--force", 3)` becomes `_is_long(option, "--force", 7)`. | `FAIL: block git checkout --forc other: expected exit 2, got 0: ` |
| -f in a word of short options before any b or B blocked | B8: `block git checkout -f other` | `FAIL: block git checkout -f other: expected exit 2, got 0: ` | Remove the clause `_is_short_before(option, "f", "bB")` from `_rule_checkout`. | `FAIL: block git checkout -f other: expected exit 2, got 0: ` |
| what follows b or B is the branch name, not options (-bfix) | B8a: `allow git checkout -bfix` | passes: `exit 0: allow git checkout -bfix` | `_is_short_before(option, "f", "bB")` becomes `_is_short_before(option, "f", "")`. | `FAIL: allow git checkout -bfix: expected exit 0, got 2: git-guard: blocked: git checkout -bfix (git checkout --force discards work and is run by the user by hand)` |
| --no-force is not --force | B8a: `allow git checkout --no-force other` | passes: `exit 0: allow git checkout --no-force other` | `_is_long(option, "--force", 3)` becomes `option.endswith("force") or _is_long(option, "--force", 3)`. | `FAIL: allow git checkout --no-force other: expected exit 0, got 2: git-guard: blocked: git checkout --no-force other (git checkout --force discards work and is run by the user by hand)` |
| a word after -- is a path, not an option (main -- -f) | B8a: `allow git checkout main -- -f` | passes: `exit 0: allow git checkout main -- -f` | In `_rule_checkout`, `for option in _options(arguments):` becomes `for option in arguments:`. | `FAIL: allow git checkout main -- -f: expected exit 0, got 2: git-guard: blocked: git checkout main -- -f (git checkout --force discards work and is run by the user by hand)` |
| an alias to stash drop, send-pack, switch -f or checkout -f is expanded and then blocked | B9: `block git -c alias.d='stash drop' d` | `FAIL: block git -c alias.d='stash drop' d: expected exit 2, got 0: ` | In `_check_git`, `expansion = config.get("alias." + name)` becomes `expansion = None`. The same run prints the `FAIL:` lines of the other three alias cases (`sp`, `sw`, `co`) in the appendix "Outputs quoted whole", b9a; the first is quoted here. | `FAIL: block git -c alias.d='stash drop' d: expected exit 2, got 0: ` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: block git -c alias.p=push p: expected exit 2, got 0: `)) |
| an alias to stash list is allowed | B9: `allow git -c alias.sl='stash list' sl` | passes: `exit 0: allow git -c alias.sl='stash list' sl` | `_rule_stash` returns `_STASH_RULE.format("drop")` for any arguments. | `FAIL: allow git -c alias.sl='stash list' sl: expected exit 0, got 2: git-guard: blocked: git -c alias.sl=stash list sl (git stash drop discards stashed work and is run by the user by hand)` (non-stop copy of the test (the test's own first `FAIL:` is `FAIL: allow git stash list: expected exit 0, got 2: git-guard: blocked: git stash list (git stash drop discards stashed work and is run by the user by hand)`)) |
| an alias named stash is reached as Stash and expanded, since only subtree is matched in any capital letters | B9 (preserved): `block git -c alias.stash=push Stash` | passes: `exit 2: block git -c alias.stash=push Stash` | `_CHECKS.get(name if is_program else subcommand)` becomes `_CHECKS.get(name)`. | `FAIL: block git -c alias.stash=push Stash: expected exit 2, got 0: ` |
| the send-pack line | B10: `git send-pack ../remote.git main` | `FAIL: git send-pack ../remote.git main: expected exit 2, got 0: ` | `_SEND_PACK_RULE` reads `git send-pack is run by hand`. | `FAIL: git send-pack ../remote.git main: expected the line [git-guard: blocked: git send-pack ../remote.git main (git send-pack is run by the user by hand)], got: git-guard: blocked: git send-pack ../remote.git main (git send-pack is run by hand)` |
| the subtree push line | B10: `git subtree push --prefix=sub origin main` | `FAIL: git subtree push --prefix=sub origin main: expected exit 2, got 0: ` | `_SUBTREE_RULE` reads `git subtree push is run by hand`. | `FAIL: git subtree push --prefix=sub origin main: expected the line [git-guard: blocked: git subtree push --prefix=sub origin main (git subtree push is run by the user by hand)], got: git-guard: blocked: git subtree push --prefix=sub origin main (git subtree push is run by hand)` |
| the stash drop line | B10: `git stash drop` | `FAIL: git stash drop: expected exit 2, got 0: ` | `_rule_stash` formats `_STASH_RULE` with `"clear"` in place of `arguments[0]`. | `FAIL: git stash drop: expected the line [git-guard: blocked: git stash drop (git stash drop discards stashed work and is run by the user by hand)], got: git-guard: blocked: git stash drop (git stash clear discards stashed work and is run by the user by hand)` |
| the stash clear line | B10: `git stash clear` | `FAIL: git stash clear: expected exit 2, got 0: ` | `_rule_stash` formats `_STASH_RULE` with `"drop"` in place of `arguments[0]`. | `FAIL: git stash clear: expected the line [git-guard: blocked: git stash clear (git stash clear discards stashed work and is run by the user by hand)], got: git-guard: blocked: git stash clear (git stash drop discards stashed work and is run by the user by hand)` |
| the switch line | B10: `git switch -f main` | `FAIL: git switch -f main: expected exit 2, got 0: ` | `_SWITCH_RULE` reads `git switch --force discards work and ...`. | `FAIL: git switch -f main: expected the line [git-guard: blocked: git switch -f main (git switch --discard-changes discards work and is run by the user by hand)], got: git-guard: blocked: git switch -f main (git switch --force discards work and is run by the user by hand)` |
| the forced checkout line | B10: `git checkout -f other` | `FAIL: git checkout -f other: expected exit 2, got 0: ` | `_FORCE_RULE` reads `git checkout -f discards work and ...`. | `FAIL: git checkout -f other: expected the line [git-guard: blocked: git checkout -f other (git checkout --force discards work and is run by the user by hand)], got: git-guard: blocked: git checkout -f other (git checkout -f discards work and is run by the user by hand)` |
| the whole-tree rule's text wins over the forced checkout's for `git checkout -f .` | B10 (preserved): `git checkout -f .` | passes: `exit 2: line git checkout -f .` | In `_rule_checkout`, the force loop runs before the whole-tree test. | `FAIL: git checkout -f .: expected the line [git-guard: blocked: git checkout -f . (git checkout with a whole-tree pathspec discards work and is run by the user by hand)], got: git-guard: blocked: git checkout -f . (git checkout --force discards work and is run by the user by hand)` |

## Head comments reread

Each sentence about the file as a whole (its introduction, its head comment, an 'every' or an 'only') was reread against the finished code, and each is listed with the line that shows it holds. Files: `skills/repo-setup/templates/hooks/git_guard.py` (guard) and `skills/repo-setup/templates/hooks/git_guard.test.sh` (test).

| Sentence | Line that shows it holds |
|---|---|
| Guard, opening line and the paragraph on input: a string `command` of `tool_input` is checked whatever the tool; any other input is allowed | guard lines 1287 to 1299 (`_command_of`) and 1302 to 1311 (`main`); the test's input cases, lines 540 to 560 |
| Guard, the paragraph on the lexer and on where the command word is git | unchanged code: `_Lexer`, `_check_simple` (guard line 802); not made false by this change |
| Guard: "An alias defined by that configuration is expanded, except one named as a built-in command that the list below checks, which git ignores. An alias named subtree is expanded when the command is not a subtree push, since git runs it where it finds no program git-subtree." (lines 24 to 27) | guard lines 1046 to 1055 (`name`, `is_program`, the rule returning at 1050 to 1054, `expansion = config.get(...)` at 1055); the cases `block git -c alias.subtree=push subtree origin main` and `block git -c alias.subtree=push SUBTREE origin main` (test lines 420 and 421) pass, and the case `block git -c alias.stash=push Stash` (line 493) passes. A probe in a scratch repository under a scratch home with git 2.49.0: `git -c alias.stash=status stash list` ran the stash command (git ignored the alias), and `git -c alias.subtree='!echo ran-alias' subtree` printed git-subtree's own usage and not `ran-alias` (git ran the program first) |
| Guard: "An alias that starts with ! is checked as its text followed by the arguments git appends, and the inline configuration is carried into the git commands that text runs." | guard lines 1059 to 1061 (the `!` branch of `_check_git`, unchanged) |
| Guard: "Blocked, because the user runs these by hand (they publish work or discard it):" and its nine bullets | `_CHECKS`, guard lines 1274 to 1284: push, send-pack, subtree, reset, clean, checkout, restore, stash, switch; the rules at lines 1127 (push), 1131 (send-pack), 1135 (subtree), 1142 (stash), 1148 (switch), 1159 (reset), 1165 (clean), 1176 (checkout) and 1194 (restore) |
| Guard: "git push, with any arguments, --dry-run included." and "git send-pack, with any arguments, --dry-run included." | guard lines 1127 and 1131 return the rule text for any arguments; cases `block git push --dry-run` (test line 69) and `block git send-pack --dry-run ../remote.git main` (line 401) |
| Guard: the subtree bullet (options and their values, -P sub, -qP sub, -Psub, --prefix=sub, --prefix sub, --p sub, -- before the subcommand, matched whatever its capital letters) | guard lines 189 to 196 (`_PROGRAMS`, `_SUBTREE_VALUED`) and 1135 to 1139; test lines 405 to 421 and 422 to 437 |
| Guard: the reset, clean and whole-tree bullets | unchanged code (lines 1159 to 1174, 1176 to 1187 and 1194 to 1208); their cases in the test pass |
| Guard: "git checkout with --force or a long option that is a prefix of it (--f and longer), or with a short-option word holding f before any b or B (-f, -qf, -fb; ...). git checkout -f -- <path> is blocked too." | guard lines 1188 to 1191 (`_is_long(option, "--force", 3)`, `_is_short_before(option, "f", "bB")`, over `_options`, the words before `--`), `_is_short_before` at line 1094; test lines 471 to 480 (blocked) and 481 to 488 (controls) |
| Guard: "git switch with --discard-changes or a prefix of it (--di and longer), with --force, or with a short-option word holding f before any c or C (-f, -qf, -fc; ...)" | guard lines 1148 to 1157; test lines 451 to 460 (blocked) and 461 to 470 (controls) |
| Guard: "git stash drop and git stash clear, the subcommand being the first word after stash, written whole." | guard lines 1142 to 1146; test lines 438 to 442 (blocked) and 443 to 450 (controls) |
| Guard: "Allowed, so the plan skills' own commands run: everything else, among it git branch -D, ..., git checkout <branch>, git checkout -b, ..." and the two sentences after it | test lines 167 to 194 (the allowed cases of the plan skills' commands) pass; `allow git checkout main`, `allow git checkout -b x-land main`, `allow git checkout --theirs -- a.bin`; the unbalanced-quote case at line 208 and the nesting cases at lines 572 to 608 |
| Guard: "Not seen: ... a git program run by its own path, such as .../git-core/git-push; and any form of shell syntax this list of forms does not name." | a probe: `printf '%s' '{"tool_name":"Bash","tool_input":{"command":"/usr/lib/git-core/git-push origin main"}}' | python3 skills/repo-setup/templates/hooks/git_guard.py` exited 0 (`git-core path: exit 0`), and the same for `/usr/lib/git-core/git-send-pack ../r main` (`exit 0`); `_is_git` (line 758) matches a command word that is git or a glob of it |
| Guard: "Not blocked: git switch -C and --force-create, which move a branch and keep the changes in the tree, and git stash pop, which applies the stash before it drops it." | test cases `allow git switch -C new`, `allow git switch --force-create new` and `allow git stash pop` (lines 465, 466 and 445) pass; the brief's probes give the behaviour of the two git commands |
| Guard: "Output and exit status. ... Exit 0 ... Exit 2 ... one line on stderr" and "The first blocked simple command decides. The script reads stdin only and prints nothing else." | guard lines 1302 to 1311 (`main`); `_check_text` returns at the first string; the test's `expect_block` and `expect_line` (test lines 33 and 56) |
| Test, line 2: each case one command with the result the guard must give; a blocked case exits 2 with exactly one stderr line starting `git-guard: blocked: ` and nothing on stdout; an allowed case exits 0 with nothing on stderr or stdout | test lines 33 to 47 (`expect_block`, `expect_allow`), each case run by the loop at line 509 |
| Test, line 2: "The test never runs git." | `grep -n '^[[:space:]]*git ' skills/repo-setup/templates/hooks/git_guard.test.sh` printed nothing (exit 1); the cases are text fed to the guard |
| Test, line 2: "GIT_GUARD names another script to test, such as a scratch copy with one block removed." | test line 21, `guard=${GIT_GUARD:-$script_dir/git_guard.py}`; every row of the table used it |
| Test, line 4: the checkout cases now name `-f`, `--force` and its prefixes `--forc` and `--f`, a word of short options (`-qf`, `-fb`), `other -f`, alone, `-f -b new` and before `-- path` | test lines 471 to 480 hold exactly these; the reset, clean and restore items of the line are unchanged and their cases are in lines 132 to 166 |
| Test, line 5 (new label): send-pack with --dry-run and --all, behind -C and sudo; subtree push after each named option form, written SUBTREE and Subtree, `git push` after a semicolon that ends `git subtree -P`, through an alias named subtree; stash drop with -q or a stash name and behind env, stash clear; switch with --discard-changes also after the branch, --discard, --di, -f, --force, -qf, -fc with a start point, -f -c and behind -c core.pager=cat; and an alias to stash drop, send-pack, switch -f and checkout -f, and an alias named stash reached as Stash | test lines 400 to 421, 438 to 442, 451 to 460 and 489 to 493, each one of the named cases |
| Test, line 6 (the allowed list): the new allowed cases named after `git checkout and restore of :(literal)* and :(literal)**` | test lines 422 to 437, 443 to 450, 461 to 470, 481 to 488 and 494 |
| Test, lines 7 to 9 (Inputs, Depth, the line names the simple command found): unchanged sentences | test lines 540 to 608 and 516 to 532; the `expect_line` calls now also name the new rule texts |

## Terms of `docs/glossary.md` in the new text

The added and changed lines of the diff were scanned against every bold term of `docs/glossary.md`, and each hit was read (the scan is a helper for reading, not a finding). The new sentences of the pages and the head comments use no term in a sense of its own. The hits, all in text the change did not write or in an ordinary sense:

- `ADR`, `plan`, `project skills`, `standards` and `sync`: on `README.md` line 13, in the parts of the row this change did not touch ("an ADR folder", "plan terms", "the project skills", "the standards pages", `sync`); the changed sentence of that row uses none of them.
- `case`: in the test's head comment, "a case pattern" (a shell `case` statement, in an existing item of the allowed list on the line the change edited), and the test's own word "case" for one line of its case file, which is the sense a test gives it and not a brief's cases; the new head-comment text says "capital letters" where it could have said "case", to keep clear of the entry.
- `point`: "with a start point" in the test's head comment, git's word for the revision a new branch starts at; the glossary's `point, of a sessions report` is another sense and the line does not use it.
- `worktree`: `git worktree remove` in the allowed list of the test's head comment, the git command.

## Sentences longer than the standards allow

The prose standard asks for sentences under roughly 20 words unless the mechanism needs more. Word counts by `wc -w` over the whole line, backticked code included:

- `skills/repo-setup/SKILL.md` line 126, 56 words: the first sub-bullet of question 10, dictated by the brief. Its content is a list of ten commands the hook refuses, which is what the question offers the user; the list cannot be shorter without dropping a command, and the skill layout standard's one rule per bullet is met, since the bullet states one thing, what the hook refuses.
- `README.md` line 13, the changed sentence, 49 words: dictated by the brief. It states what the offer installs, into which folder and what it prints, in a table cell; the cell of the row is the summary of the skill, and the brief keeps the order of the old sentence.
- `docs/dev/building.md` line 10, the comment of the test's line, 49 words: dictated by the brief; it lists what the test checks, as the old comment did.
- `skills/repo-setup/SKILL.md` lines 127, 128 and 129 are 7, 16 and 7 words.
- The bullets of the guard's head comment (for example the subtree bullet, about 60 words) enumerate forms of a command; each names the forms the rule reads, which is the head comment's job under the change standard's rule 14 ("lists every input it reads"). They are comments, not pages or skills, and item 10 asks about pages and skills.

## Files changed

| File | Lines before | Lines after |
|---|---|---|
| `skills/repo-setup/templates/hooks/git_guard.py` | 1230 | 1315 |
| `skills/repo-setup/templates/hooks/git_guard.test.sh` | 507 | 610 |
| `skills/repo-setup/SKILL.md` | 187 | 190 |
| `README.md` | 180 | 180 |
| `docs/dev/building.md` | 33 | 33 |
| `.scratch/2-g-git-guard/agents/reviews/2b-report.md` | none | this report |

`git status --short` and `git diff --stat` on the worktree, before this report was written:

```
$ git status --short
 M README.md
 M docs/dev/building.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/hooks/git_guard.py
 M skills/repo-setup/templates/hooks/git_guard.test.sh
$ git diff --stat
 README.md                                          |   2 +-
 docs/dev/building.md                               |   2 +-
 skills/repo-setup/SKILL.md                         |   5 +-
 skills/repo-setup/templates/hooks/git_guard.py     | 103 ++++++++++++++++++--
 .../repo-setup/templates/hooks/git_guard.test.sh   | 107 ++++++++++++++++++++-
 5 files changed, 205 insertions(+), 14 deletions(-)
```

## Judgment calls

1. The subtree options are read by the existing `_take_options` with a set, `_SUBTREE_VALUED`, that holds `-P`, `-b`, `-m` and each of `--prefix`, `--branch`, `--message`, `--annotate` and `--onto` at every length from one letter, generated from the five names. The brief fixes the reading and leaves the mechanism open; this adds no second option parser.
2. `_PROGRAMS = frozenset({"subtree"})` carries the two behaviours of decisions 8 and 15 for the one subcommand that is a separate program: its rule is found in any capital letters, and its alias is expanded when the rule gives None. The other rules are matched as written and end the search when they give None.
3. The head comment's first alias sentence (lines 24 to 27) is rewritten. Before: "An alias defined by that configuration is expanded; an alias that starts with ! is checked as its text followed by the arguments git appends, and the inline configuration is carried into the git commands that text runs." After: the text in the table of "Head comments reread". Decision 15 makes the old first clause false for an alias named `stash`, `switch` or `send-pack` (as it already was for one named `push`, `reset`, `clean`, `checkout` or `restore`), and rule 14 makes a head-comment sentence that the code contradicts a defect of the change; it serves item 7's reread of every sentence and decision 15.
4. The head comment says "capital letters" for the subtree match in place of "case", since the glossary gives `case` a sense of its own; the same words are used in the constant's comment above `_PROGRAMS`, and the test says "written SUBTREE and Subtree".
5. The forced-checkout bullet ends "git checkout -f -- <path> is blocked too.", which states decision 7's consequence in the head comment so a reader does not take it for a gap.
6. The test's case lines of B1 to B9 stand in one block at the end of the case file, in the brief's order of groups; the seven `expect_line` calls stand after the existing ones. `git checkout -f .` is an `expect_line` call only (it asserts the block and the exact line together); it is not also a case-file line.
7. The table has one row for each behaviour a case group names, 39 rows in all, since one edit of the guard takes out one behaviour; a group with several behaviours (B2, B6, B8) has several rows. For the two controls that end a word list or give an empty word (`git subtree`, `git stash ''` and the like), no line of the guard reads an empty word specially, so the edits are the ones the table names: dropping the `index < len(arguments)` guard makes the words-end cases crash, and comparing a first letter (`arguments[index][0]`, `arguments[0][0]`) makes the empty-word cases crash.
8. In the table, the fifth column quotes the test's own first `FAIL:` line where the row's case is that line; for the rows where an earlier case of the test fails first, it quotes the row's own case from a non-stop copy of the finished test and gives the test's own first line beside it.

## Host-visible and user-visible changes

- The guard now refuses, with exit 2 and one line on stderr, `git send-pack` with any arguments, `git subtree push`, `git stash drop`, `git stash clear`, `git switch` with `--discard-changes` (or a prefix from `--di`), `--force` or `-f` in a word of short options before any `c` or `C`, and `git checkout` with `--force` (or a prefix from `--f`) or `-f` in a word of short options before any `b` or `B`. Before, each of these exited 0 (the first run above). The lines are the ones of B10.
- An alias given inline as `stash`, `switch` or `send-pack` is no longer expanded (git ignores it); before, `git -c alias.stash=push stash` was expanded and blocked. `git -c alias.stash=push Stash` is still blocked (the case at test line 493).
- The offer of question 10 in `skills/repo-setup/SKILL.md`: before, one sub-bullet, after, four sub-bullets (V8 quotes both). The README row and the comment in `docs/dev/building.md` change as V8 shows.
- The head comment of `git_guard.py` said the six commands were not blocked and listed five operations; it now lists nine blocked commands and the two commands that stay allowed (R1 before, "Head comments reread" after).

## Anything in the brief that was wrong or impossible

Nothing in the brief was wrong or impossible. One fact differs from a sentence of the brief without making it wrong: the two greps of the skills the brief names (a forced checkout, any `git switch`) print, on the tree at the base, one line (`skills/diagnose/SKILL.md:176`, not a forced checkout) and nothing, as the brief says; on the finished tree the first prints that line and `skills/repo-setup/SKILL.md:126`, and the second prints `skills/repo-setup/SKILL.md:126`, because the new question-10 text names `git checkout --force` and `git switch --discard-changes` as commands the hook refuses (V8).

## Appendix: Outputs quoted whole

The two crash edits print a Python traceback; the whole output of each run of the test, first `FAIL:` line included:

b3b (`index < len(arguments) and ` removed), `GIT_GUARD=<scratch>/m_b3b.py PATH=/usr/bin:$PATH sh git_guard.test.sh`:

```
FAIL: block git subtree -P; git push: expected exit 2, got 1: Traceback (most recent call last):
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 1315, in <module>
    sys.exit(main())
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 1307, in main
    line = _check_text(command)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 794, in _check_text
    outcome = _check_simple(command, inherited)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 818, in _check_simple
    outcome = _check_git(command.words, words[index + 1 :], config, env)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 1050, in _check_git
    rule = check(rest, config)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b3b.py", line 1137, in _rule_subtree
    if arguments[index] == "push":
IndexError: list index out of range
```

b5b (`arguments[0][0] in "dc"`):

```
FAIL: allow git stash '': expected exit 0, got 1: Traceback (most recent call last):
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 1315, in <module>
    sys.exit(main())
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 1307, in main
    line = _check_text(command)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 794, in _check_text
    outcome = _check_simple(command, inherited)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 818, in _check_simple
    outcome = _check_git(command.words, words[index + 1 :], config, env)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 1050, in _check_git
    rule = check(rest, config)
  File "/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//2b.rrk5Cy/m_b5b.py", line 1143, in _rule_stash
    if arguments and arguments[0][0] in "dc":
IndexError: string index out of range
```

b9a (`expansion = None`), the `FAIL:` lines of the four alias cases of B9 from the non-stop copy of the test:

```
FAIL: block git -c alias.d='stash drop' d: expected exit 2, got 0: 
FAIL: block git -c alias.sp=send-pack sp origin main: expected exit 2, got 0: 
FAIL: block git -c alias.sw='switch -f' sw main: expected exit 2, got 0: 
FAIL: block git -c alias.co='checkout -f' co other: expected exit 2, got 0: 
```

## Appendix: Exit statuses on the unchanged tree

From `nonstop_status.test.sh` against the base guard: `exit <status>: <case>` for each of the 95 case lines and the 7 `expect_line` calls that this step adds (a blocked case must give 2, an allowed one 0):

```
exit 0: block git send-pack ../remote.git main
exit 0: block git send-pack --dry-run ../remote.git main
exit 0: block git send-pack --all ../remote.git
exit 0: block git -C /tmp/x send-pack ../remote.git main
exit 0: block sudo git send-pack ../remote.git main
exit 0: block git subtree push --prefix=sub origin main
exit 0: block git subtree -P sub push origin main
exit 0: block git subtree --pref sub push origin main
exit 0: block git subtree -q --prefix sub push origin main
exit 0: block git subtree push -Psub origin main
exit 0: block git subtree -qP sub push origin main
exit 0: block git subtree --rejoin -m msg -P sub push origin main
exit 0: block git subtree --annotate x -b br --onto y -P sub push origin main
exit 0: block git subtree --p sub push origin main
exit 0: block git subtree --pr sub push origin main
exit 0: block git subtree -P sub -- push origin main
exit 0: block git subtree -Psub push origin main
exit 0: block git SUBTREE -P sub push origin main
exit 0: block git Subtree push -P sub origin main
exit 2: block git subtree -P; git push
exit 2: block git -c alias.subtree=push subtree origin main
exit 2: block git -c alias.subtree=push SUBTREE origin main
exit 0: allow git subtree add --prefix=sub origin main
exit 0: allow git subtree pull -P sub origin main
exit 0: allow git subtree split -P push
exit 0: allow git subtree -P push add origin main
exit 0: allow git subtree merge --prefix push main
exit 0: allow git subtree --prefix=push pull push main
exit 0: allow git subtree --p push split
exit 0: allow git subtree --a push split -P sub
exit 0: allow git subtree -P sub -- split
exit 0: allow git subtree -Ppush split
exit 0: allow git subtree
exit 0: allow git subtree -P
exit 0: allow git subtree --
exit 0: allow git subtree --prefix
exit 0: allow git subtree -qP
exit 0: allow git subtree ''
exit 0: block git stash drop
exit 0: block git stash drop -q
exit 0: block git stash drop 'stash@{0}'
exit 0: block git stash clear
exit 0: block env git stash clear
exit 0: allow git stash
exit 0: allow git stash push -m drop
exit 0: allow git stash pop
exit 0: allow git stash apply
exit 0: allow git stash show -p
exit 0: allow git stash -q drop
exit 0: allow git stash branch clear
exit 0: allow git stash ''
exit 0: block git switch --discard-changes main
exit 0: block git switch main --discard-changes
exit 0: block git switch --discard main
exit 0: block git switch --di main
exit 0: block git switch -f main
exit 0: block git switch --force main
exit 0: block git switch -qf main
exit 0: block git switch -fc new other
exit 0: block git switch -f -c new
exit 0: block git -c core.pager=cat switch -f main
exit 0: allow git switch main
exit 0: allow git switch -c new
exit 0: allow git switch -cfix
exit 0: allow git switch -Cfix
exit 0: allow git switch -C new
exit 0: allow git switch --force-create new
exit 0: allow git switch --detach HEAD~1
exit 0: allow git switch --d main
exit 0: allow git switch --forc main
exit 0: allow git switch -
exit 0: block git checkout -f other
exit 0: block git checkout --force other
exit 0: block git checkout --forc other
exit 0: block git checkout --f other
exit 0: block git checkout -f
exit 0: block git checkout -qf other
exit 0: block git checkout other -f
exit 0: block git checkout -fb new
exit 0: block git checkout -f -b new
exit 0: block git checkout -f -- f
exit 0: allow git checkout other
exit 0: allow git checkout -b new
exit 0: allow git checkout -bfix
exit 0: allow git checkout -Bfix
exit 0: allow git checkout --no-force other
exit 0: allow git checkout -- f
exit 0: allow git checkout --theirs -- f
exit 0: allow git checkout main -- -f
exit 0: block git -c alias.d='stash drop' d
exit 0: block git -c alias.sp=send-pack sp origin main
exit 0: block git -c alias.sw='switch -f' sw main
exit 0: block git -c alias.co='checkout -f' co other
exit 2: block git -c alias.stash=push Stash
exit 0: allow git -c alias.sl='stash list' sl
exit 0: line git send-pack ../remote.git main
exit 0: line git subtree push --prefix=sub origin main
exit 0: line git stash drop
exit 0: line git stash clear
exit 0: line git switch -f main
exit 0: line git checkout -f other
exit 2: line git checkout -f .
```

