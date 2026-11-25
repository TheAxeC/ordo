# Step 9 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-9, base b154a37)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' skills/academic/researcher/agents/research_builder_agent.md skills/academic/researcher/agents/research_reviewer_agent.md skills/academic/researcher/references/slurm.md skills/academic/researcher/SKILL.md | xargs -0 perl -CSD -ne '...'; echo "exit=$?"
exit=0

$ git diff b154a37 --numstat     (the brief's item 2 names `git diff --numstat`; run here against the base, the one form of git diff the reviewer runs; the tree is uncommitted, so the two give the same lines)
3<tab>2<tab>skills/academic/researcher/SKILL.md
1<tab>1<tab>skills/academic/researcher/agents/research_builder_agent.md
1<tab>1<tab>skills/academic/researcher/agents/research_reviewer_agent.md
2<tab>0<tab>skills/academic/researcher/references/slurm.md
(7 added, 4 removed, 11 in all; also counted from `git diff b154a37` with awk: added=7 removed=4 total=11)

$ grep -n 'small local test' <the four pages>
research_builder_agent.md:3, :10, :23, :44
research_reviewer_agent.md:3, :10, :22, :46
slurm.md:8, :30, :32, :37, :39
SKILL.md:295, :693, :694
(each of the five places of "What to build" is among them: builder :10, reviewer :10, slurm.md :37, SKILL.md :295 and :693)

$ git status --short
 M skills/academic/researcher/SKILL.md
 M skills/academic/researcher/agents/research_builder_agent.md
 M skills/academic/researcher/agents/research_reviewer_agent.md
 M skills/academic/researcher/references/slurm.md
?? .scratch/13-researcher/agents/reviews/9-report.md

Commands the builder's report quotes:
$ sed -n '/[Oo]pen items/,/^## /p' .scratch/13-researcher/orchestrator-state.md   -> heading and standing paragraph only, as quoted
$ grep -n 'every job\|any job\|Every job\|every other job\|Every other job' <the four pages>
research_reviewer_agent.md:10, research_reviewer_agent.md:22, slurm.md:3, slurm.md:27, SKILL.md:10, SKILL.md:720
(the report lists all of these except research_reviewer_agent.md:10; see Proof 1)
$ wc -l <the four pages>   -> 48, 50, 39, 748, as the report gives
$ sed -n 5p skills/academic/researcher/SKILL.md   ->   version: "1.0.0"
Premises of "What is on the tree", run on the base with git show b154a37:<path>: builder line 10 and 23-26, reviewer line 10, SKILL.md 294 and 692, slurm.md 30-37 read as the brief quotes them; the premise grep over research_brief.md, research_stages.md, project_layout.md prints nothing (rc=1).
```

## Verdicts

Items of the brief's "What to build", in its bullet order (0 for the lead paragraph):

- 0 (each page that says when a job of a piece is submitted names the test job as the one job before review, with the reason, every other job still waiting): holds for the four pages of the skill, with the defects of Standards 1 and 2 at SKILL.md item 8; README.md and the glossary, outside the skill's pages, are Standards 3 and 4.
- 1 (builder's page line 10): holds; `research_builder_agent.md:10` names the test as the one job it submits on a cluster, before the review, with the reason and the pointer to `references/slurm.md`.
- 2 (reviewer's page line 10): holds; `research_reviewer_agent.md:10` reads "before any job of it is submitted other than the builder's small local test", and the reviewer's own rerun happens during its read, so the sentence is true.
- 3 (`references/slurm.md` "A small local test", one bullet with the reason): holds; `slurm.md:37`, with `slurm.md:38` added for the jobs that wait, which the lead paragraph asks for.
- 4 (`SKILL.md` item 8 and the Anti-patterns row each name the exception): holds for the naming (`SKILL.md:295`, `SKILL.md:693`); the shape of item 8 is Standards 1, and the row's third cell is Standards 2.
- 5 (no other line changes, no new glossary term, version stays): holds; numstat lists only the four pages, `docs/glossary.md` is unchanged, `version: "1.0.0"`.

Cases of the brief's "Cases":

- No sentence says or implies that every job of a piece waits for the review, and each of the five places names the test job: partial. The five places name it. `SKILL.md:294` read alone says no job of the piece is submitted before its first reviewer's report, which is false for the reviewer's own rerun of the test job and is excepted for the builder's test only in a separate bullet (Standards 1).
- The baseline's and the experiments' jobs still wait for a reviewer's report with no finding that makes a result false: met; builder `:10`, `slurm.md:38`, `SKILL.md:294`, `SKILL.md:693`.
- Off a cluster the test runs where the session runs, and no sentence of the change makes it a job there: met; every new sentence about the test job is scoped "On a cluster", and `slurm.md:39` and builder item 4 are unchanged.

## 1. Spec

- none. The step is a small text step by the glossary's entry **small text step**: no script, test or configuration file changed, 11 lines added plus removed. The diff stays inside "Paths this step writes" (the added `SKILL.md:295` is inside item 8, `slurm.md:37-38` inside lines 30-37 of the base). No ADR is contradicted: ADR 0056's decision "the one job of the piece submitted before its reviewer reads the code" is what the five places state, and ADR 0053's superseded sentence is the only one the diff departs from.

## 2. Proof

- Builder's report, "The cases' first read", the reading after the change: "`grep -n 'every job\|any job\|...'` over the four pages prints only `SKILL.md` lines 10 and 720, `slurm.md` lines 3 and 27 and the reviewer's line 22"; what is wrong: the rerun also prints `research_reviewer_agent.md:10` ("before any job of it is submitted other than the builder's small local test"), the changed line itself; the decision resting on it is the report's verdict "case 1 is met"; that line, read, carries its exception and does not make case 1 fail, but the grep was quoted as covering what it did not; failure scenario: the orchestrator accepts case 1 as met on a grep output that omits the one changed line the grep was meant to clear; verdict: none on its own.
- Builder's report, "Terms": "The reviewer entry's clause 'no job of the piece is submitted while its report holds a finding that makes a result false' still holds after the change, since the builder's test job is submitted before any report exists"; what is wrong: for a brief after the first (`<piece>-brief-<n>` with n above 1, SKILL.md item 8, "Send each finding ... back to a builder through a new brief"), the new builder runs its test job while the newest report, report n-1, holds a finding that makes a result false; a report does exist then; the decision resting on it is that `docs/glossary.md` needs no change; see Standards 4; verdict: none on its own.

## 3. Standards

- 1. `skills/academic/researcher/SKILL.md:294-295`: "- Submit no job of the piece before its first reviewer's report, or while its newest reviewer's report holds a finding that makes a result false." / "- On a cluster, the builder's small local test is the one job of the piece submitted before the review, ..."; what is wrong: the rule and its exception are two bullets, where `docs/dev/skill-layout.md`, "Lists and tables", says "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule"; and the clause the builder added, "before its first reviewer's report", is broader than ADR 0056's "before its reviewer reads the code": on a cluster the reviewer's own rerun of the test (`research_reviewer_agent.md` item 3, `slurm.md:34`) is a job of the piece submitted before the first reviewer's report, and the exception names only the builder's test. The builder's report, "Judgment calls", gives this same reason for not writing "every other job waits for the report" elsewhere, and then writes it here. The rule also reads as forbidding the rebuilt piece's test job "while its newest reviewer's report holds a finding", which the exception covers only if "the review" is read as each review. ADR 0056's second decision bullet ("Every other job of the piece, of the baseline and of the experiments, is submitted only after a reviewer's report ...") carries the same wording, its apposition giving the narrower meaning, so a fix that names "the jobs of the baseline and of the experiments", as the builder did at `slurm.md:38` and the builder's line 10, matches the ADR; change-standard rule 19 (no two statements that contradict each other); failure scenario: a session or a later maintainer reads item 8's first bullet as the whole rule, finds that the reviewer submits a test job before any report exists, and either judges the reviewer's page wrong or holds the rerun back until after the report, which the reviewer cannot write without it; verdict: case 1 partial. Small and inside the brief's paths: fixable at landing by one bullet, for example "Submit no job of the baseline or of the experiments from the piece before its first reviewer's report, or while its newest reviewer's report holds a finding that makes a result false; on a cluster the small local test is the one job of the piece submitted before the review, since ...".
- 2. `skills/academic/researcher/SKILL.md:693`, Anti-patterns row, Do instead cell: "Submit the jobs of the baseline and of the experiments only after a reviewer's report with no finding that makes a result false; on a cluster the builder's small local test is the one job submitted before the review, since nothing may compute on the login node and the test produces no result ("research" item 8)"; what is wrong: the cell restates item 8's exception and its reason in full, and the row's first cell already names the exception; `docs/dev/skill-layout.md`, "Where a rule goes", "A rule is written once. Another place that needs it names the section it is in", and "Lists and tables", "A cell holds a phrase or a sentence"; the brief's decision 1 allows the reason at each place in one clause, which covers the reason, not a second statement of the rule; failure scenario: a later change to item 8's exception leaves the Do instead cell stating the old one, and a reader cannot tell which holds; verdict: none. Fixable at landing: the cell ends after "with no finding that makes a result false ("research" item 8)".
- 3. `README.md:34`, the `researcher` row: "Each piece of code is built by a fresh builder from a brief the session writes and read by a fresh reviewer before any job runs"; what is wrong: after the diff the skill states, at five places, that on a cluster the builder's test job runs before the review, and the public README says no job runs before it; change-standard rules 14 and 19 (grep the changed rule across `skills/`, `utils/`, `docs/` and `README.md`; a statement that says otherwise is changed in the same step or reported as a stop); the builder's report does not name it; the brief's scope ("each page of the skill") and its "What is on the tree" grep did not cover `README.md`, so it is outside "Paths this step writes"; failure scenario: a user reads the README, expects no cluster job before review, sees the builder's `test-<piece>.sh` in `squeue` before any review exists and takes it for a fault; verdict: none (outside the items). A one-clause change, for example "before any job runs other than the builder's small local test"; landing it widens the step's paths, which is the orchestrator's call.
- 4. `docs/glossary.md:178`, **reviewer, of `research`**: "no job of the piece is submitted while its report holds a finding that makes a result false"; what is wrong: on a cluster the builder of a brief after the first submits its test job while the newest report holds such a finding (Proof 2), and item 8 now names that test as an exception the glossary entry lacks; the sentence was already false at the base in this case, and the diff makes the exception explicit at five places but not here; change-standard rule 19; the brief says "No new term enters the glossary", which does not forbid correcting an existing entry's sentence, but the glossary is outside "Paths this step writes"; failure scenario: a reader of the glossary concludes that a rebuilt piece may not run its test on a cluster until a clean report exists, which no report can exist without; verdict: none (outside the items). The entry is defined only in `docs/glossary.md` (`grep -rln 'reviewer, of `research`' skills docs` prints only that file), so a fix is one clause there, for example "no job of the baseline or of the experiments is submitted while ...".

## 4. Behaviour

- none. The report gives each of the five changed places with its before and after, which this review reproduced from `git diff b154a37`.

## Declined to judge

- `SKILL.md` Rules, "In `research` and in the campaigns of `revision`, the session directs the work ... writes the README and submits the jobs": judged, not a finding. The sentence lists the session's own duties and says it submits the jobs of the stages ("research" item 10); it says no job is submitted by anyone else, and the builder's and the reviewer's test jobs were already theirs at the base. The diff leaves it no less true. I agree with the builder's report.
- `docs/roadmap.md` entry 13's goal, "read by a fresh reviewer before any job is submitted": the goal text is the user's; ruling L (a) kept it and carried the exception into the skill and ADR 0056. Whether the goal's wording changes is the user's call.
- The builder's page "the one job you submit is your small local test" beside its item 5, "at most 3 runs in all": the sentence names one kind of job submitted up to three times. The wording is ADR 0056's. I read it as unambiguous to a builder and raise no finding; whether to say "the one kind of job" is a wording choice for the orchestrator.
- The plan's step 9 line names `references/research_brief.md` and `SKILL.md`'s Rules among the pages to change; the brief, by its premise grep, changes neither. Reproduced: `references/research_brief.md` "The small local test" points to `references/slurm.md`, "A small local test", and states no review timing, and no Rules bullet ties a job to the review. No change is owed there.
- Whether git ignores `.scratch/13-researcher/agents/reviews/9-report.md` in the worktree (it shows as `??`): only `git check-ignore` would settle it, a git command outside the three the reviewer runs.

Reviewer usage: a12170d055f42a91d, claude-opus-5-5, 129788 tokens, 28 tool uses, 5m 14s.

## Closed

- Standards 1: closed at landing. `SKILL.md` "research" item 8: the rule and its exception are one bullet, and the rule names the jobs of the baseline and of the experiments, as ADR 0056 does, so that the reviewer's rerun of the test is no longer barred by it.
- Standards 2: closed at landing. The Anti-patterns row's Do instead cell ends after "with no finding that makes a result false ("research" item 8)".
- Standards 3: closed at landing. `README.md`, the `researcher` row: "before any job runs other than the builder's small local test".
- Standards 4: closed at landing. `docs/glossary.md`, **reviewer, of `research`**: "no job of the baseline or of the experiments is submitted while its report holds a finding that makes a result false".
- Proof 1 and Proof 2: claims of the builder's report, no change to the tree; the line the grep omitted carries its exception, and the glossary sentence of Proof 2 is the one Standards 4 changed.
