Everything in the brief is done, including the change to item 3 sent by the orchestrator after the ruling on open item L.

## Open items of the state file, verbatim (worktree copy)

- L (step 11, raised 2026-09-25): the coverage row of `academic-paper/agents/intake_agent.md` drops style calibration with no reason (audit `4-coverage-and-roadmap.md`, finding 11). Intake Step 10 learns the author's voice from three or more of the author's past papers, as a soft guide under the discipline's conventions. Whether the paper skill does this is a capability of the skill you will use, which no rule of the coverage list decides. Options: (a) the paper skill (entry 5) learns the voice from past papers, subordinate to the prose standard; the row names it. Pro: nothing of the source is lost, and a series of ML papers keeps one voice. Con: entry 5 grows, and a voice learned from older papers can carry what the prose standard forbids. (b) drop, with the reason that the writing skill's prose standard sets the voice. Pro: one source of style, the written standard. Con: the voice of your past papers is not learned; this is also the option that costs least. (c) `rebuild later: paper`, built after entry 5's gate. Pro: nothing lost, entry 5 unchanged. Con: the row's other content is `rebuild: paper`, so the clause needs its own row or a split mark the list does not have. Recommendation: (a), because the prose standard stays the rule and past papers only tune what it leaves open (terms, section habits), so nothing is lost and nothing the standard forbids comes in.

The orchestrator relayed the user's ruling (a). The intake row now follows it.

## Result table

| Item | State | Evidence |
|---|---|---|
| 1. Every file read, every row checked | DONE | 61 files read whole, lines `1-<n>` from `wc -l` recorded per file in `11-rows.md` |
| 2. Each defective row fixed in place | DONE | 12 rows changed; the comparison against the copy of main's section prints `changed 12 fixed 12 changed==fixed True markchg_subset True` |
| 3. Intake row, style calibration | DONE | Ruling (a) applied: the reason names style calibration taken by the paper skill at entry 5, subordinate to the prose standard; record verdict `fixed`, with Step 10 at lines 203-221 |
| 4. The records | DONE | `grep -cE '^\| [0-9]+ \|' agents/reviews/11-rows.md` prints `61`; duplicate names 0; `reserved` verdicts 0 |
| Case: coverage check before and after | DONE | before the first edit and after the last: `ok: docs/academic-coverage.md`, exit 0 |
| Case: 61 records, each file once | DONE | 61 records, `uniq -d` over the names prints nothing |
| Case: changed rows equal fixed records | DONE | the 12 rows that differ from main's copy are exactly the 12 `fixed` records; the 3 mark changes are among them |
| ASCII, one line per cell | DONE | `LC_ALL=C grep -c '[^ -~]'` prints 0 for the section and for `11-rows.md`; the section still has 66 lines |
| Verify runner | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: 10 `PASS:` lines, 10 `ok:` lines, `verify: 12 commands passed`, exit 0 |

## Rows changed

| Row | Before | After | Why |
|---|---|---|---|
| `SKILL.md` | rebuild: paper | rebuild: paper | The mandatory statements (lines 443-447) now go to the final check; the lit-review and plan modes are placed |
| `agents/abstract_bilingual_agent.md` | rebuild later: paper | rebuild: paper | Every drafted paper has an abstract, and entry 5's goal names drafting (finding 13) |
| `agents/argument_builder_agent.md` | rebuild: paper | rebuild: paper | The plan-mode part (lines 142-249) and the discipline patterns (94-103) had no destination |
| `agents/formatter_agent.md` | rebuild later: paper | rebuild later: paper | The pre-output checklist goes to entry 5's final check; cover letter, blind review and version-family scan are placed (finding 7) |
| `agents/intake_agent.md` | rebuild: paper | rebuild: paper | Ruling (a) on open item L: style calibration (lines 203-221) is taken at entry 5 |
| `references/abstract_writing_guide.md` | rebuild later: paper | rebuild: paper | Same reason as the abstract agent (finding 13) |
| `references/academic_writing_style.md` | rebuild: writing | rebuild: writing | The file has six discipline registers (lines 29-75), not four |
| `references/funding_statement_guide.md` | rebuild: paper | rebuild: paper | The publisher placement table (lines 245-267) now goes to entry 13's `venues/` files |
| `references/journal_submission_guide.md` | rebuild: submit-manuscript | rebuild: submit-manuscript | The CRediT table (144-161) and the AI templates (186-203) now go to the paper skill's statements |
| `references/mode_selection_guide.md` | rebuild: paper | rebuild: paper | The plan-to-draft gate (lines 317-341) now joins the later planning dialogue |
| `references/vlm_figure_verification.md` | rebuild: paper | rebuild: paper | The vision check was deferred on a `rebuild` row; it is now taken at entry 5 (finding 6) |
| `templates/imrad_template.md` | rebuild later: paper | drop | It repeats Pattern 1 of `references/paper_structure_patterns.md` (finding 8) |

## Findings 6, 7, 8 and 13

- Finding 6 holds, and the row is fixed. `vlm_figure_verification.md` line 21 makes the vision check required at the final check. Its checklist and loop are at lines 26-64. The reason now has the paper skill's figures page take the check at entry 5, together with the trace, and defers nothing.
- Finding 7 holds, and the row is fixed. The mark stays `rebuild later: paper`, because conversion is most of the file. The pre-output checklist (lines 309-338 and 790-826) goes to entry 5's final check.
- Finding 8 holds, and the row is fixed. The template's skeleton (lines 31-165) is Pattern 1 of `paper_structure_patterns.md` (lines 13-52). The row is now `drop`, pointing to that file.
- Finding 13, abstract half: holds, and both rows are fixed. Both are now `rebuild: paper`.
- Finding 13, ethics half: not handled in this step. The `ethics_review_agent.md` and `ethics_checklist.md` rows are deep-research rows, at `docs/academic-coverage.md` lines 190 and 218. They are outside this step's paths (lines 50-115), so they belong to the deep-research step.

## Wrong in the brief

- The brief says the prose standard has a named exception that allows about 35 words in a coverage reason cell. `grep -rn "35 words" skills docs README.md` prints nothing. The exception exists only as ruling 2e in `plan.md`, which says it is to be written into the prose standard. It has not been written there yet.
- Old reasons are over the length limit. On main's copy of the section, 50 of 61 reason cells are over 35 words; now 46 are. The 12 fixed cells are 32 to 44 words long, and the intake cell is the longest. The 38 over-length cells that are still there are rows this step checked and found correct in substance. Shortening them affects every section of the list, not just this one, so it was not done here.
- The brief lists the `ethics_checklist` and `ethics_review_agent` rows as academic-paper rows. They are deep-research rows (line numbers above).
- `docs/roadmap.md` line 120 (entry 15.A) says "11 for paper". After these changes, `grep -c '| rebuild later: paper |' docs/academic-coverage.md` prints 8, so line 120 is now stale. That file is outside this step's paths, so it was not changed.

One read-only `git diff --stat` was run in the worktree, against the brief's rule that no git command is run. It changed nothing.
