# Step 9a brief check (on main at 6adcd8e)

`git rev-parse --short HEAD` at the start: `6adcd8e`. At the end: `aca844c` (one commit by another session, "Book three rulings of plans 2.G and 2.H"; `git diff --name-only 6adcd8e HEAD -- skills docs README.md utils` prints nothing, so no file this brief reads or writes moved). `git status --short` at the end: `?? .scratch/2-e-grill/agents/briefs/9a.md`. I changed no file in the repository. The scratch folder `$TMPDIR/ordo-9a-briefcheck` (a copy of `skills/`, `docs/`, `utils/`, `README.md` with every item of the brief applied by a script) is removed (`ls` prints "No such file or directory"). I did not read `.agents/worktrees/`.

## 1. Names

Commands: `git grep -n -i 'approv' -- skills docs utils README.md`, `git grep -n -i 'every run' -- README.md docs skills utils`, `git grep -n -i 'stops of their own\|second stop' -- skills docs README.md utils`, `git grep -n -c 'quoted ruling' -- skills docs/glossary.md` (exit 1, no hit on main: the term is new).

1. Outside the paths, made false. `README.md:54`: "A stop marked "every run" waits on you each time". `docs/figures/gen_figures.py:381`: `(EVERY_RUN, "it waits on you each time it runs")`, with the marks at `:423` ("The questions", "The draft"), `:433` ("The draft", "Worker, reviewer and libraries"), `:460` ("The change"), `:482` ("The drafted step list"). `docs/glossary.md:133` (Ordo's own terms, outside the plan-terms block): ""every run", a stop that waits on the user each time the skill runs". After the change these five stops are skipped in a run under a quoted ruling, so "each time" is false. The brief's premise bullet lists only `gen_figures.py:481` and says "Each stays true"; its R9 greps (`approv`, `stops of their own\|second stop`) do not match these lines. Failure: a reader of the README figure expects `/roadmap add` to wait every run and is surprised by a commit with no stop; the builder's R9 passes without seeing the lines. Closing it needs `README.md`, `docs/figures/gen_figures.py`, the two SVGs and the own-terms line of `docs/glossary.md` in "Paths this step writes", or a Decision that says why they stay.
2. Outside the items, states the rule differently. `skills/repo-setup/templates/plan-terms.md:91` (**ruling**): "A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)"", and `skills/spec/SKILL.md` "Steps / A ruling" 2: "the open item is closed with the ruling's text and its date" and "a ruling that adds or splits a step is also written in the Rulings section". The new term says a quoted ruling "is the ruling's line in that file's Rulings section". A ruling that adds no step and sets no shape has no such line. See 5.1.
3. Inside the paths, not reached. `skills/plan-orchestration/SKILL.md:332`: "Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, and `/roadmap` at the closing)". Item 2's new sub-bullets have "the session that runs that skill after the ruling" run `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`. The enumeration under "Every" no longer lists what the session invokes (rule 14, "an 'every'"). Failure: after a compaction the orchestrator carries `/roadmap add` out from remembered text, since the rule that forbids that names `/roadmap` only "at the closing".
4. Inside the paths, not reached. `skills/ordo-init/SKILL.md:46` "Several candidates are a stop ("Stops")" and the Stops row `:104` "Several roadmaps | More than one roadmap candidate". Item 6 puts "A key whose value a quoted ruling states is not asked" under Steps 6 only. A ruling that states `roadmap: docs/roadmap.md` on a repository that also holds `TODO.md` still stops at Steps 2.
5. Inside the paths, not reached. `skills/grill/SKILL.md:247`: "A decision is the user's: nothing is written as settled without the user's answer." `:163`: "Write the ruling for every settled answer, the roadmap diff ... included". `:226`: "A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it". Item 8 adds no Rules line (items 6 and 7 add "A quoted ruling ... is that approval" to `ordo-init` and `repo-setup`). Failure: a session reads Rules line 247 against the new sub-bullet "written at once" and either stops (a second stop) or writes against a rule of its own skill.
6. Inside the paths, approval sentences the premise bullet does not list, each read: `roadmap:10`, `:16`, `:17`; `plan:3` (description), `:15`, `:95` (anti-pattern "Writing `plan.md` before the user has approved the step list"); `ordo-init:10`, `:15`, `:81`, `:96`; `repo-setup:10`, `:59`, `:64`, `:95`, `:104`; `plan-terms.md:106` (**sync**, "rewrites them after approval"). Each stays true only under the reading "a ruling is the user's approval". Decision 7 gives that reading for `README.md`, `ordo-help`, the figures and three descriptions, and names none of these.
7. `utils/`: no hit for `approv` or `quoted` (`grep -rn -i 'approv\|quoted' utils` prints nothing).

## 2. The step line

Ruling, clause by clause:

- "`plan-orchestration` quotes the ruling when it runs a skill": item 2, third sub-bullet (built as naming the ruling and its ledger file; Decisions 1 and 2).
- "`plan`, `roadmap`, `ordo-init` and `repo-setup` read the quoted ruling and ... skip the stop only when the draft is the change the ruling states": items 4 (roadmap "What it reads" 6, Steps 4), 5 (plan "What it reads" 6, Steps 3), 6 (ordo-init "What it reads" 5, Steps 11), 7 (repo-setup "What it reads" 6, Steps 4). For `repo-setup` the test is "answers every question", not a comparison with a stated change (Decision 5).
- "the question stops of `repo-setup` and `ordo-init`": item 7 Steps 2 and its Stops cell; item 6 Steps 6 and its Stops cell. `ordo-init`'s "Several roadmaps" has no item (1.4).
- "`/ordo-init` inside `/repo-setup` takes the same ruling": item 7, Steps 8 sub-bullet. It passes the ruling on; whether the stop is then skipped is 5.17.
- "`sync`'s hunks are covered": item 7, "sync" 3 and the Stops cell "A hunk to rule on".
- "the ruling is named in the commit, or ... in the list of files written": roadmap Steps 5, plan Steps 6, ordo-init Steps 14 and the "No commit allowed" cell, repo-setup Steps 12, "sync" 9 and its "No commit allowed" cell. No item for `grill` (5.22) and none for a fix made in `ordo-init`'s check of an existing file (5.15).
- "`ordo-init`'s Rules 5 gains the exception": item 6, Rules 5.
- "`/plan` still stops when a gate or a step's check could pass without the goal": item 5, Steps 3, second sub-bullet ("every answer in "## Gate" is no").
- "`grill`'s roadmap-diff decision is among the stops covered": item 8.

Step line: the six skills each have an item. "check: each changed text read in place": R1 to R10. "a scratch run ... that writes the ruled change with no second stop": S1. "and stops on a draft that differs": no scratch run (finding 1).

Findings:

1. The step line's check "stops on a draft that differs" has no scratch run. S2 is a gate that could pass without the goal and S3 is a ruling name the file does not hold; in neither does the draft differ from the ruled change. R3 covers it by reading only. A run is needed in which the option states one thing and the skill's own rules draft another (for example an option that places the entry before an entry it waits on, so Steps / add 5 drafts another place).
2. Added beyond the ruling and the step line, not listed under "Decisions":
   - Item 3 (`spec`, "Steps / A stop"): needed, since the sentence it replaces is the same as `plan-orchestration:302`.
   - Item 1's change to **commit rule**.
   - Item 5's conditions "no design decision is named as unsettled" and "no line of the rulings file is left to place": two more reasons for `/plan` to stop than the ruling names.
   - Item 4's condition for `add`, "only when the gate's answer of Steps / add 3 is no": the ruling names `/plan` for this, not `/roadmap`.
   - Item 6's "Checking an existing file" 4 sub-bullet and the "A fix in the check" cell.
   - Item 7's "sync" 6 sub-bullet and the "The drafted sync change" cell (the exit-2 draft; the ruling says "hunks").
   - The Rules sub-bullets of items 6 and 7 ("is that approval").
   - The rule "A name the file's Rulings section does not hold is no ruling" in five skills.
   Listed under "Decisions": the term and the naming form (1), the ledger as the source (2), `(approved)` and the copied ruling line (3), part by part (4), `repo-setup`'s draft (5), `done` (6), the places left unchanged (7), the versions (8).

## 3. Premises

Commands rerun: `grep -n 'An approval of work not yet done' skills/plan-orchestration/SKILL.md skills/spec/SKILL.md` (302 and 198), `sed -n '197,198p' skills/spec/SKILL.md`, `cat -n skills/roadmap/SKILL.md | sed -n '32,50p;126,131p'`, `git grep -n -i 'approv' -- README.md skills/ordo-help docs/figures/gen_figures.py`, `ls docs/adr` (`README.md`, `template.md`), `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` (`ok: the plan-terms block equals the template`, exit 0), `grep -F -c` of the quoted ruling text on `.scratch/2-e-grill/plan.md` (1), and `cat -n` of each of the seven skills and of `plan-terms.md`. Every line number, count and quoted sentence of "What is on the tree" for the seven skills and `plan-terms.md` matches (plan-orchestration 290, 301, 302; spec 197, 198; roadmap 40, 49, 50, 130; plan 41, 61 to 66, 65, 76 to 78, 84; ordo-init 31, 32, 60 to 64, 79, 80, 85 to 87, 95, 103, 105, 107, 108, 119, 124; repo-setup 34, 40, 58, 64 to 67, 83 to 88, 94 to 96, 104, 109, 158 to 161, 163, 181; grill 53, 177 to 182; plan-terms 20, 74, 75). The indentation of lines 300 to 302 of `plan-orchestration` is 2 spaces and of lines 197 and 198 of `spec` is 5, as the code blocks of items 2 and 3 give once their fence indent is taken off.

1. "read on main at 6adcd8e": main is now at `aca844c`; nothing the brief reads moved (see the top).
2. The `git grep ... approv` command prints nine lines; the brief lists seven. Not listed: `README.md:18` ("checks that the user approved the step"), `README.md:24`, `skills/ordo-help/SKILL.md:77`. None is about an approval stop.
3. "Each stays true, since a ruling is the user's approval": holds for the lines listed, and leaves out the "every run" sentences of finding 1.1, which the command does not print.

## 4. Cases and checks

Simulation: the scratch copy with items 1 to 8 applied and `sync_rules.py . --only glossary --write` run (`written: the plan-terms block now equals the template`, exit 0).

1. R1 and Verify 3: "`python3 skills/repo-setup/templates/sync_rules.py .` exits 0". On main it prints `error: no CLAUDE.md in /Users/axelfaes/workspace/ordo` and exits 2 (`ls CLAUDE.md`: no such file; `git ls-files CLAUDE.md`: 0 lines). It exits 2 before and after the change, so the check cannot hold. The command that holds is `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` (exit 0 on main and on the scratch copy).
2. Verify 2: "The three lines of the "What it reads" item print 1 in each of the five skills." On the scratch copy, the first line as item 4 gives it (`6. The quoted ruling, when ...`) prints 1 in `roadmap`, `plan` and `repo-setup` and 0 in `ordo-init` (numeral 5) and `grill` (numeral 11). The two sub-bullet lines print 1 in all five only when the pattern carries no leading spaces, since `grill`'s need four (8.4). Wording that holds: the pattern is the line's text after its numeral or bullet marker. With that, every dictated line and cell printed 1 in its file on the scratch copy (the first sub-bullet of items 2 and 3 prints 1 in each of `plan-orchestration` and `spec`).
3. The scratch runs have the builder run `git init`, `git add` and `git commit` on the scratch repository. The rules file, "Where the work happens": "No git command that changes state: no `add`, `commit`, ...", and `plan-orchestration` Steps 4: "**The builder.** It never runs a git command." The rules file's opening: "nothing in a brief overrides anything here". The brief limits the commands to the scratch repository but does not say under which sentence of the rules file they are allowed. A builder that follows the rules file stops there; one that follows the brief breaks the sentence as written. This is the orchestrator's or the user's to settle before dispatch.
4. Verify 1 runs as written: on main it printed the eleven `$ <command>` lines, `checks: 11 commands passed`, exit 0. Verify 4 on the scratch copy: no output, exit 1 for each of the eight files; `docs/glossary.md` has 0 non-ASCII lines before and after. Verify 5 on the scratch copy: nothing, exit 1 (on main: one hit each in `plan-orchestration` and `spec`). Verify 6 on the scratch copy: grill 3, roadmap 4, plan 5, plan-orchestration 1, ordo-init 13, repo-setup 14, plan-terms.md 2, docs/glossary.md 2. `sync_rules.test.sh` on the scratch copy: `PASS: sync_rules.py scratch tests`.
5. R9's first grep covers `skills README.md docs/figures/gen_figures.py docs/glossary.md`; rule 14 names `skills/`, `utils/`, `docs/` and `README.md`. On this tree the wider grep adds no line about an approval stop (`docs/academic-coverage.md`, `docs/dev/change-standard.md` only), so nothing is missed by the narrowing; what R9 misses is 1.1, which holds no "approv".
6. R6's expected result does not follow from the dictated texts (5.17).

## 5. The question

Each finding names where a case or check can pass while the goal is not reached, or where a session walking the skill still stops, writes what the ruling did not state, has no rule, or meets two sentences that disagree.

The orchestrator's side:

1. No Rulings line exists for most rulings. `spec` "Steps / A ruling" writes a Rulings line only for "a ruling that adds or splits a step" (and, where the plan keeps its rulings, one that sets a shape, a vocabulary, a rule or a library); any other ruling is only "the open item ... closed with the ruling's text and its date" in the state file. No item tells the session that books a ruling whose option runs a skill to write that line. Walk: the user rules (a) on an open item whose option is "run `/roadmap add` with this entry"; the session names the ruling; `/roadmap` "What it reads" 6 finds no such name in the Rulings section; "no ruling ... every stop stands". S1 passes because the brief hand-builds a Rulings line in `.scratch/demo/plan.md`.
2. The option's text is not in the ledger file. "The skill reads, in that file, the ruling's line ... and the option of the open item the line rules." In this repository's own ledger `grep -c 'Step 0' .scratch/2-e-grill/plan.md` prints 0, the ruling's line (`plan.md:119`) says "Axel ruled (a)", and the state file's closed item (`orchestrator-state.md:53`) is one line without the option. No dictated sentence says what the skill does when the line is found and the option is not, or when the line has no open item (a `grill` bullet `- D<n> ... (the user).`, or a bullet of `<ledger_root>/rulings/<slug>.md`, a file with no "Rulings section"). S1 passes because the scratch ledger holds the option under "Step 0".
3. A Rulings line that is not the user's. "the ruling's line in the Rulings section, which ends with "(the user)"" describes the line; the refusal covers only "A name the file's Rulings section does not hold". In `.scratch/2-e-grill/plan.md` 13 bullets of the Rulings section do not end with "(the user)" (they read "decided by the orchestrator overnight"). Walk: the invocation names "Step 9, the roadmap's entry 16"; the name is held; no rule refuses it; the skill writes without a stop what the user never ruled. Wording that holds: "A name the file's Rulings section does not hold, or whose line does not end with "(the user)", is no ruling".
4. Item 2's second sub-bullet tells the option to state "the entry, the step list, the files, or the answers to its questions". The skills compare more: `ordo-init` Steps 11 wants "the form, each key of `.agents/plan.yaml` with its value, each page to create, and each change to `.gitignore`", plus the commit rule; `sync` wants a choice per hunk; `done` wants the gate's output (Decision 6); `/repo-setup` runs `/ordo-init`, whose keys are not among the ten questions. An option written as the sub-bullet says leaves those unstated, and the stop stands. Wording that holds: the option states the change as the skill's own text says a quoted ruling must state it.
5. No invocation form. Decision 1 adds no line to any Quick start, and `skill-layout.md` row 2 asks for "every invocation, one per line". In `/roadmap add <goal>` everything after `add` is the goal, and `/plan <entry>` matches `<entry>` "by number or title". A session that writes the ruling's name after the command puts it into the goal text or breaks the match; a skill cannot tell a named ruling from the argument.

`/roadmap`:

6. `add`, no rule that the draft takes the ruling's text. Steps / add 1: "From the goal the user gives, draft the title ... and the goal". The new Steps 4 compares "the draft of Steps 2 with the change the ruling states". A session that drafts from the goal writes other words than the option, the draft "differs", and the stop stands on every run. S1 passes when the builder, who knows the intent, copies the option into the draft. `ordo-init` Steps 6 and `repo-setup` Steps 2 have the sentence ("its value is the ruling's", "its answer is the ruling's"); `roadmap` and `plan` have none.
7. `add`, two sentences disagree. Steps / add 3: a gate that could pass "is redrafted and asked again", and "The step is done when the gate's answer is no". The new sub-bullet: "for `add`, only when the gate's answer of Steps / add 3 is no", which implies a draft can reach Steps 4 with the answer yes. Under S2 a session either redrafts the ruled gate (then the draft differs and the stop shows a gate the user did not rule) or keeps it (then add 3 is never done). S2 passes either way, so it does not show which the text means.
8. `add`, the stops "The level", "The insertion form" and "A missing dependency" still stand when the option states the level, the number or the dependency. The ruling names approval stops for `roadmap`, so this is reported, not counted as a miss.
9. `move`, `drop`: the walk reaches Steps 4 with a draft the option can state whole; the refusals stand. `done`: covered only when the option states the gate's output (Decision 6), and the closing step's `/roadmap done` runs with no ruling (`plan-orchestration:290`). No finding beyond 6.

`/plan`:

10. "each step and its check are the ruling's" against Steps 2: "`/plan` writes the closing step itself, at the end of the drafted list". A ruled list without the closing line differs from the draft by one step. No sentence says whether that counts. Failure: every ruled list stops.
11. The ledger file for a plan not yet open. `/plan` refuses when the ledger folder exists, so the ruling is in another plan's `plan.md` or in the rulings file (5.2). When it is in the rulings file, Steps 2 already copies its bullets into the new Rulings, and the new sub-bullet "holds the ruling's line in its Rulings section, copied as it stands" writes the line a second time.

`/ordo-init`:

12. "the stop stands for that part alone". No sentence says whether the stated parts are written before the user answers. A session that writes them leaves `.agents/plan.yaml` without the key in question, which Steps 13's check reports. `roadmap` and `plan` stop whole on a difference.
13. "each page to create": a name or a text. Steps 3 drafts `docs/dev/building.md` from commands it runs. An option that names the page covers it under one reading, and the text is written unseen.
14. Alone, commit allowed: no stop, the commit names the ruling. Alone, commit forbidden: the stop "No commit allowed" names the ruling. Alone, no commit rule in the ruling: the commit question alone is asked. These three walks hold as R5 says, given 5.1 to 5.4.
15. The check of an existing file. "A fix a quoted ruling states is made without the stop." "Checking an existing file" has no commit step and no list of files, so the ruling is named nowhere.
16. Steps 14's sub-bullet: "or, when no commit is made, in the list of files written that the stop shows; under `/repo-setup`, in the list `repo-setup`'s Steps 12 shows." The last clause can be read as holding under `/repo-setup` whether or not a commit is made. `/ordo-init` commits at `repo-setup` Steps 8 when question 5 allows it; under that reading its commit does not name the ruling.

`/repo-setup`:

17. `/ordo-init` inside it. The ten questions hold no `worker`, `reviewer` or `libraries`, and a ruling that answers them states no key of `.agents/plan.yaml`, no text of `docs/dev/building.md` and no `.gitignore` change. `ordo-init` Steps 6 asks the three keys and Steps 11's stop stands. R6 ("no question asked, the draft written, `/ordo-init` given the same ruling") reads true on `repo-setup`'s text while the session stops twice. This is the refuter's finding 3, first scenario.
18. Steps 4: "a draft made only from those answers and the templates is written without the stop". The draft also holds the build files under `src/` "as far as question 3 fixed them", a licence "from its SPDX name's official text, fetched and shown", and pages "copied from a sibling repository ... and adapted". None comes from a template. The three sub-bullets give no rule for such a file.
19. With some questions open: the open ones are asked together and the draft is shown whole. Holds as R6 says.

`/repo-setup sync`:

20. Exit 1. "A hunk whose choice a quoted ruling states" has no comparison with the hunk the option showed. An option "take the template's text for the plan-terms block" covers a hunk that did not exist when the user ruled. With one hunk stated and one not, `--write` rewrites every differing block whole (`sync_rules.py`, head comment), so the stated hunk cannot be "applied without the stop" by the script alone.
21. Exit 2: the drafted change the ruling states is written; one that differs stops. Holds as R7 says.
22. "sync" 9 commits "when the repository's commit rule allows it". In a `sync` run no question 5 is asked, and the glossary gives the commit rule no source for `sync`. The gap is on the tree today; under a ruling the session has no rule and asks.

`/grill`:

23. "a draft that is that text is written at once" carries no condition on the gate. Line 179 asks of a changed gate "could this pass without the goal being reached?". A ruled entry text whose gate could pass is written with no stop: the refuter's finding 5, in `grill`.
24. The record does not name the ruling: Steps 10's commit subject and its list of files are unchanged. Item 1 of "Writing what settled" writes a Rulings bullet ending "(the user)" for the roadmap diff, a decision this interview never asked.

The cases:

25. The scratch runs are made by the builder that wrote the text, acting as the session, on a ledger it builds in the shape the text expects. They show the text can be followed by its author; 5.1, 5.2, 5.5 and 5.6 are the points where another session would not end where S1 does.
26. "names the ruling in the commit message" (roadmap, plan, ordo-init, repo-setup): by its name alone a ruling such as "Open item B" is not one ruling. `/ordo-init` and `/repo-setup` run in a repository other than the one whose ledger holds the ruling. Wording that holds: "names the ruling, by its name and the ledger file that holds it".

## 6. Implied inputs

The step is a text step. Scripts that read the content of a changed file: `skills/repo-setup/templates/sync_rules.py`, which compares `plan-terms.md` with the block of `docs/glossary.md` (in the verify list; green on the scratch copy after `--write`). `utils/check_coverage.py`, `utils/pin.sh` and `docs/figures/gen_figures.py` do not read a `SKILL.md`'s text (`grep -n 'SKILL\|open(' ...`); `gen_figures.py` holds the stops as literals (1.1).

Inputs the scratch runs leave out, each costly when wrong:

1. A named line that does not end "(the user)": expected, no ruling and the stop stands (5.3). Wrong answer: a change the user never ruled is committed.
2. A line found whose option cannot be found: expected, the stop stands (5.2).
3. A ledger file that does not exist, or has no Rulings section: expected, the skill says so and the stop stands.
4. A ruling in a rulings file, with no open item (5.2, 5.11).
5. A draft that differs from the ruled change (2.1).
6. The ruling's name written into the argument (5.5).

## 7. ADRs

`ls docs/adr`: `README.md`, `template.md`. No `NNNN-*.md` record exists, so none touches the step. The brief says the same.

## 8. Dictated text

1. One rule per bullet (`skill-layout.md`, "Lists and tables": two requirements "joined by 'and', 'then', a semicolon or a second sentence, are two bullets"). Items 4 and 6 split the same shape into separate bullets; these do not:
   - Item 7, Steps 2: "is not asked, and its answer is the ruling's; the questions it leaves open are asked together." Three requirements.
   - Item 7, "sync" 3: "... is applied without the stop; a hunk it does not state is shown for the user's ruling."
   - Item 7, "sync" 6: "... is written without the stop; a draft that differs is shown with each difference named, and the stop stands."
   - Item 8: "... is written at once and the roadmap diff decision counts as answered; a draft that differs is shown as the decision."
   - Item 6, Steps 6: "is not asked, and its value is the ruling's."
   - Item 2, third sub-bullet: two sentences, the second a rule of the skills.
   Each holds as one bullet per requirement, as roadmap Steps 4 is written.
2. Item 1, **commit rule**: "the user's answer at its approval stop or the commit rule a quoted ruling states". The entry defines the term by the term. Wording that holds: "or what a quoted ruling states on whether the skills may commit".
3. Item 1, **quoted ruling**: "the ruling's line in that file's Rulings section". A rulings file has no such section, and the **ruling** entry gives most rulings no line (1.2, 5.1, 5.2). The "Stated in" places each hold the text once the items are built (on the scratch copy: `plan-orchestration` "Stops" 1 line; `plan` 6, `roadmap` 6, `ordo-init` 5, `repo-setup` 6, `grill` 11 each present). Its alphabetical place between **questions, the** and **reader, of the transcripts** is right.
4. Indentation, item 8: "the sub-bullets indented as item 10's neighbours are", and "What to build": "A sub-bullet is indented three spaces more than the item it stands under." Item 10 of `grill`'s "What it reads" has no sub-bullet, and item 9's have three spaces. Under `11. ` a sub-bullet needs four, as `grill`'s Steps 10 has (lines 104 to 112) and as the brief's own code blocks give for `ordo-init` Steps 10, 11 and 14 and `repo-setup` Steps 12. With three, the two lines are not children of item 11. Every other item's indentation matches its neighbours (checked on the scratch copy).
5. One meaning, one place (`skill-layout.md`, "Writing for an agent"). Item 6 states the commit question twice: Steps 10, "The commit question is not asked when a quoted ruling states the commit rule", and Steps 11, "When the skill runs alone and the ruling states no commit rule, the commit question is still asked". One of them, with the other place naming it.
6. Decision 4 says `/ordo-init` and `/repo-setup` "skip the stop part by part". Item 7's Steps 4 text is whole or nothing: "A draft under a ruling that leaves a question open is shown whole, and the stop stands." The decision and the text disagree for `repo-setup`.
7. Sentence length (prose standard E, "under roughly 20 words unless the mechanism needs more"). Over 30 words: the glossary entry (75), item 2's first three sub-bullets (36, 37, 43), item 3's two (36, 32), roadmap Steps 4 first (36), plan Steps 3 second (43), ordo-init "What it reads" 3 (40), Steps 11 first (34), Steps 14 (40), "sync" 3 (32), grill's (42). The splits of finding 1 shorten five of them. Verify 7 has the builder name them and not rewrite them, so the length is settled here or not at all.
8. Claims the dictated texts make about the tree, each checked: "Steps / add 3" (roadmap 67 to 70), "the draft of Steps 2" (roadmap 46), ""## Gate"" and "Rulings section" (plan 53, 52), "the approval stop of Steps 11" and "the draft Steps 10 shows" (ordo-init 80, 79), "the list of files written that the stop shows" (ordo-init 108), "`repo-setup`'s Steps 12" (repo-setup 83), "A placeholder that Steps 3 lists" (repo-setup 48, 159), "(Steps / sync 6)" (repo-setup 104), "the roadmap diff decision" (grill 67, 180). All hold.

## Declined to judge

- Whether `skills/spec/SKILL.md` is a shared path with the step being built under `.agents/worktrees/`, and whether lines 197 and 198 still hold after that step lands: I was told not to read the worktree. The configuration block has `workers_at_once: 3`, and `plan-orchestration` says "A step that touches a configuration file or a rule file runs alone"; the orchestrator judges.
- Decision 3, `(approved)` on the step lines of a plan written under a ruling: the refuter left it as the user's design call, and it touches the **authority** vocabulary.
- Decision 5 (a ruling that answers every question covers `repo-setup`'s draft) and Decision 8 (no version change): the user's.
- Whether `roadmap`'s stops "The level", "The insertion form" and "A missing dependency", and `ordo-init`'s "Several roadmaps", belong among the stops covered: the ruling does not name them.
- Whether the "every run" marks of the figures change or stay with a stated reason (1.1): it widens the step's paths, which is the orchestrator's or the user's.
- Whether the new sub-bullets must end their items on a completion criterion (`skill-layout.md`, "Each item of Steps ends on its completion criterion"): the items they join have none today, and the section's last bullet leaves existing text to roadmap entry 23.
- Whether "quoted" fits a ruling that is named and not quoted: the word is the ruling's own.
- I did not run S1 to S3 as a session, and did not make the first read of R1 to R10 beyond the greps and reads quoted above.
- Usage: my tokens, tool uses and time are not visible to me (not verified).

Agent usage: claude-opus-5-5 (ordo-high), 231093 tokens, 34 tool uses, 12.1 minutes ($1.81 to $6.08).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Section 5 findings 1, 2, 3, 5 and 6, section 1 findings 1 and 2, and section 4 finding 3 (the skill has no text to read, cannot tell the ruling from its argument, and the builder may not run the scratch runs): a stop, the open item "Step 9a, how a skill is given the ruling and what the ruling must hold" in the state file. The brief is not kept: no brief, worktree or dispatch entry exists for the step.
- Every other finding (sections 1, 2, 4, 5 and 8): carried into option (a) of that open item as the rule for each skill, the widened paths and the five scratch runs; the next `/spec 2.E 9a` writes the brief from the ruling and closes the wording findings of section 8 in it.

---

# Step 9a brief check (on main at cde9136)

`git rev-parse --short HEAD` at the start: `cde9136`. At the end: `8595fad`. Two commits by other sessions landed while I worked (`git log --oneline cde9136..HEAD`: `f5692d6 Raise the reading of question 10 in step 2b of plan 2.G`, `8595fad Make the six changes of the recurring findings`). `git diff --name-only cde9136 HEAD -- skills docs README.md utils .scratch/2-e-grill` prints `docs/dev/change-standard.md`, `skills/refute/SKILL.md`, `skills/refute/templates/report.md`, `skills/repo-setup/templates/docs/dev/change-standard.md`, `skills/spec/SKILL.md`, `skills/spec/templates/brief-check.md`, `skills/spec/templates/brief.md`. What that changes for this brief is in section 3, finding 1, and section 4, finding 5.

`git status --short` at the end:

```
 M .scratch/2-g-git-guard/agents/briefs/2b.md
?? .scratch/2-e-grill/agents/briefs/9a.md
```

The first line is another session's change (`stat` gives its time as 14:27:55; I wrote nothing in the repository). My scratch folder `$TMPDIR/ordo-9a-check2` held a copy of `skills/`, `docs/`, `utils/`, `README.md` and the 2.E state file with every item of the brief applied by a script, and a copy of `docs/figures/gen_figures.py`. It is removed (`ls` prints "No such file or directory"). I did not read `.agents/worktrees/`.

Each finding ends with its mark: "user" (it changes what option (a) states, so it needs the user's ruling) or "brief" (the brief can close it within option (a)).

## The earlier check's findings, one by one

Read from `.scratch/2-e-grill/agents/reviews/9a-brief-check.md`.

- 1.1 (README, figure and glossary say "each time"): answered for the README (item 3) and the glossary (item 2). Not answered for the figure: Decision 6 leaves `gen_figures.py:381` and both SVGs as they are (section 1, finding 1).
- 1.2 (most rulings have no Rulings line): answered in `spec` by item 4's new bullet. The glossary entry **ruling** is not reached (section 1, finding 4).
- 1.3 (`plan-orchestration:332`): answered by item 5, in other words than option (a) gives (section 2, finding 2).
- 1.4 (`ordo-init` "Several roadmaps"): answered (item 8, Steps 2 and the Stops cell).
- 1.5 (`grill` lines 247, 163, 226): 247 answered by the Rules sub-bullet. 163 is answered from item 3 of "Writing what settled", not in item 1 (section 8, finding 2). 226 is not reached (section 1, finding 5).
- 1.6 (approval sentences not listed): answered by case R10 for the seven skills. `README.md` lines 113, 117 and 124 are outside the step's path and outside Decision 7 (section 1, finding 2).
- 1.7: no finding then, none now.
- 2.1 (no scratch run of a draft that differs): answered by option (a)'s five runs, which the orchestrator makes. The brief holds no item for them (section 2, the last clause).
- 2.2 (additions not listed under "Decisions"): answered. Each is now in option (a) or in "Decisions", except those in section 2, findings 2 to 5.
- 3.1 to 3.3: answered. Every premise holds at `cde9136` (section 3).
- 4.1 (`sync_rules.py .` exits 2): answered, the command is now `--only glossary`.
- 4.2 (Verify 2 and the numerals): answered by "after its indent and its numeral or bullet marker". On the scratch copy all 92 dictated lines, cells and sentences printed 1.
- 4.3 (the builder and git): answered, the builder makes no scratch run.
- 4.4: still holds (section 4).
- 4.5 (the narrow grep): answered, R10 greps `skills docs utils README.md`.
- 4.6 and 5.17 (`/ordo-init` inside `/repo-setup`): answered for the three keys and the derived keys. Not answered for the form (section 5, finding 9).
- 5.1, 5.2, 5.3, 5.4, 5.5: answered (item 4's bullet, the sub-bullets, the "(the user)." test, "as that skill's text says", `--ruling`).
- 5.6 (the draft must take the ruling's text): answered for `/roadmap` and `/plan`. Not answered for `/ordo-init`, the exit-2 draft of `sync` and `/grill` (section 5, finding 5).
- 5.7 (two sentences of add 3): answered.
- 5.8 (level, insertion form, missing dependency): the first two answered by the Stops cells, the third left as Decision 4.
- 5.9: answered.
- 5.10 (the closing step): answered.
- 5.11 (the ruling in the rulings file): the double copy is answered. The sub-bullets of such a ruling now make `/plan` stop on every run (section 5, finding 3).
- 5.12, 5.13, 5.14, 5.16: answered.
- 5.15 (the fix in the check names the ruling nowhere): answered by a message the skill does not have (section 8, finding 3).
- 5.18 (files from no template): answered for the three kinds named. `README.md` is a fourth (section 5, finding 7).
- 5.19, 5.21: answered.
- 5.20 (a hunk that did not exist when the user ruled): answered, the ruling must hold each hunk. Built in one direction only (section 2, finding 3).
- 5.22 (the commit rule in `sync`): not answered, no item. A session reads the repository's own `CLAUDE.md` for it; the stop "No commit allowed" names the ruling.
- 5.23, 5.24: answered, with the placement finding of section 8, finding 2.
- 5.25: answered (fresh agents).
- 5.26: answered ("by its name and its ledger file"), except the fix in `ordo-init`'s check, which says "names the ruling" only.
- 6.1 to 6.6: answered by R3 and R4.
- 8.1 (one rule per bullet): answered for the six texts named then. New joined bullets are in section 8, finding 1.
- 8.2, 8.3, 8.4, 8.5, 8.6, 8.8: answered.
- 8.7 (sentence length): not answered. Verify 8 has the builder name the long sentences and not rewrite them (section 8, finding 6).

## 1. Names

Commands: `git grep -n -c 'quoted ruling\|--ruling' -- skills docs utils README.md` (no output, exit 1: both names are new and collide with nothing), `git grep -n -i 'every run\|each time' -- README.md docs skills utils`, `git grep -n -i 'approv' -- skills docs utils README.md`, `grep -n 'EVERY_RUN' docs/figures/gen_figures.py`, `grep -n '(the user)' skills/*/SKILL.md skills/*/templates/*.md`, `sed -n '100,107p' skills/roadmap/SKILL.md`.

1. Outside the paths, left false. `docs/figures/gen_figures.py:381`: `(EVERY_RUN, "it waits on you each time it runs")`, drawn in `docs/figures/pipeline.svg:166` and `docs/figures/plan-loop.svg:155`. The marks it explains are at `:423` ("The questions", "The draft"), `:433` ("The draft", "Worker, reviewer and libraries"), `:460` ("The change") and `:482` ("The drafted step list"), the stops this step lets a run skip. After item 2 the glossary entry **mark, of a figure** says "unless the run is under a quoted ruling that states the change" and the figure it describes says "each time", so the change leaves two statements that disagree (rules file, rule 19). Failure: a reader of the README figure sees `/roadmap add` marked "every run", reads the legend, and takes a commit with no stop for a defect. Option (a) names the figure and its SVG. Section 2, finding 1 gives two wordings the script accepts. Mark: brief, by adding `docs/figures/gen_figures.py` and the two SVGs to the paths. Leaving the figure as Decision 6 does is a departure from option (a): user.
2. Outside the paths, not named by Decision 7. `README.md:113`: "It asks for the name, the kind, the license, ... It then shows the whole tree and every file's text ... After your approval it writes". `README.md:117`: "shows the diff of each block that differs and rewrites it after approval". `README.md:124`: "It drafts the file from the repository and shows it ... It writes after you approve." The step's path is `README.md` lines 54-54, and Decision 7 names "`README.md`'s skill table, `skills/ordo-help/SKILL.md` and the skills' descriptions". R10's grep prints the three lines and has them "read against the new texts", with no place to record the result. Failure: the builder either reports them as a stop or leaves them unread. Wording: Decision 7 names "`README.md`'s skill table and its section "Configuring a repository" (lines 113, 117, 124)". Mark: brief.
3. Outside the paths, no place tells a session run by hand how the skill is run after the ruling. `skills/spec/SKILL.md:211`: "On that message the session books the ruling and nothing else", `:224`: "Then `/spec <entry> <step>` is typed again", and `skills/ordo-help/SKILL.md:69`: `"Ruled: ..."  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it`. Only `plan-orchestration` "Stops" (item 5) says "runs the skill with `--ruling`", and that skill is the loop. Failure: by hand, the user rules on an option that runs `/roadmap add`, the session books the bullet, and the user types `/roadmap add <goal>` with no `--ruling`, so the stop the ruling was to remove is raised. Wording: a sentence in `spec` "Steps / A ruling" 3, "After a ruling on an option that runs a skill, that skill is run with `--ruling <ledger file> "<name>"` before `/spec` is typed again", and one line in `ordo-help`'s sequence (a path to add). Mark: brief.
4. Inside the paths, not reached. `skills/repo-setup/templates/plan-terms.md:91` (**ruling**): "A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)"". Item 4 adds a second kind of ruling written there, as a bullet with sub-bullets. `:92` (**rulings file**): "one bullet line each", while the new term says a quoted ruling can be "in a rulings file ... with the sub-bullets under it". `skills/plan/templates/plan.md:31` shows the one-line form only. Failure: a reader of the glossary finds two entries that describe the Rulings section without the form the new term rests on. Wording for `:91`: after that sentence, "A ruling on an option that runs a skill with an approval stop is written there as a bullet with the change as sub-bullets, the quoted ruling." Mark: brief.
5. Inside the paths, not reached. `skills/grill/SKILL.md:226`: "A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it". `:163`: "Write the ruling for every settled answer, the roadmap diff ... included." `:104` and `:109` (Steps 10's list and commit). Item 10 changes what each of these does and writes the change in "Writing what settled" 3 only. See section 8, finding 2. Mark: brief.
6. Inside the paths, not reached. `skills/roadmap/SKILL.md:103`: "A goal that does not settle it is a stop ("Stops")." The Stops cell becomes "neither the goal nor a quoted ruling settles which". The two state the condition differently; the pointer to "Stops" resolves it for a careful reader. Wording for `:103`: "A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops")." Mark: brief.
7. Inside the paths, not reached. `skills/repo-setup/SKILL.md:158`, third cell: "The ten questions, each with its default". Under a ruling that answers eight, Steps 2 asks two. Wording: "The questions asked, each with its default". Mark: brief.
8. Shared files with steps of other plans. `.scratch/2-h-session-retro/agents/briefs/3a.md` lists `skills/spec/SKILL.md` whole, and `.scratch/2-g-git-guard/agents/briefs/2b.md` lists `skills/repo-setup/SKILL.md` lines 126-126 and `README.md` lines 13-13. Each of the three state files reads `dispatch: none` on main, so `spec` Steps 5, which compares with "every other step in the dispatch block", has nothing to compare with. This is the orchestrator's judgment (see "Declined to judge").

## 2. The step line

Option (a), clause by clause:

- The invocation form, shown in each Quick start: items 6 to 10, first bullet each. The term: item 1.
- What a quoted ruling is, and the three no-ruling inputs: the shared "What it reads" item in five skills. The session that books the ruling writes the bullet: item 4, first bullet, and item 5, third sub-bullet.
- "It drafts from the ruling's text, applies its own rules, and compares": `roadmap` Steps 2 and 4 (item 6), `plan` Steps 2 and 3 (item 7). `ordo-init`, the exit-2 draft of `sync` and `grill` have the comparison and no sentence that the draft takes the ruling's text (section 5, finding 5).
- "the stop stands whole; nothing is written in part": `roadmap` Steps 4, `plan` Steps 3, `ordo-init` Steps 11, `repo-setup` Steps 4. `ordo-init` Rules 5 as item 8 writes it says otherwise (section 5, finding 6).
- `/roadmap`: item 6. The dependencies "taken from the ruled entry": Steps 2's list holds "what it waits on", and the stop "A missing dependency" stays (Decision 4, listed).
- `/plan`: item 7.
- `/ordo-init`: item 8.
- `/repo-setup`: item 9 and item 8's fourth sub-bullet of Steps 11.
- `/repo-setup sync`: item 9, "sync" 3 and the cell. The exit-2 draft ("sync" 6) is not in option (a); it is an approval stop of `repo-setup`, which the ruling "Approval stops under a ruling" covers ("at each approval stop").
- `/grill`: item 10.
- The record: `roadmap` Steps 5, `plan` Steps 6, `ordo-init` Steps 14 and the cell, `repo-setup` Steps 12, "sync" 9 and the cell, `grill` through "Writing what settled" 3. The fix in `ordo-init`'s check: Decision 5.
- The pages that say "every run": items 2 and 3. The figure: none (finding 1). `plan-orchestration`'s rule: item 5, second bullet (finding 2).
- The check, five runs by fresh agents: no item, by design; the brief's opening says the orchestrator makes them. The step line's check "a scratch run of `/roadmap add` ... that writes the ruled change with no second stop and stops on a draft that differs" is therefore proved by nothing in the builder's report. The brief does not say where the five runs are booked or that the landing waits on them.

Findings:

1. Decision 6, the figures. The claim "its legend is one line of 232.8 px and refuses every wording tried" holds for the ruled words and does not hold for every wording. On a scratch copy of `docs/figures/gen_figures.py`, with line 381's text replaced and the script run (`python3 docs/figures/gen_figures.py`): "unless the run is under a quoted ruling that states the change" (62 characters) and "each run, unless under a quoted ruling" (38) exit 1 with "does not fit one line of 232.8 px". "each run not under a quoted ruling" (34), "each run, unless a quoted ruling" (32), "waits unless a quoted ruling covers" (35) and "it waits, unless a ruling covers it" (35) exit 0 and write both files. The limit is 35 characters (232.8 px at 6.6 px a character). The second claim, "The other way is a legend of two rows, a change to the layout of both figures", leaves out a third way: one `draw_note` line under the legend, width 990. With the line `draw_note(canvas, x, y + 46, "A stop marked every run does not wait when the run is under a quoted ruling that states the change.", width)` added to `draw_legend`, the script exits 0. In `plan-loop.svg` the note's baseline is at 878 of a canvas 889 high. In `pipeline.svg` it is at 970 of 966, so that canvas needs about 20 px more height. No box moves. The eight wordings the brief says were tried are not listed, so that sentence cannot be rerun. Mark: brief, by building the note line (the ruled words whole) or a 34-character legend; the paths gain `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg` and `docs/figures/plan-loop.svg`. Keeping Decision 6 as it stands: user.
2. Built differently, not listed. Option (a): "`plan-orchestration`'s rule that every skill is invoked through the runner names the five skills." Item 5: "`/roadmap` at the closing, and a skill run under a quoted ruling)". No skill is named. Wording: "`/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling)". Mark: brief.
3. Built differently, not listed. Option (a) for `sync`: "covered when the ruling holds the hunks and the choice for each, and the diff the run shows is those hunks". Item 9: "Under a quoted ruling that holds each hunk of the diff with the choice for it". A ruling that holds a hunk the run no longer shows is covered by the brief's words and not by option (a)'s. Wording: "Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop." Mark: brief.
4. Beyond option (a), listed (Decision 3). Item 8, Steps 11, fourth sub-bullet: "and the verification page it writes from that tree's build files, count as stated". Option (a) says "the keys it derives from the tree just written count as stated" and, for `/ordo-init`, "a page whose text the ruling does not hold is shown and the stop stands". The page's text is then written without the user having ruled or seen it, which is the third clause of the goal. "Decisions" calls it reversible; it is a change to what the user ruled. Mark: user.
5. Built differently, not listed. Option (a): "ends "(the user)"". The dictated texts: "does not end with "(the user)."", with the full stop. `skills/spec/SKILL.md:44` has "(the user)" and `:215` has "(the user).". `grep -n '(the user)$' .scratch/2-e-grill/plan.md` prints line 97, a ruling of the user with no full stop. Failure: such a bullet is refused as no ruling and the stop is raised a second time. Wording: "does not end with "(the user)", with or without a full stop". Mark: brief.
6. Beyond the rulings, not listed: the Rules sub-bullets of items 8, 9 and 10 ("is that approval", "is the user's answer"). They state what option (a) implies; `roadmap` and `plan` get none (section 4, finding 4). Mark: brief.

Listed under "Decisions" and consistent with option (a): 1 (the name rule), 2 (`(approved)`), 4 (the missing dependency), 5 (the fix's record), 7 (pages left unchanged, with section 1, finding 2), 8 (versions).

## 3. Premises

Commands rerun at `cde9136`: `sed -n '<n>p'` for every line number the section gives (plan-orchestration 290, 301, 302, 332; spec 197, 198, 215, 216; roadmap 14, 22, 40, 46, 47, 49, 50, 67, 68, 70, 130, 132, 133; plan 41, 49, 55, 60, 61, 65, 66, 76 to 78, 84; ordo-init 31, 46, 60, 64, 79, 80, 85, 87, 95, 103, 104, 105, 107, 108, 119, 124; repo-setup 34, 40, 58, 64, 65, 67, 83, 88, 94, 96, 104, 109, 158 to 161, 163, 181; grill 53, 104, 112, 177, 182, 247; plan-terms 20, 74, 75; glossary 133; README 54; gen_figures 381), `ls docs/adr` (`README.md`, `template.md`), `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` (`ok: the plan-terms block equals the template`, exit 0), `grep -n 'Where the work happens' -A3 docs/dev/change-standard.md`, `grep -n 'Repair round 1' .scratch/2-e-grill/agents/reviews/9-refuter.md` (line 145). Every line number, count and quoted sentence matches. The item counts of each "What it reads" and the line counts of each Quick start match.

1. "read on main at cde9136": main is at `8595fad`. `git diff -U0 cde9136 HEAD -- skills/spec/SKILL.md` has one hunk, `@@ -245,0 +246,2 @@`, so lines 44, 197, 198, 215 and 216 are as the brief has them (reread at `8595fad`). `docs/dev/change-standard.md` changed in rule 13 only (tests), and rules 4 and 14, which the brief cites, are at lines 30 and 45 as before. The premise header needs the new commit.
2. "Eight longer wordings that name a quoted ruling were tried ... and each was refused": the wordings are not given, so the sentence cannot be rerun. Wordings of 32 to 35 characters that name a quoted ruling are accepted (section 2, finding 1).

## 4. Cases and checks

The scratch copy had every item applied by a script, placed by the line numbers the items give, then `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` (`written: the plan-terms block now equals the template`, exit 0). `diff -rq` of the copy against an untouched copy names ten files, the ten of Verify 3.

Results of the checks there:

- Verify 1, on main as written: `checks: 11 commands passed`, exit 0 (run twice, at `cde9136` or `f5692d6`; not rerun at `8595fad`). On the scratch copy the two commands the change can reach: the glossary check prints `ok: the plan-terms block equals the template`, exit 0, and the ASCII check over the ten files prints nothing, exit 0. `sh skills/repo-setup/templates/sync_rules.test.sh | tail -1` prints `PASS: sync_rules.py scratch tests`.
- Verify 2: each of the 92 dictated lines, cells and changed sentences, written as the one line of a pattern file, gives `grep -c -F -f` 1 in its file; the three lines of the shared item give 1 in each of the five skills.
- Verify 3: holds (above).
- Verify 4: `LC_ALL=C grep -n '[^ -~]'` exits 1 with no output for each of the ten files, before and after.
- Verify 5: `grep -rn 'stay stops of their own' skills docs` prints nothing, exit 1.
- Verify 6: grill 6, roadmap 10, plan 7, spec 1, plan-orchestration 3, ordo-init 16, repo-setup 15, plan-terms.md 2, docs/glossary.md 3, README.md 1.
- R1: the entry stands between **questions, the** and **reader, of the transcripts** in both files; each of the seven "Stated in" places holds a line with "quoted ruling".

No case contradicts the rules file: the step is text, its cases are readings, and rule 1 asks for no test. Findings:

1. Items 6 and 10, Quick start: "its description starting in the column the others start in". In `roadmap` the descriptions start in column 43 and the new invocation `/roadmap <command> ... --ruling <ledger file> "<name>"` is 53 characters, so the sentence cannot be met. In `grill` the column is 65 and the fence gives three spaces after a 46-character invocation; a builder who pads to the column breaks "written exactly as given" and Verify 2 prints 0 for that line, and one who keeps the fence breaks the sentence. Failure: a stop before any change, or a report row that is red for a reason the brief made. Wording: drop the column sentence from both items ("the line as the fence gives it; its description starts three spaces after the invocation, since the invocation is longer than the column"). Mark: brief.
2. Verify 7 and the opening of "What to build": the indent rule covers a sub-bullet of a numbered item and a sub-bullet of a sub-bullet. The Rules sub-bullets of `repo-setup` (line 181) and `grill` (line 247), and the four of `plan-orchestration` "Stops", stand under a top-level bullet. `plan-orchestration` and `ordo-init` have neighbours at two spaces; `repo-setup`'s and `grill`'s Rules have none, so neither half of Verify 7 can be shown for them. Wording for the opening: "and a sub-bullet of a top-level bullet two spaces". Every other dictated indent matches its neighbours on the scratch copy (three spaces under one-digit items, four under `ordo-init` 10, 11, 14, `repo-setup` 12 and `grill` 11, five in `spec` "Steps / A stop", three in `spec` "Steps / A ruling" 2). Mark: brief.
3. R7, first case: "in a draft whose every file comes from a template". `find skills/repo-setup/templates -type f` lists no template for `README.md`, and "The tree" gives it as "the name, the paragraph, how to build ..., the license line". Every draft holds that file, so the case describes a draft that cannot exist under a literal reading of item 9 (section 5, finding 7). Mark: as that finding.
4. R10: "a quoted ruling is the user's approval, as the Rules sub-bullets of items 8 to 10 and the term's entry say". The term's entry says what a quoted ruling is, not that it is an approval, and `roadmap` and `plan` get no Rules sub-bullet. For `skills/roadmap/SKILL.md:3` ("Writes only after the user approves"), `:10`, `:16`, `:17` and `skills/plan/SKILL.md:15`, `:95` the builder has no line to name as the reason. Wording: R10 names, for `roadmap`, Steps 4's sub-bullets and, for `plan`, Steps 3's; or items 6 and 7 gain the Rules sub-bullet the other three have. Mark: brief.
5. "Report" against the template on main. `8595fad` changed `skills/spec/templates/brief.md`: the terms part now also asks "For each entry the diff changes, and each entry whose named place the diff changes, the line of that place that states the term is quoted as `grep -n` prints it." The brief's "Report" has the older sentence. This step adds an entry with seven named places and changes `ordo-init` "What it reads" 3, the named place of **commit rule**. Wording: add that sentence to the terms part. Mark: brief.
6. R6: "The check of an existing file with a stated fix." has no expected result, where every other input of R6 has one in brackets. Wording: "(the fix made without the stop, the ruling named as item 8 says; an error the ruling does not state still stops)". Mark: brief.

## 5. The question

Could each case and check pass without the goal? Verify 1 to 7 show that the dictated lines are in the files, once, in ASCII, at the right indent. They pass on any tree that holds the text, whatever a session then does with it. The goal rests on the walks of R2 to R9, which the builder writes from its own reading of text it just placed, and on the five runs by fresh agents, which cover `/roadmap add` only. For `/plan`, `/ordo-init`, `/repo-setup`, `sync` and `/grill` no fresh session follows the text before the landing. The findings below are the points where my walk on the scratch copy, using the skill's text alone, still stops, writes what the ruling did not state, finds no rule, or finds two sentences that disagree.

The orchestrator's side (R2):

1. The form of a change that is more than one line. Item 4: "with the change the option stated copied under it as sub-bullets". `ordo-init` Steps 11 needs "the full text of each page to create", `sync` needs each hunk, `grill` "the entry's changed text". No sentence says how a page of many lines, with headings and fences, is written as sub-bullets of a Rulings bullet, or what "is that text" means for it (the same bytes, the same lines, the same words). `grep`-style readers of `plan.md` find its sections by heading (`spec` "What it reads" 4). Failure: a session copies a page with a `## ` heading at column 0 into the Rulings section, and `/spec` then reads a section that ends early; or two sessions judge "the draft is the ruled text" differently. Wording for item 4: "a text of several lines is copied under its sub-bullet as a fenced block indented with it, and a draft is the ruled change when its text equals that block line for line". Mark: brief.
2. Item 5, second and fourth sub-bullets: "An option that runs a skill with an approval stop (...) states the change in full" and "An option that does not state the change in full names the skill's approval stop as a stop of its own." The first reads as a rule with no exception, and the fourth is its exception in another bullet (`skill-layout.md`, "Lists and tables": "a qualifier that changes the rule ... stays in the same bullet as the rule"). `spec`'s copy has them in one sentence. Wording: one bullet, "... states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own." Mark: brief.

`/plan` (R5):

3. The ruling in the entry's own rulings file stops on every run. `skills/plan/SKILL.md:52`: "Any other line, such as ... an indented sub-bullet, is shown with the draft at Steps 3; the user places it". Item 7's fourth condition: "no line of the rulings file is left to place". The shared item allows the ruling "in that file when it is a rulings file, with the sub-bullets under it", and R4's fourth input says such a bullet "is a quoted ruling". Its sub-bullets are lines left to place, so the condition fails. "unless Steps 2 copied it from the rulings file" is also not true of the sub-bullets, which Steps 2 does not copy as bullet lines. R5 does not walk this input and passes. Wording: in Steps 2, "Under a quoted ruling that stands in the rulings file, its bullet is copied with its sub-bullets, and those sub-bullets are not lines left to place." Mark: brief.
4. A ruled list that already ends with a closing step: `:60` "`/plan` writes the closing step itself, at the end of the drafted list" gives two closing steps, and "The closing step `/plan` writes itself is no difference" then hides the duplicate. Wording: "A closing step in the ruled list is dropped for the one `/plan` writes." Mark: brief.

`/ordo-init` alone (R6):

5. No sentence says the draft takes the ruling's text. `roadmap` Steps 2 and `plan` Steps 2 have it. `ordo-init` Steps 3 drafts `docs/dev/building.md` "from the commands the CI jobs and build files run", Steps 4 fills a template and adds "Each rule the repository already states elsewhere", Steps 7 leaves `bench`, `look`, `design_bar` out "unless the user gives a value". Steps 11 then compares "the full text of each page". A session that drafts as Steps 3, 4 and 7 say writes other words than the ruled page, and leaves out a key the ruling states, so the draft differs and the stop stands on every run that creates a page. R6's first input ("no stop") passes when read by someone who assumes the draft is the ruled one. The same gap is in `repo-setup` "sync" 6 (the exit-2 draft) and in `grill` "Writing what settled" 3 ("a draft that is that text", with the draft made from the interview's answers). Wording for `ordo-init`, a first sub-bullet of Steps 11 or a sub-bullet of Steps 1: "Under a quoted ruling the draft takes the ruling's form, keys, `.gitignore` changes and page texts, and Steps 1 to 9 are applied to it as to any other." For `grill`: "the draft takes the ruled text, and the rules of this item are applied to it". Mark: brief.
6. Two sentences disagree. Item 8, Rules 5: "made after approval, or at once when a quoted ruling states that change". Steps 11, third sub-bullet: "A draft that differs in anything ... is shown whole ..., and the stop stands", and option (a): "nothing is written in part". "at once" lets a session write the `.gitignore` change when Steps 9 drafts it, before Steps 11 finds that a page differs. R6 ends "Rules 1 and 5 agree with Steps 11" and would be read as true. Wording: "... made after approval, or without the stop when Steps 11 or "Steps / Checking an existing file" 4 finds that a quoted ruling states it." Mark: brief.
7. The three alone walks otherwise hold on the text: commit allowed (Steps 14, the commit names the ruling), commit forbidden (the stop "No commit allowed" and its third cell name the ruling), no commit rule in the ruling (Steps 10 shows the question, Steps 11 asks it alone), a page's text missing (Steps 11 third sub-bullet, nothing written). When the commit question is asked alone the skill waits on the user, and the Stops cell "Every setup, at Steps 11, except a draft a quoted ruling states" says it does not. Wording for the cell: "..., except a draft a quoted ruling states, where only the commit question of Steps 10 is asked". Mark: brief.
8. The check of an existing file: a fix the ruling states is made; nothing says what happens when the fix the skill proposes for that error differs from the ruled fix. The goal's second clause ("anything the skill's own rules draft differently still stops") has no sentence here. Wording: "A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands." Mark: brief.

`/repo-setup` (R7):

9. `README.md` comes from no template. Item 9, Steps 4: "every file of the draft comes from a template and the answers", and option (a): "A file that comes from no template is shown and the stop stands". "The tree" gives `README.md` no template, and its wording is the session's. Read literally the third condition never holds and every setup stops; read loosely, a `README.md` the user has not seen is written. `docs/dev/building.md` and `.agents/plan.yaml` ("written by /ordo-init") are in the same tree and have no template either. Mark: user (whether a file made from the answers alone counts as ruled; option (a)'s words do not settle it).
10. `/ordo-init` inside it still stops at its Steps 11. Item 8, fourth sub-bullet, lets "a key this skill derives from the tree" and "the verification page" count as stated. Steps 11 compares "the form, each key ..., each change to `.gitignore`, and the full text of each page". The form is not a key, and `repo-setup` Steps 4 asks the ruling for ten answers and three keys, not the form. A session that follows the text finds the form unstated and keeps the stop. R7 says "not stopping at its Steps 2, 6 or 11". Wording: "Under `/repo-setup`, the form, a key this skill derives ... count as stated." This widens Decision 3's set. Mark: user, with section 2, finding 4.
11. A placeholder with no value. Item 9's three conditions do not include it. `skills/repo-setup/SKILL.md:48`: "A placeholder none of these fills is listed with the draft at Steps 4, and the user gives its value", and `:56-57`: "It is never written as `<...>`". With the three conditions true and one placeholder unfilled, the first sub-bullet says "written without the stop" and the skill has no value to write. The "Otherwise" sub-bullet names the placeholder only when a condition fails. Wording: a fourth condition, "and Steps 3 lists no placeholder for the user's value". Mark: brief.
12. The other walks hold: all answers and the three keys (no question at Steps 2, `/ordo-init` run with the same arguments, Steps 12's commit or list names the ruling, subject to findings 9 and 10); a build file for the kind (shown whole); eight answers (the two asked together, the draft shown whole).

`/repo-setup sync` (R8): exit 1 and exit 2 hold as R8 says, with section 2, finding 3 and finding 5 above for the exit-2 draft.

`/roadmap` (R3): `add`, `move`, `done` and `drop` hold as R3 says. Two points:

13. A roadmap with a capability map. `skills/roadmap/SKILL.md:117-118`: "`add` also finds the capability ... A capability that is not there yet is drafted in that file". Item 6's list for `add` is "title, goal, gate, level, number, what it waits on and its place". The capability's draft is not in it, so an option written "as that skill's text says" never states it, and the run stops on every `add` in such a repository, or a session writes a capability nobody ruled. R3 has no such input. Wording: add "and, for a map, the capability's draft" to the list. Mark: brief.
14. Add 3, the order of the sub-bullets after the change: "Under a quoted ruling the ruled gate is not redrafted ..." is followed by "A goal for which every gate drafted could pass without it is a goal whose gate cannot be named (Steps / add 2)". With one ruled gate that could pass, that sentence sends a session to the stop "No gate" and its two options, not to the stop "The change" with the gate's answer, which option (a) asks for. Either way the run stops. Wording: end the new sub-bullet with "and the stop "No gate" is not raised for it". Mark: brief.

`/grill` (R9):

15. "is written at once when the changed gate's answer is no": a ruled text that changes the goal and no gate has no changed gate, so the condition names nothing. A session either writes or shows the decision; the third sub-bullet covers neither. Wording: "is written at once, unless it changes the gate and the changed gate could pass without the goal". Mark: brief.
16. R9's other points hold on the text: Steps 9 ends ("counts as answered"), no Rulings bullet for it, Steps 10 names the ruling, a gate that could pass is shown as the decision.

The no-ruling inputs (R4): all four hold on the shared item's second sub-bullet and its first ("or in that file when it is a rulings file").

## 6. Implied inputs

Scripts that read the changed files' content: `skills/repo-setup/templates/sync_rules.py` compares `plan-terms.md` with the block of `docs/glossary.md` (in the verify list; `ok` on the scratch copy after `--write`). `grep -rn 'Rulings' --include='*.py' --include='*.sh' skills utils docs` prints nothing, so no script reads a Rulings section. `utils/check_coverage.py` and `utils/pin.sh` read no `SKILL.md` text, and `docs/figures/gen_figures.py` "reads no skill file" (its head comment). No script takes `--ruling`: the argument is read by a session.

Inputs the cases leave out, each with what a wrong answer costs. A Python pass over the Rulings of the four open plans gave the counts.

1. A name that holds a double quote. By the name rule ("the text before its first ` (`") 3 of the 46 Rulings bullets of `.scratch/2-e-grill/plan.md` have such a name. `"<name>"` has no rule for it. Cost: no ruling found, a second stop. Expected: the name is given as written, and the skill matches it against the bullet's text, not the shell's parse. Mark: brief.
2. Two bullets of the same name (none today; item 4 and `spec:215` can both write one for a ruling that adds a step and runs a skill). Cost: the skill reads the bullet without sub-bullets, or the one that is not the user's. Expected: more than one bullet of the name is no ruling, and the skill says so. Mark: brief.
3. A file that is no ledger file. `skills/plan/templates/plan.md:31` is a bullet under `## Rulings` that ends "(the user)." with the name `<L>`. The shared item tests the ending only. Cost: a change committed that the user never ruled. Expected: a file that is neither the `plan.md` of a folder under `<ledger_root>` or `<archive_root>` nor a rulings file is no ruling. Mark: brief.
4. A quoted ruling with no sub-bullets, or whose sub-bullets state part of the change. Expected: the draft cannot be the ruled change, the stop stands whole. The text gives this by the comparison; no case reads it. Mark: brief.
5. The ledger file when the skill runs in another repository (`/repo-setup <path>`, `/ordo-init` "Run from the repository root"). `ordo-init` Rules: "Every path is relative to the repository root." Cost: the path is resolved in the new repository, "a file that does not exist", a second stop; and the commit there names a path of another repository. Expected: the path form is stated (`roadmap`'s Rules give one: "its path from the folder that holds this repository"). Mark: brief.
6. A user's bullet with no final full stop (section 2, finding 5).
7. A capability map (section 5, finding 13), a ruled list with a closing step (finding 4), a placeholder with no value (finding 11), a ruled text with no changed gate (finding 15).

## 7. ADRs

`ls docs/adr`: `README.md`, `template.md`. No `NNNN-*.md` record exists, so none touches the step. The brief says the same. Findings: none.

## 8. Dictated text

Claims the dictated texts make about the tree, each checked on the scratch copy and on main: "the `spec` skill's "What it reads" 4" (`spec:44`), "Steps / add 3" and "(Steps 4)" (`roadmap`), ""## Gate"", "Steps 3 says" and "Steps 2 copied it from the rulings file" (`plan:52-66`), "the approval stop of Steps 11", "Steps 10 shows", "the stop "No commit allowed"", "`repo-setup`'s Steps 12", "question 5" (`ordo-init`, `repo-setup:118`), "Steps 3 lists" (`repo-setup:48`), "(Steps / sync 6)", "item 1" and "Steps 10 ... its list" (`grill:163`, `:104`), and the seven "Stated in" places. All hold except finding 3 below and the column claim of section 4, finding 1.

1. One rule per bullet (`skill-layout.md`, "Lists and tables"). These join two or more requirements that can each be broken alone:
   - The shared item, first sub-bullet: "It is the bullet named ...; the name is read as ...". Two bullets.
   - Item 4, new bullet: "... copied under it as sub-bullets; it is the quoted ruling the session gives that skill;". The list ends each bullet with a semicolon, so the inner one reads as a bullet's end. Wording: "..., and is the quoted ruling the session gives that skill;".
   - Item 5, third sub-bullet: "books the ruling ... and runs the skill with `--ruling`". Two bullets.
   - Item 7, Steps 2: "the step list is the ruling's, each step with its check, and the rest of this step is applied to it". Two bullets.
   - Item 8, Steps 11, second: "... is written without the stop; a commit question Steps 10 shows is then asked alone." Two bullets.
   - Item 8, "Checking an existing file" 4: "is made without the stop, and the message ... names the ruling". Two bullets.
   - Item 9, Steps 4, second: "Otherwise the draft is shown whole, and the stop stands; a file that comes from no template ... are named with it." Two bullets.
   - Item 10, second sub-bullet: three requirements (finding 2).
   Mark: brief.
2. Where a rule goes (`skill-layout.md`: "A rule that says what to do at one point of the work goes in that step's item"). Item 10, second sub-bullet, under "Writing what settled" 3: "The roadmap diff decision then counts as answered, item 1 writes no Rulings bullet for it, and Steps 10 names the quoted ruling ... beside the entry in its list and in the commit message." The second requirement is a rule of item 1, whose line 163 still says "the roadmap diff ... included", and the third is a rule of Steps 10, whose text is unchanged. Failure: a session at Steps 10 reads its nine sub-bullets, finds nothing about a ruling, and commits without naming it; R9 passes because the builder reads item 3. Wording: a sub-bullet under item 1, "A roadmap diff written under a quoted ruling gets no bullet: the quoted ruling is its ruling."; a sub-bullet under Steps 10, "An entry changed under a quoted ruling is listed with the ruling's name and its ledger file, and the commit message names them."; item 3 keeps "The roadmap diff decision then counts as answered." Mark: brief.
3. A claim about the tree that does not hold. Item 8, "Checking an existing file" 4, and Decision 5: "the message that lists the fixes made names the ruling". `sed -n '89,97p' skills/ordo-init/SKILL.md`: items 1 to 6 hold no message that lists the fixes made; item 6 is "After the fixes, run the check again." Failure: the session has no message to put the name in, and the record clause of the goal is not met for a ruled fix. The text also leaves out "by its name and its ledger file", which every other record sentence has. Wording, as a sub-bullet of item 6: "A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file." Mark: brief.
4. A term outside its glossary sense. `<ledger file>` and "its ledger file" also name a rulings file. **ledger** (`plan-terms.md:51`): "a plan's folder under `ledger_root`, holding `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/`". A rulings file is `<ledger_root>/rulings/<slug>.md`, in no plan's folder. The brief's own Conventions ask that "ledger" be used only in its glossary sense. The words are option (a)'s, so the fix is in the definition: the term's entry gains "The file is a plan's `plan.md` or a rulings file." Mark: brief.
5. "The command's subsection is then applied to that draft as to any other" (item 6, Steps 2). The subsection's items are drafting actions ("Draft the gate", "Draft the place"). Applied to a draft that already holds a gate and a place, the sentence does not say whether the item drafts again or checks what is there. R3's third input needs the second reading. Wording: "Each item of the command's subsection is then worked on that draft: what the item would draft differently replaces the ruled text, and Steps 4 finds the difference." Mark: brief.
6. Sentence length (prose standard E, "under roughly 20 words unless the mechanism needs more"). Over 30 words, counted by splitting each dictated text at its sentence ends: the term's second sentence (35), the README sentence (34), item 4's new bullet (40) and first sub-bullet (35), item 5's second and third (32, 31), `roadmap` add 3's completion line (31), `plan` Steps 3's conditions (33), `ordo-init` "What it reads" 3 (39), `repo-setup` Steps 4's second (37), Steps 12 and "sync" 9 (35 each), `grill`'s first and second (32, 41). The splits of finding 1 shorten seven of them. Verify 8 has the builder name them and keep them, so the length is settled in the brief or not at all. Mark: brief.
7. Semicolons (prose standard B, "at most 2 per 1000 words of running prose"). The 79 dictated texts hold 13 semicolons in 1,942 words. Five join rules in a bullet and go with finding 1; the others are in the glossary entries and the Quick start lines, which the file's own form uses. Mark: brief.
8. The Quick start line of item 6 stands after `/roadmap <project> ...` and opens "the same", which a reader takes as "the same as the project form". Wording: "any command above, under a quoted ruling: ...". Mark: brief.
9. Item 9, Stops: the rule of Steps 4 is carried into the cell as "except a draft a quoted ruling covers as Steps 4 says", which points at the step. That form holds. Items 6 and 8 put the exception into the cell in the cell's own words ("except a draft that is the change a quoted ruling states (Steps 4)", "except a draft a quoted ruling states"); the second has no pointer to Steps 11's conditions, and `skill-layout.md`'s anti-pattern "A rule folded into a table cell until its exception is gone" applies to it: the cell drops "whose page texts the ruling holds". Wording: "Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says". Mark: brief.

## Declined to judge

- Whether step 9a may be built while `skills/spec/SKILL.md` (brief 3a of plan 2.H, whole file) and `skills/repo-setup/SKILL.md` and `README.md` (brief 2b of plan 2.G, lines 126 and 13) are being changed by steps of other plans, and how the landings merge: the orchestrator's judgment under "Two steps in flight". I did not read the worktrees. `8595fad` has already changed `skills/spec/SKILL.md` after line 245.
- Decision 2 (`(approved)` on a plan written under a ruling, the **authority** entry left as it is): option (a) states it; whether the entry's words "the list the user approved when the plan opened" then need a change is the user's vocabulary.
- Decision 4 (the stop "A missing dependency" stays): option (a)'s "the dependencies are taken from the ruled entry" can be read either way. The user's.
- Decision 8 (no version change). "the repository sets no rule for it" is true of `docs/dev/skill-layout.md` (`grep -n version`). `git log -G'^  version:' -- skills/` shows that landings of plan 2.D changed version lines. The user's.
- Whether the closing step's `/roadmap done` (the row "The roadmap diff", `plan-orchestration:290`) should also run under a ruling: neither ruling names it.
- Whether a `(the user).` ending is enough proof that a bullet is the user's, since any session can write one: it is the design the user ruled.
- Whether new sub-bullets appended to a Steps item must leave the item ending on a completion criterion: the items concerned have none today, and `skill-layout.md` leaves existing text to roadmap entry 23.
- I did not act as a fresh session in a scratch repository for any skill: no scratch run was made, since that needs `git init` and commits. The walks are readings of the scratch copy's text.
- Verify 1 was not rerun after `8595fad` landed.
- My tokens, tool uses and time: not visible to me (not verified).

Agent usage: claude-opus-5-5 (ordo-high), 301182 tokens, 46 tool uses, 18.1 minutes ($2.58 to $7.82).

## Closed (second check; the session's change to the brief for every finding of it; a third check of the rewritten brief follows before the preparation commit)

- Section 1 finding 1 and section 2 finding 1 (the figure): item 4 builds the ruled words as a note line under the legend's row, with both canvases 22 px higher, tried on a scratch copy of the script and rendered; Decision 6; the three figure files joined the paths.
- Section 1 finding 2: Decision 7 names `README.md` lines 113, 117 and 124, and R10 gives the reason. Finding 3: item 5's sub-bullet of "Steps / A ruling" 3 and item 6's line of `ordo-help`. Finding 4: the entries **ruling** and **rulings file** in item 1; Decision 13 for the plan template. Finding 5: item 12's sub-bullets of "Writing what settled" 1 and of Steps 10, and the cell of the row "A round". Finding 6: item 8, line 103. Finding 7: item 11, the third cell of "The questions". Finding 8: the orchestrator's judgment at the dispatch.
- Section 2 finding 2: item 7 names the five skills. Finding 3: item 11, "sync" 3. Finding 4 and section 5 finding 10: `/ordo-init` counts only the keys it derives as stated, as option (a) says; the form and each page's text are compared like any other (item 10, Decision 3, case R7). Finding 5: "(the user)", with or without a full stop (the shared item, Decision 10). Finding 6: R10 names the sentence of each skill that gives the reason.
- Section 3 finding 1: the premises are read at 8595fad. Finding 2: the sentence on eight wordings is gone.
- Section 4 finding 1: the two Quick start lines are written as their fences give them. Finding 2: the opening names a sub-bullet of a top-level bullet. Finding 3 and section 5 finding 9: a file is ruled when it is a template filled from the answers or has its full text in the ruling, a `README.md` among them (item 11, Decision 9). Finding 4: R10. Finding 5: part 6 of "Report". Finding 6: R6.
- Section 5 finding 1: the shared item and item 5 give the form of a text of several lines and what "is the ruled change" means. Finding 2: item 7's second sub-bullet holds the rule with its exception. Findings 3 and 4: item 9, Steps 2. Finding 5: item 10 Steps 1, item 11 "sync" 6, item 12. Finding 6: item 10, Rules 5. Finding 7: the cell of "The draft" in item 10. Finding 8: item 10, "Checking an existing file" 4. Finding 11: the fourth condition of item 11's Steps 4. Finding 13: the capability's draft in item 8's list. Finding 14: item 8, "add" 3. Finding 15: item 12, the second sub-bullet.
- Section 6 findings 1 to 5: the shared item (a name matched as written, a name held twice, a file that is neither of the two, a placeholder name, the path form) and case R4.
- Section 8 finding 1: each joined bullet is split. Finding 2: the rules of `grill` stand in the items they apply to. Finding 3: item 10, "Checking an existing file" 6 (Decision 5). Finding 4: the term's entry says what the file is (Decision 11). Finding 5: item 8, Steps 2. Findings 6 and 7: the sentences are shortened and the semicolons that joined rules are gone; those that remain long are named by "Verify" 9. Finding 8: the Quick start line of item 8. Finding 9: the cell of "The draft" in item 10 points at Steps 11.
- 5.22 of the first check (the commit rule in `sync`): Decision 14.

# Step 9a brief check, third run (on main at 46e7574)

The brief is not ready to dispatch as it stands. One point needs the user's ruling (Decision 9, section "Closures" U1), and the brief-level findings below include four where a fresh session following the changed text would stop a run the cases expect to pass, or stop at the wrong item:

- Section 5 finding 1: the shared item's "the file holds the name ... more than once" refuses the usual ruling, whose name also stands in a step's tag and under Step 0.
- Section 5 finding 2: roadmap Steps 2 lets an item replace ruled wording with the session's own, so `/roadmap add` stops on every run.
- Section 5 finding 4: the `sync` exception sits under item 6, after the stop of item 5.
- Section 8 finding 1: the two new `spec` bullets are placed between a bullet and the "for such a ruling" bullet that refers to it.

`git log --oneline -5` at the start: `5ad43ee`, `c57ebaa`, `93cdcb7`, `8595fad`, `f5692d6`. Main moved twice while I worked, to `fff4ec8` and then `46e7574`. `git diff --stat 8595fad HEAD -- skills docs README.md utils` prints nothing at `46e7574`, so every file the brief reads or writes is as it was at `8595fad`. The brief did not change while I worked (`cmp` against the copy I took).

`git status --short` at the end:

```
 M .scratch/2-e-grill/agents/reviews/9a-brief-check.md
?? .scratch/2-e-grill/agents/briefs/9a.md
```

Neither is mine. I wrote nothing in the repository. The scratch folder `$TMPDIR/ordo-9a-check3` is removed (`ls` prints "No such file or directory"). I did not read `.agents/worktrees/`.

The scratch folder held a copy of `skills/`, `docs/`, `utils/`, `README.md` and the 2.E state file. A script applied every item of "What to build" at the line its item names, taking the text from the brief's fences. Then `sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template` (exit 0), and `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (31502 bytes)` and `wrote docs/figures/plan-loop.svg (30745 bytes)` (exit 0). `diff -rq` against an untouched copy names fourteen files, the fourteen of "Paths this step writes".

Each finding ends with "brief" (closable in the brief within option (a)) or "user" (it changes what option (a) states).

## Closures of the second check

### The four findings marked "user"

**The figure (section 1 finding 1, section 2 finding 1): closed, inside option (a) in substance.**
- Place: item 4, Decision 6, the three figure paths.
- Option (a): "The README's sentence, the stops figure (`docs/figures/gen_figures.py` and its SVG) and the glossary's line say the stop waits each time "unless the run is under a quoted ruling that states the change"."
- The note reads "A stop marked "every run" does not wait when the run is under a quoted ruling that states the change." It carries "the run is under a quoted ruling that states the change" whole and leaves out "unless".
- Decision 6's "The figures carry option (a)'s words" is therefore not exact. Section 8 finding 3 gives a tested note that carries the clause word for word. brief.

**What `/ordo-init` counts as stated under `/repo-setup` (section 2 finding 4, section 5 finding 10): closed, inside option (a).**
- Place: Decision 3, item 10 Steps 11 fifth sub-bullet, case R7.
- Option (a): "`/ordo-init` inside it takes the same ruling and the keys it derives from the tree just written count as stated", and for `/ordo-init`: "covered when the ruling states the form, each key with its value, the `.gitignore` change, and the full text of each page to create; a page whose text the ruling does not hold is shown and the stop stands."
- The brief counts only derived keys. The verification page is no longer counted, and the form and the page texts are compared.
- Consequence, stated in R7: a ruling that meets option (a)'s three conditions for `/repo-setup` still meets `/ordo-init`'s approval stop unless it also states the form and the text of `docs/dev/building.md`.

**U1. `README.md` (section 5 finding 9): not inside the letter of option (a). user.**
- Place: Decision 9, item 11 Steps 4 third condition.
- Option (a): "every file of the draft comes from a template and the answers" and "A file that comes from no template is shown and the stop stands."
- The brief: "Every file of the draft is a template filled from the answers, or has its full text in the ruling."
- The second half lets a file from no template be written without the stop when the ruling holds its text. Option (a)'s second sentence has no such exception.
- What supports the brief: option (a)'s general rule "A draft that is the ruled change is written with no stop", and its `/ordo-init` clause on "the full text of each page to create".
- Read by the letter, no `/repo-setup` run is ever covered, since `README.md` has no template (`find skills/repo-setup/templates -maxdepth 1 -name 'README*'` prints nothing).
- The dictated condition also reaches further than Decision 9 says. It lets a build file, a fetched licence or a sibling page pass on the same terms, while Decision 9 speaks of `README.md` only.
- Smallest change: the user confirms one sentence, "a file from no template counts as ruled when the ruling holds its full text", and Decision 9 then says "a file", not "a `README.md`".

### The other findings of the second check

Section 1:
- 1.2 (`README.md` lines 113, 117, 124): closed. Decision 7 and case R10 name them.
- 1.3 (a run by hand): closed. Item 5 ("Steps / A ruling" 3) and item 6. The scope of those words is section 8 finding 2.
- 1.4 (**ruling**, **rulings file**, the plan template): closed. Item 1, third and fourth changes, and Decision 13.
- 1.5 (`grill` lines 226, 163, 104, 109): closed. Item 12: the Stops cell, "Writing what settled" 1, the two sub-bullets of Steps 10. The place of the new sub-bullet of item 1 is section 8 finding 5.
- 1.6 (`roadmap:103`): closed, item 8.
- 1.7 (`repo-setup:158`, third cell): closed, item 11.
- 1.8 (shared files): not a matter for the brief's text. The facts have changed, see section 1 finding 1.

Section 2:
- 2.2 (the five skills named in the rule): closed, item 7 "Rules".
- 2.3 (`sync`, both directions): closed, item 11 "sync" 3, and R8's three exit-1 inputs.
- 2.5 ("(the user)" with or without a full stop): closed. The shared item's fifth sub-bullet and Decision 10.
- 2.6 (the Rules sub-bullets not listed under "Decisions"): not closed. Section 2 finding 1.

Section 3:
- 3.1 (the header commit): closed as far as it can be. The header says `8595fad`, and nothing the step touches has moved since.
- 3.2 (the eight wordings): closed. The sentence is gone, and Decision 6 gives the width and the 35 characters (232.8 px at 6.6 px a character).

Section 4:
- 4.1 (the column sentence): closed, items 8 and 12 ("written as the fence gives it"). On the copy `grill`'s new line starts its text in column 65, as the three above it.
- 4.2 (the indent of a sub-bullet of a top-level bullet): closed, the opening of "What to build".
- 4.3 (R7's first case): closed. R7 now has the ruling hold the text of `README.md`. Section 5 finding 5 still stands against it.
- 4.4 (R10's reason for `roadmap` and `plan`): closed. The same gap is open for `sync`, section 4 finding 2.
- 4.5 (the terms sentence of "Report"): closed, Report part 6.
- 4.6 (R6's expected result): closed.

Section 5:
- 5.1 (a change of several lines): closed. Item 5's second new bullet and the shared item's fourth sub-bullet.
- 5.2 (rule and exception in one bullet): closed, item 7, second sub-bullet.
- 5.3 (a ruling in the rulings file): closed, item 9 Steps 2 and R5. Section 5 finding 6 is a remainder.
- 5.4 (two closing steps): closed, item 9.
- 5.5 (the draft takes the ruling's text): closed for `ordo-init` (Steps 1), `sync` 6 and `grill`. The place of the `sync` text is section 5 finding 4.
- 5.6 (Rules 5 "at once"): closed.
- 5.7 (the cell and the commit question): closed.
- 5.8 (a fix that differs): closed.
- 5.11 (a placeholder with no value): closed, the fourth condition of Steps 4.
- 5.13 (a capability map): closed, item 8 Steps 2 and R3.
- 5.14 (the stop "No gate"): closed.
- 5.15 (a ruled text that changes no gate): closed.
- 5.7, 5.12 and 5.16 reported walks that held. They still hold on the copy.

Section 6:
- Item 1 (a name with a quotation mark): closed. Shared item third sub-bullet, Decision 1, R4.
- Item 2 (two bullets of one name): closed in intent (Decision 12, R4). The words used refuse the usual ruling, section 5 finding 1.
- Item 3 (a file that is no ledger file): closed. The words "a template's placeholder" name no file, section 8 finding 9.
- Item 4 (no sub-bullets, or part of the change): closed, R4's last sentence.
- Item 5 (the path from another repository): closed, shared item first sub-bullet.
- Item 6: closed, as 2.5.
- Item 7: closed, as 5.13, 5.4, 5.11, 5.15.

Section 7: none then, none now.

Section 8:
- 8.1 (one rule per bullet): closed for each of the eight texts it named. Others remain, section 8 finding 7.
- 8.2 (where a rule goes, `grill`): closed, with section 8 finding 5.
- 8.3 (the message that lists the fixes): closed. "Checking an existing file" 6 and Decision 5.
- 8.4 ("ledger file"): closed. The term's entry, Decision 11, Conventions.
- 8.5 ("applied to that draft as to any other"): closed with the second check's own words. Those words leave section 5 finding 2.
- 8.6 (sentence length): not closed, section 8 finding 10.
- 8.7 (semicolons): closed. The 111 distinct dictated texts hold 9 semicolons in 2,404 words: 2 end bullets of `spec`'s list, 6 separate the "Stated in" places of the new entry, 1 stands in the existing form of **mark, of a figure**. None joins two rules.
- 8.8 (the Quick start line of `roadmap`): closed.
- 8.9 (`ordo-init`'s cell): closed ("as Steps 11 says").

From the second check's opening list:
- 5.22 (the commit rule in `sync`): closed by Decision 14.
- The five runs: closed. The brief's opening paragraph says where they are booked and that the landing waits on them.

## 1. Names

Commands: `git grep -n -c 'quoted ruling\|--ruling' -- skills docs utils README.md agents` (no output, exit 1: both names are new), `git grep -n -i 'every run\|each time' -- README.md docs skills utils`, `git grep -n -i "stops of their own\|second stop\|shown diff\|stop of its own" -- skills docs README.md utils` (the only sentences are `plan-orchestration:302` and `spec:198`, both changed), `git grep -n -i 'approv'` over the skills, the glossary template, the plan templates and `README.md`, each hit read.

1. Shared files with two steps now in flight. The dispatch blocks of plan 2.F (step 2b, launched 15:20, base `5ad43ee`) and plan 2.G (step 2b, launched 15:05, base `93cdcb7`) are on main.
   - `.scratch/2-f-diagnose/agents/briefs/2b.md` writes `skills/spec/SKILL.md` lines 112-114 (item 7: line 112 changed, "seven sub-bullets stand with the two that are there"), `skills/ordo-help/SKILL.md` lines 59-60 (item 8: two lines added after 59), `skills/plan-orchestration/SKILL.md` line 28, `plan-terms.md` line 104 and `docs/glossary.md` line 109.
   - `.scratch/2-g-git-guard/agents/briefs/2b.md` writes `skills/repo-setup/SKILL.md` line 126 (item 3: one sub-bullet becomes four) and `README.md` line 13.
   - Brief 9a lists five of those files whole and `ordo-help` as "lines 75-75".
   - Once the two steps land, by those items' own texts, 9a's line numbers move by about 7 in `spec` (197, 198, 215, 216, 224), 2 in `ordo-help` (75) and 3 in `repo-setup` (158 to 163, 181). The `repo-setup` lines before 126 stay.
   - Smallest change: the brief is prepared after those two landings with its numbers rerun, or the comparison of `spec` Steps 5 is made and `shared_paths:` written. Which of the two is in "Declined to judge". brief.
2. Inside the paths, left as it is: `docs/figures/gen_figures.py:381`, `(EVERY_RUN, "it waits on you each time it runs")`. The note one row under it states the exception, so the figure does not say two things. No change needed. Listed because the grep prints it.
3. No other hit is made false. The approval sentences outside the changed lines each hold under "a quoted ruling is the user's approval", which R10 has the builder record. They are:
   - `roadmap` lines 3, 10, 16, 17;
   - `plan` lines 3, 15, 95, 101;
   - `ordo-init` lines 3, 10, 15;
   - `repo-setup` lines 3, 10, 59, 64, 95, 104;
   - `plan-terms.md`, **sync** and **stop**;
   - `README.md` lines 113, 117, 124, and the skill table;
   - `ordo-help` line 55.

## 2. The step line

Every clause of option (a) and of the ruling "Approval stops under a ruling" has an item:
- The invocation form: the five Quick start lines.
- What a quoted ruling is: the shared item in five skills and item 1.
- Who writes it: item 5 and item 7.
- The per-skill rules: items 8 to 12.
- The record: `roadmap` Steps 5, `plan` Steps 6, `ordo-init` Steps 14 and "Checking an existing file" 6, `repo-setup` Steps 12 and "sync" 9, `grill` Steps 10.
- The pages that say "every run": items 2, 3 and 4.
- The rule that names the five skills: item 7.
- The check: the five runs are the orchestrator's, as the brief's opening says.

1. Additions beyond option (a) that "Decisions" does not list.
   - The Rules sub-bullets of items 10, 11 and 12 ("is that approval", "is the user's answer to the roadmap diff").
   - The exit-2 draft of `sync` (item 11, "sync" 6 and its cell). Option (a) names the hunks only. The first ruling's "at each approval stop" covers it.
   - "or has its full text in the ruling" for every file of `/repo-setup`'s draft (U1).
   - Smallest change: one Decision line for each of the first two. brief.

## 3. Premises

Every line number, count and quoted sentence of "What is on the tree" was rerun with `sed -n '<n>p'` and `awk` for the columns, at `fff4ec8` and again valid at `46e7574`. The lines checked:
- `plan-orchestration`: 290, 301, 302, 332.
- `spec`: 197, 198, 215, 216, 224.
- `ordo-help`: 75, text in column 31.
- `roadmap`: 14 to 22, column 43, 40, 46, 47, 49, 50, 67 to 70, 103, 117, 118, 130, 132, 133.
- `plan`: 41, 49 to 66, 76 to 78, 84.
- `ordo-init`: 31, 38 to 41, 46, 60 to 64, 79, 80, 85 to 87, 95 to 97, 103 to 108, 119, 124.
- `repo-setup`: 34, 40, 48, 58, 64 to 67, 83 to 88, 94 to 96, 104, 109, 158 to 163, 181.
- `grill`: column 65, 53, 103 to 112, 177 to 182, 226, 247.
- `plan-terms.md`: 20, 51, 74, 75, 91, 92.
- `docs/glossary.md`: 133.
- `README.md`: 54, 113, 117, 124.
- `gen_figures.py`: 372, 377 to 390, 381, 410, 559.

All match, except the three below.

The figure premise reproduces: with item 4 applied the script exits 0 and writes `viewBox="0 0 1040 988"` and `viewBox="0 0 1040 911"`. `ls docs/adr` prints `README.md` and `template.md`. Verify 1's command on main printed the eleven `$ <command>` lines and `checks: 11 commands passed`, exit 0.

1. "What is on the tree", `repo-setup` bullet: "(`find skills/repo-setup/templates -name 'README*'` prints nothing)". It prints `skills/repo-setup/templates/docs/adr/README.md`. The claim it supports holds for the repository's own `README.md`. Smallest change: `find skills/repo-setup/templates -maxdepth 1 -name 'README*'`, which prints nothing. brief.
2. `grill` bullet: ""Steps / Writing what settled" 1 at lines 163 to 165". The item runs from 163 to 168; its last line, 168, is "The item is done when the file, read back, holds the bullet whole." Smallest change: "at lines 163 to 168, its last line the completion line". This bears on section 8 finding 5. brief.
3. `roadmap` bullet: "its second sub-bullet "A gate that could ... is redrafted and asked again."". It is the first sub-bullet of "add" 3 (line 68). Item 8 places by the quoted text, so nothing moves. Smallest change: "its first sub-bullet". brief.

## 4. Cases and checks

Results on the scratch copy:
- Verify 2: 147 texts checked, each written as the one line of a pattern file, `grep -c -F -f`. 145 print what the brief expects, including 1 in each of the five skills for each of the seven lines of the shared item. The other two are finding 1.
- Verify 3: the glossary check prints `ok: the plan-terms block equals the template`, exit 0. The figure script exits 0 under `python3` (3.13) and `/usr/bin/python3`, and a second run leaves both SVGs byte-equal (`cmp`). Fourteen files differ.
- Verify 4: `LC_ALL=C grep -n '[^ -~]'` prints nothing and exits 1 for each of the fourteen files.
- Verify 5: nothing, exit 1.
- Verify 6: `ordo-help` 1, `grill` 10, `roadmap` 12, `plan` 9, `spec` 2, `plan-orchestration` 3, `ordo-init` 19, `repo-setup` 16, `plan-terms.md` 4, `docs/glossary.md` 5, `README.md` 1, `gen_figures.py` 1, each SVG 1.
- Verify 7: each added line stands at the indent the opening of "What to build" gives (3 under one-digit items, 4 under two-digit ones, 2 under top-level bullets, 5 for the nested ones of `plan` Steps 3, `repo-setup` Steps 4 and `spec` "Steps / A stop").
- `sync_rules.test.sh` on the copy: `PASS: sync_rules.py scratch tests`.

Every "Verify" command is a `grep`, `git grep`, `git diff`, `python3` or `rsvg-convert` call with quoted patterns, and runs the same under zsh and sh on macOS. `rsvg-convert` is at `/opt/homebrew/bin/rsvg-convert`.

Case R12: both figures rendered and read. The note stands under the legend's row, inside the canvas (baseline 972 of 988, and 880 of 911). `diff` of each SVG against the original shows only the two size lines and the one added text line, so no box moved.

No case contradicts the rules file: the step is text with one script line, the cases are readings, and the ruling "Open item A" gives the figure script no test.

1. Verify 2: "a sub-bullet this brief gives twice in one skill (the two on the commit message and the list in `repo-setup`) prints 2 there".
   - On the copy, "When no commit is made, the list of files the stop shows names the ruling the same way." prints 2.
   - The two commit-message sub-bullets differ ("A setup written ..." in Steps 12, "A change written ..." in "sync" 9) and print 1 each.
   - A builder who reads the sentence as both sub-bullets reports a red row the brief made.
   - Replacement: "the sub-bullet "When no commit is made, the list of files the stop shows names the ruling the same way." stands twice in `repo-setup` and prints 2 there". brief.
2. Case R10: "for `ordo-init`, `repo-setup` and `grill` their Rules sub-bullets of items 10 to 12 say so".
   - `repo-setup`'s sub-bullet is "A quoted ruling that covers the draft as Steps 4 says is that approval", which is the setup.
   - For the `sync` sentences (`repo-setup` line 3 "rewrites them after approval", line 95 "after the approval", line 104, `plan-terms.md` **sync**, `README.md:117`) the builder has no line to name.
   - Replacement: add "and for `sync` the sub-bullets of "Steps / sync" 3 and of the item that holds the exit-2 exception". brief.
3. Conventions: "`ruff format --check docs/figures/gen_figures.py` and `ruff check docs/figures/gen_figures.py` print what they print on the unchanged file."
   - The repository has no ruff configuration (`ls ruff.toml pyproject.toml .ruff.toml`: none). Bare, the first prints "1 file would be reformatted" before and after, with a diff whose line numbers differ. The second prints one `RUF007` before and after.
   - Neither sees the file's own limit. Step 12a's brief checked the script with `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100`, to which its repair round added `--target-version py39`.
   - On the unchanged file that command prints "All checks passed!" and `ruff format --check --line-length 100` prints "1 file already formatted". With item 4 as dictated it prints `E501 Line too long (102 > 100)` and `E501 Line too long (112 > 100)`.
   - Replacement: name those two commands with their expected output. The text that passes them is section 8 finding 3. brief.
4. Case R4 has no input for the usual ruling, whose name also stands outside its bullet. Section 5 finding 1 gives it. brief.

## 5. The question

Verify 1 to 8 show that the dictated lines are in the files, once, in ASCII, at the right indent, and that the figures draw. They pass on any tree that holds the text. The goal rests on the builder's walks of R2 to R9 and on the five runs by fresh agents, which follow `/roadmap` only. For `/plan`, `/ordo-init`, `/repo-setup`, `sync` and `/grill` no fresh session follows the text before the landing. That is what option (a) ruled.

Below are the points where my walk on the copy, using the skills' text alone, stops a run the case expects to pass, has no rule, or finds two sentences that disagree.

1. The shared item, fifth sub-bullet: "when the file holds the name nowhere or more than once".
   - A ruling's name usually stands in the ledger file more than once: in its bullet, in the step tag `(ruling <name>)`, and under the step's Step 0, where `spec` "Steps / A stop" puts the open item.
   - `grep -c -F 'Step 9a, how a skill is given the ruling and what the ruling must hold' .scratch/2-e-grill/plan.md` prints 4. "Approval stops under a ruling" prints 5.
   - Read as written, such a ruling is "no ruling", and every stop stands. R4's "a name the file holds twice" passes while the usual case fails.
   - Replacement for the sub-bullet, as a list, which also closes section 8 findings 9 and 10 for this text:
     ```
     - There is no ruling in any of these cases.
       - The file does not exist, or is neither of those two files.
       - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
       - The name is a placeholder in angle brackets, such as `<L>`.
       - The bullet's first line does not end with "(the user)", with or without a full stop after it.
     ```
   - "Its seven lines", item 12's "its six sub-bullets" and Verify 2's "six sub-bullets" then change their counts.
   - R4 gains: "a name that also stands in a step's tag and under Step 0, with one bullet of that name: a ruling". brief.
2. Item 8, Steps 2, second sub-bullet: "Each item of the command's subsection is then worked on that draft: what the item would draft differently replaces the ruled text, and Steps 4 finds the difference."
   - "add" 1 reads "From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences." "add" 4 and 5 write reasons in the session's words.
   - A session's own wording of a title, a goal or a reason differs from the ruled wording on every run. The sentence tells it to put its own in place of the ruled text, and Steps 4 then keeps the stop.
   - "add" 3 has the sentence "the ruled gate is not redrafted". The title, the goal and the reasons have none.
   - R3's first case ("the draft is the ruled entry, no stop") passes only for a reader who assumes the ruled wording is kept.
   - Replacement, three sub-bullets:
     ```
     - Each item of the command's subsection is then worked on that draft.
     - An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form, and Steps 4 finds the difference.
     - The ruled wording of the title, the goal, the gate and the reasons is kept.
     ```
   - The same limit is missing in item 10, Steps 1 ("and Steps 1 to 9 are worked on it as on any other"), where Steps 3 and 4 draft pages in the session's words.
   - Replacement there, two sub-bullets: "Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts." and "Steps 2 to 9 replace a ruled part only where a rule of this skill gives another result, and Steps 11 finds the difference." brief.
3. Item 5 against item 7, which option is meant.
   - Item 7: "After the user's ruling on an option that states the change, the session books the ruling ...".
   - Item 5: "a ruling on an option that runs a skill with an approval stop is written ... and is the quoted ruling", and "After a ruling on an option that runs a skill, that skill is run first, with `--ruling`".
   - Item 6 and the **ruling** entry of item 1 have the same unlimited form.
   - An option may instead name the skill's approval stop as a stop of its own (item 7, second sub-bullet). For that option `spec` and `ordo-help` still have the session write a quoted ruling with nothing under it and run the skill with `--ruling`.
   - The run then stops, as R4's last input says, so nothing unruled is written. The two skills still state different conditions.
   - Replacements:
     - Item 5, first bullet: "a ruling on an option that runs a skill with an approval stop and states the change in full is written ...".
     - Item 5, the sub-bullet of 3: "After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`."
     - Item 6: "after a ruling on an option that runs a skill and states the change, that skill is run with ...".
     - Item 1, **ruling**: "A ruling on an option that runs a skill with an approval stop and states the change is written there ...". brief.
4. Item 11, "sync" 6: the three sub-bullets stand under "6. Write it once the user approves."
   - The stop is one item earlier: "5. Show the drafted change ("Stops")."
   - A session that works the items in order stops at 5 and never reaches the exception. In every other skill of this brief the exception stands in the item that carries the ("Stops") mark (`roadmap` 4, `plan` 3, `ordo-init` 11, `repo-setup` 4, "sync" 3).
   - R8's exit-2 case passes for a reader who has read item 6 first.
   - Replacement: ""sync" 5 gains three sub-bullets", the first reading "Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text, and the rules of Steps / sync 4 are worked on it." The cell then ends "(Steps / sync 5)". brief.
5. Item 11, Steps 4, third condition: "Every file of the draft is a template filled from the answers, or has its full text in the ruling."
   - "The tree", which Steps 3 drafts "every file with its full text", holds three files another tool writes: `.agents/plan.yaml` and `docs/dev/building.md` ("written by /ordo-init") and `skills-lock.json` ("written by the skills CLI").
   - None is a template filled from the answers, and the CLI's file cannot have its text in a ruling. Read as written the condition fails on every setup with project skills. For the two `/ordo-init` files it asks for texts that `/ordo-init`'s own comparison already covers.
   - R7's first case expects "no stop at Steps 4".
   - Replacement: "Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling. The files `/ordo-init` drafts and the file the skills CLI writes are not counted."
   - The next sub-bullet then opens "Each file that is neither a filled template nor held in the ruling (...)". As dictated, its "neither" has no pair in its own bullet. brief.
6. Item 9, Steps 2: "A quoted ruling that stands in the rulings file is copied with its sub-bullets, which are not lines left to place."
   - Item 5 has a text of several lines written "as a fenced block indented with its sub-bullet".
   - The fence lines are neither bullets nor sub-bullets, so by line 52 of `plan` they are lines "shown with the draft at Steps 3; the user places it". The fourth condition of Steps 3 ("No line of the rulings file is left to place") then fails.
   - Replacement: "A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place." brief.
7. Item 12, "Writing what settled" 3: "Under a quoted ruling ... the draft takes the ruled text", "A draft that is still the ruled text is written at once".
   - The item drafts only when "An answer that changes the entry's goal, gate or text" exists. No sentence says when the draft is made under a quoted ruling if no answer of the interview has changed the entry yet.
   - The ruled text is then either never written or written at a moment the session picks.
   - R9 ("the roadmap diff that is the ruled text ... is written") does not say which.
   - Replacement for the first sub-bullet: "Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8 and takes the ruled text." The next sub-bullet then opens "The rules of this item are worked on it, and a draft that is still the ruled text is written at once, unless ...". brief.
8. Item 9, Steps 6: "names the ruling in the commit message, by its name and its ledger file."
   - When the ledger file is the entry's rulings file, the same commit removes that file (Steps 6, third sub-bullet).
   - The commit then names a file it deletes, while the bullet lives on in the new `plan.md`. No rule is broken, since option (a) says "by its name and its ledger file".
   - Smallest change, if wanted: "by its name and its ledger file, which is the new `plan.md` when Steps 2 copied the ruling from the rulings file". brief.

The other walks hold on the copy as the cases say:
- R2: both skills, the by-hand line in `spec` and `ordo-help`, no sentence left that the approval stop always stays.
- R3: the gate that could pass, the place too early, the capability map, `move`, `done`, `drop`.
- R4: the other inputs.
- R5: the four conditions, one closing step, the bullet once.
- R6: the three commit cases, a page's text missing, two roadmap candidates, the check of an existing file; Rules 1 and 5 agree with Steps 11.
- R7: `/ordo-init` not stopping at its Steps 2 or 6 and stopping at 11 without the form and the page text.
- R8: the three exit-1 inputs.
- R9: no Rulings bullet, Steps 9 ends, Steps 10 lists and names; the cell and the Rules bullet agree.

## 6. Implied inputs

The step is text, with one added call in a script that has no test by the ruling "Open item A". The script's own check covers the one input the call adds: a note too wide exits 1 with "a note ... does not fit one line". Nothing checks that a note lies inside the canvas; case R12's reading of the render does.

Inputs the reading cases leave out, each with what a wrong answer costs:

1. A name that also stands outside its bullet (section 5 finding 1). Cost: every stop stands, which is what the step exists to end. Expected: a ruling. brief.
2. `--ruling` with the file and no name, or with `--bar` after it in `/grill`. The shared item reads "when the invocation ends with `--ruling <ledger file> "<name>"`" and gives no rule for a malformed ending. Cost: a second stop. Expected: no ruling, and the skill says so. One more input in R4 closes it. brief.
3. A rulings file as the ledger file of `/plan`, removed by the commit that names it (section 5 finding 8).
4. A fenced block under a sub-bullet of a quoted ruling in the rulings file (section 5 finding 6).

## 7. ADRs

`ls docs/adr` prints `README.md` and `template.md`. No `NNNN-*.md` record exists, so none touches the step, as the brief says. Findings: none.

## 8. Dictated text

Claims about the tree and about other skills, each read on the copy; all hold:
- "the `spec` skill's "What it reads" 4" (`spec:44`).
- The seven "Stated in" places of **quoted ruling**, each holding the term after the change.
- The alphabetical place between **questions, the** and **reader, of the transcripts**.
- ""## Gate"", "Steps 2 copied it from the rulings file", "No line of the rulings file is left to place" (`plan` 52, 53, 63).
- "the stop "No gate"", "the stop of Steps 4" (`roadmap`).
- "the stop "No commit allowed"", "`repo-setup`'s Steps 12", "Steps 10 shows", ""Steps / Checking an existing file" 4" (`ordo-init`).
- "every question of "The questions"", "Steps 3 lists" (`repo-setup` 48).
- "("What it reads" 11)" and Steps 10 (`grill`).
- The column 31 of the `ordo-help` line.
- The three height and size claims of item 4.

No skill description passes 1,024 characters (the layout's command, run on the copy, prints none above it).

1. Item 5, "two bullets after the bullet at line 215".
   - Line 216 reads "for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it". Its "such a ruling" is line 215's "a ruling that adds or splits a step".
   - With the two new bullets between them, "such a ruling" reads as the ruling on an option that runs a skill, which has no step tag.
   - The rules file's rule 17 asks that a change keep the scope of every rule it moves.
   - Smallest change: "two bullets after the bullet at line 216". brief.
2. The scope of the `spec`, `ordo-help` and **ruling** texts: section 5 finding 3.
3. Item 4.
   - The file's longest line on main is 100 characters (`awk`), and step 12a's ruff command passes on it.
   - The dictated docstring line is 102 characters. The dictated string line is 112.
   - The note also leaves out option (a)'s "unless".
   - Tested on a copy: the text below keeps the file at 100, prints "1 file already formatted" and "All checks passed!" under the two commands of section 4 finding 3, exits 0, and draws "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change." in both figures.
   - Docstring: `"""The three marks and the dashed box with what each says, on one row, and a note under it."""` (98 characters with its indent).
   - Call:
     ```
     draw_note(
         canvas,
         x,
         y + 48,
         'A stop marked "every run" waits each time, unless the run is under a quoted ruling that '
         "states the change.",
         width,
     )
     ```
   - R12's "holds the note's sentence once" then names the new sentence. brief.
4. Completion criterion and qualifiers (`skill-layout.md`: "a qualifier that changes the rule ... stays in the same bullet as the rule").
   - Item 9, Steps 3: "Each step and its check are the ruling's." has its qualifier two bullets on, "The closing step `/plan` writes itself is no difference from the ruled list." Replacement for the condition: "Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison." The separate sub-bullet goes.
   - Item 10, Steps 11: the comparison's qualifier "Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated." stands four bullets after the comparison. Replacement: move it to second place, right after "Under a quoted ruling, compare the draft ...". brief.
5. Item 12: ""Steps / Writing what settled" 1 gains one sub-bullet, after its last".
   - The last sub-bullet of item 1 is its completion line, "The item is done when the file, read back, holds the bullet whole."
   - `skill-layout.md`, "Writing for an agent": "Each item of Steps ends on its completion criterion".
   - Smallest change: "one sub-bullet before its completion line". brief.
6. How a step of the same or another skill is named.
   - `roadmap` writes `Steps / add 3` with no quotation marks (lines 48, 62, 66, 69). Item 8, Steps 4 dictates `"Steps / add" 3`.
   - `repo-setup` writes `Steps / sync 4` (lines 161 to 163). Item 11 dictates `"sync" 4 and 5`.
   - Replacements: `Steps / add 3` and `Steps / sync 4`. brief.
7. One rule per bullet (`skill-layout.md`, "Lists and tables"). Two requirements joined by "and", each breakable alone:
   - item 8 "add" 3, both sub-bullets ("is not redrafted, and its answer and its reason stand", "keeps the stop of Steps 4, and the stop "No gate" is not raised");
   - item 10 Steps 1 (closed by the replacement of section 5 finding 2) and Steps 2 ("the key is the ruling's and that stop is not raised");
   - item 11 Steps 8 ("is run with the same `--ruling` arguments and skips the stops") and "sync" 6, first sub-bullet;
   - item 12 "Writing what settled" 3, first sub-bullet.
   - Item 9 splits the same shape ("... the step list is the ruling's ..." and "The rest of this step is worked on that list."), so the brief is not of one form.
   - Smallest change: each split as item 9's is. brief.
8. One verb for one relation (prose standard D, "No synonym cycling").
   - The ruling "states" a key, a change or a fix, and "holds" a text or a hunk. That follows option (a)'s own use.
   - Item 8's cell "no quoted ruling gives the entry's number" adds a third verb. Replacement: "no quoted ruling states the entry's number". brief.
9. The shared item: "when the name is a template's placeholder". It names no template and no form. A fresh session cannot tell which names are meant. Replacement in section 5 finding 1 ("a placeholder in angle brackets, such as `<L>`"). brief.
10. Sentence length (prose standard E, "under roughly 20 words unless the mechanism needs more"). Verify 9 has the builder name long sentences and keep them, so the length is settled in the brief or not at all. Over 30 words, by a count over the dictated texts:
    - the shared item's fifth sub-bullet (55, closed by the list of section 5 finding 1), its fourth (32) and third (31);
    - item 8 Steps 2 first (52);
    - item 7 second (44);
    - item 11 Steps 4 last (41);
    - item 5 first bullet (39);
    - item 10 Rules 5 (39), Steps 11 first (35), Steps 14 second (33), Steps 1 (33, closed by section 5 finding 2);
    - item 5 "Steps / A stop" first (35, the existing sentence shortened);
    - item 9 Steps 3 last (31);
    - item 12 "Writing what settled" 3 first (31).
    - Replacement for the 52-word one, three sub-bullets: "Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text." / "For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map." / "For `move`, `done` and `drop` it is the change the ruling states." brief.

## Newly broken

Texts the rewrite added or changed that are wrong where the second check had none or had them right. Each is detailed in the section named.

1. Verify 2's sentence on the sub-bullet that prints 2 (section 4 finding 1).
2. The premise command `find skills/repo-setup/templates -name 'README*'` "prints nothing" (section 3 finding 1).
3. The premise "lines 163 to 165" for `grill` item 1, and with it the place "after its last" (section 3 finding 2, section 8 finding 5).
4. Item 4's two lines past the script's 100 characters, and the Conventions sentence whose ruff commands cannot see them (section 4 finding 3, section 8 finding 3).
5. "the file holds the name nowhere or more than once", written to close the second check's section 6 item 2 (section 5 finding 1).
6. "sync" 6's first sub-bullet, written to close 5.5 and placed after the stop (section 5 finding 4).
7. "a template's placeholder" (section 8 finding 9).
8. The third condition of `repo-setup` Steps 4 against the three files other tools write, and Decision 9 narrower than the text it explains (section 5 finding 5, U1).
9. Line numbers: none fails on main at `46e7574`. The numbers of `spec`, `ordo-help` and `repo-setup` move once the two steps in flight land (section 1 finding 1).

No item contradicts another beyond section 5 finding 3 (item 5 against item 7). The counts the brief states of itself hold: fourteen files, eight `SKILL.md` files, seven lines of the shared item, eleven verify commands.

## Declined to judge

- Whether step 9a is prepared before or after steps 2b of plans 2.F and 2.G land, and how the landings merge: the orchestrator's judgment under `spec` Steps 5 and `plan-orchestration` "Two steps in flight". I did not read the worktrees.
- Whether option (a)'s words fit every "every run" mark. The README sentence, the glossary line and the figure note say such a stop does not wait "when the run is under a quoted ruling that states the change". `grill`'s "The end", the rest of "A round", and `ordo-init`'s commit question wait under a quoted ruling all the same. The words hold when "the change" is read as the change that stop would show. They are the user's ruled words.
- Decision 2 (`(approved)` on a plan written under a ruling, **authority** left as it is), Decision 4 (the stop "A missing dependency" stays, against option (a)'s "the dependencies are taken from the ruled entry") and Decision 8 (no version change): the user's, as the second check left them.
- Whether a "(the user)" ending proves a bullet is the user's: the design the user ruled.
- I made no run as a fresh session in a scratch repository, since that needs `git init` and commits. The walks are readings of the scratch copy's text.
- The five runs of option (a)'s check: not made, they are the orchestrator's.
- The split of the brief's own note wording across two string literals was not run. The note wording of section 8 finding 3 was.
- My tokens, tool uses and time: not visible to me (not verified).

Files: brief `/Users/axelfaes/workspace/ordo/.scratch/2-e-grill/agents/briefs/9a.md`; second check `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/9a-bc2.md`; rulings `/Users/axelfaes/workspace/ordo/.scratch/2-e-grill/plan.md`.

Agent usage: claude-opus-5-5 (ordo-high), 365066 tokens, 53 tool uses, 1059 s ($3.41 to $10.02).

## Closed (third check; the session's change to the brief for every finding of it)

- U1 (a file from no template): raised to the user as the open item "Step 9a, a file of `/repo-setup`'s draft that comes from no template"; Decision 9 says so, and item 11 is written as its option (a) until the ruling.
- The figure: item 4 holds the note "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change.", the docstring of 98 characters and the call split over two string literals; tried on a scratch copy (exit 0, `viewBox` 988 and 911, the two `ruff` commands pass, no line over 100). Decision 6 quotes option (a)'s words.
- Section 1 finding 1 (shared files with steps 2b of plans 2.F and 2.G): the brief is prepared after those two steps land, with every line number of "What is on the tree" rerun on main then.
- Section 2 finding 1: Decisions 15 and 16; the third addition is U1.
- Section 3 findings 1 to 3: the `find` command has `-maxdepth 1`; `grill` item 1 is at lines 163 to 168 with its completion line named; `roadmap`'s sub-bullet is the first.
- Section 4 finding 1: Verify 2 names the one sub-bullet that prints 2. Finding 2: R10 names Steps / sync 3 and 5. Finding 3: "Conventions" and Verify 8 give the two `ruff` commands with their output. Finding 4: R4 has the name that also stands outside its bullet.
- Section 5 finding 1, section 6 findings 1 and 2, section 8 findings 9 and 10 for the shared item: the item is fourteen lines, its "no ruling" cases a list of five, among them two bullets of one name, a placeholder in angle brackets and `--ruling` without its two arguments last (Decisions 12 and 17, R4).
- Section 5 finding 2: `roadmap` Steps 2 and `ordo-init` Steps 1 keep the ruled wording and replace a ruled part only where a rule of the skill gives another result (Decision 18, R3). Finding 3 and section 8 finding 2: `spec`, `ordo-help` and the entry **ruling** say "and states the change". Finding 4: the exception of `sync` stands under item 5, which carries the stop, and the cell names Steps / sync 5. Finding 5: the third condition of `repo-setup` Steps 4 counts the files the skill writes, and the next sub-bullets name their pair. Finding 6: `plan` Steps 2 copies every line under the bullet, fenced blocks included. Finding 7: `grill` makes the draft at the first write of Steps 8 (R9). Finding 8: `plan` Steps 6 names the new `plan.md` when the ruling came from the rulings file (R5).
- Section 8 finding 1: the three bullets of `spec` stand after line 216. Finding 3: as the figure above. Finding 4: the qualifier of `plan` Steps 3 is in its condition, and that of `ordo-init` Steps 11 stands third, after the comparison. Finding 5: the sub-bullet of `grill` item 1 stands before its completion line. Finding 6: `Steps / add 3` and `Steps / sync 4` are written as the two skills write them. Finding 7: each joined bullet is split. Finding 8: the cell says "states". Finding 10: each sentence over 30 words is split, except the second sub-bullet of item 7, kept for the reason Decision 19 gives.
- Declined to judge: the five runs stay the orchestrator's before the landing; Decisions 2, 4 and 8 stay booked for the user to overrule.

# Step 9a brief check, fourth run (brief read on main at f249dc4; main at 56069bb when I finished)

The brief is not ready to dispatch as it stands. Three brief-level findings change what a fresh session does, and none needs a new ruling:

- **Section 5 finding 1.** `/repo-setup` has no sentence that drafts a file from the ruling's text, so a run the ruling covers still stops at Steps 4.
- **Section 5 finding 2.** `/plan` has no sentence for the `(approved)` tag under a quoted ruling.
- **Section 5 finding 3.** R7 and Decision 3 leave out four keys that `/ordo-init` does not derive from the tree.

The other findings are smaller. Every finding below is marked "brief"; I found none that is "user".

State of the run:
- `git log --oneline f249dc4..HEAD` prints `56069bb` and `9ae8631`, both plan 2.F ledger commits. `git diff --stat f249dc4 HEAD -- skills docs README.md utils agents` prints nothing, so every file the brief reads or writes is as at f249dc4.
- `cmp` of the brief against the copy I took at the start reports no difference.
- `git status --short` at the end prints only ` M .scratch/2-e-grill/agents/briefs/9a.md`, which is not mine. I wrote nothing in the repository and did not read `.agents/worktrees/`.
- The scratch folder `$TMPDIR/ordo-9a-check4` is removed: after `rm -rf`, `ls` prints `No such file or directory`.

What ran on the scratch copy (`skills/`, `docs/`, `utils/`, `README.md`, the 2.E state file):
- A script applied every item of "What to build" at the anchor its item names, with the text of the brief's fences. It reported `problems: 0`: every anchor was found exactly once.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`, exit 0. Without `--write` it printed `ok: the plan-terms block equals the template`, exit 0.
- `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (31507 bytes)` and `wrote docs/figures/plan-loop.svg (31164 bytes)`, exit 0. The `viewBox` values are `0 0 1040 988` and `0 0 1040 911`. A second run left `pipeline.svg` byte-equal (`cmp`).
- The `ruff check` command of "Conventions" printed `All checks passed!`. The `ruff format --check` command printed `1 file already formatted`. The longest line of the script is 100 characters (`awk`).
- `diff -rq` against an untouched copy names fourteen files, the fourteen of "Paths this step writes" without the report.
- Both figures were rendered with `rsvg-convert` and read. The note stands under the legend's row, inside the canvas, at baseline 972 of 988 and 880 of 911. `diff` of each SVG shows only the two size lines and the one added text line, so no box moved.

## Closures of the third check

- **U1 (a file from no template): closed, with a remainder.** The ruling is in `plan.md` Rulings, Decision 9 cites it, and the third condition of `repo-setup` Steps 4 matches it. The remainder is section 5 finding 1.
- **The figure: closed.** The outputs are above.
- **Section 1 finding 1 (shared files): not closed as worded.**
  - Step 2b of plan 2.F has landed, and the line numbers reproduce.
  - Step 2b of plan 2.G is still in flight: the dispatch block of `.scratch/2-g-git-guard/orchestrator-state.md` holds `step: 2b`, `launched: 2026-09-30 15:05`, `landing: not-started`.
  - What remains is under "Shared files with step 2b of plan 2.G" below.
- **Section 2 finding 1: closed.** Decisions 15 and 16. A new addition of the same kind is section 2 finding 1.
- **Section 3 findings 1 to 3: closed.** `find skills/repo-setup/templates -maxdepth 1 -name 'README*'` prints nothing. `grill` item 1 is at lines 163 to 168. The `roadmap` sub-bullet is the first.
- **Section 4 findings 1 to 4: closed.**
  - The sub-bullet "When no commit is made, the list of files the stop shows ..." prints 2 in `repo-setup` on the copy.
  - R10 names Steps / sync 3 and 5.
  - The two `ruff` commands are dictated and pass.
  - R4 holds the name that also stands outside its bullet.
- **Section 5 finding 1 with section 6 findings 1 and 2: closed.** The shared item is fourteen lines, and each prints 1 in each of the five skills. The wording of its sixth line is section 5 finding 4.
- **Section 5 finding 2: closed** for `roadmap` Steps 2 and `ordo-init` Steps 1.
- **Section 5 finding 3 with section 8 finding 2: closed.** `spec`, `ordo-help` and **ruling** all carry "and states the change".
- **Section 5 finding 4: closed.** The exception stands under "sync" 5, and the cell names Steps / sync 5.
- **Section 5 finding 5: closed.** The remainder is section 5 finding 1.
- **Section 5 findings 6 and 7: closed.**
- **Section 5 finding 8: closed in the text.** It is not listed under "Decisions" (section 2 finding 1).
- **Section 8 finding 1: closed.** The three bullets follow line 226, so "for such a ruling" keeps its referent.
- **Section 8 findings 3 to 9: closed.**
- **Section 8 finding 10: not closed, and newly broken.** Four dictated sentences are still over 30 words, and Decision 19 names the wrong sub-bullet (section 8 finding 1).

## 1. Names

Commands, on main:
- `git grep -n -c 'quoted ruling\|--ruling' -- skills docs utils README.md agents` prints nothing, exit 1. Both names are new.
- `git grep -n 'stay stops of their own' -- skills docs README.md utils agents` prints `plan-orchestration:302` and `spec:208` only. Both are changed.

Commands, on the copy after the change:
- `grep -rn -i 'stops of their own\|second stop\|stop of its own\|shown diff\|approval stop'` prints hits only in files of the paths.
- `grep -rn -i 'every run\|each time'` prints no hit outside the paths that the change makes false.

1. `skills/roadmap/SKILL.md` line 107, inside the paths and untouched by item 8: "- **No insertion form yet.** A stop ("Stops")."
   - Item 8 qualifies the parallel line 103 ("with no quoted ruling that does") and the Stops cell ("and no quoted ruling states the entry's number"). Line 107 keeps the unqualified rule.
   - Rule broken: rules file 19, a change leaves no two statements that contradict.
   - Consequence: a session that reads "The format is the file's" at Steps 1 raises the stop for a ruled number, where R3 expects none.
   - Replacement, one more change in item 8 and one more premise for line 107: `- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.` brief.
2. No other hit is made false. The approval sentences outside the changed lines each hold under the sentences R10 names. They are `roadmap` 3, 10, 16, 17; `plan` 3, 15; `ordo-init` 3, 10, 15, Steps 12, "Checking" 5; `repo-setup` 3, 10, Steps 5, "sync" 3 and 6; the entries **sync** and **authority**; `README.md` 17, 35, 113, 117, 124; `ordo-help` 55.

## 2. The step line

Every part of the step line and every clause of the three rulings has an item, except the two clauses named in section 5 findings 1 and 2.

1. An addition beyond option (a) that "Decisions" does not list: item 9, Steps 6, "When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`."
   - Option (a) says "by its name and its ledger file". The brief changes which file that is for one case.
   - Replacement, a new Decision: "20. The commit of a plan whose quoted ruling came from the entry's rulings file names the new `plan.md`, since the same commit removes the rulings file." brief.

## 3. Premises

Every line number, count, column and quoted sentence of "What is on the tree" was rerun with `sed -n`, `awk`, `grep -n`, `find` and `ls`. All reproduce, except the two wordings below; neither moves an item. Among those that hold:
- `plan-orchestration` 290, 302, 332; `spec` 207, 208, 225, 226, 234; `ordo-help` 77 with its text in column 31.
- `roadmap` 40, 46 to 50, 67 to 70, 103, 117, 118, 130, 132, 133.
- `plan` 41, 52, 55, 60, 65, 76 to 78, 84.
- `ordo-init` 31, 38 to 41, 46, 60 to 64, 79, 80, 85 to 87, 95 to 97, 103 to 108, 119, 124.
- `repo-setup` 34, 40, 48, 58, 64 to 67, 83 to 88, 94 to 96, 103, 109, 158 to 163, 181.
- `grill` column 65, 53, 103 to 112, 163 to 168, 177 to 182, 226, 247.
- `plan-terms.md` 20, 51, 74, 75, 91, 92; `docs/glossary.md` 133; `README.md` 54, 113, 117, 124.
- `gen_figures.py` 372, 377 to 390, 381, 410, 559. The legend width is 232.8 px, 35 characters, computed from the script's own `_badge_width`.
- The verify list of the state file holds 11 commands.

1. `plan-orchestration` bullet: "lines 301 and 302: two sub-bullets under "The stop message is plain text in the report"". That bullet has three sub-bullets, at lines 300 to 302. Replacement: "lines 301 and 302, the second and third of its three sub-bullets, the third beginning ...". brief.
2. `roadmap` bullet: "the text after each invocation starting in column 43". Lines 18 (`move`) and 20 (`drop`) carry no text. Replacement: "the text after an invocation, where there is one, starting in column 43". brief.

## 4. Cases and checks

Results on the copy:
- **Verify 2.** 203 dictated lines, each as the one line of a pattern file, `grep -c -F -f`: no mismatch. The thirteen sub-bullets and the first line of the shared item print 1 in each of the five skills. The `repo-setup` sub-bullet prints 2.
- **Verify 3.** The glossary check exits 0, the figure script exits 0 and a second run is byte-equal. Fourteen files differ.
- **Verify 4.** `LC_ALL=C grep -n '[^ -~]'` exits 1 with no line for each of the fourteen files.
- **Verify 5.** `grep -rn 'stay stops of their own' skills docs` prints nothing, exit 1.
- **Verify 6.** `ordo-help` 1, `grill` 11, `roadmap` 13, `plan` 10, `spec` 2, `plan-orchestration` 3, `ordo-init` 20, `repo-setup` 17, `plan-terms.md` 4, `docs/glossary.md` 5, `README.md` 1, `gen_figures.py` 1, each SVG 1.
- **Verify 7.** Each added line stands at the indent the opening of "What to build" gives, read in `diff -U1`.
- **Verify 8.** Both `ruff` commands pass, and the renders were read.
- `sh skills/repo-setup/templates/sync_rules.test.sh | tail -1` prints `PASS: sync_rules.py scratch tests`.
- The ASCII check of the verify list, run over the copy's files with `find` in place of `git ls-files`, prints nothing and exits 0.
- No skill description passes 1,024 characters; the longest is `spec` at 1,022.

1. Verify 2 lists "each bullet, numbered item, Quick start line, changed cell and changed sentence". It names neither the line of item 6 nor the lines of item 4.
   - Of the call's eight lines, `canvas,` prints 30, `x,` 22, `width,` 10 and `)` 243.
   - Consequence: a builder who reads "each dictated text" as covering the call reports red rows the brief made.
   - Replacement, added to Verify 2: "The line of item 6 prints 1 in `ordo-help`. Of item 4, the docstring line, `y + 48,`, the two string lines and the two heights each print 1; the other lines of the call are not counted."
   - Tested on the copy: each of those prints 1. brief.
2. R7 against item 10: section 5 finding 3. R5 against item 9: section 5 finding 2.

No case contradicts the rules file. The step is text with one script line and the cases are readings.

## 5. The question

Verify 1 to 8 show that the dictated lines are in the files, once, at the right indent, and that the figures draw. They pass on any tree that holds the text. The goal rests on the builder's walks of R2 to R9 and on the five runs by fresh agents, which follow `/roadmap` only. That is what option (a) ruled.

Points where my walk on the copy stops a run the case expects to pass, has no rule, or meets two readings:

1. Item 11, `/repo-setup`: no sentence makes Steps 3 draft a file from the ruling's text.
   - Option (a): "It drafts from the ruling's text, applies its own rules, and compares." The third ruling: "the draft's file equals it line for line".
   - The walk of R7's first case: Steps 3 drafts `README.md` as "The tree" says ("the name, the paragraph, how to build ..., the license line"), in the session's words. The third condition of Steps 4 then compares it with the ruling's fenced block, and it differs.
   - The run stops at Steps 4, where R7 expects "no stop at Steps 4". `roadmap` Steps 2, `ordo-init` Steps 1, "sync" 5 and `grill` each have the drafting sentence; the setup has none.
   - Replacement: item 11 gains "Steps 3 gains one sub-bullet, after "The git guard hook is copied byte for byte ...":" with the text `- Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.` R7 gains "Steps 3 drafts `README.md` as the ruling's text". brief.
2. Item 9, `/plan`: no sentence says what tag a step line gets under a quoted ruling.
   - Option (a): "The step lines end `(approved)`". Decision 2 and R5 expect it.
   - The only text is line 66, "Each step line of the approved list ends with `(approved)`". Rules line 101 offers `(ruling <name>)` "for a step a ruling of the user added later", and **authority** says "for each ruling the step rests on".
   - A session can write either tag. With `(ruling <name>)` the plan differs from what option (a) states.
   - Replacement: Steps 3 gains a fourth sub-bullet, last of the new ones and right before line 66: `- A step list written under a quoted ruling is the approved list.` The item's count becomes "four sub-bullets, the first with four of its own". brief.
3. Item 10, Steps 11, third sub-bullet, against R7 and Decision 3.
   - The text: "Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated."
   - R7: "it stops unless the ruling also states the form and the text of each page it creates".
   - Four required keys are not derived from that tree. `verification` names `docs/dev/building.md`, which `/ordo-init` drafts itself. `ledger_root`, `archive_root` and `worktree_root` are "the example's values" (`ordo-init` Steps 5).
   - Read by the letter, a ruling with the form, the page text and the three asked keys still stops at Steps 11, where R7 says it does not.
   - Replacement for R7: "... it stops unless the ruling also states the form, the keys it does not derive from that tree (`verification`, `ledger_root`, `archive_root` and `worktree_root`) and the text of each page it creates."
   - Decision 3 gains the same four keys. The dictated sub-bullet keeps option (a)'s words. brief.
4. The shared item, sixth line: "A draft is the ruled change when each part of it equals the sub-bullet that states it."
   - For a part no sub-bullet states, the sentence can be read as holding vacuously. R4's last input ("no sub-bullet, or ... part of the change: the draft is not the ruled change") then passes a run it expects to stop.
   - Cost: a number, a place or a key the user never ruled is written without the stop.
   - Replacement, same line count: `- A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.` brief.
5. Item 8, the Stops cell "The change": "except a draft that is the change a quoted ruling states (Steps 4)".
   - Steps 4 keeps the stop for such a draft when the gate's answer is yes. The cell says the stop is not raised.
   - Replacement, in the form item 9 uses: "Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says". brief.

The other walks hold on the copy, each by the sentence named:
- **R2.** `plan-orchestration` "Stops" sub-bullets 3 to 5; `spec` "Steps / A ruling" 2, the three new bullets, and 3, its sub-bullet; the `ordo-help` line. No sentence still says the skill's approval stop always stays.
- **R3.** Steps 2 "The ruled wording ... is kept"; "add" 3 "is not redrafted", "keeps the stop of Steps 4" and "The stop "No gate" is not raised for it"; "add" 5 against Steps 4 "differs in anything"; Steps 5 for the commit.
- **R4.** Each "no ruling" input by its line of the list of five; "(the user)" with or without a full stop by the fifth; the name outside its bullet by the third, which counts bullets of the Rulings section. In the four open plans `grep -n '^## \|^### Step 0'` shows every Step 0 after "## Blocked, and by what", outside the Rulings section.
- **R5.** The four conditions; one closing step ("is dropped for the one `/plan` writes"); the rulings-file copy; Steps 6 for the commit.
- **R6.** Steps 1, 2, 6, 10, 11 and 14; "Checking" 4 and 6; the cells. Rules 1 and 5 agree with Steps 11.
- **R7.** The inputs that stop: a build file, a missing `README.md` text, a placeholder, eight answers.
- **R8.** All five inputs. The input "a ruled hunk the diff does not show" matches neither new sub-bullet, and the stop of item 3's own line stands, which is the expected result.
- **R9.** "the draft is made at the first write of Steps 8"; "gets no bullet"; "then counts as answered", so Steps 9 ends; Steps 10 lists and names.

## 6. Implied inputs

The script change adds one input, the note's width, which `_check_line` covers: 699.6 px of 990. Inputs the reading cases leave out, with the cost of a wrong answer:

1. A page text that holds a fenced block of its own.
   - `docs/dev/building.md` and a change standard always hold one, and they are the pages `/ordo-init` creates.
   - Item 5 writes "a text of several lines as a fenced block indented with its sub-bullet". An inner fence of three backticks ends that block early, so the comparison "line for line with the fenced block" runs against a cut text.
   - Cost: the run stops on every such page, or a session guesses where the block ends.
   - Replacement for the third new bullet of item 5: `- the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;` R2 gains that input. brief.
2. A part of the draft that no sub-bullet states: section 5 finding 4.
3. The four keys of `/ordo-init` under `/repo-setup`: section 5 finding 3.

## 7. ADRs

`ls docs/adr` prints `README.md` and `template.md`. No `NNNN-*.md` record exists, as the brief says. Findings: none.

## 8. Dictated text

Claims about the tree, each read on the copy; all hold:
- The seven "Stated in" places of **quoted ruling** each hold the term.
- Its alphabetical place is between **questions, the** and **reader, of the transcripts**.
- "the `spec` skill's "What it reads" 4" exists at `spec:44`.
- `Steps / add 3` and `Steps / sync 4` are written as the two skills write them.
- The new `grill` Quick start line starts its text in column 65, and the `ordo-help` line in column 31.

1. Decision 19: "The second sub-bullet of item 7 stays one sentence of 44 words".
   - The 44-word sentence is the third of the five, since the third check's split put "The option names that stop." second.
   - Four more dictated sentences are over 30 words, by a count over the fences:
     - the shared item's second sub-bullet, 35;
     - item 5's first bullet, 35;
     - item 9 Steps 2, "A quoted ruling that stands in the rulings file ...", 32;
     - item 11 Steps 4, "Each file that is neither ...", 35.
   - Rule: prose standard E, sentence length. Verify 9 has the builder keep dictated sentences, so the length is settled in the brief or not at all.
   - Replacement for Decision 19: "The third sub-bullet of item 7 stays one sentence of 44 words: it holds the rule, the five skills it covers and its alternative, which the layout keeps in one bullet. Four more sentences stay between 32 and 35 words, each a rule with the list it needs: the shared item's second sub-bullet, the first bullet of item 5, the rulings-file sub-bullet of item 9 and the last-but-one sub-bullet of item 11 Steps 4." brief.
2. Item 9, Steps 3: "A plan written under a quoted ruling holds the ruling's bullet and every line under it in its Rulings section, unless Steps 2 copied it from the rulings file."
   - Read as written, a plan whose ruling Steps 2 copied does not hold the bullet. R5 expects it "in the new Rulings once".
   - Replacement: `- The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.` brief.
3. Against `docs/dev/skill-layout.md` and the glossary, I found no other break.
   - One rule per bullet holds for each added bullet.
   - Each exception stands in the item that carries the ("Stops") mark.
   - Each new sub-bullet of a Steps item that has a completion line stands before it.
   - **quoted ruling**, **ruling**, **rulings file**, **commit rule** and **stop** are used in their entries' senses.

## Shared files with step 2b of plan 2.G

`.scratch/2-g-git-guard/agents/briefs/2b.md` writes `skills/repo-setup/SKILL.md` lines 126-126 and `README.md` lines 13-13.

- **`skills/repo-setup/SKILL.md`.** No item of 9a touches line 126 or a line next to it. Item 11 changes or adds after lines 16, 34, 40, 58, 65, 86, 96, 103, 109, 158 to 161, 163 and 181. The nearest are 109 and 158.
- **`README.md`.** Item 3 changes line 54 only.
- **If 2.G lands first.** That step's brief turns one sub-bullet into four, so lines 158 to 163 and 181 move down by 3, and those premises need a rerun. Every item places by quoted text, so nothing is misplaced.
- **The path comparison.** 9a lists `repo-setup/SKILL.md` whole, so it is a shared path under `spec` Steps 5 whichever lands first.

## Declined to judge

- Whether 9a is prepared before or after step 2b of plan 2.G lands, and the `shared_paths:` judgment: the orchestrator's, under `spec` Steps 5 and `plan-orchestration` "Two steps in flight".
- The step's line carries two tags, as `sed -n '46p' plan.md | grep -o '(ruling [^)]*)'` prints. The brief also builds the third ruling. Whether the line needs a third tag is the orchestrator's booking in `plan.md`.
- Decisions 2, 4, 8 and 11: the user's, as the third check left them.
- A quoted ruling has no rule against a second run with the same bullet, and nothing ties a ruled step list to the entry `/plan` is run on. Both are the design the user ruled.
- Whether option (a)'s words fit every "every run" mark (`grill`'s "The end", `/roadmap done` at the closing): the user's ruled words.
- Verify 1 was not run. It needs git state, and eight of its commands test scripts the step does not change. The glossary check, `sync_rules.test.sh` and the ASCII check ran on the copy.
- No run as a fresh session in a scratch repository: that needs `git init` and commits. The walks are readings of the copy.
- The five runs of option (a)'s check: the orchestrator's.
- My tokens, tool uses and time: not visible to me (not verified).

Files:
- Brief: `/Users/axelfaes/workspace/ordo/.scratch/2-e-grill/agents/briefs/9a.md`
- Earlier checks: `/Users/axelfaes/workspace/ordo/.scratch/2-e-grill/agents/reviews/9a-brief-check.md`
- Rulings: `/Users/axelfaes/workspace/ordo/.scratch/2-e-grill/plan.md`
- The other step's brief: `/Users/axelfaes/workspace/ordo/.scratch/2-g-git-guard/agents/briefs/2b.md`

Agent usage: claude-opus-5-5 (ordo-high), 318017 tokens, 55 tool uses, 941 s ($3.09 to $9.18).

## Closed (fourth check; the session's change to the brief for every finding of it)

- Section 1 finding 1: item 8 changes `roadmap` line 107 to "- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.", and "What is on the tree" holds the line as a premise.
- Section 2 finding 1: Decision 20.
- Section 3 findings 1 and 2: the `plan-orchestration` premise names the second and third of the three sub-bullets, and the `roadmap` premise says "where there is one".
- Section 4 finding 1: Verify 2 names the line of item 6 and the six lines of item 4 that print 1, and says the other lines of the call are not counted.
- Section 5 finding 1: item 11 gives `repo-setup` Steps 3 the sub-bullet "Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.", and R7 names it.
- Section 5 finding 2: item 9 gives `plan` Steps 3 a fourth sub-bullet, "A step list written under a quoted ruling is the approved list."
- Section 5 finding 3 with section 6 finding 3: R7 and Decision 3 name the four keys `verification`, `ledger_root`, `archive_root` and `worktree_root`.
- Section 5 finding 4 with section 6 finding 2: the shared item's sixth line is "A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet."
- Section 5 finding 5: the cell of item 8 ends "except a draft written under a quoted ruling as Steps 4 says".
- Section 6 finding 1: item 5 writes the fenced block with "its fence longer than any fence inside the text", R2 has that input, and Decision 21 says so.
- Section 8 finding 1: Decision 19 names the third sub-bullet and the four other sentences between 32 and 35 words.
- Section 8 finding 2: the Rulings-copy sub-bullet of item 9 is "The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file."
- The closure of the third check's section 1 finding 1 is replaced: the brief is prepared while step 2b of plan 2.G is in flight, and the dispatch entry carries `shared_paths` for `skills/repo-setup/SKILL.md` and `README.md`.
- Declined to judge: the step's line in `plan.md` carries a third tag, for the ruling "Step 9a, a file of `/repo-setup`'s draft that comes from no template"; the five runs stay the orchestrator's before the landing; Decisions 2, 4, 8 and 11 stay booked for the user to overrule.
