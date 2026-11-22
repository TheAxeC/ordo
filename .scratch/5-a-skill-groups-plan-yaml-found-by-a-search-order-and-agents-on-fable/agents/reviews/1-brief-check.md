Brief check of step 1, plan 5.A. Tree read on main at cf88a74 (`git rev-parse --short HEAD` prints `cf88a74`). Nothing was changed; `git status --short` after the checks prints the same three ledger lines as at the start.

Two findings need a ruling before the builder starts: the `/writing` part of the step (checks 1, 2, 5, 6), and item 5's pointer for the version rule (check 4).

## 1. Names

Commands (all from the repository root, `.scratch` excluded):

- `git grep -n -i 'never.*fable\|fable.*never' -- ':!.scratch'` prints 3 lines: `skills/plan-orchestration/SKILL.md:213`, `skills/plan/templates/orchestrator-state.md:13`, `:14`. All three are in "Paths this step writes".
- `git grep -n -i 'fable' -- ':!.scratch'` prints, besides those: `.agents/plan.yaml:9`, `:11`; `docs/roadmap.md:23`, `:26`, `:27` (entry 5.A); `skills/paper/references/disclosure_mode_protocol.md:111`; `skills/plan-orchestration/SKILL.md:210`; `skills/plan-orchestration/templates/prices.txt:3`. Hits outside the paths list: the roadmap lines (the entry's own goal and gate, not made false), `disclosure_mode_protocol.md:111` (an example of a model version, not made false), `prices.txt:3` (a price row, not made false).
- `git grep -n 'repair_reviewer' -- ':!.scratch'` prints hits outside the paths list in `docs/glossary.md:31`, `:104`; `docs/roadmap.md:26`, `:112`; `skills/ordo-init/SKILL.md:102`, `:152`, `:166`; `skills/ordo-init/templates/check_config.py:6,18,21,36,128,131,132,163`; `skills/ordo-init/templates/check_config.test.sh:5`, `:117`; `skills/plan/templates/plan.projects.yaml:32`, `:59`; `skills/plan/templates/plan.yaml:30`; `skills/refute/SKILL.md:92`; `skills/repo-setup/templates/plan-terms.md:26`, `:99`; and inside the paths list `skills/plan-orchestration/SKILL.md:217`, `skills/plan/SKILL.md:161`, `:163`, `skills/plan/templates/orchestrator-state.md:29`. Each of them states the key, its `claude:<model>` form or its default, the `reviewer` value; none names Ordo's value, so the change of value makes none false. `docs/roadmap.md:112` is the done entry 2.E.A, which records "2.E.A's runs over a repair round from step 4 on priced on claude-sonnet-5-5, the model `repair_reviewer` names": a record of that entry's gate, not made false.
- `git grep -n -i 'claude:sonnet\|sets it to' -- ':!.scratch'` prints `.agents/plan.yaml:9` (the comment of `worker:`, "for example claude:sonnet", not made false), `.agents/plan.yaml:13` and `docs/adr/0007-...md:11` (both in the paths list). ADR 0007's sentence stands nowhere else.
- `git grep -n -i '0007' -- ':!.scratch'` prints the ADR itself and `docs/adr/README.md:17` (its title row; the title stays, not made false).
- `git grep -n -E '^(worker|reviewer|repair_reviewer)(_effort)?:' -- ':!.scratch'` prints, outside the paths list, `skills/plan/templates/plan.yaml:11`, `:12`, `:26`, `:27`, `:30`: none mentions Fable, none made false.

One hit outside the names the brief greps, which the change does make false or leave contradicting it. `git grep -n -i -E 'opus|sonnet|haiku' -- ':!.scratch' ':!skills/paper' ':!docs/adr' ...` prints in `skills/writing/SKILL.md`:

- `:42` "The model identifier the runner's model list gives for opus, the model every agent runs on"
- `:73` "Each runs on opus as the agent Steps 4 read"
- `:77`, `:78`, `:80`, `:82`, `:86`, `:92` (the served model must be of the opus family, or the stop is raised)
- `:296` "| A model other than the configured one | The runner served one of the four agents a model of another family than opus (Steps 7 and 8) | ..."

`/writing` therefore keeps its agents off Fable, with a stop, in text that never uses the word Fable. Neither the brief's greps nor the step line's `git grep -n -i 'fable'` print these lines. The step line and the goal say the agents of `/writing` may run on Claude Fable. `skills/writing/SKILL.md` is in item 1's reading list, so the path is covered by the paths list's "any file of item 1's list"; what its text is to say is not given (see checks 2 and 6).

The same grep prints `skills/plan-orchestration/SKILL.md:209` ("**Default.** The orchestrator and every agent run on Claude Opus.") and `docs/dev/blind-comparison.md:25` (an example `--model opus`); neither forbids Fable, neither is made false.

`grep -n -i 'model' skills/grill/SKILL.md skills/code-comments/SKILL.md skills/refute/SKILL.md skills/spec/SKILL.md skills/diagnose/SKILL.md` shows each of these agents starts "on the model `reviewer` names" (for example `skills/grill/SKILL.md:223`, `skills/code-comments/SKILL.md:81`, `skills/refute/SKILL.md:49`, `skills/spec/SKILL.md:385`, `skills/diagnose/SKILL.md:387`): no sentence there keeps an agent off Fable. `grep -n -i 'opus\|fable\|model\|claude' docs/figures/*.py` prints only labels of the form "A model other than the configured one" (`gen_figures.py:1234` and others): no figure label repeats the rule. `grep -n -i 'opus\|fable\|sonnet\|model' README.md` prints only the figures' alt texts with the same labels.

## 2. The step line

| Part of the plan's step 1 line | Requirement of "What to build" |
|---|---|
| the rule in `skills/plan-orchestration/SKILL.md` removed | item 1, first three sentences |
| the two comments of `skills/plan/templates/orchestrator-state.md` removed | item 2 |
| "every other sentence, page and figure label that repeats the rule" | item 1, the reading list and "A figure label that changes means both figure scripts are run again" |
| the builder, the reviewer, the reviewer over a repair round, the brief-check and diagnosis agents may run on Fable | item 1, second sentence |
| the agents of `/grill` and `/code-comments` may run on Fable | item 1, "the agents of `/grill`, `/code-comments` and `/writing` included"; these agents already run on the model `reviewer` names, so no text of theirs needs a change |
| the agents of `/writing` may run on Fable | item 1 names `/writing` only inside "change each one found". No requirement says what `skills/writing/SKILL.md` is to say in place of its opus rule and its stop (lines 42 to 92 and 296). This part of the line has no requirement the builder can build from. |
| `.agents/plan.yaml` names `claude:fable` for `worker`, `reviewer`, `repair_reviewer`, efforts `low` | item 3 |
| the check: `git grep -n -i 'fable' -- ':!.scratch'` prints no line that keeps an agent off Fable, read by the reviewer | no case runs this grep. C1 runs the narrower `'never.*fable\|fable.*never'`; C5 is the reading. |
| "the verify list passes" | "Verify before you report" 1 to 4 (the checks of the changed files), the whole list at landing |
| "(1 commit)" | none; it is the landing's |

Requirements that serve no part of the line: item 4 (ADR 0007) serves the ruling "ADR 0007 holds no configuration value", not the line; item 5 (versions) serves `docs/dev/skill-layout.md`, "Frontmatter".

## 3. Premises

- Bullet 1: `git grep -n -i 'never.*fable\|fable.*never' -- ':!.scratch'` prints the three lines the brief names, with the quoted text word for word. Agrees.
- Bullet 2: `git grep -n -i 'fable' -- ':!.scratch'` prints the lines the brief lists and no other (`.agents/plan.yaml:9`, `:11`; roadmap 23, 26, 27; `disclosure_mode_protocol.md:111`; `SKILL.md:210`, `:213`; `prices.txt:3`; template `:13`, `:14`). Agrees.
- Bullet 3: `sed -n 13p .agents/plan.yaml` prints `repair_reviewer: claude:sonnet            # claude:<model> the run of /refute over a repair round runs on: Sonnet, since that run checks a narrow delta against named findings at half Opus's price per token.` `grep -n 'effort' .agents/plan.yaml` prints `10:worker_effort: low ...` and `12:reviewer_effort: low ...`. Agrees.
- Bullet 4: `python3 skills/ordo-init/templates/check_config.py .` prints ten `note:` lines (`worktree_paths`, `review`, `refute_after_repair`, `repair_rounds`, `review_minutes`, `look`, `bench`, `adr`, `design_bar`, `design_references` not set), then `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`; exit 0. The `ok:` line and the exit status agree; the brief does not mention the notes.
- Bullet 5: `cat -n docs/adr/0007-*.md` line 11 holds the decision as the brief quotes it; the title is "0007. The run over a repair round runs on its own reviewer model". Agrees. The Consequences the brief quotes in item 4 stand at line 20 word for word.
- Bullet 6: `grep -il 'fable' docs/adr/*.md` prints nothing (exit 1). The command agrees. The conclusion drawn from it, "No other ADR touches the step", does not hold: see check 6.
- Head line "read on main at cf88a74": agrees.

## 4. Cases and checks

- Item 5 says versions are raised "as `docs/dev/change-standard.md` says". `grep -n -i 'version' docs/dev/change-standard.md` prints nothing. The rule is in `docs/dev/skill-layout.md`, "Frontmatter": "A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0." Two consequences the brief leaves open: which part is raised for `plan-orchestration` (7.0.0) and `plan` (5.0.3), and "once" per plan, while steps 2 and 3 are built at the same time and may change the same skills. Two steps raising the same version line each once break "once" at landing.
- C1 is narrower than the check on the step's line. A sentence such as "no agent runs on Claude Fable" or "an agent runs on Opus or Sonnet only" passes C1.
- C4 is weaker than item 4. Item 4 has the Context's price comparison and the Consequences rewritten; C4 fails only on a line "that says which model Ordo's configuration names", so `docs/adr/0007-...md:7` ("Claude Sonnet 5.5 costs $2 input ...") left as it is passes C4. C4's pass is also a reading of grep output, not a fact the grep computes; the brief's list calls C5 alone "by reading".
- "Verify before you report" 4 gives a character check that allows U+2705 in every file. The repository's check (`docs/dev/change-standard.md`, "Commands and their filters") allows it only in a `.md` file. Rule 6 has the builder run "the repository's character-set check over those files"; the brief's command is looser for `.agents/plan.yaml` and `docs/figures/gen_figures.py`.
- "Report" lists "the cases' first run, then each item ...". Rule 7 puts first "anything NOT DONE, or that everything in the brief is done", then the state file's open items verbatim, then the DONE / NOT DONE table. The brief says "in the shape of `docs/dev/change-standard.md`" and then gives another order; the two do not agree on what comes first.
- "Conventions" says no plan or step name stands in an ADR's text. `docs/adr/0007-...md:16` (Alternatives rejected) reads "No change until the reviewer trial of plan 2.F reports". No item of "What to build" changes that line, and rule 20 keeps the builder from changing what no item asks for. The brief does not say which holds for line 16.
- Paths: item 1 says a changed figure label means both figure scripts run again (`git ls-files docs/figures` shows `gen_figures.py` and `academic-paper-comparison/gen_comparison.py`). The SVG files they write are not in "Paths this step writes", and `skills/repo-setup/templates/plan-terms.md`, which `docs/dev/skill-layout.md` has changed before `docs/glossary.md`, is not either. On the tree as it stands neither is needed (check 1 found no such label and no such glossary sentence), so this bites only if the builder finds one.
- A case that asks the builder to check a place the step does not change: none. `land.test.sh` and `check_config.test.sh` both read the plan skill's templates (`grep -c 'orchestrator-state.md\|plan/templates'` prints 11 and 2), which the step changes. Item 1's reading list names `skills/refute/SKILL.md`, `skills/spec/SKILL.md`, `skills/diagnose/SKILL.md`, `skills/grill/SKILL.md`, `skills/code-comments/SKILL.md`, `README.md`, `docs/glossary.md` and `docs/figures/gen_figures.py`; by the greps of check 1 none of them holds such a sentence, and the reading is the search the step line asks for.
- First runs on the unchanged tree, for the record: C1 prints 3 lines; C2 prints `13:repair_reviewer: claude:sonnet ...`; C3 prints the `ok:` line, exit 0 (it holds before and after, a preserved behaviour); C4 prints lines 7, 11 and 20.

## 5. The question: could this pass without the goal being reached?

- C1: yes. It prints nothing when the three sentences are reworded without "never", and it does not see `skills/writing/SKILL.md`'s opus rule.
- C2: no for `repair_reviewer`. It says nothing of `worker` and `reviewer`, which already hold `claude:fable` (`.agents/plan.yaml:9`, `:11`), and no case fails if a builder changes them.
- C3: yes. It passes on the unchanged tree; it shows only that the file is still valid.
- C4: yes. See check 4: the Sonnet price sentence in the Context passes it.
- C5: yes as worded. "finds no sentence in the skills that says otherwise" is about a builder; a reader who looks for the word Fable passes it while `/writing` still stops on any model that is not of the opus family.
- The check on the step's line (`git grep -n -i 'fable'` read by the reviewer, and the verify list): yes. The lines of `skills/writing/SKILL.md` that keep its agents on opus hold no "fable", so the grep prints no line that keeps an agent off Fable while the agents of `/writing` cannot run on it.
- Item 1: yes for `/writing`, for the reason above, unless the builder rewrites the opus rule and the stop, for which the brief gives no text and which ADRs 0030 and 0035 decide (check 6). No for `plan-orchestration`: the sentence at line 213 must go for the item to be met.
- Item 2: no. The two comments are the only places in the template (`git grep` of check 1).
- Item 3: no for the value. Whether the builder and the reviewers of this plan then run on Fable is shown by the dispatch entries, as the plan's line on step 1 says. The plan's own configuration block still reads `repair_reviewer: claude:sonnet` (`grep -n 'repair_reviewer' .scratch/5-a-*/orchestrator-state.md`, line 41); it is the orchestrator's file, not the builder's, and the brief does not mention it.
- Item 4: not part of the goal's text for step 1; it could be met in the letter (the one sentence removed) with the Sonnet prices left in the Context, which C4 would pass.
- Item 5: yes; a version raised says nothing of the goal.

## 6. ADRs

Read: the status and the decision of every `docs/adr/0*.md` (0001 to 0043; there is no 0015), and `docs/adr/README.md` and `template.md`.

- ADR 0007, "The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`." The step is under it and keeps it. The brief names it. The edit in place agrees with `docs/adr/README.md`: "A refinement that keeps the decision edits the ADR to its current state with no dated note." The record's own Consequences say "A trial that moves the first review to Sonnet as well supersedes this record, since the key then repeats `reviewer`"; with `repair_reviewer: claude:fable` Ordo's key repeats `reviewer`, and the ruling "ADR 0007 holds no configuration value" rules that the decision stays and that sentence goes.
- ADR 0030, in the part standing for `writing`: "`paper` and `writing` read no `.agents/plan.yaml`. Each skill names in its own text the model and the effort of each agent it starts: ... every agent of `writing` runs as `ordo-medium` on opus". The step touches it through the line's "the agents of `/writing` may run on Claude Fable" and item 1's "`/writing` included". The brief does not name it, and its bullet "No other ADR touches the step" contradicts it: the grep for "fable" prints nothing because the ADR says "opus".
- ADR 0035, in the part standing for `writing`: "A served model of the configured model's family, a newer version included, is named ... in `writing`'s line after its report, and the run goes on; a model of another family stays the stop \"A model other than the configured one\"." Same touch, not named by the brief.
- A builder who changes `skills/writing/SKILL.md` so that its agents may run on Fable writes against ADRs 0030 and 0035; a builder who leaves it writes against the step line. By `docs/adr/README.md`, "A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on." The plan's Rulings hold no ruling on `/writing`'s model. The form of the change (a model named in the skill's text, or a key read from a configuration the skill does not read) is a shape rule 4 of the change standard reserves for the user.
- ADR 0006 (the ledger records each agent's served model) and ADR 0008 (the price table; `prices.txt:3` holds `claude-fable-5-2`) are near the step and not changed by it; nothing in the brief contradicts them.
- No other record in force bears on the step.

## 7. Dictated text

The brief gives one piece of text word for word for a file:

- `repair_reviewer: claude:fable` for `.agents/plan.yaml`. `grep -n 'repair_reviewer: claude:fable' .scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/1.md` prints lines 22 (item 3) and 29 (C2). Holds: ASCII, the `claude:<model>` form `check_config.py` accepts (`.agents/plan.yaml:9` and `:11` hold the same value and the check prints `ok:`).

Everything else is given as content, not wording: the sentences of "The two tiers, and the models", the two template comments, the comment of `repair_reviewer` and the rewritten Context and Consequences of ADR 0007. The sentences the brief quotes from ADR 0007 are text to remove.

## Declined to judge

- Whether the goal means `/writing`'s agents to follow a configured model or to name Fable in the skill's own text: the plan does not say, and it is the user's ruling.
- Whether ADR 0007 still improves the product once Ordo's key repeats `reviewer` (rule 23): the ruling in the plan settles it for this step, and no evidence of its effect was gathered here.
- "Verify before you report" 1 to 3 (`check_config.test.sh`, `land.test.sh`, `sync_rules.py . --only glossary`) were not run: they are not commands of "What is on the tree".
- `skills/paper/` was not read for model rules: the goal and the step line do not name `/paper`.
- The files under `skills/*/references/` and `agents/ordo-*.md` were covered by the repository-wide greps of check 1 only, not read in full.
- The prose standard and the glossary were read for the cases only; the brief dictates no prose to hold against them beyond the one configuration line.

Files: `/Users/axelfaes/workspace/ordo/.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/1.md`, `/Users/axelfaes/workspace/ordo/skills/writing/SKILL.md`, `/Users/axelfaes/workspace/ordo/docs/adr/0030-paper-and-writing-name-the-model-and-effort-of-each-agent-and-read-no-plan-configuration.md`, `/Users/axelfaes/workspace/ordo/docs/adr/0035-paper-and-writing-run-their-agents-on-the-default-agent-when-the-effort-agents-are-missing.md`, `/Users/axelfaes/workspace/ordo/docs/adr/0007-the-run-over-a-repair-round-runs-on-its-own-reviewer-model.md`, `/Users/axelfaes/workspace/ordo/docs/dev/skill-layout.md`.

## Usage

aeda38946d35cdd95, claude-fable-5-2, 141446 tokens, 13 tool uses, 200 s
