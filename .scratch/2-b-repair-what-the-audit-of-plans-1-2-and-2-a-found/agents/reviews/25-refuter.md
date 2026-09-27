# Step 25 refuter report (on .agents/worktrees/2b-25, base aa0cd84)

Reviewer: a fresh claude:opus agent, read-only, under ruling DD. Usage: 209,926 tokens, 31 tool uses, 659 s.

## Verification (rerun by the reviewer)

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"`:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit=0
```

The ASCII check printed nothing.

Evidence commands, rerun:

- `git diff aa0cd84 --stat`: the ten `skills/*/SKILL.md` files only, `10 files changed, 312 insertions(+), 147 deletions(-)`. `git status --short`: the ten files `M`, and the report `??`. Matches the report.
- `wc -l skills/*/SKILL.md`: `1612 total`; the same over `git show aa0cd84:<f>`: 1447. Matches the report.
- An awk count of list items outside code fences: 707 before (land 101, ordo-init 60, plan-help 12, plan-orchestration 141, plan-retro 46, plan 39, refute 73, repo-setup 59, roadmap 50, spec 126) and 872 after (130, 66, 14, 203, 52, 46, 82, 65, 55, 159). Matches the report's table.
- Item lines removed and added per file in `git diff -U0`: 138 splits into 303 items, plus 1 reference line and 5 re-indented lines. Matches "138 split into 303".
- The position-reference grep: 105 lines after and 105 on the base; templates, docs and README unchanged (`git diff --quiet aa0cd84 -- skills/*/templates docs README.md` rc=0). `diff` of `file:reference` before and after prints only `ordo-init Rules 4, Rules 4` changed to `Rules 5, Rules 6`. Matches the report.
- Numbered items: section and number of every `N.` item, before and after, are identical in all ten files (209 items).
- The ordo-init reference changes (Steps 10 to `Rules 6`, "Rules 2 and 3" to "Rules 2, 3 and 4", "Rules 4" to "Rules 5 and 6") point at the same rules as before.
- plan-orchestration:301, "the round cap and the five bullets after it": the round cap at 308 is followed by five bullets (309 to 313), the split halves of the old two. Correct.
- plan-orchestration 151 and 152, "as the bullets above say", still point at 145 and 146.
- `grep -rnE 'SKILL\.md:[0-9]+|SKILL\.md\` line' docs README.md skills` printed nothing (rc=1).
- Word check over `git diff -U0`: only repeated subjects, repeated qualifiers, restored verbs and repeated bold labels are added, plus `two` changed to `five` at plan-orchestration 301. Matches the report's word-diff groups.
- The cases on the changed tree print what the report quotes.
- The brief's count of 187 flagged items: the reviewer's rerun gives 159, which agrees with the report that 187 does not reproduce.

## 1. Spec

1.1 New items that do not read alone, against What to build 3 ("the subject it names is repeated, so each new item reads alone"). Each is a sibling item whose subject is a pronoun or anaphor with its antecedent only in the item above; the report's judgment call 8 keeps them on purpose, which the brief does not allow:

- land:62 `- The lines it prints are what the booking quotes.`
- land:64 `- It is counted and named the same way as a red line.`
- land:66 `- It is counted as a fix at landing.`
- land:67 `- It is named in the booking with its cause.`
- land:177 `- Removing them, as "Removing a step's worktree" says, ...`
- land:194 `- Its preparation commit stays.`
- plan-orchestration:144 `- Each is named in the \`git add -- <path> ...\` command.`
- plan-orchestration:147 `- One on \`plan.md\` or the state file is a refusal of \`/spec\` ...`
- plan-orchestration:211 `- A later one lands on the head the earlier left, ...`
- plan-orchestration:241 `- No report carries it.`
- plan-orchestration:310 `- Its small findings, the last review's included, are fixed at landing.`
- plan-retro:40 `- They are matched by plan folder, step and run, ...`
- plan-retro:72 `- It is counted and listed in the retro's "No defect" section with no proposal.`
- refute:37 `- Where it rules a case, the diff is judged against the ruling.`
- refute:49 `- The lines it prints are what the refuter report quotes.`
- spec:110 `- Its section "The patch as applied" is added after Steps 7, ...`
- spec:121 `- \`/spec\` run again prepares the step with it.`
- spec:152 `- Run by hand, the session makes it before the build starts.`

## 2. Proof

2.1 The report's line 972, "No rule was added, removed or changed in scope", and its DONE row for What to build 3 are not reproduced: findings 4.1 to 4.7 are splits that dropped a condition from one half.

All counts the report gives were reproduced.

## 3. Standards

3.1 Repeated construction, against `skills/repo-setup/templates/docs/dev/prose-standard.md` section 0, "No repeated construction":

- plan-orchestration:95-101: seven consecutive items open `- **Only known fixes.**`, three of them continuing "A cause not found is ...".
- plan-orchestration:311-313: three consecutive items open `- Everything else that the rounds left undone, or that lies beyond the brief,`.
- plan-orchestration:64-70: `**\`inline\`.**` three times and `**\`academic-paper\`.**` four times.
- plan-orchestration:123-125: `**Orchestrator.**` three times.

The brief's What to build 3 and Decision 1 lead to this; the fix is a structural choice for the orchestrator, such as one labelled item with nested sub-bullets, the form plan:64-70 now uses.

## 4. Behaviour

Splits that changed a rule's scope (rule 17 of `docs/dev/change-standard.md`): a condition that governed both halves stays only in the first item.

- 4.1 plan-help:43-44: `- The next line is \`Ruled: ...\`.` lost its condition (an open item waiting on a ruling); the two clauses describe one output, which What to build 2 keeps joined.
- 4.2 spec:37-38: `- The step goes through "Steps / A step taken back out of main", ...` read alone sends every step through the back-out procedure.
- 4.3 spec:199-200: `- the step's tag names it as "What it reads" 4 reads it: ...;` reads as a rule for every ruling, and "it" has no antecedent.
- 4.4 refute:51-52: `- The reviewer reproduces what it can from the one build.` lost "Where a claim needs a second build".
- 4.5 land:116-117: `- The note says so.` states nothing on its own; the first half is a definition the rule uses, which What to build 2 keeps joined.
- 4.6 spec:70-71: `- So is a step not in the list, with the list printed.` has no predicate read alone.
- 4.7 land:70-72: `- The step's worktree and branches are kept.` / `- The step stays unticked in \`plan.md\`.` lost the back-out condition; read alone they contradict Steps 10 ("Tick the step.") and Steps 14.
- 4.8 plan-orchestration:48-50: `- The loop moves on to the next unblocked step.` drops the condition "a stop"; the brief's Cases 4 prescribes this text, so it is for the orchestrator's ruling.

## Not checked

- The 569 kept items were not judged one by one; every hunk was read, and every current item still holding a semicolon or a second sentence outside code, parentheses and quotes. Items joined only by "and" were checked by sample.
- The report's own scripts (`items.sh`, `refs.py`, `numbered.py`) are not in the tree; their results were reproduced with the reviewer's own commands.
- How the three-level nesting at plan:64-70 renders in a Markdown viewer.

## Orchestrator's read of the diff

Items still holding two requirements that can each be broken while the other holds:

- land:149 and spec:160: "The branch is the worktree folder's name, and `<branch>-land` beside it ...; no path or branch is built from the step id." (a definition, then an independent rule).
- plan-orchestration:162: "A step at `landing: backed-out` was taken back out of main by a red line at its landing. Its worktree and its branches are kept." (a definition, then an independent rule).
- plan-orchestration:260: "At the cut-off anything still running is stopped, its worktree kept."
- spec:120: "What "Steps / A step taken back out of main" did stays done. The patch stays in the ledger."

## Repair round 1, refuted

Reviewer: a fresh claude:opus agent, read-only. Usage: about 160,000 tokens, 36 tool uses.

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"` from the worktree root:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
exit=0
```

Reproduced: `10 files changed, 313 insertions(+), 145 deletions(-)`; 1447 to 1615 lines; 707 items read, 136 split into 304, 875 after; 209 numbered items with the same sections and numbers; 105 position references, the one change ordo-init `Rules 4` to `Rules 5`, each pointing at the same rule; the prose references at plan-orchestration 303 and 151-152 on their rules; `**Only known fixes.**` once; no repeated label, no nesting over three levels. Each of the twelve rulings holds on the current tree at the file:line the report gives.

- Spec: none.
- Proof: none.
- Standards 1: `skills/plan-retro/SKILL.md:43-45` open "For each kind" three times in a row ("3. For each kind, count the findings, ...", "4. For each kind, name the heading ...", "5. For each kind, quote two or three findings ..."), against ruling A 4 and `prose-standard.md` section 0; round ruling 2 covers every place in the ten files. The builder left the lines as base text.
- Behaviour: none.

Not checked: the 571 kept items were not re-judged one by one (the 61 that still hold a semicolon or a second sentence were read); items joined only by "and" were checked in and around the hunks; the rendering of three-level nesting.

## Closed

- Spec 1.1 (eighteen items that did not read alone): closed in round 1, ruling 1; the round's review reproduces each at the file:line of the report's "Repair round 1" table.
- Proof 2.1 (the report's claim that no rule changed in scope): closed in round 1, ruling 12; `grep -n "No rule was added" 25-report.md` prints nothing.
- Standards 3.1 (repeated labels and openings): closed in round 1, ruling 2; `grep -c '\*\*Only known fixes\.\*\*' skills/plan-orchestration/SKILL.md` prints 1.
- Behaviour 4.1 to 4.8: closed in round 1, rulings 3 to 10; the round's review finds none left.
- The orchestrator's read (five items holding two requirements): closed in round 1, ruling 11.
- Repair round 1, Standards 1 (plan-retro Steps 3 to 5): fixed at landing, since round ruling 2 covers every place in the ten files; the three items are reworded so no two open alike, with their numbers and meaning kept.
