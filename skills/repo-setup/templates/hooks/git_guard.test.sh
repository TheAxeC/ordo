#!/bin/sh
# Exercise git_guard.py on JSON inputs shaped like the PreToolUse event, each case one command with the result the guard must give. A blocked case must exit 2 with exactly one line on stderr that starts with "git-guard: blocked: " and nothing on stdout; an allowed case must exit 0 with nothing on stderr and nothing on stdout. The test never runs git. GIT_GUARD names another script to test, such as a scratch copy with one block removed.
# Blocked, push: git push with arguments, --force and --dry-run; behind -C, -c, --git-dir (both spellings), --attr-source (both spellings) and --no-pager; through an absolute path, a glob pattern in the command word, a backslash and quotes; behind an environment assignment, env (with -u), command -p, nohup, nice -n, time -p, timeout (with -s), sudo (with -u and -Eu), doas, stdbuf, setsid (with -f), unbuffer, ionice (with -c 3 and -c3 -n7), chrt (with -f), script (its -c or --command string, before and after its file, and the words after its file), xargs (with -I{}, -n, a redirection and the words an echo or printf pipes into it, appended or put in place of the string of -I{} and -I %), watch (with -n, --interval and a command in one string), find with -exec, -execdir, -ok and -okdir, eval (bare, quoted and after --) and exec; after cd &&, ;, ||, &, a newline, a line continuation and an arithmetic (( )) or $(( )) holding << or > (on the same line and the line before); in a subshell (also written with the operators run together), braces, after !, in if, for, while and case, after function NAME and coproc (with and without a name); in $( ), "$( )", $(( ) ) as a subshell, backticks, "` `", A=$( ), <( ) and nested $( ); in a word written as a brace expansion with a comma list (whole word, inside a word, nested, and with an empty alternative that bash removes); in a word written with $'...' escapes (\x, \u and octal) or as $"..."; in the word of ${x:-word}, ${x-word} and ${x:=word} (quoted, inside double quotes, nested and followed by a later }) in the command word; in sh -c, bash -c, bash -lc, sh -ec, env -S and a shell whose -c string follows further options (-c -- str, -c -e str, -c -x str, -c -o errexit str, combined as -co errexit and -eco pipefail, and after +o); in a here-document, a here-string, an echo pipe, an echo -e pipe and a printf pipe (the format with \n, \t, \x and octal escapes, typed and as a newline, and filled from its arguments by %s and %b) into a shell, also into bash -, bash -s and a shell given /dev/stdin or /dev/fd/0; through an alias given as -c alias.<name>=, as a ! alias (with the arguments git appends to it and with inline configuration carried into the git command it runs), as GIT_CONFIG_KEY_<n> with GIT_CONFIG_VALUE_<n>, as --config-env=<key>=<variable> (both spellings) and as GIT_CONFIG_PARAMETERS; after a redirection of file descriptors and a pipe.
# Blocked, reset, clean, checkout and restore: reset --hard in each position, behind -C and as the prefixes --har and --ha; clean with -f in each combined flag, --force and its prefix --forc, -fn and -c clean.requireForce set to false (empty, 00, -0, 0x0, 0k, 0G, OFF and false); checkout and restore with . ./ .. :/ * ** :(glob)** :(top) :(literal). :(literal)./ and exclude-only pathspec sets, with and without --, after -p, -s, --source= and revisions, and beside another path.
# Allowed: git branch -D, git worktree remove, git restore -- paths, git restore --staged --worktree -- paths, git restore --staged . and -S ., git checkout --theirs -- path, git checkout of a branch, -b, ./a, -- ../x.md and an exclude beside a path, -c core.excludesFile=f, git apply, git reset --soft, --help and HEAD -- path, git clean -n and -nd, git clean with clean.requireForce true, 1, 0x1, 1k, given with no value, or absent, git checkout and restore of :(literal)* and :(literal)**, git status, log, diff -- ., add -- ., stash list and an alias to status (also a ! alias to status and configuration from --config-env or GIT_CONFIG_PARAMETERS that names status); text that names git push inside echo, in single quotes, in a commit message, in grep, in a here-document not fed to a shell, in for-list words and in a case pattern; $((1 + 2)); a comment; ${x} without a command; a brace expansion (also one with an empty alternative outside the command word), a $'...' or $"..." word, the word of ${x:-word} outside the command word or inside double quotes, a shell option -o or -co with its value, arithmetic with << before git status, a printf %d or %% format, xargs -I{} and eval -- naming git status, a shell given a script file on a here-string, setsid, chrt and script (its -c string and the words after its file) naming git status, a glob word (also a pattern that names no character),  a printf or echo pipe, watch, find -exec, stdbuf, doas and a bash -c string that name git status or no git; a command with no git, an empty command, and a command the shell would refuse.
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
block bash -co errexit 'git push'
block bash -eco pipefail 'git push'
block sh -c -o errexit -o nounset 'git push'
block bash +o errexit -c 'git push'
allow bash -co errexit 'git status'
allow bash -o errexit script.sh
block {,git} push
block {git,} push
allow {,echo} git push
allow echo {,git} push
block printf '%s %s\n' git push | sh
block printf '%b' 'git\x20push' | bash
block printf '%s\n' 'git push' | bash
block printf 'git %s\n' push | sh
allow printf '%s %s\n' git status | sh
allow printf '%d%%\n' 5 | sh
block echo push | xargs -I{} git {}
block echo push | xargs -I % git %
block printf 'push\n' | xargs -I{} git {} origin
allow echo status | xargs -I{} git {}
block eval -- git push
block eval -- 'git push'
allow eval -- git status
block (( y = 1<<2 ))<NL>git push
block (( y = 1<<2 )); git push
block (( y = 3 > 2 )) && git push
block echo $(( 1<<2 ))<NL>git push
block x=$(( (1<<2) ))<NL>git push
allow (( y = 1<<2 ))<NL>git status
allow echo $(( 1<<2 )) $(( 3 > 2 ))
block $"git" push
block git $"push"
block echo $"$(git push)"
allow echo $"git push"
block ${x:-git} push
block ${x-git} push
block ${x:=git push}
block "${x:-git}" push
block ${x:-'git'} push
block ${x:-git} push; echo }
block ${x:-${y:-git}} push
block ${x:-${y}git} push
allow ${x:-git} status
allow echo ${x:-git} push
allow echo "${x:-git push}"
block bash /dev/stdin <<< 'git push'
block bash /dev/fd/0 <<< 'git push'
block echo 'git push' | sh /dev/stdin
allow bash /dev/stdin <<< 'git status'
allow bash script.sh <<< 'git push'
block git -c clean.requireForce=0x0 clean -d
block git -c clean.requireForce=0k clean -d
block git -c clean.requireForce=0G clean -d
allow git -c clean.requireForce=0x1 clean -d
allow git -c clean.requireForce=1k clean -d
block git checkout -- ':(literal).'
block git restore ':(literal)./'
allow git checkout -- ':(literal)*'
allow git restore -- ':(literal)**'
block setsid git push
block setsid -f git push
block unbuffer -p git push
block ionice -c 3 git push
block ionice -c3 -n7 git push
block chrt 10 git push
block chrt -f 10 git push
block script -q -c 'git push' /dev/null
block script -c 'git push'
block script --command 'git push' out.log
block script -q /dev/null git push
allow setsid git status
allow script -q -c 'git status' /dev/null
allow script -q /dev/null git status
allow chrt 10 git status
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
