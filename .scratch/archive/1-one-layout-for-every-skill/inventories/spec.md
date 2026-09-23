# Rule inventory: spec

- Old: `skills/spec/SKILL.md` at `a682c14`
- New: `skills/spec/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /spec | Quick start |
| 3 | Prepare one step: check every premise against the tree | Steps 2 |
| 3 | Write the brief: the checked premises, the fix text, the verification list, the report shape, the pointer to the change standard | Steps 3 |
| 3 | Create the step's worktree at main's head | Steps 5 |
| 3 | Stage the base binaries | Steps 6 |
| 3 | Record the dispatch in the state file | Steps 7 |
| 3 | The trigger phrases, the ruling typed in reply to a stop among them | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.3.0, now 1.4.0 in metadata.version | Quick start |
| 10 | /spec writes the one file a builder works from and puts the tree in the state the builder expects | Quick start |
| 10 | It refuses rather than guesses: a false premise is a stop, booked in the open items | Stops 1 |
| 10 | The brief is not written until the plan's text is corrected | Steps 2 |
| 14 | .agents/plan.yaml, its required keys and defaults as /plan states them | What it reads 1 |
| 14 | A required key missing is a refusal that names it | Stops 5 |
| 14 | <entry> resolves to the ledger folder whose plan.md opens with # Plan: <entry> | What it reads 2 |
| 14 | /plan names a new folder by the slug; an older plan keeps its folder | What it reads 2 |
| 14 | No such folder is a refusal that names /plan | Stops 6 |
| 15 | orchestrator-state.md: the configuration block, the open items, the dispatch block | What it reads 3 |
| 15 | A step already in flight is a refusal naming it, unless the configuration allows more than one | Stops 7 |
| 16 | plan.md: the step's line, its rulings, everything the plan carries to it | What it reads 4 |
| 16 | A step not in the list is a refusal that prints the list | Stops 8 |
| 17 | The tree on main at its head, for every count, path, name, line and claim | What it reads 5 |
| 17 | Each checked with a grep or a probe, never taken from the plan's text | What it reads 5 |
| 21 | The brief from templates/brief.md: the premises as checked, with the command for each | Steps 3 |
| 21 | The fix text in the brief's own words, not a pointer | Steps 3 |
| 21 | The verification commands plus the step's gate, each with its directory and its pass output | Steps 3 |
| 21 | The report shape | Steps 3 |
| 21 | The first line points at the rules file and the standards | Steps 3 |
| 21 | A choice the plan leaves open is taken in the brief, listed under Decisions taken in this brief, reversible | Steps 3 |
| 21 | A user-visible choice is not taken: it is a stop | Stops 3 |
| 22 | The preparation commit: the brief and any plan.md amendment, by path | Steps 4 |
| 22 | Its hash is the base | Steps 4 |
| 23 | The worktree from the base with git worktree add | Steps 5 |
| 23 | Sparse checkout from inside it when the block names paths | Steps 5 |
| 23 | The dependency install the project needs | Steps 5 |
| 23 | Every git command on a worktree runs from inside it, never as git -C | Rules 1 |
| 24 | The base binaries for the A/B, copied aside from the current build | Steps 6 |
| 24 | bench: names them; none named, none staged | Steps 6 |
| 25 | The dispatch block's fields | Steps 7 |
| 25 | The executor is the default until the orchestrator chooses | Steps 7 |
| 25 | Committed by path as a second small commit | Steps 7 |
| 25 | The worker's identity goes in the moment it is known | Steps 7 |
| 29 | Preflight: on main, nothing staged, no git operation in progress | Steps 1 |
| 29 | An unrelated change of the user's is listed by path and left alone | Steps 1 |
| 29 | A failed preflight stops the skill with what it saw | Stops 4 |
| 33 | A stop leaves three things and nothing else: the open item, the same text under Step 0, the ledger committed | Steps / A stop 1 |
| 33 | No brief, no worktree, no dispatch block exists for the step | Steps / A stop 2 |
| 35 | The user closes it by typing the ruling as plain text in any session | Steps / A ruling 1 |
| 38 | The ruling's form | Steps / A ruling 1 |
| 41 | The session books the ruling and nothing else | Steps / A ruling 2 |
| 41 | The open item closed with the ruling's text and date | Steps / A ruling 2 |
| 41 | The step's text in plan.md rewritten to what was ruled | Steps / A ruling 2 |
| 41 | A step the ruling splits gets its own line and Step 0, its premises with it | Steps / A ruling 2 |
| 41 | A ruling that sets a shape, a vocabulary or a rule is written in the plan's rulings | Steps / A ruling 2 |
| 41 | The ledger files committed by path | Steps / A ruling 2 |
| 44 | Then /spec again | Steps / A ruling 3 |
| 47 | It rechecks every premise, the ruled text included, and writes the brief | Steps / A ruling 3 |
| 51 | A premise found wrong is corrected in the plan before the brief exists, never left for the builder | Steps 2 |
| 51 | A correction that changes the step's scope is a stop, booked in the open items | Stops 2 |
| 52 | The brief carries every requirement in its own words: the acceptance list, the tests, the conventions, the checks | Anti-patterns 1 |
| 52 | A builder told only where to look will not meet what it did not read | Anti-patterns 1 |
| 53 | The brief names no harness and no vendor | Anti-patterns 2 |
| 53 | What differs per harness is in plan-orchestration's launch recipes | Anti-patterns 2 |
| 54 | No history in the brief: what to build and why | Anti-patterns 3 |
