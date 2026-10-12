Brief check of step 2 of plan 2.F, the diagnose skill wired in

I checked `.scratch/2-f-diagnose/agents/briefs/2.md` as it stands on disk (uncommitted) against main at a88ccf336cad74a6f34b3fe74c5266a49b7ef1aa. The repository's own `skills/spec/SKILL.md` differs from `~/.claude/skills/spec/SKILL.md` (`git diff --no-index --stat` shows 6 insertions and 27 deletions). The repository copy adds an **ADRs** check, so I ran that check as well. `ls docs/adr` prints only `README.md` and `template.md`, so there are no ADR records to test the brief against. I changed nothing in the repository. The only scratch files are a copy of `docs/figures` under the session scratchpad, which I used to regenerate the figure and to try longer labels.

## 1. Names

Command: `git grep -n -E "plan-retro|ordo-help" -- ':!.scratch' ':!*.svg'`, plus the greps quoted under each finding.

1. **`skills/diagnose/SKILL.md` points back at text that item 1 rewrites. This file is not in the step's paths.**
   - Line 141: "Inside a plan, a cause not found is raised to the user as an open item, as `plan-orchestration`'s "Only known fixes" says."
   - Line 181: "... as `plan-orchestration`'s "Only known fixes" says a cause is noted at landing."
   - Line 232: "... so `plan-orchestration`'s rule that a finding whose cause is not known is diagnosed read-only holds."
   - Item 1 asks for "a cause not found is raised as `/diagnose` raises it", and asks that the bullets "say nothing `diagnose` already says". The case at brief line 41 requires the sentence "diagnosed by the orchestrator, read-only" to be gone.
   - After that change, line 141 and "Only known fixes" point at each other, and neither says which row of "Stops" the open item is. Line 181 is made false if "Such a cause is noted at landing" is dropped. That bullet moves to `land` Steps 9 under item 3.
   - The booking rule would then be written twice: in `diagnose` Steps 23 and in `land` Steps 9. That breaks `docs/dev/skill-layout.md` "Where a rule goes" ("A rule is written once").
   - Needed: `skills/diagnose/SKILL.md` added to the paths, Steps 23 changed to point at `land` Steps 9, lines 141 and 232 kept true, and a case for each of the three lines.

2. **`skills/repo-setup/templates/docs/glossary.md:3` is false now, and step 2 does not correct it.** It reads: "The terms the plan skills, `roadmap`, `grill`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below". `diagnose`'s seven terms now stand in that block (`grep -n diagnose docs/glossary.md` gives 7 lines), and `diagnose` is not named. This sentence is outside the plan-terms block, so the sync command does not compare it.

3. **Glossary entries in `skills/repo-setup/templates/plan-terms.md` that list their contents.**
   - **booking** (line 9) lists what the booking holds: "what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, ...". Item 3 adds the diagnosis records to the booking, so this list becomes incomplete.
   - **Step 0** (line 97) holds "a stop's open item, the failure a red line recorded at landing, and a ruled step's carried premises". Item 2 and `diagnose` Steps 20 also put the cause, the fix and the record's path there.
   - The brief writes `plan-terms.md` and `docs/glossary.md` "only when item 8 adds a term", and says none is expected. Both entries need changing. Rule 14 of the change standard makes each an error of the change.

4. **The plan-loop figure's own title and aria-label.** `docs/figures/gen_figures.py:537-541` is the Canvas description, written into `plan-loop.svg` as `<title>` and `aria-label`. It is the same text as the README alt text at `README.md:54`. Item 7 changes only the README alt text, so the two would no longer match.

5. **Places whose skill lists would now leave `diagnose` out. These are incomplete rather than false; the orchestrator decides.**
   - `README.md:7` lists the skills "around that loop".
   - `ordo-help`'s description reads "(open, spec, build, refute, close, land, and the loop inside a step)".
   - The glossary term **plan skills** (`docs/glossary.md:65`), `skills/ordo-init/SKILL.md:10` and the `.agents/plan.yaml:1` comment each list six skills. `diagnose` reads `.agents/plan.yaml` and the ledger inside a plan.

6. **A shared path in a later plan.** `.scratch/2-h-session-retro/plan.md:29` (2.H step 3) also writes the README skill table, the Quick start, the install loop, and `ordo-help`'s sequence and "Use instead". That step is not in flight: `git worktree list` shows only `2g-1`. The column-width choice in section 4 finding 1 also binds that step.

## 2. The step line

The step line is `plan.md:22`. The rulings are "Step 1, the terms moved from step 2", "Step 1, where a diagnosis is booked" and "Step 2, the neighbours and the figure".

| Part of the line or ruling | Brief item |
|---|---|
| `plan-orchestration` Steps 8 rule points at `/diagnose` | 1 |
| README skill table, Quick start and install loop | 6 |
| `ordo-help` sequence and "Use instead" | 5 |
| New terms synced | 8 (moved to step 1 by ruling) |
| Check: each changed text read, and the sync exits 0 | Cases, and Verify 2 |
| `land` Steps 9, the booking | 3 |
| "Use instead" of `plan-orchestration`, `land` and `refute`; the figure and its alt text | 2, 3, 4, 7 |

Findings:

1. **Item 2's change to `plan-orchestration` Steps 9 has no authority.** The change is the pointer for a red line whose cause is not known. No part of the line and no ruling names it. The ruling "Step 2, the neighbours and the figure" names only the "Use instead" tables and the figure. The ruling "where a diagnosis is booked" names "Only known fixes" and `land` Steps 9. Decision 1 cites the neighbours ruling, which does not cover Steps 9. Either the ruling's text or the brief's Decisions should name it.

2. **An open item names step 2 as its destination, and the brief does not mention it.** The state file's open item "A script for the person-driven red command" ends: "A yes adds it to step 2, whose paths widen to the script and its test." The brief should say that this item is open and not part of this build. It should also say whether step 2 waits for Axel's ruling or lands without the script.

## 3. Premises

| Premise | Command | Result |
|---|---|---|
| Step 2's line | `grep -n "^- 2 The skill wired in" .scratch/2-f-diagnose/plan.md` | line 22; text matches |
| The seven terms landed | `grep -n "diagnose" docs/glossary.md` | 7 lines (20, 21, 33, 47, 70, 76, 97); holds |
| `diagnose` invocations, record, Steps 20 and 23 | `cat -n skills/diagnose/SKILL.md` | as the brief says |
| `plan-orchestration` "Only known fixes" | `sed -n 99,105p` | "Only known fixes" at 99, the quoted sentence at 100; holds |
| `plan-orchestration` Steps 9 and "Use instead" | line reads | Steps 9 at 111-117 and "Use instead" at 22-28; holds |
| `land` Steps 9, "Use instead" and Steps 6 | line reads | Steps 9 at 87-91, "Use instead" at 20-24; Steps 6 red line: see finding 1 |
| `refute` "Use instead" | line read | 20-25; holds |
| `ordo-help` "Use instead" and the sequence | line reads | "Use instead" at 19-25; the sequence heading is at line 45 and its fence at 47-80, against the brief's 44-80 |
| README table, Quick start, alt text | `cat -n README.md` | table 11-23 with no `diagnose` row, Quick start 25-44, alt text 54; holds |
| Install loop is the only hit | `git grep -n "grill land ordo-help"` | `README.md:94`, plus 7 hits in `.scratch/2-e-grill` ledger files; see finding 3 |
| `utils/pin.sh` finds skills from the tag | line read | line 304, `tag_skills=... sed -n 's#^skills/\([^/]*\)/SKILL\.md$#\1#p'`; holds |
| The figure's "close them" box | line read | `gen_figures.py` 579-584; holds |
| How figures are made | line read | `docs/dev/building.md` 28-30; holds |
| Regenerating changes nothing | `python3` and `/usr/bin/python3 docs/figures/gen_figures.py` on a scratchpad copy, then `cmp` | both exit 0; `plan-loop.svg` and `pipeline.svg` equal the committed files |
| ruff passes on `gen_figures.py` | `ruff check ...` and `ruff format --check ...` on main | "All checks passed!" and "1 file already formatted", rc=0 |
| Sync passes | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | `ok: the plan-terms block equals the template`, rc=0 |
| Skill versions | `git log -p -1 -- skills/ordo-help/SKILL.md` | the last commit (ff656b6) has no version line; see finding 2 |

Findings:

1. **The Steps 6 red-line range is too narrow.** In `land`, Steps 6's red-line bullets run from line 66 to line 81, not 68-76. Lines 66-67 are the red line fixed inside the brief, which is "named in the booking with its cause". Lines 77-81 cover the step kept and prepared again by `/spec`. Item 3 needs both parts.

2. **The version premise is half true, and Decision 3 rests on it.** The command `git log -G '^  version: "' -- skills` shows two different practices:
   - The 2.D landings raised versions: a9f7c86 raised `land` 1.8.1 to 1.8.2, `plan-orchestration` 2.9.0 to 2.10.0, and `spec` 1.6.3 to 1.7.0, and 3d97dbe, fd66f44, 5e7ec90 and ac10380 also changed version lines.
   - The 2.E landings (6119d03, 6c51194, 983754e, db9bbec) did not raise versions.
   - No ruling on versions exists: grepping `.scratch` plan files for version rulings finds none.
   - The brief should state both practices and give its reason for choosing one.

3. **The install-loop hits.** "`git grep -n "grill land ordo-help"` finds only that line" holds only outside `.scratch`. Written with `-- ':!.scratch'`, it would be exact.

## 4. Cases and checks

1. **The column-form case (brief line 38) cannot hold as written.**
   - Every command in the `ordo-help` sequence ends at column 30 (a perl scan of lines 48-79 prints `30` for every command line). The longest command is `/plan-orchestration <entry>`, 27 characters.
   - `/diagnose <entry> <step> <finding>` is 34 characters (`printf ... | wc -c`), so it cannot fit.
   - The README Quick start uses the same 30-column form.
   - The brief has to choose: widen the column on every line of both blocks, or put the command on a line of its own. Either choice is a format applied across the tree, and the `spec` skill's Steps 4 asks that such a choice be tried on five real cases.

2. **The figure stop's qualifier does not fit the box.**
   - Item 7 adds "`diagnose`'s "The hypotheses" (when you run it by hand)" to the "close them" box.
   - On a scratchpad copy, the label "The hypotheses, when you run /diagnose by hand" gives `error: plan-loop.svg: box 'close them': the label 'The hypotheses, when you run /diagnose by hand' does not fit the box`, rc=1. "The hypotheses" alone fits, rc=0.
   - Without the qualifier, the figure's band text ("Only the stops marked in these two figures ... reach you") says the hypotheses reach the user under `plan-orchestration`. `diagnose` Steps 8 and Rules say they do not.
   - Item 7 also takes one of `diagnose`'s five stops and leaves out the rest, including "The cause not found". The script's docstring says every label is taken from each skill's Stops table.
   - The brief should decide where the qualifier goes (the body sentence or a note) and which stops the box shows.

3. **Placement is left to the builder in four places.** The brief template puts such choices in the brief.
   - Item 5 places the new line "after the `/refute` line", but the sequence has two `/refute` lines (59 and 61).
   - Item 5 does not place the `/diagnose <symptom>` line.
   - Item 6's "the `/diagnose` line of item 5" could mean any of item 5's three lines.
   - Item 2's `plan-orchestration` "Use instead" row gives `/diagnose <entry> <step> <finding>` for "a finding or a red line". The form for a red line is `/diagnose <entry> <step> red line`.

4. **No case checks that the places naming the changed text still hold.** Rule 14 (a change carries to every place that names it) and rule 19 (no two statements contradict each other) call for such cases: the three `diagnose` lines in Names finding 1, the glossary's **booking** and **Step 0** entries, and the SVG title.

5. Every other case agrees with the change standard, `docs/dev/skill-layout.md` and the prose standard: "Use instead" as a table with When and Use, one rule per bullet, ASCII, no history.

## 5. The question

"The goal" for this step is `plan-orchestration`'s rule for a finding whose cause is not known pointing at `diagnose`, and the booking that reaches "the cause written in the booking".

- **The step's check.** Yes, it could pass without the goal. The sync already prints `ok` on the unchanged tree (rc=0 above), so it proves nothing about this step. "Each changed text read in place" reads only the places that changed, so it would miss places that should have changed and did not: Names findings 1 to 3 and section 6.
- **The "Only known fixes" case (brief line 35).** No. It reads the pointer and the kept builder rule.
- **The red-line and booking case (line 36).** No for the booking in `land`. It does not check that `spec` takes the cause from Step 0 (section 6).
- **The "Use instead" case (line 37).** It could pass with a wrong form in a row (section 4 finding 3), but it does not bear on the goal.
- **The column case (line 38).** It cannot pass as written (section 4 finding 1).
- **The README row and loop case (line 39).** No, `sed -n 94p` shows the loop line.
- **The figure case (line 40).** Its exit-0 part passes on the unchanged tree; the reading of the render is what checks it.
- **The old-sentence case (line 41).** Yes on its own: deleting the sentence passes it. Only with line 35 does it check the goal.
- **The sync case (line 42).** Yes, it already passes.
- **The layout case (line 43).** No for the texts it reads. It reads only the changed skills, not `diagnose`, which the change can make false.
- **Items 1 to 8.** Each is checked only by the reading above. Items 1 and 3 reach the goal only if `diagnose` lines 141, 181 and 232 stay true, and no case reads them.

## 6. Implied inputs and places

This is a text step. The command was `git grep -n -i -E "cause is not known|cause not known|cause it cannot find|does not reproduce|seen once|flaky|find why|red line" -- skills README.md docs ':!skills/diagnose' ...`, followed by reads of each hit.

1. **`skills/spec/SKILL.md` "What it reads" 4 (line 47) and Steps 4 (line 117).** Line 117: "For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure." `diagnose` Steps 20 and item 2 put the cause, the fix and the record's path in Step 0 "for `/spec` to carry into the step's new brief". `spec` does not say it carries them, so a diagnosed red line's cause can fail to reach the new brief. The step does not write `spec`.

2. **`skills/spec/SKILL.md` Steps 4, lines 112-114.** They read: "An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only ... A cause it cannot find is left out of the brief." This is a cause not known, met by `/spec`, and no pointer is wired to it.

3. **`skills/spec/SKILL.md` "Steps / The brief check" 4, and the `ordo-help` line "/spec stops".** `/diagnose <entry> <step> brief check <n>`, one of `diagnose`'s four invocations, is reached from nowhere: the brief wires no text to it.

4. **`plan-orchestration` "Stops".** "Only known fixes" raises a cause not found "by "Stops"", and no row of the table names it. It may fit "A finding that is the user's". Item 1's pointer to `/diagnose` for how the item is raised does not resolve this, because `diagnose` points back (Names finding 1).

5. **The pipeline figure.** Its "AT ANY POINT" region (`gen_figures.py` about 506-520) holds `/ordo-help`. Item 5 adds `/diagnose <symptom>`, a command outside a plan, to the sequence, and `docs/dev/building.md:28` says a change to the sequence changes the labels. The brief should say whether the pipeline figure gains `/diagnose` and give the reason, along with the README pipeline alt text at line 50.

6. **README line 7.** The introduction lists every skill outside the loop and leaves out `diagnose`.

7. **Covered, no finding.** `land` Steps 6 (lines 69-81) and its Stops row "A red line for the user" are reached through item 3's "Use instead" row and item 5's red-line line.

## Declined to judge

- Whether `diagnose` is a "plan skill", and so whether the glossary **plan skills** entry, `ordo-init:10` and `.agents/plan.yaml:1` change. It is a vocabulary question, which is the user's.
- Whether findings 1 and 2 of section 2 and the widenings in Names findings 1 to 3 and section 6 items 1 to 3 stay inside the step's scope (the orchestrator closes them in the brief) or change it (a stop). The rulings' pattern ("a skill wired in is reached from every neighbour where a cause is not known") suggests inside, but that ruling is the orchestrator's.
- Whether to raise skill versions. The history is mixed and no rule or ruling settles it.
- I did not check the wording quality of the text still to be written.

## Usage

About 40 tool calls in this session. I cannot see my own token count or elapsed time; the completion notice carries them.

Agent usage: 163352 tokens, 49 tool uses, 420 s (agent aa8ec600489819d0b, claude-opus-5-5, $1.78-4.81).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1.1 `diagnose`'s pointers: `skills/diagnose/SKILL.md` is in the paths; item 6 keeps `:141` true with the Stops row named, moves the booking rule to `land` Steps 9 with Steps 23 pointing at it, and keeps `:232` true; a case reads the three places.
- 1.2 The glossary template's line 3: item 10 adds `diagnose` to it and to `docs/glossary.md`'s same line.
- 1.3 **booking** and **Step 0**: item 10 changes both in `plan-terms.md` and syncs them.
- 1.4 The figure's title: item 9 makes both figure descriptions equal their README alt texts, and a case compares them.
- 1.5 The skill lists: `README.md:7` and `ordo-help`'s description name `diagnose` (items 8 and 7); **plan skills**, `ordo-init:10` and `plan.yaml:1` stay, since `diagnose` runs no plan (Decisions 4).
- 1.6 2.H step 3: named in the premises; it follows the form this step sets.
- 2.1 `plan-orchestration` Steps 9: the Rulings line "Step 2, the places a cause not known is met" names it.
- 2.2 The person-driven script: Decisions 7 says it is not built here, and the open item now says a yes adds it as a step.
- 3.1 `land` Steps 6: the premise gives `:66-81`, both parts, and item 3 books a red line fixed at landing whose cause was diagnosed.
- 3.2 Versions: the premise states both practices, and Decisions 5 gives the reason for no change.
- 3.3 The loop grep: written with `-- ':!.scratch'`.
- 4.1 The column: Decisions 2 puts a long command on its own line with its text at column 31, and item 7 gives each line exactly.
- 4.2 The figure stops: item 9 names the stops of the `/diagnose` box and the "close them" box without the qualifier that did not fit, and says a label that does not fit is shortened or its box enlarged.
- 4.3 Placement: item 7 places each line, and item 2's row gives the three forms.
- 4.4 and 5: the cases read the places that name the changed text, and the check that the booking rule is written once.
- 6.1 `spec` `:117`: item 5.
- 6.2 `spec` `:112-114`: Decisions 6 and the open item "The investigation of /spec and /diagnose".
- 6.3 `spec` "The brief check" 4 and `ordo-help`: items 5 and 7.
- 6.4 The Stops row: item 1 names "A finding that is the user's".
- 6.5 The pipeline figure: item 9 adds the `/diagnose` box, and item 8 the alt text.
- 6.6 `README.md:7`: item 8.
- Declined, versions and plan skills: Decisions 5 and 4.
