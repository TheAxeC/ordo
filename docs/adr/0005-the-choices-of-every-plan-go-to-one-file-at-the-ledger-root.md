# 0005. The choices of every plan go to one file at the ledger root

Status: proposed

## Context

Under self-rule each decision the orchestrator takes is written to a file for the user's later review (`docs/roadmap.md`, entry 2.E.A). With `next_entry` on, the orchestrator runs one roadmap entry after another, `/grill` included, so choices are made before a plan's folder exists, and each closed plan's folder moves to `archive_root`. The user reviews the choices from time to time, across however many entries ran.

## Decision

Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry. The file is never archived. An entry leaves it when the user has reviewed it.

## Alternatives rejected

- A `choices.md` beside each plan's state file: the choices not yet reviewed move into the archive with each closed plan and are spread over its folders, and `/grill`'s choices need a file of their own until `/plan` opens the folder.
- The choices only as "(self-rule)" bullets of the Rulings: a bullet cannot hold the options, their pros and cons and the lazy option, so the review loses them.

## Consequences

The user reviews one file. A choice's `Booked:` path points into a plan's ledger, which moves when the plan closes, so the path is written as it stands when the choice is booked and the plan's slug finds it in the archive.
