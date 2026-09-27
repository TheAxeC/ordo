# Step 20 refuter report (on .agents/worktrees/2b-20, base 7d3e907)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md ... ok: skills/spec/SKILL.md   (ten ok: lines)
Can't open skills/plan-orchestration/templates/allow_list.py: No such file or directory at -e line 1.
(four more Can't open lines, one per deleted file, from the ASCII check reading the index)
verify: 12 commands passed
exit 0   (rerun with output to /dev/null; echo $?)

$ git grep -n -i -E '<the brief's pattern>' -- ':!.scratch'
37 lines, the same lines the report quotes: README.md 50, 58, 118, 151; docs/academic-coverage.md 5, 23, 29; docs/roadmap.md 22, 136, 137; skills/land/SKILL.md 96; land.sh 11, 141, 142; land.test.sh 11, 492, 497, 498, 505, 517, 518; skills/ordo-init/SKILL.md 31, 53; check_config.test.sh 79-82, 84, 86; skills/repo-setup/SKILL.md 44, 55, 64; repo-setup templates/CLAUDE.md 30; repo-setup templates/docs/dev/change-standard.md 45; sync_rules.test.sh 29; skills/spec/templates/brief.md 50; utils/pin.test.sh 39.

$ git grep -c ... 7d3e907 (premise counts at base): all per-file counts match the brief. Base line counts: SKILL.md 302, launch.sh 879, launch.test.sh 1953, allow_list.py 255, allow_list.test.sh 337, launch-note.md 34.

$ python3 skills/ordo-init/templates/check_config.py .   (scratch repo, worker: codex:gpt-5.6-sol)
error: worker is not claude:<model>: 'codex:gpt-5.6-sol'
exit=1

Reverts rerun in a scratch copy of the worktree (the worktree was not touched):
- check_config.py MODEL -> r"^(claude|codex):\S+$": FAIL: codex-worker: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
- usage.py "if not is_claude_log(path):" -> "if False:": FAIL: usage.py on a file that is not a Claude Code log exited 0, expected 64:
- pin.sh defaults with $HOME/.agents/skills added back: FAIL: pin.sh wrote into /private/var/folders/.../pin-test.9mMkgT/my home/.agents/skills with the default folders
- sync_rules.py AGENTS.md symlink check added back: FAIL: python3 -B .../sync_rules.py .../sync-rules-test.ha5MSJ/same
- launch_note line appended to plan/templates/plan.yaml: FAIL: old-launch_note: expected an error, got a pass: ok: ...
- Baselines of the copy before each revert: PASS: check_config.py scratch tests; PASS: land.sh and usage.py scratch tests.

$ ASCII check over the 23 modified files: exit=0; the report file: no non-ASCII line; no em dash in added lines.
$ git grep -n -w perl -- skills utils README.md docs/dev: the ASCII check and sync_rules.test.sh only (README's new perl sentence holds).
$ git grep -n -i 'effort' -- skills utils README.md docs/dev: worker_effort appears only in skills/plan/templates/plan.yaml:15, plan.projects.yaml:17,36, orchestrator-state.md:14; at base its one reader was plan-orchestration/SKILL.md:168 "--effort <worker_effort>" of the codex recipe.
$ ls -la ~/.agents/skills: ten links (land, ordo-init, plan, ..., spec) into /Users/axelfaes/.local/share/ordo-stable/<skill>.
$ ls .agents/launch (main checkout): 2b-7 present.
```

## 1. Spec

- `plan.md:40` (the step 20 line) names "the models ruling's Astra and Sol, and `.agents/launch/2b-7`"; the brief carries neither. On main, `ls .agents/launch` still shows `2b-7`, and `plan.md:75` still reads "Fable, Astra and Sol are options for the orchestrator, Sol for the agents". Both are the orchestrator's (ledger and main checkout), so they must be done at landing; neither is in the builder's report.
- `skills/plan/templates/plan.yaml:15`, `orchestrator-state.md:14`, `plan.projects.yaml:17,36`: `worker_effort` survives with the comment "the reasoning effort passed to a worker whose harness takes one". Its only reader was the Codex recipe's `--effort <worker_effort>` (base `skills/plan-orchestration/SKILL.md:168`); the Agent-tool recipe passes no effort. Brief item 2 removes every Codex passage, and ruling U 1 removes "the Codex text of every skill". So the key is now a configuration key that nothing reads. The builder lists it under "Not changed" as outside the brief. It is a config key, so rule 4 reserves the choice for the user. It needs an open item: (a) remove `worker_effort` from both examples, the state template, `/plan`'s list and `check_config`'s key set; or (b) keep it and state what reads it. (b) is the lazy option.
- Brief premise, "What is on the tree": `launch-note.md` is 34 lines at base, not 35 (`git show 7d3e907:... | wc -l`). This changes nothing.

## 2. Proof

- none. Every revert I reran turned its test red, with the FAIL lines quoted above. The V1, V2 and V3 outputs match the report. Proof 10 (the `$d2` to `$d1` fixture move in `pin.test.sh`) is correctly labelled an audit, not a proof.

## 3. Standards

- `skills/land/templates/land.sh:37,52,125-126`: the `<runs dir>` positional argument is still required and still checked to exist, but nothing reads it any more. Its only reader was the removed Codex event-log branch. That is dead code the removal left (change standard rule 11). `land.test.sh:577-578` also writes `session.jsonl` into `adapted_runs`, and nothing reads that file. The builder raised this as judgment call 1 and did not fix it, because the command line is a public signature (rule 4). It needs the orchestrator's ruling. I agree with the builder's option (a): remove the argument, its preflight check and the dead fixture. (b), keeping it, is the lazy option.
- `skills/spec/SKILL.md:125`: "what differs per harness is in `plan-orchestration`'s launch recipes" is false after this step, because one recipe remains and there is one harness (rule 14). The file is outside the path list, and the builder reported it with the grep. It must be fixed at landing.
- `skills/plan-orchestration/SKILL.md:109-110, 211`: the step removed the definition of a dead builder (pid gone, no exit file five seconds later), and it removed where an agent's transcript is kept ("the runner's transcript store under the agent id"). "A dead builder is reported to the user with what its transcript holds" and the Anti-patterns row "Relaunching a dead builder silently" now use both terms with nothing defining them. Nothing says how a dead builder is told apart through the agent listing. Nothing says what an agent id missing from a new session's listing means, which is the handover case of line 95 (rule 14: a sentence the change leaves half-true).
- `skills/ordo-init/templates/check_config.test.sh:85` ("Red when the example carries the key again"), the case names `old-launch_note` / `old-worker_allow`, and `utils/pin.test.sh:330` ("Red when the defaults name $d2 again"): each comment or name points at what the code did before (rule 10, no history in comments).

## 4. Behaviour

- On this machine `~/.agents/skills` holds ten links into `~/.local/share/ordo-stable/<skill>` (`ls -la ~/.agents/skills`). After this step, `utils/pin.sh <tag>` neither updates nor checks them. At the pin ruling W schedules, the worktree moves to a tag whose skills sit under `skills/`, and those ten links are then left pointing at paths that would no longer exist. That consequence is not verified, since the tag does not exist yet. `land.sh`, `brief.md` and the change-standard template still search `~/.agents/skills` before `$CLAUDE_CONFIG_DIR/skills`. The report's pin row states the new defaults, but not what happens to links an earlier pin made. Removing them should be a named action at landing or pinning.
- `/plan-orchestration`'s Quick start line "continue the plan" changed from "on another harness" to "in another session". The dispatch block also lost its launch fields (`prompt`, `output`, `pid`, `exit`, `repair_*`, `cases_*`). The report states the second under judgment call 6, but neither is in its before-and-after table.

## Not checked

- Whether Claude Code's agent listing in a new session shows a background agent that an earlier session started. The resumption text now depends on it.
- I did not rerun the report's reverts 2, 3 (`bad-harness` message), 5, 6 and 9 of `check_config`/`land` individually. I reran the five listed above.

Reviewer usage: 38 tool uses, about 15 minutes.

## Repair round 1, refuted

```
$ git status --short        (worktree 2b-20)
28 tracked files M or D as at the first review, plus skills/spec/SKILL.md M; untracked: agents/briefs/20-round-1.md, agents/reviews/20-refuter.md, agents/reviews/20-report.md

$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md ... ok: skills/spec/SKILL.md   (ten ok: lines)
Can't open skills/plan-orchestration/templates/allow_list.py: No such file or directory at -e line 1.
(four more Can't open lines, one per deleted file)
verify: 12 commands passed
exit=0

$ git grep -n -i -E '<the brief's pattern>' -- ':!.scratch' | wc -l
38
(the file:line list is identical to the report's V2 list of round 1)

$ python3 skills/ordo-init/templates/check_config.py .   (scratch copy, worker: codex:gpt-5.6-sol)
error: worker is not claude:<model>: 'codex:gpt-5.6-sol'
error: worktree_root is not ignored by git: .agents/worktrees   (the copy has no .git; unrelated)
exit=1
$ same copy, worker restored, "worker_effort: high" appended:
error: unknown key: worker_effort

$ grep -rn -i -e '<name>' --exclude-dir=.scratch --exclude-dir=.git .   (outside .agents/worktrees)
runs dir, runs_dir, runs directory, landing_runs, -runs, write_events, at high, launch recipe: no hits
worker_effort: check_config.test.sh:85,86 only (the new case)
effort: those two lines, and docs/academic-coverage.md:143 (unrelated "effort estimates")
transcript: orchestrator-state.md:3, plan-orchestration/SKILL.md:33, 98 (the orchestrator's own transcript)
harness: check_config.test.sh:70-72 (case name bad-harness), :78 (comment), repo-setup/SKILL.md:88 ("test harness", unrelated)
$ grep -n -E 'again|old-' skills/ordo-init/templates/check_config.test.sh   -> no output, rc=1
$ grep -n -i 'effort\|harness' skills/plan/SKILL.md skills/plan-orchestration/SKILL.md skills/spec/SKILL.md   -> no output, rc=1
$ ASCII check (perl, building.md form) over git diff 7d3e907 --name-only --diff-filter=AM   -> no output, exit=0
$ LC_ALL=C grep -n '[^ -~]' agents/reviews/20-report.md   -> no output, rc=1
$ grep -n worker_effort .scratch/.../orchestrator-state.md
26:worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.

Reverts, in a scratch copy of the worktree (rsync without .git; the worktree untouched):
baselines: PASS: land.sh and usage.py scratch tests / PASS: check_config.py scratch tests / PASS: pin.sh scratch tests
1. land.sh: -lt 3, landing_runs=$3, shift 3, runs-directory preflight restored
   FAIL: clean landing exited 1, expected 0
1b. land.sh: only "-lt 2" -> "-lt 3"
   PASS: land.sh and usage.py scratch tests
2. land.sh worker row "worker claude:opus at high"
   FAIL: worker row: missing [clean, worker claude:opus, first run: <tokens>, ...
3. plan/templates/plan.yaml + "worker_effort: high ... # optional, default high."
   FAIL: unknown-worker_effort: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
4. plan/templates/plan.yaml + 'launch_note: ""'
   FAIL: unknown-launch_note: expected an error, got a pass: ok: ...
5. utils/pin.sh defaults "$HOME/.claude/skills$nl$HOME/.agents/skills"
   FAIL: pin.sh wrote into /private/var/folders/.../pin-test.cssoz3/my home/.agents/skills with the default folders
each restored; tails PASS again. (The copy has no .git, so land.test.sh's check_examples prints "not in an Ordo checkout" there; the state-template/example key equality was checked only by V1 in the worktree.)
```

Rulings, closure as claimed:
- Ruling 1 (`<runs dir>`): done as ruled. land.sh:37,46,68 and the preflight lose the argument; land.test.sh's five calls pass `<pkg> <base> --no-browser`; `write_session` takes a file, and the adapted landing's unused log is gone. README and land/SKILL.md never named the argument (grep empty). Revert 1 reproduces the report's FAIL line.
- Ruling 2 (`worker_effort`): done as ruled across plan.yaml, both projects, orchestrator-state.md, plan/SKILL.md Steps 4. The `unknown-*` loop is red under reverts 3 and 4. The worker row lost `at high`, which follows from the removal (revert 2 red).
- Ruling 3 (dead builder): done in plan-orchestration/SKILL.md:109-111 and the Anti-patterns row :213, in the ruling's words. See the standards finding on :103 against :110.
- Ruling 4 (spec/SKILL.md:125): rewritten to "A runner or a vendor named in the brief | The brief then ties the step to how it is launched, which `plan-orchestration`'s "Launching a builder" alone says"; true now; no harness left in the file.
- Ruling 5 (history wording): check_config.test.sh:84-85 and the `unknown-*` names, pin.test.sh:330 in present terms; grep for `again|old-` empty.
- Ruling 6 (before and after): the report's "Before and after, added in round 1" has the Quick start row and the dispatch-block row, both matching the diff of plan-orchestration/SKILL.md:17 and orchestrator-state.md:25.

**Spec**
- none from the builder. Orchestrator's, at landing: the ledger's own `orchestrator-state.md:26` still carries `worker_effort: high` with the comment "a worker whose harness takes one" (ruling 2's grep excluded `.scratch`). The state file is the orchestrator's to rewrite.

**Proof**
- skills/land/templates/land.sh:46 (`if [ "$#" -lt 2 ]`): the ruling asked for a case that proves land.sh runs with the new arguments. The report's revert 1 bundles four edits, and only the restored preflight turns it red. Revert 1b (only `-lt 2` changed to `-lt 3`) leaves the suite green (`PASS: land.sh and usage.py scratch tests`). Every call in land.test.sh passes `--no-browser` (5 hits), so no case runs the new minimal form `land.sh <pkg> <base>`. The argument-count change is unproven. A fix: a case that calls land.sh with exactly two arguments and asserts it gets past the usage check. A control would assert that one argument exits 64 with the usage line.

**Standards**
- skills/plan-orchestration/SKILL.md:103 against :110: ":103 A finished builder resumes at the read of its report" and ":110 A builder is also dead when a later session does not find its agent id in its own listing". Both hold for a builder that finished before a handover when the new session's listing lacks it. Whether a listing carries over is not verified. Nothing tells finished from dead in a later session. The report file at the dispatch block's `report` path is the fact that would, and the text does not name it (rule 14, a sentence left half-true). The wording is the ruling's own, so the fix belongs at landing. A fix: ":110 ... and no report is at the dispatch block's `report` path in the worktree".
- skills/plan-orchestration/SKILL.md:152 "A repair round resumes it with the runner's message tool on that id": no id is named earlier in "Launching a builder". The section's first bullet mentions none, so "that id" has no antecedent (prose standard E, cold open). A fix: "on its agent id in `session_id`".

**Behaviour**
- none. land.sh's command line, the removal of `worker_effort`, the Quick start line and the dispatch block each have a before-and-after row in the round's table.

Reviewer usage: 34 tool uses, about 20 minutes.
