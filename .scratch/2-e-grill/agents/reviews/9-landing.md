# Step 9 landing

Roadmap entry 2.E, grill. Plan step 9 of 17, the one-ruling sentence and the roadmap's repository names, landed and ticked. Next: step 10, `plan-help` renamed `ordo-help`.

## Open items

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", run before step 12, and its text in those four skills. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## The check of Steps 1

The builder and both reviewers of the step had completed before the landing (their completion notices arrived); none was running.

## NOT DONE

The exception that would let `plan`, `roadmap`, `ordo-init` and `repo-setup` skip their approval stop under a ruling: built in the repair round, left out of main, raised as open item "Approval stops under a ruling".

## What landed

- `plan-orchestration` Stops and `spec` "Steps / A stop": each option states every approval it would need later whose content exists when it is written (what a new script computes, a change to the configuration or the verification list), approved by the one ruling; work not yet done and a skill's own approval stop stay stops, named in the option. `spec`'s open item holds its options and their pros and cons.
- The state template and the term **open item**: what each option would need approved later.
- `plan-orchestration`'s recurring-findings pass and `plan-retro`'s proposal item 4: the ruling or decision on the proposal approves what a check computes.
- `roadmap` Rules: another repository named only where the entry reads or changes it; its files written as paths from the folder that holds this repository; `docs/roadmap.md:151` so written.

## Verification

`land.sh` exited 0 with `checks: 8 commands passed`; after the fixes at landing `checks.sh` printed `checks: 8 commands passed`, rc=0; the staged diff is `8 files changed, 14 insertions(+), 7 deletions(-)`.

## Usage

Brief check claude-opus-5-5 129625 tokens, 36 tool uses, 313 s, $1.06 to $3.11. Builder claude-sonnet-5-5 103880 tokens, 16 tool uses, 141 s and 136520 tokens, 8 tool uses, 119 s, $0.83 to $2.83. Reviewer claude-opus-5-5 155862 tokens, 31 tool uses, 341 s, $1.33 to $4.27; over round 1 150149 tokens, 27 tool uses, 335 s, $1.12 to $3.60. Fixes at landing: 2.
