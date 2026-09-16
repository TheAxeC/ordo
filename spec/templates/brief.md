# Brief: <step>, <what it delivers in one line>

Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>.

## What is on the tree (read on main at <commit>)

- <each fact the step rests on: the file, the count, the name, the line number, and the command that checked it>.

## What to build

<the deliverable, in the brief's own words, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have>

## Decisions taken in this brief (each reversible, none silent)

1. <a choice the plan left open, taken here so the builder does not take it; a user-visible one went to the user before this brief was written>.

## Read, with line ranges

1. <path> <lines>: <what the builder takes from it>.
2. <path> whole: <what the builder takes from it, and what it must not take>.

## What it must do

<the behaviour, section by section; every count, path, name and claim here was checked on the tree before dispatch>

## Conventions

<the conventions specific to this deliverable, on top of the rules file: character set, line shape, vocabulary that may not appear, anything a verification check below enforces>

## Verify before you report

Run from <directory>, each must hold, each output piped through the filter the rules file names:

1. `<command>` prints <expected output>.
2. `<command>`: <the threshold or the shape the output must have>.
3. Each new or changed test names the revert that turns it red. A test that no revert turns red is an audit, not a proof, and this brief says which it is.

## Report

Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change, and anything in the brief that was wrong or impossible, with the evidence.
