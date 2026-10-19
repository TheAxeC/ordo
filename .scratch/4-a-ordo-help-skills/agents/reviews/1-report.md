# Report: step 1, `/ordo-help skills` prints every skill's name and Quick start block

Everything in the brief and in repair round 1 is done. Nothing is NOT done, and no case showed a rule of the brief to be wrong.

## Open items of the state file

`.scratch/4-a-ordo-help-skills/orchestrator-state.md`, "Open items", verbatim:

- none

## The cases' first run, on the unchanged tree (HEAD 7e8082d, `git status --short` printed nothing)

Cases 1 to 11 are checked by reading the unchanged tree and the machine's install folders; cases 12 to 15 are runs.

1. Fifteen blocks in folder-name order. Read: `LC_ALL=C ls -1 skills/` printed code-comments, diagnose, grill, land, ordo-help, ordo-init, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, session-retro, spec, writing (15 folders, the order of the case). A loop over them counting the fence lines between `## Quick start` and the next `## ` printed `fences=2` for each of the 15. The `### skills` steps do not exist on the unchanged tree.
2. No `.agents/plan.yaml`. Read: the unchanged skill's "What it reads" item 1 reads it for every run and its Stops table refuses a missing key, so the unchanged text does not meet the case; the change makes the reading conditional.
3. No sequence, choices line or position. Read: the unchanged Steps print all three for every run, so the case is not met on the unchanged tree.
4. Pinned install. Run: `readlink ~/.claude/skills/ordo-help` and `readlink ~/.claude-backup/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`; `cd ~/.claude/skills/ordo-help && pwd -P` and the same for `~/.claude-backup/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`. The skills folder is its parent. `ls ~/.local/share/ordo-stable/skills/*/SKILL.md | wc -l` printed `15`.
5. `literature` skipped. Run: `ls -la ~/.local/share/ordo-stable/skills/literature/` showed only `templates`; `ls ~/.local/share/ordo-stable/skills/literature/SKILL.md` printed `No such file or directory`. `ls -d ~/.local/share/ordo-stable/skills/*/ | wc -l` printed `16`.
6. Skills CLI install. Run: `ls -d ~/.agents/skills/*/` printed `/Users/axelfaes/.agents/skills/find-skills/` only; it holds a `SKILL.md` and `grep -c '^## Quick start'` printed `0`, so it prints as `/find-skills` then `no Quick start block`. The Ordo skills are not in `~/.agents/skills` on this machine, so the case is the install the README describes, read against the rule.
7. Copy install. Run: `ls -d ~/.claude/skills/*/` printed the 15 skill folders and `synced`; `ls ~/.claude-backup/skills/synced/SKILL.md` printed `No such file or directory`, so `synced` is skipped.
8. A `SKILL.md` with no Quick start block. Read: `find-skills` of case 6 is one; the rule gives it the name line and `no Quick start block`.
9. `/ordo-help` with no argument. Read: the unchanged Steps 1 to 3 give the sequence, the choices line and the positions.
10. `/ordo-help 4.A`. Read: the unchanged "What it reads" item 2 resolves `<entry>` to a ledger folder; `skills` was not an argument.
11. References to steps. Run: `grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md` printed `40:5. For `/ordo-help` with no entry, the roadmap file `.agents/plan.yaml`'s `roadmap:` names, for the order Steps 3 prints the open plans in.` and `125:| Printing the sequence in other words | A reader matching what they typed against the sequence finds lines that are not there | Steps 1 |`. The glossary part: `grep -o 'ordo-help.*'` on `docs/glossary.md:42` and `plan-terms.md:37` printed `ordo-help`, Steps 3.` in both.
12. Description length. Run: `python3 -c 'import yaml; print(len(...["description"]))'` printed `564`.
13. Figures. Run: `python3 docs/figures/gen_figures.py; echo "exit=$?"` printed `wrote docs/figures/pipeline.svg (31539 bytes)`, `wrote docs/figures/plan-loop.svg (32184 bytes)`, `exit=0`. `git diff --stat -- docs/figures/` and `git status --short` printed nothing: the unchanged tree regenerates byte for byte.
14. Glossary sync. Run: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
15. Quick start block. Run: the awk of check 5 printed two invocation lines between the fences, `/ordo-help` and `/ordo-help <entry>`. The case wants three, so it is met only after the change.

Cases the brief's rules got wrong: none.

## DONE / NOT DONE

All DONE. Outputs are as printed from the worktree root after repair round 1.

| Item | Proof | Output |
|---|---|---|
| Character-set check, exit status | check 1 command over the seven changed files | `exit=0` (no other line) |
| Glossary sync check | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit=$?"` | `ok: the plan-terms block equals the template` then `exit=0` |
| Description length (case 12, check 2) | the python command of check 2 | `817` |
| Versions (check 3) | `grep -m1 'version:' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md` | `skills/repo-setup/SKILL.md:  version: "5.3.1"` and `skills/ordo-help/SKILL.md:  version: "3.2.0"` |
| Figures (case 13, check 4) | `python3 docs/figures/gen_figures.py; echo "exit=$?"; git diff --stat -- docs/figures/` | `wrote docs/figures/pipeline.svg (31975 bytes)`, `wrote docs/figures/plan-loop.svg (32184 bytes)`, `exit=0`, ` docs/figures/gen_figures.py \| 3 ++-`, ` docs/figures/pipeline.svg   \| 8 +++++---`, ` 2 files changed, 7 insertions(+), 4 deletions(-)`; `git diff --stat 7e8082d -- docs/figures/plan-loop.svg` printed nothing |
| Quick start block (case 15, check 5) | the awk of check 5 | the fence, `/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan`, `/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next`, `/ordo-help skills     print each skill's name and its Quick start block, in folder-name order`, the fence |
| Headings (check 6) | `grep -n '^## \|^### ' skills/ordo-help/SKILL.md` | `12:## Quick start`, `20:## Use instead`, `30:## What it reads`, `51:## Steps`, `53:### The sequence and the plans`, `76:### skills`, `92:## The sequence, printed verbatim`, `141:## Stops`, `149:## Anti-patterns`, `156:## Rules` (the title at line 8 is the `#` heading; the order is the layout's rows 1 to 9) |
| Old step references gone | `grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md; echo "grep-exit=$?"` | `grep-exit=1` |
| Files changed | `git status --short` | `M README.md`, `M docs/figures/gen_figures.py`, `M docs/figures/pipeline.svg`, `M docs/glossary.md`, `M skills/ordo-help/SKILL.md`, `M skills/repo-setup/SKILL.md`, `M skills/repo-setup/templates/plan-terms.md`, plus the two ledger files (`?? .scratch/4-a-ordo-help-skills/agents/briefs/1-round-1.md`, `?? .scratch/4-a-ordo-help-skills/agents/reviews/1-report.md`): the paths of "Paths this step writes" |
| No test new or changed (check 9) | `git status --short` above | no test file listed |

The plan's whole verify list is not run here; it runs at landing.

## The diff read against the Goal (check 7)

Goal: "`/ordo-help skills` prints, for every skill in the `skills/` folder that holds `ordo-help` itself, the skill's name and its Quick start block copied from its `SKILL.md` ... `skills` is read as this command before `<entry>` is matched against the roadmap."

- Every skill in the folder that holds `ordo-help`: `SKILL.md` lines 35 to 38 ("What it reads" 2 and 3: this skill's folder resolved with `cd <base directory> && pwd -P`, the skills folder its parent, the `SKILL.md` of each folder in it) and `### skills` items 1 to 3 (lines 80 to 90).
- The name: `### skills` item 3, line 86, "For a folder that holds a `SKILL.md`, print the line `/<name>`, `<name>` being the folder's name."
- The Quick start block copied from its `SKILL.md`: `### skills` item 3, line 87, "Under that line, print the lines of the code block under `## Quick start`, from its opening fence line to its closing fence line, both included, copied from the `SKILL.md` this step reads."
- `skills` read before `<entry>`: line 33, "An argument that is exactly `skills` is the `skills` mode, before `<entry>` is matched against the roadmap or a ledger folder."
- Order (ruling D1): `### skills` item 2, line 82, bytewise as `LC_ALL=C ls -1` sorts. Nothing else printed (ruling D2): the Rules bullet at line 159 and the title paragraph (line 10); "What it reads" items 4 to 8 are each scoped to the two other modes, and the "No stop" row says `/ordo-help skills` refuses nothing. Missing block (decision 3): line 88, "gets its name line and then the line `no Quick start block`".
- Run on this tree: a loop over `LC_ALL=C ls -1` in `skills/`, counting the fence lines under `## Quick start` of each folder's `SKILL.md`, printed `/code-comments fences=2 /diagnose fences=2 /grill fences=2 /land fences=2 /ordo-help fences=2 /ordo-init fences=2 /plan fences=2 /plan-orchestration fences=2 /plan-retro fences=2 /refute fences=2 /repo-setup fences=2 /roadmap fences=2 /session-retro fences=2 /spec fences=2 /writing fences=2`: 15 folders in the case 1 order, each with one block. The new ordo-help block holds 3 lines starting `/ordo-help`.

Every rule of the old text is kept. Read side by side with `git diff 7e8082d -- skills/ordo-help/SKILL.md`: the old description sentences, the title sentence, both old Quick start lines, the Use instead table, the five old "What it reads" items (now items 4 to 8, each with its sub-bullets and a leading scope phrase), the four old Steps with every sub-bullet and number, the sequence block, the two old Stops rows, the old Anti-patterns row and the Rules bullet all stand (`git diff 7e8082d --numstat` for the file: `40 10`).

## Rule 14: greps and rereads (check 8)

Greps outside `.scratch/archive/` and `.scratch/4-a-ordo-help-skills/`:

- `grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md` printed nothing.
- `skills/ordo-help/SKILL.md:48`: `... for the order "Steps / The sequence and the plans" 3 prints the open plans in.` Holds: item 3 of that subsection prints the positions and the order of open plans.
- `skills/ordo-help/SKILL.md:153`: `... | "Steps / The sequence and the plans" 1 |`. Holds: item 1 prints the sequence.
- `skills/ordo-help/SKILL.md:154`: `... | "Steps / skills" 3 |`. Holds: item 3 copies the block.
- `skills/repo-setup/templates/plan-terms.md:37` and `docs/glossary.md:42` end `ordo-help`, "Steps / The sequence and the plans" 3.` Holds: `grep -n -i 'dispatch' skills/ordo-help/SKILL.md` printed lines 65, 66 and 70 among its hits, the dispatch block and the `landing: preparing` entry text, all in item 3 of that subsection.
- Other `ordo-help` hits in the glossary (`docs/glossary.md:65, 81, 114, 121, 122`) cite "The sequence, printed verbatim" or the skill by name; that section and its name are unchanged.
- Versions: only `skills/ordo-help/SKILL.md:5` and `skills/repo-setup/SKILL.md:5` carry the new strings. Figure body: `docs/figures/gen_figures.py:539-540` and the regenerated `docs/figures/pipeline.svg`; no other file quotes the old body.
- `README.md:29` ("shortened from what `/ordo-help` prints"), `README.md:57` ("`/ordo-help` prints the full sequence") and `README.md:61` (the figure's alt text, naming `/ordo-help` beside the pipeline) still hold; the alt text says nothing about what `/ordo-help` prints.
- Rereads of sentences about a changed file as a whole:
  - Title paragraph (`SKILL.md` line 10): two sentences, covers the three modes.
  - "No stop" row (line 145): says the refusal rows belong to `/ordo-help` and `/ordo-help <entry>` and `/ordo-help skills` refuses nothing; the other two rows are unchanged.
  - Rules (lines 158 and 159): "The skill writes nothing." holds, the `skills` steps only read and print; the new bullet states the print rule of the `skills` mode.
  - `gen_figures.py` head comment (lines 1 to 39): says `/ordo-help` stands beside the other cards and that labels come from the sequence `/ordo-help` prints; both hold, and the script exited 0 with no `error:` line.

## The terms

- mode (not a glossary term; `docs/dev/skill-layout.md` uses it for an invocation): `grep -n -i 'mode\|invocation' skills/ordo-help/SKILL.md` printed lines 3 (the description's "what modes does a skill have" trigger), 33, 121 and 128 (the sequence block's "model" in "served a model other than"), 154 and 159. No line uses "invocation".
- runner (glossary: Claude Code with its tools): "the folder the runner states when the skill loads" (line 36). Holds.
- refusal, stop (glossary): "refuses nothing" and "never stops" in the "No stop" row. Holds: a refusal is a skill's end naming its cause, a stop a halt for a user decision.
- dispatch entry (changed "Stated in"): lines 65, 66 and 70 of "Steps / The sequence and the plans" item 3 use the entry as the term defines it.
- sequence, the (glossary: "Stated in: `ordo-help`, "The sequence, printed verbatim""): the section is unchanged; the anti-pattern row uses "the sequence" in that sense.
- step (glossary: "an item of a skill's Steps, cited as "Steps <n>""): the new citations use the subsection form, as `spec` does.

## Files with line counts

`wc -l` after repair round 1: `skills/ordo-help/SKILL.md` 159, `skills/repo-setup/SKILL.md` 245, `skills/repo-setup/templates/plan-terms.md` 134, `docs/glossary.md` 154, `README.md` 195, `docs/figures/gen_figures.py` 759, `docs/figures/pipeline.svg` 176. `git diff 7e8082d --numstat` (added, removed): `README.md` 1 1, `docs/figures/gen_figures.py` 2 1, `docs/figures/pipeline.svg` 5 3, `docs/glossary.md` 1 1, `skills/ordo-help/SKILL.md` 40 10, `skills/repo-setup/SKILL.md` 1 1, `skills/repo-setup/templates/plan-terms.md` 1 1.

## Judgment calls the brief left open

- "What it reads": the argument is item 1; the skills folder (item 2, in two moves) and the `SKILL.md` files (item 3) are two items, one input each; the five old items follow as items 4 to 8, each given a leading scope phrase, so the `skills` mode reads none of them.
- The "No stop" row carries the sentence that `/ordo-help skills` refuses nothing, so the two refusal rows keep their text.
- The Anti-patterns row says "from an earlier output" where the brief says "from an earlier run", and `### skills` item 3 says "copied from the `SKILL.md` this step reads" where the brief says "the file read in this run", because the Conventions make "mode" the one word for an invocation and "run" would name one.
- `### skills` item 3 holds the name line and the block as two bullets, with the skip, missing-block and blank-line rules as further bullets, one rule each.
- Figure body: `"Prints the sequence and, for a named plan, where it stands and the next command. " "/ordo-help skills prints every skill's Quick start."`, split over two literals. It ties the Quick start printing to the `skills` argument and leaves the sequence part tied to the other modes.
- README row: the second sentence reads "For `skills` it prints the name and the Quick start block of every skill instead".
- The old item 1 of the sequence subsection ("Print the sequence in ...") has no completion line and is kept as it was, since the rewrite keeps every rule and adds none.

## Sentences over the standards' length, and why

Lines of `SKILL.md` over 30 words, other than the description, the sequence block and old lines: line 10 (57 words, the title paragraph: two sentences, the first is the old sentence kept whole), line 36 (34 words, one action with the command that resolves the folder), line 87 (34 words, one action with its fence boundary), line 145 (the "No stop" row, 38 words, the When cell holding the scope of the refusal rows, and it keeps its old semicolon), line 154 (40 words, the anti-pattern name cell, which lists the three ways to print the block wrongly). Each states one rule and cannot be shorter without dropping a qualifier the brief gives.

## Every host- or user-visible change with its before and after

Before is read from `git show 7e8082d:<path>`, after from the tree.

1. Typing `/ordo-help skills`.
   - Before (`skills/ordo-help/SKILL.md`, "What it reads" 2 and Stops, base lines 33 to 35 and 119): `skills` was an `<entry>`, resolved to a folder "whose `plan.md` opens with `# Plan: <entry>`"; no such plan exists (`grep -c 'Plan: skills' docs/roadmap.md` printed `0`), so the row `| No ledger folder | ... | A refusal that names `/plan` | ...` applied.
   - After (lines 33 to 38, 76 to 90): the name line `/<name>` and the Quick start block of each of the 15 skills, in folder-name order, with nothing else.
2. The trigger phrases (`skills/ordo-help/SKILL.md:3`).
   - Before: `Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work, which choices await my review.`
   - After: the same phrases then `ordo-help skills, which skills are there, list every skill and its modes, what modes does a skill have.`, and the description gains the sentence `With the argument skills, print instead the name and the Quick start block of every skill in the folder that holds this skill, in folder-name order.` (564 to 817 characters).
3. The README row (`README.md:23`).
   - Before: `| `ordo-help` | Prints the command sequence and the position of each open plan, and for a named plan its position and the command that comes next |`
   - After: the same text followed by `. For `skills` it prints the name and the Quick start block of every skill instead`.
4. The pipeline figure's `/ordo-help` box (`docs/figures/gen_figures.py:539-540`, `docs/figures/pipeline.svg`).
   - Before: one literal, `"Prints the sequence and, for a named plan, where it stands and the next command."`, drawn as three body lines (y=732 `Prints the sequence and, for a`, y=747 `named plan, where it stands`, y=762 `and the next command.`), the `optional` mark at y=771 and `No stop.` at y=809.
   - After: two literals, drawn as five body lines (the same three, then y=777 `/ordo-help skills prints every`, y=792 `skill's Quick start.`), the `optional` mark at y=801 and `No stop.` at y=839, 30 px lower, inside the 210 px box that starts at y=688 (`pipeline.svg` 31539 to 31975 bytes; `plan-loop.svg` unchanged at 32184 bytes).
5. The Steps of `skills/ordo-help/SKILL.md`.
   - Before: one numbered list of four items under `## Steps`.
   - After: the same four items, with their numbers and sub-bullets, under `### The sequence and the plans` (line 53), preceded by `` `/ordo-help` and `/ordo-help <entry>` run these steps. ``, and a new `### skills` (line 76).
6. The three references to the old steps.
   - `skills/ordo-help/SKILL.md` base line 40, now line 48: `Steps 3` becomes `"Steps / The sequence and the plans" 3`.
   - `skills/ordo-help/SKILL.md` base line 125, now line 153: `Steps 1` becomes `"Steps / The sequence and the plans" 1`.
   - `skills/repo-setup/templates/plan-terms.md:37` and `docs/glossary.md:42`: `` `ordo-help`, Steps 3. `` becomes `` `ordo-help`, "Steps / The sequence and the plans" 3. ``
7. The Quick start block (`skills/ordo-help/SKILL.md:14-18`): before two invocation lines, after three, the third `/ordo-help skills     print each skill's name and its Quick start block, in folder-name order`.
8. The Stops "No stop" row (line 145).
   - Before: `The skill never stops for a decision; the rows below are refusals, which name their cause and leave nothing`.
   - After: `The skill never stops for a decision; the rows below are refusals of `/ordo-help` and `/ordo-help <entry>`, which name their cause and leave nothing, and `/ordo-help skills` refuses nothing`.
9. The Anti-patterns and Rules of `skills/ordo-help/SKILL.md`.
   - Before: one Anti-patterns row, with `Steps 1` in its Do instead cell, and the one Rules bullet.
   - After: that row with `"Steps / The sequence and the plans" 1`, a second row (line 154), and a second Rules bullet (line 159).
10. The versions.
   - `skills/ordo-help/SKILL.md`: `3.1.0` becomes `3.2.0`.
   - `skills/repo-setup/SKILL.md`: `5.3.0` becomes `5.3.1`.

## Repair round 1

Finding 1, Standards 1: the skills folder's location could be read two ways.
- Change: `skills/ordo-help/SKILL.md:35-37`, "What it reads" 2, now reads `2. For `/ordo-help skills`, the skills folder, found in two moves.`, then `- First, this skill's folder is resolved to its real path, through any link, by `cd <base directory> && pwd -P`, the base directory being the folder the runner states when the skill loads.`, then `- Then the skills folder is the parent of that resolved path, never the parent of the base directory as stated.` `skills/ordo-help/SKILL.md:80-81`, "Steps / skills" 1, now reads `1. Find the skills folder as "What it reads" 2 says, resolving this skill's folder before taking its parent.` with the completion line `- The step is done when the parent of the resolved path is known as the skills folder.`
- Check: `grep -n 'pwd -P\|parent' skills/ordo-help/SKILL.md` printed lines 36, 37, 80 and 81 as the only places that name the parent, and each takes it of the resolved path. Case 4 on the machine: `cd ~/.claude/skills/ordo-help && pwd -P` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`, whose parent is the folder of 15 skills and `literature`.

Finding 2, Standards 2: "nothing else" was stated only in the title paragraph, and Steps 1 and 2 read as printing.
- Change: `skills/ordo-help/SKILL.md:159`, in Rules, where "Where a rule goes" puts a rule that holds throughout the mode: `- The `skills` mode prints only the name lines, the Quick start blocks, the `no Quick start block` lines and the blank lines between skills.` `skills/ordo-help/SKILL.md:82-83`, "Steps / skills" 2, now reads `2. Sort the names of the folders in the skills folder bytewise, as `LC_ALL=C ls -1` sorts them, so `plan` comes before `plan-orchestration` and `plan-retro`.` with the completion line `- The step is done when the sorted names are known.` Item 1 (line 80) says "Find", and item 3 (line 84) says "in the sorted order". The title paragraph keeps "and nothing else" (line 10).
- Check: `sed -n 76,90p skills/ordo-help/SKILL.md` shows `print` only in item 3; `grep -n 'prints only' skills/ordo-help/SKILL.md` printed line 159.

Finding 3, Standards 3: the figure named the argument as a bare word.
- Change: `docs/figures/gen_figures.py:539-540` now reads `"Prints the sequence and, for a named plan, where it stands and the next command. "` and `"/ordo-help skills prints every skill's Quick start.",`. `docs/figures/pipeline.svg` is regenerated by `python3 docs/figures/gen_figures.py`.
- Check: the script printed `wrote docs/figures/pipeline.svg (31975 bytes)`, `wrote docs/figures/plan-loop.svg (32184 bytes)`, `exit=0`, no `error:` line; the box lines are `/ordo-help skills prints every` and `skill's Quick start.`; `git diff --stat 7e8082d -- docs/figures/plan-loop.svg` printed nothing.

Finding 4, Behaviour 1: the report had no before-and-after section.
- Change: this report, the section "Every host- or user-visible change with its before and after" above, ten items, each before read from `git show 7e8082d:<path>` and each after from the tree.
- Check: the section lists the `/ordo-help skills` input, the trigger phrases, the README row, the figure box with its moved positions (y=771 to 801, y=809 to 839), the subsection heading, the three references and the two versions; the figure y values come from a read of both SVG files with a regular expression over the `x="543"` text elements.

## Anything in the brief that was wrong or impossible

Nothing.
