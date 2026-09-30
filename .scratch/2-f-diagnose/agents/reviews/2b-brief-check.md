# Step 2b brief check (plan 2.F, on main at 8595fad)

Brief read: /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/agents/briefs/2b.md (220 lines, untracked). `git rev-parse --short HEAD` printed 8595fad. Nothing in the repository was changed; `git status --short` after my last command printed the same three lines as at the start (` M .scratch/2-g-git-guard/agents/briefs/2b.md`, `?? .scratch/2-e-grill/agents/briefs/9a.md`, `?? .scratch/2-f-diagnose/agents/briefs/2b.md`). The one scratch folder I made under `$TMPDIR` is removed.

The brief's mechanics are sound: every premise reruns as stated, every column and indent measures right, the verify list is green. The findings are about behaviour: followed from Steps 1 to 24, the form `premise` has several places in `diagnose` and `spec` with no answer or a contradicting one, and the walks W1 to W5 do not reach them.

## 1. Names

Checked by reading the files with line numbers and by grep.

- `skills/diagnose/SKILL.md`: 237 lines (`wc -l`); Quick start forms at 15 to 18; "What it reads" 31 to 49, with lines 42, 43 and 49 as quoted; line 58, line 81, line 170 and the "Done when" at 171 as quoted; "Stops" opening at 202, nine rows, "No finding" at 214. All exist as the brief says.
- `skills/diagnose/templates/diagnosis.md` lines 3 and 7; `skills/spec/SKILL.md` lines 112 to 114; `skills/ordo-help/SKILL.md` lines 59 to 61; `skills/plan-orchestration/SKILL.md` line 28; `skills/repo-setup/templates/plan-terms.md` line 68; `docs/glossary.md` line 73: all exist as quoted.
- The new names: `grep -rn "No item to investigate" skills docs README.md` prints nothing (exit 1), so the row name is free. `grep -c 'premise' skills/diagnose/SKILL.md` prints 0.
- Hits of the form names outside the paths: `git grep -n '/diagnose' -- skills docs README.md` and `grep -rn 'brief check <n>\|brief-check finding' skills docs README.md utils`. Every hit outside the seven files (README 41, 49, 56, 60; `land` 24; `refute` 23; `session-retro` 25; `docs/figures/*`; `docs/dev/building.md` 11; `docs/dev/change-standard.md` 72) names one form or none, and none is made false. README's step sequence (lines 39 to 45) lists only the `<finding>` form and not `brief check <n>`, so leaving `premise` out matches it.
- The `diagnose` folder as a whole (`ls -R skills/diagnose`): `SKILL.md`, `templates/diagnosis.md`, `templates/person-driven.sh`, `templates/person-driven.test.sh`, `references/person-driven.md`. A grep of the reference file for "finding", "red line", "brief check" and "worktree" prints nothing, so it needs no change.

Findings: none. (The frontmatter description of `diagnose` is a name-level hit that matters; it is finding 5.6.)

## 2. The step line

Step line: "2b `/diagnose <entry> <step> premise`, as the ruling ... says, and `spec` Steps 4 pointing at it, with `ordo-help`'s sequence and the glossary where they name the forms; check: each changed text read in place (1 commit)".

- The form in `diagnose`: items 1 to 5 (the template is part of the skill).
- "probing on a scratch copy at main's head as its brief-check form does" (the ruling): item 3, the Steps 3 bullet.
- "`spec` Steps 4 points at it": item 6.
- "`ordo-help`'s sequence": item 7.
- "the glossary where they name the forms": item 9.
- "each changed text read in place": Verify 5 to 7.
- Beyond the line and listed under Decisions: the `plan-orchestration` row (7), the Stops row (4), "read-only" replaced in `spec` (5), the glossary sentence (6).

Findings:

1. "Decisions taken in this brief" 6 and "What to build" 9. The step line touches the glossary "where they name the forms", and the brief's own premise says "No entry of the glossary lists the forms of `/diagnose`" (confirmed: `grep -n 'brief check <n>' docs/glossary.md` prints nothing, exit 1). The condition of the line is therefore empty, and item 9 still adds a sentence to the entry **premise**. `spec` "Stops" counts "a vocabulary" as a user-visible choice, and the ruling does not cover it. Smallest change: either drop item 9 and its two paths (the form name is written in code as an invocation word, as `red line` and `brief check <n>` are, and neither has a glossary sentence), or keep it and have the orchestrator book it as a decision for Axel to overrule, as plan 2.F did for "Step 2a, the script's shapes".
2. Not listed under Decisions although the brief takes them: that the red command is not carried into the brief (finding 5.2), and where the result goes when no session is writing the brief (finding 5.1). Each is a choice the builder would otherwise never see. Smallest change: the replacement words of 5.1 and 5.2, each with a Decisions line.

## 3. Premises

Each command of "What is on the tree" rerun:

- Bullet 1: `grep -n 'The investigation of /spec' .scratch/2-f-diagnose/plan.md` prints lines 24 and 46; line 46 reads as quoted. Match.
- Bullet 2: `wc -l` prints 237; `sed -n 14,19p` shows the four forms; measured with awk, the text of lines 15 to 18 starts in column 44. Match.
- Bullets 3 to 5: read with line numbers; every quoted line is at its number. Match.
- Bullet 6: `sed -n 1,8p skills/diagnose/templates/diagnosis.md`. Match.
- Bullet 7: `grep -rn 'find why' skills docs README.md` prints `skills/spec/SKILL.md:112` only. Match.
- Bullet 8: `skills/ordo-help/SKILL.md` line 61 has 30 leading spaces (awk), so its text starts in column 31. Match.
- Bullet 9: `sed -n 28p skills/plan-orchestration/SKILL.md`. Match.
- Bullet 10: `sed -n 68p` of plan-terms and `sed -n 73p` of the glossary print the same entry as quoted; the grep prints nothing, exit 1. Match.
- Bullet 11: `grep -n '/diagnose' README.md skills/*/SKILL.md` outside `diagnose` prints exactly the lines listed. Match.
- Bullet 12: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0; plain `sync_rules.py .` prints `error: no CLAUDE.md in /Users/axelfaes/workspace/ordo`, exit 2. Match.
- Bullet 13: `ls docs/adr` prints `README.md` and `template.md`. Match.

Findings: none.

## 4. Cases and checks

Commands run as written, under zsh and `sh -c`:

- R1: prints 0, exit 1. R2, R4: read, true. R3: true as a reading; note that `grep -n premise skills/ordo-help/SKILL.md` prints line 74 ("a premise of the step is wrong"), the word in its glossary sense. R5: `grep -n -i "item\|step.s text"` over the template prints nothing, exit 1.
- W5's `grep -n "step's worktree\|dispatch entry" skills/diagnose/SKILL.md` prints 14 lines under both shells.
- Verify 1: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` on main ended `checks: 11 commands passed`, exit 0.
- Verify 3: as premise 12. Verify 4: `LC_ALL=C grep -n '[^ -~]'` over the seven files prints nothing now, exit 1.

Findings:

1. "Verify before you report" 2: "the text is written as the one line of a file under `$TMPDIR`, and `grep -c -F -f <that file> <file>` prints 1". Items 2, 3, 6 and 7 dictate blocks of two to four lines. A pattern file with two lines counts every line that matches either: my test with a two-line pattern file printed 2, with a one-line file 1. Two lines of item 6 ("A cause it cannot find ...", "Such a cause ...") are also on the tree already. Replacement words: "each line of each text this brief dictates is in its file once, whole: the line is written as the one line of a file under `$TMPDIR` ...".
2. Verify 2 proves that a line is present, not where it stands. A bullet placed after the item's "Done when", or under the wrong item, prints 1. Add to Verify 5 or as its own reading: "`git diff` is read, and each added line stands where its item of "What to build" says: after the line named, before the line named."
3. W4: "`diagnose` Steps 15 raises it to the user as an open item, and `spec` Steps 4 leaves it out of the brief; the two texts agree." The walk passes while the two texts disagree on what happens next (finding 5.4), because it reads two sentences and not the one between them.
4. W5 reads only sentences with "step's worktree" or "dispatch entry". The sentences that lose their referent for `premise` use other words: "the report the finding is in", "the finding", "its test", "the round". They are in finding 5.3 and 5.2. Replacement words for W5's last sentence: "Each hit of `grep -n "step's worktree\|dispatch entry\|report\|finding\|the round\|builder" skills/diagnose/SKILL.md` is read."
5. W5 against Decision 8. The grep's first hit is the description, line 3: "Run unattended in a plan's loop, it ... leaves the step's worktree unchanged and hands the fix to the builder as the round's ruling". That sentence names no form and is false for `premise`, so W5 fails as written while Decision 8 says the description stays. The builder then has to hand back. See 5.6 for the change.
6. No walk covers a run with no person present, a defect in text or one whose failure costs nothing (no test, so nothing becomes a case), or `/spec` waiting at its Steps 5 after the diagnosis ran. Each is a finding of check 5; each wants a walk once its text is settled.

## 5. The question

Could the builder follow the brief exactly, pass every check, and leave a form that does not work? Yes, in the places below. I followed `skills/diagnose/SKILL.md` Steps 1 to 24 with every dictated text placed, once run by a person and once with no person present.

Steps that hold for `premise` as they would read: Steps 1 (the refusal comes from "What it reads" 5), Steps 3 (scratch copy at `HEAD`, nothing applied; "shares no file with the step's worktree" holds with no worktree), Steps 4 to 14, Steps 16 to 19 (on the scratch copy), Steps 21 and 22, Steps 23 (`land` "What it reads" 7 and Steps 9, lines 42 and 93, read `agents/reviews/<step>-diagnosis.md` "one heading per diagnosis"), Steps 24 (outside a plan only). No Anti-patterns row contradicts the form. Rules lines 231 and 232 hold.

Findings:

1. Steps 20, item 3: "`premise`: the cause, the fix and the record's path are written into the item of the brief's "What to build"", against the item 2 text "For `premise` the brief is not written yet" and the unchanged line 171 "Done when the fix and its test stand in the place the defect's source names". When Steps 20 runs there is no brief, so its completion criterion cannot be met inside the skill. Inside `/spec` the same session writes the brief afterwards, which works only if the text says so. Run as its own command, which item 7 (a line of its own in the sequence) and item 8 ("diagnosed by hand") both present it as, there is nowhere to put the result: the red-line form has Step 0 for this, `premise` has nothing. Smallest change, replacement words for the first line of the Steps 20 block: "`premise`: the cause, the fix and the record's path go to the session writing the brief, which writes them into the item as the `spec` skill's Steps 4 says." And one bullet in "What it reads" 3 or a Decisions line saying that `premise` is run by the session that runs `/spec`, at its Steps 4.
2. Steps 20, item 3: "the test of Steps 16 with its failing run becomes a case of the brief". Steps 16 writes no test for a defect in text or a defect whose failure costs nothing, and for skills and pages that is the usual case. Then nothing of the diagnosis checks that the builder ended X: the red command, which the reviewer's-finding form carries ("The red command is the round's check"), is dropped for `premise`. The template's Cleanup placeholder, line 112, offers only "the red command run again on the original case and its output, or "carried by the round as its check"", and neither fits. Replacement words, sub-bullets at six spaces: "The red command becomes a check of the brief's "Verify before you report"." and "The test of Steps 16, where one is written, becomes a case of the brief with its failing run." Template line 112: add `, or "carried by the brief as its check"`.
3. "What it reads" 5, item 2. The item's head stays "Inside a plan, the report the finding is in", and the two new bullets put the step's text under it; `premise` has no report and no finding. Line 49 "No such report or finding is a refusal" and the Stops rows "No report" ("the report the finding is in is not on disk") and "No finding" name no form, so they read as applying. Smallest change: the head becomes "Inside a plan, the report the finding is in, or for `premise` the step's text.", and the two rows' When cells open "Inside a plan, for a finding, ...".
4. A cause not found, run by a person. Line 146 says "Run by a person, a cause not found ends in a stop after Steps 22", and the Stops row resumes it with "the user's ruling on the open item". `spec` Steps 4 says the cause "is left out of the brief" and goes on to write the brief. For a step whose only item is the investigation (W1's step) `spec` would then write a brief with no "What to build", and `spec` "Stops" has no row for it. Line 141 also names the open item as the one the row "A finding that is the user's" leaves, and `premise` has no finding. The brief does not say which text wins. Smallest change: one sub-bullet in item 6, such as "A step with no other item stops there, as "Steps / A stop" says." or the opposite choice, stated; it is the orchestrator's to pick and to list under Decisions.
5. The record in `spec` Steps 4 to 6. Steps 2 of `diagnose` writes the record to disk, "not committed on its own". `spec` Steps 6 carries "each of the session's own records (Steps 1)", which Steps 1 defines as "a ruling it booked, or a report or a reviewer it recorded"; the diagnosis record is carried only if read as such a report. `spec` Steps 5, line 128, says of a step that waits: "This run leaves nothing", and the record written at Steps 4 is then left on disk uncommitted. The next `/spec`, in another session, treats it as "a ledger change the session did not make", which is "never committed", and `diagnose` appends the second diagnosis to that same file. Smallest change: one sub-bullet in item 6: "The diagnosis record is one of the session's own records (Steps 1), and a step that waits at Steps 5 keeps it." with "lines 112-114" in "Paths this step writes" widened if line 128 is changed instead.
6. The description, `skills/diagnose/SKILL.md` line 3, under Decision 8 ("none lists the forms"). It says a run in a plan's loop "hands the fix to the builder as the round's ruling". Under `plan-orchestration`, `/spec` runs `premise` unattended and the fix goes into the brief. The sentence is already inexact for the red-line and brief-check forms, so this step does not make it false alone, but W5 reads it (finding 4.5). Smallest change: Decision 8 says in words that the description's sentence describes the reviewer's-finding form and stays, and W5 excepts line 3; or the description's clause becomes "and hands the fix over where the defect was found".

## 6. Implied inputs

This is a text step, so the template asks no list. The situations the step's text implies and the brief does not cover, each with its cost:

1. The item is in the step's Step 0 and not in its line. Covered by the item 2 bullet ("its line ... and what its Step 0 holds"). The Stops row still says "quotes its line". Cost: low. Replacement words in the row: "A refusal that names the step and quotes its text".
2. The item is worded differently from "find why X happens and end it". In `spec` the phrase describes a kind of item; in `diagnose` a refusal now hinges on it, five times. The ruling itself writes it as `a "find why X happens" item`. A literal reader refuses "find the cause of X and fix it", and the row then sends them to `/spec`, "which writes the brief with no investigation", while `spec` Steps 4 sends them back. Cost: a false refusal and a loop. Replacement words at the first use (item 2, "What it reads" 1): "in each part of it that asks for a cause to be found, in whatever words, as "find why X happens and end it" does", the later uses saying "such a part".
3. The item is in a ruling the step's tag names. Step 2b's own line is this case ("as the ruling ... says"). The brief's "step's text" is the line and Step 0 only, while `spec` "What it reads" 4 reads "the step's line, the rulings that touch it, and everything the plan carries to it". Cost: a false refusal. Replacement words: "its line in the step list of `plan.md`, the rulings its tags name and what its Step 0 holds".
4. The symptom is no longer on main. Steps 4 then finds no red command: run by a person it stops with a request for access or a credential, and with no person present it books a cause not found. The right answer is `spec`'s false premise (its Steps 2). Cost: an open item or a stop that asks the wrong thing. One bullet in item 3 would close it: "For `premise`, a red command that is green on main's head is a false premise, handled as the `spec` skill's Steps 2 says."
5. A second run of the form for the same step: `/spec` run again after a stop, after a wait at Steps 5, or after a brief-check stop that deletes the brief. `spec` Steps 4 runs the whole diagnosis again, with its wait for a person, and line 58 appends a second diagnosis of the same item. Cost: a full diagnosis repeated per `/spec` run. The brief takes no position; it needs a Decisions line either way.
6. A step not in the list, or without authority, given by hand. "What it reads" has no answer, and the new row quotes a line that does not exist. Cost: low, a refusal either way.
7. A step taken back out of main and prepared again. "the brief is not written yet" and "since the step is not built" are inexact there: the old brief is on disk and the step was built. Cost: low. "is not read" in place of "is not written yet, and none is read" avoids it.
8. Another brief in preparation. `.scratch/2-e-grill/agents/briefs/9a.md` (untracked) lists `skills/plan-orchestration/SKILL.md`, `skills/spec/SKILL.md`, `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` as whole files. All four dispatch blocks read `dispatch: none` now, but if 9a is prepared or landed first, the line numbers 112 to 114, 28, 68 and 73 move, and `spec` Steps 5 has four shared files to judge. Cost: a brief whose line numbers are wrong at its base. The quoted texts still locate each place.

## 7. ADRs

`ls docs/adr` prints `README.md` and `template.md`: no `NNNN-*.md` record exists. The brief says "No ADR touches this step" and names none, which is right.

Findings: none.

## 8. Dictated text

Measured: the Quick start line's text starts in column 44 once the brief's three-space block indent is taken off; the `ordo-help` text line has 33 leading spaces in the brief, 30 in the file, column 31; sub-bullets come out at 3 spaces under one-digit numerals, 4 and 6 under Steps 20, 3 and 5 in `spec`, equal to their neighbours (lines 42, 170, 165, 112, 113). The brief is ASCII with no tab (`LC_ALL=C grep -n '[^ -~]'` prints nothing, exit 1). "The last five rows are refusals" is right for ten rows. The claims the `spec` text makes about `diagnose` ("probes on a scratch copy at main's head", "changes no file of the checkout outside the ledger") match `diagnose` lines 59, 65 and 232 and the new Steps 3 bullet.

Findings:

1. Item 8, the `plan-orchestration` row: "A finding, a red line, a brief-check finding or what a step's text asks to find the cause of, diagnosed by hand". The old row's condition "whose cause is not known" is gone for the three existing forms, against rule 17 of the change standard (a rewrite keeps every condition). Replacement: "| A finding, a red line or a brief-check finding whose cause is not known, or a cause a step's text asks to have found, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line`, `brief check <n>` or `premise` |".
2. Item 3, Steps 20: one bullet of 44 words holds two requirements joined by "and" (the item written, the test made a case), each breakable alone, against `skill-layout.md` "Lists and tables". Replacement: the three bullets of findings 5.1 and 5.2, with "The fix is never made on main ..." kept as the fourth.
3. Item 3, Steps 2: "each item of that form in the step's text". Steps 2 has no "form" before it; the antecedent is in another section. The bullet is 35 words, and it does not say whether the first diagnosis gets a heading beyond the template's title. Replacement, two bullets: "For `premise`, each item "What it reads" 5 finds gets a diagnosis of its own, in the order of the step's text." and "The first fills the record as opened, and each later one is appended under a heading that quotes its item."
4. Item 9: "Stated in: `spec`, "What it reads" 5, Steps 2 and Steps 4". Every other entry writes a run of steps once ("Steps 1, 3, 4 and 5"). Replacement: "`spec`, "What it reads" 5 and Steps 2 and 4; `diagnose`, "What it reads" 1."
5. Item 1: "find the cause of what the step's text says happens and asks to have found" (25 words). "asks to have found" has no clear object. Replacement: "/diagnose <entry> <step> premise           find the cause a step's text asks for, before the step's brief is written" (text still in column 44).
6. Item 6, first line: 47 words, the definition, the command and two properties in one bullet. Replacement: the parent ends at "with `/diagnose <entry> <step> premise`.", and a first sub-bullet says "It probes on a scratch copy at main's head and changes no file of the checkout outside the ledger."
7. Item 5 against line 58. The template's sentence becomes "names its finding or quotes its item" while `SKILL.md` line 58 keeps "which names its finding": one rule in two wordings (rule 19). Smallest change: line 58 gets the same five words.
8. Sentences past 20 words that remain after the splits above: item 2 "What it reads" 1 (24), item 2 refusal bullet (23), item 3 Steps 3 (25), item 7 (32, its neighbour at line 61 has 27), item 9's second sentence (25), item 5's sentence (22). The builder may not reword a dictated text, so Verify 7 can only list them. The brief should state the reason each needs its length, or shorten it, before dispatch.
9. "item". `spec` lines 111 and 112 use "item" for an item of the brief's "What to build"; the dictated texts use it for a part of the step's line, and Steps 20 uses both in one bullet. The replacement words of finding 6.2 ("part") remove the second sense.

## Declined to judge

- A real run of `/diagnose <entry> <step> premise`: not made, since I invoke no skill. Every behaviour finding is from reading the text as it would stand.
- Whether the runner lets `/spec` invoke `/diagnose` from inside its Steps 4 under `plan-orchestration`: not checked. `plan-orchestration` "Rules" lists the skills the loop invokes and does not name `/diagnose`; that line is as it was before this step.
- Whether a new refusal row (Decision 4) is Axel's to rule on: `spec` "Stops" lists a public shape, a wire format, a config key and a vocabulary, and a refusal is none of them by its words. I report the glossary sentence (finding 2.1) and leave the row.
- Decision 9, no version change: no page under `docs/dev` or the README states a rule on when `metadata.version` moves (`grep -rn -i version docs/dev/building.md docs/dev/change-standard.md README.md` prints only the pin text), so there is nothing to hold it to.
- Whether each long sentence of finding 8.8 "needs" its length: a judgment for the orchestrator's reading.
- The installed, pinned skills: not read; the step changes the tree, not the pin.
- The order in which 2b and 2.E's 9a are prepared and landed (finding 6.8): the orchestrator's judgment under `spec` Steps 5.
- Whether the test written at Steps 16 on the scratch copy, removed at Steps 22, survives in the record well enough to become a case: the template holds "the test's command and its failing output", not the test's source. The reviewer's-finding form has the same shape today, so I did not count it against this brief.

Agent usage: claude-opus-5-5 (ordo-high), 196736 tokens, 21 tool uses, 8.2 minutes ($1.07 to $4.37).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Section 2 finding 1: the sentence in the entry **premise** is dropped with its item; the glossary change that remains is the entry **Step 0**, a consequence of finding 5.1 (Decision 10). Finding 2: Decisions 3 and 4.
- Section 4 findings 1 and 2: "Verify" 2 checks each line, and "Verify" 5 reads the diff for where each line stands. Findings 3 to 6: walks W2, W6, W7, W9 and W10, the last with the wider grep.
- Section 5 finding 1: the form writes its result in the step's Step 0, as the red-line form does (item 4, Steps 20; Decision 3), and `spec` Steps 4 carries it into the item. Finding 2: the red command is carried as a check and the test as a case where one exists (item 7, item 6's line 112). Finding 3: item 3's head of "What it reads" 5 and item 5's two cells. Finding 4: a step with no other item stops (item 7, Decision 7). Finding 5: the last sub-bullet of item 7. Finding 6: item 1 rewords the description's clause.
- Section 6 findings 1 to 3: the row quotes "its text", a part counts "in whatever words", and the step's text holds the rulings its tags name. Finding 4: item 4, Steps 4. Finding 5: "A cause that stands in the step's Step 0 already is not investigated again." Finding 6: no change, a refusal either way. Finding 7: "For `premise` no brief is read." Finding 8: the orchestrator's judgment at the dispatch; each text is located by its quoted words.
- Section 8 findings 1 to 7 and 9: the row keeps "whose cause is not known"; Steps 20 and Steps 2 are split; the "Stated in" finding goes with the dropped item; the Quick start line and the first line of `spec` Steps 4 are shortened; line 58 and the template use the same words; "part" names what a step's text asks. Finding 8: the sentences that remain long each name a rule with its condition and its place, which one bullet keeps together as the skill layout standard asks.
