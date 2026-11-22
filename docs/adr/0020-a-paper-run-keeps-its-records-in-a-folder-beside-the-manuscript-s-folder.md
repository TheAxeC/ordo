# 0020. A paper run keeps its records in a folder beside the manuscript's folder

Status: proposed; superseded by 0043 in its sentence on a run that continues an unfinished run, since `paper` no longer offers one

## Context

A `paper` run produces records that show what it changed and why: the block manifests, the patches and the apply reports of a revision, the citation report with a passage per judged claim (ADR 0018) and the approved outline. Roadmap entry 7, `rebuttal`, writes the response letter "from the referee comments and the revision's apply report". The hub kept its own revision trail in `admin/reviews/patches/` and moved it out of the manuscript folder (research-hub commit 4293ea487, "Move the revision round trail out of the manuscript folder"). Full texts fetched for the claim checks are published papers whose PDFs a project does not keep.

## Decision

A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder, with `-2`, `-3` and so on for further runs of the same mode on the same day: the manifests, the patches, the apply reports, the citation report and the approved outline. A run that continues an unfinished run of the same mode writes into that run's folder and makes no new one. Fetched full texts go to a temporary folder that the run removes at its end.

## Alternatives rejected

- Inside the manuscript's folder: the records would sit beside the files a build compiles, which the hub moved its trail away from.
- Nothing kept after the run: the patches and the passages are the only evidence of what a run changed and on what it rested, and `rebuttal` needs the apply report.

## Consequences

`rebuttal` finds a revision's apply report in the run's folder. A project gains one `paper-runs/` folder. No fetched paper is kept in the project, so a later check of a passage fetches the source again.
