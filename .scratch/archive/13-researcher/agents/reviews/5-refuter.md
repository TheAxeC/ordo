# Step 5 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-5, base 6dacf2b)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' skills/ordo/ordo-help/SKILL.md README.md | xargs -0 perl -CSD -ne '...brief verify 1 as written...'; echo "exit $?"
exit 0
(nothing printed before the exit line)

$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 -c 'import yaml; d=yaml.safe_load(open("skills/ordo/ordo-help/SKILL.md").read().split("---")[1]); print(len(d["description"]), d["metadata"]["version"])'
1010 5.2.0
exit 0

$ git diff 6dacf2b --stat      (brief verify 3 is `git diff --stat`; see Declined to judge)
 README.md                      |   2 +-
 skills/ordo/ordo-help/SKILL.md | 101 +++++++++++++++++++++++++++++++----------
 2 files changed, 78 insertions(+), 25 deletions(-)

$ git status --short
 M README.md
 M skills/ordo/ordo-help/SKILL.md
?? .scratch/13-researcher/agents/reviews/5-report.md

Commands the builder's report quotes:

$ grep -n 'one line on what' skills/ordo/ordo-help/SKILL.md     (output cut at 80 columns)
3:description: "Print the command sequence for running a plan step by step (open
10:`/ordo-help` prints the command sequence for running a plan step by step and
19:/ordo-help skills     print each skill's name, one line on what it is for and
106:   - Under that line, print one line on what the skill is for: one sentence
  -> matches the report (lines 3, 10, 19, 106).

$ wc -l skills/ordo/ordo-help/SKILL.md README.md
     216 skills/ordo/ordo-help/SKILL.md
     263 README.md
  -> matches the report.

$ for f in .scratch/*/plan.md; do head -n1 "$f"; done      (main checkout)
# Plan: 13. researcher
$ for f in .scratch/archive/*/plan.md; do head -n1 "$f"; done | grep "4.A\|researcher"
# Plan: 4.A ordo-help skills
  -> matches the report's first run.

$ grep -rn --exclude-dir=.scratch ordo-help skills utils docs README.md
  -> hits outside the skill: Use instead rows of wait-what, diagnose, session-retro, land, grill, roadmap, plan, plan-orchestration, spec; ordo-init SKILL.md:10; ordo-init templates/plan-terms.md:39,63,80,113,120; docs/plan.yaml:1; docs/glossary.md:44,68,85,118,125; docs/roadmap.md:26,27,28,60; docs/figures/plan-loop.svg:101; docs/figures/gen_figures.py:2242,2349; docs/figures/pipeline.svg:115; README.md:22,37,39,67,165. The report names a subset (glossary 44, 68, 85, 118; README 39, 67; gen_figures 2242, 2349). I read every hit; each still holds after the change.

$ LC_ALL=C grep -n '[^ -~]' .scratch/13-researcher/agents/reviews/5-report.md; echo "exit $?"
exit 1      (no character outside ASCII in the builder's report)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. "Steps / skills" 3 prints `/<name>`, then "one sentence of at most 25 words, written in this run from the frontmatter `description`" (SKILL.md:106), then the Quick start block copied (SKILL.md:107); the Rules bullet (SKILL.md:213) allows the line, and the Anti-patterns row (SKILL.md:207) forbids it "from memory or from another run".
- 2: violated, Spec 1 (the reading with a required key missing is placed where the first-match rule of "What it reads" 1 cannot reach it). The other parts hold: the order `skills`, folder, entry with an open plan, anything else (SKILL.md:35-45); the sentence form's reads (SKILL.md:47, 52-54, 56); at most three skills, each with name, mode, command and why (SKILL.md:121-132); the order of use (SKILL.md:126, 130); none fits (SKILL.md:128); an entry with no open plan answered from the roadmap ("Steps / An entry with no open plan"); the Stops row "No ledger folder" removed; writes nothing, invokes no skill, starts no agent (SKILL.md:212, 215, 216).
- 3: holds. The rerun prints `1010 5.2.0`; the description adds the one-line-per-skill clause and the sentence form; `Triggers on:` gains "which skill do I use for, which command do I type to".
- 4: holds, with Standards 1 and 2 against how two sentences read. The opening paragraph, Quick start (the `skills` line reworded, the new line after it, `/ordo-help` still first), "What it reads" 2, 3, 4, 8, a Steps subsection for the sentence form with each item ending on its completion criterion, Stops, Anti-patterns and Rules all describe the new forms. I grepped every name the diff changes or removes across `skills/`, `docs/`, `utils/` and `README.md`, the removed Stops row "No ledger folder" among them. The four remaining hits for "No ledger folder" are the rows of `diagnose`, `land`, `refute` and `spec`, each about its own skill. No sentence outside the skill is made false.
- 5: holds. README.md:22 adds "one line on what the skill is for" and the sentence form, in the row's own style; `git diff 6dacf2b` shows no other README line changed.

Cases of the brief's "Cases" (each walked through "What it reads" 1 of the new text, bullet by bullet):

- `/ordo-help skills`: met. The first bullet (exactly `skills`) decides it; "Steps / skills" 3 prints `/<name>`, the line on what the skill is for, then the Quick start block; "A folder with no `SKILL.md` is skipped" (SKILL.md:104).
- `/ordo-help I want to revise a paper`: met. It is not `skills`, not empty, and no folder holds a plan.yaml named `I`. It is no entry, entry title or number, so "Any other argument" (SKILL.md:45) decides it. Step 3 picks `paper`, its line `/paper revision <main.tex> <comments file>`, and the mode `revision` by SKILL.md:125 (the brief's own example). Rules SKILL.md:214 says no sequence is printed.
- `/ordo-help someone asked me to review a manuscript for a journal`: met. SKILL.md:45 decides it. The description of `referee` ("Referee someone else's paper for a journal") and `paper`'s Use instead row "Someone else's paper to review as its referee | `referee`" (SKILL.md:122-123) give `referee`, printed with `/referee <manuscript>`. See Standards 3 on the mode of that line.
- `/ordo-help I want to bake bread`: met. SKILL.md:45 decides it; step 4 prints one line that no skill fits, names `/ordo-help skills`, and the run ends there.
- `/ordo-help 13` with a plan open for 13: met. SKILL.md:42 decides it (`.scratch/13-researcher/plan.md` opens `# Plan: 13. researcher`); "Steps / The sequence and the plans" runs as before.
- The number of an open entry with a gate and no open plan: met by reading. SKILL.md:43 decides it, and "Steps / An entry with no open plan" prints the line naming `/plan <entry>`. No such entry is on the tree: the roadmap's open order holds only 13.
- `4.A`, a done entry: met. SKILL.md:42 does not match, since the plan of 4.A is under `archive_root` and so is no open plan (glossary **open plan**). SKILL.md:43 matches: the roadmap's Done section holds `- [x] 4.A ordo-help skills`, so one line says the entry is done. See Behaviour 1 for the before.
- `<folder>/<entry>` and `<project>/<entry>` with a plan open: met. SKILL.md:40 strips the folder or project as `/plan` does, and SKILL.md:42 decides the rest.
- `researcher` and `I want to work on researcher`: met. For `researcher`, SKILL.md:42 matches the title of entry 13, which has an open plan, before SKILL.md:43 can match the dropped entry 24. The sentence is no whole title or number, so SKILL.md:45 decides it.
- `I want to revise a paper` with no plan.yaml found: met. SKILL.md:42-44 cannot match without a roadmap, SKILL.md:45 and 46 make it a sentence, and SKILL.md:56 reads the configuration only "when a `plan.yaml` is found". No refusal.
- `I want my paper reviewed and then revised`: met. SKILL.md:45 decides it. SKILL.md:126 orders `paper-review-panel` and then `paper` with mode `revision`, which `paper-review-panel`'s Use instead row "Need to revise a paper (already have review comments) | `/paper revision`" supports, and step 5 prints the order line.
- `/ordo-help` with no argument, and `/ordo-help <folder>`: met. SKILL.md:38 and 39 decide them; "Steps / The sequence and the plans" is unchanged apart from its header line, which now names `<folder>`.

## 1. Spec

- 1. skills/ordo/ordo-help/SKILL.md:35 and 46.
  - Quoted: "The argument, read first, by the bullets below in their order, the first that matches deciding the form." and, last, "- With no `plan.yaml` found, or with one whose required key is missing, an argument other than `skills` and the folder forms is a sentence on what you want to do and is answered."
  - What is wrong: SKILL.md:46 is an override, but it stands last under a first-match rule, so SKILL.md:42-44 are tried before it. "What it reads" 8 (SKILL.md:68) reads the roadmap "when a `plan.yaml` is found" and does not except a file with a missing key. The brief's item 2 says that with a required key missing, "an argument other than `skills` and a folder is a sentence and is answered". SKILL.md:46 also says "the folder forms" and the Stops row says "a folder form", and neither says whether `<folder>/<entry>` is one of them. The brief keeps the refusal for a folder alone.
  - Failure scenario: a `plan.yaml` lacks the required `ledger_root` but names `roadmap:`. A session following the first-match rule matches `/ordo-help 13` against the roadmap by SKILL.md:43, finds no open plan because no ledger root can be read, and prints `/plan 13` for an entry whose plan is open. SKILL.md:46 says the same argument is a sentence. For `<folder>/13` with a key missing in that folder's file, one reader refuses with the key and another answers it as a sentence.
  - Verdict: item 2 violated.
- 2. skills/ordo/ordo-help/SKILL.md:43 and "Steps / An entry with no open plan", against ruling D33.
  - Quoted: "- An argument that is, whole, the number or the title of a roadmap entry with no open plan is read from the roadmap".
  - What is wrong: D33 reads "the number or title of an entry that has an open plan" as an entry and "anything else as what the user wants to do". Brief decision 2 adds titles of entries with no open plan, which the builder followed as asked. The report's Verify 5 mapping lists D33's last clause as carried "with the entries with no open plan ... read as decision 2 of the brief says", and does not name it as a narrowing of D33. On this roadmap many done or dropped entries carry a skill's name as their whole title. Done: `5. paper`, `8. grant`, `7.A referee`, `2.E. grill`, `2.F. diagnose`, `19. codebase-design`, `4. code-comments`, `2.H. session-retro`. Dropped: `21. wizard`, `17. review`, `10. idea`, `22. teach`.
  - Failure scenario: a user types `/ordo-help paper` or `/ordo-help wizard` to learn how to use that skill. In this repository the skill prints "entry 5 is done" or "entry 21 is dropped" instead of the skill's commands. Under D33 as ruled, each would be read as a sentence and answered with `paper` or `wizard`. Whether titles of entries with no open plan stay in this form is the orchestrator's or the user's call on brief decision 2.
  - Verdict: none (the brief asked for it).
- 3. skills/ordo/ordo-help/SKILL.md:42 against SKILL.md:43 and 68.
  - Quoted: "the number, the title, or the number and title of a roadmap entry that has an open plan" against "the number or the title of a roadmap entry with no open plan".
  - What is wrong: the number-and-title form is accepted for an entry with an open plan and not for one without. It then falls to SKILL.md:45 as a sentence. The brief says "the whole number or title", so the builder followed the brief's words, and the two forms are now read differently.
  - Failure scenario: a user copies an open entry's heading from the roadmap, such as `/ordo-help 14. some title`, for an entry with a gate and no plan. The skill reads the title words as a sentence, and may name a skill whose description matches them, instead of `/plan 14`.
  - Verdict: none.

## 2. Proof

- 1. Builder's report, "Verify 4: departures from the rules on list items and sentence length".
  - What is wrong: the report claims DONE with "departures listed below". It lists the description, SKILL.md:40, 42 and 44, step 6, step 4 and the Stops row "No stop". My count of the added sentences (a word count over the `+` lines of `git diff 6dacf2b -U0`) finds many more over the prose standard's "under roughly 20 words" (section E, Sentence length) that the report does not name:
    - the opening paragraph's first sentence, 49 words (SKILL.md:10);
    - "What it reads" 4, 46 words (SKILL.md:55);
    - "What it reads" 8's new bullet, 45 words (SKILL.md:68);
    - "Steps / skills" 3's two new bullets, 41 and 40 words (SKILL.md:106-107);
    - SKILL.md:46, 34 words;
    - SKILL.md:125, 38 words;
    - the Rules bullet, 43 words (SKILL.md:213).
  - Decision resting on it: brief verify 4, which asks for each departure to be named with why it needs its form.
  - Failure scenario: the orchestrator accepts verify 4 as complete and lands sentences of 40 to 49 words with no stated reason.
  - Verdict: none (verify 4 is a check, not an item).

## 3. Standards

- 1. skills/ordo/ordo-help/SKILL.md:40-41.
  - Quoted: "... and the rest is then read by the next three bullets." / "- A folder or a project followed by words that none of the next three bullets matches makes the whole argument a sentence on what you want to do."
  - What is wrong: counted from SKILL.md:40, "the next three bullets" are SKILL.md:41, 42 and 43. That set includes the fallback bullet and leaves out SKILL.md:44, the unmatched number. Counted from SKILL.md:41, they are 42, 43 and 44. The same phrase names two different sets one line apart. This breaks `docs/dev/skill-layout.md` "Writing for an agent" ("One meaning has one place") and the prose standard's D ("one term per concept").
  - Failure scenario: for `<folder>/37` with no entry 37, one reader applies SKILL.md:40's set, finds no bullet of it that decides, and reads the whole argument as a sentence through SKILL.md:45. Another applies SKILL.md:41's set and prints the no-skill-fits line.
  - Verdict: none.
- 2. skills/ordo/ordo-help/SKILL.md:44.
  - Quoted: "- An argument that is a number in the roadmap's numbering, such as `37`, `4.A` or `12.5`, and matches no entry gets the line that no skill fits".
  - What is wrong: the bullet sends a number to "Steps / A sentence on what you want to do" 4, which prints that "no skill fits the sentence". The Rules bullet (SKILL.md:214) names only "A sentence on what you want to do and an entry with no open plan" as getting only their subsection's lines. An unmatched number is neither of the two, as SKILL.md:44 classes it.
  - Failure scenario: a reader checking which forms print no sequence finds the unmatched number in no Rules bullet, and may print the sequence before the line.
  - Verdict: none.
- 3. skills/ordo/ordo-help/SKILL.md:125.
  - Quoted: "The mode is the word that follows the skill's name on that line, such as `revision` in `/paper revision <main.tex> <comments file>`, or, on a line with no such word, what the line's comment says it runs."
  - What is wrong: on `/referee <manuscript>`, `/refute <entry> <step>` or `/paper-review-panel <manuscript>`, a placeholder follows the name, and the text does not say that a placeholder is not a mode word. The prose standard's E and the layout's "Writing for an agent" ask for one meaning a reader can follow.
  - Failure scenario: `/ordo-help I want to review a step` prints `/refute` with the mode `<entry>`.
  - Verdict: none.
- 4. skills/ordo/ordo-help/SKILL.md:5, against `docs/dev/skill-layout.md`, Frontmatter.
  - The rule: the major part when "a run that worked before is refused, or its output is changed or removed".
  - What is wrong: the old "What it reads" 5 resolved `<entry>` to "the folder under `<ledger_root>/`". On this tree `.scratch/archive/4-a-ordo-help-skills/plan.md` opens `# Plan: 4.A ordo-help skills` under `ledger_root` (`.scratch`). The builder's own first run gives the old result as "the archived plan's position or the refusal naming `/plan`". The new text prints "entry is done". If the old reading printed the archived position, that run's output is changed and the bump is major (6.0.0), not minor (5.2.0).
  - Failure scenario: a user relying on `/ordo-help 4.A` printing the archived plan's position takes the minor bump as safe, and gets a different output.
  - Verdict: none (it depends on how the old "under" was read; see Declined to judge).

## 4. Behaviour

- 1. Builder's report, "Host- or user-visible changes, before and after", and skills/ordo/ordo-help/SKILL.md:58.
  - Quoted: "`/ordo-help <entry with no open plan>`: before, the refusal "No ledger folder"; after, ..."
  - What is wrong: SKILL.md:58 changes "the folder under `<ledger_root>/`" to "the folder of the open plan", which excludes `archive_root`. An argument naming an archived plan, such as `4.A`, changes from the archived plan's position, or the refusal, to "entry is done". The report's own first run gives that two-way before ("the archived plan's position or the refusal"). The before/after list states the before as the refusal alone.
  - Failure scenario: the orchestrator or the user reads the change list and does not learn that `/ordo-help <archived entry>` no longer prints the archived plan's position.
  - Verdict: none.

## Declined to judge

- Brief verify 3 as written, `git diff --stat` with no base: not run, since only `git diff 6dacf2b`, `git status --short` and `git show 6dacf2b:<path>` are allowed. I ran `git diff 6dacf2b --stat`, which names the same two files. Whether the worktree holds commits past the base, which would make the two forms differ, would be settled by `git log --oneline 6dacf2b..HEAD`.
- The builder's quoted `git diff skills/ordo/ordo-help/SKILL.md`, `git diff README.md` and `git diff --numstat`: not run, for the same reason. `git diff 6dacf2b` covers their content: README shows one line changed, and the stat gives 78 insertions and 25 deletions over both files.
- Whether the old text's "the folder under `<ledger_root>/`" took in `<ledger_root>/archive/...` (Standards 4, Behaviour 1): the old text does not settle it. The skill's behaviour on the unchanged tree would settle it, from a run of `/ordo-help 4.A` at 6dacf2b, which this review cannot make.
- Whether a session running the sentence form chooses the skills the cases expect: judged by reading the text only. A run of the installed skill, step 6 of the plan, would settle it.
- Brief decision 2 against D33 (Spec 2): the user's or the orchestrator's call, not the reviewer's.

Reviewer usage: agent a0f7721f21de23fac, claude-opus-5-5, 151881 tokens, 31 tool uses, 6 minutes.

## Repair round 1, refuted

```
$ cd /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-5
$ printf '%s\0' skills/ordo/ordo-help/SKILL.md README.md | xargs -0 perl -CSD -ne '<brief verify 1 as written>'; echo "exit $?"
exit 0
(nothing printed before the exit line)

$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 -c 'import yaml; d=yaml.safe_load(open("skills/ordo/ordo-help/SKILL.md").read().split("---")[1]); print(len(d["description"]), d["metadata"]["version"])'
1010 5.2.0
exit 0

$ git diff 6dacf2b --stat     (brief verify 3 is `git diff --stat`; see Declined to judge)
 README.md                      |   2 +-
 skills/ordo/ordo-help/SKILL.md | 101 +++++++++++++++++++++++++++++++----------
 2 files changed, 78 insertions(+), 25 deletions(-)

$ git status --short
 M README.md
 M skills/ordo/ordo-help/SKILL.md
?? .scratch/13-researcher/agents/briefs/5-round-1.md
?? .scratch/13-researcher/agents/reviews/5-report.md

$ diff -u <snapshot copy> <worktree file>   (files.txt lists README.md and skills/ordo/ordo-help/SKILL.md)
README.md: no difference (the round did not touch it)
SKILL.md: differences on lines 10, 16, 40-46, 57, 60, 68, 125, 135-137, 199-200 and 214

$ grep -n 'An entry with no open plan\|folder form\|next three\|No ledger folder' skills/ordo/ordo-help/SKILL.md
(nothing printed)

$ grep -rn 'An entry with no open plan\|the folder forms\|folder form' skills docs utils README.md   (outside the skill)
(no hit about ordo-help; the hits are "no open plan" in plan-terms.md, the glossary, plan-orchestration and self-rule.md, each about an open plan or next-entry mode)

$ wc -w on lines of SKILL.md:  40: 50   41: 75   42: 53   43: 34   44: 38   45: 39   46: 42   57: 37   60: 42   68: 50   125: 52
```

### Verdicts

Items of the brief's "What to build", over the whole diff since 6dacf2b:

- 1: holds. SKILL.md:103-108 print `/<name>`, a line of at most 25 words written in the run from the description, then the Quick start block copied. The Rules bullet (line 213) allows the line. The Anti-patterns row (line 207) forbids it from memory or from another run.
- 2: holds, with Spec 1 on one input the brief does not name. The six rulings of the round are in the text:
  - Ruling 1: line 40 stands before the entry bullets (lines 43-45). It names no argument and a folder named alone as the two refusals, and makes every other argument a sentence with no roadmap read. Line 57, line 68 and the Stops rows (lines 199-200) say the same.
  - Ruling 2: line 44 takes the number only, and line 46 sends the title of an entry with no open plan to a sentence. Line 60 says it again.
  - Ruling 3: line 44 and line 137 accept the number followed by the title.
  - Ruling 4: lines 41 and 42 name the same three bullets by what each matches.
  - Ruling 5: line 214 names a number that matches no entry.
  - Ruling 6: line 125.
  - Grepped for the renamed subsection ("An entry with no open plan"): no sentence made false.
- 3: holds. The rerun prints `1010 5.2.0`.
- 4: holds. Each name the round changed was grepped across `skills/`, `docs/`, `utils/` and `README.md`: "the folder forms", "a folder form", "next three bullets" and the old subsection name. None remains in the skill, and none appears elsewhere as a reference to it. The opening paragraph, Quick start, "What it reads" 4, 5 and 8, the Stops rows, the Anti-patterns rows and the Rules are consistent with one another.
- 5: holds. README.md line 22 was not changed in the round. It says the two additions and states nothing the round makes false, because it names neither a title nor a number.

Cases of the brief and of the round. Each is walked through "What it reads" 1 by line number, in order: 36 `skills`, 37 `skills` and words, 38 no argument, 39 folder alone, 40 missing plan.yaml or key, 41 and 42 folder or project in front, 43 open-plan entry, 44 number of an entry with no open plan, 45 unmatched number, 46 anything else.

- `/ordo-help skills`: met. Line 36 decides it. "Steps / skills" 3 prints `/<name>`, the line, then the block, and skips a folder with no `SKILL.md` (line 104).
- `/ordo-help I want to revise a paper`: met. Lines 36-45 do not match, since `I` is no folder, no project and no entry, so line 46 decides it. Step 3 gives `paper`, the line `/paper revision <main.tex> <comments file>` and the mode `revision` (line 125). Rules line 214 prints no sequence.
- `... someone asked me to review a manuscript for a journal`: met. Line 46 decides it. `referee` fits through its description and the Use instead row of `paper` (line 123). Its line is `/referee <manuscript>`, which has no mode word, so the mode is what the comment says it runs (line 125).
- `... I want to bake bread`: met. Line 46 decides it, and step 4 prints the no-fit line naming `/ordo-help skills`.
- `/ordo-help 13` with plan 13 open: met. Line 43 decides it (`.scratch/13-researcher/plan.md` opens `# Plan: 13. researcher`).
- The number of an open entry with a gate and no open plan: met by reading. Line 44 decides it, and "Steps / The number of an entry with no open plan" 1 names `/plan <entry>`. No such entry is on the tree: `docs/roadmap.md` has `## 13. researcher` as the only open entry.
- `/ordo-help 4.A`: met. Its plan is under `archive_root`, so line 43 does not match. Line 44 does match, and `docs/roadmap.md:60` holds `- [x] 4.A ordo-help skills`, so the line says the entry is done.
- `<folder>/<entry>` and `<project>/<entry>` with a plan open: met. Line 41 strips the folder or project, and line 43 decides the rest.
- `/ordo-help researcher`: met. Line 43 decides it, since entry 13 has an open plan, and the position is printed. `/ordo-help I want to work on researcher`: met. It is not a whole title, so line 46 decides it and it is a sentence.
- `I want to revise a paper` with no plan.yaml found: met. Line 40 decides it: a sentence, with no roadmap read. Step 2 of the sentence form reads the configuration only when a plan.yaml is found (line 56).
- `I want my paper reviewed and then revised`: met. Line 46 decides it. Line 126 gives the order, step 5 prints the order line, and step 6 prints each skill.
- `/ordo-help` with no argument: met, line 38. `/ordo-help <folder>` with a plan.yaml: met, line 39.
- Round cases:
  - `/ordo-help paper`: met. No line from 36 to 45 matches, because `paper` is not a roadmap number and entry 5 `paper` has no open plan. Line 46 decides it, and `paper` is printed.
  - `/ordo-help wizard`: met, by the same walk, and `wizard` is printed.
  - `/ordo-help 4.A ordo-help skills`: met. Line 37 does not match, since the argument does not begin with `skills`. Line 44 matches: the number followed by its title, and the roadmap title is `ordo-help skills`.
  - `/ordo-help 13` with a required key missing: met. Line 40 decides it before line 43: a sentence, no roadmap read, and the no-fit line is printed.
  - `/ordo-help` with a required key missing: met. Line 38 decides it, and the refusal comes through "What it reads" 4 and the Stops row.
  - `/ordo-help <folder>` with a required key missing: met. Line 39 decides it, and the refusal names the key.
  - `/ordo-help <folder>/37` with no entry 37: met. Line 41 reads `37` by line 45 and prints the no-fit line. Line 42 would reach the same answer.
  - `/ordo-help I want to review a step`: met. Line 46 decides it. `/refute` is printed with its line `/refute <entry> <step>`, and by line 125 the mode is what the comment says it runs.
  - `skills and more words`: met. Line 37 decides it and it is a sentence.

I found no input that the order of these bullets sends to the wrong form. The one input whose form is not decided by the text is under Spec 1.

### Findings

**1. Spec**

- SKILL.md:40 and 39: "With no `plan.yaml` found, or with one whose required key is missing, no argument and a folder named alone are refused as "What it reads" 4 says, and every other argument ... is a sentence". Line 39 defines the folder form as "A folder that holds a `plan.yaml`". What is wrong: with no `plan.yaml` found anywhere, a word that names an existing folder without a `plan.yaml` is not a folder under line 39, and the text does not say whether line 40 calls it "a folder named alone". The brief keeps the refusal for a folder alone and answers every other argument. Failure scenario: in a manuscript repository with a `paper/` folder and no `plan.yaml`, `/ordo-help paper` is refused with a missing key by one reader and answered as a sentence naming the skill `paper` by another. Verdict: none. Item 2 still holds for the brief's cases.

**2. Proof**

- `.scratch/13-researcher/agents/reviews/5-report.md`, "Verify 4": "the bullets of lines 40 to 44 run 30 to 50 words". What is wrong: `wc -w` on the lines gives 50, 75, 53, 34 and 38 for lines 40 to 44. Lines 41 and 42 are 75 and 53 words, over the stated range. Lines 125 (52 words) and 68 (50 words) are also long and are not named as departures. Line 125 names its form. Decision resting on it: whether verify 4 is complete, which the landing reads. Failure scenario: the orchestrator accepts the departure list as it stands and lands sentences of 75 and 53 words with no stated reason. Verdict: none.

**3. Standards**

- SKILL.md:41-42: "and the rest is then read, as the whole argument, by the bullets on an entry that has an open plan, on the number of an entry with no open plan and on a number that matches no entry" and "A folder or a project followed by words that match none of the bullets on an entry that has an open plan, on the number of an entry with no open plan and on a number that matches no entry makes the whole argument a sentence". What is wrong: two bullets of 75 and 53 words restate the same three-bullet list that lines 43-45 already carry, and line 42 gives the same outcome as line 46. The prose standard E (Sentence length, "under roughly 20 words unless the mechanism needs more") and `docs/dev/skill-layout.md` "Writing for an agent" ("One meaning has one place") are not met, because the names of the three bullets are written twice in a row and a reader checking the first match must hold them in mind. Failure scenario: a reader who edits one of the three bullets later changes only some of the lists, and `<folder>/<entry>` then reads differently from `<entry>`. Verdict: none.

**4. Behaviour**

- "Host- or user-visible changes, before and after" of the builder's report: "`/ordo-help <number of an entry with no open plan>`, alone or followed by its title: before, the refusal "No ledger folder"". What is wrong: the first refuter's Behaviour 1 stands unanswered in this report. For `4.A`, whose archived plan sits under `ledger_root` (`.scratch/archive/4-a-ordo-help-skills/`), the report's own first run says the old result was "the archived plan's position or the refusal", and line 58 now reads only "the folder of the open plan". The change list gives the before as the refusal alone. Failure scenario: a reader of the list does not learn that `/ordo-help <archived entry>` may have printed the archived plan's position before and now prints "done". This also bears on the minor version bump (see Declined to judge). Verdict: none.

### Declined to judge

- Brief verify 3 as written, `git diff --stat` with no base: not run. I ran `git diff 6dacf2b --stat`, which names the same two files. `git log --oneline 6dacf2b..HEAD` would show whether the worktree has commits past the base.
- `.scratch/13-researcher/agents/briefs/5-round-1.md` is untracked in the worktree, and the brief's paths list only `5-report.md` under `.scratch`. Who wrote it, and whether it is part of the step's change, is not settled by `git status --short`. `git log` in the main checkout, or the dispatch entry, would settle it.
- Whether the old "the folder under `<ledger_root>/`" took in `<ledger_root>/archive/...`, and so whether the minor bump to 5.2.0 holds against `docs/dev/skill-layout.md` Frontmatter (Behaviour 1). A run of `/ordo-help 4.A` at 6dacf2b would settle it, and this review cannot make it.
- Whether a session running the sentence form picks the skills the cases expect: judged by reading only. A run of the installed skill would settle it.
- Which skill line a bare word such as `paper` or `wizard` selects among several Quick start lines (line 124): a judgment of the session, not settled by the text.

Reviewer usage: agent a3dcc47add2b65486, claude-sonnet-5-5, 123214 tokens, 11 tool uses, 2 minutes.

## Closed

First run:

- Spec 1, 2 and 3, Standards 1, 2 and 3: closed by the builder in repair round 1, rulings 1 to 6 of `agents/briefs/5-round-1.md`; the run over round 1 gives item 2 and every case as holding.
- Proof 1, Standards 4 and Behaviour 1: closed with no change. No output of the skill depends on them.

Run over round 1:

- Spec 1: fixed at landing. The bullet on a missing `plan.yaml` or a missing required key says which folder it means.
- Proof, Standards and Behaviour: closed with no change. No output of the skill depends on them.
