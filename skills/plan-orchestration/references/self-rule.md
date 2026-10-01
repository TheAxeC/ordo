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

An option that runs `/roadmap`, `/ordo-init` or `/repo-setup` under a quoted ruling meets that skill's approval stop, since those skills take only a bullet ending "(the user)" as a quoted ruling, and the item stays open for the user.

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

## The choices file

The file `<ledger_root>/choices.md` is made from this skill's `templates/choices.md` at the first choice, by copying its head and its `Last number` line, and the lines below them show the form of an entry and a choice.

- Each roadmap entry has one heading, `# Entry <entry number> <entry title>`, made at the entry's first choice, the entries in the order of their first choice.
- Under it, each choice has one heading, `## C<n>. <the decision, as a phrase> (<date>)`, where `<n>` is one more than the file's line `Last number: C<m>`, which is then rewritten to `C<n>`, so no number is used twice.
- Under the heading stands the open item as it was raised: its options with the pros and cons of each, the recommendation with its reasons, and the lazy option.
- Then come three lines: `Taken: <the option taken>`, ``Booked: `<path>:<line>` (Open item <L>)`` and `Builds on it: <the steps, comma-separated, or none>`.
  - `Booked:` names the Rulings bullet by its path relative to the repository root as it stands at the booking, its line, and its name `Open item <L>`, which the review searches by.
  - `Builds on it:` names the step the open item stopped and each step whose line the ruling rewrote or added.
- A `/grill` run that writes a roadmap diff under a quoted ruling ending "(self-rule)" adds `the roadmap diff of entry <entry number>` to that bullet's choice's `Builds on it:` line, and the files the run commits include it.
- A later `/spec` whose brief rests on the choice (its step's tag names the bullet, or the brief names the bullet) adds its step to the `Builds on it:` line, and its preparation commit carries the file, as the `spec` skill's Steps 6 says.
- The file is never archived, and a closed plan's choices stay in it until the user reviews them.
- A ruling of the user that replaces a bullet ending "(self-rule)" outside a review (a `Ruled:` reply, or a `/grill` answer or carried ruling) always writes a Rulings bullet of its own that names the bullet it replaces: for a `Ruled:` reply, `- Open item <L> (<date>): <the ruling's text>, replacing Open item <L'> (the user).`, and for `/grill`, the bullet the `grill` skill writes.
  - The replaced bullet's ending is rewritten to "(self-rule, replaced by <the new bullet's name>).", its choice is removed from the file, its entry heading with it when no choice is left under it, and `- <date>: C<n>: replaced by <the new bullet's name>.` is added to the Closed items of its plan.
  - The steps that rest on the replaced bullet, those whose tag or Step 0 names it, are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`, with the new bullet's name in each tag. The name is read as the `spec` skill's "What it reads" 4 reads it: `<L>` for a `Ruled:` reply's bullet `Open item <L>`, and the text before its first ` (` for a bullet `/grill` writes.

## The review of a choice

The user types, in any session on the repository:

```
C<n> Agree
C<n> => <the user's ruling, one clause per question the open item asked>
```

- The session finds the choice's bullet by the name its `Booked:` line gives, in the Rulings section of the plan that line names or, for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`, and the line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking.
- A bullet of that name that does not end "(self-rule)" or "(self-rule)." is a refusal that names it, and nothing is written.
- `C<n> Agree`:
  - The choice leaves the choices file, its entry heading with it when no choice is left under it.
  - The bullet's ending is rewritten from "(self-rule)." to "(the user)."
  - `- <date>: C<n>, <the decision>: agreed by the user.` is added to that plan's Closed items.
- `C<n> => <text>`: `<text>` is booked as a ruling of the user, as the `spec` skill's "Steps / A ruling" says, with the Rulings bullet `- C<n> <the decision, as a phrase> (<date>): <text>, replacing Open item <L> (the user).`
  - The old bullet's ending is rewritten from "(self-rule)." to "(self-rule, replaced by C<n>).", which no skill reads as a ruling.
  - A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling, and its tag too, to `(ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, when its tag names the old bullet.
  - A step tagged `(approved)` keeps its tag.
  - When a step of `Builds on it:` has landed and the plan is open, a fix step is added before the closing, `- <k> <what changes to follow C<n>>; check: <the check> (<n> commit) (ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, with its own Step 0 naming the steps it corrects.
  - A step of `Builds on it:` in flight at the review gets its fix step at its landing, in the same form.
  - At the landing of a step whose tag or Step 0 names a bullet ending "(self-rule, replaced by <name>).", for any name, `C<n>` or another, the orchestrator adds that fix step.
  - When a step of `Builds on it:` has landed and the plan is closed, the session drafts `/roadmap add <goal>` for the change, and the draft goes to the user at that skill's approval stop.
  - A roadmap diff of `Builds on it:` is written again from the new bullet by `/grill <entry> --ruling <ledger file> "<the new bullet's name>"`, which takes it as the user's answer.
  - When no step of `Builds on it:` has landed or is in flight, no fix step is added.
  - The choice then leaves the choices file, as under `Agree`, and `- <date>: C<n>, <the decision>: replaced by the user's ruling C<n>.` is added to the Closed items.
- A `C<n>` the choices file does not hold, or no choices file, is refused: the refusal names the numbers the file holds, or says there is no file, and nothing is written.
- The files the review changed are committed by path at once, a resume point.
