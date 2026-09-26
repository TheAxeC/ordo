Everything in the brief is done.

## Open items of the state file, verbatim

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
- Open item N (step 7, the shell launch of its builder): the builder was launched through `templates/launch.sh` with the launch note, and the note record was written (`~/.oculus/dispatches.json` holds id 502d4c9d-3b6a-4316-8628-f519325eee87, label `2.B/7`, parent this session, the transcript path). It ran with `CLAUDE_CONFIG_DIR` unset, which by `tools/oculus/README.md:36` puts a `claude` process on the first account, not the account this session runs on (`~/.claude-work`). It was stopped with TERM before it changed any file (`exit 143` in the exit file; `git status --short` in the worktree prints nothing). A relaunch with `CLAUDE_CONFIG_DIR` kept was refused by the permission classifier, so the builder is not running. Two things are yours:
  - Which account the shell-launched builder runs on.
    - (a) This session's account: relaunch with `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` kept, which needs your permission for that launch (a Bash permission rule, or you run the launch command yourself with `!`). Pro: the builder is billed and configured like every other agent of this plan. Con: one permission to grant.
    - (b) The first account: relaunch with `CLAUDE_CONFIG_DIR` unset, as the first launch did. Pro: no permission change. Con: the step runs on another account than the plan's other agents.
    - Recommendation: (a). The plan's agents all run on one account, and the account is a choice only you can make; (b) is the cheaper option to carry out, and cost is not a reason.
  - The check that the builder's row appears under this session in oculus's Agents view needs oculus running; nothing listens on its port (`lsof -iTCP -sTCP:LISTEN` shows no node process), and research-hub is read only for this plan, so the orchestrator does not start it. (a) You start oculus (`npm run dev` in `tools/oculus`) before the relaunch, and the orchestrator checks the view in the browser. (b) The check is made on the note record alone. Recommendation: (a); the ruling E run exists to see the row in the view.
  - To rule: `Ruled: N: account (a) or (b); oculus (a) or (b)`.

## Cases, first run on the unchanged list

The five cases are checks in `.agents/step13/cases.py` (the worktree's git-ignored `.agents/` folder), run against `docs/academic-coverage.md` and a copy of lines 147-181 taken before the first edit (`.agents/step13/base-section.md`; `diff` against lines 147-181 of the main checkout's copy printed nothing). First run, before any row changed, exit 1:

```text
case 1 coverage check: exit 0, ok: docs/academic-coverage.md
case 2 records: 0 data rows, 30 files listed by find, duplicates [], missing 30, extra [], order matches section: False
case 3 changed rows: 0 changed []; mismatches: none
case 4 largest sentence: 35 words in agents/pipeline_orchestrator_agent.md; sentences over 35: none
case 5: no changed row
```

Case 2 is red on the first run because `13-rows.md` did not exist yet. No case showed a rule of the brief giving a wrong result, so no stop was raised. The run after the rows were edited and before the records were written shows case 3 red (`SKILL.md changed but record says None`, and the same for the other four changed rows), so the check reports a changed row that has no `fixed` record. Final run, exit 0:

```text
case 1 coverage check: exit 0, ok: docs/academic-coverage.md
case 2 records: 30 data rows, 30 files listed by find, duplicates [], missing 0, extra [], order matches section: True
case 3 changed rows: 5 changed ['SKILL.md', 'agents/pipeline_orchestrator_agent.md', 'agents/state_tracker_agent.md', 'agents/claim_ref_alignment_audit_agent.md', 'references/pipeline_state_machine.md']; mismatches: none
case 4 largest sentence: 35 words in references/ai_research_failure_modes.md; sentences over 35: none
case 5 <each changed row>: ... lost none
```

Case 5 lists, per changed row, the destinations before and after: every skill name, every `entry <n>` and every backticked token. It matches a skill name as a word, so `writing` in "research, writing" counts for `SKILL.md` both before and after. It prints `lost none` for all five rows; the per-row destinations are in `13-rows.md`.

## Result table

| Item | State | Command and its output |
|---|---|---|
| 1. Every file read, every row checked | DONE | All 30 files read in full, lengths from `wc -l` in the records (`references/adapters/.gitkeep` is empty). `find /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline -type f \| wc -l` prints `30` |
| 2. Each defective row fixed in place | DONE | 5 rows fixed, 25 hold. `diff <(cat /Users/axelfaes/workspace/ordo/docs/academic-coverage.md) docs/academic-coverage.md \| grep '^[0-9]'` prints `151,153c151,153`, `155c155`, `171c171`, all inside lines 147-181; `wc -l` prints 237 for both files |
| 3. Shortening never loses a destination | DONE | No reason was shortened; case 5 prints `lost none` for each of the 5 changed rows |
| 4. The 15.A deferrals | DONE | The two parts sent to entry 15.A name the skill and a `rebuild later` file of that skill: the claim audit's calibration mode with `references/claim_audit_calibration_protocol.md` (`rebuild later: paper`), and `SKILL.md`'s finalisation with academic-paper's `agents/formatter_agent.md` (`rebuild later: paper`, coverage line 59). `sed -n '147,181p' docs/academic-coverage.md \| grep -c 'can come later'` prints `0` |
| 5. The records | DONE | `13-rows.md`, 30 records in section order (case 2: `order matches section: True`) |
| Case 1, coverage check before and after | DONE | `ok: docs/academic-coverage.md`, exit 0, on the first and the final run |
| Case 2, record count and names | DONE | 30 data rows, 30 files, no duplicate, none missing, none extra |
| Case 3, changed rows against `fixed` records | DONE | 5 changed, 5 `fixed`, mismatches none |
| Case 4, largest sentence | DONE | 35 before, 35 after, none over 35 |
| Case 5, destinations before and after | DONE | `lost none` for all 5 changed rows |
| Verify 1, the plan's verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` printed eleven `PASS:` lines (land.sh and usage.py, check_config.py, collect_findings.py, sync_rules.py, launch.sh, check_paths.py, pin.sh, verify.sh under sh dash, check_skill_layout.py, check_rule_inventory.py, check_coverage.py), ten `ok: skills/<name>/SKILL.md` lines and `verify: 13 commands passed`, exit 0 |
| Verify 2, the coverage check | DONE | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok: docs/academic-coverage.md`, exit 0 |
| Verify 3, the record count | DONE | the command in the block below prints `30` |
| Verify 4, the largest sentence word count | DONE | the command in the block below prints `35` |

Verify 3 and 4, as they run from the worktree root:

```sh
grep -c '^| `' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-rows.md
awk 'NR>=147 && NR<=181 && /^\| `/' docs/academic-coverage.md | python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin for s in re.split(r"(?<=[.!?])\s+(?=[A-Z`\"(])", l.split(" | ",2)[2].rstrip(" |\n"))))'
```

What the checks do not cover: case 5 compares names and paths, not meaning, and case 4 splits sentences at a full stop followed by a capital, a backtick, a quote or a parenthesis. Whether each reason is true of its file rests on the line numbers in `13-rows.md`, checked by reading the file.

## Rows changed

| Row | Mark before | Mark after | Why |
|---|---|---|---|
| `SKILL.md` | rebuild: researcher | rebuild: researcher | The process summary, budget display and observer were dropped with "nobody" and no reason. Eight other parts had no destination: the failure-mode checklist, conversion, mode recommendation, Mode B resume, stage reminders, parallel drafting, error-recovery table and reviewer-concern rule. Each now has a destination or a reason. |
| `agents/pipeline_orchestrator_agent.md` | rebuild: researcher | rebuild: researcher | The citation finalizer, passport hashing, audit-artifact gate and observer dispatch "end with it" with no reason; each now has one that holds on its lines. |
| `agents/state_tracker_agent.md` | rebuild: researcher | rebuild: researcher | "Adopts only" left the dashboard, observer history and team fields with no destination; a third sentence names the files whose rows drop them. |
| `agents/claim_ref_alignment_audit_agent.md` | rebuild: paper | rebuild: paper | The constraint and drift checks were not named. The calibration mode now goes to entry 15.A with `references/claim_audit_calibration_protocol.md`, and the passport, cache and versioning drop has a reason. |
| `references/pipeline_state_machine.md` | rebuild: researcher | rebuild: researcher | "Have no equivalent" gave neither a destination nor a reason; the reset transitions now end with `references/passport_as_reset_boundary.md`. |

## Files written

- `docs/academic-coverage.md`: lines 151, 152, 153, 155 and 171 replaced; 237 lines before and after.
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-rows.md`: new, 36 lines.
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-report.md`: this report.
- The case checks, the row rewrite and the base copy are in `.agents/step13/` of the worktree. `.gitignore` ignores `.agents/*`, so the folder is outside the step's paths. `.agents/step13/apply.py` rewrote the five cells, re-parsed the file and would have exited non-zero on a cell that differed from what it wrote.

## Judgment calls the brief left open

- The standard for "every part sent somewhere". A row whose mark takes the whole file holds when a small part (a report table, a pointer to a file with its own row) is not named on its own. A row that says "only", or lists what it takes, is defective when a part left out has no destination or reason. Under this standard 25 rows hold, among them `references/ai_research_failure_modes.md`, `references/score_trajectory_protocol.md` and `references/integrity_review_protocol.md`.
- `SKILL.md`'s finalisation goes to `paper` at entry 15.A with academic-paper's `agents/formatter_agent.md`, since that row already marks conversion `rebuild later: paper`.
- The budget display's drop reason names the usage row the land skill books (`skills/land/SKILL.md` line 66) and `repair_rounds` (`skills/plan/SKILL.md` line 52, `skills/plan-orchestration/SKILL.md` line 272).
- `.gitkeep` has 0 lines, so its lines-read cell says `0 lines (empty file)` in place of `1-0`.

## Anything in the brief that was wrong

Nothing. `find ... -type f | wc -l` printed 30, the coverage check printed `ok: docs/academic-coverage.md`, and counting the third column of the section before the edit (`awk -F'|'` over `.agents/step13/base-section.md`) printed drop 15, rebuild: researcher 5, rebuild: paper 6, rebuild later: paper 1, rebuild: literature 1, rebuild: paper-review 1 and rebuild: rebuttal 1, as the brief says.
