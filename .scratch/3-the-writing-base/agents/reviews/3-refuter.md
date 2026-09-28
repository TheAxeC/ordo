# Step 3 refuter report (on .agents/worktrees/3-3, base 755bcf9)

Reviewer: a fresh claude:opus agent, read-only. Usage: 156,305 tokens, 34 tool uses, 542 s.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit 0

$ python3 -B skills/writing/templates/check_prose.py skills/writing/references/academic-prose.md skills/writing/references/judgment.md skills/writing/references/anti-patterns.md; echo "exit $?"
skills/writing/references/academic-prose.md:96: throat-clearing: "in order to": a throat-clearing opener, to be cut
skills/writing/references/academic-prose.md:102: vague: "many": a vague qualifier, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:18: flagged: "landscape": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:18: flagged: "navigate": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:18: flagged: "paradigm": a flagged word, to be checked against section A of the prose standard
skills/writing/references/anti-patterns.md:18: flagged: "robust": a flagged word, to be checked against section A of the prose standard
exit 1
(each of the six is inside a quoted example on its line)

$ LC_ALL=C grep -n '[^ -~]' <the three pages> 3-rows.md 3-report.md; echo $?
(no output) 1

$ git status --short --untracked-files=all
?? .scratch/3-the-writing-base/agents/reviews/3-report.md
?? .scratch/3-the-writing-base/agents/reviews/3-rows.md
?? skills/writing/references/academic-prose.md
?? skills/writing/references/anti-patterns.md
?? skills/writing/references/judgment.md

$ grep -c '^| ' .scratch/3-the-writing-base/agents/reviews/3-rows.md
145

Own coverage check (every non-blank source line except fences, separator rows and "---" matched against the "Source lines" column):
academic_writing_style.md rows 74 need 135 listed 135 missing [] extra [] dup {}
writing_judgment_framework.md rows 29 need 39 listed 39 missing [] extra [] dup {}
writing_quality_check.md rows 39 need 123 listed 123 missing [] extra [] dup {}

Probes: "It is important to note that the rate rose." gives no flag; three "Not speed. Accuracy." pairs give no contrast flag; three "It is not about X, it is about Y." give three contrast flags; five sentences of 20, 22, 24, 21, 23 words give no flag; five of 20, 21, 22, 21, 20 give an equal-length flag.
```

Every row of the three records was read against its source lines and its destination line.

## 1. Spec

1. `judgment.md:47`: "Lead with the finding, then the statistical test". Source `writing_judgment_framework.md:45`: "Lead with the finding, not the statistical test". A requirement added (rule 17); `3-rows.md:117` does not show the change.
2. `anti-patterns.md:5-19` and `:43`: the source's two-sentence contrast "Not X. Y." (`writing_quality_check.md:125`) is not found by the `contrast` check (one sentence only), yet line 43 and `3-rows.md:158` say the script finds it; the table lacks it.
3. `academic-prose.md:96`: says section C covers "it is important to note that"; section C and `THROAT_PHRASES` hold only the contracted "It's important to note that", and the full form is not flagged. Not in the anti-patterns table; `3-rows.md:61` does not record the gap.
4. `anti-patterns.md:44`: equal-length runs within the source's "narrow range (e.g., all between 20-25 words)" are found only at a spread of 2 words (20, 22, 24, 21, 23 not flagged). The page does not say so; `3-rows.md:161` cites "brief decision 4", which is about the throat-clearing forms.
5. `3-rows.md:144`: the semicolon fix "Reserve semicolons for closely related parallel structures" (source line 68) is recorded as not repeated, but the prose standard does not hold it; no reason is given.
6. `3-rows.md:145`: the colon-list fix "Integrate list items into prose, or use a single consolidated list" (source line 73) is recorded the same way; the prose standard does not hold it, and its section D line 53 points the other way.

## 2. Proof

1. `3-rows.md:9`, `:92`, `:130`: "Rule-bearing lines listed: 74 / 29 / 39" are the row counts; the records list 135, 39 and 123 source lines. Case 3's equality compares the row count with itself. The coverage property itself reproduces.
2. Report, case 5, third pair: "We used thematic analysis." (`academic-prose.md:53`) is a method sentence in the first person, which lines 18 and 25 do not allow; the claim of no contradiction does not hold.
3. Report, case 5, first pair: `anti-patterns.md:36` and `:44` name the prose standard's section E as the rule for these runs in a manuscript, so the claim that the standard is for this tree's pages only does not hold.

## 3. Standards

1. `anti-patterns.md:26`: "Method. Low variation is acceptable" contradicts `prose-standard.md:64` (five or more sentences of the same length are rewritten), which the same page names at line 44 (rule 19). The brief does not say which wins.
2. `academic-prose.md:53`: "We used thematic analysis." conflicts with lines 18 and 25.
3. `anti-patterns.md:3` and `:5`: "the anti-patterns ... that `check_prose.py` does not find" and "Patterns the script does not find", while row 18 is a word the `flagged` check finds and row 19 a pattern line 44 lists as found.
4. The pages' own prose: the opening sentences run to 45 (`academic-prose.md:3`), 44 (`judgment.md:3`) and 35 words (`anti-patterns.md:3`) and pack three to eight list items into a sentence (section E, section D line 53); the second sentence is identical on all three pages (section 0, no repeated construction); `judgment.md:38` runs to 30 words.
5. `academic-prose.md:79`: "holds one idea" restates `prose-standard.md:48` beside naming section D.
6. `judgment.md:32`: "Hard sciences | Impersonal, passive, hedged" states the passive with no word on `prose-standard.md:63`, which ruling 5 reconciles only at `academic-prose.md:25`.

## 4. Behaviour

- none

## Not checked

- The cases' first run on the unchanged tree.
- `cases.py` read in full; its cases 2 and 3 were replaced by the reviewer's own reading and coverage script.
- The report's case-2 listing diffed line by line; every row was read against source and destination instead.
- The report's case-5 greps group by group; the three named pairs were judged by reading.

## Repair round 1, refuted (on .agents/worktrees/3-3, base 755bcf9)

### Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/3-the-writing-base/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
PASS: check_prose.py scratch tests
verify: 8 commands passed
exit 0
```

Seven PASS lines for 8 commands: the first seven end in `| tail -1`, and `verify.sh` prints only their last line. The eighth is the ASCII perl check, whose output on a pass is empty. The summary counts `len(commands)` (`verify.sh`:241).

```
$ python3 -B skills/writing/templates/check_prose.py <each page>; echo "<page> exit $?"
skills/writing/references/academic-prose.md:96: throat-clearing: "in order to": a throat-clearing opener, to be cut
skills/writing/references/academic-prose.md:102: vague: "many": a vague qualifier, to be checked against section A of the prose standard
academic-prose exit 1
judgment exit 0
skills/writing/references/anti-patterns.md:20: flagged: "landscape": ...
skills/writing/references/anti-patterns.md:20: flagged: "navigate": ...
skills/writing/references/anti-patterns.md:20: flagged: "paradigm": ...
skills/writing/references/anti-patterns.md:20: flagged: "robust": ...
anti-patterns exit 1
(identical to 3-report.md:632-643)

$ python3 -B <scratchpad>/coverage.py <scratchpad>
academic_writing_style.md rows 74 need 135 listed 135 missing [] extra [] dup {}
writing_judgment_framework.md rows 29 need 39 listed 39 missing [] extra [] dup {}
writing_quality_check.md rows 39 need 123 listed 123 missing [] extra [] dup {}

$ python3 -B <scratchpad>/cases.py 1   -> exit 1, six QUOTED lines as at 3-report.md:683-688, "case 1: HOLDS"
$ python3 -B <scratchpad>/cases.py 2   -> exit 0; diff against 3-report.md:695-872 printed nothing
$ python3 -B <scratchpad>/cases.py 3   -> "case 3: HOLDS"; diff against 3-report.md:878-949 (em dash restored) printed nothing
case 3 control (record 3 count line set to 122): "case 3: FAILS"
second control (the "Too long" row's source line 59 changed to 58): "uncovered: [59]", "in two rows: [58]", "case 3: FAILS"
$ python3 -B <scratchpad>/cases.py 4   -> diff against 3-report.md:965-990 printed nothing, "case 4: HOLDS"
$ python3 -B <scratchpad>/cases.py 5   -> "case 5: HOLDS" (the groups differ from the report's quote, Proof 4)
$ LC_ALL=C grep -n '[^ -~]' skills/writing/references/*.md <ledger>/3-rows.md <ledger>/3-report.md; echo $?
1   (no output)
$ git status --short --untracked-files=all
?? .scratch/3-the-writing-base/agents/reviews/3-report.md
?? .scratch/3-the-writing-base/agents/reviews/3-rows.md
?? skills/writing/references/academic-prose.md
?? skills/writing/references/anti-patterns.md
?? skills/writing/references/judgment.md
$ python3 -B <scratchpad>/longs.py <the three pages>   -> the six sentences of 3-report.md:650-653, nothing else

Probes:
throat.md: the five named openers and "It is important to note that": no throat-clearing flag; "It's important to note that" and "In order to": flagged.
contrast2.md: three "It's not about X, it's about Y." -> three contrast flags.
contrast.md: "Not speed. Accuracy. Not size. Weight. Not cost. Value." -> no contrast flag.
dash.md: the one-sentence form joined by an em dash, a colon, a semicolon and a comma -> a contrast flag only for the comma form.
equal.md: 20, 25, 22, 24, 23 words -> no flag; 20, 22, 21, 20, 22 -> equal-length flag.
flag.md: paradigm, landscape, robust, navigate -> four flagged lines.
```

All fourteen rulings are made at the file and line the report names. The reruns reproduce the closures of Spec 1 to 6, Proof 1 to 3 and Standards 1, 3, 5 and 6.

### 1. Spec

1. `anti-patterns.md:21` "Five or more sentences within a narrow range wider than 2 words, such as all of 20 to 25 words" drops "consecutive" (source line 142 "5+ consecutive sentences"; ruling 4 "a run"). As written, any five sentences anywhere match. Change standard rule 18.
2. The round changed six sentences no ruling names, and the report's ruling table does not list them (rule 7): `academic-prose.md:25`, `:121`, `judgment.md:7`, `anti-patterns.md:12`, `:22`, `:35`. Two change meaning (rule 17): `anti-patterns.md:12` "every section with one internal structure" no longer says the sections share a structure (source line 130 "the same internal structure"); `anti-patterns.md:22` turns the source's alternatives (lines 145-147) into three commands, and the combine fix still lacks "if the pattern is monotonously short" (source line 146; rule 18).

### 2. Proof

1. `3-rows.md:158` says the one-sentence form is found by `contrast`. The source's form (line 125) is joined by an em dash, and the script counts the one-sentence form only when a comma joins it. `anti-patterns.md:13` covers only the two-sentence form, and line 46 names only the comma form, so the dash, colon and semicolon forms are neither found nor listed.
2. `3-report.md:579-580` gives 49 and 44 lines; `wc -l` gives 51 and 47. The judgment calls at `3-report.md:585-586` name `anti-patterns.md` lines 32 and 28, now 35 and 31.
3. `3-report.md:993` "case 5: HOLDS": `case5()` returns whether the pages exist, so it holds whatever the greps show, and no revert turns it red (rule 13). The verdict rests only on the reading at `:1036-1043`.
4. `3-report.md:995-1033` is quoted "as printed", but the rerun also prints `check_prose.py:28`, `:30`, `:60`, `:94` in the equal-length group and `anti-patterns.md:43`, `prose-standard.md:13` in the colon-list group; the note at `:1035` names only the docstring lines as left out.
5. For the landing: `3-report.md:3-5` quotes open item C "verbatim" from the worktree's state file; on main open items are "None." and C is under Closed items.

### 3. Standards

1. `judgment.md:3` and `anti-patterns.md:3` open with the same construction ("This page holds ..."), against prose standard section 0 and ruling 11. `judgment.md:3` "It serves the `writing` skill's reading of a draft" is spec-sheet voice (section E).
2. `anti-patterns.md:3` and `:5` use "the reader" for whoever judges a script report; `anti-patterns.md:11` and `judgment.md:17-26` use it for the text's audience. Section D, one term per concept.
3. `anti-patterns.md:39` "Each of these is reported by a check of `templates/check_prose.py`, and the rule is in the prose standard:" no longer holds for lines 43 and 44, which carry fixes the prose standard does not state (rule 14).

### 4. Behaviour

none

### Not checked

- The round's exact delta: no snapshot was recorded; the reconstruction from the case 2 output covers only lines a record row names. The pages were read whole.
- Rows the round did not touch were not re-read against their source lines; the re-read covered rows 61, 108, 117, 144, 145, 147, 158, 161, 166 and the three count lines.
- The round-0 sections of the report (lines 1-596), apart from the Files table and the judgment calls.

Reviewer usage: 183,552 tokens, 41 tool uses, 601 s.

## Closed

The first review:
- Spec 1 to 6: closed in repair round 1 (rulings 1 to 6); the round's reviewer reproduced each closure.
- Proof 1 to 3: closed in repair round 1 (rulings 7 and 14); the coverage check prints `missing [] extra [] dup {}` for all three records, and the case 3 control prints `case 3: FAILS`.
- Standards 1, 3, 5 and 6: closed in repair round 1 (rulings 8, 10, 12 and 13), reproduced by the round's reviewer.
- Standards 2 and 4: closed in repair round 1 (rulings 9 and 11); the parts of Standards 4 the round's reviewer found still open are closed at landing, below.

The review over round 1:
- Spec 1 ("consecutive" dropped): fixed at landing. `anti-patterns.md:22` reads "Five or more consecutive sentences within a narrow range wider than 2 words, such as all between 20 and 25 words".
- Spec 2 (six sentences changed that no ruling names): `anti-patterns.md:12` fixed at landing ("every section with the same internal structure", as source line 130). `anti-patterns.md:23` fixed at landing: the fixes are alternatives joined by "or", and the combine fix carries source line 146's condition "if the pattern is monotonously short"; `3-rows.md` row for source lines 144-147 says so. The other four (`academic-prose.md:25`, `:121`, `judgment.md:7`, `anti-patterns.md:36`) keep their rule, which the round's reviewer found; `academic-prose.md:121` is also changed at landing by Standards 2.
- Proof 1 (the one-sentence contrast joined by a dash, a colon or a semicolon): fixed at landing on the page. `anti-patterns.md:14` is a row for that form, which the `contrast` check does not count; `3-rows.md` row for source lines 124-127 says the check counts the one-sentence form only when a comma or "but" joins it. Whether the script should count those forms is raised to the user as open item D.
- Proof 2 (the Files table and two judgment-call line numbers): fixed at landing in `3-report.md` (51 and 48 lines, `anti-patterns.md` lines 36 and 32).
- Proof 3 (case 5's HOLDS checks only that the pages exist): fixed at landing in `3-report.md`, which now says the verdict rests on the reading of the groups.
- Proof 4 (the case 5 output quoted as printed): fixed at landing in `3-report.md`; the note names every line left out of the excerpt.
- Proof 5 (open item C quoted from the worktree's state file): fixed at landing in `3-report.md`, which says open item C was ruled and is step 2a.
- Standards 1 (the openings of `judgment.md` and `anti-patterns.md`): fixed at landing. `judgment.md:3` reads "Some choices in a draft are settled only by judgment, since no word list or script can decide them. The `writing` skill and each writing skill built on it use these judgments when they read a draft."; `anti-patterns.md:3` opens "The patterns in the table below are judged by hand."
- Standards 2 ("the reader" for whoever judges a report): fixed at landing. The heading is "Patterns judged by hand", `anti-patterns.md:3` says "judged by hand", and `academic-prose.md:121` says a dash inside a quotation "is left to be judged by hand"; "the reader" is left only for the text's audience.
- Standards 3 (the lead-in of the script's list): fixed at landing. `anti-patterns.md:40` reads "Each of these is reported by a check of `templates/check_prose.py`. Each entry names the section of the prose standard that holds the rule, and some add the fix:".
- The records: every `anti-patterns.md` line number in `3-rows.md` at line 14 or later is moved down one for the added row; a script printing each record's line of the page showed each pointing at its rule.
