# Report: step 1, `/writing` and plan 3's edits removed

Everything in the brief is done. Two verification commands do not print exactly what the brief expects while the deletions and the new file are unstaged in the worktree; the section "What in the brief was wrong" gives both, with the evidence.

## Open items of the state file, verbatim

- Open item A (2026-09-28): who runs the verify list at landing, reopened before step 2 is prepared. Question 2 was ruled (a), the session runs each command at `/land` Steps 6. Under (a) nothing records that every command ran, from the repository root, and that each exit status was read right; a session can skip one or read a red line as green. Running a fixed list and reading each exit status has one exact answer, which the rule "scripts compute facts" gives to a script. Options: (a) as ruled, the session runs the list; `land.sh` does only the git work. (b) `land.sh` runs the state file's `verify:` list itself after the cherry-pick: each command through `bash -o pipefail -c` from the repository root, stopping at the first non-zero exit and printing that command and its output; no `PASS:` line reading, no signal handling and no exit-code table, since decision E makes each command fail by its own exit status; `land.test.sh` gains one case, a red command fails the landing and nothing is committed. Recommendation: (b), since it removes the failure mode (a) has and costs about twenty lines. The lazy option is (a): less code now, and the check left to the session's care.

## Cases

`F` is `.scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/briefs/1-v2.0.0`. Every case was run from the worktree root, first on the unchanged tree (at 64cac89, `git status` clean), then after the change. Every first-run result matched the brief.

| Case | First run (unchanged tree) | After |
|---|---|---|
| `test -e skills/writing; echo $?` | `0` | `1` |
| `git diff --no-index $F/skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/templates/docs/dev/prose-standard.md` | `error: Could not access 'skills/repo-setup/templates/docs/dev/prose-standard.md'`, exit 1 | no output, exit 0 |
| `cmp $F/README.md README.md` | `... differ: char 787, line 7`, exit 1 | no output, exit 0 |
| `cmp $F/skills/repo-setup/SKILL.md skills/repo-setup/SKILL.md` | `... differ: char 1521, line 28`, exit 1 | no output, exit 0 |
| `cmp $F/docs/dev/skill-layout.md docs/dev/skill-layout.md` | `... differ: char 173, line 3`, exit 1 | no output, exit 0 |
| `cmp $F/docs/academic-coverage.md docs/academic-coverage.md` | `... differ: char 12871, line 82`, exit 1 | no output, exit 0 |
| `cmp $F/docs/dev/building.md docs/dev/building.md` | `... differ: char 1004, line 12`, exit 1 | no output, exit 0 |
| `sed -n 12p .agents/plan.yaml` | `standards: [docs/dev/skill-layout.md, skills/writing/references/prose-standard.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.` | `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.` |
| `grep -c check_prose docs/dev/change-standard.md` | `1` | `0` (exit 1) |
| `git grep -n -e check_prose -e skills/writing/ -e '`/writing' -- ':!.scratch' ':!docs/roadmap.md' ':!utils/check_coverage.test.sh'` | the eight lines the brief lists (`.agents/plan.yaml:12`, `README.md:46`, `docs/academic-coverage.md:82`, `:106`, `:107`, `docs/dev/building.md:12`, `docs/dev/change-standard.md:52`, `docs/dev/skill-layout.md:3`) and 12 lines inside `skills/writing/` (`SKILL.md:10`, `:39`, `:92`, `:93`; `references/anti-patterns.md:3`, `:34`; `templates/check_prose.py:4`, `:140`, `:802`; `templates/check_prose.test.sh:2`, `:25`, `:1574`), exit 0 | no output, exit 1 |

Premises also checked before the change, read only:

- `git ls-files skills/writing` listed the seven files the brief names.
- `diff $F/skills/repo-setup/templates/docs/dev/prose-standard.md skills/writing/references/prose-standard.md` printed `20a21` and the one "No history in a rule or a comment" bullet.
- `git show v2.0.0:<path> | cmp - $F/<path>` printed nothing for each of the six copies, so the copy folder is v2.0.0's content.
- `git log --format=%h v2.0.0..HEAD -- <path>` printed `f05fb35 4ce7004` for `README.md`, `4ce7004` for `skills/repo-setup/SKILL.md` and `docs/dev/skill-layout.md`, `f05fb35` for `docs/academic-coverage.md`, `c1c1808` for `docs/dev/building.md`.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. `skills/writing/` deleted whole | DONE | `test -e skills/writing; echo $?` | `1` |
| 2. prose standard recreated with its v2.0.0 content | DONE | `git show v2.0.0:skills/repo-setup/templates/docs/dev/prose-standard.md \| cmp - skills/repo-setup/templates/docs/dev/prose-standard.md; echo "exit $?"` | `exit 0` |
| 3. five files replaced with their v2.0.0 content | DONE | `git diff v2.0.0 -- skills/repo-setup/SKILL.md docs/dev/skill-layout.md README.md docs/academic-coverage.md docs/dev/building.md; echo "exit $?"` | `exit 0` |
| 4. `.agents/plan.yaml` line 12 | DONE | `sed -n 12p .agents/plan.yaml` | `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.` |
| 5. `check_prose` line of `docs/dev/change-standard.md` deleted, rule 10 unchanged | DONE | `grep -c check_prose docs/dev/change-standard.md` and verify item 3 below | `0`; rule 10 is the only change-standard hunk against v2.0.0 |
| Verify 1: the plan's verify list | DONE, exit 0 | `sh ~/.claude/skills/land/templates/verify.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"` | see below |
| Verify 2: `git diff v2.0.0` over the six restored files | DONE for the five tracked files; the prose standard shows as deleted because it is untracked | see below | see below |
| Verify 3: `git diff v2.0.0` over plan.yaml and both change standards | DONE | see below | see below |
| Verify 4: both greps | DONE | see below | no output, exit 1, both |
| Verify 5: each case gives its after result | DONE | the Cases table | as above |

Verify 1, the lines `verify.sh` printed, verbatim:

```
PASS: land.sh and usage.py scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
Can't open skills/writing/SKILL.md: No such file or directory at -e line 1.
Can't open skills/writing/references/academic-prose.md: No such file or directory at -e line 1.
Can't open skills/writing/references/anti-patterns.md: No such file or directory at -e line 1.
Can't open skills/writing/references/judgment.md: No such file or directory at -e line 1.
Can't open skills/writing/references/prose-standard.md: No such file or directory at -e line 1.
Can't open skills/writing/templates/check_prose.py: No such file or directory at -e line 1.
Can't open skills/writing/templates/check_prose.test.sh: No such file or directory at -e line 1.
verify: 7 commands passed
exit 0
```

The seven `Can't open` lines come from the ASCII check: `git ls-files -c` still lists the seven deleted files, since the index is unchanged. `git ls-files -d` prints exactly those seven paths. The same ASCII check over the listed files that exist prints nothing and exits 0:

```
$ git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do [ -e "$f" ] && printf "%s\0" "$f"; done; exit 0' sh | xargs -0 perl -CSD -ne '<the ASCII check>'; echo "exit $?"
exit 0
```

`LC_ALL=C grep -n '[^ -~]'` over the eight changed or added files prints nothing and exits 1. That the `Can't open` lines are gone once the deletions are committed is not verified; it needs a staging command, which this step does not run.

Verify 2:

```
$ git diff v2.0.0 -- skills/repo-setup/templates/docs/dev/prose-standard.md skills/repo-setup/SKILL.md docs/dev/skill-layout.md README.md docs/academic-coverage.md docs/dev/building.md
diff --git a/skills/repo-setup/templates/docs/dev/prose-standard.md b/skills/repo-setup/templates/docs/dev/prose-standard.md
deleted file mode 100644
index 2fd74e1..0000000
--- a/skills/repo-setup/templates/docs/dev/prose-standard.md
+++ /dev/null
@@ -1,75 +0,0 @@
(the 75 lines of the v2.0.0 file, each prefixed with -)
```

`git diff <commit> -- <path>` compares only paths in the index, and `git ls-files -o skills/repo-setup/templates/docs/dev/` prints `skills/repo-setup/templates/docs/dev/prose-standard.md`: the file is untracked, so it shows as deleted. The byte comparison `git show v2.0.0:skills/repo-setup/templates/docs/dev/prose-standard.md | cmp - skills/repo-setup/templates/docs/dev/prose-standard.md` prints nothing and exits 0. The same `git diff v2.0.0` over the other five files alone prints nothing and exits 0.

Verify 3, verbatim apart from the unchanged context lines 7-9 and 11-13 of both change standards, which are shortened here to `...`:

```
diff --git a/.agents/plan.yaml b/.agents/plan.yaml
index d6375e3..b789b33 100644
--- a/.agents/plan.yaml
+++ b/.agents/plan.yaml
@@ -9,3 +9,4 @@ worktree_root: .agents/worktrees          # Where a step's worktree is created;
 worker: claude:opus                       # claude:<model> of the builder, for example claude:sonnet.
 reviewer: claude:opus                     # claude:<model> /refute runs on.
 libraries: avoid                          # check: /spec looks for a library for every capability a step builds before it writes the brief; avoid: no new dependency.
+standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # Files every brief tells the builder to read in full, and the reviewer holds a diff to.
diff --git a/docs/dev/change-standard.md b/docs/dev/change-standard.md
index f673564..bed58ab 100644
--- a/docs/dev/change-standard.md
+++ b/docs/dev/change-standard.md
@@ -19,7 +19,7 @@ How a change is made in this tree, whoever makes it: a session working inline, o
 ...
-10. **No history in code or comments.** A comment says what the code does and why, never when it was written, which step or session wrote it, what bug came before it or what was reverted. No roadmap or step numbers in comments. ASCII only, no em dashes, no double blank lines.
+10. **No history in code or comments.** A comment says what the code does and why, never when it was written, which step or session wrote it, what bug came before it or what was reverted. No roadmap or step numbers in comments. ASCII only and no em dashes. Prose and comments have no double blank lines; Python code keeps two blank lines between top-level definitions, as PEP 8 lays it out.
 ...
diff --git a/skills/repo-setup/templates/docs/dev/change-standard.md b/skills/repo-setup/templates/docs/dev/change-standard.md
index 3ca486d..fa2986a 100644
--- a/skills/repo-setup/templates/docs/dev/change-standard.md
+++ b/skills/repo-setup/templates/docs/dev/change-standard.md
@@ -19,7 +19,7 @@ How a change is made in this tree, whoever makes it: a session working inline, o
 ...
-10. (the same old rule 10 line)
+10. (the same new rule 10 line)
 ...
exit 0
```

Only the added `standards:` line and the rule 10 clause of both change standards differ from v2.0.0.

Verify 4:

```
$ git grep -n -e check_prose -e skills/writing/ -e '`/writing' -- ':!.scratch' ':!docs/roadmap.md' ':!utils/check_coverage.test.sh'; echo "exit $?"
exit 1
$ grep -rn -e check_prose -e 'skills/writing/' -e '`/writing' --exclude-dir=.scratch --exclude-dir=.git --exclude=roadmap.md --exclude=check_coverage.test.sh .; echo "exit $?"
exit 1
```

A wider `grep -rn writing skills utils README.md docs/dev` finds, besides ordinary uses of the word, `utils/check_coverage.test.sh` lines 26, 37, 71, 89, 102, 235, 244, 299, 345, 501-514 and `utils/check_coverage.py` lines 16 and 22. Those are a scratch fixture and a docstring example that name a `writing` skill; the brief leaves `utils/check_coverage.test.sh` to step 4, and `check_coverage.py`'s example names no path of this tree.

## Files

From `git diff --numstat` (added, deleted) and `wc -l` (lines after):

| File | Added / deleted | Lines after |
|---|---|---|
| `.agents/plan.yaml` | 1 / 1 | 12 |
| `README.md` | 3 / 6 | 150 |
| `docs/academic-coverage.md` | 3 / 3 | 241 |
| `docs/dev/building.md` | 0 / 1 | 27 |
| `docs/dev/change-standard.md` | 0 / 1 | 64 |
| `docs/dev/skill-layout.md` | 1 / 1 | 72 |
| `skills/repo-setup/SKILL.md` | 5 / 7 | 154 |
| `skills/repo-setup/templates/docs/dev/prose-standard.md` | new, untracked | 75 |
| `skills/writing/SKILL.md` | 0 / 107 | deleted |
| `skills/writing/references/academic-prose.md` | 0 / 121 | deleted |
| `skills/writing/references/anti-patterns.md` | 0 / 45 | deleted |
| `skills/writing/references/judgment.md` | 0 / 51 | deleted |
| `skills/writing/references/prose-standard.md` | 0 / 76 | deleted |
| `skills/writing/templates/check_prose.py` | 0 / 817 | deleted |
| `skills/writing/templates/check_prose.test.sh` | 0 / 1574 | deleted |
| `.scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/reviews/1-report.md` | this report | |

The six restored files were copied with `cp` from `$F`; the two line edits were made with `sed -i ''` on line 12 of `.agents/plan.yaml` and line 52 of `docs/dev/change-standard.md`.

## Judgment calls

- None. The brief left no point open.

## Sentences about a changed file as a whole, reread

- `docs/dev/change-standard.md`, "Every build, test or check command runs in the foreground ... the ASCII check takes no filter:" still holds; the block now lists six tests and the ASCII check, the same seven as `docs/dev/building.md` lines 6-12.
- `README.md` line 54, "The skills call each other and read each other's templates, so install all of them." The loop on line 70 names `land ordo-init plan plan-help plan-orchestration plan-retro refute repo-setup roadmap spec`, and `ls skills` prints the same ten.
- `skills/repo-setup/SKILL.md` "What it reads" item 1 names "the `docs/` pages"; `find skills/repo-setup/templates/docs -type f` prints `adr/template.md`, `adr/README.md`, `dev/prose-standard.md`, `dev/change-standard.md`. Its tree line 109 `docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md` names a file that exists.
- `docs/dev/skill-layout.md` line 3 names `skills/repo-setup/templates/docs/dev/prose-standard.md`, which exists.

## User-visible changes, before and after

- **README, second paragraph (line 7).** Before: "... and `plan-retro` turns what the reviewers keep finding into rules. `writing` checks a text file's prose and lists each problem with its line." After: the paragraph ends at "... into rules."
- **README, skills table.** Before: a last row "`writing` | Checks a text file against the prose standard and the writing reference pages and lists each problem with its line. It changes nothing". After: the table ends at the `plan-retro` row.
- **README, after the command sequence.** Before: a paragraph "`/writing <file>` is not part of that sequence. It checks a file's prose at any time and lists each problem with its line." After: removed.
- **README, Install.** Before: "The skills call each other and read each other's templates and references, so install all of them." After: "... read each other's templates, so install all of them." The manual install loop loses `writing` from its list.
- **`repo-setup` skill, What it reads.** Before, six items: item 1 listing `docs/dev/change-standard.md`, `docs/adr/README.md`, `docs/adr/template.md` by name; item 3 the `ordo-init` skill; item 4 the `roadmap` skill; item 5 the `writing` skill's `references/prose-standard.md`; item 6 `sync`. After, four items: item 1 says "the `docs/` pages"; item 3 is "The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`."; item 4 is `sync`.
- **`repo-setup` skill, the tree.** Before: `docs/dev/prose-standard.md       the writing skill's references/prose-standard.md`. After: `docs/dev/prose-standard.md       templates/docs/dev/prose-standard.md`.
- **`repo-setup` skill, Rules, first bullet.** Before: "... and from the `ordo-init`, `roadmap` and `writing` skills beside it." After: "... and from the `ordo-init` and `roadmap` skills beside it."
- **The prose standard.** Before: at `skills/writing/references/prose-standard.md`, with the hard rule "**No history in a rule or a comment.** ..." as the last bullet of section 0. After: at `skills/repo-setup/templates/docs/dev/prose-standard.md`, v2.0.0's text, without that bullet.
- **`docs/dev/skill-layout.md` line 3.** Before: "The prose inside follows `skills/writing/references/prose-standard.md`." After: "The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`."
- **`docs/academic-coverage.md` rows of `references/academic_writing_style.md`, `references/writing_judgment_framework.md`, `references/writing_quality_check.md`.** Before: each reason ended with a sentence naming the `skills/writing/` file that holds its content (`references/academic-prose.md`, `references/judgment.md`, `references/anti-patterns.md` and `templates/check_prose.py`). After: those sentences are gone; the rows keep their `rebuild: writing` disposition and the rest of their reasons.
- **`docs/dev/building.md` verify list and `docs/dev/change-standard.md` command block.** Before: each listed the `check_prose.test.sh` command. After: neither does.
- **`.agents/plan.yaml` `standards:`.** Before: the second path was `skills/writing/references/prose-standard.md`. After: `skills/repo-setup/templates/docs/dev/prose-standard.md`.

## What in the brief was wrong

- **Verify 1 expects the ASCII check's empty output.** On the worktree before staging, the check prints the seven `Can't open skills/writing/...` lines quoted above and still exits 0, and `verify.sh` reports `verify: 7 commands passed`. Cause: the ASCII check reads `git ls-files -c`, which lists files in the index, and `git ls-files -d` prints the seven deleted paths. The builder may not run `git rm`. The same check over the listed files that exist prints nothing and exits 0.
- **Verify 2 expects no output.** `git diff v2.0.0 -- <paths>` shows `skills/repo-setup/templates/docs/dev/prose-standard.md` as deleted, because the recreated file is untracked (`git ls-files -o` lists it) and `git diff` against a commit only reads paths in the index. `git show v2.0.0:<that path> | cmp - <that path>` prints nothing and exits 0, so the file is byte for byte v2.0.0's. For the other five files the command prints nothing.
- Both commands are expected to print what the brief says once the step's changes are committed, which is not verified here, since it needs a staging command.
