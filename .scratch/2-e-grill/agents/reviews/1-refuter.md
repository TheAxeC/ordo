# Step 1 refuter report (on .agents/worktrees/2e-1, base 1645496e2c768df9e3889c3de25ca1da2898b31c)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (exit 0)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
checks: 8 commands passed

diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md          -> no output, rc=0
diff docs/adr/template.md skills/repo-setup/templates/docs/adr/template.md      -> no output, rc=0
cmp docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md           -> same (797 bytes each, wc -c)
LC_ALL=C grep -n '[^ -~]' docs/adr/README.md docs/adr/template.md skills/repo-setup/templates/docs/adr/README.md skills/repo-setup/templates/CLAUDE.md   -> no output, rc=1
git diff bc83a4d -- skills/repo-setup/templates/docs/adr/template.md            -> no output, rc=0
git diff 1645496 --stat   -> skills/repo-setup/templates/CLAUDE.md 2 +-; skills/repo-setup/templates/docs/adr/README.md 4 +++-
git status --short        -> M skills/repo-setup/templates/CLAUDE.md; M skills/repo-setup/templates/docs/adr/README.md; ?? .scratch/2-e-grill/agents/reviews/1-report.md; ?? docs/adr/
sed -n 3p / sed -n 5p of the template README, diffed against the brief's two quoted paragraphs -> identical, both
sed -n 21p skills/repo-setup/templates/CLAUDE.md -> - `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A change that contradicts an ADR is a rule clash.

Builder's evidence commands, rerun:
git diff --stat bc83a4d HEAD -> only .scratch/2-e-grill/agents/briefs/1.md (88) and .scratch/2-e-grill/agents/reviews/1-brief-check.md (87); matches the report
grep -n -E ' - |--|20[0-9][0-9]|Ordo|ordo' docs/adr/README.md -> 10:|---|---|   ; matches
git grep -n -i -e 'ADR' -e 'decision record' -e 'supersede' -- skills utils docs README.md -> the hits the report lists, plus change-standard :41 and roadmap.md:24, neither made false; matches in substance
git grep -n -i adr -- docs/glossary.md -> no output, rc=1; matches
wc -l -> docs/adr/README.md 10, docs/adr/template.md 19, template README 10, templates/CLAUDE.md 33; matches
sed -n '/^## Open items/,/^## /p' .scratch/2-e-grill/orchestrator-state.md (worktree copy) -> item A as the report quotes it; matches the worktree copy
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. `git diff 1645496` replaces only the old line 3 with the two paragraphs and a blank line between; each paragraph diffs identical to the brief's text; heading, naming paragraph and table are unchanged context lines.
- 2: holds. `diff` and `cmp` of `docs/adr/README.md` against the template print nothing / "same"; the table is empty.
- 3: holds. `diff docs/adr/template.md ...` prints nothing, and the template is unchanged since bc83a4d.
- 4: holds. Line 21 reads as item 4 gives it; the diff of `skills/repo-setup/templates/CLAUDE.md` is that one line.

Cases of the brief's "Cases":

- `diff docs/adr/README.md ...` prints nothing: met.
- `diff docs/adr/template.md ...` prints nothing: met.
- The template README states the test, the plan-ruling rule, the superseding ADR and the in-place refinement: met by reading lines 3 and 5.
- No date, no history, no project name: met.
- `git diff bc83a4d` of the README changes only the first paragraph: met.
- `git diff bc83a4d` of `template.md` prints nothing: met.
- `templates/CLAUDE.md` line 21: met.
- On the unchanged tree the first two, the third and the CLAUDE.md case fail: met; the builder's first-run table gives each result.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

- `skills/repo-setup/templates/docs/adr/README.md:3` (and the byte-equal `docs/adr/README.md:3`): "Every other decision stays a ruling of the plan that made it."; what is wrong: `docs/glossary.md` defines a ruling as the user's decision on an open item, typed as `Ruled: ...`, or the orchestrator's decision on a finding sent in a repair round or on a case. A brief's "Decisions taken in this brief" and a builder's judgment calls are decisions that are not rulings. "Every other decision" places all of them under "ruling", a sense the glossary does not define (`docs/dev/skill-layout.md`, "Writing for an agent"). The sentence is the brief's dictated text, so the fix is the orchestrator's: narrow the sentence, or add the sense to the glossary. Failure scenario: `grill` (step 12) or the ADR readers (step 11) treat a brief's decision or a builder's judgment call as a plan ruling, and write it into `plan.md`'s Rulings as "(the user)" when the user never ruled on it, or flag it as a decision missing its ruling at `/plan`'s approval stop. Verdict: none; items 1 and 2 hold as the brief dictates the text.

## 4. Behaviour

none

## Declined to judge

- Whether "binds work after its plan closes" answers a decision made when no plan is open (ruling B sends such grill answers to `.scratch/rulings/<entry slug>.md` until `/plan` copies them into a plan): the wording is ruling A's, the user's.
- The builder's report quotes open item A from the worktree's copy of the state file, older than main, where A is closed. Not a finding: the quote matches the file it read and states the caveat.
- Passive voice in "A record is kept per decision": allowed by the prose standard's "Sentence shapes" where the actor is irrelevant, and dictated by the brief.

Reviewer usage: 109566 tokens, 19 tool uses, 2.8 minutes (166 s), claude:opus, a fresh agent (from its completion notice). Saved by the orchestrator from the reviewer's final message.
