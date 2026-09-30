# Step 9a refuter report (on .agents/worktrees/2e-9a, base 9f85c25167de344c56879d5dcefb63456848df11)

A page this report cites is named with its section. A finding in code keeps its `file:line`. Every command below was run by the reviewer from the worktree's root unless it says otherwise. The reviewer changed no file of the repository or the worktree; its scratch folder under `$TMPDIR` is removed.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
PASS: person-driven.sh scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...' (the ASCII check, printed nothing)
checks: 11 commands passed
(exit 0)

The restored worktree, checked on its own:

$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/grill/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-grill/agents/reviews/9a-report.md
$ git diff 9f85c25167de344c56879d5dcefb63456848df11 --stat   (last line)
 14 files changed, 220 insertions(+), 37 deletions(-)
$ git diff 9f85c25167de344c56879d5dcefb63456848df11 | md5 -q
335c98ddea37a6988a94364488ec0b4d
$ md5 -q <the builder's 9a-final.patch in the session scratchpad>
335c98ddea37a6988a94364488ec0b4d
$ git reflog --date=iso | head -8
seven "reset: moving to HEAD" entries, 16:01:42 to 16:43:17, all at 9f85c25, as the report's part 11 lists them

Every dictated text, counted in its file (a Python script of the reviewer, the patterns read from two files: the fenced blocks of the brief's "What to build", parsed from the brief itself, and a file of the "becomes" sentences and cells; a count is the number of lines that hold the text, as grep -c -F counts):
patterns checked: 209, off-count: 0
- the fourteen lines of the shared item: 1 in each of roadmap, plan, ordo-init, repo-setup and grill; sub-bullets at indent 3 (4 in grill), the five cases at indent 5 (6 in grill)
- "When no commit is made, the list of files the stop shows names the ruling the same way.": 2 in repo-setup (Steps 12 at indent 4, Steps / sync 9 at indent 3), as the brief expects
- every other bullet, numbered item, Quick start line, cell and sentence of items 1 to 12: 1, at the indent of its neighbours (3 under a one-digit item, 4 under a two-digit item, 5 for the nested bullets of plan Steps 3 and repo-setup Steps 4, 2 under a Rules bullet, 5 in spec "Steps / A stop", column 31 in ordo-help)
- item 4: the docstring, `y + 48,`, the two string lines and the two heights each 1, at gen_figures.py lines 378, 394, 395, 396, 418 and 567
The placement of each text against its item was read in the diff: none is misplaced.

$ cmp <README.md line 13 at the base> <README.md line 13 in the worktree>
(exit 0)
$ cmp <the four lines from "10. Install the git guard? [no]" at the base> <the same in the worktree>
(exit 0; the sub-bullet stands at line 165 now, 126 at the base)

$ python3 <scratch copy>/docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (31507 bytes)
wrote docs/figures/plan-loop.svg (31164 bytes)
(exit 0)
$ cmp <scratch>/docs/figures/pipeline.svg docs/figures/pipeline.svg
(exit 0)
$ cmp <scratch>/docs/figures/plan-loop.svg docs/figures/plan-loop.svg
(exit 0)
$ diff <base pipeline.svg> docs/figures/pipeline.svg | grep -c '^[<>]'
5
$ diff <base plan-loop.svg> docs/figures/plan-loop.svg | grep -c '^[<>]'
5
(the svg line, the panel rect and the added note line; no other line of either figure differs)
viewBox="0 0 1040 988" (pipeline.svg), viewBox="0 0 1040 911" (plan-loop.svg); the note's sentence once in each
$ rsvg-convert of both figures into the scratch folder: exit 0 twice; both renders read: the note stands on its own line under the legend's row, inside the panel.

$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py
All checks passed!
$ ruff format --check --line-length 100 docs/figures/gen_figures.py
1 file already formatted
longest line of gen_figures.py: 100

$ LC_ALL=C grep -c '[^ -~]' over the fourteen files, worktree and base
0 and 0 for each file
literal tabs in the fourteen files: 0 in each
empty added lines in the diff: 0; ' - ' or ' -- ' in an added line outside a bullet marker: none
$ git grep -n 'stay stops of their own' -- skills docs
(exit 1)
$ git grep -n -c 'quoted ruling\|--ruling' -- skills docs README.md
README.md:1, gen_figures.py:1, pipeline.svg:1, plan-loop.svg:1, glossary.md:5, grill:11, ordo-help:1, ordo-init:20, plan-orchestration:3, plan:11, repo-setup:18, plan-terms.md:4, roadmap:14, spec:2 (93 lines, as the report says)
$ git grep -n -i 'approv' -- skills docs utils README.md | wc -l            118 (base: 109)
$ git grep -n -i 'every run\|each time' -- README.md docs skills utils | wc -l   36 (base: 33)
$ git grep -n -i 'stops of their own\|second stop' -- skills docs README.md utils | wc -l   1 (base: 3)
The brief's premises under "What is on the tree": the line numbers it names for the eight skills, plan-terms.md, glossary.md, README.md and gen_figures.py were printed from the base with git show and sed; each holds the text the brief quotes. `find skills/repo-setup/templates -maxdepth 1 -name 'README*'` prints nothing; `ls docs/adr` prints README.md and template.md, so no ADR record applies.
This is a text step with no test, so no change of the reviewer's own was made against a test.
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The entry **quoted ruling** stands once in `plan-terms.md` and once in `docs/glossary.md`, between **questions, the** and **reader, of the transcripts**; the three changed sentences stand once in each file; `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0.
- 2: holds. The changed clause stands once in the entry **mark, of a figure**.
- 3: holds. The changed sentence stands once, at `README.md` line 54; line 13 equals the base.
- 4: holds. The six counted lines stand once each; the two SVG files equal what the script writes from a scratch copy; ruff passes.
- 5: holds. The seven texts stand once each in `spec`, at their places.
- 6: holds. The line stands once in `ordo-help`, its text in column 31.
- 7: holds. The five sub-bullets and the changed Rules clause stand once each.
- 8: holds. Every text of the item stands once in `roadmap`, at its place.
- 9: holds. Every text of the item stands once in `plan`, at its place.
- 10: holds. Every text of the item stands once in `ordo-init`, at its place.
- 11: holds. Every text of the item stands once in `repo-setup`, the one doubled sub-bullet twice as the brief says; the git guard sub-bullet of question 10 equals the base.
- 12: holds. Every text of the item stands once in `grill`, the shared item's sub-bullets at four and six spaces.

Cases of the brief's "Cases":

- R1: met. The reading of both glossary files and the sync check above.
- R2: met. `plan-orchestration` "Stops" and `spec` "Steps / A stop" and "Steps / A ruling" read in place; no sentence still says the approval stop of a skill an option runs always stays. Standards 5 is about who runs the skill by hand and does not change the verdict.
- R3: met. `roadmap` Steps 2, Steps 4, Steps 5 and "Steps / add" 3 give each expected result. The gate's answer stands in the draft that "Steps / add" 6 shows and not in the entry, and Steps 4's second sub-bullet treats it apart from the comparison, so the answer is not a part the ruling must hold.
- R4: partial. The eight "no ruling" inputs and the four "ruling" inputs each map to one of the five cases of the shared item. The last clause (a quoted ruling with no sub-bullet keeps the stop) is carried by the Steps of `roadmap`, `ordo-init`, `repo-setup` and `grill`; in `plan` it has two readings: Spec 2.
- R5: met. `plan` Steps 2, 3 and 6 read in place.
- R6: met. `ordo-init` "What it reads" 3, Steps 1, 2, 6, 10, 11 and 14, "Checking an existing file" 4 and 6, Stops and Rules read in place.
- R7: partial. Every expected result is given except the one that depends on which keys `/ordo-init` "derives from the tree": the skill does not say, and the brief's four keys are one of two readings: Spec 1.
- R8: met. `repo-setup` "Steps / sync" 3, 5 and 9 read in place.
- R9: met for the results the case names. Spec 3 is a run the case does not name, in which the ruled diff is never written.
- R10: partial. Two sentences outside the changed lines are false for a run under a covering quoted ruling, and four more depend on a reading the skills do not settle: Standards 1 and 2.
- R11: partial. **quoted ruling** is used in its entry's sense in all 93 lines. One dictated bullet, in five skills, joins two rules: Standards 3.
- R12: met. The regeneration, the two `cmp`, the two viewBox values and the two renders above.

## 1. Spec

- 1. `skills/ordo-init/SKILL.md`, Steps 11: "Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated."; what is wrong: the skill does not say which keys those are. The brief (decision 3, case R7) counts `verification`, `ledger_root`, `archive_root` and `worktree_root` as not derived, so a ruling must state them. The skill's own Steps 3 and 5 draft those four by looking at that tree and finding nothing (no verification page, no ledger folder), which a session can equally call derived from it; failure scenario: a session following `/ordo-init` inside `/repo-setup` under a ruling that states only the ten answers, the three keys, the form and the text of `docs/dev/building.md` counts all four as stated and writes `.agents/plan.yaml` with the example's values without the stop, where the brief expects the stop; another session stops on the same input. The text is the brief's own, which the builder could not change; verdict: R7 partial.
- 2. `skills/plan/SKILL.md`, Steps 2 and Steps 3: "Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check." and "Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison."; what is wrong: `grill` and `sync` condition their sentence on what the ruling holds ("whose sub-bullets hold the entry's changed text", "whose hunks are the hunks of the diff"); `plan` does not, and its Steps 3 never uses the shared sentence "A draft is the ruled change when each part of it has a sub-bullet that states it". For a quoted ruling that holds no step list (no sub-bullet, or the sub-bullets of a ruling written for `/roadmap add` and passed to `/plan` as well), one reading drafts the list from the gate, finds it is not the ruling's and stops; the other takes "the step list is the ruling's" as an empty list, finds the first of the four things true of every step there is, and writes a plan that holds only the closing step. The builder's walk of R4 was made on `/roadmap` alone, with "the item is the same text in the other four skills", which does not cover this, since the outcome rests on each skill's own Steps; failure scenario: `/plan 7 --ruling <plan.md> "<a ruling whose sub-bullets state a roadmap entry>"` writes and commits `plan.md` with no step but the closing, all tagged `(approved)`, with no stop; verdict: R4 partial.
- 3. `skills/grill/SKILL.md`, Steps 2 and "Steps / Writing what settled" 3: "Read what "What it reads" 3 to 9 lists." and "Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8."; what is wrong: no step of `grill` reads item 11 (Steps 1 takes items 1 and 2, Steps 2 items 3 to 9), so the sentence "With no ruling, the skill says which of these it found" has no point in the run at which it is said, and the ruled diff is tied to a write of Steps 8, which happens only after a round has been asked and answered; failure scenario: `/grill <entry> --ruling ...` on an entry whose decisions are all settled by lines of the Rulings: Steps 3 marks each settled, the frontier is empty, no round is asked, Steps 8 has nothing to write, Steps 9 goes to Steps 10, and the entry is never changed, with no stop and no message; with a ruling that is "no ruling", the user learns it after answering the first round; verdict: none (the case R9 does not name this run).

## 2. Proof

- none. Each command the report quotes that a read-only run can repeat printed what the report says: the verify list, the status, the diff stat, the two checksums, the reflog, the three grep totals at the base and now, the per-file counts of `quoted ruling\|--ruling`, the two ruff lines, the two viewBox values and the regeneration.

## 3. Standards

- 1. `README.md`, "Configuring a repository", first paragraph (line 113): "It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, the project skills, and whether to install the git guard."; what is wrong: `repo-setup` Steps 2 now says "A question a quoted ruling answers ("What it reads" 6) is not asked.", so for a run under a ruling that answers the ten questions this sentence is false, whatever the reading of Steps 4. The builder's report (part 11, point 2) names the next sentence of that line and not this one. The brief's reason for keeping these lines, that a quoted ruling is the user's approval, reaches "After your approval it writes" and does not reach "It asks". The glossary entry **questions, the** ("the ten questions `/repo-setup` asks before it drafts a repository") is the same kind, weaker, since it defines the questions (change standard, rule 14); failure scenario: a reader of the README who runs `/repo-setup ... --ruling` expects the questions and the shown tree and gets a written repository; verdict: R10 partial.
- 2. `skills/repo-setup/SKILL.md`, description (line 3): "Shows the whole tree and every file's text, the git guard hook named by its source, before writing."; `README.md` line 113: "It then shows the whole tree and every file's text, the git guard hook named by its source."; what is wrong: whether they are false for a run under a covering quoted ruling depends on a reading the skill does not settle. `repo-setup` Steps 4 opens "Show the draft, the tree and every file's text", which reads as unconditional, and its new sub-bullets say "the draft is written without the stop only when four things hold" and "Otherwise the draft is shown whole, and the stop stands", which reads as: a covered draft is not shown. On the second reading both sentences are false for that run, as the builder says. The same two readings stand in `plan` Steps 3 ("Otherwise the draft is shown whole ...") against `README.md` lines 17 and 35, `ordo-help`'s line "/plan <entry> once: opens the plan, shows the step list for approval" and `docs/figures/gen_figures.py:489`, and in `repo-setup` "Steps / sync" 3 against `README.md` line 117 ("shows the diff of each block that differs") and the glossary entry **sync**. `roadmap` (Steps 3 shows, Steps 4 writes) and `ordo-init` (Steps 10 shows, Steps 11 compares "the draft Steps 10 shows") show the draft in every run, so `README.md` line 124 holds; failure scenario: one session shows the whole tree and then writes, another writes with nothing shown; the five skills then differ in whether the user sees what a ruled run wrote, and a reader of the description cannot tell which; verdict: R10 partial.
- 3. `skills/roadmap/SKILL.md`, `skills/plan/SKILL.md`, `skills/ordo-init/SKILL.md`, `skills/repo-setup/SKILL.md`, `skills/grill/SKILL.md`, "What it reads", the quoted-ruling item, last sub-bullet: "With no ruling, the skill says which of these it found, and every stop stands."; what is wrong: `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets". Saying which case was found and keeping every stop can each be broken alone. The report's Verify 9 says one rule stands in each bullet. The same form, with the second half naming the stop the first half describes, stands in `roadmap` Steps 4 ("is shown whole with each difference named, and the stop stands"), `plan` Steps 2 ("... and none of them is a line left to place") and Steps 3, `ordo-init` Steps 11, and `repo-setup` Steps 4, "Steps / sync" 3 and 5; whether those are one rule is the orchestrator's reading. The words are dictated by the brief; failure scenario: a session that finds no ruling keeps every stop and never tells the user the ruling was not used, and a reviewer checking the bullet cannot mark it half met; verdict: R11 partial.
- 4. `README.md` line 54, `docs/glossary.md` entry **mark, of a figure**, `docs/figures/gen_figures.py:395`: "A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change."; what is wrong: the sentence has two readings against the figures it explains. Of the stops the figures mark "every run", a quoted ruling lifts `repo-setup`'s two, `ordo-init`'s two, `roadmap`'s "The change" and `plan`'s "The drafted step list". It does not lift `grill`'s "The end" (Steps 10 asks the confirmation and the commit question in every run), lifts only the roadmap-diff decision inside `grill`'s "A round", and cannot reach `session-retro`'s "The proposals" or the closing's "The roadmap diff", which `plan-orchestration` runs with no `--ruling`. The words are option (a)'s own, so the change is the user's to rule; failure scenario: a reader of the pipeline figure takes `/grill <entry> --ruling ...` for a run that does not wait, and it waits at every round and at the end; verdict: none.
- 5. `skills/spec/SKILL.md`, "Steps / A ruling" 3, and `skills/ordo-help/SKILL.md`, the sequence: "After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`." and "that skill is run with --ruling <ledger file> "<name>" before /spec is typed again"; what is wrong: the prose standard, "E. Sentence shapes", "Passive voice: rewrite unless the actor is irrelevant". The actor matters here: "A ruling" 2 says "the session books the ruling and nothing else", and item 3 says `/spec` "is typed again", which is the user; the new sentence does not say whether the session runs the skill or the user types it, and nothing tells the user the name and the ledger file to type. `plan-orchestration` "Stops" names its actor ("It then runs the skill"); failure scenario: by hand, the session books the ruling and ends its turn; the user types `/spec <entry> <step>` as item 3's first sentence says, and `/spec` checks the premises of a step against a tree the ruled skill has not yet changed; verdict: none.
- 6. The builder's process, stated in its report's part 11, point 1: a helper script of the builder ran `git reset --hard` seven times in the worktree, and `git push`, `git checkout`, `git restore` and `git clean` with no argument; what is wrong: the rules file, "Where the work happens": "No git command that changes state". The diff is not affected: `git diff <base> | md5 -q` and the builder's saved patch both print `335c98ddea37a6988a94364488ec0b4d`, all 209 dictated texts count as expected, and `git status --short` shows the fourteen files and the report; failure scenario: a reset between the builder's last check and its report would leave a worktree that differs from what it verified; the reviewer's counts above show it does not; verdict: none.

## 4. Behaviour

- none. The report's part 10 gives each visible change with its before and after, and part 11 states the builder's git commands.

## Declined to judge

- Whether the builder's `git push` reached the remote: the reviewer's allowed git commands hold no `git ls-remote` and no `git config`. What was run: `git status --short --branch` in the worktree prints `## 2e-9a` with no upstream, and `git log --oneline -1 origin/main` prints `6d756b4`. The remote itself is not verified.
- The five scratch runs of `/roadmap` under a quoted ruling: the brief gives them to five fresh agents after this review; no skill was run here, and every case verdict is a reading.
- The pixel comparison of the renders in the report's Verify 8: not repeated. The reviewer compared the SVG files line by line with the base (five differing lines each) and read both renders.
- The report's "210 texts; 0 not as expected": the reviewer's own count covers 209 patterns with none off; the two lists were built differently and were not matched one to one, and no decision rests on the total.
- The word counts of the report's part 7 and the Stops row counts of its part 12: not recounted, no decision rests on them.
- The sentences the brief's decision 19 and the report's part 7 name as longer than the prose standard allows: the brief rules that they stay, so they are not judged.
- Whether a rulings file should hold a quoted ruling at all: the glossary entry **rulings file** and `plan` Steps 2 say it can, and no skill's text writes one there (`spec` "Steps / A ruling" writes it in a plan's Rulings section, `grill` writes one-line bullets). This is a design point for the user, outside what a read can settle.
- The four brief-check reports and `9-refuter.md`: not in the reviewer's reading list and not read.

Reviewer usage: not available from inside the run; the orchestrator records it from the completion notice.

