# Step 5 brief check (on main at 1c26ac1)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/5.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`. Brief lines are given as `5.md:N`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

State of the tree I read: `git log --oneline -3` printed `1c26ac1 Land step 4 of plan 3, the repeated runs, unticked` as head. `git status --short` printed ` M .scratch/3-the-writing-base/orchestrator-state.md`, ` M .scratch/3-the-writing-base/plan.md` and `?? .scratch/3-the-writing-base/agents/briefs/5.md`. `git diff` of `plan.md` shows step 5's line corrected as the brief's premise says.

## 1. Names

The step renames no file, heading, key, function or term. It rewrites sentences under existing labels: `SKILL.md` "The review agent's prompt" ("A finding", "How you group them", "What you run"), and `references/rules.md` "Formality", "Evidence for claims" and "Most specific term", and `references/registers.md` "Voice".

- I searched for 'stated as usual', 'same two sentences', 'vague qualifier', 'How you group them', 'What you run', '"A finding"', 'Evidence for claims', 'Most specific term', 'Formality', 'review agent' and "writing`, \"The review agent's prompt\"". The command was `grep -rn -F -- "<name>" skills docs README.md utils .agents/plan.yaml | grep -v '^skills/writing/'`.
  - The first nine names have no hit outside the step's paths.
  - 'review agent' hits `skills/plan/templates/plan.yaml:27`, `skills/repo-setup/templates/plan-terms.md:39,41,99`, `docs/glossary.md:44,46,104` and `README.md:77`. Each says who launches the review agent, on which model and at which effort. The step changes none of that, so none becomes false.
  - The heading reference "`writing`, \"The review agent's prompt\"" hits `plan-terms.md:41` and `docs/glossary.md:46` (the term **finding**). The heading stays, and the term's sense ("with its place, the quoted passage and a proposed replacement") stays true. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
- `grep -rn "skills/writing\|references/rules.md\|references/registers.md" docs README.md skills --include='*.md' | grep -v '^skills/writing/'` printed rows that describe the files at section level:
  - `docs/academic-coverage.md:76,100,101`;
  - ADR 0001 lines 11, 15 and 16;
  - `docs/roadmap.md:25,200`;
  - `docs/dev/scripts.md:23`.
  None of them is made false, since every section they name stays.

Findings: none.

## 2. The step line

The step line (plan.md step 5, as on disk) has these parts:

- "each finding of step 4 not marked right by both markers (`agents/reviews/4-marks.md`) ... fixed in `skills/writing/SKILL.md` or `skills/writing/references/`": served by the paragraph of "What to build" and kinds 1 to 12 (5.md:26 to 41).
- "each failure of a gate condition on the runs that step 4's report ... names": served by the paragraph of "What to build" and kinds 1, 2, 3, 13 and 14 (5.md:30 to 43).
- "apart from the markers' reading under condition 6 and the session's `sleep` under condition 4, which ... step 6's Step 0 carries": served by "apart from the two the premise above leaves to step 6" (5.md:26) and premise 5.md:15.
- "after the landing, main's head tagged `v7.1.0-rc.3` and pinned with `sh utils/pin.sh v7.1.0-rc.3`": no requirement. No line of the brief names the tag or the pin, or says that they follow the landing and are not the builder's work (`grep -n -F 'rc.3' .scratch/3-the-writing-base/agents/briefs/5.md` prints nothing).
- "check: the refuter reads each fix against the finding or failure it closes and the skill against `docs/dev/skill-layout.md`": served by the Report's table "one row per finding and per failure" (5.md:140) and Verify 5 and 6 (5.md:130 and 131).
- "`sh skills/land/templates/checks.sh ...` passes": served by Verify 1's sub-bullet "The plan's whole verify list runs once, at landing on main" (5.md:126).
- "(1 commit)": no requirement is needed from the builder.

Findings:
- F1. The tag `v7.1.0-rc.3` and the pin after the landing have no line in the brief. They are the orchestrator's work after landing (Open item H), so the brief should say that they follow the landing and are not the builder's, so the part is accounted for.

## 3. Premises

- 5.md:11, the files, line counts and version of `skills/writing/`.
  - `ls -R skills/writing` printed `SKILL.md`, `references/registers.md`, `references/rules.md` and `templates/docx_paragraphs.py`.
  - `wc -l` printed `182 skills/writing/SKILL.md`, `208 .../rules.md`, `52 .../registers.md` and `159 .../docx_paragraphs.py`.
  - `head -8 skills/writing/SKILL.md` shows `version: "1.0.0"`.
  - `diff -r skills/writing ~/.claude-backup/skills/writing; echo "diff exit $?"` printed `diff exit 0`.
  - `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.2`.
  - Matches.
- 5.md:12, the verification page: `git diff --quiet 295b1e8 HEAD -- docs/dev/building.md; echo "building exit $?"` printed `building exit 0`. Matches.
- 5.md:13, the version.
  - `grep -n "raises one part" docs/dev/skill-layout.md` printed `23:- A plan that changes a skill raises one part of its metadata.version once, and sets the parts after it to 0.`
  - `git show b9f9831^:skills/writing/SKILL.md` printed `fatal: path 'skills/writing/SKILL.md' exists on disk, but not in 'b9f9831^'`, and `git show b9f9831:skills/writing/SKILL.md | sed -n 1,6p` shows `version: "1.0.0"`. Plan 3's step 1 created the skill at 1.0.0.
  - Matches.
- 5.md:14, the step 4 records.
  - The files exist (`wc -l`: `4-marks.md` 384, `4-report.md` 1001, `4-run/manuscript-report.md` 515, `grant-report.md` 386 and the four marks files).
  - `grep -c -E '^[0-9]+\. ' 4-marks.md` printed `48`: 35 manuscript lines, and 13 grant lines, one of which ("8. to 24.") covers 17 splits, so 29 grant findings. Matches.
- 5.md:15, the corrected step line.
  - `git diff .scratch/3-the-writing-base/plan.md` shows the new clause "apart from the markers' reading under condition 6 and the session's `sleep` under condition 4, which concern no text of `/writing` and which step 6's Step 0 carries".
  - plan.md "Step 6, the third runs: Step 0" holds the bullets "Carried from step 4's review (Proof 1)" (marker 1's `cat -n`) and "(Standards 2)" (`sleep 10`).
  - Matches.
- 5.md:16, the vague qualifiers.
  - `sed -n '26p' skills/repo-setup/templates/docs/dev/prose-standard.md` printed the quoted sentence, and `sed -n '131p' skills/writing/SKILL.md` printed "- For a vague qualifier it keeps a claim that holds usually stated as usual, and never cuts the qualifier so that the claim reads as universal."
  - The text matches. The brief's causal claim matches in part.
    - For 54 and 55, manuscript marker 2 writes '"usually" with a bracketed count is the form SKILL.md gives' (`4-marks.md` list item 13), which supports "licence to swap".
    - For 56 and 59, line 131 already forbids the defect both markers name ("drops 'many' and reads as all approaches"), since it says "never cuts the qualifier so that the claim reads as universal". So line 131 did not license the cut of "many". The agent broke it. No output shows the agent read line 131 as licence to cut.
- 5.md:17, the replacement of a split.
  - `sed -n '137p' skills/writing/SKILL.md` printed "- The replacement of a paragraph split is the same two sentences with an empty line between them."
  - `sed -n '317p;338p;346p;334p;342p;419p' 4-run/manuscript-report.md` printed "Replacement: the same two sentences with an empty line between them." three times (317, 338, 346). It then printed the descriptions of 66 ("the two sentences of finding 57, an empty line, then ..."), 68 ("the two sentences of finding 3, an empty line, then the "Finally" sentence unchanged.") and 82 ("the first sentence unchanged, an empty line, then the replacement of finding 17.").
  - Matches.
- 5.md:18, the term **finding**: `grep -n "finding" skills/repo-setup/templates/plan-terms.md` line 41 and `docs/glossary.md:46` hold the quoted sense. The sync printed `ok: the plan-terms block equals the template`. Matches.
- 5.md:19 to 21, the ADR quotes: `cat docs/adr/0001-*.md 0002-*.md 0003-*.md`. Each quoted sentence stands in its Decision section. The 0003 quote shortens "on the model the configuration's `reviewer` names at `reviewer_effort`," with "...". Matches.
- 5.md:22, the other ADRs: `cat docs/adr/0004-*.md` to `0012-*.md` govern self-rule, the choices file, agent ids, the repair reviewer, the cost script, the verify list, the dispatch blocks and commit paths. None governs a file, a name or a behaviour of `skills/writing/`. Matches.
- Verify 4's claim "on main at the base it prints `SKILL.md` lines 131 and 137": the command printed `skills/writing/SKILL.md:131:...` and `skills/writing/SKILL.md:137:...`. Matches.

Findings:
- F2. 5.md:16 says that line 131 led the agent to cut "many" in manuscript 56 and 59. Line 131 already forbids the cut that both markers name, so line 131 is not the cause of 56 and 59. The brief should say so, or name the sentence that did lead to the "X such as [...]" form. Kind 4 has to end the "such as" pattern, which reads as every member of the class. Removing line 131 alone does not end it.

## 4. Cases and checks

- C1 to C14: each asks for the sentence of the changed text that the step 4 finding or failure breaks. They are consistent with the change standard, rule 1 (a defect in text is fixed by reading and the report quotes the text before and after), and with `skill-layout.md`, "Where a rule goes".
- C9 (grant 15 and manuscript 72) is incomplete against the records. Both markers mark manuscript 68 wrong for the same count defect:
  - manuscript-marks-1.md:261: "After findings 26 and 3, the part before the break also holds 5 sentences, and no further split is given."
  - manuscript-marks-2.md, 68: "Once findings 26 and 3 apply, the first part is five sentences long".
  - C9 and kind 9 leave 68 out.
- C15 holds the findings marked right by both. Its list leaves out findings marked right by both that kinds 4, 6 and 10 change or forbid as worded. Section 5 and the findings below name them.
- Every case reads findings in the step 4 reports and the draft copies. The step does not change these places, and it needs to read them to name the sentence each one breaks. This is the reading the case exists for, so I name it without a defect.

Findings:
- F3. C9 and kind 9 omit manuscript 68, whose first part has 5 sentences after findings 26 and 3, by both markers.
- F4. C15 omits findings marked right by both that the changed text, as kinds 4, 6 and 10 word it, would forbid:
  - for kind 4: manuscript 19, 25, 57, 58, 60 and 61, and grant 18, 19, 20 and 21 (grant 17 is in C15);
  - for kind 6: manuscript 4, 30 and 35 (3 is in C15; grant 14 is in C15);
  - for kind 10: manuscript 76 and 82 (second break).
  Without those findings in C15, the first read and the after-read cannot show the regression.

## 5. The question

The part of the goal this step delivers: `/writing`'s review agent, reading the changed text, would report each step 4 finding in a right form and would keep reporting the findings both markers marked right. That is the gate's "each one not marked right by both is fixed in the rules or the skill".

- The check on the step's line ("the refuter reads each fix against the finding or failure it closes"): yes, it could pass without the goal. Each fix is read only against what it closes. A fix that turns a finding marked right by both into a forbidden form passes this check. Kind 4 as worded does this to 11 findings marked right by both (F6), and kinds 6 and 10 do it to others (F9, F12). Step 6's rerun is the only later catch. The plan already answers this for step 3 ("Yes, alone"), but the brief has no check of its own for the regression beyond the 12 findings C15 lists.
- Each kind's check, "the report names the sentence that now prevents it" (5.md:140):
  - Kinds 1, 3, 8, 13 and 14: the check fails if the sentence is missing. No.
  - Kind 2: yes. A sentence "each sentence a passage quotes is quoted whole" passes. Read literally, it also bars the fragment passages that both markers marked right (F11).
  - Kinds 4, 5, 6, 7, 10 and 11: yes, for the reasons in F6 to F10 and F12. A sentence can be named that closes the listed finding while it contradicts the prose standard or forbids a right finding.
  - Kind 9: yes. Manuscript 68's count failure (F3) is not on its list, so the check passes with 68 still wrong.
  - Kind 12: no.
- C1 to C14: yes, in the same way. "Expected after: the sentence ... breaks" holds once a sentence exists. Whether the agent then reports right findings is step 6's check. This is inherent to a text step and is stated so.
- C15: no for the findings it lists. Yes for those it leaves out (F4).
- Verify 4 (`grep -F` for 'the same two sentences' and 'stated as usual'): yes. It passes when the two phrases are reworded and the sense stays. Verify 5, the reading of the diff, carries the judgment.

Findings:
- F5. The step's check and the per-kind check can pass while the changed text forbids findings marked right by both (F4, F6, F9, F12). Widening C15, as F4 says, closes it.

## 6. Implied inputs

- This is not a code step: the step changes text only (`SKILL.md`, `rules.md`, `registers.md`, and the report).

Findings: none.

## 7. ADRs

`ls docs/adr` lists 0001 to 0012, and `cat` read each one.

- 0001, "The writing base reads the prose standard where it is". It touches the step: "`skills/writing/` holds no copy of it." The brief names it (5.md:19).
- 0002, "The prose standard holds over the academic sources". It touches the step: "No rule that contradicts the prose standard is carried." The brief names it (5.md:20).
- 0003, "A fresh read-only agent reviews a draft". It touches the step (kind 14): "`/writing` starts one fresh agent that changes nothing ... which reads the whole draft and reports only breaks of a named rule." The brief names it (5.md:21). Kind 14 is consistent with it.
- 0004 to 0012 do not touch the step. The brief says so (5.md:22).

Findings:
- F6. Kind 4 (5.md:33) contradicts ADR 0002 and the prose standard, section A ("Vague qualifiers are replaced with the number or the specific claim").
  - Kind 4 dictates "Where the draft gives neither, the qualifier stays and the number or the specific claim is named in square brackets" and "A qualifier is never cut and never swapped for another qualifier, such as "usually" for "often"". Decision 2's worked cases (5.md:89) keep "many" and "often" in the replacement, so the replacement still holds the section A break. That also breaks `SKILL.md`, "A finding": "It ends the break".
  - As worded, kind 4 forbids findings that both markers marked right:
    - manuscript 19 ("many branches" to "[the branches of oncology, named, from the author]");
    - manuscript 25 ("most" to "[the share, from the author] of");
    - manuscript 57 and 60 ("typically" to "usually" with a bracket);
    - manuscript 58 ("many of them" to "[the studies named with their citations, from the author]");
    - manuscript 61 ("Generally" cut; both markers: the claim holds by MAE's definition);
    - grant 17 to 21 ("usually", "often", "mostly", "frequently", "rarely" replaced in place by "[percentage of cases, from reference 1]" and the like). For grant 17, grant-marks-2 writes: "the brackets ask for the numbers without making either claim universal".
  - The defects both markers name are narrower:
    - a qualifier cut so the claim reads as universal (37; 38 by marker 1);
    - "X such as [...]", which reads as every X (56, 59);
    - a stronger qualifier swapped in, "often" to "usually" (54, 55 by marker 1).
  - The form both markers accept is the qualifier replaced in place by the number, or by a bracket naming it. The bracket form is the prose standard's own rule, read with `SKILL.md` "A fact only the author has is named in square brackets".
- F7. Kind 4's sentence "The replacement of a vague qualifier gives the number or the specific claim, as the prose standard's section A says" restates section A's rule in its words and then names it. ADR 0001 ("holds no copy") and the brief's own Conventions ("a rule of the prose standard is named by its section, never restated") ask for the section to be named only.
- F8. Kind 5 (5.md:34) states that "the replacement of a colloquial or informal word that carries strength, such as an intensifier, is a formal word of the same strength, and that the word is not cut". The prose standard, section A, bans the intensifiers "very" and "really" as filler: "cut or replace with the concrete fact". Under ADR 0002 the prose standard holds, so kind 5 needs to leave the words section A bans to section A. As worded, it tells the agent never to cut them.
- F9. Kind 6 (5.md:35) states that "a replacement adds no claim, and no word that presumes one, that the passage does not make". This contradicts rules the skill keeps:
  - `rules.md` "Limitations and alternative interpretations": "The replacement adds the alternative or the limit".
  - `rules.md` "Explanation of evidence": "The replacement adds a sentence that states the meaning".
  - `rules.md` "Terms defined at first use": "The replacement adds the definition".
  - `SKILL.md` "A finding": "The added text is the author's fact in square brackets, or a claim that the draft's own data hold".
  It also forbids findings both markers marked right: manuscript 3 (adds "For the combined T1 IOP \& T2-MRI modality, the two stages contributed comparably (AUPRC = 0.457 ... versus 0.447 ...)"), 4, 30 (adds the reporting-guideline sentence) and 35 (adds the DINO definition), and grant 14 (adds the hepatitis B limit). The defect the markers name (grant 28's "how the background liver changed", manuscript 51's "therefore") is a claim or relation that the draft does not make. It is not one that "the passage" does not make.
- F10. Kind 7 (5.md:36) says the replacement "changes no hedge". `SKILL.md`, "A finding", says "A passage that breaks two rules gets one replacement that ends both breaks". For a claim that breaks both "Evidence for claims" and "Hedging", kind 7 as worded forbids the hedge the Hedging break asks for. The fix should be scoped to a hedge no other finding on the passage asks for. Manuscript 26's defect (marker 1: a hedge on a factual claim) is a hedge that "Hedging" itself does not ask for.

## 8. Dictated text

The kinds of "What to build" mostly say what a sentence must say without giving its words, so the builder words them. The dictated words are the quoted examples and terms the brief gives for the files.

- "as in finding 34", "the same sentence", "the same two sentences", "the replacement of finding 49" (kind 1, examples of a reference): `grep -n -F '"as in finding 34"' .scratch/3-the-writing-base/agents/briefs/5.md` prints lines 30 and 111.
  - This breaks the brief's own "What it must do" (5.md:111): "No sentence names ... a finding number". It also breaks Verify 5 (5.md:130), "none names a draft, a finding number or this plan".
  - "34" and "49" are real finding numbers of step 4's manuscript report (findings 44 and 83 point at them). 5.md:111 gives "as in finding 34" as the general example, which contradicts the same paragraph.
  - The other two examples hold.
- '"usually" for "often"' (kind 4): `grep -n -F '"usually" for "often"'` prints line 33. As an example it holds, but it is the sentence F6 finds against the prose standard, section A.
- '"therefore"' (kind 6): `grep -n -F '"therefore"'` prints line 35. Holds.
- '"If the hypothesis holds"' (kind 9): `grep -n -F '"If the hypothesis holds"'` prints line 38. The phrase is the words of the user's grant, paragraph 48 (`4-run/grant-report.md:95`). The paragraph of "What to build" says "A fix is a rule the text states, never a reference to a draft". A general example of a condition ("If <a condition> holds") keeps the rule without carrying the draft's text into the skill.
- '"whereas", "so" or "while"' (kind 10): `grep -n -F '"whereas", "so" or "while"'` prints line 39.
  - Read with kind 10's sentence, these make findings both markers marked right wrong. Manuscript 76's replacement splits at "albeit", which both call right (marker 2: "The sentence split after "albeit" changes no claim"). Manuscript 82's second break splits "..., while further external validation is needed" under "Formality", and both markers call it right.
  - Under kind 10, both clauses are "clearly connected" and are not reported under "Formality", so these replacements would carry a change no rule asks for.
  - Kind 10 also does not say whether "and" is such a word. Manuscript 15, 19, 55, 57 and 85 split at "and" or a participle.
- '"we", also for a draft with one author, and never "I" or "my"' (kind 12): `grep -n -F '"we", also for a draft with one author'` prints line 41. Holds against the prose standard. It agrees with `registers.md`, "Voice" (D18).
- 'such as a character the reader's viewer may not show' (kind 13): line 42. Holds.
- '`grep`, `sed`, `cat` or `find`' (kind 14): line 43. Holds. It names the behaviour to do instead ("a search ... is done by reading"), as `skill-layout.md`, "Writing for an agent" asks.
- Kinds 1 and 2 both dictate the same rule: "the replacement as the place reads after every finding on it" (5.md:30) and "The replacement gives the text as it reads after every other finding on it" (5.md:31). `SKILL.md`, "A finding", already states it twice ("as it reads after every other finding on it" for added text; "A change of wording that another finding on the same passage proposes is carried in the replacement"). `skill-layout.md`, "Where a rule goes": "A rule is written once."
- Kind 11 (5.md:40): "the term stands in the draft at or before the passage, or the replacement defines it". `rules.md`, "Terms defined at first use" already says "The replacement introduces no term before the place the draft defines it". The two differ. A term that stands earlier but undefined passes kind 11 and fails the existing rule, so the change standard's rule 19 (no two statements that contradict each other) applies. Both markers of grant 3 and 4 cite the existing sentence as the rule broken. Kind 11 does not say that it replaces that sentence.
- Kind 2 (5.md:31): "each sentence a passage quotes is quoted whole". Read literally, it bars a passage that quotes part of a sentence. Both markers marked such passages right: manuscript 27, 28, 53, 58, 60, 61, 91 and 92, finding 40's and 41's places, and the quoted clauses of the tense list. The defect in the 17 grant splits and in grant 30 and 33 is a split or a list quote shortened with "..." or "(...)". The sentence does not say whether a passage of a single-sentence finding may be a phrase.

Findings:
- F11. Kind 1 and "What it must do" dictate "as in finding 34", a real finding number, against 5.md:111's own rule and Verify 5.
- F12. Kind 10's examples make manuscript 76 and 82 (second break), both marked right by both markers, carry a change no rule asks for. Kind 10 also leaves open whether "and" states a relation.
- F13. Kind 9's example "If the hypothesis holds" is the user's grant text.
- F14. Kinds 1 and 2 dictate the same rule twice, and `SKILL.md` already holds it. The brief does not say where it is stated once.
- F15. Kind 11's "stands at or before the passage" differs from `rules.md`'s "before the place the draft defines it", and the brief does not say which one replaces the other.
- F16. Kind 2's "each sentence a passage quotes is quoted whole" does not say whether a phrase passage stays allowed. Read literally, it bars passages that both markers marked right.

Coverage of step 4's findings and failures (the read of each kind against `4-marks.md` and the markers' reasons):

- F17. Manuscript 7 is listed under kind 6. Marker 2's reason (manuscript-marks-2.md, 7) is "the replacement drops the claim that HCCNet is "a reliable tool"". Kind 6 is about adding a limit, a claim, a presumption or a connective, so no kind's fix addresses a dropped claim.
- F18. Grant 32 is listed under kind 6. Marker 2's reason (grant-marks-2.md:108) is that "A future tumour segment ... counts as success" lets any segment meet the criterion, a weakened scope ("the" to "a"). Kind 6's fix does not address it, and no other kind does.
- F19. Manuscript 51 is listed under kind 6, which covers only the added "therefore". Two reasons are left with no kind:
  - Marker 1's reason, W (2), is that "The section opens with a real-world consequence ("improving patient management")". The finding should not have been reported under "Reader's question per section".
  - Marker 2 also names the dropped "especially relevant".
  Kind 13 covers that section's group line, not this finding.
- F20. Manuscript 68: kind 1 covers its description and reference. Both markers also give the 5-sentence first part (F3), which no kind covers.
- F21. Two more markers' reasons have no kind:
  - Grant 4: marker 2 adds that "Two of its new sentences still run to 28 and 31 words, although the finding names the sentence-length break". The replacement does not end a break it names.
  - Grant 33: marker 1 adds that the replacement brings a third name ("scan-to-scan variation of cirrhotic livers").
  Kind 11 and kind 2 cover each finding's main reason.
- F22. Kind 1 lists "44 to 48 (places by reference)". Manuscript 45 is written out whole (`manuscript-report.md:224`), is marked right by both, and stands in C15. Of 44 to 48, only 44, 46, 47 and 48 are given by reference.
- F23. Kind 1's tail reads "Gate conditions 1, 4 and 5", and kind 2's reads "Gate conditions 1 and 2 (paragraph 35 split (b))". `4-report.md`, "The gate conditions", has condition 4 holding and condition 2 being grouping (kind 13). The 4 and 2 here are step 4's cases C4 and C2 (`4-report.md`, "The cases' first run", lines 16 and 18). The gate failures of `4-report.md` are 1, 2, 3 (manuscript), 5 and 6, so kind 1 should read conditions 1 and 5, and kind 2 condition 1.

The worked cases of "Decisions taken in this brief" 1 and 2:

- Decision 1, finding 44: the passage and replacement equal finding 34's (`manuscript-report.md:162,163`). Holds.
- Decision 1, finding 64, first break: the two sentences equal `manuscript-report.md:316`, and no other finding changes them. Holds.
- Decision 1, finding 68: "the replacement writes both out with an empty line between them" names two sentences. Finding 3's replacement is two sentences (`manuscript-report.md:17`), so "as the place reads after every finding on it" (kind 1) asks for three. The worked case also leaves the 5-sentence first part that both markers mark wrong (F3, F20). Under the decision, 68 would still be marked wrong by both.
- Decision 1, finding 83: the replacement is finding 49's and finding 16's written out. Marker 2 counts the parts as 4 and 2. Holds.
- Decision 1, the tense clause at `c_evaluation.tex:1`: finding 39 at `c_evaluation.tex:6` agrees with `4-report.md`'s place check (it prints `0` at line 1). Holds.
- Decision 2, both cases: they keep "many" and "often" in the replacement (F6). That is against section A's "replaced with the number or the specific claim" and `SKILL.md`'s "It ends the break". They also differ from the bracket-in-place form that both markers marked right in grant 17 to 21 and manuscript 25 and 58.

Findings:
- F24. Decision 1's worked case for finding 68 gives a replacement that both markers would still mark wrong for the 5-sentence part, and its "both" leaves out the second sentence of finding 3's replacement.
- F25. Decision 2's two worked cases keep the vague qualifier, against the prose standard, section A, and ADR 0002 (F6).
- F17 to F23 above: a finding of step 4 that a kind lists wrongly, or a marker's reason that no kind covers.

## Declined to judge

- Which form kind 4 should take in its place: the qualifier replaced in place by a bracket, or another wording. That is the orchestrator's call, or the user's. The evidence for the form both markers accepted is in F6.
- Whether "we" for a single applicant (kind 12) is the right choice. Marker 2 called "My" right for grant 35 and 36. The rule follows ruling D18 and `registers.md`, "Voice", which are the user's.
- Whether kind 8 rules rightly on "accuracy" in manuscript 27. The markers split on it, and the brief's choice follows marker 1's reading of the tables. I did not recheck the table values.
- The sentence counts of the draft paragraphs (manuscript 68 and 72, grant 15). I took both markers' counts from their marks and did not count the draft copy myself.
- Two markers' notes outside the marks, on findings both marked right: manuscript marker 1's note that finding 41 misses the place `sections/2_related_work/a_longitudinal_analysis.tex:5`, and both grant markers' count of 13, not 12, sentences in paragraph 41. They are not findings "not marked right by both", so they are outside the step's line.
- The use of "place" in `/writing`'s sense beside the glossary's "place, of a defect" and "place, of a point". The sense predates this step (`SKILL.md`, "A finding"; the glossary's **finding**), and the step does not add the term.

Agent usage: a31fba24d82d7a955, claude-opus-5-5, 285071 tokens, 46 tool uses, 9.5 minutes.

## Closed

Each finding is closed by a change to `agents/briefs/5.md`. The kinds were renumbered, 1 to 16, and each line below names the kind as it now stands.

- F1: "What to build" ends with a paragraph saying that the tag `v7.1.0-rc.3` and the pin follow the landing as Open item H rules, and are the orchestrator's work, not the builder's.
- F2: the premise on line 131 now says that line 131 led to 54 and 55 (marker 2's reading), that it is not the cause of 56 and 59, and that their "such as [...]" form follows no sentence of the skill. Kind 5 forbids that form by name.
- F3, F20: kind 11 and C11 now hold manuscript 68 with 72: the count of a part includes other findings' additions, and a part over the rule gets a further split.
- F4, F5: C17 (formerly C15) now holds manuscript 4, 19, 25, 30, 35, 57, 58, 60, 61, 76 and 82 (second break), and grant 18 to 21. Manuscript 57 and 60 are named with the form kind 5 asks.
- F6, F25: kind 5 now asks for the number, the specific claim or a bracket naming them in the qualifier's place: no cut, no swap for any qualifier, no "such as [...]". Decision 2's three cases now take that form, which both markers marked right in manuscript 19, 25 and 58 and grant 17 to 21.
- F7: kind 5 says the prose standard's rule is named by its section and not restated.
- F8: kind 6 leaves a word that section A bans as filler to section A, which cuts it.
- F9: kind 7 now reads "no claim, no relation and no word that presumes one, that the draft does not make, other than the addition the named rule asks for", naming the limit, the alternative, the definition and the meaning.
- F10: kind 8 now reads "adds no hedge that no other finding on the passage asks for".
- F11: kind 1 and "What it must do" give "as in finding N" and "the replacement of finding N". No real finding number is left in a sentence meant for the skill.
- F12: kind 12 no longer lists joining words. A finding under the sentence rule names its two ideas. A cause or consequence clause is not split from its idea. A split at a concession or a contrast whose two clauses are each a claim stays allowed, and C12 holds 76 and 82 (second break) as allowed.
- F13: kind 11's example is "If <a condition> holds".
- F14: kind 2 states the rule once, as one sentence of "A finding" that replaces the two sentences saying it in part today. Kind 1 no longer repeats it.
- F15: kind 13 replaces `rules.md`'s sentence "The replacement introduces no term before the place the draft defines it" with one sentence covering both readings, so no second sentence stands beside it.
- F16: kind 3 says that a passage may be a phrase, a clause or a sentence, and that only the passage of a split or a list quotes each sentence it spans whole.
- F17: kind 7 adds the "Hedging" sentence that the replacement changes the device and keeps the claim, for manuscript 7.
- F18: kind 7 adds that a replacement keeps each word that sets a claim's scope, such as an article or a quantifier, for grant 32.
- F19: new kind 10 ("Reader's question per section": an opening that states a consequence or a gap answers the Introduction's question) covers marker 1's reason. Marker 2's dropped "especially relevant" is named against the existing sentence that keeps every clause.
- F21: kind 11 adds that a replacement for a finding that names the sentence-length rule keeps each sentence within it (grant 4). Kind 13 adds that a replacement names each thing by the draft's name (grant 33).
- F22: kind 1 lists 44, 46, 47 and 48. Manuscript 45 stays in C17.
- F23: kind 1 names gate conditions 1 and 5. Kind 3 names gate condition 1. Kind 2 names gate condition 1 for split 35 (b).
- F24: Decision 1's case for finding 68 now writes out the part before the break as it reads after findings 26 and 3, and gives the further split kind 11 asks for.
