# Roadmap

What is open, in the order it is built, and what is done. An entry is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`).

Status: `[ ]` open, `[~]` in progress, `[x]` done (its gate ran and passed, with the output beside it).

# Open, in execution order

<!-- An entry:

## <n>. <title>

- Status: [ ]
- Goal: <what exists when it is done, in one or two sentences>
- Gate: <the command, the test and what it asserts, or the observable result>
- Waits on: <entry numbers with the reason, or nothing>
-->

## 1. One layout for every skill

- Status: [ ]
- Goal: A written skill layout standard, `docs/dev/skill-layout.md` (the section order Quick start, Use instead, What it reads, Steps, Stops, Anti-patterns, Rules; a table where the content is a table; one rule per bullet), and all ten skills under `skills/` rewritten to it with no rule lost or changed in meaning.
- Gate: you approve `docs/dev/skill-layout.md`; a layout check over every `skills/*/SKILL.md` exits 0, and its test fails on a skill with a section missing or out of order; each skill's rule inventory (one line per rule of the old file) maps every rule to its place in the new file, the inventory check exits 0, and its test fails on a rule with no place; `/refute` on each step finds no rule dropped or changed in meaning; every command in `docs/dev/building.md` passes and `npx skills add . --list` lists the ten skills.
- Waits on: nothing.

# Done

<!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->

# Dropped

<!-- - <n>. <title>: <the reason> -->
