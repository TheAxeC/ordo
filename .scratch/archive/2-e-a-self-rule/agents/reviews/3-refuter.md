# Step 3 refuter report (on .agents/worktrees/2ea-3, base 2bf05e5)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

The verify list, run from the worktree's root as `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` (exit 0):

```
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
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

The unchanged tree: the main checkout's copies of the nine changed files are byte-equal to the base. I rebuilt the base copies by reversing `git diff 2bf05e5` on copies in the scratchpad (`patch -R -p1`) and compared each one with `cmp`, which printed `base==main` for all nine. `diff -rq` of main against the worktree, with `.git`, `worktrees` and `.scratch` excluded, lists only those nine files. So every "unchanged tree" run below is run in the main checkout. Lines are cut where shown.

```
# Verify 2: grep -n 'repair_reviewer' skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
unchanged tree:
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: ...
docs/glossary.md:29:- **configuration block**: ...
after the change:
skills/refute/SKILL.md:53:   - A served model that is not the configured one, the model the key the run was dispatched on names (`reviewer:` for the first run, ...
skills/refute/SKILL.md:80:   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no `repair_r...
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: ...
skills/repo-setup/templates/plan-terms.md:89:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a ...
skills/plan-orchestration/SKILL.md:142:  - Each run over a repair round runs on the model the configuration block's `repair_reviewer:` names, or on the `reviewe...
docs/glossary.md:29:- **configuration block**: ...
docs/glossary.md:94:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model th...
(These match the report's quotes.)

# Verify 3: grep -rn '/refute, the brief check' skills docs README.md utils .agents --exclude-dir=worktrees
unchanged tree: three lines, skills/plan/templates/orchestrator-state.md:14, skills/plan/templates/plan.yaml:12, .agents/plan.yaml:10 (the old comments)
after the change: the same three files with the new comments ("... the first run of /refute, the brief check and the lookups of /grill run on ...")
# The builder's substitute: grep -rn 'claude:<model> /refute, the brief check\|model /refute, the brief check' skills docs README.md utils .agents
unchanged tree: the same three lines. After the change: no output.

# Verify 4: grep -n 'Dictated text' skills/spec/SKILL.md skills/spec/templates/brief-check.md
unchanged tree: no output.
after the change:
skills/spec/SKILL.md:262:   - **Dictated text.** Every line of text the brief dictates is read line by line.
skills/spec/SKILL.md:275:   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's **...
skills/spec/templates/brief-check.md:47:## 8. Dictated text

# Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template      (worktree, and on the unchanged tree)

# Verify 6: diff <(grep -rn 'version:' skills/*/SKILL.md | sort) on main against the worktree
version lines identical (sorted)
skills/refute/SKILL.md:5:  version: "1.7.1"
skills/spec/SKILL.md:5:  version: "1.7.0"
skills/plan-orchestration/SKILL.md:5:  version: "2.10.1"

# Dictated texts against the brief (grep -cF of each dictated string in the changed files; python comparison of the template block)
reviewer term sentence: glossary.md 1, plan-terms.md 1
"It also holds each line the brief dictates to the rules file and the standards pages.": glossary.md 1, plan-terms.md 1
three item-6 comments: 1, 1, 1
template lines 47-51 == the brief's fenced block: True

# Case 16
python3 -c 'import check_config as c; k=c.example_keys(); ...' -> True None True   (reviewer read as required; repair_reviewer present)
python3 skills/ordo-init/templates/check_config.py . -> ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists

# The report's quoted evidence, rerun
wc -l, before -> after: refute 185->187, plan-orchestration 342->347, spec 315->323, brief-check.md 55->61, plan.yaml 30->30, orchestrator-state.md 70->70, .agents/plan.yaml 14->14, plan-terms.md 121->121, glossary.md 138->138 (all as the report says)
cited lines: refute Stops row at 163, Rules 1 at 181, "With refute_after_repair: no" at 94 (92 on the unchanged tree); plan-orchestration 90, 110, 114, 140-144, Stops row at 300; spec 262-268, 270, 275; template 47 (all reproduce)
grep -rn "reviewer's model" skills utils docs README.md -> no output, exit 1
grep -rn 'reviewer:' skills utils docs README.md | grep -v 'reviewer_' -> the hits the report lists, plus check_config.test.sh:402, :418, :567 and plan.projects.yaml:32, :59, which the report does not list. Each of the extra hits is a key in a test case or in a template and is not made false.
grep -n 'dictat' skills/plan-orchestration/SKILL.md (unchanged tree) -> no output, exit 1
LC_ALL=C grep -n '[^ -~]' over the nine changed files -> no output, exit 1
```

Verify 3: the brief's literal expectation (no output after the change) contradicts item 6. Each comment that item 6 dictates contains the string `/refute, the brief check`. The builder kept the dictated words, as rule 4 of the rules file requires, and reported the contradiction under "Anything in the brief that was wrong or impossible". It substituted a grep for the two old prefixes. On the evidence, that substitute checks what verify 3 was written to check: whether a comment says that `/refute` as a whole runs on `reviewer:`. It prints the three lines on the unchanged tree and nothing after the change, and I reproduced both runs. My wider grep for sentences that tie the reviewer to a model, run across `skills/`, `utils/`, `docs/`, `README.md`, `.agents/plan.yaml` and `agents/`, finds no other sentence that puts every `/refute` run on `reviewer:`. The substitute stands.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. Steps 1 (`skills/refute/SKILL.md:48`) is unchanged and dispatches on `reviewer:`. "Steps / Over a repair round" 1 (lines 79-81) takes `repair_reviewer:`, falls back to the `reviewer:` value, keeps `reviewer_effort`, and covers the run over the extra round and a replacement reviewer. The served-model check (line 53) and the Stops row (line 163) name the key the run was dispatched on. Rules 1 (line 181) is unchanged. Standards 1 concerns line 53.
- 2: holds. The **Reviewer** bullet has three sub-bullets, one rule each (`plan-orchestration` lines 140-143). The **Brief-check agent** bullet names `reviewer:` (line 144). Steps 8 "After each reply" names "The two tiers, and the models" without restating the key (line 114). There is one **Dictated text** bullet in Steps 8 (line 110), and Steps 6 names it (line 90). The Stops row is unchanged (line 300). Standards 2 concerns line 110.
- 3: holds. `spec` "Steps / The brief check" 2 gains **Dictated text** with the six rules of the item as sub-bullets (lines 262-268). Item 4 gains the hold of a rewritten or added line (line 275). Item 3's "one heading per check of item 2" is unchanged (line 270).
- 4: holds. Template lines 47-51 equal the brief's fenced block (the python comparison printed True). The block sits after `## 7. ADRs` and before `## Declined to judge`. Standards 3 concerns the template's "Closed" heading.
- 5: holds. The dictated **reviewer** sentence and the **brief check** sentence are present word for word in both files. The **brief check** term says "on the model the configuration block's `reviewer:` names". "Steps / Over a repair round" 1 is added to "Stated in" after Steps 1 and Rules. sync_rules prints ok.
- 6: holds. The three comments match item 6 word for word (each `grep -cF` printed 1). The key, the value and the comment column are unchanged (diff). The `# required.` marker is kept, and `example_keys` still reads `reviewer` as required.
- 7: holds. The version lines are identical (verify 6 above).

Cases of the brief's "Cases":

- `reviewer: claude:opus` and `repair_reviewer: claude:sonnet`, first run on Opus, run over round 1 on Sonnet at `reviewer_effort`: met. Read in `refute` lines 48 and 79-80 and `plan-orchestration` lines 141-143.
- A block without `repair_reviewer`, run over a round on the `reviewer:` value: met. Read in `refute` line 80 and `plan-orchestration` line 142. Standards 1 covers the served-model check in this configuration.
- The run over the extra round, and a reviewer started over a round in place of a stopped one, both on `repair_reviewer:`: met. Read in `refute` line 81.
- `repair_reviewer: claude:sonnet` with `refute_after_repair: no`, no run over a round and the key unused: met. Read in `refute` line 94, which is unchanged, and no other text dispatches on the key.
- A run over a round served Opus under `repair_reviewer: claude:sonnet`, the stop showing `claude:sonnet`: met. Read in `refute` line 53 and the Stops row at line 163.
- A first run served Sonnet under `reviewer: claude:opus`, the stop showing `claude:opus`: met. Read in the same two places.
- The brief-check agent and `grill`'s lookup agents on Opus, with the term and the bullet naming `reviewer:`: met. Read in `spec` line 244 and `grill` line 189 (both unchanged), `glossary.md:17`, `plan-terms.md:12` and `plan-orchestration` line 144.
- `plan-orchestration` Steps 8 and "The two tiers, and the models" read alone, with the rule stated once: met. Line 114 names the section, and lines 141-142 state the rule.
- An unquoted sentence after a colon holding three list items in paragraph form, listed under `## 8.` with "D. Structure" and closed by a rewrite that is held again: met. Read in `spec` lines 263, 264 and 266, line 275, and template line 49.
- A dictated YAML key with its comment, read whole with the comment read as prose: met. Read in `spec` line 265.
- A requirement given without its words, not dictated: met. Read in `spec` line 263, second sentence.
- Ruled words that break a rule, giving the stop "A brief check finding the brief cannot absorb": met. Read in `spec` line 268, the When cell of that Stops row, and item 4's "A finding the session cannot close by a change to the brief is raised in the same stop."
- A round's brief that gives a sentence word for word, held by the orchestrator before the round is sent: met. Read in `plan-orchestration` line 110. Standards 2 concerns where this sits against the commit.
- A brief that dictates no text, reported as such: met. Read in `spec` line 267 and template line 49 ("Or: the brief dictates no text.").
- (preserved) The first-run and over-round records in `reviewer_report`: met. The diff of `refute` touches only lines 53, 79-81 and 163, so lines 55-56, 73 and 90 are as step 2 wrote them.
- (preserved) `check_config.py` reads `reviewer` as required: met. `example_keys` printed True None, and `check_config.test.sh` passed in the runner output.

## 1. Spec

none.

## 2. Proof

- `.scratch/2-e-a-self-rule/agents/reviews/3-report.md`, DONE / NOT DONE row 4 and section "Verify 4": "| 4 | Verify 4: `Dictated text` | DONE | below |". What is wrong: the brief's verify 4 expects the grep to print "one line for each file". It prints two lines for `skills/spec/SKILL.md` (262 and 275) and one for the template. The report quotes the three lines and marks the check DONE. It does not say that the expected output did not hold, although it does say so for verify 3. The decision that rests on this is the orchestrator's acceptance of verify 4 at landing. The second line comes from the builder's own wording at line 275 ("as item 2's **Dictated text** says"), which is correct in substance. Failure scenario: the orchestrator reads DONE, books verify 4 as printing what the brief expects, and the booking states an output that was never printed. Verdict: none.

## 3. Standards

- `skills/refute/SKILL.md:53`: "A served model that is not the configured one, the model the key the run was dispatched on names (`reviewer:` for the first run, `repair_reviewer:` for each run over a repair round), is the stop ...". What is wrong: the parenthetical assigns every run over a repair round to `repair_reviewer:` with no default. "Steps / Over a repair round" 1 (line 80) dispatches that run on the `reviewer:` value when the block has no `repair_reviewer:` key. In a block without the key, the two statements name different keys for the same run. This breaks rule 19 of the rules file (no two statements that contradict each other). It also breaks skill-layout "Where a rule goes" ("A rule is written once"): line 53 restates part of the model rule of line 80 and drops its qualifier. Item 1 of the brief gives the same mapping without the default, so the omission starts in the brief. The fix at landing is to point at the rule instead of restating it, for example "(`reviewer:` for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 names)". Failure scenario: the paused plans 2.F, 2.G and 2.H have blocks with no `repair_reviewer:` key (`grep -c '^repair_reviewer:'` printed 0 for each), with `reviewer: claude:opus` and `refute_after_repair: yes`. A run over a round in 2.F is served claude-opus-5-5. The orchestrator reads line 53, looks for the model `repair_reviewer:` names, finds none, and either has no configured value to compare against or raises the stop with an empty configured value. Verdict: none (item 1 does what its text says).
- `skills/plan-orchestration/SKILL.md:110`, in Steps 8: "**Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round or the ruling is sent, ...". What is wrong: the bullet comes after "**Before the resume.**" (lines 102-103), which commits the round's brief as a resume point. It times the hold "before the round ... is sent", while Steps 6 (line 90) holds a cases ruling "before it is committed". The hold can end in a rewrite, or in a stop through `spec`'s ruled-words rule, so it belongs before the commit it guards. Skill-layout "Lists and tables" says: "A step that can refuse or stop comes before every step that writes, drafts or commits what the refusal or stop guards." The two places also give the same hold two different times. The brief's item 2 says "before the round is sent", so the timing follows the brief, but the order and the mismatch with line 90 are the diff's. Failure scenario: an orchestrator follows Steps 8 in order. It commits the round's brief at "Before the resume", then reaches **Dictated text** and rewrites a line that breaks the prose standard. The resume-point commit carries the unheld line, and a session that resumes from that commit, as "Resuming, and handing the plan over" says, sends it to the builder. Verdict: none.
- `skills/spec/templates/brief-check.md:59` and `:61`: "## Closed (the session's change to the brief for every finding above, made before the preparation commit)" and "- <finding>: <the change to the brief, with its section>; ...". What is wrong: `spec` line 275 now requires that a dictated line the session "adds to the brief after the check" be "named under "Closed"". Such a line can have no finding, and the heading and its only bullet form describe changes made for a finding. The template is in the paths, and this sentence about the "Closed" section as a whole is now incomplete (rules file rule 14). Failure scenario: after a stop's ruling, the session adds a dictated sentence to the brief. Under "Closed" it finds only the form `<finding>: <change>`, so it either invents a finding or leaves the line out, and the record of the hold that line 275 requires is missing. Verdict: none.

## 4. Behaviour

none.

## Declined to judge

- The rule for the model of the run over a repair round is now stated in `refute` "Steps / Over a repair round" 1, in `plan-orchestration` "The two tiers, and the models" and in the **reviewer** term. The brief's items 1, 2 and 5 asked for each copy, and before the step the tree already stated the `reviewer:` model in both `refute` Steps 1 and `plan-orchestration`. I do not judge whether this cross-skill repeat breaks skill-layout "Where a rule goes". It is a choice of the brief and the orchestrator's to rule on, not something the builder could change under rule 20.
- Whether "dictated text" needs a glossary entry under skill-layout "Writing for an agent". The builder raised it as the user's call. No item asks for it (rule 20), and the other check labels, such as "Implied inputs", have no entry. The point is a scope decision for the orchestrator.
- The step line's check, that step 4's run over its repair round is served claude-sonnet-5-5. That run does not exist yet, and `plan.md` "Blocked, and by what" books it for step 4.
- The `reviewer:` hit list of the report's "Rule 14" section leaves out five hits (`check_config.test.sh:402`, `:418`, `:567` and `plan.projects.yaml:32`, `:59`). I read each one, and none is made false. No decision rests on the list, so this is not a finding.

Reviewer usage: afaa4e2644e7b3e6a, claude-opus-5-5 (ordo-high), 188262 tokens, 48 tool uses, 7 min 46 s

## Repair round 1, refuted

I ran every command from the worktree root `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-3`. For the unchanged tree I used the main checkout. `git diff 2bf05e5 --stat -- . ':(exclude).scratch'` run in the main checkout printed nothing, so main equals the base outside the ledger. The round's delta is `diff 3-before-round-1.patch <(git diff 2bf05e5 -- . ':(exclude).scratch')`, and it covers exactly four places:
- `refute` line 53 and the Stops row.
- `plan-orchestration` Steps 8: the **Dictated text** bullet moved, and its timing changed.
- `spec/templates/brief-check.md`: the "Closed" heading and its second bullet form.
- The builder's report.

Nothing else in the tree changed in the round.

```
$ sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md   (exit 0)
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
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
(the worktree's state file and main's carry the same verify list: diff of the two verify blocks printed nothing)

# Verify 2: grep -n 'repair_reviewer' skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md   (lines cut)
unchanged tree (main):
docs/glossary.md:29:- **configuration block**: ...
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: ...
worktree:
skills/repo-setup/templates/plan-terms.md:24:- **configuration block**: ...
skills/repo-setup/templates/plan-terms.md:89:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration
skills/refute/SKILL.md:80:   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no `repair_reviewer:` key, at the effort `reviewer_e
docs/glossary.md:29:- **configuration block**: ...
docs/glossary.md:94:- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` name
skills/plan-orchestration/SKILL.md:142:  - Each run over a repair round runs on the model the configuration block's `repair_reviewer:` names, or on the `reviewer:` value when the block has no `repair_
(matches the round section: refute:53 no longer names the key)

# Verify 3: grep -rn '/refute, the brief check' skills docs README.md utils .agents
unchanged tree (main, --exclude-dir=worktrees): the three old comments, plan.yaml:12, orchestrator-state.md:14, .agents/plan.yaml:10
worktree: the same three files with the new comments ("... the first run of /refute, the brief check and the lookups of /grill run on ..."), exit 0
# The old forms: grep -rn 'claude:<model> /refute, the brief check\|model /refute, the brief check' skills docs README.md utils .agents
worktree: no output, exit 1

# Verify 4: grep -n 'Dictated text' skills/spec/SKILL.md skills/spec/templates/brief-check.md
unchanged tree (main): no output, exit 1
worktree:
skills/spec/templates/brief-check.md:47:## 8. Dictated text
skills/spec/SKILL.md:262:   - **Dictated text.** Every line of text the brief dictates is read line by line.
skills/spec/SKILL.md:275:   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's **Dictated text** says before the preparation commit, and is named under "Closed".

# Verify 5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

# Verify 6: git diff 2bf05e5 -- . ':(exclude).scratch' | grep -n 'version:'
no output, exit 1

# The round's quoted evidence, rerun
wc -l: refute 187, plan-orchestration 347, spec 323, brief-check.md 62, plan.yaml 30, orchestrator-state.md 70, .agents/plan.yaml 14, plan-terms.md 121, glossary.md 138 (as the report says; brief-check.md 62)
grep -rn "before the round or the ruling is sent\|the key the run was dispatched on" skills docs README.md utils -> no output, exit 1
LC_ALL=C grep -n '[^ -~]' over the nine changed files and 3-report.md -> no output, exit 1

# Dictated text of the round's brief, compared with the files (python, exact line membership)
ruling 1 bullet in skills/refute/SKILL.md: True
ruling 3 heading in skills/spec/templates/brief-check.md: True
ruling 3 second bullet form in skills/spec/templates/brief-check.md: True (it follows the first bullet form, as ruled)

# Names the round changed, grepped across skills/ utils/ docs/ README.md
"the configured model": refute/SKILL.md:163 only
"the key the run was dispatched on": no hit
"before the round": plan-orchestration/SKILL.md:101 (the moved bullet), :105 (the diagnose rule, "before the round is sent", unrelated, true)
"configured value" / "configured one": ordo-help/SKILL.md:79, grill/SKILL.md:197-198 and :312, spec/SKILL.md:251 and :298, plan-orchestration/SKILL.md:243 and :300, the figures; each still holds read per key
"Closed": plan-terms.md:20 and glossary.md:25 (the **Closed** term, see Standards 1), spec/SKILL.md:274, :275, :284 (see Standards 2), plan-orchestration/SKILL.md:53, refute/SKILL.md:154, refute/templates/report.md:65, plan/templates/orchestrator-state.md:43, land/SKILL.md:189, plan-retro/SKILL.md:71 (each still true)
```

### Verdicts

These are the verdicts for the whole diff since the base.

Items of the brief's "What to build":

- 1: holds.
  - Steps 1 (`refute` line 48) still dispatches on `reviewer:`.
  - "Steps / Over a repair round" 1 (lines 79-81) takes `repair_reviewer:`. When the block has no such key it takes the `reviewer:` value. It keeps `reviewer_effort`, and it covers the extra round and a replacement reviewer.
  - The served-model check (line 53) now says that for a run over a round, "the configured one" is the model "Steps / Over a repair round" 1 gives. That includes the default, so the contradiction of the first run's Standards 1 is gone.
  - The Stops row (line 163) shows "the configured model (Steps 1)". Rules 1 is unchanged.
- 2: holds.
  - The **Reviewer** bullet has three sub-bullets (lines 141-143). The **Brief-check agent** bullet names `reviewer:` (line 144).
  - Steps 8 "After each reply" names "The two tiers, and the models" (line 114).
  - The **Dictated text** bullet (line 101) now comes before **Before the resume** and is timed "before the round's brief or the ruling is committed". Steps 6 (line 90) names it with the same timing.
  - The Stops row (line 300) is unchanged.
- 3: holds. **Dictated text** is at `spec` lines 262-268, the hold of a rewritten or added line is at line 275, and line 270 is unchanged. Standards 2 concerns item 4's completion criterion at line 284.
- 4: holds. `## 8. Dictated text` is at template lines 47-51. The "Closed" heading and its new bullet form match the round's ruling word for word.
- 5: holds. The **reviewer** and **brief check** terms are word for word as dictated in both files, and sync_rules prints ok. Standards 1 concerns the **Closed** term, which item 5 does not name.
- 6: holds. The three comments are as dictated, with key, value and comment column unchanged.
- 7: holds. Verify 6 printed no `version:` line in the diff.

Cases of the brief's "Cases":

- `reviewer: claude:opus`, `repair_reviewer: claude:sonnet`: first run on Opus, run over round 1 on Sonnet at `reviewer_effort`. Met (`refute` 48 and 79-80; `plan-orchestration` 141-143).
- A block without `repair_reviewer`: met. Line 80 gives the `reviewer:` value, and line 53 now points at line 80, so the served-model check reads the same value.
- The extra round and a replacement reviewer over a round: met (`refute` line 81).
- `repair_reviewer` with `refute_after_repair: no`: met. Line 94 is unchanged, and no other text dispatches on the key.
- A run over a round served Opus under `repair_reviewer: claude:sonnet`: met. Line 53 gives the model of "Steps / Over a repair round" 1, which is `claude:sonnet`. The Stops row shows the configured model.
- A first run served Sonnet under `reviewer: claude:opus`: met (line 53, "the `reviewer:` model for the first run").
- Brief-check and lookup agents on Opus, with the term and the bullet naming `reviewer:`: met (`spec` 244, `grill` 189, `glossary.md:17`, `plan-terms.md:12`, `plan-orchestration` 144).
- `plan-orchestration` Steps 8 and "The two tiers, and the models" read alone, with the rule in one place: met (line 114 names the section; lines 142-143 state the rule).
- An unquoted sentence after a colon with three list items, closed by a rewrite held again: met (`spec` 263, 264, 266, 275).
- A dictated YAML key with its comment: met (`spec` 265).
- A requirement given without its words, which is not dictated: met (`spec` 263, second sentence).
- Ruled words that break a rule, which give the stop: met (`spec` 268 and the Stops row at 297).
- A round's brief giving a sentence word for word, held before the round is sent: met. `plan-orchestration` line 101 holds it before the round's brief is committed, and that commit comes before the resume.
- A brief that dictates no text: met (`spec` 267; template line 49).
- (preserved) The `reviewer_report` records: met. The `refute` diff touches only lines 53, 79-81 and 163, so lines 55-57, 73 and 90 are as step 2 wrote them.
- (preserved) `check_config.py` reads `reviewer` as required: met. `check_config.test.sh` printed PASS in the verify list.

### Findings

Spec: none.

Proof:

- `.scratch/2-e-a-self-rule/agents/reviews/3-report.md`, "Repair round 1", "Rule 14 for this round", second bullet: "the **Closed** term ... is outside the step's paths and does not list the dictated line added after the check that the template's "Closed" now holds. It is not false; ... the term is one for the user to widen if wanted, since no item of the brief or of this round changes it."
  - **What is wrong.** The path claim does not reproduce. The brief's "Paths this step writes" lists `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` as whole files (`grep -n 'Paths this step writes' -A 12 agents/briefs/3.md` prints both). The brief's "What it must do" says that a sentence the change makes false is changed in the same step when its file is in the paths.
  - **The decision that rests on it.** Whether the term is fixed in this step, or handed to the user as a later item. The builder handed back work inside its scope (rules file, rule 12).
  - **Failure scenario.** The orchestrator reads "outside the step's paths", books the term as the user's call, and lands a template whose "Closed" heading holds entries the glossary term does not define.
  - Verdict: none (Standards 1 is the defect itself).

Standards:

1. `skills/repo-setup/templates/plan-terms.md:20` and `docs/glossary.md:25`: "**Closed**: the heading of a report that holds each finding's disposition, in a brief-check report the change to the brief that closed it, ...".
   - **What is wrong.** After the round, `skills/spec/templates/brief-check.md:59` and `:62` give the "Closed" heading a second kind of entry: "each dictated line added after the check", with the form "- <a dictated line added after the check, quoted>: holds, or each rule it broke and the rewrite that closed it." That entry is no finding's disposition. `spec` line 275 has required naming such a line under "Closed" since the first build.
   - **The rule broken.** `docs/dev/skill-layout.md`, "Writing for an agent": "A term that `docs/glossary.md` defines is used only in a sense it defines there. A skill that needs ... a term in a new sense, adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first". Also rules file rule 14.
   - **The fix at landing.** It is small and inside the paths. In both files, after "in a brief-check report the change to the brief that closed it", add "and each dictated line added to the brief after the check, with whether it holds". Verify 5 must still print ok after the change.
   - **Failure scenario.** A session writing a brief-check report's "Closed" section reads the term, which describes only dispositions of findings. It leaves out a dictated line added after a ruling, because that line had no finding. The hold `spec` line 275 requires then has no record.
   - Verdict: none.
2. `skills/spec/SKILL.md:284`, "Steps / The brief check" 4: "This item is done when every finding has its change under "Closed", or the step has stopped."
   - **What is wrong.** Item 4 gained the bullet at line 275, which requires each dictated line rewritten or added after the check to be held line by line and named under "Closed". The completion criterion still covers findings only, so item 4 can read as done with an added dictated line neither held nor named.
   - **The rule broken.** `docs/dev/skill-layout.md`, "Writing for an agent": "Each item of Steps ends on its completion criterion: what is true, or what exists, when the step is done". Also rules file rule 14, for an "every" sentence the change makes incomplete.
   - **Where it comes from.** It dates from the first build. The round's template change for the same entry makes the gap visible.
   - **The fix at landing.** It is small and inside the paths, for example: "This item is done when every finding has its change under "Closed", each dictated line rewritten or added after the check is held and named there, or the step has stopped."
   - **Failure scenario.** After a stop's ruling, the session adds a dictated sentence to the brief. It sees every finding closed under "Closed", reads item 4 as done, and makes the preparation commit. The added sentence reaches the builder without the hold.
   - Verdict: none.

Behaviour: none. The round changes no host- or user-visible behaviour beyond what the report's round section states before and after (the Stops cell, the bullet's place and timing, the template's heading and bullet form).

Closures the builder claims, checked:

- Standards 1 (`refute` line 53): closed by a fix, with no check removed. The bullet is word for word as ruled. The Stops cell took the ruled alternative, "the configured model (Steps 1)". Its reason, that "the key the run was dispatched on" names no single key when the block has no `repair_reviewer:`, holds on reading. The case "no `repair_reviewer:`, served Opus under `reviewer: claude:opus`, no stop" reads met from lines 53 and 80.
- Standards 2 (`plan-orchestration` Steps 8): closed. The bullet now sits between **How** and **Before the resume**, with the timing ruled. Steps 6 (line 90) was not touched in the round, and it already holds the same timing.
- Standards 3 (template "Closed"): closed for the template, word for word. The term and the completion criterion are Standards 1 and 2 above.
- Proof 1 (report verify 4): closed. Row 4 and the "Verify 4" section say what the ruling asked, and my rerun of verify 4 printed the same three lines.
- No fix reaches beyond its finding. The only other change in the round is to the report's earlier sections, which were updated to the current tree (cases 5 and 13, the judgment calls, the Verify 2 listing, "Changed lines"). I reread each of them against the tree, and they match.

### Declined to judge

- The step line's check, that step 4's run over its repair round is served claude-sonnet-5-5. That run does not exist yet. `plan.md` "Blocked, and by what" books it for step 4.
- The dictated wording of round 1, ruling 1: "the `reviewer:` model". Elsewhere the skills write "the model the configuration block's `reviewer:` names". The orchestrator dictated these words, and holding them line by line was its job under `plan-orchestration` Steps 8 **Dictated text** before the round was committed. Whether this phrase counts as a second name under the prose standard's "D. Structure" (no synonym cycling) is a reading I leave to the orchestrator. The builder had to copy the words as given (rules file rule 4).
- Whether "dictated text" needs a glossary entry. No item asks for one, and the builder named it as the user's call. It is a scope decision.
- A line rewritten to close a brief-check finding is named under "Closed" in the first bullet form, which has no place for its hold result. The added-line form records one. `spec` line 275 asks only that the line be named, so I do not raise this as a finding. Whether the rewrite's hold result should also be recorded is the orchestrator's choice of form.
- The `reviewer:` hit list in the report's "Rule 14" section leaves out `check_config.test.sh:402`, `:418`, `:567` and `plan.projects.yaml:32`, `:59`. I read each of them, and none is made false. No decision rests on the list.

Reviewer usage: af5b739d11c2d60e0, claude-opus-5-5 (ordo-high), 197087 tokens, 34 tool uses, 5 min 51 s

## Closed

- First run, Proof 1 (verify 4 marked DONE with an output other than the brief's): closed in repair round 1; the report's row and section say the grep prints two lines for `spec` and why.
- First run, Standards 1 (`refute` Steps 1 restating the model of a run over a round without its default): closed in repair round 1; the bullet points at "Steps / Over a repair round" 1, and the Stops row shows "the configured model (Steps 1)".
- First run, Standards 2 (the hold of a round's brief after its commit): closed in repair round 1; `plan-orchestration` Steps 8 **Dictated text** comes before **Before the resume**, timed before the commit.
- First run, Standards 3 (no "Closed" form for a dictated line added after the check): closed in repair round 1; the template's heading and a second bullet form.
- Run over round 1, Proof 1 (the builder's claim that the **Closed** term is outside the paths): fixed at landing; `plan-terms.md` and `docs/glossary.md` are in the paths, and Standards 1 below changes the term. A landing note in `3-report.md` corrects the claim.
- Run over round 1, Standards 1 (the **Closed** term describes only finding dispositions): fixed at landing; the term in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` now says that in a brief-check report the heading also holds each dictated line added after the check, with whether it holds; `sync_rules.py . --only glossary` prints ok.
- Run over round 1, Standards 2 (`spec` "Steps / The brief check" 4's completion criterion covers findings only): fixed at landing; it now reads "when every finding has its change under "Closed" and each dictated line rewritten or added after the check is held and named there, or the step has stopped."
- Run over round 1, "Declined to judge" 2 ("the `reviewer:` model" as a second name): fixed at landing; `refute` Steps 1 now reads "the model the configuration block's `reviewer:` names for the first run", the form the skills use.
- Run over round 1, "Declined to judge" 3 ("dictated text" as a glossary term) and 4 (no hold result for a rewritten line in the first bullet form): no change. The other check labels of "Steps / The brief check" 2 have no glossary entry, and the rewritten line is held under item 4's bullet whatever the bullet form records.
