#!/bin/sh
# Shows a person each action of a list, reads one line of what they observed after each, and writes
# the actions and the observations into a new file.
#
# Input: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations
# file>, run by the person in a terminal of their own. The actions file is text with one action per
# line; a line that is empty or holds only spaces and tabs is no action. The observations file must
# not exist. Standard input is the person's typing. A relative path is taken from the folder the
# script is started in, and a path that starts with a dash is a file name.
#
# Output: for each action, in order, on standard output: "Action <n> of <m>: <text>" on a line of
# its own, then the prompt "What did you observe? (one line) " with no newline. After each
# observation the script appends the two lines "Action <n>: <text>" and "Observed: <line>" to the
# observations file, which the first append creates. Text is written as typed, spaces at both ends
# and backslashes included, and is never expanded or run. An observation that is empty or holds only
# spaces and tabs is asked for again with "person-driven: type what you observed" on standard error.
# After the last observation it prints a newline and "person-driven: wrote <m> of <m> actions, each
# with its observation, to the observations file <path>" on standard output. The script does not
# judge red or green.
#
# Errors, each one line on standard error starting "person-driven: ":
#   usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>
#   cannot read the actions file <path>
#   the actions file <path> holds no action
#   the observations file <path> exists; name a new file
#   cannot write the observations file <path>
#   the input ended after observation <k> of <m>
#
# Exit status:
#   0   every action has its observation in the observations file.
#   1   the run did not finish: the input ended before every action had an observation, or an append
#       to the observations file failed. The observations already written stay in the file.
#   64  refused before an action was shown or a file was created: a number of arguments other than
#       two; an actions file that is not a readable regular file; an actions file with no action; an
#       observations path that exists as a file, a folder or a symbolic link, with or without a
#       target; an observations path that is empty or whose folder is missing or not writable.

set -u

blank=" $(printf '\t')"

refuse() {
    printf 'person-driven: %s\n' "$1" >&2
    exit 64
}

# True when the text $1 holds a character other than a space or a tab.
holds_text() {
    case $1 in
        *[!"$blank"]*) return 0 ;;
    esac
    return 1
}

# Appends the pair of action $1 with text $2 and observation $3 to the observations file, and
# ends the run at once when the append fails.
append_pair() {
    { printf 'Action %s: %s\nObserved: %s\n' "$1" "$2" "$3" >>"$observations"; } 2>/dev/null || {
        printf 'person-driven: cannot write the observations file %s\n' "$observations" >&2
        exit 1
    }
}

input_ended() {
    printf 'person-driven: the input ended after observation %s of %s\n' "$1" "$total" >&2
    exit 1
}

[ "$#" -eq 2 ] || {
    printf "person-driven: usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>\n" >&2
    exit 64
}
actions=$1
observations=$2

[ -f "$actions" ] && [ -r "$actions" ] || refuse "cannot read the actions file $actions"

total=0
while IFS= read -r line || [ -n "$line" ]; do
    holds_text "$line" && total=$((total + 1))
done <"$actions"
[ "$total" -gt 0 ] || refuse "the actions file $actions holds no action"

if [ -e "$observations" ] || [ -L "$observations" ]; then
    refuse "the observations file $observations exists; name a new file"
fi
case $observations in
    */*) folder=${observations%/*} ;;
    *) folder=. ;;
esac
[ -n "$folder" ] || folder=/
[ -n "$observations" ] && [ -d "$folder" ] && [ -w "$folder" ] || refuse "cannot write the observations file $observations"

exec 3<"$actions"
n=0
while IFS= read -r action <&3 || [ -n "$action" ]; do
    holds_text "$action" || continue
    n=$((n + 1))
    printf 'Action %s of %s: %s\n' "$n" "$total" "$action"
    printf 'What did you observe? (one line) '
    while :; do
        IFS= read -r observed || [ -n "$observed" ] || input_ended "$((n - 1))"
        holds_text "$observed" && break
        printf 'person-driven: type what you observed\n' >&2
    done
    append_pair "$n" "$action" "$observed"
done

printf '\nperson-driven: wrote %s of %s actions, each with its observation, to the observations file %s\n' "$total" "$total" "$observations"
