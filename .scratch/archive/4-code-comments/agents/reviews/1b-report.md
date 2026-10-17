# Report: step 1b, no positional argument in a skill's text

Everything in the brief is done. Nothing is NOT done.

## Open items of the state file

```
A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- none.
```

## The cases' first run

Run from the worktree root on the unchanged tree, before any change. Every case gave the brief's expected output, so no case needed a hand-back.

1. Line 221, the section "Rules of a comment". Command: `awk '/^## /{p = ($0 == "## Rules of a comment")} p' skills/code-comments/SKILL.md | shasum` and the same with `| wc -l`. Output: `0d97426c0bcc1e99359ca3261802ac924693e196  -` and `12`.
2. Line 222, the prose standard's sections. Command: `awk '/^## /{p = ($2 ~ /^[0ABCE]\.$/)} p' skills/repo-setup/templates/docs/dev/prose-standard.md | shasum` and the same with `| wc -l`. Output: `5d88cab9c999564c63fc1a88bf9c119efd22bca7  -` and `45`.
3. Line 223, each role. Command: `awk '/^## /{p = ($0 == "## Finding agent")} p' skills/code-comments/SKILL.md | shasum`, and the same with `Checking agent` and `Rewrite agent`, and each with `| wc -l`. Output: Finding `817ef0d9de385fd4bc5507b9077cfc5a8fd3778b  -` and 17 lines; Checking `231e497f7dea1e9e85019698373c10fd7588b5a2  -` and 26 lines; Rewrite `66e562d922c872a7d869eb1136fbad5a88d9b11e  -` and 13 lines.
4. Line 214, the hits filter. Command: `printf '3:x\n10:y\n1200:z\n' | awk -F: -v c=2 -v e=1100 '$1 >= c && $1 <= e'`. Output: `3:x` and `10:y`.
5. Line 47, the plan loop, with `<ledger_root>` `.scratch`, `<archive_root>` `.scratch/archive` and the entries `4`, `2.H`, `2.1`. Command: the line-47 `for` loop, typed once per entry with `-v entry="<entry>"`. Output: `.scratch/4-code-comments/plan.md`, `.scratch/archive/2-h-session-retro/plan.md`, `.scratch/archive/2-1-scripts-cut-to-their-jobs/plan.md`.
6. Line 80, the folder filter. Command: lines 76 to 79 of `skills/session-retro/SKILL.md` with `<worktree_root>` set to `.agents/worktrees`, then `ls "$projects" | awk -v name="$name" -v prefix="$prefix" '$0 == name || index($0, prefix) == 1'`; only `ls` of the transcript root folder, no transcript read. Output: `projects` printed `/Users/axelfaes/.claude-backup/projects`; the list was `-Users-axelfaes-workspace-ordo`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7a`.
7. Line 118, the part ranges. Command: `LC_ALL=C awk -v max=30000 '<the line-118 program>' skills/spec/SKILL.md | tr '\n' ' '`. Output: `1-280 281-502 `.
8. The grep over every skill. Command: `grep -n '\$[0-9]' skills/*/SKILL.md; echo "exit $?"`. Output: seven lines, `skills/code-comments/SKILL.md:214`, `:221`, `:222`, `:223` and `skills/session-retro/SKILL.md:47`, `:80`, `:118`, and `exit 0`.

## The cases after the change

Same commands with each field written `$(<n>)`, run from the worktree root. A case passes when its output equals the first run.

| Case | Command (after the change) | Output | Equal to the first run |
|---|---|---|---|
| 1 | `awk '/^## /{p = ($(0) == "## Rules of a comment")} p' skills/code-comments/SKILL.md \| shasum`, and `\| wc -l` | `0d97426c0bcc1e99359ca3261802ac924693e196  -`, `12` | yes |
| 2 | `awk '/^## /{p = ($(2) ~ /^[0ABCE]\.$/)} p' skills/repo-setup/templates/docs/dev/prose-standard.md \| shasum`, and `\| wc -l` | `5d88cab9c999564c63fc1a88bf9c119efd22bca7  -`, `45` | yes |
| 3 | `awk '/^## /{p = ($(0) == "## Finding agent")} p' skills/code-comments/SKILL.md \| shasum`, with `Checking agent` and `Rewrite agent`, and each `\| wc -l` | `817ef0d9de385fd4bc5507b9077cfc5a8fd3778b  -` 17 lines; `231e497f7dea1e9e85019698373c10fd7588b5a2  -` 26 lines; `66e562d922c872a7d869eb1136fbad5a88d9b11e  -` 13 lines | yes, each role |
| 4 | `printf '3:x\n10:y\n1200:z\n' \| awk -F: -v c=2 -v e=1100 '$(1) >= c && $(1) <= e'` | `3:x`, `10:y` | yes |
| 5 | the line-47 loop with `index($(0), ...)` and `substr($(0), 9)`, per entry | `.scratch/4-code-comments/plan.md`, `.scratch/archive/2-h-session-retro/plan.md`, `.scratch/archive/2-1-scripts-cut-to-their-jobs/plan.md` | yes |
| 6 | lines 76 to 79 then `ls "$projects" \| awk -v name="$name" -v prefix="$prefix" '$(0) == name \|\| index($(0), prefix) == 1'` | `-Users-axelfaes-workspace-ordo`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7`, `-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7a` | yes |
| 7 | the line-118 program with `length($(0))` on `skills/spec/SKILL.md` | `1-280 281-502 ` | yes |
| 8 | `grep -n '\$[0-9]' skills/*/SKILL.md; echo "exit $?"` | no hit line, `exit 1` | seven lines before, none after, as the brief expects |

## DONE / NOT DONE

| Item | Status | Command and output |
|---|---|---|
| 1. `code-comments` lines 214, 221, 222, 223 in `$(<n>)` | DONE | `git diff` shows `$(1)` twice on line 214, `$(0)` on 221 and 223, `$(2)` on 222; nothing else on those lines changes |
| 2. `session-retro` lines 47, 80, 118 in `$(0)` | DONE | `git diff` shows `$(0)` twice on line 47, twice on line 80, once on line 118; nothing else on those lines changes |
| 3. One Rules bullet in each skill | DONE | `skills/code-comments/SKILL.md:377` and `skills/session-retro/SKILL.md:208` (`wc -l` 377 and 208); the grep below finds no `$` followed by a digit in either |
| 4. Versions | DONE | `python3 -c 'import yaml; ...'` printed `skills/code-comments/SKILL.md 1.0.0` and `skills/session-retro/SKILL.md 2.0.1` |
| Verify 1, character set | DONE | `printf '%s\0' skills/code-comments/SKILL.md skills/session-retro/SKILL.md \| xargs -0 perl -CSD -ne '...'; echo "charset exit $?"` printed `charset exit 0` and no other line |
| Verify 2, no `$` and digit | DONE | `grep -n '\$[0-9]' skills/*/SKILL.md; echo "grep exit $?"` printed `grep exit 1` and no other line |
| Verify 3, every case equal | DONE | table above |
| Verify 4, versions | DONE | as item 4 |
| Verify 5, under 20 lines | DONE | `git diff --numstat` printed `5<tab>4<tab>skills/code-comments/SKILL.md` and `5<tab>4<tab>skills/session-retro/SKILL.md`: 18 lines added plus removed |
| Verify 6, the bullets read against the standards | DONE | see "Judgment calls" |

The added bullet, the same text in both skills:

```
- An `awk` field in a command of this skill is written `$(<n>)`, `$(0)` for the whole record, since the runner that serves the skill's text replaces a dollar sign followed by a digit with an argument of the call.
```

Rule 14 grep, `git grep -n -F -e '$0 == "## ' -e 'index($0, "# Plan: ")' -e 'length($0) + 1' -e '$0 == name' -e "'\$1 >= c" -- . ':!.scratch'; echo "exit $?"`, printed only `exit 1`: no tracked file outside `.scratch` holds the old forms.

## The terms

- runner (`docs/glossary.md`, "the program that runs the sessions and agents, Claude Code"): used in the new bullet of both skills for the program that serves the skill's text. That is Claude Code, the entry's sense. No other glossary term is added, changed or used in a new place; the diff adds no term.

## The files

- `skills/code-comments/SKILL.md`: 377 lines (376 before), 5 added and 4 removed.
- `skills/session-retro/SKILL.md`: 208 lines (207 before), 5 added and 4 removed.
- `.scratch/4-code-comments/agents/reviews/1b-report.md`: this report.

## Judgment calls

- The bullet's words are mine, as Decision 2 of the brief says. It is the last bullet of `## Rules` in each skill, since no other bullet of either section governs commands.
- Verify 6, the bullet against the standards pages. List rules (`docs/dev/skill-layout.md`, "Lists and tables"): one rule per bullet, and a qualifier that changes the rule stays in the same bullet; the bullet holds one rule (the field form) and its reason in one sentence, with no hard wrap. "Writing for an agent": the rule states the form wanted, a positive form, with its reason in one clause. Prose standard: ASCII; no semicolons, no dash, no bold; passive "is written" kept since the actor is irrelevant (E). Departure: the sentence is 39 words against E's "roughly 20 words unless the mechanism needs more". It needs its length because the brief and skill-layout put the rule, the form for the whole record and the runner's replacement in one bullet; splitting them would put the reason in a bullet that states no rule.
- The two bullets are the same sentence in both skills, since "A rule is written once" in skill-layout is about one skill's text, and each skill is served on its own.
- `code-comments` keeps `1.0.0` as the brief says; `session-retro` is raised in its patch part only.

## Host- or user-visible changes

- Before: the runner served `$0` in the two skills' commands as the call's first argument, so the rules commands of "The prompt file" were served with the argument in place of the whole record. After: the seven commands hold `$(0)`, `$(1)` and `$(2)`, which the runner leaves alone, and each case above prints what it printed before.
- Before, `session-retro` was `2.0.0`; after, `2.0.1`.

## Wrong or impossible in the brief

Nothing in the brief turned out wrong. Scripts outside the brief's seven lines hold `$` and a digit and were left alone: shell files under `skills/*/templates/` (for example `skills/code-comments/templates/strip_comments.test.sh:12`, `skills/land/templates/land.sh:91`). The git grep that found them is `git grep -n '\$[0-9]' -- skills ':!skills/*/SKILL.md'`; they are scripts, not `SKILL.md` text, and the brief's scope is `SKILL.md` text.
