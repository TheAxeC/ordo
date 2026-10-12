# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2i-1, base cc1fd7a)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ git ls-files -coz --exclude-standard -- skills docs README.md .agents/plan.yaml | xargs -0 perl -CSD -ne '<the brief's character-set check>'
(no output)
ascii exit 0
$ git grep -n -i -e '\bcommit\b' -e 'commits ' -e 'committed' -e 'amend' -- skills
(218 hits in the skill texts outside the plan-terms copy and scripts; read sentence by sentence, see Verdicts item 5)
$ git grep -n workers_at_once -- skills docs README.md .agents/plan.yaml
16 hits: .agents/plan.yaml:14, docs/glossary.md:55, skills/ordo-help/SKILL.md:94, skills/plan-orchestration/SKILL.md:290, 291, 292, skills/plan/templates/orchestrator-state.md:33, skills/plan/templates/plan.md:25, skills/plan/templates/plan.projects.yaml:23, 50, skills/plan/templates/plan.yaml:21, skills/repo-setup/templates/plan-terms.md:50, skills/spec/SKILL.md:37, 224, 225, 410 (each reads the key from .agents/plan.yaml or is a plan.yaml template line)
$ git grep -n -e 'worktree_root>/<step>' -e '\-b <step>' -- skills docs README.md ':!skills/land/templates/land.sh'
(no output)
item4 exit 1
$ python3 -I <scratchpad>/figs/gen_figures.py   (a copy of docs/figures/gen_figures.py in the scratchpad, so it writes beside the copy and not into the worktree)
wrote scratchpad/figs/pipeline.svg (31539 bytes)
wrote scratchpad/figs/plan-loop.svg (31979 bytes)
exit 0
$ cmp <scratch>/pipeline.svg docs/figures/pipeline.svg ; cmp <scratch>/plan-loop.svg docs/figures/plan-loop.svg
pipeline.svg equal
plan-loop.svg equal
$ git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/plan-loop.svg
$ python3 -c '<description lengths>' plan-orchestration spec land refute plan ordo-help grill roadmap plan-retro ordo-init repo-setup diagnose
plan-orchestration 1018
spec 1003
land 725
refute 989
plan 477
ordo-help 564
grill 877
roadmap 1022
plan-retro 616
ordo-init 632
repo-setup 783
diagnose 965
$ grep -m1 'version:' over the twelve skills
plan-orchestration 5.0.0 / spec 5.0.0 / land 3.0.0 / refute 3.0.1 / plan 4.0.0 / ordo-help 3.1.0 / grill 1.3.1 / roadmap 1.3.1 / plan-retro 1.2.2 / ordo-init 2.0.1 / repo-setup 4.0.0 / diagnose 2.1.1
$ git status --short
 M .agents/plan.yaml
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/grill/SKILL.md
 M skills/land/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/references/self-rule.md
 M skills/plan-retro/SKILL.md
 M skills/plan/SKILL.md
 M skills/plan/templates/orchestrator-state.md
 M skills/plan/templates/plan.md
 M skills/plan/templates/plan.yaml
 M skills/refute/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-i-several-plans-in-one-session/agents/reviews/1-report.md
$ sed -n '/<!-- ordo:plan-terms begin -->/,/<!-- ordo:plan-terms end -->/p' docs/glossary.md | sed '1d;$d' | diff - skills/repo-setup/templates/plan-terms.md
(no output)
$ git diff cc1fd7a --stat | tail -1
22 files changed, 277 insertions(+), 203 deletions(-)
$ git diff cc1fd7a --name-only | xargs wc -l
(every count equals the builder's "The files with line counts"; total 4987)
$ (scratch repository) git cherry-pick -n main..step of a rename; git diff --cached --name-only; ... --no-renames
name-only: added.txt new.txt
no-renames: added.txt new.txt old.txt
$ git add -- plana.txt; git commit -q -m land -- added.txt new.txt old.txt; git diff --cached --name-only
plana.txt   (still staged: the pathspec commit left it out)
committed: A added.txt / R100 old.txt new.txt
$ git commit -q -m planb -- plana.txt; git add -- keep.txt; git commit -q --amend --no-edit -- keep.txt
M keep.txt / M plana.txt
$ git revert --no-commit HEAD~1; git commit -q -m revert -- $(git diff --cached --name-only --no-renames)
revert staged: added.txt new.txt old.txt; committed: D added.txt / R100 new.txt old.txt
$ git grep -n -e '<base>\.\.<step>' -- skills README.md docs
skills/land/SKILL.md:60:4. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, ...
skills/land/SKILL.md:164:- When `<base>..<step>` holds no commit, it skips both cherry-picks.
skills/land/SKILL.md:165:  - It prints `nothing to copy: <base>..<step> holds no commit` in place of the cherry-picks' output.
$ git grep -n -i -e 'nothing staged' -e 'something staged' -- skills
skills/land/SKILL.md:209 (Stops row "Main not clean"), skills/spec/SKILL.md:61 (Steps 1 preflight), skills/spec/SKILL.md:407; no other skill text
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `plan-orchestration` "Two steps in flight" states the limit (read at each pick, counted over every open plan's dispatch block, projects form, a configuration block's leftover line read as absent); Steps 2 and 5 name that section; `spec` "What it reads" 3, Steps 9 and the Stops row "A step in flight" read `.agents/plan.yaml`'s key; `plan` Steps 4 no longer lists the key; the template has no `workers_at_once:` line and its dispatch comment names `.agents/plan.yaml`; both `plan.yaml` comments keep `# optional, default 1.` (template) and add "across every open plan"; `plan.projects.yaml` unchanged; glossary configuration block and in flight rewritten.
- 2: holds. The compare is stated in `spec` Steps 1 (by reading, page's commands with filters, rewrite on a difference, Steps 4 names it under "What is on the tree", one of the session's own records); `land` Steps 2 names it and Steps 9 and 12 carry it; `plan` Steps 4 states the copy rule; no script changed.
- 3: holds. `plan-orchestration` "What it reads" 3, Steps 1 and "Resuming, and handing the plan over" read every open plan's dispatch block; `spec` "What it reads" 3 and Steps 5 read each brief from its own plan's `agents/briefs/`; glossary dispatch block rewritten.
- 4: violated, Spec 1 (`land` Steps 4 and "The landing script" still write the branch as `<step>` in `<base>..<step>`).
- 5: holds. Every commit sentence of `skills` either carries the two-part form or names the place in its skill that states it (`plan-orchestration` "Resuming, and handing the plan over", `spec` Steps 6, `land` Steps 12, `plan` Steps 6, `diagnose` Steps 20, a bullet pair under grill Steps 10, roadmap Steps 5, plan-retro Steps 15, ordo-init Steps 14, repo-setup Steps 12); `--no-renames`, the amend, the revert, the closing's three commits with `git mv`, the launch commit run by hand, the order rule in `land` Rules named from "Two steps in flight" are all present. The rationale sentence added under the order rule is Standards 2.
- 6: holds. The rule is stated in "Resuming, and handing the plan over" (own plan's records, the choices file whole with ADR 0005's reason, a session that stops commits every plan's records, a step's stop commits its own plan's only); each listed place names its own plan; `spec` Steps 1 lists another plan's records and leaves them. One further sentence the rule makes loose is Standards 4.
- 7: holds. `plan-orchestration` Steps 2 replaces the old lines with the slot pick, the blocked shared-file step and the hold for a step that runs alone.
- 8: holds. "Two steps in flight" carries every listed rule across plans; `spec` Steps 5 and 9, the template comment and the glossary shared path name the other step's plan and step.
- 9: holds. Steps 5 and "Stops" scope the pause; the position line in "Reports" and the template line say where it is written; glossary pause rewritten. The end condition of Steps 10 under `/plan-orchestration <entry>` is Spec 2.
- 10: holds. "Reports" gives one position line per open plan with its open items, landed steps grouped by plan with landing report paths, then choices; the landing report stays per step with its own plan's line; glossary position line rewritten.
- 11: holds. `plan-orchestration` "Resuming", `land` Steps 10 and Rules, template line 3 and the "Current position" heading.
- 12: holds. `references/self-rule.md` "Next-entry mode" takes the next entry without an open plan while other plans go on, blocks only that entry, ends the run when no open plan has an unblocked step and no entry can be taken; glossary next-entry mode rewritten.
- 13: holds. "What it reads" 5, "The recurring-findings pass" (per plan), "The pace when a deadline is set" (every agent, every open plan's state file, every open plan paused); glossary night rule rewritten.
- 14: violated, Spec 2 (Steps 2 "Done when" and Steps 10 end the `<entry>` run on every open plan's state) and Standards 3 (`ordo-help` reads no roadmap for the order it prints in).
- 15: violated, Standards 1 (the new entry **open plan** names four "Stated in" places, none of which states the definition, and the one sentence that did state it was removed from `references/self-rule.md`).
- 16: holds. Versions as printed above equal item 16; every description at most 1,024 characters (plan-orchestration 1018).
- 17: violated, Spec 1 (`<base>..<step>` left in `land`), Standards 2 (a new false sentence in `land` Rules) and Standards 4 (`spec` Rules).

Cases of the brief's "Cases":

- D15: met. `spec` "What it reads" 3 and the Stops row refuse `/spec 2.I 3` when the steps in flight of all open plans reach `.agents/plan.yaml`'s `workers_at_once` (2); the template has no `workers_at_once:` line (`grep -c` 0) and `plan` Steps 4 does not list it.
- D16: met. `spec` Steps 1 rewrites the list with the page's command and its filter and Steps 4 names the change in the brief; `land` Steps 2 does the same before `land.sh`; an equal list "is left as it is"; no script named.
- D17 and D22, simple merge: met. `spec` "What it reads" 3 and Steps 5 read plan A's dispatch block and brief; Steps 9 writes `shared_paths:` with the file, the other plan and step, and why.
- D21 and D22, not simple: met. `spec` Steps 5 makes the step wait; `plan-orchestration` Steps 2 blocks it and gives the slot to the next pick.
- D18: partial. `spec` Steps 7 gives `git worktree add -b 2-i-several-plans-in-one-session-1 .agents/worktrees/2-i-several-plans-in-one-session-1 <base>` and `land` "The landing script" gives the `land.sh` invocation with `<slug>-<step>`; but `land` Steps 4 still reads `git cherry-pick -n <base>..<step>`, Spec 1.
- The projects form, a worktree that exists: met. `spec` Steps 1 preflight and the Stops row "A worktree or branch that exists" refuse the second `/spec`, naming `.agents/worktrees/1-setup-1`, resumed when the holding step lands.
- D19: met. Read sentence by sentence (see item 5); a landing names a rename's old path through `--no-renames` (scratch run above); a stop's new report is staged by the form's `git add -- <path>` bullet in "Resuming".
- D19, the order rule: met. `land` Rules states it; "Two steps in flight" names it.
- D20: met. `land` Steps 12 commits only this plan's ledger files and says another open plan's modified file waits for that plan's resume point.
- D21, the order: met. Steps 2's first sub-bullet gives 2.I's step to the first slot and 2.J's first step to the second.
- D22, a step that runs alone: met. Steps 2 holds the loop until nothing else is in flight and the step is dispatched.
- D23: met. "Stops" and Steps 5 hold only the named plans and write PAUSED in each held plan's position line.
- D24: met. "Reports" and Steps 10, read in place.
- D25: met. `land` Rules and the template no longer say main's head carries a state file that describes main's head; a landing rewrites only its own plan's state file.
- D26: met. "Next-entry mode", read in place.
- D27: met. "The recurring-findings pass" and "The pace when a deadline is set".
- D28: partial. Quick start, "What it reads" 1, Steps 2, `ordo-help`, README and the regenerated band say what the case asks; `/plan-orchestration 2.I` alone still ends only by every open plan's state, Spec 2.
- The glossary: met. The block equals the template (diff empty); the entries items 1 to 14 name state the rules as the skill texts do. The new entry is Standards 1.
- The configuration templates: met. `plan.yaml` line 21 opens `# optional, default 1.`; `check_config.test.sh` prints `PASS: check_config.py scratch tests`.
- The versions: met. As printed above.

## 1. Spec

1. `skills/land/SKILL.md` Steps 4 and "The landing script": "4. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base" and "- When `<base>..<step>` holds no commit, it skips both cherry-picks. / - It prints `nothing to copy: <base>..<step> holds no commit`". What is wrong: item 4 asks that "the Steps and Stops lines that write `<step>` or `<step>-land` for the branch write `<slug>-<step>` and `<slug>-<step>-land`, or name the branch as the worktree folder's name". In these three places `<step>` is the branch (the cherry-pick range end and the argument `land.sh` prints), and the same section two bullets above now calls that argument `<slug>-<step>` and defines `<step>` only as the step id. The builder's report marks item 4 DONE with "land 'The landing script', Steps, Stops". Failure scenario: `land.sh` exits 2 on a conflict and Steps 4 tells the session to resolve it; the session reading Steps 4 for step 1 of plan 2.I runs `git cherry-pick -n <base>..1`, a revision git does not know (or, in a repository with a tag or branch named `1`, the wrong range), in place of `<base>..2-i-several-plans-in-one-session-1`. A reader of "The landing script" sees `nothing to copy: <base>..1` described while `land.sh` prints the branch name. Verdict: item 4 violated, item 17 violated, case D18 partial.

2. `skills/plan-orchestration/SKILL.md` Steps 2 and Steps 10: "- Done when a step is picked for each free slot, or no open plan has an unblocked step." and "- The loop ends only at a pause of every open plan or when no open plan has an unblocked step". What is wrong: item 14 (D28) makes `/plan-orchestration <entry>` run that plan alone, and Steps 2 says it "picks from that plan alone"; the introduction says "until a pause of every plan it runs or until none has an unblocked step left". Steps 2's completion criterion and Steps 10's end condition are written over every open plan, so for a run of one named plan neither can be met while another open plan has an unblocked step or is not paused. Failure scenario: `/plan-orchestration 2.I` while plan 3 is open with an unblocked step; 2.I's last open step waits on the user. Steps 2 picks nothing from 2.I, yet Steps 2 is not "done" and Steps 10 says the loop does not end, so the orchestrator either waits with no exit or dispatches plan 3's step to reach the end condition, against "runs that plan alone". The same holds for "pause plan 2.I" during `/plan-orchestration 2.I`. Verdict: item 14 violated, case D28 partial.

3. `skills/land/SKILL.md` Steps 12 against `docs/adr/0012-every-commit-on-main-names-its-paths.md`, Decision: "The landing commit takes its paths from `git diff --cached --name-only`." The diff writes "every path from `git diff --cached --name-only --no-renames`, so a rename's old path is named too", as the brief's item 5 and Decision 3 ask. What is wrong: the ADR in force (status proposed) now names a command the skill does not use, and the step's paths do not include the ADR, so `docs/dev/change-standard.md` rule 5 ("the ADR that owns the decision when the change touches one") and rule 19 (no two statements that contradict) are left to the orchestrator; the builder reported it under "Anything in the brief that was wrong or impossible". The scratch run above shows `--name-only` lists only `new.txt` for a rename, and a commit naming only that path leaves the old path's deletion staged. Failure scenario: a reader who implements or reviews the landing from ADR 0012 uses `--name-only`; the rename's deletion stays staged after the landing commit and is swept into the next commit made on main. Verdict: none of the items (the brief asked for `--no-renames`); the ADR sentence needs a landing fix or a Doc text from the orchestrator.

## 2. Proof

1. The builder's report, "The terms", **open plan**: "Stated in: plan-orchestration 'What it reads' 1, self-rule 'Next-entry mode', spec 'What it reads' 3 and ordo-help 'What it reads' 3, each found by `grep -n -i 'open plan'`." What is wrong: the grep finds each section using the term, not stating it; reading the four sections shows none states "a folder under `ledger_root` ... outside `archive_root` ... whose `plan.md` opens with `# Plan: <entry>`" (see Standards 1). The decision resting on it is the glossary entry's "Stated in" pointer, which the brief's report section requires to be checked against the section it names. Failure scenario: the orchestrator accepts the entry as checked and lands a glossary pointer to four places that do not define the term. Verdict: item 15 violated (with Standards 1).

## 3. Standards

1. `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, entry **open plan**: "a plan whose ledger folder stands under `ledger_root` (in the `projects:` form, under a project's `ledger_root`), outside `archive_root`, and whose `plan.md` opens with `# Plan: <entry>`. Stated in: `plan-orchestration`, "What it reads" 1 and `references/self-rule.md`, "Next-entry mode"; `spec`, "What it reads" 3; `ordo-help`, "What it reads" 3." And `skills/plan-orchestration/references/self-rule.md` "Next-entry mode", removed line: "- An entry with a plan open (a folder under `<ledger_root>/`, outside `<archive_root>/`, whose `plan.md` opens with `# Plan: <entry>`) is run by the orchestrator through the loop on that plan". What is wrong: the removed bullet was the only sentence in `plan-orchestration` that stated what an open plan is; none of the four sections the entry names states it (they use the term). `docs/dev/skill-layout.md` "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in") and the glossary's own "Stated in" convention require a place that states it. Failure scenario: an orchestrator in a repository whose ledger root holds a folder with a `plan.md` whose first line is not `# Plan: ...` (a `rulings/` folder, a `retros/` folder) follows the "Stated in" pointer to `plan-orchestration` "What it reads" 1, finds no definition, and counts that folder's state file (or its absence) as an open plan when it counts steps in flight or orders the report. Verdict: item 15 violated.

2. `skills/land/SKILL.md` Rules: "- The range stays staged on main until that commit, and a skill started then refuses on its nothing-staged preflight." What is wrong: a sentence the diff adds that is false. `git grep -n -i -e 'nothing staged' -e 'something staged' -- skills` finds such a preflight only in `spec` Steps 1 and `land`'s Stops row "Main not clean"; `/grill`, `/plan`, `/roadmap`, `/diagnose`, `/plan-retro`, `/ordo-init` and `/repo-setup` have none, and ADR 0012's own "Alternatives rejected" names only `/spec`. `docs/dev/change-standard.md` rule 14 makes a false sentence a defect of the change. Failure scenario: in next-entry mode with a landing of another plan staged, the orchestrator relies on this sentence and starts `/grill <entry> --self-rule`, expecting a refusal; `/grill` runs and commits, breaking the order rule without any refusal to surface it. Verdict: item 17 violated.

3. `skills/ordo-help/SKILL.md` "What it reads" and Steps 3: Steps 3 reads "For `/ordo-help` with no entry, print the position of each open plan in the roadmap's order"; "What it reads" lists `.agents/plan.yaml`, the ledger folder for `<entry>`, the state files and the choices file, and no roadmap file. What is wrong: `docs/dev/skill-layout.md` "Sections, in order", row 4: "A numbered list, one input per item"; the roadmap file (and, in the `projects:` form, the order of projects in `.agents/plan.yaml`, which `plan-orchestration` Steps 2 states) is an input the step needs and is not listed. Failure scenario: an agent running `/ordo-help` with no entry reads only the listed inputs and prints the open plans in folder-name order (for example `2-i-...` before `2-1-...` or `3-...` in an order that differs from the roadmap), so the positions do not appear in the order the orchestrator's report uses. Verdict: item 14 violated.

4. `skills/spec/SKILL.md` Rules: "- Every other record stays on disk in the main checkout until the next resume point." What is wrong: under D20 (item 6) a record waits for the next resume point of its own plan; another plan's resume point does not carry it. The sentence is now false as written (rule 14), while Steps 1 and 6 in the same file say "of this plan". Failure scenario: a session preparing a step of plan B reads Rules, takes plan A's report on disk as due at "the next resume point", and names it in plan B's preparation commit. Verdict: item 17 violated.

5. One rule per bullet (`docs/dev/skill-layout.md` "Lists and tables", and "Sections, in order" row 5 "one action per item"):
   - `skills/spec/SKILL.md` Steps 1: "- A change under another open plan's ledger folder is a record of that plan: it is listed by path and left alone, and it is not one of the user's changes." (three requirements; the bullets above it split "listed by path" and "It is left alone" into a bullet and a sub-bullet).
   - `skills/plan-orchestration/SKILL.md` "Resuming, and handing the plan over": "- A plan's state file is rewritten before every step commit of that plan, so it describes that plan as of its own last resume point, and a commit of one plan rewrites no other plan's state file." (two requirements that can each be broken while the other holds).
   - `skills/plan-orchestration/references/self-rule.md` "Next-entry mode": "- The next entry therefore waits at every closing for the user's approval of that diff, and only that entry waits: the steps of the other open plans go on." (two requirements).
   - `skills/plan-orchestration/SKILL.md` "Stops": "- A pause the user asks for holds every open plan unless the user names the plans it holds, and it holds until they lift it." (scope and duration, two requirements).
   - `skills/land/SKILL.md` Steps 2: the item "Set `landing: cherry-picking` in the dispatch block." now carries a second action, "Then compare the plan's verify list ... and rewrite it", with no completion criterion for either ("Writing for an agent": each item of Steps ends on its completion criterion).
   Failure scenario: a reviewer or a repair builder checking one requirement of such a bullet cannot tell where it ends; in `land` Steps 2 a session that has set `landing: cherry-picking` reads the item as done and runs `land.sh` with the old verify list. Verdict: none of the items alone; recorded against the conventions the brief names.

## 4. Behaviour

1. The builder's report, "Host- or user-visible changes, before and after", omits three changes the user sees: the recurring-findings pass now runs per plan, at every tenth landed step of each plan and over that plan's reports only (before: every tenth landed step of the session's plan run); the night rule is written into every open plan's state file and pauses every open plan at the cut-off (before: the one plan's state file, "The plan is paused"); next-entry mode now takes the next entry without a plan while the other plans' steps go on, and a `/grill` round of the six kinds no longer ends the turn but blocks only that entry (before: "A `/grill` round of decisions of the six kinds ends the turn"). `docs/dev/change-standard.md` rule 7 requires every user-visible change with its before and after. Failure scenario: the user reading the report expects the run to stop at a `/grill` round as before, and does not learn that other plans' builders keep running while the question waits. Verdict: none of the items.

## Declined to judge

- Whether `plan-orchestration` Steps 1's effort checks ("each level `high` when the configuration block has no such key") mean each plan's configuration block or one block: the rulings D15 to D28 do not say which plan's `worker_effort` and `reviewer_effort` govern a multi-plan run; settled by the orchestrator's reading of the rulings or a ruling.
- Whether `/plan-orchestration <entry>` on resumption should wait for running builders of other plans ("On resumption, each open plan's dispatch block is resolved"): D17 says the skills read every open plan's block to resume, and D28 says `<entry>` runs that plan alone; the texts follow both and the rulings do not rank them.
- The plan's whole verify list (`land.test.sh`, `pin.test.sh` and the rest): the brief keeps it for landing on main.
- `python3 docs/figures/gen_figures.py` was not run in the worktree, since it writes beside itself; it was run on a copy in the scratchpad, and both written figures are byte-equal to the worktree's (`cmp` above), so the worktree's `plan-loop.svg` is the script's output and `pipeline.svg` is unchanged.
- Sentence length across all 480 changed lines against the prose standard's "under roughly 20 words unless the mechanism needs more": the long lines read (descriptions, the dispatch comment, glossary entries, the `/spec refuses` sequence line) carry lists of keys or places, which the builder's report names; no further sentence was judged over the limit.

Reviewer usage: afa9f0216c64339f0, claude-opus-5-5, 295878 tokens, 56 tool uses, 9 min 43 s.

## Repair round 1, refuted

Worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/2i-1, base cc1fd7a. Read-only throughout. Every verification command below was run from the worktree root in this review.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ git ls-files -coz --exclude-standard -- skills docs README.md .agents/plan.yaml | xargs -0 perl -CSD -ne '<the brief's character-set check>'
(no output)
exit 0
$ git grep -n -e 'worktree_root>/<step>' -e '\-b <step>' -- skills docs README.md ':!skills/land/templates/land.sh'
(no output)
exit 1
$ git grep -n -e '<base>\.\.<step>' -- skills README.md docs ':!skills/land/templates/land.sh'
(no output)
exit 1
$ git grep -n workers_at_once -- skills docs README.md .agents/plan.yaml
16 hits: .agents/plan.yaml:14, docs/glossary.md:55, skills/ordo-help/SKILL.md:96, skills/plan-orchestration/SKILL.md:294, 295, 296, skills/plan/templates/orchestrator-state.md:33, skills/plan/templates/plan.md:25, skills/plan/templates/plan.projects.yaml:23, 50, skills/plan/templates/plan.yaml:21, skills/repo-setup/templates/plan-terms.md:50, skills/spec/SKILL.md:37, 227, 228, 413 (each reads the key from .agents/plan.yaml, or is a plan.yaml template line)
$ grep -c 'workers_at_once:' skills/plan/templates/orchestrator-state.md
0
$ python3 -I <scratchpad>/figs2/gen_figures.py   (a copy of docs/figures/gen_figures.py; the worktree was not written)
wrote scratchpad/figs2/pipeline.svg (31539 bytes)
wrote scratchpad/figs2/plan-loop.svg (31979 bytes)
exit 0
$ cmp <scratch>/pipeline.svg docs/figures/pipeline.svg ; cmp <scratch>/plan-loop.svg docs/figures/plan-loop.svg
pipeline.svg equal
plan-loop.svg equal
$ git status --short docs/figures
 M docs/figures/gen_figures.py
 M docs/figures/plan-loop.svg
$ python3 -c '<description lengths>' (12 skills)
plan-orchestration 1018 / spec 1003 / land 725 / refute 989 / plan 477 / ordo-help 564 / grill 877 / roadmap 1022 / plan-retro 616 / ordo-init 632 / repo-setup 783 / diagnose 965
$ grep -m1 'version:' over the twelve skills
plan-orchestration 5.0.0 / spec 5.0.0 / land 3.0.0 / refute 3.0.1 / plan 4.0.0 / ordo-help 3.1.0 / grill 1.3.1 / roadmap 1.3.1 / plan-retro 1.2.2 / ordo-init 2.0.1 / repo-setup 4.0.0 / diagnose 2.1.1
$ git status --short
22 modified paths (.agents/plan.yaml, README.md, docs/figures/gen_figures.py, docs/figures/plan-loop.svg, docs/glossary.md, 12 skills' SKILL.md files incl. plan-orchestration/references/self-rule.md, plan/templates/orchestrator-state.md, plan.md, plan.yaml, repo-setup/templates/plan-terms.md) and ?? .scratch/2-i-several-plans-in-one-session/agents/reviews/1-report.md; every one is in "Paths this step writes"
$ git diff cc1fd7a --stat | tail -1
22 files changed, 297 insertions(+), 208 deletions(-)
$ diff <(sed -n '/<!-- ordo:plan-terms begin -->/,/<!-- ordo:plan-terms end -->/p' docs/glossary.md | sed '1d;$d') skills/repo-setup/templates/plan-terms.md
(no output; "glossary-block-equal")
$ git grep -n -i -e '\bcommit\b' -e 'commits ' -e 'committed' -e 'amend' -- skills | wc -l
269   (equals the round report's figure)
$ sed -n 35,39p skills/plan-orchestration/SKILL.md
item 1 of "What it reads", with the open-plan definition at line 38 and "A folder without such a plan.md is no plan." at line 39 (equals the round report's claim of lines 38 and 39)
$ git grep -n -i -e 'nothing staged' -e 'something staged' -- skills
skills/land/SKILL.md:59, 212, 219; skills/spec/SKILL.md:61, 410; skills/land/templates/land.sh:281, 287, 328
```

The round's tree state was not recorded, so the delta was identified from the places the round brief names, read against the whole diff since the base. The claims in the report's "Repair round 1" section that I could rerun (line numbers, the 16 and 269 counts, the 22-path status, the stat line, the sub-bullet lines, the figure bytes) all reproduce.

### Closure of each earlier finding

- Spec 1 (land Steps 4 and "The landing script"): closed. `skills/land/SKILL.md` Steps 4 reads `git cherry-pick -n <base>..<slug>-<step>`; "The landing script" reads `<base>..<slug>-<step>` in both bullets, and the Stops bullets read `<slug>-<step>` and `<slug>-<step>-land`. The `<base>..<step>` grep is empty. The only remaining `<step>` in land is the step id in `agents/reviews/<step>-...` paths.
- Spec 2 (plan-orchestration Steps 2 "Done when", Steps 10): closed at the two places the ruling names. Steps 2 reads "none of the plans the invocation runs has an unblocked step"; Steps 10 reads "The loop ends only at a pause of every plan the invocation runs or when none of them has an unblocked step." The same defect remains elsewhere: see Spec N1.
- Spec 3 (ADR 0012 `--name-only`): no change by ruling, raised by the orchestrator to the user; not counted.
- Standards 1 and Proof 1 (open plan): closed. The definition is stated once, as sub-bullets of `skills/plan-orchestration/SKILL.md` "What it reads" 1 (lines 38 and 39). The glossary entry **open plan** in the template and in the block names only `plan-orchestration`, "What it reads" 1 under "Stated in", and the block equals the template. I read that section and it states the definition (with the `projects:` form and the exclusion of `archive_root`).
- Standards 2 (land Rules): closed. The clause on a nothing-staged preflight is gone; the line reads "The range stays staged on main until that commit." Nothing was written in its place. No other skill text claims that a started skill refuses.
- Standards 3 (ordo-help "What it reads"): closed. Item 5 is the roadmap file `.agents/plan.yaml`'s `roadmap:` names, with the `projects:` order as a sub-bullet. It is appended after item 4, so items 1 to 4 keep their numbers.
- Standards 4 (spec Rules): closed. The bullet reads "...until the next resume point of its own plan."
- Standards 5 (one requirement per bullet): closed for the five places. The spec Steps 1 bullet has three sub-bullets. The state-file sentence of "Resuming, and handing the plan over" is two bullets. The self-rule closing-wait bullet is two bullets. The Stops pause bullet is a scope with two sub-bullets. land Steps 2 keeps "Set `landing: cherry-picking`..." with five sub-bullets ending "Done when `landing: cherry-picking` is set and the verify list equals the page's commands."
- Behaviour 1: closed. The report's "Host- or user-visible changes, added" gives the before and after of the recurring-findings pass, the night rule and next-entry mode. Each statement matches the diff.
- Declined to judge, effort and models: closed. "Two steps in flight" holds the bullet "Each step is prepared, built and reviewed under its own plan's configuration block: worker, reviewer, efforts, review cadence and repair rounds." Steps 1's agent check reads "the effort agents each plan the run runs names in its configuration block".
- Declined to judge, resumption under `/plan-orchestration <entry>`: the content is in "Resuming, and handing the plan over". Its form is Standards N1.

The builder's reading of `CLAUDE_CODE_EFFORT_LEVEL` is correct. The ruling's replacement words ("the effort agents each plan the run runs names in its configuration block") fit only the agent-listing check. The environment variable is a property of the process that runs every agent, no plan's block holds it, and one check before the first dispatch covers every plan. Leaving that bullet unchanged is not a removed check and not a narrower fix.

### Verdicts (whole diff since the base)

Items of "What to build":

- 1: holds. "Two steps in flight" "The limit" bullet and its two sub-bullets; spec "What it reads" 3 and the Stops row; `workers_at_once` grep (16 hits, each reads `.agents/plan.yaml`); template grep 0; `check_config.test.sh` PASS.
- 2: holds. spec Steps 1 and 4, land "What it reads" 8, Steps 2, 9, 12; plan Steps 4.
- 3: holds. plan-orchestration "What it reads" 3, Steps 1, "Resuming"; spec "What it reads" 3 and Steps 5.
- 4: holds. spec Steps 7 and 9 and the Stops row; land Steps 4, "The landing script", Stops; `<base>..<step>` and `-b <step>` greps empty.
- 5: holds. The form is stated once per skill and named elsewhere (plan-orchestration "Resuming", spec Steps 6, land Steps 12, plan Steps 6, diagnose Steps 20, the bullet pairs under grill, roadmap, plan-retro, ordo-init, repo-setup); `--no-renames`, the amend, the revert and the order rule are present; 269 hits, the round added no commit sentence.
- 6: holds. "Resuming" (own plan's records, choices file whole under ADR 0005, a stop commits its own plan's only, a session that stops commits every plan's).
- 7: holds. plan-orchestration Steps 2.
- 8: holds. "Two steps in flight"; spec Steps 5 and 9; template comment; glossary shared path.
- 9: holds. Steps 5 and Stops scope the pause and say where it is written; Reports and the template line carry the PAUSED form.
- 10: holds. "Reports"; land Steps 11.
- 11: holds. "Resuming" (state-file bullet pair), land Steps 10 and Rules, template line 3 and heading.
- 12: holds. self-rule "Next-entry mode" follows D26 as ruled. The `<entry>` run reading of the same section is Spec N1, filed under item 14.
- 13: holds. "What it reads" 5, "The recurring-findings pass", "The pace when a deadline is set".
- 14: violated, Spec N1 (the end condition and "go on" wording of self-rule "Next-entry mode" is still written over every open plan, against `/plan-orchestration <entry>` running that plan alone). The ordo-help input gap of the first report is closed.
- 15: holds. The definition is in plan-orchestration "What it reads" 1 and the entry names that place alone; template and block equal.
- 16: holds. Versions and description lengths as printed above (maximum 1018).
- 17: holds. land `<slug>-<step>`, the land Rules sentence and the spec Rules sentence of the first report are all corrected. The greps of the brief's item 17 for the changed names show no hit left false, except self-rule line 91 and the "other plans go on" lines that Spec N1 names.

Cases:

- D15: met. spec "What it reads" 3, Steps 9, Stops row "A step in flight" count every open plan's block against `.agents/plan.yaml`'s limit; the template holds no `workers_at_once:` line (grep 0); plan Steps 4 no longer lists the key.
- D16: met. spec Steps 1 compares, rewrites and keeps an equal list; land Steps 2 does the same before `land.sh`; no script named.
- D17 and D22, simple merge: met. spec "What it reads" 3, Steps 5 and 9.
- D21 and D22, not simple: met. spec Steps 5 waits; plan-orchestration Steps 2 blocks it and gives the slot to the next pick.
- D18: met. spec Steps 7 gives `git worktree add -b <slug>-<step> <worktree_root>/<slug>-<step> <base>`; land Steps 4 and "The landing script" give `<slug>-<step>` throughout.
- The projects form, a worktree that exists: met. spec Steps 1 preflight and Stops row "A worktree or branch that exists" name the path or branch and resume when the holding step lands.
- D19: met. Read sentence by sentence; a landing names a rename's old path through `--no-renames`; a stop's new report is staged by the form's `git add --` bullet.
- D19, the order rule: met. land Rules and plan-orchestration "Two steps in flight".
- D20: met. land Steps 12.
- D21, the order: met. plan-orchestration Steps 2.
- D22, a step that runs alone: met. plan-orchestration Steps 2 and "Two steps in flight".
- D23: met. Stops and Steps 5.
- D24: met. "Reports" and Steps 10.
- D25: met. land Rules; template line 3.
- D26: met. self-rule "Next-entry mode" for the all-plans run.
- D27: met. "The recurring-findings pass" and "The pace when a deadline is set".
- D28: partial. Quick start, "What it reads" 1, Steps 2, Steps 10, ordo-help, README and the band say what the case asks, and `/ordo-help` with no entry is covered. The missing part: the `<entry>` run's end under next-entry mode, Spec N1.
- The glossary: met. The block equals the template; the entries named by items 1 to 14 read as the skill texts do.
- The configuration templates: met. `plan.yaml` line 21 opens `# optional, default 1.`; `check_config.test.sh` PASS.
- The versions: met. As printed above.

## 1. Spec

1. `skills/plan-orchestration/references/self-rule.md` "Next-entry mode", line "- The run ends when no open plan has an unblocked step and no next entry can be taken." (also "...while the steps of the other open plans go on." in the section's opening sentence, "Only that entry waits, and the steps of the other open plans go on.", "Such a stop blocks only that entry, and the steps of the other open plans go on.", and "The steps of the other open plans go on while the first two run."). What is wrong: this is the defect of the first report's Spec 2, left standing in a place the round's ruling did not name. D28 and `SKILL.md` Steps 2 make `/plan-orchestration <entry>` run that plan alone, and `SKILL.md` Steps 10 now says the run after a closing "ends in one of the cases `references/self-rule.md`, "Next-entry mode", lists", but that section's end condition is written over every open plan, and its wording says other plans' steps go on although an `<entry>` run does not work them. Failure scenario: `/plan-orchestration 2.I` with `next_entry: on`, 2.I closes, plan 3 stays open with an unblocked step. Steps 10 says the loop ended at "none of them has an unblocked step" for the plans it runs, while the self-rule case says the run ends only when no open plan (plan 3 included) has an unblocked step. The orchestrator either waits with no exit or dispatches plan 3's step against "runs that plan alone". Verdict: item 14 violated; case D28 partial.

## 2. Proof

none.

## 3. Standards

1. `skills/plan-orchestration/SKILL.md` "Resuming, and handing the plan over", the lead-in to the resumption bullets: "On resumption, every open plan's dispatch block is read for the count and the path comparison, and only the steps of the plans the invocation runs are resolved and worked, another plan's running builder being left to the session that runs that plan, and for each step a resolved block holds:". What is wrong: the round's ruling asked for the content in this sentence, but the form is the builder's. `skills/repo-setup/templates/docs/dev/prose-standard.md` E, "Sentence length: under roughly 20 words unless the mechanism needs more": this one is about 58 words and joins three requirements (read every block, resolve only the invoked plans' steps, leave another plan's running builder alone); its ending "and for each step a resolved block holds:" leads into bullets that also cover a dead builder's report and a continuation builder, which no "resolved block holds". `skill-layout` "Lists and tables" asks one requirement per statement. Failure scenario: a session resuming `/plan-orchestration 2.I` while plan 3's builder is running checks one of the three requirements and cannot tell from the sentence where the others end; a later edit to the "left to the session that runs that plan" clause cannot be made without rewriting the sentence the bullets hang on. Verdict: none of the items alone; recorded against the prose standard and the skill layout.

## 4. Behaviour

none.

## Declined to judge

- Whether the `/plan-orchestration <entry>` run should take the next entry at all after its plan closes (D26 speaks of other plans going on; D28 says the named plan alone). The rulings do not rank them, so the orchestrator or the user settles it; Spec N1 states only the inconsistency.
- The plan's whole verify list (`land.test.sh`, `pin.test.sh`): the brief keeps it for landing on main.
- ADR 0012's `--name-only` sentence: ruled "no change in this round" and raised to the user.
- Whether the effort-agent check of Steps 1 covers a plan opened mid-run by next-entry mode (its block is unread when the check runs): the text names "each plan the run runs" and the rulings do not say, so it is for the orchestrator's reading.

Reviewer usage: a06100f8bf1b72886, claude-sonnet-5-5, 225180 tokens, 31 tool uses, 5 min 21 s.

## Closed

- First run, Spec 1, Spec 2, Standards 1 to 5, Proof 1, Behaviour 1 and the two points declined to judge: closed by the builder in repair round 1, as the run over the round records.
- First run, Spec 3 (ADR 0012's `--name-only`): raised to the user as the open item "ADR 0012, the landing commit's paths".
- Round 1, Spec N1 (self-rule "Next-entry mode" written over every open plan): small and inside the brief (item 14), fixed at landing: the section speaks of the plans the invocation runs, defined in a new first bullet as every open plan under `/plan-orchestration` with no entry and `continue the plan`, and the named plan and the plan of each next entry the run takes under `/plan-orchestration <entry>`; the run ends when none of them has an unblocked step and no next entry can be taken.
- Round 1, Standards N1 (the resumption lead-in of 58 words): small and inside the brief, fixed at landing: the sentence is split into one bullet per requirement under a short lead-in.
