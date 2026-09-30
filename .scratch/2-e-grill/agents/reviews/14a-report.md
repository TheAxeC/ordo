Everything in the brief is done.

# Report: step 14a, `grill` carries rulings booked elsewhere, asks each part of an existing goal and gate, and states a count only from a full list

## Open items of the state file (verbatim, `.scratch/2-e-grill/orchestrator-state.md`, section "Open items")

- None.

## The first read of every case, on the unchanged tree

The unchanged tree is the worktree before the first edit; `diff` of its `skills/grill/SKILL.md`, `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md` against the main checkout printed nothing for each. Line numbers in this section are those of the unchanged `skills/grill/SKILL.md`, as `grep -n` printed them. Cases R1, R2, R6 and R13 were read from the input copies in `.scratch/2-e-grill/agents/briefs/14a-input-833e2e8/` (R13 from the main checkout's `.scratch/rulings/3-the-writing-base.md`).

- R1. Line 47 reads the Rulings of an open plan of the entry, or else its rulings file; no folder holds `# Plan: 3` and no rulings file exists at 833e2e8 (`ledger-files.txt`), so nothing is read. Line 84 marks a decision settled only from a line of those Rulings or an ADR. The ruling at `2-e-grill-plan.md:125` is not read, and both decisions are asked again.
- R2. Line 81 lists the decisions "the entry's goal and gate need", with no rule that a part of the goal or gate is a decision. The goal's "history words" and "word counts per section" are not guaranteed a decision.
- R3. No line reads a bullet of another plan; nothing is settled. The result the case names holds.
- R4. No line reads an archived plan's Rulings; nothing is settled or written. The result the case names holds.
- R5. No line reads a second source of rulings, so the two carried rulings are not seen. Line 164 (the section "An answer that contradicts") applies to an answer only. No clash is raised.
- R6. Line 84 does not read the ruling at `:125`, so D2 is asked with options, and no line restricts what a round says a ruling states. The redraft's wording can be shown as the ruling.
- R7. Line 81 has no per-part rule; an entry under "Not yet specified" gets no decision per part of its goal or of what must be known.
- R8. Line 81 has no per-part rule; the same.
- R9. Lines 94 to 101 (Steps 5) hold no rule on a count; a total can be stated from a lookup of two passages.
- R10. Line 47 and line 184 write into the open plan's Rulings; carried rulings from other files are never read. The destination holds, the carried rulings are missing.
- R11. Line 47 reads the entry's own file only; a rulings file of another entry is not read.
- R12. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- R13. Line 47 reads `.scratch/rulings/3-the-writing-base.md` (file lines 3 and 4 are D1 and D2); line 84 marks the two decisions settled from it; nothing is written again. The result the case names holds.
- R14. Lines 47 and 84 read the entry's own file; D5 and D11 both stand as lines that settle the decision, and no line says a bullet that is replaced settles nothing.
- R15. Line 164 covers an answer against an earlier ruling; a carried ruling is not read, so no clash is raised.
- R16. Line 81 has no rule on the parts of a gate; a gate joined by commas after a colon gets no decision per check.
- R17. No line carries a ruling, so no date rule exists.
- R18. Line 47 takes any folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` as the open plan, `.scratch/archive/2-d-.../plan.md` (first line `# Plan: 2.D The plan skills take the comparison's process changes`) included; answers would be written into the archived plan.

No case is one the brief's own rules get wrong, so there was no stop and no ruling. The readings the brief leaves to judgment, R11 and R16, are walked under "The walk" below.

## DONE / NOT DONE

| Item | State | Command that proves it, and its output |
|---|---|---|
| 1. "What it reads" 1 (line 34) and 6 (line 47, new lines 50 to 53) | DONE | verify 2 below: each line 1 of 1; verify 3: `diff -U2` shows lines 34 and 47 changed and lines 50 to 53 at three and five spaces after line 49 |
| 2. Steps 3: lines 89 to 103 after line 88, line 105 changed | DONE | verify 2 and 3; line 108 is still the completion line of Steps 3 |
| 3. Steps 5: lines 120 to 122 after line 119 and before the completion line 123 | DONE | verify 2 and 3 |
| 4. Steps 6: line 128 at three spaces after the answer form (line 127) | DONE | verify 2 and 3 |
| 5. Steps 10: line 146 at six spaces under line 145 | DONE | verify 2 and 3 |
| 6. "Steps / Writing what settled" 1: lines 212 to 214 after line 211 | DONE | verify 2 and 3; line 212 holds the double-backtick code span as given |
| 7. The Stops row "A round" (line 280) | DONE | verify 2 |
| 8. Rules: lines 303 and 305 at two spaces | DONE | verify 2 and 3 |
| 9. `skills/repo-setup/templates/plan-terms.md`: `carried ruling` after line 13, `design tree` changed | DONE | verify 2 and 5 |
| 10. `docs/glossary.md`: the same two changes | DONE | verify 2 and 5 |
| 11. Frontmatter `version: "1.1.0"` | DONE | verify 2 |
| Verify 1 | DONE | quoted below, exit 0 |
| Verify 2 | DONE | quoted below |
| Verify 3 | DONE | quoted below |
| Verify 4 | DONE | quoted below |
| Verify 5 | DONE | quoted below |
| Verify 6 | DONE | "The walk" below |

### Verify 1

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, exit status 0. Output:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

### Verify 2

The lines that differ from the main checkout's file (`diff <main file> <file>`, the lines prefixed `>`) were each written as the one line of a scratch file under `$TMPDIR`, and `grep -c -F -f <that file> <file>` was run for each. Output:

```
skills/grill/SKILL.md: 34 new or changed lines, 34 with grep -c -F -f = 1
skills/repo-setup/templates/plan-terms.md: 2 new or changed lines, 2 with grep -c -F -f = 1
docs/glossary.md: 2 new or changed lines, 2 with grep -c -F -f = 1
```

### Verify 3

`diff -U2 /Users/axelfaes/workspace/ordo/<file> <file>` was run for the three files. The leading-space count of each of the 34 new or changed lines of `skills/grill/SKILL.md`, in file order, printed `2 3 0 3 5 5 5 3 5 5 5 5 5 5 5 5 3 5 5 5 5 5 3 3 5 5 3 6 3 5 5 0 2 2`: the version line 2, line 34 at 3, line 47 at 0, line 50 at 3 with lines 51 to 53 at 5, line 89 at 3 with lines 90 to 97 at 5, line 98 at 3 with lines 99 to 103 at 5, line 105 at 3, line 120 at 3 with lines 121 and 122 at 5, line 128 at 3, line 146 at 6, line 212 at 3 with lines 213 and 214 at 5, the table row at 0, lines 303 and 305 at 2. The completion lines stay last: line 108 (Steps 3), line 123 (Steps 5), line 156 (Steps 10) and line 216 ("Steps / Writing what settled" 1), each the last line of its item.

### Verify 4

```
$ LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md
(no output, exit status 1)
$ LC_ALL=C grep -c '[^ -~]' docs/glossary.md /Users/axelfaes/workspace/ordo/docs/glossary.md
docs/glossary.md:0
/Users/axelfaes/workspace/ordo/docs/glossary.md:0
```

### Verify 5

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

## The walk of every case on the changed skill

Line numbers are those of the changed `skills/grill/SKILL.md` as `grep -n` prints them.

- R1 (`/grill 3` at 833e2e8).
  1. Line 47: no folder outside `.scratch/archive` holds `# Plan: 3` (`ledger-files.txt`) and no rulings file exists, so the entry's own Rulings are empty.
  2. Line 50: the section `## Rulings (2026-09-29)` of `.scratch/2-e-grill/plan.md` (input line 75) is read. Its bullet at input line 125, "Entry 3 and step 13 (2026-09-30)", names "roadmap entry 3" and its first line ends "(the user)."; by line 51 it is a carried ruling.
  3. Lines 52 and 89: the counting-script decision (D1 "(b), no counting script ...") and the entry-4 decision (D2 "(a), entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only") are settled.
  4. Lines 90 and 128: round 1 lists both as settled, unnumbered, after the answer form, with those words as written and `.scratch/2-e-grill/plan.md:125`; line 89 says neither is asked.
  5. Lines 212 and 305: at the first write of Steps 8 (line 139), two bullets ``- D<n> ... carried from `.scratch/2-e-grill/plan.md:125` (the user).`` go into the rulings file, which line 208 names as the destination when no plan is open, created with `# Rulings: <entry>`; line 146 lists both at the end.
- R2 (the same run, per-part decisions).
  1. Line 98: the entry has a goal, so each part of the goal is a decision, kept, changed or dropped.
  2. Line 100: the goal (input roadmap line 59) names as delivered the folder the writing skills share, the prose standard, the anti-pattern table, and the checks for non-ASCII, for dash asides, for history words and for word counts per section: seven decisions.
  3. Line 101: the gate (input roadmap line 60) checks the checks on the planted sample file and the clean file, the checks on a real draft reviewed by the user, the skill following `docs/dev/skill-layout.md`, and the ledger record for each `rebuild: writing` row: four decisions.
  4. Line 99: each quotes its part as the entry writes it. Line 103: each is a design decision. Line 109: each is asked in the round its prerequisites are settled.
  5. Line 91: the carried D1 settles part of the decisions on the checks, so the rest of each stays open and the ruling is quoted beside its options.
- R3.
  1. Line 50: only a bullet whose first line ends with "(the user)" is read as a carried ruling. A bullet ending "(decided by the orchestrator overnight ...)" is not one, so lines 51 to 53 do not apply and line 89 settles nothing from it.
- R4.
  1. Line 50: the archived plan's `## Rulings` is read, "an archived plan's included". The bullet "The review of Ordo (2026-09-28)" of `.scratch/archive/2-c-.../plan.md` names "roadmap entry 3" and ends "(the user)", so it is a carried ruling (line 51).
  2. Line 52: it settles no decision of the tree, since it states that entry 3 is redone from its sources and no keep, change or drop of a part or any design decision; line 212 writes one bullet for each decision it settles, so none is written.
- R5.
  1. Line 95: a carried ruling that contradicts another carried ruling, neither naming the other, is a rule clash.
  2. Line 188: a clash is shown in the next round as a decision of its own, and lines 191 to 193 give its options (reopen the earlier ruling by a new bullet that names the one it replaces; keep the earlier one; reopen the ADR where one is involved).
  3. Lines 109 and 124: the clash is in the frontier and in round 1.
- R6.
  1. Lines 50 to 53: the ruling at `2-e-grill-plan.md:125` is a carried ruling and settles the whole of D2.
  2. Lines 89 and 90: D2 is not asked; round 1 lists it with the ruling's words as written, "entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only".
  3. Line 92: what the round says the ruling states, and any difference, is said only from those words. No option or recommendation exists for D2, so none says it differs in the clause.
  4. Line 93: the redraft's line 33 ("D2 (a): entry 4 is redrafted after entry 3 is approved.") states the ruling in other words, so it is never shown as the ruling or as a difference from it.
- R7.
  1. Line 98: an entry under "Not yet specified" has a goal, so one decision per part of its goal (line 100).
  2. Line 102: one decision per part of what must be known, in place of the gate; line 101 applies to an entry with a gate, so there is no gate part.
  3. Line 103: each is a design decision.
- R8.
  1. Lines 98 to 101: one decision per part of the goal and one per part of the gate.
  2. Line 85: the goal's new parts that the design adds are decisions of the tree as before.
- R9.
  1. Line 120: a count stated in a round comes from a lookup that went through the whole of what is counted and listed each one.
  2. Line 122: a lookup of two passages only is not that, so the round names the places found, says the list may not be whole, and states no total.
  3. Lines 120 and 121: a lookup that went through both texts whole and listed each difference gives a count, with the list beside it.
- R10.
  1. Line 47: a folder outside `.scratch/archive/` whose `plan.md` opens with `# Plan: <entry>` is the open plan; line 49 makes its `## Rulings` the entry's Rulings.
  2. Line 50: other sections and other rulings files are read for carried rulings.
  3. Lines 53 and 208: a carried ruling is written into the `## Rulings` section of the open plan's `plan.md`, and a rulings file is used only "else"; line 212 writes it at the first write of Steps 8.
- R11.
  1. Line 50: every other rulings file under `<ledger_root>/rulings/` is read. A bullet in it that names the entry by number ("waits on 3") and ends "(the user)" is a carried ruling (line 51).
  2. Line 52: the decisions it settles are settled, judged by reading; a bullet that mentions the entry only as a dependency settles no decision of the tree.
  3. Line 212: one bullet is written for each decision it settles, so none is written for it.
- R12.
  1. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` (verify 5).
- R13 (`/grill 3` on the main checkout).
  1. Line 47: no open plan of entry 3, so the rulings file `.scratch/rulings/3-the-writing-base.md` is the Rulings.
  2. Line 88: its D1 (file line 3) and D2 (file line 4) settle the counting-script decision and the entry-4 decision, which are marked settled.
  3. Lines 50 and 51: the ruling "Entry 3 and step 13" (`.scratch/2-e-grill/plan.md:127` on the main checkout) is a carried ruling.
  4. Lines 96 and 97: its decisions are already settled by bullets of the entry's rulings file, judged by reading (D1 "(b) no counting script" and D2 "(a) after entry 3 is approved, entry 4 waiting on 3 for the prose rules only" hold what it states), so it is not written again.
  5. Line 105: after a restart in a new session the tree is drawn afresh from the Rulings file and the carried rulings, and steps 2 to 4 give the same result.
- R14.
  1. Line 94: D11 of `.scratch/rulings/3-the-writing-base.md` (file line 13, "replacing D5") names D5 (file line 7) as the one it replaces, so D5 settles nothing and D11 is the one carried.
  2. Line 212: the bullet written is for the decision D11 settles.
- R15.
  1. Line 95: a carried ruling that contradicts a bullet of the entry's rulings file, neither naming the other, is a rule clash.
  2. Lines 188 and 191 to 193: it is a decision of its own with the clash's options, in round 1 (lines 109 and 124).
- R16 (`docs/roadmap.md`, entry 2.I, gate at line 53).
  1. Line 101: one decision for each part of the gate, a part being each thing the gate checks.
  2. The gate after its colon checks: the run starts with the plan that comes first in the roadmap; the second plan's step waits until the first plan's step has landed; the steps in flight never exceed the one limit; no two landings overlap; the one report lists both plans' positions and open items. That is five decisions, so the user can keep one condition and drop another.
  3. "one real run over two open plans ... with a third step in flight beside them" is the setup of the check and "reviewed by you" is who judges it, so neither is a thing the gate checks.
  4. Line 99: each decision quotes its part; line 103: each is a design decision.
- R17.
  1. Line 213: the carried ruling's date is the date its bullet gives, or else the date its Rulings heading gives.
  2. The 2.E bullets "A:" to "O6" (`.scratch/2-e-grill/plan.md:79` onward) carry no date in their text and stand under `## Rulings (2026-09-29)` (`plan.md:77`), so the written bullet's `(<the carried ruling's date>)` is `2026-09-29` (line 212).
- R18 (`/grill 2.D`).
  1. Line 34: `archive_root` is read (`.agents/plan.yaml:7`, `archive_root: .scratch/archive`).
  2. Line 47: `.scratch/archive/2-d-.../plan.md` opens with `# Plan: 2.D ...` but lies inside the folder `archive_root` names, so it is not the open plan and the entry's Rulings are its rulings file `.scratch/rulings/<slug>.md` when it exists.
  3. Line 50: the archived plan's `## Rulings (2026-09-29)` (plan line 33) is read, "an archived plan's included"; bullets that name 2.D and end "(the user)" are carried rulings (line 51).
  4. Lines 208 and 212: the answers and the carried bullets go to the rulings file, created with `# Rulings: <entry>` when absent.

## Files changed

- `skills/grill/SKILL.md`: 306 lines (277 at the base).
- `skills/repo-setup/templates/plan-terms.md`: 120 lines (119 at the base).
- `docs/glossary.md`: 137 lines (136 at the base).
- `.scratch/2-e-grill/agents/reviews/14a-report.md`: this report.

## Judgment calls the brief left open

- R16: line 101 says "each thing the gate checks" and gives no rule on a colon and commas; the count of five rests on reading "reviewed by you" as who judges the gate and the run over two plans as its setup.
- R4 and R11: whether a carried ruling settles a decision is read, as line 52 and the brief's decision 2 say; R4's bullet is read as settling none because it states no keep, change or drop of a part and no design decision of the tree.

## User-visible changes, before and after

- `grill` reads the Rulings of every plan under `<ledger_root>/` (an archived plan's included) and every other rulings file for bullets that name the entry and end "(the user)", lists the decisions they settle in round 1 and at the end, and writes each as a bullet carried from its source. Before, it read the entry's own Rulings or rulings file only (line 47 at the base).
- For an entry that has a goal, `grill` asks one decision per part of the goal, of the gate, and under "Not yet specified" of what must be known. Before, line 81 listed the decisions the goal and gate need with no per-part rule.
- A count stated in a round comes from a full lookup with the list beside it. Before, Steps 5 held no rule on a count.
- An archived plan whose heading names the entry is no longer taken as the open plan. Before, line 47 took it and the answers went into the archived `plan.md`.
- The glossary gains **carried ruling** and a longer **design tree**; `skills/grill/SKILL.md` is version 1.1.0.

## In the brief, with the evidence

- R13 gives the carried ruling at `.scratch/2-e-grill/plan.md:126`; on the main checkout `grep -n 'Entry 3 and step 13' .scratch/2-e-grill/plan.md` printed line 127. The walk uses 127.
- R6 says the redraft states the ruling without "waiting on 3 for the prose rules only". The redraft's option (a) in D2 (`plan-drafts-3-the-writing-base.md:28`) holds that clause; its "Axel's rulings" line (`:33`) does not. The walk reads the line that lacks it.
- `archive_root` is listed as an optional key at line 34 (item 1), while `skills/plan/templates/plan.yaml:9` calls it required and `README.md` lists it among the nine required keys; `skills/ordo-init/templates/check_config.py` has no mention of it (`grep -n archive_root` printed nothing). The text is as the brief gives it (decision 5).
- The bullet form of item 6 encloses the quoted words in double quotes. A carried bullet whose settling words hold a double quote, such as `.scratch/2-e-grill/plan.md:79` ("A: the ADR test is "a record per decision ..."), has no rule for the inner quotes; the two bullets R1 writes hold none.
- Line 213 gives the date of a carried ruling from the bullet or its Rulings heading; a bullet of a rulings file that holds no date has a heading `# Rulings: <entry>` with none, and no case covers it.
