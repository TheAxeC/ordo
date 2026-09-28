# Step 12 report: every coverage row of academic-paper-reviewer checked against its file

Everything in the brief and in the round-1 rulings is done.

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

## Repair round 1

| Ruling | State | Command and output |
|---|---|---|
| 1. Agent rows send only the pre-commitment rule to 15.A; the contract-driven decision dropped with row 140's reason | DONE | Rows 122-126 now say `paper-review` at entry 15.A takes the sprint section's pre-commitment rule with `references/sprint_contract_protocol.md`, and drop the decision the failure conditions dictate (eic_agent.md 77-80, the other four at 78-81 or 79-82) because the synthesis settles disputes by evidence. Row 140 now lists the contract-driven decision among its drops. `grep -n 'failure conditions dictate\|contract-driven decision' docs/academic-coverage.md` hits rows 122-126 and 140. |
| 2. One disposition for the cross-model option, rows 126 and 131 | DONE | Both rows send the option to `paper-review` at entry 15.A with `references/calibration_mode_protocol.md`: a second model family on an external provider reviewing the manuscript with the user's consent (devils_advocate 348; calibration 49, 191-193), which the first gate does not need because it reviews with one model. The missing how-to file is no longer the reason. `sed -n '126p;131p' docs/academic-coverage.md \| grep -c 'cross-model'` prints 2. |
| 3. Phase folders dropped for row 120's reason; "not installed" only of the script | DONE | Rows 122-127 drop the phase folders because `researcher` (entry 13) owns the order of stages, and say "not installed" only of `scripts/check_pipeline_integrity.py`. `sed -n '122,127p' docs/academic-coverage.md \| grep -c 'researcher'` prints 6. |
| 4. Version Info, Related Skills and line 68 each with a disposition and reason; record 1 exact | DONE | Row 120: Version Info (416-424) with the version list and changelog pointer is dropped because `docs/dev/skill-layout.md` keeps the version in `metadata.version`; Related Skills (395-402) is dropped for the layout's Use instead table, with `tw-hei-intelligence` serving no hub paper; the spectrum labels with `shared/mode_spectrum.md` (68) are dropped because they change no step. Record 1 cites 5-12, 15, 19-22, 24, 185-203, 282-302, 395-402, 408, 409-412, 416-424, 428-430 separately. |
| 5. Every 15.A deferral names `paper-review` and the carrying file | DONE | The check below lists each row 120-127 with its carrying files; `sed -n '120,127p;140p' docs/academic-coverage.md \| grep -c '`paper-review` at entry 15.A'` prints 8 (rows 120, 122-127 and 140; row 121 defers nothing). |
| 6. The definition sentence, and every 15.A row of the document checked | DONE | The sentence is appended to the `rebuild later` bullet at line 15, so no line number in the file moves. The check (`python3 check15a.py docs/academic-coverage.md` in the session scratchpad, which lists each row with "15.A" and the `rebuild later` files of the same skill it names) prints "carrying files named" for rows 56, 92, 120 and 122-127, and "the row is itself a later file" for rows 59, 64, 91, 94 and 140. Rows outside 116-146 that name no carrying file, not changed: line 54 (`academic-paper` `SKILL.md`, rebuild: paper, "entry 15.A builds plan mode") and line 60 (`agents/intake_agent.md`, rebuild: paper, "Entry 15.A takes plan-mode questions and format profiles"). |
| 7. Records and report | DONE | The largest-sentence command is quoted below as it runs; record 1's ranges are exact; each fixed record states the new disposition. |
| 8. Deciding lines of the eight holds rows the reviewer did not read | DONE | Listed below. |

Deciding lines of the eight `holds` rows (ruling 8):

- `examples/interdisciplinary_review_example.md`: temporal leakage from k-fold (132) and SMOTE with 12 positives (133), both absent from the fallacy table of `agents/methodology_reviewer_agent.md` (173-183); arbitration by confidence (204-212, 259-266); R3's top finding (173); higher-education framing removed (11, 32-42).
- `examples/hei_paper_review_example.md`: a qualitative multiple-case study on Taiwanese private universities (3, 9-15) through cards (49-97), reports (101-278), decision and roadmap (281-341), with no rule of its own.
- `references/editorial_decision_standards.md`: criteria on the 1-5 average (14-16, 35-37, 61-63, 89-91), matrix (116-130), split and outlier (134-144), fatal methodology flaw leans to reject (164), two major rounds (80, 186).
- `references/review_criteria_framework.md`: seven 1-5 dimensions (13-81), criteria per paper type (85-141), novelty bias (156), language discrimination (158), numbers single-sourced in `references/quality_rubrics.md` (11, 172).
- `references/statistical_reporting_standards.md`: universal checklist (7-87), red flags incl. only the best model (295) and text against tables (312), completeness score (352-377); dropped per-method checklists (91-186), higher-education methods (318-348), APA formats (190-241).
- `templates/editorial_decision_template.md`: decision (21-25), reviewer summary (29-36), consensus and disagreements with rationale (40-62), neither stricter nor milder (73), acceptance criteria (97), effort (116-132), severity to priority (193-200).
- `templates/peer_review_report_template.md`: recommendation and confidence (44-59), cited strengths (72-93), problem, why, suggestion, severity (104-120), section comments (130-171), two to four questions (175-186), tone examples (253-267).
- `templates/revision_response_template.md`: comment, response, changes made with page and paragraph (48-111), argued disagreement (224-241), required and suggested tables (155-174), change log (178-188).

## The cases

The checks are one script, `cases12.py` in the session scratchpad, run against a copy of lines 116-146 taken on main's text before the first edit, and against a copy of the whole file at the round's start (116df6d).

First run, on the unchanged list, before any edit: coverage `ok: docs/academic-coverage.md`, exit 0; 0 records (no records file yet), 26 files; 0 rows differing, 0 fixed; largest sentence 34 (`agents/field_analyst_agent.md`), none over 35; no changed rows. No case gave a wrong result under the brief's rules.

Run after round 1:

```
case 1 coverage: ok: docs/academic-coverage.md exit 0
case 2 records: 26 data rows, files 26, duplicates [], missing 0, extra []
case 2 order matches section: True
case 2 lines-read mismatches: []
case 3 rows changed from base: 10; fixed records: 10
case 3 changed but not fixed: []
case 3 fixed but unchanged: []
case 3 non-row lines of the section differ: []
case 3 marks identical: True
case 4 largest sentence: base (34, 'agents/field_analyst_agent.md'), now (34, 'agents/field_analyst_agent.md')
case 4 sentences over 35 now: []
case 5 SKILL.md: lost []
case 5 agents/devils_advocate_reviewer_agent.md: lost []
case 5 agents/domain_reviewer_agent.md: lost []
case 5 agents/editorial_synthesizer_agent.md: lost []
case 5 agents/eic_agent.md: lost []
case 5 agents/field_analyst_agent.md: lost []
case 5 agents/methodology_reviewer_agent.md: lost ['review skill']
case 5 agents/perspective_reviewer_agent.md: lost []
case 5 references/calibration_mode_protocol.md: lost []
case 5 references/sprint_contract_protocol.md: lost []
```

Case 5 compares each changed row with main's reason. The methodology row's "the review skill" was the subject of main's deferral sentence and is the row's own mark; the row now names it as `paper-review`. Against the round's start, one destination left a row: `shared/cross_model_verification.md` in row 126, because ruling 2 gives the option a carrying file and the missing how-to file is no longer the reason (record 7).

## Verify before you report

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` printed eleven `PASS:` lines, ten `ok:` lines and `verify: 13 commands passed`, exit 0.
2. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0.
3. `grep -c '^| [0-9][0-9]* | `' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/12-rows.md` printed `26`.
4. The largest sentence over the section's reason cells, run from the worktree root, printed `34` (and `34` on main's copy of the section):

```sh
sed -n '116,146p' docs/academic-coverage.md | python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin if l.startswith("| `") for s in re.split(r"(?<=[.!?])\s+(?=[A-Z`(])", l.rstrip(" |\n").split(" | ",2)[2])))'
```

Also: `diff /Users/axelfaes/workspace/ordo/docs/academic-coverage.md docs/academic-coverage.md` prints `15c15`, `120,127c120,127`, `131c131` and `140c140`, all inside the round's paths; `LC_ALL=C grep -n '[^ -~]'` over the coverage doc, `12-rows.md` and this report prints nothing; `grep -c '| rebuild later: ' docs/academic-coverage.md` still prints 18.

## Result table

| Item | State | Command and output |
|---|---|---|
| 1. Every file read, every row checked | DONE | `find /Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer -type f \| sort \| xargs wc -l`: 26 files, 5707 lines, each read whole; case 2 lines-read mismatches `[]` |
| 2. Each defective row fixed in place; finding 10 checked | DONE | 10 rows fixed, marks unchanged (case 3 `marks identical: True`); finding 10 holds and is fixed |
| 3. Shortening never loses a destination | DONE | case 5 above |
| 4. The records, 26, in section order | DONE | record count 26; case 2 `order matches section: True` |
| Only the round's paths written | DONE | the diff above; ledger files written: `12-rows.md` and this report |

Files changed: `docs/academic-coverage.md` (line 15 and lines 120-127, 131, 140), `12-rows.md` (32 lines), this report.

## Rows changed

Every mark is unchanged; each fix is to the reason.

| Row | Mark | Disposition now |
|---|---|---|
| `SKILL.md` | rebuild: paper-review | Coaching to `rebuttal` (entry 7); guided mode, calibration mode and the hard gate's pre-commitment rule to `paper-review` at entry 15.A with their three `rebuild later` files; the rest of the gate, the pipeline sections, Version Info with the version list and changelog pointer, Related Skills and the spectrum labels dropped, each with its reason. |
| `agents/field_analyst_agent.md` | rebuild: paper-review | Finding 10: "names no ML conference" (the journal file's 46-47 list JMLR and IEEE TPAMI). |
| `agents/eic_agent.md`, `agents/methodology_reviewer_agent.md`, `agents/domain_reviewer_agent.md`, `agents/perspective_reviewer_agent.md` | rebuild: paper-review | Pre-commitment rule to `paper-review` at entry 15.A with `references/sprint_contract_protocol.md`; contract-driven decision dropped; phase folders dropped for `researcher` (entry 13); the integrity script not installed. Methodology also drops its APA item with the statistical file's APA formats. |
| `agents/devils_advocate_reviewer_agent.md` | rebuild: paper-review | As the four above, and the cross-model option to `paper-review` at entry 15.A with `references/calibration_mode_protocol.md`. |
| `agents/editorial_synthesizer_agent.md` | rebuild: paper-review | Sprint arithmetic dropped (it would replace arbitration by evidence); guided-mode issue list to `paper-review` at entry 15.A with `references/guided_mode_protocol.md`; phase folders and script as above. |
| `references/calibration_mode_protocol.md` | rebuild later: paper-review | Names its cross-model default, carried with the file, and the devil's advocate's cross-model option with it. |
| `references/sprint_contract_protocol.md` | rebuild later: paper-review | `paper-review` at entry 15.A carries the pre-commitment rule; the JSON contract, lint, contract-driven decision and panel arithmetic dropped (schema and validator not installed; the synthesis settles disputes by evidence). |

Mark definitions: line 15 now also says a part of a `rebuild: <skill>` file that the first gate does not need may go to entry 15.A, named with the `rebuild later: <skill>` file of the same skill that carries it.

"Not installed" rests on `find` in `/Users/axelfaes/workspace/research-hub` for `shared/cross_model_verification.md`, `shared/sprint_contract.schema.json`, `shared/contracts`, `scripts/check_sprint_contract.py` and `scripts/check_pipeline_integrity.py`, which printed no path for any of them.

## Judgment calls the brief left open

- A `rebuild` row's mark carries every part of the file its reason does not exclude, so a row is defective when a part cannot go with the mark and the reason does not send it elsewhere.
- A part sent to another skill named by skill (`rebuttal` in the re-review row) holds without an entry number; the "skill and entry" requirement applies to deferrals.
- Ruling 6's sentence is appended to the `rebuild later` bullet rather than added as a new bullet, so it is not read as a fourth mark and no line number of the file moves.

## Anything in the brief that was wrong

Nothing.
