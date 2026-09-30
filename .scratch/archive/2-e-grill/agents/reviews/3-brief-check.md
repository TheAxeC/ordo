# Step 3 brief check (on main at cb92d65)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites is named with its section, never with a line number. A line of code or a hit of a grep keeps its `file:line`. Saved by the orchestrator from the agent's final message, condensed where it lists hits that stay true or checks that held.

## 1. Names

- `worker_effort`, `reviewer_effort`: hits in the glossary, plan-terms, ordo-init, check_config, the plan templates and the roadmap goal; still true.
- `general-purpose`: only `skills/plan-orchestration/SKILL.md:225`, inside the paths.
- `links every skill`: `README.md:138`, `docs/glossary.md:107`, `utils/pin.test.sh:3`, `utils/pin.sh:4`, all inside the paths. `installed skills change only`: `docs/dev/change-standard.md:80`, inside.
- "on the model the configuration block's `reviewer:` names": refute and spec inside; the glossary terms reviewer, brief check and tiers still true, none naming an effort.
- `skills linked in`: `utils/pin.sh:180,282`, `utils/pin.test.sh:52,55`; `run_pin` takes `${out##*skills linked in: }`, so a second line needs `run_pin` changed.
- Other skills and `docs/`: `skills/plan-help/SKILL.md:70`, the `/spec refuses` line, misses the new refusal; no line covers a `/refute` refusal.
- README: "each skill folder is replaced whole, so a file a newer version removes does not linger" and "Updating is `npx skills update -g`" become false for agents; "The installed skills are links into a pinned checkout" and the glossary's "the installed skills held at a tag" become incomplete.

Findings: 1.1 plan-help's refusal lines not in the paths. 1.2 two README "Install" sentences made false. 1.3 two sentences name only skills.

## 2. The step line

- Every part has an item, except the check's "one real launch through `ordo-high`" (Decision 6 only) and "a read of whether a definition without `tools` gets every tool" (asserted, not checked).

Findings: 2.1 the real launch missing from "Verify before you report" with its pass output. 2.2 the tools read has no check.

## 3. Premises

- Every count and line range matches, except: the folder selection runs to line 59; "nothing reads them yet" (check_config validates both keys); "the three paragraphs" are four; `grep -n pin plan-terms.md` prints four lines (`-w -i` prints nothing). The documentation facts and the `claude -p` probe: not rerun. This agent, launched as a subagent, has the Agent tool in its list.

Findings: 3.1 "nothing reads them yet". 3.2 four paragraphs. 3.3 the plan-terms grep. 3.4 "no Agent tool" not borne out.

## 4. Cases and checks

Findings: 4.1 the `/spec` refusal comes after the brief is written, against skill-layout "Lists and tables" and the Stops preamble, and "`/spec` again" meets the preflight. 4.2 "A red check" used outside its glossary sense. 4.3 the effort agent is a new plan term with no entry. 4.4 the launch rule written twice in plan-orchestration. 4.5 Ordo's name and paths in skill texts, against "no project name and no path". 4.6 the silent case has no control, against rule 13. 4.7 the grep of the reading case and Verify 4 hits `.scratch/archive` and cannot pass.

## 5. The question

Findings: 5.1 the landing launch differs from the skills' launch (no model, foreground, project link), and whether `CLAUDE_CODE_EFFORT_LEVEL` overrides a definition is not stated. 5.2 `xhigh` and `max` not shown. 5.3 the changed texts are exercised by no real launch in the step.

## 6. Implied inputs

Findings: 6.1 an unwritable agent folder. 6.2 an agent folder that is a file, an entry that is a directory. 6.3 coinciding agent folders. 6.4 a skill folder that is also an agent folder. 6.5 check mode with no agent folder. 6.6 a configuration block without the effort keys. Low cost, noted: names with odd characters, a non-`.md` file, a `README.md` in `agents/`, a subfolder, an agent folder that is a link, `CLAUDE_CONFIG_DIR` equal to `~/.claude`.

## Declined to judge

- The documentation facts and the probe: not rerunnable by the agent.
- Whether a running session sees an agent linked after it started.
- Whether `xhigh` and `max` are accepted for every model.
- Whether a custom agent without `tools` in the background gets the Agent tool.

Agent usage: 173243 tokens, 33 tool uses, 8.7 minutes (520 s), claude:opus, a fresh agent (from its completion notice).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1.1: `skills/plan-help/SKILL.md` added to the paths; item 6a gives the `/spec refuses` cause and a new `/refute refuses` line.
- 1.2: item 7 names both "Install" sentences: the agents copied after `npx skills add` and each `npx skills update -g`, the old `ordo-*.md` removed before the copy, and the updating sentence covering agents.
- 1.3: item 7 widens "The installed skills are links" and item 8 "the installed skills held at a tag" to skills and agents.
- 2.1: Verify 7, run by the orchestrator at landing, with its pass output.
- 2.2 and 3.4: Verify 7 has `ordo-high` read, edit and write a scratch file, the hook recording each call, and report its tools, the Agent tool's presence stated; the premise drops "no Agent tool" and states the agent's own report.
- 3.1, 3.2, 3.3: the three premise sentences corrected; the folder selection is lines 47-59.
- 4.1: the check moves into `/spec`'s Steps 1 preflight, before any write (item 6); `/refute` checks before its dispatch (item 5); plan-orchestration at Steps 1 (item 4).
- 4.2: plan-orchestration gains its own refusal row "The configured effort cannot apply", and the Stops preamble counts it; "A red check" is not used.
- 4.3: item 6b adds the term **effort agent** to `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`; the template added to the paths.
- 4.4: the builder's launch is stated once, in "Launching a builder"; "The two tiers, and the models" names that section and the refute and spec skills.
- 4.5: Decision 4a: the skill texts say "installed with the plan skills" and "installed as the plan skills are", naming no project and no path; a reading case greps `skills` for `ordo|pin\.sh|README` against the count before the change.
- 4.6: the silent case carries its controls in the same case, their red output quoted.
- 4.7: the grep takes `-- ':!.scratch'` and the case reads "hits nothing".
- 5.1: probed in this session and recorded under "What is on the tree": the model named and a background launch keep the definition's level; a settings `effortLevel` does not override it; `CLAUDE_CODE_EFFORT_LEVEL` does. Items 4 to 7 add the check that the variable is unset, a refusal when set, and the README says it must be unset. Verify 7 launches with `model: opus` and `run_in_background: true`.
- 5.2: probed: `xhigh` and `max` recorded with `model: opus`; stated under "What is on the tree".
- 5.3: Decision 6: the changed skill texts take effect at the next pin, which Axel approves; the booking says so and the first dispatch after that pin records its `subagent_type`. The premise states the pin in use (`pinned: v2.5.0`).
- 6.1 to 6.5: a case each; 6.2 and 6.4 are refusals in item 2, 6.3 is item 2's coinciding folders, 6.5 is check mode changing nothing.
- 6.6: items 4 to 6 say a block without the key takes `high`; a reading case checks it.
- Low-cost inputs: Decision 4b and a case for a non-`.md` file and a subfolder; names with odd characters, an agent folder that is a link and `CLAUDE_CONFIG_DIR` equal to `~/.claude` stay without a case, since the tags are Ordo's own and the existing code folds the last.
- Declined, "a running session sees an agent linked after it started": the refusals' resume says a new session.
