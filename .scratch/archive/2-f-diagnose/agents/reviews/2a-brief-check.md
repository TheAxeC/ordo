# Step 2a brief check (on main at b16268a)

This is the report of the fresh agent run by the `spec` skill's "Steps / The brief check" on `.scratch/2-f-diagnose/agents/briefs/2a.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a grep hit keeps its `file:line`. `git rev-parse HEAD` printed `b16268a1f3aee6eddc8b38568535073d81ca12cc`, and `git status --short` printed only `?? .scratch/2-f-diagnose/agents/briefs/2a.md`. Nothing was written and no git state was changed.

## 1. Names

- **The script, its test, the reference file and their descriptions** (`person-driven`, "actions file", "observations file", "diagnosis agent", "No part to investigate"): `for p in 'person-driven' 'person drives' 'diagnosis agent' 'No part to investigate' 'observations file' 'actions file'; do git grep -n -i "$p" -- skills docs README.md utils agents; done`. The only hits are `skills/diagnose/SKILL.md:213` and `:223` (for "person drives"), and that file is in the paths. No hit outside the paths.
- **Step 0**: `git grep -n "Step 0" -- skills docs README.md | grep -i 'diagnos\|cause'` has hits only in paths: `docs/glossary.md:119`, `skills/diagnose/SKILL.md:48,182,233`, `skills/ordo-help/SKILL.md:92`, `skills/plan-orchestration/SKILL.md:147`, `skills/repo-setup/templates/plan-terms.md:114` and `skills/spec/SKILL.md:138`. No hit outside the paths.
- **The form `premise` and the glossary term premise**: `git grep -n -w 'premise' -- skills docs README.md`, filtered to exclude the paths, hits `docs/dev/change-standard.md:30`, `docs/figures/gen_figures.py:589,702`, `docs/figures/plan-loop.svg:15,150`, `skills/plan-orchestration/references/self-rule.md:16`, `skills/refute/SKILL.md:112`, `skills/repo-setup/templates/docs/dev/change-standard.md:30`, `skills/repo-setup/templates/shared-rules.md:20` and `skills/spec/templates/brief-check.md:21`. Every one of these uses the glossary sense and none is made false. Inside the paths, though, `grep -n '\*\*premise\*\*' docs/glossary.md` gives `81:- **premise**: a claim a step's text makes about the tree (a count, a path, a name, a line number), checked by /spec with a grep or a probe. Stated in: spec, "What it reads" 5 and Steps 2.` The new form names a claim about behaviour ("X happens") that `/diagnose` checks with a red command. That sense is not in the entry, and no item of "What to build" changes the entry in `plan-terms.md`.
- **The kinds of agent that run on `reviewer:` and at `reviewer_effort`**: I ran item 16's grep, `git grep -n -e '/diagnose' -e 'brief-check agent' -- README.md skills docs`, and also `grep -n 'reviewer' skills/plan/templates/plan.yaml skills/plan/templates/plan.projects.yaml .agents/plan.yaml skills/plan/templates/orchestrator-state.md`. These hits fall outside the paths:
  - `skills/plan/templates/plan.yaml:12` `reviewer: claude:opus  # required. claude:<model> the first run of /refute, the brief check and the lookups of /grill run on.` The change makes this false, since the diagnosis agent runs on this model too.
  - `skills/plan/templates/plan.yaml:27` `... The effort a reviewer, a brief-check agent and a lookup agent of /grill run at: ...` The change makes this false.
  - `skills/plan/templates/orchestrator-state.md:14` (the `reviewer:` comment) and `:27` (the `reviewer_effort:` comment). The change makes both false.
  - `.agents/plan.yaml:10` has the same `reviewer:` comment and is made false. This is the user's configuration: under self-rule, a change to it is kind 3 of `references/self-rule.md`, "The six kinds left open", so it is an open item, not a builder's edit.
  - `.scratch/2-i-several-plans-in-one-session/orchestrator-state.md:38` and `.scratch/3-the-writing-base/orchestrator-state.md:38` have the `reviewer_effort` comment. These are other plans' ledgers and belong to the orchestrator.
  - Item 16 says "A file of item 16 outside this list is named in the report, not changed", so the brief as written lands with these lines false.
- **The dispatch key `diagnosis`**: `git grep -n 'reviewer_report' -- skills docs README.md utils` hits `skills/plan/templates/orchestrator-state.md:34`, which lists the keys the orchestrator adds (`session_id`, `builders_before`, `builder_usage`, `reviewer_report`). `diagnosis` is missing from that list, which makes it false, and the file is outside the paths. The same grep hits `docs/glossary.md:41` and `skills/repo-setup/templates/plan-terms.md:36`, the **dispatch entry** term, which lists the same keys. Those are inside the paths, but no item asks for the change, and item 16's grep does not hit them.
- **The diagnosis agent as a numbered item in the Agents section**: `grep -n -A6 '## Agents' skills/plan/templates/plan.md` gives `36:Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; /land writes a step's agents at its booking and when it takes a step back out of main, /grill writes ..., /spec writes ..., and /plan copies ...`. The change makes this false, and the file is outside the paths. The glossary term **Agents section** (`docs/glossary.md:11`, "one bullet per agent a plan skill started for the entry") is inside the paths but no item changes it. `git grep -n -i 'no role the cost script\|numbered item' -- skills docs README.md` prints nothing, so no skill text or template defines the heading that item 13 puts the item under.
- **`metadata.version` (item 14)**: `plan-terms.md` is a template of the `repo-setup` skill, so the step changes that skill. `skills/repo-setup/SKILL.md`, where its version lives, is not in "Paths this step writes". If the `plan` templates above are widened in, `skills/plan/SKILL.md` needs adding as well.

Findings:
- `skills/plan/templates/plan.yaml:12`, `:27`, `skills/plan/templates/orchestrator-state.md:14`, `:27` and `.agents/plan.yaml:10` are made false (they leave out the diagnosis agent), and item 16 leaves them unchanged.
- `skills/plan/templates/orchestrator-state.md:34` is made false (no `diagnosis` key).
- `skills/plan/templates/plan.md:36` is made false (one bullet per agent).
- The glossary terms **dispatch entry**, **Agents section** and **premise** are in the paths, are made false or incomplete, and no item asks for them to change.
- `skills/repo-setup/SKILL.md` is missing from the paths, although item 14 requires raising its version.

## 2. The step line

- "the person-driven red command's script `skills/diagnose/templates/person-driven.sh` and its test" is served by items 1, 2, 3 and 6.
- "`diagnose` pointing at it, as the ruling 'A script for the person-driven red command' says" is served by items 4 and 5.
- "`/diagnose <entry> <step> premise`" is served by items 7 and 8.
- "`spec` Steps 4 pointing at it" is served by item 9.
- "with `ordo-help`'s sequence and the glossary where they name the forms" is served by items 10 and 12.
- "as the ruling 'The investigation of /spec and /diagnose' says" is served by part B, items 7 to 12.
- "inside a plan with no person present, `/diagnose` run in a fresh agent as the ruling 'Who runs /diagnose inside a plan' says" is served by item 13.
- "with `plan-orchestration`'s Steps 8 and 9, 'The two tiers, and the models' and the glossary naming the diagnosis agent" is served by item 13 (the bullets on where it is stated and the new glossary term).
- "briefed against `spec` and `plan-orchestration` as plan 2.E.A leaves them" is served by "What is on the tree", read at b16268a. That holds for every line reference I reran (see 3).
- "check: the script's test, each case failing on the unchanged tree, and each changed text read in place against its ruling" is served by "Cases" (the first run, the mutation table), Verify 2, 6 and 8.
- The ruling "Steps by part" (wiring, terms and documentation in the step that builds the thing) is served by items 6, 12, 13 (glossary), 15 and 16.

Findings: none.

## 3. Premises

- **The four rulings**: `grep -n -E '^- (A script for|The investigation of|Who runs /diagnose|Steps by part)' .scratch/2-f-diagnose/plan.md` hits lines 43, 44, 46 and 48. Matches.
- **The first ruling's computation, quoted**: plan.md line 43 holds "it prints each action of a list given to it, reads the user's line of observation after each, and writes the actions and observations into a file for the diagnosis record". Matches word for word.
- **The diagnose folder**: `ls skills/diagnose skills/diagnose/templates` prints `SKILL.md templates` and `diagnosis.md`. `wc -l` prints `259 skills/diagnose/SKILL.md` and `106 .../diagnosis.md`. `version: "1.1.0"` is at line 5. `ls skills/diagnose/references` gives "No such file or directory", and so does `person-driven.sh`. Matches.
- **The diagnose SKILL.md line references**: I ran `sed -n` on lines 176-185, 213, 217, 223 and 251, and an `awk` column check on lines 15-18, which printed `44` four times. Item 11 is at 213, the Stops row at 223, the Quick start forms at 15-18 with their text in column 44, "What it reads" at 31-49 with five items, Steps 20 at 176-185 with four hand-overs, the Stops opening at 217 and the Rules at 251. Matches.
- **The description, line 3**: it holds the quoted sentence. Matches.
- **`spec` line 133 and its sub-bullets**: `sed -n '133,135p' skills/spec/SKILL.md` prints the item and its two sub-bullets. `grep -rn 'find why' skills docs README.md` gives only `skills/spec/SKILL.md:133`. Matches.
- **`plan-orchestration`**: `grep -n 'Only known fixes\|A round never asks\|red line whose cause is not known\|probes read-only'` gives 124, 125, 130 and 147. Line 28 is the "Use instead" row. Running `sed -n '/^## The two tiers/,/^## Resuming/p'` shows three kinds of agent. Matches.
- **`ordo-help`**: the sequence block has `/spec <entry> <step>` at line 67, the `brief check <n>` form at 68-69 and the `<finding>` form at 72-73. The column check printed `col 31` for the text lines. Matches.
- **The glossary**: `grep -n 'Step 0\*\*'` gives `plan-terms.md:114` and `docs/glossary.md:119`. `grep -n -i diagnos skills/repo-setup/templates/plan-terms.md` finds no entry that names an agent. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Matches.
- **`building.md` and the rules file's command block**: `cat docs/dev/building.md` shows one `sh` block with `git_guard.test.sh` at line 10, and its last paragraph says what the brief says. `grep -n -A16 '## Commands and their filters' docs/dev/change-standard.md` shows each test line ending `2>&1 | tail -1`. Matches.
- **`plan_cost.py`**: `grep -n -E '_KINDS|unknown role'` gives `115:_KINDS = ("builder", "brief check", "reviewer", "reviewer over a round", "grill lookup")` and `238: errors.append(f"agent {agent_id} has an unknown role: {role}")`. Line 18 of the head comment lists the five kinds. The numbered items appear in `.scratch/2-f-diagnose/plan.md` under "Agents in no role the cost script prices:". Matches for this plan. This is one plan's practice, though: no skill text or template states it (see 1).
- **The figures**: `grep -n -i diagnos docs/figures/gen_figures.py` gives 6, 421, 543, 545, 553, 569, 615 and 621. Matches.
- **The versions**: spec is at `2.0.0` and plan-orchestration at `3.0.0`, which matches. The brief says "last raised by plan 2.E.A step 12". `git show 4c5ec5a -- skills/spec/SKILL.md skills/plan-orchestration/SKILL.md | grep '^[-+].*version'` prints `-1.9.0 +2.0.0` and `-2.11.0 +3.0.0`. Commit 4c5ec5a is "Land step 12c of plan 2.E.A, steps by part", so the last raise was step 12c, not step 12 (b1af081). This does not change the step.
- **The test shape**: `wc -l` shows `checks.test.sh` is the shortest at 118 lines. Its head, `fail()`, `mktemp -d "${TMPDIR:-/tmp}/checks-test.XXXXXX"`, `trap`, the `script_dir` resolution and the `PASS: checks.sh scratch tests` last line all match.
- **`read` and `[ -e ]`**:
  - Under both `dash` and `sh`, `printf '  a\\b  ' | dash -c 'IFS= read -r x; ...'` prints `status=1 x=[  a\b  ]`, and with a newline it prints `status=0 x=[  a\b  ]`. Matches.
  - On the existing dangling link `/usr/local/bin/python3.13t`, `[ -e ]` exits 1 and `[ -L ]` exits 0 under both shells. Matches.
  - "An append through it creates the target" was not rerun, because it writes a file.
- **The ADRs**: `ls docs/adr` lists 0001 to 0012, README.md and template.md. That matches. The claim "No ADR in force touches this step" is false:
  - ADR 0006 and ADR 0010 touch the step (see 7).
  - The claim "0012's decision ... is proposed, not in force" contradicts the glossary term **ADR**, which says "A record is in force, `proposed` or `accepted`, except for the part ... superseded".

Findings:
- "last raised by plan 2.E.A step 12": the last raise was step 12c (4c5ec5a).
- "No ADR in force touches this step" is false (0006 and 0010).
- "proposed, not in force" contradicts the glossary's **ADR** entry.
- The premise on numbered Agents items holds for `.scratch/2-f-diagnose/plan.md` only. Item 13 writes it into skill text as if a template defined it.

## 4. Cases and checks

- C1 to C14 are consistent with the rules file's rule 13 (each case has one mutation and the table) and rule 15 (a directory where a file is expected: C9, C10; an empty value: C7, C11; supplied text reaching generated text: C3; a path with a space: C4).
- The line "Wrong numbers of arguments have no case" is consistent with "Scripts compute facts; judgment is read" (a test only where a wrong answer costs something).
- The skip notes for C10 as root and C1 without `dash` are consistent with rule 9 ("A green result states, in the same breath, what it does not cover").
- R1 to R5 are reading cases, consistent with rule 1. W1 to W10 are walks read after the change, consistent with the brief template.
- Decision 7 says "actions file" and "observations file" are not glossary terms "since no other skill uses them". This is inconsistent with the opening of `docs/glossary.md` ("defines each term that the Ordo skills ... use in a sense of their own") and with `docs/dev/skill-layout.md`, "Writing for an agent" (a skill that needs a new term adds its entry first). Item 4 puts both names into `diagnose`'s Stops row. The glossary already holds single-skill terms: **shrunk case** (only `diagnose`) and **working folder** (only `session-retro`).
- Item 9 keeps the investigation in `spec` Steps 4. With `premise` it can now end in a stop: a cause not found ("a step with no other item stops there"), or a false premise the plan cannot absorb (W6, "/spec handles a false premise by its Steps 2"). Two texts conflict with that placement:
  - `docs/dev/skill-layout.md`, "Lists and tables": "A step that can refuse or stop comes before every step that writes, drafts or commits what the refusal or stop guards".
  - `spec`, "Steps / A stop" 2: "No brief, no worktree and no dispatch block exist for the stopped step".
  - Steps 4 is where the brief is written, and Steps 2 has already run when Steps 4 reaches the item.
- Item 3 says "the skill quotes the observations file whole in the record". This sits beside `diagnose` "Rules", "A captured artifact is quoted only in the lines that carry the symptom". The brief does not say whether an observations file counts as a captured artifact. The rules file's rule 19 asks that no two statements contradict each other.
- "Verify before you report" lacks item 5 of `skills/spec/templates/brief.md`, "Verify before you report" (each new or changed list item and sentence read against the standards' rules on list items and sentence length, each departure named). The brief's "Each new sentence follows the prose standard" is a requirement with no check.

Findings:
- Decision 7 is inconsistent with the glossary's scope and with skill-layout, "Writing for an agent".
- The `premise` investigation stays in `spec` Steps 4 although it can now stop. That breaks skill-layout, "Lists and tables", and `spec` "Steps / A stop" 2.
- The whole-file quote of the observations file sits beside `diagnose`'s rule on captured artifacts, and the brief does not say which applies.
- The template's Verify item 5 is missing.

## 5. The question

The goal part the step delivers is the rest of the `diagnose` skill: the person-driven red command, the investigation form, and the diagnosis run in a fresh agent inside a plan, with `plan-orchestration` pointing at it.

- **The step line's check** ("the script's test, each case failing on the unchanged tree, and each changed text read in place"): No. On the unchanged tree every case fails only because the script is missing. The brief closes that gap with one mutation per case (Verify 8), and the texts are read by walks.
- **C1 to C14**: No for each. Every case compares output or files whole, or checks exit, stderr and the absence of the file, and has a mutation it must catch.
- **R1 to R5**: No. They are baselines read on the unchanged tree.
- **Item 1 (the script)**: No, because of the test, the mutations and the head-comment rule.
- **Item 2 (the test)**: No, because of the mutation table.
- **Item 3 (the reference)**: Yes, in part. It requires both files in "the diagnosis's scratch folder `$tmp` of Steps 3". But `diagnose` Steps 3 makes `$tmp` in the bullets for a scratch copy, and "Outside a plan, the probes run in the user's checkout". A person-driven red command is always run by a person and often on the checkout, so `$tmp` may not exist. W10 passes on paper.
- **Items 4, 5, 6 and 10**: No. Each is read in place, and item 6 also has Verify 5.
- **Item 7 (`premise`)**: Yes, in part.
  - The "No part to investigate" refusal has to sit in Steps 1, before Steps 2 opens the record. Steps 1 reads "refuse when 'What it reads' 3 or 5 finds an input missing", and item 7's grep (`step's worktree\|dispatch entry\|report\|finding\|the round\|builder`) does not hit that line, so Steps 1 can be left unchanged.
  - A `premise` run on a step not in `plan.md`'s list has no refusal named.
- **Decision 9 and W1 (premise by hand)**: Yes. A by-hand `/diagnose ... premise` writes Step 0 in `plan.md` and the record, uncommitted. A `/spec` in another session then refuses at its Steps 1 ("An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal"). W1 passes when it is read as one session.
- **Items 8 and 9 (the test carried into the brief)**: Yes, in part. Item 9 has the diagnosis's test become "a case with its failing run". The record template's "Fix and test" keeps only "the test's command and its failing output" and the fix's diff, not the test's source. Steps 22 removes the scratch copy, so after that the test's text is gone.
- **Item 9 and W5 (cause not found)**: Yes. `diagnose` Steps 15 raises the cause not found as an open item, and item 9 keeps `spec`'s sub-bullet "Such a cause is raised to the user as an open item". Read literally, that is two open items for one cause, and W5's "The two texts agree" can be judged true on that reading.
- **Item 11**: No. It is read in place.
- **Item 12**: No. The sync check cannot see content, but the term is read under report part 6.
- **Item 13 and W7 (recording the agent)**: Yes, in part.
  - The id, model and usage are recorded "in the dispatch entry ... for a step in flight". For `brief check <n>` and `premise` no dispatch entry exists yet, and a `/spec` that stops never writes one.
  - For `red line`, the diagnosis runs after the back-out. `land` Steps 6 books the step's agents at the back-out "since `/spec` later removes the step's dispatch entry" (`skills/land/SKILL.md:82`), and `spec`'s "A step taken back out of main" 5 removes the entry. A `diagnosis` record written there is lost.
  - A diagnosis agent stopped for another model has no recording named.
  - W7 walks only the `<finding>` form, so it passes while the other forms leave the agent unrecorded, against ADR 0006.
- **Item 13, last place bullet**: Yes. "`skills/land/SKILL.md` Steps 9 only if its booking text needs the agent's usage named" lets `land` stay unchanged. Lines 96-103 read usage only from `builder_usage`, `reviewer_report` and `brief_check` and write only bullets, so the booking cannot carry the diagnosis agent without a change.
- **Item 14**: Yes. No skill is named and no check is given. `repo-setup` (through `plan-terms.md`) can be missed, and its `SKILL.md` is not in the paths.
- **Item 15**: No. It is either a figure change or a grep quoted in the report.
- **Item 16**: Yes, in part. Its grep misses the lines in 1 that name agent kinds or dispatch keys without the words "brief-check agent", and it leaves out-of-path hits false.
- **W2, W3, W4, W8 and W9**: No. Each is read against the changed text.
- **W6**: Yes. "/spec handles a false premise by its Steps 2" while `/spec` is already at Steps 4 (see 4).

Findings: items 3, 7, 8 and 9, 13, 14 and 16, decision 9 with W1, W5 and W6, as above.

## 6. Implied inputs

These are in "Cases": a missing, directory or unreadable actions file (C10), an empty or blank-only actions file (C11), blank lines between actions (C2), a last action line with no newline (C14), supplied text reaching output and the file (C3), paths with a space (C4), input ending early (C5, C6), blank observations (C7), a last input line with no newline (C8), an existing observations path (C9), a missing folder (C12) and a failing append (C13). Wrong argument counts are stated with the reason they have no case.

These are missing:
- **A relative path**: the rules file's rule 15 names "a relative and an absolute path", and "What the script must do" 9 states a relative path is taken from the start folder. Expected: run from a scratch folder as `sh <script> actions.txt obs.txt`, exit 0, and `obs.txt` in that folder holds the pairs.
- **A path that starts with a dash**: stated in "What the script must do" 9, with no case. Expected: `-obs.txt` given as the observations file gives exit 0 and the file `./-obs.txt` written. An actions file named `-a.txt` is read.
- **An empty path argument** (`""`) for either file: rule 15 weighs "an empty value". Expected: exit 64 with `person-driven: cannot read the actions file ` or `person-driven: cannot write the observations file `, and no file created.
- **An observations folder that exists but is not writable**: refusal 4 names it, but C12 tests only a missing folder. Expected: with `chmod 555` on the folder (skipped with a note as root), exit 64, `person-driven: cannot write the observations file <path>`, and no `Action` text on standard output.
- **Standard output closed early**: the brief template's "Cases" asks for "its output closed early". The case is the script run with `>&-` or into a pipe whose reader exits. Expected: the brief should fix the behaviour. I would suggest exit 1 with one error line, and no pair appended for an action that was never shown.
- **An interrupt or hangup mid-run** (Ctrl-C, terminal closed): head comment item 10 lists exits 0, 1 and 64 only. Expected: the pairs already written are kept whole with no half pair, the exit is the shell's 128+n, and the head comment names it, as rule 14 asks for every exit status.

Findings: the six inputs above are missing from "Cases".

## 7. ADRs

- **0001** (the writing base reads the prose standard where it is): does not touch the step.
- **0002** (the prose standard holds over the academic sources): does not touch the step.
- **0003** (a fresh read-only agent reviews a draft): governs `/writing` and does not touch the step. The brief says the same.
- **0004** (a self-rule decision ends "(self-rule)"): touches the `premise` form at its edge. Its decision is "/spec, /plan and /grill accept it wherever they accept '(the user)'", and `premise` reads "the rulings its tags name" in a plan under `self_rule: on`. The brief does not say the tags are resolved as `spec`'s "What it reads" 4 resolves them, "(self-rule)" endings included. There is no contradiction. The brief does not name 0004.
- **0005** (the choices file): does not touch the step.
- **0006** (the ledger records every agent's id with its role): touches item 13. Its decision: "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model ... The landing booking copies the ids into `plan.md`." Its consequence: "A skill added later that starts an agent records its id and role." Item 13 follows it for a step in flight but leaves the red-line, brief-check, premise and stopped-agent cases unrecorded (see 5). The brief does not name 0006.
- **0007** (the run over a repair round's reviewer model): does not touch the step. The diagnosis agent is no run of `/refute`.
- **0008 and 0009** (the cost script's price table and response bodies): do not touch the step. Decision 10 leaves the script's roles unchanged.
- **0010** (each plan's verify list is kept equal to the verification page): touches item 6, which adds a command to the verification page. Its decision is "/spec at its preflight, and /land before it runs the verify list, compare the plan's verify list with the verification page's commands ... the session rewrites the list in the state file". Item 6 ("the verify lists of the open plans' state files are the orchestrator's, changed at landing") agrees with it. The brief does not name 0010.
- **0011** (each plan keeps its own dispatch block): does not touch the step. A new key goes in each plan's own block.
- **0012** (every commit on main names its paths): does not touch the step, which writes no commit command. The brief's reason, that it is "proposed, not in force", contradicts the glossary's **ADR** entry.

Findings:
- ADR 0006 and ADR 0010 touch the step and are not named under "What is on the tree".
- Item 13 leaves the agents of the red-line, brief-check and premise forms (and a stopped agent) unrecorded, against 0006's decision.
- The brief's "proposed, not in force" contradicts the glossary's definition of in force.

## 8. Dictated text

- `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`: found by `grep -n 'sh <the diagnose skill.s folder>/templates/person-driven.sh' 2a.md` (32). Holds.
- `observations-<n>.txt`: `grep -n 'observations-<n>.txt'` (32). Holds.
- `sh skills/diagnose/templates/person-driven.test.sh` (`building.md`): `grep -n 'person-driven.test.sh` with'` (35). Holds. Its comment is not dictated.
- `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1`: `grep -n 'person-driven.test.sh 2>&1 | tail -1` directly'` (35). Holds.
- The Quick start line `/diagnose <entry> <step> premise`: `grep -n 'as a fifth line'` (40). Holds.
- "its finding or quotes its part": `grep -n 'its finding or quotes its part'` (42, 49). Holds.
- The Stops row "No part to investigate": `grep -n 'No part to investigate'` (46, 127). Holds, as a noun-phrase label.
- "carried by the brief as its check": `grep -n 'carried by the brief as its check'` (49). Holds.
- The `ordo-help` line `/diagnose <entry> <step> premise` and "(when the step's text asks for a cause to be found: `/spec` runs it while it writes the brief, or you run it first; the cause goes to the step's Step 0 and into the brief)": `grep -n 'with its text from column 31 on the next line'` (51). Holds.
- `<n>. <agent id>: diagnosis of step <k>, <served model>`: `grep -n '<n>. <agent id>: diagnosis of step'` (61). Breaks `docs/dev/skill-layout.md`, "Writing for an agent" (a glossary term used only in its sense), against **Agents section** ("one bullet per agent ..., `- <agent id>: <role>, <served model>`"), unless that entry changes too. It also names a heading no template defines.
- The dispatch key `diagnosis`: `grep -n 'as `diagnosis` for a step'` (61). Holds as a key. It needs the **dispatch entry** term changed (see 1).
- The term **diagnosis agent**: `grep -n 'A new glossary term \*\*diagnosis agent\*\*'` (63). Holds.
- `person-driven: usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`: `grep -n 'person-driven: usage:'` (77). Holds.
- `person-driven: cannot read the actions file <path>`: `grep -n 'cannot read the actions file'` (79, 105). Holds.
- `person-driven: the actions file <path> holds no action`: `grep -n 'holds no action'` (80, 106). Holds.
- `person-driven: the observations file <path> exists; name a new file`: `grep -n 'exists; name a new file'` (81, 104). Holds. It is one line, not running prose, under prose standard B.
- `person-driven: cannot write the observations file <path>`: `grep -n 'cannot write the observations file <path>`\.$'` (82). Holds.
- `Action <n> of <m>: <text>`: `grep -n 'Action <n> of <m>: <text>'` (84). Holds.
- `What did you observe? (one line) `: `grep -n 'What did you observe'` (84). Holds. It is a real prompt, not a rhetorical question (prose standard E).
- `person-driven: type what you observed`: `grep -n 'type what you observed`'` (85, 102). Holds.
- `person-driven: the input ended after observation <k> of <m>`: `grep -n 'the input ended after observation <k>'` (86). Holds.
- `Action <n>: <text>` and `Observed: <line>`: `grep -n 'the lines `Action <n>: <text>`'` (87). Holds.
- `person-driven: wrote <m> of <m> actions, each with its observation, to the observations file <path>`: `grep -n 'wrote <m> of <m> actions'` (88). Holds.
- `PASS: person-driven.sh scratch tests`: `grep -n 'PASS: person-driven.sh scratch tests`\.$'` (198, 207). Holds.

Findings: the numbered Agents item breaks skill-layout, "Writing for an agent", against the glossary's **Agents section**, while that entry stands as it is.

## Declined to judge

- Whether the form keeps the name `premise`. Axel's ruling "The investigation of /spec and /diagnose" names it. I report only that the glossary entry **premise** does not cover the sense.
- Whether `.agents/plan.yaml:10` should change. It is the user's configuration, and under self-rule it is kind 3 of "The six kinds left open".
- The premise "an append through [a dangling link] creates the target", and C13's reliance on a 255-byte name limit. Checking either writes a file, and this check changes nothing.
- How severe the missing implied inputs are beyond what is stated. Whether a wrong answer on a closed standard output or an interrupt costs enough for a test is the session's call under "Scripts compute facts; judgment is read".

Agent usage: a95b4d847166098ec, claude-opus-5-5, 253095 tokens, 66 tool uses, 12.7 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1, the `plan` templates, the glossary terms and `skills/repo-setup/SKILL.md`: "What is on the tree" names the lines; item 13 changes `skills/plan/templates/plan.yaml`, `plan.projects.yaml`, `orchestrator-state.md` and `plan.md` and the terms **Agents section** and **dispatch entry**; item 12 gives **premise** its second sense; "Paths this step writes" adds the four templates, `skills/plan/SKILL.md` and `skills/repo-setup/SKILL.md`. `.agents/plan.yaml:10` is the user's configuration, kind 3: the orchestrator raises it as an open item; the other plans' state-file comments are the orchestrator's, updated with it.
- 1, the dispatch key `diagnosis`: removed; the agent is recorded in the Agents section and the record's head (item 13).
- 3, "step 12": corrected to step 12c, commit 4c5ec5a.
- 3 and 7, the ADRs: "What is on the tree" names 0004, 0006 and 0010 with their decisions, and states in force as the glossary's **ADR** does; 0012 is named as governing commit commands, which the step does not write.
- 3, the numbered Agents items held in one plan only: item 13 changes the plan template and the **Agents section** term to state the heading.
- 4, decision 7: "actions file" and "observations file" become glossary terms (item 12, decision 7).
- 4 and 5, the investigation in `spec` Steps 4: moved into Steps 2 (item 9, decision 12); W5 and W6 rewritten.
- 4, the captured-artifact rule: item 3 states the observations file is the red command's own output, quoted whole.
- 4, the missing list and sentence check: "Verify before you report" 9.
- 5, item 3's `$tmp`: a run with no scratch copy makes `$tmp` for the two files with the same command.
- 5, item 7's refusals: a step not in the list and a text with no part are refused at Steps 1, before the record opens; the Stops row names both.
- 5, decision 9 with W1: run by a person outside `/spec`, the record and Step 0 are committed by path at once (item 7, Steps 20); W12 added.
- 5, items 8 and 9, the test's source: "Fix and test" holds it for `premise` (item 8).
- 5, W5, two open items: `spec` Steps 2 raises no second item (item 9).
- 5, item 13's recording: every form records its agent in the Agents section at its start, a stopped one too; `land` Steps 9 books the usage from the record and is changed (item 13); W11 added.
- 5, item 14: the skills are named and Verify 10 checks one raise each.
- 5, item 16: its grep widened to the words that name agent kinds and dispatch keys; the files it hit are in the paths.
- 6, the six implied inputs: C15 to C20 added; "What the script must do" gains 9a (standard output closed) and the 128+n status in 10.
- 8, the numbered Agents item against **Agents section**: the term and the plan template change with it (item 13).
