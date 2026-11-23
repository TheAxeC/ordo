# 0046. wizard runs the commands a stage needs, each shown and confirmed first

Status: proposed

## Context

ADR 0045 makes `wizard` a copy of its source: a script for the actions only a person can take, with a library that opens a URL, prints instructions, reads a value and writes it. The source's rule that the skill is not for actions the agent can perform itself is about the session that writes the script. A setup script is run later, by another person or on another machine, where no session can act. A setup there mixes both kinds of stage: a tool to install with a command, and a key to copy from a dashboard. The copy can write only the second kind, so it splits such a setup or refuses half of it. The run of roadmap entry 18's gate wrote a script the user judged good, and the next setup the user named for the skill installs a tool.

## Decision

`wizard` also writes stages that run commands. The library of `templates/template.sh` keeps the source's helpers as ADR 0045 leaves them and gains three things: a check whether a tool is installed, a helper that runs one command, and the operating system the script runs on. The helper shows the command, asks the person for a yes, runs it only on a yes, and ends the script with the command's status when the command fails. No command runs without being shown and confirmed. The skill is not for an action the session can take itself, now, on the machine it runs on. The library's added helpers have a test.

## Alternatives rejected

- `wizard` kept as the copy: a setup that installs a tool is split between the wizard and a second script, and the person follows two.
- A second skill for setups that install things: two skills would share one library and one stage list, and the user would choose between them for a setup that needs both.
- A helper that runs a command without asking: a script that installs things can leave a machine in a state the person did not choose.

## Consequences

One script covers a whole setup. The library differs from the source's by its added helpers, so a later change of the source is carried over by hand. A stage that runs a command names the tool it installs, so a second run skips what is installed.
