# 0028. A paper run checks each number it writes and its description of the data handling against the saved result files

Status: proposed

## Context

ADR 0027 decides that `paper`'s runs "hold no integrity check" and that the integrity check, which "covers the references, the claims against each source's full text, the numbers against the saved runs and the figures against their traces", belongs to `researcher`. `researcher` is roadmap entry 13 (`docs/roadmap.md`) and is not built. In plan 5's step 5, the `paper` revision side wrote "The raw beat window did not (ARI at most 0.049)" where the saved `results_mitbih.csv` gives raw-beat HDBSCAN an ARI of 0.107, and its readings quoted the line without checking the number (`.scratch/5-paper/agents/reviews/5-revision-fault-trace.md`). The `paper` full side wrote "a missing value is replaced by the training mean" while 819 of the 17,855 rows of the saved `cohort_icd_h365.csv` hold a P-wave duration from 29,500 to 29,899 ms, a missing-value code never recoded (`.scratch/5-paper/agents/reviews/5-blind-comparison/full/judgment-1.md`). Ruling BH of plan 5 takes option (a).

## Decision

In full and revision mode the draft writer records in `intended-claims.md`, for each number it writes, the result file and row it reads it from. Each reading of the peer reviewer checks each number the patches wrote against that file and row, and each description of how the data were handled against the result files it rests on. `researcher` keeps the rest of the integrity check: the references, the figures against their traces, and its own run over the finished draft. This record supersedes ADR 0027 in that part, and ADR 0027 stands for every other part.

## Alternatives rejected

- ADR 0027 kept whole, with the reading checking only that each new number has a recorded file and row: a misread number and a data-handling description the result files contradict then pass every check of a `paper` run, and stay until `researcher` exists.
- The check left to the citation compliance agent: that agent judges cited claims against their sources' full texts (ADR 0024), and a number read from the study's own results has no citation to judge.

## Consequences

A `paper` run finds a number its result file contradicts, and a description of the data that the files contradict, before the run ends. The draft writer's page, the peer reviewer's page and the record of `intended-claims.md` carry the rule. When `researcher` is built, its integrity check does not check again the numbers a `paper` run has checked against the same file, and the record that builds it says so.
