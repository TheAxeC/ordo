# Self-rule

## Scope

The scope is the first bullet of `SKILL.md`'s section "Self-rule".

## The six kinds left open

An open item of one of these kinds waits for the user, and the open item names its kind by its number:

1. Anything that reaches outside the repository or needs the user's hands or accounts, a model other than the configured one included.
2. Anything that deletes data or touches a secret.
3. A change to the user's written rules (the rules file, the standards pages, the shared rules, `CLAUDE.md`, `.agents/plan.yaml` and the configuration block), a clash between them, or the reversal of a ruling: an option that replaces, removes or contradicts a bullet of a Rulings section, whatever its ending, removes a step the user approved, or reverts a landed step the user approved or one a ruling of the user added.
   - Rewriting an approved step's text to absorb a found premise, and adding a step, are no reversal.
   - Kind 3 also names a contradiction of an ADR in force, or an option that supersedes one.
   - Kind 3 also names an option that adds a check, a command in the verification list or a script, since the rules file reserves to the user the approval of what a new script computes.
4. The closing's roadmap diff, tag and pin.
5. The user's reading of a page a step writes: the reading stays an open item and blocks no step.
6. A choice with no clear recommendation: two options or more that the written rules, the rulings and the ADRs do not rank.

## A skill with its own approval stop

- An option that runs `/roadmap move`, `drop` or `done`, `/roadmap add` of work no finding names, `/ordo-init` or `/repo-setup` under a quoted ruling meets that skill's approval stop, since those commands take only a bullet ending "(the user)" as a quoted ruling, and the item stays open for the user.
- An option that runs `/roadmap add` under a quoted ruling ending "(self-rule)" whose bullet names a finding of a running plan, as the `roadmap` skill's "What it reads" 6 says, is closed like any other, since `/roadmap add` takes such a bullet.
  - After `/roadmap add` commits the entry, the orchestrator adds `the roadmap entry <n>` to the choice's `Builds on it:` line and commits the choices file by path, a resume point.

## Closing an open item

An open item that "The six kinds left open" and "A skill with its own approval stop" do not hold, and that is not one of the stops "The counts" names, is closed by the orchestrator the moment it is raised, whether a skill the loop invokes raised it or the loop's own "Stops" did:

1. The open item is written in full first, as a stop is, with its options, the pros and cons of each, one recommendation and the lazy option named.
2. The option taken is the recommended one.
3. It is booked as the `spec` skill's "Steps / A ruling" 2 books a ruling, the option's text as the ruling's text, with one Rulings bullet whatever the ruling changes: `- Open item <L> (<date>): <the option taken, in one line, and what it unblocks> (self-rule).`
   - That bullet is the line "Steps / A ruling" 2 names for a ruling that adds or splits a step or runs a skill, so a choice has one bullet.
4. The open item moves to the Closed items as `- <date>: Open item <L>, <what was raised>: closed under self-rule, C<n>.`
5. The choice is written to the choices file, as "The choices file" says.
6. The open item, the step's Step 0, the Rulings bullet, the Closed items, the step text the ruling rewrote and the choices file are committed by path at once, a resume point.
7. The loop goes on with the step as the ruling leaves it: `/spec` again for a step stopped before its build, the repair round or the landing for a step stopped after it.

## The counts

- The stops a count of "Rules" raises, "A step that does not converge" and the second failure of a step's landing (the `land` skill's Steps 6), are never closed under self-rule, since each ends a step the unattended loop has not brought to an end, and closing it would let the loop run without bound.
- An item closed under self-rule counts as a stop of its step (the `spec` skill's "Steps / A stop" 3).

## Next-entry mode

Next-entry mode runs the next open roadmap entry after a plan's closing, under self-rule.

- It applies when, after a plan's closing step completes, `.agents/plan.yaml` (in the `projects:` form, the project's keys) holds `self_rule: on` and `next_entry: on`.
  - The orchestrator reads the file itself, since no plan is open then, and `/grill` and `/plan` check the same two keys.
- The closing step is the same with and without next-entry mode: its `/roadmap done` diff stays with the user, as kind 4 of "The six kinds left open" says.
  - The orchestrator takes the next entry only after the closing step has written the closing report and moved the ledger folder.
  - A next-entry run therefore waits at every closing for the user's approval of that diff.
  - The user's approval resumes the closing step, after which the run goes on in the same turn.
- The next entry is the first entry of the roadmap's open order, as the `roadmap` skill's "Steps / Show" prints it, which the orchestrator reads from the roadmap file.
  - With no entry in the open order and none under "Not yet specified", the run ends, and the final message says no open entry is left.
  - With no entry in the open order and one or more under "Not yet specified", the run ends at the first of them, and the final message names it with `/roadmap add <entry>`, which names its gate.
  - An entry that waits on an entry neither done nor dropped, other than one the run has just closed, ends the run there, and the final message names the entry it waits on.
  - An entry with a plan open (a folder under `<ledger_root>/`, outside `<archive_root>/`, whose `plan.md` opens with `# Plan: <entry>`) is run by the orchestrator through the loop on that plan, with no `/grill` and no `/plan`.
    - An open plan with no step that can move without the user is passed over, as `SKILL.md` Steps 2 says.
- For any other next entry, the orchestrator invokes these through the runner, in this order:
  1. `/grill <entry> --self-rule`.
  2. `/plan <entry> --self-rule`.
  3. The loop on the new plan, which runs under its own configuration block.
  - In the `projects:` form `<entry>` is `<project>/<entry>`.
- The run stops at an item of the six kinds, at a stop "The counts" names, at a stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule`, and at a refusal of `/grill` or `/plan`.
  - A `/grill` round of decisions of the six kinds ends the turn.
    - The user's answers resume `/grill`, which goes on under `--self-rule` with the next frontier.
    - The run goes on to `/plan` when `/grill` ends.
  - A stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule` shows its draft and writes nothing.
    - The user's approval or correction resumes `/plan`, which writes the plan with the step list as the user approved or corrected it, each step line ending `(approved)`.
    - The run then goes on to the loop.
  - A refusal changes nothing, and the final message names it.
  - Nothing of such a stop is lost when the session ends, since a decision not yet written is drawn again by the skill that raised it when it runs again.
- A session that takes over reads what is written.
  - `continue the plan` with no plan open, under both keys in `.agents/plan.yaml`, takes the next entry as this section says.
  - An entry with a rulings file and no plan resumes at `/grill <entry> --self-rule`, which draws its tree afresh from the rulings file (the `grill` skill's Steps 3).
  - An entry with a plan open resumes the loop on it.
  - A rulings file that holds the user's own bullets is read the same way: its settled decisions stand, and its open decisions are answered as `/grill --self-rule` answers them.

## The choices file

The file `<ledger_root>/choices.md` is made from this skill's `templates/choices.md` at the first choice, by copying its head and its `Last number` line, and the lines below them show the form of an entry and a choice.

- Each roadmap entry has one heading, `# Entry <entry number> <entry title>`, made at the entry's first choice, the entries in the order of their first choice.
- Under it, each choice has one heading, `## C<n>. <the decision, as a phrase> (<date>)`, where `<n>` is one more than the file's line `Last number: C<m>`, which is then rewritten to `C<n>`, so no number is used twice.
- Under the heading stands the open item as it was raised: its options with the pros and cons of each, the recommendation with its reasons, and the lazy option.
- Then come three lines: `Taken: <the option taken>`, ``Booked: `<path>:<line>` (<the bullet's opening words>)`` and `Builds on it: <the steps, comma-separated, or none>`.
  - `Booked:` names the Rulings bullet by its path relative to the repository root as it stands at the booking, its line, and the bullet's opening words, which the review searches by and a `replacing` clause quotes.
  - The opening words are `Open item <L>` for a bullet "Closing an open item" books, and `D<n> <the decision, as a phrase>` for a bullet `/grill --self-rule` writes.
  - A step's tag names the bullet as the `spec` skill's "What it reads" 4 reads it: `<L>` for a bullet "Closing an open item" books, and `D<n> <the decision, as a phrase>` for a bullet `/grill --self-rule` writes.
  - Before a plan is open for the entry, `Booked:` names the rulings file `<ledger_root>/rulings/<slug>.md`.
  - When `/plan` copies the bullet into the new `plan.md`, it rewrites `Booked:` to that `plan.md` and the line the bullet stands on there, as the `plan` skill's Steps 3 says.
  - `Builds on it:` names the step the open item stopped and each step whose line the ruling rewrote or added.
  - `Builds on it:` also takes `the roadmap entry <n>` for an entry `/roadmap add` wrote under the choice's bullet ("A skill with its own approval stop").
  - `Builds on it:` also takes `the record <path>` for an ADR `/grill --self-rule` wrote with status `proposed` under the choice's bullet.
- A `/grill` run that writes a roadmap diff under a quoted ruling ending "(self-rule)" adds `the roadmap diff of entry <entry number>` to that bullet's choice's `Builds on it:` line, and the files the run commits include it.
- A later `/spec` whose brief rests on the choice (its step's tag names the bullet, or the brief names the bullet) adds its step to the `Builds on it:` line, and its preparation commit carries the file, as the `spec` skill's Steps 6 says.
- The file is never archived, and a closed plan's choices stay in it until the user reviews them.
- A ruling of the user that replaces a bullet ending "(self-rule)" outside a review (a `Ruled:` reply, or a `/grill` answer or carried ruling) always writes a Rulings bullet of its own that names the bullet it replaces: for a `Ruled:` reply, `- Open item <L> (<date>): <the ruling's text>, replacing <the replaced bullet's opening words> (the user).`, and for `/grill`, the bullet the `grill` skill writes.
  - The replaced bullet's ending is rewritten to "(self-rule, replaced by <the new bullet's name>).", its choice is removed from the file, its entry heading with it when no choice is left under it, and `- <date>: C<n>: replaced by <the new bullet's name>.` is added to the Closed items of its plan.
  - The steps that rest on the replaced bullet, those whose tag or Step 0 names it, are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`, with the new bullet's name in each tag. The name is read as the `spec` skill's "What it reads" 4 reads it: `<L>` for a `Ruled:` reply's bullet `Open item <L>`, and the text before its first ` (` for a bullet `/grill` writes.

## The review of a choice

The user types, in any session on the repository:

```
C<n> Agree
C<n> => <the user's ruling, one clause per question the open item asked>
```

- The session finds the choice's bullet by the opening words its `Booked:` line gives, in the file that line names: the Rulings section of a plan's `plan.md` (for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`) or the entry's rulings file `<ledger_root>/rulings/<slug>.md`, and the line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking.
- A bullet with those opening words that does not end "(self-rule)" or "(self-rule)." is a refusal that names it, and nothing is written.
- `C<n> Agree`:
  - The choice leaves the choices file, its entry heading with it when no choice is left under it.
  - The bullet's ending is rewritten from "(self-rule)." to "(the user)."
  - `- <date>: C<n>, <the decision>: agreed by the user.` is added to that plan's Closed items, except as the bullet "A choice booked in a rulings file" says.
- `C<n> => <text>`: `<text>` is booked as a ruling of the user, as the `spec` skill's "Steps / A ruling" says, with the Rulings bullet `- C<n> <the decision, as a phrase> (<date>): <text>, replacing <the old bullet's opening words> (the user).`
  - The old bullet's ending is rewritten from "(self-rule)." to "(self-rule, replaced by C<n>).", which no skill reads as a ruling.
  - A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling, and its tag too, to `(ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, when its tag names the old bullet.
  - A step tagged `(approved)` keeps its tag.
  - When a step of `Builds on it:` has landed and the plan is open, a fix step is added before the closing, `- <k> <what changes to follow C<n>>; check: <the check> (<n> commit) (ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, with its own Step 0 naming the steps it corrects.
  - A step of `Builds on it:` in flight at the review gets its fix step at its landing, in the same form.
  - At the landing of a step whose tag or Step 0 names a bullet ending "(self-rule, replaced by <name>).", for any name, `C<n>` or another, the orchestrator adds that fix step.
  - When a step of `Builds on it:` has landed and the plan is closed, the session drafts `/roadmap add <goal>` for the change, and the draft goes to the user at that skill's approval stop.
  - A roadmap diff of `Builds on it:` is written again from the new bullet by `/grill <entry> --ruling <ledger file> "<the new bullet's name>"`, which takes it as the user's answer.
  - A roadmap entry of `Builds on it:` is changed by `/roadmap` (`drop`, or `add` of the corrected work) under the new bullet, at that skill's approval stop unless the bullet states the change in full.
  - A record of `Builds on it:` is rewritten to follow the new bullet, or removed when the new bullet says no record is kept, in the review's commit.
  - When no step of `Builds on it:` has landed or is in flight, no fix step is added.
  - The choice then leaves the choices file, as under `Agree`, and `- <date>: C<n>, <the decision>: replaced by the user's ruling C<n>.` is added to the Closed items, except as the bullet "A choice booked in a rulings file" says.
- **A choice booked in a rulings file.** When `Booked:` names the entry's rulings file, the review differs in three ways.
  - Neither `Agree` nor `C<n> =>` writes a Closed-items line, since `/plan` copies each bullet line of the rulings file into the plan's Rulings and a Closed-items line there would be read as a ruling.
  - The review's commit message names the choice and the decision.
  - The `C<n> =>` bullet is written to that rulings file, where `/plan` copies it.
- A `C<n>` the choices file does not hold, or no choices file, is refused: the refusal names the numbers the file holds, or says there is no file, and nothing is written.
- The files the review changed are committed by path at once, a resume point.
