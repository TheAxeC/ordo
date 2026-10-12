# Step 5 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2h-5, base ca6134d)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

All commands were run from the worktree root.

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ git ls-files -coz --exclude-standard -- skills/session-retro/SKILL.md skills/session-retro/templates/sessions.md skills/repo-setup/templates/plan-terms.md docs/glossary.md | xargs -0 perl -CSD -ne '...brief's character-set check, as given...'
(nothing printed)
exit 0
$ (Verify 2) lines 56-61 of skills/session-retro/SKILL.md, indent removed, placeholders substituted (.scratch, .scratch/archive, <slug>), piped to sh, per folder of .scratch/archive/; old command `git log -1 --format='%h %cI' -- .scratch/<slug> .scratch/archive/<slug>` beside it
1-one-layout-for-every-skill | 2026-09-23T17:11:54+02:00 | old 8becbcd 2026-09-26T04:49:17+02:00
2-1-scripts-cut-to-their-jobs | 2026-10-07T14:52:51+02:00 | old 1212148 2026-10-07T14:52:51+02:00
2-a-launch-notes-for-builders-run-as-their-own-process | 2026-09-24T01:23:03+02:00 | old 8becbcd 2026-09-26T04:49:17+02:00
2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found | 2026-09-28T12:24:19+02:00 | old ef9f292 2026-10-06T01:10:43+02:00
2-c-scripts-compute-facts-and-writing-is-removed | 2026-09-29T12:04:41+02:00 | old ef9f292 2026-10-06T01:10:43+02:00
2-coverage-inventory-of-the-academic-skills | 2026-09-23T21:33:36+02:00 | old 8becbcd 2026-09-26T04:49:17+02:00
2-d-the-plan-skills-take-the-comparisons-process-changes | 2026-09-29T17:38:29+02:00 | old 8ea1b6d 2026-09-29T17:38:29+02:00
2-e-a-self-rule | 2026-10-04T23:58:42+02:00 | old 7f459fb 2026-10-04T23:58:42+02:00
2-e-grill | 2026-09-30T23:39:21+02:00 | old deb0d80 2026-10-01T15:47:02+02:00
2-f-diagnose | 2026-10-12T14:26:50+02:00 | old 6043818 2026-10-12T14:26:50+02:00
$ diff <brief's dictated block, extracted from briefs/5.md, 6 lines> <lines 56-61 of the skill, indent removed> && echo identical
identical
$ python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/session-retro/SKILL.md").read().split("---")[1])["description"]))'
783
$ git grep -n -i -e "touches the folder" -e "touches its folder" -e "its last commit" -- skills docs README.md
(nothing printed)
exit 1
$ grep -n 'version: "2.0.0"' skills/session-retro/SKILL.md
5:  version: "2.0.0"
$ git status --short
 M docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/session-retro/SKILL.md
 M skills/session-retro/templates/sessions.md
?? .scratch/2-h-session-retro/agents/reviews/5-report.md
$ git diff ca6134d --numstat
1 1 docs/glossary.md
1 1 skills/repo-setup/templates/plan-terms.md
14 5 skills/session-retro/SKILL.md
1 1 skills/session-retro/templates/sessions.md
$ wc -l skills/session-retro/SKILL.md skills/session-retro/templates/sessions.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
     206 skills/session-retro/SKILL.md
      39 skills/session-retro/templates/sessions.md
     133 skills/repo-setup/templates/plan-terms.md
     150 docs/glossary.md
$ python3 -c '...+1 second...' '2026-09-29T12:04:41+02:00'
2026-09-29T12:04:42+02:00
$ python3 -c '...+1 second...' '2026-09-23T17:11:54+02:00'
2026-09-23T17:11:55+02:00
$ git log --diff-filter=A --format=%H -- ".scratch/archive/2-e-grill/plan.md" | tail -n 1     (the block's first line, 2.E)
39ac671a37dde5308061764de53adecb4b167e48
$ git log -1 --format=%cI 39ac671a37dde5308061764de53adecb4b167e48                          (the block's last line with $end = the move)
2026-09-30T23:39:21+02:00
$ git log --diff-filter=A --format='%h %cI' -- .scratch/2-c-scripts-compute-facts-and-writing-is-removed/plan.md | tail -1
ab2cb50 2026-09-28T22:51:46+02:00
$ ls -d .scratch/2-h-session-retro .scratch/archive/2-h-session-retro
ls: .scratch/archive/2-h-session-retro: No such file or directory
.scratch/2-h-session-retro
$ (the block with <slug> = no-such-plan, to read its failure when no adding commit exists)
fatal: ambiguous argument '': unknown revision or path not in the working tree.
exit 128
$ for n in 39 54 65 66: sed -n "${n}p" skills/session-retro/SKILL.md | wc -w
39: 36   54: 29   65: 47   66: 37
$ sed -n '43,45p' .scratch/2-h-session-retro/orchestrator-state.md
## Open items (only what the user must rule on: ...)
(blank)
none
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: violated. The bullet and the block are right. The bullet at `SKILL.md:54` gives the end, including the open-plan case. The bullet at `:65` defines the plan's own last commit and gives the reason in one clause. The bullet at `:66` says what the block prints. Lines 56-61 are identical to the dictated block, the two `python3` lines follow it, and the block reproduces all ten "Own last commit" times. The violation is that the fix text's clause "run as one command with `<ledger_root>`, `<archive_root>` and `<slug>` substituted" is not carried into the skill (Spec 1).
- 2: holds. `SKILL.md:39-40` is item 8 and names the three commit kinds. Items 1 to 7 keep their numbers. The references at new lines 49, 137, 181 and 182 (base 47, 128, 172, 173) still point at items 2, 7, 1 and 2, which read as before.
- 3: holds. `SKILL.md:3` and `:15` say "its own last commit". `plan.md` on line 15 has no backticks. The description is 783 characters.
- 4: holds. `templates/sessions.md:5` reads "the commit that added its plan.md and its own last commit, each with its committer time".
- 5: holds. `plan-terms.md:129` and `glossary.md:134` carry the same text. The sync check prints `ok: the plan-terms block equals the template`. The entry states the end, the own-last-commit definition and the open-plan case.
- 6: holds. `5:  version: "2.0.0"`.
- 7: holds. `git status --short` lists only the four paths and the report, and `--numstat` shows four files.

Cases of the brief's "Cases":

- Plan 2.C, archived, own correction after the move: met. The block printed `2026-09-29T12:04:41+02:00`, the `python3` line gave `2026-09-29T12:04:42+02:00`, and the old command printed `ef9f292 2026-10-06T01:10:43+02:00`.
- Plan 1, archived, a later plan's commit into its own `plan.md`: met. The block printed `2026-09-23T17:11:54+02:00`, the end is `2026-09-23T17:11:55+02:00`, and the old command printed `8becbcd 2026-09-26T04:49:17+02:00`.
- Plan 2.E, archived, its closing commit also writes another plan's state file: met. The block printed `2026-09-30T23:39:21+02:00`. The block's first line resolves the move to 39ac671, whose committer time is the same. The old command printed `deb0d80 2026-10-01T15:47:02+02:00`.
- Plan 2.D, archived, own correction after the move: met. The block and the old command both give 8ea1b6d's time, `2026-09-29T17:38:29+02:00`.
- Every archived plan: met. The ten times the block printed equal the "Own last commit" column of the brief's table, row by row.
- Plan 2.H, open: met, by reading. `SKILL.md:54` gives the time of the run "when the folder is still under `<ledger_root>/`", and `.scratch/2-h-session-retro` is under `.scratch`, not `.scratch/archive`.
- The texts of items 2 to 5, read in place, with the grep: met. Each states the end as the plan's own last commit, and the `git grep` prints nothing (exit 1). Whether the description, the Quick start and the template line should also name the open-plan end is listed under "Declined to judge".

## 1. Spec

- `skills/session-retro/SKILL.md:54-66`, Steps 1, the end of a plan's window.
  - The quoted hunk: `move=$(git log --diff-filter=A --format=%H -- "<archive_root>/<slug>/plan.md" | tail -n 1)` / `end=$move` / `for c in $(git log --format=%H "$move.." ...` / `git log -1 --format=%cI "$end"` / `python3 -c '...' '<that time>'`.
  - What is wrong: the brief's item 1 says the block is "run as one command with `<ledger_root>`, `<archive_root>` and `<slug>` substituted". No sentence of the skill says so. The block passes `move`, `end` and `c` from line to line as shell variables. The same fence also holds the two `python3` lines, and the first of them needs `<that time>` substituted from the block's output, so the fence is not one command, unlike the skill's other multi-line fences in Steps 2 and Steps 5. The skill's own Rules say "each Bash call starts a fresh shell and keeps no variable of an earlier call", and plan 2.H's step 2 booking records "shell variables carried across Bash calls" as a finding of that step's review.
  - Failure scenario: an agent running `/session-retro 2.C` splits the fence into separate Bash calls, since it must substitute `<that time>` before the `python3` line, and runs `move=$(...)` in one call and the `for` loop in the next. In the second shell `$move` is empty, `git log --format=%H ".."` lists nothing, `end` is empty, and `git log -1 --format=%cI ""` exits 128 with `fatal: ambiguous argument ''` (reproduced with an empty `move` above). The run then fails before it finds the end.
  - The fix is small enough for landing: one sentence in the bullet at `:66`, for example "Lines 1 to 6 of the block run as one Bash call with the three placeholders substituted, and the first `python3` line runs after it with the time it printed."
  - Verdict: item 1 violated.

## 2. Proof

none

## 3. Standards

- `skills/session-retro/SKILL.md:66`, Steps 1.
  - The quoted hunk: "The block prints the committer time of the newest commit after the commit that added the `plan.md` under `<archive_root>/` that writes no other plan's `plan.md` or `orchestrator-state.md`, or the committer time of the adding commit itself."
  - What is wrong: the relative clause "that writes no other plan's ..." follows "the commit that added the `plan.md` under `<archive_root>/`", the nearest noun phrase. It therefore reads as a condition on the adding commit rather than on "the newest commit". At 37 words the sentence is also above the prose standard's "Sentence length" rule, section E, which allows roughly 20 words unless the mechanism needs more. The brief's dictated wording ("the newest commit after the move that writes no other plan's ...") has the same attachment, and the builder's substitution of the longer phrase for "the move" lengthened it.
  - Failure scenario: a reader checking 2.E's window reads the sentence as "the adding commit must write no other plan's files". 39ac671 writes `.scratch/2-f-diagnose/orchestrator-state.md`, so the reader concludes the block should not end at 39ac671, which contradicts the bullet at `:65` and the block's output. The fix is a reorder at landing: "The block prints the committer time of the newest commit that writes no other plan's `plan.md` or `orchestrator-state.md`, among the commits after the one that added the `plan.md` under `<archive_root>/`, or the committer time of that adding commit."
  - Verdict: none.

## 4. Behaviour

- `.scratch/2-h-session-retro/agents/reviews/5-report.md`, "Host- or user-visible changes, before and after".
  - The quoted hunk: "For plans 1, 2.A, 2.B, 2.C, 2.coverage and 2.E.grill the end moves earlier (table above); for plans 2.1, 2.D, 2.E.A-self-rule and 2.F the end is the same."
  - What is wrong: "2.coverage", "2.E.grill" and "2.E.A-self-rule" are not entries. `head -1` of the archived `plan.md` files prints `# Plan: 2. Coverage inventory ...`, `# Plan: 2.E grill` and `# Plan: 2.E.A self-rule`, so the entries are 2, 2.E and 2.E.A. The brief's Decision 2 lists them correctly as "1, 2, 2.A, 2.B, 2.C and 2.E". The before and after itself is right: the moved and unchanged sets match the block's output above.
  - Failure scenario: the landing booking or a later reader copies this line and types `/session-retro 2.coverage` to see the changed window. No plan title starts with that entry, so the run refuses with "No such plan".
  - Verdict: none.

## Declined to judge

- The hash of the plan's own last commit, for every archived plan except 2.E. The block prints a committer time only, and matching each time to the brief table's hash (a866716, 7d1f90e, 5264a06, 75c987f, 15703ec and so on) needs `git log -1 --format='%h %cI' <hash>` for each hash, a git command this review was not given. The times match. For 2.E the move 39ac671 was resolved by the block's own first line.
- Whether the description (`SKILL.md:3`), the Quick start (`:15`) and `templates/sessions.md:5` should also name the open-plan end, which is the time of the run, not the plan's own last commit. The wording was dictated by the brief and matches the shape of the base text, so it is the orchestrator's call and not a defect of the build.
- The block's behaviour when the folder is under `<archive_root>/` but no commit added its `plan.md` there, which happens only for a moved folder that is not yet committed. It fails loudly with exit 128 (run above) rather than giving a wrong time. Whether item 8's refusal sub-bullet and the Stops row "No such plan" are meant to cover that state is the orchestrator's reading; the sentence is logically correct as written.
- The plan's whole verify list. It runs once, at landing on main, as the rules file's rule 6 says.
- The builder's measured time of the run for 2.H (`2026-10-12T15:03:54+02:00`). It is a measurement on which no decision rests, so it was not reproduced.
- The builder's agent id, served model and usage. These are the orchestrator's records, not this review's.

Reviewer usage: ae6e103a75ddf21f7, claude-opus-5-5, 136654 tokens, 31 tool uses, 4.8 min.
