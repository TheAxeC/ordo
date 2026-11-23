# Deviations from the two sources

The skill `codebase-design` follows mattpocock's `codebase-design` and `improve-codebase-architecture`. It differs from them in the points below and in nothing else. Each point has its reason and the ruling that approved it; "plan.md" is `.scratch/19-codebase-design/plan.md`, "Rulings".

## Ruled

1. One skill with the modes `standards` and `review`, in place of two skills. Reason: one vocabulary and one set of pages, loaded once. Ruling: D2, ADR 0047.
2. The mode `standards` is new: the sources have nothing that fills a repository's standards pages. Reason: the review needs written rules to hold the code to. Rulings: D3, D14, D15, ADR 0047.
3. The review holds the code to every standards page, and each candidate names the page and the rule it breaks with its files and lines; the source looks for shallow modules only and names files. The source's questions on where understanding is hard, its deletion test and its vocabulary are kept inside the scan. Reason: one review covers design, coding and UI rules. Ruling: D4.
4. For a subject the repository has no page on, the review uses the default page and says so. Reason: the default pages are the standards the skill holds a repository to. Rulings: D12, ADR 0047.
5. The standards pages are found by a search order: the repository's `plan.yaml`, then `docs/dev/`, then the `repo-setup` folder beside the skill. The source reads fixed names. Reason: a repository keeps its pages where its configuration says, or has none. Rulings: D7, ADR 0047.
6. The review ends in a roadmap entry written through `/roadmap add` and `/grill`; the source ends in its grilling loop. Reason: the candidate becomes work the plan skills can run. Rulings: D5, ADR 0047.
7. The HTML report loads nothing from the network: its styles and diagrams are inline. The source loads Tailwind and Mermaid from two addresses. Reason: the report renders without a network. Ruling: D16.

## Forced by this repository's rules

Ruling for points 8 to 16: "Deviations 8 to 16" of plan.md.

8. The sections and the frontmatter of `docs/dev/skill-layout.md`, with the sources' pages as `references/` files. Reason: every skill follows the layout.
9. The source's `grilling` skill becomes `/grill`, and its `domain-modeling` skill's work (glossary terms, ADRs) is done by `/grill` for the picked candidate; the ADR for a rejected candidate is written by the skill itself, as the source does. Reason: those are the skills this repository has.
10. `GLOSSARY.md` and `docs/adr/` become the glossary and the `adr` folder the repository's `plan.yaml` names, with `docs/glossary.md` and `docs/adr/` when it has none. Reason: the plan configuration says where a repository keeps them.
11. ASCII only: the two box drawings of the vocabulary are redrawn with ASCII characters, and arrows and dashes are reworded. Reason: the repository's character set.
12. No `agents/openai.yaml`. Reason: the skills here run under one runner.
13. The prose standard applied to the skill's text, the sources' content and order kept. Reason: every skill's prose follows it.
14. Each agent is started on the runner's general-purpose agent with the runner's defaults. The sources say "sub-agent with a fresh context window" and name no model. Reason: the form `code-comments` uses in the same group.
15. The user and the model may both invoke the skill. The source's `improve-codebase-architecture` holds `disable-model-invocation: true` and its `codebase-design` does not. Reason: one skill holds both, and the vocabulary serves any work that designs a module.
16. The session reads the files and lines of each candidate before the report is written, and drops a candidate its lines do not show. Reason: an agent's report is a lead.

Rulings for points 17 and 18: "Deviation 17" and "Deviation 18" of plan.md.

17. The design terms of the vocabulary are defined in `references/vocabulary.md` and are not added to the glossary. Reason: the plan-terms block is synced into every repository's glossary, where "module" and "interface" would clash with the repository's own use of those words.
18. A repository with no plan configuration gets `/ordo-init` at the pick, before `/roadmap add` and `/grill`. Reason: the review ends in a roadmap entry (ADR 0047), and both skills need the configuration.

Ruling for points 19 to 26: "Open item A" of plan.md.

19. After the pick, "design it twice" runs before `/roadmap add` and `/grill`, and the ADR offer for a rejected candidate after them. The source runs both inside its grilling. Reason: `/grill` is a skill of its own, which the review invokes (point 6).
20. The user may pick no candidate, and no roadmap entry is then written. The source asks only which candidate to explore. Reason: a run can end without a roadmap entry, and the ADR offer needs a way to reject.
21. The scan agent has a sixth question, "Where does the code break a rule of a standards page?", beside the source's five. Reason: the review holds the code to every standards page (point 3).
22. The goal given to `/roadmap add` names the source's grilling topics (constraints, dependencies with their categories, the shape of the deepened module, what sits behind the seam, which tests survive); the source walks them in its own grilling. Reason: `/grill` settles them from the entry's goal (point 6).
23. Words the glossary gives another sense are reworded: "tier-spanning slice", "technical brief", "use cases", "the default case" and "Step 2". A sentence marks each example as made up. Reason: the glossary, and the rule that an example in a skill says whether it is made up or public.
24. The report's header names each subject that applies to the repository and that its pages lack, with `/codebase-design standards` as the way to fill it. Reason: the review uses the default page for such a subject and says so (point 4).
25. The review's aim reads "friction that makes the code hard to understand and to test"; the source says "testability and AI-navigability". Reason: the review holds the code to every standards page (point 3).
26. "A good stretch back" for the commit history is kept as the source has it, against the prose standard's rule on vague qualifiers (point 13). Reason: a number would be a further difference from the source.
