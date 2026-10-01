# Hand-back of the builder of step 6 at the first run of the cases

NOT DONE: everything in the brief. I stopped at the first run of the cases, before any change, because the brief's rules give a wrong result on three points (A, B and C below). Nothing in `/Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-6` is changed: `diff -r` of `skills`, `docs`, `README.md` and `.scratch` against the copy I took at the start printed nothing ("tree equals the copy taken at the start"). I need the orchestrator's ruling on A, B and C, then I build the whole brief and write `.scratch/2-e-a-self-rule/agents/reviews/6-report.md` in the full shape.

## Open items of the state file (verbatim, `.scratch/2-e-a-self-rule/orchestrator-state.md`)

- Open item C (2026-10-01): the roadmap diff for Open item A's ruling C. Stop "The roadmap diff" of an approval: the goal of entry 2.E.A says where the cost script takes its counts.
  - The change, `docs/roadmap.md` line 24, one sentence of the Goal:
    - Now: "A script computes the priced usage of each agent role of a plan from the agents' transcripts."
    - After: "A script computes the priced usage of each agent role of a plan from the response bodies the runner keeps, and from the agents' transcripts where it kept none, marking such a figure as a lower bound."
  - The Gate stays: "the cost script prints each role's priced usage for plan 2.E and for plan 2.E.A and passes its test". Plan 2.E and steps 1 to 4 of 2.E.A ran before the setting, so their figures are lower bounds.
  - Options: (a) approve the diff; (b) approve it with your wording. Recommendation: (a), since it states the ruled source in the goal's own words. Lazy option: none.

## First run of the cases, on the unchanged tree (read, with the commands)

Commands: `grep -n 'self_rule\|self-rule'` over `plan-orchestration`, `spec`, `refute`, `land`, `ordo-help` and `grill` SKILL.md prints nothing (exit 1); `grep -rn 'choices.md\|(self-rule)\|C<n>' skills docs/dev README.md` prints nothing (exit 1); `ls skills/plan-orchestration/templates` and `ls .scratch/choices.md` print "No such file or directory"; `grep -rn 'ADR [0-9]\{4\}' skills` prints only `plan-terms.md:5` (the placeholder). So no skill reads `self_rule`, `(self-rule)`, `choices.md` or `C<n>`, and every open item waits for the user through "Stops" (`plan-orchestration` lines 54, 288-314).

1. `self_rule` off or absent: met. Nothing closes an item; every stop goes to the user.
2. A model other than the configured one: open, as the Stops row at line 300 says. Met by default; no kind is named.
3. Fix deleting the user's data: open by default. Met by default; kind 2 not named.
4. Recurring-findings proposal: open by default (lines 209 and 216 "the user rules"). The split between a rule sentence (open) and a brief's wording (closed) does not exist. Unmet for the closed half.
5. Option removing an approved step or replacing a Rulings bullet: open by default. Kind 3 not named.
6. The closing's `/roadmap done` diff: open (Stops row at line 299). Kind 4 not named.
7. A page waiting for the user's reading: open as "a stop of its own" (lines 311-312). Met by default; kind 5 and "blocks no step" not named.
8. Two options no rule ranks: open by default. Kind 6 not named.
9. Stop closed under self-rule: unmet. No section, bullet form, choices file or counter exists.
10. A third stop is "A step that does not converge" (`spec` Steps / A stop 3, Stops row line 299). Open. Met by default.
11. Option running `/roadmap add` under a quoted ruling: open. Met by default (`roadmap/SKILL.md:55` takes only "(the user)").
12. A step tagged to a "(self-rule)." line: unmet. `spec:44` and the Stops row at line 300 accept only "(the user)", so it is refused. The "(self-rule, replaced by C4)." half is refused by default, but for the wrong reason.
13. `/plan --ruling` on a "(self-rule)" bullet: unmet. `plan/SKILL.md:56` says no ruling. `/roadmap`, `/ordo-init`, `/repo-setup` (`roadmap:55`, `ordo-init:48`, `repo-setup:49`): met, no ruling.
14. `/grill` and a "(self-rule)" archived bullet: not carried (`grill:50-55`), met. The same bullet after `C<n> Agree`: unmet, since nothing rewrites the ending.
15. `/grill` contradicting a "(self-rule)" bullet: unmet. `grill:113` and `:214` make it a rule clash. A carried ruling dated before it is a clash, as now: met.
16 to 22 and 24: unmet. No skill reads `C<n> Agree` or `C<n> =>`, no choices file exists, nothing refuses `C99`.
23: unmet. No `Last number` line exists.
25: unmet. `grep -n 'choices' skills/ordo-help/SKILL.md` prints nothing, exit 1.
26: unmet. No `Booked:` line or choices file exists.

Description lengths on the unchanged tree: `spec` 1022, `plan-orchestration` 788, `ordo-help` 396 (the count of `docs/dev/skill-layout.md`).

## Cases the brief's rules get wrong

**A. The recurring-findings pass proposes a check (case 4's family).**
- Rule: item 2 says for lines 209 and 216 "a proposal whose change is a rule sentence in the rules file, a standards page or the shared rules is kind 3 and waits for the user; any other proposal is closed under self-rule". Line 211 of the same section also allows "a check (a command in the verification list, or a script)", and line 215 says "The user's ruling on the proposal approves what it computes, before it is written".
- Result: a check proposal is "any other proposal", so it is closed under self-rule and the script is written with no approval of what it computes. That contradicts line 215, which stays, and the rules file ("A new script needs the user's approval of what it computes before it is written", `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read"). Its command joins the `verify:` list of the configuration block, which kind 3 as dictated already names.
- Options: (a) lines 209 and 216 say a proposal whose change is a rule sentence in the rules file, a standards page or the shared rules, or a check, is kind 3 and waits for the user, and any other proposal is closed; (b) the sentences as the brief gives them. Recommendation: (a). Lazy option: (b), which costs no extra words and skips the user's approval of a script.

**B. A "(self-rule)" bullet replaced outside a review (case 24, and the `/grill` leg of case 15).**
- Rule: item 1.5's last bullet (the choice leaves the file, the Closed items gain `C<n>: replaced by <the ruling's name>`) stands in `plan-orchestration` only. Item 4's dictated sentence in `spec` "Steps / A ruling" 1 points at "Self-rule" only for booking a choice. Item 8's dictated `grill` sub-bullet at line 214 names no choices file. Nothing rewrites a replaced bullet's ending to "(self-rule, replaced by <name>)." for a `Ruled:` reply; only `C<n> =>` and `grill` do.
- Result: a session that books a `Ruled:` reply by `spec` "Steps / A ruling" leaves the choice in `choices.md`, leaves the old bullet ending "(self-rule).", so `spec:44` still accepts it as a ruling, and a later `C<n> Agree` finds a replaced bullet. A `/grill` session leaves the choice in the file the same way. Case 24 expects the choice removed and the Closed items line written.
- Options: (a) keep the dictated sentences and add one sentence to `spec` "Steps / A ruling" 2 and one to each of `grill`'s two new sub-bullets, pointing at `plan-orchestration`'s "Self-rule", "The choices file", and have that section state, once, the rewriting of the old ending to "(self-rule, replaced by <the ruling's name>)." together with the removal and the Closed items line; (b) as the brief has it. Recommendation: (a), since the sessions that book those replacements are `spec`'s and `grill`'s, and `spec` and `grill` do not read `plan-orchestration`. Lazy option: (b).

**C. `C<n> =>` and the steps of `Builds on it:` (cases 19 and 20, an input they do not state).**
- Rule: item 1.6 rewrites the tag and text of a step "not yet prepared, whose tag names the old bullet", and adds the fix step of a step "in flight at the review" "at its landing". A `Builds on it:` line always holds the step the open item stopped (case 9), and that step's tag is `(approved)`.
- Result 1: a not-yet-prepared step tagged `(approved)` keeps the text the old choice rewrote, because its tag names no bullet.
- Result 2: for an in-flight step, the choice has left the file at the review, and no text says what finds the step at its landing. `plan-orchestration` Steps 9 and the `land` skill read nothing of it, so the fix step is never added. The step's Step 0 names the stopped open item, and a step added by the choice carries a tag naming the old bullet, now ending "(self-rule, replaced by C<n>)."; both can serve as the finding.
- Options: (a) a not-yet-prepared step of `Builds on it:` has its text rewritten to the new ruling, and its tag too when the tag names the old bullet; at the landing of a step whose tag or Step 0 names a bullet ending "(self-rule, replaced by C<n>).", the orchestrator adds its fix step, stated in the section and pointed at from a sub-bullet of Steps 9; (b) the section only, with no pointer in Steps 9 and the text rewrite conditioned on the tag as the brief has it. Recommendation: (a). Lazy option: (b).

## Sentences outside the brief's list that the change makes false, which I will carry unless you rule otherwise

- `skills/plan-orchestration/SKILL.md:298`, Stops row "A finding that is the user's", When cell: "which becomes a step only by the user's ruling". It is in a file the step writes whole. It takes the same replacement as lines 57, 258, 267 and 346.
- `skills/land/SKILL.md:214`: "A landed commit is reverted only on the user's ruling." It is inside the brief's range 211-215. Under `self_rule: on`, a revert is no kind of the six, so a choice can close it. It takes the same replacement as line 213. Tell me if a revert of a landed commit should be a seventh item left open.

## Scope boundary the brief sets

The review of a choice (item 1.6) finds its bullet by the name `Open item <L>`, so a choice `/grill` writes under `next_entry` (a `D<n>` bullet, possibly in a rulings file) is not reachable by it. That is step 7's, as the brief's item 15 and the plan's step line place it.

Copies for the later diffs and the `cmp` of the figures are at `${TMPDIR}ordo6-before` (`/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/ordo6-before`), holding `skills`, `docs` (the figures included), `README.md` and `ledger/.scratch`.
