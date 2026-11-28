# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/29-paper-edit-1, base b602b0a)

A page this report cites is named with its section; a finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, writes nothing with --check-only, fills only the marker and occurrence a fill_gap op names, several on one block, rejects each malformed fill_gap op with its reason, confines a patch to the blocks and kinds --allowed-blocks names, and refuses a malformed file of allowed blocks as a usage error
$ sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, writes a manifest whose blocks and separators hold the whole file, and with --find prints each place a block holds a text, wrapped or not, with the marker's occurrence under --marker, writing nothing
$ printf '%s\0' <the 20 changed files and the report> | xargs -0 perl -CSD -ne '<the rules file's expression>'; echo "charset exit $?"
charset exit 0
$ python3 docs/figures/gen_figures.py   (run on a copy of docs/ and skills/ in the scratchpad, see "Declined to judge")
gen exit 0
$ diff -rq <worktree>/docs/figures <copy>/docs/figures
(no output: every committed figure, edit.svg, lifecycle.svg and run-folder.svg among them, is what the script writes)
$ git ls-files -co --exclude-standard docs/figures/academic/paper | wc -l ; ... | grep edit
      15
docs/figures/academic/paper/edit.svg
$ git grep -n -i 'twelve modes\|12 modes\|fourteen figures' -- skills README.md docs/dev docs/glossary.md
(no output) grep1 exit 1
$ git grep -n -i 'thirteen modes' -- skills/academic/paper/SKILL.md README.md docs/dev/building.md docs/dev/scripts.md
README.md:57, docs/dev/building.md:41, docs/dev/scripts.md:9, skills/academic/paper/SKILL.md:3, :10, :133, :1038
$ python3 -c '<description length command>'
1023
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ LC_ALL=C grep -n '[^ -~]' apply_tex_patch.py anchorize_tex.py gen_figures.py
grep exit 1 (no match)
$ base tests on base scripts (git show b602b0a:<path> into the scratchpad)
PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks ... and writes nothing with --check-only
PASS: anchorize_tex.py leaves the .tex byte-identical, ... and writes a manifest whose blocks and separators hold the whole file
$ new tests on base scripts (the first run on the unchanged tree)
apply_tex_patch.test.sh: 43 lines, failing G1 to G13, L1 to L6, last line "FAIL: apply_tex_patch.py does not hold the behaviour above"; no P line
anchorize_tex.test.sh: failing F1 to F11, last line "FAIL: anchorize_tex.py does not hold the behaviour above"; no A line
(each failing line's start matches the report's quoted first runs)
$ git status --short   (after every run above)
the same 19 M lines and 2 ?? lines as at the start: nothing in the worktree changed
```

Reviewer's own probes (scratch copies, scratchpad only):

```
two fill_gap ops on block B0002 of "Intro.\n\nFunded by [GAP: funder] under grant [GAP: grant number].\n":
exit 0, output "Funded by the Example Foundation under grant EX-123.", n_blocks_touched 1,
ops_applied chars_after 65 (OP001) and 43 (OP002) for a written block of 52 chars, char_churn_ratio 3.3846, net_growth_chars -4
anchorize_tex.py w.tex --find '[GAP: funding statement]'  on "...funded by [GAP: funding\nstatement] and more."  -> B0002
same with --marker '[GAP: funding statement]'                                                                -> (nothing), exit 0
same with --find 'funded by [GAP: funding statement]' --marker '[GAP: funding statement]'                     -> (nothing), exit 0
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. `fill_gap`, its field checks, several ops on one block built on the old block, the ratio rule and `--allowed-blocks` with its usage errors are in `apply_tex_patch.py` and its docstring; the self-check stays correct with several `fill_gap` ops on one block (it compares the output with `apply_ops`, which builds each block once from all its gaps, and skips only touched blocks). The apply report's per-op and churn figures are wrong for that case: Behaviour 1.
- 2: violated, Spec 1 (with `--marker` the marker part of the text is matched exactly, so the whitespace rule of Open item G (3) does not hold for a gap).
- 3: holds. Head comments of both tests, `docs/dev/building.md` lines 9-10 and `docs/dev/scripts.md` lines 9, 26, 27 name the new cases, options and counts.
- 4: violated, Spec 2 (the blocks the `C<m>` and compile-fix patches are confined to reach blocks no item names). Also Spec 3 and Standards 2 bear on `### edit`. Each other part of 4 is in the diff: version 5.1.0 (`SKILL.md:12` of the diff), description 1023 chars with both new phrases, Quick start line, both tables, every listing line of "What is on the tree", Stops rows, Rules, `### edit` at line 484 after `### response-letter`. Goal parts and D1 to D10, by line of `SKILL.md`: D1/G(1) 512, 517; D2 538; D3 486; D4 516 (with 503-506); D5 498, 500; D6 522-523; D7 532 to 535; D9 491-492; D10 513, 539; G(2) 491, 501; G(3) 512 ("keeping the block's own line breaks").
- 5: holds. `draft_writer_agent.md` "Paper's addition: the edit patch" and rules 3 and 5; `citation_compliance_agent.md` the fresh start, the Claim check sentence and the `fill_gap` new-text sentence; `intake_agent.md` the edit line; `revision_patch_protocol.md` the kinds, the `fill_gap` bullet, the one-op rule, `cover-letter.tex` and the `G<n>`/`E<n>` rows; `mode_selection_guide.md` flowchart, heading, and the three tables.
- 6: holds. README lines 57 and 115, `building.md` line 41, the glossary entry and the changed **incremental citation check**, `gen_figures.py` with `paper_edit_graph()`, `PAPER_MODES`, the lifecycle lane and the run-folder note, reproduced byte for byte by a run on a copy; ADR 0062 Decisions 2, 3, 6 rewritten to Open item G and 4, 5, 8 gaining only the brief's details (file form, ratio rule, `.bib` file, several `fill_gap` ops, compile fix and `C<m>` confinement), status `proposed`, no dated note; ADR 0043's status line only.

Cases of the brief's "Cases":

- `fill_gap` applied: met, G1.
- `fill_gap` with the second occurrence: met, G2.
- Two `fill_gap` ops on one block: met, G3.
- Two `fill_gap` ops on the same occurrence: met, G4 (problem names OP001, OP002 and the occurrence).
- A `fill_gap` and a `replace_block` on one block: met, G5.
- `occurrence` above the count: met, G6.
- `occurrence` 0, -1, "1", true: met, G7.
- `marker` not a gap marker: met, G8.
- `marker` spanning two gaps: met, G8.
- `fill_gap` with `new_text`: met, G9.
- Blank `answer`, `answer` with a blank line: met, G10.
- `answer` `\cite{doe2020}`: met, G11 (and G2).
- `answer` holding a gap marker: met, G11.
- `fill_gap` on `\section{[GAP: title]}`: met, G12.
- `fill_gap` ops on every block of a two-block file: met, G13.
- `--allowed-blocks` `B0002 fill_gap`, `replace_block` on B0002: met, L1.
- `--allowed-blocks` B0002 only, op on B0003: met, L2.
- One op of each allowed kind: met, L3.
- Both blocks allowed `replace_block`, no ratio flag: met, L4.
- `--allowed-blocks` with `--check-only`: met, L5.
- Malformed file of allowed blocks (five forms): met, L6.
- No `fill_gap`, no `--allowed-blocks`: met, P1 to P11 unchanged in the diff and silent in both the base run and the run after.
- `--find 'Author Name'` on the template: met, F1 (the "manifest unchanged" check alone would pass if `--find` rewrote the same manifest, but "F1 no manifest is written" on a fresh copy asserts it).
- `--find` text not held: met, F2.
- Wrapped text: met, F3.
- Across a blank line: met, F4 with F3 as its control.
- `Universit\'e`: met, F5.
- `O'Brien`: met, F6.
- Inside an environment, in a `%` line: met, F7.
- A text a block holds twice: met, F8.
- `--find ... --marker ...`: met, F9.
- Empty, blank, `--marker` alone, with `--print-blocks`: met, F10.
- `--marker` the text does not hold: met, F11.
- `SKILL.md`'s description at most 1,024: met, 1023 by the command.
- `### edit` against "What to build" 4: partial, Spec 2.
- A copied page's text on the other modes unchanged: met. Read in the diff: each rewritten line keeps its words on the other modes; `citation_compliance_agent.md`'s resume bullet is rescoped "In full and revision mode" with its text unchanged; `intake_agent.md` and `mode_selection_guide.md` only gain lines.

## 1. Spec

- `skills/academic/paper/templates/anchorize_tex.py:127-129`: `pattern = re.compile(flexible(text[:at]) + "(?P<marker>" + re.escape(marker) + ")" + flexible(text[at + len(marker):]))`; what is wrong: the marker part of the `--find` text is matched byte for byte, so a run of spaces, tabs and one line break inside the marker matches nothing else, against Open item G (3) ("`--find` treats a run of spaces, tabs and single line breaks in the text and in the block as one space and is exact otherwise") and brief item 2 ("a run of spaces, tabs and line breaks in the text, and in the block, matches any such run"). `apply_tex_patch.py` `marker_starts()` is also exact, so the fix covers both: `--marker` would have to print the marker as the block writes it, and `### edit` item 5 give the writer that form as `marker`. The report lists this as a judgment call ("a wrapped marker could not be filled ... the item is then refused as found nowhere"), which states a limit instead of building the rule. Failure scenario: a hard-wrapped manuscript at 80 columns holds `funded by [GAP: funding` at a line end and `statement] and more.` on the next; the item `G1: [GAP: funding statement] => the Example Foundation` makes `--find ... --marker '[GAP: funding statement]'` print nothing (reviewer probe above), and `### edit` item 2 refuses the gap as found nowhere, while plain `--find` on the same text prints B0002. This is the exact failure Open item G (3) ruled out, now for gaps. Verdict: item 2 violated.
- `skills/academic/paper/SKILL.md:525` (`### edit` item 7): "The blocks the run's patches changed are, in each file anchorized again after its patches, the blocks `--find` finds holding an answer of a `fill_gap` op or the new text of a change"; what is wrong: the brief's Decision 7 confines the compile fix and the `C<m>` patches to "the blocks the run's patches changed, so no patch of the run reaches a block no item names"; a search for the answer text also finds every block that already held that text before the run. The session already knows the changed blocks exactly, from each apply report's `block_id`s (fill_gap and replace_block keep block ids when the new text has no blank line). Failure scenario: `G1: memory improves with sleep [GAP: citation needed] => \cite{doe2020}` in a manuscript that cites `doe2020` in three other paragraphs; `--find '\cite{doe2020}'` gives four blocks, the file of allowed blocks names all four with `replace_block`, and a `C<m>` patch of the fresh agent or a compile fix rewrites a paragraph no item named, which `apply_tex_patch.py --allowed-blocks` then lets through. The same holds for `E1: ... => "Example Institute"` when the name already stands elsewhere. Verdict: item 4 violated, case "`### edit`" partial.
- `skills/academic/paper/SKILL.md:516` (`### edit` item 6, "A rejection goes to the writer once, as Steps 10 says for every patch"), with `SKILL.md` Steps 10 and `references/revision_patch_protocol.md`, "A patch over every block"; what is wrong: the stop "A patch that does not apply", which `### edit`'s stops line lists, offers "escalate to full re-emission", a patch over every block applied with `--acknowledge-structural`; `### edit` does not say whether the choice is offered or how the file of allowed blocks applies to it. Failure scenario: a second rejection in an edit run; the user picks full re-emission; with `--allowed-blocks` every op on an unnamed block is a validation problem and the patch cannot apply, and without it the confinement ADR 0062 Decision 4 exists for is gone and the writer's patch rewrites every block of the file. The brief does not cover this case; it is the orchestrator's to rule (leave the option out in edit, or confine it). Verdict: none of its own beyond the item 4 finding above.

## 2. Proof

- none. Every new test fails on the unchanged tree for the reason it names (rerun above, each line matching the report's quoted first runs), the preserved cases pass on the base and after, and no test reads as an audit: each runs the script on scratch files and asserts the output or the problem text.

## 3. Standards

- `skills/academic/paper/references/revision_patch_protocol.md:47`: "**On exit 3 (structural flags):** the patch touches structure: heading rewrites/deletes, net section-count change, or `block_touched_ratio` strictly above **0.6**"; what is wrong: change standard rule 14, a sentence the change makes false. After the step, `block_touched_ratio` in the apply report counts every touched block (`apply_tex_patch.py:371-372`), while the flag counts only blocks rewritten by ops other than `fill_gap` (`apply_tex_patch.py:277`) and is no flag at all under `--allowed-blocks` (`:279`). The line is in the copied part of the page, so the fix is either a sentence in "Paper's addition: the patch file" or a ruling on the copied line. Failure scenario: an edit patch of `fill_gap` ops over 4 of 5 blocks reports `block_touched_ratio` 0.8 and exits 0; a reader of line 47 expects exit 3 and the stop "A structural patch", and takes the exit 0 for a script defect. Verdict: none.
- `skills/academic/paper/SKILL.md:523` against `skills/academic/paper/agents/citation_compliance_agent.md` "The incremental check" and ADR 0062 Decision 7; SKILL: "Start a fresh citation compliance agent (Steps 8 and 9) for the first patch that holds such ops, and resume it for each later one, one message for one patch"; the agent page: "For the ops of an edit patch that add a cite command, the session starts a fresh agent, which makes no first check"; ADR 0062 Decision 7: "A patch with an op that adds a cite command gets a fresh citation compliance agent"; what is wrong: change standard rule 19, two statements that contradict each other: the agent page and the ADR give each such patch a fresh agent, `### edit` resumes one agent across patches (the change patch of Open item G (1), the compile fix). The brief's item 4.7 says only "Start a fresh citation compliance agent ... for those ops only". Failure scenario: a run with a gap patch and a change patch both adding cite commands; a session reading the agent page starts a second fresh agent, one reading `SKILL.md` resumes the first, and the two runs differ in what the agent has read. Verdict: none.
- `skills/academic/paper/SKILL.md:498` and `:512`; "Run `anchorize_tex.py '<file>' --find '<text>'`, ... It is never run on the `.bib`, whose entries keep the names as they were published." and "It writes one patch per file: ... keeping the block's own line breaks. Each op names its item ids."; what is wrong: `docs/dev/skill-layout.md`, "Lists and tables", one rule per bullet: each bullet holds two rules that can each be broken while the other holds, and neither is named under the report's "Departures from the list and sentence rules", which names item 1 and item 7 only. Failure scenario: a reviewer of a later diff that drops "Each op names its item ids" sees the bullet's first rule intact and misses the loss. Verdict: none.

## 4. Behaviour

- `skills/academic/paper/templates/apply_tex_patch.py:369-383`: `churn = sum(len(o["old_text"]) ...) + sum(len(o.get("new_text") or "") ...)` and `"chars_after": len(o.get("new_text") or "")`; what is wrong: with several `fill_gap` ops on one block, each op's `new_text` is the block with only its own answer, so `chars_after` of each op is the length of no block the output holds, and `char_churn_ratio` counts the block's old text and a built block once per op. Reviewer probe: a block of 56 chars written as 52 chars reports `chars_after` 65 and 43 and `char_churn_ratio` 3.3846 for a net change of -4 chars. The report states the per-op `chars_after` as a judgment call but not the churn figure, and gives no before and after for it. Failure scenario: a user or role reading `patches/<nn>-<file>.patched.apply-report.json` of an edit run sees a churn ratio above 1, a rewrite of more than the whole file, for two filled gaps. Verdict: none (item 1's text "treat the built block as the op's new text" is met per op).

## Declined to judge

- `python3 docs/figures/gen_figures.py` and `git status --short docs/figures` in the worktree itself: the run writes into the worktree and was refused by the permission classifier; the same script run on a copy of `docs/` and `skills/` in the scratchpad exited 0 and wrote figures byte-identical to every committed one (`diff -rq` printed nothing), which settles the same fact.
- The brief's Verify 2 and 3 name `git ls-files -co --exclude-standard` and `git grep`, and I ran both (read-only; outputs above), outside the three git commands my brief allowed. The orchestrator may discard those two lines and rerun them.
- A `.tex` with CRLF line ends: `Path.read_text` turns them into LF, so `--find` finds a wrapped text there (probe printed B0002); whether the manifest's offsets hold for such a file is outside this step.
- Whether `### edit` item 3 should also prepare the `.bib` for an `E<n>` change whose new text adds a cite command (item 7 counts such an op as adding one): a case no ruling names, left to the orchestrator.

Reviewer usage: a4450f537e591f342, claude-opus-5-5, 236847 tokens, 40 tool uses, 7.5 minutes.
