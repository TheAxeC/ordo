# Report of step 8: the terms of D24

Everything in the brief is done. Items 1 to 7 of "What to build" are written on the lines "Paths this step writes" names, `docs/glossary.md` is synced from the template, and the five Verify commands hold.

## Open items of the state file (read in the main checkout, `.scratch/2-e-a-self-rule/orchestrator-state.md`, verbatim, at the build; Open item H has since been ruled (a) by the user, and the state file's open items read "None.")

- Open item H (2026-10-01): whether the shared rule on self-rule covers `/grill` and `/plan` run with `--self-rule`. Raised by the brief check of step 7 (`agents/reviews/7-brief-check.md`, "Declined to judge"). Kind 3: a change to the shared rules and to `~/.claude/CLAUDE.md`.
  - What the tree shows: `skills/repo-setup/templates/shared-rules.md:20` reads "Under a plan's `self_rule: on`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review.", and `~/.claude/CLAUDE.md` holds the same sentence (ruling B). In next-entry mode `/grill <entry> --self-rule` and `/plan <entry> --self-rule` run before the next entry's plan exists, under the keys of `.agents/plan.yaml` (ruling F), so no plan's `self_rule: on` is in force while they take decisions.
  - Options:
    - (a) The sentence reads "Under `self_rule: on`, in a plan's configuration block or, for `/grill` and `/plan` run with `--self-rule`, in `.agents/plan.yaml`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review."; the template change joins step 8, which changes the `repo-setup` templates, and you put the same words in `~/.claude/CLAUDE.md`. Pros: a reader of the rule finds next-entry mode covered, and the rule and the skill text say the same. Cons: a change to written rules, one of them your own file.
    - (b) Both sentences stay; a next-entry run is read as the closing plan's run going on under its `self_rule: on`. Pros: no rule changes. Cons: the words "a plan's" do not name `/grill` and `/plan` run before the plan exists, so a session that reads the rule as written stops at each decision `/grill --self-rule` would close, and the shared rule and the skill text disagree.
  - Recommendation: (a), since a written rule that a literal reader reads against the skill text is a clash, and the change is one sentence. Lazy option: (b), which changes nothing and leaves the clash to each reader.
  - Kind 3; it waits for you. It blocks step 9, whose run is the first next-entry run, and no other step.

Item H was ruled (a) by the user after the build; its sentence is at `skills/repo-setup/templates/shared-rules.md:20`, written in repair round 1 (ruling 1).

## The cases, first run on the unchanged tree (base d3c0f00)

Each was read as it would be followed. No case showed the brief's own rules giving a wrong result, so the build went ahead.

1. **self-rule**: `grep -n 'self-rule' skills/repo-setup/templates/plan-terms.md` finds no entry, and `docs/glossary.md` has none. A reader finds no definition. Result: fails on the unchanged tree, as the step expects. The brief's item 2 text was read against `references/self-rule.md`: "does not leave open" covers "The six kinds left open", "A skill with its own approval stop" (its item "stays open for the user") and the stops "The counts" names ("are never closed under self-rule"), which is the set "Closing an open item" excludes. The sections named exist (`grep -n '^## ' skills/plan-orchestration/references/self-rule.md`: Scope, The six kinds left open, A skill with its own approval stop, Closing an open item, The counts, The choices file, The review of a choice) and so do `plan-orchestration` "Self-rule" (`SKILL.md:224`) and `## What it reads` in `grill` (`:30`) and `plan` (`:30`). `--self-rule` is stated in those two sections by step 7, which lands first.
2. **choices file**: no entry on the unchanged tree. Result: fails, as expected. The item 1 text names the path, the grouping and both ways a choice leaves; "The choices file" (last bullet: a ruling of the user replaces a bullet ending "(self-rule)" and the choice is removed) and "The review of a choice" (`Agree` and `=>`) say each of them.
3. **open item**: on the unchanged tree it reads "a decision only the user can make ... closed by the user's ruling", so an item the orchestrator closes under self-rule contradicts its own definition. Result: fails. The item 3 text, read under self-rule, gives the user's ruling for an item the file leaves open, the recommended option for any other, and the removal for a worktree item.
4. **ruling**: on the unchanged tree it has three senses, each followed by its own "Stated in:", and no self-rule sense. Result: fails. The item 4 text adds the fourth sense with its own "Stated in:" naming "Closing an open item" (books the line "(self-rule)") and "The review of a choice" (rewrites the ending to "(the user)" on agreement).
5. **stop**: on the unchanged tree it reads "a halt for a decision that is the user's" with no self-rule clause, while `plan-orchestration` "Stops" says a stop outside the six kinds is closed under `self_rule: on`. Result: fails. The item 5 text states the same, with the exception "unless `references/self-rule.md` leaves it open".
6. **`land` Steps 6 under self-rule**: on the unchanged tree `skills/land/SKILL.md:80` reads "only when only the user can decide what to do", while the Stops row's last cell says the orchestrator books a choice under `self_rule: on` for a first failure, so the two cells of one row disagree. Result: fails. After item 7 both say a decision for the user, which the amended **open item** closes under self-rule.
7. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. Result: holds on the unchanged tree, as the brief says.
8. `git diff docs/glossary.md` on the unchanged tree: empty (0 lines). Result: fails, as expected.
9. `grep -rn 'only the user can decide' skills docs README.md` on the unchanged tree: 4 hits (`skills/land/SKILL.md:80`, `:183`, `skills/diagnose/SKILL.md:48`, `skills/plan-orchestration/SKILL.md:123`) and 2 more in the **open item** entries (`plan-terms.md:60`, `glossary.md:65`) that read "a decision only the user can make". Result: fails, as expected.

## DONE / NOT DONE

| Item | State | Command that proves it | Output |
|---|---|---|---|
| 1. **choices file** between **change point** and **Closed** | DONE | `grep -n '^- \*\*choices file\*\*' skills/repo-setup/templates/plan-terms.md` | `20:- **choices file**: ...` (after `19:- **change point**`, before `21:- **Closed**`) |
| 2. **self-rule** between **runner** and **sequence, the** | DONE | `grep -n '^- \*\*self-rule\*\*' skills/repo-setup/templates/plan-terms.md` | `100:- **self-rule**: ...` (after `99:- **runner**`, before `101:- **sequence, the**`) |
| 3. **open item** rewritten | DONE | `git diff -U0 skills/repo-setup/templates/plan-terms.md` | the line now reads "It is a decision for the user ... closed by the user's ruling or, under self-rule, when the `plan-orchestration` skill's `references/self-rule.md` does not leave it open, by the option the orchestrator recommends. It is also a worktree `/land` could not remove, closed by running the removal." |
| 4. **ruling** gains the self-rule sense with its "Stated in:" | DONE | same diff | the entry ends `Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees. Stated in: `plan-orchestration`, `references/self-rule.md`, "Closing an open item" and "The review of a choice".` |
| 5. **stop** first sentence and first "Stated in:" | DONE | same diff | `a halt for a decision for the user, which leaves an open item ...; under self-rule the orchestrator closes it at once, unless the `plan-orchestration` skill's `references/self-rule.md` leaves it open. Stated in: `plan-orchestration`, "Stops" and `references/self-rule.md`, "Closing an open item"; `spec`, "Steps / A stop".` |
| 6. `docs/glossary.md` synced | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --write --only glossary` | `written: the plan-terms block now equals the template` |
| 7. the four "only the user can decide" sentences | DONE | `git diff -U0 skills/land skills/diagnose skills/plan-orchestration` | `land/SKILL.md:80` and `plan-orchestration/SKILL.md:123` read "only when what to do is a decision for the user"; the When cell of `land/SKILL.md:183` reads ", and what to do is a decision for the user"; `diagnose/SKILL.md:48` reads "which `land` Steps 6 does only when what to do is a decision for the user." |
| Verify 1 | DONE | `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` | see the lines below; last line `checks: 11 commands passed`, exit 0 |
| Verify 2 | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` |
| Verify 3 | DONE | `git diff docs/glossary.md` | four hunks: `@@ -22,6 +22,7 @@` (choices file), `@@ -62,7 +63,7 @@` (open item), `@@ -98,9 +99,10 @@` (ruling, self-rule; the ruling line changed in place and the self-rule line added), `@@ -112,7 +114,7 @@` (stop); no line outside the plan-terms block |
| Verify 4 | DONE | `git diff -U0 \| grep '^+' \| LC_ALL=C grep -n '[^ -~]'` | no output, exit 1 |
| Verify 5 | DONE | `grep -rn 'only the user can decide' skills docs README.md` | no output, exit 1 |

Lines `checks.sh` printed:

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

Cases 7 to 9 after the build: case 7 is Verify 2, case 8 is Verify 3, case 9 is Verify 5. Cases 1 to 6 were read again on the changed text, as it would be followed, and each now agrees with the sections it names, as the first-run notes above state. `grep -c "$(printf '\t')"` finds no tab in `plan-terms.md` or `docs/glossary.md`.

## Files changed (lines after repair round 1; `git diff --stat`: 6 files, 18 insertions, 14 deletions)

- `skills/repo-setup/templates/plan-terms.md`, 125 lines: the new entries at lines 20 and 100, **open item** at 61, **ruling** at 97, **stop** at 112.
- `docs/glossary.md`, 142 lines: the same entries at 25, 66 (open item), 102 (ruling), 105 (self-rule) and 117 (stop), copied by the sync; no line outside the block changed.
- `skills/land/SKILL.md`, 217 lines: lines 80 and 183, one line each.
- `skills/diagnose/SKILL.md`, 237 lines: line 48.
- `skills/plan-orchestration/SKILL.md`, 362 lines: lines 123, 304, 322 and 338.
- `skills/repo-setup/templates/shared-rules.md`: line 20, the sentence of ruling H.
- `.scratch/2-e-a-self-rule/agents/reviews/8-report.md`: this report.

## A change carries to every place that names it

`grep -rn 'only the user can' skills docs README.md` prints nothing. `grep -rn "only the user\|is the user's\|that is the user's\|decision only" skills docs README.md` (outside the ADRs, the roadmap and the glossary) leaves `skills/refute/SKILL.md:152` ("since only the user rules between the step and the ADR", a rule clash, kind 3, which stays with the user), the plan-orchestration "A finding that is the user's" row names, and the "declined because it is the user's call" lines of the report templates. Each states a decision `references/self-rule.md` leaves open, or a label, and none says an open item is never closed by the orchestrator, so none is changed.

Sentences about the changed files as a whole, reread after the change:

- `skills/repo-setup/templates/plan-terms.md` heading `## Plan terms` and the glossary page's introduction (`docs/glossary.md:3`) say the block is the template copied whole; `sync_rules.py . --only glossary` prints `ok`.
- `skills/plan-orchestration/SKILL.md:304` reads "each for a decision for the user" after repair round 1, and holds under the amended **stop**, which keeps "a decision for the user" and closes the kinds `references/self-rule.md` does not leave open.

## Judgment calls the brief left open

None. Every line is the brief's dictated text or the text a ruling of `agents/briefs/8-round-1.md` dictates.

## User-visible changes, before and after

- **open item**: before "It is a decision only the user can make ... closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal." After the item 3 text above (before and after quoted in full in `git diff -U0 skills/repo-setup/templates/plan-terms.md`).
- **stop**: before "a halt for a decision that is the user's, which leaves an open item in the state file and under the step's Step 0." After "a halt for a decision for the user, which leaves an open item ...; under self-rule the orchestrator closes it at once, unless ... leaves it open."
- **ruling**: before three senses, after four. **self-rule** and **choices file**: new entries.
- The four sentences of item 7: before "only the user can decide what to do", after "what to do is a decision for the user".

## Observations on the brief (nothing changed; no case gives a wrong result)

- The first sense of **ruling** reads "typed as `Ruled: <the choice>`", and the choices-file review writes a user ruling typed `C<n> => <text>` (`references/self-rule.md`, "The review of a choice"). The **choices file** entry's "a ruling of the user replaces it" covers it, and the `spec` skill's "Steps / A ruling" books it, so the term is read broadly there; I did not widen the sentence, since the brief says the rest of the entry stays.
- The **self-rule** entry's "Stated in:" names two sections of `references/self-rule.md`; the sections "A skill with its own approval stop" and "The counts", which "does not leave open" also relies on, are reached through "Closing an open item", whose first sentence names both.
- The **self-rule** entry points at `grill` and `plan`, "What it reads" for `--self-rule`. On the base tree those sections do not yet state `--self-rule`; step 7 writes it in each ("What it reads" 12 of `grill`, "What it reads" 7 of `plan`, per its brief, items 5.2 and 4.3), and this step lands after step 7.
- Premise corrections the brief states (the six kinds in `references/self-rule.md`, `sync_rules.py . --write --only glossary` in place of `/repo-setup sync`) were applied as written.

## Repair round 1

Every ruling of `agents/briefs/8-round-1.md` is carried out, the glossary is synced from the template (`written: the plan-terms block now equals the template`), and the five Verify commands hold. The state-file open items are none, as the round's ruling H closes Open item H.

### The rulings

1. Spec 1, ruling H: `skills/repo-setup/templates/shared-rules.md:20` now reads "... a rule clash. Under `self_rule: on`, in a plan's configuration block or, for `/grill` and `/plan` run with `--self-rule`, in `.agents/plan.yaml`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open is taken with its recommendation and written to the choices file for your review." The rest of the line is unchanged (it still starts "- **No question boxes.** Recommend and proceed. Stop only where the decision belongs to the user:"). The `~/.claude/CLAUDE.md` part of ruling H is the user's and outside the worktree. Before: "Under a plan's `self_rule: on`, such a decision outside ...".
2. Proof 1 and Standards 1, `skills/plan-orchestration/SKILL.md`: line 304 reads "each for a decision for the user, and one refusal" (before "each for a decision that is the user's"); line 322 reads "- A stop is repeated in every report until the user has ruled, or, under `self_rule: on`, until the orchestrator closes it as `references/self-rule.md`, "Closing an open item", says." (before "... until the user has ruled."); line 338's reason cell reads "The builder then takes a decision for the user" (before "a decision that is the user's"). The description (line 3) is not touched.
3. Standards 2, **self-rule** at `plan-terms.md:100`: the "Stated in:" now reads `plan-orchestration`, "Self-rule" and `references/self-rule.md`, "The six kinds left open", "Closing an open item" and "Next-entry mode"; `grill`, Steps 6 and "Steps / Writing what settled"; `plan`, Steps 3. The section "Next-entry mode" of `references/self-rule.md` is written by step 7 (`grep -n 'Next-entry mode' skills/plan-orchestration/references/self-rule.md` prints nothing in this worktree), so the pointer holds once step 7 has landed.
4. Standards 3, **self-rule** at `plan-terms.md:100`: it now reads "in which the orchestrator closes, with the option it recommends, an open item that the `plan-orchestration` skill's `references/self-rule.md` does not leave open, books it as a ruling whose line ends "(self-rule)", and writes it to the choices file; ..." and the rest as built.
5. Standards 4, **choices file** at `plan-terms.md:20`: "Stated in: `plan-orchestration`, `references/self-rule.md`, "The choices file" and "The review of a choice"."

The glossary copies are at `docs/glossary.md:25` and `:105`, from the sync; `git diff docs/glossary.md | grep '^@@'` still prints the four hunks `@@ -22,6 +22,7 @@`, `@@ -62,7 +63,7 @@`, `@@ -98,9 +99,10 @@` and `@@ -112,7 +114,7 @@`.

### Verify, rerun after the round

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

- Verify 1: the lines above, last line `checks: 11 commands passed`, exit 0.
- Verify 2: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- Verify 3: the four hunk headers above, all inside the plan-terms block.
- Verify 4: `git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'` printed nothing, exit 1.
- Verify 5: `grep -rn 'only the user can decide' skills docs README.md` printed nothing, exit 1.
- No tab in `shared-rules.md`, `plan-terms.md`, `docs/glossary.md` or `plan-orchestration/SKILL.md` (`grep -c` prints 0 for each). `git diff --stat | tail -1`: 6 files changed, 18 insertions(+), 14 deletions(-).

### Sentences a fix touches, reread against their file

- `plan-orchestration/SKILL.md:304` ("seven kinds of stop, each for a decision for the user, and one refusal") holds against the table below it, whose seven stop rows are each a decision for the user, and against the amended **stop**.
- `:322` agrees with "Closing an open item" 4 and 6, which move a self-ruled item to the Closed items at once, and keeps the repeat until the user rules for an item the orchestrator does not close.
- `:338` agrees with the row above it: a finding that changes scope is a decision for the user, raised as a stop.
- `shared-rules.md:20` keeps its first three sentences, and its "outside the six kinds `plan-orchestration` "Self-rule" leaves open" is the wording of ruling H. No other copy of the old sentence is in the tree outside the ledger (`grep -rnF "Under a plan's \`self_rule: on\`" .` outside `.scratch` and `.git` printed nothing).
- **self-rule** at `plan-terms.md:100` was reread whole: the clause order puts "with the option it recommends" after "closes", and each pointer names a place that states the rule (`grill` Steps 6 and "Steps / Writing what settled" for a decision taken under `--self-rule`, `plan` Steps 3 for the new plan's decisions, as the refuter report names them).

### The grep of "only the user", "is the user's", "that is the user's" and "decision only"

Command: `grep -rn "only the user\|is the user's\|that is the user's\|decision only" skills docs README.md`, with the ADRs, the roadmap and the glossary left out (the glossary is the template's copy). It prints these lines, each judged:

- `skills/grill/SKILL.md:333`, "A decision is the user's: nothing is written as settled without the user's answer, or a quoted ruling ending "(self-rule)" that settles it as the orchestrator's choice." Holds: the line states the self-rule exception.
- `skills/grill/SKILL.md:335`, "A carried ruling is the user's answer to the decisions it settles." Holds: a carried ruling ends "(the user)".
- `skills/refute/SKILL.md:70`, `skills/refute/templates/report.md:40` and `:61`, `skills/spec/templates/brief-check.md:55`, `skills/repo-setup/templates/plan-terms.md:30` (**Declined to judge**): "declined because it is the user's call". Holds: a reviewer's declined point is a judgment the reviewer does not make, which says nothing of who closes an open item.
- `skills/refute/SKILL.md:152`, "since only the user rules between the step and the ADR". Holds: a contradiction of an ADR is kind 3 of "The six kinds left open", which stays with the user.
- `skills/plan/SKILL.md:137`, "the design half is the user's" (the Anti-patterns row on writing `plan.md` before the user approves the step list). Holds for a plan the user approves; the `--self-rule` case of that row is step 7's text (its brief, item 4.8), so it is not changed here.
- `skills/plan-orchestration/SKILL.md:3`, the description: "stop only where a decision is the user's". Not changed: the description is step 7's (its round 1, ruling 14).
- `skills/plan-orchestration/SKILL.md:59`, `:96`, `:111`, `:312`, and `skills/diagnose/SKILL.md:141`: the row name "A finding that is the user's". Holds: it is the label of a row of "Stops", and `:59` and `:312` already state the exception "or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books".
- `docs/figures/plan-loop.svg:153` and `docs/figures/gen_figures.py:705`: the same row label in the figure. Holds, the label is unchanged.
- `skills/plan-orchestration/SKILL.md:304` and `:338`, which the first account left out, no longer match the pattern after the round: `:304` reads "each for a decision for the user" and `:338` reads "a decision for the user".
