# 0052. researcher's integrity and manuscript modes are a copy of academic-pipeline, with the documents it relies on, and a notice names the source

Status: proposed

## Context

Roadmap entry 13's goal makes the `integrity` and `manuscript` modes of `researcher` a copy of the skill academic-pipeline, from the public repository Imbad0202/academic-research-skills at its version 3.13.0. That skill runs a paper through writing, an integrity check, a review, a revision, a re-review and a final integrity check. `docs/roadmap.md` says an entry that rebuilds an existing skill follows that skill's design, and a deviation is made only with its reason and the user's ruling.

Reading the source showed five things a copy has to settle. Its files rely on documents under `shared/` of the same repository: the handoff schemas, which define the records each stage hands to the next, and the compliance check that runs after the integrity agent. It checks references by web search, while ADR 0024 binds a judged claim to a passage read through `lookup.py`. It keeps the pipeline state in the conversation. It contradicts itself in two places: on what follows a failed final check, and on whether a draft that enters midway may skip the first check. It defines no ethics check and points at another skill's agent, which was written for a research report still being planned. The repository's licence is Creative Commons Attribution-NonCommercial 4.0, which asks a shared copy, a changed one included, to name the author, link the licence and say that it was changed.

## Decision

The `integrity` and `manuscript` modes are a copy of academic-pipeline's files at version 3.13.0, each under its own folder and name. The documents a default run needs are taken from the same version of the repository and copied the same way: `shared/handoff_schemas.md`, `shared/compliance_checkpoint_protocol.md`, `shared/agents/compliance_agent.md`, `shared/raise_framework.md`, `shared/prisma_trAIce_protocol.md` and `shared/artifact_reproducibility_pattern.md`. The copy differs from the source only in these points:

- the sections and the frontmatter of `docs/dev/skill-layout.md`, ASCII and the prose standard applied to the skill text, which this repository forces;
- a reference is checked through `lookup.py resolve`, and a judged claim rests on a passage read in the run as ADR 0024 says; the originality screen searches the web as the source does;
- `/researcher integrity` checks a draft at the depth of the source's final check, and `/researcher integrity pre-review` gives the sampled depth;
- a failed final check gets up to 3 correction rounds, then the user decides;
- a draft that enters midway never skips the first integrity check;
- `manuscript` runs `paper` and `paper-review-panel` through the Skill tool, each with its own stops, and sends the integrity corrections to `/paper revision` with the issue list as its comments;
- a run keeps its state in `researcher-runs/<mode>-<date>/` beside the manuscript's folder, each integrity record its own file;
- the ethics check is built from the page `paper` held for it, read by the integrity agent as the last part of its record;
- no rule puts a recorded null result into the manuscript; the record of the experiments keeps its list of such results, so that a claim cannot contradict one;
- the record of the experiments is written by the `research` mode at its last stage, and for a project that did not go through `research` the integrity check asks once and builds it with the user;
- left out: the claim audit before finalizing and the cross-model check, which are off by default in the source and call another vendor's model; the source's patch scripts, since `paper` has its own; the collaboration observer, whose rubric asks other projects to link it and not to copy it; the research stage, the finalizing stage and the process summary, which the goal does not name.

A file `NOTICE.md` at the repository root names `paper`, `paper-review-panel` and the `integrity` and `manuscript` parts of `researcher` as adapted from Academic Research Skills by Cheng-I Wu, with the link, says they were changed, and says those parts are under CC BY-NC 4.0. `README.md` points at it in one line.

## Alternatives rejected

- Every part whose file is missing from the local copy left out: the stage handoffs lose their definitions, and the compliance check the user placed in `researcher` is not built.
- References checked by web search as the source does: `paper` and `researcher` would then check a reference in two ways, and the web search has no title ratio and no retraction notice.
- The sampled depth for a draft checked on its own: most claims go unchecked in the run a user starts to check a finished draft.
- The state kept in the conversation: a run of several hours is lost at a compaction.
- The other skill's ethics agent copied: it plans an ethics approval and checks a sample of the references again, which the integrity check has done on all of them.
- No notice: a shared copy then does not meet the licence's attribution terms.

## Consequences

A later change to the copied stages, checks or stops contradicts this record and needs a record that supersedes it, with the run that showed the copy falling short. The parts under CC BY-NC 4.0 are not for commercial use by anyone who takes this repository. The comparison of the gate reads the copy against the source and against the documents taken from its repository, and each difference it prints has a ruling.
