# Brief: <step>, <what it delivers in one line>

Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>.

## What is on the tree (read on main at <commit>)

- <each fact the step rests on: the file, the count, the name, the line number, and the command that checked it>.

## What to build

<the deliverable, in the brief's own words, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have>

## Cases

- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.

The builder's first task, before any code changes: turn every case above into a test of the step, run the tests against the unchanged tree, and note each case's result. No prototype script stands in for the tests.

When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any code, and hands back the first run and that case, with the rule and the result it gives. The orchestrator rules on the case and resumes the builder with the ruling, and the final report carries it.

## Paths this step writes

- `<path>`
- `<path>` lines <a>-<b>
- `<ledger>/agents/reviews/<step>-report.md`

One path per line: a whole file, or a range of lines of a shared document, numbered as on main at the base. The step writes these paths and nothing else.

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

1. The plan's verify list, run through the `land` skill's `templates/verify.sh` from the root of the checkout it checks as `sh <skills>/land/templates/verify.sh <state file>`, where `<skills>` is the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, prints <the `PASS:` line of each command piped into `tail`, the whole output of each other command, then `verify: <n> commands passed`> and exits 0; the lines it prints are what the report quotes.
2. `<command>` prints <expected output>.
3. `<command>`: <the threshold or the shape the output must have>.
4. Each new or changed test names the revert that turns it red. A test that no revert turns red is an audit, not a proof, and this brief says which it is.

## Report

Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the cases' first run: each case of "Cases" with its result on the unchanged tree, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
