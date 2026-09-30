Everything in the round brief is done.

One point in the round brief's own text needs the orchestrator's confirmation, and is under "Anything wrong or impossible": item 4 says the sub-bullet is indented three spaces more, while its fenced text shows two more. The file has the fenced text, two more (five spaces), which is how the neighbours in `skills/spec/SKILL.md` are indented.

## Open items of the state file, verbatim

The main checkout's `.scratch/2-h-session-retro/orchestrator-state.md` holds, under "Open items":

none

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

## DONE / NOT DONE (the brief's items and checks, as they now stand)

The texts of items 1, 3, 6, 7 and 8 stand as this round rewords them; each row names the command that proves the text in the tree now. Scratch files under `$TMPDIR/3a.KzezPH` hold the texts of the first build and under `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//3a1.oeYNMh` the texts of this round.

| Item | Status | Command that proves it | Output |
|---|---|---|---|
| What to build 1 | DONE | `grep -c -x -F -f n4a` and `n4b` over `skills/spec/SKILL.md` | 1, 1 |
| What to build 2 | DONE | `grep -c -F -f i2a`, `i2b`, `i2c`, `i2d` over `skills/spec/templates/brief-check.md` | 1, 1, 1, 1 |
| What to build 3 | DONE | `grep -c -x -F -f n3` over `skills/spec/templates/brief.md` | 1 |
| What to build 4 | DONE | `grep -c -x -F -f i4` over `skills/spec/templates/brief.md` | 1 |
| What to build 5 | DONE | `grep -c -x -F -f i5` over `skills/spec/templates/brief.md` | 1 |
| What to build 6 | DONE | `grep -c -x -F -f` over `skills/spec/templates/brief.md` of `i6a`, `i6b`, `i6c`, `i6d`, `n5a`, `n5b`, `i6g`, `n5c`, `n5d`, `n5e`, `n5f`, `n5g`, `n5h` (parts 1 to 12) | 1 1 1 1 1 1 1 1 1 1 1 1 1  |
| What to build 7 | DONE | `grep -c -F -f n1`, `n2`, `i7a`, `i7c` over each of the two change standards | docs/dev/change-standard.md: 1, 1, 1, 1; skills/repo-setup/templates/docs/dev/change-standard.md: 1, 1, 1, 1 |
| What to build 8 | DONE | `grep -c -F -f` over `skills/refute/SKILL.md` of `i8a`, `i8b`, `n6d`, `n6a`, `n6e` | 1, 1, 1, 1, 1 |
| Verify 1 | DONE | the checks command of Round 1 check 1 | see Round 1 check 1 |
| Verify 2 | DONE | the greps of this table | 1 for each text |
| Verify 3 | DONE | see Round 1 check 3 | see there |
| Verify 4 | DONE | see Round 1 check 4 | see there |
| Verify 5 | DONE | `grep -n -i 'glossary\|prose standard\|skill-layout\|docs/'` over the three spec files | `brief-check.md` 2 hits, `SKILL.md` 3, `brief.md` 1; the lines are in the block "Verify 5 output" below |
| Verify 6 | DONE | `git grep -n 'names no revert\|finds such a test by reading it' -- skills docs README.md utils` | 0 lines printed |
| Verify 7 | DONE | reading | the sentences longer than the prose standard allows are under their own heading below |

## Round 1

The six rewordings the user ruled and the rulings on the review's findings, in `.scratch/2-h-session-retro/agents/briefs/3a-round-1.md`. Texts in scratch files under `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//3a1.oeYNMh`: `n1` to `n6e` are the new texts, `o1` to `o6e` the replaced ones.

| Item | Status | Command that proves it | Output |
|---|---|---|---|
| 1. Rule 13, fourth bullet | DONE | `grep -c -F -f n1` and `o1` over each of the two change standards | n1: 1, 1; o1: 0, 0 |
| 2. Rule 13, fifth bullet | DONE | `grep -c -F -f n2` over each of the two change standards | 1, 1 |
| 3. `brief.md` "Cases", second bullet | DONE | `grep -c -x -F -f n3` and `grep -c -F -f o3` over `skills/spec/templates/brief.md` | n3: 1; o3: 0 |
| 4. **Dictated text** bullet and sub-bullet | DONE | `grep -c -x -F -f n4a`, `n4b` and `grep -c -F -f o4` over `skills/spec/SKILL.md` | n4a: 1; n4b: 1; o4: 0 |
| 5. `brief.md` "Report", parts 4, 5, 7 and the renumbering | DONE | `grep -c -x -F -f n5a` to `n5h`, and `grep -c -F -f o5a`, `o5b` over `skills/spec/templates/brief.md` | n5a: 1; n5b: 1; n5c: 1; n5d: 1; n5e: 1; n5f: 1; n5g: 1; n5h: 1; o5a: 0; o5b: 0 |
| 6a. `refute` Standards bullet | DONE | `grep -c -x -F -f n6a`, `grep -c -F -f o6a` over `skills/refute/SKILL.md` | n6a: 1; o6a: 0 |
| 6b. `refute` Steps 5 sub-bullets | DONE | `grep -c -x -F -f n6b`, `n6c` over `skills/refute/SKILL.md` | 1, 1 |
| 6c. `refute` Proof bullet | DONE | `grep -c -x -F -f n6d`, `grep -c -F -f o6d` over `skills/refute/SKILL.md` | n6d: 1; o6d: 0 |
| 6d. `refute` Anti-patterns cell | DONE | `grep -c -F -f n6e`, `o6e` over `skills/refute/SKILL.md` | n6e: 1; o6e: 0 |
| 7. The report's "The terms" | DONE | `python3` list of glossary headwords over the added lines of `git diff 7e3dbc2` (a helper run, its hits read one by one), the result under "The terms" | see below |
| Check 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md` | exit status 0; the lines in the block below |
| Check 2 | DONE | the greps of the rows above; the old texts print 0 | as the rows say |
| Check 3 | DONE | `git diff -U0` of each change standard, filtered to its removed and added lines, then `diff` of the two; `git diff --stat` | the block below |
| Check 4 | DONE | `LC_ALL=C grep -n '[^ -~]'` over the six files | prints nothing; exit status 1 |
| Check 5 | DONE | `git grep -n "reviewer's own\|change of its own\|scratch copy" -- skills docs README.md utils` | the block below, read hit by hit |
| Check 6 | DONE | reading | the block "Check 6" below |

Verify 5 output, whole lines (`grep -n -i 'glossary\|prose standard\|skill-layout\|docs/' skills/spec/SKILL.md skills/spec/templates/brief.md skills/spec/templates/brief-check.md`):

```
skills/spec/SKILL.md:50:   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force. A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses. Its decision is its Decision section, or, in a record without one, the text that states what was decided. A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
skills/spec/SKILL.md:245:   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says. Each one the step touches is named with the sentence of its decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
skills/spec/SKILL.md:246:   - **Dictated text.** Every text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints) is read against the rules file and the standards the configuration names, as the reviewer holds a diff to them. Each place a text breaks one is named, with the rule.
skills/spec/templates/brief.md:77:6. The terms, when the repository has a glossary: each term of it that the diff adds, changes or uses, with the line that uses it and whether the use is in a sense its entry gives. For each entry the diff changes, and each entry whose named place the diff changes, the line of that place that states the term is quoted as `grep -n` prints it.
skills/spec/templates/brief-check.md:43:- <each `NNNN-*.md` record in the configured `adr` folder (`docs/adr` when the configuration block has none), for its part in force>: whether it touches the step, and for one that does, the sentence of its decision the step is under and whether the brief names it under "What is on the tree". Or: no record.
skills/spec/templates/brief-check.md:49:- <each text the brief gives word for word (a sentence, a row, a glossary entry, a layout, a message a script prints)>: consistent with the rules file and the standards, or the rule it breaks, named with its file and section. Or: no text given word for word.
```

The hits at `SKILL.md:50`, `:245` and `brief-check.md:43` name `docs/adr` and are on the unchanged tree; the others say "a glossary entry" or "when the repository has a glossary", generic words. No hit names a page of one repository that the unchanged tree did not name.

Check 1 output, verbatim:

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

Check 3 output:

```
$ git diff -U0 docs/dev/change-standard.md | grep '^[-+]' | grep -v '^+++\|^---' | md5
eb4cc39a2ba922c1dda0d022806263ff
$ git diff -U0 skills/repo-setup/templates/docs/dev/change-standard.md | grep '^[-+]' | grep -v '^+++\|^---' | md5
eb4cc39a2ba922c1dda0d022806263ff
$ git diff --stat
 docs/dev/change-standard.md                          |  6 +++---
 skills/refute/SKILL.md                               | 10 +++++++---
 .../repo-setup/templates/docs/dev/change-standard.md |  6 +++---
 skills/spec/SKILL.md                                 |  2 ++
 skills/spec/templates/brief-check.md                 |  7 +++++++
 skills/spec/templates/brief.md                       | 20 ++++++++++++++++++--
 6 files changed, 40 insertions(+), 11 deletions(-)
```

The two md5 lines are equal, so the removed lines and the added lines of the two change standards are the same; each file has 3 removed and 3 added lines against the base.

Check 4: `LC_ALL=C grep -n '[^ -~]'` over the six files printed nothing, exit status 1.

Check 5 output, whole lines (`git grep -n "reviewer's own\|change of its own\|scratch copy" -- skills docs README.md utils`) (26 lines printed; the 16 that are about a scratch copy for another purpose, in `README.md`, `docs/roadmap.md`, `skills/diagnose`, `skills/ordo-help`, `skills/plan-orchestration` and `skills/repo-setup/templates/hooks/git_guard.test.sh`, are left out of the block, and the 10 that speak of the reviewer are in it):

```
docs/dev/change-standard.md:43:   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour and quoting the test's failing line with that change made, in the table the next bullet gives. The reviewer checks it by reading the test and by a change of its own on a scratch copy.
skills/refute/SKILL.md:62:   - For each case of a code step, the reviewer checks that the case's test is a proof, as the rules file's rule on tests says: it reads the test, and it makes one change of its own that takes the case's behaviour out and runs the test against that change.
skills/refute/SKILL.md:63:   - The change is made on a scratch copy of the files the test runs, copied with `cp` into a folder under `$TMPDIR`, never in the worktree or the main checkout, and the folder is removed before the report is written.
skills/refute/SKILL.md:84:   - a claim of closure the reviewer's own rerun does not reproduce.
skills/refute/SKILL.md:101:  - a premise in the brief's "What is on the tree" section that the reviewer's own grep does not reproduce;
skills/refute/SKILL.md:114:  - a count, a path or a measurement in the report that the reviewer's own run does not reproduce, when a decision rests on it, and the finding names that decision;
skills/refute/SKILL.md:117:  - a test that would still pass with the behaviour it is written for taken out of the code (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs), found by reading it and by the reviewer's own change of Steps 5.
skills/refute/SKILL.md:172:| An edit to any file outside the reviewer's scratch copy, by the reviewer | The step under review is no longer the step that was built | Report the finding; the builder or the landing fixes it |
skills/refute/SKILL.md:182:- The reviewer starts no agent: every read and every command of the review runs in the reviewer's own session.
skills/repo-setup/templates/docs/dev/change-standard.md:43:   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. The builder shows a test is a proof by making one small change to the code under test that takes out the behaviour and quoting the test's failing line with that change made, in the table the next bullet gives. The reviewer checks it by reading the test and by a change of its own on a scratch copy.
```

Read: the hits at `docs/dev/change-standard.md:43` and its template copy say the reviewer checks a test by reading it and by a change of its own on a scratch copy; `skills/refute/SKILL.md:62` and `:63` say the reviewer makes that change for each case of a code step, on a scratch copy made with `cp` under `$TMPDIR`, never in the worktree or the main checkout, removed before the report; `:117` says a test is found out by reading it and by that change; `:172` forbids an edit outside the scratch copy. The four agree that the change is made, for each case of a code step, and where. The other hits in the block, `refute` lines 84, 101, 114 and 182, use "the reviewer's own" for a rerun, a grep, a run and a session and say nothing on a change. The 16 left out are the scratch copies of a diagnosis probe, of a roadmap gate and of a hook test, and say nothing on the reviewer's change. No two hits disagree on whether the reviewer's change is made, or on where.

Check 6, reading: `sed -n '70,84p' skills/spec/templates/brief.md | grep '^[0-9]*\. ' | cut -c1-70` gives twelve parts, numbered 1 to 12 in order:

```
1. The first line: anything NOT done, or "Everything in the brief is d
2. The open items of the state file, verbatim, which hold only what th
3. The cases' first run: every case of "Cases", in the brief's order, 
4. For each case of a code step, the table the rules file's rule on te
5. The DONE / NOT DONE table with the checks of "Verify before you rep
6. The terms, when the repository has a glossary: each term of it that
7. Each sentence that item 5 of "Verify before you report" names as lo
8. Files with line counts.
9. Every judgment call the brief left open.
10. Every host- or user-visible change with its before and after.
11. Anything in the brief that was wrong or impossible, with the evide
12. When the brief keeps a shared document out of the step's paths bec
```

- The brief check has eight checks and eight headings: `sed -n '239,247p' skills/spec/SKILL.md` lists Names, The step line, Premises, Cases and checks, The question, Implied inputs, ADRs, Dictated text (with its sub-bullet), and `grep -n '^## ' skills/spec/templates/brief-check.md` prints `## 1. Names` to `## 8. Dictated text` at lines 5, 11, 17, 23, 29, 35, 41, 47.
- Each list of "The four headings" ends with a period on its last bullet: `refute:106` (Spec), `:117` (Proof), and the Standards list's last bullet at `:128`, checked by `sed -n '106p;117p;128p' skills/refute/SKILL.md | grep -c '[.]$'`, which printed 3.
- Steps 5 of `refute` (skills/refute/SKILL.md:61 to :63): its line ends "...has a verdict." and the two sub-bullets follow it; the item's last line is now the sub-bullet that ends "the folder is removed before the report is written." See "Anything wrong or impossible".

## The terms

Each glossary headword that the added or changed lines of `git diff 7e3dbc2` use, found by a helper run of every headword over those lines (its hits read one by one), with the lines that use it (post-change numbers) and whether the use is in the sense its entry gives. The diff changes no glossary entry.

- **base**: `docs/dev/change-standard.md:39` and its template copy ("the tree at the step's base", the unchanged sentence of a changed line); the entry's sense.
- **brief**: `skills/spec/SKILL.md:246`, `skills/spec/templates/brief-check.md:49`, `skills/spec/templates/brief.md:72`, `:74`, `:80`, `:82`, `:83`; the file `/spec` writes, the entry's sense.
- **builder**: `docs/dev/change-standard.md:43` and its template copy, `skills/refute/SKILL.md:172` (the row's unchanged third cell), `skills/spec/templates/brief.md:25`; the entry's sense.
- **case**: `docs/dev/change-standard.md:44` and its template copy, `skills/refute/SKILL.md:62`, `:105`, `:106`, `skills/spec/templates/brief.md:25`, `:74`, `:75`; an example under a brief's "Cases", the entry's sense. `skills/spec/templates/brief.md:19` no longer uses "case" for a situation.
- **finding**: `skills/refute/SKILL.md:106` and `:125` (items of lists that begin "A finding is") and `:172` ("Report the finding", the row's unchanged third cell), `skills/spec/templates/brief-check.md:52` ("Findings:"); the entry's sense.
- **first run**: `skills/spec/templates/brief.md:74`, `skills/refute/SKILL.md:105`; the run of every case on the unchanged tree, the sense of the **case** entry.
- **Doc text**: `skills/spec/templates/brief.md:83`; the entry's sense, at the place the entry names.
- **landing**: `skills/spec/templates/brief.md:83` ("applies at landing"), `skills/refute/SKILL.md:172` ("the landing fixes it", the row's unchanged third cell); the entry's sense, bringing a step onto main.
- **ledger**: `skills/spec/templates/brief.md:70`; the entry's sense.
- **open item** and **state file**: `skills/spec/templates/brief.md:73`; the entries' senses.
- **orchestrator**: `skills/spec/templates/brief.md:74`, `:83`; the entry's sense.
- **plan**: `docs/dev/change-standard.md:39` and its template copy ("a plan step", unchanged words); the entry's sense.
- **premise**: `skills/spec/SKILL.md:247`; the entry's sense.
- **reviewer**: `docs/dev/change-standard.md:43` and its template copy, `skills/refute/SKILL.md:62`, `:117`, `:172`, `skills/spec/SKILL.md:246`; the fresh session that refutes a step. The entry says it "refutes a built step without changing anything"; that holds because the reviewer's own change is made on a scratch copy outside the worktree and the main checkout, as `skills/refute/SKILL.md:63` says.
- **rules file**: `skills/refute/SKILL.md:62`, `skills/spec/SKILL.md:246`, `skills/spec/templates/brief-check.md:49`, `:52`, `skills/spec/templates/brief.md:19`, `:75`; the entry's sense.
- **ruling**: `skills/spec/templates/brief.md:74` ("the orchestrator's ruling", unchanged words); the orchestrator's decision on a case, the entry's sense.
- **standards**: `skills/spec/SKILL.md:246`, `skills/spec/templates/brief-check.md:49`, `skills/spec/templates/brief.md:66`, `:78`; the entry's sense.
- **step**: `docs/dev/change-standard.md:39` and its template copy ("a plan step"), `skills/refute/SKILL.md:62`, `:106` ("a code step"), `:172` ("The step under review"), `skills/spec/templates/brief.md:19`, `:25`, `:70`, `:75`, `:83`; the entry's sense, a plan step, including a code step.
- **worktree**: `skills/refute/SKILL.md:63`; a step's git worktree, the entry's sense.

The other hits of the helper are the same words in other senses and are not uses of the terms: **Closed** at `skills/spec/templates/brief.md:19` ("closed by the program reading it"), **place, of a point** ("in place of", "named place"), **part, of an output** (`skills/refute/SKILL.md:125`, "the report's terms part"), the **case** headwords "of a diagnosis" and "of a skill's description".

For each entry whose named place the diff changes, the line of that place that states the term, as `grep -n` prints it:

- **brief check**, **finding**, **question, the**, **Declined to judge**, **Closed** and **ADR** name `spec`, "Steps / The brief check", which the diff changes; they hold at `skills/spec/SKILL.md:230:1. Start one fresh agent as the effort agent ...`, `:243` (**The question.** ... "could this pass without the goal being reached?"), `:245` (**ADRs.** ... "is read for its part in force"), `:249` (the report with "Declined to judge"), `:253` (the report's "Closed" heading) and `skills/spec/templates/brief-check.md:54:## Declined to judge`, `:60:## Closed (the session's change ...`.
- **ADR** and **four headings** name `refute`, "The four headings", which the diff changes; they hold at `skills/refute/SKILL.md:102`, `:103` (the two ADR bullets) and `:95`, `:107`, `:118`, `:129` (the four heading labels).
- **Doc text** names `spec`, `templates/brief.md`, "Report"; it holds at `skills/spec/templates/brief.md:83:12. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document ...`.
- **stop** names `spec`, `templates/brief.md`; it holds at `skills/spec/templates/brief.md:23:When the first run finds a case the brief's own rules get wrong, the builder stops there, before changing any code ...`.
- **reviewer** names `refute`, Steps 1 and Rules, which the diff does not change; Steps 5, which it changes, is not a place the entry names.
- **case** and **first run** name `spec`, Steps 4, and `refute`, "The verdicts", which the diff does not change.

## Files, with line counts (after, before)

- `docs/dev/change-standard.md`: 89 (89), three lines changed in place.
- `skills/repo-setup/templates/docs/dev/change-standard.md`: 71 (71), the same three lines changed.
- `skills/spec/SKILL.md`: 298 (296).
- `skills/spec/templates/brief.md`: 83 (67).
- `skills/spec/templates/brief-check.md`: 62 (55).
- `skills/refute/SKILL.md`: 185 (181).
- `.scratch/2-h-session-retro/agents/reviews/3a-report.md`: 274, this report.

Line counts come from `wc -l` on the worktree and `git show 7e3dbc2:<file> | wc -l` for the before.

## Judgment calls

- Round 1 item 4 and the indent of the sub-bullet: the round brief says the sub-bullet is "indented three spaces more", and its fenced text shows it two more. The file has two more (five spaces), as the fence shows and as the neighbours are indented (`skills/spec/SKILL.md:38` has five spaces under a three-space bullet). See "Anything wrong or impossible".
- Round 1 item 7: the terms list is the helper's hits read one by one; a hit that is the same word in another sense is left out and named as such.

The brief left none open.

## Sentences longer than the prose standard allows

Sentences the diff adds or changes past the prose standard's "roughly 20 words" (E, "Sentence length"), not rewritten since their words are ruled. Each stays one sentence because it states a requirement together with the qualifier that changes it, which "Lists and tables" of `docs/dev/skill-layout.md` keeps in one bullet, and where a parenthesis lists kinds the list is the content.

- `docs/dev/change-standard.md:43` and its template copy, 40 words: the action the builder takes, what it quotes and where. `:44`, 57 words, the rule 13 sentence on the table with its columns, and 29 words, the sentence on a case of preserved behaviour.
- `skills/refute/SKILL.md:62`, 50 words: what the reviewer checks and the two things it does. `:63`, 40 words: where the change is made, how, and when the copy is removed. `:117`, 52 words (the old bullet was 44): the kinds of test in a parenthesis and the two ways it is found out. `:125`, 28 words.
- `skills/spec/SKILL.md:246`, first sentence, 44 words: five kinds of text in a parenthesis and the two things the read is against.
- `skills/spec/templates/brief-check.md:49`, 41 words, `:50`, 21 words, `:52`, 29 words: the placeholders of section 8, as long as the seven before them.
- `skills/spec/templates/brief.md:19`, 98 words: one placeholder bullet that lists the forms of implied input and what to state for each. `:25`, 36 words: three actions on one case, in order. `:66`, 29 words. `:74`, 23 words. `:75`, 32 words. `:76`, 40 words. `:77`, 36 and 31 words. `:83`, 53 words (the sentence of the old paragraph, its words kept).

## Visible changes, before and after (this round)

- Rule 13 of the change standard, both copies. Before: "the report's table gives that change and the test's failing line; the reviewer checks it by reading the test and by a change of its own", and a table of the behaviour, the case, the failing line, the small change and the failing line with it made. After: the builder quotes the failing line with the change made in the table the next bullet gives, the reviewer checks it by reading the test and by a change of its own on a scratch copy, and a case of a behaviour the change preserves has a row with its passing run on the unchanged tree.
- `skills/spec/templates/brief.md`. Before: the "Cases" bullet gave "the exit status and the error line" for every script input, and "Report" had eleven parts. After: the error line is given when the script refuses the input, "Report" has twelve parts (part 7 asks for each sentence that item 5 of "Verify before you report" names, with its reason), and the table part and the DONE / NOT DONE part name their objects as the ruling words them.
- `skills/spec/SKILL.md`. Before: the **Dictated text** bullet held three sentences. After: two sentences, and the third is a sub-bullet.
- `skills/refute/SKILL.md`. Before: the reviewer's own change was named only in the Proof bullet, as one of two ways, and the Anti-patterns row forbade edits to the worktree and the main checkout; Steps 5 had no sub-bullets. After: Steps 5 has the two sub-bullets that make the change and say where, the Proof bullet says the test is found out by reading it and by that change, the Standards bullet names a term whether or not the report's terms part names it, and the row forbids an edit outside the reviewer's scratch copy.

## Anything wrong or impossible in this round's text

- Item 4, indent of the sub-bullet. The round brief says "indented three spaces more" and "in the file the first keeps the indent it has and the second has three spaces more than it". Its fenced text is `sed -n '26,27p' 3a-round-1.md | sed 's/ /_/g'`: `______-_**Dictated_text.**` and `________-_Each_claim`, six and eight spaces, two apart. The fence sits at three spaces, so in the file the first line has three and the second five. The file has five. Every neighbour is indented that way: `sed -n '38p' skills/spec/SKILL.md` has five spaces under a three-space bullet. If the sub-bullet should be at six spaces, the change is one space on `skills/spec/SKILL.md:247`; the orchestrator decides.
- Item 6, Steps 5 of `refute`. Check 6 asks that Steps 5 "still ends on its completion criterion, the two sub-bullets under it". The item's completion criterion is the clause "until every item of the brief's \"What to build\" and every case of its \"Cases\" has a verdict" in its own line (`skills/refute/SKILL.md:61`); the two sub-bullets come after it, so the last line of the item is now "the folder is removed before the report is written.", a step of the work that leaves a state (the folder gone) but does not restate the criterion. `docs/dev/skill-layout.md`, "Writing for an agent", says each item of Steps ends on its completion criterion. The texts are dictated and are placed as given; the orchestrator rules whether the two sub-bullets belong before the criterion.

## Sentences about a changed file as a whole (rule 14)

- "one heading per check of item 2" in `skills/spec/SKILL.md:249` holds: `sed -n '239,247p' skills/spec/SKILL.md` lists eight check bullets (Names, The step line, Premises, Cases and checks, The question, Implied inputs, ADRs, Dictated text with its sub-bullet), and `grep -n '^## ' skills/spec/templates/brief-check.md` lists `## 1. Names` at 5, `## 2. The step line` at 11, `## 3. Premises` at 17, `## 4. Cases and checks` at 23, `## 5. The question` at 29, `## 6. Implied inputs` at 35, `## 7. ADRs` at 41, `## 8. Dictated text` at 47, in the same order.
- The introduction of `skills/spec/templates/brief-check.md`, line 3, holds: section 8's first bullet names the rule "with its file and section" (`brief-check.md:49`), and its second bullet asks the command and its output (`:50`), which are grep hits and keep their line.
- The description of `skills/refute/SKILL.md`, line 3, "Review a built step without changing anything ... findings under four headings", holds: the four heading labels stand at lines 95, 107, 118 and 129 and the diff adds no fifth; the reviewer's change is made on a scratch copy outside the worktree and the main checkout (`refute:63`), so the step is unchanged.
- The opening paragraph of `skills/refute/SKILL.md`, line 10, "dispatches one reviewer, who changes nothing", holds for the same reason; the findings' place and failure scenario (`refute:130`) are unchanged.
- `skills/refute/SKILL.md:41` ("`git diff <base>` and `git status --short`, read-only, are the only git the reviewer runs") holds: the scratch copy is made with `cp` (`:63`), which is not git. `:180` ("The reviewer never writes into the ledger itself") holds: the copy is under `$TMPDIR`. `:181` ("runs the commands this skill names") holds: Steps 5 now names `cp` and the test's run.
- `skills/spec/SKILL.md:102` ("The report shape, with the cases' first run before the result table") holds with the twelve parts: part 3 is the first run and part 5 the table.
- The opening line of "Report" in `skills/spec/templates/brief.md:70` ("with these parts in this order") holds: `sed -n '70,84p' skills/spec/templates/brief.md | grep -c '^[0-9]*\. '` counts the twelve parts, numbered 1 to 12.
