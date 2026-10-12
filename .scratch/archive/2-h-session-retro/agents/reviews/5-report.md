Everything in the brief is done.

Open items of 2.H's state file, verbatim (`## Open items`, `.scratch/2-h-session-retro/orchestrator-state.md` lines 43 to 45):

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

none
```

## The first run of every case on the unchanged tree

The tree was at `ca6134d` with `git status --short` printing nothing. The block of "What to build" 1 was run as given, saved as a template outside the repository with `<ledger_root>` = `.scratch`, `<archive_root>` = `.scratch/archive` and `<slug>` substituted by `sed`, and piped to `sh`. The old command is `git log -1 --format='%h %cI' -- .scratch/<slug> .scratch/archive/<slug>`. No case showed a rule of the brief wrong; nothing was handed back.

- Plan 2.C, own correction after the move. Block, `<slug>` = `2-c-scripts-compute-facts-and-writing-is-removed`: `2026-09-29T12:04:41+02:00`. Old command: `ef9f292 2026-10-06T01:10:43+02:00`. The first `python3` line on `2026-09-29T12:04:41+02:00` printed `2026-09-29T12:04:42+02:00`. Met.
- Plan 1, a later plan's commit into its own `plan.md`. Block, `<slug>` = `1-one-layout-for-every-skill`: `2026-09-23T17:11:54+02:00`. Old command: `8becbcd 2026-09-26T04:49:17+02:00`. The first `python3` line on `2026-09-23T17:11:54+02:00` printed `2026-09-23T17:11:55+02:00`. Met.
- Plan 2.E, its closing commit also writes another plan's state file. Block, `<slug>` = `2-e-grill`: `2026-09-30T23:39:21+02:00`. Old command: `deb0d80 2026-10-01T15:47:02+02:00`. Met.
- Plan 2.D, own correction after the move. Block, `<slug>` = `2-d-the-plan-skills-take-the-comparisons-process-changes`: `2026-09-29T17:38:29+02:00`. Old command: `8ea1b6d 2026-09-29T17:38:29+02:00`. The same time. Met.
- Every archived plan, the block over each folder of `.scratch/archive/` (printed, the old command beside it):

  ```
  1-one-layout-for-every-skill  2026-09-23T17:11:54+02:00        old 8becbcd 2026-09-26T04:49:17+02:00
  2-1-scripts-cut-to-their-jobs  2026-10-07T14:52:51+02:00       old 1212148 2026-10-07T14:52:51+02:00
  2-a-launch-notes-for-builders-run-as-their-own-process  2026-09-24T01:23:03+02:00   old 8becbcd 2026-09-26T04:49:17+02:00
  2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found  2026-09-28T12:24:19+02:00     old ef9f292 2026-10-06T01:10:43+02:00
  2-c-scripts-compute-facts-and-writing-is-removed  2026-09-29T12:04:41+02:00         old ef9f292 2026-10-06T01:10:43+02:00
  2-coverage-inventory-of-the-academic-skills  2026-09-23T21:33:36+02:00               old 8becbcd 2026-09-26T04:49:17+02:00
  2-d-the-plan-skills-take-the-comparisons-process-changes  2026-09-29T17:38:29+02:00 old 8ea1b6d 2026-09-29T17:38:29+02:00
  2-e-a-self-rule  2026-10-04T23:58:42+02:00                                           old 7f459fb 2026-10-04T23:58:42+02:00
  2-e-grill  2026-09-30T23:39:21+02:00                                                 old deb0d80 2026-10-01T15:47:02+02:00
  2-f-diagnose  2026-10-12T14:26:50+02:00                                              old 6043818 2026-10-12T14:26:50+02:00
  ```

  The block's ten times equal the "Own last commit" column of the brief's table, and the old command's ten hashes and times equal its "Folder rule" column. Met.
- Plan 2.C's start, `git log --diff-filter=A --format='%h %cI' -- .scratch/2-c-scripts-compute-facts-and-writing-is-removed/plan.md | tail -1`: `ab2cb50 2026-09-28T22:51:46+02:00`, as the brief says.
- Plan 2.H, open: `ls .scratch` lists `2-h-session-retro` directly under `.scratch` (the ledger root) and not under `.scratch/archive`, so the bullet gives the time of the run; the second `python3` line printed `2026-10-12T15:03:54+02:00` at the time of the run. Read in place. Met.
- The texts of items 2 to 5 read in place, and the grep on the unchanged tree, `git grep -n -i -e "touches the folder" -e "touches its folder" -e "its last commit" -- skills docs README.md`, printed hits (exit 0): `docs/glossary.md:134`, `skills/repo-setup/templates/plan-terms.md:129`, `skills/session-retro/SKILL.md:3`, `skills/session-retro/SKILL.md:15`, `skills/session-retro/SKILL.md:52`, `skills/session-retro/templates/sessions.md:5`. That is the brief's list of texts that state the end rule, so the case fails now as the brief expects. `skills/plan/SKILL.md:170` matches only the wider pattern "last commit" and means HEAD.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1 Steps 1, the end bullet and the block | DONE | `awk` copied the block from `skills/session-retro/SKILL.md` (lines 56 to 61, indent removed) and `diff` against the dictated block printed `identical to dictated block`. Run over each folder of `.scratch/archive/`, the ten times printed are those of the table above. The bullet at line 54 gives the end and the open case, the bullet at line 65 defines the plan's own last commit with the reason, the bullet at line 66 says what the block prints. The two `python3` lines follow the block (lines 62 and 63). |
| 2 "What it reads" item 8 | DONE | `grep -n "window" skills/session-retro/SKILL.md` line 39 is item 8. Items 1 to 7 keep their numbers. |
| 3 description and Quick start | DONE | `skills/session-retro/SKILL.md:3` reads "from a plan's opening to its own last commit"; line 15 reads "from the commit that added its plan.md to its own last commit". Length: `python3 -c 'import yaml; ...'` printed `783`. |
| 4 `templates/sessions.md` line 5 | DONE | `sessions.md:5` reads "the commit that added its plan.md and its own last commit, each with its committer time". |
| 5 glossary entry in both files | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. |
| 6 version | DONE | `grep -n 'version: "2.0.0"' skills/session-retro/SKILL.md` printed `5:  version: "2.0.0"`. |
| 7 no other file changes | DONE | `git status --short` printed ` M docs/glossary.md`, ` M skills/repo-setup/templates/plan-terms.md`, ` M skills/session-retro/SKILL.md`, ` M skills/session-retro/templates/sessions.md`. |

Verify before you report:

- Glossary sync: `ok: the plan-terms block equals the template`, exit 0.
- Character-set check over the four changed files, the brief's command: prints nothing, exit 0.
- The block over each folder of `.scratch/archive/`: the ten lines above, equal to the "Own last commit" column.
- Description length: `783`, at most 1024.
- `git grep -n -i -e "touches the folder" -e "touches its folder" -e "its last commit" -- skills docs README.md`: prints nothing, exit 1.
- `grep -n 'version: "2.0.0"' skills/session-retro/SKILL.md`: `5:  version: "2.0.0"`.
- `git status --short`: the four modified paths above and `?? .scratch/2-h-session-retro/agents/reviews/5-report.md`, which is the report, a path of "Paths this step writes". No other path is listed.

The plan's whole verify list is not run here; it runs once at landing.

## The terms

- **window, of the transcripts** (changed): the entry now says the end of a plan's window is one second after its own last commit, defines "a plan's own last commit" as the commit that added its `plan.md` under `archive_root` or a later commit that touches its `plan.md` or `orchestrator-state.md` and no other plan's, and keeps the open-plan end and the session case. Its "Stated in: `session-retro`, Steps 1 and `templates/transcript_window.py`" is checked by `grep -n "own last commit\|window" skills/session-retro/SKILL.md`: Steps 1 holds the term at lines 44, 54, 65, 67 and 68, so the section named states it. The entry reads in the same sense as Steps 1's bullets at lines 54 and 65.
- **plan**, **ledger**: used in the new bullets and item 8 in their glossary senses (the work of one roadmap entry as a ledger folder holding `plan.md`; `orchestrator-state.md` is the state file).
- **state file**: item 8 and the bullets name `orchestrator-state.md` as a file, which is the state file's glossary file name.
- **sessions report**: `templates/sessions.md` line 5 is the "Resolved from" line of a sessions report; its entry says "the window and what it was resolved from", which still holds.
- No new term is added.

## The files with line counts

- `skills/session-retro/SKILL.md`: 206 lines (14 added, 5 removed)
- `skills/session-retro/templates/sessions.md`: 39 lines (1 changed)
- `skills/repo-setup/templates/plan-terms.md`: 133 lines (1 changed)
- `docs/glossary.md`: 150 lines (1 changed)
- `.scratch/2-h-session-retro/agents/reviews/5-report.md`: this report
- `git diff --numstat`: `docs/glossary.md` 1/1, `plan-terms.md` 1/1, `SKILL.md` 14/5, `sessions.md` 1/1

## Judgment calls

1. "What it reads" item 8 carries a sub-bullet, "No commit that added its `plan.md` is a refusal ("Stops")." `docs/dev/skill-layout.md` "Sections, in order" row 4 says an input whose absence is a refusal says so in its item, and the `No such plan` row of Stops already refuses when "no commit added its `plan.md`". It serves item 2 of the brief and adds no refusal.
2. The brief's "the bullet at line 52 says" three points. They are written as three bullets of Steps 1 (the end with the block, the definition with the reason in one clause, and what the block prints) because the layout standard gives one rule per bullet. The block and the two `python3` lines stay in the first bullet's code block, in the order the brief gives.
3. In the glossary entry the archive root is written `archive_root` in code, as the glossary writes `ledger_root` elsewhere, in place of "the archive root".
4. The entry says "and no other plan's" as the brief's item 5 does, with "`plan.md` or `orchestrator-state.md`" left implied from the sentence before it.

## Host- or user-visible changes, before and after

- `/session-retro <entry>` for an archived plan: the end of the window was one second after the latest commit touching the folder under either root; it is one second after the plan's own last commit. The end moves earlier for plans 1, 2, 2.A, 2.B, 2.C and 2.E, and stays the same for 2.1, 2.D, 2.E.A and 2.F.
- `metadata.version` of the skill: `1.0.1` to `2.0.0`.
- Description, Quick start line, report template line and glossary entry: "its last commit" and "the latest commit that touches its folder" to "its own last commit"; the description, the Quick start line and the template line also gain the end of an open plan, the time of the run.

Sentence lengths (item 7 of "Verify before you report"), read against `skills/repo-setup/templates/docs/dev/prose-standard.md` section E (under roughly 20 words unless the mechanism needs more) and `docs/dev/skill-layout.md` "Lists and tables" (one rule per bullet):

- `skills/session-retro/SKILL.md:65` is one sentence of 47 words (`wc -w` on the line): the definition of the own last commit with its two cases and the reason clause the brief asks for in one clause. It stays one bullet because the exception ("no other plan's `plan.md` or `orchestrator-state.md`") is a qualifier of the rule and the layout keeps a qualifier in the bullet of its rule.
- `skills/session-retro/SKILL.md:67` before repair round 1 (`:66` then) was one sentence of 37 words (`wc -w` on the line): it states what the block prints, which the brief asks for in one sentence.
- `skills/session-retro/SKILL.md:39` (item 8) is one sentence of 36 words (`wc -w` on the line, item number included): three commit kinds of one input, which the layout's "one input per item" keeps in one item.
- `skills/session-retro/SKILL.md:54` is one sentence of 29 words (`wc -w` on the line): the end and the open-plan case, as the old bullet had them.
- `docs/glossary.md:134` and `plan-terms.md:129`: the entry's first sentence is 53 words and its second, the definition of the own last commit, 28 words. A glossary entry defines the term and its qualifiers in the entry itself, and the first sentence is the old one with its end reworded.
- `skills/session-retro/templates/sessions.md:5` is a template placeholder line; the change is a shorter phrase.

## Anything in the brief that was wrong or impossible

- Nothing in the brief was wrong or impossible. A needed change outside "Paths this step writes": none.

## Repair round 1

All four items DONE.

- Item 1, Spec 1: DONE. `skills/session-retro/SKILL.md:66` is the new bullet, after the bullet at line 65 that begins "The plan's own last commit is", word for word as the round brief gives it. `grep -n` prints line 56 as `move=`, line 65 as "The plan's own last commit", line 66 as "The six lines from `move=` to `git log -1`" and line 67 as "Among the later commits".
- Item 2, Standards 1: DONE. The bullet that began "The block prints the committer time of the newest commit" is now line 67, "Among the later commits that touch the plan's `plan.md` or `orchestrator-state.md`, the block takes the newest that writes no other plan's `plan.md` or `orchestrator-state.md`. With none, it takes the commit that added the `plan.md` under `<archive_root>/`. It prints the committer time of the commit it takes."
- Item 3, the open-plan end: DONE. Line 3 reads "from a plan's opening to its own last commit, or to the time of the run while the plan is open, from one Claude Code session"; line 15 ends "to its own last commit, or to the time of the run while it is open"; `templates/sessions.md` line 5 reads "...its own last commit, each with its committer time, or the time of the run for an open plan | the session id | ...".
- Item 4, Behaviour 1: DONE. "Host- or user-visible changes" above now reads "The end moves earlier for plans 1, 2, 2.A, 2.B, 2.C and 2.E, and stays the same for 2.1, 2.D, 2.E.A and 2.F."

Checks, from the worktree's root, as printed:

- The six lines from `move=` to `git log -1`, copied from the changed skill with `awk` (`wc -l` printed `6`), substituted with `.scratch`, `.scratch/archive` and `2-c-scripts-compute-facts-and-writing-is-removed` and run as one `sh` call: `2026-09-29T12:04:41+02:00`, exit 0.
- Description length, the `python3 -c 'import yaml; ...'` command: `833`, at most 1024.
- `git grep -n -i -e "touches the folder" -e "touches its folder" -e "its last commit" -- skills docs README.md`: prints nothing, exit 1.
- The character-set check of "Verify before you report" 1 over the four files: prints nothing, exit 0.
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.
- `git diff ca6134d --stat`:

```
 docs/glossary.md                           |  2 +-
 skills/repo-setup/templates/plan-terms.md  |  2 +-
 skills/session-retro/SKILL.md              | 20 +++++++++++++++-----
 skills/session-retro/templates/sessions.md |  2 +-
 4 files changed, 18 insertions(+), 8 deletions(-)
```

- `git status --short`: the four modified paths and `?? .scratch/2-h-session-retro/agents/reviews/5-report.md`.

Sentence lengths read against the prose standard section E (`wc -w` on the line, bullet marker included):

- `SKILL.md:66`, 43 words, two sentences of 32 and 11 words by reading: the first states why the six lines run as one call, the second what runs next. The first sentence carries the mechanism the call needs (the variables passed from line to line), so it stays over 20 words.
- `SKILL.md:67`, 47 words, three sentences of 28, 17 and 10 words by reading: the first names the rule for the case with a later commit, the other two the fallback and the output; the first exceeds 20 words because it names both files and the exclusion.
- `SKILL.md:3` (description) and `SKILL.md:15` (Quick start) each gain a clause; the description stays one sentence of the skill's triggers form and the Quick start line is a command comment. `sessions.md:5` is a template placeholder line that gains a clause.
