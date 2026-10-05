# Step 3 brief check (on main at c76d377)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

Main's head: `git log -1` printed `c76d377ea646ae5b0bf6588e8805f4bf1fb3f34e Land step 2 of plan 2.1, the gate clauses of entries 3, 4, 7, 8 and 16`. `git status --short` printed only `?? .scratch/2-1-scripts-cut-to-their-jobs/agents/briefs/3.md`.

## 1. Names

The brief's 35 paths were extracted from "Paths this step writes" into a scratch file. Each name below was grepped with `git grep -n -i -e '<name>' -- . ':!.scratch'`, and the hits inside those paths were filtered out.

- The ten deleted files (`person-driven`, `git_guard`, `checks\.test`, `plan_cost\.test`, `transcript_window\.test`, `check_coverage\.test`). Hits outside the paths:
  - `docs/roadmap.md:24`, `:25`: the goal and gate of entry 2.1. They name the deletion, so they stay true.
  - `docs/roadmap.md:232`, `:238`: done records (history). They stay true.
  - `docs/adr/0010-...md:7`: the Context, "A test the page gained ..., `plan_cost.test.sh`, was missing from all three plans' lists". This is history and stays true.
- The glossary terms **actions file** and **observations file**, which item 4 removes. Hits outside the paths:
  - `skills/diagnose/templates/diagnosis.md:38: <for a red command a person drives: each run's observations file quoted whole, which observation is the red>`
  - `skills/diagnose/templates/diagnosis.md:41: <the observations file of each run, quoted whole>`
  - The change makes both lines false. Once the term and the script are gone, the record template's placeholders ask for a file that nothing writes, under a term that is no longer defined.
- "git guard", "guard hook" and "question 10". Hits outside the paths:
  - `docs/roadmap.md:24` (the goal of 2.1) stays true.
  - `docs/roadmap.md:35` `## 2.G git guard` is the open entry that step 4 drops, so it is out of this step's scope.
- `docs/dev/scripts.md`. Hits outside the paths are `docs/roadmap.md:24`, `:25` and `:158` (entry 16's gate: "`utils/check_coverage.py` and its mention in `docs/dev/scripts.md` are deleted"). All three agree with decision 2 of the brief.
- The sentence that every script has a test (`test beside`, `adds its test`). There is no hit outside the paths. Inside them, `docs/dev/building.md:35` reads "a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block". Item 7 asks only that this sentence point at `docs/dev/scripts.md` "too". Kept as written, it still says every new script has a test, which contradicts the rewrite that item 2 dictates (rules file, rule 19).
- `land.sh`'s command form and exit statuses, which item 5 may cut. The command was `git grep -n -F land.sh -- . ':!.scratch'`. Its hit outside the paths is `skills/plan/templates/orchestrator-state.md:54`: "It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it." A cut that removes any of these exits or refusals makes this line false. The line also has copies in the six open state files (`grep -ln "64 on a refusal" .scratch/*/orchestrator-state.md` lists 2-1, 2-f, 2-g, 2-h, 2-i and 3).
- `agent-roles` (an input of `plan_cost.py`). There is no hit outside the paths. `skills/plan/SKILL.md:107` names it, and that file is in the paths.

Findings:
- `skills/diagnose/templates/diagnosis.md:38` and `:41` are made false by the removal of the **observations file**, and the file is not in "Paths this step writes".
- `skills/plan/templates/orchestrator-state.md:54` states `land.sh`'s exits and test. It is not in the paths and not among the callers under "What is on the tree", so a cut of `land.sh` that removes an exit leaves it false.
- `docs/dev/building.md:35` (in the paths): item 7's wording keeps "adds its test here", which contradicts the rewritten sentence of item 2.

## 2. The step line

Each part of `plan.md` Steps 3, and the requirement that serves it:

- `docs/dev/scripts.md` listing each script as a development, user or test script with its job: item 1.
- The case rule added to the shared-rules template's bullet "Scripts compute facts; judgment is read": item 3.
- The line in `docs/dev/change-standard.md` that a change adding, removing or renaming a script updates `docs/dev/scripts.md`: item 2, first bullet.
- `person-driven.sh`, its test and `references/person-driven.md` deleted, with every text that names them: item 4, first bullet, and item 9.
- The git guard (`git_guard.py`, its test, `git_guard.settings.json`) deleted, with `repo-setup`'s offer: item 4, second bullet. The bullet lists question 10, the copy, Steps 11 and the tree listing. It does not list the other places the offer stands, which only item 9's general clause reaches:
  - the description (`skills/repo-setup/SKILL.md:3`), "What it reads" 1 (`:29`), Steps 3 (`:63`) and Steps 10's fifth check (`:116`, `:117`);
  - the Rules (`:250`, `:253`);
  - `README.md:13`, `:66` and `:115`.
- Every `.py` and `.sh` file under `.scratch/` deleted: no requirement of "What to build". "What is on the tree" assigns it to the orchestrator at landing.
- The tests of `checks.sh`, `plan_cost.py`, `transcript_window.py` and `check_coverage.py` deleted: item 4, third bullet.
- `land.sh`, `pin.sh`, `check_config.py`, `plan_cost.py` and `transcript_window.py` cut back to their jobs: item 5.
- The tests of `land.sh`, `pin.sh`, `check_config.py` and "`sync_rules.py --write`" cut to the cases whose failure costs something: item 6. Item 6 reads "`sync_rules.test.sh` keeps the `--write` cases among them", which also lets cases outside `--write` stay. The step line and the plan's Goal ("tests are kept only for ... `sync_rules.py --write`") name only the `--write` behaviour.
- The verify list of `docs/dev/building.md` kept equal: item 7. The verify list of each open plan's state file kept equal: no requirement of "What to build". It is assigned to the orchestrator at landing, as ADR 0010 has `/land` do it.
- The check, in three parts:
  - the page compared with `git ls-files`: C1;
  - the deleted files absent: C2;
  - each kept script and test read by the user with its line counts: the "Report" part on cut scripts and kept tests.

Findings:
- The deletion of the eight `.scratch/` scripts and the equalising of the open plans' verify lists have no requirement in "What to build". The brief hands both to the orchestrator at landing. `grep -n -i "\.py\|\.sh\|landing" .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md` shows neither task booked in the state file, so nothing that `/land` reads carries them.
- Item 6 is wider than the step line for `sync_rules.test.sh`: "the `--write` cases among them" against "`sync_rules.py --write`".

## 3. Premises

- The step line is tagged `(approved) (ruling A) (ruling B)`, and rulings A2 and B are as stated. `cat -n plan.md` shows line 22 with those tags, and the Rulings bullets on Open items A and B match. Matches.
- The scripts and their line counts. `git ls-files '*.py' '*.sh' | grep -v '^.scratch/' | xargs wc -l` printed 752 for `gen_figures.py`, 76 and 393 for `person-driven`, 134 and 118 for `checks`, 469 and 156 for `land`, 240 and 570 for `check_config`, 672 and 1079 for `plan_cost`, 1230 and 507 for `git_guard`, 172 and 422 for `sync_rules`, 480 and 618 for `transcript_window`, 302 and 190 for `check_coverage`, and 524 and 876 for `pin`, 9980 in total. Matches. `ls skills/repo-setup/templates/hooks/ skills/diagnose/references/` shows `git_guard.settings.json` and `person-driven.md`. Matches.
- The callers. `git grep -n -F <name> -- 'skills/*/SKILL.md' README.md`:
  - `land.sh`: `skills/land/SKILL.md` (Steps 4 to 6, "The landing script", Stops) and `README.md:163` to `:167`. Matches.
  - `pin.sh`: `README.md:176` to `:186`. Matches.
  - `check_config.py`: `skills/ordo-init/SKILL.md:128`, `:142`, `skills/repo-setup/SKILL.md:34`, `:111`, and also `README.md:131`. The brief omits the README.
  - `plan_cost.py`: `skills/plan-orchestration/SKILL.md:344`, `skills/plan/SKILL.md:109`, and also `README.md:158`. The brief omits the README.
  - `transcript_window.py`: `skills/session-retro/SKILL.md:35`, `:147` to `:151`. Matches.
  - Outside the grep's scope, `skills/plan/templates/orchestrator-state.md:54` is caller text of `land.sh` (section 1).
- The texts that name a deleted file. `git grep -l -e person-driven -e git_guard -e 'checks\.test' -e 'plan_cost\.test' -e 'transcript_window\.test' -e 'check_coverage\.test' -- . ':!.scratch'` printed the brief's list plus `docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md` and `docs/roadmap.md`. The brief omits these two. Both hold history or this entry's own goal, which stays true. Two other parts of the premise differ:
  - Its `repo-setup` sub-list omits "What it reads" 1 (`skills/repo-setup/SKILL.md:29`, a `git_guard` hit).
  - It says "the questions after it are renumbered". `sed -n 165,196p skills/repo-setup/SKILL.md` shows question 10 is the last of "The questions", so there is nothing to renumber.
- The change standard holds the case rule, lists every test and has the "test beside it" sentence. `grep -n` shows `docs/dev/change-standard.md:21` holding the case rule, the command block at lines 68 to 78 listing all ten tests, and `:89` holding the "test beside it" sentence. `docs/dev/building.md` lines 6 to 16 hold the same tests, and `:35` holds the new-script sentence. A diff of the test names in the two blocks printed `same tests, same order`. Matches.
- The shared-rules template has no case rule, and Ordo has no `CLAUDE.md`. `grep -n "handles a case" skills/repo-setup/templates/shared-rules.md` exited 1, and `ls CLAUDE.md` printed `No such file or directory`. Matches.
- `docs/dev/scripts.md` is absent. `ls docs/dev` printed `blind-comparison.md building.md change-standard.md skill-layout.md`. Matches.
- The versions:
  - `grep -n version skills/{land,diagnose,repo-setup,plan-orchestration,plan,session-retro,ordo-init}/SKILL.md` printed land 2.0.0, diagnose 2.0.0, repo-setup 3.0.0, plan-orchestration 4.0.0, plan 3.0.0, session-retro 1.0.0 and ordo-init 1.2.0.
  - `git show 02177bb` lists among step 1's raises "spec 4.0.0, refute 3.0.0, plan-orchestration 4.0.0, land 2.0.0, diagnose 2.0.0, repo-setup 3.0.0, ordo-help 3.0.0, plan 3.0.0".
  - `git log` of session-retro's and ordo-init's `SKILL.md` shows their last commits (9699d1a and b1af081) before the plan's opening commit 925e066.
  - The brief names four skills that step 1 raised. Step 1 raised eight, and `plan` (3.0.0), whose `SKILL.md` is in this step's paths, is not named. Item 8 repeats "The four skills step 1 raised".
- The ADRs. The brief says "No other ADR touches the step". This is false; see section 7 (0006 and 0007).
- The eight `.scratch/` scripts. `git ls-files '.scratch/*.py' '.scratch/*.sh'` printed eight. Matches.

Findings:
- Callers: the brief omits `README.md:131` for `check_config.py`, `README.md:158` for `plan_cost.py`, and `skills/plan/templates/orchestrator-state.md:54` for `land.sh`. This matters because item 5 defines each script's job by "its callers' text (under 'What is on the tree')".
- Deleted-file texts: the grep also prints `docs/adr/0010-...md` and `docs/roadmap.md`, and the `repo-setup` sub-list omits "What it reads" 1.
- "the questions after it are renumbered": question 10 is the last question.
- Versions: step 1 raised eight skills, not four, and `plan` 3.0.0 (in the paths) is not named.
- ADRs: 0006 and 0007 touch the step (section 7).

## 4. Cases and checks

- C1 is consistent with "Scripts compute facts; judgment is read" (a list comparison). It reads `git ls-files`, which lists the index, and "Where the work happens" bars the builder from any git command that changes state.
  - In a scratch repository, after `rm a.sh` with no `git rm`, `git ls-files '*.py' '*.sh'` printed `a.sh` and `b.py`.
  - So in the builder's worktree C1 prints every deleted script until `land.sh`'s commit, whatever the work. "Verify before you report" 1 cannot hold there.
  - The pattern itself works on this machine's BSD grep: on a sample page it printed `docs/figures/gen_figures.py` and `utils/pin.sh`, with and without the backslash escapes.
- C2 reads the index in the same way, so it prints the ten deleted files in the worktree before landing.
- C3 is consistent with the rules. `git grep` skips a tracked file removed from disk: in the scratch repository it exited 1 with no output after `rm`.
- C4 is consistent with the rules.
- C5 is consistent with the rules. It printed `ok: the plan-terms block equals the template` on main now.
- C6 is consistent: it is a judgment, read, as "Scripts compute facts; judgment is read" says.
- C7 is consistent with the rules.
- No case asks the builder to check, quote or explain a place the step does not change.
- One requirement that is not a case conflicts with a standard: "What to build" item 8, "otherwise their minor part". `docs/dev/skill-layout.md` "Frontmatter" says:
  - the minor part is raised only when the skill does something it did not do or accepts a new input;
  - the patch part when only the wording changes;
  - the major part also when "a run that worked before is refused", which removing an option or mode does.

  A cut adds nothing, so "minor" is never the right part. Item 8's major condition also omits the refusal clause.

Findings:
- C1 and C2 cannot pass in the worktree before landing, because they read an index the builder may not change. They need to run on what is on disk, for example with the entries of `git ls-files --deleted` removed from the list, and again on main at landing.
- Item 8 conflicts with `docs/dev/skill-layout.md` "Frontmatter": it should be major when a run that worked before is refused or its output is changed or removed, and otherwise patch.

## 5. The question

"The goal" here is the part of the plan's Goal that step 3 delivers: the scripts page, the deletions, the five scripts cut to their jobs, the four kept tests cut, the page rule in the change standard, and the case rule in the shared-rules template.

- **C1**: no for the listing, since it is an exact comparison. The headings and jobs are not compared, but the user reads them at the gate.
- **C2**: no for the deleted test and hook files it names. The `.scratch/` deletions lie outside it, which section 2 covers.
- **C3**: yes. It greps only `person-driven`, `git_guard` and the four test names, so it prints nothing while these remain:
  - "git guard" in `repo-setup`'s description, Steps 3, Steps 10's fifth check ("When the answer to question 10 is yes") and Rules;
  - "git guard" in `README.md:13`, `:66` and `:115`;
  - **actions file** and **observations file** in `skills/diagnose/templates/diagnosis.md`.
- **C4**: yes. The four tests pass on the unchanged tree today, so C4 passes with no case cut at all. No case reads item 6's cut.
- **C5**: no. It is a fact of the two blocks.
- **C6**: no, as long as it is read against the callers.
- **C7**: no when taken with C3, which finds a deleted test still named in `docs/dev`.
- **The step line's check** ("the page compared ..., the deleted files absent ..., each kept script and test read by the user"): no.
- **Item 1**: no (C1 plus reading).
- **Item 2**: yes. Neither the dictated bullet nor the rewritten "test beside it" sentence is checked by any case. A `grep -nF` of the bullet in `docs/dev/change-standard.md` would check the first.
- **Item 3**: yes. No case checks the sentence in `skills/repo-setup/templates/shared-rules.md`.
- **Item 4**: partly yes, through C3's gaps above.
- **Item 5**: no (C6, read).
- **Item 6**: yes (only C4).
- **Item 7**: no for the list (C7, C3). Yes for the sentence that points at `docs/dev/scripts.md`, which no case reads.
- **Item 8**: yes. No case reads the two version lines.
- **Item 9**: no. The report quotes rule 14's grep, which the reviewer reads.

Findings:
- C3 could pass with "git guard" text and the two glossary terms still standing. Adding `-i -e 'git guard' -e 'actions file' -e 'observations file'` would close the gap.
- C4 could pass with no test cut. A case reading each kept test's cases against the cost test, with the `sync_rules.test.sh` scope settled (section 2), would close the gap.
- Items 2, 3, 7 (its sentence) and 8 have no case. Each has a fact a grep shows: the dictated bullet, the dictated sentence and the two `version:` lines.

## 6. Implied inputs

This is a code step: five scripts are cut and four tests are cut. "Cases" lists no input. These inputs have happened, or a wrong answer on them would cost something. Each one's expected result is that the cut keeps its handling.

- **The `projects:` form of `.agents/plan.yaml`.** `grep -n "^projects:" /Users/axelfaes/workspace/*/.agents/plan.yaml` printed `/Users/axelfaes/workspace/research-hub/.agents/plan.yaml:3:projects:`. `land.sh` (`README.md:165`) and `check_config.py` (`check_config.py:223` to `:225`) keep it. Missing from "Cases".
- **More than one skills folder, and `CLAUDE_CONFIG_DIR` set, for `pin.sh`.** `echo` printed `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work`. `ls -d` showed `~/.claude/skills` and `~/.claude-work/skills`, a `~/.claude-science` with no `skills` folder, and `~/.agents/skills` present. `pin.sh` keeps linking into each folder once, skipping a config folder with no skills folder, and removing Ordo links from `~/.agents/skills`. Missing. `ORDO_SKILL_DIRS` is unset on this machine; whether it is used anywhere else is not verified.
- **A range with no commit for `land.sh`.** `grep -rln "nothing to copy" .scratch` lists `.scratch/archive/2-e-a-self-rule/plan.md` and its step 5 landing. `land.sh` keeps printing "nothing to copy" and running the verify list. Missing.
- **`agents/agent-roles.md` for `plan_cost.py`.** `find .scratch -name agent-roles.md` printed `.scratch/archive/2-e-grill/agents/agent-roles.md`. `plan_cost.py` keeps reading it (and ADR 0006 records it). Missing.
- **A response with no response body for `plan_cost.py`.** ADR 0009's Context records plan 2.E priced from transcripts. `plan_cost.py` keeps the transcript count, marked as a lower bound. Missing as a case, though ADR 0009 is named under "What is on the tree".
- **A `land.sh` rerun after a stop, on `<step>-land`.** `skills/land/SKILL.md:209` and `:210` describe it. Whether it has happened is not verified. A wrong answer would land a range twice on main. Missing.

Findings: the inputs above are missing from "Cases": the `projects:` form (research-hub), `pin.sh`'s several skills folders with `CLAUDE_CONFIG_DIR` set, the empty range, `agent-roles.md`, the transcript-only response, and the rerun on `<step>-land`.

## 7. ADRs

Each record was read with `cat docs/adr/00*.md`, and the scripts were grepped for the keys and behaviour each record decides.

- 0001, 0002 and 0003 (the writing base, the prose standard, the draft reviewer): they do not touch the step.
- 0004 and 0005 (self-rule endings, the choices file): they do not touch the step. `check_config.py` checks the `self_rule` key, but these records decide the bullet endings and the file, not the key.
- 0006: it touches the step. Its decision says "The cost script takes the ids and roles from the plan's ledger only", and its Consequences say "A plan run before this change gets its id and role list once, read from its agents' `meta.json` and written into its ledger". The latter is `agents/agent-roles.md`, which `plan_cost.py:11` and `:261` read. The brief does not name it.
- 0007: it touches the step through `check_config.py`. Its decision says the run over a repair round "runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value". `check_config.py:6`, `:18` and `:129` to `:136` check the key and note that default. The brief does not name it.
- 0008: it touches the step through `plan_cost.py`. Its decision says "The script reads a price table kept beside it ... A model the table lacks is an error that names the model". The brief names it.
- 0009: it touches the step through `plan_cost.py`. Its decision says "The script takes a response's counts from its response body when the body's file exists ... and from the last entry of its transcript otherwise". The brief names it.
- 0010: it touches the step through the verification page and the state files. Its decision says "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands". The brief names it, and its assignment of the state files to the landing agrees with the record.
- 0011: it does not touch the step. A grep of `land.sh` for `dispatch` printed nothing.
- 0012: it does not touch the step. Its decision concerns the commit on main, which `land.sh` does not make. `land.sh:457` only prints `git diff --cached --name-only` as booking data.

No part of the brief contradicts an ADR. Item 5's "every branch ... that no caller uses ... is removed" could remove the `agent-roles.md` input against 0006 unless the brief names that record.

Findings: ADR 0006 and ADR 0007 touch the step and are not named under "What is on the tree", which instead says "No other ADR touches the step".

## 8. Dictated text

- Item 2's bullet, found with `grep -n 'Every script is listed on' .scratch/2-1-scripts-cut-to-their-jobs/agents/briefs/3.md` (line 44). The brief gives it as `- Every script is listed on \`docs/dev/scripts.md\` as a development, user or test script, with its job. A change that adds, removes or renames a script updates the page in the same change.`
  - Its words hold against the prose standard (sections 0, A to F) and the rules file.
  - The brief writes it inside a one-backtick code span with `\`` escapes, and markdown does not process backslash escapes inside a code span. A builder copying it "word for word" from the raw text would write `\`docs/dev/scripts.md\``, which renders as literal backticks around backslashes instead of inline code (prose standard, F, "Inline code for paths").
- Item 3's sentence, found with `grep -n 'Code handles a case only when' ...3.md` (line 47): `Code handles a case only when that case has happened or when a wrong answer on it costs something.` It holds:
  - it equals the first sentence of `skills/repo-setup/templates/docs/dev/change-standard.md:21`, which is step 1's case rule as landed, which ruling B names;
  - it uses "code" as the shared-rules bullet does ("A test exists only for code").
- Item 1's heading labels "development scripts", "user scripts" and "test scripts", found with `grep -n 'development scripts (used when' ...3.md` (line 42). They hold: they are labels (prose standard, 0, "Headings are labels").
- The brief itself: `LC_ALL=C grep -n '[^ -~]'` over it printed nothing (exit 1), and `grep -c $'\t'` printed 0.

Findings: item 2's bullet is dictated with backslash-escaped backticks inside a one-backtick code span. It should be given in a fenced block, or in a double-backtick span, so that the words the builder copies are the words wanted. No ruling of the user fixes those characters, so the brief can close this.

## Declined to judge

- Where `diagnose` keeps the person-driven red command once `references/person-driven.md` is deleted. `docs/dev/skill-layout.md` "Writing for an agent" sends material only some runs need to `references/`, and the approved step line deletes that file. A few sentences in Steps 11 and the Stops row would not be such material, but a whole protocol would be. This depends on the text the builder writes, so it is for the reviewer to read.
- Whether each cut script's kept parts are its job (C6). That is a judgment for the reviewer and the user, and not checkable before the build.
- Whether `ORDO_SKILL_DIRS`, `transcript_window.py --session` or `land.sh`'s rerun on `<step>-land` have been used. No record in this tree settles it. A search of the transcripts, or the user's word, would.

Agent usage: a7ff33a2ab947b3a1, claude-opus-5-5, 182025 tokens, 47 tool uses, 8.8 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, `diagnosis.md`: added to the paths; item 4 says it no longer asks for an observations file.
- 1. Names, the state template's `land.sh` exits: `skills/plan/templates/orchestrator-state.md` added to the paths and to `land.sh`'s callers; item 5 keeps it, and every open plan's state file, stating the exits as they stand after the cut.
- 1. Names, `building.md`'s new-script sentence: item 7 now says a new script adds its test only when it has one.
- 2. The step line, the `.scratch/` scripts and the open plans' verify lists: booked under the state file's position as the landing's work; the brief says so.
- 2. The step line, `sync_rules.test.sh`: item 6 keeps only the `--write` cases.
- 3. Premises, callers: `README.md` added for `check_config.py`, `plan_cost.py` and `land.sh`, and the state template for `land.sh`.
- 3. Premises, deleted-file texts: `repo-setup`'s description, "What it reads" 1, Steps 3, Steps 10 and Rules, `README.md` and `diagnosis.md` named; `docs/roadmap.md` and ADR 0010 named as staying.
- 3. Premises, renumbering: item 4 says question 10 is the last, none renumbered.
- 3. Premises, versions: the eight skills step 1 raised named.
- 3. Premises and 7. ADRs, 0006 and 0007: named under "What is on the tree" with their sentences; item 5 keeps `agent-roles.md` and `repair_reviewer`.
- 4. Cases, C1 and C2 read the index: C1 now lists the files on disk less `git ls-files --deleted`, C2 lists the deleted paths with `ls`; both run again on main at landing.
- 4. Cases, item 8's minor raise: item 8 now gives major when a run is refused or its output changed or removed, patch otherwise.
- 5. The question, C3: it now also greps `git guard`, `actions file` and `observations file`.
- 5. The question, C4: it now reads each case left against the cost test.
- 5. The question, items 2, 3, 7 and 8: C8 and C9 added.
- 6. Implied inputs: item 5 names each input that has happened (the `projects:` form, `pin.sh`'s several skills folders with `CLAUDE_CONFIG_DIR` set, the empty range, the rerun on `<step>-land`, `agent-roles.md`, a transcript-only response) as a case the cut keeps.
- 8. Dictated text, item 2's bullet: given in a fenced block, its backticks as written; held: the words of step 1's brief item 3 and ruling A2, two sentences of 16 words each.
