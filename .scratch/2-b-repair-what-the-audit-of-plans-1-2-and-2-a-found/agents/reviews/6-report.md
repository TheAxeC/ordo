# Step 6 report: collect_findings.py reads the reports as the reviewers write them

Everything in the brief is done. Item 7's hand count and the collector differ by one item on plan 1 step 13 (line 78, "No sentence in README.md, docs/ or another skill is made false."), an item that reports no defect in a wording none of the forms covers. The orchestrator ruled at landing that the forms are not widened, since a general "No ..." form would also drop real findings, and that `plan-retro` sets such an item aside as the kind "no defect" (`6-refuter.md`, Closed). The collector's narrower forms and the complete list of such items are step 6a of `plan.md`.

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- none.

## Rulings and what closes them

| Ruling | State | What closes it | Proof |
|---|---|---|---|
| 1. Items that report nothing | DONE, with the stop below | `NOTHING_FOUND` and `OTHERS_REPRODUCE` in `collect_findings.py`, one documented list; `reports_nothing()` applies them to every item | reverts 20 to 26 (each form) and 27 to 30 (near misses), red; the hand count below |
| 2. Tilde fence longer than three, tab continuation | DONE | cases in `three-plan/6-refuter.md` of the test | reverts 18 and 19, red |
| 3. The report states the end state only | DONE | "The test, red first" in this report holds the final test's run against the base collector | this file |
| 4. `plan-retro` documents the refusals and the list form | DONE | `SKILL.md` Steps 1 (two bullets), Steps 8, Quick start, a Stops row and its bullet; `templates/retro.md` "Reports read" | `python3 utils/check_skill_layout.py skills/plan-retro` prints `ok:` |
| 5. A closure only when it says the closure holds | DONE | `CLOSURE` alternatives `^closed`, `^closures checked`, `^checked and holding`, `: closed` | reverts 6, 7 and 31, red |
| 6. Heading names; "none" plus any word or punctuation | DONE | `heading_name()`; `none\b` in `NOTHING_FOUND` | reverts 32, 33, 34 and 20, red |
| 7. Exclusion keyed by (plan folder name, step, run) | DONE | `listed()` reads entries `- \`<plan>/agents/reviews/<step>-refuter.md\`: <run>, ...`; `main` skips a finding whose triple is listed | reverts 35 to 46, red |

## Items that report no defect in wordings the forms do not cover

Ruling 1 asks the hand count to agree with the collector. On plan 1 step 13 it does not, at one item. Line 78, "No sentence in README.md, docs/ or another skill is made false.", reports nothing, but it opens with "No sentence", which is none of the ruled forms, so the collector emits it. The forms are not widened, since a general "No ..." would also drop real findings such as "No case uses a relative `--note`." (plan 2.A step 1, round 1, Proof 4); `plan-retro` sets such an item aside as the kind "no defect" (the orchestrator's ruling at landing, `6-refuter.md`, Closed).

Other items in the ledgers that report nothing in wordings the forms do not cover (a partial list; the complete one is step 6a), from the collector's output over `.scratch .scratch/archive` (`python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive`, rows read one by one):

- `archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md`, first, standards: "No sentence in README.md, docs/ or another skill is made false."
- `archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md`, first, spec: "No place listing the verify commands was missed (...)"
- `archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md`, round 1, proof: "... This bullet reports no defect in the check itself. Proof."
- `archive/1-one-layout-for-every-skill/agents/reviews/9-refuter.md`, round 1, behaviour: "skills/plan-help/SKILL.md:41: the Step 3 condition is closed. ... No finding here. Behaviour."
- `archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/1-refuter.md`, first, proof: "The report's four reverts reproduce; the other reverts tried go red."
- `archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md`, first, proof: "Every figure of the report reproduces (139 lines, ...)"
- `archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md`, first, standards: "No non-ASCII, dash asides, history words, reasons over two sentences or sentences over 35 words."
- `archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md`, round 1, standards: "No non-ASCII, dash asides, history, over-long reasons or sentences."
- `archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md`, round 1, behaviour: "Line 18 holds for every cross-skill split in the delta." and "The introduction's command names both skills and passes."

## The hand count

For each of the four reports counted, every item of its read sections was read in the report's text and listed by line number as a finding or as reporting nothing (1/11: line 59 is `- none.`, line 117 is the "Closures checked" item; 1/13: line 73 is "The other figures in the report reproduce", line 78 is "No sentence ... is made false"). The comparison locates each of the collector's rows at the item line whose text starts the row; it uses the collector's output only, not its predicates.

```python
hand = {
    a + "1-one-layout-for-every-skill/agents/reviews/11-refuter.md": {
        "findings": list(range(45, 56)) + [63, 64, 68, 69, 114, 115, 116],
        "nothing": [59, 117]},
    a + "1-one-layout-for-every-skill/agents/reviews/13-refuter.md": {
        "findings": list(range(57, 68)) + [71, 72, 77, 82, 83, 84, 126, 130, 134, 138],
        "nothing": [73, 78]},
    a + "2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md": {
        "findings": [66, 72, 81, 86, 97, 102, 109, 114, 164, 165, 166, 167, 168, 172, 176, 180, 181],
        "nothing": []},
    a + "2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md": {
        "findings": [9, 10, 11, 12, 16, 17, 18, 19, 20, 24, 25, 26, 27, 28, 32, 33, 34,
                     54, 55, 56, 60, 61, 62, 66, 67, 68, 69, 73, 74],
        "nothing": []},
}
```

```
$ python3 $TMPDIR/handcount.py
.scratch/archive/1-one-layout-for-every-skill/agents/reviews/11-refuter.md
  hand, findings (18): [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 63, 64, 68, 69, 114, 115, 116]
  hand, reporting nothing (2): [59, 117]
  collector rows (18), at lines: [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 63, 64, 68, 69, 114, 115, 116]
  collector but not hand: []
  hand but not collector: []
.scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md
  hand, findings (21): [57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 71, 72, 77, 82, 83, 84, 126, 130, 134, 138]
  hand, reporting nothing (2): [73, 78]
  collector rows (22), at lines: [57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 71, 72, 77, 78, 82, 83, 84, 126, 130, 134, 138]
  collector but not hand: [78]
  hand but not collector: []
.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md
  hand, findings (17): [66, 72, 81, 86, 97, 102, 109, 114, 164, 165, 166, 167, 168, 172, 176, 180, 181]
  hand, reporting nothing (0): []
  collector rows (17), at lines: [66, 72, 81, 86, 97, 102, 109, 114, 164, 165, 166, 167, 168, 172, 176, 180, 181]
  collector but not hand: []
  hand but not collector: []
.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md
  hand, findings (29): [9, 10, 11, 12, 16, 17, 18, 19, 20, 24, 25, 26, 27, 28, 32, 33, 34, 54, 55, 56, 60, 61, 62, 66, 67, 68, 69, 73, 74]
  hand, reporting nothing (0): []
  collector rows (29), at lines: [9, 10, 11, 12, 16, 17, 18, 19, 20, 24, 25, 26, 27, 28, 32, 33, 34, 54, 55, 56, 60, 61, 62, 66, 67, 68, 69, 73, 74]
  collector but not hand: []
  hand but not collector: []
```

- Plan 1 step 11: 18 and 18. Plan 2 step 3: 17 and 17. Plan 2.A step 3: 29 and 29.
- Plan 1 step 13: hand 21, collector 22; the difference is line 78, the stop above.

## What the round changes in the ledgers' output

```
$ git show 5b8354c:skills/plan-retro/templates/collect_findings.py > $TMPDIR/cf_r0.py
$ python3 $TMPDIR/compare.py    # runs both collectors over .scratch .scratch/archive, matches rows on report, run and text
collector at 5b8354c: 642 rows; final collector: 633 rows
rows of 5b8354c missing from the final output:
  .scratch/archive/1-one-layout-for-every-skill/agents/reviews/13-refuter.md | first | proof | The other figures in the report reproduce: 143 lines, 74 inventory lines, 67 rows, seven PASS lines,
  .scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md | first | proof | Every other figure reproduced.
  .scratch/archive/1-one-layout-for-every-skill/agents/reviews/14-refuter.md | first | standards | Nothing else: ASCII clean, one paragraph per source line, no history, no other sentence made false.
  .scratch/archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | first | proof | Otherwise none: layout ok, inventory ok, seven PASS lines, a clean ASCII check and 54 to 110 lines a
  .scratch/archive/1-one-layout-for-every-skill/agents/reviews/6-refuter.md | round 1 | spec | Checked, no defect found: the ruling sequence at :73-87 matches old :35-47 ("books the ruling and no
  .scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/4-refuter.md | round 1 | proof | The other figures reproduce.
  .scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/5-refuter.md | round 1 | proof | The rest reproduces.
  .scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/6-refuter.md | first | proof | The other figures reproduce.
  .scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/reviews/6-refuter.md | round 1 | proof | The other figures reproduce.
rows of the final output missing from 5b8354c's:
```

All nine removed rows report nothing; no real finding in the ledgers is dropped by the forms, and no row was added.

## The test, red first

The final test, copied beside the collector as first reported (`5b8354c`):

```
$ sh <copy>/collect_findings.test.sh; echo "exit $?"
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
- three-plan 5 round 1 proof src/n.py:8
- three-plan 6 first spec src/h.py:1
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
+ three-plan 6 round 1 unclassified src/h.py:5
+ three-plan 6 round 1 unclassified src/h.py:6
exit 1
```

## Reverts

Each revert edits a copy of the final collector under `$TMPDIR/rv2/<n>/`, with the final test copied beside it and run with `sh`. The script refuses an edit whose text is not found exactly once or that changes nothing. Revert 36 also removes, from the copied test only, the case before the move, so the case after the move is the one that runs. The edits, as `(label, [(text in the collector, replacement), ...][, [(text in the test, replacement)]])`:

```python
NF = 'r"(none|nothing|no findings?|no defects?|otherwise none|checked, no defects?)\\b", re.I'
R = [
 # first run's cases, still in force
 ("numbered items not read", [('ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- )")')]),
 ("'<n>) ' items not read", [('ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- |\\d+\\. )")')]),
 ("round subheadings ignored", [('yield run, sub if sub in HEADINGS else fixed, lines', 'yield run, fixed, lines')]),
 ("a subheaded round's list before its subheadings is read",
  [('    if not any(sub in HEADINGS for sub, _ in subsections):\n', '    if True:\n')]),
 ("Verification, Not checked, Closed, Closures, Usage subsections read",
  [('        if NOT_READ.match(sub):\n            continue\n', '')]),
 ("a lead 'Closures checked' is not a closure", [('|^closures checked\\b|', '|')]),
 ("a lead 'Checked and holding' is not a closure", [('|^checked and holding\\b|', '|')]),
 ("tilde fences not recognised",
  [('FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"\\s*(`{3,})(.*)$")')]),
 ("a shorter fence line closes the fence", [(' and len(match.group(1)) >= len(fence):', ':')]),
 ("a fence line with text after it closes the fence",
  [('            if not match.group(2).strip():\n                fence = None', '            fence = None')]),
 ("a backtick line whose info string holds a backtick opens a fence",
  [('if match and not (match.group(1)[0] == "`" and "`" in match.group(2)):', 'if match:')]),
 ("fences recognised at the start of a line only",
  [('FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"(`{3,}|~{3,})(.*)$")')]),
 ("an indented paragraph after a blank line ends the item",
  [('        elif current is None or not line.strip():\n            continue\n',
    '        elif current is None:\n            continue\n        elif not line.strip():\n'
    '            yield current\n            current = None\n')]),
 ("a level-one heading does not end a level-two section",
  [('        higher = HEADING_LINE.match(line) and len(line) - len(line.lstrip("#")) < level\n',
    '        higher = False\n')]),
 ("the leading number is kept in a heading's name",
  [('    return NUMBER.sub("", name).lower()', '    return name.lower()')]),
 ("a heading's name keeps its case", [('    return NUMBER.sub("", name).lower()', '    return NUMBER.sub("", name)')]),
 ("folders walked in the file system's order", [('            dirnames.sort()\n', '')]),
 # round 1: ruling 2
 ("a tilde fence is three tildes long only",
  [('FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"\\s*(`{3,}|~{3})(.*)$")')]),
 ("a continuation line indented with a tab ends the item",
  [('        elif line[0] in " \\t":', '        elif line[0] == " ":')]),
 # round 1: ruling 1 and 6, each form
 ("form 'none' dropped", [(NF, NF.replace('(none|', '('))]),
 ("form 'nothing' dropped", [(NF, NF.replace('|nothing|', '|'))]),
 ("form 'no finding' dropped", [(NF, NF.replace('|no findings?|', '|'))]),
 ("form 'no defect' dropped", [(NF, NF.replace('|no defects?|', '|'))]),
 ("form 'otherwise none' dropped", [(NF, NF.replace('|otherwise none|', '|'))]),
 ("form 'checked, no defect' dropped", [(NF, NF.replace('|checked, no defects?)', ')'))]),
 ("form 'the other figures reproduce' dropped",
  [(' or OTHERS_REPRODUCE.fullmatch(first))', ')')]),
 # round 1: near misses
 ("near miss: a form matched without a word boundary", [(NF, NF.replace(')\\b"', ')"'))]),
 ("near miss: a form matched anywhere in the item",
  [('NOTHING_FOUND.match(item.strip())', 'NOTHING_FOUND.search(item.strip())')]),
 ("near miss: 'reproduce' matched at the start of the first sentence only",
  [('OTHERS_REPRODUCE.fullmatch(first)', 'OTHERS_REPRODUCE.match(first)')]),
 ("near miss: any item opening with 'checked' reports nothing",
  [(NF, NF.replace('checked, no defects?', 'checked'))]),
 # round 1: ruling 5
 ("a lead 'Closure' or 'Closures' is a closure", [('|^closures checked\\b|', '|^closures?\\b|')]),
 # round 1: ruling 6, heading names
 ("closing hashes kept in a heading's name", [('        name = re.sub(r"(^|\\s)#+$", "", name).strip()\n', '')]),
 ("a trailing parenthetical kept in a heading's name",
  [('        name = re.sub(r"\\([^()]*\\)$", "", name).strip()\n', '')]),
 ("a trailing colon or full stop kept in a heading's name",
  [('        name = re.sub(r"[:.]$", "", name).strip()\n', '')]),
 # round 1: ruling 7, --exclude-listed
 ("the run is not part of the key",
  [('            if (finding["plan"], finding["step"], finding["run"]) in excluded:',
    '            if (finding["plan"], finding["step"]) in {t[:2] for t in excluded}:')]),
 ("the plan is the report's path under the first folder argument; the case before the move taken out"
  " of the test copy",
  [('            if (finding["plan"], finding["step"], finding["run"]) in excluded:',
    '            if (os.path.relpath(path, argv[0]).split(os.sep)[0], finding["step"],'
    ' finding["run"]) in excluded:')],
  [('[ "$rest" = "q r/2/round 1" ] || fail "the runs listed left [$rest], expected [q r/2/round 1]"\n', '')]),
 ("a later entry for a report replaces its earlier one",
  [('        for run in (run.strip() for run in entry.group(2).split(",")):',
    '        triples = {t for t in triples if t[:2] != (parts[0], parts[3][: -len("-refuter.md")])}\n'
    '        for run in (run.strip() for run in entry.group(2).split(",")):')]),
 ("entries read outside the Reports read section",
  [('            inside = line.startswith("## ") and heading_name(line[3:]) == "reports read"',
    '            inside = True')]),
 ("an empty Reports read list is refused", [('    if not found:\n', '    if not found or not triples:\n')]),
 ("a retro with no Reports read heading excludes nothing",
  [('    if not found:\n        raise RetroError', '    if False:\n        raise RetroError')]),
 ("a missing retro is not caught", [('    except (OSError, UnicodeDecodeError):', '    except UnicodeDecodeError:')]),
 ("a retro that is not UTF-8 is not caught", [('    except (OSError, UnicodeDecodeError):', '    except OSError:')]),
 ("an entry of another form is skipped",
  [('            raise RetroError(f"{retro}:{number}: an entry is {ENTRY_FORM}")', '            continue')]),
 ("'..' accepted as a plan", [('            or parts[0] in ("", ".", "..")\n', '')]),
 ("a run of another form is accepted",
  [('            if not RUN.fullmatch(run):', '            if False:')]),
 ("--exclude-listed with no value is not refused",
  [('        if len(argv) < 2:\n            print(usage, file=sys.stderr)\n            return 2\n', '')]),
]
```

Output of every run, verbatim (the scratch folder shown as `<scratch>`):

```
$ python3 $TMPDIR/revert2.py
--- 1. numbered items not read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- plan with space 4 first spec docs/d.md:2
- three-plan 5 first spec src/n.py:2
- three-plan 5 first spec src/n.py:4
- three-plan 5 first spec -
- three-plan 5 first spec src/n.py:6
- three-plan 6 first spec src/h.py:1
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
--- 2. '<n>) ' items not read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
--- 3. round subheadings ignored (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
+ three-plan 6 round 1 unclassified src/h.py:5
+ three-plan 6 round 1 unclassified src/h.py:6
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 round 1 unclassified src/c.py:11
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:13
--- 4. a subheaded round's list before its subheadings is read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 5. Verification, Not checked, Closed, Closures, Usage subsections read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:6
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 6. a lead 'Closures checked' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 spec src/a.cpp:14
+ three-plan 5 round 1 unclassified -
--- 7. a lead 'Checked and holding' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 proof src/a.cpp:40
--- 8. tilde fences not recognised (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 6 first spec -
- two-plan 3 first standards src/c.py:9
--- 9. a shorter fence line closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
+ three-plan 6 first spec -
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 first spec -
--- 10. a fence line with text after it closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 first proof -
--- 11. a backtick line whose info string holds a backtick opens a fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 2 first spec docs/b.md:5
--- 12. fences recognised at the start of a line only (exit 1)
FAIL: a fence indented under its finding was read into the finding
--- 13. an indented paragraph after a blank line ends the item (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 round 1 unclassified src/a.cpp:30
--- 14. a level-one heading does not end a level-two section (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 2 first proof src/z.md:1
--- 15. the leading number is kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 unclassified src/c.py:11
--- 16. a heading's name keeps its case (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
- one-plan 2 first spec docs/b.md:3
- one-plan 2 first spec docs/b.md:5
- plan with space 4 first spec docs/d.md:2
- three-plan 5 first spec src/n.py:2
- three-plan 5 first spec src/n.py:4
- three-plan 5 first spec -
- three-plan 5 first spec src/n.py:6
- three-plan 5 round 1 proof src/n.py:8
- three-plan 6 first spec src/h.py:1
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+
--- 17. folders walked in the file system's order (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
- one-plan 2 first spec docs/b.md:3
- one-plan 2 first spec docs/b.md:5
- plan with space 4 first spec docs/d.md:2
+ two-plan 3 first spec src/c.py:5
+ two-plan 3 first spec docs/c.md:7
+ two-plan 3 first standards src/c.py:9
+ two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 proof -
+ two-plan 3 round 1 behaviour src/c.py:13
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ one-plan 1 first spec src/a.cpp:10
+ one-plan 1 first standards src/a.cpp:12
+ one-plan 1 round 1 behaviour src/a.cpp:20
+ one-plan 1 round 1 proof -
+ one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 2 first spec docs/b.md:3
+ one-plan 2 first spec docs/b.md:5
+ plan with space 4 first spec docs/d.md:2
--- 18. a tilde fence is three tildes long only (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
+ three-plan 6 first spec -
--- 19. a continuation line indented with a tab ends the item (exit 1)
FAIL: a continuation line indented with a tab was not joined
--- 20. form 'none' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first proof -
+ one-plan 1 first behaviour -
+ one-plan 2 first proof -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ two-plan 3 first behaviour -
+ two-plan 3 round 1 standards -
--- 21. form 'nothing' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
--- 22. form 'no finding' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
--- 23. form 'no defect' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
--- 24. form 'otherwise none' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
--- 25. form 'checked, no defect' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
--- 26. form 'the other figures reproduce' dropped (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
+ three-plan 5 first spec -
--- 27. near miss: a form matched without a word boundary (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec src/n.py:2
--- 28. near miss: a form matched anywhere in the item (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec src/n.py:4
- two-plan 3 first spec src/c.py:5
--- 29. near miss: 'reproduce' matched at the start of the first sentence only (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec -
--- 30. near miss: any item opening with 'checked' reports nothing (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 first spec src/n.py:6
--- 31. a lead 'Closure' or 'Closures' is a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 5 round 1 proof src/n.py:8
--- 32. closing hashes kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 first standards src/h.py:3
--- 33. a trailing parenthetical kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 first behaviour src/h.py:4
--- 34. a trailing colon or full stop kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- three-plan 6 first spec src/h.py:1
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
+ three-plan 6 round 1 unclassified src/h.py:5
+ three-plan 6 round 1 unclassified src/h.py:6
--- 35. the run is not part of the key (exit 1)
FAIL: the runs listed left [], expected [q r/2/round 1]
--- 36. the plan is the report's path under the first folder argument; the case before the move taken out of the test copy (exit 1)
FAIL: after the move into the archive the runs listed left [p/1/first, q r/2/first, q r/2/round 1], expected [q r/2/round 1]
--- 37. a later entry for a report replaces its earlier one (exit 1)
FAIL: an entry given twice left [p/1/first, p/1/round 1, q r/2/first], expected [p/1/first, p/1/round 1]
--- 38. entries read outside the Reports read section (exit 1)
FAIL: an empty Reports read list, with an entry quoted outside it, left []
--- 39. an empty Reports read list is refused (exit 1)
FAIL: an empty Reports read list, with an entry quoted outside it, left []
--- 40. a retro with no Reports read heading excludes nothing (exit 1)
FAIL: retro retro-no-heading.md exited 0, expected 2
--- 41. a missing retro is not caught (exit 1)
FAIL: retro no-such-retro.md exited 1, expected 2
--- 42. a retro that is not UTF-8 is not caught (exit 1)
FAIL: retro retro-binary.md exited 1, expected 2
--- 43. an entry of another form is skipped (exit 1)
FAIL: retro retro-old-form.md exited 0, expected 2
--- 44. '..' accepted as a plan (exit 1)
FAIL: retro retro-dots.md exited 0, expected 2
--- 45. a run of another form is accepted (exit 1)
FAIL: retro retro-run.md exited 0, expected 2
--- 46. --exclude-listed with no value is not refused (exit 1)
FAIL: --exclude-listed with no value exited 1, expected 2
```

46 runs, 46 exit 1 with a FAIL line, no PASS line.

## Checks

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
Can't open skills/plan-retro/templates/__pycache__/collect_findings.cpython-313.pyc: No such file or directory at -e line 1.
verify: 12 commands passed
verify exit 0
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ python3 utils/check_skill_layout.py skills/plan-retro; echo "exit $?"
ok: skills/plan-retro/SKILL.md
exit 0
$ awk 'length > 100' over the collector and its test; LC_ALL=C grep -n '[^ -~]' over the changed files
(grep exit 1)
$ git status --short
 M README.md
 M skills/plan-retro/SKILL.md
 D skills/plan-retro/templates/__pycache__/collect_findings.cpython-313.pyc
 M skills/plan-retro/templates/collect_findings.py
 M skills/plan-retro/templates/collect_findings.test.sh
 M skills/plan-retro/templates/retro.md
$ wc -l <changed files>
     293 skills/plan-retro/templates/collect_findings.py
     459 skills/plan-retro/templates/collect_findings.test.sh
     107 skills/plan-retro/SKILL.md
      34 skills/plan-retro/templates/retro.md
     175 README.md
    1068 total
$ git diff --stat
 README.md                                          |   2 +-
 skills/plan-retro/SKILL.md                         |  10 +-
 .../__pycache__/collect_findings.cpython-313.pyc   | Bin 12932 -> 0 bytes
 skills/plan-retro/templates/collect_findings.py    | 152 ++++++++++----
 .../plan-retro/templates/collect_findings.test.sh  | 232 +++++++++++++++------
 skills/plan-retro/templates/retro.md               |   2 +-
 6 files changed, 292 insertions(+), 106 deletions(-)
$ python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l
633 findings
     633
$ python3 skills/plan-retro/templates/collect_findings.py .scratch/archive | <rows, reports, headings>
538 findings
538 rows, 23 reports, {'spec': 240, 'standards': 115, 'behaviour': 86, 'proof': 97}
```

The ASCII check in the verify list exits 0. It prints one "Can't open" line because the step's wip commit `5b8354c` added `skills/plan-retro/templates/__pycache__/collect_findings.cpython-313.pyc` (`git show --stat 5b8354c` lists it). The working tree deletes that file (` D` above), since compiled bytecode must not land and the check cannot read it as text. The deletion has to be part of the landing. `.gitignore` has no `__pycache__` entry, so an import of the collector's module adds the file again; that line of `.gitignore` is outside this step's paths.

The grep for every place that names the collector, the retro list or `--exclude-listed`, output verbatim:

```
$ grep -rn -E 'retros/|Reports read|exclude-listed|since the previous retro|collect_findings' skills utils docs README.md | grep -v '^skills/plan-retro/templates/collect_findings'
skills/plan-retro/SKILL.md:31:3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list.
skills/plan-retro/SKILL.md:40:   python3 <this skill's folder>/templates/collect_findings.py [--exclude-listed <previous retro>] <ledger_root> <archive_root>
skills/plan-retro/SKILL.md:44:   - The previous retro is passed to `--exclude-listed` unless the user asks for a retro over everything.
skills/plan-retro/SKILL.md:45:   - `--exclude-listed` skips the runs the previous retro's "Reports read" lists, matched by plan folder, step and run, so a plan moved into `<archive_root>` stays skipped and a round added to a report later is read.
skills/plan-retro/SKILL.md:46:   - The collector exits 2 with a message when the previous retro cannot be read as UTF-8, has no `## Reports read` heading, or holds a line there that is not an entry in the form of `templates/retro.md`; the retro stops there with that refusal ("Stops").
skills/plan-retro/SKILL.md:53:8. Write `<ledger_root>/retros/<YYYY-MM-DD>.md` from `templates/retro.md`.
skills/plan-retro/SKILL.md:88:| A previous retro the collector refuses | The collector exits 2 at Steps 1 | The collector's message | The previous retro's "Reports read" corrected to the form of `templates/retro.md`, or a retro over everything, then `/plan-retro` again |
skills/plan-retro/templates/retro.md:5:## Reports read
docs/roadmap.md:22:- Goal: Every finding of the five reports in `.scratch/reviews/2026-09-24-audit/` is fixed in the tree or ruled out by the user. That covers the skill texts (the restyle and 2.A defects, the contradictions between skills as ruled, Opus as the default model for the orchestrator and the agents, with Fable, Astra and Sol as options for the orchestrator and Sol for the agents, `inline` kept as an optional executor, stops raised as plain-text open items), `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, the roadmap's gates and order, every row of `docs/academic-coverage.md` checked against its file, a committed verify runner, and the three archived ledgers corrected to what was observed.
docs/dev/change-standard.md:44:sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
docs/dev/building.md:8:sh skills/plan-retro/templates/collect_findings.test.sh
README.md:107:sh skills/plan-retro/templates/collect_findings.test.sh
README.md:119:- `collect_findings.test.sh` runs the collector over reports in the shapes the refuter writes: dashed and numbered findings under numbered and plain headings, headings ending in a colon, a full stop, closing hashes or a parenthetical, and repair rounds with and without `### Spec` to `### Behaviour` subheadings. It checks that the Verification, Not checked, Closed, Closures and Usage lists, a subheaded round's list before its subheadings, a closure that holds and every form of an item that reports nothing give no finding, while a closure that does not hold and each near miss of those forms is a finding. It checks that backtick and tilde fences of any length are skipped, indented ones included, that a continuation line indented with spaces or a tab joins its finding, and that a report is read once when the archive sits inside the ledger root. With `--exclude-listed`, the runs the earlier retro lists under "Reports read" are skipped by plan folder, step and run, also after the plan moves into the archive, while a round added later is read; a retro with no such heading, a missing retro, one that is not UTF-8, and an entry or a run in another form are refused.
```

Each `plan-retro` hit states the new behaviour. `templates/retro.md:5` heads the entries in the new form. The other hits name the files only, except README.md:119, which is rewritten (below).

## Files

| File | Lines (`wc -l`) |
|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 293 |
| `skills/plan-retro/templates/collect_findings.test.sh` | 459 |
| `skills/plan-retro/SKILL.md` | 107 |
| `skills/plan-retro/templates/retro.md` | 34 |
| `README.md` | 175 (line 119) |
| `skills/plan-retro/templates/__pycache__/collect_findings.cpython-313.pyc` | deleted |

## Judgment calls

1. **Where the no-finding forms apply.** They apply to every item, in the first run and in rounds, subheaded or not. A form is matched at the start of the item, with a word boundary after it. "The other figures reproduce" is matched on the whole first sentence (text up to the first `.`, `:` or `;` followed by a space or the end), so "The other figures reproduce except the line count, ..." stays a finding.
2. **Effect of "none" plus any word.** An item that opens "None of ..." now reports nothing, as ruling 6 sets. No item in the ledgers opens that way: the comparison above removes only the nine rows listed.
3. **The closure rule** applies where it applied before, to a round's items under no finding subheading.
4. **Heading names.** Closing hashes, a trailing parenthetical, and a trailing colon or full stop are removed repeatedly until none is left, so "Behaviour (none found):" gives "behaviour".
5. **Entries under "Reports read".** Every line there is blank or an entry; anything else is refused (exit 2) with its line number. An entry's path must have four parts, `<plan>/agents/reviews/<step>-refuter.md`, with a plan that is not empty, `.` or `..`, and a step that is not empty. A report given twice has the union of its runs. An empty list excludes nothing.
6. **What the retro records.** Steps 8 of `SKILL.md` builds each entry from the collector's rows, so a run that gave no finding has no entry. The next retro reads that run again, and it gives no finding again.

## User-visible changes

- The collector's output: `.scratch .scratch/archive` gives 633 findings (642 before this round), `.scratch/archive` 538 from all 23 reports, `{'spec': 240, 'standards': 115, 'behaviour': 86, 'proof': 97}` (547 before this round).
- `--exclude-listed`. Before this round: backtick-quoted paths under "Reports read", compared by real path. After: entries `- \`<plan>/agents/reviews/<step>-refuter.md\`: <run>, ...`, compared by plan folder name, step and run; a retro in the old form is refused, with the entry's line.
- `skills/plan-retro/SKILL.md`. Quick start: "the retro over every refuter report since the previous retro" became "the retro over every refuter run the previous retro did not read". Steps 1 gained two bullets (what `--exclude-listed` skips; the exit 2 refusals and the stop on them). Steps 8: "The reports read, every path, so the next retro can start after them." became one entry per report with the runs its findings came from, and a bullet on runs with no finding. Stops gained the row "A previous retro the collector refuses", and "The second is a refusal" became "The second and third rows are refusals".
- `skills/plan-retro/templates/retro.md`: "- \`<path>-refuter.md\`" became "- \`<plan>/agents/reviews/<step>-refuter.md\`: <run>, <run>".
- README.md:119 now reads:

  > - `collect_findings.test.sh` runs the collector over reports in the shapes the refuter writes: dashed and numbered findings under numbered and plain headings, headings ending in a colon, a full stop, closing hashes or a parenthetical, and repair rounds with and without `### Spec` to `### Behaviour` subheadings. It checks that the Verification, Not checked, Closed, Closures and Usage lists, a subheaded round's list before its subheadings, a closure that holds and every form of an item that reports nothing give no finding, while a closure that does not hold and each near miss of those forms is a finding. It checks that backtick and tilde fences of any length are skipped, indented ones included, that a continuation line indented with spaces or a tab joins its finding, and that a report is read once when the archive sits inside the ledger root. With `--exclude-listed`, the runs the earlier retro lists under "Reports read" are skipped by plan folder, step and run, also after the plan moves into the archive, while a round added later is read; a retro with no such heading, a missing retro, one that is not UTF-8, and an entry or a run in another form are refused.

## The first build

This part records the first build, before repair round 1. Its DONE table, figures (642 and 547 findings, the 1/13 count of 23, the line counts), its reverts (which edit code the collector no longer has), its real-path matching, its closure and "reproduce" judgment calls, its file list and its README text are superseded by the sections above. It is kept as the record of what the first review read.

### DONE / NOT DONE

| # | Item | State | Proof |
|---|---|---|---|
| 1 | Numbered findings (`- `, `<n>. `, `<n>) `, with indented lines) | DONE | reverts 1 and 21 below, red |
| 2 | `###` subheadings in a round give the heading, numbered or not, either case | DONE | reverts 2, 19, 20 and 25, red |
| 3 | Verification, Not checked, Closed, Closures, Usage skipped at `##` and `###`; closure items skipped | DONE | reverts 3, 4 and 5, red |
| 4 | Backtick and tilde fences of three or more, to their closing fence | DONE | reverts 6, 7, 8, 22 and 23, red |
| 5 | `--exclude-listed` reads backtick-quoted paths under "## Reports read", compares by real path | DONE | reverts 12, 13, 14, 15, 16, 18, 24 and 26, red |
| 6 | Test fixtures in the archived shapes, each case red under its revert, head comment names the cases | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1` prints `PASS: collect_findings.py scratch tests`; 26 reverts, 26 red |
| 7 | The count over `.scratch/archive` agrees with a hand count of reports of plans 1, 2 and 2.A | DONE | "The count" below: 18/18, 23/23, 17/17, 29/29 |
| 8 | README.md:119 says what the test covers | DONE | the diff under "User-visible changes" |
| 9 | Output shape unchanged (plan, step, report, run, heading, location, text) | DONE | the test's `rows_of` reads those keys from every line; `skills/plan-retro/SKILL.md:42` unchanged and true |
| 10 | `sh utils/verify.sh <state file>` | DONE | output below, exit 0 |
| 11 | ASCII, no history, lines of about 100 characters | DONE | ASCII check empty (exit 0); `awk 'length > 100'` over both files prints nothing |

#### Verification

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "verify exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
verify exit 0
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (as in docs/dev/change-standard.md); echo "ascii exit $?"
ascii exit 0
$ awk 'length > 100 {print FILENAME":"FNR": "length}' skills/plan-retro/templates/collect_findings.py skills/plan-retro/templates/collect_findings.test.sh
(no output)
$ grep -rn -E '\bbullets\(|Reports read|exclude-listed|heading styles' skills utils docs README.md | grep -v '^skills/plan-retro/templates/collect_findings'
skills/plan-retro/SKILL.md:31:3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list.
skills/plan-retro/SKILL.md:40:   python3 <this skill's folder>/templates/collect_findings.py [--exclude-listed <previous retro>] <ledger_root> <archive_root>
skills/plan-retro/SKILL.md:44:   - The previous retro is passed to `--exclude-listed` unless the user asks for a retro over everything.
skills/plan-retro/templates/retro.md:5:## Reports read
README.md:119:- `collect_findings.test.sh` runs the collector over reports ... (the new line)
```

Every grep hit outside the collector still holds: the retro template lists each report as a backtick-quoted path under `## Reports read`, which is what `--exclude-listed` now reads. `bullets()` is renamed `items()`; it has no caller outside the collector.

#### The test, red first

The final test, copied beside the collector as it stands on the base `f7dd354`:

```
$ sh <copy>/collect_findings.test.sh; echo "exit $?"
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 first spec -
+ three-plan 5 round 1 proof src/n.py:8
+ three-plan 5 round 1 unclassified -
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 first proof -
- one-plan 2 first spec docs/b.md:5
- plan with space 4 first spec docs/d.md:2
- three-plan 5 first spec src/n.py:2
- three-plan 5 first spec src/n.py:4
- three-plan 5 first spec -
- three-plan 5 first spec src/n.py:6
- three-plan 5 round 1 proof src/n.py:8
- three-plan 6 first spec src/h.py:1
- three-plan 6 first spec src/h.py:7
- three-plan 6 first proof src/h.py:2
- three-plan 6 first standards src/h.py:3
- three-plan 6 first behaviour src/h.py:4
- three-plan 6 round 1 spec src/h.py:5
- three-plan 6 round 1 spec src/h.py:6
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
exit 1
```

#### Reverts

Each revert is one edit to a copy of the final collector under `$TMPDIR/rv/<n>/`, with the final test copied beside it and run with `sh`; revert 26 also removes the space case from the copied test so that the spelled-another-way case runs. The edits, as `(label, text in the collector, text it is replaced by[, (text in the test, replacement)])`:

```python
R = [
 ("numbered items not read: ITEM matches '- ' only",
  'ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- )")'),
 ("round subheadings ignored: a subsection keeps the section's heading",
  'yield run, sub if sub in HEADINGS else fixed, lines', 'yield run, fixed, lines'),
 ("Verification, Not checked, Closed, Closures, Usage subsections read",
  '        if NOT_READ.match(sub):\n            continue\n', ''),
 ("a lead 'Closures' is not a closure",
  '|^closures?\\b|', '|'),
 ("a lead 'Checked and holding' is not a closure",
  '|^checked and holding\\b|', '|'),
 ("tilde fences not recognised",
  'FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"\\s*(`{3,})(.*)$")'),
 ("a shorter fence line closes the fence",
  ' and len(match.group(1)) >= len(fence):', ':'),
 ("a fence line with text after it closes the fence",
  '            if not match.group(2).strip():\n                fence = None', '            fence = None'),
 ("an indented paragraph after a blank line ends the item",
  '        elif current is None or not line.strip():\n            continue\n',
  '        elif current is None:\n            continue\n        elif not line.strip():\n            yield current\n            current = None\n'),
 ("a level-one heading does not end a level-two section",
  '        higher = HEADING_LINE.match(line) and len(line) - len(line.lstrip("#")) < level\n',
  '        higher = False\n'),
 ("'None. <more>' is a finding",
  ' or item.lower().startswith("none.")', ''),
 ("excluded paths compared as spelled",
  '            return {os.path.realpath(path) for path in quoted}', '            return set(quoted)'),
 ("excluded paths read from the whole retro",
  '            quoted = re.findall(r"`([^`]+)`", "\\n".join(body))',
  '            quoted = re.findall(r"`([^`]+)`", "\\n".join(lines))'),
 ("a retro with no Reports read heading excludes nothing",
  '    return None\n\n\ndef main', '    return set()\n\n\ndef main'),
 ("a missing retro is not caught",
  '        except (OSError, UnicodeDecodeError):', '        except UnicodeDecodeError:'),
 ("--exclude-listed with no value is not refused",
  '        if len(argv) < 2:\n            print(usage, file=sys.stderr)\n            return 2\n', ''),
 ("folders walked in the file system's order",
  '            dirnames.sort()\n', ''),
 ("an empty Reports read list is refused as no list",
  '            return {os.path.realpath(path) for path in quoted}',
  '            return {os.path.realpath(path) for path in quoted} or None'),
 ("the leading number is kept in a heading's name",
  'heading = NUMBER.sub("", line[len(marker):].strip()).lower()',
  'heading = line[len(marker):].strip().lower()'),
 ("a heading's name keeps its case",
  'heading = NUMBER.sub("", line[len(marker):].strip()).lower()',
  'heading = NUMBER.sub("", line[len(marker):].strip())'),
 ("'<n>) ' items not read",
  'ITEM = re.compile(r"(- |\\d+[.)] )")', 'ITEM = re.compile(r"(- |\\d+\\. )")'),
 ("a backtick line whose info string holds a backtick opens a fence",
  'if match and not (match.group(1)[0] == "`" and "`" in match.group(2)):', 'if match:'),
 ("fences recognised at the start of a line only",
  'FENCE = re.compile(r"\\s*(`{3,}|~{3,})(.*)$")', 'FENCE = re.compile(r"(`{3,}|~{3,})(.*)$")'),
 ("a retro that is not UTF-8 is not caught",
  '        except (OSError, UnicodeDecodeError):', '        except OSError:'),
 ("a subheaded round's list before its subheadings is read",
  '    if not any(sub in HEADINGS for sub, _ in subsections):\n', '    if True:\n'),
 ("excluded paths compared as spelled, the space case taken out of the test copy",
  '            return {os.path.realpath(path) for path in quoted}', '            return set(quoted)',
  ('rest=$(exclude retro-space.md)\n', 'rest="one-plan/1 one-plan/2 two-plan/3"\n')),
]
```

Output of every run, verbatim (the scratch folder path shown as `<scratch>`, the copy's folder as `<copy>`):

```
$ python3 $TMPDIR/revert.py
--- 1. numbered items not read: ITEM matches '- ' only (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- plan with space 4 first spec docs/d.md:2
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
--- 2. round subheadings ignored: a subsection keeps the section's heading (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 round 1 unclassified src/c.py:11
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:13
--- 3. Verification, Not checked, Closed, Closures, Usage subsections read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified src/c.py:6
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 4. a lead 'Closures' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 spec src/a.cpp:14
--- 5. a lead 'Checked and holding' is not a closure (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 round 1 proof src/a.cpp:40
--- 6. tilde fences not recognised (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
--- 7. a shorter fence line closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+ two-plan 3 first spec -
--- 8. a fence line with text after it closes the fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 first proof -
--- 9. an indented paragraph after a blank line ends the item (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 round 1 spec src/a.cpp:30
+ one-plan 1 round 1 unclassified src/a.cpp:30
--- 10. a level-one heading does not end a level-two section (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 2 first proof src/z.md:1
--- 11. 'None. <more>' is a finding (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ one-plan 1 first behaviour -
--- 12. excluded paths compared as spelled (exit 1)
FAIL: a listed path holding a space left [one-plan/1 one-plan/2 plan with space/4 two-plan/3]
--- 13. excluded paths read from the whole retro (exit 1)
FAIL: a path spelled another way, or quoted outside Reports read, left [one-plan/2 plan with space/4]
--- 14. a retro with no Reports read heading excludes nothing (exit 1)
FAIL: a retro with no Reports read heading exited 0, expected 2
--- 15. a missing retro is not caught (exit 1)
FAIL: a missing retro exited 1, expected 2
--- 16. --exclude-listed with no value is not refused (exit 1)
FAIL: --exclude-listed with no value exited 1, expected 2
--- 17. folders walked in the file system's order (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 first spec src/c.py:5
+ two-plan 3 first spec docs/c.md:7
+ two-plan 3 first standards src/c.py:9
+ two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 proof -
+ two-plan 3 round 1 behaviour src/c.py:13
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
--- 18. an empty Reports read list is refused as no list (exit 1)
FAIL: an empty Reports read list left []
--- 19. the leading number is kept in a heading's name (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- two-plan 3 round 1 spec src/c.py:11
+ two-plan 3 round 1 unclassified src/c.py:11
--- 20. a heading's name keeps its case (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 1 first spec src/a.cpp:10
- one-plan 1 first standards src/a.cpp:12
- one-plan 1 round 1 behaviour src/a.cpp:20
- one-plan 1 round 1 proof -
- one-plan 1 round 1 spec src/a.cpp:30
- one-plan 2 first spec docs/b.md:3
- one-plan 2 first spec docs/b.md:5
- plan with space 4 first spec docs/d.md:2
- two-plan 3 first spec src/c.py:5
- two-plan 3 first spec docs/c.md:7
- two-plan 3 first standards src/c.py:9
- two-plan 3 round 1 spec src/c.py:11
- two-plan 3 round 1 proof -
- two-plan 3 round 1 behaviour src/c.py:13
+
--- 21. '<n>) ' items not read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- two-plan 3 first standards src/c.py:9
--- 22. a backtick line whose info string holds a backtick opens a fence (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
- one-plan 2 first spec docs/b.md:5
--- 23. fences recognised at the start of a line only (exit 1)
FAIL: a fence indented under its finding was read into the finding
--- 24. a retro that is not UTF-8 is not caught (exit 1)
FAIL: a retro that is not UTF-8 exited 1, expected 2
--- 25. a subheaded round's list before its subheadings is read (exit 1)
FAIL: rows differ from the expected rows (- expected, + got):
+ two-plan 3 round 1 unclassified -
+ two-plan 3 round 1 unclassified -
--- 26. excluded paths compared as spelled, the space case taken out of the test copy (exit 1)
FAIL: a path spelled another way, or quoted outside Reports read, left [one-plan/1 one-plan/2 plan with space/4 two-plan/3]
```

26 runs, 26 exit 1, no PASS line.

### The count

```
$ python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l
642 findings
     642
$ python3 skills/plan-retro/templates/collect_findings.py .scratch/archive > $TMPDIR/cf-archive.jsonl
547 findings
$ python3 -c '<count rows, reports and headings>' $TMPDIR/cf-archive.jsonl
547 rows, 23 reports, {'spec': 241, 'standards': 116, 'behaviour': 86, 'proof': 104}
```

The hand count: for each report, the line ranges of its read sections, taken from `grep -nE '^(#|```|~~~)'` over the report, and the item lines in each counted with `grep -cE '^(- |[0-9]+[.)] )'`, against the collector's rows for that report:

```
$ item='^(- |[0-9]+[.)] )'; a=.scratch/archive
$ count() { f=$1; shift; t=0; for range in "$@"; do n=$(sed -n "${range}p" "$f" | grep -cE "$item"); printf '%s=%s ' "$range" "$n"; t=$((t+n)); done; printf '| items %s | collector %s\n' "$t" "$(grep -c "\"report\": \"$f\"" $TMPDIR/cf-archive.jsonl)"; }
$ count $a/1-one-layout-for-every-skill/agents/reviews/11-refuter.md 43,56 57,60 61,65 66,70 77,137
43,56=11 57,60=1 61,65=2 66,70=2 77,137=4 | items 20 | collector 18
$ count $a/1-one-layout-for-every-skill/agents/reviews/13-refuter.md 55,68 69,74 75,79 80,85 124,127 128,131 132,135 136,139
55,68=11 69,74=3 75,79=2 80,85=3 124,127=1 128,131=1 132,135=1 136,139=1 | items 23 | collector 23
$ count $a/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-refuter.md 64,90 91,94 95,106 107,118 162,169 170,173 174,177 178,182
64,90=4 91,94=0 95,106=2 107,118=2 162,169=5 170,173=1 174,177=1 178,182=2 | items 17 | collector 17
$ count $a/2-a-launch-notes-for-builders-run-as-their-own-process/agents/reviews/3-refuter.md 7,13 14,21 22,29 30,35 52,57 58,63 64,70 71,75
7,13=4 14,21=5 22,29=5 30,35=3 52,57=3 58,63=3 64,70=4 71,75=2 | items 29 | collector 29
$ sed -n '57,60p;77,137p' $a/1-one-layout-for-every-skill/agents/reviews/11-refuter.md | grep -E "$item" | grep -E '^- (none|Closures)'
- none.
- Closures checked, all hold:
```

- Plan 1, step 11 (dashed findings, a round with no subheadings): 20 item lines, less `- none.` under Proof and the `Closures checked` item in the round, is 18. The collector gives 18.
- Plan 1, step 13 (numbered findings, a round with subheadings): 23 and 23.
- Plan 2, step 3 (numbered findings with nested points, numbering running across sections, a Proof paragraph that is not an item, `### Closures`): 17 and 17.
- Plan 2.A, step 3 (numbered findings, a round with subheadings and a Usage section): 29 and 29.

The per-report totals also match the review's own counts for the reports it named: plan 2.A steps 1 and 3 give 31 and 29, plan 2 steps 4, 5 and 6 give 39, 37 and 45.

### Files

| File | Lines (`wc -l`) | `git diff --stat` |
|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 227 (was 140) | 219 lines changed |
| `skills/plan-retro/templates/collect_findings.test.sh` | 343 (was 96) | 293 lines changed |
| `README.md` | 175 | 2 +- (line 119) |

`git status --short` shows these three files modified and nothing else.

### Judgment calls the brief left open

1. **A round's closure items.** Besides ": closed" and a lead "Closed", an item that opens with "Closure", "Closures" (the brief's "Closures checked" style, plan 1 step 11) or "Checked and holding" (plan 1 step 8, `8-refuter.md:116`, the same kind of confirmation) is not a finding. Plan 1 step 9's round item at `9-refuter.md:113` ("... No finding here. Behaviour.") stays a behaviour finding, since it opens with a path and names its own heading.
2. **A subheaded round's text before its subheadings.** In a round that has at least one Spec, Proof, Standards or Behaviour subheading, the lines before the first subheading are not read. Plan 2.B's open `2-refuter.md:174-190` holds two such lists, closures checked and inventory rows sampled, which came out as 14 unclassified rows otherwise. A round with none of the four subheadings (the plan 1 shape) is read whole, by the trailing heading word.
3. **Other subheadings.** Inside a round, the items of a `###` subsection that is neither one of the four nor a skipped name take the trailing-word rule; inside a first-run section, they keep the section's heading.
4. **What an item is.** A finding is recognised by its shape, as the brief defines it. A numbered item that confirms rather than faults (plan 1 step 13, Proof 3, "The other figures in the report reproduce") counts, and so does it in the hand count. A paragraph that is not an item (plan 2 step 3, Proof, "none. Every figure ...") is not a finding.
5. **Continuation.** An item takes its indented lines, and an indented paragraph after a blank line (plan 1 step 11, `11-refuter.md:134`). An unindented line ends it: joining unindented lines changes no row or text over `.scratch` and `.scratch/archive` (the outputs compared with `cmp` were identical), so that rule was left out.
6. **Fences.** A fence may be indented (plan 2.B's `1-refuter.md:240` holds fences inside numbered findings). A backtick line whose info string holds a backtick is inline code, not a fence (CommonMark). A closing line has the fence's character, at least its length, and nothing after it (plan 1 step 2, `2-refuter.md:146-147`, holds such non-closing lines inside a fence).
7. **Section ends.** A level-two section also ends at a level-one heading.
8. **Order.** Folders are walked in sorted order, so the output is the same on every file system.
9. **`--exclude-listed` inputs.** A relative path under "Reports read" resolves from the current directory, the repository root the skill runs the collector from. A retro that is missing or not UTF-8 is refused with `collect_findings.py: cannot read <retro>`, one with no "## Reports read" heading with `collect_findings.py: <retro> has no '## Reports read' heading`, and `--exclude-listed` with no value with the usage line; each exits 2. An empty list under the heading excludes nothing. A folder argument that does not exist is not refused, as before: the skill passes `<archive_root>`, which a repository with no closed plan does not have yet.
10. **The test's row mismatch** prints the rows that differ, `-` expected and `+` got, instead of both full lists, and its JSON helpers skip blank lines, so a run with no findings shows as missing rows rather than a Python traceback.

### User-visible changes

- The collector's output over the ledgers. Before: `.scratch/archive` gave 276 rows from 18 of the 23 reports, `{'unclassified': 20, 'spec': 135, 'standards': 43, 'behaviour': 40, 'proof': 38}`; `.scratch .scratch/archive` gave 308. After: `.scratch/archive` gives 547 rows from all 23 reports, `{'spec': 241, 'standards': 116, 'behaviour': 86, 'proof': 104}`, none unclassified; `.scratch .scratch/archive` gives 642.
- `--exclude-listed`. Before: any `...-refuter.md` token anywhere in the file, compared as spelled, split on whitespace. After: the backtick-quoted paths under "## Reports read", compared by real path; the three refusals above (exit 2).
- The head comment of `collect_findings.py` states the new reading, the refusals and the path order.
- README.md:119. Before: "`collect_findings.test.sh` checks that the collector reads both heading styles of a refuter report and its repair rounds, skips closures and "none", reads a report once when the archive sits inside the ledger root, and starts after a previous retro." After:

  > - `collect_findings.test.sh` runs the collector over reports in the shapes the refuter writes: dashed and numbered findings under numbered and plain headings, and repair rounds with and without `### Spec` to `### Behaviour` subheadings. It checks that the Verification, Not checked, Closed, Closures and Usage lists, a subheaded round's list before its subheadings, closures and "none" give no finding, and that backtick and tilde fences of any length are skipped, indented ones included. It also checks that a report is read once when the archive sits inside the ledger root. With `--exclude-listed`, the reports quoted under the earlier retro's "Reports read" heading are skipped by real path, a path holding a space included, and a retro with no such heading, a missing retro and one that is not UTF-8 are refused.

### What the brief got wrong or left impossible

- The premises reproduce: `git show HEAD:skills/plan-retro/templates/collect_findings.py | wc -l` gives 140, the test 96, and the base collector printed 308 over `.scratch .scratch/archive` (`wc -l`, 308).
- One effect of the real-path key the brief fixes, for the orchestrator to rule on: a report listed while its plan is open (`.scratch/<plan>/...`) is read again by the next retro once the plan folder moves into `.scratch/archive/`, because its real path changes. Shown on a scratch ledger under `$TMPDIR`:

  ```
  $ python3 collect_findings.py --exclude-listed retro.md .scratch .scratch/archive | wc -l   # retro lists .scratch/p/agents/reviews/1-refuter.md
  0 findings
         0
  $ mv .scratch/p .scratch/archive/p
  $ python3 collect_findings.py --exclude-listed retro.md .scratch .scratch/archive | wc -l
  1 findings
         1
  ```

  A key that survives the move (for example the plan folder's name, the step and the file name) would be a change to the matching the brief specifies, so it is not made here.

