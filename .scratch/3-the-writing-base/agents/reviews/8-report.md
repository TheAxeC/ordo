NOT DONE: the step's check does not hold. Of the manuscript run's 228 rows, 48 are not marked right by both markers, and of the grant run's 74 rows, 35. Gate conditions 2, 5 and 6 fail on the runs. Conditions 1, 3, 4 and 7 hold, condition 4 with the turn shape changed at the user's instruction. Each failure is listed under its condition below and in `8-marks.md`. By ruling I, step 9 fixes each with no further run, so no open item is raised.

# Report of step 8 of plan 3, the fourth runs of /writing, the last runs

## Open items of the state file

none

## The cases' first run

The brief's first run, `ls .scratch/3-the-writing-base/agents/reviews/8-run .scratch/3-the-writing-base/agents/reviews/8-marks.md` before the runs, was not run then. The unchanged tree is read from the base commit instead: `git ls-tree -r --name-only a34bfbf -- .scratch/3-the-writing-base/agents/reviews/8-run .scratch/3-the-writing-base/agents/reviews/8-marks.md` prints nothing (`ls-tree exit 0`), and the session's transcript shows `8-run/` made first by `mkdir -p 8-run` at entry 41349, after both runs. So none of the record existed for any of the twelve cases. After the step:

- C1: met. The manuscript report's 251 place checks under "Place checks" all print `1`. Every place, list entries included, is `file:line` with its path from the main file's folder, and nearly every finding stands in an included file, such as `sections/abstract/abstract.tex:3`.
- C2: met. The grant report's 100 place checks all print `1`, and the header place is `paragraph 64 [word/header1.xml]`.
- C3: not met. Every group is named by page and section and has one line. Three manuscript lines and five grant lines do not meet "How you group them", as condition 2 lists.
- C4: not met. The tense list entry at `sections/4_experiments/b_implementation.tex:3` gives "is given in finding 6.4" in place of a replacement, and finding 5.2 gives its "Clear antecedents" fix as an instruction ("begin the sentence with ..."). Every other finding quotes its passage and gives text or "delete".
- C5: met for both runs, with the evidence under condition 3.
- C6: met for both runs, with the evidence under condition 3.
- C7: met for both runs on the writes and reads, with the evidence under condition 4. The turn shape differs from the brief's at the user's instruction, as condition 4 says.
- C8: met after one resume of two markers, apart from the manuscript marker 1 command that condition 6 names. Every row has two marks, each with a reason of its own that says whether the passage stands and whether the replacement ends the break. Grant marker 1 gave five rows no reason and two a reason naming only the new word, and manuscript marker 2's tense and synonym reasons mostly named only the new word. Each was resumed once and gave the reasons, and no mark changed.
- C9: met as a record. `8-marks.md` has one row per finding, further place, split and list entry, and lists the 48 and 35 rows not marked right by both, each with both reasons. The step's check therefore does not hold.
- C10: met. Four marker starts, all four used. No marker prompt holds a line of either report, and the two resume messages hold none and quote no words of the report.
- C11: not met for manuscript marker 1. Its third command, `grep -n -e "CNN" -e "MRI" "$D/main.tex" | cut -c1-80; grep -n -i -e "projection" -e "temperature" <four named draft files> | cut -c1-200`, printed parts of 12 draft lines, such as `45:\title{HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from L`. Each `grep` named draft files the marker had read whole, and none ran on a folder, a glob or with `-r`. The other three markers ran no command that printed a draft line, apart from the grant markers' script command and `grep` on its output through a pipe.
- C12: not met. Three places are given twice, as condition 5 lists. Many findings carry a replacement that leaves a further break unnamed, as the rows of `8-marks.md` show.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Copies equal their sources before the runs | DONE: `diff exit 0`, `cmp exit 0`, `rh exit 0`, and `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.4` |
| Manuscript run through the Skill tool | DONE: review agent ad512c438c546f57c, `ordo-high`, served `claude-opus-5-5`, 179068 tokens, 38 tool uses, 28.7 min |
| Grant run through the Skill tool | DONE: review agent ab89cdca00b160e9a, `ordo-high`, served `claude-opus-5-5`, 175667 tokens, 6 tool uses, 15.8 min |
| Reports saved into `8-run/` | DONE: `extract_handback.py` printed 85932 and 54673 characters, and its second run into the scratchpad compared with `cmp` exited 0 for both. One letter of the manuscript report is written by its name (`<latin small letter e with acute>`), and four characters of the grant report (`<en dash>`) |
| Four markers | DONE: manuscript a8f3e0b981dc00ca4 (285965 tokens, 43 tool uses, 21.0 min) and aa83277990558acd9 (213568 tokens, 40 tool uses, 29.4 min; 232869 tokens in total, 1 tool use, 2.4 min on its resume); grant a5b964c740016412e (192438 tokens, 9 tool uses, 15.0 min; 209838 tokens in total, 4 tool uses, 1.3 min on its resume) and a136ed68531e76d65 (166605 tokens, 7 tool uses, 11.3 min); each `ordo-high`, served `claude-opus-5-5` |
| Every row right by both | NOT DONE: 48 manuscript rows and 35 grant rows are not |
| Gate conditions 1 to 7 | NOT DONE: 2, 5 and 6 fail |
| Verify 1, the character-set check over `8-marks.md`, `8-report.md` and `8-run/*` | DONE: it prints nothing, exit 0 (quoted under "Files") |
| Verify 2, the copies equal their sources after the marks | DONE: `diff exit 0`, `cmp exit 0` |
| Verify 3, research-hub status of the two source folders | DONE: `rh status exit 0` with no line printed, before and after |
| Verify 4, `git status --short` in `.agents/worktrees/3-the-writing-base-8` | DONE: it prints nothing (`worktree status exit 0`) |

## The gate conditions

1. **Each finding at its place.** Holds. The 351 place checks under "Place checks" all print `1`: 251 for the manuscript and 100 for the grant. A split gets two checks, one on each quoted sentence, and finding 13.10's second sentence is checked at `d_pretraining.tex:15`. Every place of the manuscript report, the 122 tense entries, the 9 synonym entries and the 6 dash entries included, gives its path from the main file's folder, and most findings stand in included files.
2. **Grouped by rule, each group line naming the reader's loss.** Fails. The manuscript report has 14 groups and the grant report 17, each heading followed by one line. Each report opens with the groups that change what the reader believes: hedging, limits and evidence. Each line, group by group, with the session's reading of it:
   - Manuscript:
     1. "Hedging": names a loss (one cohort's result read as established for HCC and other diseases, as at `abstract.tex:5`).
     2. "Limitations and alternative interpretations": names a loss (the calibration gain read as holding for every model).
     3. "Evidence for claims": names a loss (the research gap cannot be checked).
     4. registers, "What the reader looks for": names a loss (no reporting guideline to check the methods against).
     5. Section A, vague qualifiers: names a loss (a word in place of a size, with the 0.329 to 0.628 range).
     6. "Terms defined at first use": names a loss whose example does not hold in the draft. It gives "CNN" in the abstract as met at its first use, and `main.tex:45`, the live title, uses "CNN" first.
     7. registers, "Voice": names a loss (whose decisions the choices are).
     8. "Clear antecedents": names a loss (what "this" refers to).
     9. "Tense per section": names a cost (methods and results read as standing descriptions).
     10. Section C: names a cost (sentences that announce instead of state).
     11. Section A, filler and flagged terms: names a cost its own finding contradicts. It calls "simply" in "Instead of simply comparing" a softener with no fact, and its finding 11.2 replaces "simply" with "only", which keeps a fact.
     12. Section D, "No synonym cycling": names a loss (two names read as two sets).
     13. Section D, paragraphs: names a cost (two topics in one block, as at `a_data.tex:3`).
     14. Section 0, "Em dash: zero": names no cost. "the aside construction the standard bans in every comment" restates the rule.
   - Grant:
     1. "Hedging": describes the breaks and names no loss to the reader.
     2. Section A, vague qualifiers: names a loss (the reader cannot weigh the problem).
     3. "Limitations and alternative interpretations": describes the break (reference 8 presented as general) and names no loss.
     4. "Reader's question per section": names a loss (the 0.91 limit met only in C2).
     5. registers, "What the reader looks for": describes the absence and names no loss.
     6. "Evidence for claims": names a loss (no source to check).
     7. "Terms defined at first use": names a loss (the hypothesis test not readable where it is first stated).
     8. Section D, "No synonym cycling": names a loss (the unit of the divergence score read two ways).
     9. registers, "Voice": says the breaks change no claim and describes the two names, with no cost.
     10. "Clear antecedents": names a loss (which object the exploratory question is about).
     11. Section E, "Sentence length": names a cost (30 to 52 words before the point).
     12. "Formality": names a loss (the date reassignment read as part of the re-read).
     13. Section 0, "No repeated construction": names a cost that holds. Paragraph 42 repeats paragraph 35's "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis." word for word (both printed by `python3 -I <docx_paragraphs.py> <copy> | grep -E '^(35|42): ' | grep -o ...`).
     14. "Tense per section": names a cost (a 2008 finding read as the present state).
     15. Section E, "Passive voice": names a cost that does not hold in the draft. The sentence reads "Computing is provided by the host institution at no cost, so none is requested.", so the actor stands mid-sentence, not at its end.
     16. Section D, paragraphs: names a cost (13 sentences on several ideas in one block).
     17. Section B: names a cost (a character a terminal, a diff or a grep may not show).

   The eight lines that fail are manuscript 6, 11 and 14 and grant 1, 3, 5, 9 and 15. Manuscript marker 1 named manuscript 6, 11 and 14, and manuscript marker 2 named none. Grant marker 1 named grant 1, 3, 5, 9 and 15, and grant marker 2 named 5, 9 and 15. Manuscript marker 1 also notes that group 9's list files its first two entries, from section 2, under the heading "Methodology". That is a heading inside the group, not the group line, and both entries' past tense holds for the literature row.
3. **One fresh agent per run, editing no file.** Holds.
   - Manuscript: agent ad512c438c546f57c, `agent-ad512c438c546f57c.meta.json` reading `"agentType":"ordo-high"`, served model `46 "model":"claude-opus-5-5"`. Its `tool_use` names: `Read` 36, `Bash` 1, `SubagentHandback` 1. No `Edit`, `Write` or `NotebookEdit`. The 36 `Read` calls are the prose standard, `rules.md`, `registers.md` and the 33 draft files, each read once with no `offset` or `limit`. The one `Bash` command is `cd <scratchpad>/3-2-run/manuscript && for f in <the 33 draft files>; do echo "== $f"; LC_ALL=C grep -n '[^ -~]' "$f"; done`, which runs the grep once for each draft file in one call, with nothing redirected.
   - Grant: agent ab89cdca00b160e9a, `ordo-high`, served model `8 "model":"claude-opus-5-5"`. Its `tool_use` names: `Read` 3, `Bash` 2, `SubagentHandback` 1. The three pages are each read with no `offset` or `limit`. Its two commands are `python3 '<pinned skill>/templates/docx_paragraphs.py' '<copy>'` and that command piped to `LC_ALL=C grep -n '[^ -~]'`.
   - One `Agent` call in the session's transcript per run: entry 41192 between the manuscript `Skill` call (41168) and its report (41277), and entry 41308 between the grant `Skill` call (41293) and its report (41337).
4. **The session wrote no file and read no draft in each run's span.** Holds on the writes and reads. The turn shape differs from the brief's at the user's instruction.
   - The manuscript span, entries 41168 to 41277, holds these `tool_use` calls in order:
     - `Skill` (writing, manuscript).
     - `Bash`: `grep -n '^reviewer\|^standards\|^reviewer_effort' .agents/plan.yaml; ls skills/repo-setup/templates/docs/dev/prose-standard.md`, then the Steps 3 `grep -n -e '\\input{' -e '\\include{' 'main.tex'`.
     - `Bash`: the same `grep` over the 21 files `main.tex` inputs, each line prefixed with its file by `sed`.
     - `Bash`: the same `grep` over the 11 nested files, then `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
     - `Agent`.
     - `Bash`: `grep -o '"model":"[^"]*"' $T | sort | uniq -c; cat ${T%.jsonl}.meta.json` on the agent's transcript.
     - `Bash`: `date -u +%H:%M:%S`, the last timestamp of the agent's transcript and a count of its hand-backs, at the user's "Can you pause the agent?".
     - `Bash`: a `python3 -I` count of the agent's `tool_use` names, which printed `{'Read': 36, 'Bash': 1}`.
     - `Bash`: `grep -o` of the usage lines of `6-landing.md` and `4-landing.md`, at the user's "How long will this take?".
     - Two `Read` calls of the runner's saved copy of the agent's hand-back, which is not a draft file.
   - The grant span, entries 41293 to 41337, holds:
     - `Skill` (writing, grant).
     - `Bash`: the configuration `grep`, `ls` of the copy, and `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "effort exit $?"`.
     - `Agent`.
     - `Bash`: the model read.
     - One `Read` of the runner's saved copy of the agent's hand-back.
   - In both spans there was no `Write`, `Edit` or `NotebookEdit`, no command that writes, no `sleep` and no read of a draft file.
   - The text that ends the manuscript turn (entry 41277) equals the manuscript agent's `SubagentHandback` message, 85932 characters, compared with `==` in `python3 -I` (`True`). The text that ends the grant turn (entry 41337) equals the grant agent's message, 54673 characters (`True`). No turn ended between a notice and its report: the turns that ended inside the manuscript span (41204, 41224, 41237 and 41249) ended before the agent's notice (41255).
   - The turn shape differs from the brief's. At entry 41241 the user wrote "Please pause once the agent is done.", so the turn the manuscript notice started ended with the manuscript report and no grant `Skill` call. The grant `Skill` call (41293) stands in the turn the user's "Please continue" (41286) started. Between the two spans, at entry 41290, the session wrote the state file's position line with `python3 -I`; that write lies outside both spans.
   - The pin: `describe` printed `v7.1.0-rc.4`, and both `Skill` results name `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/writing`, which resolves into the pinned worktree at 09601dc.
5. **Every finding quotes its passage and gives a replacement as text.** Fails.
   - The tense list entry at `sections/4_experiments/b_implementation.tex:3` reads `"pre-training of the Transformer encoder considers" is given in finding 6.4.`, with no replacement and a reference to another finding. Both manuscript markers name it.
   - Finding 5.2 gives its "Clear antecedents" fix as an instruction, and its written replacement still opens "This is especially relevant". Both manuscript markers name it.
   - Three places are given twice, against `SKILL.md`, "A finding": "No later group gives it again or refers to it." Both manuscript markers name each.
     - `a_longitudinal_analysis.tex:3`, "it has been shown to not fully explore": in the tense list, again in 11.1 with its tense line, and inside 13.4.
     - `a_data.tex:3`, "we evaluate HCCNet using stratified 5-fold cross-validation": in the tense list, and again in 11.4, whose note "(This place is not repeated in the tense list.)" is false.
     - `b_implementation.tex:3`, "considers": in 6.4, and referred to again from the tense list.
   - Grant marker 1 asks whether the group 16 splits, which quote again sentences earlier findings give, count as given twice. Grant marker 2 and both manuscript markers read them as the split form `SKILL.md` requires, with text that agrees. The session's reading is the same: `SKILL.md` asks a split to quote the sentences on either side of the break, and to give the text at a place as it reads after every finding on it, so these quotes are not failures.
   - No finding carries the last pass's line that it still breaks a rule. Manuscript marker 1 and grant marker 1 ran a `grep` for "still" over their report, and all four markers report no such line.
6. **Two marks per row from four distinct fresh agents.** Fails on manuscript marker 1's third command. The rest holds.
   - The four markers are distinct from each other and from both review agents.
   - Each is `ordo-high` (its `meta.json`) and served `claude-opus-5-5` only (`grep -o '"model":"[^"]*"' | sort | uniq -c` prints 49, 47, 19 and 9 lines of `claude-opus-5-5` and no other model, resumes included).
   - Each `Agent` prompt (entries 41359 to 41362, 5914, 5914, 4477 and 4477 characters) names its saved report's path, and holds no line of either report (checked line by line in `python3 -I`: 0 report lines in each).
   - The two resume messages (entries 41607 and 41608) hold no line of either report and quote no words of it. They name rows by group and letter or by list position.
   - The saved reports equal the review agents' final messages (`cmp` above).
   - Manuscript marker 1: `Read` 39, `Bash` 3, `SubagentHandback` 1. Manuscript marker 2: `Read` 39, `SubagentHandback` 2. Each read the report, the prose standard, `SKILL.md`, `rules.md`, `registers.md` and the 33 draft files, each draft file with no `offset` or `limit`. Each read the report in two `Read` calls: the first returned lines 1 to 433, and the second (`offset` 433) returned lines 433 to 633, so together they cover every line.
   - Manuscript marker 1's commands:
     - `grep -n -i -e "still break" -e "still breaks" -e "still" <the saved report> | cut -c1-160`, a search of the report.
     - `grep -n -o -e "AUPRC" -e "AUROC" -e "rojection head" -e "SSL" <13 named draft files> | sort -u`, which printed file, line and term only.
     - `grep -n -e "CNN" -e "MRI" "$D/main.tex" | cut -c1-80; grep -n -i -e "projection" -e "temperature" <four named draft files> | cut -c1-200`. Without `-o`, this printed the first 80 or 200 characters of 12 draft lines. Each file was one the marker had read whole and named by path, but the brief's prompt rule is that `grep` serves only to find a line number and that no `grep` prints a draft file. This is the failure of condition 6.
   - Grant marker 1: `Read` 7, `Bash` 4, `SubagentHandback` 2. Its commands are the script's command on the copy, the script's output piped to `grep` three times in one call, a `grep` of the saved report for "still breaks", and on its resume the script's output piped to `grep -E '^(35|41|42):'`. It read the report whole (lines 1 to 596) and, on its resume, lines 189 to 228 and 446 to 580 again.
   - Grant marker 2: `Read` 5, `Bash` 1, `SubagentHandback` 1. Its one command is the script's command on the copy.
   - No marker wrote, started an agent or invoked a skill. No marker was given the other's marks.
   - Every row has a reason of its own after the two resumes, and no mark changed on a resume.
7. **The copies equal their sources after the marks.** Holds: `diff exit 0`, `cmp exit 0`, `rh status exit 0`.
8. **Row counts beside step 6's.** The manuscript run has 228 rows against step 6's 191, and the grant run 74 against 74. This is a fact for the user and gates nothing.
9. **What the marks do not check.** The marks judge the findings the reports give, and no check counts breaks a report missed, since the gate asks for none.

## The rows not marked right by both

The 48 manuscript rows and 35 grant rows, each with both reasons, are listed in `8-marks.md` under "Rows not marked right by both". Both markers mark 27 of the manuscript rows wrong and 24 of the grant rows. They fall into these kinds:

- A replacement that ends the named break but leaves another break of the four pages unnamed. In the manuscript, most often a vague or size word kept, such as "markedly", "closely", "largely", "essentially", "predominately" and "at most marginal" (3.1, 3.9, 5.19, the tense entries Results 5, 10, 16, 24, 26 and 29, 13.19, 13.20, 13.21). Otherwise:
  - a Voice break: 1.2, 3.5, 13.1, the dash entry at `discussion.tex:1`;
  - a tense change: 7.1, 13.11;
  - a Formality break: 1.12, 13.22;
  - a list in paragraph form: 13.9, 13.17;
  - a missing limit: 1.9, 1.10, 13.20;
  - a performative aside: 2.1;
  - the cut of "slightly": Methodology 67.

  In the grant, most often a sentence over the length rule left in place or not named, in 19 rows. Otherwise:
  - two claims in one sentence: 11f, 14b, 16o, 16v, 16z;
  - "scan" left for a study or a sequence: 2f, 7b, 7d, 16n.
- A term brought in undefined: manuscript 1.1, 5.12 and 10.4, and ConvNeXt in 6.1; grant 3a, 4a and 16p.
- A scope word changed, or a qualifier cut so that a claim reads as universal: manuscript 5.4, 5.5, 5.11, 5.18 and 5.20; grant 1c, 2e, 8c and 16h.
- A first-use claim that does not hold, since the title at `main.tex:45` uses CNN and MRI first: manuscript 5.1 and 6.1.
- An "Also breaks" line or a named rule whose words do not describe the passage: manuscript 3.3, 3.7, 5.6, 5.9, Methodology 57 and 11.4; grant 1b, 2e, 14b and 17a.
- A reference or an instruction in place of text: manuscript Methodology 56 and 5.2.
- A replacement that does not read as a sentence: manuscript 11.1 and 13.4.
- A split part over the paragraph rule, or holding two ideas, once added sentences are counted: manuscript 13.12; grant 16p, 16r and 16y.
- A carried change one marker marks wrong elsewhere: manuscript 13.13.

## Judgment calls the brief left open

- The cases' first run is read from the base commit with `git ls-tree`, since the `ls` was not run before the runs.
- The manuscript review agent ran its one grep once for each draft file inside one `for` loop in one `Bash` call. The session reads this as the one grep run once for each file, since `SKILL.md` names the command and the count of runs, not the count of calls.
- A split gets two place checks, one on each quoted sentence. Every other place gets one.
- A reason that names only the new word, with a general sentence over the list, was taken as no reason of its own, and the two markers that gave such reasons were resumed once for those rows.
- The group 16 splits of the grant report that quote sentences other findings also give are not counted as passages given twice, as condition 5 says.
- The markers' stated totals that disagree with their marks are noted in `8-marks.md`, and the tables are read from the marks. Manuscript marker 2 states 41 wrong rows and lists 28. Grant marker 1 states 75 rows and 33 wrong, and its marks hold 74 and 32.

## User-visible changes

None: the step changes no file outside the ledger.

## Wrong or impossible in the brief

- The brief's turn shape for the grant run could not hold once the user asked the session to pause after the manuscript agent ended. Condition 4 records it.
- Nothing else.

## Files

`wc -l`, run after the last edit, from the repository root:

```
     583 .scratch/3-the-writing-base/agents/reviews/8-marks.md
    1263 .scratch/3-the-writing-base/agents/reviews/8-report.md
      89 .scratch/3-the-writing-base/agents/reviews/8-run/grant-marks-1-resume.md
     150 .scratch/3-the-writing-base/agents/reviews/8-run/grant-marks-1.md
     193 .scratch/3-the-writing-base/agents/reviews/8-run/grant-marks-2.md
     595 .scratch/3-the-writing-base/agents/reviews/8-run/grant-report.md
     344 .scratch/3-the-writing-base/agents/reviews/8-run/manuscript-marks-1.md
     647 .scratch/3-the-writing-base/agents/reviews/8-run/manuscript-marks-2-resume.md
     300 .scratch/3-the-writing-base/agents/reviews/8-run/manuscript-marks-2.md
     632 .scratch/3-the-writing-base/agents/reviews/8-run/manuscript-report.md
```

Verify 1, `printf '%s\0' .scratch/3-the-writing-base/agents/reviews/8-marks.md .scratch/3-the-writing-base/agents/reviews/8-report.md .scratch/3-the-writing-base/agents/reviews/8-run/* | xargs -0 perl -CSD -ne '<the check>'; echo "charset exit $?"`, printed only `charset exit 0`.

## Place checks

One command per place, its output under it. A passage part is taken from the review agent's final message as saved, holds no `'` and no character outside ASCII, and is 40 characters long where the passage allows. `<scratchpad>` is `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad`.

### Manuscript report

Run from the main file's folder, `<scratchpad>/3-2-run/manuscript`.


$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'Our results show that HCCNet substantial'
1

$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'We demonstrate the effectiveness of HCCN'
1

$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'The methodological approach presented in'
1

$ sed -n '5p' sections/abstract/abstract.tex | grep -cF -- 'Its ability to handle varying patient re'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'y fine-tuning the pre-trained model on t'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'This application not only demonstrates H'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'Thus, HCCNet provides a flexible framewo'
1

$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'he methodology is versatile and offers a'
1

$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'reliability diagrams further demonstrate'
1

$ sed -n '10p' sections/5_discussion/discussion.tex | grep -cF -- 'hus, even for imaging modalities where t'
1

$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'Our augmentation strategy exposes the ba'
1

$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'e attribute this to the limited number o'
1

$ sed -n '16p' sections/5_discussion/discussion.tex | grep -cF -- 'dditionally, while HCCNet demonstrates s'
1

$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'More interestingly, the comparison betwe'
1

$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'To date, deep learning applications to m'
1

$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'owever,  physicians usually assess the p'
1

$ sed -n '1p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'As a result, longitudinal imaging has lo'
1

$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'Despite being long established as the go'
1

$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'o mitigate this shortcoming, our study u'
1

$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Among them, contrastive learning approac'
1

$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 's a result, many deep learning studies a'
1

$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'Likewise, most deep learning application'
1

$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'When training neural networks, task agno'
1

$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'Deviating from the head dimension of 128'
1

$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'We evaluate HCCNet on data that is retro'
1

$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'Longitudinal MRI analysis is important f'
1

$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'This is especially relevant in condition'
1

$ sed -n '1p' sections/1_introduction/introduction.tex | grep -cF -- 'However, despite its potential, the deve'
1

$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'Traditional approaches often simplify th'
1

$ sed -n '5p' sections/1_introduction/introduction.tex | grep -cF -- 'However, this method has limitations, pa'
1

$ sed -n '7p' sections/1_introduction/introduction.tex | grep -cF -- 'However, many existing approaches have n'
1

$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Hybrid models can be trained end-to-end,'
1

$ sed -n '7p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Likewise, many of them disregard the irr'
1

$ sed -n '1p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Using the potential abundance of unlabel'
1

$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'ince the frequency of liver screenings i'
1

$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'Additionally, we reimplement the patchif'
1

$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'wing to the limited number of positive c'
1

$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'This corresponds with the results presen'
1

$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'At least on the data evaluated in this s'
1

$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'That is, although baseline model results'
1

$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Overall, fine-tuned model results varied'
1

$ sed -n '8p' sections/5_discussion/discussion.tex | grep -cF -- 'Our proposed pre-training approach impro'
1

$ sed -n '8p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Since all metrics are obtained through c'
1

$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'Overall differences between imaging moda'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'As for the comparison across performance'
1

$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'Consequently, we drastically reduced the'
1

$ sed -n '1p' sections/abstract/abstract.tex | grep -cF -- 'To address this, we propose HCCNet, a no'
1

$ sed -n '11p' sections/1_introduction/introduction.tex | grep -cF -- 'The CNN backbone is pre-trained using an'
1

$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'he Transformer encoder is based on the P'
1

$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'While MRI scans are assumed to be i.i.d.'
1

$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'This study aims to define a mapping func'
1

$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'For the CNN backbone, this study extends'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Besides that, our implementation also pr'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'understanding of disease progression, th'
1

$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 'herefore, this study developed HCCNet, a'
1

$ sed -n '6p' sections/5_discussion/discussion.tex | grep -cF -- 's capability to capture disease progress'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This teaches the model to identify the s'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'This transfers the pre-trained represent'
1

$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'This is due to convergence issues that w'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models tra'
1

$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'it has been shown to not fully'
1

$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'they have been successfully em'
1

$ sed -n '3p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We use the CNN backb'
1

$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we adapt the ConvNeXt architec'
1

$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the 2-dimensional depthwise c'
1

$ sed -n '5p' sections/3_methodology/b_architecture.tex | grep -cF -- 'and reduce the proposed kernel'
1

$ sed -n '14p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we concatenate the image embeddings obta'
1

$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 's positional informa'
1

$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we replace the conventional sequence pos'
1

$ sed -n '21p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we compute the vector of inter'
1

$ sed -n '26p' sections/3_methodology/b_architecture.tex | grep -cF -- 'prepend'
1

$ sed -n '26p' sections/3_methodology/b_architecture.tex | grep -cF -- 'and, finally, obtain positional encoding'
1

$ sed -n '34p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we add the positional encoding'
1

$ sed -n '39p' sections/3_methodology/b_architecture.tex | grep -cF -- 'We feed the input sequence through the e'
1

$ sed -n '44p' sections/3_methodology/b_architecture.tex | grep -cF -- 'we feed it through a pooling l'
1

$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'e introduce four variants of H'
1

$ sed -n '10p' sections/3_methodology/c_variants.tex | grep -cF -- 'we additionally introduce HCCNet-C (comp'
1

$ sed -n '1p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we therefore design two (self-)supervise'
1

$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'e define a student $'
1

$ sed -n '3p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we learn to match'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we exploit the abundance of natural vari'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we treat different s'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we randomly sample o'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we sample among the pre- and post-contra'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we sample within a single contrast famil'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we randomly shuffle 50\% of the input se'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we actually randomly shuffle 66\% of seq'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'and task the model'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we keep the parameters of the CNN featur'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'We apply the sigmoid'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'and learn to identify shuffled sequences'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we concatenate the different s'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'we reconcile the differing input dimensi'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'the learned stem filters are r'
1

$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'we initialize the parameters o'
1

$ sed -n '1p' sections/3_methodology/e_finetuning.tex | grep -cF -- 'we append the final pooling layer as dis'
1

$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'All examinations included in the study c'
1

$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'odality groups are available for every p'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we include all avail'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we additionally exclude all pa'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'f which 37 develop H'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we evaluate HCCNet using stratified 5-fo'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'We partition the patient cohor'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'The folds are stratified by HC'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'Each fold serves as the held-out test se'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'the remaining four folds form the develo'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 's repeated independently for e'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'we only fine-tune HCCNet on longitudinal'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we pre-train both the CNN back'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We train the CNN over 32000 training ste'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we linearly increase the learn'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we decay the learnin'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'e employ the same cosine decay without w'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'but only apply it to the weigh'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we also limit the te'
1

$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 're-training of the Transformer encoder c'
1

$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we train the Transformer encoder using a'
1

$ sed -n '3p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We set the maximal sequence length to $s'
1

$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we update HCCNet'
1

$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We fine-tune the model over 400 training'
1

$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'but decrease the wei'
1

$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'e select the batch s'
1

$ sed -n '5p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we then train HCCNet'
1

$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we establish a basel'
1

$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we equally train the'
1

$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We employ the same o'
1

$ sed -n '7p' sections/4_experiments/b_implementation.tex | grep -cF -- 'ut slightly increase the learning rate w'
1

$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we additionally evaluate a set of explor'
1

$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we naively concatenate the ser'
1

$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we evaluate the full'
1

$ sed -n '9p' sections/4_experiments/b_implementation.tex | grep -cF -- 'augmentation views are sampled'
1

$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we further disentangle the contributions'
1

$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'we evaluate two intermediate configurati'
1

$ sed -n '11p' sections/4_experiments/b_implementation.tex | grep -cF -- 'We conduct this abla'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we evaluate HCCNet'\''s baseline'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we train ten independently seeded models'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Every reported metric is compu'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we employ the following performance metr'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we also explore the robustness of the mo'
1

$ sed -n '6p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'we evaluate the mode'
1

$ sed -n '3p' sections/appendix/a_implementation/1_conv_layer.tex | grep -cF -- 'we inflate the 2D depthwise and pointwis'
1

$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly crop two global vi'
1

$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly crop a multi-channel sub-vol'
1

$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'urther augmentations remain consistent a'
1

$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we randomly shift and scale the intensit'
1

$ sed -n '1p' sections/appendix/a_implementation/2_augmentations.tex | grep -cF -- 'we use the same data augmentation strate'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'shows excellent predictive cap'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'appear to display less expressive charac'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'still maintain a stronger average predic'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'are also evaluated in their ow'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'is markedly stronger'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'while on AUPRC the two are com'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'The combined T1 IOP \& T2-MRI modality r'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'so the T2-MRI model alone exce'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'the combined modality nonetheless remain'
1

$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'the per-fold ensemble closely follows th'
1

$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'This robustness is tightest on'
1

$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- 'No model variant falls consistently belo'
1

$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'he models are thus r'
1

$ sed -n '11p' sections/4_experiments/d_results.tex | grep -cF -- 'the plots reveal no consistent differenc'
1

$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'Across imaging modalities, the magnitude'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'the plots largely align with the results'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'he expected calibration error does not d'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'consistently show the lowest expected ca'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'display the highest expected calibration'
1

$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'his reduction is largest for diffusion w'
1

$ sed -n '21p' sections/4_experiments/d_results.tex | grep -cF -- 'and is smallest at 1'
1

$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'None of the fused configurations exceeds'
1

$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'Adding T1 DCE-MRI to DW-MRI lowers perfo'
1

$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'leaves performance essentially'
1

$ sed -n '25p' sections/4_experiments/d_results.tex | grep -cF -- 'matches DW-MRI alone'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'pre-training only the CNN backbone recov'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'yields AUPRC = 0.310'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'The CNN-backbone dominance als'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'learly exceeds the Transformer encoder a'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'the two stages contribute comp'
1

$ sed -n '29p' sections/4_experiments/d_results.tex | grep -cF -- 'These results indica'
1

$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'consistently display the highest detecti'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'onsistently display the lowest average r'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'preceding pre-training establishes a neg'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'HCCNet fine-tuned using diffusion weight'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'xhibit the highest average reliability m'
1

$ sed -n '3p' sections/4_experiments/d_results.tex | grep -cF -- 's fine-tuned performance (i) across imag'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'ote that in our implementation, we use a'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'Note that during pre-training of the Tra'
1

$ sed -n '3p' sections/appendix/a_implementation/3_hyperparams.tex | grep -cF -- 'Note that during CNN-backbone pre-traini'
1

$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'hile the approach is relatively simple t'
1

$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'Instead of simply comparing view pairs f'
1

$ sed -n '5p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'adopts a simple sequence-order-predictio'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'To obtain robust performance estimates d'
1

$ sed -n '1p' sections/3_methodology/c_variants.tex | grep -cF -- 'The five model variations are:'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'For the comparison across model variatio'
1

$ sed -n '9p' sections/4_experiments/d_results.tex | grep -cF -- '\textbf{Comparison across Model Variatio'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by imaging modality and model'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'across model archite'
1

$ sed -n '15p' sections/4_experiments/d_results.tex | grep -cF -- 'stratified by image modality and model v'
1

$ sed -n '3p' sections/appendix/b_additional_results/1_baseline.tex | grep -cF -- 'stratified by image modality and model v'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'stratified by imaging modality and model'
1

$ sed -n '36p' tables/hyperparams.tex | grep -cF -- 'for model variations HCCNet-F, -C, and -'
1

$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'he CNN backbone is pre-trained using a s'
1

$ sed -n '3p' sections/abstract/abstract.tex | grep -cF -- 'lar MRI screenings for HCC surveillance.'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'This application not only demonstrates H'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'nefit from monitoring changes over time.'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'Thus, HCCNet provides a flexible framewo'
1

$ sed -n '13p' sections/1_introduction/introduction.tex | grep -cF -- 'olte/HCCNet}{github.com/jmnolte/HCCNet}.'
1

$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'hile the approach is relatively simple t'
1

$ sed -n '3p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'cting, dammuDeepLearningPrediction2023}.'
1

$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'Hybrid models can be trained end-to-end,'
1

$ sed -n '5p' sections/2_related_work/a_longitudinal_analysis.tex | grep -cF -- 'disease or after the onset of treatment.'
1

$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 's such, they randomly derive different v'
1

$ sed -n '3p' sections/2_related_work/b_pretraining.tex | grep -cF -- 'e between images from different patients'
1

$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'As such, the data of each patient $p \in'
1

$ sed -n '1p' sections/3_methodology/a_problem_formulation.tex | grep -cF -- 'bservation $i^{(p,t)}$ has time point $t'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'ote that in our implementation, we use a'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'entation strategy specific to MR images.'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'pecifically, we treat different series w'
1

$ sed -n '8p' sections/3_methodology/d_pretraining.tex | grep -cF -- ', or the short- and long-echo T2 series)'
1

$ sed -n '10p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'We apply the sigmoid function to the out'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'f shape $s = 72^3$ from the original MRI'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 's with diffusion coefficients $b \in \{0'
1

$ sed -n '15p' sections/3_methodology/d_pretraining.tex | grep -cF -- 'er, which is then fine-tuned end to end.'
1

$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'Prior to pre-training and fine-tuning, M'
1

$ sed -n '1p' sections/4_experiments/a_data.tex | grep -cF -- 'y groups are available for every patient'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'During fine-tuning we additionally exclu'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'ion rather than a single hold-out split.'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'Each fold serves as the held-out test se'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'ng only the data of its development set.'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'As before, to avoid leakage between pre-'
1

$ sed -n '3p' sections/4_experiments/a_data.tex | grep -cF -- 'tandard deviation across the five folds.'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'After reaching its maximum value, we dec'
1

$ sed -n '1p' sections/4_experiments/b_implementation.tex | grep -cF -- 'ep{liUnderstandingDisharmonyWeight2020}.'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'Every reported metric is computed on thi'
1

$ sed -n '1p' sections/4_experiments/c_evaluation.tex | grep -cF -- 'nder the precision-recall curve (AUPRC).'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'Contrast enhanced T1 weighted and the co'
1

$ sed -n '5p' sections/4_experiments/d_results.tex | grep -cF -- 'es in Table \ref{tab:finetuned_results}.'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'Extended reliability metrics are present'
1

$ sed -n '19p' sections/4_experiments/d_results.tex | grep -cF -- 'ted in Table \ref{tab:results_base_pre}.'
1

$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'An ablation that pre-trains only the CNN'
1

$ sed -n '12p' sections/5_discussion/discussion.tex | grep -cF -- 'ents over the strongest single modality.'
1

$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Exploratory experiments further showed t'
1

$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 't monitoring can lead to better outcomes'
1

$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'Yet, each condition presents its own uni'
1

$ sed -n '1p' sections/6_conclusion/conclusion.tex | grep -cF -- 'assess the generalizability of the study'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'That is despite that baseline models tra'
1

$ sed -n '3p' sections/appendix/b_additional_results/2_reliability.tex | grep -cF -- 'een performance and reliability metrics.'
1

$ sed -n '47p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images: -- A Case St'
1

$ sed -n '49p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Stu'
1

$ sed -n '51p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Stu'
1

$ sed -n '53p' main.tex | grep -cF -- 'Longitudinal 3D MRI Images -- A Case Stu'
1

$ sed -n '57p' main.tex | grep -cF -- 'Longitudinal Medical Images -- Applicati'
1

$ sed -n '1p' sections/5_discussion/discussion.tex | grep -cF -- 'his study therefore developed HCCNet - a'
1


### Grant report

Run from the repository root of the main checkout, with `<docx_paragraphs.py>` the pinned `skills/writing/templates/docx_paragraphs.py` and `<copy>` the grant copy under `<scratchpad>/3-2-run/grant/`.


$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^2: ' | grep -cF -- 'Before the tumour: an interpretable pre-'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'If the hypothesis holds, surveillance ca'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'Liver cancer usually grows in a scarred,'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^11: ' | grep -cF -- 'Leverkanker ontstaat meestal in een verl'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Hepatocellular carcinoma (HCC) mostly ar'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumo'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises th'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'he studies hold several MRI scan types ('
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'ithin the liver outline from the organ m'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'In the primary analysis, the score of ea'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^45: ' | grep -cF -- 's serial MRI before diagnosis is reduced'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'maging of the background liver already e'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'Of the 37 patients who develop HCC, 8 ha'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'he analysis code, number of components a'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken wi'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'This project tests whether that change i'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'The budget requests 0,42 FTE of the appl'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable st'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'The project fits the XS scheme as a pre-'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HC'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'The livers of all patients are then alig'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'Whether such change exceeds the scan-to-'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 's earlier studies so that the same point'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Success means reproducible components th'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The divergence score of a study is the m'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The primary test is repeated in the 5 pa'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'A supporting model gives each patient th'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The data steward keeps the outcome label'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^45: ' | grep -cF -- 'The lower panel sketches a divergence sc'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^46: ' | grep -cF -- 'verlapping work packages: WP1 (mo 1-4) a'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^47: ' | grep -cF -- '(i) Signal too small above cirrhotic var'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 's standing appointment covers the remain'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^46: ' | grep -cF -- 'The applicant works at 0,42 FTE across a'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'hether it reflects a diffuse malignant f'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'ield cancerisation, first described in o'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'The opportunity is a surveillance cohort'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'We hypothesise that in patients who deve'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The cohort holds 243 patients with outco'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Before the pre-registration is deposited'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'In the 8 patients it lies a median of 21'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'A radiologist blinded to outcome re-read'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'uccess means a one-sided test at alpha 0'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^43: ' | grep -cF -- 'uccess means the future tumour segment r'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that progno'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic si'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'Computing is provided by the host instit'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'ancer is thought to arise from gradual c'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^8: ' | grep -cF -- 'r stable pattern before a tumour appears'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^11: ' | grep -cF -- 'Kanker ontstaat vermoedelijk uit een gel'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^11: ' | grep -cF -- 'lfde lever voordat een tumor verschijnt.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'The budget requests 0,42 FTE of the appl'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'oject because the work packages overlap.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 's standing appointment covers the remain'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'tution at no cost, so none is requested.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'Dissemination covers open-access publica'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^31: ' | grep -cF -- 'ent, so no data-acquisition costs arise.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'In practice, surveillance detects a tumo'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'iffuse change in the surrounding tissue.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Molecular studies have shown that progno'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'cans before diagnosis is rarely studied.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'Imaging analysis mostly characterises th'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^34: ' | grep -cF -- 'e background liver was doing beforehand.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'We hypothesise that in patients who deve'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'o never develop HCC (never-HCC patients)'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'The tested study is the latest usable st'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'ver-HCC studies in the primary analysis.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'A within-patient analysis adjusted for d'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'dictive: the change precedes the tumour.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'Molecular confirmation lies outside this'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'nown, which makes the project high-risk.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'If it does, surveillance can warn within'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^35: ' | grep -cF -- 'ges of known size into real liver scans.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The clinical record gives the date of HC'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'scan and scans after contrast injection.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'The analysis uses the sequences taken wi'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'the liver exists for every usable study.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'Of the 37 patients who develop HCC, 8 ha'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^40: ' | grep -cF -- 'usable studies form the comparison pool.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 's earlier studies so that the same point'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'e the segments marked on this reference.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'he analyst receives only studies taken b'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'and how it changes over time (Figure 1).'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'ithin the liver outline from the organ m'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'f the patients correlate at 0.8 or more.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'Components are checked against estimates'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^41: ' | grep -cF -- 'on units as the detectable effect of C2.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The divergence score of a study is the m'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- ', with at least one earlier usable study'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'Tested studies at level 2 are excluded ('
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'milar interval since the previous study.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'With 8 patients against 148 never-HCC pa'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'ctable effect 0.97 standard deviations).'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'A supporting model gives each patient th'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'between patients must remove the effect.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'The data steward keeps the outcome label'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^42: ' | grep -cF -- 'k before the analyst receives the labels'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- 'Molecular pathology places prognostic si'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^48: ' | grep -cF -- ', read through interpretable components.'
1

$ python3 -I <docx_paragraphs.py> <copy> | grep -E '^64: ' | grep -cF -- 'NWO Open Competition Domain Sc'
1
