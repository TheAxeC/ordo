Everything in the brief is done, with one premise of item 10 impossible as written: `docs/glossary.md` line 3 names no skills, so there was no list there to add `diagnose` to (evidence under "Wrong or impossible in the brief"). The template's line 3 carries `diagnose`.

# Report of step 2 of plan 2.F, the diagnose skill wired in

## Open items of 2.F's state file, verbatim


- Step 1 reading (2026-09-30): step 1, the `diagnose` skill, landed unticked, since its check is your reading of `skills/diagnose/SKILL.md` and `templates/diagnosis.md` against `docs/dev/skill-layout.md` and the Goal's six parts (ruling "Overnight work applies to this plan"). Options: (a) you read it and tick step 1, or name what is wrong; (b) tick it unread. Recommendation (a). The lazy option is (b).
- A script for the person-driven red command (2026-09-30, step 1's review): `diagnosing-bugs` ships `scripts/hitl-loop.template.sh`, a loop that prints each action for the user and reads back what they saw; `diagnose` describes that red command in words only, and the review names it as a point `diagnosing-bugs` would win in step 4's blind comparison. Options: (a) a template script `skills/diagnose/templates/person-driven.sh` that computes only this: it prints each action of a list given to it, reads the user's line of observation after each, and writes the actions and observations into a file for the record; pros: the point is covered and the loop is the same each time; cons: a new script and its test. (b) The words only; pros: nothing to maintain; cons: the comparison point stays open. Recommendation (a). The lazy option is (b). Step 2 is built without it; a yes adds it as a step by your ruling.
- The investigation of /spec and /diagnose (2026-09-30, step 2's brief check): `spec` Steps 4 has the session writing a brief investigate a "find why X happens" item read-only; `/diagnose <symptom>` probes in the checkout, so the two are not wired together. Options: (a) a step gives `diagnose` a form for that investigation, `/diagnose <entry> <step> premise`, probing on a scratch copy at main's head as its brief-check form does, and `spec` Steps 4 points at it; pros: the investigation gets the red command, the hypotheses and the record; cons: a fifth invocation. (b) The investigation stays as `spec` says. Recommendation (a). The lazy option is (b).


## The cases, first reading on the unchanged tree (before any change)

Commands run from the worktree root on the tree at base 48551f8, before any file changed.

- Case 1, "Only known fixes": `grep -n "diagnose" skills/plan-orchestration/SKILL.md` printed only line 100, "... is diagnosed by the orchestrator, read-only, before the round is sent."; no `/diagnose`, no `round <n>`, no Stops row named at :104. `grep -rn "diagnosed by the orchestrator, read-only" skills` printed that one line. "A round never asks the builder to find a cause" is at :105. Does not hold yet, as the brief says.
- Case 2, red line, booking and Step 0: `grep -n "/diagnose" skills/land/SKILL.md skills/spec/SKILL.md skills/refute/SKILL.md skills/ordo-help/SKILL.md README.md` printed nothing. Does not hold yet.
- Case 3, places that name the changed text: `:141`, Steps 23 and `:232` of `diagnose` read as the brief quotes them. The glossary's **booking** and **Step 0** lacked the diagnosis records and the red line's cause. `sed -n 3p skills/repo-setup/templates/docs/glossary.md | grep -c diagnose` printed 0. `sed -n 3p docs/glossary.md | grep -c diagnose` printed 0, and that line names no skills at all (it introduces the block and the sync command). `grep -o '<title>[^<]*' docs/figures/*.svg` against `sed -n '50p;54p' README.md`: both figures' titles differed from the alt texts. Does not hold yet.
- Case 4, the booking rule once: `grep -n "diagnosis record" skills/*/SKILL.md` printed 3 lines, all in `diagnose` (description, the introduction paragraph, Steps 2), none in `land`. Does not hold yet.
- Case 5, "Use instead" tables: the four tables read; each row's When is distinct within its table. No `/diagnose` row yet in `plan-orchestration`, `land`, `refute` or `ordo-help`.
- Case 6, the sequence's column: a perl scan over the fence printed `  23 31`, that is 23 lines whose text starts at column 31. The four `/diagnose` lines are absent.
- Case 7, README: `sed -n 94p README.md` printed the loop from `grill`, with no `diagnose`; no `diagnose` row in the table.
- Case 8, figures: `python3 docs/figures/gen_figures.py` printed `wrote docs/figures/pipeline.svg (25910 bytes)` and `wrote docs/figures/plan-loop.svg (28613 bytes)`, rc=0; `cmp` of the pipeline SVG against the committed copy: identical.
- Case 9, sync: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, rc=0.
- Case 10, layout: read against `docs/dev/skill-layout.md`; no rule of the brief's cases gives a wrong result on the unchanged tree, so no stop was needed. The one premise that fails is the second half of item 10 (see below), which is an item premise, not a case rule; by change standard rule 4 the rest of the brief landed.

## DONE / NOT DONE

| # | Item or check | Command that proves it | Output | State |
|---|---|---|---|---|
| 1 | `plan-orchestration` "Only known fixes" | `grep -rn "diagnosed by the orchestrator, read-only" skills` | (empty) | DONE |
| 2 | `plan-orchestration` Steps 9 bullet and "Use instead" row | `grep -n "diagnose" skills/plan-orchestration/SKILL.md` | lines 28, 101, 118 hold the row, the Only known fixes bullet and the red-line bullet | DONE |
| 3 | `land` Steps 9 bullets and "Use instead" row | `grep -n "diagnos" skills/land/SKILL.md` | lines 24, 92, 93 | DONE |
| 4 | `refute` "Use instead" row | `grep -n "/diagnose" skills/refute/SKILL.md` | line 23 | DONE |
| 5 | `spec` Steps 4 and "The brief check" 4 | `grep -n "/diagnose" skills/spec/SKILL.md` | lines 117, 252 | DONE |
| 6 | `diagnose` :141 and Steps 23; :232 left true | diff below | see "Changed lines" | DONE |
| 7 | `ordo-help` description, row, four sequence places | perl column scan of the fence | `  24 31`: 24 lines start their text at column 31; the three `/diagnose` commands (36, 35 and 32 characters, the last with its text at 31) as given | DONE |
| 8 | README places | `grep -n "diagnose" README.md` | lines 7, 20, 40, 47, 54, 58, 98 | DONE |
| 9 | figures | see below | see below | DONE |
| 10 | terms | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` after `--write` | `ok: the plan-terms block equals the template` | DONE for **booking**, **Step 0** and the template's line 3; the `docs/glossary.md` line 3 half is impossible as written |

Figures, each command and its output:

```
$ python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (28161 bytes)
wrote docs/figures/plan-loop.svg (30454 bytes)
$ cp docs/figures/*.svg $TMPDIR/ ; /usr/bin/python3 docs/figures/gen_figures.py ; cmp docs/figures/pipeline.svg $TMPDIR/pipeline.svg ; cmp docs/figures/plan-loop.svg $TMPDIR/plan-loop.svg
wrote docs/figures/pipeline.svg (28161 bytes)
wrote docs/figures/plan-loop.svg (30454 bytes)
(cmp printed nothing for both: same bytes)
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py
All checks passed!   (rc=0)
$ ruff format --check --line-length 100 --target-version py39 docs/figures/gen_figures.py
1 file already formatted   (rc=0)
```

Title and aria-label against the README alt texts (a `diff` of `grep -o '<title>[^<]*'` and of `grep -o 'aria-label="[^"]*'` against the alt text of README lines 54 and 58): `pipeline-equal`, `planloop-equal`, `aria1`, `aria2`, all four identical.

Renders: `rsvg-convert docs/figures/pipeline.svg -o $TMPDIR/pipeline.png` and the same for `plan-loop.svg`, both read as images. What I saw: pipeline.png shows the row of three dashed boxes under "AFTER PLANS HAVE RUN" and "AT ANY POINT": /plan-retro, /ordo-help and a new /diagnose box with the text "The cause of a defect, from a command red on it, before any fix.", a dashed "optional" pill, an "only when" badge and the stops "The hypotheses" and "The cause not found", all inside the box, the legend below unchanged. plan-loop.png shows the "close them" box with the body "A repair round: fix the findings, rerun, rewrite the report. A finding whose cause is not known goes through /diagnose first." and under "only when" the two stops "A contradiction of an ADR the brief asked for" and "A cause not found, from /diagnose", all inside the box, which is now taller; the other five boxes of the row share the new height, the return arrow, the cards, the band and the legend sit below with no overlap.

Verify list 1, verbatim from `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"`:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
rc=0
```

Verify list 4, `LC_ALL=C grep -n '[^ -~]'` over `skills/plan-orchestration/SKILL.md skills/land/SKILL.md skills/refute/SKILL.md skills/spec/SKILL.md skills/diagnose/SKILL.md skills/ordo-help/SKILL.md README.md docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg skills/repo-setup/templates/plan-terms.md skills/repo-setup/templates/docs/glossary.md docs/glossary.md`: printed nothing, rc=1 (grep found no match).

Case readings after the change:

- "Only known fixes" (lines 99-106 of `plan-orchestration`): names `/diagnose <entry> <step> <finding>`, `round <n>`, the Stops row "A finding that is the user's", keeps "A round never asks the builder to find a cause" (line 106).
- The booking rule once: `grep -n "diagnosis record" skills/*/SKILL.md` prints `land` line 92 (the rule), `spec` line 117 (a pointer: the brief carries the record's path), and three lines of `diagnose` that use the term for its own record (its description, its introduction, Steps 2, where the record is opened). `diagnose` Steps 23 now points at `land` Steps 9 and states no booking rule.
- `diagnose` :232 unchanged and still true: item 1's bullet says the diagnosis probes read-only and leaves the step's worktree unchanged.
- Each "Use instead" table reread: plan-orchestration's new row says "diagnosed by hand" for three forms; land's says a red line, once the step is out of main; refute's says a finding; ordo-help's says a defect and gives the outside-plan and inside-plan forms; `diagnose`'s own table is unchanged. Each When differs from the other rows of its table.
- Skill layout: description lengths by the layout's own command: refute 951, roadmap 997, spec 1022 (unchanged), ordo-help 396 (was 386 before the word), all at most 1,024. No double blank lines in any changed Markdown file.

## Changed lines, before and after

Each block is `diff` of the copy taken before the change (`<`) against the file now (`>`).

### skills/plan-orchestration/SKILL.md

```
27a28
> | A finding, a red line or a brief-check finding whose cause is not known, diagnosed by hand | `/diagnose <entry> <step> <finding>`, `red line` or `brief check <n>` |
100c101
<      - A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent.
---
>      - A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed, before the round is sent, with `/diagnose <entry> <step> <finding>` (`round <n>` before the name for a finding of the run over repair round <n>), which probes read-only on a scratch copy and leaves the step's worktree unchanged.
103,104c104,105
<      - Such a cause is noted at landing.
<      - Such a cause is raised to the user as an open item, by "Stops".
---
>      - Such a cause is noted at landing, as the `land` skill's Steps 9 says.
>      - Such a cause is raised to the user as an open item, the row "A finding that is the user's" of "Stops".
116a118
>    - A red line whose cause is not known is diagnosed with `/diagnose <entry> <step> red line` once the step is out of main, and its cause goes into the step's Step 0 for `/spec`.
```

### skills/land/SKILL.md

```
23a24
> | A red line whose cause is not known, once the step is taken back out of main | `/diagnose <entry> <step> red line` |
90a92,93
>    - It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause, or with "cause not found" and the open item it was raised as.
>    - A red line fixed at landing whose cause was diagnosed names its record the same way.
```

### skills/refute/SKILL.md

```
22a23
> | A finding whose cause is not known | `/diagnose <entry> <step> <finding>` |
```

### skills/spec/SKILL.md

```
117c117
<    - For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure.
---
>    - For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure and, when `/diagnose` wrote them into Step 0, the cause, the fix and the diagnosis record's path.
251a252
>    - A finding whose cause is not known is diagnosed with `/diagnose <entry> <step> brief check <n>` before it is closed in the brief.
```

### skills/diagnose/SKILL.md

```
141c141
<     - Inside a plan, a cause not found is raised to the user as an open item, as `plan-orchestration`'s "Only known fixes" says.
---
>     - Inside a plan, a cause not found is raised to the user as an open item, the one `plan-orchestration`'s "Stops" row "A finding that is the user's" leaves.
181c181
<     - Inside a plan, the orchestrator's booking at the step's landing names the record's path and states its cause, or states that the cause was not found and names the open item it was raised as, as `plan-orchestration`'s "Only known fixes" says a cause is noted at landing.
---
>     - Inside a plan, the orchestrator books the record at the step's landing, as the `land` skill's Steps 9 says.
```

### skills/ordo-help/SKILL.md

```
3c3
< description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
---
> description: "Print the command sequence for running a plan step by step (open, spec, build, refute, diagnose, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
24a25
> | A defect whose cause is not known | `/diagnose <symptom>`, or inside a plan `/diagnose <entry> <step> <finding>` |
57a59,60
> /diagnose <entry> <step> brief check <n>
>                               when a finding of the brief check has a cause not known: finds the cause on a scratch copy before the finding is closed in the brief
59a63,64
> /diagnose <entry> <step> <finding>
>                               when a finding's cause is not known: finds it on a scratch copy before "close them", its fix and test then the round's ruling; round <n> Spec 1 names a finding of the run over repair round <n>
75c80
< /land meets a red line        a red line no fix inside the brief closes: the step goes back out of main. Its failure is recorded in its Step 0 in plan.md. /spec that step again when it comes up, with no new ruling. When only you can decide what to do, /spec it after your ruling. /spec saves its work as a patch and prepares it again from main's head
---
> /land meets a red line        a red line no fix inside the brief closes: the step goes back out of main. Its failure is recorded in its Step 0 in plan.md. /spec that step again when it comes up, with no new ruling. When only you can decide what to do, /spec it after your ruling. /spec saves its work as a patch and prepares it again from main's head When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main, and writes it in the step's Step 0.
79a85
> /diagnose <symptom>           at any time, outside a plan: the cause of a defect, from a command red on it, before any fix
```

### README.md

```
7c7
< Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, `grill` settles an entry's design decisions before its plan opens, and `plan-retro` turns what the reviewers keep finding into rules.
---
> Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, `grill` settles an entry's design decisions before its plan opens, `diagnose` finds the cause of a defect, inside a plan's loop or on its own, and `plan-retro` turns what the reviewers keep finding into rules.
19a20
> | `diagnose` | Finds the cause of a defect before anything is changed. It runs one command red on the exact symptom, shrinks the case, ranks three to five hypotheses, makes one change per probe, and writes the fix with its test and a diagnosis record. Inside a plan it probes on a scratch copy and leaves the step's worktree unchanged; run by a person it waits for the reply to the hypotheses |
38a40,41
> /diagnose <entry> <step> <finding>
>                               optional: when a finding's cause is not known, finds it before "close them"
43a47
> /diagnose <symptom>           at any time, outside a plan: the cause of a defect, from a command red on it, before any fix
50c54
< ![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)
---
> ![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)
54c58
< ![The loop of one step as boxes in order: /spec, build it, /refute, close them, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)
---
> ![The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)
94c98
<     for skill in grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
---
>     for skill in diagnose grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
```

### skills/repo-setup/templates/plan-terms.md

```
9c9
< - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
---
> - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the diagnosis records with their causes, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
97c97
< - **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6.
---
> - **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, a red line's cause found by `/diagnose`, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6; `diagnose`, Steps 20.
```

### skills/repo-setup/templates/docs/glossary.md

```
3c3
< This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
---
> This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `diagnose`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
```

### docs/glossary.md

```
14c14
< - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
---
> - **booking**: the record `/land` appends to `plan.md` for a landed step, holding what landed and where, the premise corrections, the findings raised as open items, the diagnosis records with their causes, the verification lines, the A/B, each agent's usage, whether the first report passed its bar and the fixes at landing. Stated in: `land`, Steps 9. To book is also to record a decision in the ledger, as a ruling or a stop is booked. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops". A booking is also a later item recorded in place of doing the work now, the lazy option. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option".
102c102
< - **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6.
---
> - **Step 0**: the place under a step in `plan.md` that holds what the plan carries to the step: a stop's open item, the failure a red line recorded at landing, a red line's cause found by `/diagnose`, and a ruled step's carried premises. Stated in: `spec`, "Steps / A stop" and "Steps / A ruling"; `land`, Steps 6; `diagnose`, Steps 20.
```

### docs/figures/gen_figures.py

```
6c6
<   with /plan-retro and /ordo-help beside them.
---
>   with /plan-retro, /diagnose and /ordo-help beside them.
410,413c410,413
<         "The pipeline of one roadmap entry: /repo-setup for a new repository or /ordo-init for an "
<         "existing one, /roadmap add, the optional /grill, /plan, every step of the plan loop, and "
<         "the closing; /plan-retro and /ordo-help are optional beside it. Each box marks where you "
<         "are asked.",
---
>         "The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or "
>         "/ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and "
>         "the closing, with the optional /plan-retro, /diagnose and /ordo-help beside them. Each "
>         "box lists the stops where you are asked, marked every run, only when or optional.",
507c507
<     draw_caption(canvas, 395, side_top - 12, "AT ANY POINT", 300)
---
>     draw_caption(canvas, 395, side_top - 12, "AT ANY POINT", 620)
516c516
<         Rect(395, side_top, 330, 150),
---
>         Rect(395, side_top, 300, 150),
521a522,528
>     diagnose_box = Box(
>         Rect(715, side_top, 300, 150),
>         "/diagnose",
>         "The cause of a defect, from a command red on it, before any fix.",
>         (Group(OPTIONAL), Group(ONLY_WHEN, ("The hypotheses", "The cause not found"))),
>         dashed=True,
>     )
523a531
>     draw_box(canvas, diagnose_box)
530c538
<     top, height, gap = 42, 262, 18
---
>     top, height, gap = 42, 290, 18
538,541c546,550
<         "The plan loop of one step: /spec, build it, /refute, close them, /refute over the round "
<         "or the orchestrator reading the delta, and /land, with a return for a further round, the "
<         "stops and refusals, the optional /ordo-help, and the optional /plan-orchestration band "
<         "that runs the row unattended. Each box marks where you are asked.",
---
>         "The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends "
>         "a finding whose cause is not known through /diagnose, /refute over the round, and /land, "
>         "with a return for a further round, a card for when a command stops, a card for when it "
>         "refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each "
>         "box lists the stops where you are asked, marked every run, only when or optional.",
582,583c591,601
<             "A repair round: fix the findings, rerun, rewrite the report.",
<             (Group(ONLY_WHEN, ("A contradiction of an ADR the brief asked for",)),),
---
>             "A repair round: fix the findings, rerun, rewrite the report. A finding whose cause is "
>             "not known goes through /diagnose first.",
>             (
>                 Group(
>                     ONLY_WHEN,
>                     (
>                         "A contradiction of an ADR the brief asked for",
>                         "A cause not found, from /diagnose",
>                     ),
>                 ),
>             ),
```

`docs/figures/pipeline.svg` (25910 to 28161 bytes) and `docs/figures/plan-loop.svg` (28613 to 30454 bytes) are regenerated by the script and hold the changes of `gen_figures.py`.

## Files changed, with line counts

```
     331 skills/plan-orchestration/SKILL.md
     206 skills/land/SKILL.md
     180 skills/refute/SKILL.md
     296 skills/spec/SKILL.md
     237 skills/diagnose/SKILL.md
     104 skills/ordo-help/SKILL.md
     178 README.md
     727 docs/figures/gen_figures.py
     156 docs/figures/pipeline.svg
     162 docs/figures/plan-loop.svg
     109 skills/repo-setup/templates/plan-terms.md
      13 skills/repo-setup/templates/docs/glossary.md
     126 docs/glossary.md
    2825 total
```

## Judgment calls the brief left open

- Item 1: the bullet is one sentence naming the command, the `round <n>` form and the scratch-copy, read-only behaviour, as the brief's text lists them; the "noted at landing" and "raised as an open item" bullets each stay one rule.
- Item 2: the red-line bullet is placed after "The failure goes to the user as an open item only when only the user can decide what to do" and before "`/spec` then saves the step's work", since the diagnosis happens once the step is out of main and before `/spec` prepares it again. The "Use instead" row is placed before the `/plan-retro` row.
- Item 3: the brief's one bullet holds two rules (the record of each diagnosis; a red line fixed at landing), so it is two bullets, per the layout's "one rule per bullet". The "Use instead" row is placed before the `/ordo-help` row.
- Item 6: `diagnose` Steps 23's bullet is reduced to a pointer at `land` Steps 9, so the booking rule stands once; its Done line ("when the record's path and the cause are written for the landing's booking") still holds.
- Item 7: the description's word is placed after `refute`, following the order of use. The "Use instead" row is placed before the `/plan-retro` row.
- Item 8: the table row's text is mine, in the register of the other rows. The `diagnose` sentence of line 7 sits between `grill` and `plan-retro`.
- Item 9: the /diagnose box needed room beside /ordo-help, so /ordo-help narrowed from 330 to 300 px and the new box takes x 715, width 300; the "AT ANY POINT" caption width went from 300 to 620 so it spans both. The "close them" box did not fit its two stops at height 262, so the row's boxes went from 262 to 290 px; the script runs clean at it and no check was loosened. The plan-loop figure's description previously differed from its README alt text; both descriptions now equal the alt texts, as the brief asks, so the old wording "or the orchestrator reading the delta" is gone from the description.
- Item 10: **booking** already ends "Stated in: `land`, Steps 9", so only the list changed there.

## User-visible changes, before and after

- `plan-orchestration` "Only known fixes": before, a finding whose cause is not known "is diagnosed by the orchestrator, read-only"; after, it is diagnosed with `/diagnose <entry> <step> <finding>` and a cause not found is the Stops row "A finding that is the user's".
- `ordo-help` prints: before, no `/diagnose` line; after, four (brief check, finding, the red-line sentence, the outside-plan command).
- README: before, no `diagnose` in the introduction, table, Quick start or copy loop; after, all four, and the alt texts name it.
- Both figures: before, no /diagnose; after, the /diagnose box in the pipeline figure and the /diagnose text and stop in the "close them" box.

## Wrong or impossible in the brief

- Item 10 and Cases 3 say `docs/glossary.md`'s line 3 "(outside the block)" names skills to which `diagnose` is added. `sed -n 3p docs/glossary.md` prints "This page defines each term that the Ordo skills, the pages under `docs/dev/` and the README use in a sense of their own. The block below is `skills/repo-setup/templates/plan-terms.md` copied whole, ... Ordo's own terms follow the block." It names no skills, so no sentence there is false and nothing was added; adding a skill list to it would be a change no brief item asks for (rule 20). The template's line 3 was the line that named the skills, and it carries `diagnose` now. The orchestrator rules whether `docs/glossary.md` line 3 should change.
- The brief's Case 4 grep (`grep -n "diagnosis record" skills/*/SKILL.md`) also matches `diagnose`'s own three uses of the term for the record it opens; those are not the booking rule. Nothing to change.
- The ordo-help line numbers in the brief (:47-80 fence) held on main; README line numbers moved by 4 after the row and Quick start lines were added (alt texts now at 54 and 58).

- The brief's premise "each figure's description equals the README alt text" (What is on the tree, the `gen_figures.py` bullet) was false at the base for both figures: the first reading of case 3 shows `grep -o '<title>[^<]*' docs/figures/*.svg` against `sed -n '50p;54p' README.md` differing for the pipeline and for the plan loop. Item 9 made both equal.

## Repair round 1

Everything of the round is done; all seven points.

### Changed lines, old beside new

Point 1, `skills/ordo-help/SKILL.md` line 80 (end of the line):
- Old: `... /spec saves its work as a patch and prepares it again from main's head When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main, and writes it in the step's Step 0.`
- New: `... /spec saves its work as a patch and prepares it again from main's head. When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main and before /spec prepares it again, and writes it in the step's Step 0.`

Point 2, `skills/land/SKILL.md` line 24:
- Old: `| A red line whose cause is not known, once the step is taken back out of main | `/diagnose <entry> <step> red line` |`
- New: `| A red line whose cause is not known, once the step is taken back out of main and before `/spec` prepares it again | `/diagnose <entry> <step> red line` |`

Point 2, `skills/plan-orchestration/SKILL.md` line 118:
- Old: `   - A red line whose cause is not known is diagnosed with `/diagnose <entry> <step> red line` once the step is out of main, and its cause goes into the step's Step 0 for `/spec`.`
- New: `   - A red line whose cause is not known is diagnosed with `/diagnose <entry> <step> red line` once the step is out of main and before `/spec` prepares it again, and its cause goes into the step's Step 0 for `/spec`.`

Point 3, `skills/land/SKILL.md` Steps 9, old line 93 deleted:
- Old: `   - A red line fixed at landing whose cause was diagnosed names its record the same way.`
- New: (the bullet is gone; the bullet before it, "It names each diagnosis record of the step ...", books every diagnosis record)

Point 4, `skills/land/SKILL.md` "What it reads" item 5 (line 38), numbering of items 1 to 6 unchanged:
- Old: `5. `agents/reviews/<step>-report.md` and the refuter report `agents/reviews/<step>-refuter.md`, as the Stops row "The step not ready" requires them.`
- New: `5. `agents/reviews/<step>-report.md` and the refuter report `agents/reviews/<step>-refuter.md`, as the Stops row "The step not ready" requires them, and the step's diagnosis record `agents/reviews/<step>-diagnosis.md` when it exists, read at Steps 9 for the booking.`

Point 5: the false premise is now listed in "Wrong or impossible in the brief" above.

### Point 6 and the checks, verbatim

Grep of point 6, `grep -rn "item [0-9] of .What it reads\|What it reads. [0-9]" skills/land skills/*/SKILL.md`: 19 lines, none in `skills/land`. The `land` skill's "What it reads" is cited nowhere by number; every hit cites the `spec`, `diagnose`, `plan`, `plan-retro`, `grill`, `ordo-init`, `roadmap` or `refute` skill's own or `spec`'s items. The change adds text to `land` item 5 and renumbers nothing, so no reference is made false. Lines printed:

```
skills/diagnose/SKILL.md:34:2. The rules file and the standards `.agents/plan.yaml` names, `docs/glossary.md` and the ADRs in force as the `spec` skill's "What 
skills/diagnose/SKILL.md:37:   - `<entry>` resolves to its folder as the `spec` skill's "What it reads" 2 says.
skills/diagnose/SKILL.md:53:1. Inside a plan, refuse when "What it reads" 3 or 5 finds an input missing.
skills/diagnose/SKILL.md:61:   - Done when the record exists and its Symptom section holds the symptom as "What it reads" 1 gives it, word for word.
skills/ordo-init/SKILL.md:86:    - The commit is made only when the repository's commit rule ("What it reads" 3) allows it.
skills/grill/SKILL.md:42:4. The ADRs in force in the folder `adr` names, as the `spec` skill's "What it reads" 5 says: which records are in force, and what each
skills/grill/SKILL.md:59:   - Every refusal of "What it reads" 1 and 2 is made here, before anything is written.
skills/grill/SKILL.md:61:2. Read what "What it reads" 3 to 9 lists.
skills/plan-retro/SKILL.md:37:1. Read each report "What it reads" 2 lists, run by run: the first review, under its Spec, Proof, Standards and Behaviour headings
skills/refute/SKILL.md:41:   - Then the ADRs the brief names under "What is on the tree", and every other `NNNN-*.md` record in the folder the configuration blo
skills/plan/SKILL.md:41:5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none): each `NNNN-*.md` record for its part in force, 
skills/plan/SKILL.md:52:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, i
skills/roadmap/SKILL.md:86:   - The lines are written with `<REDACTED>` in place of the value of a secret, as the rules file's rule on secrets in quoted command
skills/spec/SKILL.md:72:   - Then, before any premise check, read the step's line and the Rulings section of `plan.md`, as "What it reads" 4 says.
skills/spec/SKILL.md:85:   - Read the ADRs the step touches, as "What it reads" 5 says. The brief names each under "What is on the tree", with its number, its t
skills/spec/SKILL.md:216:   - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>)
skills/spec/SKILL.md:245:   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is rea
```

Column scan of the `ordo-help` fence, `perl` over lines 48-90 (lines whose command fits the field) and an `awk` over the fence for continuation lines:

```
  24 31
   3 31
```

The first line is the 24 command lines whose text starts at column 31; the second is the 3 continuation lines, each at column 31 (the `perl` scan prints `count column`).

Descriptions by the layout's command, longest three: `951 skills/refute/SKILL.md`, `997 skills/roadmap/SKILL.md`, `1022 skills/spec/SKILL.md`; `ordo-help` 396, none over 1,024 (no description changed this round).

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.

`LC_ALL=C grep -n '[^ -~]'` over `skills/ordo-help/SKILL.md skills/land/SKILL.md skills/plan-orchestration/SKILL.md`: printed nothing (rc=1).

Verify list through `checks.sh`, verbatim:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
rc=0
```

### Judgment calls

- Point 4: the diagnosis record is added to item 5 as a clause "when it exists", since a step with no diagnosis has no such file; the numbering is unchanged.
- Point 2: "before `/spec` prepares it again" is written in the three places the reviewer named and in the same form each; the `ordo-help` line keeps its one-line form with no wrapped continuation.
