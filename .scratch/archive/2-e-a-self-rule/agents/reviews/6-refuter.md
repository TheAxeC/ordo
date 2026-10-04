# Step 6 refuter report (on .agents/worktrees/2ea-6, base 5f41763)

## Verification (rerun by the reviewer)
```
$ sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md   (from the worktree's root; exit 0)
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

Brief verify 2: grep -rn '(self-rule)' skills README.md docs/glossary.md
 hits: skills/land/SKILL.md:214; skills/grill/SKILL.md:83, :115, :216; skills/plan/SKILL.md:56; skills/plan/templates/plan.md:32;
 skills/spec/SKILL.md:44, :227, :229, :238, :305; skills/plan-orchestration/SKILL.md:239, :256, :267, :270, :361;
 skills/repo-setup/templates/plan-terms.md:77; docs/glossary.md:82. None in roadmap, ordo-init, repo-setup/SKILL.md, ordo-help or README.md.
 (The report's plan-orchestration numbers 265, 358 are from before later edits, as it says; no decision rests on them.)

Brief verify 3: the flow walked on my own scratch copy (scratchpad/walk; removed after): a ledger root holding a copy of
 .scratch/2-e-a-self-rule/ (main's), archive/2-e-grill/ (copied from .scratch/archive/2-e-grill), "(self-rule)." bullets
 Open item P, Q, R, S in the open plan (lines 87-90) and X, Y in the archived plan (lines 138-139), step 6b ticked, a step
 "7a ... (ruling R)", and choices.md made from the template (head and Last number copied) holding C4, C8 under "# Entry 2.E grill"
 and C3, C5, C6, C7 under "# Entry 2.E.A self-rule", Last number: C8, each Booked line stale (C3 :80 ... C7 :83; C4/C8 at the
 pre-archive path .scratch/2-e-grill/plan.md:120/:121). Case 9 applied by the text, diff -u (changed lines):
  orchestrator-state.md  + - 2026-10-03: Open item U, step 7's premise on how /grill's rounds are answered: closed under self-rule, C9.
  plan.md                - 7 `next_entry`: ... (each round answered with its recommendation ...
                         + 7 `next_entry`: ... (each round's recommendation taken and written to `choices.md` ...
                         + - Open item U (2026-10-03): step 7's text says ...; unblocks step 7 (self-rule).      [line 91]
                         + ### Step 7, next_entry: Step 0 (stopped 2026-10-03) / - Open item U, step 7: ... Options ... Recommendation: (a). Lazy option: (b).
  choices.md             - Last number: C8   + Last number: C9
                         + ## C9. How step 7 says /grill's rounds are answered (2026-10-03) / <open item as raised> / Taken: / Booked: / Builds on it: 7
 Case 26 read on the same copy: sed -n 80,83p .../plan.md printed
  - D28 The roadmap diff for D4, D8 and D22 (2026-10-01): ...
  - D29 Record D22 as an ADR (2026-10-01): record it (the user).
  - D30 Record D6 as an ADR (2026-10-01): ...
  - Open item A (2026-10-01): the cost script takes ...
 and grep -n 'Open item\|C5' choices.md printed only "35:## C5. Whether step 6b also writes the key's comment (2026-10-02)":
 the choice entry, in the form the text gives, holds no "Open item <L>" for the search "by its name" (finding Spec 1).
 Cases 16, 17, 18, 19, 21, 22, 23 and 24 were read against the same copy as the text says; results under Verdicts.

Brief verify 4 (generator writes into its own folder, so run on a scratch copy of docs/figures):
$ python3 gen_figures.py
wrote fig/figures/pipeline.svg (31507 bytes)
wrote fig/figures/plan-loop.svg (31477 bytes)
exit 0
cmp against the worktree: same pipeline.svg / same plan-loop.svg. git diff 5f41763 --stat shows plan-loop.svg changed, pipeline.svg not.
 The same copy with band_h set back to 216:
error: plan-loop.svg: box '/plan-orchestration <entry>': the label "A rule clash, A finding that is the user's, A model other than the configured one" does not fit the box
exit 1

Brief verify 5:
472 skills/ordo-help/SKILL.md
865 skills/plan-orchestration/SKILL.md
1015 skills/spec/SKILL.md

Brief verify 6:
ok: the plan-terms block equals the template

Brief verify 7: LC_ALL=C grep -n '[^ -~]' over every file of git diff 5f41763 --name-only and templates/choices.md: nothing.
 grep -c <tab> templates/choices.md: 0. LC_ALL=C grep -nP '\t' templates/choices.md: nothing, exit 1.

Evidence the report quotes, rerun:
 awk '/^C<n>/{print index($0,"under")}' skills/ordo-help/SKILL.md -> 31, 31 (README.md: 31, 31; every README sequence line 30-50 at 31)
 wc -l: plan-orchestration 412, choices.md 15, spec 328, plan 141, plan.md 43, orchestrator-state.md 70, grill 338, ordo-help 114,
  refute 187, land 217, shared-rules.md 24, plan-terms.md 121, glossary.md 138, README.md 182, gen_figures.py 751, plan-loop.svg 166 (all match)
 git diff 5f41763 | grep '^[-+].*version' -> nothing (no version change)
 self_rule in the worktree's and main's state file, line 38: self_rule: off
 grep -rn "without the user's authority" skills README.md docs -> nothing
 land:214 compared with 6-cases.md's dictated line: identical; shared-rules.md:20 ends with item 11's sentence: identical;
 templates/choices.md compared with item 3's block: identical.
git status --short (worktree): the 15 modified paths of the diff, ?? .scratch/2-e-a-self-rule/agents/reviews/6-report.md, ?? skills/plan-orchestration/templates/
```

## Verdicts
Items:
1. holds: `## Self-rule` at plan-orchestration/SKILL.md:223-280 has the six labelled parts, the six kinds (kind 3 as ruling B (2) with the revert of 6-cases.md), the skill-approval bullet, Closing 1-7, The counts, The choices file (with ruling B's bullet at :256), The review of a choice (with ruling C's bullets at :271-275), refusal and commit. The flow defects in that text are in the dictated words (Spec 1 to 5, Standards 3).
2. holds: description trigger, What it reads 6, Steps 3 sub-bullet and :59, Steps 9 sub-bullet (ruling C), Steps 10 sub-bullet, resume points, recurring-findings :213/:220-221 (ruling A), :322, :331, Stops rows :361/:362, Stops sub-bullet, :411.
3. holds: identical to the brief's block; ASCII, no tab.
4. holds: description 1015; :44-45, :74, :76, :141, :221, :227, :229, :238, Stops row :305.
5. holds: :56, :138 (Standards 1 for :97-98).
6. holds: :20, :32.
7. holds: :37, :39, :41; Closed items form unchanged.
8. holds: :83, :115, :216; :50/:52/:55 unchanged (Standards 2 for :123 and :333-334).
9. holds: description, Quick start, What it reads 4, Steps 2 with renumbering, the two lines at column 31, :74, :85.
10. holds: refute:151, land:213 (and land:214 per 6-cases.md).
11. holds: word for word.
12. holds: both copies equal (sync check ok).
13. holds: :18 and :45-46 at column 31.
14. holds: band sentence; band_h 216 to 221 is needed for the sentence (the generator refuses 216, rerun above).
15. holds: no version line changed, self_rule off, roadmap:55, ordo-init:48, repo-setup:49 unchanged.

Cases:
1 met (Scope :225-226). 2 met (kind 1 names the model). 3 met (kind 2). 4 met (:220-221, ruling A). 5 met (kind 3, :230). 6 met (kind 4). 7 met (kind 5). 8 met (kind 6). 9 met (walked above). 10 met (:246). 11 met (:235). 12 met (spec:44-45, :305). 13 met (plan:56; roadmap:55, ordo-init:48, repo-setup:49). 14 met (grill:50-55 unchanged; Agree rewrites to "(the user)."). 15 met (grill:115, :216). 16 met when `Booked:` still points at the bullet. 17 met (archived folder found by slug; the archived file's lines unchanged). 18 met (fix step tag resolves under spec:44 to `C5 <phrase>`, ending "(the user)."). 19 met (ruling C, :271-272). 20 met by reading (:274-275, Steps 9 :127). 21 met (:276, :278). 22 met (:279). 23 met (:249). 24 partial: the choice leaves the file and the ending is rewritten, but `<the ruling's name>` has no referent when the `Ruled:` reply writes no Rulings bullet (Spec 2). 25 met (ordo-help Steps 2). 26 partial: the review searches "by its name, `Open item <L>`", and no part of the choice the text defines records `<L>` (Spec 1).

## 1. Spec
1. The choice does not record the name the review searches by. Place: skills/plan-orchestration/SKILL.md:251-252 and :264; skills/plan-orchestration/templates/choices.md:14. Hunk: "Then come three lines: `Taken: <the option taken>`, ``Booked: `<path>:<line>` `` and `Builds on it: ...`" and "The session finds the choice's bullet by its name, `Open item <L>`, ... and the line number of `Booked:` is where the search starts." Wrong: the heading, the three lines and the open item as raised (spec "Steps / A stop" 1 gives it no name) carry no `<L>`; the only record linking C<n> to L is the state file's Closed items line (:241), which the review does not name. Failure scenario: C5 is booked at plan.md:88 (Open item Q); a later step line shifts the Rulings down by one; at `C5 Agree` the session starts at :88, which now holds `- Open item P ... (self-rule).` (C3's bullet), finds an "Open item" bullet ending "(self-rule)" with no name to check it against, and rewrites P to "(the user)." for C5. Case 26 partial. The text is dictated (brief items 1.5, 1.6 and 3); the fix (the name on the `Booked:` line, for example ``Booked: `<path>:<line>` (Open item <L>)``, or the review reading the Closed items line `closed under self-rule, C<n>`) is the orchestrator's.
2. Ruling B's path leaves `<the ruling's name>` and the dependants of the replaced bullet undefined. Place: plan-orchestration/SKILL.md:256; spec/SKILL.md:238; plan-orchestration/SKILL.md:127 and :275. Hunk: "has its ending rewritten to "(self-rule, replaced by <the ruling's name>).", its choice removed from the file, and `- <date>: C<n>: replaced by <the ruling's name>.` added". Wrong: spec "Steps / A ruling" 2 writes a Rulings bullet only for a ruling that adds or splits a step, runs a skill, or sets a shape, vocabulary, rule or library choice, so a `Ruled:` reply that rewrites a step's text has no Rulings line to name; and a step tagged `(ruling <L>)` with the replaced bullet is not retagged (as :271 does for `C<n> =>`), while the landing sub-bullet matches only "replaced by C<n>". Failure scenario: step 7a is tagged `(ruling R)`, R ending "(self-rule)."; the user's `/grill` answer D5 replaces R (grill:216); R now ends "(self-rule, replaced by D5)."; `/spec 7a` refuses it as "A step without its authority" (spec:45 makes only the C<n> form explicit, but R no longer ends "(self-rule)"), and landed work resting on R gets no fix step. The builder's report notes the name gap under "thin" points and did not raise it. The diff follows ruling B as written; the gap is in the ruling and is the orchestrator's. Case 24 partial.
3. An ADR clash is left unclassified by the six kinds, and refute's sentence is false under self-rule. Place: skills/refute/SKILL.md:152; plan-orchestration/SKILL.md:230 and :234; ordo-help/SKILL.md:71. Hunk (refute:152, unchanged): "A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing, since only the user rules between the step and the ADR." Wrong: kind 3 lists its written rules exhaustively (the rules file, the standards pages, the shared rules, `CLAUDE.md`, `.agents/plan.yaml`, the configuration block) and its reversal of a ruling as Rulings bullets and approved steps; kind 6 (:234) names "the written rules, the rulings and the ADRs" as three separate things, so by the section's own vocabulary no kind holds an ADR. The Stops sub-bullet then closes the rule clash, and the booking it uses (spec "Steps / A ruling" 2, "a ruling that answers a rule clash with a new ADR ... the session writes the new record ... the old record is marked superseded") lets the orchestrator supersede an ADR in force. Failure scenario: under `self_rule: on`, `/refute` finds that the brief asked for a contradiction of an ADR; the recommended option is a new ADR; Self-rule closes it and the session writes the superseding record with no ruling of the user, which refute:152 says cannot happen. Judgment on the builder's point: the sentence is false under `self_rule: on` and the six kinds leave the clash unclassified, so leaving the text unchanged does not end the defect. Recommendation: kind 3 names "a contradiction of an ADR in force, or an option that supersedes one" (the goal's "the reversal of a ruling" read to cover a recorded decision), which keeps refute:152, ordo-help:71 and the Stops row true without a change to them. The builder raised it as a question; it is still open.
4. The count stops other than "A step that does not converge" contradict "Closing an open item". Place: plan-orchestration/SKILL.md:124, :236, :245-246, :405-406; skills/land/SKILL.md:80-81 and Stops row :183. Hunks: ":124 A second failure of the step's landing always goes to the user, as the `land` skill's Steps 6 says."; ":406 A step that cannot go on within those counts stops for the user by "Stops""; ":236 An open item that no bullet above leaves open, and that is not the stop "The counts" names, is closed by the orchestrator". Wrong: "The counts" exempts only "A step that does not converge", so the second landing failure, the round cap's leftovers and the other count stops are closed under self-rule, while three sentences say they always go to the user. Failure scenario: under `self_rule: on`, a step lands red a second time; the recommended option rewrites its text and prepares it again; Self-rule closes it, and the step is prepared a third time against "one return out of main" (:405). Change standard rule 19 asks for this to be changed or raised as a stop; the report does neither.
5. An option carrying an approval the rules file reserves to the user is closed under self-rule outside the recurring-findings pass. Place: skills/spec/SKILL.md:201; plan-orchestration/SKILL.md:375 and :236-238. Hunk (spec:201): "Each option states in full every approval it would need later ..., such as what a new script computes or a change to the configuration or the verification list; the user's ruling then approves them too." Wrong: ruling A puts a script's approval in kind 3 only for the recurring-findings pass; for a stop's option, the configuration and the verify list fall in kind 3, but what a new script computes falls in no kind. Failure scenario: a `/spec` stop whose recommended option is "a new script under `templates/` that counts X"; Self-rule closes it and the builder writes the script, against the rules file's "A new script needs the user's approval of what it computes before it is written". Beyond the brief's dictated kinds; for the orchestrator.

## 2. Proof
1. The walk's "found by name" is not reproduced from the text. Place: agents/reviews/6-report.md, verify 3 (cases 16, 17, 18, 19/26, 24). Hunk: "the bullet found by name `Open item D` in the Rulings section of the plan `Booked:` names" and "it was found by name (case 26)". Wrong: the report does not say where the name came from, and the choice entries the text defines hold none (my walk, Spec 1). The landing decision on case 26 rests on this claim. Failure scenario: the orchestrator reads case 26 as met and lands a review flow that rewrites the wrong bullet after a line shift.
2. Defects in dictated text are reported as notes instead of stops. Place: 6-report.md, "Points where the text was thin". Hunk: "`<the ruling's name>` in case 24 needs the `Ruled:` booking to have written a Rulings bullet ... A `Ruled:` that writes no bullet leaves the name undefined". Wrong: change standard rule 4 says text the brief dictates stays as dictated and the point "is reported as a stop"; the first line says everything is done with one question left, so this defect does not reach the orchestrator as a decision. Failure scenario: the landing reads the first line and the open-question list and misses the case-24 gap.

## 3. Standards
1. `/plan` under a "(self-rule)" quoted ruling tags the step list `(approved)`, "the list the user approved". Place: skills/plan/SKILL.md:97-98 and :138 (unchanged), made false by :56. Hunk: ":97 Each step line of the approved list ends with `(approved)` ... :98 A step list written under a quoted ruling is the approved list." and ":138 `(approved)` for a step of the list the user approved". Wrong: with :56 accepting "(self-rule)", a list no user approved is tagged as one. That contradicts ADR 0004 (Consequences "Every ruling says who decided it"; the rejected alternative "it records the user's authority for a decision the user did not make"). It also makes kind 3 protect those steps as user-approved, and :272 keeps the `(approved)` tag after `C<n> =>` replaces the choice. Failure scenario: an open item whose option runs `/plan <entry> --ruling plan.md "Open item M"` is closed under self-rule; every step of the new plan ends `(approved)`; after `C<n> =>` the user's replacement cannot reach those steps by retagging. Fix within the step's files: under a quoted ruling ending "(self-rule)", each step line ends `(ruling <name>)` naming that bullet.
2. grill's Rules call a quoted ruling "the user's answer", now false for a "(self-rule)" one. Place: skills/grill/SKILL.md:123 and :333-334, made false by :83. Hunk: ":333 A decision is the user's: nothing is written as settled without the user's answer. :334 A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff." Failure scenario: under `self_rule: on`, a closed item runs `/grill <entry> --ruling plan.md "Open item M"` with a changed gate in its sub-bullets; grill writes the roadmap diff "since the quoted ruling is the user's answer", while `/roadmap` refuses the same bullet (roadmap:55, the brief's Decision 3), so the roadmap's goal or gate changes under self-rule through `/grill` alone. The builder's grep did not include these words.
3. The reason clause of "The counts" contradicts kind 3. Place: plan-orchestration/SKILL.md:246 against :231. Hunk: "since each of its options rewrites, splits or removes a step the user approved" against "Rewriting an approved step's text to absorb a found premise, and adding a step, are no reversal." Failure scenario: a session that reads :246 takes rewriting an approved step as a reversal, so it leaves case 9's item open, against ruling B (2). Dictated (brief item 1.4); change standard rule 19.
4. Sentences the change makes false that the diff left (change standard rules 14 and 19):
   - README.md:56: "One marked "only when" waits on you in a named case." Under `self_rule: on` such a stop waits only in the six kinds. Outside the README range; the band sentence says it, this line does not.
   - skills/spec/SKILL.md:3: "a candidate being the user's choice". The brief check's closing makes a library candidate a choice closed under self-rule.
   - skills/diagnose/SKILL.md:210 "Inside a plan, the user's ruling on the open item" and skills/land/SKILL.md:183 ("only the user can decide what to do", "The user's ruling"). Under `self_rule: on` the loop closes these and nothing points at "Self-rule".
   - skills/repo-setup/templates/plan-terms.md:77 and docs/glossary.md:82: "a ruling of the user given to a skill ... or with "(self-rule)" for `plan`, `grill` and `spec`". The first clause is false for a "(self-rule)" bullet, and `spec` takes no `--ruling` argument (spec:242). These words are dictated (brief item 12).
   Failure scenario for each: a reader of that line expects the user to decide something the loop closes under self-rule.
5. The section holds material only some runs read. Place: plan-orchestration/SKILL.md:223-280. Wrong: docs/dev/skill-layout.md "Writing for an agent" says "A reference section of row 6 holds only material every run reads", and material for some runs goes in `references/<name>.md`. Self-rule and the review of a choice are read only under `self_rule: on` or when the user types `C<n>`. Failure scenario: every run of the loop under `self_rule: off` loads 58 lines it never uses. The approved step line names "a "Self-rule" section of `plan-orchestration`", so a short section that points at `references/self-rule.md`, or keeping the section as it is, is the orchestrator's choice.

The builder's changes outside the brief's ranges hold under rule 14: `gen_figures.py:563` band_h 216 to 221 is needed for item 14 (the generator refuses 216, rerun above); plan-orchestration:59 "without its authority" follows the renamed spec row; the spec Stops row's "What resumes it" "A ruling, booked as" matches its new When; plan-orchestration:362 and land:214 are as 6-cases.md rules them.

## 4. Behaviour
none: the report gives the before and after of every changed sentence, the template, the README lines and the figure band.

## Declined to judge
- Whether `~/.claude/CLAUDE.md` carries ruling B's sentence: the user's file, outside the worktree and the step.
- Whether step 4's shared files merge at landing: the orchestrator judges that at landing (`spec` Steps 5).
- Whether Spec 3 to 5 and Standards 1 and 2 are fixed in this step or ruled as kinds: each changes which items reach the user, a reading of the goal's six kinds that the orchestrator rules on or raises to the user.

Reviewer usage: a90205aabc898e907, claude-opus-5-5 (ordo-high), 253163 tokens, 56 tool uses, 13 min 31 s.

## Repair round 1, refuted

```
$ cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-6
$ sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md   (exit 1)
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

Same runner, state file copy without the plan_cost.test.sh line (exit 0):
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1                         PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1                       PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1            PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1             PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1        PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1   PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary          ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1                                          PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1                               PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '<the ASCII check of the verify list>'   (no output)
checks: 10 commands passed

Reproduced: the one failing command is plan_cost.test.sh, absent from the worktree (it is on main: /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/ holds plan_cost.py, plan_cost.test.sh, prices.txt). No other command fails.

Brief verify 2: grep -rn '(self-rule)' skills README.md docs/glossary.md
 hits: land:214; grill:76, :84, :116, :124, :217, :336; plan/SKILL.md:56, :99, :139; plan/templates/plan.md:32; spec:44, :227, :229, :238, :305; plan-orchestration/SKILL.md:307; references/self-rule.md:33, :57, :71, :74, :77; plan-terms.md:77; docs/glossary.md:82. None in roadmap, ordo-init, repo-setup/SKILL.md, ordo-help, README.md.
Brief verify 4 (scratch copy of docs/figures): python3 gen_figures.py -> wrote fig/figures/pipeline.svg (31547 bytes), wrote fig/figures/plan-loop.svg (31517 bytes), exit 0; cmp against the worktree: same gen_figures.py, same pipeline.svg, same plan-loop.svg. The report's byte counts (31547, 31517) match.
Brief verify 5 (yaml-parsed length, the count skill-layout gives): ordo-help 472, plan-orchestration 865, spec 987 (grill 808, land 726, refute 951, roadmap 997, others lower). The report's spec 1015 before, 987 after, matches (the before value is the first refuter's 1015). The report lists roadmap as 1001; the yaml count is 997. Roadmap is not in the diff and no decision rests on it.
Brief verify 6: ok: the plan-terms block equals the template
Brief verify 7: LC_ALL=C grep -n '[^ -~]' over git diff 5f41763 --name-only plus templates/choices.md and references/self-rule.md: nothing. Tab and trailing-space grep (-P '\t| +$') over the same files, svgs excluded: nothing.
Report evidence rerun: wc -l of all 15 files in the report's list matches (358, 328, 340, 142, 217, 187, 237, 43, 70, 15, 121, 138, 182, 751, 87). git diff 5f41763 | grep '^[-+].*version': nothing. self_rule: off at line 39 of the main state file. awk '/^C<n>/{print index($0,"under")}' prints 31 for both lines of ordo-help/SKILL.md and README.md. grep for '"Self-rule"' in skills docs README.md prints only the plan-orchestration SKILL.md section heading line 223, references/self-rule.md:7 and shared-rules.md:20, as the report says. grep Booked: prints references/self-rule.md:52, :53, :70, templates/choices.md:14 and docs/adr/0005:20 only. grep '(approved)' hits are true as the report says. plan_cost.test.sh absence: reproduced above.
Delta of the round (rebuilt from 6-before-round-1.patch, diff -ruN against the worktree, svgs read separately): the svg delta is the legend note of both figures only; gen_figures.py delta is lines 395-396 only.
```

### Verdicts

Brief "What to build", whole diff since the base:

- 1. holds. `## Self-rule` at `skills/plan-orchestration/SKILL.md:223` keeps the scope and the pointer bullet; the six kinds, the skill-with-own-approval-stop paragraph, Closing 1-7, The counts, The choices file and The review of a choice are in `references/self-rule.md` (87 lines, labelled headings). The `Ruled:` path's gap is the round-item-2 finding, not this item.
- 2. holds. Description trigger (865 characters), What it reads 6, Steps 3 sub-bullet and :59, Steps 9 sub-bullet at :127, Steps 10 sub-bullet at :133, resume points at :160, recurring-findings at :213 and :220-221, the Stops rows at :307-308, the Stops sub-bullet at :315, :268, :277, :357.
- 3. holds. `templates/choices.md` equals the brief's block with the round's `Booked:` line (`(Open item <L>)`); ASCII, no tab.
- 4. holds. spec description 987; :44-45, :221, :227, :229, :238, Stops row :305.
- 5. holds. `plan/SKILL.md:56`, `:139`.
- 6. holds. `plan/templates/plan.md:20`, `:32`.
- 7. holds. `orchestrator-state.md` lines 37, 39, 41.
- 8. holds as to its text (`grill` :84, :116, :217, lines 50/52/55 unchanged). The round's extra bullet at `grill:76` carries Standards findings 1 and 2 below.
- 9. holds. `ordo-help` description, Quick start, What it reads 4, Steps 2, the two lines at column 31 (rerun: 31 and 31).
- 10. holds. `refute:151`, `land:213`, `land:214` (as 6-cases.md rules it, now with the renamed pointer).
- 11. holds. `shared-rules.md:20` ends with the item's sentence word for word; unchanged this round, and D3 keeps its `"Self-rule"` pointer.
- 12. violated. Resume point holds; the quoted ruling term does not read as the round's item 8 dictates (Spec finding 1).
- 13. holds. README :18 and :45-46 at column 31.
- 14. holds. Band sentence present; the generator reproduces both svgs byte for byte.
- 15. holds. No version line changed, `self_rule: off`, roadmap:55, ordo-init:48, repo-setup:49 unchanged.

Cases of the brief (checked by reading, and by the builder's walk where noted; I did not rerun the builder's scratch walk, its script is not on disk; I walked cases 24 and 26 by reading):

- 1 met. 2 met. 3 met. 4 met. 5 met (kind 3, `references/self-rule.md:15`). 6 met. 7 met. 8 met.
- 9 met. 10 met (`references/self-rule.md:42`). 11 met (:25). 12 met (`spec:44-45`, :305). 13 met. 14 met. 15 met (`grill:116`, :217).
- 16 met. 17 met (archived plan found by slug; `references/self-rule.md:70`). 18 met. 19 met. 20 met by reading (:81, Steps 9 :127). 21 met. 22 met (:86). 23 met (:50).
- 24 met: the choice leaves the file and the Closed items line names the new bullet (`references/self-rule.md:57-58`). The text around it has findings Spec 2 and Spec 3.
- 25 met. 26 met: by reading with a Rulings line shifted by one, the review takes `Open item <L>` from the `Booked:` line, finds that bullet in the Rulings section, and rewrites it, not the bullet that now stands at the stale line number.

Round brief items:

- R1 (Spec 1) holds. The report's walk shifted the bullet by four lines, not by one as the brief asked; the one-line shift gives the same result by reading (case 26 above).
- R2 (Spec 2) violated in part: Spec finding 2.
- R3 (Spec 3) holds: kind 3 sub-bullet at `references/self-rule.md:17`; `refute:152`, `ordo-help:71` and the Stops row "A rule clash" read true as written.
- R4 (Spec 4, Standards 3) holds: `references/self-rule.md:42`; "Closing an open item" names "the stops "The counts" names"; `plan-orchestration` Steps 9 :124, Rules :351-352, `land` Steps 6 and its Stops row read true.
- R5 (Spec 5) holds: `references/self-rule.md:18`.
- R6 (Standards 1) holds: `plan/SKILL.md:98-99`, :139 (D2 sentence word for word).
- R7 (Standards 2) holds as to lines 124 and 335-336; Standards findings 1 to 3 attach to this item's text.
- R8 (Standards 4) violated: Spec finding 1; README:56, spec:3 (D1), diagnose:210, land:183 hold.
- R9 (Standards 5) holds: the reference file in `references/`, the kept section with two bullets, pointers renamed (one deliberate exception, D3), skill-layout lines 66-67 and 73-74 read as the report says.
- R10 (Proof 1) holds as reported: cases 9, 16 to 19, 21 to 26 each name where the name, bullet and lines came from. Case 24's walk does not exercise the retag or fix-step of a step tagged with the replaced bullet, which is where Spec finding 2 lies.

### Findings

**Spec**

1. The quoted ruling term is not written as dictated, and still calls a "(self-rule)" bullet the user's. Place: `docs/glossary.md:82` and `skills/repo-setup/templates/plan-terms.md:77` (the two copies are equal). Hunk: "- **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. ... whose first line ends with "(the user)", or with "(self-rule)" for `plan` and `grill`". `6-round-1.md` item 8 dictates "a ruling given to a skill by the arguments ..." (no "of the user"), with "Where a ruling below gives a sentence word for word, write it as given". The builder dropped `spec` and kept "of the user"; the report's before and after does not mention that the dictated opening was not written. Failure scenario: a reader of the glossary (or of any repository that syncs `plan-terms.md`) reads a bullet ending "(self-rule)", which no user ruled, as "a ruling of the user", the first refuter's Standards 4 finding and ADR 0004's "Every ruling says who decided it" left standing. Round item 8 and brief item 12: violated.
2. A ruling that replaces a "(self-rule)" bullet outside a review leaves the retag form and the fix-step form of the steps resting on it undefined. Place: `skills/plan-orchestration/references/self-rule.md:59`, with :78 and :80. Hunk (:59): "The steps that rest on the replaced bullet, those whose tag or Step 0 names it, are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`." Round item 2 says the tag is rewritten to `(ruling <the new bullet's name>)`. :78 and :80 give `(ruling C<n> <the decision, as a phrase>)`, a name that exists only for a `C<n> =>` ruling. For a `Ruled:` reply the new bullet is `Open item N`, and for `/grill` it is `D<n> ...`. Failure scenario: step 7a is tagged `(ruling R)`, R ends "(self-rule)."; a `Ruled:` reply writes `- Open item N (...), replacing Open item R (the user).`; a session following :59 with :78 writes `(ruling C9 <the decision>)` (C9 being R's choice). No Rulings line has that name, so `/spec 7a` refuses it as "A step without its authority". The same gap holds for the fix step's tag at :80 and :82. The report's case 24 walk kept the step's `(approved)` tag, so it never ran this path. Round item 2 (second bullet): violated; ties to case 24's neighbours, not to its own expected result.
3. The replaced-outside-a-review path does not carry the entry heading rule. Place: `references/self-rule.md:58`. Hunk: "its choice is removed from the file". The `Agree` path says "its entry heading with it when no choice is left under it" (:73) and the `=>` path says "as under `Agree`" (:85). Failure scenario: the replaced choice is the last under `# Entry 2.F ...`; the heading stays with no choice under it, and `ordo-help`, which prints each choice's heading under its entry's heading, is left with an empty entry heading while its count says none for it. Low severity.
4. A change that contradicts ADR 0004, which the round brief asked for: a rule clash for the user, not closable in a round or at landing (`refute` "Finding dispositions"). Place: `skills/grill/SKILL.md:76`, `:124`, `:335-336`. ADR 0004's decision: "`/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)"." The new text makes `/grill` refuse a "(self-rule)" quoted ruling as the user's answer to a roadmap diff (":336 ... settles the decisions it states as the orchestrator's choice, not as the user's answer, and its roadmap diff stays a decision for the user"), where `/grill` accepts a "(the user)" one. Round item 7 asked for it (Standards 2 of the first report). Failure scenario: none in behaviour; the text and the ADR disagree, so `/grill` is not "accepting it wherever". Options for the user: (a) amend ADR 0004's decision sentence to carve out the roadmap diff, recommended, since the carve-out is what keeps the roadmap diff with the user; (b) change `grill` back to accept it, which lets a self-rule bullet change a roadmap entry. Lazy option: leave both as they are.

**Proof**

none. The claims I reran reproduce (verification, figures, counts, line counts, greps). The builder's scratch walk could not be rerun (no script on disk); I read cases 24 and 26 against the text myself, with the result under Spec finding 2 and case 26.

**Standards**

1. `grill/SKILL.md:76` is inserted between a bullet and its sub-bullet, which changes the sub-bullet's parent. Hunk (lines 75-77 now): "    - A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet." / "    - A bullet ending "(self-rule)" settles the decisions its sub-bullets state ..." / "      - What the skill shows beside the change, such as a gate's answer with its reason or the lines around a place, is not part of what is compared." The six-space sub-bullet was under the "A draft is the ruled change" bullet; it now follows the new four-space bullet, so it reads as a sub-bullet of the "(self-rule)" bullet. Failure scenario: `/grill` compares a "(the user)" quoted ruling's draft with its sub-bullet; the exemption for text shown beside the change is now filed under the self-rule bullet, so a run can read the compare as including a gate's answer and its reason, find the draft unequal, and keep the stop standing for a ruling that should have been written without it. `skill-layout` "Lists and tables" (one rule per bullet, a qualifier under the bullet it qualifies).
2. The same rule is written three times in `grill`. Hunks: :76 ("states no roadmap diff: wherever this skill speaks of a roadmap diff a quoted ruling states ... only a bullet ending "(the user)" is meant"), :124 ("When the bullet ends "(self-rule)", the roadmap diff stays a decision of the next round, as `/roadmap` refuses such a bullet") and :336 ("its roadmap diff stays a decision for the user"). `skill-layout` "Where a rule goes": a rule is written once and other places name the section. Failure scenario: a later change to one copy leaves the other two saying otherwise. Line 76 also goes past what the round named (lines 123 and 333-334).
3. The sentences that restate "every run" waits are inexact against the reference. Place: `README.md:56`, `docs/glossary.md:136` (**mark, of a figure**), `docs/figures/gen_figures.py:395-396` (legend note of both svgs). Hunks: "Under `self_rule: on` such a stop waits only when it is of a kind `plan-orchestration` leaves open"; "the stop is of none of the six kinds `plan-orchestration` leaves open"; "unless a quoted ruling states the change or, under self_rule: on, the stop is of none of the six kinds". `references/self-rule.md:23-25` keeps the item open for an option that runs `/roadmap`, `/ordo-init` or `/repo-setup`, under a heading that is not one of "The six kinds left open"; the figure marks `/roadmap add` "The change" and `/ordo-init` "The draft" as "every run". Failure scenario: a user with `self_rule: on` reads the figure or the README and concludes the `/roadmap add` stop is closed by the loop because it is of none of the six kinds; the reference leaves it open. `change-standard` rule 19. The README sentence is the round brief's own wording (item 8); the glossary and legend wording are the builder's, a carry beyond the brief's list that is named under the report's judgment calls and justified by rule 14, but written inexactly.
4. `references/self-rule.md:3` describes what the page covers: "What `plan-orchestration` does under `self_rule: on` and for the review of a choice: which open items stay with the user, how every other open item is closed, and how the choices file is kept and reviewed." `prose-standard` C: "Never describe what the page is about to do." The headings carry it. Failure scenario: none beyond the reader reading the headings twice. Low severity.

**Behaviour**

none. The figures' legend note changes in both svgs and is stated in the report with its before and after (judgment calls and item 8). The `Booked:` line gains `(Open item <L>)` and the report states before and after.

### Declined to judge

- The builder's scratch walk of verify 3 and 10 as a whole: its script is not on disk and a rerun would need a rebuilt ledger of six plan folders. I read cases 24 and 26 against the text, and checked the others only as far as the text's lines and the report's quoted lines agree.
- `~/.claude/CLAUDE.md` carrying ruling B's sentence: the user's file, outside the worktree and the step.
- Whether step 4's shared files merge at landing: the orchestrator's call at landing.
- Whether Spec 4 above is closed by an ADR 0004 amendment or by a change to `grill`: it is the user's ruling, as `refute` "Finding dispositions" says.

Reviewer usage: aafe40381768b8fce, claude-sonnet-5-5 (ordo-high), 235215 tokens, 49 tool uses, 11 min 4 s.

## Closed

- First run, Spec 1 to 5, Proof 1, Standards 1 to 5: closed in repair round 1 by round brief items R1 to R10 (`agents/briefs/6-round-1.md`); the run over round 1 gives each item "holds", except R2 and R8, closed at landing below, and R7, replaced by the ruling on Open item E below.
- First run, Proof 2 (defects in dictated text reported as notes): closed in repair round 1. The round brief told the builder to hand back such a defect before any change, and it did; the points it handed back were ruled in `agents/briefs/6-round-1-rulings.md`.
- Repair round 1, Spec 1 (the quoted ruling term still opened "a ruling of the user"): fixed at landing on main. `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` open "a ruling given to a skill by the arguments", as round item 8 dictates; `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
- Repair round 1, Spec 2 (the retag and fix-step forms undefined outside a review): fixed at landing on main. `references/self-rule.md` "The choices file" gives the steps resting on a replaced bullet the new bullet's name in each tag, read as the `spec` skill's "What it reads" 4 reads it (`<L>` for a `Ruled:` reply's `Open item <L>`, the text before the first ` (` for a `/grill` bullet); "The review of a choice" writes the retag and the fix step's tag as `(ruling <the new bullet's name>)`, with the `C<n>` form as its case.
- Repair round 1, Spec 3 (the entry heading left behind outside a review): fixed at landing on main. The replaced-outside-a-review path removes the entry heading with the choice when no choice is left under it.
- Repair round 1, Spec 4 (`/grill` against ADR 0004 on a "(self-rule)" quoted ruling's roadmap diff): raised as Open item E and ruled (c), changed, by the user; built at landing on main. `grill` "What it reads" loses the bullet round item 7 added, Steps 3 takes a quoted ruling's roadmap diff as settled whatever the ending, and Rules states once that a quoted ruling holding the entry's changed text is the user's answer when it ends "(the user)" and the orchestrator's choice when it ends "(self-rule)", reviewed in the choices file. `references/self-rule.md` adds the roadmap diff to the choice's `Builds on it:` line and, under `C<n> =>`, writes it again from the new bullet by `/grill --ruling`. The `/roadmap add` part of the ruling is step 7's, as the ruling says.
- Repair round 1, Standards 1 (the inserted bullet at `grill:76` changing a sub-bullet's parent) and Standards 2 (the same rule written three times in `grill`): fixed at landing by the ruling's change above. The bullet at line 76 is gone, so the sub-bullet is under "A draft is the ruled change" again, and the rule stands once, in Rules.
- Repair round 1, Standards 3 (the "every run" sentences inexact against the reference): fixed at landing on main. `README.md:56` says such a stop waits only when `plan-orchestration` leaves it open, an item of one of its six kinds or a stop of `/roadmap`, `/ordo-init` or `/repo-setup`; the glossary's **mark, of a figure** and the figures' legend say `plan-orchestration` closes the stop; `python3 docs/figures/gen_figures.py` wrote both svgs again.
- Repair round 1, Standards 4 (`references/self-rule.md:3` describing the page): fixed at landing on main; the line is removed.
- Declined points of the run over round 1: the scratch walk, `~/.claude/CLAUDE.md` and the merge with step 4 are not findings; the merge at landing is booked in `plan.md`; Spec 4 is the ruling above.
