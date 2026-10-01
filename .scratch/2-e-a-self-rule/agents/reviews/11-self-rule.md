# Step 11: the self-rule run of plan 2.E.A

Step 11 of plan 2.E.A, for your reading. Since step 6b set `self_rule: on` in this plan's state block, the plan's steps raised six open items, F, G, H, I, L and M. Each one below is either closed under self-rule with its entry in `.scratch/choices.md`, or left open under a named kind. The sources are the state file's open items and Closed items, `plan.md`'s Rulings and Step 0 sections, and the commits named.

## Closed under self-rule, each with its entry in the choices file

- Open item F, how `/grill` and `/plan` know that the loop runs them in next-entry mode. Raised by `/spec 2.E.A 7` as the stop "A user-visible choice", of none of the six kinds. Closed with its recommendation, option (a), the argument `--self-rule` refused without `self_rule: on` and `next_entry: on`. Booked as the Rulings bullet `Open item F` ending "(self-rule)." and written to the choices file as C1, in commit e12c862. You agreed with it (`C1 Agree`), so the bullet now ends "(the user)." and C1 left the file, in commit ebf5630.
- Open item G, how a quoted ruling ending "(self-rule)" names the finding whose work `/roadmap add` may write. Raised by `/spec 2.E.A 7` as the stop "A brief check finding the brief cannot absorb", of none of the six kinds. Closed with its recommendation, option (a), any finding of a report under a running plan's `agents/reviews/`, named by path, heading and number, checked by `/roadmap`. Booked as `Open item G` ending "(self-rule)." and written to the choices file as C2, in commit ecdb937. You agreed with it (`C2 Agree`), in commit ebf5630.

- Open item M, the closing of a plan whose ledger names no agent. Raised by step 12's brief check, of none of the six kinds. Closed with its recommendation, option (a), the closing step running the cost script only when the ledger names an agent and otherwise writing that the plan started no agent. Booked as `Open item M` ending "(self-rule).", written to the choices file as C3 and added as step 11b, in commit f84d3e7. C3 waits for your review.

## Left open under a named kind

- Open item H, whether the shared rule on self-rule covers `/grill` and `/plan` run with `--self-rule`. Raised by step 7's brief check. Left open as kind 3, a change to the written rules (the shared rules and `~/.claude/CLAUDE.md`), in commit ecdb937. You ruled (a); its sentence landed with step 8 at `skills/repo-setup/templates/shared-rules.md:20`, and the same words are yours to put in `~/.claude/CLAUDE.md`, whose line 24 still holds ruling B's sentence (`grep -n 'self_rule' ~/.claude/CLAUDE.md`).
- Open item I, how step 9's run reaches the skill text of steps 6 to 8. Raised by `/spec 2.E.A 9`. Left open as kind 1, since it needs your approval to pin the installed skills, in commit ef827bb. You ruled (a): main's head is tagged `v2.8.0-rc.1` and pinned for step 9's run, and the pin goes back to v2.7.0 after it.
- Open item L, when and which part of a skill's version is raised. Raised by step 12's brief check. Left open as kind 3, since the rule belongs in the standards page `docs/dev/skill-layout.md`, in commit f84d3e7. You ruled (a): step 12 writes the rule into that page and raises the eleven versions by it.

## Your ruling on kind 3

While H was open you also ruled that a change to the written rules stays with you under self-rule, and the six kinds are unchanged (the Rulings bullet "Kind 3 under self-rule").
