# Step 2a brief check (on main at fa32d9d)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/2a.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

Every git and guard command below ran in a scratch folder made by `mktemp -d "$TMPDIR/bc2a.XXXXXX"`, with `HOME`, `GIT_CONFIG_GLOBAL` and `GIT_CONFIG_NOSYSTEM=1` pointed at that folder. The folder was removed afterwards, and `git status --short` on the repository still prints only `?? .scratch/2-g-git-guard/agents/briefs/2a.md`.

## 1. Names

- The guard's docstring, `_CHECKS`, the rule texts and the test's head comment: everything that names them is in `git_guard.py` and `git_guard.test.sh`, and both are in the paths. `grep -rn -i 'git guard\|git_guard\|git-guard' skills utils docs README.md CLAUDE.md .agents` finds these hits outside those two files:
  - `skills/repo-setup/SKILL.md` lines 3, 29, 63, 95, 118, 185, 213, 250 and 253 (in the paths). Only line 186 lists the blocks. The others name the hook, its copy or its settings, and the change does not make them false.
  - `docs/roadmap.md:28`, the 2.G heading. `docs/roadmap.md:31` (the goal) lists the five blocks as the entry's goal, not as a description of the guard, so it stays true.
  - `docs/dev/building.md:10` and `docs/dev/change-standard.md:71`, both in the paths.
  - `README.md:13`, `README.md:66` and `README.md:115`. Line 115 names the offer only and stays true. Line 66 is covered in the next bullet.
- The verification page gains `pyright`. `grep -n 'for the skills CLI only\|PyYAML. The verify runner' README.md` prints:
  - `66:- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/checks.sh`, also needs `bash`. ...`
  - `68:- `node` and `npx` on `PATH`, for the skills CLI only. ...`
  Once pyright is in the green check, line 68 becomes false, because pyright is an npm package that runs on node. Line 66, which lists what the checks need, does not name pyright. `README.md` is in the brief's paths, but no item of "What to build" asks for either line to change.
- `grep -rn -i 'reset --hard\|stash drop\|stash clear\|send-pack\|subtree push\|discard-changes\|git switch' skills utils docs README.md CLAUDE.md` finds only `skills/repo-setup/SKILL.md:186`, `docs/roadmap.md:31`, `docs/dev/building.md:10` and `README.md:13`, besides the guard. `grep -rn -i 'stash\|git switch\|subtree\|send-pack' skills utils docs/dev` finds no skill that runs any of the new blocked commands, only the change standard's "no `stash`" rule.
- Open plans' verify lists: `grep -c git_guard.test.sh .scratch/*/orchestrator-state.md` finds the guard's test in 5 state files (2.F, 2.G, 2.H, 2.I and 3). The brief gives the pyright line to the orchestrator at landing, which is what ADR 0010 says.

Findings:
1. `README.md:68` ("`node` and `npx` on `PATH`, for the skills CLI only") becomes false. `README.md:66` does not name pyright as a requirement of the checks. The brief should add both to section 4. Rule 14 of the change standard says a sentence the change makes false is a defect of the change.

## 2. The step line

- "it resolves a git alias from the configuration, as the ruling Git aliases says": section 1.
- "the five further blocks of the ruling Other commands that discard work": section 2.
- "pyright in the verify list ... and what it finds fixed": section 3, first and second bullets. The state files are left to the orchestrator under ADR 0010 (section 3, third bullet).
- check "the test with a configured alias to each blocked operation and to an allowed one": A1 to A5.
- check "a `!` alias": A6.
- check "an unknown subcommand with no alias": A16.
- check "each further form blocked and `git checkout -f <branch>` allowed": B1 to B6.
- check "each new case failing on the unchanged tree": "Verify before you report" 6 and the Cases preamble. The allowed cases (A5, A13, A14, A16, the allowed halves of B2 to B4, and B5) pass on the unchanged tree by their nature. Verify 6 handles them as tests of preserved behaviour, as rule 13 of the change standard does.
- check "the grep of the skills for `checkout -f` quoted": P2 and Verify 4.
- check "`pyright` printing `0 errors` over `git_guard.py`": P1 and Verify 3.
- check "`checks.sh` passing with the new command": no requirement. Verify 1 runs `checks.sh` over the plan's state file, and the brief says the builder writes no state file and the pyright command reaches that list only at landing. So the builder's `checks.sh` run does not include the new command.

Findings:
1. "`checks.sh` passing with the new command" has no requirement the builder can meet. The brief should either say that this part of the check is met at landing (the orchestrator adds the line, then `land.sh` runs `checks.sh` on main), or have the builder run `checks.sh` over a copy of the state file under `$TMPDIR` with the pyright line added, and quote it.

## 3. Premises

- `wc -l` prints `1230 skills/repo-setup/templates/hooks/git_guard.py`, which matches. The docstring runs from line 1 to line 61 (the closing `"""` is line 61), not to line 59. Lines 46 and 47 hold "a git alias defined in a / configuration file", and lines 54 and 55 hold the "Not blocked" list as quoted. Both match.
- `_check_git` is at line 983 and `_GIT_VALUED_OPTIONS` at line 165, holding the six options named. The inline-only alias lookup, the `!` handling and the `seen` set read as described (`sed -n '983,1029p'`). This matches.
- `grep -n '_RULE\b\|^def _rule'` prints the rule functions at 1077, 1081, 1087, 1098 and 1113, the last ending at line 1125. The rule texts are at lines 173 to 176 (`173:_PUSH_RULE`, `174:_RESET_RULE`, `175:_CLEAN_RULE`, `176:_TREE_RULE`), not lines 171 to 174 as the brief says. Line 171 is `_FALSE_WORDS`.
- `_command_of` is at line 1202. `grep -n cwd` over the whole script exits 1. This matches.
- `wc -l` of the test prints 507. Line 2 holds "The test never runs git" and the `GIT_GUARD` sentence, line 20 the `GIT_GUARD` variable, line 28 `python3 "$guard"` and line 49 `write_request()`. This matches.
- pyright: `pyright --version` prints `pyright 1.1.414` at `/Users/axelfaes/.nvm/versions/node/v24.21.0/bin/pyright`, and the run over the script prints `0 errors, 0 warnings, 0 informations` and exits 0. There is no `pyrightconfig.json`. On a scratch file with an incompatible method override, pyright with no config prints `1 error`, with `typeCheckingMode` basic `0 errors`, and with standard `1 error`, so the default is the standard mode. This matches.
- `grep -rn 'checkout -f' skills README.md docs` prints `Binary file skills/repo-setup/templates/hooks/__pycache__/git_guard.cpython-313.pyc matches` and `skills/repo-setup/templates/hooks/git_guard.py:54:...`. The brief says it "finds only" line 54. The `.pyc` file is ignored (`.gitignore:5:__pycache__/`), so a fresh worktree may not have it.
- `grep -n 'git_guard\|pyright' docs/dev/building.md docs/dev/change-standard.md` prints `building.md:10` and `change-standard.md:71`, and neither line holds pyright. This matches.
- `README.md` line 13 and `skills/repo-setup/SKILL.md` line 186 read as quoted, and `SKILL.md` line 5 is `version: "2.1.0"`. This matches.
- `git --version` prints `git version 2.49.0`, and `git --list-cmds=builtins | wc -l` prints 143, with `push`, `status` and `stash` among the names. `git config --get alias.unset` prints nothing and exits 1. `git switch -h` lists `-f, --[no-]force`, `--[no-]discard-changes` and `-C, --[no-]force-create <branch>`. This matches.
- ADR 0010's sentence is quoted correctly (the elision drops ", copied as `/plan` Steps 4 copies them").

Findings:
1. Rule texts: the brief says lines 171 to 174, and the tree has them at lines 173 to 176.
2. Docstring: the brief says lines 1 to 59, and the tree has it at lines 1 to 61.
3. The `checkout -f` grep: the brief says it finds only `git_guard.py:54`, and on main it also prints the binary `.pyc` hit. P2 and Verify 4 quote this grep. The brief should either expect that line or use `grep -rnI`, which skips binary files.

## 4. Cases and checks

- A1 to A20 and B1 to B6 are consistent with "Scripts compute facts; judgment is read" (each case is a fact about the guard's exit and line) and with rule 13 (the allowed cases are controls of the blocked ones).
- P1 and P2 are runs and P3 is a reading, as rules 1 and 13 allow.
- Rule 15 says that each form of input its rules name, and each place where a value from the command reaches a command, is a case. The Cases leave out several of them. These are listed under check 6, items 8 to 13.
- The brief's own text contradicts itself. Section 1's last bullet says "The lookup is the guard's only process; it runs git only as above". Section 1 also has the guard run `git --list-cmds=builtins`, and section 4 says the docstring "states that it runs git only for the lookup". Rule 19 says a change leaves no two statements that contradict each other.

Findings:
1. "The lookup is the guard's only process" contradicts the second process, `git --list-cmds=builtins`, that section 1 requires. The docstring sentence that section 4 asks for would carry the same contradiction. The brief should name both processes.

## 5. The question

- A1, A2, A3, A4, A8, A9 and A10: yes, they could pass without the event's `cwd` being used. The brief fixes the guard's own working directory only for A11 ("the guard's own working directory being the repository"). For the other section-1 cases it does not say where the guard process runs. A test that runs the guard from inside the scratch repository passes A1 to A4 with `cwd` ignored. The brief should say that every case runs the guard from a scratch folder outside any repository unless the case says otherwise.
- A5, A13, A14, A16 and A17 (its allowed half), and A18: these pass on the unchanged tree. Each one catches a defect only after the change (the built-in rule, inline precedence, no stderr, no git, the time limit), so each is a control and not a proof. Answer: no, as controls.
- A18: yes, in part. "under 5 seconds" passes with a time limit of up to about 4.9 seconds, so it does not pin the 2 seconds the brief sets.
- A6, A7, A11, A12, A15, A19 and A20: no. Each one fails on the unchanged tree and needs the lookup.
- B1, B3, B4 and B6: no. B5 is a control.
- B2: yes. The cases can all pass while abbreviated long options of `git subtree` are missed (see check 6, item 14).
- The step line's check and item 3 (pyright): yes, in two ways.
  - `pyright ... 2>&1 | tail -1` exits 0 when pyright reports warnings. On a scratch file with `x + 1` as a statement, pyright printed `0 errors, 1 warning, 0 informations` and exited 0, the pipeline under `bash -o pipefail` exited 0, and `pyright --warnings` exited 1. The verify-list line therefore passes later changes that bring warnings, against rule 6 ("Zero warnings in every configuration").
  - "running on Python 3.9" (What it must do) has no check. pyright 1.1.414 with `--pythonversion 3.9` printed `0 errors` on a scratch file that calls `itertools.pairwise` and `zip(strict=True)`, both of which need 3.10, so pyright does not catch them. `/usr/bin/python3 --version` prints `Python 3.9.6`, and the test can be run under it.
- Item 1, aliases: yes. The cases can all pass while the lookup misses forms git runs. Check 6, items 1 to 7, lists them, each confirmed in a scratch repository.
- Item 1, decision 1 (a `cd` earlier in the command is not followed): yes, in part. The ruling says the lookup runs "in the command's directory (after `-C`)". An agent whose event `cwd` is one checkout and whose command is `cd /abs/other-repo && git p`, with `alias.p = push` only in the other repository's `.git/config`, is allowed and pushes. The brief's argument covers a worktree of the same repository only. Following `cd <literal path>` within the same list before the git command is a fact the lexer can compute. Variables, `cd -` and `cd` with no argument cannot be followed.
- Item 2: yes, through the `git subtree` abbreviations (check 6, item 14).
- Item 4 (the texts): no. This is P3, a reading.

Findings:
1. A1 to A4 and A8 to A10 do not fix the guard's own working directory, so they can pass with `cwd` ignored.
2. The pyright verify line passes when pyright reports warnings. It should be `pyright --warnings skills/repo-setup/templates/hooks/git_guard.py`, with `2>&1 | tail -1` in the change standard's block.
3. The Python 3.9 requirement has no check. The brief should add a run of the test under a 3.9 interpreter (for example `/usr/bin/python3`, put first on `PATH` through a link in a scratch folder), quoted in the report.
4. A18's bound of "under 5 seconds" does not pin the 2-second limit.
5. Decision 1 reads the ruling's "the command's directory" more narrowly than the ruling, and a `cd <path> &&` before git, which agents use routinely, is left unseen. The session judges whether to keep the decision or to follow a literal `cd`. A change would alter the part the step builds.

## 6. Implied inputs

This is a code step. Each item below is missing from "Cases" and carries its expected result. Every claim about git behaviour was checked in the scratch repository.

1. A `!` alias whose text runs another configured alias, reached through location options or the command's own assignments. With `alias.pp = "!pwd; git p"` and `alias.p = push` in `<repo>`, `git -C <repo> pp` run from an outside folder printed the repository's top-level and then ran `p`. With `GIT_CONFIG_GLOBAL=<f> git qq`, where `qq = "!git q"` and `q` are both in `<f>`, the inner `q` ran. Expected: both blocked. Today a `!` text carries only the inline configuration, so the inner lookup would run in the event's `cwd` with the guard's own environment and find nothing. The brief should say that the commands of a `!` text are looked up in the alias's repository top-level, with the outer location options and assignments.
2. A chain of aliases with `-C`. With `alias.p2 = p` and `alias.p = push` in `<repo>`, `git -C <repo> p2` run from outside the repository. Expected: blocked. A7 runs from inside the repository, so it would also pass if the brief's line "The location options seen before an alias stay in force" were not built.
3. A chain from an inline alias to an alias in a file: `git -c alias.p=q p` with `alias.q = push` in the repository. Expected: blocked.
4. The case of a built-in name. With `alias.status = "!echo ALIAS-status"`, `GIT_EXEC_PATH=<empty dir> PATH=<dir holding only a git link> git Status` printed `ALIAS-status`, so git runs the alias where no `git-Status` program exists, as on Linux. On this Mac, plain `git Status` prints `fatal: cannot handle Status as a builtin`. Expected: `git Status` with `alias.status = push` is blocked. The built-in comparison takes the subcommand as typed, because git's built-in match is case-sensitive while its alias match is not.
5. `GIT_CONFIG` in the lookup's environment. With `GIT_CONFIG=<other file>`, `git config --get alias.g` printed the other file's value, while `git g` ran the repository's alias. Expected: `GIT_CONFIG=<file without the alias> git p`, with `alias.p = push` in the repository, is blocked. The lookup removes `GIT_CONFIG` from its environment, including one inherited by the guard.
6. A dotted alias name with a subsection in capitals. With `[alias "Foo"] bar = !echo ...`, `git foo.bar` ran it, while `git config --get alias.foo.bar` exited 1 with nothing printed. Expected: blocked when the value is `push`. Listing the keys with `git config --get-regexp '^alias\.'` and comparing them case-insensitively, as git does, would meet this.
7. A wrapper that changes directory. From an outside folder, `env -C <repo> git p` ran the repository's alias. Expected: `env -C <repo> git p`, `env --chdir=<repo> git p` and `sudo -D <repo> git p` are blocked. The guard already reads these options' values in `_WRAPPERS`.
8. Assignments from the command that reach the lookup's process. Under the brief's rule ("the guard's environment with the simple command's own variable assignments added"), Python's `subprocess.run(["git", ...], env=...)` with `PATH=<dir>` ran `<dir>/git`, and a marker file was written. `GIT_TRACE=<file>` made the lookup write that file, and `GIT_TRACE=1` printed a trace line on stderr. The guard would run a program the checked command names, even when it then blocks that command. Expected: `PATH=<scratch dir holding a git that writes a marker> git st` is allowed and no marker is written. `GIT_TRACE=<scratch file> git st` is allowed and no file is written. The brief should run git by the path found on the guard's own `PATH`, and pass on only the variables that decide which configuration git reads (`GIT_CONFIG_GLOBAL`, `GIT_CONFIG_SYSTEM`, `GIT_CONFIG_NOSYSTEM`, `GIT_CONFIG_COUNT` with its pairs, `GIT_CONFIG_PARAMETERS`, `GIT_DIR`, `GIT_WORK_TREE`, `GIT_COMMON_DIR`, `HOME`, `XDG_CONFIG_HOME`, `GIT_CEILING_DIRECTORIES`), and drop `GIT_CONFIG` as item 5 says.
9. git writing to stderr. `git config --get 'alias.p q'` printed `error: invalid key: alias.p q`, and `git -C '~/r' config --get alias.p` printed `fatal: cannot change to '~/r'`. Expected: `git 'p q'` and `git -C <missing dir> p` are allowed with nothing on stderr. No case has git print anything, since A16's lookup fails silently.
10. Text from the command reaching the lookup. Rule 15 lists this as a place that needs a case. Expected: `git '$(touch <scratch marker>)'` is allowed and no marker is created.
11. One key defined twice (rule 15, "duplicated"). Expected: `alias.p = push` in the global file and `alias.p = status` in the repository gives `git p` allowed. The reverse is blocked.
12. A key that collides with a reserved name (rule 15). Expected: `alias.push = status` run as `git push` is blocked. `alias.stash = status` run as `git stash drop` is blocked. `alias.subtree = push` run as `git subtree split -P x` is allowed: `git subtree` is the external `git-subtree`, which git runs before an alias.
13. Empty values and directory forms (rule 15). `git config --get alias.e` printed nothing and exited 0 for `e =`, and `git e` failed. Expected: `git e` is allowed with nothing on stderr. Expected: `"cwd": ""`, a `cwd` naming a file and a `cwd` that is not a string all use the guard's own directory, with no traceback. Expected: a relative `git -C r p`, with the event's `cwd` the parent of `r` and the guard's own directory elsewhere, is blocked.
14. Abbreviated long options of `git subtree`. `git subtree --pref d push <scratch bare repo> main` pushed: the bare repository gained the branch `main`. Expected: `git subtree --pref x push origin main` is blocked, and so are `--mess`, `--bra`, `--ont` and `--ann` given with their value as a separate word. The rule should accept a unique prefix of each value-taking long option.
15. A tilde in a location. From outside, `git -C ~/r p` (expanded by the shell) ran the alias, while `git -C '~/r' config --get alias.p` exited 128, and `grep -n "expanduser\|tilde"` over the guard finds nothing. Expected: `git -C ~/<repo> p` is blocked, with a leading `~` or `~/` expanded from `HOME`. A location given by a variable or a substitution (`git -C "$repo" p`) should be added to the docstring's "Not seen", since the brief's list for "Not seen" names only `cd` and external programs.
16. Bytes and code points the brief's exception list does not catch.
    - In text mode, `subprocess.run(..., text=True)` over an alias value holding byte `\377` raised `UnicodeDecodeError`, which is neither `OSError` nor `TimeoutExpired`.
    - A subcommand `\ud800` from the JSON escape raised `UnicodeEncodeError` at process start.
    - The unchanged guard blocks `git \ud800 x; git push` (exit 2). Built as the brief says, it would end in a traceback with exit 1, which breaks the docstring's "two exit statuses".
    - Expected: both stay blocked with no traceback. The output is decoded with `errors="replace"`, and an argument that cannot be encoded finds no alias.
17. Many lookups. `subprocess.run` of `git config --get` took 522 ms for 100 runs, and the timeout with a hanging fake git fired at 2003 ms. Expected: a command of many `git <unchecked>` simple commands ending in `git push`, with a git that hangs, is blocked within the hook's time limit. This needs one time budget shared by all lookups, or a lookup cache per name, location and environment. Claude Code's default hook time limit and its handling of a hook that runs past it were not verified here.
18. The guard's own directory for the cases with no `cwd`. Today they would run in the test's working directory, the Ordo checkout or worktree, and read its `.git/config`. Expected: those cases run the guard from the test's scratch folder outside any repository. Otherwise section 4's head-comment sentence ("the test runs git only in scratch repositories it makes") is false.
19. An alias whose name is an external git program. With `alias.mergetool = "!echo ..."`, `git mergetool` ran the external program, and the alias did not run. `git --list-cmds=main,others` lists 176 names, `subtree` and `mergetool` among them. Expected: `alias.mergetool = push` run as `git mergetool` is allowed. Checking the alias name against `--list-cmds=main,others` would meet this and remove the external-program item from "Not seen". If the brief keeps `builtins`, the guard blocks this command, which only blocks more than git would push, and the docstring's wording should read "on the PATH or in git's exec path".
20. A failed `git --list-cmds=builtins`. Expected: with a fake git that answers `config` but exits 1 on `--list-cmds`, `git status` with `alias.status = push` is blocked.

Findings: items 1 to 20 above, each missing from "Cases". Items 1, 4, 5, 7, 8, 14, 15 and 16 are forms in which a push, or a command that discards work, goes through or the guard ends in a traceback. Item 8 is also a command the guard itself runs on the checked command's behalf.

## 7. ADRs

- 0001, 0002 and 0003 (the writing base, prose over academic sources, a fresh reviewer of a draft): they do not touch the step.
- 0004 ("(self-rule)" endings): the step's authority tags name rulings whose bullets end "(the user)" in `plan.md`. It does not touch the step.
- 0005, 0006, 0007, 0008, 0009 and 0011 (choices file, agent ids, repair reviewer, cost script, dispatch blocks): they do not touch the step.
- 0012 ("Every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`"): the guard does not check `commit`, and the change leaves it unchecked. A `git commit` now gets an alias lookup that finds nothing, and the commit is allowed. It does not touch the step.
- 0010 ("`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them. On a difference, the session rewrites the list in the state file and names the change in the brief or the booking."): it touches the step, and the brief names it. On the comparison, the state file's `verify:` list and the change standard's block hold the same 12 commands, but `plan_cost.test.sh` is second in the state file and eighth on both pages (the `awk` extraction of `verify:` beside `sed -n 67,78p docs/dev/change-standard.md`). The brief records no result of the preflight comparison.

Findings:
1. The plan's verify list differs from the verification page in the order of `plan_cost.test.sh`. Under ADR 0010 the brief either names the rewrite of the list in the state file, or states that the comparison found the same commands and that order is not a difference. No part of the brief contradicts an ADR.

## 8. Dictated text

- "git send-pack publishes work and is run by the user by hand" (`grep -n -F 'git send-pack publishes work'` prints line 44): holds. It is plain, ASCII and in the shape of the existing rule texts.
- "git subtree push publishes work and is run by the user by hand" (line 45): holds.
- "git stash {drop or clear} deletes stashed work and is run by the user by hand", with the name in place of the braces (line 46): holds.
- "git switch --discard-changes discards work and is run by the user by hand" (line 47): holds. It names `--discard-changes` for the `-f` forms too, as `_RESET_RULE` names `--hard` for `--ha`. The rule texts all end "and is run by the user by hand". As message strings their shared shape is technical repetition, so the prose standard's "No repeated construction" does not apply.
- `pyright skills/repo-setup/templates/hooks/git_guard.py   # git_guard.py type-checks with no error, in pyright's standard mode` (line 52): the comment is accurate for the command as written. The command breaks the change standard's rule 6 ("Zero warnings in every configuration"), since it exits 0 on warnings (check 5).
- `pyright skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1` (line 52): the filter matches "Commands and their filters". It breaks rule 6 for the same reason.
- `git-guard: blocked: git p (git push is run by the user by hand)` (line 71, A1's expected line): holds. It is the existing line format with the outer simple command shown.
- `git-guard: blocked: <the simple command> (<the rule>)` (line 42): this is the existing format, quoted. It holds.
- The version `2.2.0` (line 63): holds under the skill layout's "Frontmatter". Plan 2.G has not raised the version of `repo-setup` (step 2 kept it, under the ruling "Step 2, the hook's settings text" (3)). With question 10's default answer `[no]`, no run of the skill changes, so the minor part applies.
- The test's head comment, "the test runs git only in scratch repositories it makes, with the user's own configuration shut out" (line 60): this is a requirement on what the sentence says, not dictated words. The sentence becomes false unless the cases with no `cwd` run the guard outside the checkout (check 6, item 18).

Findings:
1. The two pyright lines break rule 6 of the change standard, because the command passes when pyright reports warnings. Both should use `pyright --warnings`, and the `building.md` comment should then read "with no error or warning".

## Declined to judge

- Two points were not verified: whether Claude Code runs a PreToolUse hook before its permission prompt, and how it treats a hook that exits 1 or runs past its time limit. No documentation was read in this session. Check 6, items 8, 16 and 17 rest on the guard's own docstring contract ("two exit statuses", "prints nothing else") and on the guard running a program the command names, not on that behaviour.
- Whether to follow a literal `cd` (check 5, finding 5) is a design choice for the session or the user, because it changes the part the step builds.
- Whether pyright should cover the other Python templates (`sync_rules.py`, `check_config.py`, `plan_cost.py`, `transcript_window.py`). The ruling "pyright for Python templates" names only `git_guard.py`, and that is the user's scope.
- Per-worktree configuration (`extensions.worktreeConfig` with `config.worktree`) can hold aliases a worktree does not share. Decision 1's sentence that a worktree "shares its repository's configuration" ignores this. It was not tested.

Agent usage: a995e6600f66792f5, claude-opus-5-5, 234620 tokens, 58 tool uses, 15.7 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- Names 1 (`README.md` lines 66 and 68): section 3 gains the bullet on `README.md`'s Requirements; "What is on the tree" quotes both lines; P4 reads them.
- The step line 1 (`checks.sh` with the new command): "Verify before you report" 1 runs `checks.sh` over a scratch copy of the state file with the pyright line added, expecting `checks: 13 commands passed`; section 3's last bullet points to it.
- Premises 1 and 2: the rule texts are at lines 173 to 176 and the rules at 1077 to 1125, the docstring at lines 1 to 61; `GIT_GUARD` at line 20.
- Premises 3: the grep is `grep -rnI` in "What is on the tree", P2 and Verify 5.
- Cases and checks 1 (two processes): section 1's last bullet names every git process the guard runs (the listing, the command list, the top-level); section 4 asks the docstring to name them.
- The question 1 (the guard's own directory): the Cases preamble runs every case from `out`, a scratch folder outside any repository, and A11 names the cases run from `<repo>`.
- The question 2 (pyright passes on warnings): both lines use `pyright --warnings`; the `building.md` comment reads "with no error or warning"; "What is on the tree" quotes `pyright --help`.
- The question 3 (Python 3.9): P3 and Verify 4 run the test with `/usr/bin/python3` (3.9.6) first on `PATH`.
- The question 4 (A18's bound): A18 bounds the guard at under 3 seconds, and adds a command of several lookups.
- The question 5 (decision 1, `cd`): section 1 follows a literal `cd`, `~` and a bare `cd`, scoped to subshells and `-c` texts; a non-literal `cd` is named under "Not seen"; A21 tests it; decision 1 is rewritten. The ruling's "the command's directory" is the reading taken.
- Implied inputs 1 (`!` text with location and assignments): section 1's `!` bullet; A24.
- Implied inputs 2: A25. Implied inputs 3: A14's second half.
- Implied inputs 4 (case of a command name): the command-name check is case-sensitive on the name as typed; A13's second half.
- Implied inputs 5 (`GIT_CONFIG`): removed from the process's environment; A26.
- Implied inputs 6 (subsection in capitals): the lookup lists every alias with `--get-regexp` and compares without regard to case; A15's second half; decision 2.
- Implied inputs 7 (wrapper directories): section 1's directory list; A22.
- Implied inputs 8 (assignments reaching a program): `git` found on the guard's own `PATH`, only the configuration variables passed, `GIT_TRACE` removed; A27; decision 6.
- Implied inputs 9 (git's stderr): captured and dropped; A28.
- Implied inputs 10: A29. Implied inputs 11 (one key twice): the last key of the listing wins; A30.
- Implied inputs 12 (reserved names): A31.
- Implied inputs 13 (empty value, `cwd` forms, relative `-C`): A32, A11's added events, A9's third command.
- Implied inputs 14 (`git subtree` abbreviations): section 2 accepts a unique prefix; B2's added forms.
- Implied inputs 15 (tilde, variable locations): `~` expanded from `HOME`; A23; "Not seen" names a location given by a variable.
- Implied inputs 16 (bytes, surrogates): output decoded with `errors="replace"`, `UnicodeError` caught, an unencodable name finds no alias; A33.
- Implied inputs 17 (many lookups): one 2-second budget per run and one listing per location; A18's second command; decision 5.
- Implied inputs 18: the Cases preamble (the guard run from `out`; the test unsets `GIT_DIR`, `GIT_WORK_TREE` and `GIT_CONFIG`).
- Implied inputs 19 (external command names): `--list-cmds=main,others`; A31's `mergetool` and `subtree`; decision 3; the external-program line dropped from "Not seen".
- Implied inputs 20 (command list fails): counts as "not a command"; A34.
- ADRs 1 (verify-list order): the session rewrote 2.G's `verify:` list in the page's order at this preflight; "What is on the tree" names it under ADR 0010.
- Dictated text 1 (pyright lines): closed with The question 2.
- Declined, per-worktree configuration: decision 1 now says the lookup runs from the worktree's directory and so reads `config.worktree`.
- Dictated lines added after the check, each read against the change standard and the prose standard: the `building.md` line `pyright --warnings skills/repo-setup/templates/hooks/git_guard.py   # git_guard.py type-checks with no error or warning, in pyright's standard mode` and the block line `pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1`: hold (rule 6 met by `--warnings`; the filter is the block's form); Verify 1's added verify line, the same command: holds.
