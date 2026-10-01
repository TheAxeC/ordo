# Step 8 brief check (on main at 1bb77a1)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/8.md` (uncommitted; `git status --short` printed `?? .scratch/2-e-a-self-rule/agents/briefs/8.md`). A page this report cites is named by its section. A line of code or a grep hit keeps its `file:line`.

## 1. Names

The commands, run on main with `.scratch/` left out (the ledger is a record, not text a reader follows) and the brief's paths left out:

- `git grep -n -i 'self-rule\|self_rule' -- ':!.scratch'`: 147 hits outside the paths.
- `git grep -n -i 'choices file\|choices\.md' -- ':!.scratch'`: 27 hits.
- `git grep -n -i 'open item' -- ':!.scratch'`: 141 hits.
- `git grep -n -i -w 'ruling\|rulings' -- ':!.scratch'`: 383 hits.
- `git grep -n -i 'only the user can make\|decision only the user\|only the user can decide\|...' -- ':!.scratch'`: `docs/glossary.md:65` and `plan-terms.md:60` (both in the paths), plus `skills/diagnose/SKILL.md:48`, `skills/land/SKILL.md:80`, `skills/land/SKILL.md:183` and `skills/plan-orchestration/SKILL.md:123`.

The full per-file line lists came from the awk summary of those greps. The hits whose truth the change can affect:

- `skills/land/SKILL.md:80` "The failure goes to the user as an open item only when only the user can decide what to do", `skills/plan-orchestration/SKILL.md:123` (the same words), `skills/diagnose/SKILL.md:48` ("only when only the user can decide") and `skills/land/SKILL.md:183` (When cell "only the user can decide what to do"). The step drops "a decision only the user can make" from **open item** because, under self-rule, the orchestrator decides some of these items. These four lines keep the same claim in other words. Under self-rule the orchestrator closes such a failure (`land:183`'s What-resumes cell already says so), so "only the user can decide" no longer holds. **They are made inconsistent with the amended term.** They are outside the paths, and `plan-orchestration/SKILL.md` is a path step 7 writes whole.
- `skills/repo-setup/templates/plan-terms.md:110` / `docs/glossary.md:115`, **stop**: "a halt for a decision that is the user's, which leaves an open item". Under self-rule a stop outside the six kinds is closed at once, and the loop does not halt. This is a third term of the block that clashes with self-rule, the way D24 says **open item** and **ruling** do. The change does not make it false, since it was already in tension from step 6, but it leaves the block saying two different things. Not named by D24.
- `skills/plan-orchestration/SKILL.md:277`, `skills/refute/SKILL.md:153`, `skills/land/SKILL.md:110`, `skills/spec/templates/brief.md:67` and `skills/plan/templates/orchestrator-state.md:37`: "the open items hold only what the user must rule on". **Not false.** The orchestrator writes an item it closes under self-rule and moves it to the Closed items in the same resume-point commit (`references/self-rule.md`, "Closing an open item" 6). At rest, the open items still hold only what the user must rule on.
- `skills/grill/SKILL.md:115,216,333,334` and step 7's `/grill --self-rule` D<n> bullets ending "(self-rule)" (brief 7, item 5.5). **Not false, but not covered.** The new **self-rule** entry says self-rule is a mode "in which the orchestrator closes an open item". `grill` uses the "(self-rule)" ending for decisions that are not open items. The **ruling** entry's existing sense "a settled `grill` decision" covers those bullets as rulings. The **self-rule** entry does not cover `/grill` or `/plan` run under self-rule. See section 7, ADR 0005.
- `skills/grill/SKILL.md:216` "Its choice leaves the choices file" when a user's answer replaces the bullet, and `references/self-rule.md` "The choices file" (the `:56-57` bullets). A choice also leaves the file when a ruling of the user replaces it outside a review. **The new choices file entry's "kept until the user reviews it" leaves this out.** Not false if a replacing ruling counts as a review. The point is for the orchestrator to judge.
- `docs/adr/0004...md:7`, `docs/roadmap.md:24`, `docs/figures/gen_figures.py:693-694` and `docs/figures/plan-loop.svg:140`: "closes ... except for six kinds" and "closes every stop outside six kinds". Not made false by this step. They share the over-breadth of section 8, finding 2.
- Every other hit uses the four terms in a sense the new or amended entries keep. These are the `check_config.*` key handling, the plan templates, `spec` "What it reads" 4 and "Steps / A ruling", `ordo-help`, README:45-56, `references/self-rule.md`, `land:213-214`, and the many "a ruling of the user or, under `self_rule: on`, a choice ... books" lines (`plan-orchestration:269,278,361`, `refute:151`, `orchestrator-state.md:39`). "A ruling of the user" stays qualified, so the new sense makes none of them false.

Findings:
1. `land/SKILL.md:80`, `land/SKILL.md:183`, `plan-orchestration/SKILL.md:123` and `diagnose/SKILL.md:48` keep "only the user can decide", the phrase the step removes from **open item** because self-rule makes it untrue. The brief neither carries the change there nor says why not (the rules file, "The rules" 14 and 19). `plan-orchestration/SKILL.md` is a path of step 7, so a carry there must be ordered after step 7 lands, or folded into step 7.
2. **stop** (`plan-terms.md:110`) says "a halt for a decision that is the user's", which clashes with self-rule like the two terms D24 amends. The brief does not name it.

## 2. The step line

- "The terms of D24": items 1 to 4. **next-entry mode** moved to step 7, as `plan.md` "Step 7, `next_entry`: Step 0" (last bullet) says.
- "**self-rule** ... added": item 2.
- "**choices file** added": item 1.
- "**open item** ... amended": item 3.
- "**ruling** amended": item 4.
- "in `skills/repo-setup/templates/plan-terms.md`": items 1 to 4.
- "synced into `docs/glossary.md`": item 5.
- "check: `git diff docs/glossary.md` after `/repo-setup sync` shows the words of D24": Case 6 and Verify 3. The sync is the script's `--write --only glossary`, not `/repo-setup sync` (section 3, finding 1).
- "(1 commit)": the landing; no item needed.

Findings: none (every part has an item). Open item H is still open. Its recommended option (a) says "the template change joins step 8" (`skills/repo-setup/templates/shared-rules.md:20`). The brief does not mention it. See "Declined to judge".

## 3. Premises

- Step line: `grep -n '^- 8 ' .scratch/2-e-a-self-rule/plan.md` printed line 35 with the text the brief quotes. Matches.
- D24 at `plan.md:75`: `sed -n '1,90p' plan.md | cat -n` line 75 holds the quoted text. Matches.
- The words of round 2: python over `~/.claude/projects/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda.jsonl` for `one heading per decision taken under self-rule`. The round-2 record is line 3938 (assistant, 2026-09-30T21:59:37.319Z), and its term lines read:
  - `**self-rule**: the mode `self_rule: on` sets, in which the orchestrator closes an open item outside the six kinds of `plan-orchestration`'s "Stops" with the option it recommends, books it as a ruling whose line ends "(self-rule)", and writes it to the choices file.`
  - `**choices file**: `<ledger_root>/choices.md`, one heading per decision taken under self-rule, grouped by roadmap entry, kept until the user reviews it.`
  - Round 2's **open item** line: "It is a decision only the user can make" becomes "It is a decision for the user, closed by the user's ruling or, under self-rule and outside the six kinds, by the option the orchestrator recommends".
  - Round 2's **ruling** line: gains "Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees".
  - Both quotes in the brief match. Item 3 applies round 2's open-item words as two replacements around the kept middle of the sentence, which keeps their meaning.
- The six kinds moved: `grep -n '^## ' skills/plan-orchestration/references/self-rule.md` printed `3:## Scope`, `7:## The six kinds left open`, `21:## A skill with its own approval stop`, `25:## Closing an open item`, `38:## The counts`, `43:## The choices file` and `60:## The review of a choice`. `plan-orchestration/SKILL.md:224` is `## Self-rule`, and its bullet "The reference" points at the file. Matches.
- `sed -n '60p;96p' plan-terms.md`: the **open item** and **ruling** lines as quoted. `grep -n` puts them at glossary `:65` and `:101`. Matches.
- `sed -n '19,20p;98,99p'`: **change point**, **Closed**, **runner** and **sequence, the**. Glossary `:24-25` and `:103-104`. Matches.
- `ls CLAUDE.md` printed `ls: CLAUDE.md: No such file or directory`, exit 1. Matches.
- `docs/glossary.md:3` names `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`. Matches.
- "`--write` copies the template into the block (`sed -n 4,8p ...`)": lines 4-8 hold the usage line and the descriptions of the block and of `--only`. The `--write` behaviour is at `sync_rules.py:10` ("--write replaces the text between the two markers of each block that differs with its template..."). **The line range is wrong.**
- "That command is `/repo-setup sync`'s run for the plan-terms block": `/repo-setup sync`'s Steps / sync 1 runs `sync_rules.py <path>` with no `--only`. On Ordo, `python3 skills/repo-setup/templates/sync_rules.py .` printed `error: no CLAUDE.md in /Users/axelfaes/workspace/ordo`, exit 2. That is Steps / sync 7: draft nothing and stop. **`/repo-setup sync` does not run the plan-terms sync on Ordo.**
- "on main it prints `ok: ...`": `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Matches.
- Step 7's lines: `grep -n` printed **loop** `:57`, **night rule** `:58` and **quoted ruling** `:79` (glossary `:62`, `:63`, `:84`). Step 7's brief "Paths this step writes" lists the same ranges. Matches. The ranges do not overlap step 8's (`:19-20`, `:60`, `:96-99`). At least one unchanged line separates every pair of hunks (58-59 between step 7's insertion and `:60`), so the cherry-pick merges without a conflict.
- ADRs: see section 7. Matches.

Findings:
1. The premise that the script run "is `/repo-setup sync`'s run for the plan-terms block" is wrong. On Ordo `/repo-setup sync` exits 2 on the missing `CLAUDE.md` and writes nothing. The brief should state that the step line's "after `/repo-setup sync`" is met by `sync_rules.py . --write --only glossary`, the form README "Working on Ordo" and `docs/glossary.md:3` give, and say this is a correction, not an equivalence.
2. `sed -n 4,8p` does not show what `--write` does. The sentence is at `sync_rules.py:10`.

## 4. Cases and checks

- Case 1 (self-rule looked up): consistent in form. Its expected result accepts an entry that says the orchestrator closes every item outside the six kinds. `references/self-rule.md` "Closing an open item" also keeps open the items of "A skill with its own approval stop" and the stops "The counts" names (also `plan-orchestration/SKILL.md:319`). The case therefore accepts text that contradicts the rule it points at (the rules file, "The rules" 19).
- Case 2 (choices file): consistent, except that "when a choice leaves" accepts "kept until the user reviews it". That leaves out removal by a replacing ruling outside a review (`references/self-rule.md`, "The choices file", the bullet on a ruling of the user that replaces a bullet ending "(self-rule)").
- Case 3 (open item under self-rule): **inconsistent.** Its expected result "an item outside the six kinds is closed by the orchestrator's recommended option" is false for a stop "The counts" names (never closed under self-rule) and for an option that meets "A skill with its own approval stop".
- Case 4 (ruling ending "(self-rule)"): consistent with `spec` "What it reads" 4 and ADR 0004.
- Case 5 (sync prints ok): consistent. It is a fact a script computes (the rules file, "Scripts compute facts; judgment is read").
- Case 6 (`git diff` inside the block): consistent.
- Verify 1 to 4: consistent. `checks.sh` holds 11 commands (the state file's `verify:` list counted). The ASCII check of Verify 4 is the "Conventions" rule.

Findings:
1. Case 3 states an expected result that contradicts `references/self-rule.md` "Closing an open item" and "The counts".
2. Case 1 accepts the same contradiction. Its expected result should require that the entry agree with "Closing an open item".

## 5. The question

The goal this step delivers: the glossary defines **self-rule** and **choices file**, and amends **open item** and **ruling**, in the sense the self-rule skills use them (the goal's "with `self_rule: on` ... closes it and books it as it does a ruling, and writes it to the choices file" and D24).

- The check on the step line: **yes.** "Shows the words of D24" holds for a diff that contains the words even if they contradict "Closing an open item", or if item 4's placement cuts the `grill` sense off from its "Stated in:". The plan's "No" rests on the presence of the words, not their correctness.
- Case 1: **yes.** It passes with an over-broad entry and with an entry that leaves out `/grill` and `/plan` run under self-rule.
- Case 2: **yes, in part.** It passes with an entry that leaves out removal by a replacing ruling, and with the ambiguous "it".
- Case 3: **yes.** It encodes the over-broad reading as the expected result.
- Case 4: **no for the new sense, yes for the entry.** It reads only the new sense, so it passes when item 4's placement separates "Also a settled `grill` decision" from its "Stated in:".
- Case 5: **yes.** It prints ok on the unchanged tree today. It proves only that the two copies are equal.
- Case 6: **yes, in part.** It passes with the placement defect and the over-breadth, since it checks location and presence.
- Items 1 to 4 have no check of their own beyond Verify 3 (reading the diff for the words). **Yes**, for the same reason as the step line.
- Item 5: Verify 2. **Yes**, as case 5.

Findings: the step line's check, cases 1, 2, 3, 5 and 6, and Verify 2 and 3 could each pass without the goal being reached, as stated above. Two changes would close most of this: a case that reads each new or amended entry against `references/self-rule.md` "Closing an open item", "The counts", "A skill with its own approval stop" and "The choices file" and requires agreement, and a case that reads the whole **ruling** entry for each sense's "Stated in:".

## 6. Implied inputs

Not a code step: this is a text step (the glossary template and its synced copy). Inputs the described text leaves without a rule:
- Where item 4's sentence goes. "Before its last 'Stated in:'" puts it inside the `grill` sense (section 8, finding 4).
- Where item 3's new "Stated in:" pointer goes: as a new group, or joined to the existing `plan-orchestration`, "Stops" group (section 8, finding 3).
- What "it" refers to in "kept until the user reviews it" (section 8, finding 1).
- Whether the builder may change D24's words to agree with `references/self-rule.md`. The brief says "the rest of its words are D24's", so under the rules file, "The rules" 4, the builder stops at the contradiction instead of resolving it.
- Whether `/grill <entry> --self-rule` and `/plan <entry> --self-rule` (step 7) are part of the **self-rule** sense.

Findings: the five points above.

## 7. ADRs

- 0001, 0002 and 0003 (writing base, prose standard over academic sources, read-only draft reviewer): do not touch the step.
- 0004, Decision: "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)". A later ruling of the user replaces it without a rule clash. When the user agrees with it in review, its ending is rewritten to "(the user)", and only then is it a carried ruling for another entry." **Touches the step**, and the brief names it. Its Consequences also say "so do the glossary's **open item** and **ruling**", which this step delivers. No contradiction.
- 0005, Decision: "Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry. The file is never archived. An entry leaves it when the user has reviewed it." **Touches the step**, and the brief names it. The **choices file** entry agrees with it. The **self-rule** entry defines the mode only as the orchestrator closing an open item. It does not cover the choices `/grill` takes under `next_entry`, which this ADR makes choices taken under self-rule. That leaves the term incomplete against the ADR, not in contradiction with it.
- 0006 to 0009 (agent ids, repair-round reviewer, the cost script's prices and response bodies): do not touch the step.
- `grep -n -i 'supersed' docs/adr/*.md`: no record is superseded.

Findings: no contradiction. The **self-rule** entry falls short of ADR 0005's "by the loop or by `/grill` under `next_entry`".

## 8. Dictated text

Each line is located by `cat -n .scratch/2-e-a-self-rule/agents/briefs/8.md`. `LC_ALL=C grep -n '[^ -~]'` on the brief printed nothing (exit 1). No spaced dash appears in lines 29-34.

- Item 1 (`:30`), `- **choices file**: ... kept until the user reviews it. Stated in: `plan-orchestration`, `references/self-rule.md`, "The choices file" and "The review of a choice".`
  - The "Stated in:" form (skill, file, section) matches the block's (`plan-terms.md:54` `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option"). Holds.
  - "kept until the user reviews it": "it" can be read as the file. The file is never removed (`references/self-rule.md`, "The choices file": "The file is never archived"), so that reading is false (prose standard, E, "Cold opens", an unclear antecedent). The line also leaves out removal by a replacing ruling.
  - "one heading per decision": `references/self-rule.md` calls each heading a choice (`## C<n>.`), and **resume point** (`plan-terms.md:88`) says "a choice taken under self-rule". This is two words for one concept (prose standard, D, "No synonym cycling"). D24's word.
- Item 2 (`:32`), `- **self-rule**: the mode `self_rule: on` sets, in which the orchestrator closes an open item outside the six kinds of `plan-orchestration`'s `references/self-rule.md` with the option it recommends, ...`
  - "`plan-orchestration`'s `references/self-rule.md`": the block names another skill's file as "the `<skill>` skill's `<folder>/<file>`" (`plan-terms.md:33,69,103,118`), as `docs/dev/skill-layout.md` "Paths and names" says. The line breaks that form. It also names the file where the premise bullet says the term "names that section". The section "The six kinds left open" appears only in "Stated in:".
  - "closes an open item outside the six kinds": over-broad against `references/self-rule.md` "Closing an open item", which also leaves open "A skill with its own approval stop" and the stops of "The counts". The rules file, "The rules" 19.
  - It leaves out `/grill` and `/plan` under self-rule (ADR 0005, the plan's Goal "run through `/grill`, `/plan` and the loop under self-rule", and step 7). `docs/dev/skill-layout.md`, "Writing for an agent", requires a term to be used only in a sense the glossary defines.
  - The "Stated in:" form (`plan-orchestration`, "Self-rule" and `references/self-rule.md`, "..." and "...") matches `plan-terms.md:101` ("Steps 5 and `templates/sessions.md`"). Holds.
- Item 3 (`:33`), **open item**:
  - "It is a decision for the user": D24. Holds.
  - The resulting sentence chains three "or"s ("closed by the user's ruling or, under self-rule and outside the six kinds, by the option the orchestrator recommends, or a worktree `/land` could not remove, closed by running the removal"). The worktree case then reads as a third way to close a decision rather than a second kind of open item. The sentence runs to about 60 words (prose standard, E, "Sentence length", and clear antecedents). Splitting the worktree case into its own sentence ("It is also a worktree `/land` could not remove, ...") would fix it, but changes words the brief says stay.
  - "outside the six kinds": the same over-breadth as item 2.
  - "its 'Stated in:' gains `plan-orchestration`, `references/self-rule.md`, ..." does not say where the pointer goes. A python pass over every "Stated in:" list of `plan-terms.md` found no entry that names one skill twice. In the block's form the pointer joins the existing group: "`plan-orchestration`, "Stops" and `references/self-rule.md`, "Closing an open item"".
- Item 4 (`:34`), **ruling**:
  - The **ruling** line ends "... Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled"." Inserting the new sentence "before its last 'Stated in:'" puts it between the `grill` sense and that sense's "Stated in:". The `grill` sense would lose its pointer, and the `grill` pointer would follow the self-rule sense. **This placement is wrong.** It should be "after the entry's last sentence", or "before 'Also a settled `grill` decision'".
  - "Also, under self-rule, ...": the comma form has a precedent in the block (`plan-terms.md:74`, "Also, in a diagnosis, ..."). The "Also <sense>. Stated in: ..." form matches the entry's other two senses. Holds.
  - Placed beside "Also the orchestrator's decision on a finding sent in a repair round, ...", it repeats the shape "Also ... the orchestrator's decision on ..." (prose standard, 0, "No repeated construction"). This is minor and could be merged. The orchestrator's call.
  - The "Stated in:" form holds.
- Item 5 (`:35`): holds.
- Decision 1 (`:66`): holds as a correction of a pointer. It does not cover the over-breadth.
- Decision 2 (`:67`), "as every entry of the block has one": `grep '^- \*\*' plan-terms.md | grep -v -c 'Stated in:'` printed 0 of 121 entries. Holds.
- Conventions (`:89`): holds.

Findings:
1. Item 1: "kept until the user reviews it" has an unclear antecedent, under the file reading it is false, it leaves out removal by a replacing ruling, and "decision" cycles with "choice".
2. Items 2 and 3: "outside the six kinds" contradicts `references/self-rule.md` "Closing an open item", "A skill with its own approval stop" and "The counts".
3. Item 2: names another skill's file as "`plan-orchestration`'s `references/self-rule.md`" against the block's and skill-layout's "the `<skill>` skill's" form, and leaves out `/grill` and `/plan` under self-rule.
4. Item 3: the three-"or" sentence, and the unplaced "Stated in:" pointer, which in the block's form joins the `plan-orchestration`, "Stops" group.
5. Item 4: "before its last 'Stated in:'" detaches the `grill` sense from its "Stated in:".

## Declined to judge

- Whether to change D24's words to agree with `references/self-rule.md` (findings 4.1, 8.2 and 8.3). The words come from a ruling of the user. Absorbing a found premise into a step's text is not a reversal under kind 3 as ruling B reads it narrowly, but whether this counts as absorbing a premise or as rewording D24 is the orchestrator's to decide.
- Open item H, kind 3, waiting for the user. Its recommended option (a) adds `skills/repo-setup/templates/shared-rules.md:20` to step 8. If the user rules (a) before step 8 is dispatched, the brief's items and paths grow by that file. The brief does not mention the item.
- Step 7's work in `.agents/worktrees/2ea-7`: not read, as instructed. Collision was judged from its brief only.
- Whether carrying the change to `land/SKILL.md:80,183`, `diagnose/SKILL.md:48` and `plan-orchestration/SKILL.md:123`, and to **stop**, belongs in this step or another. That is the orchestrator's ordering against step 7, which writes `plan-orchestration/SKILL.md` whole.

Agent usage: ad359a1df2ce3b5fe, claude-opus-5-5 (ordo-high), 186342 tokens, 49 tool uses, 503 s.
