# 0062. Paper's edit mode fills gaps and makes stated changes by a patch the script confines to the blocks the session finds

Status: proposed

## Context

A manuscript of `paper` can hold `[GAP: ...]` markers for what only the authors can give, such as `[GAP: citation needed]`, which the draft writer writes for a claim no source holds (`skills/academic/paper/agents/draft_writer_agent.md`, "Citations"), and a required element the formatter marks as missing (`skills/academic/paper/SKILL.md`, "format-convert" item 4). An author, an affiliation, a funding line or an email also changes after a draft is written. The only mode that changes a manuscript for a list of items is revision, which always starts the peer reviewer for the list of items and again for the re-review, and checks every citation of the revised draft (`skills/academic/paper/SKILL.md`, "revision" items 1, 3 and 4).

- `templates/apply_tex_patch.py` refuses a stale hash, an unknown block, a heading change and a patch over more than 0.6 of the blocks. It has no way to limit a patch to a set of blocks the caller names, so whether a patch touched only the places of its items rests on reading the diff.
- A block is a run of non-blank lines at environment depth zero (`templates/anchorize_tex.py`, its head comment), usually a whole paragraph, so a `replace_block` op for one marker rewrites the paragraph that holds it.
- The same fact can stand in several blocks: in the skill's own `templates/latex_article_template.tex` the author's name stands in the hyperref settings (`pdfauthor`) and in the title page.
- The incremental citation check resumes "the agent that made the first check" in full and revision mode (`agents/citation_compliance_agent.md`, "The incremental check"), and a run that makes no first check has no such agent.
- ADR 0043 says that `paper` has twelve modes and that a new deviation from academic-paper has to be argued against academic-paper's text with a run that shows it is better.

## Decision

1. `paper` has the mode `edit`, `/paper edit <main.tex> <edits file>`, for answers to `[GAP: ...]` markers and small stated changes such as an author, an affiliation, a funding line or an email.
2. The edits file is Markdown, one item per line: `G<n>: [GAP: <marker as the .tex writes it>] => <answer>` for a gap, and `E<n>: "<old text>" => "<new text>"` for a change. `G<n>` and `E<n>` are the ids the ops name in `roadmap_item_ids`, and they stand in the id table of `references/revision_patch_protocol.md`.
3. `anchorize_tex.py --find '<text>'` prints the ids of the blocks of a file that hold a text, by an exact search. The session runs it for each item over the main `.tex`, each file it inputs and `cover-letter.tex` beside it, and not over the `.bib`, whose entries keep the names as they were published. A change whose old text is found nowhere is refused alone and named in the final message.
4. The session writes a file of allowed blocks from that output, each block id with the op kinds allowed on it: `fill_gap` alone on a block that holds a marker of the edits file, and `replace_block` on a block that holds a change's old text. `apply_tex_patch.py --allowed-blocks <file>` rejects, as a `validation` problem, an op of a kind its block does not allow and an op on a block the file does not name.
5. `fill_gap` is an op kind of `tex_revision_patch/1` with `block_id`, `old_hash`, `marker`, `occurrence` and `answer`. The script builds the new block itself, the block with that occurrence of the marker replaced by `answer`, so no other byte of the block can change.
6. The draft writer writes the one patch, each op naming its item. An item that changes a claim, a result number or what a citation supports is refused alone, by the tag `[EDIT-REFUSED: items=<ids>, reason=<one line per item>]` in the writer's final message. The other items are applied, and the final message names each refused item with the writer's reason and says that `/paper revision` takes such a change. No other mode is started for it.
7. A patch with an op that adds a cite command gets a fresh citation compliance agent, which does the incremental check's work for those ops only and writes `citation-report-<nn>.md` with its `C<m>` patches and its stops. The session asks the rows Claims not to make and Earlier papers in one message only for such a patch. A new `.bib` entry is one `lookup.py bibtex` prints, in the writer's `.bib` patch.
8. `cite-keys` and the compile of Steps 11 run, with one `compile-fix` patch on a failed compile. The final message shows the diff `git diff --no-index --word-diff=plain` prints of each file before and after the patch.
9. No peer reviewer, change list, re-review or closing review runs.
10. `edit` is a mode added to the modes ADR 0043 lists. It changes the text of no mode copied from academic-paper, so ADR 0043's condition of a run that shows a deviation is better does not apply to it. A copied page that lists the modes gains `edit`, and its text on the other modes stays as it is.

## Alternatives rejected

- A `"gap"` field on a `replace_block` op, checked after the writer writes the whole block: the check only finds a stray change after the fact, while `fill_gap` makes one impossible, and the writer still rewrites each paragraph that holds a marker.
- The two refusals with their shape left to the builder: a wire format is the user's to choose (`docs/dev/change-standard.md`, rule 4).
- The list of allowed blocks written by the writer: the list would then come from the agent whose patch it limits.
- An edits file in free prose, read by an agent into items: an agent's reading would decide which text is searched, so the allowed blocks would rest on a judgment.
- An edits file in YAML: a machine's format for a file the user writes.
- The `.bib` in the search: a changed author's name in an entry of a published paper falsifies the citation.
- Citation-check mode's whole check for a filled citation gap: it judges every claim of the manuscript for one sentence.
- Refusing a gap answer that adds a citation: `[GAP: citation needed]` could then never be filled in `edit`.
- Routing a claim-changing item to `/paper revision`: which mode runs next is the user's decision.
- `/writing` at the end of the run: it reads the whole manuscript for changes the user wrote and reads in the diff.

## Consequences

A gap answer or a stated change no longer needs a revision run with its peer reviewer, re-review and citation check of the whole draft. `apply_tex_patch.py` gains an op kind and a flag, and `anchorize_tex.py` an option, each with cases in its test. Every page, figure and count that lists the modes of `paper` gains `edit`. A builder's change to the shapes of items 2 to 5 is a rule clash.
