# Repair round 1 of step 3: the findings of `agents/reviews/3-refuter.md`

Each finding below is inside the step's part, and each has its ruling. The round widens the step's paths to two more files: `skills/plan/templates/plan.md` and `skills/refute/SKILL.md`. The rest of the round writes the paths of the brief. The checks of the brief's "Verify before you report" run again after the fixes, with the character-set check in the brief's own form (with `-CSD` and the `\x{2705}` exemption) over every changed file and the report, `skills/plan/templates/plan.md` and `skills/refute/SKILL.md` included. The report quotes that check's output verbatim, with its real file list. A rule is written once: where another place needs it, that place names the section that holds it (`docs/dev/skill-layout.md`, "Where a rule goes").

1. Spec 1, a brief check that ends while its `/spec` waits.
   - `spec` "Steps / The brief check" 3 and `plan-orchestration` "Resuming, and handing the plan over" say what happens when the agent ends: the session saves its final message at `agents/reviews/<step>-brief-check.md`, and the waiting `/spec` goes on.
   - A brief-check agent is dead only when the runner no longer lists it and no completion notice with its final message arrived, as "Resuming" says for a builder.
   - A finished agent whose report was not yet saved is saved from its completion notice, and is never booked as dead.
   - "Steps / A `/spec` taken over" 1 says the same.
2. Standards 1, a wait at the second path comparison.
   - A brief-check report that a wait at Steps 5 leaves on disk is one of the session's own records (the list in Steps 1). The next resume point of its plan carries it.
   - The `/spec` run again of that step is not refused on it: the Steps 1 bullet on the report path names it beside the report of a `/spec` taken over.
3. Standards 2, the back-out commit.
   - `land` Steps 6, the bullet "The commit also holds the other ledger records of this plan that the session wrote since the last one", names the exception by pointing at `spec` "Steps / The brief check" 1.
   - So does `spec` "Steps / A stop" 1, on the ledger files the stop commits.
4. Standards 3, a `preparing` entry with a base and a worktree.
   - A `preparing` entry holds a `base` once the preparation commit is made, and a worktree once Steps 7 has run.
   - `ordo-help` Steps 3 prints such a step as in `/spec`, with its base and its worktree once they are written.
   - `land` "What it reads" 3 and its Stops row refuse any entry at `landing: preparing`, whatever it names.
   - `diagnose` "What it reads" 3 refuses, for a reviewer's finding or a red line, any entry at `landing: preparing`, the same as its Stops row "No dispatch entry". The words "and names no worktree or base yet" go from all three places.
5. Standards 4, "The review of a choice" for a step at `preparing`.
   - `references/self-rule.md` says that a step of `Builds on it:` at `landing: preparing` has its `/spec` ended before its text is rewritten.
   - A running brief-check agent is stopped through the runner's stop tool, and its Agents bullet is written as for a stopped agent.
   - The step's uncommitted brief is restored to main's copy, or deleted when main has none.
   - After a preparation commit, the step's worktree and branches are removed as the `land` skill's "Removing a step's worktree" says.
   - Its dispatch entry is removed. The committed brief, if any, is left for the new `/spec` to write over.
   - Then its text is rewritten to the new ruling, and `/spec` runs again from Steps 1 as for a step not yet prepared.
6. Standards 5, the YAML form.
   - The value is written quoted, as `brief_check: "running: <agent id>"`, in every place that gives the form:
     - `spec` "What it reads", Steps 1, "Steps / A `/spec` taken over", "Steps / The brief check" 1 and 5, and the Stops row "A brief check still running";
     - `plan-orchestration` "Resuming";
     - `skills/plan/templates/orchestrator-state.md`;
     - `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md` by `sync_rules.py . --write --only glossary`.
   - Where a sentence says the key "reads" it, it reads `running: <agent id>` inside the quotes.
   - Check: `python3 -I -c 'import yaml; yaml.safe_load("dispatch:\n- step: 2\n  landing: preparing\n  brief_check: \"running: a6ce8870a2a7c0b32\"\n")'` exits 0, and the report quotes it.
7. Standards 6, the template's list of who writes Agents bullets.
   - `skills/plan/templates/plan.md`, the sentence under "## Agents" that lists who writes the bullets, also names `/spec` writing the bullet of a dead brief-check agent when it takes a run over.
   - It also names `/spec`, or the orchestrator under "The review of a choice", writing the bullet of a brief-check agent it stopped.
8. Standards 7, the glossary's next parts.
   - The entry **position line** in `skills/repo-setup/templates/plan-terms.md` gives the four next parts in the words of `plan-orchestration` "Reports": "the roadmap diff of `/roadmap done <n>`, for the user's approval" and "the tag and the pin, for the user's approval, where the plan's rulings set them".
   - It is synced into `docs/glossary.md`.
9. Standards 8, the Stops row "A brief check still running".
   - Its column "What resumes it" reads that the waiting `/spec` goes on when the agent ends, and that only a run interrupted after that is taken over by `/spec` again.
10. Standards 9, one rule in three places.
    - The rule that only a waiting `/spec`'s preparation commit carries its brief and brief-check report stands in `spec` "Steps / The brief check" 1 alone.
    - `spec` Steps 1 and the Rules bullet name that section instead of restating the rule.
    - The bullets in `plan-orchestration` and `land` already point at it, and keep only the pointer and the words a reader needs to see that the exception exists.
11. Behaviour 1. The report's section "Host and user visible changes, before and after" gains three changes, each with its before and after:
    - the preparation commit now carries the state file with the step's `preparing` entry;
    - `/land` refuses a step at `landing: preparing`;
    - a wait at Steps 5 after the brief check leaves the brief-check report on disk.
12. `skills/refute/SKILL.md`, "dispatch block" where the glossary cites it for **dispatch entry**.
    - In `refute` Steps 1, Steps 7 and "Steps / Over a repair round" 6, "the dispatch block's `reviewer_report`" and "the dispatch block's ... field" become "the step's dispatch entry's `reviewer_report`", so the glossary's citations hold.
    - "What it reads" 3 and "Over a repair round" 2, which name the block, stay.
    - `refute`'s version: the change is wording only, a patch. The report gives `refute`'s version line as it stands, and the orchestrator checks at landing whether step 1 already raised its patch part.
13. The report's own points.
    - The character-set check is quoted in the brief's form and with its real file list, as above.
    - The glossary's line count is given as 151 before, from the base.
    - The report states, under "Anything in the brief wrong or impossible", the one read-only `git status` run against the no-git rule, as disclosed.

The report is the same file, `.scratch/2-i-several-plans-in-one-session/agents/reviews/3-report.md` in the worktree. It is brought up to date for the round, with a section "Repair round 1" that gives each ruling's number and what changed.
