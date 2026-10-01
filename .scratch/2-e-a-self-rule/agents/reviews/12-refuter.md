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
