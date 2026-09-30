# Step 2 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2h-2, base e9714ddf0a692563db27823e2e30d89227e25836)

## Verification (rerun by the reviewer)

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 10 commands passed
rc=0
```

```
description count (skill-layout command) | grep session-retro  ->  779 skills/session-retro/SKILL.md
LC_ALL=C grep -n '[^ -~]' <the three files and the report>; echo rc=$?  ->  (nothing) rc=1
grep -n '^#' skills/session-retro/SKILL.md  ->  # Review of Claude Code sessions, ## Quick start, ## Use instead, ## What it reads, ## Steps, ## The reader, ## Stops, ## Anti-patterns, ## Rules
grep -n newest skills/plan-retro/SKILL.md  ->  31:3. The newest file under `<ledger_root>/retros/` named `<YYYY-MM-DD>.md`, ... (only hit)
Steps 1 plan-folder loop, entries 2.C / 2 / 1 / 2.H / 2.G  ->  one folder each (.scratch/archive/2-c-..., archive/2-coverage-..., archive/1-one-layout-..., 2-h-session-retro, 2-g-git-guard)
Steps 1 start / latest / +1 s  ->  2026-09-28T22:51:46+02:00 / 2026-09-29T12:04:41+02:00 / 2026-09-29T12:04:42+02:00
Steps 2 folder rule, run from the main checkout  ->  -Users-axelfaes-workspace-ordo, ...--agents-worktrees-2b-7, ...--agents-worktrees-2b-7a (equals the brief's ls|grep)
Steps 2 folder rule, run from the worktree 2h-2  ->  (nothing; repo=/Users/axelfaes/workspace/ordo/.agents/worktrees/2h-2)
ls <folder>/6266a558-...jsonl for the three  ->  found only in -Users-axelfaes-workspace-ordo
reader over the 2.C window, wc -lc  ->  3738 730556 (main folder), 0 0 and 0 0 (worktree folders), all rc=0; cat *.out | wc -c -> 730556
reader --session 6266a558-... | wc -lc  ->  38354 7088167 (transcript still growing; > 1,000,000, stops)
reader --session over ...2b-7  ->  error: no session file: ..., rc=2
Steps 6 awk over the 2.C output  ->  15 ranges 1-175 ... 3538-3738, no gap/overlap, ends at 3738, none over 50,000; 60,000-char line case -> 1-1 2-2 3-3; empty file -> no range
Steps 5 name loop in a scratch folder with 2026-09-26.md  ->  sessions-2026-09-30.md, then -2.md, then -3.md
worked example places  ->  lines 18534, 18545, 18554, 18863, 18914 and the two quoted further lines are in the reader output as quoted
grep -c '' on the three files  ->  179, 38, 113
```

Outputs were written under $TMPDIR and removed; `git status --short` in the worktree is unchanged by the review.

## Verdicts

Items of the brief's "What to build":

- 1: violated, Spec 1 and Spec 2 (Steps 4 and Steps 12 do not do what the item says when followed literally in Claude Code) and Spec 3 (Steps 2 from a worktree); every sub-item the brief lists is otherwise present in the section it names (Quick start, Use instead, What it reads 1-6, Steps 1-12, "The reader", Stops, Anti-patterns, Rules), the words held (grep for "the session", "kind", "ruling", "retro" shows only "the session id", the skill names and the `retros/` folder).
- 2: holds, `templates/sessions.md` has the title with the date, Window (resolved from, start, end, working folder), Folders read with line and byte counts and skipped lines, Ranges read, `## Keep` and `## Change` with `###` points and Place / What happened / Proposal / Decision, and `## Approved proposals`.
- 3: holds, the diff changes `plan-retro` "What it reads" 3 to the newest file named `<YYYY-MM-DD>.md`; `grep -n newest` shows no other sentence naming the newest file.

Cases of the brief's "Cases":

- Skill exists, layout order, name, version, description, triggers: met (headings grep, 779 characters, no neighbouring skill in the description, no plan-retro phrase).
- Each item of What to build 1 in its section: partial, the order rule of Steps 9 lacks "the first that applies" (Spec 4); the working-folder variable defect is Spec 1.
- Window of 2.C: met (commands above).
- Folder rule: met from the main checkout; from a linked worktree it lists nothing (Spec 3).
- Part rule: met.
- Size of Steps 4: met when the commands run in one shell; in separate Bash calls the size command reads 0 (Spec 1).
- Report name: met.
- Template parts and worked example: met (quotes reproduced; neither needed the `<REDACTED>` or `<U+XXXX>` form, as the report says).
- plan-retro newest: met.
- Layout reading: partial, Standards 1 (bullets holding several rules).
- ASCII: met.

## 1. Spec

1. skills/session-retro/SKILL.md:77, :81, :83, :100, :123, :125-127: "work=$(mktemp -d ...)" then "cat \"$work\"/*.out | wc -c" and "The step is done when `ls \"$work\"` reports that it does not exist."; what is wrong: each step's commands use shell variables (`$work`, `$report`, `$projects`) set by an earlier step's command, but Claude Code's Bash tool starts a fresh shell for each call, so the variables are empty in a later step. Reproduced: `work=/x` in one call, then in the next call `echo "[$work]"` printed `[]`, `cat "$work"/*.out | wc -c` printed `0`, and `ls "$work"` printed `ls: : No such file or directory`. The brief's item 1 asks Steps 4 to stop above 1,000,000 bytes and Steps 12 to remove the working folder; failure scenario: an agent runs `/session-retro session 6266a558-...` step by step; at Steps 4 the size reads 0, so the 7,088,167-byte output goes on without the "A large output" stop; at Steps 12 `rm -r ""` fails and `ls ""` prints "No such file or directory", which meets the completion criterion while the working folder with the unredacted YAML values stays in $TMPDIR. Fix: name the working folder and the report by the paths written into the report at Steps 5 (or state that each command substitutes the literal path), not by a variable from an earlier call. verdict: item 1 violated, case "size" partial.
2. skills/session-retro/SKILL.md:154 and :162-163: "a narrower window given as `/session-retro <start> <end>`, which ends this run" and "The other rows are refusals: each ... removes the working folder when Steps 3 made it"; what is wrong: the working folder is removed only by a refusal or by Steps 12; a run ended at the "A large output" stop by a narrower window reaches neither, so it leaves the folder that brief Decision 2 says must be removed because it holds transcripts outside the redaction. Failure scenario: a run over one whole Claude Code session stops at 7 MB, the user gives a narrower window, and the 7 MB of reader output stays under $TMPDIR. verdict: item 1 violated.
3. skills/session-retro/SKILL.md:63: "repo=$(cd \"$(git rev-parse --show-toplevel)\" && pwd -P)"; what is wrong: in a linked worktree `--show-toplevel` is the worktree (`/Users/axelfaes/workspace/ordo/.agents/worktrees/2h-2` here), so the rule looks for `...worktrees-2h-2` and `...worktrees-2h-2--agents-worktrees-*`; `git rev-parse --path-format=absolute --git-common-dir` printed `/Users/axelfaes/workspace/ordo/.git`, whose parent is the repository. The command is the brief's own (item 1, Steps 2), so the source is the brief. Failure scenario: `/session-retro 2.C` run from a Claude Code session inside a step worktree finds no folder and refuses, or, where that worktree has its own transcript folder, reads only that folder and reports on a fraction of the plan's sessions with no sign that anything was left out. verdict: item 1 violated (case "folder rule" met only from the main checkout).
4. skills/session-retro/SKILL.md:111-114: "It gives the sentence to add, or the sentence as it stands beside the sentence it becomes, in this order:"; what is wrong: the brief asks for the order of `plan-retro`'s "The proposal for a recurring kind", which checks the cases in turn and "proposes the first change of 1 to 3 that applies" and says where to look ("Grep the rules page and the standards pages for it"); the skill keeps the list but not "the first that applies" nor where to search to decide that a rule is not written. Failure scenario: an agent writes a new rule sentence for a behaviour a rule already covers (case 1 chosen without the search), or writes all three forms for one point. verdict: case "each item in its section" partial.
5. skills/session-retro/SKILL.md:96-100: "at most 50,000 bytes ... A part is printed with `sed -n '<first>,<last>p' ...`"; what is wrong: in Claude Code a Bash output of this size is not shown inline: `sed -n '1,175p'` over the 2.C output (49,681 bytes) came back as "Output too large (48.6KB). Full output saved to: ... Preview (first 2KB)". The step does not say the part is then read from the saved file (or read with the Read tool by line offset and limit). The 50,000 figure is the brief's. Failure scenario: an agent following the step reads the 2 KB preview of each of the 15 parts, records each range as read, and the report's points come from about 4 percent of the output, which is the "read in samples" anti-pattern the skill forbids. verdict: none of its own (item 1's Steps 6 text is as the brief asked).
6. skills/session-retro/SKILL.md:32 and :42: "whose `plan.md` opens with `# Plan: <entry>`" against "`<entry>` is the first word of the title after `# Plan: `"; what is wrong: What it reads 2 and the brief accept the title's opening, and `refute` accepts "the number, or the number and title"; Steps 1 matches the first word only. Failure scenario: `/session-retro "2.H session-retro"` ends in "No such plan" although What it reads 2 says that plan matches. verdict: none.

## 2. Proof

- none. Every command the report quotes reproduced (window, folder rule from the main checkout, reader counts 3738 / 730556, part ranges, name loop, line counts, worked-example places); the `--session` byte count differs (7,088,167 now against 7,054,879 / 7,066,842) because the transcript is still being written, and the only decision resting on it (above 1,000,000) holds.

## 3. Standards

1. skills/session-retro/SKILL.md:80: "An exit status 1 is a refusal that shows the `error: cannot read` lines, an exit status 2 is a refusal that shows the reader's line, and outputs that together hold no item are a refusal ("Stops")."; also :119 "The decision is approved, corrected (with the correction) or declined, and is written beside the proposal as `- Decision:`, in the user's words, before the next proposal is shown." and :42 (two requirements joined by a semicolon); what is wrong: `docs/dev/skill-layout.md` "Lists and tables", one rule per bullet: these bullets each hold rules that can be broken while the other holds. Failure scenario: a reviewer of a later change to the refusal on exit 2 cannot cite or change one rule without rewriting the others. verdict: case "layout reading" partial.

## 4. Behaviour

- none. The one host-visible change outside the new skill, `plan-retro` "What it reads" 3, is stated in the report with its before and after.

## Declined to judge

- Whether the Read tool may read files under $TMPDIR without a permission prompt, which bears on how Spec 5 is fixed: not tested, since the review runs no command that could prompt.
- The exact inline-output threshold of the Bash tool: not measured; only that a 49,681-byte part is persisted with a 2 KB preview.
- Whether the skill meets the Goal as Axel reads it (the step's check): the user's reading.
- Shell quoting of user-supplied `<entry>`, `<session id>` and times pasted into the commands (change-standard rule 15): the values come from the user who runs the skill; not judged as a finding.

Reviewer usage: about 150,000 tokens (estimate from the context used, not a completion notice), 34 tool uses, about 25 minutes.
