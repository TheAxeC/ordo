# Step 10 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-10, base a34afd2)

I changed no file in the repository and wrote nothing in the ledger. Two scratch items exist outside the repository. The scratch pin run's folder `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.e4waPD` is still there. I also wrote a one-line temporary file under `$TMPDIR` to test perl's exit status and removed it afterwards.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
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
Can't open skills/plan-help/SKILL.md: No such file or directory at -e line 1.
checks: 8 commands passed
rc=0
```

**The perl line's stderr warning.**
- **Cause.** `git ls-files -co --exclude-standard | grep help` in the worktree printed three paths:
  - `skills/ordo-help/SKILL.md`, listed because it is untracked (the `-o` flag);
  - `skills/plan-help/SKILL.md`, listed because it is still in the index but gone from disk;
  - `.scratch/archive/.../inventories/plan-help.md`, a ledger file that stays.

  perl cannot open the second path, so it warns and moves on.
- **Exit status.** A file perl cannot open does not change it. `perl -ne 'print' /nonexistent/x` exits 0. With a missing file listed first and a file holding a non-ASCII line second, the command still printed the bad line and exited 1. So the warning does not hide a failure, and the new `skills/ordo-help/SKILL.md` is read by the check.
- **On main after the landing.** `land.sh` stages with `git add -A -- . ":(exclude,literal)<ledger_root>"`, at `skills/land/templates/land.sh:377`. That records the deletion and the new folder in the wip commit. After the cherry-pick, main's index no longer holds `skills/plan-help/SKILL.md`, so `git ls-files` does not list it and the warning cannot appear on main. The check on main reads `skills/ordo-help/SKILL.md` as a tracked file. The worktree's `checks: 8 commands passed` therefore carries over to main, and the landing run should print no stderr line.

Cases, rerun:

```
$ git grep -n -i "plan-help" a34afd2 -- . ':!.scratch' | wc -l            # unchanged tree
33
$ git grep -l -i "plan-help" a34afd2 -- . ':!.scratch' | wc -l
12
$ git grep -n "ordo-help" a34afd2 -- . ':!.scratch'; echo rc=$?
rc=1
$ git grep -n -i "plan help" a34afd2 -- . ':!.scratch'
a34afd2:skills/plan-help/SKILL.md:3:description: "... Triggers on: plan-help, plan help, what do I type next, ..."
a34afd2:skills/plan-help/SKILL.md:8:# Plan help
$ git grep --untracked -n -i -E "plan-help|plan help|planhelp|plan_help" -- . ':!.scratch'; echo rc=$?
rc=1
$ git grep --untracked -n -i "ordo-help" -- . ':!.scratch' | wc -l
      33
$ git grep --untracked -l -i "ordo-help" -- . ':!.scratch'
.agents/plan.yaml README.md docs/academic-coverage.md docs/glossary.md skills/land/SKILL.md skills/ordo-help/SKILL.md skills/ordo-init/SKILL.md skills/plan-orchestration/SKILL.md skills/plan/SKILL.md skills/repo-setup/templates/plan-terms.md skills/roadmap/SKILL.md skills/spec/SKILL.md
$ diff <(old hits, file:line, sorted as git prints) <(new hits, file:line)
12d11 / 23a23: skills/ordo-init/SKILL.md:10   (sort order only: the same 33 file:line pairs, with skills/X in place of the folder name)
$ git grep --untracked -n -i "ordo help" -- . ':!.scratch'
skills/ordo-help/SKILL.md:3:description: "... Triggers on: ordo-help, ordo help, ..."
skills/ordo-help/SKILL.md:8:# Ordo help
$ ls skills/ordo-help/SKILL.md; ls skills/plan-help; echo "ls rc=$?"
skills/ordo-help/SKILL.md
ls: skills/plan-help: No such file or directory
ls rc=1
$ git show a34afd2:skills/plan-help/SKILL.md | diff - <(sed -e 's/ordo-help/plan-help/g' -e 's/^# Ordo help$/# Plan help/' -e 's/ordo help/plan help/' skills/ordo-help/SKILL.md); echo "diff rc=$?"
diff rc=0
$ for f in <the 11 other changed files>; do git show a34afd2:$f | sed 's/plan-help/ordo-help/g' | diff - $f; done
only README.md 65c65, 84c84, 93c93 differ; the other ten files print nothing
$ python3 -c '<skill-layout description length command>'
386 skills/ordo-help/SKILL.md   (base: 386 for plan-help; the other nine unchanged; limit 1024)
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary; echo rc=$?
ok: the plan-terms block equals the template
rc=0
$ LC_ALL=C grep -n '[^ -~]' <the 12 changed files>; echo "grep rc=$?"
grep rc=1
$ diff <(ls skills) <(printf '%s\n' land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec); echo rc=$?
rc=0
```

The brief's scratch pin block, run from the worktree root exactly as written, with `echo "run=$run"` added:

```
run=/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.e4waPD
a34afd2
skills/land
skills/ordo-help
skills/ordo-init
skills/plan-orchestration
skills/plan-retro
skills/plan
skills/refute
skills/repo-setup
skills/roadmap
skills/spec
pinned: old (a34afd2), 10 skills linked in: <run>/home/.claude/skills
pinned: 5 agents linked in: <run>/home/.claude/agents
rc=0
(ls -l: land, ordo-init, plan, plan-help, plan-orchestration, plan-retro, refute, repo-setup, roadmap, spec, each -> <run>/home/.local/share/ordo-stable/skills/<name>; no ordo-help)
pin: removed <run>/home/.claude/skills/plan-help, which the tag new does not hold
pinned: new (cbe6255), 10 skills linked in: <run>/home/.claude/skills
pinned: 5 agents linked in: <run>/home/.claude/agents
rc=0
(ls -l: land, ordo-help, ordo-init, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, spec, each -> <run>/home/.local/share/ordo-stable/skills/<name>; no plan-help)
pinned: new, 10 skills linked in: <run>/home/.claude/skills
pinned: 5 agents linked in: <run>/home/.claude/agents
rc=0
```

`<run>` stands for the full path printed on the first line. The builder's run printed the same lines, with its own `$run` and `new` at `8fdab5c`.

The skills CLI documentation, read at github.com/vercel-labs/skills with WebFetch, documents `npx skills ls -g` ("Global only"), `npx skills remove --global <skill>` and `npx skills update -g`. It says nothing on whether `update` removes a skill the source no longer ships, and nothing on whether `remove` deletes both the copy in `~/.agents/skills` and the link in `~/.claude/skills`.

## Verdicts

Items of the brief's "What to build":

- 1: holds. The folder is moved: `ls` finds `skills/ordo-help/SKILL.md`, and `skills/plan-help` is gone. The text comparison with the rename undone prints nothing (diff rc=0), so only the name, the triggers, the heading and `/ordo-help` changed. `version: "1.8.3"` is kept.
- 2: holds. The `plan-help` grep prints nothing. The 33 `ordo-help` lines sit at the old file and line pairs. The per-file `sed` comparison shows no other change outside README 65, 84 and 93. README 84 reads `land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec`, alphabetical and equal to `ls skills`. The glossary equals the template (`ok:` line). The **plan skills** list keeps its order with the new name in the old one's place.
- 3: holds. README:65 carries the sentence exactly as the brief dictates.
- 4: holds. README:93 carries the sentence exactly as the brief dictates. See Standards 1 for a defect in that dictated text.

Cases of the brief's "Cases":

- The `plan-help` grep, which is the step line's check: met. 33 lines in 12 files at the base, nothing after.
- The `plan help` grep: met. Two lines at the base (lines 3 and 8), nothing after.
- `ls skills/ordo-help/SKILL.md` exists and `ls skills/plan-help` fails: met.
- The `ordo-help` grep: met. Nothing at the base; after, 33 lines in the same twelve files, `skills/ordo-help/SKILL.md` in place of the old path, each at the old line number (the only diff is in sort order).
- No other change: met. The skill comparison prints nothing, and only README 65, 84 and 93 differ from a pure name substitution.
- `sync_rules.py --only glossary` prints `ok:`: met.
- The description length: met (386).
- The real `pin.sh` run: met.
  - The `rev-parse` line prints `a34afd2`.
  - After `pin.sh old` the run gives rc=0 and a `plan-help` link, with no `ordo-help`.
  - After `pin.sh new` it gives rc=0 and an `ordo-help` link into the pinned worktree, with no `plan-help`, and prints the `pin: removed .../plan-help, which the tag new does not hold` line.
  - Check mode gives rc=0.
- The reading of `skills/ordo-help/SKILL.md` against `docs/dev/skill-layout.md`: met.
  - `name` equals the folder.
  - The heading "Ordo help", the description triggers and the Quick start's `/ordo-help` agree.
  - The sections are unchanged in order.
- The reading of the two README sentences against the commands: met.
  - README:65 names `npx skills ls -g` and `npx skills remove --global <skill>`, both in the CLI documentation.
  - README:93 names `rm -rf "$dir/<skill>"`, whose form is in the loop above it.

## 1. Spec

- `.scratch/2-e-grill/plan.md`, "Steps, in execution order", step 10's line: "check: `git grep --untracked -n -i plan-help -- . ':!.scratch'` prints nothing ..., and a scratch run of `pin.sh` links `ordo-help`".
  - **What is wrong.** The step line's check, as the plan reads it now, cannot catch the spaced form "plan help". A tree with the folder and `name:` renamed but the heading `# Plan help` and the trigger "plan help" left would pass both halves. The plan's gate answer for step 10 ("No, the grep and `pin.sh` show the new name is the only one in use") overstates what the step line checks. The brief's second case (`plan help`) closes this for the build, and on this tree that case is met.
  - **Failure scenario.** The orchestrator or Axel reruns only the step line's check at 2.E's closing, or after a later step, as proof that the rename holds. A reintroduced `# Plan help` or "plan help" trigger passes unseen.
  - **Fix.** Make the grep `-E "plan-help|plan help"`, which is a one-line change to plan.md at landing.
  - **Verdict.** None; the built tree is not affected.
  - **Other ways around the check.** The step line's check could not otherwise pass without the rename. Deleting the skill fails the pin half. A leftover `plan-help` anywhere outside `.scratch` fails the grep, the untracked moved folder included (`--untracked`). A gitignored copy would be skipped, but none exists: a plain `grep -rIl -i -E "plan-help|plan help" . --exclude-dir=.git --exclude-dir=.scratch` in the worktree printed nothing.

## 2. Proof

none. Every count, path and output the report quotes reproduced:
- the 33 lines and 12 files;
- the diff rc=0 of the skill comparison;
- the 386 description length;
- the `ok:` line;
- the pin block's lines, apart from the run folder and the `new` commit hash;
- the verify list lines, the perl warning included.

The report says it did not read the CLI documentation. I read it, and it holds the two commands.

## 3. Standards

- README.md:93, the brief's dictated sentence: "The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed with `rm -rf "$dir/<skill>"` for each folder of the list."
  - **What is wrong.** `$dir` is the loop variable of the code block above. Outside the loop it is unset in a new shell, or holds only the last folder in the same shell. The prose standard asks for the concrete fact (A, "replaced with the number or the specific claim"). Here the command is only correct once the reader substitutes both placeholders by hand. `~/.claude/skills/<skill>` and, for a second account, `$CLAUDE_CONFIG_DIR/skills/<skill>` would name the folders directly.
  - **Failure scenario.** A user in a new terminal copies `rm -rf "$dir/plan-help"`. It expands to `rm -rf "/plan-help"`, which removes nothing and prints nothing. The stale `~/.claude/skills/plan-help` stays and still triggers on "what do I type next" beside `ordo-help`.
  - **Where to fix.** The text is the brief's (item 4, "exactly"), so the builder followed its brief. The fix is the orchestrator's, at landing.
  - **Verdict.** Item 4 holds as briefed. This is a defect of the dictated text.

## 4. Behaviour

- Other repositories name the old skill: `grep -rIl -i "plan-help"` over the sibling repositories, `.git`, `node_modules` and `.scratch` excluded, found these files.
  - `game-engine/.agents/plan.yaml:1`, `cathedra/.agents/plan.yaml:1` and `research-hub/.agents/plan.yaml:1`: "# The project specifics the plan skills read (/plan, /spec, /refute, /land, /plan-help, plan-orchestration)."
  - `research-hub/CLAUDE.md:33`: "The six plan skills (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`) live in the Ordo repository ..."
  - `research-hub/docs/AGENT-APPROACH.md:110`, plus `tools/figures/gen_figures.py` and `plan-loop.svg`.
  - `officium` and `scotoma` have no hit.
- **What is wrong.** The report's "User-visible changes" names the in-repository before and after only. It does not state that after the next pin, which ruling "Overnight work" 3 holds until 2.E's closing, `/plan-help` stops existing, while these files still name it. A session in research-hub reads CLAUDE.md at start.
- **Scope.** The brief did not cover other repositories. Changing them is "touching another repository", which stops under ruling "Overnight work" 5, and research-hub is read only. So this is not a defect of the build. It is a consequence the orchestrator should raise as an open item. Option (a): step 15, which already edits `game-engine` and `cathedra`'s `.agents/plan.yaml` and leaves the edits for Axel, also changes their line 1, and Axel changes research-hub himself. Option (b): leave them. (b) is the lazy option.
- **Failure scenario.** After the pin, a session in research-hub follows CLAUDE.md's list and types `/plan-help`, and no such skill exists.
- **The real install.** `ls ~/.claude/skills | grep help` prints `plan-help`: the real install still has the old link, as Decision 4 intends. The next real `utils/pin.sh <tag>` removes it, as the scratch run shows.
- **Verdict.** None.

## Declined to judge

- Whether `npx skills update -g` leaves or removes a skill the source no longer ships. The documentation does not say, and settling it needs a run of the CLI on a scratch HOME against a source that dropped a skill, which I did not run.
- Whether `npx skills remove --global <skill>` removes both the copy in `~/.agents/skills` and the link in `~/.claude/skills`, and how it behaves with `CLAUDE_CONFIG_DIR` set for a second account. The same run would settle it. The README:65 sentence claims only that the command removes the skill, and the documentation supports that.
- Whether the triggers should keep "plan-help, plan help" for users who learned the old name. That is Axel's call under ruling H. The brief and the build drop them.
- Whether the old skill's untracked copies in the main checkout matter. The main checkout's `.claude/` is an empty folder (`ls -la` shows only `.` and `..`), so there is nothing to check.

Reviewer usage: tokens and minutes not measured from inside the session; about 30 tool uses.
