# Step 12 report: every coverage row of academic-paper-reviewer checked against its file

Everything in the brief is done.

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- Open item M (step 10, the roadmap's gates and order): the roadmap changes need your approval as a diff (ruling 2h, the `roadmap` skill), and two of them are your choice. Checked on main at f23d14a: `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 18 (8 paper, 6 literature, 3 paper-review, 1 researcher, as entry 15.A's goal says); the `rebuild:` rows per skill are writing 3, paper 32, paper-review 21, rebuttal 7, literature 19, idea 3, researcher 6, submit-manuscript 1, and code-comments, grant, scaffold, project-docs and submit-grant 0 (`grep -c '| rebuild: <skill> |'`).
  - The changes the plan already fixes, shown for approval:
    1. Entry 15.A's gate: `grep -c 'rebuild later:'` (which also counts the mark's definition at `docs/academic-coverage.md:15`, so it never reaches 0) becomes `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 0; and the gate adds: the coverage check with `--built paper --built paper-review --built literature --built researcher` prints `ok:`, and the plan's ledger holds a record for each re-marked row that the file it names holds what the source file did, checked by reading both.
    2. Entries 3, 5, 6, 7, 9, 10, 13 and 14 each add to the gate: the coverage check with `--built <its skill>` (the command in `docs/academic-coverage.md`) prints `ok:`, and the plan's ledger holds a record for each `rebuild: <its skill>` row that the file of `skills/<its skill>/` the row names holds what the source file did, checked by reading both. Entries 4, 8, 11 and 12 get no such clause, since they have no `rebuild:` row and `--built` fails a skill with none.
    3. Entry 16 waits on 14 as well: "5 to 10, each with its side-by-side run passed; 14, for the submission checks and the cover letter of `references/journal_submission_guide.md`; 15.A, ...".
    4. Entry 7's gate adds: a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind, wins or ties.
    5. Entry 10's gate adds: a side-by-side run against deep-research's socratic mode (`references/socratic_mode_protocol.md`) on a real idea, compared blind, wins or ties.
    6. Entry 8's "Waits on: 3, for the writing base; 2, for the coverage" becomes "3, for the writing base; 2, for the coverage: no file is marked `grant`, and the funder acknowledgement text reaches it through the paper row of `references/funding_statement_guide.md`".
  - Choice 1, the order of entries 5 and 9. The paper skill's DOI check and its integrity row (`agents/integrity_verification_agent.md`, looking every reference up) need the lookups through Crossref, OpenAlex, Semantic Scholar and arXiv, and their five rows are `rebuild: literature` (entry 9), which entry 5 does not wait on.
    - (a) Entry 9 moves before entry 5 in the file, keeping its number, and entry 5 waits on 9 "for the reference lookups". Pro: the lookups are built once, where entry 9's goal already names them; the coverage rows stay as they are. Con: paper, the most used skill, comes one entry later.
    - (b) The five lookup rows are re-marked `rebuild: paper` and entry 9 waits on 5, reusing them. Pro: paper comes first. Con: five coverage rows and entry 9's goal are rewritten, and the literature skill depends on the paper skill for its core search.
    - Recommendation: (a). It ends the cause where the rows already put it. (b) costs more and splits the literature skill's own search out of it; neither is the cheaper-and-worse option by cost alone, and (a) is the smaller change.
  - Choice 2, the cover letter and the blind-review removal, which the coverage rows of `agents/formatter_agent.md` (line 59) and `references/journal_submission_guide.md` (line 90) send to `submit-manuscript`, while entry 14's goal names neither.
    - (a) Entry 14's goal adds: "It also writes the cover letter, with suggested and excluded reviewers, and removes what identifies the authors for a blind review, from the venue file." Pro: matches both rows as written; both are made per venue at submission, from the venue files entry 14 already waits on. Con: a cover letter for a venue with no portal waits for entry 14.
    - (b) Both move to entry 5: entry 5's goal names them, and rows 59 and 90 are rewritten to `paper`. Pro: available with the first writing skill. Con: two rows rewritten, and the paper skill takes venue-specific work without the venue files of entry 13.
    - Recommendation: (a). (a) is also the cheaper option; it is recommended because the work is venue-specific and entry 14 is where the venue files and the portal meet, not because it is cheaper.
  - To rule: `Ruled: M: changes 1-6 <approved, or what to change>; choice 1 (a) or (b); choice 2 (a) or (b)`. On the ruling, step 10 writes the approved diff through `/roadmap`, lands it, and books it.

## The cases' first run, on the unchanged list

The checks are one script, `cases.py` in the session scratchpad, run from the worktree root against a copy of lines 116-146 taken before the first edit. First run, before any row changed:

- Coverage check: `ok: docs/academic-coverage.md`, exit 0.
- Record count: 0 data rows (the records file did not exist yet), 26 files listed by `find`, no duplicates. Expected on the unchanged list.
- Rows differing from the copy: 0; `fixed` records: 0.
- Largest sentence in a reason cell: 34 words (`agents/field_analyst_agent.md`); no sentence over 35.
- Destinations of changed rows: no changed rows.

No case gave a wrong result under the brief's rules, so the work went on without a stop. A destination is counted as a backticked name, a skill named as "the <x> skill", or an entry number; a skill name used as a plain noun ("a rebuttal") is not counted.

## Result table

| Item | State | Command and output |
|---|---|---|
| 1. Every file read, every row checked | DONE | `find /Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer -type f \| sort \| xargs wc -l`: 26 files, 5707 lines, each read whole; one record per file in `12-rows.md` with `1-<n>` from `wc -l` (the case script's lines-read check prints `[]` mismatches) |
| 2. Each defective row fixed in place; finding 10 checked | DONE | 9 rows fixed, marks unchanged (`marks identical: True`); finding 10 holds and is fixed |
| 3. Shortening never loses a destination | DONE | case 5 prints `lost []` for 8 of 9 changed rows; the methodology row's lost "review skill" is its own mark, explained in record 4 |
| 4. The records, 26, in section order | DONE | `grep -c '^\| [0-9][0-9]* \| \`' .../12-rows.md` prints `26`; case 2: `duplicates [], missing 0, extra []`, `order matches section: True` |
| Case: coverage check before and after | DONE | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0 |
| Case: changed rows equal fixed records | DONE | case 3: `rows changed from base: 9; fixed records: 9`, `changed but not fixed: []`, `fixed but unchanged: []`, non-row lines differ `[]` |
| Case: largest sentence, before and after | DONE | `sed -n '116,146p' docs/academic-coverage.md \| python3 -c "..."` (split on sentence ends, words per sentence) prints `34`; before 34, after 34 |
| Case: destinations per changed row | DONE | case 5 lists before and after per row; see "Rows changed" |
| Verify runner | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: eleven `PASS:` lines, ten `ok:` lines, `verify: 13 commands passed`, exit 0 |
| Only the brief's paths written | DONE | `diff /Users/axelfaes/workspace/ordo/docs/academic-coverage.md docs/academic-coverage.md` prints `120,127c120,127` and `140c140` only, all inside 116-146; the ledger files written are `12-rows.md` and this report |
| ASCII, no dash asides | DONE | `LC_ALL=C grep -n '[^ -~]'` over the coverage doc and `12-rows.md` prints nothing; the runner's ASCII check passed |

Files changed: `docs/academic-coverage.md` (9 lines rewritten, 120-127 and 140; 31-line section unchanged in length), `.scratch/.../agents/reviews/12-rows.md` (new, 32 lines), this report (new).

## Rows changed

Every mark is unchanged; each fix is to the reason.

| Row | Mark (before and after) | Why |
|---|---|---|
| `SKILL.md` | rebuild: paper-review | The guided and calibration modes, marked `rebuild later` in their own rows, now go to entry 15.A with their protocol files; the sprint gate named no entry; the pipeline routing, version and related-skill sections were sent nowhere and are now dropped with a reason. |
| `agents/field_analyst_agent.md` | rebuild: paper-review | Finding 10: "lists no ML venue" is false (the journal file's lines 46-47 list JMLR and IEEE TPAMI); now "names no ML conference". |
| `agents/eic_agent.md` | rebuild: paper-review | The sprint section was deferred with no entry; now entry 15.A. The phase boundary was sent nowhere; its pipeline folders and uninstalled integrity script are now dropped. |
| `agents/methodology_reviewer_agent.md` | rebuild: paper-review | Sprint section to entry 15.A; the APA format item (line 148) now drops with the statistical file's APA formats; phase-boundary pipeline parts dropped. |
| `agents/domain_reviewer_agent.md` | rebuild: paper-review | Sprint part to entry 15.A; phase-boundary pipeline parts dropped. |
| `agents/perspective_reviewer_agent.md` | rebuild: paper-review | Sprint part to entry 15.A; phase-boundary pipeline parts dropped. |
| `agents/devils_advocate_reviewer_agent.md` | rebuild: paper-review | The cross-model option "stays behind" had no reason; now dropped because `shared/cross_model_verification.md` is not installed. Sprint part to entry 15.A; phase-boundary pipeline parts dropped. |
| `agents/editorial_synthesizer_agent.md` | rebuild: paper-review | "The sprint-contract arithmetic is abandoned" had no reason; now dropped because counting block scores would replace arbitration by evidence. The guided-mode issue list goes to entry 15.A; phase-boundary pipeline parts dropped. |
| `references/sprint_contract_protocol.md` | rebuild later: paper-review | The drop of the JSON contract, lint and panel arithmetic had no reason; now: schema and validator not installed, and the synthesis settles disputes by evidence. Entry 15.A named for the pre-commitment rule. |

Finding 10: holds, fixed in the field_analyst row as the audit proposed ("no ML conference"). The top_journals row already said "names no ML conference" and holds.

"Not installed" rests on `find` in `/Users/axelfaes/workspace/research-hub` for `shared/cross_model_verification.md`, `shared/sprint_contract.schema.json`, `shared/contracts`, `scripts/check_sprint_contract.py` and `scripts/check_pipeline_integrity.py`, which printed no path for any of them.

## Judgment calls the brief left open

- A `rebuild` row's mark carries every part of the file its reason does not exclude, so a row is defective when a part cannot go with the mark (a mode another row marks `rebuild later`, pipeline machinery whose scripts are not installed) and the reason does not send it elsewhere. Rows whose unexcluded parts can all go with the mark hold, for example `references/editorial_decision_standards.md` with its ethics section.
- A part sent to another skill already named by skill (`rebuttal` in the re-review row) holds without an entry number; the brief's "skill and entry" requirement was applied to deferrals.

## Anything in the brief that was wrong

Nothing.
