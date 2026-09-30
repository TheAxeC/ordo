# Step 14a brief check (on main at e18de58)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/2-e-grill/agents/briefs/14a.md`. The uncommitted ledger records (the brief, `plan.md`, the state file) were read as they are on disk. Nothing was changed.

This is a text step: it changes the text of `skills/grill/SKILL.md` and one plan term, and no script.

## 1. Names

- **design tree**: `git grep -n -i 'design tree' -- . ':!.scratch'`. The hits are `docs/glossary.md:33` and `:43`, `skills/grill/SKILL.md:80` and `:82`, and `skills/repo-setup/templates/plan-terms.md:28` and `:38`. All of them are inside the brief's paths. The **frontier** definition (`:43`, `:38`) says "every decision of the design tree whose prerequisites are settled", and the wider tree does not make it false. `grep -rn -i 'design tree' .scratch` hits only ledger records (briefs, reports and diffs of step 12, `2-f-diagnose/agents/reviews/1-round-0.diff`). Those are history and are not made false.
- **carried ruling**: `grep -rn -i 'carried ruling\|carried rulings' .` hits only `.scratch/2-e-grill/agents/briefs/14a.md`. The only other hit is `.scratch/comparison-2026-09-28/findings-by-cause.md:967`, where the phrase appears in another sense inside a quoted finding. That file is a record. There is no hit outside the paths.
- **The sections the step changes** (`"What it reads" 6`, `Steps 3`, `"Steps / Writing what settled" 1`, `"The decision form"`, `Rules`): `git grep -n -E 'What it reads" 6|Steps 3|Writing what settled|decision form"|grill.*(Rulings|rulings file)' -- skills docs README.md`, with `skills/grill/SKILL.md` left out.
  - `docs/glossary.md:98` (**rulings file**): "holds the user's settled design answers for a roadmap entry, one bullet line each ... Stated in: ... `grill`, "What it reads" 6 and "Steps / Writing what settled"". It stays true, because a carried bullet is one line in the entry's file.
  - `docs/glossary.md:97` (**ruling**): "Also a settled `grill` decision, one bullet of the Rulings or the rulings file". It stays true.
  - `docs/glossary.md:29` (**decision form**): it lists the parts of a decision, and the count rule adds no part, so it stays true.
  - Every other hit is another skill's own "Steps 3".
- **The `grill` descriptions**: `README.md:16` (the `grill` row), `README.md:34`, and `skills/grill/SKILL.md:3` and `:10` (the description and the introduction). They stay true: none of them says where the rulings come from.
- **The version**: `git grep -n -E 'grill.*1\.0\.0|1\.0\.0.*grill'` hits only ledger records (`briefs/12.md:27`, `12-landing.md:19`, `12-refuter.md`, `12-report.md`, `plan.md:309`). Those are history.
- **Other repositories**: `find cathedra game-engine research-hub -maxdepth 4 -name glossary.md` prints nothing. No plan-terms block there goes out of sync.

Findings:
- The Stops row "A round" (`skills/grill/SKILL.md:253`) becomes incomplete. It is outside the step's written lines but inside the file the step writes. Its "What it shows" cell is "The frontier as decisions in the decision form, and the answer form". Item 2 makes the first round also show each decision a carried ruling settles, with the carried ruling quoted and its `<path>:<line>`. Rule 19 of the rules file ("A change leaves no two statements that contradict each other") and rule 14 both reach this cell.

## 2. The step line

`grep -n '^- 14a' .scratch/2-e-grill/plan.md` prints line 48.

- "reads the rulings on the entry booked anywhere under the ledger root": item 1, with the term in items 6 and 7.
- "and carries them into the entry's rulings file instead of asking them again": item 2 (the first block), item 3 and item 5.
- "makes each part of an existing goal and gate a decision (kept, changed or dropped)": item 2 (the second block), with the **design tree** definition in items 6 and 7.
- "states a count in a round only from a lookup that listed every item": item 4.
- "check: each changed text read in place": verify items 3 and 6, and the report.
- "and step 14 run again passes": the brief assigns this to step 14 and leaves it out of the brief. The plan's step 14 line (`grep -n '^- 14 '`, line 49) carries it.
- Item 8 (the version) serves no part of the line. `docs/dev/skill-layout.md`, "Frontmatter", requires it.

Findings: none.

## 3. Premises

- `wc -l skills/grill/SKILL.md` prints `277`. Matches.
- `grep -n '^- 14a' .scratch/2-e-grill/plan.md` prints line 48. The ruling "Step 14, the call on the blind comparison" is line 128, the last bullet before `## Blocked, and by what` (line 130). Matches.
- The ruling "Entry 3 and step 13" is at `.scratch/2-e-grill/plan.md:126` and ends with "D2 (a), entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only (the user)." (`sed -n '126p'`). Matches. At 833e2e8 the same ruling is at line 125 (`git show 833e2e8:.scratch/2-e-grill/plan.md | grep -n 'Entry 3 and step 13'` prints `125:`), which is the line the judges cite.
- The quoted lines of `skills/grill/SKILL.md` were each checked with `grep -n -F -x` and printed `49:`, `81:`, `84:`, `86:`, `187:`, `188:`, `234:` and `274:`. They match. Lines 47 to 49, 80 to 89, 183 to 189, 233 to 236 and 274 to 275 were read with `cat -n`. Lines 85, 89 and 275 are as the brief describes them. Matches.
- `sed -n '41p;68p' skills/plan/SKILL.md` prints item 4, which reads the rulings file only, and Steps 2, which copies its bullet lines. Matches.
- `grep -n -E 'ledger_root|archive_root' .agents/plan.yaml` prints `ledger_root: .scratch` and `archive_root: .scratch/archive`. Matches.
- `find .scratch -name plan.md | wc -l` prints `11`. Matches.
- The awk over each `## Rulings` section, filtered with `grep -i -E 'entry 3\b|writing base'`, prints three bullets: `2-e-grill/plan.md:126` ("Entry 3 and step 13"), `archive/2-b-.../plan.md:98` ("The way back on track") and `archive/2-c-.../plan.md:30` ("The review of Ordo"). Matches.
- `sed -n '13p;14p;28p' skills/repo-setup/templates/plan-terms.md` prints **capability map**, **case** and the **design tree** line as quoted. Matches.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`. Matches.
- `LC_ALL=C grep -n '[^ -~]' docs/glossary.md` prints nothing at the base, and `grep -c` over the two other files prints 0 each. This is consistent with verify item 4.
- `ls docs/adr` prints 0001 to 0003, `README.md` and `template.md`. Matches.
- The state file's verify list has 10 commands (read from its first yaml block). This is consistent with verify item 1's `checks: 10 commands passed`.

Findings:
- Decision 3, last bullet, says of entry 3 as written now (7e984dd): "Its gate gives four clauses." Split by semicolon, it gives five. The command `git show HEAD:docs/roadmap.md | awk ... '/^- Gate:/' | awk -F';' '{print NF}'` prints `HEAD 3\. The writing base: gate clauses by semicolon = 5`. The five clauses are: the real runs report their findings; you mark each finding and the wrong ones are fixed; the planted and clean texts; the ledger record for each row; the skill follows the layout. The figures for entry 3 at 833e2e8 (4), entry 4 (2), entry 5 (4) and entry 12 (2) match the same command.
- "What is on the tree" does not say that `.scratch/rulings/3-the-writing-base.md` now exists on main. `git log --oneline -- .scratch/rulings/3-the-writing-base.md` prints `7e984dd Settle the design decisions of roadmap entry 3, the writing base`, and the file holds D1 to D24, with D12 missing. Its D1 and D2 are the rulings that "Entry 3 and step 13" states. R1 says "no rulings file for entry 3", which is true only at 833e2e8 (`git show 833e2e8:.scratch/rulings/3-the-writing-base.md` prints `fatal: ... exists on disk, but not in '833e2e8'`). The builder's first read and walk of R1 must use 833e2e8 and not the main checkout, and the brief does not say how the builder reads that tree.

## 4. Cases and checks

- R1: consistent with the rules file and `docs/dev/skill-layout.md`.
- R2: consistent. The goal of entry 3 at 833e2e8 splits into the seven parts named, and its gate splits into four clauses (command in section 3).
- R3: consistent. It is the near-miss control of R1.
- R4: consistent. Its "written nowhere" agrees with item 3 ("one bullet for each decision it settles", which gives none).
- R5: consistent with "Steps / An answer that contradicts". One detail: the clash is found at Steps 3, before round 1, so "the next round" is round 1.
- R6: inconsistent with "What to build". Its expected result, "no option or recommendation claims to differ from the ruling where it does not", is stated by no dictated text. Item 2 says only that the decision "quotes the carried ruling beside its options". Rule 4 of the rules file makes the brief's fix text the specification, so a builder cannot meet this case without text the brief does not dictate. The case asserts a result the changed skill never states.
- R7: consistent with item 2's last sub-bullet.
- R8: consistent.
- R9: consistent with item 4.
- R10: consistent with items 1 and 3 ("the entry's Rulings or rulings file").
- R11: consistent in effect. In wording, item 1 calls every bullet that names the entry "a carried ruling" whether it settles anything or not, while R11 says "carried only when it settles a decision". Item 3 writes zero bullets for such a bullet, so the result agrees.
- R12: consistent. It is a fact check, as the rules file's "Scripts compute facts; judgment is read" allows.

Findings: R6, for the reason above.

## 5. The question

"The goal" here is the part of the plan's goal this step delivers: that `grill`, run on a real entry, neither re-asks a ruling the user gave elsewhere nor misstates it, asks about every part of an existing goal and gate, and states no count it has not fully listed.

- R1: no. It walks the real input where the re-asking happened and expects the decisions settled, quoted as written and not asked.
- R2: no. It walks the real input where "history words" and "word counts per section" were missed and expects one decision per part.
- R3 and R4: yes, by design. They are controls for the edge of "carried" and prove nothing about the goal on their own. That is acceptable, because R1 is their pair.
- R5: yes. A clash between two carried rulings is not one of the three faults. It is a boundary case.
- R6: yes. This is the case for "misstates", and no dictated text produces its expected result, so a walk of the changed skill cannot show it. A builder could report it met by assertion.
- R7 and R8: no. Each walks the per-part rule on another entry shape.
- R9: no. It walks the count rule with and without a whole lookup.
- R10: no. It shows where the carried bullets go.
- R11: yes, by design, as a control.
- R12: yes. `sync_rules.py` proves only that the two copies are equal, and would print ok with both copies wrong. This is intended as a fact check.
- The step line's check, "each changed text read in place": yes. A read that the text is present does not show that `grill` behaves differently.
- The step line's check, "step 14 run again passes": partly. A tie passes while `grill` still commits one of the three faults, if the other side fails as badly. Whether the rerun exercises the faults also depends on its input tree. At 833e2e8 the ruling at `plan.md:125`, the old goal and the source differences are all present. On main now, `.scratch/rulings/3-the-writing-base.md` already settles D1 to D24, and the per-part decisions would be on the new goal, so none of the three faults would be exercised. The brief rightly leaves this check to step 14, but step 14's line does not name the input tree.
- The checks of items 1 to 5 and 8 (verify items 2 and 3, grep and diff): yes. They prove presence and indent only. Verify item 6, the walk, is the check that bears on the goal, and it covers R1, R2 and R9 only. R6 (the misstatement), R5, R10 and R3/R4 get only the first read on the unchanged tree and no walk on the changed text.
- The checks of items 6 and 7 (verify item 5, sync ok): yes, as for R12.

Findings:
- R6 can pass without the misstatement part of the goal being reached, because no dictated text carries its expected result.
- Verify item 6 walks only R1, R2 and R9. The "misstates" part of the goal (R6), the clash (R5) and the open-plan destination (R10) are never walked on the changed skill.
- "step 14 run again passes" can pass on a tie with a fault left, and on an input tree that does not exercise the faults. This belongs to step 14 and is named here for the orchestrator.

## 6. Implied inputs

This is a text step, not a code step. The template's check applies to code steps. As the brief asked, the inputs the ruling implies that no case covers are listed below, each with its expected result.

- **A carried ruling whose decisions the entry's own Rulings or rulings file already holds.** Example: `/grill 3` on main now, where `.scratch/rulings/3-the-writing-base.md` D1 and D2 hold what plan 2.E's "Entry 3 and step 13" states. Expected: settled, and not written again. As dictated, item 1's second line ("it is written into the entry's Rulings or rulings file") and item 3 ("written at the first write of Steps 8 as one bullet for each decision it settles") have no exception, so two more bullets, D25 and D26, would be written. There is no case for this.
- **An interview started again after the carried bullets were written** (a new session or a compaction). Expected: not written a second time. As dictated, "the first write of Steps 8" of the new session writes them again. Matching by `<path>:<line>` cannot catch the duplicate, because the source's line moves: the same ruling is `plan.md:125` at 833e2e8 and `plan.md:126` on main (section 3). There is no case for this.
- **A carried ruling that a later ruling names as the one it replaces.** Plan-rulings bullets use this form: `.scratch/rulings/3-the-writing-base.md` D11 "replacing D5" and D18 "replacing D12". Expected: the replaced ruling settles nothing, and only the later one is carried. Item 2 covers only two carried rulings that contradict each other with neither naming the other, and says nothing of the replaced one. There is no case for this.
- **A carried ruling that contradicts a bullet of the entry's own Rulings or rulings file.** Expected: a rule clash ("Steps / An answer that contradicts"). Item 2 names only a clash between two carried rulings. There is no case for this.
- **A source that states the same ruling in other words.** Example: the redraft `.scratch/plan-drafts/3-the-writing-base.md` at 833e2e8, whose "Axel's rulings (2026-09-30)" has "D2 (a): entry 4 is redrafted after entry 3 is approved." without "waiting on 3 for the prose rules only" (`git show 833e2e8:.scratch/plan-drafts/3-the-writing-base.md | sed -n '30,34p'`). This difference is where the D2 misstatement came from. Expected: the carried ruling's words hold, and the paraphrase in the source is never presented as the user's ruling or as a difference from it. The redraft is read only as a source ("What it reads" 7), and no case or text covers this.
- **A carried ruling that names the entry only in passing.** Example: `archive/2-b-.../plan.md:98`, "... then entry 3; no restart (the user)." Expected: read, and it settles nothing. R4 and R11 cover the kind.
- **A number that appears in another sense.** Examples: "judges 3 and 4" (plan.md:128), "plan 3 stops at step 5" (2.C:30). Expected: not a naming of entry 3, judged by reading. R11 covers the kind.
- **A carried ruling with no date of its own.** Examples: the 2.E bullets "A:" to "O6" and 2.B's "The way back on track", whose dates are only in the `## Rulings (<date>)` heading. Expected: the heading's date in `(<the carried ruling's date>)`. Item 3 does not say where the date comes from.
- **A carried ruling whose settling words are in its sub-bullets or a fenced block** (a quoted ruling). Expected: the words quoted in one line, since `/plan` Steps 2 copies bullet lines only (`skills/plan/SKILL.md:68`). Item 3 does not say this.
- **An archive outside the ledger root.** Expected: not read, since the ruling names `<ledger_root>/`. `grep` over the four repositories' `.agents/plan.yaml` shows the archive under the ledger root in each (ordo, cathedra and game-engine `.scratch/archive`, research-hub `tools/oculus/.scratch/archive`), so no real input exists today. Decision 1 records it. No case is needed.
- **A `## Rulings (<date>)` heading, and a plan with two Rulings sections.** Every plan's heading carries a date (`grep -n '^## Rulings'` over the 11 plans), and 2.A has two sections (lines 27 and 35). Expected: every section whose heading begins `## Rulings` is read. Item 1 says "`## Rulings` section", as line 49 already does. A reader would most likely follow it rightly.
- **A gate whose several checks are joined without semicolons.** Example: `docs/roadmap.md:53` (entry 2.I), whose gate lists five conditions after a colon, separated by commas. Expected: one decision per thing the gate checks. As dictated ("each of its clauses separated by a semicolon") it gives one decision for the whole gate, so the user cannot keep one condition and drop another. `grep -n '^- Gate:' docs/roadmap.md | awk -F';' '{print NF-1}' | sort | uniq -c` prints six gates with no semicolon (one is the format comment at line 17).

Findings: the first five inputs and the last one are missing from "Cases", with the expected results above. The first four also have no text in "What to build" that produces those results.

## 7. ADRs

`ls docs/adr`, and each record read in full:

- 0001, "The writing base reads the prose standard where it is", status proposed. Its decision governs `/writing` and the skills that read the writing base. It does not touch the step.
- 0002, "The prose standard holds over the academic sources", status proposed. Its decision governs the writing skills' rules. It does not touch the step.
- 0003, "A fresh read-only agent reviews a draft", status proposed. Its decision governs `/writing`'s review. It does not touch the step.

The brief says no ADR touches the step, and that is right.

Findings: none.

## The dictated texts

- **Item 3, a code span that breaks.** The bullet form is written as one code span with backticks inside it: "`- D<n> ... carried from `<path>:<line>` (the user).`". In Markdown the span ends at the inner backtick. `<path>` and `<line>` then fall outside code, and a renderer treats them as unknown HTML tags and hides them, so the rendered skill reads "carried from : (the user)". Line 185's form has no inner backticks. The line needs a double-backtick delimiter, or the form written without inner backticks. R1's expected text has the same form.
- **Item 4, placement.** It is inserted after line 234, which puts the count rule between two reference-line bullets: 233 and 234, then the new rule, then 235 ("The reference line is the evidence the options are weighed with") and 236. A reader can take the count rule as part of the reference-line rules, and 235 is separated from its siblings. The rule holds for everything a round states, so under `docs/dev/skill-layout.md`, "Where a rule goes", it belongs in Rules or in Steps 6. At the least it belongs after line 236.
- **Items 1, 2 and 4, one rule per bullet.** Some bullets join rules that can be broken separately, against `docs/dev/skill-layout.md`, "Lists and tables" ("two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets"):
  - Item 2's first bullet: marked settled and not asked, and the first round shows it quoted with `<path>:<line>`.
  - Item 2's goal-and-gate bullet: one decision per part, and the part quoted as written.
  - Item 4's first bullet: a whole lookup, and the list beside the count.
  - Item 1's second line: settled, and written into the entry's file.
- **Item 2 against Rules line 276, "Every answer is written in the turn it settles, before the next round is drawn up".** Item 5 makes a carried ruling "the user's answer". It settles at Steps 3 of the first turn, but item 3 writes it at the first write of Steps 8, which comes in the turn after round 1 is answered. The ruling dictates "at the first write of Steps 8", and line 85 already makes the same exception for a quoted ruling's roadmap diff, so this is an existing pattern. Line 276 still states no exception for either.
- **Item 2 against Steps 6 and the Stops row "A round".** "The first round shows it as settled" puts settled decisions into a message that Steps 6 defines as "every decision of the frontier that waits on no lookup", and that the Stops row describes as "the frontier ... and the answer form". Neither says the settled carried decisions are shown, or unnumbered. When the frontier is empty at the first pass (Steps 6, line 107), there is no first round, and item 2 does not say where they are shown then. Steps 10 ("List every decision settled in the interview") does not say whether the carried rulings are listed.
- **Item 2, the label of a part decision.** A kept, changed or dropped part of the goal or gate could be a design decision (bar label) or a decision about the repository's own page (the roadmap entry, "Rule:" label, line 236). The text does not say which, and a reader could follow either.
- **Item 2, "Not yet specified".** The sub-bullet extends the ruling, which names only an entry that "has a goal and gate already". The extension is sensible, but it is not recorded under "Decisions taken in this brief". It also sits under a bullet whose condition, "has a goal and a gate", excludes the case it adds.
- **Items 1 and 6, two wordings of the ending.** Item 1 says the bullet's "first line ends with "(the user)"". Item 6's **carried ruling** term says the bullet "ends with "(the user)"". The **quoted ruling** term uses "whose first line ends with". The term should say "whose first line ends with".
- **Item 6, the design tree term.** The new **design tree** definition does not name the "what must be known" parts of a "Not yet specified" entry. Its comma chain ("kept, changed or dropped, each with the decisions it waits on, each node a decision") can be read as attaching "each with the decisions it waits on" to the three options.
- **Item 3, when the number is given.** "numbered as Steps 6 numbers a decision" works, but the carried bullets get numbers only at Steps 8, after round 1 has used D1 to Dk. The user sees them unnumbered in round 1 and numbered in the file. This follows from the dictated text, is not a contradiction, and a reader would follow it rightly.
- **Whether the three changes deliver the ruling.**
  - Change (1) is delivered, except that nothing prevents a second write (the entry's file already holding it, or a restart), and nothing ties a statement about the ruling to its quoted words beyond quoting it.
  - Change (2) is delivered for goals. For gates, "clauses separated by a semicolon" under-splits a gate such as `docs/roadmap.md:53`, so "each part of the current ... gate" is not always reached.
  - Change (3) is delivered in substance, placed as noted above.
- **Steps 7 to 9 and "Steps / Writing what settled" 1's bullet form.** No clash. The carried form is a sub-bullet qualifier of line 185's "one bullet", and each completion line stays last in its item.

## Declined to judge

- Whether the rerun of step 14 uses 833e2e8 or main as its input. That is step 14's, and the orchestrator's to set. It is named in section 5 only because it decides whether "step 14 run again passes" can show the goal.
- Whether the "(the user)" filter (decision 2) and the destination "the entry's Rulings or rulings file" (R10) are readings of the ruling that the user would accept. The ruling says "bullets that name the entry" and "the entry's rulings file". Both readings look sound, but they are the orchestrator's decisions.
- A defect that exists before this step: line 47's "a `plan.md` that opens with `# Plan: <entry>`" would also match an archived plan under `.scratch/archive/`, which is under the ledger root. This step does not change that line.
- Whether entry 5's goal gives eight parts or seven ("figures and statistics" as one part). This is a reading, and neither count is wrong on its face.

Agent usage: claude-opus-5-5 (as served to this agent), about 40 tool uses. Tokens and time are not verified: they are not visible from inside the agent and come from the completion notice.

Usage from the completion notice: 176162 tokens, 40 tool uses, 524083 ms; served model claude-opus-5-5.
