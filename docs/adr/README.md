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
| [0009](0009-the-cost-script-takes-each-response-s-counts-from-its-response-body.md) | The cost script takes each response's counts from its response body |
| [0010](0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md) | Each plan's verify list is kept equal to the verification page |
| [0011](0011-each-plan-keeps-its-own-dispatch-block-read-across-plans.md) | Each plan keeps its own dispatch block, read across plans |
| [0012](0012-every-commit-on-main-names-its-paths.md) | Every commit on main names its paths |
| [0013](0013-a-script-and-four-fresh-read-only-agents-review-a-draft.md) | A script and four fresh read-only agents review a draft |
| [0014](0014-a-finding-agent-and-a-checking-agent-review-a-diff-s-comments-and-a-rewrite-is-kept-only-when-the-comment-stripped-files-compare-equal.md) | A finding agent and a checking agent review a diff's comments, and a rewrite is kept only when the comment-stripped files compare equal |
| [0016](0016-a-cited-claim-rests-on-a-verbatim-passage-read-from-the-source-in-the-same-run.md) | A cited claim rests on a verbatim passage read from the source in the same run |
| [0017](0017-one-standard-library-script-makes-every-reference-lookup-of-the-paper-skill.md) | One standard-library script makes every reference lookup of the paper skill |
| [0018](0018-a-claim-the-paper-skill-judges-rests-on-a-passage-read-from-the-source-in-the-same-run.md) | A claim the paper skill judges rests on a passage read from the source in the same run |
| [0019](0019-a-paper-run-is-done-by-academic-paper-s-agent-roles-each-a-fresh-agent.md) | A paper run is done by academic-paper's agent roles, each a fresh agent |
| [0020](0020-a-paper-run-keeps-its-records-in-a-folder-beside-the-manuscript-s-folder.md) | A paper run keeps its records in a folder beside the manuscript's folder |
| [0021](0021-paper-runs-writing-itself-and-applies-the-findings-you-accept-as-patches.md) | Paper runs `/writing` itself and applies the findings you accept as patches |
| [0022](0022-a-paper-run-is-done-by-five-agent-roles-and-the-integrity-and-ethics-checks-belong-to-researcher.md) | A paper run is done by five agent roles, and the integrity and ethics checks belong to researcher |
| [0023](0023-paper-ends-a-run-with-the-writing-findings-listed-and-applies-the-ones-you-pick-or-an-autonomous-writer-pass.md) | Paper ends a run with the writing findings listed, and applies the ones you pick or an autonomous writer pass |
| [0024](0024-a-claim-paper-s-citation-check-mode-judges-rests-on-a-passage-read-from-the-source-in-the-same-run.md) | A claim paper's citation-check mode judges rests on a passage read from the source in the same run |
| [0025](0025-a-paper-run-is-done-by-six-agent-roles-three-of-them-resumed-for-a-second-message-in-named-cases-and-the-integrity-and-ethics-checks-belong-to-researcher.md) | A paper run is done by six agent roles, three of them resumed for a second message in named cases, and the integrity and ethics checks belong to researcher |
| [0026](0026-a-manuscript-is-held-to-the-prose-standard-with-the-differences-the-manuscript-prose-standard-lists.md) | A manuscript is held to the prose standard with the differences the manuscript prose standard lists |
| [0027](0027-a-paper-run-is-done-by-eight-agent-roles-four-of-them-resumed-for-a-second-message-in-named-cases-and-the-integrity-and-ethics-checks-belong-to-researcher.md) | A paper run is done by eight agent roles, four of them resumed for a second message in named cases, and the integrity and ethics checks belong to researcher |
| [0028](0028-a-paper-run-checks-each-number-it-writes-and-its-description-of-the-data-handling-against-the-saved-result-files.md) | A paper run checks each number it writes and its description of the data handling against the saved result files |
| [0029](0029-a-paper-run-checks-the-cited-sentences-of-each-later-patch-and-reads-the-findings-pass.md) | A paper run checks the cited sentences of each later patch and reads the findings pass |
| [0030](0030-paper-and-writing-name-the-model-and-effort-of-each-agent-and-read-no-plan-configuration.md) | Paper and writing name the model and effort of each agent and read no plan configuration |
| [0031](0031-paper-asks-at-intake-whether-full-and-revision-end-with-the-writing-review.md) | Paper asks at intake whether full and revision end with the writing review |
| [0032](0032-the-literature-strategist-finds-and-reads-sources-where-academic-paper-does-and-lookup-py-checks-every-reference-it-keeps.md) | The literature strategist finds and reads sources where academic-paper does, and lookup.py checks every reference it keeps |
| [0033](0033-the-citation-compliance-agent-reads-a-source-s-text-from-every-page-it-can-reach-and-quote-check-checks-each-passage.md) | The citation compliance agent reads a source's text from every page it can reach, and quote-check checks each passage |
| [0034](0034-a-role-that-writes-a-bib-entry-may-search-the-web-for-the-venue-page-of-a-published-arxiv-paper.md) | A role that writes a .bib entry may search the web for the venue page of a published arXiv paper |
| [0035](0035-paper-and-writing-run-their-agents-on-the-default-agent-when-the-effort-agents-are-missing.md) | Paper and writing run their agents on the default agent when the effort agents are missing, and go on under a newer model of the configured family |
| [0036](0036-paper-sets-no-limit-on-agent-starts-follows-academic-paper-s-draft-review-and-patch-stops-and-records-each-deviation-from-it.md) | Paper sets no limit on agent starts, follows academic-paper's draft-review and patch stops, and records each deviation from it |
| [0037](0037-paper-searches-a-request-across-research-communities-with-one-literature-strategist-per-search-theme-and-a-merge-run.md) | Paper searches a request across research communities with one literature strategist per search theme and a merge run |
| [0038](0038-paper-fixes-the-parts-of-the-research-question-at-intake-carries-them-through-every-literature-output-and-loads-only-the-strategist-pages-a-start-uses.md) | Paper fixes the parts of the research question at intake, carries them through every literature output, and loads only the strategist pages a start uses |
| [0039](0039-paper-cites-a-renamed-later-version-as-published-confirms-every-lit-review-entry-in-the-session-and-chains-from-the-works-closest-to-each-gap.md) | Paper cites a renamed later version as published, confirms every lit-review entry in the session, and chains from the works closest to each gap |
| [0040](0040-paper-s-literature-strategist-keeps-every-source-that-passes-screening-reads-relevance-by-the-parts-searches-each-named-literature-and-writes-its-entries-from-the-full-record.md) | Paper's literature strategist keeps every source that passes screening, reads relevance by the parts, searches each named literature, and writes its entries from the full record |
| [0041](0041-paper-s-literature-search-queries-every-index-through-lookup-py-writes-no-script-starts-its-merge-jobs-from-the-session-and-closes-the-citation-loop.md) | Paper's literature search queries every index through lookup.py, writes no script, starts its merge jobs from the session, and closes the citation loop |
