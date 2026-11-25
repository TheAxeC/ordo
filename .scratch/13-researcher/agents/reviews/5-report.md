# Report: step 5 of the plan of roadmap entry 13

Everything in the brief is done.

## Open items of the state file, verbatim

- none.

## The cases' first run (read on the unchanged tree at 6dacf2b, before any change)

Each case was checked by reading `skills/ordo/ordo-help/SKILL.md` as it stood (`cat -n`), `docs/roadmap.md` and the `# Plan:` lines of `.scratch/*/plan.md` and `.scratch/archive/*/plan.md` (`head -1`).

- `/ordo-help skills`: unmet. "Steps / skills" 3 printed `/<name>` and then the Quick start block, with no line on what the skill is for; a folder with no `SKILL.md` was skipped.
- `/ordo-help I want to revise a paper`: unmet. "What it reads" 1 read any argument other than `skills` as `<entry>`, and "What it reads" 5 made a missing ledger folder the refusal "No ledger folder".
- `/ordo-help someone asked me to review a manuscript for a journal`: unmet, the same refusal.
- `/ordo-help I want to bake bread`: unmet, the same refusal, with no line naming `/ordo-help skills`.
- `/ordo-help 13` with a plan open for entry 13: met. `.scratch/13-researcher/plan.md` opens with `# Plan: 13. researcher`, and "Steps / The sequence and the plans" printed the position.
- `/ordo-help` followed by the number of an open entry with a gate and no open plan: partial. The refusal "No ledger folder" named `/plan`, but as a refusal. The tree holds no such entry: the open order of `docs/roadmap.md` holds entry 13 alone, which has a plan.
- `/ordo-help 4.A`, a done entry: unmet. `.scratch/archive/4-a-ordo-help-skills/plan.md` opens with `# Plan: 4.A ordo-help skills`, under `ledger_root` (`.scratch`), and "What it reads" 5 said only "the folder under `<ledger_root>/`", so the archived plan's position or the refusal naming `/plan` was the result; no line said the entry is done.
- `/ordo-help <folder>/<entry>` and `/ordo-help <project>/<entry>` with a plan open: met, through "What it reads" 4, which read the folder and the project as `/plan`'s "What it reads" 1 does.
- `/ordo-help researcher`, the title of entry 13: unmet. "What it reads" 5 matched `# Plan: <entry>` by "the number, or the number and title", so a title alone found no folder and was refused. `/ordo-help I want to work on researcher`: unmet, refused as an entry.
- `/ordo-help I want to revise a paper` where no `plan.yaml` is found: unmet. "What it reads" 4 read the configuration as `/plan` does, whose missing configuration is a stop.
- `/ordo-help I want my paper reviewed and then revised`: unmet, the refusal "No ledger folder".
- `/ordo-help` with no argument, and `/ordo-help <folder>`: met.

No case is one the brief's own rules get wrong: each expected result follows from item 2's rules. The case on a title differs from the brief's premise "as today" (see the last section), and the rule of item 2 that the title is matched gives the expected result.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 `skills` mode: one line on what the skill is for under `/<name>`, written in the run from the description, at most 25 words; Quick start copied line for line; Rules bullet and Anti-patterns row changed | DONE | `grep -n 'one line on what' skills/ordo/ordo-help/SKILL.md` prints lines 3, 10, 19 and 106; line 106: "Under that line, print one line on what the skill is for: one sentence of at most 25 words, written in this run from the frontmatter `description` of the `SKILL.md` this step reads, holding nothing the description does not say." |
| 2 Sentence form: argument order, no-`plan.yaml` reading, what it reads, at most three skills with name, mode, command and why, order of use, none fits, entry with no open plan answered from the roadmap, "No ledger folder" row removed, writes nothing, invokes no skill, starts no agent | DONE | "What it reads" 1 (lines 35 to 46), "Steps / A sentence on what you want to do" (line 112 on), "Steps / An entry with no open plan", Stops (two rows), Rules lines 214 to 216, read in the diff (`git diff skills/ordo/ordo-help/SKILL.md`) |
| 3 Frontmatter: two additions, at most 1,024 characters, triggers, version 5.2.0 | DONE | Verify 2 below prints `1010 5.2.0` |
| 4 Every section says what holds | DONE | Read against the diff; the sentences on the file as a whole are listed under "Every host- or user-visible change" |
| 5 `README.md` line 22 | DONE | `git diff README.md` shows only line 22 changed |
| Verify 1 character-set check | DONE | `printf '%s\0' skills/ordo/ordo-help/SKILL.md README.md \| xargs -0 perl -CSD -ne '...'; echo "exit $?"` printed nothing and then `exit 0` |
| Verify 2 description length and version | DONE | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/ordo/ordo-help/SKILL.md").read().split("---")[1]); print(len(d["description"]), d["metadata"]["version"])'` printed `1010 5.2.0` |
| Verify 3 diff stat | DONE | `git diff --stat` printed ` README.md                      \|   2 +-`, ` skills/ordo/ordo-help/SKILL.md \| 101 +++++++++++++++++++++++++++++++----------`, ` 2 files changed, 78 insertions(+), 25 deletions(-)` |
| Verify 4 list items and sentence length | DONE | Read; departures listed below |
| Verify 5 D15 and D33 clause by clause | DONE | Mapping below |

### Verify 4: departures from the rules on list items and sentence length

- The frontmatter `description` keeps its first sentence of over 80 words, which the brief does not ask to change; the two additions are each one sentence (31 and 21 words).
- "What it reads" 1, the bullets of lines 40, 42 and 44 run 30 to 40 words: each names one form with the condition that decides it, and the layout keeps a qualifier that changes a rule in the rule's bullet.
- "Steps / A sentence on what you want to do" 6 names three parts of one printed answer (name with mode, command, sentence on why) in one item: they are one print action whose output shape the brief fixes, so one item.
- "Steps / A sentence on what you want to do" 4: "The step is done when the line is printed, and the run ends there." joins the completion criterion and the end of the run, since the end of the run is what the criterion leads to; the same shape is not used elsewhere.
- The Stops row "No stop" keeps its one long cell, as before, with the forms that refuse nothing added.

### Verify 5: rulings D15 and D33, clause by clause

- D15 "`/ordo-help skills` prints per skill one line on what it is for": line 106, and line 103 "print the skill's name line, its line on what it is for and its Quick start block".
- D15 "then its Quick start block": line 107, "Under the line on what the skill is for, print the lines of the code block under `## Quick start` ...".
- D15 "ordo-help can help a user select a skill based on what a user wants to do": line 114 and "Steps / A sentence on what you want to do" 3, line 121 "Choose the skills that fit the sentence, at most three, the best fit first."
- D15 "as well as say which modes to use": line 125 "The mode is the word that follows the skill's name on that line ..." and line 132 "print its name `/<name>` with its mode, the command to type as its Quick start line writes it ...".
- D15 "as in `/ordo-help I want to revise a paper`": line 114 and the Quick start line 20.
- D33 "no extra word": line 20, `/ordo-help <what you want to do>`, and line 45 "Any other argument is a sentence on what you want to do".
- D33 "the skill first checks whether the text is `skills`": line 36 "An argument that is exactly `skills` is the `skills` mode, before anything is matched ...".
- D33 "a folder": lines 39 to 41.
- D33 "or the number or title of an entry that has an open plan": line 42 "An argument that is, whole, the number, the title, or the number and title of a roadmap entry that has an open plan is `/ordo-help <entry>`".
- D33 "and reads anything else as what the user wants to do": line 45, with the entries with no open plan and the unmatched numbers read as decision 2 of the brief says (lines 43 and 44).

## The terms

- **open plan**: used in a new place, "What it reads" 5, "the folder of the open plan whose `plan.md` opens with `# Plan: <entry>`", and in the Steps subsection names. The entry defines it as a plan under `ledger_root`, outside `archive_root`, whose `plan.md` opens with `# Plan: <entry>`; the use matches, and it keeps an archived plan such as 4.A out of the position form.
- **roadmap entry**: used in "What it reads" 1 and the new subsection, in the sense of the entry.
- **Not yet specified**: used in "What it reads" 8 and "Steps / An entry with no open plan" for the roadmap section, the sense of the entry.
- **`projects:` form**: used in "What it reads" 1 as the entry defines it.
- **plan configuration**, **refusal**, **sequence, the**, **position line** (as "position"): used as before.
- "a sentence on what you want to do" is plain words, no new term, as item 2 asks; no glossary entry is added.

## Files with line counts

- `skills/ordo/ordo-help/SKILL.md`: 216 lines (`wc -l`), 77 added and 24 removed (`git diff --numstat`).
- `README.md`: 263 lines, 1 added and 1 removed, line 22.
- `.scratch/13-researcher/agents/reviews/5-report.md`: this report.

## Judgment calls the brief left open

- The answer to an entry with no open plan is a Steps subsection of its own, "### An entry with no open plan", since it prints a line and is neither the sequence nor the sentence form.
- A `SKILL.md` with no Quick start block still gets its line on what the skill is for, between its name line and `no Quick start block`, since item 1 puts the line under every skill's name line.
- The mode of a Quick start line with no mode word, such as `/referee <manuscript>`, is what the line's comment says it runs.
- The no-`plan.yaml` reading keeps the refusal "A required key missing" for `/ordo-help` with no argument and the folder forms, and reads every other argument as a sentence, as item 2's bullet "an argument other than `skills` and a folder is a sentence" says.
- The `/plan <entry>` line for an entry named with its folder or project keeps that folder or project in front, since `/plan` reads it there.
- The Quick start line of `<entry>` gains "; for an entry with no open plan, what the roadmap says of it", since its old comment no longer held for such an entry.
- The Anti-patterns table gains a row for the sentence form beside the changed `skills` row.
- The Use instead table is unchanged: each row still holds.

## Host- or user-visible changes, before and after

- `/ordo-help skills`: before, per skill `/<name>` and its Quick start block; after, `/<name>`, one line on what the skill is for, then the block.
- `/ordo-help <sentence>`: before, the refusal "No ledger folder"; after, at most three skills, each with its mode, its command and why it fits, the order of use when there is one, or one line that no skill fits naming `/ordo-help skills`.
- `/ordo-help <entry with no open plan>`: before, the refusal "No ledger folder"; after, `/plan <entry>`, `/roadmap add <entry>`, or a line that the entry is done or dropped.
- `/ordo-help <title of an entry with an open plan>`: before, refused; after, the plan's position.
- Any argument but `skills` and the folder forms where no `plan.yaml` is found or a required key is missing: before, a refusal; after, read as a sentence.
- Stops: the row "No ledger folder" is removed, since every argument it refused is now answered.
- Frontmatter: before, version "5.1.0", description 817 characters; after, "5.2.0", 1010 characters, with triggers "which skill do I use for" and "which command do I type to".
- `README.md` line 22: before, "... For `skills` it prints the name and the Quick start block of every skill instead"; after, "... For `skills` it prints the name, one line on what the skill is for and the Quick start block of every skill instead. For a sentence on what you want to do, such as `/ordo-help I want to revise a paper`, it names the skills that fit, each with its mode and the command to type".
- Sentences about the file as a whole, reread after the change: the opening paragraph (line 10) names the four forms; Rules "The skill writes nothing." still holds, since no form writes; the Stops row "No stop" names each form that refuses nothing. Other files that name `ordo-help` (`grep -rn --exclude-dir=.scratch ordo-help skills utils docs README.md`): the rows `/ordo-help <entry>` of other skills, `docs/glossary.md` lines 44, 68, 85 and 118, `README.md` lines 39 and 67, and `docs/figures/gen_figures.py` lines 2242 and 2349 ("starts no agent and has no stop") all still hold; the glossary's citation of "Steps / The sequence and the plans" 3 still names that step.

## Wrong or impossible in the brief

- Item 2's bullet on the entry with an open plan says "that plan's position, as today", but today's "What it reads" 5 matched only "the number, or the number and title", so a title alone was refused on the unchanged tree. The text now matches the title too, which item 2 and the case on `researcher` ask for.
- The case "the number of an open roadmap entry with a gate and no open plan" has no instance on the tree: the open order of `docs/roadmap.md` holds only entry 13, which has a plan. It was read against the text, not against a real entry.
