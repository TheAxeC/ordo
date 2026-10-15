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

## Repair round 1, refuted

```
$ git -C .agents/worktrees/3-the-writing-base-2 status --short
 M docs/dev/building.md
 M docs/dev/change-standard.md
?? .scratch/3-the-writing-base/agents/briefs/2-round-1.md
?? .scratch/3-the-writing-base/agents/reviews/2-refuter.md
?? .scratch/3-the-writing-base/agents/reviews/2-report.md

$ git diff f241b23 | grep -c '^+[^+]' ; git diff f241b23 | grep -c '^-[^-]'
5
3
(5 non-blank added lines plus 2 blank ones = the report's "7 insertions, 3 deletions", holds)

Round delta of files.txt: diff -u of the snapshot against the current docs/dev/building.md: the paragraph after the block is split into three paragraphs (4, 3 and 1 sentences); docs/dev/change-standard.md: no difference. The case folder differs in every file, read whole.
The report in the worktree and the main-ledger copy are identical (diff -q printed nothing).

Verify 1b (brief's printf form over building.md, change-standard.md and 2-report.md):
exit 0   (nothing printed before it)

Verify 1a, full command: its git ls-files form is not run (see Declined to judge). The same loop and perl over find . -path ./.git -prune -o -type f -print0 (leading ./ stripped) printed nothing.

Verify 2: diff <(sed -n 11p docs/dev/building.md) <(sed -n 75p docs/dev/change-standard.md); echo "diff exit $?"
diff exit 0

Verify 3, the loop on the 11 paths of brief item 4 plus the 17 case paths:
kept: .scratch/3-the-writing-base/agents/reviews/cases/x.md
kept: .scratch/archive/2-i-x/agents/reviews/2-run/.scratch/3-y/cases/z.md
kept: .scratch/3-the-writing-base/agents/briefs/2-cases.md
kept: skills/writing/cases/x.tex
kept: docs/cases/x.md
kept: cases/x.md
kept: .scratch/3-the-writing-base/plan.md
kept: README.md
(8 kept paths, none of the 17 case paths; git show f241b23:docs/dev/building.md | sed -n 11p holds one "if [ -e" loop, which keeps every path that exists)

Verify 4: docx_paragraphs.py <cases>/<draft>/draft.docx, exit 0 for each:
engineering 148 paragraphs, 2521 words; medicine 41, 677; sciences 43, 665; social 46, 733.
The four outputs quoted whole in the report's "Verify 4" section equal these outputs (compared after naming the non-ASCII characters in angle brackets: True for all four).

Verify 5: docx_paragraphs.py | LC_ALL=C grep -n '[^ -~]' ; LC_ALL=C grep -n '[^ -~]' <cases>/<draft>/*.tex
engineering docx paragraphs 107, 108, 120, 121, 124; engineering sections.tex lines 177, 179, 203, 205, 211; medicine, sciences, social: nothing, both forms. These are the five rows of expected.md (em dash, en dash, curly quotes, ellipsis, arrow character).

C6: textutil -convert docx draft.html into a fresh temp folder, then diff of the two docx_paragraphs.py outputs: diff 0 for all four drafts (temp folder removed).
html text (textutil -convert txt -stdout) against docx paragraphs: no difference for medicine, sciences, social; engineering differs only in the list-marker whitespace (a tab against a space) of the 8 list items.
.tex (main.tex with sections.tex at the \input line) against the docx paragraphs: medicine, sciences, social, the same text; engineering differs only in the 2 subsection headings and 8 paragraphs of expected.md's "not in the .docx" rows.
grep -c -E '<ul|&nbsp;|<table' draft.html: 0 for each; U+2022 count in word/document.xml: 0 for each; grep -c '<ol' engineering/draft.html: 2, grep -c '<li': 8.

C4, a scratch comparison of each row of expected.md (178 rows) with its quoted passage against the .tex line and the .docx paragraph it names: 0 misses. The multi-place and range rows and the heading rows were read by hand against sed -n output: all hold.
Row counts (awk over column 2 per section): engineering 70 break / 56 clean; medicine 6 / 11; sciences 4 / 12; social 7 / 12; 178 in all (the report: 178).
expected.md snapshot against now: 21 rows identical, 156 only in the snapshot, 157 only now: 155 changed, 1 removed, 2 added, as the report says (155 Before: and 155 After: blocks).
grep -o ';' */*.tex: engineering/sections.tex:215 6; medicine 1; sciences 1; social 1. grep -E ', not |not [a-z]+, ': engineering/sections.tex:217 (3), medicine/sections.tex:31, sciences/sections.tex:29, social/sections.tex:43.
Vary-paragraph-length rows recounted by my own split of docx_paragraphs.py output: medicine 17/8/3x6 = 31 body paragraphs, 7 to 53 words; sciences 16/13/4 = 33, 5 to 37; social 18/17/1 = 36, 7 to 38; engineering paragraphs 5 to 10 hold 32 29 29 30 30 29 words and 2 sentences each (rows reproduced).

The report's other quoted commands, rerun from <cases> in the same form: grep -n -i 'tested whether' (3 lines, one per short draft), 'Two patients|Three patients' (exit 1), 'Residents who' (1 line, social/main.tex:15), ', so ... may' (3 lines, one per short draft), 'covered' (exit 1), quickly (exit 1), '^This |^These ' (engineering/sections.tex:135 and :139), 'measured the cost' (engineering/main.tex:29), 'Due to the fact' (engineering/sections.tex:29), 'covered only|Only one queue' (:55 and :119), grep -w pool (the 8 lines the report lists), the hedge-word grep over the three short drafts' sections.tex, grep for page-by-line-number citations in the report (exit 1): all reproduce.
```

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: violated, Spec 1, 2, 3, 4, 5, 6, 7, 8 and 9. The four folders hold main.tex, sections.tex, draft.html and draft.docx, each states its discipline and names no venue, and the two forms hold the same text apart from the .tex-only cases. The short drafts and the engineering draft still hold breaks and near-copies their rows do not list.
- 2: violated, Proof 1. expected.md has the columns, the two sentences word for word (sed -n 3,4p), the rules with no case (the colon part of the list bullet is now cased) and the short-draft clean rows; the social binary-contrast count is not reproduced.
- 3: violated, Spec 1 to 9.
- 4: holds. Verify 1b, Verify 2 and Verify 3 above; the command is the brief's word for word in both pages; the paragraph after the block is now three paragraphs of 4, 3 and 1 sentences, one idea each, with every fact of the old paragraph kept (Standards 1 is a sentence-length remark only).

Cases of the brief's "Cases":

- C1, the rule list: met. I read the 37 rules of the prose standard, the 23 headings of references/rules.md and the 16 of references/registers.md against the 178 rows; each has a break and a clean row or a named exception, and the colon part of section D's list bullet now has both (engineering/sections.tex:229 to :236 and :240 to :247).
- C2, the other registers: met. Each of the 12 headings of the three short drafts has a break and a clean row in its section.
- C3, each passage against its rule: unmet, Spec 1, 2, 3, 4, 5, 6, 7, 8 and 9.
- C4, the places: met (the 178-row comparison above, plus the multi-place rows by hand).
- C5, the \input file: met. grep -n '\\input' <cases>/*/main.tex holds \input{sections} in all four, and each draft has break rows in main.tex and in sections.tex.
- C6, the two forms: met (the second conversion and the three comparisons above).
- C7, the discipline and the genre: met. Keywords name software engineering, geriatric medicine, agroecology and sociology; each draft has a title, abstract and sections.
- C8, the clean text: unmet, Spec 1, 2, 3, 4, 5, 6, 7, 8 and 9.
- C9, the skip: met (Verify 3).
- C10, the check on the tree: met. Verify 1b and the find-based run print nothing; the loop keeps none of the 17 case paths; the report's first run of the base loop (Spec 13 of the first review) is given in its section 17 and agrees with the base command, which keeps every path that exists. The git ls-files form is declined.
- C11, the sentence: met. The paragraph is true of the changed command.

Closure of the 17 rulings of the round brief:

- 1 (repeated construction in the short drafts): not closed, Spec 4.
- 2 (unhedged conclusions): closed. The four named lines carry a hedge (social/sections.tex:49, sciences/sections.tex:35, medicine/sections.tex:37, engineering/sections.tex:141), and a reread of every Discussion and Conclusion line found no further causal or generalizing claim without one.
- 3 (unlisted breaks in the short drafts): closed except the paragraph of sciences/main.tex:19, Spec 8.
- 4 (counts): the two named counts are corrected and reproduce; the social binary-contrast count does not reproduce, Proof 1.
- 5 (Voice): not closed, Spec 3.
- 6 (evidence followed by what it means): not closed, and the fix adds new breaks, Spec 1.
- 7 (near-copies): the six named pairs are closed; two adjacent pairs and one restating clean row remain, Spec 2.
- 8 (second rule of a break passage): the eight named places are closed; Spec 9 is a new place of the same kind.
- 9 (the group of a double break): the Wordy-phrase pair and the social limitations are closed; the mirror-structure sentence shape is only partly closed, Spec 5.
- 10 (unlisted places in engineering): the named places are closed; Spec 6 lists places of the same kind that remain or are new.
- 11 (contradictions): closed. The core counts (96 to 192 cores, pool of 64, 248 created threads plus 8 started equals the cap of 256) agree, the "pool" sentences all name their pool or mean both, and the synonym-cycling clean row names the fixed pool.
- 12 (list colon): closed, rows and paragraphs 133 to 143 read.
- 13 (the two forms): closed, paragraphs 144 and 145 are in both forms.
- 14 (building.md paragraph): closed.
- 15 (cite by section): closed, the report's grep for line-number citations exits 1.
- 16 (before and after of building.md): closed, the section "Host-visible changes, before and after" quotes the three paragraphs in full.
- 17 (first run of C10's loop half): closed, section 17 of the repair round gives the 17-path run.

No ruling was closed by removing a check; the one row removed (the second Wordy-phrase break) is the option the ruling allowed, and 2 rows were added. No fix reaches beyond its finding.

### Findings

Spec

1. Ruling 6 is not closed, and its fix adds new breaks of "E. Sentence shapes / Restating closes". Heading: spec.
   - New restating closes. engineering/sections.tex:91, the Transitions clean row (paragraph 64): "Creating them therefore took 6 percent of each run. Thread creation took time that the growing pool could not spend on tasks." The last sentence says the one before in other words. engineering/sections.tex:95: "...was the highest value that any run of the study produced. That value set the upper end of the throughput range." The same. engineering/sections.tex:125: "The fixed pool lowered the 99th percentile latency from 410 to 190 microseconds. The tail of the growing pool was more than twice as long." The prose standard, section E, "Restating closes": a final sentence that says the paragraph again in shorter words. The break row of the rule is sections.tex:145 ("In short, pinned workers keep their caches.").
   - Evidence still not followed by what it means, in paragraphs the round brief named or implied: medicine/main.tex:43 "Each group held 240 patients. All 480 patients completed follow-up and entered the analysis." sciences/main.tex:49 "Plots wider than 5 m held 16 species on average. That mean exceeded the overall mean of 12.3 species by 3.7 species." social/main.tex:43 "...as their main cost. Six of them said that the trip kept them from visiting at all." social/main.tex:45 "...described the merger in neutral terms. Their answers named no change in their contact with the council." In each, the last sentence is more evidence. The clean row (sections.tex:89) shows the standard: its last sentence says what the figures mean for the claim. The report says "Each last sentence is a conclusion, an interpretation or a consequence of the evidence in its paragraph"; this does not reproduce for these four.
   - Failure scenario: a right report applies "Restating closes" at engineering paragraphs 64, 68 and 81 and "Evidence followed by what it means" at the four short-draft paragraphs, all in text the table expects nothing for; step 3 counts each as a false alarm, and the Transitions clean row is among them.
   - Verdict: items 1 and 3 violated; C3 and C8 unmet.

2. Ruling 7 is closed for the six named pairs; the same fault stands in three more places. Heading: spec.
   - engineering/sections.tex:270 and :272 (.tex only), adjacent: "Pinning keeps each cache warm and removes cross-core traffic. \textbf{The fixed pool design is the strongest option for this workload.}" and the clean row "Workers stay on their cores and keep their caches warm. The measured gain on the fourth host is 27 percent." The clean paragraph's first sentence says the first sentence of the break paragraph again, with the bold sentence replaced by a figure.
   - engineering/sections.tex:139 and :141, adjacent: "This raises the tail. A fixed pool avoids both effects." and the Cold opens clean row "Thread creation may raise the tail because each creation blocks the producer." The clean sentence is the break sentence with its pronoun resolved and a hedge added.
   - engineering/sections.tex:165, the synonym-cycling clean row, "The fixed pool holds 64 workers. The fixed pool starts them at launch. The fixed pool never adds another.", says what sections.tex:5 and :17 already say (64 workers at launch, never changed).
   - Brief item 3: a clean passage "is never the break sentence with the fault removed, since two near-identical passages break 'Reader's path / Clarity test'".
   - Failure scenario: a right report flags the clean paragraph of a pair under "Reader's path / Clarity test" (removal loses nothing), and step 3 counts a false alarm on a row expected to be silent.
   - Verdict: item 3 violated; C3 unmet.

3. Ruling 5 is not closed: a procedure in "we" remains that the reread was told to find. Heading: spec.
   - sciences/main.tex:17: "We surveyed ground beetles along hedgerows of different width." references/registers.md, "Sciences (Natural, Applied) / Voice": "A procedure takes the passive, since its actor is irrelevant." The builder rewrote "We sampled beetles along hedgerows." to the passive for the same reason (sciences/sections.tex:5), and listed this sentence as a contribution. social/main.tex:17 "We studied residents of two towns that merged in 2019." falls under "Social Sciences / Voice": "A procedure takes the passive where the participants or the instrument matter." (the residents are the participants). The abstracts' "We tested whether" (medicine, sciences) and "We examined" (social) state the aim and are not counted.
   - Failure scenario: a right report applies the Voice rule's own words at these lines; step 3 counts false alarms in drafts that must hold no Voice break except the listed one.
   - Verdict: item 3 violated; C3 and C8 unmet.

4. Ruling 1 is not closed: sentence shapes still recur across sections of the short drafts. Heading: spec.
   - sciences/main.tex:53 "Richness did not depend on farm size (r = 0.12, p = .58). Farm size was an unlikely source of the width effect." and sciences/sections.tex:17 "Activity did not differ between hedgerows of different width (F = 0.8, p = .45). Hedgerow width was unlikely to shift the timing of activity." Same two-sentence skeleton in Richness Results and Activity Results.
   - social/main.tex:39 to :45, four consecutive paragraphs of one template (a participant group, a verb of saying, a finding; then a second sentence led by "All nine", "Six of them" or "Their answers"): "Nine participants described the merger as a gain in services. All nine lived..." / "Participants without a local office named a trip... Six of them said..." / "Participants who kept an office nearby described the merger in neutral terms. Their answers named...".
   - The report's evidence is greps for the shapes the first review named ("tested whether", ", so ... may", "Residents who"), which cannot find these.
   - prose standard, section 0, "No repeated construction": a sentence shape that recurs across entries or sections is a template. The clean rows of these two drafts say "No sentence shape recurs across sections."
   - Failure scenario: a right report names "No repeated construction" in sciences and social, against clean rows that expect nothing.
   - Verdict: item 1 and item 3 violated; C3 and C8 unmet.

5. Ruling 9, the mirror-structure sections, is partly closed. Heading: spec. engineering/main.tex:29 "Smith (2019) measured the cost of that mutex and found a 40 percent loss at 32 threads." and :37 "Park (2018) reported a 12 percent loss for CAS at 32 threads." The literal "measured the cost of Y and found Z" now stands once, but the skeleton (author and year, a verb of reporting, an N-percent loss, at 32 threads) still recurs in the two sections. A right report names "No repeated construction" at :37, which stands in group 0 before the row's "D. Structure / No mirror structure"; the row expects the passage to be reported only under D. Failure scenario: step 3 reads a finding in the earlier group at a place the row does not list as a false alarm. Verdict: item 3 violated; C3 unmet.

6. Unlisted places in engineering of rules whose rows name one place (the kind ruling 10 removed). Heading: spec.
   - sections.tex:129 to :272, the Discussion, states neither a connection back to the gap nor what the study adds; `grep -i 'gap\|adds\|extend\|earlier\|prior'` over those lines finds only unrelated "adds"/"new". "Reader's path / So what per section", Discussion row: "Connects back to the gap and states what the study adds to what was known." This round the three short drafts' Discussions each gained such a sentence. The row names only Latency Results (break) and Throughput Results (clean).
   - sections.tex:105: "The latency study applied the same two pools to the tail of the latency distribution." A section-end sentence about the next study, the form the builder removed from the three short drafts, and the shape of "C. ... Never describe what the page is about to do" (break row :135).
   - sections.tex:131: "Why does a fixed pool lower the tail latency? The results suggest that a fixed pool lowers tail latency by removing thread creation from the request path." (Rhetorical-questions and Hedging clean row). Its first sentence is a question, so "Paragraphs / First sentence states the point" applies, the shape of the break row :53.
   - sections.tex:255: "The value of 64 was set below the 96 cores of the smallest host so that the producers and the queue keep cores of their own." 26 words, against the Sentence-length break row :95 (30 words) and clean row :93 (17 words); section E: under roughly 20 words unless the mechanism needs more.
   - Failure scenario: a right report names these places, and step 3 counts misses and false alarms against rows that list neither.
   - Verdict: item 3 violated; C3 and C8 unmet.

7. medicine/sections.tex:1 to :11, Cohort Methods (paragraphs 23 to 28), breaks "Reader's path / So what per section", Methodology row ("Shows rigor and acknowledges limitations upfront"), a rule its row does not name. Heading: spec. The section holds "Records were incomplete for 18 patients, who were excluded." and no sentence acknowledging a limitation, while the builder added one to every other methods section (medicine/main.tex:33, sciences/main.tex:35 and sections.tex:9, social/sections.tex:11, engineering/sections.tex:55 and :119) and keeps the social Interview Method as a listed double break for the same fault. Reading-dependent: the exclusion sentence could be read as acknowledging a limitation. Failure scenario: a right report adds "So what per section" at Cohort Methods, a group before the Medicine register's; step 3 counts it a false alarm and the row's group a miss. Verdict: item 3 violated; C3 unmet.

8. Ruling 3, paragraphs of more than one idea (section D, "Paragraphs cover one idea"). Heading: spec. sciences/main.tex:19, which the ruling named: "Species richness is the number of species in a plot. We expected richness to rise with hedgerow width." One of three ideas was removed; a definition and a hypothesis remain. medicine/main.tex:49 (new, from ruling 6): "Length of stay did not differ between the groups, with a median of 7 days in each. Mortality at 90 days was 6 percent after early mobilization and 8 percent after usual care (RR 0.75, 95% CI [0.39, 1.43]). With an interval that included 1, the trial left the effect on mortality open." Two outcomes in one paragraph, with the meaning sentence covering one. Failure scenario: a right report names both paragraphs under the one-idea rule at places the tables do not list. Verdict: item 1 violated; C8 unmet.

9. sciences/sections.tex:15, the Register break row: "We were delighted to find a rare ground beetle in the third hedgerow." It also breaks "Precision / Most specific term" ("a rare ground beetle" names no species, where the field has the species name), a rule that stands before the registers in the review's order. The row expects the passage under "Sciences (Natural, Applied) / Register" and names no second rule (brief item 3: a break passage breaks only its rule unless its row names the second rule, with the group the review's order gives). Failure scenario: a right report groups it under Precision; step 3 counts a miss under the Register group and a false alarm under Precision. Verdict: item 3 violated; C3 unmet.

Proof

1. expected.md, social, "D. Structure / Binary contrast ... at most twice per page" clean row: "Count: 1 binary contrast in the draft." social/sections.tex:23, "Trust did not differ by age (r = .04, p = .41) but rose with years of residence (r = .18, p below .001).", is a second "not X but Y" contrast; the report counted with `grep -n -o '[^.]*, not [^.]*\.'`, which cannot find the "but" form. The count that a decision rests on (the clean row holds while it is at most 2) is 2 by my read, so the row still holds; the stated count is wrong. Failure scenario: the reader of step 3 recounts, gets 2 against the row's 1, and cannot tell whether the row or the draft is wrong; any further "but" contrast added later passes the stated count and breaks the limit. Verdict: item 2 violated.

Standards

1. docs/dev/building.md, section "Building and checking Ordo", first paragraph after the block: "Those files hold the drafts the `/writing` gate runs on and their expected results, and the drafts must hold the characters the prose standard bans." In this round two short sentences (as in the snapshot) were joined into one 25-word sentence with two ideas joined by "and". skills/repo-setup/templates/docs/dev/prose-standard.md, section E, "Sentence length": under roughly 20 words unless the mechanism needs more; the brief's Verify 6 asks each departure to be named with its reason, and the report's Verify 6 names only the 31-word sentence. Low weight; the paragraph is within four sentences and the facts are kept. Failure scenario: the next `/writing` or `/refute` over the page reports the sentence. Verdict: none.

Behaviour

none.

### Declined to judge

- Verify 1a with `git ls-files -coz --exclude-standard`, and the report's `git log` and `git diff --stat` lines: git commands outside the three I run. `sed -n 11p docs/dev/building.md > <file> && sh <file>` run from the worktree root would settle the first; I ran the same loop and perl over a find listing and over the brief's printf list instead, and both printed nothing.
- Whether `/writing` reads Medicine and Health "What the reader looks for" per methods section (so Cohort Methods breaks it) or per paper (CONSORT is named at medicine/main.tex:27); step 3's run settles it. Spec 7 depends on the per-section reading the brief chose.
- Figures that contradict each other in the drafts, which no prose rule reports: engineering/sections.tex:49 "Each task spent 200 microseconds on the CPU." against a 99th percentile latency of 190 microseconds (sections.tex:125), engineering/sections.tex:155 "It logs one line per run." against :207 "for each rejected task", and social/main.tex:39 to :45 (15 and 9 of 24 participants leave none for the group in neutral terms). Whether step 3 reports any of them is for step 3.
- The keywords line of each draft (four comma-separated items in paragraph form), and "A total of" and "support"/"hold" in the sciences draft: I do not count them as findings; only step 3 settles them.
- Whether a right report counts the abstracts' "We tested whether ..." and "We examined ..." as procedures (Spec 3 leaves them out).
- I read all 178 rows of expected.md, all eight .tex files, the four .html files by their textutil text, and the four docx_paragraphs.py outputs whole. No row was sampled.

Reviewer usage: a7a8c86524ffc2678, claude-sonnet-5-5, 358931 tokens, 78 tool uses, 17 min 29 s.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

The first run:

- Spec 1 (repeated construction in the short drafts): closed in round 1 for the shapes the run named (ruling 1); the shapes the run over round 1 found (its Spec 4) were fixed at landing, below.
- Spec 2 (near-copies): closed in round 1 for the six named pairs (ruling 7); the three places of its Spec 2 were fixed at landing, below.
- Spec 3 (Voice): closed in round 1 for the named lines (ruling 5); the two lines of its Spec 3 were fixed at landing, below.
- Spec 4 (unhedged conclusions): closed in round 1 (ruling 2), confirmed by the run over round 1.
- Spec 5 (evidence followed by what it means): closed in round 1 for the named paragraphs (ruling 6); the paragraphs of its Spec 1 were fixed at landing, below.
- Spec 6 (unlisted breaks in the short drafts): closed in round 1 (ruling 3) except `sciences/main.tex:19`, fixed at landing (its Spec 8).
- Spec 7 (a second rule a break passage breaks): closed in round 1 (ruling 8); the Register break of its Spec 9 was fixed at landing.
- Spec 8 (the group of a double break): closed in round 1 (ruling 9); the remaining shape of its Spec 5 was fixed at landing.
- Spec 9 (unlisted places in engineering): closed in round 1 (ruling 10); the places of its Spec 6 were fixed at landing.
- Spec 10 (the list colon), Spec 11 (the two forms), Spec 12 (contradictions), Spec 13 (the first run of the loop): closed in round 1 (rulings 12, 13, 11 and 17), confirmed by the run over round 1.
- Proof 1 (counts): closed in round 1 (ruling 4); the binary-contrast count of its Proof 1 was fixed at landing.
- Proof 2 (the short drafts keep the seven whole-draft rules): closed with Spec 1, 5 and 6 of this run, in round 1 and at landing.
- Standards 1, Standards 2, Behaviour 1: closed in round 1 (rulings 14, 15 and 16), confirmed by the run over round 1; the sentence of its Standards 1 was fixed at landing.

The run over round 1, each fixed at landing on main in `.scratch/3-the-writing-base/cases/` (both forms, each `draft.docx` made again with `textutil -convert docx` from its `draft.html`) or in `docs/dev/building.md`:

- Spec 1: `engineering/sections.tex:91` now closes "Thread creation alone thus explains only part of the 24 percent gap."; `:95` closes "A fixed pool may therefore scale with the core count of its host."; `:125` closes "The result confirms, for these hosts, the expectation that a fixed pool lowers the tail."; `medicine/main.tex:43` gains "With no loss to follow-up, attrition cannot account for the difference in readmission."; `sciences/main.tex:49` closes "Richness therefore kept rising at the wide end of the width range."; `social/main.tex:43` and `:45` close with what the evidence means for contact with the council.
- Spec 2: `engineering/sections.tex:272` (the clean row of "No dramatic bolded closers") now holds the temperature record of each host; `:141` (the Cold opens clean row) now says that a new thread of the growing pool starts on a cold core; `:165` (the synonym-cycling clean row) now places the fixed pool on cores 9 and above, which no other sentence says.
- Spec 3: `sciences/main.tex:17` reads "The present survey related ground beetle richness to hedgerow width."; `social/main.tex:17` reads "The study followed residents of two towns that merged in 2019."
- Spec 4: `sciences/sections.tex:17` reads "The timing of activity showed no link to hedgerow width (F = 0.8, p = .45). Width thus appeared to shape how many species a plot held and to leave their season of activity unchanged."; `social/main.tex:41` to `:45` now open with three different shapes.
- Spec 5: `engineering/main.tex:37` reads "At 32 threads, the measurements of Park (2018) put the loss from CAS at 12 percent."
- Spec 6: `engineering/sections.tex:131` opens "The study adds what the earlier queue studies left unmeasured: the fixed pool lowered the tail latency on every host.", so the Discussion connects back to the gap and the paragraph's first sentence states its point before the question; `:105` reads "No worker crashed in any throughput run, so no run lost part of its pool."; `:255` is two sentences of 13 and 11 words.
- Spec 7: `medicine/sections.tex:5` gains "Their exclusion may have biased the cohort toward patients with complete nursing notes."
- Spec 8: `sciences/main.tex:19` reads "Species richness, the number of species in a plot, was expected to rise with hedgerow width."; `medicine/main.tex:49` holds the two secondary outcomes as one idea, closing "The trial thus gave no evidence that early mobilization changed either secondary outcome."
- Spec 9: `sciences/sections.tex:15` names the species: "We were delighted to find Carabus auratus in the third hedgerow."
- Proof 1: `social/sections.tex:23` reads "Trust rose with years of residence (r = .18, p below .001) and showed no link to age (r = .04, p = .41).", so the draft holds the one binary contrast its row counts.
- Standards 1: `docs/dev/building.md`, section "Building and checking Ordo": the 25-word sentence is now two sentences in a paragraph of its own about the `cases/` folders.
- Three contradictions the run named under "Declined to judge" were fixed with them, since the brief asks for none: a task's CPU time is now 100 microseconds (`engineering/sections.tex:49`), below the 190-microsecond 99th percentile; the harness logs one line per run and one per rejected task (`:155`), as `:207` says; six participants saw better services (`social/main.tex:41`, `social/sections.tex:43`), so 15, 6 and 3 make the 24.
- `expected.md`: 17 lines changed, the rows quoting the passages above and every count: engineering 2574 words (6 semicolons, 2.33 per 1000), medicine 697 (1.43 per 1000), sciences 672 (1.49 per 1000), social 737 (1.36 per 1000), and the vary-paragraph-length rows of medicine (16, 8 and 7 paragraphs of 1, 2 and 3 sentences, 7 to 48 words) and sciences (17, 12 and 4, 5 to 37 words). Every single-place row's passage was compared with its `.tex` line and its `.docx` paragraph (133 held, the 16 heading rows checked by hand, 29 multi-place rows unchanged), each draft keeps its paragraph count (148, 41, 43, 46), and no draft holds a run of five same-length sentences apart from the engineering break row.
