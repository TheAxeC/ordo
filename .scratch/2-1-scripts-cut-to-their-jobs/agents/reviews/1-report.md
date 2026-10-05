# Step 1 report, the rules in text

Everything in the brief is done. Nothing is NOT done. One place outside "Paths this step writes" is named under "Anything in the brief that was wrong or impossible" (the shared-rules text).

## Open items of the state file

```
none
```

(The "Open items" section of `.scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md` reads `none`.)

## The cases' first run (on the unchanged tree, before any change)

No case's rule was found wrong, so there was no hand-back.

- C1: `grep -n 'handles a case only when' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md` printed nothing, exit 1. Unmet, as expected on the unchanged tree.
- C2: read `docs/dev/change-standard.md` and the template copy, rule 15 in each. Both held `**Edges whose failure costs something are exercised, not assumed.**`, the list "each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code", "every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one, and every concurrent path in flight, after teardown and superseded by a later one", and the untrusted-value clause. Unmet.
- C3: read rule 6 and the runner sentence of both copies. Rule 6 opened `6. **Verification runs the verify list and every check, over the whole tree**`. The runner sentence read "A step's verification runs through the `land` skill's runner, `sh skills/land/templates/checks.sh <state file>`, and the report quotes the lines the runner printed, never a count." (template: "A step's verify list runs through the `land` skill's `templates/checks.sh` ... and the lines it prints are what a report or a booking quotes, never a count."). Neither said the builder and the reviewer run the checks of the changed files before landing. Unmet.
- C4: `grep -n 'small text step' docs/glossary.md skills/repo-setup/templates/plan-terms.md` printed nothing, exit 1. Unmet. Entries **brief check** ("made once per step"), **repair round** and **verify list** read as the brief describes.
- C5: read `skills/spec/templates/brief.md` and `brief-check.md`. No size line under the title; "Cases" held the placeholder "for a script, each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected"; "Verify before you report" item 1 was the plan's whole verify list through `checks.sh`; "6. Implied inputs" listed any implied input as missing. Unmet.
- C6: read each file under "Paths this step writes". Sentences that sent a small text step through a brief check, a repair round or the whole verify list: `skills/spec/SKILL.md` Steps 5 and "The brief check" 3 and 4 ("once per step"); `skills/refute/SKILL.md` Steps 3 (the step's verify list through `checks.sh` in the worktree); `skills/plan-orchestration/SKILL.md` "The prompt", Steps 7, Steps 8, "Brief-check agent" and Rules; `skills/land/SKILL.md` Steps 6 and 9; `skills/diagnose/SKILL.md` Steps 20; `skills/ordo-help/SKILL.md` and `README.md` ("once per step", "close them"); `skills/plan/templates/orchestrator-state.md` (`verify:` comment, `dispatch:` comment, "Verification, every step"). Unmet.
- C7: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- C8: `grep -m1 -n 'version' skills/{spec,refute,plan-orchestration,land,diagnose,repo-setup,ordo-help,plan}/SKILL.md` printed 3.0.0, 2.0.0, 3.1.0, 1.10.0, 1.2.0, 2.1.0, 2.1.0, 2.1.0 (the versions before item 15).

## DONE / NOT DONE

Run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2-1-1`.

| Item | Status | Command that proves it and its output |
|---|---|---|
| 1 case rule, both copies | DONE | C1 below |
| 2 rule 15, both copies | DONE | C2 below |
| 3 rule 6 and the runner sentence, both copies | DONE | C3 below |
| 4 small text step entry | DONE | C4 below |
| 5 brief template | DONE | C5 below |
| 6 brief-check template | DONE | C5 below |
| 7 spec skill | DONE | C6 below |
| 8 refute skill | DONE | C6 below |
| 9 plan-orchestration skill | DONE | C6 below |
| 10 land skill | DONE | C6 below |
| 11 diagnose skill | DONE | C6 below |
| 12 ordo-help and README | DONE | C6 below |
| 13 orchestrator-state template | DONE | C6 below |
| 14 glossary entries | DONE | C4 and C7 below |
| 15 versions | DONE | C8 below |
| 16 every other place | DONE | the greps under "Rule 14" below |
| Verify item 1, the runner | DONE | the lines below, exit 0 |

The runner, `sh skills/land/templates/checks.sh .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md`, run three times (the last run after this report existed on disk), printed identical lines each time and exited 0 each time:

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
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 12 commands passed
```

The character-set check's line is the last `$ git ls-files -coz ...` line above, with no offending line printed before `checks: 12 commands passed`; the runner's exit status was 0. The same command run on its own after this report was written printed nothing and exited 0.

The cases after the change, as printed:

- C1: `grep -n 'handles a case only when' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md`
  - `docs/dev/change-standard.md:21:- A script handles a case only when that case has happened or when a wrong answer on it costs something. No brief, case or review finding adds a case on other grounds.`
  - `skills/repo-setup/templates/docs/dev/change-standard.md:21:- Code handles a case only when that case has happened or when a wrong answer on it costs something. No brief, case or review finding adds a case on other grounds.`
- C2: read after the change. Rule 15 in both copies reads `15. **Each place where a supplied value reaches a command, a path or generated text is a case.** A value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text. Each such place is a case, since a wrong answer there runs a command, writes outside its folder or puts the supplied text where it was not meant to go.` No list of forms, no "empty, duplicated and colliding", no concurrent paths. The two copies' rule 15 lines are identical (`diff` of the two pages shows no difference on that line).
- C3: read after the change. Rule 6 of both copies opens `6. **Before landing, verification runs the checks of the files the step changes.** The builder and the reviewer run the checks the brief names for the files the step changes. They also run the repository's character-set check over those files where its verify list holds one. The plan's whole verify list runs once, at landing on main.` The runner sentence of Ordo's page reads "The plan's whole verify list runs once, at landing on main, through the `land` skill's runner, `sh skills/land/templates/checks.sh <state file>`. The booking quotes the lines the runner printed, never a count. Before landing, the builder and the reviewer run the checks the brief names for the files the step changes, and the report quotes their output." The template's counterpart says the same with its own path form.
- C4: `grep -n 'small text step' docs/glossary.md skills/repo-setup/templates/plan-terms.md` prints the new entry at `docs/glossary.md:119` and `skills/repo-setup/templates/plan-terms.md:114`, and also the lines of **brief check** (18, 13), **dispatch entry** (43, 38), **repair round** (99, 94) and **review cadence** (102, 97), which now name the term. **brief check** reads "made once per full step ... A small text step has none."; **repair round** reads "the round cap, and a small text step gets none."; **verify list** reads "runs once, at landing on main. Before landing, the builder and the reviewer run the checks the brief names for the files the step changes."
- C5: read after the change. `skills/spec/templates/brief.md` line 3 is `Size: <a small text step: no brief check, one review, no repair round | a full step>`; "Cases" has the first placeholder with a sub-bullet "each case checks what the step changes, and no case asks the builder to quote or explain a place the step does not change", the implied-input placeholder with a sub-bullet "only an input that has happened or whose wrong answer would cost something, as the rules file's case rule says", and no placeholder for a script's missing, unreadable or malformed input; "Verify before you report" item 1 names the checks of the verify list that cover the files the step changes, the character-set check over those files where the list holds one, and says the plan's whole verify list runs once, at landing on main; the Report part names the character-set check "over the files the step changes". `brief-check.md` "6. Implied inputs" lists an input as missing only when it "has happened or whose wrong answer would cost something".
- C6: read each path after the change. The sentences listed under C6's first run now say what their item gives them (the diff shows each). `grep -rn -E 'once per step|one brief check|brief check per step' skills utils docs README.md` prints only the `refute` lines about the reviewer ("once per step before its first repair round", true of every step) and the `plan-orchestration` Rules line that reads "a full step gets one brief check".
- C7: `ok: the plan-terms block equals the template`.
- C8: `skills/spec/SKILL.md:5:  version: "4.0.0"`, `skills/refute/SKILL.md:5:  version: "3.0.0"`, `skills/plan-orchestration/SKILL.md:5:  version: "4.0.0"`, `skills/land/SKILL.md:5:  version: "2.0.0"`, `skills/diagnose/SKILL.md:5:  version: "2.0.0"`, `skills/repo-setup/SKILL.md:5:  version: "3.0.0"`, `skills/ordo-help/SKILL.md:5:  version: "3.0.0"`, `skills/plan/SKILL.md:5:  version: "3.0.0"`. `git diff --numstat` shows `skills/plan/SKILL.md` and `skills/repo-setup/SKILL.md` with 1 line added and 1 removed each.

Description lengths, by the command in `docs/dev/skill-layout.md` "Frontmatter": `skills/spec/SKILL.md` 1003 and `skills/refute/SKILL.md` 989, the two descriptions that changed, each at most 1,024.

Rule 14, the greps run after the change over `skills utils docs README.md`:

- `grep -rn -E 'worktree and then main|again on main|run in the worktree' ...` printed nothing.
- `grep -rn -E 'rule on edges|Edges whose|colliding|concurrent path' ...` printed nothing.
- `grep -rn -E 'Verification runs the verify list|A step.s verification runs' ...` printed nothing.

Sentences about a changed file as a whole, reread against the file after the change:

- `docs/dev/change-standard.md` line 3 ("This page says how the work is done and how it is reported.") and line 13 ("Every rule on this page that names a script, a test or a check is read under this section.") still hold; the new bullet names a script.
- The template copy's line 13 ("names code, a script, a test or a check") still holds; its new bullet names code.
- `skills/spec/SKILL.md` intro (line 10) now reads "the brief and, for a full step, its brief check's report"; "Stops" intro ("The first seven rows are stops") is unchanged and still holds.
- `skills/refute/SKILL.md` intro (line 10) names the verdicts and findings, which hold; description (989 characters) now carries "and once alone for a small text step".
- `skills/plan-orchestration/SKILL.md` "Stops" intro ("seven kinds of stop ... and one refusal") unchanged and holds; "The two tiers" lists the brief-check agent "One per full step".
- `docs/glossary.md` introduction (line 3) says the block is `plan-terms.md` copied whole: C7 prints `ok`.

## The terms

Each entry, with its "Stated in" checked by `grep -n` of the term in the named section:

- **small text step** (new, `docs/glossary.md:119`, `skills/repo-setup/templates/plan-terms.md:114`, placed between **slug** and **standards**). Stated in `spec`, Steps 4 (line 128), 5 (line 182) and 9 (line 212); `refute`, Steps 1 (49), "Steps / Over a repair round" (104), "The four headings" (119) and "Finding dispositions" (167); `plan-orchestration`, Steps 7 (114) and 8 (121, 123), "The review, earned" (247) and Rules (419); `land`, Steps 6 (66, 69) and 9 (99); `diagnose`, Steps 20 (202); `ordo-help`, "The sequence, printed verbatim" (67, 76). Each use reads as the entry defines it: fewer than 20 lines counted as `git diff --numstat` gives, no script, test or configuration file, no brief check, one review, no repair round, a full step otherwise.
- **brief check** (changed): "once per full step", "A small text step has none." Stated in `spec`, Steps 5 and "Steps / The brief check": Steps 5 line 182 and "The brief check" items 3 and 4 say "full step".
- **repair round** (changed): "a small text step gets none". Stated in `plan-orchestration`, Steps 8 and Rules; `refute`, "Steps / Over a repair round" item 9.
- **verify list** (changed): "once, at landing on main" and the builder's and reviewer's checks. Stated in `land`, "The landing script"; `plan`, Steps 4; `spec`, Steps 4 (lines 137 to 140, which say "verify list"); `refute`, Steps 3 (line 64).
- **dispatch entry** (changed): `brief_check` reads `none, a small text step` for such a step. Stated in `spec`, Steps 9 (line 212).
- **review cadence** (changed): "A small text step is refuted once under either." Stated in `plan-orchestration`, Steps 7 (line 114) and "The review, earned" (line 247).

## The files with line counts

Lines added and removed from `git diff --numstat`, and the file's length now:

- `docs/dev/change-standard.md`: +4 -3, 91 lines
- `skills/repo-setup/templates/docs/dev/change-standard.md`: +4 -3, 72 lines
- `skills/repo-setup/templates/plan-terms.md`: +6 -5, 132 lines
- `docs/glossary.md`: +6 -5, 149 lines
- `skills/spec/templates/brief.md`: +10 -4, 107 lines
- `skills/spec/templates/brief-check.md`: +3 -3, 62 lines
- `skills/spec/SKILL.md`: +23 -11, 419 lines
- `skills/refute/SKILL.md`: +14 -7, 203 lines
- `skills/plan-orchestration/SKILL.md`: +16 -8, 427 lines
- `skills/land/SKILL.md`: +4 -1, 234 lines
- `skills/diagnose/SKILL.md`: +4 -2, 312 lines
- `skills/ordo-help/SKILL.md`: +3 -3, 119 lines
- `skills/plan/templates/orchestrator-state.md`: +4 -4, 70 lines
- `skills/plan/SKILL.md`: +1 -1, 208 lines (line 5 only)
- `skills/repo-setup/SKILL.md`: +1 -1, 253 lines (line 5 only)
- `README.md`: +3 -3, 192 lines
- `.scratch/2-1-scripts-cut-to-their-jobs/agents/reviews/1-report.md`: this report

`git status --short` in the worktree lists the sixteen files above and the report, nothing else.

## Judgment calls the brief left open

- Rule 15's title, which the builder words: "Each place where a supplied value reaches a command, a path or generated text is a case." Its body keeps the untrusted-value clause, split into two sentences.
- Rule 6's wording (item 3): the title says "Before landing, verification runs the checks of the files the step changes." and three sentences state who runs what and that the whole list runs once at landing. In the runner sentence the booking, not the report, quotes the runner's lines; the report quotes the output of the checks the brief names.
- The step's size line in `spec` Steps 4 is the text `Size: a small text step: no brief check, one review, no repair round` or `Size: a full step`; the first is the template placeholder's first alternative with the angle brackets removed.
- Beyond the three entries item 14 names, **dispatch entry** and **review cadence** carry a clause each, and the new entry's "Stated in" lists seven skills, because their text was made false or states the term (item 16).
- `skills/spec/templates/brief-check.md` section 4's "Findings:" line also names a case that asks the builder to check, quote or explain a place the step does not change, so the report's shape matches item 7's **Cases and checks** (serves item 7).
- `skills/plan/templates/orchestrator-state.md`'s `review:` comment gains "a small text step is always reviewed once", since the comment said the reviewer runs unless the record earns the skip (serves item 9).
- `README.md`'s `spec` row in the skills table says "For a full step, a fresh read-only agent checks the brief against the tree" (serves item 12).
- `skills/spec/SKILL.md` carries "for a full step" into the description, the Quick start line, the introduction, "What it reads" 6, Steps 6, "The brief check" item 5; `skills/plan-orchestration/SKILL.md` into Steps 3 and the "Brief-check agent" bullet (serves item 7 and 9).
- `skills/plan-orchestration/SKILL.md` Rules: the bullet "Nothing in the loop repeats without a count" now has three sub-bullets (full step, small text step, every step), and "A step that cannot go on within those counts stops..." is a bullet of its own.
- `skills/diagnose/SKILL.md` Steps 20: the first-run bullet reads "of a full step", since a small text step's finding has no repair round.
- The implied-input placeholder in `brief.md` keeps its parenthetical examples of implied inputs, and the cost test moved to a sub-bullet; "6. Implied inputs" in `brief-check.md` keeps "in the forms `templates/brief.md`'s "Cases" names".
- The glossary entry **verification page** ("the commands every step runs") is unchanged: each step still ends in the landing that runs them.

## Host- or user-visible changes, before and after

- Change standard, both copies, "Scripts compute facts; judgment is read": before, no rule on cases; after, `- A script handles a case only when that case has happened or when a wrong answer on it costs something. No brief, case or review finding adds a case on other grounds.` (template: `Code handles ...`).
- Rule 15, both copies. Before: `15. **Edges whose failure costs something are exercised, not assumed.** For a script, a form of input its own rules name is a case only when a wrong answer on it costs something ...; the forms weighed are each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code. Under the same condition, every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one, and every concurrent path in flight, after teardown and superseded by a later one. A value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text, and each such place is a case, ...` After: the line quoted under C2.
- Rule 6, both copies. Before: `6. **Verification runs the verify list and every check, over the whole tree**, and the report gives the numbers seen, never the numbers expected.` After: `6. **Before landing, verification runs the checks of the files the step changes.** The builder and the reviewer run the checks the brief names for the files the step changes. They also run the repository's character-set check over those files where its verify list holds one. The plan's whole verify list runs once, at landing on main. The report gives the numbers seen, never the numbers expected.`
- Runner sentence, Ordo's page. Before: "A step's verification runs through the `land` skill's runner, `sh skills/land/templates/checks.sh <state file>`, and the report quotes the lines the runner printed, never a count." After: the sentence quoted under C3 (template copy likewise).
- Brief template: new `Size:` line; "Cases" and "Verify before you report" item 1 as quoted under C5. A builder briefed from it runs the checks of the changed files, not the whole list.
- `/spec`: a small text step gets no brief check and its dispatch entry reads `brief_check: none, a small text step` (before: every step got a brief check and the entry held the report's path).
- `/refute`: runs the checks the brief names, not the plan's whole verify list (before: the whole list through `checks.sh` in the worktree); a small text step gets one review and no run over a repair round; new Spec finding for a step whose size line does not match its diff; new Standards finding for code larger than its job.
- `/land` and `diagnose`: a finding of a small text step's review is fixed at landing when small and inside the brief, or raised as an open item; the booking adds no brief-check agent for `none, a small text step`.
- `plan-orchestration`: the builder's prompt tells it to run the checks the brief names; a small text step is reviewed once under `every` and `earned` and has no repair round.
- `/ordo-help` and `README.md`: before, "once per step (the brief check)" and "close them: a repair round"; after, "once per full step (the brief check; a small text step has none)" and "a repair round (a small text step has none)".
- `skills/plan/templates/orchestrator-state.md`: `verify:` comment, before "commands run in the worktree and again on main", after "commands run once, at landing on main ... The builder and the reviewer run the checks the brief names for the files the step changes before landing"; "Verification, every step", before "from the root of the checkout it checks, the worktree and then main", after "from the root of main's checkout, once, at landing".
- Versions: spec 3.0.0 to 4.0.0, refute 2.0.0 to 3.0.0, plan-orchestration 3.1.0 to 4.0.0, land 1.10.0 to 2.0.0, diagnose 1.2.0 to 2.0.0, repo-setup 2.1.0 to 3.0.0, ordo-help 2.1.0 to 3.0.0, plan 2.1.0 to 3.0.0.

## Verify item 3: new and changed items and sentences read against the standards' rules on list items and sentence length

Departures, each with why it needs its form:

- `README.md` line 38 and `skills/ordo-help/SKILL.md` line 67 (42 words) and line 76 (38 words): each is one line of the printed command sequence, which is one line per command and is printed verbatim.
- Glossary entries **brief check** (38 words in its first sentence), **dispatch entry** (35) and **small text step** (the sentence from "It gets no brief check" is 29): the definition form of the existing entries, where a definition states the term and its conditions in one sentence.
- Rule 6 and rule 15: the 31- and 34-word sentences and the 30-word last sentence of rule 15 are the old rules' own sentences kept whole (rule 17 of the rules file); the new sentences are 20 words or fewer.
- `skills/refute/SKILL.md` Spec bullet on the size line (40 words): one finding that holds two conditions of the step's diff, which a split would turn into two findings.
- `skills/spec/templates/brief.md` implied-input placeholder (49 words, 61 before) and `brief-check.md` section 6 (47 words, 35 before): template placeholder lines that carry their examples and their forms.
- `skills/spec/SKILL.md` "The brief check" item 5 (58 words, 50 before) and `skills/plan-orchestration/SKILL.md` Steps 3 (39 words, 32 before) and the "Brief-check agent" bullet (44, 42 before): existing sentences, lengthened by "of a full step" or "for a full step".
- `skills/plan/templates/orchestrator-state.md` comments: one-line YAML comments, which the file's form keeps on one line.
- Every other new bullet is one rule per bullet; where two requirements could each be broken alone they are two bullets.

## Anything in the brief that was wrong or impossible

- Nothing in the brief was impossible and every case's rule held on the first run.
- Outside "Paths this step writes": `skills/repo-setup/templates/shared-rules.md` line 15, the "Scripts compute facts; judgment is read" rule, states "A test exists only for code, and only for behaviour whose failure costs something" and carry no rule on which cases a script handles. Item 1 puts the new case rule into the two change-standard pages only. Whether the shared rules carry it is the orchestrator's or the user's to rule; this step did not touch that file.
- Outside the paths, `skills/plan/SKILL.md` line 41, `skills/ordo-init/SKILL.md` line 73 and `skills/plan-retro/SKILL.md` line 85 say "the commands every step runs" of the verification page. Each step still ends in the landing that runs them, so the sentences hold and are left as they are.
