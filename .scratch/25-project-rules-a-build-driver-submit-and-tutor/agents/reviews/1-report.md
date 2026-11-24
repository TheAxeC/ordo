# Report: step 1, the five project rules written on the pages that hold their kind

Everything in the brief is done.

## Open items of the state file

Read with `grep -n '' .scratch/25-project-rules-a-build-driver-submit-and-tutor/orchestrator-state.md`, section "Open items", verbatim:

```
- none
```

## The cases' first run (unchanged tree, worktree at b772895, `git status --short` printing nothing)

Text cases, checked by reading the unchanged page in full, with the greps below as aids:

- R1 in the shared rules: unmet. `skills/ordo/ordo-init/templates/shared-rules.md` read in full: the bullet after "Zero warnings" (line 19) is "Proactively report problems" (line 20); no bullet says that every target in scope compiles and works in the same change. `git show b772895:skills/ordo/ordo-init/templates/shared-rules.md | grep -o -i '.\{15\}target.\{10\}\|.\{15\}compiles.\{10\}'` printed nothing.
- R2 in the shared rules: unmet. No bullet of the file says an open item is raised only for options that each cost something the user would weigh (read in full).
- R3 in the shared rules: unmet. "Filter, then rank" (line 12) forbids an option that breaks a hard rule or a locked decision; no bullet answers "may I offer the user an option that drops something they asked for". `grep -n -i 'wish\|asked for' skills/ordo/ordo-init/templates/shared-rules.md` printed nothing for "wish"; "asked for" occurs on lines 6 and 8 only, about reports and answers.
- R4 in the shared rules: unmet. `grep -n -i 'duration\|effort' skills/ordo/ordo-init/templates/shared-rules.md` printed nothing.
- R2 and R3 in `plan-orchestration`, "Stops": unmet. The bullet "The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons." (line 479) and its sub-bullets (lines 480 to 487) state neither rule; "inside the written rules" does not name the user's stated wishes.
- R1 in rule 6 and R5 in rule 16 of the template change standard: unmet. `grep -n '^6\. \|^16\. ' skills/ordo/ordo-init/templates/docs/dev/change-standard.md` printed rule 6 on line 32, ending `Zero warnings in every configuration; "pre-existing" excuses nothing.`, and rule 16 on line 47, `16. **A write verifies its own result.** A step or a tool that rewrites a file's text re-parses what it wrote and refuses when the reparse is not what was asked. A write that cannot verify itself does not land.` A reader who has just written a `plan.yaml` finds no sentence that the file is loaded.
- R1 and R5 in `docs/dev/change-standard.md`: unmet. The same grep on that file printed rule 6 on line 33 and rule 16 on line 48 with the same text as the template's, neither holding R1 or R5.
- R5 in `coding-standards/common.md`: unmet. Line 10 read: `- **Markdown and YAML.** Each paragraph and each bullet is one line, as the prose standard's section F sets for source formatting.`

Command cases:

- `grep '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md | tail -1` printed:
  ```
  - **No history in a rule file or a comment.** A rule file states the rule and at most one clause of why. A comment says what the code does and why. Dates, incidents and what was reverted belong in a ledger, a commit message or a changelog.
  ```
  Already as expected on the unchanged tree; the step must keep it.
- `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` printed `0`, exit 1 (expected 1 after the step).
- `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -3` printed `PASS: sync_rules.py scratch tests`.

No case is one the brief's own rules get wrong, so no hand-back was made.

## DONE / NOT DONE

Every command run from the worktree's root after the change.

| Item | State | Command | Output as printed |
|---|---|---|---|
| Verify 1 | DONE | `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` |
| Verify 2 | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"` | `ok: the plan-terms block equals the template` / `exit 0` |
| Verify 3 | DONE | `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1` | `PASS: check_config.py scratch tests` |
| Verify 4, character set | DONE | the brief's `printf '%s\0' ... \| xargs -0 perl -CSD -ne '...'; echo "exit $?"` over the five changed shipped files | no line printed, then `exit 0` |
| Verify 5 | DONE | `grep -c '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md` | `27` |
| Verify 5 | DONE | `grep '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md \| tail -1` | `- **No history in a rule file or a comment.** A rule file states the rule and at most one clause of why. A comment says what the code does and why. Dates, incidents and what was reverted belong in a ledger, a commit message or a changelog.` |
| Verify 6 | DONE | `grep -n 'last rule' docs/dev/change-standard.md; echo "exit $?"` | no line printed, then `exit 1` |
| Verify 6 | DONE | `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` | `1` |
| Verify 7 | DONE | `grep -n 'version' skills/orchestration/plan-orchestration/SKILL.md \| head -1` | `5:  version: "9.0.0"` |
| Verify 7 | DONE | `git diff --stat` | see "The files with line counts"; five files, all in "Paths this step writes" |
| Verify 8 | DONE | read, see "Standards on list items and sentence length" | |
| What to build 1, shared rules | DONE | `grep -n '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md` read; R4 on line 8 after "A proposal says what exists now" (7), R3 on line 14 after "Filter, then rank" (13), R1 on line 22 directly after "Zero warnings" (21), R2 on line 27 directly after "No question boxes" (26), "No history in a rule file or a comment" last (31) | |
| What to build 2, `plan-orchestration` | DONE | `git diff skills/orchestration/plan-orchestration/SKILL.md`: two sub-bullets added under the stop-message bullet of "Stops", version 8.0.1 to 9.0.0, no other line changed, no Anti-patterns row added | |
| What to build 3, template change standard | DONE | `git diff skills/ordo/ordo-init/templates/docs/dev/change-standard.md`: R1 appended to rule 6 after its zero-warnings sentence, R5 added to rule 16; rule numbers unchanged | |
| What to build 4, `coding-standards/common.md` | DONE | `git diff skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`: one sentence added to "Markdown and YAML" | |
| What to build 5, `docs/dev/change-standard.md` | DONE | `git diff docs/dev/change-standard.md`: same two sentences as the template; "last rule" replaced by the label | |
| What to build 6, contradiction greps | DONE | see "Contradiction greps" | |
| What to build 7, carry greps | DONE | see "Carry greps" | |
| Cases after the step | DONE | each case of "Cases" read again on the changed pages; each is met, the three command cases print as in Verify 1, 5 and 6 | |

## R1 to R5 as written

- R1, `skills/ordo/ordo-init/templates/shared-rules.md` line 22, directly after "Zero warnings":
  `- **Every target in scope works.** Every target in scope of a change (each platform, configuration or build the change is meant for) compiles and works in the same change. A target is never left broken for a later change.`
- R1, rule 6 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` (line 32) and of `docs/dev/change-standard.md` (line 33), after the sentence `Zero warnings in every configuration; "pre-existing" excuses nothing.`, the same words in both:
  `Every target in scope of the change (each platform, configuration or build the change is meant for) compiles and works in the same change. A target is never left broken for a later change.`
- R2, `skills/ordo/ordo-init/templates/shared-rules.md` line 27, directly after "No question boxes":
  `- **An open item is for costs the user weighs.** An open item is raised to the user only for options that each cost something the user would weigh.`
- R2, `skills/orchestration/plan-orchestration/SKILL.md` line 481, "Stops", a sub-bullet of "The stop message is plain text in the report: ...":
  `  - Its open item is raised only for options that each cost something the user would weigh.`
- R3, `skills/ordo/ordo-init/templates/shared-rules.md` line 14, directly after "Filter, then rank":
  `- **Every option meets every stated wish.** Every option offered to the user meets every wish the user has stated. An option that drops one is not offered.`
- R3, `skills/orchestration/plan-orchestration/SKILL.md` line 482, "Stops", the next sub-bullet of the same bullet:
  `  - Each option meets every wish the user has stated, and an option that drops one is not offered.`
- R4, `skills/ordo/ordo-init/templates/shared-rules.md` line 8, directly after "A proposal says what exists now":
  `- **An effort question is answered with the changes.** A question about how much effort something is gets an answer that lists each change and the code it touches. The answer gives no duration.`
- R5, rule 16 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` (line 47) and of `docs/dev/change-standard.md` (line 48), after the re-parse sentence, the same words in both:
  `A YAML file is loaded, that is parsed as YAML, after every write to it.`
- R5, `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md` line 10, appended to "Markdown and YAML":
  `A YAML file is loaded, that is parsed as YAML, after every write to it, under the change standard's rule "A write verifies its own result".`

Line numbers from `grep -n 'Every target in scope\|YAML file is loaded\|open item is\|Every option meets\|Each option meets every wish\|effort question' skills/ docs/dev -r`.

## Contradiction greps (item 6)

Each run as `grep -rn -i '<terms>' skills/ utils/ docs/ README.md | grep -v '^docs/adr/\|^docs/roadmap.md'`, after the change. Hits on the new lines themselves are left out of the lists below; every other hit is listed with its reading.

- R1, `'target in scope\|left broken\|every target\|for a later change'`: `skills/academic/paper/SKILL.md:552` and `:553` ("every target is a supported one", "every target is converted from"), where a target is an output format of `/paper format-convert`. A different sense; no contradiction.
- R2, `'cost something\|would weigh\|open item is raised\|raised to the user only'`: `skills/code/diagnose/SKILL.md:240` and `:241` (which stop form an open item of `premise` takes), `skills/orchestration/spec/SKILL.md:191` and `:426`, `skills/orchestration/spec/templates/brief.md:28`, `skills/orchestration/spec/templates/brief-check.md:39` (an implied input "whose wrong answer would cost something"). None says an open item is raised for options that cost the user nothing; no contradiction.
- R2, read further against `skills/orchestration/plan-orchestration/references/self-rule.md`, "The six kinds left open", kind 6 ("A choice with no clear recommendation: two options or more that the written rules, the rulings and the ADRs do not rank") and "Closing an open item" 1 (`self-rule.md:37`): kind 6 says which open items wait for the user, R2 says which are raised at all; the two hold together. "No question boxes" and its self-rule sentence (shared rules line 26) list where a stop belongs to the user; R2 adds a condition on the options and contradicts neither sentence.
- R3, `'wish\|drops one'`: `skills/academic/paper/agents/formatter_agent.md:140` ("We wish to submit the enclosed manuscript", a cover-letter template) and `README.md:14` ("drops one" in the `roadmap` row: the skill drops a roadmap entry). No contradiction. The lazy option of the decision form (`skills/orchestration/grill/SKILL.md`, "The decision form"; `self-rule.md:37`) is, as the brief states, named among options that each meet every stated wish, and is no contradiction.
- R4, `'how much effort\|duration\|how long'`: `skills/code/codebase-design/SKILL.md:200` ("How long a source file may be", a length, not a time); `skills/academic/paper/references/mode_selection_guide.md:52, 69, 88, 108, 125, 141, 158, 175, 194, 211, 230, 247` (`**Expected Duration**:` of each `/paper` mode, how long a run of the mode lasts); `skills/academic/paper/agents/revision_coach_agent.md:198` (the "Effort Estimation" table, whose column "Typical Duration" gives "1-3 days" to "4+ weeks" for a manuscript revision by its author). Judgment, given under "Judgment calls": no contradiction, so neither is changed and neither is a stop.
- R5, `'parsed as yaml\|yaml file is\|stays valid YAML\|loaded, that is'`: `skills/ordo/ordo-init/templates/plan-terms.md:38`, `docs/glossary.md:43` and `skills/orchestration/plan/templates/orchestrator-state.md:33` ("A value that holds `: ` is written in double quotes, so the block stays valid YAML"). Consistent with R5; no contradiction.

## Carry greps (item 7)

- `grep -rn -i 'last rule\|first rule\|final rule\|23 rules\|27 rules\|twenty-three' skills/ utils/ docs/ README.md | grep -v '^docs/adr/\|^docs/roadmap.md'` printed nothing after the change.
- `grep -rn -i 'shared.rules' skills/ utils/ docs/ README.md | grep -v '^docs/adr/\|^docs/roadmap.md' | grep -i -E '\b[0-9]+\b *(rules|bullets)|(rule|bullet) [0-9]+|\blast\b|\bfirst\b'` printed `skills/ordo/ordo-init/templates/plan-terms.md:10`, `skills/ordo/ordo-init/templates/sync_rules.py:8`, `skills/ordo/ordo-init/templates/sync_rules.py:12` and `docs/glossary.md:15`. Read: none counts the shared rules or cites one by position ("first" in `sync_rules.py:8` is the order the blocks are checked in; the others match a number elsewhere on the line).
- `grep -rn 'shared-rules.md`, ' skills/ utils/ docs/ README.md | grep -v '^docs/adr/\|^docs/roadmap.md' | grep -o 'shared-rules.md`, [^)]*' | sort | uniq -c`: every citation of a shared rule names it by its label ("Never take the lazy option", "Scripts compute facts; judgment is read", "Surface rule clashes", "No history in a rule file or a comment"); each label is unchanged.
- `grep -rln 'Zero warnings\|No question boxes\|Filter, then rank' skills/ utils/ docs/ README.md` printed `skills/ordo/ordo-init/templates/shared-rules.md`, `skills/ordo/ordo-init/templates/sync_rules.test.sh`, `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` and `docs/dev/change-standard.md`: no page lists the shared rules. The test rewrites the "Zero warnings" line by its label, which is unchanged.
- No further file was found, so no path outside "Paths this step writes" was written.

## Sentences about a file as a whole, reread after the change

- `skills/ordo/ordo-init/templates/shared-rules.md` line 3, "These rules hold in every repository set up from the same template. ...": still holds; the four bullets are rules of the same kind.
- `skills/orchestration/plan-orchestration/SKILL.md`, "Stops" opening sentence, "The table holds seven kinds of stop ...": the table is unchanged and still has seven stop rows and two refusal rows.
- `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md` line 3, "Two pages installed beside it hold rules this page relies on: the change standard ...": still holds, and the new sentence names a rule of the change standard.
- Rule 16's label "A write verifies its own result" covers the R5 sentence; rule 6's label "Before landing, verification runs the checks of the files the step changes" holds beside R1 as it holds beside the zero-warnings sentence, the place the brief names.

## Standards on list items and sentence length (Verify 8)

Read against `docs/dev/skill-layout.md`, "Lists and tables" and "Writing for an agent", and the prose standard, sections 0, B, D and E.

- One rule per bullet: each new shared-rules bullet holds one rule. R1 and R3 add a second sentence that restates the rule's limit from the other side ("never left broken for a later change", "an option that drops one is not offered"), which cannot be broken while the first sentence holds. R4's two sentences are the two parts of the brief's one line (lists each change and the code it touches; gives no duration); the shared rules' form is a label with one to three sentences, as the brief sets and as the neighbouring bullets have.
- The `plan-orchestration` sub-bullets are one sentence each. The R3 sub-bullet joins the rule and its restatement with "and", which is one rule, since an option that drops a wish breaks both halves at once.
- Sentence length: the R1 sentence is about 22 words, over the prose standard's "under roughly 20 words"; its parenthesis is the brief's own definition of a target and is needed for the rule's scope. The R5 sentence of `common.md` is about 25 words, because the brief asks for one sentence that states R5 and names the change standard's rule. Every other new sentence is under 20 words.
- Prohibitions name the behaviour to do instead: R1, R3 and R4 state the wanted behaviour first and the prohibition after it in the same bullet.
- Semicolons: none added. Em dashes, arrows, bold outside labels: none.

## The terms

Read against `docs/glossary.md`:

- **open item** (R2, shared rules and `plan-orchestration`): used as defined, "a decision for the user, with its options, their pros and cons, ... and one recommendation". R2 adds a condition on when one is raised and changes no part of the entry.
- **lazy option**: not used by the diff.
- No other glossary term is added, changed or used in a new place. "target", "configuration" (in R1, a build configuration, not the configuration block), "option", "wish" and "change" are not glossary terms.

## The files with line counts

`git diff --numstat` and `wc -l` after the change:

| File | Added | Removed | Lines now |
|---|---|---|---|
| `docs/dev/change-standard.md` | 3 | 3 | 96 |
| `skills/orchestration/plan-orchestration/SKILL.md` | 3 | 1 | 530 |
| `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` | 2 | 2 | 72 |
| `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md` | 1 | 1 | 13 |
| `skills/ordo/ordo-init/templates/shared-rules.md` | 4 | 0 | 31 |
| `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/1-report.md` | this report | | |

## Judgment calls

- R2 in the shared rules is placed directly after "No question boxes" rather than after "No silent design decisions", since "No question boxes" is the bullet that says when a decision is raised to the user.
- The four bullet labels are the builder's: "An effort question is answered with the changes.", "Every option meets every stated wish.", "Every target in scope works.", "An open item is for costs the user weighs."
- In the change standards, R1 is written as two sentences, not joined to the zero-warnings sentence by a semicolon, since rule 6 already holds three semicolons and the prose standard's section B limits them.
- The `paper` skill's duration lines are judged no contradiction of R4. R4 governs an answer to a question about the effort of a change and names "the code it touches"; `mode_selection_guide.md`'s "Expected Duration" lines describe how long a run of a mode lasts, and `revision_coach_agent.md`'s "Effort Estimation" table grades an author's manuscript revision, which touches no code. Both are part of a copy of a source skill. If the orchestrator reads R4 as reaching the revision coach's table, that table is a statement contradicting a new rule and is a stop by item 6; it is left unchanged either way.

## Host- or user-visible changes

- A repository synced with `/ordo-init` gets four more shared rules in its `CLAUDE.md` block. Before: 23 bullets, `grep -c '^- \*\*'` printed 23 on the unchanged tree's template. After: 27.
- A repository set up by `/ordo-init` gets R1 in rule 6 and R5 in rule 16 of its `docs/dev/change-standard.md`, and R5 in "Markdown and YAML" of `docs/dev/coding-standards/common.md`. Before and after are quoted in "The cases' first run" and "R1 to R5 as written".
- `plan-orchestration` 9.0.0: a stop message's open item is raised only for options that each cost something the user would weigh, and offers no option that drops a stated wish. Before: 8.0.1, with neither sub-bullet.
- This repository's `docs/dev/change-standard.md` cites the last shared rule by its label: before `(`skills/ordo/ordo-init/templates/shared-rules.md`, last rule)`, after `(`skills/ordo/ordo-init/templates/shared-rules.md`, "No history in a rule file or a comment")`.

## Wrong or impossible in the brief

- "What is on the tree" says "This repository's `CLAUDE.md` holds no shared-rules block: `grep -n 'ordo:shared-rules' CLAUDE.md` prints nothing." In the worktree `ls CLAUDE.md` printed `ls: CLAUDE.md: No such file or directory` and `git ls-files CLAUDE.md` printed nothing: the file is not tracked, so the worktree has none. The premise's conclusion (no shared-rules block reaches this repository) still holds, and the step needs nothing from that file.
- Nothing else in the brief was wrong or impossible.

## Repair round 1

Everything in the round's brief (`agents/briefs/1-round-1.md`) is done. The round changed `skills/ordo/ordo-init/templates/shared-rules.md` and `skills/orchestration/plan-orchestration/SKILL.md` and this report, and nothing else.

### Ruling 1, finding S1: the open-items rule narrowed to open items that offer options

- `skills/ordo/ordo-init/templates/shared-rules.md` line 27, before: `- **An open item is for costs the user weighs.** An open item is raised to the user only for options that each cost something the user would weigh.`
- After (with ruling 2's sentence): `- **An open item is for costs the user weighs.** An open item that offers options is raised to the user only when each option costs something the user would weigh. A decision whose options do not each cost something the user would weigh is taken with its recommended option, and the report states it.`
- `skills/orchestration/plan-orchestration/SKILL.md` line 481, before: `  - Its open item is raised only for options that each cost something the user would weigh.`
- After: `  - An open item that offers options is raised only when each option costs something the user would weigh.`

The places of open items with no options, read against the new wording. The refuter report is not in the worktree (`ls .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/` printed `1-brief-check.md` and `1-report.md`), so these four were found with `grep -rn -i 'open item' skills/ docs/glossary.md | grep -i 'worktree\|reading\|diff\|approv'` and the ruling's three examples:

- `skills/orchestration/plan-orchestration/references/self-rule.md`, "The six kinds left open", kind 5, "The user's reading of a page a step writes." with "The reading stays an open item.": the open item offers no options, and the new wording says nothing about it. No contradiction.
- `skills/orchestration/land/SKILL.md`, "Stops", row "A worktree that cannot be removed" and the bullet "The last row is a stop after the landing's commit that leaves an open item: ...": the open item names the worktree and branches to remove and offers no options. No contradiction.
- `skills/orchestration/plan-orchestration/SKILL.md`, "Stops", row "The roadmap diff" ("The diff, in the stop message", resumed by "The user's approval of the diff"), with kind 4 of `self-rule.md`, "The closing's roadmap diff, tag and pin.": a diff to approve, not a choice among options. No contradiction.
- `docs/glossary.md` line 72 and `skills/ordo/ordo-init/templates/plan-terms.md` line 67, entry **open item**, second sense: "It is also a worktree `/land` could not remove, closed by running the removal." It offers no options. No contradiction. The first sense ("a decision for the user, with its options ...") is the kind the new wording governs, and it is consistent with it.

### Ruling 2, finding S3: what is done in place of raising

- Shared rules, the second sentence of the bullet quoted under ruling 1: `A decision whose options do not each cost something the user would weigh is taken with its recommended option, and the report states it.`
- `skills/orchestration/plan-orchestration/SKILL.md` line 482, a new sub-bullet under the stop-message bullet of "Stops", after the line of ruling 1: `  - A decision whose options do not each cost something the user would weigh is taken with its recommended option and stated in the report, unless this skill's text raises it, as "Rules" raises what the rounds left undone.`
- Read against the skill's own raises: "Rules" ("Everything else that the rounds left undone, or that lies outside the step's part, is raised to the user as an open item, by "Stops"."), the Stops rows, and `references/self-rule.md`, "The six kinds left open", are all text of this skill that raises an item, so the "unless" clause keeps each of them raised. "Fixing a defect in what the user asked for is never a stop" and "No question boxes" ("Recommend and proceed.") agree with taking the recommended option.

### Ruling 3, finding S2: the effort rule narrowed to a change to the repository

- `skills/ordo/ordo-init/templates/shared-rules.md` line 8, before: `- **An effort question is answered with the changes.** A question about how much effort something is gets an answer that lists each change and the code it touches. The answer gives no duration.`
- After: `- **An effort question is answered with the changes.** A question about how much effort a change to the repository is gets an answer that lists each change and the code it touches. The answer gives no duration.`
- An estimate a manuscript skill gives of a revision is the skill's estimate of an author's work on a paper, not an answer to a question about a change to the repository, so the rule does not reach it. No page of `skills/academic/` was changed: `git diff --stat` names no path under it.

### Ruling 4, finding P1: the duration grep read against the effort rule

`grep -rn -i '[0-9] \(hours\|days\|weeks\|minutes\)' skills/` printed 33 lines (`| wc -l` printed `33`): 19 state an effort estimate, 14 do not. The hits that state an effort estimate, each an estimate of the time an author's manuscript revision takes, given by a manuscript or review skill. None is an answer to a question about how much effort a change to the repository is, so none falls under the rule as ruling 3 words it:

- `skills/academic/paper/agents/revision_coach_agent.md:200`, `:201`, `:202`: the "Effort Estimation" table, "1-3 days", "1-2 weeks", "2-4 weeks".
- `skills/academic/paper/references/failure_paths.md:250`: "Turnaround target: 2 weeks for reformatting, 4 weeks for substantive revision", after a desk rejection.
- `skills/academic/paper-review-panel/references/editorial_decision_standards.md:38`, `:52`, `:65`, `:79`: the time a minor or major revision takes, and its deadline.
- `skills/academic/paper-review-panel/agents/editorial_synthesizer_agent.md:227`, `:340`: the same for the editor's decision.
- `skills/academic/paper-review-panel/templates/editorial_decision_template.md:139`: "[Minor: 2-4 weeks / Major: 6-8 weeks]".
- `skills/academic/paper-review-panel/examples/interdisciplinary_review_example.md:216`, `:223`, `:230`, `:235`: "Estimated effort: 12-16 days", "6-8 days", "2 days", "Recommended 8 weeks".
- `skills/academic/paper-review-panel/examples/hei_paper_review_example.md:322`, `:328`, `:335`, `:341`: "Estimated effort: 10-14 days", "5-7 days", "2-3 days", "Recommended 6-8 weeks".

The other hits state no effort estimate: `skills/academic/paper/agents/citation_compliance_agent.md:572` ("acceptance within 72 hours", a sign of a predatory venue), `skills/academic/paper/agents/peer_reviewer_agent.md:208` (the simulated time of a reviewer's first read), `skills/academic/paper/templates/lookup.py:93`, `:99`, `:1415`, `:1424`, `:1446` and `skills/academic/paper/templates/lookup.test.sh:2`, `:1069`, `:1079`, `:1082`, `:1099`, `:2271` (the cache's age limits), and `skills/academic/writing/references/registers.md:15` (an example sentence, "heated ... for 2 hours").

### Ruling 5, finding B1: the visible changes of `docs/dev/change-standard.md`

Added to "Host- or user-visible changes":

- `docs/dev/change-standard.md` rule 6 (line 33), before, ending: `... a new test moving a total upward is fine and the report says by how much. Zero warnings in every configuration; "pre-existing" excuses nothing.` After, ending: `... Zero warnings in every configuration; "pre-existing" excuses nothing. Every target in scope of the change (each platform, configuration or build the change is meant for) compiles and works in the same change. A target is never left broken for a later change.`
- `docs/dev/change-standard.md` rule 16 (line 48), before: `16. **A write verifies its own result.** A step or a tool that rewrites a file's text re-parses what it wrote and refuses when the reparse is not what was asked. A write that cannot verify itself does not land.` After: `16. **A write verifies its own result.** A step or a tool that rewrites a file's text re-parses what it wrote and refuses when the reparse is not what was asked. A YAML file is loaded, that is parsed as YAML, after every write to it. A write that cannot verify itself does not land.`

### Ruling 6, finding SP1

Closed by rulings 1 to 3, as above.

### Verify list, run again after the round

| Check | Output as printed |
|---|---|
| 1 `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: sync_rules.py scratch tests` |
| 2 `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"` | `ok: the plan-terms block equals the template` / `exit 0` |
| 3 `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1` | `PASS: check_config.py scratch tests` |
| 4 the brief's character-set check over the five shipped files; `echo "exit $?"` | no line printed, then `exit 0` |
| 5 `grep -c '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md` | `27` |
| 5 `grep '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md \| tail -1` | `- **No history in a rule file or a comment.** A rule file states the rule and at most one clause of why. A comment says what the code does and why. Dates, incidents and what was reverted belong in a ledger, a commit message or a changelog.` |
| 6 `grep -n 'last rule' docs/dev/change-standard.md; echo "exit $?"` | no line printed, then `exit 1` |
| 6 `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` | `1` |
| 7 `grep -n 'version' skills/orchestration/plan-orchestration/SKILL.md \| head -1` | `5:  version: "9.0.0"` |
| 7 `git diff --numstat` | `3 3 docs/dev/change-standard.md`, `4 1 skills/orchestration/plan-orchestration/SKILL.md`, `2 2 skills/ordo/ordo-init/templates/docs/dev/change-standard.md`, `1 1 skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`, `4 0 skills/ordo/ordo-init/templates/shared-rules.md` (each line printed as `<added><tab><removed><tab><path>`) |
| 8 read | The new sentences of rulings 1 and 2 are 18 to 26 words. The `plan-orchestration` sub-bullet of ruling 2 is about 33 words, over the prose standard's "under roughly 20", because ruling 2 asks for one sentence that both states the action and keeps the skill's own raises. Each new sub-bullet holds one rule. No semicolon or dash was added. |

The file table of "The files with line counts" now reads 4 added and 1 removed for `skills/orchestration/plan-orchestration/SKILL.md` (531 lines, `wc -l`); the other rows are unchanged.
