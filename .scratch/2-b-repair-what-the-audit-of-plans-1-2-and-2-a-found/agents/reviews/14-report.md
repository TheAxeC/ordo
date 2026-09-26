# Step 14 report: every coverage row of deep-research checked against its file

Everything in the brief is done. Two changes follow from it outside this step's paths and are the orchestrator's: entry 15.A's goal in `docs/roadmap.md` line 120 says "8 for paper, 6 for literature, 3 for paper-review, 1 for researcher", and after this step `grep -c '| rebuild later: paper |' docs/academic-coverage.md` prints 6 and `grep -c '| rebuild later: researcher |'` prints 0 (`grep -c '| rebuild later: '` prints 15). Open item M quotes the same 18 and the per-skill `rebuild:` counts, which change by this step (literature +3, paper +2, researcher +1, paper-review -1 in this section).

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

The cases are checks in `.agents/b14/cases.py` (gitignored, under the worktree), run as `python3 .agents/b14/cases.py` from the worktree root before any row changed.

- Coverage check: `ok: docs/academic-coverage.md`, exit 0.
- Section against the file list: 52 rows, 52 files, the sets equal, lines outside 182-237 unchanged.
- Record count: 0 records, since `14-rows.md` did not exist yet; this case failed as expected on the unchanged list.
- Changed rows against fixed records: 0 changed, 0 fixed.
- Largest sentence: 35 words (`agents/bibliography_agent.md`), none over 35.
- Destinations per changed row: no changed row, so no list.

No case showed the brief's rules wrong.

## Result table

| Item | State | Command and its summary line |
|---|---|---|
| 1. Every file read, every row checked | DONE | 52 files read whole; `python3 .agents/b14/cases.py` case 2: "records 52 (files 52); duplicates []; missing []; in section order True; lines-read mismatches []" |
| 2. Each defective row fixed in place | DONE | 22 rows changed; case 3: "changed 22 ...; fixed 22; changed not fixed []; fixed unchanged []" |
| 3. Shortening never loses a destination | DONE | case 5 lists per changed row; the only destinations absent afterwards are plain "paper" and "researcher" in two rows, now written in backticks; `paper-review` and `paper` in the argumentation row are named as not users (record 25 gives the grep that shows it) |
| 4. The 15.A deferrals | DONE | every deferral in a changed row names the skill and its `rebuild later` file (`templates/research_brief_template.md`, `agents/monitoring_agent.md`, `academic-paper/agents/socratic_mentor_agent.md`); every drop has a reason on the file's lines |
| 5. The records, 52 | DONE | `grep -c '^| [0-9][0-9]* | \`' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/14-rows.md` prints 52 |
| Verify runner | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: exit 0, 11 `PASS:` lines, 10 `ok:` lines, `verify: 13 commands passed` |
| Coverage check | DONE | `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok: docs/academic-coverage.md`, exit 0 |
| Largest sentence | DONE | `awk 'NR>=182 && NR<=237' docs/academic-coverage.md \| python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin if l.startswith("\| \`") for s in re.split(r"(?<=[.!?])\s+", l.rstrip("\n").split(" \| ",2)[2].rstrip(" \|"))))'` prints 35; before and after 35 (case 4) |
| ASCII | DONE | `LC_ALL=C grep -n '[^ -~]'` over the doc, `14-rows.md` and the two scripts prints nothing |
| Only the brief's paths written | DONE | `docs/academic-coverage.md` lines 182-237 (case: lines outside unchanged True), `14-rows.md`, `14-report.md`; scripts under the gitignored `.agents/b14/` |

(In the largest-sentence command above, each `\|` stands for a plain `|` escaped for this table; the command run was `awk 'NR>=182 && NR<=237' docs/academic-coverage.md | python3 -c 'import re,sys; print(max(len(s.split()) for l in sys.stdin if l.startswith("| `") for s in re.split(r"(?<=[.!?])\s+", l.rstrip("\n").split(" | ",2)[2].rstrip(" |"))))'`.)

## Rows changed

Section marks after: 22 drop, 19 `rebuild: literature`, 4 `rebuild later: literature`, 3 `rebuild: idea`, 2 `rebuild: paper`, 2 `rebuild: researcher` (52 rows).

| Row | Before | After | Why |
|---|---|---|---|
| `SKILL.md` | rebuild: literature | rebuild: literature | quick brief and monitoring named with their 15.A files; style, writing check, disclosure, handoff, routing, version, spectrum and integration parts each given a destination or reason |
| `agents/bibliography_agent.md` | rebuild: literature | rebuild: literature | corpus flow to the `.bib`; passport, APA and phase-boundary drops given reasons |
| `agents/devils_advocate_agent.md` | rebuild: literature | rebuild: literature | literature keeps the concession protocol and the consented second-model critique; disclosure question to `paper` |
| `agents/editor_in_chief_agent.md` | drop | rebuild: literature | finding 12: it drives the report's two-loop revision |
| `agents/ethics_review_agent.md` | rebuild later: paper | rebuild: paper | finding 13: entry 5's disclosure and ethics statements need these checks |
| `agents/report_compiler_agent.md` | rebuild: literature | rebuild: literature | revision reviewers named; quick structure to 15.A with its file; abstract-only, style, writing, APA, layer and manifest parts given destinations or reasons |
| `agents/research_architect_agent.md` | rebuild later: researcher | rebuild: researcher | entry 13's goal proposes a new method and the next experiments; drops given reasons |
| `agents/research_question_agent.md` | rebuild: idea | rebuild: idea | phase boundary dropped with a reason |
| `agents/socratic_mentor_agent.md` | rebuild: idea | rebuild: idea | wording advisory to `idea`; Layer 5 paper questions to `paper` at 15.A; drops given reasons |
| `agents/source_verification_agent.md` | rebuild: literature | rebuild: literature | seven levels kept, graded by fitness, consistent with row 229; phase boundary dropped |
| `agents/synthesis_agent.md` | rebuild: literature | rebuild: literature | locator kept; marker and manifest drops given reasons; phase boundary dropped |
| `agents/timeline_extraction_agent.md` | rebuild later: literature | rebuild later: literature | phase boundary, sidecars and schemas dropped with a reason |
| `examples/idea_diversity_coverage_gap_advisory.md` | drop | drop | the wording advisory now has a destination |
| `references/argumentation_reasoning_framework.md` | rebuild: paper-review | rebuild: literature | finding 9: its users are literature agents; no reviewer or paper file reads it |
| `references/cross_agent_quality_definitions.md` | rebuild: literature | rebuild: literature | why the source counts are left out; handoff-schema pointer dropped |
| `references/ethics_checklist.md` | rebuild later: paper | rebuild: paper | finding 13, as the ethics agent; study-planning sections dropped with a reason |
| `references/failure_paths.md` | rebuild: literature | rebuild: literature | reason for dropping the Chinese-literature path; entries named |
| `references/interdisciplinary_bridges.md` | drop | rebuild: literature | its patterns, search expansion and pitfalls are literature search and synthesis moves |
| `references/irb_decision_tree.md` | drop | drop | checklist now at entry 5; reasons for the dropped sections |
| `references/mode_selection_guide.md` | rebuild: literature | rebuild: literature | quick routing to 15.A with its file; systematic routing dropped; pipeline mappings to `researcher` |
| `references/socratic_questioning_framework.md` | rebuild: idea | rebuild: idea | reasons for dropping the overlay and the alignment table |
| `templates/research_brief_template.md` | rebuild later: literature | rebuild later: literature | APA form dropped; AI disclosure line to `paper` |

## Findings 9, 12 and 13 (ethics rows)

- Finding 9 holds and is fixed. `grep -rln argumentation_reasoning_framework` over research-hub's `.agents/skills` finds only `deep-research/SKILL.md` (line 446). The file's table (lines 60-68) names synthesis, devil's advocate and verifier (literature), mentor (idea) and architect (researcher). Row re-marked `rebuild: literature`; `idea` and `researcher` (entry 13) named for their parts; `paper-review` and `paper` named as not users.
- Finding 12 holds and is fixed. `agents/report_compiler_agent.md` lines 154-171 take revision feedback from this editor, ethics and the devil's advocate. The editor's five dimensions (34-77), strengths and weaknesses (97-98), fixes (165) and no Accept with a critical issue (167) review the report. Row re-marked `rebuild: literature`, and the report compiler row names the editor and devil's advocate as the revision's reviewers.
- Finding 13, ethics rows, holds and is fixed: both rows are `rebuild: paper` (entry 5). Entry 5's goal (`docs/roadmap.md` line 43) names disclosure statements. `academic-paper/SKILL.md` line 447 asks for an ethics statement "when applicable (human subjects, sensitive data)". Hub papers carry one: `projects/archive/published/2025/go-bttr/manuscript/main.tex` line 117 (ECoG patient data, Ethics Committee Research UZ/KU Leuven) and `projects/manuscripts/meseret-cirrhosis/notes/thesis/main.tex` line 550 (medical records, consent). The paper skill takes data licence, dual use, conflicts, AI disclosure, human-subject approval, consent and de-identification, and fair representation. The study-planning sections are dropped.

## Anything in the brief that was wrong

Nothing. Its counts matched the tree before any change: 52 files and 52 rows, the coverage check printed `ok:`, and the section's marks were 24 drop, 16 `rebuild: literature`, 4 `rebuild later: literature`, 3 `rebuild: idea`, 2 `rebuild later: paper`, 1 `rebuild: paper-review`, 1 `rebuild: researcher` and 1 `rebuild later: researcher` (from `.agents/b14/base-section.md`, the copy taken before the first edit).
