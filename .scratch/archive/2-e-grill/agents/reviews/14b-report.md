Everything in the brief is done.

# Report: step 14b, the judge of a blind comparison is kept off the text of the skills compared

## Open items of the state file (verbatim)

```
- None.
```

(`sed -n '55,58p' .scratch/2-e-grill/orchestrator-state.md` on main.)

## The first read of the cases, on the unchanged tree

Read as `grep -n` prints it on the unchanged `docs/dev/blind-comparison.md` (identical to main's copy: `diff -q` printed nothing). The page had 19 lines; line 8 is item 4 (`8:4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.`), and `grep -n -i "remov\|copy\|plan.md\|standard\|listed\|loadable\|process\|served\|model"` hit only lines 5 and 6 (item 1's copy of the input for each side, item 2's removal of marks from outputs).

| Case | Result on the unchanged tree |
|---|---|
| C1 | Not met. No line removes `skills/grill/` from the judge's copy (only line 5 copies, for the sides), none keeps a record of a removal (lines 13 to 19 list no path), none tells the judge that no skill's text is the standard, none says how the judge runs. |
| C2 | Not met. `grep -n -i "none"` prints nothing, so the record has no "none"; there is no instruction on the standard and no rule on the process. |
| C3 | Not met. No line copies a source into a copy or removes a skill's files from one; nothing stops a judge reading a source in place. |
| C4 | Not met. No line says how the judge's process is started, so the runner's listing of installed skills reaches it. |
| C5 | Not met, and contradicted. Line 8 says "nothing else", and `grep -n -i "cite\|resolve\|nothing else\|URL"` prints line 9, which counts "a citation that does not resolve" as a critical failure, so a judge cannot check a citation without reading beyond "nothing else". |
| C6 | Holds. Items 1 to 3 and 5 to 8 are lines 5 to 7 and 9 to 12; item 2 (line 6) removes marks from outputs and no line removes files. |

Cases the brief's rules got wrong: none that stops the build. The three points below are where the dictated text and a case or another line do not fully agree. The text is written as the brief has it, and each is the orchestrator's to rule on.

1. C1 and line 8. C1 keeps `.scratch/2-e-grill/plan.md` in the judge's copy. That file holds the gate and a statement that `grill` "wins or ties" (`grep -n "wins or ties" .scratch/2-e-grill/plan.md` prints lines 11 and 51) and names both skills, while line 8 (kept) reads "no skill name, no gate, no statement of which output is expected to win". Read as "the orchestrator adds none of these to what it gives the judge", the input may hold them and C1 is met. Read as "the judge's copy holds none of these", C1 contradicts line 8. The brief's Decision 2 resolves only the new bullet 6 against line 8, not the copy's content.
2. C3 and the bullet "The judge may open a file or a URL an output cites". C3 says the judge does not read the sources in place. An output that cites a file of a source repository by its absolute in-place path (as the step 14 judges' outputs cite `research-hub` files) gives the judge permission to open that path in place, since that bullet excepts only "a file of either skill". The exposure to skill text is the same as in the copy, because the skills' files are excepted; the sentence of C3 holds for files no output cites.
3. C4 and the process. The bullet says the process "lists and loads no skill". Whether a process started with `--disable-slash-commands` from the copy also reads the copy's `CLAUDE.md` (the Ordo tree's lists project skills by name) and the user's global `~/.claude` instructions is not verified: no `claude` process was started in this step.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. Eight sub-bullets under item 4, at three spaces, each as given | DONE | `grep -n` of the page prints them as lines 9 to 16; the `diff -U2` below shows them. |
| 2. Two lines in item 9 after `- the input, or its path;` at three spaces | DONE | `grep -n` prints them as lines 23 and 24, after line 22 `   - the input, or its path;`. |
| Verify 1, the runner | DONE | Quoted below, exit 0. |
| Verify 2, each new line once | DONE | Quoted below, ten lines, each 1. |
| Verify 3, only the changes of items 1 and 2 | DONE | Quoted below. |
| Verify 4, ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md` printed nothing, exit 1. |
| Verify 5, the walk of C1 to C6 | DONE | Below. |

### Verify 1

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` (run after both edits, exit 0). Its output:

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

### Verify 2

Each new line written as the one line of its own scratch file, then `grep -c -F -x -f <that file> docs/dev/blind-comparison.md`:

```
1: 1
2: 1
3: 1
4: 1
5: 1
6: 1
7: 1
8: 1
9: 1
10: 1
```

(1 to 8 are the sub-bullets of item 4 in order, 9 and 10 are the two lines of item 9.)

### Verify 3

`diff -U2 /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md docs/dev/blind-comparison.md` (exit 1, the files differ):

```
--- /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md 2026-09-29 15:12:25
+++ docs/dev/blind-comparison.md 2026-09-30 22:13:20
@@ -7,4 +7,12 @@
 3. **Random order.** The judge sees the two outputs in random order. A command whose result the orchestrator does not choose prints which output is A, and the other is B, for example `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`. The orchestrator keeps the command and its output with the key.
 4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.
+   - The judge receives no file of either skill being compared.
+   - The orchestrator removes the files of both skills from the judge's copy of the input, and lists each path it removes.
+   - The orchestrator copies into the judge's copy each source the input names, such as another repository an entry reads, and removes the files of both skills from those copies too.
+   - The judge runs as its own process, started from its copy of the input, that lists and loads no skill, on the model the configuration's `reviewer` names, such as `claude -p --disable-slash-commands --model opus --output-format json`.
+   - The orchestrator reads the judge's served model from that process's output, the `modelUsage` of its JSON.
+   - The orchestrator tells the judge to judge each output by what the input and its user need, and that no skill's text, wherever the input quotes it, is the standard. This sentence names no skill and says nothing of which output is expected to win.
+   - The judge may open a file or a URL an output cites, to check that it resolves and says what the output claims, except a file of either skill.
+   - The judge opens no other file outside its copy of the input.
 5. **Reading.** The judge reads each output whole, and for each lists its critical failures before stating a preference. A critical failure is one that makes the output unfit for the purpose the input sets. For example, a claim the input contradicts, a missing part the input asks for and a citation that does not resolve are critical failures. The judge quotes each critical failure with its place.
 6. **The verdict.** The judge writes the verdict, A, B or a tie, with the reasons, each reason pointing at the failures or the passages it rests on.
@@ -13,4 +21,6 @@
 9. **The record.** The orchestrator keeps the comparison in the ledger of the plan whose gate needs it, at `agents/reviews/<step>-blind-comparison.md`. The record holds:
    - the input, or its path;
+   - each path removed from the judge's copy of the input and of its sources (item 4), or "none";
+   - each judge's command and its served model (item 4);
    - the two outputs as judged;
    - the key;
```

### Verify 5, the walk on the changed page

Lines as `grep -n` prints them on the changed file.

- C1. Line 10 (`The orchestrator removes the files of both skills from the judge's copy of the input, and lists each path it removes.`) removes `skills/grill/` from the copy and lists it; line 23 (`each path removed from the judge's copy of the input and of its sources (item 4), or "none";`) puts it in the record. Nothing on the page removes `.scratch/2-e-grill/plan.md`, so it stays in the copy. Line 14 (`The orchestrator tells the judge to judge each output by what the input and its user need, and that no skill's text, wherever the input quotes it, is the standard...`) covers the skill text plan.md quotes. Line 12 (`The judge runs as its own process, started from its copy of the input, that lists and loads no skill...`) lists and loads no skill. Line 9 (`The judge receives no file of either skill being compared.`) holds for the copy. Met, with point 1 above on plan.md against line 8.
- C2. Line 10 removes nothing when the input holds no skill file, and line 23 gives "none". Line 14 (the instruction on the standard) and line 12 (no skill listed) apply to any input, a record quoting skill text included. Met.
- C3. Line 11 (`The orchestrator copies into the judge's copy each source the input names, such as another repository an entry reads, and removes the files of both skills from those copies too.`) copies `research-hub` or the `cathedra` sources and removes `.agents/skills/grill-with-docs`; line 16 (`The judge opens no other file outside its copy of the input.`) stops reading in place, except the cited-file permission of line 15 (point 2 above); line 23 lists the paths removed "from the judge's copy of the input and of its sources". Met, with point 2.
- C4. Line 12: the process lists and loads no skill, so `~/.claude/skills/grill` is not shown to the judge; it is outside the judge's copy, and line 16 (`The judge opens no other file outside its copy of the input.`) and line 15's exception for "a file of either skill" keep the judge from opening it. Met, with point 3 (not verified).
- C5. Line 15 (`The judge may open a file or a URL an output cites, to check that it resolves and says what the output claims, except a file of either skill.`) lets the judge open `https://docs.vale.sh/...` for item 5's "a citation that does not resolve" (line 17); the same line refuses a cited file of either skill. Met.
- C6. Line 5 (item 1), line 6 (item 2), line 7 (item 3), line 17 (item 5), lines 18 to 20 (items 6 to 8) are unchanged in the `diff -U2` above, and `grep -n "^[1-9]\. "` prints items 1 to 9 at lines 5 to 8, 17 to 21. Line 6 (item 2) removes marks from outputs; line 10 removes files from the judge's copy. Met.

## Files changed

- `docs/dev/blind-comparison.md`: 19 lines before, 29 lines after (`wc -l`), 10 lines added.
- `.scratch/2-e-grill/agents/reviews/14b-report.md`: this report.

## Sentences about the page as a whole, reread

- Line 3 (`The comparison that gate names runs as the steps below say.`) holds: items 1 to 9 are still the steps.
- Line 8, item 4's first sentence, is unchanged and still the opening sentence of the item.
- Every page that restates item 4: `grep -rn -i -e "judge's input" -e "judge receives" -e "judge gets" -e "blind-comparison" skills utils docs README.md` prints only `docs/roadmap.md:208` (`Waits on: 2.E, for step 14b's judge's input`, still true), the glossary's entries at lines 130, 133 and 137 (none says what the judge is given), `docs/dev/change-standard.md:21` (names the comparison) and this page. Nothing else is changed.

## Judgment calls the brief left open

None. Each text is as the brief gives it, at its indent.

## User-visible change, before and after

- Item 4 before: line 8 alone. After: line 8 and eight sub-bullets (lines 9 to 16), each stated above.
- Item 9 before: seven lines in the record (`the input, or its path;` to `the user's call, with the reasons.`). After: nine, with lines 23 and 24 new.

## Anything in the brief that was wrong or impossible

Nothing impossible. Points 1 to 3 of "The first read of the cases" are the places where a case and the dictated text are not fully aligned; the text stays as the brief has it and the rulings are the orchestrator's.


# Repair round 1

Nothing is left undone in the round's three rulings.

## Rulings, before and after

1. Item 4's sub-bullets. Before: eight sub-bullets (lines 9 to 16): "The judge receives no file of either skill being compared." to "The judge opens no other file outside its copy of the input." After: the 22 lines the round's brief gives, at three spaces, lines 9 to 30 of `docs/dev/blind-comparison.md`; the first, "The judge receives no file of either skill being compared.", is unchanged and the last reads "The judge opens no file outside its copy of the input."
2. Item 7. Before: `A fresh agent makes each judgment, so the second judge has no memory of the first.` After: `A fresh judge process (item 4) makes each judgment, so the second judge has no memory of the first.` The rest of line 33 is unchanged (the `diff -U2` below).
3. Item 9's record. Before: `   - each path removed from the judge's copy of the input and of its sources (item 4), or "none";` and `   - each judge's command and its served model (item 4);`. After: lines 37 to 39, the three lines the round's brief gives.

## Check 1

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` (exit 0). Its output:

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

## Check 2

Each new or changed line (the 22 sub-bullets, the three record lines, item 7's changed line: 26 lines) written as the one line of its own scratch file, then `grep -c -F -x -f <that file> docs/dev/blind-comparison.md`:

```
1: 1
2: 1
3: 1
4: 1
5: 1
6: 1
7: 1
8: 1
9: 1
10: 1
11: 1
12: 1
13: 1
14: 1
15: 1
16: 1
17: 1
18: 1
19: 1
20: 1
21: 1
22: 1
23: 1
24: 1
25: 1
26: 1
```

The lines replaced (the seven replaced sub-bullets of item 4, the two replaced record lines, and item 7's old sentence) each print 0 under the same command, and `grep -c "A fresh agent makes" docs/dev/blind-comparison.md` prints 0.

## Check 3

`diff -U2 /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md docs/dev/blind-comparison.md` (exit 1, the files differ; the tab after each header's file name is written as a space):

```
--- /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md 2026-09-29 15:12:25
+++ docs/dev/blind-comparison.md 2026-09-30 22:30:06
@@ -7,10 +7,35 @@
 3. **Random order.** The judge sees the two outputs in random order. A command whose result the orchestrator does not choose prints which output is A, and the other is B, for example `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`. The orchestrator keeps the command and its output with the key.
 4. **The judge's input.** The judge receives the two outputs with only the input, and nothing else: no skill name, no gate, no statement of which output is expected to win.
+   - The judge receives no file of either skill being compared.
+   - A file of a skill is each file of its folder, and each other file that holds the skill's text whole or in most part, such as a diff that adds it or a copy under another name.
+   - The orchestrator removes the files of both skills from the judge's copy of the input.
+   - The orchestrator removes from the judge's copy the ledger of each plan that builds or changes either skill.
+   - The orchestrator keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry.
+   - The orchestrator removes from the judge's copy every other line that states the comparison's gate, names the comparison, or says which output is expected to win.
+   - The orchestrator copies into the judge's copy each file or folder the input names as a source.
+   - A repository is copied whole only when the input names the repository and no path inside it.
+   - The orchestrator copies into the judge's copy each file an output cites that is outside the copy, except a file of either skill.
+   - The orchestrator removes the files of both skills from each copied source and cited file.
+   - The judge runs as its own process, not as an agent the orchestrator's runner starts.
+   - The judge's process starts in its copy of the input.
+   - The judge's process lists and loads no skill.
+   - The judge's process may fetch a URL, and has no other permission beyond reading its copy.
+   - The judge's process runs on the model the configuration's `reviewer` names, such as `claude -p --disable-slash-commands --allowedTools WebFetch --model opus --output-format json`.
+   - The judge's served model is the key of the process's `modelUsage` with the most output tokens.
+   - The judge's process loads the user's global instructions, which are part of what the user needs.
+   - The orchestrator tells the judge to judge each output by what the input and its user need.
+   - The orchestrator tells the judge that no skill's text, wherever the input quotes it, is the standard.
+   - Neither instruction names a skill or says which output is expected to win.
+   - The judge may fetch a URL an output cites, to check that it resolves and says what the output claims.
+   - The judge opens no file outside its copy of the input.
 5. **Reading.** The judge reads each output whole, and for each lists its critical failures before stating a preference. A critical failure is one that makes the output unfit for the purpose the input sets. For example, a claim the input contradicts, a missing part the input asks for and a citation that does not resolve are critical failures. The judge quotes each critical failure with its place.
 6. **The verdict.** The judge writes the verdict, A, B or a tie, with the reasons, each reason pointing at the failures or the passages it rests on.
-7. **Twice, the order swapped.** The orchestrator has the comparison judged twice, the second time with the order swapped: the output that was A is given as B, and the output that was B as A. A fresh agent makes each judgment, so the second judge has no memory of the first. When the two verdicts, read through the key, differ, the disagreement is a tie; when they agree, the result is the verdict they share.
+7. **Twice, the order swapped.** The orchestrator has the comparison judged twice, the second time with the order swapped: the output that was A is given as B, and the output that was B as A. A fresh judge process (item 4) makes each judgment, so the second judge has no memory of the first. When the two verdicts, read through the key, differ, the disagreement is a tie; when they agree, the result is the verdict they share.
 8. **The final call.** The user reads the input, both outputs and both verdicts, and makes the final call: the new skill wins, ties or loses. The user's call is the result the gate reads, and "wins or ties" in a gate means the call is a win or a tie.
 9. **The record.** The orchestrator keeps the comparison in the ledger of the plan whose gate needs it, at `agents/reviews/<step>-blind-comparison.md`. The record holds:
    - the input, or its path;
+   - each path removed from the judge's copy, and each line removed from a file of it (item 4), or "none";
+   - each file and folder copied into the judge's copy (item 4), or "none";
+   - each judge's command, every key of its `modelUsage`, and the global instruction files it loaded (item 4);
    - the two outputs as judged;
    - the key;
```

## Check 4

`LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md` printed nothing (exit 1). The file has 44 lines (`wc -l`).

## Check 5, the walk of C1 to C9 on the changed page

Lines as `grep -n ""` prints them on the changed file.

- C1. Line 11 (`The orchestrator removes the files of both skills from the judge's copy of the input.`) removes `skills/grill/`. Line 10 (`A file of a skill is each file of its folder, and each other file that holds the skill's text whole or in most part, such as a diff that adds it or a copy under a...`) makes `12-round-0.diff` a skill file, and line 12 (`The orchestrator removes from the judge's copy the ledger of each plan that builds or changes either skill.`) removes `.scratch/2-e-grill/` with `12-report.md` and `9a-report.md`. Line 13 (`The orchestrator keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry.`) keeps the bullets naming entry 3, "Entry 3 and step 13" among them. Line 14 (`The orchestrator removes from the judge's copy every other line that states the comparison's gate, names the comparison, or says which output is expected to win.`) removes the gate line of entry 2.E in `docs/roadmap.md`. Line 21 (`The judge's process lists and loads no skill.`), lines 26 and 27 (the two instructions) and line 28 (`Neither instruction names a skill or says which output is expected to win.`) hold. Line 37 records each path and line removed. Met: the judge is not told the gate and no file of the copy holds grill's text whole. Files that quote part of it, such as the glossary's grill terms, stay, and line 27 covers them.
- C2. A record quoting skill text, holding no skill file: line 11 removes nothing because no file is a skill's (line 10), line 12 finds no ledger of a plan that builds a skill in it, and line 37 gives "none" when line 14 removes no line. Lines 21, 26 and 27 still apply. Met.
- C3. Sources in another repository: line 15 (`The orchestrator copies into the judge's copy each file or folder the input names as a source.`) copies them, line 18 (`The orchestrator removes the files of both skills from each copied source and cited file.`) removes `.agents/skills/grill-with-docs` from them, line 30 (`The judge opens no file outside its copy of the input.`) stops reading in place, and line 38 records the copies. Met.
- C4. An installed copy (`~/.claude/skills/grill`): line 21 lists and loads no skill, and line 30 excludes it as outside the copy. Met. Line 29 lets the judge fetch a URL only, so it is not a route to a local file.
- C5. Side 1 cites `https://docs.vale.sh/topics/styles.md`: line 29 (`The judge may fetch a URL an output cites, to check that it resolves and says what the output claims.`) with line 22 (`The judge's process may fetch a URL, and has no other permission beyond reading its copy.`) lets the judge fetch it. An output citing `research-hub/projects/manuscripts/bttn-incident-af/main.tex`: line 17 (`The orchestrator copies into the judge's copy each file an output cites that is outside the copy, except a file of either skill.`) copies it, and line 38 records it. A cited file of either skill is not copied (line 17) and is removed from any copy (line 18). Met.
- C6. Items 1 to 3, 5, 6 and 8 (lines 5 to 7, 31, 32 and 34) are unchanged in the `diff -U2` above. Item 7 (line 33) changes only `A fresh agent` to `A fresh judge process (item 4)`, as ruling 2 gives. Item 2 (line 6) removes marks from outputs and lines 11 to 14 remove files and lines from the judge's copy. Met.
- C7. Step 14's input names research-hub paths as entry 3's sources: line 15 copies those paths, and line 16 (`A repository is copied whole only when the input names the repository and no path inside it.`) does not apply, so the 26G repository is not copied. Met.
- C8. A run that fetches a URL: line 24 (`The judge's served model is the key of the process's `modelUsage` with the most output tokens.`) gives the reviewer model as the served model when a helper model's key is also present, and line 39 (`each judge's command, every key of its `modelUsage`, and the global instruction files it loaded (item 4);`) records both keys. Met.
- C9. Line 25 (`The judge's process loads the user's global instructions, which are part of what the user needs.`) lets `~/.claude/CLAUDE.md` and `~/.claude/rules/` load, and line 39 records the files loaded. Met.

Not verified, since no `claude` process was started: the command on line 23 with `--allowedTools WebFetch`, that `modelUsage` holds a helper key once a fetch runs, and how the orchestrator learns which global instruction files the process loaded (line 39).

## Other pages

`grep -rn -i -e "fresh agent" -e "fresh judge" -e "judge's copy" -e "judge process" skills utils docs README.md` (outside the blind-comparison page) prints no line about the judge of a blind comparison; `docs/glossary.md:130` says "two fresh judges", still true. No other page changes.

## Files changed in the round

- `docs/dev/blind-comparison.md`: 29 lines before the round, 44 after (`wc -l`).
- `.scratch/2-e-grill/agents/reviews/14b-report.md`: this section.
