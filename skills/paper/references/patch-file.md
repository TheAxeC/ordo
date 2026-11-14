# The patch file

The session reads this page at Steps 9, and every role agent that writes a patch reads it with its own page. Every change to the main `.tex`, a file it inputs or the `.bib` is a patch, and a patch is a JSON file of this form:

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
| `R<n>-<m>` | The draft writer, and the literature strategist for an item that calls for a new reference | Comment `m` of reviewer `n` of a referee comments file, in revision mode |
| `W<k>` | The draft writer, and the literature strategist for an item that calls for a new reference | Finding `k` of a `/writing` report given as the comments file of revision mode |
| `T<m>` | The draft writer, and the literature strategist for an item that calls for a new reference | Instruction `m` of the revision instructions given as text |
| `V<m>` | The draft writer, and the literature strategist for an item that calls for a new reference | Issue `m` that the peer reviewer found itself in revision mode: its review when there are no instructions, or a failure of the reference checks at a reading |
| `F<k>` | The draft writer | Finding `k` of the `/writing` report of a run's own closing review (Steps 13) |
| `D<r>-<m>` | The draft writer | Issue `m` of the review numbered `r`, such as `D1-2` for issue 2 of `review-1.md` |
| `C<m>` | The citation compliance agent | Issue `m` of the citation report, in full, revision and citation-check mode |
| `figures` | The visualization agent | The placement of each planned figure at its marker `% FIGURE: <label>` in full mode, and in the figures call the insertion of each figure after the block that discusses its result |
| `reference-fix` | The draft writer | The lines of the reference checks that fail after the last writer pass of full, lit-review and revision |
| `compile-fix` | The draft writer | The compile lines of a failed compile or a layout fault |
| `abstract-only` | The draft writer | The abstract and the keywords of abstract-only mode |
| `disclosure` | The draft writer | The statements of disclosure mode, and in full mode the AI disclosure that a second start of the draft writer rewrites to put the model identifier in the place of `[GAP: model identifier]` |
| `lit-review` | The literature strategist | The entries a literature review adds to the manuscript's `.bib` |
| `full` | The literature strategist | The entries that full mode adds to an existing `refs.bib` |

- An id may stand in more than one patch of a run folder. Each patch has its own number (SKILL.md, Steps 9), and an id names what the patch answers. The second use of `disclosure` in full mode is therefore a patch of its own. It is written against the manifest of the file as it stands after the first patches.
