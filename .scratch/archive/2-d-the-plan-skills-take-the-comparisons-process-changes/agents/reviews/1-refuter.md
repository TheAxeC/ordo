# Step 1 refuter report (on .agents/worktrees/2d-1, base 8bb98e80a01c23d4dd55eb42499b6b0bbd5c9dc8)

Reviewer: claude:opus, a fresh agent; 110523 tokens, 22 tool uses, 277 s (from the completion notice). Saved by the orchestrator from the reviewer's final message.

A page this report cites is named with its section; code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md   (worktree root; exit 0)
PASS: land.sh scratch tests
PASS: checks.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
(the ASCII check: no output)
checks: 7 commands passed

The gate's length command: 726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 386 plan, 775 refute, 626 repo-setup, 630 roadmap, 999 spec.
LC_ALL=C grep -n '[^ -~]' docs/dev/skill-layout.md skills/spec/SKILL.md: nothing, exit 1.
```

Every command the builder's report quotes reproduced: `git diff 8bb98e8 --numstat` (15 0 skill-layout.md, 2 2 spec), `wc -l` (87 and 237, base 72), the grep of the new rules (lines 18, 20, 58, 61, 62, 69), `ls skills/*/templates/`, `docs/dev/building.md:27` and `docs/dev/change-standard.md:77`, roadmap entry 23, no trigger phrase shared by two skills, the word diff of spec's description (seven "the" removed, "file; a" to "file. A", the trigger text unchanged), the report's copies identical by `cmp`.

## 1. Spec

1. `docs/dev/skill-layout.md`, "Writing for an agent", last bullet: the brief dictated "This page's rules apply to a skill's text when it is written or rewritten; applying them to every existing skill is roadmap entry 23 ...". The diff scopes it to "The rules of this section", decided as a judgment call where change-standard rule 4 asks for a stop. Consequence: the new Frontmatter rules on the description bind every existing skill now, while the pruning pass is scoped to the section.
2. The same section, first bullet: the brief's two sentences folded into "in the same bullet or in the Do instead cell of its Anti-patterns row", a second rewrite of dictated text settled as a judgment call (rule 4).
3. Frontmatter, "`Triggers on:` lists one phrase for each case the skill is for.": the ruled rule is "one trigger per case". Read plainly the page says exactly one phrase per case, while the rewritten spec description keeps four phrases for its one case, as brief item 4 required; the builder read the rule as "every case has a phrase". A conflict inside the brief on the meaning of a ruled rule: the user's decision.
4. The same section, fifth bullet, the clause "`templates/` stays for files copied into a repository", reported NOT DONE: the premise is false (`skills/ordo-init/SKILL.md:79` and `skills/repo-setup/SKILL.md:54` run scripts from `templates/`; `README.md:117` says `land.sh` runs from the skill), and the brief's Decision 1 rests on it. Correctly left out; the substitute sentence is owed by the orchestrator.

## 2. Proof

None. The report's "Doc text" grep also printed each skill's `description` line, which its summary leaves out; none is made false and no decision rests on it.

## 3. Standards

1. "Sections, in order", row 6 ("Any number of `## <label>` sections for material the steps point at: a script, a file format, a launch command.") against "Writing for an agent", fifth and sixth bullets: the cell neither states the new limit nor points at the section ("Lists and tables"; the page's Anti-patterns, first row; change-standard rule 19).
2. The introduction ("Every `skills/<name>/SKILL.md` follows this layout"): after the diff the page's own last bullet exempts existing skills from one section; the report does not reread the introduction under change-standard rule 14.
3. "Writing for an agent", third and last bullets: two semicolons added to running prose (4 in about 1,250 words after, 2 before), against the prose standard, "B. Punctuation" (at most 2 per 1000 words).

## 4. Behaviour

None.

## Not checked

- Whether each of the nine other descriptions satisfies the new rule on first words; the report states they do.
- Whether the `roadmap` description's mention of `/plan` breaks the older rule "It names no neighbouring skill": outside this step.
- The meaning of "one trigger per case" in the source the ruling cites: the clones are not kept.

## Repair round 1, refuted

Reviewer: claude:opus, a fresh agent; 110533 tokens, 21 tool uses, 204 s (from the completion notice). The round's delta read as `git diff 8bb98e8` against `agents/reviews/1-round-0.diff`.

```
checks.sh on the worktree: the six PASS lines, the ASCII check with no output, checks: 7 commands passed, exit 0
The length command: 726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 386 plan, 775 refute, 626 repo-setup, 630 roadmap, 999 spec
LC_ALL=C grep -n '[^ -~]' docs/dev/skill-layout.md skills/spec/SKILL.md: nothing
git diff 8bb98e8 --numstat: 17 2 docs/dev/skill-layout.md, 2 2 skills/spec/SKILL.md
Semicolons in running prose, the reviewer's own count: base 2 in 429 words, now 2 in 753 words
```

### Round items

Ruling 1 closed (line 64; the table of ten descriptions reproduced). Ruling 2 closed (bullet 58 unchanged). Ruling 3 not sent (open item A). Ruling 4 closed (line 62, the clause word for word, and it matches `ls skills/*/templates/`). Ruling 5 closed as dictated (see Standards 1). Ruling 6 closed (line 3; the reread of rule 14 holds). Ruling 7 closed (lines 60 and 64). Every changed line maps to a ruling; no check removed; the spec file unchanged by the round.

### Spec

None.

### Proof

1. The report's "Doc text" names two descriptions that name a neighbouring skill (roadmap, repo-setup); `skills/plan-help/SKILL.md:3` lists "(open, spec, build, refute, close, land, and the loop inside a step)", which may be a third, a reading call the report does not state.

### Standards

1. Row 6 of "Sections, in order" (line 33) now says reference sections hold material "that every run reads", and bullet 63 of "Writing for an agent" says the same: one rule in two places ("Where a rule goes"; the page's Anti-patterns row "The same rule written in two sections"; change-standard rule 19). From the ruling's dictated text; small and inside the brief.

### Behaviour

None.

### Not checked

- The meaning of "one phrase for each case": open item A.
- Whether "next step" of plan-orchestration could match a request meant for `/spec` or `/plan-help`.
- The builder's own semicolon counter, not visible; reproduced with the reviewer's own count.

## Closed

- First run, Spec 1 (the scope of the section): closed in repair round 1, ruling 1; the builder's scope stands.
- First run, Spec 2 (the first bullet): closed in repair round 1, ruling 2, no change.
- First run, Spec 3 (one trigger per case): raised to the user as open item A; applied on main when ruled.
- First run, Spec 4 (the `templates/` clause): closed in repair round 1, ruling 4.
- First run, Standards 1, 2, 3: closed in repair round 1, rulings 5, 6, 7.
- Round 1, Proof 1 (a third description naming a neighbour): no change; `skills/plan-help/SKILL.md`'s description lists the commands it prints, which is what the skill produces, not a pointer to a neighbouring skill for another case.
- Round 1, Standards 1 (row 6 and bullet 63 state one rule twice): fixed at landing; row 6's cell names the material and points at the limit "Writing for an agent" sets, and bullet 63 states the limit once.
- The report's "Doc text", two descriptions naming a neighbouring skill: applied at landing; `skills/roadmap/SKILL.md` "Keep the roadmap, the ordered list of work a plan is opened for:" and `skills/repo-setup/SKILL.md` "and the plan configuration .agents/plan.yaml.", each at version 1.1.1.
