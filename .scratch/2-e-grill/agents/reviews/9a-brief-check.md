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
