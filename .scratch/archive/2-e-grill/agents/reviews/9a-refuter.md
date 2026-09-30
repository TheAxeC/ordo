# Step 9a refuter report (on .agents/worktrees/2e-9a, base f14ad594cc941a7620a09744f42b7efac1004239)

A page this report cites (the rules file, a standard, a skill's text) is named with its section. A finding in a skill's text keeps its `file:line` in the worktree, because the orchestrator needs the exact place to write the fix.

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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 10 commands passed
exit=0
```

Brief, "Verify before you report":

```
2. Each dictated text is in its file once. My own scripts under $TMPDIR/9a-review (count.py for the fenced texts of "What to build", inline.py for the changed sentences, cells and item 13's completion lines) run a substring count per line, which is what grep -c -F does:
   count.py: texts checked: 182 not once: 7
     the 7 are: the five uncounted lines of item 4's draw_note call (draw_note(, canvas,, x,, width,, ")"), and
     'When no commit is made, the list of files the stop shows names the ruling the same way.' in skills/repo-setup/SKILL.md printed 2 (twice, as the brief expects)
   inline.py: inline texts: 56 not once: 0
3. python3 skills/repo-setup/templates/sync_rules.py . --only glossary -> "ok: the plan-terms block equals the template", exit 0
   python3 docs/figures/gen_figures.py -> "wrote docs/figures/pipeline.svg (31507 bytes)", "wrote docs/figures/plan-loop.svg (31160 bytes)", exit 0
   git status --short before and after that run: cmp identical ("status same"); shasum of both SVGs before and after: identical ("svg bytes same"). The run rewrote the two files with the same bytes, so nothing changed.
   git diff --stat <base> | tail -1 -> " 14 files changed, 244 insertions(+), 37 deletions(-)"; git status --short lists those 14 files plus "?? .scratch/2-e-grill/agents/reviews/9a-report.md"
4. LC_ALL=C grep -n '[^ -~]' over each of the 14 files, now and at the base: now=0 base=0 for every file
5. git grep -n 'stay stops of their own' -- skills docs -> no output, exit 1
6. git grep -n -c 'quoted ruling\|--ruling' -- skills docs README.md ->
   README.md:1  docs/figures/gen_figures.py:1  docs/figures/pipeline.svg:1  docs/figures/plan-loop.svg:1  docs/glossary.md:5
   skills/grill/SKILL.md:11  skills/ordo-help/SKILL.md:1  skills/ordo-init/SKILL.md:21  skills/plan-orchestration/SKILL.md:3
   skills/plan/SKILL.md:11  skills/repo-setup/SKILL.md:21  skills/repo-setup/templates/plan-terms.md:4  skills/roadmap/SKILL.md:14  skills/spec/SKILL.md:3
7. indent.py (each added list line against its neighbours and its parent): every line it flags has an indent equal to its parent's expected offset (3 under a one-digit item, 4 under a two-digit item, 2 under a bullet, +2 under a sub-bullet). The flags come only from the stricter neighbour test. No added line is mis-indented.
8. ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py -> "All checks passed!", exit 0
   ruff format --check --line-length 100 docs/figures/gen_figures.py -> "1 file already formatted", exit 0
   viewBox="0 0 1040 988" (pipeline.svg), viewBox="0 0 1040 911" (plan-loop.svg); the note's sentence: 1 in each SVG; "quoted ruling" in each SVG at the base: 0 and 0
   rsvg-convert of each SVG exits 0; both PNGs read: the note is under the legend row, inside the canvas. The SVG diff changes only the background <rect> height and adds one <text> per file (6 changed element lines in total), so no box moved.
9. Reading: done below (cases R2 to R11, and the Standards heading).
```

Builder's quoted evidence, rerun:

```
$ git show <base>:skills/repo-setup/SKILL.md | grep -n 'nothing is written until the user approves'
183:- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
$ git show <base>:skills/repo-setup/SKILL.md | sed -n 181p
(an empty line)
$ find skills/repo-setup/templates -maxdepth 1 -name 'README*'
(no output, exit 0)
```

The part 5 check outputs, the part 12 counts ("The first five rows", "seven", "three", "six"), the descriptions and the alt texts quoted in the builder's report match my reruns. I judged every claim from my own runs and did not use the builder's `$TMPDIR/9a-build` scripts.

The brief's premises on the tree, printed at the base with `git show <base>:<file> | sed -n <n>p`, all reproduce: plan-orchestration 292/304/336; spec 200/220/221/229/230; ordo-help 75; roadmap 68/69/103/107/130/132/133; plan 52/55/61/66/85; ordo-init 31/46/79/80/103-108/119/124; repo-setup 42/48/103/159-165/168; grill 53/163/168/226/247; plan-terms 20/51/74/75/91/92; glossary 133; gen_figures 372/377/381/410/559. `docs/adr` at the base holds only `README.md` and `template.md` (`git ls-tree`), so no ADR record governs the step.

## Verdicts

Items of the brief's "What to build":

- 1: holds. All four `plan-terms.md` changes are in place, each counted 1. The new entry sits between **questions, the** and **reader, of the transcripts**. `sync_rules.py --only glossary` prints ok.
- 2: holds. The **mark, of a figure** sentence is counted 1 in `docs/glossary.md`.
- 3: holds. The `README.md` line 54 sentence is counted 1.
- 4: holds. The docstring, `y + 48,`, the two string lines and both heights each count 1. The script exits 0, the viewBoxes are 988 and 911, and ruff passes.
- 5: holds. All of spec's texts count 1, placed after base lines 221 and 230, and line 200 is replaced by the three sub-bullets.
- 6: holds. The line is added after the `"Ruled: ..."` line, and its text starts in the column of the block's other continuation lines.
- 7: holds. The five sub-bullets replace base line 304, and the Rules line changed as given.
- 8: holds. The Quick start line, "What it reads" 6, Steps 2/4/5, add 3 and its completion line, lines 103/107 and the three Stops cells are all present, each counted 1.
- 9: holds. All texts count 1, at the places the item gives.
- 10: holds. All texts count 1, at the places the item gives.
- 11: holds. The Rules sub-bullet sits under "In a setup, after Steps 1, nothing is written until ...", which is line 183 at the base. The item's "line 181" is a slip in the brief: its own premise says 183, and base line 181 is empty.
- 12: holds. The texts are built as dictated. Standards 1 is a defect in those dictated texts, not in how they were placed.
- 13: holds. All 23 completion lines count 1, and each is the last sub-bullet of its item (checked by reading each item after the change). spec "A ruling" 2 correctly gets none.

Cases of the brief's "Cases":

- R1: met. The entry is in alphabetical place in both files. Each "Stated in" place holds the text: spec "Steps / A ruling" lines 225-227, plan-orchestration "Stops" 306-308, plan "What it reads" 6, roadmap 6, ordo-init 5, repo-setup 6, grill 11. The four changed entries read as items 1 and 2 give them, and `sync_rules.py` prints ok and exits 0.
- R2: met. The walk runs as follows:
  - plan-orchestration 306 says the option states the change in full as the skill's text says, or names the stop.
  - 307 sends the booking to spec "Steps / A ruling" 2, lines 225-227: a Rulings bullet ending "(the user).", the change as sub-bullets, several-line text as a fenced block with a longer fence.
  - 308 runs the skill with `--ruling`.
  - A session run by hand finds the same in spec 237 and in the ordo-help sequence line.
  - The removed sentence is gone (check 5), and grepping "stop of its own" finds only the new, narrowed sentences.
- R3: met. The walk runs as follows:
  - Steps 2 (63-68) drafts from the ruled text.
  - add 3 (98-101) keeps the ruled gate and does not raise "No gate".
  - Steps 4 (72-74) writes a draft equal to the ruling only when the gate's answer is no. Otherwise the item line's stop stands, as add 3 line 100 says.
  - A place ahead of an entry it waits on: add 5 plus Steps 2 line 67 replace the place, the draft differs, and the stop stands.
  - A capability map with the capability's draft in the ruling: written without the stop. Without it: add's capability draft has no sub-bullet, so the draft differs and the stop stands.
  - move, done and drop take the ruled change.
  - Steps 5 names the ruling in the commit.
  - Standards 3 names a literal reading under which every `add` stops. My reading follows Steps 4 line 73, which expects an `add` draft carrying a gate answer to be written.
- R4: met. "What it reads" 6's five no-ruling cases cover:
  - a missing file;
  - a file of the wrong kind;
  - an absent name, or a name two bullets have;
  - the placeholder `<L>`;
  - a missing name, or an argument after the name (not the last two arguments);
  - "(decided by the orchestrator)" (the first line does not end "(the user)").
  - The skill says which case it found and every stop stands.
  - These count as rulings: "(the user)" with no full stop; a name holding a quotation mark, matched as written; a rulings-file bullet; a name that also appears in a tag and under Step 0, since only the Rulings bullets are counted.
  - A ruling with no sub-bullet, or with part of the change: a part has no sub-bullet, so the draft is not the ruled change and the stop stands.
- R5: met. The walk runs as follows:
  - Steps 2 lines 72-74 take the ruled list and drop a ruled closing step, and line 80 writes one closing step.
  - Steps 3 lines 87-92 set the four conditions, so a copied gate that could pass stops, and an unsettled decision stops.
  - Lines 94-95 make it the approved list, each step with `(approved)`.
  - Line 93 copies the bullet once. Line 68 copies it from the rulings file with nothing left to place.
  - Steps 6 lines 108-109 name the new `plan.md` in the commit.
  - A ruled step check that could pass is redrafted under line 77 ("The rest of this step is worked on that list"). The draft then differs and the stop stands, which is the result option (a) asks for.
- R6: met. The walk runs as follows:
  - Steps 1 (58-59) drafts from the ruling. Steps 2 (66-67) and Steps 6 (83-84) skip the question stops.
  - Steps 10 (105) drops the commit question. Steps 11 (108-113) writes without the stop, asks a commit question alone, and shows a missing page text whole with nothing written.
  - Steps 14 (122-124) and the "No commit allowed" cell name the ruling.
  - "Checking an existing file" 4 (134-135) makes a stated fix without the stop and stops on a differing fix or an unstated error; item 6 (139) lists the fix with the ruling.
  - Rules 1 (163) and Rules 5 (169) agree with Steps 11.
- R7: met. The walk runs as follows:
  - repo-setup Steps 2 (56-58) and Steps 3 (62: `README.md` drafted as the ruling's text).
  - Steps 4 (80-87): the four conditions. A build file, an unheld `README.md` or a listed placeholder leaves the draft shown whole with each named. Eight answered questions: the other two asked together, and the four conditions fail.
  - Steps 8 (96-97) passes the same `--ruling`.
  - Inside `/ordo-init`: no stop at Steps 2 (one candidate, `docs/roadmap.md`) or Steps 6 (keys stated). At Steps 11 (110), only keys derived from the tree count as stated.
  - `ledger_root`, `archive_root` and `worktree_root` come from "the example's values" (ordo-init Steps 5) in a new tree, and `verification` names the page `/ordo-init` itself creates, whose text must be in the ruling. So a session stops unless the ruling states them, as the case expects.
  - A fresh-agent run would settle whether a session reads "derives from the tree" that way.
  - Steps 12 (120-121) names the ruling.
- R8: met. The walk runs as follows:
  - sync 3 (133-134): hunks equal to the ruling's are applied.
  - A hunk the ruling lacks: shown and the stop stands.
  - A ruled hunk the diff lacks: line 133's condition fails, and the item line's stop governs.
  - sync 5 (143-146): a ruled exit-2 draft is written, and a differing one is shown with the stop.
  - sync 9 names the ruling.
- R9: partial. The listed sub-cases are met when the interview asks at least one other decision:
  - The draft is made at the first write of Steps 8 and written at once.
  - Writing 1 line 185 writes no bullet for it.
  - Line 203 counts the decision as answered, so Steps 9 can end.
  - Steps 10 (120, 126) lists the ruling and names it in the commit.
  - A goal-only change is written. A changed gate that could pass is shown as a decision (204).
  - The Stops row (250) and Rules (272) agree with these texts.
  - The missing part: a run where the ruled diff is the only open decision, which the case's wording "with no answer of the interview having changed the entry" includes, leaves a session with two courses or none (Standards 1).
- R10: met. I read every hit of the brief's three greps outside the changed lines (the "approv", "every run|each time" and "stops of their own|second stop" outputs above). They hold:
  - The descriptions, openings and Quick start lines of roadmap/plan/ordo-init/repo-setup still hold, because roadmap Steps 4, plan Steps 3 line 94 and the Rules sub-bullets of ordo-init/repo-setup/grill make a quoted ruling the approval. `README.md` 17, 35, 113, 117 and 124 and the **sync** entry hold the same way, with sync 3 and 5 covering sync.
  - plan-orchestration 292 is the closing step's `/roadmap done`, run with no ruling.
  - gen_figures.py 20 (the head comment on the mark shapes) and 381 (the legend row, qualified by the new note) hold.
  - The other "every run" hits (skill-layout 67, plan-retro 32, refute 75/175, pin.test.sh 98, building.md 11, repo-setup 152, CLAUDE.md template 10) are about other things.
  - The count lines under the Stops tables hold: roadmap 174 five, repo-setup 215 seven, grill 246 three, spec 280 six.
  - The exception is grill Steps 3, 4 and 9, which Standards 1 names.
- R11: partial. `quoted ruling` is used in its glossary sense in every hit of check 6, and the Quick start lines keep their block's form (columns checked). But several added exceptions sit in a separate sibling bullet from the rule they change (Standards 2).
- R12: met. Neither SVG held "quoted ruling" before. After: the script exits 0, each SVG holds the sentence once, the viewBoxes are 988 and 911, the renders show the note under the legend row inside the canvas, and no box moved.

## 1. Spec

- none.

## 2. Proof

- none. Every count, path and output the builder's report quotes that I reran reproduced (check 1 lines, the text counts, the sync/figure/stat outputs, the non-ASCII comparison, the check 6 counts, the ruff outputs, the viewBoxes, the Rules line 183).

## 3. Standards

1. `skills/grill/SKILL.md:82`, `:88`, `:100-104` and `:116` against `:199-203` and `:250`.
   - The quoted text: line 82, "The roadmap diff and "record as ADR?" ("Steps / Writing what settled") are decisions of their own, numbered like the rest."; line 88, "Compute the frontier: every decision whose prerequisites are settled, the roadmap diff and "record as ADR?" decisions included."; line 116, "Go back to Steps 3, until the frontier is empty and the roadmap diff and "record as ADR?" decisions are answered."; and, added, line 199 "Under a quoted ruling ... the draft is made at the first write of Steps 8." with line 250's cell "each roadmap diff no quoted ruling states riding in it".
   - What is wrong: the diff makes Steps 3 and 4 say something its own new lines deny. Steps 3 draws the roadmap diff as a decision and Steps 4 puts it in the frontier, which Steps 6 asks. The new Stops cell and Writing what settled 3 hold a ruled diff out of every round and make it only at Steps 8, which is reached only through a round (Steps 6) and its answers (Steps 7). No sentence says what happens when the ruled diff is the only open decision.
   - Rules broken: the rules file's rule 19 (no two statements that contradict) and the rule-14 check that a sentence is not made false. This is the builder's part 11 point 2. I judge it a defect.
   - Failure scenario: an option is ruled that runs `/grill 3 --ruling .scratch/<plan>/plan.md "<name>"` to change entry 3's goal, and entry 3's decisions are already settled in its Rulings. This is the ordinary use, since `/roadmap` has no command that edits an entry's text and `grill` is the skill that writes one. A fresh session then has three courses:
     - (a) It asks the ruled diff in round 1 under Steps 3, 4 and 6. That is the second stop the ruling "Approval stops under a ruling" set out to end.
     - (b) It sends an empty round and ends its turn waiting on nothing (Steps 6 line 104).
     - (c) It finds Steps 3 to 4 with no open decision and closes at Steps 10 without ever reaching the first write of Steps 8, so the ruled entry text is never written.
   - Verdict: R9 partial. The fix needs sentences in grill Steps 3, 4 or 6 that the brief did not dictate, so it is the orchestrator's to write.
2. Exceptions split from their rules into sibling bullets.
   - Places: `skills/roadmap/SKILL.md:96` "A gate that could ... is redrafted and asked again, at most twice." with its exception in siblings `:98` "Under a quoted ruling the ruled gate is not redrafted." and `:100-101`; `skills/ordo-init/SKILL.md:65` "Several candidates are a stop ("Stops")." with `:66-67` "Under a quoted ruling that states `roadmap`, the key is the ruling's." / "The stop of several candidates is then not raised."; `skills/plan/SKILL.md:71` "The step list is drafted from the gate ..." with `:72-74`, and `:86` "Write `plan.md` once the user has approved or corrected it." with `:87-92`; `skills/grill/SKILL.md:198` "The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes." with `:199-204`.
   - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", first bullet, says "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule". Here each rule stands whole in one bullet and its quoted-ruling exception stands in another bullet, sometimes split across two. The exceptions nested as sub-bullets of their rule (ordo-init Rules 163/169, repo-setup 231, grill 272, and the Steps item lines with sub-bullets) are not affected. The texts are dictated. The brief says a dictated text that breaks a standard is reported as a stop before any change, and the builder's report does not raise it.
   - Failure scenario: the layout's own anti-pattern row, "A rule folded ... until its exception is gone". A later edit, or a reviewer checking a diff, treats roadmap line 96 or ordo-init line 65 as the whole rule. The edit can then move or drop the exception bullet, or a session following a pointer to "the roadmap skill's Steps / add 3" (`plan` line 77, `grill` line 197) can apply line 96 alone. The result is a redrafted ruled gate, or a "Several roadmaps" stop under a ruling that states `roadmap`.
   - Verdict: R11 partial.
3. `skills/roadmap/SKILL.md:47` against `:74`, `:95`, `:99` and `:107`.
   - The quoted text: "A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet." (47); "A draft that differs in anything ... is shown whole with each difference named, and the stop stands." (74); and add 3's "write the answer with its reason in the draft that Steps / add 6 shows" (95), which under a ruling is line 99 "Its answer and its reason stand in the draft", with add 6 "Show the draft with the lines around its place, the gate's answer ... and, for a map, the capability's draft".
   - What is wrong: the `add` draft holds parts that no ruling states, and Steps 2 line 64 does not ask a ruling to state them: the gate's answer and its reason, and the lines around the place. Read by line 47's letter, no `add` draft is ever the ruled change. Line 73, "written without the stop, for `add` only when the gate's answer ... is no", implies the opposite. Two statements pull different ways, against the rules file's rule 19.
   - Failure scenario: the first of the five fresh-agent scratch runs the landing waits on ("the ruled change is written with no stop and its commit names the ruling") follows `roadmap` literally. It finds the gate's answer in its draft with no sub-bullet stating it, calls the draft different, and stops. The landing then waits on a run that failed on the text, not on the design.
   - Verdict: none. R3 is met on line 73's reading, and this finding names the risk that run exposes.

## 4. Behaviour

- none. The report's part 10 states the visible changes with before and after: the README sentence, the four glossary entries and the new one, the figure heights 966 to 988 and 889 to 911 with the note, the `--ruling` form on the five skills, and the removed plan-orchestration and spec sentence.

On the three points of the builder's part 11:

1. `repo-setup` Rules, line 181 against 183: not a defect. At the base the bullet is on line 183 and line 181 is empty (`sed -n 181p`). The sub-bullet sits under the bullet's text (worktree lines 230-231), which is what the item means.
2. `grill` with a quoted ruling whose roadmap diff is the only open decision: a defect, Standards 1.
3. `roadmap` Steps 4's completion clause "with each difference named" when a ruled gate that could pass is the only reason for the stop: not a defect.
   - add 3 line 100 keeps the stop in so many words. Steps 3 line 70 shows the gate's answer with its reason, which is the reason for the stop.
   - The completion clause is met with no difference to name, so no reader is led to write the draft or to show something else.
   - This is the result option (a) sets for `/roadmap`: "it is shown with its answer, and the stop stands".

## Declined to judge

- The five scratch runs of `/roadmap` by fresh agents are not made. The review changes nothing, runs no skill and starts no agent, and the brief gives those runs to the orchestrator before the landing.
- Who writes a quoted ruling into a rulings file. The glossary entries **quoted ruling** and **rulings file** and the shared "What it reads" item accept a rulings file as the `<ledger file>`, and `plan` Steps 2 line 68 reads one. But the only text that writes a quoted ruling is spec "Steps / A ruling" 2, and it writes into `plan.md`'s Rulings section. `grill` "Writing what settled" 1 writes one-line bullets. No skill text writes one into a rulings file, so today one gets there only by hand. Ruling (a) itself names the rulings file, so whether a writer is needed is the user's design question, outside this brief's items.
- Whether the brief's dictated sentences that run past the prose standard's roughly 20 words are acceptable. The brief keeps them as dictated and the builder's part 7 lists them, so that is the orchestrator's and the user's call.

Reviewer usage: about 270,000 tokens (from the context counter, 15,000,000 at the start and about 14,723,000 at the end), about 60 tool uses. The time was not measured.

Files referred to: /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/grill/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/roadmap/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/plan/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/ordo-init/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/repo-setup/SKILL.md, /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/.scratch/2-e-grill/agents/reviews/9a-report.md. My scratch scripts and renders are in $TMPDIR/9a-review (count.py, inline.py, indent.py, pipeline.png, plan-loop.png).

## Repair round 1, refuted

Step 9a of plan 2.E. Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a. Base: f14ad594cc941a7620a09744f42b7efac1004239. I changed nothing. The only git commands I ran were `git diff` and `git status --short`.

**Summary.** All three rulings are applied exactly as the round brief states them. Every check reran green and every claim of the builder reproduced. Two findings remain, both in `skills/grill/SKILL.md`, and both are small enough to fix at landing:
- **Standards 1:** the ruled roadmap diff is still in the frontier but in no round, which contradicts Steps 4's completion line, Steps 6's item line, two glossary entries, the README and the skill's description.
- **Standards 2:** the new Steps 6 sentence also fires when every frontier decision waits on a running lookup. The session then does not end its turn and loops from Steps 3 to 9 with no exit.

Verdicts: items 1 to 13 hold. R9 and R10 are partial; every other case is met.

### Verification (rerun by the reviewer)

The step's verify list, run from the worktree root. The absolute ledger path worked, so no other path form was needed:

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
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
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
exit=0
```

#### The round's delta

I compared `git diff f14ad594cc941a7620a09744f42b7efac1004239` (823 lines now) with `.scratch/2-e-grill/agents/reviews/9a-round-0.diff` (799 lines):
- Only the hunks of five files changed: `skills/grill/SKILL.md`, `skills/roadmap/SKILL.md`, `skills/plan/SKILL.md`, `skills/ordo-init/SKILL.md` and `skills/repo-setup/SKILL.md`.
- The other nine files keep their round-0 index lines unchanged.
- `git diff --stat <base> | tail -1` prints ` 14 files changed, 252 insertions(+), 38 deletions(-)`.
- `git diff --quiet HEAD <base>` exits 0 and `git diff --cached --quiet` exits 0: HEAD is still the base and nothing is staged.
- `git status --short` lists the 14 files as ` M`. It also lists `?? .scratch/2-e-grill/agents/briefs/9a-round-1.md` and `?? .scratch/2-e-grill/agents/reviews/9a-report.md`. Both are byte-identical to the main checkout's copies (`cmp` exit 0). `land.sh` leaves the ledger root out of the wip commit (its head comment, lines 6 to 11), so neither file reaches main.

#### The round brief's checks, rerun

- **Check 1:** the output above.
- **Check 2**, `grep -c -F -f <one-line file>` per text:
  - Each of the 20 new or moved texts of rulings 1 and 2 prints 1 in its file.
  - The two shared sentences of ruling 3 each print 1 in every one of `roadmap`, `plan`, `ordo-init`, `repo-setup` and `grill`.
  - The replaced texts each print 0: "The step is done when the message is sent and the turn has ended." in `grill`, "The stop "No gate" is not raised for it." in `roadmap`, and "A draft is the ruled change when each part of it has a sub-bullet" in each of the five skills.
- **Check 3:** the delta shows each moved bullet at its rule's indent plus two:
  - `roadmap` 97 (3 spaces) holds 98 (5), which holds 99 and 100 (7); 101 (3) holds 102 (5).
  - `ordo-init` 66 (3) holds 67 and 68 (5).
  - `plan` Steps 2: the step-list bullet (3) holds its three sub-bullets (5).
  - `plan` 87 (3) holds 88 to 94 (5), with the four conditions at 7; 95 (3) holds 96 (5).
  - `grill` 201 (3) holds 202 to 207 (5).
  - The shared sentence and its note sit at 3 and 5 in four skills, and at 4 and 6 in `grill`.
  - Each touched item ends on its completion line: grill 93, 108 and 209; roadmap 103; ordo-init 70; plan 82 and 97.
- **Check 4:** `LC_ALL=C grep -n '[^ -~]'` over the 14 files prints nothing and exits 1. `grep -c` of a literal tab prints 0 in each of the five skills.
- **Check 5:** the R9 walk, redone by me under Standards 1.

#### The builder's other evidence, rerun

- `git grep -n 'stay stops of their own' -- skills docs` prints nothing and exits 1.
- `git grep -n -c 'quoted ruling\|--ruling' -- skills docs README.md` prints: README.md:1, docs/figures/gen_figures.py:1, pipeline.svg:1, plan-loop.svg:1, docs/glossary.md:5, grill:13, ordo-help:1, ordo-init:21, plan-orchestration:3, plan:11, repo-setup:21, plan-terms.md:4, roadmap:15, spec:3. Grill (11 to 13) and roadmap (14 to 15) rose by exactly the round's new lines 92 and 107, and 102.
- `python3 docs/figures/gen_figures.py` prints `wrote docs/figures/pipeline.svg (31507 bytes)` and `wrote docs/figures/plan-loop.svg (31160 bytes)` and exits 0. `git status --short` and the SVG shasums are identical before and after. The viewBoxes are `0 0 1040 988` and `0 0 1040 911`.
- `ruff check ... --target-version py39` prints `All checks passed!` and `ruff format --check` prints `1 file already formatted`.
- Every `grep -n` line the builder's walk quotes (18, 55, 60, 61, 89, 92, 94, 102, 107, 108, 116, 188, 202 to 206, 118 to 121, 123, 129, 132) matches `grep -n ''` of the current file.

### Verdicts

Items of the brief's "What to build", over the whole diff since the base:

- 1: holds. The four `plan-terms.md` changes are unchanged since round 0, and `sync_rules.py --only glossary` prints ok.
- 2: holds. Unchanged since round 0.
- 3: holds. Unchanged since round 0.
- 4: holds. The script is idempotent, the viewBoxes are 988 and 911, and ruff passes.
- 5: holds. Unchanged since round 0.
- 6: holds. Unchanged since round 0.
- 7: holds. Unchanged since round 0.
- 8: holds. The texts are present. Round 1 moved the add 3 exceptions under their rules and changed "for it" to "for a quoted ruling's gate", as ruling 2 states. The completion line 103 is last.
- 9: holds. Steps 2 and 3 sub-bullets are nested as ruling 2 states, and "A step list written under a quoted ruling is the approved list." sits under the `(approved)` bullet at line 96.
- 10: holds. The Steps 2 exceptions are nested at 67 and 68.
- 11: holds. Only the shared sentence changed here, by ruling 3.
- 12: holds. The texts are placed as items 12 and the round dictate. Standards 1 and 2 are defects in the dictated `grill` texts, not in their placement.
- 13: holds. Each completion line is still the last line of its item, at the item's sub-bullet indent.

Cases of the brief's "Cases":

- R1: met. The sync check prints ok, and the entries are unchanged since round 0.
- R2: met. Unchanged since round 0.
- R3: met. The old Standards 3 is closed:
  - Line 47: "A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet."
  - Line 48 leaves the gate's answer and the lines around the place out of the comparison.
  - So Steps 4 line 74 (written without the stop for `add` when the gate's answer is no) no longer conflicts with the shared item.
- R4: met. Unchanged since round 0.
- R5: met. The moves keep each rule's scope (rules file rule 17):
  - Steps 2 line 73 governs the list.
  - Line 74's "the rest of this step" still covers the rest of Steps 2.
  - The four conditions and "Otherwise ..." sit under the write rule.
- R6: met. The ruled `roadmap` key sits under the several-candidates rule.
- R7: met.
- R8: met.
- R9: partial. The only-open-decision run reaches the right end through lines 92, 107, 202 to 206 and 119 to 120, but two defects remain:
  - Steps 4's completion line (93), Steps 6's item line (102) and the glossary and README definitions of a round still say the ruled diff is asked (Standards 1).
  - The new line 107 misroutes a frontier whose decisions all wait on a lookup (Standards 2).
- R10: partial. These sentences are made false for a ruled roadmap diff (Standards 1):
  - the glossary's **frontier** and **round, of an interview** (`docs/glossary.md:43`, `:94`; `plan-terms.md:38`, `:89`);
  - `README.md:16`;
  - `grill`'s description (line 3).
- R11: met. The old Standards 2 is closed at the five places the round names. The other quoted-ruling sub-bullets were already nested under the item lines they qualify: ordo-init Steps 6 at 84 and 85, repo-setup sync 3 at 134 and 135, grill Writing 1 at 188.
- R12: met. The script rerun is identical and the viewBoxes are as expected.

### 1. Spec

- none. The delta does what the three rulings say, at the indents they state, and makes no change outside them (compared line by line above).

### 2. Proof

- none. Every command and output of the builder's round-1 section that I reran reproduced:
  - the check 1 lines;
  - the 36 counts of 1 and the 7 counts of 0;
  - the indent table;
  - check 4 exiting 1;
  - the claim that only five files differ from the first build;
  - the walk's line numbers.

### 3. Standards

#### 1. The ruled roadmap diff is in the frontier and in no round

**Places:**
- `skills/grill/SKILL.md:92` against `:89`, `:93` and `:102`.
- `docs/glossary.md:43` and `:94`, and `skills/repo-setup/templates/plan-terms.md:38` and `:89`.
- `README.md:16`.
- `skills/grill/SKILL.md:3`.

**The quoted hunks:**
- line 89: `4. Compute the frontier: every decision whose prerequisites are settled, the roadmap diff and "record as ADR?" decisions included.`
- line 92: `- A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is in no round: it is made at the first write of Steps 8.`
- line 93: `- The step is done when each decision of the frontier is in the round, or waits on a named lookup.`
- line 102: `6. Ask the round: every decision of the frontier that waits on no lookup, in one message, numbered `D<n>`.`
- glossary 94: "**round, of an interview**: one message in which `grill` asks every decision of the frontier that waits on no lookup, ending the turn to wait for the answers."
- glossary 43: "... a round asks the rest in one message."
- README 16: "Each round asks every decision whose prerequisites are settled".

**What is wrong.** Line 89 keeps the ruled diff in the frontier, and line 92 puts it in no round. Six other statements say every frontier decision that waits on no lookup is in the round: line 93 (a completion line), line 102 (Steps 6's item line), the two glossary entries in both files, the README row and the description. Line 93 cannot be met by its letter while the frontier holds a ruled diff. This breaks:
- the rules file's rule 19 (two statements that contradict);
- rule 14 (a sentence the change makes false);
- `docs/dev/skill-layout.md`, "Writing for an agent": "Each item of Steps ends on its completion criterion".

**The builder's open point, judged.** Yes, it is a contradiction, and it is not the only one. A session that treats line 93 as the gate for leaving Steps 4, and line 102 as the definition of the round, has one literal way to satisfy both: put the ruled diff in round 1. That is the second stop the ruling "Approval stops under a ruling" set out to end. Most readers will follow line 92 as the more specific rule and reach the right result, but the text still offers the wrong course. The builder's clause ("or is a roadmap diff a quoted ruling states" after "a named lookup") closes line 93 only. Line 102, the glossary's **frontier** and **round**, README 16 and the description stay false.

**The walk of R9.** The case: a quoted ruling whose roadmap diff is the only open decision, the entry's other decisions settled in its Rulings. Each step names the line it follows, as `grep -n` prints it:
1. `18:/grill <entry> --ruling <ledger file> "<name>"   ...` recognises the invocation.
2. `55:11. The quoted ruling, ...` and lines 56 to 69 resolve the ruling.
3. `83:   - The roadmap diff and "record as ADR?" ... are decisions of their own, numbered like the rest.` makes the diff a decision.
4. `84:   - A decision that a line of the Rulings or the rulings file settles ... is marked settled` does not cover it when the ruling sits in another plan's `plan.md`. That is the usual case, for example `/grill 3` run from 2.E's ledger. So the diff is open.
5. `89:4. Compute the frontier: ... the roadmap diff ... included` puts it in the frontier.
6. `92: ... is in no round: it is made at the first write of Steps 8.`
7. `93: ... The step is done when each decision of the frontier is in the round, or waits on a named lookup.` is unmet by its letter. This is the contradiction.
8. `101:` Steps 5's completion line is vacuous.
9. `102:6. Ask the round: every decision of the frontier that waits on no lookup` includes the diff by its letter. `107: When the frontier holds no decision to ask, no round is sent and the turn does not end: the skill goes on to Steps 8` fires only if the reader has applied line 92.
10. `108:` is met by its second clause.
11. `116:8. Write each settled answer ...`. The ruled diff counts as an answer by `275: - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.`
12. `202:` to `206:` draft, write and count the diff as answered.
13. `188:` writes no bullet for it.
14. `209:` is met ("under a quoted ruling, the entry read back holds the change").
15. `118:` is vacuous.
16. `119:9. Go back to Steps 3, until the frontier is empty and the roadmap diff ... are answered.` and `120: ... a pass of Steps 3 to 4 finds no open decision.` are met.
17. `121:` to `132:` close the interview: the entry is listed with the ruling (123), the commit names it (129), and the stop "The end" (`254:`) waits on the confirmation and the commit question.

Steps 6 and Steps 8 and 9 read consistently with the new sub-bullets once line 92 is applied. The defect is confined to line 93, line 102 and the definitions outside the skill.

**Failure scenario.** Under a ruling that runs `/grill 3 --ruling .scratch/2-e-grill/plan.md "<name>"`, a fresh session checks line 93 before leaving Steps 4. It finds the ruled diff neither in the round nor waiting on a lookup. It follows line 102 and the glossary's **round**, and asks the ruled diff as D1 of round 1. Axel then gets a second stop for a change he already ruled.

**Wording that closes it (recommended).** Settle the ruled diff at Steps 3, so it never enters the frontier. Every statement above then holds without being edited.
- Remove line 92.
- Add under Steps 3, after line 84:
  `   - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is marked settled, since the quoted ruling is the user's answer ("Rules"): it is written at the first write of Steps 8.`
- Steps 6 line 107 becomes:
  `   - When the frontier is empty, no round is sent and the turn does not end: the skill goes on to Steps 8, which writes a roadmap diff a quoted ruling states.`
- Its completion line 108 becomes:
  `   - The step is done when the message is sent and the turn has ended, or the frontier was empty and the skill has gone on to Steps 8.`

This also closes Standards 2. Line 206 ("The roadmap diff decision then counts as answered.") and Steps 9 still hold.

The alternative keeps the diff in the frontier. It needs the builder's clause on line 93, plus "and is not a roadmap diff a quoted ruling states" on line 102, the glossary's **frontier** and **round** in `plan-terms.md` (then synced), README 16 and the description: seven places instead of three. That is the lazy option, because it patches each consequence instead of the one sentence that causes them.

**Verdict:** R9 partial, R10 partial.

#### 2. The new Steps 6 sentence misroutes a frontier that only waits on lookups

**Place:** `skills/grill/SKILL.md:107` and `:108`, against `:90`, `:106` and `:149`.

**The quoted hunks:**
- 107: `- When the frontier holds no decision to ask, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.`
- 90: `... a decision waiting on a running lookup is in the frontier and not yet asked.`
- 149: `5. A lookup that finishes joins the next round: the decisions that waited on it are asked.`

**What is wrong.** Line 107's condition is not tied to a quoted ruling. A frontier whose every decision waits on a running lookup "holds no decision to ask" by line 90. Before the round, line 106 ended the turn there, which let the lookup's result arrive for the next round (149). Now the session sends nothing and does not end its turn. It goes to Steps 8, which has nothing to write. Steps 9 then sends it back to Steps 3, where the same frontier recurs.

The loop has no count, and no user answer bounds it. That breaks:
- `docs/dev/skill-layout.md`, "Writing for an agent" (a repeat states its count; only a repeat the user ends by answering needs none);
- rule 19 against lines 106 and 149.

**Failure scenario.** Take `/grill <entry>` with no ruling, whose first open decisions each need a fact from a lookup agent (Steps / Looking up a fact 3). The frontier holds only decisions waiting on lookups. The session follows line 107: it never ends its turn, cycles from Steps 3 to 9, and cannot receive the lookup agents' results. It either spins or improvises an exit that no text gives.

**Wording that closes it:** tie line 107 to an empty frontier, as the recommended wording in Standards 1 does. A lookup-only frontier then falls back to line 106 as before.

**Verdict:** R9 partial.

### 4. Behaviour

- none. The builder's round-1 section gives each ruling's before and after. The `grill` change of Steps 6 is stated there; its defect is Standards 2.

### Declined to judge

- **The five fresh-agent scratch runs of `/roadmap`:** I did not make them. This review starts no agent and runs no skill, and the brief gives those runs to the orchestrator before the landing.
- **How often the lookup-only frontier of Standards 2 occurs in practice:** I judged it reachable from the text of lines 90 and 149. A scratch `/grill` run whose first decisions all need an agent lookup would show how often it happens.
- **repo-setup "sync" 6, "Write it once the user approves.":** it sits after sync 5's write under a quoted ruling. It is outside this round's delta, and at worst it repeats a write that has already happened, so I did not raise it.
- **The ADRs:** they govern nothing this diff changes. The worktree's `docs/adr` holds only `README.md` and `template.md`. The main checkout's untracked 0001 to 0003, all status proposed, decide the writing skills' prose standard and draft review.

Reviewer usage: about 185,000 tokens (context counter from 15,000,000 to about 14,815,000), 28 tool uses. Time not measured.

Files referred to:
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/grill/SKILL.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/repo-setup/templates/plan-terms.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/docs/glossary.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/README.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/roadmap/SKILL.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/plan/SKILL.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/ordo-init/SKILL.md
- /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-9a/skills/repo-setup/SKILL.md
- /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/agents/reviews/9a-report.md (section "Repair round 1")

## Closed

- First run, Standards 1 (a ruled roadmap diff as the only open decision of `grill`): closed in repair round 1 (`agents/briefs/9a-round-1.md`, ruling 1).
- First run, Standards 2 (exceptions added as sibling bullets of their rules): closed in repair round 1 (ruling 2), each exception moved under its rule in `roadmap`, `ordo-init`, `plan` and `grill`.
- First run, Standards 3 (the shared item compared what the skill shows beside a change): closed in repair round 1 (ruling 3), in all five skills.
- Repair round 1, Standards 1 (the ruled roadmap diff in the frontier and in no round): fixed at landing on main. `grill` Steps 3 marks a roadmap diff a quoted ruling states as settled, made at the first write of Steps 8, with a draft that "Steps / Writing what settled" 3 shows as the decision asked in the next round; the Steps 4 sub-bullet "is in no round" is removed. Steps 4's completion line, Steps 6's item line, the glossary's **frontier** and **round, of an interview**, `README.md:16` and the description hold again unchanged, since the ruled diff is never in the frontier.
- Repair round 1, Standards 2 (the Steps 6 sentence fired on a frontier waiting only on lookups): fixed at landing on main. The sentence now reads "When the frontier is empty, no round is sent and the turn does not end: ...", and its completion line "... or the frontier was empty and the skill has gone on to Steps 8."; a frontier whose decisions all wait on a lookup ends the turn as before.
