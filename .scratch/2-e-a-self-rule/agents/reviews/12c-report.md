Everything in the brief is done

This report states the tree after repair round 1. The section "Repair round 1" holds the eight findings; the other sections are the step's report as it stands now. Skill and doc text is cited by section or by `grep -n` output; a line number appears only for code (`utils/pin.sh`, `utils/pin.test.sh`) and in a `grep -n` print.

## Open items of the state file

Printed by `sed -n '/^## Open items/,/^## Closed items/p' .scratch/2-e-a-self-rule/orchestrator-state.md` in the worktree: the heading line, then the standing paragraph, and no item.

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.

## The cases ruling (round 0), carried

Source: `.scratch/2-e-a-self-rule/agents/briefs/12c-cases.md` in the main checkout (the worktree's copy of the ledger does not hold it).

- A, the silent pin cases: P2, P4, P6 and P11 keep their `.claude-work/skills` control after the silent assertions; the report quotes the silent assertions passing on the unchanged `pin.sh` (each run alone from a scratchpad copy, never kept) and the control failing there. P7 and P9 pass whole on the unchanged script. P6 is now a case of added behaviour (repair round 1, finding 8) and fails on the unchanged script at its agents assertion; the other silent cases are as ruled.
- B, P3 and P10: cases of preserved behaviour, one folder named once; kind 5's change for each is "drop the dedupe". P10 carries the `.claude-work/skills` control, P3 a glob-only `.claude-aux/skills` control; both controls fail on the unchanged script.
- C, `skills/repo-setup/SKILL.md` joins the paths with its `metadata.version` set to 2.0.0; the rest of the file was read for a sentence the entries **step** and **part, of an entry** make false, and none is.
- Verify 6 reads as the ruling's last paragraph says.

## The cases, first run

### How the pin cases were run

- Each case of `utils/pin.test.sh` was cut out with the body of the file before it into one scratch script (`scratchpad/r1/split/<case>.sh`, made by `scratchpad/r1/split.py`), so every case reports on its own. It runs beside a `pin.sh`: `git show a9df87f:utils/pin.sh` for the unchanged script (`scratchpad/r1/pin.base.sh`), the worktree's `utils/pin.sh` for the final script, a one-line change of that for a mutation.
- Command per case: `cd <the split folder> && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <case>.sh 2>&1 | grep -E '^(FAIL|P[0-9]+: pass|silent P[0-9]+: pass)' | head -1`, the first matching line, `<S>` for the scratch root `/private/var/folders/.../pin-test.XXXXXX`.
- The captures are `scratchpad/r1/run.out` (every case on the unchanged and the final script), `run3.out` (the silent lines alone, unchanged and final) and `run2.out` (the mutation runs), all under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/`. The scripts are `run.sh`, `run3.sh` and `run2.sh` beside them; the runner's command cap would have killed them as one foreground run.
- `silent_<case>.sh` is the same script with the case's control lines deleted.

### P1 to P14 on the unchanged `pin.sh` (a9df87f)

| Case | Result on the unchanged script | First line printed |
|---|---|---|
| P1 pin and check mode link every skill and agent into `~/.claude` and `~/.claude-work` | FAIL | `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P2 `.claude-science` with no skills folder: nothing created | silent lines pass, control fails | silent: `silent P2: pass`; with the control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P3 `CLAUDE_CONFIG_DIR` set to `.claude-work`: once | silent lines pass, control fails | silent: `silent P3: pass`; with the control: `FAIL: <S>/my home/.claude-aux/skills/beta does not link into the pin` |
| P4 `.claude-x` a regular file: ignored | silent lines pass, control fails | silent: `silent P4: pass`; with the control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P5 `.claude-my work/skills` linked | FAIL | `FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin` |
| P6 `.claude-alt/skills` a link to `.claude/skills`: one skills folder, and `.claude-alt/agents` holds every agent | FAIL | `FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin` |
| P7 `ORDO_SKILL_DIRS` set: only its folders | pass, whole | `P7: pass` |
| P8 check mode reads `.claude-work`, pin mode removes the stale link | FAIL | `FAIL: check mode passed with a stale link in a ~/.claude-* folder` |
| P9 no `.claude-*` folder: as before | pass, whole | `P9: pass` (the existing body of `utils/pin.test.sh`, cut at its end, on the unchanged script; capture `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/tasks/buo8foann.output`) |
| P10 `CLAUDE_CONFIG_DIR` set to `~/.claude` before `.claude/skills` exists | silent lines pass, control fails | silent: `silent P10: pass`; with the control: `FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P11 `.claude-y/skills` a file, `.claude-z/skills` a broken link: ignored | silent lines pass, control fails | silent: `silent P11: pass`; with the control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P12 real folder, outside link or real agent file in `.claude-work`: refused before anything changes | FAIL | `FAIL: a pin over a real folder in a ~/.claude-* folder: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold` |
| P13 `.claude-a<newline>/skills` a folder: refused before anything changes | FAIL | `FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold` |
| P14 `CLAUDE_CONFIG_DIR` set to `.claude-alt`, whose skills folder links to `.claude/skills`: skills named once, agents linked | silent lines pass, control fails | silent: `silent P14: pass`; with the control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |

P9 is the existing body of `utils/pin.test.sh`: every case above runs after it, so a case reaching its own line shows it passing, and `sh utils/pin.test.sh` prints `PASS: pin.sh scratch tests` on the final tree (see Verify 1).

P14 as it is: its silent lines (the named-once assertion and the agents links of `.claude-alt`) pass on the unchanged script, its control (`.claude-work/skills` linked) fails there, and the whole case passes on the final script. P2, P3, P4, P10 and P11 are the same shape. P7 and the existing cases pass whole before and after. P1, P5, P6, P8, P12 and P13 fail on the unchanged script and pass on the final one.

### Cases the brief's rules got wrong, and the ruling

The round-0 first run found that Verify 6 and the last paragraph of "Cases" disagree about P2, P4, P6 and P11, that P3 and P10 as "Cases" defines them pass whole on the unchanged script, and that "Paths this step writes" omitted `skills/repo-setup/SKILL.md`. The orchestrator ruled A, B and C each option (a), carried above. Nothing in repair round 1 is a case the brief's rules got wrong.

### T1 to T13, read on the unchanged tree and read again after the change

Each first read is of the unchanged text (`git show a9df87f:<file>` read at the section named); each second read is of the text in the worktree now, by section.

| Case | Unchanged text gives | Text now |
|---|---|---|
| T1 2.G | A step per gate piece: `plan` Steps 2 "one step per verifiable piece of it"; 2.G's gate has four pieces. | One build step plus the closing: `plan` Steps 2 drafts from the goal as its parts; the script, its test and the offer that copies it are one step ("Two parts whose content is known in advance are one step"); "A gate's check runs inside the step that delivers what it checks"; "The user's reading of such a run blocks nothing after it". |
| T2 2.F | A step per gate piece and a step for the skill. | One build step (skill, scripts, forms, agent and wiring: "Wiring in, terms and documentation belong to the step that builds the thing"), one step for the run and the comparison ("The runs and decisions of that kind that need the same step are one step of their own after it", with its sub-bullet "Such as a skill the user runs in a fresh session and the blind comparison ..."), and the closing. |
| T3 Version flag | Steps for the output, the test with its mutation, possibly the gate. | One build step and the closing ("A gate's check runs inside the step that delivers what it checks"). |
| T4 `git -c alias.x=push x` slips through | `plan-orchestration` Steps 8 "Not sent back" read "a finding that changes the scope, a requirement ..." and "a finding beyond the brief" as a stop. | A repair round of step N: Steps 8 "Sent back": "A finding inside the step's part goes back in the repair rounds, whatever files it reaches". No stop, no step. |
| T5 README line outside the paths | The text did not say a round's brief widens the paths; "changes the scope" could read as a stop. | Steps 8 "Sent back" with its sub-bullet "The round's brief widens the path list to those files"; no stop. |
| T6 defect in step N's landed script found during step N+1 | An open item, a step by ruling or self-rule choice (`land` Rules). | `plan-orchestration` "What earns a step of its own": "A part the entry needs that no step builds, or a landed part found wrong or short. It is a new step"; the authority bullet "A new step and a new roadmap entry each need a ruling of the user or, under `self_rule: on`, a choice ..."; `land` Rules points at it; the self-rule route of `references/self-rule.md` is unchanged. |
| T7 a part no step builds | An open item, a step by ruling. | The same section, the same bullet. |
| T8 finding about a different skill | An open item or a step; no roadmap-entry destination. | "What earns a step of its own": "Work outside the entry's goal. It is a new roadmap entry through `/roadmap add` and never a step of this plan"; `spec` "Steps / A stop" gives a stop's options the same destination. |
| T9 fix renames a configuration key | An open item. | An open item: Steps 8 "Not sent back" and the Stops row "A finding that is the user's". |
| T10 ruling on an extra block for an unstarted step | `spec` "Steps / A ruling" 2 allowed rewriting or adding and did not order them. | `spec` "Steps / A ruling" 2 ("a ruling on a part not yet built rewrites that step's line, which then also ends with `(ruling <name>)`, and adds no step") and `plan-orchestration` "What earns a step of its own", "A ruling on a part not yet built". |
| T11 a brief for a part | `spec` Steps 4 "Every item of "What to build" is a change whose content is known"; `templates/brief.md` "file by file". | `spec` Steps 4: "The fix text is the requirements of the step's part", "Text is dictated word for word only where the wording itself is the requirement", "Every requirement the part is judged on is known and written into the brief"; `templates/brief.md` "What to build" has one placeholder per rule; check 8 of `brief-check.md` is unchanged and reads only dictated text. |
| T12 a case whose failure costs nothing, and one that costs something | `templates/brief.md` made every case of a code step a test; `refute` raised a finding for a wording case with no test. | `templates/brief.md` "Cases": a test only when the rules file's test rule calls for one, every other case a quoted run with no kept test, kind 5's change for a kept test; `refute` Spec heading: a finding only where that rule calls for a test, and "met" by "the test, the run the report quotes or the reading"; `refute/templates/report.md` carries the same three. The pin cases are the second kind: `utils/pin.test.sh`, mutations in Verify 6. |
| T13 no count of steps | `git show a9df87f:skills/plan/SKILL.md \| grep -n -i -E 'number of steps\|<n> steps'` prints only the Rulings-bullet template, which records the drafted list's size. | `git diff a9df87f -U0 \| grep '^+' \| grep -i steps` read for count words finds `plan` Steps 2 "The number of steps follows from the parts of the entry" (a statement that no count is set), the Anti-patterns row "Raising a finding inside the step's part as a stop, or as a step of its own" ("the step list grows by a step per finding", a consequence), and the unchanged `<n> steps` record of the Rulings bullet. No rule, target or limit. |

## DONE / NOT DONE

| Item | State | Command that proves it and its output |
|---|---|---|
| 1 `plan` drafts steps by part | DONE | `git grep -n -I -e 'one deliverable and one dispatch' -e 'drafted from the gate' -e 'one step per verifiable' -e 'becomes a test of the step,' -- skills docs README.md` prints nothing, exit 1; text in `plan` Steps 2 (sub-bullets of "The step list is drafted from the entry's goal as its parts"), Rules, `templates/plan.md` |
| 2 `spec` lets a brief state a part | DONE | `spec` Steps 4 ("The fix text is ...", "Every requirement the part is judged on ..."), `templates/brief.md` "What to build", `templates/brief-check.md` "2. The step line" |
| 3 research-hub's three sentences | DONE | `templates/brief.md` "Cases" bullets, `spec` Steps 4 under "Under "Cases"", `refute` Spec heading |
| 4 plan 2.H step 3a | DONE | Kind 1: `grep -n '^## 8' skills/spec/templates/brief-check.md` prints `47:## 8. Dictated text`, nothing changed. Kinds 2, 3: `templates/brief.md` "Report". Kind 4: "Verify before you report" 5. Kind 5: "Cases" (the two bullets on a case kept as a test). Kind 6: "Cases" (the script-inputs placeholder). |
| 5 new work by its reason | DONE | `plan-orchestration` Steps 6, Steps 8, "What earns a step of its own", Stops, Anti-patterns, Reports, Rules; `references/self-rule.md`; `refute` "Finding dispositions"; `land` Rules; `ordo-help`; `spec`; `plan/templates/orchestrator-state.md` |
| 6 glossary | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0 |
| 7 `utils/pin.sh` over every Claude config folder | DONE | `sh utils/pin.test.sh 2>&1 \| tail -1` prints `PASS: pin.sh scratch tests`; the head comment and the README pin section say which folders |
| 8 versions | DONE | Verify 3 below |
| Verify 1 to 8 | DONE | each below |

### Verify 1: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, rerun after repair round 1, exit 0

The whole output as printed. The character-set command is the `$ git ls-files -coz ...` line, which prints nothing and passes; `checks: 11 commands passed` closes the run. It lists the report too, so the run was made with this report on disk and its text already final.

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

### Verify 2

`python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.

### Verify 3: `grep -m1 version: skills/plan/SKILL.md skills/spec/SKILL.md skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/land/SKILL.md skills/ordo-help/SKILL.md skills/repo-setup/SKILL.md`

```
skills/plan/SKILL.md:  version: "2.0.0"
skills/spec/SKILL.md:  version: "2.0.0"
skills/refute/SKILL.md:  version: "2.0.0"
skills/plan-orchestration/SKILL.md:  version: "3.0.0"
skills/land/SKILL.md:  version: "1.9.0"
skills/ordo-help/SKILL.md:  version: "2.0.0"
skills/repo-setup/SKILL.md:  version: "2.0.0"
```

No version line changed in repair round 1 (`git diff -U0 -- skills | grep -n '^[-+] *version:'` is the check below). Each version is one raise against 9fc91dc (`git show 9fc91dc:skills/<skill>/SKILL.md | grep -m1 version:` printed plan 1.10.1, spec 1.7.0, refute 1.7.1, plan-orchestration 2.10.1, land 1.8.2, ordo-help 1.8.3, repo-setup 1.2.1), by `docs/dev/skill-layout.md` "Frontmatter":
- `plan` 2.0.0, `spec` 2.0.0, `refute` 2.0.0, `plan-orchestration` 3.0.0, `repo-setup` 2.0.0, `ordo-help` 2.0.0: the major clause, since under the same inputs their output changes (a different step list, a brief of requirements, no finding for a case checked by a run, a finding sent back instead of raised, a changed plan-terms block, a changed printed sequence).
- `land` stays 1.9.0: only the wording of one Rules bullet changed.

`git diff -U0 -- skills | grep -n '^[-+] *version:'` prints:

```
13:-  version: "1.9.0"
14:+  version: "2.0.0"
26:-  version: "2.11.0"
27:+  version: "3.0.0"
102:-  version: "1.11.0"
103:+  version: "2.0.0"
154:-  version: "1.8.0"
155:+  version: "2.0.0"
183:-  version: "1.3.0"
184:+  version: "2.0.0"
202:-  version: "1.8.0"
203:+  version: "2.0.0"
```

### Verify 4: `git status --short`

```
 M README.md
 M docs/glossary.md
 M skills/land/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/references/self-rule.md
 M skills/plan/SKILL.md
 M skills/plan/templates/orchestrator-state.md
 M skills/plan/templates/plan.md
 M skills/refute/SKILL.md
 M skills/refute/templates/report.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/spec/SKILL.md
 M skills/spec/templates/brief-check.md
 M skills/spec/templates/brief.md
 M utils/pin.sh
 M utils/pin.test.sh
?? .scratch/2-e-a-self-rule/agents/reviews/12c-report.md
```

All 18 modified paths are in "Paths this step writes" (with `skills/repo-setup/SKILL.md` from the cases ruling and `skills/refute/templates/report.md` from the round's brief); the report is the untracked entry.

### Verify 5

`git grep -n -I -e 'one deliverable and one dispatch' -e 'drafted from the gate' -e 'one step per verifiable' -e 'becomes a test of the step,' -- skills docs README.md` prints nothing, exit 1.

### Verify 6: the pin cases

First run on the unchanged script, the final run, and the silent runs are the tables above and below; the mutation table follows.

Silent lines alone, `run3.out`:

```
### UNCHANGED pin.sh (a9df87f), silent lines alone
== silent_P2: silent P2: pass
== silent_P3: silent P3: pass
== silent_P4: silent P4: pass
== silent_P10: silent P10: pass
== silent_P11: silent P11: pass
== silent_P14: silent P14: pass
### FINAL pin.sh, silent lines alone
== silent_P2: silent P2: pass
== silent_P3: silent P3: pass
== silent_P4: silent P4: pass
== silent_P10: silent P10: pass
== silent_P11: silent P11: pass
== silent_P14: silent P14: pass
### done3
```

Every case on the final `pin.sh` (`run.out`, section FINAL):

```
== P1: P1: pass
== P2: P2: pass
== P3: P3: pass
== P4: P4: pass
== P5: P5: pass
== P6: P6: pass
== P7: P7: pass
== P8: P8: pass
== P10: P10: pass
== P11: P11: pass
== P12: P12: pass
== P13: P13: pass
== P14: P14: pass
== silent_P14: silent P14: pass
```

Kind 5 for each kept case: one small change to the final `pin.sh` the case must catch, and the failing line with that change made (`scratchpad/r1/mut2.py <name> <file>` on a scratch copy; each case run alone, `run2.out`):

| Case | Change to `pin.sh` | Failing line with the change made |
|---|---|---|
| P1 | the glob loop adds no folder (`default_dirs=$default_dirs$nl$dir` becomes `:`) | `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P2 | the glob takes every `.claude-*` entry and adds `<entry>/skills` without checking that it is a folder | `FAIL: pin.sh created agents` |
| P3 | drop the dedupe (the folder comparison of `add_skill_dir` becomes `:`) | `FAIL: the skills line names <S>/my home/.claude-work/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, <S>/my home/.claude-aux/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude-work/skills` |
| P4 | the glob takes every `.claude-*` entry and adds `<entry>/skills` without checking that it is a folder | `FAIL: pinning beside a regular file named .claude-x failed:  mkdir: <S>/my home/.claude-x: Not a directory` |
| P5 | the glob result is word-split (`$dir` unquoted) | `FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin` |
| P6 | the dedupe compares the spelling only (`[ "$known" = "$1" ] && return 0`) | `FAIL: the skills line names "<S>/my home/.claude/skills, <S>/my home/.claude-alt/skills, <S>/my home/.claude-work/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P6 | the agent folders are built from the deduplicated list (`agent_sources=$skill_dirs`) | `FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin` |
| P7 | the glob also runs when `ORDO_SKILL_DIRS` is set | `FAIL: pin.sh linked into a config folder ORDO_SKILL_DIRS does not name` |
| P8 | the glob loop adds no folder (`default_dirs=$default_dirs$nl$dir` becomes `:`) | `FAIL: check mode passed with a stale link in a ~/.claude-* folder` |
| P10 | `CLAUDE_CONFIG_DIR` strips one trailing slash instead of all (`sed 's#/$##'`) | `FAIL: the skills line names "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude//skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P10 | drop the dedupe (the folder comparison of `add_skill_dir` becomes `:`) | `FAIL: the skills line names <S>/my home/.claude/skills 3 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude/skills` |
| P11 | the glob takes every `.claude-*` entry and adds `<entry>/skills` without checking that it is a folder | `FAIL: pinning beside a skills file and a broken skills link failed:  mkdir: <S>/my home/.claude-y/skills: File exists` |
| P12 | the real-directory refusal of the skill loop becomes `continue` | `FAIL: a pin over a real folder in a ~/.claude-* folder: the pinned worktree moved` |
| P13 | the newline test never matches (`*"$nl"*)` becomes `*"$nl$nl$nl"*)`) | `FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: the pinned worktree moved` |
| P14 | the agent folders are built from the deduplicated list (`agent_sources=$skill_dirs`) | `FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin` |
| P14 | drop the dedupe (the folder comparison of `add_skill_dir` becomes `:`) | `FAIL: the skills line names <S>/my home/.claude/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, <S>/my home/.claude-alt/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude-alt/skills` |
| P9 | the default list also adds `$HOME/.claude-default/skills` | `FAIL: the agents line with CLAUDE_CONFIG_DIR set; expected the line "pinned: 2 agents linked in: <S>/my home/.claude/agents, <S>/my home/config/agents" in: pin: removed <S>/my home/.agents/skills/beta, in a folder pin.sh no longer links into` |

Behaviours whose failure costs something, each with its case: `.claude-*` folders linked (P1, P5), a folder with no skills folder left alone (P2), a regular file and a broken link ignored (P4, P11), one folder linked once and named once (P3, P6, P10), a config folder whose skills folder is another folder's link keeps its agents folder (P6, P14), `ORDO_SKILL_DIRS` replacing the list (P7), check mode and pin mode reading the folders (P8), refusal of a real folder, an outside link or a real agent file before anything changes (P12), refusal of a newline in a folder name before anything changes (P13).

What the green result does not cover: the glob order is the shell's (Decision 4), and the tests ran with the system `sh` only. `utils/pin.sh` was never run against the real home folder.

### Verify 7

`LC_ALL=C grep -n '[^ -~]'` over each file of `git diff --name-only a9df87f` and over this report:

```
(scan done)
```

### Verify 8

Each new or changed bullet holds one rule and each Steps item one action, after repair round 1 finding 5 ("Repair round 1", finding 5 lists every split). The new or changed sentences past 25 words are the lines of `python3 scratchpad/long2.py` (words per sentence of every added line of the changed `.md` files, compared with the removed lines of its hunk). The ones that stay, each with why the mechanism needs its length:

- A phrase swapped or a pointer added in an existing long sentence, row or entry, its structure unchanged; each such sentence was already past 25 words before the step. Glossary entries: **ruling** (two sentences) and **step**, which list every "Stated in" of one term in one entry as the entries around them do. `ordo-help` rows "read the delta" and "/spec stops": a row of the printed sequence lists the conditions of one command. `plan-orchestration`: Steps 3 "Its refusal of a step without its authority ..." bullet, Steps 8 "Send the findings back ...", "What earns a step of its own" "A new step and a new roadmap entry each need a ruling ..." (the authority clause, kept whole), the Stops row "A finding that is the user's" and the two Anti-patterns rows "Sending a finding that changes a public shape ..." and "Handing a miss inside the step's part back ...". `spec`: Steps 2 "A premise found false that the plan cannot absorb ...", the brief check's "The step line.", the stop bullet "A finding whose fix would change the part the step builds ...", and the two Stops rows. `refute/templates/report.md` the cases placeholder (it lists the four verdicts with their evidence). `plan/templates/plan.md` the sentence "A step is ticked only after ..." (unchanged text; its line was edited). `spec/templates/brief.md`: the "Cases" bullet "A case of a code step ... becomes a test of the step only when ...", Verify 4's adds-or-changes sub-bullet and audit sub-bullet (unchanged wording of the old item), and the Report bullets "The cases' first run ..." and "It gives the exact lines for that document ...".
- New sentences, each one rule with its condition in the same bullet, which "Lists and tables" requires and which a split would break:
  - `README.md` "Working on Ordo", the pin paragraph (sentences of 27, 42 and 27 words among them): they list the folders `pin.sh` reads and the folders it creates; the list is the mechanism.
  - Glossary and `plan-terms.md` entry **part, of an entry** (44 words): a definition with its qualifier and its "Stated in", as the entries around it.
  - `plan-orchestration`: Steps 6 "Such a case whose fix changes a public shape or an established decision is a stop ..." (27 words: the condition and the stop kind), "What earns a step of its own" "A part the entry needs that no step builds, or a landed part found wrong or short." (28 words: two cases with one outcome, the new step and its tag), Reports "A finding that is neither closed in the repair rounds nor fixed at landing is an open item, which goes where ... says." (29 words: the condition and its destination), and the Anti-patterns row "Raising a finding inside the step's part as a stop, or as a step of its own" (47 words: a row names the habit, its cost and the replacement in three cells).
  - `references/self-rule.md` kind 3 "Rewriting an approved step's text to absorb a found premise or a ruling on a part not yet built, and adding a step, are no reversal." (26 words) and the "Closing an open item" 3 bullet "That bullet is the line "Steps / A ruling" 2 names ..." (33 words): each names the rulings it covers.
  - `plan` Steps 2 "A result is a landed or tagged text, or a run or a decision on it that only the user, or a session other than the step's builder, can make." (30 words: the definition of a result with its exception) and the Stops row "Not yet specified" (53 words: a row of the table).
  - `plan/templates/orchestrator-state.md` the open-items paragraph (39 words) and `plan/templates/plan.md` the step placeholder "<2> <a part the orchestrator runs with the user ...>" (32 words, a template line that lists what the writer fills).
  - `refute` Spec heading "a case of a code step in the brief's "Cases" that the rules file's test rule calls a test for and no test of the step checks;" (27 words: the condition of the finding).
  - `spec` Steps 4 "A case of a code step is a test only where the rules file's test rule calls for one, and otherwise a run the report quotes." (26 words: the rule and its alternative) and "Steps / A ruling" 2 "a ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section as a line with an ending;" (31 words: the cases the Rulings line covers).
  - `spec/templates/brief.md` "Cases" "<for a script, each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected>" (29 words, the open item's kind 6 placeholder), Verify 4 "A test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs." (28 words: the "where it can run there" qualifier stays in the rule), Verify 5 (39 words: the standard, the reading and the report of departures), and the Report bullets "The DONE / NOT DONE table ..." (30 words) and "The terms: ..." (40 words), each one report part with what it must hold.

## Repair round 1

The round's brief is `.scratch/2-e-a-self-rule/agents/briefs/12c-round-1.md` in the main checkout; the findings come from `.scratch/2-e-a-self-rule/agents/reviews/12c-refuter.md` there. "Paths this step writes" gained `skills/refute/templates/report.md`; no other path was added.

### Finding 1: the kind 5 change of P10 (Proof)

What changed: the Verify 6 mutation table above has the row "P10 | drop the dedupe" with the failing line, the change the cases ruling B fixes. The row "P10 | CLAUDE_CONFIG_DIR strips one trailing slash instead of all" stays beside it. The test itself is unchanged.

Shown by the table rows `P10 with M3` and `P10 with M10` in `run2.out`:

```
== P10 with M10: FAIL: the skills line names "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude//skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"
== P10 with M3: FAIL: the skills line names <S>/my home/.claude/skills 3 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude/skills
```

### Finding 2: `skills/refute/templates/report.md`, the cases placeholder (Standards)

What changed: section "Verdicts", the line under "Cases of the brief's "Cases":" now reads "met, <the test, the run the report quotes or the reading that gives the expected result>", the same three `refute` "The verdicts" names. The rest of the template was read for a sentence the step makes false (the Verification block's "each command the report quotes as evidence", the four headings' placeholders, the repair-round block's "the verdicts again for the whole diff", the Closed section): none, and none was changed.

```
$ grep -n 'the case>: met' skills/refute/templates/report.md | cut -c1-200
20:- <the case>: met, <the test, the run the report quotes or the reading that gives the expected result>; or partial, <the missing part>, <the finding>; or unmet, <the finding>; or not verifiable, <w
```

### Finding 3: `skills/plan/SKILL.md` Rules (Standards)

What changed: the Rules bullet "A step is a part of its entry, as Steps 2 says, built by one dispatch ..." is three bullets. The first keeps the definition and the command that proves it, the second states both executors (one dispatch of the executor, or run by the orchestrator without an agent, as the glossary's **step** and `templates/plan.md` say), the third is the unchanged mark rule.

```
$ grep -n -E '^- A step (is|the orchestrator)' skills/plan/SKILL.md | cut -c1-230
199:- A step is a part of its entry, as Steps 2 says, with the command that proves it.
200:- A step is built by one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), or run by the orchestrator without an agent.
201:- A step the orchestrator runs without an agent keeps the mark `orchestrator, no agent` on its line.
```

### Finding 4: the agents sentence of the README's pin section and the head comment of `utils/pin.sh` (Standards)

What changed: `README.md` "Working on Ordo" now says `pin.sh` links the agents into `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder that holds a `skills` folder (one whose `skills` folder is a link to another skills folder included), and `$CLAUDE_CONFIG_DIR/agents` when that variable is set; with `ORDO_SKILL_DIRS` set it links the `agents` folder beside each folder the variable names instead; a `~/.claude-*` folder with no `skills` folder gets no `agents` folder; a `~/.claude-*` folder whose `skills` path holds a newline stops the pin before anything changes. The head comment of `utils/pin.sh` (the paragraphs "The agent folders are the agents folder beside a skill folder" and the newline sentence of the skill-folder paragraph) says the same, and `utils/pin.test.sh`'s head comment lists the cases. These match the code of findings 7 and 8; P2, P4, P6, P11, P13 and P14 assert each statement.

```
$ grep -n -o 'links the agents into these .*gets no .agents. folder' README.md | cut -c1-900
180:links the agents into these `agents` folders, each once: `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder that holds a `skills` folder (one whose `skills` folder is a link to another skills folder included), and `$CLAUDE_CONFIG_DIR/agents` when that variable is set. With `ORDO_SKILL_DIRS` set it links the `agents` folder beside each folder the variable names instead. A `~/.claude-*` folder with no `skills` folder gets no `agents` folder
$ sed -n '/^# The agent folders are the agents folder/,/^# An agent is a file/p' utils/pin.sh
# The agent folders are the agents folder beside a skill folder (the skill folder's parent followed
# by /agents): beside each folder of $ORDO_SKILL_DIRS, or, without it, beside each default skill
# folder found, which are ~/.claude/skills, each ~/.claude-*/skills that is a folder and
# $CLAUDE_CONFIG_DIR/skills. They are built before a skill folder named twice is removed from the
# list, so a config folder whose skills folder is a link to another keeps its own agents folder;
# a ~/.claude-* folder with no skills folder gets none. Agent folders with the same path, trailing
# slashes removed, or, when both exist, the same resolved path are one folder, linked once and
# named once. Pin mode creates an agent folder that does not exist; check mode does not.
# An agent is a file agents/<name>.md directly in the tag's agents/ folder, named by its file name
```

### Finding 5: list items and sentence length (Standards)

The five named places are split; the sweep over every other bullet and sentence the step adds or changes (`git diff -U0` of the skill, template, README and glossary files, read against `docs/dev/skill-layout.md` "Lists and tables" and the prose standard's "Sentence length") split further places. Every split, by file and section:

Named by the finding:
- `plan` Steps 2, "A run the builder itself makes ...": two bullets, "A run the builder itself makes, read by the user, is part of the step's check." and "The user's reading of such a run blocks nothing after it."
- `plan` Steps 2, "The runs and decisions of that kind ...": the rule is the bullet; "Such as a skill the user runs in a fresh session and the blind comparison the user calls on its output." is its sub-bullet.
- `spec` Steps 4, the fix text: "The fix text is the requirements of the step's part, in the brief's own words and not a pointer." with three sub-bullets ("What must hold when the part is done.", "Each file the part touches, with the constraint it is under.", "The behaviour the part has.").
- `spec/templates/brief.md` "What to build": four placeholders, one per rule as `spec` Steps 4 states them (what must hold, each file with its constraint, the behaviour, text word for word only where the wording is the requirement).
- `plan-orchestration` Steps 8 "Sent back.": "A finding inside the step's part goes back in the repair rounds, whatever files it reaches." with the sub-bullet "The round's brief widens the path list to those files."

Found by the sweep:
- `spec/templates/brief.md` "Cases": "becomes a test of the step only when ... calls for a test of it" and "A case kept as a test is run on the unchanged tree first." are two bullets; "the report names one small change ... that the case must catch" and "The report quotes the test's failing line with that change made." are two bullets; "is checked by reading the unchanged tree" and "The first read of a text or judgment case is noted." are two bullets.
- `spec/templates/brief.md` "Verify before you report" 4: a numbered item with four sub-bullets (the adds-or-changes test fails before, the preserves test passes before and after, the audit sentence, the quoted-run sentence).
- `spec/templates/brief.md` "Report": the paragraph of "Then ..." sentences is a bulleted list of the report's parts, with "A line shortened with "..." is not verbatim." and the two "Doc text" sentences as sub-bullets.
- `spec` "Steps / A ruling" 2: the bullet on the Rulings-section line has the two endings as sub-bullets ("(the user)." and "(self-rule).").
- `plan-orchestration` "What earns a step of its own": "The work the last round leaves undone inside the part." has two sub-bullets (small work fixed at landing; other work an open item whose new step needs a reason of the list).
- `plan/templates/plan.md` opening paragraph: "One bullet is one step: a part of the entry." and "A step is built by one dispatch of its executor ..., or run by the orchestrator without an agent (marked)." are two sentences.
- The pointers that restated the authority of "What earns a step of its own" now point at it and nothing more, since that section holds the authority bullet: `land` Rules ("The step that finishes it on top of what landed enters the plan only as ... says."), `refute` "Finding dispositions", `plan/templates/orchestrator-state.md` (the open-items paragraph), `plan-orchestration` Reports ("A finding that is neither closed in the repair rounds nor fixed at landing is an open item, which goes where "What earns a step of its own" says.") and Rules ("It goes where "What earns a step of its own" says."). The meaning is the same: the section's bullet "A new step and a new roadmap entry each need a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books" is the one place that states the authority.

```
$ grep -n -E 'A run the builder itself makes|The user.s reading of such a run|The runs and decisions of that kind|Such as a skill the user runs' skills/plan/SKILL.md | cut -c1-200
87:     - The runs and decisions of that kind that need the same step are one step of their own after it.
88:       - Such as a skill the user runs in a fresh session and the blind comparison the user calls on its output.
90:     - A run the builder itself makes, read by the user, is part of the step's check.
91:     - The user's reading of such a run blocks nothing after it.
$ grep -n -E 'The fix text is|What must hold when the part|Each file the part touches|The behaviour the part has' skills/spec/SKILL.md | cut -c1-200
113:   - The fix text is the requirements of the step's part, in the brief's own words and not a pointer.
114:     - What must hold when the part is done.
115:     - Each file the part touches, with the constraint it is under.
116:     - The behaviour the part has.
$ sed -n '/^## What to build/,/^## Cases/p' skills/spec/templates/brief.md | cut -c1-160
## What to build

<what must hold when the part is done, in the brief's own words>

<each file the part touches, with the constraint it is under: path, purpose, size limit, the shape it must have>

<the behaviour the part has>

<text word for word, only where the wording itself is the requirement, such as a rule sentence the user ruled>

## Cases
$ grep -n -A1 'Sent back' skills/plan-orchestration/SKILL.md | cut -c1-200
131:   - **Sent back.** A finding inside the step's part goes back in the repair rounds, whatever files it reaches.
132-     - The round's brief widens the path list to those files.
```

Sentences that stay past 25 words, each named with why in "Verify 8" above.

### Finding 6: one boundary under two names (Standards)

What changed: `skills/repo-setup/templates/plan-terms.md`, entry **part, of an entry**, gained one sentence: "A brief states its step's part, so a fix inside the brief is inside the step's part." `docs/glossary.md` is synced from it. No other "inside the brief" changed (`land`, `refute`, `diagnose`, `ordo-help`, the glossary's other entries, `docs/dev/change-standard.md`).

```
$ grep -n -o 'A brief states its step.s part[^.]*\.' docs/glossary.md skills/repo-setup/templates/plan-terms.md
docs/glossary.md:71:A brief states its step's part, so a fix inside the brief is inside the step's part.
skills/repo-setup/templates/plan-terms.md:66:A brief states its step's part, so a fix inside the brief is inside the step's part.
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

### Finding 7: a `~/.claude-*` name that holds a newline (Behaviour)

What changed:
- `utils/pin.sh`, the default-folder loop (the block starting `default_dirs="$HOME/.claude/skills"`): a `~/.claude-*/skills` that is a folder and whose path holds a newline stops the run with `pin: '<path, newline written \n>' holds a newline; move the folder or set ORDO_SKILL_DIRS`, before anything changes. The head comment says so.
- `utils/pin.test.sh`: new case P13 (last case) and the helper `home_state`: a folder `.claude-a<newline>` holding `skills`, a pin from v3 to v4 refused with `expect_refused v3`, the error line quoted by `expect_in`, and the whole scratch home (every path and every link target) unchanged.

Failing on the unchanged `pin.sh` (`git show a9df87f:utils/pin.sh`), `run.out`:

```
== P13: FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold
```

Kind 5: one small change to `pin.sh` the case must catch, the newline test never matching (`*"$nl"*)` becomes `*"$nl$nl$nl"*)`), and the failing line with it made, `run2.out`:

```
== P13 with MA: FAIL: a pin with a ~/.claude-* folder whose name ends in a newline: the pinned worktree moved
```

The case passes on the final script (`== P13: P13: pass` in `run.out`). On the default-folder list's other path, a name with a newline in the middle (a relative second entry) is covered by the same refusal, since the test is on the path of the glob result.

### Finding 8: the agents folder of a config folder whose `skills` folder is another folder of the list (Behaviour)

What changed:
- `utils/pin.sh`: the default skill folders are first collected as found into `default_dirs` (`~/.claude/skills`, each `~/.claude-*/skills` that is a folder, `$CLAUDE_CONFIG_DIR/skills` with its trailing slashes removed); the skill list is built from it with `add_skill_dir` (deduplicated as before); the agent folders are built from `agent_sources`, which is `default_dirs` or, with `ORDO_SKILL_DIRS` set, the skill list, through `add_agent_dir`, each agents folder once by path (trailing slashes removed) and by resolved path. The skills line and the skill folders are unchanged by this. The head comment and the README say so (finding 4).
- `utils/pin.test.sh`: P6 changed so `~/.claude-alt/agents` holds a link to each agent of the tag and the agents line names it (`.claude/agents, .claude-alt/agents, .claude-work/agents`); new case P14 for `CLAUDE_CONFIG_DIR=~/.claude-alt` with `~/.claude-alt/skills` a link to `~/.claude/skills`: `~/.claude/skills` named once, `~/.claude-alt/agents` holding a link to each agent, the `.claude-work` control linked.

P6 in its new form on the unchanged script, `run.out`:

```
== P6: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
```

P14 on the unchanged script: the silent lines pass, the control fails there, and the whole case passes after the change (`run.out`, `run3.out`):

```
== P14: FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin
(run3.out, unchanged) == silent_P14: silent P14: pass
(run3.out, final) == silent_P14: silent P14: pass
(final) == P14: P14: pass
```

Kind 5, the agent folders built from the deduplicated list again (`agent_sources=${default_dirs:-$skill_dirs}` becomes `agent_sources=$skill_dirs`), and the failing line for each of the two cases, `run2.out`:

```
== P6 with MB: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
== P14 with MB: FAIL: <S>/my home/.claude-alt/agents/ordo-a.md does not link into the pin
```

Before and after of this behaviour is in "Host- and user-visible changes".

### Verification of the round

- `git diff --stat` and `git status --short` (Verify 4) list the 18 modified paths; no version line changed (Verify 3).
- The verify list, rerun after the round (Verify 1): `checks: 11 commands passed`, exit 0.
- ASCII (Verify 7): the scan printed nothing.

## Terms

Each term of `docs/glossary.md` the diff adds, changes or uses in a new place, read against its entry.

- **part, of an entry**: added; round 1 adds the sentence "A brief states its step's part, so a fix inside the brief is inside the step's part." `grep -n` of the term in the sections it names:

```
$ grep -n 'part, of an entry' docs/glossary.md | cut -c1-90
71:- **part, of an entry**: the work one step of a plan builds, a piece of the entry's goa
$ grep -n -E 'A step is a part|part that must exist' skills/plan/SKILL.md | cut -c1-120
83:     - A step is a part that must exist and work before another part is built on it.
199:- A step is a part of its entry, as Steps 2 says, with the command that proves it.
$ grep -n -F 'What earns a step of its own' skills/plan-orchestration/SKILL.md | head -2 | cut -c1-100
62:   - Its refusal of a step without its authority (the `spec` skill's Steps 1) is raised as a stop
111:   - Such a case whose fix lies outside the step's part goes where "What earns a step of its own
```

- **step**: changed in round 0; `grep -n` in its "Stated in" sections:

```
$ grep -n -E '^- \*\*step\*\*' docs/glossary.md | cut -c1-120
118:- **step**: a plan step, a part of an entry built by one dispatch of its executor with the command that proves it, o
$ grep -n -E 'A step is a part of its entry|Steps 2 says' skills/plan/SKILL.md | cut -c1-140
137:     - Such a line is copied as Steps 2 says for a line the user leaves unplaced, and Open item A names it.
199:- A step is a part of its entry, as Steps 2 says, with the command that proves it.
```

  The Rules of `plan` now state both executors, which the entry also states; Steps 2 and Rules are the two places the entry names.
- **ruling**: changed in round 0; the "Stated in" `spec`, "Steps / A ruling":

```
$ grep -n 'rewrites the line of a step not yet built' skills/spec/SKILL.md | cut -c1-170
265:   - a ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section as a line with an ending;
```

- **fix text**: not a glossary entry; the phrase stays in `spec` Steps 4 ("The fix text is the requirements of the step's part") and in `docs/dev/change-standard.md` ("The brief's fix text is the specification").
- Terms used in their glossary sense: **open item**, **finding**, **repair round**, **stop**, **gate**, **brief**, **brief check**, **acceptance item**, **closing step**, **authority**, **self-rule**, **Step 0**. The word "part" in `skills/repo-setup/SKILL.md` and in "the part in force" of an ADR is the plain word.

## Files with line counts

```
192 README.md
145 docs/glossary.md
230 skills/land/SKILL.md
117 skills/ordo-help/SKILL.md
410 skills/plan-orchestration/SKILL.md
164 skills/plan-orchestration/references/self-rule.md
208 skills/plan/SKILL.md
70 skills/plan/templates/orchestrator-state.md
43 skills/plan/templates/plan.md
196 skills/refute/SKILL.md
67 skills/refute/templates/report.md
253 skills/repo-setup/SKILL.md
128 skills/repo-setup/templates/plan-terms.md
392 skills/spec/SKILL.md
62 skills/spec/templates/brief-check.md
102 skills/spec/templates/brief.md
523 utils/pin.sh
874 utils/pin.test.sh
4176 total
```

(`wc -l` over `git diff --name-only a9df87f`, after the last edit.)

## Judgment calls the brief left open

- Item 3's splits, as `docs/dev/skill-layout.md` "Lists and tables" asks: `spec` Steps 4 holds the first-task sentence as a bullet with three sub-bullets (a code case is a test only where the rules file's test rule calls for one and otherwise a quoted run; a text or judgment case by reading; a case the brief's rules get wrong handed back); `templates/brief.md` "Cases" holds it as bullets, one per rule, with kind 5's change and failing line as two bullets.
- Item 4: kind 2's "the ASCII command's line" is written "the character-set check's line and its exit status included when the verify list holds one" in `templates/brief.md` "Report". Kind 4 is Verify 5 of `templates/brief.md` in the generic form ("the standards pages' rules on list items and sentence length"). Kind 6 is a "Cases" placeholder in the open item's words. Kind 5 is two bullets in "Cases" for a case kept as a test.
- P9 has no block of its own in `utils/pin.test.sh`: the existing cases are P9, and a second block would test the same list. Its kind 5 change is quoted above and the existing body catches it.
- P10 runs three spellings of `CLAUDE_CONFIG_DIR`; `utils/pin.sh` strips every trailing slash of `CLAUDE_CONFIG_DIR`.
- P12 also holds the real agent file in `.claude-work/agents`, since Decision 5 names "a skill or agent of the tag".
- `utils/pin.sh` moved the function `same_folder` above the list building, since the default list calls it; its text is unchanged.
- Round 1: `add_agent_dir` compares agents folders with `same_folder` for both the default list and `ORDO_SKILL_DIRS`, so two sibling agents folders that resolve to one folder are one folder under `ORDO_SKILL_DIRS` too (before: the same path only). The rule of `ORDO_SKILL_DIRS` (the sibling of each folder it names) is unchanged.
- Round 1: P14 is run with the `.claude-alt` folder the finding names, which the glob also finds, so its mutation shares P6's change; P6 holds the glob route and P14 the `CLAUDE_CONFIG_DIR` route.
- Round 1: P13 refuses only a `~/.claude-*/skills` that is a folder (the same test the list uses); a newline in a `~/.claude-*` name whose `skills` is not a folder is ignored like any other non-folder.
- Round 1: `CLAUDE_CONFIG_DIR` holding a newline is not refused: the finding names the glob.
- "Not sent back." in Steps 8 is three bullets: "Sent back.", "Not sent back." (public shape or established decision, a stop) and "Outside the part."; "a requirement" is not carried, since the brief and the ruling name a public shape and an established decision only.
- "What earns a step of its own" keeps the rules "a fix in a file another step holds is made at that step's landing" and "`/spec` refuses a line without its tag", adds the reasons, and carries the path-list widening in Steps 8 "Sent back."
- `plan` Stops row "Not yet specified" reads "no gate for its steps to run", since it relied on the old drafting rule.
- `spec` "Steps / A ruling" 2 and `references/self-rule.md` kind 3 and "Closing an open item" 3 carry the clause that a ruling on a part not yet built rewrites its line, serving item 5's bullet on that ruling.
- `plan-orchestration` Anti-patterns gains a row for raising a finding inside the part as a stop; `refute` "The verdicts" Cases bullets name the run the report quotes.

## Host- and user-visible changes

- `utils/pin.sh <tag>` pin mode, before this step: links the skills into `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills`, and the agents beside each. After: also into the `skills` folder of each `~/.claude-*` folder that holds one, each folder once, each entry a link into the pinned worktree, no folder linked to another; a `~/.claude-*/skills` entry that is a real folder or a link outside Ordo for a skill of the tag, or a real file for an agent of the tag, is refused before anything changes; a `~/.claude-*/skills` path that holds a newline is refused before anything changes, in pin mode and in check mode alike.
- Agents, before and after (finding 8). Before this step, with `CLAUDE_CONFIG_DIR=~/.claude-alt` and `~/.claude-alt/skills` a link to `~/.claude/skills`, the agents were linked into `~/.claude/agents` and `~/.claude-alt/agents`. After this step both are still linked: the agents folders are built from every default skill folder found, before the skill list is deduplicated, so each config folder, glob-found or named by `CLAUDE_CONFIG_DIR`, has its own `agents` folder holding a link to each agent of the tag, whatever its `skills` folder links to. The skills line still names `~/.claude/skills` once. A `~/.claude-*` folder with no `skills` folder gets no `agents` folder (P2, as before this step).
- Check mode reads the same lists. On this machine `ls -d ~/.claude-*` prints `/Users/axelfaes/.claude-science` and `/Users/axelfaes/.claude-work`, and `ls -d ~/.claude-*/skills` prints `/Users/axelfaes/.claude-work/skills` only. `ls -l ~/.claude-work/skills` shows links for `land`, `ordo-init`, `plan`, `plan-help`, `plan-orchestration`, `plan-retro`, `refute`, `repo-setup`, `roadmap` and `spec` into `/Users/axelfaes/.local/share/ordo-stable/skills`, and a real folder `synced`; `ls skills` of this worktree lists `diagnose`, `grill`, `ordo-help` and `session-retro`, which that folder has no link for, and no `plan-help`. So check mode will name those entries and exit non-zero until the next pin, where today it passes over a folder it did not read; `~/.claude-work/agents` does not exist, so the next pin creates it. Not verified: the exact output, since `utils/pin.sh` was not run against the real home folder, and whether the tag the next pin uses holds a skill named `synced` (a real folder of that name is refused by Decision 5).
- `.claude-science` has no `skills` folder, so nothing is created under it.
- The plan skills' text: a plan's steps are parts of the entry; a brief states a part by requirements; a finding inside a part is sent back in the repair rounds and a finding outside it goes by its reason; a case of a code step is a test only where the rules file's test rule calls for one. The installed skills change only through a pin.
- `README.md` "Working on Ordo": before, the folders `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills` with the agents beside each; after, `~/.claude-*` folders too, the agents folders as finding 4 states them, and the newline refusal.

## Anything in the brief that was wrong or impossible, and files outside the paths

- Wrong, as ruled in round 0: Verify 6 and "Cases" on P2, P4, P6 and P11; P3 and P10 passing whole before; the path list lacking `skills/repo-setup/SKILL.md`. Nothing wrong in the round's brief: each of its eight findings was found true on the tree.
- Round 1's brief says P14 is "preserved behaviour: quote it passing on the unchanged script and after the change, with its control". On the unchanged script the control `.claude-work/skills` linked fails, so the whole case passes only on the final script; the silent lines alone pass on both. This is the shape of cases ruling A and is stated that way in "The cases, first run".
- Files outside the paths that the change leaves true (read, not edited): `docs/dev/change-standard.md` and `skills/repo-setup/templates/docs/dev/change-standard.md` ("The brief's fix text is the specification": the phrase stays, defined in `spec` Steps 4); `skills/diagnose/SKILL.md`, `docs/figures/gen_figures.py` and `docs/figures/plan-loop.svg` name the Stops row "A finding that is the user's", whose name is kept; the glossary's **pin** entry and `docs/dev/building.md` do not state the folder lists. `git grep -n -I -i 'agents folder\|agent folder' -- README.md docs skills ':!utils'` finds only an unrelated comment in `skills/session-retro/templates/transcript_window.py`.

## Appendix: every change with its place, before and after

Generated from `git diff -U0 a9df87f` (the section is the nearest heading above the old line; "OLD|" and "NEW|" mark the old and new lines; a hunk with only OLD lines removes text, a hunk with only NEW lines adds text). The version lines are unchanged in this round.

### README.md

- Section: ## Working on Ordo; old line 180, new line 180
  - Old:
    OLD| `pin.sh` links the skills into `~/.claude/skills` and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into the `agents` folder beside each skill folder: `~/.claude/agents`, `$CLAUDE_CONFIG_DIR/agents`, or the sibling of each folder of `ORDO_SKILL_DIRS`. `ORDO_STABLE` moves the pinned worktree to another path.
  - New:
    NEW| `pin.sh` links the skills into `~/.claude/skills`, into the `skills` folder of each `~/.claude-*` folder that holds one, and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`, each folder once. Each entry in those folders is a link into the pinned worktree, and no folder is linked to another. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into these `agents` folders, each once: `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder that holds a `skills` folder (one whose `skills` folder is a link to another skills folder included), and `$CLAUDE_CONFIG_DIR/agents` when that variable is set. With `ORDO_SKILL_DIRS` set it links the `agents` folder beside each folder the variable names instead. A `~/.claude-*` folder with no `skills` folder gets no `agents` folder, and a `~/.claude-*` folder whose `skills` path holds a newline stops the pin before anything changes. `ORDO_STABLE` moves the pinned worktree to another path.

### docs/glossary.md

- Section: ## Plan terms; old line 70, new line 71
  - Old: (nothing)
  - New:
    NEW| - **part, of an entry**: the work one step of a plan builds, a piece of the entry's goal that must exist and work before another piece is built on it, or a point where the user reads or decides before the rest goes on. A later piece is built on an earlier one when it needs the earlier one's result, not only its existence. A brief states its step's part, so a fix inside the brief is inside the step's part. Stated in: `plan`, Steps 2; `plan-orchestration`, "What earns a step of its own".
- Section: ## Plan terms; old line 104, new line 105
  - Old:
    OLD| - **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled". Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees. Stated in: `plan-orchestration`, `references/self-rule.md`, "Closing an open item" and "The review of a choice".
  - New:
    NEW| - **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled". Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees. Stated in: `plan-orchestration`, `references/self-rule.md`, "Closing an open item" and "The review of a choice".
- Section: ## Plan terms; old line 117, new line 118
  - Old:
    OLD| - **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".
  - New:
    NEW| - **step**: a plan step, a part of an entry built by one dispatch of its executor with the command that proves it, or run by the orchestrator without an agent, a line of `plan.md`'s step list ending with its authority. Bookkeeping is done in a commit the orchestrator already makes and is never a step. Stated in: `plan`, Steps 2 and Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".

### skills/land/SKILL.md

- Section: ## Rules; old line 225, new line 225
  - Old:
    OLD|   - The step that finishes it on top of what landed enters the plan only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW|   - The step that finishes it on top of what landed enters the plan only as `plan-orchestration`'s "What earns a step of its own" says.

### skills/ordo-help/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "1.9.0"
  - New:
    NEW|   version: "2.0.0"
- Section: ## The sequence, printed verbatim; old line 77, new line 77
  - Old:
    OLD| read the delta                when plan.yaml says refute_after_repair: no: the orchestrator reads the round and appends what it closed to the refuter report; what is left is raised to you as an open item, and becomes a step only by your ruling, or under self-rule by a choice you review
  - New:
    NEW| read the delta                when plan.yaml says refute_after_repair: no: the orchestrator reads the round and appends what it closed to the refuter report; what is left is raised to you as an open item, and goes where plan-orchestration's "What earns a step of its own" says, by your ruling or under self-rule by a choice you review
- Section: ## The sequence, printed verbatim; old line 82, new line 82
  - Old:
    OLD| /spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, the step contradicts an ADR (a rule clash), the step has stopped twice already and would stop a third time, or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
  - New:
    NEW| /spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the part the step builds, a choice is yours, the step contradicts an ADR (a rule clash), the step has stopped twice already and would stop a third time, or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief

### skills/plan-orchestration/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "2.11.0"
  - New:
    NEW|   version: "3.0.0"
- Section: ## Steps; old line 62, new line 62
  - Old:
    OLD|    - Its refusal of a step without its authority (the `spec` skill's Steps 1) is raised as a stop of the kind "A finding that is the user's", since a step is added to the plan only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW|    - Its refusal of a step without its authority (the `spec` skill's Steps 1) is raised as a stop of the kind "A finding that is the user's", since a step enters the plan only as "What earns a step of its own" says.
- Section: ## Steps; old line 104, new line 104
  - Old:
    OLD|    - Rule on such a case when the fix stays inside the step's scope.
  - New:
    NEW|    - Rule on such a case when the fix stays inside the step's part.
- Section: ## Steps; old line 110, new line 110
  - Old:
    OLD|    - Such a case whose fix changes the step's scope is a stop of the kind "A finding that is the user's", by "Stops".
  - New:
    NEW|    - Such a case whose fix changes a public shape or an established decision is a stop of the kind "A finding that is the user's", by "Stops".
    NEW|    - Such a case whose fix lies outside the step's part goes where "What earns a step of its own" sends it.
- Section: ## Steps; old line 118, new line 119
  - Old:
    OLD| 8. Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the brief and the written rules.
  - New:
    NEW| 8. Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the step's part and the written rules.
- Section: ## Steps; old line 130, new line 131
  - Old:
    OLD|    - **Not sent back.** A finding that changes the scope, a requirement, a public shape or an established decision is raised as a stop, by "Stops".
  - New:
    NEW|    - **Sent back.** A finding inside the step's part goes back in the repair rounds, whatever files it reaches.
    NEW|      - The round's brief widens the path list to those files.
    NEW|    - **Not sent back.** A finding that changes a public shape or an established decision is raised as a stop, by "Stops".
    NEW|    - **Outside the part.** A finding outside the step's part goes where "What earns a step of its own" sends it.
- Section: ## What earns a step of its own; old line 296, new line 300
  - Old:
    OLD| - A step is a large thing: a new capability, or a defect too nasty or too wide to close where it was found.
    OLD| - Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing.
    OLD| - A finding beyond the brief is raised to the user as an open item, by "Stops".
    OLD| - A step's path list is a choice, not a fact: widen it rather than mint a step for what the open step exists to end.
    OLD| - A report that asks for a step says what makes the work new, or nasty, or blocked by something in flight.
    OLD| - A step enters the step list only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books, as a line ending with `(ruling <name>)`.
    OLD|   - `/spec` refuses a line without its tag.
  - New:
    NEW| - A step is a part of the entry, as the `plan` skill's Steps 2 says.
    NEW| - New work goes by its reason, listed below.
    NEW| - **A finding inside the step's part.** It is sent back in the step's repair rounds, as Steps 8 says.
    NEW| - **A fix in a file another step holds.** It is made at that step's landing.
    NEW| - **The work the last round leaves undone inside the part.**
    NEW|   - Small work is fixed at landing.
    NEW|   - Other work is an open item, and a new step for it needs a reason of this list.
    NEW| - **A ruling on a part not yet built.** It rewrites that step's line and brief, the line ending with `(ruling <name>)`, and adds no step.
    NEW| - **A part the entry needs that no step builds, or a landed part found wrong or short.** It is a new step, a line ending with `(ruling <name>)`.
    NEW| - **Work outside the entry's goal.** It is a new roadmap entry through `/roadmap add` and never a step of this plan.
    NEW| - **A finding that changes a public shape or an established decision.** It is an open item, by "Stops".
    NEW| - A new step and a new roadmap entry each need a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
    NEW| - `/spec` refuses a step line without its tag.
    NEW| - A report that asks for a step names the reason of this list that applies.
- Section: ## Reports; old line 310, new line 321
  - Old:
    OLD| - A finding that is neither closed in the repair rounds nor fixed at landing is an open item, since it becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW| - A finding that is neither closed in the repair rounds nor fixed at landing is an open item, which goes where "What earns a step of its own" says.
- Section: ## Stops; old line 345, new line 356
  - Old:
    OLD| | A finding that is the user's | A finding that changes the scope, a requirement, a public shape or an established decision; or one that neither the repair rounds nor a fix at landing close (a finding beyond the brief, work the last round left undone, a changed view not fixed at landing), which becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books | The stop message, below | The user's ruling |
  - New:
    NEW| | A finding that is the user's | A finding that changes a public shape or an established decision; or one that neither the repair rounds nor a fix at landing close (a finding outside the step's part, work the last round left undone, a changed view not fixed at landing), which goes where "What earns a step of its own" says, by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books | The stop message, below | The user's ruling |
- Section: ## Anti-patterns; old line 372, new line 383
  - Old:
    OLD| | Sending a finding that changes the scope, a requirement, a public shape or an established decision back to the builder | The builder then takes a decision for the user | Raise it as a stop |
    OLD| | Handing a miss inside a brief back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or raise it to the user as an open item, by "Stops" |
  - New:
    NEW| | Sending a finding that changes a public shape or an established decision back to the builder | The builder then takes a decision for the user | Raise it as a stop |
    NEW| | Raising a finding inside the step's part as a stop, or as a step of its own | The part is left unfinished, and the step list grows by a step per finding | Send it back in the repair rounds, as Steps 8 says |
    NEW| | Handing a miss inside the step's part back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or raise it to the user as an open item, by "Stops" |
- Section: ## Rules; old line 395, new line 407
  - Old:
    OLD| - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops".
  - New:
    NEW| - Everything else that the rounds left undone, or that lies outside the step's part, is raised to the user as an open item, by "Stops".
- Section: ## Rules; old line 397, new line 409
  - Old:
    OLD|   - It becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW|   - It goes where "What earns a step of its own" says.

### skills/plan-orchestration/references/self-rule.md

- Section: ## The six kinds left open; old line 16, new line 16
  - Old:
    OLD|    - Rewriting an approved step's text to absorb a found premise, and adding a step, are no reversal.
  - New:
    NEW|    - Rewriting an approved step's text to absorb a found premise or a ruling on a part not yet built, and adding a step, are no reversal.
- Section: ## Closing an open item; old line 40, new line 40
  - Old:
    OLD|    - That bullet is the line "Steps / A ruling" 2 names for a ruling that adds or splits a step or runs a skill.
  - New:
    NEW|    - That bullet is the line "Steps / A ruling" 2 names for a ruling that adds or splits a step, rewrites the line of a step not yet built, or runs a skill.

### skills/plan/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "1.11.0"
  - New:
    NEW|   version: "2.0.0"
- Section: ## Steps; old line 82, new line 82
  - Old:
    OLD|    - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
  - New:
    NEW|    - The step list is drafted from the entry's goal as its parts, each step with the check that proves its part.
    NEW|      - A step is a part that must exist and work before another part is built on it.
    NEW|      - A step is also a point where the user reads or decides before the rest goes on.
    NEW|      - A later part is built on an earlier one when it needs the earlier one's result, not only its existence.
    NEW|      - A result is a landed or tagged text, or a run or a decision on it that only the user, or a session other than the step's builder, can make.
    NEW|      - The runs and decisions of that kind that need the same step are one step of their own after it.
    NEW|        - Such as a skill the user runs in a fresh session and the blind comparison the user calls on its output.
    NEW|      - Two parts whose content is known in advance are one step even when one uses the other, such as a script and its setup text.
    NEW|      - A run the builder itself makes, read by the user, is part of the step's check.
    NEW|      - The user's reading of such a run blocks nothing after it.
    NEW|      - A gate's check runs inside the step that delivers what it checks.
    NEW|      - Wiring in, terms and documentation belong to the step that builds the thing.
    NEW|      - Bookkeeping is done in a commit the orchestrator already makes and is never drafted as a step.
    NEW|      - The number of steps follows from the parts of the entry.
- Section: ## Stops; old line 170, new line 183
  - Old:
    OLD| | Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate to draft steps from | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
  - New:
    NEW| | Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate for its steps to run | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
- Section: ## Rules; old line 186, new line 199
  - Old:
    OLD| - A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
  - New:
    NEW| - A step is a part of its entry, as Steps 2 says, with the command that proves it.
    NEW| - A step is built by one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), or run by the orchestrator without an agent.
    NEW| - A step the orchestrator runs without an agent keeps the mark `orchestrator, no agent` on its line.

### skills/plan/templates/orchestrator-state.md

- Section: ## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says); old line 39, new line 39
  - Old:
    OLD| A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.
  - New:
    NEW| A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

### skills/plan/templates/plan.md

- Section: # Plan: <roadmap entry number and title>; old line 3, new line 3
  - Old:
    OLD| Execution ledger for <the roadmap entry, linked>. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.
  - New:
    NEW| Execution ledger for <the roadmap entry, linked>. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.
- Section: ## Steps, in execution order; old line 18, new line 18
  - Old:
    OLD| - <1> <what the step delivers, in one line; the check that proves it> (<n> commit) (approved)
    OLD| - <2> <what the step delivers, in one line; the check that proves it> (<n> commit; orchestrator, no agent) (approved)
    OLD| - <2a> <a step a ruling added, in one line; the check that proves it> (<n> commit) (ruling <L>)
  - New:
    NEW| - <1> <the part the step builds, in one line; the check that proves it> (<n> commit) (approved)
    NEW| - <2> <a part the orchestrator runs with the user, such as a real run read by the user, in one line; the check that proves it> (<n> commit; orchestrator, no agent) (approved)
    NEW| - <2a> <a part a ruling added, in one line; the check that proves it> (<n> commit) (ruling <L>)

### skills/refute/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "1.8.0"
  - New:
    NEW|   version: "2.0.0"
- Section: ## The four headings; old line 115, new line 115
  - Old:
    OLD|   - a case of a code step in the brief's "Cases" that no test of the step checks;
  - New:
    NEW|   - a case of a code step in the brief's "Cases" that the rules file's test rule calls a test for and no test of the step checks;
- Section: ## The verdicts; old line 149, new line 149
  - Old:
    OLD|   - met: the test or the reading gives the expected result;
    OLD|   - partial: the test or the reading gives part of the expected result, with the missing part named;
    OLD|   - unmet: the test or the reading does not give the expected result;
    OLD|   - not verifiable: neither a test nor a reading can settle the case here, with what would settle it.
  - New:
    NEW|   - met: the test, the run the report quotes or the reading gives the expected result;
    NEW|   - partial: the test, the run or the reading gives part of the expected result, with the missing part named;
    NEW|   - unmet: the test, the run or the reading does not give the expected result;
    NEW|   - not verifiable: neither a test, a run nor a reading can settle the case here, with what would settle it.
- Section: ## Finding dispositions; old line 159, new line 159
  - Old:
    OLD|   - It becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW|   - It becomes a step only as `plan-orchestration`'s "What earns a step of its own" says.

### skills/refute/templates/report.md

- Section: ## Verdicts; old line 20, new line 20
  - Old:
    OLD| - <the case>: met, <the test or the reading that gives the expected result>; or partial, <the missing part>, <the finding>; or unmet, <the finding>; or not verifiable, <what would settle it>.
  - New:
    NEW| - <the case>: met, <the test, the run the report quotes or the reading that gives the expected result>; or partial, <the missing part>, <the finding>; or unmet, <the finding>; or not verifiable, <what would settle it>.

### skills/repo-setup/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "1.3.0"
  - New:
    NEW|   version: "2.0.0"

### skills/repo-setup/templates/plan-terms.md

- Section: ## Plan terms; old line 65, new line 66
  - Old: (nothing)
  - New:
    NEW| - **part, of an entry**: the work one step of a plan builds, a piece of the entry's goal that must exist and work before another piece is built on it, or a point where the user reads or decides before the rest goes on. A later piece is built on an earlier one when it needs the earlier one's result, not only its existence. A brief states its step's part, so a fix inside the brief is inside the step's part. Stated in: `plan`, Steps 2; `plan-orchestration`, "What earns a step of its own".
- Section: ## Plan terms; old line 99, new line 100
  - Old:
    OLD| - **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled". Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees. Stated in: `plan-orchestration`, `references/self-rule.md`, "Closing an open item" and "The review of a choice".
  - New:
    NEW| - **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled". Also, under self-rule, the orchestrator's decision on an open item, its line ending "(self-rule)" until the user agrees. Stated in: `plan-orchestration`, `references/self-rule.md`, "Closing an open item" and "The review of a choice".
- Section: ## Plan terms; old line 112, new line 113
  - Old:
    OLD| - **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".
  - New:
    NEW| - **step**: a plan step, a part of an entry built by one dispatch of its executor with the command that proves it, or run by the orchestrator without an agent, a line of `plan.md`'s step list ending with its authority. Bookkeeping is done in a commit the orchestrator already makes and is never a step. Stated in: `plan`, Steps 2 and Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".

### skills/spec/SKILL.md

- Section: (head or top of file); old line 5, new line 5
  - Old:
    OLD|   version: "1.8.0"
  - New:
    NEW|   version: "2.0.0"
- Section: ## Steps; old line 91, new line 91
  - Old:
    OLD|    - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.
  - New:
    NEW|    - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the part the step builds, or make a choice the user would see.
- Section: ## Steps; old line 113, new line 113
  - Old:
    OLD|    - The fix text, in the brief's own words, not a pointer.
  - New:
    NEW|    - The fix text is the requirements of the step's part, in the brief's own words and not a pointer.
    NEW|      - What must hold when the part is done.
    NEW|      - Each file the part touches, with the constraint it is under.
    NEW|      - The behaviour the part has.
    NEW|    - Text is dictated word for word only where the wording itself is the requirement, such as a rule sentence the user ruled.
- Section: ## Steps; old line 117, new line 121
  - Old:
    OLD|      - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a code step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
  - New:
    NEW|      - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change.
    NEW|        - A case of a code step is a test only where the rules file's test rule calls for one, and otherwise a run the report quotes.
    NEW|        - A case of a text or judgment step is checked by reading.
    NEW|        - A case the brief's rules get wrong is handed back before any code changes.
- Section: ## Steps; old line 125, new line 132
  - Old:
    OLD|    - Every item of "What to build" is a change whose content is known.
  - New:
    NEW|    - Every requirement the part is judged on is known and written into the brief.
- Section: ### A stop; old line 225, new line 232
  - Old:
    OLD|      - An option adds a step to the plan only when the work fits no step already in the list.
  - New:
    NEW|      - An option adds a step to the plan only for a reason `plan-orchestration`'s "What earns a step of its own" lists.
    NEW|      - An option for work outside the entry's goal is a new roadmap entry through `/roadmap add`, never a step of the plan.
- Section: ### A ruling; old line 256, new line 264
  - Old:
    OLD|    - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user)." for a ruling of the user, or "(self-rule)." for a choice booked under self-rule;
  - New:
    NEW|    - a ruling on a part not yet built rewrites that step's line, which then also ends with `(ruling <name>)`, and adds no step;
    NEW|    - a ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section as a line with an ending;
    NEW|      - the ending is "(the user)." for a ruling of the user;
    NEW|      - the ending is "(self-rule)." for a choice booked under self-rule;
- Section: ### The brief check; old line 301, new line 312
  - Old:
    OLD|    - **The step line.** Every part of the plan's step line is present in "What to build": each item is mapped to the part of the line it serves, and a part with no item is named.
  - New:
    NEW|    - **The step line.** Every part of the plan's step line is present in "What to build": each requirement is mapped to the part of the line it serves, and a part with no requirement is named.
- Section: ### The brief check; old line 332, new line 343
  - Old:
    OLD|    - A finding whose fix would change the step's scope, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
  - New:
    NEW|    - A finding whose fix would change the part the step builds, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
- Section: ## Stops; old line 350, new line 361
  - Old:
    OLD| | A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
  - New:
    NEW| | A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the part the step builds or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
- Section: ## Stops; old line 353, new line 364
  - Old:
    OLD| | A brief check finding the brief cannot absorb | A finding of the brief check whose fix would change the step's scope or make a choice the user would see, or a finding the session cannot close by a change to the brief ("Steps / The brief check") | The open item, booked in the open items, with the report's path | A ruling |
  - New:
    NEW| | A brief check finding the brief cannot absorb | A finding of the brief check whose fix would change the part the step builds or make a choice the user would see, or a finding the session cannot close by a change to the brief ("Steps / The brief check") | The open item, booked in the open items, with the report's path | A ruling |

### skills/spec/templates/brief-check.md

- Section: ## 2. The step line; old line 13, new line 13
  - Old:
    OLD| - <each part of the plan's step line>: <the item of "What to build" that serves it>; or no item.
  - New:
    NEW| - <each part of the plan's step line>: <the requirement of "What to build" that serves it>; or no requirement.
- Section: ## 2. The step line; old line 15, new line 15
  - Old:
    OLD| Findings: <each part with no item>. Or: none.
  - New:
    NEW| Findings: <each part with no requirement>. Or: none.

### skills/spec/templates/brief.md

- Section: ## What to build; old line 14, new line 14
  - Old:
    OLD| <the deliverable, in the brief's own words, file by file, each with the constraint it is under: path, purpose, size limit, the shape it must have>
  - New:
    NEW| <what must hold when the part is done, in the brief's own words>
    NEW| 
    NEW| <each file the part touches, with the constraint it is under: path, purpose, size limit, the shape it must have>
    NEW| 
    NEW| <the behaviour the part has>
    NEW| 
    NEW| <text word for word, only where the wording itself is the requirement, such as a rule sentence the user ruled>
- Section: ## Cases; old line 19, new line 26
  - Old: (nothing)
  - New:
    NEW| - <for a script, each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected>.
    NEW| 
    NEW| The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted.
- Section: ## Cases; old line 21, new line 30
  - Old:
    OLD| The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted. A case of a code step (a script, or a product's code) becomes a test of the step, run on the unchanged tree first; no prototype script stands in for the test. A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted.
  - New:
    NEW| - A case of a code step (a script, or a product's code) becomes a test of the step only when the rules file's test rule calls for a test of it.
    NEW| - A case kept as a test is run on the unchanged tree first.
    NEW| - No prototype script stands in for such a test.
    NEW| - Every other case of a code step is checked by a run the report quotes, and no test is kept for it.
    NEW| - For each case kept as a test, the report names one small change to the code under test that the case must catch.
    NEW| - The report quotes the test's failing line with that change made.
    NEW| - A case of a text or judgment step is checked by reading the unchanged tree.
    NEW| - The first read of a text or judgment case is noted.
- Section: ## Verify before you report; old line 63, new line 79
  - Old:
    OLD| 4. Each new or changed test of a behaviour the change adds or changes fails on the unchanged tree, in the form it has after its last change, and the report quotes that failure; each new or changed test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs. A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.
  - New:
    NEW| 4. Each new or changed test is run on the unchanged tree and after the change.
    NEW|    - A test of a behaviour the change adds or changes fails on the unchanged tree, in the form it has after its last change, and the report quotes that failure.
    NEW|    - A test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs.
    NEW|    - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.
    NEW|    - A case checked by a quoted run is no test and is not judged as one.
    NEW| 5. Each new or changed list item and sentence is read against the standards pages' rules on list items and sentence length, and each place it departs from them is named in the report with why it needs its form.
- Section: ## Report; old line 67, new line 88
  - Old:
    OLD| Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the cases' first run: each case of "Cases" with its result on the unchanged tree, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
  - New:
    NEW| Write it to `<ledger>/agents/reviews/<step>-report.md`, with these parts in this order.
    NEW| 
    NEW| - The first line: anything NOT done, or "Everything in the brief is done".
    NEW| - The open items of the state file, verbatim, which hold only what the user must rule on.
    NEW| - The cases' first run: every case of "Cases" by its name, none left out, each with the command or the reading that checked it and its output as printed, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling.
    NEW| - The DONE / NOT DONE table with the checks above and their output as printed, the character-set check's line and its exit status included when the verify list holds one.
    NEW|   - A line shortened with "..." is not verbatim.
    NEW| - The terms: each term of `docs/glossary.md` the diff adds, changes or uses in a new place, each use read against the entry, and each changed entry's "Stated in" checked by `grep -n` of the term in the section it names.
    NEW| - The files with line counts.
    NEW| - Every judgment call the brief left open.
    NEW| - Every host- or user-visible change with its before and after.
    NEW| - Anything in the brief that was wrong or impossible, with the evidence.
    NEW| - A section "Doc text", when the brief keeps a shared document out of the step's paths because other steps run beside it.
    NEW|   - It gives the exact lines for that document: the current line as `grep -n` prints it and its replacement, or the line a new one follows.
    NEW|   - The orchestrator applies them at landing.

### utils/pin.sh

- Section: # The skill folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set,; old line 11, new line 11
  - Old:
    OLD| # The skill folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set,
    OLD| # or $ORDO_SKILL_DIRS when set. $ORDO_SKILL_DIRS is split on spaces and tabs, or
    OLD| # read one folder per line when it holds a newline (the form for a folder whose path holds a
    OLD| # space); empty lines are skipped, and a value that names no folder is refused. The default
    OLD| # folders are read one per line, so a home folder holding a space needs nothing. Every skill folder
    OLD| # (from ORDO_SKILL_DIRS, the defaults or $CLAUDE_CONFIG_DIR/skills) must be an absolute path with
    OLD| # no leading or trailing whitespace, or the run is refused before anything changes. The summary
    OLD| # line names the folders joined by ", ".
  - New:
    NEW| # The skill folders are $ORDO_SKILL_DIRS when set. Otherwise they are, in this order, ~/.claude/skills,
    NEW| # the skills folder of each ~/.claude-* folder that holds one (in the order the shell's glob gives;
    NEW| # a ~/.claude-*/skills that is not a folder, a file or a broken link, is ignored), and
    NEW| # $CLAUDE_CONFIG_DIR/skills when that variable is set. A folder named twice is one folder, linked
    NEW| # once and named once: two entries are one when their paths are equal with trailing slashes removed
    NEW| # or, when both exist, when their resolved paths are equal. Each entry of a skill folder stays a link
    NEW| # into the pinned worktree; no folder is linked to another. $ORDO_SKILL_DIRS is split on spaces
    NEW| # and tabs, or read one folder per line when it holds a newline (the form for a folder whose path
    NEW| # holds a space); empty lines are skipped, and a value that names no folder is refused. The default
    NEW| # folders are read one per line, so a home folder holding a space needs nothing, and a
    NEW| # ~/.claude-*/skills folder whose path holds a newline is refused before anything changes, with one
    NEW| # line that names it with the newline written as \n; the user moves the folder or sets
    NEW| # ORDO_SKILL_DIRS. Every skill folder (from ORDO_SKILL_DIRS or the defaults) must be an absolute
    NEW| # path with no leading or trailing whitespace, or the run is refused before anything changes. The
    NEW| # summary line names the folders joined by ", ".
- Section: # The agent folders are the agents folder beside each skill folder (the skill folder's parent; old line 34, new line 41
  - Old:
    OLD| # The agent folders are the agents folder beside each skill folder (the skill folder's parent
    OLD| # followed by /agents): ~/.claude/agents, $CLAUDE_CONFIG_DIR/agents, or the sibling of each
    OLD| # folder of $ORDO_SKILL_DIRS. Agent folders with the same path are one folder, linked once and
  - New:
    NEW| # The agent folders are the agents folder beside a skill folder (the skill folder's parent followed
    NEW| # by /agents): beside each folder of $ORDO_SKILL_DIRS, or, without it, beside each default skill
    NEW| # folder found, which are ~/.claude/skills, each ~/.claude-*/skills that is a folder and
    NEW| # $CLAUDE_CONFIG_DIR/skills. They are built before a skill folder named twice is removed from the
    NEW| # list, so a config folder whose skills folder is a link to another keeps its own agents folder;
    NEW| # a ~/.claude-* folder with no skills folder gets none. Agent folders with the same path, trailing
    NEW| # slashes removed, or, when both exist, the same resolved path are one folder, linked once and
- Section: # that pins, or a check that passes, exits 0.; old line 69, new line 81
  - Old: (nothing)
  - New:
    NEW| # Succeeds when the folders $1 and $2 are one folder: the same path with every trailing slash
    NEW| # stripped, as the agent folders are built, or, when both exist, the same physical path.
    NEW| same_folder() {
    NEW|     same_one=$(printf '%s\n' "$1" | sed 's#//*$##')
    NEW|     same_two=$(printf '%s\n' "$2" | sed 's#//*$##')
    NEW|     [ "$same_one" = "$same_two" ] && return 0
    NEW|     same_one=$(CDPATH= cd -P "$1" 2>/dev/null && pwd -P) || return 1
    NEW|     same_two=$(CDPATH= cd -P "$2" 2>/dev/null && pwd -P) || return 1
    NEW|     [ "$same_one" = "$same_two" ]
    NEW| }
    NEW| 
    NEW| # Appends the folder $1 to skill_dirs unless skill_dirs already holds that folder.
    NEW| add_skill_dir() {
    NEW|     while IFS= read -r known <&4; do
    NEW|         same_folder "$known" "$1" && return 0
    NEW|     done 4<<EOF
    NEW| $skill_dirs
    NEW| EOF
    NEW|     skill_dirs=$skill_dirs$nl$1
    NEW| }
    NEW| 
- Section: # The skill folders, one per line.; old line 79, new line 111
  - Old:
    OLD|     skill_dirs="$HOME/.claude/skills"
    OLD|     if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "${CLAUDE_CONFIG_DIR%/}" != "$HOME/.claude" ]; then
    OLD|         skill_dirs="$skill_dirs$nl${CLAUDE_CONFIG_DIR%/}/skills"
    OLD|     fi
  - New:
    NEW|     # Every default skill folder as found, before a folder named twice is removed: the agent folders
    NEW|     # are built from this list, so a config folder whose skills folder is another folder's link
    NEW|     # keeps its own agents folder.
    NEW|     default_dirs="$HOME/.claude/skills"
    NEW|     for dir in "$HOME"/.claude-*/skills; do
    NEW|         [ -d "$dir" ] || continue
    NEW|         case "$dir" in
    NEW|             *"$nl"*)
    NEW|                 shown=$(printf '%s' "$dir" | awk 'BEGIN { ORS = "" } NR > 1 { print "\\n" } { print }')
    NEW|                 fail "'$shown' holds a newline; move the folder or set ORDO_SKILL_DIRS"
    NEW|                 ;;
    NEW|         esac
    NEW|         default_dirs=$default_dirs$nl$dir
    NEW|     done
    NEW|     [ -z "${CLAUDE_CONFIG_DIR:-}" ] ||
    NEW|         default_dirs=$default_dirs$nl$(printf '%s\n' "$CLAUDE_CONFIG_DIR" | sed 's#//*$##')/skills
    NEW|     skill_dirs=$HOME/.claude/skills
    NEW|     while IFS= read -r dir <&3; do
    NEW|         add_skill_dir "$dir"
    NEW|     done 3<<EOF
    NEW| $default_dirs
    NEW| EOF
- Section: # The agent folders, one per line: the agents folder beside each skill folder, each path once.; old line 111, new line 161
  - Old:
    OLD| # The agent folders, one per line: the agents folder beside each skill folder, each path once.
    OLD| agent_dirs=$(printf '%s\n' "$skill_dirs" |
    OLD|     awk '{ sub(/\/+$/, ""); sub(/\/[^\/]*$/, ""); dir = $0 "/agents" } !seen[dir]++ { print dir }')
  - New:
    NEW| # The agent folders, one per line: the agents folder beside each folder of $agent_sources, each
    NEW| # folder once. $agent_sources is $ORDO_SKILL_DIRS, or every default skill folder found.
    NEW| agent_sources=${default_dirs:-$skill_dirs}
    NEW| agent_dirs=
    NEW| add_agent_dir() {
    NEW|     while IFS= read -r known <&4; do
    NEW|         [ -n "$known" ] || continue
    NEW|         same_folder "$known" "$1" && return 0
    NEW|     done 4<<EOF
    NEW| $agent_dirs
    NEW| EOF
    NEW|     agent_dirs=${agent_dirs:+$agent_dirs$nl}$1
    NEW| }
    NEW| while IFS= read -r dir <&3; do
    NEW|     add_agent_dir "$(printf '%s\n' "$dir" | sed 's#//*$##; s#/[^/]*$##')/agents"
    NEW| done 3<<EOF
    NEW| $agent_sources
    NEW| EOF
- Section: # Succeeds when the folders $1 and $2 are one folder: the same path with every trailing slash; old line 145, new line 209
  - Old:
    OLD| # Succeeds when the folders $1 and $2 are one folder: the same path with every trailing slash
    OLD| # stripped, as the agent folders are built, or, when both exist, the same physical path.
    OLD| same_folder() {
    OLD|     same_one=$(printf '%s\n' "$1" | sed 's#//*$##')
    OLD|     same_two=$(printf '%s\n' "$2" | sed 's#//*$##')
    OLD|     [ "$same_one" = "$same_two" ] && return 0
    OLD|     same_one=$(CDPATH= cd -P "$1" 2>/dev/null && pwd -P) || return 1
    OLD|     same_two=$(CDPATH= cd -P "$2" 2>/dev/null && pwd -P) || return 1
    OLD|     [ "$same_one" = "$same_two" ]
    OLD| }
    OLD| 
  - New: (removed)

### utils/pin.test.sh

- Section: # The default folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills, not ~/.agents/skills, and ~/.agents/agents is not created with them, and ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs.; old line 7, new line 7
  - Old:
    OLD| # The default folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills, not ~/.agents/skills, and ~/.agents/agents is not created with them, and ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs.
  - New:
    NEW| # The default folders are ~/.claude/skills, each ~/.claude-*/skills that is a folder and $CLAUDE_CONFIG_DIR/skills, not ~/.agents/skills, and ~/.agents/agents is not created with them, and ORDO_SKILL_DIRS in its space-separated form is split on spaces and tabs.
- Section: # Check mode prints the agents line, fails naming a missing agent link, an agent link into the live clone and a link to an agent the pinned tag lacks, and with no agent folder and no agents passes without creating the folder.; old line 13, new line 14
  - Old: (nothing)
  - New:
    NEW| # The Claude config folders: pin mode links every skill and agent into ~/.claude and into each ~/.claude-* folder that holds a skills folder, a name with a space included, creating each agents folder; it leaves alone a ~/.claude-* folder with no skills folder and a skills entry that is a regular file or a broken link; a folder reached through CLAUDE_CONFIG_DIR, the glob or a link to another folder is linked once and named once, with or without trailing slashes and before ~/.claude/skills exists; a config folder whose skills folder is a link to another folder of the list keeps its own agents folder, with every agent of the tag, also when CLAUDE_CONFIG_DIR names it; ORDO_SKILL_DIRS leaves these folders alone; check mode reads them and names a stale link, which pin mode removes; pin mode refuses, before anything changes, a real folder or a link outside Ordo for a skill and a real file for an agent in such a folder, and a ~/.claude-* folder whose skills path holds a newline.
- Section: # Two skill folders under one parent share one agents folder, linked once and named once. Red when the agent folders are not deduplicated.; old line 641, new line 643
  - Old: (nothing)
  - New:
    NEW| # The Claude config folders. Without ORDO_SKILL_DIRS the skill folders are ~/.claude/skills, the skills folder of each ~/.claude-* folder that holds one, and $CLAUDE_CONFIG_DIR/skills, each folder once. The pinned worktree is at v3 from here on, which holds the skills beta and gamma and the agents ordo-a and ordo-b. Every case resets the config folders of the scratch home first.
    NEW| unset ORDO_SKILL_DIRS
    NEW| unset CLAUDE_CONFIG_DIR
    NEW| case "$HOME" in
    NEW|     "$test_root"/*) ;;
    NEW|     *) fail "HOME $HOME is outside the scratch root" ;;
    NEW| esac
    NEW| 
    NEW| # Prints every path under the scratch home and each link with its target, to compare the home before and after a run.
    NEW| home_state() {
    NEW|     find "$HOME" | sort
    NEW|     find "$HOME" -type l -exec sh -c 'for link; do printf "%s -> %s\n" "$link" "$(readlink "$link")"; done' sh {} + | sort
    NEW| }
    NEW| 
    NEW| # Removes every Claude config folder of the scratch home.
    NEW| reset_config_folders() {
    NEW|     rm -rf "$HOME/.claude" "$HOME"/.claude-* "$HOME/.agents"
    NEW| }
    NEW| 
    NEW| # expect_pinned <config folder>: each skill and agent of v3 is a link into the pinned worktree in the folder's skills and agents folders.
    NEW| expect_pinned() {
    NEW|     for skill in beta gamma; do
    NEW|         [ "$(readlink "$1/skills/$skill")" = "$ORDO_STABLE/skills/$skill" ] ||
    NEW|             fail "$1/skills/$skill does not link into the pin"
    NEW|     done
    NEW|     for agent in ordo-a ordo-b; do
    NEW|         [ "$(readlink "$1/agents/$agent.md")" = "$ORDO_STABLE/agents/$agent.md" ] ||
    NEW|             fail "$1/agents/$agent.md does not link into the pin"
    NEW|     done
    NEW| }
    NEW| 
    NEW| # expect_folders <skill folders> <agent folders>: the skills line and the agents line of the last run name exactly these folders, in this order.
    NEW| expect_folders() {
    NEW|     skills_line=$(printf '%s\n' "$out" | sed -n 's/^pinned: .*, 2 skills linked in: //p')
    NEW|     agents_line=$(printf '%s\n' "$out" | sed -n 's/^pinned: 2 agents linked in: //p')
    NEW|     [ "$skills_line" = "$1" ] || fail "the skills line names \"$skills_line\", expected \"$1\""
    NEW|     [ "$agents_line" = "$2" ] || fail "the agents line names \"$agents_line\", expected \"$2\""
    NEW| }
    NEW| 
    NEW| # expect_named_once <folder>: the skills line of the last run names the folder exactly once.
    NEW| expect_named_once() {
    NEW|     skills_line=$(printf '%s\n' "$out" | sed -n 's/^pinned: .*, 2 skills linked in: //p')
    NEW|     named=$(printf '%s\n' "$skills_line" |
    NEW|         awk -F ', ' -v folder="$1" '{ for (i = 1; i <= NF; i++) if ($i == folder) n++ } END { print n + 0 }')
    NEW|     [ "$named" -eq 1 ] || fail "the skills line names $1 $named times, expected once: $skills_line"
    NEW| }
    NEW| 
    NEW| # Pin mode links every skill and agent into ~/.claude and ~/.claude-work, creating both agents folders, and check mode reads the same two folders.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning with two config folders failed: $out $err"
    NEW| expect_pinned "$HOME/.claude"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| expect_folders "$HOME/.claude/skills, $HOME/.claude-work/skills" \
    NEW|     "$HOME/.claude/agents, $HOME/.claude-work/agents"
    NEW| run_pin
    NEW| [ "$status" -eq 0 ] || fail "check mode failed on a fresh pin of two config folders: $err"
    NEW| expect_folders "$HOME/.claude/skills, $HOME/.claude-work/skills" \
    NEW|     "$HOME/.claude/agents, $HOME/.claude-work/agents"
    NEW| 
    NEW| # A ~/.claude-* folder with no skills folder gets nothing created in it. The control, after the silent assertion, is the ~/.claude-work folder linked beside it.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-science"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning beside a config folder with no skills folder failed: $out $err"
    NEW| [ -z "$(ls -A "$HOME/.claude-science")" ] ||
    NEW|     fail "pin.sh created $(ls -A "$HOME/.claude-science") in a config folder with no skills folder"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| 
    NEW| # CLAUDE_CONFIG_DIR naming a ~/.claude-* folder that the glob also finds gives one folder, named once. The control, after the silent assertion, is ~/.claude-aux, a folder only the glob finds, linked.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-aux/skills"
    NEW| export CLAUDE_CONFIG_DIR=$HOME/.claude-work
    NEW| run_pin v3
    NEW| unset CLAUDE_CONFIG_DIR
    NEW| [ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR a ~/.claude-* folder failed: $out $err"
    NEW| expect_named_once "$HOME/.claude-work/skills"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| expect_pinned "$HOME/.claude-aux"
    NEW| 
    NEW| # A ~/.claude-* entry that is a regular file is ignored. The control, after the silent assertions, is the ~/.claude-work folder linked beside it.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills"
    NEW| printf 'not a folder\n' >"$HOME/.claude-x"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning beside a regular file named .claude-x failed: $out $err"
    NEW| [ "$(cat "$HOME/.claude-x")" = "not a folder" ] || fail "pin.sh changed the file .claude-x"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| 
    NEW| # A ~/.claude-* folder whose name holds a space is linked.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-my work/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning with a config folder whose name holds a space failed: $out $err"
    NEW| expect_pinned "$HOME/.claude-my work"
    NEW| expect_folders "$HOME/.claude/skills, $HOME/.claude-my work/skills" \
    NEW|     "$HOME/.claude/agents, $HOME/.claude-my work/agents"
    NEW| 
    NEW| # A ~/.claude-*/skills that is a link to ~/.claude/skills is the same skills folder: it is named once in the skills line, and its folder keeps its own agents folder, which holds every agent of the tag and is named in the agents line. The control, after the silent assertion, is the ~/.claude-work folder linked beside it.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-alt"
    NEW| ln -s "$HOME/.claude/skills" "$HOME/.claude-alt/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning with a skills folder that links to another failed: $out $err"
    NEW| expect_named_once "$HOME/.claude/skills"
    NEW| for agent in ordo-a ordo-b; do
    NEW|     [ "$(readlink "$HOME/.claude-alt/agents/$agent.md")" = "$ORDO_STABLE/agents/$agent.md" ] ||
    NEW|         fail "$HOME/.claude-alt/agents/$agent.md does not link into the pin"
    NEW| done
    NEW| expect_folders "$HOME/.claude/skills, $HOME/.claude-work/skills" \
    NEW|     "$HOME/.claude/agents, $HOME/.claude-alt/agents, $HOME/.claude-work/agents"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| 
    NEW| # CLAUDE_CONFIG_DIR naming a folder whose skills folder is a link to ~/.claude/skills: that skills folder is named once, and the folder's agents folder holds every agent of the tag. The control, after the silent assertions, is the ~/.claude-work folder linked.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-alt"
    NEW| ln -s "$HOME/.claude/skills" "$HOME/.claude-alt/skills"
    NEW| export CLAUDE_CONFIG_DIR=$HOME/.claude-alt
    NEW| run_pin v3
    NEW| unset CLAUDE_CONFIG_DIR
    NEW| [ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR a folder whose skills folder links to another failed: $out $err"
    NEW| expect_named_once "$HOME/.claude/skills"
    NEW| for agent in ordo-a ordo-b; do
    NEW|     [ "$(readlink "$HOME/.claude-alt/agents/$agent.md")" = "$ORDO_STABLE/agents/$agent.md" ] ||
    NEW|         fail "$HOME/.claude-alt/agents/$agent.md does not link into the pin"
    NEW| done
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| 
    NEW| # ORDO_SKILL_DIRS replaces the whole list, so a ~/.claude-* folder is left alone. The control is the folder the variable names, linked.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills"
    NEW| export ORDO_SKILL_DIRS="$HOME/.claude/skills$nl"
    NEW| run_pin v3
    NEW| unset ORDO_SKILL_DIRS
    NEW| [ "$status" -eq 0 ] || fail "pinning with ORDO_SKILL_DIRS set failed: $out $err"
    NEW| expect_pinned "$HOME/.claude"
    NEW| [ -z "$(ls -A "$HOME/.claude-work/skills")" ] ||
    NEW|     fail "pin.sh linked into a config folder ORDO_SKILL_DIRS does not name"
    NEW| [ ! -e "$HOME/.claude-work/agents" ] ||
    NEW|     fail "pin.sh created an agents folder in a config folder ORDO_SKILL_DIRS does not name"
    NEW| 
    NEW| # Check mode reads a ~/.claude-* folder and names a link there to a skill the tag lacks; pin mode removes it.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "the first pin of two config folders failed: $out $err"
    NEW| ln -s "$ORDO_STABLE/skills/alpha" "$HOME/.claude-work/skills/alpha"
    NEW| run_pin
    NEW| [ "$status" -ne 0 ] || fail "check mode passed with a stale link in a ~/.claude-* folder"
    NEW| expect_in "$err" \
    NEW|     "pin: $HOME/.claude-work/skills/alpha links to $ORDO_STABLE/skills/alpha, which the pinned tag does not have" \
    NEW|     "check mode did not name the stale link in the ~/.claude-* folder"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning over the stale link in a ~/.claude-* folder failed: $out $err"
    NEW| [ -L "$HOME/.claude-work/skills/alpha" ] && fail "pin mode left the stale link in the ~/.claude-* folder"
    NEW| expect_line "$out" "pin: removed $HOME/.claude-work/skills/alpha, which the tag v3 does not hold" \
    NEW|     "pin mode did not report the removed link in the ~/.claude-* folder"
    NEW| 
    NEW| # CLAUDE_CONFIG_DIR naming ~/.claude, with or without trailing slashes, before ~/.claude/skills exists gives that folder once. The control, after the silent assertion, is the ~/.claude-work folder linked.
    NEW| for spelling in "$HOME/.claude" "$HOME/.claude/" "$HOME/.claude//"; do
    NEW|     reset_config_folders
    NEW|     mkdir -p "$HOME/.claude-work/skills"
    NEW|     export CLAUDE_CONFIG_DIR=$spelling
    NEW|     run_pin v3
    NEW|     unset CLAUDE_CONFIG_DIR
    NEW|     [ "$status" -eq 0 ] || fail "pinning with CLAUDE_CONFIG_DIR $spelling failed: $out $err"
    NEW|     expect_named_once "$HOME/.claude/skills"
    NEW|     expect_folders "$HOME/.claude/skills, $HOME/.claude-work/skills" \
    NEW|         "$HOME/.claude/agents, $HOME/.claude-work/agents"
    NEW|     expect_pinned "$HOME/.claude"
    NEW|     expect_pinned "$HOME/.claude-work"
    NEW| done
    NEW| 
    NEW| # A ~/.claude-*/skills that is a regular file or a broken link is ignored. The control, after the silent assertions, is the ~/.claude-work folder linked beside them.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-y" "$HOME/.claude-z"
    NEW| printf 'not a folder\n' >"$HOME/.claude-y/skills"
    NEW| ln -s "$test_root/missing" "$HOME/.claude-z/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning beside a skills file and a broken skills link failed: $out $err"
    NEW| [ "$(cat "$HOME/.claude-y/skills")" = "not a folder" ] || fail "pin.sh changed the file .claude-y/skills"
    NEW| [ "$(readlink "$HOME/.claude-z/skills")" = "$test_root/missing" ] ||
    NEW|     fail "pin.sh changed the broken link .claude-z/skills"
    NEW| [ ! -e "$HOME/.claude-y/agents" ] && [ ! -e "$HOME/.claude-z/agents" ] ||
    NEW|     fail "pin.sh created an agents folder beside an ignored skills entry"
    NEW| expect_pinned "$HOME/.claude-work"
    NEW| 
    NEW| # A ~/.claude-*/skills holding, for a skill of the tag, a real folder or a link outside Ordo, and a ~/.claude-*/agents holding a real file for an agent of the tag, are each refused before anything changes, naming the entry. The pin to v4 would otherwise move the worktree and unlink ordo-b.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "the pin before the refusals in a ~/.claude-* folder failed: $out $err"
    NEW| mkdir -p "$HOME/.claude-work/skills/beta"
    NEW| skill_links_before=$(links_state)
    NEW| agent_links_before=$(agent_links_state)
    NEW| run_pin v4
    NEW| expect_refused v3 "a pin over a real folder in a ~/.claude-* folder"
    NEW| expect_in "$err" "pin: $HOME/.claude-work/skills/beta is a real directory; move it away and run again" \
    NEW|     "the real folder in a ~/.claude-* folder was not refused with its message"
    NEW| rmdir "$HOME/.claude-work/skills/beta"
    NEW| ln -s /elsewhere/beta "$HOME/.claude-work/skills/beta"
    NEW| run_pin v4
    NEW| expect_refused v3 "a pin over a link outside Ordo in a ~/.claude-* folder"
    NEW| expect_in "$err" \
    NEW|     "pin: $HOME/.claude-work/skills/beta links to /elsewhere/beta, outside Ordo; move it away and run again" \
    NEW|     "the link outside Ordo in a ~/.claude-* folder was not refused with its message"
    NEW| rm "$HOME/.claude-work/skills/beta"
    NEW| mkdir -p "$HOME/.claude-work/agents"
    NEW| printf 'mine\n' >"$HOME/.claude-work/agents/ordo-a.md"
    NEW| run_pin v4
    NEW| expect_refused v3 "a pin over a real agent file in a ~/.claude-* folder"
    NEW| expect_in "$err" "pin: $HOME/.claude-work/agents/ordo-a.md is a real file; move it away and run again" \
    NEW|     "the real agent file in a ~/.claude-* folder was not refused with its message"
    NEW| [ "$(cat "$HOME/.claude-work/agents/ordo-a.md")" = "mine" ] || fail "a refused pin changed the agent file"
    NEW| 
    NEW| # A ~/.claude-*/skills folder whose path holds a newline is refused before anything changes, naming the path with the newline written as \n: the default folders are read one per line, so such a path would split into two entries. The pin to v4 would otherwise move the worktree.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "the pin before the refusal of a newline in a folder name failed: $out $err"
    NEW| mkdir -p "$HOME/.claude-a$nl/skills"
    NEW| skill_links_before=$(links_state)
    NEW| agent_links_before=$(agent_links_state)
    NEW| home_before=$(home_state)
    NEW| run_pin v4
    NEW| expect_refused v3 "a pin with a ~/.claude-* folder whose name ends in a newline"
    NEW| expect_in "$err" "pin: '$HOME/.claude-a\\n/skills' holds a newline; move the folder or set ORDO_SKILL_DIRS" \
    NEW|     "the ~/.claude-* folder with a newline in its name was not refused with its message"
    NEW| [ "$(home_state)" = "$home_before" ] || fail "a pin refused for a newline in a folder name changed the scratch home"
    NEW| 
