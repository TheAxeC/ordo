# The last message of turn 1, as it printed it

The `/paper lit-review` run has passed its pre-checks and its run folder exists. The literature strategist has not started yet, because it cannot start until you answer the intake questions below. The two answers it needs most are the research question and the evidence profile.

Checks that passed:
- `.agents/plan.yaml` is set to `reviewer: claude:opus` and `reviewer_effort: high`, and `standards` is empty. The role agents will therefore run as `ordo-high` on `claude-opus-5-5`.
- The prose standard comes from the repo-setup template (`~/.claude/skills/repo-setup/templates/docs/dev/prose-standard.md`), because `docs/dev/prose-standard.md` does not exist in this repository. The three writing pages are present.
- `printenv CLAUDE_CODE_EFFORT_LEVEL` exited 1, so the effort setting will apply to the agents.
- There were no earlier runs (`paper-runs/` did not exist). The new run folder is `paper-runs/lit-review-2026-11-15/`, created empty, in the current folder.
- You gave no `.tex`, so the run writes `review.md` and `refs.bib` in the run folder and patches no manuscript.

## Intake questions

1. **Topic.** I took this from your call, so please confirm it: "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on."

2. **Research question (required).** The strategist will not search on a topic alone, so this needs your own wording or your confirmation of mine. Proposed:
   "Which methods predict a subject-level outcome from data whose spatial mode varies in size or order across subjects (point clouds, variable sets of lesions or regions)? The review covers multilinear and tensor regression and partial least squares, tensor decompositions with an unaligned mode, entropic, Gromov-Wasserstein and fused Gromov-Wasserstein optimal transport with barycenters and learnable template dictionaries, and permutation-invariant set encoders. For each family it asks what correspondence between subjects the method needs, and where it removes or builds on the registration, radiomics and lesion-segmentation steps of standard medical-imaging pipelines."
   You can also split this into narrower questions or put the emphasis elsewhere, for example on medical imaging only, or on the methods regardless of application.

3. **Discipline.** Default: Computer Science, machine learning, with medical image analysis as the application sub-field.

4. **Language.** Default: English.

5. **Materials in hand.** Do you have a literature list or a `.bib` for the strategist to screen first? If so, give its path. Default: none.

6. **Domain evidence profile.** Choose one:
   - `cs_ml` admits arXiv preprints, proceedings and technical reports. I suggest it here because much of the optimal-transport and set-encoder work appears at ICML, NeurIPS and ICLR or on arXiv.
   - `general_social_science`.
   - `humanities_interpretive`.
   - `unknown_user_defined` admits peer-reviewed work only. It is the default.

7. **DOI checking.** Strict or mark-only. Default: mark-only.

8. **AI use.** This run uses AI for research assistance: the search, the screening and the synthesis. Please mark any other AI use on this work (drafting, revision, editing, analysis, peer-review simulation) as used, not used or uncertain, and name the tools with their versions. Default: research assistance by this run only.

9. **Earlier run record.** There is no earlier record, so this question needs no answer.

The paper type is Literature Review, because lit-review mode always uses it.

Once you answer, I will write `config.md` to the run folder and show it to you in full. After you confirm it, the literature strategist starts.
