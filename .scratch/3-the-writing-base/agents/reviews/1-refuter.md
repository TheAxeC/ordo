# Step 1 refuter report (on .agents/worktrees/3-the-writing-base-1, base 724bde5)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

The brief's "Verify before you report", run from the worktree root:

```
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ printf '%s\0' skills/writing/SKILL.md ... skills/repo-setup/templates/docs/glossary.md | xargs -0 perl -CSD -ne '...'; echo "exit $?"
exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/writing/SKILL.md").read().split("---")[1])["description"]))'
602
```

The character-set command was run with the full list of 21 paths the brief gives. It printed nothing and exited 0.

The builder's quoted evidence, rerun in the same form. The `.docx` runs used `python3 -I`.

```
$ python3 -I skills/writing/templates/docx_paragraphs.py <NWO XS grant> | wc -l
      55
$ diff <(script on NWO XS) <(the report's "cat nwo.out" block); echo "diff exit $?"
diff exit 0
$ ... | LC_ALL=C grep -c '[^ -~]'    ->  0
$ ... | grep -c '\[word/'            ->  0
$ ... | sed -n 3p | od -c | head -3
0000000    3   :       D   u   r   a   t   i   o   n       o   f       t
0000020    h   e       p   r   o   j   e   c   t       (   i   n       m
0000040    o   n   t   h   s   )   :       1   2  \n
$ ... | sed -n '24,26p' | cut -c1-100
24: Budget justification (124/150)
25: The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve m
26: Project proposal
$ python3 -I skills/writing/templates/docx_paragraphs.py; echo "exit $?"
usage: docx_paragraphs.py <file.docx>
exit 2
$ ... a b                -> usage: docx_paragraphs.py <file.docx> / exit 2
$ ... README.md          -> error: README.md: not a zip file / exit 1
$ ... /nonexistent.docx  -> error: /nonexistent.docx: No such file or directory / exit 1
$ ... /tmp               -> error: /tmp: Is a directory / exit 1
$ ... <builder's scratch>/grant-cut.docx
error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/grant-cut.docx: word/document.xml: not well-formed XML (no element found: line 2, column 19943)
exit 1
$ ... <builder's scratch>/nodoc.docx
error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/nodoc.docx: no word/document.xml
exit 1
$ HexC: exit 0; wc -l -> 202; line 105 holds "define, investigate and visualize populations by social determinants and presence of ASCVD"; sed -n 105p | grep -c existing -> 0; line 105 holds "decentralized aggregated data from"
$ HexC line 187: 187: 8. Vivel. Quintuple aim  [Available from: https://www.vivel.be/over-vivel/quintuple-aim/.
$ HexC line 202: 202 [word/footnotes.xml]:  This proposal has to be completed if you have not obt...
$ HexC output, count of the three comment openings -> 0; word/comments.xml holds each once
$ main_MVH2_AF2.docx: exit 0; wc -l -> 367; grep -c "A simulation study provides" -> 1; line 47 starts "47: A simulation study provides us with a ground truth against which our results can be verified and compared with those of other methods."
$ First page of thesis_070519.docx: exit 0; 36 lines, identical to the report's quoted block
$ veni2026-preproposal-FILLED.docx: exit 0; 243 lines; grep -n '\[word/' -> 243:243 [word/footnotes.xml]:  To avoid gender effects, please do not state your first name.
$ python3 skills/ordo-init/templates/check_config.py . | tail -1 | cut -c1-120
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
$ git show 724bde5:skills/repo-setup/templates/docs/dev/prose-standard.md | wc -l; wc -l skills/repo-setup/templates/docs/dev/prose-standard.md
      75
      75 skills/repo-setup/templates/docs/dev/prose-standard.md
$ git show 724bde5:...prose-standard.md | grep -c "rapidly evolving\|matter of fact"  ->  0 (after the change: one hit, the opener list)
$ grep -n version skills/repo-setup/SKILL.md skills/plan/SKILL.md skills/writing/SKILL.md
skills/plan/SKILL.md:5:  version: "5.0.1"
skills/repo-setup/SKILL.md:5:  version: "5.2.0"
skills/writing/SKILL.md:5:  version: "1.0.0"
$ grep -rn -F "a builder, a reviewer or a brief-check agent;" skills utils docs README.md agents .agents; echo "exit $?"
exit 1
$ diff <(find skills utils docs -name '*.py' -o -name '*.sh' | sort) <(awk -F'|' '/^\| `/{print $2}' docs/dev/scripts.md | tr -d ' `' | sort); echo "exit $?"
exit 0
```

Checks of my own, used for the findings below:

```
$ thesis title page, inline ElementTree count of the w:p with text, by branch
fallback text paras 28 choice text paras 28 other 8
choice==fallback multiset True
$ records: non-blank source lines against "source <file>:" blocks
academic_writing_style.md 152 152
writing_judgment_framework.md 42 42
writing_quality_check.md 131 131
$ every "  place <file>:<n>: <text>" line of the report compared with line <n> of its file
places 246 mismatches 4   (two are partial quotes of briefs/1.md; the other two are both "SKILL.md 86", see Proof)
$ count of prompt bullets that begin "- For a " in skills/writing/SKILL.md
3
```

How I read the records: all 246 place lines were compared as text against their files. I read record 2 whole (42 rows). From record 1 I read the Precision, Conciseness, Objectivity, Formality, register, hedging, transition, TEEL, wordiness, vague-language and tense rows. From record 3 I read the flagged-term rows, the exception rows, the punctuation, opener and meta-commentary rows, and the structure, burstiness and scoring rows. That is well over 15 rows across the three records. I also read item 7's list of the parts left out or held elsewhere, whole, against the records.

## Verdicts

Items:

1. `skills/writing/SKILL.md`: violated (Standards 1, Standards 2).
2. `skills/writing/references/rules.md`: violated (Spec 1, Spec 2, Spec 3, Spec 4, Spec 5).
3. `skills/writing/references/registers.md`: holds.
4. `skills/writing/templates/docx_paragraphs.py`: holds.
5. Section C of the prose standard: holds.
6. The term **finding**, **effort agent**, **reviewer**, glossary line 3, `repo-setup` 5.2.0: holds.
7. The records: violated (Spec 4, Proof 1).
8. The coverage rows: holds.
9. The agents and the configuration comments: holds.
10. The lists: holds.

Cases:

- `ls skills/writing`: met.
- `docx_paragraphs.py` on the NWO XS grant: met. Exit 0, 55 lines, identical to the report's quoted whole output, no `[word/` line.
- No argument: met.
- `README.md`: met.
- A path that does not exist: met.
- The HexC proposal: met.
- `main_MVH2_AF2.docx`: met.
- `First page of thesis_070519.docx`: met. Every `w:p` of the file is printed once (see Proof 2).
- `veni2026-preproposal-FILLED.docx`: met.
- The NWO XS specifics (page break, one space before "12", tab stops adding nothing, the count): met.
- A part that is not well-formed XML: met. I reran the script on the builder's existing cut-short copy, read only.
- Section C read: met.
- `plan-terms.md` and `docs/glossary.md`, the term **finding**, and `sync_rules.py`: met.
- `SKILL.md` read against `docs/dev/skill-layout.md`: met.
- Each of the three records read against its source file: partial (Spec 1, Spec 2, Spec 3, Spec 4, Spec 5, Proof 1).
- `SKILL.md`'s Steps and the review agent's prompt read against D1, D6, D16, D29 and D30: partial (Standards 1).
- `rules.md` read against the prose standard, and `registers.md` read against D11, D18 and D22: met. No rule in `rules.md` contradicts the prose standard; the rules that change meaning against their source are under Spec.
- `docs/academic-coverage.md` lines 76, 100 and 101: met.
- The README row and `for` line, the `scripts.md` row, the agent definitions, the four comments, glossary line 3 and the versions: met.

## 1. Spec

Spec 1. Place: `skills/writing/references/rules.md`, "Precision / Pronoun with a clear antecedent": "A pronoun such as "this" or "it" has one clear antecedent in its own sentence or the sentence before."
- What is wrong: the source (`academic_writing_style.md`, Precision) reads "Avoid ambiguous pronouns ("this," "it") without clear antecedents" and sets no distance. "In its own sentence or the sentence before" is a limit the source does not have. The change standard's rule 17 says "every condition, exception and limit of the old text is kept and none is added". The report does not list this under its judgment calls.
- Failure scenario: a draft says "We trained the classifier on 10,000 labelled scans. Training took four hours on one GPU. It reached 92% accuracy on the held-out set." "It" can only mean the classifier, but its antecedent is two sentences back. The agent reports "Precision / Pronoun with a clear antecedent", which the source rule does not, and a clean passage in step 2's case files comes back as a false alarm.
- Verdict: item 2 violated; the records case partial.

Spec 2. Place: `rules.md`, "Objectivity / Limitations and alternative interpretations": "A passage that draws a conclusion acknowledges the limitations of the study and the alternative interpretations of the result."
- What is wrong: the source reads "Acknowledge limitations and alternative interpretations". That is a duty of the text as a whole. The rewrite makes every passage that draws a conclusion carry both itself, a condition rule 17 forbids adding. It is not in the judgment calls.
- Failure scenario: the closing sentence of an abstract, or the "If the hypothesis holds, surveillance can warn within the curative window" sentence of the NWO XS grant, is reported, although the grant states its limitations in "Risks and mitigation". Step 3's real run then gives the user false alarms to read.
- Verdict: item 2 violated; the records case partial.

Spec 3. Place: `rules.md`, "Hedging / Hedge strength": "A weak device fits a claim the evidence only suggests. A moderate device fits a trend the data show. A strong device fits a link the evidence establishes."
- What is wrong: the source gives the three strengths with their devices and one example each. It does not say which strength a given level of evidence takes. These three sentences are a new rule. Judgment call 10 discloses them, but rule 17 says "A change of meaning the brief does not ask for is reported as a stop", and the brief asks only for "the hedging scale with its three strengths and devices".
- Failure scenario: "The results indicate that the intervention lowers readmission (RR = 0.60, 95% CI [0.45, 0.80])." Before it can report "indicate" as too weak, or "demonstrates" as too strong, the agent has to decide whether the evidence "establishes a link". That is a judgment of content, and D22 says `/writing` does not make one. Nothing in the source supports the finding.
- Verdict: item 2 violated; the records case partial.

Spec 4. Place: `rules.md`, "Reader's path / Reader's four questions": "At any point the reader can answer four questions, each from the section structure and the transitions." and "1. Where am I? The section structure answers it."
- What is wrong, first part: the source's question 1 reads "(Section structure, signposting)", and brief item 2 asks for "the reader's four questions with their signposting". The page drops "signposting". The record row for `writing_judgment_framework.md:19` names "1. Where am I? The section structure answers it." as the place, which does not state the signposting part. Rule 18 says the named place "states that rule whole". No ruling and no record note gives the drop. If the drop rests on the prose standard's section C (ADR 0002), the row has to say so.
- What is wrong, second part: the first sentence says each question is answered "from the section structure and the transitions". The list under it says question 2 is answered by the connection to the research question, and question 3 by the point of the section. The two statements on the same page disagree.
- Failure scenario: a section with clear headings and transitions that never ties back to the research question passes, because by the first sentence the structure and the transitions are what answer the questions. Separately, the gate's reader of the record is told the source line is held whole when its signposting part is gone.
- Verdict: item 2 and item 7 violated; the records case partial.

Spec 5. Place: `rules.md`, "Reader's path / So what per section", the Methodology row: "Shows rigor and acknowledges limitations at the start."
- What is wrong: the source reads "Show rigor, acknowledge limitations upfront". "Upfront" means stated openly, before the results. "At the start" adds a position inside the section, a limit rule 17 forbids adding. It is not disclosed.
- Failure scenario: a Methods section whose last paragraph states its limitations is reported under "So what per section".
- Verdict: item 2 violated; the records case partial.

## 2. Proof

Proof 1. Place: the report's record 3, the rows for `writing_quality_check.md:5` and `:7`: "place SKILL.md:86: - Judge the text by the rules only, and state nothing on how or by whom it was written."
- What is wrong: line 86 of `skills/writing/SKILL.md` is "- Report only a break of a rule of the prose standard, ...". The quoted bullet stands at line 87. My compare of all 246 place lines against their files found no other line-number mismatch.
- The decision that rests on it: the gate's "the plan's ledger holds a record ... checked by reading both".
- Failure scenario: a reader who follows the row's line lands on another rule.
- Verdict: item 7 violated; the records case partial.

Proof 2. Place: the report's "Cases the brief's rules got wrong" and "Anything in the brief that was wrong or impossible" item 1: "The rule as worded does not hold of the file", and the earlier sentence "No case showed a rule of the brief to be wrong".
- What is wrong: the claim is not reproduced. I counted the paragraphs with text: 28 under `mc:Choice`, the same 28 under `mc:Fallback`, and 8 elsewhere. 28 + 8 = 36, the number of printed lines, so each `w:p` of the file is printed once. The repeated lines are distinct paragraphs of the Dutch and the English title page. Read with paragraph as `w:p`, the case holds as worded. The report also says in one place that no case was wrong and in another that one was.
- Failure scenario: the orchestrator is asked to rule on a case wording that needs no ruling.
- Verdict: none (the case is met).

## 3. Standards

Standards 1. Place: `skills/writing/SKILL.md`, "Review agent prompt", the introduction: "The prompt is these bullets with each `<...>` filled in, and with the one of the two bullets that begin "For a" which fits the draft's extension."
- What is wrong: three bullets begin "For a": the `.tex`/`.md`/`.txt` bullet, the `.docx` bullet and "For a flagged term of the prose standard's section A, ... the finding lists no alternative word". The sentence's count is false.
- Failure scenario: the session building the prompt for a `.md` draft keeps the one "For a" bullet that fits the extension and drops the other two, the flagged-term bullet among them. The agent, which has also read the "Flagged terms / Alternatives" table of `rules.md`, then lists "use, employ, utilize, apply" in a finding on "leverage". That is the proposed replacement D30 forbids.
- Verdict: item 1 violated; the case "SKILL.md's Steps and the review agent's prompt read against D1, D6, D16, D29 and D30" partial.

Standards 2. Place: `skills/writing/SKILL.md`, frontmatter `description`: "Triggers on: writing, /writing <file>, review the writing of a draft, ...".
- What is wrong: `docs/dev/skill-layout.md`, Frontmatter, says "A phrase for a case a neighbouring skill is for goes in that skill's Triggers on, not in this one." The bare word "writing" also covers drafting text, which ADR 0003 gives to `paper` and `grant`. The other skills with a bare-name trigger have names that do not occur in ordinary requests, such as `roadmap` and `diagnose`.
- Failure scenario: "help me with writing the Discussion section", or in this repository "start writing the brief", matches the trigger and loads `/writing`. That run either refuses for want of a file or starts a review agent where drafting was asked.
- Verdict: item 1 violated.

Standards 3. Place: `README.md`, "Install": "The plan skills and `writing` launch their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, ...".
- What is wrong: the sentence was rewritten in this step (judgment call 6), and it still leaves out `grill`. The five agent definitions rewritten in the same step say "`grill` for a lookup agent", and the glossary's **effort agent** names the lookup agent of `grill`. The change standard's rule 19 says no two statements of the change may say otherwise. Here two rewritten statements name different sets of launchers.
- Failure scenario: a reader who keeps only what the README sentence names, the plan skills and `writing`, removes or does not install the definitions for a setup that uses only `grill`. `grill`'s lookups then stop on "The configured effort cannot apply".
- Verdict: none (item 9 holds).

## 4. Behaviour

None.

## Declined to judge

- The builder's first run of `sync_rules.py . --only glossary` on the unchanged tree. Rerunning it needs a checkout at 724bde5 (`git worktree add <dir> 724bde5`), a git command outside the three allowed. The brief check reports the same result at 8119dd3.
- The report's `git diff --numstat`, `git diff -U0` and `git ls-files` commands. Each is a git command outside the three allowed. I read the same changes through `git diff 724bde5` and its `--stat`, and compared the scripts table against `find` instead of `git ls-files`.
- Whether the word counts of the report's "Verify 5" and the record completeness counts came from inline commands or from scripts written for the step (the brief's no-script rule). The builder's scratch folder holds no `.py`, `.sh`, `.awk` or `.pl` file. The builder's transcript would settle it.
- A cut-short copy of my own for the malformed-XML case. Making one needs a scratch file, so I ran the script read only on the builder's existing `grant-cut.docx` instead.
- Whether roadmap entry 5's gate needs the clarity test's other two outcomes and the judgment heuristic that coverage row 100 sends to `paper`. The coverage page says "A part goes to the first roadmap entry whose gate needs it", which is a reading of entry 5's gate for the orchestrator.
- Whether ADR 0006's Consequences ("A skill added later that starts an agent records its id and role") bind a `/writing` run outside a plan. The brief reads the record as not governing `writing`, and the diff follows the brief. That reading is the orchestrator's or the user's.
- Whether the bare "writing" trigger fires on drafting requests in practice. That needs a session test, which I did not run.

Reviewer usage: a5914ed9e26f92be4, claude-opus-5-5, 325975 tokens, 77 tool uses, 14m 58s.

## Repair round 1, refuted

```
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ printf '%s\0' <the 21 paths of the brief> | xargs -0 perl -CSD -ne '...'; echo "exit $?"
exit 0          (printed nothing before the exit line)
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/writing/SKILL.md").read().split("---")[1])["description"]))'
593
$ python3 skills/ordo-init/templates/check_config.py . | tail -1 | cut -c1-120
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
$ LC_ALL=C grep -c '[^ -~]' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md skills/writing/templates/docx_paragraphs.py
skills/writing/SKILL.md:0   skills/writing/references/rules.md:0   skills/writing/references/registers.md:0   skills/writing/templates/docx_paragraphs.py:0

Round delta ("diff -u <snapshot>/<path> <worktree>/<path>" for the 21 paths of files.txt): README.md (1 line), skills/writing/SKILL.md (description line, prompt introduction), skills/writing/references/rules.md (6 hunks). No other tracked path differs; "git status --short" lists the same 17 modified paths plus skills/writing/ as files.txt.
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md README.md
     127 skills/writing/SKILL.md
     220 skills/writing/references/rules.md
     194 README.md          (the counts the report's "Repair round 1" gives)

Report's evidence, rerun (python3 -I, from the worktree root):
NWO XS grant: | wc -l  -> 55 ; | LC_ALL=C grep -c '[^ -~]' -> 0 ; line 3 od -c -> "3: Duration of the project (in months): 12" with one space before "12" ; diff against the report's "cat nwo.out" block -> identical (samenwo)
no argument -> "usage: docx_paragraphs.py <file.docx>", exit 2
README.md -> "error: README.md: not a zip file", exit 1
/nonexistent.docx -> "error: /nonexistent.docx: No such file or directory", exit 1
builder's grant-cut.docx -> "error: .../grant-cut.docx: word/document.xml: not well-formed XML (no element found: line 2, column 19943)", exit 1
First page of thesis_070519.docx -> 36 lines; "| sort | uniq -d" prints nothing; my own ElementTree count of w:p with own text: {'Choice': 28, 'Fallback': 28, 'else': 8}  (28 + 8 = 36)
HexC -> 202 lines ; veni -> last line "243 [word/footnotes.xml]:  To avoid gender effects, please do not state your first name." ; main_MVH2_AF2 -> 367 lines
Place lines of the three records (inline python -I, every "  place <file>:<n>: <text>" line of the report, lines 960 to 1873, against line <n> of its file, plan.md and the two ADRs included): places 245, bad 2; the two are "place briefs/1.md:71" and "place briefs/1.md:144", partial quotes of lines 71 and 144 of the brief, which I read. The rows that name SKILL.md:87 (writing_quality_check.md:5 and :7) hold: line 87 of SKILL.md is "- Judge the text by the rules only, and state nothing on how or by whom it was written."
$ grep -n 'version' skills/repo-setup/SKILL.md skills/plan/SKILL.md skills/writing/SKILL.md
5:  version: "5.2.0" / 5:  version: "5.0.1" / 5:  version: "1.0.0"
```

### Verdicts

Items (whole diff since 724bde5):

1. `skills/writing/SKILL.md`: holds. The prompt introduction (line 76) names the two bullets by what they say, and the flagged-term bullet (line 96) is not among them. "writing" is gone from `Triggers on:`.
2. `skills/writing/references/rules.md`: holds for the five rulings 1 to 5 as worded; see Findings Spec A for the one sentence the ruling does not name.
3. `skills/writing/references/registers.md`: holds (unchanged in the round).
4. `skills/writing/templates/docx_paragraphs.py`: holds (unchanged; the runs above).
5. Section C of the prose standard: holds (line 39 only, file still 75 lines).
6. Term **finding**, **effort agent**, **reviewer**, glossary line 3, `repo-setup` 5.2.0: holds (`sync_rules.py` ok, version 5.2.0).
7. The records: holds. All 243 place lines that name a file stand at the line they give, and the two rows with `SKILL.md:86` now name `:87`. The report has two stale statements, under Findings Proof A and B.
8. The coverage rows: holds (`check_coverage.py` ok).
9. The agents and the configuration comments: holds (line 3 and line 6 of `agents/ordo-high.md` read; `check_config.py` ok; `plan` 5.0.1).
10. The lists: holds. The README `for skill in` line ends `spec writing`, and the `scripts.md` row is present.

Round rulings against the text now in the files:

- Ruling 1 (`rules.md:17`): holds. The text is "A pronoun such as "this" or "it" has a clear antecedent." and no distance remains.
- Ruling 2 (`rules.md:33`): holds. The text is "The text acknowledges the limitations of the study and the alternative interpretations of its results."
- Ruling 3 (`rules.md:47` to `55`): holds with the note under Spec A. The table is kept and introduced as the hedging scale. "Hedge where a claim is uncertain" (line 57) and "No hedge on facts" (line 66) are unchanged.
- Ruling 4 (`rules.md:157`, `:159`): holds. The first sentence is "At any point the reader can answer four questions." and question 1 reads "The section structure and signposting answer it." The record row for `writing_judgment_framework.md:19` quotes the new line 159, and its place line stands there.
- Ruling 5 (`rules.md:172`): holds. The text is "Shows rigor and acknowledges limitations upfront."
- Ruling 6: holds, as the place-line compare above shows.
- Ruling 7: partial, see Proof A. The thesis case is stated as met (report line 563 and Repair round 1, "Proof 2"), and my count reproduces 28, 28 and 8.
- Ruling 8: holds. The intro names the `.tex`/`.md`/`.txt` bullet and the `.docx` bullet, and says every other bullet is always in the prompt.
- Ruling 9: holds. The description is 593 characters.
- Ruling 10: holds. `README.md:77` reads "The plan skills, `grill` and `writing` launch their agents through five agent definitions", which matches line 3 and line 6 of the five definitions.

Cases:

- `ls skills/writing`: met.
- NWO XS grant, whole output: met (55 lines, identical to the report's block, no `[word/` line).
- No argument: met.
- `README.md`: met.
- Nonexistent path: met.
- HexC proposal: met (202 lines; the report's quoted lines read in the earlier pass).
- `main_MVH2_AF2.docx`: met.
- Thesis title page: met. Each `w:p` is printed once (36 lines, no duplicate line).
- Veni pre-proposal: met.
- NWO XS specifics: met.
- Malformed XML: met, run on the builder's existing copy read only.
- Section C: met.
- `plan-terms.md`, `docs/glossary.md`, `sync_rules.py`: met.
- `SKILL.md` against the skill layout: met (frontmatter, then the nine `##` sections in order: Quick start, Use instead, What it reads, Steps, Review agent prompt, Stops, Anti-patterns, Rules, plus the title).
- Each of the three records against its source: met (place lines verified; completeness counts 152, 42 and 131 are the builder's, not rerun by me; see Declined).
- `SKILL.md` Steps and the prompt against D1, D6, D16, D29 and D30: met.
- `rules.md` against the prose standard and `registers.md` against D11, D18 and D22: met.
- Coverage rows 76, 100 and 101: met.
- README row and `for` line, `scripts.md` row, agents, four comments, glossary line 3, versions: met.

### Findings

**Proof A** (Proof). Place: `.scratch/3-the-writing-base/agents/reviews/1-report.md:11`. Quoted: "No case showed a rule of the brief to be wrong; the one wording that can be misread is named at the end of this report under "Anything in the brief that was wrong or impossible"."
- What is wrong: ruling 7 says the report says "nowhere that a case of the brief was wrong". The sentence still tells the reader a wording of the brief can be misread and that the end of the report names it. The section it points to (lines 1989 to 1993) names none: item 1 is about `orchestrator-state.md` line 14, item 2 is about lines item 7 omitted, and item 3 says "Nothing in the brief was impossible." The claim is not reproduced by the report.
- Failure scenario: the orchestrator reads the first section, goes to the named section for the misreadable wording, finds none, and has to work out whether a case is still disputed. That is the same reading the round was meant to end.
- Closure verdict: ruling 7 partial.

**Proof B** (Proof). Place: report lines 193 and 205. Quoted: line 193 "...the description-length command printed 602; the character-set grep printed 0 for the file" and line 205 "| Verify 3 (description length) | DONE | printed 602 | same |".
- What is wrong: after ruling 9 the description is 593 characters. The report's own run (line 226) and my rerun print 593, and Repair round 1 says "593; 602 before the round". The DONE table, which the report's opening says is the output "as printed", still quotes 602.
- Failure scenario: a reader checking the DONE table against the final tree finds 593 and cannot tell which statement of the report is the current one.

**Spec A** (Spec, small). Place: `skills/writing/references/rules.md:47` to `49`. Before: "A claim carries the hedge its evidence supports. A weak device fits a claim the evidence only suggests. A moderate device fits a trend the data show. A strong device fits a link the evidence establishes." Now: "The hedging scale has three strengths, each with its devices."
- What is wrong: ruling 3 says "delete the three sentences that tie a strength to a level of evidence". The round deleted four, and the report's Spec 3 entry neither says the first one went as well nor gives the reason. The first sentence is the same unsourced evidence-to-hedge rule, so deleting it ends the cause of the finding; but it is a deletion the ruling's count does not state, and it is undisclosed.
- Failure scenario: none for the agent's reports. The orchestrator reading the ruling against the diff finds one more deleted sentence than the ruling names and cannot tell whether it was meant.

### Declined to judge

- The builder's completeness counts (152, 42 and 131 non-blank source lines, each with a block). I compared place lines against their files and read the rows the round changed, but did not recount the blocks. The first refuter report does the count at the same numbers, and no row was added or removed in the round, except the second place of the `academic_writing_style.md:19` row, which the report says it dropped (245 place lines now against 246 in the first refuter's compare).
- Whether `rules.md` "Hedging / Hedge strength", now a heading over a table with no rule sentence, gives the review agent anything to report. Ruling 3 prescribes that form, so I take it as the ruling's result, not as a defect of the round.
- Whether a pre-existing `skills/writing/templates/__pycache__/` directory (listed by `git status --short --ignored` as ignored) matters. It is ignored by git and not part of any cherry-pick.
- Whether the report's "Repair round 1 / Proof 2" sentence that the later section "no longer lists the case" is acceptable as a description of end state. It is accurate about the end state and I raised no finding.
- The builder's first run on the unchanged tree (needs a checkout at 724bde5, a git command outside the three allowed).

Reviewer usage: aa07e2ce319421fca, claude-sonnet-5-5, 163294 tokens, 30 tool uses, 3m 50s.

## Closed

- Proof A: fixed at landing. The report's line 11 is rewritten on main to say that no case showed a rule of the brief to be wrong, with no pointer to a misreadable wording.
- Proof B: fixed at landing. The report's lines 193 and 205 quote 593, the description length the final tree prints.
- Spec A: closed with no change. The fourth deleted sentence, "A claim carries the hedge its evidence supports.", ties a strength to a level of evidence as the other three do, so it is inside ruling 3's reason, a judgment of content D22 says `/writing` does not make. Its deletion is named here and in the booking.

