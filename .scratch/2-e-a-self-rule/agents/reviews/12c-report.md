Everything in the brief is done

## Open items of the state file

Verbatim from the `## Open items` section of `.scratch/2-e-a-self-rule/orchestrator-state.md` in the worktree (`sed -n '/^## Open items/,/^## Closed items/p'`): the section holds the standing paragraph and no item.

> A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.

The text of that paragraph in the worktree's `skills/plan/templates/orchestrator-state.md` (line 39) now reads "goes where `plan-orchestration`'s "What earns a step of its own" says" in place of "becomes a step in `plan.md` only by a ruling"; the state file is the orchestrator's and is not edited here.

## The cases ruling (round 0), carried

Source: `.scratch/2-e-a-self-rule/agents/briefs/12c-cases.md` in the main checkout.

- A, the silent pin cases: P2, P4, P6 and P11 keep their `.claude-work/skills` control after the silent assertions. The report quotes the silent assertions passing on the unchanged `pin.sh` (run alone from a scratchpad copy, never kept) and the control failing there. P7 and P9 pass whole on the unchanged script.
- B, P3 and P10: cases of preserved behaviour, one folder named once; kind 5's change for each is "drop the dedupe". P10 carries the `.claude-work/skills` control, P3 a glob-only `.claude-aux/skills` control; both controls fail on the unchanged script.
- C, `skills/repo-setup/SKILL.md` joins the paths, its change the `metadata.version` line set to 2.0.0; the rest of the file was read for a sentence the new entries **step** and **part, of an entry** make false, and none is (`grep -n -i -E 'step list|plan step|\bparts?\b|plan-terms|glossary' skills/repo-setup/SKILL.md` hits only skill-Steps citations, the sync text and the plain word "part" in line 42 and line 75). Nothing else in that file changed.
- Verify 6 reads as the ruling's last paragraph says; the quotes are under "Verify 6" below.

## The cases, first run

### How the pin cases were run

- Each case of the kept `utils/pin.test.sh` was cut out with the existing body of the file before it into one scratch script, so every case reports on its own: `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/final/split2/<case>.sh`. It runs beside `pin.sh`, which is `git show HEAD:utils/pin.sh` (the unchanged script) for the first run, the worktree's `utils/pin.sh` for the final run and a one-line change of it for the mutation runs.
- Command per case: `cd <that folder> && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <case>.sh 2>&1 | grep -E '^(FAIL|P[0-9]+: pass)' | head -1`, the first matching line. `<S>` replaces the scratch root `/private/var/folders/.../pin-test.XXXXXX` in the quoted lines; every other character is as printed.
- The whole capture of the first, silent, final and mutation runs is the file `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/final/runall.out` (the script that wrote it is `runall.sh` beside it; the runner's command cap would have killed it as one foreground run).
- `silent_<case>.sh` is the same script with the case's control lines deleted, run only from the scratchpad.

### P1 to P12 on the unchanged `pin.sh`

| Case | Result on the unchanged script | First line printed |
|---|---|---|
| P1 pin and check mode link every skill and agent into `~/.claude` and `~/.claude-work` | FAIL | `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P2 `.claude-science` with no skills folder: nothing created | silent assertion passes, control fails | silent: `silent P2: pass`; with control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P3 `CLAUDE_CONFIG_DIR` set to `.claude-work`: once | silent assertion passes, control fails | silent: `silent P3: pass`; with control: `FAIL: <S>/my home/.claude-aux/skills/beta does not link into the pin` |
| P4 `.claude-x` a regular file: ignored | silent assertions pass, control fails | silent: `silent P4: pass`; with control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P5 `.claude-my work/skills` linked | FAIL | `FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin` |
| P6 `.claude-alt/skills` a link to `.claude/skills`: one folder | silent assertions pass, control fails | silent: `silent P6: pass`; with control: `FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P7 `ORDO_SKILL_DIRS` set: only its folders | pass, whole | `P7: pass` |
| P8 check mode reads `.claude-work`, pin mode removes the stale link | FAIL | `FAIL: check mode passed with a stale link in a ~/.claude-* folder` |
| P9 no `.claude-*` folder: as before | pass, whole | `P9: pass`: the existing body of `utils/pin.test.sh` cut at its end, run on the unchanged script (capture `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/tasks/buo8foann.output`); the same body runs before every case above, so each case reaching its own line shows it passing |
| P10 `CLAUDE_CONFIG_DIR` set to `~/.claude` before `.claude/skills` exists | silent assertions pass for the three spellings, control fails | silent: `silent P10: pass`; with control: `FAIL: the skills line names "<S>/my home/.claude/skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P11 `.claude-y/skills` a file, `.claude-z/skills` a broken link: ignored | silent assertions pass, control fails | silent: `silent P11: pass`; with control: `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P12 real folder, outside link or real agent file in `.claude-work`: refused before anything changes | FAIL | `FAIL: a pin over a real folder in a ~/.claude-* folder: exit 0, expected 1: pin: removed <S>/my home/.claude/agents/ordo-b.md, which the tag v4 does not hold` |

The existing cases of the file (P9) and P7 are the cases of preserved behaviour that pass whole before and after. P1, P5, P8 and P12 are the cases of added behaviour that fail before. The controls of P2, P3, P4, P6, P10 and P11 fail before, and the silent assertions of P2, P3, P4, P6, P10 and P11 pass before and after, as the ruling says.

### Cases the brief's rules got wrong, and the ruling

The first run found that Verify 6 and the last paragraph of "Cases" disagree about P2, P4, P6 and P11 (a control that fails on the unchanged script cannot sit in a case that passes there), that P3 and P10 as "Cases" defines them pass whole on the unchanged script, and that "Paths this step writes" omitted `skills/repo-setup/SKILL.md`, which Decision 2 and Verify 3 need. The orchestrator's ruling is the section "The cases ruling (round 0), carried" above: A, B and C each option (a).

### T1 to T13, read on the unchanged tree, and read again after the change

Each first read is of the unchanged text, by `sed -n` and `grep -n` over the files named; each second read is of the text in the worktree now.

| Case | Unchanged text gives | Text now (file:line) |
|---|---|---|
| T1 2.G | A step per gate piece: `skills/plan/SKILL.md:82` "one step per verifiable piece of it"; 2.G's gate has four pieces (blocked commands, allowed commands, each block removed turns the test red, the offer text read by the user). | One build step plus the closing: `skills/plan/SKILL.md:82` drafts from the goal as its parts; the script, its test and the offer that copies it are one step by `:88` (content known in advance); the gate's check runs inside the step (`:90`); the user's reading of the offer text blocks nothing after it (`:89`). |
| T2 2.F | A step per gate piece (run, comparison) and a step for the skill. | One build step (skill, scripts, forms, agent and wiring: `:90`, `:91`), one step for the run and the comparison, which need the finished skill and the user's call and so are one step of their own by `:87` ("The runs and decisions of that kind that need the same step are one step of their own after it"), and the closing. |
| T3 Version flag | Steps for the output, for the test with its mutation, possibly for running the gate. | One build step and the closing (`:90`: the gate's check runs inside the step that delivers it). |
| T4 `git -c alias.x=push x` slips through | `skills/plan-orchestration/SKILL.md` "Not sent back" read "a finding that changes the scope, a requirement ..." and "a finding beyond the brief" as a stop. | A repair round of step N: `skills/plan-orchestration/SKILL.md:131` "A finding inside the step's part goes back in the repair rounds, whatever files it reaches". No stop, no step. |
| T5 README line outside the paths | The text did not say a round's brief widens the paths; "changes the scope" could read as a stop. | `skills/plan-orchestration/SKILL.md:131` "and the round's brief widens the path list"; no stop. |
| T6 defect in step N's landed script found during step N+1 | An open item, a step by ruling or self-rule choice (`skills/land/SKILL.md` Rules). | Same result: `skills/plan-orchestration/SKILL.md:305` "a landed part found wrong or short ... is a new step", `:308` the ruling or self-rule choice; `skills/land/SKILL.md:225` points at it; the self-rule route of `references/self-rule.md` is unchanged. |
| T7 a part no step builds | An open item, a step by ruling. | `skills/plan-orchestration/SKILL.md:305` "A part the entry needs that no step builds". |
| T8 finding about a different skill | An open item or a step by ruling; no roadmap-entry destination. | `skills/plan-orchestration/SKILL.md:306` "Work outside the entry's goal. It is a new roadmap entry through `/roadmap add` and never a step of this plan"; `skills/spec/SKILL.md:230` gives the same destination to a stop's options. The self-rule route for a finding of a running plan is the one `skills/plan-orchestration/references/self-rule.md` "A skill with its own approval stop" already has. |
| T9 fix renames a configuration key | An open item. | An open item: `skills/plan-orchestration/SKILL.md` "A finding that changes a public shape or an established decision. It is an open item, by "Stops"" and the Stops row "A finding that is the user's". |
| T10 ruling on an extra block for an unstarted step | `skills/spec/SKILL.md` "Steps / A ruling" 2 allowed rewriting or adding and did not order them. | `skills/spec/SKILL.md:262` and `skills/plan-orchestration/SKILL.md:304`: the step's line and brief are rewritten, the line ending `(ruling <name>)`, no step added. |
| T11 a brief for a part | `skills/spec/SKILL.md` "Every item of "What to build" is a change whose content is known"; `templates/brief.md` "file by file". | `skills/spec/SKILL.md:113` the fix text is the requirements, `:114` text is dictated word for word only where the wording is the requirement (a ruled rule sentence), `:129` every requirement is written into the brief; `skills/spec/templates/brief.md:14` says the same; check 8 (`skills/spec/templates/brief-check.md:47`, `skills/spec/SKILL.md:316`) is unchanged and reads only that text. |
| T12 a case whose failure costs nothing, and one that costs something | `templates/brief.md` made every case of a code step a test; `refute` raised a finding for a printed-message wording case with no test. | `skills/spec/templates/brief.md:24` a test only when the rules file's test rule calls for one, `:26` every other case a quoted run with no kept test, `:27` kind 5's mutation for a kept test; `skills/refute/SKILL.md:115` a finding only where that rule calls for a test; `skills/refute/SKILL.md:149` a quoted run meets a case. The pin cases are the second kind: `utils/pin.test.sh`, mutations in the Verify 6 table. |
| T13 no count of steps | No count of steps appears as a rule: `git show HEAD:skills/plan/SKILL.md \| grep -n -i -E 'number of steps\|<n> steps'` prints only the Rulings-bullet template at line 129, which records the drafted list's size. | `git diff -U0 \| grep '^+' \| grep -i steps` read for count words finds `skills/plan/SKILL.md:93` "The number of steps follows from the parts of the entry" (a statement that no count is set), the Anti-patterns row of `skills/plan-orchestration/SKILL.md:381` ("the step list grows by a step per finding", a consequence), and the unchanged line `skills/plan/SKILL.md:140` (`<n> steps`, the record). No rule, target or limit. |

## DONE / NOT DONE

| Item | State | Command that proves it and its output |
|---|---|---|
| 1 `plan` drafts steps by part | DONE | `git grep -n -I -e 'one deliverable and one dispatch' -e 'drafted from the gate' -e 'one step per verifiable' -e 'becomes a test of the step,' -- skills docs README.md` prints nothing, exit 1; text at `skills/plan/SKILL.md:82-93`, `:197-198`, `skills/plan/templates/plan.md:3` and `:18-20` |
| 2 `spec` lets a brief state a part | DONE | `skills/spec/SKILL.md:113-114`, `:129`; `skills/spec/templates/brief.md:14`; `skills/spec/templates/brief-check.md:13` and `:15`; `grep -n -i 'fix text' skills/spec/SKILL.md` still hits the phrase |
| 3 research-hub's three sentences | DONE | `skills/spec/templates/brief.md:24-28`; `skills/spec/SKILL.md:118-121`; `skills/refute/SKILL.md:115`; splits named under "Judgment calls" |
| 4 plan 2.H step 3a | DONE | Kind 1: `grep -n '^## 8' skills/spec/templates/brief-check.md` prints `47:## 8. Dictated text`, so nothing changed for it. Kinds 2, 3: `skills/spec/templates/brief.md:75`. Kind 4: `:71`. Kind 5: `:27`. Kind 6: `:20`. |
| 5 new work by its reason | DONE | `skills/plan-orchestration/SKILL.md:131-133`, `:297-309` ("## What earns a step of its own"), the Stops row and the Anti-patterns rows; `references/self-rule.md`; `skills/refute/SKILL.md`; `skills/land/SKILL.md`; `skills/ordo-help/SKILL.md:77` and `:82`; `skills/spec/SKILL.md`; `skills/plan/templates/orchestrator-state.md:39` |
| 6 glossary | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, exit 0 |
| 7 `utils/pin.sh` over every Claude config folder | DONE | `sh utils/pin.test.sh 2>&1 \| tail -1` prints `PASS: pin.sh scratch tests`; the head comment and `README.md:180` say which folders |
| 8 versions | DONE | Verify 3 below |
| Verify 1 | DONE | `checks.sh` lines below, exit 0 |
| Verify 2 | DONE | `ok: the plan-terms block equals the template` |
| Verify 3 | DONE | below |
| Verify 4 | DONE | below |
| Verify 5 | DONE | prints nothing, exit 1 (grep found no line) |
| Verify 6 | DONE | tables below |
| Verify 7 | DONE | below |
| Verify 8 | DONE | below |

### Verify 1: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0

The whole output, as printed. The character-set command is the `$ git ls-files -coz ...` line, and `checks: 11 commands passed` with exit 0 is its status. The `git ls-files -co` in that command lists this report too, so it was written after the run and the same command was rerun over it (see Verify 7).

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

Each version against `docs/dev/skill-layout.md` "Frontmatter", base 9fc91dc (`git show 9fc91dc:skills/<skill>/SKILL.md`), one raise:

- `plan` 1.10.1 to 2.0.0: major clause, "under the same inputs and the default keys, a run that worked before ... its output is changed": a different step list.
- `spec` 1.7.0 to 2.0.0: major clause: a brief of requirements instead of dictated changes, a case checked by a quoted run.
- `refute` 1.7.1 to 2.0.0: major clause: no finding for a case the rules file's test rule does not call a test for.
- `plan-orchestration` 2.10.1 to 3.0.0: major clause: a finding inside the step's part is sent back where it was raised as a stop.
- `repo-setup` 1.2.1 to 2.0.0: major clause: the plan-terms block it writes and syncs has a changed entry **step** (and a new entry).
- `ordo-help` 1.8.3 to 2.0.0: major clause: the sequence it prints changes what two finding rows say.
- `land` 1.8.2 to 1.9.0: stays; only the wording of one Rules bullet changed, the runs behave as before.

### Verify 4: `git status --short` and `git diff --stat`

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
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/spec/SKILL.md
 M skills/spec/templates/brief-check.md
 M skills/spec/templates/brief.md
 M utils/pin.sh
 M utils/pin.test.sh
```

All 17 are paths of "Paths this step writes" (with `skills/repo-setup/SKILL.md` added by the ruling); this report is the 18th, untracked.

### Verify 6: the pin cases

Cases of added behaviour: each fails on the unchanged `pin.sh` in the form it has after its last change, quoted in the first-run table above (P1, P5, P8, P11 with its control, P12), and each passes on the final `pin.sh`:

```
== P1 .. P12 on the final pin.sh (split2/<case>.sh), first matching line
P1: pass   P2: pass   P3: pass   P4: pass   P5: pass   P6: pass
P7: pass   P8: pass   P10: pass  P11: pass  P12: pass
```

and `sh utils/pin.test.sh 2>&1 | tail -1` prints `PASS: pin.sh scratch tests` in the `checks.sh` run above. Cases of preserved behaviour: P7 and the existing cases (P9) pass on the unchanged script and after the change (first-run table). The controls of P2, P3, P4, P6, P10 and P11 fail on the unchanged script and the silent assertions pass there (first-run table).

Kind 5 for each kept case: one small change to `pin.sh` the case must catch, and the failing line with that change made. The change is applied to a scratch copy of the final `pin.sh` (`mut.py <name> <file>` in the same folder) and the case is run alone.

| Case | Change to `pin.sh` | Failing line with the change |
|---|---|---|
| P1 | the glob loop never adds a folder (`[ -d "$dir" ] && :`) | `FAIL: <S>/my home/.claude-work/skills/beta does not link into the pin` |
| P2 | the glob loop adds `<folder>/skills` for every `.claude-*` entry without checking that it is a folder (`for dir in "$HOME"/.claude-*; do [ -e "$dir" ] && add_skill_dir "$dir/skills"`) | `FAIL: pin.sh created agents` and the next line `skills in a config folder with no skills folder` |
| P3 | drop the dedupe (`same_folder ... && return 0` replaced by `:`) | `FAIL: the skills line names <S>/my home/.claude-work/skills 2 times, expected once: <S>/my home/.claude/skills, <S>/my home/.claude-aux/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude-work/skills` |
| P4 | the same change as P2 | `FAIL: pinning beside a regular file named .claude-x failed:  mkdir: <S>/my home/.claude-x: Not a directory` |
| P5 | `add_skill_dir $dir`, the folder left unquoted | `FAIL: <S>/my home/.claude-my work/skills/beta does not link into the pin` |
| P6 | the dedupe compares the spelling only (`[ "$known" = "$1" ] && return 0`) | `FAIL: pin.sh created an agents folder beside a skills folder that is another folder's link` |
| P7 | the glob loop also runs when `ORDO_SKILL_DIRS` is set | `FAIL: pin.sh linked into a config folder ORDO_SKILL_DIRS does not name` |
| P8 | the glob loop never adds a folder (the change of P1) | `FAIL: check mode passed with a stale link in a ~/.claude-* folder` |
| P9 (the existing cases) | the default list also adds `$HOME/.claude-default/skills` | `FAIL: the agents line with CLAUDE_CONFIG_DIR set; expected the line "pinned: 2 agents linked in: <S>/my home/.claude/agents, <S>/my home/config/agents" in: pin: removed <S>/my home/.agents/skills/beta, in a folder pin.sh no longer links into` |
| P10 | `CLAUDE_CONFIG_DIR` strips one trailing slash instead of all (`sed 's#/$##'`) | `FAIL: the skills line names "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills, <S>/my home/.claude//skills", expected "<S>/my home/.claude/skills, <S>/my home/.claude-work/skills"` |
| P11 | the change of P2 | `FAIL: pinning beside a skills file and a broken skills link failed:  mkdir: <S>/my home/.claude-y/skills: File exists` |
| P12 | the real-directory refusal of the skill loop becomes `continue` | `FAIL: a pin over a real folder in a ~/.claude-* folder: the pinned worktree moved` |

Behaviours of the change whose failure costs something, each with its case: the `.claude-*` folders linked (P1, P5), a folder with no skills folder left alone (P2), a regular file and a broken link ignored (P4, P11), one folder linked once and named once (P3, P6, P10), `ORDO_SKILL_DIRS` replacing the list (P7), check mode and pin mode reading the folders (P8), refusal before anything changes (P12). The failing line of each is in the first-run table.

What the green result does not cover: the glob order is the shell's (Decision 4), and the tests run with `sh` as the system provides it (no other shell was tried). `utils/pin.sh` was never run against the real home folder.

### Verify 7: `LC_ALL=C grep -n '[^ -~]'` over the 17 changed files

Printed nothing for every file. The `checks.sh` character-set command printed nothing and the run exited 0.

### Verify 8

- Each new or changed bullet holds one rule and each Steps item one action: read over `git diff -U0`. The bullets that carry a condition keep it in the same bullet.
- Sentences past 25 words that are new or changed: found by `python3 long.py` and `python3 long2.py` in the scratchpad (words per sentence of every added line of the changed `.md` files, each compared with the removed lines of its hunk), so this list is the whole set the diff adds. Where a sentence is an old long sentence with a phrase replaced, it is named as such. Where it is new, the reason it needs its length is given. None was split, since each is one rule whose parts share the subject and the condition.
  - An old long sentence with a phrase replaced and nothing else (`the step's scope` to `the part the step builds`, `the item` to `the requirement`, a pointer added to "What earns a step of its own"): `skills/spec/SKILL.md:91`, `:262`, `:307`, `:338`, `:356`, `:359`; `skills/plan-orchestration/SKILL.md:62`, `:119`, `:308`, `:318`, `:353`, `:380`, `:382`; `skills/ordo-help/SKILL.md:77`, `:82`; `skills/land/SKILL.md:225`; `skills/plan/templates/orchestrator-state.md:39`; `skills/plan/templates/plan.md:3`; `skills/spec/templates/brief.md:24`, `:70`, `:75`; `docs/glossary.md:105`, `:118` and `skills/repo-setup/templates/plan-terms.md:100`, `:113` (glossary entries, which list every "Stated in" of one term in one entry as the entries around them do).
  - New glossary entry `docs/glossary.md:71` and `plan-terms.md:66` (44 words): a definition with its qualifiers and its "Stated in", as the entries around it.
  - New bullets of 26 to 33 words, each one rule with its condition kept in the same bullet: `skills/plan-orchestration/SKILL.md:110`, `:131`, `:303`, `:305`; `skills/plan-orchestration/references/self-rule.md:16`, `:40`; `skills/plan/SKILL.md:86`; `skills/refute/SKILL.md:115`; `skills/spec/SKILL.md:119`; `skills/spec/templates/brief.md:20`, `:27`.
  - New or changed sentences of 29 to 36 words that carry a destination and the authority for it in one sentence (the authority clause is the existing phrase "by a ruling of the user or, under `self_rule: on`, a choice ... books", kept whole): `skills/refute/SKILL.md:159`, `skills/plan-orchestration/SKILL.md:406`.
  - `skills/plan/SKILL.md:87` (41 words): the rule and its two examples (a skill the user runs in a fresh session, the blind comparison); a bullet with the rule alone leaves the examples as a fragment.
  - `skills/spec/SKILL.md:113` (40 words): states what the requirements of a part are, as the ruling words it.
  - Table rows, each one cell sentence long: `skills/plan/SKILL.md:181`, `skills/plan-orchestration/SKILL.md:381`.
  - `skills/plan/templates/plan.md:19` (32 words) and `skills/spec/templates/brief.md:14` (58 words, `:71` 39 words): template placeholders that list what the writer must fill, in one line each; `:71` is the open item's kind 4 in generic form.
  - `README.md:180` (27 words): lists the folders `pin.sh` reads, in the sentence that names them.
  - `skills/spec/templates/brief.md:75`: the report paragraph keeps its existing shape (each "Then ..." sentence is one report section, 35 to 53 words); this change adds the character-set check's line, the terms sentence's "Stated in" check and the cases' sentence, to sentences that were already past 25 words.
- The head comments of `utils/pin.sh` and `utils/pin.test.sh` list every folder and variable the scripts read, as the rules file's rule 14 asks; they are shell comments, outside the `.md` count.

## Terms

Each term of `docs/glossary.md` the diff adds, changes or uses in a new place, each use read against the entry:

- **part, of an entry**: added at `docs/glossary.md:71` (and `skills/repo-setup/templates/plan-terms.md:66`), between **part file** and **part, of an output**. Stated in `plan`, Steps 2: Steps 2 of `skills/plan/SKILL.md` holds the definition at lines 82 to 93 (`grep -n 'A step is a part' skills/plan/SKILL.md` prints line 83 and line 197). Stated in `plan-orchestration`, "What earns a step of its own": line 297 starts the section and line 299 says "A step is a part of the entry". Used in `skills/plan/SKILL.md`, `skills/spec/SKILL.md`, `skills/plan-orchestration/SKILL.md`, `skills/ordo-help/SKILL.md` ("the part the step builds") in the entry's sense.
- **step**: changed at `docs/glossary.md:118`. Stated in `plan`, Steps 2 and Rules: `grep -n 'A step is a part' skills/plan/SKILL.md` prints line 83 (Steps 2) and `197:- A step is a part of its entry, as Steps 2 says, ...`; the step entry is at `docs/glossary.md:118` and `plan-terms.md:113`.
- **ruling**: changed at `docs/glossary.md:105` (`plan-terms.md:100`); the "Stated in" `spec`, "Steps / A ruling" and "What it reads" 4 is checked by `grep -n 'rewrites the line of a step not yet built' skills/spec/SKILL.md`, which prints line 262 (inside "Steps / A ruling").
- **fix text**: not a glossary entry; the phrase is kept in `skills/spec/SKILL.md:113` with its meaning given, since `docs/dev/change-standard.md:30` and `skills/refute/SKILL.md` name it.
- Terms used in their glossary sense: **open item**, **finding**, **repair round**, **stop**, **gate**, **brief**, **brief check**, **acceptance item**, **closing step**, **authority**, **self-rule**, **Step 0**: each use in the new text reads against its entry unchanged. The word "part" in `skills/repo-setup/SKILL.md:42` and in "the part in force" of an ADR is the plain word, not the new entry.

## Files with line counts

```
     192 README.md
     145 docs/glossary.md
     230 skills/land/SKILL.md
     117 skills/ordo-help/SKILL.md
     407 skills/plan-orchestration/SKILL.md
     164 skills/plan-orchestration/references/self-rule.md
     205 skills/plan/SKILL.md
      70 skills/plan/templates/orchestrator-state.md
      43 skills/plan/templates/plan.md
     196 skills/refute/SKILL.md
     253 skills/repo-setup/SKILL.md
     128 skills/repo-setup/templates/plan-terms.md
     387 skills/spec/SKILL.md
      62 skills/spec/templates/brief-check.md
      75 skills/spec/templates/brief.md
     486 utils/pin.sh
     836 utils/pin.test.sh
```

(`wc -l` over `git diff --name-only`, after the last edit.)

## Judgment calls the brief left open

- Item 3's splits, each as `docs/dev/skill-layout.md` "Lists and tables" asks: `skills/spec/SKILL.md` Steps 4 holds the first-task sentence as a bullet (`:118`) with three sub-bullets (`:119` a code case is a test only where the rules file's test rule calls for one and otherwise a quoted run; `:120` a text or judgment case by reading; `:121` a case the brief's rules get wrong handed back), `skills/spec/templates/brief.md` "Cases" holds the sentence as five bullets (`:24` a test only when the rule calls for one; `:25` no prototype script; `:26` every other case a quoted run with no kept test; `:27` kind 5's change; `:28` text or judgment by reading). `skills/refute/SKILL.md:115` is one requirement and is not split.
- Item 4, kind 2: "the ASCII command's line" is written "the character-set check's line and its exit status included when the verify list holds one" (`skills/spec/templates/brief.md:75`). Kind 3 is the open item's sentence unchanged. Kind 4 is a Verify item (`:71`) in the generic form: "the standards pages' rules on list items and sentence length", with no Ordo path or number. Kind 6 is a Cases bullet (`skills/spec/templates/brief.md:20`) in the open item's words. Kind 5 is a bullet in "Cases" for a case kept as a test, as item 3 requires.
- P9 has no block of its own in `utils/pin.test.sh`: the existing cases are P9, and a second block would test the same list. Its kind 5 change is quoted above and the existing body catches it.
- P10 runs three spellings of `CLAUDE_CONFIG_DIR` (no slash, one, two); `utils/pin.sh` strips every trailing slash of `CLAUDE_CONFIG_DIR` (before: one), so the folder is compared by path with trailing slashes removed as item 7 says.
- P12 also holds the real agent file in `.claude-work/agents`, since Decision 5 names "a skill or agent of the tag"; the refusal text is the one pin mode already prints.
- `utils/pin.sh` moved the function `same_folder` above the list building, since the default list now calls it; its text is unchanged.
- "Not sent back." in Steps 8 is split into three bullets: "Sent back." (inside the part), "Not sent back." (public shape or established decision, a stop) and "Outside the part." (goes where "What earns a step of its own" sends it). The words "the scope, a requirement" of the old bullet are replaced by the two conditions of item 5 and the ruling; "a requirement" is not carried, since the brief and the ruling name a public shape and an established decision only.
- "What earns a step of its own" keeps the old rules "a fix in a file another step holds is made at that step's landing" and "`/spec` refuses a line without its tag" as bullets, adds the list of reasons, and carries the path-list widening in Steps 8's "Sent back." bullet.
- `skills/plan/SKILL.md` Stops row "Not yet specified" ("no gate to draft steps from") is changed to "no gate for its steps to run", since it relied on the old drafting rule.
- `skills/spec/SKILL.md` "Steps / A ruling" 2 gains one bullet and a changed bullet so a ruling on a part not yet built rewrites its line, adds no step and is written in the Rulings section for the tag to name, and `references/self-rule.md` kind 3 and "Closing an open item" 3 carry the same clause; this serves item 5's bullet on a ruling on a part not yet built.
- `skills/plan-orchestration/SKILL.md` gains an Anti-patterns row for raising a finding inside the part as a stop, which item 5 asks for in "the Anti-patterns".
- `skills/refute/SKILL.md` "The verdicts" Cases bullets name "the run the report quotes" next to the test and the reading; this serves item 3's last bullet (a case checked by a quoted run is no test).

## Host- and user-visible changes

- `utils/pin.sh <tag>` pin mode, before: links the skills into `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills`. After: also into the `skills` folder of each `~/.claude-*` folder that is a folder holding a `skills` folder, and the agents into its `agents` folder (created); each folder once, each entry a link into the pinned worktree, no folder linked to another; a `.claude-*/skills` entry that is a real folder or a link outside Ordo for a skill of the tag, or a real file for an agent of the tag, is refused before anything changes.
- Check mode reads the same list. On this machine `ls -d ~/.claude-*` prints `/Users/axelfaes/.claude-science` and `/Users/axelfaes/.claude-work`, and `ls -d ~/.claude-*/skills` prints `/Users/axelfaes/.claude-work/skills` only. `ls -l ~/.claude-work/skills` shows links for `land`, `ordo-init`, `plan`, `plan-help`, `plan-orchestration`, `plan-retro`, `refute`, `repo-setup`, `roadmap` and `spec` into `/Users/axelfaes/.local/share/ordo-stable/skills`, and a real folder `synced`; `ls skills` of this worktree lists `diagnose`, `grill`, `ordo-help` and `session-retro`, which that folder has no link for, and no `plan-help`. So check mode will name those entries and exit non-zero until the next pin, where today it passes over a folder it did not read. Not verified: the exact output, since `utils/pin.sh` was not run against the real home folder, and whether the tag the next pin uses holds a skill named `synced` (a real folder of that name is refused by Decision 5).
- `.claude-science` has no `skills` folder, so nothing is created under it.
- The plan skills' text: a plan's steps are parts of the entry; a brief states a part by requirements; a finding inside a part is sent back in the repair rounds and a finding outside it goes by its reason; a case of a code step is a test only where the rules file's test rule calls for one. The installed skills change only through a pin.
- `README.md:180`: before, the folders `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills`; after, `~/.claude-*` folders too.

## Anything in the brief that was wrong or impossible, and files outside the paths

- Wrong: Verify 6 and "Cases" on P2, P4, P6 and P11 (a control that fails before in a case that passes before); P3 and P10 passing whole before; the path list lacking `skills/repo-setup/SKILL.md`. Each was ruled in the round-0 cases ruling above and is carried out.
- The brief says `README.md` line 180 holds the pin sentence: `grep -n 'pin.sh. links the skills into' README.md` printed line 180 before the change; it holds.
- Files outside the paths that the change leaves true (read, not edited): `docs/dev/change-standard.md:30` and `skills/repo-setup/templates/docs/dev/change-standard.md:30` ("The brief's fix text is the specification": the phrase stays and is defined in `skills/spec/SKILL.md:113`); `skills/diagnose/SKILL.md:153`, `docs/figures/gen_figures.py:705` and `docs/figures/plan-loop.svg:153` name the Stops row "A finding that is the user's", whose name is kept; `docs/glossary.md:144` (the **pin** entry) and `docs/dev/building.md:14` do not state the folder list and stay true. No file outside the paths holds a sentence the change makes false: `git grep -n -I -i -E "scope|one step per|deliverable|becomes a step|only by a ruling|beyond the brief|content is known" -- docs skills README.md` hits only unrelated uses (the capability map's "scope", the rules file's "same scope", and the plain word "deliverable" at `skills/plan-orchestration/SKILL.md:67` and `skills/spec/templates/brief.md:61`).

## Appendix: every change with its place, before and after

Generated from `git diff -U0` (the section is the nearest heading above the old line; "OLD|" and "NEW|" mark the old and new lines; a hunk with only OLD lines removes text, a hunk with only NEW lines adds text). The version lines are in the diff of each `SKILL.md`.

### README.md

- Section: ## Working on Ordo; old line 180, new line 180
  - Old:
    OLD| `pin.sh` links the skills into `~/.claude/skills` and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into the `agents` folder beside each skill folder: `~/.claude/agents`, `$CLAUDE_CONFIG_DIR/agents`, or the sibling of each folder of `ORDO_SKILL_DIRS`. `ORDO_STABLE` moves the pinned worktree to another path.
  - New:
    NEW| `pin.sh` links the skills into `~/.claude/skills`, into the `skills` folder of each `~/.claude-*` folder that holds one, and, when `CLAUDE_CONFIG_DIR` is set, into `$CLAUDE_CONFIG_DIR/skills`, each folder once. Each entry in those folders is a link into the pinned worktree, and no folder is linked to another. `ORDO_SKILL_DIRS` replaces that list of folders. `pin.sh` links the agents into the `agents` folder beside each skill folder: `~/.claude/agents`, the `agents` folder of each `~/.claude-*` folder, `$CLAUDE_CONFIG_DIR/agents`, or the sibling of each folder of `ORDO_SKILL_DIRS`. `ORDO_STABLE` moves the pinned worktree to another path.

### docs/glossary.md

- Section: ## Plan terms; old line 70, new line 71
  - Old: (nothing)
  - New:
    NEW| - **part, of an entry**: the work one step of a plan builds, a piece of the entry's goal that must exist and work before another piece is built on it, or a point where the user reads or decides before the rest goes on. A later piece is built on an earlier one when it needs the earlier one's result, not only its existence. Stated in: `plan`, Steps 2; `plan-orchestration`, "What earns a step of its own".
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
    NEW|   - The step that finishes it on top of what landed enters the plan only as `plan-orchestration`'s "What earns a step of its own" says, by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.

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
    NEW|    - **Sent back.** A finding inside the step's part goes back in the repair rounds, whatever files it reaches, and the round's brief widens the path list.
    NEW|    - **Not sent back.** A finding that changes a public shape or an established decision is raised as a stop, by "Stops".
    NEW|    - **Outside the part.** A finding outside the step's part goes where "What earns a step of its own" sends it.
- Section: ## What earns a step of its own; old line 296, new line 299
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
    NEW| - **The work the last round leaves undone inside the part.** It is fixed at landing when small, and otherwise is an open item whose new step needs a reason of this list.
    NEW| - **A ruling on a part not yet built.** It rewrites that step's line and brief, the line ending with `(ruling <name>)`, and adds no step.
    NEW| - **A part the entry needs that no step builds, or a landed part found wrong or short.** It is a new step, a line ending with `(ruling <name>)`.
    NEW| - **Work outside the entry's goal.** It is a new roadmap entry through `/roadmap add` and never a step of this plan.
    NEW| - **A finding that changes a public shape or an established decision.** It is an open item, by "Stops".
    NEW| - A new step and a new roadmap entry each need a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
    NEW| - `/spec` refuses a step line without its tag.
    NEW| - A report that asks for a step names the reason of this list that applies.
- Section: ## Reports; old line 310, new line 318
  - Old:
    OLD| - A finding that is neither closed in the repair rounds nor fixed at landing is an open item, since it becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW| - A finding that is neither closed in the repair rounds nor fixed at landing is an open item, since where it goes, as "What earns a step of its own" says, is decided by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
- Section: ## Stops; old line 345, new line 353
  - Old:
    OLD| | A finding that is the user's | A finding that changes the scope, a requirement, a public shape or an established decision; or one that neither the repair rounds nor a fix at landing close (a finding beyond the brief, work the last round left undone, a changed view not fixed at landing), which becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books | The stop message, below | The user's ruling |
  - New:
    NEW| | A finding that is the user's | A finding that changes a public shape or an established decision; or one that neither the repair rounds nor a fix at landing close (a finding outside the step's part, work the last round left undone, a changed view not fixed at landing), which goes where "What earns a step of its own" says, by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books | The stop message, below | The user's ruling |
- Section: ## Anti-patterns; old line 372, new line 380
  - Old:
    OLD| | Sending a finding that changes the scope, a requirement, a public shape or an established decision back to the builder | The builder then takes a decision for the user | Raise it as a stop |
    OLD| | Handing a miss inside a brief back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or raise it to the user as an open item, by "Stops" |
  - New:
    NEW| | Sending a finding that changes a public shape or an established decision back to the builder | The builder then takes a decision for the user | Raise it as a stop |
    NEW| | Raising a finding inside the step's part as a stop, or as a step of its own | The part is left unfinished, and the step list grows by a step per finding | Send it back in the repair rounds, as Steps 8 says |
    NEW| | Handing a miss inside the step's part back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or raise it to the user as an open item, by "Stops" |
- Section: ## Rules; old line 395, new line 404
  - Old:
    OLD| - Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops".
  - New:
    NEW| - Everything else that the rounds left undone, or that lies outside the step's part, is raised to the user as an open item, by "Stops".
- Section: ## Rules; old line 397, new line 406
  - Old:
    OLD|   - It becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.
  - New:
    NEW|   - It goes where "What earns a step of its own" says, by a ruling of the user or, under `self_rule: on`, a choice `references/self-rule.md`, "Closing an open item", books.

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
    NEW|      - The runs and decisions of that kind that need the same step are one step of their own after it, such as a skill the user runs in a fresh session and the blind comparison the user calls on its output.
    NEW|      - Two parts whose content is known in advance are one step even when one uses the other, such as a script and its setup text.
    NEW|      - A run the builder itself makes, read by the user, is part of the step's check, and the user's reading blocks nothing after it.
    NEW|      - A gate's check runs inside the step that delivers what it checks.
    NEW|      - Wiring in, terms and documentation belong to the step that builds the thing.
    NEW|      - Bookkeeping is done in a commit the orchestrator already makes and is never drafted as a step.
    NEW|      - The number of steps follows from the parts of the entry.
- Section: ## Stops; old line 170, new line 181
  - Old:
    OLD| | Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate to draft steps from | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
  - New:
    NEW| | Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate for its steps to run | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
- Section: ## Rules; old line 186, new line 197
  - Old:
    OLD| - A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
  - New:
    NEW| - A step is a part of its entry, as Steps 2 says, built by one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it.
    NEW| - A step the orchestrator runs without an agent keeps the mark `orchestrator, no agent` on its line.

### skills/plan/templates/orchestrator-state.md

- Section: ## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says); old line 39, new line 39
  - Old:
    OLD| A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.
  - New:
    NEW| A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says, by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; what is settled belongs in the closed list.

### skills/plan/templates/plan.md

- Section: # Plan: <roadmap entry number and title>; old line 3, new line 3
  - Old:
    OLD| Execution ledger for <the roadmap entry, linked>. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.
  - New:
    NEW| Execution ledger for <the roadmap entry, linked>. One bullet is one step: a part of the entry, built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.
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
    NEW|   - It becomes a step only for a reason `plan-orchestration`'s "What earns a step of its own" lists, by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.

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
    NEW| - **part, of an entry**: the work one step of a plan builds, a piece of the entry's goal that must exist and work before another piece is built on it, or a point where the user reads or decides before the rest goes on. A later piece is built on an earlier one when it needs the earlier one's result, not only its existence. Stated in: `plan`, Steps 2; `plan-orchestration`, "What earns a step of its own".
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
    NEW|    - The fix text, which is the requirements of the step's part in the brief's own words, not a pointer: what must hold when the part is done, the files it touches with the constraint each is under, and the behaviour.
    NEW|    - Text is dictated word for word only where the wording itself is the requirement, such as a rule sentence the user ruled.
- Section: ## Steps; old line 117, new line 118
  - Old:
    OLD|      - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a code step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
  - New:
    NEW|      - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change.
    NEW|        - A case of a code step is a test only where the rules file's test rule calls for one, and otherwise a run the report quotes.
    NEW|        - A case of a text or judgment step is checked by reading.
    NEW|        - A case the brief's rules get wrong is handed back before any code changes.
- Section: ## Steps; old line 125, new line 129
  - Old:
    OLD|    - Every item of "What to build" is a change whose content is known.
  - New:
    NEW|    - Every requirement the part is judged on is known and written into the brief.
- Section: ### A stop; old line 225, new line 229
  - Old:
    OLD|      - An option adds a step to the plan only when the work fits no step already in the list.
  - New:
    NEW|      - An option adds a step to the plan only for a reason `plan-orchestration`'s "What earns a step of its own" lists.
    NEW|      - An option for work outside the entry's goal is a new roadmap entry through `/roadmap add`, never a step of the plan.
- Section: ### A ruling; old line 256, new line 261
  - Old:
    OLD|    - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user)." for a ruling of the user, or "(self-rule)." for a choice booked under self-rule;
  - New:
    NEW|    - a ruling on a part not yet built rewrites that step's line, which then also ends with `(ruling <name>)`, and adds no step;
    NEW|    - a ruling that adds or splits a step, or rewrites the line of a step not yet built, is also written in the Rulings section as a line ending with "(the user)." for a ruling of the user, or "(self-rule)." for a choice booked under self-rule;
- Section: ### The brief check; old line 301, new line 307
  - Old:
    OLD|    - **The step line.** Every part of the plan's step line is present in "What to build": each item is mapped to the part of the line it serves, and a part with no item is named.
  - New:
    NEW|    - **The step line.** Every part of the plan's step line is present in "What to build": each requirement is mapped to the part of the line it serves, and a part with no requirement is named.
- Section: ### The brief check; old line 332, new line 338
  - Old:
    OLD|    - A finding whose fix would change the step's scope, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
  - New:
    NEW|    - A finding whose fix would change the part the step builds, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
- Section: ## Stops; old line 350, new line 356
  - Old:
    OLD| | A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
  - New:
    NEW| | A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the part the step builds or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
- Section: ## Stops; old line 353, new line 359
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
    NEW| <the part's requirements, in the brief's own words: what must hold when the part is done, the files it touches with the constraint each is under (path, purpose, size limit, the shape it must have), and the behaviour; text word for word only where the wording itself is the requirement, such as a rule sentence the user ruled>
- Section: ## Cases; old line 19, new line 20
  - Old: (nothing)
  - New:
    NEW| - <for a script, each input it reads that is missing, unreadable or malformed, and its output closed early, each with the exit status and the one error line expected>.
- Section: ## Cases; old line 21, new line 22
  - Old:
    OLD| The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted. A case of a code step (a script, or a product's code) becomes a test of the step, run on the unchanged tree first; no prototype script stands in for the test. A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted.
  - New:
    NEW| The builder's first task, before any change, is the first run of every case above on the unchanged tree, with each case's result noted.
    NEW| 
    NEW| - A case of a code step (a script, or a product's code) becomes a test of the step only when the rules file's test rule calls for a test of it, run on the unchanged tree first.
    NEW| - No prototype script stands in for such a test.
    NEW| - Every other case of a code step is checked by a run the report quotes, and no test is kept for it.
    NEW| - For each case kept as a test, the report names one small change to the code under test that the case must catch, and the test's failing line with that change made.
    NEW| - A case of a text or judgment step is checked by reading the unchanged tree, and that first read is noted.
- Section: ## Verify before you report; old line 63, new line 70
  - Old:
    OLD| 4. Each new or changed test of a behaviour the change adds or changes fails on the unchanged tree, in the form it has after its last change, and the report quotes that failure; each new or changed test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs. A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.
  - New:
    NEW| 4. Each new or changed test of a behaviour the change adds or changes fails on the unchanged tree, in the form it has after its last change, and the report quotes that failure; each new or changed test of a behaviour the change preserves passes after the change and, where it can run there, on the unchanged tree, and the report quotes those runs. A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is. A case checked by a quoted run is no test and is not judged as one.
    NEW| 5. Each new or changed list item and sentence is read against the standards pages' rules on list items and sentence length, and each place it departs from them is named in the report with why it needs its form.
- Section: ## Report; old line 67, new line 75
  - Old:
    OLD| Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the cases' first run: each case of "Cases" with its result on the unchanged tree, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output verbatim. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.
  - New:
    NEW| Write it to `<ledger>/agents/reviews/<step>-report.md`. First line: anything NOT done, or "Everything in the brief is done". Then the open items of the state file, verbatim, which hold only what the user must rule on. Then the cases' first run: every case of "Cases" by its name, none left out, each with the command or the reading that checked it and its output as printed, and each case the brief's rules got wrong with the rule, the result and the orchestrator's ruling. Then the DONE / NOT DONE table with the checks above and their output as printed, the character-set check's line and its exit status included when the verify list holds one; a line shortened with "..." is not verbatim. Then the terms: each term of `docs/glossary.md` the diff adds, changes or uses in a new place, each use read against the entry, and each changed entry's "Stated in" checked by `grep -n` of the term in the section it names. Then files with line counts, every judgment call the brief left open, every host- or user-visible change with its before and after, and anything in the brief that was wrong or impossible, with the evidence. When the brief keeps a shared document out of the step's paths because other steps run beside it, a section "Doc text" gives the exact lines for that document (the current line as `grep -n` prints it and its replacement, or the line a new one follows), which the orchestrator applies at landing.

### utils/pin.sh

- Section: # The skill folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set,; old line 11, new line 11
  - Old:
    OLD| # The skill folders are ~/.claude/skills and $CLAUDE_CONFIG_DIR/skills when that variable is set,
    OLD| # or $ORDO_SKILL_DIRS when set. $ORDO_SKILL_DIRS is split on spaces and tabs, or
    OLD| # read one folder per line when it holds a newline (the form for a folder whose path holds a
    OLD| # space); empty lines are skipped, and a value that names no folder is refused. The default
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
- Section: # (from ORDO_SKILL_DIRS, the defaults or $CLAUDE_CONFIG_DIR/skills) must be an absolute path with; old line 16, new line 21
  - Old:
    OLD| # (from ORDO_SKILL_DIRS, the defaults or $CLAUDE_CONFIG_DIR/skills) must be an absolute path with
    OLD| # no leading or trailing whitespace, or the run is refused before anything changes. The summary
    OLD| # line names the folders joined by ", ".
  - New:
    NEW| # (from ORDO_SKILL_DIRS or the defaults) must be an absolute path with no leading or trailing
    NEW| # whitespace, or the run is refused before anything changes. The summary line names the folders
    NEW| # joined by ", ".
- Section: # followed by /agents): ~/.claude/agents, $CLAUDE_CONFIG_DIR/agents, or the sibling of each; old line 35, new line 40
  - Old:
    OLD| # followed by /agents): ~/.claude/agents, $CLAUDE_CONFIG_DIR/agents, or the sibling of each
  - New:
    NEW| # followed by /agents): the agents folder beside each default skill folder, or the sibling of each
- Section: # that pins, or a check that passes, exits 0.; old line 69, new line 75
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
- Section: # The skill folders, one per line.; old line 80, new line 106
  - Old:
    OLD|     if [ -n "${CLAUDE_CONFIG_DIR:-}" ] && [ "${CLAUDE_CONFIG_DIR%/}" != "$HOME/.claude" ]; then
    OLD|         skill_dirs="$skill_dirs$nl${CLAUDE_CONFIG_DIR%/}/skills"
    OLD|     fi
  - New:
    NEW|     for dir in "$HOME"/.claude-*/skills; do
    NEW|         [ -d "$dir" ] && add_skill_dir "$dir"
    NEW|     done
    NEW|     [ -z "${CLAUDE_CONFIG_DIR:-}" ] ||
    NEW|         add_skill_dir "$(printf '%s\n' "$CLAUDE_CONFIG_DIR" | sed 's#//*$##')/skills"
- Section: # Succeeds when the folders $1 and $2 are one folder: the same path with every trailing slash; old line 145, new line 172
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
    NEW| # The Claude config folders: pin mode links every skill and agent into ~/.claude and into each ~/.claude-* folder that holds a skills folder, a name with a space included, creating each agents folder; it leaves alone a ~/.claude-* folder with no skills folder and a skills entry that is a regular file or a broken link; a folder reached through CLAUDE_CONFIG_DIR, the glob or a link to another folder is linked once and named once, with or without trailing slashes and before ~/.claude/skills exists; ORDO_SKILL_DIRS leaves these folders alone; check mode reads them and names a stale link, which pin mode removes; pin mode refuses, before anything changes, a real folder or a link outside Ordo for a skill and a real file for an agent in such a folder.
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
    NEW| # A ~/.claude-*/skills that is a link to ~/.claude/skills is the same folder: it is not named, and its folder gets no agents folder. The control, after the silent assertions, is the ~/.claude-work folder linked beside it.
    NEW| reset_config_folders
    NEW| mkdir -p "$HOME/.claude/skills" "$HOME/.claude-work/skills" "$HOME/.claude-alt"
    NEW| ln -s "$HOME/.claude/skills" "$HOME/.claude-alt/skills"
    NEW| run_pin v3
    NEW| [ "$status" -eq 0 ] || fail "pinning with a skills folder that links to another failed: $out $err"
    NEW| expect_named_once "$HOME/.claude/skills"
    NEW| [ ! -e "$HOME/.claude-alt/agents" ] ||
    NEW|     fail "pin.sh created an agents folder beside a skills folder that is another folder's link"
    NEW| expect_folders "$HOME/.claude/skills, $HOME/.claude-work/skills" \
    NEW|     "$HOME/.claude/agents, $HOME/.claude-work/agents"
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
