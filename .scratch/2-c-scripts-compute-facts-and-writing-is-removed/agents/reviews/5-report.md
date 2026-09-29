# Step 5 report: the rules, scripts compute facts; judgment is read

Everything in the brief is done.

## Open items of the state file, verbatim

None.

## First run, on the unchanged tree (base 659c1ee)

- `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` (under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`) printed `PASS: sync_rules.py scratch tests`.
- The current ASCII command over a scratch file written by `printf 'ok\n\377\376bad\n'`, its path given by `printf '%s\0' <path> | xargs -0 perl -CSD -ne '... END { exit($bad ? 1 : 0) }'`, printed:

```
Malformed UTF-8 character: \xff\xfe\x62\x61\x64\x0a (too short; 6 bytes available, need 13) in pattern match (m//) at -e line 1, <> line 2.
Malformed UTF-8 character: \xff\xfe\x62\x61\x64\x0a (unexpected non-continuation byte 0xfe, immediately after start byte 0xff; need 13 bytes, got 1) in pattern match (m//) at -e line 1, <> line 2.
Malformed UTF-8 character (fatal) at -e line 1, <> line 2.
exit=0
```

- The current ASCII command over the unchanged tree (`git ls-files -coz --exclude-standard | xargs -0 perl ...`): no output, `exit=0`.
- No case was one the brief's rules got wrong.

## Old and new text, per item of "What to build"

### 1. The rule, stated once

New section in `docs/dev/change-standard.md` and in `skills/repo-setup/templates/docs/dev/change-standard.md`, placed after "Read before changing anything" and before "The rules", the same text in both:

```
## Scripts compute facts; judgment is read

Every rule on this page that names a script, a test or a check is read under this section.

- A script does only what has one correct answer that a machine computes exactly: moving files and commits, validating configuration keys, comparing two texts, counting, resolving an identifier such as a citation key or a DOI.
- Whether text is good, whether content is right, whether work is done, and anything a careful person could dispute is judged by reading, by the model or by the user.
- No script output stands in for that judgment, gates it, or is shown to the user as a finding.
- A script is never made more exact in the hope of reaching such a judgment. A wrong hit of a helper script is dropped, not raised as work.
- A new script needs the user's approval of what it computes before it is written.
- A test exists only for a script, and only for behaviour whose failure costs something: lost work, a broken installation, a wrong configuration accepted.
- A gate for a judgment is a review: the user's, or a blind comparison. "A script prints ok" is a gate only for a fact.
- A recurring finding is answered with a rule sentence or a change to the text that should have prevented it. A check is proposed only for a fact a machine computes, with the user's approval.
- What a skill or tool gives the user is written for a person to read, never in a machine's format.
```

New rule in `skills/repo-setup/templates/shared-rules.md`, placed after "A failing check is a finding" so that the last rule stays "No history in a rule file or a comment", which `docs/dev/change-standard.md` cites as the last rule:

```
- **Scripts compute facts; judgment is read.** A script does only what has one correct answer that a machine computes exactly: moving files and commits, validating configuration keys, comparing two texts, counting, resolving an identifier such as a citation key or a DOI. Whether text is good, whether content is right, whether work is done, and anything a careful person could dispute is judged by reading, by the model or by the user; no script output stands in for that judgment, gates it, or is shown to the user as a finding. A script is never made more exact in the hope of reaching such a judgment, and a wrong hit of a helper script is dropped, not raised as work. A new script needs the user's approval of what it computes before it is written. A test exists only for a script, and only for behaviour whose failure costs something: lost work, a broken installation, a wrong configuration accepted. A gate for a judgment is a review, the user's or a blind comparison; "a script prints ok" is a gate only for a fact. A recurring finding is answered with a rule sentence or a change to the text that should have prevented it, and a check is proposed only for a fact a machine computes, with the user's approval. What a skill or tool gives the user is written for a person to read, never in a machine's format.
```

Rules 1, 6, 13 and 15 cite the section by its name, "Scripts compute facts; judgment is read", and state none of its points again.

### 2. Rules rewritten under it, in both change standards (identical text in both)

Rule 1, old:

```
1. **A defect fix begins with a test that fails on the tree as it is.** Write the test, run it, see it fail for the reason the brief states, and only then change the code. The report quotes the failing check. A test written after the fix, or one that would have passed before it, is not a test of the defect.
```

Rule 1, new:

```
1. **A defect in a script begins with a test that fails on the tree as it is.** Write the test, run it, see it fail for the reason the brief states, and only then change the code. The report quotes the failing check. A test written after the fix, or one that would have passed before it, is not a test of the defect. A defect in text or in a judgment (a page, a rule, a skill's instructions, a brief) is fixed by reading, with no test, and the report quotes the text before and after, as "Scripts compute facts; judgment is read" says.
```

Rule 6, old (first sentence; the rest is unchanged):

```
6. **Verification is the whole tree, every suite, every check**, and the report gives the numbers seen, never the numbers expected.
```

Rule 6, new:

```
6. **Verification runs the verify list and every check, over the whole tree**, and the report gives the numbers seen, never the numbers expected. A check verifies a fact, never whether the work is right; whether the work is right is judged by the review, by reading, as "Scripts compute facts; judgment is read" says.
```

Rule 13, old (last sentence; the rest is unchanged, the revert proof included):

```
Every branch the change adds or changes, and every rule its head comment states, has a case, and the report lists them in a table: the branch or rule, the case, the revert and the red line it produced.
```

Rule 13, new:

```
Each behaviour the change adds or changes whose failure costs something, as "Scripts compute facts; judgment is read" says, has a case, and the report lists them in a table: the behaviour, the case, the revert and the red line it produced. The table covers those behaviours, not every branch or every rule a head comment states.
```

Rule 15, old:

```
15. **Edges are exercised, not assumed.** For a script, every form of input its own rules name is a case: each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code. Every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one; every concurrent path is exercised in flight, after teardown and superseded by a later one; a value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text.
```

Rule 15, new:

```
15. **Edges whose failure costs something are exercised, not assumed.** For a script, a form of input its own rules name is a case only when a wrong answer on it costs something, as "Scripts compute facts; judgment is read" says; the forms weighed are each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code. Under the same condition, every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one, and every concurrent path in flight, after teardown and superseded by a later one. A value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text, and each such place is a case.
```

`docs/dev/change-standard.md`, "Rules this repository already states", old:

```
- Each script under a skill's `templates/` or under `utils/` has a test beside it that runs on scratch repositories or scratch files (`docs/dev/building.md`).
```

New:

```
- Each script under a skill's `templates/` or under `utils/` has a test beside it for the behaviour whose failure costs something, run on scratch repositories or scratch files (`docs/dev/building.md`).
```

Citing a page by its section, new bullet in "Where the work happens" of both change standards:

```
- A ledger file cites a page (the rules page, a standard, a skill's text) by its section, never by a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`, and a brief's "Paths this step writes" keeps its line ranges, numbered as on main at the base.
```

The same in `skills/refute/templates/report.md`, new paragraph under the title:

```
A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.
```

### 3. `skills/plan-orchestration/SKILL.md`, "The recurring-findings pass"

Old:

```
- A cause that appears in three or more steps is booked in the open items, since the user rules on it, with the smallest change that would end it: a line in the rules file, a command in the verification list, or a test in the tree.
- For a rule already written that keeps being broken, what is proposed is a check, and a sharper sentence for the rule is proposed only when no command can check it.
```

New:

```
- A cause that appears in three or more steps is booked in the open items, since the user rules on it, with the smallest change that would end it: a rule sentence in the rules file, or a change to the text that should have prevented it (a brief's wording, a skill's step, a standards page).
- For a rule already written that keeps being broken, what is proposed is a sharper sentence for the rule or a change to the text that should have prevented it.
- A check (a command in the verification list, or a script) is proposed only for a fact a machine computes, after the rule sentence or the text change, and the proposal states what it computes, which the user approves before it is written.
```

Anti-patterns row, old:

```
| Rewriting a rule that keeps being broken when a command can check it | The same words fail the same way | Propose a check for it, which the user rules on, as "The recurring-findings pass" says |
```

New:

```
| Proposing a check for a recurring cause that is a matter of judgment | A script's output then stands in for a judgment that is made by reading | Propose a rule sentence or a change to the text that should have prevented it, and a check only for a fact a machine computes, as "The recurring-findings pass" says |
```

### 4. `skills/plan-retro/SKILL.md` and `templates/retro.md`

Description, old: `... propose the change that stops it at its source: a rule on the rules page, a page added to the standards the briefs point at, or a mechanical check.` New: `... propose the change that stops it at its source: a rule sentence on the rules page, a page added to the standards the briefs point at, or, for a fact a machine computes, a check the user approves.`

Introduction, old: `A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or a check nobody runs.` New: `A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or was given in words the builders misread, or, for a fact a machine computes, is a check nobody runs.`

"The proposal for a recurring kind", old:

```
The skill checks where the rule should have come from, in this order, and proposes the first change that applies:
...
3. **The rule is written where the briefs point, the defect still recurs, and a command can check the rule.** The proposal is that check: a grep over the diff, a lint rule or a script over the tree, with its command, the output it gives on the current tree, and the line to add to the verification page so every step runs it.
4. **The same, and no command can check the rule.** Only then is the proposal a sharper sentence for the existing rule.
   - It says why no command can check the rule.
   - It quotes the findings that show how builders read the current one.
```

New:

```
The skill checks where the rule should have come from, in this order, and proposes the first change of 1 to 3 that applies; a check is proposed only as 4 says:
...
3. **The rule is written where the briefs point, and the defect still recurs.** The proposal is a sharper sentence for the existing rule, or a change to the text that should have prevented the defect (a brief template, a skill's step).
   - It quotes the findings that show how builders read the current text.
4. **The rule is a fact a machine computes.** Only then may the proposal add a check beside the change of 3: a grep over the diff, a lint rule or a script over the tree.
   - It states what the check computes, its command, the output it gives on the current tree, and the line to add to the verification page so every step runs it.
   - The user approves what it computes before it is written.
   - A rule whose breach is judged by reading gets no check.
```

Steps 12 and 13, old: `12. Make the approved edits: the rules page, a standards page, `.agents/plan.yaml`, the verification page, a new check script.` / `13. Run each check proposal's command.` New: `12. Make the approved edits: the rules page, a standards page, the text that should have prevented the defect, `.agents/plan.yaml`, the verification page, and, for an approved check of a fact, its script.` / `13. Run each approved check's command.`

Anti-patterns row "A proposal that loosens a rule", Do instead, old: `Propose the rule, the page or the check, as "The proposal for a recurring kind" says`. New: `Propose the rule, the page, the sharper sentence or text change, or a check of a fact, as "The proposal for a recurring kind" says`.

`templates/retro.md`, old: `- Proposal: <the rule text and the page it goes into | the page added to standards | the check, its command and its output on the current tree>.` New: `- Proposal: <the rule text and the page it goes into | the page added to standards | the sharper sentence or the text change, and the file it goes into>; for a fact a machine computes, also <the check: what it computes, its command and its output on the current tree>.`

### 5. `skills/spec/templates/brief.md`, Cases paragraph

Old:

```
The builder's first task, before any code changes: turn every case above into a test of the step, run the tests against the unchanged tree, and note each case's result. No prototype script stands in for the tests.
```

New:

```
The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted. A case of a script step becomes a test of the step, run on the unchanged tree first; no prototype script stands in for the test. A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted.
```

The hand-back paragraph after it is unchanged.

### 6. `skills/refute/SKILL.md`, Proof heading

Old: `- **Proof.** A finding is:` and `  - a count, a path or a measurement in the report that the reviewer's own run does not reproduce;`

New: `- **Proof.** A test of behaviour whose failure costs nothing is not a Proof pass; it is a Standards finding, as the next heading says. A finding is:` and `  - a count, a path or a measurement in the report that the reviewer's own run does not reproduce, when a decision rests on it, and the finding names that decision;`

New last bullet under Standards: `  - a test of behaviour whose failure costs nothing (neither lost work, nor a broken installation, nor a wrong configuration accepted), under the rules file's rule that a test exists only for behaviour whose failure costs something.`

`templates/report.md`, Proof line, old: `- <file:line>: <the claim>, <what the rerun showed>. Or: none.` New: `- <file:line>: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>. Or: none.`

### 7. The ASCII check

In `docs/dev/building.md` line 12 and the command block of `docs/dev/change-standard.md`, the end of the command, old: `END { exit($bad ? 1 : 0) }'`; new: `END { $? ||= 1 if $bad }'`. The template change standard holds no command, only the placeholder `<each verification command from docs/dev/building.md, ...>` (`grep -n 'perl -CSD\|<each verification'` on it prints only that line), so it needs none.

In `END`, `$?` holds the status perl is about to exit with; the old `exit()` replaced a die's non-zero status with 0, and the new block keeps it and sets 1 only when a line was printed and the status was 0.

`docs/dev/building.md`, the paragraph on the ASCII check gains: `A file that is not valid UTF-8 stops it with perl's `Malformed UTF-8 character (fatal)` error and a non-zero exit status.`

### 8. `.gitignore`

Added after the `.agents/*` lines:

```
# Python bytecode that running a script under a skill or under utils/ leaves beside it.
__pycache__/
```

`git check-ignore -v --no-index skills/ordo-init/templates/__pycache__/check_config.cpython-312.pyc utils/__pycache__/x.pyc` printed `.gitignore:5:__pycache__/` for both paths, exit 0. `grep -n pycache skills/repo-setup/templates/gitignore/common.gitignore` printed `16:__pycache__/`, so the template needs nothing.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 The rule, once per page | DONE | `grep -n 'Scripts compute facts' docs/dev/change-standard.md skills/repo-setup/templates/docs/dev/change-standard.md skills/repo-setup/templates/shared-rules.md` printed `docs/dev/change-standard.md:11:## Scripts compute facts; judgment is read`, `skills/repo-setup/templates/docs/dev/change-standard.md:11:## Scripts compute facts; judgment is read`, `skills/repo-setup/templates/shared-rules.md:15:- **Scripts compute facts; judgment is read.** ...`, and the citations in rules 1, 6, 13 and 15 (lines 27, 32, 39, 41 of each change standard) |
| 2 Rules 1, 6, 13, 15, line 62, section citing | DONE | `git grep -n 'has a test beside it' -- ':!.scratch'` printed only `docs/dev/change-standard.md:77:- Each script under a skill's `templates/` or under `utils/` has a test beside it for the behaviour whose failure costs something, ...`; without the pathspec it also prints the ledger's own lines (the brief, `plan.md` and archived reports), which quote the old text |
| 3 Recurring-findings pass | DONE | `git diff skills/plan-orchestration/SKILL.md`, quoted above |
| 4 plan-retro and retro template | DONE | `git diff skills/plan-retro`, quoted above |
| 5 Brief template Cases | DONE | `git diff skills/spec/templates/brief.md`, quoted above |
| 6 Refute Proof heading | DONE | `git diff skills/refute`, quoted above |
| 7 ASCII check | DONE | the runs below |
| 8 `.gitignore` | DONE | `git check-ignore`, above |
| Sync case | DONE | `sh skills/repo-setup/templates/sync_rules.test.sh`, its last line `PASS: sync_rules.py scratch tests` |
| Non-ASCII in changed files | DONE | `for f in $(git diff --name-only); do LC_ALL=C grep -n '[^ -~]' $f; done` printed nothing; the same files at base held no such line either |

The verify list, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md` from the worktree root:

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
checks: 7 commands passed
exit=0
```

The state file still carries the old ASCII command; the orchestrator writes the new one on main (Doc text). The same runner over a scratch copy of the state file with only that command replaced (`sed 's/END { exit(\$bad ? 1 : 0) }/END { $? ||= 1 if $bad }/'`) printed `checks: 7 commands passed`.

The new ASCII command, run from the worktree root:

```
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '... END { $? ||= 1 if $bad }'
exit=0
```

(no output). Over the scratch file of `printf 'ok\n\377\376bad\n'`, given by `printf '%s\0' <path> | xargs -0 perl -CSD -ne '... END { $? ||= 1 if $bad }'`:

```
Malformed UTF-8 character: \xff\xfe\x62\x61\x64\x0a (too short; 6 bytes available, need 13) in pattern match (m//) at -e line 1, <> line 2.
Malformed UTF-8 character: \xff\xfe\x62\x61\x64\x0a (unexpected non-continuation byte 0xfe, immediately after start byte 0xff; need 13 bytes, got 1) in pattern match (m//) at -e line 1, <> line 2.
Malformed UTF-8 character (fatal) at -e line 1, <> line 2.
exit=1
```

perl alone on that file, stderr dropped, exited 25 (`echo "perl exit=$?"` printed `perl exit=25`); `xargs` turns that into 1. The control, a scratch file of `printf 'a\342\200\224b\n'` (an em dash) through the same command, printed `<path>:1: a<em dash>b` and `dash exit=1`, so a printed line still fails the check.

## Files changed

`git diff --numstat` (its tabs written as spaces):

```
2 0 .gitignore
2 2 docs/dev/building.md
21 6 docs/dev/change-standard.md
4 3 skills/plan-orchestration/SKILL.md
12 10 skills/plan-retro/SKILL.md
1 1 skills/plan-retro/templates/retro.md
7 6 skills/refute/SKILL.md
3 1 skills/refute/templates/report.md
19 4 skills/repo-setup/templates/docs/dev/change-standard.md
1 0 skills/repo-setup/templates/shared-rules.md
4 4 skills/spec/templates/brief.md
```

Plus this report. No skill's `metadata.version` was changed; the brief does not ask for it.

## Judgment calls

Each is a change inside a listed path that a brief item needs so that no two statements contradict (rule 19):

- Rule 15: the condition "costs something" also governs the id, key and concurrency cases, since the section says a test exists only for behaviour whose failure costs something; the untrusted-input sentence stays unconditional, as item 2 says.
- The section-citing bullet of the change standards keeps a brief's "Paths this step writes" line ranges, since `skills/spec/SKILL.md` line 95 (outside this step's paths) defines them as write ranges numbered at the base, not as citations.
- `skills/spec/templates/brief.md`: "What is on the tree" asks for "the line number in code or the section of a page", and "Read, with line ranges" became "Read, with sections or line ranges" with `<the section of a page, or the lines of code>`, so the template no longer asks a ledger file to cite a page by line.
- `skills/refute/SKILL.md`: the Spec bullet on cases reads "a case of a script step in the brief's "Cases" that no test of the step checks", since a text case is checked by reading; the Rules bullet "An unreproduced claim is a finding" gains the exception of the Proof heading, and the description's matching phrase gains "(a count, a path or a measurement only when a decision rests on it)".
- `skills/plan-retro/SKILL.md` introduction: its list of causes now covers words the builders misread (the new 3) and names the check nobody runs only for a fact a machine computes (the new 4).
- `skills/plan-orchestration/SKILL.md`: the Anti-patterns row that preferred a check for a rule a command can check is replaced, since it stated the order item 3 replaces.
- The shared rule sits before "Zero warnings", not at the end, so the change standard's sentence "(`skills/repo-setup/templates/shared-rules.md`, last rule)" stays true.

## Sentences about a changed file as a whole, reread

- `docs/dev/change-standard.md` line 3, "This page says how the work is done and how it is reported": still holds; the new section says how the work is done.
- `docs/dev/building.md` line 27, "This page is the list of tests and checks": still holds.
- `skills/repo-setup/templates/shared-rules.md` line 3, "These rules hold in every repository set up from the same template": still holds.

## Doc text

Lines outside this step's paths that the change makes false, for the orchestrator to apply on main:

1. The state file's verify list, the ASCII command. Current (`grep -n 'END { exit' .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`):

```
14:  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
```

Replacement:

```
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

2. `README.md`, current:

```
22:| `plan-retro` | Reads every refuter report and groups the findings by kind. For each kind that recurs, it proposes the rule, the standards page or the check that stops it |
```

Replacement:

```
| `plan-retro` | Reads every refuter report and groups the findings by kind. For each kind that recurs, it proposes the rule sentence or the standards page that stops it, and a check only for a fact a machine computes, which the user approves |
```

3. `README.md`, current:

```
40:/plan-retro                   after plans have run: the findings that recur, and the rule, page or check that stops each
```

Replacement:

```
/plan-retro                   after plans have run: the findings that recur, and the rule sentence or page that stops each, a check only for a fact
```

4. `skills/plan-help/SKILL.md`, current:

```
75:/plan-retro                   after plans have run: the findings the reviews keep making, and the rule, page or check that stops each
```

Replacement:

```
/plan-retro                   after plans have run: the findings the reviews keep making, and the rule sentence or page that stops each, a check only for a fact
```

5. `skills/spec/SKILL.md`, current:

```
94:   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result, and the builder's first task as the template states it: the cases turned into tests and run against the unchanged tree before any code changes, and a case the brief's rules get wrong handed back before any code changes.
```

Replacement:

```
   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result, and the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a script step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
```

The grep that found them: `git grep -n -i -E 'a test\b|revert|every branch|mechanical check|propose[sd]? a check|a check\b|test beside|exit\(\$bad|turn every case|into a test|test of the step|unreproduced' -- skills docs README.md`, `git grep -n -E 'page or check|or the check|the check that stops' -- skills docs README.md`, and `git grep -n -E 'Cases|\btests?\b'` over the other skills and pages. The other hits (`skills/land/SKILL.md` lines 198 and 200 on a reverted landing, `skills/plan-retro/SKILL.md` line 67 quoting a kind, `skills/refute/SKILL.md` line 38 and `skills/plan-orchestration/SKILL.md` lines 202-203 using "mechanical" for a sweep or a rerun, change-standard rule 8's "the check that pinned it") are not made false by the change.
