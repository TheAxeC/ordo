Everything in the brief is done, under two rulings (both in `.scratch/2-h-session-retro/agents/briefs/3-cases.md`): **point, of a sessions report** goes between **plan-terms block** and **position line** and **window, of the transcripts** between **verify list** and **wip**, since the block is sorted; and the side row's height is `side_h = 210`, since the generator refuses the `/session-retro` box at 180, 190 and 200.

Open items of 2.H's state file, verbatim:

- Step 2 reading (2026-09-30): step 2, the `session-retro` skill, landed unticked, since its check is your reading of `skills/session-retro/SKILL.md` and `templates/sessions.md` against `docs/dev/skill-layout.md` and the Goal (ruling "Overnight work applies to this plan"). Options: (a) you read it and tick step 2, or name what is wrong; (b) tick it unread. Recommendation (a). The lazy option is (b).

## The first run of every case on the unchanged tree

- README grep, `grep -n "session-retro" README.md; echo "rc=$?"`: prints nothing, rc=1 (fails now, as the brief says).
- Text column, README (`-v k=1`) and `skills/ordo-help/SKILL.md` (`-v k=2`): print nothing, rc=0 (holds).
- Figure, `grep -c "/session-retro" docs/figures/pipeline.svg`: prints `0` (fails now). `python3 docs/figures/gen_figures.py` prints `wrote docs/figures/pipeline.svg (28161 bytes)` and `wrote docs/figures/plan-loop.svg (30454 bytes)`, rc=0; `/usr/bin/python3` prints the same, rc=0; `md5 docs/figures/pipeline.svg` is `a8041ffa5afe94f2a7c09c534f9322ed` after each; `cmp` of both svgs against copies taken first prints no difference (holds).
- Use instead, `grep -n "session-retro"` over `ordo-help`, `plan-retro`, `refute`, `plan-orchestration` SKILL.md: prints nothing, rc=1 (fails now).
- Glossary headwords, `grep -c '^- \*\*<headword>\*\*:'` in `plan-terms.md` and `docs/glossary.md`: 0 and 0 for each of the seven (fails now). `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, rc=0 (holds).
- Descriptions, the skill-layout command: `396 skills/ordo-help/SKILL.md`, `616 skills/plan-retro/SKILL.md`, `951 skills/refute/SKILL.md`, `788 skills/plan-orchestration/SKILL.md`; all at most 1,024 (holds). Its other lines: 905 diagnose, 748 grill, 726 land, 632 ordo-init, 477 plan, 861 repo-setup, 997 roadmap, 779 session-retro, 1022 spec.
- ASCII, `LC_ALL=C grep -n '[^ -~]'` over the ten changed files: prints nothing, rc=1 (holds).

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1 README (line 7, table row, Quick start line, alt text, install loop) | DONE | `grep -n "session-retro" README.md` prints lines 7, 25, 48, 56 and 100 |
| 2 figure and generator | DONE | `python3` and `/usr/bin/python3` both write `pipeline.svg` (31211 bytes, md5 `5d772f7a670607a36a03a8b2c64c1941` each) and `plan-loop.svg` (30454 bytes, `cmp` against the copy taken first prints no difference); `grep -c "/session-retro" docs/figures/pipeline.svg` prints 3; the `<title>` equals the README alt text (compared as strings, equal) |
| 3 ordo-help | DONE | line 27 (row) and line 86 (sequence line) |
| 4 refute, plan-orchestration | DONE | `skills/refute/SKILL.md:27`, `skills/plan-orchestration/SKILL.md:30` |
| 5 plan-retro | DONE | `skills/plan-retro/SKILL.md:25` |
| 6 glossary | DONE | each of the seven headwords counts 1 in `plan-terms.md` and in `docs/glossary.md`; `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`; template glossary line 3 names `session-retro` after `plan-retro` |

Text column: the two awk commands of "Cases" (README `-v k=1`, `skills/ordo-help/SKILL.md` `-v k=2`) print nothing, rc=0.

Descriptions (skill-layout command, changed skills): ordo-help 396, plan-retro 616, refute 951, plan-orchestration 788, all at most 1,024. No description changed.

Ruff: `ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py` prints `All checks passed!`; `ruff format --check ...` prints `1 file already formatted`.

ASCII: `LC_ALL=C grep -n '[^ -~]'` over the ten changed files, `plan-loop.svg` and this report prints nothing.

Glossary order: `grep "^- \*\*" skills/repo-setup/templates/plan-terms.md | sed 's/^- \*\*//; s/\*\*:.*//' | tr -d '`' | LC_ALL=C sort -f -c` prints nothing, exit 0 (114 entries).

The verify list through the runner, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh <state file>; echo "rc=$?"`, printed (the final `rc=0` line was printed by the echo):

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

## The render read

`rsvg-convert docs/figures/pipeline.svg -o $TMPDIR/b3/pipeline.png` (exit 0) and the PNG opened with the Read tool. The side row shows four dashed boxes in a row, each fully inside its border: `/plan-retro` (under "AFTER PLANS HAVE RUN"), `/session-retro`, `/ordo-help` and `/diagnose` (the last three under "AT ANY POINT"). `/session-retro` shows its body in four lines, the "optional" pill, "every run" with "The proposals", "only when" with "A large output", the last line above the box's lower edge. The legend "HOW TO READ THE MARKS" sits below the row inside the canvas (966 px high). The setup row and the entry row are unchanged.

## Each changed line

- `README.md` line 7: the sentence ending "`plan-retro` turns what the reviewers keep finding into rules." becomes "..., `plan-retro` turns what the reviewers keep finding into rules, and `session-retro` reads the transcripts of Claude Code sessions and, for what went well and what went wrong, proposes a change to a named rule, skill or brief."
- `README.md`: table row 25 added after `plan-retro`; Quick start line 48 `/session-retro <entry>` added after `/plan-retro` with its text at column 31; alt text of the pipeline figure names "/plan-retro, /session-retro, /diagnose and /ordo-help"; install loop has `session-retro` between `roadmap` and `spec`.
- `docs/figures/gen_figures.py`: docstring "with /plan-retro, /session-retro, /diagnose and /ordo-help beside them."; `side_h = 210` added and the canvas height (`side_top + side_h + 68`) and the legend y (`side_top + side_h + 26`) written from it, in place of 150 and 176; the four boxes at x 25, 279, 533 and 787 with width 228; captions "AFTER PLANS HAVE RUN" (x 25, width 228) and "AT ANY POINT" (x 279, width 736); the new `session_box`; the description names /session-retro.
- `docs/figures/pipeline.svg` regenerated (28161 bytes before, 31211 after); `docs/figures/plan-loop.svg` byte for byte unchanged.
- `skills/ordo-help/SKILL.md`: "Use instead" row and sequence line as items 3 gives them; the description is unchanged.
- `skills/refute/SKILL.md`, `skills/plan-orchestration/SKILL.md`, `skills/plan-retro/SKILL.md`: one row each as items 4 and 5 give them.
- `skills/repo-setup/templates/plan-terms.md`: seven entries, word for word from the brief, at the places above; `docs/glossary.md` synced with `--write` (`written: the plan-terms block now equals the template`); `skills/repo-setup/templates/docs/glossary.md` line 3 names `session-retro` after `plan-retro`.

## The grep of `session-retro` across `skills/`, `docs/`, `utils/` and `README.md`

Command: `grep -rn "session-retro" skills docs utils README.md`, without `skills/session-retro/`. Every hit is one of the changes above, or `docs/roadmap.md:42` and `:45` (the entry 2.H, still true), `docs/dev/change-standard.md:72` and `docs/dev/building.md:11` (the reader's test line, still true). The `plan-retro` grep (`grep -rn "plan-retro" README.md docs/figures/gen_figures.py skills/*/SKILL.md`) lists every place that names `plan-retro` beside `diagnose`; each now has `session-retro` beside it (README lines 7, 47 and 56, the figure, `ordo-help` line 85, the "Use instead" tables of `refute` and `plan-orchestration`); the `ordo-help` description does not name `plan-retro`.

## Judgment calls the brief left open

- The `/session-retro` Quick start text in `ordo-help` and the README is the brief's text, identical in both.
- The `gen_figures.py` description string was rewrapped across source lines to stay within 100 characters; the string itself is what item 2 gives.

## Wrong or impossible in the brief

- Item 6 placed **point, of a sessions report** and **window, of the transcripts** out of alphabetical order; ruled as above.
- Item 2's height 180 is refused by the generator with the brief's stops (`error: pipeline.svg: box '/session-retro': the label 'only when' does not fit the box`); ruled as 210.
- Definitions: the seven were read against `skills/session-retro/SKILL.md`, `templates/sessions.md` and `templates/transcript_window.py` ("start <= its timestamp < end"); none is false.

## Repair round 1

Everything in the round's brief is done.

### Changes, old beside new

- Point 1: `skills/repo-setup/templates/plan-terms.md` gains two entries word for word from the brief, **part, of an output** after **part file** and **reader, the** before **recurring finding**; `docs/glossary.md` is synced. Before: no entry for either term. After: each headword counts 1 in both files.
- Point 2, `README.md` line 7. Before: "..., and `plan-retro` turns what the reviewers keep finding into rules" was followed, in the same sentence, by "and `session-retro` reads ...". After: "..., inside a plan's loop or on its own, and `plan-retro` turns what the reviewers keep finding into rules. `session-retro` reads the transcripts of Claude Code sessions and proposes a change to a named rule, skill or brief for what went well and for what went wrong."
- Point 2, `README.md` table row 25. Before: one sentence "Reads the transcripts of a plan's Claude Code sessions, one session, or a time window, and reports what went well, to keep, and what went wrong, to change, each point with its place quoted and a proposed change to a rule, skill or brief, which the user decides on". After: "Reads the transcripts of a plan's Claude Code sessions, of one session or of a time window. It reports what went well, to keep, and what went wrong, to change. Each point quotes its place and proposes a change to a rule, skill or brief, which the user decides on".
- Point 3: the double blank line before "## DONE / NOT DONE" in this report is one blank line; `awk 'prev=="" && $0=="" {print "double blank at " NR} {prev=$0}'` prints nothing.

### Checks

Glossary counts, `grep -c '^- \*\*<headword>\*\*:'` in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: change point 1 1, keep point 1 1, place, of a point 1 1, point, of a sessions report 1 1, sessions report 1 1, window, of the transcripts 1 1, working folder 1 1, part, of an output 1 1, reader, the 1 1.

Sort check, `grep "^- \*\*" skills/repo-setup/templates/plan-terms.md | sed 's/^- \*\*//; s/\*\*:.*//' | tr -d '`' | LC_ALL=C sort -f -c; echo sortrc=$?`: prints `sortrc=0`.

Sync: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` prints `written: the plan-terms block now equals the template`; without `--write` it prints `ok: the plan-terms block equals the template`.

README grep, `grep -n "session-retro" README.md | cut -c1-40`:

```
7:Around that loop, `repo-setup` and `or
25:| `session-retro` | Reads the transcr
48:/session-retro <entry>        for a p
56:![The pipeline of one roadmap entry a
100:    for skill in diagnose grill land
```

The verify list, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh <state file>; echo "rc=$?"`, printed:

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

ASCII, `LC_ALL=C grep -n '[^ -~]' README.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` and this report: prints nothing (`asciirc=1`).

### Judgment calls

- The clause "one line `<id> <line> <timestamp> <label>: <text>` for each item" of **reader, the** is kept as the brief gives it. In "The reader" a text of several lines continues on lines indented by two spaces, so the line named is the first line of each item; the clause holds for that line.
- Each clause of the two entries was read against Steps 6 and "The reader": the 30,000-byte limit, the one longer line on its own, the Read tool, the record as read in the report, the two forms (a window, `--session`), the line format and `<REDACTED>` are all stated there; no clause is false.
