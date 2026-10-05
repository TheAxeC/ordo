# Step 2 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2-1-2, base 132fce8)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Each command was run from the worktree's root.

```
$ git status --short
 M docs/roadmap.md
?? .scratch/2-1-scripts-cut-to-their-jobs/agents/reviews/2-report.md

$ grep -c planted docs/roadmap.md            (brief, Verify 1, C1)
1
exit 0

$ grep -n planted docs/roadmap.md | cut -c1-60
234:- [x] 2.B. Repair what the audit of plans 1, 2 and 2.A f

$ grep -o "each planted again in a copy" docs/roadmap.md
each planted again in a copy

$ sed -n 60p docs/roadmap.md | grep -c planted
0

$ LC_ALL=C grep -n '[^ -~]' docs/roadmap.md  (brief, Verify 2)
exit 1   (no output)

$ git diff --numstat                         (brief, Verify 3)
5 5 docs/roadmap.md
exit 0

C2 (brief, Verify 1). I took the five "-" lines and the five "+" lines of `git diff 132fce8 -- docs/roadmap.md`, applied the brief's items 1 to 5 to each base line with str.replace, and compared the result with the new line:
entry 0 match count 1   (x4, one per edit of item 1)
entry 0 expected==actual: True
entry 1 match count 1
entry 1 expected==actual: True
entry 2 match count 1
entry 2 expected==actual: True
entry 3 match count 1
entry 3 expected==actual: True
entry 4 match count 1
entry 4 expected==actual: True
Doubled or dangling ";" (';;', '; ;', ';.', ', ;') in each new line: False x5
The current lines 60, 67, 95, 102 and 158 equal the diff's new lines: True x5

The builder's report, checked against the diff:
- each of the report's five "before" blocks equals the base line, and each "after" block equals the new line: True True x5
- `git diff --numstat` printing `5 5 docs/roadmap.md` and the ASCII check printing nothing (rc=1): reproduced above
- the report copy in the main checkout's ledger and the copy in the worktree: `diff` prints nothing ("same")
- "planted" occurrences in the base line 60: 5 (count of the "-" line of the diff)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1 (entry 3): holds. Each of the four quoted strings occurs once in the base line, and applying the three removals and the one replacement gives exactly the new line 60 (C2 check above).
- 2 (entry 4): holds. Line 67 reads `- Gate: one real run on a real diff that you review.`
- 3 (entry 7): holds. The new line 95 is the base line with the single quoted clause removed.
- 4 (entry 8): holds. Line 102 reads `the checks for limits and required sections pass their tests; ...`
- 5 (entry 16): holds. Line 158 ends `Nothing of it is done without that permission. \`utils/check_coverage.py\` and its mention in \`docs/dev/scripts.md\` are deleted.`, which is the sentence of its own that the brief's decision 1 names.

Cases of the brief's "Cases":

- C1: unmet as the brief writes it. `grep -c planted docs/roadmap.md` prints 1, from line 234, the done record of entry 2.B ("each planted again in a copy"). No item of the brief covers that line. Over the gate lines the case is about, `sed -n 60p docs/roadmap.md | grep -c planted` prints 0. The defect is in the case, not in the diff: Spec 1.
- C2: met. Each of the five lines equals its base line with exactly the brief's edits applied, and no new line contains a doubled or dangling ";" (the C2 check above). The builder's report also gives the first read on the unchanged tree.

## 1. Spec

- `.scratch/2-1-scripts-cut-to-their-jobs/agents/briefs/2.md`, "Cases" C1, and "What is on the tree": "C1. `grep -c planted docs/roadmap.md` prints 0 after the change."
  - What is wrong: the case assumes "planted" occurs only in entry 3's gate. On the base it also occurs in line 234, entry 2.B's `[x]` done record. The builder reported this as found on the unchanged tree ("printed 2"). My `grep -n planted docs/roadmap.md` reproduces the remaining hit at 234. That line records the history of a closed entry. Removing the word there would rewrite a done record that no item, ruling or path of the brief covers. The diff is correct to leave it.
  - Failure scenario: a reader at landing who takes C1 literally either holds the step as NOT DONE, or edits entry 2.B's done record to get the count to 0. Either way the step is judged against a premise the tree never satisfied.
  - Verdict: C1 unmet.
  - The builder raised this as a stop. Under the refute skill's "Finding dispositions" for a small text step, it is small and inside the brief, and can be fixed at landing by reading C1 as the count over the five gate lines. That count prints 0 (`sed -n 60p docs/roadmap.md | grep -c planted` printed 0).

## 2. Proof

none.

One count is not reproduced. The report says line 60 held "six occurrences" of "planted" on the unchanged tree. The base line counts 5. No decision rests on that count, since C1 counts lines with `grep -c`, so under Proof it is not a finding.

## 3. Standards

- `.scratch/3-the-writing-base/plan.md`: the sections "## Gate" (the gate and the question bullets under it, including "Step 3: ... every planted break named"), "## Steps, in execution order" (step 2, "The runs: a planted text with one break of each rule of `references/` ..."; step 3, "check: ... every planted break named at its place, nothing reported in the clean text") and "Rulings" (D9, Open item Gate 3, Open item Gate 3b).
  - Quoted hunk from the plan's Gate: "`/writing` run on one text holding one planted break of each rule of `references/`, and on one clean text, names every planted break and nothing in the clean text, checked by reading its report". `grep -c planted .scratch/3-the-writing-base/plan.md` prints 8.
  - What is wrong: plan 3 is open (its state file has "Plan opened" and "Next step: 1"). Its gate is the copy of roadmap entry 3's gate that `/plan` made, and the `plan` skill's Steps say "the gate is the roadmap's and the user's". After this diff, the roadmap's entry 3 gate no longer holds the planted-text clauses. Plan 3's copied gate, its gate-question bullets and steps 2 and 3 still require them, and so does its ruling D9, which ruling C of plan 2.1 reverses for the roadmap.
  - This breaks two rules of `docs/dev/change-standard.md`, "The rules": rule 19 ("A change leaves no two statements that contradict each other") and rule 14 ("A change carries to every place that names it").
  - The builder did not cause this. The brief's "Paths this step writes" holds only `docs/roadmap.md`, and rule 20 kept the builder out of other files. The brief's "What is on the tree" does not name plan 3's ledger.
  - Failure scenario: an orchestrator resumes plan 3 from its ledger, which plan-orchestration reads as the whole state. It builds step 2's planted `.tex`, `.docx`, `.md` and `.txt` texts and the clean text, and it judges step 3 and the closing on conditions the roadmap gate no longer holds. At `/roadmap done 3`, the gate output it records does not match the roadmap's gate.
  - Verdict: none of the items or cases (the brief's scope does not reach this file).
  - This is not small and not inside the brief: it rewrites another open plan's gate, steps and user rulings. Under "Finding dispositions" it goes to the user as an open item.
- `.scratch/2-1-scripts-cut-to-their-jobs/agents/reviews/2-report.md`, first paragraph: "Open items of the state file: not read by this report, since the brief does not name any for this step."
  - What is wrong: `docs/dev/change-standard.md`, "The rules" rule 7 requires "Then the state file's open items verbatim", and the page's introduction says nothing in a brief overrides it. The state file's open items read "none".
  - Failure scenario: with an open item booked in the state file, a report written this way leaves it out, and the reader of the report does not see an item that waits on the user.
  - Verdict: none (a rule of the report's shape, not an item or a case).
  - Small and inside the brief. It can be fixed at landing by writing "Open items: none."

## 4. Behaviour

none. The only change a user sees is the five gate lines. The report states each one before and after, and the diff reproduces each quote (True True x5 above).

## Declined to judge

- Whether the five new gate clauses are right as gates. The user approved their wording when entry 2.1 was added and by ruling C, and the plan's step 2 check is the user's reading of them.
- Whether entry 4's gate, now only "one real run on a real diff that you review", still checks its goal ("A skill that checks and rewrites the comments of a diff"). That is the user's call on approved text.
- `.scratch/plan-drafts/3-the-writing-base.md`, line 8. It holds an older entry 3 gate ("one planted violation per check"). That text already differed from the roadmap before this step, so this diff does not make it false. Whether drafts are kept current is a separate concern.
- `docs/dev/skill-layout.md`. It governs `skills/*/SKILL.md`, and the diff touches none.
- ADRs: none of the twelve records in `docs/adr` governs a roadmap gate's text. `grep -l -i 'roadmap\|gate' docs/adr/*.md` lists 0001, 0004, 0005, 0006, 0009, 0010, 0011 and 0012. Each one cites the roadmap only as context for an entry. The brief's premise holds.

Reviewer usage: a00ca6ccb690968fe, claude-opus-5-5, 111304 tokens, 25 tool uses, 2.9 minutes.
## Closed

- Spec 1 (C1 counts the whole file): a premise of the brief, corrected at landing. Line 234 of `docs/roadmap.md` is entry 2.B's done record and stays; C1 reads as the count over the five gate lines, which prints 0 (`sed -n 60p docs/roadmap.md | grep -c planted`).
- Standards 1 (plan 3's ledger still holds the planted-text gate, steps and rulings): raised to the user as Open item D in the state file.
- Standards 2 (the report did not give the state file's open items): fixed at landing; `2-report.md` holds "## Open items of the state file" with "none".
