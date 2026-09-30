# Step 8 landing

Roadmap entry 2.E, grill. Plan step 8 of 17, the revert rule rewritten, landed and ticked. Next: step 9, the two rule sentences.

## Open items

- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## The check of Steps 1

The builder and both reviewers of the step had completed before the landing (their completion notices arrived); none was running.

## NOT DONE

Nothing.

## What landed

- Rule 13 of `docs/dev/change-standard.md` and of `skills/repo-setup/templates/docs/dev/change-standard.md`, identical in both: "A test proves the change by failing on the unchanged tree, and the report quotes the failure", a lead sentence (the unchanged tree; each run quoted verbatim; no revert named) and five sub-bullets: a new or changed test of an added or changed behaviour fails on the unchanged tree, run again after every change to it; a new or changed test of a preserved behaviour passes after the change and on the unchanged tree where it can run; a silent case and its control; a test that would still pass with its behaviour taken out of the code is an audit, found by reading; the table.
- `skills/spec/templates/brief.md:62` and `/refute`'s Proof list (three bullets) say the same; `coding-standards/common.md:13` quotes the new title; `plan-retro`'s example kind is "a test that cannot fail".

## What was found

- Brief check: 10 findings, closed in the brief (`8-brief-check.md`).
- Review: 11 findings, all in the dictated text; repair round 1 rewrote it. The run over the round: 7 findings, fixed at landing (booked in `plan.md`, step 8).
- Two decisions taken under ruling "Overnight work" 5, booked in `plan.md` Rulings: "Step 8, a test of preserved behaviour" and "Step 8, the audit's words".
- Raised: open item "Old rule 13 in game-engine and cathedra".

## Verification

- `land.sh` printed `checks: 8 commands passed` and `6 files changed, 8 insertions(+), 6 deletions(-)`; after the fixes at landing `checks.sh` printed `checks: 8 commands passed`, rc=0; the revert-rule grep over `skills docs README.md utils` prints nothing; lines 39-44 of both copies are identical.

## Usage

Brief check claude-opus-5-5 133639 tokens, 25 tool uses, 313 s, $0.93 to $3.05. Builder claude-sonnet-5-5 103483 tokens, 15 tool uses, 118 s and 130028 tokens, 8 tool uses, 100 s, $0.85 to $2.77. Reviewer claude-opus-5-5 129512 tokens, 25 tool uses, 311 s, $0.92 to $3.02; over round 1 153339 tokens, 25 tool uses, 401 s, $1.04 to $3.60. The builder's first report passed its bar on what it was asked; the findings were in the orchestrator's dictated text. Fixes at landing: 7.

## Next

Step 9: an open item lists every later approval its option triggers (`plan-orchestration`, `spec`); a roadmap goal names no project (`roadmap`'s Rules).
