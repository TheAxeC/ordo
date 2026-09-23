# Step 9 report: plan-help restyled

Everything in the brief is done, and beyond it, by the orchestrator's ruling in plan.md, the inventory check accepts a row naming one heading line.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/plan-help` | DONE | `ok: skills/plan-help/SKILL.md` |
| 2 | `python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-help.md` | DONE | `ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md` |
| 3 | the printed block against the old one: `diff` of the two blocks, from the `/repo-setup` line to the closing fence | DONE | no output, exit 0; 27 lines each |
| 4 | the verify list | DONE | seven `PASS:` lines; the ASCII check prints nothing, exit 0 |

Files, after the repair round: `skills/plan-help/SKILL.md`, 47 lines before, 91 after; `utils/check_rule_inventory.py` 393 lines and its test 479 (a row may name one heading line); `README.md` one phrase; the inventory, 49 lines, 42 body rows.

Sections before: The sequence, printed verbatim; The position, for `<entry>`. After: Quick start; Use instead (three); What it reads (three); Steps (three: print the sequence, print the position, print the next command); The sequence, printed verbatim (the block byte for byte); Stops (a "No stop" row, then two refusals); Anti-patterns (one); Rules (one).

The grep for the removed section name over skills, utils, docs and README.md, and its output (nothing):

```
$ grep -rn -E 'The position, for' skills utils docs README.md | grep -v '^skills/plan-help/'

```

What a user reads differently, before and after: the reading, the refusals and "writes nothing" were the opening paragraphs; after, What it reads, Stops and Rules, and the opening paragraph says what the skill prints. The printed sequence, the position and the next-command line, printed only for `/plan-help <entry>`, are the same.

Judgment calls:

- "Printed verbatim" is stated by the section's heading, kept as it was, and by Anti-patterns 1; the heading lines that carry a rule (14, "printed verbatim", and 45, "for `<entry>`") have rows of their own, which the inventory check now allows.

## Repair round 1

Every finding of `9-refuter.md` is closed; none is booked. After the round: both checks print `ok:`, the printed block is still 27 lines and unchanged, the seven tests print `PASS:`, the ASCII check is clean.

| Finding | Closure |
|---|---|
| Step 3 printed the next command for `/plan-help` without an entry | "For `/plan-help <entry>`, print one line from that position" |
| "It writes nothing" in the opening and in Rules | Only in Rules |
| The rules the old headings carried had no inventory row | `utils/check_rule_inventory.py` accepts a row whose range is one heading line alone, a range from a heading into text below it still being an error; case heading-row passes, and with the change reverted the test prints `FAIL: heading-row: expected a pass`; the inventory has rows for old lines 14 and 45; the README's description of the test names it |
| "by hand" added to the opening | "the command sequence for running a plan step by step", the old words |
| "step files" undefined | "the brief, the report and the refuter report of the step in flight" |
| The report said "writes nothing" moved out of the opening, which it had not | It has now, and the report says so |

At landing: case heading-blank added (a heading and the blank after it is still an error). The control for heading-row, run with the one-line condition widened to any range: `FAIL: with-heading: missing [old lines 11-13 hold a heading at 11]`. With the change reverted: `FAIL: heading-row: expected a pass`. Row 45 of the inventory is two rows, Steps 2 and Steps 3.
