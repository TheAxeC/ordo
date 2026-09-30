Everything in the brief is done.

## Open items of 2.G's state file (verbatim)

- Git aliases (2026-09-30, step 1): a git alias defined in a configuration file (`git config alias.p push`, then `git p`) runs a blocked operation under another name, and the guard does not see it; an alias given inline in the command (`git -c alias.p=push p`, `GIT_CONFIG_KEY_0=alias.p`) is resolved by step 1 without running git. Options: (a) the guard resolves an unknown subcommand with `git config --get alias.<name>` in the command's directory and checks the expansion (a `!` alias as a shell command); pros: every alias is covered; cons: the script runs git on each call that uses an unknown subcommand, a computation beyond the approved one that needs your approval. (b) Configuration-file aliases stay outside the guard, and the docstring and the offer say so; pros: nothing runs; cons: such an alias gets through. Recommendation (a). The lazy option is (b). Step 1 is built without it; a yes adds it as a step by your ruling.
- Other commands that discard work (2026-09-30, step 1): `git checkout -f <branch>`, `git switch --discard-changes`, `git stash drop` and `git stash clear` discard work, and `git send-pack` and `git subtree push` push, by commands the approved list of five does not name, so the guard lets them through (the brief check's "Declined to judge"). Options: (a) a step adds them to the guard's blocks; pros: the guard covers what the five cover in effect; cons: widens the approved list, and `git checkout -f <branch>` is a form the plan skills may need. (b) The docstring and the offer name them as not blocked. Recommendation (a) for `send-pack`, `subtree push`, `stash drop`, `stash clear` and `switch --discard-changes`, with `checkout -f` left allowed after a grep of the skills. The lazy option is (b). Step 1 is built with the five only; a yes adds a step by your ruling.

## The cases' first run, on the unchanged tree (no script beside the test)

The test was written first, before git_guard.py existed. Fail-fast form, quoted verbatim:

```
FAIL: block git push: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory
rc=1
```

The same test with `fail` made non-exiting (a scratch copy under $TMPDIR, run with `GIT_GUARD` naming an absent script) fails all 187 distinct cases (257 FAIL lines). A blocked case fails because python3 exits 2 with its own "can't open file" error instead of the guard's line; an allowed case fails because it exits 2 instead of 0. No case is one the brief's own rules get wrong: every case has a result under the rules as written, so no stop was needed. The result of each case:

- block git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git push origin main: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git push --force: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git push --dry-run: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -C /tmp/x push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -c user.name=a push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git --git-dir=.git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git --git-dir .git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git --no-pager push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block /usr/bin/git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block \git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block "git" push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block GIT_TRACE=1 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block env GIT_TRACE=1 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block env -u HOME git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block command -p git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block nohup git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block nice -n 5 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block time -p git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block timeout 10 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block timeout -s KILL 10 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block sudo git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block sudo -u root git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block xargs git push < /dev/null: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block xargs -I{} git push {}: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block xargs -n 1 git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block eval git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block eval "git push": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block exec git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block cd x && git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git status; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block false || git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git fetch & git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git fetch<NL>git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git \<NL>push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block (cd x && git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block true;(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block true&&(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block { git push; }: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block ! git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block if git push; then :; fi: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block if true; then git push; fi: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block for b in x; do git push; done: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block while true; do git push; done: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block case x in x) git push;; esac: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo $(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo "$(git push)": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo `git push`: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo "`git push`": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block A=$(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block cat <(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo $(echo $(git push)): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block sh -c 'git push': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block bash -c "cd x && git push": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block bash -lc 'git push': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block sh -ec 'git push': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block env -S "git push": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block bash <<EOF<NL>git push<NL>EOF: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block bash <<< 'git push': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo 'git push' | sh: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block printf 'git push\n' | bash: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block printf 'git push<NL>' | bash: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git log 2>&1 | head; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -c alias.p=push p: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -c 'alias.p=!git push' p: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=alias.p GIT_CONFIG_VALUE_0=push git p: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git reset --hard: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git reset --hard HEAD~1: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git reset HEAD~1 --hard: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -C x reset --hard: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git reset --har: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git reset --ha: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -f: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -fd: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -fdx: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -xdf: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -d -f: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean --force: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean --forc: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git clean -fn: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -c clean.requireForce=false clean -d: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -- .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout HEAD -- .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout ./: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -p .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout . other: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -- ':/': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -- '*': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -- ':(glob)**': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git checkout -- ':!a.md': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -- .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore --staged --worktree .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -S -W .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -s HEAD .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore --source=HEAD :/: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -- ':(top)': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -- '**': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore -- ':^a.md' ':(exclude)b.md': stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git restore ..: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow git branch -D 2e-12a: expected exit 0, got 2 (python3 cannot open the script)
- allow git branch -D 2e-12a: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git branch -q -D x-land: expected exit 0, got 2 (python3 cannot open the script)
- allow git branch -q -D x-land: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git worktree remove --force .agents/worktrees/2e-12a: expected exit 0, got 2 (python3 cannot open the script)
- allow git worktree remove --force .agents/worktrees/2e-12a: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git restore -- a.md b.md: expected exit 0, got 2 (python3 cannot open the script)
- allow git restore -- a.md b.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git restore --staged --worktree -- a.md: expected exit 0, got 2 (python3 cannot open the script)
- allow git restore --staged --worktree -- a.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git restore --staged .: expected exit 0, got 2 (python3 cannot open the script)
- allow git restore --staged .: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git restore -S .: expected exit 0, got 2 (python3 cannot open the script)
- allow git restore -S .: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout --theirs -- a.bin: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout --theirs -- a.bin: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout main: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout main: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout -q 2e-12a: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout -q 2e-12a: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout -b x-land main: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout -b x-land main: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout ./a: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout ./a: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout -- ../x.md: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout -- ../x.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout -- ':!a.md' b.md: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout -- ':!a.md' b.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git -c core.excludesFile=/tmp/f checkout -b x-land main: expected exit 0, got 2 (python3 cannot open the script)
- allow git -c core.excludesFile=/tmp/f checkout -b x-land main: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git worktree remove --force "$tmp/tree": expected exit 0, got 2 (python3 cannot open the script)
- allow git worktree remove --force "$tmp/tree": expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git apply --3way --allow-empty "$tmp/step.diff": expected exit 0, got 2 (python3 cannot open the script)
- allow git apply --3way --allow-empty "$tmp/step.diff": expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git reset --soft HEAD~1: expected exit 0, got 2 (python3 cannot open the script)
- allow git reset --soft HEAD~1: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git reset HEAD -- a.md: expected exit 0, got 2 (python3 cannot open the script)
- allow git reset HEAD -- a.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git reset --help: expected exit 0, got 2 (python3 cannot open the script)
- allow git reset --help: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git clean -n: expected exit 0, got 2 (python3 cannot open the script)
- allow git clean -n: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git clean -nd: expected exit 0, got 2 (python3 cannot open the script)
- allow git clean -nd: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git status: expected exit 0, got 2 (python3 cannot open the script)
- allow git status: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git log --oneline | head -3: expected exit 0, got 2 (python3 cannot open the script)
- allow git log --oneline | head -3: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git log 2>&1 | head: expected exit 0, got 2 (python3 cannot open the script)
- allow git log 2>&1 | head: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git diff -- .: expected exit 0, got 2 (python3 cannot open the script)
- allow git diff -- .: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git add -- .: expected exit 0, got 2 (python3 cannot open the script)
- allow git add -- .: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git stash list: expected exit 0, got 2 (python3 cannot open the script)
- allow git stash list: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git -c alias.p=status p: expected exit 0, got 2 (python3 cannot open the script)
- allow git -c alias.p=status p: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo "git push": expected exit 0, got 2 (python3 cannot open the script)
- allow echo "git push": expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo git push: expected exit 0, got 2 (python3 cannot open the script)
- allow echo git push: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo 'git push' | cat: expected exit 0, got 2 (python3 cannot open the script)
- allow echo 'git push' | cat: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo '$(git push)': expected exit 0, got 2 (python3 cannot open the script)
- allow echo '$(git push)': expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git commit -m "do not git push or git reset --hard": expected exit 0, got 2 (python3 cannot open the script)
- allow git commit -m "do not git push or git reset --hard": expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow grep -n "git push" README.md: expected exit 0, got 2 (python3 cannot open the script)
- allow grep -n "git push" README.md: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git commit -F - <<'EOF'<NL>Never git push here.<NL>EOF: expected exit 0, got 2 (python3 cannot open the script)
- allow git commit -F - <<'EOF'<NL>Never git push here.<NL>EOF: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo $((1 + 2)): expected exit 0, got 2 (python3 cannot open the script)
- allow echo $((1 + 2)): expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow for b in git push; do echo "$b"; done: expected exit 0, got 2 (python3 cannot open the script)
- allow for b in git push; do echo "$b"; done: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow case "$x" in push) echo x;; esac: expected exit 0, got 2 (python3 cannot open the script)
- allow case "$x" in push) echo x;; esac: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow ls -la: expected exit 0, got 2 (python3 cannot open the script)
- allow ls -la: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow: expected exit 0, got 2 (python3 cannot open the script)
- allow: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git commit -m "unbalanced: expected exit 0, got 2 (python3 cannot open the script)
- allow git commit -m "unbalanced: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block git commit -F - <<EOF<NL>$(git push)<NL>EOF: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow git commit -F - <<'EOF'<NL>$(git push)<NL>EOF: expected exit 0, got 2 (python3 cannot open the script)
- allow git commit -F - <<'EOF'<NL>$(git push)<NL>EOF: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block echo ${x:-$(git push)}: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block echo $'it\'s'; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow echo $'git push': expected exit 0, got 2 (python3 cannot open the script)
- allow echo $'git push': expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow echo x # git push: expected exit 0, got 2 (python3 cannot open the script)
- allow echo x # git push: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block echo x #<NL>git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow echo a#b: expected exit 0, got 2 (python3 cannot open the script)
- allow echo a#b: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block echo a#b; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block printf '%s<NL>' 'git push' | sh: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow printf 'echo hi\n' | bash: expected exit 0, got 2 (python3 cannot open the script)
- allow printf 'echo hi\n' | bash: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git checkout -b x-land main; git commit -m ok: expected exit 0, got 2 (python3 cannot open the script)
- allow git checkout -b x-land main; git commit -m ok: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block bash -c "$(git push)": stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow bash script.sh <<EOF<NL>git push<NL>EOF: expected exit 0, got 2 (python3 cannot open the script)
- allow bash script.sh <<EOF<NL>git push<NL>EOF: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow bash -c 'echo hi' <<EOF<NL>git push<NL>EOF: expected exit 0, got 2 (python3 cannot open the script)
- allow bash -c 'echo hi' <<EOF<NL>git push<NL>EOF: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: block sudo -Eu root git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- block git -c alias.a=b -c alias.b=push a: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- allow git -c alias.a=b -c alias.b=a a: expected exit 0, got 2 (python3 cannot open the script)
- allow git -c alias.a=b -c alias.b=a a: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: allow git -c alias.push=status status: expected exit 0, got 2 (python3 cannot open the script)
- allow git -c alias.push=status status: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git status; git push origin main: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git status; git push origin main: expected the line [git-guard: blocked: git push origin main (git push is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git reset --hard HEAD~1: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git reset --hard HEAD~1: expected the line [git-guard: blocked: git reset --hard HEAD~1 (git reset --hard discards work and is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git clean -fd: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git clean -fd: expected the line [git-guard: blocked: git clean -fd (git clean deletes untracked files without asking and is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git checkout -- .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git checkout -- .: expected the line [git-guard: blocked: git checkout -- . (git checkout with a whole-tree pathspec discards work and is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git restore -- .: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git restore -- .: expected the line [git-guard: blocked: git restore -- . (git restore with a whole-tree pathspec discards work and is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: sudo git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- sudo git push: expected the line [git-guard: blocked: sudo git push (git push is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: echo $(git push): stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- echo $(git push): expected the line [git-guard: blocked: git push (git push is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git reset --hard; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git reset --hard; git push: expected the line [git-guard: blocked: git reset --hard (git reset --hard discards work and is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: git commit -m "a<NL>b"; git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- git commit -m "a<NL>b"; git push: expected the line [git-guard: blocked: git push (git push is run by the user by hand)], got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: not json: expected exit 0, got 2 (python3 cannot open the script)
- not json: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a JSON array: expected exit 0, got 2 (python3 cannot open the script)
- a JSON array: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: empty stdin: expected exit 0, got 2 (python3 cannot open the script)
- empty stdin: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a byte that is not UTF-8 around git status: expected exit 0, got 2 (python3 cannot open the script)
- a byte that is not UTF-8 around git status: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a byte that is not UTF-8 around git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- the Read tool: expected exit 0, got 2 (python3 cannot open the script)
- the Read tool: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a tool_input without command: expected exit 0, got 2 (python3 cannot open the script)
- a tool_input without command: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a command that is a number: expected exit 0, got 2 (python3 cannot open the script)
- a command that is a number: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a tool_input that is a string: expected exit 0, got 2 (python3 cannot open the script)
- a tool_input that is a string: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: the Monitor tool: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- an input with no tool_name: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- a command of one megabyte before git push: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- a command nested 150 levels deep: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- a command nested 20 levels deep: expected exit 0, got 2 (python3 cannot open the script)
- a command nested 20 levels deep: expected nothing on stderr, got: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such file or directory<NL>FAIL: a parameter expansion nested 150 levels deep: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)
- an arithmetic expansion nested 150 levels deep: stderr does not start with [git-guard: blocked: ] (python3 prints its own error, exit 2)

## DONE / NOT DONE

| Item | Command | State |
|---|---|---|
| 1 git_guard.py: own lexer without shlex, standard library, ASCII, docstring with what it blocks, allows, does not see, does not block, how it is run and its exit statuses | the file below; the ASCII grep below | DONE |
| 2 git_guard.test.sh: every case of "Cases", each checking exit status and stderr, head comment, GIT_GUARD, last line | the test runs below | DONE |
| 3 the test's line in building.md and change-standard.md command blocks | changed lines below | DONE |
| Test under python3 3.13.4 | `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1` | DONE |
| Test under /usr/bin/python3 3.9.6 first on PATH | the same, with `PATH=$TMPDIR/py39:$PATH`, a folder holding a python3 link to /usr/bin/python3 | DONE |
| Four red runs | below | DONE |
| ruff check and ruff format --check | below | DONE |
| ASCII grep | below | DONE |
| Verify list through checks.sh | below | DONE |

Test under python3 (`python3 --version` prints `Python 3.13.4`):

```
PASS: git_guard.py scratch tests
rc=0
```

Test with /usr/bin/python3 first on PATH (`python3 --version` prints `Python 3.9.6` there):

```
PASS: git_guard.py scratch tests
rc=0
```

Red runs. Each is a scratch copy of git_guard.py under $TMPDIR with one block's line removed from the `_CHECKS` table (`grep -v '"push": _rule_push'`, likewise for reset and clean, and checkout with restore together), run as `GIT_GUARD=<copy> sh skills/repo-setup/templates/hooks/git_guard.test.sh`.

Without push:

```
FAIL: block git push: expected exit 2, got 0: 
rc=1
```

Without reset:

```
FAIL: block git reset --hard: expected exit 2, got 0: 
rc=1
```

Without clean:

```
FAIL: block git clean -f: expected exit 2, got 0: 
rc=1
```

Without checkout and restore:

```
FAIL: block git checkout .: expected exit 2, got 0: 
rc=1
```

Run with a non-exiting `fail`, each copy fails only on its block's cases and the cases that reach the block (push 253 FAIL lines, since every wrapper, substitution and alias case ends in git push; reset 23; clean 31; checkout and restore 68).

ruff, on git_guard.py:

```
All checks passed!
rc=0
1 file already formatted
rc=0
```

ASCII grep over the two new files and the two changed pages (`grep` status 1 is no match):

```
grep rc=1 (1 means no match)
```

The verify list through the land skill's runner. The state file's list holds 8 commands; the orchestrator adds the new test to it at landing, as the brief says.

```
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
```

Behaviours the change adds, with the failing line on the unchanged tree (each case of the test fails there; the table gives one line per behaviour):

| Behaviour | Cases | First failing line on the unchanged tree |
|---|---|---|
| push in every form and position | block git push; block cd x && git push; block echo $(git push); block bash -c "cd x && git push"; block git -c alias.p=push p | `FAIL: block git push: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final` |
| reset --hard and its unique prefixes | block git reset --hard; block git reset --ha | `FAIL: block git reset --hard: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDI` |
| clean --force in each spelling, and clean.requireForce=false | block git clean -f; block git clean --forc; block git -c clean.requireForce=false clean -d | `FAIL: block git clean -f: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//f` |
| checkout and restore of the whole tree, exclude-only sets, the index-only exemption | block git checkout .; block git restore -- ':^a.md' ':(exclude)b.md'; allow git restore --staged . | `FAIL: block git checkout .: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR/` |
| the plan skills' own commands pass | allow git branch -D 2e-12a; allow git worktree remove --force ...; allow git restore -- a.md b.md; allow git checkout --theirs -- a.bin | `FAIL: allow git branch -D 2e-12a: expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [E` |
| text that only names a blocked command passes | allow echo "git push"; allow echo '$(git push)'; allow git commit -m "do not git push ..." | `FAIL: allow echo "git push": expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno ` |
| input the guard cannot read passes; other tools are guarded | allow not json; block the Monitor tool; block a byte that is not UTF-8 around git push | `FAIL: not json: expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py': [Errno 2] No such fi` |
| a command too deeply nested to read is blocked, not crashed | block a command nested 150 levels deep | `FAIL: a command nested 150 levels deep: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open fi` |

## Files

New: `skills/repo-setup/templates/hooks/git_guard.py` (1092 lines) and `skills/repo-setup/templates/hooks/git_guard.test.sh` (433 lines), whole at the end of this report. Changed: `docs/dev/building.md` (one line added) and `docs/dev/change-standard.md` (one line added).

Changed lines.

`docs/dev/building.md`. Before, line 9 (`sh skills/repo-setup/templates/sync_rules.test.sh ...`) was followed by line 10 (`python3 skills/repo-setup/templates/sync_rules.py . --only glossary ...`). After, a new line 10 sits between them:

```
sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clean --force, checkout and restore of the whole tree, reached through separators, substitutions, wrappers, shells and aliases) and on the commands it must let through
```

`docs/dev/change-standard.md`. Before, line 70 (`sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`) was followed by line 71 (`python3 skills/repo-setup/templates/sync_rules.py . --only glossary`). After, a new line 71 sits between them:

```
sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
```

Sentences about the changed pages as a whole, reread. building.md's "Each test builds scratch repositories or scratch files under `$TMPDIR` and removes them; none touches the installed skills" holds for the new test (scratch files under `$TMPDIR`, removed by its trap, no git, no skill folder touched). Its "A test that passes prints a last line starting with `PASS:`" holds (`PASS: git_guard.py scratch tests`). `grep -rn "sync_rules.test.sh"` over the tree outside the ledger finds README.md:59 (a note that perl is needed, which the new test does not need), building.md and change-standard.md, so no other page lists the tests.

## Judgment calls

- The lexer also reads comments (`#` at the start of a word), `${...}` parameter expansions and `$'...'` quoting, and finds substitutions inside an unquoted here-document body. The brief's lexer text does not list them. Each is part of how the shell reads a command: a `;` inside a comment or an expansion must not split a command, `$'\''` must not end a quote, and `$(git push)` in an unquoted here-document body runs. The test has cases for each.
- The brief's "stdin holding a byte that is not UTF-8 around `git push`" does not say where the byte sits. The test puts it inside the command string, as `echo <byte>; git push; echo <byte>`, with `git status` for the allowed twin: a byte glued to `git` makes a different word, and a byte outside the JSON makes the input not JSON, which the brief allows.
- `printf 'git push\n' | bash` is tested with the two characters backslash and n (the printf reading the brief names) and, as a second case, with a real newline. For a printf whose format holds `%`, its arguments are also checked as command texts, so `printf '%s\n' 'git push' | sh` blocks.
- Long spellings of the wrappers' value options (`--user`, `--max-args`, `--signal` and similar) are skipped with their values, besides the short ones the brief lists.
- A command word is matched by the last part of its path for the wrappers as well as for git, so `/usr/bin/env git push` and `./git push` are checked.
- A whole-tree pathspec is judged by its pieces: the components `.` and empty are dropped, leading `..` components are dropped, and the pathspec is whole-tree when what is left is empty, `*` or `**`. That covers the brief's list and also `./*`, `../*` and `../..`.
- The rule text of each block: push `git push is run by the user by hand`; reset `git reset --hard discards work and is run by the user by hand`; clean `git clean deletes untracked files without asking and is run by the user by hand`; checkout and restore `git <name> with a whole-tree pathspec discards work and is run by the user by hand`. The brief says only that the rule names the operation and says the user runs it by hand.
- The script is one file of 1092 lines, since step 2 copies a single file into a repository.

## User-visible changes

- `docs/dev/building.md` and `docs/dev/change-standard.md` list the new test in their command blocks (before and after above).
- A hook script and its test now exist under `skills/repo-setup/templates/hooks/`. Nothing calls the script until step 2.

## Wrong or impossible in the brief

Nothing in the brief was impossible or wrong. Two points are ambiguous: where the non-UTF-8 byte sits, and the `\n` in the printf case; both are under Judgment calls. The operations of Decisions 3 (git checkout -f, git switch --discard-changes, git stash drop and clear, git send-pack, git subtree push) are named in the docstring as not blocked, and the open items above are unchanged.

## git_guard.py, whole

```
"""Refuse the git commands an agent must not run by itself, as a Claude Code PreToolUse hook.

Run it as the command of a PreToolUse hook: `python3 <path>/git_guard.py`. Claude Code writes the
event as JSON on stdin. When `tool_input` holds a string `command`, that command is checked,
whatever the tool (Bash, Monitor and any other tool that runs a shell command are guarded alike).
Any other input, including text that is not JSON and empty input, is allowed.

The command is read with a lexer written in this file that follows the POSIX shell and bash as far
as the forms below go. It splits the text into simple commands on newlines and the operators
; & && || | |& ( ) and looks inside command substitutions ($( ) and backticks), process
substitutions, $( ) inside double quotes, ${ } expansions, here-documents, here-strings, brace
expansions with a comma list, $'...' quoting, `sh -c` strings, `eval` and these wrappers: env,
command, builtin, exec, nohup, nice, time, timeout, sudo, doas, stdbuf, xargs (with the words an
echo or printf pipes into it), watch, and find with -exec, -execdir, -ok and -okdir. It reads
`function NAME` and `coproc` as reserved words. Each simple command whose command word is git (or
a glob pattern that matches git, such as gi?) is checked, after git's global options (-C, -c,
--git-dir, --work-tree and the others) and after configuration given inline: -c, --config-env
with the variable assigned in the same command, GIT_CONFIG_KEY_<n> with GIT_CONFIG_VALUE_<n>, and
GIT_CONFIG_PARAMETERS. An alias defined by that configuration is expanded; an alias that starts
with ! is checked as its text followed by the arguments git appends, and the inline configuration
is carried into the git commands that text runs.

Blocked, because the user runs these by hand (they publish work or destroy it):
- git push, with any arguments, --dry-run included.
- git reset with --hard, or a long option that is a unique prefix of it (--ha and longer).
- git clean with --force (or a prefix from --fo), with a short-option word holding f (-f, -fd,
  -xdf), or with clean.requireForce set to false, no, off, the empty string or an integer 0 by
  inline configuration and no -n or --dry-run.
- git checkout or git restore with a whole-tree pathspec among its arguments: ., ./, ./., *, **,
  .., ../, :/, :/., :/*, :(top), :(top)., a glob pathspec of * or **, or a set of pathspecs that
  are all excludes (:!x, :^x, :(exclude)x). git restore that restores only the index (--staged
  or -S without --worktree or -W) discards no work and is allowed.

Allowed, so the plan skills' own commands run: everything else, among it git branch -D, git
worktree remove, git restore -- <paths>, git restore --staged --worktree -- <paths>, git checkout
--theirs -- <path>, git checkout <branch>, git checkout -b, git reset --soft, git clean -n, git log,
git diff -- . and text that only names a blocked command, such as echo "git push" or a commit
message. A command the shell would refuse (an unbalanced quote) is allowed, and the words read
before the fault are still checked. A command of any nesting depth is read.

Not seen: a command another program runs (a script, make, python3 -c); a git alias defined in a
configuration file; a command word or option that a variable, a positional parameter, $@ or a
substitution supplies ($g push, $(echo git) push); the output of a command piped into a shell or
into xargs other than the arguments of echo and printf; a brace expansion of more than 256 words
or of a word longer than 4096 characters; the escapes of a printf or echo format beyond those
bash decodes; and any form of shell syntax this list of forms does not name.

Not blocked, because they are not among the five operations above: git checkout -f <branch>,
git switch --discard-changes, git stash drop, git stash clear, git send-pack and git subtree push.

Output and exit status. The script gives two exit statuses. Exit 0 lets the command run and prints
nothing. Exit 2 blocks it and prints one line on stderr, which Claude Code gives to the agent:
    git-guard: blocked: <the simple command, its words joined by spaces> (<the rule>)
The first blocked simple command decides. The script reads stdin only and prints nothing else.
"""

from __future__ import annotations

import json
import re
import sys
from collections import deque
from dataclasses import dataclass, field
from fnmatch import fnmatchcase

_MAX_BRACE_WORDS = 256
_MAX_BRACE_LENGTH = 4096

_PLAIN = re.compile(r"[^ \t\n\\'\"$`;&|()<>]+")
_DOUBLE_QUOTED = re.compile(r'[^"\\$`]+')
_ASSIGNMENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*=")
_CONFIG_KEY = re.compile(r"GIT_CONFIG_KEY_([0-9]{1,6})\Z")
_ECHO_FLAGS = re.compile(r"-[neE]+\Z")
_DESCRIPTOR = re.compile(r"[0-9]+\Z")
_OCTAL = re.compile(r"[0-7]{1,3}")
_HEX = {
    "x": re.compile(r"[0-9A-Fa-f]{1,2}"),
    "u": re.compile(r"[0-9A-Fa-f]{1,4}"),
    "U": re.compile(r"[0-9A-Fa-f]{1,8}"),
}

_ESCAPES = {
    "a": "\a", "b": "\b", "e": "\x1b", "E": "\x1b", "f": "\f", "n": "\n", "r": "\r", "t": "\t",
    "v": "\v", "\\": "\\", "'": "'", '"': '"', "?": "?",
}  # fmt: skip

# Longest first, so a run of operator characters splits the way the shell splits it.
_OPERATORS = (
    ";;&", "<<<", "<<-", "&>>", ";;", ";&", "&&", "||", "|&", "&>", ">>", ">|", "<>", ">&", "<&",
    "<<", "<(", ">(", ";", "&", "|", "(", ")", "<", ">",
)  # fmt: skip
_REDIRECTIONS = frozenset({"<<<", "<<-", "&>>", "&>", ">>", ">|", "<>", ">&", "<&", "<<", "<", ">"})
_PIPES = frozenset({"|", "|&"})

# Words that open or close a compound command; at the start of a simple command they are not one.
_COMPOUND_WORDS = frozenset(
    {"if", "then", "elif", "else", "do", "while", "until", "!", "{", "fi", "done", "}"}
)
_LIST_HEADS = frozenset({"for", "select"})

_SHELLS = frozenset({"sh", "bash", "zsh", "dash", "ksh"})
_SHELL_VALUED = frozenset({"-o", "+o", "-O", "+O", "--rcfile", "--init-file"})

# For each wrapper: its options that take a value, and the positional words it takes before the
# command it runs.
_WRAPPERS = {
    "env": (frozenset({"-u", "-C", "-S", "--unset", "--chdir", "--split-string"}), 0),
    "command": (frozenset(), 0),
    "builtin": (frozenset(), 0),
    "exec": (frozenset({"-a"}), 0),
    "nohup": (frozenset(), 0),
    "nice": (frozenset({"-n", "--adjustment"}), 0),
    "time": (frozenset(), 0),
    "timeout": (frozenset({"-s", "-k", "--signal", "--kill-after"}), 1),
    "stdbuf": (frozenset({"-i", "-o", "-e", "--input", "--output", "--error"}), 0),
    "doas": (frozenset({"-u", "-C"}), 0),
    "sudo": (
        frozenset(
            {"-u", "-g", "-C", "-D", "-h", "-p", "-r", "-t", "-T", "-U", "--user", "--group"}
            | {"--chdir", "--host", "--prompt", "--role", "--type", "--command-timeout"}
            | {"--other-user", "--close-from"}
        ),
        0,
    ),
    "xargs": (
        frozenset(
            {"-I", "-L", "-n", "-P", "-s", "-d", "-E", "-a", "--max-lines", "--max-args"}
            | {"--max-procs", "--max-chars", "--delimiter", "--eof", "--arg-file"}
        ),
        0,
    ),
}
# Commands that join their arguments into one string and run it as a shell command.
_TEXT_WRAPPERS = {"eval": frozenset(), "watch": frozenset({"-n", "--interval"})}
_FIND_EXEC = frozenset({"-exec", "-execdir", "-ok", "-okdir"})

_GIT_VALUED_OPTIONS = frozenset(
    {"-C", "--git-dir", "--work-tree", "--namespace", "--super-prefix", "--attr-source"}
)
_CHECKOUT_VALUED = frozenset({"-b", "-B", "--orphan", "--conflict", "--pathspec-from-file"})
_RESTORE_VALUED = frozenset({"-s", "--source", "--conflict", "--pathspec-from-file"})

_FALSE_WORDS = frozenset({"false", "no", "off", ""})

_PUSH_RULE = "git push is run by the user by hand"
_RESET_RULE = "git reset --hard discards work and is run by the user by hand"
_CLEAN_RULE = "git clean deletes untracked files without asking and is run by the user by hand"
_TREE_RULE = "git {} with a whole-tree pathspec discards work and is run by the user by hand"


@dataclass
class _Simple:
    """One simple command: its words, the bodies fed to its stdin, and the command piped into it."""

    words: list[str] = field(default_factory=list)
    bodies: list[str] = field(default_factory=list)
    pipe_from: _Simple | None = None
    discard: bool = False


@dataclass
class _Heredoc:
    """A here-document whose body starts on the line after the current one."""

    delimiter: str
    strip_tabs: bool
    quoted: bool
    owner: _Simple


class _Frame:
    """One open construct of the text being read.

    Its kind is "cmd" (a command context: the text itself, a $( ), <( ) or >( ) text or a backtick
    text), "dq" (double-quoted text or a here-document body) or "brace" (a ${ } expansion).
    """

    def __init__(self, kind: str) -> None:
        self.kind = kind
        self.placeholder = ""  # what the construct leaves in the word it stands in
        self.closer = ""  # ")" for a $( ), <( ) or >( ) text
        self.restore: tuple[str, int] | None = None  # the text and position to return to
        self.unclosed = False
        self.closing_quote = True
        self.level = 0
        self.sink: list[tuple[str, bool]] = []  # where a "dq" frame puts its text
        self.current = _Simple()
        self.parts: list[tuple[str, bool]] = []
        self.in_word = False
        self.quoted = False
        self.redirect = ""
        self.heredocs: list[_Heredoc] = []
        self.parens = 0
        self.cases = 0
        self.skip = 0
        self.coproc = False


class _Lexer:
    """Reads shell text into its simple commands, with an explicit stack of the open constructs."""

    def __init__(self, text: str) -> None:
        self.text = text
        self.pos = 0
        self.stack: list[_Frame] = []
        self.commands: list[_Simple] = []  # every simple command, in the order it ends
        self.unbalanced = False

    def run(self) -> list[_Simple]:
        self._push("cmd")
        while self.stack and not self.unbalanced:
            frame = self.stack[-1]
            if self.pos >= len(self.text):
                self._end_of_text(frame)
            elif frame.kind == "cmd":
                self._step_command(frame)
            elif frame.kind == "dq":
                self._step_double(frame)
            else:
                self._step_braced(frame)
        while self.stack:  # an unbalanced text: what was read so far stands
            self._pop(self.stack[-1])
        return self.commands

    def _push(self, kind: str) -> _Frame:
        frame = _Frame(kind)
        self.stack.append(frame)
        return frame

    def _pop(self, frame: _Frame) -> None:
        self.stack.pop()
        if frame.kind == "cmd":
            self._end_command(frame)
        if frame.restore is not None:
            self.text, self.pos = frame.restore
        if frame.unclosed:
            self.unbalanced = True
        if not self.stack:
            return
        if frame.placeholder:
            self._emit(self.stack[-1], frame.placeholder, quoted=True)

    def _end_of_text(self, frame: _Frame) -> None:
        if frame.kind == "cmd":
            if frame.closer:
                self.unbalanced = True
            else:
                self._pop(frame)
        elif frame.kind == "dq" and not frame.closing_quote:
            self._pop(frame)
        else:
            self.unbalanced = True

    def _emit(self, frame: _Frame, text: str, quoted: bool = False) -> None:
        """Adds text to the word or double-quoted text the frame is reading."""
        if frame.kind == "cmd":
            self._add(frame, text, quoted)
        elif frame.kind == "dq":
            frame.sink.append((text, True))

    def _add(self, frame: _Frame, text: str, quoted: bool = False) -> None:
        frame.parts.append((text, quoted))
        frame.in_word = True
        frame.quoted = frame.quoted or quoted

    def _open_command(self, parent: _Frame, placeholder: str) -> None:
        frame = self._push("cmd")
        frame.closer = ")"
        frame.placeholder = placeholder

    def _step_command(self, frame: _Frame) -> None:
        text = self.text
        char = text[self.pos]
        if char in " \t":
            self._end_word(frame)
            self.pos += 1
        elif char == "\n":
            self._newline(frame)
        elif char == "\\":
            self._backslash(frame)
        elif char == "'":
            self._single_quoted(frame)
        elif char == '"':
            self.pos += 1
            self._add(frame, "", quoted=True)
            double = self._push("dq")
            double.sink = frame.parts
        elif char == "$":
            self._dollar(frame, ansi=True)
        elif char == "`":
            self._backtick(frame)
        elif char == "#" and not frame.in_word:
            end = text.find("\n", self.pos)
            self.pos = len(text) if end < 0 else end
        elif char in ";&|()<>":
            self._operator(frame)
        else:
            match = _PLAIN.match(text, self.pos)
            assert match is not None  # every character _PLAIN excludes is taken by a branch above
            self._add(frame, match.group())
            self.pos = match.end()

    def _step_double(self, frame: _Frame) -> None:
        text = self.text
        char = text[self.pos]
        if char == '"' and frame.closing_quote:
            self.pos += 1
            self._pop(frame)
        elif char == "\\":
            following = text[self.pos + 1 : self.pos + 2]
            if following == "\n":
                self.pos += 2
            elif following and following in '"\\$`':
                self._emit(frame, following)
                self.pos += 2
            else:
                self._emit(frame, "\\")
                self.pos += 1
        elif char == "$":
            self._dollar(frame, ansi=False)
        elif char == "`":
            self._backtick(frame)
        else:
            match = _DOUBLE_QUOTED.match(text, self.pos)
            if match is None:  # a double quote inside a here-document body
                self._emit(frame, char)
                self.pos += 1
            else:
                self._emit(frame, match.group())
                self.pos = match.end()

    def _step_braced(self, frame: _Frame) -> None:
        """Reads ${ }, a parameter expansion; a substitution inside it still runs."""
        text = self.text
        char = text[self.pos]
        if char == "{":
            frame.level += 1
            self.pos += 1
        elif char == "}":
            frame.level -= 1
            self.pos += 1
            if frame.level == 0:
                self._pop(frame)
        elif char == "\\":
            self.pos += 2
        elif char == "'":
            end = text.find("'", self.pos + 1)
            if end < 0:
                self.unbalanced = True
            else:
                self.pos = end + 1
        elif char == '"':
            self.pos += 1
            self._push("dq")
        elif char == "$":
            self._dollar(frame, ansi=False)
        elif char == "`":
            self._backtick(frame)
        else:
            self.pos += 1

    def _backslash(self, frame: _Frame) -> None:
        following = self.text[self.pos + 1 : self.pos + 2]
        if following == "\n":
            self.pos += 2
        elif following:
            self._add(frame, following, quoted=True)
            self.pos += 2
        else:
            self._add(frame, "\\")
            self.pos += 1

    def _single_quoted(self, frame: _Frame) -> None:
        end = self.text.find("'", self.pos + 1)
        if end < 0:
            self._add(frame, self.text[self.pos + 1 :], quoted=True)
            self.pos = len(self.text)
            self.unbalanced = True
        else:
            self._add(frame, self.text[self.pos + 1 : end], quoted=True)
            self.pos = end + 1

    def _dollar(self, frame: _Frame, ansi: bool) -> None:
        """Reads $( ) and $(( ), whose text is read as a command, ${ } and $'...'.

        Bash reads $(( as arithmetic only when it closes with )); the text between is read as a
        command, which reads the arithmetic form as words and the $( ( ... ) ) form as a subshell.
        """
        text = self.text
        if text.startswith("$(", self.pos):
            self.pos += 2
            self._open_command(frame, "$(...)")
        elif text.startswith("${", self.pos):
            self.pos += 2
            braced = self._push("brace")
            braced.level = 1
            braced.placeholder = "${...}"
        elif ansi and text.startswith("$'", self.pos):
            self._ansi_quoted(frame)
        else:
            self._emit(frame, "$")
            self.pos += 1

    def _ansi_quoted(self, frame: _Frame) -> None:
        text = self.text
        index = self.pos + 2
        while index < len(text) and text[index] != "'":
            index += 2 if text[index] == "\\" else 1
        self._add(frame, _unescape(text[self.pos + 2 : index]), quoted=True)
        self.pos = index + 1
        if index >= len(text):
            self.unbalanced = True

    def _backtick(self, frame: _Frame) -> None:
        """Reads a backtick substitution as a command text of its own."""
        text = self.text
        index = self.pos + 1
        chars: list[str] = []
        while index < len(text) and text[index] != "`":
            if text[index] == "\\" and text[index + 1 : index + 2] in ("\\", "`", "$"):
                chars.append(text[index + 1])
                index += 2
            else:
                chars.append(text[index])
                index += 1
        inner = self._push("cmd")
        inner.placeholder = "`...`"
        inner.unclosed = index >= len(text)
        inner.restore = (text, index + 1)
        self.text = "".join(chars)
        self.pos = 0

    def _operator(self, frame: _Frame) -> None:
        operator = next(op for op in _OPERATORS if self.text.startswith(op, self.pos))
        if operator in ("<(", ">("):
            self.pos += 2
            self._open_command(frame, operator + "...)")
        elif operator in _REDIRECTIONS:
            if frame.in_word and not frame.quoted and _DESCRIPTOR.match(_word(frame.parts)):
                frame.parts = []  # a file descriptor number, not a word
                frame.in_word = False
            self._end_word(frame)
            frame.redirect = operator
            self.pos += len(operator)
        elif operator == "(":
            self._end_command(frame)
            frame.parens += 1
            self.pos += 1
        elif operator == ")":
            self._close_paren(frame)
        else:
            self._end_command(frame, pipe=operator in _PIPES)
            self.pos += len(operator)

    def _close_paren(self, frame: _Frame) -> None:
        self.pos += 1
        if frame.parens > 0:
            frame.parens -= 1
            self._end_command(frame)
        elif frame.cases > 0:
            self._end_word(frame)
            frame.current = _Simple()  # a case pattern, not a command
        elif frame.closer:
            self._pop(frame)
        else:
            self._end_command(frame)

    def _newline(self, frame: _Frame) -> None:
        self._end_command(frame)
        self.pos += 1
        text = self.text
        expanded: list[str] = []
        for heredoc in frame.heredocs:
            lines: list[str] = []
            while self.pos < len(text):
                end = text.find("\n", self.pos)
                line_end = len(text) if end < 0 else end
                line = text[self.pos : line_end]
                self.pos = min(len(text), line_end + 1)
                if (line.lstrip("\t") if heredoc.strip_tabs else line) == heredoc.delimiter:
                    break
                lines.append(line)
            body = "\n".join(lines)
            heredoc.owner.bodies.append(body)
            if not heredoc.quoted:
                expanded.append(body)
        frame.heredocs = []
        if expanded:  # an unquoted body has the shell run the substitutions in it
            body_frame = self._push("dq")
            body_frame.closing_quote = False
            body_frame.restore = (text, self.pos)
            self.text = "\n".join(expanded)
            self.pos = 0

    def _end_word(self, frame: _Frame) -> None:
        if not frame.in_word:
            return
        parts = frame.parts
        quoted = frame.quoted
        frame.parts = []
        frame.in_word = False
        frame.quoted = False
        if frame.redirect:
            operator = frame.redirect
            frame.redirect = ""
            word = _word(parts)
            if operator in ("<<", "<<-"):
                frame.heredocs.append(_Heredoc(word, operator == "<<-", quoted, frame.current))
            elif operator == "<<<":
                frame.current.bodies.append(word)
            return
        for word in _expand_braces(parts):
            self._add_word(frame, word, quoted)

    def _add_word(self, frame: _Frame, word: str, quoted: bool) -> None:
        current = frame.current
        if frame.skip:
            frame.skip -= 1
            return
        if frame.coproc and word == "{" and not quoted and len(current.words) == 1:
            current.words.clear()  # coproc NAME { ...; }
            frame.coproc = False
            return
        if not current.words and not quoted:
            if word == "esac":
                frame.cases = max(0, frame.cases - 1)
                return
            if word in _COMPOUND_WORDS:
                return
            if word == "function":
                frame.skip = 1  # the function's name
                return
            if word == "coproc":
                frame.coproc = True
                return
            if word in _LIST_HEADS:
                current.discard = True  # the words after `for NAME in` are a list, not a command
            elif word == "case":
                current.discard = True
                frame.cases += 1
        current.words.append(word)

    def _end_command(self, frame: _Frame, pipe: bool = False) -> None:
        self._end_word(frame)
        current = frame.current
        emitted = current if current.words and not current.discard else None
        if emitted is not None:
            self.commands.append(emitted)
        frame.redirect = ""
        frame.skip = 0
        frame.coproc = False
        frame.current = _Simple(pipe_from=emitted if pipe else None)


def _word(parts: list[tuple[str, bool]]) -> str:
    return "".join(text for text, _ in parts)


def _unescape(text: str, echo: bool = False) -> str:
    """Decodes the backslash escapes of $'...', a printf format or (with echo) an echo -e text."""
    out: list[str] = []
    index = 0
    while index < len(text):
        char = text[index]
        following = text[index + 1 : index + 2]
        if char != "\\" or not following:
            out.append(char)
            index += 1
        elif following in _ESCAPES:
            out.append(_ESCAPES[following])
            index += 2
        elif following in "01234567" and not (echo and following != "0"):
            start = index + 2 if echo else index + 1  # echo writes \0 and then up to three digits
            match = _OCTAL.match(text, start)
            out.append(chr(int(match.group(), 8) & 0xFF) if match else "\x00")
            index = match.end() if match else start
        elif following in _HEX:
            match = _HEX[following].match(text, index + 2)
            code = int(match.group(), 16) if match else -1
            if match and code <= 0x10FFFF:
                out.append(chr(code))
                index = match.end()
            else:
                out.append("\\" + following)
                index += 2
        elif following == "c" and index + 2 < len(text):
            out.append(chr(ord(text[index + 2]) & 0x1F))
            index += 3
        else:
            out.append("\\" + following)
            index += 2
    return "".join(out)


def _expand_braces(parts: list[tuple[str, bool]]) -> list[str]:
    """The words an unquoted word with a comma list in braces expands to, as bash expands it."""
    whole = _word(parts)
    if len(whole) > _MAX_BRACE_LENGTH or not any(
        "{" in text and not quoted for text, quoted in parts
    ):
        return [whole]
    pending = deque([[(char, quoted) for text, quoted in parts for char in text]])
    done: list[str] = []
    while pending:
        if len(pending) + len(done) > _MAX_BRACE_WORDS:
            return [whole]
        chars = pending.popleft()
        group = _first_group(chars)
        if group is None:
            done.append("".join(char for char, _ in chars))
            continue
        start, stop, commas = group
        bounds = [start, *commas, stop]
        for left, right in zip(bounds, bounds[1:]):
            pending.append(chars[:start] + chars[left + 1 : right] + chars[stop + 1 :])
    return done


def _first_group(chars: list[tuple[str, bool]]) -> tuple[int, int, list[int]] | None:
    """The first braced group, innermost first, that holds a comma outside nested braces."""
    opens: list[int] = []
    commas: list[list[int]] = []
    for index, (char, quoted) in enumerate(chars):
        if quoted:
            continue
        if char == "{":
            opens.append(index)
            commas.append([])
        elif char == "," and opens:
            commas[-1].append(index)
        elif char == "}" and opens:
            start = opens.pop()
            found = commas.pop()
            if found:
                return start, index, found
    return None


def _basename(word: str) -> str:
    return word.rsplit("/", 1)[-1]


def _is_git(name: str) -> bool:
    """Whether a command word names git, as itself or as a glob pattern that matches it."""
    if name == "git":
        return True
    try:
        return any(char in name for char in "*?[") and fnmatchcase("git", name)
    except re.error:  # Python 3.9 refuses a pattern such as [z-a] that names no character
        return False


def _quote(word: str) -> str:
    return "'" + word.replace("'", "'\\''") + "'"


def _line(shown: list[str], rule: str) -> str:
    command = " ".join(" ".join(shown).split())
    return f"git-guard: blocked: {command} ({rule})"


# What a simple command asks the checker to look at next: a command text or a simple command, with
# the inline git configuration that reaches it.
_Todo = tuple["str | _Simple", dict[str, str]]


def _check_text(text: str) -> str | None:
    """The line for the first blocked simple command of `text`, or None."""
    stack: list[tuple[list[_Simple], dict[str, str]]] = [(_Lexer(text).run(), {})]
    positions = [0]
    while stack:
        commands, inherited = stack[-1]
        if positions[-1] >= len(commands):
            stack.pop()
            positions.pop()
            continue
        command = commands[positions[-1]]
        positions[-1] += 1
        outcome = _check_simple(command, inherited)
        if isinstance(outcome, str):
            return outcome
        for item, config in reversed(outcome or []):
            stack.append((_Lexer(item).run() if isinstance(item, str) else [item], config))
            positions.append(0)
    return None


def _check_simple(command: _Simple, inherited: dict[str, str]) -> str | list[_Todo] | None:
    env: dict[str, str] = {}
    words = command.words
    todos: list[_Todo] = []
    index = 0
    while True:
        while index < len(words) and _ASSIGNMENT.match(words[index]):
            variable, _, value = words[index].partition("=")
            env[variable] = value
            index += 1
        if index >= len(words):
            return todos or None
        name = _basename(words[index])
        config = {**inherited, **_config_of(env)}
        if _is_git(name):
            outcome = _check_git(command.words, words[index + 1 :], config, env)
            return outcome if isinstance(outcome, str) else todos + (outcome or []) or None
        if name in _TEXT_WRAPPERS:
            index += 1
            if name == "eval":
                while index < len(words) and words[index] == "eval":
                    index += 1
            else:
                _, index = _take_options(words, index, _TEXT_WRAPPERS[name])
            return [*todos, (" ".join(words[index:]), config)]
        if name in _SHELLS:
            return [*todos, *_shell_todos(command, words[index + 1 :], config)] or None
        if name == "find":
            return [*todos, *_find_todos(words[index + 1 :], config)] or None
        if name not in _WRAPPERS:
            return todos or None
        valued, positionals = _WRAPPERS[name]
        options, index = _take_options(words, index + 1, valued)
        index += positionals
        if name == "env":
            todos.extend(
                (value, config) for option, value in options if option in ("-S", "--split-string")
            )
        if name == "xargs" and command.pipe_from is not None and index < len(words):
            piped = _piped_texts(command.pipe_from)
            if piped:
                return [
                    *todos,
                    *((_Simple(words=words[index:] + text.split()), config) for text in piped),
                ]


def _take_options(
    words: list[str], start: int, valued: frozenset[str]
) -> tuple[list[tuple[str, str]], int]:
    """Reads the options from `start`, each with its value, and gives the index after them."""
    options: list[tuple[str, str]] = []
    index = start
    while index < len(words):
        word = words[index]
        if word == "--":
            index += 1
            break
        if len(word) < 2 or not word.startswith("-"):
            break
        index += 1
        if word.startswith("--"):
            name, has_value, value = word.partition("=")
            if not has_value and name in valued and index < len(words):
                value = words[index]
                index += 1
            options.append((name, value))
            continue
        for offset, letter in enumerate(word[1:], start=2):
            if "-" + letter in valued:
                value = word[offset:]
                if not value and index < len(words):
                    value = words[index]
                    index += 1
                options.append(("-" + letter, value))
                break
    return options, index


def _shell_arguments(words: list[str]) -> tuple[str | None, bool]:
    """The -c string of a shell's arguments, and whether the shell reads a script from stdin.

    The string is the first operand after all of the shell's options.
    """
    index = 0
    has_c = False
    reads_stdin = False
    while index < len(words):
        word = words[index]
        if word == "--":
            index += 1
            break
        if word == "-":
            reads_stdin = True
        elif len(word) < 2 or word[0] not in "-+":
            break
        elif word in _SHELL_VALUED:
            index += 1
        elif word[0] == "-" and word[1] != "-":
            has_c = has_c or "c" in word[1:]
            reads_stdin = reads_stdin or "s" in word[1:]
        index += 1
    operands = words[index:]
    if has_c:
        return (operands[0] if operands else ""), False
    return None, reads_stdin or not operands


def _shell_todos(command: _Simple, arguments: list[str], config: dict[str, str]) -> list[_Todo]:
    script, reads_stdin = _shell_arguments(arguments)
    if script is not None:
        return [(script, config)]
    if not reads_stdin:
        return []
    texts = list(command.bodies)
    if command.pipe_from is not None:
        texts.extend(_piped_texts(command.pipe_from))
    return [(text, config) for text in texts]


def _find_todos(arguments: list[str], config: dict[str, str]) -> list[_Todo]:
    """The commands find runs with -exec, -execdir, -ok and -okdir, up to ; or +."""
    todos: list[_Todo] = []
    for index, word in enumerate(arguments):
        if word in _FIND_EXEC:
            end = index + 1
            while end < len(arguments) and arguments[end] not in (";", "+"):
                end += 1
            if end > index + 1:
                todos.append((_Simple(words=arguments[index + 1 : end]), config))
    return todos


def _piped_texts(source: _Simple) -> list[str]:
    """What an echo or printf command writes into a pipe, as texts."""
    if not source.words:
        return []
    arguments = source.words[1:]
    name = _basename(source.words[0])
    if name == "echo":
        while arguments and _ECHO_FLAGS.match(arguments[0]):
            arguments = arguments[1:]
        text = " ".join(arguments)
        return [text, _unescape(text, echo=True)] if "\\" in text else [text]
    if name == "printf" and arguments:
        texts = [_unescape(arguments[0])]
        if "%" in arguments[0]:
            texts.extend(arguments[1:])
        return texts
    return []


def _config_of(env: dict[str, str]) -> dict[str, str]:
    """The git configuration that GIT_CONFIG_PARAMETERS and GIT_CONFIG_COUNT with its pairs give."""
    config: dict[str, str] = {}
    parameters = env.get("GIT_CONFIG_PARAMETERS")
    if parameters:
        for word in (w for command in _Lexer(parameters).run() for w in command.words):
            key, has_value, value = word.partition("=")
            config[key.lower()] = value if has_value else "true"
    try:
        count = int(env.get("GIT_CONFIG_COUNT", "0"))
    except ValueError:
        return config
    for name, key in env.items():
        match = _CONFIG_KEY.match(name)
        if match and int(match.group(1)) < count:
            config[key.lower()] = env.get(f"GIT_CONFIG_VALUE_{match.group(1)}", "")
    return config


def _check_git(
    shown: list[str], arguments: list[str], config: dict[str, str], env: dict[str, str]
) -> str | list[_Todo] | None:
    """The line for a blocked git command, or the command texts an alias runs.

    `arguments` are the words after `git`, `config` the configuration inline so far and `env` the
    variables assigned in the same simple command.
    """
    config = dict(config)
    seen: set[str] = set()
    while True:
        index = 0
        while index < len(arguments) and arguments[index].startswith("-"):
            option = arguments[index]
            if option == "-c" and index + 1 < len(arguments):
                key, has_value, value = arguments[index + 1].partition("=")
                config[key.lower()] = value if has_value else "true"
                index += 2
            elif option == "--config-env" and index + 1 < len(arguments):
                _config_env(arguments[index + 1], config, env)
                index += 2
            elif option.startswith("--config-env="):
                _config_env(option.partition("=")[2], config, env)
                index += 1
            elif option in _GIT_VALUED_OPTIONS:
                index += 2
            else:
                index += 1
        if index >= len(arguments):
            return None
        subcommand = arguments[index]
        rest = arguments[index + 1 :]
        check = _CHECKS.get(subcommand)
        if check is not None:
            rule = check(rest, config)
            return None if rule is None else _line(shown, rule)
        name = subcommand.lower()
        expansion = config.get("alias." + name)
        if expansion is None or name in seen:
            return None
        seen.add(name)
        if expansion.startswith("!"):
            text = expansion[1:] + "".join(" " + _quote(argument) for argument in rest)
            return [(text, config)]
        words = [word for command in _Lexer(expansion).run() for word in command.words]
        arguments = words + rest


def _config_env(spec: str, config: dict[str, str], env: dict[str, str]) -> None:
    """Sets the configuration key of `key=VARIABLE` to the value of a variable assigned inline."""
    key, _, variable = spec.partition("=")
    if variable in env:
        config[key.lower()] = env[variable]


def _options(arguments: list[str]) -> list[str]:
    """The words before `--` that start with a dash."""
    found: list[str] = []
    for argument in arguments:
        if argument == "--":
            break
        if argument.startswith("-"):
            found.append(argument)
    return found


def _is_long(argument: str, name: str, shortest: int) -> bool:
    """Whether `argument` is `name` or a prefix of it at least `shortest` characters long."""
    return argument.startswith("--") and len(argument) >= shortest and name.startswith(argument)


def _is_short(argument: str, letter: str) -> bool:
    """Whether `argument` is a short-option word that holds `letter`."""
    return argument.startswith("-") and not argument.startswith("--") and letter in argument[1:]


def _is_false(value: str) -> bool:
    """Whether git reads `value` as the boolean false: false, no, off, empty or an integer 0."""
    text = value.strip().lower()
    digits = text.lstrip("+-")
    return text in _FALSE_WORDS or (digits.isascii() and digits.isdigit() and not digits.strip("0"))


def _rule_push(arguments: list[str], config: dict[str, str]) -> str | None:
    return _PUSH_RULE


def _rule_reset(arguments: list[str], config: dict[str, str]) -> str | None:
    if any(_is_long(option, "--hard", 4) for option in _options(arguments)):
        return _RESET_RULE
    return None


def _rule_clean(arguments: list[str], config: dict[str, str]) -> str | None:
    options = _options(arguments)
    if any(_is_long(option, "--force", 4) or _is_short(option, "f") for option in options):
        return _CLEAN_RULE
    dry_run = any(_is_long(option, "--dry-run", 3) or _is_short(option, "n") for option in options)
    require_force = config.get("clean.requireforce")
    if require_force is not None and _is_false(require_force) and not dry_run:
        return _CLEAN_RULE
    return None


def _rule_checkout(arguments: list[str], config: dict[str, str]) -> str | None:
    before, after = _split_pathspecs(arguments, _CHECKOUT_VALUED)
    words = before + (after or [])
    # The first word before `--` may be a revision, and after `--` every word is a pathspec.
    if after is not None:
        candidates = after
    elif before and _kind(before[0]) != "exclude":
        candidates = before[1:]
    else:
        candidates = before
    if _whole_tree(words, candidates):
        return _TREE_RULE.format("checkout")
    return None


def _rule_restore(arguments: list[str], config: dict[str, str]) -> str | None:
    options = _options(arguments)
    staged = any(_is_long(option, "--staged", 4) or _is_short(option, "S") for option in options)
    worktree = any(
        _is_long(option, "--worktree", 3) or _is_short(option, "W") for option in options
    )
    if staged and not worktree:
        return None  # restoring only the index discards no work
    before, after = _split_pathspecs(arguments, _RESTORE_VALUED)
    words = before + (after or [])
    if _whole_tree(words, words):
        return _TREE_RULE.format("restore")
    return None


def _split_pathspecs(
    arguments: list[str], valued: frozenset[str]
) -> tuple[list[str], list[str] | None]:
    """The non-option words before `--`, and the words after it (None when there is no `--`)."""
    before: list[str] = []
    after: list[str] | None = None
    index = 0
    while index < len(arguments):
        argument = arguments[index]
        if after is not None:
            after.append(argument)
        elif argument == "--":
            after = []
        elif argument.startswith("-") and len(argument) > 1:
            if argument in valued:
                index += 1
        else:
            before.append(argument)
        index += 1
    return before, after


def _whole_tree(words: list[str], candidates: list[str]) -> bool:
    """Whether a word is a whole-tree pathspec, or the candidates are all excludes."""
    if any(_kind(word) == "tree" for word in words):
        return True
    return bool(candidates) and all(_kind(word) == "exclude" for word in candidates)


def _kind(word: str) -> str:
    """Whether a pathspec is the "tree", an "exclude" or an ordinary "path", as written."""
    magic, pattern, has_magic = _magic(word)
    if "exclude" in magic:
        return "exclude"
    if "literal" in magic or not (has_magic or pattern):
        return "path"
    parts = [part for part in pattern.split("/") if part not in ("", ".")]
    while parts and parts[0] == "..":
        parts.pop(0)
    return "tree" if not parts or parts in (["*"], ["**"]) else "path"


def _magic(word: str) -> tuple[set[str], str, bool]:
    """The magic of a pathspec, its pattern, and whether it starts with magic."""
    if not word.startswith(":"):
        return set(), word, False
    magic: set[str] = set()
    if word.startswith(":("):
        end = word.find(")")
        if end < 0:
            return magic, word, False
        magic.update(word[2:end].split(","))
        return magic, word[end + 1 :], True
    index = 1
    while index < len(word) and word[index] in "!^/":
        magic.add("top" if word[index] == "/" else "exclude")
        index += 1
    if index < len(word) and word[index] == ":":
        index += 1
    return magic, word[index:], True


_CHECKS = {
    "push": _rule_push,
    "reset": _rule_reset,
    "clean": _rule_clean,
    "checkout": _rule_checkout,
    "restore": _rule_restore,
}


def _command_of(raw: str) -> str | None:
    """The shell command in a hook event's `tool_input`, or None when there is none."""
    try:
        event = json.loads(raw)
    except (ValueError, RecursionError):
        return None
    if not isinstance(event, dict):
        return None
    tool_input = event.get("tool_input")
    if not isinstance(tool_input, dict):
        return None
    command = tool_input.get("command")
    return command if isinstance(command, str) else None


def main() -> int:
    raw = sys.stdin.buffer.read().decode("utf-8", errors="replace")
    command = _command_of(raw)
    if command is None:
        return 0
    line = _check_text(command)
    if line is None:
        return 0
    print(line, file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())
```

## git_guard.test.sh, whole

```
#!/bin/sh
# Exercise git_guard.py on JSON inputs shaped like the PreToolUse event, each case one command with the result the guard must give. A blocked case must exit 2 with exactly one line on stderr that starts with "git-guard: blocked: " and nothing on stdout; an allowed case must exit 0 with nothing on stderr and nothing on stdout. The test never runs git. GIT_GUARD names another script to test, such as a scratch copy with one block removed.
# Blocked, push: git push with arguments, --force and --dry-run; behind -C, -c, --git-dir (both spellings), --attr-source (both spellings) and --no-pager; through an absolute path, a glob pattern in the command word, a backslash and quotes; behind an environment assignment, env (with -u), command -p, nohup, nice -n, time -p, timeout (with -s), sudo (with -u and -Eu), doas, stdbuf, xargs (with -I{}, -n, a redirection and the words an echo or printf pipes into it), watch (with -n, --interval and a command in one string), find with -exec, -execdir, -ok and -okdir, eval (bare and quoted) and exec; after cd &&, ;, ||, &, a newline and a line continuation; in a subshell (also written with the operators run together), braces, after !, in if, for, while and case, after function NAME and coproc (with and without a name); in $( ), "$( )", $(( ) ) as a subshell, backticks, "` `", A=$( ), <( ) and nested $( ); in a word written as a brace expansion with a comma list (whole word, inside a word and nested); in a word written with $'...' escapes (\x, \u and octal); in sh -c, bash -c, bash -lc, sh -ec, env -S and a shell whose -c string follows further options (-c -- str, -c -e str, -c -x str, -c -o errexit str); in a here-document, a here-string, an echo pipe, an echo -e pipe and a printf pipe (the format with \n, \t, \x and octal escapes, typed and as a newline) into a shell, also into bash - and bash -s; through an alias given as -c alias.<name>=, as a ! alias (with the arguments git appends to it and with inline configuration carried into the git command it runs), as GIT_CONFIG_KEY_<n> with GIT_CONFIG_VALUE_<n>, as --config-env=<key>=<variable> (both spellings) and as GIT_CONFIG_PARAMETERS; after a redirection of file descriptors and a pipe.
# Blocked, reset, clean, checkout and restore: reset --hard in each position, behind -C and as the prefixes --har and --ha; clean with -f in each combined flag, --force and its prefix --forc, -fn and -c clean.requireForce set to false (empty, 00, -0, OFF and false); checkout and restore with . ./ .. :/ * ** :(glob)** :(top) and exclude-only pathspec sets, with and without --, after -p, -s, --source= and revisions, and beside another path.
# Allowed: git branch -D, git worktree remove, git restore -- paths, git restore --staged --worktree -- paths, git restore --staged . and -S ., git checkout --theirs -- path, git checkout of a branch, -b, ./a, -- ../x.md and an exclude beside a path, -c core.excludesFile=f, git apply, git reset --soft, --help and HEAD -- path, git clean -n and -nd, git clean with clean.requireForce true, 1, given with no value, or absent, git status, log, diff -- ., add -- ., stash list and an alias to status (also a ! alias to status and configuration from --config-env or GIT_CONFIG_PARAMETERS that names status); text that names git push inside echo, in single quotes, in a commit message, in grep, in a here-document not fed to a shell, in for-list words and in a case pattern; $((1 + 2)); a comment; ${x} without a command; a brace expansion, a $'...' word, a glob word (also a pattern that names no character),  a printf or echo pipe, watch, find -exec, stdbuf, doas and a bash -c string that name git status or no git; a command with no git, an empty command, and a command the shell would refuse.
# Inputs: not JSON, a JSON array, empty stdin, a byte that is not UTF-8 around git status (allowed) and around git push (blocked), a Read tool input, a tool_input without command, a command that is not a string and a tool_input that is a string are allowed; the Monitor tool, an input with no tool_name and a command of one megabyte of "echo x; " before git push are blocked.
# Depth: a command of any nesting depth is read and gives no traceback: echo $( x150 around git status (allowed) and git push (blocked), ${x:- x150 around x or git push as text (allowed) and around $(git push) (blocked), $(( x150 around 1 (allowed), $( x2000 around git status (allowed) and git push (blocked, read in under two seconds), and 90 of ${x:- and $( together, eight times over, around git push (blocked) and git status (allowed).
# The line names the simple command found (through a wrapper, the wrapper included; inside a substitution, the inner command) and the first blocked command decides.

set -u

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    exit 1
}

test_root=$(mktemp -d "${TMPDIR:-/tmp}/git-guard-test.XXXXXX") || fail "could not create scratch directory"
trap 'rm -rf "$test_root"' 0 1 2 3 15
script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)
guard=${GIT_GUARD:-$script_dir/git_guard.py}
tab=$(printf '\t')
input=$test_root/input
out=$test_root/out
err=$test_root/err

# Feeds the file $1 to the guard, keeping its stdout and stderr in files and its exit status in $status.
run_guard() {
    python3 "$guard" <"$1" >"$out" 2>"$err"
    status=$?
}

expect_block() {
    [ "$status" = 2 ] || fail "$1: expected exit 2, got $status: $(cat "$err")"
    [ ! -s "$out" ] || fail "$1: expected nothing on stdout, got: $(cat "$out")"
    [ "$(wc -l <"$err" | tr -d ' ')" = 1 ] || fail "$1: expected one line on stderr, got: $(cat "$err")"
    case $(cat "$err") in
        "git-guard: blocked: "*) ;;
        *) fail "$1: stderr does not start with [git-guard: blocked: ]: $(cat "$err")" ;;
    esac
}

expect_allow() {
    [ "$status" = 0 ] || fail "$1: expected exit 0, got $status: $(cat "$err")"
    [ ! -s "$out" ] || fail "$1: expected nothing on stdout, got: $(cat "$out")"
    [ ! -s "$err" ] || fail "$1: expected nothing on stderr, got: $(cat "$err")"
}

# Writes the Bash tool input for the command $1 to the input file.
write_request() {
    python3 -c 'import json, sys; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": sys.argv[1]}}))' "$1" >"$input" ||
        fail "could not build the input for [$1]"
}

# A blocked command whose stderr line is exactly $2.
expect_line() {
    write_request "$1"
    run_guard "$input"
    expect_block "$1"
    [ "$(cat "$err")" = "$2" ] || fail "$1: expected the line [$2], got: $(cat "$err")"
}

# Each line of the case file is "block <command>" or "allow <command>", and <NL> stands for a newline inside a command.
cases=$test_root/cases
requests=$test_root/requests
cat >"$cases" <<'CASES'
block git push
block git push origin main
block git push --force
block git push --dry-run
block git -C /tmp/x push
block git -c user.name=a push
block git --git-dir=.git push
block git --git-dir .git push
block git --no-pager push
block /usr/bin/git push
block \git push
block "git" push
block GIT_TRACE=1 git push
block env GIT_TRACE=1 git push
block env -u HOME git push
block command -p git push
block nohup git push
block nice -n 5 git push
block time -p git push
block timeout 10 git push
block timeout -s KILL 10 git push
block sudo git push
block sudo -u root git push
block xargs git push < /dev/null
block xargs -I{} git push {}
block xargs -n 1 git push
block eval git push
block eval "git push"
block exec git push
block cd x && git push
block git status; git push
block false || git push
block git fetch & git push
block git fetch<NL>git push
block git \<NL>push
block (cd x && git push)
block true;(git push)
block true&&(git push)
block { git push; }
block ! git push
block if git push; then :; fi
block if true; then git push; fi
block for b in x; do git push; done
block while true; do git push; done
block case x in x) git push;; esac
block echo $(git push)
block echo "$(git push)"
block echo `git push`
block echo "`git push`"
block A=$(git push)
block cat <(git push)
block echo $(echo $(git push))
block sh -c 'git push'
block bash -c "cd x && git push"
block bash -lc 'git push'
block sh -ec 'git push'
block env -S "git push"
block bash <<EOF<NL>git push<NL>EOF
block bash <<< 'git push'
block echo 'git push' | sh
block printf 'git push\n' | bash
block printf 'git push<NL>' | bash
block git log 2>&1 | head; git push
block git -c alias.p=push p
block git -c 'alias.p=!git push' p
block GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=alias.p GIT_CONFIG_VALUE_0=push git p
block git reset --hard
block git reset --hard HEAD~1
block git reset HEAD~1 --hard
block git -C x reset --hard
block git reset --har
block git reset --ha
block git clean -f
block git clean -fd
block git clean -fdx
block git clean -xdf
block git clean -d -f
block git clean --force
block git clean --forc
block git clean -fn
block git -c clean.requireForce=false clean -d
block git checkout .
block git checkout -- .
block git checkout HEAD -- .
block git checkout ./
block git checkout -p .
block git checkout . other
block git checkout -- ':/'
block git checkout -- '*'
block git checkout -- ':(glob)**'
block git checkout -- ':!a.md'
block git restore .
block git restore -- .
block git restore --staged --worktree .
block git restore -S -W .
block git restore -s HEAD .
block git restore --source=HEAD :/
block git restore -- ':(top)'
block git restore -- '**'
block git restore -- ':^a.md' ':(exclude)b.md'
block git restore ..
allow git branch -D 2e-12a
allow git branch -q -D x-land
allow git worktree remove --force .agents/worktrees/2e-12a
allow git restore -- a.md b.md
allow git restore --staged --worktree -- a.md
allow git restore --staged .
allow git restore -S .
allow git checkout --theirs -- a.bin
allow git checkout main
allow git checkout -q 2e-12a
allow git checkout -b x-land main
allow git checkout ./a
allow git checkout -- ../x.md
allow git checkout -- ':!a.md' b.md
allow git -c core.excludesFile=/tmp/f checkout -b x-land main
allow git worktree remove --force "$tmp/tree"
allow git apply --3way --allow-empty "$tmp/step.diff"
allow git reset --soft HEAD~1
allow git reset HEAD -- a.md
allow git reset --help
allow git clean -n
allow git clean -nd
allow git status
allow git log --oneline | head -3
allow git log 2>&1 | head
allow git diff -- .
allow git add -- .
allow git stash list
allow git -c alias.p=status p
allow echo "git push"
allow echo git push
allow echo 'git push' | cat
allow echo '$(git push)'
allow git commit -m "do not git push or git reset --hard"
allow grep -n "git push" README.md
allow git commit -F - <<'EOF'<NL>Never git push here.<NL>EOF
allow echo $((1 + 2))
allow for b in git push; do echo "$b"; done
allow case "$x" in push) echo x;; esac
allow ls -la
allow
allow git commit -m "unbalanced
block git commit -F - <<EOF<NL>$(git push)<NL>EOF
allow git commit -F - <<'EOF'<NL>$(git push)<NL>EOF
block echo ${x:-$(git push)}
block echo $'it\'s'; git push
allow echo $'git push'
allow echo x # git push
block echo x #<NL>git push
allow echo a#b
block echo a#b; git push
block printf '%s<NL>' 'git push' | sh
allow printf 'echo hi\n' | bash
allow git checkout -b x-land main; git commit -m ok
block bash -c "$(git push)"
allow bash script.sh <<EOF<NL>git push<NL>EOF
allow bash -c 'echo hi' <<EOF<NL>git push<NL>EOF
block sudo -Eu root git push
block git -c alias.a=b -c alias.b=push a
allow git -c alias.a=b -c alias.b=a a
allow git -c alias.push=status status
block bash -c -- 'git push'
block bash -c -e 'git push'
block sh -c -x 'git push'
block bash -c -o errexit 'git push'
block bash - <<< 'git push'
block bash -s <<< 'git push'
block echo 'git push' | bash -
block bash - x <<< 'git push'
block bash -s x <<< 'git push'
allow bash x <<< 'git push'
allow bash -c -e 'echo hi'
allow bash -x script.sh
block git -c 'alias.p=!git' p push
block git -c 'alias.p=!git' p reset --hard
block git -c 'alias.p=!git q' -c alias.q=push p
block git -c alias.q=push -c 'alias.p=!git q' p
allow git -c 'alias.p=!git' p status
allow git -c 'alias.p=!git q' -c alias.q=status p
block A=push git --config-env=alias.p=A p
block A=push git --config-env alias.p=A p
allow A=status git --config-env=alias.p=A p
allow git --config-env=alias.p=A p
block GIT_CONFIG_PARAMETERS="'alias.p'='push'" git p
allow GIT_CONFIG_PARAMETERS="'alias.p'='status'" git p
block git --attr-source x push
block git --attr-source=x push
allow git --attr-source x status
block git -c clean.requireForce= clean -d
block git -c clean.requireForce=00 clean -d
block git -c clean.requireForce=-0 clean -d
block git -c clean.requireForce=OFF clean -d
allow git -c clean.requireForce clean -n
allow git -c clean.requireForce clean -d
allow git -c clean.requireForce=true clean -d
allow git -c clean.requireForce=1 clean -d
allow git clean -d
block echo $((git push) )
allow echo $((git status) )
block function f { git push; }; f
block function f() { git push; }
block coproc git push
block coproc NAME { git push; }
allow function f { git status; }
allow coproc git status
block {git,push}
allow gi{t,x} push
block git p{u,v}sh
block git {push,x}
block git {{push,y},x}
allow {git,status}
allow git {a}
allow "{git,push}"
allow echo {git,push}
allow git p{u}sh
block $'\x67it' push
block git $'\x70ush'
block $'\147it' push
block git $'push'
block git $'p\x75sh'
allow git $'\x73tatus'
allow echo $'\x67it push'
block /usr/bin/gi? push
block g*t push
allow /usr/bin/gi? status
allow ls *t
allow [z-a] status
allow [ -f x ]
block printf 'git\tpush' | bash
block printf 'git\x20push' | sh
block printf 'git\040push' | sh
block echo -e 'git\x20push' | sh
block echo 'git\x20push' | sh
allow printf 'git\tstatus' | bash
block echo push | xargs git
block printf 'push\n' | xargs git
allow echo status | xargs git
allow echo push | xargs echo
block stdbuf -o0 git push
block stdbuf -o L git push
block stdbuf --output=L git push
block stdbuf -i0 -o0 -e0 git push
block doas git push
block doas -u root git push
block watch git push
block watch -n 5 git push
block watch -n5 -d git push
block watch --interval 5 'git push'
block watch 'git status; git push'
block find . -exec git push \;
block find . -name x -execdir git push {} +
block find . -ok git push {} \;
block find . -okdir git push \;
allow watch git status
allow find . -exec git status \;
allow find . -name git
allow stdbuf -o0 git status
allow doas git status
CASES

python3 - "$cases" >"$requests" <<'PY' || fail "could not build the inputs"
import json
import sys

with open(sys.argv[1], encoding="utf-8") as handle:
    lines = handle.read().splitlines()
for line in lines:
    kind, _, command = line.partition(" ")
    request = {"tool_name": "Bash", "tool_input": {"command": command.replace("<NL>", "\n")}}
    print(kind, json.dumps(request), line, sep="\t")
PY

while IFS=$tab read -r kind request label; do
    printf '%s\n' "$request" >"$input"
    run_guard "$input"
    "expect_$kind" "$label"
done <"$requests"

# The line names the simple command and the rule.
expect_line 'git status; git push origin main' 'git-guard: blocked: git push origin main (git push is run by the user by hand)'
expect_line 'git reset --hard HEAD~1' 'git-guard: blocked: git reset --hard HEAD~1 (git reset --hard discards work and is run by the user by hand)'
expect_line 'git clean -fd' 'git-guard: blocked: git clean -fd (git clean deletes untracked files without asking and is run by the user by hand)'
expect_line 'git checkout -- .' 'git-guard: blocked: git checkout -- . (git checkout with a whole-tree pathspec discards work and is run by the user by hand)'
expect_line 'git restore -- .' 'git-guard: blocked: git restore -- . (git restore with a whole-tree pathspec discards work and is run by the user by hand)'
expect_line 'sudo git push' 'git-guard: blocked: sudo git push (git push is run by the user by hand)'
expect_line 'echo $(git push)' 'git-guard: blocked: git push (git push is run by the user by hand)'
expect_line 'git reset --hard; git push' 'git-guard: blocked: git reset --hard (git reset --hard discards work and is run by the user by hand)'
expect_line 'git commit -m "a
b"; git push' 'git-guard: blocked: git push (git push is run by the user by hand)'

# Inputs other than a Bash command.
check_input() {
    run_guard "$input"
    "expect_$1" "$2"
}
printf 'not json' >"$input"
check_input allow "not json"
printf '["git push"]' >"$input"
check_input allow "a JSON array"
: >"$input"
check_input allow "empty stdin"
printf '{"tool_name": "Bash", "tool_input": {"command": "echo \377; git status; echo \377"}}' >"$input"
check_input allow "a byte that is not UTF-8 around git status"
printf '{"tool_name": "Bash", "tool_input": {"command": "echo \377; git push; echo \377"}}' >"$input"
check_input block "a byte that is not UTF-8 around git push"
printf '{"tool_name": "Read", "tool_input": {"file_path": "x"}}' >"$input"
check_input allow "the Read tool"
printf '{"tool_name": "Bash", "tool_input": {}}' >"$input"
check_input allow "a tool_input without command"
printf '{"tool_name": "Bash", "tool_input": {"command": 5}}' >"$input"
check_input allow "a command that is a number"
printf '{"tool_name": "Bash", "tool_input": "git push"}' >"$input"
check_input allow "a tool_input that is a string"
printf '{"tool_name": "Monitor", "tool_input": {"command": "git push"}}' >"$input"
check_input block "the Monitor tool"
printf '{"tool_input": {"command": "git push"}}' >"$input"
check_input block "an input with no tool_name"

python3 -c 'import json; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo x; " * 131072 + "git push"}}))' >"$input" ||
    fail "could not build the one-megabyte input"
check_input block "a command of one megabyte before git push"

# A command of any nesting depth is read: the opener $1 repeated $4 times around the core $2, then the closer $3 repeated.
write_nested() {
    python3 -c 'import json, sys; opener, core, closer, depth = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4]); print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo " + opener * depth + core + closer * depth}}))' "$1" "$2" "$3" "$4" >"$input" ||
        fail "could not build the nested input"
}
write_nested '$(' 'git status' ')' 150
check_input allow "echo \$( x150 around git status"
write_nested '$(' 'git push' ')' 150
check_input block "echo \$( x150 around git push"
write_nested '${x:-' 'x' '}' 150
check_input allow "\${x:- x150 around x"
write_nested '${x:-' '$(git push)' '}' 150
check_input block "\${x:- x150 around \$(git push)"
write_nested '${x:-' 'git push' '}' 150
check_input allow "\${x:- x150 around git push as text (echo prints it and runs nothing)"
write_nested '$((' '1' '))' 150
check_input allow "\$(( x150 around 1"
write_nested '$(' 'git status' ')' 2000
check_input allow "echo \$( x2000 around git status"
write_nested '`' 'git push' '`' 1
check_input block "a backtick around git push"

# The refuter's mixed shape: 90 of ${x:- and $( together, eight times over.
write_mixed() {
    python3 -c 'import json, sys; inner = sys.argv[1]
for _ in range(8):
    inner = "${x:-" * 90 + "$(" + inner + ")" + "}" * 90
print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo " + inner}}))' "$1" >"$input" ||
        fail "could not build the mixed nested input"
}
write_mixed 'git push'
check_input block "90 of \${x:- and \$( eight times over around git push"
write_mixed 'git status'
check_input allow "90 of \${x:- and \$( eight times over around git status"

# The 2000-level command is read in under two seconds.
write_nested '$(' 'git push' ')' 2000
elapsed=$(python3 -c 'import subprocess, sys, time
start = time.monotonic()
subprocess.run(["python3", sys.argv[1]], stdin=open(sys.argv[2], "rb"), capture_output=True, check=False)
print(int((time.monotonic() - start) * 1000))' "$guard" "$input") || fail "could not time the guard"
[ "$elapsed" -lt 2000 ] || fail "echo \$( x2000 around git push took $elapsed ms, not under 2000"
check_input block "echo \$( x2000 around git push"

printf 'PASS: git_guard.py scratch tests\n'
```

## Repair round 1

Every point 1 to 9 of `.scratch/2-g-git-guard/agents/briefs/1-round-1.md` (main checkout) is done. Points 1 to 8 are in `git_guard.py` (now 1092 lines) and `git_guard.test.sh` (now 433 lines), both whole above. Point 9 is this section plus two corrections above it (the first run's path, and the file sizes and the depth judgment call under Files and Judgment calls). The hooks folder holds only the two files. Five items differ from the brief's wording or are open and are listed first.

### Deviations and open items

- Point 1, the case `${x:-` x150 around plain `git push`: the brief asks for blocked. It is allowed. In bash and zsh `echo ${x:-git push}` prints `git push` and runs nothing, because the word of a `${x:-word}` is text; only substitutions inside it run. The test therefore has `${x:-` x150 around `git push` allowed (as text), `${x:-` x150 around `x` allowed, and `${x:-` x150 around `$(git push)` blocked. Blocking the plain form would give a wrong block on a command that runs no git. If the ruling is to block it anyway, the change is one branch in `_step_braced`.
- Point 1, the mixed shape and 2000-level case are done as asked (below). No nesting limit and no `_MAX_NESTING` remain; `main` has no depth handling; no command exits 1 with a traceback or 2 for depth.
- The test takes about 69 s per run, because the depth cases start python on inputs of up to 2000 levels and the block and allow cases number several hundred.
- A blocked line is not truncated: a command of one megabyte that is blocked prints its simple command whole on stderr. The brief does not ask for truncation and the hook contract does not limit the line.
- The script is one file of 1092 lines; step 2 copies a single file.

### Point 1, depth

Old: `_Lexer` called itself per `$(`, `${`, `$((`, backtick and `<(`; `_MAX_NESTING = 100`; deeper input exited 2 with "nested deeper than 100 levels", and the reviewer's mixed shape raised `RecursionError` (exit 1). `_check_text` also recursed per nested text.
New: `_Lexer` keeps an explicit stack of `_Frame` objects of three kinds: `cmd` (the root, `$(`, `<(`, `>(` and backtick text), `dq` (double-quoted text and unquoted here-document bodies) and `brace` (`${ }`). `$((` is read as `$(` followed by a subshell, as bash does when the text is not arithmetic. Commands go into one chronological list at the end of each command (a per-frame merge was quadratic and took over 120 s at 100000 levels). `_check_text` is iterative: a work stack of (commands, inherited configuration) with follow-up texts and simple commands, so no function calls itself per level. `_MAX_NESTING`, `_TooDeepError` and the depth sentence of the docstring are gone.
Cases (in the test): `echo $(` x150 around `git status` allowed and around `git push` blocked; `${x:-` x150 as above; `$((` x150 around `1` allowed; `echo $(` x2000 around `git status` allowed and around `git push` blocked, the blocked one timed under 2000 ms inside the test; a backtick case; the mixed shape (90 x `${x:-` plus `$(` x8, repeated, around `git push` blocked and around `git status` allowed).
Timings, `stress.py` on both interpreters, verbatim (3.13.4, then 3.9.6):

```
$ python3 stress.py git_guard.py python3
  0.04s exit 2 2000 levels of $( around push git-guard: blocked: git push (git push is run by the user by hand)
  0.39s exit 2 100000 levels of $( around push git-guard: blocked: git push (git push is run by the user by hand)
  0.48s exit 0 100000 levels of $( around status 
  0.29s exit 2 100000 subshell parens around push git-guard: blocked: git push (git push is run by the user by hand)
  0.25s exit 2 100000 ${x:- around $(push) git-guard: blocked: git push (git push is run by the user by hand)
  0.27s exit 2 200000 evals then push git-guard: blocked: git push (git push is run by the user by hand)
  0.43s exit 2 200000 sudo then push udo sudo sudo sudo sudo git push (git push is run by the user by hand)
  0.68s exit 2 one megabyte echo x; then push git-guard: blocked: git push (git push is run by the user by hand)
  0.05s exit 0 one megabyte of one word 
  0.03s exit 0 brace explosion 
  2.12s exit 0 one megabyte of $( unclosed 
  0.70s exit 0 one megabyte of backticks 
$ python3 stress.py git_guard.py /usr/bin/python3
  0.05s exit 2 2000 levels of $( around push git-guard: blocked: git push (git push is run by the user by hand)
  0.79s exit 2 100000 levels of $( around push git-guard: blocked: git push (git push is run by the user by hand)
  0.91s exit 0 100000 levels of $( around status 
  0.71s exit 2 100000 subshell parens around push git-guard: blocked: git push (git push is run by the user by hand)
  0.50s exit 2 100000 ${x:- around $(push) git-guard: blocked: git push (git push is run by the user by hand)
  0.44s exit 2 200000 evals then push git-guard: blocked: git push (git push is run by the user by hand)
  0.67s exit 2 200000 sudo then push udo sudo sudo sudo sudo git push (git push is run by the user by hand)
  1.18s exit 2 one megabyte echo x; then push git-guard: blocked: git push (git push is run by the user by hand)
  0.05s exit 0 one megabyte of one word 
  0.03s exit 0 brace explosion 
  3.24s exit 0 one megabyte of $( unclosed 
  1.48s exit 0 one megabyte of backticks 
```

The 2000-level case took 0.04 s (3.13) and 0.05 s (3.9), exit 2 with `git-guard: blocked: git push (git push is run by the user by hand)`. The one-megabyte case (`echo x; ` 131072 times, then the push) took 0.68 s and 1.18 s, exit 2. The reviewer's `refute-2g-deep.py`:

```
len 4357 exit 2 stderr last line: git-guard: blocked: git push (git push is run by the user by hand)
```

Fuzz, 60000 random command strings from a shell-token alphabet on each interpreter, any exception counted:

```
done 0 exceptions 2.0 s
done 0 exceptions 3.3 s
```

### Point 2, shells with -c and stdin

Old: the command string was the word after the first `-c` word.
New: `_shell_arguments` takes options through `_take_options` (every word starting with `-` or `+`, the values of `-o`, `+o`, `-O`, `+O`, `--rcfile`, `--init-file`, `--` skipped) and reads the first operand after all options as the command string when `-c` was among them. A shell with `-` or `-s` and no `-c` reads its script from stdin, so a here-string, a here-document or an `echo`/`printf` pipe is checked as the script, and the operand after `-` is then an argument, not a script.
Cases blocked: `bash -c -- 'git push'`, `bash -c -e 'git push'`, `sh -c -x 'git push'`, `bash -c -o errexit 'git push'`, `bash - <<< 'git push'`, `echo 'git push' | bash -`, `bash - x <<< 'git push'`, `bash -s x <<< 'git push'`; allowed: `bash x <<< 'git push'` (a script file named x, stdin unused).

### Point 3, ! aliases

Old: a `!` alias was checked as its text alone.
New: the text is followed by each remaining argument of the git command, each quoted with `_quote`, and the inline configuration of the outer git is carried into every git command the text runs. Alias expansion is a loop, so an alias to an alias is followed.
Cases blocked: `git -c 'alias.p=!git' p push`, `git -c 'alias.p=!git' p reset --hard`, `git -c 'alias.p=!git q' -c alias.q=push p` and the same with the two `-c` swapped.

### Point 4, inline configuration forms

Old: `-c` and `GIT_CONFIG_KEY_<n>`/`VALUE_<n>` with `GIT_CONFIG_COUNT`.
New: `_config_env` reads `--config-env=<key>=<var>` and `--config-env <key>=<var>` using a variable assigned in the same simple command; `_config_of` reads `GIT_CONFIG_PARAMETERS` as the `'key'='value'` pairs git writes. `--attr-source` takes a value in both spellings (in `_GIT_VALUED_OPTIONS`).
Cases blocked: `A=push git --config-env=alias.p=A p`, `A=push git --config-env alias.p=A p`, `GIT_CONFIG_PARAMETERS="'alias.p'='push'" git p`, `git --attr-source x push`.

### Point 5, clean.requireForce

Old: only the words `false`, `no` and `off` (any case) counted as false.
New: `_is_false` is true for those words, the empty string and any integer equal to zero (`0`, `00`, `-0`; digits checked with `str.isascii` so only ASCII digits count); an absent key is not false, `-c clean.requireForce` without `=` is true.
Cases blocked: `git -c clean.requireForce= clean -d`, `git -c clean.requireForce=00 clean -d`, `git -c clean.requireForce=-0 clean -d`; allowed: `git -c clean.requireForce clean -n`, `git -c clean.requireForce=true clean -d`.

### Point 6, forms the lexer did not read

Old to new, one line each; each has its blocked case and a near-miss allowed case in the test.
- `$((`: old, skipped to `))` as arithmetic; new, read as `$(` plus a subshell when the text does not close as arithmetic. Blocked `echo $((git push) )`; allowed `$((1 + 2))`.
- `function` and `coproc`: old, an ordinary command word; new, skipped like reserved words (`function f { git push; }; f`, `coproc git push`, `coproc NAME { git push; }` blocked).
- Brace expansion: old, none; new, `_expand_braces` expands unquoted comma lists before the command word is read (cap 256 words or 4096 characters, past which the word is left as is and named in the docstring). Blocked `{git,push}`, `git p{u,v}sh`, `git {push,x}`, `git {{push,y},x}`; allowed `gi{t,x} push` (which is `git gix push`).
- `$'...'`: old, quote only; new, `_unescape` decodes `\xHH`, `\NNN`, `\uHHHH`, `\UHHHHHHHH`, `\cX` and the single-letter escapes as bash does. Blocked `$'\x67it' push`, `git $'\x70ush'`, `$'\147it' push`, `git $'p\x75sh'`.
- Glob command word: old, exact name; new, `_is_git` matches the last path part against `git` as a pattern with `fnmatchcase` (a bad range such as `[z-a]` raises `re.error` on Python 3.9 and is caught). Blocked `/usr/bin/gi? push`, `g*t push`; allowed `[z-a] status`, `[ -f x ]`.
- printf and echo escapes: old, none; new, the printf format is decoded (`\t`, `\n`, `\xHH`, `\NNN`) and `echo -e` output is checked in both raw and decoded form before a piped shell reads it. Blocked `printf 'git\tpush' | bash`, `printf 'git\x20push' | sh`, `printf 'git\040push' | sh`, `echo -e 'git\x20push' | sh`, `echo 'git\x20push' | sh`.
- xargs: old, words after `xargs` only; new, `echo`/`printf` output piped into `xargs <command>` is appended to the command's words. Blocked `echo push | xargs git`, `printf 'push\n' | xargs git`.

### Point 7, wrappers

Old: env, command, builtin, exec, nohup, nice, time, timeout, sudo, xargs, eval, shells.
New: `stdbuf` (`-i`, `-o`, `-e` and long forms take a value, attached or separate), `doas` (`-u`, `-C`), `watch` (in `_TEXT_WRAPPERS` with eval: `-n` and `--interval` take a value, the command may be one string lexed as a command) and `find` with `-exec`, `-execdir`, `-ok`, `-okdir` up to `;` or `+` (`_find_todos`).
Cases blocked: `stdbuf -o0 git push`, `stdbuf -o L git push`, `stdbuf --output=L git push`, `stdbuf -i0 -o0 -e0 git push`, `doas git push`, `doas -u root git push`, `watch git push`, `watch -n 5 git push`, `watch -n5 -d git push`, `watch --interval 5 'git push'`, `watch 'git status; git push'`, `find . -exec git push \;`, `find . -name x -execdir git push {} +`, `find . -ok git push {} \;`, `find . -okdir git push \;`.

### Point 8, docstring

The docstring states exit statuses 0 and 2 only (no exception escapes: the fuzz above gave none, and the depth handling that gave exit 2 for a reason other than a blocked operation is gone). "Not seen" names: variables, positional parameters, `$@`, command words supplied by a substitution, aliases in configuration files, commands other programs run, output of commands other than `echo`/`printf` piped into a shell or `xargs`, brace expansions over 256 words or 4096 characters, escapes beyond what bash decodes, and syntax the lexer does not name. "Not blocked" is unchanged: checkout -f, switch --discard-changes, stash drop and clear, send-pack, subtree push. The claim of reading "as the POSIX shell and bash read it" is limited to the forms the docstring lists.

### Point 9, the report

The first run's path in the first-run section now reads `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//final/absent.py`, what python3 printed. The round-0 first run above is the run of the test as it stood before the round; this section's red runs are of the round-0 script against the round's test.

### Reruns, from the worktree root

Test under python3 (3.13.4), then with `/usr/bin/python3` first on PATH (3.9.6), verbatim:

```
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
rc=0
$ PATH=$TMPDIR/py39:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1   (python3 --version first)
Python 3.9.6
PASS: git_guard.py scratch tests
```

Red run of the round's test on the round-0 script (the fail-fast first line, then every distinct failing case, 61 in all, verbatim):

```
FAIL: block bash -c -- 'git push': expected exit 2, got 0: 
rc=1
block bash -c -- 'git push' => expected exit 2, got 0
block bash -c -e 'git push' => expected exit 2, got 0
block sh -c -x 'git push' => expected exit 2, got 0
block bash -c -o errexit 'git push' => expected exit 2, got 0
block bash - <<< 'git push' => expected exit 2, got 0
block echo 'git push' | bash - => expected exit 2, got 0
block bash - x <<< 'git push' => expected exit 2, got 0
block git -c 'alias.p=!git' p push => expected exit 2, got 0
block git -c 'alias.p=!git' p reset --hard => expected exit 2, got 0
block git -c 'alias.p=!git q' -c alias.q=push p => expected exit 2, got 0
block git -c alias.q=push -c 'alias.p=!git q' p => expected exit 2, got 0
block A=push git --config-env=alias.p=A p => expected exit 2, got 0
block A=push git --config-env alias.p=A p => expected exit 2, got 0
block GIT_CONFIG_PARAMETERS="'alias.p'='push'" git p => expected exit 2, got 0
block git --attr-source x push => expected exit 2, got 0
block git -c clean.requireForce= clean -d => expected exit 2, got 0
block git -c clean.requireForce=00 clean -d => expected exit 2, got 0
block git -c clean.requireForce=-0 clean -d => expected exit 2, got 0
block echo $((git push) ) => expected exit 2, got 0
block function f { git push; }; f => expected exit 2, got 0
block coproc git push => expected exit 2, got 0
block coproc NAME { git push; } => expected exit 2, got 0
block {git,push} => expected exit 2, got 0
block git p{u,v}sh => expected exit 2, got 0
block git {push,x} => expected exit 2, got 0
block git {{push,y},x} => expected exit 2, got 0
block $'\x67it' push => expected exit 2, got 0
block git $'\x70ush' => expected exit 2, got 0
block $'\147it' push => expected exit 2, got 0
block git $'p\x75sh' => expected exit 2, got 0
block /usr/bin/gi? push => expected exit 2, got 0
block g*t push => expected exit 2, got 0
block printf 'git\tpush' | bash => expected exit 2, got 0
block printf 'git\x20push' | sh => expected exit 2, got 0
block printf 'git\040push' | sh => expected exit 2, got 0
block echo -e 'git\x20push' | sh => expected exit 2, got 0
block echo 'git\x20push' | sh => expected exit 2, got 0
block echo push | xargs git => expected exit 2, got 0
block printf 'push\n' | xargs git => expected exit 2, got 0
block stdbuf -o0 git push => expected exit 2, got 0
block stdbuf -o L git push => expected exit 2, got 0
block stdbuf --output=L git push => expected exit 2, got 0
block stdbuf -i0 -o0 -e0 git push => expected exit 2, got 0
block doas git push => expected exit 2, got 0
block doas -u root git push => expected exit 2, got 0
block watch git push => expected exit 2, got 0
block watch -n 5 git push => expected exit 2, got 0
block watch -n5 -d git push => expected exit 2, got 0
block watch --interval 5 'git push' => expected exit 2, got 0
block watch 'git status; git push' => expected exit 2, got 0
block find . -exec git push \; => expected exit 2, got 0
block find . -name x -execdir git push {} + => expected exit 2, got 0
block find . -ok git push {} \; => expected exit 2, got 0
block find . -okdir git push \; => expected exit 2, got 0
echo $( x150 around git status => expected exit 0, got 2
${x:- x150 around x => expected exit 0, got 2
${x:- x150 around git push as text (echo prints it and runs nothing) => expected exit 0, got 2
$(( x150 around 1 => expected exit 0, got 2
echo $( x2000 around git status => expected exit 0, got 2
90 of ${x:- and $( eight times over around git push => expected exit 2, got 1
90 of ${x:- and $( eight times over around git status => expected exit 0, got 1
```

Red run per block and per new form of points 1 to 7: a scratch copy of the script with that form's handling removed (`mutate.py`, one replacement per copy, each asserted to match exactly once), the test run with `GIT_GUARD=<copy>`. The first `FAIL:` line of each, verbatim; all 27 are red:

```
alias_args: FAIL: block git -c 'alias.p=!git' p push: expected exit 2, got 0: 
alias_config: FAIL: block git -c 'alias.p=!git q' -c alias.q=push p: expected exit 2, got 0: 
ansi_escapes: FAIL: block $'\x67it' push: expected exit 2, got 0: 
attr_source: FAIL: block git --attr-source x push: expected exit 2, got 0: 
brace_expansion: FAIL: block {git,push}: expected exit 2, got 0: 
clean: FAIL: block git clean -f: expected exit 2, got 0: 
config_env: FAIL: block A=push git --config-env=alias.p=A p: expected exit 2, got 0: 
config_parameters: FAIL: block GIT_CONFIG_PARAMETERS="'alias.p'='push'" git p: expected exit 2, got 0: 
coproc: FAIL: block coproc git push: expected exit 2, got 0: 
coproc_name: FAIL: block coproc NAME { git push; }: expected exit 2, got 0: 
doas: FAIL: block doas git push: expected exit 2, got 0: 
echo_escapes: FAIL: block echo -e 'git\x20push' | sh: expected exit 2, got 0: 
find_exec: FAIL: block find . -exec git push \;: expected exit 2, got 0: 
function: FAIL: block function f { git push; }; f: expected exit 2, got 0: 
glob_command: FAIL: block /usr/bin/gi? push: expected exit 2, got 0: 
printf_escapes: FAIL: block printf 'git push\n' | bash: expected exit 2, got 0: 
push: FAIL: block git push: expected exit 2, got 0: 
require_force_empty: FAIL: block git -c clean.requireForce= clean -d: expected exit 2, got 0: 
require_force_integer: FAIL: block git -c clean.requireForce=00 clean -d: expected exit 2, got 0: 
reset: FAIL: block git reset --hard: expected exit 2, got 0: 
sh_c_operand: FAIL: block bash -c -- 'git push': expected exit 2, got 0: 
sh_stdin_dash: FAIL: block bash - x <<< 'git push': expected exit 2, got 0: 
stdbuf: FAIL: block stdbuf -o0 git push: expected exit 2, got 0: 
subshell_arith: FAIL: block echo $((git push) ): expected exit 2, got 0: 
tree: FAIL: block git checkout .: expected exit 2, got 0: 
watch: FAIL: block watch git push: expected exit 2, got 0: 
xargs_pipe: FAIL: block echo push | xargs git: expected exit 2, got 0: 
```

What each copy removes: push, reset, clean: the rule from `_CHECKS`; tree: the checkout and restore rules; sh_c_operand: the option-skipping rule of point 2 (first word after `-c`); sh_stdin_dash: the reading of `-` as stdin; alias_args: the arguments after a `!` alias; alias_config: the carrying of inline configuration into an alias text; config_env, config_parameters, attr_source: the three forms of point 4; require_force_empty, require_force_integer: the empty string and the integer readings; subshell_arith: the `$((` subshell reading; function, coproc, coproc_name: the keywords; brace_expansion, ansi_escapes, glob_command, printf_escapes, echo_escapes, xargs_pipe: the six forms of point 6; stdbuf, doas, watch, find_exec: the wrappers of point 7. The depth cases of point 1 are red on the round-0 script (the last seven lines of the label list above); a removal copy of the stack is not possible because the round-0 lexer is the recursive one.

Ruff, ASCII, verify list, verbatim:

```
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
$ ruff format --check --line-length 100 --target-version py39 skills/repo-setup/templates/hooks/git_guard.py
All checks passed!
rc=0
1 file already formatted
rc=0
$ LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.py skills/repo-setup/templates/hooks/git_guard.test.sh
grep rc=1 (1 means no match)
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
```

Not verified in this round: the hook installed and called by Claude Code (step 2 does that). Nothing outside the worktree and `$TMPDIR` was written.
