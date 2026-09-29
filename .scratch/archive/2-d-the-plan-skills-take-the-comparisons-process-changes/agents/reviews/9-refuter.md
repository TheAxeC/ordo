# Step 9 refuter report (on .agents/worktrees/2d-9, base 888f8e65faebaf690ed7c8b6846034df8552f6cd)

This report cites pages by their section, not by line number, because a page's lines move and its section names do not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
(exit 0)

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
(exit 0)

$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
702 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md

$ { git diff --name-only 888f8e6; git ls-files --others --exclude-standard; } | tr '\n' '\0' | xargs -0 env LC_ALL=C grep -n '[^ -~]'
(nothing printed, grep exit 1)

$ python3 skills/ordo-init/templates/check_config.py .
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists   (exit 0, after eight "note: ... default applies" lines)

Reverts, each applied to a scratch copy of templates/ under $TMPDIR (the worktree untouched), with the copy's sync_rules.test.sh run on it. All ten went red with exit 1:
R1  the glossary left out of a default run      -> FAIL: equal blocks: stdout is [ok: the shared-rules block ...], expected [... ok: the plan-terms block equals the template]
R3  a missing glossary skipped                  -> FAIL: python3 -B .../sync_rules.py .../no-glossary: exit 0, expected 2
R4  stop at the first file in error             -> FAIL: two files in error do not print both error lines in order
R5  a failed CLAUDE.md write, then the glossary -> FAIL: lost write: stdout is not empty: [ok: the plan-terms block equals the template]
R6  --only glossary reads CLAUDE.md             -> FAIL: ... only-no-claude --only glossary: exit 2, expected 0
R9  --only with any value                       -> FAIL: ... args --only rules: exit 0, expected 2
R10 a marker counted only on a line of its own  -> red (quoted-marker case)
R12 a directory glossary taken as missing       -> FAIL: glossary a directory: stderr is not [error: ...cannot read .../docs/glossary.md: Is a directory...]
R13 a missing plan-terms.md taken as empty      -> red (no plan-terms.md case, exit 1 with a diff)
R14 no read-back after the write                -> red (lost write case)

First run reproduced: the new sync_rules.test.sh, with fail() made non-fatal, against the base sync_rules.py in a scratch copy: 64 FAIL: lines. The report quotes 63. The one extra line is "FAIL: --only=glossary with no other argument: stderr is not the usage line", which is test line 368. The report's case table lists that test. Every other line matches the report's list.

Line counts: base sync_rules.py has 121 lines and the base test 180. `git diff --numstat` and `wc -l` match the report's "Files and line counts" row by row.

My own fixtures, all under $TMPDIR:
- A CRLF glossary with a BOM, both markers on one line, with --only glossary: check exit 1; --write exit 0; the recheck exit 0; the BOM, the CRLF endings and the text around the markers are kept.
- --only glossary --write with no docs/: exit 2, the no-single-block line, nothing written.
- No arguments, --write alone, and --only glossary with no path: the usage line, exit 2 each.
- A root that does not exist: two error lines, exit 2.
- CLAUDE.md with no block plus a Latin-1 glossary:
    error: CLAUDE.md has no single shared-rules block (<!-- ordo:shared-rules begin --> ... <!-- ordo:shared-rules end -->)
    error: <scratch>/fx/m/docs/glossary.md is not UTF-8 (byte 3)
    exit 2
```

## Verdicts

Items of the brief's "What to build" (1 to 11), plus item 12 from the ruling-F addition:

- 1: violated. Several entries restate rules instead of pointing at them (Spec 1). Two entries state things their named section does not (Spec 2). Two senses and two words the skills use are missing (Spec 3). Everything else holds: the file has 90 entries, verified to be in alphabetical order. Every "Stated in" names a heading or a numbered Steps item that exists, checked for all 162 references against the headings and the numbered items of each section. No entry names an Ordo-only page as its source; the only page paths inside definitions are `docs/glossary.md` and `docs/dev/`, which are repository paths every set-up repository has.
- 2: holds. There is one heading and one paragraph, which names the block without writing the marker strings. The block is byte-equal to `plan-terms.md` (python compare: True), and the own terms are under `## Ordo's own terms`. The builder added three own terms (coverage list, loop in the README, verdict of a blind comparison); I checked their sources: change-standard rule 18, `utils/check_coverage.py`'s head comment, README's introduction, and blind-comparison steps 6 and 7.
- 3: holds. The template has the heading, the paragraph, the two markers with nothing between them, and `## Project terms` with the entry-form comment and no entries.
- 4: holds. By reading `sync_rules.py`:
  - Blocks load in the order shared-rules then glossary, and everything is loaded before anything is printed or written.
  - Each file in error prints its own line.
  - CLAUDE.md is written first, and a failed write returns before the glossary is written.
  - `--only glossary` never reads CLAUDE.md.
  - The argument parser handles every form the brief lists.
  - The docstring lists the inputs, the error lines and the exit statuses.
  - The ten reverts above all go red, and my fixtures behave as the item states.
- 5: holds. There is a test for every script case, each asserting the exit status and the line printed. The ten reverts I ran each turn a test red.
- 6: holds. The introduction, Quick start, "What it reads" 1 and 4, Steps 3, "Steps / sync" 1 to 4, "The tree", Anti-patterns row 4, the Stops row and Rules bullet 3 all read as the item says. The version is 1.2.0 and the description is 702 characters. See Standards 2 for a gap that the item's new behaviour opens.
- 7: holds. The text is exactly the brief's, after the roadmap bullet.
- 8: holds. The text is exactly the brief's, after "One meaning has one place".
- 9: holds. See `docs/dev/building.md`'s code block and `docs/dev/change-standard.md`, "Commands and their filters". The command appears in both, the comments match the brief, and there is no filter in the change standard.
- 10: holds. `standards` ends with `docs/glossary.md`.
- 11: holds. README "The skills" table row, the "Configuring a repository" paragraphs, and both command lines, `--only glossary` included.
- 12 (ruling F): holds. The Steps 7 bullet reads as ruled and the version is 1.1.1. The description does not name what `standards` holds, so it is left unchanged at 632 characters.

Cases of the brief's "Cases":

- Both blocks equal: met (test "equal blocks", R1 red).
- The glossary block differs by one line: met (terms-drift).
- Both blocks differ: met (both-drift).
- `--write` with both differing, a CRLF glossary: met (both-write).
- No `docs/glossary.md`: met (no-glossary, R3 red).
- No block, two blocks, reversed markers: met.
- A glossary that is not UTF-8: met.
- `plan-terms.md` missing: met (R13 red).
- `--only glossary` with no `CLAUDE.md`: met (R6 red).
- `--only` with another value, and two paths: met (R9 red).
- A drifted shared-rules block and no glossary, with and without `--write`: met.
- `CLAUDE.md` with no block and no glossary, two error lines: met (R4 red).
- `--write` with only the glossary differing: met.
- `--write` where `CLAUDE.md` cannot be written: met (R5 red).
- `--only glossary` beside a drifted or a missing shared-rules block: met.
- `--only glossary --write`: met.
- `--only` last, `--only=glossary`, `--only glossary` twice, and `--only glossary` before the path: met.
- A directory glossary: met (R12 red).
- A non-UTF-8 glossary under `--write`: met.
- A glossary that cannot be written or does not read back: met.
- A marker in prose: met (R10 red).
- Every earlier case still passes: met.
- The six terms (step, brief, ledger, landing, finding, open item): met. I read each against its named sections: `plan` Rules; `spec` Steps 4; `plan-orchestration` Steps 4, 6 and 8; `plan` Steps 1 and 3 to 5; `land` Steps 5 and the whole of Steps; `refute` Steps 6 and "Finding dispositions"; `spec` "Steps / The brief check" 4 and "Steps / A stop"; `land` Stops, last row.
- The table of terms: met. The report's table has 113 rows and covers all 90 plan-terms entries (checked by comparing the table's term column with the entry list) and the own terms. Nine line references spot-checked: each shows the term in the stated sense.
- The list's completeness: partial. "refuter" and "fix round" are missing (Spec 3).
- Each term of item 1 grepped for other senses: partial. "stop" in the sense of ending a running agent is not in its entry (Spec 3).
- The template: met.
- `sync_rules.py . --only glossary` exits 0: met.
- The grep for items 7 to 11: met.
- The length command: met. The highest is 1022 (spec), and repo-setup is 702.
- Ruling F's case: met. `grep -n 'glossary' skills/ordo-init/SKILL.md` prints only line 67, and `check_config.py`'s standards loop only rejects a page that does not exist.

The sample I read against its named sections, 43 entries: step, brief, ledger, landing, finding, open item, case, the session, worker, wip, delta, loop, bar, stop, refusal, red line, A/B, base, booking, brief check, Closed, authority, dispatch entry, dispatch block, time box, taken back out of main, repair round, resume point, verify list, gate, standards, orchestrator, executor, plan skills, kind, position line, premise, Step 0, ruling, review cadence, reviewer, look and completion notice. Each says what its section says, except base and dispatch block (Spec 2), and the rule restatements listed in Spec 1.

## 1. Spec

- `skills/repo-setup/templates/plan-terms.md` lines 3, 4, 19, 35, 41, 58, 62 and 74. Quoted hunks:
  - Line 62 (repair round): "the round cap allows at most `repair_rounds`, and one more only when the delta leaves a verification command red or an acceptance item unbuilt with a fix too large for landing".
  - Line 4 (acceptance item): "one the delta leaves unbuilt, with a fix too large for landing, is one of the two conditions that allow a round beyond `repair_rounds`".
  - Line 35 (kind): "a kind is recurring when it appears in at least three steps or two plans".
  - Line 58 (recurring finding): "every tenth landed step and at any pause, finds in three or more steps".
  - Line 3 (A/B): "at least ten runs each".
  - Line 41 (night rule): "dispatch only what fits before the cut-off, and at the cut-off stop what runs and pause the plan".
  - Line 74 (shared path): "allowed only when the orchestrator judges the merge at landing simple".
  - Line 19 (dead builder): "a continuation builder takes over its worktree only when the user says so".

  What is wrong: each of these restates a rule, with its thresholds and conditions, that the named skill section states. The brief's Decision 1 and item 1 ask that a definition point at its source and not restate the rule. The round-cap rule appears twice inside the glossary (lines 4 and 62) as well as in `plan-orchestration`, Rules, which also breaks `docs/dev/skill-layout.md`, "Writing for an agent" ("One meaning has one place").

  Failure scenario: a later step changes `plan-orchestration` Rules' round cap, or `plan-retro` Steps 6's threshold. `sync_rules.py` compares the glossary only with `plan-terms.md`, never with the skills, so nothing turns red. `docs/glossary.md` is now in `.agents/plan.yaml`'s `standards`, so every brief tells the builder to read it and the reviewer holds the diff to it. The builder and the reviewer then read two rules that disagree, and a reviewer may raise a finding against the skill's current rule on the strength of the stale glossary copy.

  Verdict: item 1 violated.

- `skills/repo-setup/templates/plan-terms.md` lines 7 and 22.
  - Line 7 (base): "the base binaries are the build `/spec` stages from it for the A/B". The named `spec` Steps 8 says the base binaries are "copied aside from the current build", not built from the base commit.
  - Line 22 (dispatch block): "the second `yaml` block of the state file, `dispatch: none` or the dispatch entries of the steps in flight. Stated in: `spec`, Steps 9." `spec` Steps 9 states neither "second `yaml` block" nor `dispatch: none`. `git grep -n -e 'dispatch: none' -- skills` finds it only in the `plan` skill's `templates/orchestrator-state.md`.

  What is wrong: item 1 requires each term "checked by reading the section it names". These two definitions state things the named section does not.

  Failure scenario: a reader follows "Stated in: `spec`, Steps 9" to confirm the block's shape and does not find it. A reader of the base entry takes the staged binaries to be a build of the base commit, while `spec` stages whatever build is current.

  Verdict: item 1 violated.

- Senses and words the skills use that `plan-terms.md` does not give.
  - `skills/land/SKILL.md:44` "Stop the step's builder and every reviewer of the step", `:45` "the runner's stop tool", and `skills/plan-orchestration/SKILL.md:263` "At the cut-off anything still running is stopped" all use "stop" to mean ending a running agent. The entry at `plan-terms.md:81` gives only a halt for a user decision and a Stops-table wait. `plan-terms.md` itself uses the missing sense at line 41 ("stop what runs") and line 71 ("stop tool").
  - `skills/plan-retro/SKILL.md:10` "A finding the refuter keeps making" uses "refuter" for the reviewer. The brief's item 1 names "reviewer (the refuter)", but the entry at line 66 does not name "refuter".
  - `skills/plan-orchestration/SKILL.md:262` "A reviewer or a fix round is dispatched" uses "fix round" for a repair round, and it has no entry.

  What is wrong: the brief's cases ask that every use in a sense an entry does not give be closed by adding the sense, and that every missing word be added. The report's sweep lists "stop" only with the approval sense added, and does not name "refuter" or "fix round".

  Failure scenario: under the new `docs/dev/skill-layout.md` rule ("A term that `docs/glossary.md` defines is used only in a sense it defines there"), a builder or reviewer reading `land` Steps 1 finds "stop" defined only as a halt for the user's decision. They either treat "Stop the step's builder" as a rule breach and rewrite it, or read it as an open item to book.

  Verdict: the completeness case and the "each term grepped" case are partial.

## 2. Proof

None.

## 3. Standards

- `skills/repo-setup/templates/plan-terms.md:49` defines "plan skills" as "(`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`)". Against it:
  - `skills/repo-setup/templates/docs/glossary.md:3` says "The plan skills' terms stand in the block below".
  - `skills/repo-setup/templates/CLAUDE.md:20` says "the terms of this repository and of the plan skills".
  - The block also carries terms whose only source is `roadmap`, `plan-retro`, `repo-setup` or `ordo-init`: capability map (line 12), insertion form (34), kind (35), retro (64), the questions (57), sync (82) and commit rule (16).

  What is wrong: the step's own text uses "plan skills" in a wider sense than the glossary's entry gives. That breaks the rule this step adds (`docs/dev/skill-layout.md`, "Writing for an agent") and the prose standard's D, "No synonym cycling". The two texts come from the brief's items 3 and 7, so the fix is the orchestrator's: add the wider sense to the entry, or reword the texts.

  Failure scenario: a skill author adding a `roadmap` term reads "the plan skills' terms" and the six-skill entry, and decides the term does not belong in `plan-terms.md`. The skill-layout rule says it does, so the term goes undefined.

- `skills/repo-setup/SKILL.md`, "Steps / sync" items 4 and 7. Item 4 reads: "Exit 2 with `error: CLAUDE.md has no single shared-rules block` or `error: docs/glossary.md has no single plan-terms block`: draft the change for each block the lines name." Item 7 reads: "Exit 2 with any other `error:` line (...): draft nothing."

  What is wrong: item 4 of the brief makes the script print one `error:` line per file in error. The fixture above prints a block line and an "is not UTF-8" line in one run. Items 4 and 7 then both apply and give opposite instructions. Before this step only one line could print, so this is a contradiction the change introduces (`docs/dev/change-standard.md`, rules 14 and 19).

  Failure scenario: `/repo-setup sync` on an older repository whose `CLAUDE.md` has no block and whose `docs/glossary.md` is Latin-1. The session cannot tell whether to draft the `CLAUDE.md` block or to draft nothing until the glossary is fixed.

## 4. Behaviour

None. The report states the before and after for `sync` on a repository set up earlier (it now exits 2 until it has a glossary), for the usage line, for `/ordo-init`'s `standards`, and for Ordo's verify commands.

## Declined to judge

- Semicolons in `plan-terms.md`: 99 over 4,343 words, 41 of them outside the "Stated in" lists (counted by a scratch python run). Whether a one-line glossary bullet is "running prose" under prose standard B, or a "one-line data row", is a reading call for the orchestrator or the user.
- Entries longer than the brief's "one or two sentences" (booking, case, Closed, gate, ruling, stop, each over 80 words). The builder names this as a judgment call. Whether it stands is the user's call on the entry form.
- The new `docs/dev/skill-layout.md` bullet holds two rules in one bullet. Its text is dictated verbatim by brief item 8.
- The 47 entries outside my 43-entry sample were checked only for the existence of their named sections (all 162 references), not read against them.
- The brief's premises were not rerun; the two brief-check runs recorded them.
- Copying item 9's command and item 10's `standards` into the state file at landing belongs to the orchestrator.
- The report's first run lists 63 `FAIL:` lines; my rerun gives 64. The difference is test line 368, which the report's case table lists. No decision rests on the count.
- The builder's reverts R2, R7, R8 and R11 were not reproduced. The ten others above were.

Reviewer usage: claude:opus, a fresh agent; 258063 tokens, 59 tool uses, 665 s (from the completion notice). Saved by the orchestrator from the reviewer's final message, its verification block as the reviewer quoted it.

## Repair round 1, refuted

Reviewer: a fresh agent, read-only. The worktree is `.agents/worktrees/2d-9` and the base is 888f8e65faebaf690ed7c8b6846034df8552f6cd. To get the round's delta the reviewer rebuilt the round-0 tree under `$TMPDIR/r9`: it reverse-applied `git diff 888f8e6` to copies of the current files, then applied `agents/reviews/9-round-0.diff`, then ran `diff -ru r0 now`. The delta touches six files: `docs/glossary.md` (block lines 5 to 96 only), `skills/plan-orchestration/SKILL.md`, `skills/repo-setup/SKILL.md`, `skills/repo-setup/templates/CLAUDE.md`, `skills/repo-setup/templates/docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`. No script changed in this round.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
exit 0

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0

$ python3 -c 'import glob,yaml; ...' (the length command)
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
702 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md

$ { git diff --name-only 888f8e6; git ls-files --others --exclude-standard; } | tr '\n' '\0' | xargs -0 env LC_ALL=C grep -n '[^ -~]'
(nothing printed) grep exit 1

The round section's own evidence, rerun in the same form:
sorted (the entry order check)
semicolons outside Stated in: 0 semicolons in all: 61
3858 skills/repo-setup/templates/plan-terms.md (wc -w)
grep -n -e 'at least' -e 'every tenth' -e 'three or more' -e 'only when' plan-terms.md: nothing printed, exit 1
wc -l: 92 plan-terms.md, 108 docs/glossary.md, 13 templates/docs/glossary.md, 33 templates/CLAUDE.md, 159 repo-setup/SKILL.md, 318 plan-orchestration/SKILL.md
git diff --numstat: 2 2 plan-orchestration/SKILL.md; 22 17 repo-setup/SKILL.md; 1 0 templates/CLAUDE.md

The reviewer's own checks:
- A second semicolon count, by locating each ";" relative to the nearest "Stated in: " before it: none outside a "Stated in" list.
- A sentence count per sense: no sense over two sentences.
- The block of docs/glossary.md between the markers, compared with plan-terms.md by diff: equal. The own-terms part: unchanged since round 0.
- Entry names, round 0 against now: 90 and 90, same order. 60 entries changed in the round.
- Each of the 60 "Old:" lines of the round section is byte for byte a line of the round-0 plan-terms.md, and each "New:" line a line of the current file (grep -qxF, no misses).
- grep -rn -i "fix round" skills docs README.md .agents/plan.yaml: only docs/academic-coverage.md:98, a different sense, which point 6 keeps.
- grep "plan skills' terms", "of the plan skills": nothing. grep -rn -i "draft nothing": only skills/repo-setup/SKILL.md:86, the new item 7.
- grep -rn -e '2\.10\.0' -e '1\.2\.0' over skills docs README.md utils .agents/plan.yaml: only skills/roadmap/SKILL.md:5, that skill's own version.
```

### Verdicts

- Round point 1: partial. The eight named entries are changed exactly as ruled. Of the 33 further entries, 29 still say what the term names; bar, time box and hand-back lost the part that is the term's meaning, and red line's second sense changed meaning (Findings 1 to 4).
- Point 2: holds. Point 3: partial (Finding 5). Points 4 to 8: hold. Point 5's "no fact dropped" holds on 22 entries read old beside new: booking, brief, Closed, completion notice, dispatch entry, finding, ledger, open item, preparation commit, refusal, refuter report, ruling, session (the), step, rules file, verification page, in flight, case, executor, gate, user-visible choice and worktree.
- First report: Spec 1 closed for the eight entries and the round-cap duplicate; Spec 2 closed; Spec 3 closed for fix round and refuter, "stop" as ending an agent closed with a narrower sense (Finding 5) and a further sense missing (Finding 6); Standards 1 and 2 closed; the semicolon and entry-length points closed.
- Brief items over the whole diff: 1 violated (Findings 1 to 4 and 6); 2 to 12 hold.
- Cases: all met, except "each term grepped", partial (Finding 6).

### Findings

1. Spec. `skills/repo-setup/templates/plan-terms.md:6`, bar: "the standard a builder's first report is judged against at its step's landing. The booking and the landing report state whether the first report passed it." What is wrong: the definition no longer says what the standard is. `plan-orchestration`, "The review, earned", is the only text that says it: "a first report that did not pass the bar with at most one fix at landing". "At most one fix at landing" is the term's meaning. Failure scenario: a session booking a step under `land` Steps 9 cannot decide the bar, and a step landed with three fixes at landing is booked as having passed. Keep: "the standard a builder's first report passes when its step lands with at most one fix at landing". Verdict: item 1 violated.
2. Spec. `plan-terms.md:85`, time box: "the reviewer's limit, the configuration block's `review_minutes` or one the invocation names." What is wrong: "when above 0" was dropped; `refute` Rules and `plan`'s `templates/orchestrator-state.md:19` ("0 is none") make 0 no time box. Failure scenario: this plan's `review_minutes: 0` read as a limit of 0 minutes. Keep: "the configuration block's `review_minutes` when above 0, or one the invocation names". Verdict: item 1 violated.
3. Spec. `plan-terms.md:31`, hand-back: "a builder's stop that returns its first run and a case the brief's rules get wrong, with the rule and the result." What is wrong: "before any change" was dropped; `plan-orchestration` Steps 6 and `spec`'s `templates/brief.md:20` make it what sets a hand-back apart from a report. Failure scenario: a final report that includes the first run and such a case is taken as a hand-back, and the orchestrator writes a round-0 cases ruling instead of refuting it. Keep: "a builder's stop before changing any code, returning its first run and a case the brief's rules get wrong, with the rule and the result". Verdict: item 1 violated.
4. Spec. `plan-terms.md:59`, red line, second sense: "A red check is the stop for a failing check that no fix within the plan covers." What is wrong: at round 0 a red check was the failing check; the new text makes it the name of the stop, a change of meaning point 5 did not ask for (change standard, rule 17), which contradicts `skills/plan-orchestration/SKILL.md:277`. Failure scenario: a skill author writes "a red check" for the stop and "a red line" for the failing check in one section. Fix: say that "red check" is the word for a failing check anywhere in the plan, with "Stated in: `plan-orchestration`, "Stops"". Verdict: item 1 violated.
5. Spec. `plan-terms.md:81`, stop, third sense: "to end a running builder or reviewer through the runner's stop tool." What is wrong: point 3 ruled "a running agent"; `plan-orchestration`, "The pace when a deadline is set", stops anything still running, a brief-check agent included. Fix: "to end a running agent through the runner's stop tool". Verdict: point 3 partial.
6. Spec, present since round 0. `plan-terms.md:31` ("a builder's stop") against the stop entry at line 81. What is wrong: the skills use "stop" for a builder halting its work and reporting to the orchestrator (`skills/plan-orchestration/SKILL.md:80`, `spec`'s `templates/brief.md:20`), and none of the entry's senses covers it. Failure scenario: a hand-back booked as an open item for the user. Fix: add the sense, for example "A builder also stops when it halts its work and returns what it has to the orchestrator, as a hand-back does. Stated in: `plan-orchestration`, Steps 6; `spec`, `templates/brief.md`." Verdict: case "each term grepped" partial, item 1 violated.

No fix in the round reaches beyond its finding, no check was removed, and every closure the round section claims reproduces, apart from Findings 1 to 5.

### Declined to judge

- Finding 1 conflicts with the letter of point 1 ("never carries the rule's numbers"), since the bar's meaning is a number; the orchestrator rules.
- The script cases and the first report's ten reverts were not rerun, since no script or test changed in the round.
- The table of terms' rows were not re-read line by line; they rest on the unchanged entry order.
- "kind" reads "the threshold that section states" after naming two sources, "Grouping" and Steps 6, so "that section" is loosely placed.

Reviewer usage over round 1: claude:opus, a fresh agent; 165498 tokens, 42 tool uses, 400 s (from the completion notice). Saved by the orchestrator from the reviewer's final message, its verification block condensed to the lines it printed.

## Closed

- First run, Spec 1 (entries restating rules): closed in repair round 1, point 1; the round's sweep of the other entries cut four too far (round 1, Findings 1 to 4), fixed at landing.
- First run, Spec 2 (base, dispatch block): closed in repair round 1, point 2.
- First run, Spec 3 (stop as ending an agent, refuter, fix round): closed in repair round 1, points 3, 4 and 6; the stop sense widened at landing (round 1, Finding 5).
- First run, Standards 1 ("plan skills" used wider than its entry): closed in repair round 1, point 7.
- First run, Standards 2 (sync items 4 and 7): closed in repair round 1, point 8.
- First run, Declined to judge (semicolons; entry length): closed in repair round 1, point 5: no semicolon outside the "Stated in" lists, at most two sentences per sense.
- First run, Declined to judge (the skill-layout bullet holding two rules): no change; its text is the brief's item 8, which the user approved with the step.
- First run, Declined to judge (the state file's verify list and `standards`): done at landing; the verify list holds `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` after the `sync_rules.test.sh` line, and `standards` ends with `docs/glossary.md`.
- Round 1, Finding 1 (bar): fixed at landing: "the standard a builder's first report passes when its step lands with at most one fix at landing". The number is the term's meaning, so point 1's test does not remove it.
- Round 1, Finding 2 (time box): fixed at landing: "`review_minutes` when above 0, or one the invocation names".
- Round 1, Finding 3 (hand-back): fixed at landing: "a builder's stop before changing any code, returning its first run and a case the brief's rules get wrong, with the rule and the result".
- Round 1, Finding 4 (red line, second sense): fixed at landing: "A red check is a failing check of the plan's verification, wherever it runs."
- Round 1, Finding 5 (stop, a running agent): fixed at landing: "to end a running agent through the runner's stop tool".
- Round 1, Finding 6 (a builder's stop): fixed at landing: the stop entry gains "A builder also stops when it halts its work and returns what it has to the orchestrator, as a hand-back does. Stated in: `plan-orchestration`, Steps 6; `spec`, `templates/brief.md`."
- Round 1, Declined to judge ("kind", "that section"): fixed at landing: "the threshold Steps 6 states".
- Round 1, Declined to judge (the other three points): no change; none names a defect.
- The builder's Doc text: applied at landing, `docs/dev/change-standard.md:59` reads "...; the glossary check and the ASCII check take no filter:".
- After the fixes, `sync_rules.py . --only glossary --write` rewrote Ordo's block and the recheck printed `ok: the plan-terms block equals the template`; `checks.sh` printed `checks: 8 commands passed`.
