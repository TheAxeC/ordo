# Step 12b report (on .agents/worktrees/2ea-12b, base d8bf470)

Everything in the brief and in repair round 1 is done. Four facts of the brief's text differ from the tree, listed under "Anything in the brief wrong or impossible"; none stops an item or a case.

## Open items of the state file, verbatim

None.

## The cases' first run, on the unchanged tree (read before any change)

Every case is a read-the-text case, so each was checked by reading the unchanged `skills/roadmap/SKILL.md` "What it reads" 6 and the report named, and then by applying the five dictated sub-bullets to it. No case is one the brief's rules get wrong; the rules give the expected result in each. On the unchanged tree, the two sub-bullets then in place ("Such a bullet names its finding by ... the heading the finding stands under and its number there" and "`/roadmap` reads that report and finds the finding there") say nothing about `round <n>`, a reviewer's section, or a landing report or diagnosis record without a number.

Reports read: `grep -n '^#'` over `12-refuter.md`, `11b-refuter.md`, `12-landing.md`, `7-brief-check.md`, `.scratch/2-f-diagnose/agents/reviews/3-diagnosis.md`, and the top-level bullets under each heading named below.

1. `7-brief-check.md`, heading "4. Cases and checks", finding 4. The heading holds a bullet list of per-case checks and then "Findings:" with a numbered list 1 to 6. Place 4 in that numbered list is the finding "Case 15: ...". Accepted; `/roadmap` reads the fourth finding. Result: as the brief expects.
2. `12-refuter.md`, "1. Spec", finding 1, no `round <n>`. The first run's `## 1. Spec` (before `## Repair round 1, refuted`) has four top-level bullets, all findings; the first is the `skills/grill/SKILL.md` finding. The same heading text occurs three more times in the round run (`#### 1. Spec` under Reviewer A and under Reviewer B). With no `round <n>`, the dictated last sub-bullet reads the first run's. Result: as the brief expects.
3. `11b-refuter.md`, `round 1`, "3. Standards", finding 1. The first run's `## 3. Standards` first finding is `skills/plan/SKILL.md:87`; the round run's `### 3. Standards` under `## Repair round 1, refuted` has as first finding the `11b-report.md` "Cases read on the text after the change" finding. The two differ, and `round 1` selects the second. Result: as the brief expects.
4. `12-refuter.md`, `round 1`, "Reviewer B, Sonnet", "1. Spec", finding 2. Under `### Reviewer B, Sonnet`, `#### 1. Spec` has as its second top-level bullet the `skills/diagnose/SKILL.md` Steps 11 finding. Result: as the brief expects.
5. `3-diagnosis.md`, the record's title, no number. The record has one `# ` heading (its title) and no appended diagnosis (`grep -c '^# '` prints 1). The text under the title is the whole record. Result: as the brief expects.
6. A diagnosis record with a later diagnosis appended. No record on the tree has one (`find .scratch -name '*-diagnosis.md'` prints only `3-diagnosis.md`), so the case is read on the rule: the heading is the one the later diagnosis is appended under and its text is the text under that heading. Result: as the brief expects.
7. `12-landing.md`, "What was found", no number. The heading exists and its text runs to `## Verification on main`. Result: accepted, with the text under the heading as the finding's text, as the brief expects. The text holds five top-level bullets and twelve bullets in all (`sed -n 38,53p | grep -c '^ *- '` prints 12), not six (see below).
8. A refuter report and a heading, no number. The dictated second sub-bullet requires the number for a refuter report, and the last requires finding it by its number, so the finding is not found, the check fails, and the skill says which check failed (line "The skill says which check failed" stays). Result: as the brief expects.
9. A report under `<archive_root>/`. The sub-bullet "`/roadmap` checks that the plan is open: its folder lies under `<ledger_root>/`, outside `<archive_root>/`" is unchanged, and `.agents/plan.yaml` sets `archive_root: .scratch/archive`, inside `ledger_root: .scratch`. Result: no ruling, as before.
10. `grep -m1 version: skills/roadmap/SKILL.md` prints `  version: "1.3.0"` on the unchanged tree, as the brief expects.

## The texts of item 2, read against the sub-bullets

Each stays true; none states the form of the name or contradicts it.

- Glossary entry **quoted ruling** (`skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, identical, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`): "or with \"(self-rule)\" for `plan` and `grill`, and for `roadmap`'s `add` of work a finding of a running plan names, with the sub-bullets under it" and "Stated in: ... `roadmap`, \"What it reads\" 6". Holds: the ending and the place are unchanged.
- Glossary entry **finding**: "a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario ... Stated in: `refute`, Steps 6 and \"Finding dispositions\"; `spec`, \"Steps / The brief check\"." Holds as a sentence: it is about what a finding is and where it is closed. The sense the dictated last sub-bullet gives the word for a landing report or a diagnosis record is added to the entry by "Repair round 1" item 4.
- `skills/plan-orchestration/references/self-rule.md`, "A skill with its own approval stop", second bullet: "An option that runs `/roadmap add` under a quoted ruling ending \"(self-rule)\" whose bullet names a finding of a running plan, as the `roadmap` skill's \"What it reads\" 6 says, is closed like any other, since `/roadmap add` takes such a bullet." Holds: it points at "What it reads" 6 for the form and states none.
- `roadmap` Rules, first bullet: "Nothing is added except what the user asked for, or what a quoted ruling ending \"(self-rule)\" names as a finding of a running plan." Holds: "names" stays what a bullet does, and the new sub-bullets say how.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. The five sub-bullets replace the two, word for word, same indent, in order; the following sub-bullets stay | DONE | The sub-bullets at lines 56 to 58, 60 and 61 of `skills/roadmap/SKILL.md`, with the leading 7 spaces stripped, diffed against the five lines of the brief's fenced block (the last with the clause round 1 item 2 adds) printed nothing, then `identical`; line 59 is round 1 item 1, diffed against the round brief's block, `identical1`. `git diff` shows the two old sub-bullets removed; "`/roadmap` checks that the plan is open ...", the goal check, "A check that fails leaves no ruling." and "The skill says which check failed." follow unchanged. |
| 2. The four texts read against the change; none made false | DONE | Read above; no sentence is changed, so no hand-back. |
| 3. `metadata.version` stays "1.3.0" | DONE | Verify 3, quoted under "Repair round 1". |
| Verify 1, the plan's verify list | DONE | Quoted under "Repair round 1". |
| Verify 2 | DONE | Quoted under "Repair round 1". |
| Verify 3 | DONE | Quoted under "Repair round 1". |
| Verify 4 | DONE | Quoted under "Repair round 1". |
| Verify 5 | DONE | Quoted under "Repair round 1". |

The output of Verify 1 to 5 after repair round 1 is quoted under "Repair round 1".

Change carried to every place that names it (rule 14), `grep -rn -i 'number there\|names its finding\|heading the finding\|finds the finding' skills docs README.md utils | cut -c1-110`:

```
skills/roadmap/SKILL.md:56:       - Such a bullet names its finding by the path of its report under the plan's
skills/roadmap/SKILL.md:61:       - `/roadmap` reads that report and finds the finding under that heading, in 
skills/diagnose/SKILL.md:58:   - A later diagnosis of the same step is appended to that file under its own hea
skills/diagnose/templates/diagnosis.md:3:Every quoted command output carries `<REDACTED>` in place of the value of a secret in
```

The two `diagnose` hits state how a record is headed; the level they state is the record title's, as "Repair round 1" item 3 says, and the `roadmap` sub-bullets read the same rule. No hit in `docs/`, `README.md` or `utils/`. The `round <n>` form is also in `skills/diagnose/SKILL.md` "What it reads" 5 and `skills/ordo-help/SKILL.md` ("round <n> Spec 1"), which the third sub-bullet cites and which it agrees with.

Sentences about the changed list as a whole, reread after the change: the intro bullet "The bullet's first line ends neither with \"(the user)\" nor, for `add` only, with \"(self-rule)\" on a bullet that names a finding of a running plan ..." still holds, since the sub-bullets say how such a bullet names it; "With no ruling, the skill says which of these it found." still holds.

## Files

- `skills/roadmap/SKILL.md`: 210 lines (206 at the base).
- `skills/diagnose/SKILL.md`: 259 lines.
- `skills/diagnose/templates/diagnosis.md`: 106 lines.
- `skills/repo-setup/templates/plan-terms.md`: 127 lines.
- `docs/glossary.md`: 144 lines.
- `.scratch/2-e-a-self-rule/agents/reviews/12b-report.md`: this report.

## Judgment calls the brief left open

None. The wording is the brief's and the round brief's, and nothing outside the six paths of the round was written.

## Host- or user-visible change

`/roadmap add --ruling <ledger file> "<name>"` on a bullet ending "(self-rule)" now reads its finding's name by the six sub-bullets of "What it reads" 6 (the five dictated in the brief and the one of repair round 1).

Before: a bullet names its finding by "the path of its report ... , the heading the finding stands under and its number there", and "`/roadmap` reads that report and finds the finding there."

After: the sub-bullets in `git diff` of `skills/roadmap/SKILL.md`. A refuter report or brief-check report is named by path, heading and number; a finding of a refuter report's run over a repair round also by `round <n>` and, where the run has one section per reviewer, the section heading, and the reading is inside that section; a run whose findings stand under one heading "Findings" is named by its label as the heading and the number in that label's list; a diagnosis record or landing report by path and heading, with no number, and `/roadmap` reads the whole text under the heading. `/diagnose` appends a later diagnosis at the level of the record's title. The glossary entry **finding** states the sense of the word for a landing report or a diagnosis record.

## Anything in the brief wrong or impossible

1. "What is on the tree", the landing-report bullet, and Case 7: "`12-landing.md` holds six bullets under 'What was found'". `sed -n 38,53p .scratch/2-e-a-self-rule/agents/reviews/12-landing.md` shows five top-level bullets, with seven sub-bullets under two of them (twelve bullets in all). The skill's text reads the whole text under the heading and holds no count, so no item or case is affected.
2. The refuter report template's shape for a run over a repair round differs from the reports on the tree. `skills/refute/templates/report.md`, "Repair round <n>, refuted", has `### Verdicts`, `### Findings` (one list, each finding "under the heading it belongs to") and `### Declined to judge`. A run written to the template holds one list under "Findings", which the sub-bullets name as `round <n>`, "Findings" and the place in the list. The reports on the tree take two other shapes: `11b-refuter.md` and `12-refuter.md` repeat the four numbered headings (`### 1. Spec` in the round run, `#### 1. Spec` under each reviewer), which the sub-bullet on a run over a repair round names, and `6-refuter.md` and `4-refuter.md` group the `### Findings` list by bold labels with numbers restarting at 1, which the sub-bullet on a "Findings" heading grouped by labels of repair round 1 names.
3. A heading's list can hold bullets that are not findings after the findings. In `12-refuter.md` Reviewer B's `#### 1. Spec` the two findings come first and a paragraph with ten further bullets about changed rules follows; in `11b-refuter.md` the round run's `### 3. Standards` third bullet states that the text has no finding. The number is counted in the list of findings under the heading, as Case 1 reads it: in `7-brief-check.md` "4. Cases and checks" that is the numbered list after "Findings:", whose fourth item is "Case 15", and not the fourth top-level bullet of the section.
4. Three landing reports of the plan, `1-landing.md`, `2-landing.md` and `3-landing.md` of `.scratch/2-e-a-self-rule/agents/reviews/`, have only their `# ` title and no `## What was found` (`grep -c '^## What was found'` prints 0 for them, as the brief's premise says). A bullet can name a finding of those only by the title as heading.


## Repair round 1

Items of `agents/briefs/12b-round-1.md`, each with its place before and after.

1. A round run whose findings stand under one heading "Findings" (Spec 2). `skills/roadmap/SKILL.md`, "What it reads" 6. Before: no sub-bullet names such a finding. After, inserted after the sub-bullet beginning "For a finding of a refuter report's run over a repair round", at the same indent, word for word: "- Where a run's findings stand under one heading \"Findings\", grouped by the labels Spec, Proof, Standards and Behaviour, the label stands for the heading and the number is counted in that label's list, as `round 1`, \"Standards\" and 3 name the third finding under the label \"Standards\" of the run over round 1."
2. The reviewer's section in the reading (Spec 4). `skills/roadmap/SKILL.md`, "What it reads" 6, last dictated sub-bullet. Before: "in the first run or in the run of `round <n>`:". After: "in the first run or in the run of `round <n>`, inside the reviewer's section when the bullet gives one:". Nothing else in the sub-bullet changed.
3. The level of a later diagnosis (Spec 3).
   - `skills/diagnose/SKILL.md`, Steps 2. Before: "A later diagnosis of the same step is appended to that file under its own heading, which names its finding." After: "A later diagnosis of the same step is appended to that file under its own heading at the level of the record's title, `# Diagnosis: <the symptom in a few words>`, which names its finding."
   - `skills/diagnose/templates/diagnosis.md`, the paragraph after the title. Before: "A diagnosis of the same step later is appended below under its own heading, which names its finding." After: "A diagnosis of the same step later is appended below under its own heading at the level of the title above, `# Diagnosis: <the symptom in a few words>`, which names its finding."
   - The other places that state how a record is headed, from `grep -rn -i 'appended' skills/diagnose docs README.md` and `grep -n -i 'diagnosis record\|its own heading' docs/glossary.md skills/*/SKILL.md skills/*/references/*.md README.md docs/dev/*.md`: `docs/glossary.md` **diagnosis record** ("Stated in: `diagnose`, Steps 2") lists the record's contents and states no heading rule; `skills/land/SKILL.md` Steps 9 names the record "one heading per diagnosis", which the level agrees with; `docs/glossary.md` **refuter report** concerns a refuter report's appended section; the `roadmap` sub-bullet on a diagnosis record ("the record's title for its first diagnosis or the heading a later diagnosis is appended under") and its last ("the whole text under the heading") stay true, since the text under a level-1 title now ends at the next diagnosis's heading.
4. The sense of **finding** (Standards 1). `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, entry **finding**. Before: "... A finding of the brief check is closed by a change to the brief, or is a stop. Stated in: `refute`, Steps 6 and \"Finding dispositions\"; `spec`, \"Steps / The brief check\"." After: the same, with "A finding of a landing report or a diagnosis record, named by a quoted ruling ending \"(self-rule)\", is the whole text under the heading the ruling names." inserted before "Stated in:" and `; `roadmap`, \"What it reads\" 6` added after the last place. Synced with `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, which printed `written: the plan-terms block now equals the template`.
5. Proof 1. "Anything in the brief wrong or impossible" 3 now states that the number is counted in the list of findings under the heading, as Case 1 reads it. Before: "the number is the place among a heading's top-level bullets, counted from 1, which is what the dictated sub-bullet says".
6. Proof 2. "Anything in the brief wrong or impossible" 2 now states that a round run written to the template holds one list under "Findings", and that the grouped shape of `6-refuter.md` and `4-refuter.md` is the one the text could not name before item 1. Before: "A round run written to the template has no \"3. Standards\" heading, so a bullet's `round <n>`, heading and number would name nothing in it."
7. Spec 1, the count of bullets. The brief's error, corrected in the ledger by the orchestrator; the report's point 1 states the count (five top-level bullets) and nothing more.
8. The report. The first line appears once; the open items read "None."; this section is added.

Files after the round, `wc -l`: `skills/roadmap/SKILL.md` 210 lines; `skills/diagnose/SKILL.md` 259; `skills/diagnose/templates/diagnosis.md` 106; `skills/repo-setup/templates/plan-terms.md` 127; `docs/glossary.md` 144; this report.

Verify, run from the worktree root after the fixes:

```
$ ( cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12b && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md ); echo "exit $?"
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

$ grep -n 'names its finding by the path\|also gives the finding.s number\|also gives .round <n>.\|For a diagnosis record or a landing report the bullet\|finds the finding under that heading' skills/roadmap/SKILL.md | cut -c1-90; grep -c 'finds the finding there' skills/roadmap/SKILL.md
56:       - Such a bullet names its finding by the path of its report under the plan's `ag
57:       - For a refuter report or a brief-check report, the bullet also gives the findin
58:       - For a finding of a refuter report's run over a repair round, the bullet also g
60:       - For a diagnosis record or a landing report the bullet gives no number, and a d
61:       - `/roadmap` reads that report and finds the finding under that heading, in the 
0
(line 59, between them, is the sub-bullet of round 1 item 1:        - Where a run's findings stand under one )

$ grep -m1 version: skills/roadmap/SKILL.md; grep -m1 version: skills/diagnose/SKILL.md skills/repo-setup/SKILL.md
  version: "1.3.0"
skills/diagnose/SKILL.md:  version: "1.1.0"
skills/repo-setup/SKILL.md:  version: "1.3.0"

$ git diff --name-only; git status --short --untracked-files=all
docs/glossary.md
skills/diagnose/SKILL.md
skills/diagnose/templates/diagnosis.md
skills/repo-setup/templates/plan-terms.md
skills/roadmap/SKILL.md
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/diagnose/templates/diagnosis.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
?? .scratch/2-e-a-self-rule/agents/reviews/12b-report.md

$ git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1
```
