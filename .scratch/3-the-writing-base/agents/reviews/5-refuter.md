# Step 5 refuter report (on .agents/worktrees/3-the-writing-base-5, base e691c84)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`. The places in `skills/writing/` below are `file:line` in the worktree, given because the step's three files are the files under review; each is quoted.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

All from `/Users/axelfaes/workspace/ordo/.agents/worktrees/3-the-writing-base-5`.

```
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/5-report.md | xargs -0 sh -c '...' sh | xargs -0 perl -CSD -ne '...'; echo "charset exit $?"
charset exit 0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "dash exit $?"
dash exit 1
$ grep -n -F -e 'the same two sentences' -e 'stated as usual' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "phrase exit $?"
phrase exit 1
```

The commands the report quotes as evidence:

```
$ git status --short
 M skills/writing/SKILL.md
 M skills/writing/references/registers.md
 M skills/writing/references/rules.md
?? .scratch/3-the-writing-base/agents/reviews/5-report.md
$ git diff e691c84 --stat
 skills/writing/SKILL.md                | 42 ++++++++++++++++++++++++----------
 skills/writing/references/registers.md |  1 +
 skills/writing/references/rules.md     | 17 +++++++++++---
 3 files changed, 45 insertions(+), 15 deletions(-)
$ for p in SKILL.md references/rules.md references/registers.md templates/docx_paragraphs.py; do git show e691c84:skills/writing/$p | diff -q - ~/.claude-backup/skills/writing/$p >/dev/null; echo "$p base-vs-pinned exit $?"; done
SKILL.md base-vs-pinned exit 0
references/rules.md base-vs-pinned exit 0
references/registers.md base-vs-pinned exit 0
templates/docx_paragraphs.py base-vs-pinned exit 0
$ git -C ~/.local/share/ordo-stable describe --tags
v7.1.0-rc.2
$ head -8 skills/writing/SKILL.md | sed -n 4,6p
metadata:
  version: "1.0.0"
---
$ wc -l skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/5-report.md
     200 skills/writing/SKILL.md
     219 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     207 .scratch/3-the-writing-base/agents/reviews/5-report.md
     679 total
$ for p in SKILL.md references/rules.md references/registers.md; do git show e691c84:skills/writing/$p | wc -l; done
     182
     208
      52
$ grep -n -E '^\- \*\*place' docs/glossary.md | cut -c1-60
77:- **place, of a defect**: an operation of any kind, such 
78:- **place, of a point**: one line of the reader's output
$ cmp .scratch/3-the-writing-base/agents/reviews/5-report.md /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/5-report.md; echo "cmp exit $?"
cmp exit 0
```

The word counts of the report's judgment call 11, rerun by a count of each added sentence of `git diff e691c84 -- skills/writing`: 24, 21, 27, 26, 23, 23, 35, 28, 23, 25, 24, 23, 21, 27, 23, 29 and 24 match. The concession bullet of "Formality" counts 24, where the report says 25; no decision rests on it.

The draft facts behind C8 and C9, from the copy (read only): `b_pretraining.tex:3` holds "\cite{jamaludinSelfsupervisedLearningSpinal2017}, for example, pre-trained ..." and "\cite{rivailModelingDiseaseProgression2019} extended this approach". The accuracy column of `tables/results_finetune.tex` gives group means of 0.854 (DW-MRI), 0.811 (T1 DCE-MRI) and 0.799 (T1 IOP \& T2-MRI), and the T1 IOP \& T2-MRI AUPRC runs from 0.373 to 0.519. The report's figures hold.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. These lines now forbid a reference or a description in a passage or a replacement: `SKILL.md:121` "A passage is never a description of the draft's text or a reference to another finding.", `:124` and `:125` (written out whole; never "as in finding N", "the same sentence" or "the replacement of finding N"), `:146`, `:151`, `:155`, `:157` and `:159`. The phrase "the same two sentences" is gone (Verify 4). The example "the same two sentences" is left out of `:125` because Verify 4 forbids the phrase, and the report names this (judgment call 4).
- 2: holds. `SKILL.md:163` "The passage quotes the draft as it stands, and the replacement gives the text at that place as it reads after every finding on it." Both old sentences are gone from the diff.
- 3: violated, Spec 2. The rule on a split or list quote (`SKILL.md:149`) and "in this form only" (`:156`) are there, but `:120` makes "a passage is" a closed definition where the brief says "may be".
- 4: holds. `SKILL.md:117`.
- 5: violated, Spec 1. `SKILL.md:140` to `:143` and `rules.md:167` are there, and line 131's old sentence is gone. The never-cut sentence carries a condition that the item does not state. `:140` names section A for the rule and adds the qualifier's place and the bracket, which section A lacks. I do not read that as a copy of section A under ADR 0001. `rules.md:167` states the place rule a second time (Standards 4).
- 6: holds. `rules.md:214` and `:215`.
- 7: holds as the item words it: `SKILL.md:132`, `:133` and `:135`, and `rules.md:46`. The bullet at `:132` contradicts other rules (Standards 1).
- 8: holds. `rules.md:61` and `:62`.
- 9: holds. `rules.md:22`. The item's "and is not reported" is carried by the existing `rules.md:21`.
- 10: holds. `rules.md:125`. Its scope reaches past the Introduction (Standards 3).
- 11: holds. `SKILL.md:144`, `:152` and `:153`.
- 12: holds. `rules.md:217` to `:219`. The removal of "Clearly connected ideas may share a sentence." replaces the sentence that marker 2 cited for 77, 80 and 81, as the brief's "What to build" paragraph asks. The report states the removal under its user-visible changes, but the reason it gives does not hold (Proof 2).
- 13: holds as the item words it: `rules.md:13`, and `SKILL.md:130` and `:139`. The wording widens the rule past the item's aim (Standards 2).
- 14: holds. `registers.md:14`.
- 15: holds. `SKILL.md:166` to `:169`.
- 16: holds. `SKILL.md:102`.

Cases of the brief's "Cases":

- C1: met. Each reference and description of kind 1's list breaks `SKILL.md:121` or `:125`. A replacement that names another finding breaks `:125`. The replacements of 64 (first break), 67 and 69, "the same two sentences ...", break `:151`. The tense clauses "as in finding N" break `:159` and `:125`. No sentence left gives a replacement form that can be copied as a description (read: `:146`, `:151`, `:155` and `:157`).
- C2: met. Split 35 (b) quotes finding 4's text, and split 42 (e) starts from finding 16's added sentence: both break `SKILL.md:163`. The two old sentences are gone.
- C3: met. A quote cut to "..." or "(...)" breaks `SKILL.md:149`. A one-sentence phrase passage stays allowed by `:120`.
- C4: met. `SKILL.md:117`.
- C5: met. 37 and 38 (the cut qualifiers) break `:141`. 54 and 55 ("usually") break `:142`. 56 and 59 ("such as [...]") break `:143`. The two tense clauses carry those findings' replacements.
- C6: met. 62 and 85 (the cut "notoriously" and "fiercely") break `rules.md:214`.
- C7: met:
  - 1, 2, 40, 47 and the two tense clauses state a limit that the T1 IOP \& T2-MRI AUPRC range of 0.373 to 0.519 contradicts, and break `SKILL.md:135`.
  - Grant 28 adds a presumption and 51 adds "therefore": both break `:133`.
  - Grant 32's change of "the" to "a" breaks `:132`.
  - 7's dropped "a reliable tool" breaks `rules.md:46`.
- C8: met. 22 breaks `rules.md:62`, since `b_pretraining.tex:3` gives the examples. 26 breaks `rules.md:61`.
- C9: met. `rules.md:22`, with the accuracy means above.
- C10: met. `rules.md:125`.
- C11: met. Grant 15 breaks `SKILL.md:153`. 68 and 72 break `:152`. Grant 4 breaks `:144`.
- C12: met. 81's "so" clause breaks `rules.md:218`. 77 and 80 must name their two ideas (`:217`). 76 ("albeit") and 82, second break ("while"), are allowed by `:219`.
- C13: met. Grant 3 and 4 break `rules.md:13`. Grant 8 breaks `SKILL.md:130`. Grant 33 breaks `:139`.
- C14: met. Grant 3, 7, 35 and 36 each replace "the applicant", and each breaks `registers.md:14`.
- C15: met. The manuscript lines "Most specific term" and "Reader's question per section" break `SKILL.md:166` and `:167`. The section 0 line on the dash places and the grant lines "Hedging" and "ASCII throughout" break `:166`, or `:168` and `:169`.
- C16: met. `SKILL.md:102`.
- C17: partial. The report gives a form for every finding in C17's list. Manuscript 19 follows the brief: kind 12 forbids its split of the consequence clause "enticing recent studies ...", and the report gives the finding in the new form, with the sentence that forbids the old one. These claims of the report do not hold:
  - 61 "unchanged";
  - 25, 58 and grant 17 to 21 "keeping ... replacement unchanged";
  - 35 "allowed".
  The missing part is the sentences that forbid them (Proof 1, Spec 1, Standards 1, Standards 2).

## 1. Spec

- Spec 1. `SKILL.md:141`, "A finding": "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal."; and the report, first line "Everything in the brief is done." with "Orchestrator's ruling: none yet." What is wrong:
  - Kind 5 says "never cuts the qualifier so that the claim reads as universal", with no condition. C17 says that "A finding the changed text would forbid outright is reported, with the sentence that forbids it". For 61, the brief's path was to report the finding as forbidden. The builder instead narrowed the rule, so that 61 stays allowed.
  - The change standard, rule 4, makes a rewrite of the brief's text a stop, which "the report never decides ... as a judgment call". The report decides it as judgment call 1, and its first line says everything is done.
  - On content, the condition is the better rule. It keeps the scope of the old line 131 ("a claim that holds usually"). It matches the prose standard's "the specific claim". Both markers marked 61 right.
  - The condition does not reach its aim. `:140` still says that the replacement "puts the number, the specific claim, or a bracket ... in the qualifier's place", and a cut puts nothing there. `:132` says "It keeps each word that sets a claim's scope". So 61's cut still breaks two sentences, and the report does not name them.
  Failure scenario: in step 6, the review agent on `figures/cumulative_gain.tex:10` "Generally, lower MAE values indicate ..." reads `:141` as allowing the cut and `:140` and `:132` as forbidding it. It writes "[in how many cases, from the author]" for a claim that holds by MAE's definition, or a marker marks the cut wrong under `:140`. The orchestrator also receives a report that says everything is done while it holds an open rewrite of the brief's text. Verdict: kind 5 violated; C17 partial.
- Spec 2. `SKILL.md:120`: "A passage is a phrase, a clause or a sentence." What is wrong: kind 3 asks that "a passage may be a phrase, a clause or a sentence". The diff writes "is", a closed definition. That definition contradicts `:150` ("A paragraph split quotes the last sentence before the break and the first sentence after it"), which makes a passage of two sentences. It also contradicts the change standard, rule 19. The passages it excludes include those of findings both markers marked right: manuscript 63, 65, 70, 73, 74, 75, 76 and 78, and grant splits 8, 11, 31 (b) to (d) and 35 (d). The report does not name them. Failure scenario: a review agent quotes only one sentence of a split to meet `:120`, or a step 6 marker marks a two-sentence split passage wrong under `:120`. "may be", as the brief has it, ends the contradiction. Verdict: kind 3 violated.

## 2. Proof

- Proof 1. Report, "The cases' first run", C17: "Keeping place, passage, rule and replacement unchanged: manuscript ... 25, ... 58 ..., grant ... 17 to 22"; "For manuscript 35 ... `Each technical term a replacement uses ...` allows."; "Manuscript 61 ...: unchanged". What is wrong: my reading does not reproduce these claims.
  - 25 ("most" replaced by "[the share, from the author] of") and 58 ("many of them" replaced by "[the studies named ...]") drop a quantifier, which `SKILL.md:132` forbids as worded.
  - Grant 17 to 21 drop "usually", "often", "mostly", "frequently" and "rarely". "usually", "mostly", "frequently" and "rarely" are not in section A's list, so `:140` does not reach them, and `:132` forbids dropping them.
  - Manuscript 35's replacement uses "exponential moving average". In the draft that term first appears at `sections/3_methodology/d_pretraining.tex:3`, after `introduction.tex:11`, and the replacement does not define it. `rules.md:13` therefore forbids the replacement as worded.
  - For 61, see Spec 1.
  The decision that rests on these claims is whether C17 is met and the step can land with no further change to the text. Failure scenario: step 6 runs on a text whose sentences a literal marker applies against forms that both markers of step 4 marked right, and the step's check fails again on findings this step was meant to keep. Verdict: C17 partial.
- Proof 2. Report, judgment call 3: "since the old sentence ... contradicts kind 12". What is wrong: "Clearly connected ideas may share a sentence" does not contradict `rules.md:218` or `:219`. A cause or consequence clause is a clearly connected idea, and a split that is "allowed" is not one that must be made. The removal is supported on another ground: it replaces the sentence that marker 2 cited for 77, 80 and 81, as the brief's "What to build" paragraph asks. The decision that rests on the claim is whether the orchestrator accepts the removal. Failure scenario: the orchestrator accepts it on the stated contradiction, and so never weighs what the removal widens. After it, two clauses joined by "and" that are each a claim and that are neither cause and consequence nor contrast are reported, where "clearly connected" exempted them before.

## 3. Standards

- Standards 1. `SKILL.md:132`, "It keeps each word that sets a claim's scope, such as an article or a quantifier.", and `SKILL.md:139`, "It names each thing by the name the draft uses for it." What is wrong: each bullet is set apart from the qualifier that the line before it carries, "beyond the change the named rule asks of it" (`:131`). The report gives that separation as judgment call 7. `docs/dev/skill-layout.md`, "Lists and tables", says that "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule", and the change standard, rule 19, forbids two statements that contradict each other.
  - `:132` contradicts these lines, each of which replaces a quantifier:
    - `:140`;
    - `rules.md:144`, "a large number of | the number itself";
    - `rules.md:161`, "many studies";
    - `rules.md:164`, "some researchers".
  - `:139` contradicts `rules.md:20` ("The replacement is the specific term") where the draft does not use the specific term.
  Failure scenario: on "many existing approaches", a review agent keeps "many" beside the bracket, the form decision 2 of the brief rejects, to meet `:132`. Or a step 6 marker marks the bracket form of 19, 25 and 58 wrong under `:132`. Verdict: C17 partial.
- Standards 2. `rules.md:13`: "Each technical term a replacement uses is defined in the draft at or before the passage, or the replacement defines it." What is wrong: kind 13 asks for a sentence that "also covers a term the replacement brings in from elsewhere in the draft". The old sentence's "introduces" became "uses", so the rule now covers every technical term a replacement keeps from its own passage, and every term inside a definition the replacement adds. Findings both markers marked right then break it:
  - manuscript 35, where "exponential moving average" is first used at `d_pretraining.tex:3`;
  - manuscript 36 ("feed-forward sublayer"; `grep -rn -i -F 'feed-forward' main.tex sections` prints nothing in the copy).
  The report does not name 36, and it calls 35 allowed. This breaks the change standard, rule 19, against the same section's "This section covers technical terms only" scope and against the passages it leaves as they are. Failure scenario: the review agent defines every standard term (attention, feed-forward, Transformer) inside each replacement, a definition with no end that makes the replacements longer. Or a marker marks a right definition, such as 36's, wrong because it uses an undefined term. Verdict: C17 partial.
- Standards 3. `rules.md:125`: "A section whose opening states a real-world consequence or a knowledge gap answers the question of the Introduction row and is not reported." What is wrong: the subject is any section, so for a Discussion or Results section that opens with a gap the sentence says "is not reported". That contradicts `rules.md:122` ("A section whose text does not answer its reader's question is reported") and the Results and Discussion rows (change standard, rule 19). The brief's kind 10 words it almost the same way. Failure scenario: a Results section that opens with "Little is known about X" and never leads with its finding is not reported, although finding 52, which both markers marked right, reports the same defect. "An Introduction whose opening states ..." ends it.
- Standards 4. `SKILL.md:140` (35 words) and `rules.md:214` (29 words). What is wrong: the prose standard, section E, "Sentence length", allows "under roughly 20 words unless the mechanism needs more". The report's reason, "each carries one rule with its qualifier", does not cover these two:
  - In `:140`, "in the qualifier's place" stands 19 words after its verb "puts".
  - In `rules.md:214`, "and the word is not cut" repeats what "is a formal word of the same strength" already says.
  Also under "A rule is written once" (`docs/dev/skill-layout.md`, "Where a rule goes"): `rules.md:167` states for "many" the place rule that `SKILL.md:140` states for every qualifier section A names. The brief asked for both. Failure scenario: a reader of `:140` attaches "in the qualifier's place" to "a bracket" alone. A later change to the place rule reaches one of its two copies, and the two then differ.

## 4. Behaviour

- Behaviour 1. Report, "Every host- or user-visible change". What is wrong: the list leaves out these changes to what the user sees in a `/writing` report:
  - a claim whose evidence comes in a later sentence or paragraph is no longer reported (`rules.md:62`);
  - a word the draft's own tables or figures use for a measure is no longer reported under "Most specific term" (`rules.md:22`);
  - an opening that states a consequence or a gap is no longer reported (`rules.md:125`);
  - a replacement now defines every technical term it uses (`rules.md:13`);
  - a colloquial intensifier becomes a formal word of the same strength in place of being cut (`rules.md:214`);
  - a split keeps its condition and counts the sentences other findings add, and a sentence-length replacement keeps each sentence within the rule (`SKILL.md:144`, `:152` and `:153`).
  None is given with its before and after. Failure scenario: the user, or the orchestrator reading step 6's reports, sees fewer "Evidence for claims", "Most specific term" and "Reader's question per section" findings, and longer replacements with definitions, and cannot tell from this report which change caused which.
- Behaviour 2. `SKILL.md:144`: "Where the finding names the prose standard's rule on sentence length, it leaves each sentence it writes within that rule." What is wrong: both markers marked grant 24 and 26 right. Grant 24's replacement holds a sentence of 27 words without its citation marker ("The LI-RADS level is the standard radiological HCC likelihood score [3], recorded in three levels ..."). Grant 26's holds one of 24 words. Grant 4 was marked wrong under the same sentence for sentences of 28 and 31 words. The report does not name grant 24 or 26 as findings whose form now changes. Failure scenario: in step 6, the same review of paragraph 40 gives a further split, or keeps the 27-word sentence and a marker marks it wrong as grant 4 was. Neither outcome is foreseen in this step's record.

## Declined to judge

- Verify 5 in the form the brief gives it, `git diff 1c26ac1 -- skills/writing`, was not run. The refute skill allows only `git diff <base>`, `git status --short` and `git show <base>:<path>`. I read `git diff e691c84` whole and checked that the base's four files of `skills/writing/` equal the pinned `v7.1.0-rc.2` copy, which the brief's premise says equals main at 1c26ac1. `git diff 1c26ac1 e691c84 -- skills/writing` would settle it.
- Whether the changed text makes the review agent report right findings: that is step 6's runs and marks.
- The orchestrator's rulings on manuscript 61 and 19, which the report leaves open: they are the orchestrator's call. My read of each is under Spec 1 and the C17 verdict.
- The sentence counts of the draft paragraphs behind 68, 72 and grant 15: I took the markers' counts and did not count the copies.
- The tables behind the limits of manuscript 3 and 4, which both markers marked right and which the report keeps: I did not recheck them against `SKILL.md:135`.
- Grant findings 11 to 13, 22, 23, 30 to 34 and the remaining splits of finding 29 were not read against every new sentence. I read grant 1 to 10, 14 to 21, 24 to 28, 35 to 37 and the first two splits of 29.
- Whether "we" for a single applicant (`registers.md:14`) is the right rule: it follows ruling D18 and is the user's.
- Whether "Transformer" or "MRI" are defined at or before `main.tex:45`, which would decide whether manuscript 33 also breaks `rules.md:13`: I did not check it, so 33 is not named under Standards 2.

Reviewer usage: abc52e37d862af422, claude-opus-5-5, 290609 tokens, 45 tool uses, 10.4 minutes.
