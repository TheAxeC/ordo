# Step 1, repair round 1

The findings of `.scratch/29-paper-edit/agents/reviews/1-refuter.md`, each with its ruling. The brief `agents/briefs/1.md` holds for this round unchanged, its rules, cases, conventions, "Verify before you report" and report shape included. This round widens the step's paths to `skills/academic/paper/references/revision_patch_protocol.md` and the ADR, already among them; no other path is added.

Each item below is done in the code and the pages, never by a sentence that states a limit.

1. Spec 1, a gap marker wrapped across a line end.
   - Ruling: a marker is matched with the same whitespace rule as the rest of the text, in both scripts. In `anchorize_tex.py --find ... --marker`, the marker part of the pattern uses the rule `flexible()` gives the rest, and the occurrence is counted among the places the block holds the marker under that rule. In `apply_tex_patch.py`, a `fill_gap` op's `marker` is found in the block under the same rule, `occurrence` counts those places, and the op replaces the span the block holds (the marker as the block writes it, line break included) with `answer`. `is_gap_marker()` still checks the op's `marker` as written.
   - New cases, kept as tests and run first on the tree as the builder left it: `--find 'funded by [GAP: funding statement]' --marker '[GAP: funding statement]'` on a block holding `funded by [GAP: funding` at one line's end and `statement] and more.` on the next prints the block's id and `1`; a `fill_gap` op with `marker` `[GAP: funding statement]` on that block replaces the wrapped marker and gives `funded by the Example Foundation and more.`, every other byte as it was.
   - The docstrings of both scripts, `### edit` items 2 and 5 of `SKILL.md`, `revision_patch_protocol.md`'s `fill_gap` bullet and ADR 0062 Decisions 3 and 5 say that a marker is matched under that rule.
2. Spec 2, the blocks the compile fix and the `C<m>` patches are confined to.
   - Ruling: the blocks the run's patches changed are the `block_id`s of `ops_applied` in the apply reports of the run's patches of that file, never a search for the new text. A `fill_gap` or `replace_block` op keeps its block's id when the file is anchorized again, unless its new block holds a blank line; the session checks that the new manifest has the number of blocks the old one had, and when it differs, the compile fix and the `C<m>` patches of that file get no file of allowed blocks, and their failing lines or issues are named in the final message. In the `.bib`, the changed blocks are those the writer's `insert_after` op added, the blocks after the old last block.
   - `### edit` item 7's bullet on "the blocks the run's patches changed", item 9, `draft_writer_agent.md` "Paper's addition: the edit patch" and ADR 0062 Decision 8 say so.
3. Spec 3, full re-emission in edit mode.
   - Ruling: edit mode offers no full re-emission, since a patch over every block ends the confinement ADR 0062 Decision 4 makes. At the stop "A patch that does not apply" an edit run offers re-anchorize and retry, or abort. `### edit` item 6 says so, and the Stops row "A patch that does not apply" names it for edit.
4. Standards 1, the copied line on exit 3 in `revision_patch_protocol.md`.
   - Ruling: the copied line stays as it is. "Paper's addition: the patch file" gains the rule that a `fill_gap` op does not count toward the block ratio of the structural flag and that a patch applied with `--allowed-blocks` gets no block-ratio flag, while the apply report's `block_touched_ratio` counts every block touched.
5. Standards 2, a fresh agent per patch or one agent resumed.
   - Ruling: ADR 0062 Decision 7 and `citation_compliance_agent.md` hold: each patch of the run with an op that adds a cite command gets a fresh citation compliance agent. `### edit` item 7 is rewritten to that, with no resumed agent.
6. Standards 3, two rules in one bullet.
   - Ruling: `SKILL.md`'s bullets at lines 498 and 512 of the worktree (the `--find` bullet with its `.bib` rule, and the writer's patch bullet with its line breaks and item ids) are each split, one rule per bullet. Every other bullet of `### edit` and of "Paper's addition: the edit patch" is read for the same and split where it holds two rules.
7. Behaviour 1, the apply report with several `fill_gap` ops on one block.
   - Ruling: `chars_after` of a `fill_gap` op is the length of its block as the output holds it, every op of one block giving the same figure, and `char_churn_ratio` and `net_growth_chars` count each touched block once, its old text and its text in the output. A run on two `fill_gap` ops on one block is quoted in the report with the figures before and after; no test is kept for it, since a wrong figure costs nothing.
8. Declined to judge, a change whose new text adds a cite command.
   - Ruling: `### edit` item 3 prepares the `.bib` when an answer or a change's new text holds a cite command its old block did not, the same test as item 7.

The builder's report of this round is appended to `.scratch/29-paper-edit/agents/reviews/1-report.md` under "Repair round 1", with each item's first run, the change, and the checks of the brief's "Verify before you report" run again, their lines quoted.
