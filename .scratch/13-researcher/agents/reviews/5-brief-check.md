# Brief check: step 5 of the plan of roadmap entry 13 (brief `/Users/axelfaes/workspace/ordo/.scratch/13-researcher/agents/briefs/5.md`)

Tree read at `git log --oneline -1`, which printed `eafa0c8 Close open item A of roadmap entry 13 under self-rule ...`. I changed no file.

## Names

Command: `grep -rn --exclude-dir=.scratch --exclude-dir=.agents --exclude-dir=.git -E 'ordo-help|No ledger folder' . | grep -v '^./skills/ordo/ordo-help/SKILL.md'`. A second command found no test or script that reads ordo-help's output or its text: `grep -rln ... -E 'no Quick start block|ordo-help skills|what it is for|which skill' .` printed only `docs/roadmap.md` and `skills/ordo/ordo-help/SKILL.md`, and the `docs/roadmap.md` hit is the closed entry 4.A, which is history. Hits outside the brief's paths:

1. `README.md:39` "The order of use, shortened from what `/ordo-help` prints:" and `README.md:67` "`/ordo-help` prints the full sequence, including what to do when a command stops." Both stay true, because the forms that print the sequence do not change. `README.md:37` lists the group folders and is not affected.
2. `docs/figures/plan-loop.svg:101`, `docs/figures/gen_figures.py:2242` "/ordo-help starts no agent and has no stop", and `docs/figures/pipeline.svg:115`, `gen_figures.py:2349` "These start no agent: ... /wait-what and /ordo-help, which have no stop". These stay true only if the wish form starts no agent. Item 2 says "The wish form writes nothing and invokes no skill" but does not forbid starting an agent, so a builder could have a wish dispatch a lookup agent and make both figures false. Item 2's last bullet should read: "The wish form writes nothing, invokes no skill and starts no agent."
3. Other skills' rows: `skills/explain/wait-what/SKILL.md:23`, `skills/code/diagnose/SKILL.md:29`, `skills/orchestration/{land:26,grill:30,spec:27,roadmap:33,plan:31,plan-orchestration:29}` name `/ordo-help <entry>`, and `skills/ordo/session-retro/SKILL.md:29` names `/ordo-help`. All stay true.
4. The other skills' own "No ledger folder" rows (`diagnose:359`, `land:239`, `refute:201`, `spec:488`) belong to those skills and stay true.
5. `docs/glossary.md:68,85,118` and `skills/ordo/ordo-init/templates/plan-terms.md:63,80,113` (loop, plan skills, sequence) stay true. `docs/plan.yaml:1` stays true. `skills/ordo/ordo-init/SKILL.md:10` stays true. `docs/dev/` has no hit.
6. There is no glossary entry for the brief's own name "wish" or "wish form" (`grep -n -i wish docs/glossary.md` found none; that grep is part of the glossary grep above, which printed no wish line). `docs/dev/skill-layout.md`, "Writing for an agent", requires that a new term is added to `skills/ordo/ordo-init/templates/plan-terms.md` first, and ordo-help is a plan skill. Neither that file nor `docs/glossary.md` is in "Paths this step writes". The brief should do one of two things:
   - tell the builder to write the form in plain words in the skill ("a sentence on what you want to do") and never as the term "wish"; or
   - add `skills/ordo/ordo-init/templates/plan-terms.md` and `docs/glossary.md` to the paths, with the entry's text.

## The step line

The plan's line of step 5, mapped to the brief:

1. "`/ordo-help skills` prints per skill one line on what it is for and then its Quick start block": item 1. Covered.
2. "`/ordo-help <a sentence on what the user wants to do>` names the skill, the mode and the command": item 2, bullets 2 and 3. Covered.
3. "recognised as ruling D33 says": item 2, bullet 1. Partly covered; see Implied inputs 1 to 5.
4. "with the row of `ordo-help` in `README.md` saying so": item 5. Covered.
5. "check: the skill's text is read against rulings D15 and D33": no requirement carries it. "Verify before you report" items 1 to 4 are the character-set check, the description length, the diff stat and a reading against the standards' list and sentence rules, and the Report shape has no part for it. Add a verify item: "5. The changed text of `skills/ordo/ordo-help/SKILL.md` is read against rulings D15 and D33 of `plan.md`, Rulings, clause by clause, and the report gives, for each clause, the line of the skill that carries it."
6. "(1 commit)": this is the orchestrator's part and needs no requirement.

## Premises

1. `ls skills/ordo/ordo-help` printed `SKILL.md`. Holds.
2. The python3 length command of `docs/dev/skill-layout.md`, Frontmatter, printed `817 skills/ordo/ordo-help/SKILL.md`, and the frontmatter reads `version: "5.1.0"`. Holds.
3. The quotes of "What it reads" 1, "Steps / skills" 3, the Rules and the Stops row "No stop" match lines 34 to 36, 88 to 94, 163 and 149 of the SKILL.md (`cat -n`). Holds.
4. `grep -n '^| .ordo-help.' README.md` printed line 22 with the quoted text. Holds.
5. `grep -rn 'ordo-help <entry>' skills` printed rows in wait-what, diagnose, land, grill, spec, roadmap, plan and plan-orchestration. Holds.
6. `grep -l ordo-help docs/adr/*.md` printed nothing (exit 1). Holds.
7. The first-sentence premise is partly wrong. I split each description at its first sentence end with `python3 -c '...re.split(r"(?<=[.!?])\s",d,1)[0]...'`. That gives `diagnose` 401 characters, because its first sentence runs on after a colon. The shortest is `ordo-init` at 66 (65 without the full stop), and the longest is `grill` at 821. The brief's "51 (`diagnose`)" is the text before the colon, not the first sentence. The count of 23 skills holds. Decision 1 still stands, since many first sentences run far past 25 words. The premise and decision 1 should say "from 65 characters (`ordo-init`) to 820 (`grill`)" and drop or correct the `diagnose` example.
8. The D15 "quote" is a paraphrase inside quotation marks. The plan reads: "`/ordo-help skills` prints per skill one line on what it is for, then its Quick start block; "ordo-help can help a user select a skill based on what a user wants to do, as well as say which modes to use"". The builder reads the plan itself (Read 3), so this misleads little. The brief should quote it as written. The D33 quote holds.

## Cases and checks

1. No case covers the forms that today read the plan configuration through `/plan`'s "What it reads" 1 and that the new reading order puts at risk: `<folder>/<entry>`, the `projects:` form `<project>/<entry>`, an entry named by its title, and a call in a folder with no `plan.yaml`. The brief's `/ordo-help <folder>` case covers only the bare folder. Each case below should be added with its expected result (see Implied inputs for the reading each takes):
   - `/ordo-help I want to revise a paper` in a repository with no `plan.yaml`;
   - `/ordo-help <project>/<entry>` with a plan open;
   - `/ordo-help <folder>/<entry>` with no open plan;
   - `/ordo-help` followed by the title of an entry with an open plan;
   - `/ordo-help` followed by the number of a done entry.
2. Item 2's bullets "at most three, the best fit first" and "When several fit in an order of use ... it says the order" have no case. Add one, for example `/ordo-help I want my paper reviewed and then revised`, expected `paper-review-panel` then `paper revision`, with the order stated.
3. The case "`/ordo-help` followed by the number of a roadmap entry with no open plan: expected, `/plan <entry>` named" holds only for an open entry with a gate. See Implied inputs 6.
4. No case asks the builder to check, quote or explain a place the step does not change. The cases are consistent with `docs/dev/change-standard.md` and the standards, with reading as the check for a text step.

## The question

The goal part step 5 delivers: "`ordo-help` covers everything Ordo offers: the academic skills and the code skills beside the plan skills, each with what it is for and the command that starts it, and from a sentence on what you want to do it names the skill, the mode and the command."

- Case `skills`: no. The text is read for the new line per skill, and the skill reads every folder.
- Case revise a paper: yes, it could pass. It is read in this repository, which has `docs/plan.yaml`. Nothing in the brief stops the wish from being refused where no `plan.yaml` exists, which is the usual folder of an academic user. The "What it reads" 4 order reads the plan configuration first, and `/plan`'s "No configuration" is a refusal. Fix: Implied inputs 1.
- Case referee: no. It tells `referee` from `paper-review-panel` by the description.
- Case bake bread: no.
- Case 13 with an open plan: no.
- Case entry with no open plan: no for an open entry. A done entry would get a wrong command, which this case does not catch. This is not the goal's sentence but a defect of the form (Implied inputs 6).
- Case no argument and `<folder>`: no for these two forms. `<folder>/<entry>` and `<project>/<entry>` are not covered and could become wishes unnoticed (Implied inputs 2 and 3).
- The step line's check (reading against D15 and D33): yes, it could pass. D15 and D33 say nothing about a repository with no `plan.yaml` or about the `projects:` form, so a text that refuses a wish outside a plan repository, or reads `x/12` as a wish, reads as consistent with both rulings. The check needs the cases of Cases and checks 1 beside it.
- Item 1: no. The line is written from the description just read, and the Rules forbid one written from memory.
- Item 2: yes, as for the revise-a-paper case. It does not say that a missing `plan.yaml`, or one with a required key missing, leaves a wish answered.
- Item 3: no.
- Item 4: yes, partly. It lists the opening paragraph, Quick start, Use instead, Stops, Anti-patterns and Rules, and leaves out "What it reads" and Steps. "What it reads" 2 and 3 say "For `/ordo-help skills`", "What it reads" 4 and 5 say "For `/ordo-help` and `/ordo-help <entry>`", and "What it reads" 8 reads the roadmap only with no entry. Yet the wish reads the skills folder, the `SKILL.md` files, the plan configuration and the roadmap (to find an entry with no open plan). `docs/dev/skill-layout.md`, "Sections, in order" row 5, gives each mode its own `### <name>` subsection of Steps. Item 4 should add "What it reads" (each input the wish reads, with the form that reads it) and a Steps subsection for the wish form, each item ending on its completion criterion. Item 4 should also say where the new Quick start line stands. Row 2 says "The first line is the one a new user types first", and "What it must do" describes a person who does not know the skills, so the brief should state whether the wish line becomes the first line.
- Item 5: no.

## Implied inputs

This is a text step that sets how `ordo-help` reads its argument. Argument forms the cases and items leave unsettled:

1. A wish typed where no `plan.yaml` is found, in a paper folder for example. Today "What it reads" 4 reads the configuration as `/plan` does, and `/plan` stops on "No configuration". Under D33, a text that is not `skills`, not a folder and not an entry with an open plan is a wish, and with no configuration there is no open plan. The reading D33 gives is therefore that the wish is answered and nothing is refused. The brief should say: "With no `plan.yaml` found, or with one whose required key is missing, an argument other than `skills` and a folder is a wish and is answered; the refusals stay for the forms that read a plan."
2. The `projects:` form `<project>/<entry>` (`/plan x/12` reads the project `x` of `docs/plan.yaml`; `/plan`'s "What it reads" 1). ordo-help reads it today through "What it reads" 4. Under the brief's order, `x` is not a folder that holds a `plan.yaml`, so `x/12` falls through to "anything else is a wish". D33's "the number or title of an entry that has an open plan" covers it: an entry named with its project is still an entry. The brief should list `<project>/<entry>` beside the folder form in item 2, bullet 1.
3. `<folder>/<entry>` where the entry has no open plan. Today this is the refusal "No ledger folder". D33 does not say. The reading consistent with decision 2 is `/plan <folder>/<entry>`. The brief should say so, or say that the refusal stays for this form.
4. An argument of several words that begins with a folder holding a `plan.yaml`, such as `/ordo-help docs/plan.yaml has a wrong key` in this repository, where `docs/plan.yaml` exists (`ls docs/plan.yaml`). `/plan`'s longest-leading-part rule takes `docs` as the folder and the rest as an entry. D33 checks for "a folder" and reads anything else as a wish. The reading it gives is that the text counts as a folder form only when what follows the folder is nothing or an entry (with or without an open plan, per point 3); otherwise the whole text is a wish. The brief should state that.
5. An entry title of several words (`# Plan: 13. researcher`; titles such as "one object per file") against a wish that contains a title ("I want to work on researcher"). D33 says "the number or title of an entry". The reading is a match of the whole argument against the number, the title or the `<number>. <title>` of the heading, and a sentence that only contains a title is a wish. Item 2, bullet 1 should say "the whole argument is the number, the title, or the number and title".
6. The number or title of a done entry, a dropped entry, an entry under "Not yet specified", or a number that matches no entry. All of these are wishes under D33, but decision 2 answers each with `/plan <entry>`. `docs/roadmap.md` has 24 done entries (`grep -c '^- \[x\]' docs/roadmap.md` printed `24`) and a "Not yet specified" section (line 31), so `/ordo-help 4.A` is a real input that would get `/plan 4.A`. `/plan` refuses an entry under "Not yet specified" and names `/roadmap add <entry>` ("Stops", row "Not yet specified"). The brief should say:
   - `/plan <entry>` only for an open entry with a gate;
   - `/roadmap add <entry>` for an entry under "Not yet specified";
   - for a done or dropped entry, one line that says so;
   - for a number that matches no entry, the no-fit line.
7. `skills` followed by more words (`/ordo-help skills for papers`). Settled: item 2, bullet 1 says "exactly `skills`", so it is a wish. This is consistent with D33.
8. What a wish prints of the choices awaiting review. Item 2, bullet 4 excludes "the sequence and the plans' positions" for a wish. "Steps / The sequence and the plans" 2 prints the choices for `/ordo-help` and `/ordo-help <entry>` as a separate step, so the brief leaves open whether a wish prints them. D15 asks for a selection of a skill, so the reading is no. The bullet should read "the sequence, the choices awaiting review and the plans' positions".

## ADRs

1. The brief's claim that no ADR touches the step holds. `grep -l ordo-help docs/adr/*.md` printed nothing. A wider grep for the skills mode, skill groups and how skills are found (`grep -n -i -E 'quick start|skills folder|group folder|skill folder|skills mode|which skill|find(s)? the skill' docs/adr/0*.md`) gave these hits, none of which governs ordo-help's text or its argument:
   - ADR 0047 is how `codebase-design` finds standards pages from its skills folder.
   - ADR 0048 places `tutor` and `wait-what` in `skills/explain/`.
   - ADR 0051 is `ordo-init`'s Quick start.
2. ADR 0005 (the choices file at `<ledger_root>/choices.md`) governs the file ordo-help reads for "Choices awaiting review". The step does not change that reading, so it does not touch the record.
3. Nothing in the brief contradicts a record.

## Dictated text

The brief dictates no text word for word for a file. Three things come close:

- `grep -n -F '/ordo-help <what you want to do>'` finds line 28. This is the name of the form and is not given as a Quick start line. It holds: ASCII, and a placeholder in angle brackets as the other Quick start lines have.
- `grep -n -F 'which skill do I use for'` finds line 37. This is given "such as", an example trigger phrase. It holds: ASCII, no banned word (prose standard, A), and a case of ordo-help, not of a neighbouring skill (`docs/dev/skill-layout.md`, Frontmatter).
- `grep -n -F '"5.2.0"'` finds line 37. This is a value, not prose. It holds as a minor raise (`docs/dev/skill-layout.md`, Frontmatter: "adds to its output" and "accepts an input it did not accept").

`LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing (exit 1).

## Declined to judge

1. Whether the description can carry both additions within 1,024 characters. It stands at 817, which leaves 207, and whether that is enough is the builder's to show with item 3's command. Not verified.
2. That steps 1 and 2 also write `README.md`. Sharing that path with steps in flight is the orchestrator's judgment under `/spec`, not this brief's.
3. Paper's `## Quick start` holds more than one code block ("Minimal command"). Which block the `skills` mode and the wish form copy is the unchanged "Steps / skills" 3 rule ("the code block under `## Quick start`"), which this step does not change.

## Closed

Each finding is closed by a change to the brief `agents/briefs/5.md`.

- Names 2: item 2's last bullet now reads that the sentence form writes nothing, invokes no skill and starts no agent.
- Names 6: the brief names the form "the sentence form" and tells the builder to write it in plain words and to coin no new term; no glossary entry is needed.
- The step line 5: "Verify before you report" item 5 added, the reading against D15 and D33 clause by clause.
- Premises 7: the premise and decision 1 give 65 characters (`ordo-init`) to 820 (`grill`), and the `diagnose` example is removed.
- Premises 8: D15 is given in short, with the ruling's own words left to `plan.md`.
- Cases and checks 1 and 2, The question (the revise-a-paper case, the step line's check, item 2): six cases added: an open entry with a gate and no plan, a done entry, the folder and project forms with a plan open, an entry's title against a sentence that contains it, a folder with no `plan.yaml`, and two skills in an order of use.
- Cases and checks 3, Implied inputs 6: an entry with no open plan is answered from the roadmap: `/plan <entry>`, `/roadmap add <entry>`, a line that it is done or dropped, or the no-fit line for a number that matches no entry.
- The question, item 4: item 4 now names "What it reads" and a Steps subsection for the sentence form, and says where the new Quick start line stands (decision 4).
- Implied inputs 1: with no `plan.yaml` found, or a required key missing, an argument other than `skills` and a folder is answered as a sentence.
- Implied inputs 2 to 5: the argument order of item 2 names the project form, a folder followed by other words, and a match of the whole argument against an entry's number, title, or number and title.
- Implied inputs 8: the sentence form prints neither the sequence, the choices awaiting review nor the plans' positions.

No dictated line was rewritten or added.

Usage: agent af1105b279c18c7ed, claude-opus-5-5, 159691 tokens, 22 tool uses, 267 s.
