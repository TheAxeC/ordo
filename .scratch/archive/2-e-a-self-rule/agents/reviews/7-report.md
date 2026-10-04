# Step 7 report: next-entry mode (builder, worktree `.agents/worktrees/2ea-7`, base 3c4b9c1)

Everything in the brief is done, under the orchestrator's ruling in `agents/briefs/7-cases.md`. Nothing is NOT DONE. Open item H, the shared-rule sentence, is the user's and blocks step 9 only; this step does not change `shared-rules.md`.

## Open items of the state file (main checkout, verbatim)

- Open item H (2026-10-01): whether the shared rule on self-rule covers `/grill` and `/plan` run with `--self-rule`. Raised by the brief check of step 7 (`agents/reviews/7-brief-check.md`, "Declined to judge"). Kind 3: a change to the shared rules and to `~/.claude/CLAUDE.md`.
  - What the tree shows: `skills/repo-setup/templates/shared-rules.md:20` reads "Under a plan's `self_rule: on`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review.", and `~/.claude/CLAUDE.md` holds the same sentence (ruling B). In next-entry mode `/grill <entry> --self-rule` and `/plan <entry> --self-rule` run before the next entry's plan exists, under the keys of `.agents/plan.yaml` (ruling F), so no plan's `self_rule: on` is in force while they take decisions.
  - Options:
    - (a) The sentence reads "Under `self_rule: on`, in a plan's configuration block or, for `/grill` and `/plan` run with `--self-rule`, in `.agents/plan.yaml`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review."; the template change joins step 8, which changes the `repo-setup` templates, and you put the same words in `~/.claude/CLAUDE.md`. Pros: a reader of the rule finds next-entry mode covered, and the rule and the skill text say the same. Cons: a change to written rules, one of them your own file.
    - (b) Both sentences stay; a next-entry run is read as the closing plan's run going on under its `self_rule: on`. Pros: no rule changes. Cons: the words "a plan's" do not name `/grill` and `/plan` run before the plan exists, so a session that reads the rule as written stops at each decision `/grill --self-rule` would close, and the shared rule and the skill text disagree.
  - Recommendation: (a), since a written rule that a literal reader reads against the skill text is a clash, and the change is one sentence. Lazy option: (b), which changes nothing and leaves the clash to each reader.
  - Kind 3; it waits for you. It blocks step 9, whose run is the first next-entry run, and no other step.

## The cases, first run on the unchanged tree

Read in place at the base. Evidence: `grep -n 'self_rule\|next_entry\|self-rule' skills/{grill,plan,roadmap,plan-orchestration}/SKILL.md` showed no `--self-rule` argument and no key `self_rule` or `next_entry` in `grill`, `plan` or `roadmap`; the Verify 2 command printed 808, 477, 997, 865; `grep -rn 'replacing Open item <L\|` (Open item <L>)' skills` printed `templates/choices.md:14` and `references/self-rule.md:50,56,75`.

| Case | Result on the unchanged tree |
|---|---|
| 1 | Differs. `/grill` knows no `--self-rule`; `9 --self-rule` is read as an entry. No refusal naming both keys. |
| 2 | Differs. Steps 6 sends a round and ends the turn; bullets end "(the user)" (`:238`); no choice is written; Steps 10 asks the confirmation and the commit. |
| 3 | Differs. Every decision goes out in the round; bullets end "(the user)". |
| 4 | Differs, same cause as case 2. |
| 5 | Differs, same cause as case 2. |
| 6 | Differs. An entry under "Not yet specified" is an entry ("What it reads" 2), so the interview runs. |
| 7 | Holds. |
| 8 | Differs. `/plan` has no `--self-rule`; Steps 3 and the Stops row stop at the drafted list. |
| 9 | Holds (every plan stops and writes nothing). The hand-back found that the brief's item 4.4 placed the `Booked:` rewrite at Steps 2, before the stop, which breaks "nothing written"; ruled below. |
| 10 | Differs. No `--self-rule`, no refusal. |
| 11 | Holds. `spec` "What it reads" 4 accepts `(ruling A)` with A ending "(self-rule)." |
| 12 | Differs. Steps 10 ends the loop at a pause or when nothing unblocked is left; nothing follows the closing. |
| 13 | Differs. The run ends after the closing and names no `/roadmap add 12`. |
| 14 | Differs. The run ends after the closing and does not say no open entry is left. |
| 15 | Holds in part. Steps 2 takes several open plans in the roadmap's order and Steps 10 goes back to step 2, so an open plan is run with no `/grill` and no `/plan`; the two keys are not read. |
| 16 | Differs. No stop names the entry the next entry waits on. |
| 17 | Holds. The loop ends after the closing because nothing follows it. |
| 18 | Holds. The Stops row "The roadmap diff" keeps the diff with the user. |
| 19 | Differs. `roadmap` "What it reads" 6 accepts only "(the user)". |
| 20 | Holds in outcome (no ruling, the stop stands), for the ending and not for the report, the plan or the finding. |
| 21 | Holds. No ruling because of the ending; the stop stands. |
| 22 | Differs. "A skill with its own approval stop" keeps every `/roadmap` option open. |
| 23 | Differs. `Booked:` is `(Open item <L>)`; the review looks only in a plan's Rulings; `/grill` writes no "(self-rule)" bullet. |
| 24 | Differs. The new bullet reads `replacing Open item <L> (the user)`. |
| 25 | Differs. No rule for a review with no plan open. |
| 26 | Differs. `Builds on it:` has no roadmap entry. |
| 27 | Differs. `Builds on it:` has no record. |
| 28 | Differs. `continue the plan` with no plan open resumes nothing between plans. |

The cases the brief's rules got wrong, and the orchestrator's ruling (`agents/briefs/7-cases.md`), carried here:

1. Case 9, items 4.4 and 4.6: the rule wrote the choices file at Steps 2, before the stop of Steps 3. Ruled (a): the `Booked:` rewrite is made when `plan.md` is written, at the end of Steps 3, with or without `--self-rule`, never at Steps 2; the opening commit of Steps 6 carries the choices file; a stop that stands writes nothing. Built as `skills/plan/SKILL.md` Steps 3 (the bullets "When `plan.md` is written, each bullet line Steps 2 copied ..." and "A stop that stands writes nothing, the choices file and the rulings file included.") and Steps 6.
2. Case 28, item 5.7: Steps 10 under `--self-rule` commits "the files it wrote, the choices file among them when it wrote it"; a run that wrote none makes no commit and says so. Built as `skills/grill/SKILL.md` Steps 10, the bullets "On a yes to both, or under `--self-rule`, commit ..." and "A run under `--self-rule` that wrote no file makes no commit and says so in its report."
3. Item 5.4, Decision 2: option (a). `grill` names the six kinds by `references/self-rule.md`, "The six kinds left open", and lists no example (`skills/grill/SKILL.md` Steps 6, the first two `--self-rule` bullets).
4. Item 6.2: written as "Nothing is added except what the user asked for, or what a quoted ruling ending "(self-rule)" names as a finding of a running plan." (`skills/roadmap/SKILL.md` Rules, first bullet); the anti-pattern row of item 6.4 agrees.

## DONE / NOT DONE

All commands run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-7`. Every row is DONE.

| # | Item | Command | Output | |
|---|---|---|---|---|
| V1 | The plan's verify list | `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` | the lines below; exit 0 | DONE |
| V2 | Descriptions at most 1,024 | the `python3 -c` of Verify 2 | `808 skills/grill/SKILL.md`, `477 skills/plan/SKILL.md`, `1022 skills/roadmap/SKILL.md`, `959 skills/plan-orchestration/SKILL.md` | DONE |
| V3a | Old `Booked:` and `replacing` forms gone | `grep -rn 'replacing Open item <L\|` (Open item <L>)' skills` | no output, grep exit 1 | DONE |
| V3b | `--self-rule` lines | `grep -n -- '--self-rule' skills/grill/SKILL.md skills/plan/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md` | 39 lines: `self-rule.md:62,63,68,77,79,90,95`; `plan/SKILL.md:18,42,59,104,105,142,147,154,160`; `plan-orchestration/SKILL.md:364`; `grill/SKILL.md:10,19,35,86,156-158,160,183-186,190,248,249,275,287,328,329,334,335,351` (items 1.1, 3, 4, 5) | DONE |
| V4a | No non-ASCII added | `git diff -U0 \| grep '^+' \| LC_ALL=C grep -n '[^ -~]'` | no output, exit 1 | DONE |
| V4b | No tab | `grep -c "$(printf '\t')"` on each changed file | 0 for `README.md`, the ADR, `docs/glossary.md`, `skills/grill/SKILL.md`, `skills/plan-orchestration/SKILL.md`, `references/self-rule.md`, `templates/choices.md`, `skills/plan/SKILL.md`, `plan-terms.md`, `skills/roadmap/SKILL.md` | DONE |
| V5 | Terms block equal | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` | DONE |

The lines `checks.sh` printed, verbatim:

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
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

What these do not cover: they check facts (tests of the scripts, ASCII, the glossary copy, a description length). Whether each changed text is right is the reviewer's reading; the brief's check for this step is "each changed text read in place", and step 9's run proves the behaviour.

## Files changed (lines after the change, and diff lines)

`git diff --stat 3c4b9c1` after repair round 1: 11 files, 146 insertions, 47 deletions.

| File | Lines | Diff |
|---|---|---|
| `skills/plan-orchestration/references/self-rule.md` | 137 | +59 -9 (new section "Next-entry mode", "A skill with its own approval stop", "The choices file", "The review of a choice") |
| `skills/plan-orchestration/templates/choices.md` | 15 | +1 -1 |
| `skills/plan-orchestration/SKILL.md` | 364 | +10 -8 |
| `skills/plan/SKILL.md` | 165 | +25 -6 |
| `skills/plan/templates/orchestrator-state.md` | 70 | +1 -1 (line 29, the `next_entry` comment) |
| `skills/grill/SKILL.md` | 359 | +32 -11 |
| `skills/roadmap/SKILL.md` | 200 | +10 -5 |
| `README.md` | 190 | lines 22, 48, 56 |
| `skills/repo-setup/templates/plan-terms.md` | 124 | lines 57-58 (new term), 79 (quoted ruling) |
| `docs/glossary.md` | 141 | the same two places |
| `docs/adr/0005-the-choices-of-every-plan-go-to-one-file-at-the-ledger-root.md` | 20 | line 20 |
| `.scratch/2-e-a-self-rule/agents/reviews/7-report.md` | this file | |

No other file is changed (`git status --short` lists the eleven files above).

## Judgment calls the brief left open

- One rule per bullet: the brief's compound bullets of item 1.1 (the closing, the stops, the takeover) and of items 4.5 and 5.5 are split into a bullet with sub-bullets, each stating one rule, with the same content. The invocation order of item 1.1 is a numbered list, since order matters.
- `references/self-rule.md`, "The review of a choice": the condition for a choice booked in a rulings file is stated once, in the bullet "A choice booked in a rulings file" (`:132-135`), which the `Agree` and `C<n> =>` lines name (round ruling 1); it serves cases 23 and 25. The reason clause for no Closed-items line is Decision 7's.
- `references/self-rule.md` "The choices file": `Booked:` before a plan is open names the rulings file, and the rewrite on copying cites the `plan` skill's Steps 3, since the ruling moved it there.
- `skills/plan/SKILL.md` Steps 3 and 6: the `Booked:` rewrite and the choices file in the opening commit are worded "when Steps 3 changed it" (ruling 1).
- `skills/grill/SKILL.md` Steps 10: the bullets that depend on the question ("Without a yes to committing", "Without a confirmation") are left as they were, and the new bullet "Under `--self-rule`, ask nothing" keeps them from applying (ruling 2).
- `skills/grill/SKILL.md` Stops row "A round": the "When" cell separates the `--self-rule` case from the riding decisions with a semicolon, so "ride in it" reads for the "record as ADR?" and roadmap diff decisions in both modes.
- Brief item 7: README lines 22 and 48 say "under `self_rule: on` and `next_entry: on`" (round ruling 10), as the skills name the two keys together.
- The glossary's term was added in both copies with the brief's D24 words; the ordering between **loop** and **night rule** is as the brief says.
- Versions in `metadata.version` are not changed: no brief item asks for it.

Sentences about a changed file as a whole, reread against it after the change (change standard, rule 14):
- `skills/plan-orchestration/SKILL.md:10` (introduction) holds; it gained the sentence on next-entry mode, and `:15` and `:17` (Quick start) and the description say the same. The description is 961 characters.
- `skills/grill/SKILL.md:10` (introduction) holds with "or at once under `--self-rule`"; `:324` ("The first three rows are stops") holds, since "The end" is still a stop outside `--self-rule`; `:272` ("nothing the user did not ask for") holds, since the diff holds only what the answers change.
- `skills/roadmap/SKILL.md:10` (introduction) and the description's last sentence say the user's approval or a quoted ruling; `:180` ("The first five rows are stops") holds, no row changed.
- `skills/plan-orchestration/references/self-rule.md:29` ("An open item that ... do not hold") holds, since "A skill with its own approval stop" now holds only the options of its first bullet.
- `README.md:56` and the glossary term **quoted ruling** carry the `roadmap` exception.

## Host- or user-visible changes, before and after

- `/grill <entry> --self-rule`, new. Before: no such argument. After: refused unless `self_rule: on` and `next_entry: on` in `.agents/plan.yaml`, and refused for an entry under "Not yet specified"; otherwise each decision outside the six kinds is answered with its recommendation, written as `- D<n> ... (self-rule).` with a choice in `<ledger_root>/choices.md`, and one commit at the end.
- `/plan <entry> --self-rule`, new. Before: no such argument; every plan stops at "The drafted step list". After: the stop is raised as `Open item A`, with the options "open the plan with the list as drafted" (recommended) and "keep the draft for the user", and closed under self-rule unless a "## Gate" answer is yes, a design decision is named unsettled, or it is of the six kinds; each step line ends `(ruling A)`.
- `/plan`, all runs: the `Booked:` line of each choice whose bullet is copied from the rulings file is rewritten to the new `plan.md` and the bullet's line when `plan.md` is written. Before: no rewrite.
- `/roadmap add`: before, a quoted ruling counted only with "(the user)". After: it also counts with "(self-rule)" when the bullet names a finding of a running plan, with the checks of "What it reads" 6; `move`, `drop` and `done` keep "(the user)".
- `skills/plan/templates/orchestrator-state.md:29`, the comment on `next_entry` in the state file of every plan opened later. Before: "on, with self_rule on: after the closing, the orchestrator takes the next open roadmap entry; off: it stops at the closing." After: "copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself, as plan-orchestration's references/self-rule.md, "Next-entry mode", says."
- `plan-orchestration`: before, nothing followed the closing. After, under both keys the orchestrator goes on to the next entry as `references/self-rule.md`, "Next-entry mode", says.
- The choices file's `Booked:` line: before ``Booked: `<path>:<line>` (Open item <L>)``; after ``Booked: `<path>:<line>` (<the bullet's name>)`` (`templates/choices.md:14`).
- The `Ruled:` reply's bullet and the `C<n> =>` bullet: before `replacing Open item <L'>` and `replacing Open item <L>`; after `replacing <the replaced bullet's name>` and `replacing <the old bullet's name>`.
- The review of a choice: when `Booked:` names the entry's rulings file, it reads that file, writes no Closed-items line, names the choice and the decision in its commit message, and writes the `C<n> =>` bullet to that file. A choice booked in an open or an archived `plan.md` is reviewed as before the change.
- `continue the plan` with no plan open: before, it resumed nothing; after, under both keys in `.agents/plan.yaml`, it takes the next roadmap entry.
- `README.md` lines 22, 48 and 56 and the glossary terms **next-entry mode** (new) and **quoted ruling** (amended) say the same.
- ADR 0005, Consequences: before "the path is written as it stands when the choice is booked and the plan's slug finds it in the archive"; after "the path is written as it stands when the choice is booked, rewritten by `/plan` to the new `plan.md` when it copies a bullet out of the rulings file, and the plan's slug finds it in the archive".

## Anything in the brief wrong or impossible

- Item 4.5, the options of Open item A: the second option, "the list with each unsettled design decision settled and each line left to place placed", has no way to be carried out inside `/plan` (settling a design decision is `/grill`'s), and the Rulings bullet the brief fixes reads "the step list as drafted". A recommendation of the second option would be booked with text that does not describe it. Ruled by round ruling 2: the second option is replaced by "keep the draft for the user", and the stop is kept with the user whenever a design decision is named unsettled. Evidence: `skills/plan/SKILL.md` Steps 3, bullet "Under `--self-rule`, the stop ... is raised as `Open item A`", and the bullet "The Rulings bullet is `- Open item A (<date>): the step list as drafted ...`".
- The premises, line numbers and counts of "What is on the tree" matched the tree at the base, as read with `grep -n` before the build.

## Repair round 1

Each ruling of `agents/briefs/7-round-1.md` with what changed, the file and the line after the change. Verify lines follow the list. The glossary and the other files not named below are unchanged by this round.

1. Spec 1 and Standards 5, the condition written three times. `skills/plan-orchestration/references/self-rule.md:132-135`: one bullet, "**A choice booked in a rulings file.** When `Booked:` names the entry's rulings file, the review differs in three ways", with three sub-bullets (no Closed-items line and why, the commit message names the choice and the decision, the `C<n> =>` bullet written to that rulings file). `:118` and `:131` end "except as the bullet "A choice booked in a rulings file" says" in place of "unless no plan is open for the entry"; the separate "With no plan open" bullets are gone. `:113` names the file `Booked:` gives: the Rulings section of a plan's `plan.md` (the archived `plan.md` of a closed plan) or the entry's rulings file. A choice booked in an open or archived `plan.md` is reviewed as before.
2. Spec 2, the second option of Open item A. `skills/plan/SKILL.md:104-113`: the options are "open the plan with the list as drafted" and "keep the draft for the user"; `:105` makes the first the recommendation and the second the lazy option; `:106` copies a line left to place as Steps 2 says and has Open item A name it, without keeping the stop; `:108` keeps the stop with the user when any design decision is named unsettled, since settling it is `/grill`'s; the option "the list with each unsettled design decision settled and each line left to place placed" is removed, and so is the bullet that copied lines left to place inside "Otherwise it is closed" (it is now `:106`).
3. Spec 3, the checks of Steps 7. `skills/grill/SKILL.md:159-161`: one bullet, "each such answer goes through the checks of Steps 7 that read an answer ("Steps / Terms and claims" and "Steps / An answer that contradicts") before Steps 8", with a sub-bullet for a contradiction (a rule-clash decision, kind 3, sent as the bullets above say) and one for a missing glossary term (a decision of its own, kind 3 where the glossary is a standards page). The first `--self-rule` bullet of Steps 6 (`:156`) no longer says "goes on to Steps 8 with that answer".
4. Spec 4, the `/plan` stops. `references/self-rule.md:66` and `:70` name "a stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule`" in place of "a `/plan` stop of the six kinds".
5. Spec 5, the completion criterion. `skills/grill/SKILL.md:163`: under `--self-rule` the step is done when each decision outside the six kinds is answered and, when any decision of the six kinds was sent, the turn has ended, and with none sent the skill goes on to Steps 8 in the same turn.
6. Standards 1, the name. `references/self-rule.md:88` (the `Booked:` form) and `templates/choices.md:14` read `(<the bullet's opening words>)`; `:89` says `Booked:` gives the bullet's opening words, which the review searches by and a `replacing` clause quotes; `:90` gives them as `Open item <L>` or `D<n> <the decision, as a phrase>`; `:91` says a step's tag names the bullet as the `spec` skill's "What it reads" 4 reads it, `<L>` or `D<n> <the decision, as a phrase>`; the claim that `spec` reads `Open item <L>` is gone. The `replacing` clauses (`:100`, `:119`), the review's search (`:113-114`) and `skills/plan/SKILL.md:119` say "opening words"; the `Ruled:` bullet's sentence at `:102` already reads the tag name as `<L>` and agrees.
7. Standards 2, the Scope bullet. `skills/plan-orchestration/SKILL.md:228` also applies the section to next-entry mode and to `/grill` and `/plan` run with `--self-rule`, where `.agents/plan.yaml` holds the keys, as `references/self-rule.md`, "Next-entry mode", says.
8. Standards 3, the state template. `skills/plan/templates/orchestrator-state.md:29` now reads `next_entry: off              # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself, as plan-orchestration's references/self-rule.md, "Next-entry mode", says.` Only that line.
9. Standards 4, the ADR sentence. `skills/grill/SKILL.md:3` (description) reads "and a proposed ADR, written on the user's yes or, under `--self-rule`, on the orchestrator's recommendation"; `:10` (intro) reads "a proposed ADR for each decision the user chose to record, or that the orchestrator recommends recording under `--self-rule`". The description is 877 characters.
10. Standards 6, README. `README.md:22` and `:48` read "under `self_rule: on` and `next_entry: on`" (without backticks in the code block at `:48`).
11. Standards 7, the verb. `references/self-rule.md:71` reads "which writes the plan with the step list as the user approved or corrected it, each step line ending `(approved)`".
12. Standards 8, "the loop". In "Next-entry mode" (`references/self-rule.md:50`, `:52`, `:55`, `:59`, `:61`) the actor between plans is "the orchestrator", and "the loop" names only the run over a plan's steps (`:59`, `:64`, `:72`, `:78`). `skills/plan-orchestration/SKILL.md:10` (intro) and `:131` (Steps 10) say "the orchestrator goes on after the closing" so the file agrees with the glossary's **loop**.
13. Behaviour 1 and 2, the report. The list "Host- or user-visible changes" above gains `continue the plan` with no plan open (before it resumed nothing; after, under both keys in `.agents/plan.yaml`, it takes the next roadmap entry), and its line on the review of a choice states that a choice booked in an open or archived `plan.md` is reviewed as before.
14. Proof 1 of the step 8 refuter report. `skills/plan-orchestration/SKILL.md:3` (description) reads "stop only where a decision is for the user". The description is 961 characters.

Sentences reread against the rest of their file after the fixes:
- `references/self-rule.md:5` ("The scope is the first bullet of `SKILL.md`'s section "Self-rule"") holds with the new Scope bullet at `plan-orchestration/SKILL.md:228`.
- `references/self-rule.md:29` ("An open item that ... do not hold") holds; the "Next-entry mode" bullets that say "the run" and "the orchestrator" no longer use "the loop" for the actor between plans.
- `references/self-rule.md:97-98` ("A later `/spec` whose brief rests on the choice ...") and `:102` (the tag name) hold with the opening words.
- `skills/plan/SKILL.md` Stops row "The drafted step list" (`:144`) and Rules bullet 2 (`:162`) hold: the stops it keeps with the user are the ones `:107-109` list.
- `skills/grill/SKILL.md:163` is the only completion criterion that names `--self-rule` in Steps 6; Steps 10 (`:186-193`) is unchanged by this round.

Verify, run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-7` after the fixes:

```
$ sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md
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
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

(exit 0)

```
Verify 2: python3 -c 'import yaml; ...' over grill, plan, roadmap, plan-orchestration
877 skills/grill/SKILL.md
477 skills/plan/SKILL.md
1022 skills/roadmap/SKILL.md
961 skills/plan-orchestration/SKILL.md

Verify 3a: grep -rn 'replacing Open item <L\|` (Open item <L>)' skills
(no output, exit 1)

Verify 3b: grep -n -- '--self-rule' on the four files
45 lines: grill 24, plan-orchestration/SKILL.md 2, references/self-rule.md 10, plan 9
(the lines of items 1.1, 3, 4 and 5, and now the grill description at :3)

Verify 4a: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'
(no output, exit 1)

Verify 4b: grep -c "$(printf '\t')" on each changed file
0 for README.md, the ADR 0005, docs/glossary.md, skills/grill/SKILL.md, skills/plan-orchestration/SKILL.md, references/self-rule.md, templates/choices.md, skills/plan/SKILL.md, skills/plan/templates/orchestrator-state.md, plan-terms.md, skills/roadmap/SKILL.md

Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

`git status --short` lists eleven modified files (the ten of the first build and `skills/plan/templates/orchestrator-state.md`) and the report.
