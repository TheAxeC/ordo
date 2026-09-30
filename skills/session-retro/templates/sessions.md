# Sessions report <YYYY-MM-DD>

## Window

- Resolved from: <the entry, the commit that added its plan.md and the latest commit that touches its folder, each with its committer time | the session id | the two times as given>
- Start: <ISO 8601 time with zone | none, for a session id>
- End: <ISO 8601 time with zone | none, for a session id>
- Working folder, `<work>`: `<path>`
- Report, `<report>`: `<path>`

## Folders read

- `<folder name>`: <n> lines, <n> bytes; <no skipped lines | skipped <n> lines of <file>, one entry per file>

## Ranges read

- `<folder name>`: lines <first>-<last>, one range per part read

## Keep

### <the behaviour to repeat, stated as what was done>

- Place: <the reader's line: id, line, timestamp, label and text; one Place line for each place>
- What happened: <what the Claude Code session did, in plain words>
- Proposal: <the file and section of the text that produced the behaviour, or, when no text did, the file and section the sentence goes into and the sentence that would make the behaviour repeat>
- Decision: <approved | corrected: ... | declined>

## Change

### <the behaviour to change, stated as what was done>

- Place: <the reader's line: id, line, timestamp, label and text; one Place line for each place>
- What happened: <what the Claude Code session did, in plain words>
- Proposal: <the file and section, and the sentence to add | the sentence as it stands and the sentence it becomes | where the written rule should be read>
- Decision: <approved | corrected: ... | declined>

## Approved proposals

- `<file>`, <section>: <the sentence to add, or the sentence it becomes>
