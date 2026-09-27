# Step 17a report: a library check in /spec, set per project

Everything in the brief is done.

## Open items of the state file, verbatim

`sed -n '/## Open items/,/## Closed items/p' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` prints the heading and nothing under it:

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)


## Closed items
```

## The cases' first run, on the unchanged tree

The cases were written into `skills/ordo-init/templates/check_config.test.sh` before any other file changed (`git status --short` then showed only ` M skills/ordo-init/templates/check_config.test.sh`). `sh skills/ordo-init/templates/check_config.test.sh` stops at its first red, so every case's result was also read from a scratch copy of the same file whose `fail` prints and continues (`sed 's|^    exit 1$|    :|'`), run against the worktree's scripts.

| Case | Result on the unchanged tree |
|---|---|
| `python3 skills/ordo-init/templates/check_config.py .` | `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, exit 0 (the example had no `libraries`) |
| A fixture without `libraries` | red: `FAIL: libraries-missing: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| `libraries: maybe` | red: `FAIL: libraries-maybe: missing [error: libraries is neither check nor avoid: 'maybe'] in: error: unknown key: libraries` |
| `libraries: check` | red: `FAIL: libraries-check: expected a pass, got: error: unknown key: libraries` |
| `libraries: avoid` | red: `FAIL: libraries-avoid: expected a pass, got: error: unknown key: libraries` |
| `projects:` form, tool-b without `libraries` | red: `FAIL: projects-libraries: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |
| `sh skills/land/templates/land.test.sh 2>&1 \| tail -1` | `PASS: land.sh and usage.py scratch tests` |
| Edge: `libraries: Check` | red: `FAIL: libraries-capital: missing [error: libraries is neither check nor avoid: 'Check'] in: error: unknown key: libraries` |
| Edge: `libraries: ''` | red: `FAIL: libraries-empty-string: missing [error: libraries is neither check nor avoid: ''] in: error: unknown key: libraries` |
| Edge: `libraries: yes` | red: `FAIL: libraries-boolean: missing [error: libraries is neither check nor avoid: True] in: error: unknown key: libraries` |
| Edge: `libraries:` with no value | red: `FAIL: libraries-empty: missing [error: libraries is neither check nor avoid: None] in: error: unknown key: libraries` |
| Edge: `projects:` form, tool-a `libraries: maybe` | red: `FAIL: projects-libraries-value: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists` |

No case was one the brief's rules get wrong, so no case was handed back and no cases ruling exists.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. The key in the three templates | DONE | `sed -n 13p skills/plan/templates/plan.yaml`; `grep -n libraries skills/plan/templates/plan.projects.yaml`; `sed -n 15p skills/plan/templates/orchestrator-state.md`; `sh skills/land/templates/land.test.sh 2>&1 \| tail -1` | `libraries: check                          # required. check: /spec looks for a library for every capability a step builds before it writes the brief; avoid: no new dependency.`; `15:    libraries: check` and `34:    libraries: check`; `libraries: check\|avoid       # the project's library policy from plan.yaml: check, /spec looks for libraries before a brief; avoid, no new dependency.`; `PASS: land.sh and usage.py scratch tests` |
| 2. `check_config.py` and its test | DONE | `sed -n 72,73p skills/ordo-init/templates/check_config.py`; `sh skills/ordo-init/templates/check_config.test.sh` | `if "libraries" in config and config["libraries"] not in ("check", "avoid"):` / `errors.append(f"{prefix}libraries is neither check nor avoid: {config['libraries']!r}")`; `PASS: check_config.py scratch tests`. The docstring (lines 8 to 11) names "a libraries that is neither check nor avoid". |
| 3. `/ordo-init` | DONE | `sed -n 58,62p skills/ordo-init/SKILL.md`; `sed -n 86p` and `sed -n 98p` of it | Steps 6 asks `worker` and `reviewer` with the offered answer, and `libraries` with its two values, what each means and no offered answer; "Checking an existing file" 2 names "`libraries` neither `check` nor `avoid`"; the Stops row reads "Worker, reviewer and libraries". |
| 4. `/spec` | DONE | `sed -n 71,78p skills/spec/SKILL.md`; `grep -n "Libraries checked\|libraries: check" skills/spec/SKILL.md` | Steps 3 "Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.", with the search under `check`, the stop with options, pros and cons and one recommendation, the candidate facts, the bundle-size rule, "With no candidate, the brief says so.", and the `avoid` sentence; Steps 4 line 88 names "Libraries checked"; the Stops row "A user-visible choice" names the library case (line 179). |
| 5. `templates/brief.md` | DONE | `sed -n 33,38p skills/spec/templates/brief.md` | `## Libraries checked` after "Decisions taken in this brief", the `check` and `avoid` placeholders, and "The builder adds no dependency this brief does not name. A library the builder finds that would cover its work is reported, not installed." |
| 6. `/refute` | DONE | `sed -n 81p skills/refute/SKILL.md` | `  - a dependency the diff adds that the brief does not name;` under Spec |
| 7. `.agents/plan.yaml` | DONE | `tail -1 .agents/plan.yaml`; `python3 skills/ordo-init/templates/check_config.py . \| tail -1`, exit status | `libraries: avoid                          # check: /spec looks for a library for every capability a step builds before it writes the brief; avoid: no new dependency.`; `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`, `exit 0` |
| 8. `README.md` line 105 | DONE | `sed -n 105p README.md` | "... Nine are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker`, `reviewer` and `libraries`. ..." |
| `/plan` and `/spec` refuse a missing `libraries` with no new text | DONE, by reading | `sed -n '/## What it reads/,/## Steps/p' skills/plan/SKILL.md`; `grep -n "required key" skills/plan/SKILL.md skills/spec/SKILL.md` | `/plan` "What it reads" 1: the required keys are those `templates/plan.yaml` marks, and "No file, and a required key missing, are stops"; its Stops row 74 "A required key missing ... the refusal names the key". `/spec` "What it reads" 1: "its required keys and defaults as `/plan` states them; a required key missing is a refusal", Stops row "A required key missing". `check_config.py`'s `example_keys` reads `# required.` from the same template, and the `libraries-missing` case shows the key is read as required. |
| The old `.agents/plan.yaml` under the new example | DONE | a scratch repository with `git show HEAD:.agents/plan.yaml` as its configuration, `python3 skills/ordo-init/templates/check_config.py <scratch>` | `error: required key missing: libraries`, exit 1 |
| Verify list | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | see below, exit 0 |
| Only the brief's paths | DONE | `git diff --stat`; `git status --short` | the eleven paths below and the report; no untracked file |

The verify runner printed, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
```

The ASCII check printed nothing; `LC_ALL=C grep -n '[^ -~]' $(git diff --name-only)` also printed nothing (exit 1).

## Each new test, its revert and its red line

Each revert was applied to a scratch copy of `skills/ordo-init` and `skills/plan` and the test file run there, stopping at the first red and again continuing past it.

| Rule or branch | Case | Revert | Red line |
|---|---|---|---|
| `libraries` is required | `libraries-missing` | `templates/plan.yaml` marks it `# optional, default check.` | `FAIL: libraries-missing: expected an error, got a pass: note: libraries not set, default 'check' applies` |
| The same, in the `projects:` form | `projects-libraries` | the same revert | `FAIL: projects-libraries: expected an error, got a pass: note: tool-b: libraries not set, default 'check' applies` |
| A value other than `check` or `avoid` is refused | `libraries-maybe`, `-capital`, `-empty-string`, `-boolean` | the two lines of the `libraries` value check removed from `check_config.py` | `FAIL: libraries-maybe: expected an error, got a pass: ok: ...`; `FAIL: libraries-capital: missing [error: libraries is neither check nor avoid: 'Check'] in: ok: ...`; `FAIL: libraries-empty-string: missing [error: libraries is neither check nor avoid: ''] in: ok: ...`; `FAIL: libraries-boolean: missing [error: libraries is neither check nor avoid: True] in: ok: ...` |
| The value check in the `projects:` form, with the label | `projects-libraries-value` | the same removal | `FAIL: projects-libraries-value: missing [error: tool-a: libraries is neither check nor avoid: 'maybe'] in: ok: ...` |
| An empty value is refused | `libraries-empty` | the check written as the `review` check is, `config.get("libraries") not in (None, "check", "avoid")` | `FAIL: libraries-empty: missing [error: libraries is neither check nor avoid: None] in: ok: ...` |
| `check` passes (silent case; its control is `libraries-maybe`) | `libraries-check` | the check's tuple reduced to `("avoid",)`; also `libraries` removed from `templates/plan.yaml` | `FAIL: libraries-check: expected a pass, got: error: libraries is neither check nor avoid: 'check'`; `FAIL: libraries-check: expected a pass, got: error: unknown key: libraries` |
| `avoid` passes (silent case; same control) | `libraries-avoid` | the tuple reduced to `("check",)`; also `libraries` removed from `templates/plan.yaml` | `FAIL: libraries-avoid: expected a pass, got: error: libraries is neither check nor avoid: 'avoid'`; `FAIL: libraries-avoid: expected a pass, got: error: unknown key: libraries` |
| The error carries the project's label | `projects-libraries` | `prefix` dropped from the "required key missing" line | `FAIL: projects-libraries: missing [error: tool-b: required key missing: libraries] in: error: required key missing: libraries` |
| A project that sets `libraries` is not named (silent case; its control is the tool-b error in the same run) | `projects-libraries` | `plan.projects.yaml`'s tool-a without its `libraries` line | `FAIL: projects-libraries: tool-a named although it sets libraries: error: tool-a: required key missing: libraries` |
| The three templates agree | `land.test.sh` (existing, not new) | not reverted in this step | not run |

## Files changed

`git diff --numstat`, and `wc -l` after the change:

| File | Added / removed | Lines |
|---|---|---|
| `.agents/plan.yaml` | 1 / 0 | 11 |
| `README.md` | 1 / 1 | 150 |
| `skills/ordo-init/SKILL.md` | 7 / 3 | 116 |
| `skills/ordo-init/templates/check_config.py` | 5 / 2 | 109 |
| `skills/ordo-init/templates/check_config.test.sh` | 63 / 8 | 159 |
| `skills/plan/templates/orchestrator-state.md` | 1 / 0 | 67 |
| `skills/plan/templates/plan.projects.yaml` | 2 / 0 | 43 |
| `skills/plan/templates/plan.yaml` | 1 / 0 | 22 |
| `skills/refute/SKILL.md` | 1 / 0 | 135 |
| `skills/spec/SKILL.md` | 32 / 23 | 201 |
| `skills/spec/templates/brief.md` | 6 / 0 | 63 |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/17a-report.md` | new | this file |

## Judgment calls

1. `/spec` Steps 3 reads the key from `.agents/plan.yaml` ("What it reads" 1), not from the state file's configuration block, since "What it reads" 1 is where the refusal of a missing required key sits and a plan opened before this step has no `libraries` line in its block.
2. Inserting Steps 3 renumbers `/spec`'s Steps 3 to 8 as 4 to 9. Every "Steps N" inside `skills/spec/SKILL.md` that pointed at them was carried (18 references, among them "Steps 2 and 8" now "Steps 2 and 9"); "its Steps 4" (plan-orchestration's) and "the `land` skill's Steps 6" were left as they are.
3. The Stops row "A user-visible choice" in `/spec` names the library case, so Steps 3's stop points at a row that covers it.
4. `/spec`'s frontmatter description names the library search and "the libraries checked" among the brief's sections, so its list of what the skill does stays whole.
5. `/ordo-init` Steps 6 became an item with four bullets (worker and reviewer; libraries asked with no offered answer; what `check` means; what `avoid` means), one rule per bullet; the Stops row is renamed "Worker, reviewer and libraries".
6. `check_config.test.sh`: the projects fixture moved into a `make_projects_repo` function, used by the existing `projects` case and the two new ones.
7. Cases beyond the brief's list, under change-standard rule 15 (edges of a new key's value) and item 2's "in both forms": `Check`, `''`, `yes`, an empty value, and `libraries: maybe` in the `projects:` form.
8. The `libraries` check refuses an empty value (`None`), where the `review` check skips `None`: a required key present with no value is neither `check` nor `avoid`. The `review` check is unchanged.
9. No skill's `metadata.version` was bumped; the brief names none.

## User-visible changes

- `libraries` is a required key. Before: a `.agents/plan.yaml` without it passed `check_config.py`. After: it prints `error: required key missing: libraries` and exits 1, and `/plan` and `/spec` refuse and name the key. `/refute`, `/land` and `/plan-help` read "its required keys ... as `/plan` states them; a required key missing is a refusal" ("What it reads" 1 of each), so they refuse it too.
- A `libraries` value other than `check` or `avoid`. Before: `unknown key: libraries`. After: `libraries is neither check nor avoid: <value>` (`'maybe'`, `None` for an empty value), prefixed with the project's name in the `projects:` form.
- `/ordo-init` asks for `libraries` with no offered answer.
- Under `libraries: check`, `/spec` searches for libraries before the brief and stops on a candidate; under `avoid` the brief says the step adds no new dependency. Every brief carries a "Libraries checked" section.
- `/refute` reports a dependency the diff adds that the brief does not name, under Spec.
- This repository's `.agents/plan.yaml` sets `libraries: avoid`.

## Sentences elsewhere the change makes false or incomplete (reported, not edited)

- `skills/plan-orchestration/SKILL.md:156`: "`/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 4)". That comparison is now `/spec`'s Steps 5.
- `skills/plan/SKILL.md:54`: "The configuration block is filled in from `plan.yaml`, every key of the block written out ...: the verification commands copied from the page, the rules file, the standards, the worktree root and paths, the worker, the reviewer, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once`, `bench`." The block now holds `libraries`, which the list does not name.
- This ledger's `orchestrator-state.md` configuration block has no `libraries` line (`grep -c '^libraries:' .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` prints 0; the one other hit of `libraries` is the closed item of ruling T). `land.test.sh` reads the template, not the ledger, so nothing is red; the file is the orchestrator's.

## Premises of the brief found wrong

- "It checks `review`'s value (line 65)": on the base, line 65 is `if value is None or default is None:` of the kind check; the `review` check is lines 69 and 70 (`sed -n 63,70p skills/ordo-init/templates/check_config.py` on the base). The new check sits beside it as the brief asks.

Every other premise was reproduced: `sed -n 1,21p skills/plan/templates/plan.yaml` (required 5 to 12, optional 13 to 21); `land.test.sh` lines 874 to 916 hold `check_examples`; `/ordo-init` lines 58, 82 and 94; `/spec` line 108 the dependency install; `README.md` line 105; `.agents/plan.yaml` without `libraries`.
