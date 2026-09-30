# A red command a person drives

For a symptom only a person can trigger, the red command is a run of the script `templates/person-driven.sh`. The script shows the user each action to take and writes down what the user observed.

- The command is `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`.
- The session writes the actions file, one action per line.
- Each action is what the user does, together with what to look at after it.
- The script writes the observations file, which holds the lines `Action <n>: <text>` and `Observed: <line>` for each action.
- Both files live in the diagnosis's scratch folder `$tmp` of Steps 3.
- The observations file of run `<n>` is named `observations-<n>.txt`. Run `<n>` counts every run of the script, finished or not, so a run made again takes the next number.
- The session never runs the script itself, since the script reads what the user types and the session has no terminal on its standard input. It shows the user the whole command to paste into a terminal of their own.
- The session writes the command with the script's path and both files' paths absolute, each in single quotes. A single quote inside a path is written `'\''`.
- An observation is one line.
- With the command, the session tells the user to type each observation after taking its action and not to paste several lines. The script takes each pasted line as the observation of the next action.
- The user saves a longer output to a file, and the observation names that file.
- The record states which observation is the red before the user runs the script, since the script judges neither red nor green.
- When the user says the script has ended, the session counts the `Observed:` lines of the observations file against the actions.
- Fewer `Observed:` lines than actions is an unfinished run. The session asks the user to run the command again with a new observations file.
- Each run of the red command that the steps ask for, the three runs of Steps 4 and each later run, is one run of the script with a new observations file.
- Before the cleanup of Steps 22, the session quotes the observations file whole in the record's "Red command" section, with each secret in it written `<REDACTED>`.
- The exit statuses and the messages are in the script's head comment, and this file does not repeat them.
