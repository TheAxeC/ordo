# Step 9a brief check (on main at ab78819)

## 1. Names

Evidence:
- `git rev-parse --short HEAD` printed `ab78819`. `git status --short` printed `?? .scratch/2-e-grill/agents/briefs/9a.md`.
- `git grep -n "quoted ruling" -- skills docs README.md utils` printed nothing, rc=1. `git grep -n "quoted ruling" -- agents` printed nothing, rc=1. The new term is used nowhere in the tree.
- `git grep -n "approved by a ruling\|already approved in full\|ruled change\|pre-approved" -- skills docs README.md utils agents` printed nothing, rc=1.
- `git grep -n -E "Rules [0-9]" -- skills docs README.md` found these citations in the five skills: `ordo-init/SKILL.md:79` ("as Rules 5 says"), `ordo-init/SKILL.md:114-115` (Rules 2 and 3, Rules 4 and 5), and `roadmap/SKILL.md:150-151` (Rules 1, Rules 2). No file outside the skill cites a Rules bullet of these skills by number.
- The approval-text sweep, `git grep -n -i -E "until the user approves|after (the )?approval|after your approval|after you approve|for approval|writes only after|write nothing until|nothing is written until|waits on (you|the user) each time|every run|user's approval|approves or corrects|approved or corrected|on the user's yes" -- skills utils docs README.md agents ':!docs/figures/*.svg'`, found these hits outside "Paths this step writes": `docs/figures/gen_figures.py:20, 71, 381, 414, 481, 564`, `skills/plan/templates/plan.md:20`, `skills/repo-setup/templates/docs/dev/change-standard.md:19, 22`, `docs/dev/change-standard.md:19, 22`, `skills/session-retro/SKILL.md:136`, `skills/refute/SKILL.md:175`, `skills/plan-retro/SKILL.md:3, 32` and `utils/pin.test.sh:98`. It also found these hits inside the paths that the brief leaves unchanged: `skills/roadmap/SKILL.md:3, 16, 17`, `skills/ordo-init/SKILL.md:3, 15, 103, 107`, `skills/repo-setup/SKILL.md:3, 95, 107`, `skills/plan/SKILL.md:3, 15`, `skills/plan-orchestration/SKILL.md:292`, `skills/ordo-help/SKILL.md:55`, `README.md:17, 35, 113, 117, 124`, `docs/glossary.md:111` and `skills/repo-setup/templates/plan-terms.md:106`.
- `grep -o "it waits on you each time it runs\|HOW TO READ THE MARKS" docs/figures/*.svg` found both strings in `docs/figures/pipeline.svg` and in `docs/figures/plan-loop.svg`.
- `git grep -n "(approved)" -- skills docs README.md` found `docs/glossary.md:11`, `skills/repo-setup/templates/plan-terms.md:6`, `skills/spec/SKILL.md:3, 43, 282`, `skills/plan/SKILL.md:3, 67, 102`, `skills/plan/templates/plan.md:18, 19, 21` and `skills/ordo-help/SKILL.md:77`.
- Hits the change leaves true: `skills/plan/templates/plan.md:20` ("added after the approval"), `skills/plan/templates/orchestrator-state.md:38` ("what each would need approved later"), both change standards (script approval) and `session-retro:136`, `refute:175`, `plan-retro:3, 32` and `pin.test.sh:98` (other senses of the words). Also the glossary's **ruling** (still true, since it only says "also written"), **open item** and **stop** (still true).
- `plan-orchestration:292`, the row "The roadmap diff" at the closing's `/roadmap done`, stays true. Under the dictated `roadmap` Rules 8, "an output line the ruling does not give is the session's choice", and 7.1 names "a gate's output" as work not yet done, so a `done` is never stated in advance.

Findings:
1. `docs/figures/gen_figures.py:381`: `(EVERY_RUN, "it waits on you each time it runs")`. Both SVGs print this under "HOW TO READ THE MARKS".
   - What is wrong: the text becomes false for every stop this step lets a quoted ruling skip. The generator marks these stops EVERY_RUN: "The questions" and "The draft" (423), "The draft" and "Worker, reviewer and libraries" (433), "The change" (460) and "The drafted step list" (482). Decision 9 says the exception is stated "where the marks are explained, in `README.md:54` and in the glossary". The figures explain the marks themselves, in their legend, and that legend is not changed. Rule 14 of the rules file makes a sentence the change makes false a defect of the change.
   - Failure scenario: a reader of the README sees the pipeline figure's legend say that `/roadmap add`'s "The change" waits each time. The sentence added two lines above says it does not, so the page contradicts itself.
   - Change to the brief: add `docs/figures/gen_figures.py`, `docs/figures/pipeline.svg` and `docs/figures/plan-loop.svg` to "Paths this step writes". Dictate a legend text that fits the legend's width check, such as "it waits on you each time, unless a ruling of yours states the change". Have the builder regenerate the SVGs with the script and add a case that the script exits 0. Drop Decision 9.
2. `skills/ordo-init/SKILL.md:3`, the description: "... and write nothing until the user approves."
   - What is wrong: the brief gives Rules 1, which says the same thing ("The skill writes nothing until the user approves or corrects the draft"), the exception (4.13). It leaves the description without one.
   - The brief's own reading case says "no sentence of the skill says without exception that the skill waits or writes nothing until the user approves ... The sentences to reread: each skill's `description`". Its description case says every description length stays the same.
   - The two cases cannot both pass, and the builder may not touch the description ("Keep every line this brief does not name byte for byte").
   - The same unresolved reading covers the other sentences listed in the evidence: `roadmap:3` "Writes only after the user approves", `repo-setup:3` "rewrites them after approval", **sync** in `plan-terms.md:106` and `glossary.md:111`, and `README.md:113, 117, 124`.
   - Decision 4 reads these as still true, since the ruling is the user's approval. Yet the brief treats the same words in `ordo-init` Rules 1 and `repo-setup` Rules 2 as needing an exception.
   - Failure scenario: the builder runs the reading case, finds `ordo-init`'s description, and must either break "byte for byte" or report the case failed. A session that loads `/ordo-init` from its description believes it will be asked.
   - Change to the brief: pick one reading and apply it to every hit. Either dictate new wording for the `ordo-init` description (632 characters now, so there is room) and remove `ordo-init` from the description-length case, or state in Decision 4 that "writes nothing until the user approves" is true under a quoted ruling and drop the exception from Rules 1 and Rules 2 as well. The reading case should list each sentence it exempts.
3. **authority**: `plan-terms.md:6` and `docs/glossary.md:11` ("`(approved)` for a step of the list the user approved when the plan opened"), `skills/spec/SKILL.md:43` (the same words) and `skills/plan/SKILL.md:102`, Rules 2 ("`(approved)` for a step of the list the user approved").
   - What is wrong: item 3.4 tags a list written under a quoted ruling `(approved)`, and says the tag is "the authority "Rules" describes". Rules 2 and the term describe only a list the user approved when the plan opened.
   - Failure scenario: a later `/refute` or `/session-retro` reads `(approved)` as "Axel approved this list at `/plan`'s stop" for a plan where no stop happened, and the record is wrong.
   - Change to the brief: extend Rules 2, the **authority** entry and `spec` "What it reads" 4 with "or a list a quoted ruling stated". Or raise to the user which tag a ruled list gets (see "Declined to judge").
4. `skills/plan-orchestration/SKILL.md:336`: "Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time".
   - What is wrong: the Rules bullet 7.2 appends has the loop invoke `/plan`, `/roadmap` outside the closing, `/ordo-init`, `/repo-setup` and `/grill`. The "every" list at 336 becomes incomplete (rule 14 of the rules file: an "every" sentence is reread after the change).
   - Failure scenario: after a compaction the orchestrator carries out `/roadmap add` from remembered text, since 336 does not list it, and the skill's quoted-ruling check never runs.
   - Change to the brief: 7.2 also rewrites 336's parenthesis to name those skills.

## 2. The step line

Evidence:
- `grep -n "^- 9a " .scratch/2-e-grill/plan.md` printed line 46, which equals the brief's quotation.
- `grep -n "^- Approval stops under a ruling" .scratch/2-e-grill/plan.md` printed line 119.
- Map of the step line:
  - "`plan-orchestration`" is served by 7.1 and 7.2. "`plan`" by 3.1 to 3.7. "`roadmap`" by 2.1 to 2.6. "`ordo-init`" by 4.1 to 4.15. "`repo-setup`" by 5.1 to 5.14. "`grill`" by 6.1 to 6.9.
  - "each changed text read in place" is served by the reading cases. The "scratch run of `/roadmap add` ... writes the ruled change with no second stop" by Run 1, and "stops on a draft that differs" by Run 2. "(1 commit)" needs no item.
- Map of the ruling's clauses:
  - "plan-orchestration quotes the ruling": 7.1 (second sub-bullet) and 7.2, with 7.4 in `spec`.
  - "plan, roadmap, ordo-init and repo-setup read the quoted ruling": 3.2, 2.2, 4.3 and 5.2.
  - "skip the stop only when the draft is the change the ruling states": 2.3, 2.5 and 2.6; 3.3, 3.6 and 3.7; 4.7, 4.8, 4.10, 4.11 and 4.15; 5.4, 5.5, 5.9, 5.11 and 5.14.
  - "question stops of repo-setup and ordo-init skipped when the ruling states the answers": 5.3, 5.11 and 5.14 (first sub-bullet); 4.4, 4.5, 4.11 and 4.15.
  - "/ordo-init inside /repo-setup takes the same ruling": 5.6, and 4.3's fourth sub-bullet.
  - "sync's hunks are covered": 5.8, 5.9, 5.11 and 5.14.
  - "named in the commit, or ... in the list of files written": 2.4 and 2.6; 3.5 and 3.7; 4.9, 4.12 and 4.15; 5.7, 5.10, 5.12 and 5.14; 6.4 and 6.5.
  - "ordo-init's Rules 5 gains the exception": 4.14.
  - "/plan still stops when a gate or a step's check could pass": 3.7, second bullet.
  - "grill's roadmap-diff decision is among the stops covered": 6.1 to 6.9.
- Every part and every clause has an item. How far the items reach the ruling's intent is judged in check 4.
- `git log --format='%h %s' --grep="step 9"` lists `cde9136 Book the ruling on step 9a of plan 2.E` and `f3288ab Book the ruling on a file from no template in step 9a of plan 2.E`. Both come before `8633553 Revert main to its state at 2bb8bd8`, whose body reads "Undo the 36 commits made after it, whose work came from repeated brief checks of the same steps".
- `git show cde9136 -- .scratch/2-e-grill/plan.md` adds: "- Step 9a, how a skill is given the ruling and what the ruling must hold (2026-09-30): Axel ruled (a). The five skills take `--ruling <ledger file> "<name>"`; a quoted ruling is the bullet of that name ending "(the user)" with its sub-bullets, ... the pages that say "every run" and the five scratch runs made by fresh agents before the landing are as option (a) under "Step 0 of step 9a" states them (the user)."
- `git show f3288ab` adds: "- Step 9a, a file of `/repo-setup`'s draft that comes from no template (2026-09-30): Axel ruled (a). A file of the draft that comes from no template counts as ruled when the ruling holds its full text as a fenced block under its sub-bullet and the draft's file equals it line for line ... (the user)."
- Neither line is in `plan.md` at head (the Rulings section read in full).

Findings:
1. Two rulings of Axel on this step's design, booked in cde9136 and f3288ab, were removed from `plan.md` by the revert 8633553. The brief does not mention them, and it takes decisions that contradict them.
   - Decision 1 ("The quote has no syntax of its own: the invocation is followed by the ruling's line and the path") is option (b) of that open item. The orchestrator named (b) the lazy option there, and Axel ruled (a), `--ruling <ledger file> "<name>"` with the bullet's sub-bullets.
   - Decision 9 ("The figures are not redrawn") contradicts (a)'s "the stops figure (`docs/figures/gen_figures.py` and its SVG) ... say the stop waits each time "unless ...".
   - The builder's own scratch runs contradict (a)'s "The builder makes no scratch run. Before the landing the orchestrator starts five fresh agents".
   - Decision 5 (design decisions "do not keep the stop") contradicts (a)'s "no design decision is named as unsettled".
   - Nothing in the brief follows f3288ab's rule for a file from no template, or (a)'s `/repo-setup` rule ("states `worker`, `reviewer` and `libraries` ... the keys it derives from the tree just written count as stated").
   - The brief has no course for (a)'s `/grill` rule ("the changed gate's answer is no").
   - Failure scenario: the builder writes the design Axel ruled against. If the revert was not meant to withdraw his rulings, the step lands his rejected option.
   - Change to the brief: the orchestrator raises to Axel, as an open item, whether the two rulings still stand after the revert. If they stand, they are booked again in `plan.md` and the brief is rewritten to them. If they do not, the brief says so under "What is on the tree", with the commits, so that the choice is visible.

## 3. Premises

Evidence (each command of "What is on the tree" rerun):
- The step line (plan line 46) and the ruling (plan line 119): each quotation matches the file.
- `git grep -n "quoted ruling" -- skills docs README.md utils`: nothing, rc=1. Matches.
- `grep -n "approval it would need later\|An approval of work not yet done" skills/plan-orchestration/SKILL.md` printed 303 and 304. The same grep on spec printed 199 and 200. `spec:222` is the quoted bullet, and `plan-orchestration` has 336 lines, of which 336 is the last Rules bullet. Matches.
- A python read of each named line, with counts of "What it reads" items and top-level Rules bullets, printed:
  - roadmap: 5 items, 7 bullets.
  - plan: 5 items, 5 bullets.
  - ordo-init: 4 items, 6 bullets.
  - repo-setup: 5 items, 8 bullets.
  - grill: 10 items, 4 bullets.
  - plan-orchestration: 5 items, 7 bullets.
- Every line number the brief gives holds the text it names: roadmap 21, 40, 48, 49, 50, 130 and 162; plan 16, 41, 66, 67, 77, 78, 85 and 105; ordo-init 15, 31, 32, 46, 60, 79, 80, 81, 85, 95, 96, 103, 104, 105, 107, 108, 119, 124 and 125; repo-setup 15, 16, 34, 40, 58, 59, 64, 83, 94, 103, 104, 110, 159, 160, 161, 162, 165, 183 and 189; grill 17, 53, 67, 106, 109, 180, 226, 247 and 249; ordo-help 54 and 55; plan-terms 20, 74, 75 and 76; glossary 5, 124 and 133 (the block markers at 5 and 124).
- `README.md:54` holds the quoted sentence.
- `spec:44` holds the naming rule the brief quotes.
- `ls docs/adr` printed `README.md` and `template.md`. `ls docs/adr | grep -E '^[0-9]{4}-'` printed nothing, rc=1.
- `git show 6119d03 -- 'skills/*/SKILL.md' | grep -E '^[+-] +version'` printed nothing, rc=1. `git show --stat 6119d03` shows the commit changed five `SKILL.md` files (ordo-help, plan-orchestration, plan, refute, spec), so the premise has evidence behind it.
- The verify list in the state file's configuration block has 10 commands, which matches "checks: 10 commands passed".

Findings:
1. The brief says "`skills/plan-orchestration/SKILL.md` lines 303 and 304 ... say that a skill's own approval stop stays a stop".
   - What is wrong: only line 304 says so. Line 303 says the approvals whose content exists are approved "with no second stop".
   - Failure scenario: a builder reads 303 as part of what 7.1 replaces.
   - Change to the brief: "line 304 says".
2. "What is on the tree" gives no premise for the two rulings of check 2, Finding 1, which `git log` shows were booked and then removed. Change to the brief: add them as that finding says.

## 4. Cases and checks

Evidence:
- Rules citations after the appends:
  - `roadmap`'s Rules become 8 bullets, 9 and 10 with it. 8 is the "states a change" test, 9 is written without waiting, 10 is the commit message. Steps 4 cites 8 and 9, Steps 5 cites 10, and the Stops row cites 8 and 9, which is right.
  - `plan`: 6 is the test, 7 the keepers, 8 the commit. The citations 6 and 7 at Steps 3 and the row, and 8 at Steps 6, are right.
  - `ordo-init`: 7 is the test, 8 is without waiting with its four sub-bullets, 9 is the naming. The citations at line 46 and Steps 6 (8), Steps 11, "Checking" 5, Rules 1 and Rules 5 (7 and 8), and Steps 14 (9) are right.
  - `repo-setup`: 9 is the test, 10 without waiting, 11 the naming. The citations at Steps 2 and sync 3 (10), Steps 4, sync 6 and Rules 2 (9 and 10), and Steps 12 and sync 9 (11) are right.
  - `grill`: 5 is the test, cited as Rules 5, which is right.
  - The existing citations "as Rules 5 says" (`ordo-init:79`), Rules 2 and 3 and Rules 4 and 5 (`ordo-init:114-115`), and Rules 1 and Rules 2 (`roadmap:150-151`) keep their bullets, since every new bullet is appended. `roadmap` Rules 2 "as the next rule says" and Rules 6 "the exceptions to the next rule" still point at bullets 3 and 7.
- `grep -n "add_argument\|--only\|choices" skills/repo-setup/templates/sync_rules.py` shows only `--only glossary`. The head comment says: "--write replaces the text between the two markers of each block that differs".
- Comment columns, computed by a python read:
  - roadmap Quick start: comments start at column 43. The new invocation is 53 characters.
  - plan: column 27; the new invocation is 35 characters.
  - ordo-init: column 16; 32 characters.
  - repo-setup: column 31; 42 and 47 characters.
  - grill: column 65; 36 characters.
  - ordo-help sequence: column 31; "<command>, then a quoted ruling" is 31 characters.
- `grep -n "Where the work happens" -A6 docs/dev/change-standard.md`: "No git command that changes state: no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`." The page opens with "nothing in a brief overrides anything here".
- `LC_ALL=C grep -n '[^ -~]' .scratch/2-e-grill/agents/briefs/9a.md` printed nothing, rc=1.
- The step-9 round-review findings:
  - Finding 1 (the rules only in the glossary, no quoting, no commit naming) is ended by 2.2 to 2.6, 3.2 to 3.7, 4.3, 5.2, 6.2, 7.2 and 7.4.
  - Finding 2 (the commit rule of `/ordo-init` run alone; no commit to name the ruling in) is ended by 4.2, 4.6, 4.12 and 4.15, with the gap of Finding 7 below.
  - Finding 3 (the question stops, `/ordo-init` inside `/repo-setup`, `sync` exit 1) is ended in the text by 4.5, 5.3, 5.6, 5.8 and 5.11. In effect it is not ended for `/repo-setup` (Finding 6) or for a ruled shared-rules block (Finding 8).
  - Finding 4 (`ordo-init` Rules 5) is ended by 4.14.
  - Finding 5 (`/plan`'s gate answers) is ended by 3.7, second bullet.

Findings:
1. The scratch runs: "git commands are allowed inside the scratch repository and nowhere else", and Run 1's commit and `git log`.
   - What is wrong: this breaks the rules file's "Where the work happens" ("No git command that changes state") and its opening ("nothing in a brief overrides anything here"). Run 2's "`git status --short` prints nothing" also needs the set-up files committed, which the set-up does not say. Run 1 commits only the roadmap by explicit path, so the other files stay untracked and Run 2's expectation fails.
   - Failure scenario: the builder either breaks the rules file, or hands the case back as one the brief's rules get wrong, and the step's only behavioural check does not run.
   - Change to the brief: move the scratch runs out of the builder's cases to a check made before landing by fresh agents, as the ruling of check 2, Finding 1 set. If the builder keeps them, the brief must not override the rules file. Also say the set-up files are committed before Run 1.
2. Item 1.1: "after the last term that begins with "questions" or "question" and before **recurring finding**".
   - What is wrong: two places satisfy this, before and after `plan-terms.md:75` **reader, of the transcripts**. Only the first is alphabetical, since "quoted" sorts before "reader".
   - Failure scenario: the builder puts the term directly above **recurring finding**, after **reader**, and the block's order breaks.
   - Change to the brief: "between **questions, the** (line 74) and **reader, of the transcripts** (line 75)".
3. Items 2.1 ("its comment aligned with the others") and 8.1 ("the comment starting in their column").
   - What is wrong: both are impossible without changing the other lines. The roadmap comments start at column 43 and the invocation is 53 characters. The ordo-help comments start at column 31 and the invocation is 31 characters. "Keep every line this brief does not name byte for byte" forbids changing the other lines. 3.1, 4.1, 5.1 and 6.1 give no spacing at all.
   - Failure scenario: the builder re-spaces lines 15 to 21 of `roadmap` and breaks "byte for byte", or writes the line some other way and breaks the dictation.
   - Change to the brief: dictate each new Quick start and sequence line character for character. For ordo-help, use the two-line form of `ordo-help:60-61` (the invocation alone, the comment on the next line from column 31).
4. Item 5.12: 'its What it shows cell gains, after "The files changed", the words ", with the quoted ruling named beside them in a run under one,"'.
   - What is wrong: the cell is "The files changed, and the command that shows them (`git status --short`)", so the result reads "... in a run under one,, and the command".
   - Change to the brief: dictate the whole cell, "The files changed, with the quoted ruling named beside them in a run under one, and the command that shows them (`git status --short`)", as 4.12 does.
5. The case "`repo-setup` under a quoted ruling that answers every question ... The text gives no stop before Steps 12 when the draft holds no placeholder the ruling does not fill".
   - What is wrong: the dictated texts give stops there.
   - `repo-setup` Rules 9 makes "a page's text, a build file ... that the ruling does not give" the session's choice. `README.md` ("the name, the paragraph, how to build, the license line", from no template) is in every tree, so the draft differs and "The draft" stands at Steps 4.
   - `ordo-init` Rules 7 makes "A key's value, a page's text, a verification command" the session's choice. "The questions" hold none of `worker`, `reviewer` and `libraries`, so `/ordo-init` inside `/repo-setup` stops at its Steps 6 and at Steps 11 (`docs/dev/building.md` and the derived keys).
   - A quoted ruling is one line ("What it reads" 6: "given as its line"), which cannot hold every file's text.
   - Failure scenario: Axel rules an option that sets up a repository in full. `/repo-setup` shows the draft and waits, then `/ordo-init` asks worker, reviewer and libraries and waits again. These are the second stops the ruling was meant to remove.
   - Change to the brief: give a course for a file from no template (the text f3288ab ruled), for the keys and pages `/ordo-init` derives from the tree the ruled setup wrote, and for a ruling that spans more than one line (a bullet with sub-bullets). Rewrite the case to require that the ruling states `worker`, `reviewer` and `libraries`.
6. `ordo-init` run alone, with a quoted ruling whose draft differs.
   - What is wrong: 4.6 drops the commit question ("when the skill runs alone without a quoted ruling"). The Stops row "The draft", whose What resumes it cell the brief leaves as is, still reads "The user's approval or correction, and, when the skill runs alone, the answer to the commit question". With a ruling that states no commit rule, 4.2's "allows no commit" applies, so the user who corrects the draft then meets "No commit allowed". A run without a ruling asks both at one stop.
   - Failure scenario: the brief's own `ordo-init` case ("In each the text gives one course") fails on the differing draft, and the user gets a second stop.
   - Change to the brief: Steps 10 asks the commit question whenever the stop of Steps 11 stands and the ruling states no commit rule, and the What resumes it cell says the same.
7. The case "`repo-setup sync` under a quoted ruling that gives the direction of one of two blocks that differ: the ruled block is written without waiting and the other block's hunks wait".
   - What is wrong: `sync_rules.py --write` writes each block that differs, and `--only` takes only `glossary`. A ruled shared-rules block, with the plan-terms block waiting, has no way to be written alone, and the text gives no course.
   - Failure scenario: the session runs `--write` and writes the unruled plan-terms block too, or edits `CLAUDE.md` by hand outside the script.
   - Change to the brief: add to 5.14's third sub-bullet that when `--write` would also write a block that still waits, the ruled block is written with it after that block's ruling. The case names which block is ruled, and covers the shared-rules case.
8. Drafting from the ruling. `roadmap` "Steps / add" 1 ("From the goal the user gives, draft the title ... and the goal, in one or two sentences") and `plan` Steps 2 ("The step list is drafted from the gate") are unchanged.
   - What is wrong: the session drafts in its own words, and Rules 8 (`roadmap`) and Rules 6 (`plan`) then compare that draft with the ruling. Either every run differs on wording and stops, or a session reads "follows from it" loosely and writes its own wording. That is two courses.
   - Failure scenario: Run 1 of the scratch run stops because the drafted goal is a paraphrase of the ruled goal.
   - Change to the brief: add a sub-bullet to `roadmap` Steps 2 and to `plan` Steps 2: under a quoted ruling, each part the ruling gives is taken from it as written.
9. `grill` has three gaps.
   - "Steps / Writing what settled" 3's last sub-bullet (`grill:182`), "The item is done when the diff is a decision of the next round, or, after the yes, the entry read back holds the change", is unchanged, so the ruled path has no completion criterion.
   - The new line 180 ("shown with the ruling named in the skill's next message ... and written without a decision") does not say whether the change is written before it is shown. Rules 3 says an answer is written "in the turn it settles", so that is two courses.
   - A ruled changed gate whose answer to "could this pass without the goal being reached?" is not "no" has no course. `grill` has no redraft rule, so Rules 5 writes it.
   - Failure scenario: a ruled gate "the file exists" is written into the entry with no decision, which `roadmap` "Steps / add" 3 would never allow.
   - Change to the brief: dictate the done criterion for the ruled path; "written in the turn the answer settles, and shown with the ruling named in the next message"; and "a changed gate whose answer is not no is a decision of the next round".
10. Skill layout, "Writing for an agent" ("Each item of Steps ends on its completion criterion", which applies "when it is written or rewritten").
    - What is wrong: these rewritten items carry none: `roadmap` Steps 4 and 5; `ordo-init` Steps 6, 11 and 12 and "Checking an existing file" 5; `repo-setup` Steps 2, 4 and 5 and "Steps / sync" 3 and 6.
    - Change to the brief: end each on "The step is done when ...", or state in "Decisions taken" why an item rewritten in one line is exempt.
11. Skill layout, "Where a rule goes" and "One meaning has one place".
    - Showing the draft "with the ruling named" happens at one point of the work: `roadmap` Steps 3, `plan` Steps 3, `ordo-init` Steps 10 and "Checking" 4, `repo-setup` Steps 4 and "Steps / sync" 3 and 5. That rule is written only in Rules (`roadmap` 9, `ordo-init` 8, `repo-setup` 10).
    - The commit naming is written twice: in the Steps item (`roadmap` 5, `plan` 6, `ordo-init` 14, `repo-setup` 12 and "Steps / sync" 9) and in Rules (`roadmap` 10, `plan` 8, `ordo-init` 9, `repo-setup` 11).
    - Failure scenario: the two copies drift, as that page's Anti-patterns row says. A session following Steps 3 does not name the ruling, since Steps 3 does not say to.
    - Change to the brief: put "with the quoted ruling named" in each showing step, and keep the commit naming in one place with a pointer from the other.
12. Skill layout, "Lists and tables" ("two requirements ... joined by 'and' ... or a second sentence, are two bullets").
    - `roadmap` Rules 9, `ordo-init` Rules 8 and `repo-setup` Rules 10 join "written without waiting" to "what differs ... waits ..., the difference named".
    - Naming the difference is a requirement of its own that can be broken while the other holds.
    - Change to the brief: move "the difference named" into a bullet of its own in each skill.
13. The prose standard's "Plain prose only".
    - What is wrong: "those a quoted ruling answers aside" (4.5, 5.3), "a block whose direction a quoted ruling gives aside" (5.8) and "a roadmap diff that a quoted ruling states aside" (6.3, 6.7) put the qualifier at the end of a long clause, where it reads as describing the noun before it.
    - Change to the brief: "except those a quoted ruling answers", and the same form in the other items.

## 5. The question

Asked of each case, of the step line's check and of each item of "What to build": could this pass without the goal being reached? The goal here is a skill run under a quoted ruling that writes the ruled change with no second stop, and stops on a draft that differs.

- Grep case "quoted ruling": yes. It counts words, not behaviour.
- Grep case "the approval stop of a skill the option runs": yes. It proves only that the old sentence is gone.
- Sync ok case: yes. It proves the glossary block equals the template.
- Diff-stat case: yes. It counts files.
- Description-length case: yes. It proves no description changed, which check 1, Finding 2 shows is itself a problem.
- Reading case "Rules <n>": yes. Correct citations do not make a skill skip a stop.
- Reading case on rule 19: no. As dictated it fails on `ordo-init`'s description (check 1, Finding 2). It checks agreement, not behaviour.
- `plan` reading case: yes. It checks only that "could pass" keeps the stop, not that a stated list is written with no stop.
- `ordo-init` reading case: no. It tests one course per commit-rule case. As dictated it finds a second course (check 4, Finding 6).
- `repo-setup` reading case: no. It targets the goal, but its expectation is wrong under the dictated text (check 4, Finding 5).
- `sync` reading case: yes. It passes for a ruled plan-terms block, and a ruled shared-rules block has no course (check 4, Finding 7).
- `grill` reading case: yes. It does not cover a ruled gate that could pass, or when the change is written (check 4, Finding 9).
- Glossary reading case: yes. A definition does not make behaviour.
- Scratch runs 1 to 3: yes. The builder that wrote the text follows it by hand in its own session and knows what it meant. A fresh session reading only the skill can differ on the drafting from the ruling (check 4, Finding 8). The runs also need git commands the rules file forbids the builder. Run 3 does not cover a line that does not end "(the user)".
- The step line's check: yes. Only `/roadmap` gets a run. The other five skills are only read, by the builder who wrote them.
- Item 1 (glossary): yes. It defines the term.
- Item 2 (`roadmap`): yes. The text lands, but the draft is made in the session's words and differs (check 4, Finding 8).
- Item 3 (`plan`): yes, for the same reason.
- Item 4 (`ordo-init`): yes. Under `/repo-setup` the derived keys and `building.md` are the session's choice, so it stops (check 4, Finding 5).
- Item 5 (`repo-setup`): yes. `README.md` never comes from a template, so "The draft" always stands (check 4, Finding 5).
- Item 6 (`grill`): yes. A ruled gate that could pass is written, and the done criterion is missing (check 4, Finding 9).
- Item 7 (`plan-orchestration` and `spec`): yes. A one-line Rulings entry cannot hold a `/repo-setup` or `/plan` change "in full", and 336's list is left out (check 1, Finding 4).
- Item 8 (`ordo-help` and `README.md`): yes. It is documentation.

## 6. Implied inputs

This is a text step, not a code step. The brief need not list implied inputs under "Cases". The dictated text still gives no course for these:

Findings:
1. A quoted line that does not end with "(the user)". "What it reads" 6's first sub-bullet describes the line. The second gives a course only for "A quote the file does not hold as quoted". This plan's Rulings hold 12 lines "decided by the orchestrator overnight", and none ends "(the user)".
   - Failure scenario: the orchestrator quotes "Step 12, who writes the roadmap entry ...", the file holds it, and `/roadmap` writes with no stop on a decision Axel never made.
   - Change to the brief: "A quote that is not a whole line of the file, or whose line is not in a Rulings section or a rulings file or does not end with "(the user)", is not a quoted ruling: the skill says so, and the run goes on as one without a quoted ruling."
2. An empty quote, or a fragment of a line. "holds as quoted" holds for any substring, and for the empty string in every file. A fragment that drops a limiting clause of the ruling passes. Change to the brief: the same whole-line wording as Finding 1.
3. A ruling file outside the repository the skill runs on. This is the normal case for `/repo-setup [<path>]` on a new folder, and for any skill run on another repository. No text says which root a relative path is read against, or how the path is written into the commit message. `roadmap` Rules 7 and `ordo-init` Rules 6 say "Every path is relative to the repository root". Change to the brief: the path is written from the folder that holds this repository, as `roadmap` writes another repository's path, and it is read the same way.
4. Two quoted rulings on one invocation. There is no course. Change to the brief: one quoted ruling per invocation, and a second is reported and ignored. Or each part may come from either ruling, the commit naming both.
5. A ruling held in the entry's rulings file under `/plan`. Steps 2 copies the line into the new `plan.md`, and Steps 6 deletes the rulings file in the same opening commit, so Rules 8's "the file that holds it" names a path the commit removes. Change to the brief: name the copied line in the new `plan.md`'s Rulings.
6. The boundary between a skill's own argument and the quote. `/roadmap add <goal>` and `/roadmap drop <entry> <reason>` take free text, and Decision 1 gives the quote no delimiter.
   - Failure scenario: `/roadmap add` takes the ruling's line and path as part of the goal.
   - Change to the brief: a delimiter. This is the argument form Axel ruled on (check 2, Finding 1).
7. A ruling that spans a bullet and its sub-bullets. "What it reads" 6 reads "the line" only, so the sub-bullets that a full `/repo-setup` or `/plan` change needs are not read. Change to the brief: the bullet with its sub-bullets.
8. A ruling that states only part of the change: each of the six skills gives a course ("differs ... waits", "left open by it waits"). No finding.

## 7. ADRs

Evidence: `ls docs/adr` printed `README.md` and `template.md`. `ls docs/adr | grep -E '^[0-9]{4}-'` printed nothing, rc=1. `grep -n "adr" .agents/plan.yaml` printed nothing, so the folder is the default `docs/adr` (the state file's block reads `adr: docs/adr`). The folder holds no record, so none touches the step. The brief says so in "What is on the tree".

Findings: none.

## Declined to judge

- Whether the revert 8633553 withdrew Axel's two rulings on step 9a (cde9136, f3288ab). That is Axel's call. Check 2, Finding 1 asks the orchestrator to raise it.
- Whether a step list written under a quoted ruling is tagged `(approved)` or `(ruling <name>)`. Decision 5 takes this choice. The step-9 refuter also declined it as Axel's design call, and a tag is a vocabulary the user owns under `spec` Steps 4.
- `/roadmap` has no mode that edits an entry's goal, so a ruling like "Open item B", which the brief's "Read" item 5 cites as its example of a ruling that states a roadmap change in full, cannot be carried out by `/roadmap` under any mechanism. This is outside the step line.
- I did not run the scratch runs, since this check is read-only. Their outcome is judged above by reading.
- I did not judge every dictated sentence for prose quality beyond the points named in check 4.
- Whether a skill's `metadata.version` should change in this step. The premise holds on the evidence, and the tree states no policy for when a version changes.

Agent usage: claude-opus-5-5, 258965 tokens, 34 tool uses, 11.4 minutes (683 s).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Check 2, Finding 1, and check 3, Finding 2 (the two rulings on step 9a that the revert 8633553 removed from `plan.md`): a stop, open item "Step 9a, the two rulings the revert removed" in the state file and under Step 0 of step 9a in `plan.md`; the brief is removed until the ruling, since the ruling decides its design.
- Every other finding (checks 1, 3, 4 and 6): raised in the same stop, since each is closed by the design the ruling settles; the brief written after the ruling closes each and names it here.
