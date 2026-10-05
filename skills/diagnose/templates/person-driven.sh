#!/bin/sh
# Prints each action of a list for a person to take, reads the line the person observed after each
# one, and writes the actions and the observations into a file for the diagnosis record.
#
# Input: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>
# The actions file holds one action per line. A line of only spaces and tabs is no action, and a
# last line with no newline counts. Standard input holds the person's observation after each
# action, one line each. Every line is read with IFS= read -r, so end spaces and backslashes stay.
# A relative path is taken from the folder the script is started in, and a path may start with a
# dash. A text only ever reaches the output as an argument of %s.
#
# Output: for action <n> of <m>, "Action <n> of <m>: <text>" and then "What did you observe? (one
# line) " with no newline, on standard output. A line of only spaces and tabs is answered with
# "person-driven: type what you observed" on standard error and read again for the same action.
# After each observation the lines "Action <n>: <text>" and "Observed: <line>" are appended to the
# observations file by one printf, which the first append creates, so a signal never leaves an
# "Action" line without its "Observed" line.
# After the last pair it prints a newline and "person-driven: wrote <m> of <m> actions, each with
# its observation, to the observations file <path>".
#
# Errors, one line each on standard error, each beginning "person-driven: ":
#   usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>
#   cannot read the actions file <path>
#   the actions file <path> holds no action
#   the observations file <path> exists; name a new file    (a file, a folder or a symbolic link)
#   cannot write the observations file <path>    (an empty path, a folder that is missing or not
#       writable, or an append that failed)
#   the input ended after observation <k> of <m>    (<k> is the number of pairs already written)
#   cannot write to standard output    (closed, or a pipe whose reader has exited)
#
# Exit status:
#   0      every action has its observation in the file.
#   1      the input ended early, an append failed, or standard output could not be written.
#   64     a refusal, made before any action is printed or file is created: the usage line and
#          the first four errors.
#   128+n  a signal n ended the script; the pairs already written stay whole.

set -u
trap '' PIPE
tab=$(printf '\t')

say() { printf 'person-driven: %s\n' "$1" >&2; }
refuse() { say "$1"; exit 64; }
cannot_show() { say 'cannot write to standard output'; exit 1; }

[ "$#" -eq 2 ] || refuse "usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>"
actions=$1
obs=$2

[ -f "$actions" ] && [ -r "$actions" ] || refuse "cannot read the actions file $actions"
m=0
while IFS= read -r text || [ -n "$text" ]; do
    case $text in *[!\ "$tab"]*) m=$((m + 1)) ;; esac
done < "$actions"
[ "$m" -gt 0 ] || refuse "the actions file $actions holds no action"

{ [ -e "$obs" ] || [ -L "$obs" ]; } && refuse "the observations file $obs exists; name a new file"
dir=.
case $obs in */*) dir=${obs%/*}; dir=${dir:-/} ;; esac
[ -n "$obs" ] && [ -d "$dir" ] && [ -w "$dir" ] || refuse "cannot write the observations file $obs"

exec 3< "$actions"
n=0
while IFS= read -r text <&3 || [ -n "$text" ]; do
    case $text in *[!\ "$tab"]*) ;; *) continue ;; esac
    n=$((n + 1))
    printf 'Action %s of %s: %s\nWhat did you observe? (one line) ' "$n" "$m" "$text" 2>/dev/null || cannot_show
    got=
    while IFS= read -r seen || [ -n "$seen" ]; do
        case $seen in *[!\ "$tab"]*) got=yes; break ;; esac
        say 'type what you observed'
    done
    [ -n "$got" ] || { say "the input ended after observation $((n - 1)) of $m"; exit 1; }
    printf 'Action %s: %s\nObserved: %s\n' "$n" "$text" "$seen" 2>/dev/null >> "$obs" || { say "cannot write the observations file $obs"; exit 1; }
done
printf '\nperson-driven: wrote %s of %s actions, each with its observation, to the observations file %s\n' "$m" "$m" "$obs" 2>/dev/null || cannot_show
