# Step 3 brief check (on main at 7c25869)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites is named with its section. A line of code or a hit of a grep keeps its `file:line`. Nothing was written, edited, moved or deleted. `git rev-parse --short HEAD` printed `7c25869`; `git status --short` printed ` M .scratch/6-paper-review/orchestrator-state.md` and `?? .scratch/6-paper-review/agents/briefs/3.md`.

Below, `S` is `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer`, `K` is `skills/academic/paper-review`, `B` is `.scratch/6-paper-review/agents/briefs/3.md`.

Findings that change the brief, most costly first:

1. Section 4, F1: the case on `agents/eic_agent.md` misquotes the source and counts two changes where the line has three.
2. Section 5, F1: no check computes that every hunk `diff` prints is named on the page. Verify 2 compares only the number the page states.
3. Section 3, F1: the premise that each of the six named rulings "allows a difference" is false for two of them.
4. Section 4, F2: the rules file forbids editing anything under the ledger folder except the report, and the step writes a second ledger file.
5. Section 3, F2 and section 7, F1: Decision 2's "Version History" does not exist in this source (its section is "Changelog"), and ADR 0043 Decision 1 names ADR 0002 for edit 6, which the brief does not name.

## 1. Names

- `3-diff-reading.md` (the one name the step adds): `grep -rn "3-diff-reading" . --exclude-dir=.git` printed 4 hits:
  - `.scratch/6-paper-review/agents/briefs/3.md:21`, `:63`, `:103`: the brief itself.
  - `.scratch/6-paper-review/plan.md:22`: the step line, "writes `agents/reviews/3-diff-reading.md`". Outside "Paths this step writes". The step makes it true, not false.
- `3-report.md`: the builder's report, the usual name; not grepped as a changed name.
- No hit under `skills/`, `docs/`, `utils/` or `README.md`.

Findings: none.

## 2. The step line

Step line (`plan.md`, "Steps, in execution order", step 3), part by part:

- "a fresh agent": "What must hold", last item (the page takes no verdict from the reports of steps 1 and 2 and does not read them). The freshness itself is the dispatch's, not a requirement of the page.
- "reads `diff -r` of `skills/academic/paper-review/` against `research-hub/.agents/skills/academic-paper-reviewer/`": "What to build" paragraph 1, "Read" item 4, "What it must do". The brief fixes the argument order as source first, skill second; the step line names the skill first. The hunk count is the same either way; the line numbers and the `<` and `>` sides follow the brief's order.
- "once": "made once" in "What to build" paragraph 1.
- "writes `agents/reviews/3-diff-reading.md`": "What to build" paragraph 1 and "Paths this step writes".
- "which lists each difference": "What must hold" items 1 (every hunk of the 25 files), 6 (`SKILL.md` moved, left out, added), 7 (`references/changelog.md`).
- "with which edit of ADR 0043, Decision 1, it is, or none": the six edits by number, and "What must hold" items 2, 3, 5.
- "the user reads that list": "What must hold" item 8 (the summary) and "Conventions". The reading is the user's; no requirement can serve it further.
- "(0 commit)": "Decisions taken in this brief" 3 (the orchestrator copies the page into the main ledger).

Findings: none.

## 3. Premises

- Source file count: `find $S -type f | wc -l` printed `26`. Matches.
- Skill file count: `find $K -type f | wc -l` printed `25`. Matches.
- `diff -rq $S $K`: 25 lines "differ" (`diff -rq $S $K | grep -c differ` printed `25`) and `Only in <source>/references: changelog.md`. No "Only in" line for the skill. Matches.
- `diff -r $S $K | wc -l` printed `2673`. Matches.
- Hunks per file, `diff $S/<f> $K/<f> | grep -c '^[0-9]'` in a loop over the 25 files: `SKILL.md 54`, `agents/devils_advocate_reviewer_agent.md 42`, `agents/domain_reviewer_agent.md 22`, `agents/editorial_synthesizer_agent.md 53`, `agents/eic_agent.md 18`, `agents/field_analyst_agent.md 5`, `agents/methodology_reviewer_agent.md 17`, `agents/perspective_reviewer_agent.md 21`, `examples/hei_paper_review_example.md 19`, `examples/interdisciplinary_review_example.md 30`, `examples/subclaim_decomposition_example.md 21`, `references/calibration_mode_protocol.md 32`, `references/editorial_decision_standards.md 3`, `references/guided_mode_protocol.md 2`, `references/integration_guide.md 1`, `references/quality_rubrics.md 3`, `references/re_review_mode_protocol.md 17`, `references/review_criteria_framework.md 3`, `references/review_quality_thinking.md 5`, `references/sprint_contract_protocol.md 30`, `references/statistical_reporting_standards.md 6`, `references/top_journals_by_field.md 5`, `templates/editorial_decision_template.md 9`, `templates/peer_review_report_template.md 2`, `templates/revision_response_template.md 6`, `sum 426`. Every number matches the brief.
- ADR 0043 title: `sed -n 1p docs/adr/0043-*.md` printed "# 0043. Paper's modes are academic-paper's, copied, with the deviations the goal and the rulings keep". The brief writes "copied with the deviations", without the comma after "copied". `grep -m1 '^Status' docs/adr/0043-*.md` printed `Status: proposed`; the brief does not state the status.
- ADR 0043, Decision 1: the record reads "The only edits are these:" followed by six bullets. Matches. The six bullets as the record has them: "`paper`'s names for academic-paper's files, roles and records;", "a sentence on a role, a skill or a mechanism `paper` has no counterpart for, left out;", "a reference to another academic-paper file named as the page that holds it;", "the character set and the no-history rule of this repository;", "the Chinese-language rules left out, the English text kept;", "a rule that contradicts the manuscript prose standard left out, as ADR 0002 decides."
- ADR 0043, Decision 2: the record reads "`skills/academic/paper/SKILL.md` is academic-paper's `SKILL.md`, each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text. Version Info and Version History are left out." The brief's quote matches word for word.
- Ruling names in `plan.md`, Rulings: "A copy and nothing else", "The three things the source does not state", "No calibration script", "Open item 2-contracts", "Open item 2-questions", "Open item 2-call". All six names exist as written.

Findings:

- F1. The brief says of the six rulings: "Each allows a difference in `SKILL.md` that is none of the six edits." Two of them allow none. "A copy and nothing else" reads "with the edits of ADR 0043, Decision 1, and no others; no option that cuts, moves or replaces anything the source has is offered or taken". "No calibration script" reads "the source has no script for the calibration numbers, and none is added". A builder that takes the brief's sentence as written can close a "none" difference with "A copy and nothing else" as the ruling that allows it, and the summary then lists it under the allowed ones, not first under "nothing allows it".
- F2. The brief's allowed reason "ADR 0043, Decision 2 ... for Version Info and Version History left out" names a section this source does not have. `grep -n 'Version Info\|Version History\|^## ' $S/SKILL.md` printed `416:## Version Info` and `428:## Changelog`, and no "Version History". The brief does not say which reason the left-out "## Changelog" section takes (Decision 2, or edit 4).
- F3. The brief's edits 4 and 5 are worded wider than Decision 1's bullets: edit 4 adds "a character outside printable ASCII replaced or removed, a version tag, an issue number, a date or a changelog line left out", edit 5 says "Chinese-language text" where the record says "the Chinese-language rules". Step 1's brief has the same reading of edit 4 (`grep -n 'version tag\|issue number' .scratch/6-paper-review/agents/briefs/1.md` printed line 51, "No version tag, date of a release, changelog ... or issue number stays"), and the plan's Goal says "the Chinese-language text left out". The brief does not say these are its own words and not the record's.
- F4. The title of ADR 0043 is quoted without its comma after "copied".

## 4. Cases and checks

- Case `references/integration_guide.md`, 1 hunk: `diff $S/references/integration_guide.md $K/references/integration_guide.md` printed one hunk, `6,14c6,13`: nine source lines ("Step 1: deep-research -> Research report" to "Step 9: academic-paper (format-convert) -> Final paper") against eight skill lines ("Step 1: paper -> Paper first draft" to "Step 8: paper (format-convert) -> Final paper"). The count matches. See F3.
- Case `agents/eic_agent.md`, first bullet under "You MUST NOT:": `grep -n -A3 'You MUST NOT' $S/agents/eic_agent.md` printed line 21 as "- WRITE files in the reviewer skill's `phase{M}_*/` directories where M <not-equal sign> 1 (no inflate into Phase 2 editorial synthesis <em dash> that's `editorial_synthesizer_agent`'s work)". The same grep on `$K/agents/eic_agent.md` printed line 21 as "- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 editorial synthesis: that's the editorial synthesizer's work)". The skill text matches the brief. The source text does not. See F1.
- Case `SKILL.md`, the two json contracts: `grep -n 'Sprint Contract Protocol\|```json\|contract_id' $K/SKILL.md` printed `280:## Sprint Contract Protocol`, `292:```json`, `294:  "contract_id": "reviewer/reviewer_full/v1",`, `377:```json`, `379:  "contract_id": "reviewer/reviewer_methodology_focus/v1",`. `grep -rn '```json\|contract_id\|reviewer_full/v1\|methodology_focus/v1\|shared/contracts' $S` printed four lines, none a json block or a contract id: `SKILL.md:412` and `references/sprint_contract_protocol.md:5`, `:20`, `:38`, each naming the path `shared/contracts/...` only. The contracts stand nowhere in the source, and the ruling "Open item 2-contracts" exists with the two ids. Consistent.
- Case `references/changelog.md`, one entry: the file is the one "Only in" line. Consistent.
- Case of the per-file counts and the sum 426: the counts are those of section 3. Consistent. It is a check of a fact, as the rules file's "Scripts compute facts; judgment is read" allows.
- "The builder's first task ... is the first run of every case above on the unchanged tree": every case states what the page holds, and the page does not exist on the unchanged tree. What can be read there is each case's stated source text, skill text and count. The brief's two bullets under it say a text case is checked by reading the unchanged tree, which covers this.
- No case asks the builder to check a place the step does not change; the step changes no file of the skill, and every case concerns the page.

Findings:

- F1. The `agents/eic_agent.md` case misquotes the source. The brief has the source end "<em dash> that's the editorial synthesizer's work)". The source ends "<em dash> that's `editorial_synthesizer_agent`'s work)". The line therefore holds three changes, not two: the directory words, the dash, and the name `editorial_synthesizer_agent` written as "the editorial synthesizer" (edit 1). A page that names the two changes the case asks for passes the case and leaves the name change without a verdict. The bullet is also the first of three lines of one hunk: `diff $S/agents/eic_agent.md $K/agents/eic_agent.md` prints it inside `21,23c21,23`, whose lines 22 and 23 replace four more agent names and four more dashes. The case says "two changes in the hunk"; the hunk holds more.
- F2. The rules file, "Where the work happens": "Nothing under the ledger folder is edited except the report the brief names." The brief's first paragraph says the rules govern this step "unchanged", and "What to build" has the builder write `.scratch/6-paper-review/agents/reviews/3-diff-reading.md`, a ledger file that is not the report. The plan's step line asks for that file, so the page has to be written; the brief does not say that the page is the step's product and that the rule's sentence is read with it. A builder that follows the rules file "unchanged" stops here.
- F3. The `integration_guide.md` case asks for "a verdict", singular. The one hunk holds two kinds of change: the names (`academic-paper` to `paper`, `academic-paper-reviewer` to `paper-review`, edit 1) and the line "Step 1: deep-research -> Research report" left out with the steps renumbered (edit 2). "What must hold" item 3 asks for one verdict per change; the case as worded is met by one.
- F4. Verify 1 passes a page that holds U+2705: the command's pattern for `.md` files is `[^\x20-\x7E\x{2705}\n]`. "Conventions" says "Printable ASCII only" and gives `<check mark emoji>` as the written form. The check and the convention disagree on that one character.

## 5. The question

"The goal" here: the user reads a list of every difference between the source and the skill, each with which of the six edits it is, or none.

- Case `integration_guide.md`: yes. One entry with one verdict meets it while the dropped deep-research line has no verdict (section 4, F3).
- Case `eic_agent.md`: yes. Two named changes meet it while the third has no verdict (section 4, F1).
- Case the json contracts: no. They are added text, the verdict and the ruling are fixed, and both are checked against the tree above.
- Case `changelog.md`: no for presence. The entry's verdict is left to the builder; the brief does not say which it is.
- Case the counts and 426: yes. The counts are the page's own statement. See F1.
- The check on the step's line ("the user reads that list"): no command can pass it; it is the user's reading. The plan's Gate answers the question with "no".
- "What must hold" 1 (every hunk under its file, the stated count equal to the accounted count): yes, see F1.
- "What must hold" 2 (both texts and a verdict per hunk): no for presence; whether a verdict is right is read by the reviewer and the user.
- "What must hold" 3 (several changes, each its verdict): no, when followed.
- "What must hold" 4 (alike hunks in one entry): yes, see F2.
- "What must hold" 5 ("none" never softened, with what allows it): yes through section 3, F1 and F2; otherwise no.
- "What must hold" 6 (`SKILL.md` pairing): no, when followed. It is the largest reading of the step: `diff $S/SKILL.md $K/SKILL.md | grep '^[0-9]'` prints among its 54 hunks `72,208d80`, `237a123,203`, `262a258,436` and `306,374d476`.
- "What must hold" 7 (`changelog.md`): no.
- "What must hold" 8 (the summary): yes in part, see F3.
- "What must hold" 9 (no verdict from the earlier reports): no.

Findings:

- F1. Nothing computes that each hunk `diff` prints is named on the page. Verify 2 compares the number the page states with `grep -c '^[0-9]'`, and the "number the page accounts for" is the builder's own count. A page that states 54 for `SKILL.md` and names 50 hunks passes every check of "Verify before you report". Whether a hunk's line numbers stand in the file's part of the page is a fact a machine computes: for each file, each line of `diff $S/<f> $K/<f> | grep '^[0-9]'` searched as a fixed string in the page. The brief has no such check.
- F2. A grouped entry "quotes one of them and says what the others replace". The user then reads the text of one hunk of the group. A hunk put into a group it does not belong to (a dash replaced by a colon in one place and by a comma in another, a name replaced beside a second change) is on the page by its line numbers and its own text is not. The dash alone stands in 384 places of the diff (see section 6), so most entries of the page will be such groups.
- F3. The summary's "number of differences per verdict" has no unit. A hunk can hold several changes with several verdicts, a group holds several hunks, and `SKILL.md` adds left-out and added blocks; the per-verdict numbers cannot be read against 426 unless the brief says whether they count hunks, changes or entries.
- F4. The plan's Goal names four edits and its Gate line says "none of the four edits"; the brief and the step line use the six of Decision 1. Edits 3 and 6 are not among the Goal's four. The summary lists one line per "none" and only a number for each edit, so a difference judged edit 3 or 6 reaches the user as part of a number.

## 6. Implied inputs

Not a code step: it writes one page by reading. Inputs of the reading the brief leaves unsaid, each with the command that shows it:

- Characters outside ASCII: `diff -r $S $K | LC_ALL=C grep -c '^<.*[^ -~<tab>]'` printed `436` and the same for `^>` printed `0`: every such line is the source's. A `perl -CSD` count over the diff printed `distinct=45`, `han distinct=26`, and by frequency `U+2014 384`, `U+2192 46`, `U+00A7 31`, `U+2265 18`, `U+FE0F 7`, `U+26A0 7`, `U+2260 7`, `U+2013 3`. The brief names three written forms and the Chinese form. It gives no form for the arrow, the section sign, the greater-or-equal sign, the en dash, the warning sign or the variation selector U+FE0F, which has no glyph and follows an emoji. Covered in kind by "written by its name in angle brackets"; the invisible U+FE0F is the one a reader of the terminal misses, and the brief's `cat -v` advice does show it.
- Lines over 200 characters: `diff -r $S $K | awk 'length($0)>202 && /^[<>]/' | wc -l` printed `329`. The brief's rule for them ("cut to the changed part with the words around it") is stated.
- Quoted text that breaks the page's own markup: `diff -r $S $K | grep -c '^[<>].*`'` printed `435` and `diff -r $S $K | grep -c '^[<>] *```'` printed `6`. "Conventions" puts quoted text "in backticks or a fenced block". A quoted line that holds a backtick ends an inline quote early, and a quoted line that is itself a code fence ends a fenced block early; the brief gives no form for either (a longer fence, or four-space indentation).
- Whitespace: `diff -r $S $K | grep -c 'No newline'` printed `0`; a grep for a carriage return printed `0`; a grep for a tab printed `0`; `grep -cE '^[<>] .*[ <tab>]+$'` printed `0`. A loop comparing `diff` with `diff -b -B` per file printed one line, `./SKILL.md 54 vs 75`: the count rises, so no hunk of any file was shown to be whitespace-only by it. For `SKILL.md` alone, `diff -B` printed `52`: two of its 54 hunks hold blank lines only. The brief gives no verdict rule for a blank line added or removed.
- The order `diff -r` prints: `diff -r $S $K | grep -n '^diff \|^Only'` printed `SKILL.md` first, then the seven of `agents/`, the three of `examples/`, `references/calibration_mode_protocol.md`, then `Only in <source>/references: changelog.md` at line 2202, then the other ten of `references/`, then the three of `templates/`. The brief's list of counts is in that order. The `changelog.md` entry stands between two files of `references/` in that order; the brief does not say where its entry goes, and either place meets it.
- The `diff` in the session's shell: `type diff` printed "diff is a shell function from /Users/axelfaes/.claude/shell-snapshots/..." and the header lines read `diff --color -r ...`; `diff --version` printed "Apple diff (based on FreeBSD diff)". Piped output carried no colour codes in these runs, and the counts above were taken through it. A header quoted on the page reads `diff --color -r`, not `diff -r`.
- The manuscript prose standard: edit 6 is "a rule that contradicts the manuscript prose standard left out". The brief's reading list holds `skills/ordo/repo-setup/templates/docs/dev/prose-standard.md` and not `skills/academic/writing/references/manuscript-prose-standard.md` (`ls skills/academic/writing/references/` printed `manuscript-prose-standard.md`, `registers.md`, `rules.md`). A builder cannot judge edit 6 for a hunk without it.

Findings: the markup of a quoted line that holds a backtick or a code fence; the verdict of a blank-line-only hunk; the manuscript prose standard missing from "Read".

## 7. ADRs

`ls docs/adr` printed 44 names: 42 records (0001 to 0043, no 0015), `README.md` and `template.md`. The status line and first line of each record were printed in a loop; the decisions of 0002, 0005, 0006, 0026 and 0043 were read.

- 0043 (Status: proposed): touches the step. Decision 1, "The only edits are these:" with its six bullets, is the set of verdicts; Decision 2, "each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text. Version Info and Version History are left out.", is an allowed reason. Named under "What is on the tree".
- 0002 (Status: proposed; superseded by 0026 for a manuscript in the part the manuscript prose standard lists): touches the step through edit 6. Decision: "No rule that contradicts the prose standard is carried." Decision 1 of 0043 ends its sixth bullet "as ADR 0002 decides". Not named in the brief.
- 0026 (Status: proposed): touches the step through edit 6. Decision: a manuscript's prose "is held to the prose standard ... with the differences `skills/academic/writing/references/manuscript-prose-standard.md` lists." Not named in the brief.
- 0005 (choices file) and 0006 (the ledger records every agent's id with its role): they govern the orchestrator's records of this step, not the page. The brief contradicts neither.
- 0001, 0003, 0004, 0007 to 0014, 0016 to 0025, 0027 to 0042: they govern the writing review, the plan skills' cost and dispatch records, or `paper`'s run. None governs a ledger page that reads a diff. `grep -ln 'paper-review\|academic-paper-reviewer\|panel review' docs/adr/0*.md` printed 0001, 0019, 0022, 0025, 0027, none in a part that decides this page.

Findings:

- F1. The brief does not name ADR 0002, which Decision 1 of 0043 cites for edit 6, nor ADR 0026 and the manuscript prose standard it points at.
- F2. No part of the brief contradicts an ADR. The widened wording of edits 4 and 5 is section 3, F3.

## 8. Dictated text

The brief dictates no line of running text for the page. It dictates these fixed words and forms:

- "none" as a verdict: `grep -n '"none"' $B` printed lines 37, 40, 50, 73. Holds.
- "nothing allows it": `grep -n 'nothing allows it' $B` printed line 40. Holds.
- `<Chinese text, n characters>`: `grep -n 'Chinese text, n characters' $B` printed line 96. Holds; printable ASCII.
- `<em dash>`, `<not-equal sign>`, `<check mark emoji>`: line 96. Hold.
- "Everything in the brief is done", the report's first line: `grep -n 'Everything in the brief is done' $B` printed line 112. Holds; the rules file's rule 7 asks for it.
- The brief itself: `LC_ALL=C grep -n '[^ -~]' $B` printed nothing.

Findings: none.

## The brief's command 1, run as written

Run with the brief's own path in place of each of the two paths, the rest as the brief has it:

`printf '%s\0' .scratch/6-paper-review/agents/briefs/3.md .scratch/6-paper-review/agents/briefs/3.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`

It printed nothing and `echo "exit=$?"` printed `exit=0`. The command is valid as written: the `\0` of `printf`, the `\.md\z` and the `\x20-\x7E` stand inside single quotes, the perl program holds no single quote, and the line holds no backtick, so the brief's inline code span carries it whole. Its perl part is the same text as the repository's check: `grep -cF` of that part printed `1` for the brief, `1` for `docs/dev/building.md` and `1` for `docs/dev/change-standard.md`. Run before the report exists, `perl` fails on the missing second path; the brief runs it after both files are written.

## Declined to judge

- Whether any verdict the page will give is right: that is the reading the step exists for, and the reviewer's and the user's.
- Whether a page of 426 hunks with both texts quoted is readable by the user in one sitting: the user's call. The diff is 2673 lines.
- Whether the Goal's four edits or Decision 1's six are the set the user wants to read against (section 5, F4): the user's call.
- Whether ADR 0043, at "Status: proposed", improves the product (the rules file's rule 23): not settled by a read and a rerun.
- The two json contracts in the skill's `SKILL.md` were checked for absence from the source, not compared field by field with `.scratch/6-paper-review/agents/briefs/2-contracts/`: the case does not ask for it.
- The glossary's entries were read for the terms the brief uses (case, brief, ledger, gate, goal, ruling, open item); no use was found to depart from its entry. The whole glossary was not read line by line against the brief.

Agent usage: afefa3411b72942e8, claude-fable-5-2, 120526 tokens, 11 tool uses, 3.9 minutes.

## Closed (the session's change to the brief for each finding, before the preparation commit)

- Section 3, F1 (two rulings allow no difference): the brief names the four rulings that allow a difference and says the two others allow none; "What must hold" says a ruling that allows no difference is never given as what allows one.
- Section 3, F2 (no "Version History" in this source): "What is on the tree" names the sections "Version Info" and "Changelog"; "Version Info" left out is Decision 2 and "Changelog" left out is edit 4.
- Section 3, F3 (edits 4 and 5 worded wider than the record): the brief says the wording is its own, as the plan's Goal and step 1's brief read the record.
- Section 3, F4 (the ADR's title): quoted with its comma and its status.
- Section 4, F1 (the `agents/eic_agent.md` case): the case quotes the source's line as it is, names its three changes and the hunk `21,23c21,23`, and asks a verdict for every change of the hunk's three lines.
- Section 4, F2 (a second ledger file): the first paragraph says the page is the step's product and that the builder writes the page and the report under the ledger and nothing else there.
- Section 4, F3 (the `integration_guide.md` case): the case names the hunk's two kinds of change, each with its verdict.
- Section 4, F4 (the green checkmark): "Conventions" says the page holds none.
- Section 5, F1 (no check that every hunk is named): "Verify before you report" 3 is a loop that prints each hunk whose line numbers do not stand in backticks in its file's part; the page's heading form `## <path>` and the hunk's form in backticks are fixed for it. The loop was run by the session on a page of its own with one file's hunks named and printed "not named" for every other hunk.
- Section 5, F2 (a group quotes one hunk): a group holds only hunks that make one and the same replacement and nothing else, and lists every hunk with its own changed words.
- Section 5, F3 (no unit for the numbers per verdict): the summary counts changes, a change being one difference that got one verdict, and gives the 426 hunks beside them.
- Section 5, F4 (edits 3 and 6 are not among the Goal's four): the summary lists every change judged edit 3 or edit 6 in one line each.
- Section 6 (markup of quoted text, blank-line hunks, the manuscript prose standard, the other characters, the shell's `diff`): "Conventions" gives the fenced block with a longer fence and the names of the other characters; "What must hold" gives the verdict of a blank-line hunk; "Read" holds the manuscript prose standard; the brief uses `command diff`. The entry of `references/changelog.md` stands after the 25 files.
- Section 7, F1 (ADR 0002 and 0026 not named): both are under "What is on the tree" and "Read".
