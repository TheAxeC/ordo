# Builder's report: step 9, the builder's test job before review

Everything in the brief is done.

## Open items of the state file

None. The section "Open items" of `.scratch/13-researcher/orchestrator-state.md` in this worktree holds only its heading and its standing paragraph, read with `sed -n '/[Oo]pen items/,/^## /p' .scratch/13-researcher/orchestrator-state.md`:

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.
```

## The cases' first read (unchanged tree at b154a37, read with `sed -n '10p;23,26p'` on the builder's page, `sed -n '10p'` on the reviewer's page, `sed -n '30,37p'` on `references/slurm.md` and `sed -n '294p;692p'` on `SKILL.md`)

- No sentence says or implies that every job of a piece waits for the review, and each of the five places names the test job: not met. The reviewer's page line 10 says the read comes "before any job of it is submitted", and the Anti-patterns row "A job submitted before the reviewer's report" makes every job wait. The builder's page line 10, `references/slurm.md` "A small local test" and "research" item 8 do not name the test job as submitted before the review. None of the five places names it.
- The jobs of the experiments and of the baseline still wait for a reviewer's report with no finding that makes a result false: met in `SKILL.md` "research" item 8 and the Anti-patterns row. The builder's page line 10 names only the experiments' jobs ("the session submits them after a reviewer has read your code").
- Off a cluster the test runs where the session runs, not as a job: met. `references/slurm.md` line 37 "Off a cluster, the small local test runs where the session runs." and the builder's item 4 "off a cluster where you run".

No case was one the brief's rules get wrong.

Reading after the change: case 1 is met (the five places, quoted under "Host- or user-visible changes", each name the builder's small local test as the one job before the review, and no sentence of the four pages says every job waits: `grep -n 'every job\|any job\|Every job\|every other job\|Every other job'` over the four pages prints only `SKILL.md` lines 10 and 720, `slurm.md` lines 3 and 27 and the reviewer's line 22, none of which ties a job to the review). Case 2 is met: the builder's line 10, `slurm.md` line 38, `SKILL.md` line 294 and the Anti-patterns row each keep the baseline's and the experiments' jobs behind a reviewer's report with no finding that makes a result false. Case 3 is met: every new sentence about the test job opens with or sits under "On a cluster", and `slurm.md` line 39 still reads "Off a cluster, the small local test runs where the session runs."

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| Builder's page line 10 names the test job as the one job it submits before the review, on a cluster | DONE | `grep -n 'small local test' ...` prints `research_builder_agent.md:10:` with the new sentence |
| Reviewer's page line 10 made true | DONE | the same grep prints `research_reviewer_agent.md:10:` |
| `references/slurm.md` "A small local test": the bullet with the reason | DONE | the same grep prints `slurm.md:37:`; line 38 holds the baseline's and the experiments' jobs |
| `SKILL.md` "research" item 8 names the exception | DONE | the same grep prints `SKILL.md:295:` |
| `SKILL.md` Anti-patterns row names the exception | DONE | the same grep prints `SKILL.md:693:` |
| Character-set check over the changed files | DONE | prints only `exit=0` |
| Fewer than 20 lines added plus removed | DONE | `git diff --numstat` prints `3 2 SKILL.md`, `1 1 research_builder_agent.md`, `1 1 research_reviewer_agent.md`, `2 0 slurm.md`: 7 added, 4 removed, 11 in all |
| No new glossary term, version stays | DONE | `docs/glossary.md` unchanged (`git diff --numstat` lists no glossary line); `SKILL.md` line 5 still `version: "1.0.0"` |

## Prose standard: list items and sentence length

Read against `skills/ordo/ordo-init/templates/docs/dev/prose-standard.md`, "Sentence length" (under roughly 20 words unless the mechanism needs more), "Semicolons" and the one-rule-per-bullet convention.

- Each new bullet states one rule. The rule of "research" item 8 and its exception are two bullets (lines 294 and 295), and in `slurm.md` the test job and the jobs that wait are two bullets (lines 37 and 38).
- Departures from the sentence length: the builder's line 10 sentence "On a cluster, the one job you submit ..." (about 33 words), the reviewer's line 10 first sentence (about 31 words) and second (about 25), `slurm.md` line 37 (about 35 words), `SKILL.md` line 294 (about 27 words) and line 295 (about 35 words). Each carries the rule, its scope "On a cluster" and its reason in one clause, as the brief's decision 1 asks, and the pointer to `references/slurm.md`.
- Semicolons: none in running prose. The Anti-patterns row's third cell holds one, in a table cell, which the standard does not count.

## Terms

The diff uses no glossary term in a new sense. "builder, of `research`" and "reviewer, of `research`" (`docs/glossary.md` lines 150 and 178) are used as their entries give them. The reviewer entry's clause "no job of the piece is submitted while its report holds a finding that makes a result false" still holds after the change, since the builder's test job is submitted before any report exists.

## Files with line counts (`wc -l`)

- `skills/academic/researcher/agents/research_builder_agent.md`: 48
- `skills/academic/researcher/agents/research_reviewer_agent.md`: 50
- `skills/academic/researcher/references/slurm.md`: 39
- `skills/academic/researcher/SKILL.md`: 748
- `.scratch/13-researcher/agents/reviews/9-report.md`: this report

## Judgment calls the brief left open

- `SKILL.md` line 294 gains "before its first reviewer's report, or": the old sentence only barred a job while the newest report held a finding, so it gave no rule for the test job to be an exception to. The added condition is the one the Anti-patterns row and ADR 0056 already state. The exception is a new bullet, line 295, inside item 8, one line past the brief's "line 294".
- The new bullets in `slurm.md` sit after the bullet on the cancelled test job (lines 37 and 38), not after line 34, so that the bullet "They run `sbatch --wait` ..." keeps "The builder and the reviewer" as its antecedent.
- The sentences on the jobs that wait name "the jobs of the baseline and of the experiments" (builder's line 10, `slurm.md` line 38, the Anti-patterns row's third cell), not "every other job of the piece". The reviewer reruns the test as a job during its read, before its report, so "every other job waits for the report" would be false. The words are those of ADR 0056.
- The Anti-patterns row's first cell reads "A job submitted before the review" in place of "before the reviewer's report", for the same reason.

## Host- or user-visible changes

- `research_builder_agent.md` line 10. Before: "You build nothing the brief does not name, and you never submit a job of the project's experiments: the session submits them after a reviewer has read your code." After: "You build nothing the brief does not name. On a cluster, the one job you submit is your small local test, before a reviewer reads your code, since nothing may compute on the login node and the test produces no result (`references/slurm.md`, "A small local test"). The session submits the jobs of the baseline and of the experiments after a reviewer's report with no finding that makes a result false."
- `research_reviewer_agent.md` line 10. Before: "..., before any job of it is submitted." After: "..., before any job of it is submitted other than the builder's small local test. On a cluster that test runs as a short job before your read, since nothing may compute on the login node and the test produces no result (`references/slurm.md`, "A small local test")."
- `references/slurm.md`, "A small local test", new lines 37 and 38: "On a cluster, the builder's small local test is the one job of a piece submitted before its reviewer reads the code, since nothing may compute on the login node and the test produces no result." and "The jobs of the baseline and of the experiments wait for a reviewer's report with no finding that makes a result false."
- `SKILL.md` "research" item 8. Before: "Submit no job of the piece while its newest reviewer's report holds a finding that makes a result false." After: "Submit no job of the piece before its first reviewer's report, or while its newest reviewer's report holds a finding that makes a result false." and the new bullet "On a cluster, the builder's small local test is the one job of the piece submitted before the review, since nothing may compute on the login node and the test produces no result (`references/slurm.md`, "A small local test")."
- `SKILL.md` Anti-patterns row. Before: "| A job submitted before the reviewer's report | ... | Submit only after a reviewer's report with no finding that makes a result false ("research" item 8) |". After: "| A job submitted before the review, other than the builder's small local test | ... | Submit the jobs of the baseline and of the experiments only after a reviewer's report with no finding that makes a result false; on a cluster the builder's small local test is the one job submitted before the review, since nothing may compute on the login node and the test produces no result ("research" item 8) |".

## Wrong or impossible in the brief

Nothing in the brief was wrong or impossible. One sentence outside the paths, left unchanged as rule 20 of the change standard asks: `SKILL.md` Rules line 713 (712 at the base) says that in `research` the session "submits the jobs". It does not tie a job to the review, and the builder already submitted its test job on a cluster at the base, so the change makes it no less true. Whether it should name the builder's test job is the orchestrator's call.

Report path: /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-9/.scratch/13-researcher/agents/reviews/9-report.md
