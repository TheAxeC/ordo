# The skill layout

Every `skills/<name>/SKILL.md` follows this layout, so a reader finds the same thing in the same place in every skill. The section "Writing for an agent" binds a skill's text as that section's last bullet says. The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`.

## Frontmatter

```yaml
---
name: <the folder's name>
description: "<what the skill does and what it produces, in one paragraph>. Triggers on: <the phrases, comma-separated>."
metadata:
  version: "<major.minor.patch>"
---
```

- `name` equals the folder's name.
- `description` is one paragraph: what the skill does, what it produces, then `Triggers on:` and the phrases. It names no neighbouring skill; that is the Use instead section's job.
- `description` is at most 1,024 characters, counted as the length of its YAML value once parsed: `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'` prints each skill's count.
- The first words of `description` name what the skill does, in the phrase a reader or a model matches a request on.
- `Triggers on:` lists at least one phrase for each case the skill is for, and may list several phrasings of one case, so a request worded differently still finds the skill.
- A phrase for a case a neighbouring skill is for goes in that skill's `Triggers on:`, not in this one.
- The version lives in `metadata.version` only. The text of the skill carries no version, date or change history.

## Sections, in order

| # | Section | Required | What goes in it |
|---|---|---|---|
| 1 | `# <Title>` and one paragraph | yes | What the skill does and what it leaves behind, in one to three sentences. |
| 2 | `## Quick start` | yes | A code block with every invocation, one per line, each with a short comment. The first line is the one a new user types first. |
| 3 | `## Use instead` | yes | A table with the columns When and Use: the situations where a neighbouring skill is the right one. |
| 4 | `## What it reads` | yes | A numbered list, one input per item. An input whose absence is a refusal says so in its item. |
| 5 | `## Steps` | yes | A numbered list in execution order, one action per item. A skill with modes or phases gives each a `### <name>` subsection with its own numbered list. |
| 6 | Reference sections | no | Any number of `## <label>` sections for material the steps point at (a script, a file format, a launch command), within the limit "Writing for an agent" sets for them. Each heading is a noun-phrase label. |
| 7 | `## Stops` | yes | A table with the columns Stop, When, What it shows and What resumes it. A skill that never stops has one row that says so. |
| 8 | `## Anti-patterns` | yes | A table with the columns Anti-pattern, Why it fails and Do instead. |
| 9 | `## Rules` | yes | A bulleted list, one rule per bullet. |

No other `##` heading appears outside the place row 6 gives it.

## Where a rule goes

- A rule that says what to do at one point of the work goes in that step's item.
- A rule that forbids a tempting shortcut goes in Anti-patterns, with the reason it fails.
- A rule that holds throughout the skill goes in Rules.
- A rule is written once. Another place that needs it names the section it is in.

## Lists and tables

- One rule per bullet or item: two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets. A bullet is one sentence where it can be, and a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule.
- A numbered list means order. An unordered set is a bulleted list.
- A step that can refuse or stop comes before every step that writes, drafts or commits what the refusal or stop guards.
- A table is used when three or more items share the same two or more attributes. A cell holds a phrase or a sentence; a rule that needs more than a cell goes in a list and the table points at it.
- A code block holds commands, file formats and printed output, and carries a language tag where one applies.
- Bold marks a list item's label (`- **Label.** ...`) and nothing else.

## Writing for an agent

- A rule states the behaviour wanted: a rule written as a prohibition names the behaviour to do instead, in the same bullet or in the Do instead cell of its Anti-patterns row, since a bare prohibition draws attention to what it forbids.
- One meaning has one place, as "Where a rule goes" says for a rule.
- A sentence stays only when it changes what the reader does from what they would do without it. A sentence that restates a default, praises, or explains what the reader already knows is cut.
- Each item of Steps ends on its completion criterion: what is true, or what exists, when the step is done.
- Material a step needs only in some runs (a long format, a table of cases, a protocol) goes in a file `references/<name>.md` beside `SKILL.md`, named by its path from the step that reads it. Reference material goes in `references/`, never in `templates/`, which holds the files a skill copies into a repository or runs from its own folder.
- A reference section of row 6 of "Sections, in order" holds only material every run reads.
- The rules of this section apply to a skill's text when it is written or rewritten. Roadmap entry 23, the pruning pass, applies them to every existing skill.

## Paths and names

- A file of this skill is named from the skill's folder: `templates/<file>`.
- A file of this skill's `references/` is named `references/<file>`, as a file of its `templates/` is named `templates/<file>`.
- A file of another skill is named with its skill: "the `plan` skill's `templates/plan.yaml`".
- A repository path is relative to the repository root, and a key of `.agents/plan.yaml` is written as it appears there, in code.
- A skill is named by its `name` in code: `/plan` for the invocation, `plan` for the skill.

## A rewrite of a skill

- A step rewrites an existing skill's `SKILL.md` when it restyles it, rebuilds it, or replaces more than its wording in a few places.
- Such a rewrite keeps every rule of the old text, and the reviewer checks that by reading the old file and the new one.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A rule folded into a table cell until its exception is gone | The skill then allows what the rule forbade | Keep the rule whole in a list item and point the cell at it |
| The same rule written in two sections | The two copies drift, and a reader cannot tell which one holds | Write it once and name its section from the other place |
| A paragraph holding several rules | A reader, and a reviewer checking a diff, cannot tell where one rule ends | One rule per bullet |
| History in the skill: a version tag in a heading, "added in", a date | It tells the reader nothing about what to do now | The version in `metadata.version`; the history in the commit log |
| A heading that is a sentence or a slogan | It hides what the section holds | A noun-phrase label |
