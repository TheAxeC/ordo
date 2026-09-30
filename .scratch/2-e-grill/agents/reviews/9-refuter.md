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
