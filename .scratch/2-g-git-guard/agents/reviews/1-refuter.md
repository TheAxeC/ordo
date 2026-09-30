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


## Repair round 1, refuted

Reviewer: a fresh agent (claude-opus-5-5). Worktree `.agents/worktrees/2g-1`, base 70d0bae1e67a550948d4d8c269369a16d45825a1. The round's delta was read against `1-round-0.diff`. The whole diff since the base was read: `git diff 70d0bae...` shows the two doc lines, and `git status --short` shows ` M docs/dev/building.md`, ` M docs/dev/change-standard.md`, `?? .scratch/2-g-git-guard/agents/reviews/1-report.md` and `?? skills/repo-setup/templates/hooks/`. The hooks folder holds `git_guard.py` (1092 lines) and `git_guard.test.sh` (433 lines), and both were read whole. The main-checkout copy of the report is byte-identical to the worktree copy (`cmp`). Its "git_guard.py, whole" section matches the file (`diff` shows only the closing fence).

Probe files are in the scratchpad. The earlier ones are `refute-2g-inputs-1.txt` to `-4.txt` and `refute-2g-deep.py`. The new ones are `refute-2g-r1-inputs-5.txt` (85 inputs), `refute-2g-r1-stress.py`, `refute-2g-r1-fuzz.py` and `rr1-bash-semantics.sh`, which runs only `echo` markers through bash 3.2.57, /bin/sh and zsh. Outputs are in `rr1-p313-*.txt` and `rr1-p39-*.txt`. Every probe set gives the same exit statuses on 3.13.4 and on /usr/bin/python3 3.9.6 (`cmp` of the status columns).

```
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
( ... ) 9.32s user 3.59s system 18% cpu 1:08.59 total
$ PATH=<scratchpad>/py39:$PATH python3 --version      (py39/python3 -> /usr/bin/python3)
Python 3.9.6
$ PATH=<scratchpad>/py39:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
All checks passed!
rc=0
$ ruff format --check --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
1 file already formatted
rc=0
$ LC_ALL=C grep -n '[^ -~]' git_guard.py git_guard.test.sh docs/dev/building.md docs/dev/change-standard.md .scratch/2-g-git-guard/agents/reviews/1-report.md
grep rc=1
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0

Commands the round's report quotes, rerun:
$ python3 stress.py <git_guard.py> python3        (all twelve lines match the report within timing noise)
  0.04s exit 2 2000 levels of $( around push git-guard: blocked: git push (git push is run by the user by hand)
  0.36s exit 2 100000 levels of $( around push ...
  0.47s exit 0 100000 levels of $( around status
  0.67s exit 2 one megabyte echo x; then push ...
  2.10s exit 0 one megabyte of $( unclosed
$ python3 stress.py <git_guard.py> /usr/bin/python3
  0.05s exit 2 2000 levels of $( around push ...
  1.18s exit 2 one megabyte echo x; then push ...
  3.21s exit 0 one megabyte of $( unclosed
$ python3 refute-2g-deep.py ; python3 refute-2g-deep.py /usr/bin/python3
len 4357 exit 2 stderr last line: git-guard: blocked: git push (git push is run by the user by hand)   (both)
$ python3 mutate.py <git_guard.py> rr1-mut ; sh mutrun.sh <worktree> rr1-mut rr1-mutout
27 copies, each rc=1, each first FAIL: line identical to the report's list (alias_args ... xargs_pipe)
$ GIT_GUARD=<round-0 script extracted from 1-round-0.diff> sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
FAIL: block bash -c -- 'git push': expected exit 2, got 0:
$ grep -n '_MAX_NESTING\|_TooDeep\|RecursionError\|nested deeper' git_guard.py git_guard.test.sh
git_guard.py:1068:    except (ValueError, RecursionError):      (json.loads only; no nesting limit remains)
$ python3 refute-2g-r1-fuzz.py 11 60000 ; /usr/bin/python3 refute-2g-r1-fuzz.py 12 60000
done 60000 errors 0 2.3s
done 60000 errors 0 3.4s
$ python3 refute-2g-r1-stress.py (and /usr/bin/python3): 13 inputs of up to 1 MB (256 brace words of 4095 chars, 2000 levels of ${, "$(, <( and parens, 50000 here-documents, 20000 chained aliases): every one exits 2 on its trailing push, the slowest 2.26 s (3.13) and 2.02 s (3.9).
Earlier probe sets 1-4 rerun: every exit 0 is a correct allow, or a form the docstring's "Not seen" names, or one of the findings below.
```

The builder's report was checked against these reruns. The test takes about 69 s, and the 2000-level case and the one-megabyte case have the timings the report gives. The 27 red runs and the red run of the round-0 script also match. The first-run path in the report now reads `/var/folders/7r/.../T//final/absent.py` (report line 13).

### Verdicts

Items of the brief's "What to build":

- 1: violated. Findings Spec 1 to Spec 9 and Standards 1. Everything the brief and the round's rulings list otherwise holds, as the test and the probes show.
- 2: holds. The head comment lists the cases, including the round's depth and form cases. `GIT_GUARD` is used, exit status and stderr are checked for both blocks and allows, and the last line is `PASS: git_guard.py scratch tests`. The 27 mutation copies each turn it red, and the round-0 script turns it red.
- 3: holds. `git diff` shows the one line after `sync_rules.test.sh` in `docs/dev/building.md`, and the same line with `2>&1 | tail -1` at the same place in `docs/dev/change-standard.md`.

Cases of the brief's "Cases":

- Blocked, push (all seven bullets): met. The test passes on 3.13.4 and 3.9.6, and the `push` mutation goes red.
- Blocked, reset, clean, checkout and restore: met. The test passes, and the `reset`, `clean` and `tree` mutations go red.
- Allowed (the plan skills' commands, text naming a blocked command, no git, empty, unbalanced, the non-command inputs): met. The test passes. Probe set 2 also allows the landing and spec commands (`git worktree remove --force ... && git branch -D ...`, `git -c core.excludesFile=... checkout -b ...`, `git -C "$stable" checkout -q --detach "$tag"`).
- Blocked, other inputs (Monitor, no tool_name, one megabyte, a non-UTF-8 byte around the push): met. The test passes, and the one-megabyte case runs in 0.67 s and 1.18 s.

Points of the round brief:

- 1 (depth): holds. No limit and no depth exit remain (grep above). The lexer runs on an explicit `_Frame` stack, and `_check_text` works through a list instead of recursing. The mixed shape exits 2 on both interpreters. 2000 to 100000 levels are read in under 1 s. The fuzz raised no exception. The deviation on `${x:-` x150 around a plain push is judged under Declined to judge, and the builder's reading is upheld there.
- 2 (`sh -c` operand, `-`/`-s` stdin): violated, Spec 1. The four listed cases and `bash -` / `-s` block, but a combined option word that ends in `o` does not.
- 3 (`!` aliases with arguments and carried configuration): holds. The listed cases block, and my probes `git -c 'alias.p=!sh -c "git push"' p`, `git -c 'alias.p=!git -c alias.q=push q' p` and `git -c alias.p=q -c 'alias.q=!git' p push` also block. The `alias_args` and `alias_config` mutations go red.
- 4 (`--config-env`, `GIT_CONFIG_PARAMETERS`, `--attr-source`): holds for an assignment in the same simple command. `GIT_CONFIG_COUNT=... sh -c 'git p'` and `env GIT_CONFIG_COUNT=... git p` also block. Variables exported by an earlier command are Standards 1.
- 5 (`clean.requireForce` as a boolean): holds for the listed values, and for `" 0"`, `+0` and `FALSE`. `0x0` and `0k` are under Declined to judge.
- 6 (forms the lexer did not read): violated, Spec 2, Spec 3 and Spec 4. `$((` as a subshell, `function`, `coproc`, `$'...'`, the glob command word, `echo -e` escapes and plain `echo ... | xargs git` hold.
- 7 (stdbuf, doas, watch, find -exec): holds. The listed cases block, and so do my probes `watch -x`, `watch --interval=5`, `stdbuf -oL`, `doas -n` and `find . -exec sh -c '...' \;`.
- 8 (docstring): violated, Standards 1. Exit statuses 0 and 2 now match the behaviour (the fuzz and the stress runs raised no exception). The "Not seen" list and the "read as far as the forms below go" sentence do not hold.
- 9 (report): holds. The first-run path is corrected, and the round is appended with old beside new and verbatim output.

### 1. Spec

- Spec 1. `git_guard.py:784-788`: `elif word in _SHELL_VALUED: index += 1` and `elif word[0] == "-" and word[1] != "-": has_c = has_c or "c" in word[1:]`.
  - What is wrong: round point 2 asks that the value of `-o`/`+o`/`-O`/`+O` be skipped. The script skips it only when the option is its own word. In a combined word such as `-co` or `-eco`, bash takes the next word as the value of `o`. The script instead takes that word (`errexit`) as the command string.
  - Probes, exit 0 on both interpreters: `bash -co errexit 'git push'` and `bash -eco pipefail 'git push'`. bash 3.2.57 ran `bash -co errexit 'echo HI-co'` and `bash -eco pipefail 'echo HI-eco'` and printed both markers.
  - This defect came in with the round.
  - Failure scenario: an agent writes `bash -co pipefail 'git push'` and the push runs.
  - Verdict: item 1 and round point 2 violated.
- Spec 2. `git_guard.py:612-615` (`pending.append(chars[:start] + chars[left + 1 : right] + chars[stop + 1 :])`) with `:512-513` (`for word in _expand_braces(parts): self._add_word(...)`).
  - What is wrong: round point 6 asks for brace expansion "into the words bash gives". Bash removes an unquoted word that expands to nothing. The script keeps the empty string as a word.
  - Probes, exit 0: `{,git} push` gives the command word `''`, and `{git,} push` gives the subcommand `''`. bash ran `{,echo} HI-brace1` and `{echo,} HI-brace2` and printed both markers.
  - This defect came in with the round.
  - Failure scenario: `{,git} push` pushes.
  - Verdict: item 1 and round point 6 violated.
- Spec 3. `git_guard.py:832-836`: `texts = [_unescape(arguments[0])]` / `if "%" in arguments[0]: texts.extend(arguments[1:])`.
  - What is wrong: each printf argument is checked as a separate text. A command split across a format's arguments is never read whole, and `%b` arguments are not decoded, although bash decodes them.
  - Probes, exit 0: `printf '%s %s\n' git push | sh` and `printf '%b' 'git\x20push' | bash`. sh ran `printf '%s %s\n' echo HI-printf2 | sh` and bash ran the `%b` form, and both printed their markers.
  - The multi-argument gap is older than the round. Point 6 extended printf decoding without closing it.
  - Failure scenario: `printf '%s %s\n' git push | sh` pushes.
  - Verdict: item 1 and round point 6 violated.
- Spec 4. `git_guard.py:726-732`: `(_Simple(words=words[index:] + text.split()), config) for text in piped`.
  - What is wrong: with `-I REPL`, xargs puts the input in place of the replacement string and does not append it. The script appends, so it checks `git {} push`, and the subcommand `{}` is allowed.
  - Probes, exit 0: `echo push | xargs -I{} git {}` and `echo push | xargs -I % git %`. `echo HI-xargsI | xargs -I{} echo {}` printed the marker.
  - This defect came in with the round.
  - Failure scenario: `echo push | xargs -I{} git {}` pushes.
  - Verdict: item 1 and round point 6 violated.
- Spec 5. `git_guard.py:705-712`: `if name == "eval": while ... words[index] == "eval": index += 1` / `return [*todos, (" ".join(words[index:]), config)]`.
  - What is wrong: bash's and sh's `eval` accept `--` as the end of options. The script lexes `-- git push`, whose command word is `--`.
  - Probes, exit 0: `eval -- git push` and `eval -- 'git push'`. bash ran `eval -- echo HI-eval` and /bin/sh ran `eval -- echo HI-sheval`, and both printed their markers.
  - This defect was already in round 0.
  - Failure scenario: `eval -- git push` pushes.
  - Verdict: item 1 violated (eval).
- Spec 6. `git_guard.py:438-444` (a redirection operator inside any paren context), `:507-508` (the here-document is registered) and `:473-482` (the next lines are consumed as its body).
  - What is wrong: in the arithmetic command `(( y = 1<<2 ))`, `<<` is a shift. The lexer takes it as a here-document with the delimiter `2` and swallows every following line up to a line `2`.
  - Probe: `(( y = 1<<2 ))` + newline + `git push` exits 0. bash ran the same shape with `echo HI-arith` on the second line and printed the marker.
  - This defect was already in round 0.
  - Failure scenario: a script-like command with a shift in `(( ))` followed by `git push` on a later line pushes.
  - Verdict: item 1 violated (newline separator).
- Spec 7. `git_guard.py:398-402`: `elif ansi and text.startswith("$'", self.pos): ... else: self._emit(frame, "$")`.
  - What is wrong: bash's `$"..."` (locale quoting) runs as the quoted text. The script reads `$"git"` as the word `$git`.
  - Probes, exit 0: `$"git" push` and `git $"push"`. bash ran `$"echo" HI-locale`.
  - This defect was already in round 0. Ruling D2, "every form", covers it.
  - Failure scenario: `$"git" push` pushes.
  - Verdict: item 1 violated.
- Spec 8. `git_guard.py:393-397` and `:332-360`: the `${ }` frame leaves the placeholder `${...}` in the word it stands in.
  - What is wrong: in command-word or subcommand position, the default word of `${x:-word}` runs when `x` is unset. The script sees only `${...}`.
  - Probes, exit 0: `${x:-git} push`, `${x:-git push}`, `"${x:-git}" push` and `git ${x:-push}`. bash ran `unset x; ${x:-echo} HI-default` and printed the marker.
  - The docstring's "Not seen" names "a command word or option that a variable ... supplies". A reader can take that to cover these forms, but the text supplies the word here, not a variable. This is the executable counterpart of the case the round's point 1 wording named.
  - This defect was already in round 0.
  - Failure scenario: `${x:-git} push` pushes.
  - Verdict: item 1 violated.
- Spec 9. `git_guard.py:790-793`: `if has_c: ...` / `return None, reads_stdin or not operands`.
  - What is wrong: a shell given `/dev/stdin` as its script file reads the here-string or here-document as the script. The script treats that operand as a script file and ignores stdin.
  - Probe: `bash /dev/stdin <<< 'git push'` exits 0. bash ran `bash /dev/stdin <<< 'echo HI-devstdin'`.
  - This defect was already in round 0.
  - Failure scenario: that command pushes.
  - Verdict: item 1 violated (here-strings and here-documents fed to a shell).

### 2. Proof

None. Every closure the builder claims reproduces:

- all 27 mutation copies are red with the report's first `FAIL:` lines;
- the round-0 script is red on the round's test;
- the depth and one-megabyte timings match;
- the fuzz raised no exception.

No check was loosened. The one case the round's wording asked for is replaced by an allow, and that deviation is judged under Declined to judge.

### 3. Standards

- Standards 1. `git_guard.py:8-15` ("follows the POSIX shell and bash as far as the forms below go ... brace expansions with a comma list ... `sh -c` strings, `eval` ... xargs (with the words an echo or printf pipes into it)") and `:41-46` ("Not seen: ... a command word or option that a variable, a positional parameter, $@ or a substitution supplies ... the escapes of a printf or echo format beyond those bash decodes").
  - What is wrong: round point 8 asks that "Not seen" name every form still not read, "a variable's value" among them. It also asks that the claim of reading as bash reads be kept only as far as it holds.
  - Configuration from variables exported by an earlier command is not read and not named. Probes, exit 0: `export GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=alias.p GIT_CONFIG_VALUE_0=push; git p` and `export GIT_CONFIG_PARAMETERS="'alias.p'='push'"; git p`.
  - The docstring names brace expansion, `sh -c`, `eval`, printf pipes and xargs as read, and Spec 1 to Spec 5 show forms of each that are not.
  - `%b` is an escape bash decodes, so the printf sentence is false for it.
  - The standard broken is change standard rule 14 (a sentence the change makes false is a defect) and the round's point 8.
  - Failure scenario: step 2's offer and a user installing the hook rely on the docstring's list of what is read. They take `export`ed git configuration and the forms above as guarded.
  - Verdict: item 1 and round point 8 violated.

### 4. Behaviour

None. The round's report states each change old beside new, including the deviation on the point-1 case, the 69 s test time and the unlimited stderr line.

### Declined to judge

- The deviation on round point 1, the `${x:-` x150 around plain `git push` case, which the builder allows. This is the orchestrator's call; the evidence and my recommendation follow.
  - In argument position the word of `${x:-word}` is printed and runs nothing. bash 3.2.57 printed `echo HI-text` for `unset x; echo ${x:-echo HI-text}`, and the test's input is `echo ` followed by the nesting.
  - Blocking it would be an exit 2 for a command that runs no git, beyond the approved line "it exits 0 otherwise". That is the same class of defect as round 0's Spec 1.
  - The builder's reading is correct on the merits, and its replacement cases are sound: allowed as text, allowed around `x`, blocked around `$(git push)`.
  - What the ruling may have been aiming at is the command-word position, which is a real gap. That is Spec 8.
  - Recommendation: accept the deviation as built. The lazy option would be to block every `${...}` that contains the word git, which trades a bypass for false blocks.
- `git -c clean.requireForce=0x0 clean -d` and `=0k clean -d`, both exit 0. Whether git's boolean parser falls back to integer parsing with base prefixes and k/M/G suffixes is not stated in `man git-config`. Its integer section states the suffixes only for integer values. Settling it needs git's source or `git -c clean.requireForce=0k config --type=bool clean.requireForce`, and this review runs no git beyond `diff` and `status`.
- `:(literal).` as a whole-tree pathspec (probe set 2, exit 0). The brief's list of whole-tree forms does not name literal magic, and this was not changed in the round.
- Wrappers outside the rulings' lists (`ionice`, `chrt`, `setsid`, `script -c`, `unbuffer`). The lists are closed, so this is the user's call.
- Whether the findings are small enough for landing. Spec 1, 2, 5 and 7 are a few lines each. Spec 3, 4, 6, 8 and 9 need a design choice: printf format filling, xargs `-I` substitution, `((` context, a `${x:-word}` default read as text, and `/dev/stdin`. That split is the orchestrator's call under "Finding dispositions". This was the last round (`repair_rounds: 1`), so these findings go to landing or to Axel, not to the builder.
- pyright, which `python.md` names. It is not in the verify list and was not run.

Reviewer usage: tokens not visible inside this session, 38 tool uses, minutes not measured.

## Closed

The findings of the first run (Spec 1 to 4, Proof 1, Standards 1, Behaviour 1 and 2) and the points it declined on inline configuration and wrappers were each sent in repair round 1 (`agents/briefs/1-round-1.md`, points 1 to 9); the run over round 1 gives each point a verdict of holds except points 2, 6 and 8, whose remaining defects are its Spec 1 to 9 and Standards 1. The findings of the run over round 1 are each fixed at landing on main, since each is small and inside the brief and the ruling "Step 1, the forms of the five operations"; each fix has blocked and allowed cases in `git_guard.test.sh`, and each blocked case of a fix exits 0 on the landed round-1 script and 2 after the fix:

- Spec 1: `_shell_arguments` skips one word for each `o` or `O` in a combined option word (`-co errexit`, `-eco pipefail`, `+o errexit`), and takes `c` and `s` only from a word starting with `-`; `--rcfile` and `--init-file` still take one word.
- Spec 2: `_end_word` removes a word that a brace expansion of more than one word expands to nothing (`{,git} push`, `{git,} push`).
- Spec 3: `_piped_texts` gives printf's output as `_printf` computes it: the format's escapes decoded, each conversion filled from the arguments (`%b` decoding its argument's escapes, `%%` a percent sign), the format reused while arguments remain.
- Spec 4: xargs with `-I <string>` puts each piped line in place of the string in the command's words (`-I{}`, `-I %`); without `-I` the words are appended as before.
- Spec 5: `eval` skips `--` as well as a repeated `eval`.
- Spec 6: a frame records the paren level of an arithmetic `(( ))` opened at a command's start and of `$(( ))`; inside it a redirection operator is read as text, so `(( y = 1<<2 ))` followed by a newline and `git push` is read as two commands.
- Spec 7: `$"..."` is read as the double-quoted text it holds.
- Spec 8: `${NAME:-word}`, `${NAME-word}`, `${NAME:=word}` and `${NAME=word}` give their word in place of the placeholder, split into words in a command and as text inside double quotes, with an inner `${...:-word}` resolved to its word; the word ends at the frame's own closing brace (`${x:-git} push; echo }` blocks).
- Spec 9: a shell whose first operand is `/dev/stdin`, `/dev/fd/0` or `/proc/self/fd/0` reads its script from stdin.
- Standards 1: the docstring names the forms above as read and adds to "Not seen" git configuration from variables exported by an earlier command; the printf sentence now states what `_printf` computes.

The points this run declined to judge:

- The deviation on round point 1 (`${x:-` x150 around plain `git push` in argument position is allowed): accepted as built, on the reviewer's evidence that bash prints that word and runs nothing; the command-word position is Spec 8, fixed above.
- `clean.requireForce=0x0` and `=0k`: `git -c clean.requireForce=<v> config --type=bool clean.requireForce`, run at landing, prints `false` for `0x0`, `0k`, `0K`, `0m` and `0g`, and `true` for `0x1` and `1k`. `_is_false` now reads an integer as git does (sign, decimal, octal or hex, an optional unit k, m or g), fixed at landing with cases.
- `:(literal).`: `git ls-files -- ':(literal).'` in Ordo lists 587 of 587 files, and `':(literal)./'` the same, so literal magic keeps `.` the whole tree and only turns `*` and `**` into file names. `_kind` now reads it so, fixed at landing with cases.
- Wrappers outside the lists (`ionice`, `chrt`, `setsid`, `script -c`, `unbuffer`): each runs its command, so each is a form under the ruling "Step 1, the forms of the five operations"; they are added to `_WRAPPERS` (`script` with its `-c`/`--command` string and the words after its file), fixed at landing with cases.
- Whether the findings are small enough for landing: all were fixed at landing, as above.
- pyright: not installed on this machine (`which pyright` prints `pyright not found`), and installing it is a download from outside Ordo; raised as an open item.
