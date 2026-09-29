Everything in the brief is done, item 12 of ruling F included.

# Step 9 report, the glossary

## Open items of the state file, verbatim

None.

(Read from the state file in the main checkout with `sed -n '/^## Open items/,/^## Closed items/p' .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`; the worktree's copy says the same.)

## First run on the unchanged tree

Script cases: the extended `sync_rules.test.sh` was run against the unchanged `sync_rules.py` (saved before any change), in a scratch copy of `templates/` that also held the new `plan-terms.md` and `docs/glossary.md` template the fixtures are built from, with `fail()` made non-fatal so that every case reports. It printed 63 `FAIL:` lines. Every case of the brief failed on the unchanged script except "`--write` where `CLAUDE.md` cannot be written: the glossary not written", which held because the unchanged script never writes the glossary; every case of the test before this step passed. The `FAIL:` lines, the scratch paths shortened to `<scratch>` and the unchanged script to `<old>`, each cut at 200 characters:

```
FAIL: equal blocks: stdout is [ok: the shared-rules block equals the template], expected [ok: the shared-rules block equals the template
FAIL: python3 -B <old>/sync_rules.py <scratch>/terms-drift: exit 0, expected 1: [ok: the shared-rules block equals the template] []
FAIL: a drifted glossary does not print the ok: line and its diff: [ok: the shared-rules block equals the template]
FAIL: two drifted blocks do not print both diffs in order: [--- CLAUDE.md (shared rules)
FAIL: --write of both blocks: stdout is [written: the shared-rules block now equals the template], expected [written: the shared-rules block now equals the template
FAIL: python3 -B <old>/sync_rules.py <scratch>/no-glossary: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: no glossary: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: no glossary: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/no-terms-block: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary with no block: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary with no block: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/two-terms-blocks: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary with two blocks: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary with two blocks: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/reversed-terms: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary with reversed markers: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary with reversed markers: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/quoted-marker: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: a marker quoted in prose: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: a marker quoted in prose: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/terms-not-utf8: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary not UTF-8: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary not UTF-8: stderr is not [error: ...<scratch>/terms-not-utf8/docs/glossary.md is not UTF-8 (byte ...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/terms-not-utf8 --write: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary not UTF-8, --write: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary not UTF-8, --write: stderr is not [error: ...<scratch>/terms-not-utf8/docs/glossary.md is not UTF-8 (byte ...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/terms-dir: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: glossary a directory: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: glossary a directory: stderr is not [error: ...cannot read <scratch>/terms-dir/docs/glossary.md: Is a directory...]: []
FAIL: python3 -B <scratch>/lone-script/sync_rules.py <scratch>/lone: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: no plan-terms.md: stdout is not empty: [ok: the shared-rules block equals the template]
FAIL: no plan-terms.md: stderr is not [error: ...cannot read <scratch>/lone-script/plan-terms.md: No such file or directory...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-no-claude --only glossary: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary, equal: stdout is [], expected [ok: the plan-terms block equals the template]
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-no-claude --only glossary: exit 2, expected 1: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary on a drifted block does not print its diff: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-drifted-rules --only glossary: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary beside a drifted shared-rules block: stdout is [], expected [ok: the plan-terms block equals the template]
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-no-rules-block --only glossary: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary beside no shared-rules block: stdout is [], expected [ok: the plan-terms block equals the template]
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-write --only glossary --write: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary --write: stdout is [], expected [written: the plan-terms block now equals the template]
FAIL: python3 -B <old>/sync_rules.py <scratch>/only-write --only glossary: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: python3 -B <old>/sync_rules.py --only glossary <scratch>/args: exit 2, expected 0: [] [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary before the path: stdout is [], expected [ok: the plan-terms block equals the template]
FAIL: --only with another value: stderr is not the usage line: [Usage: sync_rules.py <repository root> [--write]]
FAIL: two paths: stderr is not the usage line: [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only last with no value: stderr is not the usage line: [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only=glossary: stderr is not the usage line: [Usage: sync_rules.py <repository root> [--write]]
FAIL: --only glossary twice: stderr is not the usage line: [Usage: sync_rules.py <repository root> [--write]]
FAIL: python3 -B <old>/sync_rules.py <scratch>/drift-no-glossary: exit 1, expected 2: [--- CLAUDE.md (shared rules)
FAIL: drifted rules, no glossary: stdout is not empty: [--- CLAUDE.md (shared rules)
FAIL: drifted rules, no glossary: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: python3 -B <old>/sync_rules.py <scratch>/drift-no-glossary --write: exit 0, expected 2: [written: the shared-rules block now equals the template] []
FAIL: drifted rules, no glossary, --write: stdout is not empty: [written: the shared-rules block now equals the template]
FAIL: drifted rules, no glossary, --write: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: []
FAIL: --write changed CLAUDE.md beside a missing glossary
FAIL: two files in error do not print both error lines in order: [error: CLAUDE.md has no single shared-rules block (<!-- ordo:shared-rules begin --> ... <!-- ordo:shared-rules end -->)]
FAIL: --write of the glossary alone: stdout is [ok: the shared-rules block equals the template], expected [ok: the shared-rules block equals the template
FAIL: python3 -B <scratch>/fake-open.py denied glossary.md <old>/sync_rules.py <scratch>/terms-denied --write: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: a glossary that cannot be written does not print its error line: []
FAIL: python3 -B <scratch>/fake-open.py lost glossary.md <old>/sync_rules.py <scratch>/terms-lost --write: exit 0, expected 2: [ok: the shared-rules block equals the template] []
FAIL: a glossary that does not read back does not print its error line: []
```

Text cases, by command and by reading on the unchanged tree:

- `git grep -n -i 'glossary' -- skills docs/dev README.md .agents/plan.yaml` exited 1 with nothing; `ls docs` printed `academic-coverage.md dev roadmap.md`; `ls skills/repo-setup/templates/docs` printed `adr dev`.
- `grep -n 'glossary' docs/dev/skill-layout.md skills/repo-setup/templates/CLAUDE.md docs/dev/building.md .agents/plan.yaml README.md` exited 1 with nothing.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `Usage: sync_rules.py <repository root> [--write]` and exited 2.
- The gate's length command printed 630 for `skills/repo-setup/SKILL.md`, and at most 1022 (`spec`) for every skill.
- The six terms, the table of terms, the completeness sweep and the template: no `plan-terms.md`, glossary or template existed, so each had nothing to read.
- Ruling F's case: `grep -n 'glossary' skills/ordo-init/SKILL.md` exited 1 with nothing.

No case of the brief's rules gave a wrong result, so nothing was handed back.

## `skills/repo-setup/templates/plan-terms.md`, whole

```markdown
## Plan terms

- **A/B**: the landing's comparison of the staged base binaries with the new build, the benchmark commands the configuration block's `bench:` names run alternately after warm-ups, at least ten runs each; an empty `bench:` means no A/B. Stated in: `land`, Steps 8; `spec`, Steps 8.
- **acceptance item**: a requirement of the brief's "What to build"; one the delta leaves unbuilt, with a fix too large for landing, is one of the two conditions that allow a round beyond `repair_rounds`. Stated in: `plan-orchestration`, Rules.
- **authority**: the tags that end a step line of `plan.md`, `(approved)` for a step of the list the user approved when the plan opened and `(ruling <name>)` for each ruling the step rests on; `/spec` refuses a step without it. Stated in: `plan`, Rules; `spec`, "What it reads" 4 and Steps 1.
- **bar**: the standard a builder's first report meets when its step lands with at most one fix at landing; the booking and the landing report state whether it passed, and under `review: earned` a failed bar puts the reviewer back. Stated in: `land`, Steps 9 and 11; `plan-orchestration`, "The review, earned".
- **base**: the hash of a step's preparation commit, recorded in its dispatch entry: the worktree is created from it, the step's diff is read against it, and `/land` cherry-picks the range from it; the base binaries are the build `/spec` stages from it for the A/B. Stated in: `spec`, Steps 6, 7 and 8; `land`, Steps 4; `refute`, "What it reads" 5.
- **booking**: the record `/land` appends to `plan.md` for a landed step: what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
- **brief**: the file `agents/briefs/<step>.md` that `/spec` writes for a step's builder, holding the checked premises, what to build, the cases, the paths the step writes, the decisions taken, the verification and the report shape; a repair round adds the round's brief, and a ruled case a cases ruling `agents/briefs/<step>-cases.md`. Stated in: `spec`, Steps 4; `plan-orchestration`, Steps 6 and 8.
- **brief check**: the check of a brief against the tree, before the preparation commit, by one fresh read-only agent on the reviewer's model (the brief-check agent), whose report is saved at `agents/reviews/<step>-brief-check.md` and each of whose findings is closed by a change to the brief or is a stop. Stated in: `spec`, Steps 5 and "Steps / The brief check".
- **builder**: the agent that builds one step in the step's worktree under the brief and the rules file, runs no git command and writes in the ledger only its report; under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
- **capability map**: an index the roadmap's introduction links as the map of what the product is, one file per system with each capability's full scope, over which the roadmap is the ordered build plan. Stated in: `roadmap`, "A capability map beside the ordered file".
- **case**: an example under a brief's "Cases", an input with its expected result, each must-pass and must-refuse example the step's text gives and, for a code step, each input it implies; the builder's first run of every case on the unchanged tree comes before any change, a code step's case as a test and a text step's by reading. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run, at least five of them. Stated in: `spec`, Steps 4.
- **Closed**: the heading of a report that holds each finding's disposition: in a brief-check report the change to the brief that closed it, in a refuter report whether it was closed in a round, fixed at landing or raised as an open item. Stated in: `spec`, "Steps / The brief check"; `refute`, "Finding dispositions". The closed items of the state file are also the log of what was raised and how it ended, which no report carries. Stated in: `plan-orchestration`, "Reports".
- **closing step**: the last step of every plan, which `/plan` writes itself: the roadmap entry ticked with the gate's output through `/roadmap done`, and the ledger folder moved to `<archive_root>/`. Stated in: `plan`, Steps 2.
- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
- **completion notice**: what the runner reports when an agent ends: its final message, and its tokens, tool uses and time, which the dispatch entry records and the booking states. Stated in: `plan-orchestration`, Steps 6 and "Launching a builder"; `land`, Steps 9.
- **configuration block**: the first `yaml` block of the state file, filled by `/plan` from `.agents/plan.yaml` with every key written out: the verify list, the rules file, the standards, the worktree root and paths, the executor, the worker, the reviewer, `libraries`, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once` and `bench`. Stated in: `plan`, Steps 4.
- **dead builder**: a builder the runner's agent listing no longer shows and whose report never arrived; it is reported to the user, and a continuation builder takes over its worktree only when the user says so. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
- **Declined to judge**: the section of a refuter or brief-check report that names each point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle, with the reason. Stated in: `refute`, Steps 6; `spec`, "Steps / The brief check".
- **delta**: the diff of one repair round, from the commit or tree state recorded when the round was sent, read against the whole diff since the base; with `refute_after_repair: no` the orchestrator's read of the delta stands in for a refutation. Stated in: `refute`, "Steps / Over a repair round"; `plan-orchestration`, Steps 8.
- **dispatch block**: the second `yaml` block of the state file, `dispatch: none` or the dispatch entries of the steps in flight. Stated in: `spec`, Steps 9.
- **dispatch entry**: the record of one step in flight in the dispatch block: step, executor, worker, worktree, base, launched, report, `brief_check`, `landing` (`not-started`, `cherry-picking` or `backed-out`), `round`, and `shared_paths` when a file is shared; the orchestrator adds the builder's identity under `session_id` (its agent id, or `inline` or `academic-paper`), `builder_usage` and `reviewer_report`. Stated in: `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7; `land`, Steps 2 and 6.
- **Doc text**: the section of a builder's report that gives the exact lines for a shared document the brief keeps out of the step's paths, the current line as `grep -n` prints it and its replacement, applied by the orchestrator at landing. Stated in: `spec`, `templates/brief.md`, "Report".
- **executor**: who builds a step: `agent`, a builder dispatched in the worktree; `inline`, the orchestrating session itself; `academic-paper`, that skill, always for manuscript content; the configuration block holds the plan's default and the orchestrator chooses per step. Stated in: `plan-orchestration`, Steps 4; `plan`, Steps 4.
- **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item; a finding of the brief check is closed by a change to the brief, or is a stop. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check".
- **fix at landing**: a fix made on main during `/land`, for a red line a fix inside the brief closes or for a small finding of the last round's refutation inside the brief, counted and named with its cause in the booking. Stated in: `land`, Steps 6.
- **four headings**: the headings a reviewer's findings go under, Spec, Proof, Standards and Behaviour, each finding with its failure scenario. Stated in: `refute`, "The four headings".
- **gate**: the check that proves a roadmap entry done, a command from the verification page, a test and what it asserts, or an observable result, which `/plan` copies into `plan.md`'s "## Gate"; a step's own gate is the check on its step line. Stated in: `roadmap`, "Steps / add" 2 and 3; `plan`, Steps 2; `spec`, Steps 4. Also any check that decides whether work passes: a script for a fact, a review for a judgment. Stated in: `repo-setup`, `templates/shared-rules.md`, "Scripts compute facts; judgment is read".
- **goal**: what exists when a roadmap entry is done, in one or two sentences, copied into `plan.md`; in the question asked of a step's check, the goal is the part of it the step delivers. Stated in: `roadmap`, "Steps / add" 1; `plan`, Steps 2.
- **hand-back**: a builder's stop before any change when its first run finds a case the brief's rules get wrong, returning the first run and that case with the rule and the result; the orchestrator reads it as a report and rules on the case. Stated in: `plan-orchestration`, Steps 6.
- **handover**: one session stopping and another continuing the plan from the ledger alone, a resume point at which the stopping session commits the records it wrote. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
- **in flight**: said of a step whose dispatch entry is in the dispatch block and does not read `landing: backed-out`; `workers_at_once` sets how many may be in flight. Stated in: `spec`, "What it reads" 3; `plan-orchestration`, "Two steps in flight".
- **insertion form**: the roadmap file's numbering for an entry placed between two others, such as `37.A` or `12.5`. Stated in: `roadmap`, "The format is the file's".
- **kind**: a sentence that states a defect in general terms, the way a rule would forbid it, under which `/plan-retro` groups findings; a kind is recurring when it appears in at least three steps or two plans, and "no defect" holds the findings that report none. Stated in: `plan-retro`, "Grouping" and Steps 6.
- **landing**: bringing a refuted step from its worktree onto main in one commit, with its booking and its landing report. Stated in: `land`, Steps.
- **launch commit**: the commit of a dispatch entry once its builder's identity is in it, right after the launch under `agent` and before the build under `inline` and `academic-paper`; it is a resume point. Stated in: `plan-orchestration`, Steps 4.
- **ledger**: a plan's folder under `ledger_root`, holding `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/`; it is written on main, and a step's worktree holds a copy in which the builder writes only its report, which the orchestrator copies to main. Stated in: `plan`, Steps 1, 3, 4 and 5; `land`, Steps 5; `plan-orchestration`, Steps 4 and 6.
- **look**: the landing's opening of the changed views where the configuration block's `look:` says, with a screenshot of each view and state, when the step changes a view; an empty `look:` means no look. Stated in: `land`, "The look".
- **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another, until a pause or until nothing unblocked is left. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated up to `repair_rounds` times, or once more under the round cap's exception. Stated in: `plan-help`, "The sequence, printed verbatim".
- **night rule**: the limit the loop keeps when the user sets a time by which no agent may run: dispatch only what fits before the cut-off, and at the cut-off stop what runs and pause the plan. Stated in: `plan-orchestration`, "The pace when a deadline is set".
- **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first; `/plan` refuses such an entry until `/roadmap add <entry>` names its gate. Stated in: `roadmap`, "The format is the file's"; `plan`, "What it reads" 2.
- **open item**: an entry of the state file's open items: a decision only the user can make, with its options, their pros and cons and one recommendation, closed by the user's ruling; or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".
- **orchestrator**: the session that runs a plan: it reads, decides, invokes the skills, lands and books, and writes no step code beyond a fix at landing unless the step's executor is `inline`; run by hand, the session takes its part. Stated in: `plan-orchestration`, "The two tiers, and the models"; `spec`, Steps 5.
- **part file**: a file `plan.md` names to hold part of the plan, where a booking or a Step 0 is then written. Stated in: `land`, Steps 9; `spec`, "Steps / A stop".
- **pause**: a halt of the loop the user asks for, which holds until the user lifts it; nothing is dispatched during it. Stated in: `plan-orchestration`, Steps 5 and "Stops".
- **plan**: the work of one roadmap entry, opened by `/plan` as a ledger folder whose `plan.md` holds the goal, the gate, the step list and the rulings. Stated in: `plan`, Steps. Also the roadmap file as the ordered build plan over a capability map. Stated in: `roadmap`, "A capability map beside the ordered file".
- **plan configuration**: `.agents/plan.yaml`, the only place a project specific lives, which every plan skill reads; `/ordo-init` writes and checks it. Stated in: `plan`, "What it reads" 1; `ordo-init`, Steps.
- **plan skills**: the skills that run plans from `.agents/plan.yaml` (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`), installed once per user and never per project. Stated in: `ordo-init`, the introduction; `repo-setup`, Rules.
- **plan-terms block**: the text of `docs/glossary.md` between the plan-terms markers, a copy of the `repo-setup` skill's `templates/plan-terms.md` that `/repo-setup sync` keeps equal to it. Stated in: `repo-setup`, Steps 3 and "Steps / sync".
- **position line**: the line that opens the orchestrator's reports and the landing report: "Roadmap entry <n> (<title>). Plan step <k> of <m>: <step name>. Next: step <k+1>, <step name>." Stated in: `plan-orchestration`, "Reports"; `land`, Steps 11.
- **premise**: a claim a step's text makes about the tree (a count, a path, a name, a line number), checked by `/spec` with a grep or a probe; a false one the plan can absorb is corrected in `plan.md`, and one it cannot is a stop. Stated in: `spec`, "What it reads" 5 and Steps 2.
- **preparation commit**: the commit `/spec` makes of the brief, the brief check's report and its own records before the worktree exists; its hash is the base, and it is a resume point. Stated in: `spec`, Steps 6.
- **project skills**: the skills a repository installs with the skills CLI into `.agents/skills/`, linked under `.claude/skills/` and listed in `skills-lock.json` and in `CLAUDE.md`'s Skills section. Stated in: `repo-setup`, Steps 6 and 7.
- **`projects:` form**: the shape of `.agents/plan.yaml` for a repository with several projects, each listed under `projects:` with its own keys, a plan then named `<project>/<entry>`. Stated in: `plan`, "What it reads" 1; `ordo-init`, Steps 1.
- **question, the**: "could this pass without the goal being reached?", asked of a roadmap entry's gate, of each step's check and of a brief's cases and checks, the answer written with its reason. Stated in: `roadmap`, "Steps / add" 3; `plan`, Steps 2; `spec`, "Steps / The brief check".
- **questions, the**: the eight questions `/repo-setup` asks before it drafts a repository, each with its default. Stated in: `repo-setup`, "The questions".
- **recurring finding**: a cause of findings that `plan-orchestration`'s pass, every tenth landed step and at any pause, finds in three or more steps, booked as an open item with the smallest change that would end it. Stated in: `plan-orchestration`, "The recurring-findings pass".
- **red line**: a verification line that fails on main after the cherry-pick; one a fix inside the brief closes is a fix at landing, and any other takes the step back out of main. Stated in: `land`, Steps 6. A red check no fix within the plan covers is a stop. Stated in: `plan-orchestration`, "Stops".
- **refusal**: a skill's end without a decision for the user: it names its cause and leaves nothing, or nothing beyond what a step taken back out of main has already done. Stated in: `spec`, "Stops"; `land`, "Stops"; `refute`, "Stops".
- **refuter report**: the reviewer's report `agents/reviews/<step>-refuter.md`: the verification lines, the verdicts, the findings under the four headings, "Declined to judge" and the usage, with a section appended for each run over a repair round. Stated in: `refute`, Steps 6 and 7 and "Steps / Over a repair round".
- **repair round**: the reviewer's findings sent back to the same builder as a numbered list with a ruling per finding, `round: n` written in the dispatch entry; the round cap allows at most `repair_rounds`, and one more only when the delta leaves a verification command red or an acceptance item unbuilt with a fix too large for landing. Stated in: `plan-orchestration`, Steps 8 and Rules; `refute`, "Steps / Over a repair round".
- **resume point**: a commit another session resumes from: a stop, the preparation commit, the launch commit, a repair round sent, a step taken back out of main, the landing and a handover, each holding only the paths its session wrote since the last one. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
- **retro**: the report `/plan-retro` writes at `<ledger_root>/retros/<YYYY-MM-DD>.md`, grouping the findings of the refuter reports by kind and proposing, for each recurring kind, the change that stops it. Stated in: `plan-retro`, Steps 8.
- **review cadence**: the configuration block's `review:`, `every` for a refutation of every step, or `earned` for a refutation decided per step from the builder's landing reports. Stated in: `plan-orchestration`, Steps 7 and "The review, earned"; `plan`, Steps 4.
- **reviewer**: the fresh session or agent that refutes a built step without changing anything, never the builder, on the model the configuration block's `reviewer:` names, which the brief-check agent also runs on. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models".
- **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number that never changes; `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The format is the file's".
- **rule clash**: a contradiction between two established rules or decisions, a stop for the user's ruling. Stated in: `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes".
- **rules file**: the page `.agents/plan.yaml`'s `rules:` names, which says how a change is made and reported; every brief points at it first. Stated in: `spec`, Steps 4; `plan`, Steps 4.
- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session, a ruling that adds or splits a step also written in the Rulings section of `plan.md` as a line ending with "(the user)" and named by a step's `(ruling <name>)` tag. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8.
- **runner**: the program that runs the sessions and agents, Claude Code, with its agent tool, message tool, stop tool and agent listing. Stated in: `plan-orchestration`, "The two tiers, and the models" and "Launching a builder".
- **sequence, the**: the command sequence for running a plan by hand that `/plan-help` prints verbatim. Stated in: `plan-help`, "The sequence, printed verbatim".
- **session, the**: the Claude Code session that runs a skill, the orchestrator under the loop or the user's session when a skill is run by hand; its own records are the ledger changes it made since the last resume point, such as a ruling booked or a report recorded, which its next resume-point commit carries. Stated in: `spec`, Steps 1; `plan-orchestration`, "Resuming, and handing the plan over".
- **shared path**: a file the briefs of two steps in flight both name, allowed only when the orchestrator judges the merge at landing simple and names it under `shared_paths:` in the later step's dispatch entry. Stated in: `spec`, Steps 5; `plan-orchestration`, "Two steps in flight".
- **shared-rules block**: the text of `CLAUDE.md` between the shared-rules markers, a copy of the `repo-setup` skill's `templates/shared-rules.md` that `/repo-setup sync` keeps equal to it. Stated in: `repo-setup`, Steps 3 and "Steps / sync".
- **slug**: the ledger folder's name, derived from the roadmap entry, such as `38-3-one-object-per-file`. Stated in: `plan`, Steps 1.
- **standards**: the pages `.agents/plan.yaml`'s `standards` lists, which every brief tells the builder to read in full and the reviewer holds a diff to. Stated in: `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind". Also the standard pages `/repo-setup` writes into `docs/dev/`, the change standard and the prose standard. Stated in: `repo-setup`, "The tree"; `plan-help`, "The sequence, printed verbatim".
- **state file**: the plan's `orchestrator-state.md`: the configuration block, the dispatch block, the open items, the closed items and the current position, rewritten before every step commit and read first after a compaction. Stated in: `plan`, Steps 4; `plan-orchestration`, "What it reads" and "Resuming, and handing the plan over".
- **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority; the orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The format is the file's".
- **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6.
- **stop**: a halt for a decision that is the user's, booked as an open item in the state file and under the step's Step 0 and committed as a resume point; under the loop it blocks only its own step. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop". Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item. Stated in: `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops".
- **sync**: `/repo-setup sync`, which compares a repository's shared-rules block and plan-terms block with their templates and rewrites them after approval. Stated in: `repo-setup`, "Steps / sync".
- **taken back out of main**: what a red line no fix inside the brief closes does to a step at landing: its changes are removed from main, its dispatch entry reads `landing: backed-out`, its worktree and branches are kept, its failure goes into its Step 0, and `/spec` saves its work as a patch and prepares it again. Stated in: `land`, Steps 6; `spec`, "Steps / A step taken back out of main".
- **tiers**: the orchestrator, and the agents it starts (builders, reviewers and brief-check agents), each on the model the section names. Stated in: `plan-orchestration`, "The two tiers, and the models".
- **time box**: the reviewer's limit, the configuration block's `review_minutes` when above 0 or one the invocation names, kept by reporting what was checked and naming what was not. Stated in: `refute`, Rules.
- **user-visible choice**: a choice the user owns: a public shape, a wire format, a config key or a vocabulary, and, under `libraries: check`, a library that could replace code the step would write by hand; a brief never takes one, and `/spec` stops on it. Stated in: `spec`, Steps 4 and "Stops".
- **verdict**: the reviewer's judgment of each item of the brief's "What to build" (holds, violated or not applicable) and of each case (met, partial, unmet or not verifiable), a verdict of violated, partial or unmet naming its finding. Stated in: `refute`, "The verdicts".
- **verification page**: the page `.agents/plan.yaml`'s `verification:` names, which defines the green check with the commands every step runs; `/plan` copies them into the verify list. Stated in: `plan`, "What it reads" 3 and Steps 4; `ordo-init`, Steps 3.
- **verify list**: the `verify:` key of the configuration block, run in order through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main; the lines it prints are what a report or a booking quotes. Stated in: `land`, "The landing script"; `plan`, Steps 4.
- **wip**: the commit `/land` makes in the step's worktree of everything the builder left, the ledger root left out, when something is staged. Stated in: `land`, Steps 3.
- **worker**: the configuration key `worker:`, `claude:<model>` of the builder. Stated in: `plan-orchestration`, "The two tiers, and the models"; `plan`, Steps 4. Also the builder itself, whose identity the dispatch entry records. Stated in: `spec`, Steps 9.
- **worktree**: a step's git worktree at `<worktree_root>/<step>`, on a branch named after its folder, created from the base; the builder's only place to work, removed by `/land` after the landing and kept after a step is taken back out of main. Stated in: `spec`, Steps 7; `land`, "Removing a step's worktree".
```

## `docs/glossary.md`, its own part

The lines before the block, then the lines from the end marker on (the block between them is `plan-terms.md`, quoted above):

```markdown
# Glossary

This page defines each term that the Ordo skills, the pages under `docs/dev/` and the README use in a sense of their own. The block below is `skills/repo-setup/templates/plan-terms.md` copied whole, which `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` compares with that file, so a plan term is changed in that file only. The rule on how a term is used is in `docs/dev/skill-layout.md`, "Writing for an agent". Ordo's own terms follow the block.

<!-- ordo:plan-terms begin -->
...
<!-- ordo:plan-terms end -->

## Ordo's own terms

- **blind comparison**: the comparison of a new skill's output with another skill's on one real input, judged unlabelled and in random order by two fresh judges with the order swapped, the user making the final call a gate reads. Stated in: `docs/dev/blind-comparison.md`.
- **case, of a skill's description**: a request a skill is for, for which its description's `Triggers on:` lists at least one phrase. Stated in: `docs/dev/skill-layout.md`, "Frontmatter".
- **coverage list**: the list a rewrite of text keeps, one row per rule of the old text, each naming the place in the new text that states that rule whole. Stated in: `docs/dev/change-standard.md`, rule 18. Also the Markdown file `utils/check_coverage.py` checks, which lists every file of the named skill folders once with a mark (`rebuild: <skill>`, `rebuild later: <skill>` or `drop`) and a reason. Stated in: `utils/check_coverage.py`, its head comment.
- **critical failure**: a failure that makes an output of a blind comparison unfit for the purpose the input sets, such as a claim the input contradicts, a missing part the input asks for, or a citation that does not resolve. Stated in: `docs/dev/blind-comparison.md`, steps 1 and 5.
- **loop, in the README**: the path every step of a plan takes, from its brief through its build in a worktree and its review to its cherry-pick onto main. Stated in: `README.md`, the introduction.
- **pin**: the installed skills held at a tag while Ordo is changed: `utils/pin.sh <tag>` puts the pinned worktree `~/.local/share/ordo-stable` at that tag and links every skill from it, and `utils/pin.sh` with no tag checks the links. Stated in: `README.md`, "Working on Ordo"; `utils/pin.sh`, its head comment.
- **verdict, of a blind comparison**: a judge's A, B or tie with its reasons; the two verdicts, read through the key, give the result when they agree and a tie when they differ. Stated in: `docs/dev/blind-comparison.md`, steps 6 and 7.
```

## `skills/repo-setup/templates/docs/glossary.md`, whole

```markdown
# Glossary

This page defines each term this project uses in a sense of its own. The plan skills' terms stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.

<!-- ordo:plan-terms begin -->
<!-- ordo:plan-terms end -->

## Project terms

<!-- An entry:

- **<term>**: <definition, one or two sentences>.
-->
```

## The other changes, old beside new

Every text change, as `git diff -U0` prints it (a `-` line is the old text, a `+` line the new):

```diff
diff --git a/.agents/plan.yaml b/.agents/plan.yaml
index b789b33..53cf592 100644
--- a/.agents/plan.yaml
+++ b/.agents/plan.yaml
@@ -12 +12 @@ libraries: avoid                          # check: /spec looks for a library for
-standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.
+standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.
diff --git a/README.md b/README.md
index 3da8d32..c1d3f73 100644
--- a/README.md
+++ b/README.md
@@ -13 +13 @@ Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `road
-| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, a roadmap, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. `sync` keeps an existing repository's shared rules equal to the template |
+| `repo-setup` | Sets up a new repository and then runs `/ordo-init`. It writes `CLAUDE.md` with the shared rules, the change and prose standards, a roadmap, a glossary, an ADR folder, `.gitignore` and `LICENSE`, and installs the project skills. `sync` keeps an existing repository's shared rules and its glossary's plan terms equal to their templates |
@@ -81 +81 @@ For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills`
-A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills. It then shows the whole tree and every file. After your approval it writes `CLAUDE.md`, the change and prose standards, a roadmap, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`.
+A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the coding standard and the project skills. It then shows the whole tree and every file. After your approval it writes `CLAUDE.md`, the change and prose standards, a roadmap, a glossary, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`.
@@ -83 +83 @@ A new repository is set up with `/repo-setup` from an empty folder. It asks for
-The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->`. They are a copy of `skills/repo-setup/templates/shared-rules.md`.
+The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` and `<!-- ordo:shared-rules end -->`. They are a copy of `skills/repo-setup/templates/shared-rules.md`. The plan terms in `docs/glossary.md` sit between `<!-- ordo:plan-terms begin -->` and `<!-- ordo:plan-terms end -->`. They are a copy of `skills/repo-setup/templates/plan-terms.md`, and the project's own terms follow them.
@@ -85 +85 @@ The shared rules in `CLAUDE.md` sit between `<!-- ordo:shared-rules begin -->` a
-`/repo-setup sync` compares a repository's block with the template, shows the diff and rewrites the block after approval. On a repository with no block yet, it drafts where the block goes and which existing rules it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone):
+`/repo-setup sync` compares both blocks with their templates, shows the diff of each block that differs and rewrites it after approval. On a repository with no block yet, it drafts where the block goes and which existing rules or glossary entries it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone), and `--only glossary` compares the plan-terms block alone, for a repository whose `CLAUDE.md` has no shared-rules block:
@@ -88,0 +89 @@ python3 <skills>/repo-setup/templates/sync_rules.py <repository>
+python3 <skills>/repo-setup/templates/sync_rules.py <repository> --only glossary
diff --git a/docs/dev/building.md b/docs/dev/building.md
index 0593a3c..e230dba 100644
--- a/docs/dev/building.md
+++ b/docs/dev/building.md
@@ -9 +9,2 @@ sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on comp
-sh skills/repo-setup/templates/sync_rules.test.sh      # sync_rules.py on matching and drifted shared-rules blocks, its --write repair and its refusals
+sh skills/repo-setup/templates/sync_rules.test.sh      # sync_rules.py on matching and drifted shared-rules and plan-terms blocks, its --write repair, its --only glossary form and its refusals
+python3 skills/repo-setup/templates/sync_rules.py . --only glossary   # Ordo's glossary block equals plan-terms.md
diff --git a/docs/dev/change-standard.md b/docs/dev/change-standard.md
index c882364..0ff14b7 100644
--- a/docs/dev/change-standard.md
+++ b/docs/dev/change-standard.md
@@ -65,0 +66 @@ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
+python3 skills/repo-setup/templates/sync_rules.py . --only glossary
diff --git a/docs/dev/skill-layout.md b/docs/dev/skill-layout.md
index bba10c6..6bcf15e 100644
--- a/docs/dev/skill-layout.md
+++ b/docs/dev/skill-layout.md
@@ -59,0 +60 @@ No other `##` heading appears outside the place row 6 gives it.
+- A term that `docs/glossary.md` defines is used only in a sense it defines there. A skill that needs a new term, or a term in a new sense, adds or changes its entry in `skills/repo-setup/templates/plan-terms.md` first, and `docs/glossary.md`'s block is synced from it.
diff --git a/skills/ordo-init/SKILL.md b/skills/ordo-init/SKILL.md
index 9168b91..2d01ce8 100644
--- a/skills/ordo-init/SKILL.md
+++ b/skills/ordo-init/SKILL.md
@@ -5 +5 @@ metadata:
-  version: "1.1.0"
+  version: "1.1.1"
@@ -67 +67 @@ Run from the repository root.
-   - `standards` lists the coding, layout or prose standard pages the repository has.
+   - `standards` lists the coding, layout or prose standard pages the repository has, and `docs/glossary.md` when the repository has one, so every brief names it.
diff --git a/skills/repo-setup/SKILL.md b/skills/repo-setup/SKILL.md
index e97d663..ad1c48e 100644
--- a/skills/repo-setup/SKILL.md
+++ b/skills/repo-setup/SKILL.md
@@ -3 +3 @@ name: repo-setup
-description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the building page, a roadmap and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and the plan configuration .agents/plan.yaml. Shows the whole tree and every file before writing. With sync, compares an existing repository's shared-rules block with the template and rewrites it after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules."
+description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the building page, a roadmap, a glossary and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and the plan configuration .agents/plan.yaml. Shows the whole tree and every file before writing. With sync, compares an existing repository's shared-rules block and its glossary's plan-terms block with their templates and rewrites them after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules, sync the glossary."
@@ -5 +5 @@ metadata:
-  version: "1.1.2"
+  version: "1.2.0"
@@ -10 +10 @@ metadata:
-`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block equal to the template. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced block.
+`/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block and its glossary's plan-terms block equal to their templates. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced blocks.
@@ -16 +16 @@ metadata:
-/repo-setup sync [<path>]     an existing repository: its shared-rules block against the template
+/repo-setup sync [<path>]     an existing repository: its shared-rules block and its glossary's plan-terms block against their templates
@@ -28 +28 @@ metadata:
-1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.
+1. `templates/` in this skill's folder: `CLAUDE.md`, `shared-rules.md`, `plan-terms.md`, the `docs/` pages, the `gitignore/` files, `LICENSE-MIT`, `sync_rules.py`.
@@ -31 +31 @@ metadata:
-4. For `sync`, the repository's `CLAUDE.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` for the exit-2 draft.
+4. For `sync`, the repository's `CLAUDE.md` and `docs/glossary.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` and the entries of its `docs/glossary.md` for the exit-2 draft.
@@ -38,0 +39 @@ metadata:
+   - The plan-terms block of `docs/glossary.md` is filled from `templates/plan-terms.md`, as the shared-rules block of `CLAUDE.md` is from `templates/shared-rules.md`.
@@ -40 +41,2 @@ metadata:
-   - A placeholder with no answer is shown to the user.
+   - A placeholder inside an HTML comment that shows an entry's form, as in the roadmap's and the glossary's, is written as it is, since it is the form and not a value.
+   - Any other placeholder with no answer is shown to the user.
@@ -71,3 +73,3 @@ metadata:
-1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`; steps 2 to 9 follow its exit status and, on exit 2, its `error:` line.
-2. Exit 0: the block equals the template; nothing to do.
-3. Exit 1: the block differs; show the diff, for the user's ruling per hunk ("Stops").
+1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`, which checks the shared-rules block of `CLAUDE.md` and then the plan-terms block of `docs/glossary.md`; steps 2 to 9 follow its exit status and, on exit 2, its `error:` lines.
+2. Exit 0: both blocks equal their templates; nothing to do.
+3. Exit 1: a block differs; show the diff of each block that differs, for the user's ruling per hunk ("Stops").
@@ -75,3 +77,3 @@ metadata:
-   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` in this skill's folder, after which every repository set up from it differs until it is synced.
-4. Exit 2 with `error: CLAUDE.md has no single shared-rules block`: draft the change.
-   - The block inserted after the opening paragraph.
+   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` or `templates/plan-terms.md` in this skill's folder, after which every repository set up from it differs until it is synced.
+4. Exit 2 with `error: CLAUDE.md has no single shared-rules block` or `error: docs/glossary.md has no single plan-terms block`: draft the change for each block the lines name.
+   - The shared-rules block inserted after the opening paragraph of `CLAUDE.md`.
@@ -79,0 +82,2 @@ metadata:
+   - With no `docs/glossary.md`, the file written from `templates/docs/glossary.md`, its plan-terms block filled from `templates/plan-terms.md`.
+   - With a `docs/glossary.md` that has no single block, the plan-terms block inserted after its opening paragraph, and each existing entry that the block now defines listed for removal.
@@ -112,0 +117 @@ docs/roadmap.md                  the roadmap skill's templates/roadmap.md
+docs/glossary.md                 templates/docs/glossary.md, the plan-terms block filled from templates/plan-terms.md
@@ -127 +132 @@ utils/                           scripts the build and the checks run
-| The drafted sync change | `sync` exits 2 with the `error:` line of Steps / sync 4 | The change Steps / sync 4 drafts | The user's approval |
+| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block | The change Steps / sync 4 drafts | The user's approval |
@@ -142 +147 @@ utils/                           scripts the build and the checks run
-| A `<...>` placeholder written into a file | The file then states something nobody filled in | See Steps 3 |
+| A `<...>` placeholder written into a file, other than one inside an HTML comment that shows an entry's form | The file then states something nobody filled in | See Steps 3 |
@@ -148 +153 @@ utils/                           scripts the build and the checks run
-- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` the user rules on in `sync`.
+- The skill writes nothing outside the repository's folder, except a change to `templates/shared-rules.md` or `templates/plan-terms.md` the user rules on in `sync`.
diff --git a/skills/repo-setup/templates/CLAUDE.md b/skills/repo-setup/templates/CLAUDE.md
index 295b5c1..3e3e876 100644
--- a/skills/repo-setup/templates/CLAUDE.md
+++ b/skills/repo-setup/templates/CLAUDE.md
@@ -19,0 +20 @@
+- `docs/glossary.md`: the terms of this repository and of the plan skills, each in the sense the repository uses it.
```

`skills/repo-setup/templates/sync_rules.py`, the module docstring, which states the behaviour, the exit statuses and every line the script prints. Old:

```
Compare a repository's shared-rules block with the template, and rewrite it on request.

Usage: sync_rules.py <repository root> [--write]

The block is the text of CLAUDE.md between the lines "<!-- ordo:shared-rules begin -->" and
"<!-- ordo:shared-rules end -->"; the template is shared-rules.md beside this script. The block is
compared line by line, so a CRLF file whose block holds the template's lines equals it.

--write replaces the text between the two markers with the template and keeps every byte outside
them. It writes the block with the file's own line ending: CRLF or LF, whichever most of its lines
end with, and the first line's ending on a tie. It then reads the file back to check that it holds
what was written.

Exit status: 0 when the block equals the template (or was just rewritten with --write), 1 when it
differs (the unified diff is printed), 2 when CLAUDE.md is missing or has no single block; when
CLAUDE.md or shared-rules.md cannot be read or is not UTF-8; and when --write cannot write
CLAUDE.md or the file does not read back as written. The "ok:" and "written:" lines and the diff
go to stdout; each "error:" line goes to stderr.

The error lines of exit 2. The first names a block to draft:
    error: CLAUDE.md has no single shared-rules block (<begin marker> ... <end marker>)
The others name a file to fix before the check can run:
    error: no CLAUDE.md in <root>
    error: <path> is not UTF-8 (byte <n>)
    error: cannot read <path>: <reason>
    error: cannot write <path>: <reason>
    error: <path> does not read back as written
The usage line, on stderr, also exits 2.
```

New:

```
Compare a repository's shared-rules block and plan-terms block with their templates, and rewrite them on request.

Usage: sync_rules.py <repository root> [--write] [--only glossary]

The shared-rules block is the text of CLAUDE.md between the lines "<!-- ordo:shared-rules begin -->" and "<!-- ordo:shared-rules end -->"; its template is shared-rules.md beside this script. The plan-terms block is the text of docs/glossary.md between "<!-- ordo:plan-terms begin -->" and "<!-- ordo:plan-terms end -->"; its template is plan-terms.md beside this script. A marker string is counted wherever it stands, inside a line of prose too. Each block is compared line by line, so a CRLF file whose block holds the template's lines equals it.

The shared-rules block is checked first, then the plan-terms block. --only glossary checks the plan-terms block alone, for a repository with no shared-rules block, and then neither CLAUDE.md nor shared-rules.md is read. Every file is read and every block located before anything is written or printed on stdout, so an error in any file writes nothing. Each file in error prints its own "error:" line, in the order the files are read: shared-rules.md, CLAUDE.md, plan-terms.md, docs/glossary.md.

--write replaces the text between the two markers of each block that differs with its template and keeps every byte outside them. It writes the block with the file's own line ending: CRLF or LF, whichever most of its lines end with, and the first line's ending on a tie. It then reads the file back to check that it holds what was written. CLAUDE.md is written first, and a failed write or read-back of it stops before docs/glossary.md is written.

Exit status: 0 when every block checked equals its template (or was just rewritten with --write); 1 when a block differs, with the unified diff of each differing block printed under its file's name; 2 when CLAUDE.md is missing, when CLAUDE.md or docs/glossary.md has no single block (a missing docs/glossary.md included), when a file cannot be read or is not UTF-8, and when --write cannot write a file or the file does not read back as written. The "ok:" and "written:" lines and the diffs go to stdout, the shared-rules block's first; each "error:" line goes to stderr.

The lines on stdout, besides the diffs, which are labelled "CLAUDE.md (shared rules)" or "docs/glossary.md (plan terms)" against "template":
    ok: the shared-rules block equals the template
    ok: the plan-terms block equals the template
    written: the shared-rules block now equals the template
    written: the plan-terms block now equals the template

The error lines of exit 2. The first two name a block to draft:
    error: CLAUDE.md has no single shared-rules block (<begin marker> ... <end marker>)
    error: docs/glossary.md has no single plan-terms block (<begin marker> ... <end marker>)
The others name a file to fix before the check can run:
    error: no CLAUDE.md in <root>
    error: <path> is not UTF-8 (byte <n>)
    error: cannot read <path>: <reason>
    error: cannot write <path>: <reason>
    error: <path> does not read back as written
The usage line, on stderr, also exits 2: for no path or a second path, and for --only with no value, with a value other than glossary, given twice, or written as --only=glossary.
```

The code: `SHARED_RULES` and `PLAN_TERMS` describe the two blocks; `arguments()` parses one path, `--write` and `--only glossary` in any order and returns None for the usage line; `load()` reads a block's template and file, prints the `error:` line of each file in error, and locates the markers; `rewrite()` is the old write and read-back; `main()` loads every block before it prints or writes anything, then prints `ok:`, rewrites, or prints the diff, block by block, and stops at the first failed write. `read()` and `line_ending()` are unchanged.

`skills/repo-setup/templates/sync_rules.test.sh`: the head comment states the new behaviour; `make_repo` also writes `docs/glossary.md` from the template with its block filled; `outside_block` takes the plan-terms markers when `terms` follows the file; new helpers `drift_terms`, `expect_usage` and `expect_lines`; the fake `open()` of the lost-write case (`fake-open.py`) now also raises a permission error, for a path ending in a given suffix; the new cases follow (the table below).

## Table of terms

One row per sense. "Bullet" is the entry's line in `plan-terms.md` (in `docs/glossary.md` for Ordo's own terms); "Stated in" is the entry's source for that sense; the last column is a line of that section that uses the term in that sense. The line column was found by a helper in the session's scratch folder that greps each section for a phrase of it, one hit each; each row was then read against its entry.

| Term (sense) | Bullet | Stated in | A line of that section using the term in that sense |
|---|---|---|---|
| A/B | `skills/repo-setup/templates/plan-terms.md:3` | `land`, Steps 8; `spec`, Steps 8 | `skills/land/SKILL.md:83` |
| acceptance item | `skills/repo-setup/templates/plan-terms.md:4` | `plan-orchestration`, Rules | `skills/plan-orchestration/SKILL.md:312` |
| authority | `skills/repo-setup/templates/plan-terms.md:5` | `plan`, Rules; `spec`, "What it reads" 4 and Steps 1 | `skills/spec/SKILL.md:43` |
| bar | `skills/repo-setup/templates/plan-terms.md:6` | `land`, Steps 9 and 11; `plan-orchestration`, "The review, earned" | `skills/plan-orchestration/SKILL.md:186` |
| base | `skills/repo-setup/templates/plan-terms.md:7` | `spec`, Steps 6, 7 and 8; `land`, Steps 4; `refute`, "What it reads" 5 | `skills/spec/SKILL.md:134` |
| booking | `skills/repo-setup/templates/plan-terms.md:8` | `land`, Steps 9 | `skills/land/SKILL.md:87` |
| booking (to book) | `skills/repo-setup/templates/plan-terms.md:8` | `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops" | `skills/spec/SKILL.md:202` |
| booking (lazy option) | `skills/repo-setup/templates/plan-terms.md:8` | `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option" | `skills/repo-setup/templates/shared-rules.md:11` |
| brief | `skills/repo-setup/templates/plan-terms.md:9` | `spec`, Steps 4; `plan-orchestration`, Steps 6 and 8 | `skills/spec/SKILL.md:90` |
| brief (round, cases ruling) | `skills/repo-setup/templates/plan-terms.md:9` | `spec`, Steps 4; `plan-orchestration`, Steps 6 and 8 | `skills/plan-orchestration/SKILL.md:83` |
| brief check | `skills/repo-setup/templates/plan-terms.md:10` | `spec`, Steps 5 and "Steps / The brief check" | `skills/spec/SKILL.md:216` |
| builder | `skills/repo-setup/templates/plan-terms.md:11` | `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9 | `skills/plan-orchestration/SKILL.md:63` |
| capability map | `skills/repo-setup/templates/plan-terms.md:12` | `roadmap`, "A capability map beside the ordered file" | `skills/roadmap/SKILL.md:114` |
| case | `skills/repo-setup/templates/plan-terms.md:13` | `spec`, Steps 4; `refute`, "The verdicts" | `skills/spec/SKILL.md:96` |
| case (real case) | `skills/repo-setup/templates/plan-terms.md:13` | `spec`, Steps 4 | `skills/spec/SKILL.md:102` |
| Closed | `skills/repo-setup/templates/plan-terms.md:14` | `spec`, "Steps / The brief check"; `refute`, "Finding dispositions" | `skills/refute/SKILL.md:135` |
| Closed (closed items) | `skills/repo-setup/templates/plan-terms.md:14` | `plan-orchestration`, "Reports" | `skills/plan-orchestration/SKILL.md:249` |
| closing step | `skills/repo-setup/templates/plan-terms.md:15` | `plan`, Steps 2 | `skills/plan/SKILL.md:55` |
| commit rule | `skills/repo-setup/templates/plan-terms.md:16` | `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3 | `skills/repo-setup/SKILL.md:99` |
| completion notice | `skills/repo-setup/templates/plan-terms.md:17` | `plan-orchestration`, Steps 6 and "Launching a builder"; `land`, Steps 9 | `skills/plan-orchestration/SKILL.md:229` |
| configuration block | `skills/repo-setup/templates/plan-terms.md:18` | `plan`, Steps 4 | `skills/plan/SKILL.md:61` |
| dead builder | `skills/repo-setup/templates/plan-terms.md:19` | `plan-orchestration`, "Resuming, and handing the plan over" | `skills/plan-orchestration/SKILL.md:171` |
| Declined to judge | `skills/repo-setup/templates/plan-terms.md:20` | `refute`, Steps 6; `spec`, "Steps / The brief check" | `skills/refute/SKILL.md:58` |
| delta | `skills/repo-setup/templates/plan-terms.md:21` | `refute`, "Steps / Over a repair round"; `plan-orchestration`, Steps 8 | `skills/refute/SKILL.md:70` |
| dispatch block | `skills/repo-setup/templates/plan-terms.md:22` | `spec`, Steps 9 | `skills/spec/SKILL.md:149` |
| dispatch entry | `skills/repo-setup/templates/plan-terms.md:23` | `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7; `land`, Steps 2 and 6 | `skills/spec/SKILL.md:150` |
| Doc text | `skills/repo-setup/templates/plan-terms.md:24` | `spec`, `templates/brief.md`, "Report" | `skills/spec/templates/brief.md:64` |
| executor | `skills/repo-setup/templates/plan-terms.md:25` | `plan-orchestration`, Steps 4; `plan`, Steps 4 | `skills/plan-orchestration/SKILL.md:55` |
| finding | `skills/repo-setup/templates/plan-terms.md:26` | `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check" | `skills/refute/SKILL.md:57` |
| fix at landing | `skills/repo-setup/templates/plan-terms.md:27` | `land`, Steps 6 | `skills/land/SKILL.md:67` |
| four headings | `skills/repo-setup/templates/plan-terms.md:28` | `refute`, "The four headings" | `skills/refute/SKILL.md:83` |
| gate | `skills/repo-setup/templates/plan-terms.md:29` | `roadmap`, "Steps / add" 2 and 3; `plan`, Steps 2; `spec`, Steps 4 | `skills/roadmap/SKILL.md:63` |
| gate (general) | `skills/repo-setup/templates/plan-terms.md:29` | `repo-setup`, `templates/shared-rules.md`, "Scripts compute facts; judgment is read" | `skills/repo-setup/templates/shared-rules.md:15` |
| goal | `skills/repo-setup/templates/plan-terms.md:30` | `roadmap`, "Steps / add" 1; `plan`, Steps 2 | `skills/roadmap/SKILL.md:59` |
| hand-back | `skills/repo-setup/templates/plan-terms.md:31` | `plan-orchestration`, Steps 6 | `skills/plan-orchestration/SKILL.md:81` |
| handover | `skills/repo-setup/templates/plan-terms.md:32` | `plan-orchestration`, "Resuming, and handing the plan over" | `skills/plan-orchestration/SKILL.md:152` |
| in flight | `skills/repo-setup/templates/plan-terms.md:33` | `spec`, "What it reads" 3; `plan-orchestration`, "Two steps in flight" | `skills/spec/SKILL.md:37` |
| insertion form | `skills/repo-setup/templates/plan-terms.md:34` | `roadmap`, "The format is the file's" | `skills/roadmap/SKILL.md:105` |
| kind | `skills/repo-setup/templates/plan-terms.md:35` | `plan-retro`, "Grouping" and Steps 6 | `skills/plan-retro/SKILL.md:67` |
| landing | `skills/repo-setup/templates/plan-terms.md:36` | `land`, Steps | `skills/land/SKILL.md:10` |
| launch commit | `skills/repo-setup/templates/plan-terms.md:37` | `plan-orchestration`, Steps 4 | `skills/plan-orchestration/SKILL.md:58` |
| ledger | `skills/repo-setup/templates/plan-terms.md:38` | `plan`, Steps 1, 3, 4 and 5; `land`, Steps 5; `plan-orchestration`, Steps 4 and 6 | `skills/land/SKILL.md:59` |
| look | `skills/repo-setup/templates/plan-terms.md:39` | `land`, "The look" | `skills/land/SKILL.md:116` |
| loop | `skills/repo-setup/templates/plan-terms.md:40` | `plan-orchestration`, the introduction and Steps | `skills/plan-orchestration/SKILL.md:10` |
| loop (inside a step) | `skills/repo-setup/templates/plan-terms.md:40` | `plan-help`, "The sequence, printed verbatim" | `skills/plan-help/SKILL.md:61` |
| night rule | `skills/repo-setup/templates/plan-terms.md:41` | `plan-orchestration`, "The pace when a deadline is set" | `skills/plan-orchestration/SKILL.md:259` |
| Not yet specified | `skills/repo-setup/templates/plan-terms.md:42` | `roadmap`, "The format is the file's"; `plan`, "What it reads" 2 | `skills/roadmap/SKILL.md:107` |
| open item | `skills/repo-setup/templates/plan-terms.md:43` | `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops" | `skills/plan-orchestration/SKILL.md:283` |
| orchestrator | `skills/repo-setup/templates/plan-terms.md:44` | `plan-orchestration`, "The two tiers, and the models"; `spec`, Steps 5 | `skills/plan-orchestration/SKILL.md:126` |
| part file | `skills/repo-setup/templates/plan-terms.md:45` | `land`, Steps 9; `spec`, "Steps / A stop" | `skills/land/SKILL.md:87` |
| pause | `skills/repo-setup/templates/plan-terms.md:46` | `plan-orchestration`, Steps 5 and "Stops" | `skills/plan-orchestration/SKILL.md:289` |
| plan | `skills/repo-setup/templates/plan-terms.md:47` | `plan`, Steps | `skills/plan/SKILL.md:10` |
| plan (build plan) | `skills/repo-setup/templates/plan-terms.md:47` | `roadmap`, "A capability map beside the ordered file" | `skills/roadmap/SKILL.md:114` |
| plan configuration | `skills/repo-setup/templates/plan-terms.md:48` | `plan`, "What it reads" 1; `ordo-init`, Steps | `skills/plan/SKILL.md:30` |
| plan skills | `skills/repo-setup/templates/plan-terms.md:49` | `ordo-init`, the introduction; `repo-setup`, Rules | `skills/ordo-init/SKILL.md:10` |
| plan-terms block | `skills/repo-setup/templates/plan-terms.md:50` | `repo-setup`, Steps 3 and "Steps / sync" | `skills/repo-setup/SKILL.md:39` |
| position line | `skills/repo-setup/templates/plan-terms.md:51` | `plan-orchestration`, "Reports"; `land`, Steps 11 | `skills/plan-orchestration/SKILL.md:244` |
| premise | `skills/repo-setup/templates/plan-terms.md:52` | `spec`, "What it reads" 5 and Steps 2 | `skills/spec/SKILL.md:76` |
| preparation commit | `skills/repo-setup/templates/plan-terms.md:53` | `spec`, Steps 6 | `skills/spec/SKILL.md:129` |
| project skills | `skills/repo-setup/templates/plan-terms.md:54` | `repo-setup`, Steps 6 and 7 | `skills/repo-setup/SKILL.md:46` |
| projects: form | `skills/repo-setup/templates/plan-terms.md:55` | `plan`, "What it reads" 1; `ordo-init`, Steps 1 | `skills/ordo-init/SKILL.md:39` |
| question, the | `skills/repo-setup/templates/plan-terms.md:56` | `roadmap`, "Steps / add" 3; `plan`, Steps 2; `spec`, "Steps / The brief check" | `skills/plan/SKILL.md:49` |
| questions, the | `skills/repo-setup/templates/plan-terms.md:57` | `repo-setup`, "The questions" | `skills/repo-setup/SKILL.md:92` |
| recurring finding | `skills/repo-setup/templates/plan-terms.md:58` | `plan-orchestration`, "The recurring-findings pass" | `skills/plan-orchestration/SKILL.md:195` |
| red line | `skills/repo-setup/templates/plan-terms.md:59` | `land`, Steps 6 | `skills/land/SKILL.md:66` |
| red line (red check) | `skills/repo-setup/templates/plan-terms.md:59` | `plan-orchestration`, "Stops" | `skills/plan-orchestration/SKILL.md:277` |
| refusal | `skills/repo-setup/templates/plan-terms.md:60` | `spec`, "Stops"; `land`, "Stops"; `refute`, "Stops" | `skills/spec/SKILL.md:245` |
| refuter report | `skills/repo-setup/templates/plan-terms.md:61` | `refute`, Steps 6 and 7 and "Steps / Over a repair round" | `skills/refute/SKILL.md:60` |
| repair round | `skills/repo-setup/templates/plan-terms.md:62` | `plan-orchestration`, Steps 8 and Rules; `refute`, "Steps / Over a repair round" | `skills/plan-orchestration/SKILL.md:312` |
| resume point | `skills/repo-setup/templates/plan-terms.md:63` | `plan-orchestration`, "Resuming, and handing the plan over" | `skills/plan-orchestration/SKILL.md:143` |
| retro | `skills/repo-setup/templates/plan-terms.md:64` | `plan-retro`, Steps 8 | `skills/plan-retro/SKILL.md:48` |
| review cadence | `skills/repo-setup/templates/plan-terms.md:65` | `plan-orchestration`, Steps 7 and "The review, earned"; `plan`, Steps 4 | `skills/plan-orchestration/SKILL.md:185` |
| reviewer | `skills/repo-setup/templates/plan-terms.md:66` | `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models" | `skills/refute/SKILL.md:159` |
| roadmap entry | `skills/repo-setup/templates/plan-terms.md:67` | `roadmap`, "Steps / add" and "The format is the file's" | `skills/roadmap/SKILL.md:70` |
| rule clash | `skills/repo-setup/templates/plan-terms.md:68` | `plan-orchestration`, "Stops"; `repo-setup`, `templates/shared-rules.md`, "Surface rule clashes" | `skills/plan-orchestration/SKILL.md:278` |
| rules file | `skills/repo-setup/templates/plan-terms.md:69` | `spec`, Steps 4; `plan`, Steps 4 | `skills/spec/SKILL.md:91` |
| ruling | `skills/repo-setup/templates/plan-terms.md:70` | `spec`, "Steps / A ruling" and "What it reads" 4 | `skills/spec/SKILL.md:196` |
| ruling (orchestrator's) | `skills/repo-setup/templates/plan-terms.md:70` | `plan-orchestration`, Steps 6 and 8 | `skills/plan-orchestration/SKILL.md:92` |
| runner | `skills/repo-setup/templates/plan-terms.md:71` | `plan-orchestration`, "The two tiers, and the models" and "Launching a builder" | `skills/plan-orchestration/SKILL.md:132` |
| sequence, the | `skills/repo-setup/templates/plan-terms.md:72` | `plan-help`, "The sequence, printed verbatim" | `skills/plan-help/SKILL.md:38` |
| session, the | `skills/repo-setup/templates/plan-terms.md:73` | `spec`, Steps 1; `plan-orchestration`, "Resuming, and handing the plan over" | `skills/spec/SKILL.md:58` |
| shared path | `skills/repo-setup/templates/plan-terms.md:74` | `spec`, Steps 5; `plan-orchestration`, "Two steps in flight" | `skills/spec/SKILL.md:116` |
| shared-rules block | `skills/repo-setup/templates/plan-terms.md:75` | `repo-setup`, Steps 3 and "Steps / sync" | `skills/repo-setup/SKILL.md:39` |
| slug | `skills/repo-setup/templates/plan-terms.md:76` | `plan`, Steps 1 | `skills/plan/SKILL.md:42` |
| standards | `skills/repo-setup/templates/plan-terms.md:77` | `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind" | `skills/refute/SKILL.md:35` |
| standards (pages) | `skills/repo-setup/templates/plan-terms.md:77` | `repo-setup`, "The tree"; `plan-help`, "The sequence, printed verbatim" | `skills/plan-help/SKILL.md:48` |
| state file | `skills/repo-setup/templates/plan-terms.md:78` | `plan`, Steps 4; `plan-orchestration`, "What it reads" and "Resuming, and handing the plan over" | `skills/plan-orchestration/SKILL.md:33` |
| step | `skills/repo-setup/templates/plan-terms.md:79` | `plan`, Rules | `skills/plan/SKILL.md:92` |
| step (Steps item) | `skills/repo-setup/templates/plan-terms.md:79` | each skill's Steps | `skills/plan/SKILL.md:50` |
| step (roadmap) | `skills/repo-setup/templates/plan-terms.md:79` | `roadmap`, "The format is the file's" | `skills/roadmap/SKILL.md:99` |
| Step 0 | `skills/repo-setup/templates/plan-terms.md:80` | `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6 | `skills/spec/SKILL.md:190` |
| stop | `skills/repo-setup/templates/plan-terms.md:81` | `plan-orchestration`, "Stops"; `spec`, "Steps / A stop" | `skills/plan-orchestration/SKILL.md:271` |
| stop (approval) | `skills/repo-setup/templates/plan-terms.md:81` | `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops" | `skills/repo-setup/SKILL.md:137` |
| sync | `skills/repo-setup/templates/plan-terms.md:82` | `repo-setup`, "Steps / sync" | `skills/repo-setup/SKILL.md:71` |
| taken back out of main | `skills/repo-setup/templates/plan-terms.md:83` | `land`, Steps 6; `spec`, "Steps / A step taken back out of main" | `skills/land/SKILL.md:70` |
| tiers | `skills/repo-setup/templates/plan-terms.md:84` | `plan-orchestration`, "The two tiers, and the models" | `skills/plan-orchestration/SKILL.md:123` |
| time box | `skills/repo-setup/templates/plan-terms.md:85` | `refute`, Rules | `skills/refute/SKILL.md:165` |
| user-visible choice | `skills/repo-setup/templates/plan-terms.md:86` | `spec`, Steps 4 and "Stops" | `skills/spec/SKILL.md:108` |
| verdict | `skills/repo-setup/templates/plan-terms.md:87` | `refute`, "The verdicts" | `skills/refute/SKILL.md:118` |
| verification page | `skills/repo-setup/templates/plan-terms.md:88` | `plan`, "What it reads" 3 and Steps 4; `ordo-init`, Steps 3 | `skills/plan/SKILL.md:38` |
| verify list | `skills/repo-setup/templates/plan-terms.md:89` | `land`, "The landing script"; `plan`, Steps 4 | `skills/land/SKILL.md:140` |
| wip | `skills/repo-setup/templates/plan-terms.md:90` | `land`, Steps 3 | `skills/land/SKILL.md:50` |
| worker | `skills/repo-setup/templates/plan-terms.md:91` | `plan-orchestration`, "The two tiers, and the models"; `plan`, Steps 4 | `skills/plan-orchestration/SKILL.md:129` |
| worker (the builder) | `skills/repo-setup/templates/plan-terms.md:91` | `spec`, Steps 9 | `skills/spec/SKILL.md:159` |
| worktree | `skills/repo-setup/templates/plan-terms.md:92` | `spec`, Steps 7; `land`, "Removing a step's worktree" | `skills/spec/SKILL.md:135` |
| blind comparison | `docs/glossary.md:102` | `docs/dev/blind-comparison.md` | `docs/dev/blind-comparison.md:3` |
| case, of a skill's description | `docs/glossary.md:103` | `docs/dev/skill-layout.md`, "Frontmatter" | `docs/dev/skill-layout.md:20` |
| coverage list | `docs/glossary.md:104` | `docs/dev/change-standard.md`, rule 18 | `docs/dev/change-standard.md:44` |
| coverage list (script) | `docs/glossary.md:104` | `utils/check_coverage.py`, its head comment | `utils/check_coverage.py:2` |
| critical failure | `docs/glossary.md:105` | `docs/dev/blind-comparison.md`, steps 1 and 5 | `docs/dev/blind-comparison.md:9` |
| loop, in the README | `docs/glossary.md:106` | `README.md`, the introduction | `README.md:7` |
| pin | `docs/glossary.md:107` | `README.md`, "Working on Ordo"; `utils/pin.sh`, its head comment | `README.md:132` |
| verdict, of a blind comparison | `docs/glossary.md:108` | `docs/dev/blind-comparison.md`, steps 6 and 7 | `docs/dev/blind-comparison.md:10` |

### The six terms of the step line

- **step**: `plan`, Rules says "A step is one deliverable and one dispatch of its executor ..., with the command that proves it, except the bookkeeping steps the orchestrator does itself"; the entry says that, with the tag of `plan`, Rules bullet 2. The second sense is each skill's "Steps <n>" (`plan`, Steps 2: "go to the user at Steps 3"); the third is `roadmap`, "The format is the file's": "`38.0`, `38.1` steps as bullets under it".
- **brief**: `spec`, Steps 4 lists the brief's parts; `plan-orchestration` Steps 8 names the round's brief and Steps 6 the round-0 ruling file `agents/briefs/<step>-cases.md`. The entry states nothing beyond them.
- **ledger**: `plan` Steps 1 (the folder under `ledger_root`), 3 and 4 (`plan.md`, `orchestrator-state.md`), 5 (`agents/briefs/`, `agents/reviews/`); `land` Steps 5 ("the ledger is written only on main"); `plan-orchestration` Steps 4 (the builder writes only its report, in the worktree's copy) and 6 (the orchestrator saves it into the main ledger).
- **landing**: `land`, the introduction and Steps: brings a refuted step from its worktree onto main, in one commit with its booking and its landing report.
- **finding**: `refute` Steps 6 (place, quoted hunk, what is wrong, failure scenario) and "Finding dispositions" (closed in a repair round, at landing, or raised as an open item); `spec` "Steps / The brief check" 4 (closed by a change to the brief, or a stop).
- **open item**: `plan-orchestration` "Stops" (the stop message: options, pros and cons, one recommendation) and `spec` "Steps / A stop"; `land` "Stops", row "A worktree that cannot be removed", closed by running the removal.

### The completeness sweep

Every `SKILL.md` was read whole, with the templates of `plan`, `spec`, `refute`, `plan-retro`, `roadmap` and `repo-setup`. Terms added to `plan-terms.md` beyond item 1's list, each a word the skills use in a sense of their own: acceptance item, capability map, commit rule, completion notice, dead builder, Doc text, four headings, goal, hand-back, handover, in flight, insertion form, kind, launch commit, night rule, part file, pause, plan configuration, `projects:` form, the question, the questions, refuter report, retro, rule clash, runner, the sequence, shared path, slug, sync, tiers, user-visible choice, verification page. Item 1's paired terms have a bullet each: plan skills and project skills, shared-rules block and plan-terms block, dispatch block and dispatch entry.

### Senses found by grepping the terms of item 1 across `skills/`, `docs/dev/` and `README.md`

Commands: `git grep -n -i -w -o -- '<term>' -- skills docs/dev README.md | cut -d: -f1 | sort | uniq -c` for bar, base, loop, look, verdict, gate, delta, wip, worker, booking and premise, then `git grep -n -i -w` over the files it named; `git grep -n -i -w` of case, landing, ledger, orchestrator, reviewer, standards, refusal, authority, executor, time box, open item, resume point and position line over `docs/dev`, `README.md` and the `repo-setup` templates. Each sense beyond an entry's first, and where it is closed:

- booking: "books the ruling" (`skills/spec/SKILL.md:202`) and "a booking instead of a fix" (`skills/repo-setup/templates/shared-rules.md:11`), both added to the entry.
- case: "at least five real cases from the tree" (`skills/spec/SKILL.md:102`), added; "each case the skill is for" (`docs/dev/skill-layout.md:20`), an Ordo page, under Ordo's own terms.
- Closed: the state file's closed items (`skills/plan-orchestration/SKILL.md:249`), added.
- gate: "A gate for a judgment is a review" (`skills/repo-setup/templates/shared-rules.md:15`; the same in both change standards and `docs/dev/blind-comparison.md:3`), added with the shared rules as its source.
- loop: "the loop inside a step" (`skills/plan-help/SKILL.md:3`), added; "Around that loop" (`README.md:7`), under Ordo's own terms.
- plan: "the ordered build plan" over a capability map (`skills/roadmap/SKILL.md:114`), added.
- red line: "A red check" (`skills/plan-orchestration/SKILL.md:277`), added.
- ruling: the orchestrator's ruling per finding and on a case (`skills/plan-orchestration/SKILL.md:82` and 92), added.
- standards: the standard pages `/repo-setup` writes (`skills/plan-help/SKILL.md:48`; `README.md:13`, 27, 81), added.
- step: an item of a skill's Steps (`git grep -o -E 'Steps [0-9]+' -- skills | wc -l` printed 102 in the brief check) and a roadmap entry under a phase (`skills/roadmap/SKILL.md:99`), added.
- stop: an approval stop that leaves no open item (`skills/repo-setup/SKILL.md:137`; the `roadmap` and `land` Stops), added.
- verdict: a blind comparison's A, B or tie (`docs/dev/blind-comparison.md:10`), under Ordo's own terms.
- worker: the builder itself, "The worker's identity" (`skills/spec/SKILL.md:159`), added.
- worktree: the pinned worktree `~/.local/share/ordo-stable` (`README.md`, `docs/dev/change-standard.md`), under Ordo's own term "pin".
- The same sense only: base, bar, delta, wip, premise, landing, ledger, orchestrator (also `docs/dev/blind-comparison.md`), reviewer (also `docs/dev/skill-layout.md:78`), refusal (`docs/dev/skill-layout.md:31` and 51); "look" elsewhere is the ordinary verb (`spec` Steps 3, "Look for libraries").

One more term went under "## Ordo's own terms", since its only sources are Ordo files: coverage list, in two senses (`docs/dev/change-standard.md` rule 18, and the file `utils/check_coverage.py` checks).

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. `plan-terms.md` | DONE | `grep -c '^- \*\*' skills/repo-setup/templates/plan-terms.md` printed `90`; the bold terms, backticks removed, compared with `LC_ALL=C sort -f` of themselves: `diff` printed nothing and the command printed `sorted` |
| 2. `docs/glossary.md` | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0, which also shows the paragraph writes no marker string (case "a marker quoted in prose") |
| 3. The glossary template | DONE | quoted whole above: heading, paragraph, the two markers with nothing between them, `## Project terms` with the entry-form comment and no entries |
| 4. `sync_rules.py` | DONE | `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 \| tail -1` printed `PASS: sync_rules.py scratch tests`; the revert table below |
| 5. `sync_rules.test.sh` | DONE | a case for every script case of "Cases", each asserting the exit status and the line printed (the case table below) |
| 6. `skills/repo-setup/SKILL.md` 1.2.0 | DONE | the diff above; the length command printed `702 skills/repo-setup/SKILL.md` |
| 7. `templates/CLAUDE.md` bullet | DONE | `skills/repo-setup/templates/CLAUDE.md:20` (grep above) |
| 8. `skill-layout.md` rule | DONE | `docs/dev/skill-layout.md:60` |
| 9. `building.md` and the change standard's block | DONE | `docs/dev/building.md:9` and 10; `docs/dev/change-standard.md:66` |
| 10. `.agents/plan.yaml` line 12 | DONE | `.agents/plan.yaml:12` |
| 11. `README.md` 13, 81, 83-89 | DONE | `README.md:13`, 81, 83, 85, 88, 89 |
| 12. Ruling F: `skills/ordo-init/SKILL.md` Steps 7, 1.1.1 | DONE | `grep -n 'glossary' skills/ordo-init/SKILL.md` printed line 67; see "Ruling F" |

The grep behind items 7 to 11, `grep -n 'glossary' docs/dev/skill-layout.md skills/repo-setup/templates/CLAUDE.md docs/dev/building.md .agents/plan.yaml README.md`, printed hits at `docs/dev/skill-layout.md:60`, `skills/repo-setup/templates/CLAUDE.md:20`, `docs/dev/building.md:9` and 10, `.agents/plan.yaml:12`, and `README.md:13`, 81, 83, 85 and 89; each was read against its item.

### The verification, verbatim

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`, exit 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary`, exit 0:

```
ok: the plan-terms block equals the template
```

The gate's length command:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
702 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md
```

`LC_ALL=C grep -n '[^ -~]'` over the 13 changed and new files (`{ git diff --name-only; git ls-files --others --exclude-standard; } | tr '\n' '\0' | xargs -0 env LC_ALL=C grep -n '[^ -~]'`) printed nothing.

What these do not cover: the checks prove the script's behaviour and the byte equality of the glossary's block with `plan-terms.md`; whether each definition says what its section says is a judgment, made by reading, as the table of terms and the six terms give it.

The suite: `sync_rules.test.sh` still prints one `PASS:` line; it holds the case groups it held before and the new ones below. The plan's verify list still has 7 commands; the new glossary command goes into the state file's verify list at landing, as the brief says.

### The script's cases

| Case of "Cases" | Test (line of `sync_rules.test.sh`) | Asserts |
|---|---|---|
| Both blocks equal | 221 | exit 0; stdout exactly the two `ok:` lines, the shared-rules one first; stderr empty |
| The glossary block differs by one line | 227 | exit 1; stdout the shared-rules `ok:` line, then `--- docs/glossary.md (plan terms)`, `+++ template` and the drifted line; stderr empty |
| Both blocks differ | 240 | exit 1; both diffs, `CLAUDE.md`'s first |
| `--write` with both differing, a CRLF glossary | 250 | exit 0; the two `written:` lines; a rerun exits 0; every glossary line still CRLF; the bytes outside both blocks unchanged (`cmp`) |
| No `docs/glossary.md` | 278 | exit 2; stdout empty; one stderr line `error: docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)` |
| No block, two blocks, end marker first | 283 | exit 2 and that line, each |
| A glossary not UTF-8 | 301 | exit 2; `error: <path> is not UTF-8 (byte ` |
| `plan-terms.md` missing beside the script | 320 | exit 2; `error: cannot read <copy>/plan-terms.md: No such file or directory` |
| `--only glossary`, no `CLAUDE.md` | 327 | exit 0 and the plan-terms `ok:` line alone; then exit 1 and the glossary's diff |
| `--only` with another value; two paths | 364, 365 | exit 2; stdout empty; stderr exactly `Usage: sync_rules.py <repository root> [--write] [--only glossary]` |
| Shared-rules drifted and no glossary, with and without `--write` | 371 | exit 2; the glossary's `error:` line alone; stdout empty; `CLAUDE.md` byte for byte unchanged (`cmp`) |
| `CLAUDE.md` with no single block, and no glossary | 382 | exit 2; stdout empty; stderr exactly the two `error:` lines, `CLAUDE.md`'s first |
| `--write` with only the glossary differing | 391 | exit 0; stdout exactly the shared-rules `ok:` line and the plan-terms `written:` line; `CLAUDE.md` unchanged (`cmp`) |
| `--write` where `CLAUDE.md` cannot be written | 400 | exit 2; `error: cannot write <path>/CLAUDE.md: Permission denied`; the glossary unchanged (`cmp`) |
| `--only glossary` beside a drifted or a missing shared-rules block | 339 | exit 0 and the plan-terms `ok:` line alone, each |
| `--only glossary --write` on a differing glossary | 349 | exit 0; the plan-terms `written:` line alone; a drifted `CLAUDE.md` unchanged (`cmp`); a rerun exits 0 |
| `--only` last with no value, `--only=glossary` (with a path, and alone), `--only glossary` twice; `--only glossary` before the path | 366 to 369; 360 | the usage line and exit 2, each; before the path, exit 0 and the `ok:` line |
| `docs/glossary.md` a directory | 313 | exit 2; `error: cannot read <path>/docs/glossary.md: Is a directory` |
| A glossary not UTF-8, under `--write` | 301 | exit 2 and the same line; the file byte for byte unchanged (`cmp`) |
| The glossary cannot be written, or does not read back | 410 | exit 2; stderr exactly `error: cannot write <path>: Permission denied`, and exactly `error: <path> does not read back as written` |
| A marker string inside prose | 296 | exit 2; the no-single-block line |
| Every case before this step | 119 to 219 | the assertions as before; the fixtures now hold a glossary too |

A write that cannot be made is simulated by the test's `fake-open.py`, which raises `PermissionError(EACCES)` for a path ending in the given suffix, so the case holds when the test runs as root too.

### The reverts

Each revert applied to a copy of the new script, and the whole test run against it by a helper in the session's scratch folder (`python3 reverts.py <templates> <scratch>`); the first `FAIL:` line it printed, the scratch paths shortened:

| Revert | Exit and red line |
|---|---|
| R1 the glossary block left out of a default run | exit 1: FAIL: equal blocks: stdout is [ok: the shared-rules block equals the template], expected [ok: the shared-rules block equals the template |
| R2 each block printed before the next is read | exit 1: FAIL: no glossary: stdout is not empty: [ok: the shared-rules block equals the template] |
| R3 a missing glossary skipped without an error line | exit 1: FAIL: no glossary: stderr is not [error: ...docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-terms end -->)...]: [] |
| R4 the check stopped at the first file in error | exit 1: FAIL: two files in error do not print both error lines in order: [error: CLAUDE.md has no single shared-rules block (<!-- ordo:shared-rules begin --> ... <!-- ordo:shared-rules end -->)] |
| R5 a failed write of CLAUDE.md followed by the glossary's | exit 1: FAIL: lost write: stdout is not empty: [ok: the plan-terms block equals the template] |
| R6 --only glossary reading CLAUDE.md | exit 1: FAIL: python3 -B <templates>/sync_rules.py <scratch>/only-no-claude --only glossary: exit 2, expected 0: [] [error: no CLAUDE.md in <scratch>/only-no-claude] |
| R7 --only=glossary taken as a path | exit 1: FAIL: --only=glossary with no other argument: stderr is not the usage line: [error: no CLAUDE.md in <worktree>/--only=glossary |
| R8 --only glossary accepted twice | exit 1: FAIL: python3 -B <templates>/sync_rules.py <scratch>/args --only glossary --only glossary: exit 0, expected 2: [ok: the plan-terms block equals the template] [] |
| R9 --only with any value accepted | exit 1: FAIL: python3 -B <templates>/sync_rules.py <scratch>/args --only rules: exit 0, expected 2: [ok: the plan-terms block equals the template] [] |
| R10 a marker counted only on a line of its own | exit 1: FAIL: python3 -B <templates>/sync_rules.py <scratch>/quoted-marker: exit 0, expected 2: [ok: the shared-rules block equals the template |
| R11 the block written in LF whatever the file's ending | exit 1: FAIL: --write left 31 CRLF lines of 56 |
| R12 a glossary that is a directory taken as missing | exit 1: FAIL: glossary a directory: stderr is not [error: ...cannot read <scratch>/terms-dir/docs/glossary.md: Is a directory...]: [error: docs/glossary.md has no single plan-terms block (<!-- ordo:plan-terms begin --> ... <!-- ordo:plan-te ... |
| R13 a missing plan-terms.md taken as an empty template | exit 1: FAIL: python3 -B <scratch>/lone-script/sync_rules.py <scratch>/lone: exit 1, expected 2: [ok: the shared-rules block equals the template |
| R14 no read-back after a write | exit 1: FAIL: python3 -B <scratch>/fake-open.py lost CLAUDE.md <templates>/sync_rules.py <scratch>/lost-write --write: exit 0, expected 2: [written: the shared-rules block now equals the template |

## Files and line counts

`wc -l` after the change: `.agents/plan.yaml` 12, `README.md` 148, `docs/dev/building.md` 28, `docs/dev/change-standard.md` 81, `docs/dev/skill-layout.md` 88, `skills/ordo-init/SKILL.md` 122, `skills/repo-setup/SKILL.md` 159, `skills/repo-setup/templates/CLAUDE.md` 33, `skills/repo-setup/templates/sync_rules.py` 172, `skills/repo-setup/templates/sync_rules.test.sh` 422; new: `docs/glossary.md` 108, `skills/repo-setup/templates/docs/glossary.md` 13, `skills/repo-setup/templates/plan-terms.md` 92. `git diff --numstat` (added, removed): `.agents/plan.yaml` 1 1, `README.md` 5 4, `docs/dev/building.md` 2 1, `docs/dev/change-standard.md` 1 0, `docs/dev/skill-layout.md` 1 0, `skills/ordo-init/SKILL.md` 2 2, `skills/repo-setup/SKILL.md` 21 16, `skills/repo-setup/templates/CLAUDE.md` 1 0, `sync_rules.py` 120 69, `sync_rules.test.sh` 267 25.

## Judgment calls the brief left open

- `plan-terms.md` opens with the heading `## Plan terms`, as `shared-rules.md` opens with `## Shared rules`, so the block reads as a section of the glossary.
- A term with two or three senses keeps one bullet, each sense followed by its own "Stated in", which makes such a bullet longer than two sentences; the brief asks for both.
- A sense whose only source is an Ordo page (the README, `docs/dev/`) is its own entry under "Ordo's own terms", named with its sense (case, loop, verdict), as item 1 says for the trigger sense of "case", so no `plan-terms.md` entry names an Ordo page.
- "Stated in" names a template's section where a skill states the term only there: `spec`'s `templates/brief.md` for Doc text, and `repo-setup`'s `templates/shared-rules.md` for the general senses of gate and booking and for rule clash. Those files belong to the skills every repository installs.
- `docs/glossary.md`'s paragraph names the command that compares the block, so a reader sees how "changed only there" is kept.
- The script refuses every argument that starts with `--only` other than `--only` itself, so `--only=glossary` alone prints the usage line and is not taken as a path; test line 368 covers it.
- The module docstring is written one paragraph per line, as the prose standard's source formatting asks of a file-header comment; the usage line stays the third line, which the script prints.
- `repo-setup`'s description gained the trigger phrase "sync the glossary", for the skill's new case (`docs/dev/skill-layout.md`, Frontmatter).
- `repo-setup` Steps 3's last bullet reads "Any other placeholder with no answer", so the new exception and the old rule do not contradict; the Stops row "The drafted sync change" reads "an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block", since there are now two such lines.
- `building.md`'s new line puts its comment after three spaces, since the command is longer than the column the other comments align on.

## User-visible changes

- `/repo-setup` writes `docs/glossary.md` in a new repository and lists it in `CLAUDE.md`'s "Read before you act". Before, `sync` checked `CLAUDE.md` only, and a repository set up earlier passed it; now `sync` checks both blocks, such a repository gets `error: docs/glossary.md has no single plan-terms block (...)`, and `sync` drafts the glossary from the template for approval (Steps / sync 4).
- `sync_rules.py` prints a second `ok:`, `written:` or diff line for the glossary and accepts `--only glossary`; its usage line was `Usage: sync_rules.py <repository root> [--write]` and is `Usage: sync_rules.py <repository root> [--write] [--only glossary]`.
- `/ordo-init` drafts `docs/glossary.md` into `standards` when the repository has one.
- Ordo's verify commands (`docs/dev/building.md`, the change standard's block) gain `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`, and `.agents/plan.yaml`'s `standards` names `docs/glossary.md`.

## Anything in the brief found wrong or impossible

Nothing. The premises reran as the brief states them: `skills/repo-setup/SKILL.md` was version 1.1.2 at 630 characters; `sync_rules.py` 121 lines and `sync_rules.test.sh` 180 lines before the change (`cat -n` of the unchanged files); `.agents/plan.yaml` line 12 as quoted.

## Doc text

A sentence outside the paths that the change makes incomplete, for the orchestrator to apply at landing:

- `docs/dev/change-standard.md:59`, the sentence before the command block (outside lines 61-69): the block now holds a second command with no filter.
  - Current: `59:Every build, test or check command runs in the foreground with a long timeout, one configuration per command, and each test's output goes through a filter for its summary lines so raw build output never enters the context; the ASCII check takes no filter:`
  - Replacement: `Every build, test or check command runs in the foreground with a long timeout, one configuration per command, and each test's output goes through a filter for its summary lines so raw build output never enters the context; the glossary check and the ASCII check take no filter:`

Sentences checked and not made false: `docs/roadmap.md:116` (a later entry's gate, "`sync_rules.py` exits 0 on Ordo") exits 2 on Ordo before this change as after it (`python3 skills/repo-setup/templates/sync_rules.py .` printed `error: no CLAUDE.md in ...`); `skills/repo-setup/templates/shared-rules.md:3` ("`/repo-setup sync` keeps this section identical to the template") holds; `skills/repo-setup/SKILL.md` Steps 10 runs `sync_rules.py .` after Steps 5 wrote the glossary, so "the first two exit 0" holds; `README.md:49` (perl for `sync_rules.test.sh`) holds.

## Ruling F

Item 12, `skills/ordo-init/SKILL.md`:

- Steps 7, old: `` - `standards` lists the coding, layout or prose standard pages the repository has. ``
- Steps 7, new: `` - `standards` lists the coding, layout or prose standard pages the repository has, and `docs/glossary.md` when the repository has one, so every brief names it. ``
- `metadata.version`: `"1.1.0"` to `"1.1.1"`.
- The description does not name what `standards` holds (it names the roadmap, the page that defines the checks, the change standard and the check commands), so it is unchanged; the length command printed `632 skills/ordo-init/SKILL.md`.

The case: on the unchanged tree `grep -n 'glossary' skills/ordo-init/SKILL.md` exited 1 with nothing; after the change it prints line 67, the Steps 7 bullet above. By reading: `/repo-setup` writes `docs/glossary.md` at its Steps 5 and runs `/ordo-init` at its Steps 8, so the file exists when `/ordo-init` drafts `standards`; `skills/ordo-init/templates/check_config.py` lines 54 to 56 add an error only for a `standards` page that is not a file, so it accepts `docs/glossary.md`.

The point for the user named in the builder's prompt, whether `/ordo-init` should put `docs/glossary.md` into a new repository's `standards`: the user ruled it (open item F, option (a)), and item 12 builds it.


## Repair round 1

All eight points of the round brief (`agents/briefs/9-round-1.md`) are done as ruled. Nothing in the round could not be done as written.

### Points 1 to 5: `skills/repo-setup/templates/plan-terms.md`

Point 1, the eight entries the brief names: A/B, acceptance item, dead builder, kind, night rule, recurring finding, repair round, shared path. Each was changed as the brief rules. The old and new text of each is in the list below.

Point 1, the same test applied to every other entry. An entry says what the term names and points at the section, and carries no rule's number, threshold or condition. These entries changed under it:

- authority: dropped "`/spec` refuses a step without it" (what a skill does on a missing tag, a rule).
- bar: dropped "with at most one fix at landing" (a number) and "under `review: earned` a failed bar puts the reviewer back" (a condition).
- brief check: dropped "before the preparation commit" (when it runs) and the clause on how each finding is closed (a rule, which the entry finding states as its second sentence).
- builder: dropped "runs no git command and writes in the ledger only its report" (the builder's rules).
- case: dropped "comes before any change, a code step's case as a test and a text step's by reading" (the order and method rule of the first run) and "at least five of them" (a number).
- delta: dropped the `refute_after_repair: no` clause (a condition).
- executor: dropped "always for manuscript content" (a condition).
- fix at landing: dropped the two conditions under which a fix at landing is allowed.
- four headings: dropped "each finding with its failure scenario" (a rule on a finding's form, which the entry finding states).
- gate: dropped "a script for a fact, a review for a judgment" (the rule of the section it cites).
- goal: dropped "in one or two sentences" (a number).
- hand-back: dropped "before any change when its first run finds" (a timing condition), keeping that it is a builder's stop that returns its first run and the case.
- launch commit: dropped the timing clause under each executor (a condition).
- look: dropped "when the step changes a view" and "an empty `look:` means no look" (conditions).
- loop: dropped "until a pause or until nothing unblocked is left" (the loop's end condition), and the inside-a-step sense "up to `repair_rounds` times, or once more under the round cap's exception" became "within the round cap" (a number and a condition).
- Not yet specified: dropped "`/plan` refuses such an entry until `/roadmap add <entry>` names its gate" (a rule).
- orchestrator: dropped "writes no step code beyond a fix at landing unless the step's executor is `inline`" (a rule with its condition).
- pause: dropped "nothing is dispatched during it" (a rule).
- plan configuration: "the only place a project specific lives" became "which holds a repository's project specifics" ("the only place" is the rule that specifics live nowhere else).
- premise: dropped what happens to a false premise (absorbed or a stop, a condition).
- red line: dropped what a red line leads to (fix at landing or taken back out, conditions), and the second sense was rephrased from "A red check no fix within the plan covers is a stop" to name what a red check is.
- resume point: dropped "each holding only the paths its session wrote since the last one" (a rule on the commit's contents).
- reviewer: dropped "never the builder" (a rule).
- roadmap entry: dropped "that never changes" (a rule on numbering).
- state file: dropped "rewritten before every step commit and read first after a compaction" (when it is written and read).
- stop: dropped "booked as ... committed as a resume point" and "under the loop it blocks only its own step" (what a stop leads to), keeping "which leaves an open item in the state file and under the step's Step 0".
- taken back out of main: dropped "its worktree and branches are kept, its failure goes into its Step 0, and `/spec` saves its work as a patch and prepares it again" (the procedure that follows), keeping what the term names: the changes removed from main and `landing: backed-out`.
- time box: dropped "when above 0" (a threshold) and "kept by reporting what was checked and naming what was not" (a rule).
- user-visible choice: dropped "a brief never takes one, and `/spec` stops on it" (the rule); "under `libraries: check`" is kept because without it the entry would say every replaceable library is the user's choice, which `spec` Stops does not say.
- verdict: dropped "a verdict of violated, partial or unmet naming its finding" (a rule on the verdict's form).
- verify list: dropped "run in order ... from the root of the checkout it checks, the worktree and then main" and "the lines it prints are what a report or a booking quotes" (procedure and a rule), keeping the key and the script that runs it.
- wip: dropped "when something is staged" (a condition).
- worktree: dropped "removed by `/land` after the landing and kept after a step is taken back out of main" (what happens to it, conditions).

Kept under the test, with the reason. brief, ledger, landing, finding and open item: the brief names them as samples, and what they carry is the contents of a file or a report and how an item closes, not a number, a threshold or a condition. plan skills: point 7 keeps the entry as it is. ledger keeps "the builder writes only its report" in the worktree's copy, because that sentence says what the copy holds. rules file keeps "Every brief points at it first" and verification page keeps "`/plan` copies them into the verify list", because each says where the named thing is used, with no number or condition. dispatch entry keeps its list of keys, because the keys are what the entry is.

Point 2. base: "; the base binaries are the build `/spec` stages from it for the A/B" is dropped and its `spec` source reads Steps 6 and 7. dispatch block: its "Stated in" reads `spec`, Steps 9; `plan`, `templates/orchestrator-state.md`, and its definition is unchanged. `skills/plan/templates/orchestrator-state.md` line 26 is the `dispatch: none` line that defines the block.

Point 3. stop gains a third sense: "To stop an agent is also to end a running builder or reviewer through the runner's stop tool. Stated in: `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set"." The lines using it: `skills/land/SKILL.md:45` ("An agent is stopped through the runner's stop tool.") and `skills/plan-orchestration/SKILL.md:263` ("At the cut-off anything still running is stopped.").

Point 4. reviewer gains "It is also called the refuter." and `plan-retro`, the introduction, in its sources. The line using it: `skills/plan-retro/SKILL.md:10` ("A finding the refuter keeps making is a rule the builder was not given, ...").

Point 5. Every definition is written without semicolons, with full stops. Each sense is at most two sentences plus its "Stated in". Where a definition joined its parts with a colon (booking, completion notice, Closed, open item, orchestrator, refusal, refuter report, state file), the colon became a comma or "holding"/"which" so that the sense stays one sentence. No fact left after points 1 to 4 was dropped: each changed entry below was read old beside new for it.

The entry count is 90 and the order is unchanged: the command `diff <(grep -o '^- \*\*[^*]*\*\*' plan-terms.round0.md) <(grep -o '^- \*\*[^*]*\*\*' skills/repo-setup/templates/plan-terms.md)` printed nothing, where `plan-terms.round0.md` is the copy of the file before the round. The bullet line numbers of the table of terms above therefore hold. The section "`skills/repo-setup/templates/plan-terms.md`, whole" above shows the file before this round; the list below gives every entry that changed.

The table of terms above changes in these rows: base, "Stated in" `spec`, Steps 6 and 7; `land`, Steps 4; `refute`, "What it reads" 5. dispatch block, "Stated in" `spec`, Steps 9; `plan`, `templates/orchestrator-state.md`, line `skills/plan/templates/orchestrator-state.md:26`. reviewer, "Stated in" adds `plan-retro`, the introduction. New row: reviewer (refuter), bullet `skills/repo-setup/templates/plan-terms.md:66`, `plan-retro`, the introduction, line `skills/plan-retro/SKILL.md:10`. New row: stop (an agent), bullet `skills/repo-setup/templates/plan-terms.md:81`, `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set", line `skills/land/SKILL.md:45`.

Every changed entry, old beside new (produced by comparing the saved round-0 copy with the file, entry by entry):

- A/B
  - Old: **A/B**: the landing's comparison of the staged base binaries with the new build, the benchmark commands the configuration block's `bench:` names run alternately after warm-ups, at least ten runs each; an empty `bench:` means no A/B. Stated in: `land`, Steps 8; `spec`, Steps 8.
  - New: **A/B**: the landing's comparison of the staged base binaries with the new build, by the benchmark commands the configuration block's `bench:` names. Stated in: `land`, Steps 8; `spec`, Steps 8.
- acceptance item
  - Old: **acceptance item**: a requirement of the brief's "What to build"; one the delta leaves unbuilt, with a fix too large for landing, is one of the two conditions that allow a round beyond `repair_rounds`. Stated in: `plan-orchestration`, Rules.
  - New: **acceptance item**: a requirement of the brief's "What to build". Stated in: `plan-orchestration`, Rules.
- authority
  - Old: **authority**: the tags that end a step line of `plan.md`, `(approved)` for a step of the list the user approved when the plan opened and `(ruling <name>)` for each ruling the step rests on; `/spec` refuses a step without it. Stated in: `plan`, Rules; `spec`, "What it reads" 4 and Steps 1.
  - New: **authority**: the tags that end a step line of `plan.md`, `(approved)` for a step of the list the user approved when the plan opened and `(ruling <name>)` for each ruling the step rests on. Stated in: `plan`, Rules; `spec`, "What it reads" 4 and Steps 1.
- bar
  - Old: **bar**: the standard a builder's first report meets when its step lands with at most one fix at landing; the booking and the landing report state whether it passed, and under `review: earned` a failed bar puts the reviewer back. Stated in: `land`, Steps 9 and 11; `plan-orchestration`, "The review, earned".
  - New: **bar**: the standard a builder's first report is judged against at its step's landing. The booking and the landing report state whether the first report passed it. Stated in: `land`, Steps 9 and 11; `plan-orchestration`, "The review, earned".
- base
  - Old: **base**: the hash of a step's preparation commit, recorded in its dispatch entry: the worktree is created from it, the step's diff is read against it, and `/land` cherry-picks the range from it; the base binaries are the build `/spec` stages from it for the A/B. Stated in: `spec`, Steps 6, 7 and 8; `land`, Steps 4; `refute`, "What it reads" 5.
  - New: **base**: the hash of a step's preparation commit, recorded in its dispatch entry. The worktree is created from it, the step's diff is read against it, and `/land` cherry-picks the range from it. Stated in: `spec`, Steps 6 and 7; `land`, Steps 4; `refute`, "What it reads" 5.
- booking
  - Old: **booking**: the record `/land` appends to `plan.md` for a landed step: what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
  - New: **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
- brief
  - Old: **brief**: the file `agents/briefs/<step>.md` that `/spec` writes for a step's builder, holding the checked premises, what to build, the cases, the paths the step writes, the decisions taken, the verification and the report shape; a repair round adds the round's brief, and a ruled case a cases ruling `agents/briefs/<step>-cases.md`. Stated in: `spec`, Steps 4; `plan-orchestration`, Steps 6 and 8.
  - New: **brief**: the file `agents/briefs/<step>.md` that `/spec` writes for a step's builder, holding the checked premises, what to build, the cases, the paths the step writes, the decisions taken, the verification and the report shape. A repair round adds the round's brief, and a ruled case a cases ruling `agents/briefs/<step>-cases.md`. Stated in: `spec`, Steps 4; `plan-orchestration`, Steps 6 and 8.
- brief check
  - Old: **brief check**: the check of a brief against the tree, before the preparation commit, by one fresh read-only agent on the reviewer's model (the brief-check agent), whose report is saved at `agents/reviews/<step>-brief-check.md` and each of whose findings is closed by a change to the brief or is a stop. Stated in: `spec`, Steps 5 and "Steps / The brief check".
  - New: **brief check**: the check of a brief against the tree by one fresh read-only agent on the reviewer's model, the brief-check agent, whose report is saved at `agents/reviews/<step>-brief-check.md`. Stated in: `spec`, Steps 5 and "Steps / The brief check".
- builder
  - Old: **builder**: the agent that builds one step in the step's worktree under the brief and the rules file, runs no git command and writes in the ledger only its report; under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
  - New: **builder**: the agent that builds one step in the step's worktree under the brief and the rules file. Under the executor `inline`, or when a step is built by hand, the session is the builder. Stated in: `plan-orchestration`, Steps 4 and "The two tiers, and the models"; `spec`, Steps 9.
- case
  - Old: **case**: an example under a brief's "Cases", an input with its expected result, each must-pass and must-refuse example the step's text gives and, for a code step, each input it implies; the builder's first run of every case on the unchanged tree comes before any change, a code step's case as a test and a text step's by reading. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run, at least five of them. Stated in: `spec`, Steps 4.
  - New: **case**: an example under a brief's "Cases", an input with its expected result, from the must-pass and must-refuse examples the step's text gives and, for a code step, the inputs it implies. The first run is the run of every case on the unchanged tree. Stated in: `spec`, Steps 4; `refute`, "The verdicts". Also a real instance from the tree on which a format or rule decision of a brief is run. Stated in: `spec`, Steps 4.
- Closed
  - Old: **Closed**: the heading of a report that holds each finding's disposition: in a brief-check report the change to the brief that closed it, in a refuter report whether it was closed in a round, fixed at landing or raised as an open item. Stated in: `spec`, "Steps / The brief check"; `refute`, "Finding dispositions". The closed items of the state file are also the log of what was raised and how it ended, which no report carries. Stated in: `plan-orchestration`, "Reports".
  - New: **Closed**: the heading of a report that holds each finding's disposition, in a brief-check report the change to the brief that closed it, in a refuter report whether it was closed in a round, fixed at landing or raised as an open item. Stated in: `spec`, "Steps / The brief check"; `refute`, "Finding dispositions". The closed items of the state file are also the log of what was raised and how it ended, which no report carries. Stated in: `plan-orchestration`, "Reports".
- completion notice
  - Old: **completion notice**: what the runner reports when an agent ends: its final message, and its tokens, tool uses and time, which the dispatch entry records and the booking states. Stated in: `plan-orchestration`, Steps 6 and "Launching a builder"; `land`, Steps 9.
  - New: **completion notice**: what the runner reports when an agent ends, its final message and its tokens, tool uses and time, which the dispatch entry records and the booking states. Stated in: `plan-orchestration`, Steps 6 and "Launching a builder"; `land`, Steps 9.
- dead builder
  - Old: **dead builder**: a builder the runner's agent listing no longer shows and whose report never arrived; it is reported to the user, and a continuation builder takes over its worktree only when the user says so. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
  - New: **dead builder**: a builder the runner's agent listing no longer shows and whose report never arrived. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
- delta
  - Old: **delta**: the diff of one repair round, from the commit or tree state recorded when the round was sent, read against the whole diff since the base; with `refute_after_repair: no` the orchestrator's read of the delta stands in for a refutation. Stated in: `refute`, "Steps / Over a repair round"; `plan-orchestration`, Steps 8.
  - New: **delta**: the diff of one repair round, from the commit or tree state recorded when the round was sent, read against the whole diff since the base. Stated in: `refute`, "Steps / Over a repair round"; `plan-orchestration`, Steps 8.
- dispatch block
  - Old: **dispatch block**: the second `yaml` block of the state file, `dispatch: none` or the dispatch entries of the steps in flight. Stated in: `spec`, Steps 9.
  - New: **dispatch block**: the second `yaml` block of the state file, `dispatch: none` or the dispatch entries of the steps in flight. Stated in: `spec`, Steps 9; `plan`, `templates/orchestrator-state.md`.
- dispatch entry
  - Old: **dispatch entry**: the record of one step in flight in the dispatch block: step, executor, worker, worktree, base, launched, report, `brief_check`, `landing` (`not-started`, `cherry-picking` or `backed-out`), `round`, and `shared_paths` when a file is shared; the orchestrator adds the builder's identity under `session_id` (its agent id, or `inline` or `academic-paper`), `builder_usage` and `reviewer_report`. Stated in: `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7; `land`, Steps 2 and 6.
  - New: **dispatch entry**: the record of one step in flight in the dispatch block: step, executor, worker, worktree, base, launched, report, `brief_check`, `landing` (`not-started`, `cherry-picking` or `backed-out`), `round`, and `shared_paths` when a file is shared. The orchestrator adds the builder's identity under `session_id` (its agent id, or `inline` or `academic-paper`), `builder_usage` and `reviewer_report`. Stated in: `spec`, Steps 9; `plan-orchestration`, Steps 4, 6 and 7; `land`, Steps 2 and 6.
- executor
  - Old: **executor**: who builds a step: `agent`, a builder dispatched in the worktree; `inline`, the orchestrating session itself; `academic-paper`, that skill, always for manuscript content; the configuration block holds the plan's default and the orchestrator chooses per step. Stated in: `plan-orchestration`, Steps 4; `plan`, Steps 4.
  - New: **executor**: who builds a step: `agent`, a builder dispatched in the worktree, `inline`, the orchestrating session itself, or `academic-paper`, that skill. The configuration block holds the plan's default, and the orchestrator chooses per step. Stated in: `plan-orchestration`, Steps 4; `plan`, Steps 4.
- finding
  - Old: **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item; a finding of the brief check is closed by a change to the brief, or is a stop. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check".
  - New: **finding**: a defect a reviewer reports, with its place, the quoted text, what is wrong and a failure scenario, closed in a repair round or at landing or raised to the user as an open item. A finding of the brief check is closed by a change to the brief, or is a stop. Stated in: `refute`, Steps 6 and "Finding dispositions"; `spec`, "Steps / The brief check".
- fix at landing
  - Old: **fix at landing**: a fix made on main during `/land`, for a red line a fix inside the brief closes or for a small finding of the last round's refutation inside the brief, counted and named with its cause in the booking. Stated in: `land`, Steps 6.
  - New: **fix at landing**: a fix made on main during `/land`, counted and named with its cause in the booking. Stated in: `land`, Steps 6.
- four headings
  - Old: **four headings**: the headings a reviewer's findings go under, Spec, Proof, Standards and Behaviour, each finding with its failure scenario. Stated in: `refute`, "The four headings".
  - New: **four headings**: the headings a reviewer's findings go under, Spec, Proof, Standards and Behaviour. Stated in: `refute`, "The four headings".
- gate
  - Old: **gate**: the check that proves a roadmap entry done, a command from the verification page, a test and what it asserts, or an observable result, which `/plan` copies into `plan.md`'s "## Gate"; a step's own gate is the check on its step line. Stated in: `roadmap`, "Steps / add" 2 and 3; `plan`, Steps 2; `spec`, Steps 4. Also any check that decides whether work passes: a script for a fact, a review for a judgment. Stated in: `repo-setup`, `templates/shared-rules.md`, "Scripts compute facts; judgment is read".
  - New: **gate**: the check that proves a roadmap entry done, a command from the verification page, a test and what it asserts, or an observable result, which `/plan` copies into `plan.md`'s "## Gate". A step's own gate is the check on its step line. Stated in: `roadmap`, "Steps / add" 2 and 3; `plan`, Steps 2; `spec`, Steps 4. Also any check that decides whether work passes. Stated in: `repo-setup`, `templates/shared-rules.md`, "Scripts compute facts; judgment is read".
- goal
  - Old: **goal**: what exists when a roadmap entry is done, in one or two sentences, copied into `plan.md`; in the question asked of a step's check, the goal is the part of it the step delivers. Stated in: `roadmap`, "Steps / add" 1; `plan`, Steps 2.
  - New: **goal**: what exists when a roadmap entry is done, copied into `plan.md`. In the question asked of a step's check, the goal is the part of it the step delivers. Stated in: `roadmap`, "Steps / add" 1; `plan`, Steps 2.
- hand-back
  - Old: **hand-back**: a builder's stop before any change when its first run finds a case the brief's rules get wrong, returning the first run and that case with the rule and the result; the orchestrator reads it as a report and rules on the case. Stated in: `plan-orchestration`, Steps 6.
  - New: **hand-back**: a builder's stop that returns its first run and a case the brief's rules get wrong, with the rule and the result. The orchestrator reads it as a report and rules on the case. Stated in: `plan-orchestration`, Steps 6.
- in flight
  - Old: **in flight**: said of a step whose dispatch entry is in the dispatch block and does not read `landing: backed-out`; `workers_at_once` sets how many may be in flight. Stated in: `spec`, "What it reads" 3; `plan-orchestration`, "Two steps in flight".
  - New: **in flight**: said of a step whose dispatch entry is in the dispatch block and does not read `landing: backed-out`. The configuration block's `workers_at_once` sets how many may be in flight. Stated in: `spec`, "What it reads" 3; `plan-orchestration`, "Two steps in flight".
- kind
  - Old: **kind**: a sentence that states a defect in general terms, the way a rule would forbid it, under which `/plan-retro` groups findings; a kind is recurring when it appears in at least three steps or two plans, and "no defect" holds the findings that report none. Stated in: `plan-retro`, "Grouping" and Steps 6.
  - New: **kind**: a sentence that states a defect in general terms, the way a rule would forbid it, under which `/plan-retro` groups findings. A kind is recurring when its count reaches the threshold that section states, and "no defect" holds the findings that report none. Stated in: `plan-retro`, "Grouping" and Steps 6.
- launch commit
  - Old: **launch commit**: the commit of a dispatch entry once its builder's identity is in it, right after the launch under `agent` and before the build under `inline` and `academic-paper`; it is a resume point. Stated in: `plan-orchestration`, Steps 4.
  - New: **launch commit**: the commit of a dispatch entry once its builder's identity is in it, a resume point. Stated in: `plan-orchestration`, Steps 4.
- ledger
  - Old: **ledger**: a plan's folder under `ledger_root`, holding `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/`; it is written on main, and a step's worktree holds a copy in which the builder writes only its report, which the orchestrator copies to main. Stated in: `plan`, Steps 1, 3, 4 and 5; `land`, Steps 5; `plan-orchestration`, Steps 4 and 6.
  - New: **ledger**: a plan's folder under `ledger_root`, holding `plan.md`, `orchestrator-state.md`, `agents/briefs/` and `agents/reviews/`. It is written on main, and a step's worktree holds a copy in which the builder writes only its report, which the orchestrator copies to main. Stated in: `plan`, Steps 1, 3, 4 and 5; `land`, Steps 5; `plan-orchestration`, Steps 4 and 6.
- look
  - Old: **look**: the landing's opening of the changed views where the configuration block's `look:` says, with a screenshot of each view and state, when the step changes a view; an empty `look:` means no look. Stated in: `land`, "The look".
  - New: **look**: the landing's opening of the changed views where the configuration block's `look:` says, with a screenshot of each view and state. Stated in: `land`, "The look".
- loop
  - Old: **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another, until a pause or until nothing unblocked is left. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated up to `repair_rounds` times, or once more under the round cap's exception. Stated in: `plan-help`, "The sequence, printed verbatim".
  - New: **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated within the round cap. Stated in: `plan-help`, "The sequence, printed verbatim".
- night rule
  - Old: **night rule**: the limit the loop keeps when the user sets a time by which no agent may run: dispatch only what fits before the cut-off, and at the cut-off stop what runs and pause the plan. Stated in: `plan-orchestration`, "The pace when a deadline is set".
  - New: **night rule**: the limit the loop keeps when the user sets a time by which no agent may run. Stated in: `plan-orchestration`, "The pace when a deadline is set".
- Not yet specified
  - Old: **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first; `/plan` refuses such an entry until `/roadmap add <entry>` names its gate. Stated in: `roadmap`, "The format is the file's"; `plan`, "What it reads" 2.
  - New: **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first. Stated in: `roadmap`, "The format is the file's"; `plan`, "What it reads" 2.
- open item
  - Old: **open item**: an entry of the state file's open items: a decision only the user can make, with its options, their pros and cons and one recommendation, closed by the user's ruling; or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".
  - New: **open item**: an entry of the state file's open items. It is a decision only the user can make, with its options, their pros and cons and one recommendation, closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".
- orchestrator
  - Old: **orchestrator**: the session that runs a plan: it reads, decides, invokes the skills, lands and books, and writes no step code beyond a fix at landing unless the step's executor is `inline`; run by hand, the session takes its part. Stated in: `plan-orchestration`, "The two tiers, and the models"; `spec`, Steps 5.
  - New: **orchestrator**: the session that runs a plan, which reads, decides, invokes the skills, lands and books. Run by hand, the session takes its part. Stated in: `plan-orchestration`, "The two tiers, and the models"; `spec`, Steps 5.
- pause
  - Old: **pause**: a halt of the loop the user asks for, which holds until the user lifts it; nothing is dispatched during it. Stated in: `plan-orchestration`, Steps 5 and "Stops".
  - New: **pause**: a halt of the loop the user asks for, which holds until the user lifts it. Stated in: `plan-orchestration`, Steps 5 and "Stops".
- plan configuration
  - Old: **plan configuration**: `.agents/plan.yaml`, the only place a project specific lives, which every plan skill reads; `/ordo-init` writes and checks it. Stated in: `plan`, "What it reads" 1; `ordo-init`, Steps.
  - New: **plan configuration**: `.agents/plan.yaml`, which holds a repository's project specifics and which every plan skill reads. `/ordo-init` writes and checks it. Stated in: `plan`, "What it reads" 1; `ordo-init`, Steps.
- premise
  - Old: **premise**: a claim a step's text makes about the tree (a count, a path, a name, a line number), checked by `/spec` with a grep or a probe; a false one the plan can absorb is corrected in `plan.md`, and one it cannot is a stop. Stated in: `spec`, "What it reads" 5 and Steps 2.
  - New: **premise**: a claim a step's text makes about the tree (a count, a path, a name, a line number), checked by `/spec` with a grep or a probe. Stated in: `spec`, "What it reads" 5 and Steps 2.
- preparation commit
  - Old: **preparation commit**: the commit `/spec` makes of the brief, the brief check's report and its own records before the worktree exists; its hash is the base, and it is a resume point. Stated in: `spec`, Steps 6.
  - New: **preparation commit**: the commit `/spec` makes of the brief, the brief check's report and its own records before the worktree exists. Its hash is the base, and it is a resume point. Stated in: `spec`, Steps 6.
- recurring finding
  - Old: **recurring finding**: a cause of findings that `plan-orchestration`'s pass, every tenth landed step and at any pause, finds in three or more steps, booked as an open item with the smallest change that would end it. Stated in: `plan-orchestration`, "The recurring-findings pass".
  - New: **recurring finding**: a cause of findings that `plan-orchestration`'s pass finds across steps, booked as an open item with the smallest change that would end it. Stated in: `plan-orchestration`, "The recurring-findings pass".
- red line
  - Old: **red line**: a verification line that fails on main after the cherry-pick; one a fix inside the brief closes is a fix at landing, and any other takes the step back out of main. Stated in: `land`, Steps 6. A red check no fix within the plan covers is a stop. Stated in: `plan-orchestration`, "Stops".
  - New: **red line**: a verification line that fails on main after the cherry-pick. Stated in: `land`, Steps 6. A red check is the stop for a failing check that no fix within the plan covers. Stated in: `plan-orchestration`, "Stops".
- refusal
  - Old: **refusal**: a skill's end without a decision for the user: it names its cause and leaves nothing, or nothing beyond what a step taken back out of main has already done. Stated in: `spec`, "Stops"; `land`, "Stops"; `refute`, "Stops".
  - New: **refusal**: a skill's end without a decision for the user. It names its cause and leaves nothing, or nothing beyond what a step taken back out of main has already done. Stated in: `spec`, "Stops"; `land`, "Stops"; `refute`, "Stops".
- refuter report
  - Old: **refuter report**: the reviewer's report `agents/reviews/<step>-refuter.md`: the verification lines, the verdicts, the findings under the four headings, "Declined to judge" and the usage, with a section appended for each run over a repair round. Stated in: `refute`, Steps 6 and 7 and "Steps / Over a repair round".
  - New: **refuter report**: the reviewer's report `agents/reviews/<step>-refuter.md`, with the verification lines, the verdicts, the findings under the four headings, "Declined to judge" and the usage, and a section appended for each run over a repair round. Stated in: `refute`, Steps 6 and 7 and "Steps / Over a repair round".
- repair round
  - Old: **repair round**: the reviewer's findings sent back to the same builder as a numbered list with a ruling per finding, `round: n` written in the dispatch entry; the round cap allows at most `repair_rounds`, and one more only when the delta leaves a verification command red or an acceptance item unbuilt with a fix too large for landing. Stated in: `plan-orchestration`, Steps 8 and Rules; `refute`, "Steps / Over a repair round".
  - New: **repair round**: the reviewer's findings sent back to the same builder as a numbered list with a ruling per finding, `round: n` written in the dispatch entry. The number of rounds a step gets is the round cap. Stated in: `plan-orchestration`, Steps 8 and Rules; `refute`, "Steps / Over a repair round".
- resume point
  - Old: **resume point**: a commit another session resumes from: a stop, the preparation commit, the launch commit, a repair round sent, a step taken back out of main, the landing and a handover, each holding only the paths its session wrote since the last one. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
  - New: **resume point**: a commit another session resumes from: a stop, the preparation commit, the launch commit, a repair round sent, a step taken back out of main, the landing and a handover. Stated in: `plan-orchestration`, "Resuming, and handing the plan over".
- reviewer
  - Old: **reviewer**: the fresh session or agent that refutes a built step without changing anything, never the builder, on the model the configuration block's `reviewer:` names, which the brief-check agent also runs on. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models".
  - New: **reviewer**: the fresh session or agent that refutes a built step without changing anything, on the model the configuration block's `reviewer:` names, which the brief-check agent also runs on. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction.
- roadmap entry
  - Old: **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number that never changes; `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The format is the file's".
  - New: **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number. `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The format is the file's".
- rules file
  - Old: **rules file**: the page `.agents/plan.yaml`'s `rules:` names, which says how a change is made and reported; every brief points at it first. Stated in: `spec`, Steps 4; `plan`, Steps 4.
  - New: **rules file**: the page `.agents/plan.yaml`'s `rules:` names, which says how a change is made and reported. Every brief points at it first. Stated in: `spec`, Steps 4; `plan`, Steps 4.
- ruling
  - Old: **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session, a ruling that adds or splits a step also written in the Rulings section of `plan.md` as a line ending with "(the user)" and named by a step's `(ruling <name>)` tag. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8.
  - New: **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8.
- session, the
  - Old: **session, the**: the Claude Code session that runs a skill, the orchestrator under the loop or the user's session when a skill is run by hand; its own records are the ledger changes it made since the last resume point, such as a ruling booked or a report recorded, which its next resume-point commit carries. Stated in: `spec`, Steps 1; `plan-orchestration`, "Resuming, and handing the plan over".
  - New: **session, the**: the Claude Code session that runs a skill, the orchestrator under the loop or the user's session when a skill is run by hand. Its own records are the ledger changes it made since the last resume point, such as a ruling booked or a report recorded, which its next resume-point commit carries. Stated in: `spec`, Steps 1; `plan-orchestration`, "Resuming, and handing the plan over".
- shared path
  - Old: **shared path**: a file the briefs of two steps in flight both name, allowed only when the orchestrator judges the merge at landing simple and names it under `shared_paths:` in the later step's dispatch entry. Stated in: `spec`, Steps 5; `plan-orchestration`, "Two steps in flight".
  - New: **shared path**: a file the briefs of two steps in flight both name, which the later step's dispatch entry names under `shared_paths:`. Stated in: `spec`, Steps 5; `plan-orchestration`, "Two steps in flight".
- state file
  - Old: **state file**: the plan's `orchestrator-state.md`: the configuration block, the dispatch block, the open items, the closed items and the current position, rewritten before every step commit and read first after a compaction. Stated in: `plan`, Steps 4; `plan-orchestration`, "What it reads" and "Resuming, and handing the plan over".
  - New: **state file**: the plan's `orchestrator-state.md`, holding the configuration block, the dispatch block, the open items, the closed items and the current position. Stated in: `plan`, Steps 4; `plan-orchestration`, "What it reads" and "Resuming, and handing the plan over".
- step
  - Old: **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority; the orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The format is the file's".
  - New: **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The format is the file's".
- stop
  - Old: **stop**: a halt for a decision that is the user's, booked as an open item in the state file and under the step's Step 0 and committed as a resume point; under the loop it blocks only its own step. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop". Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item. Stated in: `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops".
  - New: **stop**: a halt for a decision that is the user's, which leaves an open item in the state file and under the step's Step 0. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop". Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item. Stated in: `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops". To stop an agent is also to end a running builder or reviewer through the runner's stop tool. Stated in: `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set".
- taken back out of main
  - Old: **taken back out of main**: what a red line no fix inside the brief closes does to a step at landing: its changes are removed from main, its dispatch entry reads `landing: backed-out`, its worktree and branches are kept, its failure goes into its Step 0, and `/spec` saves its work as a patch and prepares it again. Stated in: `land`, Steps 6; `spec`, "Steps / A step taken back out of main".
  - New: **taken back out of main**: what a red line no fix inside the brief closes does to a step at landing. Its changes are removed from main and its dispatch entry reads `landing: backed-out`. Stated in: `land`, Steps 6; `spec`, "Steps / A step taken back out of main".
- time box
  - Old: **time box**: the reviewer's limit, the configuration block's `review_minutes` when above 0 or one the invocation names, kept by reporting what was checked and naming what was not. Stated in: `refute`, Rules.
  - New: **time box**: the reviewer's limit, the configuration block's `review_minutes` or one the invocation names. Stated in: `refute`, Rules.
- user-visible choice
  - Old: **user-visible choice**: a choice the user owns: a public shape, a wire format, a config key or a vocabulary, and, under `libraries: check`, a library that could replace code the step would write by hand; a brief never takes one, and `/spec` stops on it. Stated in: `spec`, Steps 4 and "Stops".
  - New: **user-visible choice**: a choice the user owns, which is a public shape, a wire format, a config key or a vocabulary, and under `libraries: check` a library that could replace code the step would write by hand. Stated in: `spec`, Steps 4 and "Stops".
- verdict
  - Old: **verdict**: the reviewer's judgment of each item of the brief's "What to build" (holds, violated or not applicable) and of each case (met, partial, unmet or not verifiable), a verdict of violated, partial or unmet naming its finding. Stated in: `refute`, "The verdicts".
  - New: **verdict**: the reviewer's judgment of each item of the brief's "What to build" (holds, violated or not applicable) and of each case (met, partial, unmet or not verifiable). Stated in: `refute`, "The verdicts".
- verification page
  - Old: **verification page**: the page `.agents/plan.yaml`'s `verification:` names, which defines the green check with the commands every step runs; `/plan` copies them into the verify list. Stated in: `plan`, "What it reads" 3 and Steps 4; `ordo-init`, Steps 3.
  - New: **verification page**: the page `.agents/plan.yaml`'s `verification:` names, which defines the green check with the commands every step runs. `/plan` copies them into the verify list. Stated in: `plan`, "What it reads" 3 and Steps 4; `ordo-init`, Steps 3.
- verify list
  - Old: **verify list**: the `verify:` key of the configuration block, run in order through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main; the lines it prints are what a report or a booking quotes. Stated in: `land`, "The landing script"; `plan`, Steps 4.
  - New: **verify list**: the `verify:` key of the configuration block, the commands the `land` skill's `templates/checks.sh <state file>` runs. Stated in: `land`, "The landing script"; `plan`, Steps 4.
- wip
  - Old: **wip**: the commit `/land` makes in the step's worktree of everything the builder left, the ledger root left out, when something is staged. Stated in: `land`, Steps 3.
  - New: **wip**: the commit `/land` makes in the step's worktree of everything the builder left, the ledger root left out. Stated in: `land`, Steps 3.
- worktree
  - Old: **worktree**: a step's git worktree at `<worktree_root>/<step>`, on a branch named after its folder, created from the base; the builder's only place to work, removed by `/land` after the landing and kept after a step is taken back out of main. Stated in: `spec`, Steps 7; `land`, "Removing a step's worktree".
  - New: **worktree**: a step's git worktree at `<worktree_root>/<step>`, on a branch named after its folder, created from the base. It is the builder's only place to work. Stated in: `spec`, Steps 7; `land`, "Removing a step's worktree".

60 of the 90 entries changed; the other 30 are unchanged.

### Point 6: `skills/plan-orchestration/SKILL.md`

- Old line 262: "- A reviewer or a fix round is dispatched only while its usual length fits before the cut-off."
- New line 262: "- A reviewer or a repair round is dispatched only while its usual length fits before the cut-off."
- Version, line 5: "2.10.0" became "2.10.1". `docs/academic-coverage.md` is not changed.

### Point 7: "plan skills"

The entry plan skills is unchanged.

- `skills/repo-setup/templates/docs/glossary.md` line 3, old: "The plan skills' terms stand in the block below, which ..."
- New: "The terms the plan skills, `roadmap`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only." The rest of the paragraph is unchanged.
- `skills/repo-setup/templates/CLAUDE.md` line 20, old: "- `docs/glossary.md`: the terms of this repository and of the plan skills, each in the sense the repository uses it."
- New: "- `docs/glossary.md`: the terms this repository and the skills it is set up with use in a sense of their own, each defined once."

### Point 8: `skills/repo-setup/SKILL.md`, "Steps / sync" item 7

- Old line 86: "7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing."
- New line 86: "7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names. A no-single-block line of the same run is still drafted, as step 4 says."
- Its two sub-bullets (lines 87 and 88) are unchanged. Step 4 of the section is line 78. Version, line 5: "1.2.0" became "1.2.1". The description is unchanged; the length command below prints 702 for it, as before the round.

### Checks

Commands and their output, verbatim:

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
exit 0
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
702 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md
$ { git diff --name-only; git ls-files --others --exclude-standard; } | tr '\n' '\0' | xargs -0 env LC_ALL=C grep -n '[^ -~]'
exit 1 (1: no line matched)
$ grep -o '^- \*\*[^*]*\*\*' skills/repo-setup/templates/plan-terms.md | sed 's/^- \*\*//;s/\*\*$//' | tr -d '`' | LC_ALL=C sort -f -c && echo sorted
sorted
$ python3 -c 'import re; t=open("skills/repo-setup/templates/plan-terms.md").read(); d=re.sub(r"Stated in: .*?\.(?= |$)","",t,flags=re.M); print("semicolons outside Stated in:", d.count(";"), "semicolons in all:", t.count(";"))'
semicolons outside Stated in: 0 semicolons in all: 61
$ wc -w skills/repo-setup/templates/plan-terms.md
    3858 skills/repo-setup/templates/plan-terms.md
$ grep -n -e 'at least' -e 'every tenth' -e 'three or more' -e 'only when' skills/repo-setup/templates/plan-terms.md
exit 1 (1: no line matched)
```

### Line counts after the round

`wc -l`: `skills/repo-setup/templates/plan-terms.md` 92, `docs/glossary.md` 108, `skills/repo-setup/templates/docs/glossary.md` 13, `skills/repo-setup/templates/CLAUDE.md` 33, `skills/repo-setup/SKILL.md` 159, `skills/plan-orchestration/SKILL.md` 318. The other files of the step are unchanged in this round. `git diff --numstat` (added, removed) for the tracked files this round touched: `skills/plan-orchestration/SKILL.md` 2 2, `skills/repo-setup/SKILL.md` 22 17, `skills/repo-setup/templates/CLAUDE.md` 1 0. `wc -w skills/repo-setup/templates/plan-terms.md`: 3858 words, against 4343 before the round.
