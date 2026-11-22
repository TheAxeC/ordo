## Verification

Run from the worktree's root, each under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

1. `sh skills/land/templates/land.test.sh 2>&1 | tail -1`: `PASS: land.sh scratch tests`
2. `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`
3. `sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1`: `PASS: sync_rules.py scratch tests`. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`, exit 0.
4. The character-set check over the paths `git status --short` lists (27 changed files and the report): prints nothing, exit 0.
5. The description-length command: `939 skills/code-comments/SKILL.md`, `965 skills/diagnose/SKILL.md`, `877 skills/grill/SKILL.md`, `817 skills/ordo-help/SKILL.md`, `1018 skills/plan-orchestration/SKILL.md`, `477 skills/plan/SKILL.md`, `989 skills/refute/SKILL.md`, `1003 skills/spec/SKILL.md`, `779 skills/writing/SKILL.md` (all at most 1,024). `git diff 650332d -- skills | grep -c '^[-+]description'` prints `0`: no description changed.
6. Cases, with `grep -rn` in place of `git grep`:
   - C1 (`fable`, outside `.scratch`): `.agents/plan.yaml:9` and `:11`, `docs/roadmap.md:23`, `:26`, `:27`, `skills/paper/references/disclosure_mode_protocol.md:111`, `skills/plan-orchestration/templates/prices.txt:3`. Seven lines, none keeps an agent off Fable.
   - C2: prints nothing.
   - C3: both greps print nothing.
   - C4: `skills/ordo-help/SKILL.md:127`, `:129`, `skills/refute/SKILL.md:53`, `:202`, `skills/spec/SKILL.md:93`, `:489`, `skills/plan-orchestration/SKILL.md:54`, `:461`. Each names `CLAUDE_CODE_EFFORT_LEVEL` alone.
   - C6: prints nothing.
   - C7: `git diff 650332d --stat -- skills/paper` prints nothing; `git diff 650332d -- .agents/plan.yaml` shows one line pair, the comment of `reviewer`, with the value `claude:fable` on both sides.
   - C8: `65:   - Each starts on the runner's general-purpose agent with the runner's defaults, and its prompt sets no model and no effort.`

Commands the builder's report quotes, rerun: the nine version pairs (`git diff 650332d -- 'skills/*/SKILL.md' | grep -E '^[+-]  version'`), the numstat of the 27 files, `grep -n 'claude:opus' skills/plan/templates/plan.yaml` (lines 11, 12, 30), the open items (`- none`), and the first-run line numbers of C2, C3 and C6 on the base through `git show 650332d:<path>`. Each matches the report.

## Verdicts

Items of "What to build":

1. The Fable ban: holds. See Standards 5 for one sentence the rewrite adds.
2. `writing` follows the session: holds. Every step number, "What it reads" number and Stops row in `skills/writing/SKILL.md` and in `templates/prose_facts.py` (Steps 3) points at the right item after the renumbering.
3. `code-comments` follows the session and reads no `plan.yaml`: holds. Every reference in `skills/code-comments/SKILL.md` to Steps 3, 5 and 6, to "What it reads" 1 to 4 and to items 4 and 6 of "The rewrite" points at the right item. See Behaviour 1 and 2.
4. A missing `ordo-` agent is a warning: holds in `spec`, `refute`, `plan-orchestration`, `diagnose`, `grill`, `ordo-help`, `README.md:119` and the entries **effort agent**, **diagnosis agent** and **reviewer**. See Standards 3 and 4 for the glossary.
5. The ADRs, edited in place: violated for ADR 0030 and ADR 0035 (Standards 1 and 2). ADR 0007 and ADR 0014 hold; see Standards 7 on ADR 0007.
6. Not changed: holds.
7. Versions: holds, the nine skills as the brief lists them.

Cases: C1 met. C2 met. C3 met. C4 met. C5 met, by reading the five skills. C6 met. C7 met. C8 met. C9 met, by reading the lines printed. C10 met: the three decisions state what the two skills do, with the contradictions of Standards 1 and 2 beside them.

## Spec

None. The report gives the first run of every case. No reserved decision was taken, and each premise of the brief I grepped reproduces.

## Proof

None. Every claim I reran reproduces. The run of `gen_figures.py` is under "Declined to judge".

## Standards

1. `docs/adr/0030-...md`, Decision (line 11) and Consequences (line 21). Rule 19 of the change standard: no two statements that contradict each other.
   - Hunk: "Each skill names in its own text the model and the effort of each agent it starts: every role of `paper` runs as `ordo-medium` on opus [...]. `writing` starts each of its agents on the runner's default agent with the runner's defaults, and its prompts set no model and no effort." And, unchanged in Consequences: "A change of model or effort is a change of the skill's text."
   - What is wrong: the first sentence says both skills name a model and an effort; the added sentence says `writing` names neither. The Consequences sentence is false for `writing`, whose model and effort now change with the session.
   - Failure scenario: a maintainer who wants `/writing` on another model reads this record, looks for the model in `skills/writing/SKILL.md`, finds none, and adds one, undoing the ruling.

2. `docs/adr/0035-...md`, Alternatives rejected (line 16) against the Decision (line 11). Rule 19.
   - Hunk, unchanged: "- The default agent at the session's effort: the run cannot name an effort it does not read." Added to the Decision: "`writing` starts each of its agents on the runner's default agent with the runner's defaults in every setup [...] the line after its report names no effort and no served model".
   - What is wrong: the record now decides for `writing` the alternative it rejects, and the reason for the rejection (the run must name its effort) is the thing the decision drops.
   - Failure scenario: a reviewer of a later change to `writing` reads the rejected alternative and reports the session-following start as a contradiction of ADR 0035, a rule clash that stops a step.

3. `docs/glossary.md:104` and `skills/repo-setup/templates/plan-terms.md:99`, entry **reviewer**. Rule 14: a sentence the change makes false.
   - Hunk: "An agent started with the warning the entry **effort agent** gives runs on none of these models."
   - What is wrong: such an agent runs on the session's model, which is one of these models whenever the session runs on the configured one (Ordo's own case: session and `reviewer` both on Fable). The entry **effort agent** says it correctly: "the configured model and effort are then not applied".
   - Failure scenario: an orchestrator reading the entry treats a warned agent served the configured model as an error.

4. `docs/glossary.md:17` and `plan-terms.md`, entry **brief check** (the builder's judgment call 7). Left false by the step for the warning case.
   - Text: "by one fresh read-only agent on the model the configuration block's `reviewer:` names, the brief-check agent".
   - What is wrong: with no `ordo-<reviewer_effort>` agent listed, the brief-check agent follows the session. The step added that case to **diagnosis agent**, the same kind of entry, and not here.
   - Failure scenario: a person who looks up "brief check" to learn which model checked a brief reads `reviewer:` and books the wrong model.
   - The entry **tiers** ("each on the model the section names") is not false: the section it names now states the warning case.

5. `skills/plan-orchestration/SKILL.md:214`, "The two tiers, and the models". `docs/dev/skill-layout.md`, "Writing for an agent": a sentence that restates a default is cut.
   - Hunk: "- The `plan` skill's `templates/plan.yaml` names Claude Opus for each of those keys."
   - What is wrong: it changes nothing an orchestrator does, since the agents run on what the configuration block names, and it goes false when the template's values change.
   - Failure scenario: an orchestrator whose block names Fable reads "Claude Opus" in the section on models and takes Opus as the expected served model.

6. `docs/adr/0035-...md`, Context (line 7) (the builder's judgment call 6). Left false by the step.
   - Text: "ADR 0030 decides that every role of `paper` and every agent of `writing` \"runs as `ordo-medium` on opus\"".
   - What is wrong: ADR 0030, edited in place by this step, no longer decides that for `writing`.
   - Failure scenario: a reader who follows the reference into ADR 0030 finds the opposite of what is quoted and cannot tell which record is current.
   - The second half of judgment call 6, the Context of ADR 0030 (line 7, "`writing` refuse[s] to run without that file"), was not made false by this step: it described the state before that record at the base as well.

7. `docs/adr/0007-...md`, Alternatives rejected (lines 15 and 16). Low weight.
   - Text, unchanged: "the price per token does not change, and the saving in tokens is not measured" and "the cost is not cut, and nothing is measured."
   - What is wrong: the Context no longer states cost as the motive, so both rejections argue from a goal the record no longer names. The Context's new reason is "A repository may want that run on another model than the first run's."
   - Failure scenario: a reader cannot tell from the record why the two alternatives lose.

Judgment call 8 (`.agents/plan.yaml:13`, the comment of `repair_reviewer`): not made false by the step. It states why Ordo's value is Sonnet, and item 6 keeps the line.

No history, date, plan or step name is added by the diff, and no non-ASCII. The greps of `ordo-medium`, `ordo-<`, "effort agent", "configured effort", "other than the configured", `code-comments`, `writing`, "Fable" and "opus" outside `.scratch` gave no hit beyond the findings above. The figure labels of `pipeline.svg`, `plan-loop.svg` and `grill.svg` still hold: their stops remain for agents started as effort agents.

## Behaviour

1. `/code-comments` no longer reads the prose standard from the page the `standards` key lists. The report's "User-visible changes" says only "it reads no configuration".
   - Before (`git show 650332d:skills/code-comments/SKILL.md`, "What it reads" 2): three places, first "The page of `standards` whose file name is `prose-standard.md`".
   - After: `docs/dev/prose-standard.md`, then the `repo-setup` template.
   - Failure scenario: a repository that keeps its prose standard at another path named in `standards` has its comments judged against Ordo's template, with no refusal and no notice.

2. `skills/code-comments/SKILL.md:102`, "The rewrite" 5: "start the rewrite agent as Steps 5 starts the finding agent". Steps 5 starts its agent "in the background", so the rewrite agent now starts in the background. At the base the item said only "start the rewrite agent as `ordo-<reviewer_effort>` on the model `reviewer` names". The report does not state it. Low weight: the item still ends "Done when the runner reports that the agent ended."

## Declined to judge

- Whether `python3 docs/figures/gen_figures.py` reproduces the two committed figures (the report's verification line 6): the script writes the figures in place, and I change nothing. Read instead: both figures hold no "configured" text, and their `<title>` lists no stop box.
- Whether the changed files are the only ones changed in commits rather than in the working tree: `git log 650332d..HEAD` would settle it; `git diff 650332d` and `git status --short` show 27 modified files and the untracked report.
- Whether ADR 0001 ("the skills that read the writing base read [...] the page the repository's `standards` key lists") governs `code-comments`. Its status names only ADR 0030 as superseding it in the `standards` key, and ADR 0014's new decision does not say it supersedes 0001. This is a reading of which skills "read the writing base", the orchestrator's or the user's call.
- Whether `repo-setup` takes a version part: its `templates/plan-terms.md` changed, `plan` was raised for a change to its templates alone, and item 7 does not list `repo-setup`. The brief's list is the orchestrator's.
- Whether the skills behave as their text says at run time (the warning printed, the agent started on the default agent): no skill was run. The three test scripts pass and cover none of the changed text.
- The ruling "Fable and the session" itself, as instructed.

Agent usage: af9bdf0f24d9b60a2, claude-fable-5-2, 222767 tokens, 29 tool uses, 5.4 minutes.
