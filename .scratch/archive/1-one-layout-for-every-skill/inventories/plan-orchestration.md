# Rule inventory: plan-orchestration

- Old: `skills/plan-orchestration/SKILL.md` at `836f5c5`
- New: `skills/plan-orchestration/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, plan-orchestration, invoked as /plan-orchestration | Quick start |
| 3 | The loop: pick the next unblocked step, spec, dispatch one builder, refute, send findings back for the rounds plan.yaml allows, read the delta, land with small fixes, book, repeat | Steps |
| 3 | Stop only where a decision is the user's | Stops |
| 3 | Every project specific comes from .agents/plan.yaml and the ledger | What it reads 1 |
| 3 | The same skill runs a code tool, a research project or a manuscript on either harness, with either as the worker | The two tiers, and the harnesses 9 |
| 3 | One orchestrator can hand the plan to another mid-way | Resuming, and handing the plan over |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 2.6.1, now 2.7.0; it lives in metadata.version only, and Quick start is where the skill's identity is placed (ruling in plan.md) | Quick start |
| 10 | The unattended loop over a plan that /plan opened | Steps |
| 10 | Each step runs through the skills a person runs by hand, /plan-help printing the sequence | Steps |
| 10 | What running unattended adds: picking, dispatching and resuming, sending findings back, the review cadence, two in flight, stops, reports, usage | Steps |
| 10 | It carries no project name and no vendor name; those are in .agents/plan.yaml and the ledger; the vendor part replaced by the models ruling of plan 2.B: the models it names are those in The two tiers, and the harnesses | Rules 1 |
| 14 | Two tiers of model take part, neither tied to one vendor; the tiers are now the orchestrator and the agents it starts, by the models ruling of plan 2.B | The two tiers, and the harnesses 1 |
| 14 | The orchestrator runs on a top-tier model (Claude Fable or GPT Astra): reads, decides, invokes, lands, books; by the models ruling of plan 2.B it runs on Claude Opus by default (item 2), with Fable, Astra or Sol as options | The two tiers, and the harnesses 3 |
| 14 | The orchestrator never writes step code beyond a fix at landing, unless executor is inline | The two tiers, and the harnesses 3 |
| 14 | The builder runs on the working tier (Claude Opus or GPT Sol), one per step, in the worktree, under the brief and the rules file; its models, Opus by default or Sol and never Fable or Astra, are at items 2 and 4 by the models ruling of plan 2.B | The two tiers, and the harnesses 5 |
| 14 | The reviewer is whatever reviewer: names | The two tiers, and the harnesses 6 |
| 14 | Any combination, chosen per step; a new one booked in the rulings with what decides it and measured by its usage row; any allowed combination, by the models ruling of plan 2.B | The two tiers, and the harnesses 8 |
| 18 | The ledger is the whole handoff; another orchestrator on the other harness continues from the files alone, under three rules | Resuming, and handing the plan over |
| 20 | Nothing needed to continue lives only in a runner's memory, transcript, scratch folder or temp file; everything is in the ledger, committed | Resuming, and handing the plan over 1 |
| 21 | The state file is rewritten before every step commit | Resuming, and handing the plan over 2 |
| 22 | A dispatch in flight is recorded before the builder starts | Resuming, and handing the plan over 3 |
| 24 | Reading order: the state file, plan.md, the transcript's tail | What it reads 2 |
| 24 | On resumption the builder is checked first by the check its harness allows | Resuming, and handing the plan over 4 |
| 24 | A running builder is waited for | Resuming, and handing the plan over 5 |
| 24 | A finished builder resumes at the read of its report | Resuming, and handing the plan over 6 |
| 24 | A step at landing: cherry-picking is checked on main before anything is applied again | Resuming, and handing the plan over 7 |
| 24 | A dead builder is reported with its transcript | Resuming, and handing the plan over 8 |
| 24 | A continuation builder takes over the worktree when the user says so | Resuming, and handing the plan over 9 |
| 24 | Never a silent relaunch | Anti-patterns 1 |
| 24 | An uncommitted booking with the step's files staged is an interrupted landing, finished first | Resuming, and handing the plan over 10 |
| 28 | Read the state file, plan.md, the transcript's tail; resolve a dispatch block first | Steps 1 |
| 29 | Pick the next unblocked step, one at a time unless workers_at_once allows more | Steps 2 |
| 30 | Invoke /spec; it checks premises, writes the brief, the worktree and the dispatch block | Steps 3 |
| 30 | A stop it raises goes to the user; the loop moves on or pauses; corrected in plan 2.B: a stop at any step blocks only its own step, and the loop moves on | Steps 3 |
| 31 | The executor choice: academic-paper for manuscript content always, else the invocation, else the default | Steps 4 |
| 31 | agent: dispatch one builder by the launch recipe, write its identity into the block and commit | Steps 4 |
| 31 | The prompt states the worktree, the no-git rule, what is never touched, the reading order, every requirement, the report path and shape; corrected in plan 2.B: the ledger is never touched beyond the builder's report | Steps 4 |
| 31 | The builder never runs git and never writes into the ledger; corrected in plan 2.B: in the ledger it writes only its report, in the worktree's copy | Steps 4 |
| 31 | inline: the session builds the step itself; steps 5 and 8 read the builder as itself | Steps 4 |
| 31 | academic-paper: built through that skill with the brief as input | Steps 4 |
| 32 | While it runs, ledger work only | Steps 5 |
| 32 | Never dispatch beyond workers_at_once | Steps 5 |
| 32 | Never dispatch during a pause | Steps 5 |
| 33 | Save the report where the builder could not; corrected in plan 2.B: the orchestrator saves every report into the main ledger | Steps 6 |
| 33 | A Claude agent's final message is in the transcript store under its id | Steps 6 |
| 33 | Read the whole diff | Steps 6 |
| 33 | The report is a lead, not a fact | Steps 6 |
| 34 | Invoke /refute when review: calls for it | Steps 7 |
| 34 | Read the diff yourself while it runs | Steps 7 |
| 34 | Save its report and record its usage; plan 2.B: its path and usage go into the dispatch block under reviewer_report | Steps 7 |
| 35 | Send findings back to the same builder, per harness, as a numbered list with rulings inside the brief | Steps 8 |
| 35 | Write round: n and the round's paths into the block and commit before the resume; plan 2.B: the launch's output file is repair_output, no longer repair_report | Steps 8 |
| 35 | A finding that changes the scope, a requirement, a public shape or a decision is a stop, not sent back | Anti-patterns 2 |
| 35 | repair_rounds caps the rounds | Rules 3 |
| 35 | After each reply read the delta; refute again over the round when refute_after_repair is yes | Steps 8 |
| 35 | Nothing found, or the cap, ends the rounds and goes to landing | Steps 8 |
| 35 | Small things are fixed at landing, the last run's findings included | Rules 4 |
| 35 | The rest is booked as its own step, never sent back | Rules 5 |
| 35 | The one exception: one round beyond the cap for a red verification command or an unbuilt acceptance item too large for landing | Rules 3 |
| 35 | A new finding never earns that round; plan 2.B adds that the user's yes never extends the cap | Rules 3 |
| 36 | Invoke /land; its refusals are its own | Steps 9 |
| 36 | A red line not fixable at landing takes the step out and is booked, in the open items or the booked list | Steps 9 |
| 37 | Continue with step 2; the landing report is on disk, so the loop never ends its turn for a report | Steps 10 |
| 37 | The loop ends at a stop, a pause or nothing unblocked; corrected in plan 2.B to a pause or nothing unblocked, a stop blocking only its own step (Steps 3) | Steps 10 |
| 37 | The final message lists every landed step, the open items and the booked count; plan 2.B: it opens as Reports says, which carries the position line and the open items | Steps 10 |
| 41 | Under earned, the reviewer is decided from the rows and the diff, never the builder's name | The review, earned 1 |
| 41 | The reviewer runs on a builder's first step, and when one of its last three rows did not pass the bar with at most one fix at landing | The review, earned 2 |
| 41 | It always runs when the brief touches a public surface, a server module, a state layer or a wire shape | The review, earned 3 |
| 41 | A failed bar puts the reviewer back for the next three steps | The review, earned 4 |
| 41 | The runs over the rounds follow refute_after_repair, and under earned only after a first review | The review, earned 5 |
| 41 | The rows record which branch each step took | The review, earned 6 |
| 45 | Every tenth landed step and at any pause, group the refuter findings since the last pass by cause | The recurring-findings pass 1 |
| 45 | A cause in three or more steps is booked in the open items with the smallest change that ends it | The recurring-findings pass 2 |
| 45 | A rule already written that keeps being broken is not rewritten; what is proposed is a check; plan 2.B: a sharper sentence is proposed only when no command can check the rule | The recurring-findings pass 3 |
| 45 | Not rewritten, the same rule; plan 2.B: the anti-pattern is rewriting it when a command can check it | Anti-patterns 6 |
| 45 | The user rules on each proposal | The recurring-findings pass 4 |
| 45 | Nothing in the rules file changes without that ruling | Anti-patterns 7 |
| 49 | With workers_at_once above 1, the orchestrator, still one, runs that many steps through steps 3 to 9 | Two steps in flight |
| 49 | Each brief lists its paths and the lists share no file | Two steps in flight 1 |
| 49 | A step touching shared, configuration or rule files runs alone | Two steps in flight 2 |
| 49 | Each step has its own worktree, base, builder, reviewer, rounds and dispatch entry | Two steps in flight 3 |
| 49 | A later step is dispatched only after the earlier one's dispatch commit | Two steps in flight 4 |
| 49 | Landings one at a time, in verification order, the later diff read again on the new head | Two steps in flight 5 |
| 49 | A path both ranges changed sends the later step back through step 6 | Two steps in flight 6 |
| 53 | Both harnesses take the same prompt; the launch, sandbox and report return differ; either orchestrator launches either builder | Launching a builder |
| 55 | Claude Code builder from inside Claude Code: the Agent tool, general-purpose, in the background, under the runner's permissions | Launching a builder 1 |
| 57 | Claude Code builder from any shell: print mode, detached | Launching a builder 2 |
| 60-62 | The claude -p launch command; plan 2.B: --report takes the output file and --label is <entry>/<step> | Launching a builder 2 |
| 65 | Codex builder: codex exec from a shell, detached from the command timeout | Launching a builder 3 |
| 68-71 | The codex exec launch command; plan 2.B: --report takes the output file and --label is <entry>/<step> | Launching a builder 3 |
| 74 | -C is the working root and -s workspace-write confines writes | Launching a builder 8 |
| 74 | The network setting is passed when the verification commands bind a port | Launching a builder 10 |
| 74 | -o writes the final message; --json streams the event log with the usage | Launching a builder 11 |
| 74 | Not --ephemeral, so the rollout is the builder's transcript | Launching a builder 12 |
| 74 | The shell tool caps a command at ten minutes, so the launch is detached and a monitor watches the exit file | Launching a builder 13 |
| 74 | Codex settings in the repository's .codex/; the orchestrator never edits a user-level file | Launching a builder 15 |
| 78 | A step is a large thing: a new capability, or a defect too nasty or too wide to close where found | What earns a step of its own 1 |
| 78 | Everything else is closed in the open step, the repair round or the landing; plan 2.B: the repair rounds | What earns a step of its own 2 |
| 78 | A step's path list is a choice: widen it rather than mint a step | What earns a step of its own 3 |
| 78 | Work is never given a step because it is inconvenient now | Anti-patterns 4 |
| 78 | A report that asks for a step says what makes it new, nasty or blocked | What earns a step of its own 4 |
| 82 | A stop is for a decision that is the user's: an unnamed shape, a wrong premise, a red check, a rule clash; plan 2.B adds a finding that is the user's and the roadmap diff | Stops |
| 82 | Fixing a defect in what was asked is never a stop, whatever it makes visible | Stops 7 |
| 82 | A miss inside a brief is closed in the round or at landing, or booked, never handed back as a gap; plan 2.B: in the repair rounds | Anti-patterns 3 |
| 82 | A fix of a defect in delivered work needs no yes | Rules 2 |
| 82 | A stop is booked in the open items at once | Stops 8 |
| 82 | A stop is repeated in every report until ruled | Stops 9 |
| 82 | The turn ends only when nothing unblocked is left or at a pause | Steps 10 |
| 82 | A pause holds until the user lifts it | Stops 11 |
| 82 | A stop goes in one message with options inside the rules and one recommendation; plan 2.B: plain text in the report as an open item, with the pros and cons of each option, never through a question-box tool | Stops 10 |
| 82 | An option that breaks a written rule is not mentioned | Anti-patterns 5 |
| 86 | Every report opens with the open items; plan 2.B: they follow the position line of the orchestrator's reports and the landing report | Reports 3 |
| 86 | The open items hold only stops and recurring-findings proposals | Reports 4 |
| 86 | A finding that needs no ruling is a step in the booked list; a report names its count and steps | Reports 5 |
| 86 | The closed list is a log that no report carries | Reports 6 |
| 86 | NOT DONE first, then the DONE / NOT DONE ledger naming the command per row | Reports 7 |
| 86 | No narration of wrong turns taken and backed out | Anti-patterns 8 |
| 86 | No measurement stated that was not taken | Anti-patterns 9 |
| 86 | Partial work is never presented as complete | Anti-patterns 10 |
| 90 | One usage row per step with the builder's, reviewer's and rounds' figures, the fixes and the orchestrator's row | Usage 1 |
| 90 | Tokens and lines say the cost; the last four the worth; a change is judged on both | Usage 2 |
| 92 | The orchestrator's row: messages and tokens and minutes from the previous landing commit to the booking | Usage 3 |
| 92 | Produced by the land skill's usage.py with from and to as stated | Usage 4 |
| 92 | Under Claude Code the newest projects jsonl, one message counted once by its id | Usage 5 |
| 92 | Under Codex the newest rollout, the difference of the cumulative usage | Usage 6 |
| 92 | Work on other steps in the window is not separated; the row says what it shares | Usage 7 |
| 96 | With a deadline, the loop keeps a night rule in the state file | The pace when a deadline is set |
| 96 | A builder only while the longest step fits; a reviewer or round only while its usual length fits | The pace when a deadline is set 1 |
| 96 | At the cut-off, stop what runs, keep the worktree, rewrite the state file, pause | The pace when a deadline is set 2 |
| 96 | A one-shot wake-up does the stopping when the runner offers one | The pace when a deadline is set 3 |
