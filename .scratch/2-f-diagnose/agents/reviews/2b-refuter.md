# Step 2b refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2b, base 5ad43ee4fd84dd04ebfd3a4b06b6367a4829cc29)

A skill's text is cited by its section, with the line `grep -n` prints on the changed tree beside it, since the launch asked for every line a change touches; the quoted words are what locate each place.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md   (from the worktree's root, exit 0)
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
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (the ASCII check, printed nothing)
checks: 11 commands passed

Verify 2, each dictated line written as the one line of a file under $TMPDIR, grep -c -F -f <that file> <file>:
  19 lines of items 1 to 5 in skills/diagnose/SKILL.md: 1 each
  3 lines of item 6 in skills/diagnose/templates/diagnosis.md: 1 each
  10 lines of item 7 in skills/spec/SKILL.md: 1 each
  2 lines of item 8 in skills/ordo-help/SKILL.md: 1 each
  the row of item 9 in skills/plan-orchestration/SKILL.md: 1
  the clause of item 10: 1 in skills/repo-setup/templates/plan-terms.md, 1 in docs/glossary.md
  the nine replaced texts (old description clause, old line 42, "The last four rows are refusals.", the two old Stops cells, the old spec line 112, the old plan-orchestration row, the old Step 0 clause in both glossary files): 0 each
Verify 3: covered by the checks.sh line above.
Verify 4: git status --short lists the seven files and the untracked report; git diff <base> --stat: 7 files changed, 35 insertions(+), 14 deletions(-)
  LC_ALL=C grep -n '[^ -~]' over the seven files: nothing, exit 1
Verify 5: git diff <base> read whole; each added line stands after and before the lines its item names.
Verify 6: git grep -n '/diagnose' -- skills docs README.md read hit by hit; result under Standards 1.

Commands the builder's report quotes:
  git show <base>:skills/diagnose/SKILL.md | grep -c premise -> 0 (R1)
  git show <base>:skills/spec/SKILL.md | sed -n 112,114p -> the three old lines, as the report quotes them (R2); grep -n '/diagnose' there -> 117 and 254
  git show <base>:skills/ordo-help/SKILL.md | sed -n 59,61p -> /spec, then brief check <n> and its text (R3); grep -n premise -> line 74 only
  git show <base>:skills/plan-orchestration/SKILL.md | sed -n 28p -> the old row (R3)
  git show <base>:skills/repo-setup/templates/plan-terms.md | sed -n 104p -> the old Step 0 entry (R4)
  git show <base>:skills/diagnose/templates/diagnosis.md | grep -n -i 'part\|step.s text' -> lines 56 and 58 (R5); grep -c premise -> 0
  git diff <base> -U0 | grep -c -P '^\+.*\t' -> 0; grep -n '^+.*[[:space:]]$' -> nothing, exit 1
  wc -l -> 249, 112, 305, 108, 332, 118, 135; git diff <base> --numstat -> 19/7, 3/3, 8/1, 2/0, 1/1, 1/1, 1/1
  description lengths (the layout page's python line) -> 903 skills/diagnose/SKILL.md, 1022 skills/spec/SKILL.md
  grep -c "step's worktree\|dispatch entry\|report\|finding\|the round\|builder" skills/diagnose/SKILL.md -> 36, the same 36 line numbers the report lists
  sed -n 76p skills/ordo-help/SKILL.md | grep -c -i 'cause\|diagnos\|investigat' -> 0
  grep -n 'Step 0' skills/spec/SKILL.md skills/land/SKILL.md skills/diagnose/SKILL.md -> spec 206 and 221, land 77, diagnose 177 and 180, as quoted
  awk over the Quick start block: the text of lines 15 to 19 starts in column 44; ordo-help lines 61 and 63 start in column 31
  wc -w over diagnose 35, 52, 63, 64, 108, 180 and spec 112, 121 -> 34, 25, 25, 23, 31, 30, 28, 32, as part 6 gives them
  ls docs/adr -> README.md, template.md (no NNNN-*.md record)
No case is a code case, so no change of the reviewer's own was made. The scratch folder under $TMPDIR is removed.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds, the new clause counts 1 and the old 0 in `skills/diagnose/SKILL.md` line 3.
- 2: holds, line 19, text in column 44.
- 3: holds, lines 35, 44, 46, 47, 52 and 53, each where the item places it.
- 4: holds, lines 63 to 65, 89, 108, 180 and 181, at the indents the item gives.
- 5: holds, the opening line, the two cells and the last row (lines 213, 224 to 226); the table has ten rows, five stops and five refusals.
- 6: holds, lines 3, 7 and 112 of `templates/diagnosis.md`.
- 7: holds, lines 112 to 121 of `skills/spec/SKILL.md` in the dictated order.
- 8: holds, lines 60 and 61 of `skills/ordo-help/SKILL.md`.
- 9: holds, line 28 of `skills/plan-orchestration/SKILL.md`.
- 10: holds for the end state, the clause counts 1 in both files and the sync check prints ok; the order of the two writes is under "Declined to judge".

Cases of the brief's "Cases":

- R1 to R5: met, each first read reproduces on the base with `git show <base>:<file>`.
- W1: met. Steps 1 does not refuse (lines 44, 46, 52), the record and its symptom are lines 62 and 35, the probes run on `git worktree add --detach "$tmp/tree" HEAD` (73, 77, 89), the person is shown the hypotheses and waited for (123, 126), Step 0 gets the four things and main is not changed (180, 181), and `spec` Steps 4 carries them (115, 116).
- W2: met, line 124 skips Steps 9 and 10 and "Rules" (243) gives no wait.
- W3: met, lines 53 and 58 and the row at 226.
- W4: met, lines 52, 64 and 65.
- W5: met, line 35, "in whatever words".
- W6: met, `diagnose` 161 writes no test, `spec` 116 carries the red command and 117 adds no case.
- W7: met, `diagnose` 150 and 152 against `spec` 118 to 120. Standards 1 is about where that stop is listed.
- W8: met for the expected result (line 108). Standards 2 and 3 are about what the same line leaves without an answer.
- W9: partial. After a stop the records are committed ("Steps / A stop" 1) and `spec` 114 holds. After a wait at Steps 5, `spec` 121 says the step "keeps them" while Steps 5 says "This run leaves nothing" and puts `plan.md` back from the copy taken before the diagnosis wrote Step 0. The missing part is the wait. Standards 4.
- W10: met. Each of the 36 hits names its forms or holds for `premise`; line 182's "its test" stands in the record whose path Step 0 holds, as it does for the red-line form.

## 1. Spec

- none. The diff writes each dictated text where its item says, changes no other line, and every premise of "What is on the tree" that a grep can rerun reproduces on the base.

## 2. Proof

- none. Every count, path and command output of the builder's report reproduces.

## 3. Standards

The builder's report, part 10, point by point: point 1 is a defect (finding 1); point 2 is a defect (finding 2); point 3 is a defect (finding 4); point 4 is a defect (findings 2 and 5); point 5 is a defect that needs two sessions (finding 6); point 6 is no defect. On point 6: `diagnose` Steps 15 (line 150) names `plan-orchestration`'s row "A finding that is the user's" as the kind of open item, and `plan-orchestration` Steps 3 and 6 already use that row for a refusal and a case that are no findings, so no reader is led wrong and no text changes.

1. `skills/spec/SKILL.md`, Steps 4 (line 120): "A step with no other item stops there, as "Steps / A stop" says."; what is wrong: the diff gives `/spec` a sixth stop that no list of its stops holds, against the change standard's rule 14 (a sentence the change makes false). `spec` "Stops" (line 273) still says "The first five rows are stops", `ordo-help`'s "/spec stops" line (76) lists five causes, and the `/spec` box of `docs/figures/gen_figures.py` (lines 581 to 585) lists the same five; failure scenario: a person whose `/spec` halted on a cause not found looks the stop up in `spec`'s Stops table or in what `/ordo-help` prints, finds no row, and cannot tell that `Ruled: ...` and `/spec` again resume it. Smallest change, all outside the brief's paths except none:
   - `skills/spec/SKILL.md` line 273: "The first five rows are stops" becomes "The first six rows are stops".
   - `skills/spec/SKILL.md`, a row after "A model other than the configured one" (line 281): `| A cause not found | The diagnosis of a part of the step's text that asks for a cause ends with the cause not found, and the step has no other item (Steps 4) | The open item, booked in the open items, with the diagnosis record's path | A ruling |`
   - `skills/ordo-help/SKILL.md` line 76: after "the step contradicts an ADR (a rule clash)," add "the cause its text asks for was not found and it has nothing else to build,".
   - `docs/figures/gen_figures.py`, the `/spec` group: add the label "A cause not found, from /diagnose" (the words the "close them" box uses at line 612), then `python3 docs/figures/gen_figures.py` rewrites `docs/figures/plan-loop.svg`, as `docs/dev/building.md` says.
   A cheaper wording that points line 120 at `diagnose`'s own stop would leave `ordo-help` 76 and the figure without the case.

2. `skills/diagnose/SKILL.md`, Steps 4 (line 108): "For `premise`, a red command that is green on main's head shows a false premise, which goes to `/spec` as its Steps 2 handles one, and the diagnosis ends there."; what is wrong, four things in the one bullet:
   - It names no route to Steps 22, so the detached worktree of Steps 3 stays registered in the main checkout and on disk (the builder's point 2).
   - It joins two requirements with "and", against `docs/dev/skill-layout.md`, "Lists and tables", first bullet (the builder's point 4).
   - The three bullets before it (105 to 107) already give the same state, no command that goes red, two other ends: the stop "No red command" run by a person and the cause not found with no person present. Nothing says which wins for `premise`, against rule 19 of the change standard.
   - "a red command that is green" uses **red command** outside its glossary entry, "goes red on the exact symptom".
   Failure scenario: `/spec` in the loop runs `premise` on a step whose claim no longer holds on main; the session reads 107 first, books a cause not found and an open item that asks the user about a defect that is not there; or it reads 108, ends at Steps 4, and leaves `$TMPDIR/diagnose.XXXXXX/tree` in `git worktree list`. Smallest change, line 108 replaced by three bullets at three spaces:
   - "For `premise`, a command that drives the code path of the symptom and is green on main's head shows a false premise, in place of the two ends above."
   - "The false premise goes to `/spec`, which handles it as its Steps 2 says."
   - "The diagnosis then goes to Steps 21 and 22, and Steps 5 to 20 and 23 are not run."

3. `skills/diagnose/templates/diagnosis.md`, "Cause" (line 78), and `skills/land/SKILL.md`, Steps 9 (line 93): "with its cause, or with "cause not found" and the open item it was raised as"; what is wrong: a `premise` diagnosis that ends on a false premise leaves a record with no cause and no "cause not found", and neither the template nor the booking has words for it, against rule 14; failure scenario: the step, rewritten after the ruling, lands; `land` "What it reads" 7 finds the record, and Steps 9 has to name it with a cause it does not hold. Smallest change:
   - template line 78, before the closing bracket: `; or for `premise` "false premise", with the green runs above`
   - `skills/land/SKILL.md` line 93: after "the open item it was raised as" add `, or with "false premise"`.

4. `skills/spec/SKILL.md`, Steps 5 (lines 135 and 136): "This run leaves nothing." and "`plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made."; what is wrong: the dictated line 121 says a step that waits "keeps" the diagnosis record and what the diagnosis wrote in Step 0, while the copy of Steps 1 (line 64) is taken before Steps 4 runs the diagnosis, so the restore drops the Step 0 text, and "leaves nothing" is false of the record. Rule 19 of the change standard; the builder's point 3; failure scenario: the step waits for another step to land, the session restores `plan.md`, the next `/spec` finds no cause in Step 0 (line 114), runs the whole diagnosis again with its wait for the person, and appends a second diagnosis of the same part to the record. Smallest change, outside the brief's paths:
   - line 135: "This run leaves nothing." becomes "This run leaves only what a diagnosis of Steps 4 wrote."
   - a bullet after line 136, at three spaces: "What the diagnosis of Steps 4 wrote in the step's Step 0 is then written into `plan.md` again."
   Verdict: W9 partial.

5. One rule per bullet, `docs/dev/skill-layout.md`, "Lists and tables", first bullet, and "Where a rule goes", last bullet:
   - `skills/spec/SKILL.md` line 121: "The diagnosis record and what the diagnosis wrote in the step's Step 0 are among the session's own records (Steps 1), and a step that waits at Steps 5 keeps them."; two requirements, each breakable alone. Replacement, two bullets at five spaces: "The diagnosis record and what the diagnosis wrote in the step's Step 0 are among the session's own records (Steps 1)." and "A step that waits at Steps 5 keeps them."
   - `skills/diagnose/SKILL.md` line 65: "The first fills the record as opened, and each later one is appended under a heading that quotes its part."; its second half states again what line 63 states ("appended to that file under its own heading, which ... quotes its part"). Replacement: "The first fills the record as opened."
   Failure scenario: a reviewer of a later diff cannot tell where one rule ends, and the two copies of the heading rule drift.

6. `skills/ordo-help/SKILL.md` line 61: "or you run it first", with `skills/diagnose/SKILL.md` Steps 20 (line 180) and Steps 2 (line 66, "not committed on its own"); what is wrong: `diagnose` ends with `plan.md` and the record uncommitted and says nothing of a commit for Step 0, and `spec` Steps 1 (line 63) refuses an uncommitted change on `plan.md` "that the session did not make". The builder's point 5. It holds in one session and fails across two; failure scenario: a person runs `/diagnose <entry> <step> premise` in one session and `/spec` in the next; `/spec` refuses with "A failed preflight", whose resume is "The tree put right"; discarding the change loses the cause, and committing `plan.md` alone leaves the record a change the new session "never" commits. The red-line bullet (line 177) has the same shape on the base. Smallest change, a sub-bullet under line 180 at six spaces: "Run by hand in a session that does not run `/spec` next, the session commits `plan.md` and the record by path before it ends, a handover as `plan-orchestration`'s "Resuming, and handing the plan over" says."

7. `skills/diagnose/SKILL.md`, Steps 2 (line 64): "each part "What it reads" 5 finds gets a diagnosis of its own", against `skills/spec/SKILL.md` line 114, "A cause that stands in the step's Step 0 already is not investigated again."; what is wrong: the form takes no argument, so `/spec` cannot run it for one part only, and `diagnose` has no rule that leaves a found part out. Rule 19; failure scenario, a rare one: a step with two parts, the first cause in Step 0 and the second still open after a ruling; `/spec` runs the form for the second, and `diagnose` diagnoses the first again and writes a second cause and fix for it into Step 0. Smallest change, line 64: "For `premise`, each part "What it reads" 5 finds whose cause does not stand in the step's Step 0 already gets a diagnosis of its own, in the order of the step's text."

8. `skills/diagnose/SKILL.md`, "What it reads" 5 (line 52): "the rulings its tags name", against `skills/spec/SKILL.md`, "What it reads" 4 (line 40), "the rulings that touch it"; what is wrong: the two skills read a step's text from different rulings, and the brief's Decision 2 says they are the same. Rule 19; failure scenario: a part that asks for a cause stands in a ruling that touches an `(approved)` step and that no tag names; `spec` Steps 4 sees an investigation item and runs the form, `diagnose` refuses with "No part to investigate", and that row sends the reader back to `/spec`. Smallest change, line 52: "its line in the step list of `plan.md`, the rulings that touch it and what its Step 0 holds, as the `spec` skill's "What it reads" 4 reads them."

9. `skills/diagnose/templates/diagnosis.md` line 3: "which names its finding or quotes its part", and line 7: "with that part quoted"; what is wrong: the record is a copy of the template, and in it "its part" and "that part" have no antecedent, while the same file uses "part" for a part of the case (lines 56 and 58). Prose standard, E, "Cold opens"; failure scenario: the person reading a record at landing takes the heading of a second diagnosis for a part of the shrunk case. Smallest change: line 3 ends "which names its finding or quotes the part of the step's text it is for."; line 7, "with that part quoted" becomes "with the part of the step's text that asks for the cause quoted". `skills/diagnose/SKILL.md` line 63 then takes the same words as line 3, as the brief check's finding 8.7 asked.

10. `.scratch/2-f-diagnose/agents/reviews/2b-report.md`, part 3: R2, R3 and R5 quote output shortened with "..." (for example "`/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, ...`"); what is wrong: the brief's "Report" 3 asks each output verbatim; failure scenario: a reader cannot check the cut part without a rerun. The reruns above give the whole lines and they agree, and no decision rests on the cut text.

## 4. Behaviour

- none. Part 9 of the report states each user-visible change with its before and after, and the diff holds no other.

## Declined to judge

- A real run of `/diagnose <entry> <step> premise`: not made, since the reviewer invokes no skill. Every walk is a reading.
- Whether the runner lets `/spec` run `/diagnose` from inside its Steps 4 under the loop: not checked. `plan-orchestration` "Rules" (line 332) lists the skills the loop invokes without `/diagnose`; that line is the same on the base and already left out the forms of Steps 8 and 9.
- The order of item 10's two writes (the template first, then `sync_rules.py --write`): the tree shows only the end state, where both files hold the clause and the sync check prints ok.
- Whether the new Stops row and the changed **Step 0** entry are vocabulary only the user rules on: the ruling "Step 2b, the brief's choices" books them for Axel to overrule, and that is his call.
- Decision 13, no version change: no page states when `metadata.version` moves.
- The installed, pinned skills and the other worktrees under `.agents/worktrees/`: not read.

Reviewer usage: not measured by the reviewer; the completion notice carries the tokens, tool uses and time.

Agent usage: claude-opus-5-5 (ordo-high), 246779 tokens, 29 tool uses, 667 s ($1.55 to $5.98).
