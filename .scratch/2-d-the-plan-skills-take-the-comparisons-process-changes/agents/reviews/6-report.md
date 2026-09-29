Everything in the brief is done.

# Report: step 6, the blind-comparison protocol

## Open items of the state file (verbatim)

None.

## First run, on the unchanged tree at 30ca18f, before any change

- `ls docs/dev` printed `building.md`, `change-standard.md`, `skill-layout.md`: no page on blind comparisons.
- `grep -rn -i 'blind' docs/dev skills` printed three lines, as the brief says: `docs/dev/change-standard.md:21`, `skills/repo-setup/templates/shared-rules.md:15`, `skills/repo-setup/templates/docs/dev/change-standard.md:21`.
- Case 1 (the page against the ruled clauses): the page did not exist, so no clause had a line.
- Case 2 (entry 7's gate through the page) and case 3 (entry 2.F's gate through the page): `sed -n '37p;93p' docs/roadmap.md` printed both gates; with no page, no reading could say who judges, how, or what "wins or ties" means.
- Case 4: `grep -n -i 'fresh agent\|swapped\|tie' docs/dev/blind-comparison.md` printed `grep: docs/dev/blind-comparison.md: No such file or directory`, exit 2.
- Case 5: `grep -n 'blind-comparison.md' docs/dev/change-standard.md` printed nothing, exit 1.
- `grep -n 'Gate:' docs/roadmap.md | grep -i blind` printed lines 30, 37, 72, 79, 86, 93, 107, 163, 177, 184 and 198, the eleven gates the brief lists.

No case in the brief was wrong on the tree.

## The page, whole (`docs/dev/blind-comparison.md`)

# Blind comparison

A gate that compares a new skill with another skill on a real input cites this page, and the comparison the gate names runs as the steps below say. The orchestrator of the plan whose gate needs the comparison runs it, from the two runs of the skills to the record.

1. **The input.** The orchestrator gives the same input to both sides: one real input, the one the gate names, unchanged, to the new skill and to the skill it is compared against. Each side runs in its own fresh session with only that input and its own skill, and neither sees the other's output.
2. **Unlabelled.** The judge sees the two outputs unlabelled. Before judging, the orchestrator removes from each output every mark of which side made it (a skill's name, a file or folder name, a header or footer a skill writes), writes the key (which output is which) to a file the judges are not given, and names the two outputs A and B.
3. **Random order.** The judge sees the two outputs in random order. A command whose result the orchestrator does not choose decides which output is A, for example `python3 -c 'import random; print(random.choice(["new first", "old first"]))'`, and the orchestrator keeps the command and its output with the key.
4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.
5. **Reading.** The judge reads each output whole, and for each lists its critical failures before stating a preference. A critical failure is one that makes the output unfit for the purpose the input sets (a claim the input contradicts, a missing part the input asks for, a citation that does not resolve), and the judge quotes each one with its place.
6. **The verdict.** The judge writes the verdict, A, B or a tie, with the reasons, each reason pointing at the failures or the passages it rests on.
7. **Twice, the order swapped.** The orchestrator has the comparison judged twice, the second time with the order swapped: the output that was A is given as B, and the output that was B as A. A fresh agent makes each judgment, so the second judge has no memory of the first. When the two verdicts, read through the key, name different sides, the disagreement is a tie: the result of the two judgments is a tie.
8. **The final call.** The user reads the input, both outputs and both verdicts, and makes the final call: the new skill wins, ties or loses. The user's call is the result the gate reads, and "wins or ties" in a gate means the call is a win or a tie.
9. **The record.** The orchestrator keeps the comparison in the ledger of the plan whose gate needs it, at `agents/reviews/<step>-blind-comparison.md`: the input or its path, the two outputs as judged, the key, the command that set the order and its output, both verdicts as the judges wrote them, and the user's call with the reasons.

## `docs/dev/change-standard.md` line 21, old beside new

- Old: ``- A gate for a judgment is a review: the user's, or a blind comparison. "A script prints ok" is a gate only for a fact.``
- New: ``- A gate for a judgment is a review: the user's, or a blind comparison, run as `docs/dev/blind-comparison.md` says. "A script prints ok" is a gate only for a fact.``

The copies under `skills/repo-setup/templates/` are unchanged: `git diff --stat` lists only `docs/dev/change-standard.md | 2 +-`, and `git status --short` shows ` M docs/dev/change-standard.md` and `?? docs/dev/blind-comparison.md`.

## Map of the ruled clauses to the page

Each line number is from `grep -n -o` over the page for the words quoted.

| Ruled clause | Line | The page's words |
|---|---|---|
| same input for both outputs | 5 | "The orchestrator gives the same input to both sides" |
| unlabelled | 6 | "The judge sees the two outputs unlabelled." |
| random order | 7 | "The judge sees the two outputs in random order." |
| with only the input | 8 | "The judge receives the two outputs with only the input, and nothing else" |
| each output read whole | 9 | "The judge reads each output whole" |
| critical failures listed before a preference | 9 | "for each lists its critical failures before stating a preference" |
| verdict written with reasons | 10 | "The judge writes the verdict, A, B or a tie, with the reasons" |
| judged twice with the order swapped | 11 | "The orchestrator has the comparison judged twice, the second time with the order swapped" |
| disagreement is a tie | 11 | "When the two verdicts, read through the key, name different sides, the disagreement is a tie" |
| a fresh agent judges twice | 11 | "A fresh agent makes each judgment, so the second judge has no memory of the first." |
| Axel reads both outputs and the verdict | 12 | "The user reads the input, both outputs and both verdicts" |
| for the final call | 12 | "and makes the final call: the new skill wins, ties or loses" |

Each clause is stated on one line only; `grep -c 'final call' docs/dev/blind-comparison.md` prints `1`.

## Entry 7's gate walked through the page (`docs/roadmap.md` line 93)

The gate: "a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind, wins or ties".

1. Input (step 1): the orchestrator of entry 7's plan gives one real round of referee comments, unchanged, to `skills/rebuttal/` and to the revision coach, each in its own fresh session with only that round and its own skill.
2. Unlabelled and random order (steps 2, 3): the orchestrator strips each output of skill names and file names, sets which is A by the kept `python3 -c ...` command, and writes the key to a file the judges do not get.
3. The judge's input (step 4): the round of referee comments and outputs A and B, nothing else.
4. Reading and verdict (steps 5, 6): the judge reads each output whole, lists its critical failures (a referee point left unanswered is one the input asks for), then writes A, B or a tie with reasons.
5. Twice (step 7): a second fresh agent judges with A and B swapped; two verdicts naming different outputs through the key make a tie.
6. Final call (step 8): the user reads the comments, both outputs and both verdicts and calls win, tie or loss; the gate's "wins or ties" is true when the call is a win or a tie.
7. Record (step 9): `agents/reviews/<step>-blind-comparison.md` in entry 7's plan ledger holds the input, both outputs, the key, the order command and its output, both verdicts and the call with reasons.

## Entry 2.F's gate walked through the page (`docs/roadmap.md` line 37)

The gate: "a blind comparison under the protocol of 2.D against mattpocock's `diagnosing-bugs` on the same defect", with no result named.

1. Steps 1 to 7 run as for entry 7, with the defect put back on a scratch copy of the tree as the input, and `diagnose` and `diagnosing-bugs` as the two sides.
2. Step 8 gives the user's call (win, tie or loss) as the result the gate reads. The page adds no pass condition: its only sentence on what a result means is the reading of the words "wins or ties" where a gate states them, and 2.F's gate does not state them, so what the call must be for 2.F to pass is left to the gate, which step 7 of this plan makes cite the page.
3. Step 9 puts the record in entry 2.F's plan ledger at `agents/reviews/<step>-blind-comparison.md`.

## DONE / NOT DONE

| Item | Status | Command | Output |
|---|---|---|---|
| 1. `docs/dev/blind-comparison.md`, the protocol in run order, each ruled clause once | DONE | `grep -n -o '<each clause>' docs/dev/blind-comparison.md` | lines 5 to 13 as in the map above |
| 2. Opening paragraph: what it is for, who runs it | DONE | `sed -n 3p docs/dev/blind-comparison.md` | `A gate that compares a new skill with another skill on a real input cites this page, and the comparison the gate names runs as the steps below say. The orchestrator of the plan whose gate needs the comparison runs it, from the two runs of the skills to the record.` |
| 3. `docs/dev/change-standard.md` line 21 points at the page | DONE | `grep -n 'blind-comparison.md' docs/dev/change-standard.md` | ``21:- A gate for a judgment is a review: the user's, or a blind comparison, run as `docs/dev/blind-comparison.md` says. "A script prints ok" is a gate only for a fact.`` |
| Case 4: terms present | DONE | `grep -n -i 'fresh agent\|swapped\|tie' docs/dev/blind-comparison.md` | lines 10, 11, 12 (fresh agent and swapped on 11; tie on 10, 11, 12) |
| Templates unchanged | DONE | `git diff --stat` | ` docs/dev/change-standard.md | 2 +-` / ` 1 file changed, 1 insertion(+), 1 deletion(-)` |
| Verify 2: ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md docs/dev/change-standard.md` | no output, exit 1 |
| Verify 1: the runner | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md` | below, exit 0 |

The runner's lines, verbatim:

```text
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

These checks verify the tests and the ASCII rule; whether the page states the ruling is judged by reading, above.

## Files changed, line counts (`wc -l`)

- `docs/dev/blind-comparison.md`: 13 lines, new.
- `docs/dev/change-standard.md`: 80 lines, one line changed (21).
- `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/6-report.md`: this report.

## Judgment calls

- Step 7 says the two verdicts are compared "read through the key", since after the swap the label A names the other output; without it "name different sides" would compare labels. This adds no condition; it says how the ruled "disagreement is a tie" is read.
- Steps 2 and 3 each open with the judge-facing clause ("The judge sees the two outputs unlabelled", "in random order") so that the ruled words stand where the brief's bullet states them.
- The brief's "the person running the comparison" is written "the orchestrator", the runner the brief's item 2 names.

## Whole-file sentences reread

- `docs/dev/change-standard.md` line 3, "This page says how the work is done and how it is reported.": still holds; line 21 still states the same rule and now names where a blind comparison is defined.
- `docs/dev/change-standard.md` line 13, "Every rule on this page that names a script, a test or a check is read under this section.": unaffected.

## Doc text

None. `grep -rn 'blind comparison' docs README.md skills utils` finds the roadmap gates at lines 30, 37, 163, 177, 184 and 198 (the gates at 72, 79, 86, 93 and 107 say "compared blind"; all eleven are step 7's to change), `docs/academic-coverage.md` lines 129 and 131 (name a blind comparison as a gate, which stays true), and the two template files the brief leaves unchanged. No sentence found lists the pages of `docs/dev/` (`grep -rn 'docs/dev' README.md CLAUDE.md docs/dev/building.md docs/dev/skill-layout.md .agents/plan.yaml` names single pages only), so none is made false by the new page.
