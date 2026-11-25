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
