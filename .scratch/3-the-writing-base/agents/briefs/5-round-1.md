# Repair round 1 of step 5, the second fixes

The refuter report is `.scratch/3-the-writing-base/agents/reviews/5-refuter.md`. Read its verdicts and its findings Spec 1 and 2, Proof 1 and 2, Standards 1 to 4 and Behaviour 1 and 2 in full. Each ruling below says what to change. The brief `agents/briefs/5.md` still governs everything this round does not change, its Verify and Report sections included. The path list is the brief's. The rulings say what each sentence must do; the wording is yours, under the prose standard and `docs/dev/skill-layout.md`.

1. **Spec 1, manuscript 61.** The orchestrator rules that the condition on the never-cut sentence stays, since it keeps the scope of the old sentence and both markers marked 61 right. The sentences of the vague-qualifier bullet in "A finding" then agree with it:
   - A vague qualifier under the prose standard's section A is any word of the kind section A lists, listed there or not, such as "usually", "mostly", "frequently" and "rarely".
   - Its replacement replaces the qualifier with the number, the specific claim, or a bracket that names them as a fact for the author. The words "in the qualifier's place" go, and so does any sentence that ties the bracket to the qualifier's word position.
   - A new sub-bullet: where the draft holds the claim in every case, by a definition or by its own data, the replacement cuts the qualifier, and the finding names that definition or those data.
   - The never-cut sub-bullet, the swap sub-bullet and the "such as [...]" sub-bullet stay.
   - The report's judgment call 1 becomes "ruled in round 1", and its first line no longer says everything is done while a ruling is open.
2. **Spec 2.** The passage bullet of "A finding" says that a passage may be a phrase, a clause or a sentence, and that a paragraph split quotes the two sentences the split forms below name. It is no longer a closed definition.
3. **Standards 1, the scope word.** The bullet "It keeps each word that sets a claim's scope, such as an article or a quantifier." is joined to the bullet before it, so the qualifier "beyond the change the named rule asks of it" governs it: a scope word is kept unless the named rule is the one that replaces it, as section A's vague qualifiers and the table rows of `rules.md` such as "many studies", "some researchers" and "a large number of" do.
4. **Standards 1, the name.** The bullet "It names each thing by the name the draft uses for it." carries in the same bullet the exception for a finding whose named rule changes the name, as "Most specific term" does.
5. **Standards 2.** `rules.md`, "Terms defined at first use": the replacement sentence covers a technical term that the replacement brings in, which its passage does not hold, and which the draft defines somewhere. Such a term is used only where the draft defines it at or before the passage, or the replacement defines it. A term the replacement keeps from its passage is left to the section's first-use rules. This keeps grant 3 and 4 reported ("sequence" is defined in paragraph 40) and leaves manuscript 35 ("exponential moving average", which the draft never defines) and 36 ("feed-forward", which the draft never uses) as they are. The report states that reading for 35 and 36, with the search that shows it.
6. **Standards 3.** `rules.md`, "Reader's question per section": the consequence-or-gap sentence names the Introduction as its subject, so it no longer reaches a Results or a Discussion section.
7. **Standards 4.**
   - The vague-qualifier sentence of ruling 1 and the intensifier sentence of `rules.md`, "Formality", are each within the prose standard's section E, "Sentence length", or split. The intensifier sentence drops "and the word is not cut", which "of the same strength" already says.
   - `rules.md`'s sentence "The replacement stands in the place of "many": ..." goes, since ruling 1 states the rule for every vague qualifier in `SKILL.md`, under `docs/dev/skill-layout.md`, "Where a rule goes".
8. **Proof 1.** After rulings 1 to 5, read C17 again over the text as it then stands, and correct the report's C17 so that every claim holds when read against each changed sentence:
   - manuscript 25 and 58 and grant 17 to 21 under rulings 1 and 3;
   - manuscript 35 and 36 under ruling 5;
   - manuscript 61 under ruling 1;
   - grant 11 to 13, 22, 23 and 30 to 34, and every split of grant finding 29, which the reviewer did not read against every new sentence.
   - A finding whose form changes is given in its new form, with the sentence that forbids the old one.
9. **Proof 2.** The report's judgment call 3 gives the ground the removal of "Clearly connected ideas may share a sentence." rests on: marker 2 cited it for manuscript 77, 80 and 81, which the brief asks to have reported. It drops the claim that the sentence contradicts kind 12. It states what the removal widens: two clauses joined by "and", each a claim, neither cause and consequence nor contrast, are now reported.
10. **Behaviour 1.** "Every host- or user-visible change" in the report adds, each with its before and after, the six changes the reviewer lists under Behaviour 1, the changes of rulings 1, 5 and 6, and the widening of ruling 9.
11. **Behaviour 2.** The report reads grant 24 and 26 against the sentence-length bullet of "A finding" and the prose standard's section E. It counts each sentence of their replacements and states for each finding whether its form changes, and gives the new form where it does.

Verify before you report: the brief's "Verify before you report" again, over the files as they stand after this round, from the worktree.

Report: `5-report.md` in the worktree's ledger, rewritten in place, with a section "Repair round 1" that has one row per ruling above with what changed and where. Anything not done comes first. Run no git command that changes state.
