# 0057. researcher writes a project's README and code README in a newcomer's layout, and its readme mode brings both up to date

Status: proposed

## Context

ADR 0053 makes a project's `README.md` the entry file of `researcher`'s modes and lists what it holds, in an order set by what a resuming session needs: the question and claims, the constraints and limits, where things live, the cluster's facts, the stage and campaign that stand, the results, the dead ends, the papers and the next actions. Roadmap entry 27's goal has the README written for a newcomer as well: one who reads it top to bottom first needs what the project is, why it matters, the data, the method and the related work, and only then the working state. The research projects read for the entry were mostly written to another layout, many held a dated log under Next, and several `code/README.md` files could not be run by a stranger. The skill had no mode that brings a README that exists to its layout: the adopt mode adds the sections a README lacks and changes none of its own.

## Decision

- A project's `README.md` holds, in this order: `# <project>` with one line on what it is, its status and its venue; `## In short`; `## What it is and why`, with `### The problem`, `### Why it matters` (for a method applied to a clinical dataset, its clinical relevance) and `### What it does`; `## Research questions and claims`; `## Data`, one `###` per dataset with its source, version, access and paths; `## Method`, with `### The approach` and `### What is not claimed`; `## Constraints and limits`; `## Related work`, with `### The closest prior work` and `### What this project adds`; `## Results and how to reproduce`, one `###` per result with its number, its file under `code/results/`, its command and whether it beats the baseline and reaches what was set as good enough; `## Papers`; `## Dead ends (do not retry)`, one `###` per method with its folder in `code/attic/` and why it failed; `## Next`, a short numbered list from which a finished item moves to Results or Dead ends; `## Working state`, with `### The stage and campaign that stand`, `### Where things live` and `### Cluster facts`.
- Once a paper is the canonical record, Method and Related work hold a pointer to it and what the paper does not hold. A section past 200 lines moves to a file of `notes/` and is linked, and an empty section reads `None yet.`
- `code/README.md` holds `# <project>: code` with a short introduction, then `## What it computes`, `## Requirements`, `## Data`, `## Run`, `## What each result comes from`, `## Layout` and `## License and citation`, for a newcomer reading the public deposit of `code/`.
- `code/.depositignore` leaves `data/`, `attic/`, `results/`, `figures/`, caches and secrets out of the deposit, so that no dead end is published and every result is rebuilt by `run_all.sh`.
- The mode `/researcher readme <project folder>` reads both files and the project's files, drafts each whole in its layout, shows each draft with every change and where each fact of the old text went, and writes after the user's approval. Every fact of the old text is kept, in its section or in a `notes/` file the README links. A section the files cannot fill is drafted from the manuscript and the notes with each sentence's source, and what no file holds is a question in the draft.
- The adopt mode brings a project's README to the layout by the readme mode's rewrite, with the same approval stop.
- The skill reads and writes no file of any other tool.

## Alternatives rejected

- A mode that checks and reports only: the user must then fix each README by hand, and the reports pile up unfixed.
- A rewrite written without the approval stop: a fact moved to the wrong place reaches the file every later run reads first, unseen.
- The working state first, as before: a newcomer reads the stage that stands before learning what the project is.
- Constraints and limits under the working state: the results are judged against what was set as good enough, and the reader would meet the results before that bar.
- Reading or writing a project manifest: it ties the skill to one tool, while the skills carry no project specific.
- A deposit that leaves out `data/` alone: the dead ends in `attic/` would be published.

## Consequences

Every mode of `researcher` reads the new headings, so the adopt mode's test for a usable README and every reference to `## The stage and campaign that stand`, `## Results`, `## Dead ends` and `## Constraints and limits` change with it. A README written to the old layout is brought to the new one by the readme mode, with the user's approval of each draft.
