# Report of step 2 of plan 2.1, the gate clauses of entries 3, 4, 7, 8 and 16

NOT DONE: C1 does not hold as the brief states it. `grep -c planted docs/roadmap.md` prints 1 after the change, not 0: line 234, the done-record of entry 2.B, contains the word "planted" (`each planted again in a copy`). That line is outside "Paths this step writes" and no item of the brief changes it, so it is left as it is and reported here as a stop for the orchestrator. Items 1 to 5 are all made.

## Open items of the state file

none

## First read of the cases, on the unchanged tree (HEAD 132fce8, `git status --short` empty)

- C1: `grep -c planted docs/roadmap.md` printed 2. `grep -n planted docs/roadmap.md` shows line 60 (entry 3's gate, six occurrences) and line 234 (entry 2.B's done-record, one occurrence: "each planted again in a copy"). The brief's premise that the word stands only in entry 3's gate is wrong by line 234.
- C2: the five gate lines read at lines 60, 67, 95, 102 and 158 as the brief quotes them; each of the quoted strings of items 1 to 5 occurs exactly once in its line.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. Entry 3 (line 60): three removals and one replacement | DONE | Before and after below; each old string asserted to occur once in line 60 before it was replaced |
| 2. Entry 4 (line 67) | DONE | Line 67 now reads `- Gate: one real run on a real diff that you review.` |
| 3. Entry 7 (line 95) | DONE | Before and after below |
| 4. Entry 8 (line 102) | DONE | Line 102 now reads `the checks for limits and required sections pass their tests; a side-by-side run ...` |
| 5. Entry 16 (line 158) | DONE | Line 158 now ends `Nothing of it is done without that permission. `utils/check_coverage.py` and its mention in `docs/dev/scripts.md` are deleted.` |
| C1 | NOT DONE | `grep -c planted docs/roadmap.md` prints `1`; the remaining hit is line 234 (see the stop below) |
| C2 | DONE | The five lines read after the change, below: each holds the words of its item and every other word it had; `;` is neither doubled nor dangling in any |
| Verify 2 | DONE | `LC_ALL=C grep -n '[^ -~]' docs/roadmap.md` printed nothing (rc=1) |
| Verify 3 | DONE | `git diff --numstat` printed `5 5 docs/roadmap.md` and no other line |

## Stop for the orchestrator

Line 234 of `docs/roadmap.md` (entry 2.B, marked `[x]`) holds "each planted again in a copy" inside the record of the 38 faults of the checkers review. Whether that record is rewritten so that C1 reads 0, or C1 is changed to read the gate lines only, is the orchestrator's; the builder chose neither. Rule 4 of the change standard: a premise found wrong is reported with the evidence, and the rest of the brief still lands.

## Files changed

- `docs/roadmap.md`: 5 lines added, 5 removed (lines 60, 67, 95, 102, 158).
- `.scratch/2-1-scripts-cut-to-their-jobs/agents/reviews/2-report.md`: this report.

## Judgment calls

None. The one decision of the brief (entry 16's clause as a sentence of its own) is followed as written.

## User-visible changes, before and after

### Line 60 before

```
- Gate: `/writing` run on a real manuscript of yours whose `.tex` has `\input` files, and on a real `.docx` grant of yours, reports its findings; two fresh reviewer agents each mark each one right or wrong, on copies of the two files, and each one not marked right by both is fixed in the rules or the skill before the gate passes; `/writing` run on one text holding one planted break of each rule of `references/`, and on one clean text, names every planted break and nothing in the clean text, checked by reading its report; the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, apart from what the entry's rulings leave out, checked by reading both; the skill follows `docs/dev/skill-layout.md`; section C of the `repo-setup` skill's `templates/docs/dev/prose-standard.md` holds the openers "In today's rapidly evolving..." and "As a matter of fact...", checked by reading it; the term **finding** in the `repo-setup` skill's `templates/plan-terms.md` holds its sense for `/writing`, checked by reading it, and `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` exits 0; of the planted breaks, at least one stands in an `\input` file of a `.tex` main file and at least one in a `.docx`, and each is named at its place in the file that holds it; the report is grouped by rule, the most consequential first, checked by reading it; the run's transcript shows the review made by one fresh agent that edits no file; the planted text also holds one break of a prose standard rule and one passage where an academic rule and the prose standard differ, and the report names the first and follows the prose standard on the second; the planted text is run once as a `.md` and once as a `.txt`, with the same findings; every finding in every report quotes its passage and proposes a replacement, checked by reading the reports.
```

### Line 60 after

```
- Gate: `/writing` run on a real manuscript of yours whose `.tex` has `\input` files, and on a real `.docx` grant of yours, reports its findings; two fresh reviewer agents each mark each one right or wrong, on copies of the two files, and each one not marked right by both is fixed in the rules or the skill before the gate passes; the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, apart from what the entry's rulings leave out, checked by reading both; the skill follows `docs/dev/skill-layout.md`; section C of the `repo-setup` skill's `templates/docs/dev/prose-standard.md` holds the openers "In today's rapidly evolving..." and "As a matter of fact...", checked by reading it; the term **finding** in the `repo-setup` skill's `templates/plan-terms.md` holds its sense for `/writing`, checked by reading it, and `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` exits 0; each finding of the two real runs is named at its place in the file that holds it, an `\input` file of the `.tex` included; the report is grouped by rule, the most consequential first, checked by reading it; the run's transcript shows the review made by one fresh agent that edits no file; every finding in every report quotes its passage and proposes a replacement, checked by reading the reports.
```

### Line 67 before

```
- Gate: its check flags history words, step numbers, dates and non-ASCII in the comments of one sample diff that plants one of each, and nothing in a clean diff; one real run on a real diff that you review.
```

### Line 67 after

```
- Gate: one real run on a real diff that you review.
```

### Line 95 before

```
- Gate: every referee point has a response and a pointer to its change; each referee point has a verdict, judged by reading the response and the manuscript: addressed, partly, not, or cannot be checked from the manuscript; a check that no point is left unanswered, with a test that fails on a missing response; a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: rebuttal` row that the file of `skills/rebuttal/` the row names holds what the source file did, checked by reading both.
```

### Line 95 after

```
- Gate: every referee point has a response and a pointer to its change; each referee point has a verdict, judged by reading the response and the manuscript: addressed, partly, not, or cannot be checked from the manuscript; a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: rebuttal` row that the file of `skills/rebuttal/` the row names holds what the source file did, checked by reading both.
```

### Line 102 before

```
- Gate: the checks for limits, required sections and the statement text pass their tests; a side-by-side run on a section of a past application, compared with what was submitted.
```

### Line 102 after

```
- Gate: the checks for limits and required sections pass their tests; a side-by-side run on a section of a past application, compared with what was submitted.
```

### Line 158 before

```
- Gate: with the user's explicit permission, asked for before any of it: your global `CLAUDE.md` and `research-hub/CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `research-hub/tools/manuscript` points at `paper`. Nothing of it is done without that permission.
```

### Line 158 after

```
- Gate: with the user's explicit permission, asked for before any of it: your global `CLAUDE.md` and `research-hub/CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `research-hub/tools/manuscript` points at `paper`. Nothing of it is done without that permission. `utils/check_coverage.py` and its mention in `docs/dev/scripts.md` are deleted.
```
