Everything in the brief is done.

## Open items of the state file

From `.scratch/2-g-git-guard/orchestrator-state.md`, the section "Open items":

none

## The cases' first run

Every case was run first on the unchanged tree (base 2bd2282) and before any change. The runs used a copy of the unchanged guard through `GIT_GUARD` and the final test with a CHECK line printed before each assertion and with `fail` returning instead of exiting, so that every assertion gives its own result. In that run 536 assertions were made, 111 fail and 425 hold. The plain run of the final test on the unchanged guard stops at its first failure: `FAIL: block git send-pack origin main: expected exit 2, got 0:`.

Rulings of the orchestrator that the first run led to:

- A21, the rule of the brief (Section 1): a `cd` whose word is not a literal (a variable, a substitution, `cd -`) leaves the directory unknown, and the lookups after it run from the directory before that `cd`. The case `cd <repo>; cd - && git p`, with `out` as `cwd`, is allowed. Result: the rule runs the lookup of `git p` from `<repo>`, where `alias.p = push` is defined, so the guard blocks it, and the case and the rule disagree. Ruling, option (b): a literal `cd` records the directory it left; a later `cd -` in the same scope returns to it, as the shell does; a `cd -` with no recorded directory and a non-literal `cd` leave the directory unknown, and later lookups run from the directory before that `cd`; the docstring's "Not seen" names both forms; the case stays allowed. Option (a), changing the case to blocked, was the lazy option. The guard and the test do this; the test cases are in the table below (rows A21 and A21 (more)).
- A33, the rule: the alias value holds byte `\377` before `push`. Result: with the byte glued to `push`, as `push\377`, git refuses the alias ("'push<U+FFFD>' is not a git command"), so the case could not be blocked. Ruling, option (a): the value is `alias.b = "push \377"` (written with `printf`), blocked with no traceback; `push\377` (no space) is kept as an allowed case with no traceback. Both values were checked by the orchestrator on git 2.49.0. Option (c), dropping the item, was the lazy option.
- P2: the grep prints the docstring's line, the test's head comment and B5's cases; "no skill" means no skill text other than the guard and its test runs `git checkout -f`. Every hit is quoted below with its file.
- A13: `git Status` stays blocked; the docstring says why (git refuses it on a case-insensitive file system and runs the alias on a case-sensitive one). On this macOS file system real git prints `fatal: cannot handle Status as a builtin`.
- The controls of the test (an alias to push beside each allowed alias case, named "ctl", "control" or "(control)" in the table) are kept; each is a control, not a case of the brief.

The table has one row per assertion. The column "Result on the unchanged tree" is FAIL for a behaviour the change adds or changes, with the first failing line as printed, and "holds" for a behaviour the change preserves. Scratch paths are shown as `<scratch>`.

The existing cases of the test (the list cases, the line cases, the input cases and the depth cases): 365 assertions, all hold on the unchanged tree.

| Case | Assertion (kind, command) | Result on the unchanged tree | First failing line |
|---|---|---|---|
| B1 | `` block block git send-pack origin main `` | FAIL | `` FAIL: block git send-pack origin main: expected exit 2, got 0:  `` |
| B1 | `` block block git send-pack `` | FAIL | `` FAIL: block git send-pack: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree push --prefix=x origin main `` | FAIL | `` FAIL: block git subtree push --prefix=x origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree -P x push origin main `` | FAIL | `` FAIL: block git subtree -P x push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --prefix x push origin main `` | FAIL | `` FAIL: block git subtree --prefix x push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --pref x push origin main `` | FAIL | `` FAIL: block git subtree --pref x push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --mess m push origin main `` | FAIL | `` FAIL: block git subtree --mess m push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --bra b push origin main `` | FAIL | `` FAIL: block git subtree --bra b push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --ont o push origin main `` | FAIL | `` FAIL: block git subtree --ont o push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --ann a push origin main `` | FAIL | `` FAIL: block git subtree --ann a push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree -m m push origin main `` | FAIL | `` FAIL: block git subtree -m m push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree -b b push origin main `` | FAIL | `` FAIL: block git subtree -b b push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --onto o push origin main `` | FAIL | `` FAIL: block git subtree --onto o push origin main: expected exit 2, got 0:  `` |
| B2 | `` block block git subtree --message=m push origin main `` | FAIL | `` FAIL: block git subtree --message=m push origin main: expected exit 2, got 0:  `` |
| B2 | `` allow allow git subtree split -P push `` | holds | |
| B2 | `` allow allow git subtree pull --prefix=x origin main `` | holds | |
| B2 | `` allow allow git subtree add -P x origin main `` | holds | |
| B2 | `` allow allow git subtree -P push split `` | holds | |
| B3 | `` block block git stash drop `` | FAIL | `` FAIL: block git stash drop: expected exit 2, got 0:  `` |
| B3 | `` block block git stash drop stash@{1} `` | FAIL | `` FAIL: block git stash drop stash@{1}: expected exit 2, got 0:  `` |
| B3 | `` block block git stash drop -q `` | FAIL | `` FAIL: block git stash drop -q: expected exit 2, got 0:  `` |
| B3 | `` block block git stash clear `` | FAIL | `` FAIL: block git stash clear: expected exit 2, got 0:  `` |
| B3 | `` allow allow git stash `` | holds | |
| B3 | `` allow allow git stash list `` | holds | |
| B3 | `` allow allow git stash pop `` | holds | |
| B3 | `` allow allow git stash push -m drop `` | holds | |
| B3 | `` allow allow git stash show drop `` | holds | |
| B4 | `` block block git switch --discard-changes main `` | FAIL | `` FAIL: block git switch --discard-changes main: expected exit 2, got 0:  `` |
| B4 | `` block block git switch --discard main `` | FAIL | `` FAIL: block git switch --discard main: expected exit 2, got 0:  `` |
| B4 | `` block block git switch --di main `` | FAIL | `` FAIL: block git switch --di main: expected exit 2, got 0:  `` |
| B4 | `` block block git switch -f main `` | FAIL | `` FAIL: block git switch -f main: expected exit 2, got 0:  `` |
| B4 | `` block block git switch --force main `` | FAIL | `` FAIL: block git switch --force main: expected exit 2, got 0:  `` |
| B4 | `` block block git switch -fc new `` | FAIL | `` FAIL: block git switch -fc new: expected exit 2, got 0:  `` |
| B4 | `` allow allow git switch main `` | holds | |
| B4 | `` allow allow git switch -c new `` | holds | |
| B4 | `` allow allow git switch -cf `` | holds | |
| B4 | `` allow allow git switch -C x `` | holds | |
| B4 | `` allow allow git switch --no-discard-changes main `` | holds | |
| B4 | `` allow allow git switch --force-create x `` | holds | |
| B4 | `` allow allow git switch -- -f `` | holds | |
| B5 | `` allow allow git checkout -f main `` | holds | |
| B5 | `` allow allow git checkout --force main `` | holds | |
| B6 | `` block block git -C /tmp stash clear `` | FAIL | `` FAIL: block git -C /tmp stash clear: expected exit 2, got 0:  `` |
| B6 | `` block block env A=1 git send-pack x `` | FAIL | `` FAIL: block env A=1 git send-pack x: expected exit 2, got 0:  `` |
| B6 | `` block block bash -c 'git switch -f main' `` | FAIL | `` FAIL: block bash -c 'git switch -f main': expected exit 2, got 0:  `` |
| B1 | `` line git send-pack origin main `` | FAIL | `` FAIL: git send-pack origin main: expected exit 2, got 0:  `` |
| B2 | `` line git subtree -P x push origin main `` | FAIL | `` FAIL: git subtree -P x push origin main: expected exit 2, got 0:  `` |
| B3 | `` line git stash drop stash@{1} `` | FAIL | `` FAIL: git stash drop stash@{1}: expected exit 2, got 0:  `` |
| B3 | `` line git stash clear `` | FAIL | `` FAIL: git stash clear: expected exit 2, got 0:  `` |
| B4 | `` line git switch -f main `` | FAIL | `` FAIL: git switch -f main: expected exit 2, got 0:  `` |
| A1 | `` line A1 git p `` | FAIL | `` FAIL: A1 git p: expected exit 2, got 0:  `` |
| A2 | `` line A2 git rh `` | FAIL | `` FAIL: A2 git rh: expected exit 2, got 0:  `` |
| A2 | `` line A2 git cf `` | FAIL | `` FAIL: A2 git cf: expected exit 2, got 0:  `` |
| A2 | `` line A2 git ck `` | FAIL | `` FAIL: A2 git ck: expected exit 2, got 0:  `` |
| A2 | `` line A2 git rs `` | FAIL | `` FAIL: A2 git rs: expected exit 2, got 0:  `` |
| A3 | `` line A3 git sp `` | FAIL | `` FAIL: A3 git sp: expected exit 2, got 0:  `` |
| A3 | `` line A3 git sb `` | FAIL | `` FAIL: A3 git sb: expected exit 2, got 0:  `` |
| A3 | `` line A3 git sd `` | FAIL | `` FAIL: A3 git sd: expected exit 2, got 0:  `` |
| A3 | `` line A3 git sc `` | FAIL | `` FAIL: A3 git sc: expected exit 2, got 0:  `` |
| A3 | `` line A3 git sw `` | FAIL | `` FAIL: A3 git sw: expected exit 2, got 0:  `` |
| A4 | `` block A4 git r --hard `` | FAIL | `` FAIL: A4 git r --hard: expected exit 2, got 0:  `` |
| A4 | `` block A4 git co . `` | FAIL | `` FAIL: A4 git co .: expected exit 2, got 0:  `` |
| A5 | `` allow A5 git st `` | holds | |
| A5 | `` block A5 git ctl `` | FAIL | `` FAIL: A5 git ctl: expected exit 2, got 0:  `` |
| A6 | `` block A6 git pp `` | FAIL | `` FAIL: A6 git pp: expected exit 2, got 0:  `` |
| A6 | `` allow A6 git ss `` | holds | |
| A6 | `` block A6 git sp `` | FAIL | `` FAIL: A6 git sp: expected exit 2, got 0:  `` |
| A7 | `` block A7 git p2 `` | FAIL | `` FAIL: A7 git p2: expected exit 2, got 0:  `` |
| A7 | `` allow A7 git a `` | holds | |
| A8 | `` block A8 git g `` | FAIL | `` FAIL: A8 git g: expected exit 2, got 0:  `` |
| A9 | `` block A9 git -C <scratch>/repo9 p `` | FAIL | `` FAIL: A9 git -C <scratch>/repo9 p: expected exit 2, got 0:  `` |
| A9 | `` allow A9 git p `` | holds | |
| A9 | `` block A9 git -C r p `` | FAIL | `` FAIL: A9 git -C r p: expected exit 2, got 0:  `` |
| A10 | `` block A10 git --git-dir=<scratch>/repo10/.git p `` | FAIL | `` FAIL: A10 git --git-dir=<scratch>/repo10/.git p: expected exit 2, got 0:  `` |
| A10 | `` block A10 git --git-dir <scratch>/repo10/.git p `` | FAIL | `` FAIL: A10 git --git-dir <scratch>/repo10/.git p: expected exit 2, got 0:  `` |
| A10 | `` block A10 git --git-dir=<scratch>/repo10/.git --work-tree=<scratch>/repo10 p `` | FAIL | `` FAIL: A10 git --git-dir=<scratch>/repo10/.git --work-tree=<scratch>/repo10 p: expected exit 2, got 0:  `` |
| A10 | `` block A10 git --git-dir <scratch>/repo10/.git --work-tree <scratch>/repo10 p `` | FAIL | `` FAIL: A10 git --git-dir <scratch>/repo10/.git --work-tree <scratch>/repo10 p: expected exit 2, got 0:  `` |
| A11 | `` block A11 git p `` | FAIL | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 | `` block A11 git p `` | FAIL | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 | `` block A11 git p `` | FAIL | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 | `` block A11 git p `` | FAIL | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 | `` block A11 git p `` | FAIL | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 | `` allow A11 git p `` | holds | |
| A12 | `` block A12 GIT_CONFIG_GLOBAL=<scratch>/other.config git q `` | FAIL | `` FAIL: A12 GIT_CONFIG_GLOBAL=<scratch>/other.config git q: expected exit 2, got 0:  `` |
| A12 | `` allow A12 git q `` | holds | |
| A13 | `` allow A13 git status `` | holds | |
| A13 | `` block A13 git Status `` | FAIL | `` FAIL: A13 git Status: expected exit 2, got 0:  `` |
| A14 | `` allow A14 git -c alias.p=status p `` | holds | |
| A14 | `` block A14 git -c alias.p=q p `` | FAIL | `` FAIL: A14 git -c alias.p=q p: expected exit 2, got 0:  `` |
| A15 | `` block A15 git P `` | FAIL | `` FAIL: A15 git P: expected exit 2, got 0:  `` |
| A15 | `` block A15 git foo.bar `` | FAIL | `` FAIL: A15 git foo.bar: expected exit 2, got 0:  `` |
| A16 | `` allow A16 git frobnicate `` | holds | |
| A16 | `` block A16 git ctl `` | FAIL | `` FAIL: A16 git ctl: expected exit 2, got 0:  `` |
| A17 | `` allow A17 git p `` | holds | |
| A17 | `` block A17 git push `` | holds | |
| A17 | `` block A17 git p `` | FAIL | `` FAIL: A17 git p: expected exit 2, got 0:  `` |
| A18 | `` allow A18 git p `` | holds | |
| A18 | `` block A18 git a; git b; git c; git d; git push `` | holds | |
| A18 | `` block A18 git -C <scratch>/places1 a; git -C <scratch>/places2 b; git push `` | holds | |
| A18 | `` block A18 git p `` | FAIL | `` FAIL: A18 git p: expected exit 2, got 0:  `` |
| A19 | `` block A19 git x `` | FAIL | `` FAIL: A19 git x: expected exit 2, got 0:  `` |
| A19 | `` block A19 git xq `` | FAIL | `` FAIL: A19 git xq: expected exit 2, got 0:  `` |
| A20 | `` block A20 cd . && sudo git p `` | FAIL | `` FAIL: A20 cd . && sudo git p: expected exit 2, got 0:  `` |
| A21 | `` block A21 cd <scratch>/repo21 && git p `` | FAIL | `` FAIL: A21 cd <scratch>/repo21 && git p: expected exit 2, got 0:  `` |
| A21 | `` block A21 cd ~/repo21 && git p `` | FAIL | `` FAIL: A21 cd ~/repo21 && git p: expected exit 2, got 0:  `` |
| A21 | `` allow A21 (cd <scratch>/repo21) && git p `` | holds | |
| A21 | `` allow A21 cd "$D" && git p `` | holds | |
| A21 | `` allow A21 cd <scratch>/repo21; cd - && git p `` | holds | |
| A21 (more) | `` block A21 more cd - && git p `` | FAIL | `` FAIL: A21 more cd - && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more cd <scratch>/repo22 && cd .. && cd - && git p `` | FAIL | `` FAIL: A21 more cd <scratch>/repo22 && cd .. && cd - && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more { cd <scratch>/repo22; } && git p `` | FAIL | `` FAIL: A21 more { cd <scratch>/repo22; } && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more (cd <scratch>/repo22 && git p) `` | FAIL | `` FAIL: A21 more (cd <scratch>/repo22 && git p): expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more bash -c 'cd <scratch>/repo22 && git p' `` | FAIL | `` FAIL: A21 more bash -c 'cd <scratch>/repo22 && git p': expected exit 2, got 0:  `` |
| A21 (more) | `` allow A21 more bash -c 'cd <scratch>/repo22' && git p `` | holds | |
| A21 (more) | `` allow A21 more echo $(cd <scratch>/repo22) && git p `` | holds | |
| A21 (more) | `` allow A21 more echo `cd <scratch>/repo22` && git p `` | holds | |
| A21 (more) | `` allow A21 more cd <scratch>/missing; git p `` | holds | |
| A21 (more) | `` block A21 more cd r && git p `` | FAIL | `` FAIL: A21 more cd r && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more cd -P <scratch>/repo22 && git p `` | FAIL | `` FAIL: A21 more cd -P <scratch>/repo22 && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more cd -- <scratch>/repo22 && git p `` | FAIL | `` FAIL: A21 more cd -- <scratch>/repo22 && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` allow A21 more cd <scratch>/repo22 <scratch>/repo22 && git p `` | holds | |
| A21 (more) | `` block A21 more cd <scratch>/repo22 && cd "$D" && git p `` | FAIL | `` FAIL: A21 more cd <scratch>/repo22 && cd "$D" && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more cd && git p `` | FAIL | `` FAIL: A21 more cd && git p: expected exit 2, got 0:  `` |
| A21 (more) | `` block A21 more cd ~ && git p `` | FAIL | `` FAIL: A21 more cd ~ && git p: expected exit 2, got 0:  `` |
| A22 | `` block A22 env -C <scratch>/repo23 git p `` | FAIL | `` FAIL: A22 env -C <scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A22 | `` block A22 env --chdir=<scratch>/repo23 git p `` | FAIL | `` FAIL: A22 env --chdir=<scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A22 | `` block A22 sudo -D <scratch>/repo23 git p `` | FAIL | `` FAIL: A22 sudo -D <scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A23 | `` block A23 git -C ~/repo24 p `` | FAIL | `` FAIL: A23 git -C ~/repo24 p: expected exit 2, got 0:  `` |
| A24 | `` block A24 git -C <scratch>/repo25 pp `` | FAIL | `` FAIL: A24 git -C <scratch>/repo25 pp: expected exit 2, got 0:  `` |
| A24 | `` block A24 GIT_CONFIG_GLOBAL=<scratch>/chained.config git qq `` | FAIL | `` FAIL: A24 GIT_CONFIG_GLOBAL=<scratch>/chained.config git qq: expected exit 2, got 0:  `` |
| A24 | `` block A24 git --git-dir=<scratch>/repo25/.git pg `` | FAIL | `` FAIL: A24 git --git-dir=<scratch>/repo25/.git pg: expected exit 2, got 0:  `` |
| A24 | `` block A24 git -C <scratch>/repo25/sub here `` | FAIL | `` FAIL: A24 git -C <scratch>/repo25/sub here: expected exit 2, got 0:  `` |
| A24 | `` allow A24 git -C <scratch>/repo25/sub up `` | holds | |
| A25 | `` block A25 git -C <scratch>/repo26 p2 `` | FAIL | `` FAIL: A25 git -C <scratch>/repo26 p2: expected exit 2, got 0:  `` |
| A26 | `` block A26 GIT_CONFIG=<scratch>/empty.config git p `` | FAIL | `` FAIL: A26 GIT_CONFIG=<scratch>/empty.config git p: expected exit 2, got 0:  `` |
| A26 | `` block A26 git p `` | FAIL | `` FAIL: A26 git p: expected exit 2, got 0:  `` |
| A27 | `` allow A27 PATH=<scratch>/fake27 git st `` | holds | |
| A27 | `` block A27 PATH=<scratch>/fake27 git p `` | FAIL | `` FAIL: A27 PATH=<scratch>/fake27 git p: expected exit 2, got 0:  `` |
| A27 | `` allow A27 GIT_TRACE=<scratch>/trace27 git st `` | holds | |
| A27 | `` block A27 GIT_TRACE=<scratch>/trace27 git p `` | FAIL | `` FAIL: A27 GIT_TRACE=<scratch>/trace27 git p: expected exit 2, got 0:  `` |
| A27 | `` allow A27 git st `` | holds | |
| A27 | `` block A27 git p `` | FAIL | `` FAIL: A27 git p: expected exit 2, got 0:  `` |
| A28 | `` allow A28 git 'p q' `` | holds | |
| A28 | `` allow A28 git -C <scratch>/nodir p `` | holds | |
| A28 | `` allow A28 git -C <scratch>/nodir p `` | holds | |
| A28 | `` block A28 git ctl `` | FAIL | `` FAIL: A28 git ctl: expected exit 2, got 0:  `` |
| A28 | `` allow A28 git p `` | holds | |
| A28 | `` block A28 git p `` | FAIL | `` FAIL: A28 git p: expected exit 2, got 0:  `` |
| A29 | `` allow A29 git '$(touch <scratch>/marker29)' `` | holds | |
| A29 | `` block A29 git ctl `` | FAIL | `` FAIL: A29 git ctl: expected exit 2, got 0:  `` |
| A30 | `` allow A30 git p `` | holds | |
| A30 | `` block A30 git p `` | FAIL | `` FAIL: A30 git p: expected exit 2, got 0:  `` |
| A31 | `` block A31 git push `` | holds | |
| A31 | `` block A31 git stash drop `` | FAIL | `` FAIL: A31 git stash drop: expected exit 2, got 0:  `` |
| A31 | `` allow A31 git mergetool `` | holds | |
| A31 | `` block A31 git ctl `` | FAIL | `` FAIL: A31 git ctl: expected exit 2, got 0:  `` |
| A31 | `` allow A31 git subtree split -P x `` | holds | |
| A31 | `` block A31 git ctl `` | FAIL | `` FAIL: A31 git ctl: expected exit 2, got 0:  `` |
| A32 | `` allow A32 git e `` | holds | |
| A32 | `` allow A32 git e push `` | holds | |
| A32 | `` block A32 git ctl `` | FAIL | `` FAIL: A32 git ctl: expected exit 2, got 0:  `` |
| A33 | `` block A33 git b `` | FAIL | `` FAIL: A33 git b: expected exit 2, got 0:  `` |
| A33 | `` allow A33 git c `` | holds | |
| A33 | `` block A33 git ctl `` | FAIL | `` FAIL: A33 git ctl: expected exit 2, got 0:  `` |
| A33 | `` block A33 a lone surrogate before git push `` | holds | |
| A33 | `` block A33 a lone surrogate in an assignment before git push `` | holds | |
| A33 | `` block A33 a lone surrogate in -C before git push `` | holds | |
| A33 | `` block A33 HOME=$'a\x00b' git p; git push `` | holds | |
| A34 | `` block A34 git status `` | FAIL | `` FAIL: A34 git status: expected exit 2, got 0:  `` |
| A34 (more) | `` allow A34 more git a; git b; git c `` | FAIL | `` FAIL: A34 more: three names of one directory took 0 runs of git, not 1 `` |
| A34 (more) | `` allow A34 more git status; git status; git status `` | FAIL | `` FAIL: A34 more: three runs of an alias named like a command took 0 runs of git, not 2 `` |

Every case of the brief is a row group: A1 to A34 are the rows A1 to A34, B1 to B6 the rows B1 to B6; A5, A16, A29 and the rows named ctl or control are controls.

Cases of kind "a run" or "a reading", checked on the unchanged tree:

- P1 on the unchanged tree: `pyright --warnings` on a copy of the unchanged guard (`base_guard.py`) printed `0 errors, 0 warnings, 0 informations`, exit 0. The case holds before and after the change and is a run, with no test kept.
- P2 on the unchanged tree: the unchanged docstring had the line `Not blocked, because they are not among the five operations above: git checkout -f <branch>,` (base_guard.py line 54); after the change the hits are those quoted under check 5.
- P3 on the unchanged tree: the unchanged test (`orig.test.sh`) run with the unchanged guard through `GIT_GUARD`, under a `PATH` that has a link to `/usr/bin/python3` (3.9.6) first, printed `PASS: git_guard.py scratch tests`.
- P4, a reading: README line 13, README line 68 and SKILL.md line 186 before the change are the `-` lines under "Host- and user-visible changes" below. After the change each of the six places was read in place against the final behaviour.

## DONE / NOT DONE

All commands were run in the worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2g-2a` under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

| Check | Status |
|---|---|
| 1. The verify list with the pyright line, `sh skills/land/templates/checks.sh $TMPDIR/state2a.md` | DONE, exit 0, `checks: 13 commands passed` |
| 2. `sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1` | DONE, `PASS: git_guard.py scratch tests` |
| 3. `pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1` | DONE, `0 errors, 0 warnings, 0 informations` |
| 4. P3, the test under Python 3.9 | DONE, `Python 3.9.6` and `PASS: git_guard.py scratch tests` |
| 5. `grep -rnI 'checkout -f' skills README.md docs` | DONE, quoted below |
| 6. `LC_ALL=C grep -n '[^ -~]'` over the six changed files | DONE, no line printed, exit status 1 |
| 7. Each test run on the unchanged tree and after the change | DONE, the table above and the checks below |
| 8. List items and sentences read against `docs/dev/skill-layout.md` | DONE, the departures are named below |

Check 1, the lines the runner prints, from `$TMPDIR/checks2a.out` as written (the state file copy `$TMPDIR/state2a.md` is the state file with the line `- pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1` after the guard's test line):

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

The runner's exit status was printed by `echo "checks-exit=$?"`: `checks-exit=0`.

Checks 2 to 4, as printed:

```
$ PATH=$TMPDIR/py39:$PATH python3 --version
Python 3.9.6
$ PATH=$TMPDIR/py39:$PATH sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1
0 errors, 0 warnings, 0 informations
```

`$TMPDIR/py39/python3` is a link to `/usr/bin/python3` (3.9.6); the `python3` on the ordinary `PATH` is 3.13.7. The test, with `python3` 3.13.7, is the one `checks.sh` ran above.

Check 5, `grep -rnI 'checkout -f' skills README.md docs`, as printed:

```
skills/repo-setup/templates/hooks/git_guard.test.sh:7:# Allowed, the further commands: git subtree split, pull and add (also with push as a value of -P), git stash, list, pop, push -m drop and show drop, git switch of a branch, with -c, -cf, -C, --force-create, --no-discard-changes and after --, and git checkout -f and --force of a branch.
skills/repo-setup/templates/hooks/git_guard.test.sh:458:allow git checkout -f main
skills/repo-setup/templates/hooks/git_guard.py:104:Not blocked, because it is not among the operations above: git checkout -f <branch>, and git
```

The three hits are the test's head comment (line 7), B5's case line (line 458) and the docstring's "Not blocked" line. No skill text and no other page holds the text.

Check 6: `LC_ALL=C grep -n '[^ -~]' skills/repo-setup/templates/hooks/git_guard.py skills/repo-setup/templates/hooks/git_guard.test.sh skills/repo-setup/SKILL.md README.md docs/dev/building.md docs/dev/change-standard.md` printed nothing; the exit status printed by `echo "charset-exit=$?"` was `charset-exit=1`. The repository-wide character check in the runner is the line `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne ...` in the output above, with no output line after it.

Check 7, the final test with its assertions on the unchanged tree is the table of the first run. After the change the same test passes (`PASS: git_guard.py scratch tests`, about 70 seconds). The pre-existing assertions (365) pass on both trees.

## The mutations

Each mutation is one change to a scratch copy of the guard, the test run through `GIT_GUARD` on that copy, the first failing line quoted as printed (scratch paths as `<scratch>`). The mutations were run against the final guard and the final test. The mutation harness and its outputs are outside the tree, in the session's scratch folder.

| Case | Mutation | Failing line |
|---|---|---|
| A1 | M1 | `` FAIL: A1 git p: expected exit 2, got 0:  `` |
| A2 | M1 | `` FAIL: A2 git rh: expected exit 2, got 0:  `` |
| A3 | M1 | `` FAIL: A3 git sp: expected exit 2, got 0:  `` |
| A4 | M2 | `` FAIL: A4 git r --hard: expected exit 2, got 0:  `` |
| A5 (control) | M1 | `` FAIL: A5 git ctl: expected exit 2, got 0:  `` |
| A6 | M4 | `` FAIL: A6 git pp: expected exit 2, got 0:  `` |
| A7 chain | M3 | `` FAIL: A7 git p2: expected exit 2, got 0:  `` |
| A7 cycle | M3b | `` TIMEOUT after 90s (the run reached case A7 and did not end; every case before it holds) `` |
| A8 | M5 | `` FAIL: A8 git g: expected exit 2, got 0:  `` |
| A9 -C | M6 | `` FAIL: A9 git -C <scratch>/repo9 p: expected exit 2, got 0:  `` |
| A9 relative -C | M6b | `` FAIL: A9 git -C r p: expected exit 2, got 0:  `` |
| A10 | M7 | `` FAIL: A10 git --git-dir=<scratch>/repo10/.git p: expected exit 2, got 0:  `` |
| A11 cwd a file | M8a | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 cwd missing | M8d | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 cwd a number | M8e | `` FAIL: A11 git p: expected exit 2, got 1: Traceback (most recent call last): `` |
| A11 no cwd | M8h | `` FAIL: A11 git p: expected exit 2, got 0:  `` |
| A11 cwd names the outside folder | M8f | `` FAIL: A11 git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A12 | M9 | `` FAIL: A12 GIT_CONFIG_GLOBAL=<scratch>/other.config git q: expected exit 2, got 0:  `` |
| A13 git status | M10 | `` FAIL: A13 git status: expected exit 0, got 2: git-guard: blocked: git status (git push is run by the user by hand) `` |
| A13 git Status | M10c | `` FAIL: A13 git Status: expected exit 2, got 0:  `` |
| A14 inline wins | M11 | `` FAIL: A14 git -c alias.p=status p: expected exit 0, got 2: git-guard: blocked: git -c alias.p=status p (git push is run by the user by hand) `` |
| A14 chain | M3 | `` FAIL: A14 git -c alias.p=q p: expected exit 2, got 0:  `` |
| A15 git P | M10b | `` FAIL: A15 git P: expected exit 2, got 0:  `` |
| A15 git foo.bar | M12 | `` FAIL: A15 git foo.bar: expected exit 2, got 0:  `` |
| A16 (control) | M1 | `` FAIL: A16 git ctl: expected exit 2, got 0:  `` |
| A17 | M14 | `` FAIL: A17 git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A18 one lookup | M15 | `` FAIL: A18: git p took 30067 ms with a git that hangs, not under 3000 `` |
| A18 shared budget | M15b | `` FAIL: A18: a lookup of 1.2 seconds, a lookup that hangs and git push took 3273 ms, not under 2800 (the lookups share 2 seconds) `` |
| A19 quoted word | M16 | `` FAIL: A19 git xq: expected exit 2, got 0:  `` |
| A19 git x | M1 | `` FAIL: A19 git x: expected exit 2, got 0:  `` |
| A20 | M17 | `` FAIL: A20 cd . && sudo git p: expected exit 2, got 0:  `` |
| A21 cd <repo> | M17 | `` FAIL: A21 cd <scratch>/repo21 && git p: expected exit 2, got 0:  `` |
| A21 ~ | M18i | `` FAIL: A21 cd ~/repo21 && git p: expected exit 2, got 0:  `` |
| A21 (cd <repo>) && git p | M18 | `` FAIL: A21 (cd <scratch>/repo21) && git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A21 cd - | M18c | `` FAIL: A21 cd <scratch>/repo21; cd - && git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A21 more: cd - without a recorded directory | M18d | `` FAIL: A21 more cd - && git p: expected exit 2, got 0:  `` |
| A21 more: cd of a variable after a cd | M18b | `` FAIL: A21 more cd <scratch>/repo22 && cd "$D" && git p: expected exit 2, got 0:  `` |
| A21 more: substitution scope | M18e | `` FAIL: A21 more echo $(cd <scratch>/repo22) && git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A21 more: cd options | M18f | `` FAIL: A21 more cd -P <scratch>/repo22 && git p: expected exit 2, got 0:  `` |
| A21 more: bare cd | M18g | `` FAIL: A21 more cd && git p: expected exit 2, got 0:  `` |
| A21 more: two operands | M18h | `` FAIL: A21 more cd <scratch>/repo22 <scratch>/repo22 && git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A22 env -C | M19a | `` FAIL: A22 env -C <scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A22 env --chdir | M19b | `` FAIL: A22 env --chdir=<scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A22 sudo -D | M19c | `` FAIL: A22 sudo -D <scratch>/repo23 git p: expected exit 2, got 0:  `` |
| A23 | M18i | `` FAIL: A23 git -C ~/repo24 p: expected exit 2, got 0:  `` |
| A24 -C | M24a | `` FAIL: A24 git -C <scratch>/repo25 pp: expected exit 2, got 0:  `` |
| A24 GIT_CONFIG_GLOBAL | M24b | `` FAIL: A24 GIT_CONFIG_GLOBAL=<scratch>/chained.config git qq: expected exit 2, got 0:  `` |
| A24 --git-dir | M24c | `` FAIL: A24 git --git-dir=<scratch>/repo25/.git pg: expected exit 2, got 0:  `` |
| A24 top-level directory | M24d | `` FAIL: A24 git -C <scratch>/repo25/sub up: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A25 | M25 | `` FAIL: A25 git -C <scratch>/repo26 p2: expected exit 2, got 0:  `` |
| A26 command's GIT_CONFIG | M26b | `` FAIL: A26 GIT_CONFIG=<scratch>/empty.config git p: expected exit 2, got 0:  `` |
| A26 exported GIT_CONFIG | M26a | `` FAIL: A26 git p: expected exit 2, got 0:  `` |
| A27 PATH | M27a | `` FAIL: A27: the git of the command's PATH was run `` |
| A27 GIT_TRACE | M27b | `` FAIL: A27: the trace file of the command was written `` |
| A27 exported GIT_TRACE | M27c | `` FAIL: A27: the trace file of the guard's environment was written `` |
| A28 stderr | M13 | `` FAIL: A28 git p: expected nothing on stderr, got: fatal: bad config line 8 in file .git/config `` |
| A29 (control) | M1 | `` FAIL: A29 git ctl: expected exit 2, got 0:  `` |
| A30 | M30 | `` FAIL: A30 git p: expected exit 0, got 2: git-guard: blocked: git p (git push is run by the user by hand) `` |
| A31 git push | M31 | `` FAIL: A31 git push: expected exit 2, got 0:  `` |
| A31 git stash drop | M31 | `` FAIL: A31 git stash drop: expected exit 2, got 0:  `` |
| A31 git mergetool | M31 | `` FAIL: A31 git mergetool: expected exit 0, got 2: git-guard: blocked: git mergetool (git push is run by the user by hand) `` |
| A31 git subtree split | M31 | `` FAIL: A31 git subtree split -P x: expected exit 0, got 2: git-guard: blocked: git subtree split -P x (git push is run by the user by hand) `` |
| A32 empty value | M32 | `` FAIL: A32 git e push: expected exit 0, got 2: git-guard: blocked: git e push (git push is run by the user by hand) `` |
| A33 byte after push | M33a | `` FAIL: A33 git b: expected exit 2, got 1: Traceback (most recent call last): `` |
| A33 byte glued to push | M33a | `` FAIL: A33 git c: expected exit 0, got 1: Traceback (most recent call last): `` |
| A33 lone surrogate | M33a | `` FAIL: A33 a lone surrogate before git push: expected exit 2, got 1: Traceback (most recent call last): `` |
| A33 surrogate in an assignment | M33b | `` FAIL: A33 a lone surrogate in an assignment before git push: expected exit 2, got 1: Traceback (most recent call last): `` |
| A33 NUL in an assignment | M29 | `` FAIL: A33 HOME=$'a\x00b' git p; git push: expected exit 2, got 1: Traceback (most recent call last): `` |
| A34 | M34 | `` FAIL: A34 git status: expected exit 2, got 1: Traceback (most recent call last): `` |
| A34 more: one listing | M35a | `` FAIL: A34 more: three names of one directory took 3 runs of git, not 1 `` |
| A34 more: one command list | M35b | `` FAIL: A34 more: three runs of an alias named like a command took 4 runs of git, not 2 `` |
| B1 | B1 | `` FAIL: block git send-pack origin main: expected exit 2, got 0:  `` |
| B2 long prefixes | B2a | `` FAIL: block git subtree --pref x push origin main: expected exit 2, got 0:  `` |
| B2 short options | B2b | `` FAIL: block git subtree -P x push origin main: expected exit 2, got 0:  `` |
| B2 push | B2d | `` FAIL: block git subtree push --prefix=x origin main: expected exit 2, got 0:  `` |
| B2 -P push split (control) | B2b | `` FAIL: allow git subtree -P push split: expected exit 0, got 2: git-guard: blocked: git subtree -P push split (git subtree push publishes work and is run by the user by hand) `` |
| B3 any word (control) | B3a | `` FAIL: allow git stash push -m drop: expected exit 0, got 2: git-guard: blocked: git stash push -m drop (git stash drop deletes stashed work and is run by the user by hand) `` |
| B3 clear | B3b | `` FAIL: block git stash clear: expected exit 2, got 0:  `` |
| B3 drop | B3c | `` FAIL: block git stash drop: expected exit 2, got 0:  `` |
| B4 -cf (control) | B4a | `` FAIL: allow git switch -cf: expected exit 0, got 2: git-guard: blocked: git switch -cf (git switch --discard-changes discards work and is run by the user by hand) `` |
| B4 --force-create (control) | B4b | `` FAIL: allow git switch --force-create x: expected exit 0, got 2: git-guard: blocked: git switch --force-create x (git switch --discard-changes discards work and is run by the user by hand) `` |
| B4 after -- (control) | B4c | `` FAIL: allow git switch -- -f: expected exit 0, got 2: git-guard: blocked: git switch -- -f (git switch --discard-changes discards work and is run by the user by hand) `` |
| B4 --di | B4d | `` FAIL: block git switch --discard main: expected exit 2, got 0:  `` |
| B4 -f | B4e | `` FAIL: block git switch -f main: expected exit 2, got 0:  `` |
| B5 | B5 | `` FAIL: allow git checkout -f main: expected exit 0, got 2: git-guard: blocked: git checkout -f main (git checkout with a whole-tree pathspec discards work and is run by the user by hand) `` |
| B6 -C /tmp stash clear | B6a | `` FAIL: block git -C /tmp stash clear: expected exit 2, got 0:  `` |
| B6 env A=1 git send-pack | B1 | `` FAIL: block env A=1 git send-pack x: expected exit 2, got 0:  `` |
| B6 bash -c | B4e | `` FAIL: block bash -c 'git switch -f main': expected exit 2, got 0:  `` |

Mutation definitions (each is made on a scratch copy of the guard that the run names through `GIT_GUARD`):

- M1, the file lookup returns nothing: `` expansion = git.alias(subcommand, where) `` becomes `` expansion = None ``.
- M2, an alias is expanded without the command's remaining arguments: `` arguments = words + rest `` becomes `` arguments = words ``.
- M4, a ! alias is read like any other alias: `` if expansion.startswith("!"):             text `` becomes `` if False:             text ``.
- M3, an alias chain stops after the first expansion: `` if name in seen:             return None `` becomes `` if seen:             return None ``.
- M3b, a name is never added to the seen set: `` seen.add(name) `` becomes `` pass ``.
- M5, the process gets an empty environment: `` environment.update(where.env) `` becomes `` environment = {} ``.
- M6, -C does not change the directory: `` place = _join(place, value) `` becomes `` place = place ``.
- M6b, a relative path is not joined to the directory: `` path = base / path `` becomes `` path = path ``.
- M7, --git-dir is not given to the process: `` if located and where.git_dir is not None: `` becomes `` if False: ``.
- M8a, a cwd that is a file is used as the directory: `` Path(cwd).is_dir() `` becomes `` Path(cwd).exists() ``.
- M8d, a cwd that does not exist is used as the directory: `` isinstance(cwd, str) and cwd and Path(cwd).is_dir() `` becomes `` isinstance(cwd, str) and cwd ``.
- M8e, a cwd that is not a string is read as a path: `` isinstance(cwd, str) and cwd and Path(cwd).is_dir() `` becomes `` cwd and Path(cwd).is_dir() ``.
- M8h, without an event cwd the guard's own directory is not used: `` try:         return Path.cwd()     except OSError:         return None `` becomes `` return None ``.
- M8f, the event's cwd is ignored: `` if isinstance(cwd, str) and cwd and Path(cwd).is_dir():         return Path(cwd).absolute() `` becomes `` (removed) ``.
- M9, GIT_CONFIG_GLOBAL of the command is not passed: `` {"GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" `` becomes `` {"GIT_CONFIG_SYSTEM" ``.
- M10, an alias named like a git command is run: `` if not value or name in self._command_names(where): `` becomes `` if not value: ``.
- M10c, the command names are compared without case: `` name in self._command_names(where) `` becomes `` name.lower() in {n.lower() for n in self._command_names(where)} ``.
- M11, an alias of the files wins over an inline one: `` expansion = config.get("alias." + name)         inline = expansion is not None `` becomes `` expansion = None         inline = False ``.
- M10b, the alias name is compared with case: `` value = listing.get(name.lower()) `` becomes `` value = listing.get(name) ``.
- M12, a key of the listing keeps its case: `` aliases[key[len("alias.") :].lower()] = value `` becomes `` aliases[key[len("alias.") :]] = value ``.
- M14, git is found at a fixed path when the PATH has none: `` shutil.which("git") `` becomes `` shutil.which("git") or "/usr/bin/git" ``.
- M15, the process has no time limit: `` timeout=remaining, `` becomes `` timeout=None, ``.
- M15b, each process gets the whole budget: `` timeout=remaining, `` becomes `` timeout=_LOOKUP_SECONDS, ``.
- M16, an alias value is split on spaces, not read by the lexer: `` words = [word for command in _Lexer(expansion).run() for word in command.words] `` becomes `` words = expansion.split() ``.
- M17, cd . leaves the directory unknown to the guard: `` return place if target is None else _Dir(target, place.current) `` becomes `` return _Dir(None) ``.
- M18i, a ~ is not expanded from HOME: `` if home and (word == "~" or word.startswith("~/")): `` becomes `` if False: ``.
- M18, a subshell's scope is not closed: `` frame.groups.pop() `` becomes `` pass ``.
- M18c, cd - does not return to the directory left: `` return _Dir(place.previous, place.current) if place.previous is not None else place `` becomes `` return place ``.
- M18d, a cd - with no directory recorded goes nowhere: `` return _Dir(place.previous, place.current) if place.previous is not None else place `` becomes `` return _Dir(place.previous, place.current) ``.
- M18b, a cd of a variable word goes to a path of that name: `` literal = _literal(word) `` becomes `` literal = word ``.
- M18e, a cd in a substitution holds after it: `` frame.base = self._scope() + (self._new_scope(),) `` becomes `` frame.base = self._scope() ``.
- M18f, a cd with options is not read: `` while operands and _CD_OPTIONS.match(operands[0]):         operands = operands[1:] `` becomes `` (removed) ``.
- M18g, a bare cd is not read as a cd to HOME: `` word = operands[0] if operands else "~" `` becomes `` word = operands[0] if operands else "." ``.
- M18h, a cd with two operands is read as a cd to the first: `` if len(operands) > 1:  # cd refuses more than one operand         return place `` becomes `` (removed) ``.
- M19a, env -C is not read as a directory: `` {"env": frozenset({"-C", "--chdir"}) `` becomes `` {"env": frozenset({"--chdir"}) ``.
- M19b, env --chdir is not read as a directory: `` {"env": frozenset({"-C", "--chdir"}) `` becomes `` {"env": frozenset({"-C"}) ``.
- M19c, sudo -D is not read as a directory: `` "sudo": frozenset({"-D", "--chdir"}) `` becomes `` "sudo": frozenset({"--chdir"}) ``.
- M24a, the commands of a ! alias run in no directory: `` return _Inherited(config, _Dir(top or where.directory), env) `` becomes `` return _Inherited(config, _Dir(None), env) ``.
- M24b, the commands of a ! alias get no variables: `` env = dict(context.env)     for variable, value in `` becomes `` env = {}     for variable, value in ``.
- M24c, GIT_DIR is not given to the commands of a ! alias: `` (("GIT_DIR", where.git_dir), ("GIT_WORK_TREE", where.work_tree)) `` becomes `` (("GIT_WORK_TREE", where.work_tree),) ``.
- M24d, a ! alias starts in the location's directory, not the top level: `` top = None if inline else git.toplevel(where) `` becomes `` top = None ``.
- M25, the location is lost after the first alias: `` words = [word for command in _Lexer(expansion).run() for word in command.words]         arguments = words + rest `` becomes `` words = [word for command in _Lexer(expansion).run() for word in command.words]         place = context.directory.current         arguments = words + rest ``.
- M26b, GIT_CONFIG of the command reaches the process: `` {"GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" `` becomes `` {"GIT_CONFIG", "GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" ``.
- M26a, GIT_CONFIG of the guard's environment reaches the process: `` if name != "GIT_CONFIG" and not name.startswith("GIT_TRACE") `` becomes `` if not name.startswith("GIT_TRACE") ``.
- M27a, the command's PATH decides which git runs: `` {"GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" `` becomes `` {"PATH", "GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" ``; `` command = [self._path] `` becomes `` command = ["git"] ``.
- M27b, GIT_TRACE of the command reaches the process: `` {"GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" `` becomes `` {"GIT_TRACE", "GIT_CONFIG_GLOBAL", "GIT_CONFIG_SYSTEM" ``.
- M27c, GIT_TRACE of the guard's environment reaches the process: `` if name != "GIT_CONFIG" and not name.startswith("GIT_TRACE") `` becomes `` if name != "GIT_CONFIG" ``.
- M13, the standard error of the process is not captured: `` capture_output=True, `` becomes `` stdout=subprocess.PIPE, ``.
- M30, the first key of the listing wins: `` aliases[key[len("alias.") :].lower()] = value `` becomes `` aliases.setdefault(key[len("alias.") :].lower(), value) ``.
- M31, checked commands do not come first and git's command names are not read: `` check = _CHECKS.get(subcommand)         if check is not None: `` becomes `` check = _CHECKS.get(subcommand)         if check is not None and git.alias(subcommand, _Where(place, git_dir, work_tree, ())) is None: ``; `` if not value or name in self._command_names(where): `` becomes `` if not value: ``.
- M32, an empty alias value is run: `` if not value or name in self._command_names(where): `` becomes `` if value is None or name in self._command_names(where): ``.
- M33a, the listing is decoded strictly: `` done.stdout.decode("utf-8", errors="replace") `` becomes `` done.stdout.decode("utf-8", errors="strict") ``.
- M33b, UnicodeError is not caught: `` except (OSError, subprocess.TimeoutExpired, UnicodeError): `` becomes `` except (OSError, subprocess.TimeoutExpired): ``.
- M29, the NUL check of the process arguments is removed: `` if any("\0" in part for part in command) or any("\0" in v for v in environment.values()):             return None `` becomes `` (removed) ``.
- M34, a failed command list is read as a list: `` frozenset(output.split() if output else ()) `` becomes `` frozenset(output.split()) ``.
- M35a, the alias listing is not kept for the next name: `` listing = self._aliases.get(where) `` becomes `` listing = None ``.
- M35b, the command names are not kept for the next name: `` names = self._commands.get(key) `` becomes `` names = None ``.
- B1, send-pack is not checked: `` "send-pack": _rule_send_pack, `` becomes `` (removed) ``.
- B2a, a long subtree option takes a value only when written in full: `` return len(matches) == 1 and _SUBTREE_LONG[matches[0]] `` becomes `` return option in _SUBTREE_LONG and _SUBTREE_LONG[option] ``.
- B2b, the short subtree options take no value: `` _SUBTREE_SHORT = frozenset({"-P", "-m", "-b"}) `` becomes `` _SUBTREE_SHORT = frozenset() ``.
- B2d, subtree push is not checked: `` "subtree": _rule_subtree, `` becomes `` (removed) ``.
- B3a, stash is checked at any word: `` if arguments[:1] in (["drop"], ["clear"]):         return _STASH_RULE.format(arguments[0]) `` becomes `` for word in arguments:         if word in ("drop", "clear"):             return _STASH_RULE.format(word) ``.
- B3b, stash clear is not checked: `` if arguments[:1] in (["drop"], ["clear"]): `` becomes `` if arguments[:1] in (["drop"],): ``.
- B3c, stash drop is not checked: `` if arguments[:1] in (["drop"], ["clear"]): `` becomes `` if arguments[:1] in (["clear"],): ``.
- B4a, a c in a short switch option word does not end the search: `` if letter in "cC":             return False `` becomes `` (removed) ``.
- B4b, --force is matched as a prefix: `` or option == "--force": `` becomes `` or option.startswith("--force"): ``.
- B4c, the words after -- are options: `` for option in _options(arguments):         if option.startswith("--"):             if _is_long(option, "--discard-changes", 4) `` becomes `` for option in [a for a in arguments if a.startswith("-")]:         if option.startswith("--"):             if _is_long(option, "--discard-changes", 4) ``.
- B4d, --discard-changes is matched only in full: `` _is_long(option, "--discard-changes", 4) `` becomes `` option == "--discard-changes" ``.
- B4e, -f is not a switch option that discards: `` if letter == "f":             return True `` becomes `` (removed) ``.
- B5, git checkout -f is blocked: `` if _whole_tree(words, candidates):         return _TREE_RULE.format("checkout") `` becomes `` if _whole_tree(words, candidates) or "-f" in arguments or "--force" in arguments:         return _TREE_RULE.format("checkout") ``.
- B6a, the value of -C is not skipped: `` elif option in _GIT_VALUED_OPTIONS:                 index += 2 `` becomes `` elif option in _GIT_VALUED_OPTIONS:                 index += 1 ``; `` elif option == "-C" and value is not None:                 place = _join(place, value)                 index += 2 `` becomes `` (removed) ``.

Audits, which are cases that still pass with the behaviour removed, so they prove nothing about it:

- M7b, `--work-tree` not given to the process: no assertion fails. `git --git-dir=<repo>/.git --work-tree=/nonexistent config -z --get-regexp '^alias\.'` and the same command without `--work-tree` both print `alias.p`, `push` (run in a scratch repository), so the listing does not depend on `--work-tree`; the A10 `--work-tree` cases are audits of the option.
- M8g, an empty `cwd` read as a path: no assertion fails. `Path("").absolute()` is the working directory and `Path("").is_dir()` is True (printed by python3 in the worktree), the same directory the guard falls back to without a `cwd`, so the clause `and cwd` does not change the result; the A11 empty-`cwd` case is an audit.
- A29 (text of the command reaching the lookup): no mutation reaches it, since the subcommand is never put in an argument of a process. The case holds with the guard as written and is a run of the property, not a proof of a check.
- The top-level directory of a `!` alias found in the files: M24d is caught by the case `up` alone.
- A31, `git push` and `git stash drop` blocked when an alias of that name exists: caught only when both the order of `_CHECKS` before the alias lookup and the command-name check are removed (M31).
- M3b, a name never added to the seen set: the test run does not end, killed by the harness at 90 s; the run reaches the A7 cycle case, so the A7 cycle case catches it by never finishing, not by a failing line.

## Terms

`docs/glossary.md` has 137 entries. Each entry's name was searched in the lines the diff adds (`git diff -U0 -- README.md docs skills`). Hits of entry names, each read against the entry:

- case: the entry is "an example under a brief's Cases". The test's head comment and `case` function names use "case" for one command with its expected result in the test, which is the entry's sense of an input with its expected result; the docstring's "case-sensitive" and "without regard to case" are the ordinary word and no term.
- base, kind, bar, plan, project skills, sync, ADR, standards, runner, gate, look, pin: the names occur only inside other words or in a different sense (`frame.base` and `_join(base ...)` in code, `frame.kind`, `[alias "Foo"] bar`, `repo-setup`'s "project skills" sentence in README line 68 that is not changed in its meaning, `an ADR folder` in README line 13 that is unchanged text). None is used in a new sense.
- The diff adds no entry to the glossary and uses no term of it in a way the entry does not state. The terms "git guard", "alias" and "hook" are in no glossary entry (`grep -n -i 'guard\|alias\|hook' docs/glossary.md` printed nothing).

## Files with line counts

`wc -l` of the changed files, and `git diff --stat`:

```
    1656 skills/repo-setup/templates/hooks/git_guard.py
    1025 skills/repo-setup/templates/hooks/git_guard.test.sh
     253 skills/repo-setup/SKILL.md
     192 README.md
      36 docs/dev/building.md
      91 docs/dev/change-standard.md
 README.md                                          |   6 +-
 docs/dev/building.md                               |   3 +-
 docs/dev/change-standard.md                        |   1 +
 skills/repo-setup/SKILL.md                         |   4 +-
 skills/repo-setup/templates/hooks/git_guard.py     | 550 ++++++++++++++++++---
 .../repo-setup/templates/hooks/git_guard.test.sh   | 524 +++++++++++++++++++-
 6 files changed, 1017 insertions(+), 71 deletions(-)
```

The report file `.scratch/2-g-git-guard/agents/reviews/2a-report.md` is the seventh path of the brief's list and is not in the table because it is written after the counts.

## Judgment calls the brief left open

- No `git` runs for an alias given inline that starts with `!`: its text is checked as shell text from the location's directory. A run would add nothing, since the inline configuration is in the command.
- A `cd` in a pipeline or in the background, which the shell runs in a subshell, is not isolated from the following command. The docstring's "Not seen" names it.
- A failed lookup is cached for the same directory, location and environment, so a slow or failing git is run once per run of the guard.
- A NUL in an assignment or an argument of the process is checked explicitly and finds no alias, since the operating system rejects it with a `ValueError` that the process rules (catch the exception classes) do not list.
- `~` in a `cd` or `-C` word expands from the guard's own `HOME`, since a `HOME=` assignment in the same command would only apply to the command it prefixes.
- The environment variables of the process are those in the brief's decision 6, listed in the docstring; `GIT_CONFIG` and the `GIT_TRACE*` variables are removed from the guard's own environment as well as the command's.
- Extra cases and controls beyond the brief: "A21 more", A19 `xq`, the A24 `pg`, `up` and `here` cases, the A27 exported-`GIT_TRACE` case, the A28 corrupt-config case, A32 `git e push`, the A33 surrogate and NUL cases, "A34 more" (run counts) and the A18 slow-once case.
- The clauses `"=" in option` of the subtree long-option reader and the `is_dir` check on the lookup's directory were removed from the guard: a mutation of each passed, so they did nothing.

## Host- and user-visible changes, before and after

The lines changed in the five pages, as `git diff -U0` prints them (`-` before, `+` after):

```
FILE README.md
-| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. It can install the git guard, a hook that refuses an agent's `git push`, `git reset --hard`, forced `git clean` and whole-tree `git checkout` or `git restore`, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
+| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. It can install the git guard, a hook that refuses an agent's `git push`, `git reset --hard`, forced `git clean`, whole-tree `git checkout` or `git restore`, `git stash drop` and `git stash clear`, `git switch` that discards changes, `git send-pack` and `git subtree push`, also when a git alias from the configuration files names one, which the user runs by hand, into `.claude/hooks/`, and prints its settings text for the user to add. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
-- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/checks.sh`, also needs `bash`. The git guard that `repo-setup` can install needs `python3` 3.9 or later.
+- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/checks.sh`, also needs `bash`. The git guard that `repo-setup` can install needs `python3` 3.9 or later. The green check also needs `pyright`, installed with `npm install -g pyright`.
-- `node` and `npx` on `PATH`, for the skills CLI only. Both the CLI install and `repo-setup`'s project skills use that CLI.
+- `node` and `npx` on `PATH`, for the skills CLI and for `pyright`. Both the CLI install and `repo-setup`'s project skills use that CLI.
FILE skills/repo-setup/SKILL.md
-  version: "2.1.0"
+  version: "2.2.0"
-    - It is a hook that refuses `git push`, `git reset --hard`, `git clean` with force and `git checkout` or `git restore` of the whole tree in an agent's commands, which the user then runs by hand.
+    - It is a hook that refuses `git push`, `git reset --hard`, `git clean` with force, `git checkout` or `git restore` of the whole tree, `git stash drop`, `git stash clear`, `git switch` that discards changes, `git send-pack` and `git subtree push` in an agent's commands, also when a git alias that the configuration files define names one, which the user then runs by hand.
FILE docs/dev/building.md
-sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clean --force, checkout and restore of the whole tree, reached through separators, substitutions, wrappers, shells and aliases) and on the commands it must let through
+sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clean --force, checkout and restore of the whole tree, stash drop and clear, switch that discards changes, send-pack and subtree push, reached through separators, substitutions, wrappers, shells, inline aliases and the aliases of the configuration files in scratch repositories) and on the commands it must let through
+pyright --warnings skills/repo-setup/templates/hooks/git_guard.py   # git_guard.py type-checks with no error or warning, in pyright's standard mode
FILE docs/dev/change-standard.md
+pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1
```

Also visible: the guard blocks `git send-pack`, `git subtree push`, `git stash drop`, `git stash clear` and `git switch` that discards changes (before: allowed); the guard blocks a command whose alias from the user's, the repository's or the system's git configuration expands to a blocked command (before: allowed, since only inline aliases were read); the guard now runs up to three `git` processes (`config -z --get-regexp`, `--list-cmds=main,others`, `rev-parse --show-toplevel`), within 2 seconds per run, with no shell and with standard error dropped (before: no process); the guard reads the event's `cwd`; the test takes about 70 seconds (before: about 30); `pyright` is needed for the green check, listed in README's Requirements; the docstring and the test's head comment are rewritten for these behaviours; the `version` of `repo-setup` is 2.2.0 (before: 2.1.0).

Rule 14, the greps for the changed names and the pages that speak of the changed files as a whole:

```
$ grep -rnI -e git_guard -e "git guard" -e "git-guard" skills utils docs README.md | grep -v "^skills/repo-setup/templates/hooks/git_guard"
skills/repo-setup/SKILL.md:3:description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the standards pages (design principles, coding standards, a UI standard
skills/repo-setup/SKILL.md:29:1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `plan-terms.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`, `hooks/git_guard.py`, `hooks/git_guard.settings.json`.
skills/repo-setup/SKILL.md:63:   - The git guard hook is copied byte for byte, so the draft names it by its path and its source and shows no text for it.
skills/repo-setup/SKILL.md:95:   - When the answer to question 10 is yes, `templates/hooks/git_guard.py` is copied to `.claude/hooks/git_guard.py`, that one file, the folders made as needed, over a copy already there.
skills/repo-setup/SKILL.md:118:11. Show the user what the setup leaves for them to act on: each check's output and, when the answer to question 10 is yes, `templates/hooks/git_guard.settings.json`, for the user to add to `.claude/settings.json` or `.claude/set
skills/repo-setup/SKILL.md:185:10. Install the git guard? [no]
skills/repo-setup/SKILL.md:213:.claude/hooks/git_guard.py       templates/hooks/git_guard.py when question 10 is yes, ignored by .gitignore, so it stays in this clone
skills/repo-setup/SKILL.md:250:- The skill never writes a Claude Code settings file: it shows the git guard's settings text for the user to add, as Steps 11 says.
skills/repo-setup/SKILL.md:253:- The copied git guard hook is copied byte for byte.
docs/roadmap.md:28:## 2.G git guard
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md:72:pyright --warnings skills/repo-setup/templates/hooks/git_guard.py 2>&1 | tail -1
docs/dev/building.md:10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clean --force, checkout and restore of the whole tree, stash drop and clear, switch that discards changes, send-pa
docs/dev/building.md:11:pyright --warnings skills/repo-setup/templates/hooks/git_guard.py   # git_guard.py type-checks with no error or warning, in pyright's standard mode
README.md:13:| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, the standards pages, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs 
README.md:66:- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/checks.sh`, also needs `bash`. The git guard that `repo-setup` can install needs `python3` 3.9 or later. The green check also needs `pyright`, installed with `
README.md:115:A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, the project skills, and whether to install the git
exit=0
```

Each hit was read: SKILL.md lines 3, 29, 63, 95, 118, 185, 213, 250 and 253 speak of the guard as a file or hook and list no blocked command; line 186 is the changed bullet; README line 115 names the guard as installable and lists no blocked command; `docs/roadmap.md` line 28 is the heading of entry 2.G, whose text is the orchestrator's and outside the step's paths. The docstring's intro, counts and "Not seen" and "Not blocked" paragraphs, the test's head comment, README's Requirements and `docs/dev/building.md`'s intro were reread against the final behaviour.

## Item 8, list items and sentences against `docs/dev/skill-layout.md`

The layout page's list-item rule binds skill pages; the docstring and the test's head comment are code comments, held to the same reading as far as it fits. Departures:

- SKILL.md line 186, README line 13 and the `building.md` line 10 comment each name nine blocked forms in one sentence. Each is one description of what one hook refuses, which the reader needs whole to answer question 10; splitting it into nine bullets would change a question's one bullet into a list the question does not otherwise have.
- The docstring's bullet "An alias whose name is a git command is never run by git, so it is ignored. Once an alias is found, ..." holds two sentences, the rule and the way it is checked, since the second says what the first costs.
- The docstring's bullet "is the `git` that the script's own PATH finds, so that no program runs ..." carries its reason in a clause, as the layout page allows for a qualifier that changes the rule.
- The docstring's bullets for the directory and the process each name several variables or forms; each is one rule about one source of the lookup's directory or environment.

## Anything in the brief that was wrong or impossible

- A21: the rule (a `cd -` leaves the directory unknown, the lookup runs from the directory before it) gives `<repo>` for `cd <repo>; cd - && git p` and blocks it, while the case lists it as allowed. Ruled, option (b), as above.
- A33: byte `\377` glued to `push` gives an alias git refuses, so "blocked" was impossible for that value. Ruled, option (a), as above.
- A13: `git Status` is blocked by the guard and refused by git on this macOS file system; the brief's expectation holds for the guard, not for git here. Stated in the docstring.
- P2: the grep also hits the test file, as the orchestrator ruled.
- A18's five-name case (`git a; git b; git c; git d; git push`) runs one lookup, since one listing serves every name (the "A34 more" run-count cases hold this), so it cannot show the shared budget; the case "a lookup of 1.2 seconds, a lookup that hangs and git push" shows it (M15b).
- `--work-tree` has no effect on the listing of a config lookup (shown under the audits), so the A10 `--work-tree` cases and M7b are audits; the brief expected them to change what is found.
