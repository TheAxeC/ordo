# Step 6a report

Everything in the brief is done.

## Open items of the state file

- none.

## Result

| Item | State | Command and its summary line |
|---|---|---|
| Cases turned into assertions and run on the unchanged collector | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1` on the unchanged collector: `FAIL: "- None." under "## 1. Spec" is not a finding with heading spec`; `collect_findings.py` over the cases file alone printed `0 findings` (the three item cases red, the unread-section and fence cases green) |
| 1. The collector keeps every item | DONE | `grep -n 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing' skills/plan-retro/templates/collect_findings.py` prints nothing (exit 1); `FIRST_SENTENCE` removed too, as nothing else used it; `NOT_READ` and the fence reading stay; the docstring says every such item is a finding and that the retro sets aside by reading one that reports no defect or a closure that holds |
| 2. The tests | DONE | `sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 \| tail -1`: `PASS: collect_findings.py scratch tests` |
| 3. The retro skill sets aside by reading | DONE | `python3 utils/check_skill_layout.py`: `ok: skills/plan-retro/SKILL.md`; Grouping and Steps 1's first bullet changed, `templates/retro.md` unchanged because it already agrees (its "No defect" section lists each set-aside finding with no proposal, and its counts by heading count every finding) |
| 4. The README bullet | DONE | `README.md:119` is one sentence; no other README line changed |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0 |
| Verify 2 | DONE | the two commands above: `PASS: collect_findings.py scratch tests`, and the grep prints nothing |
| Verify 3 | DONE | the planted faults below |

## Planted faults

Each on a copy of `collect_findings.py` and `collect_findings.test.sh` in a `mktemp -d "$TMPDIR/plant6a.XXXXXX"` folder, the constant put back and an `if <filter>: continue` put back as the first line of the item loop in `findings`, then `sh <copy>/collect_findings.test.sh 2>&1 | grep -m1 '^FAIL:'`:

- `NOTHING_FOUND` drop (`NOTHING_FOUND.match(item.strip())`): `FAIL: "- None." under "## 1. Spec" is not a finding with heading spec`
- `OTHERS_REPRODUCE` drop (`OTHERS_REPRODUCE.fullmatch(FIRST_SENTENCE.match(item.strip()).group(1))`): `FAIL: "- The other figures reproduce." under "## 2. Proof" is not a proof finding`
- `CLOSURE` drop (`fixed is None and CLOSURE.search(item)`): `FAIL: "- Spec 1: closed." in a round with no subheadings is not an unclassified finding`

The silent cases (Verification, Not checked, Usage and Closed lists, and a fence under `## 1. Spec`, all in the same cases file) are held by an exact comparison of the cases file's rows with the three findings; their control is the three items the same file reads under Spec, Proof and the round.

## Files

| File | Lines (`wc -l`) before | after |
|---|---|---|
| `skills/plan-retro/templates/collect_findings.py` | 293 | 270 |
| `skills/plan-retro/templates/collect_findings.test.sh` | 459 | 466 |
| `skills/plan-retro/SKILL.md` | 110 | 111 |
| `skills/plan-retro/templates/retro.md` | 40 | 40 (unchanged) |
| `README.md` | 175 | 175 (line 119 only) |

Test fixtures removed as existing only for a dropped form: the `- none.` and `- None. Nothing changes for a user.` items of report 1 (the Proof section's fence stays, the empty `## 4. Behaviour` section goes), its round's `: closed`, `Closures checked` and `Checked and holding` items, report 2's `## Proof` with `- none.`, report 3's `## Behaviour` with `1. none.` and its round's `### Standards` with `- none.`, and the whole `5-refuter.md` fixture (the no-finding forms, their near misses and the closure that does not hold) with its five expected rows. The head comment's lines naming them are replaced by one line naming the cases file. Every other case stays and passes.

## User-visible changes

- Collector output: before, an item opening with "none", "nothing", "no finding", "no defect", "otherwise none" or "checked, no defect", an item saying only that the other figures reproduce, and a round item holding ": closed" or opening with "Closed", "Closures checked" or "Checked and holding" gave no JSON line; after, each gives a finding like any other item.
- `SKILL.md` Steps 1, first bullet: before "It prints one JSON line per finding: plan, step, report, run, heading, location, text."; after "It prints one JSON line per finding, every item it keeps as "Grouping" says: plan, step, report, run, heading, location, text."
- `SKILL.md` Grouping: before, one bullet setting aside a finding that reports no defect; after, one bullet saying the collector keeps every top-level item under the four headings and in a repair round, whatever its text says, and one saying a finding whose text reports no defect or a closure that holds is set aside, by reading, as the kind "no defect", counted and listed in the "No defect" section with no proposal.
- `README.md:119`: before, seven sentences listing the shapes, including "a closure that holds, or an item in one of the forms that report nothing" and "each near miss of those forms"; after, one sentence: the test runs the collector over scratch reports in the refuter's shapes and checks that every item under the four headings and in a repair round is a finding whatever its text says, that the unread lists and fenced lines give none, and that `--exclude-listed` skips the listed runs and refuses a retro it cannot use.

## Brief

Nothing in the brief was wrong. Each of the five cases holds under the brief's rules: "Spec 1: closed." does not end in a heading word followed by a full stop and does not say "not reproduced", so it is `unclassified`, as decision 2 says. The grep of change-standard rule 14 over `skills/`, `utils/`, `docs/` and `README.md` for the dropped forms finds no other sentence the change makes false; `skills/refute/templates/report.md:38` ("Or: none.") still describes what the refuter writes, and such an item now reaches the retro, which sets it aside as Grouping says.
