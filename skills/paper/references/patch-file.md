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
- The field `round` holds the number of the draft review round whose issues the patch answers, and 1 for any other patch.
- Each op names the ids of what it answers in `roadmap_item_ids`, and the patch has at least one.
- The agent writes each rewritten block whole, changes only the blocks its ids name, and does not apply its patch.
- The agent writes its patch to the path its prompt gives, `patches/<nn>-<file name>.patch.json` in the run folder.
- A `.bib` is anchorized as a `.tex` is, and its blocks are the runs of non-blank lines.
- An entry is a block of its own only when a blank line separates it from the next entry.

The ids are:

| Id | Answers |
|---|---|
| `R<n>-<m>` | Comment `m` of reviewer `n` of a referee comments file, in revision mode |
| `W<k>` | Finding `k` of a `/writing` report given as the comments file of revision mode |
| `F<k>` | Finding `k` of the `/writing` report of a run's own closing review (Steps 12) |
| `D<r>-<m>` | Issue `m` of draft review round `r` |
| `C<m>` | Issue `m` of the citation report |
| `full`, `abstract-only`, `lit-review`, `disclosure` | A change the mode itself asks for, such as the figure environments and the new `.bib` entries of a first draft, the abstract in abstract-only mode, the entries of a literature review or the statements of disclosure mode |
| `reference-fix` | A change that answers a failing line of the reference checks |
| `compile-fix` | A change that answers a failed compile or a layout fault of the compile's log |
