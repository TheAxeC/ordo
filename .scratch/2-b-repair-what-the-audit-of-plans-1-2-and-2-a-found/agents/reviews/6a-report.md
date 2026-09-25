# Step 6a report

Everything in the brief is done.

## Open items of the state file

- none.

## Result

| Item | State | Command and its summary line |
|---|---|---|
| Cases turned into assertions and run on the unchanged collector | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1` on the unchanged collector: `FAIL: "- None." under "## 1. Spec" is not a finding with heading spec`; `collect_findings.py` over the cases file alone printed `0 findings` (the three item cases red, the unread-section and fence cases green) |
| 1. The collector keeps every item | DONE | `grep -n 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing' skills/plan-retro/templates/collect_findings.py` prints nothing (exit 1); `FIRST_SENTENCE` removed too, as nothing else used it; `NOT_READ` and the fence reading stay; the docstring names the parts not read (the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour, the five unread section names, fences), says every other item is a finding whatever its text says, and that the retro sets aside by reading one that reports no defect or a closure that holds |
| 2. The tests | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1`: `PASS: collect_findings.py scratch tests` |
| 3. The retro skill sets aside by reading | DONE | `python3 utils/check_skill_layout.py`: `ok: skills/plan-retro/SKILL.md`; Grouping, Steps 1's first bullet and Steps 8 changed; `templates/retro.md` changed only where it disagreed (the counts by heading) |
| 4. The README bullet | DONE | `README.md:119` is one sentence; no other README line changed |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: 10 `PASS:` lines, 10 `ok:` lines (`grep -c` over its output), last line `verify: 12 commands passed`, exit 0 |
| Verify 2 | DONE | the two commands above: `PASS: collect_findings.py scratch tests`, and the grep prints nothing |
| Verify 3 | DONE | the planted faults below |

## Planted faults

Each on a copy of `collect_findings.py` and `collect_findings.test.sh` in a `mktemp -d "$TMPDIR/plant6a.XXXXXX"` folder, then `sh <copy>/collect_findings.test.sh 2>&1 | grep -m1 -A2 '^FAIL:'`. The three filters are put back as the constant plus an `if <filter>: continue` as the first line of the item loop in `findings`:

- `NOTHING_FOUND` drop (`NOTHING_FOUND.match(item.strip())`): `FAIL: "- None." under "## 1. Spec" is not a finding with heading spec`
- `OTHERS_REPRODUCE` drop (`OTHERS_REPRODUCE.fullmatch(FIRST_SENTENCE.match(item.strip()).group(1))`): `FAIL: "- The other figures reproduce." under "## 2. Proof" is not a proof finding`
- `CLOSURE` drop (`fixed is None and CLOSURE.search(item)`): `FAIL: "- Spec 1: closed." in a round with no subheadings is not an unclassified finding`
- `ITEM` narrowed to one digit (`r"(- |\d[.)] )"`): `FAIL: rows differ from the expected rows (- expected, + got):` then `- three-plan 6 first spec src/h.py:8`
- `Proof` removed from `TRAILING`: `FAIL: rows differ from the expected rows (- expected, + got):` then `- one-plan 1 round 1 proof src/a.cpp:40` and `+ one-plan 1 round 1 unclassified src/a.cpp:40`
- `Standards` removed from `TRAILING`: `FAIL: rows differ from the expected rows (- expected, + got):` then `- one-plan 1 round 1 standards src/a.cpp:50` and `+ one-plan 1 round 1 unclassified src/a.cpp:50`

The silent cases (Verification, Not checked, Usage and Closed lists, and a fence under `## 1. Spec`, all in the same cases file) are held by an exact comparison of the cases file's rows with the three findings; their control is the three items the same file reads under Spec, Proof and the round. The `closed` entry of `NOT_READ` is held by the `### Closed` subsection of report 3's subheaded round: with `closed` removed from `NOT_READ`, the test prints `FAIL: rows differ from the expected rows (- expected, + got):` then `+ two-plan 3 round 1 unclassified src/c.py:7`.

## Files

| File | Lines (`wc -l`) before | after |
|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 293 | 270 |
| `skills/plan-retro/templates/collect_findings.test.sh` | 459 | 474 |
| `skills/plan-retro/SKILL.md` | 110 | 111 |
| `skills/plan-retro/templates/retro.md` | 40 | 42 |
| `README.md` | 175 | 175 (line 119 only) |

Test fixtures removed: the `- none.` and `- None. Nothing changes for a user.` items of report 1 (the Proof section's fence stays, the empty `## 4. Behaviour` section goes), its round's `: closed`, `Closures checked` and `Checked and holding` items, report 2's `## Proof` with `- none.`, report 3's `## Behaviour` with `1. none.` and its round's `### Standards` with `- none.`, and the whole `5-refuter.md` fixture with its five expected rows. Besides the dropped forms, `5-refuter.md` held the only items numbered with two digits (`10.` to `15.`) and the only round item taking its kind from a trailing `Proof.`; both now live in the remaining fixtures: `10. src/h.py:8` in `6-refuter.md`'s `## Spec:` section, and the round items `src/a.cpp:40 ... Proof.` and `src/a.cpp:50 ... Standards.` in report 1's round without subheadings, each with its expected row. The head comment names the cases file, the two-digit item number and the four trailing heading words. Every other case stays and passes.

## User-visible changes

- Collector output: before, an item opening with "none", "nothing", "no finding", "no defect", "otherwise none" or "checked, no defect", an item saying only that the other figures reproduce, and a round item holding ": closed" or opening with "Closed", "Closures checked" or "Checked and holding" gave no JSON line; after, each gives a finding like any other item.
- Collector count over this worktree's ledger, `python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive`: before `687 findings` (the base collector at 819b391, as the review measured it); after `705 findings` (run here), by heading spec 266, standards 165, proof 147, behaviour 126, unclassified 1.
- `SKILL.md` Steps 1, first bullet: before "It prints one JSON line per finding: plan, step, report, run, heading, location, text."; after "It prints one JSON line per finding, every item it keeps as "Grouping" says: plan, step, report, run, heading, location, text."
- `SKILL.md` Steps 8: before "The counts by heading." and "Then the findings set aside as "no defect", each with ..."; after "The counts by heading, of the findings left after the "no defect" set-aside." and "Then the findings set aside as "no defect", with their own count, each with ...".
- `SKILL.md` Grouping: before, one bullet setting aside a finding that reports no defect; after, one bullet saying the collector keeps as a finding, whatever its text says, every top-level item under the four headings and every item of a repair round outside the parts it does not read (the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour, the Verification, Not checked, Closed, Closures and Usage lists, fenced lines), and one saying a finding whose text reports no defect or a closure that holds is set aside, by reading, as the kind "no defect", counted and listed in the "No defect" section with no proposal.
- `templates/retro.md` "Counts by heading": before, the table alone; after, the line "The findings left after the "no defect" set-aside, by the heading they fell under." above it. The "No defect" section already gives its own count.
- `README.md:119`: before, thirteen sentences listing the shapes, including "a closure that holds, or an item in one of the forms that report nothing" and "each near miss of those forms"; after, one sentence: the test checks that every item under the four headings, and every item of a repair round outside the parts the collector does not read, is a finding whatever its text says, that those parts (named) and fenced lines give none, and that `--exclude-listed` skips the listed runs and refuses a retro it cannot use.

## Brief

Nothing in the brief was wrong. Each of the five cases holds under the brief's rules: "Spec 1: closed." does not end in a heading word followed by a full stop and does not say "not reproduced", so it is `unclassified`, as decision 2 says.

Change-standard rule 14 grep: `grep -rn -i 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing\|FIRST_SENTENCE\|reports nothing\|no defect\|closure' skills utils docs README.md`. Its output: the removed names appear nowhere; "closure" or "no defect" appears in `collect_findings.test.sh:12,168,177`, `collect_findings.py:18,21,45`, `plan-retro/SKILL.md:51,57,59,60,74,75`, `plan-retro/templates/retro.md:11,38`, `refute/SKILL.md:62,65`, `refute/templates/report.md:38`, `plan/templates/orchestrator-state.md:36`, `docs/roadmap.md:23,43`, `README.md:119` and `docs/academic-coverage.md:84,85,95,99,190,193` (the last six and `roadmap.md:43` match "disclosure"). None of these is made false by the change: the `refute` lines describe what the refuter writes, and an item such as `report.md:38`'s "Or: none." now reaches the retro, which sets it aside as Grouping says.

## Repair round 1

| Ruling | State | What closes it |
|---|---|---|
| 1. Proof 1, two-digit item number | DONE | `10. src/h.py:8: an item numbered with two digits.` in `6-refuter.md` with the row `three-plan 6 first spec src/h.py:8`; the `ITEM` revert turns the test red (Planted faults) |
| 2. Proof 2, trailing `Proof.` and `Standards.` in a round | DONE | round items `src/a.cpp:40 ... Proof.` and `src/a.cpp:50 ... Standards.` in report 1's round without subheadings, rows `one-plan 1 round 1 proof src/a.cpp:40` and `one-plan 1 round 1 standards src/a.cpp:50`; each `TRAILING` revert turns the test red (Planted faults) |
| 3. Proof 3, what the removed fixtures covered | DONE | "Files" names the two coverages `5-refuter.md` carried besides the dropped forms and where each now lives |
| 4. Standards 1, "in a repair round" | DONE | `README.md:119` says "every item of a repair round outside the parts the collector does not read" and names those parts; `SKILL.md:74` names them; the docstring names the list before a subheaded round's subheadings and says "Every other item is a finding" after naming the unread parts |
| 5. Standards 2, the grep quoted | DONE | "Brief" quotes the command and its output |
| 6. Behaviour 1, the count and the counts by heading | DONE | "User-visible changes" gives 687 before and 705 after with the split by heading; `SKILL.md` Steps 8 and `templates/retro.md` say the counts by heading count the findings left after the "no defect" set-aside and that the "No defect" section gives its own count |

The reverts' red lines are those under "Planted faults": `ITEM` gives `- three-plan 6 first spec src/h.py:8`, `Proof` gives `- one-plan 1 round 1 proof src/a.cpp:40`, `Standards` gives `- one-plan 1 round 1 standards src/a.cpp:50`, each after `FAIL: rows differ from the expected rows (- expected, + got):`. The verify list rerun after the round: 10 `PASS:` lines, 10 `ok:` lines, `verify: 12 commands passed`, exit 0.
