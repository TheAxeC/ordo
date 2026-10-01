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
