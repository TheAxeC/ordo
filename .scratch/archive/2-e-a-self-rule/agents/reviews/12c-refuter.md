# Step 12c refuter report (on .agents/worktrees/12c, base a9df87f)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Verify 1, from the worktree root: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0:

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
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

Verify 2: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.

Verify 3: `grep -m1 version: ...` printed:

```
skills/plan/SKILL.md:  version: "2.0.0"
skills/spec/SKILL.md:  version: "2.0.0"
skills/refute/SKILL.md:  version: "2.0.0"
skills/plan-orchestration/SKILL.md:  version: "3.0.0"
skills/land/SKILL.md:  version: "1.9.0"
skills/ordo-help/SKILL.md:  version: "2.0.0"
skills/repo-setup/SKILL.md:  version: "2.0.0"
```

and `git show 9fc91dc:skills/<s>/SKILL.md | grep -m1 version:` printed plan 1.10.1, spec 1.7.0, refute 1.7.1, plan-orchestration 2.10.1, land 1.8.2, ordo-help 1.8.3, repo-setup 1.2.1.

Verify 4: `git -C <worktree> status --short` lists the 17 modified paths of "Paths this step writes" (with `skills/repo-setup/SKILL.md`, added by the cases ruling C) and `?? .scratch/2-e-a-self-rule/agents/reviews/12c-report.md`; `git diff --stat a9df87f` ends `17 files changed, 335 insertions(+), 87 deletions(-)`.

Verify 5: `git grep -n -I -e 'one deliverable and one dispatch' -e 'drafted from the gate' -e 'one step per verifiable' -e 'becomes a test of the step,' -- skills docs README.md` printed nothing, exit 1.

Verify 7: `LC_ALL=C grep -n '[^ -~]'` over each file of `git diff --name-only a9df87f` and the report printed nothing.

Verify 6, rerun on my own split of the kept `utils/pin.test.sh` (lines 1 to 683 as the common body, each case block cut from the file, the silent versions with only the control lines removed), under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute-12c/split/`, each run as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <case>.sh`, the first FAIL or pass line, `<S>` for the scratch root:

```
### unchanged pin.sh (git show a9df87f:utils/pin.sh)
== P1: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
== P2: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
== P3: FAIL: <S>/my home/.claude-aux/skills/beta does not link into the pin
== P4: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
== P5: FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin
== P6: FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"
== P7: P7: pass
== P8: FAIL: check mode passed with a stale link in a ~/.claude-* folder
== P9: P9: pass
== P10: FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"
== P11: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
== P12: FAIL: a pin over a real folder in a ~/.claude-* folder: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold
### unchanged pin.sh, silent lines alone
silent P2: pass / silent P3: pass / silent P4: pass / silent P6: pass / silent P10: pass / silent P11: pass
### final pin.sh
P1 to P12: each "<case>: pass"; silent P2, P3, P4, P6, P10, P11: each "silent <case>: pass"
### mutations of the final pin.sh (the builder's changes, re-made in my own mut.py)
== P1 with M1: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
== P2 with M2: FAIL: pin.sh created agents skills in a config folder with no skills folder
== P3 with M3: FAIL: the skills line names <S>/my home/.claude-work/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude-aux/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude-work/skills
== P4 with M2: FAIL: pinning beside a regular file named .claude-x failed:  mkdir: <S>/my home/.claude-x: Not a directory
== P5 with M5: FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin
== P6 with M6: FAIL: pin.sh created an agents folder beside a skills folder that is another folder's link
== P7 with M7: FAIL: pin.sh linked into a config folder ORDO_SKILL_DIRS does not name
== P8 with M1: FAIL: check mode passed with a stale link in a ~/.claude-* folder
== P10 with M10: FAIL: the skills line names "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude//skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"
== P10 with M3 (drop the dedupe, the ruling's change): FAIL: the skills line names <S>/my home/.claude/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude/skills
== P11 with M2: FAIL: pinning beside a skills file and a broken skills link failed:  mkdir: <S>/my home/.claude-y/skills: File exists
== P12 with M12: FAIL: a pin over a real folder in a ~/.claude-* folder: the pinned worktree moved
```

Each line matches the builder's first-run table and kind 5 table.

Edge runs of my own on the same body (final `pin.sh`, and the unchanged one where named), quoted under Behaviour: a `~/.claude-*` name ending in a newline (edge1.sh), a name with glob characters `.claude-[w]*?` (pinned and linked once, status 0), `~/.claude-work` a link to `~/.claude` (one folder, check mode passes), and `CLAUDE_CONFIG_DIR=~/.claude-alt` with `~/.claude-alt/skills` a link to `~/.claude/skills` (edge5.sh).

Read-only `ls -d ~/.claude-*`, `ls -d ~/.claude-*/skills`, `ls ~/.claude-work/skills`, `ls -d ~/.claude-work/agents` give what the report's host-visible section states (`.claude-science` without skills, `.claude-work/skills` with the ten links and `synced`, no agents folder).

## Verdicts

Items of the brief's "What to build":

- 1: holds. `skills/plan/SKILL.md` Steps 2 drafts from the goal as its parts with every sub-rule of the ruling and Decision 1, "The number of steps follows from the parts of the entry" is no target, the closing and the gate's question stay, the bookkeeping sentence is gone from Rules, the template's opening line and placeholders follow. `git grep` for "bookkeeping step", "number of steps", "<n> steps", "step per" finds no count rule (only `plan` Steps 3's record "<n> steps" of a drafted list, unchanged). The definition in Rules is narrower than the template's and the glossary's: Standards 2.
- 2: holds. `spec` Steps 4 states the fix text as the part's requirements, dictation only where wording is the requirement, "Every requirement the part is judged on is known and written into the brief"; the anti-pattern row and "fix text" stay; brief-check's "The step line" maps requirements.
- 3: holds. The three sentences are on main's text: `templates/brief.md` "Cases" bullets 1 to 3, `spec` Steps 4's sub-bullet "A case of a code step is a test only where the rules file's test rule calls for one, and otherwise a run the report quotes", `refute` Spec heading word for word. Verify 4 of `brief.md` gains "A case checked by a quoted run is no test". The refute report template is left behind: Standards 1.
- 4: holds. Kind 1 unchanged (check 8). Kind 2 in "Report" as the character-set check's line. Kind 3 in "Report". Kind 4 as Verify 5 of `brief.md`, generic. Kind 5 as a "Cases" bullet limited to a case kept as a test. Kind 6 as a "Cases" placeholder bullet.
- 5: holds. "What earns a step of its own" lists the reasons; `refute` "Finding dispositions", `land` Rules, `spec` "Steps / A stop" (with the `/roadmap add` destination) and "Steps / A ruling", `ordo-help` rows 77 and 82, `references/self-rule.md` kind 3 and "Closing an open item" 3, and the state template point at it. `git grep` for "becomes a step", "only by a ruling", "beyond the brief", "scope", "fits no step" finds no text that still says a finding never becomes a step or that only the user's ruling adds one. Two names for one boundary remain: Standards 4.
- 6: holds. **step** and **part, of an entry** changed and added in `plan-terms.md`, synced; **ruling** corrected. `grep -n 'A step is a part' skills/plan/SKILL.md` prints 83 (Steps 2) and 197 (Rules); "What earns a step of its own" opens with "A step is a part of the entry".
- 7: holds for what the item states. `utils/pin.sh:105-110` builds the list in the brief's order with dedupe by path and resolved path; the refusal loop `utils/pin.sh:383-405` (skills) and `:344-382` (agents) runs over every folder of the list, glob folders included, before the checkout at `:407`. Head comment and README's pin section changed, Install section unchanged. Findings on edges and on the README sentence: Behaviour 1 and 2, Standards 3.
- 8: holds. Each version is one raise against 9fc91dc, the major part for the six skills Decision 2 names, `land` 1.9.0.

Cases of the brief's "Cases":

- T1: met, by reading `plan` Steps 2: the hook script, its test and the offer that copies it are one step ("content known in advance"), the gate's check inside it, the user's reading of the offer blocks nothing.
- T2: met, by reading: "The runs and decisions of that kind that need the same step are one step of their own after it, such as a skill the user runs in a fresh session and the blind comparison".
- T3: met, by reading: one build step, "A gate's check runs inside the step that delivers what it checks".
- T4: met, by reading `plan-orchestration` Steps 8 "Sent back.".
- T5: met, by reading "whatever files it reaches, and the round's brief widens the path list".
- T6: met, by reading "What earns a step of its own" ("a landed part found wrong or short") and `land` Rules; the self-rule route and ADR 0004's ending are unchanged.
- T7: met, by reading the same section.
- T8: met, by reading "Work outside the entry's goal" and `spec` "Steps / A stop".
- T9: met, by reading Steps 8 "Not sent back." and the Stops row.
- T10: met, by reading `spec` "Steps / A ruling" 2 and "What earns a step of its own".
- T11: met, by reading `spec` Steps 4 and `templates/brief.md` "What to build".
- T12: met, by reading `templates/brief.md` "Cases" and `refute`'s Spec heading; the pin cases are kept tests with kind 5 named.
- T13: met, by the greps under item 1.
- P1, P5, P8, P11, P12: met, each fails on the unchanged script and passes on the final one (rerun above).
- P2, P3, P4, P6, P10: met, silent lines pass before and after, controls fail before (rerun above).
- P7, P9: met, pass whole before and after (rerun above).

## 1. Spec

none

## 2. Proof

- `.scratch/2-e-a-self-rule/agents/reviews/12c-report.md`, "Verify 6", kind 5 table, row P10: "`CLAUDE_CONFIG_DIR` strips one trailing slash instead of all (`sed 's#/$##'`)"; what is wrong: the cases ruling B (`agents/briefs/12c-cases.md`) fixes kind 5's change for P3 and P10 as "drop the dedupe"; the report gives that change for P3 only and a different one for P10. My rerun shows P10 does catch the ruled change (`== P10 with M3: FAIL: the skills line names <S>/my home/.claude/skills 2 times, expected once`), so the test is sound and only the report departs from the ruling; failure scenario: a reader checking the report against the ruling finds P10's ruled mutation unquoted and cannot tell from the report whether P10 catches a dropped dedupe; verdict: none. Fixable at landing by adding the quoted line.

## 3. Standards

- `skills/refute/templates/report.md:20`: "- <the case>: met, <the test or the reading that gives the expected result>; ..."; what is wrong: the diff changes `refute` "The verdicts" so a case is also met by "the run the report quotes", and leaves the skill's own report template naming only a test or a reading. The file is outside "Paths this step writes", and the report does not name it among files the change makes false, as the brief's paths rule and the rules file's rule 14 require; failure scenario: a reviewer filling the template for a pin-like case checked by a quoted run has no slot for it and writes "not verifiable" or raises a "no test" finding the Spec heading no longer allows; verdict: none.
- `skills/plan/SKILL.md:197`: "- A step is a part of its entry, as Steps 2 says, built by one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it."; what is wrong: the glossary's **step** ("... or run by the orchestrator without an agent") and `templates/plan.md` line 3 give the alternative of a step the orchestrator runs; the Rules definition the glossary cites as "Stated in" gives every step one dispatch of its executor, and the next bullet only keeps the mark. The rules file's rule 19 (no two statements that contradict each other); failure scenario: `/plan` or `/spec` reading Rules alone treats the closing or a user-read run as needing a dispatched executor; verdict: none. Fix: add "or run by the orchestrator without an agent" to the Rules bullet.
- `README.md:180`: "`pin.sh` links the agents into the `agents` folder beside each skill folder: `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder, ..."; what is wrong: no agents are linked in a `~/.claude-*` folder that has no `skills` folder (P2 asserts nothing is created in `.claude-science`) or whose `skills` folder resolves to another folder of the list (P6 asserts no `.claude-alt/agents`). The rules file's rule 14 (a sentence the change makes false); failure scenario: a user with `~/.claude-science` reads that its agents folder is pinned and expects the effort agents there; verdict: none. Fix: "of each `~/.claude-*` folder whose `skills` folder is linked".
- New bullets and sentences against `docs/dev/skill-layout.md` "Lists and tables" (one rule per bullet) and the prose standard "E. Sentence shapes", "Sentence length" (under roughly 20 words unless the mechanism needs more), each read on its own:
  - `skills/plan/SKILL.md:89`: "A run the builder itself makes, read by the user, is part of the step's check, and the user's reading blocks nothing after it." Two requirements joined by "and", each breakable alone; two bullets.
  - `skills/plan/SKILL.md:87` (42 words): "The runs and decisions of that kind that need the same step are one step of their own after it, such as ...". The rule is 20 words; the examples can be a sub-bullet. The builder's reason ("a bullet with the rule alone leaves the examples as a fragment") does not hold, since a sub-bullet "Such as ..." is the layout's form for a condition or example.
  - `skills/spec/SKILL.md:113` (41 words): "The fix text, which is the requirements of the step's part in the brief's own words, not a pointer: what must hold when the part is done, the files it touches with the constraint each is under, and the behaviour." A list folded into a sentence; the three parts are sub-bullets.
  - `skills/spec/templates/brief.md:14` (58 words): the "What to build" placeholder joins the requirements and the dictation rule with a semicolon; `spec` Steps 4 already states them as two bullets, so the template carries one placeholder per rule.
  - `skills/plan-orchestration/SKILL.md:131`: "**Sent back.** A finding inside the step's part goes back in the repair rounds, whatever files it reaches, and the round's brief widens the path list." Two actions joined by "and".
  Failure scenario: a reviewer checking a later diff against one of these bullets cannot tell where one rule ends, and Verify 8's claim "Each new or changed bullet holds one rule" is not borne out by these places; verdict: none.
- `skills/land/SKILL.md` (Steps 6 "small and inside the brief", Rules), `skills/refute/SKILL.md` "Steps / Over a repair round" 7 "small and inside the brief", against `skills/plan-orchestration/SKILL.md` "What earns a step of its own" "The work the last round leaves undone inside the part. It is fixed at landing when small"; what is wrong: one boundary is now named "inside the brief" in `land`, `refute` and `diagnose` and "inside the step's part" in `plan-orchestration`; the prose standard "D. Structure", "No synonym cycling"; failure scenario: an orchestrator at landing reads `land`'s "inside the brief" narrowly as the brief's path list and raises an open item for a small fix `plan-orchestration` would fix at landing; verdict: none. Low weight, since the brief now states the part.

## 4. Behaviour

- `utils/pin.sh:106-107`: "for dir in "$HOME"/.claude-*/skills; do / [ -d "$dir" ] && add_skill_dir "$dir""; what is wrong: a `~/.claude-*` folder name is untrusted input that reaches a path (rules file, rule 15), and the list is newline-separated. A folder named `.claude-a<newline>` holding `skills` splits into the entries `$HOME/.claude-a` and `/skills`, both absolute, so the whitespace and absolute-path check at `:128-136` passes. My run (edge1.sh, pin to v4 from v3): status 1, the pinned worktree moved `before=v3 after=v4`, `$HOME/.claude-a` created with links `beta` and `gamma`, `$HOME/agents` created with `ordo-a.md`, then `mkdir: /skills: Read-only file system` and `pin: the links do not match the pin after linking`. The unchanged script on the same home: status 0. A name with a newline in the middle gives a relative second entry and refuses the whole pin with "is not an absolute path". The report states neither, and no case covers it; failure scenario: one oddly named `~/.claude-*` folder makes `utils/pin.sh <tag>` move the worktree, write links into a folder that is not a skills folder and into `~/agents`, and exit 1 half done; verdict: none. Fix inside the part: skip (or refuse before anything changes, naming it) a glob result that holds a newline, with a case in `pin.test.sh`.
- `utils/pin.sh:87-94` (`add_skill_dir` dedupe by resolved path) with `:140-141` (agent folders beside the deduplicated list); what is wrong: with `CLAUDE_CONFIG_DIR=~/.claude-alt` and `~/.claude-alt/skills` a link to `~/.claude/skills`, the unchanged script linked the agents into `~/.claude-alt/agents` and the changed one does not. My run (edge5.sh): final `pin.sh`: `pinned: v3 (...), 2 skills linked in: <S>/my home/.claude/skills` and `ls ~/.claude-alt/agents: No such file or directory`; unchanged `pin.sh`: `2 skills linked in: <S>/my home/.claude/skills, <S>/my home/.claude-alt/skills` and `~/.claude-alt/agents` holds `ordo-a.md` and `ordo-b.md`. The same holds for a glob-found `~/.claude-alt` (P6 asserts the agents folder is not created). The report's host-visible section does not state this before and after; failure scenario: an account run with `CLAUDE_CONFIG_DIR=~/.claude-alt` whose skills folder shares `~/.claude`'s loses its effort agents at the next pin, and `/refute` and `/spec` there refuse with "The configured effort cannot apply"; verdict: none. Whether such a folder keeps its own agents folder is a choice inside item 7; the brief's dedupe rule speaks of skill folders only, so the agents consequence is the builder's, asserted by P6 without being named as a judgment call.

## Declined to judge

- Whether Decision 1's reading of "built on it" is what the user meant by the ruling "Steps by part": the user's call; I judged the text against the brief and the ruling only.
- Glob order under shells other than the system `sh` (Decision 4): not run; only `/bin/sh` on this machine was used.
- `utils/pin.sh` in check or pin mode against the real home folder: not run, as the brief forbids; the change in check mode's result on this machine is read from the code and the read-only `ls` above, as the report also says.
- Step 9's two scratch plans drafted by the new rule, part of the step line's check: they belong to step 9, which runs after this step lands.
- Whether `ordo-help` and `repo-setup` take the major raise: Decision 2 applies the rule's major clause with a reason I find consistent with "its output is changed"; the choice between major and minor for a changed printed sequence is not settled further by a read.
- The mutations for P12's link-outside and agent-file sub-cases (my M12b and M12c) fail already in the existing body of `pin.test.sh`, so the run does not show which lines of P12 catch them; P12's own lines are shown to catch M12 only.

Reviewer usage: agent id not visible to the reviewer, claude-opus-5-5, tokens not known to the reviewer, about 45 tool uses, minutes not measured.

## Repair round 1, refuted

Every finding of the brief's eight is closed as its ruling says. My own rerun reproduces the builder's quoted failures and mutations. I found one defect in `utils/pin.sh` (a variable read before it is set when `ORDO_SKILL_DIRS` is set), one test whose distinguishing input does nothing, and three smaller points in what the report states. All are low weight and none changes a verdict.

### Verification (rerun by the reviewer)

Verify 1, from `/Users/axelfaes/workspace/ordo/.agents/worktrees/12c`: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, foreground, exit 0:

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
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

Other commands of the brief's "Verify before you report", rerun:
- `grep -m1 version:` over the seven skills printed plan 2.0.0, spec 2.0.0, refute 2.0.0, plan-orchestration 3.0.0, land 1.9.0, ordo-help 2.0.0, repo-setup 2.0.0.
- `git -C <worktree> status --short` lists 18 modified paths, all in "Paths this step writes" with `skills/repo-setup/SKILL.md` (cases ruling C) and `skills/refute/templates/report.md` (the round's brief), plus the untracked report. `git diff --name-only a9df87f | wc -l` printed 18.
- `git grep -n -I -e 'one deliverable and one dispatch' -e 'drafted from the gate' -e 'one step per verifiable' -e 'becomes a test of the step,' -- skills docs README.md` printed nothing, exit 1.
- `LC_ALL=C grep -n '[^ -~]'` over the 18 changed files and the report printed nothing.
- `dash utils/pin.test.sh` with a `sh` symlink to `/bin/dash` first in PATH, so `pin.sh` itself ran under dash, printed `PASS: pin.sh scratch tests`.

Pin cases, rerun on my own split of `utils/pin.test.sh`. The common body is lines 1 to 689, and each case block is cut by its header comment. Each case ran as `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <case>.sh`. The first FAIL or pass line follows, with `<S>` for the scratch root. The files are under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute-12c-r1/`.

```
### unchanged pin.sh (git show a9df87f:utils/pin.sh)
P1: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
P2: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
P3: FAIL: <S>/my home/.claude-aux/skills/beta does not link into the pin
P4: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
P5: FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin
P6: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
P7: P7: pass
P8: FAIL: check mode passed with a stale link in a ~/.claude-* folder
P9 (the existing body alone): P9: pass
P10: FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"
P11: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
P12: FAIL: a pin over a real folder in a ~/.claude-* folder: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold
P13: FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold
P14: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
### unchanged pin.sh, silent lines alone (control lines deleted)
silent P2, P3, P4, P10, P11, P14: each "silent <case>: pass"
### final pin.sh
P1 to P14 and P9: each "<case>: pass"; silent P2, P3, P4, P10, P11, P14: each "silent <case>: pass"
### mutations of the final pin.sh (my own edits, run on the case alone)
P6 with agent_sources=$skill_dirs: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
P14 with agent_sources=$skill_dirs: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
P6 with the dedupe comparing spelling only: FAIL: the skills line names "<S>/.../.claude/skills, <S>/.../.claude-alt/skills, <S>/.../.claude-work/skills", expected "<S>/.../.claude/skills, <S>/.../.claude-work/skills"
P13 with the newline test never matching (*"$nl"*) becomes *"$nl$nl$nl"*)): FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: the pinned worktree moved
P3 with the dedupe dropped (false && return 0): FAIL: the skills line names <S>/my home/.claude-work/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, ...
P10 with the dedupe dropped: FAIL: the skills line names <S>/my home/.claude/skills 3 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude/skills
P14 with the dedupe dropped: FAIL: the skills line names <S>/my home/.claude/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, ...
P1 and P8 with the glob loop adding nothing: P1 FAIL ".claude-work/skills/beta does not link into the pin", P8 FAIL "check mode passed with a stale link in a ~/.claude-* folder"
P2, P4, P11 with the glob taking every ~/.claude-* entry and appending /skills: P2 FAIL "pin.sh created agents", P4 FAIL "mkdir: ...: Not a directory", P11 FAIL "mkdir: .../.claude-y/skills: File exists"
P5 with [ -d $dir ] unquoted: FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin
P7 with the glob also run under ORDO_SKILL_DIRS: FAIL: pin.sh linked into a config folder ORDO_SKILL_DIRS does not name
P10 with CLAUDE_CONFIG_DIR stripping one trailing slash: FAIL: the skills line names "<S>/.../.claude/skills, <S>/.../.claude-work/skills, <S>/.../.claude//skills", expected "<S>/.../.claude/skills, <S>/.../.claude-work/skills"
P12 with the real-directory refusal of the skill loop turned into ":": FAIL: the real folder in a ~/.claude-* folder was not refused with its message
```

Each line matches the report's tables for P1 to P14 on the unchanged script, the silent lines, and the kind 5 table (rows P1 to P8, P10 to P14), apart from the wording of P12's failure under my own edit of the refusal (it fails at the message check; the report's edit fails one check later at "the pinned worktree moved"). The report's P9 mutation row (`$HOME/.claude-default/skills` added to the default list) I did not re-make; P9 passes on both scripts as quoted. The cases ruling's own wording for P3 and P10 is "drop the dedupe", and P3 and P10 both fail with it.

### Closure of each finding

1. P10's kind 5 change: closed. The report's Verify 6 table now has the row "P10 | drop the dedupe" with the failing line, beside the trailing-slash row. My run of P10 with the dedupe dropped printed the same "3 times" line. The test is unchanged.
2. `skills/refute/templates/report.md`: closed. Line 20 now reads "met, <the test, the run the report quotes or the reading that gives the expected result>", the three of `refute` "The verdicts". I read the rest of the template (Verification block, the four heading placeholders, the repair-round block, Closed). Nothing else of it is made false. `git grep` for "the test or the reading" and "a test or a reading" across skills, docs, README.md and utils finds nothing left.
3. `skills/plan/SKILL.md` Rules: closed. `grep -n -E '^- A step (is|the orchestrator)'` shows lines 199 to 201: the definition with its command, both executors ("one dispatch of its executor ..., or run by the orchestrator without an agent"), and the mark. The glossary **step** entry and `templates/plan.md` line 3 say the same (`git grep -n 'one dispatch of its executor'`).
4. README agents sentence and the `utils/pin.sh` head comment: closed. I read README.md:180 and the head comment lines 41 to 48 against the code and the cases. They match: agents folders beside `~/.claude/skills`, each `~/.claude-*/skills` that is a folder (a link to another skills folder included), `$CLAUDE_CONFIG_DIR/skills`, or beside each folder of `ORDO_SKILL_DIRS`. A `~/.claude-*` folder with no `skills` folder gets none (P2, P4, P11, P6, P14). The newline refusal is stated in both places (P13). The sentence that check mode refuses too is missing: Behaviour 2.
5. List items and sentence length: closed for the five named places, which are two bullets at `plan` Steps 2 (lines 90 and 91), a sub-bullet at 88, three sub-bullets at `spec` Steps 4 (113 to 116), four placeholders in `templates/brief.md` "What to build", and a sub-bullet at `plan-orchestration` Steps 8 (131 to 132). The sweep is on the diff and reasonable. I ran my own sentence-length pass over every added line of the changed `.md` files (`long.py`). Every sentence past 25 words is named in Verify 8, so the "named with why" requirement holds. The README paragraph is named there as "27, 32 and 27 words", but its middle sentence is 42 words (my count of README.md:180: 27, 19, 6, 42, 15, 27, 8). The reason given for the paragraph covers it. Standards 3 notes it. Several pointers in `land`, `refute`, `orchestrator-state.md` and `plan-orchestration` Reports and Rules were rewritten to point at "What earns a step of its own" instead of restating its authority clause. That matches the original brief's item 5 ("the other places point at it rather than restating it"), and the meaning is the same. I cannot say which of them were made in this round: see Declined to judge.
6. One boundary under two names: closed. `docs/glossary.md:71` and `plan-terms.md:66` hold "A brief states its step's part, so a fix inside the brief is inside the step's part." Sync prints `ok`. No other "inside the brief" changed (`git grep -n -i "inside the brief"` is as before). Standards 2 is a small point on that entry's "Stated in".
7. Newline in a `~/.claude-*` name: closed. `utils/pin.sh:115-124` refuses before anything changes. P13 fails on the unchanged script ("exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md ...") and passes on the final. The named mutation (the newline test never matching) makes P13 fail with "the pinned worktree moved". Beyond P13: with the final script a folder `.claude-a<newline>b/skills` (newline in the middle) is refused with `pin: '<S>/home/.claude-a\nb/skills' holds a newline; move the folder or set ORDO_SKILL_DIRS`, and no pinned worktree was created. Behaviour 2 is about check mode.
8. Agents folder of a config folder whose `skills` is a link: closed. P6 in its new form fails on the unchanged script at `<S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin`. P14's silent lines pass on the unchanged and the final script, its control fails on the unchanged one, and its kind 5 change (`agent_sources=$skill_dirs`) fails both P6 and P14 with the quoted line. Dropping the dedupe fails P14 with "2 times". No check was removed to get there. The fix does reach slightly beyond finding 8, in how agents folders are compared under `ORDO_SKILL_DIRS`; see Behaviour 3. Proof 1 concerns P14's strength.

### Verdicts (whole diff since a9df87f)

Items of the brief's "What to build":
- 1: holds. `plan` Steps 2 (lines 83 to 95), Rules (199 to 201) and `templates/plan.md` follow the ruling. The greps for the old phrases print nothing.
- 2: holds. `spec` Steps 4 states the fix text as the part's requirements with dictation only where wording is the requirement, and "Every requirement the part is judged on is known and written into the brief". The anti-pattern row and "fix text" stay. `brief-check.md` "The step line" maps requirements.
- 3: holds. The three research-hub sentences are in `templates/brief.md` "Cases", `spec` Steps 4's sub-bullets and `refute`'s Spec heading. The refute report template now carries the quoted run too (finding 2).
- 4: holds. Kind 1 is unchanged (check 8). Kinds 2, 3, 4, 5 and 6 are in `templates/brief.md` "Report", "Cases" and "Verify before you report" 5.
- 5: holds. "What earns a step of its own" is the one list of reasons, and the other places point at it.
- 6: holds. **step** and **part, of an entry** are in `plan-terms.md` and synced, and **ruling** is corrected.
- 7: holds for every input the brief names. `utils/pin.sh` builds the list in the brief's order, dedupes by path and resolved path, refuses a real folder or an outside link, refuses a newline in a glob folder, and ignores a file or broken link. Behaviour 1 is an input outside the brief's cases.
- 8: holds. Versions as listed above, one raise each against 9fc91dc.

Cases:
- T1 to T13: met, by the same readings as the first refuter report, reread against the final text. The round's changes do not touch them. T4 and T5 read `plan-orchestration` Steps 8 lines 131 to 134. T6 to T8 read "What earns a step of its own" (lines 298 to 316). T10 reads `spec` "Steps / A ruling" 2. T12 reads `templates/brief.md` "Cases" and `refute`'s Spec heading. T13: no count rule in any changed sentence.
- P1, P5, P8, P12, P13: met. Each fails on the unchanged script and passes on the final one, and each named mutation makes it fail.
- P2, P3, P4, P10, P11: met. The silent lines pass on both scripts, the control fails on the unchanged one, and the final passes whole.
- P6: met in its new form (fails on the unchanged script at the agents link).
- P7, P9: met (pass whole on both).
- P14: met as the round's brief states it. Its silent lines pass on both, its control fails on the unchanged script, and the whole case passes on the final script. Proof 1 gives a limit of the case.

### 1. Spec

none

### 2. Proof

- `utils/pin.test.sh:761` (the case for `CLAUDE_CONFIG_DIR=$HOME/.claude-alt`, P14): "export CLAUDE_CONFIG_DIR=$HOME/.claude-alt"; what is wrong: the case is written for the `CLAUDE_CONFIG_DIR` route, but the glob also finds `~/.claude-alt`, so the variable changes nothing. I ran the block without that line on the final `pin.sh` (`P14noenv.sh`): `P14: pass`. The report's judgment call says P14 and P6 share their mutation; the kind 5 table gives P6 and P14 the same change. A `CLAUDE_CONFIG_DIR` folder outside the glob (such as `~/config`) whose `skills` is a link to another skills folder is checked by no case. The brief named `.claude-alt`, so this is the brief's choice. P14 as built adds a second run of P6's input; failure scenario: a later edit that drops `$CLAUDE_CONFIG_DIR/skills` from the agent sources only when it is a link outside the glob passes every case, and a user with `CLAUDE_CONFIG_DIR=~/config` and `~/config/skills` a link loses the effort agents again; verdict: none (P14 met as the brief words it). Low weight.

### 3. Standards

- `.scratch/2-e-a-self-rule/agents/reviews/12c-report.md`, "Host- and user-visible changes", second bullet: "Round 0 of this step linked only `~/.claude/agents`, so Claude Code run with that config folder found no effort agents."; what is wrong: the report carries a sentence about an earlier state of the same unlanded step, which no host ever had. The user's global rule is that a report states the end state and a mistake corrected inside the task does not appear in it, and "Anything in the brief that was wrong or impossible" also opens with "Wrong, as ruled in round 0". The before for a host is main's behaviour, which the bullet also gives; failure scenario: the user reads that a landed state linked fewer agent folders than main and looks for what was left undone; verdict: none. Fix: delete that sentence.
- `skills/repo-setup/templates/plan-terms.md:66` and `docs/glossary.md:71`, entry **part, of an entry**, "Stated in: `plan`, Steps 2; `plan-orchestration`, "What earns a step of its own"": the added sentence "A brief states its step's part, so a fix inside the brief is inside the step's part." is stated in neither section. `spec` Steps 4 states it ("The fix text is the requirements of the step's part", `skills/spec/SKILL.md:113`). The glossary's convention is that "Stated in" names the sections that state the entry's content, and the report's Terms section checks only the two named sections; failure scenario: a reader following "Stated in" to confirm the sentence finds it in neither place; verdict: none. Fix: add `spec`, Steps 4, then sync.
- `.scratch/2-e-a-self-rule/agents/reviews/12c-report.md`, Verify 8: "`README.md` "Working on Ordo", the pin paragraph (three sentences of 27, 32 and 27 words)"; what is wrong: the middle sentence of README.md:180 is 42 words ("`pin.sh` links the agents into these `agents` folders, each once: ..."), not 32. The 32 comes from splitting at the colon. The sentence is named with its reason, so Verify 8's requirement is met; no decision rests on the figure; verdict: none.
- I checked the rest of the diff against the Standards bullets: no history in code comments (head comment and test comments say what and why), ASCII clean, no new `static` or global mutable beyond shell variables, no public surface without its page (the README and the head comment carry the pin change), no size limit in `docs/dev/` to exceed, and the long-sentence set matches Verify 8.

### 4. Behaviour

- `utils/pin.sh:114` and `:163`: "default_dirs="$HOME/.claude/skills"" (set only inside the `else` branch) and "agent_sources=${default_dirs:-$skill_dirs}" (read on every path). What is wrong: with `ORDO_SKILL_DIRS` set, `default_dirs` is never assigned by the script, so a variable of that name in the environment is used as the agent sources. My run on the final script (`ORDO_SKILL_DIRS=$HOME/.claude/skills default_dirs=<S>/other/skills sh pin.sh v1`): `pinned: 1 agents linked in: <S>/other/agents`, `<S>/other/agents` created, and `~/.claude/agents` not touched. The unchanged script with the same environment linked into `<S>/home/.claude/agents`. Without `ORDO_SKILL_DIRS` the script always sets `default_dirs`, and a stray `agent_sources`, `skill_dirs`, `agent_dirs` and `default_dirs` in the environment changed nothing in the default mode (all four set to `junk`, pin to `v1`, exit 0, correct folders). Failure scenario: a user who exports a variable named `default_dirs` in a shell profile and pins with `ORDO_SKILL_DIRS` gets the effort agents linked into a folder Claude Code does not read, with the agents line naming it and no error; verdict: none (outside the brief's cases and P7). Fix: assign `default_dirs=` before the `if`, or build `agent_sources` inside each branch.
- `utils/pin.sh:115-124` (the refusal) with README.md:180 and the report's "Host- and user-visible changes", first bullet: the report states "a `~/.claude-*/skills` path that holds a newline is refused before anything changes (round 1)" under pin mode only. The refusal is built before the mode test, so check mode refuses too. My run on the final script: a pin to v1, then `<S>/home/.claude-a<newline>/skills` created, then `sh pin.sh` with no tag printed `pin: '<S>/home/.claude-a\n/skills' holds a newline; move the folder or set ORDO_SKILL_DIRS`, exit 1. The unchanged script's check mode passes on such a home. Failure scenario: a user with such a folder runs check mode, which used to pass, and the report gave no sign it would fail; verdict: none. The README sentence "stops the pin before anything changes" has the same gap.
- `utils/pin.sh:174-178` (`add_agent_dir` using `same_folder`) and the report's "Judgment calls", the bullet "Round 1: `add_agent_dir` compares agents folders with `same_folder` ...": under `ORDO_SKILL_DIRS` the unchanged script deduped agent folders by path only, and the final also dedupes by resolved path. My run, `ORDO_SKILL_DIRS="<S>/a/skills <S>/b/skills"` with `<S>/b` a link to `<S>/a`: the unchanged script printed `pinned: 1 agents linked in: <S>/a/agents, <S>/b/agents` (pin and check mode), the final prints `pinned: 1 agents linked in: <S>/a/agents`. The change is host-visible (the agents line) and the report states it only as "(before: the same path only)" in "Judgment calls", not in "Host- and user-visible changes" with the before and after lines. No test covers it: with `add_agent_dir` reduced to a path-only compare, the whole `utils/pin.test.sh` still prints `PASS`. The failure costs nothing (the link is made once either way), so I raise no Proof finding for it; failure scenario: a script that parses the agents line of an `ORDO_SKILL_DIRS` run sees one folder where it saw two; verdict: none. The brief's wording ("each agents folder once by path and by resolved path") asks for it.

### Declined to judge

- Which of the pointer rewrites in `land`, `refute`, `orchestrator-state.md` and `plan-orchestration` Reports and Rules (to "What earns a step of its own") were made in this round and which earlier: no tree state was recorded when the round was sent, and the files hold no mark. I judged them as part of the whole diff against the original brief's item 5, where they match.
- Whether `utils/pin.sh` behaves the same under shells other than `/bin/sh` (bash in POSIX mode) and `dash`: not run (zsh, ksh, busybox).
- `utils/pin.sh` against the real home folder: not run, as the brief forbids. The check mode result on this machine is read from the code and the report's read-only `ls` output, not from a run.
- Step 9 and the user's reading of Decision 1's "built on it": the user's call or later steps.
- A newline inside `$HOME` or inside `CLAUDE_CONFIG_DIR` (as opposed to a `~/.claude-*` name): the finding names the glob, and the report records the call. A trailing newline in `CLAUDE_CONFIG_DIR` is removed by the new code, and one in the middle splits the list as it did before.

Reviewer usage: agent id not visible to the reviewer, claude-sonnet-5-5, tokens not known to the reviewer, about 60 tool uses, minutes not measured.

## Closed

The first run's findings went back to the builder as repair round 1 (`agents/briefs/12c-round-1.md`), and the run over the round confirms each closed ("Closure of each finding" above). The findings of the run over round 1 are fixed at landing on main, each small and inside the step's part:

- Proof 1 (P14 does not exercise `CLAUDE_CONFIG_DIR`): `utils/pin.test.sh`, the P14 case now names `$HOME/config`, a folder the glob does not find, whose `skills` is a link to `~/.claude/skills`. Unchanged `pin.sh`: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` (the control), silent lines alone `oldsilent: pass`. Final: `new: pass`. With `agent_sources=$skill_dirs`: `FAIL: <S>/my home/config/agents/ordo-a.md does not link into the pin`.
- Behaviour 1 (`default_dirs` read from the environment under `ORDO_SKILL_DIRS`): `utils/pin.sh` sets `default_dirs=` before the branch. With `ORDO_SKILL_DIRS=$HOME/.claude/skills` and `default_dirs=<S>/other/skills` exported, the script before the fix printed `pinned: 2 agents linked in: <S>/other/agents`; after it, `pinned: 2 agents linked in: <S>/my home/.claude/agents`.
- Behaviour 2 (check mode also refuses a newline name): `README.md`'s pin section now says the newline stops pin mode and check mode; the builder's report's host-visible bullet says the same.
- Behaviour 3 (agent folders under `ORDO_SKILL_DIRS` now also deduplicated by resolved path): stated in the landing booking with its before and after.
- Standards 1 (a sentence about the step's own earlier round in the builder's report): removed.
- Standards 2 (the glossary sentence stated in no named section): `spec`, Steps 4 added to the "Stated in" of **part, of an entry** in `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`.
- Standards 3 (the README sentence length miscounted): the builder's report now gives 42 words.
