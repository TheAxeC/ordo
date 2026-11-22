# Report: step 1, the Fable ban removed, and agents that follow the session

NOT DONE: nothing. Every item of the brief's "What to build" (1 to 7) is done. Three sentences outside the sections the brief names were left as they are and are listed under "Judgment calls" for the orchestrator's ruling.

Open items of the state file, verbatim (`sed -n '/^## Open items/,/^## /p' orchestrator-state.md`):

- none

## The cases, first run on the unchanged tree (base 650332d)

- C1, `git grep -n -i 'fable' -- ':!.scratch'`: 11 lines. Three keep an agent off Fable: `skills/plan-orchestration/SKILL.md:213` ("runs on a Claude model, and never on Claude Fable"), `skills/plan/templates/orchestrator-state.md:13` ("a builder never runs on Fable.") and `:14` ("a reviewer never runs on Fable."). `skills/plan-orchestration/SKILL.md:210` ("It may also run on Claude Fable.") rests on them. The other lines are the values of `.agents/plan.yaml:9` and `:11`, `docs/roadmap.md:23`, `:26` and `:27`, `skills/paper/references/disclosure_mode_protocol.md:111` and `skills/plan-orchestration/templates/prices.txt:3`. The case fails.
- C2, `grep -n -i -E 'opus|ordo-' skills/writing/SKILL.md`: lines 42, 60, 61, 62, 65, 66, 73, 77, 78, 80, 82, 86, 91, 92 and 296. The case fails.
- C3, `grep -n -F 'plan.yaml' skills/code-comments/SKILL.md`: lines 17, 31, 58 and 339. `grep -n -i -E 'reviewer|ordo-|<project>|Unknown project|other than the configured' skills/code-comments/SKILL.md`: lines 17, 31, 32, 33, 59, 73, 81, 84, 115, 117, 338, 339, 340 and 345. The case fails.
- C4, `git grep -n -i -E 'configured effort (that )?cannot apply' -- skills README.md agents docs/glossary.md docs/dev`: `code-comments` 74 and 345, `ordo-help` 127 and 129, `plan-orchestration` 55 and 452, `refute` 54 and 196, `spec` 94 and 483. Each states the refusal for a missing `ordo-<level>` agent as well as for the variable. The case fails.
- C5, by reading: `spec` (Steps 1, line 94), `refute` (Steps 1, line 54), `plan-orchestration` (Steps 1, line 55) and `diagnose` (Rules, lines 387 to 391) refuse or check for a missing agent, and `grill` (line 219) makes the lookups by the session's own reads. No warning is stated. The case fails.
- C6, `grep -n -i -E 'sonnet|opus|half as much|2\.E' docs/adr/0007-*.md`: lines 7 (the prices of Sonnet and Opus), 11 ("Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`.") and 20 ("half as much per token", "Sonnet", "2.E.A", "2.E"). The case fails.
- C7, `git diff --stat -- skills/paper` and `git diff -- .agents/plan.yaml`: both print nothing, the tree being unchanged.
- C8, `grep -n -i -E 'effort|model|medium' skills/writing/SKILL.md`: lines 42, 61 to 67, 73, 76 to 80, 82, 83, 86, 91 and 296, which set `ordo-medium`, the effort `medium` and the opus model and stop on a served model. The case fails.
- C9, `git grep -n -i -E 'code-comments|writing' -- agents skills/plan/templates README.md docs/glossary.md docs/figures/gen_figures.py`: the lines that say either skill starts an effort agent, runs on a configured model or stops on a served model are lines 3 and 6 of each `agents/ordo-*.md`, `skills/plan/templates/orchestrator-state.md:14` and `:26`, `skills/plan/templates/plan.yaml:12` and `:27`, `README.md:72`, `:74` and `:119`, and `docs/glossary.md:44` and `:104`. `gen_figures.py` held the two stop boxes at lines 1872 and 1893, which the pattern does not match since the labels name neither skill. The case fails.
- C10, by reading: ADR 0014's decision says nothing on the configuration or the agents' start; ADR 0030's decision has every agent of `writing` run "as `ordo-medium` on opus"; ADR 0035's decision has `writing` on the default agent only when `ordo-medium` is missing, with a stop on another model family. The case fails.

No case showed a rule of the brief giving a wrong result, so nothing was handed back.

## DONE / NOT DONE

| Item | State | What changed and where | Proof |
|---|---|---|---|
| 1. The Fable ban | DONE | `skills/plan-orchestration/SKILL.md`, "The two tiers, and the models": the bullets "Default" and "It may also run on Claude Fable" and the sentence "and never on Claude Fable" are gone. The section now reads: the orchestrator runs on the model of its own session; a builder, a reviewer, a brief-check agent and a diagnosis agent each run on the Claude model the configuration block names for them; the `plan` skill's `templates/plan.yaml` names Claude Opus for each key; "Any combination of these models is chosen per step." `skills/plan/templates/orchestrator-state.md` lines 13 and 14: the comments read "the model a builder runs on: claude:opus by default." and "... run on: claude:opus by default." | C1 after: no line keeps an agent off Fable |
| 2. `writing` follows the session | DONE | `skills/writing/SKILL.md`: "What it reads" 5, Steps 4 (the read of the agent and the opus identifier) and Steps 7 (the served-model check) are gone, and Steps 5 to 10 are numbered 4 to 8. Steps 5 reads "Each starts on the runner's general-purpose agent with the runner's defaults, and its prompt sets no model and no effort." The two sub-bullets of the line after the report and the Stops row "A model other than the configured one" are gone; the Stops introduction reads "Every row is a refusal, which names its cause and leaves nothing." `README.md:72` and `:119`, `docs/figures/gen_figures.py` (`writing()`), `docs/figures/writing.svg`, `agents/ordo-medium.md` lines 3 and 6 | C2 after: nothing. C8 after: line 65 only |
| 3. `code-comments` follows the session and reads no `plan.yaml` | DONE | `skills/code-comments/SKILL.md`: the Quick start line of `<project>`, "What it reads" 1, Steps 4 (the effort check), the served-model checks of Steps 6 and 7 and of "The rewrite" 5, and the Stops rows "A model other than the configured one", "No plan configuration", "Unknown project" and "The configured effort cannot apply" are gone. The prose standard is found at two places, `docs/dev/prose-standard.md` of the repository the session is in, then the `repo-setup` skill's template. "Not a range" no longer says "Outside the `projects:` form". Steps and "What it reads" are renumbered, and each reference to a number is carried. The frontmatter description needed no change. Also: lines 3 and 6 of the five `agents/ordo-*.md`, the comments of `reviewer` and `reviewer_effort` in `skills/plan/templates/plan.yaml` and `orchestrator-state.md`, the comment of `reviewer` in `.agents/plan.yaml`, the glossary entries **reviewer** and **effort agent** in `plan-terms.md` and `docs/glossary.md`, `README.md:74` and `:119`, `gen_figures.py` (`code_comments()`), `docs/figures/code-comments.svg` | C3 after: both greps print nothing. C9 after, by reading |
| 4. A missing `ordo-` agent is a warning | DONE | `spec` Steps 1 and "Steps / The brief check" 1, `refute` Steps 1 and "Steps / Over a repair round" 1, `plan-orchestration` Steps 1, "The two tiers, and the models" and "Launching a builder", `diagnose` "Rules", `grill` "Steps / Looking up a fact" 1, 3 and 4. Each states the warning, what it names, that the agent starts on the runner's default agent with no model named and no effort set, that the configured model and effort are not applied, that the stop for another model is not raised for it, and where its served model is recorded. The refusal "The configured effort cannot apply" now names `CLAUDE_CODE_EFFORT_LEVEL` alone in each Steps item and Stops row. The Stops rows "A model other than the configured one" (and `grill`'s "A lookup agent served another model") name an agent started as an effort agent. `ordo-help` lines 121, 127, 128 and 129, `README.md:119`, the entries **effort agent**, **diagnosis agent** and **reviewer** | C4 after: 8 lines, each for the variable alone. C5 after, by reading |
| 5. The ADRs, edited in place | DONE | 0007: the price sentence of Context is replaced, "Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`." is gone, the last decision sentence reads "The served-model check applies to it as to every agent started as an effort agent.", and Consequences names no model. 0014: Context no longer says the skills run a repository from its `.agents/plan.yaml`; the decision opens with no plan configuration read, the three agents on the runner's default agent, and the two places of the prose standard. 0030 and 0035: status line, decision and consequences state what `writing` does; the clauses on `paper` keep their words. No title, file name or number changed, and `docs/adr/README.md` is unchanged | C6 after: nothing. C10 after, by reading |
| 6. Not changed | DONE | `.agents/plan.yaml`: the comment of line 11 only. `skills/paper`: no change | C7 after |
| 7. Versions | DONE | `writing` 2.0.0 to 2.1.0, `code-comments` 1.0.0 to 1.1.0, `spec` 7.0.0 to 7.1.0, `refute` 5.0.0 to 5.1.0, `plan-orchestration` 7.0.0 to 7.1.0, `grill` 1.3.1 to 1.4.0, `diagnose` 2.1.1 to 2.2.0, `plan` 5.0.3 to 5.0.4, `ordo-help` 3.2.0 to 3.2.1 | `git diff -- 'skills/*/SKILL.md' \| grep -E '^[+-]  version'` prints the nine pairs |

## The cases, run after the change

- C1: the same command prints 7 lines: `.agents/plan.yaml:9` and `:11` (the values `claude:fable`), `docs/roadmap.md:23`, `:26` and `:27`, `skills/paper/references/disclosure_mode_protocol.md:111` and `skills/plan-orchestration/templates/prices.txt:3`. None keeps an agent off Fable. Met.
- C2: prints nothing. Met.
- C3: both greps print nothing. Met.
- C4: prints `ordo-help` 127 and 129, `plan-orchestration` 54 and 461, `refute` 53 and 202, `spec` 93 and 489. Each states the refusal for `CLAUDE_CODE_EFFORT_LEVEL` alone; lines 127 and 129 of `ordo-help` add that a missing agent is no refusal. Met.
- C5, by reading: `spec` Steps 1 and "Steps / The brief check" 1; `refute` Steps 1; `plan-orchestration` Steps 1 and "Launching a builder"; `grill` "Steps / Looking up a fact" 1, 3 and 4; `diagnose` "Rules". Met.
- C6: prints nothing. Met.
- C7: `git diff --stat -- skills/paper` prints nothing. `git diff -- .agents/plan.yaml` shows one line changed, the comment of `reviewer`, the value `claude:fable` on both sides. Met.
- C8: prints line 65 only, "Each starts on the runner's general-purpose agent with the runner's defaults, and its prompt sets no model and no effort." Met.
- C9, by reading the lines printed: none says either skill starts an effort agent, runs on a configured model or stops on a served model. Met.
- C10, by reading: met, as the row of item 5 says.

## Verification, as printed

Each run from the worktree's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

1. `sh skills/land/templates/land.test.sh 2>&1 | tail -1`: `PASS: land.sh scratch tests`
2. `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`
3. `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`: `PASS: sync_rules.py scratch tests`. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
4. The character-set check over the 27 changed files (the paths `git status --porcelain` lists, NUL-separated, in place of the git command): prints nothing, exit 0.
5. The description-length command: `939 skills/code-comments/SKILL.md`, `965 skills/diagnose/SKILL.md`, `877 skills/grill/SKILL.md`, `817 skills/ordo-help/SKILL.md`, `1018 skills/plan-orchestration/SKILL.md`, `477 skills/plan/SKILL.md`, `989 skills/refute/SKILL.md`, `1003 skills/spec/SKILL.md`, `779 skills/writing/SKILL.md`. No description changed in this step.
6. `python3 docs/figures/gen_figures.py` printed one `wrote` line per figure; `git status --short` then lists `writing.svg` and `code-comments.svg` as the only changed figures.

What these checks do not cover: whether the skills' text is right, which is judged by reading.

## Files changed (`git diff --numstat`)

- `.agents/plan.yaml` +1 -1
- `README.md` +3 -3
- `agents/ordo-high.md`, `ordo-low.md`, `ordo-max.md`, `ordo-medium.md`, `ordo-xhigh.md` +2 -2 each
- `docs/adr/0007-...md`, `0014-...md`, `0030-...md`, `0035-...md` +3 -3 each
- `docs/figures/code-comments.svg` +15 -19
- `docs/figures/gen_figures.py` +2 -10
- `docs/figures/writing.svg` +15 -19
- `docs/glossary.md` +3 -3
- `skills/code-comments/SKILL.md` +26 -46
- `skills/diagnose/SKILL.md` +8 -3
- `skills/grill/SKILL.md` +13 -8
- `skills/ordo-help/SKILL.md` +5 -5
- `skills/plan-orchestration/SKILL.md` +19 -10
- `skills/plan/SKILL.md` +1 -1
- `skills/plan/templates/orchestrator-state.md` +3 -3
- `skills/plan/templates/plan.yaml` +2 -2
- `skills/refute/SKILL.md` +13 -7
- `skills/repo-setup/templates/plan-terms.md` +3 -3
- `skills/spec/SKILL.md` +14 -8
- `skills/writing/SKILL.md` +14 -32

Unchanged paths of the brief's list: `docs/dev/scripts.md`, `docs/figures/grill.svg`, `plan-loop.svg`, `pipeline.svg` and `docs/adr/README.md`.

## User-visible changes

- `/writing`: before, four agents as `ordo-medium` on opus, a stop on a served model of another family, and the effort and served identifiers named after the report. After, four agents on the runner's default agent with the runner's defaults, no stop on a served model, and the line after the report gives the tokens only.
- `/code-comments`: before, it refused without `.agents/plan.yaml`, took `<project>` in the `projects:` form, and started its agents as `ordo-<reviewer_effort>` on `reviewer`. After, it reads no configuration, takes no `<project>` argument, and starts its agents on the runner's default agent.
- `/spec`, `/refute`, `/plan-orchestration`, `/diagnose`: before, a missing `ordo-<level>` agent was the refusal "The configured effort cannot apply". After, it is a printed warning, and the agent starts on the runner's default agent and is not held to the configured model. `CLAUDE_CODE_EFFORT_LEVEL` set stays the refusal.
- `/grill`: before, a missing agent sent the lookups to the session's own reads. After, the warning is printed and the lookup agents start on the runner's default agent.

## Judgment calls

1. `plan-orchestration`, "The two tiers, and the models": the bullet "**Default.** The orchestrator and every agent run on Claude Opus." was folded into the two bullets that remain, so the section holds one statement per tier. The orchestrator's line now reads "It runs on the model of its own session.", and the agents' default is stated as what the `plan` skill's `templates/plan.yaml` names (`grep -n 'claude:opus' skills/plan/templates/plan.yaml` prints lines 11, 12 and 30). This serves item 1 ("one statement of which model each agent runs on").
2. "Any allowed combination is chosen per step." became "Any combination of these models is chosen per step.", since "allowed" rested on the ban.
3. Each of the five skills states the warning in its own text, with the same four points, so that a person running one skill by hand finds it there (C5).
4. In `writing` and `code-comments`, the read of an agent's served model went with the check, since nothing uses it once the stop and the line after the report no longer name a model.
5. ADR 0030 and ADR 0035: the clauses on `paper` keep their words, and the clause on `writing` was split out of each sentence it shared with `paper`. The clause ", the part for `writing` standing" went from both status lines, twice in each, since the part of `writing` now reads as the decision states it.
6. Left as they are, for the orchestrator's ruling: the Context of ADR 0035 (line 7) quotes ADR 0030 as deciding that every agent of `writing` "runs as `ordo-medium` on opus", words ADR 0030's decision no longer holds for `writing`; the Context of ADR 0030 (line 7) says `writing` refuses without the plan configuration, as the state before that record. The brief names the status line, the decision and the consequences of these two records, so their Context was not changed.
7. Left as they are: the glossary entries **brief check** and **tiers** state the configured model without the warning case. The entries **effort agent**, **reviewer** and **diagnosis agent** state it.
8. `.agents/plan.yaml:13`, the comment of `repair_reviewer` ("Sonnet, since ... at half Opus's price per token"), is unchanged, as item 6 has only the comment of `reviewer` change.

## Wrong or impossible in the brief

Nothing. One observation on a premise: the brief's "What is on the tree" does not say that `.agents/plan.yaml` sets `worker` and `reviewer` to `claude:fable` (lines 9 and 11); both values are kept, as item 6 asks.

## Handed back

Nothing.

## Repair round 1

NOT DONE: nothing. Each of the eight rulings is carried out, and nothing else was changed.

1. `docs/adr/0030-...md`, Decision: the sentence now opens "`paper` names in its own text the model and the effort of each agent it starts", and the one sentence on `writing` follows it. Consequences: "For `paper`, a change of model or effort is a change of the skill's text."; the last sentence reads "`writing` needs no effort agent, and `CLAUDE_CODE_EFFORT_LEVEL` may be set when it runs.", so the record says once, in its decision, how `writing` starts its agents.
2. `docs/adr/0035-...md`, Alternatives rejected: "The default agent at the session's effort, for `paper`: a run of `paper` names the effort its agents ran at, and it cannot name an effort it does not read."
3. `docs/adr/0035-...md`, Context: "ADR 0030 decides that every role of `paper` "runs as `ordo-medium` on opus", the agents of `writing` start the same way, and both skills refuse to start with ...". The quote is now what ADR 0030's decision says.
4. `skills/repo-setup/templates/plan-terms.md`, then `docs/glossary.md` by the sync, entry **reviewer**: "An agent started with the warning the entry **effort agent** gives follows the session and is not held to these models."
5. The same two files, entry **brief check**: "by one fresh read-only agent, the brief-check agent: the effort agent `ordo-<reviewer_effort>` on the model the configuration block's `reviewer:` names, or, when the runner lists no such agent, an agent started with the warning the entry **effort agent** gives. Its report is saved at `agents/reviews/<step>-brief-check.md`. The brief check also holds each line ...".
6. `skills/plan-orchestration/SKILL.md`, "The two tiers, and the models": the sentence "The `plan` skill's `templates/plan.yaml` names Claude Opus for each of those keys." is removed.
7. `docs/adr/0007-...md`, Alternatives rejected: "The same model at medium effort: the run over a repair round stays on the first run's model, and a repository cannot set another model for it." and "No change until the reviewer trial of plan 2.F reports: until then no repository can set the model of the run over a repair round apart from the first run's."
8. `skills/code-comments/SKILL.md`, "The rewrite" 5: "then start the rewrite agent as a fresh agent on the runner's general-purpose agent with the runner's defaults, its prompt setting no model and no effort." It no longer points at Steps 5 and says nothing on the background.

The checks, each run from the worktree's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, as printed:

- `sh skills/land/templates/land.test.sh 2>&1 | tail -1`: `PASS: land.sh scratch tests`
- `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`
- `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`: `PASS: sync_rules.py scratch tests`
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0
- The character-set check over the paths `git status --porcelain` lists: prints nothing, exit 0
- `git diff -- 'skills/*/SKILL.md' | grep -c '^[+-]description'`: `0`, so no description changed and the lengths of the first report stand

The cases, run again:

- C1: 7 lines, `.agents/plan.yaml:9` and `:11`, `docs/roadmap.md:23`, `:26` and `:27`, `skills/paper/references/disclosure_mode_protocol.md:111`, `skills/plan-orchestration/templates/prices.txt:3`; none keeps an agent off Fable. Met.
- C2: prints nothing. Met.
- C3: both greps print nothing. Met.
- C4: `ordo-help` 127 and 129, `plan-orchestration` 54 and 460, `refute` 53 and 202, `spec` 93 and 489, each for `CLAUDE_CODE_EFFORT_LEVEL` alone. Met.
- C5, by reading: unchanged by this round in `spec`, `refute`, `grill` and `diagnose`; in `plan-orchestration` the round removed one sentence of "The two tiers, and the models", and Steps 1 and "Launching a builder" still state the warning. Met.
- C6: prints nothing. Met.
- C7: `git diff --stat -- skills/paper` prints nothing; `git diff -- .agents/plan.yaml` changes the comment of the `reviewer` line, the value `claude:fable` on both sides. Met.
- C8: line 65 only, which says the prompt sets no model and no effort. Met.
- C9, by reading: the lines printed are those of the first report's run after the change; none says either skill starts an effort agent, runs on a configured model or stops on a served model. Met.
- C10, by reading: the decisions of ADR 0014, 0030 and 0035 state what `code-comments` and `writing` do. Met.

`git diff --numstat | wc -l` prints 27: the round changed no file outside the 27 the first report lists.
