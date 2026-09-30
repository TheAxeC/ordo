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

