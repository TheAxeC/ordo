# 0058. handbook writes a software repository's README and its supporting documentation from the code, from a fixed set of kinds the user confirms

Status: proposed; superseded by 0060 in the kinds bullet's "diagrams as `.dot` with their `.svg`"

## Context

Roadmap entry 27 gives software repositories what `researcher`'s readme mode gives research projects: a README a newcomer can start from, and the documentation beside it. The skills run a C++ engine, a TypeScript tool or a research project alike (`README.md`, the introduction). The software repositories read for the entry share no section list: each opens with a paragraph, says how to build or install, maps its documentation and states its license, and each has sections of its own. Beside the README they keep a getting-started guide, manual pages, reference pages, a feature map, diagrams as Graphviz sources with their SVGs, a one-page manual built by a script, and API pages generated from the code's doc comments. `ordo-init`'s new-repository run writes only a short README. A file the run generates and does not draft, such as the one-page `manual.html`, can fail the repository's own format check, such as `prettier --check .`, when the repository's ignore files do not exclude it.

## Decision

- `handbook` is its own skill under `skills/code/`.
- It writes from a fixed set of kinds: the README, a getting-started guide, manual pages one per part of the product, reference pages one per public surface, a feature map with each capability's status, diagrams as `.dot` with their `.svg`, a one-page `manual.html` built by a script it writes into the repository, the API pages from the doc comments by the language's own tool, and a `docs/README.md` index.
- Its first stop shows which kinds the repository gets and the reason for each kind left out, and the user confirms them.
- Each page is written from the code and the existing documentation, each claim with its source file. A page that exists is brought up to date with every fact kept.
- Every page, and each drafted exclusion line for a generated file, is shown as a draft and written after the user's approval.
- Before the drafts stop, the repository's format and lint commands run on a copy of its working tree in a scratch folder outside it, once before the drafts are put in the copy and once after. They are read from its manifest, build files, CI configuration and documentation, and a type check, a test run, a build and a command that needs an install, the network or a write into the repository are left out. A failure in a drafted file is corrected in its draft, and one in a generated file gets a drafted exclusion line, in at most three rounds. An approved exclusion is committed with the drafts.
- Every README holds a core, `# <name>` with its opening paragraph, what it looks like, build and run or install, where to look and the license, and keeps the repository's own sections, brought up to date.

## Alternatives rejected

- A mode of `ordo-init`: `ordo-init` sets a repository up for the plan skills, and documentation for a newcomer is another job.
- The README alone, or the README with an index: the newcomer still lacks the guide, the manual and the reference the repositories read keep.
- Every kind written for every repository with no stop: a small library gets an architecture series and a feature map it has no use for.
- One fixed section list for every README: it removes the sections by which the repositories differ.
- The format and lint commands run in the repository after the files are written: the run writes into the repository before the approval, and a failure found then has no draft to carry its fix.
- No run of the repository's own checks: the user is left with a red check after the commit and fixes it by hand.
- A clone of `HEAD` as the copy: it misses the working tree's uncommitted changes, such as a changed `.gitignore`, so the commands read a configuration other than the one the repository runs.

## Consequences

A repository's documentation can be brought to a newcomer's standard by one skill, and the user reads each page before it is written. A first run on a large repository is long, since every kind it gets is drafted from the code. A run leaves no file it wrote failing the repository's own format or lint commands, except a failure still there after the third round, which the drafts stop names.
