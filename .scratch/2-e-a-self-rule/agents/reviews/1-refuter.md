# Step 1 refuter report (on .agents/worktrees/2ea-1, base 67428df)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Brief, "Verify before you report" 1, from the worktree root, `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` (exit 0):

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
```

Verify 2, `python3 skills/ordo-init/templates/check_config.py .` (exit 0): no `error:` line (`| grep -c '^error:'` prints `0`), among the notes `note: self_rule not set, default off applies` and `note: next_entry not set, default off applies`, last line `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`.

Verify 3: `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests`.

Verify 4: `grep -n '^repair_reviewer: claude:sonnet' .agents/plan.yaml` prints one line, `11:repair_reviewer: claude:sonnet            # claude:<model> the run of /refute over a repair round runs on: Sonnet, since that run checks a narrow delta against named findings at half Opus's price per token.`

Verify 5: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.

Verify 6: `git diff 67428df | grep -n '^[+-].*version:'` prints nothing (grep exit 1).

ASCII over the touched files: `git diff 67428df --name-only | xargs env LC_ALL=C grep -n '[^ -~]'` prints nothing (exit 1). The same over the report file prints nothing (exit 1). `git status --short` lists the 11 files of the brief's path list and `?? .scratch/2-e-a-self-rule/agents/reviews/1-report.md`, nothing else.

Verify 7, the first run reproduced. `git show 67428df:<path>` of `check_config.py`, `plan.yaml` and `plan.projects.yaml` went into `$TMPDIR/refute-2ea1.0YXECY/skills/...` with the worktree's `check_config.test.sh` beside the old script. The real file on that tree stops at its first failure, the same one the report quotes:

```
FAIL: projects-three-control: missing the line [note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies] in: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it
note: tool-b: adr folder docs/adr does not exist yet; repo-setup or grill creates it
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
```

In a copy whose `fail` returns instead of exiting (`diff` shows only `exit 1` changed to `return 0`), the distinct case names with a FAIL line number 36. They are exactly the 36 of the report's table: projects-three-control, the nine holds-*, three-keys-removed, repair-default-haiku, repair-default-no-reviewer, repair-default-bad-reviewer, repair-set-no-reviewer, self-rule-on/yes/true/On/maybe/quoted/empty, next-entry-number, next-entry-empty, next-entry-self-off, next-entry-self-absent, next-entry-self-bad, projects-next-entry, repair-sonnet/opus/list/number/empty, projects-repair, worker-empty, reviewer-empty. I compared the first FAIL line with the report for eight of them (holds-tool-b-repair_reviewer, repair-set-no-reviewer, self-rule-quoted, next-entry-self-bad, projects-next-entry, worker-empty, repair-default-bad-reviewer, three-keys-removed), and each matches its row. On the base, three-keys, projects-three, twice-self_rule, twice-next_entry, twice-repair_reviewer and projects-beside each have 0 FAIL lines.

Existing tests: the base's `check_config.test.sh` run against the base code prints `PASS: check_config.py scratch tests`. The same file run against the changed code and templates also prints `PASS: check_config.py scratch tests`. `git diff 67428df -- skills/ordo-init/templates/check_config.test.sh` changes only head-comment lines 3-4 and appends after line 353, so no existing case was edited.

Other commands the report quotes: the `wc -l` counts reproduce (30, 59, 70, 139, 239, 565, 172, 120, 137, 14, 180, and 354 for the base test file). `git diff 67428df --stat` prints `11 files changed, 278 insertions(+), 19 deletions(-)`. `grep -rn "written beside\|takes the value written\|default written" skills utils docs README.md` hits only `skills/session-retro/SKILL.md:134` and `docs/roadmap.md:46`, both about other things. The premises of "What is on the tree" all reproduce on the base: `example_keys` at line 87, `VALUE_CHECKED` at 33, `MODEL` at 29, the loop at 141, the kind check at 149, `plan.yaml` 27 lines, `plan.projects.yaml` 53 lines with effort at 28-29 and 52-53, the state template's lines 13/14/26/27, `.agents/plan.yaml` 13 lines, `README.md:141`, and `yaml.safe_load` printing `{'a': True} {'a': False}`.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `plan.yaml:28-30` hold the three lines with the dictated text in column 43, like the file's 26 other key lines (`awk` on the index of `#`), and line 3 reads "An optional key that is missing takes the default its comment gives." `example_keys` reads `repair_reviewer`'s default as the text `the reviewer value`.
- 2: holds. `plan.projects.yaml:30-32` and `:57-59` put the three keys after `reviewer_effort` in both projects.
- 3: holds, with Standards 1. The key joins `VALUE_CHECKED` (`check_config.py:36`), with `check_switch` (`:139-146`), the model loop over `worker`, `reviewer` and `repair_reviewer` without the None skip (`:170-172`), `default_note` (`:127-136`), the `next_entry` note (`:176-177`) and the docstring (`:6`, `:12`, `:17-18`, `:21`). The docstring's "in any capitalisation" comes from the brief's own wording and is false (Standards 1).
- 4: holds, with Standards 3. Every case has a test (see below), and head-comment lines 3-4 list them, the guards and the probes included.
- 5: holds. `orchestrator-state.md:28-30`.
- 6: holds. `skills/plan/SKILL.md:99` gains the three keys, and `:100` is the `repair_reviewer` sentence.
- 7: holds. `skills/ordo-init/SKILL.md:98`, `:132` and `:133`, plus the sub-bullet at `:134`.
- 8: holds. `plan-terms.md:23` and `glossary.md:28` are identical, and the sync check passes.
- 9: holds. `.agents/plan.yaml:11` carries the dictated comment verbatim.
- 10: holds. `README.md:141`.
- 11: holds. Verify 6 prints nothing.

Cases of the brief's "Cases":

- One-project example as shipped passes, with no not-set notes: met under ruling (b). `three-keys` is a guard that passes on the base and after. `holds-self_rule`, `holds-next_entry` and `holds-repair_reviewer` fail on the base with `unknown key` and pass after.
- Projects example as shipped, no notes, and the control: met under ruling (b). `projects-three` is a guard that passes on the base and after. `projects-three-control` fails on the base and passes after. The six `holds-tool-*` probes fail on the base with `<project>: unknown key` and pass after.
- The three keys removed, with the three notes: met, `three-keys-removed`.
- `reviewer: claude:haiku` with `repair_reviewer` removed: met, `repair-default-haiku`.
- `reviewer` and `repair_reviewer` both removed: met, `repair-default-no-reviewer`.
- `reviewer: opus` with `repair_reviewer` removed: met, `repair-default-bad-reviewer`.
- `reviewer` removed with `repair_reviewer: claude:sonnet`, one error line: met, `repair-set-no-reviewer`.
- `self_rule: on` and `next_entry: on`, no note naming `next_entry`: met, `self-rule-on` (`lacks_text`).
- `self_rule: yes`, `true`, `On`: met, `self-rule-yes`, `self-rule-true`, `self-rule-On`.
- `self_rule: maybe`: met, `self-rule-maybe`.
- `self_rule: "on"`: met, `self-rule-quoted`.
- `self_rule:` with nothing: met, `self-rule-empty`.
- `next_entry: 1`: met, `next-entry-number`.
- `next_entry:` with nothing: met, `next-entry-empty`.
- `next_entry: on` with `self_rule: off`: met, `next-entry-self-off`.
- `next_entry: on` with `self_rule` removed: met, `next-entry-self-absent`, with both notes.
- `next_entry: on` with `self_rule: maybe`: met, `next-entry-self-bad`.
- Projects, tool-b `next_entry: on` with `self_rule: off`: met, `projects-next-entry`.
- `repair_reviewer: opus`, `[claude:opus]`, `5` and nothing: met, `repair-opus`, `repair-list`, `repair-number`, `repair-empty`.
- `repair_reviewer: claude:sonnet` passes: met, `repair-sonnet`.
- Projects, tool-a `repair_reviewer: opus`: met, `projects-repair`.
- `worker:` and `reviewer:` with nothing: met, `worker-empty`, `reviewer-empty`.
- (preserved) each of the three keys written twice: met, `twice-*` passes on the base and after.
- (preserved) `repair_reviewer` beside `projects:`: met, `projects-beside` passes on the base and after.
- Ruling (b) items 3-4: met. `check_config.py` has no code for the probes, and head-comment line 4 lists the two guards and nine probes.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

1. `skills/ordo-init/templates/check_config.py:17` and `:143`.
   - Hunk: "- self_rule or next_entry is not a boolean, which YAML reads from on, off, yes, no, true and false in any capitalisation: the text on or off in quotes has its own message" and `if isinstance(value, str) and value.lower() in ("on", "off"):`.
   - What is wrong: PyYAML reads only the lower, capitalised and upper-case spellings as booleans. `python3 -c "import yaml;print([yaml.safe_load('a: '+v)['a'] for v in ['on','On','ON','oN','true','tRUE','Off','oFF']])"` prints `[True, True, True, 'oN', True, 'tRUE', False, 'oFF']`. The docstring sentence is therefore false, which breaks the rules file's rule 14 (a docstring sentence the change makes false). The quoted-text message is also chosen on `value.lower()`, so an unquoted mixed-case word gets it. The false phrase comes from the brief's item 3 ("as YAML reads `on`, `off`, `yes`, `no`, `true`, `false` in any capitalisation"). The builder carried it over without checking.
   - Failure scenario: probed on a scratch copy of the example. `self_rule: oN`, written without quotes, gives `error: self_rule is the text 'oN' in quotes; write on or off without quotes`, and `OFf` does the same. The user is told to remove quotes that are not there. `self_rule: tRUE` gives `error: self_rule is neither on nor off: 'tRUE'`, although the docstring tells a maintainer it is read as a boolean.
   - The refusal itself is right, so no wrong configuration is accepted.
   - Verdict: item 3 holds as the brief wrote it. This finding is about the sentence and the message.
2. Two statements now contradict each other (rules file rule 19).
   - Hunk: `skills/plan/templates/plan.yaml:30` "claude:<model> the run of /refute over a repair round runs on, at reviewer_effort.", with the same claim at `orchestrator-state.md:30` and `.agents/plan.yaml:11`.
   - Against it: `docs/glossary.md:93` and `skills/repo-setup/templates/plan-terms.md:88` (**reviewer**: "the fresh session or agent that refutes a built step ..., on the model the configuration block's `reviewer:` names"), `refute` Steps 1 and "Steps / Over a repair round" 1 ("dispatched as Steps 1 says", on `reviewer:`), and `plan-orchestration` "The two tiers, and the models" (Reviewer: "The model the configuration block's `reviewer:` names").
   - What is wrong: rule 19 asks for the contradicting statement to be changed in the same step, or reported as a stop. The report does neither. Plan step 3 changes `refute` and `plan-orchestration`. No step of `plan.md` names the glossary's **reviewer** term: step 8 lists self-rule, choices file, next-entry mode, open item and ruling.
   - Failure scenario: after the plan closes, a reader of the glossary's **reviewer** term still learns that every refutation runs on `reviewer:`. An orchestrator following the term would run the repair-round refuter on Opus, against ADR 0007's decision.
   - Verdict: none. Closing it needs either step 3's brief to take in the **reviewer** term, or a line range of `plan-terms.md` and the glossary; the orchestrator decides which.
3. `skills/ordo-init/templates/check_config.test.sh:4`, `:552`, `:560`, and `:381`, `:388`.
   - Hunks: "... is refused as before." (line 4); "Preserved: the duplicate scan runs on the file as written." (552); "Preserved: the keys of a project are not accepted beside projects:." (560); "Guard, passing before and after the change: ..." (381, 388).
   - What is wrong: these comments describe the code relative to a change that has no referent once the step lands. The rules file's rule 10 says a comment never says what the code did before. Lines 381 and 388 follow ruling (b) item 1 word for word ("each marked in its comment as a guard that passes before and after the change"), so the ruling itself asks for such a comment. "as before" and "Preserved:" at 4, 552 and 560 were not dictated.
   - Failure scenario: a maintainer reading the test file later meets "as before", "Preserved" and "before and after the change" and cannot tell which change is meant. The comment should instead say what the case checks, for example "the duplicate scan runs on the file as written".
   - Verdict: item 4 holds on content. This finding is about the wording.
4. The builder's report, "Carried to every place that names a change (rule 14)".
   - What is wrong: rule 14 asks the report to list each sentence about a changed file as a whole (an introduction, a head comment, an "every" or an "only"), each with the line that shows it still holds. The report gives the greps but not that list.
   - I reread the sentences and each holds: `README.md:139` "The example `plan.yaml` describes every key."; `skills/plan/SKILL.md:33-34` "the default of each optional one are in `templates/plan.yaml`" and "takes the default the example file gives it"; `check_config.py:6`; `check_config.test.sh:2`.
   - Failure scenario: a sentence the change made false would go unlisted. None was found here, so no text change follows from this finding.
   - Verdict: none.

## 4. Behaviour

none. The one user-visible behaviour the report does not state, the quoted-text message for an unquoted mixed-case `oN` or `OFf`, is under Standards 1.

## Declined to judge

- Whether the cases that assert only a note (the `next_entry` note, the `repair_reviewer` default notes) meet the rules file's rule that a test exists only for behaviour whose failure costs something. The brief's "Cases" dictate them, so that is the orchestrator's decision.
- The term "self-rule" is used in `plan.yaml:28`, `orchestrator-state.md:28`, `skills/ordo-init/SKILL.md:134` and the `check_config.py` note before `docs/glossary.md` defines it. `docs/dev/skill-layout.md` "Writing for an agent" asks for the term to be added first. The brief's item 1 and plan step 8 schedule the term, and that ordering is the plan's.
- This plan's own configuration block (`.scratch/2-e-a-self-rule/orchestrator-state.md`) holds none of `self_rule`, `next_entry` or `repair_reviewer`, as the `cat` of the state file shows. Step 3's check (step 4's repair-round run served Sonnet) needs `repair_reviewer` in that block. The ledger is the orchestrator's and outside step 1's paths.
- The `repair_reviewer` comment in `orchestrator-state.md:30` starts at column 34 while the rest of the block uses column 30. The key and value are 31 characters, so they cannot fit the column. Not judged a defect.
- Whether the new prose is good beyond the rules checked above. This review read it against the prose standard's hard rules and found no break.
- The report's scratch paths (`base-first.txt`, `cont.sh`) were not opened, since no decision rests on them. The first run was reproduced independently, as above.

Reviewer usage: ordo-high, agent ae9f3748642ce9c1e, claude-opus-5-5, 177519 tokens, 38 tool uses, 8.7 minutes.
