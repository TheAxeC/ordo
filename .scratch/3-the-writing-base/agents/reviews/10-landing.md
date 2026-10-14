# Landing of step 10 of plan 3, the fifth runs

Roadmap entry 3, the writing base. Step 10 of 11, the fifth runs, landed unticked. Next: the user's ruling on Open item K, then the step it names or step 11, the closing.

## Open items

- Open item K (2026-10-14): step 10's check failed, so by ruling J the closing waits for the user.
  - What happened: on the fifth runs, at `v7.1.0-rc.5`, 97 of 133 manuscript findings and 52 of 90 grant findings are not marked right by both markers. The counts over the five runs are, manuscript then grant: step 2 36 and 16, step 4 35 and 29, step 6 20 and 13, step 8 48 and 35, step 10 97 and 52. Each fix round has been followed by a run that fails again, and the last two runs failed on more findings than the run before. Why step 10 failed on more is not known.
  - (a) Find the cause before fixing: step 11 runs `/diagnose 3 10` on why the failures rose from step 8 to step 10 (a change in `/writing` at `v7.1.0-rc.5`, a change in what the markers were told, or the agents' variance), then fixes `skills/writing/` for the cause it finds, tag `v7.1.0-rc.6` and pin. Step 12 repeats the runs and marks. The closing becomes step 13. Pro: the fix is aimed at a known cause, and the runs show whether it worked. Con: three more steps, about the cost of steps 8 to 10 again, and no promise that the gate then holds.
  - (b) Another fix round without a diagnosis: step 11 fixes each failure step 10 lists, tag `v7.1.0-rc.6` and pin, step 12 the runs, step 13 the closing. Pro: the same shape as steps 7 to 10. Con: that shape has not converged in four rounds.
  - (c) Change the gate, for example to a share of findings right by both. Pro: the plan can close. Con: it reverses the user's ruling on the gate (Gate 3), and loosens a check.
  - (d) Mark entry 3 done as it stands. The lazy option: it closes with the gate failed.
  - Recommendation: (a).
- Open item L (2026-10-14): six helper scripts the session wrote for step 10 under the scratchpad, which the user never approved. Each computes a fact: `mk10prompts.py` builds the marker prompts from step 8's prompts and the brief's two quoted blocks, `mk10rows.py` lists the rows of each report, `mk10marks.py` reads each marker's mark and reason per row, `mk10md.py` writes `10-marks.md` from them, `mk10places.py` runs the place checks, `an10agents.py` counts the tool calls in the agents' transcripts. They are listed in `agents/reviews/10-report.md`, "Helper scripts and scratch files", and the refuter compared their counts with the files and found no difference.
  - (a) Approve what they compute, for step 10's record and for the repeated runs if K is (a) or (b). Pro: the counts of 223 rows and 446 marks are made by a machine and checked by the refuter. Con: none beyond the approval.
  - (b) Not approved: step 10's tables are redone by reading, and later steps count by hand. Pro: no script. Con: hand counts over hundreds of marks are where a wrong number gets in.
  - Recommendation: (a). The lazy option is none here: both cost the user one ruling.

## The check of Steps 1

`ListAgents` before the landing listed no subagent of this plan running: the review agents, the four markers and both reviewers had ended.

## NOT DONE

- Unticked: the step's check does not hold. 97 manuscript rows and 52 grant rows are not marked right by both markers. Both markers mark 88 and 29 of them wrong. Gate conditions 2, 5 and 6 fail, and 1, 3, 4 and 7 hold. Condition 2: the group lines of manuscript groups 5, 8, 12, 13 and 14 and grant groups 10 and 13, and the order of manuscript groups 7 and 12. Condition 5: manuscript finding 80 is a reference to finding 89, two places are given twice (68 and 100, 80 and 89), the further splits of 120 and 126 quote one sentence, grant 3a, 3d and 12e Breaks 1 and 2 point at definitions in place of writing them, and finding 105 carries a line that it still breaks section E. Condition 6: ten marks have no reason of their own after each marker's one resume. The manuscript report says itself that its tense and voice group leaves out six files. Two parts of the brief were not done as written: the cases' first run before the runs, and the scratch files and six helper scripts the brief does not name and the user did not approve (`10-report.md`, "Helper scripts and scratch files"). By ruling J, entry 3 is not marked done, and the failure goes to the user as Open item K. The helper scripts go to the user as Open item L.

## What landed

- Landed: the records of the fifth runs, all in the ledger: `agents/reviews/10-run/` (the two review reports, the four markers' marks and their four resume replies), `agents/reviews/10-marks.md` (one row per finding, place, split and list entry: 133 manuscript rows and 90 grant rows) and `agents/reviews/10-report.md`. The range 9f6a598..3-the-writing-base-10 holds no commit (`land.sh`: `nothing to copy`), since the step was run inline in the main checkout's ledger.

## What was found

- Review: `agents/reviews/10-refuter.md`. The first run found Spec 1 to 4, Proof 1 to 4 and Standards 1, closed in repair round 1 (`agents/briefs/10-round-1.md`) apart from Spec 1, the failure of the check itself; in round 1 manuscript marker 1 was resumed once for row 73 and kept its mark. The run over round 1 found Spec 1 to 3, Proof 1 to 3 and Standards 1 and 2, all fixed at landing apart from Spec 1 (`10-refuter.md`, "Repair round 1, refuted", Closed).

- Fixes at landing: 1. `10-report.md`, condition 6 quotes the grant markers' six resume commands whole (Spec 2). 2. `10-report.md`, "Helper scripts and scratch files" adds `8-prompts.json`, the two `__pycache__` files and the round reviewer's two diff files, and names `brief10.py` and `plan-before-spec10.md` as files of the preparation (Spec 3). 3. Manuscript marker 2 resumed once for 14 rows whose reasons named only the rule and the new words (session entry 44460), every mark kept (`10-run/manuscript-marks-2-resume.md`); `10-report.md` lists the ten marks left without a reason of their own under condition 6, which fails on them, and states the reading in the judgment call on reasons; `10-marks.md` names the resume (Proof 1). 4. The resume figures say "in total with its resume" in `10-report.md` and the resume files' header lines (Proof 2). 5. Condition 4 says the `Read` at 43551 stands in the grant span only (Proof 3). 6. The long sentences the run named are split, their row lists written as lists (Standards 1). 7. The state file's log line names four resumed markers and conditions 2, 5 and 6 (Standards 2).

## Verification

- Verify list: unchanged at Steps 2. The verification page `docs/dev/building.md` is unchanged since the base in the worktree and on main (`git diff --quiet 9f6a598 -- docs/dev/building.md` exit 0 in the worktree, `git diff --quiet 1077fe4 HEAD -- docs/dev/building.md` exit 0 on main).

- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-10 9f6a598` exit 0: `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, the character-set check printing nothing, `checks: 6 commands passed`. The brief's checks 1 to 4 after the fixes: the character-set check over `10-marks.md`, `10-report.md` and `10-run/*` exit 0, `diff exit 0`, `cmp exit 0`, research-hub status printing nothing, worktree status printing nothing.

- A/B: none. Look: none configured.

## Usage

- Usage: brief check a1b59c3039b987617 claude-opus-5-5 209032 tokens, 39 tool uses, 6.6 min; builder inline (the session); review agents a9088c50255802da8 156082 tokens, 38 tool uses, 24.4 min and af8c488aa7ca0db17 147413 tokens, 6 tool uses, 28.9 min; markers a9285b209948a9895 265399 tokens, 40 tool uses, 17.8 min (267814 tokens in total, 3 tool uses, 0.2 min on its resume in round 1), aafb8073cdd7eafde 247629 tokens, 40 tool uses, 15.4 min (256231 tokens in total, 1 tool use, 1.2 min on its resume at landing), ad54cb074e204e730 185690 tokens, 7 tool uses, 13.5 min (197620 tokens, 13 tool uses, 15.1 min in total with its resume) and ad1c69010730ed017 188613 tokens, 7 tool uses, 14.0 min (191841 tokens, 10 tool uses, 14.6 min in total with its resume); reviewer aee2c17a800693112 claude-opus-5-5 366784 tokens, 56 tool uses, 10.7 min; reviewer over round 1 a65b9752129715d7f claude-sonnet-5-5 266591 tokens, 64 tool uses, 9.5 min.

- The builder's first report did not pass its bar: the scratch files and helper scripts were not named, the skipped first run of the cases stood as a judgment call, commands were described in place of quoted, the manuscript span was cut short, and C8 and condition 6 read as met while rows 73 and 12b gave no reason of their own.

## Next

The user's ruling on Open items K and L. Under K (a) or (b), step 11 is prepared with `/spec 3 11` after the plan takes the new steps; under (c) or (d), step 11, the closing, runs with the ruling.
