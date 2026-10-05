# Brief: <step>, <what it delivers in one line>

Read `<rules file from plan.yaml>` first; its rules govern this step unchanged. Then, in full: <the standards the configuration lists>, and the ADRs this brief names under "What is on the tree".

A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it.

## What is on the tree (read on main at <commit>)

- <each fact the step rests on: the file, the count, the name, the line number in code or the section of a page, and the command that checked it>.
- <each ADR the step touches: its number, its title and the sentence of its decision the step is under; or that no ADR touches the step>.

## What to build

<what must hold when the part is done, in the brief's own words>

<each file the part touches, with the constraint it is under: path, purpose, size limit, the shape it must have>

<the behaviour the part has>

<text word for word, only where the wording itself is the requirement, such as a rule sentence the user ruled>

## Cases

- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.
- <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), with its expected result; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.
- <for a script, each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected>.

The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted.

- A case of a code step (a script, or a product's code) becomes a test of the step only when the rules file's test rule calls for a test of it.
- A case kept as a test is run on the unchanged tree first.
- No prototype script stands in for such a test.
- Every other case of a code step is checked by a run the report quotes, and no test is kept for it.
- A case of a text or judgment step is checked by reading the unchanged tree.
- The first read of a text or judgment case is noted.

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
4. Each new or changed test is run on the unchanged tree and after the change.
   - A test of a behaviour the change adds or changes fails on the unchanged tree, in the form it has after its last change, and the report quotes that failure.
   - A test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs.
   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.
   - The reviewer finds such a test by reading it.
   - A case checked by a quoted run is no test and is not judged as one.
5. Each new or changed list item and sentence is read against the standards pages' rules on list items and sentence length, and each place it departs from them is named in the report with why it needs its form.

## Report

Write it to `<ledger>/agents/reviews/<step>-report.md`, with these parts in this order.

- The first line: anything NOT done, or "Everything in the brief is done".
- The open items of the state file, verbatim, which hold only what the user must rule on.
- The cases' first run: every case of "Cases" by its name, none left out, each with the command or the reading that checked it and its output as printed, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling.
- The DONE / NOT DONE table with the checks above and their output as printed, the character-set check's line and its exit status included when the verify list holds one.
  - A line shortened with "..." is not verbatim.
- The terms: each term of `docs/glossary.md` the diff adds, changes or uses in a new place, each use read against the entry, and each changed entry's "Stated in" checked by `grep -n` of the term in the section it names.
- The files with line counts.
- Every judgment call the brief left open.
- Every host- or user-visible change with its before and after.
- Anything in the brief that was wrong or impossible, with the evidence.
- A section "Doc text", when the brief keeps a shared document out of the step's paths because other steps run beside it.
  - It gives the exact lines for that document: the current line as `grep -n` prints it and its replacement, or the line a new one follows.
  - The orchestrator applies them at landing.
