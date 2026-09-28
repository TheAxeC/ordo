Everything in the brief and in the round 1 rulings is done.

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

## Repair round 1

| Ruling | State | Command that proves it |
|---|---|---|
| 1. Row 155: one disposition for the constraint and drift checks, agreeing with row 58 | DONE | `sed -n '155p' docs/academic-coverage.md` shows "Its negative-constraint and drift checks are dropped, since both read the claim intent manifest that academic-paper's `agents/draft_writer_agent.md` emits, which has no successor." `sed -n '58p' docs/academic-coverage.md` still says that file's "claim manifests ... have no successor". The diff against the main checkout lists no line outside 147-181 (`151,153c151,153`, `155c155`, `171c171`) |
| 2. Row 152: `slr_lineage`, the Style Profile and the experiment-provenance carry-forward each get a disposition | DONE | `sed -n '152p' docs/academic-coverage.md` gives the three dispositions. `slr_lineage` ends because its only reader, the PRISMA-trAIce anchor (academic-paper's `references/policy_anchor_disclosure_protocol.md` line 55), is rendered by no skill (row 95). The Style Profile goes to `paper` at entry 5 with academic-paper's `agents/intake_agent.md` (row 60). The carry-forward ends because `paper` runs and blocks on the alignment check in `agents/integrity_verification_agent.md` |
| 3. Row 151: the up-front token-cost estimate apart from the round-trip caps | DONE | `sed -n '151p' docs/academic-coverage.md` shows "The up-front token-cost estimate goes to the researcher, which states it before a run and waits for the user to confirm it." It is followed by a separate sentence for the round-trip caps and counts |
| 4. Build obligations per changed row | DONE | The "Rows changed" table below has a column for what each later entry must build |
| 5. Lines deciding the eight rows the reviewer did not read | DONE | The section "The eight holds rows the reviewer did not read" below; the same lines are in `13-rows.md` |

The five cases and the verify list were run again after the round; their output is quoted under "Cases" and "Result table".

## Cases

The five cases are checks in `.agents/step13/cases.py`, in the worktree's git-ignored `.agents/` folder. They run against `docs/academic-coverage.md` and against the copy of lines 147-181 taken before the first edit, `.agents/step13/base-section.md`. A `diff` of that copy against lines 147-181 of the main checkout printed nothing.

The first run, on the unchanged list before any row changed, exited 1:

```text
case 1 coverage check: exit 0, ok: docs/academic-coverage.md
case 2 records: 0 data rows, 30 files listed by find, duplicates [], missing 30, extra [], order matches section: False
case 3 changed rows: 0 changed []; mismatches: none
case 4 largest sentence: 35 words in agents/pipeline_orchestrator_agent.md; sentences over 35: none
case 5: no changed row
```

Case 2 was red because `13-rows.md` did not exist yet. No case showed a rule of the brief giving a wrong result. A run after the rows were edited and before the records existed showed case 3 red (`SKILL.md changed but record says None`, and the same for the other four rows).

The run after repair round 1, in full:

```text
case 1 coverage check: exit 0, ok: docs/academic-coverage.md
case 2 records: 30 data rows, 30 files listed by find, duplicates [], missing 0, extra [], order matches section: True
case 3 changed rows: 5 changed ['SKILL.md', 'agents/pipeline_orchestrator_agent.md', 'agents/state_tracker_agent.md', 'agents/claim_ref_alignment_audit_agent.md', 'references/pipeline_state_machine.md']; mismatches: none
case 4 largest sentence: 35 words in references/ai_research_failure_modes.md; sentences over 35: none
case 5 SKILL.md: before ['file:paper', 'file:paper-review', 'skill:paper', 'skill:paper-review', 'skill:researcher', 'skill:writing']; after ['entry:15.A', 'file:agents/collaboration_depth_agent.md', 'file:agents/formatter_agent.md', 'file:paper', 'file:paper-review', 'file:rebuttal', 'file:references/ai_research_failure_modes.md', 'file:references/mode_advisor.md', 'file:references/passport_as_reset_boundary.md', 'file:references/process_summary_protocol.md', 'file:references/reinforcement_content.md', 'file:repair_rounds', 'skill:paper', 'skill:paper-review', 'skill:rebuttal', 'skill:researcher', 'skill:writing']; lost none
case 5 agents/pipeline_orchestrator_agent.md: before ['file:paper', 'file:rebuttal', 'file:submit-manuscript', 'skill:paper', 'skill:rebuttal', 'skill:researcher', 'skill:submit-manuscript']; after ['entry:5', 'file:.bib', 'file:/refute', 'file:SKILL.md', 'file:\\cite', 'file:agents/collaboration_depth_agent.md', 'file:agents/intake_agent.md', 'file:agents/integrity_verification_agent.md', 'file:paper', 'file:rebuttal', 'file:references/passport_as_reset_boundary.md', 'file:references/policy_anchor_disclosure_protocol.md', 'file:slr_lineage', 'file:submit-manuscript', 'skill:paper', 'skill:rebuttal', 'skill:researcher', 'skill:submit-manuscript']; lost none
case 5 agents/state_tracker_agent.md: before ['skill:researcher']; after ['file:agents/collaboration_depth_agent.md', 'file:references/progress_dashboard_template.md', 'file:references/team_collaboration_protocol.md', 'skill:researcher']; lost none
case 5 agents/claim_ref_alignment_audit_agent.md: before []; after ['entry:15.A', 'file:.bib', 'file:.tex', 'file:agents/draft_writer_agent.md', 'file:rebuild later: paper', 'file:references/claim_audit_calibration_protocol.md', 'skill:paper']; lost none
case 5 references/pipeline_state_machine.md: before ['entry:13']; after ['entry:13', 'file:references/passport_as_reset_boundary.md']; lost none
cases exit 0
```

Case 5 matches a skill name as a word, so `writing` in "research, writing" counts for `SKILL.md` both before and after. It treats every backticked token as a destination, so `slr_lineage` and `repair_rounds` appear as files.

## Result table

| Item | State | Command and its output |
|---|---|---|
| 1. Every file read, every row checked | DONE | All 30 files read in full, with line counts from `wc -l` in the records. `find /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline -type f \| wc -l` prints `30` |
| 2. Each defective row fixed in place | DONE | 5 rows fixed, 25 hold. `diff <(cat /Users/axelfaes/workspace/ordo/docs/academic-coverage.md) docs/academic-coverage.md \| grep '^[0-9]'` prints `151,153c151,153`, `155c155` and `171c171`. `wc -l docs/academic-coverage.md` prints 237 |
| 3. Shortening never loses a destination | DONE | No reason was shortened. Case 5 prints `lost none` for each changed row |
| 4. The 15.A deferrals | DONE | The claim audit's calibration mode names `references/claim_audit_calibration_protocol.md` (`rebuild later: paper`). `SKILL.md`'s finalisation names academic-paper's `agents/formatter_agent.md` (`rebuild later: paper`, line 59). `sed -n '147,181p' docs/academic-coverage.md \| grep -c 'can come later'` prints `0` |
| 5. The records | DONE | `13-rows.md` holds 30 records in section order |
| Cases 1-5 | DONE | Quoted above, exit 0 |
| Verify 1, the plan's verify list | DONE | Quoted below, exit 0 |
| Verify 2, the coverage check | DONE | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok: docs/academic-coverage.md`, exit 0 |
| Verify 3, the record count | DONE | The first command in the block below prints `30` |
| Verify 4, the largest sentence word count | DONE | The second command in the block below prints `35` |

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 13 commands passed
```

Verify 3 and 4, as they run from the worktree root:

```sh
grep -c '^| `' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-rows.md
awk 'NR>=147 && NR<=181 && /^\| `/' docs/academic-coverage.md | python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin for s in re.split(r"(?<=[.!?])\s+(?=[A-Z`\"(])", l.split(" | ",2)[2].rstrip(" |\n"))))'
```

What the checks do not cover:
- Case 5 compares names and paths, not meaning.
- Case 4 splits sentences at a full stop followed by a capital, a backtick, a quote or a parenthesis.
- Whether each reason is true of its file rests on the line numbers in `13-rows.md`.

## Rows changed

| Row | Mark before and after | Why | What the new reason asks later entries to build |
|---|---|---|---|
| `SKILL.md` | rebuild: researcher, unchanged | The process summary, budget display and observer were dropped with "nobody" and no reason. Eight parts had no destination. The token-cost estimate of line 401 now has its own destination | Entry 13 (researcher): stage order, entry, the checkpoint system with its self-check questions, the error-recovery table, and a token-cost estimate the user confirms before a run. Entry 5 (paper): the optional parallel drafting and the failure-mode checklist. Entry 6 (paper-review): the early stop. Entry 7 (rebuttal): the rule that every reviewer concern is accounted for. Entry 15.A: finalisation, built with academic-paper's `agents/formatter_agent.md` |
| `agents/pipeline_orchestrator_agent.md` | rebuild: researcher, unchanged | Four parts ended with no reason: the finalizer, the passport hashing, the audit-artifact gate and the observer. Three parts had no fate: `slr_lineage`, the Style Profile and the experiment-provenance carry-forward | Entry 13 (researcher): the stage loop, checkpoint rules, fallback matrix, mode-switch table, mid-entry check, and dispatch of only each stage's declared inputs. Entry 5 (paper): patch sequencing, the claim-audit gate, and the Style Profile with academic-paper's `agents/intake_agent.md`. Entry 7 (rebuttal): the coaching. Entry 14 (submit-manuscript): the package gate |
| `agents/state_tracker_agent.md` | rebuild: researcher, unchanged | "Adopts only" left the dashboard, observer history and team fields with no destination | Entry 13 (researcher): the prerequisite table and the closing audit trail. Nothing new for other entries; the three parts end with files whose rows drop them |
| `agents/claim_ref_alignment_audit_agent.md` | rebuild: paper, unchanged | The constraint and drift checks read a manifest that row 58 gives no successor, so they are now dropped with that reason. The calibration mode now goes to 15.A. The passport and cache drop now has a reason | Entry 5 (paper): the sub-claim audit against retrieved source text, the paywall and outage split, and the uncited-assertion flag with the own-run exemption. Entry 15.A (paper): the calibration mode, with `references/claim_audit_calibration_protocol.md` |
| `references/pipeline_state_machine.md` | rebuild: researcher, unchanged | "Have no equivalent" gave neither a destination nor a reason | Entry 13 (researcher): the order and prerequisites as roadmap-template dependencies, as before. The reset transitions end with `references/passport_as_reset_boundary.md` |

## The eight holds rows the reviewer did not read

- **`agents/collaboration_depth_agent.md`** (1-164). The drop holds because the observer scores the user, not the research.
  - Lines 21-38 say it scores the user's collaboration against the rubric: delegation, vigilance, reallocation and zone.
  - Lines 139-155 say it verifies nothing about the paper and describes the collaboration pattern.
- **`examples/full_pipeline_example.md`** (1-478). The drop holds because the run breaks the rules of `SKILL.md`.
  - Lines 37, 197 and 232 show a four-reviewer panel.
  - Lines 181-203 go from Stage 2 straight to Stage 3.
  - Lines 361-371 go from Stage 3' straight to Stage 5, with no Stage 2.5 or 4.5.
  - `SKILL.md` lines 365-367 and 457 forbid skipping those checks.
- **`examples/integrity_failure_recovery.md`** (1-389). The rebuild for `paper` holds.
  - Lines 198-210 replace the fabricated reference and rewrite both citing sentences.
  - Line 218 corrects a number with its page and table.
  - Lines 279-301 recheck only the corrected items.
  - The first two rules are missing from the integrity agent, as the reason says.
- **`examples/mid_entry_example.md`** (1-402). The drop holds.
  - Lines 26-45 and 54-58 enter at Stage 3 with no integrity check.
  - Lines 69-402 run a quick review, one revision, a full re-review and LaTeX output.
  - Mid-entry is stated in `SKILL.md` lines 356-367 and in the orchestrator's lines 38-41 and 643-684.
- **`references/adapters/overview.md`** (1-151). The drop holds.
  - Lines 9-16 define the programs that turn a reference library into the passport's corpus file.
  - Lines 80-121 give the rejection log, determinism and provenance rules for those programs, which serve only that conversion.
- **`references/plagiarism_detection_protocol.md`** (1-239). The rebuild for `paper` holds, with a split to `writing`.
  - Lines 15-99 (the D1 grades and the D2 self-plagiarism check) go to `paper`.
  - Lines 103-126 (the six AI-writing indicators, which alert without deciding) go to `writing`.
- **`references/team_collaboration_protocol.md`** (1-261). The drop holds.
  - Lines 9-250 give roles, handoffs, git branches and tags, conflict authority and templates for a team.
  - Lines 254-261 say it is a human coordination layer around single-user sessions.
- **`templates/pipeline_status_template.md`** (1-146). The drop holds because the file is the rendered status box of the dropped dashboard.
  - Lines 1-56 are the status box.
  - Lines 60-136 define its fields.
  - Lines 140-146 are the one-line progress bar.

## Files written

- `docs/academic-coverage.md`: lines 151, 152, 153, 155 and 171 replaced; 237 lines before and after.
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-rows.md`: 30 records.
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/13-report.md`: this report.
- The checks are in `.agents/step13/`, which `.gitignore` ignores (`.agents/*`), so they are outside the step's paths.
  - `apply.py` rewrites the five cells and re-parses the file.
  - `cases.py` runs the five cases.
  - `base-section.md` is the copy of lines 147-181 taken before the first edit.

## Judgment calls the brief left open

- **The standard for "every part sent somewhere":**
  - A row whose mark takes the whole file holds when a small part is not named on its own, such as a report table or a pointer to a file with its own row.
  - A row that says "only", or lists what it takes, is defective when a part left out has no destination or reason.
- **Ruling 1:** I took the drop, not a new input for `paper`.
  - The manifest is emitted by academic-paper's `agents/draft_writer_agent.md` lines 540-575 before drafting, and nothing else produces the declared constraints or the intended claims.
  - Row 58 gives the manifest no successor, and no row outside 147-181 may change.
- **Ruling 3:** the token-cost estimate goes to the researcher, the skill that runs a range of stages and so has a run to estimate before it starts.
- **`.gitkeep`:** it has 0 lines, so its lines-read cell says `0 lines (empty file)`.

## Anything in the brief that was wrong

Nothing. The brief's counts all matched:
- `find ... -type f | wc -l` printed 30.
- The coverage check printed `ok: docs/academic-coverage.md`.
- The marks counted from the section before the edit: drop 15, rebuild: researcher 5, rebuild: paper 6, rebuild later: paper 1, rebuild: literature 1, rebuild: paper-review 1, rebuild: rebuttal 1.
