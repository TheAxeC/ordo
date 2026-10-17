# Step 1b refuter report (on .agents/worktrees/4-code-comments-1b, base 97eec149356f6f3d60d75bcb8926e94a6be4db5b)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' skills/code-comments/SKILL.md skills/session-retro/SKILL.md | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "exit $?"
exit 0
$ grep -n '\$[0-9]' skills/*/SKILL.md; echo "exit $?"
exit 1
$ python3 -c 'import yaml; [print(f, yaml.safe_load(open(f).read().split("---")[1])["metadata"]["version"]) for f in ("skills/code-comments/SKILL.md", "skills/session-retro/SKILL.md")]'
skills/code-comments/SKILL.md 1.0.0
skills/session-retro/SKILL.md 2.0.1
$ git diff --numstat 97eec149356f6f3d60d75bcb8926e94a6be4db5b
5<tab>4<tab>skills/code-comments/SKILL.md
5<tab>4<tab>skills/session-retro/SKILL.md
$ git status --short
 M skills/code-comments/SKILL.md
 M skills/session-retro/SKILL.md
?? .scratch/4-code-comments/agents/reviews/1b-report.md
$ LC_ALL=C grep -n '[^ -~]' skills/code-comments/SKILL.md skills/session-retro/SKILL.md; echo "exit $?"
exit 1
$ wc -l skills/code-comments/SKILL.md skills/session-retro/SKILL.md
     377 skills/code-comments/SKILL.md
     208 skills/session-retro/SKILL.md
$ git show 97eec14...:skills/code-comments/SKILL.md | wc -l ; git show 97eec14...:skills/session-retro/SKILL.md | wc -l
     376
     207
Cases, before = base copies from `git show <base>:<path>` in the scratchpad, after = the worktree files:
case 1 before: 0d97426c0bcc1e99359ca3261802ac924693e196  -   12 lines
case 1 after:  0d97426c0bcc1e99359ca3261802ac924693e196  -   12 lines
case 2 before: 5d88cab9c999564c63fc1a88bf9c119efd22bca7  -   45 lines
case 2 after:  5d88cab9c999564c63fc1a88bf9c119efd22bca7  -   45 lines
case 3 Finding  before/after: 817ef0d9de385fd4bc5507b9077cfc5a8fd3778b  -   17 lines both
case 3 Checking before/after: 231e497f7dea1e9e85019698373c10fd7588b5a2  -   26 lines both
case 3 Rewrite  before/after: 66e562d922c872a7d869eb1136fbad5a88d9b11e  -   13 lines both
case 4 before: 3:x / 10:y        after: 3:x / 10:y
case 5 entry 4:   .scratch/4-code-comments/plan.md, before and after
case 5 entry 2.H: .scratch/archive/2-h-session-retro/plan.md, before and after
case 5 entry 2.1: .scratch/archive/2-1-scripts-cut-to-their-jobs/plan.md, before and after
case 6 (projects printed /Users/axelfaes/.claude-backup/projects), before and after, `cmp` of the two lists: same
  -Users-axelfaes-workspace-ordo
  -Users-axelfaes-workspace-ordo--agents-worktrees-2b-7
  -Users-axelfaes-workspace-ordo--agents-worktrees-2b-7a
case 7 before: 1-280 / 281-502   after: 1-280 / 281-502
case 8 before: `grep -n '\$[0-9]'` over each skills/*/SKILL.md at the base printed seven lines (code-comments 214, 221, 222, 223; session-retro 47, 80, 118); after: no line, exit 1
The report's rule 14 grep, reproduced over the worktree without git:
$ grep -rn -F --exclude-dir=.git --exclude-dir=.scratch -e '$0 == "## ' -e 'index($0, "# Plan: ")' -e 'length($0) + 1' -e '$0 == name' -e "'\$1 >= c" . ; echo "exit $?"
exit 1
The report's script lines with a dollar and a digit:
$ sed -n 12p skills/code-comments/templates/strip_comments.test.sh | grep -c '\$[0-9]'; sed -n 91p skills/land/templates/land.sh | grep -c '\$[0-9]'
1
1
The runner's substitution, read from the installed Claude Code 2.1.302 (`strings` of ~/.local/share/claude/versions/2.1.302):
e=e.replace(/\$(\d+)(?!\w)/g,(Q,_e)=>{let ke=parseInt(_e,10);if(w[ke]===void 0)return Q;return V=!0,b(w[ke])})
session-retro's commands as served before the fix for `/session-retro 4` ($0 replaced by 4):
plan loop with `index(4, "# Plan: ") == 1 { title = substr(4, 9); ...`: no plan printed
folder filter `'4 == name || index(4, prefix) == 1'`: no folder printed
part ranges with `length(4) + 1` on skills/spec/SKILL.md: 1-502
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The diff of `skills/code-comments/SKILL.md`, "The prompt file", changes only the fields: `'$(1) >= c && $(1) <= e'` in the hits filter, `$(0)` in the first and third rules commands, `$(2)` in the second; the rest of each line is byte-for-byte the base line in the diff.
- 2: holds. The diff of `skills/session-retro/SKILL.md`, Steps 1 and 6, writes `$(0)` twice in the plan loop, twice in the folder filter and once in the part ranges, nothing else on those lines.
- 3: holds. One bullet ends `## Rules` in each skill, the same sentence: "An `awk` field in a command of this skill is written `$(<n>)`, `$(0)` for the whole record, since the runner that serves the skill's text replaces a dollar sign followed by a digit with an argument of the call." It holds no `$` followed by a digit (grep exit 1), no date or history. Its reason matches the runner's code: `\$(\d+)(?!\w)` is replaced by the argument of that index when the call has one, and `$(0)` does not match it.
- 4: holds as the brief dictates, `2.0.1` and `1.0.0` (yaml check above); see Standards 1 on whether the patch part is the one `docs/dev/skill-layout.md` gives.

Cases of the brief's "Cases":

- 1, "Rules of a comment": met, the same sum `0d97426c...` and 12 lines before and after.
- 2, the prose standard's sections: met, `5d88cab9...` and 45 lines both times.
- 3, each role: met, Finding 17, Checking 26, Rewrite 13 lines, each sum equal before and after.
- 4, the hits filter: met, `3:x` and `10:y` both times, `1200:z` left out.
- 5, the plan loop: met, the three plan paths of the brief, the same before and after.
- 6, the folder filter: met, the same three folders before and after (`cmp` same); `repo` was set to `/Users/axelfaes/workspace/ordo` in place of the `git worktree list` command, which this review does not run.
- 7, the part ranges: met, `1-280` and `281-502` both times.
- 8, the grep over every skill: met, seven lines at the base, none after, exit 1.

## 1. Spec

none. The premises of "What is on the tree" reproduce: the seven grep lines at the base, 376 and 207 lines, `1.0.0` and `2.0.0`, `## Rules` as the last heading of each skill, `docs/dev/skill-layout.md` "Frontmatter" holding the version bullet the brief quotes, and the state file's verify list equal to the commands of `docs/dev/building.md`. ADR 0014 is the only record that names either skill (grep of `docs/adr/` for both names and for `awk`), and the diff changes nothing its Decision states. The diff changes no script, test or configuration file and counts 18 lines.

## 2. Proof

- `.scratch/4-code-comments/agents/reviews/1b-report.md`, "Judgment calls", first bullet: "It is the last bullet of `## Rules` in each skill, since no other bullet of either section governs commands."; what is wrong: the reason is false. `code-comments` Rules holds "Every value the user or the diff supplies, such as a range end or a path, reaches a command as one single-quoted argument..." and "Every command that takes an option ends its options before a supplied path..."; `session-retro` Rules holds "A command names the paths `<projects>`, `<work>` and `<report>` as placeholders...". The placement of the new bullet rests on this reason; failure scenario: the orchestrator accepts the placement on a false premise, and a reader of `code-comments` Rules finds the rules on command forms split, the new one after "A finding in another file stays in the report." instead of beside the two other command rules; verdict: none, item 3 holds wherever the bullet stands in Rules.

## 3. Standards

- `skills/session-retro/SKILL.md`, frontmatter: "+  version: \"2.0.1\""; what is wrong: `docs/dev/skill-layout.md`, "Frontmatter", gives the patch part "when only the wording changes and every run behaves as before", and the minor part "when the skill does something it did not do, accepts an input it did not accept, or adds to its output, and every run that worked before still works". A run with an argument does not behave as before. As served before the fix, `/session-retro 4` got `index(4, "# Plan: ") == 1` in Steps 1's plan loop, which printed no plan, and `'4 == name || index(4, prefix) == 1'` in the folder filter, which printed no folder (runs above); after the fix the same call finds `.scratch/4-code-comments/plan.md` and the three folders. No run that worked before changes, so the major part does not apply; the minor part's wording, `2.1.0`, describes the change, and the patch part's condition does not hold. The brief's Decision 3 chose the patch part because the skill's stated behaviour is unchanged, a test the layout's bullets do not use; failure scenario: a user or the pin reading `2.0.0` against `2.0.1` is told every run behaves as before, while every `/session-retro <entry>`, `session <id>` and `<start> <end>` call now resolves its window and folders where before the served commands found none; verdict: none, item 4 holds as dictated; the version is the orchestrator's to rule on Decision 3.

## 4. Behaviour

- `.scratch/4-code-comments/agents/reviews/1b-report.md`, "Host- or user-visible changes", first bullet: "Before: the runner served `$0` in the two skills' commands as the call's first argument, so the rules commands of \"The prompt file\" were served with the argument in place of the whole record."; what is wrong: the before and after are given only for `code-comments`' rules commands. For `session-retro` the report states no before and after of a run: before, `/session-retro <entry>` was served a plan loop and a folder filter that match nothing and part ranges that count each line as 2 bytes (`1-502` for `skills/spec/SKILL.md`, against `1-280 281-502` after); after, they print the plan, the folders and the ranges. This is the behaviour change behind Standards 1; failure scenario: the orchestrator books the step as a change with no run-visible effect on `session-retro` and keeps the patch version on that basis; verdict: none.

## Declined to judge

- That `$(0)` reaches the agent unchanged in a served skill was judged by reading the substitution code in the installed Claude Code 2.1.302, not by a served call, since this review invokes no skill. Step 2's gate run, `/code-comments a0aa831^..a0aa831` through the Skill tool, settles it for `code-comments`.
- Whether `code-comments` was created by this plan, and `session-retro` last raised by `3570071`, needs `git log --follow -- skills/code-comments/SKILL.md skills/session-retro/SKILL.md`, a git command outside the three this review runs. `docs/roadmap.md` entry 2.H names `2.0.0` at `3570071`, and the base holds `1.0.0` for `code-comments`.
- Whether the new rule should cover every `$` followed by a digit in a skill's commands, a shell positional parameter such as `"$1"` in `sh -c` included, and not only `awk` fields: brief item 3 dictates the `awk` scope, so the scope is the orchestrator's call. No `SKILL.md` holds such a parameter after the change (grep exit 1).
- One `git grep` against the base was run for the premise that no other tracked file holds the old commands. It is outside the three git commands this review is allowed, and its output is not used: the premise is judged from `grep -rn` over the worktree, whose files other than the two changed ones are the base's.
- The new bullet's 39 words against the prose standard's "Sentence shapes" limit of roughly 20 words: the builder names the departure and its reason, and splitting the reason from the rule is a wording choice for the orchestrator.

Reviewer usage: a419e24d4ce17de1e, claude-opus-5-5, 146073 tokens, 44 tool uses, 7m 33s.

## Closed

Step 1b is a small text step: each finding is fixed at landing on main, none is sent to the builder.

- Proof 1, the bullet's placement: fixed at landing. In each skill the bullet moves beside the rules on command forms: in `code-comments` after "`strip_comments.py` takes no `--`, so a relative path reaches it as `./<path>`.", in `session-retro` after "A command names the paths `<projects>`, `<work>` and `<report>` as placeholders ...".
- Standards 1, the version part: fixed at landing. `session-retro` goes to `2.1.0`, the minor part, since a call with an argument now finds its plan, its folders and its part ranges where the served commands found none, and every run that worked before still works. The brief's Decision 3 is replaced by this.
- Behaviour 1, `session-retro`'s before and after: closed in the booking, which states them from the reviewer's runs: before, `/session-retro 4` was served a plan loop and a folder filter that printed nothing and part ranges of `1-502` for `skills/spec/SKILL.md`; after, the plan `.scratch/4-code-comments/plan.md`, the three folders and `1-280 281-502`.
- Declined to judge, the bullet's 39 words: fixed at landing. The bullet is split into two sentences, the rule and its reason.
- Declined to judge, the reviewer's one `git grep` against the base: its output is not used, as the report says; the premise stands on its `grep -rn` over the worktree.
