# Report of step 3, the gate's reading

Everything in the brief is done.

## Open items of the state file

`.scratch/6-paper-review/orchestrator-state.md`, section "Open items", holds one line:

- none

## The cases' first run

The cases were run on the tree at HEAD `78cc139`, where `git status --short` printed nothing before the page was written. No case showed a rule of the brief to be wrong, so no ruling was asked for.

- `references/integration_guide.md`, 1 hunk. `command diff <source>/references/integration_guide.md skills/academic/paper-review-panel/references/integration_guide.md | grep '^[0-9]'` printed `6,14c6,13`. The hunk was read: six names change, and the line `Step 1: deep-research -> Research report` is left out with the eight steps after it renumbered. The page's entry quotes both texts and gives the names edit 1 and the line left out edit 2.
- `agents/eic_agent.md`, hunk `21,23c21,23`. `command diff <source>/agents/eic_agent.md skills/academic/paper-review-panel/agents/eic_agent.md | grep -n '^21,23c21,23'` printed `17:21,23c21,23`. The three lines were read. The page gives the first line four verdicts, since the directory words hold two changes: the words of the directories (edit 1) and the not-equal sign (edit 4). The dash has edit 4 and the agent's name edit 1. The second and third lines have their verdicts too.
- `SKILL.md`, the two json contracts. `grep -n '"contract_id"' skills/academic/paper-review-panel/SKILL.md` printed `294:  "contract_id": "reviewer/reviewer_full/v1",` and `379:  "contract_id": "reviewer/reviewer_methodology_focus/v1",`. The source's `SKILL.md` was read whole and holds neither contract. The page lists both as added under hunk `262a258,436`, each with verdict none and the ruling "Open item 2-contracts".
- `references/changelog.md`. `command diff -rq <source> skills/academic/paper-review-panel` printed 26 lines: 25 that end in `differ` and `Only in <source>/references: changelog.md`. The page holds one entry for the file after the 25 files, under "The file only in the source", with verdict edit 4.
- The per-file hunk counts. The counts under "What is on the tree" equal the counts `diff` prints, shown in the table of check 2 below, and their sum is 426.

## DONE / NOT DONE

| Check | Result | Output |
|---|---|---|
| 1. Character-set check over the two files | DONE | The command of the brief, run as written, printed nothing. `echo $?` after it printed `0`. |
| 2. Per-file hunk counts | DONE | See the lines below the table: each file's `diff` count equals the page's number, and the total is 426. |
| 3. Every hunk named in its file's part | DONE | The loop of the brief, with `S=/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer` and `P=.scratch/6-paper-review/agents/reviews/3-diff-reading.md`, printed nothing. |
| 4. `git status --short` | DONE | `?? .scratch/6-paper-review/agents/reviews/3-diff-reading.md` and `?? .scratch/6-paper-review/agents/reviews/3-report.md` |
| 5. The page read against the prose standard's rules on list items and sentence length | DONE | The departures are named below. |

The command of check 1:

```text
printf '%s\0' .scratch/6-paper-review/agents/reviews/3-diff-reading.md .scratch/6-paper-review/agents/reviews/3-report.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

The command of check 3, which printed nothing:

```text
(cd skills/academic/paper-review-panel && find . -type f | sed 's|^\./||' | sort) | while read f; do command diff "$S/$f" "skills/academic/paper-review-panel/$f" | grep '^[0-9]' | while read h; do awk -v head="## $f" '$0==head{on=1;next} /^## /{on=0} on' "$P" | grep -qF -- "\`$h\`" || echo "not named: $f $h"; done; done
```

Check 2. For each file, `command diff "$S/$f" "skills/academic/paper-review-panel/$f" | grep -c '^[0-9]'` gave the first number, and the page's line "`diff` prints N hunks for this file" the second. A third number counts the list items of the file's part that open with a hunk id. The loop printed:

```text
agents/devils_advocate_reviewer_agent.md diff=42 page=42 ids=42
agents/domain_reviewer_agent.md diff=22 page=22 ids=22
agents/editorial_synthesizer_agent.md diff=53 page=53 ids=53
agents/eic_agent.md diff=18 page=18 ids=18
agents/field_analyst_agent.md diff=5 page=5 ids=5
agents/methodology_reviewer_agent.md diff=17 page=17 ids=17
agents/perspective_reviewer_agent.md diff=21 page=21 ids=21
examples/hei_paper_review_example.md diff=19 page=19 ids=19
examples/interdisciplinary_review_example.md diff=30 page=30 ids=30
examples/subclaim_decomposition_example.md diff=21 page=21 ids=21
references/calibration_mode_protocol.md diff=32 page=32 ids=32
references/editorial_decision_standards.md diff=3 page=3 ids=3
references/guided_mode_protocol.md diff=2 page=2 ids=2
references/integration_guide.md diff=1 page=1 ids=1
references/quality_rubrics.md diff=3 page=3 ids=3
references/re_review_mode_protocol.md diff=17 page=17 ids=17
references/review_criteria_framework.md diff=3 page=3 ids=3
references/review_quality_thinking.md diff=5 page=5 ids=5
references/sprint_contract_protocol.md diff=30 page=30 ids=30
references/statistical_reporting_standards.md diff=6 page=6 ids=6
references/top_journals_by_field.md diff=5 page=5 ids=5
SKILL.md diff=54 page=54 ids=54
templates/editorial_decision_template.md diff=9 page=9 ids=9
templates/peer_review_report_template.md diff=2 page=2 ids=2
templates/revision_response_template.md diff=6 page=6 ids=6
total 426
```

The counts of the summary. `grep -o 'Verdict: [^.]*\.' "$P" | sort | uniq -c` printed:

```text
 109 Verdict: edit 1.
  65 Verdict: edit 2.
   7 Verdict: edit 3.
 442 Verdict: edit 4.
   1 Verdict: edit 5.
  97 Verdict: none, ADR 0043, Decision 2.
  40 Verdict: none, nothing allows it.
   6 Verdict: none, ruling "Open item 2-call".
  10 Verdict: none, ruling "Open item 2-contracts".
   1 Verdict: none, ruling "Open item 2-questions".
  10 Verdict: none, ruling "The three things the source does not state".
```

The same command piped to `wc -l` printed `788`. The four lists of the summary hold 40, 27, 97 and 7 list items, counted by `awk` per section and `wc -l`.

Check 5, the departures from the prose standard's rules on list items and sentence length:

- An entry's list item holds a quoted source line and a quoted skill line, so many items run past 20 words and past four sentences. The brief asks for both texts in the entry, and a quoted line cannot be shortened below the changed part and the words around it.
- The sentences "Verdict: edit 4." and the like are fragments, and they recur in every entry. The brief asks for a verdict on every change, and one fixed form lets a command count them.
- The construction "Source: ... Skill: ..." and "One replacement and nothing else" recur across entries. Each entry states the same kind of fact, and a varied wording would make the reader ask whether the entries differ in kind.
- The lists of the summary hold up to 97 items of one line each. The brief asks for every change with verdict none on a line of its own.
- The page's own sentences, outside quotes, stay under roughly 20 words, with these exceptions that state a condition with its reason in one sentence: the paragraph under "None, nothing allows it" in the summary, and the entries of `SKILL.md` that say where a moved block stands and which hunk names its changes.

## The terms

Terms of `docs/glossary.md` the page uses, each use read against its entry:

- ruling: used for the lines of the Rulings section of `plan.md`, by their names. It agrees with the entry.
- session, the: used in quoted skill text ("The session") and for the change of "The orchestrator" to it. It agrees with the entry.
- step: used for the numbered items of the skill's Steps section and in quoted text. These are steps of a skill, a different thing from the entry's plan step. The page never uses the word for a plan step.
- stop and refusal: used for the rows of the skill's Stops table, as the skill names them. They agree with the entries.
- gate: used in quoted text only ("hard gate" of the sprint contract), a different thing from the entry's gate of a roadmap entry.
- brief: used twice, for this step's brief. It agrees with the entry.
- case: used in quoted text and once for the letter case of a heading, never for a brief's case.
- verdict: used in the brief's sense, the judgment of one change (an edit by number, or none with what allows it). The glossary's entry is the reviewer's verdict on an item of a brief. The page states its sense in its list of conventions.
- panel review: the page uses the skill's name `paper-review-panel` and never the term for anything else.

## The files

- `/Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-3/.scratch/6-paper-review/agents/reviews/3-diff-reading.md`: 2408 lines.
- `/Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-3/.scratch/6-paper-review/agents/reviews/3-report.md`: 139 lines.

## Judgment calls the brief left open

- What Decision 2 covers in `SKILL.md`. The page reads it as covering the source's words carried into a section of the layout, a layout heading, a heading turned into a sentence or an item, a separator `---` removed, a blank line, a frontmatter key the layout does not hold, and Version Info left out. Words that are in no source line and that no ruling names have verdict none, nothing allows it, also where the layout asks for them: the `Done when` lines, the Stops section with its ten rows, the two refusals, the names of the stops in the steps, the items of quick, methodology-focus and calibration, and four changed headings. This reading gives 38 of the 40.
- A moved block of `SKILL.md` has a verdict at the hunk that removes it and at the hunk that adds it, so the 97 count places where the diff shows a move, and the blocks are fewer.
- One verdict covers several lines of one hunk that make the same change, such as five `Done when` lines or four dashes turned to colons. The counts are counts of verdicts written.
- A version tag, an issue number, a date and a sentence that announces a later release have edit 4 where they are left out, and so do the words around a version tag that were turned into a statement in the present (for example "v3.6.2 introduces sprint contracts for" to "Sprint contracts hold for").
- `ARS`, the name of the source's suite, changed to `paper-review-panel` has edit 1. A sentence on a file, script, variable, validator, pipeline stage or other skill of that suite has edit 2 where it is left out.
- `references/sprint_contract_protocol.md`, hunk `122c119`: "require a PR updating both" became "is added to both". The page gives it edit 2, reading the pull request as a mechanism of the source's repository. A reader who takes a pull request as no mechanism of the skill would give it none, nothing allows it.
- `references/re_review_mode_protocol.md`, hunk `43c43`: `Kong A1` in the heading is a pointer to a paper and has no edit, so it has none, nothing allows it, while `v3.11` beside it has edit 4.
- `references/sprint_contract_protocol.md`, hunk `70,71c67,68`: `SR` is not explained anywhere in the source, so its removal has none, nothing allows it.
- The changes of the sprint contract page that follow from the contracts standing in `SKILL.md` (the template's path, "template" to "contract", the two file names) have none with the ruling "Open item 2-contracts", since the ruling moves the contracts there.
- A path given to a file name (`quality_rubrics.md` to `references/quality_rubrics.md`) has edit 3. Seven changes have it.
- No change has edit 6. No rule left out was found to contradict the manuscript prose standard.
- A line over 200 characters is cut to the changed part, with `[cut]` at each cut. A line of 200 characters or fewer is quoted whole.
- Whether the two json contracts equal the files of the source's upstream repository was not read: that repository is not among the files this step compares, and the page says so at the contracts' entry.
- The entry of `references/changelog.md` has edit 4, since the no-history rule leaves out a changelog and ADR 0043 lists the file as not copied.

## Anything in the brief that was wrong or impossible

- The case of `agents/eic_agent.md` says the first line of hunk `21,23c21,23` holds three changes. The page gives it four verdicts, because the directory words hold a name change (edit 1) and a not-equal sign replaced by words (edit 4). The three changes of the brief are all among the four.
- Nothing in the brief was impossible. The heading "What is on the tree (read on main at 6844dfd)" names an older commit than the worktree's HEAD `78cc139`, and `git diff --stat 6844dfd HEAD -- skills` printed nothing, so the skill's files are the ones the brief read.
