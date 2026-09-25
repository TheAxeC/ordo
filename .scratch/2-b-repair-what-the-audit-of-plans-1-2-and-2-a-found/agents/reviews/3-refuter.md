# Step 3 refuter report (on .agents/worktrees/2b-3, base 5eaec19)

## Verification (rerun by the reviewer)

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
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
verify: 12 commands passed
exit=0

$ python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit=$?"
ok: .../inventories/land.md
ok: .../inventories/ordo-init.md
ok: .../inventories/plan-help.md
ok: .../inventories/plan-orchestration.md
ok: .../inventories/plan-retro.md
ok: .../inventories/plan.md
ok: .../inventories/refute.md
ok: .../inventories/repo-setup.md
ok: .../inventories/roadmap.md
ok: .../inventories/spec.md
exit=0

$ git status --short
 M .scratch/archive/1-one-layout-for-every-skill/inventories/{land,ordo-init,plan-help,plan-retro,refute,repo-setup,spec}.md
 M skills/{land,ordo-init,plan-help,plan-retro,refute,repo-setup,roadmap,spec}/SKILL.md
?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/3-report.md
(nothing outside the brief's paths)

$ git diff --numstat 5eaec19     -> identical to the report's table (39/38 land inv ... 5/6 spec)
$ wc -l <8 SKILL.md> <8 inventories>  -> spec 113, refute 129, land 121, plan-help 92, plan-retro 104, roadmap 137, ordo-init 109, repo-setup 145; inventories 71, 86, 75, 49, 63, 80, 77, 78 (matches the report)
$ LC_ALL=C grep -n '[^ -~]' <the 16 files>; echo "exit=$?"   -> no output, exit=1
$ git diff -U0 5eaec19 | grep '^+[^+]' | grep -n ' - \| -- \|->'  -> only list markers and the `git add -- <path>` code span
$ grep -n 'verify.sh' skills/land/SKILL.md skills/refute/SKILL.md skills/spec/SKILL.md -> no output, exit=1
$ grep -rn -- 'step 5.s pass\|its step [0-9]' skills utils docs README.md
skills/plan-orchestration/SKILL.md:206:- `/land` produces it at its step 8 with the land skill's `templates/usage.py ...`
$ grep -rn -- 'Every path is relative' skills utils docs README.md
skills/roadmap/SKILL.md:137, skills/plan/templates/plan.yaml:2, skills/plan/templates/plan.projects.yaml:3, skills/ordo-init/SKILL.md:109, utils/check_skill_layout.test.sh:71, :189
$ grep -rn 'landing: \|cherry-picking' skills docs README.md -> land:42, land:53, spec:63, spec:100, plan-orchestration:104 (plus an unrelated academic-coverage row)
$ grep -rn "booked items\|reviewer line\|has one reviewer\|A scope change\|first three rows" skills docs README.md utils -> no hit
$ git diff -U0 5eaec19 -- skills | grep '^+' | grep -iE 'claude|codex|taskstop|listagents|opus|fable|astra|oculus' -> no vendor or tool name in an added line
```

Inventory sample (read at the new place, 25 rows): land rows 10 (Steps 6), 20 (Steps 2), 21 (Steps 3), 22 x3 (Steps 4), 23 x2 (Steps 5), 24 x5 (Steps 6), 26 x3 (Steps 8), 27 (Steps 10), 28 x3 (Steps 11, Steps 9, Steps 9), 29 (Steps 13), 30 (Steps 14), 31 x3 (Steps 12), 35 (The landing script 1 and 4), 39 x2 (Rules 1, Rules 3), 40 (Rules 4); spec Stops 1 to 7; ordo-init 56 (Rules 4). Each place holds its rule with its qualifiers (for example "never only the last fix", "never by an agent", "never through a shell variable", "the preparation commit stays"). Rules checked against `git show 5eaec19:<path>`: none lost. The land look's placement is kept, because Steps 7 comes after the checks and before the booking. ordo-init keeps ".gitignore included". The spec row "the skill does not guess" is kept. The roadmap inventory needed no change: Steps still has five items and Stops ten rows.

## 1. Spec

1. skills/land/SKILL.md:39-41 (item 7): the check has no outcome.
   - The text reads: "1. Stop the step's builder and every reviewer ... / - Check that the runner's agent listing shows none of them left. / - For a shell builder, check that its pid is gone and its exit file exists."
   - Nothing says what happens when the check fails: an agent still listed, the pid alive, or no exit file.
   - No Stops row covers this case, so a literal run goes on to the wip commit of Steps 3 with an agent still writing. F10 exists to prevent exactly that.
   - The shell builder is also only checked, never stopped. The runner's stop tool does not reach a process that `launch.sh` started.
   - What is needed: the outcome of a failed check (a refusal or a stop, with a Stops row), and how a live shell builder is ended.
2. skills/plan-retro/SKILL.md:97: a change no item asks for.
   - The added row is "| A sharper sentence proposed for a written rule that a command can check | The same words fail the same way | Propose the check, as ... 3 says |".
   - Item 14 asked only for the change to the proposal order. The rule is already stated whole in "The proposal for a recurring kind" 3 and 4.
   - The reason cell is inaccurate: a sharper sentence is new words, not "the same words".
3. skills/repo-setup/SKILL.md:47 and :60, with skills/ordo-init/SKILL.md:75 (item 17): the setup still commits whatever question 5 says.
   - Steps 9 runs `/ordo-init` "with its own draft and approval". ordo-init's Steps 14 then reads "Commit the files written by explicit path list, in one commit", with no condition.
   - So a setup whose question 5 says "commit only when told" still commits `.agents/plan.yaml` and `docs/dev/building.md` at Steps 9.
   - Steps 13's "Commit the setup in one commit" and the opening paragraph's "in one commit when the repository's commit rule allows it" (line 10) are false for the same reason.
   - Both files are inside this step's paths.

## 2. Proof

1. 3-report.md:187: a quoted grep output that the rerun does not reproduce.
   - The report says `grep -rn -- 'Every path is relative' skills utils docs README.md` "printed" the two `skills/plan/templates` lines.
   - The rerun also prints `skills/roadmap/SKILL.md:137`, `skills/ordo-init/SKILL.md:109` and `utils/check_skill_layout.test.sh:71,189`. The roadmap hit is in this step's own paths and the report does not assess it.
   - On reading, roadmap names no `launch_note`, so the roadmap line is not a contradiction. The quoted output is still incomplete.

## 3. Standards

1. skills/plan-help/SKILL.md:69 against skills/land/SKILL.md:108 and skills/plan-orchestration/SKILL.md:78: two skills give a different order.
   - plan-help prints "/land meets a red line ... the booked step comes next". land says "the booked step is worked in queue order", and plan-orchestration continues "with step 2", which picks the next unblocked step.
   - The words come from brief item 13, but the printed sequence now contradicts land.
2. skills/plan-help/SKILL.md:69 and skills/land/SKILL.md:10: both describe every red line as taking the step out of main.
   - plan-help prints "the step is taken back out of main and the failure is booked" for every red line. land's opening paragraph says "After a red line it leaves the step out of main instead".
   - land Steps 6, bullet 2 (line 50), fixes on main a red line that a fix inside the brief closes, and the landing continues. Both lines need "a red line no fix inside the brief closes".
3. Prose standard (skills/repo-setup/templates/docs/dev/prose-standard.md, E "Sentence length", B "Semicolons") and docs/dev/skill-layout.md ("One rule per bullet").
   - skills/spec/SKILL.md:47 is one 42-word sentence that holds three rules, joined by a semicolon: the correction in `plan.md`, the preparation commit, and the brief's record.
   - Other new sentences well over 20 words: skills/ordo-init/SKILL.md:105 (35 words), :108 (35), skills/repo-setup/SKILL.md:60 (33), skills/land/SKILL.md:92 (31).
   - Semicolons were added at spec:47, plan-retro:77 and land:120.
4. skills/refute/SKILL.md:3: an unexplained term.
   - The description says "one round more under the loop's exception". "The loop" is not defined in the description.
   - The layout rule that keeps neighbouring skills out of the description explains why `plan-orchestration` is not named. The phrase still does not tell a reader which exception is meant.

## 4. Behaviour

- none. Every user-visible change I found is stated in the report's "User-visible changes" list or in its judgment calls 3, 4 and 7. That covers `/land` stopping agents first, the look as Steps 7, `landing: backed-out`, finishing forward, the printed plan-help lines, the plain `/roadmap`, the ordo-init exceptions and the repo-setup commit stop.

## Not checked

- The builder's scratch resolver `place.py`: it is not in the worktree and was not rerun. I read the inventory rows by hand instead (the sample is listed above).
- The inventory rows whose place did not move, beyond the 25 sampled and the annotated rows the diff changed.
- Whether `plan-help`'s Steps 3 ("the command that comes next") has a line for a dispatch block at `landing: backed-out`. It was out of this brief.

Reviewer usage: 179,173 tokens, 49 tool uses, 460 s (the runner's completion notification).

## Repair round 1, refuted

```
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
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
verify: 12 commands passed
exit=0

$ python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit=$?"
ok: .../inventories/land.md
ok: .../inventories/ordo-init.md
ok: .../inventories/plan-help.md
ok: .../inventories/plan-orchestration.md
ok: .../inventories/plan-retro.md
ok: .../inventories/plan.md
ok: .../inventories/refute.md
ok: .../inventories/repo-setup.md
ok: .../inventories/roadmap.md
ok: .../inventories/spec.md
exit=0

$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests

$ git status --short
 M .scratch/2-b-.../agents/reviews/3-report.md
 M .scratch/archive/1-one-layout-for-every-skill/inventories/{ordo-init,repo-setup}.md
 M skills/{land,ordo-init,plan-help,plan-retro,refute,repo-setup,spec}/SKILL.md
 M skills/repo-setup/templates/shared-rules.md
 M skills/spec/templates/brief.md

$ git diff --numstat 93a4f39      -> matches the report's table line for line
$ wc -l <the round's files>       -> spec 115, refute 129, land 125, plan-help 92, plan-retro 103, roadmap 137, ordo-init 113, repo-setup 149, shared-rules.md 23, brief.md 40, inventories ordo-init 77, repo-setup 78 (matches the report)
$ grep -rn -- 'Every path is relative' skills utils docs README.md   -> the six lines the report quotes, identical
$ grep -n 'commit rule\|question 5\|No commit allowed' skills/ordo-init/SKILL.md skills/repo-setup/SKILL.md   -> the eight lines the report quotes (76, 98; 10, 48, 63, 82, 90, 125)
$ grep -n '<land Steps 1 pattern>' skills/land/SKILL.md | wc -l   -> 7, the seven lines quoted
$ git diff --name-only 5eaec19 | xargs env LC_ALL=C grep -n '[^ -~]'; echo $?   -> no output, 1
$ git diff -U0 93a4f39 -- skills .scratch/archive | grep '^+[^+]' | grep -n ' - \| -- \|->\|;'   -> list markers only, plus semicolons in the ordo-init Stops cell and the plan-help printed line
$ git diff -U0 93a4f39 -- skills | grep '^+' | grep -iE 'claude|codex|taskstop|listagents|opus|fable|astra|oculus'; echo $?   -> no output, 1
$ ls -la CLAUDE.md AGENTS.md   -> No such file or directory (both)
$ git ls-files | xargs grep -ln 'No question boxes'   -> only skills/repo-setup/templates/shared-rules.md and the step's report
$ python3 skills/repo-setup/templates/sync_rules.py /Users/axelfaes/workspace/{cathedra,research-hub}   -> exit 2 for both (they carry no synced block), so no repository now differs from the changed template because of this round

Real launch.sh with a stand-in builder (a `claude` on PATH that runs `sleep 47`), in the scratchpad:
$ sh skills/plan-orchestration/templates/launch.sh claude --cwd wt --model m --prompt prompt --report report --stderr stderr --exit exit --pid pid; kill -TERM $(cat pid); (3 s later)
pid gone
ls: .../exit: No such file or directory
builder process still running
```

Rules checked against `git show 93a4f39:<path>` and `git show 5eaec19:<path>`: none lost. ordo-init's Rules 1 no longer says the command runs "from its directory" or that "its output [is] shown with it". Both still hold at Steps 3, bullets 2 and 3. The plan-retro row that was removed was the table's last row, and no inventory row names `Anti-patterns 5`.

### Spec

1. `skills/spec/templates/brief.md:40` (ruling 8). The hunk reads: "First line: anything NOT done, or "Everything in the brief is done". Then the position line: ... Then the open items of the state file".
   - Ruling 8 asked for a report that opens with the position line, then the open items. The template still opens with the NOT-done line and puts the position line second.
   - The report's round section (item 8) says the template "opens the report with the position line, then the open items". The text does not do that.
   - The builder kept `docs/dev/change-standard.md` rule 7 ("First line: anything NOT DONE") and did not name the conflict under "The brief against the tree".
   - At landing, the orchestrator decides which order holds and writes that order in both places.

### Proof

1. `3-report.md` still has sections from before the round that the round made false. Change-standard rule 7 requires the report to state the end state only.
   - Judgment call 8 describes the plan-retro Anti-patterns row "was added at the end of the table". That row is gone.
   - Judgment call 3 quotes the old refute description, "one round more under the loop's exception".
   - "Outside this step's paths", bullet 2, still lists `skills/repo-setup/templates/shared-rules.md:19` as out of step. The round fixed that line.
   - "User-visible changes": the `/repo-setup` bullet says a setup that is not allowed to commit stops. It does not say that a setup that is allowed now makes two commits (ordo-init's, then the rest).

### Standards

1. `skills/ordo-init/SKILL.md:10`: "It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit."
   - After Steps 14's new condition, ordo-init makes no commit when the commit rule does not allow one.
   - This is a sentence the diff makes false (refute "Standards"; change-standard rule 14).
   - Ruling 3 carried the same fix into repo-setup's opening paragraph but not into ordo-init's.
2. `skills/ordo-init/SKILL.md:77`: "When `/ordo-init` runs alone, the user is asked at the approval of Steps 11 whether the commit is allowed."
   - The question is asked at Steps 11 but written at Steps 14 (`docs/dev/skill-layout.md`, "Where a rule goes" 1).
   - Steps 10's list of what is shown does not include the question, and neither does the Stops row "The draft" (What it shows: "What Steps 10 lists").
   - "What it reads" has no item for the commit rule that `repo-setup` passes in (skill-layout, section row 4).
   - Line 76 says the rule "`repo-setup`'s question 5 recorded". `repo-setup:48` says the answer is "passed to it", and nothing records it.
3. `skills/ordo-init/SKILL.md:98` against `skills/repo-setup/SKILL.md:125`.
   - The ordo-init row "No commit allowed" is resumed by "The user's commit; under `/repo-setup`, the setup goes on at its Steps 10". Under `/repo-setup`, this stop does not wait on the user.
   - repo-setup's lead sentence says each of its stops "waits on the user". With the default answer to question 5 ("commit only when told"), one setup therefore raises the same decision twice: at ordo-init's Steps 14 through Steps 9, and again at its own Steps 13.
4. `skills/land/SKILL.md:41`: "A shell builder is sent TERM at the pid in its pid file, and KILL after a short grace."
   - "a short grace" is a vague qualifier (prose standard A). The grace needs a number.
   - `utils/verify.sh:21` uses two seconds for the same sequence.
5. `skills/refute/SKILL.md:3`: the rewritten sentence "Run once per step ... and the fix is too large for landing." is 51 words (`wc -w`), against about 20 (prose standard E, sentence length).
6. `skills/plan-help/SKILL.md:69`: the new printed line is 46 words with a semicolon (prose standard E and B, which cover shipped messages).
   - It says "the loop goes on with the next unblocked step" inside the by-hand sequence. There, no loop runs: the next line introduces `/plan-orchestration` as the alternative "instead of the lines above".
   - The words are ruling 5's.

### Behaviour

1. `skills/land/SKILL.md:41-43` and the Stops row at `:107`. With the `launch.sh` on this tree, stopping a shell builder this way does not stop the builder, and the check can never pass.
   - The pid file holds `$!` of `nohup sh launch.sh _body_<harness> ...` (`launch.sh:193-194`), the wrapper shell.
   - TERM ends that shell before `run_body` writes the exit file (`launch.sh:176`). The builder process it started keeps running.
   - The run above shows it: "pid gone", no exit file, "builder process still running".
   - So the check "pid gone" passes while the builder is still writing to the worktree, and "its exit file present" is never true. Every `/land` of a shell-launched step refuses with "Agents still running". That row's resume, "Each one stopped, then `/land` again", cannot clear it.
   - The text is right only once plan step 4 lands: "the pid file names the process that owns the builder" and "a kill still writes the exit file".
   - Step 4's brief needs two more things. TERM to that pid must end the builder's whole process group or session; `launch.sh` today starts no session of its own (no `setsid`). And `launch.test.sh` must run land's Steps 1 sequence (TERM, grace, KILL, then check the pid and the exit file).
   - This is outside step 3's paths, so it cannot be fixed at this landing. It is to be booked against step 4.
2. The round's user-visible changes are not stated with a before and after anywhere in the report (change-standard rule 7):
   - `/ordo-init` run alone now asks at approval whether it may commit. It stops with "No commit allowed" when the answer is no, where before it always committed.
   - A `/repo-setup` that is allowed to commit now makes two commits, where before it made one.
   - `/land` now sends TERM and then KILL to a shell builder's pid.

### Not checked

- Whether `plan-orchestration`'s resumption list (`skills/plan-orchestration/SKILL.md:99-106`) should handle a dispatch block left `landing: not-started` after a refusal at land Steps 1 whose builder was killed. Today that case reads as "A dead builder is reported to the user". That file belongs to steps 2 and 4.
- The `launch.sh` stop was reproduced with a stand-in `claude` that runs `sleep 47`, not with a real builder. The Codex path of `launch.sh` was not run.

Reviewer usage: 143,412 tokens, 35 tool uses, 402 s (the runner's completion notification).
