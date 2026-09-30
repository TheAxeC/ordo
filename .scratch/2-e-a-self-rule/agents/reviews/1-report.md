Everything in the brief is done, with the round 0 ruling on the two cases carried out (see "The cases' first run").

## Open items

None.

## The cases' first run

The unchanged tree is the tree at HEAD (67428df) for `check_config.py`, `plan.yaml` and `plan.projects.yaml`, run with the final `check_config.test.sh`. I read them from `git show HEAD:<path>` into a scratch folder, `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/base/`. The real file stops at its first failing case and exits 1:

```
FAIL: projects-three-control: missing the line [note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies] in: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it
note: tool-b: adr folder docs/adr does not exist yet; repo-setup or grill creates it
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
```

To read every case's result I ran a scratch copy of the same file, `base/skills/ordo-init/templates/cont.sh`, which differs from it only in `fail` printing and going on. 36 cases print a FAIL line. The first FAIL line of each (`base-first.txt` beside `base/`), cut at 210 characters, is in the table.

Ruling of round 0, carried out: `three-keys` and `projects-three` stay as written and are marked in their comments as guards that pass before and after the change. Each of the nine probes (`holds-*`) appends the key once to the shipped example (to tool-a and to tool-b in the projects form) and expects `key written twice`. No code was added to `check_config.py` for them.

| Case | Test | Unchanged tree | After the change |
|---|---|---|---|
| guard: one-project example as shipped, no not-set notes | `three-keys` | passes | passes |
| guard: projects example as shipped, no not-set notes for tool-a or tool-b | `projects-three` | passes | passes |
| projects control, repair_reviewer removed from tool-b | `projects-three-control` | FAIL: missing the line `note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies` | passes |
| probe, one-project example holds `self_rule` | `holds-self_rule` | FAIL: missing the line `error: key written twice: self_rule` in: `error: unknown key: self_rule` | passes |
| probe, `next_entry` | `holds-next_entry` | FAIL: missing the line `error: key written twice: next_entry` in: `error: unknown key: next_entry` | passes |
| probe, `repair_reviewer` | `holds-repair_reviewer` | FAIL: missing the line `error: key written twice: repair_reviewer` in: `error: unknown key: repair_reviewer` | passes |
| probe, tool-a holds `self_rule` | `holds-tool-a-self_rule` | FAIL: missing `error: tool-a: key written twice: self_rule` in: `error: tool-a: unknown key: self_rule` | passes |
| probe, tool-a `next_entry` | `holds-tool-a-next_entry` | FAIL: missing `error: tool-a: key written twice: next_entry` in: `error: tool-a: unknown key: next_entry` | passes |
| probe, tool-a `repair_reviewer` | `holds-tool-a-repair_reviewer` | FAIL: missing `error: tool-a: key written twice: repair_reviewer` in: `error: tool-a: unknown key: repair_reviewer` | passes |
| probe, tool-b `self_rule` | `holds-tool-b-self_rule` | FAIL: missing `error: tool-b: key written twice: self_rule` in: `error: tool-b: unknown key: self_rule` | passes |
| probe, tool-b `next_entry` | `holds-tool-b-next_entry` | FAIL: missing `error: tool-b: key written twice: next_entry` in: `error: tool-b: unknown key: next_entry` | passes |
| probe, tool-b `repair_reviewer` | `holds-tool-b-repair_reviewer` | FAIL: missing `error: tool-b: key written twice: repair_reviewer` in: `error: tool-b: unknown key: repair_reviewer` | passes |
| the three keys removed, three notes | `three-keys-removed` | FAIL: missing the line `note: self_rule not set, default off applies` (the next two lines are missing too) | passes |
| `reviewer: claude:haiku`, repair_reviewer removed | `repair-default-haiku` | FAIL: missing the line `note: repair_reviewer not set, the reviewer's value 'claude:haiku' applies` | passes |
| reviewer removed, repair_reviewer removed | `repair-default-no-reviewer` | FAIL: missing the line `note: repair_reviewer not set, the reviewer's value applies` in: `error: required key missing: reviewer` | passes |
| `reviewer: opus`, repair_reviewer removed | `repair-default-bad-reviewer` | FAIL: missing the line `note: repair_reviewer not set, the reviewer's value applies` in: `error: reviewer is not claude:<model>: 'opus'` | passes |
| reviewer removed, `repair_reviewer: claude:sonnet` | `repair-set-no-reviewer` | FAIL: expected one error line, got 2 in: `error: required key missing: reviewer` / `error: unknown key: repair_reviewer` | passes |
| `self_rule: on`, `next_entry: on`, no note naming next_entry | `self-rule-on` | FAIL: expected a pass, got: `error: unknown key: self_rule` | passes |
| `self_rule: yes` | `self-rule-yes` | FAIL: expected a pass, got: `error: unknown key: self_rule` | passes |
| `self_rule: true` | `self-rule-true` | FAIL: expected a pass, got: `error: unknown key: self_rule` | passes |
| `self_rule: On` | `self-rule-On` | FAIL: expected a pass, got: `error: unknown key: self_rule` | passes |
| `self_rule: maybe` | `self-rule-maybe` | FAIL: missing the line `error: self_rule is neither on nor off: 'maybe'` in: `error: unknown key: self_rule` | passes |
| `self_rule: "on"` | `self-rule-quoted` | FAIL: missing the line `error: self_rule is the text 'on' in quotes; write on or off without quotes` in: `error: unknown key: self_rule` | passes |
| `self_rule:` nothing | `self-rule-empty` | FAIL: missing the line `error: self_rule is neither on nor off: None` in: `error: unknown key: self_rule` | passes |
| `next_entry: 1` | `next-entry-number` | FAIL: missing the line `error: next_entry is neither on nor off: 1` in: `error: unknown key: next_entry` | passes |
| `next_entry:` nothing | `next-entry-empty` | FAIL: missing the line `error: next_entry is neither on nor off: None` in: `error: unknown key: next_entry` | passes |
| `next_entry: on`, `self_rule: off` | `next-entry-self-off` | FAIL: expected a pass, got: `error: unknown key: next_entry` | passes |
| `next_entry: on`, `self_rule` removed | `next-entry-self-absent` | FAIL: expected a pass, got: `error: unknown key: next_entry` | passes |
| `next_entry: on`, `self_rule: maybe` | `next-entry-self-bad` | FAIL: missing the line `error: self_rule is neither on nor off: 'maybe'` in: `error: unknown key: next_entry` | passes |
| projects, tool-b `next_entry: on`, `self_rule: off` | `projects-next-entry` | FAIL: expected a pass, got: `error: tool-b: unknown key: self_rule` | passes |
| `repair_reviewer: claude:sonnet` | `repair-sonnet` | FAIL: expected a pass, got: `error: unknown key: repair_reviewer` | passes |
| `repair_reviewer: opus` | `repair-opus` | FAIL: missing the line `error: repair_reviewer is not claude:<model>: 'opus'` in: `error: unknown key: repair_reviewer` | passes |
| `repair_reviewer: [claude:opus]` | `repair-list` | FAIL: missing the line `error: repair_reviewer is not claude:<model>: ['claude:opus']` in: `error: unknown key: repair_reviewer` | passes |
| `repair_reviewer: 5` | `repair-number` | FAIL: missing the line `error: repair_reviewer is not claude:<model>: 5` in: `error: unknown key: repair_reviewer` | passes |
| `repair_reviewer:` nothing | `repair-empty` | FAIL: missing the line `error: repair_reviewer is not claude:<model>: None` in: `error: unknown key: repair_reviewer` | passes |
| projects, tool-a `repair_reviewer: opus` | `projects-repair` | FAIL: missing the line `error: tool-a: repair_reviewer is not claude:<model>: 'opus'` in: `error: tool-a: unknown key: repair_reviewer` | passes |
| `worker:` nothing | `worker-empty` | FAIL: expected an error, got a pass: `note: adr folder docs/adr does not exist yet; ...` / `ok: ...` | passes |
| `reviewer:` nothing | `reviewer-empty` | FAIL: expected an error, got a pass (same output) | passes |
| (preserved) each of the three keys written twice | `twice-self_rule`, `twice-next_entry`, `twice-repair_reviewer` | pass | pass |
| (preserved) `repair_reviewer: claude:sonnet` beside `projects:` | `projects-beside` | passes | passes |

The cases of the file that existed at the base pass on the unchanged tree and after the change: none of their names is in the 36 FAIL cases.

After the change: `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests`.

The brief's wording of the brief check for the cases is met as follows. The probes carry the proof that the examples hold the three keys; the two guards show that, with the keys in the example and known to the check, no not-set note is printed. Their control cases `three-keys-removed` and `projects-three-control` prove that the check learns each key from the example.

## DONE / NOT DONE

| Item | Status | Proof |
|---|---|---|
| 1. `plan.yaml`: three lines after `reviewer_effort`, line 3 | DONE | `git diff skills/plan/templates/plan.yaml`; text below |
| 2. `plan.projects.yaml`: three keys in each project | DONE | `git diff skills/plan/templates/plan.projects.yaml` |
| 3. `check_config.py`: value checks, notes, docstring | DONE | `check_config.test.sh` passes; `git diff skills/ordo-init/templates/check_config.py` |
| 4. `check_config.test.sh`: cases and head comment | DONE | first run above; the suite passes after |
| 5. `orchestrator-state.md`: three lines in the block | DONE | text below |
| 6. `skills/plan/SKILL.md:99`: keys and the `repair_reviewer` sentence | DONE | text below |
| 7. `skills/ordo-init/SKILL.md` `:98`, `:132`, `:133` | DONE | text below |
| 8. `plan-terms.md:23` and `docs/glossary.md:28`, identical | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` |
| 9. `.agents/plan.yaml`: `repair_reviewer: claude:sonnet` | DONE | `grep -n '^repair_reviewer: claude:sonnet' .agents/plan.yaml` prints `11:repair_reviewer: claude:sonnet            # claude:<model...` |
| 10. `README.md:141` | DONE | text below |
| 11. no `version` changes | DONE | `git diff | grep -n '^[+-].*version:'` prints nothing (exit 1) |
| Verify 1: the checks runner | DONE | output below |
| Verify 2: `python3 skills/ordo-init/templates/check_config.py .` | DONE | prints no `error:` line (`grep -c '^error:'` prints `0`); last line `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| Verify 3: `sh skills/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1` | DONE | `PASS: check_config.py scratch tests` |
| Verify 4 | DONE | one line, as in item 9 |
| Verify 5: text items and glossary sync | DONE | text below; `ok: the plan-terms block equals the template` |
| Verify 6 | DONE | as item 11 |
| Verify 7: first run and after | DONE | the table above |

The runner, `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0:

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

Not covered by these results: nothing here judges whether the new prose is good; that is for the review. The suite totals print only a `PASS:` line, so no count moved; the test file gained 36 cases that fail on the unchanged tree, 2 guards and 4 preserved cases that pass there.

## Files changed, with line counts (`wc -l` after the change)

- `skills/plan/templates/plan.yaml`: 30
- `skills/plan/templates/plan.projects.yaml`: 59
- `skills/plan/templates/orchestrator-state.md`: 70
- `skills/plan/SKILL.md`: 139
- `skills/ordo-init/templates/check_config.py`: 239
- `skills/ordo-init/templates/check_config.test.sh`: 565 (354 before)
- `skills/ordo-init/SKILL.md`: 172
- `skills/repo-setup/templates/plan-terms.md`: 120
- `docs/glossary.md`: 137
- `.agents/plan.yaml`: 14
- `README.md`: 180
- `.scratch/2-e-a-self-rule/agents/reviews/1-report.md`: this report

`git diff --stat` shows 11 files, 278 insertions, 19 deletions.

## Judgment calls

- The default note for `self_rule` and `next_entry` takes its word from the template's default (`on` if the default is true, `off` if false), so the word stays whatever the template writes. The template writes `off`, and the note reads `default off applies`.
- The probes `holds-*` add the key at the end of the one-project file, and after `reviewer_effort` in the project of the projects form; the helper `add_project_key` is in the test file next to them.
- The test helpers `lacks_text`, `remove_key` and `remove_project_key` are added to the test file. The error text of `self_rule` or `next_entry` written as `"On"` or `"OFF"` in quotes is `the text 'On' in quotes` (the value as written).
- In `plan.yaml` the new comments name self-rule only as the switch. In `.agents/plan.yaml` the comment holds the reason the brief gives.
- `skills/plan/SKILL.md`: the `repair_reviewer` sentence is a sub-bullet of Steps 4 item 4 beside the `executor:` bullets, since the skill layout asks one rule per bullet.
- `skills/ordo-init/SKILL.md:133` gains a sub-bullet for the `next_entry` note, for the same reason.

## User-visible changes, before and after

- `skills/plan/templates/plan.yaml:3`. Before: `# An optional key that is missing takes the value written here.` After: `# An optional key that is missing takes the default its comment gives.`
- `skills/plan/templates/plan.yaml`, after `reviewer_effort` (lines 28-30), new:
  - `self_rule: off   # optional, default off. on: plan-orchestration runs the plan under self-rule; off: every open item waits for the user.`
  - `next_entry: off  # optional, default off. on, with self_rule on: after a plan closes, the orchestrator takes the next open roadmap entry; off: it stops at the closing.`
  - `repair_reviewer: claude:opus  # optional, default the reviewer value. claude:<model> the run of /refute over a repair round runs on, at reviewer_effort.` (in the file's column layout)
- `skills/plan/templates/plan.projects.yaml`: each project, after `reviewer_effort: high`, gains `self_rule: off`, `next_entry: off`, `repair_reviewer: claude:opus`.
- `skills/plan/templates/orchestrator-state.md`, after `reviewer_effort` (lines 28-30), new:
  - `self_rule: off               # on: the plan runs under self-rule; off: every open item waits for the user.`
  - `next_entry: off              # on, with self_rule on: after the closing, the orchestrator takes the next open roadmap entry; off: it stops at the closing.`
  - `repair_reviewer: claude:<model>  # the model the run of /refute over a repair round runs on, at reviewer_effort; the reviewer value when plan.yaml leaves it out.`
- `skills/plan/SKILL.md:99`. Before: the list ended "`worker_effort`, `reviewer_effort`." After: "`worker_effort`, `reviewer_effort`, `self_rule`, `next_entry`, `repair_reviewer`." and a new bullet at line 100: "A `repair_reviewer` that `plan.yaml` leaves out is written with the `reviewer` value."
- `skills/ordo-init/SKILL.md:98`. Before: "`design_bar`, `design_references`, `worker_effort` and `reviewer_effort` are left out unless the user gives a value." After: "`design_bar`, `design_references`, `worker_effort`, `reviewer_effort`, `self_rule`, `next_entry` and `repair_reviewer` are left out unless the user gives a value."
- `skills/ordo-init/SKILL.md:132`. Before: "(`worker` or `reviewer` not `claude:<model>`, `review` neither ..." After: "(`worker` or `reviewer` not `claude:<model>` or written with no value, `repair_reviewer` not `claude:<model>`, `self_rule` or `next_entry` neither `on` nor `off`, `review` neither ..."
- `skills/ordo-init/SKILL.md:133`. Before: "3. Optional keys left out are listed as notes with the default that applies, as is the default ADR folder `docs/adr` when `adr` names it and the folder does not exist yet." After: "... with the default that applies, which for `repair_reviewer` is the `reviewer` value, as is the default ADR folder ..." and a new bullet: "`next_entry` on while `self_rule` is off or left out is noted as acting only under self-rule, and not noted when `self_rule` has an error."
- `skills/repo-setup/templates/plan-terms.md:23` and `docs/glossary.md:28`, the two lines identical. Before: "... `worker_effort` and `reviewer_effort`. Stated in: `plan`, Steps 4." After: "... `worker_effort`, `reviewer_effort`, `self_rule`, `next_entry` and `repair_reviewer`. Stated in: `plan`, Steps 4."
- `.agents/plan.yaml:11`, new, after `reviewer:`: `repair_reviewer: claude:sonnet` with the comment "# claude:<model> the run of /refute over a repair round runs on: Sonnet, since that run checks a narrow delta against named findings at half Opus's price per token."
- `README.md:141`. Before: "A key left out takes the default written beside it in the example `plan.yaml`." After: "A key left out takes the default the comment beside it in the example `plan.yaml` gives."
- `check_config.py`, as seen by a user of `/ordo-init`: a wrong `self_rule` or `next_entry` gives `<key> is neither on nor off: <value>` or `<key> is the text '<value>' in quotes; write on or off without quotes`; a wrong `repair_reviewer` gives `repair_reviewer is not claude:<model>: <value>`; `worker:` or `reviewer:` written with nothing now gives `<key> is not claude:<model>: None` (before, it passed); a left-out `repair_reviewer` notes `the reviewer's value '<reviewer>' applies`; a left-out `self_rule` or `next_entry` notes `default off applies` (there is no `False`); `next_entry` on under `self_rule` off or left out notes `next_entry is on while self_rule is off; it acts only under self-rule`.
- `check_config.py` docstring, before and after: line 6 gains "the default of repair_reviewer is the configured reviewer"; the list of errors gains the `worker`/`reviewer` "written with no value", the `self_rule`/`next_entry` and `repair_reviewer` bullets; the sentence on the value check names the three keys; the notes sentence names the three notes.
- `check_config.test.sh` head comment: line 3 gains the three keys' refusals and `worker` or `reviewer` with no value, and "those eight keys"; line 4 gains the two guards, the nine probes, the notes and the written-twice cases.

## Carried to every place that names a change (rule 14)

`grep -rn "reviewer_effort" skills utils docs README.md .agents` lists the places that name the configuration block's effort keys. The lists of the block's keys are in `plan/SKILL.md:99`, `plan-terms.md:23` and `docs/glossary.md:28`, all carried. The other hits (`grill`, `refute`, `spec`, `plan-orchestration`, ADR 0003) name `reviewer_effort` for the agent they launch, not a list of the block's keys, and are not changed. `grep -rn "written beside\|takes the value written\|default written" skills utils docs README.md` has no hit for the old wording after the change (the two hits are `session-retro` and `docs/roadmap.md`, both about other things).

## Anything in the brief that was wrong or impossible

- The two "as shipped" cases cannot fail on the unchanged tree. The orchestrator ruled on it in round 0, and the ruling is carried out (see "The cases' first run").
- Nothing else found.

## Repair round 1

Everything in the round's three rulings is done. Where the numbers below differ from the sections above, these are the ones after the round: `check_config.test.sh` has 570 lines and `check_config.py` 240; 37 cases of the test file fail on the unchanged tree (36 before, plus `self-rule-mixed`); `git diff --stat` shows 11 files, 284 insertions, 19 deletions.

### Ruling 1: the quoted-text message is for the six spellings YAML reads as a boolean

- Evidence of the YAML reading: `yaml.safe_load('a: <value>')` gives `True` for `on`, `On`, `ON`, `yes`, `Yes`, `YES`, `true`, `True`, `TRUE`; `False` for `off`, `Off`, `OFF`, `no`, `No`, `NO`, `false`, `False`, `FALSE`; and the text `'oN'`, `'OFf'`, `'yEs'`, `'tRUE'`, `'fALSE'` for the mixed spellings.
- New case `self-rule-mixed`: `self_rule: oN` unquoted, expecting the one error line `error: self_rule is neither on nor off: 'oN'`.
- Run before this round's change to `check_config.py` (the code of the first build, which lowercased the value): `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | head -3` printed
  `FAIL: self-rule-mixed: missing the line [error: self_rule is neither on nor off: 'oN'] in: error: self_rule is the text 'oN' in quotes; write on or off without quotes`.
- Run on the unchanged tree (the base files read from HEAD, the final test file, the continuing copy `cont.sh`): `FAIL: self-rule-mixed: missing the line [error: self_rule is neither on nor off: 'oN'] in: error: unknown key: self_rule`; 37 cases fail there in all.
- After the change: `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` prints `PASS: check_config.py scratch tests`.
- The change in `check_config.py`: a constant `QUOTED_SWITCH_WORDS = ("on", "On", "ON", "off", "Off", "OFF")`, and `check_switch` gives the quotes message only for a text value in it (`value in QUOTED_SWITCH_WORDS` in place of `value.lower() in ("on", "off")`); every other non-boolean value gets `<key> is neither on nor off: <value!r>`. The docstring of `check_switch` names the six spellings. The module docstring, line 17, now reads: "self_rule or next_entry is not a boolean, which YAML reads from on, off, yes, no, true and false written in lower case, with a capital first letter or in all upper case (oN and tRUE stay text): the text on, On, ON, off, Off or OFF in quotes has its own message, and any other value, nothing included, is neither on nor off;". Before: "... in any capitalisation: the text on or off in quotes has its own message, ...".
- The head comment of `check_config.test.sh` (line 3) now says "a spelling YAML reads as text such as oN, or on, On, ON, off, Off or OFF in quotes, which has its own message".
- Not covered: `yes`, `no`, `true` and `false` written in quotes (for example `self_rule: "yes"`) get `neither on nor off: 'yes'`, since the ruling names six spellings for the quotes message; no case holds them.

### Ruling 2: comments of the test file say what a case checks and when it is red, with no reference to a change

- Changed comments, before and after:
  - Line 4 (head comment): "Two guards, passing before and after the change, show that ..." became "Two guards show that ..."; "... are refused as before." became "... are refused."
  - Guard of the one-project example: "# Guard, passing before and after the change: the one-project example as shipped passes with none of the three keys' not-set notes. After the change it is red when the example drops one of the keys (its not-set note is printed); ..." became "# Guard: the one-project example as shipped passes with none of the three keys' not-set notes; red when the example drops one of the keys (its not-set note is printed). The removed-keys case below is its control, and the probe below proves the example holds each key."
  - Guard of the projects example: "# Guard, passing before and after the change: ... After the change it is red when a project drops a key; ..." became "# Guard: the several-projects example as shipped passes with none of the three notes for tool-a or tool-b; red when a project drops a key. The control removes repair_reviewer from tool-b and the note names the reviewer's value, and the probe below proves each project holds each key."
  - Twice-written keys: "... is refused with its name, before any value is read. Preserved: the duplicate scan runs on the file as written." became "... before any value is read. Red when the duplicate scan stops running on the file as written."
  - Beside projects: "... is a key beside projects. Preserved: the keys of a project are not accepted beside projects:." became "... is a key beside projects. Red when the keys of a project are accepted beside projects:."
- Evidence: `grep -n "as before\|Preserved\|before and after\|before the change\|after the change" skills/ordo-init/templates/check_config.test.sh | wc -l` prints `0`. The suite still ends `PASS: check_config.py scratch tests`.

### Ruling 3: sentences about a changed file as a whole, each with the line that shows it still holds (rule 14)

Each was reread against the file after the change.

| Sentence | Line that shows it still holds |
|---|---|
| `README.md:139`: "The example `plan.yaml` describes every key." | `skills/plan/templates/plan.yaml:28-30` holds `self_rule`, `next_entry` and `repair_reviewer`, so the example describes every key the check knows; `README.md:141` says a key left out takes the default its comment gives, and the three comments give theirs |
| `skills/plan/SKILL.md:33-34`: "Its keys, which of them are required and the default of each optional one are in `templates/plan.yaml` ... and `templates/plan.projects.yaml` ..." and "An optional key missing takes the default the example file gives it." | `plan.yaml:28-30` and `plan.projects.yaml:30-32` and `57-59` hold the three keys with their defaults; for `repair_reviewer` the default the example gives is "the reviewer value", which `skills/plan/SKILL.md:100` says is written into the block |
| `check_config.py:6`: "The keys, which of them are required and each optional key's default come from the plan skill's templates/plan.yaml ...; the default of repair_reviewer is the configured reviewer." | `example_keys` reads the keys and defaults from `plan.yaml`; `default_note` gives the reviewer's value for `repair_reviewer` |
| `check_config.test.sh:2`: "each case one configuration it must refuse or pass." | every new case is written through `expect_pass`, `expect_error` or `expect_refusal`, one configuration each |
| `check_config.test.sh:3`: "each refusal of those eight keys, and of a key written twice, is the one error line." | the eight keys are `adr`, `design_bar`, `design_references`, `worker_effort`, `reviewer_effort`, `self_rule`, `next_entry` and `repair_reviewer`; each of their cases uses `expect_refusal`, which counts one error line |
| `check_config.py:21` (the sentence on value-checked keys): "the value check above replaces the kind check, so a wrong value gives one error" | `VALUE_CHECKED` at line 37 holds the eight keys, so the kind check skips each |
| `skills/plan/templates/plan.projects.yaml:2`: "Each project takes the keys of plan.yaml, with the same required keys and the same defaults." | each project holds the three keys with the values of `plan.yaml`, lines 30-32 and 57-59 |
| `skills/ordo-init/SKILL.md:29`: "the keys, which are required, each optional key's default, and the comment that says what the key is" | the three keys carry their comment in `plan.yaml:28-30` |
| `skills/ordo-init/SKILL.md:98` and `:132-133`, the list of keys left out and of errors and notes | `check_config.py` reports each error and note those lines name (the test cases above) |
| `README.md:141`: "Every other key is optional." | the three keys are optional (`# optional, default ...` in `plan.yaml:28-30`) |

I found no other sentence about a changed file as a whole: `grep -rn "check_config" docs README.md skills` shows the pages that name the script (`docs/dev/building.md:8`, `README.md:129`, `skills/repo-setup/SKILL.md:34,107`), and none of them states a key list or a count.

### Verify before you report, run again

1. `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` exited 0; it printed `$ <command>` and the output of each of the ten commands, each test ending `PASS: <name> scratch tests`, the glossary check `ok: the plan-terms block equals the template`, the ASCII check with no output, and then `checks: 10 commands passed`.

   Landing note: the lines `checks.sh` printed for the repaired tree, from the landing's run on main after the cherry-pick of `67428df..2ea-1`:

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

2. `python3 skills/ordo-init/templates/check_config.py . | grep -c '^error:'` printed `0`; its last line is `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`.
3. `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1` printed `PASS: check_config.py scratch tests`.
4. `grep -n '^repair_reviewer: claude:sonnet' .agents/plan.yaml` printed one line, `11:repair_reviewer: claude:sonnet ...`.
5. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
6. `git diff | grep -c '^[+-].*version:'` printed `0`.
7. The table of "The cases' first run" holds, with `self-rule-mixed` added as above; the cases that pass on the unchanged tree are the two guards, the four cases this step adds for the preserved behaviour (`twice-self_rule`, `twice-next_entry`, `twice-repair_reviewer`, `projects-beside`), and the cases of the file at the base.

Files changed this round: `skills/ordo-init/templates/check_config.py`, `skills/ordo-init/templates/check_config.test.sh` and this report.
