# Step <step> brief check (on main at <commit>)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/<step>.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

- <each name the step changes (a file, a heading, a key, a function, a term)>: `<the grep command>`; each hit outside the brief's "Paths this step writes", as the command printed it, with whether the change makes it false and why. Or, for a name: no hit outside the paths.

Findings: <each hit the change makes false>. Or: none.

## 2. The step line

- <each part of the plan's step line>: <the item of "What to build" that serves it>; or no item.

Findings: <each part with no item>. Or: none.

## 3. Premises

- <each fact of the brief's "What is on the tree">: `<its command>`, what it printed now, and whether that matches what the brief says.

Findings: <each premise whose output differs from the brief, with both>. Or: none.

## 4. Cases and checks

- <each case of "Cases">: consistent with the rules file and the standards, or the rule it breaks, named with its file and section.

Findings: <each case inconsistent with the rules file or the standards>. Or: none.

## 5. The question

- <each case, the check on the step's line, and the check of each item of "What to build">: "could this pass without the goal being reached?", "the goal" being the part of the plan's goal the step delivers; yes or no, with the reason.

Findings: <each one that could pass without the goal being reached, with how>. Or: none.

## 6. Implied inputs

- <for a code step (a script, or a product's code): each input the step implies but never states, in the forms `templates/brief.md`'s "Cases" names>: listed under "Cases", or missing, with the expected result it should have. Or: not a code step.

Findings: <each implied input missing from "Cases">. Or: none.

## 7. ADRs

- <each `NNNN-*.md` record in the configured `adr` folder (`docs/adr` when the configuration block has none), for its part in force>: whether it touches the step, and for one that does, the sentence of its decision the step is under and whether the brief names it under "What is on the tree". Or: no record.

Findings: <each part of the brief that contradicts an ADR, with the ADR's sentence; each ADR the step touches that the brief does not name>. Or: none.

## Declined to judge

- <a point the agent did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.

Agent usage: <served model>, <tokens>, <tool uses>, <minutes>.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- <finding>: <the change to the brief, with its section>; or a stop, <the open item as the state file holds it>.
