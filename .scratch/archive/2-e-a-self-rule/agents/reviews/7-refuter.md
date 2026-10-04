# Step 7 refuter report (on .agents/worktrees/2ea-7, base 3c4b9c1)

A page this report cites (the rules file, a standard, a skill's text) is named with its section; a skill line also carries its `file:line` in the worktree, so the hunk can be found.

## Verification (rerun by the reviewer)

All commands below ran from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-7`.

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
exit 0

Verify 2: python3 -c 'import yaml; [print(len(...["description"]), f) for f in grill, plan, roadmap, plan-orchestration]'
808 skills/grill/SKILL.md
477 skills/plan/SKILL.md
1022 skills/roadmap/SKILL.md
959 skills/plan-orchestration/SKILL.md

Verify 3a: grep -rn 'replacing Open item <L\|` (Open item <L>)' skills
(no output) exit 1

Verify 3b: grep -n -- '--self-rule' <grill, plan, plan-orchestration SKILL.md, references/self-rule.md>
grep -c per file: grill 22, references/self-rule.md 7, plan 9, plan-orchestration/SKILL.md 1 (39 lines):
plan-orchestration/SKILL.md:364; self-rule.md:62,63,68,77,79,90,95; grill:10,19,35,86,156,157,158,160,183,184,185,186,190,248,249,275,287,328,329,334,335,351; plan:18,42,59,104,105,142,147,154,160

Verify 4a: git diff -U0 3c4b9c1 | grep '^+' | LC_ALL=C grep -n '[^ -~]'
(no output) exit 1   (the same with `git diff -U0` against the index: no output, exit 1)

Verify 4b: grep -c "$(printf '\t')" on each changed file and the report
0 for README.md, the ADR 0005, docs/glossary.md, skills/grill/SKILL.md, skills/plan-orchestration/SKILL.md, references/self-rule.md, templates/choices.md, skills/plan/SKILL.md, plan-terms.md, skills/roadmap/SKILL.md, 7-report.md

Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

The report's evidence, rerun at the base:
descriptions at 3c4b9c1 (git show + the Verify 2 count): 808 grill, 477 plan, 997 roadmap, 865 plan-orchestration
git grep -n 'replacing Open item <L\|` (Open item <L>)' 3c4b9c1 -- skills
  references/self-rule.md:50, :56, :75; templates/choices.md:14
git grep -n 'self_rule\|next_entry' 3c4b9c1 -- grill, plan, roadmap SKILL.md: only skills/plan/SKILL.md:106
git diff --numstat 3c4b9c1: README 3/3, ADR 0005 1/1, glossary 2/1, grill 28/10, plan-orchestration 9/7, self-rule.md 56/8, choices.md 1/1, plan 23/6, plan-terms 2/1, roadmap 10/5
git diff --stat 3c4b9c1: 10 files changed, 135 insertions(+), 43 deletions(-)
wc -l: README 190, ADR 20, glossary 141, grill 356, plan-orchestration 364, self-rule.md 135, choices.md 15, plan 163, plan-terms 124, roadmap 200, report 155
hunks of the range-limited paths: README @@ -22, -48, -56; ADR @@ -20; glossary @@ -62,0 +63 and -84; plan-terms @@ -57,0 +58 and -79 (all inside "Paths this step writes")
git status --short: the ten files above modified, ?? .scratch/2-e-a-self-rule/agents/reviews/7-report.md
```

Every count, path and line the report quotes reproduces. The brief's premises I spot-checked with `git show 3c4b9c1:<file> | sed -n` (grill :10, :34, :90, :151, :238, :312-313, :333; plan :41, :106, :119, :126, :137, :143; roadmap :10, :55, :65, :84, :183, :189; plan-orchestration :10, :130, :224-227, :362; self-rule.md :17, :21, :23, :31, :69, :74, :75 and its 87 lines) all reproduce.

## Verdicts

Items of the brief's "What to build":

- 1.1: holds. `references/self-rule.md:45-79`, section "Next-entry mode": the keys (49-50), the closing and kind 4 (51-54), the next entry with its four cases (55-60), the invocation order and the `projects:` form (61-65), the stops (66-74) and the takeover (75-79). Spec 4 and Standards 2, 8 and 9 name defects in this text.
- 1.2: holds. `self-rule.md:23-25`.
- 1.3: holds in the brief's words (`self-rule.md:88-95, 99`). Standards 1: line 90 misstates how `spec` reads a name.
- 1.4: holds in the brief's words (`self-rule.md:112, 117, 118, 127, 128, 130-133`). Spec 1: the condition "no plan open" also covers a closed plan. Standards 6: the rule is written three times.
- 2: holds. `templates/choices.md:14`.
- 3: holds. The description (959 characters), the intro `:10`, Quick start `:15` and `:17`, "What it reads" 7 `:40`, Steps 10 `:131-132`, "Self-rule" "The reference" `:229` and Rules `:364`. Standards 2: the "Scope" bullet beside it is now contradicted.
- 4.1: holds, `plan/SKILL.md:18`.
- 4.2: holds, `:42`.
- 4.3: holds, `:59-60`.
- 4.4: holds as ruling 1 of `7-cases.md` moved it: Steps 3 `:117`, written when `plan.md` is written, never at Steps 2.
- 4.5: holds in the brief's words (`:104-113`). Spec 2 covers the second option, which the builder also raised.
- 4.6: holds, `:132` and `:136`.
- 4.7: holds, `:142` and `:147`.
- 4.8: holds, `:154`.
- 4.9: holds, `:160`.
- 5.1: holds, `grill/SKILL.md:19` and `:10`.
- 5.2: holds, `:35` and `:86-88`.
- 5.3: holds, `:94`.
- 5.4: holds under ruling 3 (`:156-158`, which name the reference's section and list no kind). Spec 3 and Spec 5 name defects in this text.
- 5.5: holds, `:248-252`.
- 5.6: holds, `:275` and `:287`.
- 5.7: holds under ruling 2, `:183-186` and `:190`.
- 5.8: holds, `:351`.
- 5.9: holds, `:328-329` and `:334-335`.
- 5.10: holds, 808 characters.
- 6.1: holds, `roadmap/SKILL.md:55-60`.
- 6.2: holds under ruling 4, `:194`.
- 6.3: holds. The intro is `:10`. The description ends "Writes only after the user approves or under a quoted ruling." and is 1022 characters.
- 6.4: holds, `:188`.
- 7: holds in the brief's words, `README.md:22`, `:48` and `:56`. Standards 7 covers the missing `self_rule` key.
- 8: holds, `plan-terms.md:58` and `:80`, `glossary.md:63` and `:85`, and the sync prints ok.
- 9: holds, ADR 0005 Consequences.

Cases of the brief's "Cases":

- 1: met. The refusal is at grill Steps 1 (`:94`) through "What it reads" 12 (`:87`), the Stops row `:334` names both keys and their values, and no lookup has started by Steps 1.
- 2: partial. No round is sent (`:156`), bullets end "(self-rule)." (`:248`), each choice's `Booked:` names the rulings file, the line and `D<n> <phrase>` (`:251`), the roadmap diff and "record as ADR?" are answered the same way (`:275`, `:287`), and there is one commit with no question (`:184-185`). The missing part is the completion criterion of Steps 6 (`:160`), which reads as ending the turn even when no six-kind decision was sent (Spec 5).
- 3: met. A rule clash is kind 3 ("a clash between them, or the reversal of a ruling"), so `:157` sends it alone.
- 4: met. Kind 6, `:157`.
- 5: met for this repository, read against "The six kinds left open". A new script is named in kind 3 itself (self-rule.md:16). A new glossary term is kind 3 because `docs/glossary.md` is among the `standards:` pages of `.agents/plan.yaml`. See "Declined to judge" for other repositories.
- 6: met, `:88`, `:94`, `:335`.
- 7: met. Without the argument no `--self-rule` bullet applies.
- 8: met. `plan/SKILL.md:104-117` (the Open item A bullet, `(ruling A)`, the Closed items line with no open item, the `Booked:` rewrite, the new choice) and `:132`, `:135` (the choices file in the opening commit, and the rulings file removed).
- 9: met, `:105` and `:118`.
- 10: met, `:60` and `:147`.
- 11: met. `spec` "What it reads" 4 names a tag `<L>` for `- Open item <L> (<date>): ...` and accepts "(self-rule)".
- 12: met, self-rule.md:51-54 and 61-64.
- 13: met, `:57`.
- 14: met, `:56`.
- 15: met, `:59`.
- 16: met, `:58`.
- 17: met, `:49`. Standards 3 names the state template's comment, which says the opposite for the reverse setting.
- 18: met, `:51-52`.
- 19: met. `roadmap/SKILL.md:55-60`, and Steps 4 `:79` writes without the stop when the gate's answer is no.
- 20: met, `:56-60`.
- 21: met. "(self-rule)" counts for `add` only (`:55`).
- 22: met, self-rule.md:24-25.
- 23: met, `:112`, `:115-117`, `:131-132`.
- 24: met, `:92`, `:112`, `:118`.
- 25: met, `:118` and `:133`.
- 26: met, `:127`.
- 27: met, `:128`.
- 28: met, self-rule.md:76-77 and `plan-orchestration/SKILL.md:17`.

## 1. Spec

1. `skills/plan-orchestration/references/self-rule.md:117`, `:130`, `:131-133`, section "The review of a choice":
   - The hunks: "`- <date>: C<n>, <the decision>: agreed by the user.` is added to that plan's Closed items, unless no plan is open for the entry." and "With no plan open, the `C<n> =>` bullet is written to the entry's rulings file, where `/plan` copies it."
   - What is wrong: the condition "no plan is open for the entry" also holds for a closed plan, whose choices stay in the file until reviewed (`:98`). For a choice booked in an archived `plan.md` (`:112`, "for a closed plan"), the text now writes no Closed-items line. It also sends the `C<n> =>` bullet to `<ledger_root>/rulings/<slug>.md`, a file `/plan` removed when it opened the plan.
   - Before the change, `Agree` and `C<n> =>` wrote to that plan's Rulings and Closed items, whether the plan was open or closed. Change standard rule 17 requires a rewrite to keep the scope of the rule it carries. Brief item 1.4 and Decision 7 meant the rulings file only ("since a bullet line of the rulings file is copied into the plan's Rulings").
   - Failure scenario: after plan 2.E.A closes at step 13, the user types `C1 => <text>`. The session finds C1's bullet in `.scratch/archive/2-e-a-self-rule/plan.md`, then writes `- C1 ... replacing Open item F (the user).` into a new `.scratch/rulings/2-e-a-self-rule.md` instead of the archived plan's Rulings. It writes no Closed-items line. A new rulings file now exists for a done entry, and a later `/grill` or `/plan` reads it as that entry's rulings.
   - Fix: make the condition "when `Booked:` names the rulings file".
   - Verdict: item 1.4 holds in its words, and the text it produced violates rule 17 for closed plans.

2. `skills/plan/SKILL.md:104` and `:108`, Steps 3 (the builder's point under "Anything in the brief wrong or impossible", judged a finding):
   - The hunks: the options "the list as drafted" and "the list with each unsettled design decision settled and each line left to place placed", and "The Rulings bullet is `- Open item A (<date>): the step list as drafted, <n> steps, which opens the plan (self-rule).`"
   - What is wrong: "Closing an open item" 2 takes the recommended option. The text fixes the bullet to the first option, and gives no way to carry out the second inside `/plan`, since settling a design decision is `/grill`'s. Whenever a design decision is named unsettled or a line is left to place, "as drafted" is the lazy option (it leaves the design work undone), so the second option is the one a correct recommendation names.
   - Failure scenario: `/plan 9 --self-rule` names one unsettled public shape. The orchestrator recommends the second option and has no step that settles it. Or it books "the step list as drafted" against its own recommendation, and the plan opens with the design decision unsettled and booked as a choice.
   - Fix (the orchestrator's ruling): either keep the stop with the user whenever a design decision is named unsettled or a line is left to place, or drop the second option under `--self-rule`. The first keeps the design half with whoever can settle it; the second is the lazy option.
   - Verdict: item 4.5 holds as dictated, and the text it dictates cannot be followed for the second option.

3. `skills/grill/SKILL.md:156`, Steps 6:
   - The hunk: "Under `--self-rule`, the round is not sent: each decision of the frontier outside the six kinds ... is answered with its recommendation, as the orchestrator's choice, and goes on to Steps 8 with that answer."
   - What is wrong: jumping to Steps 8 skips Steps 7, whose bullet `:166` runs "Steps / An answer that contradicts" and "Steps / Terms and claims" on every answer. Steps 5 holds options only against the rules file, the standards pages and the ADRs, not against Rulings bullets. A recommended answer that contradicts an earlier ruling of the user (kind 3, "the reversal of a ruling") is therefore never turned into a rule clash. It is written as a "(self-rule)" bullet.
   - Failure scenario: an entry's rulings file holds `D2 ... (the user)` choosing format X. A new decision D5's recommendation implies format Y. Under `--self-rule`, D5 goes straight to Steps 8 and is written "(self-rule)", reversing the user's ruling without a stop.
   - Verdict: item 5.4 holds in its words, and kind 3 is not kept open for answers.

4. `skills/plan-orchestration/references/self-rule.md:66` and `:70-72`, section "Next-entry mode":
   - The hunks: "The run stops at an item of the six kinds, at a stop "The counts" names, and at a refusal of `/grill` or `/plan`." and "A `/plan` stop of the six kinds shows its draft and writes nothing."
   - What is wrong: `/plan` under `--self-rule` also keeps its stop with the user when any "## Gate" answer is yes (`plan/SKILL.md:105`). The plan text counts this as a case beside the six kinds ("It also stays with the user ... when it is of one of the six kinds", `:106`). The section's list of stops, and its sub-bullets on how a `/plan` stop resumes, name only the six kinds.
   - Failure scenario: in next-entry mode `/plan` stops on a step check answered yes after two redrafts. The orchestrator reading "Next-entry mode" finds no stop that matches, and no line saying that the user's approval resumes `/plan` and then the loop.
   - Verdict: item 1.1 holds in its words, and the section omits a stop the step's own `/plan` text raises.

5. `skills/grill/SKILL.md:160`, Steps 6:
   - The hunk: "or, under `--self-rule`, each decision outside the six kinds is answered and the decisions of the six kinds, if any, are sent and the turn has ended."
   - What is wrong: "and the turn has ended" stands outside "if any", so the completion criterion requires the turn to end even when no six-kind decision was sent. Line 156 says the skill goes on to Steps 8. `docs/dev/skill-layout.md`, "Writing for an agent", says each item ends on its completion criterion, so this one decides when Steps 6 is done.
   - Failure scenario: `/grill 9 --self-rule` with a frontier of three ordinary decisions answers them and then ends the turn, as the criterion says. The unattended next-entry run halts with nothing asked of the user.
   - Verdict: case 2 partial.

## 2. Proof

none

## 3. Standards

1. `skills/plan-orchestration/references/self-rule.md:90`, section "The choices file":
   - The hunk: "The name is read as the `spec` skill's "What it reads" 4 reads a name: `Open item <L>` for a bullet "Closing an open item" books, and `D<n> <the decision, as a phrase>` for a bullet `/grill --self-rule` writes."
   - What is wrong: `spec` "What it reads" 4 reads the name of `- Open item <L> (<date>): ...` as `<L>`, not `Open item <L>`. The same file's `:101` says so: "`<L>` for a `Ruled:` reply's bullet `Open item <L>`".
   - Rules broken: the change standard, rule 19 (no two contradicting statements) and rule 14 (a sentence the change makes false).
   - Failure scenario: a session writing `C<n> => <text>` for a choice booked `(Open item F)` must fill `replacing <the old bullet's name>` and a step tag `(ruling <name>)`. Line 90 gives `Open item F` and line 101 and `spec` give `F`, so tags and `replacing` clauses come out in two forms across plans.
   - Verdict: item 1.3 holds in its words.

2. `skills/plan-orchestration/SKILL.md:228`, section "Self-rule", bullet "Scope", which `references/self-rule.md:5` adopts as the reference's scope:
   - The hunk: "The section applies under `self_rule: on` in the configuration block, and with `self_rule: off`, or the key absent, every open item waits for the user".
   - What is wrong: "Next-entry mode" (`self-rule.md:49`) applies when no plan is open and no configuration block exists, reading `.agents/plan.yaml`. `/plan --self-rule` (`plan/SKILL.md:107`) closes Open item A by "Closing an open item" before any state file exists. A literal reader of the Scope bullet finds the key absent and keeps every item with the user.
   - Rule broken: the change standard, rule 19. This is the clash of Open item H inside the skill's own text, which is skill text and not kind 3.
   - Failure scenario: a session taking over between plans reads "Self-rule" first, finds no configuration block, and stops `/plan --self-rule`'s Open item A for the user.
   - Verdict: item 3 holds in its words.

3. `skills/plan/templates/orchestrator-state.md:29`, outside the step's paths:
   - The hunk: "`next_entry: off              # on, with self_rule on: after the closing, the orchestrator takes the next open roadmap entry; off: it stops at the closing.`"
   - What is wrong: "Next-entry mode" (`self-rule.md:49`, and Decision 5) makes `.agents/plan.yaml` govern after the closing, not the block. With the block at `off` and `.agents/plan.yaml` at `on`, the run goes on, while the comment says it stops.
   - Rules broken: the change standard, rules 14 and 19. When the brief does not cover the fix, rule 19 asks for it to be reported as a stop, and the report does not list it.
   - Failure scenario: a user sets the closed plan's block to `off` to stop after this plan. `.agents/plan.yaml` still holds `on`, and the next entry is grilled and planned.
   - Verdict: case 17 met, and the template contradicts it.

4. `skills/grill/SKILL.md:10` (intro) and `:3` (description):
   - The hunks: "a proposed ADR for each decision the user chose to record" and "and, on the user's yes, a proposed ADR".
   - What is wrong: under `--self-rule` a record is written on the orchestrator's recommendation (`:287`), with no user's yes and no user's choice. The report's rule-14 reread says `:10` holds.
   - Rule broken: the change standard, rule 14 (a sentence about the file as a whole, reread after the change).
   - Failure scenario: a user reading the description or intro believes an ADR in `docs/adr/` was approved by them. It was written under `--self-rule`.
   - Verdict: none.

5. `skills/plan-orchestration/references/self-rule.md:117`, `:130`, `:131`:
   - The hunks: "... unless no plan is open for the entry." (twice) and "With no plan open for the entry, neither `Agree` nor `C<n> =>` writes a Closed-items line".
   - What is wrong: one rule is stated in three places.
   - Rule broken: `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in."
   - Failure scenario: Spec 1's fix changes the condition in one place, and the other two keep "no plan open", so the copies drift.
   - Verdict: none.

6. `README.md:22` and `:48`:
   - The hunks: "Under `next_entry: on` it goes on to the next roadmap entry after the closing" and "and under next_entry: on goes on to the next entry after the closing".
   - What is wrong: next-entry mode needs `self_rule: on` as well (`self-rule.md:49`, the term **next-entry mode**, and `check_config.py` notes "it acts only under self-rule"). The sentence is false with `self_rule: off`. The words are the brief's; the brief says a design ruling "never exempts the text". The builder named this under its judgment calls and did not fix it.
   - Rule broken: the change standard, rule 14.
   - Failure scenario: a user sets only `next_entry: on` from the README and expects the next entry to run. The loop stops at the closing.
   - Verdict: item 7 holds in its words.

7. `skills/plan-orchestration/references/self-rule.md:71`:
   - The hunk: "The user's approval or correction resumes `/plan`, which writes the plan with the step list the user's."
   - What is wrong: the clause "with the step list the user's" has no verb.
   - Rule broken: `skills/repo-setup/templates/docs/dev/prose-standard.md`, 0 "Plain prose only" (and E). The words were dictated by brief item 1.1, which the prose standard does not exempt.
   - Failure scenario: a reader cannot tell whether the plan is written with the user's corrected list or with the drafted list the user approved, so the tag (`approved` or `ruling A`) is unclear.
   - Verdict: none.

8. `skills/plan-orchestration/references/self-rule.md:61` and `:64`:
   - The hunks: "For any other next entry, the loop invokes these through the runner, in this order:" and "3. The loop on the new plan".
   - What is wrong: the glossary defines **loop** as "the unattended run of `plan-orchestration` over an open plan's steps". Here "the loop" acts between plans, invoking `/grill` and `/plan`, and then invokes "the loop".
   - Rule broken: `docs/dev/skill-layout.md`, "Writing for an agent": "A term that `docs/glossary.md` defines is used only in a sense it defines there."
   - Failure scenario: a reader of the glossary looks for the actor between plans and finds none, since the term covers only an open plan's steps. The **next-entry mode** term itself lists "the loop" as the third stage, apart from what invokes `/grill`.
   - Verdict: none.

## 4. Behaviour

1. `skills/plan-orchestration/SKILL.md:17` and `references/self-rule.md:76`:
   - The hunk: "continue the plan ... with no plan open, under both keys, take the next roadmap entry".
   - What is wrong: a trigger phrase changes what it does. Before, `continue the plan` with no plan open resumed nothing. After, it starts `/grill <entry> --self-rule` on the roadmap's next entry. The report's "Host- or user-visible changes" has no line for it.
   - Failure scenario: a user who types "continue the plan" to check on a finished plan, in a repository with both keys on, starts a self-ruled interview and plan of the next entry without knowing the phrase now does that.
   - Verdict: none.

2. `references/self-rule.md:117`, `:130-133`:
   - What is wrong: the review of a choice of a closed plan changes. Before, it wrote the archived plan's Rulings and Closed items. After, it writes no Closed-items line and sends `C<n> =>` to the rulings file. The report states the change only as "with no plan open", and not its before and after for closed plans.
   - Failure scenario: as in Spec 1.
   - Verdict: none (the defect is Spec 1).

## Declined to judge

- Whether a new glossary term is kind 3 in a repository whose `standards:` does not list the glossary (case 5): the six kinds name "the standards pages", which depend on each repository's configuration. In this repository it is kind 3.
- Whether the whole next-entry run behaves as the text says: the plan's "## Gate" line for step 7 puts that on step 9's run, which a read cannot settle.
- Open item H (the shared rule and `~/.claude/CLAUDE.md`): kind 3, the user's.

Reviewer usage: 255946 tokens, 43 tool uses, 8 min 54 s (acaa1cd6ca52da97e, claude-opus-5-5, ordo-high).

## Repair round 1, refuted

Pages this report cites (the rules file, a standard, a skill's text) are named by section. A finding in a skill keeps its `file:line` in the worktree.

### How the round's delta was established

No tree snapshot was recorded when the round was sent, so I did not have a diff of the round. I established it three ways and read it against `git -C .../2ea-7 diff 3c4b9c1`, read whole (11 files).

1. Every place the 14 rulings of `agents/briefs/7-round-1.md` name was read in the current tree.
2. Every hunk the first refuter report (`agents/reviews/7-refuter.md`) quotes was compared with the current tree. The old texts "unless no plan is open for the entry", "a `/plan` stop of the six kinds", "goes on to Steps 8 with that answer", "the step list the user's." and "each unsettled design decision settled" no longer occur: `grep -rn` over `skills README.md docs` for all five prints nothing.
3. The numstat now against the first refuter's numstat. The first report had README 3/3, ADR 1/1, glossary 2/1, grill 28/10, plan-orchestration 9/7, self-rule.md 56/8, choices.md 1/1, plan 23/6, plan-terms 2/1, roadmap 10/5, ten files. Now: README 3/3, ADR 1/1, glossary 2/1, grill 32/11, plan-orchestration 10/8, self-rule.md 59/9, choices.md 1/1, plan 25/6, orchestrator-state.md 1/1, plan-terms 2/1, roadmap 10/5, eleven files. The round therefore changed grill, plan-orchestration, self-rule.md, plan and README in content, and added `skills/plan/templates/orchestrator-state.md` (one line). Glossary, plan-terms, ADR, roadmap and choices.md are unchanged in size. The README content differs from the first build (ruling 10) at the same line count.

The delta was not diffable, so a change inside an unchanged-size hunk of the other files cannot be excluded by this method. I read those hunks whole and found none against the rulings.

### Verification (rerun by the reviewer)

From `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-7`, `sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`:

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
exit 0
```

The brief's other commands, from the worktree root:

```
Verify 2 (the python3 -c over grill, plan, roadmap, plan-orchestration):
877 skills/grill/SKILL.md
477 skills/plan/SKILL.md
1022 skills/roadmap/SKILL.md
961 skills/plan-orchestration/SKILL.md
Verify 3a: grep -rn 'replacing Open item <L\|` (Open item <L>)' skills
(no output) exit 1
Verify 3b: grep -c -- '--self-rule' on grill, plan, plan-orchestration/SKILL.md, references/self-rule.md
grill 24, plan 9, plan-orchestration/SKILL.md 2, references/self-rule.md 10 (45 lines; the line numbers listed in the output are the ones the builder's report gives)
Verify 4a: git diff -U0 3c4b9c1 | grep '^+' | LC_ALL=C grep -n '[^ -~]'
(no output) exit 1   (the same against the index: no output, exit 1)
Verify 4b: grep -c "$(printf '\t')" on README.md, ADR 0005, docs/glossary.md, grill, plan-orchestration SKILL.md, self-rule.md, choices.md, plan SKILL.md, orchestrator-state.md, plan-terms.md, roadmap SKILL.md, 7-report.md
0 for each of the twelve
Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
git diff --stat 3c4b9c1 | tail -1
11 files changed, 146 insertions(+), 47 deletions(-)
git status --short
M README.md, M the ADR 0005, M docs/glossary.md, M skills/grill/SKILL.md, M skills/plan-orchestration/SKILL.md, M .../references/self-rule.md, M .../templates/choices.md, M skills/plan/SKILL.md, M skills/plan/templates/orchestrator-state.md, M plan-terms.md, M skills/roadmap/SKILL.md, ?? .scratch/2-e-a-self-rule/agents/reviews/7-report.md
```

The report's base figures also reproduce: descriptions at 3c4b9c1 by `git show 3c4b9c1:skills/<s>/SKILL.md` and the Verify 2 count are 808, 477, 997, 865; `git grep` of the old `Booked:` and `replacing` forms at 3c4b9c1 prints `self-rule.md:50, :56, :75` and `templates/choices.md:14`. The round's claimed lengths (grill 877, plan 477, roadmap 1022, plan-orchestration 961) reproduce, and all are at most 1,024. Every line number the round section quotes (self-rule.md:50, 52, 55, 59, 61, 64, 66, 70, 71, 72, 78, 88-91, 100, 113-114, 118-119, 131-135; plan/SKILL.md:104-110, 119; grill:3, 10, 156-163; plan-orchestration SKILL.md:3, 10, 131, 228; README:22, 48; orchestrator-state.md:29) points at the text it describes.

### Verdicts

#### The 14 rulings of the round

1. Spec 1 and Standards 5 (the condition stated once): holds. `references/self-rule.md:132-135` is one bullet, "A choice booked in a rulings file", with three sub-bullets. `:118` and `:131` name it ("except as the bullet ... says"). `:113` says a choice booked in a plan is found in that plan's file. A choice booked in an open or archived `plan.md` is reviewed as before.
2. Spec 2 (Open item A's options): holds. `plan/SKILL.md:104` gives the options "open the plan with the list as drafted" and "keep the draft for the user". `:105` makes the first the recommendation and names the second the lazy option. `:106` copies a line left to place and has Open item A name it. `:108` keeps the stop for a design decision named unsettled. The removed option no longer occurs.
3. Spec 3 (the checks of Steps 7 under `--self-rule`): partial. `grill/SKILL.md:159-161` is one bullet naming Steps 7 and its two sections, with a sub-bullet for a contradiction and one for a missing term, and `:156` no longer jumps to Steps 8. The antecedent of "each such answer" is the problem (Spec 1 below).
4. Spec 4 (the stops "Next-entry mode" names): holds, `self-rule.md:66` and `:70`.
5. Spec 5 (the completion criterion): holds in meaning, `grill/SKILL.md:163`. Standards 4 is about its form.
6. Standards 1 (the name): holds. `self-rule.md:88-91` and `templates/choices.md:14` read "opening words"; `:91` gives the tag name as `spec` "What it reads" 4 reads it (`<L>` or `D<n> <phrase>`); `:100` and `:119` use "opening words". The claim that `spec` reads `Open item <L>` is gone. `spec/SKILL.md:44` and `:228` confirm the tag reading.
7. Standards 2 (the Scope bullet): holds, `plan-orchestration/SKILL.md:228`.
8. Standards 3 (the state template): holds, `skills/plan/templates/orchestrator-state.md:29`, one line (numstat 1/1, ASCII).
9. Standards 4 (the ADR sentence): holds at the named places, `grill/SKILL.md:3` and `:10`. The same defect remains in `README.md:16` (Standards 1 below).
10. Standards 6 (README 22 and 48): holds, "under `self_rule: on` and `next_entry: on`" at `README.md:22` and `:48`.
11. Standards 7 (the verb): holds, `self-rule.md:71`.
12. Standards 8 ("the loop"): partial. "Next-entry mode" (`self-rule.md:50, 52, 55, 59, 61`), `plan-orchestration/SKILL.md:10` and `:131` name the orchestrator. `SKILL.md:132` and `:364` still make "the loop" the actor of next-entry mode (Standards 3 below).
13. Behaviour 1 and 2 (the report): holds for the two lines it names (`7-report.md:148` and `:149`). Other lines of the report are stale (Behaviour 1 below).
14. The step 8 refuter's Proof 1 (the description's wording): holds, `plan-orchestration/SKILL.md:3` reads "stop only where a decision is for the user", 961 characters.

No finding was closed by removing a check. The only removals are the three the rulings ask for (the second option of Open item A, the repeated "no plan open" bullets, the Steps 8 jump). No fix reaches beyond a finding. `skills/plan/templates/orchestrator-state.md` is the only file added, by ruling 8, and its diff is one line.

#### Items of the brief's "What to build", over the whole diff since 3c4b9c1

- 1.1: holds, `references/self-rule.md:45-79` (keys 49-50; closing and kind 4 51-54; the four next-entry cases 55-60; the invocation order and the `projects:` form 61-65; stops 66-74; takeover 75-79).
- 1.2: holds, `self-rule.md:21-25`.
- 1.3: holds as `7-round-1.md` ruling 6 words it, `self-rule.md:88-96, 100`.
- 1.4: holds as ruling 1 words it, `self-rule.md:113-135`.
- 2: holds, `templates/choices.md:14`.
- 3: holds, `plan-orchestration/SKILL.md` description, `:10`, `:15`, `:17`, `:40`, `:131-132`, `:228-229`, `:364`.
- 4.1: holds, `plan/SKILL.md:18`.
- 4.2: holds, `:42`. Standards 2 is a glossary sentence this change makes false.
- 4.3: holds, `:59-60`.
- 4.4: holds as `7-cases.md` ruling 1 moved it to Steps 3, `:119-121`.
- 4.5: holds as round ruling 2 words it, `:104-115`.
- 4.6: holds, `:134` and `:138`.
- 4.7: holds, `:144` and `:149`.
- 4.8: holds, `:156`.
- 4.9: holds, `:162`.
- 5.1: holds, `grill/SKILL.md:19` and `:10`.
- 5.2: holds, `:35` and `:86-88`.
- 5.3: holds, `:94`.
- 5.4: holds in the brief's and the rulings' words (`:156-163`). Spec 1 names the ambiguity in `:159`.
- 5.5: holds, `:251-254`.
- 5.6: holds, `:278` and `:290`.
- 5.7: holds, `:186-189` and `:193`.
- 5.8: holds, `:354`.
- 5.9: holds, `:331-332` and `:337-338`.
- 5.10: holds, 877 characters.
- 6.1: holds, `roadmap/SKILL.md:55-60`.
- 6.2: holds as `7-cases.md` ruling 4 words it, `:194`.
- 6.3: holds, `:10` and the description (1022 characters).
- 6.4: holds, `:188`.
- 7: holds, `README.md:22`, `:48`, `:56`.
- 8: holds, `plan-terms.md:58` and `:80`, `glossary.md:63` and `:85`, sync prints ok.
- 9: holds, ADR 0005 Consequences.

#### Cases of the brief's "Cases"

- 1: met (`grill:94`, `:87`, `:337`).
- 2: met (`:156` no round, `:251` bullets, `:252-254` choices, `:278` and `:290` the diff and ADR decisions, `:187-189` one commit and no question, `:163` the criterion now ends in Steps 8 when no six-kind decision was sent).
- 3: met (a clash with a ruling is kind 3, `self-rule.md:13`; caught by the checks at `grill:159-160`, subject to Spec 1).
- 4: met (kind 6, `:157`).
- 5: met for this repository (a new script is named in kind 3, `self-rule.md:16`; the glossary is among `standards:`).
- 6: met (`:88`, `:94`, `:338`).
- 7: met.
- 8: met (`plan:104-115`, `:119-121`, `:134`, `:137`), on the condition that no design decision is named unsettled, which round ruling 2 added and the case's text does not state.
- 9: met (`plan:107`, `:120`).
- 10: met (`:60`, `:149`).
- 11: met (`spec:44`).
- 12: met (`self-rule.md:51-54`, `:61-64`).
- 13: met (`:57`).
- 14: met (`:56`).
- 15: met (`:59`).
- 16: met (`:58`).
- 17: met (`:49`, and the state template `:29` now agrees).
- 18: met (`:51-54`; `plan-orchestration/SKILL.md:315` the stop row).
- 19: met (`roadmap:55-60`, Steps 4 `:79`).
- 20: met (`:56-60`).
- 21: met (`:55`, "for `add` only").
- 22: met (`self-rule.md:24-25`).
- 23: met (`:113`, `:115-118`, `:132-135`).
- 24: met (`:93`, `:113`, `:119`).
- 25: met (`:119`, `:135`).
- 26: met (`:128`).
- 27: met (`:129`).
- 28: met (`:77`, `plan-orchestration/SKILL.md:17`).

### 1. Spec

1. `skills/grill/SKILL.md:158-159`, Steps 6.
   - Hunk: "- The user's answers to such a round are written as the user's, and the interview goes on under `--self-rule`." and "- Under `--self-rule`, each such answer goes through the checks of Steps 7 that read an answer ("Steps / Terms and claims" and "Steps / An answer that contradicts") before Steps 8."
   - What is wrong: ruling 3 says a decision "answered with its recommendation" goes through the checks. "Each such answer" follows a bullet about the user's answers to a six-kind round, so its nearest antecedent is the user's answers, which Steps 7 line `:169` already checks without `--self-rule`. The recommendation answers of `:156` are named only by the words "before Steps 8", which are the sole sign of the intended reading.
   - Failure scenario: an entry's rulings file holds `D2 ... (the user)` choosing format X. Under `--self-rule`, D5's recommendation implies format Y. A session that reads "such answer" as the user's answers skips the checks for D5 and writes `D5 ... (self-rule).`, which reverses the user's ruling without a stop. This is the first refuter's Spec 3 scenario, closed only if the sentence is read the second way.
   - Fix: name the antecedent, for example "each decision answered with its recommendation".
   - Verdict: ruling 3 is partial. Items 5.4 and case 3 hold on the second reading.

### 2. Proof

none. The step is text with no test, and the commands the report quotes reproduce (see Verification).

### 3. Standards

1. `README.md:16`, the `grill` row.
   - Hunk: "... the roadmap entry and the glossary, and on the user's yes a proposed ADR |"
   - What is wrong: ruling 9 (the first report's Standards 4) changed the description and intro of `grill` because a record is written under `--self-rule` on the orchestrator's recommendation with no yes from the user. The README row says the same as the old description and was not reached. Change standard rule 14 asks for each sentence the change makes false to be fixed, found by grepping the names the diff changed: `grep -rn 'proposed ADR' README.md docs skills` finds `README.md:16`.
   - Failure scenario: a user reads the README row, believes no ADR is written without their yes, and finds `docs/adr/00NN-*.md` with status `proposed` written by a next-entry run.
   - Verdict: none.

2. `docs/glossary.md:103` and `skills/repo-setup/templates/plan-terms.md:98`, the term **rulings file**.
   - Hunk: "which holds the user's settled design answers for a roadmap entry, one bullet line each, ..., while no plan is open."
   - What is wrong: item 4.2 rewrote the same claim in `plan/SKILL.md:42` to "the settled design answers for the entry, the user's and those `/grill --self-rule` wrote", because the file now holds "(self-rule)" bullets. The term is not changed, so the glossary defines the file in a sense the skills no longer use (`docs/dev/skill-layout.md`, "Writing for an agent": a term is used only in a sense the glossary defines, and a skill changes the entry in `plan-terms.md` first). The two copies agree (sync prints ok), so only the sync check passes.
   - Failure scenario: a reader of the glossary, or a session that reads the term before `/plan`, takes the rulings file to hold only the user's answers, and takes a `(self-rule)` bullet found there to be foreign.
   - Verdict: none (item 4.2 holds in its words).

3. `skills/plan-orchestration/SKILL.md:132` and `:364`.
   - Hunks: ":132 - The loop ends only at a pause, when nothing unblocked is left, or at an end `references/self-rule.md`, "Next-entry mode", names" and ":364 - Every skill the loop invokes (... `/grill <entry> --self-rule` and `/plan <entry> --self-rule` in next-entry mode, ...)".
   - What is wrong: ruling 12 makes the orchestrator the actor between plans and limits "the loop" to the run over an open plan's steps, as the glossary's **loop** defines it. "Next-entry mode", `:10` and `:131` were changed. `:364` still has the loop invoke `/grill` and `/plan` between plans, and `:132` has the loop end at the ends the next-entry section gives to the run.
   - Failure scenario: a reader holding `self-rule.md:61` ("the orchestrator invokes these") and `:364` ("the loop invokes") finds two actors for the same call.
   - Verdict: ruling 12 partial.

4. `skills/grill/SKILL.md:163`, Steps 6, the completion criterion (dictated by ruling 5).
   - Hunk: "The step is done when the message is sent and the turn has ended, or the frontier was empty and the skill has gone on to Steps 8, or, under `--self-rule`, each decision outside the six kinds is answered and, when any decision of the six kinds was sent, the turn has ended, and with none sent the skill goes on to Steps 8 in the same turn."
   - What is wrong: one bullet of about 75 words holding three alternatives and two conditions. `docs/dev/skill-layout.md`, "Lists and tables": requirements joined by 'and' or 'or' that can each be broken while the other holds are separate bullets; prose-standard E: sentences under roughly 20 words unless the mechanism needs more.
   - Failure scenario: a reader tracking "and, when any ... was sent, the turn has ended, and with none sent" can attach the second "and" to the wrong condition and end the turn with no six-kind decision sent, the first report's Spec 5 failure in a different parse.
   - Verdict: none.

### 4. Behaviour

1. `agents/reviews/7-report.md`, the first part, left stale by the round: line 142, "`/plan <entry> --self-rule`, new. ... After: the stop is raised as `Open item A` and closed under self-rule unless a "## Gate" answer is yes or it is of the six kinds".
   - What is wrong: round rulings 2 and 4 added a third case that keeps the stop with the user (a design decision named unsettled, `plan/SKILL.md:108`) and replaced the second option. The before and after of this change in "Host- or user-visible changes" does not state it. Other lines the round made false stay: line 123 ("carry 'unless no plan is open for the entry'"), line 128 ("README lines 22 and 48 say 'under `next_entry: on`'"), lines 155 and 153-155 ("The orchestrator's to rule" for the second option), and the file-count line 102 and table 104-115 (10 files, 135/43; now 11 files, 146/47). The state template's `next_entry` comment, which changes the state file of every plan opened later, is stated only in the round section as its after text, without its before.
   - Failure scenario: the orchestrator writes the final message and the landing booking from the "Host- or user-visible changes" list, and tells the user that `/plan --self-rule` stops only for a yes answer or a six-kind item. A user then meets a stop for an unsettled design decision.
   - Verdict: none.

### Declined to judge

- Whether the run behaves as the text says (the next entry taken, resumed, refused): the plan's "## Gate" line for step 7 puts it on step 9's run, which a read cannot settle.
- Open item H (the shared rule and `~/.claude/CLAUDE.md`): kind 3, the user's.
- Case 5 in a repository whose `standards:` does not list the glossary: the six kinds name "the standards pages", which depend on the configuration. In this repository a new term is kind 3.
- `skills/ordo-help/SKILL.md:91` and the `/plan-orchestration` band of `docs/figures/gen_figures.py` (`:686-693`): they say the orchestration "runs them for every step unattended" and do not mention the next entry. They are incomplete, not false, and the brief did not name them. Whether they need a line is the orchestrator's.
- Whether the builder ran any git command beyond the read-only ones in the round: the report names none and the transcript is not an input of this review.
- Sentence length of the added prose beyond `grill:163`: nearly every bullet of the skills runs past 20 words, and I judged only the one where the length hides a condition.
- Reviewer usage figures: the reviewer cannot measure its own tokens, tool uses or time.

Reviewer usage: 287831 tokens, 53 tool uses, 10 min 8 s (ad8e8ad9c3dbbb136, claude-sonnet-5-5, ordo-high).

## Closed

- First run, Spec 1 to 5, Standards 1 to 8, Behaviour 1 and 2: closed in repair round 1 by the rulings of `agents/briefs/7-round-1.md` (rulings 1 to 13). The run over round 1 gives each ruling "holds", except rulings 3 and 12 (partial), closed at landing below.
- Step 8's first run, Proof 1 (the `plan-orchestration` description's wording): closed in repair round 1 by ruling 14, which the run over round 1 gives "holds".
- Repair round 1, Spec 1 (`grill:159`, "each such answer" with the user's answers as its nearest antecedent): fixed at landing on main. The bullet reads "Under `--self-rule`, each decision answered with its recommendation goes through the checks of Steps 7 ...".
- Repair round 1, Standards 1 (`README.md:16`, the `grill` row still saying a proposed ADR is written only on the user's yes): fixed at landing on main. The row ends "and a proposed ADR on the user's yes or, under `--self-rule`, on the orchestrator's recommendation", as the description says; `grep -rn "user's yes a proposed" skills docs README.md` prints nothing.
- Repair round 1, Standards 2 (the term **rulings file** holding only "the user's" answers): fixed at landing on main. `skills/repo-setup/templates/plan-terms.md:98` reads "the settled design answers for a roadmap entry, the user's and those `/grill --self-rule` wrote", as `plan/SKILL.md:42` does; `sync_rules.py . --only glossary --write` copied it into `docs/glossary.md:103`, and the check prints `ok: the plan-terms block equals the template`.
- Repair round 1, Standards 3 (`plan-orchestration/SKILL.md:132` and `:364`, "the loop" as the actor between plans): fixed at landing on main. Steps 10 says the loop ends only at a pause or when nothing unblocked is left, and a new bullet says that after the closing step the orchestrator's run ends at an end "Next-entry mode" names; Rules reads "Every skill the orchestrator invokes".
- Repair round 1, Standards 4 (`grill:163`, the completion criterion in one bullet of three alternatives and two conditions): fixed at landing on main. The bullet is a list of the four states in which the step is done, each a sub-bullet.
- Repair round 1, Behaviour 1 (the builder's report left stale by the round): fixed at landing in `agents/reviews/7-report.md`. "Files changed" gives the 11 files and +146 -47 after the round with each file's lines and diff; the judgment calls on "The review of a choice" and README 22 and 48 state the round's text; the description is 961 characters; the `/plan --self-rule` after text names the two options and the stop kept for an unsettled design decision; the state template's comment has its before and after; "the loop" between plans reads "the orchestrator"; the point on Open item A's second option states round ruling 2.
- Declined points of the run over round 1: whether the run behaves as the text says is step 9's run; Open item H is ruled by the user and its template sentence is step 8's; case 5 holds for this repository's `standards:`; `skills/ordo-help/SKILL.md:91` and the `/plan-orchestration` band of `docs/figures/gen_figures.py` describe the loop over a plan's steps, which stays true, and the brief did not name them.
