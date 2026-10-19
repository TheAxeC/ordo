NOT DONE: (1) The sentence that `apply_tex_patch.py` exits 4 (`SKILL.md` Steps 10 and the "A script failed" row of Stops) is not run against the script, because exit 4 is the script's self-check failure, which its header calls a defect of the script, and reaching it needs a broken script, which the no-breakage rule forbids; the sentence rests on the header line quoted in S8 of part 6. (2) The file `.scratch/5-paper/agents/reviews/2-report.md` is not written: the Write tool refuses subagents report files and asks for the report as the final message, so this message is the report and the orchestrator saves it to that path. The same text is also in `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/paper2/gen/final.txt` (outside the repository). Everything else in the brief is done.

# Step 2 of plan 5: the builder's report

Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-2`, branch `5-paper-2`. Every command below was run from the worktree's root on the final tree. Scratch files are under `$TMPDIR/paper2/`. Where only some lines of an output bear on a sentence, the lines quoted are whole lines of that output. An output line that holds a character outside the rules file's set is left out.

## 2. Open items

The open items of `.scratch/5-paper/orchestrator-state.md` (`sed -n 48,54p`), verbatim:

```
- none.
```

This step raises none.

## 3. The cases' first run

The first run was made on the unchanged tree, before any file was changed. The tree was commit 05a4bd6, whose `skills/paper/` held only `templates/`.

- C1, C2, C3, C4, C6, C7, C8, C9, C10 and C14 (text cases about `skills/paper/SKILL.md`). Command: `ls skills/paper; test -e skills/paper/SKILL.md; echo "SKILL.md exists: $?"`. Output:

  ```
  templates
  SKILL.md exists: 1
  ```

  Each case reads text that file holds, so each fails on the unchanged tree. C14's intake record is offered by Steps 6 and "What it reads" 7 of the same file.
- C5 (coverage records). Command: `grep -c 'skills/paper/' docs/academic-coverage.md`. Output: `1`. That one line is the example in the file's line 14, so no reason names a file of `skills/paper/` and no part is held in a named file.
- C11 (wiring). Command: `grep -n 'paper' README.md .agents/plan.yaml skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md agents/ordo-*.md skills/repo-setup/templates/docs/glossary.md | grep -v 'academic'`. Output: no line. `sed -n 10p .agents/plan.yaml` printed a comment that ends `and the agents of /code-comments run on.` with no `paper`. The frontmatter parse of check 4 below printed the five names on the unchanged tree.
- C12 (coverage doc). Command: `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"`. Output: `ok: docs/academic-coverage.md` and `exit 0`. `grep -c 'skills/paper/' docs/academic-coverage.md` printed `1`.
- C13 (`/writing` numbering). Command: `grep -n -i 'number' skills/writing/SKILL.md`. Output: lines 92 and 139, neither of which numbers the findings. `grep -n 'version' skills/writing/SKILL.md | head -3` printed `5:  version: "1.0.0"` first.
- C15 (code case, the three scripts unchanged by this step). Run on a scratch copy of `dongho-ecg-clustering/manuscript/main.tex` and `refs.bib`:
  - `python3 $S/anchorize_tex.py main.tex | tail -1` printed `main.tex.block-manifest.json: 81 blocks, 55837/56001 chars in blocks`.
  - Two patches in a row, each anchorized afresh, each manifest moved to `patches/<nn>-main.tex.block-manifest.json`, each copy checked by `cmp`: `apply exit 0` and `cmp exit 0` for `01` and for `02`. `ls -la patches` listed `01-main.tex.block-manifest.json`, `01-main.tex.patch.json`, `01-main.tex.patched`, `01-main.tex.patched.apply-report.json` and the same four files for `02`.
  - The first manifest checked against the file after the second copy printed `"kind": "stale-manifest"` and `exit 2`.
  - A patch with empty `roadmap_item_ids` printed `"kind": "validation"` with the problem `OP001: roadmap_item_ids must name at least one reviewer item` and `exit 2`.
  - `--output` equal to the base printed `"kind": "output"` with the problem `--output must differ from the base; the base is never modified` and `exit 2`.
  - An `insert_after` patch on that `refs.bib` (`refs.bib.block-manifest.json: 21 blocks, 8192/8233 chars in blocks`) applied with `apply exit 0` and `cmp 0`. `cite-keys` for a `.tex` that did not cite the new key printed `unused: scratchkey2026` and `exit 1`; for a `.tex` that cited it, it printed nothing and `exit 0`.
  - The same cases were run again on the final tree; part 6 quotes them (S1 to S12).
- C16 (the `.bib` rule). The rule is read from the real files' lines; a scratch Perl script lists each file's lines so the reading can be checked (it is not kept and is part of no file). Output, with `research-hub/projects/` written `$R/`:

  ```
  $R/manuscripts/dongho-ecg-clustering/manuscript/main.tex:839 -> $R/manuscripts/dongho-ecg-clustering/manuscript/refs.bib (exists)
  $R/active/linfoot-estimator/manuscript/main.tex:501 -> $R/active/linfoot-estimator/manuscript/main.bib (exists)
  $R/manuscripts/meseret-cirrhosis/notes/thesis/main.tex:566 -> $R/manuscripts/meseret-cirrhosis/notes/thesis/References.bib (exists)
  REFUSE: line names more than one file: $R/archive/published/2022/block-term-tensor-regression/manuscript/bare_jrnl.tex:1082 bibliography{IEEEabrv,main}
  REFUSE: no bibliography line in $R/manuscripts/ecg-readable-substrate/manuscript/main.tex
  ex/m.tex:2 -> ex/lib.bib (exists)
  ```

  `sed -n 566p` and `sed -n 570p` of the meseret file printed `\bibliography{References}` and `% \bibliography{References}  `, so the commented line is left out by the `%` rule of "What it reads" 5. `ls` of that folder with `grep -i referenc` printed `references.bib`: `References.bib` is found on this case-insensitive file system and is the refusal "a named file that does not exist" on a case-sensitive one. `grep -n 'thebibliography'` of the ecg-readable-substrate file printed `288:\begin{thebibliography}{99}` and `436:\end{thebibliography}`; "What it reads" 5 refuses revision, citation-check and lit-review for it and says abstract-only and disclosure read no `.bib`. The scratch file with `\addbibresource{lib.bib}` resolves to `lib.bib`. The rule is text, so the result is the same on the unchanged tree and the final tree; the outputs above were produced again on the final tree with `perl $TMPDIR/paper2/bibrule.pl <main.tex>` for each file.
- C17 (quoting). The rule of Steps 2 (`'` + value with each `'` written `'\''` + `'`) was applied by a scratch function and the quoted forms were run through the shell. Output on the final tree:

  ```
  quoted path: '/tmp/my dir/it'\''s here/main.tex'
  quoted topic: 'state "of the art" $(echo INJECTED) `echo INJECTED2`'
  ["/tmp/my dir/it's here/main.tex", 'state "of the art" $(echo INJECTED) `echo INJECTED2`']
  exit 0
  ```

  The command was `eval "python3 -c 'import sys; print(sys.argv[1:])' $qp $qt"`. Each value reached the program as one argument and no command substitution ran (neither `INJECTED` was printed).

No case needed a ruling.

## 4. DONE / NOT DONE

### The checks of "Verify before you report"

**Check 1. The verify-list checks that cover the changed files.** Status: DONE. The 28 changed files are the output of `git status --porcelain -uall`; the character-set command was run over all of them.

**Check 1a. `check_config.py` scratch tests** Status: DONE.

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
exit 0
```

**Check 1b. the plan-terms block** Status: DONE.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
```

**Check 1c. the character set (the brief's command, the file list in `$TMPDIR/paper2/changed.txt`)** Status: DONE.

```
$ printf '%s\0' $(cat /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/paper2/changed.txt) | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
exit 0
```

**Check 2. the coverage list** Status: DONE.

```
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
exit 0
```

**Check 3. description lengths (the command prints one line per skill; the two lines the check names)** Status: DONE.

```
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]' | grep 'skills/paper/\|skills/writing/'
838 skills/paper/SKILL.md
779 skills/writing/SKILL.md
exit 0
```

**Check 4. the five agent definitions** Status: DONE.

```
$ python3 -c 'import glob,yaml; [print(f, yaml.safe_load(open(f).read().split("---")[1])["name"]) for f in sorted(glob.glob("agents/ordo-*.md"))]'
agents/ordo-high.md ordo-high
agents/ordo-low.md ordo-low
agents/ordo-max.md ordo-max
agents/ordo-medium.md ordo-medium
agents/ordo-xhigh.md ordo-xhigh
exit 0
```

**Check 5. The runs of C15 and C17, quoted.** Status: DONE. C15 and C17 are quoted whole in part 3 (first run) and part 6 (final tree: S1 to S12 for C15, the quoting sentence for C17).

**Check 6a. the first grep of item 6 (prints nothing; `grep` exits 1 when it finds nothing)** Status: DONE.

```
$ grep -rn 'research-hub\|entry [0-9]\|step [0-9]\|15\.A' skills/paper/SKILL.md skills/paper/references/
exit 1
```

**Check 6b. the second grep of item 6, counted (the lines it prints are named by group below)** Status: DONE.

```
$ grep -rnw 'literature' skills/paper/SKILL.md skills/paper/references/ | grep -v 'literature strategist\|literature-strategist' | wc -l
      37
exit 0
```

The 37 lines of check 6b, by group and why each stays. Each is the ordinary noun "literature" for published work, and none is the name `literature` of a skill:
- `SKILL.md` Quick start (`review the literature on a topic`) and the patch id table (`the entries of a literature review`): the lit-review mode's own product.
- `structure-architect.md`: the artifacts "literature report" and "literature matrix", the section "Literature Review" of an outline, "needs literature" and "needs literature supplementation" (a gap marker the skill defines), and "the literature" in "Interpretation and comparison with the literature".
- `draft-writer.md`: the same artifacts, the gap tag `[GAP: literature needed]`, and "theoretical literature" as a kind of evidence.
- `citation-compliance.md`: "literature report" and "grey literature" and "older literature".
- `intake.md`: "the literature search" (the strategist's search), "A literature list or a .bib" and "grey literature".
- `peer-reviewer.md`, `abstract.md`, `argument-builder.md`, `integrity-verification.md`: "a gap in the literature", "the literature review" (a section of a paper), "comparison with the literature".
- `ethics.md` and `ai-disclosure.md`: "literature search assistance", the name of a use of AI that a disclosure lists.

**Check 7. List items and sentences against the standards.** Status: DONE with the departures below. `SKILL.md` was read in full on the final tree. For the 13 pages, `python3 skills/writing/templates/prose_facts.py <page> skills/repo-setup/templates/docs/dev/prose-standard.md` was run on each and its output read; each sentence over 35 words, each semicolon outside a table, each list item that ended in a semicolon, each repeat without a count, each bare "round" and each use of "finding" was read in its line and corrected or listed below.

| File | Semicolons | Non-ASCII | Runs of equal length | Contractions | Listed-word hits |
|---|---|---|---|---|---|
| SKILL.md | 11 semicolons in 6871 words, 1.60 per 1000 words | 0 | 0 | 0 | 3 |
| abstract.md | 0 semicolons in 1110 words, 0.00 per 1000 words | 0 | 0 | 0 | 0 |
| ai-disclosure.md | 1 semicolons in 1628 words, 0.61 per 1000 words | 0 | 0 | 0 | 0 |
| argument-builder.md | 0 semicolons in 642 words, 0.00 per 1000 words | 0 | 0 | 0 | 0 |
| citation-compliance.md | 1 semicolons in 1400 words, 0.71 per 1000 words | 0 | 0 | 0 | 0 |
| draft-writer.md | 0 semicolons in 2165 words, 0.00 per 1000 words | 0 | 0 | 0 | 0 |
| ethics.md | 1 semicolons in 1424 words, 0.70 per 1000 words | 0 | 0 | 0 | 0 |
| intake.md | 3 semicolons in 1556 words, 1.93 per 1000 words | 0 | 0 | 0 | 0 |
| integrity-verification.md | 0 semicolons in 5780 words, 0.00 per 1000 words | 0 | 0 | 0 | 2 |
| literature-strategist.md | 0 semicolons in 2755 words, 0.00 per 1000 words | 0 | 0 | 0 | 1 |
| peer-reviewer.md | 45 semicolons in 2233 words, 20.15 per 1000 words | 0 | 0 | 0 | 1 |
| statements.md | 7 semicolons in 1618 words, 4.33 per 1000 words | 0 | 0 | 0 | 0 |
| structure-architect.md | 0 semicolons in 1317 words, 0.00 per 1000 words | 0 | 0 | 0 | 0 |
| visualization.md | 0 semicolons in 2509 words, 0.00 per 1000 words | 0 | 0 | 0 | 1 |

Listed-word hits, one per line as the tool prints them:

```
SKILL.md:46 s2: "Quick" (Banned as filler)
SKILL.md:74 s1: "Quick" (Banned as filler)
SKILL.md:396 s1: "Quick" (Banned as filler)
integrity-verification.md:99 s1: "quick" (Banned as filler)
integrity-verification.md:128 s1: "very" (Banned as filler)
literature-strategist.md:136 s1: "quick" (Banned as filler)
peer-reviewer.md:177 s1: "Quick" (Banned as filler)
visualization.md:573 s1: "landscape" (Flagged, not banned)
```

Each is a name or a term of the source rules: "Quick start" is the section name the layout requires, "quick check", "quick assessment" and "Quick fix" are terms of the source rules, "very low article processing charge" is an example of a predatory sign, and "landscape" is page orientation. None is filler.

Semicolons outside tables, which the standard counts as running prose (table cells are not running prose; `peer-reviewer.md` holds 45 in table cells of its score tables):

```
SKILL.md 1 outside tables in 6871 words (0.15 per 1000)
abstract.md 0 outside tables in 1110 words (0.00 per 1000)
ai-disclosure.md 0 outside tables in 1628 words (0.00 per 1000)
argument-builder.md 0 outside tables in 642 words (0.00 per 1000)
citation-compliance.md 1 outside tables in 1400 words (0.71 per 1000)
draft-writer.md 0 outside tables in 2165 words (0.00 per 1000)
ethics.md 1 outside tables in 1424 words (0.70 per 1000)
intake.md 3 outside tables in 1556 words (1.93 per 1000)
integrity-verification.md 0 outside tables in 5780 words (0.00 per 1000)
literature-strategist.md 0 outside tables in 2755 words (0.00 per 1000)
peer-reviewer.md 0 outside tables in 2233 words (0.00 per 1000)
statements.md 2 outside tables in 1618 words (1.24 per 1000)
structure-architect.md 0 outside tables in 1317 words (0.00 per 1000)
visualization.md 0 outside tables in 2509 words (0.00 per 1000)
```

Sentences over 35 words that remain (the prose standard asks for under roughly 20 unless the mechanism needs more):

| File and line | Words | Why it keeps its form |
|---|---|---|
| SKILL.md:1 | 53 | the frontmatter description, which the layout asks to hold the mode names, the roles and the trigger phrases in one paragraph |
| SKILL.md:156 | 56 | a list of stop names; each name is a phrase and the list has as many items as the mode has stops |
| SKILL.md:179 | 39 | a list of the files the agent is given; each file is a name and the step needs all of them |
| SKILL.md:189 | 39 | a list of the files the agent is given; each file is a name and the step needs all of them |
| SKILL.md:245 | 44 | a list of stop names; each name is a phrase and the list has as many items as the mode has stops |
| SKILL.md:276 | 40 | a list of stop names; each name is a phrase and the list has as many items as the mode has stops |
| SKILL.md:292 | 40 | a list of stop names; each name is a phrase and the list has as many items as the mode has stops |
| SKILL.md:333 | 45 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:383 | 41 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:384 | 54 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:385 | 62 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:386 | 49 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:390 | 46 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:392 | 42 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:397 | 37 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:400 | 60 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:406 | 41 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:409 | 37 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:410 | 42 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:411 | 36 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| SKILL.md:415 | 36 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| citation-compliance.md:103 | 40 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| ethics.md:81 | 38 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| ethics.md:97 | 40 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| integrity-verification.md:17 | 48 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:18 | 48 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:94 | 36 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:96 | 37 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:131 | 39 | one rule that names four directories; the tool counts the initiative's name "Think. Check. Submit." as three sentence ends |
| integrity-verification.md:309 | 62 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:318 | 37 | a table row; each cell holds a phrase, and the tool counts the row as one sentence |
| integrity-verification.md:398 | 39 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| integrity-verification.md:405 | 36 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| literature-strategist.md:271 | 38 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |
| statements.md:64 | 40 | an enumeration of items that belong together; splitting it would separate items the reader needs in one place |

**Check 8. the layout and the pages of items 1 to 12** Status: DONE.

```
$ grep -n '^#' skills/paper/SKILL.md; ls skills/paper/references; wc -l skills/paper/SKILL.md
8:# Write and revise a manuscript
12:## Quick start
25:## Use instead
36:## What it reads
65:## Steps
154:### full
230:### outline-only
243:### revision
264:### abstract-only
274:### lit-review
290:### citation-check
303:### disclosure
311:## Agent prompts
340:## The patch file
376:## Stops
402:## Anti-patterns
417:## Rules
abstract.md
ai-disclosure.md
argument-builder.md
citation-compliance.md
draft-writer.md
ethics.md
intake.md
integrity-verification.md
literature-strategist.md
peer-reviewer.md
statements.md
structure-architect.md
visualization.md
     426 skills/paper/SKILL.md
exit 0
```

**Check 9. the `/writing` numbering rule and version** Status: DONE.

```
$ grep -n 'Number the findings\|version' skills/writing/SKILL.md | head -3
5:  version: "1.1.0"
251:- Number the findings 1, 2, 3 in the order the report gives them, across both parts, with the number before the first line of each finding. A finding that lists several places keeps one number.
275:| A model other than the configured one | The runner served one of the four agents a model that is not the configured one (Steps 7 and 8) | The configured model, the served model and the Claude Code version, as plain text | The user's decision, then `/writing` again |
exit 0
```

### The items of the brief

- Items 1 to 12, `skills/paper/SKILL.md` (see check 8 for its line count) and the 13 pages of `skills/paper/references/`: DONE. Evidence: the headings and the listing in check 8.
- Items 13 and 14, the wiring (`README.md`, `.agents/plan.yaml`, the two `plan` templates, `plan-terms.md` and the synced `docs/glossary.md`, `repo-setup`'s `docs/glossary.md` template, the five `agents/ordo-*.md`): DONE. Evidence: checks 1b and 4, and part 10.
- Item 15, `docs/academic-coverage.md`: DONE. 55 rows changed; `git diff --stat -- docs/academic-coverage.md` printed `55 insertions(+), 55 deletions(-)`; check 2 prints `ok:`.
- Item 16, the coverage records: DONE. Part 5.
- Item 17, the sentences about scripts: DONE except the exit 4 sentence in the first line. Part 6.
- Item 18, `skills/writing/SKILL.md` numbering rule and `"1.1.0"`: DONE. Evidence: check 9, and part 10.

## 5. Coverage records

One record per `rebuild: paper` row (43) and per row outside the 43 whose part goes to `paper` at entry 5 (12 of the 33 rows the brief lists; the other 21 are in the table after the records). Each record names the row and its source file, each part the row's reason takes for `paper`, and for each part the file of `skills/paper/`, the line number it has now, its section and the line quoted. A quote longer than 150 characters is cut at a word at 150 characters, with no ellipsis, and the file and line locate the rest. A part the reason sends elsewhere or drops is marked "not built here" with where it goes. Each record was written after reading the source file whole and the skill's file. The quoted stretches were re-checked by a script that finds each stretch in its file and prints nothing when every stretch is found once; `python3 $TMPDIR/paper2/cov/verify.py $TMPDIR/paper2/cov/records.txt; echo "exit $?"` printed `exit 0` and no line beginning `NOT FOUND` or `MULTI`. Paths under `skills/paper/` are written from that folder.

Row 51, `academic-paper SKILL.md`
- full mode, the approved outline: `SKILL.md:171`, ### full, item 5, "5. Raise the stop "The outline's approval"."
- full mode, two revision rounds: `SKILL.md:193`, ### full, item 12, "for draft review round 1, given the closing checks below"
- full mode, no orphan citations: `SKILL.md:219`, ### full, the closing checks, "- Every cited key has an entry in the `.bib`, and every entry is cited"
- full mode, closing check of six statements: `SKILL.md:188`, ### full, item 10, "Done when the manuscript holds the data availability, ethics, author contribution, conflict of interest, funding and AI disclosure statements."
- full mode, limitations: `SKILL.md:226`, ### full, the closing checks, "- The manuscript holds a limitations section."
- full mode, the formatter's pre-output checklist: `SKILL.md:215`, ### full, the closing checks, "The closing checks are given to the peer reviewer in each draft review round"
- lit-review mode: `SKILL.md:278`, ### lit-review, item 1, "1. Start the literature strategist (Steps 8), given `config.md`, the topic and the `.bib` when a `.tex` is given."
- lit-review mode, the strategist's page: `references/literature-strategist.md:86`, The four searches, "## The four searches"
- revision-coach and rebuttal-audit: not built here, rebuttal (entry 7)
- plan mode: not built here, entry 15.A
- zh-TW triggers, higher-education defaults, generator-evaluator contract: not built here, left out

Row 52, `academic-paper agents/abstract_bilingual_agent.md`
- five parts: `references/abstract.md:29`, The five parts, "The abstract has these five parts, in this order."
- 150 to 300 words: `references/abstract.md:22`, Which abstract, "- A journal abstract may run to 300 words when the venue states no limit."
- five to seven keywords outside the title: `references/abstract.md:77`, The keywords, "- The keywords are 5 to 7 terms that are not in the title and complement it."
- no citations: `references/abstract.md:58`, Writing the abstract, "- has no citation, unless the field's convention requires one."
- defined abbreviations: `references/abstract.md:59`, Writing the abstract, "- defines each abbreviation it uses."
- word budget below the hard cap: `references/abstract.md:87`, Abstract-only mode, "The abstract keeps 3 to 5 percent below the hard cap of the venue or of this page."
- protected hedging phrases: `references/abstract.md:88`, Abstract-only mode, "- **Protected hedging.** The hedge that qualifies each result in the body stays in the abstract's statement of that result"
- explicit time bounds in a reflexivity statement: `references/abstract.md:89`, Abstract-only mode, "- **Explicit time bounds.** A reflexivity statement in the abstract states its time with an explicit year range"
- an abstract never claims an audit that did not run: `references/abstract.md:90`, Abstract-only mode, "- **No audit that did not run.** The abstract and the agent's report claim no audit, review or verification that the run did not make"
- the abstract-only mode in the skill: `SKILL.md:270`, ### abstract-only, item 2, "2. Start the abstract agent (Steps 8 and 9) for that file, given `config.md` and the manuscript's files."
- the zh-TW abstract: not built here, left out

Row 53, `academic-paper agents/argument_builder_agent.md`
- thesis on three to five claim-evidence-reasoning chains: `references/argument-builder.md:29`, The sub-arguments, "The thesis breaks into 3 to 5 sub-arguments. Each rests on a chain of claim, evidence and reasoning:"
- counter-arguments and rebuttals: `references/argument-builder.md:51`, Counter-arguments and rebuttals, "Each sub-argument gets its strongest counter-argument and a rebuttal strategy:"
- two weak-argument signs stop drafting: `references/argument-builder.md:101`, The weak-argument signs, "- Two or more signs in a core argument stop the drafting"
- the stop that shows the argument: `SKILL.md:172`, ### full, item 5, "Show `outline.md` with its evidence map, the argument map of `arguments.md` and the weak-argument signs it lists"
- plan-mode stress test, scoring and chapter plan: not built here, entry 15.A

Row 54, `academic-paper agents/citation_compliance_agent.md`
- citations and references checked both ways: `references/citation-compliance.md:23`, Both ways, "The output of `lookup.py cite-keys` is the cross-check, and it is read as follows:"
- DOI form: `references/citation-compliance.md:62`, DOI and URL, "The output of `lookup.py check-urls` has one line per cited key."
- self-citation: `references/citation-compliance.md:77`, The checks of the whole reference list, "- **Self-citation ratio.**"
- age: `references/citation-compliance.md:78`, The checks of the whole reference list, "- **Currency.** A source older than 10 years is flagged unless it is seminal or foundational."
- retractions: `references/citation-compliance.md:80`, The checks of the whole reference list, "- **Retractions.** A retracted source is removed and replaced by another source."
- an unsupported claim stops the check: `references/citation-compliance.md:98`, An unsupported claim, "- A claim that is not in its source at all is marked Critical, stops the check"
- the \cite-against-.bib check: `SKILL.md:131`, Steps 11, "Run `lookup.py cite-keys '<main.tex>' '<.bib>'` and the same with `check-urls`."
- the citation-check mode: `SKILL.md:296`, ### citation-check, item 2, "2. Start the citation compliance agent (Steps 8 and 9), given `config.md`, the `.bib` and the two outputs."
- it corrects a format error itself: `references/citation-compliance.md:103`, The corrections, "- A correction that has one right answer is written as a patch"
- Chinese citation rules: not built here, stay out

Row 55, `academic-paper agents/draft_writer_agent.md`
- topic-evidence-explanation-link paragraphs: `references/draft-writer.md:67`, Paragraphs, "A paragraph moves in this order, and each part is one sentence where it can be:"
- sources predating the events they evidence: `references/draft-writer.md:95`, Citations, "- A source cited for an event or a result is one that existed before it."
- revises by hashed block patches: `references/draft-writer.md:141`, Patches, "Every change to a manuscript file after the first draft is a patch, written as the skill's "The patch file" gives."
- revises by hashed block patches, the patch file: `SKILL.md:342`, The patch file, "Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:"
- what `tools/manuscript` performs, the manifest: `templates/anchorize_tex.py:2`, head comment, "Build a block manifest for a LaTeX manuscript, without modifying it."
- what `tools/manuscript` performs, the apply: `templates/apply_tex_patch.py:2`, head comment, "Apply a block patch to a LaTeX manuscript, fail-closed."
- generator-evaluator phases, claim manifests and HTML citation layers: not built here, no successor

Row 56, `academic-paper agents/formatter_agent.md`
- the pre-output checklist (every section present): `SKILL.md:217`, Steps, the closing checks, "- Every section of the outline stands in the draft and holds text, not a placeholder."
- the pre-output checklist (title page): `SKILL.md:223`, Steps, the closing checks, "- The title page holds the title, the authors, their affiliations and the corresponding author."
- the pre-output checklist (required elements): `SKILL.md:225`, Steps, the closing checks, "- The manuscript holds the data availability, ethics, author contribution (CRediT), conflict of interest, funding and AI disclosure statements."
- the pre-output checklist (limitations): `SKILL.md:226`, Steps, the closing checks, "- The manuscript holds a limitations section."
- the pre-output checklist (DOIs): `SKILL.md:227`, Steps, the closing checks, "- Every source that has a DOI carries it in the `.bib`."
- conversion, format profiles, journal-over-user precedence, version scans: not built here, entry 15.A
- cover letters and blind review: not built here, submit-manuscript
- the provenance gates and the zh-TW LaTeX, xeCJK and Chinese Pandoc settings: not built here, nothing takes them
- the pre-output checklist (figure paths): `SKILL.md:218`, Steps, the closing checks, "- Every `\includegraphics` path names a file that exists."
- the pre-output checklist (citations and reference list): `SKILL.md:219`, Steps, the closing checks, "- Every cited key has an entry in the `.bib`, and every entry is cited"
- the pre-output checklist (heading levels): `SKILL.md:220`, Steps, the closing checks, "- Heading levels follow the outline."
- the pre-output checklist (font, spacing, margins, page numbers): `SKILL.md:221`, Steps, the closing checks, "- The font, spacing, margins and page numbers follow the venue's template or the limits stated in `config.md`."
- the pre-output checklist (journal requirements): `SKILL.md:222`, Steps, the closing checks, "- The requirements the venue states are met."
- the pre-output checklist (abstract and keywords): `SKILL.md:224`, Steps, the closing checks, "- The abstract is present and within the limit, and the keywords are present."
- the pre-output checklist (bibliography file): `SKILL.md:228`, Steps, the closing checks, "- The `.bib` that `\bibliography` names exists."
- the pre-output checklist (LaTeX compiles): `SKILL.md:208`, full, item 15, "15. Compile the manuscript in a copy."
- the pre-output checklist (content-loss word count and table counts after conversion): not built here, entry 15.A, with conversion
- the pre-output checklist (main file format, cover letter, conversion commands): not built here, submit-manuscript and entry 15.A

Row 57, `academic-paper agents/intake_agent.md`
- type: `references/intake.md:22`, Questions, marked by mode, "| Paper type | One type of the table below. | full, outline-only |"
- venue: `references/intake.md:25`, Questions, marked by mode, "| Venue | The target journal or conference, or "General". |"
- citation style: `references/intake.md:27`, Questions, marked by mode, "| Citation style | One style of the table below. |"
- length: `references/intake.md:28`, Questions, marked by mode, "| Length | The target word count. |"
- funding: `references/intake.md:34`, Questions, marked by mode, "| Funding | One row per funder, or "no funding". |"
- the materials in hand: `references/intake.md:29`, Questions, marked by mode, "| Materials in hand | Which of the six materials below the user has. |"
- the co-authors: `references/intake.md:32`, Questions, marked by mode, "| Authors | One row per author: name, affiliation, ORCID and whether the author is the corresponding author. |"
- style calibration from three or more past papers: `references/intake.md:119`, Style calibration, "- With three or more samples, the session reads each one"
- style calibration under the prose standard: `references/intake.md:121`, Style calibration, "- The profile is a soft guide. The prose standard and the discipline's conventions win wherever a sample departs from them."
- strict or mark-only DOI checking: `references/intake.md:110`, DOI checking, "- **Mark-only** is the default."
- the venue profile with only the limits the scholar states: `references/intake.md:79`, Venue limits, "- Every value comes from the user's answer, and a limit the user does not state is recorded as "not stated"."
- cs_ml: `references/intake.md:87`, The evidence profile, "- `cs_ml` is the default for a machine learning paper."
- the interview in the skill: `SKILL.md:93`, Steps 6, "6. Run intake, the session's interview."
- plan-mode questions and format profiles: not built here, entry 15.A
- zh-TW options: not built here, serve no hub paper

Row 58, `academic-paper agents/literature_strategist_agent.md`
- Boolean search: `references/literature-strategist.md:90`, The four searches, "| 1. Boolean search | `lookup.py search '<search string>' --limit 100` with the primary concepts. |"
- citation chaining: `references/literature-strategist.md:91`, The four searches, "| 2. Citation chaining | `lookup.py refs <DOI>` for each of the 5 to 10 core papers of layer 1. |"
- semantic search: `references/literature-strategist.md:93`, The four searches, "| 4. Semantic search | `lookup.py search '<research question>' --limit 100` with the research question as a sentence. |"
- preset criteria: `references/literature-strategist.md:42`, Criteria, "| Publication type | Peer-reviewed journals, books, conference proceedings |"
- two-stage screening: `references/literature-strategist.md:111`, Screening, "Screening has two stages."
- theme matrix: `references/literature-strategist.md:195`, The literature matrix, "- The matrix has one row per included source and one column per theme"
- gap types: `references/literature-strategist.md:207`, The gaps, "The agent lists at least 2 gaps that are specific and actionable, each of one of these types:"
- saturation stops: `references/literature-strategist.md:97`, The four searches, "- The search stops when at least 3 of these conditions hold:"
- the 70 percent concentration advisory: `references/literature-strategist.md:227`, The distribution advisory, "- When one known value accounts for 70 percent or more of the known entries of a dimension"
- lit-review mode takes the searches, screening, theme matrix, gap types, saturation stops and advisory: `SKILL.md:278`, ### lit-review, item 1, "1. Start the literature strategist (Steps 8), given `config.md`, the topic and the `.bib` when a `.tex` is given."
- searches, reference lists and citing-paper lookups made with lookup.py: `templates/lookup.py:2`, head comment, "Make every reference lookup of the paper skill, on the Python standard library alone."
- Taiwan databases, the passport corpus protocol and trust-chain fields: not built here, no user

Row 59, `academic-paper agents/peer_reviewer_agent.md`
- five weighted dimensions: `references/peer-reviewer.md:28`, The five dimensions, "| Methodological Rigor | 25% | An appropriate method, a valid design, transparent limitations. |"
- a verdict: `references/peer-reviewer.md:137`, The verdict, "| 8.0 to 10.0 | Accept | The run goes on. |"
- issues with severity and fix: `references/peer-reviewer.md:176`, The issues, "- Each issue has its section down to the section number, the passage that shows it, a suggested fix and an estimated effort"
- title checked against the findings: `references/peer-reviewer.md:153`, The process, step 3, "- the title matches the content."
- abstract checked against the findings: `references/peer-reviewer.md:154`, The process, step 3, "- the abstract reflects the results of the paper."
- conclusion checked against the findings: `references/peer-reviewer.md:155`, The process, step 3, "- the research question of the introduction is answered by the conclusion."
- re-review of flagged items and regressions: `references/peer-reviewer.md:237`, The second draft review round, "- The agent checks whether the revisions introduced new problems, and numbers them `D2-<m>`."
- the draft goes back at most twice: `references/peer-reviewer.md:247`, The second draft review round, "- The draft goes back to the draft writer at most twice in all: once after draft review round 1 and once after draft review round 2."
- full mode's one reviewer of the author's draft: `SKILL.md:195`, ### full, item 12, "- A verdict Minor Revision or Major Revision sends the issues to the draft writer"
- generator-evaluator phases: not built here, no successor
- the panel of paper-review: not built here, paper-review (entry 6)

Row 62, `academic-paper agents/structure_architect_agent.md`
- the paper type picks a structure: `references/structure-architect.md:23`, The structure, "- The paper type of `config.md` picks the structure."
- each section a purpose: `references/structure-architect.md:115`, The outline, section descriptions, "- **Purpose.** What the section accomplishes."
- a word count within 5 percent: `references/structure-architect.md:153`, The outline, word counts, "- The sum of the section word counts deviates by at most 5 percent from the total."
- maps every source: `references/structure-architect.md:168`, The outline, the evidence map, "- Every source of the literature report, or of the `.bib` when no report exists, is assigned to at least one section."
- adds transitions: `references/structure-architect.md:178`, The outline, transitions, "Each boundary between adjacent sections states:"
- the user approves the outline: `references/structure-architect.md:3`, the page's opening paragraph, "the user approves it at the stop "The outline's approval" before the draft writer runs."
- the approval stop: `SKILL.md:171`, ### full, item 5, "5. Raise the stop "The outline's approval"."

Row 63, `academic-paper agents/visualization_agent.md`
- a decision tree picks the chart type: `references/visualization.md:38`, Choosing the chart, "| Categories and values, 7 categories or fewer | Compare magnitudes | Bar chart | Pie chart |"
- 300 dpi: `references/visualization.md:63`, The standards of a figure, size and resolution, "| Single column | 3.3 in (84 mm) | Proportional | 300 dpi |"
- colourblind-safe palettes: `references/visualization.md:88`, The standards of a figure, colour, "Viridis, for continuous data, perceptually uniform and safe for colour-blind readers:"
- dual axes ruled out: `references/visualization.md:127`, The standards of a figure, pitfalls, "| Dual y-axes | The scales are arbitrary and imply a correlation. | Two separate panels. |"
- truncated axes ruled out: `references/visualization.md:128`, The standards of a figure, pitfalls, "| A truncated y-axis | It exaggerates small differences. | Start at 0, or mark the break clearly. |"
- missing error bars ruled out: `references/visualization.md:129`, The standards of a figure, pitfalls, "| Missing error bars | They hide the uncertainty. |"
- the LaTeX figure templates: `references/visualization.md:537`, The LaTeX environments, "The draft writer copies the environment of each figure from `figures.md`."
- ten checks per figure: `references/visualization.md:594`, The ten checks of a figure, "The agent runs these checks on every figure before it reports."
- value fidelity: `references/visualization.md:606`, The ten checks of a figure, "| 9 | Data accuracy | Every plotted value equals the value in the source data. | Correct the script. |"
- the data-and-script trace: `references/visualization.md:635`, The trace, "`figures.md` holds one entry for each figure and for each manuscript table whose data the agent produced."
- the visualization step in full mode: `SKILL.md:179`, ### full, item 7, "7. When the materials hold data for a figure, start the visualization agent (Steps 8)"

Row 65, `academic-paper examples/clinical_citation_verification_checklist.md`
- a reference resolves: `references/integrity-verification.md:44`, Looking a reference up, "- Every cited entry is looked up with `lookup.py resolve`, whatever the agent remembers of it."
- holds the claimed number at a page, table or quote: `references/integrity-verification.md:171`, Reading the source, "- The line starts with `> [@`, then the key, a comma, the locator, `]: ` and the passage in double quotes. The locator names a page, a section, a"
- the draft matches the source's population: `references/integrity-verification.md:229`, Claims that go beyond their source, "4. Does the draft generalize beyond the source's population, setting, stage or inclusion criteria?"
- the draft matches the source's metric: `references/integrity-verification.md:230`, Claims that go beyond their source, "5. Does the draft keep the source's endpoint, effect measure, absolute or relative framing, comparator and follow-up period?"
- the draft keeps the limitations: `references/integrity-verification.md:231`, Claims that go beyond their source, "6. Are the protected hedges kept: "retrospective", "observational", "in this cohort", "preliminary", "may", "associated with", "requires validation"?"
- the citation check in citation-check mode: `SKILL.md:296`, ### citation-check, item 2, "2. Start the citation compliance agent (Steps 8 and 9), given `config.md`, the `.bib` and the two outputs."
- the safety note: not built here, left out

Row 66, `academic-paper examples/clinical_epistemic_status_example.md`
- association read as cause: `references/integrity-verification.md:217`, Claims that go beyond their source, "| "associated with" | "caused" | Association to cause | "was associated with ..." |"
- a dropped hedge: `references/integrity-verification.md:218`, Claims that go beyond their source, "| "after adjustment for measured covariates" | The qualifier is omitted | A hedge is dropped |"
- a wider population: `references/integrity-verification.md:220`, Claims that go beyond their source, "| A named population or setting | A wider population implied | The scope widens | "in the studied cohort ..." |"
- a stronger verb: `references/integrity-verification.md:227`, Claims that go beyond their source, "2. Does the draft use "causes", "prevents", "proves", "establishes" or "should be used" where the source says "associated", "suggests", "may" or"
- a rewrite: `references/integrity-verification.md:214`, Claims that go beyond their source, "| Source signal | Draft wording | Upgrade | Safer wording |"

Row 74, `academic-paper references/abstract_writing_guide.md`
- structured abstract type: `references/abstract.md:15`, Which abstract, "| Journal article, structured | Labelled sections: Background, Purpose, Method, Results, Conclusion."
- unstructured abstract type: `references/abstract.md:16`, Which abstract, "| Journal article, unstructured | One paragraph without labels"
- extended conference abstract type: `references/abstract.md:19`, Which abstract, "| Extended conference abstract | Longer, for a conference submission."
- word counts per venue kind, conference: `references/abstract.md:18`, Which abstract, "| Conference abstract | The form the call for papers states. | 200 to 500 words, as the call states |"
- word counts per venue kind, journal and dissertation: `references/abstract.md:20`, Which abstract, "| Dissertation | The five parts below. | Up to 350 words |"
- five parts: `references/abstract.md:29`, The five parts, "The abstract has these five parts, in this order."
- keyword rules: `references/abstract.md:80`, The keywords, "- They are lowercase unless a proper noun, and they use established terms."
- the guide's checklist, one abstract page with the agent's rules: `references/abstract.md:111`, The report, "- The abstract is complete when it covers all five parts (four for a conference paper), is within the length, has 5 to 7 keywords that complement the"
- zh-TW: not built here, left out

Row 76, `academic-paper references/anti_leakage_protocol.md`
- claims, citations, data and methods come from project materials: `references/draft-writer.md:28`, The anti-leakage rule, "The draft is built from the project's materials and not from the agent's memory."
- methods limited to what the materials document: `references/draft-writer.md:32`, The anti-leakage rule, "- The method section describes only what the project's materials document."
- the paper skill flags gaps: `references/draft-writer.md:33`, The anti-leakage rule, "- A topic the materials do not cover is written as `[GAP: <what is missing>]` at its place and listed in the report."
- fills one from the model only with permission and a tag: `references/draft-writer.md:34`, The anti-leakage rule, "- A gap is filled from the agent's knowledge only where `config.md` grants permission for it"

Row 78, `academic-paper references/apa7_extended_guide.md`
- exact p values unless below .001: `references/draft-writer.md:105`, Statistics and language, "- A *p* value is exact, such as *p* = .032, unless it is below .001, where it is written *p* < .001."
- effect sizes always: `references/draft-writer.md:106`, Statistics and language, "- An effect size is always reported, such as Cohen's *d*, eta squared or *r*."
- 95 percent CI format: `references/draft-writer.md:107`, Statistics and language, "- A confidence interval is written as 95% CI [lower, upper]."
- decimals: `references/draft-writer.md:108`, Statistics and language, "- Proportions, correlations and inferential statistics take 2 decimal places"
- bias-free language: `references/draft-writer.md:110`, Statistics and language, "Bias-free language:"
- venue bibliography styles render the extended citation and reference forms: `references/citation-compliance.md:56`, The `.bib` entries, "- The way a style renders author lists, "&" or "and", the order of the reference list and the capitalization of titles belongs to the bibliography"
- venue templates replace the title page, running head, abstract page, headings and table and figure format: `SKILL.md:221`, ### full, the closing checks, "- The font, spacing, margins and page numbers follow the venue's template or the limits stated in `config.md`."

Row 81, `academic-paper references/credit_authorship_guide.md`
- fourteen CRediT roles: `references/statements.md:15`, Author contributions, "The statement uses the 14 roles of CRediT, the Contributor Roles Taxonomy."
- a lead-or-supporting matrix: `references/statements.md:36`, Author contributions, "- The contribution matrix has one cell per author and role, with `Lead` for the author primarily responsible"
- the four ICMJE conditions: `references/statements.md:55`, Authorship, "An author meets all four conditions of the International Committee of Medical Journal Editors (ICMJE):"
- acknowledgment rules: `references/statements.md:62`, Authorship, "- A person who meets fewer than four conditions is named in the acknowledgments with the contribution, not in the author list."
- AI is never an author: `references/statements.md:65`, Authorship, "- An AI tool is never an author or a co-author"
- the disclosure statements in the skill: `SKILL.md:187`, ### full, item 10, "10. Start the draft writer (Steps 8 and 9) for the six statements"
- higher-education examples, the Chinese version and the role mapping, the publisher tables: not built here, left out

Row 82, `academic-paper references/disclosure_mode_protocol.md`
- each AI-use category marked used, not used or uncertain: `references/ai-disclosure.md:23`, Categories of AI use, "- Each category is marked used, not used or uncertain at intake, and the user confirms every uncertain category there."
- the user confirms uncertain ones: `references/intake.md:134`, Authors and statements, "- An uncertain AI-use category is confirmed here with the user, and one the user cannot confirm stays "uncertain"."
- venue phrasing: `references/ai-disclosure.md:43`, The full statement, "- The statement is one paragraph in the venue's preferred voice (person and tense) with the venue's required phrasing elements"
- placement with access dates: `references/ai-disclosure.md:51`, The full statement, "- The placement is written as "Placement: <place> (<venue> policy, accessed <date> from <URL>)", and `disclosure.md` repeats it."
- an unknown venue's policy is requested: `references/ai-disclosure.md:40`, The full statement, "An unlisted venue's policy is the text the user pasted, used for this run only and not added to this page."
- the disclosure mode: `SKILL.md:307`, ### disclosure, item 1, "1. Start the draft writer (Steps 8 and 9), given `config.md`, `references/ai-disclosure.md`, `references/statements.md`, the manuscript's files and"
- policy anchors stay unrendered: not built here, left unrendered

Row 83, `academic-paper references/domain_evidence_profiles.md`
- cs_ml: preprints and proceedings count beside journals: `references/literature-strategist.md:52`, Criteria, "- `cs_ml` admits archival preprints such as arXiv, conference proceedings and industry technical reports, since peer review lags the field."
- non-reproducible results surfaced: `references/literature-strategist.md:53`, Criteria, "- Under `cs_ml` the agent surfaces non-reproducible results and benchmark cherry-picking as critical gaps."
- benchmark cherry-picking surfaced: `references/literature-strategist.md:53`, Criteria, "- Under `cs_ml` the agent surfaces non-reproducible results and benchmark cherry-picking as critical gaps."
- cs_ml the ML default: `references/intake.md:87`, The evidence profile, "- `cs_ml` is the default for a machine learning paper."
- lit-review mode asks for the profile: `references/intake.md:30`, Questions, marked by mode, "| Domain evidence profile | The profile of "The evidence profile" below. | full, outline-only, lit-review |"
- the other profiles and their machinery: not built here, left out

Row 85, `academic-paper references/funding_statement_guide.md`
- a statement for single funding: `references/statements.md:82`, Funding, "Single funder:"
- a statement for multiple funding: `references/statements.md:88`, Funding, "Several funders:"
- a statement for no funding: `references/statements.md:94`, Funding, "No funding:"
- a statement for partial funding: `references/statements.md:100`, Funding, "Partial funding:"
- funder disclaimers quoted verbatim: `references/statements.md:74`, Funding, "- A funder's own required disclaimer is quoted verbatim, and the statement does not paraphrase it."
- a separate conflict statement: `references/statements.md:78`, Funding, "- The funding statement and the conflict statement are two separate statements."
- publisher placement: not built here, entry 13's venues/
- funder texts, the Taiwanese formats: not built here, grant config; Taiwanese formats left out

Row 87, `academic-paper references/journal_submission_guide.md`
- the data availability template: `references/statements.md:145`, Data availability, "The data that support the findings of this study are openly available in <repository name> at <URL or DOI>."
- the CRediT template: `references/statements.md:15`, Author contributions, "The statement uses the 14 roles of CRediT, the Contributor Roles Taxonomy."
- the AI template (minimal): `references/ai-disclosure.md:57`, The full statement, "AI Disclosure: AI-assisted tools were used during the preparation of this manuscript. The authors reviewed and take full responsibility for the"
- the AI template (detailed): `references/ai-disclosure.md:63`, The full statement, "AI Disclosure: The authors used <tool name> during the preparation of this work."
- submission checks, cover letter, reviewers: not built here, stays with submit-manuscript
- the response letter: not built here, rebuttal
- higher-education journal tables: not built here, serve no one

Row 89, `academic-paper references/mode_selection_guide.md`
- Quick start routes users by what they have: `SKILL.md:17`, Quick start, "/paper revision <main.tex> <comments file>  revise a manuscript for referee comments or for a /writing report"
- Quick start, a completed paper and an abstract: `SKILL.md:18`, Quick start, "/paper abstract-only <main.tex>             write the abstract and the keywords"
- Quick start, a research question and literature: `SKILL.md:19`, Quick start, "/paper lit-review "<topic>" [<main.tex>]    review the literature on a topic, and add its entries to the manuscript's .bib"
- Quick start, the AI-usage disclosure statement: `SKILL.md:21`, Quick start, "/paper disclosure <main.tex>                write the AI disclosure and the other statements"
- Use instead points to rebuttal: `SKILL.md:29`, Use instead, "| Referee comments to answer with a response letter | `rebuttal` |"
- Use instead, a written rebuttal to audit: `SKILL.md:30`, Use instead, "| A written response to referee comments to audit | `rebuttal` |"
- Use instead, a panel review of a whole paper: `SKILL.md:31`, Use instead, "| The author's whole paper to review by a panel | `paper-review` |"
- Use instead, a vague idea: `SKILL.md:34`, Use instead, "| An idea to check for whether it holds up and is new | `idea` |"
- the plan-to-draft gate: not built here, entry 15.A
- zh-TW trigger rows, format-convert: not built here, unused

Row 90, `academic-paper references/paper_structure_patterns.md`
- the conference skeleton: `references/structure-architect.md:39`, The structure, "### The Conference Paper skeleton"
- the IMRaD skeleton: `references/structure-architect.md:71`, The structure, "### The IMRaD skeleton"
- written for ML as introduction, related work, method, experiments, results, discussion and conclusion: `references/structure-architect.md:41`, The structure, "The skeleton is written for machine learning. Its sections are the introduction, related work, method, experiments, results, discussion and"
- word allocations: `references/structure-architect.md:139`, The outline, word counts, "| Introduction | 15% | 10% | 12% | 12% | 10% | 15% |"
- a selection table: `references/structure-architect.md:28`, The structure, "- A paper type that is not specified and has no original data suggests Literature Review for a synthesis, Theoretical for a framework, and Case Study"
- the other four skeletons: not built here, the paper skill keeps only the conference and IMRaD skeletons

Row 92, `academic-paper references/policy_anchor_disclosure_protocol.md`
- the no-AI statement: `references/ai-disclosure.md:30`, What the statement says, "gives the sentence "No AI was used in preparing this paper.""
- silence when no AI was used: `references/ai-disclosure.md:35`, What the statement says, "no statement is written, since silence is correct when no AI was used."
- AI-quoted text attributed: `references/ai-disclosure.md:71`, Attribution and labelling, "Material quoted from an AI tool is attributed with a full citation of the quoted material."
- AI-generated material never cited as primary: `references/ai-disclosure.md:72`, Attribution and labelling, "AI-generated material is never cited as a primary source."
- venue entries take copyediting carve-outs: `references/ai-disclosure.md:139`, Venue policies, ACL, "language-only assistance such as paraphrasing or polishing, and short-form input assistance such as predictive keyboards, need no disclosure"
- the four anchors (prisma-trAIce, icmje, nature, ieee) and their precedence table: not built here, no skill renders the four anchors

Row 94, `academic-paper references/revision_patch_protocol.md`
- anchorize: `SKILL.md:112`, Steps, item 9, "Before every start, anchorize each with `anchorize_tex.py '<file>'`, so each manifest matches its file as it stands."
- patch: `SKILL.md:342`, The patch file, "Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:"
- apply: `SKILL.md:119`, Steps, item 10, "Then run it with `--manifest` as above and `--output 'patches/<nn>-<file name>.patched'`"
- ids stay fixed: `templates/anchorize_tex.py:10`, docstring, "Run it at the start of every revision round and rewrite nothing between this and apply_tex_patch.py"
- one stale hash rejects the whole patch: `templates/apply_tex_patch.py:32`, docstring, "An op's old_hash must equal the manifest's hash of its block, and the manifest must describe <base> as it is on disk."
- one stale hash rejects the whole patch (the session's reaction): `SKILL.md:125`, Steps, item 10, "Exit 2 with the field `kind` `stale-manifest`: anchorize again (Steps 9), and the agent writes the patch once more."
- structural changes need acknowledgement: `SKILL.md:127`, Steps, item 10, "When the user acknowledges it, the session runs the apply with `--acknowledge-structural`."
- patches are never hand-edited: `SKILL.md:122`, Steps, item 10, "Never edit a patch by hand, and never apply two patches to one file at once."
- the two scripts: `templates/apply_tex_patch.py:9`, docstring, "The script applies the operations of a patch to the blocks that anchorize_tex.py recorded in the manifest of <base>."

Row 95, `academic-paper references/statistical_visualization_standards.md`
- when not to draw a figure: `references/visualization.md:16`, Whether to draw a figure, "It draws no figure for these cases:"
- unequal histogram bins: `references/visualization.md:131`, Pitfalls, "| Histogram bins of unequal width | They distort the frequencies. | Equal bins. |"
- hex palettes: `references/visualization.md:104`, Colour, "| Blue | `#0077BB` | Group 1 or the baseline |"
- hex palettes (viridis): `references/visualization.md:91`, Colour, "#440154, #46327E, #365C8D"
- matplotlib templates: `references/visualization.md:147`, Python with matplotlib, "### Python with matplotlib"
- ggplot2 templates: `references/visualization.md:376`, R with ggplot2, "cb_palette <- c("#0077BB", "#33BBEE""
- LaTeX environments: `references/visualization.md:573`, The LaTeX environments, "A full-page landscape figure, with `\usepackage{pdflscape}` in the preamble:"

Row 96, `academic-paper references/venue_disclosure_policies.md`
- ICLR entry: `references/ai-disclosure.md:97`, Venue policies, ICLR, "- Source URL: https://iclr.cc/public/AuthorGuide"
- NeurIPS entry: `references/ai-disclosure.md:107`, Venue policies, NeurIPS, "- Source URL: https://neurips.cc/public/EthicsGuidelines"
- Nature entry: `references/ai-disclosure.md:117`, Venue policies, Nature, "- Source URL: https://www.nature.com/nature/editorial-policies/ai"
- Science entry: `references/ai-disclosure.md:127`, Venue policies, Science, "- Source URL: https://www.science.org/content/page/science-journals-editorial-policies"
- ACL entry: `references/ai-disclosure.md:137`, Venue policies, ACL, "- Source URL: https://www.aclweb.org/adminwiki/index.php/ACL_Policy_on_Publication_Ethics#Guidelines_for_Generative_Assistance_in_Authorship"
- EMNLP entry: `references/ai-disclosure.md:147`, Venue policies, EMNLP, "- Source URL: https://2026.emnlp.org/paper-integrity-policy/"
- access date, required phrasing and placement of each entry: `references/ai-disclosure.md:100`, Venue policies, ICLR, "- Required phrasing: state the specific tools and the specific tasks assisted"
- unlisted ones are requested: `references/ai-disclosure.md:40`, The full statement, "An unlisted venue's policy is the text the user pasted, used for this run only and not added to this page."
- entry 13's venues/: not built here, entry 13's `venues/` holds venue policies later

Row 97, `academic-paper references/vlm_figure_verification.md`
- values checked against data: `references/visualization.md:616`, The rendered figure, "1. The plotted values match the source data."
- series present: `references/visualization.md:617`, The rendered figure, "2. Every data series and every category is present."
- cut-off text: `references/visualization.md:623`, The rendered figure, "8. No text is truncated, overlapping or cut off at the edge."
- 8pt fonts: `references/visualization.md:622`, The rendered figure, "7. No text is smaller than 8 pt at publication size."
- two fix rounds: `references/visualization.md:628`, The rendered figure, "At most 2 fix passes follow the first render, so a figure is rendered at most 3 times."
- trace to data: `references/visualization.md:640`, The trace, "- Source data: <dataset name>, <path of the data file>"
- trace to script: `references/visualization.md:641`, The trace, "- Script: figures/figure_03.py, sha256 <hash>"
- trace to citing claims: `references/visualization.md:643`, The trace, "- Claims in the manuscript:"

Row 99, `academic-paper references/writing_judgment_framework.md`
- the clarity test's two drafting outcomes: `references/draft-writer.md:78`, The first draft, Paragraphs, "- Paragraphs carry unequal weight, following the clarity test."
- the judgment heuristic: `references/draft-writer.md:79`, The first draft, Paragraphs, "- A draft in which every paragraph has the same weight fails the clarity test."
- the paragraph-removal test, the reader's questions, the so-what per section, the credibility notes: not built here, writing (skills/writing/references/rules.md and registers.md)
- the revision decision matrix: not built here, rebuttal

Row 103, `academic-paper templates/conference_paper_template.md`
- motivation, question, contribution paragraph: `references/structure-architect.md:49`, The Conference Paper skeleton, "1.3 Contribution: one paragraph that states specifically what is new"
- related work ending in the gap: `references/structure-architect.md:52`, The Conference Paper skeleton, "2.2 The gap this paper addresses, ending the section"
- method: `references/structure-architect.md:54`, The Conference Paper skeleton, "3.1 The approach and why it was chosen"
- results per finding: `references/structure-architect.md:61`, The Conference Paper skeleton, "5.1 One subsection per result, with its tables and figures"
- limitations and conclusion: `references/structure-architect.md:65`, The Conference Paper skeleton, "7. Conclusion and future work"
- the default: `references/structure-architect.md:24`, The structure, "The Conference Paper skeleton is the default, since most papers of the hub go to conferences."
- the default type: `references/intake.md:58`, Paper type and length, "The default type is Conference Paper, which is the default skeleton of `references/structure-architect.md`"
- the four-part abstract of the template: `references/abstract.md:68`, The four-part conference form, "A conference paper's abstract has these four parts:"
- the references count and the AI disclosure line of the template: `references/structure-architect.md:69`, The Conference Paper skeleton, "- A conference paper typically has 15 to 25 references."
- the length of the template: `references/intake.md:56`, Paper type and length, "| Conference Paper | Concise presentation of research | 2,000 to 5,000 words |"

Row 104, `academic-paper templates/credit_statement_template.md`
- an author table with ORCID and corresponding author: `references/statements.md:35`, Author contributions, "- The author table has one row per author: name, affiliation, ORCID and whether the author is the corresponding author."
- the lead-or-supporting matrix: `references/statements.md:36`, Author contributions, "- The contribution matrix has one cell per author and role, with `Lead` for the author primarily responsible, `Supporting` for an assisting role and"
- the statement: `references/statements.md:40`, Author contributions, "- The statement lists, for each author in the matrix order, the roles with `Lead` or `Supporting`."
- an equal-contribution line: `references/statements.md:49`, Author contributions, "- When two authors share first authorship, one more line follows"
- a co-author agreement checklist: `references/statements.md:9`, Facts and gaps, "- The report lists each statement the co-authors must agree on before submission: the contribution roles, the funder details and the conflicts."
- the quality checks of the matrix: `references/statements.md:37`, Author contributions, "- The matrix leaves no author without a role."
- the zh-TW form: not built here, left out

Row 105, `academic-paper templates/funding_statement_template.md`
- a register of each funding source: `references/statements.md:70`, Funding, "- The funding register has one row per funder: the funder, the grant type, the grant number, the PI or role of the author, the period and,"
- the funder's role: `references/statements.md:72`, Funding, "- The funder role table marks, for each funder, whether it took part in the study design, the data collection, the analysis, the publication decision"
- statements per case: `references/statements.md:100`, Funding, "Partial funding:"
- funder formats including ERC and Horizon Europe: `references/statements.md:112`, Funding, "| ERC | This project has received funding from the European Research Council (ERC) under the European Union's Horizon 2020 research and innovation"
- funder formats including Horizon Europe: `references/statements.md:113`, Funding, "| Horizon Europe | This project has received funding from the European Union's Horizon Europe research and innovation programme under Grant Agreement"
- the Taiwanese formats: not built here, left out

Row 148, `academic-pipeline SKILL.md`
- optional parallel drafting: `SKILL.md:169`, Steps, full, item 4, "- When the Notes of `config.md` say "figures in parallel", start the visualization agent of item 7 together with it, and start item 6 after both have"
- optional parallel drafting (draft writer side): `references/draft-writer.md:137`, Figures in the first draft, "the session then starts the visualization agent together with the argument builder, and starts the draft writer after both have ended."
- the failure-mode checklist: `references/integrity-verification.md:314`, The failure modes of AI-assisted research, "At the first check and at the second check the agent rules out each of the 7 modes below"
- finalisation: not built here, entry 15.A
- stage order, entry, checkpoints, error recovery: not built here, researcher
- early stop: not built here, paper-review

Row 149, `academic-pipeline agents/pipeline_orchestrator_agent.md`
- patch sequencing (anchorize): `SKILL.md:112`, Steps, item 9, "- Before every start, anchorize each with `anchorize_tex.py '<file>'`, so each manifest matches its file as it stands."
- patch sequencing (apply): `SKILL.md:118`, Steps, item 10, "- Run `apply_tex_patch.py '<file>' 'patches/<nn>-<file name>.patch.json' --check-only --manifest 'patches/<nn>-<file name>.block-manifest.json'`."
- patch sequencing (structural escalation): `SKILL.md:127`, Steps, item 10, "- Exit 3: the stop "A structural patch"."
- the claim-audit gate: `references/integrity-verification.md:397`, The verdict, "- These block: a reference that is NOT_FOUND or MISMATCH, a claim its source does not support"
- the Style Profile: `references/intake.md:119`, Style calibration, "- With three or more samples, the session reads each one and records the style dimensions it shows in the row "Style profile""
- checks each DOI (entry 5's gate): `references/intake.md:110`, DOI checking, "- **Mark-only** is the default."
- checks each DOI (citation side): `references/citation-compliance.md:60`, DOI and URL, "## DOI and URL"
- the experiment-provenance alignment check: `references/integrity-verification.md:288`, The numbers and the project's runs, Claims against the runs, "| NOT_SUPPORTED_BY_PROVENANCE | The runs do not support the claim"
- coaching, the package gate, hashing and resume, the observer, the round-trip caps, the audit-artifact gate, slr_lineage: not built here, other skills or ended, as the reason states

Row 151, `academic-pipeline agents/integrity_verification_agent.md`
- looks every reference up rather than trusting memory: `references/integrity-verification.md:44`, The references, Looking a reference up, "- Every cited entry is looked up with `lookup.py resolve`, whatever the agent remembers of it."
- ends each as verified, not found or mismatched: `references/integrity-verification.md:60`, The references, Verdicts of a reference, "| VERIFIED | One record agrees with the entry in the fields above. | None |"
- ends each as verified, not found or mismatched (not found): `references/integrity-verification.md:61`, The references, Verdicts of a reference, "| NOT_FOUND | Three different queries found no record that agrees with the entry"
- ends each as verified, not found or mismatched (mismatched): `references/integrity-verification.md:62`, The references, Verdicts of a reference, "| MISMATCH | A record exists for a different publication"
- names patterns such as a DOI resolving to another paper: `references/integrity-verification.md:104`, The references, Patterns to look for, "- A fabricated DOI that resolves to a real but unrelated paper passes a check that only asks whether the DOI resolves."
- traces claims to their passages: `references/integrity-verification.md:165`, The claims, Reading the source, "7. The agent finds the passage that holds the claim and copies it, as one line, into the record as a passage line:"
- traces claims to the project's own runs: `references/integrity-verification.md:262`, The numbers and the project's runs, "- The agent finds the saved log, script run, notebook, table of results or config that produced the number, in the project's materials."
- checks numbers for consistency: `references/integrity-verification.md:273`, The numbers and the project's runs, Consistency, "- The same data point is the same in every paragraph, table and figure that states it."
- lookup rules included, made with lookup.py: `references/integrity-verification.md:45`, The references, Looking a reference up, "- With a DOI or an arXiv ID the call is `lookup.py resolve '<identifier>'`."
- cross-model verification, the pipeline's stage modes and the passport experiment declaration: not built here, the reason lists none of them; the optional cross-model check of the source is not built

Row 152, `academic-pipeline agents/claim_ref_alignment_audit_agent.md`
- splits each cited claim into sub-claims: `references/integrity-verification.md:190`, The claims, Judging a claim, "The agent splits the claim into its atomic sub-claims and judges each one against the passage."
- judges them against the retrieved source text: `references/integrity-verification.md:157`, The claims, Reading the source, "Each claim the prompt names rests on a passage that the agent reads in this run from the source's full text."
- never judging a source it did not read: `references/integrity-verification.md:185`, The claims, When the source cannot be read, "- The agent never judges a source it did not read, and it never says it read a source that the fetch did not return."
- keeps paywalls apart from transient outages (paywall): `references/integrity-verification.md:182`, The claims, When the source cannot be read, "| An access restriction | Every index that answered lists no open copy"
- keeps paywalls apart from transient outages (outage): `references/integrity-verification.md:183`, The claims, When the source cannot be read, "| An outage | An index is left out, or a URL fails to connect"
- flags uncited empirical sentences: `references/integrity-verification.md:244`, The claims, Uncited assertions, "A sentence is an uncited assertion when all of these hold:"
- unless the project's own run backs them: `references/integrity-verification.md:249`, The claims, Uncited assertions, "4. The project's own saved run does not back it."
- negative-constraint and drift checks, claim intent manifest: not built here, the manifest has no successor, so neither check is rebuilt
- calibration mode: not built here, goes to entry 15.A with references/claim_audit_calibration_protocol.md
- passport format, cache keys, prompt versioning: not built here, dropped, since they serve the pipeline's JSON passport and judge cache

Row 155, `academic-pipeline examples/integrity_failure_recovery.md`
- only the corrected items are rechecked: `references/integrity-verification.md:404`, Correcting, "- After the patches the next pass judges only the corrected items, with the same checks. It does not repeat the items that passed."
- a fabricated reference replaced by a verified source, every citing sentence rewritten: `references/integrity-verification.md:409`, Correcting, "- A fabricated reference is removed. Each sentence that cited it is rewritten to what a verified replacement source says"
- a corrected number names its page and table: `references/integrity-verification.md:411`, Correcting, "- A corrected number names the page and the table or figure of its source."
- a number from the wrong column of the right table: `references/integrity-verification.md:208`, The claims, Judging a claim, "- A number from a different column or measure of the right table is a MAJOR_DISTORTION."
- wrong years and initials: `references/integrity-verification.md:97`, The references, Patterns to look for, "| Subtle distortion | Correct authors and topic, with a wrong year, expanded initials or a swapped venue."

Row 159, `academic-pipeline references/ai_research_failure_modes.md`
- a result no run produced: `references/integrity-verification.md:320`, The failure modes of AI-assisted research, "| 3. A hallucinated result | A result corresponds to no run."
- a learned shortcut: `references/integrity-verification.md:321`, The failure modes of AI-assisted research, "| 4. Shortcut reliance | A real result comes from a spurious feature."
- a bug written up as a surprise: `references/integrity-verification.md:322`, The failure modes of AI-assisted research, "| 5. A bug presented as an insight | An unexpected result is written as a discovery."
- Methods that differ from the run config: `references/integrity-verification.md:323`, The failure modes of AI-assisted research, "| 6. A methodology that was not run | The Methods describes experiments, settings or datasets that the pipeline did not run."
- seven modes with detection questions: `references/integrity-verification.md:314`, The failure modes of AI-assisted research, "At the first check and at the second check the agent rules out each of the 7 modes below"
- every number traced to a saved run and config: `references/integrity-verification.md:260`, The numbers and the project's runs, "The agent traces every number the manuscript reports as its own result."
- a mode lacking its logs blocks: `references/integrity-verification.md:328`, The failure modes of AI-assisted research, "- A mode that is SUSPECTED blocks the run, and so does a mode among 1, 3, 5 and 6 with INSUFFICIENT EVIDENCE."

Row 162, `academic-pipeline references/claim_verification_protocol.md`
- claim scope: `references/integrity-verification.md:148`, The claims, The claim registry, "- Numerical claims: percentages, counts, effect sizes and p-values."
- three steps: `references/integrity-verification.md:159`, The claims, Reading the source, "1. The agent runs `lookup.py fetch '<DOI or arXiv ID>' '<temporary folder>' '<key>'`"
- verdicts: `references/integrity-verification.md:201`, The claims, Judging a claim, "| MAJOR_DISTORTION | The claim oversimplifies, exaggerates or misrepresents the source. | SERIOUS | The paper says "declined sharply", the source"
- sampling: `references/integrity-verification.md:17`, What the agent reads, "| First check | Full mode, before the draft review | Every cited entry | A sample of 30 percent of the claims, at least 10"
- the example column illustrates the verdicts: `references/integrity-verification.md:200`, The claims, Judging a claim, "| MINOR_DISTORTION | The claim paraphrases the source and keeps its meaning. | MINOR | The paper says "about 15%", the source says "15.2%". |"

Row 165, `academic-pipeline references/literature_corpus_consumers.md`
- searching starts from the user's own library: `references/literature-strategist.md:59`, Starting from the manuscript's .bib, "When the call gives a `.bib`, the searching starts there."
- screened under the same criteria as external results: `references/literature-strategist.md:61`, Starting from the manuscript's .bib, "- Every entry is screened under the criteria above, the same as an external result. No entry is pre-approved."
- every skipped entry given a reason: `references/literature-strategist.md:63`, Starting from the manuscript's .bib, "Every skipped entry is listed in `review.md` with its reason, and no entry is dropped without a line."
- the library never modified: `references/literature-strategist.md:64`, Starting from the manuscript's .bib, "- The entries of the `.bib` are never changed or removed. The new entries are only added."
- external search then fills the gaps: `references/literature-strategist.md:79`, Starting from the manuscript's .bib, "- With uncovered topics, the external search runs on those topics only."
- the passport block format has no role: not built here, the block of the page is "Screened from the manuscript's .bib", not the PRE-SCREENED block

Row 169, `academic-pipeline references/plagiarism_detection_protocol.md`
- sampled sentences searched and graded from original to verbatim: `references/integrity-verification.md:352`, The originality of the text, The screen of sampled sentences, "| VERBATIM | Identical or nearly identical text. | 20 or more consecutive identical words without quotation marks. |"
- sampled sentences searched (8 to 12 words): `references/integrity-verification.md:341`, The originality of the text, The screen of sampled sentences, "1. The agent runs `lookup.py search '<8 to 12 consecutive words of the sentence>' --limit 10`"
- a self-plagiarism check against the authors' earlier papers: `references/integrity-verification.md:364`, The originality of the text, Self-plagiarism, "3. The agent compares the methodology descriptions, the results narratives and the theoretical framework paragraphs with the earlier text."
- both gates: `references/integrity-verification.md:18`, What the agent reads, "| Second check | Full mode, after the draft review rounds"
- the six AI-writing indicators: not built here, they suit the writing skill's style rules

Row 183, `deep-research SKILL.md`
- the literature search: `references/literature-strategist.md:86`, The four searches, "## The four searches"
- fact-checking: `references/integrity-verification.md:190`, The claims, Judging a claim, "The agent splits the claim into its atomic sub-claims and judges each one against the passage."
- the ethics stop: `references/ethics.md:17`, Verdict and stop, "- A BLOCKED verdict names the specific problem and a resolution path."
- the AI disclosure: `references/ai-disclosure.md:44`, The full statement, "- The paragraph names the tool and the version, never "AI tools" alone, and names the categories marked used."
- the report pipeline, writing check, guided mode, review mode, method blueprint, handoff, routing, versions, spectrum, integration list: not built here, dropped or sent elsewhere as the reason states

Row 185, `deep-research agents/devils_advocate_agent.md`
- the question on the AI disclosure: `references/ethics.md:30`, AI disclosure, "- The disclosure is present and accurate against what the run did."
- the AI disclosure statement: `references/ai-disclosure.md:28`, What the statement says, "- The user's answer and the categories decide the output, and the first of these rules that matches applies."
- the two checks, the second-model critique, the concession protocol, the scoping check, the origin note: not built here, dropped or sent elsewhere as the reason states

Row 187, `deep-research agents/ethics_review_agent.md`
- stops once on an integrity problem, never on subject matter: `references/ethics.md:15`, Verdict and stop, "- Subject matter alone never blocks."
- can be overridden with recorded reasons: `references/ethics.md:19`, Verdict and stop, "- The session records the user's decision under "Decisions" in `config.md`, with the reasons of an override verbatim."
- data licence and privacy: `references/ethics.md:85`, Data, "- Every data source is legal to use"
- dual use with a responsible-use statement: `references/ethics.md:58`, Dual use, "| Moderate | Could be misused in specific contexts"
- conflicts: `references/ethics.md:97`, Conflict of interest, "- The conflicts to assess are financial"
- AI disclosure: `references/ethics.md:26`, AI disclosure, "- AI assistance is disclosed in the paper, with the tools named"
- fair representation: `references/ethics.md:67`, Fair representation, "- Multiple perspectives on contested issues are presented."
- whether the work involves human data: `references/ethics.md:114`, Human and patient data, "- The check first decides whether the work collects, uses or analyzes human-related data"
- the approval: `references/ethics.md:116`, Human and patient data, "- The paper states the approval of the board that approved the collecting study, with the approval number."
- consent obtained: `references/ethics.md:117`, Human and patient data, "- The paper states the consent obtained"
- de-identification: `references/ethics.md:118`, Human and patient data, "- The paper states the de-identification applied:"
- citations and retractions are audited elsewhere: `references/citation-compliance.md:80`, Retractions, "- **Retractions.** A retracted source is removed and replaced by another source."
- the ethics check runs before delivery in the run: `SKILL.md:203`, Steps, item 13, "A BLOCKED ethics verdict is the ethics stop."
- the review-level determination, consent-form elements, vulnerable-population protections, ethics training, the phase-five folder: not built here, dropped as the reason states

Row 190, `deep-research agents/report_compiler_agent.md`
- tracing claims to their passages: `references/integrity-verification.md:165`, The claims, Reading the source, "7. The agent finds the passage that holds the claim and copies it, as one line, into the record as a passage line:"
- ethics feedback: `references/ethics.md:10`, Verdict and stop, "| CONDITIONAL | A concern the paper can address. | The issue names the exact fix and goes to the draft writer"
- the AI disclosure statement: `references/ai-disclosure.md:43`, The full statement, "- The statement is one paragraph in the venue's preferred voice (person and tense) with the venue's required phrasing elements"
- the abstract-only protections (word budget): `references/abstract.md:87`, Abstract-only mode, "- **A word budget below the cap.**"
- the abstract-only protections (hedging): `references/abstract.md:88`, Abstract-only mode, "- **Protected hedging.**"
- the abstract-only protections (time bounds): `references/abstract.md:89`, Abstract-only mode, "- **Explicit time bounds.**"
- the abstract-only protections (no audit claimed): `references/abstract.md:90`, Abstract-only mode, "- **No audit that did not run.**"
- the report, the writing check, the quick structure, the APA layout, the HTML-comment layers, the claim manifest and experiment ids: not built here, dropped or sent elsewhere as the reason states

Row 195, `deep-research agents/source_verification_agent.md`
- resolves references with a title-similarity threshold: `references/integrity-verification.md:48`, The references, Looking a reference up, "- A ratio of 0.70 is the least a record needs to be a candidate."
- flags a DOI pointing at another title: `references/integrity-verification.md:49`, The references, Looking a reference up, "- A line that ends in `DOI_MISMATCH` is a record whose title differs from the first record the call found."
- sends an unconfirmed reference to the user: `references/integrity-verification.md:72`, The references, Verdicts of a reference, "the reference goes to the stop "A reference that cannot be confirmed"."
- removes a fabricated one: `references/integrity-verification.md:409`, Correcting, "- A fabricated reference is removed."
- the lookups made by lookup.py resolve: `templates/lookup.py:22`, docstring, resolve, "- resolve queries Crossref, OpenAlex, Semantic Scholar and arXiv and prints one line per index."
- the predatory-venue screen for the sources it cites: `references/integrity-verification.md:113`, The references, The predatory-venue screen, "The screen runs on each journal or proceedings that a cited entry names."
- the doubt about old ML sources, the seven evidence levels, the grading, the phase-two folder rule: not built here, dropped as the reason states

Row 208, `deep-research references/arxiv_api_protocol.md`
- title match at 0.70: `templates/lookup.py:22`, docstring, resolve, "a candidate matches at a title ratio of 0.70 or more"
- falls back to title search: `references/integrity-verification.md:67`, The references, Verdicts of a reference, "2. `lookup.py resolve` with the title alone."
- paces requests about three seconds apart: `templates/lookup.py:43`, docstring, arXiv requests, "with at least 3 seconds between the end of one and the start of the next"
- citations without an arXiv ID are skipped rather than unmatched: `templates/lookup.py:22`, docstring, resolve, "For a DOI or an arXiv ID, arXiv is queried only when the input holds an arXiv ID."
- citations without an arXiv ID (the line): `references/integrity-verification.md:47`, The references, Looking a reference up, "- For a DOI, the arXiv line says that the input has no arXiv ID. That line is not an outage."

Row 211, `deep-research references/crossref_api_protocol.md`
- a DOI lookup must match the title at 0.70: `templates/lookup.py:22`, docstring, resolve, "each other record's title is compared with it, and a record below 0.70 is printed with DOI_MISMATCH"
- title search as fallback: `references/integrity-verification.md:67`, The references, Verdicts of a reference, "2. `lookup.py resolve` with the title alone."
- the year read from the issued field: `templates/lookup.py:110`, CROSSREF_FIELDS, "CROSSREF_FIELDS = "DOI,title,author,issued,container-title""
- backoff on rate limits: `templates/lookup.py:44`, docstring, errors, "- An HTTP 429 waits 2 seconds and is retried, at most 3 times."
- the result field is omitted when Crossref is unreachable: `templates/lookup.py:45`, docstring, errors, "No field is written for a lookup that failed."

Row 212, `deep-research references/openalex_api_protocol.md`
- a DOI match counts only when the title agrees at 0.70: `templates/lookup.py:22`, docstring, resolve, "each other record's title is compared with it, and a record below 0.70 is printed with DOI_MISMATCH"
- falls back to title search: `references/integrity-verification.md:67`, The references, Verdicts of a reference, "2. `lookup.py resolve` with the title alone."
- breaks ties among candidates by year: `templates/lookup.py:22`, docstring, resolve, "those whose year equals --year are preferred when there are any"
- the four indexes lookup.py queries: `templates/lookup.py:22`, docstring, resolve, "- resolve queries Crossref, OpenAlex, Semantic Scholar and arXiv and prints one line per index."

Row 213, `deep-research references/semantic_scholar_api_protocol.md`
- title and DOI lookups need a 0.70 title match: `templates/lookup.py:22`, docstring, resolve, "a candidate matches at a title ratio of 0.70 or more"
- a DOI pointing at another title is flagged: `templates/lookup.py:22`, docstring, resolve, "each other record's title is compared with it, and a record below 0.70 is printed with DOI_MISMATCH"
- a miss goes on to further queries before being called not found: `references/integrity-verification.md:68`, The references, Verdicts of a reference, "3. `lookup.py search` with the first author's surname and the key words of the title."
- a miss is not called not found before three queries: `references/integrity-verification.md:61`, The references, Verdicts of a reference, "| NOT_FOUND | Three different queries found no record that agrees with the entry"
- its paper IDs detect duplicates: `references/integrity-verification.md:108`, The references, Duplicates, "- Two entries are duplicates when their lines show the same DOI, the same arXiv ID, the same OpenAlex ID or the same Semantic Scholar ID."
- DOI resolution and web search as further steps: not built here, the page's further steps are lookup.py queries on four indexes; no web search is used

Row 215, `deep-research references/ethics_checklist.md`
- dual use judged on concrete enabling detail, never on topic: `references/ethics.md:42`, Dual use, "The check screens on concrete specifics and never on subject matter."
- data used under its licence and privacy law: `references/ethics.md:87`, Data, "- Personal data complies with GDPR or the applicable privacy law."
- indirect identifiers and small groups protected: `references/ethics.md:90`, Data, "- Small groups are protected from identification, and so are indirect identifiers"
- disclosure check: `references/ethics.md:30`, AI disclosure, "- The disclosure is present and accurate against what the run did."
- conflict check: `references/ethics.md:99`, Conflict of interest, "- The funding sources are identified."
- reproducibility check: `references/ethics.md:105`, Reproducibility, "- The search strategies are documented: databases, terms and dates."
- fair-representation check: `references/ethics.md:81`, Fair representation, "- The representation audit asks four questions"
- human-subject approval, consent and de-identification checks: `references/ethics.md:118`, Human and patient data, "- The paper states the de-identification applied:"
- labelling AI-generated data: `references/ethics.md:93`, Data, "- AI-generated data is labelled as AI-generated, and no AI-generated content is cited as a source"
- labelling AI-generated data (disclosure page): `references/ai-disclosure.md:73`, Attribution and labelling, "- AI-generated data is labelled as AI-generated."
- never citing AI-generated content: `references/ai-disclosure.md:72`, Attribution and labelling, "- AI-generated material is never cited as a primary source."
- the training-bias note with the conflict check: `references/ethics.md:92`, Data, "- The training-data biases of the AI tools used are acknowledged in the paper."
- the training-bias note (conflict check): `references/ethics.md:100`, Conflict of interest, "- The biases of the researchers and of the AI tools are acknowledged."
- attribution is audited elsewhere: `references/ethics.md:34`, Attribution, "- The citation audit of `references/citation-compliance.md` and the reference and claim checks of `references/integrity-verification.md` cover"
- the knowledge-cutoff note, the review-level table, consent-form contents, vulnerable-population planning, ethics training: not built here, dropped as the reason states

Row 216, `deep-research references/failure_paths.md`
- the ethics stop: `references/ethics.md:18`, Verdict and stop, "- At the stop the user accepts the fix, overrides with reasons, or revises the passage."
- the ethics stop (the stops table): `SKILL.md:387`, Stops, "| The ethics stop | The ethics check returns BLOCKED"
- the other paths: not built here, dropped, idea, researcher as the reason states

Row 222, `deep-research references/mode_selection_guide.md`
- fact-checks: `references/integrity-verification.md:146`, The claims, The claim registry, "The agent scans the manuscript and writes a registry of these claims:"
- fact-checks (verdicts): `references/integrity-verification.md:202`, The claims, Judging a claim, "| UNVERIFIABLE | The source does not contain the claimed information. | SERIOUS |"
- routing, mappings: not built here, dropped, idea, paper-review, researcher as the reason states

Row 226, `deep-research references/source_quality_hierarchy.md`
- the predatory-journal screen: `references/integrity-verification.md:113`, The references, The predatory-venue screen, "The screen runs on each journal or proceedings that a cited entry names."
- the grading: not built here, dropped with the report of deep-research

Row 232, `deep-research templates/research_brief_template.md`
- the AI disclosure line: `references/ai-disclosure.md:78`, The line of a review, "The literature strategist writes one line at the end of `review.md`, under the heading "AI disclosure"."
- the quick brief: not built here, dropped with the quick mode of deep-research

### The other 21 rows of the 33

The brief lists 33 rows outside the 43 that name `paper` or entry 5. Twelve of them (56, 87, 99, 148, 149, 183, 185, 190, 216, 222, 226, 232) send a part to `paper` and have records above. The other 21 were read again one by one, and none sends a part to `paper` at entry 5:

| Row | Source file | Mark | Where its parts go (read from the row) |
|---|---|---|---|
| 68 | academic-paper `examples/imrad_hei_example.md` | drop | Dropped; `paper_structure_patterns.md` (row 90, recorded above) states the section shapes. |
| 73 | academic-paper `examples/version_family_reconciliation_example.md` | rebuild later: paper | Later, with the first comparison pass; `paper` at entry 15.A. Not built here. |
| 79 | academic-paper `references/changelog.md` | drop | Dropped. |
| 84 | academic-paper `references/failure_paths.md` | rebuild later: paper | Later; venue entries handle post-rejection switches. Not built here. |
| 88 | academic-paper `references/latex_template_reference.md` | rebuild later: paper | Later; conversion goes to entry 15.A. Not built here. |
| 93 | academic-paper `references/policy_anchor_table.md` | drop | Dropped; venue entries are written from each policy's own page. |
| 106 | academic-paper `templates/imrad_template.md` | drop | Pattern 1 of `paper_structure_patterns.md`, which row 90 records in `structure-architect.md`. |
| 108 | academic-paper `templates/literature_review_template.md` | rebuild later: paper | Later, after the first gate. Not built here. |
| 157 | academic-pipeline `references/adapters/overview.md` | drop | Dropped; the skill reads the `.bib` directly. |
| 161 | academic-pipeline `references/claim_audit_calibration_protocol.md` | rebuild later: paper | Later. Not built here. |
| 184 | deep-research `agents/bibliography_agent.md` | drop | Criteria, two-stage screening and the 70 percent advisory are in `literature-strategist.md` (rows 58 and 165); the rest is dropped. |
| 191 | deep-research `agents/research_architect_agent.md` | rebuild: researcher | `researcher` (entry 13); the approval statement with `ethics_review_agent.md` is row 187's, recorded above. |
| 194 | deep-research `agents/socratic_mentor_agent.md` | rebuild: idea | `idea`; `rebuttal`; plan mode at entry 15.A. Not built here. |
| 196 | deep-research `agents/synthesis_agent.md` | drop | The source-by-theme matrix is `literature-strategist.md` (row 58). |
| 197 | deep-research `agents/timeline_extraction_agent.md` | drop | Which version a sentence cites goes to entry 15.A. Not built here. |
| 199 | deep-research `examples/fact_check_mode.md` | drop | The per-claim check is `claim_verification_protocol.md` (row 162, recorded above in `integrity-verification.md`). |
| 207 | deep-research `references/argumentation_reasoning_framework.md` | drop | No file of `paper` reads it. |
| 210 | deep-research `references/cross_agent_quality_definitions.md` | drop | The strategist sets its own criteria (row 58). |
| 217 | deep-research `references/interdisciplinary_bridges.md` | drop | Forward citation tracking is in `literature-strategist.md` (row 58). |
| 218 | deep-research `references/irb_decision_tree.md` | drop | The human-subject determination and de-identification rules are in `ethics_checklist.md` (row 215, recorded above in `ethics.md`). |
| 230 | deep-research `templates/literature_matrix_template.md` | drop | The matrix layout is the strategist's (row 58). |

## 6. The sentences about scripts

Scratch trees: `$TMPDIR/paper2/c15c` and `c15d` (patch scripts), `cu`, `ft` and `lk` (lookup runs); logs `$TMPDIR/paper2/c15c.log` and `lookup.log`. `$K` is `skills/paper/templates`. The log lines `$ lookup.py ...` show the arguments joined by spaces; each was passed as one argument. Network answers (Semantic Scholar 429, arXiv timeouts, OpenAlex key errors) vary between runs; the sentences claim only what the script does with them, which the lines show.

**S1.** Sentences: `SKILL.md:113` "The script writes `<file>.block-manifest.json` beside the file."

Command: `python3 $K/anchorize_tex.py main.tex` on a scratch `main.tex` in `c15c/manuscript/`, then `ls -la` of the folder where the manifest was moved (`$K` is `skills/paper/templates`).

Output:

```
== patch 01 of main.tex
main.tex.block-manifest.json: 5 blocks, 141/150 chars in blocks
total 8
drwxr-xr-x@ 3 axelfaes  staff    96 Oct 19 13:36 .
drwxr-xr-x@ 3 axelfaes  staff    96 Oct 19 13:36 ..
-rw-r--r--@ 1 axelfaes  staff  1597 Oct 19 13:36 main.tex.block-manifest.json
```

**S2.** Sentences: `SKILL.md:118` "Run `apply_tex_patch.py '<file>'"

Command: `python3 $K/apply_tex_patch.py main.tex patches/01-main.tex.patch.json --check-only --manifest patches/01-main.tex.block-manifest.json`, with the exit status echoed.

Output:

```
$ apply --check-only (patch 01)
exit 0
checked
```

**S3.** Sentences: `SKILL.md:119` "which writes `patches/<nn>-<file name>.patched.apply-report.json`"; `SKILL.md:121` "Check the copy: `cmp`"

Command: The same call with `--output patches/01-main.tex.patched`, then `cp`, `cmp`, `shasum -a 256` of the file against `output_sha256` of the report; `grep -n output_sha256 patches/01-main.tex.patched.apply-report.json` printed the report line. A second patch, anchorized afresh, then `ls -la patches`.

Output:

```
$ apply --output (patch 01)
exit 0
cmp exit 0
sha: 555b68b269e53faa3abc5362f448ebb3a6e07d5aad09cefe2232ff7daf0d03fe  report: 555b68b269e53faa3abc5362f448ebb3a6e07d5aad09cefe2232ff7daf0d03fe
33:  "output_sha256": "555b68b269e53faa3abc5362f448ebb3a6e07d5aad09cefe2232ff7daf0d03fe"
== patch 02 of main.tex (anchorized again)
main.tex.block-manifest.json: 5 blocks, 150/159 chars in blocks
check exit 0
apply exit 0
cmp exit 0
sha: 6112a4f2cf2a5e3c23386651aa96ea6671f03ece3533d6dc15b62b870930cb55  report: 6112a4f2cf2a5e3c23386651aa96ea6671f03ece3533d6dc15b62b870930cb55
$ ls -la patches
total 64
drwxr-xr-x@ 11 axelfaes  staff   352 Oct 19 13:36 .
drwxr-xr-x@  3 axelfaes  staff    96 Oct 19 13:36 ..
-rw-r--r--@  1 axelfaes  staff  1597 Oct 19 13:36 01-main.tex.block-manifest.json
-rw-r--r--@  1 axelfaes  staff   389 Oct 19 13:36 01-main.tex.patch.json
-rw-r--r--@  1 axelfaes  staff   159 Oct 19 13:36 01-main.tex.patched
-rw-r--r--@  1 axelfaes  staff   945 Oct 19 13:36 01-main.tex.patched.apply-report.json
-rw-r--r--@  1 axelfaes  staff  1606 Oct 19 13:36 02-main.tex.block-manifest.json
-rw-r--r--@  1 axelfaes  staff   408 Oct 19 13:36 02-main.tex.patch.json
-rw-r--r--@  1 axelfaes  staff   168 Oct 19 13:36 02-main.tex.patched
-rw-r--r--@  1 axelfaes  staff   945 Oct 19 13:36 02-main.tex.patched.apply-report.json
drwxr-xr-x@  2 axelfaes  staff    64 Oct 19 13:36 pending
```

**S4.** Sentences: `SKILL.md:125` "Exit 2 with the field `kind` `stale-manifest`"

Command: The first manifest checked against the file after the first copy.

Output:

```
== stale check of manifest 01 against the file after copy
{
  "result": "rejected",
  "kind": "stale-manifest",
  "problems": [
    "the manifest does not describe the file on disk. Re-run anchorize_tex.py and have the writer re-emit the patch against the fresh manifest."
  ]
}
exit 2
```

**S5.** Sentences: `SKILL.md:123` "Exit 2 with the field `kind` `validation` or `schema`"

Command: A patch with empty `roadmap_item_ids`; a patch with `ops` empty; a patch written against another version of the file, whose `base_sha256` and `old_hash` do not match the manifest (the third block; its heading is the name of the attempt it came from).

Output:

```
== validation: empty roadmap_item_ids
{
  "result": "rejected",
  "kind": "validation",
  "problems": [
    "OP001: roadmap_item_ids must name at least one reviewer item"
  ]
}
exit 2
== schema: ops empty
{
  "result": "rejected",
  "kind": "schema",
  "problems": [
    "ops must be a non-empty list"
  ]
}
exit 2
== output kind: --output equal to the base
{
  "result": "rejected",
  "kind": "validation",
  "problems": [
    "the patch's base_sha256 does not match the manifest. The writer was looking at a different version of the manuscript.",
    "OP001: old_hash does not match the manifest entry for B0003. Copy it from the manifest, do not compute it. Block starts 'First paragraph cites \\\\cite{a2020}, revised.'"
  ]
}
```

**S6.** Sentences: `SKILL.md:126` "Exit 2 with the field `kind` `output`"

Command: `--output` equal to the base with a valid patch; `--output` and `--check-only` both missing.

Output:

```
== usage error: no --output and no --check-only
usage: apply_tex_patch.py [-h] [--manifest MANIFEST] [--output OUTPUT]
                          [--check-only] [--acknowledge-structural]
                          base patch
apply_tex_patch.py: error: --output is required unless --check-only is used
exit 2
== output kind with a valid patch, --output equal to the base
{
  "result": "rejected",
  "kind": "output",
  "problems": [
    "--output must differ from the base; the base is never modified"
  ]
}
exit 2
base unchanged
```

**S7.** Sentences: `SKILL.md:127` "Exit 3: the stop"; `SKILL.md:127` "`--acknowledge-structural`"

Command: A patch that rewrites `\section{Intro}` to `\section{Other}`, checked and applied without and with `--acknowledge-structural`. The script flags a section title rewritten; the touched ratio of a patch that touches 3 of 5 blocks is 0.6 and is not flagged (the script's rule is more than 0.6).

Output:

```
== structural: a section title rewritten
{
  "result": "rejected",
  "kind": "structural",
  "problems": [
    "heading rewritten: \\section{Intro} becomes \\section{Other}",
    "Narrow the patch, or rerun with --acknowledge-structural if the structural change is intended. The flags stay in the apply report either way."
  ]
}
check-only exit 3
apply without ack exit 3
check-only with --acknowledge-structural exit 0
apply with --acknowledge-structural exit 0
== structural: touched ratio over 0.6
  "block_touched_ratio": 0.6,
  "structural_flags": [],
exit 0
apply without ack exit 0
apply with --acknowledge-structural exit 0
```

**S8.** Sentences: `SKILL.md:128` "Exit 4 or exit 1"

Command: Exit 1 is run: `anchorize_tex.py missing.tex` and `apply_tex_patch.py` with a patch file that is not JSON. Exit 4 is not run (first line of this report); the script's header says what it is.

Output:

```
$ anchorize_tex.py missing.tex
           ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: 'missing.tex'
exit 1
ls: missing.tex.block-manifest.json: No such file or directory
$ apply_tex_patch.py with a patch that is not JSON
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
exit 1
63:- 4 for a self-check failure, which is a defect of this script.
```

**S9.** Sentences: `SKILL.md:362` "A `.bib` is anchorized as a `.tex` is"; `SKILL.md:363` "An entry is a block of its own only when a blank line separates it"

Command: `anchorize_tex.py` on a `refs.bib` of two entries separated by a blank line, then on `nob.bib` (two entries on consecutive lines, `cat` shown).

Output:

```
== refs.bib insert_after + cite-keys
refs.bib.block-manifest.json: 2 blocks, 116/119 chars in blocks
  B0001  frontmatter                    @article{a2020,
  B0002  frontmatter                    @article{b2021,
@article{a, title={A}}
@article{b, title={B}}
nob.bib.block-manifest.json: 1 blocks, 45/46 chars in blocks
```

**S10.** Sentences: `SKILL.md:357` "The `kind` field of an op is `replace_block`"

Command: Patches on a scratch `main.tex` (`c15d`): a `replace_block` with two ops on one block; a `replace_block` with a blank `new_text`; an unknown `kind`; a `delete_block` with an `insert_after` of the same text (a move of a paragraph, the file after it shown). Each ran through `apply_tex_patch.py ... --manifest ... --output ...`.

Output:

```
== twice
    "OP002: block B0006 is already addressed by OP001; a block takes at most one op"
exit 2
== blank
    "OP001: new_text is empty; use delete_block to remove a block"
exit 2
== unknown
    "OP001: kind must be one of ['delete_block', 'insert_after', 'replace_block'], got 'rename_block'"
exit 2
== move
applied 2 ['insert_after', 'delete_block'] []
exit 0
\documentclass{article}
\begin{document}

\section{Intro}

First paragraph cites \cite{a2020}.

Third paragraph.

Second paragraph.

\bibliography{refs}
\end{document}
```

**S11.** Sentences: `SKILL.md:137` "`unused:` line goes to the user"; `SKILL.md:136` "A `missing:` line"; `SKILL.md:139` "Exit 1 of these three commands"

Command: `lookup.py cite-keys main.tex refs.bib` on a `.bib` of three keys with a `.tex` that cites two of them, one that cites a key not in the `.bib`, and one that cites all three.

Output:

```
$ cite-keys, .tex citing a2020 and c2022
unused: b2021
exit 1
$ cite-keys, .tex citing a2020 and b2021 only
unused: c2022
exit 1
$ cite-keys, .tex citing d2023 (not in the .bib)
missing: d2023
unused: b2021
unused: c2022
exit 1
$ cite-keys, .tex citing all three keys
exit 0
```

**S12.** Sentences: `references/citation-compliance.md:67` "A line that ends in `DOI_MISMATCH`"; `references/citation-compliance.md:65` "A line "no identifier""; `SKILL.md:138` "An exit 2 and a line `title not checked: <index> left out`"

Command: `lookup.py check-urls t.tex t.bib` on a `.bib` of six cited keys (a good DOI, a DOI of another paper, no identifier, a DOI that does not exist, a URL that does not answer, and a key with no entry), with the network up and with `https_proxy` pointed at a closed port; then a call with a bad option.

Output:

```
good: 200 https://doi.org/10.1038/nature14539, ratio 1.00 against Crossref
mism: 200 https://doi.org/10.1038/nature14539, ratio 0.16 against Crossref, DOI_MISMATCH
noid: no identifier
ghostdoi: 404 https://doi.org/10.9999/nonexistent.12345, doi not found in Crossref, OpenAlex or Semantic Scholar
badurl: failed, no answer (URLError) https://example.invalid/page
absent: no entry in t.bib
exit 1
== network down
good: failed, no answer (URLError) https://doi.org/10.1038/nature14539, title not checked: Crossref left out, no answer (URLError); OpenAlex left out, no answer (URLError); Semantic Scholar left out, no answer (URLError)
mism: failed, no answer (URLError) https://doi.org/10.1038/nature14539, title not checked: Crossref left out, no answer (URLError); OpenAlex left out, no answer (URLError); Semantic Scholar left out, no answer (URLError)
noid: no identifier
ghostdoi: failed, no answer (URLError) https://doi.org/10.9999/nonexistent.12345, title not checked: Crossref left out, no answer (URLError); OpenAlex left out, no answer (URLError); Semantic Scholar left out, no answer (URLError)
badurl: failed, no answer (URLError) https://example.invalid/page
absent: no entry in t.bib
exit 1
== usage
exit 2
exit 2
error: --limit needs a whole number from 1 to 100
error: unknown option --year
```

**S13.** Sentences: `references/integrity-verification.md:45` "With a DOI or an arXiv ID the call is `lookup.py resolve '<identifier>'`"

Command: `lookup.py resolve 10.1038/nature14539` and `lookup.py resolve 'Attention is all you need' --year 2017`.

Output:

```
$ lookup.py resolve 10.1038/nature14539
Crossref: ratio 1.00: Deep learning | Yann LeCun, Yoshua Bengio, Geoffrey Hinton | 2015 | Nature | doi 10.1038/nature14539
OpenAlex: ratio 1.00: Deep learning | Yann LeCun, Yoshua Bengio, Geoffrey E. Hinton | 2015 | Nature | doi 10.1038/nature14539 | OpenAlex W2919115771 | open access https://hal.science/hal-04206682
Semantic Scholar: not found
arXiv: left out, the input has no arXiv ID
exit 0
$ lookup.py resolve Attention is all you need --year 2017
Crossref: ratio 0.88: Is Attention All You Need? | Patrick Mineault | 2025 | From Human Attention to Computational Attention | doi 10.1007/978-3-031-84300-6_13
OpenAlex: ratio 1.00: Attention Is All You Need | Ashish Vaswani, Noam Shazeer, Niki Parmar et al. | 2025 | doi 10.65215/2q58a426 | OpenAlex W2626778328 | open access https://langtaosha.org.cn/index.php/lts/preprint/download/10/108
Semantic Scholar: ratio 1.00: Attention is All you Need | Ashish Vaswani, Noam Shazeer, N. Parmar et al. | 2017 | Neural Information Processing Systems | arXiv 1706.03762 | Semantic Scholar 204e3073870fae3d05bcbc2f6a8e263d9b72e776
arXiv: ratio 1.00: Attention Is All You Need | Ashish Vaswani, Noam Shazeer, Niki Parmar et al. | 2017 | arXiv 1706.03762
exit 0
```

**S14.** Sentences: `references/integrity-verification.md:162` "the call writes `<stem>.abstract.txt` and exits 1"

Command: `lookup.py fetch 1706.03762 ft vaswani/2017:att`; `fetch` of a DOI with no full text and an abstract; of a DOI with neither; of a DOI whose index offers a PDF (the lines that bear on it).

Output:

```
$ lookup.py fetch 1706.03762 ft vaswani/2017:att
tried https://arxiv.org/html/1706.03762: HTTP 200, full text
$ lookup.py fetch 10.9999/nonexistent.12345 ftdir2 ghost
lookup OpenAlex: not found
lookup Semantic Scholar: not found
no full text and no abstract
exit 1
$ lookup.py fetch 10.1126/science.1127647 ftdir3 k
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: not found
no full text; the abstract is in k10_1126_science_1127647_.abstract.txt
exit 1
$ lookup.py fetch 10.1016/0893-6080(89)90020-8 ftdir3 k
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: no open-access URL
no full text and no abstract
exit 1
$ lookup.py fetch 10.1109/5.726791 ftdir3 k
lookup OpenAlex: found
tried https://hal.science/hal-03926082/document: HTTP 200, full text
exit 0
k10_1109_5_726791_.pdf
k10_1109_5_726791_.txt
k10_1126_science_1127647_.abstract.txt
```

**S15.** Sentences: `references/integrity-verification.md:173` "The call exits 1 while a line fails"

Command: `lookup.py quote-check q.md q.bib ftdir` on a passage file with a malformed line, a passage the abstract lacks, a missing page, a key with no text, a key with no passage and a key with no entry; then `q2.md` with one passage that is in the abstract.

Output:

```
$ lookup.py quote-check q.md q.bib ftdir
line 8: malformed passage line
line 5: vaswani/2017:att, abstract: not found, no vaswani_2017_att.abstract.txt
line 6: vaswani/2017:att, p. 2: not found
line 7: nofiles, p. 1: not found, no nofiles.txt
nofiles: no text
nopassage: no passage
nopassage: no text
absent: no entry
absent: no passage
absent: no text
exit 1
$ lookup.py quote-check q2.md q.bib ftdir (a found passage)
line 1: vaswani/2017:att, abstract s1: found
exit 0
```

**S16.** Sentences: `references/literature-strategist.md:90` "`lookup.py search '<search string>' --limit 100`"; `references/literature-strategist.md:34` "`lookup.py search` has no filter options"; `references/literature-strategist.md:91` "`lookup.py refs <DOI>`"; `references/literature-strategist.md:92` "`lookup.py cited-by <DOI>`"

Command: `lookup.py search 'deep learning' --limit 100` (the lines per index counted), `lookup.py refs 10.1038/nature14539`, `lookup.py cited-by 10.1038/nature14539`; the refusal of `--year` and of `--limit 101`, which shows that `search` has the one option `--limit`, is in S12.

Output:

```
exit 0
 100 [Crossref]
  99 [OpenAlex]
  99 [arXiv]
   1 Semantic Scholar: left out, HTTP 429 after 3 retries
refs exit 0
      51
Semantic Scholar: not found
cited-by exit 0
     102
OpenAlex: first 100, more exist
Semantic Scholar: not found
```

**S17.** Sentences: `references/literature-strategist.md:247` "`lookup.py bibtex <DOI or arXiv ID>`"; `references/literature-strategist.md:250` "or one for which `lookup.py bibtex` gets no entry"

Command: `lookup.py bibtex 10.1038/nature14539`, `lookup.py bibtex 1706.03762`, `lookup.py bibtex 10.9999/nonexistent.12345` (the first output line of the first is cut by `cut -c1-70` here because the entry is one long line).

Output:

```
$ lookup.py bibtex 10.1038/nature14539
 @article{LeCun_2015, title={Deep learning}, volume={521}, ISSN={1476-
lines:        1
$ lookup.py bibtex 1706.03762
@misc{arxiv_1706_03762,
  title = {Attention Is All You Need},
  author = {Ashish Vaswani and Noam Shazeer and Niki Parmar and Jakob Uszkoreit and Llion Jones and Aidan N. Gomez and Lukasz Kaiser and Illia Polosukhin},
  year = {2017},
  eprint = {1706.03762},
  archivePrefix = {arXiv}
}
exit 0
$ lookup.py bibtex 10.9999/nonexistent.12345
doi.org: HTTP 404, not a BibTeX entry
exit 1
```

**S18.** Sentences: `SKILL.md:62` "each optional, never printed"

Command: `grep -n 'S2_API_KEY' templates/lookup.py` and a run of `lookup.py resolve 10.1038/nature14539` with the three variables set to marker values, then `grep -c` of the markers in the output.

Output:

```
812:        self.s2_key = environment.get("S2_API_KEY", "")
813:        self.openalex_key = environment.get("OPENALEX_API_KEY", "")
814:        self.crossref_email = environment.get("CROSSREF_POLITE_EMAIL", "")
exit 0
marker lines: 0
Crossref: ratio 1.00: Deep learning | Yann LeCun, Yoshua Bengio, Geoffrey Hinton | 2015 | Nature | doi 10.1038/nature14539
OpenAlex: left out, HTTP 401
Semantic Scholar: left out, HTTP 403
```

**S19.** Sentences: `SKILL.md:83` "`printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1"; `SKILL.md:268` "`grep -l -F -e '\begin{abstract}' -e '\abstract{'`"

Command: `printenv CLAUDE_CODE_EFFORT_LEVEL; echo "exit $?"` in this session, and `grep -l -F -e '\begin{abstract}' -e '\abstract{'` over scratch `.tex` files: two hold an abstract and are listed, and a run over a file without one printed nothing.

Output:

```
exit 1
$ grep -l -F for the abstract
abs.tex
abs2.tex
exit 0
no hit exit 1
```

**S20.** Sentences: `SKILL.md:209` "`latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex`"

Command: `latexmk` in a scratch copy of a manuscript that compiles and one that does not.

Output:

```
$ latexmk compile in a copy
exit 0
  ./refs.bib
Latexmk: All targets (main.pdf) are up-to-date

main.pdf
exit 12
! Undefined control sequence.
!  ==> Fatal error occurred, no output PDF file produced!
```

## 7. Terms

Entries the diff changes or adds to, then entries the new text uses.

**effort agent** (changed in `docs/glossary.md` and `plan-terms.md`: "the role agents of `paper`" joins the list of what runs as `ordo-<reviewer_effort>`, and "`paper`, Steps 4 and 8" joins "Stated in"). Use read against the entry: `SKILL.md` Steps 4 checks that the runner lists the effort agent `ordo-<reviewer_effort>`, and Steps 8 starts each role agent as `ordo-<reviewer_effort>`; the entry defines the five agent definitions and who is launched as which, so both uses are in its sense. "Stated in" check, the item number under which each line stands (`awk` over the `Steps` section):

```
SKILL.md:83, Steps 4: 4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `print
SKILL.md:102, Steps 8:    - Start it as a fresh agent through the Agent tool, as `ordo-<reviewer_effort>` on the model `reviewer` nam
```

**reviewer** (changed in the same two files: "the role agents of `paper`" joins the agents that run on `reviewer:`, and "`paper`, Steps 8" joins "Stated in"). Use read against the entry: Steps 8 starts each role agent "on the model `reviewer` names", which is the sense of the entry (the model of the `reviewer:` key). Check:

```
SKILL.md:102, Steps 8:    - Start it as a fresh agent through the Agent tool, as `ordo-<reviewer_effort>` on the model `reviewer` names, with the prompt 
```

**draft review** (an existing entry of `docs/glossary.md` outside the synced block; its "Stated in" gains `paper`, "Steps / full" 12, because the skill now states it). The entry says it is one reviewer inside `paper`'s full mode who scores the draft, gives line-level feedback and a verdict, and sends it back to the draft writer at most twice. Use read against the entry: the term is used for full mode's peer reviewer only. Revision mode says "reading" (`SKILL.md` Steps revision 5, and `peer-reviewer.md`: "A reading is not a draft review"). Check of the new "Stated in":

```
SKILL.md:193, ### full, item 12
Stated in: `paper`, "Steps / full" 12; `docs/academic-coverage.md`, the row of academic-paper's `agents/peer_reviewer_agent.md`.
```

**finding** (not changed; the skill uses it). Use read against the entry: the entry gives a defect a reviewer reports, and for `/writing` a passage that breaks a named rule. `SKILL.md` uses "finding" for what `/writing` reports and for nothing else (Rules: "Role agents report issues, and the word \"finding\" is kept for what `/writing` reports"), and role agents report "issues". Lines of the skill and its pages that hold the word:

```
skills/paper/SKILL.md:3:description: "Write, revise and check a LaTeX manuscript through fresh agents that each hold one role: literature strategist, structure architect, argument builder, draft write
skills/paper/SKILL.md:143:    - Raise the stop "The findings to apply". The user answers once, in one line, by the numbers `/writing` prints before its findings: `all`, `all but 3, 7`, `2, 5` or `none
skills/paper/SKILL.md:145:    - Start the draft writer (Steps 8 and 9) with the accepted findings, each with its number and text. Each op of its patch names `W<k>` for the finding `k` it answers, and 
skills/paper/SKILL.md:146:    - Done when each accepted finding is applied or listed as not applied, or the user accepted none.
skills/paper/SKILL.md:156:Stops this mode can reach: the intake confirmation, the outline's approval, a reference that cannot be confirmed, a claim the run cannot support, the draft review does not pa
skills/paper/SKILL.md:245:Stops this mode can reach: the intake confirmation, a reference that cannot be confirmed, a claim the run cannot support, the findings to apply, a structural patch, a patch t
skills/paper/SKILL.md:248:   - A comments file that is a `/writing` report gives items `W<k>`, with `<k>` the number the report gives the finding. Any other comments file gives items `R<n>-<m>`.
skills/paper/SKILL.md:333:| Draft writer | `references/draft-writer.md` | The outline, the argument and the sources for a first draft; the items, issues or findings and the files with their manifests 
skills/paper/SKILL.md:370:| `W<k>` | Finding `k` of a `/writing` report |
skills/paper/SKILL.md:388:| The findings to apply | The `/writing` report is shown (Steps 12) | The report whole | One line: `all`, `all but 3, 7`, a list of numbers or `none`; the run goes on |
skills/paper/SKILL.md:414:| Every `/writing` finding applied without asking | The decision on each finding is the user's | Show the report and apply the findings the user names (Steps 12) |
skills/paper/SKILL.md:422:- Role agents report issues, and the word "finding" is kept for what `/writing` reports.
skills/paper/references/peer-reviewer.md:257:- A `/writing` report gives items `W<k>`, with `<k>` the number the report gives the finding.
skills/paper/references/draft-writer.md:12:- For a revision: the numbered items of `items.md`. For a draft review: the issues of `review-<r>.md`. For a citation fix: `citation-report.md`. For an integ
skills/paper/references/draft-writer.md:143:- The agent changes only the blocks that an item, issue or finding names, and writes each rewritten block whole in `new_text`.
skills/paper/references/statements.md:110:| NSF | This work was supported by the National Science Foundation under Grant No. <Number>. Any opinions, findings, and conclusions or recommendations expres
skills/paper/references/statements.md:145:The data that support the findings of this study are openly available in <repository name> at <URL or DOI>.
skills/paper/references/statements.md:151:The data that support the findings of this study are available from <source> but restrictions apply to the availability of these data, which were used under l
skills/paper/references/statements.md:161:- Data available on request from the authors, without restrictions from a third party, is written as "The data that support the findings of this study are ava
skills/paper/references/statements.md:177:Responsible Use: This research is intended for <stated purpose>. The authors acknowledge that findings related to <sensitive area> could potentially be applie
```

The lines of `SKILL.md` and the two in `peer-reviewer.md` and `draft-writer.md` are `/writing`'s findings. The five lines of `statements.md` are the verbatim text of a funder acknowledgement, of data availability statements and of a responsible-use statement that a manuscript carries; the manuscript's words are not the skill's.

**issue** (no entry; the skill's word for what a role agent reports). **open item** (entry in the glossary's block): used once, to say the skill leaves none (`SKILL.md` Stops: "They leave no open item, since this skill is not a plan skill"). **stop** (entry): every interruption of the skill that waits on the user is a stop, in a Stops table; the entry's "Stated in" for the table sense lists `repo-setup`, `roadmap` and `land` and is not extended (judgment call 5).

**round** (entry "round, of an interview": the bare word means an interview round in `grill` and a repair round elsewhere). The skill's repeats of the peer reviewer are "draft review round" and its other repeats are "pass". Check, which prints four lines and no bare "round" of the skill's own repeats: the patch JSON's field `round`, the report row "Draft review round" (capital D), and two uses of the ordinary adjective "round":

```
skills/paper/SKILL.md:349:  "round": 1,
skills/paper/references/peer-reviewer.md:196:| Draft review round | <1 or 2> |
skills/paper/references/integrity-verification.md:276:- Suspiciously round effect sizes are listed: exactly 0.5, exactly twice the baseline, or a variance of ex
skills/paper/references/integrity-verification.md:318:| 1. A bug that passes the AI's own review | The analysis code has a bug that gives plausible numbers. | D
```

**step** (entry: a plan step). The skill writes "Steps N" for its own numbered items, as the other skills do (`refute`: "Steps 1"), and calls the items of a mode "items"; `grep -rnw 'step\|steps' skills/paper/SKILL.md skills/paper/references` prints only research-method uses in `ethics.md` ("data processing steps", "step-by-step") and `integrity-verification.md` ("a preprocessing step the Methods describes").

**Doc text**, **fix at landing**, **resume point** and the other plan-orchestration terms: not used by the new text.

## 8. Files with line counts

`git status --porcelain -uall` lists 28 files. `git diff --stat` prints `14 files changed` for the 14 tracked ones; the other 14 are new (`skills/paper/SKILL.md` and its 13 pages). The three scripts and their tests under `skills/paper/templates/` were committed before this step and are unchanged.

```
      16 .agents/plan.yaml
     196 README.md
       6 agents/ordo-high.md
       6 agents/ordo-low.md
       6 agents/ordo-max.md
       6 agents/ordo-medium.md
       6 agents/ordo-xhigh.md
     234 docs/academic-coverage.md
     154 docs/glossary.md
      69 skills/plan/templates/orchestrator-state.md
      30 skills/plan/templates/plan.yaml
      13 skills/repo-setup/templates/docs/glossary.md
     134 skills/repo-setup/templates/plan-terms.md
     295 skills/writing/SKILL.md
     426 skills/paper/SKILL.md
     111 skills/paper/references/abstract.md
     150 skills/paper/references/ai-disclosure.md
     146 skills/paper/references/argument-builder.md
     141 skills/paper/references/citation-compliance.md
     183 skills/paper/references/draft-writer.md
     145 skills/paper/references/ethics.md
     142 skills/paper/references/intake.md
     481 skills/paper/references/integrity-verification.md
     271 skills/paper/references/literature-strategist.md
     270 skills/paper/references/peer-reviewer.md
     187 skills/paper/references/statements.md
     232 skills/paper/references/structure-architect.md
     670 skills/paper/references/visualization.md
    4726 total
```

## 9. Judgment calls

1. The patch id of two patches the brief's id list does not name. The figure environments of full mode (Steps/full 7) and the one patch that corrects a failed compile (Steps/full 15) carry the id `full`, the mode's name, as the brief's id rule gives for "a patch that answers a request of the mode itself". The alternative was a new id; none is needed.
2. A compile of the finished manuscript in a copy (Steps/full 15, `latexmk -pdf`, `-xelatex` when the Notes name it). The brief's closing checks come from the formatter's checklist item "LaTeX compiles"; the brief does not give the command. A failed compile goes to the draft writer once as a patch and is compiled once more; a still-failing compile or a runner without `latexmk` is named in the final message.
3. The Stops table holds 11 stops and, after them, 8 refusals (no plan configuration, unknown project, unknown mode, an argument that does not exist, the `.bib` is not one file, a manuscript that already exists, no prose standard, the configured effort cannot apply). The layout asks for one Stops table, so the refusals stand in it, and its introduction says the first eleven rows are stops that leave no open item and the rows after them are refusals.
4. Counts for repeats the source rules leave open, so that every repeat has one (the layout's "Writing for an agent"): a failed gate of the literature review is handled once as its row says (`literature-strategist.md:168`); `quote-check` is run once more after the agent corrects a passage and a line that still fails makes its claim one the run cannot support (`integrity-verification.md:173`).
5. The glossary. "Stated in" of **draft review** now names `paper`, "Steps / full" 12, because the skill now states it; that entry stands outside the synced block, so only `docs/glossary.md` changed for it. The entry **stop** is not extended: its "Stated in" for the table sense names `repo-setup`, `roadmap` and `land` and is not a list of every skill with a Stops table (`writing`, `grill` and the others are not named either).
6. The word "finding" in the pages. The source rules said "finding" for a study's result; the layout holds a glossary term to its defined sense, so the pages say "result" there. "finding" remains where it means a `/writing` finding (`SKILL.md` lines 143 to 146, 248, 388 and 414; `draft-writer.md:143`; `peer-reviewer.md:257`) and in the data availability and responsible-use statements that the manuscript carries verbatim (`statements.md` lines 110, 145, 151, 161 and 177). Command: `grep -rnw 'findings\?' skills/paper/SKILL.md skills/paper/references`.
7. The word "step" for an item of the skill's own Steps became "item" or "check", because the glossary's "step" is a plan step.
8. Punctuation of lists. List items end in a full stop, not a semicolon, and an item that held two clauses is two items, so that running prose has no more than 2 semicolons per 1000 words in any file (check 7 prints the count per file). Table cells keep their semicolons (45 in `peer-reviewer.md`'s score tables), which the standard does not count as running prose.
9. Sentences over 35 words. Those that held two rules were split. The 35 that remain are listed with a reason in check 7: stop-name lists, input lists, table rows and enumerations of items that belong together.
10. Where a part of a reason is held in two files, the reason names both with "held in X and Y" (for example row 52's last sentence names `abstract.md` and `SKILL.md`).
11. The records quote a stretch of the line when the line is longer than 150 characters, as part 5 says.

## 10. User-visible changes

1. New skill `/paper`. Before: `ls skills/paper` printed `templates`, and no `/paper` command existed. After: `skills/paper/SKILL.md` and 13 pages; Quick start gives seven modes:

   ```
   /paper full <project folder>                write a paper from the project's materials, from outline to checked draft
   /paper outline-only <project folder>        write the outline and the evidence map for approval
   /paper revision <main.tex> <comments file>  revise a manuscript for referee comments or for a /writing report
   /paper abstract-only <main.tex>             write the abstract and the keywords
   /paper lit-review "<topic>" [<main.tex>]    review the literature on a topic, and add its entries to the manuscript's .bib
   /paper citation-check <main.tex>            check the citations against the .bib and correct their format
   /paper disclosure <main.tex>                write the AI disclosure and the other statements
   /paper <project> <mode> ...                 the same when .agents/plan.yaml has the projects: form; <project> names the project whose keys are read
   ```

2. `/writing` report. Before: findings in groups, unnumbered; `metadata.version` `"1.0.0"`. After: the findings are numbered 1, 2, 3 in the order the report gives them, across both parts, with the number before the first line of each finding (`skills/writing/SKILL.md:251`), the description says "numbered", and the version is `"1.1.0"`. The report's other rules are unchanged. A user of `/paper` answers by those numbers.
3. `README.md`. Before: no `paper` row; the agent-definitions paragraph named `grill`, `writing` and `code-comments`; the install loop had no `paper`. After: a `paper` row (line 28), the paragraph names `paper` (line 79), the install loop copies `paper` (line 106), and the `writing` row says "grouped by rule and numbered".
4. `agents/ordo-low.md` to `agents/ordo-max.md`. Before: the description and the first prompt line named the plan skills, `grill`, `writing` and `code-comments`. After: both name `paper`'s role agents. Each frontmatter parses (check 4). No value changed.
5. `.agents/plan.yaml`, `skills/plan/templates/plan.yaml` and `skills/plan/templates/orchestrator-state.md`. Before: the comments on `reviewer` and `reviewer_effort` listed the agents of `writing` and `code-comments`. After: they list `paper`'s role agents; `git diff --stat` for the three files printed `3 files changed, 5 insertions(+), 5 deletions(-)` and every changed line is a comment.
6. `docs/glossary.md`, `skills/repo-setup/templates/plan-terms.md` and `skills/repo-setup/templates/docs/glossary.md`. Before: the entries **effort agent** and **reviewer** and the intro of repo-setup's `docs/glossary.md` template did not name `paper`; the "Stated in" of **draft review** named only `docs/academic-coverage.md`. After: they name `paper` and its steps (part 7); check 1b prints `ok: the plan-terms block equals the template`.
7. `docs/academic-coverage.md`. Before: no reason named a `skills/paper/` file (`grep -c` printed 1, the example). After: 55 reasons name the files that hold their parts, in the form ", held in `skills/paper/...`".

## 11. Wrong or impossible in the brief

1. Item 17 asks that every sentence about a script's behaviour be run against the script, and the sentence that `apply_tex_patch.py` exits 4 cannot be run: the script's header says `- 4 for a self-check failure, which is a defect of this script.` (S8, `apply_tex_patch.py:63`), and the no-breakage rule forbids making the script fail. The skill keeps the sentence because the exit status exists and the session must act on it.
2. Nothing else in the brief was wrong or impossible. The brief's line numbers for README (78 and 105) were the lines before the new table row; the same lines are 79 and 106 now.
## Repair round 1

Everything in the 21 points is done; no point is handed back. All commands below were run in this session from `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-2`. No script file was written; every check is a typed command and every edit was made with the Edit tool (the new page `skills/paper/references/patch-file.md` was created with the Write tool). Tests that touch skill folders ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The three scripts under `skills/paper/templates/` are unchanged (`git status --short skills/paper/templates | wc -l` printed `0`).

### Point 1. Coverage edits, records, C16, C17

Change. The 55 "held in" edits of `docs/academic-coverage.md` were made row by row with the Edit tool from the rows of `05a4bd6`. Rows 169 and 82 carry points 9 and 12, and row 52 now also names `skills/paper/SKILL.md` for the abstract-only mode.

```
$ git diff 05a4bd6 --stat -- docs/academic-coverage.md | tail -1
 1 file changed, 55 insertions(+), 55 deletions(-)
$ git diff 05a4bd6 -U0 -- docs/academic-coverage.md | grep -c '^+|'
55
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
```

Word comparison: `git diff 05a4bd6 --word-diff=porcelain --word-diff-regex='[^[:space:]]+' -- docs/academic-coverage.md` has 64 removed tokens. Each removed token is a word that gained a trailing `,` after the original `.` or `;`; a `grep -F` of every removed token (trailing `.`, `;`, `,` stripped) against the added tokens found each one, and the loop printed no `NO ADDED TOKEN` line.

Records. 355 records of part 5 quote a line of a file under `skills/paper/`. Each record was checked by `grep -n -F` of its quote in the file it names, and the line number it names must be among the lines printed. 260 stand at their line. 95 moved or changed after this round's edits; they are corrected under "Earlier passages" below, and each new line was printed by `grep -n -F` (for the 16 whose quote changed I ran `sed -n <line>p <file> | grep -F` and all 16 printed OK).

C16, from `grep -n` on the real files (research-hub, read only; the files stand at `projects/manuscripts/...`, `projects/active/...` and `projects/archive/...` now, not at the brief's paths). The rule is "What it reads" 5 (`SKILL.md:49` to `:55`).

```
== projects/manuscripts/dongho-ecg-clustering/manuscript/main.tex
838:\bibliographystyle{elsarticle-num}
839:\bibliography{refs}
== projects/active/linfoot-estimator/manuscript/main.tex
15:\bibliographystyle{plainnat}
501:\bibliography{main}
== projects/manuscripts/meseret-cirrhosis/notes/thesis/main.tex
565:\bibliographystyle{unsrt}
566:\bibliography{References}
569:% \bibliographystyle{unsrt}
570:% \bibliography{References}  
== projects/archive/published/2022/block-term-tensor-regression/manuscript/bare_jrnl.tex
1075:% can use a bibliography generated by BibTeX as a .bbl file
1080:\bibliographystyle{IEEEtran}
1081:% argument is your BibTeX string definitions and bibliography database(s)
1082:\bibliography{IEEEabrv,main}
1087:% \begin{thebibliography}{1}
1093:% \end{thebibliography}
== projects/manuscripts/ecg-readable-substrate/manuscript/main.tex
288:\begin{thebibliography}{99}
436:\end{thebibliography}
== scratch bibres.tex
2:\addbibresource{lib.bib}
```

Results read from those lines against the rule (text after an unescaped `%` left out, `\bibliographystyle` not a bibliography line, `.bib` added to a name without it):
- dongho: line 839 gives `refs.bib`; `ls` shows `projects/manuscripts/dongho-ecg-clustering/manuscript/refs.bib`.
- linfoot: line 501 gives `main.bib`; `ls` shows `main.bib`. Its `\input{tables_generated}` is at line 325 and `grep -c 'bibliography\|addbibresource' tables_generated.tex` printed `0`.
- meseret: line 566 is the one line; line 570 starts with `%` and is left out. It gives `References.bib`; `test -e References.bib` succeeded on this file system and `ls references.bib` shows the file. On a file system that ignores case it is found; on one that does not it is refused as not found.
- bare_jrnl: line 1082 names two files (`IEEEabrv`, `main`), so it is a refusal naming line 1082. Lines 1087 and 1093 are commented.
- ecg-readable-substrate: no `\bibliography` or `\addbibresource` line, so revision, citation-check and lit-review refuse and name the missing line; abstract-only and disclosure read no `.bib`.
- scratch file with `\addbibresource{lib.bib}`: `lib.bib` (`sed -n 's/.*\\addbibresource{\([^}]*\)}.*/\1/p'` printed `lib.bib`).

C17, run with inline `sh -c` (rule at `SKILL.md:77` to `:80`):

```
$ qp="'/tmp/my dir/it'\\''s here/main.tex'"; qt="'state \"of the art\" \$(echo INJECTED) \`echo INJ2\`'"
$ sh -c "printf '[%s]\n' $qp $qt"
[/tmp/my dir/it's here/main.tex]
[state "of the art" $(echo INJECTED) `echo INJ2`]
exit 0
$ sh -c "set -- $qp $qt; echo \"arguments: \$#\""
arguments: 2
exit 0
```

### Point 2. Numbered patch paths

Old (reviewer's quote): "Move that manifest with `mv` to `patches/pending/<file name>.block-manifest.json`" and "Move its manifest and its patch from `patches/pending/` to `patches/<nn>-<file name>.block-manifest.json`". New:

```
SKILL.md:114:   - Give each file its number before the agent starts: one more than the highest `<nn>` in `patches/` and than every number the run gave earlier, two digits, `01` when there is none. The files of one start take consecutive numbers.
SKILL.md:115:   - Before every start, anchorize each with `anchorize_tex.py '<file>'`, so each manifest matches its file as it stands.
SKILL.md:116:   - The script writes `<file>.block-manifest.json` beside the file. Make `patches/` in the run folder with `mkdir -p`, and move that manifest with `mv` to `patches/<nn>-<file name>.block-manifest.json`.
SKILL.md:117:   - Put in the prompt, for each file, its path, its manifest and the path `patches/<nn>-<file name>.patch.json` the agent writes its patch to.
SKILL.md:120:    - The patch stands at `patches/<nn>-<file name>.patch.json` and its manifest at `patches/<nn>-<file name>.block-manifest.json`, with the number Steps 9 gave the file.
SKILL.md:121:    - A file the agent did not change has no patch. Remove its manifest with `rm`, and do not give its number again.
SKILL.md:122:    - Run `apply_tex_patch.py '<file>' 'patches/<nn>-<file name>.patch.json' --check-only --manifest 'patches/<nn>-<file name>.block-manifest.json'`.
SKILL.md:123:    - Then run it with `--manifest` as above and `--output 'patches/<nn>-<file name>.patched'`, which writes `patches/<nn>-<file name>.patched.apply-report.json`.
SKILL.md:129:    - Exit 2 with the field `kind` `stale-manifest`: anchorize again (Steps 9), and the agent writes the patch once more. It counts as that one new patch.
SKILL.md:401:- Each patch keeps its manifest, patch, patched file and apply report in `patches/`, named by its number.
references/patch-file.md:23:- The agent writes its patch to the path its prompt gives, `patches/<nn>-<file name>.patch.json` in the run folder.
```

`grep -rn 'pending' skills/paper/` prints no `patches/pending`; its remaining hits are named under "Final greps". Reading of "one more than the highest `<nn>`": it also counts numbers given to files whose agent wrote no patch (their manifest is removed, so `patches/` no longer shows them), which "than every number the run gave earlier" covers; two files with one name in different folders get different numbers.

### Point 3. The stop "The draft review does not pass"

The stop is a build addition to item 10's list (ten stops). Its source is `agents/peer_reviewer_agent.md`, verdict Reject. The skill states it:

```
SKILL.md:354:The first eleven rows are stops, decisions for the user. They leave no open item, since this skill is not a plan skill. The rows after them are refusals, which name their cause and leave nothing.
SKILL.md:362:| The draft review does not pass | The verdict of a draft review round is Reject, or a Critical issue stays unresolved after draft review round 2 | `review-<r>.md` and the likely root cause | The user's decision to end the run or to go on with the issues listed as limitations |
```

### Point 4. Figures in parallel

Old (reviewer's quote): "When the Notes of `config.md` say "figures in parallel", start the visualization agent of item 7 together with it, and start item 6 after both have ended." New:

```
SKILL.md:180:6. Start the draft writer (Steps 8) for the first draft, given `config.md`, `outline.md`, `arguments.md`, `review.md`, `refs.bib` and the materials in hand. It writes `<project folder>/manuscript/main.tex` whole, at the path the session gives. The first draft includes no figure.
SKILL.md:182:   - When the Notes of `config.md` say "figures in parallel" and the materials hold data for a figure, start the visualization agent together with the draft writer, given the approved `outline.md` and `arguments.md`. Go on to item 7 after both have ended.
SKILL.md:184:7. When the materials hold data for a figure, run the visualization agent (Steps 8), given `config.md`, `outline.md`, `arguments.md`, the main `.tex` when item 6 has ended, and the names of the files in the manuscript's folder and in its `figures/` folder. It writes `figures/` and `figures.md` in the run folder.
SKILL.md:185:   - Under "figures in parallel" it was started in item 6 and is not started again. Without it, start it here, after item 6.
references/draft-writer.md:137:The first draft includes no figure environment. The agent adds the figures by a patch after the first draft, from `figures.md`, with their image names.
references/draft-writer.md:139:- When the Notes of `config.md` say "figures in parallel", the session starts the visualization agent together with the draft writer of the first draft. The patch adds the figure environments after both have ended.
references/intake.md:106:- When the materials hold data and the user wants the figures drawn while the first draft is written, the session records "figures in parallel" in the Notes.
```

Item 6 follows the stop "The outline's approval" (item 5), so both agents start after the approval. The sentence "This does not apply when item 6 already included the figures" is gone from item 7 (`grep -n 'does not apply when item 6' skills/paper/SKILL.md` prints nothing). Row 148 of the coverage file and its records name `SKILL.md:182` and `references/draft-writer.md:139`.

### Point 5. Integrity agent in revision

Old (reviewer's quote): "...given its row of `references/integrity-verification.md`, `config.md`, the apply reports of the patches, the `.bib`, the temporary folder and the project's materials." New:

```
SKILL.md:263:4. Start the integrity verification agent (Steps 8) for the check of changes, given its row of `references/integrity-verification.md`, `config.md`, the main `.tex` and the files it inputs as they stand after the patches, with the patched files named, the apply reports of the patches, the `.bib`, the temporary folder and the project's materials. It writes `integrity.md`.
SKILL.md:350:| Integrity verification | `references/integrity-verification.md` and `references/ethics.md` | The check and its row, the main `.tex` and the files it inputs for every check, the output of `cite-keys`, the temporary folder, the project's materials | `integrity-1.md` and `integrity-2.md` in full mode, `integrity.md` in revision and lit-review |
```

### Point 6. Citation compliance judges on a passage read

Old (reviewer's quotes): "A claim that the annotation does not contain and that the agent cannot place in the source is an unsupported claim." and "A claim that is not in its source at all is marked Critical, stops the check...". New:

```
references/citation-compliance.md:11:- The path of the temporary folder for fetched texts, which the session gives. The agent runs `lookup.py resolve`, `search`, `fetch` and `quote-check`.
references/citation-compliance.md:98:- A claim is judged only on a passage the agent read in this run from the source's full text.
references/citation-compliance.md:99:- The agent compares each cited sentence with the annotation of its source in the literature report. When the annotation holds the claim, no fetch is needed.
references/citation-compliance.md:100:- A cited sentence whose annotation does not hold the claim is checked against the source's full text.
references/citation-compliance.md:101:- In citation-check mode no `review.md` is given, and every cited sentence of the manuscript is checked so.
references/citation-compliance.md:102:- For each, the agent fetches the source with `lookup.py fetch '<DOI or arXiv ID>' '<temporary folder>' '<key>'` and reads the passage as `references/integrity-verification.md` "Reading the source" says.
references/citation-compliance.md:103:- It copies the passage into `citation-report.md` as a passage line, in the form that section gives, and runs `lookup.py quote-check '<citation-report.md>' '<the .bib>' '<temporary folder>'` before it reports.
references/citation-compliance.md:106:- A claim that the passage does not hold is marked Critical, stops the check, and the session raises the stop "A claim the run cannot support" for it.
references/citation-compliance.md:107:- A source the agent cannot read goes to the same stop, as the table "When the source cannot be read" of `references/integrity-verification.md` says, and the agent judges nothing from the annotation alone.
SKILL.md:99:   - It is made with `mktemp -d` before the first fetch, in the modes that start the integrity verification agent or the citation compliance agent: full, revision, citation-check and lit-review.
SKILL.md:136:    - Where the run judged claims, run `lookup.py quote-check '<run folder>/<record>' '<.bib>' '<temporary folder>'` once for each record of the run: `integrity-1.md` and `integrity-2.md` in full mode, `integrity.md` in revision and lit-review, and `citation-report.md` where it holds passage lines.
SKILL.md:190:   - A claim of a cited sentence that its passage does not hold is the stop "A claim the run cannot support", and so is a source it cannot read, as `references/integrity-verification.md` says.
SKILL.md:260:3. Run `lookup.py cite-keys` and `lookup.py check-urls` on the revised manuscript, and start the citation compliance agent (Steps 8 and 9), given `config.md`, the `.bib`, the two outputs and the temporary folder. It writes `citation-report.md`, and its patches have the ids `C<m>` (Steps 10).
SKILL.md:261:   - A claim of a cited sentence that its passage does not hold is the stop "A claim the run cannot support", and so is a source it cannot read.
SKILL.md:305:2. Start the citation compliance agent (Steps 8 and 9), given `config.md`, the `.bib`, the two outputs and the temporary folder. It writes `citation-report.md`, and its patches have the ids `C<m>`. Apply them (Steps 10).
SKILL.md:306:   - A reference it cannot confirm is the stop "A reference that cannot be confirmed". A claim of a cited sentence that its passage does not hold is the stop "A claim the run cannot support", and so is a source it cannot read.
SKILL.md:347:| Citation compliance | `references/citation-compliance.md` and `references/patch-file.md` | The outputs of `cite-keys` and `check-urls`, `review.md` in full mode, `refs.bib`, the temporary folder; the commands `resolve`, `search`, `fetch` and `quote-check` | `citation-report.md`, patches |
```

The full item 8 (the line that starts the agent in full mode) gives it the temporary folder, as `grep -n 'Start the citation compliance agent' skills/paper/SKILL.md` shows at lines 189 (item 8 of full), 260 and 305. Reading: in citation-check mode "each cited sentence it checks" is every cited sentence of the manuscript, since no annotation exists to stand in for a passage; each is fetched and quote-checked.

### Point 7. "hub"

Old: "The Conference Paper skeleton is the default, since most papers of the hub go to conferences." New:

```
references/structure-architect.md:24:- The Conference Paper skeleton is the default, since it suits a machine learning paper bound for a conference.
```

`grep -rn 'hub' skills/paper/` prints no line in `SKILL.md` or `references/`. The only other hits of the full grep are named under "Final greps". Rows 103's record carries the new quote.

### Point 8. Integrity records

Old (reviewer's quotes): "It writes `integrity.md` again." and "A later check writes a new record with its own numbers." New lines are `SKILL.md:136`, `:196`, `:198`, `:209`, `:211`, `:263`, `:264`, `:289`, `:291`, `:350` (printed under points 5 and 6 and below) and:

```
SKILL.md:196:11. Start the integrity verification agent (Steps 8) for the first check, given the first check's row of `references/integrity-verification.md`, `config.md`, `main.tex`, the `.bib`, `citation-report.md`, `figures.md` when it exists, the output of `lookup.py cite-keys`, the temporary folder and the project's materials. It writes `integrity-1.md`.
SKILL.md:198:    - A verdict FAIL sends its issues, ranked by severity, to the draft writer (Steps 8 and 9) with the ids `I<m>`, applied as Steps 10 says. The integrity agent then judges the corrected items and appends its judgments to `integrity-1.md` under "Pass <p>". The correction has at most 3 passes, and an item still open after the third goes to the stop that fits it.
SKILL.md:209:13. Start the integrity verification agent (Steps 8) for the second check, given the second check's row, the same inputs as item 11 and `integrity-1.md`, `review-1.md` and `review-2.md`. It judges the claims the draft review rounds changed and the claims the first check did not judge, and runs the ethics check of `references/ethics.md`. It writes `integrity-2.md`, and its ids `I<m>` go on from the highest of `integrity-1.md`.
SKILL.md:211:    - A verdict FAIL is corrected as in item 11, within its own 3 passes, and its judgments are appended to `integrity-2.md` under "Pass <p>".
SKILL.md:264:   - Stops and corrections are as in item 11 of full mode. The draft writer corrects with the ids `I<m>` within 3 passes, and the judgments of each pass are appended to `integrity.md` under "Pass <p>".
SKILL.md:289:2. Start the integrity verification agent (Steps 8) for the check of entries, given its row of `references/integrity-verification.md`, `config.md`, `review.md`, `refs.bib` and the temporary folder. It writes `integrity.md`.
SKILL.md:291:   - A verdict FAIL sends its issues to the literature strategist as a fresh start (Steps 8), which corrects `review.md` and `refs.bib`. The agent then judges the corrected items and appends its judgments to `integrity.md` under "Pass <p>". The correction has at most 3 passes.
references/integrity-verification.md:3:The integrity verification agent reads this page to check the references, the claims, the numbers, the originality and the ethics of a manuscript. It writes its integrity record in the run folder and changes no other file. The record is `integrity-1.md` for the first check, `integrity-2.md` for the second check, and `integrity.md` for the check of changes and for the check of entries. The corrections it asks for are patches that the draft writer writes, as `references/patch-file.md` gives.
references/integrity-verification.md:9:- `citation-report.md`, `review.md` and `figures.md`, when they exist, and `integrity-1.md` in the second check.
references/integrity-verification.md:483:- The numbers of `integrity-2.md` go on from the highest `I<m>` of `integrity-1.md`, so that one run never gives one id twice.
references/peer-reviewer.md:8:- `config.md`, `outline.md`, `arguments.md`, `citation-report.md` and `integrity-1.md`.
references/patch-file.md:36:| `I<m>` | Issue `m` of an integrity record; the ids of the second check go on from the highest of the first |
```

Every `integrity.md` in the skill folder is a record of the revision or lit-review check (named under "Final greps").

### Point 9. Row 169

Old (reviewer's quote): "sampled sentences searched on the web and graded from original to verbatim, and a self-plagiarism check against the authors' earlier papers, held in `skills/paper/references/integrity-verification.md`". New:

```
169:| `references/plagiarism_detection_protocol.md` | rebuild: paper | The paper skill's integrity check runs this screen at both gates: sampled sentences searched on the web and graded from original to verbatim, searched with `lookup.py search` in place of a web search, and a self-plagiarism check against the authors' earlier papers, held in `skills/paper/references/integrity-verification.md`. Its six AI-writing indicators alert without deciding and suit the `writing` skill's style rules. |
```

### Point 10. S5 third block and S14 stem

Run now on a fresh `mktemp -d` folder (removed afterwards with `rm -r`), with a patch written against the first version of `main.tex` and a manifest of the current one:

```
== validation: a patch written against another version of the file
{
  "result": "rejected",
  "kind": "validation",
  "problems": [
    "the patch's base_sha256 does not match the manifest. The writer was looking at a different version of the manuscript.",
    "OP001: old_hash does not match the manifest entry for B0002. Copy it from the manifest, do not compute it. Block starts 'First paragraph revised.'"
  ]
}
exit 2
```

The two other S5 blocks, as run now:

```
== validation: empty roadmap_item_ids
{
  "result": "rejected",
  "kind": "validation",
  "problems": [
    "OP001: roadmap_item_ids must name at least one reviewer item"
  ]
}
exit 2
== schema: ops empty
{
  "result": "rejected",
  "kind": "schema",
  "problems": [
    "ops must be a non-empty list"
  ]
}
exit 2
```

S14, `fetch 10.1126/science.1127647`, given the folder `$PWD` (`ft`) and the key `k` (the stem is the key with each `/` and `:` written `_`, here `k`):

```
$ lookup.py fetch 10.1126/science.1127647 "$PWD" k
lookup OpenAlex: no open-access URL
lookup Semantic Scholar: not found
no full text; the abstract is in k.abstract.txt
exit 1
$ ls -la
-rw-r--r--@  1 axelfaes  staff  576 Oct 19 15:22 k.abstract.txt
```

The file written is `k.abstract.txt`, and the sentence at `references/integrity-verification.md:162` ("the call writes `<stem>.abstract.txt` and exits 1") and the stem rule at `:161` agree with it.

### Point 11. BibTeX key rule

Old (reviewer's quotes): "an included source whose DOI or key is already in it gets no new entry" and "A new entry whose key only collides with an existing key gets the key with the first unused letter appended". New:

```
references/literature-strategist.md:251:- When the call gives a `.bib`, the rules apply in this order to each included source.
references/literature-strategist.md:252:  - A source whose DOI, or whose arXiv ID when it has no DOI, is already in the `.bib` gets no new entry and is marked "already in the .bib" in the annotation.
references/literature-strategist.md:253:  - Any other source whose key equals an existing key gets the key with the first unused letter appended: `a`, then `b`.
```

### Point 12. Row 82

Old (reviewer's quote): "an unknown venue's policy is requested, held in `skills/paper/references/ai-disclosure.md` and `skills/paper/SKILL.md`". New:

```
82:| `references/disclosure_mode_protocol.md` | rebuild: paper | Each AI-use category is marked used, not used or uncertain, and the user confirms uncertain ones, held in `skills/paper/references/ai-disclosure.md` and `skills/paper/references/intake.md`. Venue phrasing and placement apply with access dates, held in `skills/paper/references/ai-disclosure.md`, an unknown venue's policy is requested, held in `skills/paper/references/ai-disclosure.md` and `skills/paper/references/intake.md`, and policy anchors stay unrendered. |
references/intake.md:39:| Venue AI policy | The venue's AI policy text, pasted, for a venue `references/ai-disclosure.md` does not list. | full, disclosure |
```

### Point 13. Retractions

Old (reviewer's quote): "**Retractions.** A retracted source is removed and replaced by another source." New:

```
references/citation-compliance.md:82:- **Retractions.** The choice of a replacement for a retracted source has no single right answer, so the agent writes no patch for it. It flags the source as an issue `C<m>` marked "needs the user", with the retraction as the record shows it and up to 3 candidate replacements from `lookup.py search`, each with its record line. The session lists the issue in the final message.
references/citation-compliance.md:83:- A source cited to discuss the retraction itself is flagged with the suggested note "[Retracted]" after it. A source where only other results were retracted is flagged with the suggested note "[Partial retraction; cited results unaffected]". The agent changes neither by a patch.
references/citation-compliance.md:115:- A retracted source has no single right replacement, so it is flagged as "needs the user" and no patch changes it.
```

Rows 54 and 187 keep their "held in" (the records now point at line 82).

### Point 14. The patch file page

"The patch file" section (the JSON form, its bullets and the id table) moved whole to `skills/paper/references/patch-file.md` (37 lines). `SKILL.md` keeps one pointer where the section stood and names the page in "What it reads" 9, in Steps 9 and in the Agent prompts table:

```
SKILL.md:63:9. `references/intake.md`, read by the session at intake, and `references/patch-file.md`, read by the session at Steps 9. Each role agent reads the page of its own role (Agent prompts).
SKILL.md:113:   - Read `references/patch-file.md`, the form of a patch and its ids. The agent reads it with its own page.
SKILL.md:331:- For a role that writes a patch, the path, manifest and patch path of each file (Steps 9), and `references/patch-file.md` beside its own page.
SKILL.md:342:| Literature strategist | `references/literature-strategist.md` and `references/patch-file.md` | ...
SKILL.md:345:| Draft writer | `references/draft-writer.md` and `references/patch-file.md` | ...
SKILL.md:347:| Citation compliance | `references/citation-compliance.md` and `references/patch-file.md` | ...
SKILL.md:348:| Abstract | `references/abstract.md` and `references/patch-file.md` | The main `.tex` and the manifest of the file that holds the abstract | A patch |
references/patch-file.md:3:The session reads this page at Steps 9, and every role agent that writes a patch reads it with its own page. Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:
references/draft-writer.md:144:Every change to a manuscript file after the first draft is a patch, written as `references/patch-file.md` gives.
```

(The `...` in the three table rows above only shortens this message; the rows are whole in the file.) `grep -rn 'The patch file\|patch rule' skills/paper/` prints only `references/patch-file.md:1:# The patch file`. Rows 94 and 55 of the coverage file and their records name `references/patch-file.md` for the patch form and keep `SKILL.md` for the anchorize and apply steps.

### Point 15. One rule for the draft review stop

Old (reviewer's quotes): "After draft review round 2, an overall score of 6.5 or more goes on to item 13", "A verdict Reject, or a Critical issue unresolved after draft review round 2, is the stop", and in the peer reviewer "A score below 6.5 with a Critical issue unresolved, or a verdict of Reject in either draft review round, stops the run". New:

```
SKILL.md:202:    - A verdict Reject in either draft review round is the stop "The draft review does not pass".
SKILL.md:203:    - After draft review round 1, a verdict Minor Revision or Major Revision sends the issues to the draft writer (Steps 8 and 9) with the ids `D1-<m>`, applied as Steps 10 says. The peer reviewer is then started again as a fresh agent for draft review round 2, given `review-1.md`, the draft writer's revision log and the apply reports. It writes `review-2.md`.
SKILL.md:204:    - After draft review round 2, a Critical issue left unresolved is the stop, whatever the score.
SKILL.md:205:    - Otherwise after draft review round 2, an overall score of 6.5 or more goes on to item 13, with the issues that remain in the final message as acknowledged limitations.
SKILL.md:206:    - Otherwise a lower score sends the Major and Minor issues to the draft writer once more with the ids `D2-<m>`, and the run goes on to item 13 without a third draft review round.
references/peer-reviewer.md:138:| 8.0 to 10.0 | Accept | The run goes on. |
references/peer-reviewer.md:143:- The table gives the verdict of draft review round 1. A verdict Reject in either draft review round is the stop.
references/peer-reviewer.md:144:- After draft review round 2 the rule of "The second draft review round" decides, whatever verdict the table gives the score.
references/peer-reviewer.md:243:- A verdict Reject in either draft review round stops the run at the stop "The draft review does not pass".
references/peer-reviewer.md:244:- After draft review round 2, a Critical issue left unresolved stops the run at the same stop, whatever the score.
references/peer-reviewer.md:245:- Otherwise an overall score of 6.5 or more goes on, and the issues that remain go to the final message as acknowledged limitations.
references/peer-reviewer.md:246:- Otherwise a lower score sends the Major and Minor issues of `review-2.md` back to the draft writer once more, with the ids `D2-<m>`. The run then goes on without a third draft review round, and the issues still open go to the final message as acknowledged limitations.
references/peer-reviewer.md:253:- The draft goes back to the draft writer at most twice in all: once after draft review round 1 and once after draft review round 2.
```

(Line numbers of `peer-reviewer.md:143` to `:144` and `:243` to `:246` come from `grep -n` of those sentences; run it again before quoting if the file changes.) The glossary entry **draft review** says the draft goes back "at most twice", which matches.

### Point 16. Uncited entries

```
SKILL.md:226:- Every cited key has an entry in the `.bib`, as the output of `lookup.py cite-keys` shows.
SKILL.md:227:- An `unused:` line of that output is an issue marked "needs the user", which is not sent to the draft writer and goes to the final message (Steps 11).
SKILL.md:142:    - An `unused:` line goes to the user in the final message, and no role removes the entry. In lit-review the entries the run added are expected to print `unused:`.
references/peer-reviewer.md:162:   - every cited key has an entry in the `.bib`, as the output of `lookup.py cite-keys` shows. An `unused:` line of that output is an issue marked "needs the user".
references/peer-reviewer.md:184:- An issue that only the user can resolve, such as a `[GAP: ...]` placeholder or an `unused:` entry of the `.bib`, is marked "needs the user" and is not sent back to the draft writer. It goes to the final message.
```

Old (reviewer's quote): "Every cited key has an entry in the `.bib`, and every entry is cited, as the output of `lookup.py cite-keys` shows." Row 51's "no orphan citations" half and row 56's records now name `SKILL.md:226` (every cited key has an entry), `SKILL.md:227` and `references/peer-reviewer.md:162`/`:184` (the `unused:` line). `C15` shows `cite-keys` printing `unused: beta2021` for a `.tex` that does not cite a new key (below).

### Point 17. Counts for repeats

```
references/draft-writer.md:78:- Paragraphs carry unequal weight, following the clarity test. A load-bearing paragraph, one whose removal breaks the argument, is written with the most care and read and revised once more after its section is written. A supporting paragraph, one whose removal loses context but not the argument, stays short and is written once.
references/literature-strategist.md:97:- A pass is one run of the four layers. The search ends when at least 3 of the 5 conditions below hold, or after 4 passes, whichever comes first:
references/literature-strategist.md:107:- After 4 passes with fewer than 3 conditions holding, the agent records a "search limitation" in the report that names the conditions that hold, and goes on.
```

Old: "...written with the most care and revised several times." and "The search stops when at least 3 of these conditions hold:" with "When none of the 5 holds after 4 passes of searching, the agent records a "search limitation" in the report and goes on."

`grep -rn 'several times' skills/paper/` prints nothing; `grep -c -i 'until'` over the skill's files finds one hit, `references/structure-architect.md:232` ("The outline is a proposal until the user approves it at the stop "The outline's approval"."), which is a state and no repeat. The hits of `grep -rn -i 'again\|until' skills/paper/SKILL.md skills/paper/references/` that are repeats and their counts:
- `SKILL.md:96` intake record: up to 3 changes. `SKILL.md:149` findings answer: up to 3 answers. `SKILL.md:177` and `:247` outline changes: at most 3 times.
- `SKILL.md:127`/`:128`/`:129` patch rejection: one new patch, a second rejection is a stop. `SKILL.md:131`: narrowed once.
- `SKILL.md:203`: peer reviewer started again once (round 2). `SKILL.md:267`: "Reading 2", once. `SKILL.md:319`: draft writer once more, a second mismatch is a stop.
- `SKILL.md:217`: a failed compile goes to the draft writer once and the compile runs once more.
- `references/integrity-verification.md:71` and `:183`: asked or fetched again once. `:173`: `quote-check` corrected and run once more. `references/integrity-verification.md:198`-`:198` passes: at most 3 passes (SKILL.md:198, :211, :264, :291).
- `references/literature-strategist.md:163`/`:164`/`:168`: "A failed gate is handled once, as its row says."
- `references/visualization.md:627`/`:628`: at most 2 fix passes, 3 renders in all.
- `references/draft-writer.md:153`: a patch for a rejected patch is written once.
Other hits are not repeats: Stops-table "then `/paper` again" cells (a new run), `ethics.md:20` ("not blocked again"), `peer-reviewer.md:139`/`:140`/`:269` ("reads it again" at round 2 or at the re-review, each once), `structure-architect.md:173` (a suggestion in a report), `integrity-verification.md:163` ("as many pages as the claim needs", a quantity), `integrity-verification.md:328`/`:333` ("blocks again" at the second check), `intake.md:105` ("not asked for again").

### Point 18. `F<k>` and `W<k>`

```
SKILL.md:150:    - Start the draft writer (Steps 8 and 9) with the accepted findings, each with its number and text. Each op of its patch names `F<k>` for the finding `k` it answers, `k` being the number the `/writing` report gives, and the patches are applied as Steps 10 says.
SKILL.md:256:   - A comments file that is a `/writing` report gives items `W<k>`, with `<k>` the number the report gives the finding. Any other comments file gives items `R<n>-<m>`. The findings of the closing `/writing` review (Steps 12) are `F<k>`.
references/patch-file.md:32:| `W<k>` | Finding `k` of a `/writing` report given as the comments file of revision mode |
references/patch-file.md:33:| `F<k>` | Finding `k` of the `/writing` report of a run's own closing review (Steps 12) |
references/peer-reviewer.md:263:- A `/writing` report gives items `W<k>`, with `<k>` the number the report gives the finding.
references/draft-writer.md:12:- For a revision: the numbered items of `items.md`. For a draft review: the issues of `review-<r>.md`. For a citation fix: `citation-report.md`. For an integrity fix: the integrity record the prompt names. For an accepted `/writing` finding of the closing review: its number and text.
```

Old (reviewer's quote): "Each op of its patch names `W<k>` for the finding `k` it answers" in Steps 12, with one `W<k>` row in the id table.

### Point 19. Served model in disclosure mode

Old (reviewer's quote): "...and the model the runner served the agents of the run." for disclosure item 1. New:

```
SKILL.md:194:10. Start the draft writer (Steps 8 and 9) for the six statements, given `config.md`, `references/statements.md`, `references/ai-disclosure.md` and the model the runner served the agents already started in the run. Its patch has the id `full`. Apply it (Steps 10).
SKILL.md:316:1. Start the draft writer (Steps 8 and 9), given `config.md`, `references/ai-disclosure.md`, `references/statements.md` and the manuscript's files. It writes the statements as a patch with the id `disclosure` at the place the venue's policy gives, and `disclosure.md` in the run folder. The model identifier in the AI disclosure is the one its runtime states for itself.
SKILL.md:317:   - Before the patch is applied, compare that identifier, read from the patch's `new_text`, with the model the runner served the agent, read at Steps 8.
SKILL.md:318:   - Equal: apply the patch (Steps 10).
SKILL.md:319:   - Unequal: the patch is not applied. Start the draft writer once more as a fresh agent (Steps 8 and 9) with the served model in its prompt, and compare again. A second mismatch is the stop "A patch that does not apply".
references/ai-disclosure.md:11:- In disclosure mode no served model exists when the agent starts, so the agent writes the model identifier its runtime states for itself. The session compares it with the model the runner served the agent, and gives the served model in the prompt only when it starts the agent again after a mismatch.
references/ai-disclosure.md:46:- The model identifier is the one the runner served, never one written from memory. In disclosure mode the agent writes the identifier its runtime states for itself, and the session checks it against the runner's record of the model it served.
```

### Point 20. `check-urls` outage line

```
references/citation-compliance.md:65:- A line that holds "title not checked: <index> left out" is about the call or the network. The agent passes it to the user unchanged in its report, whatever the status part of the line says, and writes no issue `C<m>` and no correction for it.
references/citation-compliance.md:66:- The rules below read only a line without that text.
SKILL.md:140:    - A line of `check-urls` that holds `title not checked: <index> left out` goes to the user as printed, whatever its status part says. It is no issue `C<m>` and no correction.
SKILL.md:141:    - A `missing:` line, or a line of `check-urls` without that text that fails the status rules of `references/citation-compliance.md`, goes to the citation compliance agent, which corrects it as a patch (Steps 9 and 10). A quote that does not match goes to the agent that wrote the record.
```

The line the rule reads, as `check-urls` prints it with every index unreachable (`https_proxy` and `HTTPS_PROXY` set to a closed port, so no request leaves this machine):

```
d2023: failed, no answer (URLError) https://doi.org/10.1038/nature14539, title not checked: Crossref left out, no answer (URLError); OpenAlex left out, no answer (URLError); Semantic Scholar left out, no answer (URLError)
exit 1
```

### Point 21. Ethics count

```
references/ethics.md:22:- The check reviews all eight dimensions below and does not skip one: AI disclosure, attribution, dual use, fair representation, data, conflict of interest, reproducibility, and human and patient data.
references/ethics.md:132:- eight lines, one per dimension above, each with pass, warn, fail or not applicable, and the dual-use level.
```

### Verification of the brief's checks, rerun after the last edit

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
coverage exit 0
$ python3 -c '...glob skills/*/SKILL.md description lengths...' | grep 'skills/paper/\|skills/writing/'
838 skills/paper/SKILL.md
779 skills/writing/SKILL.md
$ python3 -c '...glob agents/ordo-*.md names...'
agents/ordo-high.md ordo-high
agents/ordo-low.md ordo-low
agents/ordo-max.md ordo-max
agents/ordo-medium.md ordo-medium
agents/ordo-xhigh.md ordo-xhigh
$ git ls-files -m -o --exclude-standard | grep -v '^\.scratch' | tr '\n' '\0' | xargs -0 sh -c '...' sh | xargs -0 perl -CSD -ne '...the brief's character-set check...'; echo "charset exit $?"
charset exit 0
```

The character-set check printed nothing over the 29 files `git ls-files -m -o --exclude-standard` lists outside `.scratch` (the 14 tracked files, `skills/paper/SKILL.md` and the 14 pages); `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md` printed nothing.

```
$ grep -rn 'research-hub\|entry [0-9]\|step [0-9]\|15\.A' skills/paper/SKILL.md skills/paper/references/
(no output, grep exit 1)
$ grep -rnw 'literature' skills/paper/SKILL.md skills/paper/references/ | grep -v 'literature strategist\|literature-strategist' | wc -l
37
```

The 37 lines of the second grep were each printed and read; each holds the ordinary noun "literature" (the literature review, the literature report or matrix, a gap in the literature, grey literature, "literature search") or, at `SKILL.md:19`, the lit-review usage line; none names a skill.

Final greps, `grep -rn 'pending\|integrity\.md\|The patch file\|patch rule\|hub\|several times' skills/paper/`, with every remaining hit named:
- `references/structure-architect.md:16` and `:216`: the outline marker "sources pending" / "Sources pending:", a literal label of the outline file.
- `references/draft-writer.md:46` and `references/abstract.md:97`: the placeholder `[GAP: abstract pending]`, a literal string in the manuscript.
- `references/patch-file.md:1`: the page's own title, `# The patch file`.
- `SKILL.md:136`, `:263`, `:264`, `:289`, `:291`, `:350` and `references/integrity-verification.md:3`: `integrity.md` as the record of the revision check and of the lit-review check (point 8); `integrity-1.md` and `integrity-2.md` are the full-mode records.
- `skills/paper/templates/lookup.py:958`, `:964`, `:978`, `:979`: a variable `pending` in the unchanged script.
- No hit for `hub`, `patch rule` or `several times`; no hit for `patches/pending`.

### C15, on a fresh `mktemp -d` folder, with the numbered paths

Scratch `main.tex` with four blocks; each patch anchorized afresh, its manifest moved with `mv` to `patches/<nn>-main.tex.block-manifest.json`; `A` is `skills/paper/templates`.

```
$ python3 $A/anchorize_tex.py main.tex          # patch 01
main.tex.block-manifest.json: 4 blocks, 97/104 chars in blocks
$ python3 $A/apply_tex_patch.py main.tex patches/01-main.tex.patch.json --check-only --manifest patches/01-main.tex.block-manifest.json   -> "result": "checked", exit 0
$ python3 $A/apply_tex_patch.py main.tex patches/01-main.tex.patch.json --manifest patches/01-main.tex.block-manifest.json --output patches/01-main.tex.patched   -> "result": "applied", exit 0
$ cp patches/01-main.tex.patched main.tex; cmp patches/01-main.tex.patched main.tex; echo "cmp exit $?"
cmp exit 0
$ shasum -a 256 main.tex; grep -n output_sha256 patches/01-main.tex.patched.apply-report.json
afad652121c4bfc7717a8bbc82f354c5bb2572a2d52e399b42d524350c2cb0ce  main.tex
33:  "output_sha256": "afad652121c4bfc7717a8bbc82f354c5bb2572a2d52e399b42d524350c2cb0ce"
$ python3 $A/apply_tex_patch.py main.tex patches/01-main.tex.patch.json --check-only --manifest patches/01-main.tex.block-manifest.json | grep -n 'kind\|result'    # first manifest after the first copy
2:  "result": "rejected",
3:  "kind": "stale-manifest",
exit 2
$ python3 $A/anchorize_tex.py main.tex          # patch 02, afresh
main.tex.block-manifest.json: 4 blocks, 100/107 chars in blocks
check exit 0, apply exit 0, cmp exit 0
33:  "output_sha256": "e16e6da03b61a625f9ed5bb7213040b5bc4fc0e4fb30ff45bf91a998b868f7a0"
e16e6da03b61a625f9ed5bb7213040b5bc4fc0e4fb30ff45bf91a998b868f7a0  main.tex
$ ls -la patches
-rw-r--r--@ 1 axelfaes  staff  1327 Oct 19 15:17 01-main.tex.block-manifest.json
-rw-r--r--@ 1 axelfaes  staff   380 Oct 19 15:17 01-main.tex.patch.json
-rw-r--r--@ 1 axelfaes  staff   107 Oct 19 15:17 01-main.tex.patched
-rw-r--r--@ 1 axelfaes  staff   854 Oct 19 15:17 01-main.tex.patched.apply-report.json
-rw-r--r--@ 1 axelfaes  staff  1331 Oct 19 15:17 02-main.tex.block-manifest.json
-rw-r--r--@ 1 axelfaes  staff   382 Oct 19 15:17 02-main.tex.patch.json
-rw-r--r--@ 1 axelfaes  staff   110 Oct 19 15:17 02-main.tex.patched
-rw-r--r--@ 1 axelfaes  staff   855 Oct 19 15:17 02-main.tex.patched.apply-report.json
$ cat main.tex
\documentclass{article}
\begin{document}

First paragraph revised.

Second paragraph revised.

\end{document}
$ python3 $A/apply_tex_patch.py main.tex patches/03-main.tex.patch.json --manifest patches/03-main.tex.block-manifest.json --output main.tex | grep -n 'kind\|result'
2:  "result": "rejected",
3:  "kind": "output",
exit 2
$ python3 $A/apply_tex_patch.py main.tex patches/04-main.tex.patch.json --check-only --manifest patches/03-main.tex.block-manifest.json | grep -n 'kind\|result'    # empty roadmap_item_ids
2:  "result": "rejected",
3:  "kind": "validation",
exit 2
```

`.bib`: a scratch `refs.bib` of three entries separated by blank lines took an `insert_after` patch (id `lit-review`) that adds `beta2021`; apply exit 0. (A one-entry `.bib` is refused as structural, exit 3, because the one block is 1.000 of the blocks; `references/patch-file.md:24`/`:25` say a block is a run of non-blank lines and an entry is its own block only when a blank line separates it.) Then:

```
new key cited (cites-all.tex):
exit 0
new key not cited (cites-not-new.tex):
unused: beta2021
exit 1
```

Sentences about scripts whose line numbers moved, with the line they stand at now: S1 `SKILL.md:116`, S2 `:122`, S3 `:123` and `:125`, S4 `:129`, S5 `:127`, S6 `:130`, S7 `:131` (twice), S8 `:132`, S9 `references/patch-file.md:24` and `:25`, S10 `references/patch-file.md:18`, S11 `SKILL.md:142`, `:141` and `:144`, S12 `references/citation-compliance.md:70` and `:68` and `SKILL.md:140` and `:143`, S13 `references/integrity-verification.md:45`, S14 `:162`, S15 `:173`, S16 `references/literature-strategist.md:90`, `:34`, `:91`, `:92`, S17 `:247` and `:250`, S18 `SKILL.md:62`, S19 `SKILL.md:83` and `:277`, S20 `SKILL.md:216`. Each was printed by `grep -n -F` of its quote.

### Check 7 (list items and sentences against the standards), rerun

`python3 skills/writing/templates/prose_facts.py <page> skills/repo-setup/templates/docs/dev/prose-standard.md` on each of the 15 files (existing tool, output read). Semicolons per 1000 words: SKILL.md 12 in 7243 words (1.66), abstract 0, ai-disclosure 1 in 1711 (0.58), argument-builder 0, citation-compliance 1 in 1694 (0.59), draft-writer 0, ethics 1 in 1443 (0.69), intake 3 in 1559 (1.92), integrity-verification 0, literature-strategist 0, patch-file 1 in 331 (3.02, in the id-table row `I<m>`), peer-reviewer 45 in 2334 (19.28, all in score tables), statements 7 in 1616 (4.33; `grep -n ';'` outside tables finds `statements.md:34`, `:65` and the funding statement at `:91`), structure-architect 0, visualization 0. Outside tables and code, `SKILL.md` has no semicolon after this round's edit; `SKILL.md:22` is the usage line in the Quick start code block. Banned-word hits: `SKILL.md:46`, `:74`, `:372` "Quick" (the section name "Quick start" and the table label), `integrity-verification.md:99` "quick" and `:128` "very" and `literature-strategist.md:136` "quick" and `peer-reviewer.md:182` "Quick" (terms of the source rules), `visualization.md:573` "landscape" (page orientation).

Sentences over 35 words, counted by splitting each non-table line at ". " (an awk count over the 15 files; 26 remain). This round's new or changed items were split where they held two rules (`SKILL.md:99`, `:182` now 33 words, `:264`, `:131`, `citation-compliance.md:100` to `:102`, `draft-writer.md:139`). The ones left and their form:
- Stop-name lists, which name every stop a mode can reach: `SKILL.md:161`, `:253`, `:285`, `:301`; the description `SKILL.md:3`.
- Lists of inputs or records that one start or run takes, which split into bullets that repeat the head: `SKILL.md:136` (the records `quote-check` runs on), `:184`, `:196`, `:263`; `integrity-verification.md:131`, `:397`, `:398`, `:406`.
- Enumerations of items that belong together and come from the source rules: `abstract.md:79`, `ai-disclosure.md:120`, `citation-compliance.md:112`, `ethics.md:81`, `:97`, `integrity-verification.md:328`, `:341`, `literature-strategist.md:272`, `peer-reviewer.md:166`, `:184`, `statements.md:64`, `:151` (the last is the statement text carried verbatim).

### Files with line counts

`wc -l`:

```
     402 skills/paper/SKILL.md
     111 skills/paper/references/abstract.md
     151 skills/paper/references/ai-disclosure.md
     146 skills/paper/references/argument-builder.md
     157 skills/paper/references/citation-compliance.md
     187 skills/paper/references/draft-writer.md
     145 skills/paper/references/ethics.md
     142 skills/paper/references/intake.md
     486 skills/paper/references/integrity-verification.md
     272 skills/paper/references/literature-strategist.md
      37 skills/paper/references/patch-file.md
     276 skills/paper/references/peer-reviewer.md
     187 skills/paper/references/statements.md
     232 skills/paper/references/structure-architect.md
     670 skills/paper/references/visualization.md
     234 docs/academic-coverage.md
```

`git status --short` lists 14 modified files, `skills/paper/SKILL.md`, `skills/paper/references/` (14 pages) and the untracked brief `.scratch/5-paper/agents/briefs/2-round-1.md`; the other files of part 8 (README, agents, plan files, glossary files, `skills/writing/SKILL.md`) have the counts the first report gave, which this round did not touch.

### Earlier passages of the report that no longer hold, with corrected text

**Part 5, the records.** 95 of the 355 records quote a line that moved or a text that changed; the other 260 stand (check above). Corrected references, old to new, quote unchanged unless marked:

- `SKILL.md`: 112 to 115 (rows 94, 149); 118 to 122 (149); 119 to 123 (94); 122 to 126 (94); 125 to 129 (94); 127 to 131 (94, 149); 131 to 135 (54); 171 to 175 (51, 62); 172 to 176 (53); 187 to 194 (81); 188 to 195 (51); 193 to 200 (51); 203 to 210 (187); 208 to 215 (56); 215 to 222 (51); 217 to 224, 218 to 225, 220 to 228, 221 to 229 (56 and 78), 222 to 230, 223 to 231, 224 to 232, 225 to 233, 226 to 234 (51 and 56), 227 to 235, 228 to 236 (all row 56); 270 to 279 (52); 278 to 287 (51, 58); 387 to 363 (216).
- `SKILL.md`, quote changed: row 51 "no orphan citations" and row 56 "citations and reference list": `SKILL.md:226` "- Every cited key has an entry in the `.bib`, as the output of `lookup.py cite-keys` shows." and, for the other half, `SKILL.md:227` "- An `unused:` line of that output is an issue marked "needs the user", which is not sent to the draft writer and goes to the final message (Steps 11)." and `references/peer-reviewer.md:162`; rows 54 and 65 "citation-check mode": `SKILL.md:305` "2. Start the citation compliance agent (Steps 8 and 9), given `config.md`, the `.bib`, the two outputs and the temporary folder."; row 59: `SKILL.md:203` "After draft review round 1, a verdict Minor Revision or Major Revision sends the issues to the draft writer"; row 63: `SKILL.md:184` "7. When the materials hold data for a figure, run the visualization agent (Steps 8)"; row 82 "the disclosure mode": `SKILL.md:316` "1. Start the draft writer (Steps 8 and 9), given `config.md`, `references/ai-disclosure.md`, `references/statements.md` and the manuscript's files."; row 148: `SKILL.md:182` "When the Notes of `config.md` say "figures in parallel" and the materials hold data for a figure, start the visualization agent together with the draft writer" and `references/draft-writer.md:139` "- When the Notes of `config.md` say "figures in parallel", the session starts the visualization agent together with the draft writer of the first draft."; rows 55 and 94 "the patch file": `references/patch-file.md:3` "Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:" and `SKILL.md:113` "Read `references/patch-file.md`, the form of a patch and its ids."; row 55 and `draft-writer.md`: `references/draft-writer.md:144` "Every change to a manuscript file after the first draft is a patch, written as `references/patch-file.md` gives."
- `references/ai-disclosure.md`, all plus 1: 23 to 24, 28 to 29, 30 to 31, 35 to 36, 40 to 41, 43 to 44, 44 to 45, 51 to 52, 57 to 58, 63 to 64, 71 to 72, 72 to 73, 73 to 74, 78 to 79, 97 to 98, 100 to 101, 107 to 108, 117 to 118, 127 to 128, 137 to 138, 139 to 140, 147 to 148. Row 82's "an unknown venue's policy is requested" also cites `references/intake.md:39` "| Venue AI policy | The venue's AI policy text, pasted, for a venue `references/ai-disclosure.md` does not list. | full, disclosure |".
- `references/citation-compliance.md`: 23 to 24, 56 to 57, 60 to 61, 62 to 63, 77 to 79, 78 to 80, 103 to 112; quote changed: rows 54 and 187 "retractions" at line 82, "- **Retractions.** The choice of a replacement for a retracted source has no single right answer, so the agent writes no patch for it."; row 54 "an unsupported claim stops the check" at line 106, "- A claim that the passage does not hold is marked Critical, stops the check, and the session raises the stop "A claim the run cannot support" for it."
- `references/integrity-verification.md`: 409 to 410 (rows 155, 195), 411 to 412 (155).
- `references/literature-strategist.md:97` (row 58, quote changed): "- A pass is one run of the four layers. The search ends when at least 3 of the 5 conditions below hold, or after 4 passes, whichever comes first:".
- `references/peer-reviewer.md` (row 59): 28 to 29, 137 to 138, 153 to 157, 154 to 158, 155 to 159, 176 to 181, 237 to 242, 247 to 253.
- `references/structure-architect.md:24` (row 103, quote changed): "The Conference Paper skeleton is the default, since it suits a machine learning paper bound for a conference."

**Part 6, the sentences about scripts.** S1 to S4 no longer stage a manifest in `patches/pending/`: the move is straight to `patches/<nn>-main.tex.block-manifest.json`, as the C15 run above shows. S5's third block is the "validation: a patch written against another version of the file" run of point 10, and the sentence about the heading naming an attempt is dropped. S14's stem is `k` with the file `k.abstract.txt` (point 10). The line references of S1 to S20 are the list under C15 above. Two sentences join the part: `SKILL.md:140` (the `title not checked` line, run in point 20) and `SKILL.md:142` (`unused:` for an entry the run added, run in C15).

**Part 9, judgment calls.**
1. The patch id of two patches: holds; the figure environments patch of item 7 keeps the id `full` and, under "figures in parallel", is applied after both agents have ended.
2. The compile of the finished manuscript: holds (`SKILL.md:215` to `:217`).
3. Replace with: The Stops table holds 11 stops and 8 refusals (the layout asks for one Stops table, so the refusals stand in it). Item 10 of the brief lists ten stops; the eleventh, "The draft review does not pass", is an addition of the build, taken from the verdict Reject of `agents/peer_reviewer_agent.md`, and `SKILL.md:354` and `:362` state it.
4. Replace with: Counts for repeats the source rules leave open, so that every repeat has one: a failed gate of the literature review is handled once (`literature-strategist.md:168`); `quote-check` is run once more after the agent corrects a passage (`integrity-verification.md:173`); the search ends at 3 of 5 conditions or after 4 passes (`literature-strategist.md:97`, `:107`); a load-bearing paragraph is read and revised once more (`draft-writer.md:78`); the intake record may change up to 3 times (`SKILL.md:96`); the outline's approval repeats at most 3 times (`SKILL.md:177`, `:247`); the findings answer takes up to 3 answers (`SKILL.md:149`); a correction has at most 3 passes (`SKILL.md:198`, `:211`, `:264`, `:291`). The list of every repeat found is under point 17.
5. The glossary: holds; "Stated in" of **draft review** names `paper`, Steps/full 12, and `grep -n 'draft review round' skills/paper/SKILL.md` finds the item at lines 200 to 206.
6. Replace the line numbers with: "finding" remains where it means a `/writing` finding (`SKILL.md` lines 148, 150, 151, 256, 364, 390 and 398; `draft-writer.md:12` and `:146`; `peer-reviewer.md:263`) and in the statements the manuscript carries verbatim (`statements.md` lines 110, 145, 151, 161 and 177); `grep -nw 'findings\?'` printed them. The ids are `W<k>` for the input report of revision mode and `F<k>` for the closing review.
7. Holds.
8. Replace with: List items end in a full stop, and an item that held two clauses is two items. The counts of check 7 above give the semicolons per file; table cells keep their semicolons (45 in `peer-reviewer.md`'s score tables).
9. Replace with: the 26 sentences over 35 words that remain are listed with their form under check 7 above.
10. Replace the example with: where a part of a reason is held in two files, the reason names both with "held in X and Y" (for example row 94 names `skills/paper/SKILL.md` and `skills/paper/references/patch-file.md`, and row 82 names `ai-disclosure.md` and `intake.md`).
11. Holds; the quote of a long line is cut at a word at 150 characters.

**Part 10, user-visible changes.** Item 1: "`skills/paper/SKILL.md` and 13 pages" becomes "`skills/paper/SKILL.md` and 14 pages", the fourteenth being `references/patch-file.md`. Item 7: the 55 reasons still name the files that hold their parts; the form is the same. Item 3 (README): holds. The first report's part 8 line "lists 28 files ... the other 14 are new" becomes 29 files (`git ls-files -m -o --exclude-standard | grep -v '^\.scratch' | wc -l` printed `29`), 15 of them new (`SKILL.md` and its 14 pages).

**Part 4 and part 7.** The outputs of the brief's checks quoted in part 4 are the ones printed above. The terms use is unchanged: the only words this round adds that a glossary entry could define are "pass" (a correction pass of an integrity check; not a glossary term) and "round" (always "draft review round"; `grep -rnw -i 'round\|rounds' skills/paper/SKILL.md skills/paper/references/ | grep -v -i 'draft review round'` prints only the JSON field `round` in `patch-file.md`, "round effect sizes" and "passes the AI's own review").

### Readings

- Citation-check mode checks every cited sentence of the manuscript against a fetched passage; a long manuscript therefore fetches many sources, each through the public indexes (no key, no cost).
- A number given to a file whose agent wrote no patch is not given again, so a gap in the `<nn>` sequence of `patches/` is expected.
- After draft review round 1 a Critical issue unresolved is sent to the draft writer with the other issues; only after round 2 does it stop the run, whatever the score.
- A source with an `unused:` line is the user's decision; in lit-review the entries the run added print `unused:` for a `.tex` that does not cite them, as the C15 run shows.
- The C16 files stand under `projects/manuscripts/`, `projects/active/` and `projects/archive/` in research-hub now; the brief's paths name them without that level.
