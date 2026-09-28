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
