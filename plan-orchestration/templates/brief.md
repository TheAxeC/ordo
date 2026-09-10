# Brief: <package>, <what it delivers in one line>

Read `../spec.md` first; it governs this package unchanged<, with one difference: <the difference, when the deliverable needs another toolchain or another executor>>.

## What to build

<the deliverable, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have>

## Read first, in full

1. <path>: <what the agent takes from it>.
2. <path>: <what the agent takes from it, and what it must not take>.

## What it must do

<the behaviour, in prose, section by section. Every count, path, name and claim here was checked on the tree with a grep or a probe before dispatch; a premise found wrong was corrected here rather than left for the agent.>

## Conventions

<the conventions specific to this deliverable, on top of the spec: character set, line shape, vocabulary that may not appear, anything a verification check below enforces>

## Verify before you report

Run from <directory>, each must hold:

1. `<command>` prints <expected output>.
2. `<command>`: <the threshold or the shape the output must have>.

## Report

First line: anything NOT done, or "Everything in the brief is done". Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, and anything in the brief that was wrong or impossible.
