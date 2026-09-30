# Step 9 refuter report (on .agents/worktrees/2e-9, base 9f667d6d8566f9edd8f304a9391e660fa3aeb403)

This report cites a page (the rules file, a standard, a skill's text) by its section, never by a line number, because a page's lines move and a section's name does not. A finding in a skill's text keeps its `file:line` in the worktree so it can be found.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

The brief's cases and the commands the builder's report quotes, rerun from the worktree root. `git rev-parse HEAD` printed `9f667d6d8566f9edd8f304a9391e660fa3aeb403`, so the report's `git diff --stat HEAD` is the same as a diff against the base.

```
git grep -n -E "approval it would need later|need approved later" -- skills docs README.md
  after: docs/glossary.md:49, skills/plan-orchestration/SKILL.md:298, skills/plan/templates/orchestrator-state.md:38, skills/repo-setup/templates/plan-terms.md:44, skills/spec/SKILL.md:193 (rc=0)
  base (git grep <base>): rc=1, nothing
git grep -n "The user approves what it computes" -- skills
  after: rc=1, nothing
  base: <base>:skills/plan-orchestration/SKILL.md:204 and <base>:skills/plan-retro/SKILL.md:85
git grep -n -c "already approved in full, by a ruling on an open item" -- skills
  after: skills/ordo-init/SKILL.md:1, skills/repo-setup/SKILL.md:1, skills/roadmap/SKILL.md:1
  base: rc=1, nothing
git grep -n -E "names another repository|path from the folder that holds this repository" -- skills
  after: skills/roadmap/SKILL.md:158 and :159
  base: rc=1, nothing
grep -n -E "research-hub's|`tools/manuscript`" docs/roadmap.md
  after: rc=1, nothing
  base (git show <base>:docs/roadmap.md | grep): line 151 only
python3 skills/repo-setup/templates/sync_rules.py . --only glossary
  ok: the plan-terms block equals the template (rc=0)
git diff --stat <base> -- . ':!.scratch' | tail -1
  10 files changed, 14 insertions(+), 7 deletions(-)
git diff --name-only <base> | while read f; do LC_ALL=C grep -n '[^ -~]' "$f"; done
  nothing
Exact text: a python comparison of each dictated line with the file's lines found each one, whole, at plan-orchestration:204 and :298, spec:192 and :193, plan-retro:85, roadmap:158, :159 and :161, ordo-init:125, repo-setup:179 and docs/roadmap.md:151. Items 4 and 5 were read in the diff.
wc -l over the ten files: 1686 total, which matches the report.
python3 description-length command of skill layout: highest 1022 (spec), then 997 (roadmap).
Main checkout, git status --short: " M .scratch/2-e-grill/orchestrator-state.md" and "?? .scratch/2-e-grill/agents/reviews/9-report.md", which are only the orchestrator's ledger changes. The saved report and the worktree copy are identical (diff printed nothing). $TMPDIR holds edit9.py, the script the report names.
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. `skills/plan-orchestration/SKILL.md:298` is the dictated sub-bullet, placed after the question-box sub-bullet. The sentence's reach is Spec 1.
- 2: holds. `plan-orchestration:204` matches the dictated text exactly.
- 3: holds. `spec:192` and `:193` match the dictated text exactly.
- 4: holds. The state template's line 38 is changed as dictated and the rest of the line is kept (diff).
- 5: holds. `plan-terms.md:44` is changed as dictated, the glossary line 49 was synced, and the sync prints ok.
- 6: holds. `plan-retro:85` matches the dictated text exactly.
- 7: holds. `roadmap:158` and `:159` come after 157. The dictated example in `:159` breaks a repository standard (Standards 1).
- 8: holds. `docs/roadmap.md:151` matches the dictated text exactly.
- 9: holds. The bullet is at `roadmap:161` (end of the file), `ordo-init:125` (after 124) and `repo-setup:179` (end of the file). The contradictions it leaves are Standards 2 and Spec 2 and 3.

Cases of the brief's "Cases":

- The "approval it would need later" grep: met. Five files, one line each, and nothing on the base.
- The "The user approves what it computes" grep: met. Two hits on the base and none after.
- The "already approved in full" grep: met. One hit in each of the three skills, and none on the base.
- The "names another repository" grep: met. The two roadmap bullets, and nothing on the base.
- The `research-hub's|tools/manuscript` grep on docs/roadmap.md: met. Line 151 on the base and nothing after.
- The sync ok line: met.
- The diff-stat case: met. The ten files, with `10 files changed, 14 insertions(+), 7 deletions(-)`.
- Reading, skill layout: partial. Each bullet is at the right indentation, and "project" does not appear in the new roadmap bullets. Two dictated bullets each join two rules (Standards 3).
- Reading, roadmap:156's "the next rule": met. Line 157 is still the rule about entries under "Not yet specified".
- Reading, the one-ruling sentences against the recurring-findings pass, plan-retro and the rules file: met. The ruling or decision on the proposal is the approval of the computation. No text asks again, and the rules file's "A new script needs the user's approval of what it computes" is satisfied by that ruling.
- Reading, rule 19 against the approval stops: partial. The Stops rows and the Rules bullet disagree in text (Standards 2), and `/plan`'s approval stop was not read (Spec 2).
- Reading, the roadmap bullets against lines 73, 151, 172, 179 and 218 and the other Rules: partial. Lines 73, 151, 172 and 179 comply. Line 218, and every future `done` record that quotes a gate command with an absolute path into another repository, is made wrong by the unconditional bullet 159 (Spec 4).

## 1. Spec

- 1. `skills/plan-orchestration/SKILL.md:298` and `skills/spec/SKILL.md:193`: "Each option states in full every approval it would need later ... The user's ruling on the item then approves them too, and the work goes on with no second stop."
  - What is wrong: the text is dictated by the brief and was written exactly, so item 1 holds. The sentence has no limit for an approval whose content does not exist when the option is written: the user's reading of a page or a figure a step will write (plan.md's "Overnight work" 2, steps 6, 12 and 12a), or a gate's output at the closing. Such an approval cannot be "stated in full", and the sentence says nothing about what happens to it. Its last clause, "the work goes on with no second stop", is unconditional.
  - Failure scenario: the orchestrator writes an open item for a step whose check is Axel's reading of a new page, lists "Axel reads the page" among its option's later approvals, and after the ruling treats the reading as already approved and ticks the step. Or it leaves the reading out because it cannot state it in full. Either way the reading gate is skipped.
  - Fix for the orchestrator: limit the sentence to "every approval whose content it can state now", and add that an approval of work not yet done stays a stop.
  - Verdict: none (the item holds as dictated).
- 2. `skills/plan/SKILL.md`, Stops, row "The drafted step list" ("Every plan, after Steps 2 ... The user's approval or correction"), and its Rules "Write `plan.md` once the user has approved or corrected it".
  - What is wrong: `/plan` is an approval stop just like `roadmap`, `ordo-init` and `repo-setup`, but it did not get the item 9 bullet. The brief's rule-19 case does not name it. This is a rule-19 contradiction that no item covers.
  - Failure scenario: an open item's option states a new plan's step list in full ("open plan X with steps 1 to 3 as listed"), and Axel rules it. `/plan` then stops at "The drafted step list" a second time, which makes plan-orchestration:298's "the work goes on with no second stop" false for it.
  - Fix for the orchestrator: add the same bullet to `plan`'s Rules, or raise it as a stop.
  - Verdict: rule-19 reading case partial.
- 3. `skills/roadmap/SKILL.md:161`, `skills/ordo-init/SKILL.md:125` and `skills/repo-setup/SKILL.md:179`: "... is written without stopping for approval again, and the report names that ruling."
  - What is wrong (dictated text): none of the three skills defines a report. `git grep -n -i report` on the three SKILL.md files finds only these bullets and ordo-init's check output. None of the three reads the ledger's Rulings or the state file's open items in "What it reads", so the session cannot compare its own draft with the ruling's text to confirm that the content was "approved in full".
  - Failure scenario: the orchestrator runs `/roadmap` for a change like the one in "Open item B". The `/roadmap` session has only the invoker's word for the ruling, and it drafts in the file's own format, which can differ from the ruled text. It then either writes a diff the ruling did not state, with no stop, or stops anyway. Either way it names the ruling nowhere, because it has no report, so the commit carries no trace of why the approval stop was skipped.
  - Fix for the orchestrator: name the place where the ruling is recorded (the commit message, or the reply to the user), and add the ruling's text, as the invocation gives it, to what the skill reads.
  - Verdict: none (item 9 holds as dictated).
- 4. `skills/roadmap/SKILL.md:159`: "A file or folder in another repository is written as its path from the folder that holds this repository, ..."
  - What is wrong: the bullet has no condition, but decision 6 of the brief and the reading case treat `docs/roadmap.md:218` (the absolute path `/Users/axelfaes/workspace/research-hub/.agents/skills` inside a quoted gate command) as allowed. The roadmap skill's `done` Steps 1 takes "the command and the lines it printed" as they were printed.
  - Failure scenario: `/roadmap done 16` quotes a gate command that holds an absolute path into research-hub. Bullet 159 tells the session to rewrite that path in the done record, so the record is no longer the command that was run. Or the session leaves it, and the entry breaks the rule.
  - Fix for the orchestrator: add "except in a quoted command or its output" to the bullet.
  - Verdict: the roadmap-bullets reading case partial.
- 5. The builder's report, "Open items of the state file": "None from this step."
  - What is wrong: the brief's Report section and rule 7 of the rules file ask for the state file's open items verbatim. The state file holds two: "Old rule 13 in game-engine and cathedra" and "Step 6 reading". The report also gives no first run on the unchanged tree for the reading cases ("Reading cases have no first run"), although the brief says every case is checked on the unchanged tree first. At least the roadmap:156 reading and the rule-19 reading could be read there.
  - Failure scenario: a reader of the report takes it that no open item is pending.
  - Verdict: none.

## 2. Proof

none

## 3. Standards

- 1. `skills/roadmap/SKILL.md:159`: "such as `research-hub/tools/manuscript`".
  - What is wrong: `README.md`'s first paragraph and the rules file's "Rules this repository already states" say "The skills carry no project name and no path". `git grep -n -i -E "research-hub|game-engine|cathedra|oculus" -- skills` (excluding repo-setup's templates) prints only this line, so it is the one project name and path in any shipped skill. The text is dictated by item 7.
  - Failure scenario: the roadmap skill, installed in any other repository, tells its sessions to write paths in the form of one named repository of Axel's. The example should be generic, such as `<other-repository>/tools/scripts`.
  - Verdict: none (item 7 holds as dictated).
- 2. `skills/roadmap/SKILL.md` Stops row "The change" ("Every change of `add`, `move`, `done` or `drop`, at Steps 3") and `:141` ("each waits on the user"). `skills/ordo-init/SKILL.md` Stops row "The draft" ("Every setup, at Steps 11"), `:119` ("The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3"), and the row "A fix in the check". `skills/repo-setup/SKILL.md` Stops rows "The draft" ("Every setup") and "The drafted sync change", `:158` ("each waits on the user") and `:173`.
  - What is wrong: the new Rules bullet is an exception to these stops, but it stands in a separate bullet at the end of Rules. Skill layout, "Lists and tables", says "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule", and its Anti-patterns name "A rule folded into a table cell until its exception is gone". The "When" cells still say "Every" and the notes under the tables still say "each waits on the user". This is rule 19 of the rules file. The builder flagged `ordo-init:119` and `repo-setup:173` and read them as consistent, on the reading that the ruling is the approval. That reading holds for "approves", but not for "Every change ... waits on the user".
  - Failure scenario: after a ruling like "Open item B", the `/roadmap` session reaches Steps 3 and 4 and the Stops table, which is the section skill layout makes the place for stops. It finds "Every change" waits on the user, and it stops a second time, which is the stop the ruling was meant to remove.
  - Fix for the orchestrator: put the exception into the "When" cells and the notes under the tables ("Every change not already approved by a ruling ..."), or into Steps 4 and 11, and into `ordo-init:119` and `repo-setup:173`.
  - Verdict: rule-19 reading case partial.
- 3. `skills/roadmap/SKILL.md:158` ("A goal says what the work delivers, and names another repository only where ...; the gate and the dependencies name one under the same condition, ...") and the item 9 bullet ("... is written without stopping for approval again, and the report names that ruling").
  - What is wrong: skill layout, "Lists and tables", says "two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets". "A goal says what the work delivers" can be broken while the naming rule holds. "The report names that ruling" can be broken while the no-second-stop rule holds. Both texts are dictated.
  - Failure scenario: a reviewer checking a later diff against one of these rules cannot tell where each rule ends, which is the reason skill layout gives for "A paragraph holding several rules".
  - Verdict: skill-layout reading case partial.

## 4. Behaviour

none. The report states each user-visible change with its before and after.

## Declined to judge

- Whether `docs/roadmap.md:151` may be edited inside a step on the orchestrator's overnight decision (decision 6) rather than through `/roadmap` with Axel's approval. No shipped rule requires roadmap edits to go through `/roadmap` (`git grep` over CLAUDE.md, docs/dev, README.md and skills found none), and the decision is booked for Axel to overturn, so this is his call.
- Whether the sentence lengths of the dictated sentences (about 35 words for plan-orchestration:298) fall under the prose standard's "unless the mechanism needs more". The brief check weighed this, and the orchestrator dictated the text.
- Whether "a ruling on an open item" should also cover a decision Axel gives outside an open item, such as a `/grill` answer (step 12). That is a design choice for Axel.

Reviewer usage: tokens and minutes not visible to me (not verified); about 25 tool uses.

## Repair round 1, refuted

Run on the worktree `.agents/worktrees/2e-9`, base 9f667d6d8566f9edd8f304a9391e660fa3aeb403, with the changes uncommitted. The round's delta is `git diff 9f667d6 -- . ':!.scratch'` compared with `.scratch/2-e-grill/agents/reviews/9-round-0.diff`, read with `diff`. I changed nothing.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0

A  git grep -n -c "already approved in full" -- skills; echo rc=$?          -> rc=1, nothing
B  git grep -n "approved by a ruling" -- skills docs                          -> docs/glossary.md:10, plan-terms.md:5 (the term); plan/SKILL.md:58, :76; roadmap/SKILL.md:48, :129; ordo-init/SKILL.md:80, :96, :103, :107, :119; repo-setup/SKILL.md:57, :58, :99, :151, :153, :173
   on the base: git grep -n "approved by a ruling" 9f667d6 -- skills docs README.md -> rc=1
C  git grep -n "names another repository" -- skills                          -> skills/roadmap/SKILL.md:158 (rc=0)
D  git grep -n "another repository" -- skills/roadmap/SKILL.md               -> :158, :159, :160; on the base, rc=1 over skills docs README.md
E  git grep -n "research-hub" -- skills ':!skills/repo-setup/templates'      -> rc=1, nothing
F  git grep -n -E "approval it would need later|need approved later" -- skills docs README.md -> docs/glossary.md:50, plan-orchestration/SKILL.md:298, plan/templates/orchestrator-state.md:38, repo-setup/templates/plan-terms.md:45, spec/SKILL.md:193
G  git grep -n "The user approves what it computes" -- skills               -> rc=1
H  grep -n -E "research-hub's|`tools/manuscript`" docs/roadmap.md            -> rc=1
I  git diff --stat 9f667d6 -- . ':!.scratch' | tail -1                       -> 11 files changed, 31 insertions(+), 22 deletions(-)
J  git diff --name-only 9f667d6 | while read f; do LC_ALL=C grep -n '[^ -~]' "$f"; done -> nothing
Exact text: a python check found every text the round brief dictates, whole, in the changed files. The When cells were read in the grep B output.
Open items: the report's "Open items of the state file, verbatim" section, compared with the state file's Open items section by diff: IDENTICAL.
Main checkout, git status --short: " M .scratch/2-e-grill/agents/reviews/9-report.md", " M .scratch/2-e-grill/orchestrator-state.md". The saved report and the worktree copy are identical (diff).
```

Every command the builder's round section quotes printed what it quotes. Case C prints line 158, which the round brief's own dictated bullet contains. That is the round brief's error, as the builder reports, and not the builder's.

### The first report's findings

- **Spec 1: closed.** `plan-orchestration:298-299` and `spec:193-194` now limit the rule to an approval "whose content exists when the option is written". An approval of work not yet done, such as Axel's reading of a page a step will write, "stays a stop of its own". Take an open item whose option needs that reading: the reading stays a stop, which agrees with the ruling "Overnight work" 2.
- **Spec 2: closed.** `/plan` Steps 3 and its Stops row "The drafted step list" now carry the exception. The exception opens a new gap, Finding 5.
- **Spec 3: partly closed.** The term now names where the ruling goes (the commit message) and when the exception applies (the invocation quotes the ruling, and the draft is the change the ruling stated). These mechanics are written only in the glossary, which none of the skills applying them reads, so the rerun does not show a session reaching them (Finding 1). A repository whose commit rule forbids commits has no commit message for the ruling (Finding 2).
- **Spec 4: closed.** A quoted command and its output now keep their paths. The wording that closes it leaves "the one exception" false (Finding 6).
- **Spec 5: closed.** The two open items are quoted verbatim (the diff above), and the round section notes a first read of the reading cases on the base. The report's earlier sections still say "Everything in the brief is done" and "None from this step"; the round section says it replaces them.
- **Standards 1: closed.** The example is now `<other-repository>/tools/scripts`, and grep E prints nothing.
- **Standards 2: closed for each place it names.** Each "When" cell now holds its exception. With that, the notes "each waits on the user" (`roadmap:141`, `repo-setup:158`) are true again, since a row whose condition is not met does not fire. The same contradiction remains in places the finding did not list (Finding 3 and Finding 4).
- **Standards 3: closed.** The goal and gate rule is split into bullets 158 and 159, and the item 9 bullet is gone. The clause "A goal says what the work delivers" was dropped rather than moved into a bullet of its own. No ruling or step line asks for that clause, so nothing a ruling required was lost.
- No closure removes a check, and no change reaches beyond what the round brief dictates.

### Verdicts

Items of the brief's "What to build", as the round brief replaces them:

- 1: holds. The round's text of point 7 is at `plan-orchestration:298-299`, after the question-box sub-bullet.
- 2: holds. `plan-orchestration:204` is exact.
- 3: holds. `spec:192` is exact, and `:193-194` hold the round's text of point 7.
- 4: holds. The state template's line 38 is changed as dictated (read in the diff).
- 5: holds. `plan-terms.md:45` is changed as dictated, the glossary is synced, and the sync prints ok.
- 6: holds. `plan-retro:85` is exact.
- 7: holds. `roadmap:158-160` hold the round's text of point 8. The wording of 160 is Finding 6.
- 8: holds. `docs/roadmap.md:151` is exact.
- 9: holds as the round's points 1 to 6 replace it. The bullet is gone from the three skills (grep A), and the term and the sixteen uses are written exactly (grep B and the python check). The contradictions still open are Findings 1 to 5.
- Round point 9: holds (the open-items diff above).

Cases:

- The "approval it would need later" grep: met (grep F, five files).
- The "The user approves what it computes" grep: met (grep G).
- The "already approved in full" grep, with the round's expectation of nothing: met (grep A).
- The "names another repository" grep: met under the reading of case D. The round brief's expectation of nothing is its own error.
- The "approved by a ruling" grep: met (grep B, the term and each use).
- The "research-hub" grep over skills: met (grep E).
- The `research-hub's|tools/manuscript` grep on `docs/roadmap.md`: met (grep H).
- The sync ok line: met.
- The diff-stat case: met. The counts are 11 files, 31 insertions and 22 deletions, as the report states.
- Reading, skill layout: partial. Each bullet holds one rule at the right indentation, and "project" is not used in the new roadmap bullets. The rules the term carries break skill layout's "Where a rule goes" (Finding 1).
- Reading, `roadmap:156`'s "the next rule": met. It still points at 157.
- Reading, the one-ruling sentences against the recurring-findings pass, `plan-retro` and the rules file: met.
- Reading, rule 19 against the approval stops: partial (Findings 3 and 4).
- Reading, the roadmap bullets against `docs/roadmap.md` 73, 151, 172, 179 and 218: met. Line 218's absolute path now falls under "a quoted command ... keep[s] the paths they had". The wording is Finding 6.
- Round reading, each changed stop has its exception in the same row or step: met.
- Round reading, `ordo-init` Rules 1 against Steps 11: met.
- Round reading, the term against each place that uses it: partial (Finding 1).
- Round reading, the two new `plan-orchestration` sub-bullets against the ruling "Overnight work" 2: met.

### Findings

1. **Standards (skill layout, "Where a rule goes"; plan-terms format, "Stated in").** Glossary term `plan-terms.md:5`, `docs/glossary.md:10`: "when the invocation quotes that ruling and the drafted change is the change it stated. The skill writes it without its approval stop and names the ruling in the commit message. Stated in: `plan`, Steps 3; `roadmap`, Steps 4; ..."
   - What is wrong: the term carries three rules for one point of the work: quote the ruling in the invocation, compare the draft with the ruling, and name the ruling in the commit. None of them is written in the steps it lists under "Stated in". Those steps only use the phrase "approved by a ruling".
   - The commit steps say nothing about naming a ruling: `roadmap` Steps 5 ("the subject naming the entry and what changed"), `ordo-init` Steps 14, `repo-setup` Steps 12 and sync 9, and `plan` Steps 6.
   - Nothing in `plan-orchestration:298` or `spec:193` tells the orchestrator to quote the ruling when it invokes the skill.
   - No skill's "What it reads" lists `docs/glossary.md` (`git grep -n -i glossary -- 'skills/*/SKILL.md'` finds only a mention in `ordo-init:67`).
   - Skill layout says "A rule that says what to do at one point of the work goes in that step's item". Every other term's "Stated in" points at text that states the rule; for example, `plan`'s Rules states **authority**.
   - `ordo-init`'s "Checking an existing file" 5, which also uses the term, is missing from its "Stated in".
   - Failure scenario: after a ruling like "Open item B", the orchestrator runs `/roadmap` and quotes no ruling, because nothing it reads asks for that. `/roadmap` reads "or at once when it is approved by a ruling" in plain English, takes the invoker's word for it, writes a draft that may differ from the ruled text, and commits with a subject that does not name the ruling.
   - Verdict: the skill-layout reading case and the term-uses reading case are partial.

2. **Spec (the term against the commit rule).** Same term: "names the ruling in the commit message". `ordo-init` "What it reads" 3: "or, when it runs alone, the user's answer at the approval stop of Steps 11".
   - What is wrong: when `/ordo-init` runs alone, its commit rule comes from the approval stop the ruling now skips, so the session has no commit rule.
   - Under `/repo-setup`, and in any repository whose commit rule forbids commits (the default answer to question 5 is "commit only when told"), the skill writes no commit. It raises "No commit allowed" and the user commits, so the ruling is named nowhere.
   - Failure scenario: `/ordo-init` is run alone under a ruling. The session then does one of three things, each wrong: it asks the commit question (a second stop), commits without a commit rule, or stops at "No commit allowed". In the last case the user's commit message carries no ruling, although the term says the skill names it.
   - Verdict: the term-uses reading case is partial.

3. **Spec (rule 19 of the change standard).** Stops the exception does not reach, which the term's "Stated in" and `plan-orchestration:298` ("with no second stop") contradict:
   - `repo-setup` Stops "The questions" ("Every setup, at Steps 2") and `ordo-init` Stops "Worker, reviewer and libraries" ("Every setup, at Steps 6") both come before the draft. A ruling that stated the draft in full already holds those answers.
   - `repo-setup` Steps 8, "Run `/ordo-init`, with its own draft and approval". The Tree gives `.agents/plan.yaml` and `docs/dev/building.md` to `/ordo-init`, so `/repo-setup`'s ruled draft does not hold them.
   - `repo-setup` sync 3 and its Stops row "A hunk to rule on" (`sync` exits 1, "`--write`, after the approval"). This is the usual sync of a changed block, and the term covers only sync 6, the exit-2 path.
   - Failure scenarios:
     - An open item's option states a new repository's whole setup, and Axel rules it. `/repo-setup` still asks the nine questions, and then runs `/ordo-init`, which stops for its own draft: two stops after one ruling.
     - An option states "sync the plan-terms block of repository X" with its diff, and Axel rules it. `sync` exits 1 and stops per hunk.
   - Verdict: the rule-19 reading case is partial.

4. **Standards (rule 19).** `skills/ordo-init/SKILL.md:124`, Rules 5: "A change to an existing file, `.gitignore` included, is shown as a diff and made after approval."
   - What is wrong: the brief's rule-19 case names this line. It has no exception, while Steps 10 shows the `.gitignore` change "as Rules 5 says" and Steps 11 now skips the stop for a ruled draft. Check fixes to an existing file ("Checking an existing file" 5) fall under it too.
   - Failure scenario: a ruled draft that adds `/.agents/worktrees/` to an existing `.gitignore`. Steps 11 says to write it at once, and Rules 5 says to show the diff and wait for approval. Depending on which one the session follows, it either stops a second time or breaks a rule of its own skill.
   - Verdict: the rule-19 reading case is partial.

5. **Spec / Behaviour.** `skills/plan/SKILL.md:58` ("or at once when the step list is approved by a ruling") and `:76`.
   - What is wrong: the Steps 3 stop shows more than the step list. It also shows the goal, the gate, and the answer to "could this pass without the goal being reached?" for the gate and for each step's check.
   - Steps 2 sends a weak copied gate "to the user at Steps 3, since the gate is the roadmap's and the user's".
   - Those answers are drafted after the ruling, which makes them work not yet done when the option was written. `plan-orchestration:299` keeps such work a stop of its own, but `plan`'s exception is conditioned on the step list alone.
   - Failure scenario: `/plan` is opened on an entry whose ruled option stated the step list. The copied roadmap gate is "the file exists", and Steps 2 answers "yes, it could pass". The session writes `plan.md` at once, and Axel never sees that the gate can pass without the goal.
   - Verdict: the rule-19 reading case is partial.

6. **Standards.** `skills/roadmap/SKILL.md:160`: "..., the one exception to the next rule; a quoted command and its output keep the paths they had."
   - What is wrong: the added clause is a second exception to "Every path is relative to the repository root" (for example, `docs/roadmap.md:218`'s `/Users/...` path), so "the one exception" is now false. The text is dictated.
   - Failure scenario: a session applying "the one exception" to a `done` record rewrites an absolute path inside a quoted gate command to a relative one, because it reads the path-form bullet as the only exception.
   - Verdict: none. Item 7 holds as dictated, and the roadmap reading case is met.

### Declined to judge

- Open item B's change (roadmap entry 11's goal rewritten) is not an `add`, `move`, `done` or `drop`, and `/roadmap` has no command that edits an entry's goal. The skill text is not in this step's diff, so the gap predates the step.
- Whether a ruled step list is tagged `(approved)` or `(ruling <name>)` in the new `plan.md`. Steps 3 says `(approved)`, and the Rules tie `(ruling <name>)` to a line of the new plan's own Rulings. This is Axel's design call.
- Whether the term **open item** and the state template (`orchestrator-state.md:38`) should carry the same limit "whose content exists when the option is written". They only ask for the later approvals to be listed, so they do not contradict `plan-orchestration:299`.
- Whether the one-ruling rule should also cover a decision Axel gives outside an open item, such as a `/grill` answer. This is Axel's design call.

Reviewer usage: tokens and minutes not visible to me (not verified); 24 tool uses.
