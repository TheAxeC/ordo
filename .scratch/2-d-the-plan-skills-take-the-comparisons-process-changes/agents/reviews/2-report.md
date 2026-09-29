# Step 2 builder report (on .agents/worktrees/2d-2, base 544c204)

Everything in the brief is done.

## Open items of the state file (verbatim)

- A (2026-09-29, step 1): what "one trigger per case" means in `docs/dev/skill-layout.md`, Frontmatter. The ruling says "a description is a trigger (front-load the leading word, one trigger per case)". Step 1 wrote "`Triggers on:` lists one phrase for each case the skill is for.", and `/spec`'s description keeps four phrases for its one case (`spec <entry> <step>, brief <step>, prepare step <n>, write the brief`). Options: (a) each case the skill is for has at least one trigger phrase, and several phrasings of one case are allowed; the page sentence says so; pro: every case is covered and a request worded differently still matches; con: longer lists, and the line between a case and a phrasing is judged by reading. (b) exactly one phrase per case; `/spec` keeps one of its four and the other skills are brought in line by roadmap entry 23; pro: short lists; con: a request worded as "write the brief" or "prepare step 3" no longer matches its phrase. Recommendation: (a), since the purpose of the trigger list is that each case is found, and the other phrasings are how a request worded differently is found. (a) is also the cheaper option, since no description changes; it is recommended for the matching, not the cost.

## First run of the Cases, on the unchanged tree

- Case 1, the gate's length command: it printed `775 skills/refute/SKILL.md` (the other nine: 726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 386 plan, 630 repo-setup, 647 roadmap, 999 spec).
- Case 2, the ruled terms: `grep -n -i` of "violated", "not applicable", "partial", "unmet", "not verifiable", "failure scenario", "Declined to judge" and "invokes no skill" over `skills/refute/SKILL.md` and `skills/refute/templates/report.md` printed nothing. "holds" and "met" matched only other words ("the configuration block holds", "metadata", "costs something").
- Case 3, `agents/reviews/1-refuter.md` read against the fourth bullet of "Grouping" as it stood: the bullet keeps Spec 1 to 4, Proof "None." (then set aside as "no defect"), Standards 1 to 3, Behaviour "None." (set aside as "no defect"), and in the round the paragraph under "Round items", Proof 1 and Standards 1; it sets aside the Verification fence, both "Not checked" lists and the Closed list. The report has no Verdicts or Declined to judge list: `grep -n '^#'` on it prints Verification, 1. Spec, 2. Proof, 3. Standards, 4. Behaviour, Not checked, Repair round 1, refuted, Round items, Spec, Proof, Standards, Behaviour, Not checked, Closed.

No case showed a rule of the brief wrong.

## The case 3 instrument

The brief says case 3 is a refuter report "in the new form" and names `agents/reviews/1-refuter.md` for it. That report is in the old form (its headings above), so it tests the bullet on an archived report only. The new form was read from the new `templates/report.md`, whose headings are, by `grep -n '^#' skills/refute/templates/report.md`: Verification, Verdicts, 1. Spec, 2. Proof, 3. Standards, 4. Behaviour, Declined to judge, Repair round <n>, refuted, Verdicts (level 3), Findings (level 3), Closed. Both readings are in the verdicts table below.

## The new and changed text, old beside new

### `skills/refute/SKILL.md`, description (item 6)

Old:

> Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding (a count, a path or a measurement only when a decision rests on it), and writes a report under four headings (spec, proof, standards, behaviour). Run once per step before its first repair round. Run again over each repair round when the configuration block says refute_after_repair: yes, up to repair_rounds. One more round is allowed only for a red verification command or an unbuilt acceptance item whose fix is too large for landing. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter.

New:

> Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding (a count, a path or a measurement only when a decision rests on it), and writes a report that gives a verdict per item of the brief and per case (holds, violated or not applicable; met, partial, unmet or not verifiable) and findings under four headings (spec, proof, standards, behaviour), each with its failure scenario. Run once per step before its first repair round. Run again over each repair round when the configuration block says refute_after_repair: yes, up to repair_rounds. One more round is allowed only for a red verification command or an unbuilt acceptance item whose fix is too large for landing. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter.

`metadata.version`: old "1.6.0", new "1.7.0".

### `skills/refute/SKILL.md`, the introduction paragraph (judgment call 1)

Old:

> `/refute <entry> <step>` dispatches one reviewer, who changes nothing. The reviewer does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`, a list of findings each with its place (a file and a line in code, a page and its section in a page), or "none" under a heading. The orchestrator or the session saves it, and the next resume point commits it.

New:

> `/refute <entry> <step>` dispatches one reviewer, who changes nothing. The reviewer does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`: a verdict per item of the brief and per case, and a list of findings each with its place (a file and a line in code, a page and its section in a page) and its failure scenario, or "none" under a heading. The orchestrator or the session saves it, and the next resume point commits it.

### `skills/refute/SKILL.md`, Quick start (judgment call 1)

Old:

```
/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns every check and every quoted command, and writes findings
```

New:

```
/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns every check and every quoted command, and writes verdicts and findings
```

### `skills/refute/SKILL.md`, Steps 5 (item 2)

Old:

> 5. The reviewer looks for the findings "The four headings" lists.

New:

> 5. The reviewer looks for the findings "The four headings" lists and gives the verdicts "The verdicts" lists, until every item of the brief's "What to build" and every case of its "Cases" has a verdict.

### `skills/refute/SKILL.md`, Steps 6 (items 2, 3 and 4)

Old:

```
6. The reviewer writes the report from `templates/report.md`.
   - The verification lines first, verbatim.
   - Then the four headings, each with findings (the place: a file and a line in code, a page and its section in a page; the quoted hunk; what is wrong) or "none".
   - Then what was not checked within the time box, named.
   - Then the reviewer's usage.
```

New:

```
6. The reviewer writes the report from `templates/report.md`.
   - The verification lines first, verbatim.
   - Then the verdicts, as "The verdicts" says: one per item of the brief's "What to build", then one per case of its "Cases".
   - Then the four headings, each with findings, or "none", and each finding with its place (a file and a line in code, a page and its section in a page), the quoted hunk, what is wrong and its failure scenario, as "The four headings" says.
   - Then "Declined to judge": each point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle, with the reason.
   - Then the reviewer's usage.
```

### `skills/refute/SKILL.md`, "The four headings", new last bullet (item 3)

Old: none; the section ended on the Behaviour bullet.

New:

> - Each finding, under any of the four headings, carries its failure scenario: the concrete input or state and the wrong result it gives, or, for a finding in text, the reader and what the text leads them to do wrong.

### `skills/refute/SKILL.md`, new section "The verdicts", after "The four headings" (item 2)

Old: none.

New:

```
## The verdicts

- **Items.** One verdict per item of the brief's "What to build", in the brief's numbering:
  - holds: the diff does what the item's text says, with the evidence named;
  - violated: the diff does not do what the item's text says, with the finding under its heading named;
  - not applicable: the item does not apply to this tree, with the reason.
- **Cases.** One verdict per case of the brief's "Cases":
  - met: the test or the reading gives the expected result;
  - partial: the test or the reading gives part of the expected result, with the missing part named;
  - unmet: the test or the reading does not give the expected result;
  - not verifiable: neither a test nor a reading can settle the case here, with what would settle it.
- A verdict of violated, partial or unmet always has a finding under one of "The four headings", and the verdict and the finding name each other.
- Over a repair round, the reviewer gives the verdicts again for the whole diff since the base.
```

### `skills/refute/SKILL.md`, Anti-patterns row "An unchecked point" (item 4)

Old:

> | An unchecked point reported as a finding or as a pass | The report then claims what nobody checked | Steps 6 |

New:

> | An unchecked point reported as a finding or as a pass | The report then claims what nobody checked | Name it under "Declined to judge" with the reason, as Steps 6 says |

### `skills/refute/SKILL.md`, Rules, new third bullet (item 1)

Old: none.

New:

> - The reviewer invokes no skill and starts no agent: it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself.

### `skills/refute/templates/report.md` (item 5)

Old, lines 11 to 40:

```
## 1. Spec

- <file:line, or page and section>: <what is there>, <what the brief asked for>. Or: none.

## 2. Proof

- <file:line, or page and section>: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>. Or: none.

## 3. Standards

- <file:line, or page and section>: <the rule broken, with the standard's file and rule>. Or: none.

## 4. Behaviour

- <what a host or a user sees change>, <where the report should have stated it>. Or: none.

## Not checked

- <a point the time box left, named>. Or: nothing.

Reviewer usage: <tokens>, <tool uses>, <minutes>.

## Repair round <n>, refuted (one section per run after a round, when the configuration block says refute_after_repair: yes)

    <each verification command rerun over the repaired tree, and its summary line, verbatim>

- <file:line, or page and section>: <the closure claimed>, <what the rerun or the read showed>; under the heading it belongs to (spec, proof, standards, behaviour). Or: none.
```

New, lines 11 to 56:

```
## Verdicts

Items of the brief's "What to build", in its numbering:

- <n>: holds, <the evidence>; or violated, <the finding, as heading and number>; or not applicable, <the reason>.

Cases of the brief's "Cases":

- <the case>: met, <the test or the reading that gives the expected result>; or partial, <the missing part>, <the finding>; or unmet, <the finding>; or not verifiable, <what would settle it>.

## 1. Spec

- <file:line, or page and section>: <what is there>, <what the brief asked for>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 2. Proof

- <file:line, or page and section>: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 3. Standards

- <file:line, or page and section>: <the rule broken, with the standard's file and rule>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 4. Behaviour

- <what a host or a user sees change>, <where the report should have stated it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## Declined to judge

- <a point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.

Reviewer usage: <tokens>, <tool uses>, <minutes>.

## Repair round <n>, refuted (one section per run after a round, when the configuration block says refute_after_repair: yes)

    <each verification command rerun over the repaired tree, and its summary line, verbatim>

### Verdicts

- <n>, and <the case>: the verdicts again for the whole diff since the base, in the form of "Verdicts" above.

### Findings

- <file:line, or page and section>: <the closure claimed>, <what the rerun or the read showed>; under the heading it belongs to (spec, proof, standards, behaviour); failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
```

(The fenced verification placeholder of the round is shown indented here so this report's own fences stay closed; in the file it is a fenced block, unchanged.)

### `skills/plan-retro/SKILL.md`, "Grouping", fourth bullet (item 7)

Old:

> - The session keeps as a finding, whatever its text says, every top-level item under a Spec, Proof, Standards or Behaviour heading and every item of a repair round outside the parts it does not read: the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour, the Verification, Not checked, Closed, Closures and Usage lists, and fenced lines.

New:

> - The session keeps as a finding, whatever its text says, every top-level item under a Spec, Proof, Standards or Behaviour heading and every item of a repair round outside the parts it does not read: the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour, the Verification, Verdicts, Declined to judge, Not checked, Closed, Closures and Usage lists, and fenced lines.

`metadata.version`: old "1.2.0", new "1.2.1".

## DONE / NOT DONE

| # | Item | State | Proof |
|---|---|---|---|
| 1 | Rules bullet: no skill, no agent | DONE | `grep -n 'invokes no skill and starts no agent' skills/refute/SKILL.md` prints `160:- The reviewer invokes no skill and starts no agent: ...` |
| 2 | "The verdicts" after "The four headings"; Steps 5 and 6 point at it | DONE | `grep -n '^## ' skills/refute/SKILL.md` puts `## The four headings` at 83 and `## The verdicts` at 115; Steps 5 at line 53 and Steps 6 at line 56 name "The verdicts" |
| 3 | Failure scenario in "The four headings" | DONE | line 113, quoted above |
| 4 | "Declined to judge" in Steps 6 and the Anti-patterns row | DONE | `grep -n 'Declined to judge' skills/refute/SKILL.md` prints lines 58 and 154; `grep -n -i 'not checked' skills/refute/SKILL.md skills/refute/templates/report.md` prints nothing |
| 5 | Template: Verdicts, failure scenario on every finding line, Declined to judge, round verdicts | DONE | `grep -n '^#' skills/refute/templates/report.md` (headings listed under "The case 3 instrument"); `grep -c 'failure scenario:' skills/refute/templates/report.md` counts the five finding lines, 24, 28, 32, 36 and 56 |
| 6 | Description names the verdicts, at most 1,024; version 1.7.0 | DONE | the length command prints `951 skills/refute/SKILL.md`; `version: "1.7.0"` |
| 7 | plan-retro fourth bullet; version up one patch | DONE | the bullet quoted above; `version: "1.2.1"` |
| V1 | checks.sh on the worktree | DONE | output below, exit 0 |
| V2 | The gate's length command | DONE | output below |
| V3 | `LC_ALL=C grep -n '[^ -~]'` over the changed files | DONE | prints nothing, exit 1 |

### Verdicts on the Cases, after the change

- Case 1: met. The length command prints `951 skills/refute/SKILL.md`, at most 1,024; it printed 775 on the unchanged tree.
- Case 2: met. `grep -n` over `skills/refute/SKILL.md` and `skills/refute/templates/report.md` finds: "holds" at SKILL.md 3 and 118, report.md 16; "violated" at SKILL.md 3, 119 and 126, report.md 16; "not applicable" at SKILL.md 3 and 120, report.md 16; "met" as a verdict at SKILL.md 3 ("met, partial") and 122 ("met:"), report.md 20; "partial" at SKILL.md 3, 123 and 126, report.md 20; "unmet" at SKILL.md 3, 124 and 126, report.md 20; "not verifiable" at SKILL.md 3 and 125, report.md 20; "failure scenario" at SKILL.md 3, 10, 57 and 113, report.md 24, 28, 32, 36 and 56; "Declined to judge" at SKILL.md 58 and 154, report.md 38; "invokes no skill and starts no agent" at SKILL.md 160.
- Case 3: met, read over two reports. Over the new template: the bullet keeps the items under 1. Spec to 4. Behaviour and under the round's "Findings"; it sets aside the Verdicts list, the Declined to judge list, the Verification fence, the usage lines, the round's Verdicts list and fence, and the Closed list. Over `agents/reviews/1-refuter.md` (old form): it keeps and sets aside exactly what the first run lists, since "Not checked" stays in the bullet.

### Command output

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`, from the worktree root, exit 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

The gate's length command, `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'`:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
386 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
647 skills/roadmap/SKILL.md
999 skills/spec/SKILL.md
```

`LC_ALL=C grep -n '[^ -~]' skills/refute/SKILL.md skills/refute/templates/report.md skills/plan-retro/SKILL.md`: no output, exit 1. `git diff -U0 | grep '^+' | grep -n '[^ |] - \|--\|[^ -~]'` (spaced dashes and non-ASCII in added lines): no output, exit 1.

### Line counts

`wc -l` and `git diff --numstat`:

| File | Lines, base | Lines, now | Added | Removed |
|---|---|---|---|---|
| `skills/refute/SKILL.md` | 145 | 162 | 25 | 8 |
| `skills/refute/templates/report.md` | 46 | 62 | 23 | 7 |
| `skills/plan-retro/SKILL.md` | 113 | 113 | 2 | 2 |

`git status --short` shows only these three files, and this report.

## Judgment calls

1. Two sentences of `skills/refute/SKILL.md` outside the lines the items name, changed because the change made them incomplete about the whole report (change standard rules 14 and 19): the introduction paragraph ("a list of findings each with its place") and the Quick start line ("writes findings"). Both now name the verdicts; the introduction also names the failure scenario. They serve items 2, 3 and 6. Both old and new texts are quoted above.
2. Steps 6's finding bullet: the parts of a finding were written as a parenthesis with semicolons; the new text lists them in one sentence with the failure scenario added, to keep the semicolon count of running prose from rising (prose standard, "B. Punctuation"). It serves item 3.
3. The template's finding lines carry `verdict: <...>` beside `failure scenario: <...>`, so a finding names its verdict as "The verdicts" third bullet requires (item 2). The brief names only the failure scenario for these lines.
4. The template's repair round section holds its verdicts under a level-3 heading "Verdicts" and its finding lines under a level-3 heading "Findings". With a heading only above the verdicts, the finding lines after it would sit under "Verdicts" and `/plan-retro`'s bullet would set them aside. Item 5 names no shape for this.
5. `/plan-retro`'s bullet keeps its clause "the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour". Item 7 lists only the named lists; dropping the clause would change a rule the brief does not ask to change (change standard rule 17).
6. The Rules bullet on skills and agents names what the reviewer does in the same bullet, as "Writing for an agent" first bullet asks of a prohibition.
7. The repair round Steps of `/refute` ("Over a repair round") are unchanged. The rule that the verdicts are given again over a round is written once, in "The verdicts" as item 2 places it, and Steps 6 of that list ("in the same shape") and the template's round section carry it to the reader of the round.

## Anything in the brief that turned out wrong

- Case 3 names `agents/reviews/1-refuter.md` as a report in the new form; it is in the old form (headings under "First run"). The case was read over that report and over the new template, as "The case 3 instrument" says.
- Every premise of "What is on the tree" reproduced: 145 lines and version 1.6.0 (`wc -l`, the frontmatter); no rule on skills or agents in the refute skill (grep above); the template's headings (`grep -n '^#'`); 775 characters; the fourth bullet as quoted; `git grep -n -i 'four headings\|Spec, Proof\|Not checked' -- skills/land skills/plan-orchestration` prints nothing.

## User-visible changes

| Surface | Before | After |
|---|---|---|
| The refuter report | Verification, four headings of findings (place, hunk, what is wrong), "Not checked" (points the time box left), usage, repair rounds as one list of closures | Verification, "Verdicts" (one per item of "What to build": holds / violated / not applicable; one per case: met / partial / unmet / not verifiable), four headings whose findings carry a failure scenario and the verdict they make, "Declined to judge" (points not checked or declined, each with its reason), usage, repair rounds with their own Verdicts and Findings |
| The reviewer | No rule on invoking a skill or starting an agent | Invokes no skill and starts no agent |
| `/refute`'s description and Quick start | "writes a report under four headings", "writes findings" | names the verdicts and the failure scenario; "writes verdicts and findings" |
| `/plan-retro` | Sets aside Verification, Not checked, Closed, Closures and Usage lists | Also sets aside Verdicts and Declined to judge lists |
| Versions | refute 1.6.0, plan-retro 1.2.0 | refute 1.7.0, plan-retro 1.2.1 |

## Doc text

Found by `git grep -n -i 'not checked\|four headings\|declined to judge\|failure scenario\|verdicts\|under four\|### Findings\|refuter report\|refute_after\|time box' -- docs skills README.md CLAUDE.md utils` and `git grep -n -i 'refute' -- README.md docs skills/plan-help skills/land/SKILL.md skills/plan-orchestration/SKILL.md`. No sentence outside the three changed files is made false. Three sentences describe what `/refute` writes as "findings" only, now incomplete:

- `README.md:18`: "| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes findings |". Replacement: "| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes a verdict per item of the brief and per case, and findings each with its failure scenario |".
- `README.md:35`: "/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings". Replacement: "/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings".
- `skills/plan-help/SKILL.md:57`: "/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings". Replacement: "/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings", with `plan-help`'s `metadata.version` up one patch.

The other hits hold after the change: `skills/plan-retro/SKILL.md:37` reads the findings "under its Spec, Proof, Standards and Behaviour headings, and each section Repair round <n>, refuted", which the template still has; `skills/land/SKILL.md:173` names only the Closed heading, which is unchanged; `docs/roadmap.md:22`, `:23` and `:162` to `:164` describe the verdict form this step writes; `skills/refute/SKILL.md:162` (the time box, "naming what was not") names what goes under "Declined to judge".

## Repair round 1

Every item of `agents/briefs/2-round-1.md` that was sent is done. Items 4 and 5 were not sent (4 is applied by the orchestrator at landing from "Doc text"; 5 is no change).

### Item 1, Steps 6 and the template state one list of a finding's parts

Steps 6, fourth bullet, old:

> - Then the four headings, each with findings, or "none", and each finding with its place (a file and a line in code, a page and its section in a page), the quoted hunk, what is wrong and its failure scenario, as "The four headings" says.

New (`skills/refute/SKILL.md:57`):

> - Then the four headings, each with findings, or "none", and each finding with its place (a file and a line in code, a page and its section in a page), the quoted hunk, what is wrong, its failure scenario as "The four headings" says, and the verdict it names when it has one, as "The verdicts" says.

The template's five finding lines, new (`skills/refute/templates/report.md` lines 24, 28, 32, 36 and 56); each gives the place, the quoted hunk, what is wrong, the failure scenario and the verdict, in the order Steps 6 lists them. Proof keeps its decision field and Standards its standard's file and rule; Behaviour gains the place and the hunk.

```
- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <what is there>, <what the brief asked for>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the rule broken, with the standard's file and rule>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <what a host or a user sees change>, <where the report should have stated it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the closure claimed>, <what the rerun or the read showed>; under the heading it belongs to (spec, proof, standards, behaviour); failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.
```

The old lines are quoted under "`skills/refute/templates/report.md` (item 5)" above. Command: `grep -c '"<the quoted hunk>"; what is wrong: ' skills/refute/templates/report.md` prints `5`; `grep -c 'failure scenario:' skills/refute/templates/report.md` prints `5`.

### Item 2, the Rules bullet split in two

Old (one bullet):

> - The reviewer invokes no skill and starts no agent: it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself.

New (`skills/refute/SKILL.md:160` and `:161`):

> - The reviewer invokes no skill: it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself.
> - The reviewer starts no agent: every read and every command of the review runs in the reviewer's own session.

Each bullet states its own alternative. Command: `grep -n 'invokes no skill\|starts no agent' skills/refute/SKILL.md` prints lines 160 and 161 as quoted.

### Item 3, "Declined to judge" in the repair round section

New, after `### Findings` in `skills/refute/templates/report.md`, in the form of the top-level one:

```
### Declined to judge

- <a point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.
```

Command: `grep -n '^#' skills/refute/templates/report.md` prints Verification 5, Verdicts 12, 1. Spec 22, 2. Proof 26, 3. Standards 30, 4. Behaviour 34, Declined to judge 38, Repair round 44, `### Verdicts` 50, `### Findings` 54, `### Declined to judge` 58, Closed 64.

Read against `/plan-retro`'s fourth bullet of "Grouping": that bullet sets aside "the Verification, Verdicts, Declined to judge, Not checked, Closed, Closures and Usage lists, and fenced lines" wherever they appear, and the bullet's "every item of a repair round outside the parts it does not read" makes the round's `### Declined to judge` list one of those parts. The round's findings under `### Findings` stay kept. No change to `/plan-retro` is needed.

### Checks after the round

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`, from the worktree root, exit 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

The gate's length command:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
386 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
647 skills/roadmap/SKILL.md
999 skills/spec/SKILL.md
```

`LC_ALL=C grep -n '[^ -~]' skills/refute/SKILL.md skills/refute/templates/report.md skills/plan-retro/SKILL.md`: no output, exit 1. `git diff -U0 | grep '^+' | grep -n '[^ |] - \|--\|[^ -~]'`: no output, exit 1.

### Line counts after the round

`wc -l` and `git diff --numstat` against the base 544c204:

| File | Lines, base | Lines, now | Added | Removed |
|---|---|---|---|---|
| `skills/refute/SKILL.md` | 145 | 163 | 26 | 8 |
| `skills/refute/templates/report.md` | 46 | 66 | 27 | 7 |
| `skills/plan-retro/SKILL.md` | 113 | 113 | 2 | 2 |

The line numbers quoted in the sections above the round for `skills/refute/SKILL.md` hold through line 159; the Rules bullets are at 160 and 161, and the time-box bullet moved from 162 to 163.
