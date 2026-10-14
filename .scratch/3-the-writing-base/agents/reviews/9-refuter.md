# Step 9 refuter report (on .agents/worktrees/3-the-writing-base-9, base 1077fe4)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All commands below were run from the worktree root, /Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-9, unless a line says otherwise.

```
$ git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/reviews/9-report.md

$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/9-report.md | xargs -0 sh -c '...' sh | xargs -0 perl -CSD -ne '...'; echo "charset exit $?"     (brief check 1, run verbatim as the brief gives it)
charset exit 0

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary     (brief check 2)
ok: the plan-terms block equals the template

$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "grep exit $?"     (brief check 3)
grep exit 1          (no line printed)

$ git diff --stat 1077fe4 skills/writing
 skills/writing/SKILL.md            | 76 ++++++++++++++++++++++----------------
 skills/writing/references/rules.md |  9 ++++-
 2 files changed, 52 insertions(+), 33 deletions(-)

Commands the builder's report quotes, rerun:
$ awk '/^## Open items/{f=1} /^## Closed items/{f=0} f' .scratch/3-the-writing-base/orchestrator-state.md
## Open items (only what the user must rule on: ...)
none
$ LC_ALL=C grep -n '[^ -~]' <the four files>; echo "charset exit $?"
charset exit 1       (nothing printed)
$ grep -n -E '[^[:space:]] -{1,2} ' <the four files>; echo "dash exit $?"
dash exit 1          (nothing printed)
$ grep -n 'version:' skills/writing/SKILL.md
5:  version: "1.0.0"
$ git diff 1077fe4 --quiet skills/writing/references/registers.md; echo $?
0
$ git diff -U0 1077fe4 skills/writing | grep '^+' | grep -v '^+++' | grep -n -E 'HCC|CNN|MRI|ConvNeXt|AUPRC|paragraph [0-9]+|\.tex:|main\.tex|8-run|step [0-9]|plan 3|ordo'
47:+- A `.docx` draft is read from paragraph 1.
$ wc -l <the four files>
     252 skills/writing/SKILL.md
     228 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     369 .scratch/3-the-writing-base/agents/reviews/9-report.md
$ grep -c -E '\| (1\.3|4\.1|5\.3|7\.2|8\.1|12\.[1-9]|2a|5a|6a|9a|15a) \| .*\| right \| right \|$' 8-marks.md     (in the main checkout's agents/reviews/)
19
$ awk '/^=== 5\./{f=1} /^=== 6\./{f=0} f' 8-run/grant-report.md | grep '^Place:'
Place: paragraph 42
$ grep -n -E '\\title\{|\\begin\{abstract\}|\\input\{sections/abstract' main.tex     (in the manuscript copy)
45:\title{HCCNet: A Self-Supervised CNN-Transformer for Disease Prognosis from Longitudinal 3D MRI, with a Case Study on Hepatocellular Carcinoma}
47:%\title{HCCNet: A CNN-Transformer for Accurate Disease Prognosis from Longitudinal 3D MRI Images: -- A Case Study on Hepatocellular Carcinoma Prediction}
96:\begin{abstract}
97:\input{sections/abstract/abstract}
$ python3 -I skills/writing/templates/docx_paragraphs.py <grant copy> | per paragraph grep -o -i -E '\b(we|our|us|the applicant)\b'
31: the applicant,The applicant,
35: We,the applicant,
46: The applicant,
(paragraph 31 holds "Computing is provided by the host institution at no cost, so none is requested.")
Word count of each added sentence over 20 words (python3 -I over the added lines of git diff -U0 1077fe4 skills/writing): 21, 29, 24, 28, 29, 21, 26, 25, 21, 23, 30, 21, 23, 25, and for operations O1 to O15: 21, 28, 31, 31, 28, 26, 25, 27, 31, 26, 22; rules.md: 22, 25, 29. These equal the builder's counts.
```

The builder's quoted `git rev-parse --short HEAD` was not run (see "Declined to judge").

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The old sentence "It ends the break and keeps every claim and clause ..." is replaced by "It ends every break the passage holds: ...", "The text it writes breaks no rule ..." with the seven general items, and "It keeps every claim and clause of the passage that a rule the finding names does not cut." The five "the named rule" sentences now read "a rule the finding names". The length sentence is replaced by three bullets, the last being "No sentence it writes is as long as a sentence the report names as over that rule." See Standards 1 and 5.
- 2: holds. The examples now include the size and degree words, and "is one, listed there or not" is kept. See Standards 3.
- 3: holds. The bullets "The replacement of a word of frequency ...", "The bracket for such a word asks for that share or count and for no other quantity, such as a size." and "A bracket holds "or" only where each alternative, supplied alone, keeps the claim's scope." replace the two old bracket sentences. See Standards 2.
- 4: holds. The exception "unless the named rule changes the name, as "Most specific term" does" is kept, and the two sub-bullets on the same set and on a word the draft uses for another thing are added.
- 5: holds. In `references/rules.md`, "Terms defined at first use", the old sentence is split into the `.tex` sentence (reading starts at the main file's first line, the title included), the `.docx` sentence, and "A claim that a use is the first is checked against every earlier use."
- 6: holds. In `references/rules.md`, "Vague language", two bullets after the table: the widened rows "many studies" and "some researchers", and "Every other row covers its own phrase only."
- 7: holds. The "robust" exemption is rewritten as the brief dictates.
- 8: holds. The bulleted checks become 15 numbered operations, each with its part in parentheses. The condition sentence is widened to cover a split of a sentence and moved to the replacement bullets. The rewrite limit, the still-breaks line and the drop rules are kept. See Spec 1, Standards 4 and Standards 6.
- 9: holds. In "How you group them", the loss line, the place line, the no-claim line naming the cost at that place, and the rewrite line are added.

Cases of the brief's "Cases":

- C1: met. The reading takes each row of fix 1's list against the new replacement bullets: a voice or tense change (1.2, 13.1, 3.5, 7.1, 13.11, 14.6) breaks the item on unnamed tense or voice changes; a size word breaks the vague-qualifier item; long sentences (grant 2f, 2h, 7a, 8g, 8i, 8j, 12a, 13a, 16a, 16b, 16j, 16t, 16u) break the sentence-ending bullet and its naming bullet. Grant 11c, 11d, 11e and 7b break "No sentence it writes is as long as ...", since the grant report names a 28-word sentence as over the rule ("Also breaks: prose standard, section E, "Sentence length" (28 words, citations excluded)", `8-run/grant-report.md`).
- C2: met. The new examples sentence names "markedly", "largely", "essentially", "considerably", "repeatedly", "increasingly" and "predominantly", and the list item "a vague qualifier, a word of size or degree included" covers "closely", "clearly", "at most marginal" and the like.
- C3: met. 5.5 and 5.11 break "asks for that share or count and for no other quantity, such as a size". 5.20's second alternative, supplied alone, leaves "were driven by imaging modality" universal, so it breaks the bracket-"or" bullet. Grant 2a's brackets ask for the share of cases and break none.
- C4: met. Grant 2e and 16h ("serial MRI studies" for "serial scans") break the same-set sub-bullet. Manuscript 11.4 and 13.13 break "The new name is a word that the draft does not use for another thing", and under fix 7 they are not reported.
- C5: met. `main.tex:45`, the title, precedes `main.tex:96`, the abstract (rerun above), so under the new `.tex` sentence the title is the first use. The group 6 line breaks "A claim that a use is the first is checked against every earlier use." See "Declined to judge" for what this does to the replacement.
- C6: met. 5.6 ("many existing approaches") and 5.9 ("some ... studies") fall under the widened rows. 3.3 ("recent studies") falls under "Every other row covers its own phrase only." "some patients" is not covered, since patients are no published work.
- C7: met. "robust performance estimates" from stratified cross-validation is "an estimate ... insensitive ... to the partition of the data" (the domain question is under "Declined to judge").
- C8: partial. Operations 1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 14 and 15 reach their rows. The eight findings at grant paragraph 42 stay: their passages outside the split forms are different sentences (`grep -A2 '^Place: paragraph 42$'` over `8-run/grant-report.md`). Missing parts: the rows of a rule named on an "Also breaks" line (manuscript 3.3, Methodology 57; grant 1b, 17a), see Spec 1; and grant 4a's reason (2), see Spec 2.
- C9: met. The eight lines break the loss line or the rewrite line, and group 6 and group 15 also break "The loss holds in the draft's own text and data". Group 1's line becomes the place form `sections/abstract/abstract.tex:5`, and group 2 keeps paragraph 34 with its stated loss.
- C10: met. 7.2, 8.1, 12.1 to 12.9 and grant 2a, 5a, 6a, 9a and 15a keep their form under the changed text. 4.1 (a 40-word passage sentence kept at 40 words) and 5.3 (a 26-word passage sentence written as 32 words) are now asked in another form by the sentence-ending bullet and its naming bullet, as the builder's report says. Manuscript 1.3 is under "Declined to judge".

## 1. Spec

- `skills/writing/SKILL.md`, "The review agent's prompt", "The last pass", operations 4 and 6: "4. Quote to yourself the words of the rule or table row the finding names that describe the passage, and read each exception of that section against the passage ("What you report")." and "6. Read the passage against each section of the prose standard, the rules page and the registers page, and list each other rule it breaks ("A finding")."; what is wrong:
  - Operation 4 is singular ("the rule ... the finding names"). Fix 1 makes a rule on an "Also breaks" line "a rule the finding names", yet operation 4 does not say it applies to each such rule.
  - Operation 6, which adds new "Also breaks" rules, runs after operation 4, so no operation reads a newly listed rule's words against the passage.
  - The rows fix 8 claims to cover with operation 4 are "Also breaks" lines whose words did not describe the passage: manuscript 3.3 and Methodology 57, and grant 1b and 17a, with 8j's antecedent line and 2e's synonym line beside them. The old pass item had the same singular form ("The named rule's own words describe the break") and these rows passed it.
  - The order 4 then 6 is the brief's. The singular wording is in the brief ("the named rule or table row") and in the builder's text.

  Failure scenario: on grant paragraph 35 "If it does, surveillance can warn within the curative window.", the agent quotes the Hedging words at operation 4. At operation 6 it lists "Also breaks: references/rules.md, "Clear antecedents"", and no later operation reads that section's words against "it", so the line reaches the report as in step 8 and a marker marks it wrong (2). A fix: operation 4 reads "for each rule or table row the finding names, its Rule line and each Also breaks line included", and operation 6 ends with "and quote for each the words that describe the passage". Verdict: C8 partial.
- `skills/writing/SKILL.md`, "The last pass", and the builder's report, the rows table, row "Grant 4a | 1, 8 | N8 (31 words); E8 ("80 percent power") | O8, O11"; what is wrong:
  - Marker 2's reason (2) for 4a reads "paragraph 42 of the same section states the limit ... repeats paragraph 42" (`8-marks.md`, "Rows not marked right by both").
  - No changed sentence or operation reads the rest of a section before a finding under "Reader's question per section". Operation 5 looks for other places that state a claim only under "Evidence for claims".
  - The table names no sentence for that reason.
  - Whether paragraph 42 counts as "up front" can be argued. The replacement writing out the 0.91 standard-deviation limit that paragraph 42 already states cannot be argued.

  Failure scenario: a methodology paragraph is reported as not stating its limitations when a later paragraph of the same section states them, and the replacement repeats that sentence. The closing then reads row 4a as prevented. Verdict: C8 partial.

## 2. Proof

- `.scratch/3-the-writing-base/agents/reviews/9-report.md`, "DONE / NOT DONE", rows Verify 1 and Verify 3: "`LC_ALL=C grep -n '[^ -~]' <the four files>` printed nothing; `echo "charset exit $?"` printed `charset exit 1`" and "`grep -n -E '[^[:space:]] -{1,2} ' <the four files>` printed nothing"; what is wrong:
  - The brief's check 1 is the perl character-set command, which must print only `charset exit 0`. Check 3 is `grep -n -E '[^[:space:]] - | -- '` over the three skill files.
  - The report quotes other commands, with a placeholder in place of the paths, and its check 1 line reads `charset exit 1`.
  - The reviewer's rerun of the brief's own commands prints `charset exit 0` and nothing, so both facts hold.
  - Decision resting on it: the landing and the orchestrator read the step's checks from the report.

  Failure scenario: an orchestrator comparing the report's `charset exit 1` with the brief's "prints only `charset exit 0`" reads a failed check, or accepts a grep that is not the check the verify list defines. Fix at landing: the report quotes the brief's two commands and their lines as rerun above. Verdict: none.
- `.scratch/3-the-writing-base/agents/reviews/9-report.md`, the rows table, rows grant 7b, 8j and 16t: "Grant 7b | 1, 8 | N2b, N8 (...); N4b ("matched") | O8, O9"; what is wrong:
  - The rows name sentences for only some of the markers' reasons. Not named for 7b: "atlas" first used in paragraph 25 (covered by "A claim that a use is the first is checked against every earlier use."), and "kind of MRI scan" for a sequence. Not named for 8j: the duplicated label "Risks and mitigation:" (operation 7) and the antecedent Also line (operation 4). Not named for 16t: "pair of T1 scans" for a sequence.
  - The brief check's "Declined to judge" asked that the 7b row name the sentence for "atlas".
  - Decision resting on it: the gate requires each row not marked right by both to be fixed, and the closing reads this table.

  Failure scenario: the closing report states each reason of these rows prevented, from a table that names no sentence for some of them. Verdict: none (the sentences exist).

## 3. Standards

- `skills/writing/SKILL.md`, "A finding", replacement bullets: "It ends every break the passage holds: the one the finding's rule line names, and each other one of the prose standard, the rules page or the registers page." Under "A passage that breaks two or more rules is given once": "It has one replacement that ends every break." Also "The finding names that rule when its rule line does not." beside "It names each other rule it breaks, or the other term, by its page and section in a line of its own."; what is wrong:
  - One rule is written in two places twice over. `docs/dev/skill-layout.md`, "Where a rule goes", says "A rule is written once. Another place that needs it names the section it is in." The brief says "Each rule is stated once".
  - The builder's report names the first pair and keeps both.

  Failure scenario: a maintainer narrows one statement, for example to rules of the same page, and the other still says "ends every break". The agent then reads two rules and follows either. Fix at landing: "It has one replacement, as the replacement bullets say." and the naming bullet for the length rule cut in favour of the existing naming bullet. Verdict: none.
- `skills/writing/SKILL.md`, "A finding", vague-qualifier sub-bullets: "The replacement of a word of frequency, such as "often", "typically" or "usually", is the share or the count of cases the claim holds in." against the later sub-bullets "A bracket that names a specific claim, such as "[the specific obstacle, as <citation> reports it]", is allowed." and "Where the draft holds the claim in every case, by a definition or by its own data, the replacement cuts the qualifier."; what is wrong:
  - The new sentence is unconditional, while two sub-bullets of the same bullet give other forms for every vague qualifier.
  - `docs/dev/change-standard.md`, rule 19: "A change leaves no two statements that contradict each other."
  - ADR 0002 is not contradicted, since a share or a count is the number section A asks for.

  Failure scenario: "generally" in a claim that the draft's tables hold in every case. In step 8, finding 5.19's cut of it was marked right by marker 2. The frequency sentence now asks for "[the share of cases ...]" and the later sub-bullet asks for the cut, so the agent may bracket a share the draft already gives as all cases. Fix: open the frequency sentence with "Unless the draft holds the claim in every case, as below,". Verdict: none.
- `skills/writing/SKILL.md`, "A finding": "Examples are the words of frequency "usually", "mostly", "frequently" and "rarely", and the words of size or degree "markedly", "largely", "essentially", "considerably", "repeatedly", "increasingly" and "predominantly"."; what is wrong:
  - "repeatedly" says how often, not how much. Marker 1 on 3.9 calls it "a frequency word of the "often" kind".
  - The brief lists it apart from the size words ("as are "repeatedly", ...").
  - The frequency-word replacement sentence depends on this class.

  Failure scenario: for "the model repeatedly failed on small lesions", the agent takes "repeatedly" as a degree word, as the sentence says. It then writes a bracket for some other quantity, which the bracket sentence forbids for a frequency word, in place of the count of cases. Fix at landing: move "repeatedly" to the frequency examples. Verdict: none.
- `skills/writing/SKILL.md`, "The last pass", operations 2, 3, 4, 5, 11 and 12 (28, 31, 31, 28, 27 and 31 words), and the replacement bullets on the passage's breaks (29), on renaming (29) and on the condition in a split (30), and `references/rules.md`, the "robust" item (29); for example: "3. In a list of places that follows a table's rows, such as a tense list, check that each entry stands under the row of its own section (`references/rules.md`, "Tense per section")."; what is wrong:
  - The brief's fix 8 says "the builder words each within the prose standard's section E". Section E says "under roughly 20 words unless the mechanism needs more", and `docs/dev/skill-layout.md` holds a skill's prose to the prose standard.
  - The builder names these departures. The reason it gives ("each name one operation, how it is done and the part it applies") does not show the mechanism needs the words. Operation 3's example clause, and operation 4's second action, can each stand as their own sentence.
  - Part of the length is the brief's, since its own operation texts run 20 to 30 words.

  Failure scenario: the prompt tells the agent to end every replacement sentence as long as one the report names, which in step 8's grant report was 28 words, while nine of its own fifteen operations run 25 to 31 words. The second action at the end of a 31-word operation, such as operation 4's reading of the exceptions, is the part an agent drops. Verdict: none.
- `skills/writing/SKILL.md`, "A finding": "the one the finding's rule line names" and "The finding names that rule when its rule line does not."; what is wrong:
  - The prompt defines the finding's part as "The rule, by its page and section" and never defines a "rule line".
  - Step 8's manuscript report gives the rule in the group heading and has no "Rule:" line: `grep -c '^Rule:'` prints 0 for `manuscript-report.md` and 74 for `grant-report.md`.

  Failure scenario: in a report laid out like the manuscript's, "when its rule line does not" has no referent. The agent either adds "Rule:" lines that no rule asks for, or skips naming the length rule. Fix at landing: "the rule the finding gives". Verdict: none.
- `skills/writing/SKILL.md`, "The last pass": the old item "Every number the replacement gives stands in the draft as the replacement uses it ("A finding")." has no operation; what is wrong:
  - Operation 9 gives each added word the rule that asks for it, but does not read a number against the draft. Operation 12 reads relations only.
  - The builder's report lists two old items with no operation (the place form and the forms of a vague-qualifier replacement) and leaves this third one out.
  - `docs/dev/skill-layout.md`, "A rewrite of a skill": "Such a rewrite keeps every rule of the old text". The pass's lead still checks each finding against "A finding", so the rule stays in scope, but its explicit check is gone.

  Failure scenario: a replacement writes "a 12.1% reduction" where the draft gives 12.1% for another metric. Operation 9 names the vague-qualifier rule for the added number, and no operation reads the number against the draft. Fix: operation 12 reads "For each number and each relation the replacement states or keeps, ...". Verdict: none (fix 8's list is the brief's).

## 4. Behaviour

none

## Declined to judge

- Whether "robust" for an estimate "insensitive ... to the partition of the data" is standard statistical terminology, which the prose standard's exemption requires. This is a domain judgment on which the two step 8 markers split (`8-marks.md`, 11.4). Only the rule's wording is judged above.
- Whether a first-use finding that now stands at the title, `main.tex:45`, and asks for a definition in the title or a bracket there is what the user wants. The brief dictates the rule, and the builder's report names this consequence. It is the user's call.
- Whether manuscript 1.3's kept "various" ("adapted to various longitudinal MRI screening applications") is a vague qualifier of section A's kind. If it is, the new rule that a replacement ends every break the passage holds asks 1.3 in another form, which the builder's C10 reading does not say. Both markers marked 1.3 right. The user's reading, or a run, would settle it.
- Whether the numbered pass changes what the agent does, and how much it adds to a run's time and tokens. No run follows under ruling I.
- The builder's `git rev-parse --short HEAD` printing 1077fe4 (settled by `git rev-parse --short HEAD` in the worktree, a git command the reviewer does not run), and "`git status --short` printed nothing before the first edit", a past state that no rerun shows.

Reviewer usage: a9dcaf7661d9c1ae9, claude-opus-5-5, 228107 tokens, 44 tool uses, 10.4 minutes.
