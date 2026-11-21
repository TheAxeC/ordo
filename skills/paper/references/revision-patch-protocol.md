# Revision Patch Protocol

**Toolchain:** `templates/anchorize_tex.py` and `templates/apply_tex_patch.py`.
**Audience:** the session and any user running revision rounds phase-by-phase across sessions. The session runs the commands below.

**What this buys, stated honestly:** under patch apply, a block no operation names cannot be silently distorted, because no generation pass runs over it; that is a property of the apply script, not of the model. It does NOT make the edits themselves better, and structural rewrites are not patch-protected (they escalate, see "On exit 3"). Every summary of this feature must survive that sentence.

---

## Artifacts and naming

| Artifact | Produced by | Convention |
|---|---|---|
| Block manifest | `anchorize_tex.py` | `<tex>.block-manifest.json` beside the `.tex`, `base_sha256` + per block its id, hash, character span, section and first line; the `.tex` stays byte-identical, since a marker would land in the LaTeX output; the ONLY legitimate hash source for a patch |
| Patch document | Draft writer (revision invocation) | `patches/<nn>-<file name>.patch.json` in the run folder, in the form of "Paper's addition: the patch file" below |
| Revised draft | `apply_tex_patch.py` | `--output` MUST be a new file (versioned artifact; the base is never modified) |
| Apply report | same run, sidecar | `<output>.apply-report.json`: ops applied, fresh block IDs, structural flags, `preserved_ratio` |

The apply report shares the revised draft's lifecycle: it is a **required input to re-review**: re-reviewers read it to see exactly which blocks changed (the ops applied) and which are machine-guaranteed untouched.

## Command sequence (one revision round)

```bash
# 1. Anchorize / refresh the manifest (the .tex is not changed).
#    Run at EVERY round entry, and rewrite nothing afterwards until apply;
#    any rewrite invalidates the manifest.
python3 templates/anchorize_tex.py main.tex

# 2. Hand the writer its revision context:
#    main.tex + main.tex.block-manifest.json + the round's Revision Roadmap.
#    The writer writes patches/01-main.tex.patch.json (never a full draft).

# 3. Apply: two-phase fail-closed; output must be a NEW file.
python3 templates/apply_tex_patch.py main.tex \
    patches/01-main.tex.patch.json \
    --output main.rev1.tex

# 4. Run the post-revision steps (the compile and the citation check)
#    on main.rev1.tex, then re-review with main.rev1.tex.apply-report.json
#    attached.
```

Exit codes: `0` applied, `2` Phase 1 rejection (structured failure report on stdout; base byte-untouched), `3` structural refusal (see escalation), `4` post-write self-check bug.

**On exit 2 (stale hash / unknown target / schema failure):** feed the failure report back to the writer for ONE re-emission of the whole patch against the current manifest. On a second failure, stop and decide: re-anchorize and retry the round, escalate to full re-emission, or abort. Never hand-edit a patch to force it through; a hash mismatch means the writer was looking at different text than the file holds.

**On exit 3 (structural flags):** the patch touches structure: heading rewrites/deletes, net section-count change, or `block_touched_ratio` strictly above **0.6** (`insert_after` merely *anchored* on a heading is exempt: inserting body text under a section heading is routine, not structural). Read the flags in the refusal output, then either narrow the patch, or, if the structural change is intended, re-run with the acknowledgment recorded:

```bash
python3 templates/apply_tex_patch.py main.tex patch.json \
    --output main.rev1.tex --acknowledge-structural
```

`--acknowledge-structural` is a deliberate user decision, never a default; the flags stay recorded in the apply report either way.

**Full re-emission (escalated rounds only):** when a round genuinely demands restructuring, the round runs as legacy full re-emission after explicit confirmation, never as a silent fallback. Afterwards, re-anchorize from scratch (a NEW ID generation; the old manifest and any old patches are dead) and record the round as `mode: full_reemission_escalated`.

## Paper's addition: the patch file

This section is `paper`'s addition to academic-paper's protocol. Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:

```json
{
  "schema": "tex_revision_patch/1",
  "base_file": "main.tex",
  "base_sha256": "<base_sha256 of the manifest>",
  "round": 1,
  "ops": [
    {"op_id": "OP001", "kind": "replace_block", "block_id": "B0003", "old_hash": "<sha256 of that block in the manifest>", "roadmap_item_ids": ["R1-1"], "rationale": "one line, why the edit answers those ids", "new_text": "the replacement text"}
  ]
}
```

- The agent copies `base_sha256` and each `old_hash` from the manifest and never computes a hash.
- The `kind` field of an op is `replace_block`, `insert_after` or `delete_block`. A `replace_block` or `insert_after` op has a `new_text` that is not blank.
- A block takes at most one op. Two ids that change one block share one op and are both named in its `roadmap_item_ids`.
- The field `round` holds 1.
- Each op names the ids of what it answers in `roadmap_item_ids`, and the patch has at least one.
- The agent writes each rewritten block whole, changes only the blocks its ids name, and does not apply its patch.
- The agent writes its patch to the path its prompt gives, `patches/<nn>-<file name>.patch.json` in the run folder.
- A `.bib` is anchorized as a `.tex` is, and its blocks are the runs of non-blank lines.
- An entry is a block of its own only when a blank line separates it from the next entry.

The ids are:

| Id | Written by | Answers |
|---|---|---|
| `R<n>-<m>` | The draft writer | Comment `m` of reviewer `n` of a referee comments file, in revision mode |
| `W<k>` | The draft writer | Finding `k` of a `/writing` report given as the comments file of revision mode |
| `F<k>` | The draft writer | Finding `k` of the `/writing` report of a run's own closing review (`SKILL.md`, Steps 13) |
| `D<r>-<m>` | The draft writer | Issue `m` of the review numbered `r`, such as `D1-2` for issue 2 of `review-1.md` |
| `C<m>` | The citation compliance agent | Issue `m` of the citation report, in full, revision and citation-check mode, and issue `m` of a `citation-report-<nn>.md` for the patch with the number `<nn>` |
| `figures` | The visualization agent | The placement of each planned figure at its marker `% FIGURE: <label>` in full mode, and in the figures call the insertion of each figure after the block that discusses its result |
| `R<m>` | The draft writer | Issue `m` of the results check in the citation report, in full and revision mode (`references/draft-writer.md`, "The results-check patch") |
| `reference-fix` | The draft writer | The `missing:` lines of `lookup.py cite-keys` after the last writer pass of full and revision |
| `compile-fix` | The draft writer | The compile lines of a failed compile, or of an `Overfull \hbox` or `Overfull \vbox` of more than 10pt |
| `abstract` | The abstract agent | The abstract and the keywords, in place of the `% ABSTRACT` lines of the first draft in full mode, and of the abstract of the `.tex` in abstract-only mode |
| `disclosure` | The formatter | The AI disclosure statement of disclosure mode, at the place `references/disclosure-mode-protocol.md` gives |
| `format-convert` | The formatter | The format conversion: the citation style, the venue's template and its required elements, and the fields of the format profile in LaTeX, with the cite commands of a `.tex` made from a `.md` or a `.docx` |
| `format-convert-copy` | The formatter | The changes that make what `pandoc` drops readable: a table's wrapper, an algorithm, a cross-reference, a drawing, a numbered citation style, and, when the run does not change the citation style, also the same changes as `format-convert` for each block. The session applies it to the conversion copy only, never to the manuscript |
| `full` | The literature strategist | The entries that full mode adds to an existing `refs.bib` |

- An id may stand in more than one patch of a run folder. Each patch has its own number (`SKILL.md`, Steps 9), and an id names what the patch answers. Each patch is written against the manifest of the file as it stands after the earlier patches.

### A patch over every block

When the user confirms full re-emission at the escalation of "On exit 2" or "On exit 3" above, the agent writes the whole file again as one patch over every block of the manifest the session gives it.

- The patch has one op for each block of the manifest, in the manifest's order, and no block is left without an op.
- A block the file keeps, changed or not, takes a `replace_block` op whose `new_text` is the block as the file should read.
- A block the change removes takes a `delete_block` op.
- Text the change adds between two blocks goes into the `new_text` of the block before it.
- Each op names the ids of the change in `roadmap_item_ids`, the ids of the patch that did not apply.
- The patch is structural, and the session applies it with `--acknowledge-structural`, since the user's answer is the confirmation of the full rewrite.
