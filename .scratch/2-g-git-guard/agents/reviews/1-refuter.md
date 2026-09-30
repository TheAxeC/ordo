# Step 1 refuter report (on .agents/worktrees/2g-1, base 70d0bae1e67a550948d4d8c269369a16d45825a1)

A page this report cites is named with its section. A finding in code keeps its `file:line`. Every probe below was run with `python3 <scratchpad>/probe.py <inputs file>` on the worktree's script. The inputs files are `refute-2g-inputs-1.txt` (the earlier 92), `-2.txt`, `-3.txt` and `-4.txt`, and the deep-nesting probe is `refute-2g-deep.py`, all in the scratchpad. Probe sets 1, 2 and 4 give the same exit statuses on 3.13.4 and on /usr/bin/python3 3.9.6 (compared with `cmp`).

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-g-git-guard/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 8 commands passed
rc=0

$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
rc=0
$ PATH=<scratchpad>/py39:$PATH python3 --version
Python 3.9.6
$ PATH=<scratchpad>/py39:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests

$ GIT_GUARD=<scratchpad>/red/absent.py sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1   (the unchanged tree: no script)
FAIL: block git push: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/private/tmp/claude-502/.../scratchpad/red/absent.py': [Errno 2] No such file or directory

Red runs (grep -v of the block's line in _CHECKS, run through GIT_GUARD):
without push:              FAIL: block git push: expected exit 2, got 0:
without reset:             FAIL: block git reset --hard: expected exit 2, got 0:
without clean:             FAIL: block git clean -f: expected exit 2, got 0:
without checkout+restore:  FAIL: block git checkout .: expected exit 2, got 0:
without restore only:      FAIL: block git restore .: expected exit 2, got 0:

$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
All checks passed!
rc=0
$ ruff format --check --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
1 file already formatted
rc=0
$ LC_ALL=C grep -n '[^ -~]' <the two new files> docs/dev/building.md docs/dev/change-standard.md
grep rc=1
$ git status --short
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/2-g-git-guard/agents/reviews/1-report.md
?? skills/repo-setup/templates/hooks/
```

Every command the builder's report quotes gave the output the report claims. The report quotes its first run as "verbatim", but it prints the path as `'$TMPDIR//final/absent.py'` where python3 prints the absolute path. No decision rests on that path, so it is not raised as a finding.

## Verdicts

Items of the brief's "What to build":

- 1: violated. The input handling, the reserved words, wrappers, git global options, the blocks and the pathspec forms the brief lists all hold, by the test and by the probes. Findings Spec 1, Spec 2, Spec 3, Spec 4 and Behaviour 1 make the item violated.
- 2: holds. It has the head comment listing the cases, `GIT_GUARD`, exit status plus stderr checks for both a block and an allow, and the last line `PASS: git_guard.py scratch tests`. A script compared the brief's backticked cases with the test's case lines: every case is present, apart from regex artifacts that are present on reading (test lines 112-113, 264-289). Its cases at lines 291-302 assert the exit 2 of Spec 1.
- 3: holds. `git diff` shows the one line in `docs/dev/building.md`'s command block after `sync_rules.test.sh`. The same line with `2>&1 | tail -1` is in `docs/dev/change-standard.md` at the same place.

Cases of the brief's "Cases":

- Blocked, push (all seven bullets: plain forms, wrappers, separators and compound commands, substitutions, shells with -c and env -S, here-documents, here-strings and pipes, inline aliases): met. Test lines 65-130 pass, and each block is red without push.
- Blocked, reset, clean, checkout and restore: met. Test lines 131-165 pass. The reset, clean and checkout+restore red runs each fail on their first case.
- Allowed (plan skills' commands, text naming a blocked command, no git, empty, unbalanced, and the eight non-command inputs): met. Test lines 166-207 and 264-281 pass. Probe set 4 also shows the usual commit-message forms are allowed: `git commit -m "$(cat <<'EOF' ... git push ... EOF )"` and `gh pr create --body "$(cat <<'EOF' ...)"`.
- Blocked, other inputs (Monitor, no tool_name, one megabyte, non-UTF-8 byte around git push): met. Test lines 272-289 pass. The one-megabyte inputs of seven other shapes finish in 0.4-0.9 s.

## 1. Spec

- Spec 1. `git_guard.py:125-126, 273-275, 292-293, 383-384, 465-466, 866-872` and docstring lines 44-46: "A command with more than 100 levels of expansions or substitutions inside one another cannot be read and exits 2".
  - What is wrong: this is an exit 2 beyond the approved computation. The approved line gives exit 2 only for the five operations, and "it exits 0 otherwise". The Rulings line "Step 1, the forms of the five operations" says input the script cannot read exits 0. The block fires on commands that hold no git at all. Test line 291 asserts `echo $(` x150 `git status` `)` x150 blocked, and line 297 asserts `echo ${`x150 `x}`x150 blocked. Choosing a new exit-2 rule is the user's decision (change standard, "A new script needs the user's approval of what it computes"). Rule 4 says such a point is reported as a stop. The builder reported it as a judgment call instead.
  - Failure scenario: a generated command with more than 100 nested `${...}`/`$(...)` levels and no git is refused with "git-guard: blocked: a command nested deeper than 100 levels". Separately, the user has not approved this rule, and it does not even hold: see Behaviour 1.
  - Options for the orchestrator:
    - (a) Exit 0, as approved.
    - (b) Keep exit 2 and get Axel's approval.
    - (c) A lexer with an explicit stack, so every depth is read and neither the block nor the crash exists. This ends the cause.
  - Verdict: item 1 violated.
- Spec 2. `git_guard.py:609-611`: `if "c" in word[1:]: return (words[index + 1] if index + 1 < len(words) else ""), False`.
  - What is wrong: the brief says a shell's `-c` "command string is lexed as a command". POSIX `sh -c [options] command_string` takes the first operand after all options. The script takes the word right after `-c`, even when that word is another option or `--`.
  - Probes, each exit 0: `bash -c -- 'git push'`, `bash -c -e 'git push'`, `sh -c -x 'git push'`, `bash -c -o errexit 'git push'`.
  - Real shells run the string: `/bin/bash`, `/bin/sh`, `/bin/zsh` and `/bin/dash` each printed the echo marker for `-c -- 'echo ...'`, `-c -e 'echo ...'` and `-c -x 'echo ...'`.
  - Failure scenario: an agent writes `bash -c -e 'git push'` and the push runs.
  - Verdict: item 1 violated.
- Spec 3. `git_guard.py:698-699`: `if expansion.startswith("!"): return _check_text(expansion[1:])`.
  - What is wrong: a `!` alias is checked without the arguments git appends to it. The Ruling's "inline aliases" form is therefore not covered. `man git-config`, alias.*, says: "Shell command aliases always receive any extra arguments provided to the Git command-line as positional arguments."
  - Probes, exit 0: `git -c 'alias.p=!git' p push` and `git -c 'alias.p=!git' p reset --hard`.
  - A second probe is also exit 0: `git -c 'alias.p=!git q' -c alias.q=push p`, in both orders. The `-c` configuration of the outer git is not carried into the text of the `!` alias. That git passes `-c` settings to the child git is not verified here, since running git is outside this review. A scratch repository run with a harmless alias would settle it.
  - The brief's own sentence ("an alias starting with `!` is lexed as a command") leaves the arguments out. The builder followed it literally.
  - Failure scenario: `git -c 'alias.p=!git' p push` pushes.
  - Verdict: item 1 violated.
- Spec 4. `git_guard.py:740`: `if config.get("clean.requireforce", "").lower() in _FALSE_VALUES and not dry_run:`.
  - What is wrong: the Ruling covers "`clean.requireForce=false` given inline". `man git`, `-c`, says "git -c foo.bar= ... sets foo.bar to the empty string which git config --type=bool will convert to false". `man git-config`, boolean, lists "the empty string" among the false literals.
  - The script cannot tell an empty value from an absent one, because the default is also `""`. `git -c clean.requireForce= clean -d` exits 0. `=00` also exits 0, while `=False` is blocked.
  - Failure scenario: `git -c clean.requireForce= clean -d` deletes untracked files and the guard lets it through.
  - Verdict: item 1 violated, the clean block.

## 2. Proof

- Proof 1. `git_guard.test.sh:291-302`: the 150-level cases assert the exit 2 of Spec 1, a behaviour that is beyond the approved computation. The 20-level case is the only depth check on the allow side, and it does not mix `${` with `$(`, so it never reaches the crash of Behaviour 1.
  - Failure scenario: the suite is green while a 90x`${x:-` by 8x`$(` command crashes the guard.
  - Verdict: item 1, with Spec 1 and Behaviour 1.

## 3. Standards

- Standards 1. `git_guard.py` docstring lines 8 and 41-46: "The command is read as the POSIX shell and bash read it" and "Exit 0 lets the command run ... Exit 2 blocks it".
  - What is wrong: change standard rule 14 says a docstring lists every exit status, and a sentence the change makes false is a defect. `skills/repo-setup/templates/docs/dev/coding-standards/python.md`, Errors, says "A command-line script catches the exception classes it expects, prints the error to stderr and exits non-zero".
  - The script also exits 1 with a traceback on `RecursionError` (Behaviour 1), and that status is not in the docstring. The claim that it reads commands as the shell does is false for the forms in Behaviour 2, and those forms are not in the docstring's "Not seen" list.
  - Failure scenario: a reader installing the hook in step 2 takes exit 0 and 2 as the only outcomes. They also take the lexer as faithful to bash.
  - Verdict: item 1.

## 4. Behaviour

- Behaviour 1. `git_guard.py:272-288, 290-299, 325-358` (the recursive `_dollar`, `_braced` and `_substitution`) and `:866-868`, which catches only `_TooDeepError`.
  - What is wrong: the two depth limits count separately. `expanding` counts per lexer and `depth` counts lexers. A command that stays under both limits still exhausts Python's recursion limit. The script then exits 1 with a traceback, which Claude Code treats as a non-blocking error, so the command runs. The builder's report does not state this outcome.
  - Probe (`refute-2g-deep.py`): `echo ` + (90 x `${x:-` + `$(`) x 8 + `git push` + closers, 4357 characters. It gives "exit 1 stderr last line: RecursionError: maximum recursion depth exceeded" on 3.13.4, and the same on 3.9.6 ("... in comparison").
  - bash runs such a command: the same shape with `echo DEEP-RAN >&2` inside printed `DEEP-RAN`, bash rc=0.
  - A sweep with `git status` inside: exit 1 at 30 per level x 20 levels, 60x12 and 90x8. Exit 0 at 10x20, 30x12 and 60x8.
  - Failure scenario: git push nested this way runs unguarded.
  - Verdict: item 1 violated.
- Behaviour 2. Forms the shell runs that the lexer does not read. Each probe exits 0 while the shell reaches the operation:
  - `echo $((git push) )`: bash, sh and zsh run `$((cmd) )` as a command substitution (checked with echo). `_arithmetic` at `:301-323` skips it as arithmetic.
  - `function f { git push; }; f` and `coproc git push`: reserved words the Ruling's "reserved words at a command's start" covers. `f() { ...; }` is blocked.
  - `{git,push}`: brace expansion (bash ran `{echo,E-brace}`).
  - `$'\x67it' push` and `git $'\x70ush'`: `_ansi_quoted` at `:369` decodes `\x67` as `x67` (bash ran `$'\x65cho'`).
  - `/usr/bin/gi? push`: a glob in the command word.
  - `bash - <<< 'git push'`: bash ran `bash - <<< 'echo ...'`.
  - `printf 'git\tpush' | bash`, `echo -e 'git\x20push' | sh`, and `echo push | xargs git`.
  - Most of these are outside the brief's enumerated lists, but the Ruling "every form" covers them. `$'...'` and `$((` are the builder's own additions, implemented partially.
  - Failure scenario: any of these runs the operation unguarded, and the docstring claims otherwise (Standards 1).
  - Verdict: none of the brief's cases; the orchestrator rules on which to add.

## Declined to judge

- Whether `git --attr-source <tree> push` (separate-value form) runs a push. The man page documents only `--attr-source=<tree-ish>`, which the script handles. Settling it needs git's source or a git run, and git is outside this review.
- `A=push git --config-env=alias.p=A p` and `GIT_CONFIG_PARAMETERS="'alias.p'='push'" git p`, both exit 0. These are inline configuration forms that the brief's list (`-c`, `GIT_CONFIG_KEY_<n>`) does not name. Whether they fall under the Ruling's "inline aliases" is the orchestrator's call.
- Wrappers outside the Ruling's list: `watch`, `find -exec`, `stdbuf`, `doas` (all exit 0). The brief names a closed list, so this is the user's call.
- A command word or subcommand from a variable (`git push${x}`, `sh -c 'git "$@"' sh push`, both exit 0). The docstring names "a command word or option held in a variable" as not seen. `$@` is a positional parameter, which I read as inside that sentence.
- pyright, which `python.md` names. It is not in the brief's verify list and was not run.
- Reviewer time and exact tokens. They are not visible inside this session.

Reviewer usage: tokens not visible to the reviewer, 30 tool uses, minutes not measured.

