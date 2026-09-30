# Round 1 of step 2b: the rulings on the review's findings

The review is `.scratch/2-f-diagnose/agents/reviews/2b-refuter.md` in the main checkout. Work in the same worktree under the same brief and rules file. Make exactly these changes and no other. No git command that changes state. Each text is written exactly as given, one line per bullet, numbered item, table row or paragraph, indented as its neighbours. Line numbers are the worktree's as it stands before this round.

This round widens the step's paths by four: `skills/land/SKILL.md`, `docs/figures/gen_figures.py`, `docs/figures/plan-loop.svg`, and line 332 of `skills/plan-orchestration/SKILL.md`. The spec and ordo-help lines named below join the ranges the brief already gives those two files.

1. The stop of `spec` Steps 4 gets its place in every list of `/spec`'s stops (Standards 1, your point 1).
   - `skills/spec/SKILL.md`, "Stops", line 273: "The first five rows are stops" becomes "The first six rows are stops".
   - `skills/spec/SKILL.md`, "Stops": one row after the row "A model other than the configured one" and before the row "A step without the user's authority":

     ```
     | A cause not found | The diagnosis of a part of the step's text that asks for a cause ends with the cause not found, and the step has no other item (Steps 4) | The open item, booked in the open items, with the diagnosis record's path | A ruling |
     ```

   - `skills/ordo-help/SKILL.md`, the "/spec stops" line (line 76): after "the step contradicts an ADR (a rule clash)," and before "or the brief-check agent", these words are added: "the cause its text asks for was not found and it has nothing else to build,".
   - `docs/figures/gen_figures.py`, the `/spec` box: one label after `model_stop,` in its group, at the indent of that line:

     ```
     "A cause not found, from /diagnose",
     ```

     Then `python3 docs/figures/gen_figures.py` from the worktree's root, which rewrites `docs/figures/plan-loop.svg`. Tried on a scratch copy: the script exits 0, `plan-loop.svg` keeps `viewBox="0 0 1040 889"`, and `pipeline.svg` is byte for byte as it was.

2. `skills/diagnose/SKILL.md`, Steps 4, line 108 (Standards 2, your points 2 and 4). The bullet "For `premise`, a red command that is green on main's head shows a false premise, which goes to `/spec` as its Steps 2 handles one, and the diagnosis ends there." becomes these four bullets, at the same indent:

   ```
   - For `premise`, a command that drives the code path of the symptom and is green on main's head shows a false premise, and neither the stop "No red command" nor the cause not found then applies.
   - The record's Cause section then says "false premise", with the green runs quoted.
   - `/spec` handles the false premise as its Steps 2 says.
   - The diagnosis then goes to Steps 21 and 22, without Steps 5 to 20 and 23.
   ```

3. `skills/spec/SKILL.md`, Steps 4: one sub-bullet after "A cause that stands in the step's Step 0 already is not investigated again." and at its indent:

   ```
   - A diagnosis that ends on a false premise is handled as Steps 2 handles a premise found false.
   ```

4. The record and the booking get words for a false premise (Standards 3).
   - `skills/diagnose/templates/diagnosis.md`, "Cause", line 78: before the closing `>`, after "and the condition that makes it not found", these words are added: ``; or for `premise` "false premise", with the green runs above``.
   - `skills/land/SKILL.md`, Steps 9, line 93: "with its cause, or with "cause not found" and the open item it was raised as." becomes "with its cause, or with "cause not found" and the open item it was raised as, or with "false premise"."

5. `skills/spec/SKILL.md`, Steps 5 (Standards 4, your point 3).
   - Line 135: "This run leaves nothing." becomes "This run leaves only what a diagnosis of Steps 4 wrote: its record and its lines in the step's Step 0." The line's second sentence stays.
   - One bullet after the bullet "`plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made." and at its indent:

     ```
     - What the diagnosis of Steps 4 wrote in the step's Step 0 is then written into `plan.md` again.
     ```

6. One rule per bullet (Standards 5, your point 4).
   - `skills/spec/SKILL.md`, line 121 becomes two bullets at the same indent:

     ```
     - The diagnosis record and what the diagnosis wrote in the step's Step 0 are among the session's own records (Steps 1).
     - A step that waits at Steps 5 keeps them.
     ```

   - `skills/diagnose/SKILL.md`, line 65: "The first fills the record as opened, and each later one is appended under a heading that quotes its part." becomes "The first fills the record as opened."

7. `skills/diagnose/SKILL.md`, Steps 22 (Standards 6, your point 5): one sub-bullet, the first under "Clean up, keeping the record.", before its two "Done when" lines:

   ```
   - Inside a plan, a session run by hand that ends before the next command of the sequence commits by path each ledger file the diagnosis wrote (the record, `plan.md`, the state file).
   ```

8. `skills/diagnose/SKILL.md`, Steps 2, line 64 (Standards 7) becomes:

   ```
   - For `premise`, each part "What it reads" 5 finds whose cause does not stand in the step's Step 0 already gets a diagnosis of its own, in the order of the step's text.
   ```

9. `skills/diagnose/SKILL.md`, "What it reads" 5, line 52 (Standards 8) becomes:

   ```
   - For `premise`, the step's text: its line in the step list of `plan.md`, the rulings that touch it and what its Step 0 holds, as the `spec` skill's "What it reads" 4 reads them.
   ```

10. "its part" gets its antecedent (Standards 9).
    - `skills/diagnose/templates/diagnosis.md`, line 3: "which names its finding or quotes its part." becomes "which names its finding or quotes the part of the step's text it is for."
    - `skills/diagnose/templates/diagnosis.md`, line 7: "with that part quoted" becomes "with the part of the step's text that asks for the cause quoted".
    - `skills/diagnose/SKILL.md`, line 63: "which names its finding or quotes its part." becomes "which names its finding or quotes the part of the step's text it is for."

11. `skills/plan-orchestration/SKILL.md`, "Rules", line 332: "(`/spec`, `/refute`, `/land`, `academic-paper`" becomes "(`/spec`, `/refute`, `/land`, `/diagnose`, `academic-paper`". The loop invokes `/diagnose` at its Steps 8 and 9, and `/spec` now runs it, so the rule names it.

12. The report, part 3 (Standards 10): R2, R3 and R5 quote each output line whole, with no "...".

Rulings on the other points: Spec, Proof and Behaviour none need nothing. Your point 6 needs no change: `plan-orchestration` Steps 3 and 6 already use the row "A finding that is the user's" for a refusal and for a case. The points under "Declined to judge" need no change in this round.

## Verify before you report

Run from the worktree's root, each must hold:

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` ends `checks: 11 commands passed` and exits 0.
2. Each text this round dictates is in its file once, whole, checked as the brief's "Verify" 2 says (`grep -c -F -f <one-line file> <file>` prints 1; the sentence of item 10 prints 1 in the template and 1 in the skill). The same check prints 0 for each text the round replaces: "The first five rows are stops" in `skills/spec/SKILL.md`, the old line 108, the old line 121, the old line 65, the old line 64, the old line 52, "This run leaves nothing.", "quotes its part" in both files, and "with that part quoted".
3. `python3 docs/figures/gen_figures.py` exits 0, and a second run leaves `git status --short` as it was. `grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/plan-loop.svg` prints `viewBox="0 0 1040 889"`. `git diff --stat` does not list `docs/figures/pipeline.svg`. `rsvg-convert docs/figures/plan-loop.svg -o "$TMPDIR/plan-loop.png"`, and the render read: the `/spec` box lists six stops, the last "A cause not found, from /diagnose", inside the box, and no other box moved.
4. `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py` prints `All checks passed!`, and `ruff format --check --line-length 100 docs/figures/gen_figures.py` prints `1 file already formatted`.
5. `git diff --stat` shows ten files and no other outside the ledger: the seven of the brief, `skills/land/SKILL.md`, `docs/figures/gen_figures.py` and `docs/figures/plan-loop.svg`. `LC_ALL=C grep -n '[^ -~]'` over the nine text files prints nothing; its exit status is given.
6. Reading: the table of `spec` "Stops" has six stops, then the refusals, and its opening sentence says six. `git grep -n 'false premise' -- skills` is read, and no two hits disagree on where a false premise of `premise` goes. Steps 4 and Steps 22 of `diagnose` and Steps 4 and 5 of `spec` each still end on their completion criterion where they had one.
7. `git grep -n 'A cause not found\|cause not found' -- skills docs README.md ':!docs/figures/*.svg'`: each hit is read against the new row, and a sentence that lists `/spec`'s stops and leaves this one out is named in the report.

## Report

Rewrite `.scratch/2-f-diagnose/agents/reviews/2b-report.md` whole, in the shape the brief gives, for the tree as it is after this round: the first line; the open items of the state file verbatim; the cases' first read as it was, with each output line whole; the DONE / NOT DONE table for the brief's items and checks as they now stand, and a second table "Round 1" with one row per item 1 to 12 above and per check 1 to 7, each output verbatim; the terms, complete; the sentences longer than the standards allow, each with its reason; files with line counts; every judgment call; visible changes with before and after; anything wrong or impossible in this round's text, with the evidence. Your final message is the report's text.
