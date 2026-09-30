# Step 12a refuter report (on .agents/worktrees/2e-12a, base ef5d3a9a46dc06898c1a09544142a1c740de6eb8)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

Run from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`.

`git status --short` in the worktree:
```
 M README.md
 M docs/dev/building.md
 M docs/glossary.md
?? .scratch/2-e-grill/agents/reviews/12a-report.md
?? docs/figures/
```
`git diff <base> --stat`: `README.md | 8 ++++++++`, `docs/dev/building.md | 4 +++-`, `docs/glossary.md | 1 +`. The worktree also holds `.ruff_cache/` (its own `.gitignore` is `*`, so `git status --porcelain --untracked-files=all` in `/land`'s removal does not list it).

The report's evidence, rerun (the script was run only on a copy: `cp -R` of the worktree to `$TMPDIR/refute12a/wt`, its `.git` file removed):
```
$ python3 docs/figures/gen_figures.py            (in the copy)
wrote docs/figures/pipeline.svg (25245 bytes)
wrote docs/figures/plan-loop.svg (24252 bytes)
rc=0
$ cd / && python3 $TMPDIR/refute12a/wt/docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (25245 bytes)
wrote docs/figures/plan-loop.svg (24252 bytes)
rc=0
$ git diff --no-index $S/a $S/b     (copies after run 1 and run 2)
diffrc=0
$ shasum -c before.sha   (the worktree's committed-to-be SVGs against the copy's regenerated ones)
docs/figures/pipeline.svg: OK
docs/figures/plan-loop.svg: OK
$ diff -r <worktree>/docs/figures <copy>/docs/figures && echo same-as-worktree
same-as-worktree
$ wc -l docs/figures/*
     685 docs/figures/gen_figures.py
     141 docs/figures/pipeline.svg
     131 docs/figures/plan-loop.svg
```
Error paths on the copy (SVGs removed first; after each run `ls` listed only `gen_figures.py orig.py`, so nothing was written):
```
closing label repeated four times:
error: pipeline.svg: box 'the closing': the label 'The roadmap diff of the closing step, shown for approval, The roadmap diff ... ' does not fit the box
rc=1
"/grill <entree>" with an e-acute (U+00E9) as a title:
error: pipeline.svg: the body holds a character that is not ASCII
rc=1
an unbreakable word in /grill's body:
error: pipeline.svg: box '/grill <entry>': the word 'averyveryveryverylongwordthatcannotwrapatall.' of the label '...' is longer than a line
rc=1
a title too long for /plan's box:
error: pipeline.svg: box '/plan <entry> with a title far too long for its box': the label '...' does not fit one line of 158 px
rc=1
```
The brief's command cases, in the worktree:
```
$ ls docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg   -> all three, lsrc=0
$ LC_ALL=C grep -n '[^ -~]' docs/figures/* README.md docs/dev/building.md docs/glossary.md   -> nothing, asciirc=1
$ ruff check --no-cache --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py
All checks passed!
$ ruff format --no-cache --check --line-length 100 docs/figures/gen_figures.py
1 file already formatted
$ python3 -c "import xml.dom.minidom,sys; [xml.dom.minidom.parse(f) for f in sys.argv[1:]]" docs/figures/*.svg   -> xmlrc=0
$ grep -rIn -i -E "plan-help|plan help" --exclude-dir=.scratch --exclude-dir=.git --exclude-dir=.ruff_cache .   -> nothing, greprc=1
```
(The brief's `git grep --untracked` form was replaced by `grep -r` because the reviewer runs no git beyond `git diff` and `git status --short`; the `grep -r` form covers ignored files too, so it is at least as wide.)

Renders: `rsvg-convert -z 1.5` and `-z 3` into `$TMPDIR/refute12a/png/` (`pipeline.png`, `plan-loop.png`), read with the Read tool.

Contrast, computed by the reviewer with the WCAG relative-luminance formula from the script's constants (every colour in the SVGs, by `grep -o 'fill=...|stroke=...' | sort | uniq -c`, is one of these): INK text on CARD 17.85; INK on PANEL 17.06; MUTED captions on PANEL 7.24; MUTED notes on CARD 7.58; CARD badge text on ACCENT fill 6.29; INK badge text on CARD 17.85; ACCENT mark edges on CARD 6.29, on PANEL 6.01; EDGE box edges on CARD 4.76, on PANEL 4.55; ACCENT arrows on PANEL 6.01; ACCENT top rule on CARD 6.29; STOP top rule on CARD 5.02, on PANEL 4.80; EDGE panel border on PANEL 4.55. Every text pair is at least 4.5:1 and every edge and mark at least 3:1. These match the report's table.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated. The generator, its checks, its errors, the read-back, ASCII output, paths from its own location and both figures are there and behave as stated (reruns above), and every box's rows match the brief's list and the Stops tables. It is violated by Spec 1 (`plan-loop.svg` does not name `/ordo-help`), Spec 2 (the `/plan-orchestration` band is dashed with no "optional" word), Spec 3 (the band's sentence is false as drawn), Spec 4 (the `/ordo-init` box's "every run" marks do not hold for the check form its body names), Standards 1 and 2 (a forwarder and a repeated computation, against `design-principles.md`), Standards 3 (the docstring's run line and its list of errors), and Behaviour 1 (Python 3.10 is required and is stated nowhere).
- 2: holds. `README.md:48-54` adds the two figures after line 46, the pipeline first, each with alt text that lists what it shows and one introducing line (see Standards 4 on the introducing lines).
- 3: holds. `docs/dev/building.md:28` is the figures line, and line 30 ends "and says how the committed figures are made". Line 3 is unchanged and still true, since the figures are committed and no build step makes them. The report quotes both lines. Behaviour 1 names the Python version this line leaves out.
- 4: holds. `docs/glossary.md:117` is under "Ordo's own terms", outside the plan-terms block (`sync_rules.py --only glossary` printed `ok`). It defines the three marks as item 1 does, with "Stated in: `README.md`, the figures."

Cases of the brief's "Cases":

- `ls` of the three files: met. Rerun above. The report gives the first run on the base.
- Two runs, no byte changed, one line per file: met. `diffrc=0`, two `wrote` lines per run, and the regenerated files equal the worktree's.
- `LC_ALL=C grep -n '[^ -~]' docs/figures/*`: met. It prints nothing.
- The `plan-help|plan help` grep: met. It prints nothing (the `grep -r` form above).
- `ruff check` with `python.md`'s selection: met. `All checks passed!`.
- Too-long label on a scratch copy: met. Exit 1, the error names the figure, the box and the label, and nothing is written. The non-ASCII error is met the same way.
- minidom well-formedness: met. `xmlrc=0`.
- Render and read: partial. Every label is legible. No text overlaps another text, a box edge or an arrow. Every arrow meets its box: the elbow arrows from both setup boxes meet the top of `/roadmap add`, and the dashed return meets the bottom of "close them". The missing part is that a dashed box does not mean "optional" only by shape and word: the band is dashed with no word (Spec 2).
- Reading, each box against its Stops table: partial. The reviewer read every row of all eleven Stops sections (`sed -n '/^## Stops/,/^## Anti-patterns/p'`). Every stop row is marked with the table's own words on the box the brief assigns, or named as left out (`repo-setup`'s three `sync` rows, with the caption on the box). Every refusal is unmarked. "The roadmap diff" is on the closing box. The missing parts are Spec 4 (the `/ordo-init` check form) and Spec 3 (the band's sentence). Spec 5 covers the builder's point on "close them".
- Reading, contrast of each pair: met. The reviewer's own computation is above.
- Reading, README sentences and alt texts against the prose standard: partial. See Standards 4.

## 1. Spec

1. `docs/figures/gen_figures.py:518-650` (`plan_loop_svg`). What is wrong: brief item 1's `plan-loop.svg` bullet says "It names `/ordo-help`, never `/plan-help`". `grep -c ordo-help docs/figures/plan-loop.svg` prints `0`, so the figure names neither. research-hub's figure, which this one follows, has a `/plan-help <entry>` card ("prints this sequence and where the plan ...", its `plan-loop.svg` lines 28-32), and the Ordo version drops it. The report says "Everything in the brief is done" and does not name the omission. Failure scenario: a reader of the plan-loop figure, stopped mid-step, finds no pointer to the command that prints where the plan stands and what to type next. The figure research-hub's is modelled on gave that pointer. Verdict: item 1 violated.

2. `docs/figures/gen_figures.py:627-647`: `band = Box(Rect(25, band_y, 990, 128), "/plan-orchestration <entry>", ..., dashed=True, columns=3)`. What is wrong: the legend in both figures says the dashed box means "optional: you may skip it; the box is dashed". Brief item 1 says the marks "differ by shape and by a word", and it names the dashed boxes: `/grill`, `/ordo-help`, `/plan-retro`. The band is dashed (`plan-loop.svg:108`, `stroke-dasharray="6 4"`) but carries no "optional" badge, so it carries the mark by shape alone. research-hub's band is dashed as well (its `gen_figures.py`, `plan_loop_svg`, the `stroke-dasharray="6 4"` rect), but there the dash had no defined meaning. The meaning itself is true: `/ordo-help`'s sequence says `/plan-orchestration` runs "instead of the lines above". Failure scenario: a reader matching the legend against the band sees a dashed box with no word. They cannot tell whether it is the "optional" mark or decoration, which is the ambiguity the "by a word" rule exists to remove. The fix is one line: `Group(OPTIONAL)` first in the band's groups, or a solid band. Verdict: item 1 violated; the render case is partial.

3. `docs/figures/gen_figures.py:630-631`: "Runs the row above for every step, unattended, ... Under /plan-orchestration only the stops marked here reach you." This is the builder's point (2). What is wrong: the sentence stands inside the band, and the report says "'marked here' is that band's marks". Read that way it is false as drawn:
   - `/land`'s "A worktree that cannot be removed" reaches the user under `/plan-orchestration`. `plan-orchestration` "Resuming, and handing the plan over" says "A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed")". The row is not on the band.
   - `/land`'s "A lock held" is a stop of the `land` skill, which `plan-orchestration` invokes. It is not on the band.
   - `plan-orchestration`'s own stop "The roadmap diff" ("The closing step's `/roadmap done`") is on neither the band nor this figure. It appears only on the pipeline's closing box.

   Read as "marked in this figure", the sentence is still false for "The roadmap diff". The brief's wording, "only the marked stops reach the user", has the same gap unless it is read across both figures. Failure scenario: a user who starts `/plan-orchestration` reads the band as the full list of what can reach them. They are then met with the roadmap diff at the closing, or a worktree open item after a landing, which the figure told them would not come. The words are the orchestrator's, under the change standard's rule 4, since the brief dictated them. Two ways close it: add "A worktree that cannot be removed", "A lock held" and "The roadmap diff (the closing step)" to the band, or say "only the stops marked in these figures reach you". Verdict: item 1 violated; the Stops-table reading case is partial.

4. `docs/figures/gen_figures.py:416-432`: `/ordo-init` "For an existing repository: writes .agents/plan.yaml, or checks the one there." with `Group(EVERY_RUN, ("The draft", "Worker, reviewer and libraries"))`. What is wrong: `ordo-init`'s Stops table gives both rows the When "Every setup". `ordo-init` "Steps / Checking an existing file" says "With `.agents/plan.yaml` present, write nothing", and that path's only stop is "A fix in the check". The body names the check form, and the legend defines "every run" as "it waits on you each time it runs", so together they say the draft and the worker questions come on a check too. The brief's row list dictated the marks, and the body came from `/ordo-help`'s line, so the two together make the box false. Failure scenario: a user who runs `/ordo-init` on a repository that already has `.agents/plan.yaml` expects the draft and the worker, reviewer and libraries questions, and neither comes. The fix is to drop "or checks the one there" from the body, or to add a note that the check form stops only at "A fix in the check". Verdict: item 1 violated; the Stops-table reading case is partial.

5. `docs/figures/gen_figures.py:566-571`: "close them", `(Group("", ("No stop of its own.",)),)`. This is the builder's point (1). What is wrong: against the Stops tables the figure is true, since no table holds a stop for a repair round. Against `/ordo-help`'s sequence, which the script's docstring (lines 10-11) names as its second source, it is not true. The "close them" line of the sequence says "a contradiction of an ADR the brief asked for is raised to you as an open item instead". `refute` "Finding dispositions" says the same: "it is raised to the user as an open item, never closed in a repair round or at landing". Under `/plan-orchestration` this is the band's "A rule clash", so the unattended row is covered. Run by hand, the figure tells the user that "close them" never asks them. The brief dictated "no stop of their own" and its premise quoted the sequence without this clause, so this is a premise of the brief that the reviewer's read does not reproduce. The sequence also raises findings to the user as open items after the last refutation and after "read the delta" (the two lines after "close them"). Those are "A finding that is the user's" on the band, and no hand-run box marks them. Failure scenario: a user running a step by hand reads "No stop of its own" and does not expect a ruling when the refuter finds an ADR contradiction the brief asked for. The sequence says they will get one. The fix is the orchestrator's (rule 4): an "only when" row "A contradiction of an ADR the brief asked for" on "close them", sourced to `refute` "Finding dispositions", or the note changed to name it. Verdict: none of its own. It is part of why the Stops-table reading case is partial.

## 2. Proof

1. `.scratch/2-e-grill/agents/reviews/12a-report.md`, first line: "Everything in the brief is done." and "No item is NOT DONE." What is wrong: Spec 1 shows the brief's "It names `/ordo-help`" is not done, and the report does not say so. The rest of the report's evidence reproduced: the byte counts, 685 lines, the two-run identity, the error messages, ruff, minidom and every contrast ratio. Failure scenario: the orchestrator lands on "Everything in the brief is done" and misses the dropped `/ordo-help` card. Verdict: item 1 violated (with Spec 1).

## 3. Standards

1. `docs/figures/gen_figures.py:105-119`: `@property def x(self) -> float: return self.area.x`, and the same for `y`, `w` and `h`. What is wrong: `design-principles.md` "Separation of concerns, high cohesion, low coupling" says "A forwarder, a member whose whole body is a call to the same member elsewhere, is deleted." Each of the four properties only forwards to `self.area`. Failure scenario: a maintainer who moves a box has two names for one position to keep in mind. The code should read `box.area.x`, or `Box` should hold the rectangle's fields itself. Verdict: item 1 violated.

2. `docs/figures/gen_figures.py:488-489` and `593-594`: `for left, right in pairwise(boxes): canvas.line(left.x + left.w, top + 20, right.x - 1, top + 20, ACCENT, 2, arrow=True)`, written twice, identical. What is wrong: `design-principles.md` "Do not repeat yourself" says "A computation written twice is folded to one home, and the other place calls it." Failure scenario: a change to where a row's arrows meet their boxes (the height or the gap) is made in one figure and missed in the other, and the two figures draw their rows differently. Verdict: item 1 violated.

3. `docs/figures/gen_figures.py:14` and `22-24`: "Run, from any directory: python3 docs/figures/gen_figures.py" and "a label that does not fit its box or its line: the message names the figure, the box and the label". What is wrong: brief item 1 asks for "how to run it (`python3 docs/figures/gen_figures.py` from the repository root)". The docstring says "from any directory" and then gives a path that works only from the root. Change standard rule 14 asks that the docstring list every error it prints. The caption, note and legend errors (`draw_caption`, `draw_note`, `draw_legend`, through `_check_line`) name "a caption", "a note" or "the legend", not a box, and the list does not name that form. Failure scenario: a maintainer in `docs/figures/` types the documented command and gets "No such file or directory". A maintainer who hits a caption error looks in the docstring for which box it means, and there is none. Verdict: item 1 violated.

4. `README.md:48` and `README.md:52`: "The pipeline of one roadmap entry, marked where you are asked: ..." and "The loop of one step and the /plan-orchestration band that runs it unattended, with the same marks: ...". What is wrong: brief item 2 asks for "one sentence saying what it shows and what the marks mean". Both lines are noun phrases with no main verb, and line 48 is 37 words (`sed -n 48p README.md | wc -w`) against the prose standard's section E "under roughly 20 words unless the mechanism needs more". The report states the length and its reason. The missing verb is not stated. Failure scenario: a README reader meets two caption fragments in running prose, the kind of fragment the prose standard's section 0 rules out. Verdict: the README reading case is partial; item 2 is left at holds, since the figures, their order and their alt texts are as asked.

## 4. Behaviour

1. `docs/figures/gen_figures.py:37`: `from itertools import pairwise`, and `:534` `zip(..., strict=True)`. What is wrong: both need Python 3.10. `/usr/bin/python3 --version` printed `Python 3.9.6` on this machine, and `/usr/bin/python3 docs/figures/gen_figures.py` (in the copy) printed `ImportError: cannot import name 'pairwise' from 'itertools'`, a traceback rather than the docstring's `error:` form, with rc=1. The need is stated in neither the docstring, nor `docs/dev/building.md:28`, nor README "Requirements" ("`python3` with PyYAML"). A reading of the other Python scripts under `skills/*/templates/` and `utils/` for `pairwise`, `strict=True`, `match` or `| None` found none, so this is the first script in the tree that needs 3.10. Failure scenario: a maintainer on macOS whose `python3` is the system 3.9 changes a Stops table, runs the documented command, gets a traceback and cannot regenerate the figures. Either state "Python 3.10 or newer" in the docstring, in the `building.md` line and in README Requirements, or write the two calls in 3.9 form. Verdict: item 1 violated.

## Declined to judge

- How the figures render on GitHub (another browser's fonts, and the README's image scaling): not rendered here. `rsvg-convert` shows the widths conservatively inside every box, but other font metrics were not tried.
- Whether `/ordo-init`'s own stops ("The draft", "Worker, reviewer and libraries") come again when `/repo-setup` runs it, which would bear on the `/repo-setup` box's marks. `repo-setup` "What it reads" and its Steps were not read to that depth.
- Whether three marks are the right reading of ruling "Figures". This is booked as "Step 12a, the three marks", decided by the orchestrator overnight, and is Axel's to overturn.
- The word "halts" in the caption "WHEN ANY COMMAND OF THE ROW HALTS" for "stops or refuses", which the glossary does not define in that sense. Whether it needs an entry is a wording call.
- Which wording closes Spec 3 and Spec 5. The brief dictated the text, so under rule 4 that choice is the orchestrator's.
- Continuation lines of a wrapped stop name are indented 8 px against a budget computed at the column width minus 6 px. With the 0.6 em per character budget no overflow shows in the renders, and no case was built for it.

Reviewer usage: tokens and minutes not measured by the reviewer (the completion notice carries them); 39 tool uses.

## Repair round 1, refuted (step 12a, on .agents/worktrees/2e-12a, base ef5d3a9a46dc06898c1a09544142a1c740de6eb8)

**Summary:** 10 of the 11 round points are closed and the verify list is green. Point 11 (Proof 1) is not closed, because four passages of the report above its round section still describe round 0. The round left one new defect: the plan-loop alt text in the README is now false. The four figure findings (Spec 1 to 3, Standards 2) and the README alt text are small and inside the brief, so they can be fixed at landing. Proof 1 needs report edits at landing, or the Closed heading must state that the report is stale.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

`git status --short` in the worktree: ` M README.md`, ` M docs/dev/building.md`, ` M docs/glossary.md`, `?? .scratch/2-e-grill/agents/reviews/12a-report.md`, `?? docs/figures/`. `git diff <base> --stat`: README.md +8, docs/dev/building.md +3 -1, docs/glossary.md +1.

**How the round's delta was read.** I extracted the three new files from `12a-round-0.diff` into `$TMPDIR/refute12a-r1/r0/` and ran `diff -u` against the worktree's files. The tracked hunks were compared with the round-0 diff's hunks.
- Changed in the round: `gen_figures.py`, `pipeline.svg`, `plan-loop.svg`, and README lines 48 and 52.
- Unchanged: `docs/dev/building.md`, `docs/glossary.md`, and the two alt texts at README lines 50 and 54.

**The script, rerun only on a copy.** The copy is `cp -R` of the worktree to `$TMPDIR/refute12a-r1/wt`, with its `.git` file removed.
```
$ python3 --version
Python 3.13.4
$ python3 docs/figures/gen_figures.py                  (in the copy)
wrote docs/figures/pipeline.svg (25910 bytes)
wrote docs/figures/plan-loop.svg (28067 bytes)
rc=0
$ cd / && python3 $S/wt/docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (25910 bytes)
wrote docs/figures/plan-loop.svg (28067 bytes)
rc=0
$ git diff --no-index $S/a $S/b                        (SVG copies after run 1 and run 2)
diffrc=0
$ shasum -c before.sha                                 (worktree SVGs against the regenerated ones)
docs/figures/pipeline.svg: OK
docs/figures/plan-loop.svg: OK
$ /usr/bin/python3 --version
Python 3.9.6
$ /usr/bin/python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (25910 bytes)
wrote docs/figures/plan-loop.svg (28067 bytes)
rc=0
$ shasum -c before.sha   -> both OK
$ diff -r <worktree>/docs/figures <copy>/docs/figures && echo same-as-worktree
same-as-worktree
```

**Error cases.** Each ran on a copy under `$TMPDIR/refute12a-r1/err/docs/figures/` with no `.git`, under both `python3` and `/usr/bin/python3`, with the same output from each. After every case, `ls` listed only `gen_figures.py`, so nothing was written.
```
closing body repeated 30 times:  rc=1  error: pipeline.svg: box 'the closing': the label 'archive. /roadmap done' does not fit the box
"The change" with an e-acute (U+00E9):                 rc=1  error: pipeline.svg: the body holds a character that is not ASCII
unbreakable word in /grill body:  rc=1  error: pipeline.svg: box '/grill <entry>': the word 'averyvery...atall' of the label "averyvery...atall An interview in rounds that settles the entry's design decisions." is longer than a line
title too long for /plan:         rc=1  error: pipeline.svg: box '/plan <entry> with a title far too long for its box': the label '/plan <entry> with a title far too long for its box' does not fit one line of 158 px
legend caption x10:               rc=1  error: pipeline.svg: a caption: the label 'HOW TO READ THE MARKS HOW TO ...' does not fit one line of 990 px
loop note x5:                     rc=1  error: plan-loop.svg: a note: the label 'a further round, within repair_rounds...' does not fit one line of 300 px
legend meaning x3:                rc=1  error: pipeline.svg: the legend: the label 'it waits on you in the named case...' does not fit one line of 232.8 px
"close them" stop x6:             rc=1  error: plan-loop.svg: box 'close them': the label 'A contradiction of an ADR the brief asked for' does not fit the box
```

**Ruff, minidom and the greps.** Ruff is `/Users/axelfaes/.local/bin/ruff`, version 0.16.5.
```
$ ruff check --no-cache --target-version py39 --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py
All checks passed!
$ ruff format --no-cache --check --target-version py39 --line-length 100 docs/figures/gen_figures.py
1 file already formatted
$ ruff check --no-cache --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 docs/figures/gen_figures.py     (the brief's original form)
B905 `zip()` without an explicit `strict=` parameter  --> docs/figures/gen_figures.py:395:24
B905 `zip()` without an explicit `strict=` parameter  --> docs/figures/gen_figures.py:547:64
Found 2 errors.   rc=1
$ python3 -c "import xml.dom.minidom,sys; [xml.dom.minidom.parse(f) for f in sys.argv[1:]]" docs/figures/*.svg
xmlrc=0
$ LC_ALL=C grep -n '[^ -~]' docs/figures/* README.md docs/dev/building.md docs/glossary.md .scratch/2-e-grill/agents/reviews/12a-report.md
asciirc=1 (nothing printed)
$ grep -rIn -i -E "plan-help|plan help" --exclude-dir=.scratch --exclude-dir=.git --exclude-dir=.ruff_cache .
greprc=1 (nothing printed)
$ grep -c ordo-help docs/figures/plan-loop.svg
3
$ grep -oh -E '(fill|stroke)="#[0-9a-f]+"' docs/figures/*.svg | sort | uniq -c
#0f172a #475569 #4f46e5 #f8fafc #ffffff (fill); #4f46e5 #64748b #b45309 (stroke)
```
- The plan-help grep uses the `grep -r` form because a reviewer runs no `git grep`. That form also reads ignored files, so it covers at least as much as `git grep --untracked`.
- The palette is the one the first refuter computed: every text pair is at least 4.5:1 and every edge and mark at least 3:1. The round added no colour.

**Open items in the report against the state file.** I extracted both lists with awk and ran `diff`. It printed nothing ("same"). Both lists hold 5 items.

**Renders.** `rsvg-convert -z 1.5` wrote `$TMPDIR/refute12a-r1/png/pipeline.png` and `plan-loop.png`, and I read both images.
- **Pipeline figure:**
  - Every label is legible, and no text overlaps another text, a box edge or an arrow.
  - Both setup boxes (262 px) feed one elbow arrow that meets the top of `/roadmap add`, and the four row arrows meet their next box.
  - The `/ordo-init` note sits under its stops. The dashed `/plan-retro` and `/ordo-help` boxes each carry the dashed "optional" pill.
  - The legend shows the three marks by shape and word: a filled square "every run", an outlined square "only when", a dashed pill "optional".
- **Plan-loop figure:**
  - The six boxes have five arrows, each meeting its box. The dashed return runs from the second `/refute` into the bottom of "close them", with its note under it.
  - The two halt cards sit under "WHEN ANY COMMAND OF THE ROW HALTS". The dashed `/ordo-help <entry>` card, with "optional" and "No stop.", sits under "AT ANY POINT".
  - The dashed band carries the "optional" pill, then "only when", then seven stops in three columns laid out row-wise ("The roadmap diff, at the closing" is last).
  - Nothing overlaps, and every label is legible.

**Boxes against their texts.** I read every `## Stops` section in the worktree's `skills/*/SKILL.md`, plus `ordo-help` "The sequence, printed verbatim", `refute` "Finding dispositions", `ordo-init` "Steps / Checking an existing file" and `plan-orchestration` "The recurring-findings pass" and "Rules".
- Every stop row of the eleven tables is marked on its box with the table's words, or named as left out (the three `sync` rows, with the caption on the `/repo-setup` box). No refusal carries a mark.
- The changed boxes hold against the texts they cite:
  - **`/ordo-init`:** the check form writes nothing at its step 1, and "A fix in the check" is its only stop, since the check form has no commit step.
  - **"close them":** `refute` "Finding dispositions" says "A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing". The sequence's "close them" line says the same.
  - **The second `/refute`:** the sequence says "what the last one finds is fixed at landing or raised to you as an open item", and "read the delta" says the same.
  - **The band:** it carries `plan-orchestration`'s "The roadmap diff" row.
- **The band's sentence,** "Only the stops marked in these two figures reach you, and the rest of the row runs without asking":
  - It is true for every Stops row. Each of `spec`, `refute` and `land`'s stops is on its box in the plan-loop figure, the band holds `plan-orchestration`'s seven stops, and the closing box also carries the roadmap diff.
  - It is not true of everything that reaches the user under `/plan-orchestration` (Spec 2).

**README lines 48 to 54 against the prose standard.**
- Line 48 has three sentences of 15, 22 and 7 words. Line 52 has one sentence of 19 words. The counts come from splitting line 48 on ". " and from `wc -w` of line 52.
- Each is a full sentence with a main verb, with straight quotes, no dash and no aside.
- The alt texts and the remaining prose points are Standards 1 and 2.

### The round's eleven points

1. **Spec 1: closed.** The dashed `/ordo-help <entry>` card carries "optional" and the text the round brief asked for (`gen_figures.py:635-641`). `grep -c` prints 3, and the render shows the card.
2. **Spec 2: closed.** `Group(OPTIONAL)` is first in the band's groups (`:653`), and the render shows the pill.
3. **Spec 3: closed as the round brief worded it.** "The roadmap diff, at the closing" is marked "only when" (`:663`), and the sentence is the round brief's. The `/land` rows are on the `/land` box of the same figure. The sentence still leaves out the recurring-findings proposals (Spec 2 below).
4. **Spec 4: closed** (`:429`, `:442-443`), and it matches `ordo-init` "Steps / Checking an existing file".
5. **Spec 5: closed** (`:583`, `:590`). "build it" keeps "No stop of its own." (`:571`).
6. **Standards 1: closed.** The four properties are deleted, and every use reads `box.area.*` (the delta above). Both Pythons run every drawing path without an AttributeError.
7. **Standards 2: closed.** `draw_row_arrows` (`:393-397`) is called at `:499` and `:606`.
8. **Standards 3: closed.** The run line and the fallback are at `:14-16`, and the error list at `:22-33`. Every error form the list names was reproduced above. The list's "names ... the label" is imprecise for a box body or note (Spec 1 below). That wording was already in round 0 and the first refuter did not name it.
9. **Standards 4: closed for the main verb and the length.** The sentences it produced repeat one construction (Standards 2 below).
10. **Behaviour 1: closed.**
    - `/usr/bin/python3` 3.9.6 gives rc=0 with identical bytes, and ruff with `--target-version py39` passes.
    - `pairwise` became `zip(boxes, boxes[1:])`. `zip(..., strict=True)` became a plain `zip`, and its guard held nothing, since `lefts` is built from `range(len(widths))`.
    - `Path.write_text(newline=)`, which needs Python 3.10, became `path.open("w", encoding="utf-8", newline="\n")`. This is inside the point and within `python.md` "Files and processes", since `Path.open` is a `Path` method.
11. **Proof 1: not closed.** The round section says "the sections above were brought to the end state". Four passages above it still describe round 0 (Proof 1 below).

- No finding was closed by removing a check.
- No fix reaches beyond its finding. The layout changes are what points 1, 4 and 5 need to fit their text: the halt cards narrowed to 340 px, the box widths moved, and the box and card heights and the canvas sizes are now computed.

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- **1: violated,** by Spec 1 below: a box body or a note that overflows names a wrapped line as "the label", while the item and the docstring say the error names the label. Everything else in item 1 holds:
  - the generator, its checks, its read-back and its ASCII output;
  - the paths taken from its own location, and a run on Python 3.9 and 3.13;
  - the docstring's run line and error list;
  - both figures, with `/ordo-help` named in both;
  - the three marks, each by shape and word;
  - every box's rows against the Stops tables and the texts they cite;
  - the legend in each figure, and the contrast.
- **2: violated,** by Standards 1 below: the plan-loop alt text at `README.md:54` now misstates the figure. The two figures, their order and the introducing sentences are in place.
- **3: holds.** `docs/dev/building.md:28` and `:30` are unchanged since round 0 and still true. The documented `python3 docs/figures/gen_figures.py` now also runs on the system Python 3.9.
- **4: holds.** The entry at `docs/glossary.md:117` sits outside the plan-terms block (`sync_rules.py --only glossary` printed `ok`), and it agrees with the figures, the band being a dashed optional box.

Cases of the brief's "Cases":

- **`ls` of the three files: met.** All three exist, and the report gives the first run on the base.
- **Two runs change no byte: met.** `diffrc=0`, one `wrote` line per file, and the bytes are identical under `/usr/bin/python3`.
- **The ASCII grep over `docs/figures/*`: met.** It prints nothing.
- **The plan-help grep: met.** It prints nothing (`grep -r` form).
- **ruff: met in the form round point 10 set** (`--target-version py39`). The brief's original command, without a target version, now prints two B905 errors, since ruff 0.16.5 applies B905 when no target version is given. The report's table still claims that form passes (Proof 1).
- **A too-long label on a scratch copy: met.** Exit 1, the error names the figure and the box, and nothing is written. The label part of the message is Spec 1.
- **minidom: met.** `xmlrc=0`.
- **Render and read: met.** Every label is legible, nothing overlaps, every arrow meets its box, and the three marks differ by shape and word, the band's included.
- **Each box against its Stops table: met.** Every stop row is marked or named as left out, and every refusal is unmarked. The band's sentence is Spec 2, and the two marks on one stop are Spec 3.
- **Contrast: met.** No new colour, by the colour inventory above, and the first refuter's ratios stand.
- **README against the prose standard: partial.** Standards 1 and 2.

### 1. Spec

1. **`docs/figures/gen_figures.py:342-343` and `:361-362`:** `put.check(cursor, line)` inside `for line in _wrap(..., box.body, ...)` and `for line in _wrap(..., box.note, ...)`. The same happens for a plain-note group at `:356`.
   - **What is wrong:** the brief's item 1 asks for "an error naming the figure, the box and the label", and the docstring (`:24`) says "the message names the figure, the box and the label". For a body or a note that runs past its box, the message names only the wrapped line where the box ran out. The rerun printed `the label 'archive. /roadmap done' does not fit the box`. That fragment spans two of the script's string literals, so `grep` on the script does not find it.
   - **Failure scenario:** a maintainer lengthens a box body after a Stops table changes. They get a "label" that appears nowhere in the file, and they cannot find which string to shorten.
   - **Fix, small and inside the brief:** pass `box.body`, `box.note` or `name` as the label to `put.check` in place of `line`.
   - **Verdict:** item 1 violated.
2. **`docs/figures/gen_figures.py:650-651`:** "Only the stops marked in these two figures reach you, and the rest of the row runs without asking."
   - **What is wrong:** `plan-orchestration` "The recurring-findings pass" says that "Every tenth landed step, and at any pause", a cause in three or more steps "is booked in the open items, since the user rules on it". Its Rules say "The open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass". So under `/plan-orchestration`, something that is not a stop in either figure reaches the user to rule on. The sentence is true for every Stops row, so the closure of the first Spec 3 reproduces for the `/land` rows and the roadmap diff.
   - **Failure scenario:** a user reads the band as the full list of what comes to them, then meets a recurring-findings proposal in the open items after the tenth landed step.
   - **Source of the wording:** the round brief dictated it (point 3), so it is the orchestrator's wording under the change standard's rule 4. One way to close it: add ", with the proposals of its recurring-findings pass" after "these two figures".
   - **Verdict:** none. The item's text ("only the marked stops reach the user") carries the same gap.
3. **`docs/figures/gen_figures.py:494` and `:663`:** the closing box has `Group(EVERY_RUN, ("The roadmap diff",))`, and the band has "The roadmap diff, at the closing" under `ONLY_WHEN`.
   - **What is wrong:** the same Stops row of `plan-orchestration` carries "every run" on the pipeline and "only when" on the band. The legend defines "every run" as "it waits on you each time it runs" and "only when" as "it waits on you in the named case".
   - **Failure scenario:** a reader who compares the two figures cannot tell whether the roadmap diff always comes at a closing, or only in some case.
   - **Source:** point 3 of the round brief dictated the "only when" mark, so the choice is the orchestrator's. Either mark it "every run" on the band too, or leave the name on the band unmarked and pointing at the pipeline's closing box.
   - **Verdict:** none.

### 2. Proof

1. **`.scratch/2-e-grill/agents/reviews/12a-report.md`, "Repair round 1", opening:** "the sections above were brought to the end state (the script, the row counts, the box table, the images seen, the verify list)."
   - **What is wrong:** four passages above the round section still describe round 0.
     - **Line 36, "DONE / NOT DONE", row "Case: ruff":** it gives `ruff check --select ... --line-length 100` with "DONE. `All checks passed!`". My rerun of that exact form prints `Found 2 errors` (B905 at `:395` and `:547`), because the round removed `strict=True`.
     - **Line 896, "Places that should name the figures":** it quotes `docs/figures/gen_figures.py:14:Run, from any directory: ...`. Line 14 now reads "Run, from the repository root: ...".
     - **Line 907, "Reading of the README sentences ...":** it says "the sentences are 37 and 26 words ... the second sentence's colon defines the one mark it uses". Line 48 now has three sentences of 15, 22 and 7 words, line 52 has 19 words, and neither line has a colon.
     - **Line 37, the too-long label row:** it describes the old four-times case and its old message.
   - **The decision that rests on it:** the orchestrator's Closed disposition of the first refuter's Proof 1, and the ruff case's verdict at landing.
   - **Failure scenario:** a lander who reads the table reruns the brief's ruff command, gets two errors and a report that says it passes, and cannot tell which is current.
   - **Fix at landing:** correct the four passages, or state under Closed that the round section supersedes them.
   - **Verdict:** round point 11 not closed. It makes no item of the brief violated.

### 3. Standards

1. **`README.md:54`:** "... a card for when a command stops, a card for when it refuses, and the /plan-orchestration band. Each box lists the stops where you are asked, marked only when."
   - **What is wrong:** the diff makes this sentence false. The round gave the plan-loop figure the "optional" mark on the band and on the new `/ordo-help <entry>` card, and the alt text neither lists that card nor allows any mark but "only when". The figure's own `aria-label` was updated ("the optional /ordo-help, and the optional /plan-orchestration band"). The README's alt text was not.
   - **Rules broken:** the refute skill's Standards heading on a sentence the diff makes false, and brief item 2's "alt text that states what the figure shows".
   - **Failure scenario:** a screen-reader user of the README hears that the loop has only "only when" stops and no `/ordo-help` card. They do not learn that the band is optional or that `/ordo-help <entry>` is there at any point.
   - **Verdict:** item 2 violated.
2. **`README.md:48` and `README.md:52`:** "This figure shows the pipeline of one roadmap entry and where each skill asks you." and "This figure shows the loop of one step and the band that runs it unattended, with the same marks." Also line 48: "A skill marked "optional" may be skipped."
   - **What is wrong:** two consecutive introductions share one sentence shape, "This figure shows the <X> of one <Y>". The prose standard's section 0 says "No repeated construction. A sentence shape that recurs across entries or sections is a template". The last sentence is passive while its actor is the reader, whom the line before addresses as "you". Section E says "Passive voice: rewrite unless the actor is irrelevant".
   - **Failure scenario:** a README reader meets two paragraphs built from one template in a row, the pattern the prose standard exists to remove.
   - **Fix at landing:** for example, "The pipeline below marks where each skill of a roadmap entry asks you." and "You may skip a skill marked "optional"."
   - **Verdict:** the README reading case is partial.

### 4. Behaviour

None. Each user-visible change of the round has its before and after in the report's round section: the new card, the band's mark and stop, the `/ordo-init` body and note, the "close them" and second `/refute` rows, the README lines, and the run under Python 3.9.

### Declined to judge

- **Rendering on GitHub:** the figures were rendered only with `rsvg-convert`, whose default sans-serif is the only font metric tried. GitHub's image scaling was not seen.
- **Whether `/repo-setup` meets `/ordo-init`'s stops when it runs it:** this bears on the `/repo-setup` box's marks. I did not read `repo-setup`'s Steps to that depth.
- **The wording that closes Spec 2 and Spec 3:** both texts were dictated by the round brief, so the choice is the orchestrator's under rule 4.
- **Whether the ruff case should be judged in the brief's original form or with `--target-version py39`:** the round brief set the second form. `python.md`'s "Python <3.10> or newer" is a template placeholder, and Ordo has no `pyproject.toml`. Which version Ordo's scripts target is not recorded anywhere I read, beyond the round brief's statement that they run on 3.9.
- **The `/ordo-init` note's "writes nothing":** it quotes that skill's own step 1, although step 5 of the same section makes the fixes the user approves. I took the skill's text as the source and did not judge the skill.

Reviewer usage: tokens and minutes not measured by the reviewer (the completion notice carries them); 27 tool uses.

## Closed

- First run, Spec 1 to 5, Proof 1, Standards 1 to 4, Behaviour 1: sent to the builder in repair round 1 (`agents/briefs/12a-round-1.md`, points 1 to 11); the run over the round found points 1 to 10 closed.
- Round 1, Spec 1: fixed at landing, `put.check` gets the whole body, note or name.
- Round 1, Spec 2: fixed at landing, the band's sentence names the proposals of the recurring-findings pass.
- Round 1, Spec 3: fixed at landing, the band marks "The roadmap diff, at the closing" "every run", as the pipeline does.
- Round 1, Proof 1: fixed at landing in the ledger copy of `12a-report.md`: the ruff row, the too-long-label row, the docstring line and the README reading.
- Round 1, Standards 1: fixed at landing, the plan-loop alt text.
- Round 1, Standards 2: fixed at landing, the two README introductions.
- Declined to judge, "whether `/repo-setup` meets `/ordo-init`'s stops": left to Axel's reading of the figures, named in the open item "Step 12a reading".
