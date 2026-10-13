# Step 3 report: the fixes to `/writing`

Everything in the brief and in repair round 1 is done.

## Open items of the state file

none

## The cases' first run

The first run of C1 to C10 on the unchanged tree, as handed back before any change (`git status --short` printed nothing at that time). The ruling that followed is under "The ruling" below.

Sentences of the unchanged tree that bear on the cases:

- `skills/writing/SKILL.md:108`: "a proposed replacement, or "delete" for a passage to cut. A replacement that needs a fact only the author has names the fact in square brackets."
- `skills/writing/SKILL.md:103`: the place form for an included file.
- `skills/writing/SKILL.md:109`: "Under each group's heading, one line says why the group stands where it does."
- `skills/writing/SKILL.md:95`: "The one command you run for the draft is the one the prompt gives for a `.docx`."
- `skills/writing/SKILL.md:84`: "The session writes no file and adds no finding of its own."

Commands: `cat -n` of the three skill files; `grep -n -i -E 'scope|strength|number|claim|clause|sentence' skills/writing/SKILL.md`; `grep -n -i -E 'delete|cut'` over the three files; `grep -n -i replacement skills/writing/references/rules.md`; a per-paragraph count of the terms below over `3-2-grant-paras.txt`; `grep -rn` over the manuscript copy; `LC_ALL=C grep -n '[^ -~]'` on `main.tex` (printed `75:\author[3]{St<e acute>phanie. M. van den Berg}`) and the same grep piped from `python3 skills/writing/templates/docx_paragraphs.py` on the grant copy (printed `67:64: Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026`, exit 0).

- C1 (kind 1, 27 findings): no sentence of `skills/writing/` keeps the review agent from any of them. Nothing says a replacement keeps every claim and clause, keeps scope and strength, adds no number, reads as a sentence in place of the passage, or avoids making a usual case universal. `SKILL.md:108` brackets only facts the author has, not numbers the agent computes (manuscript 17, 46, 84). The prose standard section A covers the cut of "typically" in manuscript 82 but sits outside `skills/writing/` (ADR 0001). Result: none, 27 of 27. Kind 1 as the brief worded it also forbade the change the Hedging and Limitations rules ask (see "The ruling").
- C2 (kind 2):
  - "Evidence for claims", manuscript 2 and 13: `rules.md:46` ("neither evidence nor a citation") already excludes a cited claim by its words, and the agent misread it. Manuscript 1, 3, 4: the words do not say that evidence the draft gives in its text, a table or a figure counts, cited or not, nor what to do with a claim the data contradict. Result: none for 1, 3, 4.
  - "Terms defined at first use", manuscript 28 and 34: the old words ("defined where it first appears") already exclude a term that is defined. Grant 8 and 9: "A technical term" already excludes a role word. `rules.md:8` ("names the fact the author must supply") lets the agent report any missing fact. Manuscript 29: nothing excludes a wrong criterion. Result: none states the limit.
  - "Clear antecedents", grant 41, 42, 43: nothing excludes "this" or "such" with its noun. Result: none.
  - "Most specific term", manuscript 52 and grant 33: `rules.md:12` ("a general word where a specific term exists") already excludes grant 33 (no general word). Nothing excludes the right word (manuscript 52) or a missing threshold. Result: none states it.
  - "Hedging", manuscript 21: `rules.md:28` to `:38` lists what is hedged and what is cut but does not say a hedge of the right strength on an interpretation is not reported. Result: none.
  - "Paragraph point" and "Reader's question per section", manuscript 49: `rules.md:112` ("States the contribution in one sentence") is met by the first sentence; nothing says generality is not a break. Result: none.
  - Section A "just", manuscript 92: only the prose standard keeps minimality claims. Result: none in `skills/writing/`.
- C3 (kind 3, grant 1, 4, 5, 12): `rules.md:7` says "where it first appears", with no whole-draft reading and nothing on the replacement's own terms. Terms checked in the copy: "background-liver" first at paragraph 31, "components" at 31, "readout" at 35, "detection limit" at 37, "alignment check" at 46. Result: none.
- C4 (kind 4, manuscript 1, 119, 120, grant 37): `SKILL.md:108` allows "delete" for any passage "to cut". For manuscript 1, `rules.md:46` ("adds the evidence or the citation") already makes "delete" wrong by its words. For manuscript 119, 120 and grant 37 only prose standard section 0 says to rewrite, outside `skills/writing/`. Result: none in `skills/writing/` for 119, 120, 37.
- C5 (kind 5):
  - Places (manuscript 2, 24, 64, 65, 75): `SKILL.md:103` gives the path form for "its place", which covers the first place only. Nothing covers a further place or a description such as "the table captions". Result: partly, first place only.
  - Checking the place before reporting (grant 51): none.
  - Additions (manuscript 27, grant 24): `SKILL.md:107` requires a quoted passage, which the absence findings lack. No form for an addition. Result: required by the words, no form given.
  - Structure findings (manuscript 95 to 110, 117, 118; grant 54 to 61): `SKILL.md:107` requires a quoted passage and the findings quote only split points. No form. Result: partly.
  - Terms under several names, tense (manuscript 36, 37, 39 to 42, 62 to 65): none.
  - Replacement as text, not an instruction (manuscript 2, 13, 75, 78, 80, 112; grant 13, 35, 38, 60, 61): `SKILL.md:108` does not say a replacement is text. Result: none.
  - Counts (manuscript 108, grant 54): none. The counts of Decision 1 hold: conclusion.tex:1 has 8 sentences split 3, 3 and 2; grant paragraph 31 has 8 split 3, 3 and 2.
- C6 (kind 6, grant 37 and 38 against 35 and 17): no sentence on findings that conflict. Result: none.
- C7 (kind 7, 17 groups): `SKILL.md:109` already requires a line that says why the group stands where it does. The 8 groups with no line break it by its words. The 9 whose line only restates the rule or describes the breaks need the new content (what the reader loses or misreads). Result: 8 covered by the old words, 9 not.
- C8 (kind 8, six commands): command 4 (redirect) breaks `SKILL.md:95` ("run no command that writes"). Commands 1 to 3 (`cat -n` through a shell), 5 and 6 (folder-wide counts and greps) break "the one command" only by an arguable reading, since the sentence names the command for a `.docx` and says nothing on how a text draft is read. Nothing names the file-reading act. Result: partly, no act named.
- C9 (kind 9, four files): `SKILL.md:84` stands in Steps 7, after the run. Steps 3 and 5 say nothing on where the file list or the prompt is held. Result: none at Steps 3 and 5.
- C10 (14 findings, read against the brief's planned rules):
  - Manuscript 30: "DINO" first appears at introduction.tex:11 (the abstract has none), so its place stays.
  - Manuscript 33: "SSL" appears only at 1_baseline.tex:3, so its place stays.
  - Manuscript 5, 103 and grant 44 take the new form; manuscript 35 combines with the `a_data.tex:1` absence as Decision 1, example 4.
  - Manuscript 55 and 57: the tense and "simple" changes are carried from other findings on the same passage (kind 6).
  - Manuscript 61: "delete" under prose standard section 0; kind 4 as the brief worded it forbade it.
  - Grant 2, 3, 63: places hold ("usable" first at 35, "divergence" first at 35, "organ map" at 40 and 41, "image point" at 41); grant 63's renames reach the same places as grant 27 and 29, so kind 3 and kind 6 apply.
  - Grant 16 and 18: forbidden by kind 1 as the brief worded it.

## The ruling

`agents/briefs/3-cases.md`, three rulings, applied:

1. Kind 1 reads "changes no claim's scope or strength beyond the change the named rule asks of it", with the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations" as the changes the rules ask. Option (b), keeping kind 1 literal, was the lazy one.
2. Kind 4 reads "delete" where the named rule says to cut or delete the passage, or bans a passage that carries no claim of the draft; where the rule says to rewrite, the replacement is the rewritten text. Manuscript 1, 119, 120 and grant 37 break it; manuscript 61 stands.
3. Grant 44 is added text under kind 5's addition form, a claim the draft's own data hold.

## The findings and the failures, and the sentence that now prevents each

Each row quotes the sentence as it stands after repair round 1, with its file and section. A `/` between two parts of a quote marks two consecutive bullets. A cell with two or more quotes lists them with a line break between.

| Finding or failure | Kind | The sentence that now prevents it |
|---|---|---|
| manuscript 1 | 2, 4 | `skills/writing/references/rules.md`, "Evidence for claims": "Evidence the draft gives in its text, a table or a figure counts, cited or not. A claim that has such evidence is not reported under this section."<br>`skills/writing/references/rules.md`, "Evidence for claims": "A number or a claim that the draft's own data contradict is a question of content. No rule of the review covers it."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: ""delete" is the replacement where the named rule says to cut or delete the passage."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you report": "A passage is reported under a rule only when that rule's own words describe the break. A defect that no rule's words describe is not reported." |
| manuscript 2 | 1, 5 | `skills/writing/references/rules.md`, "Evidence for claims": "Evidence the draft gives in its text, a table or a figure counts, cited or not. A claim that has such evidence is not reported under this section."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", place: "Every place a finding names, the first and every further one, is in one of these forms. A description such as "the table captions" is not a place."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It is text that stands in place of the passage and reads as a sentence there. It is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"." |
| manuscript 3 | 1, 2 | `skills/writing/references/rules.md`, "Evidence for claims": "A claim that the draft's own data hold only in part is reported under "Limitations and alternative interpretations". The replacement is the limit."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"."<br>`skills/writing/references/rules.md`, "Evidence for claims": "A number or a claim that the draft's own data contradict is a question of content. No rule of the review covers it." |
| manuscript 4 | 1, 2 | `skills/writing/references/rules.md`, "Evidence for claims": "A number or a claim that the draft's own data contradict is a question of content. No rule of the review covers it."<br>`skills/writing/references/rules.md`, "Evidence for claims": "Evidence the draft gives in its text, a table or a figure counts, cited or not. A claim that has such evidence is not reported under this section."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It adds no number that the draft does not give." |
| manuscript 12 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| manuscript 13 | 2, 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you report": "A passage is reported under a rule only when that rule's own words describe the break. A defect that no rule's words describe is not reported."<br>`skills/writing/references/rules.md`, "Evidence for claims": "Evidence the draft gives in its text, a table or a figure counts, cited or not. A claim that has such evidence is not reported under this section."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It is text that stands in place of the passage and reads as a sentence there. It is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 15 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 16 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| manuscript 17 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "A number it gives stands in the draft as the replacement uses it. / A number you would compute is given in square brackets as a fact for the author. Ratios, averages and percentages are such numbers." |
| manuscript 19 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| manuscript 20 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "A relation or a limit it states holds in the draft's own data." |
| manuscript 21 | 1 | `skills/writing/references/rules.md`, "Hedging": "A hedge of the strength the evidence carries on an interpretation is not reported."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 23 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 25 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "A relation or a limit it states holds in the draft's own data." |
| manuscript 27 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", added text: "A finding that adds text quotes the sentence where the added text belongs. Examples are an absence, a missing citation and a missing explanation. / Its replacement is that sentence, as it reads after every other finding on it, followed by the added text. / The added text is the author's fact in square brackets, or a claim that the draft's own data hold." |
| manuscript 28 | 2 | `skills/writing/references/rules.md`, "Terms defined at first use": "A defined term whose value, selection rule or the person responsible is missing is not reported under this section." |
| manuscript 29 | 1 | `skills/writing/references/rules.md`, "Terms defined at first use": "A sentence that states a criterion other than the one the author meant is not reported under this section."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 34 | 2 | `skills/writing/references/rules.md`, "Terms defined at first use": "A defined term whose value, selection rule or the person responsible is missing is not reported under this section." |
| manuscript 45 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| manuscript 46 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "A number it gives stands in the draft as the replacement uses it. / A number you would compute is given in square brackets as a fact for the author. Ratios, averages and percentages are such numbers." |
| manuscript 49 | 2 | `skills/writing/references/rules.md`, "Paragraph point": "A first sentence that states the paragraph's point is not reported for being general."<br>`skills/writing/references/rules.md`, "Reader's question per section": "A first sentence that states the section's contribution is not reported for being general." |
| manuscript 52 | 2 | `skills/writing/references/rules.md`, "Most specific term": "A word that is the right term for what it names is not reported under this section."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 54 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 56 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 59 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It is text that stands in place of the passage and reads as a sentence there. It is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"." |
| manuscript 68 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 82 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "For a vague qualifier it keeps a claim that holds usually stated as usual, and never cuts the qualifier so that the claim reads as universal." |
| manuscript 84 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "A number it gives stands in the draft as the replacement uses it. / A number you would compute is given in square brackets as a fact for the author. Ratios, averages and percentages are such numbers." |
| manuscript 88 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 92 | 2 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you report": "A use of a word that the prose standard's section A says stays is not reported." |
| manuscript 94 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 108 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", counts: "Count before you state a count of sentences in a paragraph or of words in a sentence."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "Each part a split leaves meets the prose standard's section D, or the finding gives a further split." |
| manuscript 113 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| manuscript 117 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "A hard-wrapped paragraph quotes the end of the first line and the start of the next. "..." stands for the rest. Its replacement is the same words with the line break replaced by a space." |
| manuscript 119 | 4 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: ""delete" is the replacement where the named rule says to cut or delete the passage." |
| manuscript 120 | 4 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too." |
| grant 1 | 3 | `skills/writing/references/rules.md`, "Terms defined at first use": "A technical term is defined where it first appears in the whole draft. / A `.tex` draft is read as one document and a `.docx` draft from paragraph 1. / A draft that uses a technical term before it defines it, or never defines it, is reported. / The finding names the term's first use. / The replacement adds the definition at that first use, or names the fact the author must supply."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "The replacement introduces no term before the place the draft defines it." |
| grant 4 | 3 | `skills/writing/references/rules.md`, "Terms defined at first use": "A technical term is defined where it first appears in the whole draft. / A `.tex` draft is read as one document and a `.docx` draft from paragraph 1. / A draft that uses a technical term before it defines it, or never defines it, is reported. / The finding names the term's first use. / The replacement adds the definition at that first use, or names the fact the author must supply."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "The replacement introduces no term before the place the draft defines it."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "A replacement that removes or renames a term gives a finding, or a place with its replacement, for every use of it." |
| grant 5 | 3 | `skills/writing/references/rules.md`, "Terms defined at first use": "A technical term is defined where it first appears in the whole draft. / A `.tex` draft is read as one document and a `.docx` draft from paragraph 1. / A draft that uses a technical term before it defines it, or never defines it, is reported. / The finding names the term's first use. / The replacement adds the definition at that first use, or names the fact the author must supply."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "The replacement introduces no term before the place the draft defines it." |
| grant 8 | 2 | `skills/writing/references/rules.md`, "Terms defined at first use": "This section covers technical terms only. A plain word for a role or a thing, such as "the analyst", is not reported under it."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "A defined term whose value, selection rule or the person responsible is missing is not reported under this section." |
| grant 9 | 2 | `skills/writing/references/rules.md`, "Terms defined at first use": "This section covers technical terms only. A plain word for a role or a thing, such as "the analyst", is not reported under it."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "A defined term whose value, selection rule or the person responsible is missing is not reported under this section." |
| grant 12 | 3 | `skills/writing/references/rules.md`, "Terms defined at first use": "A replacement that removes or renames a term gives a finding, or a place with its replacement, for every use of it."<br>`skills/writing/references/rules.md`, "Terms defined at first use": "A technical term is defined where it first appears in the whole draft. / A `.tex` draft is read as one document and a `.docx` draft from paragraph 1. / A draft that uses a technical term before it defines it, or never defines it, is reported. / The finding names the term's first use. / The replacement adds the definition at that first use, or names the fact the author must supply." |
| grant 33 | 2 | `skills/writing/references/rules.md`, "Most specific term": "A missing number or threshold is not reported under this section." |
| grant 37 | 4, 6 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", findings on one passage: "A passage that breaks two rules gets one replacement that ends both breaks." |
| grant 38 | 5, 6 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It is text that stands in place of the passage and reads as a sentence there. It is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", findings on one passage: "Findings on one passage, or on two places of one claim, propose changes that can all be applied together." |
| grant 41 | 1, 2 | `skills/writing/references/rules.md`, "Clear antecedents": "A pronoun such as "this" or "it" that stands alone, with no clear antecedent, is reported. The replacement names the noun the pronoun stands for, and is never another pronoun."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| grant 42 | 2 | `skills/writing/references/rules.md`, "Clear antecedents": "A determiner with its noun, such as "this variation" or "such summaries", is not reported under this section." |
| grant 43 | 2 | `skills/writing/references/rules.md`, "Clear antecedents": "A determiner with its noun, such as "this variation" or "such summaries", is not reported under this section." |
| grant 45 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It changes no claim's scope or strength beyond the change the named rule asks of it. Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| grant 51 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", place: "Before you report a place, check the quoted passage. It stands at that line, or in that paragraph of the command's output." |
| grant 54 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "Each part a split leaves meets the prose standard's section D, or the finding gives a further split."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", counts: "Count before you state a count of sentences in a paragraph or of words in a sentence." |
| grant 62 | 1 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| Place failure: manuscript 2, 24, 64, 65, 75 (a further place without its path, a description) | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", place: "Every place a finding names, the first and every further one, is in one of these forms. A description such as "the table captions" is not a place." |
| Place failure: grant 51 (passage in another paragraph) | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", place: "Before you report a place, check the quoted passage. It stands at that line, or in that paragraph of the command's output." |
| Addition failure: manuscript 27 and grant 24 (no quoted passage) | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", added text: "A finding that adds text quotes the sentence where the added text belongs. Examples are an absence, a missing citation and a missing explanation. / Its replacement is that sentence, as it reads after every other finding on it, followed by the added text. / The added text is the author's fact in square brackets, or a claim that the draft's own data hold." |
| Structure failures: manuscript 95 to 110, 117, 118 and grant 54 to 61 (split points, joins, lists) | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "A paragraph split quotes the last sentence before the break and the first sentence after it. Its replacement is the same two sentences with an empty line between them."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "Each part a split leaves meets the prose standard's section D, or the finding gives a further split."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "A list quotes the sentence that holds the items. Its replacement is the list as text, introduced with a colon."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "A hard-wrapped paragraph quotes the end of the first line and the start of the next. "..." stands for the rest. Its replacement is the same words with the line break replaced by a space." |
| Several names and tense failures: manuscript 36, 37, 39 to 42, 62 to 65 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", several names and tense: "A finding on a term used under several names gives each place with its passage and replacement. / A finding on tense gives each sentence with its replacement." |
| Instruction failures: manuscript 2 (second place), 13, 75, 78, 80, 112 and grant 13, 35, 38, 60, 61 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "It is text that stands in place of the passage and reads as a sentence there. It is never an instruction such as "the past tense throughout", "split before ...", "join lines" or "add [citations]"." |
| Count failures: manuscript 108 and grant 54 | 5 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", counts: "Count before you state a count of sentences in a paragraph or of words in a sentence."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", paragraph, list, line break: "Each part a split leaves meets the prose standard's section D, or the finding gives a further split." |
| Conflict: grant 37 and 38 against grant 35 and 17 | 6 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", findings on one passage: "Findings on one passage, or on two places of one claim, propose changes that can all be applied together."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", findings on one passage: "A passage that breaks two rules gets one replacement that ends both breaks."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", findings on one passage: "A change of wording that another finding on the same passage proposes is carried in the replacement."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", replacement: "Where the rule says to rewrite, the replacement is the rewritten text, in a comment too." |
| Gate condition 2: the eight groups with no line (manuscript groups 14, 16, 17; grant groups "Explanation of evidence", "Tense per section", "Passive voice", "Formality", "Three or more list-shaped items") | 7 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "How you group them": "Every group heading is followed by one line." |
| Gate condition 2: the nine groups whose line does not say why (manuscript groups 8, 11, 12, 13; grant groups "Evidence for claims", "A. Vocabulary (vague qualifiers)", "registers.md, Voice", "Paragraphs cover one idea ...", "Sentence length") | 7 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "How you group them": "The line names what the reader loses or misreads through the group's breaks. That loss is why the group stands where it does."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "How you group them": "A line that only restates the rule or describes the breaks is replaced by one that names that loss." |
| Gate condition 3: manuscript agent commands 1 to 3 (`cat -n` through a shell) | 8 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you read": "Each file of a `.tex`, `.md` or `.txt` draft is read whole with the runner's file-reading tool. A long file takes as many reads as it needs, with no part left out."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you run": "The one command you run on a `.tex`, `.md` or `.txt` draft is `LC_ALL=C grep -n '[^ -~]' <file>`, for the prose standard's ASCII rule. You run it once for each file." |
| Gate condition 3: command 4 (`> rev_part3.txt`, a write) | 8 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you run": "Command output stays in the command's result. You redirect none of it to a file."<br>`skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you read": "Each file of a `.tex`, `.md` or `.txt` draft is read whole with the runner's file-reading tool. A long file takes as many reads as it needs, with no part left out." |
| Gate condition 3: commands 5 and 6 (folder-wide `grep -r` and counts) | 8 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you run": "The one command you run on a `.tex`, `.md` or `.txt` draft is `LC_ALL=C grep -n '[^ -~]' <file>`, for the prose standard's ASCII rule. You run it once for each file." |
| Gate condition 3: the `.docx` run (one command, no pipe through the ASCII grep) | 8 | `skills/writing/SKILL.md`, "The review agent's prompt", "A finding", "What you run": "On a `.docx` draft you run the command the prompt gives. You then run the same `grep` on that command's output through a pipe." |
| Deviation 1: `3-2-manuscript-files.txt` (the file list written to a file) | 9 | `skills/writing/SKILL.md`, Steps 3: "The session holds the list in its own message and writes it to no file." |
| Deviation 1: `3-2-prompt.md`, `3-2-prompt-body.md`, `3-2-prompt-manuscript.md` (the prompt written to files) | 9 | `skills/writing/SKILL.md`, Steps 5: "The session writes the prompt and the paths in the start call itself and writes them to no file." |

## C10 after the change

- Manuscript 5, `c_variants.tex:10`, "Evidence for claims": the quoted sentence is "..., HCCNet-C retains $A = 4$ self-attention heads at $H = 448$ (i.e., a head dimension of 112), which we found to have no adverse effect on convergence." Its replacement is that sentence followed by "[the evidence, for example the training-loss curves of HCCNet-C against HCCNet-P, in an appendix]". The draft holds no evidence for this claim, so "Evidence for claims" still reports it. Sentence: "A finding that adds text quotes the sentence where the added text belongs."
- Manuscript 30, `introduction.tex:11`, "Terms defined at first use": the first use of "DINO" is this line (the abstract has none); place, passage and rule stay.
- Manuscript 33, `1_baseline.tex:3`: "SSL" has no earlier use; the finding stays.
- Manuscript 35 with the absence, `a_data.tex:1`: replacement "We evaluated HCCNet on data collected retrospectively from a cohort of liver cirrhosis patients ..." followed by "The study is reported following [the reporting guideline, for example TRIPOD]." ("A passage that breaks two rules gets one replacement that ends both breaks.")
- Manuscript 55 and 57: the replacements carry the tense and the dropped "simple" that findings on the same passage propose ("A change of wording that another finding on the same passage proposes is carried in the replacement.").
- Manuscript 61, `discussion.tex:16`: "Despite these successes, several challenges and limitations were identified." carries no claim, so "delete" stands under the second "delete" bullet of "A finding" (the named rule bans a passage that carries no claim of the draft).
- Manuscript 103, `b_implementation.tex:1` (6 sentences): passage "... we decay the learning rate using a cosine schedule. We employ the same cosine decay without warm-up ..."; replacement the same two sentences with an empty line between them; the parts hold 4 and 2 sentences.
- Grant 2, 3: the first use of "usable study" and of "divergence score" is paragraph 35, where the findings stand; their replacements define the term there and use no term before its definition.
- Grant 16 and 18: stand under "It changes no claim's scope or strength beyond the change the named rule asks of it": "could" is the device of the right strength, "hepatitis B virus-related cirrhosis" is the limit.
- Grant 44, paragraph 40: passage "Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients."; replacement that sentence followed by "The matching in C2 on the interval since the previous study accounts for this difference."
- Grant 63, paragraph 41: stands with grant 27 and 29 as one replacement for the shared words, split into three sentences.

## DONE / NOT DONE

| Item | State | Evidence |
|---|---|---|
| Kind 1 to 9 and rulings 1 to 3 of the cases ruling | DONE | the table above |
| Rulings 1 to 10 of repair round 1 | DONE | "Repair round 1" below |
| Verify 1, character set | DONE | no output, `exit 0` ("The checks as run") |
| Verify 2, glossary | DONE | `ok: the plan-terms block equals the template`, `exit 0` |
| Verify 3, no spaced dash | DONE | no output, `exit 1` |
| Verify 4, the diff | DONE | `git diff e00f6bd` over `skills/writing` read whole after the round; the name grep printed nothing, `exit 1` |
| Verify 5, lists and sentence length | DONE | "Departures from the lists and sentence-length rules" |
| `metadata.version` | DONE | stays "1.0.0" |
| Paths | DONE | `git status --short` lists `M skills/writing/SKILL.md`, `M skills/writing/references/rules.md`, and under the ledger `3-cases.md`, `3-round-1.md` and this report |

## Departures from the lists and sentence-length rules

After the round, a count of every added sentence of the diff of `skills/writing` against aa513eb (inline code counted as one word) finds five over roughly 20 words:

- `SKILL.md` "What you run", the `grep` bullet (21 words): the command and its purpose in one sentence.
- `SKILL.md` "A finding", "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." (21 words): the words are given by repair round 1, ruling 4.
- `SKILL.md` "A finding", the vague-qualifier bullet (27 words): the words are given by ruling 5.
- `rules.md` "Terms defined at first use", "A replacement that removes or renames a term gives a finding, or a place with its replacement, for every use of it." (23 words): the two forms of the result and the scope in one rule.

- `SKILL.md` "A finding", "Before you report a place, check that the quoted passage stands at that line, or in that paragraph of the command's output." (22 words): one check, which a split leaves without its object (fixed at landing, after the run over repair round 1, Standards 1).

Bullets of `rules.md` that hold "is reported. The replacement is ..." in one bullet follow the form every section of that page already uses: a rule and the replacement it asks for.

## Terms

- finding (`docs/glossary.md`, "finding"): used in the prompt as the passage `/writing` reports as a break of a named rule; unchanged entry.
- session (`docs/glossary.md`, "session, the"): "The session holds the list ...", "The session writes the prompt ..." use it as the Claude Code session that runs the skill.
- case: not used in the new text (ruling 5 removed the one use).

## Files

```
     178 skills/writing/SKILL.md
     208 skills/writing/references/rules.md
      52 skills/writing/references/registers.md
     438 total
```

## Judgment calls the brief left open

- The kind 5, 6 and 1 rules sit under "A finding" as nested bullets, so each is in the prompt block the session gives whole (Decision 2).
- The added text of an addition may be "the author's fact in square brackets, or a claim that the draft's own data hold", from cases ruling 3.
- `references/registers.md` is not changed: no fix of the 52 findings or the gate failures belongs there.
- The group-line rule is three bullets under "How you group them", one rule each.

## Host- or user-visible changes

- The review agent's prompt, before: it read a text draft by any means, ran any command, reported a replacement as "a proposed replacement, or "delete" for a passage to cut", and gave one line under each group that says why the group stands where it does. After: it reads each text file with the file-reading tool, runs only `LC_ALL=C grep -n '[^ -~]' <file>` per file (and, for a `.docx`, the script command plus that grep through a pipe), writes nothing to a file, reports a passage only under a rule whose words describe it, gives each finding its places in path form and checked, a replacement that is text and keeps the passage's claims, and a line under each group that names what the reader loses.
- The session's run, before: "The session writes no file and adds no finding of its own." stood at Steps 7. After: the sentence stands at Steps 7 as before, and Steps 3 states that the file list stays in the session's message and Steps 5 that the prompt and paths are written in the start call itself.
- `references/rules.md`, what `/writing` reported before and what it reports after, one example passage each (the examples are passages of the step 2 copies):
  - "Terms defined at first use", technical terms only: before it reported "The analyst receives only studies taken before diagnosis" (grant paragraph 41) as a term never defined; after it does not, since "the analyst" is a plain word for a role.
  - "Terms defined at first use", a defined term with a missing value, selection rule or person responsible: before it reported "we randomly shift and scale the intensity by a constant $v$" (appendix) for the missing value of $v$; after it does not.
  - "Terms defined at first use", a sentence that states a criterion other than the one meant: before it reported "we additionally exclude all patients without a definitive diagnosis of HCC" as an undefined term; after it does not.
  - "Terms defined at first use", the whole-draft first use and every use of a renamed term: before it proposed a definition at the paragraph where it met the term ("how the background liver changes", paragraph 34) although the term first appears in paragraph 31; after it names the first use, and a replacement that renames a term gives a place for every use.
  - "Most specific term", the right term for what it names: before it reported "registered using a Philips Ingenia Elition scanner" as a general word; after it does not.
  - "Most specific term", a missing number or threshold: before it reported "Success means the future tumour segment ranks above these random relabellings" (grant paragraph 43); after it does not.
  - "Clear antecedents", a determiner with its noun: before it reported "estimates this scan-to-scan variation" (grant paragraph 42); after it does not, and a pronoun standing alone is reported with a noun, never another pronoun, as its replacement.
  - "Hedging", a hedge of the right strength on an interpretation: before it reported "appear to display less expressive characteristics" as a hedge on data to cut; after it does not.
  - "Evidence for claims", evidence the draft gives: before it reported "which indicate that compared to the differences between imaging modalities model size only negligibly affects downstream model performance", which cites its table; after it does not.
  - "Evidence for claims", a claim the data hold only in part: before it was reported here, and after it is reported under "Limitations and alternative interpretations" with the limit as the replacement ("All differences between configurations fall within one standard deviation across folds").
  - "Evidence for claims", a number or a claim the draft's own data contradict: before it was reported under "Evidence for claims" ("versions of about 0.5x, 0.75x, 2x, and 4x the base model's size" against the parameter counts in the same section); after it is reported under no rule, since it is a question of content. A user of `/writing` therefore no longer gets a finding for a contradicted number and reads a clean report as not covering it.
  - "Paragraph point": before, a paragraph's first sentence that states its point could be reported for being general, such as "Each component is trained on its own before the joint fine-tuning."; after it is not. The runs of step 2 reported no finding of this kind under "Paragraph point".
  - "Reader's question per section": before it reported a conclusion's first sentence that states the contribution ("In this work, we presented a framework for longitudinal medical image analysis ...", manuscript 49); after it does not.

## Anything in the brief that was wrong or impossible

- Kind 1 as worded forbade the replacement that Hedging and Limitations ask for (manuscript 3, 25, grant 16, 18); ruled in `agents/briefs/3-cases.md`, ruling 1.
- Kind 4 as worded forbade manuscript 61's "delete"; ruled in ruling 2.
- Kind 8's two commands were run on the copies before they were written: the ASCII grep prints `main.tex` line 75 only, and the grep after the `.docx` command prints paragraph 64.

## Repair round 1

Round brief `agents/briefs/3-round-1.md`, refuter report `agents/reviews/3-refuter.md`. Nothing is left undone.

| Ruling | What changed |
|---|---|
| 1, Spec 1 | `rules.md` "Terms defined at first use" opens with "This section covers technical terms only. A plain word for a role or a thing, such as "the analyst", is not reported under it."; the missing-value bullet says "the person responsible" in place of "holder". |
| 2, Spec 2 | `SKILL.md` Steps 7 reads "The session writes no file and adds no finding of its own."; the sentences at Steps 3 and 5 stay. |
| 3, Spec 3 | The scope-and-strength bullet of "A finding" ends "Examples are the device of the right strength under "Hedging" and the limit under "Limitations and alternative interpretations"." |
| 4, Standards 4 | The bullet reads "It ends the break and keeps every claim and clause of the passage that the named rule does not cut." |
| 5, Standards 5 | The vague-qualifier bullet reads "For a vague qualifier it keeps a claim that holds usually stated as usual, and never cuts the qualifier so that the claim reads as universal." |
| 6, Proof 1 and Standards 1 | The listed sentences are split: in `SKILL.md` the second "delete" bullet, the computed-number sentence, the place check, the count bullet, the paragraph-form lead bullet, the added-text lead bullet, the list bullet, the hard-wrap bullet, the `.docx` pipe bullet and the group-line bullet; in `rules.md` the first-use bullet, the "Evidence for claims" bullets and "Most specific term" first bullet. A count of every added sentence of the diff leaves the four named under "Departures". |
| 7, Standards 3 | The bullet reads "Each part a split leaves meets the prose standard's section D, or the finding gives a further split." |
| 8, Standards 2 | Two bullets each: the several-names and the tense bullets; "A number it gives stands in the draft as the replacement uses it." and the computed-number bullet; in `rules.md` the first-use bullet becomes "A technical term is defined where it first appears in the whole draft.", the `.tex` and `.docx` reading, the report bullet and "The finding names the term's first use."; "Reader's question per section" is three bullets above the table. |
| 9, Spec 4 | "The checks as run" below quotes the character-set check whole, as run. |
| 10, Behaviour 1 | "Host- or user-visible changes" gives, for each scope bullet of `rules.md`, what `/writing` reported before and after with one example passage, and a line of its own for the contradicted number or claim, reported before under "Evidence for claims" and under no rule after. |

## The checks as run

Run after the last edit of the round, from the worktree's root.

```
$ printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit $?"
ok: the plan-terms block equals the template
exit 0
$ grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
$ grep -n -i -E 'rc\.1|step [0-9]|plan 3|finding [0-9]|manuscript [0-9]|grant [0-9]' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md; echo "exit $?"
exit 1
```
