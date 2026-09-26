# Step 7c, repair round 1: the rulings

The round starts at the worktree's wip commit named in the dispatch block. The findings are in `agents/reviews/7c-refuter.md`. The brief `agents/briefs/7c.md` holds unchanged; every case and every check of "Verify before you report", the load runs included, is run again after the round. The paths are the brief's.

## Rulings

1. **A time limit on `ps`** (Behaviour, the first item). Each `ps` call the step added is bounded at 2 seconds, as the session scanner's answer is. Past it, the `ps` process is killed, and its answer counts as "not a zombie", as when `ps` cannot run.
   - The guard's `zombie` reads the pipe with a time limit (for example `select` on the pipe's handle), and kills the `ps` it started when the limit passes. The guard ignores TERM, so it must not use an alarm that would end the guard itself.
   - The launcher's `pid_gone` runs `ps` under the same limit. Use perl, which the launch already runs, rather than a new dependency.
   - A case for each: a `ps` on `PATH` that never answers (the test's recording `ps` can be made to sleep). For the guard: the leader ends normally while that `ps` hangs, and the exit file and the guard's end still follow within the brief's five seconds. For the launcher: a pid file naming a live process is still refused with exit 75, within about 2 seconds of the `ps` call. Each red when its limit is removed in a patched copy.
2. **A `ps` that cannot run or answers nothing** (Behaviour, the second item). The guard prints one line to the stderr file the first time `ps` cannot be started, and then waits on `kill 0` alone. The head comment and the runner's comment say what happens when `ps` fails, hangs or answers nothing: the pid counts as not gone. A case for the guard's line, red when the line is removed; or, if no case can reach it, the report calls it an audit.
3. **`ps` through `PATH`** (Behaviour, the third item). The report states it as a host-visible change with before and after, and the runner's comment says the guard runs the `ps` found on the builder's `PATH`.
4. **"So a normal end starts no ps"** (Standards 1). The head comment says what the code does: a leader that ends within a second of the builder starts no `ps`; one that lives longer, such as a note `end` of up to 3 seconds, gets one `ps` a second while it lives.
5. **One term** (Standards 2). `launch.sh`'s head comment line 9 says the launch refuses while the pid file names a pid that is not gone, as `SKILL.md` line 186 does; no text calls the same thing "live" and "not gone".
6. **Sentence length and counts** (Standards 3, Proof 1). The sentence at `SKILL.md:195` and at `land/SKILL.md:44` is split into sentences under about 20 words. The report's word counts are those `printf '%s' '<sentence>' | wc -w` prints.
7. **Doc text** (Spec). The report's "Doc text" quotes the README line as `grep -n` prints it, whole, and its replacement whole, naming every case this step adds.

## Report

Add a section "Repair round 1" to `agents/reviews/7c-report.md` in the worktree's copy of the ledger: each ruling DONE or NOT DONE with the command that proves it, each new or changed case with its revert's first `FAIL:` line of the whole suite quoted, "Verify before you report" rerun and quoted with the load counts (32 runs at 16 at once under `sh` and under `LAUNCH_SHELL=dash`), and the files changed.
