# Step 3 brief check (on main at ddfd40e)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

State read: `git log --oneline -3` prints `ddfd40e Book the ruling on how the fix of step 3 of plan 3 is carried` at the head; `git status --short` prints ` M .scratch/3-the-writing-base/orchestrator-state.md` and `?? .scratch/3-the-writing-base/agents/briefs/3.md`, so the tree the checks read is ddfd40e apart from the state file and the brief.

## 1. Names

The step renames no file, heading, key or function. It changes the wording of the prompt's two-rule bullet, adds bullets on rules judged over a section, a paragraph's first sentence and the whole draft, and changes line 4 of `expected.md`.

- The two-rule bullet (`skills/writing/SKILL.md:100`, "A passage that breaks two rules stands once, in the first group in that order, and its finding names the other rule on a line of its own."). Command: `grep -rn --exclude-dir=.git -e 'breaks two rules' -e 'Review agent prompt' -e 'never changed after them' -e 'on a line of its own' . | grep -v '^./.scratch/3-the-writing-base/agents/reviews/3-writing' | cut -c1-300`. The hits outside the brief's "Paths this step writes", as printed (the command cuts each line at 300 characters):
  - `docs/glossary.md:46:- **finding**: ... Also, for `/writing`, a passage of a draft that breaks a named rule, given with its place, the quoted passage and the rule it breaks ...`. Not made false: a finding still stands under one rule and names its other rules on their own lines.
  - `.scratch/3-the-writing-base/agents/briefs/1.md:46`, `:143`, `.scratch/3-the-writing-base/agents/briefs/2.md:26`, `:67`, `.scratch/3-the-writing-base/agents/reviews/1-report.md:1888`, `:1962`, `.scratch/3-the-writing-base/agents/reviews/2-report.md:587`, `.scratch/3-the-writing-base/agents/reviews/2-refuter.md:176`. These are ledger records of steps 1 and 2 that quote the bullet as it stood. Not made false: they say what those steps had.
  - The archived ledger hits (`.scratch/archive/...`) use "breaks two rules" or "on a line of its own" in other senses. Not made false.
  - Inside the paths, with no requirement: `.scratch/3-the-writing-base/cases/expected.md:11:- A passage that breaks two rules stands once, in the first group in the order of the review prompt (...), and the finding names ...`. The full line goes on: "A row of such a passage gives the group it stands in and the other rule it names. The same passage has one row for each of the two rules, and the two rows say the same." Item 1's second bullet ("names on its own line each other rule the passage breaks") makes this "How the tables read" bullet cover two rules where the prompt then covers any number. Item 2 asks for each row, place and count to be made true, but asks nothing of this bullet. Its "one row for each of the two rules" is also false on the tree today. The rows at `sections.tex:177` and `:179` (`expected.md:46`, `:47`) name both "B. Punctuation / Em dash and dash-as-aside" and "B. Punctuation / ASCII throughout". The only ASCII break rows (`expected.md:74`, `:75`, `:76`) list `sections.tex:203`, `:205`, `:209` and `:211`, and no ASCII row lists `:177` or `:179`. Item 2's third bullet ("Each row names every rule its passage breaks") does not say whether a passage needs a row for each rule it names.
- `grep -rn --exclude-dir=.git -e 'first group' -e 'other rule' -e 'judged over' -e 'judged on a whole draft' -e 'judged on a paragraph' skills docs utils README.md agents` prints, for the prompt's wording, only `skills/writing/SKILL.md:100:- A passage that breaks two rules stands once, in the first group in that order, and its finding names the other rule on a line of its own.` The other hits (`skills/diagnose/...`, `skills/repo-setup/...`, `docs/glossary.md:72`, `docs/adr/0002-...:11`) use "other rule" or "other input" in unrelated senses. No hit outside the paths is made false.
- Line 4 of `expected.md`. Command: `grep -rn --exclude-dir=.git -i -e 'never changed after' -e 'changed after its second run' -e 'expected results are read' . | cut -c1-220`. Hits outside the paths: `.scratch/3-the-writing-base/agents/briefs/2.md:73`, `.scratch/3-the-writing-base/agents/reviews/2-report.md:52` and `.scratch/3-the-writing-base/agents/reviews/2-brief-check.md:184`, all quoting "The expected results are read against the reports of step 3 and are never changed after them." These are step 2's records, not made false.
- The user-visible descriptions of `/writing`'s report: `README.md:26` ("It reports each break of a named rule with its place, the quoted passage and what the rule asks for, grouped by rule, and proposes no replacement"), the `description` in `skills/writing/SKILL.md` and `docs/roadmap.md:24`. None is made false by item 1.

Findings: `expected.md:11` (inside the paths) restates the two-rule bullet that item 1 changes. No item asks for it to change, so after the change it covers two rules only. Its "one row for each of the two rules" is already untrue for the rows at `sections.tex:177` and `:179`. The brief should either have item 2 make that bullet true of the changed prompt and say whether each named rule needs its own row, or say why it stays.

## 2. The step line

The parts of step 3's line that concern the repair round:

- "a builder agent with a brief from `/spec`, reviewed once by `/refute` and landed by `/land`": the brief's opening paragraph ("This is the one repair round of step 3 ..."). This is the session's process, and needs no build requirement.
- "changes the review agent prompt in `skills/writing/SKILL.md` so that the agent judges every rule that applies to a section or to the whole draft against each section": item 1, first bullet. The brief judges section rules against every section, adds the rules judged on a paragraph's first sentence against every paragraph, and judges whole-draft rules "once over the whole draft, with the count it finds". The step line's words say whole-draft rules are judged "against each section".
- "and names every rule a passage breaks": item 1, second bullet.
- "and rewrites the case files of `cases/` so that no clean passage breaks a rule": item 2, first, fourth and fifth bullets.
- "and every row of `cases/expected.md` is right": item 2, third and sixth bullets, plus the line-4 bullet.
- "writing them in a scratch folder outside both repositories that the brief names": item 2's opening (`<cases>` = `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases`) and "Paths this step writes".
- "which the session copies into `cases/` before `land.sh` runs": the paragraph under "Paths this step writes". This is the session's work.
- "then a new tag and pin, and the nine runs once more, their reports the ones the check reads": the opening paragraph. This comes after the landing and is no builder requirement.

Findings: none without a requirement. One part is served under a different reading. The step line has whole-draft rules judged "against each section", and item 1 judges them once over the whole draft. The brief's reading fits rules such as the semicolon count per 1000 words, which a per-section count would get wrong. The difference is not stated in the brief, so the orchestrator should confirm the reading or have the brief say it.

## 3. Premises

- `skills/writing/SKILL.md` is "128 lines". `wc -l skills/writing/SKILL.md` prints `127 skills/writing/SKILL.md`. `git show ddfd40e:skills/writing/SKILL.md | wc -l` prints `127`, and `awk 'END{print NR}'` prints `127`. The file ends in a newline (`tail -c 50 ... | od -c` ends `.  \n`). Does not match.
- `metadata.version` "1.0.0": `cat -n` line 5 is `  version: "1.0.0"`. Matches.
- "Review agent prompt" is lines 74 to 103: `grep -n '^## ' skills/writing/SKILL.md` prints `74:## Review agent prompt` and `105:## Stops`, and line 103 is the last bullet, "When the draft breaks no rule, the report says so.". Matches.
- No bullet makes the agent check a section, paragraph-first-sentence or whole-draft rule against each section. Read lines 76 to 103: no such bullet. Matches.
- The two-rule bullet quoted: line 100 reads exactly as the brief quotes it. Matches.
- `diff -r skills/writing ~/.claude-backup/skills/writing; echo "exit $?"` prints `exit 0` with nothing before it. The pinned copy is a link (`readlink` prints `/Users/axelfaes/.local/share/ordo-stable/skills/writing`), and `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.1.0-rc.1`. Matches.
- "The skill was made in this plan (step 1) at version 1.0.0": `git log --format='%h %s' -S'version: "1.0.0"' -- skills/writing/SKILL.md` lists `6105b48 Land step 1 of plan 3, the writing base` first. `git show v8.0.0:skills/writing/SKILL.md` prints `fatal: path 'skills/writing/SKILL.md' exists on disk, but not in 'v8.0.0'`. The quoted sentence of `docs/dev/skill-layout.md`, "Frontmatter", is there word for word. Matches.
- The case files: `ls -R` in `.scratch/3-the-writing-base/cases` lists `expected.md` and the four folders, each with `draft.docx`, `draft.html`, `main.tex` and `sections.tex`. `wc -l` prints `242 expected.md`. Matches.
- Line 4 of `expected.md`: `sed -n 4p` prints `The expected results are read against the reports of step 3 and are never changed after them.` Matches.
- The nine reports and `3-gate-reading.md`: `ls` in `agents/reviews` lists `3-gate-reading.md` and `3-writing-{engineering,medicine,sciences,social}-{tex,docx}.md` plus `3-writing-nwo-xs.md`. Matches.
- The four kinds of fault: `cat -n 3-gate-reading.md`. The missed rules are at lines 9 to 16, 30, 47, 61, 115 and 123. The "five of the eight runs" is at line 123. The "Seven passages" is at line 124. The rows of one rule for two are at lines 18 and 73 to 79. The arrow row is at line 20 ("`->` is ASCII, so that row is wrong"). The five landing sentences are at line 126, and the clean-row breaks at lines 38, 54, 69, 106 and 111. Each matches the brief's summary. `docx_paragraphs.py engineering/draft.docx | grep -E '^(64|66): '` and `grep -n -F` confirm the places: `64: The growing pool created 248 threads ...`, `66: The throughput of the fixed pool on the fourth host ...`, `medicine/main.tex:43` ("Each group held 240 patients. ..."), `sciences/main.tex:19` ("Species richness, the number of species in a plot, was expected ...") and `sciences/main.tex:49` ("Plots wider than 5 m held 16 species on average. Richness therefore kept rising ..."). Matches.
- The character-set check skips `cases/`: `grep -n 'cases' docs/dev/building.md` prints line 11, the command with the arms `.scratch/archive/*/cases/*) continue` and `.scratch/*/cases/*) continue`. The fenced block runs from line 5 to line 12, so line 11 is its last command. Matches.
- The rules file's "Where the work happens" says "Nothing under the ledger folder is edited except the report the brief names." (read in full). The ruling "Step 2, the brief check" is in `plan.md` Rulings. `ls -d /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-3-cases` prints `ls: ...: No such file or directory`. Matches.
- ADRs 0001, 0002, 0003 and 0012, and their quoted sentences: read in full. The quotes match their Decision sections (0003 with an ellipsis for "on the model the configuration's `reviewer` names at `reviewer_effort`,"). Matches.

Findings: one premise differs. The brief says `skills/writing/SKILL.md` has 128 lines, and `wc -l` on main at ddfd40e prints 127.

## 4. Cases and checks

- C1, the section rules: consistent with the rules file (rule 1, a defect in a skill's instructions is fixed by reading) and with `docs/dev/skill-layout.md`.
- C2, the second rules: consistent.
- C3, the rest of the prompt: consistent. "Checked with `diff` against the base" is a comparison of two texts, which "Scripts compute facts; judgment is read" allows.
- C4, the unlisted breaks: consistent with C9 and item 2's second bullet. It is inconsistent with item 2's first bullet, as the finding below says.
- C5, no break lost: inconsistent with item 2's third bullet and C6. C5 asks that every break row "stands in the new one with the same rule and the same group". Item 2's third bullet settles the three sciences rows by having each row name every rule its passage breaks, in the prompt's order. The base rows read "Reported under Sciences (Natural, Applied) / Register" (`sections.tex:15`), "Reported under Sciences (Natural, Applied) / Terminology" (`main.tex:27`) and "Reported under Sciences (Natural, Applied) / What the reader looks for" (`sections.tex:1`). `3-gate-reading.md` says these passages also break "Reader's path / Clarity test", "Reader's path / Clarity test" and "Reader's path / So what per section". Those rules are in `references/rules.md`, which comes before `references/registers.md`. A row that names them moves its group from the register heading to the `rules.md` heading, and C5's "same group" then fails. Item 2's second bullet allows the other way out (rewriting the passage to break only its row's rule), but C5 as worded leaves the builder only that way. The engineering "modern server" row keeps its group, since "Precision / Most specific term" comes before "Common style errors / Vague phrase".
- C6, the two-rule rows: consistent.
- C7, the places: consistent. A row whose passage is "(the heading)" or spans several sentences is checked by reading, not by one `grep -n -F`. The case already says "and reading" only for C8, so a builder may read C7 more narrowly.
- C8, the counts: consistent.
- C9, the clean text: consistent.
- C10, the two forms: consistent.

Findings:
- C5's "the same group" contradicts item 2's third bullet for the three sciences rows. Settling them by naming the second rule moves their group to "Reader's path". C5 should say "the same rule", with the group as the prompt's order gives it, or the brief should say which way the three rows are settled.
- Item 2's first bullet contradicts its second bullet and C4. The first bullet says: "Each break that `3-gate-reading.md` lists under 'Reports in passages the tables do not list' and under the clean rows is removed by rewriting that passage so it keeps every rule." That list includes break passages: the engineering `.docx` paragraphs 98 ("The fixed pool is small, compact and light.", the "D. Structure / No rule of three" break row) and 128 (the "Paragraphs cover one idea" break row) at `3-gate-reading.md:43`, and paragraph 66 (the "Sentence length" break row) at `:40`. Rewriting those passages "so it keeps every rule" would remove their rows' breaks, which the second bullet forbids. The second bullet and C4 allow naming the extra rule in the row instead. The first bullet should cover only passages that no row lists or that a clean row lists, and point break passages to the second bullet.
- No case asks the builder to check, quote or explain a place the step does not change. Every case reads `SKILL.md`, the drafts or `expected.md`, all of which the step writes.

## 5. The question

The goal here is the part of the plan's goal the step delivers: a `/writing` review agent that finds every break of a named rule at its place, and case files whose clean passages break no rule.

- C1: yes. Reading the bullets shows that the instruction is in the prompt, not that the agent then finds the section, paragraph and whole-draft breaks. The second run of the nine, after the new tag and pin, is the only check of that behaviour. No check of the round can test the agent before the round lands, since the runs need the pinned copy.
- C2: yes, for the same reason. It shows the instruction, not that the agent names each second rule.
- C3: yes, but C3 checks that the rest of the prompt is preserved and asks nothing of the goal.
- C4: yes on its own. It reads each rewritten passage only "against the rule the reading named", so a rewrite that breaks another rule passes C4. C9 closes that gap.
- C5: yes. It guards against losing breaks, which is no part of the goal.
- C6: no. A row that leaves out a rule its passage breaks fails the reading.
- C7: no for the places. They are facts that `grep -n -F` and `docx_paragraphs.py` compute.
- C8: no for the word and semicolon counts, which are computed. The paragraph, sentence and contrast counts are read.
- C9: yes. It is the builder's own reading of drafts it wrote, the same kind of check that let the step 2 breaks of `3-gate-reading.md` through. The refuter's reading and the second run are the later checks. Such a check is judged by reading, as "Scripts compute facts; judgment is read" says, and the brief names no other check.
- C10: no for the two forms. `docx_paragraphs.py` prints what the `.docx` holds.
- The check on the step line (the case reports read against the expected results, nothing reported in the clean passages, the user reads the real report for false alarms, the grouping, one fresh agent): yes, in one way. A clean passage that breaks a rule which the second run's agent also misses passes both the agent and the reading of its report, and the case file still holds the break. Also, item 1 makes the agent judge each section rule "against every section of the draft in turn". The real draft is the NWO XS grant, whose sections match no row of "So what per section" or "Tense per section". The first-run report `3-writing-nwo-xs.md` already has groups for "Common style errors / Tense per section" and "Medicine and Health / What the reader looks for" (`grep -n '^#'` lines 128 and 138). Only the user's reading for false alarms checks that the new bullets do not add findings at sections that have no row. The existing bullet "only where the rule's own words describe the break" is the prompt's guard, and the brief does not ask the new bullets to keep to it.
- The check of item 1 (C1 to C3): yes, as for C1 and C2. Two points in item 1's own text bear on whether the agent can reach the goal:
  - Item 1 counts "the limitations of a methods or discussion section" among the rules judged over a section. The rule's words, in `references/rules.md` "Objectivity / Limitations and alternative interpretations", judge the whole text: "The text acknowledges the limitations of the study and the alternative interpretations of its results." Step 2's brief, item 3, which this brief says still holds, lists it among the "Rules judged on a whole draft". The ruling "Step 2, the brief check", Question 2, does the same. `expected.md:33` puts its clean row in the short drafts with its limitations spread over sections, for example medicine `main.tex:33`, `sections.tex:25` and `sections.tex:27`. A prompt that has the agent judge it per methods or discussion section could report a clean short draft whose limitation stands in another section. That would be a report in a clean row.
  - "with the count it finds" does not say where the count goes. If the builder words it so the agent writes a count for a whole-draft rule it finds kept, that count is a line that is not a finding. The prompt's bullets "Report only a break ...", "Under a group heading write the findings and no other line" and "When the draft breaks no rule, the report says so" forbid such lines, and so does ADR 0003's "reports only breaks of a named rule".
- The check of item 2 (C4 to C10): yes, through C9 as above.

Findings:
- Item 1 classes "Objectivity / Limitations and alternative interpretations" as a section rule. Its words, step 2's brief (item 3) and the ruling "Step 2, the brief check" class it as a whole-draft rule. Judging it per section could make the agent report clean short drafts.
- Item 1's "with the count it finds" should say that the count is given in a finding of a break only. Otherwise the bullet can make the agent write lines that are not findings, against three prompt bullets that stay and ADR 0003.
- C1, C2 and C9 can pass without the goal. The goal is tested only by the second run after landing, and C9 rests on the builder's reading of its own drafts.
- The step line's check can pass with a clean-passage break that the agent also misses. Only the user's reading of the real report guards against false alarms the new section bullets may add on the grant, whose sections match no row of the section tables.

## 6. Implied inputs

This is not a code step. The step changes a skill's instructions (the rules file's rule 1 counts these as text, fixed by reading) and the case files, and no script.

Findings: none.

## 7. ADRs

Command: `ls docs/adr`, then the opening lines and a `grep -n -i 'supersed'` of each record, and the Decision and Consequences sections of 0001, 0002, 0003, 0006, 0007, 0010 and 0012. All twelve records have `Status: proposed`. No opening line marks a part superseded. The only "supersed" hits are 0002's Consequences ("reopens this record with a superseding one") and 0007's Consequences ("supersedes this record"), both about future records. All twelve are in force whole.

- 0001: touches the step (the prompt reads the prose standard). It is under "`/writing` and the skills that read the writing base read the prose standard where it is ...". Named in the brief.
- 0002: touches the step. It is under "The prose standard holds for every text the writing skills write or review." Named.
- 0003: touches the step. It is under "`/writing` starts one fresh agent that changes nothing, ..., which reads the whole draft and reports only breaks of a named rule." Named. Item 1 keeps one agent, which matches the rejected alternative "One agent per section of a long draft". The "with the count it finds" wording could contradict "reports only breaks of a named rule", as check 5 says.
- 0004, 0005, 0006, 0008, 0009, 0010, 0011: do not touch the step. The step changes no file, name, rule or behaviour their decisions govern.
- 0007: does not touch the step by the glossary's definition, since the step does not change the review behaviour. Its decision bears on the round's review: "The run over a repair round runs on the model an optional key `repair_reviewer` names". The state file sets `repair_reviewer: claude:sonnet`. The plan and the brief call this round "the step's one repair round", but its one `/refute` is the first review of this builder's diff. Which of `reviewer` and `repair_reviewer` that review runs on is the orchestrator's to state. The brief is silent.
- 0012: touches the step. It is under "Every commit a skill makes on main names its paths in the commit command". Named.

Findings: no part of the brief contradicts an in-force ADR as written. The one conditional contradiction is with 0003, under check 5. No ADR the step touches is left unnamed.

## 8. Dictated text

- "The expected results are read against the reports of step 3 and are not changed after its second run." `grep -n 'not changed after its second run' .scratch/3-the-writing-base/agents/briefs/3.md` prints `55:The expected results are read against the reports of step 3 and are not changed after its second run.`
  - The words hold. They are ASCII: `LC_ALL=C grep -n '[^ -~]'` over the brief exits 1. The sentence is 19 words (`wc -w` prints `19`), under the prose standard's "E. Sentence shapes / Sentence length". It has no dash, no filler and no flagged term. The passive ("are read", "are not changed") is the line it replaces kept, with the actor (the session) irrelevant under "E. Sentence shapes / Passive voice". "its" can refer only to step 3, since "the reports" is plural.
  - The placement breaks one rule. `sed -n '2,6p' .scratch/3-the-writing-base/cases/expected.md | cat -et` shows line 3 ("Every passage of a draft ...$") followed straight by line 4, with no blank line. Lines 3 and 4 are one Markdown paragraph over two source lines. Writing the new sentence as line 4 keeps that paragraph hard-wrapped. This breaks the prose standard's "F. Emphasis and formatting / Source formatting" ("one paragraph or bullet per source line, no hard wrapping") and the brief's own Conventions ("Markdown: one paragraph or bullet per line, no hard wrapping"). The fault stands on the tree today, and the dictated line carries it on.
  - Not a break of a named rule: "after its second run" can be read as after the second of step 3's nine `/writing` runs. The step line calls the repeat "the nine runs once more".
- The fenced block that carries the line (brief lines 54 to 56) has no language tag. The prose standard's "F. Emphasis and formatting / Source formatting" says "code fences carry a language tag".

Findings:
- The dictated line, placed as line 4, keeps `expected.md` lines 3 and 4 as one paragraph over two source lines. This breaks the prose standard's "F. Emphasis and formatting / Source formatting" and the brief's Conventions. A blank line between lines 3 and 4, or the two sentences joined on one line, would close it.
- The brief's fence has no language tag, against the same section of the prose standard.

## Declined to judge

- Whether the three sciences passages break "Reader's path / Clarity test" and "So what per section", and whether `sections.tex:209`'s `->` breaks "B. Punctuation / ASCII throughout". The brief leaves these to the builder's reading (its decision 3 and item 2's third bullet), and a brief check does not settle them.
- `3-gate-reading.md`'s count "Seven passages" of second rules not named, which the brief repeats. It is the gate reading's judgment of which hits are one passage, and I did not recount it.
- The use of "repair round" for a new builder dispatched with its own brief. The glossary's **repair round** is "the reviewer's findings sent back to the same builder as a numbered list". The user's ruling "Step 3, how the ruled fix is carried" and the step line set this use, so it is the user's.
- Which model reviews this round under ADR 0007. That is the orchestrator's dispatch choice, and the step does not change it.

Agent usage: acaa4055895146282, claude-opus-5-5, 178028 tokens, 40 tool uses, 8 min 41 s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, `expected.md:11`: item 2 now says a passage has one row naming every rule it breaks, two rows of one passage are merged, and the "How the tables read" bullet is rewritten to say this for any number of rules ("What to build", item 2; decision 6).
- 2. The step line, whole-draft rules "against each section": decision 4 states the brief's reading, each whole-draft rule judged once over the whole draft.
- 3. Premises, 128 lines: the brief now says 127 lines.
- 4. Cases, C5 "the same group": C5 now asks for every rule of a base break row to be named by a break row of the same break, its group as the prompt's order gives it.
- 4. Cases, item 2's first bullet against its second: the first bullet now covers only passages no row lists or a clean row lists; a break row's passage (engineering paragraphs 66, 98 and 128 named) goes to the next bullet.
- 5. The question, the limitations rule: item 1 now lists "Objectivity / Limitations and alternative interpretations" among the whole-draft rules (decision 5).
- 5. The question, "with the count it finds": item 1 now says a count is given only inside the finding of a break and no line is written for a rule kept.
- 5. The question, false alarms on the grant: item 1 now has the agent apply a section rule only to a section of the kind the rule's words name.
- 5. The question, C1, C2 and C9 can pass without the goal: C9 now asks for every sentence read against every rule with the rules read listed per draft. The behaviour of the agent is tested by the second run of the nine after landing, which no check before the landing can replace; the brief's opening paragraph says the runs follow the landing.
- 7. ADRs, 0007: decision 7 says the round's one `/refute` is the first review of this builder's diff and runs on the configuration's `reviewer:` model.
- 8. Dictated text, the hard-wrapped paragraph: item 2 now says the line is its own paragraph with a blank line before it.
- 8. Dictated text, the fence's language tag: the fence is now `text`.
- No dictated line was added after the check; the dictated line is unchanged.
