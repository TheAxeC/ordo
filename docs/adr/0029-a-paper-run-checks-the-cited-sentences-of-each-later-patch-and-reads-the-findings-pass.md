# 0029. A paper run checks the cited sentences of each later patch and reads the findings pass

Status: proposed; superseded by 0036 in its sentence that ADR 0027's "No other agent receives a second message" stands; superseded by 0043 in the reading of the findings pass by a fresh peer reviewer and in the draft-review writer passes, now the draft writer's rewrite of each revision loop of full mode and revision's second writer pass, the incremental check of each later patch standing

## Context

ADR 0027 decides that the citation compliance agent "runs in full mode before the draft review, in revision mode after the patches, and in citation-check mode as the whole run", and counts its starts and the draft writer's passes. ADR 0023 decides that a one-line reply to the closing `/writing` report "starts the draft writer for those findings ... and then the compile again", at the cost of "one patch pass and one compile". In plan 5's step 5, the `paper` revision side wrote cited sentences in patches after the one citation check, among them the closing findings pass, and nothing checked them against their sources or read what the findings pass changed (`.scratch/5-paper/agents/reviews/5-revision-fault-trace.md`; `5-single-mode-runs.md`, single-5 and single-6). In full mode the draft-review writer passes and the findings pass write cited sentences the same way. academic-paper 3.2.0 checks citations once in each mode. Ruling BI of plan 5 takes option (a) of its part 3.

## Decision

In full and revision mode, after each patch that adds or changes a cited sentence once the first citation check has run (revision's second writer pass, the draft-review writer passes, the reference fix, the compile fix and the findings pass), a fresh citation compliance agent checks those sentences only, as the patch file gives them, fetching their sources again into a new temporary folder when the run's folder is gone. After the findings pass a fresh peer reviewer reads the pass's changes, its numbers and its descriptions of the data; an item it records goes to the draft writer once, and the compile follows. This record supersedes ADR 0027 in when the citation compliance agent runs and in its counts of starts and passes, and ADR 0023 in what follows the findings pass; both stand for every other part.

## Alternatives rejected

- ADR 0027 and ADR 0023 kept whole, the citation check run once: a cited sentence a later patch writes, and every change of the findings pass, reach the final manuscript unchecked.
- The checks in revision mode only, full mode keeping the one check of ADR 0027: full mode's draft-review writer passes and findings pass write cited sentences that stay unchecked, the same cause.

## Consequences

No cited sentence of a full or revision run goes unchecked against its source, and the findings pass is read before the run ends. A run costs one more citation compliance start for each later patch that writes a cited sentence, its fetches, and one more peer reviewer start after the findings pass, which departs from academic-paper's single check. Each such start is a fresh agent, so ADR 0027's "No other agent receives a second message" stands. `skills/paper/SKILL.md` and the pages of the citation compliance agent and the peer reviewer carry the rule.
