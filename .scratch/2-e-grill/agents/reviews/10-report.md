Everything in the brief is done. Two facts to know: (1) the ASCII command of the verify list prints `Can't open skills/plan-help/SKILL.md: No such file or directory` on stderr, because `git ls-files -coz` still lists the tracked old path, which the landing removes when it stages the move; the runner still prints `checks: 8 commands passed` and `rc=0`. (2) The step adds and changes no test; item 4 of "Verify before you report" does not apply.

# Step 10 report: `plan-help` renamed `ordo-help`

Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2e-10`, base `a34afd2` (`git rev-parse --short HEAD`).

## Open items of the state file (verbatim, from `.scratch/2-e-grill/orchestrator-state.md`)

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", run before step 12, and its text in those four skills. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## The cases' first run, on the unchanged tree, before any change

- `git grep --untracked -n -i "plan-help" -- . ':!.scratch'`: 33 lines (`wc -l` printed 33) in 12 files (`cut -d: -f1 | sort -u | wc -l` printed 12). As the brief expects.
- `git grep --untracked -n -i "plan help" -- . ':!.scratch'`: two lines, `skills/plan-help/SKILL.md:3` (the description) and `skills/plan-help/SKILL.md:8:# Plan help`. As the brief expects.
- `ls skills/ordo-help/SKILL.md`: `No such file or directory`; `ls skills/plan-help`: `SKILL.md`. As expected before the change.
- `git grep --untracked -n "ordo-help" -- . ':!.scratch'`: nothing, rc=1. As the brief expects.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.
- The description length command: `386 skills/plan-help/SKILL.md` (the other lengths: land 726, ordo-init 632, plan-orchestration 788, plan-retro 616, plan 477, refute 951, repo-setup 776, roadmap 997, spec 1022).
- The "No other change" case and the pin run compare the tree after the change; the pin run's first half, `pin.sh old`, is run inside the block below, as the block orders it.
- No case is wrong under the brief's rules on the unchanged tree.

## Cases after the change

Command 1, `git grep --untracked -n -i "plan-help" -- . ':!.scratch'; echo rc=$?`:

```
rc=1
```

Command 2, `git grep --untracked -n -i "plan help" -- . ':!.scratch'; echo rc=$?`:

```
rc=1
```

Command 3, `ls skills/ordo-help/SKILL.md; ls skills/plan-help; echo rc=$?`:

```
skills/ordo-help/SKILL.md
ls: skills/plan-help: No such file or directory
rc=1
```

Command 4, `git grep --untracked -n "ordo-help" -- . ':!.scratch' > $TMPDIR/after-hits.txt; wc -l < ...; cut -d: -f1 ... | sort -u`: 33 lines, in these 12 files:

```
      33
.agents/plan.yaml
docs/academic-coverage.md
docs/glossary.md
README.md
skills/land/SKILL.md
skills/ordo-help/SKILL.md
skills/ordo-init/SKILL.md
skills/plan-orchestration/SKILL.md
skills/plan/SKILL.md
skills/repo-setup/templates/plan-terms.md
skills/roadmap/SKILL.md
skills/spec/SKILL.md
```

Same place as before: `diff <(sed 's/^skills\/plan-help\//skills\/ordo-help\//' $TMPDIR/before-hits.txt | cut -d: -f1,2 | sort) <(cut -d: -f1,2 $TMPDIR/after-hits.txt | sort) && echo same-file-line-multiset` printed `same-file-line-multiset`. `$TMPDIR/before-hits.txt` is the output of the first-run `git grep --untracked -n -i "plan-help" -- . ':!.scratch'` saved before the change; the comparison computes only that each old hit's file and line has a new hit, so the skill's move is the one path difference.

Command 5, `git show HEAD:skills/plan-help/SKILL.md | diff - <(sed -e 's/ordo-help/plan-help/g' -e 's/^# Ordo help$/# Plan help/' -e 's/ordo help/plan help/' skills/ordo-help/SKILL.md); echo rc=$?`:

```
rc=0
```

Command 6, `git diff -U0 -- . ':!skills/plan-help'` over the other changed files: shown whole under "Changed lines" below. Read against the brief: every line's sole change is `plan-help` to `ordo-help`, except `README.md:84` (the list of item 2), `README.md:65` and `:93` (the sentences of items 3 and 4); and the glossary lines, written by the sync.

Command 7, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`. The glossary was written by `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, which printed `written: the plan-terms block now equals the template`.

Command 8, the description length command of `docs/dev/skill-layout.md`: `386 skills/ordo-help/SKILL.md` (the other nine skills print the same lengths as on the unchanged tree). The limit is 1024.

The pin run, from the worktree root, the brief's block (it prints the run folder first, `run=...`, which the block does not; `$run` is `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG`). Output verbatim:

```
run=/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG
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
pinned: old (a34afd2), 10 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/skills
pinned: 5 agents linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/agents
rc=0
total 0
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 land -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/land
lrwxr-xr-x@ 1 axelfaes  staff  117 Sep 30 02:28 ordo-init -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/ordo-init
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 plan -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan
lrwxr-xr-x@ 1 axelfaes  staff  117 Sep 30 02:28 plan-help -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan-help
lrwxr-xr-x@ 1 axelfaes  staff  126 Sep 30 02:28 plan-orchestration -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan-orchestration
lrwxr-xr-x@ 1 axelfaes  staff  118 Sep 30 02:28 plan-retro -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan-retro
lrwxr-xr-x@ 1 axelfaes  staff  114 Sep 30 02:28 refute -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/refute
lrwxr-xr-x@ 1 axelfaes  staff  118 Sep 30 02:28 repo-setup -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/repo-setup
lrwxr-xr-x@ 1 axelfaes  staff  115 Sep 30 02:28 roadmap -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/roadmap
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 spec -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/spec
pin: removed /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/skills/plan-help, which the tag new does not hold
pinned: new (8fdab5c), 10 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/skills
pinned: 5 agents linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/agents
rc=0
total 0
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 land -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/land
lrwxr-xr-x@ 1 axelfaes  staff  117 Sep 30 02:28 ordo-help -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/ordo-help
lrwxr-xr-x@ 1 axelfaes  staff  117 Sep 30 02:28 ordo-init -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/ordo-init
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 plan -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan
lrwxr-xr-x@ 1 axelfaes  staff  126 Sep 30 02:28 plan-orchestration -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan-orchestration
lrwxr-xr-x@ 1 axelfaes  staff  118 Sep 30 02:28 plan-retro -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/plan-retro
lrwxr-xr-x@ 1 axelfaes  staff  114 Sep 30 02:28 refute -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/refute
lrwxr-xr-x@ 1 axelfaes  staff  118 Sep 30 02:28 repo-setup -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/repo-setup
lrwxr-xr-x@ 1 axelfaes  staff  115 Sep 30 02:28 roadmap -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/roadmap
lrwxr-xr-x@ 1 axelfaes  staff  112 Sep 30 02:28 spec -> /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.local/share/ordo-stable/skills/spec
pinned: new, 10 skills linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/skills
pinned: 5 agents linked in: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/pinrun.Po6EQG/home/.claude/agents
rc=0
```

Read against the brief's expectation: the `rev-parse` line prints `a34afd2`, the worktree's base; after `pin.sh old`, rc=0 and a `plan-help` link with no `ordo-help`; `ls-tree` of tag `new` lists `skills/ordo-help` and no `skills/plan-help`; after `pin.sh new`, rc=0, an `ordo-help` link into the pinned worktree, no `plan-help` entry, and the line `pin: removed <run>/home/.claude/skills/plan-help, which the tag new does not hold`; the check-mode run prints rc=0. Every `pin.sh` ran from `$run/ordo` with the three variables; the scratch clone's own `git clone`, `git add`, `git commit` and `git tag` are the only state-changing git commands run, all inside `$run`. Nothing was written outside the worktree and `$TMPDIR`; the folder `$run` stays under `$TMPDIR`.

Reading case 1: `skills/ordo-help/SKILL.md` against `docs/dev/skill-layout.md`. Read: `name: ordo-help` equals the folder's name; the description is one paragraph beginning "Print the command sequence" and ending `Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work.` at 386 characters; the description names no neighbouring skill; the sections are Quick start, Use instead, What it reads, Steps, the reference section, Stops, Anti-patterns and Rules in the order the standard gives, unchanged from the old file (the text comparison above shows only the name changes); the heading `# Ordo help`, the description's triggers `ordo-help, ordo help` and the Quick start's `/ordo-help` lines agree; `metadata.version` reads `"1.8.3"`, as before.

Reading case 2: the two README sentences against the commands. `README.md:65` names `npx skills ls -g` and `npx skills remove --global <skill>`, both quoted in the brief's "What is on the tree" from the skills CLI documentation (github.com/vercel-labs/skills); no network access was used, so the documentation is not re-read here (not verified by me). `README.md:93` names `rm -rf "$dir/<skill>"`, and the loop above it in the same section writes `rm -rf "$dir/$skill"` under `for dir in ...` with `for skill in <list>`, so the command and the variable `$dir` exist in the text (`sed -n 78,92p README.md`).

## DONE / NOT DONE

| Item | Command that proves it | Output |
|---|---|---|
| 1. Folder moved, name, description, heading, `/ordo-help`, nothing else | Command 3 and Command 5 above | `skills/ordo-help/SKILL.md` exists, `skills/plan-help` fails, text comparison prints nothing (rc=0) |
| 2. Every other hit renamed, `README.md:84` alphabetical, glossary by `--write`, plan-terms 50 in place | Commands 1, 4 and 6 above | `rc=1` for `plan-help`; 33 `ordo-help` lines at the old places; `README.md:84` reads `for skill in land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do` |
| 3. `README.md:65` sentence, exactly | `sed -n 65p README.md` | quoted under "Changed lines" |
| 4. `README.md:93` sentence, exactly | `sed -n 93p README.md` | quoted under "Changed lines" |
| Cases | above | as above |
| Verify list, item 1 | the runner, quoted below | `checks: 8 commands passed`, `rc=0` |
| ASCII grep, item 3 | `LC_ALL=C grep -n '[^ -~]'` over the twelve changed files and the report | nothing, `grep-rc=1` |
| Item 4, tests | none added or changed | does not apply |

## The verify list

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"` from the worktree root, output verbatim:

```
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

The `Can't open skills/plan-help/SKILL.md` line is perl's warning for the old path that `git ls-files -coz` still lists as tracked until the landing stages the move; every other file was read, and the runner counts the command as passed.

## Files changed, with line counts (`wc -l` after the change)

```
.agents/plan.yaml       13
README.md      164
docs/academic-coverage.md      235
docs/glossary.md      109
skills/land/SKILL.md      203
skills/ordo-init/SKILL.md      125
skills/ordo-help/SKILL.md       97
skills/plan-orchestration/SKILL.md      329
skills/plan/SKILL.md       96
skills/repo-setup/templates/plan-terms.md       93
skills/roadmap/SKILL.md      161
skills/spec/SKILL.md      283
skills/plan-help/SKILL.md moved to skills/ordo-help/SKILL.md (97 lines, in the list above)
```

The report `.scratch/2-e-grill/agents/reviews/10-report.md` is the only file written in the ledger. No file outside the twelve and the report was changed (`git status --short` below).

## Changed lines, before and after, verbatim

Skill file, `diff <(git show HEAD:skills/plan-help/SKILL.md) skills/ordo-help/SKILL.md` (`<` before, `>` after):

```
2,3c2,3
< name: plan-help
< description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: plan-help, plan help, what do I type next, where is the plan, how does the plan loop work."
---
> name: ordo-help
> description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
8c8
< # Plan help
---
> # Ordo help
10c10
< `/plan-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.
---
> `/ordo-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.
15,16c15,16
< /plan-help            print the sequence
< /plan-help <entry>    print the sequence, then the named plan's position and the command that comes next
---
> /ordo-help            print the sequence
> /ordo-help <entry>    print the sequence, then the named plan's position and the command that comes next
31c31
< 2. For `/plan-help <entry>`, the ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
---
> 2. For `/ordo-help <entry>`, the ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
34c34
< 3. For `/plan-help <entry>`, the folder's state file, and the brief, the report and the refuter report of the step in flight.
---
> 3. For `/ordo-help <entry>`, the folder's state file, and the brief, the report and the refuter report of the step in flight.
39c39
< 2. For `/plan-help <entry>`, print the named plan's position.
---
> 2. For `/ordo-help <entry>`, print the named plan's position.
42c42
< 3. For `/plan-help <entry>`, print one line from that position: the command that comes next, in the sequence.
---
> 3. For `/ordo-help <entry>`, print one line from that position: the command that comes next, in the sequence.
86,87c86,87
< | A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/plan-help` again |
< | No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan <entry>`, or `/plan-help` with an entry that has a plan |
---
> | A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/ordo-help` again |
> | No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan <entry>`, or `/ordo-help` with an entry that has a plan |
```

Every other file, `git diff -U0 -- . ':!skills/plan-help'` (`-` before, `+` after):

```
diff --git a/.agents/plan.yaml b/.agents/plan.yaml
--- a/.agents/plan.yaml
+++ b/.agents/plan.yaml
@@ -1 +1 @@
-# The project specifics the plan skills read (/plan, /spec, /refute, /land, /plan-help, plan-orchestration).
+# The project specifics the plan skills read (/plan, /spec, /refute, /land, /ordo-help, plan-orchestration).
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
@@ -21 +21 @@ Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `road
-| `plan-help` | Prints the command sequence, and for a named plan its position and the command that comes next |
+| `ordo-help` | Prints the command sequence, and for a named plan its position and the command that comes next |
@@ -24 +24 @@ Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `road
-The order of use, shortened from what `/plan-help` prints:
+The order of use, shortened from what `/ordo-help` prints:
@@ -44 +44 @@ for every step:
-`/plan-help` prints the full sequence, including what to do when a command stops.
+`/ordo-help` prints the full sequence, including what to do when a command stops.
@@ -65 +65 @@ npx skills add TheAxeC/ordo --skill '*' -g -a claude-code
-This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`.
+This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`. After an update, `npx skills ls -g` lists the installed skills, and a skill a newer version of Ordo no longer ships is removed with `npx skills remove --global <skill>`.
@@ -84 +84 @@ for dir in ~/.claude/skills; do
-    for skill in land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec; do
+    for skill in land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
@@ -93 +93 @@ done
-The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger.
+The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger. The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed with `rm -rf "$dir/<skill>"` for each folder of the list.
diff --git a/docs/academic-coverage.md b/docs/academic-coverage.md
--- a/docs/academic-coverage.md
+++ b/docs/academic-coverage.md
@@ -172 +172 @@ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/worksp
-| `references/progress_dashboard_template.md` | drop | Asked for status, the pipeline prints a box of stages with integrity and review history. The researcher's state is its roadmap and plan ledger, which `/roadmap` and `plan-help` already show. |
+| `references/progress_dashboard_template.md` | drop | Asked for status, the pipeline prints a box of stages with integrity and review history. The researcher's state is its roadmap and plan ledger, which `/roadmap` and `ordo-help` already show. |
diff --git a/docs/glossary.md b/docs/glossary.md
--- a/docs/glossary.md
+++ b/docs/glossary.md
@@ -46 +46 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated within the round cap. Stated in: `plan-help`, "The sequence, printed verbatim".
+- **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated within the round cap. Stated in: `ordo-help`, "The sequence, printed verbatim".
@@ -55 +55 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **plan skills**: the skills that run plans from `.agents/plan.yaml` (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`), installed once per user and never per project. Stated in: `ordo-init`, the introduction; `repo-setup`, Rules.
+- **plan skills**: the skills that run plans from `.agents/plan.yaml` (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`), installed once per user and never per project. Stated in: `ordo-init`, the introduction; `repo-setup`, Rules.
@@ -78 +78 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **sequence, the**: the command sequence for running a plan by hand that `/plan-help` prints verbatim. Stated in: `plan-help`, "The sequence, printed verbatim".
+- **sequence, the**: the command sequence for running a plan by hand that `/ordo-help` prints verbatim. Stated in: `ordo-help`, "The sequence, printed verbatim".
@@ -83 +83 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **standards**: the pages `.agents/plan.yaml`'s `standards` lists, which every brief tells the builder to read in full and the reviewer holds a diff to. Stated in: `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind". Also the standard pages `/repo-setup` writes into `docs/dev/`: the change standard, the prose standard and, with question 6's defaults, the design principles, the coding-standards pages and, with a user interface, the UI standard. Stated in: `repo-setup`, "The tree"; `plan-help`, "The sequence, printed verbatim".
+- **standards**: the pages `.agents/plan.yaml`'s `standards` lists, which every brief tells the builder to read in full and the reviewer holds a diff to. Stated in: `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind". Also the standard pages `/repo-setup` writes into `docs/dev/`: the change standard, the prose standard and, with question 6's defaults, the design principles, the coding-standards pages and, with a user interface, the UI standard. Stated in: `repo-setup`, "The tree"; `ordo-help`, "The sequence, printed verbatim".
diff --git a/skills/land/SKILL.md b/skills/land/SKILL.md
--- a/skills/land/SKILL.md
+++ b/skills/land/SKILL.md
@@ -24 +24 @@ metadata:
-| Where the plan stands and which command comes next | `/plan-help <entry>` |
+| Where the plan stands and which command comes next | `/ordo-help <entry>` |
diff --git a/skills/ordo-init/SKILL.md b/skills/ordo-init/SKILL.md
--- a/skills/ordo-init/SKILL.md
+++ b/skills/ordo-init/SKILL.md
@@ -10 +10 @@ metadata:
-`/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.
+`/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.
diff --git a/skills/plan-orchestration/SKILL.md b/skills/plan-orchestration/SKILL.md
--- a/skills/plan-orchestration/SKILL.md
+++ b/skills/plan-orchestration/SKILL.md
@@ -24 +24 @@ continue the plan                    resume from the state file, after a compact
-| One step by hand, stopping after each skill | `/spec`, then "build it", `/refute` and `/land`, the sequence `/plan-help` prints |
+| One step by hand, stopping after each skill | `/spec`, then "build it", `/refute` and `/land`, the sequence `/ordo-help` prints |
@@ -26 +26 @@ continue the plan                    resume from the state file, after a compact
-| Where the plan stands and which command comes next | `/plan-help <entry>` |
+| Where the plan stands and which command comes next | `/ordo-help <entry>` |
@@ -40 +40 @@ continue the plan                    resume from the state file, after a compact
-The loop runs over a plan that `/plan` opened. Each step goes through the same skills a person runs by hand (`/spec`, `/refute`, `/land`, with `/plan-help` printing the sequence); this skill adds what running unattended needs: picking the next step, dispatching and resuming a builder, sending a reviewer's findings back, the cadence of the review, two steps in flight, the stops and the reports.
+The loop runs over a plan that `/plan` opened. Each step goes through the same skills a person runs by hand (`/spec`, `/refute`, `/land`, with `/ordo-help` printing the sequence); this skill adds what running unattended needs: picking the next step, dispatching and resuming a builder, sending a reviewer's findings back, the cadence of the review, two steps in flight, the stops and the reports.
diff --git a/skills/plan/SKILL.md b/skills/plan/SKILL.md
--- a/skills/plan/SKILL.md
+++ b/skills/plan/SKILL.md
@@ -26 +26 @@ metadata:
-| Where an open plan stands | `/plan-help <entry>` |
+| Where an open plan stands | `/ordo-help <entry>` |
diff --git a/skills/repo-setup/templates/plan-terms.md b/skills/repo-setup/templates/plan-terms.md
--- a/skills/repo-setup/templates/plan-terms.md
+++ b/skills/repo-setup/templates/plan-terms.md
@@ -41 +41 @@
-- **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated within the round cap. Stated in: `plan-help`, "The sequence, printed verbatim".
+- **loop**: the unattended run of `plan-orchestration` over an open plan's steps, one after another. Stated in: `plan-orchestration`, the introduction and Steps. The loop inside a step is the refutation and the repair round repeated within the round cap. Stated in: `ordo-help`, "The sequence, printed verbatim".
@@ -50 +50 @@
-- **plan skills**: the skills that run plans from `.agents/plan.yaml` (`plan`, `spec`, `refute`, `land`, `plan-help`, `plan-orchestration`), installed once per user and never per project. Stated in: `ordo-init`, the introduction; `repo-setup`, Rules.
+- **plan skills**: the skills that run plans from `.agents/plan.yaml` (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`), installed once per user and never per project. Stated in: `ordo-init`, the introduction; `repo-setup`, Rules.
@@ -73 +73 @@
-- **sequence, the**: the command sequence for running a plan by hand that `/plan-help` prints verbatim. Stated in: `plan-help`, "The sequence, printed verbatim".
+- **sequence, the**: the command sequence for running a plan by hand that `/ordo-help` prints verbatim. Stated in: `ordo-help`, "The sequence, printed verbatim".
@@ -78 +78 @@
-- **standards**: the pages `.agents/plan.yaml`'s `standards` lists, which every brief tells the builder to read in full and the reviewer holds a diff to. Stated in: `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind". Also the standard pages `/repo-setup` writes into `docs/dev/`: the change standard, the prose standard and, with question 6's defaults, the design principles, the coding-standards pages and, with a user interface, the UI standard. Stated in: `repo-setup`, "The tree"; `plan-help`, "The sequence, printed verbatim".
+- **standards**: the pages `.agents/plan.yaml`'s `standards` lists, which every brief tells the builder to read in full and the reviewer holds a diff to. Stated in: `spec`, Steps 4; `refute`, "What it reads" 4; `plan-retro`, "The proposal for a recurring kind". Also the standard pages `/repo-setup` writes into `docs/dev/`: the change standard, the prose standard and, with question 6's defaults, the design principles, the coding-standards pages and, with a user interface, the UI standard. Stated in: `repo-setup`, "The tree"; `ordo-help`, "The sequence, printed verbatim".
diff --git a/skills/roadmap/SKILL.md b/skills/roadmap/SKILL.md
--- a/skills/roadmap/SKILL.md
+++ b/skills/roadmap/SKILL.md
@@ -29 +29 @@ metadata:
-| Where an open plan stands | `/plan-help <entry>` |
+| Where an open plan stands | `/ordo-help <entry>` |
diff --git a/skills/spec/SKILL.md b/skills/spec/SKILL.md
--- a/skills/spec/SKILL.md
+++ b/skills/spec/SKILL.md
@@ -26 +26 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-| Where the plan stands and which command comes next | `/plan-help <entry>` |
+| Where the plan stands and which command comes next | `/ordo-help <entry>` |
```

`git status --short`:

```
 M .agents/plan.yaml
 M README.md
 M docs/academic-coverage.md
 M docs/glossary.md
 M skills/land/SKILL.md
 M skills/ordo-init/SKILL.md
 D skills/plan-help/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-grill/agents/reviews/10-report.md
?? skills/ordo-help/
```

## Judgment calls the brief left open

None. Where a line needed the alphabetical position (`README.md:84`) or the old place in a list (plan-terms 50), the brief dictated it.

## User-visible changes

The skill is invoked as `/ordo-help` in place of `/plan-help`, with the triggers `ordo-help, ordo help` in place of `plan-help, plan help`; every page that names it, the README's skills table, the sequence and the install loop included, names `ordo-help`. The README's two update paragraphs gain the two dictated sentences, quoted above.

## Anything in the brief that was wrong or impossible

- Nothing was wrong. The base the brief names, `983754e`, is the commit main was read at; the worktree's `HEAD` is `a34afd2`, the preparation commit, and the hit counts (33 lines, 12 files) are the same on it.
- The perl line of the verify list prints a stderr warning for the tracked-but-moved `skills/plan-help/SKILL.md` before the landing stages the move; the runner and the pin block do not treat it as a failure. The landing sees a clean run once the move is staged.

## Repair round 1

Change, `README.md:93`, the last sentence, old beside new:

```
old: The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed with `rm -rf "$dir/<skill>"` for each folder of the list.
new: The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed from each folder of the list by hand, such as `rm -rf ~/.claude/skills/<skill>`, and for a second account `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"`.
```

Command, `sed -n 93p README.md`:

```
The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger. The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed from each folder of the list by hand, such as `rm -rf ~/.claude/skills/<skill>`, and for a second account `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"`.
```

Spec 1, `git grep --untracked -n -i -E "plan-help|plan help" -- . ':!.scratch'; echo "rc=$?"`:

```
rc=1
```

No other change, for each changed file other than the skill, `git show HEAD:<f> | sed s/plan-help/ordo-help/g | diff - <f>`; the skill compared as in the first case 5:

```
== .agents/plan.yaml
== README.md
65c65
< This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`.
---
> This copies each skill folder into `~/.agents/skills` and links it from `$CLAUDE_CONFIG_DIR/skills`, or `~/.claude/skills` when that variable is unset. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. Updating is `npx skills update -g`. After an update, `npx skills ls -g` lists the installed skills, and a skill a newer version of Ordo no longer ships is removed with `npx skills remove --global <skill>`.
84c84
<     for skill in land ordo-init plan ordo-help plan-orchestration plan-retro refute repo-setup roadmap spec; do
---
>     for skill in land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
93c93
< The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger.
---
> The loop copies the agents into the `agents` folder beside each skill folder. For a second Claude Code account, add that account's `$CLAUDE_CONFIG_DIR/skills` to the list of folders, and its agents go to `$CLAUDE_CONFIG_DIR/agents`. Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger. The loop replaces only the skill folders it copies: a skill a newer version of Ordo no longer ships is removed from each folder of the list by hand, such as `rm -rf ~/.claude/skills/<skill>`, and for a second account `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"`.
== docs/academic-coverage.md
== docs/glossary.md
== skills/land/SKILL.md
== skills/ordo-init/SKILL.md
== skills/plan-orchestration/SKILL.md
== skills/plan/SKILL.md
== skills/repo-setup/templates/plan-terms.md
== skills/roadmap/SKILL.md
== skills/spec/SKILL.md
== skill
rc=0
```

ASCII, `LC_ALL=C grep -n '[^ -~]' README.md; echo "rc=$?"`:

```
rc=1
```

Verify list, command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"`:

```
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

The `Can't open skills/plan-help/SKILL.md` warning is the tracked-but-moved old path, as in the first run; the runner counts the command as passed.

Reading: the new sentence against the loop above it (`for dir in ~/.claude/skills; do ... rm -rf "$dir/$skill" ...`). `rm -rf ~/.claude/skills/<skill>` removes the folder `<skill>` in the one folder the loop lists, `~/.claude/skills`, and the tilde expands in a new terminal. For a second account the section tells the user to add `$CLAUDE_CONFIG_DIR/skills` to the list, so `rm -rf "$CLAUDE_CONFIG_DIR/skills/<skill>"` removes the folder in that account's skills folder, and `$CLAUDE_CONFIG_DIR` is the variable the section already names for that account, set in the terminal where the user runs it. Neither command uses `$dir`, which exists only inside the loop. Not run against a real folder.
