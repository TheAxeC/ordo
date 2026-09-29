# Brief: <step>, <what it delivers in one line>

Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>.

A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it.

## What is on the tree (read on main at <commit>)

- <each fact the step rests on: the file, the count, the name, the line number in code or the section of a page, and the command that checked it>.

## What to build

<the deliverable, in the brief's own words, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have>

## Cases

- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.
- <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), with its expected result; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.

The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted. A case of a code step (a script, or a product's code) becomes a test of the step, run on the unchanged tree first; no prototype script stands in for the test. A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted.

When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any code, and hands back the first run and that case, with the rule and the result it gives. The orchestrator rules on the case and resumes the builder with the ruling, and the final report carries it.

## Paths this step writes

- `<path>`
- `<path>` lines <a>-<b>
- `<ledger>/agents/reviews/<step>-report.md`

One path per line: a whole file, or a range of lines of a shared document, numbered as on main at the base. The step writes these paths and nothing else.

## Decisions taken in this brief (each reversible, none silent)

1. <a choice the plan left open, taken here so the builder does not take it; a user-visible one went to the user before this brief was written>. <For a format or a rule applied across the tree: five real cases from the tree, each input and its output under the decision.>

## Libraries checked

<under `libraries: check`: each candidate with its version, license, maintainer, last release, compatibility with the project's dependencies, what it would replace and what stays hand-written, and the library the user ruled; or "none found". Under `libraries: avoid`: "No new dependency: the project's `libraries` is `avoid`.">

The builder adds no dependency this brief does not name. A library the builder finds that would cover its work is reported, not installed.

## Read, with sections or line ranges

1. <path> <the section of a page, or the lines of code>: <what the builder takes from it>.
2. <path> whole: <what the builder takes from it, and what it must not take>.

## What it must do

<the behaviour, section by section; every count, path, name and claim here was checked on the tree before dispatch>

## Conventions

<the conventions specific to this deliverable, on top of the rules file: character set, line shape, vocabulary that may not appear, anything a verification check below enforces>

## Verify before you report

Run from <directory>, each must hold, each output piped through the filter the rules file names:

1. The plan's verify list, run through the `land` skill's `templates/checks.sh` from the root of the checkout it checks as `sh <the land skill's folder>/templates/checks.sh <state file>`, prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and exits 0; the lines it prints are what the report quotes.
2. `<command>` prints <expected output>.
3. `<command>`: <the threshold or the shape the output must have>.
4. Each new or changed test names the revert that turns it red. A test that no revert turns red is an audit, not a proof, and this brief says which it is.

## Report

Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the cases' first run: each case of "Cases" with its result on the unchanged tree, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
