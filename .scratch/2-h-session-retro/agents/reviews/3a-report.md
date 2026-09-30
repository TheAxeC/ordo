Everything in the brief is done.

## Open items of the state file, verbatim


- Step 3a, six ruled sentences the brief check would reword (2026-09-30, from the second brief check in `agents/reviews/3a-brief-check.md`; step 3a is being built in the words you ruled, and this item does not hold it): the brief check read the ruled texts against the prose standard, the skill layout standard and the `refute` skill, and found a defect in six of them. The words are yours, so none was changed.
  - 1. Rule 13, fourth bullet (both copies of the change standard). Ruled: "The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour, and the report's table gives that change and the test's failing line; the reviewer checks it by reading the test and by a change of its own." Defect: one sentence of 50 words, it names the table one bullet before the rule gives it, and it does not say where the reviewer makes its change while `refute` says the reviewer changes nothing. Reworded: "The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour and quoting the test's failing line, in the table the next bullet gives. The reviewer checks it by reading the test and by a change of its own on a scratch copy."
  - 2. `templates/brief.md` "Cases", the second bullet. Ruled: "and for a script the case where the program reading its output closes it before the script ends". Defect: "case" is a glossary term used here for a situation. Reworded: "and for a script its output closed by the program reading it before the script ends".
  - 3. `spec` "Steps / The brief check" 2, the **Dictated text** bullet. Ruled: three sentences in one bullet. Defect: the bullet holds two requirements that can each fail alone, which the skill layout standard splits. Reworded: the same words, with the third sentence ("Each claim a dictated text makes about the tree is checked as a premise is.") as a sub-bullet under the first two.
  - 4. `templates/brief.md` "Report", the sentence on the table. Ruled: "For each case of a code step, the table the rules file's rule on tests asks for gives that change and the test's failing line with it made." Defect: "that change" points at a paragraph of "Cases" forty lines above. Reworded: "For each case of a code step, the table the rules file's rule on tests asks for gives the small change "Cases" asks for and the test's failing line with it made."
  - 5. `templates/brief.md` "Report", the sentence on the DONE / NOT DONE table. Ruled: "with the checks above and their output verbatim". Defect: in the numbered list "the checks above" can be read as the parts above it in the list. Reworded: "with the checks of "Verify before you report" and their output verbatim".
  - 6. `refute` "The four headings", the new Standards bullet. Ruled: "a term of the glossary the diff uses outside its entry's sense, or an entry the diff makes false, that the report's terms part does not name". Defect: a term the report names and misjudges is then no finding under this bullet. Reworded: "a term of the glossary the diff uses outside its entry's sense, or an entry the diff makes false, whether or not the report's terms part names it".
  - (a) All six reworded as above. Your ruling approves each reworded text. When it arrives before step 3a lands, the six go to the step's builder in a repair round; when it arrives after, the ruling adds the step "3b. The six rewordings of the ruling "Step 3a, six ruled sentences the brief check would reword", in the same six files; check: each reworded text read in place, and `grep -c -F` of each in its file", built through the pipeline. Pro: the texts meet the standards they are checked against, and the next review does not find them. Con: you read six more sentences.
  - (b) The ruled words stay. Pro: nothing to read. Con: each defect stays in the skill, and a review of a later step that reads these lines reports it again. This is the lazy option.
  - (c) Some of the six, named by number, for example `Ruled: 2.H step 3a rewordings 1, 5, 6`. The others stay as ruled.
  - Recommendation (a): each rewording keeps the meaning you ruled and ends a defect a reader would meet.

## The cases' first read (unchanged tree, before any change)

Each result was read on the tree at the step's base, `7e3dbc2`. None of R1 to R9 shows a rule of the brief to be wrong, so nothing was handed back.

- R1. `sed -n '238,247p' skills/spec/SKILL.md` listed the seven bullets **Names**, **The step line**, **Premises**, **Cases and checks**, **The question**, **Implied inputs**, **ADRs**, then "The checks are done when each has its findings, or "none"." at line 246; `grep -c 'Dictated text' skills/spec/SKILL.md` printed 0. As the brief says.
- R2. `grep -n '^## ' skills/spec/templates/brief-check.md` printed:

```
5:## 1. Names
11:## 2. The step line
17:## 3. Premises
23:## 4. Cases and checks
29:## 5. The question
35:## 6. Implied inputs
41:## 7. ADRs
47:## Declined to judge
53:## Closed (the session's change to the brief for every finding above, made before the preparation commit)
```

  `grep -c 'Dictated text' skills/spec/templates/brief-check.md` printed 0. Item 3 of "Steps / The brief check" says "one heading per check of item 2", seven checks and seven headings. As the brief says.
- R3. `git show HEAD:skills/spec/templates/brief.md | sed -n '18,19p'` printed:

```
- <every must-pass and must-refuse example this brief gives, in one list: the input, then its expected result>.
- <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), with its expected result; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.
```

  The second bullet holds five forms and ends "with its expected result; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>." As the brief says.
- R4. `git show HEAD:skills/spec/templates/brief.md | grep -n 'code under test\|small change'` printed nothing, exit status 1; the section "Cases" ends with the paragraph "When the first run finds a case the brief's own rules get wrong" at line 23. As the brief says.
- R5. `git show HEAD:skills/spec/templates/brief.md | sed -n '60,63p'` printed four numbered items, 1 to 4, and "## Report" follows at line 65. As the brief says.
- R6. `git show HEAD:skills/spec/templates/brief.md | sed -n '67p'` is one paragraph; `git show HEAD:skills/spec/templates/brief.md | sed -n '67p' | grep -o '[.] [A-Z]' | wc -l` printed 6 sentence boundaries, so seven sentences: First line; Then the open items; Then the cases' first run; Then the DONE / NOT DONE table; Then files, judgment calls, visible changes and what was wrong; When the brief keeps a shared document. As the brief says.
- R7. `git grep -n 'names no revert\|by reading it' -- skills docs README.md utils` printed, at the base, `docs/dev/change-standard.md:39` and `:43`, the same two lines of `skills/repo-setup/templates/docs/dev/change-standard.md`, `skills/refute/SKILL.md:114` and `docs/roadmap.md:228` ("judged by reading its reports", which stays). `diff <(grep '^13\. ' -A5 docs/dev/change-standard.md) <(grep '^13\. ' -A5 skills/repo-setup/templates/docs/dev/change-standard.md)` printed nothing, exit status 0. As the brief says.
- R8. `awk` counts of the lines starting "  - " in the three lists of `skills/refute/SKILL.md` (lines 93-103, 104-114, 115-124) printed 10, 10 and 9; `grep -n 'An edit to any file' skills/refute/SKILL.md` printed `168:| An edit to any file, anywhere, by the reviewer | The step under review is no longer the step that was built | Report the finding; the builder or the landing fixes it |`. As the brief says.
- R9. `git grep -n -i 'changes nothing\|without changing anything\|An edit to any file' -- skills docs README.md utils` printed at the base: `README.md:5`, `README.md:165`, `README.md:170`, `docs/figures/gen_figures.py:599`, `docs/figures/gen_figures.py:662`, `docs/glossary.md:91`, `skills/grill/SKILL.md:122`, `skills/plan-retro/SKILL.md:3`, `skills/plan-retro/SKILL.md:98`, `skills/refute/SKILL.md:3`, `:10`, `:168`, `skills/repo-setup/SKILL.md:167`, `skills/repo-setup/templates/plan-terms.md:86`, `skills/roadmap/SKILL.md:45`, `:143` and `skills/spec/SKILL.md:232`. Read each: the sentences that say the reviewer changes nothing (`README.md:5`, `gen_figures.py:599`, glossary line 91 and its template copy, `refute` lines 3 and 10) hold once the reviewer's own change is made on a scratch copy outside the worktree and the main checkout; the others are about other commands and skills; the row at `refute` line 168 is the one item 8 changes. `git grep -n -i 'brief check\|first run\|DONE / NOT DONE\|verbatim\|revert\|taken out of the code'` over the same paths, glossary and its template excluded, was read hit by hit: `skills/spec/SKILL.md:102` ("The report shape, with the cases' first run before the result table") and `:103` (the bullet on "Cases") name the template for the detail and stay true with the list, since part 3 (first run) stands before part 5 (the table); `skills/plan-orchestration/SKILL.md:85` (the hand-back) and `:261` ("the DONE / NOT DONE ledger"), `skills/land/SKILL.md:99` (open items verbatim) and `skills/land/SKILL.md:203,205` ("reverted" of a landed commit) are about other reports and stay true; `docs/dev/change-standard.md:33` (rule 7) and its template copy agree with the new report list; no other hit names a count or a shape the change alters.

## DONE / NOT DONE

| Item | Status | Command that proves it | Output |
|---|---|---|---|
| What to build 1 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i1 skills/spec/SKILL.md` | 1 |
| What to build 2 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i2a`, `i2b`, `i2c`, `i2d` each over `skills/spec/templates/brief-check.md` | 1, 1, 1, 1 |
| What to build 3 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i3 skills/spec/templates/brief.md` | 1 |
| What to build 4 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i4 skills/spec/templates/brief.md` | 1 |
| What to build 5 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i5 skills/spec/templates/brief.md` | 1 |
| What to build 6 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i6a` to `i6l`, twelve files, each over `skills/spec/templates/brief.md` | 1 for each of the twelve |
| What to build 7 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i7a`, `i7b`, `i7c` each over each of the two change standards | 1 for each of the six runs |
| What to build 8 | DONE | `grep -c -F -f $TMPDIR/3a.KzezPH/i8a` to `i8e` each over `skills/refute/SKILL.md` | 1 for each of the five |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` | exit status 0; the lines are in the block below the table |
| Verify 2 | DONE | the thirty-one `grep -c -F -f` runs of the rows above and the block "The dictated texts" below | 1 each |
| Verify 3 | DONE | `git diff --stat` and `git diff -U0` of each change standard | the block below the table; the six removed and six added lines of the two files are identical (`diff` of the two filtered diffs, exit status 0) |
| Verify 4 | DONE | `LC_ALL=C grep -n '[^ -~]'` over the six files | prints nothing; exit status 1 |
| Verify 5 | DONE | `grep -n -i 'glossary\|prose standard\|skill-layout\|docs/'` over the three spec files | the block below the table |
| Verify 6 | DONE | `git grep -n 'names no revert\|finds such a test by reading it' -- skills docs README.md utils` | prints nothing; exit status 1 |
| Verify 7 | DONE | reading | the sentences longer than about 20 words are listed under "Judgment calls" |

Output of Verify 1, verbatim:

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
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

Output of Verify 3, `git diff --stat`:

```
 docs/dev/change-standard.md                           |  6 +++---
 skills/refute/SKILL.md                                |  8 +++++---
 .../repo-setup/templates/docs/dev/change-standard.md  |  6 +++---
 skills/spec/SKILL.md                                  |  1 +
 skills/spec/templates/brief-check.md                  |  7 +++++++
 skills/spec/templates/brief.md                        | 19 +++++++++++++++++--
 6 files changed, 36 insertions(+), 11 deletions(-)
```

Output of Verify 5, `grep -n -i 'glossary\|prose standard\|skill-layout\|docs/' skills/spec/SKILL.md skills/spec/templates/brief.md skills/spec/templates/brief-check.md`, whole lines:

```
skills/spec/SKILL.md:50:   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force. A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses. Its decision is its Decision section, or, in a record without one, the text that states what was decided. A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
skills/spec/SKILL.md:245:   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says. Each one the step touches is named with the sentence of its decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
skills/spec/SKILL.md:246:   - **Dictated text.** Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints) is read against the rules file and the standards the configuration names, as the reviewer holds a diff to them. Each place a text breaks one is named, with the rule. Each claim a dictated text makes about the tree is checked as a premise is.
skills/spec/templates/brief.md:77:6. The terms, when the repository has a glossary: each term of it that the diff adds, changes or uses, with the line that uses it and whether the use is in a sense its entry gives. For each entry the diff changes, and each entry whose named place the diff changes, the line of that place that states the term is quoted as `grep -n` prints it.
skills/spec/templates/brief-check.md:43:- <each `NNNN-*.md` record in the configured `adr` folder (`docs/adr` when the configuration block has none), for its part in force>: whether it touches the step, and for one that does, the sentence of its decision the step is under and whether the brief names it under "What is on the tree". Or: no record.
skills/spec/templates/brief-check.md:49:- <each text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints)>: consistent with the rules file and the standards, or the rule it breaks, named with its file and section. Or: no text given word for word.
```

The same command on the unchanged tree (`git show HEAD:<file> | grep -n -i ...`) printed `skills/spec/SKILL.md:50`, `:245` and `skills/spec/templates/brief-check.md:43`, each naming `docs/adr`. After the change the same three lines stand at `SKILL.md:50`, `:245` and `brief-check.md:43`, and the new hits are `SKILL.md:246` ("a glossary entry", generic), `brief.md:77` ("when the repository has a glossary", generic) and `brief-check.md:49` ("a glossary entry", generic). No hit names a page of one repository that the unchanged tree did not name.

### The dictated texts

Each text is one line of a scratch file under `$TMPDIR/3a.KzezPH`, no empty line in any file; each command is `grep -c -F -f $TMPDIR/3a.KzezPH/<name> <file>`.

```
[i1 in skills/spec/SKILL.md] grep -c prints 1
   - **Dictated text.** Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints) is read against the rules file and the standards the configuration names, as the reviewer holds a diff to them. Each place a text breaks one is named, with the rule. Each claim a dictated text makes about the tree is checked as a premise is.
[i2a in skills/spec/templates/brief-check.md] grep -c prints 1
## 8. Dictated text
[i2b in skills/spec/templates/brief-check.md] grep -c prints 1
- <each text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints)>: consistent with the rules file and the standards, or the rule it breaks, named with its file and section. Or: no text given word for word.
[i2c in skills/spec/templates/brief-check.md] grep -c prints 1
- <each claim a dictated text makes about the tree>: `<its command>`, what it printed now, and whether that matches the claim. Or: no claim.
[i2d in skills/spec/templates/brief-check.md] grep -c prints 1
Findings: <each dictated text that breaks the rules file or a standard, with the rule; each claim of a dictated text that differs from the command's output, with both>. Or: none.
[i3 in skills/spec/templates/brief.md] grep -c prints 1
- <for a code step (a script, or a product's code), each input the step's text implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path, and for a script the case where the program reading its output closes it before the script ends), with its expected result, for a script the exit status and the error line; only the inputs where a wrong answer costs something, as the rules file's rule on edges weighs them>.
[i4 in skills/spec/templates/brief.md] grep -c prints 1
For each case of a code step, the builder makes one small change to the code under test that takes out the behaviour the case names, runs the case's test, and takes the change out again.
[i5 in skills/spec/templates/brief.md] grep -c prints 1
5. Each bullet, list item and sentence the diff adds or changes in a page or a skill is read against the standards' rules on lists and on sentence length. A sentence longer than they allow is named in the report with the reason its content needs the length.
[i6a in skills/spec/templates/brief.md] grep -c prints 1
Write it to `<ledger>/agents/reviews/<step>-report.md`, with these parts in this order:
[i6b in skills/spec/templates/brief.md] grep -c prints 1
1. The first line: anything NOT done, or "Everything in the brief is done".
[i6c in skills/spec/templates/brief.md] grep -c prints 1
2. The open items of the state file, verbatim, which hold only what the user must rule on.
[i6d in skills/spec/templates/brief.md] grep -c prints 1
3. The cases' first run: every case of "Cases", in the brief's order, none left out. Each case has the command that checked it and its output verbatim, or the reading and what it found on the unchanged tree. Each case the brief's rules got wrong has the rule, the result and the orchestrator's ruling.
[i6e in skills/spec/templates/brief.md] grep -c prints 1
4. For each case of a code step, the table the rules file's rule on tests asks for gives that change and the test's failing line with it made.
[i6f in skills/spec/templates/brief.md] grep -c prints 1
5. The DONE / NOT DONE table with the checks above and their output verbatim; a command that prints nothing is given with its exit status, and a long line is quoted whole, never shortened with "...".
[i6g in skills/spec/templates/brief.md] grep -c prints 1
6. The terms, when the repository has a glossary: each term of it that the diff adds, changes or uses, with the line that uses it and whether the use is in a sense its entry gives. For each entry the diff changes, and each entry whose named place the diff changes, the line of that place that states the term is quoted as `grep -n` prints it.
[i6h in skills/spec/templates/brief.md] grep -c prints 1
7. Files with line counts.
[i6i in skills/spec/templates/brief.md] grep -c prints 1
8. Every judgment call the brief left open.
[i6j in skills/spec/templates/brief.md] grep -c prints 1
9. Every host- or user-visible change with its before and after.
[i6k in skills/spec/templates/brief.md] grep -c prints 1
10. Anything in the brief that was wrong or impossible, with the evidence.
[i6l in skills/spec/templates/brief.md] grep -c prints 1
11. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
[i7a in docs/dev/change-standard.md] grep -c prints 1
The report quotes each run verbatim beside the test's name.
[i7a in skills/repo-setup/templates/docs/dev/change-standard.md] grep -c prints 1
The report quotes each run verbatim beside the test's name.
[i7b in docs/dev/change-standard.md] grep -c prints 1
The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour, and the report's table gives that change and the test's failing line; the reviewer checks it by reading the test and by a change of its own.
[i7b in skills/repo-setup/templates/docs/dev/change-standard.md] grep -c prints 1
The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour, and the report's table gives that change and the test's failing line; the reviewer checks it by reading the test and by a change of its own.
[i7c in docs/dev/change-standard.md] grep -c prints 1
the report lists them in a table: the behaviour, the case, the failing line quoted for it, the small change that takes the behaviour out, and the test's failing line with that change made.
[i7c in skills/repo-setup/templates/docs/dev/change-standard.md] grep -c prints 1
the report lists them in a table: the behaviour, the case, the failing line quoted for it, the small change that takes the behaviour out, and the test's failing line with that change made.
[i8a in skills/refute/SKILL.md] grep -c prints 1
  - a case whose first run on the unchanged tree the report does not give;
[i8b in skills/refute/SKILL.md] grep -c prints 1
  - a case of a code step for which the report gives no change that takes its behaviour out.
[i8c in skills/refute/SKILL.md] grep -c prints 1
  - a test that would still pass with the behaviour it is written for taken out of the code (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs), found by reading it or by a change of the reviewer's own, made on a scratch copy outside the worktree and the main checkout, that takes the behaviour out.
[i8d in skills/refute/SKILL.md] grep -c prints 1
  - a term of the glossary the diff uses outside its entry's sense, or an entry the diff makes false, that the report's terms part does not name;
[i8e in skills/refute/SKILL.md] grep -c prints 1
| An edit to any file of the worktree or the main checkout by the reviewer |
```

## The terms

Each term of `docs/glossary.md` that the diff adds, changes or uses, with the line that uses it (post-change line numbers) and whether the use is in a sense its entry gives. The diff changes no glossary entry.

- **brief**: `skills/spec/SKILL.md:246`, `skills/spec/templates/brief.md:74` ("in the brief's order"), `skills/refute/SKILL.md:104`; the file `/spec` writes, the sense the entry gives.
- **case**: `skills/spec/templates/brief.md:25` ("each case of a code step"), `:74` ("every case of "Cases""), `skills/refute/SKILL.md:104`; an example under a brief's "Cases", the sense the entry gives. `skills/spec/templates/brief.md:19` ("for a script the case where the program reading its output closes it before the script ends") uses "case" for a situation, outside the entry's sense; the words are ruled and are the first of the six in the open item above.
- **first run**: `skills/spec/templates/brief.md:74` ("The cases' first run"), `skills/refute/SKILL.md:103`; the run of every case on the unchanged tree, the sense of the **case** entry.
- **finding**: `skills/spec/templates/brief-check.md:52` ("Findings:") and the new bullets `skills/refute/SKILL.md:104` and `:123`, which are items of the lists that begin "A finding is" (`:93`, `:116`); a defect a reviewer or the brief check reports, the sense the entry gives.
- **rules file**: `skills/spec/SKILL.md:246`, `skills/spec/templates/brief-check.md:49` and `:52`, `skills/spec/templates/brief.md:19`, `:75`; the page `.agents/plan.yaml`'s `rules:` names, the sense the entry gives.
- **standards**: `skills/spec/SKILL.md:246` ("the standards the configuration names"), `skills/spec/templates/brief-check.md:49` and `:52`, `skills/spec/templates/brief.md:66` ("the standards' rules"); the pages `.agents/plan.yaml`'s `standards` lists, the sense the entry gives.
- **reviewer**: `skills/spec/SKILL.md:246` ("as the reviewer holds a diff to them"), `docs/dev/change-standard.md:43`, `skills/refute/SKILL.md:115` and `:170`; the fresh session that refutes a step. The entry says it "refutes a built step without changing anything"; that holds because the reviewer's own change is made on a scratch copy outside the worktree and the main checkout, as `skills/refute/SKILL.md:115` says.
- **builder**: `skills/spec/templates/brief.md:25`, `docs/dev/change-standard.md:43`; the agent that builds one step, the sense the entry gives.
- **premise**: `skills/spec/SKILL.md:246` ("checked as a premise is"); a claim a step's text makes about the tree, the sense the entry gives.
- **state file** and **open item**: `skills/spec/templates/brief.md:73` ("The open items of the state file"); the senses the entries give.
- **Doc text**: `skills/spec/templates/brief.md:82`; the section of a builder's report for a shared document, the sense the entry gives, at the place the entry names.
- **stop**: `skills/spec/templates/brief.md:23` ("the builder stops there"), a place the entry names ("A builder also stops when it halts its work"); the line is unchanged and the place's file changed.
- **ledger**: `skills/spec/templates/brief.md:70` ("`<ledger>/agents/reviews/<step>-report.md`"); the sense the entry gives, an unchanged part of the line.

For each entry whose named place the diff changes, the line of that place that states the term, as `grep -n` prints it:

- **brief check**, **finding**, **question, the**, **Declined to judge**, **Closed** and **ADR** name `spec`, "Steps / The brief check", which the diff changes; the entries still hold at `skills/spec/SKILL.md:230:1. Start one fresh agent as the effort agent ...` (the check by one fresh agent), `skills/spec/SKILL.md:243` (**The question.** ... "could this pass without the goal being reached?"), `skills/spec/SKILL.md:245` (**ADRs.** ... "is read for its part in force"), `skills/spec/SKILL.md:248` (the report with "Declined to judge"), `skills/spec/SKILL.md:252` (the report's "Closed" heading) and `skills/spec/templates/brief-check.md:54:## Declined to judge`, `:60:## Closed (the session's change ...`.
- **ADR** and **four headings** name `refute`, "The four headings", which the diff changes; they hold at `skills/refute/SKILL.md:100`, `:101` (the two ADR bullets) and `skills/refute/SKILL.md:93`, `:105`, `:116`, `:127` (the four heading labels).
- **Doc text** names `spec`, `templates/brief.md`, "Report", which the diff changes; it holds at `skills/spec/templates/brief.md:82:11. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document ...`.
- **stop** names `spec`, `templates/brief.md`; it holds at `skills/spec/templates/brief.md:23:When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any code, and hands back the first run and that case ...`.
- **case** and **first run** name `spec`, Steps 4, which the diff does not change, and `refute`, "The verdicts", which it does not change.

## Files, with line counts (after, before)

- `docs/dev/change-standard.md`: 89 (89), three lines changed in place.
- `skills/repo-setup/templates/docs/dev/change-standard.md`: 71 (71), the same three lines changed.
- `skills/spec/SKILL.md`: 297 (296).
- `skills/spec/templates/brief.md`: 82 (67).
- `skills/spec/templates/brief-check.md`: 62 (55).
- `skills/refute/SKILL.md`: 183 (181).
- `.scratch/2-h-session-retro/agents/reviews/3a-report.md`: 265, this report.

Line counts come from `wc -l` on the worktree and `git show HEAD:<file> | wc -l` for the before.

## Judgment calls

None left open by the brief; every text is placed as its item says and the words are the ruled words.

Sentences the diff adds or changes that run past the prose standard's "roughly 20 words" (E, "Sentence length"), read for Verify 7 and not rewritten since their words are ruled. Each stays as one sentence because it states a requirement together with the qualifier that changes it, which "Lists and tables" of `docs/dev/skill-layout.md` keeps in one bullet, and, where a parenthesis lists kinds, because the list is the content.

- `skills/spec/SKILL.md:246`, first sentence, 44 words: the five kinds of text in a parenthesis, and the two things the read is against.
- `skills/spec/templates/brief-check.md:49`, 41 words, and `:52`, 29 words: the same five kinds in a placeholder, and the two outcomes each of the eight sections gives in one line.
- `skills/spec/templates/brief.md:19`, 94 words: one placeholder bullet, as the bullet it replaces was one sentence of about 60 words; it lists the forms of implied input and what to state for each.
- `skills/spec/templates/brief.md:25`, 36 words: the three actions on one case, in order.
- `skills/spec/templates/brief.md:66`, 29 words: three things read, against two rules.
- `skills/spec/templates/brief.md:75`, 28 words; `:76`, 36 words; `:77`, 36 and 31 words; `:82`, 53 words (the sentence of the old paragraph, its words kept): each is one part of the report with its qualifier.
- `docs/dev/change-standard.md:43`, 50 words, and `:44`, 57 words, and the same lines of the template copy: the rule with its qualifier, as rule 13's other bullets are written.
- `skills/refute/SKILL.md:115`, 68 words (the old bullet was 44): the kinds of test in a parenthesis, and the two ways the reviewer finds one, with where the reviewer's own change is made. `skills/refute/SKILL.md:123`, 27 words.

Other readings for Verify 7: every added bullet is one item; the "Dictated text" bullet holds three sentences, of which the third is a second requirement that can fail while the first two hold, the third of the six in the open item above; the semicolon at the end of `skills/refute/SKILL.md:103` and `:123` is the list's own, the last bullet of each list ends with a period.

## Visible changes, before and after

- The brief check has an eighth check. Before: seven checks, seven report headings. After: **Dictated text** at `skills/spec/SKILL.md:246` and `## 8. Dictated text` at `skills/spec/templates/brief-check.md:47`; a future brief check reads each text a brief gives word for word against the rules file and the standards, and each claim of such a text about the tree as a premise.
- A brief written from `skills/spec/templates/brief.md` has, after this change, a "Cases" bullet naming a script's output closed early and the exit status and error line, a closing paragraph asking one small change to the code under test per case of a code step, a fifth item in "Verify before you report" on lists and sentence length, and a "Report" of eleven numbered parts (before: one paragraph of seven sentences).
- Rule 13 of the change standard, in both copies. Before: "names no revert", "The reviewer finds such a test by reading it.", a table of the behaviour, the case and the failing line. After: the report quotes each run beside the test's name, the builder shows a test is a proof by one small change that takes the behaviour out, the reviewer checks it by reading and by a change of its own, and the table holds the behaviour, the case, the failing line, the small change and the failing line with it made.
- `skills/refute/SKILL.md`. Before: the Spec list ended at the first-run bullet, the Proof list's last bullet said "found by reading it", the Standards list had no bullet on the glossary, and the Anti-patterns row read "An edit to any file, anywhere, by the reviewer". After: a Spec bullet at `:104`, the Proof bullet at `:115` with the reviewer's own change on a scratch copy, a Standards bullet at `:123`, and the row at `:170` reading "An edit to any file of the worktree or the main checkout by the reviewer".

## Anything in the brief that was wrong or impossible

Nothing was wrong or impossible on the tree: each premise read at the start held (R1 to R9 above). The six defects in ruled sentences that the brief check found are in the open item at the top, and their words are placed as ruled.

## Sentences about a changed file as a whole (rule 14)

- "one heading per check of item 2" in `skills/spec/SKILL.md:248`. It holds: `sed -n '239,246p' skills/spec/SKILL.md` lists eight check bullets (Names, The step line, Premises, Cases and checks, The question, Implied inputs, ADRs, Dictated text) and `grep -n '^## ' skills/spec/templates/brief-check.md` lists `## 1. Names` at line 5, `## 2. The step line` at 11, `## 3. Premises` at 17, `## 4. Cases and checks` at 23, `## 5. The question` at 29, `## 6. Implied inputs` at 35, `## 7. ADRs` at 41 and `## 8. Dictated text` at 47, in the same order.
- The introduction of `skills/spec/templates/brief-check.md`, line 3: "A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number ... A line of code or a hit of a grep keeps its `file:line`." It holds: section 8's first bullet says the rule is named "with its file and section" (`brief-check.md:49`), and its second bullet asks the command and its output (`:50`), which are hits of a grep and keep their line.
- The description of `skills/refute/SKILL.md`, line 3, "Review a built step without changing anything ... findings under four headings (spec, proof, standards, behaviour)". It holds: the four heading labels stand at lines 93, 105, 116 and 127 and the diff adds no fifth; the reviewer's own change is made on a scratch copy outside the worktree and the main checkout (line 115), so the step is unchanged.
- The opening paragraph of `skills/refute/SKILL.md`, line 10, "dispatches one reviewer, who changes nothing ... a verdict per item of the brief and per case, and a list of findings each with its place ... and its failure scenario". It holds for the same two reasons: the four headings and the per-finding place and failure scenario (`skills/refute/SKILL.md:128`) are unchanged, and nothing of the worktree or the main checkout is edited.
