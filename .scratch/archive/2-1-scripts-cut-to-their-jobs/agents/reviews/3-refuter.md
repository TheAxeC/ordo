# Step 3 refuter report (on .agents/worktrees/2-1-3, base 1c58523)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Every command below was run from the worktree root unless another folder is named. The tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

```
$ git status --short        (the 31 paths of the diff, plus ?? .scratch/.../3-report.md and ?? docs/dev/scripts.md; every path is in the brief's "Paths this step writes")
$ C1: diff <(git ls-files -co --exclude-standard '*.py' '*.sh' | grep -v '^.scratch/' | sort | comm -23 - <(git ls-files --deleted | sort)) <(grep -o '`[^`]*\.\(py\|sh\)`' docs/dev/scripts.md | tr -d '`' | sort -u)
exit 0, no output (13 paths on each side)
$ C2: ls <the ten paths>
ls: <each of the ten paths>: No such file or directory   (ten lines), exit 1
$ C3: git grep -n -e person-driven -e git_guard -e 'checks.test' -e 'plan_cost.test' -e 'transcript_window.test' -e 'check_coverage.test' -i -e 'git guard' -e 'actions file' -e 'observations file' -- skills docs/dev docs/glossary.md README.md utils
exit 1, no output
$ C4: sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ C5: python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)
$ C7: the test lines of the change standard's command block and of docs/dev/building.md's list, compared
exit 0: land.test.sh, check_config.test.sh, sync_rules.test.sh, the glossary command, pin.test.sh, the ASCII check, in that order in both
$ C8: grep -nF 'Every script is listed on' docs/dev/change-standard.md
20:- Every script is listed on `docs/dev/scripts.md` as a development, user or test script, with its job. A change that adds, removes or renames a script updates the page in the same change.
$ grep -nF 'Code handles a case only when' skills/repo-setup/templates/shared-rules.md
15:- **Scripts compute facts; judgment is read.** ... Code handles a case only when that case has happened or when a wrong answer on it costs something. ...
$ C9: grep -m1 -n version skills/session-retro/SKILL.md skills/ordo-init/SKILL.md
skills/session-retro/SKILL.md:5:  version: "1.0.1"
skills/ordo-init/SKILL.md:5:  version: "2.0.0"
$ Verify 2: LC_ALL=C grep -n '[^ -~]' <every file the diff changes or adds, docs/dev/scripts.md and the report>
exit 1, no output
$ the ASCII check of the verify list (git ls-files -coz ... | xargs -0 perl ...)
"Can't open <path>" for each of the ten deleted files (still in the index), exit 0
$ Verify 3: bash -n over land.sh, land.test.sh, pin.sh, pin.test.sh, check_config.test.sh, sync_rules.test.sh
0 for each
$ python3 -m py_compile over check_config.py, plan_cost.py, transcript_window.py
0 for each

Commands the report quotes as evidence, rerun:
$ the four new tests copied over a `git archive 1c58523 skills utils` extraction in a scratch folder and run there (rule 13, the unchanged tree)
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
$ land.sh in a scratch repository, the cut script, with .agents/plan.yaml set to each value
"ledger_root: [unclosed": yaml traceback ending "expected ',' or ']', but got '<stream end>'", status 1
"- a / - b" (a list): "configuration failed: no ledger_root in .agents/plan.yaml", status 64
"ledger_root: ./led/": "configuration failed: the state file led/p/orchestrator-state.md is not under the ledger_root ./led/", status 64
empty file: "TypeError: argument of type 'NoneType' is not iterable", status 1
$ plan_cost.py, base and cut, on .scratch/2-1-scripts-cut-to-their-jobs and on .scratch/archive/2-e-grill (it holds agents/agent-roles.md and >= lower bounds), transcript root ~/.claude-work/projects
old exit 0 new exit 0, identical (both ledgers)
$ transcript_window.py, base and cut, on ~/.claude-work/projects/-Users-axelfaes-workspace-ordo, 2026-10-05T00:00:00Z to 2026-10-06T00:00:00Z
old exit 0, new exit 0, stdout identical (4572 lines), stderr identical
$ transcript_window.py <folder> --session x y
cut: "error: expected <transcript folder> <start> <end> or <transcript folder> --session <session id>", exit 2
base: "error: --session takes one session id and no times or further arguments", exit 2
$ the report's claim "no tag of Ordo has skills outside skills/": for each tag, git ls-tree -r --name-only <tag>, counting skills/*/SKILL.md and */SKILL.md
v1.0.0 new=0 old=10; every other tag (v1.1.0 to v3.0.0) old=0
$ in a scratch clone of Ordo, scratch HOME and ORDO_STABLE: pin.sh v1.0.0
cut: "pin: tag v1.0.0 holds no skill", exit 1
base: "pinned: v1.0.0 (80cfa51), 10 skills linked in: <scratch>/home/.claude/skills", exit 0
$ git -C ~/.local/share/ordo-stable reflog | tail -5
... e3ab45d HEAD@{13}: checkout: moving from 80cfa51... to v1.1.0 / 80cfa51 HEAD@{14}:   (the pinned worktree was created at 80cfa51, which is v1.0.0)
$ the report's claim that the real-file check covers an agent folder that is not a folder: scratch clone, ~/.claude/agents written as a file, pin.sh v3.0.0
cut: "pin: <home>/.claude/agents/ordo-medium.md does not link to ..." (one per agent), "pin: the links do not match the pin after linking", exit 1; pinned worktree created; 13 skill links made
base: "pin: <home>/.claude/agents is not a folder; move it away and run again", exit 1; no worktree; 0 skill links
$ check_config.py on a folder with no .agents/plan.yaml
cut: "FileNotFoundError: [Errno 2] No such file or directory: '<root>/.agents/plan.yaml'" (traceback), exit 1
base: "error: no .agents/plan.yaml in <root>", exit 1
$ check_config.py on the one-project example with worker_effort written as "<<: {worker_effort: low, worker_effort: max}"
cut: "ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists", exit 0
base: "error: key written twice: worker_effort", exit 1
$ grep -c '<<' on the four .agents/plan.yaml files of ~/workspace
0 each (the report's grep for merge keys reproduces)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated, Standards 6 (the job line of `transcript_window.py` leaves out its one-session form). The listing itself is exact (C1).
- 2: holds: the bullet word for word at `docs/dev/change-standard.md` "Scripts compute facts; judgment is read" (C8), the sentence on tests rewritten in "Rules this repository already states", the command block holding the four kept tests, the glossary command and the ASCII check (C7). The template copy holds no such sentence (`grep -n -i 'beside\|has a test'` over it), so it needed none.
- 3: holds: C8, after the sentence on tests.
- 4: holds: C2 and C3 print the missing files and no hit; `diagnose` Steps item 11 and its Stops row carry the person-driven rules of the deleted reference (list, one-line observation, longer output in a file, red stated first, one pass per run, quoted whole and redacted before Steps 22, not a captured artifact); the two glossary entries are gone from both copies; `diagnosis.md` asks for the actions and observations; `repo-setup`'s offer is gone from its description, "What it reads" 1, Steps 3, 4, 5, 10, 11, the questions, the tree, Stops and Rules, and from `README.md`.
- 5: violated, Spec 1 (pin.sh, tags from before the skills move) and Spec 2 (check_config.py, a key written twice in a merged mapping), with Proof 1 and Proof 2 on the reasons the report gives.
- 6: violated, Standards 4 (`sync_rules.test.sh` keeps a check-mode assertion and a dead helper branch) and Standards 5 (`pin.test.sh` asserts a summary line whose failure costs nothing). Each kept test passes after the change and, in its new form, on the unchanged tree.
- 7: holds: C7, and the sentence on a new script reads "a new script is listed on `docs/dev/scripts.md`, and adds its test here and to the command block of `docs/dev/change-standard.md` only when it has one".
- 8: holds: `ordo-init` 2.0.0 (its check's output changed: the repair_reviewer note, the quoted-switch message, the missing-file error); `session-retro` 1.0.1 (identical output on a real window; only a usage error's text changed, and a refusal of a value the text already called an error is no run that worked before, `docs/dev/skill-layout.md` "Frontmatter").
- 9: violated, Standards 1 (the glossary's "ten questions") and Spec 1 (`README.md`'s going-back sentence).

Cases of the brief's "Cases":

- C1: met, empty diff, 13 paths each side.
- C2: met, all ten missing.
- C3: met, no hit.
- C4: partial, all four pass, and two assertions fail the cost test when read, Standards 4 and Standards 5.
- C5: met.
- C6: partial, Spec 1 and Spec 2.
- C7: met.
- C8: met, both greps and both sentences read.
- C9: met.

## 1. Spec

- `utils/pin.sh:328` and `:161-162`: "tag_skills=$(printf '%s\n' "$tag_files" | sed -n 's#^skills/\([^/]*\)/SKILL\.md$#\1#p')" and "for entry in "$1"/skills/*/SKILL.md; do". The fallback for a tag whose skills stand at the top level, and `skill_root`, are removed. What is wrong: the case has happened. Tag v1.0.0 holds its ten skills at the top level, and the pinned worktree was created at 80cfa51, which is v1.0.0 (its reflog, HEAD@{14}). Item 5 keeps "a case the case rule allows ... whether or not a caller names it", and the change standard's case rule allows a case that has happened. `README.md:184`, the caller's text, still says "going back is `utils/pin.sh <older tag>`". The removal rests on the report's false premise (Proof 1). Failure scenario: the user runs `utils/pin.sh v1.0.0` to go back, as the README says. The cut script prints `pin: tag v1.0.0 holds no skill` and exits 1, where the base script pinned it. Verdict: item 5 violated, item 9 violated, C6 partial.
- `skills/ordo-init/templates/check_config.py:63`: "if key_node.tag == MERGE_TAG:\n    continue". The recursion that scanned a mapping written as a merge key's value is removed. What is wrong: a wrong configuration is now accepted. A key written twice inside such a mapping passes, and YAML keeps the last value. The rules file's cost list counts "a wrong configuration accepted" as a cost, and ruling A1's recorded pro is that "`check_config.py` may still refuse a bad configuration that has not happened yet". Item 5 keeps a case whose wrong answer costs something. The step also keeps the other merge-key cases (`check_config.test.sh` "merge-key" and "merge-key-twice"), so the cut is inconsistent. The docstring at `:8`, "key written twice: <key>, a key written twice in one mapping", is now false for a merge mapping (rules file, rule 14). Failure scenario: `<<: {worker_effort: low, worker_effort: max}` in `.agents/plan.yaml`. The cut script prints `ok: ...` and exits 0, and `/ordo-init` Steps 13 calls the setup done with `worker_effort` silently `max`. The base script printed `error: key written twice: worker_effort`. Verdict: item 5 violated, C6 partial.

## 2. Proof

- `3-report.md`, "Cut scripts", `utils/pin.sh`: "Top-level-skills tag support: no tag of Ordo has skills outside `skills/`." What is wrong: the claim is false. `git ls-tree` prints old=10 for v1.0.0, and the base pin.sh pins v1.0.0 where the cut one refuses it. The decision that rests on it is the removal of `skill_root` and of the top-level fallback (item 5). Failure scenario: as Spec 1, and the orchestrator lands a removal whose stated reason does not hold. Verdict: item 5 violated (Spec 1).
- `3-report.md`, "Cut scripts", `utils/pin.sh`: "The "agent folder is also a skill folder" and "agent folder is not a folder" refusals: the real-file check covers what they guarded." and "The resolved-parent compare in `links_into_ordo`." What is wrong: the rerun shows the real-file check does not cover them. With `~/.claude/agents` written as a file, the cut script checks the pinned worktree out at the tag, links 13 skills, then exits 1 at the check after linking. The base script refused with "is not a folder" and changed nothing. The second line gives no reason, and item 5 asks for one per removed part. The decision that rests on both is the removal (item 5), and the README's pin paragraph says pin mode refuses before anything changes. Failure scenario: a user with an agents path that is not a folder gets a half-done pin (the worktree moved, the skills relinked, the agents not), where before nothing changed. Verdict: item 5 violated.
- `3-report.md`, DONE / NOT DONE row C4: "Each new test also passes against the unchanged-tree script (a `git show HEAD:` copy of it in a scratch folder), as rule 13 asks". What is wrong: rule 13 asks the report to quote each run. No run on the unchanged tree is quoted. My own rerun, the four new tests over a `git archive 1c58523` extraction, printed the four `PASS:` lines quoted above. Failure scenario: a reader of the report cannot check the claim from the report alone. Verdict: none, since the rerun reproduces it.

## 3. Standards

- `docs/glossary.md:88` and `skills/repo-setup/templates/plan-terms.md:83`: "- **questions, the**: the ten questions `/repo-setup` asks before it drafts a repository, each with its default." What is wrong: the step removed question 10, and "The questions" of `skills/repo-setup/SKILL.md` now holds nine. A sentence the diff makes false breaks rules file rule 14 and item 9. Both copies must change together to keep C5 green. Failure scenario: a reader or an agent checking the setup counts on ten questions and looks for a tenth that no longer exists. Verdict: item 9 violated.
- `skills/land/templates/land.sh:53-77` (the exit list), and `skills/land/SKILL.md` "The landing script": "64 when it refuses its arguments or its configuration". What is wrong: a `.agents/plan.yaml` that is not valid YAML, or is empty, now ends with a Python traceback and status 1 (rerun above). Neither the head comment's exit-1 list nor the skill's sentence names this case. Rules file rule 14 says a script's head comment lists every error it prints and every exit status it returns. The report's line "Exits are unchanged: 0, 1, 2, 64, or git's own status" contradicts its own host-visible change list. A missing `python3` now exits 127, which the comment files under "a git step failed". Failure scenario: the orchestrator reads exit 1 at landing as a failed check or a stop, while the cause is a broken configuration that no message names.
- `skills/repo-setup/SKILL.md:241`: "- The skill never writes a Claude Code settings file." What is wrong: the do-instead clause went with the git guard, so the rule is now a bare prohibition. `docs/dev/skill-layout.md` "Writing for an agent" asks a prohibition to name the behaviour to do instead, and no Anti-patterns row of `repo-setup` names one. Failure scenario: an agent reading the rule has nothing to do in its place where a setup seems to need settings.
- `skills/repo-setup/templates/sync_rules.test.sh:114-119`: "expect 1 python3 -B "$sync" "$test_root/drift" ... *"-- **Zero warnings.** Mostly."*". Also `:143` and `:159-160`: '"denied" raises a permission error' / 'if how == "denied":'. What is wrong: item 6 keeps only the `--write` cases. Lines 114-119 assert the check mode's exit and diff text, a behaviour whose failure costs nothing. No case uses the "denied" branch of the fake `open` any more, which is code larger than its job. The header's third cost, "writes one file when the run was refused", is outside item 6's three. By it the step keeps "drift-no-glossary" and drops "claude-denied", which is in the same category. Failure scenario: a change to check mode's diff text turns this `--write` test red; a reader of the helper looks for a denied-write case that no longer exists. Verdict: item 6 violated, C4 partial.
- `utils/pin.test.sh:245-250`: "# CLAUDE_CONFIG_DIR naming a folder the glob also finds gives one folder, named once ... [ "$skills_line" = "$d1, $d2" ]". What is wrong: the report gives this case's cost as "a folder linked twice or missed". Linking twice into one folder is idempotent (`ln -sfn`), so the only failure the named-once assertion catches is the summary line naming a folder twice, which costs nothing. The exit-0 part of the case, and the `$HOME/config` sub-case that covers "missed", do carry a cost. Failure scenario: a harmless change to the summary line's dedupe turns the test red. Verdict: item 6 violated, C4 partial.
- `docs/dev/scripts.md:22`: "Prints what was said and done in Claude Code transcripts inside a time window, with secrets replaced". What is wrong: `session-retro` Steps also runs the reader in its `--session` form, with no window (the glossary entry **reader, of the transcripts**: "for a window or for one Claude Code session"). Item 1 asks for the script's job. Failure scenario: a reader of the scripts page judges `--session` to be outside the job and cuts it in a later change. Verdict: item 1 violated.

## 4. Behaviour

- `3-report.md`, "Host- or user-visible changes": what is wrong is that these changes are not stated with their before and after (reproduced where marked):
  - `pin.sh <tag>` for a tag from before the skills move: before, it pinned; now it exits 1 with `pin: tag v1.0.0 holds no skill` (reproduced).
  - `pin.sh <tag>` with an agents path that is not a folder: before, a refusal with nothing changed; now the worktree is checked out and the skills linked, then exit 1 (reproduced).
  - `pin.sh <tag>` with an agent folder equal to a skill folder: before, a refusal; now both are linked into it (by reading).
  - `check_config.py` on a repository with no `.agents/plan.yaml`, which `README.md` "Configuring a repository" offers to run on its own: before, `error: no .agents/plan.yaml in <root>`; now a `FileNotFoundError` traceback (reproduced).
  - `check_config.py` on `self_rule: "on"`: before, `... is the text 'on' in quotes; write on or off without quotes`; now `... is neither on nor off: 'on'`. This is named under judgment calls only.
  - `check_config.py` on a key written twice inside a merge mapping: before, refused; now passed (reproduced; Spec 2).
  - `land.sh` with `LANDING_LOCK_WAIT` set: before, the bound came from it; now the variable is ignored.
  - `land.sh` with no `python3` or no PyYAML: before, a named message and exit 1; now the shell's or Python's own error and exit 127 or 1.
  - `transcript_window.py` with stdout closed early: before, a silent stop with exit 0 or 1; now a `BrokenPipeError` traceback. A stat that fails on permission: before, `error: cannot read`, exit 2; now a traceback (by reading).
- Failure scenario: the user reads the landing report, does not learn that `utils/pin.sh <older tag>` no longer reaches v1.0.0 or that a pin can now stop half-done, and relies on the README's "refuses, changing nothing".

## Declined to judge

- Whether links into Ordo in `~/.agents/skills` have had a relative target with `..` or a target named through another path. Those are the only links the removed resolved-parent compare in `links_into_ordo` caught. `~/.agents/skills` now holds only `find-skills`, a real folder. The transcripts, or the user's word, would settle it.
- Whether `README.md`'s former "folders whose path holds a space" (the pinning section) named the newline form of `ORDO_SKILL_DIRS` or the default folders. The builder kept `ORDO_SKILL_DIRS` because the README names it and removed the newline form, which the head comment called "the form for a folder whose path holds a space". The sentence reads both ways, and the user or the orchestrator settles which.
- Whether the `ps -ax -o comm=` path left after the `pgrep` removal finds a running git on Linux. Only macOS was run here, and no Linux host of Ordo is on record.
- C1 and C2 on main, which the brief runs at landing.
- The plan's whole verify list, which runs at landing on main.

Reviewer usage: adebd5ea8efbd7e4d, claude-opus-5-5, 304550 tokens, 73 tool uses, 12.7 minutes.

## Repair round 1, refuted

```
Run from /Users/axelfaes/workspace/ordo/.agents/worktrees/2-1-3 (base 1c58523). The delta is the saved before-round patch applied to a `git archive 1c58523` extraction in my scratch folder, compared with `diff -u` against the current tree (11 files differ: docs/dev/scripts.md, docs/glossary.md, skills/land/SKILL.md, skills/land/templates/land.sh, skills/ordo-init/templates/check_config.py, check_config.test.sh, skills/repo-setup/SKILL.md, skills/repo-setup/templates/plan-terms.md, sync_rules.test.sh, utils/pin.sh, utils/pin.test.sh). Every path is in the brief's "Paths this step writes". Tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

$ C1: diff <(git ls-files -co --exclude-standard '*.py' '*.sh' | grep -v '^.scratch/' | sort | comm -23 - <(git ls-files --deleted | sort)) <(grep -o '`[^`]*\.\(py\|sh\)`' docs/dev/scripts.md | tr -d '`' | sort -u)
(no output), exit 0
$ C2: ls <the ten paths>
No such file or directory, ten lines
$ C3: git grep -n -e person-driven -e git_guard -e 'checks.test' -e 'plan_cost.test' -e 'transcript_window.test' -e 'check_coverage.test' -i -e 'git guard' -e 'actions file' -e 'observations file' -- skills docs/dev docs/glossary.md README.md utils
(no output), exit 1
$ C4: the four tests, as docs/dev/building.md lists them, `| tail -1`
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
$ C5: python3 -B skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template   (exit 0)
$ C7: the test lines of the change standard's command block and of building.md's list
land.test.sh, check_config.test.sh, sync_rules.test.sh, the glossary command, pin.test.sh, the ASCII check: the same six, in the same order, in both
$ C8: grep -nF 'Every script is listed on' docs/dev/change-standard.md
20:- Every script is listed on `docs/dev/scripts.md` as a development, user or test script, with its job. A change that adds, removes or renames a script updates the page in the same change.
$ grep -nF 'Code handles a case only when' skills/repo-setup/templates/shared-rules.md
15:- **Scripts compute facts; judgment is read.** ... Code handles a case only when that case has happened or when a wrong answer on it costs something. ...
$ C9: grep -m1 -n version skills/session-retro/SKILL.md skills/ordo-init/SKILL.md
skills/session-retro/SKILL.md:5:  version: "1.0.1"
skills/ordo-init/SKILL.md:5:  version: "2.0.0"
$ ASCII: LC_ALL=C grep -n '[^ -~]' over the 22 added or modified files of the diff and over the main checkout's 3-report.md
no hit (exit 1)
$ ASCII: the verify list's perl command over the 833 existing tracked and untracked files
no hit, exit 0 (the ten deleted files, still in the index, print "Can't open" until landing, as the report says)
$ bash -n over land.sh, land.test.sh, check_config.test.sh, sync_rules.test.sh, pin.sh, pin.test.sh
0 for each
$ python3 compile() over check_config.py, plan_cost.py, transcript_window.py (py_compile's syntax check without writing __pycache__ into the worktree)
0 for each
$ git status --short (worktree)
only the diff's paths, plus ?? the report; no stray file

Commands the round section quotes, rerun:
$ the four round-1 test files copied over a `git archive 1c58523` extraction, each run
base tree land.test.sh: PASS: land.sh scratch tests
base tree check_config.test.sh: PASS: check_config.py scratch tests
base tree sync_rules.test.sh: PASS: sync_rules.py scratch tests
base tree pin.test.sh: PASS: pin.sh scratch tests
(reproduces the report's rule 13 lines)
$ item 1: scratch clone of Ordo, scratch HOME and ORDO_STABLE, the cut utils/pin.sh: pin.sh v1.0.0, then check mode, then pin.sh v3.0.0
pinned: v1.0.0, 10 skills linked ... exit 0; check mode exit 0; v3.0.0: 13 skills linked, plan-help removed, 5 agents linked, exit 0
$ item 2: the same clone, ~/.claude/agents written as a file, pin.sh v3.0.0
pin: <home>/.claude/agents is not a folder; move it away and run again, exit 1; no pinned worktree created, 0 skill links
$ item 2: ORDO_SKILL_DIRS="<h>/skills <h>/agents", pin.sh v3.0.0
pin: <h>/agents is both a skill folder and an agent folder, exit 1; neither <h> nor the pinned worktree created
$ item 3: scratch repository, .agents/plan.yaml with worker_effort removed and `<<: {worker_effort: low, worker_effort: max}` appended, check_config.py
error: key written twice: worker_effort, exit 1 (the base script prints the same)
$ item 4: check_config.py on a folder with no .agents/plan.yaml
error: no .agents/plan.yaml in <folder>, exit 1
$ item 5: land.sh in a scratch repository, a state file under led/p, .agents/plan.yaml set to each value
empty file: "configuration failed: .agents/plan.yaml is empty", 64
"a: [b" and "ledger_root: [unclosed": "configuration failed: .agents/plan.yaml is not valid YAML: while parsing a flow sequence ...", 64
"- a": "no ledger_root in .agents/plan.yaml", 64; no file: ".agents/plan.yaml not found", 64; no traceback in any
$ item 6: sed -n '/^## The questions/,/^## The tree/p' skills/repo-setup/SKILL.md | grep -n '^[0-9]*\.'
questions 1 to 9; `git grep -i 'ten questions'` over the tree outside .scratch: no hit; glossary.md:88 and plan-terms.md:83 read "the nine questions", word for word
$ item 12 claims: transcript_window.py on a window, old against cut: stdout and stderr identical (4734 lines); plan_cost.py old against cut on .scratch/2-1-scripts-cut-to-their-jobs and .scratch/archive/2-e-grill: identical except the "Prices from <path>" line
$ transcript_window.py piped to head -1: old exit 0; cut: BrokenPipeError traceback, pipeline exit 120 (as the report states)
$ transcript_window.py on a folder whose parent has mode 000: old "error: cannot read <folder>: Permission denied", exit 2; cut: PermissionError traceback, exit 1 (as the report states)
$ land.sh with a python3 that cannot import yaml (a shim running python3 -S)
"ModuleNotFoundError: No module named 'yaml'", exit 1
$ git show 1c58523:skills/land/templates/land.sh | grep -n LANDING_LOCK_WAIT: the bound and its refusal exist in the base; grep over the cut script: no hit
```

### Verdicts

Items of the brief's "What to build", for the whole diff since the base:

- 1: holds. The listing equals the files (C1); `docs/dev/scripts.md` now gives `transcript_window.py` as "for a time window or for one Claude Code session, with secrets replaced".
- 2: holds. The bullet is word for word (C8); the sentence on tests reads "only for behaviour whose failure costs something, as the bullet on tests ... says"; the command block holds the four kept tests, the glossary command and the ASCII check (C7).
- 3: holds (C8).
- 4: holds (C2, C3; unchanged in the round).
- 5: holds for the cut of each script as the first refuter's reruns and mine show. The three restorations reproduce (pin.sh top-level tag, the two agents refusals and the resolved-parent compare, the merge-mapping scan), the named error of check_config.py is back, and land.sh refuses an empty or invalid configuration with 64. One sentence about land.sh's exits is left, under Standards 1, and counts against item 9.
- 6: holds. `sync_rules.test.sh` has only `--write` cases and the "denied" branch is gone; the named-once assertion is gone from `pin.test.sh`. Each case left is read against the cost test, and each kept test passes on the unchanged tree and after the round.
- 7: holds (C7, and the sentence on a new script).
- 8: holds. `ordo-init` 2.0.0, `session-retro` 1.0.1 (C9).
- 9: violated, Standards 1 (the exit list of `land.sh` in `skills/land/SKILL.md` and in the plan skill's state template) and Standards 2 (the reader's exit-1 sentence in `session-retro`). Both are small.

Cases of the brief's "Cases":

- C1: met, empty diff.
- C2: met, ten files missing.
- C3: met, no hit.
- C4: met. All four pass; the two assertions that failed the cost test (check mode's diff text in `sync_rules.test.sh`, the named-once line in `pin.test.sh`) are removed. I read each remaining case in both files against item 6's cost test and found none that fails it. The `sync_rules.test.sh` header still names a third cost, "writes one file when the run was refused", beside the three of item 6. The round brief's item 8 lists it, and "drift-no-glossary" is the one case that rests on it (see Declined to judge).
- C5: met.
- C6: met. Each part kept is used by a caller or handles a case the case rule allows. The restored parts are the ones the first refuter showed to be needed.
- C7: met.
- C8: met.
- C9: met.

Closure of each of the twelve round items (my own rerun, quoted above): 1 closed, 2 closed, 3 closed, 4 closed, 5 closed, 6 closed, 7 closed (Rules reads "...a setting the user asks for is written out in the reply, for the user to add."), 8 closed, 9 closed, 10 closed, 11 closed (the four unchanged-tree runs reproduce), 12 closed with the one misquote under Proof 1.

No finding was closed by removing a check that guarded a case. Items 8 and 9 removed assertions the refuter's findings named, and nothing else. No fix reaches beyond its finding: the delta holds only what the twelve items name.

### Findings

**1. Spec**

- none.

**2. Proof**

- `3-report.md`, "Repair round 1" and "Host- or user-visible changes", the `land.sh` line: "With no PyYAML: ... now Python's `ImportError: no yaml` traceback, exit 1." What is wrong: my run with a python3 that cannot import yaml printed `ModuleNotFoundError: No module named 'yaml'`, exit 1, not the quoted text. The decision that rests on it is what a landing user sees (item 12 asks for the before and after as run). Failure scenario: a user or orchestrator who searches the output of a failed landing for the quoted line does not find it. Small, fixed at landing by correcting the quoted text in the report. Verdict: none (item 12 holds for the change itself).

**3. Standards**

- `skills/land/SKILL.md` "The landing script" (the sentence "It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict, and 64 when it refuses its arguments or its configuration, or with git's own status when a git step fails.") and `skills/plan/templates/orchestrator-state.md`, "Verification, every step", the same sentence; the open plans' state files carry it too. What is wrong: after the cut `land.sh` exits 127 when python3 is not installed and 1 when yaml cannot be imported, with no message of its own. The head comment of `land.sh` now says so ("n any other status: ... python3 is not installed (127) or cannot import yaml (1)"), but these two sentences give no such case. Before the cut the same case was exit 1 under "a stop". Rule 14 of the rules file and item 9 apply, and the brief's item 5 says the template and the state files keep stating the exits "as they stand after the cut". Failure scenario: the orchestrator reads 127 at a landing, finds it in neither sentence, and cannot tell a missing interpreter from a git failure. Fix at landing: add "or 127 when python3 is not installed" to the three texts (the state files of the open plans through the landing's verify-list step) and leave the wording of the 1 case as it is. The alternative, restoring the python3 preflight, is a choice the orchestrator makes. Verdict: item 9 violated.
- `skills/session-retro/SKILL.md` "The reader": "Exit status 1 means a file or folder could not be read, with `error: cannot read <path>: <reason>` on stderr, and the output lacks it." What is wrong: on a folder whose stat fails (my run: parent with mode 000) the cut script exits 1 with a `PermissionError` traceback and no `error:` line. The report names this change, but the sentence is now inexact for that case. Failure scenario: a reader of the skill that sees a traceback does not know it is the documented exit 1. Small; fixed at landing by one clause in the sentence. Verdict: item 9 violated.

**4. Behaviour**

- none. The report's "Host- or user-visible changes" now states `LANDING_LOCK_WAIT` ignored, `land.sh` with no python3 and with no PyYAML, the quoted `self_rule`, and `transcript_window.py` on a closed stdout and on a failed stat, each with before and after. I reproduced the `LANDING_LOCK_WAIT`, closed-stdout and failed-stat cases. The `pin.sh`, no-`plan.yaml` and merge-mapping changes are undone and not listed, as the round brief says.

### Declined to judge

- Whether "writes one file when the run was refused" belongs among the `sync_rules.test.sh` costs. The round brief's item 8 names it, and item 6 of the first brief does not. The user or the orchestrator settles it. If it falls outside, `drift-no-glossary` goes and the header's third cost with it.
- Whether the lock check still finds a running git on Linux after the `pgrep` removal, and the plan's whole verify list at landing: the round brief assigns both to the orchestrator, and no Linux host of Ordo is on record.
- The line lengths of the head comments of `pin.sh` and `land.sh`: the round added lines of 126 to 155 characters beside the 100-column hard wrap the rest of the comment keeps. No standard of the repository sets a width for a code comment.
- The exit 127 case itself (python3 absent from PATH): not run here, read from the script's `python3 - ... <<` call and its `exit "$landing_status"`. The missing-yaml case was run.
- C1 and C2 on main, which the brief runs at landing.

Reviewer usage: a3203a31d2578865b, claude-sonnet-5-5, 166247 tokens, 42 tool uses, 6.4 minutes.

## Closed

First run:

- Spec 1, Proof 1 (`pin.sh`, a tag with its skills at the top level): closed in round 1, item 1; the round's rerun pinned v1.0.0.
- Spec 2 (`check_config.py`, a key written twice in a merge mapping): closed in round 1, item 3.
- Proof 2 (`pin.sh`, the agents refusals and the resolved-parent compare): closed in round 1, item 2.
- Proof 3 (rule 13): closed in round 1, item 11.
- Standards 1 (the glossary's "ten questions"): closed in round 1, item 6.
- Standards 2 (`land.sh`, a configuration that does not load): closed in round 1, item 5.
- Standards 3 (`repo-setup`'s bare prohibition): closed in round 1, item 7.
- Standards 4 (`sync_rules.test.sh`): closed in round 1, item 8.
- Standards 5 (`pin.test.sh`, the named-once assertion): closed in round 1, item 9.
- Standards 6 (`docs/dev/scripts.md`, the reader's job): closed in round 1, item 10.
- Behaviour (the changes without before and after): closed in round 1, items 1 to 5 and 12.
- Declined, the lock check on Linux once `pgrep` is gone: closed under self-rule; no Linux host of Ordo is on record, so by the case rule the case has not happened, and `land.sh` keeps the `ps` path it has.

Run over round 1, fixed at landing on main:

- Proof 1 (the quoted PyYAML error): the report's line corrected to `ModuleNotFoundError: No module named 'yaml'`.
- Standards 1 (`land.sh`'s exit 127): "or 127 when `python3` is not installed" added to `skills/land/SKILL.md` "The landing script", to `skills/plan/templates/orchestrator-state.md` "Verification, every step", and to the same sentence in each open plan's state file.
- Standards 2 (the reader's exit 1): `skills/session-retro/SKILL.md` "The reader" names the traceback of a folder whose check fails on permission.
- Declined, the third cost of `sync_rules.test.sh`: closed under self-rule; a write when the run was refused leaves one file changed and the other not, which is a file left wrong, so the cost is within item 6 and `drift-no-glossary` stays.
