# Step 14 report: every coverage row of deep-research checked against its file (after repair round 1)

Everything in the brief and in the nine rulings of repair round 1 is done. Three places outside this step's paths are false after it and are the orchestrator's to change: `docs/roadmap.md` line 120 (entry 15.A's goal says "8 for paper, 6 for literature, 3 for paper-review, 1 for researcher"; `grep -c '| rebuild later: paper |' docs/academic-coverage.md` prints 6, `grep -c '| rebuild later: researcher |'` prints 0, `grep -c '| rebuild later: '` prints 15); `docs/roadmap.md` line 122 (entry 15.A's "Waits on: 5, 6, 9 and 13, the skills the rows go to", false for 13 now that no `rebuild later: researcher` row is left); and open item M in `orchestrator-state.md` line 76 with `plan.md` line 100, which give 18 (8, 6, 3, 1) and `rebuild:` counts that changed by this step (in this section literature +3, paper +2, researcher +1, paper-review -1).

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


## The cases' first run, on the unchanged list

Run as `python3 .agents/b14/cases.py` (gitignored folder in the worktree) before any row changed: coverage check `ok: docs/academic-coverage.md`, exit 0; 52 rows and 52 files, sets equal, lines outside the section unchanged; 0 records (the file did not exist yet, the expected failure); 0 changed rows, 0 fixed records; largest sentence 35 words, none over 35. No case showed a rule of the brief wrong.

## The five cases after repair round 1, in full

The line-outside case now allows line 55 and no other line, as the round's path list says.

```
case 1: coverage check prints 'ok: docs/academic-coverage.md', exit 0
line 55 changed: True
section: 52 rows; files: 52; row set equals file set: True; lines outside 55 and 182-237 unchanged: True
case 2: records 52 (files 52); duplicates []; missing []; in section order True; lines-read mismatches []
case 3: changed 23 ['SKILL.md', 'agents/bibliography_agent.md', 'agents/devils_advocate_agent.md', 'agents/editor_in_chief_agent.md', 'agents/ethics_review_agent.md', 'agents/report_compiler_agent.md', 'agents/research_architect_agent.md', 'agents/research_question_agent.md', 'agents/socratic_mentor_agent.md', 'agents/source_verification_agent.md', 'agents/synthesis_agent.md', 'agents/timeline_extraction_agent.md', 'examples/idea_diversity_coverage_gap_advisory.md', 'references/argumentation_reasoning_framework.md', 'references/cross_agent_quality_definitions.md', 'references/ethics_checklist.md', 'references/failure_paths.md', 'references/interdisciplinary_bridges.md', 'references/irb_decision_tree.md', 'references/mode_selection_guide.md', 'references/socratic_mode_protocol.md', 'references/socratic_questioning_framework.md', 'templates/research_brief_template.md']; fixed 23; changed not fixed []; fixed unchanged []
case 4: largest sentence before 35 (agents/bibliography_agent.md); after 35 (agents/bibliography_agent.md)
case 4: sentences over 35 words now: []
case 5: SKILL.md: lost []; added ['`academic-paper/agents/intake_agent.md`', '`academic-paper/references/writing_quality_check.md`', '`agents/monitoring_agent.md`', '`agents/research_architect_agent.md`', '`docs/dev/skill-layout.md`', '`examples/handoff_to_paper.md`', '`literature`', '`metadata.version`', '`researcher`', '`scripts/check_pipeline_integrity.py`', '`shared/mode_spectrum.md`', '`templates/research_brief_template.md`', '`tw-hei-intelligence`', '`writing`', 'entry 13', 'entry 15.A', 'entry 3', 'entry 5', 'paper', 'writing']
case 5: agents/bibliography_agent.md: lost []; added ['`.bib`', '`academic-pipeline/agents/pipeline_orchestrator_agent.md`', '`academic-pipeline/references/literature_corpus_consumers.md`', '`phase{M}_*/`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: agents/devils_advocate_agent.md: lost []; added ['`academic-paper-reviewer/agents/devils_advocate_reviewer_agent.md`', '`paper-review`', '`paper`']
case 5: agents/editor_in_chief_agent.md: lost []; added ['`references/apa7_style_guide.md`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13', 'literature']
case 5: agents/ethics_review_agent.md: lost []; added ['`academic-paper/SKILL.md`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: agents/report_compiler_agent.md: lost []; added ['`academic-paper/agents/abstract_bilingual_agent.md`', '`academic-paper/agents/intake_agent.md`', '`academic-pipeline/agents/claim_ref_alignment_audit_agent.md`', '`academic-pipeline/agents/pipeline_orchestrator_agent.md`', '`agents/editor_in_chief_agent.md`', '`agents/ethics_review_agent.md`', '`literature`', '`templates/research_brief_template.md`', '`writing`', 'entry 15.A', 'entry 3', 'entry 5', 'writing']
case 5: agents/research_architect_agent.md: lost []; added ['`agents/ethics_review_agent.md`', '`paper`', '`references/equator_reporting_guidelines.md`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 5']
case 5: agents/research_question_agent.md: lost []; added ['`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: agents/socratic_mentor_agent.md: lost []; added ['`academic-paper-reviewer/SKILL.md`', '`academic-paper/agents/socratic_mentor_agent.md`', '`paper`', '`rebuttal`', 'entry 15.A', 'entry 7', 'paper']
case 5: agents/source_verification_agent.md: lost []; added ['`references/source_quality_hierarchy.md`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: agents/synthesis_agent.md: lost []; added ['`academic-pipeline/agents/claim_ref_alignment_audit_agent.md`', '`academic-pipeline/agents/pipeline_orchestrator_agent.md`', '`paper`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: agents/timeline_extraction_agent.md: lost []; added ['`academic-pipeline/agents/pipeline_orchestrator_agent.md`', '`agents/report_compiler_agent.md`', '`researcher`', '`scripts/check_pipeline_integrity.py`', 'entry 13']
case 5: examples/idea_diversity_coverage_gap_advisory.md: lost []; added ['`agents/socratic_mentor_agent.md`', '`idea`']
case 5: references/argumentation_reasoning_framework.md: lost ['paper', 'researcher']; added ['`academic-paper-reviewer`', '`academic-paper`', '`paper-review`', '`paper`', '`researcher`', 'entry 13']
case 5: references/cross_agent_quality_definitions.md: lost []; added ['`agents/bibliography_agent.md`', '`researcher`', '`shared/handoff_schemas.md`', 'entry 13']
case 5: references/ethics_checklist.md: lost []; added ['`academic-paper/agents/citation_compliance_agent.md`', '`paper`', 'entry 5', 'literature']
case 5: references/failure_paths.md: lost []; added ['entry 13', 'entry 5']
case 5: references/interdisciplinary_bridges.md: lost []; added ['`agents/research_architect_agent.md`', '`researcher`', 'entry 13', 'literature']
case 5: references/irb_decision_tree.md: lost ['paper']; added ['`paper`', 'entry 5']
case 5: references/mode_selection_guide.md: lost []; added ['`literature`', '`researcher`', '`templates/research_brief_template.md`', 'entry 13', 'entry 15.A']
case 5: references/socratic_mode_protocol.md: lost []; added []
case 5: references/socratic_questioning_framework.md: lost []; added ['`agents/socratic_mentor_agent.md`']
case 5: templates/research_brief_template.md: lost []; added ['`agents/report_compiler_agent.md`', '`paper`', '`references/apa7_style_guide.md`', 'entry 5']
marks before -> after: [('agents/editor_in_chief_agent.md', 'drop', 'rebuild: literature'), ('agents/ethics_review_agent.md', 'rebuild later: paper', 'rebuild: paper'), ('agents/research_architect_agent.md', 'rebuild later: researcher', 'rebuild: researcher'), ('references/argumentation_reasoning_framework.md', 'rebuild: paper-review', 'rebuild: literature'), ('references/ethics_checklist.md', 'rebuild later: paper', 'rebuild: paper'), ('references/interdisciplinary_bridges.md', 'drop', 'rebuild: literature')]
ALL CASES PASS
```

## Verify before you report

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0, printed:

```
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

2. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0.
3. `grep -c '^| [0-9][0-9]* | `' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/14-rows.md` printed `52`.
4. `awk 'NR>=182 && NR<=237' docs/academic-coverage.md | python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin if l.startswith("| `") for s in re.split(r"(?<=[.!?])\s+", l.rstrip("\n").split(" | ",2)[2].rstrip(" |"))))'` printed `35`. Row 55's longest sentence is 28 words.

## Result table

| Item | State | Proof |
|---|---|---|
| 1. Every file read, every row checked | DONE | case 2 above: 52 records, none missing, in section order, every `1-<n>` equal to `wc -l` |
| 2. Each defective row fixed in place | DONE | case 3 above: 23 changed, 23 fixed, no difference between the two sets |
| 3. Shortening never loses a destination | DONE | case 5 above: the only entries under "lost" are plain `paper` and `researcher` now written in backticks, in two rows |
| 4. The 15.A deferrals | DONE | each deferral names the skill and its `rebuild later` file: `templates/research_brief_template.md`, `agents/monitoring_agent.md`, `agents/timeline_extraction_agent.md` itself, `academic-paper/agents/socratic_mentor_agent.md` |
| 5. The records | DONE | verify item 3 above prints 52 |
| Coverage check, verify runner, largest sentence | DONE | quoted above |
| ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md <ledger>/14-rows.md <ledger>/14-report.md .agents/b14/*.py` prints nothing |

## Files changed

- `docs/academic-coverage.md`, 237 lines: 24 lines changed against the base copy (`diff .agents/b14/base-full.md docs/academic-coverage.md | grep -c '^>'` prints 24): line 55 and lines 186-190, 193-195, 197-200, 204, 210, 213, 218-221, 225, 227-228, 235.
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/14-rows.md`, 58 lines (`wc -l`).
- `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/14-report.md`, 207 lines (`wc -l`).
- Outside the path list and gitignored (`.gitignore` line 2, `.agents/*`): the builder's scripts and notes in `.agents/b14/`.

## Repair round 1

| Ruling | State | What the row says now, and the command that proves it |
|---|---|---|
| 1. Ethics parts with no destination (rows 190, 218) | DONE | Row 190: `paper` takes whether human data is involved, the approval, consent obtained and de-identification; the review-level determination, consent-form elements, vulnerable-population protections and ethics training (agent 104-105, 107-108) are dropped, since they plan data collection under the approving board and the paper states that approval. Row 218: labelling AI-generated data and never citing AI-generated content go to `paper` with the AI disclosure; the notes on training bias and knowledge cutoff (133-134) are dropped, since sources come from live index searches and every claim traces to a retrieved source; the ethics-training item (190) is dropped with the study-planning sections. `grep -c 'ethics training' docs/academic-coverage.md` prints 1 and `grep -c 'ethics-training item' docs/academic-coverage.md` prints 1. |
| 2. Layer 5 questions' rebuttal reader (row 197) | DONE | Row 197: "`rebuttal` (entry 7) asks the three paper-anchored Layer 5 questions of the revised paper in the revision coaching that `academic-paper-reviewer/SKILL.md` sends it", beside `paper` at 15.A with `academic-paper/agents/socratic_mentor_agent.md` (mentor 257; reviewer SKILL.md 153-160; row 120 sends the coaching to `rebuttal`). `sed -n '197p' docs/academic-coverage.md \| grep -c 'rebuttal. (entry 7)'` prints 1. |
| 3. Timeline sidecar files (row 200) | DONE | The three sidecar records (18-20) are the file's own output and come with it at 15.A; until then the report's temporal rule falls back to each source's year, as `agents/report_compiler_agent.md` 114-116 allows; the schemas go with the passport; only the phase folders take the stage-order reason. `sed -n '200p' docs/academic-coverage.md \| grep -c 'sidecar records'` prints 1. |
| 4. Abstract-only protections (rows 193, 55) | DONE | Row 55 now says: "It also takes the abstract-only protections of `deep-research/agents/report_compiler_agent.md`: a word budget kept below the hard cap, protected hedging phrases kept, and explicit time bounds in a reflexivity statement. An abstract never claims an audit that did not run." (report_compiler_agent.md 200-207). Case line "line 55 changed: True" and "lines outside 55 and 182-237 unchanged: True" above. |
| 5. Record 42, socratic_mode_protocol row | DONE | The protocol's 15-round end (its line 68; the refuter cited 67, which is the 10-round suggestion) is not the mentor's: the mentor ends at 40 or 60 turns (549, 598) and treats 10 or 15 rounds without a new insight as stagnation that suggests full research (597). Row 227 now drops the 15-round end with that reason; record 42 is `fixed`. Case 3 lists `references/socratic_mode_protocol.md` among the 23 changed and fixed rows. |
| 6. Repeated phase-boundary sentence (rows 187, 189, 190, 194, 195, 198, 199, 200) | DONE | Each row words its own boundary (bibliography and search report; the editor's review phase; when the ethics check runs; the blueprint's phase one; the interview as its own skill; the verifier's report; what follows synthesis; the records' phase-two folders) and keeps `researcher` (entry 13) and `scripts/check_pipeline_integrity.py`. `python3 -c 'import re,collections; L=open("docs/academic-coverage.md").read().split("\n"); c=collections.Counter(s for l in L[181:237] if l.startswith("\| `") for s in set(re.split(r"(?<=[.!?])\s+", l.split(" \| ",2)[2].rstrip(" \|")))); print("repeated sentences:", [s for s,n in c.items() if n>1])'` prints `repeated sentences: []` (each `\|` stands for a plain bar, escaped for this table). |
| 7. Style profile optional (rows 186, 193) | DONE | Row 186: "When a style profile is available, it applies it to its summary and synthesis as an optional guide, so it does not wait for the one `paper` builds at entry 5". Row 193: "applies a style profile only when one is available". `grep -c 'style profile is available\|style profile only when one is available' docs/academic-coverage.md` prints 2. |
| 8. The report | DONE | The verify runner's printed lines are quoted above; the files changed are listed with their line counts; roadmap line 122 is named beside line 120 in the first paragraph. |
| 9. The twenty holds rows the reviewer did not read | DONE | Listed below with the lines that decide each verdict; the same lines are in their records in `14-rows.md`. |

### The deciding lines of the twenty rows the reviewer did not read

| Record | File | Verdict | Deciding lines |
|---|---|---|---|
| 11 | `agents/risk_of_bias_agent.md` | holds | RoB 2 domains and algorithm (40-69), ROBINS-I (70-97), traffic-light output (130-178), education edge cases (186-189); all serve the included clinical and social-science studies of the systematic-review mode. |
| 16 | `examples/exploratory_research.md` | holds | The phases (8-150) show each agent's output on AI in higher-education quality assurance, from the question brief (10-36) to revision 1 (138-150); no step outside the agents' rules. |
| 20 | `examples/policy_analysis.md` | holds | Phases 1-6 (8-153) on performance-based funding in OECD systems; a policy topic and a run that follows the agents' rules. |
| 21 | `examples/review_mode.md` | holds | Editor (55-110), ethics (111-168) and devil's advocate (169-227) reviews of a policy text, merged into one list (228-253). |
| 22 | `examples/socratic_guided_research.md` | holds | Twelve rounds through the five layers (18-263) to a research plan summary (264-331), as the mentor prescribes. |
| 23 | `examples/systematic_review.md` | holds | Search strategy with four databases and counts (12-43), graded sources (65-83), matrix (86-95), gaps and contradictions (113-126), each an agent's stated step. |
| 24 | `references/apa7_style_guide.md` | holds | Formatting and headings (6-24), citations (25-50), reference forms (51-104), tables, figures and numbers (123-152): APA only. |
| 27 | `references/changelog.md` | holds | Version entries (1-12) and the history heading (13); no rule. |
| 29 | `references/crossref_api_protocol.md` | holds | DOI hits gated by a 0.70 title check (27), title search at 0.70 (35), backoff on 429 (50), the field omitted when Crossref is unavailable (53). |
| 30 | `references/openalex_api_protocol.md` | holds | DOI hits gated by 0.70 (25), title search with the same rule and a year tie-break (33), backoff (47), the field omitted when unavailable (50). |
| 31 | `references/semantic_scholar_api_protocol.md` | holds | Title and DOI lookups with a 0.70 match (27, 35), tiers (47-55), not found only after all tiers (75-78), backoff (82), duplicates by S2 ID (89-91). |
| 37 | `references/literature_monitoring_strategies.md` | holds | Per-service setup for Google Scholar, PubMed, RSS, Retraction Watch, preprint servers and citation tracking (9-186), with the AI/ML cadence (202); the monitor's own setup, later than the first run. |
| 41 | `references/preregistration_guide.md` | holds | Decision tree (8-61), platforms (62-87), 21-item checklist (88-139), higher-education examples (140-199), disclosure templates (200-231) and registered reports (232-285) all concern registering hypothesis tests before data collection. |
| 42 | `references/socratic_mode_protocol.md` | fixed | The protocol's layers (10-60), rounds per layer (64), skipping (65), reply length (66) and probe (71-77) are in the mentor (161-265, 526-527, 20, 267-384); its 15-round end (68) is dropped against the mentor's 549, 597, 598 (ruling 5). |
| 44 | `references/source_quality_hierarchy.md` | holds | Pyramid (6-111), grading by fitness with the integrity floor and median (112-150), field table with no ML row (152-163), predatory indicators (165-188). |
| 45 | `references/systematic_review_protocol.md` | holds | Five-phase PICOS, PRISMA, RoB and meta-analysis pipeline (8-87) and its checkpoint rules (89-95). |
| 46 | `references/systematic_review_toolkit.md` | holds | Cochrane stages (9-32), PRISMA 27 items and flow diagram (36-147), RoB 2 and ROBINS-I (151-206), I-squared (210-224), GRADE (228-265), registration (269-295), software (299-320). |
| 49 | `templates/preregistration_template.md` | holds | The 21 OSF items (18-277), ethics, data and materials (281-304) and the checklist (308-318) fill the form of the dropped guide. |
| 51 | `templates/prisma_protocol_template.md` | holds | PRISMA-P administrative, PICOS, search blocks, screening, extraction, RoB, synthesis, meta-bias and GRADE sections (11-224) and appendices (228-248). |
| 52 | `templates/prisma_report_template.md` | holds | The 27 PRISMA 2020 items mapped to sections (11-390), with the flow diagram (202-251) and GRADE table (321-328). |

## Rows changed

Section marks after: 22 drop, 19 `rebuild: literature`, 4 `rebuild later: literature`, 3 `rebuild: idea`, 2 `rebuild: paper`, 2 `rebuild: researcher` (52 rows). Row 55 outside the section keeps `rebuild: paper`.

| Row | Before | After | Why |
|---|---|---|---|
| `SKILL.md` | rebuild: literature | rebuild: literature | quick brief and monitoring with their 15.A files; optional style profile; writing check, disclosure, handoff, routing, version, spectrum and integration parts given destinations or reasons |
| `agents/bibliography_agent.md` | rebuild: literature | rebuild: literature | corpus flow to the `.bib`; passport, APA and phase-boundary drops given reasons |
| `agents/devils_advocate_agent.md` | rebuild: literature | rebuild: literature | literature keeps the concession protocol and the consented second-model critique; disclosure question to `paper` |
| `agents/editor_in_chief_agent.md` | drop | rebuild: literature | finding 12: it drives the report's two-loop revision |
| `agents/ethics_review_agent.md` | rebuild later: paper | rebuild: paper | finding 13: entry 5's disclosure and ethics statements need these checks; study-planning items dropped with a reason |
| `agents/report_compiler_agent.md` | rebuild: literature | rebuild: literature | revision reviewers named; quick structure to 15.A; optional style profile; abstract-only, APA, layer and manifest parts given destinations or reasons |
| `agents/research_architect_agent.md` | rebuild later: researcher | rebuild: researcher | entry 13's goal proposes a new method and the next experiments |
| `agents/research_question_agent.md` | rebuild: idea | rebuild: idea | phase boundary dropped with a reason |
| `agents/socratic_mentor_agent.md` | rebuild: idea | rebuild: idea | wording advisory to `idea`; Layer 5 paper questions to `rebuttal` (entry 7) and `paper` at 15.A; drops given reasons |
| `agents/source_verification_agent.md` | rebuild: literature | rebuild: literature | seven levels graded by fitness, consistent with row 229; phase boundary dropped |
| `agents/synthesis_agent.md` | rebuild: literature | rebuild: literature | locator kept; marker and manifest drops given reasons; phase boundary dropped |
| `agents/timeline_extraction_agent.md` | rebuild later: literature | rebuild later: literature | sidecar records with the file at 15.A; schemas and phase folders dropped with reasons |
| `examples/idea_diversity_coverage_gap_advisory.md` | drop | drop | the wording advisory now has a destination |
| `references/argumentation_reasoning_framework.md` | rebuild: paper-review | rebuild: literature | finding 9: its users are literature agents; no reviewer or paper file reads it |
| `references/cross_agent_quality_definitions.md` | rebuild: literature | rebuild: literature | why the source counts are left out; handoff-schema pointer dropped |
| `references/ethics_checklist.md` | rebuild later: paper | rebuild: paper | finding 13; AI-specific data checks and training item given dispositions; study-planning sections dropped with a reason |
| `references/failure_paths.md` | rebuild: literature | rebuild: literature | reason for dropping the Chinese-literature path; entries named |
| `references/interdisciplinary_bridges.md` | drop | rebuild: literature | its patterns, search expansion and pitfalls are literature search and synthesis moves |
| `references/irb_decision_tree.md` | drop | drop | checklist now at entry 5; reasons for the dropped sections |
| `references/mode_selection_guide.md` | rebuild: literature | rebuild: literature | quick routing to 15.A; systematic routing dropped; pipeline mappings to `researcher` |
| `references/socratic_mode_protocol.md` | drop | drop | reason for dropping the 15-round end |
| `references/socratic_questioning_framework.md` | rebuild: idea | rebuild: idea | reasons for dropping the overlay and the alignment table |
| `templates/research_brief_template.md` | rebuild later: literature | rebuild later: literature | APA form dropped; AI disclosure line to `paper` |
| `academic-paper/agents/abstract_bilingual_agent.md` (line 55) | rebuild: paper | rebuild: paper | names the abstract-only protections row 193 sends it |

## Findings 9, 12 and 13 (ethics rows)

- Finding 9 holds and is fixed. `grep -rln argumentation_reasoning_framework` over research-hub's `.agents/skills` finds only `deep-research/SKILL.md` (line 446); the file's table (60-68) names synthesis, devil's advocate and verifier (literature), mentor (idea) and architect (researcher). Row re-marked `rebuild: literature`; `paper-review` and `paper` named as not users.
- Finding 12 holds and is fixed. `agents/report_compiler_agent.md` 154-171 take revision feedback from this editor; its five dimensions (34-77), strengths and weaknesses (97-98), fixes (165) and no Accept with a critical issue (167) review the report. Row re-marked `rebuild: literature`.
- Finding 13, ethics rows, holds and is fixed: both rows `rebuild: paper` (entry 5). Entry 5's goal (`docs/roadmap.md` line 43) names disclosure statements; `academic-paper/SKILL.md` line 447 asks for an ethics statement "when applicable (human subjects, sensitive data)"; `projects/archive/published/2025/go-bttr/manuscript/main.tex` line 117 and `projects/manuscripts/meseret-cirrhosis/notes/thesis/main.tex` line 550 carry one for patient data.

## Anything in the brief that was wrong

Nothing. Its counts matched the base copy taken before the first edit (`.agents/b14/base-section.md`): 52 files and rows, the coverage check `ok:`, and marks 24 drop, 16 `rebuild: literature`, 4 `rebuild later: literature`, 3 `rebuild: idea`, 2 `rebuild later: paper`, 1 `rebuild: paper-review`, 1 `rebuild: researcher`, 1 `rebuild later: researcher`.
