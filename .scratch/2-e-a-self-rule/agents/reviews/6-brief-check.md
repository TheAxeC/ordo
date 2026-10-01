# Step 6 brief check (on main at 1458a49)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/6.md`, read from the working tree (`git status --short` printed `?? .scratch/2-e-a-self-rule/agents/briefs/6.md`). The brief's non-ASCII check: `LC_ALL=C grep -n '[^ -~]' .scratch/2-e-a-self-rule/agents/briefs/6.md` printed nothing, exit 1.

## 1. Names

Commands: `grep -rn '(the user)' skills docs/dev README.md --include='*.md'`; `grep -rn "user's ruling\|ruling of the user\|only by the user\|the user approved\|user's authority" skills README.md docs/dev`; `grep -rn -i 'open item' skills docs/dev docs/glossary.md README.md docs/figures/gen_figures.py`; `grep -rn -i -- '<name>' skills docs README.md utils .agents/plan.yaml` for "Closed items", "closed list", "Ruled:", "self-rule", "self_rule", "choices", "(the user)"; `grep -rn 'resume point' skills docs/dev README.md`; `grep -rn 'ADR [0-9]\{4\}' skills`; `grep -n -i 'silent design\|Stop only where' skills/repo-setup/templates/shared-rules.md`.

Hits outside "Paths this step writes" that the change makes false:

- `skills/plan/SKILL.md:138` (Rules, outside the brief's range 51-57): "`(ruling <name>)` for a step a ruling of the user added later". After item 5 and item 1.3, a step can rest on a "(self-rule)" bullet. False.
- `skills/plan/templates/plan.md:20` (outside the brief's range 29-32): `- <2a> <a step a ruling of the user added after the approval, ...> (ruling <L>)`. Same reason. False.
- `skills/plan/templates/orchestrator-state.md:37` heading "Open items (only what the user must rule on ... until ruled)", `:39` "becomes a step in `plan.md` only by the user's ruling", `:41` "it leaves only when the user has ruled, and then goes to the closed list". Under self-rule an item leaves when the orchestrator closes it. False. Its Closed items form `:43-45`, `- <date>: <what was raised>: <how it ended>.`, differs from the brief's dictated `- C<n> agreed by the user (<date>).` (see 8). The state file template is not in the paths.
- `skills/refute/SKILL.md:151` "It becomes a step only by the user's ruling." and `skills/land/SKILL.md:213` "The step that finishes it ... enters the plan only by the user's ruling." Under self-rule a closed item can add a step tagged with a "(self-rule)" bullet. False under `self_rule: on`.
- `skills/repo-setup/templates/plan-terms.md:77` and `docs/glossary.md:82`, **quoted ruling**: "the bullet of that name in it, whose first line ends with "(the user)"", listing `plan` and `grill`. Items 5 and 7 make `plan` and `grill` accept "(self-rule)". False. Step 8's line amends only the D24 terms (open item, ruling, and the three new ones), and the brief's item 10 says this step changes no term, so no step changes it.
- `skills/repo-setup/templates/plan-terms.md:86` and `docs/glossary.md:91`, **resume point**: the list "a stop, the preparation commit, the launch commit, a repair round sent, a step taken back out of main, the landing and a handover". Item 2 adds a choice taken under self-rule and a review of a choice to the list in `plan-orchestration`. Incomplete after the change, and no step covers it.
- `README.md:18` (outside lines 27-50), the `spec` row: "It checks that the user approved the step". False for a step tagged with a "(self-rule)" bullet.
- `skills/repo-setup/templates/shared-rules.md:8` "**No silent design decisions.** A user-visible choice ... is surfaced as a decision before it is built." and `:20` "Stop only where the decision belongs to the user: a user-visible shape nothing names, a premise found wrong that the plan cannot absorb ..., a red check ..., a rule clash." Under `self_rule: on` the section closes "A shape nobody named", "A wrong premise" and "A red check" and builds on them before the user sees them. The change contradicts the user's written rules that every repository set up by `repo-setup` carries in `CLAUDE.md`. The brief does not name this. Changing that block is itself a kind-3 change.
- `docs/figures/gen_figures.py:689-692` and `docs/figures/plan-loop.svg`, the `/plan-orchestration` band: "Only the stops marked in these two figures, and the proposals of its recurring-findings pass, reach you; the rest of the row runs without asking". Under `self_rule: on`, most of the "only when" stops it lists do not reach the user, and the choices file does reach the user. Decision 10 says the figures show the default, but the band's words do not say so. `docs/dev/building.md:30` says "A change to a skill's Stops table, to the sequence or to a skill name changes the labels in that script", and the step changes both the sequence (item 8) and a Stops row (item 2).
- `skills/spec/templates/brief.md:67`, `skills/refute/SKILL.md:153`, `skills/land/SKILL.md:110` ("open items ... which hold only what the user must rule on"), and the many "raised to the user as an open item" lines in `land`, `refute` and `diagnose`: these stay true, because the item is still raised before the orchestrator closes it.
- `grep -rn 'ADR [0-9]\{4\}' skills` prints only `plan-terms.md:5` (the placeholder `NNNN`). No skill cites a numbered ADR. See 8 for the brief's dictated "(ADR 0004)" and "(ADR 0005)".

Hits inside the paths that "What to build" does not tell the builder to change, but that the change makes false. Rule 19 of `docs/dev/change-standard.md` would make the builder find them, and the brief should name them:

- `skills/spec/SKILL.md:300`, the Stops row "A step without the user's authority": "each naming a ruling of the user in the Rulings section". After item 4 this row contradicts "What it reads" 4 and ADR 0004 ("`/spec` ... accept it wherever they accept "(the user)""). Also `:3` (description), `:73` and `:75` ("the user's authority"). The description is 1022 characters (the `python3 -c 'import glob,yaml; ...'` count from `docs/dev/skill-layout.md` printed `1022 skills/spec/SKILL.md`). Any added word breaks the 1,024 limit, so a rewording has to keep its length.
- `skills/plan-orchestration/SKILL.md:57` "since only the user's ruling adds a step to the plan", `:258` "A step enters the step list only by the user's ruling", `:267` "since only the user's ruling makes it a step", `:346` "It becomes a step only by the user's ruling". Also `:209` and `:216` in "The recurring-findings pass" ("since the user rules on it", "The user rules on each proposal"): under self-rule, a proposal whose change is a brief's wording or a skill's step falls outside Decision 4's kind 3 and would be closed.
- `skills/ordo-help/SKILL.md:78` "the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours)", `:69` "becomes a step only by your ruling", `:74` "it wrote an open item and no brief".

Findings: `plan/SKILL.md:138`; `plan/templates/plan.md:20`; `orchestrator-state.md:37`, `:39` and `:41`, and its Closed items form; `refute/SKILL.md:151`; `land/SKILL.md:213`; the **quoted ruling** and **resume point** terms; `README.md:18`; the shared rules `:8` and `:20`; the figure band and the `building.md:30` rule. All are outside the paths. Inside the paths, these are not instructed: `spec` `:3`, `:73`, `:75` and `:300`; `plan-orchestration` `:57`, `:209`, `:216`, `:258`, `:267` and `:346`; `ordo-help` `:69`, `:74` and `:78`.

## 2. The step line

Step 6's line (`grep -n '^- 6 ' .scratch/2-e-a-self-rule/plan.md`, line 32), part by part:

- A "Self-rule" section of `plan-orchestration`: item 1.
- The six kinds left open: item 1.2.
- Every other item closed with its recommendation: item 1.3.
- Booked "(self-rule)": items 1.3.3 and 1.3.4.
- Written to `<ledger_root>/choices.md` in the form of D3: items 1.5 and 3.
- The review flow of `C<n> Agree` and `C<n> => <text>`: item 1.6. This covers only a choice booked in an open or archived `plan.md`'s Rulings as `Open item <L>`. ADR 0005 and D4 put `/grill`'s choices under `next_entry` in the same file. Those are booked as `D<n>` bullets, possibly in a rulings file that `/plan` later removes. The dictated forms ("replacing Open item <L>", "that plan's Closed items") exclude them. The `/grill` side is step 7's, but the review flow is this step's.
- `spec`, `plan` and `grill` accepting "(self-rule)" wherever they accept "(the user)": items 4, 5 and 7. They do not reach `spec:300`, `spec:73/75` or `plan:138` (see 1), which are places where those skills accept or require a ruling of the user.
- `grill` carrying only "(the user)": item 7, second sub-bullet.
- `ordo-help` showing the choices awaiting review: item 8.
- A template `choices.md`: item 3.
- Check, "each changed text read in place, and the flow of D23 walked on a scratch copy": verify 3.

Findings: "wherever they accept" is not fully served (`spec:300`, `:73`, `:75`, `plan:138`). The review flow has no form for a `/grill` choice.

## 3. Premises

- Step line: `grep -n '^- 6 ' .scratch/2-e-a-self-rule/plan.md` printed `32:- 6 Self-rule in the loop (D2, D3, D4, D23, ADRs 0004 and 0005): ...`. It also printed `48:- 6 after 1, 2 and 3; 7 and 8 after 6.` Matches.
- Goal: `sed -n 20,30p docs/roadmap.md` shows entry 2.E.A, its Goal on line 24. Matches the quote.
- Rulings D2, D3, D4 and D23: read at `plan.md:53-54`, `:55` and `:74`. The quotes match.
- `grep -rn '(the user)' skills docs/dev README.md --include='*.md'` matches the brief's list. It also prints `skills/grill/references/decision-form.md:49`, `:50` and `:77`, worked examples that the brief does not list. They are unaffected, but the list is not complete.
- `grep -n -i 'clash' skills/grill/SKILL.md skills/plan-orchestration/SKILL.md` printed `:113`, `:214` and `plan-orchestration:297` as stated. However, the brief's "Read" item 7 calls line 113 "Steps 6's clash bullet". `awk 'NR>=86 && NR<=181 && /^[0-9]+\. /' skills/grill/SKILL.md` shows Steps 3 starting at 95 and Steps 4 at 127, so line 113 is in Steps 3.
- `grep -rn 'choices.md\|(self-rule)\|C<n>' skills docs/dev README.md` printed nothing, exit 1. Matches.
- `grep -n 'self_rule\|next_entry' skills/plan/templates/orchestrator-state.md .scratch/2-e-a-self-rule/orchestrator-state.md` printed `:28` and `:29` of the template and `:38` and `:39` of the plan's state file. Matches.
- `grep -n '^## ' skills/plan-orchestration/SKILL.md`: the list matches. `ls skills/plan-orchestration/templates` printed "No such file or directory". Matches. Step 4's worktree holds `plan_cost.py`, `plan_cost.test.sh` and `prices.txt` (`ls .agents/worktrees/2ea-4/skills/plan-orchestration/templates`).
- Line numbers 156, 297 and 304 of `plan-orchestration`, 44, 209, 223 and 225 of `spec`, 56 of `plan`, 31 of `plan/templates/plan.md`, and `ordo-help` 45 and 75 match (read).
- "Step 4, in flight, also writes `plan-orchestration/SKILL.md`, `plan/SKILL.md` and `plan/templates/plan.md` (line 21)". `sed -n '/^## Paths this step writes/,/^## /p' agents/briefs/4.md` and `git diff --stat 4aa05f2` in `.agents/worktrees/2ea-4` show that step 4 also writes `README.md` (a paragraph and a code block after line 129). `README.md` is in step 6's paths (lines 27-50). The brief's note leaves this shared file out. The lines differ, so the merge looks simple, but the note is incomplete.
- ADRs 0004 and 0005 quotes: match `docs/adr/0004-*.md` and `0005-*.md`.

Findings: the shared file `README.md` with step 4 is not named. "Steps 6's clash bullet (line 113)" should read Steps 3. The `decision-form.md` hits are missing from the "(the user)" list (harmless).

## 4. Cases and checks

- Cases 1 to 8, 10, 13, 15, 17 and 19: consistent with the rules file and the standards.
- Case 9 (a `/spec` false-premise stop with one clear recommendation is closed) is inconsistent with the brief's own kind 3 (item 1.2.3 and Decision 4): "an option that removes or rewrites a step the user approved" stays open. A `/spec` false-premise stop exists only when the correction "would change the step's scope or make a choice the user would see" (`spec` Steps 2). Its booking rewrites the step's text in `plan.md` (`spec` "Steps / A ruling" 2: "the step's text in `plan.md` is rewritten to what was ruled"). Every step of this plan is `(approved)`, so under Decision 4 case 9 stays open, and so would nearly every stop before a build. That also makes step 11's check ("at least one item closed into `choices.md`") depend on a stop that kind 3 does not catch.
- Case 11 is consistent with item 4. `spec:300` then contradicts it (see 1).
- Case 12: consistent with Decision 3. See 5 and the closing judgment for its `/roadmap` part.
- Case 14 ("an answer that contradicts a (self-rule) bullet: no rule clash"): ADR 0004 says "A later ruling of the user replaces it". Under `next_entry` (step 7), `/grill`'s answers are themselves taken under self-rule. The case and the dictated line do not restrict this to the user's answer, so a self-rule answer could replace a self-rule bullet, which kind 3 forbids.
- Case 16: the fix step's tag `(ruling C4)` does not name the bullet the case books. `spec` "What it reads" 4 names a line by "the text before its first ` (`", which for `- C4 <the decision, as a phrase> (<date>): ...` is `C4 <the decision, as a phrase>`. `grill` "Steps / Writing what settled" 1 confirms the convention: "The phrase makes a step's `(ruling <name>)` tag name the decision as `D<n> <the decision, as a phrase>`". `/spec` of that fix step refuses it as "A step without the user's authority".
- Case 18: kind 4 is cited for "never added under self-rule". Kind 4 is the closing's roadmap diff. The review is typed by the user, not taken under self-rule, so the citation is wrong (harmless).
- Case 20 conflicts with the scratch setup verify 3 prescribes: a choices file holding C3 to C6 has `Last number` at C6 or above, while case 20 sets `Last number: C4`. Case 9, applied to the same file, then makes C7.

Findings: case 9 against kind 3 and Decision 4; case 14 against ADR 0004's "of the user"; case 16's tag against `spec` "What it reads" 4; case 20 against verify 3's setup; case 18's kind citation.

## 5. The question

The goal this step delivers: under `self_rule: on` the orchestrator closes every open item outside the six kinds with its recommendation, books it "(self-rule)", writes it to `<ledger_root>/choices.md` in D3's form, and the user can review it.

- Cases 1 to 8 and 10: no. Each needs the text to keep a named kind open.
- Case 9: yes, as written. With kind 3 read as Decision 4 reads it, a builder walking the text either finds case 9 left open, so the core closing path is never exercised, or ignores kind 3. Either way the walk passes on the builder's say-so.
- Cases 11 to 14: no, each a reading of a named line. Case 11 could pass while `spec:300` still requires a ruling of the user.
- Cases 15 to 20: walked by the builder on its own text. They could pass without the goal being reached. Nothing in a fresh session finds the review flow when the user types `C3 Agree`. `spec` triggers on "Ruled: ..." (its description), and no skill's `Triggers on:` names `C<n> Agree` or `C<n> =>`. The brief puts the flow in a reference section of `plan-orchestration`, whose triggers are "run the plan, next step, ...". A walk that follows the text by hand cannot show this.
- Case 21: no.
- The step line's check ("read in place, flow walked"): yes, for the same trigger reason, and because the walk runs on a setup that case 20 contradicts.
- Item 1's check: as above.
- Items 2 to 9 (read in place): no, each a named sentence.
- Verify 2 (`grep -rn '(self-rule)' skills README.md` lists a hit in `ordo-help/SKILL.md`): it cannot pass as the brief dictates the text. Item 8's dictated lines hold "under self-rule:" and no "(self-rule)", so the check either fails or pushes the builder to add the string to satisfy the grep.
- Verify 4: a fact check. No.

Findings: the review flow has no trigger, so cases 15 to 20 and the step's check can pass while a user's `C<n> Agree` reaches no skill. Case 9 against kind 3. Verify 2 expects a hit in `ordo-help` that the dictated text does not contain.

## 6. Implied inputs

This is a text step (skill text and one template), not a code step, so the template's implied-input rule does not bind. The flow does have inputs that the step's text implies and "Cases" leaves out. A walk on verify 3 would meet each of them:

- `Booked:` gives `path:line`. A later step added to the step list (above Rulings), for example the fix step `C<n> =>` adds, shifts every Rulings line, so the line goes stale. Expected: the review finds the bullet by its name (`Open item <L>`) and treats the line as a pointer, as `docs/dev/change-standard.md` "Where the work happens" says a quoted line is located by its text.
- A choice whose ruling added a step (tag `(ruling <L>)`), replaced by `C<n> => <text>` before that step is prepared. The step's tag then names a bullet ending "(self-rule, replaced by C<n>).", and `/spec` refuses it (case 11). Expected: the new ruling retags, rewrites or removes that step.
- A "(self-rule)" bullet replaced by a later ruling of the user outside the review (a `Ruled:` reply, or `/grill` line 214) while its choice is still in `choices.md`. Expected: the choice leaves the file, or the review names the replacement. Without a rule, `C<n> Agree` would rewrite a replaced bullet.
- `C<n> Agree` on a closed, archived plan. The text covers it, but no case does.
- `C<n> =>` with a step of `Builds on it:` in flight (Decision 8). No case.
- `C<n> Agree` with no choices file. Case 19 assumes the file exists.
- An open item whose recommended option runs `/roadmap`, `/ordo-init` or `/repo-setup` (Decision 3). The skill finds no ruling and its approval stop reaches the user, which the section does not say.
- A library candidate under `libraries: check` (`spec` Steps 3). Which kind is it (kind 1, "reaches outside the repository"?), or is it closed?
- A recurring-findings proposal for a brief's wording, a skill's step or a standards page. Is it closed under self-rule? Decision 4's list omits the standards pages.
- A step stopped after its build (by `/refute` or `/land`) and closed under self-rule. Item 1.3.8 covers it in words, but no case does.
- `self_rule` absent from the block. Item 1.1 covers it, but no case does.

Findings: these inputs are missing from "Cases". The first three are flaws in the flow, not only missing cases.

## 7. ADRs

- 0001, 0002, 0003 (writing base, prose standard over academic sources, a fresh reviewer of a draft): do not touch the step.
- 0004: touches it. "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)". A later ruling of the user replaces it without a rule clash. When the user agrees with it in review, its ending is rewritten to "(the user)", and only then is it a carried ruling for another entry." Named in the brief. The brief's own wording contradicts it in places:
  - Item 7's line-214 addition ("An answer that contradicts a bullet ending "(self-rule)" replaces it") is not restricted to the user's answer.
  - Item 7's line-113 addition lets any carried ruling replace a self-rule bullet. ADR 0004 says "later". A carried ruling may predate the self-rule bullet.
  - Item 4 leaves `spec:300` requiring "a ruling of the user", which contradicts "accept it wherever they accept "(the user)"".
- 0005: touches it. "Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry. The file is never archived. An entry leaves it when the user has reviewed it." Named. The review flow's forms (item 1.6) do not handle a `/grill` choice (see 2).
- 0006 (every agent's id with its role): the step starts no agent. Does not touch it.
- 0007, 0008: do not touch it.

Findings: three places where the brief's wording contradicts ADR 0004 (lines 214 and 113 of `grill`, `spec:300` left unchanged). These are found in the brief's own wording, not in the step's text, so a change to the brief closes them. ADR 0005's `/grill` choices are not reachable by the review flow. No ADR the step touches is left unnamed.

## 8. Dictated text

Each line was located with `grep -n '<words>' .scratch/2-e-a-self-rule/agents/briefs/6.md`, at the line given. Pages: rules file `docs/dev/change-standard.md` (CS), `docs/dev/skill-layout.md` (SL), the prose standard (PS), `docs/glossary.md` (G).

- 36-53, the sub-heading labels "When it applies.", "The six kinds left open.", "Every other open item is closed by the orchestrator", "The counts stay.", "The choices file", "The review.", "Reports.". "Every other open item is closed by the orchestrator" and "The counts stay." are sentences. Used as sub-headings or as bold labels, they break PS "0. Hard rules" (headings are labels, not sentences) and the SL Anti-patterns row "A heading that is a sentence or a slogan". The brief also leaves open whether they are headings ("as bullets under these sub-headings or in this order").
- 48 `- Open item <L> (<date>): <the option taken in one line, and what it unblocks> (self-rule).`: the words hold. The rule around it ("Whatever the ruling changes, a bullet is written") together with 1.3.3 (book as `spec` "A ruling" 2, which already writes a bullet for a ruling that adds or splits a step) gives two bullets for one choice. SL "Where a rule goes", "A rule is written once".
- 55 `# Entry <entry number> <entry title>`: holds.
- 56 `## C<n>. <the decision, as a phrase> (<date>)` and `Last number: C<m>`: hold.
- 58 `Taken: <the option taken>`, ``Booked: `<path>:<line>` ``, `Builds on it: <the steps, comma-separated, or none>`: hold.
- 60 "... until reviewed (ADR 0005).": breaks CS "Rules this repository already states" ("The skills carry no project name and no path") and `plan-orchestration` Rules ("The skill carries no project name"). The skill is installed in other repositories, where `docs/adr/0005` is another record.
- 64-65 `C<n> Agree` and `C<n> => <the user's ruling, one clause per question the open item asked>`: hold.
- 68 `- C<n> agreed by the user (<date>).`: the words hold. Its form differs from the state file template's Closed items form `- <date>: <what was raised>: <how it ended>.` (PS D, "No synonym cycling", one form per record). It also names "that plan's Closed items" for a choice that may sit in a rulings file.
- 69 `- C<n> <the decision, as a phrase> (<date>): <text>, replacing Open item <L> (the user).`: the words hold. "replacing Open item <L>" has no form for a `D<n>` bullet. With line 71 it gives a tag that does not resolve (see 4).
- 70 "(self-rule, replaced by C<n>).": holds.
- 71 `- <k> <what changes to follow C<n>>; check: <the check> (1 commit) (ruling C<n>)`: `(ruling C<n>)` does not name line 69's bullet under `spec` "What it reads" 4 (see 4). "(1 commit)" fixes a count where `plan/templates/plan.md` uses `(<n> commit)`.
- 77 `Review them in <ledger_root>/choices.md with C<n> Agree or C<n> => <ruling>.`: the path and the two literals are not in inline code (PS F, "Inline code for paths, identifiers, literals"). `=>` in uncoded prose reads as an arrow (PS 0, "Arrows (`->`) only inside code"). The rule also sits in a reference section instead of in Steps 10's item, which is where the final message is said (SL "Where a rule goes").
- 79 "Under `self_rule: on`, the orchestrator closes it instead, unless it is of a kind "Self-rule" leaves open.": holds. It drops "that" ("a kind that "Self-rule" leaves open"), which makes it hard to parse.
- 80 "a choice taken under self-rule (its booking and the choices file) and a review of a choice": holds.
- 81 "Under `self_rule: on`, a stop of a kind "Self-rule" does not leave open is then closed as that section says.": the same dropped "that". It holds by the pages, but is hard to read.
- 82 ", except a ruling of the user that replaces a bullet ending "(self-rule)", which is no clash (ADR 0004)": "(ADR 0004)" breaks the same rule as line 60.
- 83 "6. Under `self_rule: on`, the choices file `<ledger_root>/choices.md`, for its last number and the entry's heading.": holds.
- 87-101, the template: `# Choices taken under self-rule` holds. The line-89 paragraph holds, though it mixes "the user's review" with "your ruling" in one paragraph. The placeholder lines hold. The file has two levels of `#` (title and entry), which no page forbids.
- 107 "Under `self_rule: on`, `plan-orchestration`'s "Self-rule" books the option ... every bullet it writes ending "(self-rule)."." This restates the rule of item 1.3.3 in a second skill. SL "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in", and the brief's own "What it must do" says the same. It ends in the doubled punctuation `"(self-rule)."."`.
- 109 ", never a choice taken under self-rule (`plan-orchestration`, "Self-rule")": holds.
- 110 "The bullet's first line ends with neither "(the user)" nor "(self-rule)", each with or without a full stop after it.": holds.
- 111 `- Open item <L> (<date>): <the option the orchestrator took under self-rule, in one line, and what it unblocks> (self-rule).`: holds. Its placeholder wording differs from line 48's for the same form (PS D, "No synonym cycling").
- 114 "A bullet ending "(self-rule)" is no carried ruling until the user agrees with it in review and its ending reads "(the user)" (`plan-orchestration`, "Self-rule").": the words hold. It restates what line 50 already requires (SL "Writing for an agent", a sentence that restates a default).
- 115 "A bullet of the entry's Rulings ending "(self-rule)" that a carried ruling contradicts is replaced by it, with no rule clash (ADR 0004).": "(ADR 0004)" breaks the same rule as line 60. It also contradicts ADR 0004's "later" (see 7) and gives no ending rewrite for the replaced bullet, unlike line 116.
- 116 "An answer that contradicts a bullet ending "(self-rule)" replaces it, with no rule clash: ...": the words hold by the pages. It is not restricted to the user's answer (see 7).
- 118 "4. The choices file `<ledger_root>/choices.md`, when it exists.": holds.
- 119 "Print the choices awaiting review: ...; with no file or no choice, the line `Choices awaiting review: none`.": a new Steps item without its completion criterion (SL "Writing for an agent": "Each item of Steps ends on its completion criterion"). It does not say whether plain `/ordo-help` (no entry) prints it.
- 123-124, the `ordo-help` sequence lines: hold. The description starts at column 31, like the existing lines. A check with `awk '{match($0,/  +[a-z]/); ...}'` printed 30 for both and 30 for `ordo-help:59`.
- 128, the README line `C<n> Agree | C<n> => <ruling>   under self-rule: review a choice the orchestrator took, in choices.md`: its description starts two columns later than README's other lines (the same awk printed 32 for it and 30 for `README.md:44`). The brief says "add the two lines of item 8's block" and then gives one line.

Findings: lines 60, 82 and 115 (numbered ADRs in skill text). Lines 36-53 (sentence labels). Line 48 with 1.3.3 (double bullet). Line 68 (Closed items form). Lines 69 and 71 (tag that does not resolve). Line 77 (code formatting, placement). Line 107 (restated rule, doubled punctuation). Line 114 (restates line 50). Line 119 (no completion criterion). Line 128 (alignment, "two lines").

## Judgments asked for in the brief-check task

- **The reading of the six kinds against the goal.** Kinds 1, 2, 4 and 6 follow the goal's words. Kind 5 adds two things the goal does not say: "the step that wrote the page waits for the reading", and later steps run only when they "do not rest on it". The goal says only that the reading "does not block the steps after it", and "waits" is left undefined: not landed, or not ticked? Kind 3, as Decision 4 reads it, is wider than "the reversal of a ruling". It takes in every rewrite of an approved step, which the brief's own case 9 and item 1.3.8 contradict. It leaves out the standards pages the configuration block names, and the shared rules, although those are "the user's written rules".
- **Decision 1** (placement): consistent. Under SL "Writing for an agent", a reference section holds only material every run reads, and material only some runs need goes in `references/<name>.md`. The choices-file format and the review flow are needed only under `self_rule: on`, and the review runs outside the loop. Moving the review flow into `spec` next to "Steps / A ruling", whose description already triggers on "Ruled:", and naming `C<n> Agree` in that description's `Triggers on:`, would also give the flow its trigger. The step line says "a Self-rule section of plan-orchestration" for the six kinds and the closing, and names the review flow as a separate part, so that move stays inside the line.
- **Decision 2** (a bullet for every choice): consistent with D3 and D23, but see the double bullet at line 48.
- **Decision 3** (`roadmap`, `ordo-init` and `repo-setup` keep "(the user)" alone): consistent with ADR 0004, which names `spec`, `plan` and `grill`. For `ordo-init` and `repo-setup`, kind 3 fits. For `roadmap` it decides step 7's ground: D14 lets `/roadmap add` add work "a finding of a running plan names", and only the closing's roadmap diff is kind 4. Under self-rule, keeping `/roadmap` on "(the user)" makes every `/roadmap add` reach the user, which is a seventh kind the goal does not list. Leave `/roadmap` to step 7, or raise it.
- **Decision 4**: see above. It contradicts case 9 and item 1.3.8. Settling how far the goal's kind 3 reaches decides which items reach the user, which is a choice the user sees (`spec` Steps 4: a user-visible choice is not taken). Either narrow it to the goal's words with case 9 consistent, or raise it.
- **Decision 5**: consistent with D23 ("the old bullet kept as replaced").
- **Decision 6**: consistent.
- **Decision 7**: consistent with D3.
- **Decision 8** (a step in flight counts as built on the choice): wider than D23's "when work built on the choice has landed". It is not lazy, but it departs from the ruling's words.
- **Decision 9** (commit at once, since the next `/spec` commits only the plan's own records): it contradicts item 1.5. Item 1.5 says the orchestrator adds a step to `Builds on it:` "and commits it with the preparation commit", but `choices.md` is outside the plan's folder and `spec` Steps 6 commits only the plan's records. Either `spec` Steps 6 changes, or that update is committed by path on its own.
- **Decision 10** (figures stay): see 1. The band's words become false under `self_rule: on` and do not say they show the default, and `building.md:30` ties a sequence or Stops change to the labels. `docs/figures/gen_figures.py` and the two SVGs belong in the paths, with a phrase in the band, unless the session judges otherwise.
- **Places the self-rule flow must change that the brief's paths miss** (a named thing is its whole):
  - `skills/plan/templates/orchestrator-state.md` (Open items heading and lines, Closed items form).
  - `skills/plan/SKILL.md:138`, and `skills/plan/templates/plan.md:20` (outside the ranges).
  - `skills/refute/SKILL.md:151`, `skills/land/SKILL.md:213`, `README.md:18`.
  - The **quoted ruling** and **resume point** terms in `plan-terms.md` and `docs/glossary.md`. Neither step 6 nor step 8 covers them. Step 4, in flight, writes both files.
  - `docs/figures/gen_figures.py` with the SVGs.
  - The shared rules `:8` and `:20`, a clash between the goal and the user's written rules. This may be a stop "A rule clash" for the user rather than a change to the brief, since the shared-rules block is the user's.

## Declined to judge

- Whether the clash between the goal's self-rule and the shared rules "No silent design decisions" and "No question boxes" is to be raised as a stop or answered by a sentence in the Self-rule section. That is the user's call. The report names the clash only.
- Whether kind 3 should cover rewriting an approved step. That is the user's reading of the goal's "reversal of a ruling". The report names only the contradiction with case 9.
- Whether step 4's `README.md` change and step 6's merge simply at landing. That is the orchestrator's judgment under `spec` Steps 5. The lines differ (step 4 inserts after 129, step 6 writes 27-50).
- The `/grill` side of the review flow beyond naming the gap, since step 7 writes `/grill` under `next_entry`.

Agent usage: acf87ddb30973c88b, claude-opus-5-5 (ordo-high), 239319 tokens, 43 tool uses, 9 min 48 s.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- The clash between self-rule and the shared rules "No silent design decisions" and "No question boxes" (Names): raised to the user as Open item B, question 1, since the shared-rules block is the user's written rules.
- Decision 4's reading of kind 3 against case 9 and item 1.3.8 (Cases and checks, The question, and the judgment on the six kinds): raised as Open item B, question 2, since how far "the reversal of a ruling" reaches decides which items reach the user.
- Every other finding: closed in the brief by the `/spec` run after the ruling on Open item B, which does not check the step again ("Steps / The brief check" 4); each change is named here then. The brief was removed at the stop, as "Steps / The brief check" 4 says.
