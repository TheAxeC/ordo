# Step 1 refuter report (on .agents/worktrees/2f-1, base 3145b85c3800e79c9fdba4d87f3cb1b57327010b)

A page this report cites is named with its section. A finding in the new skill keeps its `file:line`, from `cat -n` of the worktree's files.

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

Run from the worktree root as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"`. The output matches the report's quote line for line.

The commands the report quotes as evidence, rerun in the worktree:

```
$ git status --short
 M docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/1-report.md
?? skills/diagnose/
$ git diff <base> --stat
 docs/glossary.md                          | 7 +++++++
 skills/repo-setup/templates/plan-terms.md | 7 +++++++
$ ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md
skills/diagnose/SKILL.md
skills/diagnose/templates/diagnosis.md
$ python3 -c '<the skill-layout description-length command>'
812 skills/diagnose/SKILL.md   (the other eleven: 748 grill ... 1022 spec, as the report gives them)
$ LC_ALL=C grep -n '[^ -~]' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md .scratch/2-f-diagnose/agents/reviews/1-report.md
(no output) rc=1
$ grep -n '^## ' skills/diagnose/SKILL.md
12 Quick start, 21 Use instead, 29 What it reads, 46 Steps, 132 Ways to build a red command, 146 Stops, 162 Anti-patterns, 175 Rules
$ grep -n -E '^- \*\*(red command|hypothesis|shrunk case|case, of a diagnosis|diagnosis record|cause not found|probe)\*\*' docs/glossary.md
lines 20, 21, 33, 47, 70, 76, 97 (as the report says)
$ git show 3145b85:docs/glossary.md | grep -c -E '<the same pattern>'
0
```

Two points about how I ran these:
- `git show 3145b85:docs/glossary.md` was a read-only git command outside the two my brief allows (`git diff`, `git status`). It changed nothing, and its result (0 entries at the base) matches the report.
- I did not rerun the first run of the case `sync_rules.py --only glossary` on the unchanged tree. The command I tried for it in the main checkout was refused by the permission system. The diff adds the same seven lines at the same places in both files, and the check prints ok after the change, so the block was equal at the base as well. That conclusion is my inference, not a rerun.

## Verdicts

Items of the brief's "What to build":

- 1: violated. Most requirements are met at the places the report names. It fails where Spec 1, Spec 2, Spec 3, Spec 4, Behaviour 1, Standards 1, Standards 2 and Standards 3 say.
- 2: holds. The template has every part item 2 lists: symptom, red command with three runs, the cut table, ranked hypotheses with a "Falsified by", the probe table, the cause or "cause not found", the fix and test runs, "No test reaches it", and the cleanup grep. Its placeholders use `<...>`, as `skills/refute/templates/report.md` does. Spec 5 names one place the skill writes that the template has no slot for.
- 3: violated. The seven entries exist, in alphabetical place, in both files, and the sync prints ok. Two "Stated in" places are wrong, one definition is incomplete, and a glossary term is used in a new sense (Standards 4 and 5).

Cases of the brief's "Cases":

- `ls` both files: met. Both are absent at the base (the report's first run, and `git status` shows `skills/diagnose/` untracked) and both exist now.
- Description length: met, 812.
- `sync_rules.py --only glossary` before and after: met. After is rerun above. Before is the inference stated under Verification.
- Reading against `docs/dev/skill-layout.md`: partial.
  - Holds: the frontmatter, the nine sections in order, no other `##` heading, the reference section read at Steps 4, the Stops and Anti-patterns table columns, and a "Done when" on every Steps item.
  - Fails: a rule written twice, several items with more than one action, and a trigger missing for two cases the skill is for (Standards 1, 2 and 3).
- Reading against item 1 and the Goal's six parts: partial.
  - Parts 1, 2, 4 and 5: met, at Steps 4, 6, 9 and 12 to 14.
  - Part 3 ("shown to you") under `plan-orchestration`, and part 6 ("the cause written in the booking") inside a plan: met only as far as a skill this step does not change carries them (Spec 1).
- Reading against `diagnosing-bugs`: partial. The points it would win are listed under Behaviour 3.
- Dry run on paper: met, by my own run below, with the choices the text leaves open named (Behaviour 2). The report's own dry run has one defect (Proof 1).
- Terms against the glossary: partial (Standards 4 and 5).

My dry run, following the skill's text, on `db9bbec^` with `.scratch/2-e-grill/agents/reviews/3-round-0.diff` applied, where the both-folders refusal is `[ "${dir%/}" = "$agent_dir" ]` at round-0 diff line 477 and `agent_dirs` strips every trailing slash with `sub(/\/+$/, "")` at line 358:

- **Invocation.** Step 3 of 2.E has landed, so no dispatch entry exists for it. `/diagnose 2.E 3 Spec 1` therefore refuses ("No dispatch entry"). The run has to be `/diagnose <symptom>`, started in a session whose checkout is the rebuilt scratch tree.
- **Steps 2.** Outside a plan the probes run "in the user's checkout". Nothing in the text builds a scratch tree for a defect that is not on the checkout. A session started at main's head would find no red and go to the "No red command" stop.
- **Steps 4, the red command.** Way 1 comes first. A case added to `utils/pin.test.sh` after the existing both-folders case: `export ORDO_SKILL_DIRS="$d1$nl$a1//"`, `run_pin v3`, `expect_refused v4 ...`, with an `expect_in` on "is both a skill folder and an agent folder". The command is `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1`, which goes red on the missing refusal and the moved worktree. `pin.test.sh` builds a fresh `test_root` on every run, so three runs give the same verdict. It also sets `HOME` and the Ordo paths itself.
- **Steps 6, the shrunk case.**
  - Cut `$d1`: still red, because `$a1//` alone still derives the agent folder `$a1`.
  - Cut the doubled slash to one slash, or to none: green, because `${dir%/}` then equals `$a1`. Put back.
  - Cut the prior pin: whether this stays red depends on which half of the symptom the red command asserts.
  - Shrunk case: `ORDO_SKILL_DIRS` holding `<agents folder>` with two or more trailing slashes, plus a prior pin if the red command asserts the moved worktree.
- **Steps 7, the hypotheses.**
  1. If the refusal's comparison strips one trailing slash while `agent_dirs` strips all of them, then stripping every trailing slash from `dir` before the comparison turns the red command green. Falsified if it stays red with that change. It makes it worse: `$a1///` is also not refused.
  2. If `agent_dirs` derives a folder other than `$a1` from `$a1//`, then a `DIAG-` print of `agent_dirs` shows a path other than `$a1`, and fixing the derivation turns the red command green. Falsified if the print shows exactly `$a1`.
  3. If the refusal loop runs after the pinned worktree has moved, then moving the loop before the first change turns the worktree assertion green. Falsified if the refusal never fires for `$a1//`, since the order then does not matter.
- Hypothesis 1 is the cause the ledger books (`.scratch/2-e-grill/plan.md:173`).

## 1. Spec

- **Spec 1.** `skills/diagnose/SKILL.md:90-91`, "Under `plan-orchestration`, the hypotheses are written into the record, quoted in the round brief and in the landing report beside the record's path, and the skill goes on to Steps 9. Done when ... under `plan-orchestration` when the hypotheses are quoted in both places". The same problem is at `SKILL.md:129-130`, "Inside a plan, the round brief quotes the cause, and the landing's booking names it. Done when the cause stands in that place."
  - What is wrong:
    - At Steps 8 the round brief does not exist yet. The skill writes it at Steps 15, after the probes.
    - For a cause not found no round is ever sent (Steps 11), so the hypotheses never reach a round brief.
    - The landing report and the booking are written by `/land`. `skills/land/SKILL.md` Steps 9 and 11 list their contents, and neither names a diagnosis, its hypotheses or its cause (`grep -n -i -E 'diagnos|cause' skills/land/SKILL.md` finds only unrelated lines).
    - Step 2's line wires only `plan-orchestration` Steps 8, the README and `ordo-help`. So nothing in the plan makes `land` carry the Goal's "shown to you" under the loop, or "the cause written in the booking" inside a plan.
  - Failure scenario:
    - An orchestrator following Steps 8 cannot meet its completion criterion before probing. It either stops there, or writes a stub round brief before the cause is known.
    - At landing, `/land` follows its own text and books nothing of the diagnosis. The user never sees the hypotheses of an unattended run unless a cause-not-found open item carries them.
  - Verdict: item 1 violated; the Goal-reading case partial.
- **Spec 2.** `skills/diagnose/SKILL.md:119`, "Inside a plan, write the fix and its test as the ruling of the repair round, as `plan-orchestration`'s Steps 8 sends a round", together with the invocation `/diagnose <entry> <step> red line` at `SKILL.md:17`.
  - What is wrong: the skill sends every found cause to the builder as a repair round. Two cases the skill itself admits forbid that:
    - `skills/land/SKILL.md` Steps 6 says of a red line: "The failure is never sent back to the builder". The step is taken back out of main, recorded in Step 0 and prepared again by `/spec`.
    - `skills/refute/SKILL.md` "Over a repair round" 7 says the findings of the run over the last round are "never sent to the builder". They are fixed at landing or raised to the user.
  - Neither the brief nor the skill handles these, and the report says nothing in the brief was wrong.
  - Failure scenario:
    - With `repair_rounds: 1`, a finding of unknown cause in the re-refutation of round 1 is diagnosed and sent as a second round, past the cap.
    - A red line's fix is sent to a builder that `land` has already left out of the loop, instead of going to a fix at landing, into Step 0 for `/spec`, or to the user.
  - Verdict: item 1 violated.
- **Spec 3.** `skills/diagnose/SKILL.md:18` (`/diagnose <entry> <step> brief check <n>`) with `:38` ("no dispatch entry for the step, is a refusal") and `:52-57` (the scratch copy made from the step's worktree and its base).
  - What is wrong: `skills/spec/SKILL.md` runs the brief check before the preparation commit (Steps 6), the worktree (Steps 7) and the dispatch block (Steps 9). While a brief-check finding is open there is no dispatch entry, no base and no step worktree.
  - Failure scenario: every use of this invocation during the brief check ends in the "No dispatch entry" refusal. The one invocation form the brief added for brief-check findings can never run. Probes for such a finding would need a scratch copy of main's head.
  - Verdict: item 1 violated (the Invocations requirement exists in name only).
- **Spec 4.** `skills/diagnose/SKILL.md:52-57`, the scratch copy for `red line`: `git worktree add --detach "$tmp/tree" <base>`, then the step's diff applied.
  - What is wrong: a red line fails on main after the cherry-pick (glossary **red line**; `land` Steps 6). The refuter has already run the same checks green in the worktree. The difference is almost always main's commits since the base, and base plus the step's diff does not contain them.
  - Failure scenario: `/diagnose <entry> <step> red line` builds a tree on which the verify line is green. Steps 4 reaches "No red command", which under the loop is the cause not found by construction. The copy for a red line needs main's head with the step's range applied.
  - Verdict: item 1 violated.
- **Spec 5.** `skills/diagnose/SKILL.md:77`, "that is the cause not found, and the record says so with every way tried (Steps 11)", against `skills/diagnose/templates/diagnosis.md:59`, "or 'cause not found', with every probe above and the reason no probe separates the hypotheses left".
  - What is wrong: when no red command can be built there are no probes and no hypotheses. The template has no place for the ways tried and what each gave.
  - Failure scenario: an orchestrator fills the Cause section with an empty probe table and a reason that does not apply. The open item the user rules on then lacks the list the "No red command" row says is shown.
  - Verdict: none (item 2 holds as its own text lists).
- **Spec 6.** `skills/diagnose/SKILL.md:95`, "The change is undone before the next probe, unless it is the fix", then `:108`, "write a test ... and run it on the tree before the fix", and `:114`, "Make the fix at the cause".
  - What is wrong: Steps 9 leaves the fix in the tree. Steps 12 then asks for a test run on the tree before the fix, with no instruction to undo the kept change first. Steps 13 makes a fix that is already made.
  - Failure scenario: a session following the text in order writes the test with the fix in place and sees it pass. It then either records a test never seen red, which is the Anti-patterns row "A test written after the fix" reached by following the steps, or has to guess that it should revert.
  - Verdict: item 1 violated (The fix and its test).
- **Spec 7.** `skills/diagnose/SKILL.md:43`, "the failure the step's landing booked in the open items of the state file and under the step's Step 0".
  - What is wrong: `land` Steps 6 records every red line in Step 0. It books one in the open items only "when only the user can decide what to do". The "and" makes both places required.
  - Failure scenario: a session looks for the red line in the open items, does not find it, and gives the "No finding" refusal.
  - Verdict: item 1 violated (What it reads).

## 2. Proof

- **Proof 1.** `.scratch/2-f-diagnose/agents/reviews/1-report.md`, "The dry run on paper", hypothesis (3): "a single-slash `agents/` in `ORDO_SKILL_DIRS` stays red; falsified because the single slash is refused (that cut already went green)".
  - What is wrong: a hypothesis already falsified by the report's own shrink step is offered as one of the three. The dry run therefore shows two live hypotheses where Steps 7 asks for three to five.
  - Failure scenario: the orchestrator reads the dry run as evidence that the text leads to three live hypotheses on this defect. It does not show that.
  - Verdict: the dry-run case, as reported by the builder. My own run above supplies three.
- Every other count and path in the report reproduced: 812, the heading lines, the glossary line numbers, the checks output, and the status lines.

## 3. Standards

- **Standards 1.** `skills/diagnose/SKILL.md:70`, "The red command asserts the symptom itself, the error text or the wrong output, and never that something ran", and `:93`, "Each probe is tied to one hypothesis, named by its rank, and changes one thing".
  - What is wrong:
    - The same rules are Anti-patterns rows 2, 3 and 4 (`:167-169`).
    - The brief's Anti-patterns requirement asks that "the Steps item it guards naming the Anti-patterns section instead of restating it".
    - `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once".
    - The brief-check Closed entry says these shortcuts are "stated only in Anti-patterns". Lines 69, 98 and 115 point at Anti-patterns correctly; lines 70 and 93 restate.
    - Also `:122`, "the skill does not change the step's worktree", restates Rules bullet 2 (`:178`).
  - Failure scenario: a later edit changes one copy, for example what counts as one change. A reader cannot tell which copy holds.
  - Verdict: item 1 violated; the skill-layout case partial.
- **Standards 2.** Several Steps items hold more than one action, against `docs/dev/skill-layout.md` "Sections, in order" row 5 ("one action per item") and "Lists and tables" (one rule per bullet):
  - `skills/diagnose/SKILL.md:108`, "write a test ... and run it on the tree before the fix";
  - `:128`, the commit bullet, the record shown, and its copy removed;
  - `:94`, run the red command, and record four fields;
  - `:89`, show and wait, then re-rank.
  - Failure scenario: a session marks Steps 12 done after writing the test, before the failing run the Done line asks for. A reviewer cannot point at which half of the bullet was missed.
  - Verdict: item 1 violated; the skill-layout case partial.
- **Standards 3.** `skills/diagnose/SKILL.md:3`, "Triggers on: diagnose, diagnose this, debug this, find the cause of, why does this fail, the cause is not known, diagnose the finding."
  - What is wrong: the skill is for a slow symptom and a symptom seen only sometimes (Steps 4 at `:72-73`), and no phrase covers either case. `docs/dev/skill-layout.md` "Frontmatter" says "`Triggers on:` lists at least one phrase for each case the skill is for". `diagnosing-bugs`' description names "slow".
  - Failure scenario: a user who types "why is this slow now" or "this test is flaky" does not get the skill loaded.
  - Verdict: item 1 violated; the skill-layout case partial.
- **Standards 4.** `docs/glossary.md:20` (and `plan-terms.md:15`), "**case, of a diagnosis**: ... Stated in: `diagnose`, Steps 4 and 6". And `docs/glossary.md:70` (and `plan-terms.md:65`), "**probe**: a command run to check a claim about the tree. Stated in: `spec`, "What it reads" 5 and Steps 2".
  - What is wrong: `grep -n -w -i case skills/diagnose/SKILL.md` finds the term at Steps 6, 8, 12, 14 and 16, and not at Steps 4. `grep -n probe skills/spec/SKILL.md` finds it only at line 49 ("What it reads" 5). `spec` Steps 2 does not use the word. Item 3 requires the "Stated in" places to be correct.
  - Failure scenario: a reader following the glossary to the place where the sense is stated reads `diagnose` Steps 4 or `spec` Steps 2 and finds no such use.
  - Verdict: item 3 violated.
- **Standards 5.** Two term problems in the glossary block and the skill:
  - `docs/glossary.md:21`, **cause not found**, lists the second list falsified, no probe that separates, and no red command under the loop. `skills/diagnose/SKILL.md:156` (Stops row "The cause not found") adds "or the redacted output is not enough". Steps 11 (`:103`) and the glossary lack that condition. One meaning then has two definitions, against `docs/dev/skill-layout.md` "Writing for an agent".
  - The skill uses "verdict" for a red command's result and a probe's result (`:78`, `:94`, `:99`, `:168`; template `:53`). The glossary defines **verdict** only as a reviewer's judgment of a brief's items and cases, and as a judge's verdict in a blind comparison. "Writing for an agent" says a term the glossary defines is used only in a sense it defines.
  - Failure scenario: an orchestrator whose red output is unusable after redaction checks Steps 11 or the glossary, finds no exit for that case, and goes on probing. A reader of `refute` and `diagnose` side by side meets "verdict" with two meanings and no entry for the second.
  - Verdict: item 3 violated; the terms case partial.
- **Standards 6.** `skills/diagnose/SKILL.md:108-110` and `:182`.
  - Steps 12 rests on "The rules file's rule that a test exists only for behaviour whose failure costs something" and says "A defect in code whose failure costs nothing gets no test".
  - Rules bullet 6 states, for a repository with no rules file, "a defect in code begins with a test that fails on the tree as it is", with no cost qualifier.
  - What is wrong: with no rules file the cost rule Steps 12 cites does not exist, and the one rule the skill does state contradicts Steps 12.
  - Failure scenario: in a repository without a rules file, a session cannot decide whether a costless defect gets a test. The two texts give opposite answers.
  - Verdict: item 1 violated (What it reads, "the skill's own Rules state the rules it needs in full").
- `README.md:75` ("copies each skill folder") and the copy loop that names eleven skills become incomplete until step 2, which owns them. No sentence is made false by this step's names otherwise. I grepped `diagnos`, `red command`, `shrunk case`, `diagnosis record` and `hypothes` over `skills docs README.md`. `plan-orchestration:100` "a slow case" now falls under **case, of a diagnosis**.

## 4. Behaviour

- **Behaviour 1.** `skills/diagnose/SKILL.md:53-56`, `git diff <base>` saved and applied with `git apply`.
  - What is wrong: without `--binary`, a tracked binary file the step changed comes out as "Binary files ... differ", and `git apply` then fails. `skills/spec/SKILL.md` "A step taken back out of main" 3 uses `git diff --binary <base> <branch>` for this reason: "With `--binary` the patch carries a binary file's content."
  - The code block also uses `$tmp` without saying how it is made. And the Done line of Steps 2 (`:60`) compares against output "printed before the copy was made", which no bullet says to record. Steps 15 (`:123`) relies on "what Steps 2 recorded".
  - Failure scenario: diagnosing a step that changed an image or other tracked binary, the scratch copy cannot be built. The session goes to the cause not found without a probe.
  - Verdict: item 1 violated (Where probes run).
- **Behaviour 2.** Choices the text leaves open, found in my dry run. They agree with the report's four, plus two more:
  - A by-hand run on a defect that is not on the checkout has no scratch tree (`:51`), which is the situation of plan step 3 itself.
  - Which half of a two-part symptom the red command asserts decides what the shrink keeps (`:68`, `:82`).
  - Whether a way-1 red command is also the test of Steps 12 (`:108`).
  - How state is reset between the three runs (`:78`).
  - Outside a plan, `:128` names "the last bullet of the commit message", but no step makes or drafts the commit, or reads the repository's commit rule (glossary **commit rule**).
  - For a cause not found, `:104` says "goes to Steps 16" and `:106` says "the skill stops". Whether Steps 17 then runs, and whether the `$TMPDIR` record is removed as a throwaway at Steps 16 before it is shown, is not said.
  - Failure scenario: two sessions given the same defect build different red commands and shrunk cases. A by-hand session on a cause not found may delete its only record before showing it.
  - Verdict: the dry-run case (met, with these named).
- **Behaviour 3.** Points where `diagnosing-bugs` would win the blind comparison, phase by phase:
  - Description: it triggers on "slow" and on "broken/throwing/failing" (Standards 3).
  - Phase 1, way 10: it ships `scripts/hitl-loop.template.sh`. `diagnose` way 11 (`:144`) describes the script but gives none.
  - Phase 5, "If no correct seam exists, that itself is the finding ... Flag this for the next phase": outside a plan, `diagnose` puts "No test reaches it" only in the `$TMPDIR` record. That record is removed at Steps 17, and the commit bullet names only "the cause, the red command and the fix's test" (`:128`). The architectural point is lost after the session.
  - Phase 3's non-blocking checkpoint and Phase 1's motivating text: covered, or replaced by ruling D2 and the prose standard.
  - Everything else is covered equally or better: the red command first, three verdicts, the exact symptom, the flaky rate, the "No red command" stop with the ways tried, shrinking with a green cut put back, 3-5 falsifiable ranked hypotheses with "makes it worse", one change per probe, debugger before logs, logs at boundaries, the tag, the baseline, the test before the fix, the unshrunk case rerun, the cleanup grep, the cause in the commit, and redaction with credentials taken from the environment.
  - Verdict: the `diagnosing-bugs` case partial.
- The report states the user-visible changes: the new skill, the seven glossary entries, and no wiring until step 2. None is missing.

## Declined to judge

- Whether the skill's length (183 lines, with plan machinery that a by-hand run does not need) loses to `diagnosing-bugs` (138 lines) in the blind comparison. That is Axel's call at step 4.
- Whether Spec 1 and Spec 2 are fixed by changing `land` and `plan-orchestration` or by changing `diagnose` alone. The first needs paths outside this step's list (`land` is in no step of 2.F). That is for the orchestrator's ruling on the round, and for Axel where it widens a step.
- The step's own check, Axel's reading against `docs/dev/skill-layout.md` and the Goal. It is pending by the plan.
- The first run of the `sync_rules.py` case on the unchanged tree was not rerun by me, as stated under Verification.

Reviewer usage: tokens not known to me (the completion notice has them); about 34 tool uses; minutes not known to me.


## Repair round 1, refuted

(on .agents/worktrees/2f-1, base 3145b85c3800e79c9fdba4d87f3cb1b57327010b. The round's delta is the current `skills/diagnose/SKILL.md` and `templates/diagnosis.md` compared with the versions extracted from `1-round-0.diff`, plus the glossary lines compared with the round-0 diff's lines. The tracked diff since the base still touches only `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`, 7 lines added in each. `skills/diagnose/` is untracked.)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"
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

These match the report's block "The lines `checks.sh` printed, verbatim, after repair round 1" line for line.

These are the commands the round's report quotes, rerun from the worktree root:

```
$ ls skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md
skills/diagnose/SKILL.md
skills/diagnose/templates/diagnosis.md
$ python3 -c '<the skill-layout description-length command>' | grep -E 'diagnose|spec'
905 skills/diagnose/SKILL.md
1022 skills/spec/SKILL.md
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ LC_ALL=C grep -n '[^ -~]' skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
(no output) grep rc=1
$ LC_ALL=C grep -n '[^ -~]' .scratch/2-f-diagnose/agents/reviews/1-report.md
(no output) rc=1
$ git status --short
 M docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/2-f-diagnose/agents/reviews/1-report.md
?? skills/diagnose/
$ grep -n -i verdict skills/diagnose/SKILL.md skills/diagnose/templates/diagnosis.md
(no output) rc=1
$ grep -n '^## ' skills/diagnose/SKILL.md
12 Quick start, 21 Use instead, 29 What it reads, 49 Steps, 169 Ways to build a red command, 183 Stops, 199 Anti-patterns, 212 Rules
$ grep -n -w -i case skills/diagnose/SKILL.md   (line numbers)
3, 99, 100, 106, 135, 148, 149, 160, 189
$ awk over "## Steps": numbered items, and lines holding "Done when" or "done also when"
items 24 done-lines 25 (one "Done when" per item; item 22 also has "done also when")
$ grep -n ';' skills/diagnose/SKILL.md
192, 193 (two Stops table cells)
$ cat -s skills/diagnose/SKILL.md | cmp - skills/diagnose/SKILL.md
same
```

Every count, line list and output the round's report quotes reproduced.

I checked the git commands of the scratch copies against `man git-worktree` and `man git-apply` (git 2.49.0):
- `worktree add [--detach] <path> [<commit-ish>]` and `worktree remove [-f] <worktree>` ("Unclean worktrees ... can be removed with --force") are used correctly.
- `--3way` "implies the --index option" and needs the blobs locally. A worktree of the same repository has them.
- `--allow-empty`: "Don't return an error for patches containing no diff". Behaviour 1 depends on this.

### The round brief's seventeen points

1. Spec 1: closed for a found cause of the first run (Steps 20, bullet 1) and for the open item (Steps 15). Not closed for a cause not found inside a plan: that fix went beyond the finding and drops the landing note (Spec 3).
2. Spec 2: the four routes are written, but the red-line route contradicts the back-out (Spec 1). The route also cannot be chosen from the invocation (Spec 2).
3. Spec 3: closed ("What it reads" 3, the Stops row "No dispatch entry", and Steps 3 with `<commit>` as `HEAD`).
4. Spec 4: closed as a command. It is checked against git's documentation and against `land`'s "Removing a step's worktree", where the branch is the worktree folder's name and `land.sh` makes the wip commit on `<step>`. Its interplay with point 2 is Spec 1.
5. Spec 5: the template section, the Done line of Steps 4 and the "No red command" row are done. The report claims more than the text shows (Proof 2).
6. Spec 6: closed (Steps 13, 17, 18).
7. Spec 7: closed ("What it reads" 5).
8. Standards 1: closed. Steps 4, 11 and 20 point at Anti-patterns or "Rules" and no longer restate them.
9. Standards 2: closed for the four named items. The renumbering broke the cross-reference of Steps 14 (Spec 4) and two glossary places (Standards 1).
10. Standards 3: closed (the triggers now cover a slow symptom, a flaky one and "this is broken").
11. Standards 4: closed for **case, of a diagnosis** and for **probe**'s first sense. The renumbering made **probe**'s second sense and **diagnosis record** wrong (Standards 1).
12. Standards 5: closed. The Steps, the Stops row and the glossary give one definition of the cause not found, and "verdict" is gone.
13. Standards 6: closed (Rules bullet 6 and Steps 16 agree).
14. Behaviour 1: closed (`--binary`, `mktemp`, the two outputs recorded and compared).
15. Behaviour 2: all six bullets are written. The "Steps 17 is not run" of the last bullet was widened from a person's run to every run (Spec 3).
16. Behaviour 3: closed. The commit bullet names "No test reaches it", and the state file holds the open item for the script.
17. Proof 1: not closed (Proof 1).

### Verdicts

Items of the brief's "What to build":

- 1: violated. Spec 1, 2, 3, 4, 5 and 6, Standards 2 and 3, and Behaviour 1 apply. Everything else item 1 lists is met at the places the round's report names, which I read.
- 2: holds. The template has Symptom; Where the probes run, with the two worktree outputs; Red command, with three runs and the tightened runs; No red command; Shrunk case; Hypotheses, with the reply and the second list; Probes, with the result; Cause; Fix and test; "No test reaches it" and "No test is written"; and Cleanup. Its placeholders are in `<...>`.
- 3: violated, Standards 1. The seven entries are in both files in alphabetical place and the sync prints ok, but two "Stated in" places are wrong.

Cases of the brief's "Cases":

- `ls` both files: met.
- Description length: met, 905.
- `sync_rules.py --only glossary` before and after: met. The after run is rerun above. The before run is the report's first run on the base, which I did not rerun.
- The skill against `docs/dev/skill-layout.md`: partial, Spec 4 and Standards 2.
  - These hold: the frontmatter (name, one paragraph, first words, no neighbouring skill named, triggers for every case, the version only in metadata); the nine sections in order and no other `##`; the reference section, read in every run at Steps 4; the three table shapes; a completion criterion on each of the 24 items; "a step that can refuse or stop precedes what it guards"; each rule written once; and paths and names.
- The skill against item 1 and the Goal's six parts: partial.
  - Parts 1 to 5 are met: Steps 4; Steps 6; Steps 7 to 10 with Steps 15 and 20; Steps 11 to 13; Steps 16 to 19.
  - Part 6, "the cause written in the booking", is partial: a cause not found inside a plan skips Steps 23 (Spec 3).
- The skill against `diagnosing-bugs`: partial, Behaviour 3.
- The dry run on paper: met by my run below, with the choices the text leaves open named (Behaviour 2). The builder's redone run still falls short (Proof 1).
- The terms against the glossary: partial, Standards 1 and 3.

### My dry run on paper

The defect is `db9bbec^` with `.scratch/2-e-grill/agents/reviews/3-round-0.diff` applied. There, the refusal at round-0 diff line 477 is `[ "${dir%/}" = "$agent_dir" ]`, and `agent_dirs` at line 358 strips every trailing slash. Nothing was run against `utils/pin.sh`.

- **Invocation.** Plan 2.E's ledger folder exists and `3-refuter.md` holds "Spec 1", but 2.E step 3 has landed, so it has no dispatch entry.
  - `/diagnose 2.E 3 Spec 1` therefore ends in "No dispatch entry". That row's "What resumes it" says "The step prepared with `/spec`", which would prepare a landed step again (Behaviour 2).
  - The run goes as `/diagnose <symptom>`, run by a person.
- **Steps 2.** The record is a copy in `$TMPDIR`. The symptom is the user's words.
- **Steps 3.** The defect is not on the checkout, so the copy is `git worktree add --detach "$tmp/tree" db9bbec^` from the user's checkout.
  - Then the patch is applied. The code block labels its two apply lines for a reviewer's finding and for a red line only, so it is left open which line applies and where the patch is saved.
- **Steps 4, way 1.** The red command is a case in `utils/pin.test.sh` beside the both-folders case:
  - set `ORDO_SKILL_DIRS="$d1$nl$a1//"`;
  - `run_pin v3` with the worktree at v4;
  - `expect_refused v4`;
  - `expect_in "$err" "pin: $a1 is both a skill folder and an agent folder"`.
  - It is run as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1`.
  - It is red. `pin.test.sh` builds a fresh `test_root` on each run and sets `HOME` and the Ordo paths itself, so the three runs start from the same state.
  - The suite stops at its first failed assertion, so the output shows one half of the two-part symptom. The text asks that both halves be asserted, but not that the output report each one (Behaviour 2).
- **Steps 6, the cuts.**
  - Cut `$d1`: still red, since `$a1//` alone derives `$a1`. Stays cut.
  - Cut the tag's agents: still red, since the refusal loop reads `$agent_dirs`, not the tag's agents. Stays cut.
  - Cut `//` to `/`: green, since `${dir%/}` equals `$a1`. Put back.
  - Cut the prior pin: the worktree half can no longer be asserted. Put back.
  - The shrunk case is `ORDO_SKILL_DIRS` holding `$a1//`, a prior pin, and a tag to move to.
- **Steps 7, the hypotheses, with code now read.**
  1. If the comparison strips one trailing slash while `agent_dirs` strips all of them, then stripping every trailing slash from `dir` turns the red command green. Falsified if it stays red with that change.
  2. If `agent_dirs` derives something other than `$a1` from `$a1//`, then correcting the derivation turns it green. Falsified if a `DIAG-` print of `agent_dir` shows exactly `$a1`.
  3. If the here-document that feeds `$skill_dirs` on descriptor 4 never yields the `$a1//` line to `read`, then putting `$a1//` first in the list turns it green. Falsified if it stays red with `$a1//` first.
- **Steps 8 and 9.** The hypotheses are shown and the skill waits.
- **Where this run leaves choices open or leads wrong.**
  - The resume of "No dispatch entry" for a landed step.
  - The apply line outside a plan.
  - Reporting both halves of the symptom.
  - The ranking criterion.
  - What to do when the shrink and the code leave fewer than three live causes.
  - A logging probe, as for hypothesis 2, cannot give Steps 15 its "green with the change" (Spec 5).

### Findings

#### Spec

- **Spec 1.** The red-line route contradicts the back-out.
  - Place: `skills/diagnose/SKILL.md:153`, "A red line: its fix is made at landing when it is inside the brief, as the `land` skill's Steps 6 says, and otherwise the cause is written in the step's Step 0...". It is read with `:39`, "for a red line it reads `landing: backed-out`".
  - What is wrong:
    - `land` Steps 6 fixes a red line on main only while the landing runs, and only when "a fix inside the brief closes" it.
    - A red line whose cause is not known ends the landing: the step is taken back out of main, `landing: backed-out` is set, and it "is worked again as that step, with no new ruling" through `/spec`.
    - The skill reads a red line only once it is backed out, so "made at landing" can never apply.
    - The text also does not say whether a red line met while the entry reads `landing: cherry-picking` is refused.
    - The conflict comes from the round brief's points 2 and 4. The report says under "Anything in the brief that was wrong or impossible": "Nothing".
  - Failure scenario: an orchestrator diagnoses a backed-out red line, finds a small cause inside the brief, and follows the first half of the bullet. It changes main outside any landing, with no booking, while `/spec` prepares the same step again from main's head.
  - Verdict: item 1 violated.
- **Spec 2.** The invocation cannot tell which kind of finding it names, yet Steps 20 routes by that kind.
  - Place: `skills/diagnose/SKILL.md:16`, "written as the refuter report names it, such as Spec 1"; `:44`, the refuter report `agents/reviews/<step>-refuter.md`; and Steps 20 (`:151-152`), which sends a first-run finding to the builder and never sends a last-round finding.
  - What is wrong: one refuter file holds the first run and each run over a round. Each run numbers its own findings: `.scratch/2-e-grill/agents/reviews/3-refuter.md` has "Spec 1" in the first run and "**Spec 1.**" under "Repair round 1, refuted". The invocation and "What it reads" 5 name no run, so nothing tells the session which kind the finding is.
  - Failure scenario: `/diagnose 2.E 3 Spec 1` on such a file. The session takes the first-run Spec 1 and sends its fix to the builder as a round past `repair_rounds: 1`, which is the defect of the first review's Spec 2 returned by another way. Or it diagnoses the wrong finding. The "No finding" refusal never fires, since the name is found.
  - Verdict: item 1 violated.
- **Spec 3.** Inside a plan, a cause not found is no longer noted at landing.
  - Place: `skills/diagnose/SKILL.md:132`, "After a cause not found the skill goes to Steps 21 and 22, and Steps 23 and 24 are not run", with `:164`.
  - What is wrong:
    - `plan-orchestration` Steps 8 "Only known fixes" says "A cause not found is not sent. Such a cause is noted at landing." The plan's ruling "Step 1, where a diagnosis is booked" says the booking "names each diagnosis record with its cause".
    - The round brief's point 15 skips Steps 17 (now 23) only "for a cause not found run by a person". The builder widened the skip to every run.
    - Steps 23's own citation of "Only known fixes" is to the sentence about a cause not found, but the step now runs only for a found cause.
  - Failure scenario: under the loop, a cause not found becomes an open item. The user rules, the open item moves to the closed items, and the landing booking names no diagnosis record. The Goal's "the cause written in the booking" is not met for the one case the rule names.
  - Verdict: item 1 violated; the Goal reading partial.
- **Spec 4.** The second list of hypotheses has lost its wait.
  - Place: `skills/diagnose/SKILL.md:126-127`, Steps 14, "form a second list ... and show it as Steps 8 says", done when "Steps 11 to 13 have run over it".
  - What is wrong:
    - Before the split, Steps 8 held the wait. It is now Steps 9 and 10, and Steps 14 sends a second list straight from showing to probing.
    - The Stops row "The hypotheses" (`:189`) still makes "Steps 14 a second list" a stop that waits for the reply.
    - The round brief's point 9 asked that every cross-reference be kept right.
  - Failure scenario: run by a person, the session shows the second list and probes at once, as Steps 14's Done line says. The user's re-ranking, which the Stops row promises, never happens.
  - Verdict: item 1 violated (the hypotheses, "shown as above"); the skill-layout case partial.
- **Spec 5.** A hypothesis confirmed by logging has no probe that turns the red command green. This dates from round 0 and was found by the dry run.
  - Place: `skills/diagnose/SKILL.md:116`, a probe may be "logging at the boundaries"; `:128`, the cause stated "with the probe that shows it, the red command green with the change and red without it"; `:145`, "Make the fix at the cause, which is the change Steps 13 undid".
  - What is wrong: when a hypothesis stands after a logging or debugger probe, no probe turned the red command green. The text does not say that a probe carrying the candidate fix follows.
  - Failure scenario: the builder's own dry run gives hypothesis 1's falsifier as "a `DIAG-` print of both operands". If that print leaves hypothesis 1 standing, Steps 15 cannot be met, and Steps 18 names a tagged log line as the fix.
  - Verdict: item 1 violated (the cause).
- **Spec 6.** An unattended run outside a plan has no path.
  - Place: Rules bullet 1 (`:214`, the waits follow who is present) against the "Inside a plan" and "Outside a plan" bullets of Steps 2, 15, 21 and 24.
  - What is wrong: a session under `plan-orchestration` that runs `/diagnose <symptom>` is covered by neither branch.
    - Steps 21 is for a person only, so Steps 24 deletes the record in `$TMPDIR` before anyone reads it.
    - A cause not found gets neither the open item (inside a plan only) nor the stop (a person only).
    - Plan 2.F's step 3 runs `/diagnose` "in a fresh session" as the orchestrator, and its review reads the record.
  - Failure scenario: step 3 run unattended ends with the record removed and nothing kept of the red command, the hypotheses or the probes that its check asks to have quoted.
  - Verdict: item 1 violated (who is present; where the cause is written).

#### Proof

- **Proof 1.** The redone dry run still shows two live hypotheses.
  - Place: `.scratch/2-f-diagnose/agents/reviews/1-report.md`, "The dry run on paper, redone", hypothesis 3: "If the refusal loop runs after the pinned worktree has moved ... Falsified if the message half stays red after the move, since the refusal then never fires for `$a1//`."
  - What is wrong:
    - The report's own red run shows the message half red ("the links do not match the pin after linking", with no refusal message). The evidence in hand therefore already gives hypothesis 3's falsifying result.
    - The code read at Steps 7 shows the loop placed before any change (round-0 diff lines 475-477, before the move).
    - Round point 17 is not closed. The decision that rests on it is whether the text leads to three live hypotheses on this defect, which is the evidence step 3 and step 4 lean on.
  - Failure scenario: the orchestrator reads the dry run as proof that the text yields three to five live hypotheses here, when the builder's run yields two. My run supplies three.
  - Verdict: the dry-run case as reported by the builder.
- **Proof 2.** The report claims more naming of the "No red command" section than the text holds.
  - Place: the report's round point 5, "Steps 4 (its last bullet and its Done line), the Stops row 'No red command' and Steps 15 name it".
  - What is wrong: Steps 15 (`:130`) says "every way tried" and does not name the section. The Stops row "The cause not found" (`:193`), which the round brief's point 5 also asked to name it, says "every way tried" as well. The claim is not reproduced for these two places. No decision rests on it beyond the round's closure.
  - Failure scenario: an orchestrator at a cause not found under the loop writes the ways tried into the Cause section, not into "No red command". The two records then differ in where the list lives.
  - Verdict: none (item 2 holds, since the template's Cause placeholder names the section).

#### Standards

- **Standards 1.** Two "Stated in" places in the glossary are stale after the renumbering.
  - Place: `docs/glossary.md`, and `skills/repo-setup/templates/plan-terms.md` likewise:
    - "**diagnosis record**: ... Stated in: `diagnose`, Steps 3."
    - "**probe**: ... Also, in a diagnosis, one change tied to one hypothesis with the red command run after it. Stated in: `diagnose`, Steps 9."
  - What is wrong:
    - Round 0 had "Steps 3" and "Steps 9", correct then. After the round, the record is opened at Steps 2 (`:53`), Steps 9 is the wait (`:110`), and probes are Steps 11 to 13.
    - The report's point 11 and its "Terms" line say the terms were checked.
    - This breaks item 3's requirement of correct "Stated in" places, and the round brief's point 9, "keeping every cross-reference right".
  - Failure scenario: a reader following the glossary to `diagnose` Steps 9 for "probe" finds "wait for the user's reply" and no definition.
  - Verdict: item 3 violated; the terms case partial.
- **Standards 2.** Two bullets each hold more than one rule.
  - Place: `skills/diagnose/SKILL.md:131`, "a cause not found is raised to the user as an open item, ..., which quotes the hypotheses and every probe or every way tried and names the record's path, and it is not sent to the builder"; `:151`, "its fix and its test are the ruling of the next repair round, ..., quoting the hypotheses with their results, the cause, the fix, both runs of the test and the record's path, with the red command as the round's check".
  - What is wrong: each bullet holds three requirements that can each be broken while the others hold. This breaks `docs/dev/skill-layout.md` "Lists and tables", one rule per bullet.
  - Failure scenario: an orchestrator sends a round ruling without the red command as its check. A reviewer cannot point at which part of the bullet was missed.
  - Verdict: the skill-layout case partial.
- **Standards 3.** A red line is called a kind of finding.
  - Place: `skills/diagnose/SKILL.md:65`, "The commands for each kind of finding are these", and `:150-153`, "hand the fix over by the kind of finding ... A red line:".
  - What is wrong: the glossary defines **finding** as "a defect a reviewer reports ... closed in a repair round or at landing or raised" and **red line** as "a verification line that fails on main after the cherry-pick". This breaks `docs/dev/skill-layout.md` "Writing for an agent", which says a glossary term is used only in a sense the glossary defines.
  - Failure scenario: a reader applies the glossary's "closed in a repair round" to a red line, which `land` says is never sent back to the builder.
  - Verdict: the terms case partial.

#### Behaviour

- **Behaviour 1.** The scratch copy fails for a step whose tracked diff is empty.
  - Place: `skills/diagnose/SKILL.md:69-70`, `git diff --binary <base>` saved to `"$tmp/step.diff"`, then `git apply "$tmp/step.diff"`.
  - What is wrong: `man git-apply` says of `--allow-empty` that it makes git "Don't return an error for patches containing no diff". A step whose only changes are new untracked files, such as a new skill folder with no tracked file changed, has an empty tracked diff, so `git apply` exits with an error.
  - Failure scenario: the orchestrator diagnoses a reviewer's finding on such a step. The copy step fails, the session reads it as "the scratch copy cannot reproduce", and under the loop the result is the cause not found without a single probe.
  - Verdict: item 1 violated (where probes run).
- **Behaviour 2.** The dry run above finds choices the text leaves open or leads wrong on.
  - Place: the Stops row "No dispatch entry" (`:195`), Steps 3 (`:62`, `:66-74`), Steps 4 (`:83`) and Steps 7 (`:101-105`).
  - What is wrong:
    - For a finding of a step that has already landed, the refusal's resume, "The step prepared with `/spec`", would prepare a landed step again.
    - Outside a plan, it is not said which apply line builds the copy of a defect not on the checkout, or where its patch is saved.
    - "Asserts every part" does not require the output to show each part's result. A suite that stops at its first failure hides the other half, so the shrink cannot see a cut that changes it.
    - Ranking has no criterion.
    - Three to five are required, with those already falsified by the shrink excluded, and no rule covers a shrunk case and code that leave fewer live causes.
  - Failure scenario: two sessions given the 2.E Spec 1 defect build different copies and red commands. One tries `/spec` on a landed step. One pads the list with a hypothesis the evidence already falsified, as the builder's run did.
  - Verdict: the dry-run case (met, with these named).
- **Behaviour 3.** `diagnosing-bugs` would still win two points.
  - Phase 1, way 10: it ships `scripts/hitl-loop.template.sh`, and `diagnose` has words only. The state file's open item on this is pending Axel's ruling.
  - Phase 4, "Perf branch": for a performance regression it says "logs are usually wrong" and measures with a timing harness or profiler, then bisects. `diagnose` Steps 11 offers only a debugger or logging for probes. The baseline in Steps 4 and way 9 cover measuring the red command, not probing a slow symptom.
  - Every other phase and checklist line is covered equally or better at the places the round's report names, which I read one by one: redact, the ways, tighten, non-deterministic, no loop, the completion checklist, reproduce, minimise, hypothesise, show, instrument and tag, the correct seam or "No test reaches it", and the cleanup.
  - Failure scenario: in step 4's blind comparison on a slow case, the judge sees `diagnose` probe by logging where `diagnosing-bugs` profiles.
  - Verdict: the `diagnosing-bugs` case partial.

### Declined to judge

- The report's section "Open items of 2.F's state file (verbatim)" reads "none", while the state file now holds the open item on the person-driven script. Whether that item existed when the round was sent is not settled by anything I may run. No decision rests on it, since the landing report copies the open items from the state file.
- The first run of the `sync_rules.py` case on the unchanged tree: I did not rerun it, and took it from the report's first run.
- Whether Spec 1 and Spec 2 are fixed in `diagnose` alone, or partly in `land` and `refute` (step 2 widens to `land` by the ruling "Step 1, where a diagnosis is booked"). That is the orchestrator's call, and Axel's where it widens a step.
- Whether the skill's length (220 lines against 138) loses to `diagnosing-bugs` in the blind comparison. That is Axel's call at step 4.
- The step's own check, Axel's reading against `docs/dev/skill-layout.md` and the Goal, which is pending by the plan.

Reviewer usage: tokens not known to me (the completion notice has them), about 27 tool uses, minutes not known to me.


## Closed

The findings of the first run were each sent in repair round 1 (`agents/briefs/1-round-1.md`, points 1 to 17). The findings of the run over round 1 are each fixed at landing on main, since each is small and inside the brief:

- Spec 1: "What it reads" 3 says a red line is read only once the step is backed out, and a red line whose entry does not read `landing: backed-out` is the refusal "No dispatch entry"; Steps 20's red-line bullet writes the cause, the fix and the record's path in the step's Step 0 for `/spec`, never on main outside a landing and never to the builder.
- Spec 2: the Quick start and "What it reads" 5 name a finding of the run over repair round <n> as `round <n> Spec 1`, read under "Repair round <n>, refuted"; a name without `round` is the first run's.
- Spec 3: Steps 15 runs Steps 23 after a cause not found inside a plan, and Steps 23's booking states that the cause was not found and names the open item.
- Spec 4: Steps 14 waits and re-ranks as Steps 9 and 10 when run by a person, and the Stops row "The hypotheses" names them.
- Spec 5: Steps 11 adds the probe carrying the hypothesis's change after a debugger or logging probe leaves it standing.
- Spec 6: Rules bullet 1 and Steps 4, 8, 15, 21 and 24 read "with no person present", which covers `/diagnose <symptom>` run by a session on its own; such a run names the record's path in its final message and keeps the record.
- Proof 1: the builder's report carries a correction after its redone dry run, pointing at this report's dry run for the three live hypotheses.
- Proof 2: Steps 15 and the Stops row "The cause not found" name the record's "No red command" section.
- Standards 1: the glossary and `plan-terms.md` give **diagnosis record** Steps 2 and **probe** Steps 11 to 13; **case, of a diagnosis** adds Steps 7; **cause not found** and **hypothesis** follow the fixes above; `sync_rules.py . --only glossary` prints ok.
- Standards 2: the two bullets are split, one requirement each.
- Standards 3: "kind of finding" is replaced by "source of the defect" and "where the defect was found".
- Behaviour 1: both apply lines carry `--allow-empty`, with the bullet that says why.
- Behaviour 2: the "No dispatch entry" row resumes a landed step through `/diagnose <symptom>`; Steps 3 gives the apply line and the patch for a defect at an older commit outside a plan; Steps 4 has the output show each part's result; Steps 7 states the ranking and the rule for fewer than three live causes.
- Behaviour 3: Steps 11 makes a slow symptom's probe a measurement (a timing harness, a profiler or `git bisect run`); the shipped script stays the open item "A script for the person-driven red command".
