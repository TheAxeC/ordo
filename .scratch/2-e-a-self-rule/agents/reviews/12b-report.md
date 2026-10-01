# Step 12b report (on .agents/worktrees/2ea-12b, base d8bf470)

Everything in the brief is done. Three facts of the brief's text differ from the tree, listed under "Anything in the brief wrong or impossible"; none stops an item or a case.

## Open items of the state file, verbatim

- Open item Q, step 12's check "read by Axel" (kind 5, the user's reading of a page). Step 12 landed. Its check is your reading of what it changed:
  - the five bullets of the version rule in `docs/dev/skill-layout.md`, Frontmatter;
  - the eleven versions;
  - the closing step of `skills/plan/SKILL.md` Steps 2;
  - the rewordings of the eleven skills, listed with their place before and after in `agents/reviews/12-report.md`, "Appendix: every change with its place, before and after".

  The options:
  - (a) Read and agree. Pros: the step's check is met. Cons: none.
  - (b) Read and rule a change. Pros: a wording you disagree with is changed before the tag `v2.8.0-rc.1`. Cons: a further step.

  Recommendation: (a) once read. Both reviewers over the round found each ruling met, and the eight fixes at landing are named in `agents/reviews/12-refuter.md`, "Closed". No option is the lazy one, since the reading is yours.

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

## The texts of item 2, read against the five sub-bullets

Each stays true; none states the form of the name or contradicts it.

- Glossary entry **quoted ruling** (`skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, identical, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`): "or with \"(self-rule)\" for `plan` and `grill`, and for `roadmap`'s `add` of work a finding of a running plan names, with the sub-bullets under it" and "Stated in: ... `roadmap`, \"What it reads\" 6". Holds: the ending and the place are unchanged.
- Glossary entry **finding**: "a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario ... Stated in: `refute`, Steps 6 and \"Finding dispositions\"; `spec`, \"Steps / The brief check\"." Holds as a sentence: it is about what a finding is and where it is closed, and the new sub-bullets define no sense of it. See the first item under "Anything in the brief wrong or impossible" for how the dictated last sub-bullet uses the word.
- `skills/plan-orchestration/references/self-rule.md`, "A skill with its own approval stop", second bullet: "An option that runs `/roadmap add` under a quoted ruling ending \"(self-rule)\" whose bullet names a finding of a running plan, as the `roadmap` skill's \"What it reads\" 6 says, is closed like any other, since `/roadmap add` takes such a bullet." Holds: it points at "What it reads" 6 for the form and states none.
- `roadmap` Rules, first bullet: "Nothing is added except what the user asked for, or what a quoted ruling ending \"(self-rule)\" names as a finding of a running plan." Holds: "names" stays what a bullet does, and the new sub-bullets say how.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. The five sub-bullets replace the two, word for word, same indent, in order; the following sub-bullets stay | DONE | `sed -n 56,60p skills/roadmap/SKILL.md \| sed 's/^       //' \| diff - <the five lines of the brief's fenced block>` printed nothing and then `identical`. `git diff` shows 5 insertions and 2 deletions, the two removed lines being the two old sub-bullets; "`/roadmap` checks that the plan is open ...", the goal check, "A check that fails leaves no ruling." and "The skill says which check failed." follow unchanged. |
| 2. The four texts read against the change; none made false | DONE | Read above; no sentence is changed, so no hand-back. |
| 3. `metadata.version` stays "1.3.0" | DONE | Verify 3 below. |
| Verify 1, the plan's verify list | DONE | Quoted below. |
| Verify 2 | DONE | Quoted below. |
| Verify 3 | DONE | Quoted below. |
| Verify 4 | DONE | Quoted below. |
| Verify 5 | DONE | Quoted below. |

Verify 1, `( cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12b && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md )`, run after the report was written:

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

Verify 2, `grep -n 'names its finding by the path\|also gives the finding.s number\|also gives .round <n>.\|For a diagnosis record or a landing report the bullet\|finds the finding under that heading' skills/roadmap/SKILL.md | cut -c1-90` and `grep -c 'finds the finding there' skills/roadmap/SKILL.md`:

```
56:       - Such a bullet names its finding by the path of its report under the plan's `ag
57:       - For a refuter report or a brief-check report, the bullet also gives the findin
58:       - For a finding of a refuter report's run over a repair round, the bullet also g
59:       - For a diagnosis record or a landing report the bullet gives no number, and a d
60:       - `/roadmap` reads that report and finds the finding under that heading, in the 
0
```

Verify 3, `grep -m1 version: skills/roadmap/SKILL.md`:

```
  version: "1.3.0"
```

Verify 4, `git diff --name-only` and `git status --short --untracked-files=all` (the second as printed before this report was written; the report is the one further path):

```
skills/roadmap/SKILL.md
 M skills/roadmap/SKILL.md
```

Verify 5, `git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"`:

```
exit 1
```

Change carried to every place that names it (rule 14), `grep -rn -i 'number there\|names its finding\|heading the finding\|finds the finding' skills docs README.md utils | cut -c1-110`:

```
skills/roadmap/SKILL.md:56:       - Such a bullet names its finding by the path of its report under the plan's
skills/roadmap/SKILL.md:60:       - `/roadmap` reads that report and finds the finding under that heading, in 
skills/diagnose/SKILL.md:58:   - A later diagnosis of the same step is appended to that file under its own hea
skills/diagnose/templates/diagnosis.md:3:Every quoted command output carries `<REDACTED>` in place of the value of a secret in it, as the rules file's rule on secrets in quoted command output says. A diagnosis of the same step later is appended below under its own heading, which names its finding.
```

The two `diagnose` hits state how a record is headed; the new fourth sub-bullet reads the same heading rule ("the heading a later diagnosis is appended under") and agrees with them. No hit in `docs/`, `README.md` or `utils/`. The `round <n>` form is also in `skills/diagnose/SKILL.md` "What it reads" 5 and `skills/ordo-help/SKILL.md` ("round <n> Spec 1"), which the third sub-bullet cites and which it agrees with.

Sentences about the changed list as a whole, reread after the change: the intro bullet "The bullet's first line ends neither with \"(the user)\" nor, for `add` only, with \"(self-rule)\" on a bullet that names a finding of a running plan ..." still holds, since the five sub-bullets say how such a bullet names it; "With no ruling, the skill says which of these it found." still holds.

## Files

- `skills/roadmap/SKILL.md`: 209 lines (206 at the base).
- `.scratch/2-e-a-self-rule/agents/reviews/12b-report.md`: this report, 153 lines.

## Judgment calls the brief left open

None. The wording is the brief's, and nothing outside the two paths was written.

## Host- or user-visible change

`/roadmap add --ruling <ledger file> "<name>"` on a bullet ending "(self-rule)" now reads its finding's name by the five forms of "What it reads" 6.

Before: a bullet names its finding by "the path of its report ... , the heading the finding stands under and its number there", and "`/roadmap` reads that report and finds the finding there."

After: the five sub-bullets in `git diff` above. A refuter report or brief-check report is named by path, heading and number; a finding of a refuter report's run over a repair round also by `round <n>` and, where the run has one section per reviewer, the section heading; a diagnosis record or landing report by path and heading, with no number, and `/roadmap` reads the whole text under the heading.

## Anything in the brief wrong or impossible

1. "What is on the tree", the landing-report bullet, and Cases 7: "`12-landing.md` holds six bullets under 'What was found'". `sed -n 38,53p .scratch/2-e-a-self-rule/agents/reviews/12-landing.md` shows five top-level bullets, with seven sub-bullets under two of them (twelve bullets in all). The premise's point, that a landing report's heading can hold several findings, holds on the tree. The dictated last sub-bullet's "the finding" for such a heading is then the whole text under the heading, several defects, while the glossary entry **finding** defines one defect a reviewer reports; this was already so with the two replaced sub-bullets ("landing report" and "finds the finding there"), and no glossary sentence is false because of it. Whether `finding` needs a second sense in `skills/repo-setup/templates/plan-terms.md` (`docs/dev/skill-layout.md`, "Writing for an agent", third bullet) is the orchestrator's to rule; the brief's "Paths this step writes" excludes the entry.
2. The refuter report template's shape for a run over a repair round differs from the reports on the tree. `skills/refute/templates/report.md`, "Repair round <n>, refuted", has `### Verdicts`, `### Findings` (one list, each finding "under the heading it belongs to") and `### Declined to judge`; `11b-refuter.md` and `12-refuter.md` instead repeat the four headings (`### 1. Spec` ... in the round run, `#### 1. Spec` under each reviewer). `skills/refute/SKILL.md` Steps, "Over a repair round" 6, says the run is appended "in the shape `templates/report.md` gives it". A round run written to the template has no "3. Standards" heading, so a bullet's `round <n>`, heading and number would name nothing in it. Cases 3 and 4 are read on the two reports as they stand and hold. `skills/diagnose/SKILL.md` "What it reads" 5 already reads a round finding by heading and number, so the form was in force before this step.
3. The list "of findings under that heading" is not always only findings. In `12-refuter.md` Reviewer B's `#### 1. Spec` the two findings come first and a paragraph with ten further bullets about changed rules follows; in `11b-refuter.md` the round run's `### 3. Standards` third bullet is a statement that the text has no finding. Place 1 and place 2 are findings in every case the brief lists, so the cases hold, and the number is the place among a heading's top-level bullets, counted from 1, which is what the dictated sub-bullet says. A later bullet that is not a finding takes a number the same way.
4. A diagnosis record with a later diagnosis appended: `skills/diagnose/SKILL.md` Steps 2 and the template say "under its own heading, which names its finding" and give no heading level. If the later heading is lower than the record's `# ` title, "the whole text under the title" of the first diagnosis includes the later diagnosis. No record on the tree has one, so no case is affected; the level is the `diagnose` skill's to state.
5. Three landing reports of the plan, `1-landing.md`, `2-landing.md` and `3-landing.md` of `.scratch/2-e-a-self-rule/agents/reviews/`, have only their `# ` title and no `## What was found` (`grep -c '^## What was found'` prints 0 for them, as the brief's premise says). A bullet can name a finding of those only by the title as heading.

Reviewer usage and cost are the orchestrator's to book.
