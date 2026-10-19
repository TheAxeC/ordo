# Step 1 refuter report (on .agents/worktrees/4-a-ordo-help-skills-1, base 7e8082d)

## Verification (rerun by the reviewer)

Check 4 of the brief runs `python3 docs/figures/gen_figures.py` in place, and that run rewrites `docs/figures/*.svg`. Because this review changes nothing, I ran the script from a copy in the scratchpad. The script writes beside its own file (`HERE = Path(__file__).resolve().parent`, docs/figures/gen_figures.py:46). I then compared its output byte for byte with the worktree's figures.

```
$ (check 1) printf '%s\0' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md README.md docs/figures/gen_figures.py docs/figures/pipeline.svg | xargs -0 perl -CSD -ne '...as in the brief...'; echo "exit=$?"
exit=0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit=$?"
ok: the plan-terms block equals the template
exit=0
$ (check 2) python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/ordo-help/SKILL.md").read().split("---")[1])["description"]))'
817
$ (check 3) grep -m1 'version:' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md
skills/ordo-help/SKILL.md:  version: "3.2.0"
skills/repo-setup/SKILL.md:  version: "5.3.1"
$ (check 4) cp docs/figures/gen_figures.py <scratch>/fig/ && cd <scratch>/fig && python3 -I gen_figures.py; echo "exit=$?"
wrote scratchpad/fig/pipeline.svg (31973 bytes)
wrote scratchpad/fig/plan-loop.svg (32184 bytes)
exit=0
$ cmp <scratch>/fig/pipeline.svg docs/figures/pipeline.svg && echo pipeline-identical
pipeline-identical
$ cmp <scratch>/fig/plan-loop.svg docs/figures/plan-loop.svg && echo plan-loop-identical
plan-loop-identical
$ git show 7e8082d:docs/figures/plan-loop.svg | cmp - docs/figures/plan-loop.svg && echo plan-loop-equals-base
plan-loop-equals-base
$ git diff 7e8082d --stat -- docs/figures/
 docs/figures/gen_figures.py |  3 ++-
 docs/figures/pipeline.svg   | 10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)
$ awk 'length>103{print FILENAME":"NR": "length}' docs/figures/gen_figures.py
(nothing)
$ (check 5) awk '/^## Quick start/{q=1;next} q&&/^## /{q=0} q' skills/ordo-help/SKILL.md

```
/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan
/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next
/ordo-help skills     print each skill's name and its Quick start block, in folder-name order
```

$ sed -n 15,17p skills/ordo-help/SKILL.md | awk '{print index($0,"print")}'
23
23
23
$ (check 6) grep -n '^## \|^### ' skills/ordo-help/SKILL.md
12:## Quick start
20:## Use instead
30:## What it reads
49:## Steps
51:### The sequence and the plans
74:### skills
90:## The sequence, printed verbatim
139:## Stops
147:## Anti-patterns
154:## Rules
$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/glossary.md
 M skills/ordo-help/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/4-a-ordo-help-skills/agents/reviews/1-report.md
$ git diff 7e8082d --numstat
1<tab>1<tab>README.md
2<tab>1<tab>docs/figures/gen_figures.py
6<tab>4<tab>docs/figures/pipeline.svg
1<tab>1<tab>docs/glossary.md
37<tab>10<tab>skills/ordo-help/SKILL.md
1<tab>1<tab>skills/repo-setup/SKILL.md
1<tab>1<tab>skills/repo-setup/templates/plan-terms.md
$ LC_ALL=C grep -n '[^ -~]' skills/ordo-help/SKILL.md README.md docs/figures/gen_figures.py skills/repo-setup/SKILL.md; echo "nonascii-exit=$?"
nonascii-exit=1

Commands the builder's report quotes, rerun:
$ LC_ALL=C ls -1 skills/
code-comments diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec writing
$ for d in $(LC_ALL=C ls -1 skills/); do <count of fence lines between ## Quick start and the next ## heading>; done
/code-comments fences=2 /diagnose fences=2 /grill fences=2 /land fences=2 /ordo-help fences=2 /ordo-init fences=2 /plan fences=2 /plan-orchestration fences=2 /plan-retro fences=2 /refute fences=2 /repo-setup fences=2 /roadmap fences=2 /session-retro fences=2 /spec fences=2 /writing fences=2
$ ls skills/*/SKILL.md | wc -l
      15
$ (name: equals folder name, each of the 15)
(no mismatch)
$ readlink ~/.claude/skills/ordo-help; readlink ~/.claude-backup/skills/ordo-help
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
$ (cd ~/.claude/skills/ordo-help && pwd -P); (cd ~/.claude-backup/skills/ordo-help && pwd -P)
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
$ ls ~/.local/share/ordo-stable/skills/*/SKILL.md | wc -l
      15
$ ls -la ~/.local/share/ordo-stable/skills/literature/
total 0
drwxr-xr-x@  3 axelfaes  staff   96 Oct 18 14:46 .
drwxr-xr-x@ 18 axelfaes  staff  576 Oct 18 10:17 ..
drwxr-xr-x@  3 axelfaes  staff   96 Oct 18 14:46 templates
$ ls ~/.local/share/ordo-stable/skills/literature/SKILL.md
ls: /Users/axelfaes/.local/share/ordo-stable/skills/literature/SKILL.md: No such file or directory
$ ls -d ~/.local/share/ordo-stable/skills/*/ | wc -l
      16
$ ls -d ~/.agents/skills/*/
/Users/axelfaes/.agents/skills/find-skills/
$ grep -c '^## Quick start' ~/.agents/skills/find-skills/SKILL.md
0
$ ls -d ~/.claude/skills/*/
(the 15 skill folders and /Users/axelfaes/.claude/skills/synced/)
$ ls ~/.claude-backup/skills/synced/SKILL.md
ls: /Users/axelfaes/.claude-backup/skills/synced/SKILL.md: No such file or directory
$ grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md; echo "grep-exit=$?"
grep-exit=1
$ awk <check 5> skills/ordo-help/SKILL.md | grep -c '^/ordo-help'
3
$ grep -n -i 'mode\|invocation' skills/ordo-help/SKILL.md   (cut to 60 columns)
3:description: "Print the command sequence for running a pla
33:   - An argument that is exactly `skills` is the `skills`
119:/spec stops                   a premise of the step is w
126:/refute stops                 the reviewer was served a
152:| Printing a skill's Quick start block from memory, from
$ grep -n -i 'dispatch' skills/ordo-help/SKILL.md   (cut to 60 columns)
63:     - From the state file: the position line, the open i
64:     - A step whose dispatch entry reads `landing: prepar
68:   - For a step whose dispatch entry reads `landing: prep
107:"build it"                    the session writes itself
125:/spec refuses                 the step's line lacks your
128:/land refuses                 it names what is missing,
$ grep -rIn '3\.1\.0\|3\.2\.0\|5\.3\.0\|5\.3\.1' skills docs utils README.md
skills/ordo-help/SKILL.md:5:  version: "3.2.0"
skills/repo-setup/SKILL.md:5:  version: "5.3.1"
$ grep -rIno 'ordo-help`, [^;.]*' skills docs utils README.md   (docs/roadmap.md left out)
skills/ordo-init/SKILL.md:10:ordo-help`, `plan-orchestration`) need in a repository, `
skills/repo-setup/templates/plan-terms.md:37:ordo-help`, "Steps / The sequence and the plans" 3
skills/repo-setup/templates/plan-terms.md:60:ordo-help`, "The sequence, printed verbatim"
skills/repo-setup/templates/plan-terms.md:76:ordo-help`, `plan-orchestration`), installed once per user and never per project
skills/repo-setup/templates/plan-terms.md:109:ordo-help`, "The sequence, printed verbatim"
skills/repo-setup/templates/plan-terms.md:116:ordo-help`, "The sequence, printed verbatim"
skills/repo-setup/templates/plan-terms.md:117:ordo-help`, "The sequence, printed verbatim"
docs/glossary.md:42:ordo-help`, "Steps / The sequence and the plans" 3
docs/glossary.md:65:ordo-help`, "The sequence, printed verbatim"
docs/glossary.md:81:ordo-help`, `plan-orchestration`), installed once per user and never per project
docs/glossary.md:114:ordo-help`, "The sequence, printed verbatim"
docs/glossary.md:121:ordo-help`, "The sequence, printed verbatim"
docs/glossary.md:122:ordo-help`, "The sequence, printed verbatim"
$ wc -l skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md README.md docs/figures/gen_figures.py docs/figures/pipeline.svg
     156 skills/ordo-help/SKILL.md
     245 skills/repo-setup/SKILL.md
     134 skills/repo-setup/templates/plan-terms.md
     154 docs/glossary.md
     195 README.md
     759 docs/figures/gen_figures.py
     176 docs/figures/pipeline.svg
$ for n in 10 35 85 143 152; do sed -n ${n}p skills/ordo-help/SKILL.md | wc -w; done
10: 57   35: 39   85: 34   143: 38 (whole row; the When cell counted by hand: 29)   152: 40

First runs on the unchanged tree, rerun from the base files through git show:
$ git show 7e8082d:skills/ordo-help/SKILL.md > <scratch>/base/SKILL.md; grep -n 'Steps [0-9]' <scratch>/base/SKILL.md
40:5. For `/ordo-help` with no entry, the roadmap file `.agents/plan.yaml`'s `roadmap:` names, for the order Steps 3 prints the open plans in.
125:| Printing the sequence in other words | A reader matching what they typed against the sequence finds lines that are not there | Steps 1 |
$ git show 7e8082d:docs/glossary.md | sed -n 42p | grep -o 'ordo-help.*'; git show 7e8082d:skills/repo-setup/templates/plan-terms.md | sed -n 37p | grep -o 'ordo-help.*'
ordo-help`, Steps 3.
ordo-help`, Steps 3.
$ (case 12 on the base file) python3 -c '...description length...' <scratch>/base/SKILL.md
564
$ (case 15 on the base file) awk <check 5> <scratch>/base/SKILL.md
(the fence, the two lines /ordo-help and /ordo-help <entry>, the fence)
$ (case 13 on the base) git show 7e8082d:docs/figures/gen_figures.py > <scratch>/base/fig/gen_figures.py; cd <scratch>/base/fig && python3 -I gen_figures.py; echo "exit=$?"
wrote base/fig/pipeline.svg (31539 bytes)
wrote base/fig/plan-loop.svg (32184 bytes)
exit=0
$ git show 7e8082d:docs/figures/pipeline.svg | cmp - <scratch>/base/fig/pipeline.svg && echo base-pipeline-identical; (the same for plan-loop.svg)
base-pipeline-identical
base-plan-loop-identical
$ git show 7e8082d:skills/repo-setup/SKILL.md | grep -m1 version:
  version: "5.3.0"
```

## Verdicts

The SKILL.md subsection of "What to build":

1. Frontmatter: holds. The description is one paragraph of 817 characters and adds the `skills` sentence and the four trigger phrases the brief names. It names no neighbouring skill, and `metadata.version` is `3.2.0`.
2. Title paragraph: holds. It is two sentences (SKILL.md line 10) and covers `/ordo-help`, the named plan and `/ordo-help skills`.
3. Quick start: holds. The third line is `/ordo-help skills` with its comment at column 23, the same column as the two lines above it (awk index printed 23 three times), and the first line is still `/ordo-help`.
4. What it reads: holds, with Standards 1. Item 1 reads the argument first. Items 2 and 3 cover the skills folder and its `SKILL.md` files. Items 4, 6 and 7 are scoped to the two other modes, and items 5 and 8 were already scoped.
5. Steps: holds. `## Steps` has `### The sequence and the plans` (the old four items with every sub-bullet, under the line "`/ordo-help` and `/ordo-help <entry>` run these steps.") and `### skills` (items 1 to 3, each ending on a completion line). The three old references are rewritten to the subsection form, at SKILL.md:46, SKILL.md:151, plan-terms.md:37 and glossary.md:42. `grep -n 'Steps [0-9]'` prints nothing.
6. Stops: holds. The "No stop" row reads "refusals of `/ordo-help` and `/ordo-help <entry>` ... and `/ordo-help skills` refuses nothing", and the two refusal rows are unchanged.
7. Anti-patterns: holds. The new row's Do instead cell is `"Steps / skills" 3`, and that item holds the copy action ("copied from the `SKILL.md` this step reads").
8. Rules: holds. "The skill writes nothing." is unchanged, and the `skills` steps only read and print.

The other subsections of "What to build":

- `skills/repo-setup/SKILL.md`: holds. The version goes from `5.3.0` to `5.3.1`, and the only change under its `templates/` is the one "Stated in" line.
- `README.md` line 23: holds, with Standards 3 for the wording. The row's new second sentence follows the table's style, with no final full stop as in the other rows.
- `docs/figures/gen_figures.py` and `pipeline.svg`: holds, with Standards 3 for the wording. The body is split over two literals at lines 539 and 540, and no line is over 103 characters. The script exits 0 with no `error:` line. `pipeline.svg` equals a fresh run, and `plan-loop.svg` equals the base byte for byte. The diff names only `gen_figures.py` and `pipeline.svg`.

Cases:

1. met. Read through `### skills` on this tree, the text prints 15 blocks in the order `LC_ALL=C ls -1 skills/` printed, and each folder's Quick start holds one fenced block (fences=2 for each).
2. met. "What it reads" 4, 6, 7 and 8 are scoped away from the `skills` mode, and the "No stop" row says it refuses nothing.
3. met. The `### skills` items print only name lines, blocks, `no Quick start block` and blank lines. Standards 2 is about other output (a path or a folder list), not these three.
4. partial: Standards 1. The literal command `cd <this skill's folder> && pwd -P` gives `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`, and its parent is the right folder. The text also admits a reading that resolves the parent of the link path instead, which is the folder that holds the link.
5. met. `literature` has no `SKILL.md`, and "Steps / skills" 3's first bullet skips it.
6. met. `~/.agents/skills/find-skills/` holds a `SKILL.md` with no `## Quick start` (count 0), so it prints `/find-skills` and then `no Quick start block`.
7. met. The parent of the real folder is the folder of copies, and `synced` has no `SKILL.md`, so it is skipped.
8. met. "Steps / skills" 3, fourth bullet.
9. met. "Steps / The sequence and the plans" keeps items 1 to 4 unchanged.
10. met. "What it reads" 1: only the whole argument `skills` selects the mode, and any other argument is `<entry>`.
11. met. Both in-file references and the glossary "Stated in" now name items that exist (item 1 prints the sequence, and item 3 prints the positions in the roadmap's order and reads the dispatch entry, SKILL.md:63-64).
12. met. The length is 817.
13. met. Exit 0, no `error:` line, and the stat names the two figure files only.
14. met. The script printed `ok: the plan-terms block equals the template`, exit 0.
15. met. Three lines between the fences, the first `/ordo-help`.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

1. **The skills folder's location can be read two ways** (`skills/ordo-help/SKILL.md:35`, "What it reads" item 2, and `skills/ordo-help/SKILL.md:78-79`, "Steps / skills" 1).
   - Quoted: `2. For `/ordo-help skills`, the skills folder: the parent of this skill's folder, the base directory the runner states when the skill loads, with its real path followed through any link by `cd <this skill's folder> && pwd -P`.` and `1. Find the skills folder as "What it reads" 2 says.` / `- The step is done when the skills folder's real path is known.`
   - What is wrong: after the colon, "the base directory the runner states" can be read as a second description of the skills folder, when it is meant to describe "this skill's folder". "its real path" grammatically refers to the skills folder, and Step 1's completion line ("the skills folder's real path is known") says the same. Read that way, the skill takes the parent of the link path first and then resolves that folder. The text never says plainly to resolve this skill's folder first and then take the parent of the result. This is the ambiguity that `docs/dev/skill-layout.md`, "Writing for an agent", and the brief's case 4 ("never the folder that holds the link") guard against.
   - Failure scenario: an agent gets the base directory `/Users/axelfaes/.claude-backup/skills/ordo-help`, takes its parent, and runs `cd /Users/axelfaes/.claude-backup/skills && pwd -P`. That printed `/Users/axelfaes/.claude-backup/skills`, the folder of links (it holds `.trash`, the 15 links and `synced`). On this machine the output happens to be the same 15 blocks, because the links resolve and `synced` is skipped. A user who keeps any personal skill folder beside the Ordo links in `~/.claude/skills` gets that skill printed as well. The block count then no longer equals `ls skills/*/SKILL.md | wc -l`, so the gate's count fails at step 2 on such a machine.
   - Fix: state the order in one sentence, for example "this skill's folder resolved by `cd <base directory> && pwd -P`, then that real folder's parent". Step 1's completion line should then name the parent of the resolved path.

2. **"Prints nothing else" is stated only in the title paragraph, and Steps items 1 and 2 use verbs that can be read as printing** (`skills/ordo-help/SKILL.md:10` and `skills/ordo-help/SKILL.md:78-81`, "Steps / skills" 1 and 2).
   - Quoted: `... and nothing else.` (line 10), `1. Find the skills folder ... The step is done when the skills folder's real path is known.` and `2. List the folders of the skills folder in folder-name order ... The step is done when the folder names are listed in that order.`
   - What is wrong: ruling D2 ("only the blocks") is a rule for the whole of the `skills` mode, and the text states it only in the title paragraph. Row 1 of skill-layout's "Sections, in order" says what that paragraph is for (what the skill does). "Where a rule goes" puts a rule for one point of the work in that step's item and a rule that holds throughout in Rules. In a skill whose other steps all say "Print", "List the folders ... the folder names are listed" can be read as an instruction to print them.
   - Failure scenario: an agent following `### skills` prints `Skills folder: /Users/axelfaes/.local/share/ordo-stable/skills` and then the 16 folder names before the first `/code-comments` line. That output breaks D2. Step 2's `diff` of each block would still pass, so step 2 would not catch it.
   - Fix: one bullet in `### skills` (or Rules) saying that only the name lines, the blocks, `no Quick start block` lines and blank lines are printed, and Steps 1 and 2 reworded so that they print nothing.

3. **The figure box names the `skills` argument as a bare word** (`docs/figures/gen_figures.py:540`, and `docs/figures/pipeline.svg`, `/ordo-help` box).
   - Quoted: `"With skills, it prints every skill's Quick start.",`. The rendered lines are `and the next command. With` / `skills, it prints every` / `skill's Quick start.`
   - What is wrong: the figure has no code font, so "With skills" reads as an ordinary phrase. Nothing in the box tells a reader that `skills` is an argument of `/ordo-help` (the prose standard: written for a reader coming to it cold). The README row marks it as code ("For `skills`"), but the figure stands on its own in the README.
   - Failure scenario: a reader of the pipeline figure learns that `/ordo-help` can list Quick starts but not that the command is `/ordo-help skills`.
   - Fix: wording such as "`/ordo-help skills` prints every skill's Quick start", fitted to the box. The script's label checks still apply.

## 4. Behaviour

1. **The builder's report has no section of user-visible changes with before and after.** The brief's "Report" requires one ("Every host- or user-visible change with its before and after"), and so does rule 7 of `docs/dev/change-standard.md`.
   - The headings of `.scratch/4-a-ordo-help-skills/agents/reviews/1-report.md` run from "Open items" to "Anything in the brief that was wrong or impossible" with no such section. The figure body and the README sentence appear under "Judgment calls" with their new text only.
   - Changes left unstated:
     - Typing `/ordo-help skills`: before, `skills` was read as `<entry>`, which led to the "No ledger folder" refusal naming `/plan`, since no `plan.md` opens with `# Plan: skills` (`grep -n '^## ' docs/roadmap.md` lists no such entry). After, the skill prints the 15 name lines and blocks.
     - The description's new trigger phrases ("which skills are there", "list every skill and its modes", "what modes does a skill have"): requests worded that way now load `ordo-help`.
     - The README row: one sentence before, two after.
     - The pipeline figure's `/ordo-help` box: three body lines before ("Prints the sequence and, for a" / "named plan, where it stands" / "and the next command."), five after. The optional mark and "No stop." moved down 30 px (from y=771 to y=801 and from y=809 to y=839), still inside the box, which is 210 px high starting at y=688.
   - Failure scenario: the orchestrator writing the landing report, or the user reading the booking, has no before and after for these to check against.

## Declined to judge

- Whether the worktree's HEAD is 7e8082d. The builder's first runs say "HEAD 7e8082d, `git status --short` printed nothing", and its DONE table uses `git diff --stat -- docs/figures/` with no base given. I ran the `git diff 7e8082d` form, which printed the same stat. `git rev-parse HEAD` in the worktree would settle it.
- Whether the tree was clean when the builder made its first runs. Only its state at that time would settle it, and that cannot be rerun now. I reran the unchanged-tree cases 11, 12, 13 and 15 from the base files through `git show 7e8082d:<path>`, and they reproduce the report's results.
- Case 14 on the unchanged tree (the report prints `ok:`). Running `sync_rules.py` against the base files would need a scratch repository holding the base `docs/glossary.md` and template. Without one, the script reads the changed template beside it. I did not build that repository. Only the run after the change is reproduced above.
- How the installed skill behaves when loaded through the Skill tool. That is step 2's gate run on a pinned release candidate, and it is outside this review.

Reviewer usage: a6c49cd6b72bbc846, claude-opus-5-5, 160305 tokens, 36 tool uses, 7.6 minutes.

## Repair round 1, refuted

```
$ (check 1) printf '%s\0' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md README.md docs/figures/gen_figures.py docs/figures/pipeline.svg | xargs -0 perl -CSD -ne '...as in the brief...'; echo "exit=$?"
exit=0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo "exit=$?"
ok: the plan-terms block equals the template
exit=0
$ (check 2) python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/ordo-help/SKILL.md").read().split("---")[1])["description"]))'
817
$ (check 3) grep -m1 'version:' skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md
skills/repo-setup/SKILL.md:  version: "5.3.1"
skills/ordo-help/SKILL.md:  version: "3.2.0"
$ (check 4) cp docs/figures/gen_figures.py <scratch>/fig2/ && cd <scratch>/fig2 && python3 -I gen_figures.py; echo "exit=$?"
wrote scratchpad/fig2/pipeline.svg (31975 bytes)
wrote scratchpad/fig2/plan-loop.svg (32184 bytes)
exit=0
$ cmp <scratch>/fig2/pipeline.svg docs/figures/pipeline.svg && echo pipeline-identical
pipeline-identical
$ cmp <scratch>/fig2/plan-loop.svg docs/figures/plan-loop.svg && echo plan-loop-identical
plan-loop-identical
$ git show 7e8082d:docs/figures/plan-loop.svg | cmp - docs/figures/plan-loop.svg && echo plan-loop-equals-base
plan-loop-equals-base
$ grep -c 'error:' <scratch>/fig2/pipeline.svg <scratch>/fig2/plan-loop.svg
0 and 0 (the script printed no error: line)
$ git diff 7e8082d --stat -- docs/figures/
 docs/figures/gen_figures.py | 3 ++-
 docs/figures/pipeline.svg   | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)
$ awk 'length>103{print FILENAME":"NR": "length}' docs/figures/gen_figures.py
(nothing)
$ (check 5) awk '/^## Quick start/{q=1;next} q&&/^## /{q=0} q' skills/ordo-help/SKILL.md

```
/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan
/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next
/ordo-help skills     print each skill's name and its Quick start block, in folder-name order
```

$ (check 6) grep -n '^## \|^### ' skills/ordo-help/SKILL.md
12:## Quick start
20:## Use instead
30:## What it reads
51:## Steps
53:### The sequence and the plans
76:### skills
92:## The sequence, printed verbatim
141:## Stops
149:## Anti-patterns
156:## Rules
$ git status --short
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/glossary.md
 M skills/ordo-help/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
?? .scratch/4-a-ordo-help-skills/agents/briefs/1-round-1.md
?? .scratch/4-a-ordo-help-skills/agents/reviews/1-report.md
$ git diff 7e8082d --numstat   (fields separated by <tab>)
1<tab>1<tab>README.md
2<tab>1<tab>docs/figures/gen_figures.py
5<tab>3<tab>docs/figures/pipeline.svg
1<tab>1<tab>docs/glossary.md
40<tab>10<tab>skills/ordo-help/SKILL.md
1<tab>1<tab>skills/repo-setup/SKILL.md
1<tab>1<tab>skills/repo-setup/templates/plan-terms.md
$ wc -l (the seven files)
159 skills/ordo-help/SKILL.md
245 skills/repo-setup/SKILL.md
134 skills/repo-setup/templates/plan-terms.md
154 docs/glossary.md
195 README.md
759 docs/figures/gen_figures.py
176 docs/figures/pipeline.svg
$ LC_ALL=C grep -n '[^ -~]' skills/ordo-help/SKILL.md README.md docs/figures/gen_figures.py skills/repo-setup/SKILL.md; echo "nonascii-exit=$?"
nonascii-exit=1
```

Commands the round's report quotes, and what they printed on my rerun:

```
$ grep -n 'pwd -P\|parent' skills/ordo-help/SKILL.md
36:   - First, this skill's folder is resolved to its real path, through any link, by `cd <base directory> && pwd -P`, the base directory being the folder the runner states when the skill loads.
37:   - Then the skills folder is the parent of that resolved path, never the parent of the base directory as stated.
80:1. Find the skills folder as "What it reads" 2 says, resolving this skill's folder before taking its parent.
81:   - The step is done when the parent of the resolved path is known as the skills folder.
(the report says lines 36, 37, 80, 81: reproduced)
$ grep -n 'prints only' skills/ordo-help/SKILL.md
159:- The `skills` mode prints only the name lines, the Quick start blocks, the `no Quick start block` lines and the blank lines between skills.
(report: line 159: reproduced)
$ sed -n 76,90p skills/ordo-help/SKILL.md | grep -n 'print'
(hits only in item 3 and its bullets, lines 84-90; none in items 1 and 2: reproduced)
$ grep -n 'Steps [0-9]' skills/ordo-help/SKILL.md; echo "grep-exit=$?"
grep-exit=1
$ grep -n -i 'mode\|invocation' skills/ordo-help/SKILL.md   (cut to 90 columns)
lines 3, 33, 121, 128, 154, 159 (report lists the same; 121 and 128 are "model" in the sequence block)
$ for each of the 15 folders in LC_ALL=C ls -1 skills/: awk count of fence lines under ## Quick start
code-comments diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap session-retro spec writing, fences=2 for each
$ ls skills/*/SKILL.md | wc -l
15
$ readlink ~/.claude/skills/ordo-help; (cd ~/.claude/skills/ordo-help && pwd -P)
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help
$ ls ~/.local/share/ordo-stable/skills/*/SKILL.md | wc -l
15
$ ls ~/.local/share/ordo-stable/skills/literature/SKILL.md; ls ~/.claude-backup/skills/synced/SKILL.md
ls: .../literature/SKILL.md: No such file or directory
ls: .../synced/SKILL.md: No such file or directory
$ ls -d ~/.agents/skills/*/; grep -c '^## Quick start' ~/.agents/skills/find-skills/SKILL.md
/Users/axelfaes/.agents/skills/find-skills/
0
$ grep -c 'Plan: skills' docs/roadmap.md
0
$ git show 7e8082d:skills/ordo-help/SKILL.md | sed -n '33,35p;119p;125p'
(base item 2 "For /ordo-help <entry>, the ledger folder..." at 33, its sub-bullets at 34-35, "No ledger folder" row at 119, "Printing the sequence in other words" row at 125: the report's base line numbers reproduced)
$ git show 7e8082d:docs/figures/pipeline.svg | grep the box's dasharray rect / this tree's
base:  <rect x="543" y="771" ... stroke-dasharray="3 2"/>   this tree: <rect x="543" y="801" ...>
base text y values 732, 747, 762, "No stop." at 809; this tree: 732, 747, 762, 777 "/ordo-help skills prints every", 792 "skill's Quick start.", "No stop." at 839
(box starts at y=688, height 210: the report's before and after of the figure reproduced)
$ sed -n 536,543p docs/figures/gen_figures.py
        "Prints the sequence and, for a named plan, where it stands and the next command. "
        "/ordo-help skills prints every skill's Quick start.",
$ round delta: diff -u <snapshot> <worktree> over the seven listed paths
README.md, docs/glossary.md, skills/repo-setup/SKILL.md, skills/repo-setup/templates/plan-terms.md: no difference.
docs/figures/gen_figures.py: the second literal "With skills, it prints every skill's Quick start." became "/ordo-help skills prints every skill's Quick start."
docs/figures/pipeline.svg: the two lines "and the next command. With" / "skills, it prints every" became "and the next command." / "/ordo-help skills prints every".
skills/ordo-help/SKILL.md: "What it reads" item 2 rewritten (lines 35-37), "Steps / skills" items 1 and 2 reworded (lines 80-83) and the item 3 lead-in (line 84, "in the sorted order"), one new Rules bullet (line 159).
No path outside files.txt changed outside .scratch/.
```

### Verdicts

"What to build", SKILL.md subsection:

1. Frontmatter: holds. 817 characters, one paragraph, no neighbouring skill named, version `3.2.0`.
2. Title paragraph: holds. Two sentences, three modes covered; it keeps "and nothing else" as the ruling allows.
3. Quick start: holds. Three lines between the fences, first `/ordo-help`.
4. What it reads: holds. Item 1 reads the argument first; item 2 resolves this skill's folder first and takes the parent of the resolved path; item 3 reads each `SKILL.md`; items 4 to 8 are scoped to the other two modes. Standards 1 below is a form point, not a miss.
5. Steps: holds. `### The sequence and the plans` keeps the four old items, and `### skills` items 1 to 3 each end on a completion line. The three references name "Steps / The sequence and the plans" 3 and 1; `grep -n 'Steps [0-9]'` printed nothing. The old file's lines were read side by side with the new one (`git diff 7e8082d -- skills/ordo-help/SKILL.md`, the removed lines): every removed line is reproduced with a scope phrase, the new subsection heading, the longer description, or the longer "No stop" row; no rule is lost.
6. Stops: holds. The "No stop" row says `/ordo-help skills` refuses nothing, and the two refusal rows are unchanged.
7. Anti-patterns: holds. The new row's Do instead cell is `"Steps / skills" 3`, the item that copies the block.
8. Rules: holds. "The skill writes nothing." stays, and the new bullet states the print rule of the `skills` mode.

repo-setup subsection: holds. Version `5.3.1`; the only change under `templates/` is the "Stated in" line 37, and the sync check printed `ok:`.

README subsection: holds. Line 23 gains one sentence ("For `skills` it prints the name and the Quick start block of every skill instead"), in the table's style.

Figures subsection: holds. The body is split over two literals at `gen_figures.py` lines 539-540, the script exits 0 with no `error:` line, `pipeline.svg` equals a fresh run, `plan-loop.svg` equals the base, and the stat names the two figure files only.

Cases:

1. met. Read through `### skills` on this tree: 15 folders in `LC_ALL=C ls -1` order, `fences=2` for each.
2. met. "What it reads" 4 to 8 are scoped to the other two modes, and the "No stop" row says `/ordo-help skills` refuses nothing.
3. met. The Rules bullet at line 159 and `### skills` 3 print only name lines, blocks, `no Quick start block` lines and blank lines; items 1 and 2 print nothing.
4. met. "What it reads" 2 takes the parent of the resolved path, and `pwd -P` on `~/.claude/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help`, so the folder is `~/.local/share/ordo-stable/skills/`. Line 37 forbids the parent of the base directory as stated.
5. met. `literature` has no `SKILL.md`, so `### skills` 3's first bullet skips it.
6. met. `~/.agents/skills/` holds `find-skills`, a `SKILL.md` with no `## Quick start` (count 0), so it prints `/find-skills` then `no Quick start block`.
7. met. The folder of copies is the parent of the resolved path, and `synced` has no `SKILL.md`, so it is skipped.
8. met. `### skills` 3, fourth bullet.
9. met. `### The sequence and the plans` items 1 to 4 are unchanged.
10. met. "What it reads" 1: only the exact argument `skills` selects the mode; any other argument is `<entry>`.
11. met. Lines 48 and 153 and the glossary "Stated in" name items that exist and say what they said (item 3 prints the positions in the roadmap's order and holds the dispatch entry text; item 1 prints the sequence).
12. met. 817.
13. met. Exit 0, no `error:` line, stat names `gen_figures.py` and `pipeline.svg` only.
14. met. `ok: the plan-terms block equals the template`, exit 0.
15. met. Three lines between the fences, the first `/ordo-help`.

The four findings of the first report:

- Standards 1, closed. "What it reads" 2 now says to resolve this skill's folder with `cd <base directory> && pwd -P` first, and then to take the parent of that resolved path, "never the parent of the base directory as stated". "Steps / skills" 1's completion line reads "the parent of the resolved path is known as the skills folder". The grep for `parent` finds only lines 36, 37, 80 and 81, and each takes the parent of the resolved path. No check was removed. The fix does what ruling 1 says and stays inside the finding.
- Standards 2, closed. One Rules bullet (line 159) states the print rule once, where "Where a rule goes" puts a rule that holds throughout. Items 1 ("Find") and 2 ("Sort") contain no print verb, and their completion lines say what is known. The title paragraph keeps "and nothing else", as the ruling allows. The new text leaves a small residue, raised as Standards 2 below.
- Standards 3, closed. The box body now reads "/ordo-help skills prints every skill's Quick start.", so the figure alone gives the command. The rerun shows the script exits 0 with no `error:` line and `pipeline.svg` equals a fresh run, and `plan-loop.svg` equals the base. The fix touches only the figure body and the regenerated SVG.
- Behaviour 1, closed. The report has the section "Every host- or user-visible change with its before and after", with ten items. Each before and after I re-read matches `git show 7e8082d:<path>` and the tree: the `skills` argument (base "No ledger folder" refusal versus the blocks), the trigger phrases, the README row, the figure box (rect y 771 to 801, "No stop." y 809 to 839, three body lines to five), the subsection heading, the three references and the two versions. The base line numbers it cites for "What it reads" 2, the Stops row and the Anti-patterns row reproduce.

### Findings

#### Standards

1. **The two moves of "What it reads" 2 are an ordered pair written as an unordered bulleted list** (`skills/ordo-help/SKILL.md:35-37`, "What it reads" item 2).
   - Quoted: `2. For `/ordo-help skills`, the skills folder, found in two moves.` followed by `   - First, this skill's folder is resolved to its real path, ...` and `   - Then the skills folder is the parent of that resolved path, never the parent of the base directory as stated.`
   - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", says "A numbered list means order. An unordered set is a bulleted list." The two sub-bullets are an order, marked by "First" and "Then", in a bulleted list. "Moves" is also a word of no definition in the glossary or the standards. The report's "Sentences over the standards' length" section justifies the 34-word length of line 36, so length is not raised.
   - Failure scenario: a reviewer or an agent reading the list as a set can take the two bullets as independent. The words "First" and "Then" carry the order, so the misreading is unlikely, but the form does not follow the layout standard that ruling 1 was meant to make exact.
   - Fix: write the order as a numbered sub-list, or as one sentence ("this skill's folder is resolved ... by `cd <base directory> && pwd -P`, and the skills folder is the parent of that resolved path, never of the base directory as stated").

2. **A restated order, and a list that lost its name, in `### skills`** (`skills/ordo-help/SKILL.md:80` and `:90`).
   - Quoted: `1. Find the skills folder as "What it reads" 2 says, resolving this skill's folder before taking its parent.` and `   - The step is done when every folder of the list is skipped or printed.`
   - What is wrong: (a) item 1 names "What it reads" 2 and then restates its order in a clause, and `docs/dev/skill-layout.md`, "Where a rule goes", says "A rule is written once. Another place that needs it names the section it is in." The completion line of item 1 already says the parent of the resolved path. (b) Item 2 used to produce a "list" ("List the folders ... the folder names are listed"); it now produces "sorted names", and item 3's completion line still says "every folder of the list".
   - Failure scenario: (a) two statements of the same order can drift when one is edited; (b) the phrase "the list" has no antecedent in the reworded items, a cold reference of the kind the prose standard, E, names.
   - Fix: drop the clause from item 1, or keep it and drop the second statement in "What it reads" 2; write "every folder of the sorted order" in the completion line of item 3.

#### Spec

none

#### Proof

none

#### Behaviour

none

### Declined to judge

- Whether the worktree's HEAD is 7e8082d: it needs `git rev-parse HEAD`, outside the git commands allowed here. `git diff 7e8082d` and `git show 7e8082d:<path>` ran against that base and agree with the report.
- The report's section "The cases' first run, on the unchanged tree" (including "HEAD 7e8082d, `git status --short` printed nothing"): the tree at that time cannot be rerun. Round 1 did not change the section, and the first report's rerun of the unchanged-tree cases 11, 12, 13 and 15 from the base files stands.
- Case 14 on the unchanged tree: needs a scratch repository holding the base glossary and template. Only the run after the change is reproduced.
- How the installed skill behaves when loaded through the Skill tool, and whether an agent resolves the folder as the text says: that is the gate of step 2, outside this review.

Reviewer usage: a248c71344ddb9568, claude-sonnet-5-5, 132598 tokens, 24 tool uses, 2.8 minutes.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- First run, Standards 1, the skills folder read two ways: closed in round 1, `skills/ordo-help/SKILL.md` "What it reads" 2 and "Steps / skills" 1; the run over round 1 reproduces it (`grep -n 'pwd -P\|parent'`).
- First run, Standards 2, the print rule stated only in the title paragraph: closed in round 1, the Rules bullet "The `skills` mode prints only ..." and "Steps / skills" 1 and 2 reworded to Find and Sort; reproduced by the run over round 1.
- First run, Standards 3, the figure's bare `skills`: closed in round 1, `docs/figures/gen_figures.py` lines 539-540 and `docs/figures/pipeline.svg`; the script exits 0 and `plan-loop.svg` equals the base.
- First run, Behaviour 1, no before-and-after section: closed in round 1, the report's section "Every host- or user-visible change with its before and after".
- Round 1, Standards 1, the ordered two moves as a bulleted list: fixed at landing, "What it reads" 2 written as one item stating the order in one sentence.
- Round 1, Standards 2, the restated order in "Steps / skills" 1 and "the list" in item 3's completion line: fixed at landing, the clause dropped from item 1 and the completion line reading "every folder in the sorted order".
