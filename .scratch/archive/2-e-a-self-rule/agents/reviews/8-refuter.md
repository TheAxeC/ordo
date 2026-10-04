# Step 8 refuter report (on .agents/worktrees/2ea-8, base d3c0f00)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

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
(exit 0)

Verify 2: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)
Verify 3: git diff docs/glossary.md | grep '^@@'
@@ -22,6 +22,7 @@ / @@ -62,7 +63,7 @@ / @@ -98,9 +99,10 @@ / @@ -112,7 +114,7 @@
  markers: grep -n 'ordo:plan-terms' docs/glossary.md -> 5 (begin), 131 (end); every changed line lies between them; the only +/- lines are the 8 entry lines.
  diff of the glossary's +/- entry lines against the template's +/- entry lines: identical (printed SAME_LINES).
Verify 4: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'
(no output, exit 1)
Verify 5: grep -rn 'only the user can decide' skills docs README.md
(no output, exit 1)

Dictated text against the template (python, exact substring match): choices file True; self-rule True; open item True; ruling ends with the item 4 sentences True; stop starts with the item 5 sentence and pointer True.
Item 7 lines (git diff -U0 d3c0f00 -- skills/): land/SKILL.md:80, :183, diagnose/SKILL.md:48, plan-orchestration/SKILL.md:123 read as item 7 dictates.

Report evidence rerun:
grep -n '^## What it reads' skills/grill/SKILL.md skills/plan/SKILL.md -> plan:30, grill:30 (matches the report)
grep -n '^## Self-rule' skills/plan-orchestration/SKILL.md -> 224 (matches)
entry lines in plan-terms.md -> change point 19, choices file 20, Closed 21, runner 99, self-rule 100, sequence 101; open item 61, ruling 97, stop 112 (matches)
entry lines in docs/glossary.md -> 25, 66, 102, 105, 117 (matches)
grep -c TAB plan-terms.md docs/glossary.md -> 0, 0 (matches)
wc -l -> plan-terms 125, glossary 142, land 217, diagnose 237, plan-orchestration 362 (matches)
git diff --stat d3c0f00 | tail -1 -> 5 files changed, 14 insertions(+), 10 deletions(-) (matches)
grep -rn 'only the user can' skills docs README.md -> no output, exit 1 (matches)
grep -rn "only the user\|is the user's\|that is the user's\|decision only" skills docs README.md (ADRs, roadmap, glossary left out) -> refute:70, :152; refute templates/report.md:40, :61; grill:333, :335; plan:137; spec templates/brief-check.md:55; plan-orchestration:3, :59, :96, :111, :304, :312, :338; diagnose:141; plan-terms.md:30; docs/figures (does not match the report's account; Proof 1)
The report's "--write" sync was not rerun (it writes); its result is what Verify 2 checks.

Merge with step 7 (read-only, diff3 -m <2ea-7 file> <main file, equal to base: git diff --stat d3c0f00 7d9448d -- skills docs README.md prints nothing> <2ea-8 file>):
plan-terms.md 0 conflicts, docs/glossary.md 0 conflicts, plan-orchestration/SKILL.md 0 conflicts; merged glossary block equals merged template (printed MERGED_BLOCK_EQUALS_TEMPLATE); merged template holds next-entry mode at 58 and self-rule at 100.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds, the **choices file** line at `plan-terms.md:20`, between change point (19) and Closed (21), equals the dictated text.
- 2: holds, the **self-rule** line at `plan-terms.md:100`, between runner (99) and sequence, the (101), equals the dictated text (see Standards 2 and 3 on the dictated words).
- 3: holds, **open item** at `plan-terms.md:61` equals the dictated text.
- 4: holds, **ruling** at `plan-terms.md:97` keeps the old entry and ends with the two dictated sentences.
- 5: holds, **stop** at `plan-terms.md:112` has the dictated first sentence and pointer; the rest of the entry is unchanged in the diff.
- 6: holds, `sync_rules.py . --only glossary` prints ok, and the glossary diff is the template's 8 lines inside the markers (5 to 131).
- 7: holds, the four sentences read as dictated (`git diff -U0 d3c0f00 -- skills/`).

Cases of the brief's "Cases":

- 1: met, the entry agrees with `references/self-rule.md`, "Closing an open item" ("does not leave open" covers the six kinds, "A skill with its own approval stop" and "The counts"), names `/grill` and `/plan` with `--self-rule`, and every section it names exists (self-rule.md headings; plan-orchestration "Self-rule" at 224; grill and plan "What it reads" at 30, which state `--self-rule` once step 7 lands: 2ea-7 grill "What it reads" 12, plan "What it reads" 7). Standards 2 covers what the grill/plan pointer leads to.
- 2: met, path, grouping and both exits are named, and "The choices file" (last bullet, replacement) and "The review of a choice" (Agree and =>) state them.
- 3: met, an item the file leaves open is closed by the user's ruling, any other by the recommended option, a worktree item by the removal.
- 4: met, each of the four senses carries its own "Stated in:", the grill sense `grill`, "Steps / Writing what settled", the self-rule sense `references/self-rule.md`.
- 5: met, read in the term. Standards 1 covers the section the term cites, which still says otherwise.
- 6: met, `land/SKILL.md:80` and the Stops row "A red line for the user" now agree: raised as an open item and, for a first failure under `self_rule: on`, closed by the choice "Closing an open item" books.
- 7: met, `ok: the plan-terms block equals the template`.
- 8: met, only lines inside the block, holding the words of items 1 to 5.
- 9: met, no output.

## 1. Spec

1. `.scratch/2-e-a-self-rule/plan.md`, step 8's line, and `skills/repo-setup/templates/shared-rules.md:20` (unchanged in the worktree): the step line on disk now reads "... synced into `docs/glossary.md`, and the sentence of ruling H in `skills/repo-setup/templates/shared-rules.md`; check: ... (approved) (ruling H)", and the Rulings bullet reads "Open item H (2026-10-01): option (a): the sentence of `skills/repo-setup/templates/shared-rules.md:20` reads "Under `self_rule: on`, in a plan's configuration block or, for `/grill` and `/plan` run with `--self-rule`, in `.agents/plan.yaml`, such a decision ..."; the template change joins step 8 ... (the user)". The state file now lists Open item H under Closed items ("ruled (a) by the user. The template sentence joins step 8") and its open items read "None.". The worktree's `shared-rules.md:20` still reads "Under a plan's `self_rule: on`, such a decision outside the six kinds `plan-orchestration` "Self-rule" leaves open ...", and `git diff --stat d3c0f00` names 5 files, none of them `shared-rules.md`. What is wrong: the step's text, as ruled during this review, names a change the diff does not carry. The brief (written before the ruling) says "a ruling of (a) is carried out as its own change after this step lands", which now contradicts ruling H's "the template change joins step 8". The report's open-items section quotes H as open, which no longer matches the state file; that is the ruling's timing, not a builder defect. Failure scenario: the orchestrator lands step 8 as built and ticks a step line whose "(ruling H)" part is not on the tree. Step 9, which ruling H unblocks, then runs next-entry mode under a shared rule that names only "a plan's `self_rule: on`", so a session reading the rule literally stops at each `/grill --self-rule` decision. Verdict: no item of the brief (the brief does not hold the work); the step line's ruling H part is unbuilt, for a repair round or a fix at landing.

## 2. Proof

1. `.scratch/2-e-a-self-rule/agents/reviews/8-report.md`, "A change carries to every place that names it": "`grep -rn "only the user\|is the user's\|that is the user's\|decision only" skills docs README.md` (outside the ADRs, the roadmap and the glossary) leaves `skills/refute/SKILL.md:152` ..., the plan-orchestration "A finding that is the user's" row names, and the "declined because it is the user's call" lines of the report templates. Each states a decision `references/self-rule.md` leaves open, or a label, and none says an open item is never closed by the orchestrator, so none is changed." What is wrong: the rerun of that grep also prints `skills/plan-orchestration/SKILL.md:3` ("stop only where a decision is the user's"), `:338` ("The builder then takes a decision that is the user's"), `skills/grill/SKILL.md:333` and `:335`, and `skills/plan/SKILL.md:137`, which the account leaves out and does not judge. `:304` is addressed in a separate sentence (Standards 1). The decision that rests on the count is whether the carry of change-standard rule 14 is complete. Failure scenario: the orchestrator reads the paragraph as a full account of the grep and lands the step without anyone having read `:338` against the amended **stop** and **open item**. Under self-rule a scope-changing finding outside the six kinds is the orchestrator's decision, which makes `:338`'s "a decision that is the user's" untrue. Verdict: none.

## 3. Standards

1. `skills/plan-orchestration/SKILL.md:304` and `:322` ("Stops"), unchanged by the diff: "The table holds seven kinds of stop, each for a decision that is the user's, and one refusal ..." and "- A stop is repeated in every report until the user has ruled." What is wrong: the amended **stop** (`plan-terms.md:112`) says "a halt for a decision for the user ...; under self-rule the orchestrator closes it at once, unless the `plan-orchestration` skill's `references/self-rule.md` leaves it open", and it names `plan-orchestration`, "Stops" as the place where this is stated. The section it names still calls every stop "a decision that is the user's", the phrase the brief removed from the term because it "clashes with self-rule as **open item** and **ruling** do". `:322` keeps a stop in every report "until the user has ruled", but a stop the orchestrator closes at once is never ruled by the user. Change-standard rule 19 says a contradicting statement is changed in the same step or reported as a stop when the brief does not cover it. The report does neither: it says `:304` "still holds under the amended **stop**", which contradicts the brief's own premise, and it does not mention `:322`. The same holds for `:338`'s reason cell (Proof 1). Step 7 leaves both lines unchanged (`2ea-7` `:306` and `:324`), so after both steps land they still contradict the term that cites them. Failure scenario: an orchestrator under `self_rule: on` reads "Stops" for what to do with a closed stop. `:322` tells it to repeat the stop in every report until the user rules, so it keeps reporting an item already moved to the Closed items, while the glossary entry says the item was closed at once. Verdict: no item violated, since the lines are outside "Paths this step writes"; it is a rule 19 finding, to be carried or raised.
2. `skills/repo-setup/templates/plan-terms.md:100` (**self-rule**), pointer "`grill` and `plan`, "What it reads"". What is wrong: the entry states that `/grill` and `/plan` run with `--self-rule` "take their decisions the same way", meaning the recommended option, a ruling ending "(self-rule)" and the choices file. On step 7's tree, the "What it reads" sections state only the argument and its refusals (grill "What it reads" 12, plan "What it reads" 7). The decision-taking is stated in grill Steps 6 and "Steps / Writing what settled" (the "(self-rule)" bullet and the choice), in plan Steps 3 (Open item A of the new plan), and in `references/self-rule.md`, "Next-entry mode", which step 7 adds. The pointer also gives no item number, while the block's other "What it reads" pointers give one (for example "`grill`, "What it reads" 11"). The text is dictated by the brief's item 2. Failure scenario: a reader who follows "Stated in:" to learn how `/grill --self-rule` books an answer finds only the refusal conditions, and has to search the Steps for the rule the entry states. Verdict: none (dictated text, held as written).
3. `skills/repo-setup/templates/plan-terms.md:100` (**self-rule**): "in which the orchestrator closes an open item that the `plan-orchestration` skill's `references/self-rule.md` does not leave open with the option it recommends, books it as a ruling ...". What is wrong: the prose standard's "E. Sentence shapes" (sentence length) applies, and the order is ambiguous. "with the option it recommends" follows "does not leave open", so it reads as part of that relative clause, and "it" can resolve to the file instead of the orchestrator. Putting "with the option it recommends" right after "closes" would remove the ambiguity. The text is dictated by the brief's item 2, and the brief check holds dictated text to the standards. Failure scenario: a reader parses the clause as "the items the file does not leave open with the option the file recommends" and looks in `references/self-rule.md` for a recommendation it does not give. Verdict: none (dictated text).
4. `skills/repo-setup/templates/plan-terms.md:20` (**choices file**): "Stated in: the `plan-orchestration` skill's `references/self-rule.md`, "The choices file" and "The review of a choice"." What is wrong: this pointer is the only one of 141 in the block that does not open with the skill's name in code. `grep -o 'Stated in: [^`]\{0,12\}`' ... | sort | uniq -c` prints 140 "Stated in: `" and 1 "Stated in: the `". The step's other three new pointers write the same file as "`plan-orchestration`, `references/self-rule.md`". The prose standard's "D. Structure" (no synonym cycling: one form per concept) applies. The text is dictated by the brief's item 1. Failure scenario: a reader or a grep for the terms whose rule `plan-orchestration` states (`Stated in: \`plan-orchestration\``) misses **choices file**. Verdict: none (dictated text).

## 4. Behaviour

none

## Declined to judge

- Step 7's own text (for example `skills/grill/SKILL.md:351` in `2ea-7`, "A decision is the user's: ..."), read only to judge whether step 8's pointers hold after both steps land, as the brief asks. The pointers hold: the merged template and the merged glossary block are equal, and `next-entry mode`, which the **self-rule** entry uses, is defined at line 58 of the merged block. Until step 7 lands, the term is undefined in step 8's worktree alone.
- The `~/.claude/CLAUDE.md` part of ruling H is outside the repository and the worktree.
- "The open items hold only what the user must rule on" (`land/SKILL.md:110`, `refute/SKILL.md:153`, `plan-orchestration/SKILL.md:277`, `spec/templates/brief.md:67`, the state template's heading), judged against the amended **open item**: these hold. "Closing an open item" 4 and 6 move a self-ruled item to the Closed items in the same commit, so the open items at every resume point hold only items left for the user. No finding.
- The builder's first-run statements about the base tree (for example "no **self-rule** entry"): taken from the diff, which adds the entries and removes none, since only `git diff` and `git status` may be run here and the base cannot be checked out.

Reviewer usage: 179218 tokens, 54 tool uses, 9 min 3 s (aa9c2761143a81412, claude-opus-5-5, ordo-high).

## Repair round 1, refuted

Reviewer ran read-only from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-8` against base `d3c0f00`. The only git commands were `git diff`, `git status --short` and `git show`. Merge checks used `diff3` on copies in the scratchpad.

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
(exit 0)

Verify 2: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)
Verify 3: git diff docs/glossary.md | grep '^@@'
@@ -22,6 +22,7 @@ / @@ -62,7 +63,7 @@ / @@ -98,9 +99,10 @@ / @@ -112,7 +114,7 @@   (markers: ordo:plan-terms begin at line 5, end at line 131; every hunk lies between them)
Verify 4: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'
(no output, exit 1)
Verify 5: grep -rn 'only the user can decide' skills docs README.md
(no output, exit 1)
```

The round report's own commands, rerun:

- `git diff --stat d3c0f00 | tail -1` prints `6 files changed, 18 insertions(+), 14 deletions(-)`, as the report says.
- `grep -c "$(printf '\t')"` over `shared-rules.md`, `plan-terms.md`, `docs/glossary.md` and `plan-orchestration/SKILL.md` prints 0 for each.
- `grep -rnF "Under a plan's \`self_rule: on\`" . --exclude-dir=.scratch --exclude-dir=.git` prints nothing, as the report says.
- `grep -rn "only the user\|is the user's\|that is the user's\|decision only" skills docs README.md`, with the ADRs and the roadmap left out, prints these lines: grill:333, :335; refute:70, :152; refute `templates/report.md`:40, :61; plan:137; spec `templates/brief-check.md`:55; plan-orchestration:3, :59, :96, :111, :312; diagnose:141; `plan-terms.md`:30; `docs/glossary.md`:35; `docs/figures/gen_figures.py`:705; `docs/figures/plan-loop.svg`:153. `plan-orchestration` :304 and :338 no longer match. The report's account now names every line and judges each. I read each one against the amended **open item**, **stop** and **ruling**. None says an open item is never closed by the orchestrator, so the judgments hold.
- Exact string match of ruling 1's sentence against `shared-rules.md:20` printed `True`, with the sentence appearing once. Line 20 is the only line of that file that differs from the base (checked line by line). The text before the sentence is unchanged from the base.
- Exact string match of the **self-rule** line (rulings 3 and 4) and the **choices file** line (ruling 5) against `plan-terms.md` printed `True` for both.
- `grep -n 'Next-entry mode' skills/plan-orchestration/references/self-rule.md` prints nothing in this worktree. Step 7's tree (`../2ea-7`) has that section at line 45. Step 7's `grill` Steps 6 and "Steps / Writing what settled" and `plan` Steps 3 state the decision-taking under `--self-rule`, so the **self-rule** pointers hold once step 7 lands.
- `diff3 -m` of 2ea-7's, the base's and 2ea-8's `plan-terms.md`, `docs/glossary.md` and `plan-orchestration/SKILL.md`: exit 0, 0 conflicts in each. The merged glossary block's 121 entry lines equal the merged template's 121 entry lines.

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. The **choices file** line at `plan-terms.md:20` (between change point and Closed), with the round's pointer form "`plan-orchestration`, `references/self-rule.md`, "The choices file" and "The review of a choice"" per ruling 5.
- 2: holds. The **self-rule** line at `plan-terms.md:100` (between runner and sequence, the) with the round's clause order (ruling 4) and pointer (ruling 3). Item 2's earlier dictated text is replaced by the round's words, as `8-round-1.md` says it governs.
- 3: holds. **open item** at `plan-terms.md:61` equals item 3.
- 4: holds. **ruling** at `plan-terms.md:97` ends with item 4's two sentences, and the earlier senses are unchanged.
- 5: holds. **stop** at `plan-terms.md:112` has item 5's first sentence and pointer.
- 6: holds. The sync prints ok, and the glossary diff is the template's 8 lines inside the markers.
- 7: holds. `land/SKILL.md:80` and :183, `diagnose/SKILL.md:48` and `plan-orchestration/SKILL.md:123` read as dictated.

Round rulings:

- 1: holds. The sentence is word for word, and nothing else of the line changed.
- 2: holds. :304, :322 and :338 read as the ruling dictates, and nothing else of the file changed. The description (line 3) is untouched.
- 3 to 5: hold, matched against the template by exact string.

Cases of the brief's "Cases":

- 1: met. The entry agrees with "Closing an open item" and names `/grill` and `/plan` with `--self-rule`. Every section it names exists on step 7's tree, and "Next-entry mode" exists once step 7 lands.
- 2: met. The path, the grouping and both exits are named, and "The choices file" and "The review of a choice" state them.
- 3: met. The item the file leaves open goes to the user, any other to the recommended option, and a worktree item to the removal.
- 4: met. Each of the four senses has its own "Stated in:". The grill sense names `grill`, "Steps / Writing what settled", and the self-rule sense names `references/self-rule.md`.
- 5: met. The term's text and the section it cites now agree: `plan-orchestration` :304 and :322 say the stop is closed by the orchestrator when "Closing an open item" says so, and :319 already said it.
- 6: met. `land/SKILL.md:80` and the Stops row "A red line for the user" agree.
- 7: met. The command prints `ok: the plan-terms block equals the template`.
- 8: met. The four hunks lie inside the block and hold the words of items 1 to 5.
- 9: met. No output.

First-round findings, closure checked against the rerun:

- Spec 1: closed. `shared-rules.md:20` carries ruling H's sentence.
- Proof 1: closed. The report's account lists every line the grep prints with a judgment, and the rerun reproduces it.
- Standards 1: closed. :304, :322 and :338 are fixed in the text, and no check was removed.
- Standards 2: closed. The pointer names the sections that state the decision-taking.
- Standards 3: closed. The clause order is as ruling 4 dictates.
- Standards 4: closed. The pointer is in the block's form.

No fix reaches beyond its ruling. The diff holds six files and the changed lines are exactly those the rulings and the brief's items name.

### Findings

- `.scratch/2-e-a-self-rule/agents/reviews/8-report.md`, sections before "Repair round 1" (the open items section at line 7 and the note at line 15, "Files changed" at line 77, "A change carries to every place that names it" at line 93): "Item H is not in this brief, and `skills/repo-setup/templates/shared-rules.md` is unchanged."; "## Files changed (lines after the change; `git diff --stat`: 5 files, 14 insertions, 10 deletions)"; "`skills/plan-orchestration/SKILL.md:304` ("each for a decision that is the user's") still holds under the amended **stop**"; and the open items section that quotes Open item H as open ("Kind 3; it waits for you").
  - What is wrong: the round changed these facts, but the earlier sections still state the pre-round facts as the report's own account.
    - `shared-rules.md` is changed.
    - The diff is 6 files, 18 insertions, 14 deletions.
    - :304 now reads "each for a decision for the user".
    - The state file's open items now read "None." and hold H under Closed items.
    - The "Files changed" list omits `shared-rules.md` and `plan-orchestration/SKILL.md` lines 304, 322 and 338.
    - "Judgment calls: None" stands beside a round that rewrote dictated text.
  - Heading: standards (change-standard rule 7, the report states the end state; rule 14, a sentence the change makes false is a defect).
  - Failure scenario: the orchestrator or a later reader takes the report as the landing record and reads that `shared-rules.md` is unchanged and H is open. The orchestrator would then book H as not carried out, or `/land` would quote a stale file count.
  - Verdict: none for the brief's items or cases. It is a report-text fix for the orchestrator at landing or a one-line edit.
- Place: the new text of the round's delta, read against the whole tree: none. Findings by heading:
  - Spec: none.
  - Proof: none.
  - Behaviour: none.
  - Standards: none beyond the report finding above. The rulings dictated every sentence the delta wrote. Their length runs past the prose standard's roughly 20 words, but the entries around them in the block do too.
- Sentences elsewhere the delta makes false: none found.
  - Grep "a plan's `self_rule: on`": no hit in `skills docs README.md`, and no copy of the old sentence remains outside the ledger, `.git` and `~/.claude/CLAUDE.md`.
  - Grep "until the user has ruled": the only hit is :322, now amended. The state-file template heading and `references/self-rule.md` already state the exception.
  - Grep "a decision that is the user's": no hit. The `grill` line with a similar phrase ("A decision is the user's: ... or a quoted ruling ending "(self-rule)"") already states the exception. The "A finding that is the user's" row label is a label and stays.
  - The `plan-orchestration` description and "Self-rule" Scope bullet are step 7's. Step 7's tree has the description reading "stop only where a decision is for the user", per its round 1 ruling 14, and the Scope bullet extended to `/grill` and `/plan` with `--self-rule`. After the merge both agree with the delta.

### Declined to judge

- `~/.claude/CLAUDE.md` still holds the old sentence ("Under a plan's `self_rule: on`, ..."). Ruling H has the user put the same words there, and the file is outside the repository and the worktree. Until the user does, the template and that file differ.
- The merged result with step 7 after landing is read here through `diff3` copies only, since no merge is landed. 0 conflicts and equal template and glossary blocks are what that read shows.
- The **self-rule** pointer to `references/self-rule.md`, "Next-entry mode" holds only once step 7 is on main. Step 8 lands after step 7, as the state file records.
- The sentence length of the dictated shared-rules sentence and the **self-rule** line is left to the user's ruling and the orchestrator's dictation.

Reviewer usage: 144807 tokens, 29 tool uses, 4 min 47 s (adeb36a8bdd6bc53b, claude-sonnet-5-5, ordo-high).

## Closed

- First run, Spec 1, Proof 1 and Standards 1 to 4: closed in repair round 1 by the rulings of `agents/briefs/8-round-1.md` (rulings 1 to 5); the run over round 1 gives each "closed" and each ruling "holds". Proof 1 on the `plan-orchestration` description was step 7's line, closed by step 7's round ruling 14.
- Repair round 1, the finding on the builder's report (its sections before "Repair round 1" stating pre-round facts): fixed at landing in `agents/reviews/8-report.md`. The open-items heading says the quote is from the build and that Open item H has since been ruled (a); the note on item H names `shared-rules.md:20` and round ruling 1; "Files changed" gives 6 files, +18 -14, with `plan-orchestration/SKILL.md` lines 123, 304, 322 and 338 and `shared-rules.md:20`; the `:304` sentence quotes the line after the round; "Judgment calls" names the round's dictated text.
- Declined points of the run over round 1: `~/.claude/CLAUDE.md` is the user's to change under ruling H; the merge with step 7 was resolved at landing (below, in `plan.md`'s booking); the **self-rule** pointer to "Next-entry mode" holds on main, where step 7 landed first (`grep -n '^## Next-entry mode' skills/plan-orchestration/references/self-rule.md` prints line 45); sentence length of dictated text is not a finding.
