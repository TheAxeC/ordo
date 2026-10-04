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
