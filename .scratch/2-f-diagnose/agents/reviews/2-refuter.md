# Step 2 refuter report (on .agents/worktrees/2f-2, base 48551f8c6381a546dd7eefc82e7e69d80ef73c54)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/orchestrator-state.md; echo "rc=$?"   (from the worktree root)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...ASCII check...'
checks: 10 commands passed
rc=0

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (rc=0)

$ cp docs/figures/pipeline.svg docs/figures/plan-loop.svg $D/ ; python3 docs/figures/gen_figures.py ; cmp (both)
wrote docs/figures/pipeline.svg (28161 bytes)
wrote docs/figures/plan-loop.svg (30454 bytes)
rc=0; cmp printed nothing for either file
$ /usr/bin/python3 docs/figures/gen_figures.py ; cmp (both)
wrote docs/figures/pipeline.svg (28161 bytes)
wrote docs/figures/plan-loop.svg (30454 bytes)
rc=0; cmp printed nothing for either file; git status --short unchanged afterwards
$ rsvg-convert docs/figures/pipeline.svg -o $D/pipeline.png ; rsvg-convert docs/figures/plan-loop.svg -o $D/plan-loop.png   (D = $TMPDIR/refute2f2.Fprc3I)
both PNGs written and read (see verdict 9 and the figure case)

$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py
All checks passed!   rc=0
$ ruff format --check --line-length 100 --target-version py39 docs/figures/gen_figures.py
1 file already formatted   rc=0

$ LC_ALL=C grep -n '[^ -~]' <the 13 changed files and the report>
(nothing)   rc=1

$ git status --short   (worktree)
 M README.md, docs/figures/gen_figures.py, docs/figures/pipeline.svg, docs/figures/plan-loop.svg, docs/glossary.md, skills/diagnose/SKILL.md, skills/land/SKILL.md, skills/ordo-help/SKILL.md, skills/plan-orchestration/SKILL.md, skills/refute/SKILL.md, skills/repo-setup/templates/docs/glossary.md, skills/repo-setup/templates/plan-terms.md, skills/spec/SKILL.md
?? .scratch/2-f-diagnose/agents/reviews/2-report.md
(every path is in the brief's "Paths this step writes"; the main-checkout report copy is byte-identical: cmp printed "same")

Report's evidence commands, rerun:
$ grep -rn "diagnosed by the orchestrator, read-only" skills          -> nothing, rc=1 (matches report)
$ grep -n "diagnosis record" skills/*/SKILL.md                         -> land:92 (the rule), spec:117 (pointer), diagnose:3, :10, :55 (the term for its own record) (matches report)
$ grep -n diagnos skills/{plan-orchestration,land,refute,spec}/SKILL.md -> po 28, 101, 118; land 24, 92, 93; refute 23; spec 117, 252 (matches report)
$ grep -n diagnose README.md                                           -> 7, 20, 40, 47, 54, 58, 98 (matches report)
$ awk column scan of the ordo-help sequence fence, base vs now        -> base: 23 lines with text at 31, 1 continuation at 31; now: 24 at 31, 3 continuations at 31, the two long /diagnose commands on lines of their own (matches report "24 31")
$ title and aria-label of each SVG against README lines 54 and 58 (cmp) -> pipeline title=alt, pipeline aria=alt, plan-loop title=alt, plan-loop aria=alt
$ same comparison at the base (git show 48551f8:...)                  -> both titles differ from their alt texts at the base
$ python3 -c '...description lengths...'                               -> ordo-help 396, refute 951, spec 1022, diagnose 905, land 726, plan-orchestration 788; all <= 1024
$ git diff <base> -- skills | grep -c "version:"                       -> 1 (the unchanged context line of ordo-help; no version changed, Decisions 5)
$ sed -n 3p docs/glossary.md                                           -> "This page defines each term that the Ordo skills, the pages under `docs/dev/` and the README use in a sense of their own. ..." (names no individual skill)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. "Only known fixes" (plan-orchestration Steps 8) names `/diagnose <entry> <step> <finding>`, the `round <n>` form, the scratch copy and the unchanged worktree; "noted at landing" points at `land` Steps 9; the open-item bullet names the Stops row "A finding that is the user's", which exists in plan-orchestration "Stops"; "A round never asks the builder to find a cause" kept.
- 2: holds. Steps 9 bullet placed after the back-out bullets and before "/spec then saves", which is the order the red-line diagnosis needs; "Use instead" row as dictated.
- 3: holds for the text the item dictates (land Steps 9 bullets at :92-93, "Use instead" row at :24); see Standards 2 and 3 on the same section.
- 4: holds. refute "Use instead" row added as dictated.
- 5: holds. spec Steps 4 bullet (:117) and "Steps / The brief check" 4 bullet (:252) as dictated.
- 6: holds. diagnose :141 names the Stops row; Steps 23 (:181) is a pointer to `land` Steps 9, so the booking rule stands once; its Done line still holds; :232 still true against item 1's text ("probes read-only on a scratch copy").
- 7: violated, Standards 1 (the red-line line runs "from main's head When its cause..."). The description, the "Use instead" row and the three other sequence places are exactly in the given form and keep column 31.
- 8: holds. README :7, table row after `refute`, both Quick start places in the 30-column form, copy loop with `diagnose` before `grill`, both alt texts.
- 9: holds. The pipeline figure has the dashed /diagnose box with its body and the stops "The hypotheses" and "The cause not found", all inside the box; the plan-loop "close them" box has the added body and the stop "A cause not found, from /diagnose", all inside; no overlap in either render; titles and aria-labels equal the README alt texts; both Pythons write identical bytes.
- 10: holds for **booking**, **Step 0** and the template's line 3 (sync prints ok). The second half, `docs/glossary.md` line 3, is not applicable: that line says "the Ordo skills" and names no skill individually (`sed -n 3p docs/glossary.md`), so it is true with `diagnose` and there is no list to extend. The builder's call is right; adding a list there would be a change no item asks for (change standard rule 20).

Cases of the brief's "Cases":

- "Only known fixes" names `/diagnose`, `round <n>`, the Stops row, keeps the builder rule, old sentence gone: met (grep prints nothing; section read).
- plan-orchestration Steps 9, land Steps 9 and spec Steps 4 carry the red-line form, the booking and the cause in Step 0; spec "The brief check" 4 names the brief-check form: met (read at po:118, land:92-93, spec:117, spec:252).
- The places that name the changed text still hold: met. diagnose :141, Steps 23 and :232 hold; **booking** and **Step 0** list the new contents in both copies; the template's line 3 names `diagnose`, and `docs/glossary.md` line 3 holds as written (it says "the Ordo skills"); both titles equal the alt texts (cmp).
- The booking rule is written once: met (land:92 holds the rule; spec:117 and diagnose Steps 23 point; diagnose :3, :10, :55 use the term for its own record, not the booking rule).
- The five "Use instead" tables have rows a reader can tell apart: met (each table read; every When differs from the other rows of its table).
- The `ordo-help` sequence holds the four places in the given form and every other line keeps column 31: met (awk scan above). The wording defect of the red-line line is Standards 1, under item 7.
- README Quick start holds its two places in the same form; table row after `refute`; line 98 (was 94) lists `diagnose` before `grill`: met.
- The figures regenerate with exit 0, both Pythons write the same bytes, the renders show the /diagnose box and the "close them" text inside their boxes: met (renders read).
- sync prints `ok: the plan-terms block equals the template`: met.
- Each changed skill read against `docs/dev/skill-layout.md`: partial; `land` Steps 9 now reads the diagnosis records, and `land` "What it reads" does not list them (Standards 2).

## 1. Spec

- `.scratch/2-f-diagnose/agents/briefs/2.md`, "What is on the tree", the `docs/figures/gen_figures.py` bullet: "each figure's description (`:537-541` for the plan-loop) is written into its SVG as `<title>` and `aria-label` and equals the README alt text"; what is wrong: at the base neither title equals its alt text (`git show 48551f8:docs/figures/*.svg | grep -o '<title>[^<]*'` against `sed -n '50p;54p'` of the base README: the pipeline title reads "The pipeline of one roadmap entry: ... Each box marks where you are asked.", the alt text "... as boxes in order: ... marked every run, only when or optional."; the plan-loop pair differs the same way). The report's first reading of case 3 says so, and its judgment calls mention it for the plan-loop only, but its section "Wrong or impossible in the brief" does not list the false premise; failure scenario: the orchestrator booking the step's premise corrections from the report's "Wrong" section misses this one, and the ledger keeps a premise that says the two texts were equal, so a later brief that relies on "the figure description equals the alt text" as an invariant builds on a claim that was never true before this step; verdict: none.
- `2-report.md`, "The cases, first reading on the unchanged tree", Case 8: "`cmp` of the pipeline SVG against the committed copy: identical"; what is wrong: the first reading compares only `pipeline.svg`, runs neither `/usr/bin/python3` nor the renders on the unchanged tree; the brief asks for the first reading of every case; failure scenario: a reader of the report cannot tell from it that the plan-loop SVG also regenerated byte for byte at the base, so a byte difference after the change could not be attributed to the change alone from the report (the brief check's own base run covers this: both files equal); verdict: none.

## 2. Proof

none

## 3. Standards

- `skills/ordo-help/SKILL.md:80`: "/spec saves its work as a patch and prepares it again from main's head When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main, and writes it in the step's Step 0."; what is wrong: the base line ended "from main's head" with no full stop, and the sentence was appended without one, so two sentences run together; `docs/dev/skill-layout.md` binds the prose standard, and this line is printed verbatim by `/ordo-help` ("The sequence, printed verbatim"). The report quotes the line in "Changed lines" without noticing; failure scenario: every user who runs `/ordo-help` reads "main's head When its cause" and has to guess where the /spec sentence ends and the /diagnose sentence begins. A one-character fix at landing ("main's head. When"); verdict: item 7 violated.
- `skills/land/SKILL.md`, "What it reads" (items 1-6) against Steps 9 (:92): "It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause..."; what is wrong: Steps 9 now reads `agents/reviews/<step>-diagnosis.md`, and "What it reads" does not list it (it lists plan.yaml, the ledger folder, the dispatch block, the landing scripts, the report and the refuter report, and main). `docs/dev/skill-layout.md` "Sections, in order" row 4 has "What it reads" list every input, and change standard rule 14 carries a change to every place that names it; the file is inside the step's paths and item 3 needs the input; failure scenario: a landing session that gathers its inputs from "What it reads" before Steps 1 never opens the diagnosis record, and at Steps 9 either books the step without the cause the Goal asks to be "written in the booking" or goes back for the file mid-booking; verdict: the case "Each changed skill read against skill-layout" partial.
- `skills/land/SKILL.md:93`: "A red line fixed at landing whose cause was diagnosed names its record the same way."; what is wrong: the text the brief dictated for item 3 (the builder split it from :92 correctly under "one rule per bullet") names a case no invocation produces. `/diagnose <entry> <step> red line` refuses unless the dispatch entry reads `landing: backed-out` (diagnose "What it reads" 3 and Stops "No dispatch entry"), so a red line fixed on main at landing (land Steps 6, "named in the booking with its cause") has no diagnosis record; and a red line diagnosed after a back-out is already a heading of `<step>-diagnosis.md`, which :92 books. Under `docs/dev/skill-layout.md` "Writing for an agent" a sentence stays only when it changes what the reader does; failure scenario: an orchestrator meeting at landing a red line whose cause is not known reads :93 as allowing a diagnosis before the back-out, runs `/diagnose <entry> <step> red line`, and gets the refusal "No dispatch entry" while main holds the step's red changes. Fixed at landing by deleting :93 (or rewording it to the backed-out case, which :92 already covers); verdict: none (item 3 built as dictated).
- `skills/ordo-help/SKILL.md:80` and `skills/land/SKILL.md:24`: "...prepares it again from main's head When its cause is not known, /diagnose <entry> <step> red line finds it once the step is out of main..." and "| A red line whose cause is not known, once the step is taken back out of main | `/diagnose <entry> <step> red line` |"; what is wrong: `/diagnose ... red line` must run before `/spec` prepares the step again, since `spec` "Steps / A step taken back out of main" 4 and 5 remove the kept worktree, its branches and the dispatch entry, and diagnose then refuses ("No dispatch entry"; Steps 3 takes the range from the kept branch). The ordo-help line puts the /diagnose sentence after "/spec that step again ... /spec saves its work as a patch and prepares it again", and neither text says "before /spec"; plan-orchestration Steps 9 has the right order by bullet position only. Change standard rule 19 (no two statements contradict); the wording is the brief's, placed as item 7 and item 3 dictate; failure scenario: a user running a plan by hand follows the line in order, runs `/spec <entry> <step>`, then `/diagnose <entry> <step> red line`, which refuses because the entry and branch are gone, and the red line's cause is never found before the step is rebuilt. Fixed at landing by "... once the step is out of main and before /spec prepares it again" in both places; verdict: none (text as dictated).

## 4. Behaviour

none. The figure title and aria-label changes (what a screen reader announces) are stated with before and after in the report's "Changed lines" for `gen_figures.py`, and the taller plan-loop row is stated in its judgment calls (the canvas goes from 1040x861 to 1040x889, `grep -o 'viewBox=...'`).

## The builder's judgment calls, judged

- The split bullet in `land` Steps 9: right under `docs/dev/skill-layout.md` "Lists and tables" (two requirements that can each be broken while the other holds are two bullets); the second bullet's content is Standards 3.
- The README row's wording: in the table's register ("Finds ... It runs ..."), each clause matches `diagnose`'s description and Steps; no finding.
- The figures' sizes: /ordo-help narrowed 330 to 300, /diagnose at x 715 width 300 (right edge 1015 of 1040), the caption widened to 620, the plan-loop row 262 to 290; the renders show every label inside its box and no overlap; the 20 px gap between /ordo-help and /diagnose against 40 px before /ordo-help reads as the "AT ANY POINT" group; no check loosened. No finding.
- The plan-loop description losing "or the orchestrator reading the delta": acceptable. Item 9 requires the description to equal the alt text, item 8 dictates the alt text, and the base alt text never had the phrase; the second /refute box still says "When refute_after_repair: no, "read the delta", by the orchestrator." in the render. A screen reader now hears the same text sighted readers of the README alt text always had.
- Item 10's `docs/glossary.md` line 3: the builder is right on the evidence (verdict 10).

## Declined to judge

- Whether `diagnose` should be one of the **plan skills**, and whether skill versions should be raised: Decisions 4 and 5 of the brief, the user's vocabulary and release calls.
- Whether the Stops row "A finding that is the user's" is the right home for a cause not found of a brief-check finding (met under `/spec`, where plan-orchestration's Stops may not be the running skill): the brief dictated that row for all forms, and it is a design question for the orchestrator, not settled by a read.
- The prose quality of the long dictated sentences (plan-orchestration :101 at about 50 words): the wording is the brief's; I judged only what the builder chose.
- The regeneration of both SVGs in the worktree during my check rewrote them with identical bytes (cmp against copies taken first printed nothing, and `git status --short` did not change); no file of the repository differs from what the builder left.

Reviewer usage: tokens and time not visible to me (the completion notice carries them); about 33 tool uses.

