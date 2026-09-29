# Report: step 2 of plan 2.E, the plan.yaml settings

Everything in the brief is done.

## Open items of the state file, verbatim

None.

## The cases' first run

Command: a copy of the new `check_config.test.sh` in the session scratch folder, identical except that `fail` prints and returns instead of exiting (`sed -e "s|^    exit 1\$|    return 0|" -e 's/done || exit 1/done || true/'` and `script_dir` set to the worktree's `skills/ordo-init/templates`), run against the unchanged `check_config.py`, `plan.yaml` and `plan.projects.yaml`. Every red line it printed, verbatim (each `in:` part is cut after its first line):

```text
FAIL: five-keys: missing the line [note: adr folder docs/adr does not exist yet; repo-setup or grill creates it] in: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
FAIL: projects-five-control: missing the line [note: tool-b: worker_effort not set, default 'high' applies] in: ok: ...
FAIL: five-keys-removed: missing the line [note: adr not set, default 'docs/adr' applies] in: ok: ...
FAIL: five-keys-removed: missing the line [note: design_bar not set, default 'industry' applies] in: ok: ...
FAIL: five-keys-removed: missing the line [note: design_references not set, default [] applies] in: ok: ...
FAIL: five-keys-removed: missing the line [note: worker_effort not set, default 'high' applies] in: ok: ...
FAIL: five-keys-removed: missing the line [note: reviewer_effort not set, default 'high' applies] in: ok: ...
FAIL: adr-decisions: expected a pass, got: error: unknown key: adr
FAIL: adr-slash: expected a pass, got: error: unknown key: adr
FAIL: adr-absent: missing the line [error: adr names a folder that does not exist: docs/decisions] in: error: unknown key: adr
FAIL: adr-file: missing the line [error: adr names a folder that does not exist: docs/roadmap.md] in: error: unknown key: adr
FAIL: adr-empty: missing the line [error: adr is not a folder path: None] in: error: unknown key: adr
FAIL: adr-quoted: missing the line [error: adr is not a folder path: ''] in: error: unknown key: adr
FAIL: adr-number: missing the line [error: adr is not a folder path: 5] in: error: unknown key: adr
FAIL: adr-absolute: missing the line [error: adr is not a path under the repository root: '/tmp'] in: error: unknown key: adr
FAIL: adr-parent: missing the line [error: adr is not a path under the repository root: '../elsewhere'] in: error: unknown key: adr
FAIL: design-bar-novel: expected a pass, got: error: unknown key: design_bar
FAIL: design-bar-state-of-the-art: expected a pass, got: error: unknown key: design_bar
FAIL: design-bar-best: missing the line [error: design_bar is not industry, state-of-the-art or novel: 'best'] in: error: unknown key: design_bar
FAIL: design-bar-capital: missing the line [error: design_bar is not industry, state-of-the-art or novel: 'Industry'] in: error: unknown key: design_bar
FAIL: design-bar-empty: missing the line [error: design_bar is not industry, state-of-the-art or novel: None] in: error: unknown key: design_bar
FAIL: references-list: expected a pass, got: error: unknown key: design_references
FAIL: references-string: missing the line [error: design_references is not a list of text: 'WCAG'] in: error: unknown key: design_references
FAIL: references-number: missing the line [error: design_references is not a list of text: [1]] in: error: unknown key: design_references
FAIL: references-empty: missing the line [error: design_references is not a list of text: None] in: error: unknown key: design_references
FAIL: worker-effort-max: expected a pass, got: error: unknown key: worker_effort
FAIL: reviewer-effort-xhigh: expected a pass, got: error: unknown key: reviewer_effort
FAIL: worker-effort-huge: missing the line [error: worker_effort is not low, medium, high, xhigh or max: 'huge'] in: error: unknown key: worker_effort
FAIL: worker-effort-yes: missing the line [error: worker_effort is not low, medium, high, xhigh or max: True] in: error: unknown key: worker_effort
FAIL: worker-effort-3: missing the line [error: worker_effort is not low, medium, high, xhigh or max: 3] in: error: unknown key: worker_effort
FAIL: worker-effort-High: missing the line [error: worker_effort is not low, medium, high, xhigh or max: 'High'] in: error: unknown key: worker_effort
FAIL: reviewer-effort-huge: missing the line [error: reviewer_effort is not low, medium, high, xhigh or max: 'huge'] in: error: unknown key: reviewer_effort
FAIL: reviewer-effort-empty: missing the line [error: reviewer_effort is not low, medium, high, xhigh or max: None] in: error: unknown key: reviewer_effort
FAIL: twice-effort: missing the line [error: key written twice: worker_effort] in: error: unknown key: worker_effort
FAIL: twice-reviewer: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
FAIL: twice-reviewer: missing the line [error: key written twice: reviewer] in: ok: ...
FAIL: twice-reviewer: expected one error line, got 0 in: ok: ...
FAIL: projects-effort: missing the line [error: tool-a: worker_effort is not low, medium, high, xhigh or max: 'huge'] in: error: tool-a: unknown key: worker_effort
FAIL: projects-bar: missing the line [error: tool-b: design_bar is not industry, state-of-the-art or novel: 'best'] in: error: tool-b: unknown key: design_bar
FAIL: projects-adr: missing the line [error: tool-a: adr names a folder that does not exist: docs/decisions] in: error: tool-a: unknown key: adr
FAIL: projects-twice: missing the line [error: tool-b: key written twice: worker_effort] in: error: tool-b: unknown key: worker_effort
```

Per case of "Cases":

| Case | First run on the unchanged tree |
|---|---|
| One-project example passes with the `docs/adr` note; with `docs/adr` present, no note | Passes with no note (red: the note line is missing); `adr-present` passes with no note (holds, no key to check yet) |
| Several-projects example passes and holds the five keys in both projects | `projects-five` passes (no not-set note, since the keys are unknown to the checker); its control `projects-five-control` is red: no `tool-b: worker_effort not set` note |
| Five keys removed: the five not-set notes | Passes with no note for them (red on each of the five notes) |
| `adr: docs/decisions` present passes; absent refused | Both `error: unknown key: adr` |
| `adr: docs/adr/` with `docs/adr` present passes | `error: unknown key: adr` |
| `adr: docs/roadmap.md` refused | `error: unknown key: adr` |
| `adr:` empty, `""`, `5` refused | Each `error: unknown key: adr` |
| `adr: /tmp`, `adr: ../elsewhere` refused | Each `error: unknown key: adr` |
| `design_bar` novel and state-of-the-art pass; best, Industry, empty refused | Each `error: unknown key: design_bar` |
| `design_references` list passes; string, `[1]`, empty refused | Each `error: unknown key: design_references` |
| `worker_effort: max` passes; huge, yes, 3, High refused | Each `error: unknown key: worker_effort` |
| `reviewer_effort: xhigh` passes; huge, empty refused | Each `error: unknown key: reviewer_effort` |
| Each refused value gives one `error:` line | Each gives one line, `unknown key` |
| `worker_effort` written twice | `error: unknown key: worker_effort` |
| Projects form: tool-a effort, tool-b design_bar, tool-a adr | `error: tool-a: unknown key: worker_effort`, `error: tool-b: unknown key: design_bar`, `error: tool-a: unknown key: adr` |

No case is one the brief's rules get wrong, so there was no hand-back and no ruling. The brief's last case line predicts that "the duplicated key passes silently" on the unchanged tree. The duplicated `worker_effort` case instead gives `error: unknown key: worker_effort`, because `worker_effort` is itself unknown there. The duplicated `reviewer` case (added, see judgment call 2) is the one that passes silently. See "Wrong in the brief".

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. `plan.yaml`: five keys after `bench`, in the layout and comment form | DONE | `example_keys()` parses them: `'adr': 'docs/adr', 'design_bar': 'industry', 'design_references': [], 'worker_effort': 'high', 'reviewer_effort': 'high'` (`python3 -c "import sys; sys.path.insert(0,'skills/ordo-init/templates'); import check_config as c; print(c.example_keys())"`) |
| 2. `plan.projects.yaml`: five keys with defaults after `bench` in both projects | DONE | Key count column 2 below is 2 for each key; case `projects-five` |
| 3. `check_config.py`: duplicate refusal, the five value checks replacing the kind check, `adr` under the root, the `docs/adr` note, docstring | DONE | The test's cases below, each passing; docstring lines 2-21 |
| 4. `check_config.test.sh`: one case per case, exact line, one `error:` line per refusal, header comment | DONE | `PASS: check_config.py scratch tests`; header lines 3-4 |
| 5. `orchestrator-state.md`: five keys after `bench` with comments | DONE | Key count column 3 |
| 6. `/plan` Steps 4 key list | DONE | `skills/plan/SKILL.md:61` ends "`bench`, `adr`, `design_bar`, `design_references`, `worker_effort`, `reviewer_effort`." |
| 7. Glossary term through `plan-terms.md` and the sync | DONE | `sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`; the check prints `ok: the plan-terms block equals the template` |
| 8. `/ordo-init` Steps 7 and "Checking an existing file" 2 and 3 | DONE | `skills/ordo-init/SKILL.md:70-71`, `:92`, `:93` (`grep -n adr skills/ordo-init/SKILL.md` prints lines 70, 92 and 93) |

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0:

```text
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

Verify 2, `sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`. The test file held 15 lines calling `expect_pass` or `expect_error` and 15 lines calling `make_repo` or `make_projects_repo`; it now holds 55 assertion lines (`expect_pass`, `expect_error`, `expect_refusal`, `has_line`, `lacks_line`) and 48 repository lines, counted with `grep -cE` over the file at HEAD and in the worktree. Loops run some of those lines more than once. No existing case was changed.

Verify 3, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.

Verify 4, `python3 skills/ordo-init/templates/check_config.py .`: exit 0, last line `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, with the notes `adr not set, default 'docs/adr' applies`, `design_bar not set, default 'industry' applies`, `design_references not set, default [] applies`, `worker_effort not set, default 'high' applies`, `reviewer_effort not set, default 'high' applies` among the optional-key notes.

Verify 5, the per-file key count (files in the order plan.yaml, plan.projects.yaml, orchestrator-state.md, plan/SKILL.md, plan-terms.md, glossary.md, ordo-init/SKILL.md):

```text
adr 1 2 1 1 1 1 3
design_bar 1 2 1 1 1 1 2
design_references 1 2 1 1 1 1 2
worker_effort 1 2 1 1 1 1 2
reviewer_effort 1 2 1 1 1 1 2
```

No 0, and 2 for `plan.projects.yaml`.

Other checks: `LC_ALL=C git diff -U0 | grep -n '^+.*[^ -~]'` printed nothing (exit 1). `git status --short` shows only the nine files below.

## Rule 13 table

Each revert was applied to a scratch copy of `skills/ordo-init` and `skills/plan` in the session scratch folder (script `reverts.py` there), never to the worktree. The copied test run as written exited 1 for every revert. The red line quoted is the targeted case's first `FAIL:` line from the same copy run without stopping (the `in:` part cut after its first line).

| Behaviour | Case | Revert | Red line |
|---|---|---|---|
| The one-project example writes every key | `five-keys-removed` | `reviewer_effort` line removed from `plan.yaml` | `FAIL: five-keys-removed: missing the line [note: reviewer_effort not set, default 'high' applies] in: note: adr not set, default 'docs/adr' applies` |
| Note for the missing default `docs/adr` | `five-keys` | the `notes.append(... does not exist yet ...)` line removed | `FAIL: five-keys: missing the line [note: adr folder docs/adr does not exist yet; repo-setup or grill creates it] in: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| No note when `docs/adr` exists (control: `five-keys`) | `adr-present` | the note appended before the `isdir` test, whatever the folder | `FAIL: adr-present: unexpected line [note: adr folder docs/adr does not exist yet; repo-setup or grill creates it] in: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| The projects example writes every key in both projects (control: `projects-five-control`) | `projects-five` | `worker_effort: high` removed from tool-b in `plan.projects.yaml` | `FAIL: projects-five: unexpected line [note: tool-b: worker_effort not set, default 'high' applies] in: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| An existing non-default folder passes | `adr-decisions` | `isdir(full) and path == normpath(default)` | `FAIL: adr-decisions: expected a pass, got: error: adr names a folder that does not exist: docs/decisions` |
| Trailing slash accepted | `adr-slash` | root test `os.path.isabs(path) or path != value` | `FAIL: adr-slash: expected a pass, got: error: adr is not a path under the repository root: 'docs/adr/'` |
| A missing folder is refused | `adr-absent` | the `adr names a folder that does not exist` append removed | `FAIL: adr-absent: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| A file is refused | `adr-file` | `os.path.exists(full)` in place of `os.path.isdir(full)` | `FAIL: adr-file: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| Empty `adr` refused | `adr-empty` | `if value is None: return` before the text test | `FAIL: adr-empty: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| `''` refused | `adr-quoted` | `or value == ""` dropped | `FAIL: adr-quoted: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| Value check replaces the kind check (one line) | `adr-number` | `or key in VALUE_CHECKED` dropped from the kind-check skip | `FAIL: adr-number: expected one error line, got 2 in: error: adr is a int, its default is a str: 5` |
| Absolute path refused | `adr-absolute` | root test replaced by `if False:` | `FAIL: adr-absolute: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| `..` refused | `adr-parent` | root test only `os.path.isabs(path)` | `FAIL: adr-parent: missing the line [error: adr is not a path under the repository root: '../elsewhere'] in: error: adr names a folder that does not exist: ../elsewhere` |
| `design_bar: novel` passes | `design-bar-novel` | `novel` removed from `DESIGN_BARS` | `FAIL: design-bar-novel: expected a pass, got: error: design_bar is not industry, state-of-the-art or novel: 'novel'` |
| `design_bar: state-of-the-art` passes | `design-bar-state-of-the-art` | `state-of-the-art` removed from `DESIGN_BARS` | `FAIL: design-bar-state-of-the-art: expected a pass, got: error: design_bar is not industry, state-of-the-art or novel: 'state-of-the-art'` |
| Other `design_bar` refused | `design-bar-best` | the design_bar append replaced by `pass` | `FAIL: design-bar-best: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Other capitals refused | `design-bar-capital` | `value.lower() in DESIGN_BARS` | `FAIL: design-bar-capital: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Empty `design_bar` refused | `design-bar-empty` | test guarded by `value is not None` | `FAIL: design-bar-empty: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| A list of text passes | `references-list` | items tested as `int` | `FAIL: references-list: expected a pass, got: error: design_references is not a list of text: ['WCAG 2.2 AA']` |
| A string refused | `references-string` | `isinstance(value, (list, str))` | `FAIL: references-string: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| A non-string item refused | `references-number` | the `all(...)` item test dropped | `FAIL: references-number: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Empty `design_references` refused | `references-empty` | test guarded by `value is not None` | `FAIL: references-empty: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| `worker_effort: max` passes | `worker-effort-max` | `max` removed from `EFFORTS` | `FAIL: worker-effort-max: expected a pass, got: error: worker_effort is not low, medium, high, xhigh or max: 'max'` |
| `reviewer_effort: xhigh` passes | `reviewer-effort-xhigh` | `xhigh` removed from `EFFORTS` | `FAIL: reviewer-effort-xhigh: expected a pass, got: error: reviewer_effort is not low, medium, high, xhigh or max: 'xhigh'` |
| Other efforts refused: word, boolean, number | `worker-effort-huge`, `-yes`, `-3` | the effort append replaced by `pass` | `FAIL: worker-effort-huge: expected an error, got a pass: ...`; `FAIL: worker-effort-yes: expected an error, got a pass: ...`; `FAIL: worker-effort-3: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Other capitals refused | `worker-effort-High` | `value.lower() in EFFORTS` | `FAIL: worker-effort-High: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Empty effort refused | `reviewer-effort-empty` | test guarded by `value is not None` | `FAIL: reviewer-effort-empty: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| A key written twice refused, any key | `twice-effort`, `twice-reviewer` | `yaml.safe_load` in place of `UniqueKeyLoader` | `FAIL: twice-effort: expected an error, got a pass: ...`; `FAIL: twice-reviewer: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| Duplicate named with its project | `projects-twice` | `KeyWrittenTwice(None, key)` | `FAIL: projects-twice: missing the line [error: tool-b: key written twice: worker_effort] in: error: key written twice: worker_effort` |
| Value checks run in each project | `projects-effort`, `projects-bar`, `projects-adr` | `if label: return` before the five checks | `FAIL: projects-effort: expected an error, got a pass: ok: ...`; `FAIL: projects-bar: expected an error, got a pass: ok: ...`; `FAIL: projects-adr: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |

The case `reviewer-effort-huge` is turned red by the same revert as `worker-effort-huge` (both keys share one loop); its first run above shows it red on the unchanged tree.

## Files and line counts

`git diff --name-only | xargs wc -l`:

| File | Lines |
|---|---|
| `docs/glossary.md` | 108 |
| `skills/ordo-init/SKILL.md` | 124 |
| `skills/ordo-init/templates/check_config.py` | 192 |
| `skills/ordo-init/templates/check_config.test.sh` | 348 |
| `skills/plan/SKILL.md` | 96 |
| `skills/plan/templates/orchestrator-state.md` | 67 |
| `skills/plan/templates/plan.projects.yaml` | 53 |
| `skills/plan/templates/plan.yaml` | 27 |
| `skills/repo-setup/templates/plan-terms.md` | 92 |
| `.scratch/2-e-grill/agents/reviews/2-report.md` | this report |

`skills/plan/SKILL.md` changed only line 61, `plan-terms.md` only line 18, `glossary.md` only line 23 (by the sync), and `skills/ordo-init/SKILL.md` only at Steps 7 (two bullets added after line 69) and lines 90-91 of the base.

## Judgment calls

1. A key written twice ends the check: the loader raises, `check_config.py` prints the one line `error: [<project>: ]key written twice: <key>` and exits 1 without the other checks, since the file has no single value to check. The docstring says so.
2. Two cases beyond "Cases", both for behaviour item 3 states: `twice-reviewer` (a key outside the five written twice, for "refused for every key") and `projects-twice` (the project's prefix on a duplicate). Also `projects-five-control`, the control rule 13 asks for beside the silent `projects-five` case.
3. The default-folder note applies when the normalised value equals the normalised default, so `adr: docs/adr/` with no `docs/adr` gives the note, not the error. The default is read from the example (`keys["adr"]`), not written in the code.
4. A mapping key that is not a scalar is not compared for duplicates; the base loader refuses such a key as unhashable, as it did before.
5. A duplicate project name under `projects:` is reported without a prefix (`key written twice: tool-a`), since it is not inside a project.
6. `/ordo-init` "Checking an existing file" item 2 lists the new value refusals inside the existing "a value of the wrong kind" parenthesis, and "a key written twice" first.

## Visible changes, before and after

- `check_config.py` on a file with `worker_effort: high` (as game-engine and cathedra have): before `error: unknown key: worker_effort`, exit 1; after, no error for it.
- `check_config.py` on a file with a key written twice: before, the last value silently; after `error: key written twice: <key>` (`error: <project>: key written twice: <key>` inside a project), exit 1.
- `check_config.py` on the copied one-project example in a repository without `docs/adr`: before, a pass with no such line; after, a pass with `note: adr folder docs/adr does not exist yet; repo-setup or grill creates it`. The README's copy instruction stays true (a note, exit 0).
- `check_config.py` on a file without the five keys: after, five more notes, `adr not set, default 'docs/adr' applies` and the four others quoted in Verify 4.
- New error lines: `adr is not a folder path: <repr>`, `adr is not a path under the repository root: <repr>`, `adr names a folder that does not exist: <value>`, `design_bar is not industry, state-of-the-art or novel: <repr>`, `design_references is not a list of text: <repr>`, `<key> is not low, medium, high, xhigh or max: <repr>`. For these five keys the line `<key> is a <kind>, its default is a <kind>: <repr>` is no longer printed.
- `/ordo-init` Steps 7, before: ended at "`bench` and `look` are left out unless the user names binaries or a view." After, two bullets follow: "`adr` is written only when the repository keeps its decision records (a folder of `NNNN-*.md` records) in a folder other than `docs/adr`, and it names that folder." and "`design_bar`, `design_references`, `worker_effort` and `reviewer_effort` are left out unless the user gives a value."
- `/ordo-init` "Checking an existing file" 2, before: "It reports: a required key missing; an unknown key; a value of the wrong kind (`worker` or `reviewer` not `claude:<model>`, `review` neither `every` nor `earned`, `libraries` neither `check` nor `avoid`, a value whose kind differs from its default's); ...". After: "It reports: a key written twice; a required key missing; an unknown key; a value of the wrong kind (`worker` or `reviewer` not `claude:<model>`, `review` neither `every` nor `earned`, `libraries` neither `check` nor `avoid`, `adr` not naming a folder under the repository root, `design_bar` outside `industry`, `state-of-the-art` and `novel`, `design_references` not a list of text, `worker_effort` or `reviewer_effort` outside `low`, `medium`, `high`, `xhigh` and `max`, a value whose kind differs from its default's); ...".
- `/ordo-init` "Checking an existing file" 3, before: "Optional keys left out are listed as notes, with the default that applies." After: "Optional keys left out are listed as notes with the default that applies, as is the default ADR folder `docs/adr` when `adr` names it and the folder does not exist yet."
- `/plan` Steps 4, the glossary term "configuration block", the state template and both example files: the five keys after `bench`.

Rule 14: `git grep -n -i 'check_config\|wrong kind\|kind differs' -- skills utils docs README.md` finds no other description of what `check_config.py` reports beyond `skills/ordo-init/SKILL.md:92`. `git grep -n bench -- skills utils docs README.md` finds every key list in the files this step writes, all now carrying the five keys. `README.md:110-112` ("Nine are required ... Every other key is optional. A key left out takes the default written beside it in the example `plan.yaml`.") still holds: the five keys are optional with their defaults in the example.

## Wrong in the brief

- "Cases", last line: "the duplicated key passes silently" on the unchanged tree. The duplicated `worker_effort` case gives `error: unknown key: worker_effort` there (first run above), since `worker_effort` is not yet a known key. The rest of the brief lands unchanged; the duplicate refusal is proven by `twice-reviewer`, which passes silently on the unchanged tree (`FAIL: twice-reviewer: expected an error, got a pass`), and by revert R28 for both duplicate cases.

## Repair round 1

The three findings of `agents/reviews/2-refuter.md` are closed as their rulings in `agents/briefs/2-round-1.md` say. The line counts in "Files and line counts" above are updated: `check_config.py` 192, `check_config.test.sh` 348 (`git diff --name-only | xargs wc -l`).

### Changes

1. Merge key. `check_config.py:32` adds `MERGE_TAG = "tag:yaml.org,2002:merge"`. `check_config.py:60`, in `UniqueKeyLoader.construct_mapping`, reads `if not isinstance(key_node, yaml.ScalarNode) or key_node.tag == MERGE_TAG:` followed by `continue`, so a merge key node is skipped before it is constructed. The class docstring says the scan compares only the keys written in the mapping itself, so a key that overrides a merged value is not a duplicate.
2. Default `docs/adr` as a file. No code change; the case below proves the refusal that `check_adr` already made.
3. `keys beside projects`. The docstring's list of errors gains `- keys beside projects: [...], a key other than projects at the top of the projects: form;` (`check_config.py:10`), matching the line the script prints at `check_config.py:177`. `skills/ordo-init/SKILL.md` "Checking an existing file" 2 did not hold it. Before: "2. It reports: a key written twice; a required key missing; ...". After: "2. It reports: a key written twice; a key beside `projects:` in the `projects:` form; a required key missing; ..." (`skills/ordo-init/SKILL.md:92`).

The test's header comment names the new cases: a key written twice in a project that also holds a merge key, the default `docs/adr` as a file, and a project that takes another's keys through `<<: *base` and overrides one of them, which passes.

### New cases in `check_config.test.sh`

- `adr-default-file`: the example with `adr: docs/adr` and `docs/adr` created as an empty file. The expected output is the one error line `error: adr names a folder that does not exist: docs/adr`.
- `merge-key`: the several-projects example with `tool-a: &base`, and `tool-b:` holding `<<: *base`, its own `roadmap`, `verification` and `worker_effort: max`. It passes, and the test checks that its output holds no `error:` line.
- `merge-key-twice`: the same file with `worker_effort` written twice inside `tool-b`. The expected output is the one error line `error: tool-b: key written twice: worker_effort`.

### First run of the new cases, before the code change

The test ran on the code of the first report, through the scratch copy that does not stop at a failure (`first_run_r1.sh`). The red lines, verbatim:

```text
FAIL: merge-key: expected a pass, got: 
yaml.constructor.ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'
FAIL: merge-key-twice: missing the line [error: tool-b: key written twice: worker_effort] in: 
FAIL: merge-key-twice: expected one error line, got 0 in: 
```

`adr-default-file` passed on that code, since the refusal existed and only its proof was missing.

### Rule 13 reverts

Each revert was applied to a scratch copy of `skills/ordo-init` and `skills/plan` (script `reverts_r1.py` in the session scratch folder). The copied test exited 1 for each revert.

| Behaviour | Case | Revert | Red line |
|---|---|---|---|
| A merge key is skipped by the duplicate scan | `merge-key` | the `or key_node.tag == MERGE_TAG` condition removed | `FAIL: merge-key: expected a pass, got: ` followed by the traceback, whose last line is `yaml.constructor.ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'` (the traceback line is from the first run above, where the code had no skip) |
| A key written twice beside a merge key is still refused | `merge-key-twice` | `if key_node.tag == MERGE_TAG: break` before the scalar test, so the scan stops at the merge key | `FAIL: merge-key-twice: expected an error, got a pass: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |
| The default `docs/adr` as a file is refused | `adr-default-file` | `not os.path.exists(full) and` removed from the default-note condition | `FAIL: adr-default-file: expected an error, got a pass: note: adr folder docs/adr does not exist yet; repo-setup or grill creates it` |

### Outputs

`sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1`: `PASS: check_config.py scratch tests`.

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0:

```text
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

`python3 skills/ordo-init/templates/check_config.py .`: exit 0, last line `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`. `LC_ALL=C git diff -U0 | grep -c '^+.*[^ -~]'`: `0`. `git status --short` lists the same nine files and this report.
