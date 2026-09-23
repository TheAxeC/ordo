# Step 2 report: the launch_note key in every place that lists the optional keys

Everything in the brief is done.

Open items of the state file: none.

| # | Item | Result | Proof |
|---|---|---|---|
| 1 | `launch_note: ""` in `skills/plan/templates/plan.yaml` (23 lines) after `bench`; in both projects of `plan.projects.yaml` (45 lines); `launch_note:` in the state template `orchestrator-state.md` (67 lines) | DONE | `land.test.sh` passes, and fails with the key taken out of the state template (plants below) |
| 2 | `skills/plan/SKILL.md` (82 lines): `launch_note` in the configuration block's key list | DONE | `git diff` |
| 3 | `skills/ordo-init/SKILL.md` (109 lines): the key left out unless the user names a recording command; the check's list of errors names the launch_note errors | DONE | `git diff` |
| 4 | `README.md` (153 lines): the optional keys' paragraph names `launch_note` and points at the interface page | DONE | `git diff` |
| 5 | `skills/ordo-init/templates/check_config.py` (116 lines): a non-empty `launch_note` must be an absolute path to an executable file, with a separate error for a directory; the docstring names the new errors; `check_config.test.sh` (131 lines) has cases for a valid key, a relative path, `~`, whitespace, a missing file, a directory, a non-executable file and a relative path in the projects form | DONE | the test passes; each check removed or weakened turns its case red (plants below) |
| 6 | The interface page moved from `docs/launch-note.md` to `skills/plan-orchestration/templates/launch-note.md` (26 lines), so it is installed with the skills; the pointers in `plan.yaml`, the state template, `README.md` and `launch.sh` (184 lines) name it there | DONE | `git grep -n 'launch-note.md' -- ':!.scratch'` prints the four pointers, all to the new place |
| 7 | Both tests pass with the key; the launch test still passes; the verify list | DONE | output below |

User-visible changes, before and after:

- `check_config.py` on a configuration without the key: before, no line about it; after, `note: launch_note not set, default '' applies` (run on this repository: the base script, from `git archive b6e4ba5 skills`, prints ten `note:` lines, for `standards` through `bench`, and `ok: ...`; the new one prints the same ten, then `note: launch_note not set, default '' applies`, then `ok: ...`).
- `check_config.py` on a configuration with `launch_note` set: before, the key was an unknown key, an error; after, an absolute path to an executable file passes (a symlink to one too), and a relative path (`~` and whitespace included), a missing file, a directory or a non-executable file is an error; a list or a number was and stays a type error; an empty value passes.
- `/ordo-init` leaves the key out of a drafted configuration unless the user names a recording command.

Judgment calls:

- The state template's comment follows its neighbours' style, with no optional-default marker.
- The interface page moved into the plan-orchestration skill's `templates/`, since `docs/` is not installed with the skills and the templates' comments point at it.
- A directory gets its own error, since "a file that does not exist" would be false for it.

The planted failures, each reverted after its run:

```
== relative path check removed (skills/ordo-init/templates/check_config.test.sh): exit 1
FAIL: note-relative: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== missing file check removed (skills/ordo-init/templates/check_config.test.sh): exit 1
FAIL: note-missing: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== executable check removed (skills/ordo-init/templates/check_config.test.sh): exit 1
FAIL: note-not-executable: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== key missing from plan.yaml (skills/ordo-init/templates/check_config.test.sh): exit 1
FAIL: note-ok: the key was not set
== key missing from the state template (skills/land/templates/land.test.sh): exit 1
FAIL: example plan.yaml files differ from the state template
== relative path check removed: exit 1
FAIL: note-relative: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== prefix dropped from the relative-path error: exit 1
FAIL: projects: missing [error: tool-a: launch_note is not an absolute path: 'rel/recorder'] in: error: launch_note is not an absolute path: 'rel/recorder'
== directory check removed: exit 1
FAIL: note-directory: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== missing file check removed: exit 1
FAIL: note-missing: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== executable check removed: exit 1
FAIL: note-not-executable: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== value stripped before the check: exit 1
FAIL: note-blank: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== home-relative path skipped: exit 1
FAIL: note-home: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
== projects not checked: exit 1
FAIL: projects: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
```

The verify list's output (exit 0), then the launch test:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
PASS: launch.sh scratch tests
```

## Repair round 1

Each finding of `2-refuter.md`, and the change that closes it:

- Spec 1 and 2: the ordo-init skill's list and the checker's docstring name the launch_note errors.
- Spec 3: the interface page names the checker's errors beside `launch.sh`'s refusal.
- Spec 4: the page moved into the skill, and the templates point at it there (row 6).
- Proof 1: the test covers the projects form, a directory, whitespace and `~`, each with its plant.
- Proof 2: the plants of both runs are above.
- Proof 3: the rule-14 grep is in row 6.
- Standards 1: the files with line counts, the user-visible changes and the judgment calls are above.
- Standards 2: a directory has its own error.
- Behaviour 1 and 2: stated above.
