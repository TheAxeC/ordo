# Step 3 refuter report (on .agents/worktrees/2e-3s55, base 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01)

A page this report cites is named with its section, never with a line number. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, from the worktree root:
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
(exit 0)

Verify 2: env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests

Verify 3: wc -l utils/pin.sh
     473 utils/pin.sh

Verify 4, as the cases ruling 2 gives it: git grep -n -E 'general-purpose|links every skill from it|installed skills change only' -- ':!.scratch'
(no output, exit 1)
Without the exclusion it hits only files under .scratch/ (the brief 3.md lines 10, 12, 19, 94, 128, 166; 3-brief-check.md lines 8-9; four archived reports).

Verify 5: a sample of reverts, reproduced on scratch copies under $TMPDIR/rev.3bOEGg (pin.test.sh copied beside an edited pin.sh, run under the test's own scratch HOME); first FAIL line, TMPDIR shortened to <TMP>:
base (the base's utils/pin.sh, the first run): FAIL: first pin links the agents: /private<TMP>/pin-test.HbCIWI/my home/.claude/agents/ordo-a.md does not link into the pin
R1 (the agent ln -sfn replaced by true): FAIL: first pin links the agents: pinning a tag with agents failed:  pin: .../my home/.claude/agents/ordo-a.md does not link to .../my home/.local/share/ordo-stable/agents/ordo-a.md
R2 (agents_of globs agents/*): FAIL: first pin links the agents: pinning a tag with agents failed:  pin: .../.claude/agents/notes.txt does not link to .../ordo-stable/agents/notes.txt
R9 (the same_dir dedupe replaced by :): FAIL: one parent, one agent folder: expected the line "pinned: 2 agents linked in: /private/tmp/pin-plain.oZXUG5/agents" in: pinned: a1 (e07970f), 2 skills linked in: /private/tmp/pin-plain.oZXUG5/a, /private/tmp/pin-plain.oZXUG5/b
R14 (the real-file refusal replaced by :): FAIL: an agent name that is a real file: the real-file refusal has no message; expected "pin: .../ordo-a.md is a real file; move it away and run again" in: pin: .../ordo-a.md links to , outside Ordo; move it away and run again
R20 (the both-folders refusal replaced by :): FAIL: a skill folder that is an agent folder: the both-folders refusal has no message; expected "pin: /private/tmp/pin-plain.Ai2SR9/p/agents is both a skill folder and an agent folder" in: pin: /private/tmp/pin-plain.Ai2SR9/p/agents/beta does not link to .../ordo-stable/skills/beta
RX (reviewer's own revert: pin.sh:300 tag_agents takes every path under agents/, notes.txt and sub/x.md included): PASS: pin.sh scratch tests

Verify 6: ls -la ~/.claude/agents -> "No such file or directory"; git -C ~/.local/share/ordo-stable describe --tags --exact-match -> v2.5.0; ls ~/.local/share/ordo-stable/agents -> "No such file or directory". No trace of a pin.sh run against the real HOME.

Verify 7: the orchestrator's at landing; not run.

Commands the report quotes, rerun:
wc -l agents/*.md -> 6 each for ordo-high, ordo-low, ordo-max, ordo-medium, ordo-xhigh (report: 6 each; matches)
wc -l -> utils/pin.test.sh 692, plan-orchestration 322, refute 167, spec 276, plan-help 96, plan-terms.md 93, glossary 109, README 165, change-standard 81; the base has pin.sh 284 and pin.test.sh 380 (git show <base>:utils/pin.sh | wc -l). All match the report.
grep -n "links every skill and every agent" docs/glossary.md -> 108 (report: docs/glossary.md:108; matches)
grep -n "installed skills and agents change only" docs/dev/change-standard.md -> 80 (matches)
Each agent file compared byte for byte (cmp) with item 1's text at its level: "low equal", "medium equal", "high equal", "xhigh equal", "max equal"; YAML frontmatter parses to name, description and effort only; grep -c -E '^(model|tools):' prints 0 for each.
The report's `sync_rules.py ... --write` output ("written: ...") was not rerun, since it writes; the block's equality is shown by Verify 1's glossary line.

Cases ruling 1, run as ruled: git grep -h -i -E 'ordo|pin\.sh|README' -- skills | sed -E 's/ordo-(<worker_effort>|<reviewer_effort>|<level>|low|medium|high|xhigh|max)//g' | grep -i -E 'ordo|pin\.sh|README' | sort, compared by diff with the same grep at the base (48 lines): diff exit 0, no difference.

LC_ALL=C grep -n '[^ -~]' over every touched file and the report: no output, exit 1.
git status --short: M README.md, docs/dev/change-standard.md, docs/glossary.md, skills/plan-help/SKILL.md, skills/plan-orchestration/SKILL.md, skills/refute/SKILL.md, skills/repo-setup/templates/plan-terms.md, skills/spec/SKILL.md, utils/pin.sh, utils/pin.test.sh; ?? .scratch/2-e-grill/agents/reviews/3s55-report.md, agents/. All inside the brief's paths, the report path as the orchestrator instructed.
Premises sampled at the base: git grep -n -E 'general-purpose|subagent_type' <base> -- skills hits only skills/plan-orchestration/SKILL.md:225; the plan templates' lines 26-27 hold worker_effort and reviewer_effort; git grep -w -i pin <base> -- skills/repo-setup/templates/plan-terms.md exits 1; git grep -i agent <base> -- utils/pin.sh hits only ~/.agents/skills. All reproduce. printenv CLAUDE_CODE_EFFORT_LEVEL exits 1.
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. The five files equal item 1's text at each level (cmp), with no `model` and no `tools` key.
- 2: violated, Spec 1. Everything else in item 2 holds by reading `utils/pin.sh` and by the tests: the folders beside each skill folder (lines 118-135); coinciding folders named once (`same_dir`); the six refusals with the brief's messages before the checkout (lines 350-390); linking, `pin: replaced` and `pin: removed` (lines 428-457); check-mode reports (lines 228-265); the second summary line in both modes (lines 287-288, 472-473); the head comment (lines 34-54); 473 lines. The exception is that a dot-named `.md` file is excluded from being an agent, which the brief did not ask for (Spec 1).
- 3: holds. One test per case of "Cases" (lines 435-688), a tag `a1` with two agents, `notes.txt` and `sub/x.md`, and a tag `a2` without `ordo-b.md`. `run_pin` reads the skills line and the agents line separately (lines 56-65). The header comment lists the new cases. The suite passes. Proof 1 applies to one revert.
- 4: holds. Steps 1 has three new bullets. "The two tiers" bullets say what the item says. "Launching a builder" uses `subagent_type: ordo-<worker_effort>`, with `high` as the default. The Stops preamble reads "six kinds of stop and one refusal", and the new row has four cells. The table has six stop rows before the new row, counted by reading.
- 5: holds. Steps 1 has the check and the dispatch as the effort agent, with the default `high`. The Stops row is resumed by "`/refute` again in a new session". Standards 1 applies to its form.
- 6: holds. The preflight bullet is in Steps 1 before "A refusal here writes nothing". "The brief check" item 1 is changed. The Stops row sits among the refusals, after the preamble's "first three rows are stops".
- 6a: violated, Spec 3. The new cause is listed and the `/refute refuses` line exists in the `/land refuses` form. The new-session condition, however, reads as attached only to unsetting the variable.
- 6b: holds. The term **effort agent** has the brief's text and sits between **Doc text** and **executor**. The four named terms are unchanged (the diff only adds). The synced block equals the template (Verify 1).
- 7: holds. "Install" has the agents paragraph and the `CLAUDE_CODE_EFFORT_LEVEL` sentence. The CLI subsection has the `mkdir -p`, `rm -f`, `cp` commands from a clone. The copy loop and the sentence on updating are changed. "Working on Ordo" changes the opening paragraph, the code comment, the folders paragraph and the check-mode and pin-mode paragraph.
- 8: holds. `docs/glossary.md:108`.
- 9: holds. `docs/dev/change-standard.md:80`.

Cases of the brief's "Cases":

- A first pin links `ordo-a.md` and `ordo-b.md`, creates the folder and prints `pinned: 2 agents linked in:`: met. Test "first pin links the agents" (lines 436-446); red on the base pin.sh (reproduced), red under R1.
- `CLAUDE_CONFIG_DIR` set and `ORDO_SKILL_DIRS` unset: both folders get the links: met. Test "CLAUDE_CONFIG_DIR" (lines 500-513).
- `ORDO_SKILL_DIRS` with two folders: the `agents` folder beside each gets the links: met. Lines 516-524.
- A later tag without `ordo-b.md`: `ordo-b.md` removed with `pin: removed`, `ordo-a.md` kept: met. Lines 537-548.
- A tag with no `agents/`: `pinned: 0 agents` and both links removed: met. Lines 551-560.
- A live-clone link for an agent the tag holds is replaced with `pin: replaced`: met. Lines 563-571.
- `ordo-z.md` into the live clone: refused, exit 1, nothing changed: met. Lines 574-584 (worktree tag and agent links compared).
- `ordo-a.md` a real file: refused, file kept: met. Lines 587-598; R14 red reproduced.
- `ordo-a.md` a link outside Ordo: refused: met. Lines 601-611.
- A user's own `mine.md` and `other.md` are left alone and not reported, with its controls: met. Lines 614-638. The controls' red lines are quoted in the report's revert table (R14 and R15 with a continuing `fail`).
- An agent folder that cannot be written: the check after linking fails with both lines, exit 1: met. Lines 641-650.
- An agent folder path that is a regular file, and an entry `ordo-a.md` that is a directory: each refused before anything changes: met. Lines 653-677.
- Two skill folders under one parent: one agent folder, linked once and named once: met. Lines 527-534; R9 red reproduced.
- A skill folder that is another skill folder's `agents` folder: refused before anything changes: met. Lines 680-688; R20 red reproduced.
- `agents/notes.txt` and `agents/sub/x.md`: neither linked nor counted: met as an end state. Lines 445 and 448-452; R2 is red. The tag-side selection is not proven (Proof 1).
- Check mode passes on a fresh pin and prints the agents line: met. Lines 455-458.
- Check mode fails naming a missing `ordo-a.md` link: met. Lines 461-466.
- Check mode fails naming a live-clone link: met. Lines 469-477.
- Check mode fails naming a link to an agent the pinned tag lacks: met. Lines 480-487.
- Check mode with no agent folder and a tag without agents: passes with `pinned: 0 agents`, folder not created: met. Lines 490-497.
- Each of the five files holds its level in `name`, the description and `effort`, with no `model` and no `tools`: met. Checked with cmp and a YAML parse.
- Each changed text says what its item says, and the grep hits nothing: partial. The grep is met (Verify 4 as ruled, empty). The texts hold except item 6a (Spec 3) and item 2's added dot rule (Spec 1).
- No skill text names Ordo or a path of Ordo: met under cases ruling 1 (diff exit 0).
- A configuration block without the effort keys means `ordo-high`: met by reading. `high` is stated in plan-orchestration Steps 1 and "Launching a builder", in refute Steps 1 and in spec Steps 1. "The brief check" item 1 relies on Steps 1's check.

## 1. Spec

- utils/pin.sh:40-42, 152, 300: "a file that does not end in .md, a name that starts with a dot and anything in a subfolder is not an agent"; `for entry in "$1"/agents/[!.]*.md`; `sed -n 's#^agents/\([^./][^/]*\.md\)$#\1#p'`.
  - What is wrong: item 2 defines an agent as "a file `agents/<name>.md` directly in the tag's `agents/` folder", and excludes only files not ending `.md` and files in subfolders. The build adds a third exclusion, dot-named files. The report lists this as a judgment call, "so listing and counting agree", but the item could be met without it: the count glob could include dot-names.
  - Failure scenario: a tag holding `agents/.review.md` has that agent neither linked nor counted, and check mode reports nothing, where the brief's rule links it.
  - Verdict: item 2 violated. At landing, drop the dot exclusion or get a ruling that keeps it.
- .scratch/2-e-grill/agents/reviews/3s55-report.md, "The cases' first run, on the unchanged tree": the table lists only the code cases.
  - What is wrong: the brief says "A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted". The four reading cases have no first-read entry: the five definitions, the changed texts and the grep, no skill naming Ordo, and the configuration block without effort keys.
  - Failure scenario: the orchestrator cannot tell from the report whether the base tree already met or failed these cases. For example, the base grep for `general-purpose` hit plan-orchestration:225, which is the red that the change turns empty.
  - Verdict: none of the cases' verdicts changes. This is a missing record in the report.
- skills/plan-help/SKILL.md:70-71: "install the effort agents as the plan skills are, or unset CLAUDE_CODE_EFFORT_LEVEL and start a new session, then /spec again" (the same form on the `/refute refuses` line).
  - What is wrong: item 6a asks for "the effort agents installed as the plan skills are, or `CLAUDE_CODE_EFFORT_LEVEL` unset, then a new session", with the new session for both remedies (brief decision 4: whether a session sees an agent file linked after it started is not settled). As written, "and start a new session" belongs only to the unset branch.
  - Failure scenario: a user reads the line, runs `utils/pin.sh <tag>` to install the agents, and types `/spec` again in the same session. The runner may still not list `ordo-high`, so `/spec` refuses again with no explanation of why.
  - Verdict: item 6a violated. The fix is one line at landing: "install the effort agents as the plan skills are, or unset CLAUDE_CODE_EFFORT_LEVEL, then start a new session and /spec again".

## 2. Proof

- utils/pin.sh:300: `tag_agents=$(printf '%s\n' "$tag_files" | sed -n 's#^agents/\([^./][^/]*\.md\)$#\1#p')`.
  - What is wrong: the report says "none of the new cases is an audit". But with revert RX (this line taking every path under `agents/`), `sh utils/pin.test.sh` prints `PASS: pin.sh scratch tests` (reproduced). The selection of a tag's agents from `git ls-tree`, the rule item 2 states for the tag side, is proven by no test. The end state stays the same because the removal loop deletes the link it just made. The report admits the regex revert leaves the result unchanged, which contradicts its "none is an audit".
  - Failure scenario: a later change that widens this regex passes the suite. By reading lines 428-454 under RX, every pin of a tag holding `agents/notes.txt` links it and then prints `pin: removed <HOME>/.claude/agents/notes.txt, which the tag a1 does not hold`, and `ln` prints `No such file or directory` for `sub/x.md`. The pin output then reports removals of files that were never installed.
  - Verdict: the case "notes.txt and sub/x.md" is met for its end state. The test needs an assertion that pin mode prints no `removed` line and no `ln:` error for them.

## 3. Standards

- skills/refute/SKILL.md:45-46 and skills/spec/SKILL.md:74: "Check that the runner lists the effort agent `ordo-<reviewer_effort>` among its agent types and that `CLAUDE_CODE_EFFORT_LEVEL` is unset (...); either failing is the refusal ..." In refute, the dispatch follows as a sub-bullet, "Then dispatch one reviewer ...".
  - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", says two requirements that can each be broken while the other holds, joined by "and" or a semicolon, are two bullets. "Sections, in order", row 5, says Steps has one action per item. Both bullets join two independent checks and the consequence, and refute's item 1 now holds two actions (the check and the dispatch). plan-orchestration Steps 1 splits the same content into three bullets, so the three skills state one rule in two shapes.
  - Failure scenario: a reviewer of a later change to the check cannot tell whether dropping the `CLAUDE_CODE_EFFORT_LEVEL` half is a change to one rule or to part of one. A reader of refute Steps 1 finds the dispatch nested under a check rather than as a step.
  - Verdict: none. Fixable at landing by splitting them as plan-orchestration does.

## 4. Behaviour

- utils/pin.sh:359-390 (the new pin-mode refusals), against the report's "Host- or user-visible changes, before and after".
  - What is wrong: the report states the new linking, the folder creation and the second line. It does not state that pin mode now refuses to run on six new conditions: an agent folder entry `ordo-<level>.md` that is a real file, a directory or a link outside Ordo; a live-clone link for an agent the tag lacks; an agent folder path that is not a folder; and a folder that is both a skill folder and an agent folder. Before the change, `utils/pin.sh <tag>` never looked in `~/.claude/agents`.
  - Failure scenario: a user who installed the agents with the README's own "By copying the folders" loop has real files `~/.claude/agents/ordo-*.md`. That user then works on Ordo and runs `utils/pin.sh <tag>`, which refuses with `pin: <HOME>/.claude/agents/ordo-high.md is a real file; move it away and run again`. Neither the report nor README "Working on Ordo" tells them this happens. README's pin-mode paragraph names only the live-clone refusal.
  - Verdict: none.

## Declined to judge

- Verify 7 (the real launch through `ordo-high`, the tools it gets, the Agent tool's presence): the orchestrator's at landing, as the brief says.
- Whether Claude Code loads a dot-named `.md` file in `~/.claude/agents`. Its answer decides how much Spec 1 costs, and it takes a launch probe, which this reviewer may not run.
- Whether the 3s55 builder's prompt carried the cases ruling `3-cases.md`. The report's first line and "Wrong or impossible in the brief" raise the ordo-grep case as unruled. The diff meets the ruling (diff exit 0), so this changes no verdict. The prompt was not read.
- Agent folders that coincide only through a symlinked parent, on a first pin before either folder exists: `same_dir` compares them as two strings, so the agents line would name both. No case of the brief covers this, and the skill folders are not deduplicated either. Not judged as a defect.
- The report's first-run results for each case under a copy of the test with a non-exiting `fail`: only the first FAIL line on the base pin.sh was reproduced (it matches). The per-case table was not rebuilt.
- The report's revert rows R3 to R8, R10, R12, R13, R15, R16, R18, R19 and R21 to R24 were not reproduced. The sample was R1, R2, R9, R14 and R20, all red as the report quotes.

Reviewer usage: 177523 tokens, 38 tool uses, 506 s (from its completion notice).
