# Report: step 1, `/ordo-help skills` prints every skill's name and Quick start block

Everything in the brief is done. Nothing is NOT done, and no case showed a rule of the brief to be wrong, so there was no hand-back.

## Open items of the state file

`.scratch/4-a-ordo-help-skills/orchestrator-state.md`, "Open items", verbatim:

- none

## The cases' first run, on the unchanged tree (HEAD 7e8082d, `git status --short` printed nothing)

Cases 1 to 11 are checked by reading the unchanged tree and the machine's install folders; cases 12 to 15 are runs.

1. Fifteen blocks in folder-name order. Read: `LC_ALL=C ls -1 skills/` printed code-comments, diagnose, grill, land, ordo-help, ordo-init, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, session-retro, spec, writing (15 folders, the order of the case). Each has one Quick start block: a loop over `LC_ALL=C ls -1`, counting the fence lines between `## Quick start` and the next `## `, printed `fences=2` for each of the 15. The `### skills` steps the case is read through do not exist yet on the unchanged tree.
2. No `.agents/plan.yaml`. Read: the unchanged skill's "What it reads" item 1 reads it for every run and its Stops table refuses a missing key, so the unchanged text does not meet the case. The change makes the reading conditional.
3. No sequence, choices line or position. Read: the unchanged Steps print all three for every run, so the case is not met on the unchanged tree.
4. Pinned install. Run: `readlink ~/.claude/skills/ordo-help` and `readlink ~/.claude-backup/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`; `cd ~/.claude/skills/ordo-help && pwd -P` and the same for `~/.claude-backup/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`. The skills folder is its parent. `ls ~/.local/share/ordo-stable/skills/*/SKILL.md | wc -l` printed `15`.
5. `literature` skipped. Run: `ls -la ~/.local/share/ordo-stable/skills/literature/` showed only `templates`; `ls ~/.local/share/ordo-stable/skills/literature/SKILL.md` printed `No such file or directory`. `ls -d ~/.local/share/ordo-stable/skills/*/ | wc -l` printed `16`.
6. Skills CLI install. Run: `ls -d ~/.agents/skills/*/` printed `/Users/axelfaes/.agents/skills/find-skills/` only; it holds a `SKILL.md` and `grep -c '^## Quick start'` printed `0`, so it would print as `/find-skills` then `no Quick start block`. The Ordo skills are not in `~/.agents/skills` on this machine, so the case is the install the README describes, read against the rule.
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

All DONE. The outputs are as printed from the worktree root after the change.

| Item | Proof | Output |
|---|---|---|
| Character-set check, exit status | check 1 command | `exit=0` (no other line) |
| Glossary sync check | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit=$?"` | `ok: the plan-terms block equals the template` then `exit=0` |
| Description length (case 12) | check 2 command | `817` |
| Versions (check 3) | `grep -m1 'version:' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md` | `skills/ordo-help/SKILL.md:  version: "3.2.0"` and `skills/repo-setup/SKILL.md:  version: "5.3.1"` |
| Figures (case 13, check 4) | `python3 docs/figures/gen_figures.py; echo "exit=$?"; git diff --stat -- docs/figures/` | `wrote docs/figures/pipeline.svg (31973 bytes)`, `wrote docs/figures/plan-loop.svg (32184 bytes)`, `exit=0`, then ` docs/figures/gen_figures.py \|  3 ++-`, ` docs/figures/pipeline.svg   \| 10 ++++++----`, ` 2 files changed, 8 insertions(+), 5 deletions(-)`. `plan-loop.svg` is not in `git status --short`, so it is unchanged. |
| Quick start block (case 15, check 5) | the awk of check 5 | the fence, `/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan`, `/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next`, `/ordo-help skills     print each skill's name and its Quick start block, in folder-name order`, the fence |
| Headings (check 6) | `grep -n '^## \|^### ' skills/ordo-help/SKILL.md` | `12:## Quick start`, `20:## Use instead`, `30:## What it reads`, `49:## Steps`, `51:### The sequence and the plans`, `74:### skills`, `90:## The sequence, printed verbatim`, `139:## Stops`, `147:## Anti-patterns`, `154:## Rules` (the title at line 8 is the `#` heading; the order is the layout's rows 1 to 9) |
| Files changed | `git status --short` | `M README.md`, `M docs/figures/gen_figures.py`, `M docs/figures/pipeline.svg`, `M docs/glossary.md`, `M skills/ordo-help/SKILL.md`, `M skills/repo-setup/SKILL.md`, `M skills/repo-setup/templates/plan-terms.md`: the paths of "Paths this step writes" |
| No test new or changed (check 9) | `git status --short` above | no test file listed |

The plan's whole verify list is not run here; it runs at landing.

## The diff read against the Goal (check 7)

Goal: "`/ordo-help skills` prints, for every skill in the `skills/` folder that holds `ordo-help` itself, the skill's name and its Quick start block copied from its `SKILL.md` ... `skills` is read as this command before `<entry>` is matched against the roadmap."

- Every skill in the folder that holds `ordo-help`: `SKILL.md` lines 35 and 36 (the skills folder as the parent of this skill's folder, real path through `pwd -P`; the `SKILL.md` of each folder in it) and `### skills` items 1 to 3 (lines 78 to 88).
- The name: `### skills` item 3, "For a folder that holds a `SKILL.md`, print the line `/<name>`, `<name>` being the folder's name."
- The Quick start block copied from its `SKILL.md`: `### skills` item 3, "Under that line, print the lines of the code block under `## Quick start`, from its opening fence line to its closing fence line, both included, copied from the `SKILL.md` this step reads."
- `skills` read before `<entry>`: `SKILL.md` line 33, "An argument that is exactly `skills` is the `skills` mode, before `<entry>` is matched against the roadmap or a ledger folder."
- Order (ruling D1): `### skills` item 2, bytewise as `LC_ALL=C ls -1` sorts. Nothing else printed (ruling D2): the title paragraph (line 10) ends "and nothing else"; items 4 to 8 of "What it reads" are each scoped to the two other modes, and the "No stop" row says `/ordo-help skills` refuses nothing. Missing block (decision 3): item 3, "gets its name line and then the line `no Quick start block`".
- Run on this tree: a loop over `LC_ALL=C ls -1` in `skills/`, counting the fence lines under `## Quick start` of each folder's `SKILL.md`, printed `/code-comments fences=2 /diagnose fences=2 /grill fences=2 /land fences=2 /ordo-help fences=2 /ordo-init fences=2 /plan fences=2 /plan-orchestration fences=2 /plan-retro fences=2 /refute fences=2 /repo-setup fences=2 /roadmap fences=2 /session-retro fences=2 /spec fences=2 /writing fences=2`: 15 folders in the case 1 order, each with one block. The new ordo-help block holds 3 lines starting `/ordo-help` (`grep -c '^/ordo-help'` over the awk of check 5 printed `3`).

Every rule of the old text is kept. Read side by side with `git diff skills/ordo-help/SKILL.md`: the description's old sentences, the title sentence, both old Quick start lines, the Use instead table, the five old "What it reads" items (now items 4 to 8, each with its sub-bullets, with a leading scope phrase), the four old Steps with every sub-bullet and number, the sequence block, the two old Stops rows, the old Anti-patterns row and the Rules bullet all stand; the only deleted lines are replaced by lines that contain the old text (`git diff --numstat` for the file: `37 10`).

## Rule 14: greps and rereads (check 8)

Greps outside `.scratch/archive/` and `.scratch/4-a-ordo-help-skills/`:

- `grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md` printed nothing: both old references are rewritten.
- `skills/ordo-help/SKILL.md:46`: `... for the order "Steps / The sequence and the plans" 3 prints the open plans in.` Holds: item 3 of that subsection prints the positions and the order of open plans.
- `skills/ordo-help/SKILL.md:151`: `... | "Steps / The sequence and the plans" 1 |`. Holds: item 1 prints the sequence.
- `skills/ordo-help/SKILL.md:152`: `... | "Steps / skills" 3 |`. Holds: item 3 copies the block.
- `skills/repo-setup/templates/plan-terms.md:37` and `docs/glossary.md:42` end `ordo-help`, "Steps / The sequence and the plans" 3.` Holds: `grep -n -i 'dispatch' skills/ordo-help/SKILL.md` printed lines 63, 64 and 68 among its hits, the dispatch block and the `landing: preparing` entry text, all in item 3 of that subsection.
- Other `ordo-help` hits in the glossary (`docs/glossary.md:65, 81, 114, 121, 122`) cite "The sequence, printed verbatim" or the skill by name; that section and its name are unchanged. `grep -rIn 'ordo-help`, "What it reads"'` printed nothing.
- Versions: `grep -rIn '3\.1\.0\|3\.2\.0\|5\.3\.0\|5\.3\.1'` printed only the two version lines. Figure body: `docs/figures/gen_figures.py:539-540` and `docs/figures/pipeline.svg:145` (the regenerated text); no other file quotes the old body.
- `README.md:29` ("shortened from what `/ordo-help` prints"), `README.md:57` ("`/ordo-help` prints the full sequence") and `README.md:61` (the figure's alt text, which names `/ordo-help` beside the pipeline) still hold; the alt text is outside this step's paths and says nothing about what `/ordo-help` prints.
- Rereads of sentences about a changed file as a whole:
  - Title paragraph (`SKILL.md` line 10): two sentences, covers the three modes.
  - "No stop" row (line 143): says the refusal rows belong to `/ordo-help` and `/ordo-help <entry>` and `/ordo-help skills` refuses nothing; the other two rows are unchanged.
  - Rules bullet (line 156): "The skill writes nothing." and the `skills` mode writes nothing (items 1 to 3 only read and print).
  - `gen_figures.py` head comment (lines 1 to 39): says `/ordo-help` stands beside the other cards and that labels come from the sequence `/ordo-help` prints; both hold, and the script's own `error:` checks passed (exit 0).

## The terms

- mode (not a glossary term; `docs/dev/skill-layout.md` uses it for an invocation): used in the `skills` mode (lines 33 and 152). `grep -n -i 'mode\|invocation' skills/ordo-help/SKILL.md` printed lines 3, 33, 119, 126 and 152 (line 3 is the description's "what modes does a skill have" trigger; 119 and 126 are the sequence block's "model" in "served a model other than"). No line uses "invocation".
- runner (glossary: Claude Code with its tools): "the base directory the runner states when the skill loads" (line 35). Holds.
- refusal, stop (glossary): "refuses nothing", "never stops" in the "No stop" row. Holds: both are a skill's end naming its cause and a halt for a user decision.
- dispatch entry (changed "Stated in"): `grep -n -i 'dispatch' skills/ordo-help/SKILL.md` printed lines 63, 64 and 68 in "Steps / The sequence and the plans" item 3 (the dispatch block, then the dispatch entry reading `landing: preparing` twice), which use the entry as the term defines it.
- sequence, the (glossary: "Stated in: `ordo-help`, "The sequence, printed verbatim""): the section is unchanged; the anti-pattern row uses "the sequence" in that sense.
- step (glossary: "an item of a skill's Steps, cited as "Steps <n>""): the new citations use the subsection form, as `spec` does.

## Files with line counts

`wc -l` after the change: `skills/ordo-help/SKILL.md` 156, `skills/repo-setup/SKILL.md` 245, `skills/repo-setup/templates/plan-terms.md` 134, `docs/glossary.md` 154, `README.md` 195, `docs/figures/gen_figures.py` 759, `docs/figures/pipeline.svg` 176. `git diff --numstat` (added, removed): `README.md` 1 1, `docs/figures/gen_figures.py` 2 1, `docs/figures/pipeline.svg` 6 4, `docs/glossary.md` 1 1, `skills/ordo-help/SKILL.md` 37 10, `skills/repo-setup/SKILL.md` 1 1, `skills/repo-setup/templates/plan-terms.md` 1 1.

## Judgment calls the brief left open

- "What it reads": the argument is item 1; the skills folder (item 2) and the `SKILL.md` files (item 3) are two items, one input each; the five old items follow as items 4 to 8, each given a leading scope phrase ("For `/ordo-help` and `/ordo-help <entry>`," or its old scope), so the `skills` mode reads none of them.
- "No stop" row carries the sentence that `/ordo-help skills` refuses nothing, so the two refusal rows keep their text.
- Anti-patterns row says "from an earlier output" where the brief says "from an earlier run", because the Conventions make "mode" the one word for an invocation and "run" would name one.
- `### skills` item 3 says "copied from the `SKILL.md` this step reads" where the brief's bullet says "the file read in this run", for the same reason.
- `### skills` item 3 holds the name line and the block as two bullets, and the skip, missing-block and blank-line rules as further bullets, one rule each; items 1 and 2 end on a completion criterion line.
- Figure body: `"Prints the sequence and, for a named plan, where it stands and the next command. " "With skills, it prints every skill's Quick start."`, split over two literals. It states that the `skills` mode prints the Quick start blocks, and the sequence part stays tied to the other modes. The box grew by two text lines; the script exited 0.
- README row: the second sentence reads "For `skills` it prints the name and the Quick start block of every skill instead".
- The old item 1 of the sequence subsection ("Print the sequence in ...") has no completion criterion line, and it is kept as it was, since the rewrite keeps every rule and adds none.

## Sentences over the standards' length, and why

`SKILL.md` word counts per line, lines over 30 words other than the description (line 3, a trigger list), the sequence block and old lines: line 10 (57 words, the title paragraph: two sentences, the first is the old sentence kept whole), line 35 (39 words, one rule with its link-following command), line 85 (the block-copy bullet, 34 words, one action with its fence boundary), line 143 (the "No stop" When cell, 29 words in the cell, which keeps its old semicolon and holds the scope of the refusal rows), line 152 (40 words, the anti-pattern name cell, which lists the three ways to print the block wrongly). Each states one rule and cannot be shorter without dropping a qualifier the brief gives. No semicolon was added to running prose beyond the "No stop" cell, which keeps the old semicolon.

## Anything in the brief that was wrong or impossible

Nothing.
