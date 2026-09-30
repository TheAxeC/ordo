# Step 12 brief check (on main at 6119d03)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/12.md` (uncommitted; `git status --short` at the start showed `?? .scratch/2-e-grill/agents/briefs/12.md`). A page this report cites is named with its section. A line of code or a grep hit keeps its `file:line`.

## 1. Names

- `/grill`: `git grep --untracked -n "/grill" -- . ':!.scratch'` printed one line, `skills/plan/SKILL.md:63: - `/grill <entry>` settles such decisions before the plan opens. ...`. The change leaves it true.
- `grill` as a word: `git grep --untracked -n -w "grill" -- . ':!.scratch'` printed, outside the brief's paths:
  - `docs/roadmap.md:21,24,25,101,103,179,180`: the entry 2.E heading, goal and gate, entry 10's goal and wait, and entry 20's gate ("written into its roadmap entry through `grill`"). The change leaves them true. Entry 20's gate supports the brief's Decision 3.
  - `skills/plan/templates/plan.yaml:23,24,25` and `skills/plan/templates/orchestrator-state.md:23,24`: the key comments. Line 24 of `plan.yaml` defines the bars as "industry (what production projects in the field ship), state-of-the-art (the best published work), novel (beyond both, with what would show it works)" and says "their reference line", which makes the reference line belong to the options. Line 25 says "grill cites them per option". The brief's item 1 "The design bar" says `novel` cites "the practice the option departs from and why the departure is sound", and that `design_references` are cited "in the reference line wherever one applies", with one reference line per question. After the change the skill and the template comment disagree on what `novel` cites and on whether the reference is per option or per question (change standard rule 19).
  - `skills/ordo-init/templates/check_config.py:115` and `check_config.test.sh:163`: "note: adr folder docs/adr does not exist yet; repo-setup or grill creates it". The brief's ADR write ("from its `template.md` (or the form of its latest record when it has none)") never has `grill` create the folder, so the note becomes false for `grill`.
- The skill list and the sequence:
  - `README.md:7`: "Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, and `plan-retro` turns what the reviewers keep finding into rules." This is the introduction's list of the skills around the loop. After the change it is incomplete: it omits `grill`. It is not in the paths.
  - `skills/repo-setup/templates/docs/glossary.md:3`: "The terms the plan skills, `roadmap`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below". Item 3 puts `grill`'s terms into that block, so the sentence becomes false for every repository `repo-setup` creates after the change. It is not in the paths.
  - `.agents/plan.yaml:1` (a comment listing the skills that read the file) and `skills/ordo-init/SKILL.md:10` (the plan skills). Both lists name only the plan skills (the glossary's "plan skills"), and `roadmap`, which also reads the file, is already absent from them. The change leaves them true.
  - `skills/ordo-help/SKILL.md:24`, `skills/ordo-init/SKILL.md:23-24`, `skills/repo-setup/SKILL.md:24`, `skills/plan-orchestration/SKILL.md:25` and `skills/spec/SKILL.md:23` are Use instead rows naming `/roadmap add` or `/plan` (`git grep -n -E "roadmap add"` and the Use-instead grep). The change leaves them true.
- The new terms, from `for t in "decision form" "design bar" "design tree" "frontier" "lazy option" "reference line" "round"; do git grep --untracked -n -i -w "$t" -- . ':!.scratch'; done`:
  - "decision form", "design bar", "design tree" and "frontier": no hit.
  - "reference line": `skills/plan/templates/plan.yaml:24` only, discussed above.
  - "lazy option": `docs/glossary.md:14` (the third sense of **booking**, "the lazy option", Stated in `repo-setup`, `templates/shared-rules.md`) and `skills/repo-setup/templates/shared-rules.md:11`, which defines it ("The lazy option costs less now and leaves the work undone: ..."). A new **lazy option** entry that does not cite shared-rules, or that states a different definition, leaves two definitions.
  - "round": 40 or more hits, among them the glossary's **repair round** ("The number of rounds a step gets is the round cap"), **delta**, **dispatch entry** (`round`), `plan-orchestration`'s "The end of the rounds" and "the round cap", and `refute`'s "Over a repair round". Ordo already uses the bare word "round" for a repair round. A glossary term **round** defined as an interview round collides with it.
- Glossary senses the skill changes but item 3 does not list:
  - **ruling** (`docs/glossary.md:77`) is "the user's decision on an open item, typed as `Ruled: <the choice>` ..."; a settled grill answer is a new sense of the word.
  - **rulings file** (`docs/glossary.md:78`) says "Stated in: `plan`, ..." only, although `grill` becomes its writer.
  - **question, the** (`docs/glossary.md:63`) is "could this pass without the goal being reached?". The skill uses "question" throughout for a decision put to the user, and "the question" collides with this term.

Findings:
1. `skills/repo-setup/templates/docs/glossary.md:3` becomes false once `grill`'s terms enter the plan-terms block. Add `skills/repo-setup/templates/docs/glossary.md lines 3-3` to the paths, with an item naming `grill` in that sentence.
2. `README.md:7` becomes incomplete. Add `README.md lines 7-7` to the paths, with an item naming `grill` in the introduction. Change standard rule 14 asks for the change to be carried to every hit, and the lazy-option rule forbids leaving a known hit as a note in the report.
3. `check_config.py:115`'s note says `grill` creates the ADR folder, and the brief does not have it do so. Add to the ADR bullet of item 1: with no folder at `adr`, `grill` creates it from the `repo-setup` skill's `templates/docs/adr/README.md` and `template.md` before it writes the first record. Otherwise, change the note, which needs `check_config.py` and its test in the paths.
4. `skills/plan/templates/plan.yaml:24-25` disagrees with item 1 on what `novel` cites and on whether the reference is per option or per question. Either write item 1 to the comment's definitions ("beyond both, with what would show it works"; the references cited per option), or add the two comment lines and `skills/plan/templates/orchestrator-state.md:24` to the paths with the new text.
5. Item 3's term list:
   - **round** needs a qualified name ("round, of an interview", as the glossary has "verdict, of a blind comparison").
   - **lazy option** must restate shared-rules' definition and cite `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option", beside `grill`.
   - **ruling** gains the sense "a settled grill answer, one Rulings or rulings-file bullet", Stated in `grill`.
   - **rulings file** gains `grill` in its "Stated in".
   - The brief names how the skill avoids "the question" (for example "a decision's question", or a glossary sense "question, of a round").
   - The brief states that "decision" (a node of the design tree) and "question" (the decision form a round asks it in) are two terms, so the skill does not cycle between them (prose standard D, "No synonym cycling").

## 2. The step line

`grep -n "^- 12 " .scratch/2-e-grill/plan.md` printed line 44, which the brief quotes exactly.

- The rounds and the Dn decision form (ruling G): item 1 "A round", "The decision form" and "Answers", and item 2.
- `libraries` (G1): item 1 "What is offered".
- `design_bar` (G2): item 1 "The design bar" and the `--bar` invocation.
- The rules, standards pages and ADRs (G3): item 1 "What it reads" and "What is offered".
- `design_references` (G4): item 1 "The design bar".
- The sentence of step 7: item 1 "What is offered" ("which the skill states"). The item does not say whether the skill quotes the sentence verbatim.
- Rulings written as they settle (ruling B): item 1 "Written as each settles", the ruling bullet.
- The glossary: item 1, the glossary bullet, and item 3.
- The PROPOSED ADR on Axel's yes: item 1, the ADR bullet.
- Its place in `ordo-help`'s sequence between `/roadmap add` and `/plan` (ruling F): item 4.
- The check, Axel's reading against `docs/dev/skill-layout.md`: the Cases readings, and the statement that the step lands unticked.

Findings:
1. Every part has an item. One detail is open: "the sentence of step 7" should be required verbatim ("A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it."), so that the reading can check it against `skills/spec/templates/brief.md:5`.

## 3. Premises

- Step 12's line and the Goal: line 44, and "## Goal" read whole. Both quotes match.
- Rulings A, B, E (b), F (a), G, G1, G2, G3 and O1 (a), G4 (a), "Step 11, which ADRs bind" and "Step 11, who writes a superseding ADR": read in "## Rulings". The brief's summaries match. B's path `.scratch/rulings/<entry slug>.md` is `<ledger_root>/rulings/<slug>.md` as step 11 generalised it (`skills/plan/SKILL.md:39`), which is the same file under this configuration. No requirement of the brief contradicts these rulings. The ruling "Step 11, who writes a superseding ADR" rejected option (b), "`/grill` writes it", only for the ADR that answers a rule clash raised by `/spec`. `grill` writing a superseding record for an ADR reopened inside its own interview is a different trigger, so the ruling is not contradicted.
- The game-engine decision form. `grep -c "Industry:"` on the transcript printed 16. `grep -o` found `## D1. What a save IS - the fork everything else hangs off`, `**Industry:** ...` paragraphs, `**Recommend C.** ...`, `**Recommend B**, with one hard rule: ...` and `- **A. Whole-group bytes** ... *Pro:* ... *Con:* ...`, and also `- **A. Header + payload in one file**, header fixed-size and parseable alone.` with no Pro or Con. `PROPOSED** - the decision set below is the maintainer's to ratify` and `PROPOSED.** The save format, ...` are present. A Python scan of every user message for `D\d+\s*(=>|Agree)` found one message: "D1 Agree\nD2 Agree\n...\nD9 Agree\nD10-12 Agree\nD13 Agree\nD14 Agree\nD15 Agree ...". A scan of the whole file for `D<n> => ...` in any spelling printed nothing.
- mattpocock's skills. `git log --oneline -1` printed `d81f3a1 Merge pull request #1120 ...`, and `wc -l skills/productivity/grilling/SKILL.md` printed 28. The text supports every clause the brief gives for `grilling` and `domain-modeling` (rounds, the frontier, numbering with a recommendation, a dependent question waiting, facts from sub-agents with only downstream questions waiting, the end on an empty frontier and the user's confirmation; the glossary written inline, challenge, sharpen, scenarios, cross-reference with the code). `domain-modeling` also says "If no `docs/adr/` exists, create it when the first ADR is needed", which bears on finding 3 of Names.
- The configuration keys. `cat -n skills/plan/templates/plan.yaml` printed `roadmap` 5, `rules` 7, `ledger_root` 8, `libraries` 13, `standards` 14, `adr` 23, `design_bar` 24 and `design_references` 25, with the defaults the brief states. These match.
- The sentence of step 7. `sed -n 5p skills/spec/templates/brief.md` and `head -5 .../design-principles.md` show the sentence at both places. This matches.
- The step 11 readers:
  - `skills/plan/SKILL.md` "What it reads" 4 and Steps 2 (the bullet lines copied) match the brief.
  - `spec` "What it reads" 5 (ADRs in force) and "Steps / A ruling" (the superseding record) match the brief.
  - `spec` "What it reads" 4 reads a tag as "a line of the Rulings section that ends with "(the user)"", with no full stop. The brief writes "only a line ending "(the user)." counts". `spec` "Steps / A ruling" writes the line with the full stop, so the brief's form works, but its quote of "What it reads" 4 is inexact.
- `spec` Steps 3 lists the library facts: version, license, maintainer, last release, compatibility, what it would replace and what stays hand-written. This matches item 1 "What is offered".
- `plan` Steps 1 derives the slug (`38.3 One object per file` gives `38-3-one-object-per-file`). This matches.
- `ordo-init` "What it reads" 3: "The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11." See finding 3.
- The roadmap skill's format section is "The format is the file's". It exists, and its modes are show, add, move, done and drop, so "`/roadmap` has no mode that edits an entry's goal" holds.
- No `skills/grill/`: `ls skills/grill` printed "No such file or directory", rc=1. This matches.
- The six places: `README.md:15` is the `roadmap` row, `:30` is `/roadmap add <entry>`, and `:84` is the install loop. `skills/ordo-help/SKILL.md:51` is `/roadmap add <entry>`. `skills/plan/SKILL.md:24` is "The roadmap has no entry for the work yet", and `skills/roadmap/SKILL.md:28` is "An entry is ready to be opened as a plan". A Python count of the padding printed 30 for the brief's `/grill <entry>` line and 30 for each neighbour. These match.
- The carried items. The state file's "Current position" holds both. This matches.
- ADRs. `ls -la docs/adr` printed `README.md` and `template.md` only. This matches.
- The state file's open items and the other plans: sed of the dispatch blocks of `.scratch/2-f-diagnose`, `2-g-git-guard` and `2-h-session-retro` printed `dispatch: none` for each, so no step is in flight.

Findings:
1. "the user answered "D1 Agree", "D3 => B"": no `D<n> => ...` answer is in transcript c97467d0. Its only D-form answers are "D<n> Agree" lines and one range, "D10-12 Agree". Correct the premise: the `=>` form comes from ruling G ("answers as "Dn => ..."") and from the user's `<quoted text> => Agree` answers in that session, not from a "D3 => B". Item 1 "Answers" should accept a range (`D10-12 Agree`), as the user wrote one.
2. "options `- **A. <name>.** *Pro:* ... *Con:* ...`": some options in the transcript carry no Pro and Con. This does not change the brief, since ruling G asks for pros and cons, but the premise should say "most options".
3. Decision 5 and the end ("as `ordo-init` "What it reads" 3 reads the rule"): that reader takes the rule from `repo-setup`'s question 5 or from `ordo-init`'s own approval stop, and neither exists when `/grill` runs later. The glossary's **commit rule** has the same two sources. The brief should say how `grill` learns the rule. The recommendation is to ask it with the end's confirmation, as `ordo-init` run alone asks it at its approval stop, and to commit only on that answer; otherwise list the files.
4. "`spec` "What it reads" 4 ... only a line ending "(the user)." counts" quotes the rule with a full stop the rule does not have. Quote it as "ends with "(the user)"".
5. The brief omits an open item of the state file that bears on step 12's order and paths. "Approval stops under a ruling", option (a): "Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", run before step 12, and its text in those four skills" (`plan`, `roadmap`, `ordo-init`, `repo-setup`). The item is open, and its option (a) would put a step before 12 that edits `skills/plan/SKILL.md` and `skills/roadmap/SKILL.md`, which step 12 also writes. It would also change how a skill's approval stop treats a ruled diff, which bears on `grill`'s roadmap diff (Decision 3). The brief should name the item under "What is on the tree" and say why step 12 goes ahead of the ruling. Otherwise the orchestrator waits for the ruling or decides it under "Overnight work" 5, booked with its options.

## 4. Cases and checks

- `ls skills/grill/SKILL.md skills/grill/references/decision-form.md`: consistent with the rules file.
- The description length command: consistent with skill-layout "Frontmatter".
- `git grep --untracked -n "/grill" -- skills README.md docs`: consistent. It does not reach the skills-table row or the install loop, which hold `grill` without a slash.
- `sync_rules.py . --only glossary` printing ok: consistent. Run now, it printed `ok: the plan-terms block equals the template`, rc=0.
- Reading, the skill against skill-layout: consistent.
- Reading, the skill against item 1: consistent.
- Reading, the dry run on entry 3 to the first round: consistent with change standard rule 1 (a text step is judged by reading).
- Reading, the terms against the glossary: consistent with skill-layout "Writing for an agent".
- Verify 1 to 4: consistent with "Commands and their filters" and rule 13 (no test).

Findings:
1. "Paths this step writes" ends with "A place the premise list missed that names the sequence or the skill list is named in the report, not changed". This leaves known hits to the report, where change standard rule 14 carries a change "to every hit or say why not" and the lazy-option rule forbids handing back work that can be done now. For the two hits of Names findings 1 and 2, the brief should add them to the paths. The sentence can stay for hits nobody has found yet.
2. No case covers the README's table row and install loop. Add `git grep -n -w grill -- README.md` with the expected hits: the table row after the `roadmap` row, the sequence line, and the loop's `grill land ordo-help ...`.

## 5. The question

"The goal" is the part of the plan's Goal this step delivers: the interview in rounds, each round asking every question whose prerequisites are settled, each with options, pros and cons, one recommendation and the lazy option named; facts looked up by agents; each answer written as it settles into the roadmap entry, the Rulings and `docs/glossary.md`.

- The step line's check, Axel's reading against `docs/dev/skill-layout.md`: yes, it could pass without the goal. Skill-layout judges the sections, the rules per bullet and the completion criteria, not whether the interview asks the frontier, looks facts up or writes each answer the turn it settles. The plan's own answer in "## Gate" ("No, Axel reads the skill against skill-layout") leans on the reading's scope. The brief closes most of this through the reading against item 1 and the dry run.
- The case `ls` of both files: yes, it could pass without the goal, since it shows existence only. Other cases carry the content.
- The case description length: yes, it could pass without the goal, since it is a limit only.
- The case `git grep "/grill"`: yes for the goal, but it checks placement (ruling F), which is its purpose.
- The case sync ok: yes, it could pass without the goal. It passes on the unchanged tree and with no new term added; the term reading carries the content.
- The case reading against skill-layout: yes, for the reason given for the step line's check.
- The case reading against item 1: no. Each requirement of item 1 is quoted from its place in the skill.
- The case dry run to the first round: partly. It exercises the reading, the design tree, the frontier, the decision form and the reference line's sources. It stops before any answer, so the half of the goal that writes each answer as it settles (the Rulings bullet, the roadmap diff, the glossary line, "record as ADR?" and the record) is never run on a real entry. Item 2's worked example runs it only on a neutral one.
- The case reading of the terms: no.
- Item 1's check, the reading against item 1: no.
- Item 2's check (no dedicated case beyond `ls` and the reading): yes, it could pass without the goal. Nothing reads the example against item 1's form: the heading, lettered options with pros and cons, the reference line with a source read in the session, "Recommend <letter>", the lazy option, and the lines written.
- Item 3's check, the sync ok plus the term reading: no, together.
- Item 4's check, the grep: no, for the placement it delivers.

Findings:
1. Extend the dry-run case one round further. With answers the builder states are hypothetical (the recommendation taken for each), it writes out, without writing them to disk, the Rulings or rulings-file bullets, any glossary line and any "record as ADR?" question the skill's text would produce, and says where the text left a choice open. The write half of the goal is then exercised on a real entry.
2. Add a reading case for item 2: `references/decision-form.md` read against item 1's decision form and write rules, part by part, each quoted.

## 6. Implied inputs

This is a text step (a skill file), so `templates/brief.md`'s code-step list does not apply. The skill's text defines behaviour an agent follows, and the inputs below have no stated handling in item 1.

Findings:
1. `--bar` with a value other than `industry`, `state-of-the-art` or `novel`, and a `design_bar` in the file with such a value: no refusal is listed. Add a refusal naming the three values, as `check_config.py`'s message "design_bar is not industry, state-of-the-art or novel: <value>" does.
2. An interview resumed after a break (a new session, or a compaction): questions shown in a round but not answered are written nowhere. Item 1 numbers `D<n>` "after the highest `D<n>` already in the entry's Rulings or rulings file", so a resumed interview reuses a number the user may already have answered in the transcript. The brief should state the resume. The recommendation: the frontier is recomputed from what is written; an unanswered question is asked again under a new number; the numbering counts only the `D<n>` that opens a bullet, since 2.F's Rulings already hold "D1 (a)" inside a "Step list" line.
3. No `docs/glossary.md`, or a glossary without the plan-terms block (a repository `repo-setup` did not set up): "below the plan-terms block" is then undefined. State that a missing file is created from the `repo-setup` skill's `templates/docs/glossary.md`, or refused naming `/repo-setup sync`, and that without a block the terms go after the opening paragraph.
4. A term the interview settles that the plan-terms block already defines: writing it inside the block is undone by the next sync. State that it is put to the user as a clash and never written into the block, and that a change to a plan term goes to Ordo's `plan-terms.md`.
5. No ADR folder: see Names finding 3. The same applies to a folder with neither `template.md` nor a record, whose form then comes from the `repo-setup` skill's `templates/docs/adr/template.md`.
6. An answer that contradicts an earlier ruling or an ADR in force: item 1 says a settled decision "is not asked again" but not what happens when the user's answer contradicts one. State that it is shown as a rule clash in the next round: reopen the earlier ruling, by a new bullet that names the one it replaces, or the ADR as ruling E (b) says, with the old record marked in the folder's words (`superseded by NNNN`) and its index row, as `spec` "Steps / A ruling" writes it.
7. An entry under "Not yet specified" whose gate the interview settles: the diff would move the entry into the open order, which is `/roadmap add <entry>`'s job (the gate asked "could this pass without the goal being reached?", its waits and its place). State that such a diff goes through that question and placement, or that the end names `/roadmap add <entry>`.
8. Any roadmap diff: item 1 names only the roadmap's format section. The `roadmap` skill's Rules also bind entry text: nothing added the user did not ask for, the goal, gate and dependencies only, no history, another repository only as a path. Its "Steps / add" 3 asks the question of a changed gate. The roadmap bullet should require both.
9. An entry whose plan is open, where an answer changes the text of an approved step: nothing says the step's text follows. State that the Rulings bullet is written and the step's change goes to the user as `spec` "Steps / A ruling" handles a ruling, or is listed at the end.
10. "record as ADR?" and roadmap-diff questions left when the frontier is otherwise empty: "The end: the frontier is empty" must count them as frontier questions, so the end waits for them.
11. The agent that looks facts up: item 1 says "an agent the skill starts (read-only)" and names no agent type, effort or served-model check. `refute` and `spec` launch through `ordo-<reviewer_effort>` with a model check. Name the agent `grill` starts, and whether the model check applies.

## 7. ADRs

- `ls -la docs/adr` printed `README.md` and `template.md` only: no `NNNN-*.md` record.

Findings: none.

## Decisions taken in the brief

Checked against the glossary's **user-visible choice** ("a public shape, a wire format, a config key or a vocabulary", `spec` Steps 4 and "Stops") and ruling "Overnight work (2026-09-30)" 5: "a decision that is normally Axel's inside a step is taken by the orchestrator as the option it recommends and booked here, marked "decided by the orchestrator overnight", with its options and the lazy option, for Axel to overturn".

Findings:
1. Decision 1 (the reference line's labels "Industry:", "State of the art:", "Novel:") is a vocabulary the user reads in every round.
2. Decision 2 (the Rulings bullet `- D<n> <phrase> (<date>): <answer> (the user).`) is a format `/plan` copies and `/spec` parses, a wire format between skills.
3. Decision 3 (a roadmap change written by `grill` rather than by `/roadmap`) changes which skill writes the roadmap.
4. Item 3's new terms (**design tree**, **frontier**, **decision form**, **design bar**, **reference line**, **round**) are a vocabulary. Rulings G and G2 give the source of "decision form", "reference line" and `design_bar`, and no ruling settles "design tree", "frontier" or the qualified "round".

None of these is booked in plan.md's Rulings (a sed of "## Rulings" shows no step 12 entry). Each is either booked there under "Overnight work" 5, with its options and the lazy option, or raised as an open item before dispatch. Decisions 4 and 5 follow existing text: Decision 4 follows `docs/glossary.md`'s introduction and README "Configuring a repository". Decision 5 is affected by Premises finding 3.

## Declined to judge

- Whether step 12 should wait for Axel's ruling on "Approval stops under a ruling". That is the orchestrator's and Axel's call; the finding under Premises says only that the brief omits it.
- Whether `grill` should count among the "plan skills" of the glossary and `ordo-init`'s introduction. That is a vocabulary choice for the user.
- Whether the ADR in transcript c97467d0 was written "in the same turn" as the answers. I confirmed that PROPOSED records are present, but I did not trace turn order in the 146 MB transcript.
- Whether the brief should require `domain-modeling`'s "sharpen fuzzy terms", "concrete scenarios" and "cross-reference with the code", which the premise describes but item 1 does not ask for. Step 14's blind comparison against `grill-with-docs` may turn on them, and that is a scope choice.

Agent usage: claude-opus-5-5 (served model, read from the agent's transcript right after the start); 192474 tokens, 54 tool uses, 480 s (completion notice); cost $2.21-5.80 at Opus rates.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names 1 and 2: `README.md` lines 7-7 and `skills/repo-setup/templates/docs/glossary.md` lines 3-3 added to the paths, with two bullets under item 4 naming `grill` there, and the README grep case added.
- Names 3: item 1's ADR bullet creates a missing ADR folder, or fills one with neither template nor record, from the `repo-setup` skill's `templates/docs/adr/README.md` and `template.md`; the premise quotes `check_config.py:115`.
- Names 4: item 1's design bar bullet now uses `plan.yaml:24`'s definitions ("novel" goes beyond both, with what would show it works), and each option names the clause of each design reference that bears on it; the premise quotes lines 24 and 25. The template comments stay true.
- Names 5: item 3 now has **round, of an interview**; **lazy option** restating `shared-rules.md:11` with its Stated in; **ruling** gains the `grill` sense; **rulings file** gains `grill`. A new "Words" bullet of item 1 makes "decision" the one term and bars "question" as a term; the premise lists the glossary terms touched.
- The step line 1: item 1 requires the sentence of step 7 verbatim, quoted.
- Premises 1 and 2: the game-engine premise now says "most options", gives the "D<n> Agree" lines and the range "D10-12 Agree", and says the `=>` form is ruling G's; item 1's Answers accept a range.
- Premises 3: the end asks the commit question with the confirmation, as `ordo-init` run alone does; Decision 6 says why.
- Premises 4: the quote of `spec` "What it reads" 4 is now "ends with "(the user)"".
- Premises 5: the premise names the open item "Approval stops under a ruling" and why step 12 goes ahead; the open item's option (a) in the state file now says 9a runs after step 12 and covers `grill`'s roadmap-diff decision.
- Cases and checks 1: the paths sentence now leaves to the report only places nobody has found yet; the two known hits are in the paths.
- Cases and checks 2: the case `git grep -n -w grill -- README.md` added.
- The question 1: the dry-run case goes one round further, with hypothetical answers taking each recommendation and the written lines shown in the report only.
- The question 2: a reading case for `references/decision-form.md` against item 1 added.
- The step line's check, which could pass without the goal: carried by the reading of the skill against each requirement of item 1 and the extended dry run, both cases of this brief.
- Implied inputs 1: a `design_bar` or `--bar` value outside the three is a refusal naming them.
- Implied inputs 2: a "Resuming" bullet; numbering counts only a `D<n>` that opens a bullet, with the 2.F premise.
- Implied inputs 3: a missing glossary is created from the `repo-setup` template at the first term; without a block the terms go after the opening paragraph.
- Implied inputs 4: a plan term is never written into the block; a clash with one is a decision whose change is made in Ordo's `plan-terms.md`.
- Implied inputs 5: as Names 3.
- Implied inputs 6: an "An answer that contradicts" bullet (reopen the ruling by a new bullet, or the ADR by a superseding record as ruling E (b) and `spec` "Steps / A ruling" say, or keep the earlier one).
- Implied inputs 7: an entry under "Not yet specified" is not moved by `grill`; the end names `/roadmap add <entry>`.
- Implied inputs 8: the roadmap bullet requires the `roadmap` skill's format section, its Rules and its "Steps / add" 3 question for a changed gate.
- Implied inputs 9: an "A plan already open" bullet: the Rulings bullet is written and the step change is listed at the end for the user's ruling.
- Implied inputs 10: the frontier includes the roadmap-diff and "record as ADR?" decisions, and the end waits for them.
- Implied inputs 11: the lookup agent is launched as the brief-check agent is, `ordo-<reviewer_effort>` on the `reviewer` model with the served-model check, a new Stops entry; `reviewer` and `reviewer_effort` added to the reads.
- Decisions 1 to 4: booked in plan.md's Rulings as "Step 12, the reference line's label", "Step 12, the Rulings bullet", "Step 12, who writes the roadmap entry" and "Step 12, the interview's terms", each decided by the orchestrator overnight under "Overnight work" 5 with its options and the lazy option named; the brief's decisions name them.
- Declined to judge, `domain-modeling`'s sharpening, scenarios and cross-reference: added to item 1 as a "Terms and claims" bullet, since they are part of the glossary half of the plan's Goal.
