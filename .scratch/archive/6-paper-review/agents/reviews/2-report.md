# Report: step 2, paper-review's SKILL.md and the places that list the skills

Everything in the brief is done. Three points are reported for the orchestrator under "Anything in the brief that was wrong or impossible": the word "reviewer" in the sentences the brief dictates against the glossary rule, a figure label outside this step's paths that still calls `paper-review` unbuilt, and the contracts standing in a reference section against the layout's rule.

## Open items of the state file

Read with `awk '/^## Open items/,/^## Closed/' .scratch/6-paper-review/orchestrator-state.md`:

```
- none
```

## The cases' first run, on the unchanged tree

`<source>` is `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer/SKILL.md`. No case showed a rule of the brief giving a wrong result.

1. Every `##` and `###` heading of the source. `grep -n '^##' <source>` printed 32 headings, from `28:## Quick Start` to `428:## Changelog`, the 23 `##` headings the brief lists and 9 `###` headings (Trigger Keywords, Non-Trigger Scenarios, Quick Mode Selection Guide, Checkpoint Rules, Mode Selection Logic, Devil's Advocate Report Structure (Special Format), Upstream/Downstream Relationships, Specific Integration Methods, Pipeline Usage Example). `ls skills/academic/paper-review` printed `ls: skills/academic/paper-review: No such file or directory`, so no heading had a place yet.
2. Anti-Patterns 7 rows, Quality Standards 9. `awk '/^## Anti-Patterns/,/^## Quality/' <source> | grep -c '^| [0-9]'` printed `7`. `awk '/^## Quality Standards/,/^## Output/' <source> | grep '^|' | tail -n +3 | wc -l` printed `9`. The new file did not exist.
3. Checkpoint Rules 7 rules. `awk '/^### Checkpoint Rules/,/^---/' <source> | grep -c '^[0-9]\.'` printed `7`. The new file did not exist.
4. The Devil's Advocate's 8 bullets. `sed -n 129,137p <source> | grep -c '^         - '` printed `8`. The new file did not exist.
5. The contracts' ids. The command of the case ended with `FileNotFoundError: [Errno 2] No such file or directory: 'skills/academic/paper-review/SKILL.md'`.
6. The frontmatter. The command of the case ended with `FileNotFoundError: [Errno 2] No such file or directory: 'skills/academic/paper-review/SKILL.md'`.
7. The `##` headings in order. `grep -n '^## ' skills/academic/paper-review/SKILL.md` printed `ugrep: warning: skills/academic/paper-review/SKILL.md: No such file or directory`.
8. `grep -c 'sixteen' README.md` printed `2`, and `grep -c 'seventeen' README.md` printed `0`.
9. The contracts equal to the two files. The command of the case ended with `FileNotFoundError: [Errno 2] No such file or directory: 'skills/academic/paper-review/SKILL.md'`.
10. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22040 bytes)` and exited 0, and `git status --short docs/figures/academic-pipeline` printed nothing.
11. `python3 docs/figures/gen_figures.py` exited 0 and wrote the existing figures. `ls docs/figures/paper-review.svg` printed `ls: docs/figures/paper-review.svg: No such file or directory`, and `git status --short docs/figures` printed nothing.

## DONE / NOT DONE

| # | Item | State | Command | Output as printed |
|---|---|---|---|---|
| 1 | Character-set check over the step's files | DONE | the command of "Verify before you report" 1 | no line printed; exit status 0 |
| 2 | Plan-terms block | DONE | `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template` |
| 3 | pin test | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 \| tail -1` | `PASS: pin.sh scratch tests` |
| 4a | Case 1, every source heading placed | DONE | by reading; "The map of the source" below | only Version Info, Changelog, the v1.1 Improvements list and the routing note are left out whole |
| 4b | Case 2, 7 and 9 rows | DONE | `awk '/^## Anti-patterns/,/^## Rules/' skills/academic/paper-review/SKILL.md \| grep -c '^\| \*\*'` and `awk '/^## Quality standards/,/^## Stops/' skills/academic/paper-review/SKILL.md \| grep '^\|' \| tail -n +3 \| wc -l` | `7` and `9` |
| 4c | Case 3, the 7 Checkpoint Rules once each | DONE | by reading | rule 1 in full item 2, rule 5 in full item 5, rules 2, 3, 4, 6 and 7 as the first five bullets of Rules |
| 4d | Case 4, the Devil's Advocate's 8 bullets | DONE | by reading full item 3, last sub-item | the 8 bullets, "Core argument challenges (strongest counter-arguments)" to "\"So what?\" test" |
| 4e | Case 5, contract ids | DONE | the command of the case | `2`, `reviewer/reviewer_full/v1 5 ['F1', 'F2', 'F3', 'F0']`, `reviewer/reviewer_methodology_focus/v1 2 ['F1', 'F2', 'F0']` |
| 4f | Case 6, frontmatter | DONE | the command of the case | `paper-review 532 {'version': '1.0.0'}` |
| 4g | Case 7, `##` headings in order | DONE | `grep -n '^## ' skills/academic/paper-review/SKILL.md` | `12:## Quick start`, `32:## Use instead`, `43:## What it reads`, `77:## Steps`, `256:## Agent prompts`, `280:## Sprint Contract Protocol`, `435:## Review output`, `453:## Integration`, `475:## Quality standards`, `489:## Stops`, `506:## Anti-patterns`, `520:## Rules` |
| 4h | Case 8, sixteen and seventeen | DONE | `grep -c 'sixteen' README.md`; `grep -c 'seventeen' README.md` | `0`; `2` |
| 4i | Case 9, contracts equal to the two files without `baseline_version` | DONE | the command of the case | `True` |
| 4j | Case 10, the academic-pipeline figure unchanged | DONE | `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`; `git status --short docs/figures/academic-pipeline` | `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22040 bytes)`, exit 0; nothing printed |
| 4k | Case 11, the new figure and no other figure changed | DONE | `python3 docs/figures/gen_figures.py >/dev/null; echo "gen_figures exit $?"`; `git status --short docs/figures` | `gen_figures exit 0`; ` M docs/figures/gen_figures.py` and `?? docs/figures/paper-review.svg` |
| 5 | The grep for names that do not exist here | DONE | `grep -nE 'v[0-9]+\.[0-9]+\|deep-research\|academic-pipeline\|academic-paper\|shared/\|scripts/\|docs/design\|ARS\|ars-\|[Oo]rchestrator' skills/academic/paper-review/SKILL.md` | nothing printed |
| 6 | The source read from its first line to its last, each part placed | DONE | by reading | "The map of the source" below |
| 7 | The listing places read whole after the change | DONE | by reading `README.md`, `docs/glossary.md` line 153, `skills/academic/paper/SKILL.md` line 68, `docs/dev/building.md` line 37 and `docs/dev/scripts.md` line 9 | each names `paper-review` or `paper-review.svg`; "User-visible changes" below |
| 8 | The step's own sentences read against the standards | DONE | by reading | "Departures from the standards" below |

What the green results do not cover: no check reads whether a carried sentence kept its meaning, which the map below is for; the figure is checked by its run and by one look at its rendering (`rsvg-convert docs/figures/paper-review.svg`), not by a test; the 24 pages this file names are not in this worktree, so each path and heading is named from the source's file and from the heading texts the brief gives.

## The map of the source

`new` is `skills/academic/paper-review/SKILL.md`. Each row names one part of the source and its place. A part left out is quoted with its edit. Characters outside ASCII in a quote are written by name.

### Frontmatter (source lines 1 to 13)

| Source part | Place in new, or edit |
|---|---|
| `name: academic-paper-reviewer` | Frontmatter, `name: paper-review` (edit 1) |
| `description:` | Frontmatter `description`, the source's words, with `/paper-review` added as the first trigger |
| `version: "1.10.0"` | `metadata.version: "1.0.0"` (brief, decision 4) |
| `last_updated`, `status`, `data_access_level`, `task_type`, `related_skills` | left out (brief, decision 5) |

### Title and opening (lines 15 to 24)

| Source part | Place in new, or edit |
|---|---|
| `# Academic Paper Reviewer v1.10.0 <em dash> Multi-Perspective Academic Paper Review Agent Team` | the title, "# Academic Paper Reviewer: Multi-Perspective Academic Paper Review Agent Team" (edit 4) |
| Paragraph "Simulates a complete international journal peer review process..." | first paragraph, "Simulates a complete international journal peer review process: automatically identifies the paper's field...", the two dashes around the four perspectives written as parentheses and a comma (edit 4) |
| "**v1.1 Improvements**:" and its 3 numbered items | left out whole (edit 4, history) |
| "> **Routing discipline (v3.9.2):** see `.claude/CLAUDE.md` ..." | left out whole (edit 2) |

### Quick Start (lines 28 to 39)

| Source part | Place in new, or edit |
|---|---|
| "**Simplest command:**" and the code line "Review this paper: [paste paper or provide file]" | Quick start, last line of the code block, with the comment "the simplest command, a plain request: this one runs full (Steps 1)" |
| "**Output:**" and its 4 numbered items | Quick start, "**Output:**" and the 4 items, below the code block |

### Trigger Conditions (lines 43 to 70)

| Source part | Place in new, or edit |
|---|---|
| Trigger Keywords: "**English**: review paper, peer review, ..." | What it reads 3, "The plain request, matched on the Trigger Keywords. **English**: review paper, ..." |
| Non-Trigger Scenarios, row "Need to write a paper (not review)" | Use instead, first table, row 1, Use `/paper` |
| Non-Trigger Scenarios, row "Need in-depth investigation of a research topic / `deep-research`" | left out (edit 2) |
| Non-Trigger Scenarios, row "Need to revise a paper (already have review comments)" | Use instead, first table, row 2, Use `/paper revision` |
| Quick Mode Selection Guide, table of 6 rows | Steps 1, the table under the item, 6 rows |
| "**Spectrum** (v3.2): *fidelity* = ..." | Steps 1, "**Spectrum**: *fidelity* = template-heavy, predictable output; ..."; the tag "(v3.2)" left out (edit 4) and the sentence "See `shared/mode_spectrum.md` for the full cross-skill spectrum table." left out (edit 2) |
| "Not sure? Use `full` for pre-submission review, ..." | Steps 1, "Not sure? Use `full` for pre-submission review, ... `calibration` is opt-in: run it once per domain ..." (dash to colon, edit 4) |

### Agent Team (7 Agents) (lines 74 to 84)

| Source part | Place in new, or edit |
|---|---|
| Table of 7 rows, columns #, Agent, Role, Phase | Agent prompts, the table, 7 rows, each agent named in words with its page (edit 1), the dash in each Role cell a colon (edit 4), row 6 bold |

### Orchestration Workflow (3 Phases) (lines 88 to 181)

| Source part | Place in new, or edit |
|---|---|
| Diagram line `User: "Review this paper"` | "full" under Steps, the lead line, "(User: \"Review this paper\")" |
| "=== Phase 0: FIELD ANALYSIS & PERSONA CONFIGURATION ===" and "[field_analyst_agent] -> Reviewer Configuration Card (x5)" | full item 1, "Phase 0: FIELD ANALYSIS & PERSONA CONFIGURATION. Start the field analyst -> Reviewer Configuration Card (x5)." |
| "Reads the complete paper"; "Identifies: ..."; "Dynamically generates specific identities for 5 reviewers:" with its 5 starred lines | full item 1, three sub-items, the third with 5 sub-items (EIC, Reviewer 1, Reviewer 2, Reviewer 3, Devil's Advocate) |
| "** Presents Reviewer Configuration to user for confirmation (adjustable) **" | full item 2, "Presents Reviewer Configuration to user for confirmation (adjustable): the stop \"The Reviewer Configuration\"." |
| "=== Phase 1: PARALLEL MULTI-PERSPECTIVE REVIEW ===" | full item 3, "Phase 1: PARALLEL MULTI-PERSPECTIVE REVIEW. Start the five reviewers at once, ..." |
| "[eic_agent] -> EIC Review Report" and its 3 bullets | full item 3, sub-item "The EIC -> EIC Review Report" with 3 sub-items |
| "[methodology_reviewer_agent] -> Methodology Review Report" and its 3 bullets | full item 3, sub-item "The methodology reviewer -> Methodology Review Report" with 3 sub-items |
| "[domain_reviewer_agent] -> Domain Review Report" and its 3 bullets | full item 3, sub-item "The domain reviewer -> Domain Review Report" with 3 sub-items |
| "[perspective_reviewer_agent] -> Perspective Review Report" and its 3 bullets | full item 3, sub-item "The perspective reviewer -> Perspective Review Report" with 3 sub-items |
| "[devils_advocate_reviewer_agent] -> Devil's Advocate Report" and its 8 bullets | full item 3, sub-item "The Devil's Advocate reviewer -> Devil's Advocate Report" with 8 sub-items |
| "=== Phase 2: EDITORIAL SYNTHESIS & DECISION ===" and "[editorial_synthesizer_agent] -> Editorial Decision Package" with its 6 bullets | full item 4, "Phase 2: EDITORIAL SYNTHESIS & DECISION. Start the editorial synthesizer -> Editorial Decision Package." with 6 sub-items; "academic-paper revision mode" written "`paper` revision mode" (edit 1) |
| "=== Phase 2.5: REVISION COACHING (Socratic Revision Guidance) ===" and "** Only triggered when Decision = Minor/Major Revision **" | full item 5, "Phase 2.5: REVISION COACHING (Socratic Revision Guidance). Only triggered when Decision = Minor/Major Revision." |
| "[eic_agent] guides the user through Socratic dialogue:" | full item 5, "The run's EIC agent, resumed, guides the user through Socratic dialogue:" |
| Points 1, 2, 4, 5 and 6 | full item 5, points 1, 2, 4, 5 and 6, each dash a colon (edit 4) |
| Point 3, "Contribution framing probe ..." | full item 5, point 3, with the three questions given as the brief words them. Left out: "(single-sourced under Layer 5 in deep-research/agents/socratic_mentor_agent.md <em dash> read the question text there)" (edit 2). Kept: "Questions only: never propose, substitute, rank, expand, or select a contribution claim (Kong L2 verb test); the user answers." |
| "After dialogue ends, produces:" and its 2 bullets | full item 5, sub-item "After dialogue ends, produces:" with 2 sub-items |
| "** User can say \"just fix it\" to skip guidance **" | full item 5, sub-item "User can say \"just fix it\" to skip guidance" |
| Checkpoint Rule 1 | full item 2, sub-item "**After Phase 0 completes**: Present Reviewer Configuration Card to user; user can adjust reviewer identities" |
| Checkpoint Rule 2 | Rules, bullet 1, "**IRON RULE**: 5 reviewers review independently, without cross-referencing each other." |
| Checkpoint Rule 3 | Rules, bullet 2, "**IRON RULE**: Synthesizer cannot fabricate review comments; must be based on specific reports from Phase 1." |
| Checkpoint Rule 4 | Rules, bullet 3, "**IRON RULE**: If the Devil's Advocate finds CRITICAL issues, the Editorial Decision cannot be Accept." |
| Checkpoint Rule 5 | full item 5, sub-item "**Phase 2.5**: Revision Coaching only triggers when Decision is not Accept; user can choose to skip" |
| Checkpoint Rule 6 | Rules, bullet 4, "**IRON RULE: READ-ONLY CONSTRAINT**: Reviewers MUST NOT modify the submitted manuscript. ..." whole, 4 sentences |
| Checkpoint Rule 7 | Rules, bullet 5, "**IRON RULE: UNTRUSTED REVIEW MATERIALS**: Submitted manuscripts, ..." whole, 2 sentences |
| The warning sign before each IRON RULE | removed, the words "IRON RULE" standing beside it (edit 4) |

### Phase-by-phase Invocation Contract (v3.9.2) (lines 185 to 203)

All of it stands in Agent prompts, below the table. The heading's tag is gone with the heading.

| Source part | Place in new, or edit |
|---|---|
| "academic-paper-reviewer runs in 3 phases internally (...)." | "`paper-review` runs in 3 phases internally (Phase 0 field analysis -> Phase 1 panel review -> Phase 2 editorial synthesis)." |
| "Within the full ARS pipeline, this skill sits at the orchestrator's Phase 5 (Review), but each agent inside the reviewer skill is single-phase relative to the skill's own phase numbering." | the clause on the pipeline left out (edit 2); "Each agent inside the reviewer skill is single-phase relative to the skill's own phase numbering." |
| "Two invocation modes:" | left out (edit 2): one invocation is left once Mode A is gone |
| "**Mode A <em dash> orchestrator-driven (default):** `pipeline_orchestrator_agent` ..." | left out (edit 2) |
| "**Mode B <em dash> phase-by-phase (cross-session resume):** User invokes one reviewer agent per phase across sessions, or runs the full reviewer panel standalone via `/ars-review` equivalent." | "**Phase-by-phase (cross-session resume):** User invokes one reviewer agent per phase across sessions, by a plain request, or runs the full reviewer panel standalone via `/paper-review`." (edits 1 and 2, and the brief's "by a plain request") |
| "In Mode B, **single-phase agents (Bucket A per `docs/design/...`) stay strictly within their assigned phase for writes**. The 6 Bucket A agents in academic-paper-reviewer are: ... Reading the full paper draft is **expected** for all reviewers <em dash> without context they cannot evaluate." | "In phase-by-phase invocation, **single-phase agents stay strictly within their assigned phase for writes**. The 6 single-phase agents in `paper-review` are: the EIC, ... Reading the full paper draft is **expected** for all reviewers: without context they cannot evaluate."; "(Bucket A per `docs/design/2026-05-18-ars-v3.9.2-agent-phase-classification.md`)" left out (edit 2) |
| "The 1 Bucket D agent (`field_analyst` at Phase 0) is meta <em dash> it configures the panel; no boundary fence needed." | "The field analyst at Phase 0 is meta: it configures the panel; no boundary fence needed."; the bucket name left out with its design note (edit 2) |
| "The v3.6.2 Sprint Contract Protocol (...) additionally constrains ... both apply <em dash> neither overrides the other." | "The Sprint Contract Protocol (paper-blind Phase 1 + paper-visible Phase 2 + data delimiter) additionally constrains all reviewer agents' within-phase discipline. Phase Boundary (phase scope) and Sprint Contract (...) both apply: neither overrides the other." |
| "Routing into Mode B requires explicit user signal <em dash> `/ars-<mode>` slash command or `[direct-mode]` prefix. Ambiguous cross-phase input defaults to clarification per `.claude/CLAUDE.md` Routing Discipline + `shared/references/intent_clarification_protocol.md`." | left out (edit 2) |
| "**Enforcement (v3.9.2):** prompt-level via Phase Boundary blocks on Bucket A agents + advisory verifier (`scripts/check_pipeline_integrity.py`). Deterministic PreToolUse hook + multi-phase envelope deferred to v3.10 active conductor (#134)." | "**Enforcement:** prompt-level via Phase Boundary blocks on the single-phase agents."; the verifier and the sentence on the hook left out (edits 2 and 4) |

### Operational Modes (6 Modes) (lines 207 to 230)

| Source part | Place in new, or edit |
|---|---|
| Modes table, row `full` | Steps, the modes table, row `full` |
| Row `re-review` | row `re-review`, bold; "Pipeline Stage 3' /" left out of the Trigger cell (edit 2); agents named in words (edit 1) |
| Row `quick` | row `quick`, agents named in words; its items in "quick" name the row |
| Row `methodology-focus` | row `methodology-focus`; "under v3.6.2 sprint contract" written "under the sprint contract" (edit 4); its items in "methodology-focus" name the row |
| Row `guided` | row `guided` |
| Row `calibration` (v3.2) | row `calibration`, bold; "(v3.2)" left out (edit 4); ", cross-model default-on" left out (edit 2) |
| Mode Selection Logic, code block of 9 lines | Steps, the code block under "The mode selection logic:", 9 lines |

### Re-Review Mode (Verification Review) (lines 234 to 241)

| Source part | Place in new, or edit |
|---|---|
| "Dedicated mode for Pipeline Stage 3' <em dash> verifies whether revisions address first-round review comments." | "re-review", "Dedicated mode that verifies whether revisions address first-round review comments."; "for Pipeline Stage 3'" left out (edit 2) |
| "Uses R&R Traceability Matrix (Schema 11) with Author's Claim + Verified? columns." | "re-review", the same sentence |
| "**Input**: ..." and "**Output**: ..." | "re-review", the two lines; What it reads 2 names the section |
| "> See `references/re_review_mode_protocol.md` for full verification logic, ..." | "re-review", the quoted line |

### Guided Mode (Socratic Guided Review) (lines 245 to 249)

| Source part | Place in new, or edit |
|---|---|
| Paragraph "Helps authors understand problems themselves ..." (2 sentences) | "guided", the paragraph |
| "> See `references/guided_mode_protocol.md` for dialogue flow, rules, and progressive revelation sequence." | "guided", the quoted line |

### Calibration Mode (v3.2) (lines 253 to 257)

| Source part | Place in new, or edit |
|---|---|
| "Opt-in mode that measures ... (5-20 papers with known outcomes)." | "calibration", the sentence; What it reads 2 names the section |
| "Runs `full` 5x per paper with fresh context, cross-model default-on." | "calibration", "Runs `full` 5x per paper with fresh context."; ", cross-model default-on" left out (edit 2) |
| "Produces a Calibration Report attached as a confidence disclosure to subsequent reviews in the session." | "calibration", the same sentence |
| "> See `references/calibration_mode_protocol.md` for full spec: ..." | "calibration", the quoted line |

### Review Output Format and Editorial Decision Format (lines 261 to 278)

| Source part | Place in new, or edit |
|---|---|
| "Each reviewer's report structure is detailed in `templates/peer_review_report_template.md`." | Review output, first line |
| "### Devil's Advocate Report Structure (Special Format)", its lead sentence and 5 bullets | Review output, the same `###` heading, the sentence and the 5 bullets |
| "## Editorial Decision Format" and its sentence | Review output, "### Editorial Decision Format" and the sentence |

### Integration (lines 282 to 302)

| Source part | Place in new, or edit |
|---|---|
| "### Upstream/Downstream Relationships", code block of 2 lines | Integration, the same heading and the 2 lines; "deep-research -->" and "(research)" left out (edit 2); the names written `paper` and `paper-review` (edit 1) |
| "### Specific Integration Methods", table of 4 rows | Integration, the same heading, 4 rows, each bold cell kept, `academic-paper` written `paper`; the two integrity-check rows in the source's words |
| "### Pipeline Usage Example", "> See `references/integration_guide.md` for a complete 9-step pipeline usage example." | Integration, the same heading, "... a complete 8-step pipeline usage example." (brief) |

### Agent File References (lines 306 to 316)

| Source part | Place in new, or edit |
|---|---|
| Table of 7 rows, Agent and Definition File | Agent prompts, the one table: each row's file stands in parentheses after the role, row 6 bold as in both source tables |

### Reference Files, Templates, Examples (lines 320 to 353)

| Source part | Place in new, or edit |
|---|---|
| Reference Files, rows 1 to 10 | What it reads 4, the table, 10 rows with Purpose and Used By; agents named in words (edit 1); "(v3.2)" left out of the calibration row (edit 4); "9-step" written "8-step" (brief); the empty Used By cell `-` (edit 4) |
| Reference Files, row `references/changelog.md` | left out (brief; edit 4) |
| Templates, 3 rows | What it reads 5, the table, 3 rows |
| Examples, 2 rows | What it reads 6, the table, 2 rows |

### Anti-Patterns (lines 357 to 369)

| Source part | Place in new, or edit |
|---|---|
| "Explicit prohibitions to prevent common failure modes, especially during long conversations:" | Anti-patterns, the sentence above the table |
| Rows 1, 2, 4, 5 and 7 | Anti-patterns, rows 1, 2, 4, 5 and 7, the first cell bold, the `#` column not carried (brief) |
| Row 3, "... (Checkpoint Rule #4)" | row 3, "If DA finds CRITICAL -> Decision cannot be Accept (Rules, \"IRON RULE: If the Devil's Advocate finds CRITICAL issues\")" |
| Row 6, "... (Checkpoint Rule #6)" | row 6, "READ-ONLY: produce reports, never modify the paper (Rules, \"IRON RULE: READ-ONLY CONSTRAINT\")" |

### Quality Standards (lines 373 to 385)

| Source part | Place in new, or edit |
|---|---|
| Table of 9 rows | Quality standards, 9 rows, rows 8 and 9 bold; the warning sign of row 9 removed (edit 4) |

### Output Language (lines 389 to 391)

| Source part | Place in new, or edit |
|---|---|
| "Follows the paper's language. Academic terms remain in English. User can override (e.g., ...)." | What it reads 7, the three sentences |

### Related Skills (lines 395 to 402)

| Source part | Place in new, or edit |
|---|---|
| Row `academic-paper` | Use instead, second table, "`paper` / Upstream (provides paper) + Downstream (receives revision roadmap)" |
| Rows `deep-research`, `tw-hei-intelligence`, `academic-pipeline` | left out (edit 2) |

### v3.6.2 Sprint Contract Hard Gate (lines 406 to 412)

| Source part | Place in new, or edit |
|---|---|
| Bullet "**Reviewer hard gate.** ... now run two-call ..." | Sprint Contract Protocol, bullet 1; "now" left out, the present fact kept (edit 4) |
| Bullet "**Schema 13 sprint contract.** ..." | bullet 2; "Validator: `scripts/check_sprint_contract.py`. Schema: `shared/sprint_contract.schema.json`." left out (edit 2) |
| Bullet "**Synthesizer three-step mechanical protocol.** ..." | bullet 3, the arrows written `->` (edit 4); the page named with its heading, "`agents/editorial_synthesizer_agent.md`, \"Sprint Contract Synthesizer Protocol\"" |
| Bullet "**methodology_focus reduced panel.** ..." | bullet 4 |
| Bullet "**Templates:** `shared/contracts/reviewer/full.json` (panel 5) and `shared/contracts/reviewer/methodology_focus.json` (panel 2). Reserved modes (...) keep pre-v3.6.2 behaviour until follow-up patch templates land." | bullet 5, "**Contracts:** the full contract (panel 5) and the methodology-focus contract (panel 2), each given below. Reserved modes (`reviewer_re_review`, `reviewer_calibration`, `reviewer_guided`) have no contract and run without the two-call protocol." (edits 2, 3 and 4, in the words step 1's brief gives for the same fact) |

### Version Info and Changelog (lines 416 to 430)

Left out whole (ADR 0043, Decision 2).

### The repeats the source has, each kept in each place

- A CRITICAL finding of the Devil's Advocate bars Accept: Rules bullet 3 (Checkpoint Rule 4), Anti-patterns row 3, Quality standards row 9, and full item 4, "Devil's Advocate CRITICAL issues are specially flagged in the Editorial Decision" (the diagram).
- Read-only on the manuscript: Rules bullet 4 (Checkpoint Rule 6) and Anti-patterns row 6.
- No fabricated review comments: Rules bullet 2 (Checkpoint Rule 3), Anti-patterns row 1 and Quality standards row 2.
- Reviewers differ and do not repeat each other: Rules bullet 1 (Checkpoint Rule 2), Anti-patterns row 2 and Quality standards row 1.
- The Reviewer Configuration is shown for confirmation: full item 2 holds the diagram's line and Checkpoint Rule 1.
- When Phase 2.5 runs: full item 5 holds the diagram's line ("Decision = Minor/Major Revision") and Checkpoint Rule 5 ("Decision is not Accept"). The two differ on a Reject decision in the source, and both stand as the source has them.

## Sentences this step wrote that the source does not have

In `skills/academic/paper-review/SKILL.md`:

| Place | Sentence | Part of the brief |
|---|---|---|
| First paragraph | "It leaves behind the reports of the run, each a file of its own in the run folder (Rules)." | Title and first paragraph |
| Quick start | the 7 lines `/paper-review ...` with their comments, and the comment of the plain request's line | `## Quick start`, ruling Open item 2-call |
| What it reads 1 | "The manuscript, as a file or as pasted text. A call that gives none is the refusal \"A missing input\"." | `## What it reads` |
| What it reads 2 | "The inputs of the mode. Re-review reads what its **Input** line gives (\"re-review\" under Steps), and calibration the gold set its section gives (\"calibration\" under Steps), as a folder. A call that lacks a required one is the refusal \"A missing input\"." | `## What it reads`; "A part of the source is carried once" |
| What it reads 3 to 7 | the leads "The plain request, matched on the Trigger Keywords.", "The reference pages, each read by the roles its row names.", "The templates.", "The examples.", "The output language." | `## What it reads`, one numbered item per input |
| Steps, lead | "The 6 operational modes:", "The mode selection logic:", "Steps 1 to 3 run in order, in every mode." | `## Steps` |
| Steps 1 | "Read the call and pick the mode." with its 5 sub-items on the mode argument, the one-argument call, "Unknown mode", the plain request and "A missing input", and "Done when the mode and its inputs are known, or the refusal is raised." | `## Steps`, "read the call and pick the mode"; `## Stops`, the two refusals |
| Steps 2 | "Make the run folder, named and placed as Rules gives it." and "Done when the run folder exists and is empty." | `## Steps`, "make the run folder" |
| Steps 3 | "Run the items of the mode, under its heading below." and "Done when the last item of the mode is done." | `## Steps`, "then the mode's items" |
| full, lead | "The orchestration workflow of 3 phases, which starts from the user's request (User: \"Review this paper\"):" | `### full`, every line of the diagram kept |
| full items 1 to 5 | the words "Start" before each agent, ": the stop \"The Reviewer Configuration\"", "Start the five reviewers at once, each in the two calls of the full contract (\"Sprint Contract Protocol\")", and the five "Done when ..." lines | `### full`; "Each item ends on what is true when it is done" |
| full item 5 | "The run's EIC agent, resumed," before the source's "guides the user through Socratic dialogue:"; "The session shows the user each question the agent asks, and sends the user's answer to the agent."; "Each question is the stop \"The coaching question\"." | the Socratic dialogues, decision 7 |
| full item 5, point 3 | the three questions with the labels L5-W1, L5-W2 and L5-W3 | ruling Open item 2-questions |
| re-review | items 1 and 2 with their sub-items | `### re-review`; the Socratic dialogues |
| quick | items 1 and 2 | `### quick` |
| methodology-focus | items 1 and 2 | `### methodology-focus` |
| guided | items 1 and 2 with their sub-items | `### guided`; the Socratic dialogues |
| calibration | items 1 and 2 with their sub-items | `### calibration`; `## Stops` |
| Agent prompts | "by a plain request," inside the phase-by-phase sentence | Reference sections, `## Agent prompts` |
| Agent prompts | "Each reviewer's page states them under `## Phase Boundary` and `## Sprint Contract Protocol`, with the two calls under `### Phase 1: Paper-content-blind pre-commitment` and `### Phase 2: Paper-visible review`." | "What is on the tree", the heading texts step 1 writes, used where this step names them |
| Sprint Contract Protocol | "The session places the contract of the run's mode in each reviewer's user content." | `## Sprint Contract Protocol` |
| Sprint Contract Protocol | the headings "### The full contract" and "### The methodology-focus contract", and the two `json` blocks | `## Sprint Contract Protocol`, ruling Open item 2-contracts |
| Stops | the lead of 2 sentences and the 10 rows | `## Stops` |
| Rules | bullets 6 to 13, on the agents, the run folder and a reviewer's second call | `## Rules`, ruling The three things the source does not state |

In the other files: the README's row for `paper-review`, the words added to its four sentences and its alt text; the docstring, the labels and the note of `paper_review()` and the 2 lines of the head comment of `docs/figures/gen_figures.py`; `paper-review.svg` in the two lists of figures. Each is quoted under "User-visible changes".

## Departures from the standards, in the words this step wrote

- Steps 1, "A call that lacks an input its mode's line of Quick start requires, or names a file or folder that does not exist, is the refusal \"A missing input\"." has 28 words: its two conditions lead to one refusal, and splitting them would state the refusal twice.
- Rules, the last bullet, has 38 words, as the brief gives it: the message's three parts belong to the one rule on the second call.
- Rules, "Each report is a file of its own in the run folder: ..." has 41 words, as the brief gives it: it lists the five kinds of report.
- Stops, the cells of the two rows with a tag run past 20 words: each names the condition, the page and the section that state it.
- The README's row has two sentences past 20 words, the first, which lists the seven roles, and the one on the editorial synthesizer and the coaching: each lists what one run does, as the neighbouring rows do.
- The arrows `->` in full items 1, 3 and 4 and in Anti-patterns row 3 stand in list items and a table cell, against the prose standard's section 0. They are the source's diagram lines and its table cell, kept as edit 4 says the copy keeps that form.
- Bold stands on carried text that is no list label (the modes table's two bold rows, "**Output:**", "**Input**", the bold words of the invocation contract): the source's bold is kept, as the brief asks for a bold table row.
- What it reads 4 to 6 hold tables inside a numbered item, as `paper` holds its mode guide inside Steps 1.

## The grep of the rules file's rule 14

`grep -rn 'paper-review' skills utils docs README.md`, with the 20 hits inside `skills/academic/paper-review/SKILL.md` counted by `grep -c 'paper-review' skills/academic/paper-review/SKILL.md` and left out of the listing below, each of them the skill's own name, its call, its run folder or its figure:

```
skills/academic/paper/SKILL.md:68:| Reviewing a paper (structured review by a panel of reviewers and an editor), a different kind of review from `/paper draft-review` | `paper-review` |
skills/academic/paper/SKILL.md:892:- **In-pair Phase 6 evaluator vs external review**: the in-pair peer reviewer (Phase 6 evaluator with the contract gate) and an external panel review (`paper-review`) serve different review layers.
docs/adr/0001-the-writing-base-reads-the-prose-standard-where-it-is.md:7:The writing skills (`literature`, `paper`, `paper-review`, `grant`) share one set of prose rules, the writing base of roadmap entry 3. Ordo already ships the prose standard as the `repo-setup` skill's `templates/docs/dev/prose-standard.md`, which `/repo-setup` installs as `docs/dev/prose-standard.md` and which a repository's `standards` key can name. Ordo's skills carry no project name and no path, and everything specific to a repository comes from its `plan.yaml` (`README.md`, opening). research-hub, where the writing skills are used, has no prose-standard page of its own.
docs/adr/0022-a-paper-run-is-done-by-five-agent-roles-and-the-integrity-and-ethics-checks-belong-to-researcher.md:22:A full run starts at most five roles and makes at most three writer passes driven by other agents' issues. No full, revision or lit-review run checks claims against their sources until `researcher` exists; citation-check mode does, as ADR 0024 says. `references/integrity-verification.md` and `references/ethics.md` leave `skills/academic/paper/`, and `researcher` takes what they held. The later writing skills (`paper-review`, `rebuttal`, `grant`) have this record to follow or supersede.
docs/adr/0025-a-paper-run-is-done-by-six-agent-roles-three-of-them-resumed-for-a-second-message-in-named-cases-and-the-integrity-and-ethics-checks-belong-to-researcher.md:33:A full run starts at most six roles. After the first draft the draft writer makes at most three passes driven by other roles' or scripts' issues. One answers the issues of draft review round 1, one the failing lines of the reference checks, and one the compile lines. A fourth pass follows only when the user answers the `/writing` report (ADR 0023), and a fifth only when the compile after that pass fails. Five cases add starts to that count, and each is named in the run's stops and steps. The user can choose an expanded revision at the stop "The draft review does not pass". It returns to the planner, the strategist or the sections, and resumes the planner or the strategist with the review. The draft writer then writes the first draft again or rewrites the sections as patches. The expanded revision adds a draft review round 1 and a round 2, with the reviews numbered on. The answer to lower the venue adds a draft review round 1 and a round 2 against the new venue, and the writer pass that round 1's issues need. The draft writer starts a second time to put the model identifier in the AI disclosure, when the runner's model list gave none and the writer was the first agent of the run. It starts a third time, once after the last change to the manuscript, to write the anonymous copy for a double-blind venue. The citation compliance agent starts again as a fresh agent after the stop "The citation style to confirm", and once more for the failing lines of the reference checks. Full, revision and citation-check runs check each cited claim against a passage read from its source, as ADR 0024 says, and a claim the run cannot support stops the run. Lit-review runs check no claim until `researcher` exists. `references/integrity-verification.md` and `references/ethics.md` leave `skills/academic/paper/`, and `researcher` takes what they held. The later writing skills (`paper-review`, `rebuttal`, `grant`) have this record to follow or supersede.
docs/adr/0027-a-paper-run-is-done-by-eight-agent-roles-four-of-them-resumed-for-a-second-message-in-named-cases-and-the-integrity-and-ethics-checks-belong-to-researcher.md:40:A plan run starts one mentor, which holds the whole dialogue, and fresh planner starts for the outline, each evaluation of the stress test and the chapter plan. The mentor's context grows over the rounds of the dialogue, and its resumption depends on the runner keeping the agent, which the checkpoint in the run folder covers. A format-convert run starts the formatter once, and again as a fresh agent only for a patch the script rejects as `validation` or `schema`, for a structural patch the user refuses, as every role that is not resumed does, and for the conversion patch of a run that changes the citation style with a DOCX or Markdown target. That second start follows the compile of the conversion copy after the first patch, so the numbers and the reference list the conversion patch prints are those of the new style. A runner without `pandoc` gets no DOCX or Markdown output, and the final message names `pandoc` as missing. A full run starts at most six roles. After the first draft the draft writer makes at most three passes driven by other roles' or scripts' issues. One answers the issues of draft review round 1, one the failing lines of the reference checks, and one the compile lines. A fourth pass follows only when the user answers the `/writing` report (ADR 0023), and a fifth only when the compile after that pass fails. Four cases add starts to that count, and each is named in the run's stops and steps. The user can choose an expanded revision at the stop "The draft review does not pass". It returns to the planner, the strategist or the sections, and resumes the planner or the strategist with the review. The draft writer then writes the first draft again or rewrites the sections as patches. The expanded revision adds a draft review round 1 and a round 2, with the reviews numbered on. The draft writer starts a second time to put the model identifier in the AI disclosure, when the runner's model list gave none and the writer was the first agent of the run. It starts a third time, once after the last change to the manuscript, to write the anonymous copy for a double-blind venue. The citation compliance agent starts again as a fresh agent after the stop "The citation style to confirm", and once more for the failing lines of the reference checks. Full, revision and citation-check runs check each cited claim against a passage read from its source, as ADR 0024 says, and a claim the run cannot support stops the run. Lit-review runs check no claim until `researcher` exists. `references/integrity-verification.md` and `references/ethics.md` leave `skills/academic/paper/`, and `researcher` takes what they held. The later writing skills (`paper-review`, `rebuttal`, `grant`) have this record to follow or supersede.
docs/adr/0019-a-paper-run-is-done-by-academic-paper-s-agent-roles-each-a-fresh-agent.md:7:Roadmap entry 5 builds `paper` on academic-paper, which runs 12 agents, one per phase of its pipeline, from intake to formatting (`research-hub/.agents/skills/academic-paper/SKILL.md`, the agent table). The user's global rules send all manuscript content through a skill whose agents are dispatched through the Agent tool, and limit the orchestrating session to reading, deciding and briefing. Ordo's `/writing` reviews a draft with fresh read-only agents, since a session that wrote a draft would otherwise review its own work (ADR 0013). `paper` takes the abstract, argument builder, citation compliance, draft writer, literature strategist, peer reviewer, structure architect, visualization and integrity verification agents. The peer reviewer is one reviewer of the author's own draft inside full mode, sending it back to the draft writer at most twice; the five-reviewer panel of academic-paper-reviewer is a separate skill, `paper-review` (roadmap entry 6).
docs/adr/0019-a-paper-run-is-done-by-academic-paper-s-agent-roles-each-a-fresh-agent.md:20:A full run starts up to nine agents, and each mode starts only the roles its phases need. Each role's rules sit on one page, so a rule is changed in one place. The later writing skills (`paper-review`, `rebuttal`, `grant`) face the same choice and either follow this record or supersede it.
docs/glossary.md:153:- **panel review**: the internal review of the author's own paper by `paper-review`, a panel of several reviewers and an editor whose synthesis gives a decision and a revision roadmap, from the author's side. It is neither a draft review nor a referee review. Stated in: `skills/academic/paper-review/SKILL.md`, "Agent prompts".
docs/roadmap.md:23:## 6. paper-review
docs/roadmap.md:26:- Goal: The internal review skill, a copy of academic-paper-reviewer (`research-hub/.agents/skills/academic-paper-reviewer/`): its `SKILL.md` and every file of its `agents/`, `references/`, `templates/` and `examples/`, with its seven agents and its six modes (full, re-review, quick, methodology-focus, guided and calibration) as the source has them. It is copied as `paper` was copied from academic-paper, with the same edits and no others (ADR 0043, Decision 1): this repository's names, the character set and the no-history rule, the Chinese-language text left out with the English kept, and a sentence on a skill or a mechanism that does not exist left out. Nothing else the source has is cut, moved or replaced, and no file of another skill is added.
docs/roadmap.md:27:- Gate: a fresh agent reads `diff -r` of the skill's folder against `research-hub/.agents/skills/academic-paper-reviewer/` once and lists each difference with which of those edits it is, or none; you read that list; the verify list of `docs/dev/building.md` passes on main.
docs/roadmap.md:33:- Goal: The referee skill: the referee review of someone else's paper, by one reviewer from the reviewer's side, writing the report for the editor: a summary of the paper, a recommendation, the major and the minor points each tied to the passage it is about, and the confidential comments to the editor. It is neither the draft review of `paper`'s full mode nor the panel review of `paper-review`. Its design follows academic-paper-reviewer's full mode: the agents, phases, cycles and stops are kept as the source has them, and each deviation from them is made only with its reason and your ruling in the plan's Rulings.
docs/roadmap.md:34:- Gate: one referee review of `research-hub/tmp/BIOINF-2026-1778-review/manuscript.txt`, which you read against the comments you sent (`research-hub/tmp/BIOINF-2026-1778-review/COMMENTS_TO_AUTHOR.md`) and find written by one reviewer from the reviewer's side, with each point tied to its passage and no panel synthesis; the plan's ledger lists every deviation from the design of academic-paper-reviewer, each with its reason and the ruling that approved it, and nothing else differs, checked by reading both skills.
docs/roadmap.md:47:- Goal: The researcher skill, with three modes. `novelty` is a light check made by the session itself, with no agent started: it states the claims of an idea, searches for the closest prior work on each, and writes one page with the nearest works and their references, what each already does, what the idea adds beyond them and a verdict per claim (new, partly done or done), each cited work confirmed with `paper`'s `lookup.py`; the page is given to `paper` as a starting point and replaces none of its literature search. `integrity` runs the integrity check, of the references and of the claims against each source's full text, of the numbers against the saved runs and of the figures against their traces, and the ethics check, on a finished draft. `manuscript` runs `paper`, the integrity and ethics checks, the review of `paper-review`, the revision, the re-review and the final check, in the order academic-pipeline gives its stages from the writing on. The integrity check's corrections and its records sent to `paper` keep file names, script names, paths, code identifiers, job, run or exit-code language and software-operations wording out of the manuscript text, a fact from code or a log written as the scientific claim it supports. The `integrity` and `manuscript` modes are a copy of academic-pipeline's files (`research-hub/.agents/skills/academic-pipeline/`), each under its own folder and name, changed only where a ruling of yours in the plan's Rulings says so, each with its reason.
docs/roadmap.md:50:- Figure: ![academic-pipeline: the 10 stages, and where each stage goes now. The stages: 1 Research: deep-research; 2 Write: academic-paper, plan or full; 2.5 Integrity check; 3 Review: academic-paper-reviewer; Back to stage 2, or end; 4 Revise: academic-paper revision; 3' Re-review; 4' Re-revise, no review after; 4.5 Final integrity check, zero issues to pass; 5 Finalize: DOCX, LaTeX, PDF; 6 Process summary. Where each goes now: 1 Research goes to researcher, entry 13 (not built yet); 2 Write goes to paper plan and paper full; 2.5 Integrity check goes to researcher, entry 13; 3 Review goes to paper-review, entry 6 (not built yet); 4, 3', 4' Revise and re-review go to paper revision; 4.5 Final integrity check goes to researcher, entry 13; 5 Finalize goes to paper format-convert; 6 Process summary goes to none. The integrity and ethics checks run in researcher, once on paper's finished draft and once after its revision.](figures/academic-pipeline/academic-pipeline.svg)
docs/roadmap.md:93:- [x] 2. Coverage inventory of the academic skills: `docs/academic-coverage.md` names each of the 169 files once with its mark and reason; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0, and `sh utils/check_coverage.test.sh` printed `PASS: check_coverage.py scratch tests`; the user approved the list (plan 2's rulings).
docs/roadmap.md:117:- 15.A. Rebuild-later rows: dropped, since entry 5 builds its 8 rows for paper and entry 6 its 3 rows for paper-review, so each row is built in the plan that rebuilds its skill, before that skill's comparison with its source.
docs/figures/paper-review.svg:1:<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1270 760" width="1270" height="760" role="img" aria-label="The full mode of the paper-review skill. Boxes: Field analyst: the Reviewer Configuration Card (agent); You confirm the reviewer configuration (stop); EIC, 2 calls (agent); Methodology reviewer, 2 calls (agent); Domain reviewer, 2 calls (agent); Perspective reviewer, 2 calls (agent); Devil&#x27;s Advocate reviewer, 2 calls (agent); Editorial synthesizer: the Editorial Decision and the Revision Roadmap (agent); EIC, resumed: the coaching question, only for a revision decision (stop).">
docs/figures/paper-review.svg:2:<title>The full mode of the paper-review skill. Boxes: Field analyst: the Reviewer Configuration Card (agent); You confirm the reviewer configuration (stop); EIC, 2 calls (agent); Methodology reviewer, 2 calls (agent); Domain reviewer, 2 calls (agent); Perspective reviewer, 2 calls (agent); Devil's Advocate reviewer, 2 calls (agent); Editorial synthesizer: the Editorial Decision and the Revision Roadmap (agent); EIC, resumed: the coaching question, only for a revision decision (stop).</title>
Binary file docs/figures/__pycache__/gen_figures.cpython-313.pyc matches
docs/figures/gen_figures.py:10:- paper-review.svg: the agents and stops of the full mode of the paper-review skill, with the
docs/figures/gen_figures.py:1878:    """The full mode of the paper-review skill: its agents in order and its two stops."""
docs/figures/gen_figures.py:1908:        "paper-review.svg",
docs/figures/gen_figures.py:1909:        "The full mode of the paper-review skill",
docs/figures/gen_figures.py:2145:        ("paper-review.svg", paper_review()),
docs/figures/academic-pipeline/gen_academic_pipeline.py:56:    L("rev", "Purple: academic-paper-reviewer"),
docs/figures/academic-pipeline/gen_academic_pipeline.py:87:        N("S3", "3 Review: academic-paper-reviewer", "rev"),
docs/figures/academic-pipeline/gen_academic_pipeline.py:137:    "PRV": ("paper-review, entry 6", "todo"),
docs/figures/academic-pipeline/academic-pipeline.svg:1:<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1320 1247" width="1320" height="1247" role="img" aria-label="academic-pipeline: the 10 stages, and where each stage goes now. Boxes: 1 Research: deep-research; 2 Write: academic-paper, plan or full; 2.5 Integrity check; 3 Review: academic-paper-reviewer; Back to stage 2, or end; 4 Revise: academic-paper revision; 3&#x27; Re-review; 4&#x27; Re-revise, no review after; 4.5 Final integrity check, zero issues to pass; 5 Finalize: DOCX, LaTeX, PDF; 6 Process summary; 1 Research: deep-research; 2 Write: academic-paper; 2.5 Integrity check; 3 Review; 4, 3&#x27;, 4&#x27; Revise and re-review; 4.5 Final integrity check; 5 Finalize; 6 Process summary; paper plan and paper full; paper-review, entry 6; researcher, entry 13: integrity and ethics checks, the stage loop; paper revision; paper format-convert; none.">
docs/figures/academic-pipeline/academic-pipeline.svg:2:<title>academic-pipeline: the 10 stages, and where each stage goes now. Boxes: 1 Research: deep-research; 2 Write: academic-paper, plan or full; 2.5 Integrity check; 3 Review: academic-paper-reviewer; Back to stage 2, or end; 4 Revise: academic-paper revision; 3' Re-review; 4' Re-revise, no review after; 4.5 Final integrity check, zero issues to pass; 5 Finalize: DOCX, LaTeX, PDF; 6 Process summary; 1 Research: deep-research; 2 Write: academic-paper; 2.5 Integrity check; 3 Review; 4, 3', 4' Revise and re-review; 4.5 Final integrity check; 5 Finalize; 6 Process summary; paper plan and paper full; paper-review, entry 6; researcher, entry 13: integrity and ethics checks, the stage loop; paper revision; paper format-convert; none.</title>
docs/figures/academic-pipeline/academic-pipeline.svg:29:<text x="353.3" y="342.4" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11.5" fill="#3b0764" font-weight="400" text-anchor="middle">academic-paper-reviewer</text>
docs/figures/academic-pipeline/academic-pipeline.svg:92:<text x="1188" y="244" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11.5" fill="#475569" font-weight="400" text-anchor="middle">paper-review, entry 6</text>
docs/figures/academic-pipeline/academic-pipeline.svg:104:<text x="56" y="1086" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11" fill="#0f172a" font-weight="400" text-anchor="start">Purple: academic-paper-reviewer</text>
docs/dev/scripts.md:9:| `docs/figures/gen_figures.py` | Writes the SVG figures of the README from the labels written in the file: `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `paper-review.svg`, `code-comments.svg` and, under `docs/figures/paper/`, one figure for each of the twelve modes of `paper`, `lifecycle.svg` for the path of a manuscript through the modes and `run-folder.svg` for the files of a full run from agent to agent |
docs/dev/building.md:37:The figures under `docs/figures/` are written by two scripts and committed. `python3 docs/figures/gen_figures.py` writes `pipeline.svg`, `plan-loop.svg`, `grill.svg`, `writing.svg`, `paper-review.svg`, `code-comments.svg` and the fourteen figures of `paper` under `docs/figures/paper/`, one for each of its twelve modes, `lifecycle.svg` for the path of a manuscript through the modes and `run-folder.svg` for the files of a full run from agent to agent, and `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` writes `docs/figures/academic-pipeline/academic-pipeline.svg`, the stages of academic-pipeline and the skill each goes to. Every skill that launches agents has its figure under `docs/figures/`. A change to a skill's Stops table, its sequence, its agents, its cycles or its name changes the labels in the script that draws it, which is then run again. Neither script is part of the verify list.
README.md:29:| `paper-review` | Reviews a paper with academic-paper-reviewer's seven roles, each a fresh agent: a field analyst, an Editor-in-Chief, three peer reviewers for methodology, domain and perspective, a Devil's Advocate reviewer and an editorial synthesizer, and each role's page is academic-paper-reviewer's page copied. Its six modes are academic-paper-reviewer's: full, re-review, quick, methodology-focus, guided and calibration, and a plain request picks the mode. Full mode shows you the reviewer configuration to confirm and then starts the five reviewers at once. Each reviewer runs in two calls under a sprint contract: it writes its scoring plan before it sees the paper, then its review. The editorial synthesizer writes the Editorial Decision and the Revision Roadmap, and after a revision decision the Editor-in-Chief coaches you through the revision with questions, which "just fix it" skips. Re-review verifies a revised manuscript against the revision roadmap, and calibration measures the reviewer's error rates against papers with known outcomes. No role changes the manuscript. The reports stay in `paper-review-runs/` beside the manuscript's folder |
README.md:31:In the repository, each skill's folder stands in one of four group folders under `skills/`: `skills/orchestration/` holds `roadmap`, `grill`, `plan`, `spec`, `refute`, `land`, `plan-orchestration` and `plan-retro`; `skills/ordo/` holds `repo-setup`, `ordo-init`, `ordo-help` and `session-retro`; `skills/code/` holds `code-comments` and `diagnose`; `skills/academic/` holds `paper`, `paper-review` and `writing`. Installed, the seventeen skills stand side by side in one folder, each under its own name, such as `~/.claude/skills/plan`.
README.md:71:The skills that launch agents each have a figure of their own. `grill` starts lookup agents, `writing` three finding agents and a checking agent, `paper-review` its seven roles (the field analyst, the five reviewers and the editorial synthesizer), and `code-comments` a finding agent, a checking agent and a rewrite agent.
README.md:77:![The full mode of the paper-review skill: Field analyst: the Reviewer Configuration Card; You confirm the reviewer configuration, a stop; EIC, Methodology reviewer, Domain reviewer, Perspective reviewer and Devil's Advocate reviewer start at once, each in 2 calls; Editorial synthesizer: the Editorial Decision and the Revision Roadmap; EIC, resumed: the coaching question, only for a revision decision, a stop that repeats until the dialogue ends or you say just fix it.](docs/figures/paper-review.svg)
README.md:124:The plan skills and `grill` launch their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, which Claude Code reads from `~/.claude/agents` (or `$CLAUDE_CONFIG_DIR/agents`). For them, `CLAUDE_CODE_EFFORT_LEVEL` must be unset, since it overrides the effort each definition sets. When Claude Code lists no `ordo-<level>` agent for a level the configuration names, `spec`, `refute`, `plan-orchestration`, `diagnose` and `grill` print a warning that names the missing agent and start the agent on the runner's default agent, with no model named and no effort set, so the configured model and effort are not applied. `writing`, `code-comments`, `paper` and `paper-review` start every agent on the runner's default agent with the runner's defaults.
README.md:151:    for skill in orchestration/roadmap orchestration/grill orchestration/plan orchestration/spec orchestration/refute orchestration/land orchestration/plan-orchestration orchestration/plan-retro ordo/repo-setup ordo/ordo-init ordo/ordo-help ordo/session-retro code/code-comments code/diagnose academic/paper academic/paper-review academic/writing; do
```

Each hit read:

- `skills/academic/paper/SKILL.md:68`: the row this step changed. `:892`: names `paper-review` as the external panel review, true as it stands.
- `docs/roadmap.md:23`, `:26`, `:27`, `:117`: the entry of this plan and a dropped entry that names it. The roadmap is the closing step's, and no sentence there is made false by this step. `:33`, `:34`, `:47`, `:50`, `:93` match on `academic-paper-reviewer` or name the skill in another entry's text, unchanged.
- `docs/glossary.md:153`: the entry this step changed.
- `docs/adr/0001`, `0019`, `0022`, `0025`, `0027`: records, which name the skill as planned or as a neighbour; a record is not rewritten.
- `docs/figures/paper-review.svg:1`, `:2` and `docs/figures/gen_figures.py`: this step's figure and its code.
- `docs/figures/academic-pipeline/gen_academic_pipeline.py:56`, `:87`: `academic-paper-reviewer`, the source's name in a figure of academic-pipeline, unchanged. `:137`: the label `"paper-review, entry 6"` with the kind `todo`, and the matching lines of `academic-pipeline.svg`: see "Anything in the brief that was wrong or impossible".
- `docs/dev/scripts.md:9` and `docs/dev/building.md:37`: the two lists this step changed.
- `README.md:29`, `:31`, `:71`, `:77`, `:124`, `:151`: the row, the group sentence, the figure sentence, the alt text, the sentence on the runner's default agent and the copy loop, each changed by this step.

Sentences about a changed file as a whole, reread:

- `README.md:31`, "Installed, the seventeen skills stand side by side": the sentence lists 8, 4, 2 and 3 skills, 17.
- `README.md:162`, "The loop copies each of the seventeen skills": the loop's list at line 151 holds 17 entries.
- `README.md:71`, "The skills that launch agents each have a figure of their own": the four skills named each have a figure below, lines 73 to 79.
- `docs/dev/building.md:37`, "Every skill that launches agents has its figure under `docs/figures/`": holds, with `paper-review.svg` added.
- `docs/figures/gen_figures.py`, head comment, "Every figure but the last two shows the order of a run": the last two of `figures()` are still `paper/lifecycle.svg` and `paper/run-folder.svg`, and `paper-review.svg` shows the order of a run.

## The figure in words

`docs/figures/paper-review.svg`, titled "The full mode of the paper-review skill".

Boxes, top to bottom:

1. "Field analyst: the Reviewer Configuration Card", a solid box.
2. "You confirm the reviewer configuration", an orange box, a stop.
3. Five solid boxes in one row: "EIC, 2 calls", "Methodology reviewer, 2 calls", "Domain reviewer, 2 calls", "Perspective reviewer, 2 calls", "Devil's Advocate reviewer, 2 calls".
4. "Editorial synthesizer: the Editorial Decision and the Revision Roadmap", a solid box.
5. "EIC, resumed: the coaching question, only for a revision decision", an orange box, a stop.

Arrows:

1. Box 1 to box 2, no label.
2. Box 2 to each of the five reviewers, five arrows, no label.
3. Each of the five reviewers to box 4, five arrows, no label.
4. Box 4 to box 5, labelled "Minor or Major Revision".
5. A dotted loop on box 5, labelled "until the dialogue ends or you say just fix it".

Note: "The five reviewers start at once, each in 2 calls under the sprint contract. The other modes start these roles. Re-review: the field analyst, the EIC and the editorial synthesizer. Quick: the field analyst and the EIC. Methodology-focus: the field analyst, the EIC and the methodology reviewer. Guided: all seven, with the EIC's dialogue. Calibration: all seven, 5 times per gold paper."

The legend is the one `writing.svg` and `grill.svg` carry.

## The terms

- **panel review**, the changed entry. Its "Stated in" now reads "`skills/academic/paper-review/SKILL.md`, \"Agent prompts\"". `awk '/^## Agent prompts/,/^## Sprint Contract/' skills/academic/paper-review/SKILL.md | grep -n 'panel review'` printed line 13 of the section, "`paper-review` runs in 3 phases internally (Phase 0 field analysis -> Phase 1 panel review -> Phase 2 editorial synthesis)". The section holds the table of the panel's five reviewers and the editorial synthesizer whose synthesis gives the decision. The definition's words are unchanged.
- **session, the**: used in the words this step wrote for the Claude Code session that runs the skill ("the folder the session runs in", "The session shows the user each question", "The session places the contract"). Fits the entry.
- **stop**: used for a point of the Stops table where the run waits on the user. Fits the entry's second sense.
- **refusal**: "Unknown mode" and "A missing input" name their cause and leave nothing. Fits the entry.
- **runner**: "the runner's general-purpose agent with the runner's defaults". Fits the entry.
- **step**: "Steps 1" names an item of the skill's Steps. Fits the entry's second sense.
- **reviewer**: the words this step wrote use it for one of the five roles of the panel ("Start the five reviewers at once", "each reviewer's user content", "a reviewer's second call"), the source's sense, where the entry defines the agent that refutes a built step. See "Anything in the brief that was wrong or impossible".
- **round**: in the Stops row of `[PANEL-SHRUNK]`, "the session aborts the editorial round" uses the source's words ("abort the editorial round", `references/sprint_contract_protocol.md`, section 6), where the entry says a bare "round" is a repair round. The word is qualified as "editorial round". "the number of rounds" in re-review item 2 names the dialogue rounds of the page it points at.
- No entry is added and none but **panel review** is changed. "finding", "gate" and "plan" stand only in carried sentences.

## The files with line counts

`wc -l` after the change, and `git diff --numstat` for the changed files:

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/academic/paper-review/SKILL.md` | 534 | new | |
| `docs/figures/paper-review.svg` | 64 | new | |
| `README.md` | 249 | 8 | 5 |
| `skills/academic/paper/SKILL.md` | 1035 | 2 | 2 |
| `docs/glossary.md` | 160 | 1 | 1 |
| `docs/dev/building.md` | 39 | 1 | 1 |
| `docs/dev/scripts.md` | 45 | 1 | 1 |
| `docs/figures/gen_figures.py` | 2188 | 41 | 0 |
| `.scratch/6-paper-review/agents/reviews/2-report.md` | this report | new | |

## Judgment calls the brief left open

1. The names of the stops: "The Reviewer Configuration", "The coaching question", "The residual coaching question", "The guided review's question", "A gold set with labels on one side", "Fewer than 3 runs per paper", "`[PANEL-SHRUNK]`", "`[EXPRESSION-UNRECOGNISED]`", "Unknown mode" and "A missing input".
2. Two stops beyond those the brief lists, found by reading the source's pages. `[EXPRESSION-UNRECOGNISED]` aborts the synthesizer (`agents/editorial_synthesizer_agent.md`, line 54; `references/sprint_contract_protocol.md`, section 11). A request for 1 or 2 runs per paper is not allowed (`references/calibration_mode_protocol.md`, "Ensembling methodology notes": "Below 3, ensembling is meaningless <em dash> do not allow 1 or 2.").
3. The refusal for a manuscript that is not given is named "A missing input" and also covers re-review's two required inputs, calibration's gold set and a path that does not exist, since each is an input whose absence the layout asks to be a refusal.
4. "Unknown mode" is a call with two arguments or more whose first is none of the six names. A call with one argument takes it as the manuscript, as the brief's first call form does.
5. The stop "The Reviewer Configuration" is stated for full, quick, methodology-focus and guided, the modes whose Phase 0 configures reviewers. The source's Checkpoint Rule 1 names no mode. Re-review's Phase 0 builds a checklist, and calibration is left to its page.
6. The run folder's rule also says that `<date>` is the local date, `date +%Y-%m-%d`, as `paper` does: without it the folder's name is not determined.
7. The diagram's arrows `->` are kept in full items 1, 3 and 4.
8. "Two invocation modes:" and the label "Mode B" are left out with Mode A, and "In Mode B" reads "In phase-by-phase invocation".
9. "now" is left out of "now run two-call Phase 1", the present fact kept.
10. The Used By cells of the reference table name the roles in words ("the field analyst, the EIC").
11. The Related Skills row of `paper` stands as a second table under Use instead, with the source's two columns.
12. In guided mode the dialogue is held by the run's EIC agent, the one Phase 1 started, from the dialogue's start.
13. The contracts' headings are "The full contract" and "The methodology-focus contract", the names step 1's brief gives them, since `### full` already heads the mode under Steps.
14. "(Kong L2 verb test)" stays in point 3 of Phase 2.5, under "Where it is unclear whether an edit applies, the source's words stay."
15. Agent prompts names the four heading texts of the reviewers' pages in one sentence.
16. In the README the figure stands after `writing`'s, as the brief says, and the figure sentence names `paper-review` after `writing` to keep the order of the figures.
17. `README.md:124`, "`writing`, `code-comments`, `paper` and `paper-review` start every agent on the runner's default agent with the runner's defaults." is changed under rule 14 of the rules file: the sentence lists the skills that start agents this way, and Rules bullet 6 of the new skill makes it incomplete without the name. It serves the brief's item on `README.md`.
18. The figure's coaching box is an orange stop box whose label carries "only for a revision decision", since the script has no dashed stop.
19. The glossary's "Stated in" names "Agent prompts", the section where the words "panel review" stand.
20. The comment of the plain request's line in Quick start reads "the simplest command, a plain request: this one runs full (Steps 1)", since the mode selection logic sends other plain requests to other modes.
21. No item on a final message and no line "Stops this mode can reach" is written, since the brief names neither and the source has neither.
22. Methodology-focus starts no editorial synthesizer, as its row of the source's modes table lists the field analyst, the EIC and the methodology reviewer.
23. The source's Examples table lists 2 files, and the source's folder holds a third, `examples/subclaim_decomposition_example.md`. The table is carried with its 2 rows.

## User-visible changes, before and after

- `skills/academic/paper-review/SKILL.md`: new. Before, `/paper-review` did not exist.
- `README.md`, the skills table: a row `paper-review` after `paper`'s, new.
- `README.md:31`. Before: "`skills/academic/` holds `paper` and `writing`. Installed, the sixteen skills stand side by side". After: "`skills/academic/` holds `paper`, `paper-review` and `writing`. Installed, the seventeen skills stand side by side".
- `README.md:71`. Before: "`writing` three finding agents and a checking agent, and `code-comments` a finding agent, a checking agent and a rewrite agent." After: "`writing` three finding agents and a checking agent, `paper-review` its seven roles (the field analyst, the five reviewers and the editorial synthesizer), and `code-comments` a finding agent, a checking agent and a rewrite agent."
- `README.md:77`, new: "![The full mode of the paper-review skill: Field analyst: the Reviewer Configuration Card; You confirm the reviewer configuration, a stop; EIC, Methodology reviewer, Domain reviewer, Perspective reviewer and Devil's Advocate reviewer start at once, each in 2 calls; Editorial synthesizer: the Editorial Decision and the Revision Roadmap; EIC, resumed: the coaching question, only for a revision decision, a stop that repeats until the dialogue ends or you say just fix it.](docs/figures/paper-review.svg)".
- `README.md:124`. Before: "`writing`, `code-comments` and `paper` start every agent". After: "`writing`, `code-comments`, `paper` and `paper-review` start every agent".
- `README.md:151`. Before: "academic/paper academic/writing; do". After: "academic/paper academic/paper-review academic/writing; do".
- `README.md:162`. Before: "each of the sixteen skills". After: "each of the seventeen skills".
- `skills/academic/paper/SKILL.md:5`. Before: `version: "4.1.0"`. After: `version: "4.1.1"`.
- `skills/academic/paper/SKILL.md:68`, the Use cell. Before: "`paper-review` (roadmap entry 6, not built yet)". After: "`paper-review`".
- `docs/glossary.md:153`. Before: "Stated in: `docs/roadmap.md`, entry 6." After: "Stated in: `skills/academic/paper-review/SKILL.md`, \"Agent prompts\"."
- `docs/dev/building.md:37` and `docs/dev/scripts.md:9`. Before: "`grill.svg`, `writing.svg`, `code-comments.svg`". After: "`grill.svg`, `writing.svg`, `paper-review.svg`, `code-comments.svg`".
- `docs/figures/gen_figures.py`: the function `paper_review()` after `writing()`, the entry `("paper-review.svg", paper_review())` after `writing.svg`'s in `figures()`, and in the head comment the line "- paper-review.svg: the agents and stops of the full mode of the paper-review skill, with the roles the other five modes start in its note." The script now also prints `wrote docs/figures/paper-review.svg (12390 bytes)`.
- `docs/figures/paper-review.svg`: new.

## Anything in the brief that was wrong or impossible

1. The word "reviewer" against the glossary rule. The brief's "What it must do" holds the words this step writes to the glossary, whose entry **reviewer** defines the agent that refutes a built step. The brief also gives sentences that use the word for a role of the panel: "the session places the contract of the run's mode in each reviewer's user content" and "a reviewer's second call, after its scoring plan, goes to the same agent". Both cannot hold. The sentences stand as the brief words them, and the point is the orchestrator's: a second sense in the entry would go through `skills/ordo/repo-setup/templates/plan-terms.md`, which is outside this step's paths.
2. A label outside this step's paths still calls the skill unbuilt. `docs/figures/academic-pipeline/gen_academic_pipeline.py:137` reads `"PRV": ("paper-review, entry 6", "todo"),` and its figure draws that box as not built. The file is not among the paths this step writes, and the brief's case asks that `git status --short docs/figures/academic-pipeline` print nothing, so it is unchanged. It is a different file from the ones the step lists, and it turns false when the entry closes, not at this step.
3. The contracts stand in a reference section. `docs/dev/skill-layout.md`, "Writing for an agent", asks that material only some runs read stand in `references/`, and a reference section hold only material every run reads. The two contracts are read only by full and methodology-focus runs. They stand in `## Sprint Contract Protocol` all the same, as the brief decides under ruling Open item 2-contracts, since the entry adds no file to the source's set.
4. The source disagrees with itself on when Phase 2.5 runs: the diagram says "Decision = Minor/Major Revision" and Checkpoint Rule 5 says "Decision is not Accept". Both are carried, as a copy keeps them.

## Round 1

Every ruling of `.scratch/6-paper-review/agents/briefs/2-round-1.md` is done. Where this section and a section above differ, this section gives the text as it now stands. One point is not covered by a ruling and is unchanged: "quick" item 2 starts the EIC and names no contract, and quick has no contract either; ruling 1 names "re-review" and "calibration" only.

### Per finding, the change and the text as it now reads

1. Spec 1, `skills/academic/paper-review/SKILL.md`, Steps.
   - "guided" item 1 now reads: "Run Phase 0 as full items 1 and 2 say, then start the five reviewers at once, each in one call, with no sprint contract, with what `references/guided_mode_protocol.md`, "How It Works", changes." Its last line reads: "Done when the five reports stand in the run folder."
   - "re-review" item 1 now reads: "Start the agents of the row `re-review` of the modes table, in the phases `references/re_review_mode_protocol.md`, "How It Works", gives, each in one call, with no sprint contract."
   - "calibration" item 2 now reads: "Run the phases after the intake as that page gives them, each reviewer in one call, with no sprint contract."
   - No item of the three modes names a stop of the contract.
2. Spec 2, `docs/figures/gen_figures.py`, the note of `paper_review()`. It now reads: "The five reviewers start at once, each in 2 calls under the sprint contract. The other modes start these roles. Re-review: the field analyst, the EIC and the editorial synthesizer. Quick: the field analyst and the EIC. Methodology-focus: the field analyst, the EIC and the methodology reviewer. Guided: the field analyst and the five reviewers, then the EIC's dialogue. Calibration: all seven, 5 times per gold paper."
   - The other modes' sentences were read against their steps and stand unchanged: re-review item 1 starts the agents of its row (the field analyst, the EIC, the editorial synthesizer); quick items 1 and 2 start the field analyst and the EIC; methodology-focus items 1 and 2 start the field analyst, the EIC and the methodology reviewer; calibration runs `full` 5x per paper, all 7 agents, as its row and its section say.
   - `python3 docs/figures/gen_figures.py` was run again and wrote `docs/figures/paper-review.svg`; `git status --short docs/figures` shows no other figure changed.
3. Spec 3, `skills/academic/paper-review/SKILL.md`.
   - Steps 1, the bullets now read: "In a call `/paper-review <mode> ...` the first argument, one of the six mode names, is the mode." / "A call whose first argument is one word that is neither one of the six mode names nor a path that exists, followed by a path that exists, is the refusal "Unknown mode"." / "Every other call whose first argument is no mode name takes all its arguments as the manuscript, a path or pasted text, and runs `full`." / "A plain request gets its mode from the mode selection logic above and the Quick Mode Selection Guide below." / "A call that lacks an input its mode's line of Quick start requires, or whose revision roadmap or gold set folder does not exist, is the refusal "A missing input"."
   - Stops, the row "Unknown mode", When: "The first argument is one word that is neither one of the six mode names nor a path that exists, and a path that exists follows it (Steps 1)".
   - Stops, the row "A missing input", When: "The call lacks an input its mode's line of Quick start requires, or its revision roadmap or gold set folder does not exist (Steps 1)". This row and its bullet of Steps 1 no longer refuse a manuscript argument that names no existing file, since ruling 3 takes such an argument as pasted text; the change is the agreement ruling 3 asks of the bullets of Steps 1.
   - Quick start, the comment of the first line: "review the paper, a path or pasted text, with the full panel: 5 review reports, the Editorial Decision and the Revision Roadmap". The comment of the second line: "the same review, with the mode named; a first word that is no mode name is taken as the manuscript".
4. Spec 4, What it reads 1 now reads: "The manuscript, as a file or as pasted text, read in every mode but calibration. A call of such a mode that gives none is the refusal "A missing input"."
5. Spec 5, Agent prompts: the sentence "Each reviewer's page states them under `## Phase Boundary` and `## Sprint Contract Protocol`, with the two calls under `### Phase 1: Paper-content-blind pre-commitment` and `### Phase 2: Paper-visible review`." is removed. The paragraph ends on the source's "both apply: neither overrides the other."
6. The glossary entry **panel review**, `docs/glossary.md:153`, now ends: "Stated in: `skills/academic/paper-review/SKILL.md`, the opening paragraph." The definition's words are unchanged.

### Every sentence the round wrote

- "Run Phase 0 as full items 1 and 2 say, then start the five reviewers at once, each in one call, with no sprint contract, with what `references/guided_mode_protocol.md`, "How It Works", changes."
- "Done when the five reports stand in the run folder."
- The clause ", each in one call, with no sprint contract" in "re-review" item 1.
- The clause ", each reviewer in one call, with no sprint contract" in "calibration" item 2.
- "A call whose first argument is one word that is neither one of the six mode names nor a path that exists, followed by a path that exists, is the refusal "Unknown mode"."
- "Every other call whose first argument is no mode name takes all its arguments as the manuscript, a path or pasted text, and runs `full`."
- "A call that lacks an input its mode's line of Quick start requires, or whose revision roadmap or gold set folder does not exist, is the refusal "A missing input"."
- The two When cells of Stops and the two Quick start comments quoted under finding 3.
- "The manuscript, as a file or as pasted text, read in every mode but calibration. A call of such a mode that gives none is the refusal "A missing input"."
- In the figure's note: "Guided: the field analyst and the five reviewers, then the EIC's dialogue."
- In the glossary: "Stated in: `skills/academic/paper-review/SKILL.md`, the opening paragraph."

### The checks, as printed

- The character-set check of "Verify before you report" 1 printed no line; exit status 0.
- `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`
- `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1`: `PASS: pin.sh scratch tests`
- The contracts' ids, the command of the case: `2`, `reviewer/reviewer_full/v1 5 ['F1', 'F2', 'F3', 'F0']`, `reviewer/reviewer_methodology_focus/v1 2 ['F1', 'F2', 'F0']`
- The frontmatter, the command of the case: `paper-review 532 {'version': '1.0.0'}`
- `grep -n '^## ' skills/academic/paper-review/SKILL.md`: `12:## Quick start`, `32:## Use instead`, `43:## What it reads`, `77:## Steps`, `256:## Agent prompts`, `280:## Sprint Contract Protocol`, `435:## Review output`, `453:## Integration`, `475:## Quality standards`, `489:## Stops`, `506:## Anti-patterns`, `520:## Rules`
- `grep -c 'sixteen' README.md`: `0`. `grep -c 'seventeen' README.md`: `2`
- The contracts equal to the two files, the command of the case: `True`
- Anti-patterns rows and Quality standards rows, the two commands of row 4b above: `7` and `9`
- The Checkpoint Rules and the Devil's Advocate's 8 bullets, by reading: unchanged by the round, as rows 4c and 4d above say.
- `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`: `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22040 bytes)`, exit 0; `git status --short docs/figures/academic-pipeline` printed nothing.
- `python3 docs/figures/gen_figures.py`: among its lines `wrote docs/figures/paper-review.svg (12421 bytes)`, exit 0; `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and `?? docs/figures/paper-review.svg`.
- The grep for names that do not exist here ("Verify before you report" 5) printed nothing.
