---
name: session-retro
description: "Read the transcripts of Claude Code sessions, from a plan's opening to its last commit, from one Claude Code session with its subagents, or from a time window, and report what went well, to keep and repeat, and what went wrong, to change. Each point quotes its place in the transcript by id, line and timestamp and proposes a change to a named rule, skill or brief, as a sentence to add or change, and the user decides on each proposal. Leaves behind a sessions report in the ledger's retros folder. Triggers on: session-retro, review the Claude Code sessions of a plan, review this Claude Code session, review a time window of Claude Code sessions, what went well and what went wrong in the Claude Code sessions, mine the Claude Code transcripts, read the transcripts of a plan."
metadata:
  version: "1.0.0"
---

# Review of Claude Code sessions

`/session-retro` reads what was said and done in Claude Code sessions and reports what went well, to keep and repeat, and what went wrong, to change. It leaves behind a sessions report in the ledger: each point with its place in the transcript quoted, the change it proposes to a rule, a skill or a brief, and the user's decision on the proposal, committed by its path.

## Quick start

```
/session-retro <entry>                 review the Claude Code sessions of a plan, from the commit that added its plan.md to its last commit
/session-retro session <session id>    review one Claude Code session with its subagents
/session-retro <start> <end>           review any window, two ISO 8601 times with a zone, such as 2026-09-28T22:51:46+02:00
```

## Use instead

| When | Use |
|---|---|
| The findings of the refuter reports across plans | `/plan-retro` |
| The cause of one failure | `/diagnose` |
| Which command comes next | `/ordo-help` |

## What it reads

1. `.agents/plan.yaml`: `ledger_root`, `archive_root`, `worktree_root`, `rules` and `standards`.
   - A missing file or key is a refusal ("Stops").
2. For `<entry>`, the ledger folder under `<ledger_root>/` or `<archive_root>/` whose `plan.md` has a title, after `# Plan: `, that equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed (the number, or the number and title).
   - No such folder is a refusal ("Stops").
3. The transcript folders of Claude Code, under `$CLAUDE_CONFIG_DIR/projects` when that variable is set and under `~/.claude/projects` otherwise.
4. The output of the reader, `templates/transcript_window.py` ("The reader").
5. For each proposal, the text it names.
6. The earlier sessions reports, `<ledger_root>/retros/sessions-*.md`, for the points that already have a decision.
7. For a change point, the texts Steps 9 searches for its rule: the rules file and the standards pages `rules` and `standards` name, the user's rules files `CLAUDE.md` and `rules/` under `$CLAUDE_CONFIG_DIR` when that variable is set and under `~/.claude` otherwise, and the `SKILL.md` of the skill the Claude Code session was running.

## Steps

1. Resolve the window.
   - For `<entry>`, find the plan's folder, whose name is `<slug>`:
     ```sh
     for plan in "<ledger_root>"/*/plan.md "<archive_root>"/*/plan.md; do [ -f "$plan" ] && head -n 1 "$plan" | awk -v entry='<entry>' 'index($0, "# Plan: ") == 1 { title = substr($0, 9); if (title == entry || index(title, entry " ") == 1 || index(title, entry ". ") == 1) found = 1 } END { exit !found }' && echo "$plan"; done
     ```
   - The loop matches `<entry>` as "What it reads" 2 says.
   - The start is the committer time of the commit that added `<ledger_root>/<slug>/plan.md`, the earliest one when several print:
     ```sh
     git log --diff-filter=A --format=%cI -- "<ledger_root>/<slug>/plan.md" | tail -n 1
     ```
   - The end is one second after the committer time of the latest commit that touches the folder under either root, or the time of the run when the folder is still under `<ledger_root>/`:
     ```sh
     git log -1 --format=%cI -- "<ledger_root>/<slug>" "<archive_root>/<slug>"
     python3 -c 'import sys, datetime; print((datetime.datetime.fromisoformat(sys.argv[1]) + datetime.timedelta(seconds=1)).isoformat())' '<that time>'
     python3 -c 'import datetime; print(datetime.datetime.now().astimezone().isoformat(timespec="seconds"))'
     ```
   - For `session <session id>`, there is no window: the reader's `--session` form is used.
   - For `<start> <end>`, the window is as given.
   - The step is done when the start and end, or the session id, are known.
2. Find the transcript folders.
   - Claude Code names a folder after the resolved path of the directory it ran in, with every character other than a letter, a digit or `-` replaced by `-`.
   - The repository is the main worktree, the first line of `git worktree list --porcelain` without its `worktree ` prefix, so a run from a linked worktree finds the same folders as a run from the main checkout.
   - The folders are the repository's own and every folder whose name starts with the name of the resolved `<repository>/<worktree_root>/`, and `<projects>` is the transcript root the first line of the output prints:
     ```sh
     projects="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/projects"; echo "$projects"
     repo=$(cd "$(git worktree list --porcelain | sed -n '1s/^worktree //p')" && pwd -P)
     name=$(printf '%s' "$repo" | sed 's/[^A-Za-z0-9-]/-/g')
     prefix=$(printf '%s' "$repo/<worktree_root>/" | sed 's/[^A-Za-z0-9-]/-/g')
     ls "$projects" | awk -v name="$name" -v prefix="$prefix" '$0 == name || index($0, prefix) == 1'
     ```
   - For `session <session id>`, the folder is the one of those that holds `<session id>.jsonl`:
     ```sh
     ls "<projects>/<folder>/<session id>.jsonl"
     ```
   - No folder is a refusal that says Claude Code removes transcripts older than its `cleanupPeriodDays` setting ("Stops").
   - The step is done when the folders to read are listed.
3. Run the reader.
   - Make the working folder under `$TMPDIR`, which holds the reader's outputs, and take the path the command prints as `<work>`:
     ```sh
     mktemp -d "${TMPDIR:-/tmp}/session-retro.XXXXXX"
     ```
   - Run the reader over each folder with the window, as "The reader" gives, its output in `<work>/<folder>.out` and its stderr in `<work>/<folder>.err`.
   - An exit status 1 is a refusal that shows the `error: cannot read` lines ("Stops").
   - An exit status 2 is a refusal that shows the reader's line ("Stops").
   - Outputs that together hold no item are a refusal ("Stops").
   - The step is done when each output is on disk with its line and byte count, from `wc -lc "<work>"/*.out`.
4. Check the size.
   - The size is the byte count of the outputs together:
     ```sh
     cat "<work>"/*.out | wc -c
     ```
   - When it is more than 1,000,000 bytes, stop ("Stops", "A large output") with the size and, for each output, its number of parts, the line count of the command of Steps 6.
   - The step is done when the size is at most 1,000,000 bytes or the user has said to read it all.
5. Start the sessions report.
   - The path is `<ledger_root>/retros/sessions-<YYYY-MM-DD>.md` with the date of the run, or, when that file exists, `sessions-<YYYY-MM-DD>-2.md`, then `-3`, and so on; the command prints the path, which is `<report>`:
     ```sh
     day=$(date +%F); report="<ledger_root>/retros/sessions-$day.md"; n=2
     while [ -e "$report" ]; do report="<ledger_root>/retros/sessions-$day-$n.md"; n=$((n + 1)); done
     echo "$report"
     ```
   - Write there, from `templates/sessions.md`, the window with what it was resolved from, the folders read with each output's line count and each `skipped` line, and `<work>` and `<report>`, so that a session after a compaction finds them in the newest sessions report.
   - This is the first write, and every later step writes to this file.
   - The step is done when the file exists with those parts filled.
6. Read each output whole, in parts.
   - A part is a line range that this command prints for the output, at most 30,000 bytes, so that the Read tool, which refuses a read above 25,000 tokens, takes each part whole; a line longer than that is a part of its own:
     ```sh
     LC_ALL=C awk -v max=30000 'NR == 1 { first = 1 } { n = length($0) + 1; if (size > 0 && size + n > max) { print first "-" (NR - 1); first = NR; size = 0 } size += n } END { if (NR > 0) print first "-" NR }' "<work>/<folder>.out"
     ```
   - A part is read with Claude Code's Read tool on the output file, from line `<first>` for `<last> - <first> + 1` lines, since Claude Code keeps only a 2 KB preview of a large Bash output.
   - A part of one line, and a line the Read tool shows cut, is written folded into a file with `sed -n '<n>p' "<work>/<folder>.out" | fold -w 2000 > "<work>/line-<n>.txt"`, and that file is read with the Read tool 15 lines at a time.
   - After each part, the points it gave and the range read are written into the report, so that after a compaction the next part is known and no point is lost.
   - A keep point is a behaviour worth repeating.
   - A change point is a behaviour worth changing.
   - A behaviour seen again in a later part is a further place of its point.
   - Each point is written under `## Keep` or `## Change` as a `###` heading and a `- What happened:` line, with each place as the reader's `<id> <line>` and its line number in the output.
   - The step is done when every range of every output is recorded as read.
7. Leave out a point whose places are all places of a point that has a decision in an earlier sessions report, matching a place by its id and line, and remove it from the report.
   - The step is done when no point of the report is one of those.
8. For each point, write its places in place of the noted ones: each `<id> <line> <timestamp>` as the reader printed it, with the reader's line quoted from the output by its line number, a long text cut at a sentence end and marked `...`.
   - The step is done when each point has one `- Place:` line for each place and no output line number is left.
9. For each point, write its proposal, after reading the text it names.
   - A change point names the rule (the rules file, a standards page, or a rules file of the user's), the skill and its section, or the brief (the `spec` skill's `templates/brief.md`, or the brief of a step not yet landed).
   - The proposal is the first of these three that applies:
     - The rule is not written: the sentence to add.
     - The rule is written where the Claude Code session did not read it: where it should be read.
     - The rule is written and the behaviour still happened: a sharper sentence, or a change to the text that should have prevented it, as the sentence stands beside the sentence it becomes.
   - "Not written" is decided by grepping for the rule in the texts "What it reads" 7 lists.
   - A keep point names the text that produced the behaviour, or, when no text did, gives the sentence that would make the behaviour repeat and the file and section it goes into.
   - A proposed rule is in the voice of the page it goes into, with no date, incident or step number.
   - The step is done when each point has one `- Proposal:` line.
10. For each proposal in turn, show it with its point and places and take the user's decision ("Stops", "The proposals").
    - A decision is approved, corrected (with the correction) or declined.
    - The decision is written beside the proposal as `- Decision:`, in the user's words.
    - The decision is written before the next proposal is shown.
    - The step is done when each proposal has its decision and `## Approved proposals` lists each approved or corrected proposal with the file it goes into.
11. Commit the report by its path, in one commit whose subject names the sessions report:
    ```sh
    git add -- "<report>" && git commit -m "Record the sessions report <YYYY-MM-DD>" -- "<report>"
    ```
    - The step is done when `git log -1 --format=%s -- "<report>"` prints that subject.
12. Remove the working folder with `rm -r "<work>"`.
    - The step is done when `ls "<work>"` reports that it does not exist.

## The reader

`templates/transcript_window.py` prints what was said and done in the transcripts of one transcript folder, with the secrets of the forms it knows replaced by `<REDACTED>`.

```sh
python3 <this skill's folder>/templates/transcript_window.py <transcript folder> <start> <end>
python3 <this skill's folder>/templates/transcript_window.py <transcript folder> --session <session id>
```

- A line of output is `<id> <line> <timestamp> <label>: <text>`.
- `<id>` is the session id of a main Claude Code session, or `agent-<agent id>` for a subagent.
- `<line>` is the 1-based line number in the transcript file, not in the output file.
- `<timestamp>` is as the transcript entry has it.
- `<label>` is `user` for a message the user typed, `text` for a text of the assistant, or `tool <name>` for a tool call with the first line of its input.
- Further lines of a text are indented by two spaces.
- A YAML value on the line after its name is not redacted.
- `skipped <n> lines of <file>` on stderr says that many lines of a transcript file could not be read as an entry.
- Exit status 0 means the output is complete, and an empty window prints nothing.
- Exit status 1 means a file or folder could not be read, with `error: cannot read <path>: <reason>` on stderr, and the output lacks it.
- Exit status 2 means a usage error, with `error: <what>` on stderr and nothing on stdout.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A large output | Steps 4, the outputs together are more than 1,000,000 bytes | The size, and the number of parts of each output | The user's word to read it all, which continues at Steps 5, or a narrower window given as `/session-retro <start> <end>`, which ends this run after the working folder is removed |
| The proposals | Steps 10, each proposal | The proposal with its point and places | The user's decision on it: approved, corrected or declined |
| No configuration | `.agents/plan.yaml` is missing, or a key of "What it reads" 1 is not in it | The file or the key | The file or key added, then `/session-retro` again |
| No such plan | No plan folder's title matches `<entry>` as "What it reads" 2 says, more than one does, or no commit added its `plan.md` | The entry and what was found | The entry corrected, then `/session-retro` again |
| No transcript folder | Steps 2 finds no folder, or none holds the session id | The folder names looked for, and that Claude Code removes transcripts older than its `cleanupPeriodDays` setting | A window or a session Claude Code still keeps, then `/session-retro` again |
| The reader failed | The reader exits with status 1 or 2 | The `error:` lines | The file made readable, or the times or the session id corrected, then `/session-retro` again |
| Nothing in the window | The outputs together hold no item | The window and the folders read | Another window, then `/session-retro` again |

- The first two rows are stops: each waits on the user.
- The other rows are refusals: each names its cause, writes nothing in the repository, and removes the working folder when Steps 3 made it.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A point with no place | It cannot be checked against the transcript | Write at least one place for each point, quoted from the reader's line |
| A quote taken from a `.jsonl` file | It skips the reader's redaction | Quote the reader's line |
| An output read in samples, or its first part only | The points of the rest are lost | Read every range Steps 6 lists and record each as read |
| A proposal that loosens a rule or adds an exemption | It turns the behaviour into allowed behaviour | Propose the rule, the sharper sentence, or the change to the text that should have prevented the behaviour, as Steps 9 says |
| An edit to a rule, skill or brief that a proposal names | The text changes outside the process of its owner | Make the change where the text is owned: an approved proposal goes into `/roadmap add` or a plan, or, for the user's own rules files, is made by the user |

## Rules

- A secret the reader left in a quoted line is written `<REDACTED>`, and the rest of the line stays as printed.
- Each character outside printable ASCII in a quoted line is written as its code point, `<U+2014>` for an em dash.
- A command names the paths `<projects>`, `<work>` and `<report>` as placeholders and is run with the literal path substituted, since each Bash call starts a fresh shell and keeps no variable of an earlier call.
- The skill writes in the repository only the sessions report.
- The skill runs from the repository's main checkout, the first line of `git worktree list --porcelain`, since the ledger is written only there.
