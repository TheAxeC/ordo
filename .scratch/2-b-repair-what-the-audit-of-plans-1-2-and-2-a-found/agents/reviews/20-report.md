# Step 20 report: Claude only

Everything in the brief is done. One point needs the orchestrator's ruling, under "Judgment calls" item 1: `land.sh` still takes its `<runs dir>` argument, and that argument no longer feeds anything.

## Open items of the state file, verbatim

- none.

## DONE / NOT DONE

| # | Item | State | Proof |
|---|---|---|---|
| 1 | The five shell-launch files deleted | DONE | `ls skills/plan-orchestration` prints `SKILL.md` only. The empty `templates/` folder was removed as well. |
| 2 | `plan-orchestration/SKILL.md` is Claude only | DONE | The final grep below finds no line in it. `python3 utils/check_skill_layout.py` prints `ok: skills/plan-orchestration/SKILL.md`. |
| 3 | The plan skill's configuration is Claude only | DONE | No grep hit in `skills/plan/`. `land.test.sh` prints `examples: plan.yaml and plan.projects.yaml match the state template, every key marked`. |
| 4 | `check_config.py` and its test | DONE | Verify 3 and the red proofs below. |
| 5 | `usage.py`, `land.sh`, `land.test.sh` | DONE | The red proofs below. `land.test.sh` keeps its Claude Code row case and its window-time refusals. |
| 6 | `/repo-setup` without `AGENTS.md` | DONE | The red proof below. The only remaining `AGENTS.md` hit in repo-setup is the test comment that names the revert. |
| 7 | `pin.sh` and its test | DONE | The red proof below. |
| 8 | `README.md`, `building.md`, `change-standard.md`, `.agents/plan.yaml` | DONE | The final grep. `python3 skills/ordo-init/templates/check_config.py .` ends with `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`. |
| 9 | Every grep hit is either removed or kept with a reason | DONE | The final grep below, each line matched to its reason. |
| V1 | Verify runner | DONE | Output below: exit 0, ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`. |
| V2 | The grep rerun | DONE | 37 lines, all quoted below. |
| V3 | `check_config.py` on `worker: codex:gpt-5.6-sol` | DONE | Exit 1, and the error names `claude:<model>`. |
| V4 | Every new or changed test has its red | DONE | Proofs 1 to 10 below. |

### V1: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0

```
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
Can't open skills/plan-orchestration/templates/allow_list.py: No such file or directory at -e line 1.
Can't open skills/plan-orchestration/templates/allow_list.test.sh: No such file or directory at -e line 1.
Can't open skills/plan-orchestration/templates/launch-note.md: No such file or directory at -e line 1.
Can't open skills/plan-orchestration/templates/launch.sh: No such file or directory at -e line 1.
Can't open skills/plan-orchestration/templates/launch.test.sh: No such file or directory at -e line 1.
verify: 12 commands passed
```

The five `Can't open` lines come from the ASCII check. `git ls-files -c` reads the index, and the index still lists the five deleted files until the orchestrator commits the deletion. These lines are perl warnings: they do not change the exit status, and they name no non-ASCII line. I also ran the same ASCII check over only the files that exist, and it printed nothing and exited 0:

```
git ls-files -coz --exclude-standard | python3 -c 'import sys,os; sys.stdout.write("".join(p+"\0" for p in sys.stdin.read().split("\0") if p and os.path.exists(p)))' | xargs -0 perl -CSD -ne '<the ASCII check>'; echo "exit=$?"
exit=0
```

### V2: the brief's grep, rerun, its whole output (37 lines)

`git grep -n -i -E 'codex|AGENTS\.md|launch\.sh|launch\.test|launch_note|launch-note|worker_allow|allow_list|claude -p|astra|\bsol\b|gpt|rollout|\.agents/skills|\.agents/launch' -- ':!.scratch'`

```
README.md:50:The skills call each other and read each other's templates, so install all of them. Claude Code reads skills from `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills` for a second account). Remove any copy of these skills under a repository's `.agents/skills` or `.claude/skills`, so that the installed copy is the only one loaded.
README.md:58:This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`.
README.md:118:- `land.test.sh` proves the landing on scratch repositories: [...] `verify.sh` is found in the repository's `.agents/skills` when the ledger lacks it, [...]
README.md:151:`land.sh` finds `verify.sh` and `usage.py` beside itself, then in the land skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`). A missing state file, or a `verify.sh` in none of those places, is refused before `main` is touched, with the places named.
docs/academic-coverage.md:5:The files are those in `research-hub/.agents/skills/` of the skills `academic-paper`, `academic-paper-reviewer`, `academic-pipeline` and `deep-research`, installed from `imbad0202/academic-research-skills`. [...]
docs/academic-coverage.md:23:python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
docs/academic-coverage.md:29:python3 utils/check_coverage.py --built <skill> docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
docs/roadmap.md:22:- Goal: [...] with Fable, Astra and Sol as options for the orchestrator and Sol for the agents, [...] `launch.sh`, `pin.sh`, [...]
docs/roadmap.md:136:- [x] 2. Coverage inventory of the academic skills: [...] /Users/axelfaes/workspace/research-hub/.agents/skills [...]
docs/roadmap.md:137:- [x] 2.A. Launch notes for builders run as their own process: an optional `launch_note:` key and `skills/plan-orchestration/templates/launch.sh`, which runs the `claude -p` and `codex exec` recipes [...]
skills/land/SKILL.md:96:- It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`); [...]
skills/land/templates/land.sh:11:# .agents/skills, ~/.agents/skills and $CLAUDE_CONFIG_DIR/skills (default ~/.claude/skills). The
skills/land/templates/land.sh:141:        "$landing_root/.agents/skills/land/templates" \
skills/land/templates/land.sh:142:        "$HOME/.agents/skills/land/templates" \
skills/land/templates/land.test.sh:11:# .agents/skills when the ledger lacks it, and a verify.sh found nowhere, the places named, or a
skills/land/templates/land.test.sh:492:# .agents/skills. Red when land.sh looks for verify.sh only beside itself.
skills/land/templates/land.test.sh:497:mkdir -p "$test_root/lookup/.agents/skills/land/templates"
skills/land/templates/land.test.sh:498:cp "$script_dir/verify.sh" "$test_root/lookup/.agents/skills/land/templates/verify.sh" ||
skills/land/templates/land.test.sh:505:printf "lookup: verify.sh found in the repository's .agents/skills, exit 0\n"
skills/land/templates/land.test.sh:517:nofind_places="$test_root/nofind-ledger, $test_root/nofind/.agents/skills/land/templates"
skills/land/templates/land.test.sh:518:nofind_places="$nofind_places, $scratch_home/.agents/skills/land/templates"
skills/ordo-init/SKILL.md:31:4. The repository: `git ls-files`, the CI configuration [...], the documentation folders, `README.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, and `.gitignore`.
skills/ordo-init/SKILL.md:53:4. Draft `rules`: the page that says how a change is made (a change standard, `CONTRIBUTING.md`, or the rules section of `AGENTS.md` or `CLAUDE.md`).
skills/ordo-init/templates/check_config.test.sh:79:# accepts codex:<model>.
skills/ordo-init/templates/check_config.test.sh:80:make_repo codex-worker
skills/ordo-init/templates/check_config.test.sh:81:sed -i.bak 's/^worker: claude:opus/worker: codex:gpt-5.6-sol/' "$test_root/codex-worker/.agents/plan.yaml"
skills/ordo-init/templates/check_config.test.sh:82:expect_error codex-worker "worker is not claude:<model>: 'codex:gpt-5.6-sol'"
skills/ordo-init/templates/check_config.test.sh:84:# launch_note and worker_allow are not keys of the plan skill's templates/plan.yaml, so either one
skills/ordo-init/templates/check_config.test.sh:86:for key in 'launch_note: ""' 'worker_allow: []'; do
skills/repo-setup/SKILL.md:44:   - The CLI copies them into `.agents/skills/`, links them under `.claude/skills/`, and writes `skills-lock.json`.
skills/repo-setup/SKILL.md:55:    git check-ignore -q --no-index .agents/skills/probe && ! git check-ignore -q --no-index .agents/plan.yaml
skills/repo-setup/SKILL.md:64:    - `.agents/skills/` and `.claude/` are ignored and not committed; `skills-lock.json` is.
skills/repo-setup/templates/CLAUDE.md:30:`skills-lock.json` lists the project skills; `npx skills experimental_install` restores them into `.agents/skills/` with links under `.claude/skills/`. The plan skills are installed per user and are not listed here.
skills/repo-setup/templates/docs/dev/change-standard.md:45:A step's verify list runs through [...] with `<skills>` the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, [...]
skills/repo-setup/templates/sync_rules.test.sh:29:# Red when the check requires another file beside CLAUDE.md, as a symlink AGENTS.md.
skills/spec/templates/brief.md:50:1. The plan's verify list, run through [...] where `<skills>` is the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, [...]
utils/pin.test.sh:39:d2=$HOME/.agents/skills
```

`[...]` marks where I cut a long line in this report. Each line still carries the matched word. The whole output is 37 lines, counted with `wc -l`.

Why each remaining line stays:

| Lines | Reason |
|---|---|
| `docs/academic-coverage.md` 5, 23, 29 | Item 9: these name research-hub's own `.agents/skills` folder, not a place Ordo installs to. |
| `docs/roadmap.md` 22, 136, 137 | Item 9 and decision 3: the roadmap changes only through `/roadmap`, which the orchestrator runs at landing. Line 136 names research-hub's folder. Line 137 is the done line of entry 2.A. |
| `README.md` 151, `skills/land/SKILL.md` 96, `land.sh` 11, 141, 142, `land.test.sh` 11, 492, 497, 498, 505, 517, 518 | Item 9 and decision 2: the `.agents/skills` lookups of `land.sh` and the text that describes and tests them. The skills CLI copies an install into `~/.agents/skills` (README line 58). |
| `skills/repo-setup/templates/docs/dev/change-standard.md` 45, `skills/spec/templates/brief.md` 50 | Decision 2: they give the same lookup order as `land.sh`. Neither file is in this step's path list. |
| `README.md` 50, 58 | Decision 2: the skills CLI's copy. Line 50 names a repository's `.agents/skills` project copy. Line 58 says what `npx skills add ... -a claude-code` does. |
| `README.md` 118 | The `land.test.sh` bullet. It names the repository's `.agents/skills` lookup, as above. |
| `skills/repo-setup/SKILL.md` 44, 55, 64, `skills/repo-setup/templates/CLAUDE.md` 30 | Item 9: the `.agents/skills` lines of `repo-setup`, which are the skills CLI's project copy for Claude Code. |
| `skills/ordo-init/SKILL.md` 53 | Item 9: it reads an existing repository's rules wherever they are. |
| `skills/ordo-init/SKILL.md` 31 | Same reason as line 53. This is the "What it reads" item that step 4 (line 53) draws from. See judgment call 4. |
| `check_config.test.sh` 79 to 86 | These are the cases item 4 requires: a `codex:` worker refused, and `launch_note` and `worker_allow` reported as unknown keys. They have to name those values. |
| `sync_rules.test.sh` 29 | The test comment that names the revert, as change-standard rule 13 requires. |
| `utils/pin.test.sh` 39 | The fixture folder for the new check that the default folders no longer write into `~/.agents/skills`. It is also used as an `ORDO_SKILL_DIRS` folder. |

The brief's second list of words (`launch.sh`, `launch.test.sh`, `allow_list`, `launch-note`, `launch_note`, `worker_allow`, `codex`, `Astra`, `Sol`, `GPT`) now appears only in `docs/roadmap.md` 22 and 137 and in `check_config.test.sh` 79 to 86, all shown in the grep above.

### V3: `python3 skills/ordo-init/templates/check_config.py <scratch repo>`, with `worker: codex:gpt-5.6-sol`

The scratch repository was built in the scratchpad from the plan skill's `templates/plan.yaml`, with its pages present and its worktree root ignored.

```
worker: codex:gpt-5.6-sol                       # required. claude:<model> of the builder.
error: worker is not claude:<model>: 'codex:gpt-5.6-sol'
exit=1
```

### V4: the reverts that turn each new or changed test red

Each revert was made in the worktree, the suite was run, and the file was then restored from a scratchpad copy and checked equal with `cmp`. Each FAIL line below is the first `FAIL:` the suite printed.

1. `check_config.test.sh`, the `codex-worker` case (new). Revert: `MODEL = re.compile(r"^(claude|codex):\S+$")`.
   `FAIL: codex-worker: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`
2. `check_config.test.sh`, the `bad-harness` case (its expected message changed). Revert: the old message, `is not harness:model (claude:<model> or codex:<model>)`.
   `FAIL: bad-harness: missing [error: worker is not claude:<model>: 'opus'] in: error: worker is not harness:model (claude:<model> or codex:<model>): 'opus'`
3. `check_config.test.sh`, the `old-launch_note` case (new). Revert: `launch_note: ""  # optional, default "". ...` added back to the plan skill's `templates/plan.yaml`.
   `FAIL: old-launch_note: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`
4. `check_config.test.sh`, the `old-worker_allow` case (new). Revert: `worker_allow: []  # optional, default []. ...` added back to the same template.
   `FAIL: old-worker_allow: expected an error, got a pass: ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`
5. `land.test.sh`, the worker row (changed). Revert: `land.sh` prints `worker codex:gpt-5.6-sol at high`.
   `FAIL: worker row: missing [clean, worker claude:opus at high, first run: <tokens>, <tool uses> tool uses, <seconds> s (from the runner's result); repair round: <the same, or none>; +2 -0 over 2 files; first report passed its bar: <yes or no>; <N> fixes at landing]`
6. `land.test.sh`, the reviewer row (changed). Revert: `land.sh` prints `reviewer codex:gpt-5.6-sol at high`.
   `FAIL: reviewer row: missing [clean, reviewer claude:opus, read-only: review <tokens> / <tool uses> / <seconds> s (from the runner's result)]`
7. `land.test.sh`, a file that is not a Claude Code session log (new). Revert: `usage.py`'s `if not is_claude_log(path):` replaced by `if False:`.
   `FAIL: usage.py on a file that is not a Claude Code log exited 0, expected 64: `
8. `sync_rules.test.sh`, where `make_repo` no longer creates `AGENTS.md` (changed). Revert: the `AGENTS.md` symlink check added back to `sync_rules.py`.
   `FAIL: python3 -B /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-20/skills/repo-setup/templates/sync_rules.py /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/sync-rules-test.n77ckL/same: exit 2, expected 0: [] [error: AGENTS.md is not a symlink to CLAUDE.md]`
9. `pin.test.sh`, the default folders (the new negative assertion). Revert: `skill_dirs="$HOME/.claude/skills$nl$HOME/.agents/skills"` in `pin.sh`.
   `FAIL: pin.sh wrote into /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pin-test.23HROi/my home/.agents/skills with the default folders`
10. `pin.test.sh`, the refusal cases (a fixture change: `$d2` replaced by `$d1` in the newline form and in the link check). This change adds no new check. It moves the existing check onto a folder that the default pin still creates. Without the change, on the new `pin.sh`, the suite printed `FAIL: a pin refused for the folder "rel/skills" changed a link`, because `$d2/gamma` no longer exists. No revert of `pin.sh` makes this particular check go red on its own: an unrefused pin fails the earlier status check first. So this is an audit of a fixture, not a proof.

The cases removed were the `launch_note` and `worker_allow` cases of `check_config.test.sh`, the Codex rollout case of `land.test.sh` (the refusal loop now runs on `claude.jsonl`), and the `no symlink` case of `sync_rules.test.sh`. Each tested a behaviour this step deletes.

## Files and line counts (`wc -l`)

| File | Lines |
|---|---|
| `skills/plan-orchestration/templates/launch.sh` | deleted (879) |
| `skills/plan-orchestration/templates/launch.test.sh` | deleted (1953) |
| `skills/plan-orchestration/templates/allow_list.py` | deleted (255) |
| `skills/plan-orchestration/templates/allow_list.test.sh` | deleted (337) |
| `skills/plan-orchestration/templates/launch-note.md` | deleted (34) |
| `skills/plan-orchestration/SKILL.md` | 230 |
| `skills/plan/SKILL.md` | 82 |
| `skills/plan/templates/plan.yaml` | 22 |
| `skills/plan/templates/plan.projects.yaml` | 43 |
| `skills/plan/templates/orchestrator-state.md` | 69 |
| `skills/ordo-init/SKILL.md` | 112 |
| `skills/ordo-init/templates/check_config.py` | 106 |
| `skills/ordo-init/templates/check_config.test.sh` | 104 |
| `skills/land/SKILL.md` | 133 |
| `skills/land/templates/usage.py` | 141 |
| `skills/land/templates/land.sh` | 449 |
| `skills/land/templates/land.test.sh` | 732 |
| `skills/repo-setup/SKILL.md` | 148 |
| `skills/repo-setup/templates/sync_rules.py` | 121 |
| `skills/repo-setup/templates/sync_rules.test.sh` | 272 |
| `skills/repo-setup/templates/CLAUDE.md` | 32 |
| `skills/repo-setup/templates/gitignore/common.gitignore` | 17 |
| `utils/pin.sh` | 223 |
| `utils/pin.test.sh` | 439 |
| `README.md` | 176 |
| `docs/dev/building.md` | 34 |
| `docs/dev/change-standard.md` | 65 |
| `.agents/plan.yaml` | 10 |

## Judgment calls

1. **`land.sh`'s usage rows (needs a ruling on `<runs dir>`).** The branch that read `events.jsonl`, `pid.txt` and `exit.txt` from `<runs dir>` parsed Codex's `codex exec --json` events (`turn.completed`, `item.completed`, `reasoning_output_tokens`) and the timestamps of the shell launch's pid and exit files. A builder started with the Agent tool writes neither. Relabelling that branch `claude:` would have put a Claude name on Codex data, so I removed the branch. The rows are now the by-hand rows, naming `claude:opus`, filled in from the runner's result. The ADAPT comment says "the model names of the rows". The `<runs dir>` positional argument is still in the usage line and is still checked to exist, but nothing reads from it any more. Removing it would change `land.sh`'s command line. That is a public signature, and the change standard (rule 4) does not let the builder choose one. Options: (a) remove the argument and its preflight check, and update `land.test.sh`'s five call sites; (b) keep it as it is. I recommend (a), because an argument that feeds nothing is dead under rule 11. (b) is the lazy option.
2. **What counts as a Claude Code log in `usage.py`.** A file is a Claude Code session log when at least one of its lines is an object of `type` `assistant` with a `message` object. The refusal says `usage.py: <path> is not a Claude Code session log: no line is an assistant message` and exits 64. `is_assistant` checks that the line is a JSON object, so a file of JSON arrays is refused instead of raising. The test fixture includes a `[1, 2]` line.
3. **The `perl` requirement in the README.** The brief says the sentence should say `perl` is for the ASCII check. `git grep -l -w perl -- skills utils` also lists `skills/repo-setup/templates/sync_rules.test.sh`. So the requirement reads "`perl`, for the ASCII check of `docs/dev/building.md` and for `sync_rules.test.sh`".
4. **`skills/ordo-init/SKILL.md` line 31 kept.** Item 9 keeps line 53. Line 31 is the "What it reads" input that line 53 uses, and it stays for the same reason.
5. **The example in `.agents/plan.yaml` line 9** reads `# claude:<model> of the builder, for example claude:sonnet.`. Line 10 reads `# claude:<model> /refute runs on.`.
6. **The dispatch block.** The fields that belonged to the shell launch are gone from the state template's comment and from `plan-orchestration`: `prompt`, `output`, `events`, `stderr`, `exit`, `pid`, `session_file`, `allow_file`, `note_id_file`, and the `repair_` and `cases_` entries. `session_id` now holds the builder's agent id, written when the builder is dispatched. The resume after a cases ruling uses Steps 8's "How" and "Before the resume" with `round: 0`.
7. **Renumbering in `/repo-setup`.** Removing the `AGENTS.md` step moved Steps 7 to 13 down by one. The references that follow the numbers were updated: "Steps 8" for `/ordo-init`, "Steps 12" in the Stops row, "The first six rows" in the Stops notes, and `skills/ordo-init/SKILL.md` line 77, which now reads "`repo-setup`'s Steps 12".
8. **`skills/land/SKILL.md` beyond line 102.** Steps 1 had bullets on stopping a shell builder (TERM and KILL at its pid, the exit file, zombies). The Stops row "Agents still running" named a shell builder's pid and exit file. Steps 9 said "where each harness keeps the log". Each of these described the removed route and was changed.
9. **`plan-orchestration` section heading.** "The two tiers, and the harnesses" is now "The two tiers, and the models". The Rules bullet that names it follows. A bullet "**Runner.** Both tiers run under Claude Code." replaces the Harnesses bullet.
10. **Not changed:** each skill's `metadata.version`, and the `worker_effort` comment "a worker whose harness takes one". The brief asks for neither.

## Host- and user-visible changes, before and after

| Surface | Before | After |
|---|---|---|
| `plan.yaml` keys | `launch_note`, `worker_allow` optional | Neither exists, and `check_config.py` reports either one as `unknown key` |
| `worker` / `reviewer` values | `claude:<model>` or `codex:<model>` | `claude:<model>` only; any other value gives `error: worker is not claude:<model>: '<value>'` |
| `usage.py <file> ...` | Read a Claude Code log or a Codex rollout | Reads a Claude Code log; any other file exits 64 with `usage.py: <path> is not a Claude Code session log: no line is an assistant message` |
| `land.sh` usage rows | `worker codex:gpt-5.6-sol at high, first run: <numbers from events.jsonl>` when a runs dir held event files | Always `worker claude:opus at high, first run: <tokens>, <tool uses> tool uses, <seconds> s (from the runner's result); repair round: <the same, or none>` and `reviewer claude:opus, read-only: review <tokens> / <tool uses> / <seconds> s (from the runner's result)` |
| `utils/pin.sh` default folders | `~/.claude/skills`, `~/.agents/skills`, and `$CLAUDE_CONFIG_DIR/skills` when set | `~/.claude/skills`, and `$CLAUDE_CONFIG_DIR/skills` when set; `$ORDO_SKILL_DIRS` still replaces the list |
| `sync_rules.py` | Exit 2 on `error: AGENTS.md is not a symlink to CLAUDE.md` | No `AGENTS.md` check |
| `/repo-setup` | Created `AGENTS.md -> CLAUDE.md`, installed with `-a claude-code -a codex`, ignored `.codex/` | No `AGENTS.md`, installs with `-a claude-code`, no `.codex/` line |
| README install | `-a claude-code -a codex`; the copy loop over `~/.claude/skills ~/.agents/skills` | `-a claude-code`; the copy loop over `~/.claude/skills` |
| Verify lists (`building.md`, `change-standard.md`, README Tests) | Included `launch.test.sh` and `allow_list.test.sh` | Neither is listed |

## What in the brief was wrong or could not be done inside the path list

1. **`skills/spec/SKILL.md` line 125 is not in the path list.** Its Anti-patterns row says "what differs per harness is in `plan-orchestration`'s launch recipes". After this step, `plan-orchestration` has one recipe under "Launching a builder". Evidence: `git grep -n -i harness -- skills/spec/SKILL.md` prints `skills/spec/SKILL.md:125:| A harness or a vendor named in the brief | The brief then works for one harness only; what differs per harness is in \`plan-orchestration\`'s launch recipes | Leave it out |`. That line is not changed. It needs to be fixed at landing, or by the step that holds `skills/spec/`.
2. **The brief's premise on `land.sh`.** The brief says the rows at lines 503 and 515 "name `codex:gpt-5.6-sol`". The whole branch around those rows read Codex's event log. Judgment call 1 gives what was done and the open point on `<runs dir>`.
3. **The ASCII check on an uncommitted deletion.** The `Can't open` warnings quoted under V1 come from running the verify list before the deletion is committed. They will stop once the deletion is committed on main. That last point is not verified, since committing is the orchestrator's job.
4. **Git commands.** The dispatch prompt says to run no git command. The brief's own checks are read-only git commands: the grep in "What is on the tree" (`git grep`) and the verify list's ASCII check (`git ls-files`). Those are the only git commands I ran in the worktree. The tests and the V3 scratch repository run `git` only on scratch repositories under `$TMPDIR` and the scratchpad.
