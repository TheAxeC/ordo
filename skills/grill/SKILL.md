---
name: grill
description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
metadata:
  version: "1.2.0"
---

# Settle an entry's design decisions

`/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.

## Quick start

```
/grill <entry>                                                  interview about the entry, by number or title, including one under "Not yet specified"
/grill <entry> --bar <industry|state-of-the-art|novel>          the same, with this design bar in place of the configured one, for this interview only
/grill <project>/<entry>                                        the same, in a repository whose plan.yaml lists several projects
/grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision
```

## Use instead

| When | Use |
|---|---|
| The repository has no `.agents/plan.yaml` | `/ordo-init` |
| The roadmap has no entry for the work yet | `/roadmap add <goal>` |
| The design is settled and the plan is to be opened | `/plan <entry>` |
| Where an open plan stands | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml` at the repository root.
   - The required keys are `roadmap`, `ledger_root`, `archive_root`, `rules`, `libraries` and `reviewer`.
   - The optional keys are `standards` (default `[]`), `adr` (default `docs/adr`), `design_bar` (default `industry`), `design_references` (default `[]`) and `reviewer_effort` (default `high`), and a key left out takes its default.
   - In the `projects:` form, the named project's keys.
   - No file is a refusal that names `/ordo-init` ("Stops").
   - A required key missing is a refusal that names the key ("Stops").
   - A `design_bar` value or a `--bar` value other than `industry`, `state-of-the-art` and `novel` is a refusal that names the three ("Stops").
2. The roadmap file `roadmap` names: its introduction and status legend, for the format a change to the entry is written in, and the entry `<entry>` names, whole.
   - `<entry>` is matched against the entries by number or title, and an entry under "Not yet specified" is an entry.
   - No match is a refusal that names `/roadmap add <goal>` ("Stops").
3. The rules file `rules` names, and every page `standards` lists, each in full.
4. The ADRs in force in the folder `adr` names, as the `spec` skill's "What it reads" 5 says: which records are in force, and what each record's decision is.
5. `docs/glossary.md`, whole.
   - A repository without it gets it at the first term written, created from the `repo-setup` skill's `templates/docs/glossary.md`.
   - A glossary without the plan-terms block gets its terms after the opening paragraph.
6. The Rulings of the open plan, when a folder under `<ledger_root>/`, outside the folder `archive_root` names, holds a `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, and otherwise the rulings file `<ledger_root>/rulings/<slug>.md` when it exists.
   - The slug is derived as the `plan` skill's Steps 1 derives it.
   - The Rulings are the `## Rulings` section of `plan.md`.
   - Every other section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, an archived plan's included, and every other rulings file under `<ledger_root>/rulings/`, is read for the bullets that name the entry by its number or its title and whose first line ends with "(the user)", with or without a full stop after it.
     - Such a bullet is a carried ruling.
     - In an archived `plan.md` whose title, after `# Plan: `, equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed, every bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry.
     - A bullet of an archived plan that a ruling of the user sets aside is no carried ruling, for any entry.
       - Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
     - A ruling of the user is a bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings` in a `plan.md` under `<ledger_root>/`, or of a rulings file under `<ledger_root>/rulings/`, the archived plan it sets aside included.
     - A ruling sets an archived plan aside when it says that the plan is set aside, thrown out or stopped, or that the entry of the plan is redone.
       - A ruling that says the entry is redone sets aside only a plan of the entry that stood when the ruling was given.
       - A plan stood when the ruling was given when the first date of the plan's Rulings is before the ruling's date, or is the same date and the ruling names that plan or one of its steps.
       - A plan opened after the ruling was given is never set aside by it.
     - A ruling that sets aside named bullets or steps of an archived plan sets aside only those bullets, and only the bullets of those steps.
     - A ruling that a later ruling names as the one it replaces sets no plan aside, and neither does any other ruling that sets aside exactly what the replaced ruling sets aside and is dated no later than it.
     - A bullet of the entry's Rulings or rulings file that reads "carried from" a bullet now set aside settles nothing.
     - The decisions of the design tree a carried ruling settles are settled (Steps 3).
     - A carried ruling is written into the entry's Rulings or rulings file as "Steps / Writing what settled" 1 says.
7. The entry's sources: each file, page or repository the entry and the answers name.
8. The ADR folder's `README.md`, which states when a record is kept and how one supersedes another.
9. The page that states this repository's goals: `docs/dev/design-principles.md` when it exists, otherwise the opening of `README.md`.
   - A repository that states no goals in either is shown so in the first round, and its goals are asked as a decision of their own.
10. The `repo-setup` skill's `templates/docs/adr/README.md`, `templates/docs/adr/template.md` and `templates/docs/glossary.md`, only when Steps 8 must create the ADR folder's files or the glossary.
11. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
    - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
    - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
    - The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
    - It is matched against the bullet's text as written, a quotation mark in it included.
    - A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet.
      - What the skill shows beside the change, such as a gate's answer with its reason or the lines around a place, is not part of what is compared.
    - A text of several lines is compared line for line with the fenced block under its sub-bullet.
    - There is no ruling in any of these cases.
      - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
      - The file does not exist, or is neither of those two files.
      - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
      - The name is a placeholder in angle brackets, such as `<L>`.
      - The bullet's first line does not end with "(the user)", with or without a full stop after it.
    - With no ruling, the skill says which of these it found, and every stop stands.

## Steps

1. Resolve the configuration, the design bar and the entry.
   - The design bar is the one "The design bar" names.
   - Every refusal of "What it reads" 1 and 2 is made here, before anything is written.
   - The step is done when the keys, the design bar and the entry are resolved, or the skill has refused.
2. Read what "What it reads" 3 to 9 lists.
   - Each is read in full in this session, and none is taken from memory.
   - The step is done when each has been read.
3. Draw the design tree.
   - List every decision the entry's goal and gate need, each with the decisions it waits on.
   - A decision is a node of the design tree, and the skill names what it asks a decision, never a question, since the glossary's term "question, the" is another thing.
   - The roadmap diff and "record as ADR?" ("Steps / Writing what settled") are decisions of their own, numbered like the rest.
   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
     - A bullet that reads "carried from" a bullet now set aside settles nothing ("What it reads" 6).
   - A decision that a carried ruling ("What it reads" 6) settles is marked settled and is not asked again.
     - The first round lists it as settled (Steps 6): the words of the carried ruling that settle it, quoted as written, with the ruling's `<path>:<line>`.
     - A carried ruling that settles part of a decision leaves the rest of that decision open.
     - A decision a carried ruling settles in part quotes the carried ruling beside its options.
     - What a round says a carried ruling states, or how an option or a recommendation differs from it, is said only from the ruling's quoted words.
     - A source that states a ruling in other words is never shown as the ruling, or as a difference from it.
     - A carried ruling that a later ruling names as the one it replaces settles nothing.
       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the carried ruling it names still settles what it settles.
     - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says, and the ruling it names stays the one carried.
     - A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file, a carried bullet included, replaces every carried ruling that settles the same decision.
       - A bullet of a set-aside plan replaces no ruling, except as "What it reads" 6 says.
     - A carried ruling that contradicts another carried ruling, or a bullet of the entry's Rulings or rulings file, neither naming the other as the one it replaces, is a rule clash ("Steps / An answer that contradicts").
       - A bullet that settles nothing ("What it reads" 6) makes no rule clash.
     - Whether a bullet of the entry's Rulings or rulings file already settles a decision of a carried ruling is judged by reading, since the line a carried ruling stands on can move.
   - An entry that has a goal already has one decision for each part of its current goal: the part kept, changed or dropped.
     - Each such decision quotes its part as the entry writes it.
     - A part of the goal is each thing the goal names as delivered.
     - An entry with a gate has one such decision for each part of its current gate, a part being each thing the gate checks.
     - An entry under "Not yet specified" has one such decision for each part of what must be known, in place of the gate.
     - Each such decision is a design decision ("The decision form").
   - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is marked settled, since the quoted ruling is the user's answer ("Rules"): it is made at the first write of Steps 8, and a draft that "Steps / Writing what settled" 3 shows as the decision is asked in the next round.
   - An interview started again, in a new session or after a compaction, draws the tree afresh from what is written: the Rulings or the rulings file, the carried rulings, the entry, the glossary and the ADRs.
   - A decision shown before and not answered is asked again under a new number.
   - After such a restart, an answer to a number shown before is not read (Steps 7), and the redrawn round opens by saying that answers to an earlier round are to be given again against this one.
   - The step is done when every decision is marked settled or open, each open one with the decisions it waits on named.
4. Compute the frontier: every decision whose prerequisites are settled, the roadmap diff and "record as ADR?" decisions included.
   - A decision that needs a fact has that fact looked up ("Steps / Looking up a fact"), and a decision waiting on a running lookup is in the frontier and not yet asked.
   - A decision that depends on another decision still open waits for a later round.
   - The step is done when each decision of the frontier is in the round, or waits on a named lookup.
5. Draw each decision of the round in the decision form ("The decision form"), its worked example in `references/decision-form.md`.
   - Hold each option against the rules file, every standards page and every ADR in force before the options are written.
   - An option that breaks the rules file, a standards page or an ADR in force is not offered.
   - An option that needs an ADR in force changed is offered as reopening that ADR, naming it and the superseding record it would need.
   - Under `libraries: avoid`, no option adds a dependency.
   - Under `libraries: check`, each library candidate is an option with the facts the `spec` skill's Steps 3 records: version, license, maintainer, last release, compatibility with the project's dependencies, what it replaces and what stays hand-written.
   - No option exempts code from the standards pages ("Rules").
   - A count stated in a round, of the places, items, files or cases of a kind, comes from a lookup that went through the whole of what is counted and listed each one.
     - The list stands beside the count.
     - Without such a lookup, the round names the ones found.
     - Without such a lookup, the round says that the list may not be whole.
     - Without such a lookup, the round states no total.
   - The step is done when every decision of the round has every part of the decision form.
6. Ask the round: every decision of the frontier that waits on no lookup, in one message, numbered `D<n>`.
   - The numbers continue after the highest `D<n>` that opens a bullet of the Rulings or the rulings file, and after every number shown in this interview.
   - Only a `D<n>` that opens a bullet counts, since a `D<n>` inside a line can cite a decision of another interview or plan.
   - The message ends with the answer form: `D<n> => <letter or text>` one line per decision, `D<n> Agree` to take the recommendation, and `D<a>-<b> Agree` to take it for each decision of a range.
   - The first round also lists, unnumbered and after the answer form, each decision a carried ruling settles, as Steps 3 shows it.
   - The first round also lists each archived plan whose bullets would otherwise be carried rulings for the entry and that a ruling sets aside, whole or in part, with each ruling that sets it aside quoted as written and its `<path>:<line>`.
   - The round ends the turn and waits for the answers ("Stops").
   - When the frontier is empty, no round is sent and the turn does not end: the skill goes on to Steps 8, which makes a roadmap diff a quoted ruling states.
   - The step is done when the message is sent and the turn has ended, or the frontier was empty and the skill has gone on to Steps 8.
7. Read the answers.
   - The user may answer part of a round, and the decisions left open stay in the frontier.
   - An answer the skill cannot read as one of the options is asked again in the next round, under a new number.
   - An answer read as one of the options, with the user's text beside it, is written as given.
   - An answer is read against the last round shown; one that names a number this session has not shown is not read: the skill says so and shows its current round again.
   - Check the answers for terms and claims as "Steps / Terms and claims" says, and for a contradiction as "Steps / An answer that contradicts" says.
   - The step is done when each answer is settled, or asked again in the next round.
8. Write each settled answer as "Steps / Writing what settled" says, at the time "Rules" gives.
   - A plan already open changes what is listed at the end ("Steps / A plan already open").
   - The step is done when every answer of the round has its lines written and read back.
9. Go back to Steps 3, until the frontier is empty and the roadmap diff and "record as ADR?" decisions are answered.
   - The step is done when a pass of Steps 3 to 4 finds no open decision.
10. Close the interview.
    - List every decision settled in the interview with where each was written: the Rulings line, the entry, the glossary line, the ADR.
      - The decisions carried rulings settle are listed among them, each with its carried ruling's `<path>:<line>`, those of an interview whose first pass found no frontier included.
    - List each "carried from" bullet removed ("Steps / Writing what settled" 1), with the bullet as it stood and its `<path>:<line>`.
    - List each archived plan a ruling sets aside, as the first round lists it (Steps 6), those of an interview whose first pass found no frontier included.
    - An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.
    - List each change owed to an open plan ("Steps / A plan already open"): a step whose text an answer changed, and the lines of `plan.md`'s "## Goal" or "## Gate" an answer changed.
    - List each clash with a term of the plan-terms block as a change for the user to make in the Ordo repository's `skills/repo-setup/templates/plan-terms.md`.
    - Name `/roadmap add <entry>` when the interview settled the gate of an entry under "Not yet specified", since `grill` does not move that entry, and print the gate's text whole beside it, for the user to give that command.
    - Ask, in the same message, whether the user confirms a shared understanding and whether the skill may commit.
    - On a yes to both, commit the files written by explicit path list in one commit, its subject naming the entry and that its design decisions are settled.
    - The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.
    - Without a yes to committing, list the files written with `git status --short`.
    - Without a confirmation of the shared understanding, go back to Steps 3 with the user's correction.
    - The step is done when the user has answered the confirmation and the commit question, and the files are committed or listed.

### Looking up a fact

1. Before the first lookup agent starts, check as the `spec` skill's Steps 1 does that the runner lists the effort agent `ordo-<reviewer_effort>` and that `CLAUDE_CODE_EFFORT_LEVEL` is unset (`printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1).
   - Either check failing does not end the interview: the lookups are made by the session's own reads, and the next round says so with the cause, the missing agent or the variable's value.
   - The item is done when both checks passed, or the next round is set to give the cause.
2. A fact in a file the session has read, or can read in a few lines, is read by the session itself.
   - The item is done when the fact is in hand with its `path:line`, or the lookup goes to an agent under item 3.
3. Any other lookup, when item 1's checks passed, starts a lookup agent as the `spec` skill's brief-check agent is launched: the effort agent `ordo-<reviewer_effort>`, on the model `reviewer` names.
   - It is read-only and changes nothing.
   - It invokes no skill and starts no agent.
   - It returns each fact with its source, a `path:line` or a URL it fetched.
   - The item is done when the agent is running.
4. Right after the start, read the model the runner served the agent, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
   - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it found is used.
   - The item is done when the served model is the configured one, or the stop is raised.
5. A lookup that finishes joins the next round: the decisions that waited on it are asked.
   - The item is done when each fact a decision needs is in hand with its source.

### Terms and claims

1. A term the user uses that the glossary lacks, or uses in more than one sense, is sharpened by a decision of its own.
   - The item is done when the term is a decision of the next round.
2. A relationship between terms is tested in that decision with a concrete scenario.
   - The item is done when the decision holds the scenario.
3. A claim the user makes about the code is checked against the code by a lookup before a decision rests on it.
   - A mismatch is shown in the next round with its `path:line`, as a decision of its own that asks which holds, the claim or the code.
   - The item is done when the claim is checked, and a mismatch is a decision of the next round.

### An answer that contradicts

1. An answer that contradicts an earlier ruling or an ADR in force is shown in the next round as a rule clash, a decision of its own.
   - The item is done when the clash is a decision of the next round with its options.
2. The options of the clash are these.
   - Reopen the earlier ruling, by a new Rulings bullet that names the one it replaces.
   - Reopen the ADR, by a superseding record as the ADR folder's `README.md` says: the new record, status `proposed`, its decision the ruled option, the old record marked superseded in the words the folder uses, and the new record's row added to the folder's index, as the `spec` skill's "Steps / A ruling" writes it.
   - Keep the earlier one.
   - The item is done when the chosen option is written as "Steps / Writing what settled" says.

### A plan already open

1. An answer that changes the text of an approved step of the open plan is written as its Rulings bullet ("Steps / Writing what settled" 1).
   - The item is done when the Rulings, read back, hold the bullet.
2. The step's change is listed at the end (Steps 10) with the step's line and the changed text, for the user to rule on as the `spec` skill's "Steps / A ruling" handles a ruling.
   - The item is done when the end's list holds the change.
3. An answer that changes the entry's goal or gate is listed at the end with the lines of `plan.md`'s "## Goal" or "## Gate" it changes, for the user to rule on.
   - The item is done when the end's list holds the change.

### Writing what settled

1. Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included.
   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file, created with the heading line `# Rulings: <entry>` when it is absent.
   - It is one bullet: `- D<n> <the decision, as a phrase> (<date>): <the answer in one line> (the user).`
   - The phrase makes a step's `(ruling <name>)` tag name the decision as `D<n> <the decision, as a phrase>`.
   - A library pick names the capability in the phrase.
   - A carried ruling ("What it reads" 6) is written at the first write of Steps 8 as one bullet for each decision it settles, numbered as Steps 6 numbers a decision: ``- D<n> <the decision, as a phrase> (<the carried ruling's date>): "<the words of the carried ruling that settle it, quoted as written>", carried from `<path>:<line>` (the user).``
     - A decision a bullet of the entry's Rulings or rulings file already settles, a bullet carried in an earlier session included, gets no carried bullet.
       - A bullet carried in an earlier session from a bullet now set aside settles nothing, and is removed as the next sub-bullet says.
     - A bullet that reads "carried from" a bullet now set aside ("What it reads" 6) is removed from the entry's Rulings or rulings file at the first write of Steps 8, and Steps 10 lists each removal with the bullet as it stood.
     - The carried ruling's date is the date its bullet gives, or else the date its Rulings heading gives.
     - Words that settle the decision in the ruling's sub-bullets or fenced blocks are quoted in the one line, since `/plan` copies bullet lines only.
   - A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.
   - The item is done when the file, read back, holds the bullet whole.
2. Write the glossary term.
   - A term the interview settles is written into `docs/glossary.md` below the plan-terms block, in the file's form `- **<term>**: <definition>`, at once.
   - A term that clashes with the glossary's existing definition is put to the user as a decision.
   - A term the plan-terms block defines is never written into the block, since `/repo-setup sync` undoes it, and no copy of the `repo-setup` skill's `templates/plan-terms.md` is changed by this skill.
   - A clash with such a term is put to the user as a decision.
   - Its answer is written as a Rulings bullet (item 1).
   - The end lists it as a change for the user to make in the Ordo repository (Steps 10).
   - The item is done when the glossary, read back, holds the term whole.
3. Draft the change to the roadmap entry.
   - An answer that changes the entry's goal, gate or text is drafted into the entry in the file's own format and under the `roadmap` skill's Rules: the goal, the gate and the dependencies only, nothing the user did not ask for, no history, another repository only as a path.
   - A changed gate is asked "could this pass without the goal being reached?", as the `roadmap` skill's "Steps / add" 3 says, and the answer with its reason goes in the diff and never in the entry.
   - The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.
     - Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.
     - It takes the ruled text.
     - The rules of this item are worked on it.
     - A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.
     - The roadmap diff decision then counts as answered.
     - A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.
   - An entry under "Not yet specified" is not moved and has no gate drafted into it, since such an entry states its goal and what must be known and no gate: a changed goal or "what must be known" is drafted into it as above, and the settled gate is its Rulings bullet of item 1, which the end prints (Steps 10).
   - The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.
4. Ask whether to record an ADR.
   - An answer that is not obvious from the code, binds work after the plan that made it closes, and has alternatives rejected becomes the decision "record as ADR?" in the next round.
   - On the user's yes, write the record in the same turn.
   - Write it in the folder `adr` names, from its `template.md`, or from the form of the folder's latest record when it has no `template.md`.
   - A missing folder, or one with neither `template.md` nor a record, is created or filled first from the `repo-setup` skill's `templates/docs/adr/README.md` and `template.md`.
   - The record is numbered after the folder's highest, and its status is `proposed`.
   - Its decision is the ruled option, its context the facts the decision gave, its alternatives rejected the other options with their cons, and its consequences what the decision said follows.
   - The context, the alternatives rejected and the consequences are argued from this repository's goals, as the ADR folder's `README.md` says, and what other projects ship is evidence for them and never the reason by itself.
   - Its row goes into the folder's index when there is one.
   - A record that changes a decision of an ADR in force supersedes it as the ADR folder's `README.md` says.
   - A refinement of an ADR in force edits that record to its current state, with no dated note.
   - The item is done when the decision is in the next round, or, after the yes, the record read back holds the decision and its status.

## The decision form

Every decision of a round has these parts, in this order, and `references/decision-form.md` shows a round of two.

- **Heading.** `## D<n>. <the decision, as a phrase>`.
- **Options.** Each is lettered, with its pros and its cons.
- **Reference line.** It is always present, is labelled by the design bar for a design decision, and cites for the options what "The design bar" sets.
- **Recommendation.** `Recommend <letter>.` with its reason, argued from this repository's goals and chosen because it is the better design.
- **Lazy option.** The option that costs less now and leaves the work undone, or "none" with the reason when no option is.

- Each claim of the reference line has its source read in this session: a `path:line`, or a URL fetched in the session.
- A reference line is never written from memory.
- The reference line is the evidence the options are weighed with, and never the reason for the recommendation by itself.
- The roadmap diff, "record as ADR?", rule-clash and term decisions are about this repository's own pages: they have every part, their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry) read in this session, and the design bar and `design_references` do not apply to them.

## The design bar

- The design bar applies to design decisions only, as "The decision form" says.
- The design bar is `design_bar`, or the `--bar` value for this interview.
- Under `industry`, the reference line is labelled "Industry:" and cites what production projects in the field ship.
- Under `state-of-the-art`, it is labelled "State of the art:" and cites the best published work.
- Under `novel`, it is labelled "Novel:" and cites both, and each option goes beyond them and says what would show it works.
- `design_references` are the published standards every option is held to, and each option names the clause of each one that bears on it.

## Stops

The first three rows are stops, which wait on the user. The rest are refusals, which name their cause and change nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle and the archived plans a ruling sets aside | The user's answers |
| The end | Steps 10 | The decisions settled with where each was written, the step changes owed, and the question of the shared understanding and the commit | The user's confirmation and answer on the commit |
| A lookup agent served another model | The runner served a lookup agent a model that is not the configured one ("Steps / Looking up a fact") | The configured value of `reviewer` and the served model | The user's instruction, then the lookup started again |
| No configuration | `.agents/plan.yaml` is missing | A refusal that names `/ordo-init` | `/ordo-init`, then `/grill` again |
| No such entry | `<entry>` matches no roadmap entry | A refusal that names `/roadmap add <goal>` | `/grill` with an entry that exists |
| A required key missing | A required key is not in `.agents/plan.yaml` | The key | The key added, then `/grill` again |
| An unknown bar | `design_bar` or `--bar` is not `industry`, `state-of-the-art` or `novel` | The three values | A value of the three, then `/grill` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Asking the user for a fact the skill can look up | The user's answer is a recollection, and it costs the user's time | Look the fact up and ask only the decision that rests on it ("Steps / Looking up a fact") |
| A decision asked while a decision it waits on is open | The user answers without the answer it depends on | Hold it for a later round (Steps 4) |
| An option chosen or recommended for costing less | The work it leaves undone comes back as a later item | Recommend the better design and name the cheaper option as the lazy option ("The decision form") |
| A reference line from memory | Its claim cannot be checked | Read the source in this session and cite its `path:line` or the URL fetched ("The decision form") |
| Batching the writes to the end | A compaction loses the answers, and the next round is drawn from state that is not written | Write each answer in the turn it settles ("Steps / Writing what settled") |

## Rules

- A fact is looked up, never asked.
- A decision is the user's: nothing is written as settled without the user's answer.
  - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.
  - A carried ruling is the user's answer to the decisions it settles.
- Every answer is written in the turn it settles, before the next round is drawn up.
  - A carried ruling, and a roadmap diff a quoted ruling states, are written at the first write of Steps 8.
- No option exempts code from the standards pages: A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it.
