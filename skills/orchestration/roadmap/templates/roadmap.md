# Roadmap

What is open, in the order it is built, what is not yet specified, and what is done. An entry of the open order is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`), and an entry that moves in from "Not yet specified" keeps its number.

The section "Not yet specified" holds work whose gate cannot yet be named, each entry with its goal and what must be known before its gate can be named. `/plan` refuses such an entry until `/roadmap add <entry>` names its gate and places it in the open order.

Status: `[ ]` open, `[~]` in progress, `[x]` done (its gate ran and passed, with the output beside it).

# Open, in execution order

<!-- An entry:

## <n>. <title>

- Status: [ ]
- Goal: <what exists when it is done, in one or two sentences>
- Gate: <the command, the test and what it asserts, or the observable result>
- Waits on: <entry numbers with the reason, or nothing>
-->

# Not yet specified

<!-- An entry:

## <n>. <title>

- Goal: <what exists when it is done, in one or two sentences>
- Must be known: <what must be known before its gate can be named>
-->

# Done

<!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->

# Dropped

<!-- - <n>. <title>: <the reason> -->
