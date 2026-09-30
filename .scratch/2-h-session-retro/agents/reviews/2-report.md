# Report of step 2, the `session-retro` skill

Everything in the brief is done. The step's check is the user's reading of the skill against `docs/dev/skill-layout.md` and the goal, which is pending as the ruling "Overnight work applies to this plan" says.

## Open items of the state file

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

none
```

Command: `sed -n '/^## Open items/,/^## Closed/p' /Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/orchestrator-state.md`.

## First run of the cases on the unchanged tree (HEAD e9714dd)

The cases that name a command of the skill could not run their command, since the skill did not exist. Each case is quoted with what it printed, and the measurements the cases give as facts were run with the reader and the git commands directly.

- File exists: `ls skills/session-retro` printed `templates`; `ls skills/session-retro/SKILL.md skills/session-retro/templates/sessions.md` printed `ls: skills/session-retro/SKILL.md: No such file or directory` and `ls: skills/session-retro/templates/sessions.md: No such file or directory`. Does not hold.
- Items of "What to build" 1 and 2: cannot hold, the files were absent. Does not hold.
- `plan-retro` reads the newest file: `grep -n "newest" skills/plan-retro/SKILL.md` printed `31:3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list. With no previous retro, every run is read.` Does not hold.
- Window facts: `git log --diff-filter=A --format='%h %cI' -- .scratch/2-c-scripts-compute-facts-and-writing-is-removed/plan.md` printed `ab2cb50 2026-09-28T22:51:46+02:00`; the archive path printed `d016bf6 2026-09-29T11:55:34+02:00`; `git log -1 --format='%h %cI' -- <both paths>` printed `75c987f 2026-09-29T12:04:41+02:00`. As the brief states.
- Folder facts: `ls ~/.claude/projects | grep '^-Users-axelfaes-workspace-ordo'` printed `-Users-axelfaes-workspace-ordo`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7a`; `ls` of `6266a558-ed92-43a1-ac08-9bf8f4bc78a8.jsonl` in each printed the file for the first and `No such file or directory` for the two worktree folders.
- Reader over 2.C: the reader with `2026-09-28T22:51:46+02:00` to `2026-09-29T12:04:42+02:00` printed `3738  730556` (`wc -lc`) for `-Users-axelfaes-workspace-ordo` and `0 0` for each worktree folder; the longest line was 2573 characters. The `--session` form printed 38245 lines, 7054879 bytes (the transcript is still being written; the brief measured 7021754).
- Part rule: no skill command existed; the `awk` command below was run first as a draft over the output and printed 15 ranges, none over 50,000 bytes, no gap.
- Report name: `ls .scratch/retros` printed `2026-09-26` and `2026-09-26.md`; no `sessions-*` file exists, so the rule of Steps 5 had nothing to run on the unchanged tree.
- ASCII: `LC_ALL=C grep -n '[^ -~]' skills/session-retro/SKILL.md skills/session-retro/templates/sessions.md skills/plan-retro/SKILL.md` printed `ugrep: warning: skills/session-retro/SKILL.md: No such file or directory` and the same for `sessions.md`, exit 2.
- `git check-ignore .scratch/retros/x.md` printed nothing, exit 1; `git remote -v` printed `origin https://github.com/TheAxeC/ordo.git (fetch)` and `(push)`.

No case is one that the brief's own rules get wrong.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 `skills/session-retro/SKILL.md`, layout, version, description, words | DONE | `grep -n '^#' skills/session-retro/SKILL.md` prints `# Review of Claude Code sessions`, then `## Quick start`, `## Use instead`, `## What it reads`, `## Steps`, `## The reader`, `## Stops`, `## Anti-patterns`, `## Rules`; `name: session-retro`; `version: "1.0.0"` |
| 2 `templates/sessions.md` | DONE | `grep -n '^#\|^- ' skills/session-retro/templates/sessions.md` shows the title, `## Window`, `## Folders read`, `## Ranges read`, `## Keep`, `## Change`, `## Approved proposals`, and `- Place:`, `- What happened:`, `- Proposal:`, `- Decision:` in each point |
| 3 `plan-retro` "What it reads" 3 | DONE | `grep -n "newest" skills/plan-retro/SKILL.md` prints `31:3. The newest file under `<ledger_root>/retros/` named `<YYYY-MM-DD>.md`, the previous retro, for its "Reports read" list. With no previous retro, every run is read.` and no other line |
| Description count | DONE | `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]' \| grep session-retro` prints `779 skills/session-retro/SKILL.md` |
| Window of 2.C | DONE | The plan-folder loop printed `.scratch/archive/2-c-scripts-compute-facts-and-writing-is-removed/plan.md`; start `git log --diff-filter=A --format=%cI -- ... \| tail -n 1` printed `2026-09-28T22:51:46+02:00`; `git log -1 --format=%cI` printed `2026-09-29T12:04:41+02:00`; the `python3` command printed `2026-09-29T12:04:42+02:00`. The entries `2` and `1` and `2.H` each found one plan folder (`2-coverage-inventory-of-the-academic-skills`, `1-one-layout-for-every-skill`, `2-h-session-retro`) |
| Reader over the folders | DONE | Steps 2's command on `/Users/axelfaes/workspace/ordo` printed the three folders above and no other; the reader per Steps 3 printed `3738  730556` for `-Users-axelfaes-workspace-ordo` and `0 0` for each worktree folder, `cat "$work"/*.out \| wc -c` printed `730556`; the working folder was removed and `ls` of it printed `No such file or directory` |
| `session` form selects one folder | DONE | `ls "$projects/<folder>/6266a558-ed92-43a1-ac08-9bf8f4bc78a8.jsonl"` printed the path for `-Users-axelfaes-workspace-ordo` and `No such file or directory` for the two worktree folders |
| Part rule | DONE | The `awk` command of Steps 6 over the 2.C output printed 15 ranges, the first `1-175`, the last `3538-3738`; a gap check printed `ends at 3738` and no `gap/overlap`; a loop over the ranges printed no `over` line; a test with one 60,000-character line between two short ones printed `1-1`, `2-2`, `3-3` |
| Size rule | DONE | 2.C: 730556 bytes, at most 1,000,000, goes on; `--session` output: `python3 ... --session 6266a558-ed92-43a1-ac08-9bf8f4bc78a8 \| wc -c` printed `7066842`, more than 1,000,000, stops |
| Report name | DONE | In a scratch folder with `.scratch/retros/2026-09-26.md`, the loop of Steps 5 with `day=2026-09-30` printed `.scratch/retros/sessions-2026-09-30.md`; after `touch` of that file, `.scratch/retros/sessions-2026-09-30-2.md`; after `touch` of that, `-3.md` |
| Worked example, each part filled | DONE | Below |
| Layout reading | DONE | Below, "Judgment calls" |
| ASCII | DONE | `LC_ALL=C grep -n '[^ -~]' skills/session-retro/SKILL.md skills/session-retro/templates/sessions.md skills/plan-retro/SKILL.md .scratch/2-h-session-retro/agents/reviews/2-report.md; echo rc=$?` printed nothing and `rc=1` |
| Verify list | DONE | Quoted next |

### The verify runner, verbatim

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/orchestrator-state.md; echo "rc=$?"`

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

The runner's exit status, run again as `env -u ... sh skills/land/templates/checks.sh <state file> >/dev/null 2>&1; echo "rc=$?"`, printed `rc=0`.

## Files changed

- `skills/session-retro/SKILL.md`: new, 179 lines (`grep -c ''`).
- `skills/session-retro/templates/sessions.md`: new, 38 lines.
- `skills/plan-retro/SKILL.md`: one line changed (line 31), 113 lines in all.
- `.scratch/2-h-session-retro/agents/reviews/2-report.md`: this report.

`git status --short` shows ` M skills/plan-retro/SKILL.md`, `?? skills/session-retro/SKILL.md`, `?? skills/session-retro/templates/sessions.md`, and the report.

## User-visible change

`plan-retro` "What it reads" 3, before: "The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list." After: "The newest file under `<ledger_root>/retros/` named `<YYYY-MM-DD>.md`, the previous retro, for its "Reports read" list." The folder `.scratch/retros/2026-09-26` is not a file of that form, so it is not read either.

## Worked example, one keep point and one change point from the 2.C output

Both points are in the reader's output for the 2.C window (the reader prints timestamps as the transcript has them, in UTC with `Z`; 21:02:53Z is 23:02:53+02:00, inside the window). The quotes are the reader's lines, cut at a sentence end and marked `...`; none holds a secret or a character outside printable ASCII, so no `<REDACTED>` or `<U+XXXX>` form appears in them.

### Keep

#### A design question is answered after grepping where the thing is used, and the answer names the places found

- Place: `6266a558-ed92-43a1-ac08-9bf8f4bc78a8 18534 2026-09-28T21:02:53.186Z user: (b) but wouldnt it be better as a separate script? So we can run the tests without landing?`
- Place: `6266a558-ed92-43a1-ac08-9bf8f4bc78a8 18545 2026-09-28T21:03:05.897Z tool Bash: grep -n 'verify.sh' skills/refute/SKILL.md skills/spec/templates/brief.md skills/plan-orchestration/SKILL.md | cut -c1-150`
- Place: `6266a558-ed92-43a1-ac08-9bf8f4bc78a8 18554 2026-09-28T21:03:24.381Z text: Yes, a separate script is better. I checked where the list is run today, and the landing is only one of three places:`
- What happened: The user asked whether the verify runner should be a separate script. The Claude Code session grepped the three skills that run the list, then answered with the three places (the builder, the reviewer, the landing) and the reason the runner must be shared by all three.
- Proposal: `~/.claude/rules/no-claim-without-a-command.md`, first bullet, "Every claim about state is produced by a command run in the same turn, and the message names that command or quotes its output", produced the behaviour. Keep it as it stands.
- Decision: not asked; this is a worked example, not a run.

### Change

#### A recommendation that names a count as what would settle it is given before the count is made

- Place: `6266a558-ed92-43a1-ac08-9bf8f4bc78a8 18863 2026-09-28T21:23:51.223Z text: Step 1 of plan 2.C has landed (6c41c02). ...` and its further line `  10. **A cold review of each brief before the builder starts.** Source: ConnorGriffin. It costs one agent per step. Not recommended yet: counting how many of plan 2.B's closed findings trace to a wrong brief would settle whether it pays.`
- Place: `6266a558-ed92-43a1-ac08-9bf8f4bc78a8 18914 2026-09-28T21:36:51.974Z user: 1. Isn't this double work?` and its further line `  10. So, please properly count and give a recommendation, ...`
- What happened: Asked which items of other skill packs to take, the Claude Code session gave a recommendation for item 10 that said a count would settle it and did not make the count. The user's next message asks for the count and a recommendation.
- Proposal: `~/.claude/rules/never-take-the-lazy-option.md`, third bullet, as it stands, "Nothing inside the request is handed back as a gap, a limitation, a "later item" or a booking when it can be done now." becomes "Nothing inside the request is handed back as a gap, a limitation, a "later item" or a booking when it can be done now, and a recommendation is never given with the count that would settle it left unmade."
- Decision: not asked; this is a worked example, not a run.

### Approved proposals

Empty in the example: no decision was taken.

## Terms for step 3 (`skills/repo-setup/templates/plan-terms.md`)

Each is used by `session-retro` in a sense of its own.

- **sessions report**: the report `/session-retro` writes at `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md`, with `-2`, `-3` for a further one on the same day; holds the window, the folders read, the keep points and change points with their proposals and the user's decision on each. Stated in: `session-retro`, Steps 5 and `templates/sessions.md`.
- **keep point**: a behaviour of a Claude Code session worth repeating, with its places and the proposal that makes it repeat. Stated in: `session-retro`, Steps 6 and 9.
- **change point**: a behaviour of a Claude Code session worth changing, with its places and the proposal that changes the rule, skill or brief named. Stated in: `session-retro`, Steps 6 and 9.
- **place**: a line the reader printed, quoted as `<id> <line> <timestamp> <label>: <text>`, that shows a point. Stated in: `session-retro`, Steps 8.
- **window**: the two times the reader takes, or, for a plan, the time of the commit that added its `plan.md` to one second after its last commit. Stated in: `session-retro`, Steps 1.
- **working folder**: the folder under `$TMPDIR` that holds the reader's outputs for one run and is removed at its end. Stated in: `session-retro`, Steps 3 and 12.

## Grep of each changed name across `skills/`, `docs/`, `utils/` and `README.md`

Command: `git grep -n -e 'session-retro' -e 'sessions report' -e 'sessions-' -- skills docs utils README.md ':!skills/session-retro/SKILL.md'`

- `docs/dev/building.md:11` and `docs/dev/change-standard.md:72`: the reader's test line; still true.
- `docs/roadmap.md:42` and `:45`: the entry 2.H and its Goal; still true.
- `docs/roadmap.md:220`: a history line of 2.B, unaffected.
- No hit of `sessions report` or `sessions-` outside the new skill.

Command: `grep -n -e 'newest' -e 'retros/' skills/*/SKILL.md skills/*/templates/*.md docs/*.md docs/dev/*.md README.md`

- `skills/plan-retro/SKILL.md:31`: changed.
- `skills/plan-retro/SKILL.md:48` (writes `<ledger_root>/retros/<YYYY-MM-DD>.md`), `skills/repo-setup/templates/plan-terms.md:78` and `docs/glossary.md:83` (**retro**): still true.
- `skills/plan-orchestration/SKILL.md:290`, `skills/refute/SKILL.md:156`, `skills/spec/SKILL.md:272`: the word "newest" there is about model versions; unaffected.

## Sentences about the changed files as a whole, reread

- `plan-retro` description "Writes a retro report and changes nothing else until the user approves": still holds; a sessions report is not one of its outputs.
- `plan-retro` Steps 1 "A previous retro that cannot be read ... has no `## Reports read` heading": applies to the file line 31 now selects, which is always a retro.
- `plan-retro` Stops row 3, same.
- `session-retro` description, 779 characters, names no neighbouring skill (the first line `grep -n 'plan-retro' skills/session-retro/SKILL.md` prints is line 24, so line 3 has none); its `Triggers on:` phrases are `session-retro, review the Claude Code sessions of a plan, review this Claude Code session, review a time window of Claude Code sessions, what went well and what went wrong in the Claude Code sessions, mine the Claude Code transcripts, read the transcripts of a plan`; none is in `plan-retro`'s list and none asks for `plan-retro`'s case.
- The words of item 1: `grep -n -i 'the session\b\|\bkind\|ruling' skills/session-retro/SKILL.md` prints lines 58, 139, 158 and 159, where the hit is "the session id" or "the start and end, or the session id" (a session id is Claude Code's identifier, not the glossary's "the session"); no line holds "kind" or "ruling"; "retro" appears only in `/plan-retro`, `session-retro` and the folder name `retros/`.

## Judgment calls the brief left open

- The reader's `user`, `text` and `tool <name>` are called "labels" in "The reader", since "kind" is the glossary's word for `/plan-retro`'s grouping.
- The plan folder is found by the first word of the title after `# Plan: `, less a trailing full stop, so `2` matches `2. Coverage inventory ...` and not `2.C ...`; run for `2`, `1`, `2.C` and `2.H`, each found exactly one folder.
- The "No such plan" refusal also covers more than one folder with the entry as its title, and no commit that added `plan.md`, since Steps 1 has no window then; the brief names only the missing folder.
- The brief's Rules bullet "every quoted line is a line the reader printed" is not written as a Rules bullet, because Anti-patterns row 2 carries it with its Do instead ("Quote the reader's line") and the layout says each rule is in one place; the Rules bullet is split in three (the secret form, the non-ASCII form, the one write), each a rule that can be broken alone.
- Anti-patterns row 5 (an edit to a text a proposal names) and the Rules bullet "writes in the repository only the sessions report" cover overlapping ground: the row gives the way to make the change, the bullet limits the writes.
- Steps 6 records each place as the reader's `<id> <line>` with its output line number, and `- What happened:`, and Steps 8 replaces them with the quoted places, so that Steps 7 can match places to earlier decisions by id and line before the quotes exist.
- The closing list of approved proposals is written at the end of Steps 10 (the step's completion criterion), which keeps the twelve steps of the brief.
- The commands sit in the steps, not in a reference section, since each is one action of one step and "A reference section of row 6 ... holds only material every run reads" leaves only "The reader" for the material every run reads.
- The working folder is made with `mktemp -d "${TMPDIR:-/tmp}/session-retro.XXXXXX"`; the fallback to `/tmp` applies when `TMPDIR` is unset.
- The window's end for an open plan is the run's time through `datetime.now().astimezone().isoformat(timespec="seconds")`.

## Wrong or impossible in the brief

Nothing. The `--session` measurement, 38245 lines and 7054879 bytes at the first run and 7066842 bytes at the last, differs from the brief's 7021754 because the transcript is still being written; it is above 1,000,000 bytes in each run.

## Cleanup

The reader outputs and scratch folders under `$TMPDIR` are removed; `ls -d ${TMPDIR}sr-* ${TMPDIR}session-retro.*` finds none.
