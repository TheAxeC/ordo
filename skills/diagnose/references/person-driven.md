# A red command a person drives

This is the material a run of `diagnose` needs only when a person drives the red command, the stop "A red command a person drives".

- The command is `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`.
- The actions file is a file the skill writes, one action per line, each an action the user takes with what to look at after it.
- The observations file is the file the script writes, one pair of lines per action: `Action <n>: <the action>` and `Observed: <the user's line>`.
- Both files are in the diagnosis's scratch folder `$tmp` of Steps 3.
  - A run with no scratch copy makes `$tmp` for the two files alone with the same `mktemp -d` command as Steps 3.
- The observations file is named `observations-<n>.txt` for run `<n>`.
- The session never runs the script itself, since the script reads what the user types.
- The session shows the whole command with absolute paths, for the user to paste into a terminal of their own.
- An observation is one line, and the user saves a longer output to a file that the observation names.
- The record states which observation is the red before the user runs the script, since the script judges neither red nor green.
- When the user says the script has ended, the skill reads the observations file and counts its `Observed:` lines against the actions.
  - Fewer `Observed:` lines than actions is an unfinished run, and the skill shows the command again with a new observations file.
- Each run of the red command that the steps ask for is one run of the script with a new observations file.
- The skill quotes the observations file whole in the record's "Red command" section before the cleanup of Steps 22, a secret in it written `<REDACTED>`.
  - The observations file is the red command's own output, not a captured artifact, which "Rules" quotes only in the lines that carry the symptom.
- The exit statuses and the messages are in the script's head comment and are not repeated here.
