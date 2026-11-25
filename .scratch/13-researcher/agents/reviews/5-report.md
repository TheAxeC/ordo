# Report: step 5 of the plan of roadmap entry 13

Everything in the brief is done, with the six rulings of repair round 1 (`.scratch/13-researcher/agents/briefs/5-round-1.md`).

## Open items of the state file, verbatim

- none.

## The cases' first run

### The brief's cases, read on the unchanged tree at 6dacf2b, before any change

Each case was checked by reading `skills/ordo/ordo-help/SKILL.md` as it stood (`cat -n`), `docs/roadmap.md` and the `# Plan:` lines of `.scratch/*/plan.md` and `.scratch/archive/*/plan.md` (`head -1`).

- `/ordo-help skills`: unmet. "Steps / skills" 3 printed `/<name>` and then the Quick start block, with no line on what the skill is for; a folder with no `SKILL.md` was skipped.
- `/ordo-help I want to revise a paper`: unmet. "What it reads" 1 read any argument other than `skills` as `<entry>`, and "What it reads" 5 made a missing ledger folder the refusal "No ledger folder".
- `/ordo-help someone asked me to review a manuscript for a journal`: unmet, the same refusal.
- `/ordo-help I want to bake bread`: unmet, the same refusal, with no line naming `/ordo-help skills`.
- `/ordo-help 13` with a plan open for entry 13: met. `.scratch/13-researcher/plan.md` opens with `# Plan: 13. researcher`, and "Steps / The sequence and the plans" printed the position.
- `/ordo-help` followed by the number of an open entry with a gate and no open plan: partial. The refusal "No ledger folder" named `/plan`, but as a refusal. The tree holds no such entry: the open order of `docs/roadmap.md` holds entry 13 alone, which has a plan.
- `/ordo-help 4.A`, a done entry: unmet. `.scratch/archive/4-a-ordo-help-skills/plan.md` opens with `# Plan: 4.A ordo-help skills`, under `ledger_root` (`.scratch`), and "What it reads" 5 said only "the folder under `<ledger_root>/`", so the result was the archived plan's position or the refusal naming `/plan`; no line said the entry is done.
- `/ordo-help <folder>/<entry>` and `/ordo-help <project>/<entry>` with a plan open: met, through "What it reads" 4, which read the folder and the project as `/plan`'s "What it reads" 1 does.
- `/ordo-help researcher`, the title of entry 13: unmet. "What it reads" 5 matched `# Plan: <entry>` by "the number, or the number and title", so a title alone found no folder and was refused. `/ordo-help I want to work on researcher`: unmet, refused as an entry.
- `/ordo-help I want to revise a paper` where no `plan.yaml` is found: unmet. "What it reads" 4 read the configuration as `/plan` does, whose missing configuration is a stop.
- `/ordo-help I want my paper reviewed and then revised`: unmet, the refusal "No ledger folder".
- `/ordo-help` with no argument, and `/ordo-help <folder>`: met.

No case is one the brief's own rules get wrong.

### The cases of repair round 1, read on the text as it stood before the round

Each was walked through "What it reads" 1 of the text the first report described.

- `/ordo-help paper`, `/ordo-help wizard`: unmet. The bullet on "the number or the title of a roadmap entry with no open plan" matched `paper` (done entry 5) and `wizard` (dropped entry 21), so each got a line that the entry is done or dropped, not the skill.
- `/ordo-help researcher`: met, the position of plan 13.
- `/ordo-help 4.A`: met, one line that the entry is done. `/ordo-help 4.A ordo-help skills`: unmet. The bullet for an entry with no open plan took "the number or the title" only, so the number followed by the title fell through to a sentence.
- `/ordo-help 13` with a `plan.yaml` that lacks a required key: not settled by the text. The bullet on an entry with an open plan stood before the bullet on a missing key, so the first match needed the roadmap that the missing key leaves unread.
- `/ordo-help` and `/ordo-help <folder>` with a required key missing: met, the refusal with the key.
- `/ordo-help <folder>/37` with no entry 37: unmet. "The next three bullets" after the folder bullet were the folder-followed-by-words bullet and the two entry bullets, not the bullet on a number that matches no entry, so `37` made the whole argument a sentence.
- `/ordo-help I want to review a step`: unmet. The mode was "the word that follows the skill's name", which on `/refute <entry> <step>` is `<entry>`.

### The same cases on the text now

- `/ordo-help paper`, `/ordo-help wizard`: "What it reads" 1, line 46, a sentence; "Steps / A sentence on what you want to do" 3 chooses `paper`, or `wizard`.
- `/ordo-help researcher`: line 43, the position of plan 13.
- `/ordo-help 4.A` and `/ordo-help 4.A ordo-help skills`: line 44, then "Steps / The number of an entry with no open plan" 1: one line that the entry is done.
- `/ordo-help 13` with a required key missing: line 40, a sentence answered with no roadmap read; no skill fits, so "Steps / A sentence on what you want to do" 4 prints its line.
- `/ordo-help` and `/ordo-help <folder>` with a required key missing: line 40 and "What it reads" 4, the refusal "A required key missing".
- `/ordo-help <folder>/37` with no entry 37: line 41, the rest `37` read by the bullet on a number that matches no entry, line 45: the line that no skill fits.
- `/ordo-help I want to review a step`: `/refute`, its line `/refute <entry> <step>`, which line 125 says has no mode word, so its mode is what the comment says it runs.
- The brief's cases: `skills`, revise a paper, referee, bake bread, `13`, an open entry's number, `4.A`, `<folder>/<entry>`, `<project>/<entry>`, `researcher`, "I want to work on researcher" (line 46, a sentence), revise a paper with no `plan.yaml` (line 40), reviewed then revised (step 3's order of use and step 5's line), no argument and `<folder>`: each gives its expected result.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 `skills` mode: one line on what the skill is for under `/<name>`, written in the run from the description, at most 25 words; Quick start copied line for line; Rules bullet and Anti-patterns row changed | DONE | `grep -n 'one line on what' skills/ordo/ordo-help/SKILL.md` prints lines 3, 10, 19 and 106; line 106: "Under that line, print one line on what the skill is for: one sentence of at most 25 words, written in this run from the frontmatter `description` of the `SKILL.md` this step reads, holding nothing the description does not say." |
| 2 Sentence form: argument order, the reading with no `plan.yaml` or a key missing, what it reads, at most three skills with name, mode, command and why, order of use, none fits, the number of an entry with no open plan answered from the roadmap, "No ledger folder" row removed, writes nothing, invokes no skill, starts no agent | DONE | "What it reads" 1 (lines 35 to 46), "Steps / A sentence on what you want to do" (line 112 on), "Steps / The number of an entry with no open plan" (line 135 on), Stops (two rows), Rules lines 214 to 216, read in `git diff skills/ordo/ordo-help/SKILL.md` |
| 3 Frontmatter: two additions, at most 1,024 characters, triggers, version 5.2.0 | DONE | Verify 2 below prints `1010 5.2.0` |
| 4 Every section says what holds | DONE | Read against the diff; `grep -n -E 'entry with no open plan\|folder form\|next three\|title' skills/ordo/ordo-help/SKILL.md` prints no "folder form" and no "next three", and each "entry with no open plan" line names the number |
| 5 `README.md` line 22 | DONE | `git diff README.md` shows only line 22 changed; it names neither a title nor a number, so the round leaves it true |
| Round ruling 1 (key missing in front of the entry bullets, two exceptions named, Stops and "What it reads" 4 and 8) | DONE | lines 40, 57, 68 and the Stops rows (lines 199 and 200) |
| Round ruling 2 (a title of an entry with no open plan is a sentence) | DONE | lines 44, 46 and 60 |
| Round ruling 3 (number followed by title for an entry with no open plan) | DONE | lines 44, 60 and 137 |
| Round ruling 4 (the folder bullets name the same three bullets by what each matches) | DONE | lines 41 and 42 |
| Round ruling 5 (Rules bullet names a number that matches no entry) | DONE | line 214 |
| Round ruling 6 (a placeholder is no mode word) | DONE | line 125 |
| Verify 1 character-set check | DONE | `printf '%s\0' skills/ordo/ordo-help/SKILL.md README.md \| xargs -0 perl -CSD -ne '...'; echo "exit $?"` printed nothing and then `exit 0` |
| Verify 2 description length and version | DONE | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/ordo/ordo-help/SKILL.md").read().split("---")[1]); print(len(d["description"]), d["metadata"]["version"])'` printed `1010 5.2.0` |
| Verify 3 diff stat | DONE | `git diff --stat` printed ` README.md                      \|   2 +-`, ` skills/ordo/ordo-help/SKILL.md \| 101 +++++++++++++++++++++++++++++++----------`, ` 2 files changed, 78 insertions(+), 25 deletions(-)` |
| Verify 4 list items and sentence length | DONE | Read; departures listed below |
| Verify 5 D15 and D33 clause by clause | DONE | Mapping below |

### Verify 4: departures from the rules on list items and sentence length

- The frontmatter `description` keeps its first sentence of over 80 words, which the brief does not ask to change; the two additions are each one sentence (31 and 21 words).
- "What it reads" 1, the bullets of lines 40 to 44 run 30 to 50 words. Each names one form with the condition that decides it. Lines 41 and 42 name the three bullets they mean by what each matches, as ruling 4 asks. The layout keeps a qualifier that changes a rule in the rule's bullet.
- Line 40 holds both the refusal of no argument and a folder named alone and the sentence reading of every other argument. Ruling 1 states them as one rule with its two exceptions, so they stay in one bullet.
- "Steps / A sentence on what you want to do" 6 names three parts of one printed answer (name with mode, command, sentence on why) in one item. They are one print action whose output shape the brief fixes, so they stay in one item.
- "Steps / A sentence on what you want to do" 4: "The step is done when the line is printed, and the run ends there." joins the completion criterion and the end of the run, since the end of the run follows from the criterion.
- The Stops row "No stop" keeps its one long cell, as before, with the forms that refuse nothing added.

### Verify 5: rulings D15 and D33, clause by clause

- D15 "`/ordo-help skills` prints per skill one line on what it is for": line 106, and line 103 "print the skill's name line, its line on what it is for and its Quick start block".
- D15 "then its Quick start block": line 107, "Under the line on what the skill is for, print the lines of the code block under `## Quick start` ...".
- D15 "ordo-help can help a user select a skill based on what a user wants to do": line 114 and "Steps / A sentence on what you want to do" 3, line 121 "Choose the skills that fit the sentence, at most three, the best fit first."
- D15 "as well as say which modes to use": line 125 "The mode is the word that follows the skill's name on that line ...", and line 132 "print its name `/<name>` with its mode, the command to type as its Quick start line writes it ...".
- D15 "as in `/ordo-help I want to revise a paper`": line 114 and the Quick start line 20.
- D33 "no extra word": line 20, `/ordo-help <what you want to do>`, and line 46 "Any other argument, the title of a roadmap entry with no open plan included, is a sentence on what you want to do".
- D33 "the skill first checks whether the text is `skills`": line 36 "An argument that is exactly `skills` is the `skills` mode, before anything is matched ...".
- D33 "a folder": lines 39, 41 and 42.
- D33 "or the number or title of an entry that has an open plan": line 43 "An argument that is, whole, the number, the title, or the number and title of a roadmap entry that has an open plan is `/ordo-help <entry>`".
- D33 "and reads anything else as what the user wants to do": line 46, which includes the title of an entry with no open plan. The number of an entry with no open plan (line 44) and a number that matches no entry (line 45) are answered from the roadmap and by the no-fit line, as decision 2 of the brief, narrowed by ruling 2 of the round, says.

## The terms

- **open plan**: used in a new place, "What it reads" 5, "the folder of the open plan whose `plan.md` opens with `# Plan: <entry>`", and in the Steps subsection names and "What it reads" 1. The entry defines it as a plan under `ledger_root`, outside `archive_root`, whose `plan.md` opens with `# Plan: <entry>`. The use matches, and it keeps an archived plan such as 4.A out of the position form.
- **roadmap entry**: used in "What it reads" 1 and the new subsections, in the sense of the entry.
- **Not yet specified**: used in "What it reads" 8 and "Steps / The number of an entry with no open plan" for the roadmap section, the sense of the entry.
- **`projects:` form**: used in "What it reads" 1 as the entry defines it.
- **plan configuration**, **refusal**, **sequence, the**, **position line** (as "position"): used as before.
- "a sentence on what you want to do" is plain words, no new term, as item 2 asks; no glossary entry is added.

## Files with line counts

- `skills/ordo/ordo-help/SKILL.md`: 216 lines (`wc -l`), 77 added and 24 removed (`git diff --numstat`).
- `README.md`: 263 lines, 1 added and 1 removed, line 22.
- `.scratch/13-researcher/agents/reviews/5-report.md`: this report.

## Judgment calls the brief left open

- The answer to the number of an entry with no open plan is a Steps subsection of its own, "### The number of an entry with no open plan", since it prints a line and is neither the sequence nor the sentence form.
- A `SKILL.md` with no Quick start block still gets its line on what the skill is for, between its name line and `no Quick start block`, since item 1 puts the line under every skill's name line.
- With no `plan.yaml` found, no argument and a folder named alone are refused as "What it reads" 4 says (through `/plan`'s reading), and with a required key missing they get the Stops row "A required key missing".
- The `/plan <entry>` line for an entry named with its folder or project keeps that folder or project in front, since `/plan` reads it there.
- The Quick start line of `<entry>` gains "; for the number of an entry with no open plan, what the roadmap says of it", since its old comment no longer held for such an entry.
- The Anti-patterns table gains a row for the sentence form beside the changed `skills` row.
- The Use instead table is unchanged: each row still holds.

## Host- or user-visible changes, before and after

- `/ordo-help skills`: before, per skill `/<name>` and its Quick start block; after, `/<name>`, one line on what the skill is for, then the block.
- `/ordo-help <sentence>`: before, the refusal "No ledger folder"; after, at most three skills, each with its mode, its command and why it fits, the order of use when there is one, or one line that no skill fits naming `/ordo-help skills`.
- `/ordo-help <title of a skill>`, such as `/ordo-help paper`: before, refused; after, a sentence that names the skill.
- `/ordo-help <number of an entry with no open plan>`, alone or followed by its title: before, the refusal "No ledger folder"; after, `/plan <entry>`, `/roadmap add <entry>`, or a line that the entry is done or dropped.
- `/ordo-help <number that matches no entry>`: before, refused; after, the line that no skill fits.
- `/ordo-help <title of an entry with an open plan>`: before, refused; after, the plan's position.
- Any argument but no argument and a folder named alone, where no `plan.yaml` is found or a required key is missing: before, a refusal; after, a sentence answered with no roadmap read.
- Stops: the row "No ledger folder" is removed, since every argument it refused is now answered.
- Frontmatter: before, version "5.1.0", description 817 characters; after, "5.2.0", 1010 characters, with the triggers "which skill do I use for" and "which command do I type to".
- `README.md` line 22: before, "... For `skills` it prints the name and the Quick start block of every skill instead"; after, "... For `skills` it prints the name, one line on what the skill is for and the Quick start block of every skill instead. For a sentence on what you want to do, such as `/ordo-help I want to revise a paper`, it names the skills that fit, each with its mode and the command to type".
- Sentences about the file as a whole, reread after the change:
  - The opening paragraph (line 10) names the four forms.
  - The Rules bullet "The skill writes nothing." still holds, since no form writes.
  - The Stops row "No stop" names each form that refuses nothing.
- Other files that name `ordo-help` (`grep -rn --exclude-dir=.scratch ordo-help skills utils docs README.md`) all still hold:
  - the rows `/ordo-help <entry>` of other skills;
  - `docs/glossary.md` lines 44, 68, 85 and 118;
  - `README.md` lines 39 and 67;
  - `docs/figures/gen_figures.py` lines 2242 and 2349 ("starts no agent and has no stop").
- The glossary's citation of "Steps / The sequence and the plans" 3 still names that step. `grep -rn 'An entry with no open plan' skills docs README.md` prints nothing, so the renamed subsection is named nowhere else.

## Wrong or impossible in the brief

- Item 2's bullet on an entry with an open plan says "that plan's position, as today". The old "What it reads" 5 did not match a title alone, so `/ordo-help researcher` was refused on the unchanged tree. The text now matches the title, as item 2 and the case on `researcher` ask.
- The case "the number of an open roadmap entry with a gate and no open plan" has no instance on the tree: the open order of `docs/roadmap.md` holds only entry 13, which has a plan. It was read against the text, not against a real entry.
- The round's brief names the findings file `.scratch/13-researcher/agents/reviews/5-refuter.md`, which is not in this worktree (`cat` printed "No such file or directory"). The six rulings state each change in full, and the round was built from them.
