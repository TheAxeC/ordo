# Step 1 brief check (on main at 6be35e1)

Brief read: /Users/axelfaes/workspace/ordo/.scratch/4-a-ordo-help-skills/agents/briefs/1.md (uncommitted). `git log --oneline -1` printed `6be35e1 Open plan 4.A, ordo-help skills`. `git status --short` printed the two modified ledger files and the untracked brief. Nothing was changed in the repository. The only files written were scratch copies of the figure script under the session scratchpad (check 8, item 12).

## 1. Names

The step changes these names: what `ordo-help` prints and reads (description, title, Quick start, What it reads, Steps, Stops, Anti-patterns), the new argument `skills` / `/ordo-help skills`, the version `3.1.0`, README line 23 and the `/ordo-help` box body at `docs/figures/gen_figures.py:539`. I ran `grep -rn 'ordo-help' --exclude-dir=.git --exclude-dir=archive .`, `grep -rn -i 'quick start' ...`, `grep -rn '3\.1\.0' ...` and ``grep -n -o 'Stated in: [^.]*ordo-help[^.]*' docs/glossary.md skills/repo-setup/templates/plan-terms.md``. Every hit outside "Paths this step writes", with whether the change makes it false:

- README.md:29 "The order of use, shortened from what `/ordo-help` prints:". Holds.
- README.md:57 "`/ordo-help` prints the full sequence, including what to do when a command stops." Holds, because the bare form is unchanged.
- README.md:61, the alt text of pipeline.svg, which is the same as gen_figures.py:421: "with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them". Holds.
- gen_figures.py:6 and :11, the head comment, which names /ordo-help and "the sequence /ordo-help prints". Holds.
- gen_figures.py:571 and gen_figures.py:684-685, the plan-loop card "/ordo-help <entry>", "Prints where the plan stands and the next command to type." Holds, and plan-loop.svg is unchanged.
- gen_figures.py:677, the refusal card "such as a required key missing, no ledger folder". Holds for the other two forms.
- The Use instead rows that point at `/ordo-help` or `/ordo-help <entry>`. All hold:
  - skills/plan/SKILL.md:29
  - skills/spec/SKILL.md:26
  - skills/plan-orchestration/SKILL.md:25, :27 and :49
  - skills/session-retro/SKILL.md:26
  - skills/roadmap/SKILL.md:31
  - skills/land/SKILL.md:25
  - skills/grill/SKILL.md:29
  - skills/diagnose/SKILL.md:28
- docs/glossary.md:81 and plan-terms.md:76, **plan skills**: "the skills that run plans from `.agents/plan.yaml` (..., `ordo-help`, ...)". Holds, because the other two forms still read it.
- docs/glossary.md:114 and plan-terms.md:109, **sequence, the**: "that `/ordo-help` prints verbatim. Stated in: `ordo-help`, "The sequence, printed verbatim"". Holds, because that section is unchanged.
- docs/glossary.md:42 and plan-terms.md:37, **dispatch entry**: "... `ordo-help`, Steps 3". Holds under the brief as written, because the existing list keeps its numbers. It becomes false if the existing list moves under a `###` subsection (see check 8, item 5). The skill's own "Steps 3" (SKILL.md:40) and the "Steps 1" cell (SKILL.md:125) would then change too.
- skills/ordo-init/SKILL.md:10: "the one file the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`) need". Not false: two of the three forms need the file.
- .agents/plan.yaml:1, the comment that lists /ordo-help among the readers. Holds.
- docs/academic-coverage.md:171, "which `/roadmap` and `ordo-help` already show". Holds.
- docs/roadmap.md:21-26, entry 4.A. Holds, and it is the source of the goal.
- docs/dev/skill-layout.md, "Sections, in order", row 2, Quick start: "A code block with every invocation, one per line, each with a short comment." Holds. The step makes this section an input that another skill prints, which the page does not mention. That is not false.
- docs/academic-coverage.md:89, "The paper skill's Quick start". Holds.
- `3.1.0` has no hit outside the skill and this plan's ledger.
- README.md:105, the copy-install list of skill names. Unrelated, and holds.

Findings:
- No hit is made false by the brief as written.
- The `dispatch entry` "Stated in: `ordo-help`, Steps 3" line in docs/glossary.md:42 and skills/repo-setup/templates/plan-terms.md:37 is tied to the layout question of check 8, item 5. If the Steps list is restructured, both files, plus the self-references at SKILL.md:40 and SKILL.md:125, must be added to "Paths this step writes".

## 2. The step line

Each part of plan.md's step 1 line, with the requirement of "What to build" that serves it:

- "`/ordo-help skills` in `skills/ordo-help/SKILL.md`": the opening paragraph of "What to build" and its `skills/ordo-help/SKILL.md` subsection.
- "the Quick start line": item 3.
- "the description's trigger phrase": item 1.
- "the input read (the `skills/` folder that holds `ordo-help` itself, its own folder's real path followed through the link)": item 4, second bullet.
- "a Steps subsection that prints the name and the Quick start block of every skill there": item 5 and its six bullets.
- "`skills` read before `<entry>` is matched": item 4, first bullet.
- "the version raised by the minor part": item 1, `3.1.0` to `3.2.0`.
- "the `ordo-help` row of `README.md`": the "`README.md` line 23" subsection.
- "the review reads the skill against `docs/dev/skill-layout.md` and the diff against the goal": only partly served. Line 48 asks the reviewer to read the old file and the new one side by side for kept rules. No line asks the reviewer to read the whole skill against `docs/dev/skill-layout.md` or the diff against plan.md's Goal. The `refute` skill holds a diff to the standards anyway, so the skill-layout half is covered by that skill. The "diff against the goal" half has no requirement.
- "(1 commit)": that is the landing's work, and the brief needs no requirement for it.
- The brief also adds the figure (`gen_figures.py` line 539 and `pipeline.svg`), which the step line does not name, as decision 4. It is a stated, reversible widening, and its reason is the change standard's rule 5.

Findings: the step line's review clause "the diff against the goal" has no requirement in the brief. One line under "What to build" or "Verify before you report" would close it.

## 3. Premises

Each premise of "What is on the tree", rerun:

- 129 lines: `wc -l skills/ordo-help/SKILL.md` printed `129`. Holds.
- Version: `grep -m1 version: skills/ordo-help/SKILL.md` printed `  version: "3.1.0"`. Holds.
- Quick start has two lines, Steps has four items, What it reads item 1 reads `.agents/plan.yaml`, and the Stops rows are "No stop", "A required key missing" and "No ledger folder". Read in the file (`cat -n skills/ordo-help/SKILL.md`, lines 14-17, 43-62, 31 and 115-119). Holds.
- Description length: the brief's `python3 -c 'import yaml; ...'` printed `564`. Holds.
- 15 `SKILL.md` files: `ls skills/*/SKILL.md | wc -l` printed `15`, with the 15 names the brief gives. `ls -a skills/` shows no other folder. Holds.
- Exactly one Quick start code block per skill: a loop over `skills/*/SKILL.md` running `awk '/^## Quick start/{q=1;next} q&&/^## /{q=0} q&&/^```/{c++} END{print c+0}'` printed `fences=2` for each of the 15. Holds.
- Path order: `ls skills/*/SKILL.md` printed `plan-orchestration/SKILL.md`, `plan-retro/SKILL.md`, `plan/SKILL.md`, in that order. `LC_ALL=C ls -1 skills/` printed `code-comments diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec writing`. Holds.
- The installed links: `readlink ~/.claude/skills/ordo-help` and `readlink ~/.claude-backup/skills/ordo-help` both printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`. `cd ~/.claude/skills/ordo-help && pwd -P` printed the same path. `ls -d ~/.claude-backup/skills/*/ | wc -l` printed `16`. Two parts of this premise are inaccurate:
  - The 16 are the 15 Ordo links plus `synced`. `.trash` is not among them, since the `*/` glob does not match a dot folder (`ls -d ~/.claude-backup/skills/.*/` printed `/Users/axelfaes/.claude-backup/skills/.trash/`). The parenthetical "(`synced`, `.trash`, and 16 entries in all ...)" reads as if `.trash` were counted.
  - "whose parent `~/.local/share/ordo-stable/skills/` holds the Ordo skills only" is false. `ls -a ~/.local/share/ordo-stable/skills/` lists 16 folders, among them `literature`. `find ~/.local/share/ordo-stable/skills/literature` shows only `templates/__pycache__/lookup.cpython-313.pyc`, which `git check-ignore -v` ignores through `.gitignore:5:__pycache__/`. `ls ~/.local/share/ordo-stable/skills/*/SKILL.md | wc -l` printed `15`. So the pinned skills folder holds a folder with no `SKILL.md`, which is a real instance of case 5. The pinned worktree is at `beb9fe9`, `git describe --tags` `v8.2.0`.
- README line 23: `sed -n '23p' README.md` printed the row exactly as quoted. Holds.
- gen_figures.py:
  - `sed -n '539p'` printed the body as quoted. Holds.
  - `grep -n '^import\|^from'` printed `sys`, `dataclasses`, `html`, `pathlib`, `typing`. Holds.
  - The two output files and the `error:` line on a label that does not fit: the head comment, "Errors", says so. Holds.
  - "Its head comment says a change to a label is made in the script and the script is run again" is a paraphrase. The comment says "A change to a Stops table, to the sequence or to a skill name is made in the labels below, and the script is run again." It holds in substance.
  - A scratch copy run (`python3 -I <scratch>/gen_figures.py`) printed `exit=0`. `cmp` against main's `pipeline.svg` and `plan-loop.svg` reported both identical, so the script reproduces main's figures.
- Glossary: `grep -n -i 'quick start' docs/glossary.md skills/repo-setup/templates/plan-terms.md` printed nothing, `rc=1`. Holds.
- ADRs: `grep -ln 'ordo-help\|Quick start' docs/adr/*.md` printed nothing, `rc=1`. Holds. "0001 to 0020" is a range with a gap: `ls docs/adr/` shows no 0015.
- Verify list: the `verify:` block of `orchestrator-state.md`, read beside the `grep -n -E '^(sh|python3|git|perl|```)' docs/dev/building.md` lines 6-12, has the same seven commands with the change standard's filters. Holds.
- Roadmap: `grep -n '^## ' docs/roadmap.md` lists no entry numbered or titled `skills`. 4.A's title is `ordo-help skills`. Holds.

Findings:
- Premise line 16 is wrong in two details. `~/.local/share/ordo-stable/skills/` holds `literature`, a folder with only an ignored `__pycache__` and no `SKILL.md`, so it does not hold "the Ordo skills only". The count of 16 does not include `.trash`.
- The brief should name `literature` as the real instance of case 5, as a later bullet of check 6 says.

## 4. Cases and checks

- Case 1 (15 blocks in `LC_ALL=C ls -1` order): consistent with the rules file and the standards. The order matches `LC_ALL=C ls -1 skills/`.
- Case 2 (no `.agents/plan.yaml`): consistent.
- Case 3 (no sequence, no choices line, no position; ruling D2): consistent.
- Case 4 (run from the installed link): it asks the builder to check places the step does not change: the installed links `~/.claude/skills/ordo-help` and `~/.claude-backup/skills/ordo-help`, and the pinned folder `~/.local/share/ordo-stable/skills/`, which is at v8.2.0 and holds the old `ordo-help`. The builder can only read the new text's path rule against those folders. The case's stated consequence, "so `synced` and `.trash` are not listed", does not tell the two folders apart. `synced` holds no `SKILL.md` (`ls ~/.claude-backup/skills/synced` shows one UUID-named entry and `synced/*/SKILL.md` matched nothing), so it is skipped by the case-5 rule in either folder. `.trash` is a dot folder that `LC_ALL=C ls -1` never lists. A run that wrongly used the folder holding the link would print the same 15 blocks on this machine.
- Case 5 (a folder with no `SKILL.md` is skipped): consistent. Its real instance is the pinned folder's `literature` (check 3), which the brief does not name.
- Case 6 (no Quick start block): consistent with decision 3. No instance is on main. One instance exists on this machine, under an install path the README documents: see check 6.
- Cases 7 and 8 (the bare and `<entry>` forms unchanged): consistent with the change standard's rule 17, by reading the old and new text.
- Case 9 (description length): consistent with `docs/dev/skill-layout.md`, "Frontmatter".
- Case 10 (the figure run and the diff stat): consistent. It checks `docs/figures/`, a place the step changes.
- Case 11 (three lines in the Quick start block): consistent with skill-layout "Sections, in order", row 2.
- The brief's "Report" section has no part for the change standard's rule 14: the grep of the changed names, quoted, and each sentence about the changed file as a whole, reread, with the line that shows it still holds. Examples are the title paragraph, the "No stop" row, the Rules bullet "The skill writes nothing." and the figure script's head comment sentence "Every box, arrow and label is written in this file, taken from each skill's Stops table and from the sequence /ordo-help prints". The rules file binds this anyway, but the brief's report list does not ask for it.

Findings:
- Case 4 checks places the step does not change, and its stated consequence holds for either folder, so it cannot show the real-path rule.
- Case 5 lacks its real instance (`literature` in the pinned folder).
- The report shape has no item for rule 14's grep and the whole-file sentences.

## 5. The question

The goal: `/ordo-help skills` prints every skill's name and Quick start block, copied from its `SKILL.md`, for every skill in the folder that holds `ordo-help`, and `skills` is read before `<entry>`. For each check, could it pass without the goal being reached?

- The check on the step's line (the review reads the skill against skill-layout and the diff against the goal): yes. It is a reading of text, and a skill text that reads right can still print a block wrongly or miss a skill. plan.md's own answer says the same, and step 2's run closes it.
- Case 1: yes, it is a reading. Step 2 closes it.
- Case 2: yes, it is a reading. It is not a goal case: it guards D1's "in any repository".
- Case 3: yes, it is a reading. It guards D2.
- Case 4: yes. As check 4 says, its stated consequence is true for the wrong folder as well, so even a run could not tell the folders apart on this machine.
- Case 5: yes, it is a reading. Not a goal case.
- Case 6: yes, it is a reading. Not a goal case.
- Cases 7 and 8: yes, they are readings. They guard the unchanged forms, and only case 8 bears on "`skills` read before `<entry>`".
- Case 9: yes. A length is a fact, unrelated to whether the skill prints the blocks.
- Case 10: yes. It proves the figure was regenerated, not that the skill works.
- Case 11: yes. The Quick start line can exist while the `### skills` steps are wrong.
- "What to build" item 1 (verify 2 and 3): yes. The length and the version are facts. Whether the description and the triggers say the new case is a reading.
- Item 2 (title paragraph): yes, a reading.
- Item 3 (verify 5): yes. Three lines between the fences say nothing about the subsection.
- Item 4 (What it reads): yes, a reading.
- Item 5 (Steps): yes. It is a reading, with cases 1 to 6, and is closed only by step 2.
- Item 6 (Stops): yes, a reading.
- Item 7 (Anti-patterns): yes, a reading.
- Item 8 (Rules): yes, a reading.
- README row: yes. It is a reading, and only the character-set check runs on it.
- Figure (verify 4): yes. `git diff --stat` naming both files proves the label changed, but not that it names the new mode.

Findings: every check of this step could pass without the goal being reached, as plan.md states for step 1. Step 2's run, the gate, is the only check that could not. No case of this brief is wrong for that reason. Case 4 is weaker than it reads (check 4).

## 6. Implied inputs

Is this a code step? The step changes a skill text and one string literal of `docs/figures/gen_figures.py`. The script's behaviour does not change, and its own label-fit error checks the new string. Under the change standard's rules 1 and 13 and "Scripts compute facts; judgment is read", it is not a code step: no script behaviour is added or changed, and the brief rightly keeps no test. The `### skills` steps are still a procedure an agent runs on inputs, so the inputs it implies are listed here as the prompt asks.

Inputs that have happened, or whose wrong answer costs something, that "Cases" does not name:

- **The skills CLI install** (README.md "With the skills CLI": "copies each skill folder into `~/.agents/skills` and links it from ... `~/.claude/skills`"). The real path's parent is then `~/.agents/skills/`. On this machine that folder holds `find-skills`, a skill that is not Ordo's (`ls -la ~/.agents/skills`), and that skill has no Quick start (`grep -c '^## Quick start' ~/.agents/skills/find-skills/SKILL.md` printed `0`).
  - Expected result under the brief's rule: `/find-skills`, then `no Quick start block`, printed among the Ordo blocks. The goal's wording, "every skill in the `skills/` folder that holds `ordo-help` itself", gives that. Its purpose, "every mode of every Ordo skill", does not ask for it.
  - Missing from Cases. The orchestrator should state the expected result.
- **The copy install** (README.md "By copying the folders"). The folders are real copies in `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills`), with no link. The skills folder is then the folder that holds the user's other skills. On this machine that folder holds `synced`, which has no `SKILL.md` and would be skipped.
  - Expected: every folder there with a `SKILL.md` is printed, including skills that are not Ordo's.
  - Missing from Cases.
- **The pinned folder's `literature`**, a folder with no `SKILL.md` (check 3).
  - Expected: skipped, and 15 blocks printed from `~/.local/share/ordo-stable/skills/`, equal to the gate's count on main.
  - Covered by case 5 in the abstract. The instance is not named, and premise line 16 says the folder holds Ordo skills only.
- **Where the session learns "the folder this `SKILL.md` is read from"**. Item 4 says to resolve the folder with `pwd -P` but not where its path comes from: the base directory the runner gives when the skill loads.
  - Expected: `~/.claude/skills/ordo-help` (or `~/.claude-backup/skills/ordo-help` under `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-backup`, which `echo $CLAUDE_CONFIG_DIR` printed), resolved by `pwd -P` to `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`. The `pwd -P` result was verified (check 3). That the runner states the base directory is not verified: this agent does not invoke skills.
  - Missing from Cases.

Inputs not listed, because none has happened and a wrong answer costs nothing: two code blocks under one Quick start (none on the tree), `skills` followed by more words, and a roadmap entry named `skills` (the premise shows none).

Findings: the skills CLI install and the copy install are missing from Cases. Both are install paths the README documents, and on the CLI path a skill that is not Ordo's, with no Quick start, sits beside the skill. Where the folder path comes from is also missing. The `literature` instance of case 5 is not named.

## 7. ADRs

Each record was read for its part in force:

- 0003 reads `Status: superseded by 0013` and 0016 reads `Status: superseded by 0018`, so both are wholly superseded.
- 0001, 0002, 0004 to 0014 and 0017 to 0020 are `proposed` and in force.
- 0015 does not exist (`ls docs/adr/`).

None touches the step. A record touches a step when its decision governs a file, name, rule or behaviour the step changes, and none governs `skills/ordo-help/SKILL.md`, the README skills table or `docs/figures/`. The nearest are:

- 0005, "Every choice taken under self-rule ... is written to `<ledger_root>/choices.md`". It decides where the choices are written. The step keeps the two forms that read the file and adds a form that does not read it, so the decision is not changed or contradicted.
- 0012, "Every commit a skill makes on main names its paths in the commit command". It governs the step's one commit, which `/land` makes. The brief changes no commit behaviour.
- 0010, "`/spec` at its preflight ... compare the plan's verify list with the verification page's commands". It governs the brief's premise line 21, which the brief follows. It governs no file the step changes.

Findings:
- None. The brief names no ADR, says none touches the step, and no part of it contradicts one.
- One minor wording point: "records 0001 to 0020" covers a range in which 0015 does not exist.

## 8. Dictated text

`grep -n` over the brief for each dictated line (pattern `'/<name>\|/<folder name>\|`### skills`\|no Quick start block\|pwd -P\|LC_ALL=C ls -1\|3\.2\.0\|A third line'`) found lines 26, 30, 32, 35, 37, 39, 40, 43, 45, 62, 67, 101 and 137. Lines 44, 46 and 48 quote existing text. Each dictated line, read against the rules file and the standards pages:

1. Line 26, the printed line `/<name>`. Holds. It is D1's format.
2. Line 30, `metadata.version` `3.2.0`, and line 137, the check `  version: "3.2.0"`. Holds under skill-layout "Frontmatter". The minor part is right: before, `skills` was read as `<entry>` and refused as "No ledger folder", and the page says a refusal "is no run that worked before".
3. Line 30, the trigger phrases `ordo-help skills`, `which skills are there`, `list every skill and its modes`, `what modes does a skill have`. Introduced with "such as", so read as examples, not dictated. They hold against skill-layout "Frontmatter": no neighbouring Ordo skill's `Triggers on:` has these phrases. Their word "modes" relates to item 9 below.
4. Line 32, the third Quick start line `/ordo-help skills`. Holds under skill-layout "Sections, in order", row 2. The comment `print each skill's name and its Quick start block, in folder-name order` is introduced with "such as", so read as an example. It holds: ASCII, the same verb form as the two existing comments, and the comment column at 23 is reachable with five spaces.
5. Line 37, the heading `### skills`. Breaks `docs/dev/skill-layout.md`, "Sections, in order", row 5: "A skill with modes or phases gives each a `### <name>` subsection with its own numbered list." The brief puts only the new mode under a `###` heading. The two existing forms stay a bare numbered list under `## Steps`, introduced by "one line before it", which is prose doing the job of a heading. Following row 5 means a `###` heading for the existing list as well. That changes the "Steps 3" and "Steps 1" self-references (SKILL.md:40 and :125) and the glossary's `dispatch entry` "Stated in: `ordo-help`, Steps 3" in docs/glossary.md:42 and skills/repo-setup/templates/plan-terms.md:37, which would join "Paths this step writes". The heading `skills` itself is a noun-phrase label and holds against "Lists and tables" and the prose standard's "0. Hard rules", "Headings are labels".
6. Line 35, the command `cd <the skill's folder> && pwd -P`. Holds. `cd ~/.claude/skills/ordo-help && pwd -P` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`.
7. Line 39, the sort `LC_ALL=C ls -1`. Holds. It printed the order of case 1 on main, and on the pinned folder the same order plus `literature`.
8. Line 40, the printed line `/<folder name>`, and line 43 and 67, the line `no Quick start block`.
   - `/<folder name>` holds. It equals line 26's `/<name>`, since each skill's `name:` equals its folder name: a loop comparing `sed -n 's/^name: //p'` with the folder printed no mismatch. The brief calls one value by two names (lines 26 and 40). That does not break a rule, but the skill text should pick one.
   - `no Quick start block` holds: it is printed output a person reads, in ASCII.
   - Line 40's wording is a requirement, not dictated text, but it puts the prohibition "never from memory or reworded" in the Steps item. Line 45 then dictates the same prohibition as an Anti-patterns row. Together they write one rule twice, against skill-layout "Where a rule goes" ("A rule that forbids a tempting shortcut goes in Anti-patterns"; "A rule is written once") and that page's Anti-patterns row "The same rule written in two sections". The existing skill's pattern is a Steps item that says what to do, and a row whose Do instead cell is `Steps 1`.
9. Line 45, the Anti-patterns row:
   - The Anti-pattern cell, "a Quick start block printed from memory, from an earlier run or in other words", holds.
   - The Why it fails cell, "a reader then types a mode the skill no longer has, or misses one it has", holds on its own words. It calls an invocation a "mode", while the brief calls `/ordo-help skills` "the `skills` form" (lines 36, 37, 44, 45, 46 and decision 1). If both words reach the skill text, that breaks the prose standard, "D. Structure", "No synonym cycling". The word skill-layout uses is "modes". The glossary has no entry for either word in this sense; its "form" entries (`projects:` form, decision form, insertion form) are other senses.
   - The Do instead cell, "copy the block from the `SKILL.md` read in this run, as `### skills` says", restates the step and names its section. Together with line 40 it writes the rule twice, as item 8 says.
10. Line 44, the existing row names "A required key missing" and "No ledger folder". Holds: they are quoted as on main.
11. Line 46, "The skill writes nothing." and line 48, "The sequence, printed verbatim". Hold: existing text, kept.
12. Line 56, the figure body `"Prints the sequence, every skill's Quick start and, for a named plan, where it stands and the next command."`, introduced with "for example", so read as an example.
    - Tried in a scratch copy of the script, with only line 539 replaced (`python3 -I <scratch>/gen_figures.py`). It printed both `wrote` lines and `exit=0`, `plan-loop.svg` compared identical with `cmp`, and the label fits.
    - As one string literal, line 539 would be 117 characters. The file's longest line is 103 (`awk 'length($0)>100'` printed only `615: 103`), and the file splits longer bodies over two literals (lines 495-496 and 502-503).
    - No Python coding-standard page exists (`ls docs/dev/` printed `blind-comparison.md building.md change-standard.md scripts.md skill-layout.md`), so this breaks no rule. A split, though, writes line 540 as well, and "Paths this step writes" names "`docs/figures/gen_figures.py` line 539" only.

Findings:
- `### skills` (line 37) with the existing list left without a subsection breaks skill-layout "Sections, in order", row 5. Fixing it widens the paths to docs/glossary.md:42 and skills/repo-setup/templates/plan-terms.md:37, and needs the skill's "Steps 3" and "Steps 1" references updated.
- The prohibition is written in both the Steps item (line 40) and the dictated Anti-patterns row (line 45), against skill-layout "Where a rule goes".
- "form" (the brief's word) and "mode" (line 45's cell, the triggers, skill-layout) name one thing, which risks breaking the prose standard's "No synonym cycling" in the skill text.
- `/<name>` and `/<folder name>` name one value two ways.
- The figure body as an example fits the box. Written the file's way, over two literals, it needs "line 539" widened to "lines 539 to 540".

## Declined to judge

- Whether `/ordo-help skills` should list skills that are not Ordo's under the skills CLI and copy installs. The goal's folder rule says yes, and its purpose, "every Ordo skill", does not ask for it. The orchestrator rules on this, or the user does if it reads as a change to D1.
- Whether the runner states the base directory of a loaded skill, which item 4's `pwd -P` depends on. Not verified: this agent invokes no skill.

Agent usage: aa44557b3704429d8, claude-opus-5-5, 168049 tokens, 40 tool uses, 7.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, the **dispatch entry** "Stated in" tied to the Steps layout: the Steps list moves under a subsection (see 8, item 5), so "What to build" item 5 now rewrites `skills/ordo-help/SKILL.md:40`, the Do instead cell at `skills/ordo-help/SKILL.md:125` and the "Stated in" of `skills/repo-setup/templates/plan-terms.md:37`, with `docs/glossary.md:42` synced; "Paths this step writes" gains `plan-terms.md` line 37, `docs/glossary.md` line 42 and `skills/repo-setup/SKILL.md` lines 1-10, whose version takes the patch part (new subsection "`skills/repo-setup/SKILL.md`"); cases 11 and 14 check it.
- 2. The step line, "the diff against the goal": "Verify before you report" check 7 reads the whole diff against plan.md's Goal and names the line that delivers each part, and the Report carries it.
- 3. Premises, the folder behind the link and the count of 16: the premise lines now say the 16 are the 15 links and `synced`, with `.trash` a dot folder beside them, and that `~/.local/share/ordo-stable/skills/` holds the 15 skills and `literature`, which has no `SKILL.md`. The ADR line says 0001 to 0020 with no 0015.
- 4. Cases and checks, cases 4 and 5: case 4 now states the base directory, the real path and the skills folder it gives; case 5 names `literature` in the pinned folder as the folder skipped.
- 4. Cases and checks, rule 14 in the report: check 8 of "Verify before you report" asks for the grep of each changed name and the reread of each whole-file sentence, and the Report carries it.
- 6. Implied inputs, the skills CLI and copy installs and the base directory: cases 6 and 7 are added with their expected results, decision 5 records that every folder with a `SKILL.md` is printed as the goal's folder rule says, a premise line states that the runner gives the base directory, and "What it reads" names it.
- 8. Dictated text, item 5, `### skills` alone: "What to build" item 5 gives each mode its subsection, `### The sequence and the plans` for the existing list and `### skills`, with decision 6.
- 8. Dictated text, item 8, the rule written twice: the Steps bullet keeps only what to do ("copied from the file read in this run"), and item 7 says the rule is written in the Anti-patterns row only, whose Do instead cell names the step.
- 8. Dictated text, items 8 and 9, "form" and "mode", `/<name>` and `/<folder name>`: the brief now says "mode" throughout and requires it in "What to build" and Conventions, and uses `/<name>`, `<name>` being the folder's name.
- 8. Dictated text, item 12, the figure body over two literals: the path becomes `docs/figures/gen_figures.py` lines 539-540, and the brief says a long body is split as lines 495 to 496 split theirs.
- Dictated line added after the check, `### The sequence and the plans`: holds; a noun-phrase label (`docs/dev/skill-layout.md`, "Sections, in order", and the prose standard's "Headings are labels").
- Dictated line added after the check, the reference form `"Steps / <subsection>" <n>`: holds; it is the form `skills/spec/SKILL.md` uses (`"Steps / The brief check" 1`).
- Dictated line added after the check, `5.3.1`: holds under `docs/dev/skill-layout.md`, "Frontmatter", patch part: wording only.
- Declined to judge, skills that are not Ordo's under the CLI and copy installs: ruled by the orchestrator as decision 5, under the goal's folder rule, which D1 does not change.
- Declined to judge, the base directory: the runner states it at every skill load of this session (`Base directory for this skill: ...`), written as a premise line.
