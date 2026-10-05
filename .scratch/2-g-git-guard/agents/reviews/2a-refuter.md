# Step 2a refuter report (on .agents/worktrees/2g-2a, base 2bd2282)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in code keeps its `file:line`. `git_guard.py` below is `skills/repo-setup/templates/hooks/git_guard.py` in the worktree.

## Verification (rerun by the reviewer)

The verify list, run from the worktree's root with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh $TMPDIR/r2a/state.md`. The state file copy is the main checkout's `.scratch/2-g-git-guard/orchestrator-state.md` with one line added after the guard's test line, `- pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1`. `diff` printed only `11a12 > - pyright ...`. The runner exited 0.

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
$ pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1
0 errors, 0 warnings, 0 informations
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 13 commands passed
```

These commands are quoted in the builder's report. I reran each one, and each printed what the report claims.

```
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1   (pyright exit 0)
0 errors, 0 warnings, 0 informations
$ PATH=$TMPDIR/r2a/s/py39:$PATH python3 --version          (py39/python3 -> /usr/bin/python3)
Python 3.9.6
$ PATH=$TMPDIR/r2a/s/py39:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ grep -rnI 'checkout -f' skills README.md docs
skills/repo-setup/templates/hooks/git_guard.test.sh:7:# Allowed, the further commands: git subtree split, pull and add (also with push as a value of -P), git stash, list, pop, push -m drop and show dr[...cut by the reviewer's display at 160 columns]
skills/repo-setup/templates/hooks/git_guard.test.sh:458:allow git checkout -f main
skills/repo-setup/templates/hooks/git_guard.py:104:Not blocked, because it is not among the operations above: git checkout -f <branch>, and git
$ LC_ALL=C grep -n '[^ -~]' <the six changed files>     (printed nothing, exit 1)
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 git_guard.py
All checks passed!
$ GIT_GUARD=<base guard, git_guard.py reverse-patched to 2bd2282, 1230 lines> sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
FAIL: block git send-pack origin main: expected exit 2, got 0:
$ GIT_GUARD=<base guard> sh <the test with fail() returning instead of exiting>
  106 distinct failing labels, every one a new case of the step (B1 to B6, A1 to A34, the A-case controls and "A34 more"); no pre-existing case fails
$ pyright --warnings <base guard> 2>&1 | tail -1
0 errors, 0 warnings, 0 informations
$ PATH=<py39>:$PATH GIT_GUARD=<base guard> sh <the test at 2bd2282> 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ GIT_GUARD=<new guard> sh <the test at 2bd2282> 2>&1 | tail -1
PASS: git_guard.py scratch tests
```

I reran eight of the report's mutations, each on a scratch copy of the guard through `GIT_GUARD`. The sample was M10c, M27a, M18c, B2a, M33b, M15b, M24d and M26a. Each printed the failing line the report quotes:

```
M10c: FAIL: A13 git Status: expected exit 2, got 0:
M27a: FAIL: A27: the git of the command's PATH was run
M18c: FAIL: A21 cd <scratch>/repo21; cd - && git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand)
B2a:  FAIL: block git subtree --pref x push origin main: expected exit 2, got 0:
M33b: FAIL: A33 a lone surrogate in an assignment before git push: expected exit 2, got 1: Traceback (most recent call last):
M15b: FAIL: A18: a lookup of 1.2 seconds, a lookup that hangs and git push took 3281 ms, not under 2800 (the lookups share 2 seconds)
M24d: FAIL: A24 git -C <scratch>/repo25/sub up: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand)
M26a: FAIL: A26 git p: expected exit 2, got 0:
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1 (aliases from the configuration): violated. The directory, process, environment, budget, listing, command-name rule and `!` handling are built as written; the A cases and the sampled mutations show it. Behaviour 1 is the failure: a NUL in a `-C` or `cd` word gives a traceback, exit 1, so a following `git push` goes through. Behaviour 2 is a second failure: a configuration file the command names makes the lookup write a file. Spec 2 is a third: a `cd` the shell does not run, or that fails, still moves the lookup.
- 2 (five more blocks): violated. send-pack, stash drop and clear, switch, and `checkout -f` allowed all hold, as B1 and B3 to B6 show and as real git confirms in scratch repositories. Spec 1 is the failure: `git subtree push` reached through a bundled short-option word (`-qP x`) is allowed.
- 3 (pyright): holds. The `building.md` line and the change-standard line are as dictated. pyright prints `0 errors, 0 warnings, 0 informations` and exits 0. README line 66 names pyright, and line 68 no longer says "for the skills CLI only".
- 4 (the texts): violated in part. Standards 1 covers three docstring sentences the code makes false. The test's head comment, README line 13, `SKILL.md` line 186, `building.md` line 10 and the version raise to 2.2.0 hold.

Cases of the brief's "Cases":

- A1: met (`check_event_line`, the exact line; fails on base).
- A2: met (four lines, one per rule).
- A3: met (five lines).
- A4: met.
- A5: met, with its control.
- A6: met.
- A7: met (chain blocked; the cycle allowed with nothing on stderr). Proof 1 applies to the cycle half.
- A8: met.
- A9: met (absolute, the allowed form without `-C`, and relative `-C r`).
- A10: met. The `--work-tree` halves are audits, and the report says so.
- A11: met. The empty-`cwd` event is an audit, and the report says so.
- A12: met.
- A13: met, as the cases ruling 4 says.
- A14: met.
- A15: met.
- A16: met, with its control.
- A17: met.
- A18: met. Both bounds of 3000 ms hold. The builder's extra case (a 1.2 s lookup, then a lookup that hangs) shows the shared budget, and M15b reproduces.
- A19: met.
- A20: met.
- A21: met for the five listed commands, as the cases ruling 1 says. Spec 2 covers the `cd` forms outside the list.
- A22: met. I also checked `env -C<dir>`, `env --chdir <dir>`, `sudo --chdir=<dir>` and `sudo -D<dir>`; each is blocked.
- A23: met.
- A24: met.
- A25: met.
- A26: met (both halves).
- A27: met for the listed `PATH` and `GIT_TRACE` forms. Behaviour 2 is a form outside the case.
- A28: met.
- A29: met. It is an audit, and the report says so.
- A30: met.
- A31: met (four commands).
- A32: met.
- A33: met for the listed inputs, as the cases ruling 2 says. Behaviour 1 is a NUL in a directory word, outside the case.
- A34: met.
- B1: met.
- B2: met for every listed form. Spec 1 is an unlisted form.
- B3: met. Real git refuses `git stash -q drop` and `git stash --quiet clear` (`fatal: subcommand wasn't specified; 'push' can't be assumed due to unexpected token 'drop'`), so decision 8 holds.
- B4: met. Real git: `--di` switched and discarded the change, while `--forc`, `--fo`, `--for` and `--d` are ambiguous and refused, so the guard's rule matches git.
- B5: met.
- B6: met.
- P1: met (the run above).
- P2: met. The three hits are the docstring and two lines of the guard's test, as the cases ruling 3 allows.
- P3: met (the run above).
- P4: partial. The docstring's lines 50 to 51, 96 to 98 and 107 say what the code does not do (Standards 1). The other places hold when read in place.

## 1. Spec

- Spec 1. `git_guard.py:1562` and `git_guard.py:1569`:
  ```
  while index < len(arguments) and arguments[index].startswith("-") and len(arguments[index]) > 1:
      index += 2 if _subtree_takes_value(arguments[index]) else 1
  ...
  if option in _SUBTREE_SHORT:
  ```
  - **What is wrong.** Section 2 says the rule looks at "the first word after `subtree` that is not an option or an option's value". `-P`, `-m` and `-b` take a value. git subtree parses its options with `git rev-parse --parseopt`, which reads bundled short options: in `-qP x`, `x` is the value of `-P`. The guard compares only the whole word with `-P`, `-m` or `-b`, so it reads `x` as the subcommand.
  - **Failure scenario.** In a scratch repository, `git subtree -qP x push ../b.git main` pushed (`* [new branch] ... -> main`). The guard allowed the same command with exit 0, and also `git subtree -dP x push ../b.git main` and `git subtree -qm msg push`.
  - **Verdict.** Item 2 violated.
- Spec 2. `git_guard.py:1003-1017` (`_after_cd`), `git_guard.py:993-1000` (`_cd_arguments`) and `git_guard.py:1063` (`_check_text`):
  ```
  literal = _literal(word)
  target = None if literal is None else _join(place.current, literal)
  return place if target is None else _Dir(target, place.current)
  ```
  - **What is wrong.** Section 1 says a `cd` changes the directory "as the shell would". The guard moves the lookup's directory for every simple command whose first word is `cd`, whether or not the shell changes directory. It also ignores `cd` run through a wrapper or `eval`, which do change it. Each run below uses `alias.p = push` in `<repo>`:
    - `cd <missing>; git p` with `cwd` `<repo>` is allowed. The shell's `cd` fails, git runs in `<repo>`, and the alias pushes. Real bash printed `cd: ... No such file or directory` and then `push` for `git config --get alias.p`.
    - `cd <a file>; git p` is allowed, for the same reason.
    - `cd <out> | true; git p` and `cd <out> & git p` with `cwd` `<repo>` are allowed. The shell runs those `cd`s in a subshell, and real bash's `pwd` after `cd <repo> | true` printed the starting folder. The lexer knows a pipeline member (`pipe_from`) and `&`. The docstring files this form under "Not seen" (Standards 1), although it is a fact the lexer can compute.
    - `false && cd <out>; git p` with `cwd` `<repo>` is allowed, and so is `f() { cd <out>; }; git p`. The shell runs neither `cd`.
    - `builtin cd <repo> && git p`, `command cd <repo> && git p` and `eval cd <repo>; git p` with `cwd` `<out>` are allowed. The shell changes directory and pushes. The guard reads `builtin`, `command` and `eval` as wrappers everywhere else.
  - **What was asked.** The brief asked for the shell's behaviour. Where the shell's choice depends on a run (a conditional `cd`, a `cd` that may fail), the rule for an uncertain directory, such as looking up in both directories, is the orchestrator's to write (rules file rule 4).
  - **Failure scenario.** An agent in `<repo>` runs `cd /some/missing; git p` with `p` aliased to push. The guard allows it, and git pushes.
  - **Verdict.** Item 1 violated.

## 2. Proof

- Proof 1. `git_guard.test.sh:710`, `check_event allow "$repo" 'git a'` (A7's cycle):
  - **What is wrong.** The case has no time bound. The report's own M3b row says that with the `seen` stop removed, the run "did not end". So the test catches that regression by hanging, never by a `FAIL:` line. The test already has `time_guard` for this purpose.
  - **Failure scenario.** A later change breaks the cycle stop. `checks.sh` and `land.sh` then hang on the guard's test instead of printing `checks: failed`, and the landing waits until someone kills it.
  - **Verdict.** None (A7 still gives the expected result).

## 3. Standards

- Standards 1. `git_guard.py:50-51`, `git_guard.py:96-98` and `git_guard.py:107`:
  ```
  - is the `git` that the script's own PATH finds, so that no program runs and no file is written
    that the checked command names;
  ...
  Not seen: ... a `cd` in a pipeline or run in the background, which the shell runs in a subshell, ...
  ...
  Output and exit status. The script gives two exit statuses.
  ```
  - **What is wrong.** Rules file rule 14 says a head comment that the change makes false is a defect of the change. Each of the three sentences is false:
    - Lines 50 to 51: Behaviour 2 shows that the command can make the lookup write a file.
    - Lines 96 to 98: "Not seen" reads as "ignored". The guard follows such a `cd`, and real bash does not (Spec 2).
    - Line 107: Behaviour 1 shows exit 1 with a traceback.
  - **Failure scenario.** A user reads the docstring before installing the hook. They trust that a configuration file their agent writes cannot make the guard write anywhere, and that the hook never fails open.
  - **Verdict.** Item 4 violated, P4 partial.

## 4. Behaviour

- Behaviour 1. `git_guard.py:1335` and `git_guard.py:1017` feed `git_guard.py:940-952`:
  ```
  if any("\0" in part for part in command) or any("\0" in v for v in environment.values()):
      return None
  try:
      done = subprocess.run(command, cwd=directory, ...)
  except (OSError, subprocess.TimeoutExpired, UnicodeError):
  ```
  - **What is wrong.** The NUL check covers the arguments and the environment, but not `cwd=directory`. A NUL in a `-C` or `cd` word reaches `subprocess.run`, which raises `ValueError: embedded null byte`. That class is not caught.
    - `git -C $'a\x00b' x; git push`: exit 1, `ValueError: embedded null byte`. The base guard gives exit 2, `git-guard: blocked: git push (git push is run by the user by hand)`.
    - `cd $'\0'; git x; git push` and the JSON `\u0000` forms give the same results on both.
    - Real bash reads `$'a\x00b'` as `a`, fails the `-C`, and runs the next command: `bash -c 'git -C $'"'"'a\x00b'"'"' x; echo SECOND-COMMAND-RAN'` printed `fatal: cannot change to 'a'` and then `SECOND-COMMAND-RAN`.
  - **Failure scenario.** `git -C $'a\x00b' x; git push` given to the Bash tool. The guard ends with a traceback and exit 1, where it blocked before this change. Claude Code's hook documentation treats an exit status other than 0 or 2 as a non-blocking error, and the tool call goes on (that handling is not verified by a run here), so the push runs. The report states no such change, and its judgment call on NUL names assignments and arguments only.
  - **Verdict.** Item 1 violated.
- Behaviour 2. `git_guard.py:934-939`. The process environment is the guard's own minus `GIT_CONFIG` and `GIT_TRACE*`, plus the command's `GIT_CONFIG_GLOBAL`, `GIT_CONFIG_SYSTEM`, `HOME` and `XDG_CONFIG_HOME`:
  - **What is wrong.** git reads its `trace2.*Target` settings from the system and global configuration files. Those files are the ones the command's own assignments name.
  - **Evidence.** `$TMPDIR/r2a/s/t2.cfg` held `trace2.eventTarget = <scratch>/t2-written` and `alias.st = status`.
    - The guard on `GIT_CONFIG_GLOBAL=<t2.cfg> git st` exited 0 and wrote `<scratch>/t2-written`: 2457 bytes, opening `{"event":"version",...,"exe":"2.49.0"}`.
    - With `trace2.normalTarget`, the guard on `GIT_CONFIG_GLOBAL=<t3.cfg> git zz; git push` wrote `<scratch>/t2-normal` and then blocked the push.
    - Running the same `git config -z --get-regexp '^alias\.'` with `GIT_TRACE2=0 GIT_TRACE2_EVENT=0 GIT_TRACE2_PERF=0` wrote no file.
  - **What the brief said.** Its section 1 promises "so the guard never runs a program or writes a file the checked command names". The builder followed the brief's variable list exactly. Adding the trace2 overrides to the process environment is a change to that list, so it is the orchestrator's to rule on.
  - **Failure scenario.** An agent writes a configuration file whose `trace2.eventTarget` names a path, then submits `GIT_CONFIG_GLOBAL=<that file> git st`. The guard appends git's trace there before the permission prompt, even when the user then denies the command or the guard blocks it.
  - **Verdict.** Item 1 violated.
- Behaviour 3. Under "Host- and user-visible changes", the report says the guard "now runs up to three git processes". It does not state the added time per hook run.
  - **Measurement.** Ten runs each with `/usr/bin/python3` on `git status && git log -1` with `cwd` a scratch repository: median 41.7 ms for the base guard and 55.8 ms for the new one.
  - **Failure scenario.** Every Bash call holding a git command with an unchecked subcommand now waits for one `git config` process. Up to 2 s are spent when git is slow, and a reader of the report cannot weigh that against the gain.
  - **Verdict.** None.

## Declined to judge

- Claude Code's handling of a PreToolUse hook that exits 1. Behaviour 1's statement that the call proceeds rests on the hooks documentation, not on a run in this session. The traceback and the exit 1 are verified.
- Whether `pushd` and `popd` should move the lookup. The brief names `cd` only, and the docstring lists `pushd` and `popd` under "Not seen". That scope is the orchestrator's call.
- A `cd` that follows `CDPATH`, and per-worktree `config.worktree` aliases. I did not test either.
- Whether the run-count assertions of "A34 more" cost something when they fail. I read them as tied to the shared budget, and they are not judged further.

Reviewer usage: a5e2534c2e32da49d, claude-opus-5-5, 272566 tokens, 64 tool uses, 30.5 minutes.
