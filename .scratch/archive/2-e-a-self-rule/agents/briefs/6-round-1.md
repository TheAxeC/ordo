# Repair round 1 of step 6

The findings of `agents/reviews/6-refuter.md`, each with its ruling, plus the point you left open on `refute` "Finding dispositions". Work in the same worktree under the same brief, `6-cases.md` and rules. Run no git command of any kind, read-only ones included; compare against copies of the files taken before your first change in this round. The tree as it stood when this round was sent is the patch `agents/reviews/6-before-round-1.patch` in the main checkout's ledger, against the base `5f41763`; take your own copies before any change.

Read first, in the main checkout, read only: `.scratch/2-e-a-self-rule/agents/reviews/6-refuter.md` whole. Where a ruling below gives a sentence word for word, write it as given; a defect you find in a dictated sentence is handed back before you change anything, with the sentence, the case it gets wrong and the result, never reported as a note (finding Proof 2).

The path list widens to every file named below.

## 1. Spec 1: the choice records the name the review searches by

- The `Booked:` line becomes ``Booked: `<path>:<line>` (Open item <L>)`` in "The choices file", in `templates/choices.md` and in every place that states the line's form.
- "The review of a choice" finds the bullet by the name its `Booked:` line gives, in the Rulings section of the plan that line names (or the archived one, as now), the line number being where the search starts; a bullet of that name that does not end "(self-rule)" or "(self-rule)." is a refusal that names it, and nothing is written.
- Walk case 26 again on a scratch copy with a Rulings line shifted by one, and quote the bullet the review rewrites.

## 2. Spec 2: a ruling of the user that replaces a self-rule bullet outside a review

- A `Ruled:` reply, or a `/grill` answer or carried ruling, that replaces a bullet ending "(self-rule)" always writes a Rulings bullet of its own, which names the bullet it replaces: for a `Ruled:` reply, `- Open item <L> (<date>): <the ruling's text>, replacing Open item <L'> (the user).`. The statement goes in "The choices file" (the bullet already there) and in `spec` "Steps / A ruling" 2's sentence that points at it.
- The steps that rest on the replaced bullet are treated as under `C<n> =>`: a step not yet prepared whose tag names the old bullet has its tag rewritten to `(ruling <the new bullet's name>)` and its text to the new ruling; a landed step whose tag or Step 0 names it gets its fix step before the closing; a step in flight gets it at its landing.
- The landing sub-bullet of Steps 9 and the matching bullet of "The review of a choice" match a bullet ending "(self-rule, replaced by <name>)." for any name, `C<n>` or another.

## 3. Spec 3: a clash with an ADR stays with the user

Kind 3 also names "a contradiction of an ADR in force, or an option that supersedes one". The sentence of `refute` "Finding dispositions" on a contradiction of an ADR the brief asked for, `ordo-help`'s line on it and the Stops row "A rule clash" then stay true as written; check each by reading and say so in the report.

## 4. Spec 4 and Standards 3: the stops a count raises

- "The counts" says: the stops a count of "Rules" raises, "A step that does not converge" and the second failure of a step's landing (the `land` skill's Steps 6), are never closed under self-rule, since each ends a step the unattended loop has not brought to an end, and closing it would let the loop run without bound. An item closed under self-rule counts as a stop of its step, as now.
- This replaces the reason clause "since each of its options rewrites, splits or removes a step the user approved", which contradicts kind 3's second sentence.
- "Closing an open item" names "the stops "The counts" names" in place of "the stop "The counts" names".
- `plan-orchestration` Steps 9 (the second failure of a landing), the Rules sentence on a step that cannot go on within the counts, and the `land` skill's Steps 6 and its Stops row "A red line for the user" are then true as written; check each by reading and say so.

## 5. Spec 5: a new script in a stop's option

Kind 3 also names an option that adds a check, a command in the verification list or a script, since the rules file reserves to the user the approval of what a new script computes. The recurring-findings pass keeps its sentence, which now restates kind 3 for its proposals.

## 6. Standards 1: `/plan` under a self-rule quoted ruling

`plan` Steps 3: a step list written under a quoted ruling whose bullet ends "(self-rule)" has each step line end with `(ruling <name>)`, naming that bullet, never `(approved)`; under a bullet ending "(the user)" the list is the approved list, as now. `plan` Rules' sentence on `(approved)` stays true; check it.

## 7. Standards 2: `/grill` under a self-rule quoted ruling

`grill`: a quoted ruling whose bullet ends "(self-rule)" settles the decisions it states, as the orchestrator's choice, and is not the user's answer to the roadmap diff; the roadmap diff it would make stays a decision for the user, as `/roadmap` refuses such a bullet. Change the sentences at lines 123 and 333-334 so they say so, and any other sentence of `grill` that calls a quoted ruling the user's answer.

## 8. Standards 4: sentences the change made false

- `README.md:56`: add that under `self_rule: on` such a stop waits only when it is of a kind `plan-orchestration` leaves open.
- `skills/spec/SKILL.md:3`, "a candidate being the user's choice": "a candidate being the user's choice, or under self-rule the orchestrator's".
- `skills/diagnose/SKILL.md:210` and `skills/land/SKILL.md:183`: each gains the self-rule exception in the form the other changed lines use, pointing at `plan-orchestration`'s self-rule text.
- The **quoted ruling** term in `plan-terms.md` and `docs/glossary.md`: "a ruling given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", or with "(self-rule)" for `plan` and `grill`, with the sub-bullets under it. The sub-bullets state the change in full." followed by its "Stated in:" as now. The two copies stay equal.
- Grep again each name the round changes across `skills/`, `docs/` and `README.md`, and change or report each sentence it makes false.

## 9. Standards 5: material only some runs read

Following `docs/dev/skill-layout.md` "Writing for an agent" (material a step needs only in some runs goes in `references/<name>.md`):

- `skills/plan-orchestration/references/self-rule.md` holds the material of the section, under the same labels (Scope, The six kinds left open, A skill with its own approval stop, Closing an open item, The counts, The choices file, The review of a choice), as `## ` headings, with the changes of this round.
- The `## Self-rule` section of `SKILL.md` keeps two bullets: the scope (`self_rule: on` in the configuration block; with it off or absent, every open item waits for the user), and that under `self_rule: on`, and for the review of a choice, the session reads `references/self-rule.md`.
- Every pointer to the self-rule text, in `plan-orchestration` and in the other skills, the templates, the glossary and the README, names `plan-orchestration`'s `references/self-rule.md` and its heading in place of "Self-rule" and its label. The figure's band sentence does not name the section and stays.
- `docs/dev/skill-layout.md`'s rules on `references/` apply to the new file: check them and say so.

## 10. Proof 1

Redo the walk of verify 3 on a scratch copy after the changes, for cases 9, 16 to 19 and 21 to 26, and quote for each where the name, the bullet and each line written came from.

## Then

Rerun the verify list through `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` from the worktree's root (it now holds the cost-script test as well; the worktree's copy of the state file is older, so run it against the main checkout's state file by its absolute path, `/Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, and say which test fails for want of a file step 4 landed on main after your base, if any), the brief's verify 2 to 7, and the description lengths. Append to `.scratch/2-e-a-self-rule/agents/reviews/6-report.md` in the worktree a section "Repair round 1": each item above with what changed, its before and after, and the checks' output verbatim. Your final message is that section.
