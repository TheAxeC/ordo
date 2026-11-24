# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-1, base b772895)

## Verification (rerun by the reviewer)

The brief's "Verify before you report", run from the worktree's root:

1. `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1`
   `PASS: sync_rules.py scratch tests`
2. `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"`
   `ok: the plan-terms block equals the template` / `exit 0`
3. `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`
   `PASS: check_config.py scratch tests`
4. The brief's `printf '%s\0' <five files> | xargs -0 perl -CSD -ne '...'; echo "exit $?"`: no line printed, `exit 0`.
5. `grep -c '^- \*\*' skills/ordo/ordo-init/templates/shared-rules.md` printed `27`; `grep '^- \*\*' ... | tail -1` printed `- **No history in a rule file or a comment.** A rule file states the rule and at most one clause of why. A comment says what the code does and why. Dates, incidents and what was reverted belong in a ledger, a commit message or a changelog.`
6. `grep -n 'last rule' docs/dev/change-standard.md; echo "exit $?"` printed nothing, `exit 1`; `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` printed `1`.
7. `grep -n 'version' skills/orchestration/plan-orchestration/SKILL.md | head -1` printed `5:  version: "9.0.0"`. The brief's check names `git diff --stat`, and I ran it in that form. It printed five files, all in "Paths this step writes": `docs/dev/change-standard.md | 6 +++---`, `skills/orchestration/plan-orchestration/SKILL.md | 4 +++-`, `skills/ordo/ordo-init/templates/docs/dev/change-standard.md | 4 ++--`, `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md | 2 +-`, `skills/ordo/ordo-init/templates/shared-rules.md | 4 ++++`, `5 files changed, 13 insertions(+), 7 deletions(-)`. `git status --short` also shows the untracked report `.scratch/.../agents/reviews/1-report.md`.
8. Read: see findings S3 and the verdicts.

Commands the builder's report quotes, rerun:

- `grep -n -A4 'Open items' .scratch/.../orchestrator-state.md` printed `- none` under the heading. This matches the report.
- `git show b772895:skills/ordo/ordo-init/templates/shared-rules.md | grep -o -i '.\{15\}target.\{10\}\|.\{15\}compiles.\{10\}'` printed nothing (exit 1). This matches.
- `git show b772895:... | grep -n -i 'wish\|asked for'` printed hits on lines 6 and 8 only. This matches.
- `git show b772895:... | grep -n -i 'duration\|effort'` printed nothing. This matches.
- `git show b772895:<each change standard> | grep -n '^6\. \|^16\. '` printed lines 32/47 for the template and 33/48 for `docs/dev/change-standard.md`. This matches.
- At base, the last shared-rules bullet is "No history in a rule file or a comment", the count is `23`, and `grep -c '"No history...")' docs/dev/change-standard.md` gives `0`. This matches.
- The line-number grep `grep -rn 'Every target in scope\|YAML file is loaded\|...' skills/ docs/dev` gives shared-rules 8, 14, 22, 27; plan-orchestration 481, 482; template change standard 32, 47; `docs/dev/change-standard.md` 33, 48; common.md 10. This matches.
- The five contradiction greps of item 6 give exactly the hits the report lists. The report's lists are reproduced; finding P1 covers what those greps miss.
- `wc -l` on the five files gives 96, 530, 72, 13, 31. This matches.
- `ls CLAUDE.md` in the worktree printed `ls: CLAUDE.md: No such file or directory`. This matches. In the main checkout, `grep -n 'ordo:shared-rules' /Users/axelfaes/workspace/ordo/CLAUDE.md` printed nothing (exit 1), so the premise's conclusion holds.
- The carry greps of item 7: `grep -rn -i 'shared.rules' ... | grep -i -E '[0-9]|every rule|each rule|list|bullets'` found no count of the shared rules and no citation by position. `grep -rn '8\.0\.1' ...` hits only `skills/orchestration/spec/SKILL.md:5`, which is spec's own version. No sentence cites rule 6 or rule 16 by number.

## Verdicts

Items of the brief's "What to build", in its numbering:

1. Shared rules: holds. R4 is on line 8, after "A proposal says what exists now". R3 is on line 14, after "Filter, then rank". R1 is on line 22, directly after "Zero warnings", and that line is unchanged. R2 is on line 27, after "No question boxes". "No history in a rule file or a comment" is last (line 31). Each new bullet is a bold label with one or two sentences, and each says what its brief line says. R2 contradicts no sentence of "No question boxes"; its contradiction with other pages is finding S1.
2. `plan-orchestration`: holds as built. R2 and R3 are each written once (`grep -rn -i 'wish\|cost something\|would weigh' skills/orchestration/plan-orchestration/` gives lines 481 and 482 only), under the stop-message bullet of "Stops". No Anti-patterns row was added. The version went from 8.0.1 to 9.0.0 and no other line changed. The major raise matches `docs/dev/skill-layout.md`, "Frontmatter": a stop a run raised before, or an option it offered before, is no longer raised or offered, which is output changed or removed. The wording issues are findings S1 and S3.
3. Template change standard: holds. R1 is appended to rule 6 after the zero-warnings sentence, R5 is added to rule 16, and no rule was added or renumbered.
4. `coding-standards/common.md`: holds. One sentence is added to "Markdown and YAML". It states R5 and names the rule "A write verifies its own result".
5. `docs/dev/change-standard.md`: holds. The R1 and R5 sentences are byte-identical to the template's (read in the diff). The citation now reads `(`skills/ordo/ordo-init/templates/shared-rules.md`, "No history in a rule file or a comment")`.
6. Contradiction greps: violated. Two statements on the tree contradict new rules and were not reported as stops (S1, S2), and the R4 grep missed `paper-review-panel` (P1).
7. Carry greps: holds. No count, list or position citation of the shared rules remains to change (greps above).

Cases of the brief's "Cases":

- R1 in the shared rules: met (line 22).
- R2 in the shared rules: met (line 27). Its conflict with other pages is S1.
- R3 in the shared rules: met. Line 14 answers "no": "An option that drops one is not offered."
- R4 in the shared rules: met (line 8).
- R2 and R3 in `plan-orchestration`, "Stops": met, each once (lines 481, 482).
- R1 in rule 6 and R5 in rule 16 of the template change standard: met.
- R1 and R5 in `docs/dev/change-standard.md`, same words: met.
- R5 in `coding-standards/common.md`: met.
- `grep '^- \*\*' ... | tail -1`: met (verify 5).
- `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` gives 1: met (verify 6).
- `sh skills/ordo/ordo-init/templates/sync_rules.test.sh`: met (`PASS: sync_rules.py scratch tests`).

## 1. Spec

- **SP1. Item 6 is violated: two contradictions were not reported as stops.** Item 6 says "A statement the builder finds that does contradict a new rule is reported as a stop and not changed." The statements in S1 contradict R2 as worded. The revision coach's effort table (S2) is, in my judgment, a contradiction of R4. The builder's report says "Everything in the brief is done" and raises no stop. Failure scenario: the orchestrator lands the step thinking R2 and R4 sit cleanly on the tree, and the user reads R2 at the gate without knowing that it clashes with the kind-5 reading item and with `/land`'s worktree item.

## 2. Proof

- **P1. The R4 contradiction grep does not cover the effort estimates of `paper-review-panel`.**
  - The report's grep for R4 is `'how much effort\|duration\|how long'`. It misses every effort estimate given as a time.
  - `grep -rn -i '[0-9] \(hours\|days\|weeks\|minutes\)' skills/` finds them:
    - `skills/academic/paper-review-panel/templates/editorial_decision_template.md:130` "### Total Estimated Effort", followed by `- **Minor Revision**: [X-Y days]`.
    - `skills/academic/paper-review-panel/agents/editorial_synthesizer_agent.md:311` and `:319`, the column "Estimated Effort", filled `[Time]`.
    - `skills/academic/paper-review-panel/examples/interdisciplinary_review_example.md:216` "(Estimated effort: 12-16 days)".
    - `skills/academic/paper-review-panel/examples/hei_paper_review_example.md:322`.
    - `skills/academic/paper/agents/peer_reviewer_agent.md:352` "Estimated Effort" column.
  - My reading: these are effort estimates a report gives unasked, not answers to a question about effort, so they do not contradict R4 as worded.
  - The report's claim that its greps found every relevant statement does not hold, and item 6's verdict rests on that claim. Failure scenario: the orchestrator accepts "no contradiction" for R4 without having seen these hits.

## 3. Standards

- **S1. R2 as worded contradicts open items that carry no options.**
  - Places:
    - `skills/ordo/ordo-init/templates/shared-rules.md`, bullet "An open item is for costs the user weighs." (line 27).
    - `skills/orchestration/plan-orchestration/SKILL.md`, "Stops", sub-bullet at line 481.
  - Hunks:
    - `+- **An open item is for costs the user weighs.** An open item is raised to the user only for options that each cost something the user would weigh.`
    - `+  - Its open item is raised only for options that each cost something the user would weigh.`
  - What is wrong: the rule says an open item exists only for options that each cost something the user would weigh. Several open items on the tree hold no options at all:
    - `skills/orchestration/plan-orchestration/references/self-rule.md:21`, kind 5, "The user's reading of a page a step writes. / The reading stays an open item."
    - `skills/orchestration/land/SKILL.md:245` and `:252-254`, "A worktree that cannot be removed", whose open item holds the worktree path and branches and is closed by running the removal.
    - `docs/glossary.md:72`, **open item**, second sense: "It is also a worktree `/land` could not remove, closed by running the removal."
    - The plan-orchestration Stops row "The roadmap diff", whose stop message is a diff to approve and not a set of options. The new sub-bullet governs it as well, because it sits under the bullet that governs every stop message.
  - This breaks `docs/dev/change-standard.md` rule 19, "A change leaves no two statements that contradict each other".
  - Failure scenario: an orchestrator in a repository that carries the shared rules has a step that writes a page the user must read. R2 tells it that an open item is raised only for options, so it does not book the reading. The user is never asked to read the page, and kind 5 is defeated.
  - The wording copies the brief's R2 line, so a narrowing such as "An open item that offers options is raised only when each option costs something the user would weigh" is the orchestrator's to rule on. That is why SP1 counts this as a missed stop.

- **S2. R4 contradicts the revision coach's effort table.**
  - Places:
    - `skills/ordo/ordo-init/templates/shared-rules.md`, bullet "An effort question is answered with the changes." (line 8).
    - `skills/academic/paper/agents/revision_coach_agent.md:166` "- Estimated revision effort: [Light / Moderate / Substantial]".
    - The same file, "## Effort Estimation" (`:196-203`), a table whose column "Typical Duration" runs from "1-3 days" to "4+ weeks (consider resubmission)".
  - Hunk: `+- **An effort question is answered with the changes.** A question about how much effort something is gets an answer that lists each change and the code it touches. The answer gives no duration.`
  - What is wrong: R4's trigger is "a question about how much effort something is", with no limit to code. "The code it touches" names what the answer lists, but it does not narrow which questions the rule covers.
  - The builder judged otherwise, on the grounds that R4 names code. I do not agree.
  - Failure scenario: in a manuscript repository set up by `/ordo-init`, the user runs `/paper revision-coach` and asks how much effort the revision is.
    - The agent's page tells it to answer "Moderate, 1-2 weeks".
    - `CLAUDE.md` tells it to give no duration.
    - The agent follows one instruction and breaks the other.
  - I agree with the builder that `skills/academic/paper/references/mode_selection_guide.md`'s "Expected Duration" lines describe how long a mode's run lasts. They answer no effort question and are no contradiction.
  - The revision coach is a copy of a source skill, so the resolution is the user's: R4 scoped to work in the repository, or the source copy left with a stated difference. That is a stop under item 6.

- **S3. The new R2 sub-bullet does not say what to do instead.**
  - Place: `skills/orchestration/plan-orchestration/SKILL.md`, "Stops", line 481.
  - Hunk: `+  - Its open item is raised only for options that each cost something the user would weigh.`
  - What is wrong: `docs/dev/skill-layout.md`, "Writing for an agent", first bullet, says "a rule written as a prohibition names the behaviour to do instead". R2 restricts when an open item is raised, but nothing says what the orchestrator does with a decision whose options do not each cost something, for example take the recommended option and book it.
  - The sentence also breaks no tie with the mandatory raises in the same skill:
    - `SKILL.md:527`, "Everything else that the rounds left undone ... is raised to the user as an open item".
    - `SKILL.md:156` and `:182`.
  - Failure scenario: an orchestrator with a leftover finding whose one sensible option costs nothing the user would weigh reads line 481 and does not raise it. Nothing tells it to book it or carry it out, so the finding is dropped.
  - The brief's "no more and no less" limits what the builder could add, so the wording is the orchestrator's to settle.

## 4. Behaviour

- **B1. A change to this repository's own rules is missing from the report's list of visible changes.**
  - Place: the report, section "Host- or user-visible changes".
  - Hunks, in `docs/dev/change-standard.md`, rule 6 and rule 16:
    - `+... Every target in scope of the change (each platform, configuration or build the change is meant for) compiles and works in the same change. A target is never left broken for a later change.`
    - `+... A YAML file is loaded, that is parsed as YAML, after every write to it. ...`
  - What is wrong: for this file the report lists only the citation change. Every builder and reviewer that works on Ordo reads this file first under every brief. From this step on, a builder that writes `docs/plan.yaml` or any YAML file must load it after the write. Before the step there was no such sentence.
  - Failure scenario: the orchestrator does not tell the user that Ordo's own builders now work under two new rules, and does not check the next briefs that write YAML for the load.

## Declined to judge

- Whether `plan-orchestration`'s `metadata.version` was already raised earlier in this plan, before b772895. A plan raises a skill's version once. This would be settled by `git log -L5,5:skills/orchestration/plan-orchestration/SKILL.md 0687b1f..b772895`, a git command outside the three allowed.
- The commands the report quotes that use other git commands: `git diff <file>` for each of the five files, `git diff --numstat`, and `git ls-files CLAUDE.md`. Not run. The diff content they stand for was read through `git diff b772895`.
- Whether the cases' first run was made before any change, and whether `git status --short` printed nothing then. The order cannot be checked from the end state.

Reviewer usage: aff8729b7d77a1e04, claude-opus-5-5, 149633 tokens, 23 tool uses, 5 min 42 s.

## Repair round 1, refuted

Verification, run from the worktree root (the brief's "Verify before you report"):

1. `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`
2. `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"` printed `ok: the plan-terms block equals the template` and `exit 0`
3. `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`
4. The brief's character-set `printf | xargs perl` check printed no line, then `exit 0`.
5. `grep -c '^- \*\*' ...shared-rules.md` printed `27`; the last bullet printed starts `- **No history in a rule file or a comment.** A rule file st`.
6. `grep -n 'last rule' docs/dev/change-standard.md` printed nothing, `exit 1`; `grep -c '"No history in a rule file or a comment")' docs/dev/change-standard.md` printed `1`.
7. `grep -n 'version' skills/orchestration/plan-orchestration/SKILL.md | head -1` printed `5:  version: "9.0.0"`. `git status --short` shows the five modified shipped files, all in "Paths this step writes", plus the untracked `briefs/1-round-1.md` and `reviews/1-report.md`.
8. Read: see the findings.

Commands the round's section quotes, rerun in the same form:
- `grep -rn -i '[0-9] \(hours\|days\|weeks\|minutes\)' skills/ | wc -l` printed `33`. The report says 33.
- I split the 33 lines by reading: 19 estimates of an author's revision time (revision_coach 3, failure_paths 1, editorial_decision_standards 4, editorial_synthesizer 2, editorial_decision_template 1, interdisciplinary example 4, hei example 4) and 14 other hits (citation_compliance 1, peer_reviewer 1, lookup.py 5, lookup.test.sh 6, registers.md 1). This matches the report's list line for line.
- `ls` of the `reviews/` folder and the per-ruling greps are reproduced by my own greps (open item hits, the sub-bullets at lines 481 and 482).
- The report's `git diff --numstat` is not run (see Declined to judge).

### Verdicts

Items of "What to build", for the whole diff since the base:
1. Shared rules: holds. Bullets R4 (line 8), R3 (line 14), R1 (line 22, directly after "Zero warnings", unchanged) and R2 (line 27) are present, and "No history..." is last. But R2's new second sentence contradicts other rules of the file (finding S1).
2. `plan-orchestration`: holds as built, version 9.0.0. The two new sub-bullets are in "Stops". The wording issue is S2.
3. Template change standard: holds (not changed this round).
4. `coding-standards/common.md`: holds (not changed this round).
5. `docs/dev/change-standard.md`: holds. Not changed this round, and the citation by label is in place (verify 6).
6. Contradiction greps: violated. The new R2 sentence in the shared rules contradicts three rules on the same page (S1).
7. Carry greps: holds (no count, list or position citation of the shared rules found; my grep on `last rule` printed nothing).

Cases:
- R1 in the shared rules: met.
- R2 in the shared rules: partial, because of S1.
- R3 in the shared rules: met.
- R4 in the shared rules: met. Line 8 now covers only a change to the repository.
- R2 and R3 in `plan-orchestration`, "Stops": partial. R3 is met, R2 is stated twice-qualified, see S2.
- R1 in rule 6 and R5 in rule 16 of the template change standard: met.
- R1 and R5 in `docs/dev/change-standard.md`, same words: met.
- R5 in `coding-standards/common.md`: met.
- `tail -1` of the bullets: met. `"No history..." )` count 1: met. `sync_rules.test.sh`: met.

Closures of rulings 1 to 6:
1. Ruling 1 (S1, narrowing to open items that offer options): done in both places. I re-read the four option-less open items (self-rule.md kind 5, land "A worktree that cannot be removed", Stops row "The roadmap diff", glossary line 72 second sense). None is a decision that offers options, so none contradicts the narrowed first sentence. The closure is not complete, because the sentence added by ruling 2 contradicts other rules (S1 below).
2. Ruling 2 (S3, what is done instead): written once in each place, as asked. The shared-rules sentence breaks three neighbouring rules (S1). The `plan-orchestration` sentence sets aside every raise and so clashes with the line before it (S2).
3. Ruling 3 (S2, effort rule): done. Line 8 now reads "how much effort a change to the repository is". The revision coach's table (lines 200 to 202) is an author's manuscript estimate and no longer in scope. No file under `skills/academic/` is changed (`git status --short`).
4. Ruling 4 (P1, grep listing): done; reproduced (above).
5. Ruling 5 (B1, visible changes of `docs/dev/change-standard.md`): the report adds the before and after of rules 6 and 16. The diff of that file against the base shows exactly those two sentences plus the citation change, so the statement is true.
6. Ruling 6 (SP1): closed only as far as 1 and 2 are closed; see S1 and S2.

### Findings

#### Spec
None. The round's delta (`diff -u` of the snapshot against the worktree) changes only the shared rules and `plan-orchestration` SKILL.md, in the three places the rulings name.

#### Proof
None. The report's counts and quotes reproduce.

#### Standards
- **S1. The new sentence of the open-items bullet contradicts three rules of the same file.**
  - Place: `skills/ordo/ordo-init/templates/shared-rules.md`, bullet "An open item is for costs the user weighs."
  - Hunk: `+ A decision whose options do not each cost something the user would weigh is taken with its recommended option, and the report states it.`
  - What is wrong:
    - "No silent design decisions" says a user-visible choice "is surfaced as a decision before it is built". The new sentence takes such a choice with the recommended option and states it in the report, after the fact, whenever one option costs nothing the user would weigh.
    - "Surface rule clashes: stop and tell" says "ask for a ruling before going on. A side is never picked silently". The new sentence takes the recommended option for a clash whose options do not each cost something.
    - "No question boxes" lists the decisions where the stop belongs to the user: a user-visible shape nothing names, a rule clash. The new sentence takes any of them with the recommendation.
  - This breaks the change standard's rule 19, "A change leaves no two statements that contradict each other". The ruling asked for the sentence, but it had to be worded or scoped so as to keep these three rules. The sentence has no "unless" clause of the kind the `plan-orchestration` copy has, so nothing in the file keeps those raises.
  - Failure scenario: in a repository that carries the shared rules, an agent faces a user-visible shape or a rule clash where one option is free and the others cost something. It reads the new sentence, takes the recommended option and reports it. The user never gets the stop that "No silent design decisions" and "Surface rule clashes" promise.

- **S2. The two sub-bullets under the stop-message bullet of "Stops" contradict each other.**
  - Place: `skills/orchestration/plan-orchestration/SKILL.md`, "Stops", sub-bullets after "It never goes through a question-box or multiple-choice tool."
  - Hunks:
    - `+  - An open item that offers options is raised only when each option costs something the user would weigh.`
    - `+  - A decision whose options do not each cost something the user would weigh is taken with its recommended option and stated in the report, unless this skill's text raises it, as "Rules" raises what the rounds left undone.`
  - What is wrong: every stop of the table above them (a shape nobody named, a wrong premise, a red check, a rule clash, a finding that is the user's) is "this skill's text raises it". The second sub-bullet therefore sets aside the first for every stop the skill raises, and the first sub-bullet then restricts nothing a reader can act on. A reader of the first bullet reads that a stop whose options are free is not raised, and of the second that it is. The second sentence is also about 33 words, over the prose standard's "under roughly 20 unless the mechanism needs more"; the report discloses this and the reason (one sentence asked for). The refuter's earlier S3 asked for the instead-action without setting aside the table, and this wording does neither cleanly.
  - Failure scenario: an orchestrator hits a red check whose options are one free fix and one costly one. Bullet 1 says "do not raise". Bullet 2 says "unless the skill raises it", and the table raises a red check. It cannot tell which applies and either raises a stop the user ruled out or takes a decision the skill makes a stop.

#### Behaviour
None new. The report's list of visible changes now includes the two sentences of `docs/dev/change-standard.md`. A reader of the shared rules sees one more behaviour change from this round that the report states only as a rule sentence: a decision with a free option is taken and reported instead of raised. That is the content of S1.

### Declined to judge

- The report's `git diff --numstat` (a git command other than the three allowed). The diffs it stands for were read through `git diff b772895` and the snapshot `diff -u`.
- Whether `metadata.version` of `plan-orchestration` was already raised earlier in this plan (needs `git log`), unchanged from the first review.

Reviewer usage: a82688a6d8c685329, claude-sonnet-5-5, 87068 tokens, 6 tool uses, 1 min 17 s.

## Closed

- SP1, S1, S2 and S3 of the first run: closed in round 1 for the narrowing of both rules (the open-items rule to an open item that offers options, the effort rule to a change to the repository); the sentence round 1 added on what is done in place of raising is taken out at landing, as the next bullet says.
- P1 and B1 of the first run: closed in round 1, in the report's section "Repair round 1".
- S1 and S2 of the run over round 1: fixed at landing. The sentence "A decision whose options do not each cost something the user would weigh is taken with its recommended option" is removed from `skills/ordo/ordo-init/templates/shared-rules.md`, bullet "An open item is for costs the user weighs", and the sub-bullet that holds it is removed from `skills/orchestration/plan-orchestration/SKILL.md`, "Stops". Each place then holds the rule of the entry's goal, narrowed to an open item that offers options. Whether either page should also say what is done in place of raising is part of the user's reading of the rules, open item A.
