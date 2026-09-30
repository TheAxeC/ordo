# Architecture decision records

A record is kept per decision that is not obvious from the code and binds work after its plan closes. It holds the reasoning and the alternatives rejected. Every other decision the user rules on stays a ruling of the plan that made it. A choice is justified from this repository's goals, never from what another project does.

A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on. A builder's change that contradicts one against its brief is repaired like any other finding. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.

A record is `NNNN-<decision-as-a-phrase>.md` from `template.md`, numbered in order, and listed here.

| | Decision |
|---|---|
| [0001](0001-the-writing-base-reads-the-prose-standard-where-it-is.md) | The writing base reads the prose standard where it is |
| [0002](0002-the-prose-standard-holds-over-the-academic-sources.md) | The prose standard holds over the academic sources |
| [0003](0003-a-fresh-read-only-agent-reviews-a-draft.md) | A fresh read-only agent reviews a draft |
| [0004](0004-a-decision-taken-under-self-rule-ends-self-rule-until-the-user-agrees.md) | A decision taken under self-rule ends "(self-rule)" until the user agrees |
| [0005](0005-the-choices-of-every-plan-go-to-one-file-at-the-ledger-root.md) | The choices of every plan go to one file at the ledger root |
| [0006](0006-the-ledger-records-every-agent-s-id-with-its-role.md) | The ledger records every agent's id with its role |
| [0007](0007-the-run-over-a-repair-round-runs-on-its-own-reviewer-model.md) | The run over a repair round runs on its own reviewer model |
| [0008](0008-the-cost-script-prices-from-a-table-copied-by-hand.md) | The cost script prices from a table copied by hand |
