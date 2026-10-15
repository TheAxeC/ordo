# Report of step 1, the writing base

Everything in the brief is done.

## Open items of the state file

- none.

## The cases' first run

Every run below is on the unchanged tree: the worktree at its base, `724bde5`, before any file was changed. A text case was read from the base with `git show HEAD:<path>`. Scratch files are in `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06`, outside both repositories. A command that ends in `cut -c1-N` shows the first N characters of each line, and every other output is whole. No case showed a rule of the brief to be wrong; the one wording that can be misread is named at the end of this report under "Anything in the brief that was wrong or impossible".

### Case: ls skills/writing

Command and output, on the unchanged tree:

```
$ ls skills/writing; echo "exit $?"
ls: skills/writing: No such file or directory
exit 1
```

Result: no such folder, as the case says.

### Cases: the script on the NWO XS grant, with no argument, on README.md and on a path that does not exist

The script does not exist on the unchanged tree, so each of the four runs printed the interpreter's message and exited 2:

```
$ python3 skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx; echo "exit $?"
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1/skills/writing/templates/docx_paragraphs.py': [Errno 2] No such file or directory
exit 2
$ python3 skills/writing/templates/docx_paragraphs.py; echo "exit $?"
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1/skills/writing/templates/docx_paragraphs.py': [Errno 2] No such file or directory
exit 2
$ python3 skills/writing/templates/docx_paragraphs.py README.md; echo "exit $?"
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1/skills/writing/templates/docx_paragraphs.py': [Errno 2] No such file or directory
exit 2
$ python3 skills/writing/templates/docx_paragraphs.py /nonexistent.docx; echo "exit $?"
/Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-1/skills/writing/templates/docx_paragraphs.py': [Errno 2] No such file or directory
exit 2
```

Result: the cases cannot run, and none is met on the unchanged tree.

### Cases: the script on the HexC proposal, main_MVH2_AF2.docx, the thesis title page, the Veni pre-proposal, the NWO XS specifics and the cut-short copy

The script is absent, so the same message and exit 2 hold for each. What the inputs hold was counted on the unchanged inputs, which are read only (`unzip -p <file> word/document.xml | grep -o '<tag' | wc -l`; the counts below are from `grep -o` per tag, one file per line):

```
Project proposal unremunerated or clinical PhD - HexC V 2-2-25.docx
  <w:p =331  <w:ins =9  <w:del =5  <w:moveFrom =0  <w:moveTo =0  <w:hyperlink=4  <w:sdt>=27  <w:txbxContent=0  <mc:Fallback=0  <w:delText=5
word/header1.xml word/footnotes.xml word/numbering.xml word/settings.xml word/comments.xml word/styles.xml word/document.xml 
main_MVH2_AF2.docx
  <w:p =606  <w:ins =738  <w:del =513  <w:moveFrom =1  <w:moveTo =2  <w:hyperlink=0  <w:sdt>=0  <w:txbxContent=0  <mc:Fallback=0  <w:delText=362
word/document.xml word/comments.xml word/settings.xml word/styles.xml word/people.xml 
First page of thesis_070519.docx
  <w:p =101  <w:ins =0  <w:del =0  <w:moveFrom =0  <w:moveTo =0  <w:hyperlink=0  <w:sdt>=0  <w:txbxContent=24  <mc:Fallback=12  <w:delText=0
word/document.xml word/settings.xml word/styles.xml 
veni2026-preproposal-FILLED.docx
  <w:p =297  <w:ins =0  <w:del =0  <w:moveFrom =0  <w:moveTo =0  <w:hyperlink=2  <w:sdt>=0  <w:txbxContent=0  <mc:Fallback=0  <w:delText=0
word/document.xml word/settings.xml word/styles.xml word/numbering.xml word/endnotes.xml word/footnotes.xml word/footer1.xml 
Application-form-ENW-XS-26-3-LS.docx
  <w:p =63  <w:ins =0  <w:del =0  <w:moveFrom =0  <w:moveTo =0  <w:hyperlink=0  <w:sdt>=0  <w:txbxContent=0  <mc:Fallback=0  <w:delText=0
word/document.xml word/footnotes.xml word/endnotes.xml word/header1.xml word/footer1.xml word/settings.xml word/numbering.xml word/styles.xml 
```

Result: each input holds the constructs its case names. The script does not exist, so no case is met on the unchanged tree.

### Case: section C of the prose standard, read

First read, from the base:

```
$ git show HEAD:skills/repo-setup/templates/docs/dev/prose-standard.md | grep -n "rapidly evolving\|matter of fact"; echo "exit $?"
exit 1
$ git show HEAD:skills/repo-setup/templates/docs/dev/prose-standard.md | sed -n 39p
Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
```

Result: the two openers are not in section C before the change.

### Case: plan-terms.md and docs/glossary.md, the term finding, and sync_rules.py

First read, from the base:

```
$ git show HEAD:skills/repo-setup/templates/plan-terms.md | grep -n '^- \*\*finding\*\*' | cut -c1-80
41:- **finding**: a defect a reviewer reports, with its place, the quoted text, 
$ git show HEAD:skills/repo-setup/templates/plan-terms.md | sed -n 41p | grep -c '/writing'
0
$ git show HEAD:docs/glossary.md | grep -n '^- \*\*finding\*\*' | cut -c1-80
46:- **finding**: a defect a reviewer reports, with its place, the quoted text, 
```

The first run of `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` before any change printed `ok: the plan-terms block equals the template` and exited 0.

Result: the term holds the reviewer-defect sense only, with no `/writing` sense (0 matches of `/writing` on the entry), and the compare exits 0.

### Cases: SKILL.md read against the skill layout, SKILL.md Steps and prompt read against D1, D6, D16, D29 and D30, rules.md read against the prose standard, registers.md read against D11, D18 and D22

First read: the files do not exist on the unchanged tree, so there is nothing to read.

```
$ git ls-tree -r --name-only HEAD skills/writing | wc -l
       0
```

Result: the four cases cannot be met on the unchanged tree. The layout they are read against is `docs/dev/skill-layout.md`, read in full.

### Case: each of the three records, read against its source file

First read: the records are written by this step. The sources, as counted on the unchanged tree:

```
$ wc -l academic_writing_style.md writing_judgment_framework.md writing_quality_check.md   (in research-hub/.agents/skills/academic-paper/references)
     188 academic_writing_style.md
      59 writing_judgment_framework.md
     173 writing_quality_check.md
     420 total
$ grep -n "rebuild: writing" docs/academic-coverage.md | cut -c1-90
76:| `references/academic_writing_style.md` | rebuild: writing | The writing skills share 
100:| `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses 
101:| `references/writing_quality_check.md` | rebuild: writing | The writing base checks a
```

Result: the three rows exist (lines 76, 100, 101); no record exists yet.

### Case: docs/academic-coverage.md lines 76, 100 and 101, read

First read, from the base:

```
$ git show HEAD:docs/academic-coverage.md | sed -n "76p;100p;101p"
| `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section. Of six discipline registers they keep Engineering and CS, not zh-TW conventions. |
| `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer, each discipline's trusted voice and each section's "so what". Its revision decision matrix belongs with `rebuttal`. |
| `references/writing_quality_check.md` | rebuild: writing | The writing base checks anti-patterns, among them filler terms, over three dashes, throat-clearing openers, forced triples, synonym cycling, binary contrasts and runs of equal-length sentences. Roadmap entry 3 names the dash and anti-pattern checks. |
```

Result: none of the three names a file of `skills/writing/`, and line 101 says "over three dashes".

### Case: README.md table row and for line, docs/dev/scripts.md row, the agent definitions, the four comments, skills/repo-setup/templates/docs/glossary.md line 3, and the versions, read

First read, from the base:

```
$ git show HEAD:README.md | grep -n "writing\|for skill in" | cut -c1-210
103:    for skill in diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec; do
$ git show HEAD:docs/dev/scripts.md | grep -c writing
0
$ git show HEAD:agents/ordo-low.md | sed -n '3p;6p' | cut -c1-175
description: Ordo's agent at low effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first
$ git show HEAD:agents/ordo-medium.md | sed -n '3p;6p' | cut -c1-175
description: Ordo's agent at medium effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first
$ git show HEAD:agents/ordo-high.md | sed -n '3p;6p' | cut -c1-175
description: Ordo's agent at high effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first
$ git show HEAD:agents/ordo-xhigh.md | sed -n '3p;6p' | cut -c1-175
description: Ordo's agent at xhigh effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first
$ git show HEAD:agents/ordo-max.md | sed -n '3p;6p' | cut -c1-175
description: Ordo's agent at max effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first
$ git show HEAD:skills/plan/templates/plan.yaml | sed -n '12p;27p'
reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
reviewer_effort: high                     # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
$ git show HEAD:skills/plan/templates/orchestrator-state.md | sed -n 26p
reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
$ git show HEAD:.agents/plan.yaml | sed -n 10p
reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
$ git show HEAD:skills/repo-setup/templates/docs/glossary.md | sed -n 3p | cut -c1-210
This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `repo-setup` and `ordo-init` use in a sense of thei
$ git show HEAD:skills/repo-setup/SKILL.md | grep -n version; git show HEAD:skills/plan/SKILL.md | grep -n version
5:  version: "5.1.0"
5:  version: "5.0.0"
```

Result: no `writing` row, no `writing` in the `for` line, no script row, the agent lines and the comments without the review agent of `writing`, the glossary line 3 without `writing`, versions 5.1.0 and 5.0.0.


### Cases the brief's rules got wrong

One case wording, in "Cases": "The same script on `First page of thesis_070519.docx`: each text box's paragraphs printed once, and no paragraph printed twice". The rule as worded does not hold of the file: the file holds a Dutch and an English title page, and several lines are the same on both pages (KU Leuven, Jury:, the two title lines, the author's name, March 2023), so the output prints some lines twice because the file has them twice. The part of the case that holds is "each text box's paragraphs printed once", which the counts in "The cases after the change" prove (for example "Dante Mantini": 4 in the raw XML, 2 in the output). The run of the script on the file is in that section. No other case's wording was wrong: the other cases ran as worded. The orchestrator's ruling on this wording is not given in the brief, and none is needed to proceed, since the script's behaviour is the one the brief states in "What to build" item 4.

## DONE / NOT DONE

Everything in the table is DONE; nothing in the brief is NOT DONE. The output of each check stands in the sections named in the last column, as printed.

| Item | State | Check | Output in |
|---|---|---|---|
| 1. `skills/writing/SKILL.md` | DONE | `ls -R skills/writing`; `grep -n '^#' skills/writing/SKILL.md` (frontmatter, then the title and the nine sections of the layout in order, the one reference section being "Review agent prompt"); the description-length command printed 602; the character-set grep printed 0 for the file | "The checks of the brief's Verify list" |
| 2. `skills/writing/references/rules.md` | DONE | `grep -n '^## '` for the groups; the second and third records for its rows; the character-set grep printed 0 | "The checks of the brief's Verify list", "The three records" |
| 3. `skills/writing/references/registers.md` | DONE | `grep -n '^## '` for the four registers; the first and second records for its rows; the character-set grep printed 0 | same |
| 4. `skills/writing/templates/docx_paragraphs.py` | DONE | the runs of every case, the numbering check, the head-comment table; the character-set grep printed 0 | "The cases after the change", "Change standard rule 14" |
| 5. Section C of the prose standard | DONE | `git show HEAD:... | wc -l` and `wc -l` printed 75 and 75; the two lines of `git diff -U0` | "Items 5, 6, 8, 9 and 10" |
| 6. The term **finding**, **effort agent**, **reviewer**, glossary line 3, `repo-setup` 5.2.0 | DONE | `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0; `git diff -U0`; the `grep -n` of "The terms" | "The checks of the brief's Verify list", "The terms" |
| 7. The records | DONE | the three records, each source line with the place line quoted; every non-blank source line has a row (the count command at the head of the records) | "The three records" |
| 8. The coverage rows 76, 100 and 101 | DONE | `check_coverage.py` printed `ok: docs/academic-coverage.md`, exit 0; `git diff -U0` of the three rows | "The checks of the brief's Verify list", "Items 5, 6, 8, 9 and 10" |
| 9. Agents, configuration comments, `plan` 5.0.1 | DONE | `check_config.test.sh` printed `PASS: check_config.py scratch tests`; `check_config.py .` printed its `ok:` line; `git diff -U0`; the rule-14 greps | same, "Change standard rule 14" |
| 10. The lists | DONE | `git diff -U0` of `README.md` (table row, `for skill` line, line 77) and `docs/dev/scripts.md`; the tree-versus-table comparison of scripts printed no difference | "Items 5, 6, 8, 9 and 10", "Change standard rule 14" |
| Verify 1 (the five checks) | DONE | the five commands; the character-set check printed nothing, exit 0 | "The checks of the brief's Verify list" |
| Verify 2 (coverage) | DONE | `check_coverage.py`, exit 0 | same |
| Verify 3 (description length) | DONE | printed 602 | same |
| Verify 4 (the docx cases) | DONE | every case, run on the changed tree | "The cases after the change" |
| Verify 5 (list items and sentences) | DONE | the word count and the named departures | "Verify 5" |
### The checks of the brief's Verify list, run on the final tree

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
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md skills/writing/templates/docx_paragraphs.py skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/templates/plan-terms.md skills/repo-setup/SKILL.md docs/glossary.md docs/academic-coverage.md docs/dev/scripts.md README.md agents/ordo-low.md agents/ordo-medium.md agents/ordo-high.md agents/ordo-xhigh.md agents/ordo-max.md skills/plan/templates/plan.yaml skills/plan/templates/orchestrator-state.md skills/plan/SKILL.md .agents/plan.yaml skills/repo-setup/templates/docs/glossary.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research; echo "exit $?"
ok: docs/academic-coverage.md
exit 0
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/writing/SKILL.md").read().split("---")[1])["description"]))'
602
$ python3 skills/ordo-init/templates/check_config.py . | tail -1 | cut -c1-120
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
$ ls -R skills/writing
references
SKILL.md
templates

skills/writing/references:
registers.md
rules.md

skills/writing/templates:
docx_paragraphs.py
$ sed -n 1,6p skills/writing/SKILL.md | cut -c1-70
---
name: writing
description: "Review the prose of a draft with one fresh agent that ch
metadata:
  version: "1.0.0"
---
$ grep -n '^#' skills/writing/SKILL.md
8:# Review the prose of a draft
12:## Quick start
19:## Use instead
27:## What it reads
45:## Steps
74:## Review agent prompt
105:## Stops
118:## Anti-patterns
125:## Rules
$ grep -n '^## ' skills/writing/references/rules.md skills/writing/references/registers.md
skills/writing/references/rules.md:5:## Precision
skills/writing/references/rules.md:19:## Concision
skills/writing/references/rules.md:25:## Objectivity
skills/writing/references/rules.md:35:## Formality (manuscripts and grants)
skills/writing/references/rules.md:45:## Hedging
skills/writing/references/rules.md:76:## Transitions
skills/writing/references/rules.md:92:## Paragraphs
skills/writing/references/rules.md:106:## Common style errors
skills/writing/references/rules.md:149:## Reader's path
skills/writing/references/rules.md:177:## Flagged terms
skills/writing/references/registers.md:7:## Sciences (Natural, Applied)
skills/writing/references/registers.md:25:## Social Sciences
skills/writing/references/registers.md:43:## Engineering and CS
skills/writing/references/registers.md:61:## Medicine and Health
$ LC_ALL=C grep -c '[^ -~]' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md skills/writing/templates/docx_paragraphs.py
skills/writing/SKILL.md:0
skills/writing/references/rules.md:0
skills/writing/references/registers.md:0
skills/writing/templates/docx_paragraphs.py:0
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md skills/writing/templates/docx_paragraphs.py
     127 skills/writing/SKILL.md
     220 skills/writing/references/rules.md
      77 skills/writing/references/registers.md
     139 skills/writing/templates/docx_paragraphs.py
     563 total
```
## The cases after the change (Verify 4)

Each run below is on the changed tree. Output is quoted whole as printed except where a line is stated to be an excerpt. The script's output files and the cut-short copies are in the session's scratch folder `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06`, outside both repositories.

### Case: `ls skills/writing` after the change

```
$ ls -R skills/writing; echo "exit $?"
references
SKILL.md
templates

skills/writing/references:
registers.md
rules.md

skills/writing/templates:
docx_paragraphs.py
exit 0
```

The folder holds `SKILL.md`, `references/rules.md`, `references/registers.md` and `templates/docx_paragraphs.py`, as the case says.

### Case: the NWO XS grant, whole output

```
$ python3 skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx > nwo.out; echo "exit $?"
exit 0
$ wc -l nwo.out; LC_ALL=C grep -c "[^ -~]" nwo.out
      55 nwo.out
0
$ cat nwo.out
1: Proposal details
2: Title of the project:    Before the tumour: an interpretable pre-lesional field trajectory that anticipates lesion emergence in the cirrhotic liver
3: Duration of the project (in months): 12
4: Public summary
5: English public summary (90/100):
6: Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure. Cancer is thought to arise from gradual change across the whole diseased liver. This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears. Beforehand, we check the method on real scans with added changes of known size. Where in the liver the change concentrates is explored separately.
7: Dutch public summary (90/100):
8: Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen. Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever. Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt. Vooraf toetsen we de methode op echte scans met toegevoegde veranderingen van bekende grootte. Waar in de lever de verandering zich concentreert, onderzoeken we apart.
9: Budget 
10: Type of costs
11: Clarification
12: Costs in euros
13: Personnel
14: Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO table
15: 42.832
16: Travel
17: Two international conferences, economy/second class
18: 4.800
19: Dissemination
20: Open-access charges and costs of the openly released atlas
21: 2.368
22: Total request from NWO
23: 50.000
24: Budget justification (124/150)
25: The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas. The effort is spread over the whole project because the work packages overlap. The applicant's standing appointment covers the remaining time. Computing is provided by the host institution at no cost, so none is requested. Travel and accommodation costs cover two international conferences at economy or second-class fares. Dissemination covers open-access publication charges and the costs of the openly released atlas. The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise. No basic amenities, overheads, or maintenance are requested.
26: Project proposal
27: Problem and opportunity. Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]. In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window. Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue. Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]. Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied. The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand.
28: The idea (high-risk/high-gain). We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis. The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients). Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis. A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence. The claim is predictive: the change precedes the tumour. Whether it reflects a diffuse malignant field or a focal precursor is the exploratory question of C3. Molecular confirmation lies outside this project. Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk. If it does, surveillance can warn within the curative window. The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans.
29: Objectives.
30: C1  Interpretable background-liver components, reproducible and checked against fat and iron estimates from the same MRI, with a calibrated detection limit.
31: C2  Pre-diagnosis trajectory (confirmatory): do the components depart from each patient's stable course at least 12 months before HCC is diagnosed, more than in matched never-HCC patients?
32: C3  Location (exploratory): does the change concentrate where the tumour later appears?
33: Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe). The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC. The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection. The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans. Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study. Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set. The 148 never-HCC patients with two or more usable studies form the comparison pool. Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients.
34: C1. We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place. The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference. The analyst receives only studies taken before diagnosis (see C2). Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1). The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more. Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status. Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2. Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test.
35: C2 (confirmatory: when). The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation. The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study. In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3. Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1. In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study. With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05). A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations). The primary test is repeated in the 5 patients with no recorded decompensation by their tested study. A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies. A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect. The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered. The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels. Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.
36: C3 (exploratory: where). The liver segment where the tumour later appears is taken from the clinical record. We test whether the change is larger in that segment than when the tumour label is moved at random among the same patient's segments, with a correction for multiple testing. Success means the future tumour segment ranks above these random relabellings.
37: Figure 1. Each patient's serial MRI before diagnosis is reduced to a few interpretable components of the background liver. The lower panel sketches a divergence score rising above the smallest detectable change before diagnosis.
38: Feasibility, work plan and timeline (12 months). The applicant works at 0,42 FTE across all twelve months on a cohort that is already available, using open-source image-alignment software [12] and established methods for such component summaries [9]. Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data).
39: Risks and mitigation. (i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding. (ii) Severity: decompensation status at each scan enters the supporting within-patient model. (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching. (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates.
40: Broader impact and novelty. Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]. Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]. What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components. If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change).
41: Data management. The cohort is governed by an existing data agreement and is not redistributable. The atlas (component definitions, summary maps and code) contains no patient-level data and will be released openly. The full data-management plan, written in WP1, follows the "as open as possible, as closed as necessary" principle.
42: Literature references
43: 1. Villanueva, A. Hepatocellular carcinoma. New England Journal of Medicine, 380:1450-1462, 2019. doi:10.1056/nejmra1713263.
44: 2. Singal, A.G.; Llovet, J.M.; Yarchoan, M.; Mehta, N.; Heimbach, J.K.; Dawson, L.A.; Jou, J.H.; Kulik, L.M.; Agopian, V.G.; Marrero, J.A.; Mendiratta-Lala, M.; Brown, D.B.; Rilling, W.S.; Goyal, L.; Wei, A.C.; Taddei, T.H. AASLD practice guidance on prevention, diagnosis, and treatment of hepatocellular carcinoma. Hepatology, 78:1922-1965, 2023. doi:10.1097/hep.0000000000000466.
45: 3. Chernyak, V.; Fowler, K.J.; Kamaya, A.; Kielar, A.Z.; Elsayes, K.M.; Bashir, M.R.; Kono, Y.; Do, R.K.; Mitchell, D.G.; Singal, A.G.; Tang, A.; Sirlin, C.B. Liver Imaging Reporting and Data System (LI-RADS) version 2018: imaging of hepatocellular carcinoma in at-risk patients. Radiology, 289:816-830, 2018. doi:10.1148/radiol.2018181494.
46: 4. Kim, Y.K.; Lee, W.J.; Park, M.J.; Kim, S.H.; Rhim, H.; Choi, D. Hypovascular hypointense nodules on hepatobiliary phase gadoxetic acid-enhanced MR images in cirrhosis: potential of DW imaging in predicting progression to hypervascular HCC. Radiology, 265:104-114, 2012. doi:10.1148/radiol.12112649.
47: 5. Slaughter, D.P.; Southwick, H.W.; Smejkal, W. Field cancerization in oral stratified squamous epithelium; clinical implications of multicentric origin. Cancer, 6:963-968, 1953.
48: 6. Hoshida, Y.; Villanueva, A.; Kobayashi, M.; Peix, J.; Chiang, D.Y.; Camargo, A.; Gupta, S.; Moore, J.; Wrobel, M.J.; Lerner, J.; Reich, M.; Chan, J.A.; Glickman, J.N.; Ikeda, K.; Hashimoto, M.; Watanabe, G.; Daidone, M.G.; Roayaie, S.; Schwartz, M.; Thung, S.; Salvesen, H.B.; Gabriel, S.; Mazzaferro, V.; Bruix, J.; Friedman, S.L.; Kumada, H.; Llovet, J.M.; Golub, T.R. Gene expression in fixed tissues and outcome in hepatocellular carcinoma. New England Journal of Medicine, 359:1995-2004, 2008. doi:10.1056/nejmoa0804525.
49: 7. Aerts, H.J.W.L.; Velazquez, E.R.; Leijenaar, R.T.H.; Parmar, C.; Grossmann, P.; Carvalho, S.; Bussink, J.; Monshouwer, R.; Haibe-Kains, B.; Rietveld, D.; Hoebers, F.; Rietbergen, M.M.; Leemans, C.R.; Dekker, A.; Quackenbush, J.; Gillies, R.J.; Lambin, P. Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach. Nature Communications, 5:4006, 2014. doi:10.1038/ncomms5006.
50: 8. Wei, Y.; Gong, J.; He, X.; Liu, B.; Liu, T.; Yang, S.; Zhou, Z.; Liang, L.; Zhan, S.; Xia, Z.; Duan, G.; Lin, B.; Han, Q.; Li, S.; Qin, W.; Pickhardt, P.J.; Deng, D. An MRI-based radiomic model for individualized prediction of hepatocellular carcinoma in patients with hepatitis B virus-related cirrhosis. Frontiers in Oncology, 12:800787, 2022. doi:10.3389/fonc.2022.800787.
51: 9. Kolda, T.G.; Bader, B.W. Tensor decompositions and applications. SIAM Review, 51:455-500, 2009. doi:10.1137/07070111X.
52: 10. De Lathauwer, L. Decompositions of a higher-order tensor in block terms - Part II: definitions and uniqueness. SIAM Journal on Matrix Analysis and Applications, 30:1033-1066, 2008. doi:10.1137/070690729.
53: 11. Rudin, C. Stop explaining black box machine learning models for high stakes decisions and use interpretable models instead. Nature Machine Intelligence, 1:206-215, 2019. doi:10.1038/s42256-019-0048-x.
54: 12. Avants, B.B.; Tustison, N.J.; Song, G.; Cook, P.A.; Klein, A.; Gee, J.C. A reproducible evaluation of ANTs similarity metric performance in brain image registration. NeuroImage, 54:2033-2044, 2011. doi:10.1016/j.neuroimage.2010.09.025.
55: 13. Singh, S.; Fujii, L.L.; Murad, M.H.; Wang, Z.; Asrani, S.K.; Ehman, R.L.; Kamath, P.S.; Talwalkar, J.A. Liver stiffness is associated with risk of decompensation, liver cancer, and death in patients with chronic liver diseases: a systematic review and meta-analysis. Clinical Gastroenterology and Hepatology, 11:1573-1584.e2, 2013. doi:10.1016/j.cgh.2013.07.034.
```

### Cases: the NWO XS grant, the lines the brief names

Printed lines: 55. `word/document.xml` holds 63 `<w:p ` paragraphs, of which 8 hold no `<w:t` and are not printed (`unzip -p <file> word/document.xml | sed 's/<w:p[ >]/\n&/g'`, then `grep -c '^<w:p '` printed 63 and `grep '^<w:p ' | grep -vc '<w:t[ >]'` printed 8). No `[word/footnotes.xml]` or `[word/endnotes.xml]` line is among the 55 (`grep -c '\[word/' nwo.out` below).

```
$ grep -c "\[word/" nwo.out
0

Paragraph "Duration of the project (in months):" - XML paragraph, from unzip -p:
<w:p w14:paraId="5E04B3C9" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="333333"/><w:szCs w:val="19"/><w:lang w:val="en-US"/></w:rPr></w:pPr><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="333333"/><w:szCs w:val="19"/><w:lang w:val="en-US"/></w:rPr><w:t>Duration of the project (in months):</w:t></w:r><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="333333"/><w:szCs w:val="19"/><w:lang w:val="en-US"/></w:rPr><w:tab/></w:r><w:r><w:t>12</w:t></w:r></w:p>
$ sed -n 3p nwo.out | od -c | head -8
0000000    3   :       D   u   r   a   t   i   o   n       o   f       t
0000020    h   e       p   r   o   j   e   c   t       (   i   n       m
0000040    o   n   t   h   s   )   :       1   2  \n                    
0000053
(one space between the colon and 12; the XML holds a run-level <w:tab/> between the two <w:t> elements and the script prints one space for it)

Page-break paragraph, XML paragraph 34 of the split:
<w:p w14:paraId="00D6509C" w14:textId="77777777" w:rsidR="005575F3" w:rsidRPr="007F0282" w:rsidRDefault="005575F3"><w:pPr><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:b/><w:szCs w:val="19"/><w:lang w:val="en-US"/></w:rPr></w:pPr><w:r w:rsidRPr="007F0282"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:b/><w:szCs w:val="19"/><w:lang w:val="en-US"/></w:rPr><w:br w:type="page"/></w:r></w:p>
$ sed -n 25,26p nwo.out | cut -c1-110 ; the page-break paragraph has no <w:t>, so it has no line and lines 25 and 26 follow each other
25: The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL
26: Project proposal

Paragraphs with a tab stop (w:tabs in w:pPr), XML, then the output lines 5 to 8 (cut -c1-150; the XML is whole):
<w:p w14:paraId="60C7C9F0" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:tabs><w:tab w:val="left" w:pos="284"/></w:tabs><w:jc w:val="both"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>English public summary</w:t></w:r><w:r w:rsidR="00A313BB" w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> (90/100)</w:t></w:r><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>:</w:t></w:r></w:p>
<w:p w14:paraId="6B9AE2E9" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:tabs><w:tab w:val="left" w:pos="284"/></w:tabs><w:spacing w:after="40"/><w:jc w:val="both"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr><w:r><w:t>Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure. Cancer is thought to arise from gradual change across the whole diseased liver. This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears. Beforehand, we check the method on real scans with added changes of known size. Where in the liver the change concentrates is explored separately.</w:t></w:r></w:p>
<w:p w14:paraId="300005F9" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:tabs><w:tab w:val="left" w:pos="284"/></w:tabs><w:jc w:val="both"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr></w:p>
<w:p w14:paraId="0BF1E891" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:tabs><w:tab w:val="left" w:pos="284"/></w:tabs><w:jc w:val="both"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>Dutch public summary</w:t></w:r><w:r w:rsidR="00A313BB" w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> (90/100)</w:t></w:r><w:r w:rsidRPr="00DB4F86"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>:</w:t></w:r></w:p>
<w:p w14:paraId="5A73C49D" w14:textId="77777777" w:rsidR="007B5868" w:rsidRPr="00DB4F86" w:rsidRDefault="007B5868" w:rsidP="007B5868"><w:pPr><w:tabs><w:tab w:val="left" w:pos="284"/></w:tabs><w:spacing w:after="40"/><w:jc w:val="both"/><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:eastAsia="Arial" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr><w:r><w:t>Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen. Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever. Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt. Vooraf toetsen we de methode op echte scans met toegevoegde veranderingen van bekende grootte. Waar in de lever de verandering zich concentreert, onderzoeken we apart.</w:t></w:r></w:p>
5: English public summary (90/100):
6: Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure. Cancer is though
7: Dutch public summary (90/100):
8: Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te geneze

Table cell, XML (the cell opening, then the paragraph), then output line 14:
<w:tc><w:tcPr><w:tcW w:w="5490" w:type="dxa"/></w:tcPr><w:p w14:paraId="35679579" w14:textId="77777777" w:rsidR="00193B7F" w:rsidRDefault="00000000"><w:pPr><w:spacing w:after="20"/></w:pPr><w:r><w:t>Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO table</w:t></w:r></w:p></w:tc>
14: Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO table
```

### Cases: no argument, two arguments, a file that is not a zip, a path that does not exist, a directory

```
$ python3 skills/writing/templates/docx_paragraphs.py; echo "exit $?"
usage: docx_paragraphs.py <file.docx>
exit 2
$ python3 skills/writing/templates/docx_paragraphs.py a b; echo "exit $?"
usage: docx_paragraphs.py <file.docx>
exit 2
$ python3 skills/writing/templates/docx_paragraphs.py README.md; echo "exit $?"
error: README.md: not a zip file
exit 1
$ python3 skills/writing/templates/docx_paragraphs.py /nonexistent.docx; echo "exit $?"
error: /nonexistent.docx: No such file or directory
exit 1
$ python3 skills/writing/templates/docx_paragraphs.py /tmp; echo "exit $?"
error: /tmp: Is a directory
exit 1
$ python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/grant-cut.docx; echo "exit $?"
error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/grant-cut.docx: word/document.xml: not well-formed XML (no element found: line 2, column 19943)
exit 1
$ python3 skills/writing/templates/docx_paragraphs.py /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/nodoc.docx; echo "exit $?"
error: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06/nodoc.docx: no word/document.xml
exit 1
```

The cut-short copy is made in the scratch folder from a copy of the NWO XS grant: it is unzipped, `word/document.xml` is cut to its first 20000 bytes with `head -c 20000`, and the folder is zipped again with `zip -q -r -X`. The run on it is the sixth command of the block above: one `error:` line naming the part and the parser's message, exit 1. The copy without `word/document.xml` (`nodoc.docx`, the same copy zipped without that part) gives the seventh: `error: <path>: no word/document.xml`, exit 1.

### Case: the HexC proposal

Run, with the XML split one element per line for reading (`unzip -p <file> word/document.xml | sed 's/<w:p[ >]/\n&/g'`, then `sed 's/<w:ins /\n&/g; s/<\/w:ins>/&\n/g'` and the same for `w:del`, `w:sdt` and `w:hyperlink`). The XML lines are quoted whole.

```
$ python3 skills/writing/templates/docx_paragraphs.py "<HexC>.docx" > hexc2.out; echo "exit $?"; wc -l hexc2.out; cmp hexc2.out hexc.out && echo same
exit 0
lines: 202
same

--- One insertion, XML (w:ins id 4, inside the content control goog_rdk_7):
<w:ins w:author="Bert Vaes" w:id="4" w:date="2025-02-15T08:27:42Z"><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:sz w:val="22"/><w:szCs w:val="22"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve">, investigate</w:t></w:r></w:ins>
--- and the output line that holds it (line 105, text before and after the insertion kept):
105: BACKGROUND: To manage a population of ASCVD patients based on social determinants, these determinants should be visualized for physicians, ideally on an individual level, practically on meso-level. The preferred route to define, investigate and visualize populations by social determinants and presence of ASCVD is to use a federated data approach with decentralized aggregated data from different data sources. Fortunately, there are precedents of data sharing by health care insurances. For example in 2023 two dashboards were introduced, one focusing on antibiotic use and the other on diabetes. 

--- One content control, XML (the opening, the insertion it holds, the closing; w:ins id 5 in goog_rdk_8):
<w:sdt><w:sdtPr><w:tag w:val="goog_rdk_8"/></w:sdtPr><w:sdtContent>
<w:ins w:author="Bert Vaes" w:id="5" w:date="2025-02-15T08:27:56Z"><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:sz w:val="22"/><w:szCs w:val="22"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve"> and presence of ASCVD</w:t></w:r></w:ins>
</w:sdtContent></w:sdt>
--- and the output line, the same line 105 (the text " and presence of ASCVD" stands in it):
visualize populations by social determinants and presence of ASCVD

--- One deletion, XML (w:del id 9 with w:delText, inside the content control goog_rdk_14), then the run after it:
<w:sdt><w:sdtPr><w:tag w:val="goog_rdk_14"/></w:sdtPr><w:sdtContent>
<w:del w:author="Bert Vaes" w:id="9" w:date="2025-02-15T08:28:51Z"><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:sz w:val="22"/><w:szCs w:val="22"/><w:rtl w:val="0"/></w:rPr><w:delText xml:space="preserve">existing </w:delText></w:r></w:del>
</w:sdtContent></w:sdt>
<w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:sz w:val="22"/><w:szCs w:val="22"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve">data</w:t></w:r>
--- and the output: the text around the deletion, "existing " absent:
with decentralized aggregated data from
$ sed -n 105p hexc.out | grep -c "existing"
0

--- One hyperlink, XML (w:hyperlink r:id rId14), and the output line 187:
<w:hyperlink r:id="rId14"><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Cambria" w:cs="Cambria" w:eastAsia="Cambria" w:hAnsi="Cambria"/><w:b w:val="0"/><w:i w:val="0"/><w:smallCaps w:val="0"/><w:strike w:val="0"/><w:color w:val="0000ff"/><w:sz w:val="24"/><w:szCs w:val="24"/><w:u w:val="single"/><w:shd w:fill="auto" w:val="clear"/><w:vertAlign w:val="baseline"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve">https://www.vivel.be/over-vivel/quintuple-aim/</w:t></w:r></w:hyperlink>
187: 8. Vivel. Quintuple aim  [Available from: https://www.vivel.be/over-vivel/quintuple-aim/.

--- Comments: the texts in word/comments.xml start "Is dit een RCT", "IMA werkt met proxy" and "Dit klopt niet volgens"; the count of each in the output:
Is dit een RCT: 0
IMA werkt met proxy: 0
Dit klopt niet volgens: 0

--- One footnote, XML of the footnote with w:id 0 in word/footnotes.xml (the en dash is written <en dash>), and the output line 202:
<w:footnote w:id="0"><w:p w:rsidR="00000000" w:rsidDel="00000000" w:rsidP="00000000" w:rsidRDefault="00000000" w:rsidRPr="00000000" w14:paraId="0000014C"><w:pPr><w:pBdr><w:top w:space="0" w:sz="0" w:val="nil"/><w:left w:space="0" w:sz="0" w:val="nil"/><w:bottom w:space="0" w:sz="0" w:val="nil"/><w:right w:space="0" w:sz="0" w:val="nil"/><w:between w:space="0" w:sz="0" w:val="nil"/></w:pBdr><w:jc w:val="both"/><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:color w:val="000000"/><w:sz w:val="18"/><w:szCs w:val="18"/></w:rPr></w:pPr><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rStyle w:val="FootnoteReference"/><w:vertAlign w:val="superscript"/></w:rPr><w:footnoteRef/></w:r><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:color w:val="000000"/><w:sz w:val="18"/><w:szCs w:val="18"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve"> This proposal has to be completed if you have </w:t></w:r><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:i w:val="1"/><w:color w:val="000000"/><w:sz w:val="18"/><w:szCs w:val="18"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve">not</w:t></w:r><w:r w:rsidDel="00000000" w:rsidR="00000000" w:rsidRPr="00000000"><w:rPr><w:rFonts w:ascii="Verdana" w:cs="Verdana" w:eastAsia="Verdana" w:hAnsi="Verdana"/><w:color w:val="000000"/><w:sz w:val="18"/><w:szCs w:val="18"/><w:rtl w:val="0"/></w:rPr><w:t xml:space="preserve"> obtained a scholarship from UHasselt or FWO and thus will start your PhD program unremunerated by UHasselt. The document can be replaced by an existing funding proposal, provided it contains the information this document requests and <en dash> in case of a larger project - it is clearly indicated which work packages will be the subject of the doctoral project. The doctoral school of health and life sciences will provide an advice to the faculty board concerning the admission to the doctoral program.</w:t></w:r></w:p></w:footnote></w:footnotes>
$ sed -n 202p hexc.out
202 [word/footnotes.xml]:  This proposal has to be completed if you have not obtained a scholarship from UHasselt or FWO and thus will start your PhD program unremunerated by UHasselt. The document can be replaced by an existing funding proposal, provided it contains the information this document requests and <en dash> in case of a larger project - it is clearly indicated which work packages will be the subject of the doctoral project. The doctoral school of health and life sciences will provide an advice to the faculty board concerning the admission to the doctoral program.
$ grep -c "^[0-9]* \[word/" hexc.out ; the footnote line is the only one with a part
1
```

### Case: main_MVH2_AF2.docx (source-localization)

XML split with `unzip -p <file> word/document.xml | sed 's/<w:moveFrom /\n&/g; s/<\/w:moveFrom>/&\n/g; s/<w:moveTo /\n&/g; s/<\/w:moveTo>/&\n/g'`. The `w:moveFrom` text is a `<w:t>`, not a `<w:delText>`, as the brief says.

```
$ python3 skills/writing/templates/docx_paragraphs.py main_MVH2_AF2.docx > mvh3.out; echo "exit $?"; cmp mvh3.out mvh2.out && echo same; wc -l < mvh3.out
exit 0
same
     367

--- The w:moveFrom, XML (id 386):
<w:moveFrom w:id="386" w:author="Marc Van Hulle" w:date="2021-03-24T13:34:00Z"><w:r w:rsidRPr="009F45D3" w:rsidDel="0095035E"><w:rPr><w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:cs="Courier New"/><w:lang w:val="en-US"/></w:rPr><w:t xml:space="preserve">A simulation study provides us with a ground truth against which our results can be verified. </w:t></w:r></w:moveFrom>
--- The w:moveTo elements that carry the text, XML (id 380 holds the sentence, id 382 holds ". "):
<w:moveTo w:id="380" w:author="Marc Van Hulle" w:date="2021-03-24T13:34:00Z"><w:r w:rsidRPr="009F45D3"><w:rPr><w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:cs="Courier New"/><w:lang w:val="en-US"/></w:rPr><w:t>A simulation study provides us with a ground truth against which our results can be verified</w:t></w:r></w:moveTo>
<w:moveTo w:id="382" w:author="Marc Van Hulle" w:date="2021-03-24T13:34:00Z"><w:r w:rsidRPr="009F45D3"><w:rPr><w:rFonts w:ascii="Courier New" w:hAnsi="Courier New" w:cs="Courier New"/><w:lang w:val="en-US"/></w:rPr><w:t xml:space="preserve">. </w:t></w:r></w:moveTo>
--- Output: the sentence text occurs once, in line 47 (the moveFrom copy, with its trailing ". ", is not printed):
$ grep -c "A simulation study provides" mvh3.out
1
$ sed -n 47p mvh3.out
47: A simulation study provides us with a ground truth against which our results can be verified and compared with those of other methods. We adopt the simulation framework of \cite{anzolin2019quantifying} which consists of several steps (Figure~\ref{fig:simulation:framework}): the generation of brain signals with a predetermined connectivity pattern as ground truth, noise generation, forward modeling, inverse modeling, connectivity estimation, and performance evaluation. \cite{anzolin2019quantifying} However, we propose a different approach for the first step, as we are not interested in connectivity estimation but rather in inverse modeling. 
```

### Case: First page of thesis_070519.docx, whole output

The file holds 12 `<mc:Choice` and 12 `<mc:Fallback` alternatives and 24 `<w:txbxContent` (each text box written under both, as the brief says). Each text box's paragraph stands once in the output. The XML paragraph for "Dante Mantini" stands in `mc:Choice` and again, identical, in `mc:Fallback` of one text box:

```
<w:p w14:paraId="40C37B32" w14:textId="0939E766" w:rsidR="00220E08" w:rsidRDefault="00220E08"><w:pPr><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/><w:sz w:val="20"/><w:szCs w:val="20"/><w:lang w:val="nl-BE"/></w:rPr></w:pPr><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/><w:sz w:val="20"/><w:szCs w:val="20"/><w:lang w:val="nl-BE"/></w:rPr><w:tab/><w:t>Dante Mantini</w:t></w:r></w:p>
<w:p w14:paraId="40C37B32" w14:textId="0939E766" w:rsidR="00220E08" w:rsidRDefault="00220E08"><w:pPr><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/><w:sz w:val="20"/><w:szCs w:val="20"/><w:lang w:val="nl-BE"/></w:rPr></w:pPr><w:r><w:rPr><w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/><w:sz w:val="20"/><w:szCs w:val="20"/><w:lang w:val="nl-BE"/></w:rPr><w:tab/><w:t>Dante Mantini</w:t></w:r></w:p>
$ python3 skills/writing/templates/docx_paragraphs.py "First page of thesis_070519.docx"; echo "exit $?"
1: KU Leuven
2: Groep Biomedische Wetenschappen
3: Faculteit Geneeskunde
4: Departement Neurowetenschappen                                                                                              
5: Jury:
6: Promotor: Marc M. Van Hulle 
7: Voorzitter leescommissie: Dirk Daelemans
8: Voorzitter openbare verdediging: Patrick Dupont
9: Juryleden:
10:  Luc De Raedt
11:  Dante Mantini
12:  Alfred Meurs
13:  Nick Ramsey
14: Finger Movement Decoding
15: from source localisation to tensor regression modeling
16: Axel Faes
17: March 2023
18: Proefschrift voorgedragen tot het behalen van de graad van Doctor in de Biomedical Sciences (PhD)
19: KU Leuven
20: Biomedical Sciences Group
21: Faculty of Medicine
22: Department of Neurosciences
23: Finger Movement Decoding
24: from source localisation to tensor regression modeling
25: Jury:
26: Supervisor: Marc M. Van Hulle 
27: Chair examining committee: Dirk Daelemans
28: Chair public defence: Patrick Dupont
29: Jury members
30: Luc De Raedt
31:  Dante Mantini
32:  Alfred Meurs
33:  Nick Ramsey
34: Dissertation presented in partial fulfilment of the requirements for the degree of Doctor in Biomedical Sciences (PhD)
35: Axel Faes
36: March 2023
exit 0
```

"No paragraph printed twice" cannot hold as the brief words it, because the file holds a Dutch and an English title page that repeat lines of their own (KU Leuven, Jury:, the two title lines, the author's name, March 2023). The count of each name in the raw XML against the output shows the Choice and Fallback copies are not both printed:

```
Dante Mantini: raw 4, output 2
Jury: raw 8, output 4
Luc De Raedt: raw 4, output 2
Movement: raw 4, output 2
```

"Dante Mantini" is in the raw XML 4 times (two text boxes, each under Choice and Fallback) and in the output 2 times (output lines 11 and 31: one on the Dutch page, one on the English page). "Movement" is in the raw XML 4 times (the English title text box and the Dutch title text box, each under Choice and Fallback; the Dutch title's words are in separate runs, so the phrase "Finger Movement Decoding" matches only the English one twice) and in the output 2 times (lines 14 and 23).

### Case: veni2026-preproposal-FILLED.docx

```
$ python3 skills/writing/templates/docx_paragraphs.py veni2026-preproposal-FILLED.docx > veni2.out; echo "exit $?"; cmp veni2.out veni.out && echo same; wc -l < veni2.out
exit 0
same
     243
$ unzip -p veni2026-preproposal-FILLED.docx word/footnotes.xml | grep -o '<w:t[ >]' | wc -l
      13
$ unzip -p veni2026-preproposal-FILLED.docx word/endnotes.xml | grep -o "<w:t[ >]" | wc -l
       0
--- The footnote with w:id 1, XML (the two separator footnotes hold no <w:t>):
<w:footnote w:id="1"><w:p w14:paraId="01E4109B" w14:textId="1DD9E4A5" w:rsidR="00100333" w:rsidRPr="0052131A" w:rsidRDefault="00100333"><w:pPr><w:pStyle w:val="FootnoteText"/><w:rPr><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr></w:pPr><w:r w:rsidRPr="0052131A"><w:rPr><w:rStyle w:val="FootnoteReference"/><w:sz w:val="19"/><w:szCs w:val="19"/></w:rPr><w:footnoteRef/></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> </w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>T</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve">o </w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>avoid</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> gender effects</w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>,</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> </w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>p</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve">lease </w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>do not</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> </w:t></w:r><w:r><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t>state</w:t></w:r><w:r w:rsidRPr="0052131A"><w:rPr><w:rFonts w:asciiTheme="minorHAnsi" w:hAnsiTheme="minorHAnsi" w:cstheme="minorHAnsi"/><w:color w:val="000000"/><w:sz w:val="19"/><w:szCs w:val="19"/><w:lang w:val="en-GB"/></w:rPr><w:t xml:space="preserve"> your first name.</w:t></w:r></w:p></w:footnote></w:footnotes>$ grep -n "\[word/" veni2.out
243:243 [word/footnotes.xml]:  To avoid gender effects, please do not state your first name.
```

### Items 5, 6, 8, 9 and 10: the diff of the tracked files, as printed

The prose standard keeps its line count, so ADR 0002's citations of it by line stay true:

```
$ git show HEAD:skills/repo-setup/templates/docs/dev/prose-standard.md | wc -l; wc -l skills/repo-setup/templates/docs/dev/prose-standard.md
      75
      75 skills/repo-setup/templates/docs/dev/prose-standard.md
$ git status --short
 M .agents/plan.yaml
 M README.md
 M agents/ordo-high.md
 M agents/ordo-low.md
 M agents/ordo-max.md
 M agents/ordo-medium.md
 M agents/ordo-xhigh.md
 M docs/academic-coverage.md
 M docs/dev/scripts.md
 M docs/glossary.md
 M skills/plan/SKILL.md
 M skills/plan/templates/orchestrator-state.md
 M skills/plan/templates/plan.yaml
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/docs/dev/prose-standard.md
 M skills/repo-setup/templates/docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/3-the-writing-base/agents/reviews/1-report.md
?? skills/writing/
$ git diff --numstat
1<tab>1<tab>.agents/plan.yaml
3<tab>2<tab>README.md
2<tab>2<tab>agents/ordo-high.md
2<tab>2<tab>agents/ordo-low.md
2<tab>2<tab>agents/ordo-max.md
2<tab>2<tab>agents/ordo-medium.md
2<tab>2<tab>agents/ordo-xhigh.md
3<tab>3<tab>docs/academic-coverage.md
1<tab>0<tab>docs/dev/scripts.md
3<tab>3<tab>docs/glossary.md
1<tab>1<tab>skills/plan/SKILL.md
2<tab>2<tab>skills/plan/templates/orchestrator-state.md
2<tab>2<tab>skills/plan/templates/plan.yaml
1<tab>1<tab>skills/repo-setup/SKILL.md
1<tab>1<tab>skills/repo-setup/templates/docs/dev/prose-standard.md
1<tab>1<tab>skills/repo-setup/templates/docs/glossary.md
3<tab>3<tab>skills/repo-setup/templates/plan-terms.md
```

The whole diff of the tracked files with no context lines (`git diff -U0`); every line is ASCII (`git diff -U0 | LC_ALL=C grep -c '[^ -~]'` printed 0):

```
diff --git a/.agents/plan.yaml b/.agents/plan.yaml
index 995062c..72a98cf 100644
--- a/.agents/plan.yaml
+++ b/.agents/plan.yaml
@@ -10 +10 @@ worker: claude:sonnet                     # claude:<model> of the builder, for e
-reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
+reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on.
diff --git a/README.md b/README.md
index 7309172..79259ed 100644
--- a/README.md
+++ b/README.md
@@ -25,0 +26 @@ Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `road
+| `writing` | Reviews the prose of a draft with one fresh agent that changes nothing: a `.tex` file with its input files, a `.md`, a `.txt` or a `.docx`. It reports each break of a named rule with its place, the quoted passage and what the rule asks for, grouped by rule, and proposes no replacement |
@@ -76 +77 @@ The skills call each other and read each other's templates, so install all of th
-The plan skills launch their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, which Claude Code reads from `~/.claude/agents` (or `$CLAUDE_CONFIG_DIR/agents`). `CLAUDE_CODE_EFFORT_LEVEL` must be unset, since it overrides the effort each definition sets.
+The plan skills and `writing` launch their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, which Claude Code reads from `~/.claude/agents` (or `$CLAUDE_CONFIG_DIR/agents`). `CLAUDE_CODE_EFFORT_LEVEL` must be unset, since it overrides the effort each definition sets.
@@ -103 +104 @@ for dir in ~/.claude/skills; do
-    for skill in diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec; do
+    for skill in diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec writing; do
diff --git a/agents/ordo-high.md b/agents/ordo-high.md
index 9fc5fb5..6b90a54 100644
--- a/agents/ordo-high.md
+++ b/agents/ordo-high.md
@@ -3 +3 @@ name: ordo-high
-description: Ordo's agent at high effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
+description: Ordo's agent at high effort. The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work.
@@ -6 +6 @@ effort: high
-You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
+You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
diff --git a/agents/ordo-low.md b/agents/ordo-low.md
index fe0bebf..20a51ea 100644
--- a/agents/ordo-low.md
+++ b/agents/ordo-low.md
@@ -3 +3 @@ name: ordo-low
-description: Ordo's agent at low effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
+description: Ordo's agent at low effort. The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work.
@@ -6 +6 @@ effort: low
-You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
+You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
diff --git a/agents/ordo-max.md b/agents/ordo-max.md
index e8d1652..2511c14 100644
--- a/agents/ordo-max.md
+++ b/agents/ordo-max.md
@@ -3 +3 @@ name: ordo-max
-description: Ordo's agent at max effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
+description: Ordo's agent at max effort. The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work.
@@ -6 +6 @@ effort: max
-You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
+You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
diff --git a/agents/ordo-medium.md b/agents/ordo-medium.md
index f015cd4..19798d4 100644
--- a/agents/ordo-medium.md
+++ b/agents/ordo-medium.md
@@ -3 +3 @@ name: ordo-medium
-description: Ordo's agent at medium effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
+description: Ordo's agent at medium effort. The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work.
@@ -6 +6 @@ effort: medium
-You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
+You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
diff --git a/agents/ordo-xhigh.md b/agents/ordo-xhigh.md
index 7ee1442..4661166 100644
--- a/agents/ordo-xhigh.md
+++ b/agents/ordo-xhigh.md
@@ -3 +3 @@ name: ordo-xhigh
-description: Ordo's agent at xhigh effort. The plan skills launch it by name for a builder, a reviewer or a brief-check agent; it is never chosen for other work.
+description: Ordo's agent at xhigh effort. The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work.
@@ -6 +6 @@ effort: xhigh
-You are an agent that Ordo's plan skills launch: a builder, a reviewer or a brief-check agent. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
+You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, what to read first, what never to touch, and the report to write. Do the task with the tools it needs, and end with the report the prompt asks for as your final message.
diff --git a/docs/academic-coverage.md b/docs/academic-coverage.md
index a34a1d3..ec9e6f6 100644
--- a/docs/academic-coverage.md
+++ b/docs/academic-coverage.md
@@ -76 +76 @@ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/worksp
-| `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section. Of six discipline registers they keep Engineering and CS, not zh-TW conventions. |
+| `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section, held in `skills/writing/references/rules.md`. Of its six discipline registers the writing base keeps Engineering and CS, Medicine and Health, the Sciences and the Social Sciences in `skills/writing/references/registers.md`. Entry 3's rulings leave out the Humanities, Education and the zh-TW conventions (D11). |
@@ -100,2 +100,2 @@ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/worksp
-| `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer, each discipline's trusted voice and each section's "so what". Its revision decision matrix belongs with `rebuttal`. |
-| `references/writing_quality_check.md` | rebuild: writing | The writing base checks anti-patterns, among them filler terms, over three dashes, throat-clearing openers, forced triples, synonym cycling, binary contrasts and runs of equal-length sentences. Roadmap entry 3 names the dash and anti-pattern checks. |
+| `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
+| `references/writing_quality_check.md` | rebuild: writing | The writing base checks anti-patterns, among them filler terms, every em dash, throat-clearing openers, forced triples, synonym cycling, binary contrasts and runs of equal-length sentences. The prose standard holds them, and `skills/writing/SKILL.md` has its review agent read that standard. `skills/writing/references/rules.md` holds the flagged terms' alternatives and the discipline exceptions. Roadmap entry 3 names the dash and anti-pattern checks. |
diff --git a/docs/dev/scripts.md b/docs/dev/scripts.md
index 148ae34..29c8eb2 100644
--- a/docs/dev/scripts.md
+++ b/docs/dev/scripts.md
@@ -22,0 +23 @@ Every script in this repository outside `.scratch/` is listed here with its kind
+| `skills/writing/templates/docx_paragraphs.py` | Prints the text of each paragraph of a `.docx` file, numbered, with tracked insertions kept and tracked deletions and comments left out |
diff --git a/docs/glossary.md b/docs/glossary.md
index 7a370eb..ba14eaa 100644
--- a/docs/glossary.md
+++ b/docs/glossary.md
@@ -44 +44 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of `grill` as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact"; `diagnose`, "Rules".
+- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` and the review agent of `writing` as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact"; `diagnose`, "Rules"; `writing`, Steps 4 and 5.
@@ -46 +46 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item. A finding of the brief check is closed by a change to the brief, or is a stop. A finding of a landing report or a diagnosis record, named by a quoted ruling ending "(self-rule)", is the whole text under the heading the ruling names. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check"; `roadmap`, "What it reads" 6.
+- **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item. A finding of the brief check is closed by a change to the brief, or is a stop. A finding of a landing report or a diagnosis record, named by a quoted ruling ending "(self-rule)", is the whole text under the heading the ruling names. Also, for `/writing`, a passage of a draft that breaks a named rule, given with its place, the quoted passage and the rule it breaks with what that rule asks for, with no proposed replacement. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check"; `roadmap`, "What it reads" 6; `writing`, "Review agent prompt".
@@ -104 +104 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent, the diagnosis agent and the lookup agents of `grill` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
+- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent, the diagnosis agent, the lookup agents of `grill` and the review agent of `writing` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact"; `writing`, Steps 5.
diff --git a/skills/plan/SKILL.md b/skills/plan/SKILL.md
index 0e5713c..5268c59 100644
--- a/skills/plan/SKILL.md
+++ b/skills/plan/SKILL.md
@@ -5 +5 @@ metadata:
-  version: "5.0.0"
+  version: "5.0.1"
diff --git a/skills/plan/templates/orchestrator-state.md b/skills/plan/templates/orchestrator-state.md
index 8f93276..face383 100644
--- a/skills/plan/templates/orchestrator-state.md
+++ b/skills/plan/templates/orchestrator-state.md
@@ -14 +14 @@ worker: claude:<model>       # the default worker is claude:opus; a builder neve
-reviewer: claude:<model>     # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
+reviewer: claude:<model>     # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on: claude:opus by default; a reviewer never runs on Fable.
@@ -26 +26 @@ worker_effort: high          # the effort a builder runs at: low, medium, high,
-reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
+reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of /grill and the review agent of /writing run at: low, medium, high, xhigh or max.
diff --git a/skills/plan/templates/plan.yaml b/skills/plan/templates/plan.yaml
index b03795c..8e3264f 100644
--- a/skills/plan/templates/plan.yaml
+++ b/skills/plan/templates/plan.yaml
@@ -12 +12 @@ worker: claude:opus                       # required. claude:<model> of the buil
-reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
+reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on.
@@ -27 +27 @@ worker_effort: high                       # optional, default high. The effort a
-reviewer_effort: high                     # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
+reviewer_effort: high                     # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of /grill and the review agent of /writing run at: low, medium, high, xhigh or max.
diff --git a/skills/repo-setup/SKILL.md b/skills/repo-setup/SKILL.md
index 5dc344a..e0d3981 100644
--- a/skills/repo-setup/SKILL.md
+++ b/skills/repo-setup/SKILL.md
@@ -5 +5 @@ metadata:
-  version: "5.1.0"
+  version: "5.2.0"
diff --git a/skills/repo-setup/templates/docs/dev/prose-standard.md b/skills/repo-setup/templates/docs/dev/prose-standard.md
index 2fd74e1..e337388 100644
--- a/skills/repo-setup/templates/docs/dev/prose-standard.md
+++ b/skills/repo-setup/templates/docs/dev/prose-standard.md
@@ -39 +39 @@ Flagged, not banned; each use must be the most precise word rather than a defaul
-Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "When it comes to", "At the end of the day", "With that being said".
+Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
diff --git a/skills/repo-setup/templates/docs/glossary.md b/skills/repo-setup/templates/docs/glossary.md
index 8041ce9..76b3057 100644
--- a/skills/repo-setup/templates/docs/glossary.md
+++ b/skills/repo-setup/templates/docs/glossary.md
@@ -3 +3 @@
-This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
+This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `session-retro`, `writing`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
diff --git a/skills/repo-setup/templates/plan-terms.md b/skills/repo-setup/templates/plan-terms.md
index 3ebd71b..364bfaf 100644
--- a/skills/repo-setup/templates/plan-terms.md
+++ b/skills/repo-setup/templates/plan-terms.md
@@ -39 +39 @@
-- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of `grill` as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact"; `diagnose`, "Rules".
+- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` and the review agent of `writing` as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact"; `diagnose`, "Rules"; `writing`, Steps 4 and 5.
@@ -41 +41 @@
-- **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item. A finding of the brief check is closed by a change to the brief, or is a stop. A finding of a landing report or a diagnosis record, named by a quoted ruling ending "(self-rule)", is the whole text under the heading the ruling names. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check"; `roadmap`, "What it reads" 6.
+- **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item. A finding of the brief check is closed by a change to the brief, or is a stop. A finding of a landing report or a diagnosis record, named by a quoted ruling ending "(self-rule)", is the whole text under the heading the ruling names. Also, for `/writing`, a passage of a draft that breaks a named rule, given with its place, the quoted passage and the rule it breaks with what that rule asks for, with no proposed replacement. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check"; `roadmap`, "What it reads" 6; `writing`, "Review agent prompt".
@@ -99 +99 @@
-- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent, the diagnosis agent and the lookup agents of `grill` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
+- **reviewer**: the fresh session or agent that refutes a built step without changing anything. Its first run of a step runs on the model the configuration block's `reviewer:` names, and each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent, the diagnosis agent, the lookup agents of `grill` and the review agent of `writing` run on `reviewer:`. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact"; `writing`, Steps 5.
```

## Change standard rule 14: every place that names a changed name, and every sentence about a changed file as a whole

### The greps across `skills/`, `utils/`, `docs/`, `README.md`, and also `agents/` and `.agents/`

The old text of the agent definitions, "a builder, a reviewer or a brief-check agent;" (the sentence the five definitions carried before), is gone from the tree:

```
$ grep -rn -F "a builder, a reviewer or a brief-check agent;" skills utils docs README.md agents .agents; echo "exit $?"
exit 1
```

Every sentence that lists the agents that the keys `reviewer` and `reviewer_effort` cover or that the effort agents are launched for:

```
$ grep -rn -F -e 'a diagnosis agent, a lookup agent' -e 'the lookups of /grill' -e 'diagnosis agent, a lookup agent' skills utils docs README.md agents .agents | cut -c1-250
skills/plan/templates/plan.yaml:12:reviewer: claude:opus                     # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on.
skills/plan/templates/plan.yaml:27:reviewer_effort: high                     # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of /grill and the review agent of /writing run at: low, medium, high,
skills/plan/templates/orchestrator-state.md:14:reviewer: claude:<model>     # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on: claude:opus by default; a reviewer 
skills/plan/templates/orchestrator-state.md:26:reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of /grill and the review agent of /writing run at: low, medium, high, xhigh or max.
skills/repo-setup/templates/plan-terms.md:39:- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; 
docs/glossary.md:44:- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as 
agents/ordo-high.md:6:You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work,
agents/ordo-medium.md:6:You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to wor
agents/ordo-low.md:6:You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, 
agents/ordo-xhigh.md:6:You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work
agents/ordo-max.md:6:You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`. The prompt you are given holds the whole task: where to work, 
.agents/plan.yaml:10:reviewer: claude:opus                     # claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the review agent of /writing run on.
```

Each hit names `/writing` or `writing`: the two comments in `skills/plan/templates/plan.yaml` (lines 12 and 27), the two in `skills/plan/templates/orchestrator-state.md` (lines 14 and 26), the one in `.agents/plan.yaml` (line 10), the two entries of `plan-terms.md` and `docs/glossary.md`, and lines 3 and 6 of each of the five agent definitions (line 3 words the list differently and is quoted in the diff above). Three other sentences list agents and are left as they are, because each lists the agents a plan starts for a plan, and `writing` is no plan skill: `docs/glossary.md` **tiers** ("the orchestrator, and the agents it starts (builders, reviewers, brief-check agents and diagnosis agents)"), `skills/plan-orchestration/SKILL.md` lines 208 and 213, and the Stops rows of `skills/plan-orchestration/SKILL.md` and `skills/spec/SKILL.md` that name the agents a plan skill starts. The lookup agent of `grill`, which is also not started for a plan, is not in those sentences either:

```
$ grep -n -F -e '**tiers**' docs/glossary.md | cut -c1-230; grep -n -E 'the agents it starts|A builder, a reviewer, a brief-check agent or a diagnosis agent' skills/plan-orchestration/SKILL.md | cut -c1-230
129:- **tiers**: the orchestrator, and the agents it starts (builders, reviewers, brief-check agents and diagnosis agents), each on the model the section names. Stated in: `plan-orchestration`, "The two tiers, and the models".
208:- Two tiers take part: the orchestrator, and the agents it starts (the builders, the reviewers, the brief-check agents and the diagnosis agents).
213:- **Agents.** A builder, a reviewer, a brief-check agent or a diagnosis agent runs on a Claude model, and never on Claude Fable.
```

The versions raised: `skills/repo-setup/SKILL.md` 5.1.0 to 5.2.0 and `skills/plan/SKILL.md` 5.0.0 to 5.0.1. The string of the old versions is not cited elsewhere in the tree as a version of those two skills (the hits for 5.1.0 and 5.0.0 outside the two files are `skills/land/SKILL.md` and `skills/refute/SKILL.md`, which are other skills at 5.0.0, and two lines of `docs/roadmap.md` that record plan-orchestration 5.0.0 at an earlier closing):

```
$ grep -rn -F -e '5.1.0' -e '5.0.0' skills utils docs README.md agents .agents | cut -c1-150
skills/land/SKILL.md:5:  version: "5.0.0"
skills/refute/SKILL.md:5:  version: "5.0.0"
docs/roadmap.md:207:- [x] 2.I. Several plans in one session: at the closing on main (812d4f3), `plan-orchestration` 5.0.0 runs every open plan in one 
docs/roadmap.md:208:- [x] 2.K. The skill-text fixes from the retro and the real run: at the closing on main (6595ff3), the change standards, the share
```

The prose standard's section C list gained two openers; the same list exists nowhere else (`grep -rn -F "In the realm of"` over the same paths):

```
$ grep -rn -F "In the realm of" skills utils docs README.md agents .agents | cut -c1-110
skills/repo-setup/templates/docs/dev/prose-standard.md:39:Delete the opener rather than rewriting it: "In the 
```

The skill list: the other places that list every skill are the README table, the README `for skill in` line and `docs/dev/scripts.md`; `skills/ordo-help/SKILL.md` lists the commands of the plan sequence (it names `/repo-setup`, `/ordo-init`, `/roadmap`, `/grill` and `/session-retro`), and `docs/figures/gen_figures.py` draws that sequence. `/writing` is a command outside that sequence, so neither is changed.

### Sentences about a changed file as a whole, reread

- `docs/dev/scripts.md` line 3: "Every script in this repository outside `.scratch/` is listed here with its kind and its job." The tracked and new scripts outside `.scratch/` and the paths of the first column of its three tables are the same set:

```
$ (git ls-files; git ls-files --others --exclude-standard) | grep -E '\.(py|sh)$' | grep -v '^.scratch' | sort > tree.txt; wc -l < tree.txt
14
$ awk -F'|' '/^\| `/{print $2}' docs/dev/scripts.md | tr -d ' `' | sort > table.txt; wc -l < table.txt; diff tree.txt table.txt; echo "exit $?"
14
exit 0
```

(The tests table's second column names the script each test proves; only the first column is compared.)

- `skills/writing/templates/docx_paragraphs.py` head comment, each claim with the line of the code that shows it (`grep -n` on the file; the head comment is lines 2 to 33):

| Claim of the head comment | Line that shows it |
|---|---|
| Reads `word/document.xml` (must be present), then `word/footnotes.xml` and `word/endnotes.xml` when present | line 48 `PARTS = (...)`, lines 107 to 109 (absent document.xml raises "no word/document.xml"; the other two are read only `if name in names`) |
| Headers, footers and `word/comments.xml` are not read | line 48: `PARTS` names three parts only, and line 109 reads only those |
| Every `w:p` of each part in document order, those in table cells and content controls included | lines 77 to 85 `paragraphs_in` recurses into every child that is not dropped, and lines 88 to 92 `with_nested`; the NWO XS table cell is printed as line 14 and the HexC content controls print in line 105 (cases above) |
| The text of every `w:t`, those inside `w:ins`, `w:moveTo`, `w:hyperlink`, `w:sdt` and `w:smartTag` included | lines 63 to 74 `collect`: a `w:t` appends its text (lines 69 and 70) and any other non-dropped child is entered (lines 73 and 74) |
| `w:delText` and `w:instrText` are not part of the text | line 44 `TEXT = W + "t"`; lines 69 and 70 append the text of that tag only |
| Every `w:t` inside `w:moveFrom`, and the `mc:Fallback` copy | line 46 `DROPPED`, tested at lines 65 and 66 and at lines 80 and 81 |
| A `w:tab` or `w:br` inside a `w:r` becomes one space; a tab-stop definition adds nothing | line 45 `SPACE_TAGS`, lines 71 and 72 (`element.tag == RUN`); the NWO XS line 3 and lines 5 to 8 (cases above) |
| A `w:p` inside a text box is printed once after its holder, not part of the outer text | lines 67 and 68 collect it into `nested`, lines 88 to 92 `with_nested` yield the holder first, then each nested paragraph |
| A paragraph whose text is empty or only spaces is not printed and takes no number | line 118 `if text.strip(" ") != ""`, and the number is `len(lines) + 1` at line 119 |
| Numbering across the three parts, `<n> [part]: <text>` outside the body | lines 116 and 119 |
| Printed as UTF-8 whatever the locale | line 132 `sys.stdout.reconfigure(encoding="utf-8")` |
| The usage line for no argument or more than one | lines 124 to 126, run with no argument and with `a b` (cases above) |
| `error:` for a file that cannot be opened (the operating system's reason), a file that is not a zip, a zip without `word/document.xml`, a part not well-formed XML | lines 110 and 111 (cannot be opened), 112 and 113 (not a zip), 107 and 108 (no document.xml) and 98 and 99 (not well-formed); the five error runs above |
| Exit status 0, 1 on an `error:` line, 2 on the usage line | lines 126, 131, 135 |

The numbering check over the five outputs, `awk` on the first number of every line against a running count (0 lines out of sequence in each):

```
nwo: 55 lines, 55 numbered in sequence, 0 out of sequence
hexc2: 202 lines, 202 numbered in sequence, 0 out of sequence
mvh3: 367 lines, 367 numbered in sequence, 0 out of sequence
thesis2: 36 lines, 36 numbered in sequence, 0 out of sequence
veni2: 243 lines, 243 numbered in sequence, 0 out of sequence
```

## Verify 5: new and changed list items and sentences against the standards' rules

The pages read are `docs/dev/skill-layout.md` "Lists and tables" (one rule per bullet, a bullet is one sentence where it can be, a qualifier stays with its rule, a numbered list means order, a table is used for three or more items with the same attributes, a cell holds a phrase or a sentence) and the prose standard section E "Sentence length" (under roughly 20 words unless the mechanism needs more). The sentences counted are those of the new `skills/writing/` pages (all of them) and the sentences on the added lines of `git diff -U0` (all of them). The words of every sentence were counted by whitespace (headings, code blocks and separator rows skipped, table cells counted one by one, a sentence ended at ". " before a capital letter, a backtick, a quote or a bracket). The new pages hold 26 sentences of more than 20 words. The added lines of the other files hold the sentences below; each is a definition, an enumeration or a table cell that extends a sentence or a row that already enumerated the same kinds, so that the reader finds the one list in the one place:

- The five agent definitions, line 3 (37 words) and line 6 (29 words), now list six kinds of agent.
- The comments of `skills/plan/templates/plan.yaml` (lines 12 and 27), `skills/plan/templates/orchestrator-state.md` (lines 14 and 26) and `.agents/plan.yaml` (line 10), 27 to 37 words each: one-line comments that list the agents a key covers.
- `plan-terms.md` and `docs/glossary.md`: the **finding** sense (35 words), the **effort agent** entry (57 words) and the **reviewer** entry (35 words), definitions that enumerate cases; `skills/repo-setup/templates/docs/glossary.md` line 3 (49 words), the list of skills whose terms stand in the block.
- `README.md`: the `writing` table row (two sentences of 27 words, a table cell) and line 77 (23 words).
- `docs/academic-coverage.md` rows 76, 100 and 101: reason cells of 21 to 26 words per sentence, within the about 35 words the prose standard section E allows in the reason cell of a coverage table.
- `docs/dev/scripts.md`: the job cell of the script row (22 words).
- `skills/repo-setup/templates/docs/dev/prose-standard.md` line 39 (65 words): the list of quoted openers, to which two openers are added.

The 26, each with the reason it keeps its form:

- `SKILL.md` line 3 (three sentences, 30, 32 and 36 words): the frontmatter description is one paragraph by the layout, and says what the skill does, what it produces and the trigger phrases; the 36-word one is the list of trigger phrases, which the layout asks for in full.
- `SKILL.md` Steps 4, 5, 6 and 7 and their sub-bullets (lines 60, 63, 64, 66, 67, 69 and 70; 21 to 28 words): each is one action with its parameters (an agent name, a key, a path list) or a completion criterion that names two states, and a split would separate a parameter from the action it belongs to.
- `SKILL.md` line 76, the introduction of the prompt (27 words): it states which bullets the prompt is made of and the choice between the two bullets that begin "For a".
- `SKILL.md` prompt bullets (lines 83, 84, 86, 91, 92, 93, 96, 97, 100 and 101; 22 to 33 words): each states one rule with its condition or qualifier in the same bullet, as the layout says. Lines 83 and 84 are the two fixed command lists of the ruling D1 (the only commands the agent may run), line 92 is the three parts a finding gives, line 93 lists the three forms of a place, and line 96 and line 100 each add the one qualifier D30 and D29 give to their rule.
- `SKILL.md` Stops rows (lines 115 and 116; 22 and 28 words): the "When" cells state a condition with its alternatives, each a cell as the layout allows.
- `SKILL.md` line 127, the one Rules bullet (24 words): one rule with the reason that fixes it, in one clause.
- `registers.md` lines 15 and 69 (21 and 22 words): the quoted examples of the source, carried whole.

Bullets that join requirements with "and" and are kept as one bullet because the layout's test (each can be broken while the other holds) is not met, or the bullet is the one rule with its qualifier: the prompt bullets "Edit no file, start no agent and invoke no skill" (the one prohibition D1 and ADR 0003 state as one clause), "Review the draft against the rules named here and report each place where it breaks one", "Order the groups as the rules stand: ..., and rank no group by consequence" (the ranking prohibition is the qualifier of the order), "A passage that breaks two rules stands once, ..., and its finding names the other rule on a line of its own", "Before the final message, check once that each quoted passage stands at the place given, and correct the place where it does not" and "For a flagged term of the prose standard's section A, ..., and the finding lists no alternative word". Each of these is a bullet of its own: the `.tex` one-document rule, the `.docx` rule that a part outside the body is in square brackets, and the sub-bullets of Steps 3, 5, 6 and 7.

Tables: the Use instead table (three rows, two columns), the Stops table (six rows, four columns) and the Anti-patterns table (two rows, three columns) follow the layout's sections; the tables of `rules.md` (hedging scale, no-hedge pairs, transitions, wordy phrases, vague phrases, tense, so-what, flagged terms) each hold three or more rows with the same attributes; the two lists of `rules.md` (the four sorts of claim, the four questions) are an unordered set and an ordered set respectively (the four questions are numbered because the source numbers them and each is answered by a different part of the paper).

## The three records of item 7 (change standard rule 18)

Each record is one block per source line, in source order: the source line quoted (`source <file>:<line>:`), then each place that states it, quoted (`place <file>:<line>:`, the place's own file and line), then a note. A source line that states no rule (a title, a heading, a table separator, a code fence, a rationale line) has `place: none`. A rule left out or held elsewhere names the ruling or the coverage row that does it as its place. A character outside ASCII in a source line is written by name in angle brackets. The quoted place lines are read from the files by `sed -n <line>p`; the line numbers are those of the files on the final tree.

The place files are `skills/writing/references/rules.md` (`rules.md`), `skills/writing/references/registers.md` (`registers.md`), `skills/repo-setup/templates/docs/dev/prose-standard.md` (`prose-standard.md`), `skills/writing/SKILL.md` (`SKILL.md`), `docs/academic-coverage.md`, `.scratch/3-the-writing-base/plan.md` (`plan.md`, the Rulings) and `docs/adr/0002-...md`, `docs/adr/0003-...md`.

The agents the first source's line 3 names, against the agents of this tree:

```
$ ls agents
ordo-high.md
ordo-low.md
ordo-max.md
ordo-medium.md
ordo-xhigh.md
```

Completeness: every non-blank line of each source file has a block (non-blank lines by `awk 'NF' <file> | wc -l`, blocks by `grep -c '^source <file>:'`, and the lines in the first list but not the second by `comm`):

```
$ academic_writing_style.md: non-blank lines, blocks, lines without a block
152 152 []
$ writing_judgment_framework.md: non-blank lines, blocks, lines without a block
42 42 []
$ writing_quality_check.md: non-blank lines, blocks, lines without a block
131 131 []
```

### Record 1: references/academic_writing_style.md (188 lines)

```
source academic_writing_style.md:1: # Academic Writing Style Guide
  place: none
  note: title
source academic_writing_style.md:3: Used by `draft_writer_agent` and `peer_reviewer_agent`.
  place briefs/1.md:71: the line "Used by `draft_writer_agent` and `peer_reviewer_agent`", which names agents Ordo does not have
  note: the line names agents Ordo does not have (see ls agents above)
source academic_writing_style.md:5: ## Core Principles
  place: none
  note: heading
source academic_writing_style.md:7: ### 1. Precision
  place: none
  note: heading
source academic_writing_style.md:8: - Use the most specific term available
  place rules.md:9: A passage names each thing with the most specific term the field has for it.
source academic_writing_style.md:9: - Define technical terms on first use
  place rules.md:13: A technical term is defined where it first appears.
source academic_writing_style.md:10: - Avoid ambiguous pronouns ("this," "it") without clear antecedents
  place rules.md:17: A pronoun such as "this" or "it" has one clear antecedent in its own sentence or the sentence before. A paragraph that opens with a pronoun that has no antecedent falls under the prose standard, section E, "Cold opens".
source academic_writing_style.md:12: ### 2. Conciseness
  place: none
  note: heading
source academic_writing_style.md:13: - Eliminate filler words and redundant phrases
  place prose-standard.md:24: Banned as filler; cut or replace with the concrete fact: easy, simple, quick, very, really, just (as a softener; temporal "just" and genuine minimality claims stay), simply.
  place rules.md:110: A wordy phrase is replaced with its concise form. The prose standard, section C, holds "in order to".
  note: filler words are held by the prose standard section A; redundant phrases by Wordy phrase
source academic_writing_style.md:14: - One idea per sentence (or clearly connected ideas)
  place rules.md:23: A sentence carries one idea, or clearly connected ideas.
  place plan.md:48: - D21 Formality and one idea per sentence (2026-09-30): (a) the academic page carries, for manuscripts and grants, full forms over contractions, no colloquial words, and one idea per sentence, each reported by the review; the lazy option was (c), leaving them out (the user).
  note: carried for manuscripts and grants (D21)
source academic_writing_style.md:15: - Prefer short sentences for complex ideas
  place prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
  note: held by the prose standard section E on sentence length
source academic_writing_style.md:17: ### 3. Objectivity
  place: none
  note: heading
source academic_writing_style.md:18: - Base claims on evidence, not opinion
  place rules.md:29: A claim rests on evidence, not on opinion.
source academic_writing_style.md:19: - Use hedging for uncertain claims
  place rules.md:49: A claim carries the hedge its evidence supports. A weak device fits a claim the evidence only suggests. A moderate device fits a trend the data show. A strong device fits a link the evidence establishes.
  place rules.md:59: A claim of one of these four sorts is hedged:
  note: the hedging scale and the four sorts of claim that are hedged
source academic_writing_style.md:20: - Acknowledge limitations and alternative interpretations
  place rules.md:33: A passage that draws a conclusion acknowledges the limitations of the study and the alternative interpretations of the result.
source academic_writing_style.md:22: ### 4. Formality
  place: none
  note: heading
source academic_writing_style.md:23: - Use full forms ("do not" over "don't")
  place rules.md:39: A contraction is written out: "do not" for "don't".
  note: carried for manuscripts and grants (D21)
source academic_writing_style.md:24: - Use formal academic vocabulary; reserve colloquialisms and slang for informal writing
  place rules.md:43: The vocabulary is formal and academic. A colloquialism or a slang word belongs to informal writing.
  note: carried for manuscripts and grants (D21)
source academic_writing_style.md:25: - Use third person unless discipline conventions allow first person
  place plan.md:45: - D18 How each field's voice applies under the prose standard, replacing D12 (2026-09-30): (a) the prose standard's actor test, each kept register saying where the actor is irrelevant: in Sciences, Engineering/CS and Medicine/Health a procedure takes the passive and the authors' decisions, contributions and findings take "we"; in Social Sciences the researcher's decisions take "we" and a procedure the passive where the participants or the instrument matter; never the third person for the authors; a venue's author guidelines, when the project names the venue, hold over this rule; the lazy option was (c), the registers' voice lines copied (the user).
  place registers.md:19: A procedure takes the passive, since its actor is irrelevant. The authors' decisions, contributions and results take "we". The authors never refer to themselves in the third person.
  place registers.md:37: The researcher's decisions take "we". A procedure takes the passive where the participants or the instrument matter. The authors never refer to themselves in the third person.
  note: replaced by the voice rule D18 sets in each register
source academic_writing_style.md:27: ## Register Adjustment by Discipline
  place: none
  note: heading
source academic_writing_style.md:29: ### Sciences (Natural, Applied)
  place: none
  note: heading
source academic_writing_style.md:30: ```
  place: none
  note: code fence
source academic_writing_style.md:31: Register: Formal, impersonal, method-focused
  place registers.md:11: The text is formal, impersonal and focused on the method.
source academic_writing_style.md:32: Voice: Passive voice common ("was measured," "were analyzed")
  place registers.md:19: A procedure takes the passive, since its actor is irrelevant. The authors' decisions, contributions and results take "we". The authors never refer to themselves in the third person.
  note: voice under D18
source academic_writing_style.md:33: Terminology: Precise measurements, SI units, statistical notation
  place registers.md:15: Measurements are precise and in SI units, and statistics use statistical notation. Example: "The sample was heated to 350 degrees Celsius for 2 hours, yielding a conversion rate of 87.3% (SD = 2.1)."
source academic_writing_style.md:34: Example: "The sample was heated to 350<degree sign>C for 2 hours, yielding a conversion rate of 87.3% (SD = 2.1)."
  place registers.md:15: Measurements are precise and in SI units, and statistics use statistical notation. Example: "The sample was heated to 350 degrees Celsius for 2 hours, yielding a conversion rate of 87.3% (SD = 2.1)."
  note: the example is carried with the ASCII form of the unit
source academic_writing_style.md:35: ```
  place: none
  note: code fence
source academic_writing_style.md:37: ### Social Sciences
  place: none
  note: heading
source academic_writing_style.md:38: ```
  place: none
  note: code fence
source academic_writing_style.md:39: Register: Formal, theory-informed, participant-aware
  place registers.md:29: The text is formal, informed by theory and aware of its participants.
source academic_writing_style.md:40: Voice: Active voice encouraged, first person for researcher decisions
  place registers.md:37: The researcher's decisions take "we". A procedure takes the passive where the participants or the instrument matter. The authors never refer to themselves in the third person.
  note: voice under D18
source academic_writing_style.md:41: Terminology: Theoretical constructs, operationalized variables
  place registers.md:33: Theoretical constructs are named and variables are operationalized. Example: "We employed semi-structured interviews to explore how participants understood institutional change (N = 24)."
source academic_writing_style.md:42: Example: "We employed semi-structured interviews to explore how participants understood institutional change (N = 24)."
  place registers.md:33: Theoretical constructs are named and variables are operationalized. Example: "We employed semi-structured interviews to explore how participants understood institutional change (N = 24)."
source academic_writing_style.md:43: ```
  place: none
  note: code fence
source academic_writing_style.md:45: ### Humanities
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  place academic-coverage.md:76: | `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section, held in `skills/writing/references/rules.md`. Of its six discipline registers the writing base keeps Engineering and CS, Medicine and Health, the Sciences and the Social Sciences in `skills/writing/references/registers.md`. Entry 3's rulings leave out the Humanities, Education and the zh-TW conventions (D11). |
  note: Humanities left out (D11)
source academic_writing_style.md:46: ```
  place: none
  note: code fence
source academic_writing_style.md:47: Register: Formal, argument-driven, interpretive
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Humanities left out (D11)
source academic_writing_style.md:48: Voice: First person acceptable for arguments, active voice
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Humanities left out (D11)
source academic_writing_style.md:49: Terminology: Close reading vocabulary, theoretical language
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Humanities left out (D11)
source academic_writing_style.md:50: Example: "I argue that the text's spatial metaphors reveal an underlying anxiety about institutional permanence."
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Humanities left out (D11)
source academic_writing_style.md:51: ```
  place: none
  note: code fence
source academic_writing_style.md:53: ### Engineering / CS
  place: none
  note: heading
source academic_writing_style.md:54: ```
  place: none
  note: code fence
source academic_writing_style.md:55: Register: Formal, problem-solution oriented, specification-precise
  place registers.md:47: The text is formal, oriented to the problem and its solution, and precise about specifications.
source academic_writing_style.md:56: Voice: Passive common for methods, active for contributions
  place registers.md:55: A procedure takes the passive, since its actor is irrelevant. The authors' decisions, contributions and results take "we". The authors never refer to themselves in the third person.
  note: voice under D18
source academic_writing_style.md:57: Terminology: Technical specifications, performance metrics
  place registers.md:51: Technical specifications and performance metrics are stated. Example: "The proposed algorithm achieves O(n log n) complexity, outperforming the baseline by 34% on the benchmark dataset."
source academic_writing_style.md:58: Example: "The proposed algorithm achieves O(n log n) complexity, outperforming the baseline by 34% on the benchmark dataset."
  place registers.md:51: Technical specifications and performance metrics are stated. Example: "The proposed algorithm achieves O(n log n) complexity, outperforming the baseline by 34% on the benchmark dataset."
source academic_writing_style.md:59: ```
  place: none
  note: code fence
source academic_writing_style.md:61: ### Education
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  place academic-coverage.md:76: | `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section, held in `skills/writing/references/rules.md`. Of its six discipline registers the writing base keeps Engineering and CS, Medicine and Health, the Sciences and the Social Sciences in `skills/writing/references/registers.md`. Entry 3's rulings leave out the Humanities, Education and the zh-TW conventions (D11). |
  note: Education left out (D11)
source academic_writing_style.md:62: ```
  place: none
  note: code fence
source academic_writing_style.md:63: Register: Formal, practice-oriented, stakeholder-aware
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Education left out (D11)
source academic_writing_style.md:64: Voice: Active voice, first person for reflexive practice
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Education left out (D11)
source academic_writing_style.md:65: Terminology: Pedagogical concepts, assessment language
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Education left out (D11)
source academic_writing_style.md:66: Example: "The intervention improved student metacognitive awareness, as evidenced by a significant increase in self-regulation scores (t(45) = 3.21, p = .002, d = 0.72)."
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Education left out (D11)
source academic_writing_style.md:67: ```
  place: none
  note: code fence
source academic_writing_style.md:69: ### Medicine / Health
  place: none
  note: heading
source academic_writing_style.md:70: ```
  place: none
  note: code fence
source academic_writing_style.md:71: Register: Formal, evidence-hierarchy conscious, clinical precision
  place registers.md:65: The text is formal, conscious of the evidence hierarchy and clinically precise.
source academic_writing_style.md:72: Voice: Passive for methods, active for findings
  place registers.md:73: A procedure takes the passive, since its actor is irrelevant. The authors' decisions, contributions and results take "we". The authors never refer to themselves in the third person.
  note: voice under D18
source academic_writing_style.md:73: Terminology: Clinical terms, diagnostic criteria, statistical reporting
  place registers.md:69: Clinical terms, diagnostic criteria and statistical reporting are used as the field defines them. Example: "Patients receiving the intervention showed a 40% reduction in readmission rates (RR = 0.60, 95% CI [0.45, 0.80], p = .001)."
source academic_writing_style.md:74: Example: "Patients receiving the intervention showed a 40% reduction in readmission rates (RR = 0.60, 95% CI [0.45, 0.80], p = .001)."
  place registers.md:69: Clinical terms, diagnostic criteria and statistical reporting are used as the field defines them. Example: "Patients receiving the intervention showed a 40% reduction in readmission rates (RR = 0.60, 95% CI [0.45, 0.80], p = .001)."
source academic_writing_style.md:75: ```
  place: none
  note: code fence
source academic_writing_style.md:77: ## Hedging and Strength Language
  place: none
  note: heading
source academic_writing_style.md:79: ### Hedging (for uncertain or qualified claims)
  place: none
  note: heading
source academic_writing_style.md:80: | Strength | Hedging Devices | Example |
  place rules.md:51: | Strength | Hedging devices | Example |
  note: table header of the hedging scale
source academic_writing_style.md:81: |----------|----------------|---------|
  place: none
  note: table separator
source academic_writing_style.md:82: | Weak | may, might, could, possibly | "This may suggest a correlation." |
  place rules.md:53: | Weak | may, might, could, possibly | "This may suggest a correlation." |
source academic_writing_style.md:83: | Moderate | suggests, indicates, appears | "The data suggest a positive trend." |
  place rules.md:54: | Moderate | suggests, indicates, appears | "The data suggest a positive trend." |
source academic_writing_style.md:84: | Strong | demonstrates, establishes, confirms | "The evidence demonstrates a clear link." |
  place rules.md:55: | Strong | demonstrates, establishes, confirms | "The evidence demonstrates a clear link." |
source academic_writing_style.md:86: ### When to Hedge
  place: none
  note: heading
source academic_writing_style.md:87: - Results that need replication
  place rules.md:61: - A result that needs replication.
source academic_writing_style.md:88: - Causal claims from correlational data
  place rules.md:62: - A causal claim from correlational data.
source academic_writing_style.md:89: - Generalizations from limited samples
  place rules.md:63: - A generalization from a limited sample.
source academic_writing_style.md:90: - Interpretations with alternative explanations
  place rules.md:64: - An interpretation with alternative explanations.
source academic_writing_style.md:92: ### When NOT to Hedge
  place: none
  note: heading
source academic_writing_style.md:93: - Reporting factual data: "The response rate was 78%." (not "appeared to be")
  place rules.md:72: | "The response rate appeared to be 78%." | "The response rate was 78%." |
  place rules.md:68: Reported data, the description of a method and a well-established fact are stated without a hedge.
source academic_writing_style.md:94: - Describing methodology: "We used thematic analysis." (not "we attempted to use")
  place rules.md:73: | "We attempted to use thematic analysis." | "We used thematic analysis." |
  place rules.md:68: Reported data, the description of a method and a well-established fact are stated without a hedge.
source academic_writing_style.md:95: - Well-established facts: "Earth orbits the Sun." (not "may orbit")
  place rules.md:74: | "The Earth may orbit the Sun." | "The Earth orbits the Sun." |
  place rules.md:68: Reported data, the description of a method and a well-established fact are stated without a hedge.
source academic_writing_style.md:97: ## Transition Words and Phrases
  place: none
  note: heading
source academic_writing_style.md:99: ### Addition
  place: none
  note: heading
source academic_writing_style.md:100: moreover, furthermore, in addition, additionally, similarly, likewise
  place rules.md:84: | Addition | moreover, furthermore, in addition, additionally, similarly, likewise |
source academic_writing_style.md:102: ### Contrast
  place: none
  note: heading
source academic_writing_style.md:103: however, nevertheless, in contrast, on the other hand, conversely, whereas
  place rules.md:85: | Contrast | however, nevertheless, in contrast, on the other hand, conversely, whereas |
source academic_writing_style.md:105: ### Cause/Effect
  place: none
  note: heading
source academic_writing_style.md:106: therefore, consequently, as a result, thus, hence, accordingly
  place rules.md:86: | Cause and effect | therefore, consequently, as a result, thus, hence, accordingly |
source academic_writing_style.md:108: ### Example
  place: none
  note: heading
source academic_writing_style.md:109: for example, for instance, specifically, in particular, such as, namely
  place rules.md:87: | Example | for example, for instance, specifically, in particular, such as, namely |
source academic_writing_style.md:111: ### Sequence
  place: none
  note: heading
source academic_writing_style.md:112: first, second, third, subsequently, finally, meanwhile
  place rules.md:88: | Sequence | first, second, third, subsequently, finally, meanwhile |
source academic_writing_style.md:114: ### Summary
  place: none
  note: heading
source academic_writing_style.md:115: in summary, to conclude, overall, taken together, in short
  place rules.md:89: | Summary | in summary, to conclude, overall, taken together, in short |
source academic_writing_style.md:117: ### Concession
  place: none
  note: heading
source academic_writing_style.md:118: although, despite, while, granted that, notwithstanding
  place rules.md:90: | Concession | although, despite, while, granted that, notwithstanding |
source academic_writing_style.md:120: ## Paragraph Construction
  place: none
  note: heading
source academic_writing_style.md:122: ### Standard Academic Paragraph (TEEL)
  place: none
  note: heading
source academic_writing_style.md:123: 1. **T**opic sentence <em dash> states the paragraph's main point
  place rules.md:96: A paragraph's first sentence states the paragraph's main point.
  note: first part of the paragraph shape, carried as a rule (D14)
source academic_writing_style.md:124: 2. **E**vidence <em dash> data, citations, examples that support the point
  place rules.md:100: A claim in a paragraph is followed by the data, the citation or the example that supports it.
  note: second part, carried as a rule (D14)
source academic_writing_style.md:125: 3. **E**xplanation <em dash> interpret the evidence, connect to argument
  place rules.md:104: Evidence in a paragraph is followed by an interpretation that connects it to the paragraph's claim.
  note: third part, carried as a rule (D19)
source academic_writing_style.md:126: 4. **L**ink <em dash> connect to the next paragraph or back to thesis
  place plan.md:46: - D19 The third part of TEEL, the explanation (2026-09-30): (a) carried as a third rule: evidence not followed by what it means for the paragraph's claim is reported; the link part is not carried, since it is a sentence describing what comes next or a restating close; the lazy option was (b), the two rules of D14 only (the user).
  note: the link part is not carried (D19)
source academic_writing_style.md:128: ### Example
  place: none
  note: heading
source academic_writing_style.md:129: > **[T]** AI-assisted quality assurance has shown promise in improving evaluation consistency across institutions. **[E]** Smith (2024) found that institutions using AI tools reported a 23% reduction in inter-rater variance, while Chen and Wang (2023) documented improved agreement on scoring rubrics (<kappa> = 0.82 vs. 0.64). **[E]** These findings suggest that algorithmic assistance can mitigate the subjective biases inherent in human evaluation, particularly when assessors have varying levels of experience. **[L]** However, the reliance on AI tools also raises concerns about the loss of contextual judgment, which the following section addresses.
  place plan.md:46: - D19 The third part of TEEL, the explanation (2026-09-30): (a) carried as a third rule: evidence not followed by what it means for the paragraph's claim is reported; the link part is not carried, since it is a sentence describing what comes next or a restating close; the lazy option was (b), the two rules of D14 only (the user).
  note: the example paragraph is not carried; its link sentence is the part D19 leaves out and the prose standard section C bans
source academic_writing_style.md:131: ## Common Style Errors
  place: none
  note: heading
source academic_writing_style.md:133: ### Wordiness
  place: none
  note: heading
source academic_writing_style.md:134: | Wordy | Concise |
  place rules.md:112: | Wordy | Concise |
  note: table header of the wordy phrases
source academic_writing_style.md:135: |-------|---------|
  place: none
  note: table separator
source academic_writing_style.md:136: | in order to | to |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
  place rules.md:110: A wordy phrase is replaced with its concise form. The prose standard, section C, holds "in order to".
  note: "in order to" is held by the prose standard section C
source academic_writing_style.md:137: | due to the fact that | because |
  place rules.md:114: | due to the fact that | because |
source academic_writing_style.md:138: | a large number of | many |
  place rules.md:115: | a large number of | the stated number |
  note: "many" is replaced by the stated number, as the prose standard section A says (D13)
source academic_writing_style.md:139: | at the present time | currently / now |
  place rules.md:116: | at the present time | currently, now |
source academic_writing_style.md:140: | it is important to note that | notably |
  place rules.md:117: | it is important to note that | the phrase deleted |
  note: "notably" is not carried; the phrase is deleted (D13)
source academic_writing_style.md:141: | in the event that | if |
  place rules.md:118: | in the event that | if |
source academic_writing_style.md:142: | has the ability to | can |
  place rules.md:119: | has the ability to | can |
source academic_writing_style.md:143: | with regard to | regarding / about |
  place rules.md:120: | with regard to | regarding, about |
source academic_writing_style.md:144: | in spite of the fact that | despite / although |
  place rules.md:121: | in spite of the fact that | despite, although |
source academic_writing_style.md:145: | conduct an investigation of | investigate |
  place rules.md:122: | conduct an investigation of | investigate |
source academic_writing_style.md:147: ### Vague Language
  place: none
  note: heading
source academic_writing_style.md:148: | Vague | Precise |
  place rules.md:128: | Vague | Specific |
  note: table header of the vague phrases
source academic_writing_style.md:149: |-------|---------|
  place: none
  note: table separator
source academic_writing_style.md:150: | "many studies" | "several studies (e.g., Chen, 2023; Smith, 2024)" |
  place rules.md:130: | "many studies" | "several studies (e.g., Chen, 2023; Smith, 2024)" |
source academic_writing_style.md:151: | "a significant impact" | "a 23% increase in retention rates" |
  place rules.md:131: | "a significant impact" | "a 23% increase in retention rates" |
source academic_writing_style.md:152: | "in recent years" | "since 2020" or "over the past five years" |
  place rules.md:132: | "in recent years" | "since 2020" or "over the past five years" |
source academic_writing_style.md:153: | "some researchers" | Name them with citations |
  place rules.md:133: | "some researchers" | the researchers named, with citations |
source academic_writing_style.md:154: | "it is well known that" | Cite the source or remove |
  place rules.md:134: | "it is well known that" | the source cited, or the phrase removed |
source academic_writing_style.md:156: ### Tense Usage
  place: none
  note: heading
source academic_writing_style.md:157: | Section | Tense | Example |
  place rules.md:140: | Section | Tense | Example |
  note: table header of the tenses
source academic_writing_style.md:158: |---------|-------|---------|
  place: none
  note: table separator
source academic_writing_style.md:159: | Literature review (reporting findings) | Past | "Smith (2024) found that..." |
  place rules.md:142: | Literature review, reporting results | Past | "Smith (2024) found that..." |
  note: "findings" is written "results" (glossary term finding)
source academic_writing_style.md:160: | Literature review (ongoing state) | Present | "The theory posits that..." |
  place rules.md:143: | Literature review, ongoing state | Present | "The theory posits that..." |
source academic_writing_style.md:161: | Methodology | Past | "Data were collected through..." |
  place rules.md:144: | Methodology | Past | "Data were collected through..." |
source academic_writing_style.md:162: | Results | Past | "The analysis revealed..." |
  place rules.md:145: | Results | Past | "The analysis revealed..." |
source academic_writing_style.md:163: | Discussion (interpreting) | Present | "These findings suggest..." |
  place rules.md:146: | Discussion, interpreting | Present | "These results suggest that..." |
  note: "findings" is written "results" (glossary term finding)
source academic_writing_style.md:164: | Conclusion (implications) | Present/Future | "This has implications for... / Future research should..." |
  place rules.md:147: | Conclusion, implications | Present or future | "This has implications for..." or "Future research should..." |
source academic_writing_style.md:166: ## Chinese Academic Writing (zh-TW) Conventions
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  place academic-coverage.md:76: | `references/academic_writing_style.md` | rebuild: writing | The writing skills share its prose rules, among them terms defined at first use, clear antecedents, a hedging scale and tense per section, held in `skills/writing/references/rules.md`. Of its six discipline registers the writing base keeps Engineering and CS, Medicine and Health, the Sciences and the Social Sciences in `skills/writing/references/registers.md`. Entry 3's rulings leave out the Humanities, Education and the zh-TW conventions (D11). |
  note: Chinese conventions left out (D11)
source academic_writing_style.md:168: ### Register
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:169: - Use written/formal language; avoid colloquial expressions
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:170: - Prefer active voice (Chinese rarely uses passive)
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:171: - Mainly short sentences; avoid overly long subordinate clauses
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:172: - Use "this study" (ben yan jiu) rather than "we" (wo men)
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:174: ### Common Academic Expressions
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:175: | English | Romanized Chinese |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:176: |------|------|
  place: none
  note: table separator
source academic_writing_style.md:177: | This study aims to | Ben Yan Jiu Zhi Zai |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:178: | The findings indicate | Yan Jiu Jie Guo Xian Shi |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:179: | It is worth noting | Zhi De Zhu Yi De Shi |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:180: | In conclusion | Zong Shang Suo Shu |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:181: | Based on the above analysis | Gen Ju Shang Shu Fen Xi |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:182: | Further research is needed | Wei Lai Yan Jiu Ke Jin Yi Bu Tan Tao |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:184: ### Avoiding Translationese
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:185: - Incorrect: "was found to be" (bei fa xian shi) <right arrow> Correct: "Results show" (jie guo xian shi)
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:186: - Incorrect: "This is because" (zhe shi yin wei) <right arrow> Correct: "The reason lies in" (yuan yin zai yu)
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:187: - Incorrect: "In the aspect of..." (zai...fang mian) <right arrow> Correct: State directly
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
source academic_writing_style.md:188: - Incorrect: "It is worth being pointed out that" (zhi de bei zhi chu de shi) <right arrow> Correct: "It is worth noting that" (zhi de zhu yi de shi)
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: zh-TW left out (D11)
```

### Record 2: references/writing_judgment_framework.md (59 lines)

```
source writing_judgment_framework.md:1: # Writing Judgment Framework
  place: none
  note: title
source writing_judgment_framework.md:3: A cognitive framework for making writing decisions. Complements the procedural `writing_quality_check.md` with judgment heuristics.
  place: none
  note: introduction; it states no rule and names writing_quality_check.md, the third record
source writing_judgment_framework.md:5: ## The Clarity Test
  place: none
  note: heading
source writing_judgment_framework.md:7: For every paragraph, ask: "If I remove this paragraph, does the paper still make sense?"
  place rules.md:153: The test is whether the paper still makes sense with the paragraph removed. A paragraph whose removal loses nothing is deleted.
  note: the clarity test
source writing_judgment_framework.md:9: - **Yes, and nothing is lost** <right arrow> Delete the paragraph
  place rules.md:153: The test is whether the paper still makes sense with the paragraph removed. A paragraph whose removal loses nothing is deleted.
  note: the outcome "delete the paragraph"
source writing_judgment_framework.md:10: - **Yes, but context is lost** <right arrow> Keep, but it's a supporting paragraph <em dash> keep it short
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the outcome directs how to draft (keep it short); it goes to paper at entry 5
source writing_judgment_framework.md:11: - **No, the argument breaks** <right arrow> This is a load-bearing paragraph <em dash> it deserves the most careful writing
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the outcome directs how to draft (most careful writing); it goes to paper at entry 5
source writing_judgment_framework.md:13: **Judgment heuristic**: Most AI-generated academic text fails the clarity test because every paragraph is given equal weight. Vary your investment: load-bearing paragraphs get multiple drafts; supporting paragraphs get one.
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the judgment heuristic judges who wrote the text; it goes to paper at entry 5
source writing_judgment_framework.md:15: ## The Reader's Journey
  place: none
  note: heading
source writing_judgment_framework.md:17: Academic writing is a guided tour. At any point, the reader should be able to answer:
  place rules.md:157: At any point the reader can answer four questions, each from the section structure and the transitions. A sentence that announces what the page is about to do falls under the prose standard, section C.
source writing_judgment_framework.md:19: 1. **Where am I?** (Section structure, signposting)
  place rules.md:159: 1. Where am I? The section structure answers it.
source writing_judgment_framework.md:20: 2. **Why am I here?** (Connection to the research question)
  place rules.md:160: 2. Why am I here? The connection to the research question answers it.
source writing_judgment_framework.md:21: 3. **What should I take away?** (The point of this section)
  place rules.md:161: 3. What should I take away? The point of the section answers it.
source writing_judgment_framework.md:22: 4. **Where am I going next?** (Transition logic)
  place rules.md:162: 4. Where am I going next? The transition logic answers it.
source writing_judgment_framework.md:24: If ANY of these is unclear, the writing needs revision <em dash> regardless of how accurate the content is.
  place rules.md:157: At any point the reader can answer four questions, each from the section structure and the transitions. A sentence that announces what the page is about to do falls under the prose standard, section C.
  note: an unclear question is a break the review reports under "Reader's path / Reader's four questions"
source writing_judgment_framework.md:26: ## Discipline-Specific Voice
  place: none
  note: heading
source writing_judgment_framework.md:28: | Discipline | Typical Voice | What Makes It Credible |
  place registers.md:21: ### What the reader looks for
  place plan.md:49: - D22 What makes each field's text credible (2026-09-30): (a) one line in each of the four kept registers names what the field's reader looks for (precision of measurement and method; transparency about limitations; reproducibility of results; adherence to reporting guidelines), and the review reports a methods or results section that leaves it out; whether a medical paper follows its reporting guideline is a check of content that `/writing` does not make; the lazy option was (c), leaving it out (the user).
  note: table header: the credibility column is carried as the line "What the reader looks for" (D22), the Typical Voice column is replaced by D18
source writing_judgment_framework.md:29: |-----------|--------------|----------------------|
  place: none
  note: table separator
source writing_judgment_framework.md:30: | Hard sciences | Impersonal, passive, hedged | Precision of measurement and method |
  place registers.md:23: The reader looks for precision of measurement and method. A methods or results section gives it.
  place plan.md:45: - D18 How each field's voice applies under the prose standard, replacing D12 (2026-09-30): (a) the prose standard's actor test, each kept register saying where the actor is irrelevant: in Sciences, Engineering/CS and Medicine/Health a procedure takes the passive and the authors' decisions, contributions and findings take "we"; in Social Sciences the researcher's decisions take "we" and a procedure the passive where the participants or the instrument matter; never the third person for the authors; a venue's author guidelines, when the project names the venue, hold over this rule; the lazy option was (c), the registers' voice lines copied (the user).
  note: Hard sciences row
source writing_judgment_framework.md:31: | Social sciences | Semi-personal, active, qualified | Transparency about limitations |
  place registers.md:41: The reader looks for transparency about limitations. A methods or results section gives it.
  place plan.md:45: - D18 How each field's voice applies under the prose standard, replacing D12 (2026-09-30): (a) the prose standard's actor test, each kept register saying where the actor is irrelevant: in Sciences, Engineering/CS and Medicine/Health a procedure takes the passive and the authors' decisions, contributions and findings take "we"; in Social Sciences the researcher's decisions take "we" and a procedure the passive where the participants or the instrument matter; never the third person for the authors; a venue's author guidelines, when the project names the venue, hold over this rule; the lazy option was (c), the registers' voice lines copied (the user).
  note: Social sciences row
source writing_judgment_framework.md:32: | Humanities | Personal, argumentative, interpretive | Depth of engagement with sources |
  place plan.md:39: - D11 Which disciplines' registers the writing base keeps, replacing D5 (2026-09-30): Engineering/CS, Medicine/Health, Sciences (Natural, Applied) and Social Sciences; Humanities, Education and the zh-TW conventions are left out, and coverage row 76's reason is amended to say so; the lazy option was Engineering/CS only (the user).
  note: Humanities row left out (D11)
source writing_judgment_framework.md:33: | Engineering | Direct, specification-oriented | Reproducibility of results |
  place registers.md:59: The reader looks for reproducibility of results. A methods or results section gives it.
  place plan.md:45: - D18 How each field's voice applies under the prose standard, replacing D12 (2026-09-30): (a) the prose standard's actor test, each kept register saying where the actor is irrelevant: in Sciences, Engineering/CS and Medicine/Health a procedure takes the passive and the authors' decisions, contributions and findings take "we"; in Social Sciences the researcher's decisions take "we" and a procedure the passive where the participants or the instrument matter; never the third person for the authors; a venue's author guidelines, when the project names the venue, hold over this rule; the lazy option was (c), the registers' voice lines copied (the user).
  note: Engineering row
source writing_judgment_framework.md:34: | Medical | Structured, protocol-focused | Adherence to reporting guidelines |
  place registers.md:77: The reader looks for adherence to reporting guidelines. A methods or results section names the reporting guideline the paper follows. Whether the paper meets that guideline is a check of content that this review does not make.
  place plan.md:45: - D18 How each field's voice applies under the prose standard, replacing D12 (2026-09-30): (a) the prose standard's actor test, each kept register saying where the actor is irrelevant: in Sciences, Engineering/CS and Medicine/Health a procedure takes the passive and the authors' decisions, contributions and findings take "we"; in Social Sciences the researcher's decisions take "we" and a procedure the passive where the participants or the instrument matter; never the third person for the authors; a venue's author guidelines, when the project names the venue, hold over this rule; the lazy option was (c), the registers' voice lines copied (the user).
  note: Medical row
source writing_judgment_framework.md:36: **Judgment heuristic**: If you're writing "We argue that..." in a physics paper or "The data indicates..." in a humanities essay, you've adopted the wrong voice for the discipline.
  place plan.md:50: - D23 The discipline table's sentence against D18 (2026-09-30): (a) "If you're writing "We argue that..." in a physics paper ..., you've adopted the wrong voice" is not carried, since D18 holds; no option was the lazy one, both cost the same (the user).
  note: not carried (D23)
source writing_judgment_framework.md:38: ## The "So What" Hierarchy for Sections
  place: none
  note: heading
source writing_judgment_framework.md:40: | Section | The reader's "So What?" | Your job |
  place rules.md:168: | Section | The reader's question | The section's job |
  note: table header
source writing_judgment_framework.md:41: |---------|------------------------|----------|
  place: none
  note: table separator
source writing_judgment_framework.md:42: | Introduction | Why should I care about this topic? | Hook with a real-world consequence or knowledge gap |
  place rules.md:170: | Introduction | Why should I care about this topic? | Opens with a real-world consequence or a gap in knowledge. |
source writing_judgment_framework.md:43: | Literature Review | What's missing from what we know? | Build to the gap, don't just summarize |
  place rules.md:171: | Literature review | What is missing from what we know? | Builds to the gap and does more than summarize. |
source writing_judgment_framework.md:44: | Methodology | Can I trust these results? | Show rigor, acknowledge limitations upfront |
  place rules.md:172: | Methodology | Can I trust these results? | Shows rigor and acknowledges limitations at the start. |
source writing_judgment_framework.md:45: | Results | What did you actually find? | Lead with the finding, not the statistical test |
  place rules.md:173: | Results | What did you actually find? | Leads with the result, not the statistical test. |
source writing_judgment_framework.md:46: | Discussion | What does this mean for the field? | Connect back to the gap; state the delta clearly |
  place rules.md:174: | Discussion | What does this mean for the field? | Connects back to the gap and states what the study adds to what was known. |
source writing_judgment_framework.md:47: | Conclusion | What should I remember? | One sentence that captures the contribution |
  place rules.md:175: | Conclusion | What should I remember? | Gives one sentence that captures the contribution. |
source writing_judgment_framework.md:49: ## Revision Decision Matrix
  place: none
  note: heading
source writing_judgment_framework.md:51: When revising based on reviewer feedback:
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:53: | Reviewer Says | Your Options | Decision Framework |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:54: |--------------|-------------|-------------------|
  place: none
  note: table separator
source writing_judgment_framework.md:55: | "Unclear" | Rewrite for clarity | Always do this <em dash> it costs nothing |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:56: | "Missing reference" | Add if relevant | Check if it genuinely fills a gap or is self-citation promotion |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:57: | "Wrong method" | Evaluate, justify, or change | If your method is defensible, justify with evidence; if not, this may require Major changes |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:58: | "Not novel enough" | Strengthen framing | Reframe contribution, don't add unnecessary analyses |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
source writing_judgment_framework.md:59: | "Too long" | Cut ruthlessly | Apply the Clarity Test paragraph by paragraph |
  place academic-coverage.md:100: | `references/writing_judgment_framework.md` | rebuild: writing | Prose judgment uses the paragraph-removal clarity test, four questions a reader must answer and each section's "so what", held in `skills/writing/references/rules.md`. What makes four of its five disciplines credible stands in `skills/writing/references/registers.md`, with the voice D18 sets in place of its Typical Voice column. The Humanities row is left out (D11) and the "We argue that..." sentence is not carried (D23). The clarity test's other two outcomes direct drafting, and its judgment heuristic judges who wrote the text, so both go to `paper` at entry 5. Its revision decision matrix belongs with `rebuttal`. |
  note: the revision decision matrix goes to rebuttal
```

### Record 3: references/writing_quality_check.md (173 lines)

```
source writing_quality_check.md:1: # Writing Quality Check
  place: none
  note: title
source writing_quality_check.md:3: ## Purpose
  place: none
  note: heading
source writing_quality_check.md:5: A set of writing quality rules extracted from common patterns in AI-generated text. These are **good writing rules** that apply regardless of whether the text was AI-generated or human-written. The goal is better prose, not detection evasion.
  place SKILL.md:86: - Judge the text by the rules only, and state nothing on how or by whom it was written.
  note: the purpose: the prompt judges the text by the rules only
source writing_quality_check.md:7: > **Design boundary**: This checklist improves writing quality. It is NOT a humanizer. We do not aim to fool AI detectors. We aim to produce clear, precise, varied academic prose.
  place SKILL.md:86: - Judge the text by the rules only, and state nothing on how or by whom it was written.
  note: the design boundary: the prompt asks for no statement on how or by whom the text was written
source writing_quality_check.md:9: Reference this checklist during the self-review step of drafting (draft_writer_agent Step 2.7, report_compiler_agent final check).
  place: none
  note: names agents Ordo does not have (draft_writer_agent Step 2.7, report_compiler_agent); no skill of Ordo has those steps
source writing_quality_check.md:11: ---
  place: none
  note: rule line
source writing_quality_check.md:13: ## A. High-Frequency Term Warnings
  place: none
  note: heading
source writing_quality_check.md:15: The following terms appear disproportionately in AI-generated text. They are not banned <em dash> but when you encounter one, ask: **"Is this really the most precise word here, or am I defaulting to it?"**
  place prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.
  place rules.md:179: The prose standard, section A, flags these terms. A finding on one asks for the most precise word in its place.
  note: terms are flagged, not banned, and each use must be the most precise word
source writing_quality_check.md:17: ### Flagged Terms
  place: none
  note: heading
source writing_quality_check.md:19: | Term | Why it's flagged | Better alternatives (context-dependent) |
  place rules.md:185: | Term | Why it is flagged | Alternatives, by context |
  note: table header; the "better alternatives" column is kept as the reference table
source writing_quality_check.md:20: |------|-----------------|----------------------------------------|
  place: none
  note: table separator
source writing_quality_check.md:21: | delve | Overused as "explore" substitute | examine, investigate, analyze, explore |
  place rules.md:187: | delve | Stands in for "explore" | examine, investigate, analyze, explore |
  note: delve
source writing_quality_check.md:22: | tapestry | Clich<e acute> metaphor for complexity | network, interplay, system, landscape |
  place rules.md:188: | tapestry | Cliche metaphor for complexity | network, interplay, system |
  note: tapestry; "landscape" is dropped from its alternatives because the prose standard flags it
source writing_quality_check.md:23: | landscape | Vague when not literal | field, domain, context, state of |
  place rules.md:189: | landscape | Vague when it is not literal | field, domain, context, state of |
  note: landscape
source writing_quality_check.md:24: | pivotal | Inflation of importance | important, significant, central, key |
  place rules.md:190: | pivotal | Inflates importance | important, central, key |
  note: pivotal; "significant" is dropped from its alternatives because the prose standard flags it
source writing_quality_check.md:25: | crucial | Same as above | essential, necessary, critical, vital |
  place rules.md:191: | crucial | Inflates importance | essential, necessary, critical, vital |
  note: crucial
source writing_quality_check.md:26: | foster | Vague verb | promote, develop, cultivate, encourage |
  place rules.md:192: | foster | Vague verb | promote, develop, cultivate, encourage |
  note: foster
source writing_quality_check.md:27: | showcase | Non-academic register | demonstrate, illustrate, present, reveal |
  place rules.md:193: | showcase | Non-academic register | demonstrate, illustrate, present, reveal |
  note: showcase
source writing_quality_check.md:28: | testament | Clich<e acute> | evidence, indicator, demonstration |
  place rules.md:194: | testament | Cliche | evidence, indicator, demonstration |
  note: testament
source writing_quality_check.md:29: | navigate | Vague when not literal | manage, address, handle, negotiate |
  place rules.md:195: | navigate | Vague when it is not literal | manage, address, handle, negotiate |
  note: navigate
source writing_quality_check.md:30: | leverage | Business jargon | use, employ, utilize, apply |
  place rules.md:196: | leverage | Business jargon | use, employ, utilize, apply |
  note: leverage
source writing_quality_check.md:31: | realm | Archaic/poetic | domain, field, area, sphere |
  place rules.md:197: | realm | Archaic and poetic | domain, field, area, sphere |
  note: realm
source writing_quality_check.md:32: | embark | Overwrought for "begin" | begin, initiate, undertake, start |
  place rules.md:198: | embark | Overwrought for "begin" | begin, initiate, undertake, start |
  note: embark
source writing_quality_check.md:33: | underscore | Overused emphasis verb | emphasize, highlight, stress, reinforce |
  place rules.md:199: | underscore | Overused emphasis verb | emphasize, highlight, stress, reinforce |
  note: underscore
source writing_quality_check.md:34: | multifaceted | Vague complexity claim | complex, varied, diverse, multilayered |
  place rules.md:200: | multifaceted | Claims complexity without saying what it is | complex, varied, diverse, multilayered |
  note: multifaceted
source writing_quality_check.md:35: | nuanced | Often vacuous | subtle, detailed, fine-grained, qualified |
  place rules.md:201: | nuanced | Empty unless the nuance is stated | subtle, detailed, fine-grained, qualified |
  note: nuanced
source writing_quality_check.md:36: | comprehensive | Often unjustified | thorough, extensive, broad, detailed |
  place rules.md:202: | comprehensive | Claims completeness without showing it | thorough, extensive, broad, detailed |
  note: comprehensive
source writing_quality_check.md:37: | robust | Vague quality claim | reliable, strong, rigorous, resilient |
  place rules.md:203: | robust | Vague quality claim | reliable, strong, rigorous, resilient |
  note: robust
source writing_quality_check.md:38: | intricate | Same problem as multifaceted | complex, detailed, elaborate, involved |
  place rules.md:204: | intricate | Same fault as "multifaceted" | complex, detailed, elaborate, involved |
  note: intricate
source writing_quality_check.md:39: | cornerstone | Clich<e acute> metaphor | foundation, basis, core element, pillar |
  place rules.md:205: | cornerstone | Cliche metaphor | foundation, basis, core element, pillar |
  note: cornerstone
source writing_quality_check.md:40: | paradigm | Overused outside philosophy of science | framework, model, approach (exception: "paradigm shift" in philosophy of science is standard) |
  place rules.md:206: | paradigm | Overused outside the philosophy of science | framework, model, approach |
  note: paradigm; the exception moves to Discipline exceptions
source writing_quality_check.md:41: | synergy | Business jargon | interaction, cooperation, combined effect |
  place rules.md:207: | synergy | Business jargon | interaction, cooperation, combined effect |
  note: synergy
source writing_quality_check.md:42: | holistic | Vague without definition | comprehensive, integrated, whole-system |
  place rules.md:208: | holistic | Vague without a definition | integrated, whole-system |
  note: holistic; "comprehensive" is dropped from its alternatives because the prose standard flags it
source writing_quality_check.md:43: | streamline | Non-academic | simplify, optimize, improve efficiency |
  place rules.md:209: | streamline | Non-academic | simplify, optimize, improve efficiency |
  note: streamline
source writing_quality_check.md:44: | cutting-edge | Clich<e acute> | recent, advanced, state-of-the-art, novel |
  place rules.md:210: | cutting-edge | Cliche | recent, advanced, state-of-the-art, novel |
  note: cutting-edge
source writing_quality_check.md:45: | groundbreaking | Inflation | novel, innovative, pioneering, original |
  place rules.md:211: | groundbreaking | Inflates importance | novel, innovative, pioneering, original |
  note: groundbreaking
source writing_quality_check.md:47: ### Exception Rule
  place: none
  note: heading
source writing_quality_check.md:49: If a flagged term is **standard terminology in the target discipline**, it is exempt:
  place prose-standard.md:28: Flagged, not banned; each use must be the most precise word rather than a default, and standard domain terminology is exempt: delve, tapestry, landscape, pivotal, crucial, foster, showcase, testament, navigate, leverage, realm, embark, underscore, multifaceted, nuanced, comprehensive, robust, intricate, cornerstone, paradigm, synergy, holistic, streamline, cutting-edge, groundbreaking.
  place rules.md:215: A flagged term that is standard terminology in the draft's discipline is not reported:
source writing_quality_check.md:50: - "paradigm shift" in philosophy of science <right arrow> OK
  place rules.md:217: - "paradigm shift" in the philosophy of science.
source writing_quality_check.md:51: - "landscape" in ecology/geography (literal) <right arrow> OK
  place rules.md:218: - "landscape" in its literal sense in ecology or geography.
source writing_quality_check.md:52: - "robust" in statistics ("robust estimator") <right arrow> OK
  place rules.md:219: - "robust estimator" in statistics.
source writing_quality_check.md:53: - "navigate" in wayfinding research (literal) <right arrow> OK
  place rules.md:220: - "navigate" in its literal sense in wayfinding research.
source writing_quality_check.md:55: ---
  place: none
  note: rule line
source writing_quality_check.md:57: ## B. Punctuation Pattern Control
  place: none
  note: heading
source writing_quality_check.md:59: ### Em Dash (<em dash>)
  place: none
  note: heading
source writing_quality_check.md:60: - **Limit**: <less-than or equal sign> 3 per paper total, recommend 0-1
  place prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
  note: the prose standard allows no em dash
source writing_quality_check.md:61: - **Why**: AI text overuses em dashes for parenthetical asides. Academic writing typically uses commas, parentheses, or separate sentences instead
  place: none
  note: rationale, states no rule
source writing_quality_check.md:62: - **Fix**: Replace with commas, parentheses, or restructure into separate sentences
  place prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
  note: the fix is in the prose standard's own wording
source writing_quality_check.md:63: - **Exception**: Direct quotes from sources retain their original punctuation
  place prose-standard.md:13: - **Em dash: zero.** Use a comma, a full stop, a colon, parentheses, or restructure. The en dash used as an aside is banned the same way. A spaced hyphen (` - `) or `--` as an aside is the same construction respelled and is equally banned; a hyphen inside a compound word or a number range is not a dash.
  place 0002-the-prose-standard-holds-over-the-academic-sources.md:11: The prose standard holds for every text the writing skills write or review. The academic rules add only what the prose standard lacks: terms defined at first use, clear antecedents, the hedging scale, tense per section, the clarity test, the reader's four questions, the "so what" per section, and the other rules the entry's rulings carry. No rule that contradicts the prose standard is carried.
  note: the exception for direct quotes is not carried; the prose standard allows no em dash and ADR 0002 carries no rule that contradicts it
source writing_quality_check.md:65: ### Semicolons
  place: none
  note: heading
source writing_quality_check.md:66: - **Limit**: <less-than or equal sign> 2 per 1000 words
  place prose-standard.md:33: - Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
source writing_quality_check.md:67: - **Why**: AI text chains independent clauses with semicolons where a period would be clearer
  place: none
  note: rationale, states no rule
source writing_quality_check.md:68: - **Fix**: Use a period and start a new sentence. Reserve semicolons for closely related parallel structures
  place prose-standard.md:33: - Semicolons: at most 2 per 1000 words of running prose. A full stop is usually clearer. Table cells and one-line data rows are not running prose.
source writing_quality_check.md:70: ### Colon-List Sequences
  place: none
  note: heading
source writing_quality_check.md:71: - **Rule**: Avoid 2+ consecutive paragraphs that each open with a colon followed by a list
  place prose-standard.md:34: - Never two or more consecutive paragraphs that each open with a colon and a list.
source writing_quality_check.md:72: - **Why**: Creates a monotonous enumerate-everything pattern
  place: none
  note: rationale, states no rule
source writing_quality_check.md:73: - **Fix**: Integrate list items into prose, or use a single consolidated list
  place prose-standard.md:34: - Never two or more consecutive paragraphs that each open with a colon and a list.
  place prose-standard.md:53: - Three or more list-shaped items in paragraph form become a list. Lists are introduced with a colon.
  note: the fix is not carried: a finding proposes no replacement (D30)
source writing_quality_check.md:75: ---
  place: none
  note: rule line
source writing_quality_check.md:77: ## C. Throat-Clearing Openers
  place: none
  note: heading
source writing_quality_check.md:79: Delete the following sentence starters. Cut to the point.
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:81: | Throat-clearing phrase | What to do |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
  note: table header
source writing_quality_check.md:82: |-----------------------|-----------|
  place: none
  note: table separator
source writing_quality_check.md:83: | "In the realm of..." | Delete. Start with the actual subject |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:84: | "It's important to note that..." | Delete. If it's important, the content speaks for itself |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:85: | "It is worth mentioning that..." | Same as above |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:86: | "In today's rapidly evolving..." | Delete. Timestamped clich<e acute>s add no information |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
  note: added to the prose standard by this step
source writing_quality_check.md:87: | "This serves as a testament to..." | Replace with direct claim: "This demonstrates..." or just state the evidence |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:88: | "It goes without saying that..." | If it goes without saying, don't say it |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:89: | "In order to..." | Replace with "To..." |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:90: | "It should be noted that..." | Delete. Just note it |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:91: | "As a matter of fact..." | Delete. State the fact |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
  note: added to the prose standard by this step
source writing_quality_check.md:92: | "When it comes to..." | Replace with the subject directly: "X shows..." |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:93: | "At the end of the day..." | Delete. Colloquial and vague |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:94: | "With that being said..." | Delete or use "However" if a contrast is intended |
  place prose-standard.md:39: Delete the opener rather than rewriting it: "In the realm of", "It's important to note that", "It is worth mentioning that", "In today's rapidly evolving...", "This serves as a testament to", "It goes without saying that", "In order to" (use "To"), "It should be noted that", "As a matter of fact...", "When it comes to", "At the end of the day", "With that being said".
source writing_quality_check.md:96: ### Meta-Commentary to Avoid
  place: none
  note: heading
source writing_quality_check.md:98: Also watch for sentences that describe what the paper is doing instead of doing it:
  place prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
source writing_quality_check.md:99: - "This section will discuss..." <right arrow> Just discuss it
  place prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
source writing_quality_check.md:100: - "The following paragraph examines..." <right arrow> Just examine it
  place prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
source writing_quality_check.md:101: - "We now turn our attention to..." <right arrow> Just turn to it
  place prose-standard.md:41: Never describe what the page is about to do. "This section explains", "The following covers" are cut; the explanation itself is the page.
source writing_quality_check.md:103: Exception: Roadmap sentences in the Introduction ("Section 2 reviews the literature; Section 3 describes the methodology") are standard academic practice and should be kept.
  place briefs/1.md:144: The prose standard's rule against describing what the page is about to do holds over the source's exception for roadmap sentences in an Introduction, which is not carried
  note: the roadmap-sentence exception is not carried (Decision 3, which rests on ADR 0002)
source writing_quality_check.md:105: ---
  place: none
  note: rule line
source writing_quality_check.md:107: ## D. Structure Pattern Warnings
  place: none
  note: heading
source writing_quality_check.md:109: ### Rule of Three Compulsion
  place: none
  note: heading
source writing_quality_check.md:110: - **Pattern**: Every argument has exactly 3 sub-points, every list has exactly 3 items
  place prose-standard.md:47: - **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
source writing_quality_check.md:111: - **Why**: Real analysis doesn't always decompose into trios. Two strong points beat three padded ones
  place: none
  note: rationale, states no rule
source writing_quality_check.md:112: - **Fix**: Use as many points as the evidence warrants. 2 is fine. 5 is fine. Don't pad to 3
  place prose-standard.md:47: - **No rule of three.** Do not pad a list to three items and do not decompose every argument into three parts. The evidence decides the count.
source writing_quality_check.md:114: ### Uniform Paragraph Length
  place: none
  note: heading
source writing_quality_check.md:115: - **Pattern**: All paragraphs are approximately the same length (150-200 words each)
  place prose-standard.md:49: - **Vary paragraph length.** Uniform blocks are a template.
source writing_quality_check.md:116: - **Why**: Natural writing has paragraph length variation. Short paragraphs for emphasis, longer ones for complex arguments
  place: none
  note: rationale, states no rule
source writing_quality_check.md:117: - **Fix**: Vary paragraph length. A 2-sentence paragraph after a 10-sentence paragraph creates rhythm
  place prose-standard.md:49: - **Vary paragraph length.** Uniform blocks are a template.
source writing_quality_check.md:119: ### Synonym Cycling
  place: none
  note: heading
source writing_quality_check.md:120: - **Pattern**: Using 3+ different synonyms for the same concept within one paragraph to avoid repetition
  place prose-standard.md:50: - **No synonym cycling.** One term per concept, repeated. Technical repetition is clarity.
source writing_quality_check.md:121: - **Why**: In academic writing, consistent terminology is a virtue. Swapping "students" <right arrow> "learners" <right arrow> "participants" <right arrow> "subjects" within one paragraph confuses rather than impresses
  place: none
  note: rationale, states no rule
source writing_quality_check.md:122: - **Fix**: Pick one term per concept per section. Repeat it. Technical repetition is clarity, not weakness
  place prose-standard.md:50: - **No synonym cycling.** One term per concept, repeated. Technical repetition is clarity.
source writing_quality_check.md:124: ### Binary Contrast Overuse
  place: none
  note: heading
source writing_quality_check.md:125: - **Pattern**: "Not X. Y." or "It's not about X <em dash> it's about Y." used more than twice per paper
  place prose-standard.md:51: - **Binary contrast ("not X, Y") at most twice per page**, and only where the contrast is the actual point.
source writing_quality_check.md:126: - **Why**: This rhetorical device is effective once. Repeated, it becomes a tic
  place: none
  note: rationale, states no rule
source writing_quality_check.md:127: - **Limit**: <less-than or equal sign> 2 per paper
  place prose-standard.md:51: - **Binary contrast ("not X, Y") at most twice per page**, and only where the contrast is the actual point.
source writing_quality_check.md:129: ### Mirror Structure
  place: none
  note: heading
source writing_quality_check.md:130: - **Pattern**: Every section has the same internal structure (topic sentence <right arrow> 3 evidence points <right arrow> synthesis sentence)
  place prose-standard.md:52: - **No mirror structure.** Each section takes the shape its content needs.
source writing_quality_check.md:131: - **Why**: Creates a template-stamped feel. Different sections serve different purposes and should have different internal rhythms
  place: none
  note: rationale, states no rule
source writing_quality_check.md:132: - **Fix**: Let section structure follow content needs. Methods can be procedural. Discussion can be exploratory
  place prose-standard.md:52: - **No mirror structure.** Each section takes the shape its content needs.
source writing_quality_check.md:134: ---
  place: none
  note: rule line
source writing_quality_check.md:136: ## E. Burstiness (Sentence Length Variation)
  place: none
  note: heading
source writing_quality_check.md:138: ### What to Check
  place: none
  note: heading
source writing_quality_check.md:139: Good writing has **natural variation in sentence length**. Short sentences create impact. Longer sentences develop complex ideas. The alternation creates rhythm.
  place prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
source writing_quality_check.md:141: ### Detection Rule
  place: none
  note: heading
source writing_quality_check.md:142: If 5+ consecutive sentences all fall within a narrow word-count range (e.g., all between 20-25 words): **flag for review**.
  place prose-standard.md:64: - **Sentence length**: under roughly 20 words unless the mechanism needs more; five or more consecutive sentences of the same length are rewritten. One named exception: a sentence in the reason cell of a coverage table, which lists what a file holds, may run to about 35 words.
source writing_quality_check.md:144: ### How to Fix
  place: none
  note: heading
source writing_quality_check.md:145: - Insert a short sentence (<less-than or equal sign> 10 words) to break the pattern
  place plan.md:56: - D30 Whether each finding carries a proposed replacement, replacing W and the last clause of D20 (2026-10-14): (c) no replacements; each finding gives its place, the quoted passage and the rule it breaks with what that rule asks for, and /writing applies nothing; the skill that owns the text, `paper` or `grant`, writes the fix, as ADR 0003 and roadmap entries 5 and 8 say; the flagged-term alternatives of D20 stay in the writing base's academic page, no longer as replacements the findings propose; the lazy option was none (the user).
  note: not carried: the review proposes no replacement and applies no fix (D30)
source writing_quality_check.md:146: - Combine two short sentences into one complex one if the pattern is monotonously short
  place plan.md:56: - D30 Whether each finding carries a proposed replacement, replacing W and the last clause of D20 (2026-10-14): (c) no replacements; each finding gives its place, the quoted passage and the rule it breaks with what that rule asks for, and /writing applies nothing; the skill that owns the text, `paper` or `grant`, writes the fix, as ADR 0003 and roadmap entries 5 and 8 say; the flagged-term alternatives of D20 stay in the writing base's academic page, no longer as replacements the findings propose; the lazy option was none (the user).
  note: not carried: the review proposes no replacement and applies no fix (D30)
source writing_quality_check.md:147: - Read the paragraph aloud <em dash> if it feels metronomic, vary it
  place plan.md:56: - D30 Whether each finding carries a proposed replacement, replacing W and the last clause of D20 (2026-10-14): (c) no replacements; each finding gives its place, the quoted passage and the rule it breaks with what that rule asks for, and /writing applies nothing; the skill that owns the text, `paper` or `grant`, writes the fix, as ADR 0003 and roadmap entries 5 and 8 say; the flagged-term alternatives of D20 stay in the writing base's academic page, no longer as replacements the findings propose; the lazy option was none (the user).
  note: not carried: the review proposes no replacement and applies no fix (D30)
source writing_quality_check.md:149: ### Burstiness Targets (by section)
  place: none
  note: heading
source writing_quality_check.md:150: - **Abstract**: Moderate variation (factual, steady pace)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:151: - **Introduction**: High variation (hook with short sentences, build with long ones)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:152: - **Literature Review**: Moderate (steady analytical pace, occasional short synthesis)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:153: - **Methods**: Low variation acceptable (procedural sections naturally have uniform length)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:154: - **Results**: Moderate (short for key findings, longer for detailed descriptions)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:155: - **Discussion**: Highest variation (short for emphasis, long for interpretation, very short for conclusions)
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: "nothing here is a target or a ratio"
source writing_quality_check.md:157: ---
  place: none
  note: rule line
source writing_quality_check.md:159: ## How to Use This Checklist
  place: none
  note: heading
source writing_quality_check.md:161: ### During Drafting (Preferred)
  place: none
  note: heading
source writing_quality_check.md:162: Apply rules **while writing each section** in the self-review sub-step (Step 2.7 in draft_writer_agent). This catches issues before they propagate.
  place 0003-a-fresh-read-only-agent-reviews-a-draft.md:7: `/writing <file>` reviews a draft by reading it against the writing base's rules and reports each finding with its place, the quoted passage and the rule it breaks, with no proposed replacement, the user deciding on each. The writing skills `paper` and `grant` draft text and then review it with `/writing`, so the session that runs the review may be the one that wrote the draft. Ordo already has a fresh reviewer that changes nothing review each step of a plan (`README.md`, opening).
  note: not carried: drafting belongs to the skills that draft (paper, grant) and /writing reviews a finished draft
source writing_quality_check.md:164: ### During Final Review (Fallback)
  place: none
  note: heading
source writing_quality_check.md:165: If not applied during drafting, run a full-paper sweep before handoff to citation_compliance_agent.
  place 0003-a-fresh-read-only-agent-reviews-a-draft.md:7: `/writing <file>` reviews a draft by reading it against the writing base's rules and reports each finding with its place, the quoted passage and the rule it breaks, with no proposed replacement, the user deciding on each. The writing skills `paper` and `grant` draft text and then review it with `/writing`, so the session that runs the review may be the one that wrote the draft. Ordo already has a fresh reviewer that changes nothing review each step of a plan (`README.md`, opening).
  note: not carried: a fallback sweep before a handoff to an agent Ordo does not have
source writing_quality_check.md:167: ### Scoring (Internal, Not Reported to User)
  place: none
  note: heading
source writing_quality_check.md:168: For each rule category, track violations:
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: scoring is a ratio and "nothing here is a target or a ratio"
source writing_quality_check.md:169: - 0 violations: Clean
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: scoring is a ratio and "nothing here is a target or a ratio"
source writing_quality_check.md:170: - 1-3 violations: Minor <em dash> fix in self-review
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: scoring is a ratio and "nothing here is a target or a ratio"
source writing_quality_check.md:171: - 4+ violations: Pattern issue <em dash> review the section's writing approach
  place prose-standard.md:3: Every prose surface in this tree is held to this: user pages, dev docs, ADRs, READMEs, file-header comments, internal comments, shipped diagnostics and messages. Each line is pass/fail, judged per instance; nothing here is a target or a ratio.
  note: not carried: scoring is a ratio and "nothing here is a target or a ratio"
source writing_quality_check.md:173: Do NOT report scores to the user. Just fix the issues silently during drafting.
  place 0003-a-fresh-read-only-agent-reviews-a-draft.md:11: `/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule. The session shows its report to the user and changes nothing. The skill that owns the text, `paper` for a manuscript and `grant` for a grant, applies the findings the user accepts, as the entry's rulings say.
  note: not carried: the review changes nothing, so there is nothing to fix silently, and the report is shown to the user
```

## The terms

Terms the diff adds or changes: **finding**, **effort agent** and **reviewer** (`skills/repo-setup/templates/plan-terms.md` lines 41, 39 and 99, and the same entries in `docs/glossary.md`, brought level by `sync_rules.py . --write --only glossary`, then `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0, in the checks above). No term is added: the glossary's term list is the 140 bold terms of `docs/glossary.md` (`grep -o '^- \*\*[^*]*\*\*' docs/glossary.md | wc -l`).

Each changed entry's "Stated in" is checked by `grep -n` of the term in the section it names, in `skills/writing/SKILL.md`:

```
$ awk '/^## Review agent prompt/{f=1} /^## Stops/{f=0} f && /finding/{print NR": "$0}' skills/writing/SKILL.md
92: - A finding gives its place, the passage quoted as the draft has it, and the rule it breaks by its page and section with what that rule asks for.
95: - A finding proposes no replacement and applies nothing.
96: - For a flagged term of the prose standard's section A, what the rule asks for is the most precise word in its place, and the finding lists no alternative word.
97: - Group the report by rule, each group headed by its page and section, with the findings of a group in document order.
99: - Under a group heading write the findings and no other line.
100: - A passage that breaks two rules stands once, in the first group in that order, and its finding names the other rule on a line of its own.
$ awk '/^## Steps/{f=1} /^## Review agent prompt/{f=0} f && /effort agent|ordo-<reviewer_effort>/{print NR": "$0}' skills/writing/SKILL.md
60: 4. Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1, as the `refute` skill's Steps 1 checks.
63: 5. Start one fresh agent in the background as `ordo-<reviewer_effort>` on the model `reviewer` names, with the prompt of "Review agent prompt".
$ awk '/^## Steps/{f=1} /^## Review agent prompt/{f=0} f && /`reviewer`/{print NR": "$0}' skills/writing/SKILL.md
48:    - Done when `reviewer`, `reviewer_effort` and `standards` are known, or the refusal is raised.
63: 5. Start one fresh agent in the background as `ordo-<reviewer_effort>` on the model `reviewer` names, with the prompt of "Review agent prompt".
$ sed -n 41p skills/repo-setup/templates/plan-terms.md | grep -o "Stated in: .*"
Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check"; `roadmap`, "What it reads" 6; `writing`, "Review agent prompt".
$ sed -n 39p skills/repo-setup/templates/plan-terms.md | grep -o "Stated in: .*"
Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact"; `diagnose`, "Rules"; `writing`, Steps 4 and 5.
$ sed -n 99p skills/repo-setup/templates/plan-terms.md | grep -o "Stated in: .*"
Stated in: `refute`, Steps 1 and Rules, and "Steps / Over a repair round" 1; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact"; `writing`, Steps 5.
```

Reading of each Stated in against its section: **finding** `writing`, "Review agent prompt" is the first block of lines above, which state a finding as place, quoted passage and the rule with what it asks for, and no replacement, the glossary sense. **effort agent** `writing`, Steps 4 and 5 are the two lines above, the check that the runner lists `ordo-<reviewer_effort>` and the start of the agent as `ordo-<reviewer_effort>`. **reviewer** `writing`, Steps 5 is the line that starts the agent on the model `reviewer` names.

Terms the diff uses in a new place, each read against its entry in `docs/glossary.md` (the entries read from `grep -n -F -- '- **<term>' docs/glossary.md`):

- **finding** in `skills/writing/SKILL.md` (the two Use instead rows, Steps 7, the prompt bullets above and the two Anti-patterns rows), in `skills/writing/references/rules.md` (lines 3, 179, 183) and in `skills/writing/references/registers.md` (line 5): all in the `/writing` sense the changed entry gives.
- **refusal** in "What it reads", Steps and Stops: a skill's end that names its cause and leaves nothing, as the entry says. The model-mismatch row is called a stop, not a refusal.
- **stop** in the Stops introduction and first row, and in Steps 6: the first Stops row is a point in the skill's Stops table where it waits on the user, and the glossary entry says "Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item." The agent stopped through the runner's stop tool (Steps 6) is the entry's "To stop an agent is also to end a running agent through the runner's stop tool."
- **open item** appears once, in that sentence, in the sense "a decision for the user in the state file", to say the skill leaves none.
- **plan skills** in the Stops row "The configured effort cannot apply" ("installed as the plan skills are"): the entry says the plan skills are installed once per user, and `refute` is one of them.
- **standards** as the key `standards` in "What it reads" 1 and 2 and in Steps 1: the pages `.agents/plan.yaml`'s `standards` lists, the entry's first sense.
- **step** in "a plan step's diff" (Use instead) is the entry's plan-step sense, and "Steps <n>" is the entry's skill-Steps sense.
- **builder** only in the quoted title "Launching a builder" of the `plan-orchestration` skill, **plan configuration** in the Stops row "No plan configuration" for `.agents/plan.yaml`, **runner** for Claude Code with its agent listing and stop tool, and **`projects:` form** for the multi-project form of `.agents/plan.yaml`: each in the entry's sense.
- **verdict**: the glossary defines it as the reviewer's judgment of the brief's items and cases, so the prompt does not use it; the bullet reads "state nothing on how or by whom it was written".

## Files with line counts

Created (`wc -l`):

```
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md skills/writing/templates/docx_paragraphs.py
     127 skills/writing/SKILL.md
     220 skills/writing/references/rules.md
      77 skills/writing/references/registers.md
     139 skills/writing/templates/docx_paragraphs.py
     563 total
```

Changed (`git diff --numstat`, added and removed lines, then `wc -l` of the file after the change):

```
$ git diff --numstat | while read a d f; do echo "$a $d $(wc -l < $f) $f"; done
1 1 16 .agents/plan.yaml
3 2 194 README.md
2 2 6 agents/ordo-high.md
2 2 6 agents/ordo-low.md
2 2 6 agents/ordo-max.md
2 2 6 agents/ordo-medium.md
2 2 6 agents/ordo-xhigh.md
3 3 235 docs/academic-coverage.md
1 0 32 docs/dev/scripts.md
3 3 151 docs/glossary.md
1 1 219 skills/plan/SKILL.md
2 2 69 skills/plan/templates/orchestrator-state.md
2 2 30 skills/plan/templates/plan.yaml
1 1 245 skills/repo-setup/SKILL.md
1 1 75 skills/repo-setup/templates/docs/dev/prose-standard.md
1 1 13 skills/repo-setup/templates/docs/glossary.md
3 3 134 skills/repo-setup/templates/plan-terms.md
```

The columns are added lines, removed lines, lines in the file after the change, and the path. The one report this step writes is `.scratch/3-the-writing-base/agents/reviews/1-report.md`; nothing else under `.scratch/` is touched, and the case files are in the scratch folder `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wb1.ASxi06`, outside both repositories.

## Judgment calls the brief left open

Each is the state the files are in now, with the reason.

1. The review prompt carries four statements the brief does not word: "When the discipline has none of the four registers, report no break of `references/registers.md`" (a draft in the Humanities or Education has no register rule, by D11), "When the draft breaks no rule, the report says so" (so an empty report is read as a result, not as a missing one), "Judge the text by the rules only, and state nothing on how or by whom it was written" (the purpose of `writing_quality_check.md` lines 5 and 7), and the gating "Apply the rules that `references/rules.md` marks (manuscripts and grants) only when the draft is a manuscript or a grant, which you read from the draft's own text" (D21 limits full forms, no colloquial words and one idea per sentence to manuscripts and grants, and the agent has no other source for the kind of the draft).
2. The word "verdict" is not used in the prompt, since the glossary gives it the reviewer's judgment of a brief's items and cases. The bullet says "state nothing on how or by whom it was written".
3. The files of a `.tex` draft are listed depth-first in the order the commands stand, a file listed once, a name resolved against the main file's folder with `.tex` added to a name without an extension, and a command after an unescaped `%` not followed (Steps 3). The brief fixes the `\input` and `\include` commands and the main file first; the rest is chosen so that the order is reproducible.
4. Two prompt bullets order the groups: the prose standard, then `references/rules.md`, then `references/registers.md`, and a passage that breaks two rules stands in the first group of that order with its finding naming the other rule on a line of its own (brief judgment call 2).
5. The agent definitions (five files) say "Ordo's skills launch" in line 6 where they said "Ordo's plan skills launch", and name the diagnosis agent and the `grill` lookup agent beside the review agent of `writing`: the sentence now lists the six kinds of agent the five definitions are launched for, and the diagnosis agent and the lookup agent were already launched as `ordo-<reviewer_effort>` (the **effort agent** entry names them).
6. `skills/plan/templates/orchestrator-state.md` line 14 names the review agent of `writing` as line 26 does: the line lists the same agents, so it changes with line 26 (change standard rule 14). The brief's item 9 names only line 26. `README.md` line 77 says "The plan skills and `writing` launch their agents": the sentence says who launches the five definitions, so it changes with the definitions (rule 14).
7. `docx_paragraphs.py` catches `OSError` on opening, so a path that does not exist or is a directory gives one `error:` line with the operating system's reason and exit 1, like the other errors (the brief lists the missing path as exit 1). It tests emptiness with `strip(" ")`, the literal space, so a paragraph of only spaces is not printed and a paragraph holding another whitespace character, such as a non-breaking space, still is.
8. `registers.md` opens with the rule that where a register line and its voice rule differ on the pronoun, the voice rule holds, and that a venue's author guidelines hold over a voice rule when the project names the venue (D18's last clause). The Sciences register line is "formal, impersonal and focused on the method" with the pronoun rule in the Voice section.
9. The Medicine and Health reader line is "adherence to reporting guidelines", and the rule the review applies to it is that a methods or results section names the reporting guideline the paper follows; whether the paper meets the guideline is a check of content this review does not make (D22).
10. `rules.md`: the hedge-strength rule maps each of the three strengths to the evidence it fits (weak: evidence only suggests; moderate: the data show a trend; strong: the evidence establishes a link). The flagged-term "why" column is reworded where the source said "often" (a vague qualifier in the prose standard section A) and "Cliche" is written without its accent. The alternatives "landscape" (under tapestry), "significant" (under pivotal) and "comprehensive" (under holistic) are dropped from the table because the prose standard flags those words. The example reads "350 degrees Celsius" where the source has "350" followed by the degree sign and "C", since the files are ASCII. "findings" is written "results" in the tense table and the so-what rows (the glossary gives "finding" its senses).
11. `SKILL.md` "Use instead" names `paper` and `grant`, which do not exist until roadmap entries 5 and 8, so the rows point at skills not yet installed; the brief's item 1 states the three rows.
12. The coverage rows 76, 100 and 101 are worded to name `rules.md` and `registers.md` for what they hold, the rulings D11, D18, D23 for what they leave out, `paper` at entry 5 and `rebuttal` for what goes there. Row 101 says "every em dash" in place of "over three dashes".
13. "Stated in" of **finding**: the entry carries one list that names `writing`, "Review agent prompt" after the three existing sources, with the `/writing` sense in a sentence introduced by "Also, for `/writing`". The **effort agent** entry names the `writing` Steps 4 and 5, and **reviewer** names Steps 5.
14. `skills/ordo-help/SKILL.md` and `docs/figures/gen_figures.py` are left unchanged: they print and draw the commands of the plan sequence (among them `/repo-setup`, `/ordo-init`, `/roadmap add` and `/grill`), and `/writing` is not a command of that sequence.
15. The sentences of the brief's Verify 5 are named by line with the reason each keeps its form in "Verify 5".

## Host-visible and user-visible changes, before and after

Each pair is the `-` and `+` line of the diff above (`git diff -U0`).

- A new skill `writing`. Before: `ls skills` listed `diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec`. After: it lists `writing` as well, with `SKILL.md`, `references/rules.md`, `references/registers.md` and `templates/docx_paragraphs.py`. `/writing <file>` starts one fresh agent that reads a `.tex` file with its `\input` and `\include` files, a `.md`, a `.txt` or a `.docx`, and shows the agent's report as the message that ends the turn.
- `README.md`: the skills table gains the `writing` row (line 26), the `for skill in` copy loop gains `writing` (line 104, after `spec`), and line 77 reads "The plan skills and `writing` launch their agents through five agent definitions" where it read "The plan skills launch their agents through five agent definitions".
- `docs/dev/scripts.md`: the "User scripts" table gains the row for `skills/writing/templates/docx_paragraphs.py`.
- `agents/ordo-{low,medium,high,xhigh,max}.md` lines 3 and 6: line 3 reads "The plan skills launch it by name for a builder, a reviewer, a brief-check agent or a diagnosis agent, `grill` for a lookup agent and `writing` for its review agent; it is never chosen for other work." where it read "...for a builder, a reviewer or a brief-check agent; ..."; line 6 reads "You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill` or the review agent of `writing`." where it read "...Ordo's plan skills launch: a builder, a reviewer or a brief-check agent." An installed copy of the definitions shows the new description to Claude Code once it is copied again.
- Comments: `skills/plan/templates/plan.yaml` lines 12 and 27, `skills/plan/templates/orchestrator-state.md` lines 14 and 26 and `.agents/plan.yaml` line 10 name the review agent of `/writing` among the agents the `reviewer` and `reviewer_effort` keys cover. No key, default or value changes.
- Glossary: `finding` gains the `/writing` sense, `effort agent` and `reviewer` name the review agent of `writing`; `docs/glossary.md` and `skills/repo-setup/templates/docs/glossary.md` (line 3, which names `writing` among the skills whose terms stand in the block) follow.
- The prose standard, section C: before, the list of openers had ten entries; after it has twelve, with "In today's rapidly evolving..." and "As a matter of fact..." (line 39; the file keeps 75 lines). This repository has no `docs/dev/prose-standard.md`; its `standards` key lists the template page (`.agents/plan.yaml` line 13). A repository that holds its own copy of the page does not receive the two openers from this step.
- Versions: `skills/repo-setup/SKILL.md` 5.1.0 to 5.2.0 (the template adds to what a set-up repository holds), `skills/plan/SKILL.md` 5.0.0 to 5.0.1 (wording of two template comments), `skills/writing/SKILL.md` 1.0.0 (new).
- `docs/academic-coverage.md` rows 76, 100 and 101: before, row 76 said the registers keep Engineering and CS only and that the zh-TW conventions are not kept, row 100 listed "each discipline's trusted voice", row 101 said "over three dashes"; after, they name the places in `skills/writing/` that hold each rule, the rulings that leave rules out, and "every em dash".

## Anything in the brief that was wrong or impossible

1. The thesis case wording "no paragraph printed twice" cannot hold of that file (see "Cases the brief's rules got wrong"); the evidence is the raw and output counts in "The cases after the change".
2. Item 9 names `skills/plan/templates/orchestrator-state.md` line 26 only. Line 14 of the same file lists the agents the `reviewer` key covers and is carried with it (judgment call 6).
3. Item 7 names the parts of the three sources that are left out and held elsewhere, and omits some lines the records have to cover: `writing_quality_check.md` line 9 ("Reference this checklist during the self-review step of drafting (draft_writer_agent Step 2.7, report_compiler_agent final check)"), which names agents Ordo does not have, and the lines that carry a rationale ("Why") and no rule. They appear in the record with `place: none` and the reason in the note.
4. Nothing in the brief was impossible. No case needed a hand-back to the orchestrator.
