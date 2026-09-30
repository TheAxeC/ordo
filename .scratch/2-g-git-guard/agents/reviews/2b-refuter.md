# Step 2b refuter report (on .agents/worktrees/2g-2b, base 93cdcb74b6c578b574e47327903564a40974cfc1)

A page this report cites is named with its section. A finding in code keeps its `file:line`. Paths are relative to `/Users/axelfaes/workspace/ordo/.agents/worktrees/2g-2b` unless they start with `/`. "The guard" is `skills/repo-setup/templates/hooks/git_guard.py`, "the test" is `skills/repo-setup/templates/hooks/git_guard.test.sh`, "the report" is `/Users/axelfaes/workspace/ordo/.scratch/2-g-git-guard/agents/reviews/2b-report.md`. Every scratch file was under a `mktemp -d` folder in `$TMPDIR`, now removed (`ls -d` prints "No such file or directory"); `pgrep -f 2b-refute` prints 0. `git status --short` in the worktree prints the five modified files and the untracked report, as before the review.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-g-git-guard/orchestrator-state.md   (exit 0)
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

Brief, "Verify before you report":
2. sh <test> 2>&1 | tail -1                         -> PASS: git_guard.py scratch tests
   PATH=/usr/bin:$PATH sh <test> 2>&1 | tail -1     -> PASS: git_guard.py scratch tests   (/usr/bin/python3 --version: Python 3.9.6; python3 --version: Python 3.13.4)
3. ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 <guard>   -> All checks passed! (exit 0)
   ruff format --check --line-length 100 --target-version py39 <guard>                                        -> 1 file already formatted (exit 0)
   pyright <guard>                                                                                             -> 0 errors, 0 warnings, 0 informations (exit 0)
4. LC_ALL=C grep -n '[^ -~]' <guard> <test>   -> prints nothing, exit 1; grep -c of a literal tab prints 0 for each file
5. GIT_GUARD=<guard at the base, from git show> sh <test>   -> FAIL: block git send-pack ../remote.git main: expected exit 2, got 0:   (exit 1)
   A copy of the finished test whose fail() prints and goes on, against the base guard: 54 lines "expected exit 2, got 0", the same 54 cases the report lists; the five preserved lines and every control print no FAIL there. The same copy against the finished guard: 0 FAIL lines.
   The test at the base against the finished guard (B11): PASS: git_guard.py scratch tests
7. grep -rn -i 'send-pack\|subtree push\|stash drop\|stash clear\|discard-changes\|checkout --force\|checkout -f\|destroy it\|five operations' skills utils docs README.md
   -> hits per file: docs/dev/building.md 1, skills/repo-setup/SKILL.md 1, git_guard.py 12, git_guard.test.sh 32, as the report lists them
   grep -rn -i 'destroy it\|five operations' skills utils docs README.md   -> prints nothing, exit 1
8. grep -n 'It is a hook that refuses' -A3 skills/repo-setup/SKILL.md, grep -n 'It can install the git guard' README.md, grep -n 'git_guard.test.sh' docs/dev/building.md: the after-texts as the report quotes them; a Python comparison of the three texts with the brief's "What to build" 3, 4 and 5 prints True for each, and True for the five rule texts and the three dictated head-comment sentences.
   git grep -n -E checkout -- skills utils ':!skills/repo-setup/templates/hooks' | grep -E ' -[A-Za-z]*f[A-Za-z]*( |$)| --f[a-z-]*'   -> skills/diagnose/SKILL.md:176 (git worktree remove --force) and skills/repo-setup/SKILL.md:126 (the new question 10 text); no forced checkout
   git grep -n 'git switch\|[a-z"] switch ' -- skills utils ':!skills/repo-setup/templates/hooks'   -> skills/repo-setup/SKILL.md:126 only; at the base it prints nothing (exit 1)

Commands the report quotes as evidence:
- The 38 changes of the report's table (rows 7 and 8 share one), each written into a scratch copy of the finished guard and run as PATH=/usr/bin:$PATH GIT_GUARD=<copy> sh <non-stop copy of the test>: every run's first FAIL line equals the line the report gives as the test's own first FAIL, and each row's own case fails with the line the report quotes (send-pack entry removed: 8 failing lines; "pus": 16; "-P" removed: 8; range(len(name), ...): 5; words before --: 1; subcommand in _PROGRAMS: 2; unconditional return None: 2, the SUBTREE line among them; _check_text: first FAIL "block cd x && git push", and "block git subtree -P; git push: expected exit 2, got 0"; the two tracebacks for "allow git subtree" and "allow git subtree ''"; expansion = None: the four alias lines; the six changed texts and the swapped order: one "expected the line" each).
- /usr/lib/git-core/git-push origin main and /usr/lib/git-core/git-send-pack ../r main fed to the finished guard: exit 0 for both, as the report says.
- grep -n '^[[:space:]]*git ' <test>: prints nothing, exit 1.
- wc -l: guard 1315, test 610, SKILL.md 190, README.md 180, building.md 33; 95 case lines at test lines 400 to 494; 39 rows in the table.

The brief's cases against the test: a script that takes every backticked command of B1 to B9 from the brief and looks for its "block" or "allow" line in the test prints "total 95 missing 0"; the seven expect_line calls of B10 are in the test with the brief's texts (True for each).

The reviewer's own changes, each one edit of a scratch copy of the finished guard, run through the non-stop copy of the test (the lines the test printed):
- B1. _rule_send_pack returns None: FAIL: block git send-pack ../remote.git main: expected exit 2, got 0:   (and the four other B1 lines, the alias sp line and the send-pack line of B10)
- B2. _rule_subtree never returns the rule: the 14 blocked subtree lines, first FAIL: block git subtree push --prefix=sub origin main: expected exit 2, got 0:
  _take_options given an empty set of valued options: FAIL: block git subtree -P sub push origin main: expected exit 2, got 0:   (10 blocked lines) and FAIL: allow git subtree -P push add origin main: expected exit 0, got 2   (3 controls)
  long prefixes only from three letters: FAIL: block git subtree --p sub push origin main: expected exit 2, got 0:   and --pr, and the controls --p push split and --a push split
  is_program = False: FAIL: block git SUBTREE -P sub push origin main, FAIL: block git Subtree push -P sub origin main, FAIL: block git -c alias.subtree=push subtree origin main (each "expected exit 2, got 0")
  return None after "--": FAIL: block git subtree -P sub -- push origin main: expected exit 2, got 0:
  no alias after the program's rule: FAIL: block git -c alias.subtree=push subtree origin main and ... SUBTREE origin main: expected exit 2, got 0:
  the bound on index removed: FAIL: block git subtree -P; git push: expected exit 2, got 1: Traceback (most recent call last):
- B3. "push" in arguments[index:]: FAIL: allow git subtree split -P push: expected exit 0, got 2: git-guard: blocked: git subtree split -P push (git subtree push is run by the user by hand)   (and merge --prefix push main, --prefix=push pull push main)
  the rule returned for every argument list: all 16 controls of B3 fail, among them allow git subtree add --prefix=sub origin main, allow git subtree -P sub -- split and allow git subtree -Ppush split
  the bound on index removed: FAIL: allow git subtree: expected exit 0, got 1: Traceback   (and -P, --, --prefix, -qP)
- B4. _rule_stash returns None: FAIL: block git stash drop: expected exit 2, got 0:   (5 lines of B4, the alias d line, both stash lines of B10)
- B5. arguments[-1] in place of arguments[0]: FAIL: allow git stash push -m drop: expected exit 0, got 2   (and -q drop, branch clear); "arguments and" removed: FAIL: allow git stash: expected exit 0, got 1: Traceback
- B6. _rule_switch returns None: the 10 lines of B6, first FAIL: block git switch --discard-changes main: expected exit 2, got 0:
- B7. _is_short in place of _is_short_before: FAIL: allow git switch -cfix and FAIL: allow git switch -Cfix: expected exit 0, got 2; option.startswith("--force"): FAIL: allow git switch --force-create new; shortest 3: FAIL: allow git switch --d main; _is_long for --force: FAIL: allow git switch --forc main; a lone dash read as force: FAIL: allow git switch -; the rule returned for every argument list: all 10 controls of B7
- B8. the force loop returns None: the 10 lines of B8, first FAIL: block git checkout -f other: expected exit 2, got 0:
- B8a. _is_short in place of _is_short_before: FAIL: allow git checkout -bfix and -Bfix; "force" in option: FAIL: allow git checkout --no-force other; every word read: FAIL: allow git checkout main -- -f; the force rule returned for every argument list: all 8 controls of B8a and the existing checkout controls
- B9. the alias lines fail with the rule changes of B1, B4, B6 and B8 above; _CHECKS.get(name): FAIL: block git -c alias.stash=push Stash: expected exit 2, got 0:; the builder's change "stash rule for any arguments", rerun: FAIL: allow git -c alias.sl='stash list' sl: expected exit 0, got 2
- B10. the five texts changed by one character each: six "expected the line [...]" failures, one per call; _FORCE_RULE returned for the whole tree: FAIL: git checkout -f .: expected the line [git-guard: blocked: git checkout -f . (git checkout with a whole-tree pathspec discards work and is run by the user by hand)]
- Over the base guard, the 38 changes of the report and these changes together, a script that lists the new cases no run turned red prints "new cases: 102 | never red: 0".

Changes that leave the test green (each printed "PASS: git_guard.py scratch tests"):
- "branch" and "message" left out of the long names of _SUBTREE_VALUED (each alone, and both).
- in _rule_subtree, a long option word holding "=" ends the options.
- _rule_switch reads every word, those after "--" too.

Inputs fed to the guard as the test feeds them (a JSON event on stdin), base exit -> finished exit:
- 3490 commands (every case line of the test, and 36 subcommands with 87 argument lists): 165 differ, all 0 -> 2, every one a send-pack, a subtree push, a stash drop or clear, a forced switch or a forced checkout; 0 exceptions.
- 2 -> 0: git -c alias.stash=push stash; git -c alias.switch=push switch main (decision 15 of the brief, stated in the report).
- 0 -> 0, the plan skills' own commands: sh -c 'cd "$1" && git checkout -q "$2"' land /w 2g-2b; sh -c 'cd "$1" && git -c core.excludesFile="$3" checkout -b "$2-land" main' ...; git -C "$stable" checkout -q --detach "$tag"; git -C "$ORDO_STABLE" checkout -q -- skills/beta/SKILL.md; git -C "$repo" checkout -q -; git sparse-checkout set skills docs; git checkout --theirs -- a.bin; git worktree remove --force "$tmp/tree"; git branch -D 2g-2b 2g-2b-land.
- 0 -> 0, ordinary neighbours: git checkout -b f; git checkout feature-f; git checkout -- -f; git checkout --no-f other; git checkout -t origin/feature; git checkout --track -b f origin/f; git checkout main -- file-f; git checkout -; git switch -t origin/f; git switch --orphan f; git switch -c fix-f; git switch --no-discard-changes main; git switch -Cf other; git stash pop; git stash save drop; git stash -- clear; git stash show drop; git stash list | grep drop; git subtree --onto push -P sub split; git subtree --branch=push split -P sub; git subtree -bpush split -P sub; git subtree -m push -P sub merge x; git worktree add -f ../w other; git branch -f other main; git add -f x; git tag -f v1; git commit -m "git stash drop; git switch -f; git checkout -f"; grep -r 'git checkout -f' .
- 0 -> 2, forms of the blocked operations: git subtree --prefix=sub push o m; git subtree --squash -P sub push o m; git subtree -P sub --i push o m; git sUbTrEe push -P s o m; git -c alias.st='subtree -P sub' st push o m; bash -c 'git subtree push -P s o m'; git stash drop --quiet; git -C x stash clear; git stash apply && git stash drop; echo 'stash drop' | xargs git; git -c alias.x='!git stash clear' x; git switch main -f; git switch --detach -f HEAD; git switch "-f" main; git switch --dis main; git checkout -f HEAD -- file; git checkout -tf origin/x; git checkout -B new -f; git checkout --detach -f HEAD; git -c alias.sp='send-pack' sp.
- 200000 random argument lists for the four subcommands and checkout, in-process, under Python 3.13.4 and 3.9.6: "200000 inputs; 0 exceptions; 52799 blocked" both times.
- 300000 random word lists through the four rule functions against the reviewer's own reading of "What it must do" 2 to 5: "switch no difference", "checkout no difference", "stash no difference"; subtree differs only where a lone "-" stands before push (see "Declined to judge").

Premises of "What is on the tree", on the base copies: wc -l 1230 and 507; _CHECKS at 1193, _check_git at 983, the rule texts at 173 to 176, _rule_push at 1077, _take_options at 833; line 28 and lines 54 to 55 as quoted; grep -n -i five prints only line 54; allow git stash list at test line 194; GIT_GUARD at test line 20; the case file at lines 65 to 399; ls docs/adr prints README.md and template.md; ruff 0.16.5, pyright 1.1.414.

Form of the diff: git diff <base> | grep '^+' searched for now, no longer, further, previously, step numbers, 2b, 2.G and ruling prints nothing; every " -- " in an added line is git's own "--"; the three page changes are one source line per bullet or sentence; no tab and no non-ASCII byte in the five files; git status --short lists README.md, docs/dev/building.md, skills/repo-setup/SKILL.md, the guard, the test and the report, and the diff touches README.md line 13, building.md line 10 and SKILL.md line 126 (now 126 to 129) only. No import is added to the guard.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `_CHECKS` has the four entries (guard lines 1276, 1277, 1282, 1283), the forced checkout is in `_rule_checkout` after the whole-tree test (lines 1188 to 1190), `subtree` is found in any mix of case through `_PROGRAMS` (lines 1046 to 1054), the five rule texts equal the brief's, the three dictated head-comment sentences are present, and the reviewer's reading of "What it must do" 2 to 5 agrees with the rule functions on 300000 word lists except for a lone "-" (Declined to judge).
- 2: holds. All 95 commands of B1 to B9 are lines of the case file with the expected kind, and the seven calls of B10 are in the test. Two clauses of the head comment's line 5 name forms the case file does not hold (Standards 1).
- 3: holds. The four sub-bullets equal the brief's block byte for byte, under "10. Install the git guard? [no]".
- 4: holds. The README sentence equals the brief's; the old sentence is gone.
- 5: holds. The comment of the test's line in `docs/dev/building.md` holds the brief's words.

Cases of the brief's "Cases":

- B1: met. Five lines blocked; red on the base guard and with `_rule_send_pack` returning None.
- B2: met. Seventeen lines blocked; fourteen red on the base guard, the three preserved lines pass there and are red with the alias expansion after the program's rule removed, or with the bound on the index removed.
- B3: met. Sixteen controls allowed; each red under one of the reviewer's changes.
- B4: met. Five lines blocked; red on the base guard.
- B5: met. Eight controls allowed; each red under a change (the reviewer's for six, the builder's reproduced for `git stash ''` and the rest).
- B6: met. Ten lines blocked; red on the base guard.
- B7: met. Ten controls allowed; each red under one of the reviewer's changes.
- B8: met. Ten lines blocked; red on the base guard.
- B8a: met. Eight controls allowed; each red under one of the reviewer's changes.
- B9: met. Four alias lines red on the base guard; the `Stash` line red with the lookup in lower case; the `sl` control red with the stash rule returned for any arguments.
- B10: met. Seven calls; six red on the base guard, `git checkout -f .` passes there and is red with the force text returned for the whole tree.
- B11: met. The test at the base prints `PASS: git_guard.py scratch tests` against the finished guard.
- R1: partial. The head comment of the guard holds against the code in each sentence the diff writes. Line 5 of the test's head comment has two clauses the case file does not bear out (Standards 1).

## 1. Spec

- none.

## 2. Proof

- 1. `skills/repo-setup/templates/hooks/git_guard.test.sh:405` and `:427`: "block git subtree push --prefix=sub origin main" and "allow git subtree --prefix=push pull push main"; what is wrong: these are the only blocked line and the only control with a long option written `--name=value`, and in the blocked one `push` stands before the option, so no case has the subtree command after such a word, which "What it must do" 2 names ("take the text after `=`") and the guard's head comment lists (`--prefix=sub`, guard line 34). The reviewer's change, a long option word holding `=` ends the options in `_rule_subtree`, leaves the test printing `PASS: git_guard.py scratch tests`, and that copy exits 0 on `git subtree --prefix=sub push origin main`, which the finished guard blocks. Rule: change standard, rule 13, fifth bullet (each behaviour whose failure costs something has a case). The brief's B2 holds no such line, so B2 stays met; failure scenario: a later edit of `_take_options` or `_rule_subtree` mishandles `--prefix=sub` in front of the command, the verify list stays green, and an agent's `git subtree --prefix=sub push origin main` publishes work; verdict: none changed. One case line (`block git subtree --prefix=sub push origin main`) closes it.
- 2. `skills/repo-setup/templates/hooks/git_guard.py:193`: `for name in ("prefix", "branch", "message", "annotate", "onto")`; what is wrong: no case has `--branch` or `--message` in its long form (the cases use `-b br` and `-m msg`), so the test stays green with either name, or both, removed (`PASS: git_guard.py scratch tests` three times), and that copy exits 0 on `git subtree --branch br -P sub push origin main` and on `git subtree --message msg --rejoin -P sub push origin main`, which the finished guard blocks; with `onto` or `annotate` removed the test is red. Rule: change standard, rule 13, fifth bullet. The brief's B2 holds no such line; failure scenario: one of the two names is dropped or misspelt in a later edit, the verify list stays green, and the value `br` or `msg` is read as the subtree command, so the push after it runs; verdict: none changed. Two case lines close it.

## 3. Standards

- 1. `skills/repo-setup/templates/hooks/git_guard.test.sh:5`: "subtree push after -P, --prefix=, --pref, -q --prefix, -Psub, -qP, --rejoin -m, --annotate -b --onto, --p, --pr and --" and "stash drop (also with -q or a stash name, and behind env) and stash clear"; what is wrong: the only blocked case with `--prefix=` is `git subtree push --prefix=sub origin main` (line 405), where push stands before the option, and the only case behind `env` is `env git stash clear` (line 442), a clear and not a drop; change standard, rule 14 (a sentence of a head comment is reread against the file), and the report's "Head comments reread" row for line 5 says "each one of the named cases"; failure scenario: a maintainer reading line 5 takes `git subtree --prefix=sub push` and `env git stash drop` for covered and adds no case, which for the first is the gap of Proof 1; verdict: R1 partial.
- 2. `skills/repo-setup/templates/hooks/git_guard.py:34`, `:46`, `:49`: "and -- before the subcommand); the word subtree is", "(-f, -qf, -fb; the rest of the word after b or B is", "(-f, -qf, -fc; the rest of the word after c or C is"; what is wrong: prose standard, B, "Semicolons: at most 2 per 1000 words of running prose", which covers file-header comments. The head comment had 8 semicolons in 823 words at the base and has 11 in 1059 words now; the diff removes one (the old alias sentence), adds these three in its own wording, and adds one in the "Not seen" list, which the brief dictates as an entry of a list already separated by semicolons. The brief check applied this rule to this comment (first run, section 8, finding 3). Failure scenario: the next reader who holds the comment to the prose standard finds the three new sentences joined by semicolons and the step's text is sent back for it; each of the three is a full stop or a second sentence away from compliance; verdict: none changed.

## 4. Behaviour

- none. The report states the new blocks with their lines, the inline aliases named `stash`, `switch` and `send-pack` no longer expanded (reproduced: 2 -> 0 for the first two), the page texts before and after, and the head comment's change; the 3490-command comparison shows no other change of exit status.

## Declined to judge

- What git itself does with any of the forms: the review may run no git command but `git diff`, `git status`, `git grep`, `git log` and `git show`, so the brief's probes of git 2.49.0 and the builder's two probes in a scratch repository (`git -c alias.stash=status stash list`, `git -c alias.subtree='!echo ran-alias' subtree`) were not rerun. Every verdict above is about the guard's exit status, not about git.
- `git subtree - push origin main`: the guard exits 0, while "What it must do" 2 says "A word starting with a dash is an option", which read literally skips the lone dash and finds push. Whether git runs a push there is not verified, so this is neither a finding nor a pass.
- `_rule_switch` reading the words after `--`: the test stays green with that change, and the change blocks `git switch -- -f`. Whether git runs any `git switch` with a dash word after `--` is not verified, so no cost is shown and no finding is made.
- Commands outside the two rulings that discard or publish work: `git checkout-index -f -a` exits 0 on the base and the finished guard; `git stash pop`, `git switch -C` and `--force-create` are allowed by the brief's decisions 4 and 6. Whether any is added is the user's call.
- `git switch -f -c new` and `git checkout -f -- <path>`, blocked as the ruling words it (decision 7): narrowing is the user's call.
- A file system that distinguishes case, a machine without the `git-subtree` program, and git versions other than 2.49.0: not available here.
- What Claude Code does with a hook that exits 1 (the traceback cases): not verified.
- The report's counts "381 `ok:` lines" and "444 cases, 288 of them `exit 2`": produced by the builder's scratch scripts, not rerun; and two line numbers in its "Head comments reread" table differ by one from `grep -n` (`_check_simple` is at guard line 803, `block git push --dry-run` at test line 70). No decision rests on any of them.
- The text of question 10 and the sentence lengths of the three dictated page texts: the text is the user's by the ruling "Step 2b, the offer's text in question 10"; the review compared it with the brief byte for byte and judged nothing more.
- The docstring of the guard is wrapped at 100 columns, as at the base and as the ruff line length requires; the no-hard-wrap rule was checked on the three pages and the test's comments only.

Reviewer usage: not known to the reviewer; the runner's completion notice gives the tokens, tool uses and time.
