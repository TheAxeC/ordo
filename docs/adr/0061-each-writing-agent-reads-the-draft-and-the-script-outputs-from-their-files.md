# 0061. Each writing agent reads the draft and the script outputs from their files

Status: proposed

## Context

ADR 0013 has `/writing` start four fresh agents that change nothing, "each given in its prompt the draft's text, the script's facts and only its own rules". `skills/academic/writing/SKILL.md`, "Agent prompts", carried this out: each finding agent's prompt held the text of each file of the draft with its line numbers as `cat -n` prints them, or for a `.docx` the paragraphs `docx_paragraphs.py` prints, and the output of `prose_facts.py`. The checking agent's prompt held the same text and facts. Every agent was told to read no file. The session therefore copied the whole draft and the facts into four prompts. The session's own context and each prompt grew with the length of the draft, and a long draft was carried four times through the session.

## Decision

- `/writing` makes a temporary folder with `mktemp -d` once the draft's files are listed and before the scripts run.
- The output of `prose_facts.py` is written to a file in that folder, and for a `.docx` the output of `docx_paragraphs.py` to another.
- Each of the four agents is given the absolute paths of the draft's files, each with its path from the main file's folder, or for a `.docx` the path of the paragraphs file, and the path of the facts file, in place of their text.
- Each agent reads each of those files whole, a file longer than one read in consecutive parts up to its last line, and reads no other file.
- The rule texts stay in the prompts, as ADR 0013 gives them.
- The folder is removed with `rm -r` once the checking agent has ended and before the report is shown, since the report is the message that ends the turn, and on every refusal raised after the folder is made.

This supersedes ADR 0013 in the part "each given in its prompt the draft's text, the script's facts". The rest of ADR 0013 stands.

## Alternatives rejected

- The text pasted into each prompt (ADR 0013's form): the session copies the draft four times, and its context and each prompt grow with the draft.
- A run folder kept beside the draft: `/writing` leaves no file, by the user's ruling for this change.
- Each agent running the scripts itself: the agents run no command, and four agents would compute the same facts four times.

## Consequences

Each agent needs a read tool, which the runner's general-purpose agent, the agent ADRs 0030 and 0035 name, has. The facts are computed once and read by every agent from one file. Nothing is left behind after the report or after a refusal.
