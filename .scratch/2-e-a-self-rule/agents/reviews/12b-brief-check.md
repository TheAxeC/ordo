# Step 12b brief check (on main at b1af081)

This is the report of the fresh agent from the `spec` skill's "Steps / The brief check", run on `.scratch/2-e-a-self-rule/agents/briefs/12b.md`. I changed no file. The only command that wrote anything was the `mkdir` of the scratch folder. Pages are cited by section; grep hits keep their file:line.

The installed `spec` skill at `/Users/axelfaes/.claude/skills/spec` links to `~/.local/share/ordo-stable`. That checkout is pinned to tag `v2.7.0` (`git -C ~/.local/share/ordo-stable describe --tags` printed `v2.7.0`). Its "The brief check" has no "Dictated text" check, and its template has no section 8. I therefore ran section 8 from the repository's `skills/spec/templates/brief-check.md` on main. `diff` of the two "The brief check" sections shows the "Dictated text" bullets only in the repository's copy.

## 1. Names

The names this step changes are the two sub-bullets of `roadmap` "What it reads" 6 and the phrases that carry the form of the name ("its number there", "finds the finding there", "the heading the finding stands under", "names its finding").

Command: `grep -rn -i 'number there\|finds the finding\|heading the finding\|heading it stands under\|names its finding\|names a finding\|finding of a running plan\|a finding of a running\|agents/reviews/` (a refuter' skills docs README.md`

Hits outside the brief's paths, and whether the change makes them false:
- `skills/repo-setup/templates/plan-terms.md:82` and `docs/glossary.md:87` (**quoted ruling**, "for `roadmap`'s `add` of work a finding of a running plan names"). Not made false: neither states the form of the name.
- `skills/plan-orchestration/references/self-rule.md:29` ("whose bullet names a finding of a running plan, as the `roadmap` skill's "What it reads" 6 says"). Not made false.
- `README.md:56` ("except an `add` of work a finding of a running plan names"). Not made false.
- `docs/roadmap.md:24` (the Goal, "`/roadmap add` adds only work a ruling of the user or a finding of a running plan names"). Not made false.
- `skills/diagnose/SKILL.md:58` and `skills/diagnose/templates/diagnosis.md:3` ("appended ... under its own heading, which names its finding"). Not made false. The new sub-bullet 3 relies on this text, and section 8 covers that.
- `skills/ordo-help/SKILL.md:73` ("round <n> Spec 1 names a finding of the run over repair round <n>").

Second command: `grep -rn -i 'heading and number\|heading and a number\|heading and its number\|its heading and\|by its number' skills docs README.md`. It also printed:
- `skills/diagnose/SKILL.md:45` ("For a finding written as a heading and a number, the refuter report ...: the finding of that name in the first run, before any heading "Repair round <n>, refuted".")
- `skills/diagnose/SKILL.md:46` ("For a finding written `round <n>` and a heading and a number, the finding of that name under the heading "Repair round <n>, refuted" of the same report.")
- `skills/refute/templates/report.md:16` ("<the finding, as heading and number>")

The change makes none of these false. But `diagnose` "What it reads" 5 and `ordo-help` already have a form that names a refuter-report finding, and that form tells a finding of a run over a repair round apart (`round <n>`). The new `roadmap` form has nothing equivalent. The brief's "What is on the tree" does not cite this existing form.

Findings:
- N1. The brief does not name `diagnose` "What it reads" 5 (`skills/diagnose/SKILL.md:45-46`) or `skills/ordo-help/SKILL.md:73`. They are the tree's existing form for naming a refuter-report finding, `round <n>` included. Without them the four sub-bullets name a round finding in a form that differs from `diagnose`'s, and that cannot single it out (see 5 and 8).

## 2. The step line

- "names the finding of a quoted ruling ending "(self-rule)" by its report's path and the heading it stands under": item 1, sub-bullet 1.
- "with its number there only where the report numbers its findings under that heading (a refuter report, a brief-check report)": item 1, sub-bullet 2.
- "and by the heading alone for a diagnosis record or a landing report": item 1, sub-bullet 3.
- "`/roadmap` checking the finding under that heading": item 1, sub-bullet 4.
- Check: "the sub-bullet and `/roadmap`'s check read in place against Open item O (a)": Cases 1 to 6 and Verify 2.
- Check: "the plan-terms and glossary entries that state the form read with them": item 2.
- "(1 commit)": a single path in the repository plus the report.

Findings: none.

## 3. Premises

Every command of "What is on the tree", rerun on b1af081:

- P1. `grep -n 'names its finding\|finds the finding there' skills/roadmap/SKILL.md` printed `56: ... the heading the finding stands under and its number there.` and `57: ... /roadmap reads that report and finds the finding there.` This matches the brief.
- P2. `grep -n '^#' skills/diagnose/templates/diagnosis.md` printed `1:# Diagnosis: <the symptom in a few words>`, then Symptom, Where the probes run, Red command, No red command, Shrunk case, Hypotheses, Probes, Cause, Fix and test, Cleanup. This matches, with one detail the brief leaves out: the record's title heading names the symptom. `skills/diagnose/SKILL.md:58` gives "under its own heading, which names its finding" only for a later diagnosis appended to the record.
- P3. `ls skills/land/templates` printed `checks.sh checks.test.sh land.sh land.test.sh`, which matches. `grep -n '^#'` on the two landing reports printed a "## What was found" heading in each, which matches. The brief also says "The reports on the tree hold their findings as bullets under "What was found"", and that is only partly true:
  - `.scratch/2-f-diagnose/agents/reviews/1-landing.md`, "What was found", is a paragraph ("The first review's findings were sent in repair round 1. The run over the round found 14, ...").
  - A loop over every `*-landing.md` (`grep -c '^## What was found'`) prints 0 for many reports, among them `.scratch/2-e-a-self-rule/agents/reviews/1-landing.md`, `2-landing.md` and `3-landing.md`, and `.scratch/2-f-diagnose/agents/reviews/2-landing.md`.
  - `3-landing.md` has only its title heading (`grep -n '^#'` printed `1:# Step 3 landing report`).
  - `12-landing.md`, "What was found", holds six top-level bullets. Several of them are separate findings.
- P4. `grep -n -o 'Spec [0-9]\|finding [0-9]' .scratch/2-e-a-self-rule/plan.md` printed hits at 169, 228, 235, 236, 242, 254, 255, 256, 261, 275, 298, 325, 386 (`finding 4`, `finding 3`) and 394. This matches.
- P5. `grep -n -i 'number there\|heading the finding\|names its finding' skills/repo-setup/templates/plan-terms.md docs/glossary.md` printed nothing (exit 1). This matches.
- P6. `grep -n 'What it reads" 6' skills/plan-orchestration/references/self-rule.md` printed line 29. This matches.
- P7. `git show 3659816:skills/roadmap/SKILL.md | grep -m1 version:` printed `  version: "1.2.0"`, and on main `  version: "1.3.0"`. This matches.
- The ADR 0004 sentence and the Open item O (a) bullet match `docs/adr/0004-...md`, Decision, and `plan.md` Rulings.

Findings:
- P-a. The landing-report premise overstates the tree, as listed under P3. The ruled design does not depend on it. Case 4 does: its heading holds six findings (see 5).
- P-b. The version premise gives only "raises one part of its version once". That says nothing about which part. The reason the part stays minor is missing, and so is the base it is measured from:
  - The plan's base is 9fc91dc ("Open plan 2.E.A, self-rule"). 3659816 is step 12's preparation commit.
  - `git show 9fc91dc:skills/roadmap/SKILL.md | grep -c 'self-rule'` printed 0, and its version is "1.2.0".
  - At the plan's base, `/roadmap` accepted no "(self-rule)" bullet at all. So no run that worked before the plan is refused after 12b, and the change only accepts inputs that were refused before. That is the minor part under `docs/dev/skill-layout.md`, Frontmatter.
  - The conclusion "1.3.0" holds. The brief should state this reason and base so the builder and reviewer check the right comparison.
- P-c. Decision 1's fifth citation says `agents/reviews/12-refuter.md`, "Repair round 1, refuted", "gives that run's findings heading". That section has no findings heading. `grep -n '^#'` on it printed `196:## Repair round 1, refuted`, `200:### Reviewer A, Opus`, `349:#### 1. Spec` ... `377:#### 4. Behaviour`, `390:### Reviewer B, Sonnet`, `488:#### 1. Spec` ... `520:#### 4. Behaviour`. There is no `Findings` heading.

## 4. Cases and checks

- The cases are reading cases for a text step. `docs/dev/change-standard.md`, "The rules" 1, says a defect in text is fixed by reading with no test, so their form is consistent. Case 7 is a fact a grep computes, which is also consistent.
- Case 1 (`7-brief-check.md`, "4. Cases and checks", finding 4): consistent. Finding 4 there is "Case 15: "the finding's heading" names a part that refuter reports do not have ..." (the `sed` of that section shows a numbered list after "Findings:").
- Case 2 (`12-refuter.md`, "1. Spec", finding 1): the heading text "1. Spec" occurs three times in that file (lines 105, 349, 488). The case's expected result, "reads the first finding under "Spec"", does not say which one.
- Case 3 (`3-diagnosis.md`, the diagnosis's own heading): the record exists under the open plan 2.F (`find .scratch -name '*-diagnosis.md'` printed only `.scratch/2-f-diagnose/agents/reviews/3-diagnosis.md`). It holds one diagnosis. Its title is `# Step 3, the run of /diagnose on the both-folders defect of utils/pin.sh`, and its Cause sits at `92:### Cause` under `86:## The session's final message`.
- Case 4 (`12-landing.md`, "What was found"): that heading holds six bullets. "Reads the finding under that heading" does not single out one.
- Cases 5 and 6: consistent. Each is a control on which a ruling is refused.
- Case 7: consistent.

Findings:
- C1. No case covers a finding of a refuter report's run over a repair round. That is the one kind of refuter finding the new form cannot name uniquely, and Decision 1's fifth citation is about it. Two forms are on the tree:
  - `### Findings` under `## Repair round <n>, refuted`, as in `.scratch/2-e-a-self-rule/agents/reviews/6-refuter.md:144,231`.
  - Per-heading subsections, as in `11b-refuter.md`, which has `## 1. Spec` at 99 and `### 1. Spec` at 234, and `12-refuter.md`, which has three "1. Spec" headings.
  - Expected result: the bullet names the round as well (as `diagnose` "What it reads" 5 does with `round <n>`), and `/roadmap` reads that round's finding, never the first run's.
- C2. No case covers a diagnosis record holding two diagnoses, though that is the reason Decision 2 gives for its choice. No case covers a record's first diagnosis read against "the diagnosis's own heading, which names its finding" (see 8).
- C3. Case 2 and Case 4 name headings that do not single out one finding (the heading repeats, or the heading holds six findings). Each case's expected result is stated as if it did.
- C4 (minor). Case 1 gives the heading with its number prefix ("4. Cases and checks"). The dictated example in sub-bullet 2 gives it without one ("Spec" for `## 1. Spec`). The sub-bullets do not say which form the bullet uses.

## 5. The question

"The goal" here is the part of the plan's goal this step delivers: "`/roadmap add` adds only work ... a finding of a running plan names", with a finding of each of the four kinds of report named so that `/roadmap` can check it.

- Case 1: no. It names a heading that occurs once in its report, with a number.
- Case 2: yes. It passes by reading while `/roadmap`, given "12-refuter.md, 1. Spec, 1", could read the first-run finding, Reviewer A's round finding or Reviewer B's round finding.
  - A concrete failure: `11b-refuter.md` has a first-run "3. Standards" finding 1 (`skills/plan/SKILL.md:87`, the closing report) and a round "3. Standards" finding 1 (the report's "line 87" claim). These are different work.
  - A bullet meant for the round finding is checked against the first-run text, so the goal check fails, or it passes on the wrong finding.
- Case 3: yes. It passes by reading, but for a record's first diagnosis no heading "names its finding": the template's title names the symptom. For a record with a later diagnosis, "under that heading" of the title covers the whole file, since `diagnose` Steps 2 gives no level for the appended heading.
- Case 4: yes. It passes by reading while the heading holds six findings, so the named finding is not singled out and the goal check reads against all six.
- Case 5: no. It is a control that fails on a missing number.
- Case 6: no. It is a control for the archive.
- Case 7: no. It is a fact. The fact holds only for the reason under P-b.
- The step line's check ("read in place against Open item O (a)"): yes. The ruling's words never mention a repeated heading or a heading holding several findings. A reading against O (a) passes even though a round finding cannot be named uniquely.
- Item 1: yes, for the reasons under Cases 2 to 4.
- Item 2: yes.
  - It asks that a sentence the change makes false be "reported ... and not changed, since its path is not in this step's paths".
  - It could therefore pass with a false sentence left in the tree. That goes against `docs/dev/change-standard.md`, "The rules" 14 ("A sentence ... that the change makes false is a defect of the change"), and the rule that a step's path list is widened rather than the work deferred.
  - I read every hit under 1 and found none that the change makes false, so this does not bite on the current tree. The wording should still make such a sentence a hand-back to the orchestrator so the paths are widened in this step.
- Item 3: no. It is a fact.
- Verify 1 to 5: these are fact checks. Verify 2 passes on the words alone, which is right for dictated text. The judgment rests on the cases, and the cases have the gaps above.

Findings:
- Q1. Cases 2, 3 and 4, the step line's check and item 1 can pass with a finding named in a form `/roadmap` cannot single out:
  - a round finding of a refuter report, because headings repeat;
  - a landing report heading that holds several findings;
  - a record's first diagnosis, whose heading names a symptom.
- Q2. Item 2 can pass with a false sentence reported but left in the tree.

## 6. Implied inputs

This is a text step: one skill's text plus a report. Under `docs/dev/change-standard.md`, "The rules" 1, there is no test, and the "Implied inputs" check applies only to a code step.

Findings: none.

## 7. ADRs

Command: `ls docs/adr` (0001 to 0009, README.md, template.md). For each record I read `Status:` and its Decision section with `awk '/^## Decision/...'`. All are `Status: proposed`, and none is superseded.

- 0001, 0002, 0003 (the writing base, the prose standard over the academic sources, the draft reviewer): do not touch the step.
- 0004: touches the step. The sentence the step is under: "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)"." The brief names it. Its sentence "`/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)"" does not list `roadmap`, but it does not forbid what Open item E (a) added. The step does not contradict it.
- 0005 (the choices file), 0006 (agent ids and roles), 0007 (`repair_reviewer`), 0008 (the price table), 0009 (response bodies): do not touch the step.

Findings: none.

## 8. Dictated text

The brief dictates four lines (item 1). `grep -n 'names its finding by the path\|also gives the finding.s number\|the heading alone names the finding\|finds the finding under that heading, by its number' .scratch/2-e-a-self-rule/agents/briefs/12b.md` printed lines 29, 30, 31 and 32 (and line 9, the premise quoting the old text). `LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing (exit 1). Word counts: 36, 37, 31 and 25.

- Line 29: "Such a bullet names its finding by the path of its report under the plan's `agents/reviews/` (a refuter report, a brief-check report, a landing report or a diagnosis record) and the heading the finding stands under."
  - Holds against the standards pages. It is one rule in one sentence (`docs/dev/skill-layout.md`, "Lists and tables"). Its length matches the 40-word line it replaces, and the four report kinds need it (prose standard, E, sentence length). Its terms are glossary terms (**refuter report**, **brief check**, **diagnosis record**).
  - It does not read correctly where the heading's text occurs more than once in the report. That happens in every refuter report with a per-heading run over a round (`11b-refuter.md` 99/234; `12-refuter.md` 105/349/488) and in a report with two `### Findings` sections.
- Line 30: "For a refuter report or a brief-check report, the bullet also gives the finding's number: its place, counted from 1, in the list of findings under that heading, as "Spec 1" names the first finding under "Spec"."
  - Holds against the prose standard and the layout page. The definition of the number is a qualifier kept in the rule's bullet, as "Lists and tables" asks.
  - Two problems. The example's heading "Spec" is not the template's heading text "1. Spec" (`skills/refute/templates/report.md`), while Case 1 uses the prefixed form. And for a run over a repair round, "that heading" does not single out the list: the template's `### Findings` holds findings of all four headings, each "under the heading it belongs to", and a reader of the example "Spec 1" would name a round's first Spec finding exactly as the first run's.
- Line 31: "For a diagnosis record or a landing report, the heading alone names the finding: the diagnosis's own heading, which names its finding, or the landing report's heading the finding stands under."
  - The relative clause "which names its finding" restates `diagnose` Steps 2. That text gives the clause only for a later, appended diagnosis. A record's first diagnosis has the title `# Diagnosis: <the symptom in a few words>` (`skills/diagnose/templates/diagnosis.md:1`), which names the symptom. So the sentence is false for the first or only diagnosis of a record, which is the only case on the tree (`.scratch/2-f-diagnose/agents/reviews/3-diagnosis.md`, title "Step 3, the run of `/diagnose` on the both-folders defect of `utils/pin.sh`").
  - "the diagnosis's own heading" is therefore well defined only for an appended diagnosis. For the first, a reader has to infer the record's title.
  - The second alternative, "the landing report's heading the finding stands under", repeats line 29 and changes nothing a reader does (`docs/dev/skill-layout.md`, "Writing for an agent", fourth bullet).
  - "the heading alone names the finding" is false for a landing-report heading that holds several findings (`12-landing.md`, "What was found", six bullets).
  - The use of **finding** for an item of a landing report holds, under the glossary entry's "closed ... at landing".
- Line 32: "`/roadmap` reads that report and finds the finding under that heading, by its number when the report is a refuter report or a brief-check report."
  - Holds against the standards pages.

Whether the four lines carry out Open item O (a) as ruled and keep the rules of the two lines they replace:
- O (a): path and heading (line 29); the number for a refuter or brief-check report (line 30); the heading alone for a diagnosis record or a landing report (line 31); `/roadmap` checking under that heading (line 32). Each part is carried.
- Rules kept (`docs/dev/change-standard.md`, "The rules" 17): the path under `agents/reviews/`, the four report kinds, the heading, the number where the ruling keeps it, and "reads that report and finds the finding". Each is kept. The one change of meaning, dropping the number for diagnosis records and landing reports, is the one O (a) asks for. The sub-bullets that follow ("checks that the plan is open", the goal check, "A check that fails leaves no ruling.", "The skill says which check failed.") stay, as item 1 says.

Findings:
- D1. Lines 29 to 32 cannot name a finding of a refuter report's run over a repair round uniquely, in either form on the tree. Suggested wording for the orchestrator to judge: a sub-bullet after line 30 reading "For a finding of a run over a repair round, the bullet also names that run's heading "Repair round <n>, refuted", and the reviewer's heading under it where the run holds one section per reviewer, as the `diagnose` skill's "What it reads" 5 names such a finding."
- D2. Line 31's "which names its finding" is false for a record's first diagnosis, and "the heading alone names the finding" is false for a landing-report heading holding several findings. Suggested wording: "For a diagnosis record or a landing report, the heading alone names the finding, and the text under it is the finding's text: for a diagnosis record, the record's title for its first diagnosis or the heading a later diagnosis is appended under." This drops the repeated landing alternative.
- D3 (minor). The example in line 30 uses "Spec" where the template's heading is "1. Spec", and Case 1 uses the prefixed form. The line should say which form the bullet gives, or the example should use "1. Spec".

## Declined to judge

- Decision 2 departs from the text of option (a) as raised under step 12's Step 0 ("the heading alone for a diagnosis record (its "Cause" section)"). The Rulings bullet for Open item O does not carry "Cause". On reading, the brief's reason holds: two diagnoses in one record give two "Cause" sections, and the record on the tree has its Cause at `### Cause` under another heading. Whether this departure from the option the user picked counts as a reversal (kind 3) or is closed under self-rule is the orchestrator's call under `references/self-rule.md`, or the user's. No record on the tree holds two diagnoses (`find .scratch -name '*-diagnosis.md'` printed one file).
- Whether a landing report's findings should be numbered like a brief-check report's, since its bullets under "What was found" could be counted the same way, was ruled by O (a) and is the user's.
- Verify 1 (`checks.sh` over the 11-command verify list) was not rerun. Its test suites write scratch repositories, and this check is limited to reads. I confirmed that the state file's `verify:` list holds 11 commands (`sed -n 6,22p orchestrator-state.md`), and the state file records step 12's run on main as `checks: 11 commands passed`.

Usage: aec3edbb8b9d18992, claude-opus-5-5 (ordo-high), 163475 tokens, 46 tool uses, 7 min 27 s.

## Closed

- N1, C1, D1, P-c: a finding of a run over a repair round. The brief's "What is on the tree" names `diagnose` "What it reads" 5 and `ordo-help`'s form, item 1 gains the sub-bullet that gives `round <n>` and the reviewer's section heading, the last sub-bullet reads the finding "in the first run or in the run of `round <n>`", Decision 3 records the choice, Decision 1's fifth citation is a real round finding of `11b-refuter.md`, and cases 3 and 4 cover a round finding and a reviewer's section.
- D2, C2: the diagnosis record's heading. The sub-bullet now says the heading is the record's title for its first diagnosis or the heading a later diagnosis is appended under, and drops the repeated landing-report alternative; the diagnosis premise names the title; Decision 2 says the finding's text is the whole text under the heading; cases 5 and 6 cover the first and a later diagnosis.
- C3, P-a: a heading that holds several findings. The landing premise states the shapes on the tree; item 1 says the goal check reads the whole text under the heading of a diagnosis record or a landing report; case 7 says so for `12-landing.md`; case 2 names the first run, before any "Repair round <n>, refuted".
- D3, C4: the heading as written. The first sub-bullet says the heading is "written as the report writes it", the example in the second reads "1. Spec", and Decision 4 records the choice.
- P-b: the version. The premise names the plan's base 9fc91dc and the reason the part is the minor.
- Q1: closed with N1, D2 and C3 above.
- Q2: item 2 makes a sentence the change makes false a hand-back, so the orchestrator widens the paths in this step.
- Declined to judge, Decision 2 against the option text naming "Cause": the ruled bullet in `plan.md`'s Rulings names "the heading alone" and the brief follows it; this is the ruling as booked, not a reversal, and needs no open item.
- The installed `spec` skill pinned at v2.7.0 has no "Dictated text" check; the agent ran section 8 from main's template, which is the text this plan writes. The pin moves to `v2.8.0-rc.1` at step 9 under ruling I.
