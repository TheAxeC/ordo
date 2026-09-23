# Step 2 refuter

## Verification lines

Run from `.agents/worktrees/2-2` with `PYTHONDONTWRITEBYTECODE=1`, every command of `docs/dev/building.md` as changed:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
(ten ok: lines) layout exit 0
ascii exit 0
```

`git status --short` afterwards: ` M README.md`, ` M docs/dev/building.md`, ` M docs/dev/change-standard.md`.

## Spec

1. README.md:122: the "passes" list leaves out behaviour the test covers and a reader needs: sections of skills not named on the command line are not read (test.sh:52-53, control `gamma-named`), the same file name in two sections, a skill given twice checked once, a backtick in a fence's info string opening no fence, and the dotted lettered form `6.B.` failing. Fix: add them.
2. README.md:122: "It also checks the usage errors that exit 2" claims all of them, but the test covers seven of the script's cases (no skill argument, a missing skills root, a missing skill folder, a missing list, a missing roadmap, a list that is not UTF-8, a list outside a git repository), not a roadmap that is not UTF-8 or a failed find. Fix: list the seven.
3. README.md:122: "a skill named twice, an empty cell" reads as any table's empty cell; both cases are in New skills. Fix: "a skill named twice in it, or an empty cell in it".

Items 1 to 3 are at README.md:112 and :122, building.md:13, change-standard.md:49; item 4 is absent from the worktree as the brief expects; no place listing the tests was missed.

## Proof

none. The line counts, the diff stat, the ASCII scan, the grep's seven hits, the 7-to-8 counts and the verify lines reproduce.

## Standards

none.

## Behaviour

none.

## Not checked

- Item 4, the `verify` line, written on main at landing.
- Whether every test case goes red with its revert: step 1's scope.

Reviewer usage: 77,262 tokens, 18 tool uses, 167 seconds (from the task notification).

## Repair round 1, refuted

### Verification lines

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
(all eight tests exit 0)
layout exit 0, 10 ok: lines
ascii exit 0
```

The round's delta is the one `check_coverage.test.sh` bullet at README.md:122. Spec 2 and Spec 3 of the first run are closed; Spec 1 is closed for the unread sections, the same file name in two sections and the backtick info string, with the two items below.

### Spec

1. README.md:122: "a skill named twice on the command line and checked once" sits among the passing cases, but `repeated-skill` runs on a failing list and asserts its error is printed once. Fix: a separate clause.
2. README.md:122: "an entry ... written with a trailing dot after its letter": the dot is in the roadmap heading (`## 6.B. `), not in the New skills entry (`6.B`). Fix: say the entry's roadmap heading is written with the dot.
3. README.md:122: "a wrong cell count, table header or separator": the test covers only a missing separator row. Fix: "a missing separator row".

### Proof

none.

### Standards

none.

### Behaviour

none.

### Not checked

- Item 4, the `verify` line, written on main at landing.
- `6.B.` written in New skills, and a separator row present but malformed: not in the test.

Reviewer usage: 63,707 tokens, 12 tool uses, 169 seconds (from the task notification).

## Closed

- First run: every finding closed in repair round 1; the closures are in `2-report.md`, "Repair round 1".
- Run over the round, fixed at landing in README.md:122:
  - Spec 1: "; a skill named twice on the command line is checked once, so each of its errors is printed once", out of the passing list.
  - Spec 2: "an entry that is not in the roadmap, including one whose roadmap heading is written with a trailing dot after its letter (`## 6.B.`)".
  - Spec 3: "a wrong cell count or table header, a missing separator row".
