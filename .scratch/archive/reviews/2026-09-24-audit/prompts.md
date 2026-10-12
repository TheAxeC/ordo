# The prompts the reviewers were given

Each reviewer of this folder was a fresh read-only agent on the model named, dispatched by the orchestrating session whose work was reviewed. Its prompt is quoted whole below, as sent.

## 1-process-audit (opus)

```text
You are a read-only auditor of how three plans were run in the repository /Users/axelfaes/workspace/ordo. Change nothing: no file edits, no commits, no git command that writes (git log, show, diff, grep are fine). Your final message is your report.

Context: the repository holds Ordo, a set of plan skills (plan, spec, refute, land, plan-orchestration, plan-help, plan-retro, roadmap, ordo-init, repo-setup). Since tag v1.0.0 (88 commits, `git log --oneline v1.0.0..HEAD`) three plans were run by one Claude session acting as orchestrator: plan 1 (one layout for every skill), plan 2 (coverage inventory of the academic skills), plan 2.A (launch notes). Their ledgers are archived under .scratch/archive/ (plan.md, orchestrator-state.md, agents/briefs/, agents/reviews/). The skills that governed the runs are the installed, pinned ones: /Users/axelfaes/.claude-work/skills/{plan,spec,refute,land,plan-orchestration,plan-help,plan-retro,roadmap}/SKILL.md and their templates/ (read every SKILL.md and template in full). The user's own rules are /Users/axelfaes/.claude-work/CLAUDE.md and /Users/axelfaes/.claude/rules/*.md. The repository's rules are docs/dev/change-standard.md and docs/dev/building.md.

Known facts you should verify rather than assume: the session invoked the skills through the Skill tool only for plan 1 step 2 (/spec, /refute, /land) and then followed their text by hand; every step was built inline by the orchestrating session (executor: inline) instead of by a dispatched builder agent; each review was a fresh read-only opus agent; the orchestrator was an Opus model while plan-orchestration names a top-tier model for the orchestrator.

Audit every step of the three ledgers against the skills, and list each place the process departed from what the skills require. Check at least: plan opening and step-list approval; briefs (premises checked with commands, fix text, decisions taken in the brief versus decisions reserved for the user); the dispatch block and its commits; the executor choice and its justification; repair rounds (count, cap, refute_after_repair, what was fixed at landing versus booked); scope changes that the skills say are a stop (spec: "if the correction changes the step's scope, that is a stop"; plan-orchestration step 8) and whether they were raised as stops with options and a recommendation before acting; open items, booked list and closed list; reports opening with the open items; the recurring-findings pass every tenth landed step and at any pause (was it ever run? plan 1 had 14 steps); plan-retro; usage rows and whether any number in them lacks a source; the landing order (cherry-pick of the whole range, verification on main, booking, commit by path, worktree removal); /roadmap done (the skill requires the diff shown and approved); anything the skills require that no ledger shows. Also check whether the verification actually proved green: the scratchpad script v.sh ran each test as `cmd 2>&1 | tail -1 || ...`, whose exit status is tail's; check whether every landing's booking quotes PASS lines that would reveal a red test.

Report: for each departure, the plan and step, the skill file and line of the rule, the evidence (a command and its output, or a ledger path and line), its effect on the delivered work (none, a risk, a real defect), and what would put it right. Then a short list of the departures that recur across plans. No praise.
```

## 2-restyled-skills (opus)

```text
You are a read-only reviewer in /Users/axelfaes/workspace/ordo. Change nothing: no file edits, no commits; read-only git (log, show, diff) is fine. Your final message is your report.

Plan 1 (ledger .scratch/archive/1-one-layout-for-every-skill/) restyled all ten skills under skills/ to one layout (docs/dev/skill-layout.md) and wrote a rule inventory per skill proving no rule was lost (find the inventories: grep for "# Rule inventory" across the repository, and see utils/check_rule_inventory.py). The pre-restyle text of each skill is `git show v1.0.0:<old path>` (the old paths may differ: check `git show --stat` of the move commit 643dca8 and the inventories' "Old:" lines). Later plans (2, 2.A) changed some skills again (plan-orchestration, plan, ordo-init).

Your job is to judge whether the restyled skills still say everything the v1.0.0 skills said, with the same meaning, and whether they are correct and usable as instructions. For each of the ten skills: read the v1.0.0 SKILL.md (and its templates if the restyle touched them) and the current SKILL.md in full; read its inventory; check that every rule of the old text is present in the new one with its qualifiers (exceptions, limits, conditions), not weakened, not merged away, not contradicted; check the inventory rows point at places that really hold the rule (`python3 utils/check_rule_inventory.py <inventory>` checks only structure, so read the text yourself); find rules in the new text that did not exist before (new behaviour nobody asked for); find contradictions between skills (for example the dispatch block fields that spec, plan-orchestration and plan's templates/orchestrator-state.md name; the stop rules; the open items rules); and find anything an orchestrator following the new text literally would do wrong or could not do.

Report: per skill, numbered findings with severity (lost rule, weakened rule, changed meaning, contradiction, new unrequested rule, unusable instruction, cosmetic), the old location and the new location with quoted text, and what to change. Then an overall verdict per skill: sound, sound with fixes, or not sound. No praise.
```

## 3-checkers (opus)

```text
You are a read-only code reviewer in /Users/axelfaes/workspace/ordo. Change nothing in the repository: no edits, no commits (read-only git is fine). You may copy files into your own temporary directory and run or modify the copies there to test them. Your final message is your report.

Review the tools plan 1 and plan 2 built (ledgers under .scratch/archive/): utils/check_skill_layout.py with utils/check_skill_layout.test.sh against docs/dev/skill-layout.md; utils/check_rule_inventory.py with utils/check_rule_inventory.test.sh; utils/check_coverage.py with utils/check_coverage.test.sh against docs/academic-coverage.md; utils/pin.sh with utils/pin.test.sh; and skills/repo-setup/templates/sync_rules.py with its test, skills/plan-retro/templates/collect_findings.py with its test, skills/land/templates/land.sh and usage.py with land.test.sh, as far as they changed since v1.0.0 (`git diff v1.0.0 -- <path>`).

For each tool: read the code and its test in full; run the test; check the tool does what its page or docstring says (docs/dev/skill-layout.md for the layout check, README.md's Tests section, docs/dev/building.md); look for real bugs (wrong results on valid input, crashes, rules of the standard that the checker claims to enforce and does not, false passes, false failures); check whether each test would catch the defect it names (plant a fault in a copy and run the test against the copy); and check edge cases the test does not cover that matter in practice (paths with spaces, CRLF, empty files, non-UTF-8, a missing trailing newline).

Report: per tool, numbered findings with severity (bug, false pass, false failure, untested behaviour, documentation mismatch, cosmetic), file:line, the reproduction (command and output), and the fix. Then a verdict per tool: correct, correct with fixes, or not correct. No praise.
```

## 4-coverage-and-roadmap (opus)

```text
You are a read-only reviewer in /Users/axelfaes/workspace/ordo. Change nothing: no edits, no commits (read-only git is fine). Your final message is your report.

Plan 2 (ledger .scratch/archive/2-coverage-inventory-of-the-academic-skills/) wrote docs/academic-coverage.md: every file of four academic skills installed in /Users/axelfaes/workspace/research-hub/.agents/skills/{academic-paper,academic-paper-reviewer,academic-pipeline,deep-research} (169 files, read-only, never edit them) marked with the new Ordo skill that must rebuild what it does, "rebuild later", or drop, with a reason. The roadmap docs/roadmap.md lists the entries that build those skills (3 to 16, with 15.A for the rebuild-later rows). The user works on ML research papers and is Axel Faes (axel.faes@uhasselt.be); the new skills are meant to replace the academic skills for his work.

Review the substance: sample at least 50 rows across all four skills and every mark (rebuild X, rebuild later X, drop), and for each sampled row read the research-hub file in full and judge whether the mark and the reason are right: does the reason describe what the file really does; is a dropped file really redundant or useless for ML paper work, or does it hold a rule or capability the new skills will then lack; is a "rebuild later" deferral justified; is the target skill the right one. Check the roadmap entries 3 to 16 and 15.A against the coverage doc: does every mark name a roadmap entry that will build it, are the gates of those entries checkable, is the dependency order right, is anything the academic skills do not assigned to any entry. Also run `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` (check the script's usage line first) and report its output.

Report: numbered findings with severity (wrong mark, lost capability, wrong reason, wrong target, roadmap gap, roadmap order, cosmetic), the row or entry quoted, the evidence from the research-hub file, and the fix. Then a verdict on whether the document can be trusted as the basis for entries 3 to 16. No praise.
```

## 5-plan-2a-launch (opus)

```text
You are a read-only code reviewer in /Users/axelfaes/workspace/ordo. Change nothing in the repository: no edits, no commits (read-only git is fine). You may copy files into your own temporary directory and run or modify copies there. Your final message is your report.

Plan 2.A (ledger .scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/, read plan.md with its rulings and premise corrections) added: skills/plan-orchestration/templates/launch.sh, launch.test.sh and launch-note.md; the launch_note key in skills/plan/templates/plan.yaml, plan.projects.yaml and orchestrator-state.md, skills/plan/SKILL.md, skills/ordo-init/SKILL.md and README.md; the check in skills/ordo-init/templates/check_config.py with its test; and the rewrite of "Launching a builder" and Steps item 8 in skills/plan-orchestration/SKILL.md. Diff: `git diff 9673198^ HEAD -- skills README.md docs` (find the plan's opening commit with `git log --oneline -- .scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/plan.md` if 9673198 is wrong).

Judge whether it works and is right: read launch.sh and its test in full and run the test; try launch.sh by hand with stub claude/codex/note commands in a temp dir, including a real detached run, a relative and an absolute path set, a note command that hangs, a note that is not executable, a builder that is killed, two launches of the same step at once, and a resume; compare the codex and claude flags with `codex exec --help`, `codex exec resume --help` and `claude --help`; check the SKILL.md text is enough for an orchestrator to launch, record, resume and monitor a shell builder end to end, and that it agrees with launch.sh, launch-note.md, the dispatch fields in skills/plan/templates/orchestrator-state.md and skills/spec/SKILL.md; check check_config.py's launch_note check and its tests; and check whether the widening of step 3 (the --resume mode) was the right design or whether something simpler would have served.

Report: numbered findings with severity (bug, wrong behaviour, untested behaviour, documentation mismatch, design concern, cosmetic), file:line, reproduction, and fix. Then a verdict: works as intended, works with fixes, or does not work. No praise.
```

## 6-oculus-changes (opus)

```text
You are a read-only reviewer. Change nothing anywhere: no edits, no commits, no git command that writes, in either repository. You may run scripts on copies in your own temporary directory. Your final message is your report.

Two repositories:
- /Users/axelfaes/workspace/ordo: the Ordo plan skills (skills/plan-orchestration, land, spec, refute, plan, ordo-init ...). Plan 2.A added an optional `launch_note:` key and `skills/plan-orchestration/templates/launch.sh`, with the interface in `skills/plan-orchestration/templates/launch-note.md`; `skills/ordo-init/templates/check_config.py` checks the key. A new plan, 2.B (.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md, read its steps and rulings in full), is about to change launch.sh (step 4: the pid file owns the builder, a note call bounded in time, absolute paths, a Claude session id known before the builder starts, the note label `<entry>/<step>`) and the skill texts (steps 2 and 3). The audit that led to 2.B is in .scratch/reviews/2026-09-24-audit/ (5-plan-2a-launch.md is the launch review).
- /Users/axelfaes/workspace/research-hub (read only): its tool oculus is run by another orchestrating session through the installed (pinned v1.0.0) Ordo skills, from the ledger tools/oculus/.scratch/migration/ (orchestrator-state.md, plan.md). That session has, over 2026-09-23 and 2026-09-24, made changes that concern Ordo: the hub's .agents/plan.yaml sets `launch_note: "node tools/oculus/bin/dispatch-note.mjs"` (line 23); tools/oculus/bin/dispatch-note.mjs (landed in O31 and O32, commits 6e0920b3 and b059c57f) is the note command; its state file's standing demands (lines 50-58) add rules on top of the Ordo skills (every step through the skills as skills; reports open with the open items; a landing stops every agent of its step with TaskStop and checks ListAgents, "added there with O32's recipes"; landed work finished forward, never reverted); and its booked item O32 (around line 102) and closed items O31 (around lines 121-125) describe the interface it expects from Ordo. Use `git log --since='3 days ago'` on those paths and read the relevant commits.

Answer, with evidence (command and output, or file:line quoted):
1. Does the hub's configuration work with Ordo's launch_note as built in ordo HEAD? Check the value against check_config.py (run it on a copy of the hub's .agents/plan.yaml, or read the check) and launch.sh (which refuses a relative --note). Note that the hub file uses the `projects:` form.
2. Does dispatch-note.mjs implement the interface of launch-note.md (the three calls, their arguments, the id on the first stdout line, returning at once, a failure harmless)? Run it against a temporary HOME or data folder if it writes to ~/.oculus, never against the real one. Check what it does with --pid, --label, --parent, --cwd, and a transcript path, and how it would read the changes 2.B plans (the pid of the builder rather than of the detached shell; the label `<entry>/<step>`; a resumed run as a new record).
3. Are the oculus session's added standing demands good, and which of them belong in the Ordo skills themselves (plan-orchestration, land) as part of plan 2.B? In particular the landing that stops every agent of its step, and "finished forward, never reverted" against Ordo's own rule that undoing a step is `git revert` of its commit. Say whether each conflicts with or is missing from the Ordo skills, with the skill file and line.
4. Anything the oculus ledger says about Ordo that is wrong now (for example its note that the installed copy lacks the recipes, which is true because nothing has been pinned).
5. Anything in those oculus changes that is a defect in its own right.

Report: numbered findings with severity, evidence and the fix, grouped under the five questions, then a short verdict: is what the oculus session did good, and what should plan 2.B take from it. No praise.
```
