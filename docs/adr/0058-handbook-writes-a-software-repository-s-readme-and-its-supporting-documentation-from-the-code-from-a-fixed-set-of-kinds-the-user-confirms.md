# 0058. handbook writes a software repository's README and its supporting documentation from the code, from a fixed set of kinds the user confirms

Status: proposed

## Context

Roadmap entry 27 gives software repositories what `researcher`'s readme mode gives research projects: a README a newcomer can start from, and the documentation beside it. The skills run a C++ engine, a TypeScript tool or a research project alike (`README.md`, the introduction). The software repositories read for the entry share no section list: each opens with a paragraph, says how to build or install, maps its documentation and states its license, and each has sections of its own. Beside the README they keep a getting-started guide, manual pages, reference pages, a feature map, diagrams as Graphviz sources with their SVGs, a one-page manual built by a script, and API pages generated from the code's doc comments. `ordo-init`'s new-repository run writes only a short README.

## Decision

- `handbook` is its own skill under `skills/code/`.
- It writes from a fixed set of kinds: the README, a getting-started guide, manual pages one per part of the product, reference pages one per public surface, a feature map with each capability's status, diagrams as `.dot` with their `.svg`, a one-page `manual.html` built by a script it writes into the repository, the API pages from the doc comments by the language's own tool, and a `docs/README.md` index.
- Its first stop shows which kinds the repository gets and the reason for each kind left out, and the user confirms them.
- Each page is written from the code and the existing documentation, each claim with its source file. A page that exists is brought up to date with every fact kept.
- Every page is shown as a draft and written after the user's approval.
- Every README holds a core, `# <name>` with its opening paragraph, what it looks like, build and run or install, where to look and the license, and keeps the repository's own sections, brought up to date.

## Alternatives rejected

- A mode of `ordo-init`: `ordo-init` sets a repository up for the plan skills, and documentation for a newcomer is another job.
- The README alone, or the README with an index: the newcomer still lacks the guide, the manual and the reference the repositories read keep.
- Every kind written for every repository with no stop: a small library gets an architecture series and a feature map it has no use for.
- One fixed section list for every README: it removes the sections by which the repositories differ.

## Consequences

A repository's documentation can be brought to a newcomer's standard by one skill, and the user reads each page before it is written. A first run on a large repository is long, since every kind it gets is drafted from the code.
