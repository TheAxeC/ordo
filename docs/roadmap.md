# Roadmap

What is open, in the order it is built, what is not yet specified, and what is done. An entry of the open order is one piece of work `/plan` can open: its goal, its gate (the check that proves it done) and what it waits on. The order is dependency order: an entry comes after everything it waits on. Entry numbers never change once written; an entry placed between two others takes the number of the one before it with a letter (`3.A`), and an entry that moves in from "Not yet specified" keeps its number.

The section "Not yet specified" holds work whose gate cannot yet be named, each entry with its goal and what must be known before its gate can be named. `/plan` refuses such an entry until `/roadmap add <entry>` names its gate and places it in the open order.

Status: `[ ]` open, `[~]` in progress, `[x]` done (its gate ran and passed, with the output beside it).

# Open, in execution order

<!-- An entry:

## <n>. <title>

- Status: [ ]
- Goal: <what exists when it is done, in one or two sentences>
- Gate: <the command, the test and what it asserts, or the observable result>
- Waits on: <entry numbers with the reason, or nothing>
-->

## 2.F diagnose

- Status: [ ]
- Goal: A `diagnose` skill: one command red on the exact symptom before any theory; the case shrunk; three to five ranked hypotheses that each name what would falsify it, shown to you; one change per probe; the fix with a test that is red without it; the cause written in the booking. `plan-orchestration`'s rule for a finding whose cause is not known points at it.
- Gate: one real run on a defect of an archived plan whose cause the ledger books, put back on a scratch copy of the tree: the run reaches that cause, its red command and its hypotheses quoted, reviewed by you; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `diagnosing-bugs` on the same defect, wins or ties.
- Waits on: 2.D, for the layout rules and the blind-comparison protocol.

## 2.G git guard

- Status: [ ]
- Goal: `repo-setup` offers a PreToolUse hook that blocks `git push`, `git reset --hard`, `git clean -f`, `git checkout .` and `git restore .`, and lets `git branch -D` and `git worktree remove` through for `/land`; you install it yourself.
- Gate: the hook script's test runs each blocked command and expects the block, and runs `git branch -D` and `git worktree remove` and expects them allowed; each block removed in a scratch copy turns the test red; `repo-setup`'s text for the offer read by you.
- Waits on: 2.C, for the rule that the test exists because a failure loses work.

## 2.H session-retro

- Status: [ ]
- Goal: A `session-retro` skill that reads the transcripts of Claude Code sessions and reports both what went well, to keep and repeat, and what went wrong, to change, each point with the place in the transcript quoted and the change it proposes to a rule, a skill or a brief; you rule on each proposal.
- Gate: one real run over the sessions of plan 2.C, its report holding points of both kinds, each with its quoted place, reviewed by you, with your ruling written beside each proposal.
- Waits on: 2.D, for the layout rules.

## 2.I Several plans in one session

- Status: [ ]
- Goal: `plan-orchestration` runs every open plan in one session: it takes the plans in the roadmap's order, `spec` compares a step's paths with the steps in flight of every open plan, one limit on steps in flight holds across all plans, landings are one at a time across all plans, and one report lists each plan's position and open items.
- Gate: one real run over two open plans whose next steps change the same file, with a third step in flight beside them: the run starts with the plan that comes first in the roadmap, the second plan's step waits until the first plan's step has landed, the steps in flight never exceed the one limit, no two landings overlap, and the one report lists both plans' positions and open items, reviewed by you.
- Waits on: 2.E, 2.F and 2.H, whose open steps change `skills/spec/SKILL.md` and `skills/plan-orchestration/SKILL.md`.

## 3. The writing base

- Status: [ ]
- Goal: A `writing` skill folder the writing skills read from, and a `/writing <file>` review. `references/` holds the rules for academic prose that the prose standard lacks, taken from the three `rebuild: writing` sources, with the registers of Engineering and CS, Medicine and Health, the Sciences and the Social Sciences. The prose standard is read where the repository keeps it and holds wherever the two differ. `/writing` has one fresh agent that changes nothing read a whole draft: a `.tex` file with its `\input` and `\include` files, a `.md`, a `.txt` or a `.docx`. It reports the findings grouped by rule, the most consequential first, each with its place, the quoted passage and a proposed replacement. It applies the ones you accept, through `academic-paper` for a manuscript or a grant. The prose standard gains two throat-clearing openers, and the term **finding** gains its sense for `/writing`.
- Gate: `/writing` run on a real manuscript of yours whose `.tex` has `\input` files, and on a real `.docx` grant of yours, reports its findings; you mark each right or wrong, and each one marked wrong is fixed in the rules or the skill before the gate passes; `/writing` run on one text holding one planted break of each rule of `references/`, and on one clean text, names every planted break and nothing in the clean text, checked by reading its report; the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, apart from what the entry's rulings leave out, checked by reading both; the skill follows `docs/dev/skill-layout.md`.
- Waits on: 1, for the layout; 2, for what the base covers; 2.B, for the repaired skills and tools it is built with; 2.C, for the rules it is built under and a tree without the old `/writing`.

## 4. code-comments

- Status: [ ] (drafted again, from its sources, before it is opened)
- Goal: A skill that checks and rewrites the comments of a diff: what the code does and why, no history, no step numbers, ASCII only.
- Gate: its check flags history words, step numbers, dates and non-ASCII in the comments of one sample diff that plants one of each, and nothing in a clean diff; one real run on a real diff that you review.
- Waits on: 3, for the checks.

## 9. literature

- Status: [ ]
- Goal: The literature skill: search through Crossref, OpenAlex, Semantic Scholar and arXiv, source verification, synthesis and the `.bib`.
- Gate: every source it cites resolves; for a sample of twenty citations drawn at random, the cited passage is read and supports the claim it is cited for, and a source that cannot be accessed is reported, not written around; a side-by-side run against deep-research on a real topic, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: literature` row that the file of `skills/literature/` the row names holds what the source file did, checked by reading both.
- Waits on: 3, for the writing base; 2, for the coverage.

## 5. paper

- Status: [ ]
- Goal: The paper skill: drafting, structure, citations, figures and statistics, disclosure statements and revision patches, as the coverage inventory marks them rebuild, with the manuscript scripts `anchorize_tex.py` and `apply_tex_patch.py` moved in from `research-hub/tools/manuscript`.
- Gate: `anchorize_tex.py` and `apply_tex_patch.py` pass their tests in the skill; the `\cite`-against-`.bib` check and the DOI check pass their tests; a side-by-side run against academic-paper on a real revision round, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: paper` row that the file of `skills/paper/` the row names holds what the source file did, checked by reading both.
- Waits on: 3, for the writing base; 2, for the coverage; 9, for the reference lookups.

## 6. paper-review

- Status: [ ]
- Goal: The internal review skill: the reviewer roles, the editor's synthesis and the re-review mode.
- Gate: every finding cites a line; a side-by-side run against academic-paper-reviewer on a paper with known referee reports, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: paper-review` row that the file of `skills/paper-review/` the row names holds what the source file did, checked by reading both.
- Waits on: 3, for the writing base; 2, for the coverage.

## 7. rebuttal

- Status: [ ]
- Goal: The response letter for a real submission round, from the referee comments and the revision's apply report.
- Gate: every referee point has a response and a pointer to its change; each referee point has a verdict, judged by reading the response and the manuscript: addressed, partly, not, or cannot be checked from the manuscript; a check that no point is left unanswered, with a test that fails on a missing response; a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: rebuttal` row that the file of `skills/rebuttal/` the row names holds what the source file did, checked by reading both.
- Waits on: 5, for the apply report; 6, for the point table.

## 8. grant

- Status: [ ]
- Goal: The grant skill with per-funder config: required sections, page limits, evaluation criteria and the funding statement.
- Gate: the checks for limits, required sections and the statement text pass their tests; a side-by-side run on a section of a past application, compared with what was submitted.
- Waits on: 3, for the writing base; 2, for the coverage: no file is marked `grant`, and the funder acknowledgement text reaches it through the paper row of `references/funding_statement_guide.md`.

## 10. idea

- Status: [ ]
- Goal: The idea skill: the `grill` interview (entry 2.E) pointed at a research idea, and the novelty check with cited literature.
- Gate: one real run that you review, whose novelty claim cites the sources it checked; a side-by-side run against deep-research's socratic mode (`references/socratic_mode_protocol.md`) on a real idea, compared blind as `docs/dev/blind-comparison.md` says, wins or ties; the plan's ledger holds a record for each `rebuild: idea` row that the file of `skills/idea/` the row names holds what the source file did, checked by reading both.
- Waits on: 2.E, for the `grill` interview; 9, for the literature search.

## 11. scaffold

- Status: [ ]
- Goal: `repo-setup` renamed to `scaffold`, with the `library` and `research-project` profiles, hub-specific config, and Ordo's own `CLAUDE.md`.
- Gate: no file names `repo-setup` (a grep prints nothing); each profile scaffolds a scratch folder that passes `sync_rules.py` and `check_config.py`; `sync_rules.py` exits 0 on Ordo.
- Waits on: 1, for the layout.

## 12. project-docs

- Status: [ ]
- Goal: A skill that writes and keeps the main README and `code/README.md` of a project, readable by someone new to it: each page opens with an introduction (what the project or folder is, who it is for, what to read first), explains each idea before using it, defines each term where it first appears, shows how to run things with a worked example, and follows the writing base's prose standard.
- Gate: a fresh reader with no context answers a fixed set of questions from the pages alone (what the project does, how to run the main experiment, where results go, what each folder holds), and each question it cannot answer is a finding; one real run on a research project that you review.
- Waits on: 11, for the profiles.

## 13. researcher

- Status: [ ]
- Goal: The researcher skill: the new-project and revise roadmap templates, an adopt mode for a project already underway (it reads the code, configs, results, logs and draft, writes the roadmap with the finished stages marked done with their evidence, and continues after your approval from the first stage not done), a run over a named range of stages, venue files in `venues/`, and plan-orchestration's support for SLURM jobs. Each stage's input and output files have a written format, so any stage can start from files that exist. When experiments do not beat the baseline, the loop proposes a new method and runs the next experiments; it never writes up a negative result.
- Gate: the adopt mode is run once on a real research project that already has code and results but is not finished, and you check that the roadmap it writes marks as done exactly the stages that are done, each with the file that shows it; a run over a named range of stages on a small test project writes each of those stages' output files; submitting jobs to SLURM is tested against a fake scheduler that records the jobs it is sent; the plan's ledger holds a record for each `rebuild: researcher` row that the file of `skills/researcher/` the row names holds what the source file did, checked by reading both.
- Waits on: 5 to 12, for the skills its entries call.

## 14. submit-manuscript

- Status: [ ]
- Goal: A skill that fills a submission portal from the project and the venue file, stops for every approval, never presses the final Submit, and writes a submission record. It also writes the cover letter, with suggested and excluded reviewers, and removes what identifies the authors for a blind review, from the venue file.
- Gate: one real run on a portal up to its last page, with the record written; the plan's ledger holds a record for each `rebuild: submit-manuscript` row that the file of `skills/submit-manuscript/` the row names holds what the source file did, checked by reading both.
- Waits on: 13, for the venue files; 5, for the documents.

## 15. submit-grant

- Status: [ ]
- Goal: The same for grant portals, reusing the per-portal notes.
- Gate: one real run on a grant portal up to its last page, with the record written.
- Waits on: 14, for the portal notes; 8, for the documents.

## 15.A Rebuild-later rows

- Status: [ ]
- Goal: Every row of `docs/academic-coverage.md` marked `rebuild later: <skill>` is built into its skill while the installed academic skills are still there to read: 6 for paper, 6 for literature, 3 for paper-review.
- Gate: no row of `docs/academic-coverage.md` is still marked `rebuild later` (`grep -c '| rebuild later: ' docs/academic-coverage.md` prints 0); each built row is re-marked `rebuild: <skill>` and its reason names the file of the skill that now holds it; the plan's ledger holds a record for each re-marked row that the file it names holds what the source file did, checked by reading both.
- Waits on: 5, 6 and 9, the skills the rows go to.

## 16. Switch over

- Status: [ ]
- Goal: The new writing skills replace the installed academic skills.
- Gate: with the user's explicit permission, asked for before any of it: your global `CLAUDE.md` and `research-hub/CLAUDE.md` name the new skills; the installed academic skills are removed from research-hub; `research-hub/tools/manuscript` points at `paper`. Nothing of it is done without that permission.
- Waits on: 5 to 10, each with its side-by-side run passed; 14, for the submission checks and the cover letter of `references/journal_submission_guide.md`; 15.A, so every later row is built before the academic skills are removed.

## 17. review

- Status: [ ]
- Goal: A standalone `/review` of any diff since a commit, outside a plan, in the verdict form of `/refute`: a verdict per stated intent of the change and per claim of its commit messages, each finding with its failure scenario.
- Gate: one real run on a diff that holds a defect you know of, which the review finds with its failure scenario, reviewed by you; a blind comparison as `docs/dev/blind-comparison.md` says against ConnorGriffin's `code-review` on the same diff, wins or ties.
- Waits on: 2.D, for the verdict form.

## 18. wait-what

- Status: [ ]
- Goal: A `wait-what` skill you type when a message did not land: the message explained again in simple English with the context it left out, using the glossary's terms.
- Gate: runs on three real messages you name as not landed, each re-explanation read by you and judged clear.
- Waits on: 2.D, for the glossary.

## 19. codebase-design

- Status: [ ]
- Goal: A `codebase-design` skill that adapts `repo-setup`'s default design-principles page to an existing repository: each principle stated in the concrete form it takes there, with the check that enforces it where one exists.
- Gate: one real run on a repository you name that fills its design-standard page, reviewed by you; one run on Cathedra whose page holds every point of its existing "Design principles" section, checked by reading both; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `codebase-design` on the same repository, wins or ties.
- Waits on: 2.E, for the design-principles page.

## 20. improve-codebase-architecture

- Status: [ ]
- Goal: An `improve-codebase-architecture` skill that reads a repository against its design-standard page and writes candidates, each naming the principle it breaks, its files and lines, the problem, the fix, the benefit and how strongly it is recommended, then grills through the one you pick into a roadmap entry.
- Gate: one real run on Cathedra, each candidate reviewed by you, the one you pick written into its roadmap entry through `grill`; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `improve-codebase-architecture` on the same repository, wins or ties.
- Waits on: 19, for the design-standard page; 2.E, for `grill`.

## 21. wizard

- Status: [ ]
- Goal: A `wizard` skill that writes a script walking a person through the steps only a person can do (open a dashboard, copy a key, paste it), writing each value to `.env` or a GitHub secret, asking before each irreversible action and never printing a secret.
- Gate: one real run for a project's manual setup you name, the script run by you, reviewed by you.
- Waits on: 2.D, for the layout rules.

## 22. teach

- Status: [ ]
- Goal: A `teach` skill: a teaching workspace that persists across sessions, with a mission file saying why you learn the topic, short lessons tied to it, reference sheets, records of what you learned, and retrieval practice spaced over time.
- Gate: one real run on a topic you name over at least two sessions, the second reading the first's records and scheduling its retrieval practice, reviewed by you; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `teach` on the same topic, wins or ties.
- Waits on: 2.D, for the layout rules and the blind-comparison protocol.

## 22.A Blind comparisons of the plan skills

- Status: [ ]
- Goal: `refute`, `plan`, `plan-orchestration` and `session-retro` each hold up against the skill that does the same job elsewhere, compared blind; a skill that loses is changed until it wins or ties.
- Gate: four blind comparisons as `docs/dev/blind-comparison.md` says, each a win or a tie by your call: `refute` against mattpocock's `code-review` on step 9a of plan 2.E (its brief `.scratch/2-e-grill/agents/briefs/9a.md` and the diff `.scratch/2-e-grill/agents/reviews/9a-round-0.diff`); `plan` against superpowers' `writing-plans` on entry 3 on the tree at 7e984dd; `plan-orchestration` against superpowers' `subagent-driven-development` on the plan of entry 21 as `/plan` opened it, each side on its own copy of the tree at the opening commit; `session-retro` against mattpocock's `retro` on the sessions of plan 2.E.
- Waits on: 2.E, for step 14b's judge's input; 2.H, for `session-retro`; 21, for the plan `plan-orchestration` runs on.

## 23. Pruning pass

- Status: [ ]
- Goal: Every Ordo skill held to the writing-for-agents rules of `docs/dev/skill-layout.md`: each sentence that changes no behaviour deleted, each prohibition written as the behaviour wanted, each step ending on its "done when".
- Gate: you read and approve the whole diff; a reviewer's report lists every deleted sentence with the behaviour it carried and where that behaviour still stands, or why it carried none, read by you.
- Waits on: every other open entry, so each skill is pruned once, in its final form.

# Not yet specified

<!-- An entry:

## <n>. <title>

- Goal: <what exists when it is done, in one or two sentences>
- Must be known: <what must be known before its gate can be named>
-->

# Done

<!-- - [x] <n>. <title>: <the gate's command> printed <its summary line> -->

- [x] 1. One layout for every skill: `docs/dev/skill-layout.md` approved (plan 1's rulings); at the closing on main, `python3 utils/check_skill_layout.py` printed ten `ok:` lines, exit 0, `sh utils/check_skill_layout.test.sh` printed `PASS: check_skill_layout.py scratch tests`, `python3 utils/check_rule_inventory.py` over the ten inventories printed ten `ok:` lines, exit 0, and `sh utils/check_rule_inventory.test.sh` printed `PASS: check_rule_inventory.py scratch tests`, and the ASCII check printed nothing, exit 0; `/refute` ran on steps 2 to 14, once on the build and once over its one repair round; the findings of that last run that a rule was changed in meaning were fixed at landing with no further review: step 4 (a sentence the old file does not have), step 6 (a refusal stated without its condition), step 7 (`land`'s red line booked in the open items, against the ruling), step 8 (the refusal for a missing run over the last round merged into another refusal, and part of old line 10 lost), step 10 (the diff rule written twice with different scopes), step 11 (the `drop` refusal placed after the draft it prevents) and step 13 (the rule that nothing is written before approval not limited to the setup); the tests of `docs/dev/building.md` last ran together on main at step 14's landing, each through `| tail -1`, which hides its exit status, and the re-run at a866716 (`.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/15-rerun.md`, "Commit a866716") shows `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, `PASS: check_skill_layout.py scratch tests` and `PASS: pin.sh scratch tests`, each test exiting 0; at step 14's landing `npx skills add . --list` printed `Found 10 skills`.
- [x] 2. Coverage inventory of the academic skills: `docs/academic-coverage.md` names each of the 169 files once with its mark and reason; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0, and `sh utils/check_coverage.test.sh` printed `PASS: check_coverage.py scratch tests`; the user approved the list (plan 2's rulings).
- [x] 2.A. Launch notes for builders run as their own process: an optional `launch_note:` key and `skills/plan-orchestration/templates/launch.sh`, which runs the `claude -p` and `codex exec` recipes (and a repair round's resume) around the note's `start` and `end`; `sh skills/plan-orchestration/templates/launch.test.sh` printed `PASS: launch.sh scratch tests`, `sh skills/land/templates/land.test.sh` printed `PASS: land.sh and usage.py scratch tests`, `sh skills/ordo-init/templates/check_config.test.sh` printed `PASS: check_config.py scratch tests`, and `python3 utils/check_skill_layout.py` printed ten `ok:` lines, exit 0.
- [x] 2.B. Repair what the audit of plans 1, 2 and 2.A found: at the closing on main, the plan's closure table `.scratch/archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/closure.md` holds 154 rows, one per finding of the six reports in `.scratch/reviews/2026-09-24-audit/`, none open, each closed by a commit, ruled by the user, or marked no defect reported, outside Ordo or removed; `sh skills/land/templates/verify.sh` on the plan's state file printed `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: verify.sh scratch tests (runner under sh dash)`, `PASS: check_coverage.py scratch tests` and `verify: 7 commands passed`, exit 0, and `verify.test.sh` plants red commands and expects `RED:`; the 38 faults of the checkers review in tools still in the tree (`check_coverage.py`, `pin.sh`, `sync_rules.py`, `land.sh`, `land.test.sh`, `usage.py`), each planted again in a copy, turned that tool's test red, exit 1 in all 38 runs; the four records files of steps 11 to 14 hold 61, 26, 30 and 52 records, one per coverage row, 169 in all; `/plan-retro` ran over the three archived plans, and its retro `.scratch/retros/2026-09-26.md` holds 20 proposals and 20 decisions.
- [x] 2.C. Scripts compute facts, and /writing is removed: at the closing on main (566a198), the rule "scripts compute facts; judgment is read" stands in `docs/dev/change-standard.md` (its section) and `skills/repo-setup/templates/shared-rules.md` (line 15), and the user approved the rewritten rules on reading their diff; `skills/writing/`, `verify.sh`, `verify.test.sh`, `usage.py` and the plan's ledger copies of `land.sh` are absent (`test -e`), and `python3 utils/check_coverage.py --built paper ...` printed `usage error: --built: not an argument this script takes`, exit 2; `git grep -n -e check_prose -e verify.sh -e usage.py -e ADAPT -e no-browser -e '--built' -- ':!.scratch' ':!docs/roadmap.md'` printed nothing, exit 1; `grep -n -e --built docs/roadmap.md` printed only this entry's gate line; entry 3.A is under Dropped with its reason, and entries 3 and 4 read "drafted again, from its sources, before it is opened"; `git diff v2.0.0 -- skills/repo-setup/templates/docs/dev/prose-standard.md` printed nothing; `.scratch/3-the-writing-base/` is absent; each command of the verify list in `docs/dev/building.md`, run as written, exited 0, printing `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests` and nothing for the ASCII check; the last step to land, step 5, landed through `sh skills/land/templates/land.sh`, reading its paths from `.agents/plan.yaml`, exit 0.
- [x] 2.D. The plan skills take the comparison's process changes: at the closing on main (ac10380), the user approved the diff of each changed skill, page and roadmap entry on reading it; the length command printed no length above 1,024, the highest 1022 for `skills/spec/SKILL.md`; step 9, the glossary, was prepared, built and refuted under v2.4.0 (`git -C ~/.local/share/ordo-stable describe --tags` printed `v2.4.0`), its brief-check report lists every name the step changes with the hits outside its path list under "1. Names", and its refuter report gives the verdict per item and per Case, both read by the user.
- [x] 2.E. grill: at the closing on main, `skills/grill/SKILL.md` 1.2.0 follows `docs/dev/skill-layout.md`, read and approved by the user at step 12 and, for the changes of steps 9a, 14a and 14c, on reading their diff at the closing; step 13's real run redrafted entry 3 from its sources, with D1 to D24 in `.scratch/rulings/3-the-writing-base.md`, the glossary terms and entry 3 on disk (7e984dd), reviewed by the user; the blind comparison against mattpocock's `grill-with-docs` on entry 3 (`.scratch/archive/2-e-grill/agents/reviews/14-blind-comparison.md`, second run): both judges chose `grill`, and the user's call is a win; the default pages were read and approved by the user at steps 4, 5 and 6; `repo-setup`'s real run on a scratch repository holding C++ and TypeScript files installed the design-principles, common, C++ and TypeScript pages and listed them under `standards` (step 7, `7-refuter.md`, run 1); `sh skills/ordo-init/templates/check_config.test.sh` printed `PASS: check_config.py scratch tests`, with refusal cases for a wrong `adr`, `design_bar`, `design_references`, `worker_effort` and `reviewer_effort`.
- [x] 2.E.A. self-rule: at the closing on main (84f6b26), the `self_rule` run of step 11 left Open items H (kind 3) and I (kind 1) open by name and closed F and G into `choices.md` as C1 and C2, read by the user (`.scratch/archive/2-e-a-self-rule/agents/reviews/11-self-rule.md`); the `next_entry` run of step 9 on a scratch roadmap of two entries closed entry 1, then grilled, planned and closed entry 2, its decisions D1 to D13 in `choices.md` as C3 to C16, and each scratch plan's step list, one build step and the closing, drafted by parts and read by the user; `plan_cost.py` printed each role's priced usage for plan 2.E (78 agents) and plan 2.E.A (exit 0), 2.E.A's runs over a repair round from step 4 on priced on claude-sonnet-5-5, the model `repair_reviewer` names, and `sh skills/plan-orchestration/templates/plan_cost.test.sh` printed `PASS: plan_cost.py scratch tests`; the brief checks of steps 3 to 8 with their section "8. Dictated text" listed in `.scratch/archive/2-e-a-self-rule/agents/reviews/10-cost.md`, read by the user; the eleven skills step 12 changed read against `docs/dev/skill-layout.md` and agreed by the user, and the skills steps 12b and 12c changed held to it by their reviews; `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` printed `checks: 11 commands passed`, exit 0.

# Dropped

<!-- - <n>. <title>: <the reason> -->

- 3.A. Landing checks the brief and the review: dropped, since it is a script that polices the orchestrator: whether a step is ready to land is judged by reading its reports (`/land`, the Stops row "The step not ready"), and under the rule "scripts compute facts; judgment is read" no script gates that judgment.
