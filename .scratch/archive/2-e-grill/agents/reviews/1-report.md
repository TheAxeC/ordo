# Report: step 1, Ordo's own `docs/adr/` and the ADR test in the template

Everything in the brief is done.

## Open items of the state file, verbatim

Quoted from the worktree's `.scratch/2-e-grill/orchestrator-state.md` (`sed -n '/^## Open items/,/^## /p'`), which may be older than main:

- A (step 12a, the figures): how the figures are drawn. (a) A generator script, `docs/figures/gen_figures.py`, in the form of research-hub's `tools/figures/gen_figures.py`: it computes only the SVG files from the boxes, arrows and labels written in it, and nothing else; the SVGs are committed; no test, since a wrong figure is caught by reading it. Pro: a change to the pipeline is an edit of a list, and the figures stay consistent in size and colour. Con: one more script in Ordo. Approving (a) approves that computation. (b) The SVG files written by hand, no script. Pro: no script. Con: every change is an edit of coordinates, and the figures drift apart. Recommendation: (a). The lazy option is (b). Blocks step 12a only.

## The cases' first run, on the unchanged tree (worktree at 1645496)

`git diff --stat bc83a4d HEAD` lists only `.scratch/2-e-grill/agents/briefs/1.md` and `.scratch/2-e-grill/agents/reviews/1-brief-check.md`, so the files the cases read are as on bc83a4d.

| Case | First run | Result |
|---|---|---|
| `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md` prints nothing | `diff: docs/adr/README.md: No such file or directory`, exit 2 | fails, as the brief predicts |
| `diff docs/adr/template.md skills/repo-setup/templates/docs/adr/template.md` prints nothing | `diff: docs/adr/template.md: No such file or directory`, exit 2 | fails, as predicted |
| The template README states the test, the plan-ruling rule, the superseding ADR, the in-place refinement (by reading) | `cat -n` line 3 reads "A record per decision that is not obvious from the code, with the reasoning and the alternatives rejected. ... a decision that changes gets a new ADR that supersedes the old one." It has no "binds work after the plan closes", no "every other decision stays a plan ruling" and no refinement rule | fails, as predicted |
| The README carries no date, no history, no project name (by reading) | No date, history or project name in the 8 lines | holds on the unchanged tree |
| `git diff bc83a4d -- skills/repo-setup/templates/docs/adr/README.md` changes only the first paragraph | prints nothing, exit 0 | no change yet; the case is about the diff after the change |
| `git diff bc83a4d -- skills/repo-setup/templates/docs/adr/template.md` prints nothing | prints nothing, exit 0 | holds |
| `skills/repo-setup/templates/CLAUDE.md` line 21 reads as item 4 gives it | `sed -n 21p` prints "- `docs/adr/`: the decisions, with the alternatives rejected. A change that contradicts an ADR is a rule clash." | fails, as predicted |

No case is one the brief's rules get wrong, so there was no hand-back and no cases ruling.

## DONE / NOT DONE

| Item | Status | Command and output |
|---|---|---|
| 1. Template README line 3 replaced by the two paragraphs, verbatim, a blank line between; heading, naming paragraph and table unchanged | DONE | `git diff bc83a4d -- skills/repo-setup/templates/docs/adr/README.md`, below |
| 2. `docs/adr/README.md` a byte-for-byte copy of the new template README | DONE | `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md` printed nothing, exit 0 |
| 3. `docs/adr/template.md` a byte-for-byte copy of the template's `template.md`, which stays unchanged | DONE | `diff docs/adr/template.md skills/repo-setup/templates/docs/adr/template.md` printed nothing, exit 0; `git diff bc83a4d -- skills/repo-setup/templates/docs/adr/template.md` printed nothing, exit 0 |
| 4. `skills/repo-setup/templates/CLAUDE.md` line 21 rewritten, nothing else changed | DONE | `git diff bc83a4d -- skills/repo-setup/templates/CLAUDE.md`, below |
| Verify 1: the runner | DONE | output below, `checks: 8 commands passed`, exit 0 |
| Verify 3: ASCII grep | DONE | `LC_ALL=C grep -n '[^ -~]' docs/adr/README.md docs/adr/template.md skills/repo-setup/templates/docs/adr/README.md skills/repo-setup/templates/CLAUDE.md` printed nothing, exit 1 |
| Reading case: the README states the test, the plan-ruling rule, the superseding ADR and the in-place refinement | DONE | `cat -n skills/repo-setup/templates/docs/adr/README.md`, below: line 3 holds the test and "Every other decision stays a ruling of the plan that made it"; line 5 holds the superseding ADR and "A refinement that keeps the decision edits the ADR to its current state with no dated note" |
| Reading case: no date, no history, no project name | DONE | `grep -n -E ' - \|--\|20[0-9][0-9]\|Ordo\|ordo' docs/adr/README.md` printed only `10:\|---\|---\|`, the table separator; read in full, no date, history or project name |

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0:

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
```

The runner's ASCII check reads `git ls-files -co --exclude-standard`, which includes the untracked `docs/adr/` files. The checks verify facts (tests pass, ASCII, the glossary block); whether the README text is right is a judgment for the review.

`git diff bc83a4d -- skills/repo-setup/templates/`:

```diff
diff --git a/skills/repo-setup/templates/CLAUDE.md b/skills/repo-setup/templates/CLAUDE.md
index 5b064e9..23f2f7b 100644
--- a/skills/repo-setup/templates/CLAUDE.md
+++ b/skills/repo-setup/templates/CLAUDE.md
@@ -18,7 +18,7 @@
 - `docs/dev/prose-standard.md`: how every comment, page and message is written.
 - `docs/roadmap.md`: what is open and in what order. Answer "what is left?" from this file, never from memory.
 - `docs/glossary.md`: the terms this repository and the skills it is set up with use in a sense of their own, each defined once.
-- `docs/adr/`: the decisions, with the alternatives rejected. A change that contradicts an ADR is a rule clash.
+- `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A change that contradicts an ADR is a rule clash.
 
 ## Build
 
diff --git a/skills/repo-setup/templates/docs/adr/README.md b/skills/repo-setup/templates/docs/adr/README.md
index 3e80aab..5efc883 100644
--- a/skills/repo-setup/templates/docs/adr/README.md
+++ b/skills/repo-setup/templates/docs/adr/README.md
@@ -1,6 +1,8 @@
 # Architecture decision records
 
-A record per decision that is not obvious from the code, with the reasoning and the alternatives rejected. A choice is justified from this repository's goals, never from what another project does. A change that contradicts an ADR is a rule clash: it stops and is ruled on, and a decision that changes gets a new ADR that supersedes the old one.
+A record is kept per decision that is not obvious from the code and binds work after its plan closes. It holds the reasoning and the alternatives rejected. Every other decision stays a ruling of the plan that made it. A choice is justified from this repository's goals, never from what another project does.
+
+A change that contradicts an ADR is a rule clash: it stops and is ruled on. A decision that changes gets a new ADR that supersedes the old one, whose status then reads `superseded by NNNN`. A refinement that keeps the decision edits the ADR to its current state with no dated note. Git and the plan's booking hold the history.
 
 A record is `NNNN-<decision-as-a-phrase>.md` from `template.md`, numbered in order, and listed here.
 
```

The hunk changes only the first paragraph; lines 1 and 2, the naming paragraph and the table header lines are unchanged context. `git status --short` lists `M skills/repo-setup/templates/CLAUDE.md`, `M skills/repo-setup/templates/docs/adr/README.md` and `?? docs/adr/`, besides this report.

## Rules 14 and 19: statements elsewhere

`git grep -n -i -e 'ADR' -e 'decision record' -e 'supersede' -- skills utils docs README.md` finds no statement that the new text makes false. The hits are `README.md:13` and `:81` ("an ADR folder"), `docs/dev/change-standard.md:31` and its template's line 31 ("the ADR that owns the decision when the change touches one"), the template change standard's line 8 ("the ADRs the brief names"), `skills/repo-setup/SKILL.md:3`, `:118`, `:119` (the ADR folder and the copy rows), `skills/repo-setup/templates/docs/adr/template.md:3` (`Status: <proposed | accepted | superseded by NNNN>`, which matches "whose status then reads `superseded by NNNN`"), the prose standard's line 3 and `skills/roadmap/SKILL.md:148`. `docs/glossary.md` defines no ADR term (`git grep -n -i adr -- docs/glossary.md` printed nothing).

## Files and line counts

`wc -l`:

- `docs/adr/README.md`: 10 lines (new)
- `docs/adr/template.md`: 19 lines (new)
- `skills/repo-setup/templates/docs/adr/README.md`: 10 lines (was 8)
- `skills/repo-setup/templates/CLAUDE.md`: 33 lines (line 21 changed)
- `.scratch/2-e-grill/agents/reviews/1-report.md`: this report

## Judgment calls

None. The README text is the brief's item 1 verbatim; read against the prose standard's sections 0 and A to F, it needed no fix.

## Host- or user-visible changes

- A repository set up by `/repo-setup` gets the new `docs/adr/README.md`. Before, its first paragraph was the single paragraph quoted in the diff above; after, the two paragraphs quoted there.
- A repository set up by `/repo-setup` gets `CLAUDE.md` line 21 as "- `docs/adr/`: the decisions that bind work after the plan that made them closes, with the alternatives rejected. A change that contradicts an ADR is a rule clash." Before: "- `docs/adr/`: the decisions, with the alternatives rejected. A change that contradicts an ADR is a rule clash."
- Ordo gains `docs/adr/README.md` and `docs/adr/template.md`, equal to the templates, with an empty table. Before: `ls docs/adr` printed "No such file or directory".

## Wrong or impossible in the brief

Nothing.

## Repair round 1

Finding 1 (standards) is closed as ruled. In `skills/repo-setup/templates/docs/adr/README.md` and `docs/adr/README.md`, the sentence "Every other decision stays a ruling of the plan that made it." is replaced by "Every other decision the user rules on stays a ruling of the plan that made it." Nothing else in either file changed. The template diff and the reading of line 3 quoted earlier in this report are superseded by this section.

New line 3 of both files, `sed -n 3p skills/repo-setup/templates/docs/adr/README.md`:

```
A record is kept per decision that is not obvious from the code and binds work after its plan closes. It holds the reasoning and the alternatives rejected. Every other decision the user rules on stays a ruling of the plan that made it. A choice is justified from this repository's goals, never from what another project does.
```

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0:

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
```

- `diff docs/adr/README.md skills/repo-setup/templates/docs/adr/README.md` printed nothing, exit 0.
- `diff docs/adr/template.md skills/repo-setup/templates/docs/adr/template.md` printed nothing, exit 0.
- `LC_ALL=C grep -n '[^ -~]' docs/adr/README.md docs/adr/template.md skills/repo-setup/templates/docs/adr/README.md skills/repo-setup/templates/CLAUDE.md` printed nothing, exit 1.
