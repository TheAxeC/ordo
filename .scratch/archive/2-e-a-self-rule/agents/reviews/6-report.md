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

## Repair round 1

Everything in the round is done, with the rulings D1, D2 and D3 of `agents/briefs/6-round-1-rulings.md` and the two points the builder resolved (land's Stops row, the reference's "Scope" heading). One check cannot pass in this worktree: `sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md` exits 1 at its seventh command, `sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1`, because `skills/plan-orchestration/templates/plan_cost.test.sh` landed on main with step 4 after this worktree's base and is not in the worktree; every other command of the list passes (output below). This section holds the state after the round, and where it differs from a statement of the sections above, it holds.

### The one pointer not renamed (D3)

`skills/repo-setup/templates/shared-rules.md` line 20 still reads, word for word as the user ruled it, "...such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review." It is the one pointer to the self-rule text that is not renamed to `references/self-rule.md` and a heading: the `## Self-rule` section of `plan-orchestration` stays and says, in its Reference bullet, where the six kinds are, so the pointer still lands on a section that exists and names the file. Every other pointer in `skills/`, `docs/` and `README.md` names `references/self-rule.md` and a heading (`grep -rn '"Self-rule"' skills docs README.md` lists only this sentence and the reference's own "Scope" line, which names `SKILL.md`'s section).

### Item 1. Spec 1, the `Booked:` line names the bullet

- `skills/plan-orchestration/templates/choices.md` line 14 before: ``Booked: `<path>:<line>` ``; after: ``Booked: `<path>:<line>` (Open item <L>)``.
- `references/self-rule.md`, "The choices file", the third line of a choice reads ``Booked: `<path>:<line>` (Open item <L>)``, and its sub-bullet reads "`Booked:` names the Rulings bullet by its path relative to the repository root as it stands at the booking, its line, and its name `Open item <L>`, which the review searches by."
- "The review of a choice", first bullet: "The session finds the choice's bullet by the name its `Booked:` line gives, in the Rulings section of the plan that line names or, for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`, and the line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking." Before, the review took the name from the choice's open item `<L>` and "the line number of `Booked:` is where the search starts".
- Check that fails without the change: case 26 below, where the walk takes the name only from the `Booked:` line.

### Item 2. Spec 2, a replacing ruling writes its own bullet

- `references/self-rule.md`, "The choices file", last bullet: "A ruling of the user that replaces a bullet ending "(self-rule)" outside a review (a `Ruled:` reply, or a `/grill` answer or carried ruling) always writes a Rulings bullet of its own that names the bullet it replaces: for a `Ruled:` reply, `- Open item <L> (<date>): <the ruling's text>, replacing Open item <L'> (the user).`, and for `/grill`, the bullet the `grill` skill writes." Its sub-bullets: the replaced bullet's ending is rewritten to "(self-rule, replaced by <the new bullet's name>).", its choice leaves the file, `- <date>: C<n>: replaced by <the new bullet's name>.` joins the plan's Closed items, and the steps whose tag or Step 0 names the replaced bullet are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`.
- `skills/spec/SKILL.md` "Steps / A ruling" 2, before: "a ruling that replaces a bullet ending "(self-rule)" is booked as `plan-orchestration`'s "Self-rule", "The choices file" says;" After: "a ruling that replaces a bullet ending "(self-rule)" always writes a Rulings bullet of its own that names the bullet it replaces, and is booked as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says;". Its sub-bullet before: "A line ending "(self-rule, replaced by C<n>)." is no ruling." After: "A line ending "(self-rule, replaced by <name>)." is no ruling."
- `skills/plan-orchestration/SKILL.md` Steps 9 landing sub-bullet, before "...names a bullet ending "(self-rule, replaced by C<n>)."..." after "...names a bullet ending "(self-rule, replaced by <name>).", for any name, the orchestrator adds its fix step, as `references/self-rule.md`, "The review of a choice", says." The reference's own landing bullet matches any `<name>` too.
- `skills/grill/SKILL.md` carried-ruling sub-bullet (line 116), before: "...replaces that bullet, with no rule clash: the bullet's ending is rewritten to "(self-rule, replaced by <the carried bullet's name>)."..." After: "...replaces that bullet, with no rule clash: the carried bullet written for it names the old bullet as the one it replaces, and the old bullet's ending is rewritten to "(self-rule, replaced by <the carried bullet's name>)."..." The user-answer sub-bullet (line 217) already named the old bullet and now points at the reference.
- Check: case 24 below writes the new bullet naming `Open item M`, rewrites M's ending, removes C9, adds the Closed items line and treats step 7.

### Item 3. Spec 3, kind 3 names an ADR contradiction or supersession

- `references/self-rule.md`, "The six kinds left open", kind 3, third sub-bullet: "Kind 3 also names a contradiction of an ADR in force, or an option that supersedes one."
- Read and true after the change: `skills/refute/SKILL.md` "Finding dispositions" second bullet ("A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing, since only the user rules between the step and the ADR."), since kind 3 keeps such an item open under self-rule; `skills/ordo-help/SKILL.md` line 71 ("a contradiction of an ADR the brief asked for is raised to you as an open item instead"), same reason; the Stops row "A rule clash" of `plan-orchestration` (line 307, "A contradiction between two established rules or decisions, an ADR among them, except a ruling of the user that replaces a bullet ending "(self-rule)", which is no clash"), whose subject is the stop and whose kind is now named in the reference. None needed a change.

### Item 4. Spec 4 and Standards 3, "The counts"

- `references/self-rule.md` "The counts", before (in `SKILL.md`): "The stop "A step that does not converge" is never closed under self-rule, since each of its options rewrites, splits or removes a step the user approved." After: "The stops a count of "Rules" raises, "A step that does not converge" and the second failure of a step's landing (the `land` skill's Steps 6), are never closed under self-rule, since each ends a step the unattended loop has not brought to an end, and closing it would let the loop run without bound." Its second bullet keeps "An item closed under self-rule counts as a stop of its step (the `spec` skill's "Steps / A stop" 3)."
- "Closing an open item" first sentence: "An open item that "The six kinds left open" and "A skill with its own approval stop" do not hold, and that is not one of the stops "The counts" names, is closed by the orchestrator the moment it is raised..." (before: "...that no bullet above leaves open, and that is not the stop "The counts" names...").
- `plan-orchestration` Stops sub-bullet (line 315), before: "Under `self_rule: on`, a stop of a kind that "Self-rule" does not leave open is then closed as that section says." After: "Under `self_rule: on`, a stop of a kind that `references/self-rule.md`, "The six kinds left open", does not name, and that is not one of the stops its "The counts" names, is then closed as its "Closing an open item" says."
- `skills/land/SKILL.md` Stops row "A red line for the user", What resumes it, before: "The user's ruling". After: "The user's ruling or, under `self_rule: on`, for a first failure, the choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; the second failure of a step's landing always waits for the user". Steps 6 line 81 ("a second failure of its landing always goes to the user as an open item, and the step waits for the ruling") agrees and is unchanged.
- Read and true: `plan-orchestration` Steps 9 line 124 ("A second failure of the step's landing always goes to the user, as the `land` skill's Steps 6 says."), the Rules counts sentence (lines 351 and 352: "A step that cannot go on within those counts stops for the user by "Stops", and the loop moves to the next step.", true because "The counts" keeps those stops open), `land` Steps 6 (lines 63 and 81).

### Item 5. Spec 5, kind 3 names a check, a command or a script

`references/self-rule.md` kind 3, fourth sub-bullet: "Kind 3 also names an option that adds a check, a command in the verification list or a script, since the rules file reserves to the user the approval of what a new script computes." The recurring-findings lines of `plan-orchestration` (220, 221) already say a check proposal is kind 3 and now point at "The six kinds left open".

### Item 6. Standards 1, `/plan` under a self-rule quoted ruling

`skills/plan/SKILL.md` Steps 3, before: "A step list written under a quoted ruling is the approved list." After, two bullets: "A step list written under a quoted ruling whose bullet ends "(the user)" is the approved list." and "A step list written under a quoted ruling whose bullet ends "(self-rule)" has each step line end with `(ruling <name>)`, naming that bullet, never `(approved)`." Rules (line 139), as D2 gives it: "...or `(ruling <name>)` for a step a ruling added, after the approval or under a quoted ruling ending "(self-rule)", the ruling being the user's or one booked under self-rule, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says." (before "for a step a later ruling added, the user's or one booked under self-rule"). Template line 20 of `skills/plan/templates/plan.md`, as D2 gives it: "- <2a> <a step a ruling added, in one line; the check that proves it> (<n> commit) (ruling <L>)" (before "a step a later ruling added"). The Rules sentence on `(approved)` ("`(approved)` for a step of the list the user approved") stays true: a list written under a "(self-rule)" ruling is not one the user approved. The glossary **authority** term ("`(approved)` for a step of the list the user approved when the plan opened") is true and unchanged.

### Item 7. Standards 2, `/grill` under a self-rule quoted ruling

- `skills/grill/SKILL.md` "What it reads" 11 gains a sub-bullet (line 76): "A bullet ending "(self-rule)" settles the decisions its sub-bullets state as the orchestrator's choice, and states no roadmap diff: wherever this skill speaks of a roadmap diff a quoted ruling states, or of a draft that is the ruled change, only a bullet ending "(the user)" is meant." It covers lines 152, 172, 178, 247, 261, 268 and 312, which speak of a roadmap diff a quoted ruling states.
- Line 124, before: "...is marked settled, since the quoted ruling is the user's answer ("Rules"): it is made at the first write of Steps 8, and a draft that ... shows as the decision is asked in the next round." After: "...since the quoted ruling is the user's answer ("Rules"), when the quoted ruling's bullet ends "(the user)": it is made at the first write of Steps 8, and a draft that ... shows as the decision is asked in the next round. When the bullet ends "(self-rule)", the roadmap diff stays a decision of the next round, as `/roadmap` refuses such a bullet."
- Rules lines 335 and 336, before: "A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff." After: "A quoted ruling whose bullet ends "(the user)" and holds the entry's changed text is the user's answer to the roadmap diff." and "A quoted ruling whose bullet ends "(self-rule)" settles the decisions it states as the orchestrator's choice, not as the user's answer, and its roadmap diff stays a decision for the user."

### Item 8. Standards 4, sentences made false

- `README.md` line 56, before: "...unless the run is under a quoted ruling that states the change. One marked "only when"..." After: "...unless the run is under a quoted ruling that states the change. Under `self_rule: on` such a stop waits only when it is of a kind `plan-orchestration` leaves open. One marked "only when"..."
- `skills/spec/SKILL.md` line 3: the description phrase "a candidate being the user's choice, or under self-rule the orchestrator's" is in, and D1 applied: "run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief)" became "run the brief check by a fresh read-only agent". Description length, the characters between the quotation marks: before 1015, after 987 (limit 1,024).
- `skills/diagnose/SKILL.md` line 210, What resumes it, before: "Inside a plan, the user's ruling on the open item; run by a person, the user's next direction". After: "Inside a plan, the user's ruling on the open item or, under `self_rule: on`, the choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; run by a person, the user's next direction".
- `skills/land/SKILL.md` line 183: item 4 above.
- The **quoted ruling** term, `skills/repo-setup/templates/plan-terms.md` line 77 and `docs/glossary.md` line 82, before: "...or with "(self-rule)" for `plan`, `grill` and `spec`, with the sub-bullets under it." After: "...whose first line ends with "(the user)", or with "(self-rule)" for `plan` and `grill`, with the sub-bullets under it. The sub-bullets state the change in full." followed by its "Stated in:" unchanged. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
- Two sentences that repeat the README sentence and the same change makes false, carried with it (beyond the round brief's list): `docs/glossary.md` line 136, the term **mark, of a figure**, "every run" clause, before: "...unless the run is under a quoted ruling that states the change;" after: "...unless the run is under a quoted ruling that states the change or, under `self_rule: on`, the stop is of none of the six kinds `plan-orchestration` leaves open;"; and the legend note of both figures, `docs/figures/gen_figures.py` lines 395 and 396, before: "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change." after: "A stop marked "every run" waits each time, unless a quoted ruling states the change or, under self_rule: on, the stop is of none of the six kinds." (a note must fit one line of 990 px, and the longer wordings did not). `docs/figures/pipeline.svg` and `docs/figures/plan-loop.svg` are rewritten by `python3 docs/figures/gen_figures.py` (exit 0), and the band sentence of the loop figure is unchanged.
- Names the round changed, grepped across `skills`, `docs` and `README.md`: `"Self-rule"` as a pointer (none left but the shared-rules sentence and the reference's Scope line), `Booked:` (only `docs/adr/0005-...md:20`, an ADR, which describes the path as it stands at booking and stays true), `replaced by` (only `spec/SKILL.md:45`, changed), `(approved)` (`ordo-help:85`, `glossary.md:12` and `plan-terms.md:7`, all true), and the lines of `quoted ruling` that call it the user's (the `roadmap`, `ordo-init`, `repo-setup` and `plan` lines take only a "(the user)" bullet or are about the draft, and are true; `grill` is item 7). No other hit is false.
- The `references/self-rule.md` sentence "the line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking" replaces "is where the search starts", which would miss a bullet that moved up.

### Item 9. Standards 5, the reference file

- Created `skills/plan-orchestration/references/self-rule.md` (87 lines), with the headings Scope, The six kinds left open, A skill with its own approval stop, Closing an open item, The counts, The choices file, The review of a choice. Its "Scope" is one line: "The scope is the first bullet of `SKILL.md`'s section "Self-rule"." (the ruling's point).
- `skills/plan-orchestration/SKILL.md` `## Self-rule` (line 223) holds two bullets: "Scope" ("The section applies under `self_rule: on` in the configuration block, and with `self_rule: off`, or the key absent, every open item waits for the user, as "Stops" says.") and "The reference" ("Under `self_rule: on`, and for the review of a choice, the session reads `references/self-rule.md`, which says which open items stay with the user, how the others are closed, and how the choices file is kept and reviewed."). The description is 865 characters and keeps the `C<n> Agree` and `C<n> =>` triggers. The band sentence of the figure stays.
- Every pointer is renamed to `plan-orchestration`'s `references/self-rule.md` plus its heading: in `plan-orchestration/SKILL.md` (lines 56, 59, 127, 213, 220, 221, 226, 268, 277, 308, 315, 357), `land` (213, 214), `refute` (151), `spec` (221 and 238), `grill` (116, 217), `plan/templates/orchestrator-state.md` (37, 39, 41), `diagnose` (210), `land` (183). Within `plan-orchestration` the pointer is written `references/self-rule.md`, since it is the skill's own file, as `docs/dev/skill-layout.md` line 73 says ("A file of this skill's `references/` is named `references/<file>`"); in other skills it is named with its skill, as line 74 says.
- `docs/dev/skill-layout.md` line 66 (material a step needs only in some runs goes in `references/<name>.md`, named by its path from the step that reads it; never in `templates/`): the file sits in `references/`, and every step that needs it names it by path. Line 67 (a reference section of row 6 holds only material every run reads): the kept `## Self-rule` section holds the scope and the pointer, which every run reads. The reference file's headings are noun-phrase labels, one rule per bullet.

### Item 10. Proof 1, the walk on a scratch copy

Scratch ledger under `$TMPDIR/ordo6-walk/ledger`: a copy of `.scratch/2-e-a-self-rule/` (without `agents/`), plan folders `2-f-plan`, `archive/2-d-plan` and `archive/2-c-plan` with Rulings bullets `Open item P`, `Q` and `R`, bullets `F`, `G` and `H` and steps `6c` (landed), `6d`, `6e`, `12b` added to the copy of this plan, and a `choices.md` made from the new template holding C3 to C8 with `Last number: C8`. The cases ran in the order 9, 16, 17, 18, 19, 21, 22, 24, 26, 25, 23, each followed from the lines of `references/self-rule.md` named below (the walk printed each followed line with its number, and no git command ran: "committed by path" is the paths named in the reference's last bullet). Each case lists the lines followed, where the name and the bullet came from, and the lines written (diff -u "+" and "-" lines; the choice's removed lines are shown by their heading). The scratch copy is removed after.

Case 9: self_rule: on, /spec stops on a false premise of step 7; recommended option rewrites the approved step 7 text
- Text followed: self-rule.md:29, self-rule.md:31, self-rule.md:32, self-rule.md:33, self-rule.md:35, self-rule.md:36, self-rule.md:50, self-rule.md:37, self-rule.md:38.
- Written to <scratch>/2-e-a-self-rule/orchestrator-state.md: `- 2026-10-02: Open item M, step 7's premise: closed under self-rule, C9.`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- 7 `next_entry`: after a closing, under the key as the plan.yaml template names it, the next open entry through `/grill` (each round answered with its recommendation, written to `choices.md`), `/plan` (its approval written to `ch`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item M (2026-10-02): step 7's text rewritten to the key's real name, which unblocks step 7's `/spec` (self-rule).`
- Written to <scratch>/2-e-a-self-rule/plan.md: `### Step 7, next_entry: Step 0 (stopped 2026-10-02)`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item M of the state file, as booked there: the premise of step 7 that names a key the plan.yaml template lacks; closed under self-rule, C9.`
- Written to <scratch>/choices.md: `Last number: C9`
- Written to <scratch>/choices.md: `## C9. Step 7's premise (2026-10-02)`
- Written to <scratch>/choices.md: `Options: (a) rewrite step 7's text; (b) add a step. Recommendation: (a), the step stays buildable. The lazy option: (b).`
- Written to <scratch>/choices.md: `Taken: (a)`
- Written to <scratch>/choices.md: `Booked: `ledger/2-e-a-self-rule/plan.md:91` (Open item M)`
- Written to <scratch>/choices.md: `Builds on it: 7`
- Removed from <scratch>/2-e-a-self-rule/orchestrator-state.md: `- Open item M (2026-10-02): step 7's premise `next_entry` names a key the plan.yaml template lacks. Options: (a) rewrite step 7's text to the key's re`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- 7 `next_entry`: after a closing, the next open entry through `/grill` (each round answered with its recommendation, written to `choices.md`), `/plan`
- Removed from <scratch>/choices.md: `Last number: C8`

Case 16: C3 Agree, C3 the only choice of entry 2.F, plan 2.F open
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:72, self-rule.md:73, self-rule.md:74, self-rule.md:75, self-rule.md:87.
- name from the Booked line: "Open item P"; Booked path ledger/2-f-plan/plan.md (line 15); plan file used: <scratch>/ledger/2-f-plan/plan.md
- bullet found at line 15 of that file: - Open item P (2026-10-01): the option for C3, in one line (self-rule).
- Written to <scratch>/2-f-plan/orchestrator-state.md: `- 2026-10-02: C3, Decision three: agreed by the user.`
- Written to <scratch>/2-f-plan/plan.md: `- Open item P (2026-10-01): the option for C3, in one line (the user).`
- Removed from <scratch>/2-f-plan/plan.md: `- Open item P (2026-10-01): the option for C3, in one line (self-rule).`
- Removed from <scratch>/choices.md: `# Entry 2.F Plan F`
- Removed from <scratch>/choices.md: `## C3. Decision three (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-f-plan/plan.md:15` (Open item P)`
- Removed from <scratch>/choices.md: `Builds on it: none`

Case 17: C4 Agree, plan 2.D closed and archived (Booked path names the folder as it was before the archive)
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:72, self-rule.md:73, self-rule.md:74, self-rule.md:75, self-rule.md:87.
- name from the Booked line: "Open item Q"; Booked path ledger/2-d-plan/plan.md (line 15); plan file used: <scratch>/ledger/archive/2-d-plan/plan.md
- bullet found at line 15 of that file: - Open item Q (2026-09-02): the option for C4, in one line (self-rule).
- Written to <scratch>/archive/2-d-plan/orchestrator-state.md: `- 2026-10-02: C4, Decision four: agreed by the user.`
- Written to <scratch>/archive/2-d-plan/plan.md: `- Open item Q (2026-09-02): the option for C4, in one line (the user).`
- Removed from <scratch>/archive/2-d-plan/plan.md: `- Open item Q (2026-09-02): the option for C4, in one line (self-rule).`
- Removed from <scratch>/choices.md: `# Entry 2.D Plan D`
- Removed from <scratch>/choices.md: `## C4. Decision four (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-d-plan/plan.md:15` (Open item Q)`
- Removed from <scratch>/choices.md: `Builds on it: none`

Case 18: C5 => text; step 6c of Builds on it: has landed, plan 2.E.A open
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:76, self-rule.md:77, self-rule.md:78, self-rule.md:80, self-rule.md:85, self-rule.md:87, spec/SKILL.md:44.
- name from the Booked line: "Open item F"; Booked path ledger/2-e-a-self-rule/plan.md (line 88); plan file used: <scratch>/ledger/2-e-a-self-rule/plan.md
- bullet found at line 88 of that file: - Open item F (2026-10-01): the option for C5, in one line (self-rule).
- new bullet written: - C5 decision five (2026-10-02): the key keeps its old name, replacing Open item F (the user).
- fix step written: - 12a follow C5 in the code step 6c landed; check: the diff read (1 commit) (ruling C5 decision five)
- /spec of the fix step: reading its tag, per the spec skill
- tag names: "C5 decision five"; Rulings line matching it by the text before its first " (": ['- C5 decision five (2026-10-02): the key keeps its old name, replacing Open item F (the user).']
- line ends "(the user)." -> authority accepted: True
- Written to <scratch>/2-e-a-self-rule/orchestrator-state.md: `- 2026-10-02: C5, Decision five: replaced by the user's ruling C5.`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- 12a follow C5 in the code step 6c landed; check: the diff read (1 commit) (ruling C5 decision five)`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item F (2026-10-01): the option for C5, in one line (self-rule, replaced by C5).`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- C5 decision five (2026-10-02): the key keeps its old name, replacing Open item F (the user).`
- Written to <scratch>/2-e-a-self-rule/plan.md: `### Step 12a, follow C5: Step 0 (2026-10-02)`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Corrects step 6c, which landed on Open item F before C5 replaced it.`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- Open item F (2026-10-01): the option for C5, in one line (self-rule).`
- Removed from <scratch>/choices.md: `## C5. Decision five (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-e-a-self-rule/plan.md:88` (Open item F)`
- Removed from <scratch>/choices.md: `Builds on it: 6c`

Case 19: C6 => text; 6d (tag names the old bullet) and 6e (tag (approved)) not yet prepared, none landed or in flight
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:76, self-rule.md:77, self-rule.md:78, self-rule.md:84, self-rule.md:85, self-rule.md:87.
- name from the Booked line: "Open item G"; Booked path ledger/2-e-a-self-rule/plan.md (line 89); plan file used: <scratch>/ledger/2-e-a-self-rule/plan.md
- bullet found at line 91 of that file: - Open item G (2026-10-01): the option for C6, in one line (self-rule).
- new bullet written: - C6 decision six (2026-10-02): the key is set by the roadmap entry, replacing Open item G (the user).
- step 6d: tag names the old bullet; text and tag rewritten
- step 6e: tag is (approved); text rewritten, tag kept
- Written to <scratch>/2-e-a-self-rule/orchestrator-state.md: `- 2026-10-02: C6, Decision six: replaced by the user's ruling C6.`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- 6d not yet prepared step rewritten to follow C6 (1 commit) (ruling C6 decision six)`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- 6e not yet prepared step rewritten to follow C6 (1 commit) (approved)`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item G (2026-10-01): the option for C6, in one line (self-rule, replaced by C6).`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- C6 decision six (2026-10-02): the key is set by the roadmap entry, replacing Open item G (the user).`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- 6d not yet prepared step built on C6 (1 commit) (ruling G)`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- 6e not yet prepared step built on C6 (1 commit) (approved)`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- Open item G (2026-10-01): the option for C6, in one line (self-rule).`
- Removed from <scratch>/choices.md: `## C6. Decision six (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-e-a-self-rule/plan.md:89` (Open item G)`
- Removed from <scratch>/choices.md: `Builds on it: 6d, 6e`

Case 21: C8 => text; step 1a of Builds on it: landed, plan 2.C closed and archived
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:76, self-rule.md:77, self-rule.md:78, self-rule.md:83, self-rule.md:85, self-rule.md:87.
- name from the Booked line: "Open item R"; Booked path ledger/2-c-plan/plan.md (line 15); plan file used: <scratch>/ledger/archive/2-c-plan/plan.md
- bullet found at line 15 of that file: - Open item R (2026-09-03): the option for C8, in one line (self-rule).
- new bullet written: - C8 decision eight (2026-10-02): the key is named by the template, replacing Open item R (the user).
- /roadmap add draft, shown to the user at that skill's approval stop, not written: "/roadmap add <goal that follows C8: the key is named by the template>"
- Written to <scratch>/archive/2-c-plan/orchestrator-state.md: `- 2026-10-02: C8, Decision eight: replaced by the user's ruling C8.`
- Written to <scratch>/archive/2-c-plan/plan.md: `- Open item R (2026-09-03): the option for C8, in one line (self-rule, replaced by C8).`
- Written to <scratch>/archive/2-c-plan/plan.md: `- C8 decision eight (2026-10-02): the key is named by the template, replacing Open item R (the user).`
- Removed from <scratch>/archive/2-c-plan/plan.md: `- Open item R (2026-09-03): the option for C8, in one line (self-rule).`
- Removed from <scratch>/choices.md: `# Entry 2.C Plan C`
- Removed from <scratch>/choices.md: `## C8. Decision eight (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-c-plan/plan.md:15` (Open item R)`
- Removed from <scratch>/choices.md: `Builds on it: 1a`

Case 22: C99 Agree with no C99 in the file
- Text followed: self-rule.md:86, self-rule.md:86.
- REFUSED: C99 is not in the file; the file holds C7, C9; nothing written
- (a) no choices file: the file is removed in a copy of the scratch ledger
- REFUSED: there is no choices file at <ledger_root>/choices.md; nothing written

Case 24: Ruled: reply replacing Open item M (a "(self-rule)" bullet whose choice C9 is still in the file)
- Text followed: self-rule.md:57, self-rule.md:58, self-rule.md:59.
- new bullet written (the ruling's own, naming the replaced one): - Open item N (2026-10-02): step 7 keeps its first text, replacing Open item M (the user).
- step 7 rests on it (its Step 0 names it): text rewritten, tag (approved) kept
- Written to <scratch>/2-e-a-self-rule/orchestrator-state.md: `- 2026-10-02: C9: replaced by Open item N.`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- 7 `next_entry`: after a closing, the next open entry through `/grill` (each round answered with its recommendation, written to `choices.md`), `/plan` (its approval written to `choices.md`) and the loop, stopping at an entry unde`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item M (2026-10-02): step 7's text rewritten to the key's real name, which unblocks step 7's `/spec` (self-rule, replaced by Open item N).`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item N (2026-10-02): step 7 keeps its first text, replacing Open item M (the user).`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- 7 `next_entry`: after a closing, under the key as the plan.yaml template names it, the next open entry through `/grill` (each round answered with it`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- Open item M (2026-10-02): step 7's text rewritten to the key's real name, which unblocks step 7's `/spec` (self-rule).`
- Removed from <scratch>/choices.md: `## C9. Step 7's premise (2026-10-02)`
- Removed from <scratch>/choices.md: `Options: (a) rewrite step 7's text; (b) add a step. Recommendation: (a), the step stays buildable. The lazy option: (b).`
- Removed from <scratch>/choices.md: `Taken: (a)`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-e-a-self-rule/plan.md:91` (Open item M)`
- Removed from <scratch>/choices.md: `Builds on it: 7`

Case 26: the Booked line number is stale (a step line added above the Rulings); C7 Agree
- Text followed: self-rule.md:70, self-rule.md:71, self-rule.md:72, self-rule.md:73, self-rule.md:74, self-rule.md:75, self-rule.md:87.
- Booked line says line 90; the bullet is now at line 94
- name from the Booked line: "Open item H"; Booked path ledger/2-e-a-self-rule/plan.md (line 90); plan file used: <scratch>/ledger/2-e-a-self-rule/plan.md
- bullet found at line 94 of that file: - Open item H (2026-10-01): the option for C7, in one line (self-rule).
- Written to <scratch>/2-e-a-self-rule/orchestrator-state.md: `- 2026-10-02: C7, Decision seven: agreed by the user.`
- Written to <scratch>/2-e-a-self-rule/plan.md: `- Open item H (2026-10-01): the option for C7, in one line (the user).`
- Removed from <scratch>/2-e-a-self-rule/plan.md: `- Open item H (2026-10-01): the option for C7, in one line (self-rule).`
- Removed from <scratch>/choices.md: `# Entry 2.E.A Self-rule in the loop`
- Removed from <scratch>/choices.md: `## C7. Decision seven (2026-10-01)`
- Removed from <scratch>/choices.md: `Options: (a) a`
- Removed from <scratch>/choices.md: `Recommendation: a`
- Removed from <scratch>/choices.md: `The lazy option: the cheaper one.`
- Removed from <scratch>/choices.md: `Taken: (a) a`
- Removed from <scratch>/choices.md: `Booked: `ledger/2-e-a-self-rule/plan.md:90` (Open item H)`
- Removed from <scratch>/choices.md: `Builds on it: 12b`

Case 25: /ordo-help and /ordo-help <entry> with a choices file of two entries and three choices; then none
- Text followed: ordo-help/SKILL.md:43, ordo-help/SKILL.md:44.
- Printed, as `ordo-help/SKILL.md` 43 reads it: `Choices awaiting review: 3`, then `# Entry 1 Alpha` with `## C1. First decision (2026-10-01)` and `## C2. Second decision (2026-10-01)`, then `# Entry 2 Beta` with `## C3. Third decision (2026-10-01)`.
- with no file or no choice: Choices awaiting review: none

Case 23: Last number: C8 after C3 to C8 were reviewed (no choice left in the file); the next choice
- Text followed: self-rule.md:50.
- number used: C9
- Written to <scratch>/choices.md: `Last number: C9`
- Written to <scratch>/choices.md: `# Entry 2.G Plan G`
- Written to <scratch>/choices.md: `## C9. First choice after the reviews (2026-10-02)`
- Removed from <scratch>/choices.md: `Last number: C8`

### The checks

`sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, from the worktree root, exit 1:

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
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
sh: skills/plan-orchestration/templates/plan_cost.test.sh: No such file or directory
checks: failed with exit 127: sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
```

The same runner against a copy of that state file with only the `plan_cost.test.sh` line removed (the copy was outside the worktree and is removed), exit 0; the `$ git ls-files` line is the runner's own, no git command was run by hand:

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

Verify 2, `grep -rn '(self-rule)' skills README.md docs/glossary.md` (each line cut to 110 characters here): hits in `plan-orchestration/SKILL.md`, `spec/SKILL.md`, `plan/SKILL.md`, `plan/templates/plan.md`, `grill/SKILL.md`, `plan-terms.md` and `docs/glossary.md`, and none in `skills/roadmap`, `skills/ordo-init` or `skills/repo-setup/SKILL.md` (`grep -rln '(self-rule)' skills/roadmap skills/ordo-init skills/repo-setup/SKILL.md` prints nothing). `plan`, `spec` and `plan-orchestration` accept "(self-rule)" where they read a ruling's authority; `grill` accepts it in "What it reads" 11 and rejects it for a carried ruling; `roadmap`, `ordo-init` and `repo-setup` read only "(the user)" for a quoted ruling, since `ordo-init` writes `.agents/plan.yaml`, `repo-setup` the shared rules, and `/roadmap add` under `next_entry` is step 7's.

```
skills/land/SKILL.md:214:- A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`
skills/grill/SKILL.md:76:    - A bullet ending "(self-rule)" settles the decisions its sub-bullets state as th
skills/grill/SKILL.md:84:      - The bullet's first line ends with neither "(the user)" nor "(self-rule)", eac
skills/grill/SKILL.md:116:       - A carried ruling dated after a bullet ending "(self-rule)" that it contradi
skills/grill/SKILL.md:124:   - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is mar
skills/grill/SKILL.md:217:   - The user's answer that contradicts a bullet ending "(self-rule)" replaces it, w
skills/grill/SKILL.md:336:  - A quoted ruling whose bullet ends "(self-rule)" settles the decisions it states 
skills/plan/SKILL.md:56:     - The bullet's first line ends with neither "(the user)" nor "(self-rule)", each 
skills/plan/SKILL.md:99:     - A step list written under a quoted ruling whose bullet ends "(self-rule)" has e
skills/plan/SKILL.md:139:- Every step line of `plan.md` ends with its authority: `(approved)` for a step of th
skills/plan/templates/plan.md:32:- Open item <L> (<date>): <the option taken under self-rule, in one line, and
skills/spec/SKILL.md:44:   - Each ruling a tag names is a line of the Rulings section that ends with "(the use
skills/spec/SKILL.md:227:   - a ruling that adds or splits a step is also written in the Rulings section as a 
skills/spec/SKILL.md:229:   - a ruling on an option that runs a skill with an approval stop and states the cha
skills/spec/SKILL.md:238:   - a ruling that replaces a bullet ending "(self-rule)" always writes a Rulings bul
skills/spec/SKILL.md:305:| A step without its authority | The step's line ends with neither `(approved)` nor a
skills/plan-orchestration/SKILL.md:307:| A rule clash | A contradiction between two established rules or decis
skills/plan-orchestration/references/self-rule.md:33:3. It is booked as the `spec` skill's "Steps / A ruling" 
skills/plan-orchestration/references/self-rule.md:57:- A ruling of the user that replaces a bullet ending "(se
skills/plan-orchestration/references/self-rule.md:71:- A bullet of that name that does not end "(self-rule)" o
skills/plan-orchestration/references/self-rule.md:74:  - The bullet's ending is rewritten from "(self-rule)." 
skills/plan-orchestration/references/self-rule.md:77:  - The old bullet's ending is rewritten from "(self-rule
skills/repo-setup/templates/plan-terms.md:77:- **quoted ruling**: a ruling of the user given to a skill by the
docs/glossary.md:82:- **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <led
```

Verify 4, `python3 docs/figures/gen_figures.py` prints `wrote docs/figures/pipeline.svg (31547 bytes)` and `wrote docs/figures/plan-loop.svg (31517 bytes)`, exit 0; `cmp` against the copies taken at the start of the round: both rewritten (the legend note).

Verify 5, description lengths by the count `docs/dev/skill-layout.md` gives (characters between the quotation marks): spec 987, plan-orchestration 865, ordo-help 472; the other skills: diagnose 905, grill 808, land 726, ordo-init 632, plan-retro 616, plan 477, refute 951, repo-setup 861, roadmap 1001, session-retro 779.

Verify 6, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template` (also the ninth line of the second output above).

Verify 7, `LC_ALL=C grep -n '[^ -~]'`, a tab grep and a trailing-space grep over every changed file (the ones in the list below plus the two figures) print nothing; the `$ git ls-files -coz ...` command in the second output above passes.

### Files, with line counts (`wc -l`)

```
87 skills/plan-orchestration/references/self-rule.md
358 skills/plan-orchestration/SKILL.md
328 skills/spec/SKILL.md
340 skills/grill/SKILL.md
142 skills/plan/SKILL.md
217 skills/land/SKILL.md
187 skills/refute/SKILL.md
237 skills/diagnose/SKILL.md
43 skills/plan/templates/plan.md
70 skills/plan/templates/orchestrator-state.md
15 skills/plan-orchestration/templates/choices.md
121 skills/repo-setup/templates/plan-terms.md
138 docs/glossary.md
182 README.md
751 docs/figures/gen_figures.py
3216 total
```

Also changed: `docs/figures/pipeline.svg` and `docs/figures/plan-loop.svg` (regenerated).

### Judgment calls

- `skills/land/SKILL.md` Stops row "A red line for the user" gets the exception for a first failure and keeps the second failure with the user, as the builder proposed and the rulings took.
- The reference's "Scope" is one line pointing at the kept bullet of `SKILL.md`, as the builder proposed and the rulings took.
- The legend note of the figures and the glossary term **mark, of a figure** repeat the README sentence that the change makes false, so both carry the same exception (item 8); the figure note says "none of the six kinds" because a longer sentence does not fit one line of 990 px.
- The walk's fix step takes the number `12a`, after the last step before the closing, as `skills/plan/templates/plan.md` line 20 numbers a step a ruling added (`<2a>`); the reference's text gives `<k>` and no rule for it.
- The walk of case 9 writes a Step 0 section for step 7, since "Closing an open item" 6 commits "the step's Step 0" and the loop's Stops book each stop there.
