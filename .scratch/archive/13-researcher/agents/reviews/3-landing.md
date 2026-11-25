# Step 3 landing

Entry 13 of `docs/roadmap.md`, researcher; step 3 of 7, the modes `novelty` and `idea`, landed on main; next, step 4, the modes `research` and `full`, with `/spec 13 4`.

## Open items

- none.

## The check of Steps 1

The builder (a8e79c1e64120e263), the brief-check agent (a5b81d093a7ce8107) and the two reviewers (a779a2f818f5c41bd, a61d1811a1c66fa14) had each ended with a completion notice before the landing.

## Not done

Nothing.

## What landed

- `skills/academic/researcher/SKILL.md`: `/researcher novelty <idea> [<project folder>]` writes a page of the closest prior work with a verdict per claim and a `.bib` of the confirmed works in `notes/`; `/researcher idea <project folder> [<sketch file>]` holds the interview in rounds, checks each candidate claim with `novelty` before the round that asks it, keeps a progress file in `notes/`, and writes the research questions and claims into the README.
- `references/novelty_page.md`, `references/integrity_check.md` and `references/checkpoints.md`.
- The glossary entries, `ordo-init` 5.0.1 with the plan-terms template, the README row and the figure note.

## What was found

- The brief check found that the landed text of `SKILL.md` would be false for four modes in several places, that the page could not reach `paper`'s search as written, and that the two reference sections held material the new modes never read. All were closed in the brief.
- The first review found that the description lost the landed modes' trigger phrases, that a stale progress file could block a reopening, that an `integrity` run no longer read the checkpoint rules, that failed searches could read as `new`, and that `paper`'s literature strategist reads only a `.bib`. Repair round 1 closed all fourteen.
- The run over the round found one gap, a claim the searches could not check, and five smaller ones, each fixed at landing.

## Fixes at landing

Fixes at landing, each a finding of the run over round 1, in `skills/academic/researcher/SKILL.md`: (1) a candidate claim that a run of `novelty` gave no verdict, at the stop "The searches did not run", stays a candidate claim and is checked again, idea item 6 sends a settled claim with no verdict back to item 5, and item 7 shows such an option as unchecked; the options of a claim choice opened again are drawn as item 4 draws options (Spec 1); (2) the title paragraph is three sentences and names the `.bib`, and so does the Quick start line of `novelty` (Standards 1); (3) the joined bullet of idea item 5 is split into one rule per bullet (Standards 2); (4) "What it reads" 13 names `references/novelty_page.md` for `idea` too (Standards 3); (5) the `.bib` writes a work that is a nearest work of several claims once (Behaviour 2); (6) the temporary folder is made before the first `index-abstract` and removed only when made (Behaviour 3). The deviations list of the ledger names the two moved pages in place of the sections and gains the section of step 3 (Standards 4 of the first run, Proof 1 of the run over round 1). Behaviour 1 of the run over round 1, the `.bib` as a new file in `notes/`, is stated in this booking: before the step `researcher` wrote nothing in `notes/`; after it, `novelty` writes `notes/novelty-<date>.md` and `notes/novelty-<date>.bib`, and `idea` writes `notes/idea-<date>.md` and a novelty page and `.bib` per round.

## Verification

`checks: 16 commands passed`, printed by `templates/checks.sh` on the state file, on main after the fixes at landing.

## Usage

builder a8e79c1e64120e263, 278062 tokens, 92 tool uses, 1010 s, and for round 1 326687 tokens, 22 tool uses, 278 s; brief check a5b81d093a7ce8107, 217367 tokens, 55 tool uses, 487 s; reviewer a779a2f818f5c41bd, 191071 tokens, 45 tool uses, 536 s; reviewer over round 1 a61d1811a1c66fa14, 177236 tokens, 30 tool uses, 295 s. The builder's first report did not pass its bar.

## Next

Step 4, the modes `research` and `full`.
