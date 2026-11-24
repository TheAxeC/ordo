# 0054. researcher's idea mode forms the research question in rounds with a novelty check between them, and full starts with it

Status: proposed

## Context

Roadmap entry 13's goal gives `researcher` a `full` mode that takes a request from an idea to a manuscript. An earlier version of the goal started it with the interview of `/paper plan`. That interview plans the structure of a paper, chapter by chapter, towards an outline; it assumes the research exists. The user's starting point can be a rough sketch, and what the research finds can change the question. The `novelty` mode checks the claims of an idea against the closest prior work.

## Decision

`researcher` has a mode `idea`, which is also the first part of `full`. It works in rounds as `/grill` does: each choice of the idea (the problem, the claim, the baseline, the metric, the result that would show it works) is put to the user with its options and a recommendation. Between rounds it runs `novelty` on each candidate claim, so that a claim found done is dropped or sharpened before the next round. It ends with the research questions and claims written into the project's `README.md`. The Compare stage of `research` can reopen it, and a changed question is written with the finding that changed it.

`full` runs `idea`, then `research` and `manuscript`. After `idea` the session shows the modes it will run and the ones it leaves out, each with its reason, and the user confirms once. A result that is partial, unfinished or below what was set as good enough is named as such, and `full` does not go on to `manuscript` on it without the user's word.

## Alternatives rejected

- `full` started with the interview of `/paper plan` and one novelty check: that interview plans a paper's structure and not the research, and one check at the end can only reject an idea, where a check between rounds shapes it.
- `/grill` itself invoked: it reads a roadmap entry and a plan configuration, and a research project has neither.
- The modes of `full` named by arguments, or chosen without showing: the user then learns which modes ran only from what they wrote.

## Consequences

`/paper plan` stays the interview for a paper's structure and is reached through `manuscript`. The `idea` mode is this repository's own and is changed like any other skill text, within this record.
