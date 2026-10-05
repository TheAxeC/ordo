# 0010. Each plan's verify list is kept equal to the verification page

Status: proposed

## Context

`/plan` copies the verification page's commands into the plan's configuration block when the plan opens (`skills/plan/SKILL.md`, Steps 4), and `checks.sh` runs that copy (`skills/land/templates/checks.sh`). Nothing updates the copy afterwards. A test the page gained while plans 2.F, 2.G and 2.H were open, `plan_cost.test.sh`, was missing from all three plans' lists until it was added by hand. Roadmap entry 2.I requires that every open plan runs the list the verification page holds now.

## Decision

`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them. On a difference, the session rewrites the list in the state file and names the change in the brief or the booking. The compare is made by reading, with no script.

## Alternatives rejected

- The landing of a step that changes the page rewrites every open plan's list: an edit of the page outside a plan's step reaches no plan.
- `checks.sh` reads the verification page itself: the script would parse a page whose form each repository sets, with its filters on another page, and a change to what a script computes needs the user's approval.

## Consequences

A landing is held to the checks main holds at that moment. Each preparation and each landing reads the verification page once more. A page edited outside any plan reaches every open plan at its next preparation or landing.
