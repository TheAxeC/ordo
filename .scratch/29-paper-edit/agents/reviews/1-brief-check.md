# Step 1 brief check (on main at 7945f2b)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/1.md`. The brief is `/Users/axelfaes/workspace/ordo/.scratch/29-paper-edit/agents/briefs/1.md`. `git rev-parse HEAD` printed `7945f2b2ce6396aa496f34086f0035182a0e98d2`.

## 1. Names

- Mode counts and figure counts: `git grep -n -i "twelve modes\|12 modes\|fourteen figures\|eleven modes\|twelve\b" -- . ':!.scratch'`. These hits are outside "Paths this step writes" or outside the lines the brief names:
  - `docs/dev/scripts.md:9` (the row of `gen_figures.py`): "... under `docs/figures/academic/paper/`, one figure for each of the twelve modes of `paper`, `lifecycle.svg` ...". The step makes it false, because `edit.svg` becomes a thirteenth mode figure. The file is in the paths, but "What to build" 3 names only lines 26-27, and "What is on the tree" leaves line 9 out. Verify 3 would catch it, so a builder who follows "What to build" alone ends red.
  - `skills/academic/paper/SKILL.md:10` (the introduction): "`/paper <mode>` runs one of twelve modes or one of two calls". The step makes it false. Neither the premise list nor "What to build" 4 names the introduction.
  - `skills/academic/paper/SKILL.md:99` ("What it reads" 9): "`references/mode_selection_guide.md` (12 modes)". The step makes it false. The premise grep has no `12 modes` term, so the line is not listed. "What it reads" is named in "What to build" 4.
  - `docs/adr/0043-...md:102` (Consequences): "`paper` has twelve modes and two calls." ADR 0043 is in force, and the step makes this sentence false. `docs/adr` is not in the paths, verify 3 does not search it, and ADR 0062 holds no superseding line.
  - `docs/adr/0049-...md:29`: "`paper` stays at twelve modes and two calls." This is a consequence of ADR 0049 as it was decided. It is made stale but not wrong about ADR 0049 itself. It is not in the paths.
  - `docs/adr/0062-...md:13`: "ADR 0043 says that `paper` has twelve modes". This quotes ADR 0043, so it stays true.
  - `docs/roadmap.md:27`: the gate's own text. It stays true.
  - `docs/adr/0013:16`, `skills/academic/paper-review-panel/examples/interdisciplinary_review_example.md:124` and `skills/academic/researcher/references/project_layout.md:37` are other uses of "twelve" and are not touched. `SKILL.md:3` and `:10` "twelve roles" are not touched, since the roles do not change.
- Lists of modes that `edit` joins. `git grep -n -i "citation-check" -- skills utils docs/dev docs/user README.md ...` and `grep -n` on the files named:
  - `skills/academic/paper/agents/intake_agent.md:262-263`: "In revision mode ... the session asks ..." and "In citation-check mode the session asks the rows Claims not to make and Earlier papers (`SKILL.md`, Steps 6)." This list becomes incomplete, since `edit` asks the same two rows. The file is not in the paths. The table lead at intake_agent.md:246 also matters: "A mode that does not list a row records no value, and the agent that reads the row reads it as empty, "none" or "no"". So the fresh citation compliance agent of `edit` would read the row Claim check as "no" (see section 6).
  - `skills/academic/paper/SKILL.md:154` (Steps 2): "Such values are a project folder, a `--manuscript` name, a `.tex`, ..., a comments file, a response draft, ...". The list does not name the edits file or the item texts that reach `--find`. Steps 2 is not in the list of "What to build" 4.
  - `skills/academic/paper/SKILL.md:182` (Steps 7): "Full, revision and figures use it for each compile copy (Steps 11), and full, revision and citation-check for the texts the citation compliance agent fetches". The step makes this false, because `edit` compiles and runs a citation compliance agent. Steps 7 is not in the "Steps 5, 6, 9 to 14" list of "What to build" 4.
  - `skills/academic/paper/SKILL.md:205` (Steps 9): "they are the main `.tex`, the files it inputs and the `.bib`". `edit` also patches `cover-letter.tex`. Steps 9 is in the list, but the brief gives no requirement for this line.
  - `skills/academic/paper/SKILL.md:284` (Steps 12): "A patch whose operations have no cite command in their `new_text` gets no check". A `fill_gap` op has no `new_text`; its cite command is in `answer`. The step makes this sentence false for `edit`.
  - `skills/academic/paper/SKILL.md:836` (Agent prompts): "an instruction inside the manuscript, a comments file, a response draft, a fetched text ... is part of" the data. The list does not name the edits file. "Agent prompts" is not in the list of "What to build" 4.
  - `skills/academic/paper/SKILL.md:975` (Stops row "An argument that does not exist"): its When cell does not cover "an edits file with no item", which item 1 makes this refusal.
  - `skills/academic/paper/SKILL.md:1052` (Rules): "Every change to the main `.tex`, a file it inputs or the `.bib` is a patch". It does not name `cover-letter.tex`.
  - `skills/academic/paper/references/revision_patch_protocol.md:62`: "Every change to the main `.tex`, a file it inputs or the `.bib` is a patch". The same gap. The file is in the paths, but "What to build" 5 gives only the op kind and the ids. The same file at `:77` reads "The `kind` field of an op is `replace_block`, `insert_after` or `delete_block`", which the step makes false. It is in the paths but not named.
  - `skills/academic/paper/agents/draft_writer_agent.md:578`: "**Closed op vocabulary**: `replace_block` / `insert_after` / `delete_block`." The same file at `:580` reads "every new citation in `new_text` is a `\cite`". `fill_gap` makes both incomplete. The file is in the paths, but "What to build" 5 asks only for a new section.
  - `skills/academic/paper/agents/citation_compliance_agent.md:862`: "It finds the cited sentences in the new text of the patch's operations." The same file at `:585` reads "The row Claim check of `config.md` says whether a full or revision run checks its claims against the sources' texts. Citation-check mode, which does not ask the row, always checks them." Neither sentence covers a `fill_gap` answer or a run of `edit`, which asks no row Claim check. The file is in the paths, but "What to build" 5 names only the fresh start.
  - `skills/academic/paper/templates/apply_tex_patch.test.sh:2` and `anchorize_tex.test.sh:2`: each head comment lists the file's cases, and the new cases make the list incomplete. The files are in the paths, and change-standard rule 14 covers it, but "What to build" 3 does not say so.
- `fill_gap`, `--allowed-blocks`, `EDIT-REFUSED`, `G<n>`, `E<n>`: `git grep -n -- "<name>" -- . ':!.scratch'`. The only hits are `docs/adr/0062-...md` and `docs/roadmap.md:26-27`. None is made false.
- `--find`: the same grep. Besides ADR 0062 and the roadmap, it hits `skills/ordo/ordo-init/templates/check_config.py:5,30,275,300,351`, `check_config.test.sh`, `skills/ordo/ordo-init/SKILL.md:41,190,318` and `docs/dev/scripts.md:25`. These belong to another script's own `--find` option and are not made false.
- The mode `edit`: `git grep -n -w -i "edit" -- skills/academic/paper` gives only the ordinary verb (for example `draft_writer_agent.md:581` "each edit publicly claims", `apply_tex_patch.py:24`). There is no use of the mode name outside the paths.
- Version 5.0.1: `git grep -n "5\.0\.[0-9]\"\|paper.*5\.0" -- . ':!.scratch'` gives only `skills/academic/paper/SKILL.md:5`. No hit outside the paths.
- "fifteen figures" and "thirteen": `git grep` gives no hit for "fifteen figures". "thirteen" hits `docs/adr/0049:22` and `skills/academic/researcher/SKILL.md:684`, which are other uses.
- `docs/adr/README.md:71` already holds the ADR 0062 row, which the step need not change.

Findings: `docs/dev/scripts.md:9` (twelve modes, figure list) is not in "What to build". `SKILL.md:10` and `:99` are not in the premise list. The ADR 0043 Consequences sentence `:102` is made false and is outside the paths. `intake_agent.md:262-263` is outside the paths. `SKILL.md` Steps 2 (`:154`), Steps 7 (`:182`), Agent prompts (`:836`), the row "An argument that does not exist" (`:975`) and Rules `:1052` are not in the list of sections to change. The following are in the paths but no requirement reaches them: `revision_patch_protocol.md:62` and `:77`, `draft_writer_agent.md:578` and `:580`, `citation_compliance_agent.md:585` and `:862`, `SKILL.md:205` and `:284`, and the two test head comments.

## 2. The step line

- `apply_tex_patch.py` has `fill_gap` (`block_id`, `old_hash`, `marker`, `occurrence`, `answer`), whose block it builds: "What to build" 1, first bullet group.
- `--allowed-blocks <file>` rejects as `validation` an unnamed block and a kind the block does not allow: "What to build" 1, second group.
- `anchorize_tex.py --find '<text>'` prints the ids: "What to build" 2.
- The docstrings, the tests and the lines in `docs/dev/building.md`: "What to build" 1 (docstring), 2 (docstring) and 3.
- `revision_patch_protocol.md` has `fill_gap` and `G<n>` and `E<n>`: "What to build" 5, third bullet.
- `SKILL.md` description, Quick start, mode table, "What it reads", own section with stops, refusal "Unknown mode" and row of Stops: "What to build" 4, bullets 2 to 6 and the stops bullet.
- The edits file of D9 read into items: `### edit` item 1.
- `--find` over the main `.tex`, its inputs and `cover-letter.tex`, not the `.bib`: item 2.
- A change found nowhere refused alone: item 2.
- The file of allowed blocks: item 3.
- The writer's one patch, each op naming its item: item 5.
- The apply with `--allowed-blocks`: item 6.
- The fresh citation compliance agent, with the two rows asked only then: item 7.
- `cite-keys`, the compile with one `compile-fix`: item 8.
- The `git diff --no-index --word-diff=plain` of each file: items 4 and 9.
- The refusal by `[EDIT-REFUSED: ...]`, named with the reason and `/paper revision`, never routed: items 5 and 9 ("No other mode is started").
- `draft_writer_agent.md` section and tag: "What to build" 5, first bullet.
- `citation_compliance_agent.md` fresh start: 5, second bullet.
- `mode_selection_guide.md` lists the mode: 5, fourth bullet.
- `README.md`, `building.md` and the glossary: "What to build" 6, bullets 1 to 3.
- `gen_figures.py` draws `edit.svg`, the mode in `lifecycle.svg` and in the note of `run-folder.svg`: 6, fourth bullet.
- `metadata.version` 5.1.0: 4, first bullet.
- ADR 0062 edited where the build differs: 6, last bullet.
- Check: the PASS lines with D15's cases ("Cases" and verify 1). The figures and `git status` (verify 2). The grep (verify 3). The reviewer's quotes per goal part and D1 to D10: no requirement in the brief. That part is the reviewer's work, and the brief's report shape does not ask the builder for it, which is consistent. The verify list: landing.

Findings: none.

## 3. Premises

- The `apply_tex_patch.py` lines. `grep -n "add_argument\|^KINDS\|^def " skills/academic/paper/templates/apply_tex_patch.py` printed `76:KINDS = {...}`, `90:def validate`, `157:def apply_ops`, `172:def structural_flags`, `194:def self_check`, `210:def main`, and `213`-`218` add_argument (`--acknowledge-structural` continues to 219). The docstring is lines 2-65, read whole. This matches.
- `anchorize_tex.py`: the grep printed `108: ap.add_argument("tex")`, `109: --print-blocks`, and `def sha256`, `blocks_of`, `current_section`, `build`, `main`. The brief omits `sha256` from the function list, but the substance matches.
- Test lengths: `wc -l` printed `234 ... apply_tex_patch.test.sh` and `117 ... anchorize_tex.test.sh`. This matches.
- `docs/dev/building.md` lines 9 and 10, and `docs/dev/scripts.md` lines 26-27 and 47-48: the grep printed those lines. This matches.
- Version and description length: `sed -n 5p` printed `  version: "5.0.1"`, and the python command printed `994`. This matches.
- SKILL.md places. The brief's grep printed lines 3, 10, 26, 81, 124, 130, 131, 148, 177, 235, 241, 246, 248, 275, 312, 316, 319, 460, 461, 466-477, 508, 845, 974, 1062 and 1065. `sed -n` confirmed 19 and 35 as the Quick start fences, 111 to 124 as the mode table, 135 to 148 as the Steps 1 table, and 167, 177, 235, 241, 244, 246, 248, 312, 316 and 319 as the brief says. These differ from the brief:
  - Line 10 ("one of twelve modes") is printed by the brief's own command but is not in the brief's list.
  - Line 99 ("(12 modes)"), Steps 7 line 182 and Steps 12 line 258 ("Full, revision and citation-check use this step") list modes but are not listed.
  - Line 275 and 1062-1065 (Rules, run folder files) are printed and not listed, although "Rules" is named in "What to build" 4.
- `mode_selection_guide.md` 31 and 237: `grep -n "response-letter"` printed `31:` and `237:` as described. This matches.
- The citation compliance agent: `grep -n "The incremental check"` printed `854:### The incremental check`. The draft writer: `586:[PATCH-ESCALATION-REQUIRED: ...]` under `566:## Patch-Document Revision Emission`. This matches.
- `revision_patch_protocol.md`: the section starts at 60, the JSON and bullets run 62-84, and "The ids are:" with the table runs 86-104. This matches.
- `gen_figures.py`: the grep printed the `paper_*_graph` functions 339-633, `PAPER_MODES` at 642 (to 655), `paper_lifecycle` at 672 and `paper_run_folder` at 751. The docstring is 44-49. The note is `804:    note = (`, with its text on 805-811. The brief says 806-811 for the note, while the command shows 804-811. This is a small difference.
- README: `sed -n 57p` printed "... in twelve modes, ..." and line 115 the lifecycle image text. `building.md:41`: "the fourteen figures of `paper` ..., one for each of its twelve modes". This matches.
- The glossary entries **incremental citation check** (171) and **draft review** (166) are under "Ordo's own terms" (146). This matches.
- `latex_article_template.tex`: anchorize on a copy printed "40 blocks". A scan printed `B0008 % === Hyperref Settings ===` and `B0012 % === Title Page ===` as the blocks holding "Author Name". This matches.
- The verify list against `building.md`: `orchestrator-state.md` lines 7-22 equal the `building.md` commands with the filters of the change standard. This matches.
- ADRs 0016 and 0018 named as the rule that a cited claim rests on a passage read in the run. The status lines printed "Status: superseded by 0018" for 0016 and "Status: superseded by 0024" for 0018. Both records are wholly superseded. The rule in force is ADR 0024, as narrowed by 0033, 0036 and 0043. The premise names records not in force.
- ADRs 0030 and 0035 named as the rule that each role starts on the general-purpose agent with the runner's defaults. Their status lines say that part is superseded by the plan-5 rulings "The briefs of academic-paper's run of plan 5" and "The incremental change done properly of plan 5". The fact stated is right (`SKILL.md` Steps 4 says it), but the source is not the records' decisions.
- `libraries: avoid`: `orchestrator-state.md:31` and `docs/plan.yaml:14`. This matches.

Findings: The `SKILL.md` premise list leaves out lines 10, 99, 182 and 258, all printed by greps of the same terms. ADRs 0016 and 0018 are wholly superseded (by 0018 and by 0024), so the premise cites records not in force. The 0030 and 0035 parts quoted are superseded by plan-5 rulings. The note of `paper_run_folder()` is lines 804-811, where the brief says 806-811.

## 4. Cases and checks

- `fill_gap` applied (`Funded by [GAP: funding statement].`): consistent with change-standard rule 13. The values are made up.
- `fill_gap` second occurrence: consistent.
- `fill_gap` occurrence above the count; marker not a gap marker; with `new_text`; blank `answer`. Each is inconsistent with rule 13's first bullet as written: "a test of a behaviour the change adds ... is run once on the unchanged tree ... and fails there". On the unchanged tree `apply_tex_patch.py` rejects any `fill_gap` op as `validation` exit 2 (`apply_tex_patch.py:116-118`, unknown kind). So a case that asserts only "`kind` `validation`, exit 2" passes on the unchanged tree. Each case has to assert the problem text that names its reason.
- `--allowed-blocks` with `B0002 fill_gap` and a `replace_block` on B0002; with B0002 only and an op on B0003; with one op of each: consistent. On the unchanged tree argparse rejects the option with a usage error, so an assertion of `kind` `validation` fails there.
- `--allowed-blocks` with a malformed line: inconsistent with rule 13 as written. On the unchanged tree argparse prints a usage error on standard error with exit 2 for the unknown option, so "the usage error on standard error, exit 2, the base untouched" passes there. The case has to assert the message naming the line.
- A patch with no `fill_gap` and no `--allowed-blocks`: consistent with rule 13's second bullet (preserved behaviour).
- `--find 'Author Name'` on a copy of the template: consistent. The input is a public template of the skill.
- `--find` with a text not held; across a blank line: consistent. The first has its control in the `Author Name` case.
- `--find` with `Universit\'e`: consistent as a test of exact matching. Its stated reason ("since the value reaches the script as one argument") is about the shell quoting of `SKILL.md` Steps 2, which a test through `subprocess` with an argument list does not exercise.
- The description at most 1,024: consistent. It is a command for a fact, per "Scripts compute facts".
- `### edit` read against "What to build" 4, and the copied pages read in the diff: consistent. These are reading cases of text.
- Rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case"): the item texts of the edits file reach the `--find` command line through the session (`SKILL.md` Steps 2), and `<file name>` reaches the path `before/<file name>` and the `git diff` command. No case covers either.
- No case asks the builder to check, quote or explain a place the step does not change. The template file is only an input.

Findings: The four `fill_gap` rejection cases and the malformed-line case, as written, pass on the unchanged tree (unknown kind and argparse rejection), contrary to change-standard rule 13, first bullet. The places of rule 15 (item text into the `--find` command line, file name into `before/<file name>`) have no case.

## 5. The question

The goal is the part of the plan's goal that step 1 delivers. That is the whole mode `edit` with `fill_gap`, `--allowed-blocks`, `--find`, the fresh citation agent, the refusals, the listings and ADR 0062.

- `fill_gap` applied: no. It needs the op built, with only the marker replaced.
- Second occurrence: no.
- Occurrence above count, marker not a gap marker, `new_text` present, blank answer: yes. As written, each passes on the unchanged tree and with any script that rejects every `fill_gap` op.
- `--allowed-blocks` refusal of the kind, and of the block: no, given the "one op of each: applied" control. A script that rejects every op under the option fails that control.
- `--allowed-blocks` applied: no.
- Malformed line: yes. Argparse's unknown-option error passes it.
- No `fill_gap`, no option: yes, by design. It is a preserved-behaviour check and proves nothing of the goal.
- `--find 'Author Name'`: no.
- `--find` text not held, and across a blank line: no with the `Author Name` control. Alone, yes (a script printing nothing).
- `--find` with a backslash: no.
- Description length: yes. The unchanged description (994) passes it, and `edit` is checked only by reading.
- `### edit` read: no, if the reading is made.
- Copied pages unchanged: yes. A diff that adds `edit` to no copied page passes it.
- The step's check: yes, in its figure part. "`python3 docs/figures/gen_figures.py` exits 0 and `git status --short docs/figures` prints nothing after it" passes on the unchanged tree with no `edit.svg`. The gate adds "with `docs/figures/academic/paper/edit.svg` among the files `git ls-files docs/figures/academic/paper` lists", and the step's line does not. The grep part passes as soon as the old counts are gone, whether or not `edit` is named. The test and reviewer parts do not pass without the goal.
- "What to build" 1, `fill_gap`: no, through the applied and second-occurrence cases.
- 1, `--allowed-blocks`: no.
- 1, docstring: yes, if only grepped. It is a reading item.
- 2, `--find`: no.
- 3, tests and their lines: no for the tests. Yes for the `building.md` and `scripts.md` lines, which only a reading checks.
- 4, `SKILL.md`: yes as far as a check goes. Only the user's or the reviewer's reading holds it, and the brief's verify list has no check of item 4 beyond the length and the grep.
- 5, the role pages: the same; reading only.
- 6, the other pages: the grep can pass without "thirteen" written. The figure check "lists only the three figures" can pass with nothing listed.

Findings: The four `fill_gap` rejection cases and the malformed-line case pass on the unchanged tree. The step line's figure check lacks the gate's `git ls-files` part, so it passes with no `edit.svg`. Verify 2's "lists only the three figures" passes with none listed. The grep check passes without the new count written. The description-length and copied-page cases pass with `edit` absent, which only the reading covers.

## 6. Implied inputs

This is a code step (two scripts), and it carries the session text that drives them.

- Two `fill_gap` ops on one block (one paragraph with two gaps, such as `Funded by [GAP: funder] under grant [GAP: grant number].`): missing. The script rejects a second op on a block ("a block takes at most one op", `apply_tex_patch.py:122-126`), and one `fill_gap` op names one `marker` and one `occurrence`. Such a paragraph can then not be filled in `edit` at all. The shape is fixed by ADR 0062 Decision 5, and ADR 0062 Consequences says "A builder's change to the shapes of items 2 to 5 is a rule clash". This is a stop for the orchestrator or the user before the build. Expected: both gaps filled, which the shape cannot give.
- A `fill_gap` and a `replace_block` on the same block (a block holding a gap and a change's old text): missing. The brief's item 3 allows "both kinds on a block that holds both". But two ops on one block are rejected, so only one `replace_block` op could answer both, which writes the gap's block by the writer and gives up the `fill_gap` guarantee. Expected result: unstated. This also contradicts ADR 0062 Decision 4 (see section 7).
- One `G<n>` item whose marker stands in several blocks (the draft writer writes `[GAP: citation needed]` wherever a claim has no source): missing. `occurrence` counts within a block only, and the brief does not say whether the one answer fills every block, one block, or is refused. Expected: stated before the build. A refusal naming the blocks, or a marker that must be unique, avoids one citation filled into every place.
- A `marker` that starts with `[GAP:` and ends with `]` but spans text between two markers, such as `[GAP: a] and the text between [GAP: b]`: missing. It passes the brief's check and replaces arbitrary text, which defeats Decision 4 of the brief ("so the op cannot stand in for a general replacement"). Expected: `validation`, with the marker holding no `]` before its last character and no second `[GAP:`.
- An `answer` holding a backslash, such as `\cite{key}` (the usual answer to `[GAP: citation needed]`), or `\'e`: missing. A replacement through `re.sub` misreads it. Expected: applied, with the answer's bytes as written.
- An `answer` holding a newline or a blank line: missing. A blank line splits the block in two. Expected: stated (rejected, or applied with the self-check holding).
- An `answer` or `marker` that itself holds a gap marker: missing. Expected: applied once, with no second replacement.
- `occurrence` missing, 0, negative, a string, or `true` (a Python bool passes `isinstance(..., int)`): only "above the count" is listed. Expected: `validation` for each.
- A `fill_gap` op against the 0.6 threshold: missing. In a file of one or two blocks, such as an input file holding only the authors or a short `cover-letter.tex`, any op exceeds 0.6 (`apply_tex_patch.py:180-183`). So every edit there is the stop "A structural patch". Expected: stated, whether `fill_gap` counts toward the ratio.
- A `fill_gap` op on a heading (`\section{[GAP: title]}`), or an answer holding `\section{...}`: missing. Expected: `structural`, exit 3 (`apply_tex_patch.py:184-190`).
- `--allowed-blocks` naming a block id absent from the manifest: missing. Expected: stated (usage error, or ignored).
- `--allowed-blocks` with an unknown kind (`B0002 fil_gap`), a duplicate line for one block, or a file that does not exist: missing. The brief's "Any other line is a usage error" may or may not cover an unknown kind, and a missing file would be a traceback (exit 1). Expected: usage error exit 2 for each, listed in the docstring.
- `--allowed-blocks` with `--check-only`: missing. Steps 10 runs `--check-only` first. Expected: the same `validation` rejection.
- `--find ''` (an empty string): missing. The empty string is in every block, so it prints every id. Expected: usage error, exit 2.
- `--find` with `--print-blocks`: missing. Expected: stated.
- `--find` on a text broken across a line within one block, as hard-wrapped LaTeX writes `Author\nName`: missing. The exact search finds nothing, and item 2 then refuses the change as "found nowhere" although the text stands. Expected: stated before the build (refused and named, or a search that treats a line break as a space). The exact search is ADR 0062 Decision 3's.
- `--find` on a text inside an environment: missing. The block is the whole environment (`anchorize_tex.py:46-70`). Expected: the environment block's id.
- `--find` on a text in a `%` comment line: missing. Expected: the block's id, as printed.
- A `--find` on a file whose manifest already stands beside it: covered in part by "writes no manifest". Expected: the existing manifest unchanged.
- A `replace_block` op whose block already held a cite command (an author's name in a paragraph with `\cite`): missing. Item 7 starts the citation agent only for an op that "adds" a cite command, while `SKILL.md:284` uses "holds" (in `new_text`). Expected: stated.
- A `fill_gap` op whose `answer` adds a cite command: covered by item 7, except that the citation agent finds cited sentences "in the new text of the patch's operations" (`citation_compliance_agent.md:862`), which a `fill_gap` op has none of. Expected: the agent reads the built block, or the `answer` in its sentence.
- The fresh citation compliance agent of `edit`, with the rows Claim check and Incremental checks never asked: missing. By `intake_agent.md:246` an unasked row reads as "no". Under `citation_compliance_agent.md`, "The row Claim check", the agent then reads no source's text. Expected: the claim check runs in `edit` whatever those rows say, as in citation-check.
- A new `.bib` entry for a filled `\cite{key}` gap: item 7 puts it in "the writer's `.bib` patch". But item 5 lets the writer write only `fill_gap` and `replace_block`, the `.bib` has no file of allowed blocks (it is never searched), and item 6 applies every patch "with `--allowed-blocks` and its file". An entry added after the last block is an `insert_after` op (`draft_writer_agent.md`, "The reference fix"). Expected: stated. As written, the `.bib` patch is rejected or has no file to apply with.
- The `compile-fix` of `edit` on an `Overfull \hbox` of more than 10pt elsewhere in the manuscript: missing. Steps 11 sends such lines to the writer, which would then rewrite blocks no item names. Expected: stated, whether the compile fix is confined to the allowed blocks. The same applies to the `C<m>` patches of the citation agent.
- Two input files with the same name in different folders (`a/intro.tex`, `b/intro.tex`): missing. `before/<file name>` collides. Expected: a path that keeps them apart.
- `git diff --no-index` exits 1 when the files differ: missing. Expected: the session reads exit 1 as a diff printed, not a failure.
- The writer answering in `edit` with `[PATCH-ESCALATION-REQUIRED: ...]`: missing. The stop "A revision item that needs restructuring" is not in the stops line. Expected: stated.
- Edits file lines: a blank line or a Markdown heading (item 1 would name each as "not read"); an old text holding `"`; and two items with the same id. All are missing. Expected: stated.

Findings: Each item above marked "missing" is not in "Cases". These cost the most: two gaps in one block (unbuildable under ADR 0062's shape, a stop); a gap and a change in one block; one marker standing in several blocks; a `marker` that spans two gaps; an `answer` holding a backslash; `--find ''`; a text wrapped across a line; the unasked Claim check row; the `.bib` patch under `--allowed-blocks`; the compile fix outside the allowed blocks; the `fill_gap` answer that the citation agent reads as `new_text`.

## 7. ADRs

- 0001, 0002, 0004 to 0012, 0014, 0044 to 0048, 0051 to 0059: these do not touch the step. They cover the writing base, the prose standard's precedence, self-rule, choices, the ledger, the cost script, the verify list, the dispatch block, commits, comment review, grant, wait-what, wizard, codebase-design, tutor, the build driver, researcher, handbook and the rulings file. The step changes no file, name or rule they govern. ADR 0010 governs the verify list, which the step leaves equal to `building.md`; the brief states that fact.
- 0003, 0016, 0018, 0019, 0021, 0022, 0025, 0028, 0037, 0041: wholly superseded. 0016 and 0018 are named by the brief, which is a finding (section 3).
- 0013 and 0061 (`/writing`): these do not touch the step, since `edit` runs no `/writing`.
- 0017 (in force in part): "`lookup.py` ... makes every lookup of the skill: `resolve`, ..., `bibtex`, ...". The step is under it for the new `.bib` entry of item 7. The brief does not name it.
- 0020 (in force but for the continuing run): "A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder". It touches the step and is named.
- 0023, 0031: these do not touch the step, since `edit` asks no row Closing review.
- 0024 (in force as narrowed by 0033, 0036 and 0043): "Each claim `paper`'s citation compliance agent judges, in citation-check, full and revision mode, rests on a passage read in the same run from the source's full text." It touches the step through the fresh citation agent of `edit`, which adds a fourth mode. It is not named; the brief names superseded 0016 and 0018 in its place.
- 0026: "The prose of a manuscript is the text of a paper, its abstract, its statements and its cover letter. It is held to the prose standard ... with the differences ...". It touches the step, since the writer's patch in `edit` changes manuscript prose and `cover-letter.tex`. It is not named.
- 0027: superseded in the parts that concern starts and resumptions. It does not touch the step.
- 0029 (in force as narrowed by 0036 and 0043): "the incremental check of each later patch standing", with "a fresh citation compliance agent" superseded by 0043 ("the check being made by the citation compliance agent of the first check, resumed"). ADR 0062 Decision 7 brings back a fresh agent for `edit`. It touches the step and is not named.
- 0030, 0035: their parts in force (`paper` reads no `plan.yaml`) do not touch the step. The part the brief quotes is the plan-5 rulings' (section 3).
- 0032, 0038 to 0040, 0042: lit-review and the strategist. They do not touch the step.
- 0033: "The citation compliance agent, in full, revision and citation-check mode, reads each cited source's text from every page ... it can reach". It touches the step through the fresh agent of `edit`. It is not named.
- 0034: "the draft writer, the formatter and the citation compliance agent may run one web search ... for the venue page". It touches the step through the `.bib` entry of item 7. It is not named.
- 0036: "The caps on a fix stay: the narrowing of a refused structural patch, the reference fix and the compile fix ..." and the **Patches** stop. It touches the step through items 6 and 8 and the stops line. It is not named.
- 0043 (in force but for the 0050 parts). It touches the step in several sentences. The brief names only Decision 1's first sentence.
  - Decision 3: "In the modes with no intake agent (revision, response-letter, format-convert, citation-check, disclosure, revision-coach, rebuttal-audit and the two calls) the session asks the user, in one message, only what the mode's items name". `edit` joins this list.
  - Decision 3: "The claim check against each source's full text runs in full, revision and citation-check mode". `edit` adds a run of it.
  - Decision 3: "The citation compliance agent of the first check is resumed for it" (the incremental check). `edit`'s fresh agent departs from this.
  - Decision 3: "the intake agent only in full, outline-only, abstract-only, lit-review and plan". This holds for `edit`.
  - Consequences: "`paper` has twelve modes and two calls". The step makes this false.
  - ADR 0062 Decision 10 settles the deviation condition of Consequences 1. It holds no superseding line for the Decision 3 sentences or for Consequences 2.
- 0049: "`paper` stays at twelve modes and two calls" (Consequences). It is made stale and is not named.
- 0050: it does not touch the step, since `edit` makes no limit cut.
- 0060: "`gen_figures.py` imports the engine from the skill's folder, so one engine draws Ordo's figures". It touches the step through `paper_edit_graph()`. It is not named.
- 0062 (`proposed`): the step builds it, and it is named. These parts of the brief were compared with Decisions 1 to 10 and with D1 to D17:
  - Decision 4 says "`fill_gap` alone on a block that holds a marker of the edits file, and `replace_block` on a block that holds a change's old text", and D4 says "`fill_gap` alone on a block holding a marker". Brief "What to build" 4, item 3 says "both kinds on a block that holds both". This contradicts "alone".
  - Consequences says "A builder's change to the shapes of items 2 to 5 is a rule clash." Brief "What is on the tree" says the step "edits the record to its current state where the build shows a detail differently", and "What to build" 6 says the same. For a detail of Decisions 2 to 5 this tells the builder to rewrite the record where the ADR makes the difference a rule clash, which is a stop under change-standard rule 4.
  - Decision 5 field list (`block_id`, `old_hash`, `marker`, `occurrence`, `answer`): the brief adds `op_id`, `kind`, `roadmap_item_ids` and `rationale`. These are the fields of every op, and Decision 2 names `roadmap_item_ids`, so this holds.
  - Decisions 1, 2, 3, 6, 7, 8, 9 and 10, and D1 to D3, D5 to D10 and D15: the brief matches each. The brief adds "a gap whose marker no file holds is refused alone", beyond D5, and "PDF copied to `<main>.pdf`", per D7. Neither contradicts.
  - The file format of `--allowed-blocks` (brief Decision 1): ADR 0062's alternatives say "The two refusals with their shape left to the builder: a wire format is the user's to choose". The brief fixes the format in the orchestrator's decision, not the builder's, and argues that it is no user-visible format. This is not a contradiction, but it is a choice of a shape the ADR reserves, taken in the brief.

Findings: The brief contradicts ADR 0062 Decision 4 and ruling D4 ("`fill_gap` alone") with "both kinds on a block that holds both". The brief's instruction to edit ADR 0062 where the build differs conflicts with ADR 0062 Consequences ("A builder's change to the shapes of items 2 to 5 is a rule clash"). ADRs the step touches that the brief does not name, or names wrongly: 0024 and 0033 (named as superseded 0016 and 0018); 0029; 0043 Decision 3 (the no-intake list, the claim check modes, the resumed incremental agent) and its Consequences "twelve modes and two calls"; 0017 and 0034 (the `.bib` entry); 0026 (the cover letter's prose); 0036 (the caps on a fix); 0049 Consequences; 0060 (the figure engine).

## 8. Dictated text

- `B0012 fill_gap` / `B0008 replace_block`: `grep -n 'B0012 fill_gap' .../briefs/1.md` gives 46. Holds. It is a file format in code.
- `/paper edit <main.tex> <edits file>`: `grep -n '/paper edit <main.tex> <edits file>\` with'` gives 66. Holds. It matches the Quick start form, and the comment's words are not given.
- `G<n>: [GAP: <marker as the .tex writes it>] => <answer>` and `E<n>: "<old text>" => "<new text>"`: `grep -n 'G<n>: \[GAP:'` gives 70. Holds. `=>` stands inside a code span as part of a file format, which prose standard 0 ("Arrows (`->`) only inside code") allows.
- `patches/<nn>-<file name>.allowed-blocks`: `grep -n 'allowed-blocks\` beside'` gives 72. Holds.
- `[EDIT-REFUSED: items=<ids>, reason=<one line per item>]`: `grep -n 'EDIT-REFUSED: items'` gives 74. Holds. It takes the form of the existing escalation tag.
- `git diff --no-index --word-diff=plain '<run folder>/before/<file name>' '<file>'`: `grep -n 'word-diff=plain'` gives 78. Holds. The values are single-quoted per `SKILL.md` Steps 2.
- `### edit mode: Gap Answers and Stated Changes (`paper`'s addition)`: `grep -n '### edit mode: Gap'` gives 87. Holds. It is a noun-phrase label in the page's own heading form (`mode_selection_guide.md:237`), per `skill-layout.md` "Anti-patterns" (noun-phrase label) and prose standard 0 ("Headings are labels").
- "Paper's addition: the edit patch": `grep -n "Paper.s addition: the edit patch"` gives 84. Holds. It is a noun-phrase label in the form of `draft_writer_agent.md:595`.
- `### edit`: `grep -n 'A section \`### edit\`'` gives 69. Holds.
- "thirteen modes, or twelve other modes": `grep -n 'twelve other modes'` gives 68. Holds. The order "twelve other modes" also keeps verify 3's `twelve modes` pattern silent, while "the other twelve modes" would trip it.
- `metadata.version` "5.1.0": `grep -n '"5.1.0"'` gives 64. Holds per `skill-layout.md`, "Frontmatter" (the minor part: the skill accepts an input it did not, and every earlier run still works).
- "fifteen figures of `paper`, one for each of its thirteen modes, `edit.svg` among them": `grep -n 'fifteen figures'` gives 92. Holds. The current count is 12 mode figures plus `lifecycle.svg` and `run-folder.svg` (`git ls-files docs/figures/academic/paper` lists 14), so 15 after the step.
- Test text `Funded by [GAP: funding statement].` and `the Example Foundation`: `grep -n 'Funded by \[GAP'` gives 99. Holds. The text is made up, for a test under `skills/`.
- Test value `Faes`: `grep -n 'such as \`Faes\`'` gives 102. It breaks `CLAUDE.md`, "A shipped file names nothing private": "It never refers to ... a person of the author's own", and "An example in a skill is built from public material or made up". `apply_tex_patch.test.sh` is under `skills/` and is a shipped file, and `Faes` is the author's surname. It also breaks the brief's own Conventions ("every example is made up").
- Test value `Universit\'e`: `grep -n "Universit"` gives 113. Holds. It is a generic word.
- `Author Name`: from the public `templates/latex_article_template.tex`. Holds.

Findings: `Faes` (brief line 102) breaks `CLAUDE.md`, "A shipped file names nothing private", in a test under `skills/`. A made-up non-gap text such as `Example` is needed.

## Declined to judge

- Whether the gap in ADR 0062 Decision 5's shape for two gaps in one block is answered by a new op shape, by several markers per op, or by an exception to "a block takes at most one op": this is the user's or the orchestrator's ruling, since ADR 0062 reserves the shape.
- Whether `--find` should treat a line break within a block as a space: this is a change to ADR 0062 Decision 3 ("an exact search"), and it is the user's call.
- Whether `docs/adr/0043` and `0049` should gain a superseding status line, and whether ADR 0062 should name the parts of 0029 and 0043 it changes: the session's or the user's call on how the records stand.
- Whether the glossary entry for `edit` mode belongs in `plan-terms.md` first, as `skill-layout.md`, "Writing for an agent", reads literally ("A skill that needs a new term ... adds or changes its entry in `skills/ordo/ordo-init/templates/plan-terms.md` first"). The glossary's own lead and its existing `paper` entries (**plan mode**, **draft review**, **incremental citation check**, all under "Ordo's own terms") follow the brief's placement. I took the brief's placement as consistent with practice and did not raise it as a finding.
- The judgment of whether the description can take thirteen modes and two new trigger phrases within 1,024 characters without dropping a case: not checked. It depends on the builder's wording.

Agent usage: a25ff50f02078653c, claude-opus-5-5, 242508 tokens, 56 tool uses, 9.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

The step stopped on three findings, which are Open item G of `orchestrator-state.md` and of step 1's Step 0 in `plan.md`. The brief was restored to main's copy (main has none) at the stop. Each other finding is closed in the brief that `/spec 29 1` writes after the ruling, by the change named here (the `spec` skill's "Steps / A ruling" 3).

- 6, a gap marker and a change's old text in one block: a stop, Open item G (1).
- 6, one marker standing in several places: a stop, Open item G (2).
- 6, a text wrapped across a line within a block: a stop, Open item G (3).
- 7, the brief's "both kinds on a block that holds both" against ADR 0062 Decision 4: closed by the ruling on Open item G (1).
- 1, `docs/dev/scripts.md:9`; `SKILL.md:10`, `:99`, `:154`, `:182`, `:205`, `:258`, `:284`, `:836`, `:975`, `:1052`; `revision_patch_protocol.md:62`, `:77`; `draft_writer_agent.md:578`, `:580`; `citation_compliance_agent.md:585`, `:862`; the two test head comments: each named in "What is on the tree" and given its requirement in "What to build".
- 1, `intake_agent.md:262-263`: the file added to "Paths this step writes", with `edit` asking the rows Claims not to make and Earlier papers only for an op that adds a cite command.
- 1 and 7, ADR 0043 Consequences "twelve modes and two calls" and Decision 3 (the modes with no intake agent, the claim check's modes, the resumed incremental agent): `docs/adr/0043-*.md` added to the paths for its status lines only, marking those parts superseded in part by 0062 in the folder's words, as ADR 0062 Decisions 7 and 10 already decide; ADR 0049's Consequences sentence stays, since it states what 0049 changed.
- 3, ADRs 0016 and 0018 wholly superseded, and 0030 and 0035's parts superseded: replaced by ADR 0024 as narrowed by 0033, 0036 and 0043, and by `SKILL.md` Steps 4 for the general-purpose agent.
- 3, `sha256` left out of the function list and the note at lines 804-811: corrected.
- 4, the four `fill_gap` rejection cases and the malformed-line case: each asserts the problem text that names its reason, which the unchanged tree does not print.
- 4, rule 15: cases for an item text holding a single quote reaching the `--find` command, and for two input files of one name, which `before/` keeps apart by their path relative to the manuscript's folder.
- 5, the figure check: verify 2 requires `edit.svg` among the files `git ls-files docs/figures/academic/paper` lists after the change and `git status --short docs/figures` printing nothing once the figures are written; verify 3 adds `git grep -n 'thirteen modes' -- skills/academic/paper/SKILL.md README.md docs/dev/building.md` printing a line for each file.
- 6, two gaps in one block: several `fill_gap` ops may name one block, each on a different occurrence of the old block, all built on the old block, and no op of another kind beside them; `revision_patch_protocol.md:78` and the docstring say so.
- 6, a `marker` spanning two gaps: `validation`, a marker holding one `[GAP:` and no `]` before its last character.
- 6, an `answer` holding a backslash: applied with its bytes as written; an `answer` holding a blank line: `validation`; an `answer` holding a gap marker: applied once.
- 6, `occurrence` missing, 0, negative, a string or a boolean: `validation`.
- 6, the 0.6 threshold: a `fill_gap` op does not count toward it, since it cannot change more than its marker.
- 6, a `fill_gap` on a heading: `structural`, exit 3, as now.
- 6, `--allowed-blocks` naming an id absent from the manifest, an unknown kind, a block twice, or a missing file: a usage error on standard error, exit 2; with `--check-only`: the same `validation` rejection.
- 6, `--find ''` and `--find` with `--print-blocks`: a usage error, exit 2; `--find` inside an environment or in a comment line: the block's id; a manifest standing beside the file: unchanged.
- 6, the cite command reached through `answer` (`SKILL.md:284`, `citation_compliance_agent.md:862`): the check reads the built block of a `fill_gap` op as its new text.
- 6, the rows Claim check and Incremental checks never asked: the fresh agent of `edit` checks each claim of its ops against the sources' texts, as citation-check does.
- 6, the `.bib` patch: the session writes a file of allowed blocks for the `.bib` naming its last block with `insert_after`, and the patch holds only entries `lookup.py bibtex` printed.
- 6, the `compile-fix` and `C<m>` patches: applied with a file of allowed blocks naming the blocks the run's patches changed, with `replace_block`; a failing line outside them is shown in the final message and sent to no fix.
- 6, `git diff --no-index` exits 1 when the files differ: read as the diff printed.
- 6, `[PATCH-ESCALATION-REQUIRED: ...]`: the writer of `edit` writes none; an item it would escalate is refused by `[EDIT-REFUSED: ...]`.
- 6, edits file lines: a blank line is skipped; a heading or any other line is named as not read; an old text is read from after `: "` up to `" => "`; a second item with an id already read is named as not read.
- 7, the instruction to edit ADR 0062 against its Consequences: the builder adds to ADR 0062 the details this brief decides and changes none of the shapes of items 2 to 5; a build that needs one is handed back.
- 7, ADRs not named: 0017, 0024, 0026, 0029, 0033, 0034, 0036, 0043 Decision 3, 0049 and 0060 named with their sentences.
- 8, `Faes`: replaced by the made-up `Example`.
