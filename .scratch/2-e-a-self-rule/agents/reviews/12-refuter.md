# Step 12 refuter report (on .agents/worktrees/2ea-12, base 3659816)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ (cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12 && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?")
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 11 commands passed
exit 0

Verify 2: for s in ...; do printf '%s ' $s; grep -m1 'version:' skills/$s/SKILL.md; done
diagnose 1.1.0, grill 1.3.0, land 1.9.0, ordo-help 1.9.0, ordo-init 1.2.0, plan 1.11.0, plan-orchestration 2.11.0, refute 1.8.0, repo-setup 1.3.0, roadmap 1.3.0, spec 1.8.0, plan-retro 1.2.1, session-retro 1.0.0 (each printed as `<name>   version: "<v>"`)

Verify 3: git diff --name-only; git status --short --untracked-files=all
the 15 tracked paths of "Paths this step writes" (M), and ?? .scratch/2-e-a-self-rule/agents/reviews/12-report.md; nothing else

Verify 4: description lengths
905 diagnose, 877 grill, 726 land, 503 ordo-help, 632 ordo-init, 961 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 861 repo-setup, 1022 roadmap, 779 session-retro, 987 spec

Verify 5: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1

Verify 6: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

Verify 7: sed -n 22,28p docs/dev/skill-layout.md
line 22 as on main, then the five bullets of item 0, then an empty line (od -c of line 28 prints \n)

Item 0 word for word: the five dictated bullets of 12.md extracted and diffed against lines 23-27: identical; git diff --stat 3659816 -- docs/dev/skill-layout.md: 1 file changed, 5 insertions(+), 0 deletions.
Item 4 word for word: the five dictated bullets of 12-cases.md diffed against skills/plan/SKILL.md (from "The closing step skips the cost script only when the ledger"): identical.

Frontmatter lines changed (git diff -U0 3659816 -- 'skills/*/SKILL.md' | grep -E '^[-+](description|name|metadata|  version|---)'): the eleven version lines, and the ordo-help description (Triggers on gains "which choices await my review").

Cases 13 to 17 (and two extra near-misses), plan_cost.py <scratch ledger> <empty transcript root>, run from the worktree:
case 13: error: the ledger names no agent, exit 1
case 14: error: the ledger names no agent, exit 1
case 15: error: the ledger names no agent, exit 1
case 16: error: no transcript of agent abc123 under ..., exit 1
case 17: error: no transcript of agent abc123 under ..., exit 1
extra, agent bullet inside a fenced block under ## Agents: error: no transcript of agent abc123 ..., exit 1
extra, tab-indented agent bullet under ## Agents: error: the ledger names no agent, exit 1

Builder's quoted evidence, rerun:
- the frontmatter/heading python check: same eleven lines as the report (name=folder True, Triggers on: last True, first four True, last three True, counts as in Verify 4).
- python3 <builder scratch>/dash.py skills/*/SKILL.md skills/plan-orchestration/references/self-rule.md docs/dev/skill-layout.md | grep -v ...: prints only "exit-of-the-scan-pipeline-done", as reported.
- intro sentence counts: diagnose 2, grill 2, land 3, ordo-help 1, ordo-init 2, plan 2, plan-orchestration 3, refute 3, repo-setup 2, roadmap 2, spec 3, as reported.
- bold outside a list label: one line, skills/grill/SKILL.md "Writing what settled" 2 (the glossary entry form in backticks), as reported.
- sed -n 21p skills/plan/templates/plan.md; the plan-orchestration "Usage" closing-report line; glossary "closing report" and "closing step": as quoted, each still true.
- git show 3659816:skills/plan-orchestration/SKILL.md | sed -n 289p and git show 3659816:skills/plan/SKILL.md | sed -n 86,92p: as the report cites.
- grep -rn "format is the file" . --exclude-dir=.scratch --exclude-dir=.git: no output, exit 1.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 0: holds. The five bullets equal the brief's text (diff of the extracted text is empty), they follow line 22, and the page's diff is 5 insertions and 0 deletions.
- 1: violated. Spec 2: the whole-skill reading against "Lists and tables", "Sections, in order" and "Where a rule goes" left breaks unfound, and the per-skill verdicts say "fixed" for sections that still break.
- 2: violated. Spec 1: one fix changes a rule of `grill`. Spec 2: breaks of whole-skill sections are left in place, one of them sent to the entry 23 list as base text. Spec 3: two "Writing for an agent" fixes were made in text this plan did not write.
- 3: holds. The eleven `version:` lines carry the ruled values, `plan-retro` and `session-retro` are unchanged (Verify 2), and no `version:` line outside the eleven changed. The one other frontmatter change, the `ordo-help` description, is an item 2 fix and is taken up under Behaviour 1.
- 4: holds. The five bullets are word for word (diff empty), and the bullets after them keep every rule. Cases 13 to 17 run as the ruling says. The texts the ruling names (`skills/plan/templates/plan.md` line 21, `plan-orchestration` "Usage", the glossary entries "closing report" and "closing step") and `README.md`'s closing paragraph stay true. Spec 4 records that one of the bullets after them was split.

Cases of the brief's "Cases":

- 1 plan-orchestration 2.11.0: met. Each change since 9fc91dc either acts only under `self_rule`/`next_entry` or adds to the output (the closing report, the Dictated text hold, agent ids in records). Under the default keys a ledger written at 9fc91dc closes as before, by item 4. This reads "adds to its output" as covering a field added inside the `reviewer_report` record, as the cases ruling does (see "Declined to judge").
- 2 grill 1.3.0: met. `--self-rule` is new input, and the lookup bullets in `## Agents` add to the output.
- 3 plan 1.11.0: met. The new keys are written into the block, the Agents section and the closing report are added to the output, and `--self-rule` is new input. A 9fc91dc-era ledger (no `## Agents` heading) now skips the script and closes: case 13, rerun.
- 4 roadmap 1.3.0: met. "What it reads" 6 accepts a "(self-rule)" bullet for `add`, which it refused before. The heading rename changes no run.
- 5 refute 1.8.0: met. `repair_reviewer` defaults to the `reviewer` value, so default runs are unchanged. The agent id and the stopped-reviewer record add to the output.
- 6 spec 1.8.0: met. `git show 9fc91dc:skills/spec/templates/brief.md | sed -n 5p` prints "A design ruling decides what is built. It never exempts the code: ...", so by the fifth bullet the new stop on a ruled dictated line refuses a value already called an error. The rest is added output or new input.
- 7 land 1.9.0: met. `checks.sh`'s old failing output is a prefix of the new one: each failure line is still printed after its command's output, and the count line is added. The Agents booking is added. No new refusal (`git diff 9fc91dc 3659816 -- skills/land/SKILL.md`).
- 8 ordo-help 1.9.0: met. The choices lines and the `C<n>` sequence lines are new. The changed sequence lines only gain clauses ("or under self-rule by a choice you review"), which this review reads as added output or wording, not changed output.
- 9 ordo-init 1.2.0: met. The 9fc91dc docstring of `check_config.py` says "a worker or reviewer that is not claude:<model>" is an error, so refusing an empty `worker:` falls under the fifth bullet. The three keys are new input.
- 10 repo-setup 1.3.0: met. The templates add terms and the shared-rules sentence. The amended term definitions are wording, so by the patch bullet they do not count as changed output. The stricter reading is under "Declined to judge".
- 11 diagnose 1.1.0: met. The Stops row "The cause not found" resumes on a self-rule choice, an input it did not accept. The other base change is wording.
- 12 plan-retro, session-retro: met. Verify 2 prints 1.2.1 and 1.0.0, and neither path is in the diff.
- 13: met. The new text reads it as a skip, since no `## Agents` heading holds no bullet line. The script prints the no-agent error.
- 14: met. Heading plus sentence: skip, and the script prints the same error.
- 15: met. Empty roles file: skip, and the same error.
- 16: met. One bullet under `## Agents`: the script runs and prints the transcript error, not the no-agent error.
- 17: met. One bullet in `agent-roles.md`: the script runs, as in case 16.

## 1. Spec

- `skills/grill/SKILL.md`, "Steps / An answer that contradicts" 1 (and the carried-ruling bullet of Steps 3): "the new bullet names the old one as the one it replaces, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says for the old bullet's ending, its choice and its plan's Closed items."
  - What is wrong: the base text wrote the replaced bullet's ending as "(self-rule, replaced by D<n>)." (`git show 3659816:skills/grill/SKILL.md`, "An answer that contradicts" 1). `self-rule.md` "The choices file" writes "(self-rule, replaced by <the new bullet's name>).", and the name is read as the `spec` skill's "What it reads" 4 reads it: the text before the first ` (`, which for a `grill` bullet is `D<n> <the decision, as a phrase>` (grill "Writing what settled" 1 gives the bullet form `- D<n> <the decision, as a phrase> (<date>): ...`). Deferring to `self-rule.md` therefore changes what `grill` writes. Item 2 says a fix "changes how the text says a rule and never what the rule is". Rule 17 of the change standard makes a change of meaning the brief did not ask for a stop. Rule 19 asks that a contradiction between the two base texts be reported. The builder made the change without either.
  - Failure scenario: a user's `/grill` answer D7 that replaces a "(self-rule)" bullet now rewrites its ending to "(self-rule, replaced by D7 The form of ...)." where the skill at the base wrote "(self-rule, replaced by D7).". The change was not ruled or reported, and the version rule would count it as changed output.
  - Verdict: item 2 violated.
- Item 1 and item 2, the sections read against the whole skill: what is wrong is that the reading missed breaks of whole-skill sections, and the report marks those sections "fixed" or "holds". Examples, each checked by reading the worktree:
  - `plan-orchestration` "Two steps in flight": "naming each shared file and why the merge is simple; with no shared file the key is left out." The builder split the same sentence in `spec` Steps 9 ("With no shared file the key is left out." is now its own bullet) and left this copy.
  - `plan-orchestration` "Two steps in flight": "When the merge is not simple, the later step waits until the earlier one lands. No script checks the judgment."
  - `plan-orchestration` Steps 2: "A session runs one plan at a time. With several plans open, it takes them in the roadmap's order and starts the next plan only when ...".
  - `refute` "Finding dispositions": the ADR bullet carries two cases in two sentences ("... is a rule clash: ... One the builder made against the brief is closed like any other finding ...").
  - `roadmap` "The file's format", **Not yet specified.** bullet: two sentences, one on placement and one on content.
  - `spec` Stops, row "A step taken back out of main that cannot be saved", What resumes it: two sentences in one cell ("The cause put right, then `/spec` again. The user moves the path ..."). The builder moved this kind of cell into bullets in `diagnose`, `land` and `plan`.
  - `roadmap` Quick start: `/roadmap move <entry> before|after <entry>` and `/roadmap drop <entry> <reason>` have no comment, which "Sections, in order" row 2 requires ("each with a short comment"). The report gives `roadmap` "Sections in order: fixed" for the heading only.
  - `spec` "What it reads" 4 and "Steps / A ruling" 2 both state how a tag names a Rulings line. "Where a rule goes" ("A rule is written once") binds the whole skill, but the report lists this break under "For roadmap entry 23" as base text instead of fixing it. "A ruling" 2 already names "What it reads" 4, so the fix is to drop the restated forms there.
  - Failure scenario: Axel reads "Lists and tables: fixed" and "Where a rule goes: holds in changed text" in the step 12 report as the gate's "the changed skills follow `docs/dev/skill-layout.md`", while multi-rule bullets, a two-sentence cell, uncommented Quick start lines and a duplicated rule remain in skills the step was asked to read in full.
  - Verdict: items 1 and 2 violated.
- `skills/diagnose/SKILL.md` Rules ("The skill runs against the user's real home, the installed skills or the pinned checkout only with the user's leave.") and `skills/spec/SKILL.md` Steps 3 ("`/spec` goes on past the candidate without a stop."):
  - What is wrong: both reword a base-text prohibition ("never runs ... without the user's leave", "does not stop `/spec` again") into the behaviour wanted, which is the fix "Writing for an agent" makes. Neither line is in `git diff 9fc91dc 3659816` (the diagnose diff since 9fc91dc has two changed lines, and `git show 9fc91dc:skills/spec/SKILL.md | grep -c 'does not stop `/spec` again'` prints 1). Item 2 says such a break "is not fixed" and is listed for roadmap entry 23. The report labels the diagnose change "Writing for an agent (changed text)", which it is not. The meaning is kept in both.
  - Failure scenario: entry 23's pass reads the list as complete for base text and finds two base lines already rewritten with no record in the list or in the report's scope.
  - Verdict: item 2 violated.
- `skills/plan/SKILL.md` Steps 2, closing step: "A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`." / "The stop message holds the script's `error:` lines." / "A model the table lacks is covered by a row ...".
  - What is wrong: the cases ruling says "The bullets on lines 89 to 92 stay as they are". The builder split base line 90 into three bullets under item 2. It disclosed the split, but did not report it as a conflict between the ruling's sentence and item 2. The rules are kept.
  - Failure scenario: the orchestrator holding the ruling's text line by line finds line 90 changed against the ruling's words.
  - Verdict: no verdict changed. Item 4 holds, since the rules are kept.

## 2. Proof

- Report, `grill`, "Where a rule goes": "The rewrite of the old bullet's ending to "(self-rule, replaced by D<n>)." stood in the carried-ruling bullet (Steps 3), in the user's-answer bullet ("An answer that contradicts" 1) and in `references/self-rule.md`".
  - What is wrong: `git show 3659816:skills/plan-orchestration/references/self-rule.md` line 101 reads "(self-rule, replaced by <the new bullet's name>).", and the carried-ruling bullet read "<the carried bullet's name>". Only "An answer that contradicts" 1 said "D<n>".
  - The decision that rests on it: treating the three as one rule, and so as a "one place" fix, which is the rule change of Spec 1.
  - Failure scenario: the orchestrator accepts the fix as wording only.
  - Verdict: item 2 violated (with Spec 1).
- Report, `ordo-help`: "Frontmatter: holds (503 characters)".
  - What is wrong: the description changed (Triggers on gains "which choices await my review", 472 to 503 characters, in the frontmatter diff above). The per-skill entry names no fix, and only the appendix shows it.
  - The decision that rests on it: the user's reading of which frontmatter changed.
  - Failure scenario: the reader takes item 3's "only the version line" as the only frontmatter change in `ordo-help`.
  - Verdict: none.

## 3. Standards

- `skills/diagnose/SKILL.md` Rules (the four "After the refusal "No dispatch entry" ..." bullets) and `skills/plan/SKILL.md` Rules ("When the stop "The plan exists" finds the entry's rulings file still there, the Agents bullets it holds are named, and are copied into the open plan's Agents section before the user removes the file.").
  - What is wrong: `docs/dev/skill-layout.md`, "Where a rule goes", puts in Rules only "a rule that holds throughout the skill". These say what to do after one stop. `land` put the same kind of moved cell text as bullets under its Stops table, which keeps the rule with the stop. The `plan` bullet also joins two requirements, named and copied ("Lists and tables", one rule per bullet).
  - Failure scenario: a reader resuming after "No dispatch entry" reads the Stops table, is sent to Rules, and finds the resumption mixed with the skill-wide rules.
  - Verdict: item 2 violated.
- `skills/spec/SKILL.md` "Steps / The brief check" 3: "Item 3 is done when the report stands at that path with its usage line filled." is followed by "- A step has one such report, since the check runs once per step (item 4)."
  - What is wrong: "Writing for an agent" says "Each item of Steps ends on its completion criterion". The added criterion is not the item's last line.
  - Failure scenario: a reader taking the last line as the criterion reads "A step has one such report" as the completion test.
  - Verdict: item 2 violated.
- `skills/refute/SKILL.md` introduction: "... or "none" under a heading; the orchestrator or the session saves it, and the next resume point commits it."
  - What is wrong: the paragraph is brought to three sentences ("Sections, in order" row 1) by joining two sentences with a semicolon, so its length and content are unchanged. The prose standard, B, says "A full stop is usually clearer", and the `land` introduction was fixed by merging content.
  - Failure scenario: row 1's limit is met by punctuation alone, and a later count of the same paragraph gives four sentences again.
  - Verdict: none.
- `skills/spec/SKILL.md` Steps 5: "- `plan.md` is put back from the copy Steps 1 saved." / "- No commit, worktree or dispatch entry is made."
  - What is wrong: the split leaves "No commit, worktree or dispatch entry is made." standing alone as a sibling of "No shared path: the step goes on". Its condition, the wait case, was carried only by "put back" in the same sentence. "Lists and tables" says a qualifier that changes a rule stays in the same bullet.
  - Failure scenario: a reader of Steps 5 takes the bullet as a rule for every run of the step. The two bullets belong under "When it is not judged simple, ...".
  - Verdict: none.
- `skills/land/SKILL.md` Steps 9: "Done when the booking is in `plan.md` and the Agents section, read back, holds each agent of the step once."
  - What is wrong: the item also says "Tick the step", and the criterion leaves the tick out.
  - Failure scenario: the item is judged done with the step unticked.
  - Verdict: none.
- `docs/glossary.md` and `plan-terms.md`, "kind, of an open item": "Stated in: `plan-orchestration`, `references/self-rule.md`, "The six kinds left open", and "Stops"".
  - What is wrong: `self-rule.md` has no "Stops" section (`grep -n '^#'` lists Scope, The six kinds left open, A skill with its own approval stop, Closing an open item, The counts, Next-entry mode, The choices file, The review of a choice). The meant section is `SKILL.md`'s "Stops", written in the form the "open item" entry uses: "`plan-orchestration`, "Stops" and `references/self-rule.md`, ...".
  - Failure scenario: a reader looks for "Stops" in `self-rule.md`.
  - Verdict: none.
- Report, the heading rename "The format is the file's" to "The file's format":
  - What is wrong: change standard rule 14 asks the report to quote the grep that carries a renamed name. The report states the citations were updated and quotes no grep. The reviewer's grep (`grep -rn "format is the file" . --exclude-dir=.scratch --exclude-dir=.git`) finds no stale hit.
  - Failure scenario: none in the tree. The report cannot be checked from its own text.
  - Verdict: none.

## 4. Behaviour

- `skills/ordo-help/SKILL.md` frontmatter: "Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work, which choices await my review."
  - What is wrong: the skill now triggers on a new phrase, which is a host-visible change. The report's "User-visible changes" table does not list it, and the per-skill entry says Frontmatter "holds".
  - Failure scenario: a user who types "which choices await my review" now gets `/ordo-help`, and the step's report gives no before and after for it.
  - Verdict: none.
- `skills/grill/SKILL.md`, the ending a replaced "(self-rule)" bullet gets from a user's answer (Spec 1):
  - What is wrong: the line written into a Rulings section changes from "(self-rule, replaced by D<n>)." to "(self-rule, replaced by D<n> <the decision, as a phrase>).". This is not in the report's "User-visible changes".
  - Failure scenario: a reader of a later ledger finds two forms of the ending, with no record of the change.
  - Verdict: item 2 violated (with Spec 1).

## Declined to judge

- Whether "its output is changed" in the version rule covers a field inserted into a ledger record (`reviewer_report` and `brief_check` gaining the agent id), the changed wording of `ordo-help`'s printed sequence, or the amended wording of glossary terms a `/repo-setup` run or sync writes. This review read them as added output or wording, which gives the ruled values, and the rule's text does not settle it. Axel's reading of the rule settles it.
- How `/land` books the Agents section for a dispatch entry written by the pre-plan `/spec` (no agent id in `brief_check` or `reviewer_report`). This was not exercised, since it needs such an entry on a live run.
- A full census of base text against "Writing for an agent". Item 1 does not ask for one, so the builder's "For roadmap entry 23" list was checked only in sample (land Steps 1 has no criterion, as listed).
- Every remaining bullet of the eleven skills against "one rule per bullet". The reviewer ran a scan for list items with two sentences or a semicolon (57 hits) and judged the sample named in Spec 2 by reading, not each hit.
- The builder's hand-back on `roadmap` "What it reads" 6: the claim holds. The diagnosis template's headings (`grep -n '^#' skills/diagnose/templates/diagnosis.md`) carry no number, and the text does not say how a diagnosis record's finding is named. The builder's list of those headings leaves out "No red command", but no decision rests on that. The proposed fix does not belong to this step. It changes what `/roadmap add` accepts, and the words are those of Open item G, a ruling of the user, so a change to them is an open item for Axel (kind 3) and not a layout fix.

Reviewer usage: a1a45441fab00dcd0, claude-opus-5-5 (ordo-high), 342934 tokens, 78 tool uses, 14 min 22 s.

## Repair round 1, refuted

Two reviewers ran over the round, blind to each other, with the same prompt (Open item P, ruled (c)): reviewer A on Opus, the trial, and reviewer B on Sonnet, the configured `repair_reviewer`.

### Reviewer A, Opus

Reviewer over repair round 1 of step 12, on `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12`, base 3659816. The round's delta was read as `diff -u` of each changed path between the round-0 tree (`.../scratchpad/r12-0`) and the worktree. That tree was first checked as the base with `agents/reviews/12-round-0.diff` applied: `git archive 3659816` plus `git apply 12-round-0.diff` gave a tree that `cmp` finds equal to `r12-0` for all 15 paths. Twelve paths change in the round. `docs/dev/skill-layout.md`, `skills/ordo-help/SKILL.md` and `references/self-rule.md` are unchanged in the round.

#### Verification (rerun by the reviewer)

```
$ ( cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12 && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?" )
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
exit 0

Verify 2: for s in diagnose grill land ordo-help ordo-init plan plan-orchestration refute repo-setup roadmap spec plan-retro session-retro; do printf '%s ' $s; grep -m1 'version:' skills/$s/SKILL.md; done
diagnose   version: "1.1.0"
grill   version: "1.3.0"
land   version: "1.9.0"
ordo-help   version: "1.9.0"
ordo-init   version: "1.2.0"
plan   version: "1.11.0"
plan-orchestration   version: "2.11.0"
refute   version: "1.8.0"
repo-setup   version: "1.3.0"
roadmap   version: "1.3.0"
spec   version: "1.8.0"
plan-retro   version: "1.2.1"
session-retro   version: "1.0.0"

Verify 3: git diff --name-only; git status --short --untracked-files=all
docs/dev/skill-layout.md
docs/glossary.md
skills/diagnose/SKILL.md
skills/grill/SKILL.md
skills/land/SKILL.md
skills/ordo-help/SKILL.md
skills/ordo-init/SKILL.md
skills/plan-orchestration/SKILL.md
skills/plan-orchestration/references/self-rule.md
skills/plan/SKILL.md
skills/refute/SKILL.md
skills/repo-setup/SKILL.md
skills/repo-setup/templates/plan-terms.md
skills/roadmap/SKILL.md
skills/spec/SKILL.md
 M (the same 15 paths)
?? .scratch/2-e-a-self-rule/agents/reviews/12-report.md

Verify 4: description lengths
905 diagnose, 877 grill, 726 land, 503 ordo-help, 632 ordo-init, 961 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 861 repo-setup, 1022 roadmap, 779 session-retro, 987 spec (each printed as "<n> skills/<name>/SKILL.md")

Verify 5: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1

Verify 6: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

Verify 7: sed -n 22,28p docs/dev/skill-layout.md
line 22 as on main (git show 3659816:docs/dev/skill-layout.md | sed -n 22p prints the same line), then the five bullets of item 0, then line 28 empty (od -c prints \n)
git diff --stat 3659816 -- docs/dev/skill-layout.md: 1 file changed, 5 insertions(+)

Item 0 word for word: brief lines 26-30 (indent stripped) diffed against skill-layout.md lines 23-27: identical.
Item 4 word for word: 12-cases.md lines 10-14 against skills/plan/SKILL.md lines 93-97: identical apart from the list indent.
Frontmatter lines changed since the base (git diff -U0 3659816 -- 'skills/*/SKILL.md' | grep -E '^[-+](description|name|metadata|  version|---)'): the eleven version lines and the ordo-help description; git diff --name-only 3659816 -- skills/plan-retro skills/session-retro prints nothing.

Cases 13 to 17, plan_cost.py <scratch ledger> <empty transcript root>, from the worktree:
case 13: error: the ledger names no agent, exit 1
case 14: error: the ledger names no agent, exit 1
case 15: error: the ledger names no agent, exit 1
case 16: error: no transcript of agent abc123 under <scratch>/tr, exit 1
case 17: error: no transcript of agent abc123 under <scratch>/tr, exit 1

Commands the report quotes for the round, rerun:
- Ruling 13: grep -rn "format is the file" . --exclude-dir=.scratch --exclude-dir=.git; echo "exit $?"
  exit 1
- Ruling 2, the two searches grep -n -E '^ *([-*+]|[0-9]+\.) .*\. [A-Z`]' and grep -n -E '^ *([-*+]|[0-9]+\.) .*; ' over the eleven SKILL.md and references/self-rule.md:
  on the round-0 tree: 62 hits on 60 lines, the same lines per file as the report's table (diagnose 134; grill 388; land 61 62 87 179 180 182 183 212; ordo-init 70 83 195; plan 107 109 181 188; plan-orchestration 52 54 65 69 83 94 95 107 110 116 130 138 177 178 179 186 187 205 215 258 259 296; refute 77 116 158; repo-setup 32 88 116 136 174 178 183 242 243 245; roadmap 92 141 149 150 199 202; spec 205; self-rule.md 149)
  on the worktree: 8 hits (plan 186; plan-orchestration 67 112 305; repo-setup 32 116; roadmap 142; self-rule.md 149), as the report prints them
  the table: 52 rows "fixed", 8 rows "holds" (grep -c on the table's rows). The report gives grill's "Before" line as 396, but the hit stands at 388 on the round-0 tree. No decision rests on the number.
- The nesting scan and the dash scan (the builder's indent.py and dash.py, rerun over the same files): both print nothing.
- The Stops-cell scan: the reviewer's own awk over every table row of the eleven skills, for a cell with ". " followed by a capital, prints nothing.
- Extra, the reviewer's: list items holding a full stop followed by `"`, `(` or `*` and more text (two sentences the brief's pattern misses): nothing; every Quick start line of the eleven skills carries a comment: nothing printed for a line without one.
```

#### Verdicts

Rulings of the round brief `agents/briefs/12-round-1.md`:

- 1: holds. `skills/grill/SKILL.md` Steps 3 (lines 122-126) and "An answer that contradicts" 1 (lines 250-254) rewrite the ending to "(self-rule, replaced by <the carried bullet's name>)." and "(self-rule, replaced by D<n>).", the forms `git show 3659816:skills/grill/SKILL.md` lines 119 and 232 give, one rule per sub-bullet, pointing at `self-rule.md` "The choices file" only for the choice and the Closed items line. The report's "Anything in the brief wrong or impossible" names the forms in their places (four texts).
- 2: partial. The seven named breaks are fixed as named (read in the delta). The hit list is complete and reproduces (above), the eight "holds" are right on reading, and the per-skill verdicts describe the tree. Four hit fixes break a rule of their own: Spec 1 (refute 116), Standards 1 (refute 77), Standards 2 (repo-setup 245) and Standards 3 (plan-orchestration 187).
- 3: holds. Both rewrites stay, and both are listed under "For roadmap entry 23", "Base-text breaks ... already fixed in this step". The `diagnose` entry of "Per skill" calls the line base text.
- 4: holds. The `plan` entry of "Per skill" names the split of base line 90 as the one change to the lines the cases ruling kept.
- 5: holds. The `grill` "Where a rule goes" entry gives each text's form as `git show 3659816` prints it (self-rule.md base lines 101 and 120).
- 6: holds. The `ordo-help` entry says "Frontmatter: fixed (503 characters, 472 before)" with the reason, and "User-visible changes" has its row with before and after.
- 7: holds. The four `diagnose` bullets and the two `plan` bullets now sit under their Stops tables. The cells read "What the bullets below give ..." and "as the bullets below say". `grep -rn 'last Rules bullet\|What "Rules" gives'` over skills, docs and README.md prints nothing.
- 8: holds (`skills/spec/SKILL.md` lines 322-323).
- 9: holds. The introduction has three sentences, with no semicolon. The cut content stands in Steps 7.
- 10: holds (`skills/spec/SKILL.md` lines 147-148 under line 145).
- 11: holds (`skills/land/SKILL.md` Steps 9, the criterion names the tick).
- 12: holds. `plan-terms.md` and `docs/glossary.md` carry the dictated "Stated in" word for word, and verify 6 prints ok.
- 13: holds (grep rerun above).
- 14: holds, with ruling 1.

Items of the brief's "What to build", for the whole diff since the base:

- 0: holds. The five bullets are word for word, follow line 22, and the page's diff is 5 insertions.
- 1: holds. Every layout section is read against each skill. The hit list reproduces, no list item or table cell with two sentences is left (the reviewer's wider search), and the per-skill verdicts describe the tree.
- 2: violated. Spec 1 changes a rule. Standards 1, 2 and 3 are fixes that leave a break of the layout page in the place they fix.
- 3: holds. Eleven version lines carry the ruled values (verify 2). No other `version:` line changed, and plan-retro and session-retro are untouched.
- 4: holds. The five bullets are word for word, the bullets after them keep their rules, and cases 13 to 17 run as ruled.

Cases of the brief's "Cases" and of the cases ruling:

- 1 plan-orchestration 2.11.0: met. The round changed wording only. The reading of the first refuter report stands, and a 9fc91dc-era ledger still closes by item 4 (case 13).
- 2 grill 1.3.0: met. `--self-rule` is new input (`git show 9fc91dc:skills/grill/SKILL.md | grep -c -- '--self-rule'` prints 0, the worktree 26). Ruling 1 returns the replaced-bullet ending to the base form, so the changed output of the first report's Behaviour 2 is gone.
- 3 plan 1.11.0: met. The keys, the Agents section and the closing report are added, and a ledger with no `## Agents` heading skips the script (case 13).
- 4 roadmap 1.3.0: met. `add` accepts the "(self-rule)" bullet. The heading rename and the round's Rules merge change no run.
- 5 refute 1.8.0: met. `repair_reviewer` defaults to `reviewer`, and the records are added output. Spec 1 is a wording loss with no effect on a run's output.
- 6 spec 1.8.0: met. `git show 9fc91dc:skills/spec/templates/brief.md | sed -n 5p` prints "A design ruling decides what is built. It never exempts the code: ...".
- 7 land 1.9.0: met. The round's changes in `land` are wording.
- 8 ordo-help 1.9.0: met. The added lines are new output. The description gains a trigger phrase, which is added input.
- 9 ordo-init 1.2.0: met. At 9fc91dc the `check_config.py` docstring, line 12, calls "a worker or reviewer that is not claude:<model>" an error.
- 10 repo-setup 1.3.0: met. The templates add terms. The round's changes in `SKILL.md` are wording.
- 11 diagnose 1.1.0: met. `git diff 9fc91dc 3659816 -- skills/diagnose` shows the rewording and the Stops row that resumes on a self-rule choice.
- 12 plan-retro, session-retro: met (verify 2; no path in the diff).
- 13: met. Skip under the text, and the script prints the no-agent error.
- 14: met. Same as case 13.
- 15: met. Same as case 13.
- 16: met. The script runs and prints the transcript error, not the no-agent error.
- 17: met. Same as case 16.

#### 1. Spec

- `skills/refute/SKILL.md`, "The four headings", **Proof.** (round-0 line 116, now "- **Proof.** A finding is:"). The removed text: "A test of behaviour whose failure costs nothing is not a Proof pass; it is a Standards finding, as the next heading says."
  - What is wrong: the sentence held two rules. One is that such a test is a Standards finding, which the Standards entry states ("a test of behaviour whose failure costs nothing ..."). The other is that such a test is not a Proof pass, which no other place of `refute` states (`grep -rn 'Proof pass' skills docs` prints nothing in the worktree). The cut drops the second rule. Item 2 says "A fix changes how the text says a rule and never what the rule is", and change standard rule 17 keeps every condition of a rewritten rule. The report misdescribes the cut in two places. The hit table says "the first sentence restated a Standards finding that "Standards" states". The entry 23 list says "the sentence that a test of behaviour whose failure costs nothing is a Standards finding: it restated the Standards entry".
  - Failure scenario: a code step's only new test checks behaviour whose failure costs nothing (a help string, say), and its failure on the unchanged tree is quoted. Every Proof bullet is then satisfied, so a reviewer writes Proof "none" and may read the case as checked by a test (the Spec bullet "a case of a code step ... that no test of the step checks"). Only a Standards finding remains. The base text told the reviewer that this test does not pass Proof.
  - Fix: keep the Proof rule and point at Standards for the finding, for example a first Proof bullet "a test of behaviour whose failure costs nothing, counted as proof of its case; it is also the Standards finding of that heading". Or keep the base sentence's first half.
  - Verdict: item 2 violated; ruling 2 partial.

#### 2. Proof

- None. Every claim of the round reproduces: the ruling 13 grep, the 62 hits on 60 lines, the 52/8 split, the 8 lines left, the nesting and dash scans, every verify command, and cases 13 to 17. The one number that does not reproduce is grill's "Before" line in the hit table (396 against 388 on the round-0 tree), and no decision rests on it.

#### 3. Standards

- `skills/refute/SKILL.md:77`, Steps 7: "Both are written to disk in the main checkout, and the next resume-point commit carries them rather than a commit of their own, as `plan-orchestration`'s "Resuming, and handing the plan over" says."
  - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets". Writing the record to disk and leaving it to the next resume-point commit are two such requirements. The round fixed the second sentence by joining it with "and". In the same round, the identical pair in `plan-orchestration` Steps 6 and 7 (lines 99-100 and 115-116) was split into two bullets ("The next resume-point commit carries them."). The hit table judges the `plan-orchestration` pair "two requirements ... two bullets" and the `refute` line "one sentence", so one text gets two different verdicts.
  - Failure scenario: a reviewer checking a later diff that commits the refuter report on its own reads one bullet that a "written to disk" check satisfies, and passes it. The same rule in `plan-orchestration` is a bullet of its own.
  - Verdict: item 2 violated; ruling 2 partial.
- `skills/repo-setup/SKILL.md:250`, Rules: "The skill never writes a Claude Code settings file." The round-0 text was "...; it prints the git guard's settings text for the user to add."
  - What is wrong: the cut leaves a bare prohibition in a line this step rewrote. "Writing for an agent", first bullet, says "a rule written as a prohibition names the behaviour to do instead, in the same bullet or in the Do instead cell of its Anti-patterns row". The section binds text written or rewritten, and the Anti-patterns table has no settings row (`grep -n settings skills/repo-setup/SKILL.md` prints lines 118, 120 and 250 only). Steps 11 does state the showing of the settings text. "Where a rule goes" then asks the other place to name the section ("Another place that needs it names the section it is in"), not to cut the clause.
  - Failure scenario: an agent running `/repo-setup` with the git guard reads Rules and is told only what not to do. With the instead-behaviour gone from the rule, it may skip giving the settings text, or ask how the hook gets enabled.
  - Fix: name the place, for example "The skill never writes a Claude Code settings file; the git guard's settings text is shown for the user to add (Steps 11)", or the same as two sentences of one rule as the step's own convention allows.
  - Verdict: item 2 violated; ruling 2 partial.
- `skills/plan-orchestration/SKILL.md:193`, "Resuming, and handing the plan over": "Handing the plan over is a resume point: a session that stops, for a handover, a pause or a stop, first commits by path the records it wrote since the last resume point."
  - What is wrong: the round-0 text was two sentences, and the hit table names them as two statements ("handing over is a resume point; the session commits before it stops"). The fix joins them with a colon. The colon presents the commit rule as the content of "handing over is a resume point", but the commit rule is wider: it also covers a pause and a stop. "Lists and tables" asks for one rule per bullet. The report's own judgment rule ("a second sentence that states another requirement is its own bullet", Judgment calls) makes it two bullets. A punctuation-only fix of this kind was also the first review's finding on the `refute` introduction.
  - Failure scenario: a reader looking for what a session does before a pause finds the requirement inside a bullet about handover. A later edit to the handover clause can take the commit-before-stopping rule with it.
  - Verdict: item 2 violated; ruling 2 partial.

#### 4. Behaviour

- None. The round's changes are wording. The one host-visible change of the step outside the version lines, the `ordo-help` trigger phrase, is now in "User-visible changes" with its before and after. The `grill` ending is back to the base form.

#### Declined to judge

- The round-0 hunks the round did not touch were not reread line by line; the first refuter report covers them. This review read every hunk of the round's delta against the round-0 text and the base, and read the whole diff only where a verdict above needed it.
- The `roadmap` Rules merge (line 202). The bullet now gives the reason "since `/plan` ... copies the entry's goal and gate" to a list that also names the dependencies. Its exception now ends "in place of a gate", where the base exception listed what such an entry states. This review reads both as keeping the base rule, since "The file's format" says what an entry under "Not yet specified" holds. A stricter reading, that the exception now leaves dependencies required, would make it a Spec finding. The author's or Axel's reading of the bullet settles it.
- The `grill` Rules bullet (line 396) now paraphrases the sentence that `skills/spec/templates/brief.md:5` and `skills/repo-setup/templates/docs/dev/design-principles.md:3` carry word for word. Its rule is kept by the bullet's lead. Whether `grill` should quote that sentence word for word is not decided by a page this step reads.
- The first refuter report's points declined to judge (how "its output is changed" reads for a field added to a record, the Agents booking for a pre-plan dispatch entry, a census of base text against "Writing for an agent") stand as they were. The round did not touch them.

Reviewer usage: a66e5c70679decf11, claude-opus-5-5 (ordo-high), 225543 tokens, 54 tool uses, 10 min 41 s.

### Reviewer B, Sonnet

Step 12 of plan 2.E.A, worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12`, base 3659816. The round's delta is `diff -u` of each changed path between the copy of the round-0 tree (`.../scratchpad/r12-0`) and the worktree. It is 556 lines over 12 files; `docs/dev/skill-layout.md`, `skills/ordo-help/SKILL.md` and `references/self-rule.md` have no delta.

#### Verification (rerun by the reviewer)

```
$ ( cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-12 && sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?" )
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 11 commands passed
exit 0
```

Brief's verify list 2 to 7, from the worktree root:

```
Verify 2: diagnose 1.1.0, grill 1.3.0, land 1.9.0, ordo-help 1.9.0, ordo-init 1.2.0, plan 1.11.0, plan-orchestration 2.11.0, refute 1.8.0, repo-setup 1.3.0, roadmap 1.3.0, spec 1.8.0, plan-retro 1.2.1, session-retro 1.0.0 (each printed as `<name>   version: "<v>"`)
Verify 3: git diff --name-only: the 15 tracked paths of "Paths this step writes"; git status --short --untracked-files=all: the same 15 as " M" and "?? .scratch/2-e-a-self-rule/agents/reviews/12-report.md"; nothing else
Verify 4: 905 diagnose, 877 grill, 726 land, 503 ordo-help, 632 ordo-init, 961 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 861 repo-setup, 1022 roadmap, 779 session-retro, 987 spec
Verify 5: git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"  prints: exit 1
Verify 6: ok: the plan-terms block equals the template
Verify 7: sed -n 22,28p docs/dev/skill-layout.md: line 22 as on main, five bullets, then an empty line (od -c of line 28 prints \n)
Item 0 word for word: lines 23-27 of docs/dev/skill-layout.md diffed against the five dictated bullets of 12.md: identical.
Item 4 word for word: the five dictated bullets of 12-cases.md found by grep -F in skills/plan/SKILL.md lines 93-97: all five present.
```

Commands the builder's report quotes for round 1, rerun:

```
$ grep -rn "format is the file" . --exclude-dir=.scratch --exclude-dir=.git; echo "exit $?"   (worktree)
exit 1
The brief's two greps, extended to numbered items, `grep -n -E '^ *([-*+]|[0-9]+\.) .*\. [A-Z`]'` and `... .*; '`, over the eleven SKILL.md and references/self-rule.md:
  on the round-0 tree: 62 hits on 60 lines; the (file, line) pairs equal the report's "Before" column except grill (see Proof 1)
  on the worktree: 8 hits, the report's 8 "holds": plan 186, plan-orchestration 67, 112, 305, repo-setup 32, 116, roadmap 142, self-rule 149
Second-sentence scan with other opening characters (quote, digit, slash, parenthesis, lowercase) over the same files: no hits
Table cells with two sentences (quoted text and code spans removed) over the eleven SKILL.md: no hits
List nesting (each child indented by its parent's marker width) over the eleven SKILL.md and self-rule.md: no hit
The builder's dash.py scan: only "exit-of-the-scan-pipeline-done"
Bold outside a list label: only skills/grill/SKILL.md line 293 (the glossary entry form in backticks), as reported
Intro sentence counts: diagnose 2, grill 1 to 2, land 2 to 3, ordo-help 1, ordo-init 2, plan 1 to 2, plan-orchestration 3, refute 3, repo-setup 2, roadmap 2, spec 3 (my count strips code spans and quotes; none above 3)
Cases 13 to 17 on scratch ledgers under my scratch folder, `python3 skills/plan-orchestration/templates/plan_cost.py <ledger> <empty root>`:
  13 error: the ledger names no agent | 14 error: the ledger names no agent | 15 error: the ledger names no agent
  16 error: no transcript of agent abc123 under ... | 17 error: no transcript of agent abc123 under ...
```

#### Verdicts

The 14 rulings of the round brief:

- 1: done. `grill` Steps 3 now has "(self-rule, replaced by <the carried bullet's name>)." (L124) and "An answer that contradicts" 1 has "(self-rule, replaced by D<n>)." (L252), one rule per sub-bullet, each pointing at `self-rule.md` "The choices file" only for the choice leaving and the Closed items line. Both equal the base. `git show 3659816:skills/grill/SKILL.md | grep -n 'replaced by'` reads the same two forms. The report's hand-back names the four texts and three forms under "Anything in the brief wrong or impossible".
- 2: partly done. The seven named fixes are made, every hit of the two greps is listed with a verdict, and the Stops-cell scan is done. One "fixed" verdict changes a rule (Spec 1), one "holds" verdict is questionable (Standards 1), and a per-skill entry gives a reason the tree does not support (Spec 1).
- 3: done. Both base-text rewrites are kept and listed under "For roadmap entry 23" ("Base-text breaks ... already fixed in this step"), and the `diagnose` entry no longer calls its Rules bullet changed text.
- 4: done. The `plan` verdict names the split of base line 90 into three bullets as the one change to the lines the cases ruling said stay.
- 5: done. The `grill` "Where a rule goes" entry matches the base (git show above).
- 6: done. The `ordo-help` entry names the description change with its reason, and "User-visible changes" gives 472 to 503 characters (Verify 4 prints 503).
- 7: done. Four `diagnose` bullets and two `plan` bullets stand under their Stops tables, the cells point at them ("What the bullets below give ...", "as the bullets below say"), and the text is the moved text word for word.
- 8: done. `spec` "The brief check" 3 ends on "Item 3 is done when ...".
- 9: done. The `refute` introduction is three sentences with no semicolon; the dropped clause is stated in Steps 7 ("The orchestrator or the session saves the report", "the next resume-point commit carries them").
- 10: done. Both `spec` Steps 5 bullets are sub-bullets of "When it is not judged simple".
- 11: done. `land` Steps 9 reads "Done when the booking is in `plan.md`, the step is ticked, and the Agents section, read back, holds each agent of the step once."
- 12: done. `plan-terms.md` first, `docs/glossary.md` by the sync, with "Stated in" as ruled; Verify 6 passes.
- 13: done. The grep is quoted and I reran it: exit 1.
- 14: done with 1.

Items of the brief's "What to build":

- 0: holds, five bullets identical to the brief, after line 22; `git diff --stat 3659816 -- docs/dev/skill-layout.md` shows only insertions.
- 1: holds. Every section of the layout page is given a verdict per skill. The two entries that are wrong are listed under Spec 1 and Standards 1 and count against item 2.
- 2: violated, Spec 1. One cut removes a rule of `refute`, and the report's account of it is wrong.
- 3: holds, Verify 2. The one other frontmatter change, the `ordo-help` description, is an item 2 fix, reported.
- 4: holds, the five bullets are present word for word and cases 13 to 17 reran as the ruling says.

Cases of the brief's "Cases":

- 1 to 11: met. Versions are the ruled values (Verify 2). The evidence is as in the first refuter report and unchanged by this round's delta, none of which touches a behaviour. Rechecked by command: `grep -c -- '--self-rule' skills/grill/SKILL.md` prints 26 (0 at 9fc91dc); `git show 9fc91dc:skills/ordo-init/templates/check_config.py` line 12 reads "a worker or reviewer that is not claude:<model>"; `git show 9fc91dc:skills/spec/templates/brief.md | sed -n 5p` reads "A design ruling decides what is built. It never exempts the code: ...".
- 12: met. `plan-retro` 1.2.1 and `session-retro` 1.0.0; `git diff 3659816 --stat -- skills/plan-retro skills/session-retro` prints nothing.
- 13 to 17: met. Reran as above; the text of `plan` Steps 2 (lines 93 to 97) gives skip, skip, skip, run, run.

#### 1. Spec

- `skills/refute/SKILL.md`, "The four headings", Proof: "- **Proof.** A test of behaviour whose failure costs nothing is not a Proof pass; it is a Standards finding, as the next heading says. A finding is:" became "- **Proof.** A finding is:". What is wrong: the sentence has two claims. "It is a Standards finding" is stated by the last Standards bullet ("a test of behaviour whose failure costs nothing (...), under the rules file's rule ..."). "It is not a Proof pass" is stated nowhere else in the skill (`grep -n 'not a Proof pass' skills/refute/SKILL.md` prints nothing now; the sentence stands at both 9fc91dc and 3659816). The report calls the sentence a restatement ("refute | 116 | S+; | fixed ... restated a Standards finding that Standards states", "Where a rule goes: fixed ... only Standards states it now", and the last bullet of "For roadmap entry 23"). That is true of half the sentence. The fix removed a rule while the brief says a fix "never changes what the rule is" and the change standard, rule 17, keeps every condition and limit. Failure scenario: a builder's report quotes a failing-first run for a test of costless behaviour; a reviewer reading the new Proof list has no sentence saying such a test is not Proof, accepts it as Proof, and flags it only under Standards. Fix: put "A test of behaviour whose failure costs nothing is not a Proof pass." back as its own sentence or bullet, or add "and not a Proof pass" to the Standards bullet, and correct the report's three statements. Verdict: item 2 violated.
- `skills/diagnose/SKILL.md`, Steps 11: "- For a slow symptom, a probe is a measurement: ... or `git bisect run` between two known states; a log line does not measure time." became that bullet without the clause plus a bullet "- A log line does not measure time." What is wrong: the clause was inside the condition "for a slow symptom"; as a sibling bullet among the rules for every probe it is unconditional. The layout page, "Lists and tables", keeps a qualifier that changes the rule in the bullet of the rule. Failure scenario: low. A reader of the list for a non-timing symptom meets a bare statement about timing with no condition and cannot tell when it applies. Fix: the clause stays as a sub-bullet of the slow-symptom bullet. Verdict: none.

Where each other changed rule of the delta now stands, each read against the text before it, and none found lost, narrowed or widened:

- `grill` Steps 3 and "An answer that contradicts" 1: four sub-bullets each, the base's four clauses (names the old bullet, ending, choice leaves, Closed items line).
- `grill` last Rules bullet: "never exempts the code" is carried by the bullet's own label "No option exempts code from the standards pages".
- `land` Steps 5, Steps 6 and Rules: "since" and "though" clauses keep the reason and the qualifier; the `spec` pointer stays in Steps 6, which the Rules bullet cites.
- `land` "Removing a step's worktree" 2 to 4: the same rules; item 4's reason now says only `-D` deletes an unmerged branch where it said `-D` deletes whether or not merged, and the command and its condition are unchanged.
- `ordo-init` Steps 2, 5 and the Rules exception, `plan` Steps 3, 6 and Rules: the second sentences are sub-bullets or clauses with the same scope.
- `plan` Stops: the Agents rule is two bullets under the table, "named" and "copied before the user removes the file".
- `plan-orchestration` Steps 2, 4, 5, 6, 7, 8, 9, "Resuming" and "Two steps in flight": every merged list is the base's list in one sentence; every split is two rules that stood in one sentence; the `shared_paths` key rule and "No script checks that judgment" stand as bullets.
- `refute` Steps 7 and "Finding dispositions": the commit rule stands in Steps 7, and the two ADR cases are two bullets.
- `repo-setup`: license, no-template-page language, git guard, exit 0, drafted-file exclusion and "adds no rule other than" keep their rules. "Nothing is assumed" is the restatement of "Build files are written only for what the user names", and the settings-text print is stated in Steps 11 ("for the user to add to `.claude/settings.json`").
- `roadmap`: "Not yet specified", the numbering bullet, the paths exception and Show 3 keep their rules; Rules 2 merges two rules, see Standards 2.
- `spec`: Steps 5 puts the plan.md put-back and the "no commit" bullet under the wait case; the tag forms dropped from "A ruling" 2 are stated in "What it reads" 4 (`<L>` for `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, otherwise the text before the first ` (`); the Stops bullet lists the same four user actions as the cell did.

No change outside "Paths this step writes" (Verify 3). Each hunk of the delta corresponds to a ruling or to a row of the report's hit table, so no fix reaches beyond its finding.

#### 2. Proof

- Report, "Ruling 2: every hit of the two searches", grill row "| grill | 396 | 396 | S | fixed |": the "Before" line is the line at the end of round 0, which is 388 in the round-0 tree (my grep on `r12-0` prints grill 388); the delta adds eight lines above it, so only the "After" is 396. What is wrong: a line number the rerun does not reproduce. No decision rests on it. Failure scenario: none beyond a reader of the table looking for the base text at 396 in the round-0 tree. Verdict: none.
- Report, "Checks after repair round 1" item 8 and the Stops-cell scan, "$ the nesting scan and the dash scan (scripts in the scratchpad)" and "$ the Stops-cell scan (the script in the scratchpad)": the lines name no command. What is wrong: the rules file's "Commands and their filters" asks a claim about behaviour to name the command that produced it. My own scans (nesting, two-sentence cells) reproduce the stated empty results. Failure scenario: low; a reader cannot rerun the report's scan from its text. Verdict: none.

#### 3. Standards

- `skills/land/SKILL.md`, Stops row "A red line for the user", What resumes it: "... books; the second failure of a step's landing always waits for the user". What is wrong: the report's hit table calls this cell "holds" as "alternative conditions" (`land` L192). The clause after the semicolon is a separate rule, written again in Steps 6 ("a second failure of its landing always goes to the user as an open item, and the step waits for the ruling"). The layout page, "Where a rule goes", says a rule is written once and another place names the section. Failure scenario: low; a later change to the second-failure rule in Steps 6 leaves the cell saying the old thing. Fix: drop the clause from the cell or point at Steps 6. Verdict: none.
- `skills/roadmap/SKILL.md`, Rules 2: "- Entry text states the goal, the gate and the dependencies, since `/plan <entry>` matches `<entry>` against the entries by number or title and copies the entry's goal and gate into the plan, except that an entry under "Not yet specified" states the goal and what must be known before its gate can be named in place of a gate." What is wrong: the merge of two bullets leaves one sentence of about 70 words in which "except that" can be read as an exception to the "/plan copies" reason instead of to the rule, and the since-clause now sits after a rule that also names the dependencies. "Lists and tables" asks a bullet to be one sentence where it can be, and the prose standard, E, asks for under about 20 words unless the mechanism needs more. Failure scenario: a reader of Rules 2 takes the "Not yet specified" exception as lifting the `/plan` match, and writes an entry without a goal. Fix: the rule, then the exception as a sub-bullet, then the reason. Verdict: none.
- `.scratch/2-e-a-self-rule/agents/reviews/12-report.md`, "Repair round 1" tables and "For roadmap entry 23": "Steps 3, L122-L126", "plan-orchestration: 1 (L46), 2 (L51) ...", "spec: 2 (L87) ...". What is wrong: the change standard, "Where the work happens", says a ledger file cites a page, a skill's text included, by its section and never by a line number, since lines move; the report's own grill row (Proof 1) shows the drift. A finding in code keeps its `file:line`, and these are not code. Failure scenario: roadmap entry 23's pass follows "L87" after the next edit of `spec` and reads the wrong item. Fix: cite the step and section ("`spec` Steps 2"). Verdict: none.

#### 4. Behaviour

none. The only host-visible change of the round, the `ordo-help` trigger phrase, is reported with its before and after. The `grill` ending is back to the base's forms, so the text a `/grill` run writes is unchanged from the base. The other round changes are wording of rules, with the rules kept (Spec).

#### Declined to judge

- Every bullet of the eleven skills against "one rule per bullet" and the "and"/"then" joins. I ran the builder's two greps, my own second-sentence and table-cell scans, and read the Rules sections of `land`, `plan-orchestration` and `spec` and the Stops tables. A full read of every list item was not done.
- Whether a new trigger phrase counts as "accepts an input it did not accept" in the version rule. The ruled values stand; Axel's reading of the rule settles it.
- The "For roadmap entry 23" census (completion criteria, repeats, reference sections of the base text): sampled by line (`plan-orchestration` L46, L51, L64, L92 and `spec` L87, L97, L109, L164, L178, L181 are items without a criterion), not rerun in full; it is not a census, as the report says.
- The `roadmap` "What it reads" 6 hand-back on diagnosis records: it is Axel's call (kind 3 reading of Open item G), as the first refuter report said.
- `self-rule.md` "A choice booked in a rulings file" now says "two ways" with the commit-message bullet under the Closed-items bullet and "in its place". That is round-0 text, unchanged by this round; I read it as the same rule and did not rule on it.

Reviewer usage: aadacd036f0e6ee9e, claude-sonnet-5-5 (ordo-high), 250869 tokens, 59 tool uses, 12 min 2 s.

## The reviewer trial over round 1, compared

Open item P, ruled (c): reviewers A (Opus) and B (Sonnet) reviewed round 1 blind, with the same prompt. Each served model was read from its transcript (`grep -o '"model":"[^"]*"'`: 31 lines `claude-opus-5-5` for A, 24 lines `claude-sonnet-5-5` for B).

- **Verdicts.** The same in both. Ruling 2 partial and rulings 1 and 3 to 14 done; item 2 violated and items 0, 1, 3 and 4 holding; cases 1 to 17 met. Both reran the 11 checks (passed), verify 2 to 7, cases 13 to 17, and the 62-hit list on the round-0 tree with its 8 lines left on the worktree, with the same results.
- **Found by both.** The `refute` Proof cut drops the rule "not a Proof pass" (Spec), and the report's `grill` "Before" line 396 should be 388 (Proof, no decision rests on it).
- **Found by A only.** Three Standards findings, each a join or a cut by a hit fix: `refute` Steps 7 (two requirements joined by "and"), `repo-setup` Rules (a bare prohibition left by the cut), and `plan-orchestration` "Resuming" (two rules joined by a colon). B read the `repo-setup` cut and judged the rule kept by Steps 11. It did not raise the other two.
- **Found by B only.** One Spec point and four smaller ones. The Spec point: `diagnose` Steps 11, where "a log line does not measure time" lost its slow-symptom condition. The four smaller ones:
  - `land`'s Stops cell repeats the second-failure rule of Steps 6.
  - `roadmap` Rules 2 merges two bullets into one long sentence (A read the same bullet and declined to judge it).
  - The report cites skill text by line number in a ledger file, against `docs/dev/change-standard.md`, "Where the work happens".
  - The report names no command for two of its scans.

  B gave each of these the verdict "none".
- **Weight.** A's three findings are rule-placement breaks of the layout page in text the round changed. B's `diagnose` point is the only one of either run that widens a rule; the rest are small. Neither run missed a finding the other judged a violation of a ruling or a changed behaviour.
- **Cost.** By `python3 skills/plan-orchestration/templates/plan_cost.py` on a scratch ledger naming the two agents, every response priced from its response body:

  | Reviewer | Tokens | Tool uses | Time | Cost (USD) |
  |---|---|---|---|---|
  | A | 225543 | 54 | 10 min 41 s | 3.54 |
  | B | 250869 | 59 | 12 min 2 s | 2.94 |

  So B cost 17% less here.
- **Reading.** One trial. Both runs caught the finding that changes a rule's meaning in the step's own diff (the Proof cut), and each caught findings the other missed. Plan 2.F's step 2a runs the second trial (`.scratch/2-f-diagnose/plan.md`, "Step 0 of step 2a").

## Closed

- The first run's findings (Spec 1 to 4, Proof 1 and 2, Standards, Behaviour 1 and 2): sent as rulings 1 to 14 of `agents/briefs/12-round-1.md`. Both runs over the round find each one done, except ruling 2, whose remaining breaks are below.
- Fixed on main at landing, from the runs over round 1. Each fix is small and inside items 1 and 2 of the brief:
  - Spec (A and B), `refute` Proof: "Such a test is not a Proof pass." is a sub-bullet of the Standards entry on a test of behaviour whose failure costs nothing.
  - Standards (A), `refute` Steps 7: two bullets, "Both are written to disk in the main checkout." and "The next resume-point commit carries them, and they get no commit of their own, ...".
  - Standards (A), `repo-setup` Rules: "The skill never writes a Claude Code settings file: it shows the git guard's settings text for the user to add, as Steps 11 says."
  - Standards (A), `plan-orchestration` "Resuming, and handing the plan over": two bullets, "Handing the plan over is a resume point." and the commit-before-stopping rule.
  - Spec (B), `diagnose` Steps 11: "A log line does not measure time." is a sub-bullet of the slow-symptom bullet.
  - Standards (B), `land` Stops, "A red line for the user": the cell reads "for a first failure only (Steps 6)" and no longer repeats the second-failure rule.
  - Standards (B), `roadmap` Rules: the rule and its reason in one bullet, the "Not yet specified" exception as its sub-bullet.
  - Proof (A and B), Spec (A and B) and Standards (B), the builder's report: the following corrections.
    - The `grill` "Before" line is 388.
    - The `refute` Proof entries of "Per skill", the hit table and "For roadmap entry 23" describe the two rules and where each stands.
    - The `repo-setup` entry-23 bullet keeps only the "nothing is assumed" cut.
    - The line citations in "For roadmap entry 23" and in the round-1 tables are replaced by section names.
    - The two scans name their scratch scripts and what each checks.
- Points declined to judge by A or B: none needs a ruling. The `roadmap` Rules reading is settled by the fix above. The `roadmap` "What it reads" 6 point is step 12b (Open item O). Whether a new trigger phrase raises a version is answered by the ruled values, which this step applies.
