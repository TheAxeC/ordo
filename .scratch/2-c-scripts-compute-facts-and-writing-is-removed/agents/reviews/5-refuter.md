# Step 5 refuter report (on .agents/worktrees/2c-5, base 659c1eeee929fc8411ce6b0a812fb8cb56510a5d)

Reviewer: claude:opus, a fresh agent; 180529 tokens, 38 tool uses, 484 s (from the completion notice). Saved by the orchestrator from the reviewer's final message.

A page this report cites (the rules file, a standard, a skill's text) is named with its section. Code and command output keep `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md   (worktree root)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '... END { exit($bad ? 1 : 0) }'
checks: 7 commands passed
exit=0
```

The state file still holds the old ASCII command. The new command, from `docs/dev/building.md:12` (byte-identical to `docs/dev/change-standard.md:67` by `cmp`), was run with `bash -o pipefail -c` and the file list given by `printf '%s\0' <path>`, the scratch files outside the worktree:

```
clean worktree (git ls-files ...):                     no output, exit=0
printf 'ok\n\377\376bad\n' (bad.txt), new command:     3 "Malformed UTF-8" lines ending "Malformed UTF-8 character (fatal) at -e line 1, <> line 2.", exit=1
same file, old command (base building.md:12):          same 3 lines, exit=0
control, printf 'a\342\200\224b\n' (dash.sh, not .md): "<path>/dash.sh:1: a<em dash>b", exit=1
control, clean.txt (ASCII only):                        exit=0
control, U+2705 in check.md:                            exit=0;  same in check.txt: line printed, exit=1
lone \200, truncated \303, overlong \300\257:           "(fatal)", exit=1 each
encoded surrogate \355\240\200:                         warning "Unicode surrogate U+D800 is illegal in UTF-8", line printed, exit=1 (no "(fatal)")
a real .pyc (py_compile of sync_rules.py):              "(fatal)", exit=1; old command exit=0
bad.txt then dash.sh in one list:                       dies on bad.txt, dash.sh never read, exit=1
```

Commands the builder's report quotes as evidence, rerun: perl exit 25 on `bad.txt` (reproduced); `checks.sh` over a scratch copy of the state file with the command replaced, `checks: 7 commands passed` (reproduced); `grep -n 'Scripts compute facts'` over the three files, the section at line 11 of both change standards, `shared-rules.md:15`, citations at 27/32/39/41 in each (reproduced); `git grep -n 'has a test beside it'`, `docs/dev/change-standard.md:77` plus ledger hits (reproduced, as the report says); `git check-ignore -v --no-index` on two `__pycache__` paths, `.gitignore:5:__pycache__/` (reproduced); `common.gitignore` line 16 (reproduced); the template change standard's line 60 placeholder (reproduced); `git diff --numstat 659c1ee`, the same 11 rows (reproduced); the ASCII grep over the changed files, nothing (reproduced); the sync test's PASS line (reproduced); the "Doc text" current lines (reproduced); the "other hits" lines reproduced except `skills/plan-orchestration/SKILL.md` "mechanical", which is at 203-204, not 202-203.

`git status --short` in the worktree lists the 11 files the brief names and the report.

## 1. Spec

1. Both change standards, "The rules", rule 15: "Under the same condition, every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one, and every concurrent path in flight, after teardown and superseded by a later one." The brief's item 2 put only "an input form" under the cost condition; ids, keys and concurrent paths were unconditional. The builder extended the condition as a judgment call, where change-standard rules 17 and 19 ask for a stop. Related, from the brief: the untrusted-input sentence ends "and each such place is a case" with no condition, beside a heading and a section that set one.
2. Both change standards, "Where the work happens", the new citing bullet: the exception "and a brief's 'Paths this step writes' keeps its line ranges, numbered as on main at the base" is not in the brief's item 2; rule 19 asks for a stop. It also leaves the brief template's "Doc text" line form uncovered (Standards 3).
3. The brief, "What is on the tree" third bullet and the third case: `git grep -n 'has a test beside it'` cannot print only the rewritten line, since the brief, `plan.md` and three archived files match. A defect of the brief's text; the builder ran it with `-- ':!.scratch'` and said so.

## 2. Proof

1. The report's "Doc text" closing paragraph says `skills/plan-orchestration/SKILL.md` "lines 202-203" use "mechanical"; they are 203-204. No decision rests on it.

## 3. Standards

1. `skills/refute/SKILL.md:10` ("a list of findings each with a file and a line") and `:56` ("each with findings (the file, the line, the quoted hunk, what is wrong)") contradict the paragraph added at `skills/refute/templates/report.md:3`, that a page is cited by its section (change-standard rules 14 and 19).
2. `skills/refute/templates/report.md:14,18,22,40,46`: every finding placeholder is still `<file:line>`; a finding in a page has no placeholder that fits (rule 19).
3. `skills/spec/templates/brief.md:63`, "Report": "Doc text" gives "the current line as `grep -n` prints it", a ledger file citing a page by line number, which the new bullet forbids; its exception covers only "Paths this step writes" (rule 19).
4. `skills/repo-setup/templates/shared-rules.md:5` ("Read the source and cite `file:line`.") beside the new rule that a ledger file cites a page by section; and "A failing check is a finding" (line 14) beside "a wrong hit of a helper script is dropped, not raised as work" (line 15). The report's rule-19 pass names neither pair.
5. `skills/plan-orchestration/SKILL.md:195`, "The recurring-findings pass": one bullet with four requirements, against `docs/dev/skill-layout.md`, "Lists and tables", first bullet.
6. `skills/plan-retro/SKILL.md:83`, "The proposal for a recurring kind", item 4, "The rule is a fact a machine computes.": a rule is not a fact; the prose standard, "E. Sentence shapes".
7. `docs/dev/building.md:25`: "A file that is not valid UTF-8 stops it with perl's `Malformed UTF-8 character (fatal)` error" does not hold for an encoded surrogate, which gets a warning, the line printed and exit 1.
8. The report's "Doc text" items 2 to 4 (README.md:22, :40, plan-help SKILL.md:75) and the `plan-retro` description leave out the proposal of a change to the text that should have prevented the defect.

## 4. Behaviour

1. The report has no section of user-visible changes with before and after (change-standard rule 7). Not stated: `/repo-setup sync` on a repository carrying the current shared-rules block now exits 1 and prints a diff (`grep -l 'ordo:shared-rules begin' ~/workspace/*/CLAUDE.md` found none today); new repositories get the new section and rules; with the new command an untracked `.pyc` not ignored turns the check red (exit 1, old exit 0), and the `__pycache__/` line keeps it green.

## Declined to judge / not checked

- Whether "script" in the template change standard and the shared rules covers application code in a code repository: rule 1 reads "A defect in a script", the section "A test exists only for a script"; in a non-Ordo repository a defect in application code is neither a script nor text as written. The user's call.
- `skills/roadmap/SKILL.md:57` ("Draft the gate: ... a command ..., a test named ..., or an observable result someone can check") does not name a review as a gate; not judged false, since it does not say "only".
- Whether each rewritten rule reads well as a whole: the step's gate is the user's reading of the diff.
- Nothing left for lack of time (`review_minutes: 0`).
