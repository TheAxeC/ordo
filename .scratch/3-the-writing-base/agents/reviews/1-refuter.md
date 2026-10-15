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
