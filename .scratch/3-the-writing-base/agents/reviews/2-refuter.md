# Step 2 refuter report (on .agents/worktrees/3-the-writing-base-2, base f241b23)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

`<cases>` below is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo-3-2-cases`. Every command ran from the worktree root. I changed nothing in the worktree, the main checkout or `<cases>`.

## Verification (rerun by the reviewer)

```
$ git status --short
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/3-the-writing-base/agents/reviews/2-report.md

$ git diff f241b23
(two files: docs/dev/building.md line 11 and line 25, docs/dev/change-standard.md line 75; 3 lines replaced, 3 added; the command lines equal the brief's item 4 text)

Verify 1a, the changed command as building.md holds it:
$ sed -n 11p docs/dev/building.md > <session scratchpad>/cmd.sh && sh <session scratchpad>/cmd.sh; echo "exit $?"
exit 0

Verify 1b, the same command over the files the step changes (the brief's printf form, verbatim):
$ printf '%s\0' docs/dev/building.md docs/dev/change-standard.md .scratch/3-the-writing-base/agents/reviews/2-report.md | xargs -0 sh -c '...four arms...' sh | xargs -0 perl -CSD -ne '...'; echo "exit $?"
exit 0

Verify 2:
$ diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md); echo "diff exit $?"
diff exit 0

Verify 3, the loop part on the eleven paths of item 4 and the 17 main-checkout case paths:
kept: .scratch/3-the-writing-base/agents/reviews/cases/x.md
kept: .scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md
kept: .scratch/3-the-writing-base/agents/briefs/2-cases.md
kept: skills/writing/cases/x.tex
kept: docs/cases/x.md
kept: cases/x.md
kept: .scratch/3-the-writing-base/plan.md
kept: README.md

Verify 4, python3 skills/writing/templates/docx_paragraphs.py <cases>/<draft>/draft.docx; echo "exit $?":
engineering 133 paragraphs, exit 0; medicine 47, exit 0; sciences 46, exit 0; social 48, exit 0 (whole outputs read)

Verify 5, docx_paragraphs.py <draft.docx> | LC_ALL=C grep -n '[^ -~]', and LC_ALL=C grep -n '[^ -~]' <cases>/<draft>/*.tex:
engineering docx: 105 (<em dash>), 106 (<en dash>), 118 (<left double quotation mark>full<right double quotation mark>), 119 (<horizontal ellipsis>), 122 (<rightwards arrow>)
engineering tex: sections.tex:173, :175, :199, :201, :207, the same five passages
medicine, sciences, social: nothing, for both forms

Evidence the builder's report quotes, rerun:
$ sh -c "$(git show f241b23:docs/dev/building.md | sed -n 11p)"; echo "exit $?"
exit 0                                                     (C10 first run: holds)
$ grep -n '\\input' <cases>/*/main.tex
medicine/main.tex:57, sciences/main.tex:59, engineering/main.tex:43, social/main.tex:53, each \input{sections}   (holds)
$ wc -l (the 13 case text files)                           1155 total, each count as the report gives (holds)
$ wc -l docs/dev/building.md docs/dev/change-standard.md   29, 87 (holds)
$ grep -c '^### ' skills/writing/references/rules.md skills/writing/references/registers.md   23, 16 (holds)
$ awk over expected.md column 2, per section, sort | uniq -c
engineering 70 break / 55 clean; medicine 6 / 11; sciences 4 / 12; social 7 / 12; 177 rows (holds)
$ docx_paragraphs.py <draft.docx> | sed 's/^[0-9]*: //' | wc -w
engineering 1933, medicine 655, sciences 577, social 624 (holds)
$ sed -n '15p;17p;19p;21p;23p;25p' engineering/main.tex, each | wc -w
32 29 30 31 28 29 (holds)
$ grep -n -o ';' */*.tex | sort | uniq -c
engineering/sections.tex:211 5; medicine/sections.tex:33 1; sciences/sections.tex:31 1; social/sections.tex:37 1 (holds)
$ grep -n -E ', not |not [a-z]+, ' */*.tex
engineering/sections.tex:213 (3 contrasts); medicine/sections.tex:35; social/sections.tex:43; sciences/sections.tex:33 (holds)
$ unzip -p <draft.docx> word/document.xml | perl -CSD -ne '<count U+2022>'
0 for each of the four (holds)
$ grep -c -E '<ul|&nbsp;|<table' <cases>/*/draft.html
0 for each (holds)

C6, the two forms, without writing a file:
$ diff <(textutil -convert txt -stdout <draft.html> | sed 's/^[[:space:]]*//' | grep -v '^$') <(docx_paragraphs.py <draft.docx> | sed 's/^[0-9]*: //'); echo "diff exit $?"
diff exit 0 for each of the four
$ diff <(main.tex to \input, sections.tex, rest of main.tex, LaTeX preamble lines dropped, \section{X} to X) <(docx_paragraphs.py <draft.docx> | sed 's/^[0-9]*: //')
medicine, sciences, social: no difference. engineering: only sections.tex:225 to 248 absent from the .docx (the two \subsection headings, the ten tex-only paragraphs, among them sections.tex:227 and :231, which are not cases)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Spec 1, 2, 3, 4, 5 and 6. The four folders exist with `main.tex`, `sections.tex`, `draft.html` and `draft.docx`, each states its discipline and names no venue; but each short draft holds breaks beyond its register cases and its named second rules, and several clean passages break their rule or the brief's rule against near-copies.
- 2: violated, Proof 1. `expected.md` has the columns, the two sentences word for word (`sed -n 3,4p`), the list of rules with no case and the list of short-draft clean rows; one count in a clean row is wrong, and the extra exception of Spec 10 is listed.
- 3: violated, Spec 1 to 9 and 11.
- 4: violated, Standards 1. The command is word for word in both pages and behaves as the table says (Verify 1 to 3); the rewritten paragraph after the block is nine sentences long.

Cases of the brief's "Cases":

- C1, the rule list: partial, the colon part of section D's list bullet has no case and is not an exception the brief allows (Spec 10). Every other rule of the three pages has its break and clean rows or one of the allowed exceptions. I read all 177 rows against the three pages.
- C2, the other registers: met. Each of the twelve register headings has a break row and a clean row in its draft's section. Whether those passages hold up is under C3.
- C3, each passage against its rule: unmet, Spec 2, 3, 5, 7 and 8.
- C4, the places: met. I mapped every row's `.tex` line to the `.docx` paragraph number (for example `sections.tex:<L>` to paragraph 19 + (L-1)/2 in `engineering` up to line 223) and read each quoted passage at its line, for all 177 rows. Every row holds.
- C5, the `\input` file: met. Each `main.tex` holds `\input{sections}`, and each draft has break rows in both files (for example medicine `main.tex:29` and `sections.tex:9`).
- C6, the two forms: partial. The `.docx` text equals the `.html` text, and the `.tex` text apart from `engineering/sections.tex:225` to `:248`. That range also holds two paragraphs that are not cases (Spec 11). I did not make the second `.docx` (see "Declined to judge").
- C7, the discipline and the genre: met. The keywords name the discipline ("software engineering", "geriatric medicine", "agroecology", "sociology"), and each draft has a title, an abstract and sections.
- C8, the clean text: unmet, Spec 1, 4, 6, 9 and 12.
- C9, the skip: met (Verify 3).
- C10, the check on the tree: met (Verify 1a, Verify 3). The first run of its loop half is missing (Spec 13).
- C11, the sentence: met. The paragraph is true of the changed command, and the form of the paragraph is under Standards 1.

## 1. Spec

1. The short drafts break "0. Hard rules / No repeated construction", the rule that all three must keep. Their own clean rows (`expected.md`, the "No repeated construction" rows of medicine, sciences and social) say "No sentence shape recurs across sections." The same sentence shape recurs across sections in each draft:
   - sciences `main.tex:35` "The survey covered one region, so the results may not apply to other climates." (Richness Method), `sections.tex:9` "The survey covered one season, so the pattern may differ in other years." (Activity Method) and `sections.tex:23` "The survey covered one region and one season, so the effect may differ elsewhere." (Discussion). The same three sentences are the Limitations clean rows.
   - sciences `main.tex:23` "The richness survey tested whether wider hedgerows held more ground beetle species." and `sections.tex:3` "The activity survey tested when ground beetles were most active." Each opens its methods section.
   - medicine `main.tex:23` "The trial tested whether mobilization within 24 hours of surgery reduced readmission within 30 days." and `sections.tex:3` "The cohort study tested whether the same effect appeared outside a trial." Also `main.tex:47` "Two patients had a heart attack within 30 days." against `sections.tex:21` "Three patients had a deep vein thrombosis within 30 days.", in Trial Results and Cohort Results.
   - social `main.tex:41` "Residents who lost a local office described a loss of voice.", `main.tex:45` "Residents who lost an office described a trip of 20 to 40 minutes to the new town hall." and `sections.tex:19` "Residents who lost a local office reported lower trust than the others ...". Also `main.tex:51` "The survey tested whether this pattern held in a larger sample." against `sections.tex:3` "The survey tested whether losing a local office lowered trust."
   - The same pairs also restate each other, which is "Reader's path / Clarity test" ("A paragraph whose removal loses nothing"): medicine `main.tex:33` and `sections.tex:29` (one hospital), social `sections.tex:11` and `:33` (registered residents only).
   - What is wrong: item 3 asks that the short drafts keep these rules in their whole text and hold no other break.
   - Failure scenario: at step 3 a right `/writing` report names "No repeated construction" or "Clarity test" in a short draft. The reader counts it as a false alarm, against a clean row the drafts do not keep.
   - Verdict: item 1, item 3 violated; C8 unmet.

2. Clean passages are the break sentence with the fault removed, which item 3 forbids ("never the break sentence with the fault removed, since two near-identical passages break 'Reader's path / Clarity test' and section 0's 'No repeated construction'"). The pairs:
   - `engineering/sections.tex:37` "With this setup complete, the harness submits the first task." against `:39` "The harness submits the first task after a warm-up." (the "Never open a paragraph by recapping" pair).
   - `:246` "Pinning keeps each cache warm and removes cross-core traffic. \textbf{The pool design is the strongest option for this workload.}" against `:248` "Pinning keeps each cache warm and removes cross-core traffic. The measured gain on the fourth host is 27 percent." (the bolded closer pair).
   - `:199` "The queue rejects a task with the status <left double quotation mark>full<right double quotation mark> when no slot is free." against `:149` "The queue rejects a task when no slot is free." (the Spec-sheet clean row).
   - `:195` "The fixed pool leverages every core of the host." against `:197` "Each worker owns one core of the host."
   - `:207` "Completion order is queue <rightwards arrow> worker." against `:209` "A task passes from the queue to a worker."
   - `medicine/main.tex:47` against `sections.tex:21`, as in Spec 1.
   - Failure scenario: a right report flags the clean member of a pair under "Clarity test" or "No repeated construction", and step 3 counts it as a false alarm.
   - Verdict: item 3 violated; C3 unmet.

3. The Voice clean rows describe procedures with "we", and the register says a procedure takes the passive. `skills/writing/references/registers.md`, the Voice headings of the Sciences, Engineering and CS and Medicine and Health, all say "A procedure takes the passive, since its actor is irrelevant. The authors' decisions, contributions and results take 'we'." The clean rows are:
   - sciences `main.tex:33` "We emptied the traps every 7 days from April to September."
   - medicine `main.tex:25` "We randomized 480 patients aged 65 years or older to early or usual mobilization."
   - engineering `sections.tex:75` "We implemented the producers in C."
   - Each row is expected "nothing reported (a decision with 'we' ...)". Emptying traps, randomizing patients and implementing producers are procedures.
   - The drafts also hold unlisted procedure sentences in "we":
     - sciences `main.tex:25` "We sampled 24 plots on 12 farms ...", which is also the Discipline exceptions clean row, and `sections.tex:5` "We sampled beetles along hedgerows."
     - medicine `sections.tex:5` "We reviewed the records of 310 consecutive patients ..." and `:13` "We adjusted for age, sex, comorbidity score and type of surgery."
     - engineering `sections.tex:51` "We repeated each run 30 times.", `:67` "we pinned workers per socket", `:69` "we randomized the run order", and `:111` "We computed the 99th percentile over all tasks of a run.", which is the Clarity test clean row.
   - Failure scenario: a report that applies the Voice rule's own words reports these sentences. Step 3 counts each one as a false alarm, three of them on rows written to test that the rule stays silent.
   - Verdict: item 3 violated; C3 unmet.

4. Each short draft's Conclusion states, without a hedge, the claim its own Discussion hedged. "Hedging / Hedge where a claim is uncertain" covers "A causal claim from correlational data" and "A generalization from a limited sample". The cases:
   - social `sections.tex:49` "Losing a local office lowers residents' trust in a merged municipality.", after `:31` "The interviews and the survey suggest that losing a local office lowers trust." The data are a survey and interviews, so this is a causal claim from correlational data.
   - sciences `sections.tex:39` "Hedgerows wider than 5 m support more ground beetle species on arable farms.", after `:23` names one region and one season.
   - medicine `sections.tex:43` "Early mobilization within 24 hours reduces readmission after hip fracture surgery in older adults.", after `main.tex:33` and `sections.tex:29` name a single hospital.
   - engineering `sections.tex:137` "Thread creation raises the tail because each creation blocks the producer." states without a hedge what `:127` hedged ("The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path."). It is the Cold opens clean row.
   - The engineering break row `:129` is this same shape.
   - Failure scenario: a right report flags each Conclusion. Step 3 counts four false alarms, three of them in drafts that must hold no break outside their register.
   - Verdict: item 1, item 3 violated; C8 unmet.

5. "Paragraphs / Evidence followed by what it means" has a break row whose shape recurs in passages the table does not list, and a clean row that does not keep the rule.
   - The break row is `engineering/sections.tex:97` "The growing pool was idle for 38 percent of each run. The fixed pool was idle for 4 percent.": two data sentences and no interpretation.
   - The same shape stands unlisted in medicine `main.tex:53` "Mortality at 90 days was 6 percent ... The RR was 0.75 (95% CI [0.39, 1.43]).", sciences `main.tex:47` "Species richness rose by 3.1 species ... Mean richness was 12.3 species per plot (SD = 2.1).", social `sections.tex:19` "... (mean 2.9 against 3.6, p below .001). The difference was 0.7 points on the 5-point scale." and engineering `:93` to `:95`.
   - The clean row `:87` "The growing pool created 248 threads during each run. Therefore, it spent 6 percent of each run creating them." follows the evidence with more evidence. It has no interpretation that "connects it to the paragraph's claim" (`references/rules.md`, the rule).
   - Failure scenario: a report that applies the rule as the break row does flags `:87` and the short drafts' results paragraphs, and step 3 counts each as a false alarm. A report that applies it loosely leaves `:97` unflagged, and step 3 counts a miss. No reading of the rule passes both rows.
   - Verdict: item 3 violated; C3 unmet.

6. The short drafts hold unlisted breaks that have the same shape as an engineering break row. Item 3 says a short draft "holds no break of another rule on its own".
   - medicine `sections.tex:13` "We adjusted for age, sex, comorbidity score and type of surgery." has four list-shaped items in paragraph form, the shape of the break row `engineering/sections.tex:163`.
   - social `sections.tex:23` "Trust did not differ by age. It did differ by years of residence." is a claim followed by no data, the shape of the break row `engineering/sections.tex:101` under "Paragraphs / Claim with evidence or citation".
   - Three paragraphs of more than one idea, which section D's "Paragraphs cover one idea" covers (the break row `engineering/sections.tex:215`):
     - sciences `main.tex:19` "Species richness is the number of species in a plot. We expected richness to rise with hedgerow width. A second survey recorded when beetles were most active."
     - social `sections.tex:13` "Losing an office was coded from the residents' registered address. The questionnaire was tested on 20 residents before mailing."
     - sciences `sections.tex:31` "Narrow hedgerows hold few species; wide hedgerows hold more. Farmers can plant wider strips at field edges.", which is the semicolon clean row.
   - sciences `main.tex:37` "The glycol killed the beetles quickly." uses "quick", which section A bans as filler, in its adverb form, where the concrete fact is a time.
   - Two transition paragraphs open on a "this" whose antecedent is a guess (section E, "Cold opens"):
     - medicine `main.tex:55` "The cohort study examined whether this effect appeared in routine care." follows the mortality paragraph, whose result is no effect.
     - social `main.tex:51` "The survey tested whether this pattern held in a larger sample." follows a paragraph about one participant's quote.
   - Failure scenario: each is a right finding in a draft whose table expects nothing there, so step 3 counts it as a false alarm.
   - Verdict: item 1 violated; C8 unmet.

7. Some break passages break a second rule that their row does not name. Item 3 requires "A break passage breaks its rule, and only its rule, unless its row names the second rule."
   - medicine `sections.tex:9` "The team ran into snags with the ethics forms." also breaks "Medicine and Health / Voice": "The team" is the authors in the third person.
   - engineering `sections.tex:21` "The scheduler hands each task to a worker, and it fails when the queue is full." joins two ideas with "and". That breaks "Concision / One idea per sentence", the same shape as its break row `:25`.
   - `:19` "The benchmark runs on a modern server. A harness thread submits the tasks." puts two ideas in one paragraph, and its second sentence contradicts `:27` ("eight producer threads").
   - `:211`, the semicolon break, is four sentences on four ideas (the queue, producers and workers, the harness stop, rejection), which breaks section D's one-idea bullet. Its "the producer retries later" also contradicts `:63` "The harness didn't retry a failed task."
   - `:213` "The cause is contention, not thread count. ..." is three ideas, and "The cause" has no antecedent.
   - `:119` "A statistical test compared the two latency distributions ..." does not name the test ("Precision / Most specific term").
   - `:183` "... which is exactly when a fixed pool pays off." uses a colloquialism ("Formality / No colloquial words").
   - `:246`, the bolded closer, also makes a claim with no evidence ("Objectivity / Claims rest on evidence").
   - Failure scenario: by `skills/writing/SKILL.md`, "Review agent prompt", a passage that breaks two rules stands once, in the first group. Where the unnamed rule comes first in that order, a right report groups the passage under a rule its row does not name, and step 3 counts a miss and a false alarm. Two such places:
     - medicine `:9` stays under Formality, since registers come last.
     - engineering `:21` would stand under Precision either way.
   - Verdict: item 3 violated; C3 unmet.

8. Three rows put a double break in the wrong group.
   - The mirror-structure break, `engineering/main.tex:27` to `:41`, holds `main.tex:29` "Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads." and `:37` "Park (2018) measured the cost of CAS and found a 12 percent loss at 32 threads." These are one sentence shape in two sections, which is "0. Hard rules / No repeated construction". That rule stands before section D in the review's order, yet the row expects the passage "Reported under D. Structure / No mirror structure".
   - The two "Wordy phrase" breaks, `sections.tex:29` and `:67`, are both "Due to the fact that X, Y", in two sections (Implementation, Throughput Method). That is again a repeated construction, which comes before "Common style errors".
   - The social Interview Method (`main.tex:23`) leaves out its limitations, and no other sentence of the draft acknowledges the interview study's limitations. The draft's limitation sentences, `sections.tex:11` and `:33`, are about the survey. That is "Objectivity / Limitations and alternative interpretations" ("The text acknowledges the limitations of the study"). Objectivity stands before "Reader's path" in `references/rules.md`. The row expects the passage under "Reader's path / So what per section". The same draft's clean row for the Limitations rule expects nothing.
   - Failure scenario: a right report groups each passage under the earlier rule, and step 3 reads it as a miss under the row's rule and a false alarm under the other.
   - Verdict: item 3 violated; C3 unmet.

9. The engineering draft holds unlisted places of rules whose rows name one narrow place.
   - "No repeated construction": `sections.tex:45` "The throughput study tested whether ..." and `:107` "The latency study tested whether ...". Also `:55` "The harness covered only x86 hosts, so the results do not extend to other architectures." and `:115` "The latency study covered one queue size only, so the results do not extend to larger queues." The row accepts only the four "We chose" sentences.
   - "Vary paragraph length": `.docx` paragraphs 46 to 59 are 14 consecutive one-sentence paragraphs, and 109 to 123 are 15 (the per-paragraph counts above). Both runs are more uniform than paragraphs 5 to 10, and the row accepts only 5 to 10.
   - "E. Sentence shapes / Passive voice": `main.tex:41` "a removed node may still be read by another thread" names its actor, the same reason the break row `:153` gives.
   - "Common style errors / Tense per section": `:85` "The difference is 24 percent of the growing pool's rate." is present tense inside Throughput Results, which the clean row calls past tense. The Implementation section, a methods section, is in the present tense throughout (`:3` to `:41`).
   - "Concision / One idea per sentence": `:57` "All runs used GCC 13.2 at optimization level 2 on Linux 6.5, and the random seed was 42." has the shape of the break row `:25`.
   - "Reader's path / So what per section", Literature review row ("Builds to the gap and does more than summarize."): the sections Lock-Based Queues and Lock-Free Queues only summarize and state no gap.
   - "E. Sentence shapes / Rhetorical questions": the clean row `main.tex:19` "Does a fixed pool lower the 99th percentile latency of a bounded queue?" is answered by Latency Results, not by the Introduction that asks it, while the rule's exception is "a question a section answers as its subject".
   - Failure scenario: a right report names these places, and step 3 counts each as a false alarm or a break not at its place.
   - Verdict: item 3 violated; C8 unmet.

10. `expected.md`, "Rules with no case": "'D. Structure / Three or more list-shaped items ... Lists are introduced with a colon': the part on the colon has no case, since a `.docx` draft made without a `<ul>` list holds no list." Item 3 lists the exceptions allowed, and this is not one of them. It also names the code-fence parts of section F as exceptions, so parts of a bullet count. A list can stand in the `.tex` form (`itemize`, a tex-only case like section F's) or in the `.html` as an `<ol>`, which the brief check found prints ASCII ("3. Premises" 6a).
   - Failure scenario: step 3 never tests whether `/writing` reports a list with no colon before it.
   - Verdict: C1 partial.

11. `engineering/sections.tex:227` "The pool is separate from the queue so that a stalled worker cannot block a producer." and `:231` "The pool size is set once at launch and never changes during a run." are not cases, yet they are left out of `draft.html`. Item 1 says "A case left out of the `.html` by item 3 is the only difference between the two forms."
    - Failure scenario: none for a row, since neither paragraph is listed. The two forms are not the same text, as the item says they are.
    - Verdict: C6 partial.

12. The engineering draft contradicts itself, and the contradictions invite findings at unlisted places.
    - `sections.tex:157` "The pool has two parts, the queue and the workers." against `:227` "The pool is separate from the queue ...".
    - `:235` "the pool size must not exceed the core count of the host", while the fixed pool runs 64 threads on hosts of 16 to 48 cores (`main.tex:23`, `sections.tex:5`). The same holds for `:7`, each worker pinned to its own core.
    - "The pool" stands alone in a draft with two pools (`:155`, `:157`, `:161`, `:231`). The row `:161` "The pool holds workers. The pool starts them at launch. The pool never adds another." is the synonym-cycling clean row, and it is false of the growing pool.
    - Failure scenario: a reviewer reports "The pool" under "Precision / Most specific term" or "No synonym cycling", at clean rows, and step 3 counts false alarms.
    - Verdict: C8 unmet.

13. The report's first run of C10 gives only the unchanged command on the tree ("The case paths do not exist on the unchanged tree, so the loop part has nothing to run on them"). The loop part runs on path strings, as the report's own C9 first run did. C10's loop half on the 17 case paths has no first run.
    - Failure scenario: none for the result, since C9's first run shows that the unchanged loop keeps every path. The report does not give the first run that the brief's "Cases" paragraph asks for.
    - Verdict: none.

## 2. Proof

1. `expected.md`, the social "D. Structure / Vary paragraph length" clean row says "Paragraphs of 1 sentence (26 of them), 2 sentences (11) and 3 sentences (2: paragraphs 2 and 8)".
   - My reading of `docx_paragraphs.py` on `social/draft.docx` gives 25 and 12. Paragraph 22, 'One participant said that the council "stopped listening." Others described the same experience in other words.', is two sentences.
   - The medicine row says "paragraphs 5 to 47" but counts paragraph 2 among its 3-sentence paragraphs.
   - The decision that rests on these: the brief has each whole-draft row state its count so that the reader of step 3 can check it. A wrong count makes that check fail on the row, not on the report.
   - Verdict: item 2 violated.

2. `expected.md`, "Rules whose clean row stands in a short draft": "Each short draft keeps all seven in its whole text". The builder's report, DONE row of item 3, says "Checked by reading each draft whole against the three pages".
   - My reading refutes both: "No repeated construction" is broken in all three short drafts (Spec 1), and the drafts hold the breaks of Spec 4 and 6.
   - The decision that rests on this: whether the short drafts can carry the seven clean rows that the ruling "Step 2, the brief check" placed there.
   - Verdict: item 3 violated; C8 unmet.

## 3. Standards

1. `docs/dev/building.md:25`, the rewritten paragraph after the block, is nine sentences, from "The last command is the ASCII check over every tracked file ..." to "... and nowhere else." The base paragraph (`git show f241b23:docs/dev/building.md`) was three.
   - What is wrong: `skills/repo-setup/templates/docs/dev/prose-standard.md`, section D: "Paragraphs cover one idea and stay under roughly four sentences; split anything longer or covering two." The builder's report (Verify 6) states the paragraph "is not split" because it holds one idea. The rule bounds the length as well as the idea count.
   - Failure scenario: the next `/refute` or `/writing` over `docs/dev/building.md` reports the paragraph, and the brief's line "every line is written to the standards pages" is not met by the one prose change of the step.
   - Verdict: item 4 violated.

2. `.scratch/3-the-writing-base/agents/reviews/2-report.md` cites a page by line number in its prose: "the text as the file reads now (lines 25 of `docs/dev/building.md`)" and "line 11 of `docs/dev/building.md` at HEAD".
   - What is wrong: `docs/dev/change-standard.md`, "Where the work happens": "A ledger file cites a page ... by its section, never by a line number". The exception for a brief's "Paths this step writes" does not cover a report's prose. The commands the brief dictates (`sed -n 11p`) are not at issue.
   - Failure scenario: after the next change to `docs/dev/building.md`, the pointer in the booked report names the wrong line.
   - Verdict: none.

## 4. Behaviour

1. `2-report.md`, "Host-visible changes, before and after", entry for `docs/dev/building.md` line 25: "After: the text as the file reads now (lines 25 of `docs/dev/building.md`), which adds that ...".
   - What is wrong: the after-text of the one user-visible prose change is paraphrased and pointed at, not stated. The rules file's rule 7 asks for "every user-visible change with the before and after". The before-text is quoted in full; the after-text appears only as five separate sentences under Verify 6.
   - Failure scenario: a reader of the booked report cannot see the paragraph as it now reads without opening the page at a line that will move.
   - Verdict: none.

## Declined to judge

- C6's second conversion: I ran no `textutil -convert docx` into a new folder, since my brief writes no file. I compared the `.html` text with each `.docx`'s printed paragraphs through `textutil -convert txt -stdout` instead, with no difference. The command that would settle the builder's exact claim is the builder's own: `textutil -convert docx draft.html -output <mktemp -d>/draft.docx`, then `diff` of the two `docx_paragraphs.py` outputs.
- The builder's first-run evidence `git log --oneline | head -1` printing `f241b23 ...`: it is a git command outside the three I run. `git log --oneline -1` would settle it.
- `git diff --stat` ("2 files changed, 3 insertions(+), 3 deletions(-)"): I did not run the `--stat` form. The full `git diff f241b23` shows three changed lines in two files, which agrees.
- Whether `/writing` reads "What the reader looks for" of Medicine and Health per methods section (so the Cohort Methods break at `medicine/sections.tex:1` is a break), or per paper (CONSORT is named at `main.tex:27`, so nothing is broken). The brief chose the per-section reading. Only step 3's run settles which one the review applies.
- The sciences draft uses "support" and "provide" in their ecological sense (`main.tex:8`, `:17`; `sections.tex:21`, `:25`, `:39`), words section E lists as spec-sheet voice for code. I judge a literal report on them unlikely, and I do not count it as a finding. Only step 3 settles it.
- The keywords line of each draft is four comma-separated items in paragraph form, which section D's list bullet could be read to cover. It is a manuscript convention, and I do not count it.
- I read all 177 rows of `expected.md`, all eight `.tex` files and all four `docx_paragraphs.py` outputs whole. No row was sampled or left unread. Whether `/writing` itself reports any of the places named above is for step 3. These findings say only that a right report could, by the rules' own words.

Reviewer usage: a1d4edc40c77a9221, claude-opus-5-5, 256176 tokens, 45 tool uses, 14 min 9 s.
