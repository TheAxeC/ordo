# Step 11b refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-11b, base 18dd033)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

Verify 1, from the worktree root: `sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?"`

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
exit 0
```

Scratch ledgers under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute-11b, each run from the worktree root as `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py $S/<c> $S/root; echo "exit $?"` (c2: `## Agents` with a sentence and no bullet; c3: empty section, `agents/agent-roles.md` with one bullet; c4: one bullet in plan.md, no transcript; c5: empty section, roles file at mode 000; c6: no `## Agents` heading; c7: section with its sentence only, a bullet under a later `## Blocked, and by what`; c8: `# Plan: 9 Scratch` and an empty `## Agents`; c9: first line `not a plan`, then an empty `## Agents`):

```
--- c2
error: the ledger names no agent
exit 1
--- c3
error: no transcript of agent ab12 under <S>/root
exit 1
--- c4
error: no transcript of agent ab12 under <S>/root
exit 1
--- c5
error: cannot read <S>/c5/agents/agent-roles.md: Permission denied
exit 1
--- c6
error: the ledger names no agent
exit 1
--- c7
error: the ledger names no agent
exit 1
--- c8
error: the ledger names no agent
exit 1
--- c9
error: <S>/c9/plan.md:1: the first line is not "# Plan: <entry>"
error: the ledger names no agent
exit 1
```

Verify 2, case 8 in the brief's form (the scratch ledger as the transcript root): with stdout dropped it printed `error: the ledger names no agent`, `exit 1`; with stderr dropped it printed nothing, `exit 1`. The same command run with the main checkout's `plan_cost.py` printed `error: the ledger names no agent`, `exit 1`; `cmp` of the main checkout's and the worktree's `plan_cost.py` printed nothing (equal), and the file is absent from the diff, so this is the run on the unchanged script.

Verify 3: `git diff 18dd033 | grep '^diff --git'` printed `README.md`, `docs/glossary.md`, `skills/plan-orchestration/SKILL.md`, `skills/plan/SKILL.md`, `skills/plan/templates/plan.md`, `skills/repo-setup/templates/plan-terms.md`; no `plan_cost.py`. `git status --short` printed those six as ` M` and `?? .scratch/2-e-a-self-rule/agents/reviews/11b-report.md`.

Verify 4: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. The builder's `--write` claim, rerun on a scratch root holding the base `docs/glossary.md` (the diff reverse-applied with `patch -R`): without `--write` it printed the two-entry diff and exit 1; with `--write` it printed `written: the plan-terms block now equals the template`, exit 0, and `diff` of the result with the worktree's `docs/glossary.md` printed nothing.

Verify 5: `git diff 18dd033 | grep '^+' | LC_ALL=C grep -n '[^ -~]'` printed nothing, grep exit 1.

Verify 6: `grep -rn 'closing step\|closing report\|runs the cost script\|the script exits 0' skills docs README.md` printed `skills/roadmap/SKILL.md:19`, `skills/plan/SKILL.md:80, 86, 87, 88, 89, 91, 92, 93, 100, 114`, `skills/plan/templates/plan.md:21`, `skills/plan-orchestration/SKILL.md:131, 133, 136, 289, 290, 316`, `skills/plan-orchestration/references/self-rule.md:49, 51, 52, 54`, `skills/repo-setup/templates/plan-terms.md:22, 23`, `docs/glossary.md:27, 28`, `README.md:151`, the same list the report reads. Each hit read: true after the change (see Verdicts, item 1 to 5). A wider grep, `grep -rn 'cost script\|plan_cost\|closing\.md' skills docs README.md` and `grep -rn -i 'closing' skills docs README.md utils`, found no other sentence saying the closing always runs the script or that the folder moves only on exit 0: `README.md:153` and ADR 0009, Consequences ("so the closing, run through a tool, finds the folder") describe a run of the script and stay true; `docs/roadmap.md` entry 2.E.A says nothing on when the closing runs it. `grep -rn "output written as the closing report\|holding the cost script's output for the plan\|runs the cost script, which" skills docs README.md utils` printed nothing (exit 1): no old wording is left.

Report's line counts: `wc -l` printed 167, 43, 365, 126, 143, 190 for the six files, as the report gives.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `skills/plan/SKILL.md:86` is the skip condition in the brief's words (heading present, no bullet up to the next `## `, no `agents/agent-roles.md`); `:87` carries the dictated sentence byte for byte and the move; `:88` sends every other ledger to the script, naming the missing heading and the existing roles file "read or not"; `:89`, `:90` (unchanged) and `:91` keep the output, the stop and the exit-0 move for a ledger that runs the script. On the four judgment calls: call 3, "(`/plan` always writes the heading)" for the brief's "which `/plan` always writes (line 74)", keeps the brief's meaning; item 1's words outside the quoted sentence are fix text, not dictated text (the brief check's "Dictated text" lists only the quoted sentence for item 1), and a line number would be a citation by line, which skill text does not use (`docs/dev/skill-layout.md`, "Where a rule goes", names a section). Call 4, six bullets in place of four, keeps to "One rule per bullet" except `:87`, Standards 1. On the c9 input (malformed first line, empty Agents section, no roles file): not a finding against Decision 1. Decision 1's parenthetical defines "as `/plan` writes it" by exactly the two properties the condition tests, and on c9 the closing step and the script agree on the point the sentence "never disagree" is about: the script prints `error: the ledger names no agent` too (my c9 run). The first-line error concerns the name the script prints over its tables (`plan_cost.py` head comment: "Its first line is `# Plan: <entry>`, which gives the name printed"), and with no tables to print the name has no use. Every skill that finds a ledger (`spec`, `land`, `refute`, `ordo-help`, `diagnose`, `roadmap` "What it reads"; `grep -rn "opens with \`# Plan" skills`) finds it by that first line and refuses "No ledger folder" otherwise. A first-line test in the condition would be a change no item asks for (rules file, "The rules" 20), and the builder reported the input without adding one, which is what the brief's Decision 1 and rule 20 ask.
- 2: holds; `skills/plan/templates/plan.md:21` reads the brief's quoted words in place of the old ones, the rest of the line unchanged.
- 3: holds; `skills/plan-orchestration/SKILL.md:289` is item 3's text verbatim.
- 4: holds in substance, with its wording departing from the brief's text, Spec 1. The two entries change in `plan-terms.md:22-23` and the glossary block equals the template (Verify 4 and the scratch `--write` rerun).
- 5: holds; `README.md:151` is the brief's quoted sentence, the rest of the paragraph unchanged in the diff.
- 6: holds; `plan_cost.py` is absent from the diff and equal to the main checkout's copy (`cmp`).

Cases of the brief's "Cases":

- 1. Agents section holds bullets: met; read on `skills/plan/SKILL.md:86` (false, a bullet exists), `:88` (runs), `:89` (writes `closing.md`), `:91` (moves on exit 0).
- 2. No bullet, no roles file: met; `:86` holds, `:87` writes the sentence and the folder moves; c2 shows the unchanged closing would stop (`error: the ledger names no agent`, exit 1).
- 3. No bullet, roles file with bullets: met; `:86` is false because the file exists, `:88` runs the script; c3 shows the script reads that file (`no transcript of agent ab12`).
- 4. Agent with no transcript: met; `:88` runs, c4 exits 1, `:90` gives the stop "A red check", `:91` keeps the folder.
- 5. Unreadable roles file, empty section: met; `:88` "an `agents/agent-roles.md` that exists, read or not ... go to the script"; c5 prints `error: cannot read .../agent-roles.md: Permission denied`, exit 1; `:90` and `:91` hold the folder.
- 6. No `## Agents` heading, no roles file: met; `:86` requires the heading, `:88` names this ledger; c6 prints `error: the ledger names no agent`, exit 1; the stop and the folder follow `:90`, `:91`.
- 7. Section with its sentence only, bullets under a later heading: met; `:86` bounds the section "up to the next `## ` heading", so as case 2; c7 confirms the script draws the same boundary (`error: the ledger names no agent`).
- 8. Case 8's command: met; `error: the ledger names no agent` on stderr, stdout empty, exit 1, on the script as it is in the worktree and in the main checkout, which are equal.

## 1. Spec

- `skills/repo-setup/templates/plan-terms.md:22-23` and `docs/glossary.md:27-28`: "holding the cost script's output, or, when the closing step did not run the script because the plan started no agent, the sentence that says so" and "A non-zero exit of the cost script holds the folder where it is, and the closing step skips the script only for a plan that started no agent"; what is wrong: item 4 gives the entries' content as "the closing report holds the cost script's output for a plan whose ledger names an agent, and otherwise the sentence that the plan started no agent; a non-zero exit of the cost script holds the folder where it is", which the brief check treated as dictated text (`agents/reviews/11b-brief-check.md`, "8. Dictated text", line 23 of the brief, "Holds"). The builder rewrote the closing report entry and added a clause to the closing step entry, and reported both as judgment calls 1 and 2. The rules file, "The rules" 4, says a rewrite of text the brief dictates stays as the brief has it and is reported as a stop, never decided as a judgment call. The builder's reason holds: under the brief's own item 1 and case 6, a ledger with no `## Agents` heading names no agent yet goes to the script, so "otherwise the sentence" would be false for it, and the builder's wording is true for every case 1 to 8. The departure is still the orchestrator's to take, and the report filed it as a judgment call where it should have stood under "Anything in the brief wrong or impossible" with the brief's wording kept. The added closing step clause equates the skip with "a plan that started no agent", as ruling M and the dictated sentence do. Failure scenario: the orchestrator reads judgment calls 1 and 2 as builder discretion and lands two glossary sentences that no brief check held to the prose standard, while the brief check's "Holds" for line 23 refers to words that are not on the tree; had the builder kept the brief's words, an orchestrator closing a ledger with no Agents heading would read in the glossary that its closing report holds the sentence, while `plan` Steps 2 runs the script and stops. Recommended disposition: keep the builder's wording at landing, since I read it against the prose standard and the rules file and found no break (ASCII, active voice, one term per concept, "ledger" and "closing step" in their glossary senses), and book it as the orchestrator's correction of the brief's item 4; verdict: item 4.

## 2. Proof

- none. Every command the report quotes reproduced with the same output (the verify lines, cases 2 to 9 on scratch ledgers, Verify 2 to 6, the `--write` message, the line counts). The step changes text only, so the rules file, "The rules" 1, asks for the text before and after, which the report quotes, and no test.

## 3. Standards

- `skills/plan/SKILL.md:87`: "A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence \"...\", and then the ledger folder moves."; what is wrong: two requirements that can each be broken while the other holds (write the report with the sentence; move the folder without the exit-0 condition) joined by "and then" in one bullet, against `docs/dev/skill-layout.md`, "Lists and tables", "One rule per bullet or item", and the brief's item 1 "One rule per bullet"; the report's judgment call 4 says each of the six bullets holds one rule. Failure scenario: an orchestrator looking for when the folder moves finds the rule in `:91` ("When the closing step has run the script, the ledger folder moves only when the script exits 0") and the skip case's move only at the tail of a bullet about the report's text; a later change to the move (for example, a condition on the roadmap diff's approval) is made in `:91` and missed in `:87`. Fix: split `:87` into "A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence \"...\"." and "When the closing step has skipped the script, the ledger folder moves." placed beside `:91`; small and inside item 1, so a fix at landing fits; verdict: none (item 1 holds otherwise).

## 4. Behaviour

- none. The one host-visible change, the closing of a ledger whose Agents section holds no bullet and which has no roles file, is stated with before and after in the report's "User-visible changes" for each of the six files.

## Declined to judge

- `README.md:151`, "runs the cost script when the plan started an agent, which prices the usage of each agent role": the relative clause now follows "an agent", so it can be read as the agent pricing the usage. The sentence is the brief's quoted text, which the builder had to keep (rules file, "The rules" 4), and no rule of the prose standard names a misattached relative clause, so it is not a Standards finding. A rewrite at landing, if the orchestrator wants one: "When the plan started an agent, the closing step of a plan runs the cost script, which prices the usage of each agent role."
- Whether "the plan started no agent" is a fact the closing step can know, in the dictated sentence, the glossary clause and README: the ledger shows only that no agent was recorded, which is the con ruling M's option (a) accepted. That is the ruling's wording.
- Whether the closing step writes `closing.md` when the script exits 1: `skills/plan/SKILL.md:89` writes "the script's output" with no exit condition, and the script's stdout is empty on an error. The builder's judgment call 1 assumes no report is written in cases 5 and 6. The text is unchanged by this step, and the wording the builder chose is true either way, so no decision of this step rests on it.
- Two `## Agents` headings in one `plan.md`: the script reads both (`_agents_section`), while `:86` says "its `## Agents` heading". `/plan` writes one (`skills/plan/SKILL.md` Steps 2), and no case or item covers it.

Reviewer usage: agent id not visible to me from inside the run, claude-opus-5-5 (ordo-high), tokens not visible to me, 36 tool uses, minutes not measured.

## Repair round 1, refuted

Step 11b of plan 2.E.A, worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-11b, base 18dd033, round 1 (`round_1`). I changed nothing in the repository or the ledger. The only git commands were `git diff` (against 18dd033, and without a base) and `git status --short`, run in the worktree. My scratch files are under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute-11b-r1.

### Verification (rerun over the repaired tree)

`sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?"`, from the worktree root:

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
exit 0
```

The brief's other verify commands, and the commands the round's section quotes:

- Verify 2, case 8 in the brief's form (scratch ledger `# Plan: 9 Scratch` plus an empty `## Agents`, the scratch ledger as transcript root, `OTEL_LOG_RAW_API_BODIES=`). The worktree's `plan_cost.py` and the main checkout's both printed `error: the ledger names no agent` on stderr, `exit 1`. `cmp` of the two files printed `cmp-equal`.
- Verify 3: `git diff --name-only` printed `README.md`, `docs/glossary.md`, `skills/plan-orchestration/SKILL.md`, `skills/plan/SKILL.md`, `skills/plan/templates/plan.md`, `skills/repo-setup/templates/plan-terms.md`. `git diff skills/plan-orchestration/templates/plan_cost.py | wc -c` and the same against 18dd033 both printed `0`. `git status --short` printed those six as ` M` and `?? .scratch/2-e-a-self-rule/agents/reviews/11b-report.md`.
- Verify 4: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
- Verify 5: `git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'` printed nothing, grep exit 1. Against 18dd033 it also printed nothing. `git diff 18dd033 -U0 | grep '^+' | grep -n ' $'` (the round's trailing-space check) printed nothing. `LC_ALL=C grep -n '[^ -~]'` over the builder's report printed nothing.
- Verify 6: `grep -rn 'closing step\|closing report\|runs the cost script\|the script exits 0' skills docs README.md` printed `skills/roadmap/SKILL.md:19`; `skills/plan/SKILL.md:80, 86, 87, 88, 89, 91, 92, 93, 94, 101, 115`; `skills/plan/templates/plan.md:21`; `skills/plan-orchestration/SKILL.md:131, 133, 136, 289, 290, 316`; `skills/plan-orchestration/references/self-rule.md:49, 51, 52, 54`; `skills/repo-setup/templates/plan-terms.md:22, 23`; `docs/glossary.md:27, 28`; `README.md:151`. I read each hit. Those the diff touches are true after the change, and the others still hold. A wider grep (`grep -rn 'cost script\|plan_cost' skills docs/dev docs/glossary.md README.md utils`) found no sentence that says the closing always runs the script.
- Scratch ledgers c2 to c9, each run as `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py <S>/L/<c> <S>/L/root; echo "exit $?"`, where S is the scratchpad folder named above (the same fixtures as round 0):

```
--- c2
error: the ledger names no agent
exit 1
--- c3
error: no transcript of agent ab12 under <S>/L/root
exit 1
--- c4
error: no transcript of agent ab12 under <S>/L/root
exit 1
--- c5
error: cannot read <S>/L/c5/agents/agent-roles.md: Permission denied
exit 1
--- c6
error: the ledger names no agent
exit 1
--- c7
error: the ledger names no agent
exit 1
--- c8
error: the ledger names no agent
exit 1
--- c9
error: <S>/L/c9/plan.md:1: the first line is not "# Plan: <entry>"
error: the ledger names no agent
exit 1
```

- The round's `grep -c` of the dictated sentence anchored at the end of the line, run on `skills/plan/SKILL.md`, printed `1`. A byte comparison (`cmp`) of the sentence extracted from `agents/briefs/11b.md` and from `skills/plan/SKILL.md:87` printed nothing, so the two are identical.

The round's delta is `diff` of `agents/reviews/11b-round-0.diff` and `git diff 18dd033`. It is exactly three hunks:

1. `README.md:151`, first sentence only.
2. `skills/plan/SKILL.md:87`, which loses `, and then the ledger folder moves`.
3. `skills/plan/SKILL.md:92`, a new bullet.

Nothing else differs apart from index hashes and the hunk header. The glossary, the template and `plan-terms.md` are byte-identical to round 0. No check was removed, and no fix reaches beyond the three rulings.

Specific checks you asked for:

- **Dictated sentence.** It is byte for byte the brief's. The round-1 bullet text also matches the ruling's quoted bullet.
- **New move bullet.** `skills/plan/SKILL.md:92` is "When the closing step has skipped the script, the ledger folder moves." It sits directly after `:91`, "When the closing step has run the script, the ledger folder moves only when the script exits 0.", at the same indent.
- **README paragraph.** Splitting the base line 151 and the current line 151 at the first ". ", everything after the first sentence is equal (`rest equal: True`). `git diff --stat` shows 1 insertion and 1 deletion. The new first sentence is the ruling's, byte for byte.
- **Moved judgment calls.** The builder's report states the brief's item 4 words, case 6 as the case they get wrong, why (the script runs and exits 1, so no sentence is written), and the ruling, under "Anything in the brief wrong or impossible". Judgment calls now number two, and the seven bullets (86 to 92) are as `skills/plan/SKILL.md` has them. I found one inaccuracy in that passage, Proof 1 below.

### Verdicts (the whole diff since 18dd033)

Items of the brief's "What to build":

- 1: holds. `skills/plan/SKILL.md:86` is the skip condition. `:87` carries the dictated sentence. `:88` sends every other ledger to the script, naming the missing heading and the existing roles file "read or not". `:89` to `:91` keep the output, the stop and the exit-0 move for a ledger that runs the script. `:92` carries the move after a skip. Each of the seven bullets is one rule.
- 2: holds. `skills/plan/templates/plan.md:21` reads the brief's quoted words, and the rest of the line is unchanged.
- 3: holds. `skills/plan-orchestration/SKILL.md:289` is the brief's text verbatim.
- 4: holds under the round's ruling 1. The wording of **closing report** and **closing step** departs from the brief's item 4 words, and the orchestrator's ruling keeps it as a correction of the brief. `plan-terms.md:22-23` and `docs/glossary.md:27-28` are unchanged since round 0, and the sync check prints `ok`.
- 5: holds under the round's ruling 3, which replaces the brief's wording. `README.md:151` is the ruling's sentence, and the rest of the paragraph is unchanged.
- 6: holds. `plan_cost.py` is absent from the diff, and `cmp` shows it equal to the main checkout's copy.

Cases of the brief's "Cases":

- 1: met. Read on `skills/plan/SKILL.md:86` (false, a bullet exists), `:88` (runs), `:89` (writes `closing.md`), `:91` (moves on exit 0).
- 2: met. `:86` holds, so the script is not run. `:87` writes the sentence and `:92` moves the folder. The scratch ledger c2 shows the unchanged closing would stop (`error: the ledger names no agent`, exit 1).
- 3: met. The roles file exists, so `:86` is false and `:88` runs the script. c3 shows the script reads that file (`no transcript of agent ab12`).
- 4: met. `:88` runs, c4 exits 1, `:90` is the stop "A red check", and `:91` keeps the folder.
- 5: met. `:88` says "an `agents/agent-roles.md` that exists, read or not, ... go to the script". c5 prints `error: cannot read .../agent-roles.md: Permission denied`, exit 1. `:90` and `:91` hold the folder.
- 6: met. `:86` requires the heading, and `:88` names this ledger. c6 prints `error: the ledger names no agent`, exit 1. The stop and the held folder follow `:90` and `:91`.
- 7: met. `:86` bounds the section "up to the next `## ` heading", so the case is as case 2. c7 shows the script draws the same boundary.
- 8: met. Verify 2 above: stderr `error: the ledger names no agent`, exit 1, on the worktree's script and on main's, which are equal.

### 1. Spec

- none. No change outside the three rulings, no decision reserved for the user taken, no dependency added, and the ADRs 0006, 0008 and 0009 the brief names are untouched in what they govern (`plan_cost.py` is unchanged).

### 2. Proof

- `.scratch/2-e-a-self-rule/agents/reviews/11b-report.md`, "Anything in the brief wrong or impossible", second bullet: "are false for case 6 (...): the closing step runs the script, which exits 1, the stop "A red check" stands, and no sentence is written. Cases 5 and 4 give the same result."
  - What is wrong: ruling 1 asks for the case the brief's words get wrong. Case 6 does, and so does case 5 (roles file unreadable, `plan.md` section empty): "otherwise the sentence" is false there, since the script runs and no sentence is written. Case 4 names an agent in `plan.md`, so the brief's first half, "holds the cost script's output for a plan whose ledger names an agent", is the half that applies. Nothing in the brief's words is false for it. I could not reproduce "cases 5 and 4" as a second wrong case. The only reading that makes the sentence true is "the same outcome" (exit 1, stop), which is not the claim the ruling asked to be stated.
  - Failure scenario: the orchestrator copies the booked correction of the brief into the landing report as "the brief's item 4 is wrong for cases 4, 5 and 6". A later reader then looks for a defect in the brief's treatment of an agent-naming ledger and finds none.
  - Verdict: none (no item or case is made violated).

### 3. Standards

- `.scratch/2-e-a-self-rule/agents/reviews/11b-report.md`, "Cases read on the text after the change", case 2: "line 86 holds, so the script is not run; line 87 writes the closing report with the dictated sentence and the folder moves."
  - What is wrong: since the round, line 87 no longer carries the move. The move is line 92. This is against `docs/dev/change-standard.md`, rule 7 (the report states the end state only), and it is the only case entry that was not updated with the round. Case 1 cites `:91` correctly.
  - Failure scenario: an orchestrator checking where the skip case's move is stated follows "line 87" and finds a bullet about the report's content. It then concludes the move is missing, or looks for it in the wrong bullet.
  - Verdict: none.
- `.scratch/2-e-a-self-rule/agents/reviews/11b-report.md`, "User-visible changes, before and after": "after the build (lines 86-91; round 1 below changes them to 86-92):", followed by the block whose second bullet ends ", and then the ledger folder moves.", and, for README, "after: `The closing step of a plan runs the cost script when the plan started an agent, which prices the usage of each agent role.`"
  - What is wrong: the "after" blocks quote the tree as the first report left it, not as it stands. The correct end-state text is in "Repair round 1" instead. Rule 7 of the change standard asks for every user-visible change with its before and after, and the end state only, with no narration. "round 1 below changes them" narrates the round.
  - Failure scenario: the orchestrator quotes the "after" of `README.md:151` or `SKILL.md:87` into the landing report or the roadmap diff, and states text that is not on main after the landing.
  - Verdict: none.
- The text of the six changed files has no finding. `skills/plan/SKILL.md:87` and `:92` and `README.md:151` are one rule per bullet or sentence. They use no dash and no filler word, and `LC_ALL=C grep -n '[^ -~]'` over the added lines printed nothing.

### 4. Behaviour

- none. The one host-visible change is the closing of a ledger whose Agents section holds no bullet and which has no roles file. It is stated with before and after for `skills/plan/SKILL.md`, the template, `plan-orchestration` "Usage", the two glossary entries and the README.

### Declined to judge

- **README sentence's two referents.** `README.md:151` now reads "When the plan started an agent, the closing step of a plan runs the cost script, ...", with "the plan" and then "a plan" for the same plan. The sentence is dictated by the round's ruling 3 and the builder kept it byte for byte, as `docs/dev/change-standard.md`, rule 4, requires, so a change is the orchestrator's. A reading that avoids the repeat is "When the plan started an agent, its closing step runs the cost script, which prices the usage of each agent role."
- **Line counts in the report.** `wc -l` printed 168 for `skills/plan/SKILL.md`, and `git show 18dd033:skills/plan/SKILL.md | wc -l` printed 165, a net +3 (6 lines added, 3 removed). The report's "Files changed" says "167 lines (...; +5 net lines)". The other five counts (190, 143, 365, 43, 126) reproduce. The `SKILL.md` count was 167 at round 0 and moved with the round's new line. No decision rests on it, so it is not a finding, as the refute skill's Proof heading says for a count.
- **Whether the closing step writes `closing.md` when the script exits 1.** The text at `skills/plan/SKILL.md:89` is unchanged by the step. The round-0 report declined it too, and no decision of this step rests on it.
- **Two `## Agents` headings in one `plan.md`.** The script reads both, while `:86` says "its `## Agents` heading". `/plan` writes one, and no item or case covers it.
- **A `plan.md` with a malformed first line, an empty `## Agents` section and no roles file (c9).** The step skips the script on it. The script would print two errors. I did not re-judge it, and the brief's Decision 1 and rule 20 of the change standard are as they were at round 0.
- **The reviewer's own tokens and minutes.** They are not visible to me from inside the run.

Reviewer usage: agent id not visible to me from inside the run, claude-sonnet-5-5, tokens not visible to me, about 28 tool uses, minutes not measured.

## Closed

- First run, Spec 1 (the glossary wording of **closing report** and **closing step**): closed in repair round 1 by ruling 1 of `agents/briefs/11b-round-1.md`, the builder's wording kept as the orchestrator's correction of the brief's item 4; the run over round 1 gives item 4 "holds".
- First run, Standards 1 (`skills/plan/SKILL.md:87`, two rules in one bullet): closed in repair round 1 by ruling 2; the run over round 1 reads `:87` and `:92` as one rule each.
- First run, Declined to judge 1 (`README.md:151`, the relative clause): closed in repair round 1 by ruling 3.
- Repair round 1, Proof 1 (the report names cases 5 and 4 as getting the brief's item 4 wrong): fixed at landing in `agents/reviews/11b-report.md`, which names case 6 and case 5 and not case 4.
- Repair round 1, Standards 1 (the report's case 2 places the move at line 87): fixed at landing in `agents/reviews/11b-report.md`, which names line 92.
- Repair round 1, Standards 2 (the report's "User-visible changes" quote the tree before the round): fixed at landing in `agents/reviews/11b-report.md`, whose "after" blocks quote the text on main.
- Repair round 1, Declined to judge 1 (`README.md:151`, "the plan" then "a plan"): fixed at landing on main, the sentence reading "When a plan started an agent, its closing step runs the cost script, which prices the usage of each agent role."
- The other declined points of both runs (whether `closing.md` is written on exit 1, two `## Agents` headings, the c9 ledger, the line count of `skills/plan/SKILL.md`) touch text this step does not change or no decision of this step; none is raised.
