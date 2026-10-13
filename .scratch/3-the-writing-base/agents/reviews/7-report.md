Everything in the brief is done, with the cases ruling `agents/briefs/7-cases.md` carried in C1 and C4.

# Report of step 7 of plan 3, the third fixes to /writing

## Open items of the state file

none

## The cases' first run

Base: c99b4a6. `git status --short` before any change printed nothing. The first read covered the change standard, the brief, `docs/dev/skill-layout.md`, the prose standard, the glossary, ADRs 0001 to 0003, the three pages of `skills/writing/`, `6-marks.md` from line 284, `6-report.md` lines 1 to 180, both run reports whole, and the grant paragraphs 25, 40, 41, 42 and 48 (`python3 -I skills/writing/templates/docx_paragraphs.py` on the grant copy) with the manuscript passages for filler 4, Voice 3 and Introduction paragraph 13.

### The case the brief's rules got wrong, and the ruling

Case C1, fix 1, as the hand-back gave it. Fix 1's last sentence says "The pass rewrites each finding that breaks a rule until it meets the rules, and drops no finding, since the report covers the whole draft." Its list also holds the check "a word the prose standard's section A keeps is not reported", which decision 1 names as the check that catches manuscript filler 4. For filler 4 ("just 8000 training steps", a minimality claim section A keeps) the two cannot both hold: only leaving the report makes the finding meet "is not reported". Grant 12.19 has the same shape on marker 1's reading, since paragraph 48 holds 4 sentences as the draft has it.

The orchestrator's ruling (`7-cases.md`):

1. Ruled (a). The last pass drops a finding only where "What you report" says its passage is not reported, and rewrites every other finding that breaks a rule. The bullet states both halves and keeps the reason in one clause: no break of the draft is lost.
2. Grant 12.19 stays reported. A paragraph is counted with the sentences other findings add, as `SKILL.md` line 156 counts the parts of a split and line 167 gives the text after every finding. Paragraph 48 then holds 6 sentences.
3. Manuscript Hedging 5 is a passage the rewritten "Hedging" line says is not reported, so the pass drops it under item 1.

### Each case, read on the unchanged tree

- C1, fix 1: the text already holds the rule each row broke, and the agent did not apply it. Sentence and pass check per row are in the table below. The rows that need no new rule are Limitations 1 and 4, vague qualifiers 5, Most specific term 1, Clear antecedents 1, Voice 3, section E 2 and 3, section D paragraphs 2 and 10, filler 1 and 4, section F 1 and 2, grant 1.1, 12.18, 12.19, 14.1 and 14.2, and the five group lines. Filler 4 is the ruled case.
- C2, fix 2: confirmed. `SKILL.md` "A finding" line 166 says only "one replacement that ends both breaks", and line 162 says "gives each place with its passage and replacement" without saying a place already given under another term is given again. Lines 122 and 126 forbid a reference to another finding and the agent broke them. No sentence told it to give a passage under each group.
- C3, fix 3: confirmed. Line 143 ("a bracket that names the number or the claim") let Evidence 2 and vague qualifiers 4 offer an "or" alternative that leaves the claim universal. Line 144 forbids a cut that reads as universal, not a bracket. Vague qualifiers 2, "[the specific obstacle, as \citep{jin2021predicting} reports it]", names a specific claim.
- C4, fix 4: confirmed. "Hedging" line 54, "A hedge of the strength the evidence carries on an interpretation is not reported.", states the "not reported" side only for an interpretation and says nothing against swapping a device for another of the same strength. No sentence asked for one strength across places, which Hedging 2 broke.
- C5, fix 5: confirmed. Line 13 applied only when "the draft defines it somewhere", so Terms 2 ("stem convolution", never defined) fell outside lines 13 and 14. Grant 1.1 breaks line 14 as it stood.
- C6, fix 6: confirmed. "Explanation of evidence" read "Evidence that is not followed by what it means for the paragraph's claim is reported." and said nothing of data the paragraph uses for no claim, which grant 7.1 is.
- C7: no planned change reaches a finding marked right by both. Read against the changed text, each of Limitations 2 and 3, Hedging 1, 3 and 4, vague qualifiers 1, 2 and 3, Terms 1, "No synonym cycling" 1.1, Clear antecedents 2, section D paragraphs 1 and 3, filler 2 and 3, and grant 5.1, 5.2, 11.6, 11.8, 11.9, 12.1 and 14.3 keeps its place, passage, rule and replacement. Grant 5.1, 5.2, 5.3 and 5.5 are asked in the new form by the lines "That passage and replacement are given whole under each rule's group." and "Each of the two findings names the other rule by its page and section...": each names `references/rules.md`, "Formality" instead of "group 11", and group 11 writes the passage out. The vague-qualifier brackets of vague qualifiers 1 and 3 name an amount or a share, and the bracket of vague qualifiers 2 names a specific claim, so none breaks the rewritten bullet.

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
| Voice 3 | "The replacement of a vague qualifier is the number or the specific claim." ("A finding") | "The replacement of a vague qualifier is the number, the specific claim or the bracket, and never a cut that makes the claim universal" |
| Section E 2 | the same sentence-length sentence ("A finding") | "Each sentence the replacement writes is counted when the finding names the sentence-length rule" |
| Section E 3 | the same sentence-length sentence ("A finding") | the same check |
| Section D paragraphs 2 | "Each part a split leaves meets the prose standard's section D, or the finding gives a further split." ("A finding") | "Each part of a split is counted with the sentences other findings add and holds one idea" |
| Section D paragraphs 10 | "A part is counted with the sentences that other findings add to it." ("A finding") | the same check |
| Filler 1 | "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." ("A finding") | "The replacement keeps every claim, scope word, name and strength the named rule does not change" |
| Filler 4 | "A use of a word that the prose standard's section A says stays is not reported." ("What you report") | "A word the prose standard's section A keeps is not reported", with "Drop a finding only where "What you report" says its passage is not reported, so that no break of the draft is lost." (ruling 1) |
| Section F 1 | "The replacement of a hard-wrapped paragraph writes the quoted words on one line, with a space where the line broke." ("A finding") | "The replacement of a hard-wrapped paragraph holds every quoted word" |
| Section F 2 | the same hard-wrap sentence | the same check |

### Fix 1, grant rows

| Row | Sentence that now prevents it | Pass check |
|---|---|---|
| 1.1 | `references/rules.md`, "Terms defined at first use": "Such a term is used only where the draft defines it at or before the passage." | "Each technical term the replacement brings in meets `references/rules.md`, "Terms defined at first use"" |
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
| Grant 11.1, 11.2, 11.3, 11.4, 11.5, 11.7, 11.10 | 2 | `SKILL.md`: "That passage and replacement are given whole under each rule's group." and "Each of the two findings names the other rule by its page and section, never by the number of a finding or a group." |
| Manuscript report line 229 ("No synonym cycling" 3.2) | 2 | `SKILL.md`: "An entry is written out also where an entry of another term changed the same place." with "Every list of places, such as the places of a term used under several names, the sentences of a tense list or the places of another rule, gives each place as its own entry with its place, its passage and its replacement." |
| Gate condition 1 (the eight rows with no passage, the bare file names) | 2 | the two sentences above, with "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry." (unchanged) |
| Gate condition 5 (the eight references) | 2 | the same sentences, with "It is never a reference to another finding or to the passage..." (unchanged) |
| Gate condition 2 (the five group lines) | 1 | the group-line row of the table above |
| Evidence 2 | 3 | `SKILL.md`: "The bracket offers no alternative joined by "or" that leaves the claim universal once the author supplies it." |
| Vague qualifiers 4 | 3 | the same sentence. Vague qualifiers 2 meets "A bracket that names a specific claim, such as "[the specific obstacle, as <citation> reports it]", is allowed." |
| Hedging 2 | 4 | `references/rules.md`, "Hedging": "Findings on one claim at several places give it devices of one strength." |
| Hedging 5 | 4 | "Hedging": "A passage whose device already has the strength the evidence carries is not reported." and "A replacement never swaps a device for another of the same strength." Under ruling 3 the pass drops this finding. |
| Terms 2 | 5 | "Terms defined at first use": "A replacement brings in a technical term whenever its passage does not hold the term, whether the draft defines it somewhere or never defines it." and "Where the draft defines such a term later or never defines it, the replacement defines it or names its definition in square brackets as a fact for the author." |
| Grant 7.1 | 6 | "Explanation of evidence": "A sentence that reports data the paragraph uses for no claim, such as a property of a cohort, is not reported." |

## DONE / NOT DONE

| Item | Result |
|---|---|
| Fix 1, the last pass | DONE: `SKILL.md`, "The review agent's prompt", the bullet "The last pass", after "How you group them" and before "A draft with no break", with both halves of ruling 1 |
| Fix 2, lines 162 and 166 | DONE: the list-of-places bullets and the two bullets under "A passage that breaks two rules gets one replacement that ends both breaks." |
| Fix 3, line 143 | DONE |
| Fix 4, "Hedging" line 54 | DONE |
| Fix 5, "Terms defined at first use" lines 13 and 14 | DONE |
| Fix 6, "Explanation of evidence" | DONE |
| Verify 1, the character-set check over the three pages and `7-report.md` | DONE: run after the last edit, it printed `charset exit 0` and nothing else |
| Verify 2, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | DONE: `ok: the plan-terms block equals the template` |
| Verify 3, the grep for spaced hyphens and `--` over the three pages | DONE: it printed nothing (`grep exit 1`) |
| Verify 4, `git diff c99b4a6 -- skills/writing` read whole | DONE: every changed sentence serves a fix, and the command quoted under this table printed `0` |
| Verify 5, new lines read against the standards on list items and sentence length | DONE: departures are named under the judgment calls |
| `metadata.version` | DONE: `grep -n version skills/writing/SKILL.md` prints `5:  version: "1.0.0"` |

The Verify 4 command, run from the worktree's root:

```
git diff -U0 -- skills/writing | grep '^+' | grep -c -i -E 'hccnet|grant|manuscript|step [0-9]|plan\b|finding [0-9]'
0
```

## The terms

- **finding**: used in `/writing`'s sense (a passage reported as a break of a named rule, with place, quoted passage and replacement). The new lines use it only so.
- **place**: used as in the existing prompt, the `file:line` or paragraph form of a finding, not the glossary's "place, of a defect" or "place, of a point".
- **standards**, **effort agent**, **reviewer**: not used in a new place.

## Judgment calls the brief left open

- The tense bullet "A finding on tense gives each sentence with its place, its passage and its replacement." and the term bullet are merged into one bullet, "Every list of places, such as the places of a term used under several names, the sentences of a tense list or the places of another rule...". Fix 2 rewrites line 162 to cover every list of places, which includes the tense list, so keeping both would state one rule twice (`docs/dev/skill-layout.md`, "Where a rule goes"). The tense entries keep their place, passage and replacement.
- The rewritten line 166 is three bullets, and the rewritten line 162 is two, since each holds requirements that can be broken apart ("Lists and tables").
- The last pass is one bullet with sub-bullets, in the shape of the other bullets of the prompt. Its checks are 14 items. The brief's items that join two requirements are split into two items (the section A word and the named rule's words, the claim and the relation, the number and the relation) so that each item is one check.
- The "Hedging" sentence on one strength reads "Findings on one claim at several places give it devices of one strength." The brief leaves its wording to the builder.
- Under "Terms defined at first use" the brief's line 14 is two bullets: the first keeps "Such a term is used only where the draft defines it at or before the passage." and the second adds the later-or-never case.
- Departures from the lengths and shapes of the standards pages: the vague-qualifier bullet runs to about 30 words because it names the three things the bracket may name. The last-pass lead bullet has two sentences and the sub-bullets under it carry one check each.

## User-visible changes

The review agent's prompt, as a user of `/writing` meets it through the report it gives:

- Before: a finding could read "Passage and replacement as in 5.1", a list entry could point at another item, and a bracket could offer an "or" alternative that left a claim universal. The agent had no step to read its report again.
- After: such a passage is given whole under each rule's group with the other rule named by page and section, every list entry stands alone, a bracket offers no such alternative, hedges of one claim share one strength, a term the draft never defines is defined or bracketed, and data used for no claim is not reported under "Explanation of evidence". The agent reads its report once more before the final message and drops a finding only where its passage is not reported.

## Wrong or impossible in the brief

Fix 1's last sentence ("drops no finding") contradicted its own check on words section A keeps. The orchestrator ruled it in `7-cases.md` (above), and the text carries the ruling.

## Files

`wc -l` after the last edit:

```
     227 skills/writing/SKILL.md
     223 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     149 .scratch/3-the-writing-base/agents/reviews/7-report.md
```

`registers.md` is unchanged: no fix belongs there.
