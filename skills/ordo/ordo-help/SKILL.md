---
name: ordo-help
description: "Print the command sequence for running a plan step by step (open, spec, build, refute, diagnose, close, land, and the loop inside a step) with the choices awaiting review that the orchestrator took under self-rule, with no entry the position and open items of each open plan, and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. With the argument skills, print instead the name, one line on what it is for and the Quick start block of every skill in the folder that holds this skill, in folder-name order. With a sentence on what you want to do, print the skills that fit, each with its mode and the command to type. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work, which choices await my review, ordo-help skills, which skills are there, list every skill and its modes, what modes does a skill have, which skill do I use for, which command do I type to."
metadata:
  version: "5.2.0"
---

# Ordo help

`/ordo-help` prints the command sequence for running a plan step by step and the position of each open plan, and, for a named plan, where that plan stands and the command that comes next, or, for the number of a roadmap entry with no open plan, what the roadmap says of it. `/ordo-help skills` prints, for every skill in the folder that holds this skill, its name, one line on what it is for and its Quick start block, and nothing else. `/ordo-help <what you want to do>` reads a sentence on what you want to do and names the skills that fit, each with its mode and the command to type.

## Quick start

```
/ordo-help            print the sequence and the choices awaiting review, then the position and open items of each open plan
/ordo-help <entry>    print the sequence and the choices awaiting review, then the named plan's position and the command that comes next; for the number of an entry with no open plan, what the roadmap says of it
/ordo-help <folder>            the first line, for the plans of the plan.yaml in <folder>, a path from the repository root
/ordo-help <folder>/<entry>    the second line, for a plan of the plan.yaml in <folder>
/ordo-help skills     print each skill's name, one line on what it is for and its Quick start block, in folder-name order
/ordo-help <what you want to do>    name the skills that fit a sentence on what you want to do, such as I want to revise a paper, each with its mode and the command to type
```

## Use instead

| When | Use |
|---|---|
| The plan should run its steps unattended | `/plan-orchestration <entry>` |
| No plan is open for the entry yet | `/plan <entry>` |
| A defect whose cause is not known | `/diagnose <symptom>`, or inside a plan `/diagnose <entry> <step> <finding>` |
| What the reviews keep finding across plans | `/plan-retro` |
| What went well and what went wrong in Claude Code sessions | `/session-retro <entry>` |

## What it reads

1. The argument, read first, by the bullets below in their order, the first that matches deciding the form.
   - An argument that is exactly `skills` is the `skills` mode, before anything is matched against the roadmap or a ledger folder.
   - `skills` followed by more words is a sentence on what you want to do.
   - No argument is `/ordo-help`.
   - A folder that holds a `plan.yaml`, named alone, is `/ordo-help <folder>`, read as "What it reads" 4 says.
   - With no `plan.yaml` found, or with one whose required key is missing, no argument and a folder that holds a `plan.yaml`, named alone, are refused as "What it reads" 4 says, and every other argument, a word that names a folder with no `plan.yaml` included, `<folder>/<entry>` and `<project>/<entry>` included, is a sentence on what you want to do, answered with no roadmap read.
   - A folder that holds a `plan.yaml`, or a project of the `projects:` form, in front of the rest of the argument is read as `/plan`'s "What it reads" 1 reads it ("What it reads" 4), and the rest is then read, as the whole argument, by the bullets on an entry that has an open plan, on the number of an entry with no open plan and on a number that matches no entry.
   - A folder or a project followed by words that match none of the bullets on an entry that has an open plan, on the number of an entry with no open plan and on a number that matches no entry makes the whole argument a sentence on what you want to do.
   - An argument that is, whole, the number, the title, or the number and title of a roadmap entry that has an open plan is `/ordo-help <entry>`, that plan's position ("What it reads" 5).
   - An argument that is, whole, the number of a roadmap entry with no open plan, alone or followed by its title, is read from the roadmap ("Steps / The number of an entry with no open plan").
   - An argument that is a number in the roadmap's numbering, such as `37`, `4.A` or `12.5`, and matches no entry gets the line that no skill fits ("Steps / A sentence on what you want to do" 4).
   - Any other argument, the title of a roadmap entry with no open plan included, is a sentence on what you want to do ("Steps / A sentence on what you want to do"), so that `/ordo-help paper` names the skill `paper`.
2. For `/ordo-help skills` and for a sentence on what you want to do, the skills folder, found from this skill's folder after that folder is resolved to its real path.
   - This skill's folder is the base directory the runner states when the skill loads, resolved through any link by `cd <base directory> && pwd -P`.
   - A parent of the resolved path that is a folder directly inside a folder named `skills` is a group folder, as it is when the skills are links into a checkout that groups them. The folder named `skills` is then the skills folder, and the skill folders are the folders in each folder of it.
   - Any other parent of the resolved path is the skills folder, as it is when the skills are copied side by side, and the skill folders are the folders in it.
   - The parent of the base directory as stated is never the skills folder.
3. The `SKILL.md` of each skill folder.
   - For `/ordo-help skills`, its frontmatter `description` and the code block under `## Quick start`.
   - For a sentence on what you want to do, its frontmatter `description`, the code block under `## Quick start` and the table under `## Use instead`.
4. For every form but `/ordo-help skills`, the plan configuration, found and its paths read as `/plan`'s "What it reads" 1 says, a folder named alone or in front of `<entry>` as a path from the repository root; its required keys and defaults as `/plan` states them.
   - For a sentence on what you want to do, the plan configuration is read when a `plan.yaml` is found, to tell an entry from a sentence ("What it reads" 1).
   - A required key missing is a refusal for `/ordo-help` with no argument and for a folder named alone ("Stops"), and makes every other argument a sentence on what you want to do ("What it reads" 1).
5. For `/ordo-help <entry>`, the ledger folder: `<entry>` resolves to the folder of the open plan whose `plan.md` opens with `# Plan: <entry>` (the number, the title, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - The number of an entry with no such folder, alone or followed by its title, is read from the roadmap ("What it reads" 8), and its title alone is a sentence on what you want to do ("What it reads" 1).
6. For `/ordo-help` and `/ordo-help <entry>`, the state file of each plan it prints.
   - For `/ordo-help` with no entry, that of each open plan, in the roadmap's order.
   - For `/ordo-help <entry>`, that of the named plan's folder, and the brief, the report and the refuter report of the step in flight.
7. For `/ordo-help` and `/ordo-help <entry>`, the choices file `<ledger_root>/choices.md`, when it exists.
8. The roadmap file the plan configuration's `roadmap:` names.
   - For `/ordo-help` with no entry, for the order "Steps / The sequence and the plans" 3 prints the open plans in.
   - In the `projects:` form, the order of the projects in the plan configuration comes first.
   - For every argument but `skills`, when a `plan.yaml` is found that holds every required key, to match the argument against the entries of every section by number or title, with the section each entry stands in: the open order, "Not yet specified", or the entries marked done or dropped.

## Steps

### The sequence and the plans

`/ordo-help`, `/ordo-help <folder>`, and `/ordo-help <entry>` for an entry with an open plan, with or without its folder or project in front, run these steps.

1. Print the sequence in "The sequence, printed verbatim".
2. Print the choices awaiting review, for `/ordo-help` and for `/ordo-help <entry>`.
   - The line `Choices awaiting review: <count>`, then each choice's `## C<n>.` heading under its entry's heading, as the choices file holds them.
   - The line `Choices awaiting review: none` when there is no file or no choice.
   - The step is done when the line is printed.
3. Print the position of each plan.
   - For `/ordo-help` with no entry, print the position of each open plan in the roadmap's order: the position line and the open items verbatim of its state file, or a line saying no plan is open.
   - For `/ordo-help <entry>`, print the named plan's position.
     - From the state file: the position line, the open items verbatim, and the dispatch block (a step in flight, its worktree, its base, its round).
     - A step whose dispatch entry reads `landing: preparing` is printed as in `/spec`, with its base and its worktree once they are written.
     - From the ledger folder, for the step in flight: which of the brief, the report and the refuter report exist, and whether the last refuter report has open findings.
   - The step is done when the positions are printed.
4. For `/ordo-help <entry>`, print one line from that position: the command that comes next, in the sequence.
   - For a step whose dispatch entry reads `landing: preparing`, the command that comes next is `/spec <entry> <step>`.
     - It takes over an interrupted run and refuses while the brief-check agent is still listed.
   - An open item that waits on a ruling is printed with it.
   - The line after an open item that waits on a ruling is `Ruled: ...`.
   - The step is done when the line is printed.

### skills

`/ordo-help skills` runs these steps.

1. Find the skills folder as "What it reads" 2 says.
   - The step is done when the skills folder and the skill folders are known.
2. Sort the names of the skill folders bytewise, as `LC_ALL=C ls -1` sorts them, so `plan` comes before `plan-orchestration` and `plan-retro`.
   - The step is done when the sorted names are known.
3. For each folder in the sorted order, print the skill's name line, its line on what it is for and its Quick start block.
   - A folder with no `SKILL.md` is skipped.
   - For a folder that holds a `SKILL.md`, print the line `/<name>`, `<name>` being the folder's name.
   - Under that line, print one line on what the skill is for: one sentence of at most 25 words, written in this run from the frontmatter `description` of the `SKILL.md` this step reads, holding nothing the description does not say.
   - Under the line on what the skill is for, print the lines of the code block under `## Quick start`, from its opening fence line to its closing fence line, both included, copied from the `SKILL.md` this step reads.
   - A `SKILL.md` with no code block under `## Quick start` gets its name line, its line on what it is for and then the line `no Quick start block`.
   - A blank line stands between one skill's block and the next skill's name line.
   - The step is done when every folder in the sorted order is skipped or printed.

### A sentence on what you want to do

`/ordo-help <what you want to do>`, such as `/ordo-help I want to revise a paper`, runs these steps.

1. Find the skills folder as "What it reads" 2 says.
   - The step is done when the skills folder and the skill folders are known.
2. Read the `SKILL.md` of each skill folder, its `description`, its Quick start block and its Use instead table, in this run.
   - A folder with no `SKILL.md` is skipped.
   - The step is done when every `SKILL.md` has been read.
3. Choose the skills that fit the sentence, at most three, the best fit first.
   - A skill fits when its description says it does what the sentence asks for.
   - A row of a Use instead table read in step 2 that names another skill for the situation the sentence describes makes that other skill the fit.
   - For each skill chosen, its line is the line of its Quick start block that does what the sentence asks for.
   - The mode is the word that follows the skill's name on that line, such as `revision` in `/paper revision <main.tex> <comments file>`; a placeholder in angle brackets is no mode word, so a line such as `/referee <manuscript>` has none, and its mode is what the line's comment says it runs.
   - When the sentence asks for work that several skills do in an order of use, such as a review and then a revision, the skills stand in that order of use.
   - The step is done when the skills chosen, each with its line and its mode, are known, or when none fits.
4. When no skill fits, print one line that says no skill fits the sentence and names `/ordo-help skills`, which lists every skill.
   - The step is done when the line is printed, and the run ends there.
5. When the skills chosen stand in an order of use, print one line that says the order, such as `First /paper-review-panel, then /paper revision.`
   - The step is done when the line is printed, or when the skills stand in no order of use.
6. For each skill chosen, in the order step 3 gives, print its name `/<name>` with its mode, the command to type as its Quick start line writes it, and one sentence on why it fits, from its description.
   - The step is done when every skill chosen is printed.

### The number of an entry with no open plan

`/ordo-help <entry>` for the number of a roadmap entry with no open plan, alone or followed by its title, with or without its folder or project in front, runs this step.

1. Print one line from the section of the roadmap the entry stands in.
   - An entry of the open order, which has a gate: the line names `/plan <entry>`, with the folder or project in front as the argument wrote it, which opens its plan.
   - An entry under "Not yet specified": the line names `/roadmap add <entry>`, which names its gate.
   - An entry the roadmap marks done: one line that the entry is done.
   - An entry the roadmap marks dropped: one line that the entry is dropped.
   - The step is done when the line is printed.

## The sequence, printed verbatim

```
/ordo-init                    once per repository: sets up a new one from an empty folder, writes docs/plan.yaml and what an existing one lacks, or checks the plan.yaml there with the shared rules and the plan terms
/ordo-init build              when the repository is to get the build driver: writes utils/build.py from the verification page's commands and makes the page name python3 utils/build.py build, test and check
/roadmap add <goal>           an entry with its goal, gate and place in the order, for /plan to open
/roadmap add <entry>          for an entry not yet specified: its gate and place in the order, before /plan can open it
/grill <entry>                optional: an interview in rounds that settles the entry's design decisions, written as they settle
/plan <entry>                 once: opens the plan, shows the step list for approval

then, for every step:

/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree once per full step (the brief check; a small text step has none) and closes its findings in the brief, makes the worktree, stages the base binaries
/diagnose <entry> <step> premise
                              when the step's text asks for a cause to be found: /spec runs it while it writes the brief, or you run it first; the cause goes to the step's Step 0 and into the brief
/diagnose <entry> <step> brief check <n>
                              when a finding of the brief check has a cause not known: finds the cause on a scratch copy before the finding is closed in the brief
"build it"                    the session writes itself into the dispatch entry and commits it. It then writes the code in the worktree, runs the checks and writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings
/diagnose <entry> <step> <finding>
                              when a finding's cause is not known: finds it on a scratch copy before "close them", its fix and test then the round's ruling; round <n> Spec 1 names a finding of the run over repair round <n>
"close them"                  a repair round (a small text step has none): the session fixes the findings, reruns, rewrites the report; a contradiction of an ADR the brief asked for is raised to you as an open item instead
/refute <entry> <step>        again, over the repair round, when plan.yaml says refute_after_repair: yes
                              repeat these two up to repair_rounds times (plan.yaml), or once more under plan-orchestration's exception; a refutation that finds nothing ends them; what the last one finds is fixed at landing or raised to you as an open item, never sent back
read the delta                when plan.yaml says refute_after_repair: no: the orchestrator reads the round and appends what it closed to the refuter report; what is left is raised to you as an open item, and goes where plan-orchestration's "What earns a step of its own" says, by your ruling or under self-rule by a choice you review
/land <entry> <step>          stops the step's agents, then onto main, checks on main, small fixes, the look where plan.yaml's look: says, the A/B, the booking, the commit

when a command stops:

/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the part the step builds, a choice is yours, the step contradicts an ADR (a rule clash), the step has stopped twice already and would stop a third time, a cause the step's text asks to have found was not found by the diagnosis, or the brief-check agent or a diagnosis agent, started as an effort agent, was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
C<n> Agree                    under self-rule: you agree with a choice the orchestrator took; the session rewrites its ruling as yours and removes it from choices.md
C<n> => <your ruling>         under self-rule: you replace a choice with your ruling; the session books it, adds a fix step when work built on the choice has landed, and removes it from choices.md
/spec <entry> <step>          again; it now writes the brief
/spec refuses                 the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours or a choice taken under self-rule), a file it reads is unusable, or the configured effort cannot apply (CLAUDE_CODE_EFFORT_LEVEL is set): it names the cause and leaves nothing; rule on the step, or unset the variable and start a new session, then /spec again. An ordo-<level> effort agent the runner does not list is no refusal: /spec prints a warning that names it and starts the brief-check agent on the runner's default agent, with no model named and no effort set, so the configured model and effort are not applied. The steps in flight of all open plans already reaching plan.yaml's workers_at_once is a refusal that names them: a step must land, be taken back out of main, or, at landing: preparing, stop or wait in its /spec, first. The step's worktree or branch already existing is a refusal that names it: the step that holds it must land first. A /spec of the step whose brief check is still running is a refusal that names the agent: wait for it. A file its brief shares with a step in flight, of any open plan, is no refusal: the step runs beside that step when the orchestrator judges the merge at landing simple, named under shared_paths: with the other step's plan and step in its dispatch entry, and waits otherwise
/refute stops                 the reviewer, started as an effort agent, was served a model other than the configured one: it stops the reviewer, uses nothing it wrote, and shows the configured value, the served model and the Claude Code version; rule on it, then /refute again
/refute refuses               it names the cause and leaves nothing, such as the configured effort that cannot apply (CLAUDE_CODE_EFFORT_LEVEL is set): unset the variable, then /refute again in a new session. An ordo-<level> effort agent the runner does not list is no refusal: /refute prints a warning that names it and starts the reviewer on the runner's default agent, with no model named and no effort set, so the configured model and effort are not applied
/land refuses                 it names what is missing, such as a finding neither closed nor raised as an open item, or the step's dispatch block: supply it, then /land again
/land meets a red line        a red line no fix inside the brief closes: the step goes back out of main. Its failure is recorded in its Step 0 in plan.md. /spec that step again when it comes up, with no new ruling. When only you can decide what to do, /spec it after your ruling. /spec saves its work as a patch and prepares it again from main's head. When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main and before /spec prepares it again, and writes it in the step's Step 0.

/plan-orchestration           instead of the lines above: runs them for every step of every open plan unattended, with the executor each plan names (an agent by default) at "build it" and "close them"
/plan-orchestration <entry>   the same for the plan of that entry alone

/plan-retro                   after plans have run: the findings the reviews keep making, and the rule sentence, text change or page that stops each, a check only for a fact
/session-retro <entry>        for a plan, open or closed: what went well and what went wrong in its Claude Code sessions, each with a proposed change
/diagnose <symptom>           at any time, outside a plan: the cause of a defect, from a command red on it, before any fix
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never stops for a decision; the row below is a refusal of `/ordo-help` with no argument and of a folder named alone, which names its cause and leaves nothing, and `/ordo-help skills`, a sentence on what you want to do, the number of an entry with no open plan and a number that matches no entry refuse nothing | Nothing | Nothing |
| A required key missing | A required key is not in the `plan.yaml` found, in the folder the call names or else at the repository root, for `/ordo-help` with no argument or a folder named alone, every other argument being read as a sentence on what you want to do; the refusal names it; a path of that file refused as `/plan`'s Stops row "A path refused" says is refused here too, and that row says what the refusal shows and what resumes it, with this skill's call in place of `/plan` | The key | The key added, then `/ordo-help` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Printing the sequence in other words | A reader matching what they typed against the sequence finds lines that are not there | "Steps / The sequence and the plans" 1 |
| Printing a skill's Quick start block from memory, from an earlier output or in other words, or its line on what it is for from memory or from another run | A reader then types a mode the skill no longer has, misses one it has, or picks a skill for a purpose its description does not state | "Steps / skills" 3 |
| Naming a skill, a mode or a command for a sentence from memory, or a command in other words than its Quick start line | The user types a command the skill does not take, or misses the skill that fits | "Steps / A sentence on what you want to do" 2 and 6 |

## Rules

- The skill writes nothing.
- The `skills` mode prints only the name lines, the lines on what each skill is for, each written from the description read in the same run, the Quick start blocks, the `no Quick start block` lines and the blank lines between skills.
- A sentence on what you want to do, the number of an entry with no open plan and a number that matches no entry get only the lines Steps gives them, with no sequence, no choices awaiting review and no position.
- A sentence on what you want to do invokes no skill: it names the command for the user to type.
- A sentence on what you want to do starts no agent: the session reads each `SKILL.md` itself.
