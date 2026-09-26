# Refutation: step 7c

Reviewer: claude:opus, a fresh agent, aeb6c6afaff3c9c42; 99,985 tokens, 25 tool uses, 1,409 s.

## 1. Verification lines, verbatim

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` (exit=0, 3:50 wall):
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
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
verify: 14 commands passed
```
`LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` (2:20 wall): `PASS: launch.sh scratch tests`

Load runs. Each was 16 whole runs of `launch.test.sh` at 16 at once (`xargs -P 16`), started by the scratch script `scratchpad/one.sh`:
- sh: `secs=318`, `pass=16 exit0=16 red=0`, no `FAIL:` line.
- `LAUNCH_SHELL=dash`: `secs=336`, `pass=16 exit0=16 red=0`, no `FAIL:` line.

Reverts. Each revert was applied to a copy under `scratchpad/rev/<r>/`, the whole suite was run on that copy, and the first `FAIL:` line is quoted. Every run exited 1:
- r0 (the guard's `last if zombie($watch);` removed and the refusal put back to `kill -0`): `FAIL: zombie leader: no exit file five seconds after the KILL`
- r1 (only the guard's `last if zombie($watch);` removed): `FAIL: zombie leader: no exit file five seconds after the KILL`
- r2 (`if ! pid_gone "$old_pid"` put back to `if kill -0 "$old_pid" 2>/dev/null`): `FAIL: zombie-relaunch: launch.sh failed`
- r3 (`my $asked = Time::HiRes::time();` changed to `my $asked = 0;`): `FAIL: a normal end: the guard asked ps: -o stat= -p 72850`
- r4 (`not_alive` put back to `! kill -0 "$1" 2>/dev/null`): `FAIL: zombie leader: the session leader is still running five seconds after the KILL`

The brief's premises reproduce on 372401f:
- `wc -l` gives 806 and 1662.
- `grep -n 'kill 0\|getpgrp\|kill -0'` gives lines 388, 399 and 744.
- `not_alive` is at line 301 and `patched` at line 279.
- The texts at SKILL.md 106/183/194/216, land SKILL.md 37-47 and launch-note.md 31 read as the brief says.

File line counts reproduce (`wc -l`): 840, 1796, 34, 299 and 136.

## 2. Findings

### Spec
- `7c-report.md`, "Doc text". The brief asks for the README line "as `grep -n` prints it". The report gives it cut short with "..." (`124:- \`launch.test.sh\` runs \`launch.sh\` under \`sh\`, or the shell \`LAUNCH_SHELL\` names, ...`). The orchestrator cannot apply the replacement from the report alone. The insertion anchor ("It checks the lock: a launch is refused while a killed run's runner or guard lives...") does exist in README.md (`grep -c` gives 1).
- Otherwise none. The mechanisms match the brief:
  - Zombies are found with `ps -o stat=`.
  - `ps` is asked only inside `while (kill 0, $watch)`, at most once a second.
  - The patched intermediate process sleeps 20 seconds, then `POSIX::_exit(0)`, and closes the lock descriptor.
  - The relaunch case asserts `zombie "$leader"` before it relaunches, so the case really runs on a zombie.

### Proof
- `7c-report.md`, "Sentences added, word counts" says "20: The pid is gone when `kill -0 <pid>` fails or `ps -o stat= -p <pid>` shows a state starting with `Z`." `printf '%s' '<that sentence>' | wc -w` prints 21. The report also says "19: the same sentence in `land/SKILL.md:44`", and `wc -w` prints 20. Two counts in the report do not reproduce.
- The report ran 32 runs per shell and my load runs were 16 per shell, so its "32 of 32" counts are not reproduced at that size. My 16 per shell were 0 red.
- No threshold was widened, and no check was made to pass by exempting a case. All five reverts reproduce as reported.

### Standards
- `skills/plan-orchestration/templates/launch.sh`, head comment, lines 44-46: "While kill -0 succeeds, it asks ps once a second, the first time one second after its start. So a normal end starts no ps."
  - The sentence is false for a normal end whose note `end` takes between 1 and 3 seconds. `launch-note.md` line 9 allows a call 3 seconds, and the leader lives through that call.
  - The report's own judgment calls say so ("A leader that lives longer, such as a slow note `end` (up to 3 s), gets one `ps` per second while it lives"). The head comment states the claim without that condition.
  - The test's "normal end" case uses an `end` that returns at once, so it does not show the claim false.
- `launch.sh` head comment line 9, "They also do so while the pid file names a live process". It is followed by "A pid counts as gone when kill -0 fails or ps shows it in a state starting with Z." The refusal is defined by "live" and the new term is "gone", two terms for one concept (prose-standard D, no synonym cycling). SKILL.md line 186 was changed to "a pid that is not gone"; the head comment was not.
- Added sentences over about 20 words: the SKILL.md:195 sentence above is 21 by `wc -w`. It is borderline and nothing else is over.
- none for:
  - Non-ASCII: `LC_ALL=C grep -n '[^ -~]'` over the added lines is empty.
  - Added `.sh` lines over 100 characters: `awk` prints none.
  - History in comments: no step or plan wording. `2.B/9` in the added lines is a test fixture `--label` value.

### Behaviour
- The report's "Host- and user-visible changes" leaves out two things.
- **The guard's `ps` call has no time limit.** In `launch.sh` line 387-393, `sub zombie` runs `open my $ps, "-|", "ps", ...` and blocks on `<$ps>` and `close $ps`, with no time limit.
  - While a `ps` call hangs, the guard's loop checks nothing. That delays the exit file and the release of the lock by however long `ps` takes.
  - The same holds for the launcher's `pid_gone` (lines 560-568, `state=$(ps -o stat= -p "$1" 2>/dev/null)`). It runs whenever the pid file names a pid that `kill -0` reaches, and a slow `ps` delays the launch.
  - Before this change, neither path ran `ps`. I did not measure `ps` latency under load, so this is not verified either way. The 16x load runs stayed green.
- **When `ps` fails or answers nothing, the result is "alive", with no message.**
  - Guard: `zombie()` returns 0 when `open` fails, for example no `ps` on the builder's `PATH`. The guard then waits on `kill 0` alone, which is the old behaviour, and says nothing on stderr.
  - Launcher: `pid_gone` with empty `ps` output returns 1 ("not gone") and refuses with 75.
  - Both fall back to the old behaviour, not to a wrong "gone", so a wrong write is not possible. Neither is stated in the report or in a comment.
  - Pid reuse cannot mislead the guard, because it is in the leader's process group. In the launcher, a reused pid that is itself a zombie counts as gone, which is correct because the leader is gone either way.
- **`ps` resolves through the builder's `PATH`.** The guard runs `ps` from the `PATH` the builder's environment carries, not from a fixed path. The test relies on this to insert its recording `ps`. The report does not state it as host-visible.
- **Nothing else reads a zombie leader as alive.** `grep -rn 'kill -0\|kill 0\|kill(0\|zombie\|ps -o stat\|is gone\|pid.*gone' skills utils docs README.md` gives these hits:
  - `launch.sh:365`: the stop's grace loop over session members. The scanner skips the leader's sid, and the loop is bounded to 1 second.
  - `land.test.sh:290,294` and `verify.test.sh:455,484`: these watch processes that are not session leaders.
  - The land skill's Steps item 1 now carries the zombie rule at line 44.
  - Item 5 of `plan-orchestration/SKILL.md` (lines 195-196) now carries it, and line 106 points to item 5.

## 3. Not checked
- Behaviour on Linux, including under a child subreaper that does not reap, and Linux `ps` output with a leading blank or a `Z+` state. I ran on macOS only.
- The latency of `ps` under load, and a hanging `ps`. The finding above is by reading the code.
- 32-run load counts: I ran 16 per shell.
- The `[:space:]` strip in `pid_gone` and `zombie` under dash on output with leading blanks. On macOS, `ps -o stat=` for a zombie has no leading blank, so the strip was not exercised.

## 4. Usage
- About 30 minutes of wall time. It was mostly the verify runner (3:50), the dash suite (2:20), the five parallel revert suites, and the two load runs (318 s and 336 s).
- About 60k tokens of context.
- Scratch files are under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/` (`rev/`, `load-sh/`, `load-dash/`, `one.sh`, `base-launch.sh`). No file in the repository or ledger was changed.
