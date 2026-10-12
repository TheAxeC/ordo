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

## 5. The guide's install line and its test

- Status: [ ]
- Goal: The opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`. A test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`.
- Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (line 3 is the opening paragraph); `sh tests/guide.test.sh` prints `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1.
- Waits on: nothing.

## 3. The guide's usage line and its FAQ

- Status: [ ]
- Goal: The opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run. `docs/faq.md` holds two questions about the guide.
- Gate: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (the usage sentence is the sentence right after the install sentence, in the opening paragraph); `head -1 docs/faq.md` prints `# FAQ`; `grep -c '^## .*?$' docs/faq.md` prints 2; each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it.
- Waits on: nothing.

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
