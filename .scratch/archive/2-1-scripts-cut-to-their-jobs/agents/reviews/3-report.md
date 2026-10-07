# Report of step 3 of plan 2.1, the scripts

Everything in the brief is done. Mentions of the deleted files that remain stand outside "Paths this step writes" and are listed under "Anything in the brief that was wrong or impossible".

## Open items of the state file

- Open item D (2026-10-06), kind 3 (the reversal of a ruling), raised from step 2's review (`agents/reviews/2-refuter.md`, "3. Standards" 1): plan 3's ledger, `.scratch/3-the-writing-base/plan.md`, opened and not started, still copies entry 3's old gate and rests on its planted text: its "## Gate" section and the gate questions under it, step 2 ("The runs: a planted text with one break of each rule of `references/` ..."), step 3's check ("every planted break named"), and its rulings D9, Open item Gate 3 and Open item Gate 3b, which you ruled when the planted clauses were added. Step 2 of plan 2.1 removed those clauses from the roadmap by your approval of entry 2.1 and your ruling C.
  - (a) Carry the change into plan 3's ledger now: its gate copied again from the roadmap, the gate questions rewritten to match, step 2 running `/writing` on the real manuscript and the real grant only, step 3's check reading "every finding marked right by both reviewers", and a Rulings bullet in plan 3 saying that plan 2.1's ruling C replaces the planted-text parts of D9, Gate 3 and Gate 3b. Pro: plan 3's ledger agrees with the roadmap before anything is built on it. Con: it rewrites rulings of yours in another plan's ledger.
  - (b) Leave plan 3's ledger, and let plan 3's own `/spec` meet the difference as a false premise when it runs. Pro: no change to plan 3 now. Con: plan 3 stays in contradiction with the roadmap until then, and its `/spec` stops on it then.
  - Recommendation: (a). The lazy option is (b). Plan 2.1 goes on: none of its steps depends on the ruling.

## The cases' first run, on the unchanged tree

The first run is the output of each command on a copy of HEAD (`git archive HEAD` extracted into a scratch folder with its own `git init`, tests run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`).

- C1: printed 21 lines (`1,21d0`), every script path, because `docs/dev/scripts.md` does not exist there.
- C2: `ls` printed all ten paths, so none was missing.
- C3: printed hits in 16 files: `README.md` lines 13, 66, 115 and 167; `docs/dev/building.md` lines 7, 10, 11, 12, 13 and 16; `docs/dev/change-standard.md` lines 69, 72 to 75 and 78; `docs/glossary.md` lines 10 and 70; `skills/diagnose/SKILL.md` lines 243 and 253; `skills/diagnose/references/person-driven.md`; `skills/diagnose/templates/diagnosis.md` lines 38 and 41; `skills/diagnose/templates/person-driven.sh` and `person-driven.test.sh`.
- C4: `land.test.sh`, `check_config.test.sh`, `sync_rules.test.sh` and `pin.test.sh` each printed their `PASS:` line.
- C5: `ok: the plan-terms block equals the template`.
- C6: read against the callers' text; the parts it found unused are the removed parts listed below.
- C7: the building page's list and the change standard's command block named the same tests in the same order (ten `sh` lines).
- C8: both greps printed nothing (neither sentence existed).
- C9: `skills/session-retro/SKILL.md:5:  version: "1.0.0"` and `skills/ordo-init/SKILL.md:5:  version: "1.2.0"`.

## DONE / NOT DONE

| Item | State | Command and output as printed |
|---|---|---|
| C1 | DONE | `diff <(git ls-files -co --exclude-standard '*.py' '*.sh' \| grep -v '^.scratch/' \| sort \| comm -23 - <(git ls-files --deleted \| sort)) <(grep -o '`[^`]*\.\(py\|sh\)`' docs/dev/scripts.md \| tr -d '`' \| sort -u)` printed nothing, exit 0 |
| C2 | DONE | `ls` named each of the ten paths as `No such file or directory` |
| C3 | DONE | the `git grep` printed nothing |
| C4 | DONE | `land.test.sh`: `PASS: land.sh scratch tests`; `check_config.test.sh`: `PASS: check_config.py scratch tests`; `sync_rules.test.sh`: `PASS: sync_rules.py scratch tests`; `pin.test.sh`: `PASS: pin.sh scratch tests`. Each new test also passes against the unchanged-tree script (a `git show HEAD:` copy of it in a scratch folder), as rule 13 asks |
| C5 | DONE | `ok: the plan-terms block equals the template` |
| C6 | DONE | each cut script read against its callers; see the per-script lists |
| C7 | DONE | the two lists name `land.test.sh`, `check_config.test.sh`, `sync_rules.test.sh`, the glossary command, `pin.test.sh` and the ASCII check in that order |
| C8 | DONE | `grep -nF 'Every script is listed on' docs/dev/change-standard.md` printed line 20; `grep -nF 'Code handles a case only when' skills/repo-setup/templates/shared-rules.md` printed line 15 |
| C9 | DONE | `skills/session-retro/SKILL.md:5:  version: "1.0.1"` and `skills/ordo-init/SKILL.md:5:  version: "2.0.0"` |
| Verify 2 | DONE | the character-set scan over every file the step changes or adds printed nothing; the repository ASCII command over the 832 existing tracked and untracked files exited 0; `LC_ALL=C grep -n '[^ -~]'` over the three changed `.py` files printed nothing |
| Verify 3 | DONE | `sh -n` over the six changed `.sh` files and `python3 -m py_compile` over the three changed `.py` files exited 0; every `__pycache__` removed |

## Cut scripts

### `skills/land/templates/land.sh`, 469 to 399 lines

Exits: 0, 1, 2, 64, git's own status, and 127 (python3 not installed) or 1 (python3 cannot import yaml), which the head comment lists.

- The `LANDING_LOCK_WAIT` setting: no caller sets it; the wait is the constant 60.
- The python3 preflight and the PyYAML import branch: `checks.sh` and `.agents/plan.yaml` already need both, and a missing one fails at its first use.
- The `./` and trailing-`/` normalisation and `dot_allowed`: `.agents/plan.yaml` has never held such a value; a `ledger_root` written `./led/` is now refused with exit 64, "the state file ... is not under the ledger_root ./led/".
- The not-a-mapping and projects-shape refusals: `.agents/plan.yaml` has only ever been a mapping. An empty file or one that is not valid YAML is refused with exit 64 and a message naming the file.
- The `pgrep` branch of the live-git-process check: the lock file check decides.
- The relative-gitdir branch of the git-directory lookup: no worktree of Ordo has one.
- The ledger-ignore write guard and the branch-read failure handlers: they guarded paths that cannot occur once the folder check passes.
- The `git diff --cached` fallback branch and the `rev-list --count` failure branch: git's own status is returned.
- Kept: every refusal of arguments and configuration with exit 64, the conflict stop with exit 2 that leaves main as it was, the main-has-staged-changes refusal, the ledger-file handling, the failing-check exit 1.

### `utils/pin.sh`, 524 to 504 lines

- The newline form of `ORDO_SKILL_DIRS`: it is split on spaces and tabs.
- The newline-in-default-path and whitespace refusals: a home folder holding a space works, and nothing else of the kind has happened. The absolute-path refusal stays because a relative folder would link into the wrong place.
- The agent real-file and directory refusals are one message, `<entry> is not a link; move it away and run again`.
- Kept: the top-level-skills form of a tag (v1.0.0 holds its skills at the top level and was pinned on this machine), the "agent folder is also a skill folder" and "agent folder is not a folder" refusals (without them a pin stops half done), the resolved-parent compare in `links_into_ordo` (a link into Ordo reached through another path left in `~/.agents/skills` would otherwise stay installed), the foreign-link, real-directory, local-changes and not-a-worktree refusals (each protects a user's file or the pinned worktree), the `~/.agents/skills` link removal, check mode, `ORDO_SKILL_DIRS` (the README names it).

### `skills/ordo-init/templates/check_config.py`, 240 to 232 lines

- The quoted-switch message: a quoted `self_rule` still gets the generic "neither on nor off" error.
- Kept: the "no .agents/plan.yaml" error (the README offers running the script on its own) and the scan of a mapping written as a merge key's value (a key written twice there would be accepted otherwise).
- The repair_reviewer note names no value ("repair_reviewer not set, the reviewer's value applies").

### `skills/plan-orchestration/templates/plan_cost.py`, 672 to 609 lines

- The agent-id pattern and its error: an agent id is a dictionary key and text, never a path.
- The `os.walk` error handler: an unreadable folder shows as "no transcript of agent <id>".
- The usage errors "no such folder" and "not a folder" are one (`not a folder: <path>`).
- The "not valid JSON" and "not a JSON object" errors of a transcript line, a body and a settings file are one ("not a JSON object").
- The first-line-is-a-comment error of the price table, and the "n fields" and "price is not a number" errors, which are one ("a row is not a model id and five prices").
- The `usage.cache_creation is not an object`, `usage.server_tool_use is not an object`, `no message.id`, `no message.model`, `no requestId`, `usage is missing`, `no id`, `no model` and `env is not an object` errors: each case is still an error or a priced-from-the-table error through the checks that remain.
- The "not valid UTF-8" read error: read errors are one `cannot read <path>: <reason>`.
- Kept: the price table and the unknown-model error, `agent-roles.md`, the bodies folder lookup (environment, then settings files), the lower bound, the requestId pattern (a requestId reaches a body path), the unpriced speed, region, tier and web-search checks, the duplicate-model and duplicate-agent errors, the two-transcripts error.

### `skills/session-retro/templates/transcript_window.py`, 480 to 454 lines

- The broken-pipe handling: the skill writes the reader's output to a file.
- The stat-failure "cannot read" error of the folder and session file: a folder that cannot be checked is not a folder.
- The "--session takes one session id" message: it is the usage error.
- The recursion-error catch on a transcript line.
- Kept: every redaction pattern (a missed secret is a leak), the entry filters, the skipped-line note, exit 1 for a file or folder that cannot be read.

## Kept tests

### `skills/land/templates/land.test.sh`, 156 to 156 lines

One line changed (`ledger_root: tools/b/.scratch`, the form `land.sh` still accepts). Cases: a conflict exits 2 and leaves main as it was (work lost otherwise); a ledger file left in the worktree under the projects form never reaches main (a booking lost or a wrong file landed); a failing check fails the landing (a wrong landing accepted); a clean landing stages the step on main (the one thing it exists for).

### `utils/pin.test.sh`, 876 to 425 lines

Cases and what a failure costs: check with no pin, first pin and the live clone moving on (the install is wrong); a live-clone link replaced, and one for a skill the tag lacks refused (a broken or half-changed install); check after linking fails (a bad pin reported as good); local changes, a foreign link and a non-worktree refused (a user's file or checkout lost); a deleted pinned worktree recreated (the install stays broken); a tag whose skills stand at the top level pinned and the pin moved forward again (the user cannot go back to v1.0.0); the `~/.agents/skills` links removed and other entries left (a user's entry lost); `CLAUDE_CONFIG_DIR` naming a folder the glob finds, and an extra folder (a folder missed); `ORDO_SKILL_DIRS` split on spaces and tabs and a relative folder refused (links in the wrong place); the agents cases: link, filter, check, replace a live link, refuse a live link for an agent the tag lacks, refuse a real file and a foreign link, refuse an agent folder that is a file or is also a skill folder (a pin stops half done), remove a dropped agent (a user's agent file lost or an old agent left installed).

### `skills/ordo-init/templates/check_config.test.sh`, 570 to 160 lines

Each case is a configuration check_config.py must refuse, so a failure accepts a wrong configuration: a missing required key, an unknown key, a missing page, a worktree root not ignored, `.agents/plan.yaml` ignored by git (and `.agents/*` with `!.agents/plan.yaml` passing), a key written twice, and eleven wrong values (worker twice, repair_rounds, libraries, design_bar, design_references, worker_effort, self_rule, repair_reviewer, adr missing, adr outside the root). The projects form: the example passes; a missing worker, a wrong design_bar and a key written twice are named with their project; a merge key passes, a key written twice beside it is refused, and a key written twice inside a merge key's mapping is refused.

### `skills/repo-setup/templates/sync_rules.test.sh`, 422 to 214 lines

`--write` only. Cases: a drifted block rewritten with every byte outside it kept, under a preamble holding a tab, trailing spaces and a UTF-8 letter (the user's text lost otherwise); a CRLF file keeps CRLF (every line rewritten otherwise); a CLAUDE.md that is not UTF-8 is refused and left byte for byte (a user's letter overwritten otherwise); a write that does not read back is refused (a file silently left wrong); `--write` of both blocks with the glossary in CRLF under a preamble; `--only glossary --write` rewrites the glossary alone and leaves a drifted CLAUDE.md; a drifted CLAUDE.md beside a missing glossary writes nothing.

## Files with line counts

`wc -l` after the change, with the line count before in brackets:

- `skills/land/templates/land.sh` 399 [469]
- `skills/land/templates/land.test.sh` 156 [156]
- `utils/pin.sh` 504 [524]
- `utils/pin.test.sh` 425 [876]
- `skills/ordo-init/templates/check_config.py` 232 [240]
- `skills/ordo-init/templates/check_config.test.sh` 160 [570]
- `skills/plan-orchestration/templates/plan_cost.py` 609 [672]
- `skills/session-retro/templates/transcript_window.py` 454 [480]
- `skills/repo-setup/templates/sync_rules.test.sh` 214 [422]
- `docs/dev/scripts.md` new
- Edited text: `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md`, `docs/glossary.md`, `skills/repo-setup/templates/plan-terms.md`, `skills/repo-setup/templates/shared-rules.md`, `skills/repo-setup/SKILL.md`, `skills/diagnose/SKILL.md`, `skills/diagnose/templates/diagnosis.md`, `skills/land/SKILL.md`, `skills/ordo-init/SKILL.md`, `skills/session-retro/SKILL.md`
- Deleted: `skills/diagnose/templates/person-driven.sh`, `person-driven.test.sh`, `skills/diagnose/references/person-driven.md`, `skills/repo-setup/templates/hooks/` (three files), `skills/land/templates/checks.test.sh`, `skills/plan-orchestration/templates/plan_cost.test.sh`, `skills/session-retro/templates/transcript_window.test.sh`, `utils/check_coverage.test.sh`
- The template copy of the change standard (`skills/repo-setup/templates/docs/dev/change-standard.md`) needed no edit: it holds no sentence on a test beside each script, no command block of tests and no `scripts.md` bullet, and its bullet on tests already says "code".

## Judgment calls the brief left open

- `docs/dev/scripts.md` kinds: `gen_figures.py`, `check_coverage.py` and `pin.sh` are development scripts (run by the person who works on Ordo, `README.md` "Working on Ordo" for `pin.sh`); `checks.sh`, `land.sh`, `check_config.py`, `plan_cost.py`, `sync_rules.py` and `transcript_window.py` are user scripts; the four `.test.sh` files are test scripts.
- Versions: `ordo-init` 2.0.0, because the repair_reviewer note's output changed and the quoted-switch message was removed; `session-retro` 1.0.1, because no run that worked is refused and its output is unchanged (the one changed line is the usage message of a misused `--session`).
- `ORDO_SKILL_DIRS` stays in `pin.sh` because the README names it, although it is unset on this machine.
- `plan_cost.py` keeps the duplicate-model error of the price table, since a duplicated row would price silently wrong.
- `diagnose`'s person-driven item 11 became text the session follows: the session writes the list of actions, the user gives one observation line per action, and the session quotes them with the observations in the record's "Red command" section.

## Host- or user-visible changes

- A `/diagnose` run for a symptom only a person can trigger no longer has a script: before, `person-driven.sh` ran the actions and wrote an observations file; now the session lists the actions and takes the user's one-line observations.
- `/repo-setup` no longer offers the git guard, copies no hook into `.claude/hooks/` and prints no settings text.
- `land.sh` with a `ledger_root` written `./led/`: before, the value was normalised; now it is refused with exit 64, "the state file ... is not under the ledger_root ./led/".
- `land.sh` with `LANDING_LOCK_WAIT=abc`: before, "arguments failed: LANDING_LOCK_WAIT must be a whole number of seconds: abc", exit 64; now the variable is ignored (the bound is 60 s) and the run goes on to its next check.
- `land.sh` with no `python3` on PATH: before, "preflight failed: python3 is not on PATH; ...", exit 1; now `python3: command not found` from the shell, exit 127. With no PyYAML: before, "configuration failed: python3 cannot import yaml; install PyYAML", exit 1; now Python's traceback ending `ModuleNotFoundError: No module named 'yaml'`, exit 1. The head comment lists both.
- `land.sh` with an empty or invalid `.agents/plan.yaml`: refused with exit 64 and a message naming the file, as before.
- `pin.sh`: `ORDO_SKILL_DIRS` is split on spaces and tabs only (a newline-separated value is one entry); a folder path holding a space inside that variable is no longer supported.
- `check_config.py`: the repair_reviewer note reads "repair_reviewer not set, the reviewer's value applies" where it named the value; a quoted `self_rule: "on"` gives "self_rule is neither on nor off: 'on'" where it gave "self_rule is the text 'on' in quotes; write on or off without quotes" (exit 1 in both).
- `plan_cost.py` and `transcript_window.py`: error texts for malformed input are merged as listed; the printed report is identical (old and new scripts compared on a scratch ledger, with and without a response-body folder).
- `transcript_window.py` with stdout closed early (`| head -1`): before, a silent stop, exit 0; now a `BrokenPipeError` traceback, exit 120 from the shell's pipeline. With a folder whose parent cannot be searched: before, "error: cannot read <folder>: Permission denied", exit 2; now a `PermissionError` traceback, exit 1. The skill writes the reader's output to a file, so neither is a run of the skill.
- The glossary no longer defines "actions file" and "observations file".
- `README.md` no longer names the git guard, `checks.test.sh`, the newline refusal of `pin.sh` or folders with a space in `ORDO_SKILL_DIRS`.

## Anything in the brief that was wrong or impossible

- `docs/roadmap.md` (lines 24, 25, 35, 232 and 238) and `docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md` (line 7) still name `person-driven.sh`, the git guard, `plan_cost.test.sh`, `check_coverage.test.sh` or `checks.test.sh`. They are the plan's own goal and gate text and done-records, outside "Paths this step writes", and C3's search covers only `skills`, `docs/dev`, `docs/glossary.md`, `README.md` and `utils`.
- The repository ASCII command in the building page runs `git ls-files -co`, which lists the ten deleted files while they are still in the index; it prints `Can't open <path>` for each until the deletions are staged at landing. Run over the existing files it exits 0.

## Repair round 1

All twelve items are DONE. Nothing is NOT DONE.

### Items

| Item | State | Command or reading that proves it |
|---|---|---|
| 1. `pin.sh`, a tag with its skills at the top level | DONE | `skill_root`, the top-level fallback of `tag_skills` and the head comment's "(v1.0.0)" sentence are back in `utils/pin.sh`; `utils/pin.test.sh` pins a tag `v0` built with `git commit-tree` whose `alpha/SKILL.md` stands at the top level, checks the link `$ORDO_STABLE/alpha` in both default folders, passes check mode, then pins `v2` again; the run printed `PASS: pin.sh scratch tests`. The "Cut scripts" line for `pin.sh` now lists the top-level form under "Kept" with its reason |
| 2. `pin.sh`, the agents refusals and the resolved-parent compare | DONE | Both refusals ("agent folder is also a skill folder", "agent folder is not a folder") are back, run in the pre-change loop before any worktree or link changes, and named in the head comment. The resolved-parent compare in `links_into_ordo` is back: no case-rule reason holds for removing it, since a link into Ordo reached through another path that stays in `~/.agents/skills` leaves a stale install. `utils/pin.test.sh` gains two cases: `~/.claude-work/agents` written as a file, and `ORDO_SKILL_DIRS="<root>/p/skills <root>/p/agents"`; each is refused with exit 1, its message, the worktree still at v3, no link changed, and `<root>/p` not created |
| 3. `check_config.py`, a key written twice inside a merge mapping | DONE | The scan of a mapping written as a merge key's value is back in `scan_keys`, with the docstring sentence; `check_config.test.sh` gains `merge-twice-inside` (`<<: {worker_effort: low, worker_effort: max}`), which expects `error: key written twice: worker_effort` |
| 4. `check_config.py` with no `.agents/plan.yaml` | DONE | `python3 skills/ordo-init/templates/check_config.py /tmp/nonexistent-xyz` printed `error: no .agents/plan.yaml in /tmp/nonexistent-xyz`, exit 1; the docstring lists the error again |
| 5. `land.sh`, a configuration that does not load | DONE | In a scratch repository, an empty `.agents/plan.yaml` printed `configuration failed: .agents/plan.yaml is empty`, exit 64; `a: [b` and `ledger_root: [unclosed` each printed `configuration failed: .agents/plan.yaml is not valid YAML: ...` naming the file, exit 64, no traceback. The head comment's exit 64 list and `skills/land/SKILL.md` "The landing script" name the case. The head comment's exit `n` line now also names 127 (python3 missing) and 1 (yaml not importable), and the report's line reads "Exits: 0, 1, 2, 64, git's own status, and 127 or 1 ..." |
| 6. The glossary's "ten questions" | DONE | `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md` both read "the nine questions `/repo-setup` asks"; `sed -n '/^## The questions/,/^## The tree/p' skills/repo-setup/SKILL.md` shows questions 1 to 9; `python3 -B skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| 7. `repo-setup`'s bare prohibition | DONE | `skills/repo-setup/SKILL.md` Rules now reads "The skill never writes a Claude Code settings file; a setting the user asks for is written out in the reply, for the user to add." |
| 8. `sync_rules.test.sh` | DONE | The check-mode assertion (the `expect 1` run, the stderr check and the diff-text `case`) is removed; the fake `open` has no `how` argument and no "denied" branch (`grep -n 'denied' skills/repo-setup/templates/sync_rules.test.sh` printed nothing). The header's costs are: the user's text outside the block lost, a file left written that does not hold what was meant, a file written when the run was refused; each case left has one of the three |
| 9. `pin.test.sh`, the named-once assertion | DONE | The `skills_line` lines are removed; the case keeps the exit status check and the `$HOME/config` sub-case; the header sentence and the case comment no longer say "once" |
| 10. `docs/dev/scripts.md` | DONE | The job of `transcript_window.py` reads "Prints what was said and done in Claude Code transcripts, for a time window or for one Claude Code session, with secrets replaced" |
| 11. Rule 13, each kept test on the unchanged tree | DONE | See the runs below |
| 12. Host- or user-visible changes | DONE | The "Host- or user-visible changes" section above now states each, with its before and after, as run in scratch folders |

### Rule 13: each kept test on the unchanged tree

Commands: `git archive HEAD` extracted into a scratch folder, the round-1 test file copied over its old one, then `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1 | tail -1`. The same four commands then ran on the worktree.

```
unchanged tree, skills/land/templates/land.test.sh: PASS: land.sh scratch tests
unchanged tree, skills/ordo-init/templates/check_config.test.sh: PASS: check_config.py scratch tests
unchanged tree, skills/repo-setup/templates/sync_rules.test.sh: PASS: sync_rules.py scratch tests
unchanged tree, utils/pin.test.sh: PASS: pin.sh scratch tests
round-1 tree, skills/land/templates/land.test.sh: PASS: land.sh scratch tests
round-1 tree, skills/ordo-init/templates/check_config.test.sh: PASS: check_config.py scratch tests
round-1 tree, skills/repo-setup/templates/sync_rules.test.sh: PASS: sync_rules.py scratch tests
round-1 tree, utils/pin.test.sh: PASS: pin.sh scratch tests
```

### C1 to C9 again

- C1: the brief's `diff <(git ls-files -co ...) <(grep -o ... docs/dev/scripts.md ...)` printed nothing, exit 0.
- C2: `ls` printed `No such file or directory` for each of the ten paths.
- C3: the `git grep` printed nothing, exit 1.
- C4: `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`.
- C5: `ok: the plan-terms block equals the template`.
- C6: each script read against its callers; the three restorations above remove what the refuter report found unused-but-needed.
- C7: the building page's test lines and the change standard's command block lines, compared, exit 0.
- C8: `20:- Every script is listed on ...` and `15:- **Scripts compute facts; judgment is read.** ...`.
- C9: `skills/session-retro/SKILL.md:5:  version: "1.0.1"` and `skills/ordo-init/SKILL.md:5:  version: "2.0.0"`.

### Checks over the changed files

- The repository ASCII command (`git ls-files -coz ...`, run over the 833 existing files) exited 0, and `LC_ALL=C grep -n '[^ -~]'` over every changed file, `docs/dev/scripts.md` and this report printed nothing.
- `bash -n` printed no error for `land.sh`, `land.test.sh`, `pin.sh`, `pin.test.sh`, `check_config.test.sh` and `sync_rules.test.sh`; `python3 -m py_compile` over `check_config.py`, `plan_cost.py` and `transcript_window.py` exited 0; every `__pycache__` removed.

### Line counts, before the round and after

| File | Before the round | After |
|---|---|---|
| `skills/land/templates/land.sh` | 394 | 399 |
| `skills/land/templates/land.test.sh` | 156 | 156 |
| `utils/pin.sh` | 481 | 504 |
| `utils/pin.test.sh` | 385 | 425 |
| `skills/ordo-init/templates/check_config.py` | 224 | 232 |
| `skills/ordo-init/templates/check_config.test.sh` | 154 | 160 |
| `skills/repo-setup/templates/sync_rules.test.sh` | 223 | 214 |

Unchanged in the round: `plan_cost.py` 609, `transcript_window.py` 454.

### Left to the orchestrator

Whether `pgrep`'s removal leaves the lock check working on Linux, and the plan's whole verify list at landing, as the round brief says.
