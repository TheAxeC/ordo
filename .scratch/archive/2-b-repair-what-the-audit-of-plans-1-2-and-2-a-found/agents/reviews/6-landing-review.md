# Step 6, the review of the landing fixes

Reviewer: a fresh claude:opus agent, read-only, over the unstaged landing fixes on main; usage 105,908 tokens, 26 tool uses, 375 s (the runner's completion notification).

## Spec

1. `skills/plan-retro/SKILL.md:15`, "the retro over every refuter run the previous retro did not read". With the landing fix at Steps 8 (line 54), the previous retro also lists runs it carried over from earlier retros. The collector did not read those runs (`--exclude-listed` left them out), yet the next retro skips them. The Quick start line is now false. It should say "did not list".
2. `skills/plan-retro/SKILL.md:54`, "every entry of the previous retro's "Reports read", carried over, together with each report in the collector's output ...; a report in both lists has its runs joined, so a run listed once stays skipped by every later retro." The mechanism is sound and matches the collector. `listed()` keys on (plan, step, run) (`collect_findings.py:227-262`), the entry form is the one in `templates/retro.md:7`, and a report given twice is accepted (the test's "an entry given twice" case). The text does not say what happens when there is no previous retro, even though the first clause depends on one. What it reads 3 and Steps 1 do not say it either.
3. `skills/plan-retro/SKILL.md:51-52` against the new Grouping bullet at line 72. Steps 6 marks any kind that appears in at least three steps or two plans as recurring, and Steps 7 drafts a proposal for every recurring kind. Neither step exempts "no defect", and the archive's no-defect items already span two or more plans (6-report.md:415-425 lists plans 1 and 2). So Steps 6 and 7 require a proposal for the kind that Grouping says gets none. (This is also Behaviour 1 below.)

## Proof

none

## Standards

1. `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/6-report.md:5`, the note "The sections before "Repair round 1" describe the first build: their figures (...) are superseded ...". Checked against the report's content:
   - It names only "figures" and three topics. It does not name the parts of the first-run sections that state a superseded state without being figures:
     - the DONE rows 5 and 7 (line 20, "compares by real path | DONE"; line 22, "18/18, 23/23");
     - the whole "Reverts" section (lines 108-305), whose edits target code the collector no longer has (line 139 `return {os.path.realpath(path) for path in quoted}`);
     - the Verification remark at line 67, "the retro template lists each report as a backtick-quoted path ..., which is what `--exclude-listed` now reads";
     - line 351, "`git status --short` shows these three files modified and nothing else".
   - "The sections before "Repair round 1"" also takes in the Open items block (line 7), which is current. It also takes in "The test, red first" (line 70), which the round's ruling-3 row (around line 405) calls current: "DONE | "The test, red first" above holds the final test's run against the base collector". The note and that row contradict each other.
   - The report's first line (line 3) and the round's first line (line 394) still state the Stop as NOT DONE: "the forms are the orchestrator's to widen". The refuter ruled that the forms are not widened (Behaviour 3, first point), and the landing's Grouping bullet settles the 1/13 item. The note leaves both NOT DONE lines as they are, so the report's first line is not the end state.
   - It points at "`plan.md` (the booking of step 6)". `grep -n '^#' plan.md` lists booking sections for steps 1, 2, 3 and 5 only, so that reference is false until `/land` writes the step 6 booking.
   - The finding asked for more than this: "The fix is one report in the end state, with the first-run sections rewritten or removed." The Closed entry in `6-refuter.md` reduces that to "a note that names ... superseded". That is a smaller job than the finding asked for, and the report still carries two NOT DONE lines, two open-items blocks (lines 7 and 396) and two sets of Files and User-visible changes.
2. `README.md:119`. The last sentence, "With `--exclude-listed`, the runs ... are skipped by plan folder, step and run, also after the plan moves into the archive, while a round added later is read; a retro with no such heading, a missing retro, one that is not UTF-8, and an entry or a run in another form are refused.", is 59 words joined by a semicolon. That breaks prose-standard E (sentence length), which is the rule the finding cited. Measured by splitting line 119 into sentences with `python3 -B`: 47, 36, 16, 13, 26, 34+25 words.
   - The fifth sentence joins two unrelated facts: "A continuation line indented with spaces or a tab joins its finding, and a report is read once when the archive sits inside the ledger root." That breaks D, one idea per sentence and paragraph.
   - "each near miss of those forms": the antecedent is the singular "a form that reports nothing".
   - Every claim checked is true of `skills/plan-retro/templates/collect_findings.test.sh`:
     - numbered headings: `## 1. Spec`, line 68;
     - a colon, a full stop, closing hashes and a parenthetical: lines 273, 284, 288, 292;
     - rounds with subheadings (line 185) and without (line 94 onward);
     - Verification lines, Closures, Not checked, Usage and Closed: lines 141, 192, 196, 177/216, 181/221, 113/225;
     - tilde and four-backtick fences: lines 155, 166, 277;
     - the tab continuation case (head comment line 24);
     - the archive inside the ledger root (line 305);
     - the move into the archive (line 395);
     - the refusals: no heading, missing, not UTF-8, old form, run form (lines 437-451).
3. `skills/plan-retro/SKILL.md:54`. The bullet is one 59-word sentence (`wc -w`) with a semicolon, holding two rules: carry the entries over, and join a report's runs. That breaks the skill-layout rule "One rule per bullet" and prose-standard E. `check_skill_layout.py` does not catch it (it prints `ok:`).
4. `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md:18`, the step 1a addition: "`sh utils/verify.test.sh` red under each revert ; and `refute` ("What it writes") and its `templates/report.md` say ...".
   - There is a stray space before the semicolon.
   - `refute` has no "What it writes" section. `grep -n '^##' skills/refute/SKILL.md` lists Quick start, Use instead, What it reads, Steps, Over a repair round, The four headings, Finding dispositions, Stops, Anti-patterns and Rules. The section that fits is "The four headings".
5. `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md:86`, the 1a booked line: "(`plan.md`, step 1a; from `agents/reviews/1-refuter.md`, Closed; and the `refute` text and report template on what a list item under the four headings is (`agents/reviews/6-refuter.md`, Closed)." The parentheses do not balance (3 open, 2 close, counted with `python3 -B`). The added work item also sits inside the parenthetical that names the sources, not in the list of work.

## Behaviour

1. `skills/plan-retro/SKILL.md:72`, "is set aside as the kind "no defect": counted and listed, with no proposal". It does not agree with the rest of the skill or with `templates/retro.md`:
   - Steps 6 and 7 (lines 51-52) make the kind recurring and give it a proposal (Spec 3).
   - Steps 8 has no bullet for where the kind goes.
   - `templates/retro.md` has no place where the kind's findings are listed. "Recurring kinds" (lines 19-28) carries a Proposal and a Decision line. "Other kinds" (lines 30-34) is a table of Kind, Findings, Steps and Plans, with counts only.
   - So "listed" has no place in the template, and the kind lands among the recurring kinds with a proposal slot.
   - The fix belongs in Steps 6 (exclude the kind), Steps 8 (where it is written) and `templates/retro.md` (a section or row for it). The landing touched none of these.
2. Bookings against the Closed section of `6-refuter.md`:
   - `plan.md:24` (6a) carries Behaviour 1, Behaviour 2, Proof 1, Proof 2 and Proof 3 ("the complete list of archived items that report no defect").
   - `orchestrator-state.md:89` (the booked list) carries Behaviour 1, Behaviour 2, Proof 1 and Proof 2. It drops Proof 3 (the incomplete list and the recount) and "each red under its revert", so the state file's booking is missing one of the five findings the Closed section says it carries.
   - `plan.md:18` (1a) drops the refuter's "or into a paragraph" from "a confirmation goes under Verification or into a paragraph". The Closed section drops it as well.
   - Neither 6a nor the Closed section names the 2.A/2 difference (hand count 19 against the collector's 21, Proof 3). It is covered only implicitly by "the complete list".

## Verification

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md   (repository root, output to a scratch file)
exit 0
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
$ LC_ALL=C grep -n '[^ -~]' skills/plan-retro/templates/collect_findings.py skills/plan-retro/templates/collect_findings.test.sh; echo "grep exit $?"
grep exit 1          (no output)
$ LC_ALL=C grep -n '[^ -~]' skills/plan-retro/SKILL.md skills/plan-retro/templates/retro.md README.md; echo $?
1                    (no output)
$ LC_ALL=C grep -c '[^ -~]' <ledger files>: plan.md 4, orchestrator-state.md 0, 6-report.md 0, 6-refuter.md 0
$ perl -CSD -ne '... [^\x20-\x7E\x{2705}\n] ...' plan.md   -> no output (the 4 are the allowed check mark)
$ python3 -B utils/check_skill_layout.py skills/plan-retro; echo "exit $?"
ok: skills/plan-retro/SKILL.md
exit 0
$ git diff --name-only (unstaged): 6-refuter.md, 6-report.md, orchestrator-state.md, plan.md, README.md, skills/plan-retro/SKILL.md
$ git diff --cached --name-only: 6-report.md, README.md, skills/plan-retro/SKILL.md, collect_findings.py, collect_findings.test.sh, retro.md
```

No non-md file is changed by the unstaged landing fixes. The ASCII grep ran over the staged non-md files, the collector and its test.

## Not checked

- The staged diff of `collect_findings.py` and `collect_findings.test.sh` beyond `listed()` (lines 227-262) and the test's head comment, fixture headings and refusal cases.
- The refuter's three-retro probe was not rerun against the new Steps 8 text. Steps 8 is prose, so the carry-over was checked by reading it against `listed()` only.
- Whether `/land` will write the step 6 booking section in `plan.md` that the report's note points to.
- The first-run "The test, red first" output (6-report.md:70-107) was not rerun, so which side of the note's contradiction with ruling 3's row is true of the final test was not settled.
