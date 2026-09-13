# Brief: <package>, <what it delivers in one line>

Read `../spec.md` first; it governs this package unchanged. <When the deliverable needs another toolchain or another executor, that is not a difference this brief declares: it is an amendment to the spec, made by the orchestrator before dispatch, and this line then reads "it governs this package unchanged" again.>

## What is on the tree (read on main at <commit>)

- <the files, counts, names and line numbers the package rests on, each checked with a grep or a probe when this brief was written; the line numbers are what "Facts to check" below re-checks at dispatch>.

## What to build

<the deliverable, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have; for a tool with layers, how each thing lives in every layer>

## Decisions taken in this brief (each reversible, none silent)

1. <a choice the plan and the spec left open, taken here so the worker does not take it; a user-visible one went to the user before this brief was written>.

## Read, with line ranges

1. <path> <lines>: <what the agent takes from it>.
2. <path> whole: <what the agent takes from it, and what it must not take>.

## Facts to check on the tree before dispatch

<written on main at <commit>; at dispatch the orchestrator re-checks every count, path, name and line number above with a grep or a probe and corrects the brief, never the worker>

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
