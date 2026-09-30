Everything in the brief is done.

## Open items of 2.G's state file (verbatim)

- Git aliases (2026-09-30, step 1): a git alias defined in a configuration file (`git config alias.p push`, then `git p`) runs a blocked operation under another name, and the guard does not see it; an alias given inline in the command (`git -c alias.p=push p`, `GIT_CONFIG_KEY_0=alias.p`) is resolved by step 1 without running git. Options: (a) the guard resolves an unknown subcommand with `git config --get alias.<name>` in the command's directory and checks the expansion (a `!` alias as a shell command); pros: every alias is covered; cons: the script runs git on each call that uses an unknown subcommand, a computation beyond the approved one that needs your approval. (b) Configuration-file aliases stay outside the guard, and the docstring and the offer say so; pros: nothing runs; cons: such an alias gets through. Recommendation (a). The lazy option is (b). Step 1 is built without it; a yes adds it as a step by your ruling.
- Other commands that discard work (2026-09-30, step 1): `git checkout -f <branch>`, `git switch --discard-changes`, `git stash drop` and `git stash clear` discard work, and `git send-pack` and `git subtree push` push, by commands the approved list of five does not name, so the guard lets them through (the brief check's "Declined to judge"). Options: (a) a step adds them to the guard's blocks; pros: the guard covers what the five cover in effect; cons: widens the approved list, and `git checkout -f <branch>` is a form the plan skills may need. (b) The docstring and the offer name them as not blocked. Recommendation (a) for `send-pack`, `subtree push`, `stash drop`, `stash clear` and `switch --discard-changes`, with `checkout -f` left allowed after a grep of the skills. The lazy option is (b). Step 1 is built with the five only; a yes adds a step by your ruling.

## The cases' first run, on the unchanged tree (no script beside the test)

The test was written first, before git_guard.py existed. Fail-fast form, quoted verbatim:

```
FAIL: block git push: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//final/absent.py': [Errno 2] No such file or directory
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
| push in every form and position | block git push; block cd x && git push; block echo $(git push); block bash -c "cd x && git push"; block git -c alias.p=push p | `FAIL: block git push: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//final` |
| reset --hard and its unique prefixes | block git reset --hard; block git reset --ha | `FAIL: block git reset --hard: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDI` |
| clean --force in each spelling, and clean.requireForce=false | block git clean -f; block git clean --forc; block git -c clean.requireForce=false clean -d | `FAIL: block git clean -f: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//f` |
| checkout and restore of the whole tree, exclude-only sets, the index-only exemption | block git checkout .; block git restore -- ':^a.md' ':(exclude)b.md'; allow git restore --staged . | `FAIL: block git checkout .: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR/` |
| the plan skills' own commands pass | allow git branch -D 2e-12a; allow git worktree remove --force ...; allow git restore -- a.md b.md; allow git checkout --theirs -- a.bin | `FAIL: allow git branch -D 2e-12a: expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//final/absent.py': [E` |
| text that only names a blocked command passes | allow echo "git push"; allow echo '$(git push)'; allow git commit -m "do not git push ..." | `FAIL: allow echo "git push": expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//final/absent.py': [Errno ` |
| input the guard cannot read passes; other tools are guarded | allow not json; block the Monitor tool; block a byte that is not UTF-8 around git push | `FAIL: not json: expected exit 0, got 2: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '$TMPDIR//final/absent.py': [Errno 2] No such fi` |
| a command too deeply nested to read is blocked, not crashed | block a command nested 150 levels deep | `FAIL: a command nested 150 levels deep: stderr does not start with [git-guard: blocked: ]: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open fi` |

## Files

New: `skills/repo-setup/templates/hooks/git_guard.py` (880 lines) and `skills/repo-setup/templates/hooks/git_guard.test.sh` (304 lines), whole at the end of this report. Changed: `docs/dev/building.md` (one line added) and `docs/dev/change-standard.md` (one line added).

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
- A command with more than 100 levels of nested substitutions, parameter expansions or arithmetic exits 2 with a line naming that reason, in place of a Python recursion error (exit 1, which Claude Code treats as non-blocking). Decision 4 covers input the script cannot read and a command the shell would refuse; a deeply nested valid command is neither. Cases: 150 levels of `$(`, of `${` and of `$((` block; 20 levels of `$(` pass.
- The brief's "stdin holding a byte that is not UTF-8 around `git push`" does not say where the byte sits. The test puts it inside the command string, as `echo <byte>; git push; echo <byte>`, with `git status` for the allowed twin: a byte glued to `git` makes a different word, and a byte outside the JSON makes the input not JSON, which the brief allows.
- `printf 'git push\n' | bash` is tested with the two characters backslash and n (the printf reading the brief names) and, as a second case, with a real newline. For a printf whose format holds `%`, its arguments are also checked as command texts, so `printf '%s\n' 'git push' | sh` blocks.
- Long spellings of the wrappers' value options (`--user`, `--max-args`, `--signal` and similar) are skipped with their values, besides the short ones the brief lists.
- A command word is matched by the last part of its path for the wrappers as well as for git, so `/usr/bin/env git push` and `./git push` are checked.
- A whole-tree pathspec is judged by its pieces: the components `.` and empty are dropped, leading `..` components are dropped, and the pathspec is whole-tree when what is left is empty, `*` or `**`. That covers the brief's list and also `./*`, `../*` and `../..`.
- The rule text of each block: push `git push is run by the user by hand`; reset `git reset --hard discards work and is run by the user by hand`; clean `git clean deletes untracked files without asking and is run by the user by hand`; checkout and restore `git <name> with a whole-tree pathspec discards work and is run by the user by hand`. The brief says only that the rule names the operation and says the user runs it by hand.
- The script is one file of 880 lines, since step 2 copies a single file into a repository.

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

The command is read as the POSIX shell and bash read it, with a lexer written in this file: it
splits the text into simple commands on newlines and the operators ; & && || | |& ( ) and looks
inside command substitutions ($( ) and backticks), process substitutions, $( ) inside double
quotes, here-documents, here-strings, `sh -c` strings, `eval`, `env -S` and the wrappers env,
command, builtin, exec, nohup, nice, time, timeout, sudo and xargs. Each simple command whose
command word is git is checked, after git's global options (-C, -c, --git-dir, --work-tree and the
others) and after an alias given inline (-c alias.<name>=..., GIT_CONFIG_KEY_<n> with
GIT_CONFIG_VALUE_<n>).

Blocked, because the user runs these by hand (they publish work or destroy it):
- git push, with any arguments, --dry-run included.
- git reset with --hard, or a long option that is a unique prefix of it (--ha and longer).
- git clean with --force (or a prefix from --fo), with a short-option word holding f (-f, -fd,
  -xdf), or with the configuration clean.requireForce=false and no -n or --dry-run.
- git checkout or git restore with a whole-tree pathspec among its arguments: ., ./, ./., *, **,
  .., ../, :/, :/., :/*, :(top), :(top)., a glob pathspec of * or **, or a set of pathspecs that
  are all excludes (:!x, :^x, :(exclude)x). git restore that restores only the index (--staged
  or -S without --worktree or -W) discards no work and is allowed.

Allowed, so the plan skills' own commands run: everything else, among it git branch -D, git
worktree remove, git restore -- <paths>, git restore --staged --worktree -- <paths>, git checkout
--theirs -- <path>, git checkout <branch>, git checkout -b, git reset --soft, git clean -n, git log,
git diff -- . and text that only names a blocked command, such as echo "git push" or a commit
message. A command the shell would refuse (an unbalanced quote) is allowed, and the words read
before the fault are still checked.

Not seen: a command another program runs (a script, make, python3 -c), a git alias defined in a
configuration file, a command word or option held in a variable ($g push), and the output of a
command piped into a shell other than the arguments of echo and printf.

Not blocked, because they are not among the five operations above: git checkout -f <branch>,
git switch --discard-changes, git stash drop, git stash clear, git send-pack and git subtree push.

Output and exit status. Exit 0 lets the command run and prints nothing. Exit 2 blocks it and prints
one line on stderr, which Claude Code gives to the agent:
    git-guard: blocked: <the simple command, its words joined by spaces> (<the rule>)
The first blocked simple command decides. A command with more than 100 levels of expansions or
substitutions inside one another cannot be read and exits 2 with the same line form, naming that
reason. The script
prints nothing else and reads nothing but stdin.
"""

from __future__ import annotations

import json
import re
import sys
from dataclasses import dataclass, field

_MAX_NESTING = 100

_PLAIN = re.compile(r"[^ \t\n\\'\"$`;&|()<>]+")
_DOUBLE_QUOTED = re.compile(r'[^"\\$`]+|"')
_ASSIGNMENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*=")
_CONFIG_KEY = re.compile(r"GIT_CONFIG_KEY_([0-9]{1,6})\Z")
_ECHO_FLAGS = re.compile(r"-[neE]+\Z")
_DESCRIPTOR = re.compile(r"[0-9]+\Z")

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

_GIT_VALUED_OPTIONS = frozenset(
    {"-C", "--git-dir", "--work-tree", "--namespace", "--config-env", "--super-prefix"}
)
_CHECKOUT_VALUED = frozenset({"-b", "-B", "--orphan", "--conflict", "--pathspec-from-file"})
_RESTORE_VALUED = frozenset({"-s", "--source", "--conflict", "--pathspec-from-file"})

_FALSE_VALUES = frozenset({"false", "no", "off", "0"})

_PUSH_RULE = "git push is run by the user by hand"
_RESET_RULE = "git reset --hard discards work and is run by the user by hand"
_CLEAN_RULE = "git clean deletes untracked files without asking and is run by the user by hand"
_TREE_RULE = "git {} with a whole-tree pathspec discards work and is run by the user by hand"


class _TooDeepError(Exception):
    """A command nests substitutions deeper than the lexer reads."""


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


class _Lexer:
    """Reads shell text into its simple commands; a nested text gets a lexer of its own."""

    def __init__(self, text: str, start: int = 0, depth: int = 0, nested: bool = False) -> None:
        self.text = text
        self.pos = start
        self.depth = depth
        self.nested = nested  # ends at the parenthesis that closes a $( ) or <( ) text
        self.commands: list[_Simple] = []
        self.current = _Simple()
        self.parts: list[str] = []
        self.in_word = False
        self.quoted = False
        self.redirect = ""
        self.heredocs: list[_Heredoc] = []
        self.parens = 0
        self.cases = 0
        self.expanding = 0  # the expansions being read inside one another
        self.closed = False
        self.unbalanced = False

    def run(self) -> list[_Simple]:
        text = self.text
        while self.pos < len(text) and not (self.closed or self.unbalanced):
            char = text[self.pos]
            if char in " \t":
                self._end_word()
                self.pos += 1
            elif char == "\n":
                self._newline()
            elif char == "\\":
                self._backslash()
            elif char == "'":
                self._single_quoted()
            elif char == '"':
                self._double_quoted()
            elif char == "$":
                self._dollar(in_double=False)
            elif char == "`":
                self._backtick(in_double=False)
            elif char == "#" and not self.in_word:
                self._comment()
            elif char in ";&|()<>":
                self._operator()
            else:
                self._plain()
        self._end_command()
        return self.commands

    def _add(self, text: str, quoted: bool = False) -> None:
        self.parts.append(text)
        self.in_word = True
        self.quoted = self.quoted or quoted

    def _plain(self) -> None:
        match = _PLAIN.match(self.text, self.pos)
        assert match is not None  # run() sends every character _PLAIN excludes elsewhere
        self._add(match.group())
        self.pos = match.end()

    def _comment(self) -> None:
        end = self.text.find("\n", self.pos)
        self.pos = len(self.text) if end < 0 else end

    def _backslash(self) -> None:
        following = self.text[self.pos + 1 : self.pos + 2]
        if following == "\n":
            self.pos += 2
        elif following:
            self._add(following, quoted=True)
            self.pos += 2
        else:
            self._add("\\")
            self.pos += 1

    def _single_quoted(self) -> None:
        end = self.text.find("'", self.pos + 1)
        if end < 0:
            self._add(self.text[self.pos + 1 :], quoted=True)
            self.pos = len(self.text)
            self.unbalanced = True
        else:
            self._add(self.text[self.pos + 1 : end], quoted=True)
            self.pos = end + 1

    def _double_quoted(self) -> None:
        self.pos += 1
        self._add("", quoted=True)
        if not self._double_body(closing_quote=True):
            self.unbalanced = True

    def _double_body(self, closing_quote: bool) -> bool:
        """Reads double-quoted text; returns whether it ended where it should.

        A here-document body has no closing quote, so it ends with the text.
        """
        text = self.text
        while self.pos < len(text) and not self.unbalanced:
            char = text[self.pos]
            if char == '"' and closing_quote:
                self.pos += 1
                return True
            if char == "\\":
                following = text[self.pos + 1 : self.pos + 2]
                if following == "\n":
                    self.pos += 2
                elif following and following in '"\\$`':
                    self._add(following, quoted=True)
                    self.pos += 2
                else:
                    self._add("\\", quoted=True)
                    self.pos += 1
            elif char == "$":
                self._dollar(in_double=True)
            elif char == "`":
                self._backtick(in_double=True)
            else:
                match = _DOUBLE_QUOTED.match(text, self.pos)
                assert match is not None  # the branches above take every character it excludes
                self._add(match.group(), quoted=True)
                self.pos = match.end()
        return not closing_quote and not self.unbalanced

    def _dollar(self, in_double: bool) -> None:
        self.expanding += 1
        if self.expanding > _MAX_NESTING:
            raise _TooDeepError
        text = self.text
        if text.startswith("$((", self.pos):
            self._arithmetic()
        elif text.startswith("$(", self.pos):
            self._substitution(self.pos + 2, "$(...)", quoted=in_double)
        elif text.startswith("${", self.pos):
            self._braced()
        elif text.startswith("$'", self.pos) and not in_double:
            self._ansi_quoted()
        else:
            self._add("$", quoted=in_double)
            self.pos += 1
        self.expanding -= 1

    def _substitution(self, start: int, placeholder: str, quoted: bool) -> None:
        """Lexes the text from `start` up to the parenthesis that closes it."""
        if self.depth >= _MAX_NESTING:
            raise _TooDeepError
        inner = _Lexer(self.text, start, self.depth + 1, nested=True)
        self.commands.extend(inner.run())
        self.pos = inner.pos
        self._add(placeholder, quoted=quoted)
        if not inner.closed:
            self.unbalanced = True

    def _arithmetic(self) -> None:
        """Skips $(( )), whose text is arithmetic; a substitution inside it still runs."""
        text = self.text
        self.pos += 3
        level = 2
        while self.pos < len(text) and not self.unbalanced:
            char = text[self.pos]
            if char == "(":
                level += 1
                self.pos += 1
            elif char == ")":
                level -= 1
                self.pos += 1
                if level == 0:
                    self._add("$((...))")
                    return
            elif char == "$":
                self._dollar(in_double=True)
            elif char == "`":
                self._backtick(in_double=True)
            else:
                self.pos += 1
        self.unbalanced = True

    def _braced(self) -> None:
        """Skips ${ }, whose text is a parameter expansion; a substitution inside it still runs."""
        text = self.text
        self.pos += 2
        level = 1
        while self.pos < len(text) and not self.unbalanced:
            char = text[self.pos]
            if char == "{":
                level += 1
                self.pos += 1
            elif char == "}":
                level -= 1
                self.pos += 1
                if level == 0:
                    self._add("${...}")
                    return
            elif char == "\\":
                self.pos += 2
            elif char == "'":
                end = text.find("'", self.pos + 1)
                if end < 0:
                    break
                self.pos = end + 1
            elif char == '"':
                self.pos += 1
                if not self._double_body(closing_quote=True):
                    break
            elif char == "$":
                self._dollar(in_double=True)
            elif char == "`":
                self._backtick(in_double=True)
            else:
                self.pos += 1
        self.unbalanced = True

    def _ansi_quoted(self) -> None:
        """Reads $'...', in which a backslash escapes the next character."""
        text = self.text
        self.pos += 2
        chars: list[str] = []
        while self.pos < len(text):
            char = text[self.pos]
            if char == "\\" and self.pos + 1 < len(text):
                following = text[self.pos + 1]
                chars.append({"n": "\n", "t": "\t"}.get(following, following))
                self.pos += 2
            elif char == "'":
                self.pos += 1
                self._add("".join(chars), quoted=True)
                return
            else:
                chars.append(char)
                self.pos += 1
        self._add("".join(chars), quoted=True)
        self.unbalanced = True

    def _backtick(self, in_double: bool) -> None:
        """Lexes a backtick substitution, in which a backslash escapes \\, ` and $."""
        if self.depth >= _MAX_NESTING:
            raise _TooDeepError
        text = self.text
        pos = self.pos + 1
        chars: list[str] = []
        while pos < len(text) and text[pos] != "`":
            if text[pos] == "\\" and text[pos + 1 : pos + 2] in ("\\", "`", "$"):
                chars.append(text[pos + 1])
                pos += 2
            else:
                chars.append(text[pos])
                pos += 1
        inner = _Lexer("".join(chars), depth=self.depth + 1)
        self.commands.extend(inner.run())
        self._add("`...`", quoted=in_double)
        self.pos = pos + 1
        if pos >= len(text) or inner.unbalanced:
            self.unbalanced = True

    def _operator(self) -> None:
        operator = next(op for op in _OPERATORS if self.text.startswith(op, self.pos))
        if operator in ("<(", ">("):
            self._substitution(self.pos + 2, operator + "...)", quoted=False)
        elif operator in _REDIRECTIONS:
            self._redirection(operator)
        elif operator == "(":
            self._end_command()
            self.parens += 1
            self.pos += 1
        elif operator == ")":
            self._close_paren()
        else:
            self._end_command(pipe=operator in _PIPES)
            self.pos += len(operator)

    def _redirection(self, operator: str) -> None:
        if self.in_word and not self.quoted and _DESCRIPTOR.match("".join(self.parts)):
            self.parts = []  # a file descriptor number, not a word
            self.in_word = False
        self._end_word()
        self.redirect = operator
        self.pos += len(operator)

    def _close_paren(self) -> None:
        self.pos += 1
        if self.parens > 0:
            self.parens -= 1
            self._end_command()
        elif self.cases > 0:
            self._end_word()
            self.current = _Simple()  # a case pattern, not a command
        elif self.nested:
            self._end_command()
            self.closed = True
        else:
            self._end_command()

    def _newline(self) -> None:
        self._end_command()
        self.pos += 1
        self._read_heredocs()

    def _read_heredocs(self) -> None:
        text = self.text
        for heredoc in self.heredocs:
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
                self._body_expansions(body)
        self.heredocs = []

    def _body_expansions(self, body: str) -> None:
        """Finds the substitutions an unquoted here-document body has the shell run."""
        if self.depth >= _MAX_NESTING:
            raise _TooDeepError
        inner = _Lexer(body, depth=self.depth + 1)
        inner._double_body(closing_quote=False)
        self.commands.extend(inner.commands)

    def _end_word(self) -> None:
        if not self.in_word:
            return
        word = "".join(self.parts)
        quoted = self.quoted
        self.parts = []
        self.in_word = False
        self.quoted = False
        if not self.redirect:
            self._add_word(word, quoted)
            return
        operator = self.redirect
        self.redirect = ""
        if operator in ("<<", "<<-"):
            self.heredocs.append(_Heredoc(word, operator == "<<-", quoted, self.current))
        elif operator == "<<<":
            self.current.bodies.append(word)

    def _add_word(self, word: str, quoted: bool) -> None:
        current = self.current
        if not current.words and not quoted:
            if word == "esac":
                self.cases = max(0, self.cases - 1)
                return
            if word in _COMPOUND_WORDS:
                return
            if word in _LIST_HEADS:
                current.discard = True  # the words after `for NAME in` are a list, not a command
            elif word == "case":
                current.discard = True
                self.cases += 1
        current.words.append(word)

    def _end_command(self, pipe: bool = False) -> None:
        self._end_word()
        current = self.current
        emitted = current if current.words and not current.discard else None
        if emitted is not None:
            self.commands.append(emitted)
        self.redirect = ""
        self.current = _Simple(pipe_from=emitted if pipe else None)


def _basename(word: str) -> str:
    return word.rsplit("/", 1)[-1]


def _line(shown: list[str], rule: str) -> str:
    command = " ".join(" ".join(shown).split())
    return f"git-guard: blocked: {command} ({rule})"


def _check_text(text: str) -> str | None:
    """The line for the first blocked simple command of `text`, or None."""
    for command in _Lexer(text).run():
        found = _check_simple(command)
        if found is not None:
            return found
    return None


def _check_simple(command: _Simple) -> str | None:
    env: dict[str, str] = {}
    words = command.words
    while True:
        while words and _ASSIGNMENT.match(words[0]):
            variable, _, value = words[0].partition("=")
            env[variable] = value
            words = words[1:]
        if not words:
            return None
        name = _basename(words[0])
        rest = words[1:]
        if name == "git":
            return _check_git(command.words, rest, _config_of(env), frozenset())
        if name == "eval":
            return _check_text(" ".join(rest))
        if name in _SHELLS:
            return _check_shell(command, rest)
        if name not in _WRAPPERS:
            return None
        valued, positionals = _WRAPPERS[name]
        options, rest = _take_options(rest, valued)
        if name == "env":
            for option, value in options:
                if option in ("-S", "--split-string"):
                    found = _check_text(value)
                    if found is not None:
                        return found
        words = rest[positionals:]


def _take_options(
    words: list[str], valued: frozenset[str]
) -> tuple[list[tuple[str, str]], list[str]]:
    """Splits leading options, each with its value, from the words after them."""
    options: list[tuple[str, str]] = []
    index = 0
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
    return options, words[index:]


def _shell_arguments(words: list[str]) -> tuple[str | None, bool]:
    """The -c string of a shell's arguments, and whether the shell reads a script from stdin."""
    index = 0
    reads_stdin = False
    while index < len(words):
        word = words[index]
        if word == "--":
            index += 1
            break
        if len(word) < 2 or word[0] not in "-+":
            break
        if word in _SHELL_VALUED:
            index += 2
            continue
        if word[0] == "-" and word[1] != "-":
            if "c" in word[1:]:
                return (words[index + 1] if index + 1 < len(words) else ""), False
            reads_stdin = reads_stdin or "s" in word[1:]
        index += 1
    return None, reads_stdin or index >= len(words)


def _check_shell(command: _Simple, arguments: list[str]) -> str | None:
    script, reads_stdin = _shell_arguments(arguments)
    if script is not None:
        return _check_text(script)
    if not reads_stdin:
        return None
    texts = list(command.bodies)
    if command.pipe_from is not None:
        texts.extend(_piped_texts(command.pipe_from))
    for text in texts:
        found = _check_text(text)
        if found is not None:
            return found
    return None


def _piped_texts(source: _Simple) -> list[str]:
    """What an echo or printf command writes into a pipe, as command texts."""
    if not source.words:
        return []
    arguments = source.words[1:]
    name = _basename(source.words[0])
    if name == "echo":
        while arguments and _ECHO_FLAGS.match(arguments[0]):
            arguments = arguments[1:]
        return [" ".join(arguments)]
    if name == "printf" and arguments:
        texts = [arguments[0].replace("\\n", "\n")]
        if "%" in arguments[0]:
            texts.extend(arguments[1:])
        return texts
    return []


def _config_of(env: dict[str, str]) -> dict[str, str]:
    """The git configuration the GIT_CONFIG_COUNT, _KEY_<n> and _VALUE_<n> variables give."""
    config: dict[str, str] = {}
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
    shown: list[str], arguments: list[str], config: dict[str, str], seen: frozenset[str]
) -> str | None:
    """The line for a blocked git command, given the words after `git` and the configuration."""
    config = dict(config)
    index = 0
    while index < len(arguments) and arguments[index].startswith("-"):
        option = arguments[index]
        if option == "-c" and index + 1 < len(arguments):
            key, has_value, value = arguments[index + 1].partition("=")
            config[key.lower()] = value if has_value else "true"
            index += 2
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
    return _check_alias(shown, subcommand, rest, config, seen)


def _check_alias(
    shown: list[str], name: str, rest: list[str], config: dict[str, str], seen: frozenset[str]
) -> str | None:
    expansion = config.get("alias." + name.lower())
    if expansion is None or name.lower() in seen:
        return None
    if expansion.startswith("!"):
        return _check_text(expansion[1:])
    words = [word for command in _Lexer(expansion).run() for word in command.words]
    return _check_git(shown, words + rest, config, seen | {name.lower()})


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
    if config.get("clean.requireforce", "").lower() in _FALSE_VALUES and not dry_run:
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
    try:
        line = _check_text(command)
    except _TooDeepError:
        line = (
            "git-guard: blocked: a command nested deeper than "
            f"{_MAX_NESTING} levels (it cannot be read; the user runs it by hand)"
        )
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
# Blocked, push: git push with arguments, --force and --dry-run; behind -C, -c, --git-dir (both spellings) and --no-pager; through an absolute path, a backslash and quotes; behind an environment assignment, env (with -u), command -p, nohup, nice -n, time -p, timeout (with -s), sudo (with -u), xargs (with -I{}, -n and a redirection), eval (bare and quoted) and exec; after cd &&, ;, ||, &, a newline and a line continuation; in a subshell (also written with the operators run together), braces, after !, in if, for, while and case; in $( ), "$( )", backticks, "` `", A=$( ), <( ) and nested $( ); in sh -c, bash -c, bash -lc, sh -ec and env -S; in a here-document, a here-string, an echo pipe and a printf pipe (the format with \n as typed and as a newline) into a shell; after a redirection of file descriptors and a pipe; through an alias given as -c alias.<name>=, as a ! alias and as GIT_CONFIG_KEY_<n> with GIT_CONFIG_VALUE_<n>.
# Blocked, reset, clean, checkout and restore: reset --hard in each position, behind -C and as the prefixes --har and --ha; clean with -f in each combined flag, --force and its prefix --forc, -fn and -c clean.requireForce=false; checkout and restore with . ./ .. :/ * ** :(glob)** :(top) and exclude-only pathspec sets, with and without --, after -p, -s, --source= and revisions, and beside another path.
# Allowed: git branch -D, git worktree remove, git restore -- paths, git restore --staged --worktree -- paths, git restore --staged . and -S ., git checkout --theirs -- path, git checkout of a branch, -b, ./a, -- ../x.md and an exclude beside a path, -c core.excludesFile=f, git apply, git reset --soft, --help and HEAD -- path, git clean -n and -nd, git status, log, diff -- ., add -- ., stash list and an alias to status; text that names git push inside echo, in single quotes, in a commit message, in grep, in a here-document not fed to a shell, in for-list words and in a case pattern; $((1 + 2)); a comment; ${x} without a command; a command with no git, an empty command, and a command the shell would refuse.
# Inputs: not JSON, a JSON array, empty stdin, a byte that is not UTF-8 around git status (allowed) and around git push (blocked), a Read tool input, a tool_input without command, a command that is not a string and a tool_input that is a string are allowed; the Monitor tool, an input with no tool_name and a command of one megabyte of "echo x; " before git push are blocked; a command nested deeper than the guard reads (substitutions, parameter expansions or arithmetic, 150 levels) is blocked and one nested 20 levels deep is allowed.
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

python3 -c 'import json; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo $(" * 150 + "git status" + ")" * 150}}))' >"$input" ||
    fail "could not build the deeply nested input"
check_input block "a command nested 150 levels deep"
python3 -c 'import json; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo $(" * 20 + "git status" + ")" * 20}}))' >"$input" ||
    fail "could not build the nested input"
check_input allow "a command nested 20 levels deep"
python3 -c 'import json; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo " + "${" * 150 + "x" + "}" * 150}}))' >"$input" ||
    fail "could not build the nested parameter expansion"
check_input block "a parameter expansion nested 150 levels deep"
python3 -c 'import json; print(json.dumps({"tool_name": "Bash", "tool_input": {"command": "echo " + "$((" * 150 + "1" + "))" * 150}}))' >"$input" ||
    fail "could not build the nested arithmetic"
check_input block "an arithmetic expansion nested 150 levels deep"

printf 'PASS: git_guard.py scratch tests\n'
```

