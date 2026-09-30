# Step 2b brief check (on main at 6adcd8e)

`git rev-parse --short HEAD` printed `6adcd8e` at the start and `f5df93a` at the end. Three commits landed on main while the check ran (`git log --oneline 6adcd8e..HEAD`: `aca844c Book three rulings of plans 2.G and 2.H`, `53dbfc7`, `f5df93a`). `git diff --stat 6f40399 HEAD -- skills docs utils README.md` prints nothing, so the files the brief describes are the same at all three commits. `git diff --stat 6adcd8e HEAD -- .scratch/2-g-git-guard/agents/briefs/2b.md` prints nothing, so the brief is unchanged. `.scratch/2-g-git-guard/plan.md` did change: see Section 2, finding 1, which is the largest finding of this report.

`git status --short` at the end prints nothing. The scratch folder `$TMPDIR/ordo-2b-check` is removed (`ls -d` prints "No such file or directory"). git is 2.49.0 (`git --version`), on APFS.

Method for sections 4 to 6: a scratch copy of the guard with items 1 to 4 of "What it must do" written literally (called "the prototype" below), and the unchanged guard, each fed every command as a hook event. The prototype is my reading of the dictated rules, not the builder's code.

## 1. Names

Commands: `grep -rn -i 'send-pack\|subtree push\|stash drop\|stash clear\|discard-changes\|five operations' skills utils docs README.md` prints only `git_guard.py:54` and `:55`. `grep -rn -i 'whole-tree\|whole tree\|git guard\|git_guard\|git-guard' skills utils docs README.md` (guard and test excluded) prints the lists of blocked commands at `skills/repo-setup/SKILL.md:126`, `README.md:13`, `docs/dev/building.md:10` and `docs/roadmap.md:38`, and no other list. `git grep -n -i -e stash -e subtree -e send-pack -e 'git switch'  -- skills utils docs README.md` (guard files excluded) prints only `docs/dev/change-standard.md:57` and its template at `:56` ("no `add`, `commit`, `stash`, ..."), so no skill or script runs a command the step blocks. `grep -n -i guard CLAUDE.md docs/dev/building.md` prints only `building.md:10`.

Outside the brief's paths: no place is made false. `docs/roadmap.md:38` names the five operations of the goal and stays true, as the brief says.

Inside the paths, places the items do not reach:

1. `git_guard.test.sh:4`, "# Blocked, reset, clean, checkout and restore: reset --hard in each position, ...". Item 7 says "line 4 gains the new blocked cases". The line's label then names four commands and holds cases of send-pack, subtree, stash and switch. Failure scenario: a reader looking for the switch cases reads the label of line 4, finds no switch in it, and concludes the test has none. The item should say the label changes too, or that a new line is added for the four subcommands.
2. `git_guard.py:28`, "(they publish work or destroy it)". The texts the brief dictates for the three pages say "publish work or discard it", and every rule text says "discards". See Section 8, finding 6.
3. Verify 7's grep pattern has no term for a forced checkout. After the ruling of Section 2, finding 1, the step changes a checkout rule too, and the pattern would not show the places that name it.

## 2. The step line

Command: `git diff 6adcd8e HEAD -- .scratch/2-g-git-guard/plan.md`, and `awk '/^## Open items/,/^## Closed items/' .scratch/2-g-git-guard/orchestrator-state.md`, which now prints "none".

1. The brief is prepared with option (b) of the open item, and Axel has ruled (a). Place: `plan.md`, Rulings, "Step 2b, the forced checkout and switch (2026-09-30): Axel ruled (a). Step 2b blocks `git switch` with `--discard-changes` (or a prefix from `--di`), `-f` or `--force`, and `git checkout` with `-f` in a short-option word or `--force` (or a prefix from `--f`), with the messages `git switch --discard-changes discards work and is run by the user by hand` and `git checkout --force discards work and is run by the user by hand`; this replaces the part of the ruling "Other commands that discard work" that left `git checkout -f <branch>` allowed (the user)." The step line now reads "check: the test with each form blocked, the forced `git checkout` and `git switch` among them". The brief contradicts this in: "What is on the tree" (the ruling bullet, "stays allowed"), case B8 ("`git checkout -f other` and `git checkout --force other`: each allowed"), Decision 1 ("until he rules it stays allowed (B8)"), item 6 ("Not blocked: git checkout -f, with or without a branch, which discards work; ..."), "What to build" item 1 ("four new entries of `_CHECKS`", with no change to `_rule_checkout`), and the three page texts, which name `git checkout` only "of the whole tree". Failure scenario: the builder follows the brief, `git checkout -f other` exits 0, and the step's check as the plan now states it fails at review.
   Probes of git 2.49.0 for the checkout rule the brief now needs (scratch repository, files `f` and `g` modified before each command):
   - Discard the changes: `git checkout -f other`, `--force other`, `--forc other`, `--fo other`, `--f other`, `-f` alone, `-qf other`, `-fq`, `other -f`, `-df`, `--detach -f other`, `-lf other`, `-fb new` and `-f -b new` (with and without a start point, unlike `git switch -fc new`), `-f --orphan o`, `--no-force -f other`.
   - Discard one file: `git checkout -f -- f` and `git checkout -f f` restore `f` and leave `g` changed. The ruled wording blocks them, while `git checkout -- f` stays allowed.
   - Discard nothing: `git checkout -bfix`, `-Bfix` and `-bf` create the branches `fix`, `fix` and `f` with both files still changed. `--no-force other`, `--no-f other` and `-f --no-force other` keep the changes. git refuses `-tf other`, `-mf other` and `-f -p`.
   - Consequence: "`-f` in a short-option word", built as written, blocks `git checkout -bfix`, which creates a branch and discards nothing. The rule needs the same limit item 4 gives switch: `f` before any `b` or `B` in the word. `land.sh:400` runs `git ... checkout -b "$2-land" main` with the name as a separate word, which is not affected.
   - `grep -n checkout git_guard.test.sh | grep -E ' -[a-zA-Z]*f|--f'` prints only the head comment line 4, so no existing case of the test has a forced checkout.
2. The step line's check ends "and the grep of the skills for `checkout -f` quoted". No line of "Verify before you report" and no part of "Report" asks for it. The grep the brief quotes under "What is on the tree" also does not find what it says it finds (Section 3, finding 1). A grep that covers the forms: `git grep -n -E checkout -- skills utils ':!skills/repo-setup/templates/hooks' | grep -E ' -[A-Za-z]*f[A-Za-z]*( |$)| --f[a-z-]*'`, which prints one line today, `skills/diagnose/SKILL.md:176`, a `git worktree remove --force` on a line that also holds the word "checkout", and no forced checkout.
3. What the brief adds beyond the step line and its rulings:
   - `git switch` with `-f`, `--force` and the prefixes of `--discard-changes`: Decision 1 lists it, and the new ruling now covers it.
   - `git send-pack --dry-run` blocked: Decision 2 lists it.
   - How `push` is found after `subtree`: Decision 3 lists it.
   - `git stash pop` left allowed: Decision 4 lists it.
   - The switch message naming the long option: Decision 5 lists it, and the new ruling gives the same text.
   - `git switch -C` and `--force-create` left allowed: Decision 6 lists it.
   - README naming two commands with "such as": Decision 7 lists it.
   - Not listed: the README sentence is also reordered ("into `.claude/hooks/`" moves in front of "a hook that refuses"), and the SKILL.md sub-bullet is split from one sentence into three. Neither is needed to add the commands.
   - Not listed: the procedure "the builder makes one small change to the finished guard that takes out the behaviour the case names, runs the test, and takes the change out again", with a five-column table. The change standard's rule 13 asks for the failure on the unchanged tree and a three-column table.
   - Not listed: the text of question 10 is the offer's text Axel approved by reading (ruling "Step 2 reading", and the plan's gate "`repo-setup`'s text for the offer read by you"). The brief rewrites it and no item asks for his reading of the new text.

## 3. Premises

Confirmed as the brief states them: `wc -l` 1230 and 507; `_CHECKS` at 1193; `_check_git` at 983; the four rule constants at 173 to 176; `_options`, `_is_long(argument, name, shortest)`, `_is_short(argument, letter)`, `_take_options(words, start, valued)` at 833; head comment lines 28 to 37 and 54 to 55 as quoted; `grep -n -i five` prints only `git_guard.py:54`; `allow git stash list` at test line 194; `grep -n 'send-pack\|subtree\|switch' git_guard.test.sh` prints nothing (exit 1); `sed -n 126p skills/repo-setup/SKILL.md`, `sed -n 13p README.md` and `sed -n 10p docs/dev/building.md` hold the quoted texts; `docs/roadmap.md:38` is the goal; `ruff 0.16.5`, `pyright 1.1.414`; `ls docs/adr` prints `README.md` and `template.md`. The switch probes: `--discard-changes`, `--discard`, `--di`, `-f`, `--force` discard the change; `--d` is refused as ambiguous between `--discard-changes` and `--detach`; `--forc`, `--fo`, `--f` are refused as ambiguous between `--force-create` and `--force`. The stash probes: `drop`, `drop -q`, `drop 'stash@{0}'` and `clear` remove a stash; `-q drop` and `dro` are refused with "subcommand wasn't specified". The subtree probes: all five forms pushed; `OPTS_SPEC` in `$(git --exec-path)/git-subtree` gives the value options `P,prefix=`, `annotate=`, `b,branch!=`, `onto=`, `m,message!=` and the others as listed.

Differences:

1. "What is on the tree", the bullet "No skill and no script under `utils/` runs a forced checkout or any `git switch`: `git grep -n -e 'git checkout' -e 'git switch' -- skills utils ':!skills/repo-setup/templates/hooks'` prints `skills/land/templates/land.sh:366` and `:400` ..., `utils/pin.sh:391` and `utils/pin.test.sh:205`, `:367`, `:376` ...". Run as written, the command prints `land.sh:60` (a comment, "the root of a git checkout"), `land.sh:366`, `land.sh:400`, `skills/repo-setup/SKILL.md:126` and `skills/spec/SKILL.md:147`. It prints no line of `utils/`: those lines are `git -C "$stable" checkout ...`, which the pattern `git checkout` does not match. Failure scenario: a skill line `git -C "$dir" checkout -f main` would pass this grep unseen. The conclusion still holds by the wider grep of Section 2, finding 2.
2. "`git send-pack <repo> <ref>` pushed, and so did `git send-pack --dry-run <repo> <ref>:x` to a local repository." Probe: `git send-pack --dry-run $S/remote.git main:x` exits 0, prints ` * [new branch]      main -> x`, and `git -C remote.git for-each-ref` prints nothing afterwards. The dry run pushes nothing. Decision 2 (blocked as `git push --dry-run` is) does not depend on it.
3. "`_rule_push` to `_rule_restore`, lines 1077 to 1128": `_rule_restore` ends at line 1125, and line 1128 opens `_split_pathspecs`. "`expect_line` calls (lines 420 to 428)": the last call spans 428 to 429. "Read" item 1, "the option tables and rule texts (lines 150 to 176)": line 150 is inside the `sudo` entry of `_WRAPPERS`; git's option tables are at 165 to 171.
4. Item 2 of "What it must do" says the long options are read "each also as a prefix of three characters or more (`--pre`)". git accepts shorter ones: `git subtree --p sub push origin main` and `--pr sub push origin main` each pushed (the remote held `main` afterwards), as did `--a x`, `--an x`, `--b br`, `--br br`, and with `--rejoin`, `--m msg` and `--me msg`. The eleven long names start with eleven different letters, so every one-letter prefix is unique. See Section 5, finding 1.
5. The ruling bullet quotes the ruling "Other commands that discard work" correctly, but the ruling "Step 2b, the forced checkout and switch" now replaces its last part (Section 2, finding 1).

## 4. Cases and checks

Commands: each line of B1 to B10 fed to `python3 git_guard.py` as `{"tool_name": "Bash", "tool_input": {"command": ...}}`.

The unchanged guard exits 0 with no output for every command of B1 to B10. So the blocked cases of B1, B2, B4, B6, B9 and B10 fail there, and B3, B5, B7, B8 and the allowed line of B9 pass there, as the brief says. The prototype gives the brief's expected result for all 54 case lines and the five `expect_line` texts of B10 word for word (for `git stash drop 'stash@{0}'` the line shows `stash@{0}` without quotes, as the lexer removes them). A scratch copy of the test with the 54 lines added to the case file and the five `expect_line` calls printed `FAIL: block git send-pack origin main: expected exit 2, got 0:` with `GIT_GUARD` at the unchanged guard, and `PASS: git_guard.py scratch tests` with the prototype. The cases are consistent with the lexer, `_options`, `_is_long`, `_is_short`, the wrappers (`sudo`, `env`), `-C`, `-c` and inline aliases.

Each "Verify" check can be run as written: check 1 printed the eleven `$ <command>` lines, each with its pass line, then `checks: 11 commands passed` on the unchanged tree; both ruff commands printed `All checks passed!` and `1 file already formatted`; pyright printed `0 errors, 0 warnings, 0 informations`; the ASCII grep printed nothing with exit 1; `GIT_GUARD` is read at test line 20.

Findings:

1. "Cases", the paragraph after B11: "the builder makes one small change to the finished guard that takes out the behaviour the case names, runs the test, and takes the change out again." The change is made in the worktree's own file. Failure scenario: one of about fifty such changes is left in, or is taken out wrongly, and the guard that lands lacks a block while the last test run the report quotes predates it. The test already takes another script through `GIT_GUARD` (its line 2: "such as a scratch copy with one block removed"), and step 1's brief used that ("a scratch copy of the script under `$TMPDIR` with that block's check removed is run by the test through `GIT_GUARD`"). Wording that holds: "in a scratch copy of the finished guard under `$TMPDIR`, run by the test through `GIT_GUARD`".
2. Three cases name commands that git refuses or that do no harm, so they do not carry the cost written beside them:
   - B1, `git send-pack origin main`: `git send-pack` takes a path or URL and refuses the remote name (exit 128, the remote unchanged). The guard blocks it either way.
   - B2, `git subtree --annotate x -m msg -b br --onto y -P sub push origin main`: git exits 1 with "fatal: the '-m' flag does not make sense with 'git subtree push'". A form that pushes with `-m`: `git subtree --rejoin -m msg -P sub push origin main` (probed, pushed).
   - B6, `git switch -fc new`: git creates the branch and keeps the modified file (`f=changed`). `git switch -fc new other` discards it (probed).

## 5. The question

Could the cases and checks pass without the goal being reached? Yes, in the places below. Each was probed on git 2.49.0 and run through the prototype.

1. Item 2, "each also as a prefix of three characters or more (`--pre`)". The only prefix case is B2's `--pref`.
   - Missed: `git subtree --p sub push origin main` and `git subtree --pr sub push origin main` pushed; the prototype exits 0 for both, reading `sub` as the subtree command. The same for `--a x -P sub push`, `--an x`, `--b br`, `--br br`, `--rejoin --m msg`, `--rejoin --me msg`.
   - Newly blocked though harmless: `git subtree --p push split` and `git subtree --pr push split` split the folder `push` and publish nothing; the prototype exits 2 for both, as for `git subtree --a push split -P sub` and `--o push split -P sub`.
   - The text is also ambiguous: `--pre` has five characters with its dashes, and `_is_long` counts the dashes (`--ha` is 4). A rule that holds: a word `--x...` is a value option when it is a prefix of `--prefix`, `--branch`, `--message`, `--annotate` or `--onto` of any length from one letter after the dashes. Cases to add: `block git subtree --p sub push origin main`, `allow git subtree --p push split`.
2. `_CHECKS.get(subcommand)` compares the subcommand as written. On a file system that ignores case (APFS here), `git SUBTREE -P sub push origin main` and `git Subtree push -P sub origin main` each pushed, since git runs the program `git-subtree` by file name. The prototype exits 0 for both. It does not apply to the built-in commands: `git SWITCH -f other` and `git STASH list` end with "fatal: cannot handle SWITCH as a builtin". No case covers it.
3. Item 2 ends "After a word `--`, the next word is the subtree command", and no case has a `--`. `git subtree -P sub -- push origin main` pushed. A builder who leaves the sentence out passes every case. Cases to add: `block git subtree -P sub -- push origin main`, `allow git subtree -P sub -- split`.
4. Item 4 says "`f` before any `c` or `C`", and the only control is `git switch -cfix`. `git switch -Cfix` creates the branch `fix` and discards nothing; a rule that stops only at `c` would block it and pass the test. Case to add: `allow git switch -Cfix`. After the new ruling the checkout rule needs the matching controls `allow git checkout -bfix` and `allow git checkout -Bfix`.
5. Commands the dictated switch rule blocks though git discards nothing: `git switch -c new9 -f`, `git switch -f -c new`, `git switch -cq -f` (a new branch with no start point; the file stayed changed) and `git switch -f --no-force other`. B6's `git switch -fc new` is one of them. Each carries a force option, so whether this is inside "no command outside those is newly blocked" is listed under "Declined to judge".
6. A path to git's own program is not read as git: `/opt/homebrew/opt/git/libexec/git-core/git-send-pack <repo> main` pushed, and the prototype and the unchanged guard exit 0. The same holds today for `.../git-core/git-push`, so it is not new with this step, and the head comment's "Not seen" does not name it. `git --exec-path=<dir> send-pack ...` is blocked by the prototype.
7. Probed and found right under the dictated rules. Blocked: `git switch other -f`, `other --force`, `-fd HEAD`, `-df HEAD`, `--detach -f HEAD`, `-f -- other`, `-fq other`, `--dis other`, `-c new11 --discard-changes other`, `-c newt -t other -f`, `-f --orphan newo2`, `--no-force -f other`; `git stash drop --`, `git -P stash drop`, `git --no-pager stash clear`; `git subtree push origin main -P sub`, `-dqPsub push`, `-bbr -P sub push`; `echo 'stash drop' | xargs git`, `bash -c 'git stash clear'`, `git -c alias.x='!git stash drop' x`. Allowed: `git switch push`, `git switch drop`, `git switch clear`, `git switch -c new`, `git switch -Cf other`, `-qcf`, `--no-discard-changes other`, `--no-force other`, `-- other`, `-m other`, `--force-c other`, `-d HEAD`; `git stash list`, `git stash -- drop` (stashes the file `drop`), `git stash push drop`, `git stash save drop`, `git stash -m clear`; `git subtree pull -P sub push main`, `split -P sub -b push`, `split -P sub --annotate push`, `split -P sub --onto push`; `git checkout -b push`, `git branch drop`, `git log --grep 'stash drop'`, `git commit -m "git stash drop"`, `git config alias.x 'stash drop'`.
8. One result changes for an existing form: `git -c alias.subtree=push subtree` is blocked by the unchanged guard and allowed by the prototype. git ignores an alias named as one of its commands (`git -c alias.subtree=version subtree` prints subtree's usage), so the new result is the right one.

## 6. Implied inputs

1. Words missing after the subcommand: `git subtree`, `git subtree -P` (a value option as the last word), `git subtree --`. No case. A wrong answer costs this: an index past the end raises a traceback, Python exits 1, the hook does not block, and the rest of the command line runs, so `git subtree -P; git push` would push. The prototype exits 0 on the first three and 2 on the last. Cases to add: `allow git subtree`, `allow git subtree -P`, `allow git subtree --`, `block git subtree -P; git push`.
2. The subtree long options at one and two letters: no case (Section 5, finding 1).
3. `--` in a subtree command: no case (Section 5, finding 3).
4. A subcommand in upper case on a file system that ignores case: no case (Section 5, finding 2).
5. Python 3.9: the README says the guard needs "`python3` 3.9 or later", the ruff commands check syntax for `py39`, and no check of the brief runs the test under 3.9. `/usr/bin/python3 --version` prints 3.9.6 here. Cost: a standard-library call newer than 3.9 passes ruff and the test under 3.13.4 and gives a traceback, so no block, in a clone on 3.9. Check to add: `PATH=/usr/bin:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1`, or the builder's 3.9 interpreter.
6. Inputs the brief has a case for: a wrapper (`sudo`, `env`), `-C`, `-c`, an inline alias to a blocked and to an allowed command, the option after the branch (`git switch main --discard-changes`), combined short options (`-qf`, `-qP sub`), a value that is the word (`-P push`, `--prefix=push`, `-m drop`, `branch clear`), a quoted word (`'stash@{0}'`).

## 7. ADRs

`ls docs/adr` prints `README.md` and `template.md`. No record exists, so none touches the step.

## 8. Dictated text

1. `README.md`, the `repo-setup` row, the sentence of "What to build" item 4: "It can install the git guard into `.claude/hooks/`, a hook that refuses the git commands of an agent that publish work or discard it, such as ...". The words "a hook that refuses" now follow `.claude/hooks/`, so the sentence says the folder is a hook; and "the git commands of an agent that publish work" reads as the agent publishing. Step 2's review already had a finding on this sentence being misread (`2-refuter.md`, Standards 2). Rule: prose standard, "Plain prose only". A wording that holds, keeping the present order: "It can install the git guard, a hook that refuses in an agent's commands the git commands that publish work or discard it, such as `git push` and `git reset --hard`, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add."
2. "What it must do" item 6, the words for the switch bullet: "with -f in a short-option word". Item 4 allows `-cfix`, a short-option word that holds `f`. A head comment written from item 6 is false for that word, against rule 14 ("A sentence in a document or a head comment that the change makes false is a defect of the change"). Wording that holds: "or a short-option word holding f before any c or C (-f, -qf, -fc)".
3. Item 6, the paragraph for lines 54 to 55: "Not blocked: git checkout -f, with or without a branch, which discards work; git switch -C and --force-create, which move a branch; and git stash pop." After the ruling of Section 2 its first clause is false. Its other claims hold: `git switch -C new other` and `--force-create new other` kept the modified file. It also adds two semicolons to a comment that has seven (prose standard B, "at most 2 per 1000 words of running prose"). Wording that holds after the ruling: "Not blocked: git switch -C and --force-create, which move a branch and keep the changes in the tree, and git stash pop, which applies the stash before it drops it."
4. `skills/repo-setup/SKILL.md`, question 10, the text of item 3: the list has "`git checkout` or `git restore` of the whole tree, `git switch --discard-changes`". After the ruling the guard also refuses a forced checkout, and the list does not name it. Wording that holds: "... `git checkout` or `git restore` of the whole tree, `git checkout --force`, `git switch --discard-changes`, `git stash drop` and `git stash clear`." The rest of the text was read against `docs/dev/skill-layout.md` and the glossary; no term of the glossary is used in a new sense.
5. `docs/dev/building.md`, the comment of item 5: "checkout and restore of the whole tree, switch --discard-changes, stash drop and clear". The same gap after the ruling. Wording that holds: "checkout and restore of the whole tree, checkout --force, switch --discard-changes, stash drop and clear".
6. `git_guard.py:28` keeps "(they publish work or destroy it)" while the new page texts say "publish work or discard it" and the rule texts say "discards". Rule: prose standard D, "No synonym cycling". Item 6 should change line 28 to "discard it".
7. "What is on the tree" and "What to build" items 3 to 5 cite pages by line number ("`skills/repo-setup/SKILL.md` line 126", "`README.md` line 13", "`docs/dev/building.md` line 10", "`docs/roadmap.md` line 38"). Rule: change standard, "Where the work happens": "A ledger file cites a page (the rules page, a standard, a skill's text) by its section, never by a line number", with the line ranges kept only under "Paths this step writes". Each item also names the place in words and items 4 and 5 quote the text, so the builder can find it; the line numbers in the items are what breaks the rule.
8. The four rule texts of items 1 to 4 were read against the four that exist and the prose standard: they hold, and each claim in them was probed (`git stash drop` and `git stash clear` remove stashes; the switch options discard the change). The ruling gives a fifth, `git checkout --force discards work and is run by the user by hand`, which the brief does not yet carry.

## Declined to judge

- Whether the brief is reworked for ruling (a) and checked again before dispatch: the orchestrator's, under the `spec` skill.
- Whether `git switch -f -c new`, `git switch -c new -f` and `git switch -f --no-force other`, which carry a force option and discard nothing, should be blocked: the ruling's wording blocks them; narrowing it is the user's call.
- Whether `git checkout -f -- <path>`, which discards one file, is meant by the ruling's "`git checkout` with `-f`": the wording blocks it while `git checkout -- <path>` stays allowed; the user's call.
- Other commands that remove stashes, each probed: `git stash pop` (Decision 4), `git reflog expire --expire=now --all` (2 stashes to 0), `git update-ref -d refs/stash` (2 to 0), `git reflog delete --rewrite --updateref 'stash@{0}'` (2 to 1). None is named by the ruling; the user's call.
- Whether the path form of Section 5, finding 6 belongs to this step or to the head comment's "Not seen": it predates the step and holds for `git push` too; the orchestrator's.
- Whether Axel reads the new text of question 10 before it lands: his call, since the earlier text was approved by his reading.
- Whether `README.md`, `skills/repo-setup/SKILL.md` or `docs/dev/building.md` is a shared path with a step in flight in another plan: not among the eight checks, and the orchestrator's under the `spec` skill.
- git versions other than 2.49.0, and a file system that distinguishes case: not probed.
- The builder's code: the prototype shows the dictated rules can give the expected results, not that the builder's code will. The full scratch test was run under Python 3.13.4 only; under 3.9.6 one command was fed to the prototype (`git stash drop`, exit 2).
- Whether the five-column table and the procedure of changing the guard per case are wanted beyond rule 13's table: the orchestrator's.

Agent usage: claude-opus-5-5 (ordo-high), 219616 tokens, 29 tool uses, 16.7 minutes ($1.63 to $5.38).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Section 2 finding 1, section 8 findings 3, 4, 5 and 8: the brief builds the ruling "Step 2b, the forced checkout and switch": item 5 of "What it must do", cases B8 and B8a, the fifth rule text, the page texts and the head comment, with `f` counted only before a `b` or `B`.
- Section 2 finding 2 and section 3 finding 1: the premise and "Verify" 8 use the grep that finds a forced checkout in any form, quoted in the report.
- Section 2 finding 3: Decisions 7 to 13 list the additions; the table has the columns rule 13 has once step 3a of plan 2.H has landed, before which this step is not dispatched; the reading of question 10's new text is the open item "Step 2b, the offer's text in question 10, for your reading".
- Section 3 findings 2 to 5: the premises corrected (the dry run, the line ranges, the prefixes, the ruling).
- Section 1 findings 1 to 3 and section 8 finding 6: the test's head comment gets a labelled line for the four subcommands, line 28 of the guard says "discard it", and "Verify" 7 greps the forced checkout.
- Section 4 finding 1: the change per case is made in a scratch copy run through `GIT_GUARD`. Finding 2: the cases B1, B2 and B6 use forms git runs.
- Section 5 findings 1 to 4 and section 6 findings 1 to 4: the subtree prefixes from one letter, the subcommand in any case, `--`, the words that end early, `git switch -Cfix` and the checkout controls are cases. Finding 5: Decision 7, the user's call named. Finding 6: the "Not seen" list names the path form (Decision 10).
- Section 6 finding 5: "Verify" 2 runs the test under `/usr/bin/python3`.
- Section 8 findings 1, 2 and 7: the README sentence keeps its order, the head comment's words for the switch bullet name `f` before `c` or `C`, and the items cite each page by its section.

---

# Step 2b brief check, second run (on main at 8595fad)

`git rev-parse --short HEAD` printed `f5692d6` at the start and `8595fad` at the end: the commit `8595fad Make the six changes of the recurring findings` (step 3a of plan 2.H) landed while the check ran. `git diff --stat 6f40399 HEAD -- skills/repo-setup/templates/hooks skills/repo-setup/SKILL.md README.md docs/dev/building.md` prints nothing, so the five files the brief changes are as the brief read them. The brief did not change during the check (`md5 -q` gave `91f78b91923e7e1e337e07b3c52662b3`, 157 lines, modified 14:27:55). `git status --short` at the end shows only `M .scratch/2-g-git-guard/agents/briefs/2b.md` and two untracked briefs of other plans; I changed no file of the repository. The scratch folder `$TMPDIR/ordo-2b-check2` is removed (`ls -d` prints "No such file or directory"). git is 2.49.0 on APFS; `python3` is 3.13.4 (pyenv) and `/usr/bin/python3` is 3.9.6.

Method for sections 4 to 6. A scratch copy of the guard with items 1 to 6 of "What it must do" written literally ("the prototype"), the unchanged guard, and five copies of the prototype with one behaviour changed each. Every case line was fed to them as a hook event from a file. A scratch copy of `git_guard.test.sh` with the 85 case lines of B1 to B9 and the seven `expect_line` calls of B10 added was run with `GIT_GUARD` at each. git itself was probed in a scratch repository under a scratch `HOME`.

## 1. Names

Commands: `grep -rn -i 'whole tree\|whole-tree\|reset --hard' skills utils docs README.md` (guard files left out) prints the lists of blocked commands at `skills/repo-setup/SKILL.md:126`, `README.md:13` and `docs/roadmap.md:38` and no other; `docs/dev/building.md:10` holds the fourth. `cat skills/repo-setup/templates/hooks/git_guard.settings.json` holds no list. `README.md:64` and `:113` name the guard and no command. `docs/roadmap.md:38` names the five operations of the goal and stays true, as the brief says. Outside "Paths this step writes" no place is made false.

Every name the brief gives exists as stated (`grep -n` over the guard and the test): `_CHECKS` 1193, `_check_git` 983, `_rule_push` 1077 to `_rule_restore` ending 1125, the four rule constants 173 to 176, the option tables 165 to 169, `_take_options` 833, `_options` 1038, `_is_long` 1049, `_is_short` 1054, the head comment 1 to 61 with lines 28 to 37, 39 to 44 and 54 to 55 as quoted, `write_request`, `run_guard`, `expect_line` at 420 to 429, `GIT_GUARD` at test line 20, `allow git stash list` at 194, the labels of test lines 3 to 5, rules 13 and 14 of the change standard, `skills/land/templates/checks.sh`, the four standards pages, "The questions" 10, the `repo-setup` row, the comment of `building.md`'s git guard line.

Findings:

1. "What is on the tree", sixth bullet: "`block <command>` or `allow <command>` (lines 62 to 399)". `sed -n 60,66p git_guard.test.sh` shows line 62 is the `}` that closes `expect_line`, line 64 the comment on the case file, line 65 `cat >"$cases" <<'CASES'`, and line 399 `CASES`. Smallest change: "(lines 65 to 399)".
2. The heading "What is on the tree (read on main at 6f40399)". Main is at 8595fad. The step's own files are unchanged since 6f40399, but `git diff --stat 6f40399 HEAD -- skills docs utils README.md` now lists seven files, among them `docs/dev/change-standard.md` (rule 13) and `skills/spec/templates/brief.md`, which the brief relies on in their new form. Smallest change: the heading names the commit the worktree is made at.

## 2. The step line

The line: "The five further blocks of the ruling "Other commands that discard work"; check: the test with each form blocked, the forced `git checkout` and `git switch` among them, each new case failing on the unchanged tree, and the grep of the skills for `checkout -f` quoted (1 commit)", with the rulings "Other commands that discard work" and "Step 2b, the forced checkout and switch".

- The five blocks: "What to build" 1 and "What it must do" 1 to 4.
- The forced checkout and the forced switch, with the two ruled messages: "What it must do" 4 and 5; the texts equal the ruling's word for word.
- The test with each form blocked: "What to build" 2, cases B1 to B10.
- Each new case failing on the unchanged tree: "Verify" 5. See section 4, finding 1.
- The grep of the skills for `checkout -f`, quoted: "Verify" 8.
- The pages ("What to build" 3 to 5) are not on the step line; rules 5 and 14 of the change standard require them, and Decisions 12 and 13 list the choices made in them.
- Beyond the line and the rulings, listed under "Decisions": 1 to 13, which cover the seven choices of the plan's ruling "Step 2b, the brief's choices".

Findings:

1. "What it must do" 7: "says "discard it" in place of "destroy it"". This change to line 28 of the head comment is on no step line and in no ruling, and "Decisions" does not list it. It is right by the prose standard D ("No synonym cycling"). Smallest change: one line under "Decisions" naming it.
2. A change of behaviour the brief does not state. An inline alias named as one of the four new subcommands is no longer expanded, since the subcommand now has a rule. Evidence, each fed as a hook event to the unchanged guard and to the prototype: `git -c alias.stash=push stash` exits 2 and then 0; `git -c alias.switch=push switch` exits 2 and then 0. For the built-in commands the new result is right: `git -c alias.switch=version switch` prints "fatal: missing branch or commit argument" and `git -c alias.send-pack=version send-pack` prints send-pack's usage, so git ignores the alias. A reviewer who meets it unannounced reads it as a lost block. Smallest change: one line under "Decisions" saying so for `stash`, `switch` and `send-pack`. For `subtree` it is not right; see section 5, finding 1.

No user-visible choice is left unruled other than the text of question 10, which is the open item of the state file.

## 3. Premises

Every command of "What is on the tree" was rerun. As the brief states: `wc -l` 1230 and 507; `sed -n 54,55p` the quoted paragraph; `grep -n -i five` over the two files prints only `git_guard.py:54`; `grep -n checkout git_guard.test.sh | grep -E ' -[a-zA-Z]*f|--f'` prints only line 4; `grep -n 'send-pack\|subtree\|switch' git_guard.test.sh` prints nothing (exit 1); `git grep -n -E checkout -- skills utils ':!skills/repo-setup/templates/hooks' | grep -E ' -[A-Za-z]*f[A-Za-z]*( |$)| --f[a-z-]*'` prints one line, `skills/diagnose/SKILL.md:176`; `git grep -n 'git switch\|[a-z"] switch ' -- skills utils ':!skills/repo-setup/templates/hooks'` prints nothing; `ruff 0.16.5`; `pyright 1.1.414`; `ls docs/adr` prints `README.md` and `template.md`; `sed -n '/^OPTS_SPEC/,/^"/p' "$(git --exec-path)/git-subtree"` gives `P,prefix=`, `annotate=`, `b,branch!=`, `onto=`, `m,message!=` with a value and `h,help!`, `q,quiet!`, `d,debug!`, `ignore-joins`, `rejoin`, `squash` without.

The git probes, each on a tree with `f` and `g` modified, two stashes, or an empty bare remote:

- switch: `--discard-changes other`, `--discard other`, `--di other`, `-f other`, `--force other`, `-qf other` each ended on `other` with `f=b`. `--d other` exit 129 "ambiguous option: d (could be --discard-changes or --detach)"; `--forc`, `--fo`, `--f` exit 129 "(could be --force-create or --force)". `-fc new` and `-f -c new` created `new` with `f=changed`; `-fc new other` gave `f=b`; `-Cfix` and `-cfix` created `fix` with `f=changed`; `-C new` and `--force-create new` kept the changes, and with the start point `other` git refused ("would be overwritten").
- stash: `drop`, `drop -q`, `drop stash@{0}` left 1 of 2 stashes, `clear` left 0; `-q drop` and `dro` exit 128 "subcommand wasn't specified"; `STASH drop` and `SWITCH -f other` exit 128 "cannot handle ... as a builtin".
- subtree: the five forms of the third probe bullet, `--p sub push`, `--pr sub push`, `-P sub -- push`, `SUBTREE -P sub push` and `Subtree push -P sub` each left `refs/heads/main` in the remote; with a folder `push` committed, `git subtree --p push split` printed a split commit.
- send-pack: with the path and `main` the remote held `refs/heads/main`; with `--dry-run` it printed ` * [new branch]      main -> main` and the remote held no ref; `send-pack origin main` exit 128.
- checkout: `-f other`, `--force other`, `--forc other`, `--fo other`, `--f other`, `-qf other`, `other -f` ended on `other` with `f=b`; `-f` alone, `-fb new` and `-f -b new` gave `f=a g=a`; `-f -- f` and `-f f` gave `f=a g=changed`; `-bfix`, `-Bfix`, `-bf` created `fix`, `fix`, `f` with both files changed; `--no-force other` was refused with the changes kept.

Findings: none beyond the two of section 1. Rule 13's table has the five columns the brief names on main at 8595fad (`grep -n '^13\. ' -A5 docs/dev/change-standard.md`, fifth bullet: "the behaviour, the case, the failing line quoted for it, the small change that takes the behaviour out, and the test's failing line with that change made").

## 4. Cases and checks

The prototype gives the brief's expected result for all 86 case lines, under 3.13.4 and under `/usr/bin/python3` 3.9.6. The scratch copy of the test with the cases added printed `FAIL: block git send-pack ../remote.git main: expected exit 2, got 0:` with `GIT_GUARD` at the unchanged guard, and `PASS: git_guard.py scratch tests` with the prototype under both Pythons, so the seven lines of B10 are what the dictated rules print, word for word. The expected results agree with the git probes of section 3: each blocked form does what its cost line says, except `git switch -f -c new`, which Decision 7 states.

Each "Verify" command runs as written on this machine, on the unchanged tree: check 1 printed eleven `$ <command>` lines, each with its pass line, then `checks: 11 commands passed`, exit 0; `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1` and the same under `PATH=/usr/bin:$PATH` each printed `PASS: git_guard.py scratch tests`; `ruff check ...` printed `All checks passed!`, `ruff format --check ...` printed `1 file already formatted`, `pyright ...` printed `0 errors, 0 warnings, 0 informations`; the ASCII grep printed nothing, exit 1; the grep of check 7 prints `git_guard.py:28`, `:54` and `:55`; the three greps of check 8 print `SKILL.md:126`, `README.md:13` and `building.md:10`. In the main checkout `/usr/bin/grep` adds "Binary file skills/repo-setup/templates/hooks/__pycache__/git_guard.cpython-313.pyc matches" to check 7; the folder is ignored (`.gitignore:5`) and a fresh worktree has none.

Findings:

1. "Cases", the paragraph after B11: "Each blocked case B1, B2, B4, B6, B8, B9 and B10 fails on the unchanged tree", and "Verify" 5: "each blocked case of B1, B2, B4, B6, B8, B9 and B10 is shown to fail there". Two blocked cases pass on the unchanged tree. Fed to the unchanged guard: `git subtree -P; git push` (B2) exits 2 with `git-guard: blocked: git push (git push is run by the user by hand)`, and `git checkout -f .` (B10) exits 2 with the whole-tree rule's line. B10 says so itself ("as `git checkout .` does today"). Failure scenario: the builder cannot meet "Verify" 5 for these two, and either stops under "a case the brief's own rules get wrong" or reports a failure that did not happen. Smallest change: both sentences name these two as cases of a behaviour the change preserves, which pass on the unchanged tree and have their row with that passing run, as rule 13's fifth bullet gives.
2. "Verify before you report" and "Report" against `skills/spec/templates/brief.md` on main at 8595fad. The template's "Verify" item 5 ("Each bullet, list item and sentence the diff adds or changes in a page or a skill is read against the standards' rules on lists and on sentence length. A sentence longer than they allow is named in the report with the reason its content needs the length.") and its "Report" part 7 are in neither section of the brief. The step changes three sub-bullets of a skill and a sentence of `README.md`. Smallest change: the item added to "Verify before you report" and the part to "Report".

## 5. The question

Could the builder follow the brief, pass every check, and leave the step's purpose unmet? Yes, by the routes below. Each was run through the prototype or a copy of it with one behaviour changed; all 86 case lines pass in every copy named.

1. The brief's own rule for `subtree` lets through a push that the guard blocks today. "What it must do" 2: "`_check_git` finds this rule for the subcommand in any mix of case", and the rule returns None when no `push` is found, after which no alias is looked up. Fed as hook events: `git -c alias.subtree=push subtree origin main` and `git -c alias.subtree=push SUBTREE origin main` each exit 2 on the unchanged guard and 0 on the prototype. git runs that alias wherever it finds no program `git-subtree`: with `--exec-path` set to an empty folder, `git -c alias.subtree=version subtree origin main` and the same with `SUBTREE` each print `git version 2.49.0`, and `git subtree` prints "'subtree' is not a git command". On this machine, with the program present, `git -c alias.subtree=version subtree` prints subtree's usage. So the miss needs a machine without the `git-subtree` program, or the upper-case spelling on a file system that distinguishes case; the second was not probed (see "Declined to judge"). Smallest change: item 2 gains "When the rule gives None and the inline configuration holds an alias named `subtree`, the alias is expanded as for a subcommand without a rule", and "Cases" gains `block git -c alias.subtree=push subtree origin main` and `block git -c alias.subtree=push SUBTREE origin main`, both cases of a preserved behaviour.
2. "What it must do" 2: "`-P`, `-b` and `-m` take the rest of their word as the value". The only case with a value in the word is B2's `git subtree push -Psub origin main`, where `push` stands first. A copy of the prototype that always takes the next word passes all 86 lines and exits 0 on `git subtree -Psub push origin main`, which git runs as a push (probed: the remote held `refs/heads/main`). Smallest change: that line added to B2 as blocked, and `git subtree -Ppush split` to B3 as allowed.
3. "What it must do" 2: "the other rules are matched as written". No case holds it. A copy that looks every rule up in lower case passes all 86 lines and exits 0 on `git -c alias.stash=push Stash` and on `git -c alias.switch=push SWITCH origin main`, which the unchanged guard and the prototype block. On APFS git refuses both commands ("cannot handle Stash as a builtin"); where the file system distinguishes case git finds no command and runs the alias (`git -c alias.foo=version FOO` prints `git version 2.49.0` here, so the alias name is compared without case). Smallest change: `block git -c alias.stash=push Stash` added to "Cases" as a case of a preserved behaviour.
4. "What it must do" 4 and 5: "one of the words before `--` that start with a dash". No case has a force option after `--`. Copies that read every word pass all 86 lines and block `git checkout main -- -f`, which restores a file named `-f` (git: "pathspec '-f' did not match any file(s)" here). The cost is a refused command for a file of that name, so it is small. Smallest change: `allow git checkout main -- -f` added to B8a.
5. No cost found: a copy without the sentence "After a word `--`, the next word is the subtree command" passes all 86 lines; it differs only on `git subtree -P sub -- -q push origin main`, which git refuses ("unknown command '-q'").

Probed and right under the dictated rules. Blocked, and git runs them: `git subtree --no-prefix -P sub push`, `--no-p -P sub push`, `--no-annotate -P sub push`, `--no-onto -P sub push`, `-d -P sub push`, `-P sub --no-rejoin push`; `git checkout -lf other`, `-df other`, `-b new -f`, `--orphan o -f`, `-fB new other`; `git switch -f --orphan new`, `--no-force -f other`; `git stash drop` before a newline, `echo 'stash drop' | xargs git`, `bash -c 'git stash clear'`, a `!` alias to `git stash drop`, `git -c alias.x='subtree -P sub' x push origin main`. Allowed: `git checkout -Bf other`, `git switch -Cf other`, `git switch -qcf` (each names a branch `f`), `git SWITCH -f main`, `git STASH drop`, `git log --grep 'stash drop'`, `git commit -m "git stash drop"`, `git worktree add -f ../w other`, `git worktree remove --force ../w`, `git branch -f other main`.

## 6. Implied inputs

Listed under "Cases": a wrapper (`sudo`, `env`), `-C`, `-c`, an inline alias to each new block and to an allowed command, an option after the branch, a word of several short options, an option value equal to a command word (`-P push`, `--prefix=push`, `-m drop`, `branch clear`), a quoted word (`'stash@{0}'`), `--`, a subcommand in another case, the words ending after `subtree`, after `-P` and after `--`.

Findings:

1. The words ending after a long option that takes a value, or after a word of several short options that ends in one: `git subtree --prefix` and `git subtree -qP`. B3 has only `git subtree -P`. The prototype exits 0 on both. A builder's code that reads the next word without a bound ends in a traceback here. I did not verify how the running Claude Code treats a hook that exits 1; the first check states that it does not block. Smallest change: `allow git subtree --prefix` and `allow git subtree -qP` added to B3.
2. An empty word after each new subcommand: `git subtree ''`, `git stash ''`, `git switch ''`. Rule 15 of the change standard names "an empty value". The prototype exits 0 on each; code that reads `word[0]` would not. Smallest change: `allow git subtree ''` and `allow git stash ''` added to the controls.
3. A value inside the word of `-P` in front of the subtree command: section 5, finding 2.

## 7. ADRs

`ls docs/adr` prints `README.md` and `template.md`. No `NNNN-*.md` record exists, so none touches the step, and the brief says so ("No ADR touches this step", "No ADR record exists").

Findings: none.

## 8. Dictated text

Read against the change standard, the skill layout, the prose standard and the glossary:

- The five rule texts ("What it must do" 1 to 5, B10): the two ruled ones equal the ruling word for word; the three others follow the four that exist. Their claims hold by the probes: send-pack and subtree push publish; `stash drop` and `stash clear` remove stashes; the switch and checkout forms discard the change.
- The seven lines of B10: equal to what the prototype prints.
- Question 10's three sub-bullets ("What to build" 3): equal to the text of the open item in the state file and in `plan.md`, "Step 0 of step 2b". The list names every block of items 1 to 5. No glossary term is used in a new sense (`grep -n -i 'guard\|hook' docs/glossary.md` prints only the entry "questions, the").
- The README sentence ("What to build" 4): the old sentence it quotes equals `README.md:13`; the new one keeps its order.
- The `building.md` comment ("What to build" 5): the old words equal line 10.
- The head comment's words ("What it must do" 7): "Not blocked: git switch -C and --force-create, which move a branch and keep the changes in the tree, and git stash pop, which applies the stash before it drops it." holds: `git switch -C new` and `--force-create new` kept `f=changed`, and with a start point that differs git refused; `git stash pop` left `f=changed2` and one stash fewer. "a git program run by its own path, such as .../git-core/git-push" holds: `/opt/homebrew/opt/git/libexec/git-core/git-send-pack ../remote.git main` exits 0 on the unchanged guard and on the prototype. The words for the switch and checkout bullets agree with items 4 and 5. The paragraph has no semicolon.

Findings:

1. "What to build" 3, third sub-bullet: "The hook is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself, and it needs `python3` 3.9 or later." Decision 12 says "three sub-bullets, one requirement each, as the skill layout standard asks". The bullet holds two requirements joined by "and": where the hook is copied, and the Python it needs. `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets". Smallest change: the bullet split in two ("The hook is copied into `.claude/hooks/`, which `.gitignore` ignores, so each clone installs it itself." and "It needs `python3` 3.9 or later."), with Decision 12 saying four, and the same text carried to the open item in the state file and in `plan.md`, since that text is what Axel reads.

## Closures of the first check

- Section 2 finding 1, section 8 findings 3, 4, 5 and 8: holds. "What it must do" 5 builds the forced checkout with `f` before any `b` or `B`; B8, B8a and B10 carry the cases and the fifth rule text; "What to build" 3 and 5 name `git checkout --force`; item 7 has the new "Not blocked" paragraph without the checkout clause and without a semicolon.
- Section 2 finding 2 and section 3 finding 1: holds. The premise bullet "No skill and no script under `utils/` ..." and "Verify" 8 use the wider grep, and it prints the one line the brief says.
- Section 2 finding 3: holds. Decisions 7 to 13 list the additions; the five columns equal rule 13 on main at 8595fad; the open item is in the state file and under "Step 0 of step 2b". Two smaller additions are still unlisted (section 2, findings 1 and 2 above).
- Section 3 findings 2 to 5: holds. The dry run ("printed the new branch and pushed nothing"), the ranges 1077 to 1125, 420 to 429 and 165 to 176, the prefixes from one letter, and the second ruling are in "What is on the tree" and "Read". One range is still off (section 1, finding 1 above).
- Section 1 findings 1 to 3 and section 8 finding 6: holds. "What it must do" 8 gives the four subcommands a labelled line; item 7 changes line 28 to "discard it"; "Verify" 7 has `checkout --force\|checkout -f`.
- Section 4 finding 1: holds ("in a scratch copy of the finished guard under `$TMPDIR`, runs the test against that copy through `GIT_GUARD`"). Finding 2: holds for the three forms named; B1 uses a path, and the two `-m` and `--annotate` forms of B2 and `git switch -fc new other` of B6 each ran in the probes. B6 still holds `git switch -f -c new` under the cost "work in the tree discarded", which Decision 7 states.
- Section 5 findings 1 to 4 and section 6 findings 1 to 4: holds. B2 and B3 carry the one- and two-letter prefixes, both spellings in another case, `--`, and the three lines whose words end early; B7 has `git switch -Cfix`; B8a has `-bfix` and `-Bfix`. Finding 5: holds (Decision 7). Finding 6: holds (Decision 10 and item 7).
- Section 6 finding 5: holds ("Verify" 2, which passes on the unchanged tree under 3.9.6).
- Section 8 findings 1, 2 and 7: holds. The README sentence keeps its order; item 7's words for the switch bullet name `f` before `c` or `C`; "What to build" 3 to 5 and the roadmap bullet cite each page by its section, and line numbers remain only for code and under "Paths this step writes".

## Declined to judge

- A file system that distinguishes case, and a machine without the `git-subtree` program: not available here. The second was simulated with `--exec-path` at an empty folder; the first rests on git's alias lookup ignoring case, probed only for a name that is no command.
- What the running Claude Code does with a hook that exits 1: not verified.
- The text of question 10 as Axel will read it: his call, the open item.
- Whether `git switch -f -c new`, `git checkout -f -- <path>` and the forms git refuses that the rules block (`git switch -tf other`, `git checkout -tf other`) should be narrowed: the ruling's wording blocks them; Decision 7 leaves it to the user.
- Commands outside the two rulings that publish or remove work (`git stash pop`, `git reflog expire`, `git update-ref -d refs/stash`, other transport programs): not probed in this run; the user's call.
- A shared path with a step of another plan: the untracked brief `.scratch/2-e-grill/agents/briefs/9a.md` lists `skills/repo-setup/SKILL.md` whole and `README.md` lines 54-54 under its paths, and all three other state files say `dispatch: none`. The comparison is the orchestrator's under the `spec` skill.
- Whether the verify list still has 11 commands when the step is dispatched: it has 11 now (`grep -c` over the block, and the run of `checks.sh`).
- The guard's output closed by its reader before the guard ends, which the new template names for a script: `main()` is not changed by this step, and I did not probe it.
- git versions other than 2.49.0.
- The builder's code: the prototype shows that the dictated rules give the expected results, and the five changed copies show which behaviours no case holds; neither says what the builder will write.

Agent usage: claude-opus-5-5 (ordo-high), 237113 tokens, 39 tool uses, 17.2 minutes ($1.90 to $6.07).

## Closed (second run; the session's change to the brief for every finding of it, made before the preparation commit)

- Section 1 findings 1 and 2: the range reads "lines 65 to 399", and the heading names 8595fad.
- Section 2 finding 1: Decision 14. Finding 2: Decision 15, and the ruling line "Step 2b, the brief's choices", point 8.
- Section 4 finding 1: "Cases" and "Verify" 5 name the five preserved lines, which pass on the unchanged tree and have a row with that run. Finding 2: "Verify" 10 and the matching part of "Report".
- Section 5 finding 1: "What it must do" 2 expands an inline alias named `subtree` when the rule gives None, with two lines in B2. Findings 2 to 4: `git subtree -Psub push origin main` in B2, `git subtree -Ppush split` in B3, `git -c alias.stash=push Stash` in B9, `git checkout main -- -f` in B8a. Finding 5: no change, no cost found.
- Section 6 findings 1 and 2: `git subtree --prefix`, `git subtree -qP`, `git subtree ''` in B3 and `git stash ''` in B5. Finding 3: as section 5 finding 2.
- Section 8 finding 1: the third sub-bullet of question 10 is two, Decision 12 says four, and the open item in the state file and in `plan.md` holds the four.
