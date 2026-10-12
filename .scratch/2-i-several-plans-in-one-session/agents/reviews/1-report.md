# Report: step 1, several plans in one session in the skill texts

Everything in the brief is done.

## Open items of the state file

none

## The cases' first run (unchanged tree, base cc1fd7a, run before any change)

No case is one the brief's own rules get wrong, so the builder did not stop before the change. Each case failed on the unchanged tree as listed, except the glossary and configuration-template cases, which held.

- D15, the one limit: read in place, `skills/spec/SKILL.md` "What it reads" 3 and the Stops row "A step in flight" tied the limit to the configuration block and to any single step in flight. `git grep -n workers_at_once HEAD -- skills docs README.md .agents/plan.yaml` printed hits at .agents/plan.yaml:14, docs/glossary.md:31 and 55, plan-orchestration 55, 93 and 276, plan SKILL 154, orchestrator-state.md 21 and 34, plan.projects.yaml 23 and 50, plan.yaml 21, plan-terms.md 26 and 50, spec 213 and 214. `git grep -c 'workers_at_once:' HEAD -- skills/plan/templates/orchestrator-state.md` printed 1. The case failed.
- D16, the verify list kept equal to the verification page: spec Steps 1 and land Steps 2 held no compare of the verify list with the page; the only verify-list lines were about running it at landing. The case failed.
- D17 and D22, a shared file simple to merge: spec Steps 5 compared a brief only with the steps in flight of its own plan's dispatch block, and plan-orchestration Steps 2 line 52 read `A session runs one plan at a time.` The case failed.
- D21 and D22, a shared file not simple to merge: the pick took the next unblocked step of one plan; no rule picked across plans. The case failed.
- D18: `git grep -n -e 'worktree_root>/<step>' -e '\-b <step>' HEAD -- skills docs README.md ':!skills/land/templates/land.sh'` printed docs/glossary.md:138, skills/land/SKILL.md:152, skills/repo-setup/templates/plan-terms.md:133 and skills/spec/SKILL.md:193 (`git worktree add -b <step> <worktree_root>/<step> <base>`). The case failed.
- The projects form, a worktree that exists: spec had no refusal for an existing worktree path or branch. The case failed.
- D19: `git grep -n -i -e '\bcommit\b' -e 'commits ' -e 'committed' -e 'amend' -- skills` showed commits made by `git add` and a bare commit, or by "path", and the form `git commit -- <path>` only at diagnose 305 and 306 and session-retro 149. Land's rename and amend (line 133 "the head is amended with its path") and revert (line 229) had no form. The case failed.
- D19, the order rule: land Rules and plan-orchestration "Two steps in flight" held no rule that a landing runs from its cherry-pick to its commit before any other commit or skill. The case failed.
- D20: land line 132 read `no ledger file the session wrote`, and spec, refute and diagnose read `the next resume-point commit carries` with no plan named. The case failed.
- D21, the order: plan-orchestration Steps 2 lines 52 to 54 picked within one plan. The case failed.
- D22, a step that runs alone: "Two steps in flight" held the rule for steps of one plan only. The case failed.
- D23: plan-orchestration Steps 5 and Stops read a pause as the pause of the one plan. The case failed.
- D24: "Reports" held one position line. The case failed.
- D25: land line 233 and orchestrator-state.md line 3 said main's head carries a state file that describes it. The case failed.
- D26: self-rule "Next-entry mode" took the next entry only after the closing with its waits. The case failed.
- D27: the recurring-findings pass read "Every tenth landed step, and at any pause" and the night rule read "The plan is paused". The case failed.
- D28: no `/plan-orchestration` form without an entry, and no position list in `/ordo-help`, were stated. The case failed.
- The glossary: before any edit, the plan-terms block of docs/glossary.md compared with `plan-terms.md` through `diff` printed nothing (equal). The case held.
- The configuration templates: `skills/plan/templates/plan.yaml` line 21 opened `# optional, default 1.`, and `check_config.test.sh` printed `PASS: check_config.py scratch tests`. The case held.
- The versions: plan-orchestration 4.0.0, spec 4.1.0, land 2.0.0, refute 3.0.0, plan 3.0.0, ordo-help 3.0.0, grill 1.3.0, roadmap 1.3.0, plan-retro 1.2.1, ordo-init 2.0.0, repo-setup 3.0.0, diagnose 2.1.0, all descriptions at most 1,024 characters. The case failed against the target versions.
- The command forms of item 5, run in a scratch git repository: after `git cherry-pick -n` of a rename, `git diff --cached --name-only` listed only the new path and `--no-renames` also the old path. `git commit -m x -- planb.txt` while another file was staged recorded only planb.txt. `git commit -m land -- added.txt d/new.txt d/old.txt` recorded the rename. `git commit --amend --no-edit -- keep.txt` worked after `git add -- keep.txt`. `git revert --no-commit HEAD~1` followed by `git commit -m revert -- $(git diff --cached --name-only --no-renames)` worked with no refusal. The brief's command forms hold.

## DONE / NOT DONE

All commands run from the worktree root `/Users/axelfaes/workspace/ordo/.agents/worktrees/2i-1`.

| Item | Status | Places changed | Check and output |
| --- | --- | --- | --- |
| 1 D15 the one limit | DONE | plan-orchestration Steps 2 and 5 and "Two steps in flight" (the rule, "The limit" bullet at line 290); spec "What it reads" 3, Steps 9, Stops row "A step in flight"; plan Steps 4; orchestrator-state.md; plan.yaml line 21; .agents/plan.yaml line 14; glossary configuration block and in flight | `git grep -n workers_at_once -- skills docs README.md .agents/plan.yaml` (Verify 3 below) prints 16 hits, each reading the key from `.agents/plan.yaml`; `grep -c 'workers_at_once:' skills/plan/templates/orchestrator-state.md` prints 0; plan.projects.yaml unchanged |
| 2 D16 verify list equals page | DONE | spec Steps 1 (compare after the back-out bullet, new done criterion), Steps 4 (names the change in the brief); land "What it reads" 8, Steps 2 (compare and rewrite), Steps 9 (booking names it), Steps 10; plan Steps 4 (page's commands, each test command with the filter the page names); glossary verify list, verification page, booking | read in place: spec lines 95 to 98, land lines 43 and 52 to 53; no script and no change to `checks.sh` or `land.sh` (`git status --short` lists neither) |
| 3 D17 each plan's dispatch block read across plans | DONE | plan-orchestration "What it reads" 3, Steps 1, "Resuming, and handing the plan over" (line 230 "each open plan's dispatch block is resolved"); spec "What it reads" 3 (lines 36 to 41) and Steps 5 (line 174); glossary dispatch block | read in place at the lines named |
| 4 D18 and the projects form, worktree and branch names | DONE | spec Steps 7 (line 204 `git worktree add -b <slug>-<step> <worktree_root>/<slug>-<step> <base>`), Steps 9 (worktree path), Steps 1 preflight (line 83, refusal for an existing path or branch) and Stops row "A worktree or branch that exists"; land "The landing script", Steps, Stops (`<slug>-<step>`, `<slug>-<step>-land`); orchestrator-state.md line 53; README line 164; glossary worktree and slug | Verify 4 prints nothing, exit status 1 of grep (no match) |
| 5 D19 every commit names its paths | DONE | plan-orchestration "Resuming, and handing the plan over" (line 210 to 212 the form); spec Steps 6 (line 201) and the launch commits (lines 230 to 235); land Steps 12 (lines 128 to 139: `--name-only --no-renames`, `git add --`, `git commit -m <message> -- <path> ...`, amend form) and Rules (revert form, order rule at line 241); plan Steps 2 (closing, three commits, move via `--no-renames`), Steps 6; diagnose Steps 20 (lines 305 and 306) and the commit outside a plan; grill Steps 10, roadmap Steps 5, plan-retro Steps 15, ordo-init Steps 14, repo-setup Steps 12 and sync 9 (one bullet each); self-rule lines 31, 43, 164 and 167 | Verify 2 below, sentence by sentence |
| 6 D20 whose plan's commit carries a record | DONE | plan-orchestration "Resuming, and handing the plan over" (lines 213 to 224: own plan's records, choices file whole, session stop commits every plan, a step stop commits its own plan only), and the places the brief lists in plan-orchestration, self-rule (31, 43, 164), spec (Steps 1 line 71 and 65, Steps 6, "A stop" lines 275 and 315), land (88 to 91, 129), refute (80, 99), diagnose (71) | read in place at the lines named; glossary resume point and session, the |
| 7 D21 the order of picks | DONE | plan-orchestration Steps 2 (lines 54 to 63, replaced) | read in place |
| 8 D22 two steps in flight across plans | DONE | plan-orchestration "Two steps in flight" (lines 286 to 311); spec Steps 5 (line 181) and 9 (line 227); orchestrator-state.md line 33 (the dispatch comment, which now holds `shared_paths:`); glossary shared path | read in place |
| 9 D23 the scope of a pause | DONE | plan-orchestration intro, Steps 5 (line 102), Steps 10 (line 173), Reports (line 349), Stops (lines 380 and 413); orchestrator-state.md line 68; glossary pause | read in place |
| 10 D24 the one report | DONE | plan-orchestration Reports (lines 346 to 360) and Steps 10; land Steps 11 (lines 119 to 121); glossary position line | read in place |
| 11 D25 a plan's state file | DONE | plan-orchestration line 227; land Steps 10 and Rules (lines 243 and 244); orchestrator-state.md line 3 and the position heading | read in place |
| 12 D26 next-entry mode | DONE | self-rule "Next-entry mode" (lines 52 to 66); glossary next-entry mode | read in place |
| 13 D27 recurring-findings pass and night rule | DONE | plan-orchestration "What it reads" 5, "The recurring-findings pass" (line 269), "The pace when a deadline is set" (line 372); glossary night rule | read in place |
| 14 D28 and the projects form, the invocations | DONE | plan-orchestration description, intro, Quick start, "What it reads" 1, Steps 2; self-rule; ordo-help description, intro, Quick start, "What it reads" 3, Steps 3, the printed sequence (a `/plan-orchestration` line beside the `<entry>` line); README table rows and sequence; gen_figures.py band title and text; plan-loop.svg regenerated; glossary loop | `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (31539 bytes)` and `wrote docs/figures/plan-loop.svg (31979 bytes)`, exit 0; `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/plan-loop.svg` |
| 15 The glossary | DONE | plan-terms.md and the docs/glossary.md block: booking, closing step, configuration block, dispatch block, dispatch entry, handover, in flight, landing, loop, next-entry mode, night rule, pause, position line, resume point, session the, shared path, slug, verification page, verify list, worktree changed; open plan added | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0 |
| 16 Versions | DONE | the twelve SKILL.md files | Verify 7 below |
| 17 False sentences rewritten | DONE | every changed file | the greps of "Hits left" below |

### Verify before you report, outputs as printed

1. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
2. The character-set check (`git ls-files -coz --exclude-standard -- skills docs README.md .agents/plan.yaml | xargs -0 perl -CSD -ne ...` as the brief gives it) printed nothing, exit status 0.
3. `git grep -n workers_at_once -- skills docs README.md .agents/plan.yaml` printed 16 hits, each of which reads the key from `.agents/plan.yaml`: `.agents/plan.yaml:14` is the key's own line; `skills/plan/templates/plan.yaml:21` and `skills/plan/templates/plan.projects.yaml:23` and `:50` are templates of `.agents/plan.yaml`; `docs/glossary.md:55`, `skills/repo-setup/templates/plan-terms.md:50`, `skills/spec/SKILL.md:37`, `:224`, `:225` and `:410`, `skills/plan-orchestration/SKILL.md:290`, `:291` and `:292`, `skills/plan/templates/orchestrator-state.md:33` and `skills/plan/templates/plan.md:25` each say `.agents/plan.yaml`'s `workers_at_once` or `plan.yaml`'s; `skills/ordo-help/SKILL.md:94` says `plan.yaml's workers_at_once`. `skills/plan-orchestration/SKILL.md:292` says a configuration block that holds the line is read as if it were not there.
4. `git grep -n -e 'worktree_root>/<step>' -e '\-b <step>' -- skills docs README.md ':!skills/land/templates/land.sh'` printed nothing (grep exit 1).
5. `python3 docs/figures/gen_figures.py` exit 0, outputs as in item 14 of the table.
6. Description lengths printed: plan-orchestration 1018, spec 1003, land 725, refute 989, plan 477, ordo-help 564, grill 877, roadmap 1022, plan-retro 616, ordo-init 632, repo-setup 783, diagnose 965. None is above 1024.
7. `grep -m1 'version:'` printed: plan-orchestration 5.0.0, spec 5.0.0, land 3.0.0, refute 3.0.1, plan 4.0.0, ordo-help 3.1.0, grill 1.3.1, roadmap 1.3.1, plan-retro 1.2.2, ordo-init 2.0.1, repo-setup 4.0.0, diagnose 2.1.1.
8. `git status --short` lists 22 modified paths: .agents/plan.yaml, README.md, docs/figures/gen_figures.py, docs/figures/plan-loop.svg, docs/glossary.md, skills/diagnose, grill, land, ordo-help, ordo-init, plan-orchestration (SKILL.md and references/self-rule.md), plan-retro, plan (SKILL.md and templates/orchestrator-state.md, plan.md, plan.yaml), refute, repo-setup (SKILL.md and templates/plan-terms.md), roadmap, spec. All are in "Paths this step writes". docs/figures/pipeline.svg was regenerated byte-equal and is not listed.

### Verify 2, the commit sentences of `skills`, read sentence by sentence

Each sentence that makes a commit on main has the form or names the place that states it.

- plan-orchestration: the form is stated once at lines 210 to 212 ("The form of a commit"); the launch commit (lines 78 to 97), the round-sent commit (115), the dictated-text commit (135), the stop commit (401) and the handover commit (222) name "Resuming, and handing the plan over".
- self-rule: lines 31, 43 and 44, 167 name the same section; line 164 names the review's commit message and the commit is the one of line 167.
- spec: the form is stated at Steps 6 (line 201, `git commit -m <message> -- <path> ...`, deleted paths included); lines 230 to 235 (the dispatch-entry commit), 275 and 315 (a stop), 389 (the brief-check report) name Steps 6.
- land: the form is stated at Steps 12 (lines 128 to 139, the amend at 139, the revert in Rules); lines 90 and 219 (the back-out and open-item commits) name Steps 12.
- plan: Steps 6 states the form (lines 167 to 176); Steps 2 closing (lines 114 to 118) names it for the three closing commits.
- diagnose: Steps 20 lines 305 and 306 state `git add -- <path> ...` and `git commit -q -m "<message>" -- <path> ...`; line 318 for the commit outside a plan names the same form.
- grill Steps 10 line 209, roadmap Steps 5 line 95, plan-retro Steps 15 line 66, ordo-init Steps 14 line 133, repo-setup Steps 12 line 120 and sync 9 line 161 each carry the bullet `The commit names the same paths: git commit -m <message> -- <path> ...` or name Steps 12.
- session-retro Steps 11: the commit already names the report's path in the form.
- refute lines 80 and 99 and diagnose lines 70 and 71 make no commit; they name the next resume-point commit of the plan's own, per "Resuming, and handing the plan over".
- The wip commit in the worktree (land Steps 3) is the one exception the brief names.
- ordo-help lines 76 and 89 are descriptions in the printed sequence of what the session does; they state no instruction that makes a commit and are unchanged.
- roadmap line 93 and land line 128 keep the words "explicit path" because Decision 3 of the brief keeps the sentence and adds the form as a bullet under it.

### Hits left by the greps of item 17 (read, each stays true)

- `one plan`: plan-orchestration lines 10, 227, 293 and 348 say "the one plan named", "a commit of one plan rewrites no other plan's state file", "a pair from one plan" and "a position line belongs to one plan"; spec 176 and the glossary shared path say "in one plan or in two"; the glossary position line says "the line of one plan"; docs/roadmap.md line 25 states the gate of this plan; all are true under the new rules.
- `<step>-land`: land lines 215 and 216 say `<slug>-<step>-land`; `<step>-landing.md` (land 120, plan-orchestration 171) is the landing report's file, not a branch.
- `by path` and `explicit path`: the "listed by path" hits (land 40 and 209, spec 62 to 79, plan-orchestration 217) name how the session reports a change; they are not commit forms. The two "explicit path" hits are named above.
- `own records`, `the session wrote`: spec, plan-orchestration, land and diagnose lines say the session's own records of this plan, and the places that name a plan say which plan.
- `describes`: land 244, plan-orchestration 227 and orchestrator-state.md line 3 say a plan's state file describes that plan as of its own last resume point; the other hits (README 142, plan 149, the glossary round entry) are unrelated.
- `pause`, `PAUSED`: every hit is written for the pause of every open plan or of the plans it holds.
- `dispatch block`, `in flight`, `resume point`: every hit in land, refute, diagnose, ordo-help and the templates names the plan's own block or the step of the named plan, which is true for a skill that works on one named plan.
- `-b <step>`: no hit.
- `git grep -n -i -e 'workers_at_once' -e 'one plan' -e 'worktree_root' -e 'resume point' -- docs/dev docs/adr docs/roadmap.md` printed only docs/roadmap.md:25, the gate of this plan, which stays true.

## The terms

Each glossary term the diff adds, changes or uses in a new place, read against its entry, and the entry's "Stated in" checked by `grep -n` of the term in the section it names (docs/glossary.md and skills/repo-setup/templates/plan-terms.md are equal):

- **open plan** (new): used in plan-orchestration (lines 3, 10, 15), self-rule (lines 54, 61, 64), spec (lines 3, 10, 36), ordo-help (lines 3, 10, 15, 37), each read against the entry's definition (a folder under `<ledger_root>/`, outside `<archive_root>/`, whose `plan.md` opens with `# Plan: <entry>`). Stated in: plan-orchestration "What it reads" 1, self-rule "Next-entry mode", spec "What it reads" 3 and ordo-help "What it reads" 3, each found by `grep -n -i 'open plan'`.
- **booking**: the first sense names the verify-list change; `grep -n 'booking' skills/land/SKILL.md` finds Steps 9 (line 42 to 53 region) as the section named.
- **closing step**: `grep -n -i closing skills/plan/SKILL.md` finds Steps 2 (lines 98 to 108).
- **configuration block**: the key list no longer holds `workers_at_once`; `grep -n 'configuration block' skills/plan/SKILL.md` finds Steps 4 (line 156) .
- **dispatch block**, **dispatch entry**: `grep -n 'dispatch block' skills/spec/SKILL.md` finds "What it reads" 3 (lines 36 to 41), Steps 5 (174) and Steps 9 (221); plan-orchestration "What it reads" 3 (line 39) and "Resuming, and handing the plan over" (line 230).
- **handover**: plan-orchestration "Resuming, and handing the plan over" (lines 207 and 222).
- **in flight**: spec "What it reads" 3 (line 37) and plan-orchestration "Two steps in flight" (line 290).
- **landing**: land Steps and Rules (lines 241 to 244).
- **loop**: the first sentence is stated in plan-orchestration's introduction (line 10) and Steps; the second sentence (the loop inside a step) is unchanged and stays as it was. `grep -n -i loop skills/ordo-help/SKILL.md` finds the word only in the description line 3; the section "The sequence, printed verbatim" shows the refutation and repair round without using the word, which was already so before the diff.
- **next-entry mode**: self-rule "Next-entry mode" (lines 52 to 66).
- **night rule**: plan-orchestration "The pace when a deadline is set" (line 372).
- **pause**: plan-orchestration Steps 5 (line 102) and "Stops" (lines 380 and 413).
- **position line**: plan-orchestration "Reports" (lines 348 to 350) and land Steps 11 (lines 119 and 121).
- **resume point**, **session, the**: plan-orchestration "Resuming, and handing the plan over" (lines 207 to 224); spec Steps 1 (line 65).
- **shared path**: spec Steps 5 (line 176) and plan-orchestration "Two steps in flight" (line 300).
- **slug**: plan Steps 1 (line 65) and spec Steps 7 (line 204).
- **verification page**: plan "What it reads" 3 and Steps 4; ordo-init Steps 3; spec Steps 1 (line 95); land "What it reads" 8 (line 43).
- **verify list**: land Steps 2 (line 52) and "The landing script" (line 161); plan Steps 4; spec Steps 1 (line 95) and 4 (line 141); refute Steps 3 (line 65).
- **worktree**: spec Steps 7 (line 204); land "Removing a step's worktree" (line 182).

## The files with line counts

`wc -l` over `git diff --name-only`: .agents/plan.yaml 16, README.md 193, docs/figures/gen_figures.py 753, docs/figures/plan-loop.svg 168, docs/glossary.md 151, skills/diagnose/SKILL.md 413, skills/grill/SKILL.md 398, skills/land/SKILL.md 244, skills/ordo-help/SKILL.md 124, skills/ordo-init/SKILL.md 208, skills/plan-orchestration/SKILL.md 451, skills/plan-orchestration/references/self-rule.md 167, skills/plan-retro/SKILL.md 116, skills/plan/SKILL.md 213, skills/plan/templates/orchestrator-state.md 69, skills/plan/templates/plan.md 43, skills/plan/templates/plan.yaml 30, skills/refute/SKILL.md 203, skills/repo-setup/SKILL.md 245, skills/repo-setup/templates/plan-terms.md 134, skills/roadmap/SKILL.md 217, skills/spec/SKILL.md 431. The diff adds 277 lines and deletes 203. This report file is the 23rd path.

## Judgment calls

- The refusal for an existing worktree path or branch sits in spec Steps 1 (the preflight, which writes nothing), with a new Stops row "A worktree or branch that exists", and not at Steps 7, since Steps 7 runs after the preparation commit and a refusal leaves nothing. The kept worktree of the step's own `landing: backed-out` entry is excepted, since "Steps / A step taken back out of main" removes it.
- The verify-list compare sits in spec Steps 1 after the back-out bullet and before the done criterion, so the rewritten list is one of the session's own records that the preparation commit carries. In land it sits in Steps 2.
- The commit form is stated once per skill: plan-orchestration "Resuming, and handing the plan over", spec Steps 6, land Steps 12, plan Steps 6, diagnose Steps 20, and one bullet under the commit step of grill, roadmap, plan-retro, ordo-init and repo-setup; every other commit sentence names that place.
- The paused plan's position line ends "Next: PAUSED, until <the user> says otherwise.", written the same way in the glossary position line, plan-orchestration "Reports" and the state-file template line 68.
- A new glossary entry, **open plan**, because the texts use the term in four skills.
- Sentence length and list items (Verify 9): the added lines over 420 characters, found by a length scan of the diff, are these and each keeps its form for the reason given. The description lines of plan-orchestration, land, ordo-help (frontmatter is one line of at most 1,024 characters). The dispatch comment of orchestrator-state.md line 33 (a YAML comment is one line, and the content is the list of keys of a dispatch entry). The glossary entries booking, dispatch entry, configuration block, verify list, closing step, resume point, session the and dispatch block (each entry is one line listing every place or part the term covers). The `/spec refuses` line of ordo-help (a line of the printed sequence, one per command, as the page's own rule has it). The "A landing runs the `land` skill's `templates/land.sh`" bullet of orchestrator-state.md (a verbatim command line with its arguments) and the line 3 intro of the same template. The other new bullets state one rule each in one or two sentences; where a bullet had several clauses it was split into sub-bullets.
- `skills/plan/templates/plan.projects.yaml` does not change; no script, test, `land.sh` or `checks.sh` changes.
- This plan's and plan 3's configuration blocks still hold `workers_at_once: 3`; the text reads them as if the line were absent, and the orchestrator removes them later (brief Decision 5).
- `.agents/plan.yaml` is changed at line 14 only (the comment).

## Host- or user-visible changes, before and after

- `/plan-orchestration` with no entry and `continue the plan`: before, they continued the one open plan; now they run every open plan in one session, picking each free slot from the earliest plan in the roadmap's order; `/plan-orchestration <entry>` runs that plan alone; with no open plan they take the next roadmap entry under `self_rule: on` and `next_entry: on` or print that no plan is open and name `/plan <entry>`.
- `/ordo-help` with no entry: before, it printed the sequence and the choices; now it also prints each open plan's position line and open items in roadmap order, or a line saying no plan is open.
- The limit on steps in flight: before, the configuration block's `workers_at_once` counted the steps of one plan; now `.agents/plan.yaml`'s `workers_at_once` counts the steps in flight of every open plan, and the projects form uses the smallest value among the projects with an open plan.
- Worktree and branch names: before, `<worktree_root>/<step>` and `<step>`; now `<worktree_root>/<slug>-<step>` and `<slug>-<step>`, and `land.sh` is called with `<slug>-<step>`; `/spec` refuses when that worktree or branch exists.
- Commits: before, skills staged and committed without naming paths; now every commit on main names its paths with `git commit -m <message> -- <path> ...`, a landing names a rename's old path too, and a landing runs from its cherry-pick to its commit before any other commit or skill.
- The orchestrator's report: before, one position line; now one position line per open plan, the open items after each, the landed steps grouped by plan, then the choices.
- A pause holds every open plan unless the user names the plans it holds, and is written in each held plan's position line.
- `/spec` and `/land` compare the plan's verify list with the verification page and rewrite it in the state file when they differ.
- `docs/figures/plan-loop.svg`: the band title reads `/plan-orchestration [<entry>]` and the text names every open plan with no entry.

## Anything in the brief that was wrong or impossible

- ADR 0012's Decision text says the landing commit takes its paths from `git diff --cached --name-only`; the skills now use `--name-only --no-renames` (brief item 5 and Decision 3), because without it a rename's old path is left out of the commit command, as the scratch-repository run showed. The ADR is outside this step's paths, so the orchestrator decides whether the ADR text changes.
- `docs/figures/pipeline.svg` is in the brief's paths; the script regenerated it byte-equal, so it is not changed.
- Nothing else in the brief was impossible.
