# Step 5 brief check (on main at cfb53f6)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `.scratch/19-codebase-design/agents/briefs/5.md`. Nothing was changed in the repository. One scratch copy of `docs/figures` was made under the session scratchpad to run the figure script without writing in the tree. All commands were run from `/Users/axelfaes/workspace/ordo`.

The brief can be dispatched after seven additions. The largest: it does not say what the pipeline figure draws once two lanes become one skill, it leaves the section citations of `ordo-init` in the glossary to go stale, it does not say whether the `<path>` and `<folder>` arguments survive, and the state file's verify list still holds the two old `sync_rules` paths.

## 1. Names

- `repo-setup`, `/repo-setup`, `/repo-setup sync`, `skills/ordo/repo-setup/`: `grep -rn 'repo-setup' --exclude-dir=.git --exclude-dir=.scratch --exclude-dir=node_modules .`
  - Every hit is in a file under "Paths this step writes", or in `skills/code/codebase-design/SKILL.md` (9 lines, step 4's).
  - Per-file counts are under check 3. There is no `.github` folder (`ls: .github: No such file or directory`).
  - `grep -rln 'repo-setup' agents utils .claude .agents .oculus CLAUDE.md .gitignore` printed nothing, so the root `CLAUDE.md` does not name the skill and item 5 changes nothing.
  - `docs/roadmap.md` hits: lines 26 (entry 19, goal), 41 and 42 (entry 25, goal and gate) are open entries; lines 77, 79, 81, 85, 86, 106 and 109 are done or dropped entries, which the brief keeps as records.
- Other spellings: `grep -rniE 'repo[ _]setup|reposetup|RepoSetup' --exclude-dir=.git --exclude-dir=.scratch .` printed nothing.
- `sync_rules`, `plan-terms.md`, `shared-rules.md` on lines that do not hold `repo-setup`: `grep -rn 'sync_rules\|plan-terms\.md\|shared-rules\.md' --exclude-dir=.git --exclude-dir=.scratch . | grep -v 'repo-setup'`
  - It printed `README.md:127` and `docs/roadmap.md` lines 73, 76, 82, 83, 84. README 127 names the test by file name only and stays true; the roadmap lines are done entries.
- Section and stop names of `repo-setup` cited elsewhere: `grep -rnE '"The tree"|"The questions"|Steps / sync|question [0-9]' --exclude-dir=.git --exclude-dir=.scratch skills docs README.md utils agents`, without the two skills' own files.
  - `skills/code/codebase-design/SKILL.md:42` (step 4's; brief 4 case 12 has it cite no section of `ordo-init`).
  - `skills/ordo/repo-setup/templates/plan-terms.md` lines 24, 77, 86, 113, 117, 122 and `docs/glossary.md` lines 29, 82, 91, 118, 122, 127.
  - `skills/orchestration/grill/SKILL.md:302` and `docs/figures/gen_figures.py:2201`.
  - All are inside the paths. Each becomes false unless the merged skill keeps that heading and number, or the citation is re-pointed.
- Section citations of `ordo-init` on lines that do not name `repo-setup`: `grep -rnoE '`ordo-init`(,| skill.s) [^.;]{0,60}' --exclude-dir=.git --exclude-dir=.scratch skills docs README.md`
  - `docs/glossary.md:29` ("What it reads" 3), `:80` (Steps), `:81` (the introduction), `:89` (Steps 1), `:92` ("What it reads" 5), `:133` (Steps 3).
  - `skills/ordo/repo-setup/templates/plan-terms.md` lines 24, 75, 76, 84, 87, 128, the same entries.
  - The files are inside the paths. The merge renumbers `ordo-init`'s "What it reads" and "Steps", so these citations become false, and neither item 3 nor case 9 reaches lines 80, 89 and 133 (75, 84, 128 in the template), which do not hold the old name.
- The ledger: `grep -rn 'repo-setup/templates/sync_rules' .scratch --exclude-dir=archive`
  - `.scratch/19-codebase-design/orchestrator-state.md:17:- sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`
  - `.scratch/19-codebase-design/orchestrator-state.md:18:- python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`
  - The `standards:` line of the same block also names `skills/ordo/repo-setup/templates/docs/dev/prose-standard.md`.
  - The move makes all three false. The builder may not edit the state file, and the brief does not say the orchestrator rewrites them at landing.
- Installed-skill lists: `README.md:162` (the install loop, `ordo/repo-setup ordo/ordo-init`), `README.md:36` (the group list and "twenty-two"), `README.md:173` ("twenty-two"), `skills/ordo/ordo-help/SKILL.md:99` (the sequence "printed verbatim"), `README.md:41`. All are inside the paths.
  - `utils/pin.sh` reads the skills from the tag and names none (`grep -rln 'repo-setup' utils` printed nothing). Its head comment says it "removes a link into the pinned worktree whose skill the tag lacks", so the rename needs no change there.
- `skills/orchestration/grill/references/decision-form.md` is in the paths, but `grep -n 'repo-setup\|sync\|ordo-init' skills/orchestration/grill/references/decision-form.md` printed nothing, and no item of "What to build" names the file.

Findings:

1. The glossary and `plan-terms.md` entries that cite `ordo-init` by section number go stale with the renumbering, and three of them per file do not hold the old name. The brief should say that every "Stated in: `ordo-init`, ..." citation in both files is re-pointed to the merged skill's sections.
2. The state file's verify list (lines 17 and 18) and its `standards:` line hold the old paths. The brief should say under "What is on the tree" that the orchestrator rewrites them at landing, as ADR 0010 decides.
3. `skills/orchestration/grill/references/decision-form.md` is listed under "Paths this step writes" with no hit and no requirement. Remove it or state what changes in it.

## 2. The step line

- "`ordo-init` covers the three cases of the ruling": item 2, its three case bullets.
- "`skills/ordo/repo-setup/` is removed with its `templates/` folder moved to `skills/ordo/ordo-init/templates/`": item 1.
- "every skill outside `skills/code/codebase-design/`": item 3, first bullet, and item 4.
- "every page under `docs/`": item 3, the bullets for the glossary, `docs/dev/`, `docs/plan.yaml`, the ADRs and the roadmap. The brief narrows it: the lines of done and dropped roadmap entries keep the old name, recorded under "Decisions taken in this brief".
- "the README": item 3, the README bullet.
- "the figures": item 3, the figures bullet.
- check, the grep: case 9, which covers more paths than the step line's grep (`docs/plan.yaml`, `docs/figures`, `docs/adr`, `CLAUDE.md`).
- check, "the skill's text read against the skill layout": item 2's layout bullet and verify 7.
- check, "the verify list passes on main": verify 1's sub-bullet and verify 6; run at landing.

Findings: none.

## 3. Premises

- `ls skills/ordo/repo-setup skills/ordo/repo-setup/templates`: `SKILL.md templates`, and `CLAUDE.md docs gitignore LICENSE-MIT plan-terms.md shared-rules.md sync_rules.py sync_rules.test.sh`. Matches.
- `grep -n '^## \|^### \|version' skills/ordo/repo-setup/SKILL.md skills/ordo/ordo-init/SKILL.md`: `repo-setup` 6.0.1 with Quick start, Use instead, What it reads, Steps, `### sync`, The questions, The tree, Stops, Anti-patterns, Rules; `ordo-init` 3.0.0 with Quick start, Use instead, What it reads, Steps, `### Checking an existing file`, Stops, Anti-patterns, Rules. Matches.
- `ls skills/ordo/ordo-init/templates`: `check_config.py check_config.test.sh`. Matches.
- `grep -n 'CLAUDE.md' skills/ordo/ordo-init/SKILL.md`: two lines, 35 ("What it reads" 4, the repository's files it reads) and 81 (Steps 4, drafting `rules`). The brief says one line. The conclusion that `ordo-init` never writes `CLAUDE.md` holds on both lines.
- `grep -rc 'repo-setup' skills README.md docs utils CLAUDE.md | grep -v ':0$'`: every count equals the brief's.
  - `docs/glossary.md` 15, `templates/plan-terms.md` 14, `README.md` 14, `docs/roadmap.md` 10, `codebase-design/SKILL.md` 9, `repo-setup/SKILL.md` 8, `ordo-init/SKILL.md` 7, `grill/SKILL.md` 6, `pipeline.svg` 4, ADR 0047 4, ADR 0001 4, `change-standard.md` 3.
  - 2 each: `plan-orchestration/SKILL.md`, `grant/SKILL.md`, `gen_figures.py`, `skill-layout.md`, `scripts.md`, `building.md`.
  - 1 each: `shared-rules.md`, `templates/docs/glossary.md`, `check_config.py`, `ordo-help`, `spec`, `self-rule.md`, `wizard`, `code-comments`, `writing`, `paper`, `docs/plan.yaml`, ADRs 0030, 0026, 0014, 0002.
- `grep -n 'repo-setup' docs/plan.yaml docs/dev/building.md docs/dev/change-standard.md`: `plan.yaml:15`, `building.md:16` and `:17`, `change-standard.md:80`, `:81` and `:96`. Matches; line 96 is inside the count of 3.
- `grep -c 'twenty-two' README.md`: `2` (lines 36 and 173). Rows: `repo-setup` line 13, `ordo-init` line 14, `codebase-design` line 30. Matches.
- `grep -n 'refinement' docs/adr/README.md`: line 5 holds "A refinement that keeps the decision edits the ADR to its current state with no dated note." Matches.
- `grep -il 'repo-setup' docs/adr/*.md`: 0001, 0002, 0014, 0026, 0030, 0047. Matches.
- `sed -n 60,63p` and `138,174p` of `skills/ordo/repo-setup/SKILL.md`: Steps 1 refuses a folder with tracked files, and "Steps / sync" has items 1 to 9. Matches.

Findings:

4. `grep -n 'CLAUDE.md' skills/ordo/ordo-init/SKILL.md` prints two lines (35 and 81); the brief says one.

## 4. Cases and checks

Runs at the current paths:

- Case 6, old path: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.
- Case 7, old path: `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
- Case 8: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
- Case 9 on the unchanged tree: the grep piped through `grep -vc '^skills/code/codebase-design/'` printed `106`; the step line's narrower grep printed `87`.
- Verify 1 as written: no line, then `exit status 0` (no changed file outside `.scratch/`).
- Verify 3 on the current file: `ordo-init 678 3.0.0`; the same command on `repo-setup` printed `repo-setup 780 6.0.1`.
- Verify 4: `ls skills/ordo` printed `ordo-help ordo-init repo-setup session-retro wait-what`; `twenty-one` 0, `twenty-two` 2.
- Verify 5: `python3 <scratch copy>/figures/gen_figures.py` exited 0, and `diff -rq docs/figures <scratch copy>/figures -x __pycache__` printed nothing, so the script reproduces the committed figures.

Reading:

- Cases 1 to 5: consistent with `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read" (text judged by reading) and with `docs/dev/skill-layout.md`, "A rewrite of a skill".
- Cases 6 to 8: consistent with `docs/dev/change-standard.md`, "The rules" 6 and "Commands and their filters". Case 7 as written cannot run on the unchanged tree, and the sentence above the cases asks for a first run of every case there; only case 6 names the old path.
- Case 9: consistent with "The rules" 14. It lets through lines under `skills/code/codebase-design/` and asks the builder to check nothing there.
- "Conventions" and "Where the work happens" agree: no git command that changes state, `mv` for the move.
- The decision "Each other skill whose text changes only in a name gets its patch part raised once" does not fit `ordo-help`: its sequence is "printed verbatim" (`skills/ordo/ordo-help/SKILL.md:99`), and removing the `/repo-setup` line changes its output. `docs/dev/skill-layout.md`, "Frontmatter", gives the major part when a run's "output is changed or removed". `ordo-help` is at 4.0.0.
- Item 1 says the head comments of `sync_rules.py` and `sync_rules.test.sh` name their own skill or folder. `grep -c 'repo-setup'` on each printed no hit; both say "beside this script". No change is needed in them.

Findings:

5. The first run of case 7 on the unchanged tree needs the old path named, as case 6 has it.
6. `ordo-help`'s printed sequence loses a line, so its version part is not the patch part under `docs/dev/skill-layout.md`, "Frontmatter". The brief should name the part.
7. Item 1's premise that the two scripts' head comments name their skill is false. Drop them from the list of exceptions.

## 5. The question

- Case 1: no. The text is read for the questions, the tree, the stop and the order.
- Case 2: no for the shared-rules block. Yes for the glossary: a repository with no glossary gets no offer in this case (item 2 says "when the repository has a glossary"), and on its next run `sync_rules.py` exits 2 for the missing glossary and "Steps / sync" 4 drafts the file. The ruling says the second case "offers what is missing".
- Case 3: yes in part. `templates/CLAUDE.md` holds placeholders (`<name>`, the paragraph, the commit rule, the Build block) that "The questions" fill in a new repository. The brief does not say which of them are asked or derived for an existing repository, so the builder chooses.
- Cases 4 and 5: no.
- Cases 6, 7, 8: no for "the two scripts behave as before"; they say nothing about the skill text, which the read cases carry.
- Case 9 and the step line's grep: yes when taken alone. A literal replacement prints nothing and leaves false text:
  - `gen_figures.py` lines 2198 to 2222 draw one lane `/repo-setup` with seven stops and one lane `/ordo-init` with six, so the figure would hold two lanes named `/ordo-init`;
  - `skills/code/wizard/SKILL.md` lines 22 and 23 would be two rows that both name `/ordo-init`;
  - `skills/ordo/ordo-help/SKILL.md` lines 99 and 100 and `README.md` lines 41 and 42 would be two lines for one command;
  - citations such as "`repo-setup`, Steps 3 and "Steps / sync"" would point at sections the merged skill may not have.
  - Item 3's "with the sentence around it made true" covers these only in general words.
- Verify 3: yes alone (frontmatter only); it is a fact check beside the reading.
- Verify 5: yes. It proves the script runs and which files changed, not that the one lane's boxes fit the frame. Step 1's booking records that its figure was rendered and read; this brief asks for no such look.
- The step line's "verify list passes on main": yes alone, and it passes only after the state file's list is rewritten (finding 2).
- Item 2's "every stop, refusal, anti-pattern and rule of both skills is kept, each once": no; the report's table of what each became lets the reviewer read it.
- Item 2 on arguments: yes. "Chosen by what `/ordo-init` finds, never by an argument" does not say whether `[<path>]` (the repository to work on) and `[<folder>]` (where the `plan.yaml` is, with a project's name in the `projects:` form) remain. Dropping them loses something `/repo-setup` did, and nothing checks it.
- Item 2 on the case order: yes. A folder with no tracked file that holds a `plan.yaml` fits the first and the third case, and the brief gives no order.
- Items 1, 3, 4, 5: no, given case 9 with the reading of each changed sentence.

Findings:

8. The pipeline figure: the brief should say it draws one `/ordo-init` lane with the stops of the merged skill's Stops table, that the README's alt text and figure sentence follow, and that the regenerated figure is rendered and read for boxes inside the frame.
9. The arguments: the brief should say whether `<path>` and `<folder>` remain in the Quick start. This is a call's shape, which `docs/dev/change-standard.md`, "The rules" 4, keeps from the builder.
10. The second case with no glossary, and with no `CLAUDE.md`: the brief should say whether a glossary is offered from `templates/docs/glossary.md`, and which placeholders of `templates/CLAUDE.md` are asked or derived.
11. The order in which the three cases are tested: the brief should give it, for a folder that fits two.
12. The merged lines: the brief should say that the two sequence lines of `ordo-help` and of `README.md` lines 41 and 42 become one line with the same text in both, and the two rows of `wizard` one row.

## 6. Implied inputs

- `sync_rules.py` finds its templates beside itself (`sync_rules.py:162: here = os.path.dirname(os.path.realpath(__file__))`). The whole folder moves together; cases 6 and 7 cover it.
- `sync_rules.test.sh` finds the script and the templates from its own place (`sync_rules.test.sh:22: script_dir=$(CDPATH= cd "$(dirname "$0")" && pwd -P)`). No path inside the test needs an edit; case 6 covers it.
- `check_config.py` finds the `plan` skill three folders up from itself (`check_config.py:112`). Its place does not change; case 8 covers it.
- `check_config.py` on Ordo's own configuration: `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` now ends `ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0. After the move it reports the prose standard as a page that does not exist unless line 15 is changed. Missing from "Cases"; expected result: the same `ok:` line, exit 0.
- `skills/orchestration/land/templates/checks.sh` reads the verify list from the state file (finding 2). Missing from the brief.
- The skills that look for a folder beside their own (`writing:30`, `code-comments:32`, `paper:76`, `grant:36` and `:362`, `grill:73`, `:203`, `:302`, `:311`, `:338`, `spec:169`): each is in item 3 and the paths. Covered.
- `codebase-design` names the `repo-setup` folder until step 4 lands; on a tree with step 5 and without step 4 its refusal "No repo-setup folder" fires. The brief states that step 4 changes it. Covered as intended.
- An installation made with the README's copy loop keeps a `repo-setup` folder. `README.md:173` already tells the user to remove a skill Ordo no longer ships. Covered by existing text.

Findings:

13. Add a case: `python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml` exits 0 with its `ok:` line, which holds only when `docs/plan.yaml` line 15 names the moved page.

## 7. ADRs

Read: the status and Decision of each of the 47 records, with `for f in docs/adr/0*.md; do ...; awk '/^## Decision/{p=1;next} /^## /{p=0} p' $f; done`, then searched for the terms the step touches.

- 0001 (proposed; superseded by 0030 in the `standards` key): touched. "in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`". Named in the brief. Lines 16 and 20 also name the skill and need the new name for case 9.
- 0002: touched in its Context only (line 7). Named.
- 0010: touched. "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file and names the change in the brief or the booking." The step changes two commands of the verification page. Not named in the brief.
- 0014: touched. "otherwise the `repo-setup` skill's `templates/docs/dev/prose-standard.md`". Named.
- 0026: touched in its Context only (line 7). Named.
- 0030: touched. "otherwise the `repo-setup` skill's `templates/docs/dev/prose-standard.md`, with no refusal for a missing configuration". Named.
- 0045: touched lightly: the step changes the "Use instead" rows of `wizard`. "They differ from the sources only where this repository forces it: the sections and the frontmatter of `docs/dev/skill-layout.md`". No contradiction. Not named.
- 0047 (proposed): touched. "3. the default pages in the `repo-setup` skill's folder, which stands beside this skill's folder." Named. The brief changes the folder's name only, which the ADR folder's README allows as a refinement.
- The other records (0003 to 0009, 0011 to 0013, 0016 to 0044, 0046): not touched. None decides that `repo-setup` and `ordo-init` are two skills.

Findings:

14. ADR 0010 is touched and not named. The brief should name it with the two commands that change on the verification page.
15. No part of the brief contradicts an ADR.

## 8. Dictated text

- "`name: ordo-init`": `grep -n 'name: ordo-init' .scratch/19-codebase-design/agents/briefs/5.md` prints line 32. Holds (`docs/dev/skill-layout.md`, "Frontmatter": `name` equals the folder's name).
- "`metadata.version: "4.0.0"`": `grep -n '"4.0.0"'` prints lines 32 and 84. Holds ("Frontmatter": the major part when a run's output is changed; a run on a configured repository gains the comparison of the two blocks).
- "twenty-one": `grep -n 'twenty-one'` prints lines 36 and 120. Holds: `ls -d skills/*/*/SKILL.md | wc -l` prints 22 now, and one is removed.
- The paths `skills/ordo/ordo-init/templates/sync_rules.test.sh` and `skills/ordo/ordo-init/templates/sync_rules.py`: `grep -n 'skills/ordo/ordo-init/'` prints lines 25, 54, 55, 56 among others. Holds (`docs/dev/skill-layout.md`, "Paths and names").
- The brief dictates no other line word for word; the text of the merged skill, the README row, the glossary entries and the sequence line are left to the builder.

Findings: none.

## Declined to judge

- Whether the lines of done and dropped roadmap entries keep the old name: the brief records it as a reversible decision, and the ruling's "every skill, page and figure" can be read either way. The user's call.
- Whether a builder edits `docs/roadmap.md` lines 26, 41 and 42 directly or the change goes through `/roadmap`: outside what a read and a rerun settle.
- Whether the patch part is right for `writing`, `paper`, `code-comments`, `grant`, `grill` and `spec`, whose fallback folder changes name: a judgment on "every run behaves as before" once the whole set is installed together.
- Whether the merged description fits 1,024 characters with the triggers of both skills (the two are 678 and 780 now): only the build shows it; verify 3 checks it.
- The served model of this agent: not visible from inside the run.

Agent usage: adb032fec2fe9803e, claude-fable-5-2, 172993 tokens, 22 tool uses, 5.8 minutes.

## Closed

- 1: item 3 says every citation of a section of `ordo-init` or `repo-setup` in the glossary and `plan-terms.md` is re-pointed.
- 2, 14: "What is on the tree" names ADR 0010 and says the orchestrator rewrites the state file's verify list and `standards` line at landing.
- 3: `decision-form.md` removed from the paths.
- 4: the premise says two lines.
- 5: case 7 names the old path for its first run.
- 6: `ordo-help` goes to 5.0.0 (Decisions).
- 7: the two head comments dropped from item 1.
- 8: item 3 says what the pipeline figure draws, and verify 5 asks for the figure rendered and read.
- 9, 11: item 2 keeps the arguments and gives the order of the cases.
- 10: item 2 says a missing glossary is offered and how the placeholders of `CLAUDE.md` are filled.
- 12: item 3 says the two lines become one.
- 13: case 10 added.
