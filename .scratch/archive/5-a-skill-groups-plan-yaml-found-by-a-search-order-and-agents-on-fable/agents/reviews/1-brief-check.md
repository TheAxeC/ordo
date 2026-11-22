Brief check of step 1, plan 5.A. Read on main at cd05466 (`git rev-parse --short HEAD`). Nothing was changed.

## 1. Names

Hits in files outside "Paths this step writes" that the change makes false.

Command: `git grep -n -i 'code-comments' -- ':!.scratch' ':!skills/code-comments' ':!docs/roadmap.md' | grep -i -E 'reviewer|plan\.yaml|ordo-|effort|model|standards|project|configur'`

- `agents/ordo-low.md:3`, `agents/ordo-high.md:3`, `agents/ordo-xhigh.md:3`, `agents/ordo-max.md:3`: "... `grill` for a lookup agent and `code-comments` for its finding, checking and rewrite agents; it is never chosen for other work." False after item 3.
- `agents/ordo-medium.md:3`: "... `grill` for a lookup agent, `writing` for its review agents and `code-comments` for its finding, checking and rewrite agents ...". False after items 2 and 3.
- `agents/ordo-low.md:6`, `agents/ordo-high.md:6`, `agents/ordo-xhigh.md:6`, `agents/ordo-max.md:6`: "You are an agent that Ordo's skills launch: a builder, a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of `grill`, or a finding agent, a checking agent or a rewrite agent of `code-comments`." False after item 3.
- `agents/ordo-medium.md:6`: the same sentence with "a review agent of `writing`". False after items 2 and 3.
- `skills/plan/templates/plan.yaml:12`: "reviewer: claude:opus  # required. claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the agents of /code-comments run on." False after item 3.
- `skills/plan/templates/plan.yaml:27`: "reviewer_effort: high  # optional, default high. The effort a reviewer, a brief-check agent, a diagnosis agent, a lookup agent of /grill and the agents of /code-comments run at ...". False after item 3.
- `.agents/plan.yaml:11`: "reviewer: claude:fable  # claude:<model> the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill and the agents of /code-comments run on." False after item 3. The brief forbids the fix: item 6 keeps the file and C7 requires `git diff --stat -- .agents/plan.yaml skills/paper` to print nothing. The comment is not a value, so item 6 and the ruling allow the edit; C7 does not.

Hits inside the listed paths that no item of "What to build" names (rule 14 of the change standard reaches them, the brief does not point at them):

- `skills/plan/templates/orchestrator-state.md:14` and `:26`: both comments say "the agents of /code-comments run on" / "run at". Item 1 asks only that the Fable clause goes from lines 13 and 14.
- `docs/glossary.md:104` and `skills/repo-setup/templates/plan-terms.md:99`, entry **reviewer**: "The brief-check agent, the diagnosis agent, the lookup agents of `grill` and the agents of `code-comments` run on `reviewer:`. ... Stated in: ... `code-comments`, Steps 6." The brief's premises name only the entries **diagnosis agent** and **effort agent**.
- `skills/code-comments/SKILL.md:33` and `:340`, the refusal "Unknown project" (`grep -n 'Unknown project' skills/code-comments/SKILL.md`). Item 3 lists the refusals that go and does not name this one; it has no meaning once the `<project>` form goes.
- `README.md:119`: "The plan skills, `grill`, `writing` and `code-comments` launch their agents through five agent definitions ... For the plan skills, `grill` and `code-comments`, `CLAUDE_CODE_EFFORT_LEVEL` must be unset ... `writing` starts its agents as `ordo-medium` when it is listed ...". In paths; item 4 names "the README" only for the refusal, items 2 and 3 do not name it.
- `README.md:72` and `:74`, `docs/figures/gen_figures.py:1872` and `:1893`, `docs/figures/writing.svg:1-2`, `docs/figures/code-comments.svg:1-2`: the stop box "A model other than the configured one, for any of the four" / "for any of the three" (`git grep -n -i 'model other than the configured' -- ':!.scratch'`). In paths; items 2 and 3 do not name the figures or the alt text, only item 4 mentions a figure label.

Not made false: `docs/roadmap.md:26-27` (the entry's own goal and gate), ADR 0003, 0019, 0022, 0025, 0027 (superseded parts, on `paper` or the first `/writing`).

## 2. The step line

- "the rule in `plan-orchestration` ... and the two comments ... removed, with every other sentence, page and figure label that repeats the rule": item 1.
- "`writing` and `code-comments` start their agents as `paper` starts its roles ... and `code-comments` reads no `plan.yaml`": items 2 and 3.
- "when the runner lists no `ordo-<level>` agent ... print a warning that names the missing agent and start the agent the same way, in place of refusing": item 4.
- "ADR 0030 and ADR 0035 edited in place ... and ADR 0007 edited in place so that it names no model as Ordo's value": item 5.
- "the check: ... four greps, each read by the reviewer, and the verify list passes": C1 to C4 and "Verify before you report".
- "(1 commit)": no requirement; it is the landing's.

Requirements with no part of the step line: item 5's last sentence (ADR 0014's Context), item 6's "`paper` is not changed" (the ruling gives only "`repair_reviewer` keeps its value"), item 7 (versions; it comes from `docs/dev/skill-layout.md`, "Frontmatter"), item 5's "No new record is written and none is marked superseded" (in neither the line nor the ruling), and the cases C5, C6 and C7.

No part of the step line is without a requirement.

## 3. Premises

- `grep -n 'configured effort cannot apply' skills/*/SKILL.md`: the brief says it prints `ordo-help` lines 127 and 129. It prints 127 only. Line 129 reads "such as the configured effort that cannot apply (the runner lists no ordo-<level> effort agent the configuration names, or CLAUDE_CODE_EFFORT_LEVEL is set)", which the pattern does not match. The other lines match the brief (`spec` 94, 483; `refute` 54, 196; `plan-orchestration` 55, 452; `code-comments` 74, 345).
- `grep -n -i 'reviewer\|plan.yaml\|standards\|<project>' skills/code-comments/SKILL.md`: the brief lists line 74. The command prints 17, 31, 32, 35, 58, 59, 73, 81, 115, 339, 345 and not 74 ("   - Either check failing is the refusal "The configured effort cannot apply".").
- `grep -n -i 'opus\|ordo-' skills/writing/SKILL.md`: prints 42, 60, 61, 62, 65, 66, 73, 77, 78, 80, 82, 86, 91, 92, 296. The brief's ranges "60 to 66" and "77 to 92" include lines the command does not print (63, 64, 79, 81, 83 to 85, 87 to 90).
- The brief says of `writing`: "the line after the report names the served identifiers and the effort", and item 2 and decision 4 say the line "still" / "keeps" naming the served model. `skills/writing/SKILL.md:91-92` name them only on a condition: "The line also names the effort the agents ran at when they did not start as `ordo-medium`" and "The line also names each served identifier other than the opus identifier of Steps 4". Naming the served model on every run is new behaviour, not kept behaviour.
- The brief says "The ruling "Fable and the session" has both [ADR 0030 and 0035] edited in place for `writing`". The ruling's text in `plan.md` names only ADR 0007. The edit in place of 0030 and 0035 stands in the step 1 line, which is "(approved)".
- The brief says each refusal "has two causes" and that `CLAUDE_CODE_EFFORT_LEVEL` set "stays a refusal as it is". For `grill` neither cause is a refusal today: `skills/grill/SKILL.md:219` "Either check failing does not end the interview: the lookups are made by the session's own reads, and the next round says so with the cause, the missing agent or the variable's value."
- No other difference: `git grep -n -i 'never.*fable\|fable.*never' -- ':!.scratch'` prints the three lines quoted; `plan-orchestration` 209, 210 and 213, `paper` 160, `grill` 218 to 223, `diagnose` 387, the glossary and plan-terms lines, ADR 0007 lines 7, 11 and 20, the decisions of ADR 0030 and 0035, ADR 0014's Context and the README sentence are as the brief says.

## 4. Cases and checks

- C4 asks about places the step does not change and cannot be met as written. `git grep -n -i 'configured effort cannot apply' -- ':!.scratch'` prints `docs/roadmap.md:27` (the gate, which quotes the name) and `docs/adr/0035-...md:7` (Context). C4's second clause, "each line left states the refusal for `CLAUDE_CODE_EFFORT_LEVEL` alone", is false for `docs/roadmap.md:27`, which is not in the paths.
- C7 is inconsistent with rule 14 of the change standard ("A sentence in a document or a head comment that the change makes false is a defect of the change") for `.agents/plan.yaml:11`, as check 1 says.
- Item 7 against `docs/dev/skill-layout.md`, "Frontmatter": "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed." Item 3 removes the call `/code-comments <project> ...` (`skills/code-comments/SKILL.md:17`) and the `standards` key as the first place of the prose standard (line 35), and the brief gives `code-comments` the second part. Whether a `projects:` configuration counts as "the default keys" decides it; the brief does not say. For `writing`, item 2 changes the line after the report on every run, which is output; the brief gives it the second part too.
- Conventions say "move no file, rename no folder", and item 5 says for ADR 0007 that "its title, number and status stay". For ADR 0030 and 0035 the brief says nothing of title or status, and `docs/adr/README.md` is in the paths. After item 2 the title of 0030 ("Paper and writing name the model and effort of each agent ...") and of 0035 ("Paper and writing run their agents on the default agent when the effort agents are missing, and go on under a newer model of the configured family") is false for `writing`, and both status lines end "the part for `writing` standing". An ADR's file name is its title, so a new title is a renamed file. The brief leaves the builder to choose.
- Conventions say "No history, date, plan, step or ruling name in ... an ADR's text". The three ADRs to edit hold such names today (0007 line 16 "plan 2.F", line 20 "entry 2.E.A ... plan 2.E"; 0030 and 0035 status lines "superseded by the ruling ... of plan 5"; 0035 line 7 "open item BN (a)"). The brief does not say whether the edit removes them or only adds none; rule 20 ("Nothing is changed that no brief item asks for") pulls the other way.
- "Verify before you report" names no check of the `description` length that `docs/dev/skill-layout.md` sets (at most 1,024 characters, with its `python3` command), while item 3 changes the frontmatter description of `code-comments`.

## 5. The question

Could this pass without the goal being reached? Yes for:

- C2: `grep -n -i -E 'opus|ordo-'` prints nothing for a `writing` that still sets the Agent tool's `effort` to `medium` (today's line 62 wording without the agent's name), still names another model, or still stops on a served model. Only the reviewer's verdict on item 2 catches it.
- C3: the first grep is for `plan.yaml` only. A `code-comments` that still lists three places for the prose standard, still has the "Unknown project" refusal (lines 33 and 340) or still raises "A model other than the configured one" (lines 84, 117, 338) passes both halves.
- C4: it does not print `skills/ordo-help/SKILL.md:129` ("the configured effort that cannot apply"), nor `skills/grill/SKILL.md:219` or `skills/diagnose/SKILL.md:387-389`, which state the check without the refusal's name. C5 covers `grill` and `diagnose` by reading; no case covers `ordo-help:129`, `README.md:119`, the two glossary entries or a figure label.
- C6: `grep -n -i 'sonnet'` does not print the sentence of line 20 "Each second review costs about half as much per token.", which argues from Sonnet's price without the word, nor "The cost script of entry 2.E.A measures the difference against plan 2.E.".
- C7: it shows only that two paths are unchanged.
- Item 1, "Nothing is said twice between the lines on the orchestrator and on the agents", and the sentence the section must now hold: no case; C1 passes with the Fable clause deleted and nothing else done.
- Item 2, the line after the report naming the served model: no case.
- Item 3, the prose standard's two places, the frontmatter description and the Quick start: no case beyond C3's grep.
- Item 4, the `CLAUDE_CODE_EFFORT_LEVEL` cause kept, the served model still recorded, and "A model other than the configured one" not raised after the warning: C5 asks only for the warning, what it names and the agent started.
- Item 5 for ADR 0030, 0035 and 0014: no case reads them.
- Item 7: no case reads a version.
- Nothing covers the `agents/ordo-*.md` files and `skills/plan/templates/plan.yaml` of check 1.

## 6. ADRs

Decisions of all 44 records read (`awk '/^## Decision/{p=1;next} /^## /{p=0} p'` over `docs/adr/[0-9]*.md`). Records other than 0007, 0014, 0030 and 0035 whose decision governs something the step changes:

- 0001 (status "proposed; superseded by 0030 in the `standards` key"): "`/writing` and the skills that read the writing base read the prose standard where it is: the page the repository's `standards` key lists, or `docs/dev/prose-standard.md`, and in a repository with neither, the `repo-setup` skill's `templates/docs/dev/prose-standard.md`." Item 3 drops the `standards` place for `code-comments`. ADR 0030 supersedes that key for `paper` and `writing` only, and no record says `code-comments` reads no configuration. Item 5 says "No new record is written"; rule 5 of the change standard asks for "the ADR that owns the decision when the change touches one". The brief names no record that will hold this decision.
- 0006: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model". Item 4 keeps it ("its served model is recorded where the skill records it today"). No contradiction.
- 0013 (four fresh read-only agents review a draft): its decision names no model or effort. No contradiction.

A part of the brief that contradicts a record in force beyond what the ruling settles: item 5 keeps ADR 0007's decision, whose last sentence is "The served-model check applies to it as to every agent.", while item 4 lifts that check for an agent started after the warning. The brief does not say whether that sentence is reworded.

## 7. Dictated text

The brief dictates no line of text word for word for any file. It quotes only text to remove and names to keep.

## Declined to judge

- Whether `writing`, `code-comments` or ADR 0007, 0030 and 0035 should change, as instructed.
- Whether the paths of this step overlap those of steps 2 and 3, which are in flight at the same time; that comparison is the orchestrator's.
- Whether the warning's wording will read well; the brief gives its content, not its text.
- Whether Fable as `worker` and `reviewer` in `.agents/plan.yaml` (lines 9 and 11) is the intended current state; it is on the tree and the brief does not touch it.

Agent usage: a3baabc725c3d4805, claude-fable-5-2, 136624 tokens, 17 tool uses, 3.8 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1, the `agents/ordo-*.md` files, the two comments of `skills/plan/templates/plan.yaml` and the comment of `.agents/plan.yaml:11`: named in items 2 and 3 of "What to build", added to "Paths this step writes"; C7 now allows the comment and no value.
- 1, the comments of `orchestrator-state.md` 14 and 26, the glossary entry **reviewer**, the refusal "Unknown project", `README.md:119`, `:72` and `:74` and the two figures: named in "What is on the tree" and in items 2 and 3.
- 2, requirements with no part of the step line: item 5's sentence on ADR 0014 now rests on finding 6 (ADR 0001); the others are kept, each a rule of the standards or of the ruling's "edited in place".
- 3, `ordo-help` 129, the line lists of `code-comments` and `writing`: corrected in "What is on the tree".
- 3, the line after the report of `writing`: item 2 now removes the two conditional parts and adds nothing; decision 4 on that line removed.
- 3, the ruling and ADR 0030 and 0035: the premise now names the plan's step line.
- 3, `grill` refuses for neither cause today: the premise corrected, item 4 states `grill` apart, decision 4.
- 4, C4 and the roadmap's line: C4 is run on the skills, the README, the agents, the glossary and `docs/dev`, and matches the wording of `ordo-help` 129.
- 4, C7 against rule 14: closed with finding 1.
- 4, the version part: item 7 and decision 7.
- 4, the titles and status lines of ADR 0030 and 0035: item 5 and decision 6.
- 4, the plan and entry names the ADRs hold: item 5 says they are left where the step does not touch the sentence.
- 4, the description length: check 5 of "Verify before you report".
- 5, cases that could pass without the goal: C3 widened, C5 widened, C6 widened, C8, C9 and C10 added, item 1 states what the section must read as.
- 6, ADR 0001 and `code-comments`: named in "What is on the tree"; item 5 has ADR 0014 state the decision, decision 5.
- 6, the last decision sentence of ADR 0007 beside item 4: item 5 words it.
- 7: no dictated text; none added.
