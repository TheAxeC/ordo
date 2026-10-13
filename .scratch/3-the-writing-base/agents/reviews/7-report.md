Everything in the brief, in the cases ruling `agents/briefs/7-cases.md` and in repair round 1 (`agents/briefs/7-round-1.md`) is done.

# Report of step 7 of plan 3, the third fixes to /writing

## Open items of the state file

none

## Repair round 1

Every row names the file and section that changed.

| Ruling | What changed and where |
|---|---|
| 1, S1 and P1, "Terms defined at first use" | `references/rules.md`, "Terms defined at first use": the rule and its exception stand in one bullet. "Such a term is used only where the draft defines it at or before the passage." has the sub-bullet "Otherwise the replacement defines it, or names its definition in square brackets as a fact for the author." No sentence contradicts the first. The base line said "Such a term is used only where the draft defines it at or before the passage, or the replacement defines it." The new text keeps that exception and adds the bracket for a definition the author supplies, also for a term the draft never defines. The line before it now reads "A replacement brings in a technical term whenever its passage does not hold the term, whether or not the draft defines it." (22 words, see the judgment calls) |
| 2, B1 and P2, a passage that breaks two rules | `SKILL.md`, "The review agent's prompt", "A finding". Under "Findings on one passage, or on two places of one claim, propose changes that can all be applied together." the bullets now read "A passage that breaks two or more rules is reported once, in one finding, with one replacement that ends every break.", "That finding stands under the group of one of those rules.", "That finding names each other rule it breaks by its page and section, in a line of its own." and "No other group gives an entry for the passage or refers to it." The list bullet reads "Every list of places gives each place as its own entry, with its passage and its replacement." with the sub-bullet "Such lists include a term's places under several names, a tense list and another rule's places." Then "A place that two lists of places reach is given once, in the first list that reaches it." with the sub-bullets "Its replacement carries every change at that place.", "That entry names the other list's rule by its page and section, or its term, in a line of its own." and "The later list leaves the place out and refers to it nowhere." The bullet "An entry is written out also where an entry of another term changed the same place." is gone. The last pass's first check still reads "...with no reference to another finding, entry or group". The brief's decision 2 and fix 2's "given whole under each rule's group" are replaced by this form |
| 3, T1, the count of the rewrite | `SKILL.md`, "The last pass": "Rewrite each finding or group line that breaks one of their rules, at most twice." and "A finding or group line that still breaks a rule after the second rewrite stays in the report, with a line that names the rule it still breaks." |
| 4, T2, "full path" | `SKILL.md`, "The last pass": the check now reads "Each place is in its form, with the file's path from the main file's folder where the form has one ("A finding")." The words "full path" are gone, and the check on the quoted passage is its own item: "The quoted passage stands at its place ("A finding")." |
| 5, T3, sentence length | `SKILL.md`: the list-of-places bullet is split into the rule in one sentence of 17 words and the examples as a sub-bullet of 16 words. Every sentence the step adds was counted again (see the judgment calls). The sentence "Where the draft gives neither, ..." (31 words) and the others over about 20 words that remain are named there with why |
| 6, P3 and P4, the report | The `metadata.version` row below quotes all three lines the command printed. The Verify 5 row and the judgment calls name every remaining added sentence over about 20 words |
| 7, B1 and B2, user-visible changes | "User-visible changes" gives the form of a passage that breaks two rules with the step 6 forms as the before, the narrowed "Hedging", and the last pass's count with its line for a finding that still breaks a rule |
| 8, P2, C7 | C7 below reads Limitations 2, Clear antecedents 2, filler 3 and the tense-bearing entries of "No synonym cycling" 1.1 against ruling 2 and states each form |

## The cases' first run

Base: c99b4a6. `git status --short` before any change printed nothing. The first read covered the change standard, the brief, `docs/dev/skill-layout.md`, the prose standard, the glossary, ADRs 0001 to 0003, the three pages of `skills/writing/`, `6-marks.md` from line 284, `6-report.md` lines 1 to 180, both run reports whole, and the grant paragraphs 25, 40, 41, 42 and 48 (`python3 -I skills/writing/templates/docx_paragraphs.py` on the grant copy) with the manuscript passages for filler 4, Voice 3 and Introduction paragraph 13.

### The case the brief's rules got wrong, and the ruling

Case C1, fix 1, as the builder's hand-back gave it. Fix 1's last sentence says "The pass rewrites each finding that breaks a rule until it meets the rules, and drops no finding, since the report covers the whole draft." Its list also holds the check "a word the prose standard's section A keeps is not reported", which decision 1 names as the check that catches manuscript filler 4. For filler 4 ("just 8000 training steps", a minimality claim section A keeps) the two cannot both hold: only leaving the report makes the finding meet "is not reported". Grant 12.19 has the same shape on marker 1's reading, since paragraph 48 holds 4 sentences as the draft has it.

The orchestrator's ruling (`7-cases.md`):

1. Ruled (a). The last pass drops a finding only where "What you report" says its passage is not reported, and rewrites every other finding that breaks a rule. The bullet states both halves and keeps the reason in one clause: no break of the draft is lost.
2. Grant 12.19 stays reported. A paragraph is counted with the sentences other findings add, as `SKILL.md` line 156 counts the parts of a split and line 167 gives the text after every finding. Paragraph 48 then holds 6 sentences.
3. Manuscript Hedging 5 is a passage the rewritten "Hedging" line says is not reported, so the pass drops it under item 1.

### Each case, read on the unchanged tree

- C1, fix 1: the text already holds the rule each row broke, and the agent did not apply it. Sentence and pass check per row are in the tables below. The rows that need no new rule are Limitations 1 and 4, vague qualifiers 5, Most specific term 1, Clear antecedents 1, Voice 3, section E 2 and 3, section D paragraphs 2 and 10, filler 1 and 4, section F 1 and 2, grant 1.1, 12.18, 12.19, 14.1 and 14.2, and the five group lines. Filler 4 is the ruled case.
- C2, fix 2: confirmed. `SKILL.md` "A finding" line 166 said only "one replacement that ends both breaks", and line 162 said "gives each place with its passage and replacement" without saying what a place already given under another term does. Lines 122 and 126 forbid a reference to another finding and the agent broke them.
- C3, fix 3: confirmed. Line 143 ("a bracket that names the number or the claim") let Evidence 2 and vague qualifiers 4 offer an "or" alternative that leaves the claim universal. Line 144 forbids a cut that reads as universal, not a bracket. Vague qualifiers 2, "[the specific obstacle, as \citep{jin2021predicting} reports it]", names a specific claim.
- C4, fix 4: confirmed. "Hedging" line 54, "A hedge of the strength the evidence carries on an interpretation is not reported.", states the "not reported" side only for an interpretation and says nothing against swapping a device for another of the same strength. No sentence asked for one strength across places, which Hedging 2 broke.
- C5, fix 5: confirmed. Line 13 applied only when "the draft defines it somewhere", so Terms 2 ("stem convolution", never defined) fell outside lines 13 and 14. Grant 1.1 breaks line 14 as it stood.
- C6, fix 6: confirmed. "Explanation of evidence" read "Evidence that is not followed by what it means for the paragraph's claim is reported." and said nothing of data the paragraph uses for no claim, which grant 7.1 is.
- C7: the changes of fixes 1 and 3 to 6 reach no finding marked right by both. Fix 2 (ruling 2 of round 1) changes the form of the findings that break a second rule. Each is read below.

### C7, read against the changed text

The step 6 forms were: an "Also: <rule>" line, a parenthesis in the entry, "Passage and replacement as in N", and in the tense group "Sentences already rewritten in the groups above are not repeated here." The new form is the one the markers marked right in 29 manuscript findings: the passage is reported once, and each other rule it breaks is named by its page and section in a line of its own.

- Limitations 2 (`sections/4_experiments/d_results.tex:21`): its line "Also: prose standard section 0 (performative aside, "More interestingly"); "Tense per section" (Results)." names the second rule without the page for the tense rule. The form changes in one way: the line names `references/rules.md`, "Tense per section" and the prose standard's section 0 by page and section. Place, passage, rule and replacement stay, and the tense and section 0 groups give no entry for it. The sentence that asks it is "That finding names each other rule it breaks by its page and section, in a line of its own."
- Limitations 3: breaks one rule, so its form is unchanged.
- Clear antecedents 2 (`sections/1_introduction/introduction.tex:1`): its line "Also: prose standard section A ("considerably")" becomes a line naming "Prose standard, section A, vague qualifiers". The passage is reported once under "Clear antecedents", and section A's group gives no entry for it. This is the form of the base text. Only the naming of the rule changes.
- Filler 3 (`sections/3_methodology/d_pretraining.tex:10`): the parenthesis "(with the Methodology tense)" becomes a line of its own naming `references/rules.md`, "Tense per section". The entry stays under section A's filler group, and the tense list leaves it out.
- The tense-bearing entries of "No synonym cycling" 1.1 are `sections/3_methodology/b_architecture.tex:14`, `sections/3_methodology/d_pretraining.tex:10`, `sections/appendix/a_implementation/2_augmentations.tex:1`, `sections/4_experiments/c_evaluation.tex:1`, `sections/4_experiments/d_results.tex:5` (the second entry) and the `d_results.tex:15` entry of item 3. Each keeps its place, passage and replacement. Each gains a line naming `references/rules.md`, "Tense per section", given by "A place that two lists of places reach is given once, in the first list that reaches it." and "That entry names the other list's rule by its page and section, or its term, in a line of its own." The tense list leaves them out, as "The later list leaves the place out and refers to it nowhere." says. The parenthesis "(This also carries the Results tense.)" becomes that line.
- The other C7 findings (Hedging 1, 3 and 4, vague qualifiers 1, 2 and 3, Terms 1, section D paragraphs 1 and 3, filler 2, and grant 11.6, 11.8, 11.9, 12.1 and 14.3) keep their place, passage, rule and replacement. The vague-qualifier brackets of vague qualifiers 1 and 3 name an amount or a share, and the bracket of vague qualifiers 2 names a specific claim, so none breaks the rewritten bullet.
- Grant 5.1, 5.2, 5.3 and 5.5 are reported once, as the base report has them, and each gains a line naming `references/rules.md`, "Formality". Grant 11.1, 11.2, 11.3, 11.4, 11.5, 11.7 and 11.10 are not given as entries: "No other group gives an entry for the passage or refers to it." Their passage stands under the other rule's group, with the replacement that ends both breaks. Grant 5.1, 5.2, 11.6, 11.8, 11.9 and 12.1 keep place, passage and replacement.

## What each row and failure now meets

"Pass" is the check of the last pass (`SKILL.md`, "The review agent's prompt", "The last pass"), named by its bullet. Sentences are quoted from the changed files.

### Fix 1, manuscript rows

| Row | Sentence that now prevents it | Pass check |
|---|---|---|
| Limitations 1 | "A number it gives stands in the draft as the replacement uses it." and "It changes no claim's scope or strength beyond the change the named rule asks of it." ("A finding") | "The replacement keeps every claim, scope word, name and strength the named rule does not change" and "Every number the replacement gives stands in the draft as the replacement uses it" |
| Limitations 4 | "It adds no claim or relation that the draft does not make, and no word that presumes one, beyond the addition the named rule asks for." ("A finding") | "The replacement adds no claim or relation the draft does not make" |
| Vague qualifiers 5 | "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included." ("A finding") | "Every number or relation the replacement states holds against every number the draft gives" |
| Most specific term 1 | "A number it gives stands in the draft as the replacement uses it." ("A finding") | "Every number the replacement gives stands in the draft as the replacement uses it" |
| Clear antecedents 1 | "Where the finding names the prose standard's rule on sentence length, it leaves each sentence it writes within that rule." ("A finding") | "Each sentence the replacement writes is counted when the finding names the sentence-length rule" |
| Voice 3 | "The replacement of a vague qualifier is the number or the specific claim." ("A finding") | "The replacement of a vague qualifier is the number, the specific claim or the bracket, never a cut that makes the claim universal" |
| Section E 2 | the same sentence-length sentence ("A finding") | "Each sentence the replacement writes is counted when the finding names the sentence-length rule" |
| Section E 3 | the same sentence-length sentence ("A finding") | the same check |
| Section D paragraphs 2 | "Each part a split leaves meets the prose standard's section D, or the finding gives a further split." ("A finding") | "Each part of a split is counted with the sentences other findings add and holds one idea" |
| Section D paragraphs 10 | "A part is counted with the sentences that other findings add to it." ("A finding") | the same check |
| Filler 1 | "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." ("A finding") | "The replacement keeps every claim, scope word, name and strength the named rule does not change" |
| Filler 4 | "A use of a word that the prose standard's section A says stays is not reported." ("What you report") | "A word the prose standard's section A keeps is not reported", with "Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost." (ruling 1 of `7-cases.md`) |
| Section F 1 | "The replacement of a hard-wrapped paragraph writes the quoted words on one line, with a space where the line broke." ("A finding") | "The replacement of a hard-wrapped paragraph holds every quoted word" |
| Section F 2 | the same hard-wrap sentence | the same check |

### Fix 1, grant rows

| Row | Sentence that now prevents it | Pass check |
|---|---|---|
| 1.1 | `references/rules.md`, "Terms defined at first use": "Such a term is used only where the draft defines it at or before the passage." with "Otherwise the replacement defines it, or names its definition in square brackets as a fact for the author." | "Each technical term the replacement brings in meets `references/rules.md`, "Terms defined at first use"" |
| 12.18 | "The passage quotes the draft as it stands, and the replacement gives the text at that place as it reads after every finding on it." and the strength sentence ("A finding"). The change in its text comes from 14.2 | "The replacement keeps every claim, scope word, name and strength the named rule does not change" |
| 12.19 | "A part is counted with the sentences that other findings add to it." (ruling 2: paragraph 48 holds 4 sentences and 6 with the added ones, so the finding stays) | "Each part of a split is counted with the sentences other findings add and holds one idea" |
| 14.1 | "A word that sets a claim's scope, such as an article or a quantifier, is kept unless the named rule replaces it." ("A finding") | "The replacement keeps every claim, scope word, name and strength the named rule does not change" |
| 14.2 | "It names each thing by the name the draft uses for it, unless the named rule changes the name" and the strength and relation sentences ("A finding") | "The replacement keeps every claim, scope word, name and strength..." and "The replacement adds no claim or relation the draft does not make" |

### Fix 1, the five group lines

| Group line | Sentence that now prevents it | Pass check |
|---|---|---|
| Manuscript "Formality", section C, section D paragraphs, section A filler; grant section E "Passive voice" | "The line names what the reader of this draft loses or misreads through the group's breaks, as one of the group's own findings shows." and "The loss holds in the draft's own text and data." ("How you group them") | "Each group line names a loss that one of the group's findings shows and that holds in the draft" |

### Fixes 2 to 6

| Row or failure | Fix | Sentence that now prevents it |
|---|---|---|
| Grant 11.1, 11.2, 11.3, 11.4, 11.5, 11.7, 11.10 | 2 | `SKILL.md`: "A passage that breaks two or more rules is reported once, in one finding, with one replacement that ends every break." and "No other group gives an entry for the passage or refers to it." |
| Manuscript report line 229 ("No synonym cycling" 3.2) | 2 | `SKILL.md`: "A place that two lists of places reach is given once, in the first list that reaches it." with "Every list of places gives each place as its own entry, with its passage and its replacement." |
| Gate condition 1 (the eight rows with no passage, the bare file names) | 2 | the sentences above, with "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry." (unchanged) |
| Gate condition 5 (the eight references) | 2 | "No other group gives an entry for the passage or refers to it." and "It is never a reference to another finding or to the passage..." (unchanged) |
| Gate condition 2 (the five group lines) | 1 | the group-line row of the fix 1 table |
| Evidence 2 | 3 | `SKILL.md`: "The bracket offers no alternative joined by "or" that leaves the claim universal once the author supplies it." |
| Vague qualifiers 4 | 3 | the same sentence. Vague qualifiers 2 meets "A bracket that names a specific claim, such as "[the specific obstacle, as <citation> reports it]", is allowed." |
| Hedging 2 | 4 | `references/rules.md`, "Hedging": "Findings on one claim at several places give it devices of one strength." |
| Hedging 5 | 4 | "Hedging": "A passage whose device already has the strength the evidence carries is not reported." and "A replacement never swaps a device for another of the same strength." Under ruling 3 of `7-cases.md` the pass drops this finding. |
| Terms 2 | 5 | "Terms defined at first use": "A replacement brings in a technical term whenever its passage does not hold the term, whether or not the draft defines it." with "Such a term is used only where the draft defines it at or before the passage." and its sub-bullet "Otherwise the replacement defines it, or names its definition in square brackets as a fact for the author." |
| Grant 7.1 | 6 | "Explanation of evidence": "A sentence that reports data the paragraph uses for no claim, such as a property of a cohort, is not reported." |

## DONE / NOT DONE

All commands run from the worktree's root after the last edit.

| Item | Result |
|---|---|
| Fix 1, the last pass | DONE: `SKILL.md`, "The review agent's prompt", the bullet "The last pass", after "How you group them" and before "A draft with no break", with both halves of ruling 1 of `7-cases.md` and the count of ruling 3 of round 1 |
| Fix 2, lines 162 and 166 | DONE: the list-of-places bullets and the bullets under "Findings on one passage, or on two places of one claim, propose changes that can all be applied together.", in the form of ruling 2 of round 1 |
| Fix 3, line 143 | DONE |
| Fix 4, "Hedging" line 54 | DONE |
| Fix 5, "Terms defined at first use" lines 13 and 14 | DONE, with the exception as a sub-bullet of the rule (ruling 1 of round 1) |
| Fix 6, "Explanation of evidence" | DONE |
| Verify 1, the character-set check over the three pages and `7-report.md` | DONE: the output is `charset exit 0` (run last, after this report was written) |
| Verify 2, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | DONE: `ok: the plan-terms block equals the template` |
| Verify 3, the grep for spaced hyphens and `--` over the three pages | DONE: it printed nothing, and `echo "grep exit $?"` printed `grep exit 1` |
| Verify 4, `git diff c99b4a6 -- skills/writing` read whole | DONE: every changed sentence serves a fix or a ruling. The command quoted under this table printed `0` |
| Verify 5, new lines read against the standards on list items and sentence length | DONE: every added sentence over about 20 words is named under the judgment calls with why it needs its length |
| `metadata.version`, `grep -n version skills/writing/SKILL.md` | DONE: it printed `5:  version: "1.0.0"`, then `82:     - The message that ends the turn shows the configured model, the served model and the Claude Code version (`claude --version`).`, then `214:\| A model other than the configured one \| The runner served the review agent a model that is not the configured one, as `refute`'s Stops table defines it (Steps 6) \| The configured model, the served model and the Claude Code version (`claude --version`) \| `/writing` again, once the runner serves the configured model or the configuration names another \|`. Lines 82 and 214 match "version" in other words, and line 5 is the key, still "1.0.0" |

The Verify 4 command, run from the worktree's root:

```
git diff c99b4a6 -- skills/writing | awk '/^diff --git/{keep = ($0 ~ / a\/skills\/writing\//)} keep' | grep '^+' | grep -c -i -E 'hccnet|grant|manuscript|step [0-9]|plan\b|finding [0-9]'
0
```

The semicolon count over the added lines, `git diff c99b4a6 -- skills/writing | grep '^+[^+]' | grep -c ';'`, printed `0`.

## The terms

- **finding**: used in `/writing`'s sense (a passage reported as a break of a named rule, with place, quoted passage and replacement). The new lines use it only so. "That finding stands under the group of one of those rules" uses it in that sense.
- **place**: used as in the existing prompt, the `file:line` or paragraph form of a finding, not the glossary's "place, of a defect" or "place, of a point".
- **standards**, **effort agent**, **reviewer**: not used in a new place.

## Judgment calls the brief left open

- The tense bullet "A finding on tense gives each sentence with its place, its passage and its replacement." and the term bullet are merged into the one bullet "Every list of places gives each place as its own entry, with its passage and its replacement." with the sub-bullet that names the tense list. Fix 2 rewrites line 162 to cover every list of places, which includes the tense list, so keeping both would state one rule twice (`docs/dev/skill-layout.md`, "Where a rule goes"). The tense entries keep their place, passage and replacement.
- The rewritten lines are bullets with sub-bullets, since each holds requirements that can be broken apart ("Lists and tables").
- The last pass is one bullet with sub-bullets, in the shape of the other bullets of the prompt. Its checks are 15 items, since the brief's items that join two requirements are split into one check each.
- The "Hedging" sentence on one strength reads "Findings on one claim at several places give it devices of one strength." The brief leaves its wording to the builder.
- Under "Terms defined at first use" the base line 14 read "Such a term is used only where the draft defines it at or before the passage, or the replacement defines it." The new text is the bullet "Such a term is used only where the draft defines it at or before the passage." with its sub-bullet "Otherwise the replacement defines it, or names its definition in square brackets as a fact for the author." The exception is kept and extended to a term the draft never defines.
- Added sentences over about 20 words that remain, each with why it needs its length. The count is the words of the sentence as `SKILL.md` and `rules.md` have it:
  - 31 words, `SKILL.md`, "A finding": "Where the draft gives neither, it is a bracket that names the number, the share of cases the claim holds in, or the specific claim, as a fact for the author." It names the three things the bracket may name, and the brief dictates the three.
  - 28 words, "The last pass": "A finding or group line that still breaks a rule after the second rewrite stays in the report, with a line that names the rule it still breaks." It states the outcome of the count and what the line names, and the ruling asks for both.
  - 25 words, "The last pass" check: "The replacement of a vague qualifier is the number, the specific claim or the bracket, never a cut that makes the claim universal ("A finding")." It lists the three accepted forms and the one refused form of a single check.
  - 23 words, "The last pass": "Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost." Ruling 1 of `7-cases.md` asks for the condition and the reason in one bullet.
  - 23 words, "The last pass" check: "Each group line names a loss that one of the group's findings shows and that holds in the draft ("How you group them")." It names the three conditions of one check.
  - 23 words, `rules.md`, "Explanation of evidence": "Evidence the paragraph gives for a claim it makes, and that is not followed by what it means for that claim, is reported." It keeps the base rule's condition and adds the scope fix 6 asks for.
  - 22 to 21 words, within "roughly 20": the lead of "The last pass" (22), the check on places (22), the first check of the pass (21), the "Terms defined at first use" line 13 (22), the sentence of "Explanation of evidence" on data used for no claim (21), "That entry names the other list's rule by its page and section, or its term, in a line of its own." (21) and "A passage that breaks two or more rules is reported once, in one finding, with one replacement that ends every break." (21). Each states one rule with its condition.

## User-visible changes

The review agent's prompt, as a user of `/writing` meets it through the report it gives:

- A passage that breaks two or more rules.
  - Before (step 6 forms): the passage was written out once under one group with a line "Also: <rule>" or a parenthesis such as "(with the Methodology tense)". In 7 grant findings the second group gave "Passage and replacement as in 5.1" and the like, and the tense group said "Sentences already rewritten in the groups above are not repeated here."
  - After: the passage is reported once, in one finding, with one replacement that ends every break. The finding names each other rule it breaks by its page and section, in a line of its own. No other group gives an entry for the passage or refers to it. A place that two lists reach is given once, in the first list, and names the other list's rule or term in the same way.
- "Hedging".
  - Before: only "A hedge of the strength the evidence carries on an interpretation is not reported."
  - After: a passage whose device already has the strength the evidence carries is not reported, whatever claim it hedges, and a replacement never swaps a device for another of the same strength. Findings on one claim at several places give it devices of one strength. The user sees fewer "Hedging" findings, and a swap such as "indicating" to "which suggests" is no longer proposed.
- The last pass.
  - Before: the agent had no step to read its report again.
  - After: the agent reads its report once more before the final message and rewrites a finding or group line that breaks a rule at most twice. One that still breaks a rule stays in the report with a line that names the rule it still breaks. A finding whose passage "What you report" says is not reported is dropped.
- Elsewhere, each with its before and after:
  - A bracket for a vague qualifier: before, it could offer an "or" alternative that left the claim universal once supplied. After, it offers none.
  - A term the draft never defines: before, a replacement could bring it in undefined. After, the replacement defines it or brackets its definition.
  - Data the paragraph uses for no claim: before, it was reported under "Explanation of evidence". After, it is not.

## Wrong or impossible in the brief

Fix 1's last sentence ("drops no finding") contradicted its own check on words section A keeps. The orchestrator ruled it in `7-cases.md` (above), and the text carries the ruling. Fix 2's "given whole under each rule's group" and decision 2 are replaced by ruling 2 of round 1, as above.

## Files

`wc -l` after the last edit:

```
     234 skills/writing/SKILL.md
     223 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     195 .scratch/3-the-writing-base/agents/reviews/7-report.md
```

`registers.md` is unchanged: no fix belongs there.

## Fixed at landing

The run over repair round 1 (`7-refuter.md`, "Repair round 1, refuted") found the points below. Each is fixed on main at landing, in `skills/writing/SKILL.md` or in this report.

- T1, T2 and T4: the rule for a passage that breaks two or more rules and the rule for a place two lists reach are one rule. The passage or place is given once, in the first group that reaches it, as a finding or as an entry of that group's list. It names each other rule or term by page and section, and no later group gives it again or refers to it. The list-of-places bullet carries that exception in a sub-bullet.
- T3: "What you report" says that a finding may carry the last pass's line on a rule it still breaks, and that the line is part of the finding.
- B1: the last pass also drops a finding whose passage an earlier group already gives, and checks that no passage or place is given twice.
- T5: the 31-word sentence on the bracket is split into a sentence and a sub-bullet. The added sentences that remain over 20 words run 21 to 23 words, each a single check or rule with its part named.
- T6: the check on a vague qualifier says the replacement takes one of the forms "A finding" gives for it, so the cut that a definition or the draft's data allow is kept.
- P1: the counts of the list-of-places sentences are 17 and 16 words.
- P2: the `metadata.version` row escapes the pipes of the quoted output.
- B2: "Elsewhere" gives the before and after of each change.

After these fixes `wc -l` prints 238 for `skills/writing/SKILL.md` and 223 for `skills/writing/references/rules.md`, and `grep -n version skills/writing/SKILL.md` prints the version line `5:  version: "1.0.0"` with the Stops table line moved to 218.
