# Step 6 report: self-rule in the loop

Everything in the brief is done, with the rulings of `agents/briefs/6-cases.md` (A, B, C and the two sentences outside the brief's list) carried under the items they change. One question is left for the orchestrator, under "Anything in the brief wrong or impossible" (the `refute` sentence at line 152).

## Open items of the state file

Quoted from the main checkout, `/Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, read only (the worktree's copy is older), as `6-cases.md` says:

```
- none
```

## The cases, first run on the unchanged tree

Read before any change, with these commands on the unchanged tree: `grep -n 'self_rule\|self-rule'` over `plan-orchestration`, `spec`, `refute`, `land`, `ordo-help` and `grill` SKILL.md printed nothing (exit 1); `grep -rn 'choices.md\|(self-rule)\|C<n>' skills docs/dev README.md` printed nothing (exit 1); `ls skills/plan-orchestration/templates` and `ls .scratch/choices.md` printed "No such file or directory". No skill reads `self_rule`, "(self-rule)", `choices.md` or `C<n>`, and every open item waits for the user through "Stops".

1. `self_rule` off or absent: met (nothing closes an item).
2. A model other than the configured one: open (Stops row, line 300). Met by default, no kind named.
3. A fix that deletes the user's data: open by default. Kind 2 not named.
4. A recurring-findings proposal: open by default (lines 209 and 216). The closed half (a brief's wording or a skill's step) did not exist. Unmet for that half.
5. An option that removes an approved step or replaces a Rulings bullet: open by default. Kind 3 not named.
6. The closing's `/roadmap done` diff: open (Stops row, line 299). Kind 4 not named.
7. A page waiting for the user's reading: open as a stop of its own (lines 311-312). Kind 5 and "blocks no step" not named.
8. Two options no rule ranks: open by default. Kind 6 not named.
9. A stop closed under self-rule: unmet. No section, bullet form, choices file or counter existed.
10. A third stop is "A step that does not converge" (`spec` "Steps / A stop" 3, Stops row line 299): open. Met by default.
11. An option running `/roadmap add` under a quoted ruling: open. Met by default (`roadmap/SKILL.md:55` takes only "(the user)").
12. A step tagged to a "(self-rule)." line: unmet (`spec:44` and the Stops row at line 300 accept only "(the user)"). The "(self-rule, replaced by C4)." half was refused by default, for another reason.
13. `/plan --ruling` on a "(self-rule)" bullet: unmet (`plan/SKILL.md:56` says no ruling). `/roadmap`, `/ordo-init`, `/repo-setup` (`roadmap:55`, `ordo-init:48`, `repo-setup:49`): met, no ruling.
14. `/grill` and a "(self-rule)" archived bullet: not carried (`grill:50-55`), met. After `C<n> Agree`: unmet, nothing rewrites the ending.
15. `/grill` contradicting a "(self-rule)" bullet: unmet (`grill:113` and `:214` make it a rule clash). A carried ruling dated before it: a clash, as now, met.
16 to 22 and 24: unmet. No skill read `C<n> Agree` or `C<n> =>`, no choices file existed, nothing refused `C99`.
23: unmet (no `Last number` line).
25: unmet (`grep -n 'choices' skills/ordo-help/SKILL.md` printed nothing).
26: unmet (no `Booked:` line).

Cases the brief's rules got wrong, handed back before any change, and the orchestrator's rulings (`agents/briefs/6-cases.md`), each carried under its item below:

- A, a check proposal of the recurring-findings pass: rule "any other proposal is closed", result a check closed with no approval of what it computes. Ruled (a): a check waits for the user like a rule sentence.
- B, a "(self-rule)" bullet replaced outside a review (case 24, the `/grill` leg of case 15): rule stood in `plan-orchestration` only, result the choice stayed in the file. Ruled (a): stated once in "Self-rule", "The choices file", with pointer sentences in `spec` and `grill`.
- C, `C<n> =>` and the steps of `Builds on it:`: rule conditioned on the tag, result a step tagged `(approved)` kept the old choice's text and an in-flight step was never found at its landing. Ruled (a).

## DONE / NOT DONE

Verify 1, the plan's verify list through the land skill's runner from the worktree's root, `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0, printed:

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

The one `git ls-files` line is the runner running the verify list's own command; I ran no other git command.

| Item | Status | Proof |
|---|---|---|
| What to build 1: `## Self-rule` in `plan-orchestration`, before "Two steps in flight", bullets Scope, The six kinds left open, Closing an open item, The counts, The choices file, The review of a choice, plus the bullet "A skill with its own approval stop" (item 1.2's last sub-bullet) | DONE | `sed -n '/^## Self-rule/,/^## Two steps/p' skills/plan-orchestration/SKILL.md` |
| 2: the places in `plan-orchestration` (description trigger, Steps 3 sub-bullet and line 57, Steps 10 sub-bullet, resume points, recurring-findings pass 209 and 216, Stops sub-bullet, row "A rule clash", "What it reads" 6, "only the user's ruling" at 258, 267, 346) | DONE | diff below; description 865 characters |
| 3: `skills/plan-orchestration/templates/choices.md`, the dictated text, ASCII | DONE | 15 lines; `LC_ALL=C grep -nP '\t'` and `LC_ALL=C grep -n '[^ -~]'` print nothing |
| 4: `spec` (description, "What it reads" 4, Steps 1, Steps 6, "A ruling" 1 and 2, Stops row) | DONE | diff below; description 1015 characters |
| 5: `plan/SKILL.md` lines 56 and 138 | DONE | diff below |
| 6: `plan/templates/plan.md` line 20 and the new Rulings line | DONE | diff below |
| 7: `plan/templates/orchestrator-state.md` lines 37, 39, 41 | DONE | diff below |
| 8: `grill` line 83, Steps 3 sub-bullet, "An answer that contradicts" 1 sub-bullet; lines 50, 52, 55 unchanged | DONE | diff below; `sed -n '50p;52p;55p' skills/grill/SKILL.md` still read "(the user)" |
| 9: `ordo-help` (description, Quick start, "What it reads" 4, Steps 2 and renumbering, the two sequence lines at column 31, lines 69 and 78) | DONE | `awk '/^C<n>/{print index($0,"under")}' skills/ordo-help/SKILL.md` printed 31 and 31; description 472 |
| 10: `refute` line 151, `land` line 213 | DONE | diff below |
| 11: `shared-rules.md` line 20, the sentence word for word | DONE | diff below |
| 12: `plan-terms.md` and `docs/glossary.md`, **quoted ruling** and **resume point**, equal | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| 13: `README.md` line 18 and the two lines after `/land` at column 31 | DONE | diff below |
| 14: the band sentence in `gen_figures.py`, figures regenerated | DONE | verify 4 below |
| 15: no version change, no change to open item, ruling or the three new terms, `self_rule` off in this plan's state file; `roadmap:55`, `ordo-init:48`, `repo-setup:49` keep "(the user)" alone | DONE | no `metadata.version` line differs from the copy taken at the start (the diff below shows none); verify 2 shows no hit in those three |
| Ruling A | DONE | lines 209 and 216 of the section, diff below |
| Ruling B | DONE | "The choices file" last bullet, `spec` "A ruling" 2 bullet, both `grill` sub-bullets, diff below |
| Ruling C | DONE | "The review of a choice" bullets, Steps 9 sub-bullet, diff below |
| `plan-orchestration` Stops row "A finding that is the user's" carried | DONE | diff below |
| `land` line 214 as the ruling gives it | DONE | diff below |

Verify 2, `grep -rn '(self-rule)' skills README.md docs/glossary.md | cut -c1-110`, printed hits in: `skills/land/SKILL.md:214`, `skills/grill/SKILL.md:83`, `:115`, `:216`, `skills/plan/SKILL.md:56`, `skills/plan/templates/plan.md:32`, `skills/spec/SKILL.md:44`, `:227`, `:229`, `:238`, `:305`, `skills/plan-orchestration/SKILL.md:239`, `:256`, `:265`, `:267`, `:358` (line numbers as of that run, before three later edits to this file), `skills/repo-setup/templates/plan-terms.md:77`, `docs/glossary.md:82`. It printed none in `roadmap/SKILL.md`, `ordo-init/SKILL.md`, `repo-setup/SKILL.md`, `ordo-help/SKILL.md` or `README.md`. The `land` hit is the line `6-cases.md` dictates.

Readers of "(the user)" of the brief's "What is on the tree", each against "(self-rule)":

- `skills/spec/SKILL.md:44`: now also reads "(self-rule)", since a step's authority is a ruling and ADR 0004's decision says `/spec` accepts it.
- `skills/spec/SKILL.md:223` and `:225` (now `:227` and `:229`): write "(the user)." for a ruling of the user and "(self-rule)." for a choice; they are the writers of the line `:44` reads.
- `skills/plan/SKILL.md:56`: now also reads "(self-rule)", since `/plan` accepts it as a quoted ruling.
- `skills/grill/SKILL.md:50`, `:52`, `:55`: unchanged, "(the user)" only, since a carried ruling and a ruling that sets a plan aside are only bullets the user agreed with, and a "(self-rule)" bullet becomes one only on `C<n> Agree`.
- `skills/grill/SKILL.md:83`: now also reads "(self-rule)", since `/grill` accepts a quoted ruling as `/plan` does.
- `skills/grill/SKILL.md:236` and `:239`: unchanged; they write `/grill`'s own bullets, which are the user's answers and carried rulings of the user.
- `skills/roadmap/SKILL.md:55`, `skills/ordo-init/SKILL.md:48`, `skills/repo-setup/SKILL.md:49`: unchanged, "(the user)" alone, since those skills write `.agents/plan.yaml`, the shared rules or the roadmap, which are kind 3 or step 7's, and an option that runs them stays open at their approval stop.
- `skills/plan/templates/plan.md:31`: unchanged; line 32 is the new "(self-rule)" line.
- `skills/grill/references/decision-form.md:49`, `:50`, `:77`: unchanged, worked examples of `/grill`'s own bullets.
- `skills/repo-setup/templates/plan-terms.md:15` (carried ruling) and `:94` (ruling): unchanged ("carried ruling" stays "(the user)"; **ruling** is step 8's). `:77` (quoted ruling): now also reads "(self-rule)" for `plan`, `grill` and `spec`, and `docs/glossary.md:82` equals it.

Verify 3, the flow walked by hand on a scratch copy under `$TMPDIR` (removed after), following only the new text. Setup: a ledger root holding a copy of `.scratch/2-e-a-self-rule/` (state file with `self_rule: on`), a second plan folder `archive/9-old-plan/` with two "(self-rule)" bullets and a state file, and `choices.md` made from the template (its head and `Last number` line copied) holding C3, C5, C6, C7 under `# Entry 2.E.A self-rule` and C4, C8 under `# Entry 9 Old plan`, with `Last number: C8`. Fixture lines added to the copy: Rulings bullets `Open item D`, `F`, `G`, `H` ending "(self-rule)." and, in the archived plan, `Open item E` and `Open item J`; step 5 ticked; a step `7a ... (ruling G)`. The text was applied with a small script that only performed the edits the text names; no git command was run. Dates in the walk are placeholders (`2026-10-02`). Changed lines of each `diff -u` (long lines cut with `[...]`):

Case 16, `C3 Agree` (text followed: "The review of a choice", the bullet `C<n> Agree` and its three sub-bullets; the bullet found by name `Open item D` in the Rulings section of the plan `Booked:` names, at line 85):
```
choices.md:           - the whole "## C3. Where the cost table lives (2026-10-01)" block, 7 lines; "# Entry 2.E.A self-rule" stays (C5, C6, C7 are under it)
plan.md:              - Open item D (2026-10-01): the cost table is kept in one file, which unblocks step 4 (self-rule).
                      + Open item D (2026-10-01): the cost table is kept in one file, which unblocks step 4 (the user).
orchestrator-state.md: + - 2026-10-02: C3, Where the cost table lives: agreed by the user.
```

Case 17, `C4 Agree` on an archived plan (`Booked:` named `ledger/9-old-plan/plan.md:14`, which no longer exists; the folder with the same slug under `archive/` holds `Open item E` at line 14):
```
choices.md:           - the whole C4 block; "# Entry 9 Old plan" stays (C8 is under it)
archive/9-old-plan/plan.md:
                      - Open item E (2026-09-02): the old format stays, which unblocks step 1 (self-rule).
                      + Open item E (2026-09-02): the old format stays, which unblocks step 1 (the user).
archive/9-old-plan/orchestrator-state.md:
                      + - 2026-10-02: C4, Which format the old plan keeps: agreed by the user.
```

Case 18, `C5 => <text>`, step 5 of `Builds on it:` ticked, plan open (found by name at line 86; `Booked:` said 86):
```
choices.md:           - the whole C5 block
plan.md:              + - 5a The reviewer model of step 5 follows C5: the reviewer key reads Opus; check: the key, read back (1 commit) (ruling C5 Which model the reviewer runs on)     [before the closing]
                      - Open item F (2026-10-01): the reviewer runs on Sonnet, which unblocks step 5 (self-rule).
                      + Open item F (2026-10-01): the reviewer runs on Sonnet, which unblocks step 5 (self-rule, replaced by C5).
                      + - C5 Which model the reviewer runs on (2026-10-02): the reviewer runs on Opus, which unblocks the review of step 5, replacing Open item F (the user).
                      + ### Step 5a, the reviewer model: Step 0 (2026-10-02) / - Corrects step 5, which landed on the choice C5 (Open item F), replaced by the user.
orchestrator-state.md: + - 2026-10-02: C5, Which model the reviewer runs on: replaced by the user's ruling C5.
```
The tag `(ruling C5 Which model the reviewer runs on)` names the new bullet as `spec` "What it reads" 4 reads a name (the text before its first ` (`), and the bullet ends "(the user).", so `/spec` accepts it.

Case 19 (and 26), `C6 => <text>`, no step of `Builds on it:` landed, step 7a unprepared and tagged `(ruling G)`. The fix step of case 18 had added a line above the Rulings, so `Booked:` said 87 and the bullet was at line 88; it was found by name (case 26):
```
choices.md:           - the whole C6 block
plan.md:              - 7a The next-entry run, second half (ruling G)
                      + 7a The next-entry run stays one step, as ruled in C6 (ruling C6 How the next-entry run splits)
                      - Open item G (...) (self-rule).  ->  + Open item G (...) (self-rule, replaced by C6).
                      + - C6 How the next-entry run splits (2026-10-02): the next-entry run stays one step, so no step 7a is added, replacing Open item G (the user).
orchestrator-state.md: + - 2026-10-02: C6, How the next-entry run splits: replaced by the user's ruling C6.
```
No fix step was added.

Case 24, C7's bullet `Open item H` replaced by a `Ruled:` reply booked as `Open item K` (the choice still in the file; the bullet at line 89, `Booked:` said 88):
```
choices.md:           - the whole C7 block and its entry heading "# Entry 2.E.A self-rule" (no choice left under it)
plan.md:              - Open item H (...) (self-rule).  ->  + Open item H (...) (self-rule, replaced by Open item K).
                      + - Open item K (2026-10-02): the figure band keeps no sentence on self-rule, replacing Open item H (the user).
orchestrator-state.md: + - 2026-10-02: C7: replaced by Open item K.
```

Case 21, `C8 => <text>`, step 1 of the archived plan landed, plan closed and archived (bullet found by the slug under `archive/`, line 15):
```
choices.md:           - the whole C8 block and "# Entry 9 Old plan"; the head and "Last number: C8" stay
archive/9-old-plan/plan.md:
                      - Open item J (...) (self-rule).  ->  + Open item J (...) (self-rule, replaced by C8).
                      + - C8 Whether the old gate stays (2026-10-02): the old gate stays, so step 1 of the old plan needs a follow-up, replacing Open item J (the user).
archive/9-old-plan/orchestrator-state.md:
                      + - 2026-10-02: C8, Whether the old gate stays: replaced by the user's ruling C8.
drafted, not run: /roadmap add "Follow C8: the old gate of plan 9 stays; step 1, which landed on the choice, is corrected to follow it"   (shown at that skill's approval stop)
```

Case 22: `C99 Agree` against a file holding C3, C5, C6, C7, C4, C8 printed "refused: C99 is not in the choices file, which holds C3, C5, C6, C7, C4, C8; nothing written", and `cmp` showed the file unchanged. With the file moved away, `C3 Agree` printed "refused: there is no choices file; nothing written".

Case 9 and case 23, a stop of step 4 on a false premise whose recommended option rewrites the approved step's text. Open item M written in full in the state file's open items and under step 4's Step 0, then closed by "Closing an open item" 2 to 5. `Last number: C8` gave C9:
```
choices.md:           - Last number: C8   + Last number: C9
                      + # Entry 2.E.A self-rule
                      + ## C9. Where step 4 reads the price table (2026-10-02)
                      + Options: (a) ... Recommend (a) ... Lazy option: (b).
                      + Taken: (a)
                      + Booked: `ledger/2-e-a-self-rule/plan.md:93`
                      + Builds on it: 4
orchestrator-state.md: + - 2026-10-02: Open item M, step 4 premise on the price table: closed under self-rule, C9.
plan.md:              + - Open item M (2026-10-02): the step 4 text says the price table is read from the `plan.yaml`, which unblocks step 4 (self-rule).     [line 93]
                      ~ step 4's line rewritten
```
The Rulings bullet read as a ruling by `spec` "What it reads" 4 (ends "(self-rule).", name `M`). The resume-point commit and the second `/spec` run are text steps with no files to diff and were not run (no git).

Points where the text was thin during the walk:
- A closed plan's Closed items are in the archived plan folder's state file; the text says "that plan's Closed items", which I read that way (cases 17 and 21).
- The text gives the form of the fix step but not where its Step 0 is written; I followed the plan's own `### Step <n>, <title>: Step 0` pattern (case 18).
- `<the ruling's name>` in case 24 needs the `Ruled:` booking to have written a Rulings bullet; I booked `Open item K` as a bullet. A `Ruled:` that writes no bullet leaves the name undefined (spec "A ruling" 2 writes a bullet only for the rulings it lists).
- With a choices file holding no choice, the refusal names no numbers ("which holds no choice").
- In case 21 the choice leaves the file before the user answers the `/roadmap add` draft, as the text says ("once booked").
- A copy of an open item under a Step 0 can start with the same `- Open item <L> (` as the Rulings bullet; the search is limited to the Rulings section, and the sentence says "in the Rulings section of the plan".

Verify 4: `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (31507 bytes)` and `wrote docs/figures/plan-loop.svg (31477 bytes)`, exit 0. `cmp` against the copy taken before: `docs/figures/plan-loop.svg` differs (rewritten); `docs/figures/pipeline.svg` is identical. The band text in the svg reads "... without asking. Under self_rule: on, the orchestrator closes every stop outside six kinds itself and writes it to choices.md for your review."

Verify 5: `python3 -c 'import glob,yaml; ...'` printed `472 skills/ordo-help/SKILL.md`, `865 skills/plan-orchestration/SKILL.md`, `1015 skills/spec/SKILL.md` (limit 1,024).

Verify 6: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.

Verify 7: `LC_ALL=C grep -n '[^ -~]'` over every changed file and `skills/plan-orchestration/templates/choices.md`, and `LC_ALL=C grep -nP '\t'` over the same, printed nothing. The plan's ASCII check is the last line of verify 1.

## Files, with line counts (`wc -l`)

- `skills/plan-orchestration/SKILL.md` 412
- `skills/plan-orchestration/templates/choices.md` 15 (new)
- `skills/spec/SKILL.md` 328
- `skills/plan/SKILL.md` 141
- `skills/plan/templates/plan.md` 43
- `skills/plan/templates/orchestrator-state.md` 70
- `skills/grill/SKILL.md` 338
- `skills/ordo-help/SKILL.md` 114
- `skills/refute/SKILL.md` 187
- `skills/land/SKILL.md` 217
- `skills/repo-setup/templates/shared-rules.md` 24
- `skills/repo-setup/templates/plan-terms.md` 121
- `docs/glossary.md` 138
- `README.md` 182
- `docs/figures/gen_figures.py` 751
- `docs/figures/plan-loop.svg` 166
- `.scratch/2-e-a-self-rule/agents/reviews/6-report.md` (this file)

## Judgment calls the brief left open

- The kinds are a numbered list, since the open item names a kind by its number and the cases cite "kind 3".
- "Closing an open item" opens "An open item that no bullet above leaves open, and that is not the stop "The counts" names", since the section also keeps open the option that runs `/roadmap`, `/ordo-init` or `/repo-setup` and the stop "A step that does not converge", and a bare "Every other open item" would contradict them.
- The sentence of the brief's item 3 explaining the template ("copies the head and the `Last number` line") is the first bullet of "The choices file", not text of the template file.
- The kinds, the skill-option stop and the counts are separate bullets, one rule each; `C<n> Agree` is split into three sub-bullets for the same reason.
- The Steps 9 pointer sub-bullet (ruling C) is the last sub-bullet of step 9; the Steps 10 sub-bullet follows the existing last sub-bullet.
- The "A rule clash" Stops row and the recurring-findings sentences follow the brief and the rulings; line 209 says the user rules "unless "Self-rule" closes it", line 216 carries ruling A.
- Outside the brief's item list, made because the change makes the sentence false (change standard rule 14), each serving the item it follows from:
  - `skills/plan-orchestration/SKILL.md` Stops row "A finding that is the user's" (ruled, `6-cases.md`) and Steps 3 line 57 "without the user's authority" became "without its authority", the renamed `spec` row.
  - `skills/spec/SKILL.md` Stops row "What resumes it": "The user's ruling, booked as" became "A ruling, booked as", as the other rows of that table read.
  - `skills/land/SKILL.md` line 214, as `6-cases.md` gives it.
- `docs/figures/gen_figures.py` line 563, `band_h` 216 to 221, outside the brief's lines 686-694: with the dictated sentence the band's label did not fit its box (`error: plan-loop.svg: box '/plan-orchestration <entry>': the label "A rule clash, ..." does not fit the box`), and 221 is the least height at which the generator accepts it.

## Before and after of every changed sentence

The changed lines of each file, as `diff -U0` printed them against the copy taken at the start, are the before and after: long lines were checked in full and are quoted here by the part that changed.

`skills/plan-orchestration/SKILL.md`
- Description: Triggers list ends "continue the plan, resume the plan." and now "continue the plan, resume the plan, C<n> Agree, C<n> => <ruling> (the review of a choice taken under self-rule)."
- What it reads: new item "6. Under `self_rule: on`, and for the review of a choice, the choices file `<ledger_root>/choices.md`."
- Steps 3, after "A stop it raises goes to the user by "Stops"": new sub-bullet "Under `self_rule: on`, the orchestrator closes it instead, as "Self-rule" says, unless it is of a kind that section leaves open."
- Steps 3 line 57: "...since only the user's ruling adds a step to the plan." became "...since a step is added to the plan only by a ruling of the user or, under `self_rule: on`, a choice "Self-rule" books." and "a step without the user's authority" became "a step without its authority".
- Steps 9: new last sub-bullet "At the landing of a step whose tag or Step 0 names a bullet ending "(self-rule, replaced by C<n>).", the orchestrator adds its fix step, as "Self-rule", "The review of a choice" says."
- Steps 10: new sub-bullet "Under `self_rule: on`, it also lists the choices taken since the loop began, by `C<n>` and heading, and says they are reviewed in `<ledger_root>/choices.md` with `C<n> Agree` or `C<n> => <ruling>`."
- Resuming: "...a step taken back out of main at its landing (its entry and Step 0), the landing, and a handover." became "...(its entry and Step 0), a choice taken under self-rule, a review of a choice, the landing, and a handover."
- Recurring-findings pass: "...booked in the open items, since the user rules on it, with the smallest change..." became "...since the user rules on it unless "Self-rule" closes it, with the smallest change..."; "The user rules on each proposal." became "The user rules on each proposal whose change is a rule sentence in the rules file, a standards page or the shared rules, or a check (a command in the verification list, or a script), since such a proposal is kind 3 of "Self-rule"." with the sub-bullet "Under `self_rule: on`, any other proposal is closed as "Self-rule" says."
- New section `## Self-rule` before "Two steps in flight".
- What earns a step of its own: "A step enters the step list only by the user's ruling, as a line..." became "...only by a ruling of the user or, under `self_rule: on`, a choice "Self-rule" books, as a line...".
- Reports: "...since only the user's ruling makes it a step." became "...since it becomes a step only by a ruling of the user or, under `self_rule: on`, a choice "Self-rule" books."
- Stops, row "A rule clash", When: adds ", except a ruling of the user that replaces a bullet ending "(self-rule)", which is no clash".
- Stops, row "A finding that is the user's", When: "which becomes a step only by the user's ruling" became "which becomes a step only by a ruling of the user or, under `self_rule: on`, a choice "Self-rule" books".
- Stops, after "A stop is booked in the state file's open items...": new sub-bullet "Under `self_rule: on`, a stop of a kind that "Self-rule" does not leave open is then closed as that section says."
- Rules: "It becomes a step only by the user's ruling." became "It becomes a step only by a ruling of the user or, under `self_rule: on`, a choice "Self-rule" books."

`skills/spec/SKILL.md`
- Description: "refuse a step without the user's authority" became "refuse a step without its authority".
- What it reads 4: "ends with "(the user)", named as the tag reads it" became "ends with "(the user)" or "(self-rule)", each with or without a full stop after it, named as the tag reads it"; new sub-bullet "A line ending "(self-rule, replaced by C<n>)." is no ruling."
- Steps 1: "A step whose line carries the user's authority goes on." became "...carries its authority goes on."; "and says the user's ruling is needed." became "and says a ruling is needed."
- Steps 6: new bullet "It holds the choices file `<ledger_root>/choices.md` when this run changed its `Builds on it:` line."
- A ruling 1: new paragraph after the `Ruled:` block "Under `self_rule: on`, `plan-orchestration`'s "Self-rule" books a choice the same way, as that section says."
- A ruling 2: both bullets that end `"(the user)."` now read `"(the user)." for a ruling of the user, or "(self-rule)." for a choice booked under self-rule`; new bullet (ruling B) "a ruling that replaces a bullet ending "(self-rule)" is booked as `plan-orchestration`'s "Self-rule", "The choices file" says;".
- Stops row: "A step without the user's authority" became "A step without its authority"; When: "each naming a ruling of the user in the Rulings section" became "each naming a ruling in the Rulings section, a line ending "(the user)" or "(self-rule)""; What resumes it: "The user's ruling, booked as" became "A ruling, booked as".

`skills/plan/SKILL.md`: line 56 "The bullet's first line does not end with "(the user)", with or without a full stop after it." became "The bullet's first line ends with neither "(the user)" nor "(self-rule)", each with or without a full stop after it."; line 138 "for a step a ruling of the user added later, naming" became "for a step a later ruling added, the user's or one booked under self-rule, naming".

`skills/plan/templates/plan.md`: line 20 "<a step a ruling of the user added after the approval, in one line;" became "<a step a later ruling added, in one line;"; new line 32 `- Open item <L> (<date>): <the option taken under self-rule, in one line, and what it unblocks> (self-rule).`

`skills/plan/templates/orchestrator-state.md`: the Open items heading ends "until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s "Self-rule" says)"; line 39 "only by the user's ruling;" became "only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s "Self-rule" books;"; line 41 "it leaves only when the user has ruled, and then" became "it leaves only when the user has ruled or, under `self_rule: on`, when the orchestrator closes it as `plan-orchestration`'s "Self-rule" says, and then". The Closed items form is unchanged.

`skills/grill/SKILL.md`: line 83 as `plan` line 56; Steps 3, under the bullet at line 113, new sub-bullet "A carried ruling dated after a bullet ending "(self-rule)" that it contradicts replaces that bullet, with no rule clash: the bullet's ending is rewritten to "(self-rule, replaced by <the carried bullet's name>)." Its choice leaves the choices file, and the Closed items of its plan gain their line, as `plan-orchestration`'s "Self-rule", "The choices file" says."; "An answer that contradicts" 1, new sub-bullet "The user's answer that contradicts a bullet ending "(self-rule)" replaces it, with no rule clash: the new bullet names the old one as the one it replaces, and the old one's ending is rewritten to "(self-rule, replaced by D<n>)." Its choice leaves the choices file, and the Closed items of its plan gain their line, as `plan-orchestration`'s "Self-rule", "The choices file" says." Lines 50, 52, 55 unchanged.

`skills/ordo-help/SKILL.md`: description gains "with the choices awaiting review that the orchestrator took under self-rule" after the sequence's parenthesis; Quick start lines read "print the sequence and the choices awaiting review" and "print the sequence and the choices awaiting review, then the named plan's position and the command that comes next"; What it reads gains item 4; Steps gains item 2 ("Print the choices awaiting review, for `/ordo-help` and for `/ordo-help <entry>`." with the count line, the `none` line and the completion criterion) and the old items 2 and 3 are items 3 and 4; the sequence gains, after the continuation line of `"Ruled: ..."`, the two dictated lines at column 31; "becomes a step only by your ruling" became "...only by your ruling, or under self-rule by a choice you review"; "of a ruling of yours)" became "of a ruling of yours or a choice taken under self-rule)".

`skills/refute/SKILL.md` line 151 and `skills/land/SKILL.md` line 213: "only by the user's ruling" became "only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s "Self-rule" books". `skills/land/SKILL.md` line 214: "A landed commit is reverted only on the user's ruling." became "A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`, on a choice `plan-orchestration`'s "Self-rule" books when the step's authority is a bullet ending "(self-rule)" alone; the revert of a step the user approved, or one a ruling of the user added, is kind 3."

`skills/repo-setup/templates/shared-rules.md` line 20: gains at its end "Under a plan's `self_rule: on`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review."

`skills/repo-setup/templates/plan-terms.md` line 77 and `docs/glossary.md` line 82: `whose first line ends with "(the user)", with the sub-bullets under it` became `whose first line ends with "(the user)", or with "(self-rule)" for `plan`, `grill` and `spec`, with the sub-bullets under it`. Line 86 and line 91: "...a step taken back out of main, the landing and a handover." became "...a step taken back out of main, a choice taken under self-rule and a review of a choice, the landing and a handover."

`README.md`: line 18 "It checks that the user approved the step and checks" became "It checks the step's authority, the user's approval or a ruling, and checks"; after the `/land` line, `C<n> Agree                    under self-rule: you agree with a choice the orchestrator took` and `C<n> => <your ruling>         under self-rule: you replace a choice with your ruling`.

`docs/figures/gen_figures.py`: the band text ends "...the rest of the row runs without asking. Under self_rule: on, the orchestrator closes every stop outside six kinds itself and writes it to choices.md for your review."; `band_h` 216 became 221.

## Sentences elsewhere that a changed name makes false

Found with `grep -rn "user's ruling\|ruling of the user\|only by the user\|the user approved\|user's authority\|only the user\|only on the user\|until ruled\|until the user has ruled\|only when the user has ruled" skills README.md docs/dev docs/glossary.md docs/figures/gen_figures.py`, `grep -rn "without the user's authority" skills README.md docs` (prints nothing after the changes) and `grep -rn 'choices.md\|C<n>' skills README.md docs/dev`:
- Made false and changed: each sentence in the diff above that says a step or a ruling comes only from the user (`plan-orchestration` 57, 258, 267, 298, 346; `spec` 3, 73, 75, 300; `plan` 138; `plan/templates/plan.md` 20; `plan/templates/orchestrator-state.md` 37, 39, 41; `refute` 151; `land` 213, 214; `ordo-help` 69, 78; `README.md` 18; the **quoted ruling** and **resume point** terms in both copies).
- Left, and still true: `plan-orchestration` "A stop is repeated in every report until the user has ruled" (a stop of a kind left open is repeated), the Stops rows' "What resumes it: The user's ruling" (the new Stops sub-bullet says when self-rule closes the stop), `spec` "Steps / A stop" 3 "until a ruling of the user rewrites, splits or removes it" (kept as the brief says), `plan-orchestration` line 219 "The user's ruling on the proposal approves what it computes" (a check is now kind 3).
- Step 8's, not changed here: **open item** (`plan-terms.md:58`, `docs/glossary.md:63`, "a decision only the user can make") and **ruling** (`:94`), which the brief and ruling D24 leave to step 8.

## Anything in the brief wrong or impossible

- `skills/refute/SKILL.md:152` (inside the range 149-153): "A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing, since only the user rules between the step and the ADR." Under `self_rule: on`, "Self-rule" kind 3 as dictated names the user's written rules and the reversal of a Rulings bullet, and no ADR, so a rule clash with an ADR is not a kind left open and the sentence "only the user rules" would be false for it. I left the sentence as it is, since neither the brief nor `6-cases.md` decides whether such a clash is kind 3. The orchestrator rules: either an ADR clash is added to kind 3 (then `plan-orchestration` "Self-rule", the Stops row "A rule clash" and this sentence stay true as written) or the sentence at `refute:152` gets the exception.
- The brief's item 8 puts the two `grill` sub-bullets as sub-bullets of line 113 and of "An answer that contradicts" 1; the first is a sub-bullet of the bullet at line 113 (seven spaces) and the second a sub-bullet of item 1, both as the brief and `6-cases.md` say.
- Nothing else in the brief was impossible.
