Everything in the brief is done.

## Open items of the state file (verbatim, read from /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md)

- Open item J (2026-10-01): your reading of step 10's page, `.scratch/2-e-a-self-rule/agents/reviews/10-cost.md`, the priced usage of plans 2.E and 2.E.A and the brief checks that met dictated text. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.
- Open item K (2026-10-01): your reading of step 11's page, `.scratch/2-e-a-self-rule/agents/reviews/11-self-rule.md`, how this plan's open items ended under self-rule. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.

## The cases' first run, on the unchanged tree (base 18dd033)

Cases 4 to 8 were run as commands on scratch ledgers under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/b11b, with `OTEL_LOG_RAW_API_BODIES=` and the scratch `root` folder as the transcript root, from the worktree root: `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py <scratch ledger> <scratch>/root`. Cases 1 to 3 and 7 were read on `skills/plan/SKILL.md` Steps 2 as it stood.

| Case | First run on the unchanged tree | Result against the brief |
|---|---|---|
| 1. Agents section holds bullets | read: Steps 2 runs the script, writes its output to `agents/reviews/closing.md`, moves the folder only on exit 0 | already as the brief expects |
| 2. no bullet, no `agents/agent-roles.md` | read: Steps 2 runs the script unconditionally; command on scratch ledger `c2` (plan.md with `## Agents`, a sentence, no bullet): `error: the ledger names no agent`, exit 1, so the folder would stay | the behaviour the step adds; the brief's rules do not give a wrong result |
| 3. no bullet in plan.md, bullets in `agents/agent-roles.md` | read: the script runs. Command on `c3` (roles file holds one bullet, no transcript): `error: no transcript of agent ab12 under <scratch>/root`, exit 1 | script run as in case 1, as the brief expects |
| 4. agent named, transcript not found | command on `c4`: `error: no transcript of agent ab12 under <scratch>/root`, exit 1 | as the brief expects |
| 5. `agents/agent-roles.md` unreadable (chmod 000), Agents section with no bullet | command on `c5`: `error: cannot read <scratch>/c5/agents/agent-roles.md: Permission denied`, exit 1 | as the brief expects (the script reads the section, finds the unreadable file, and does not add the "names no agent" error) |
| 6. no `## Agents` heading, no `agents/agent-roles.md` | command on `c6`: `error: the ledger names no agent`, exit 1 | as the brief expects |
| 7. Agents section holds only its sentence, bullets under a later `## ` heading, no roles file | command on `c7`: `error: the ledger names no agent`, exit 1 (the script reads bullets only up to the next `## ` heading, the same boundary the brief gives) | the behaviour the step adds; no wrong result |
| 8. `# Plan: 9 Scratch` and an empty `## Agents` section | command on `c8`: `error: the ledger names no agent`, exit 1 | as the brief expects, before the change |

No case showed the brief's own rules giving a wrong result, so the build went ahead. One input outside the eight cases is under "Anything in the brief wrong or impossible".

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. `skills/plan/SKILL.md` Steps 2 closing sub-bullets (skip condition, dictated sentence, every other case runs the script, existing bullets kept for a ledger that runs the script) | DONE | `git diff -- skills/plan/SKILL.md`, quoted under "User-visible changes" |
| 2. `skills/plan/templates/plan.md` closing line | DONE | `git diff -- skills/plan/templates/plan.md`, quoted below |
| 3. `skills/plan-orchestration/SKILL.md` "Usage" | DONE | `git diff -- skills/plan-orchestration/SKILL.md`, quoted below |
| 4. `plan-terms.md` two terms, `docs/glossary.md` synced | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write` printed `written: the plan-terms block now equals the template`; verify 4 below |
| 5. `README.md` line 151 | DONE | `git diff -- README.md`, quoted below |
| 6. `plan_cost.py` unchanged | DONE | `git diff skills/plan-orchestration/templates/plan_cost.py \| wc -c` printed `0` |
| Verify 1, the plan's verify list through `checks.sh` | DONE | `sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md`, run from the worktree root, exit 0, printed the lines below |
| Verify 2, case 8's command | DONE | `OTEL_LOG_RAW_API_BODIES= python3 skills/plan-orchestration/templates/plan_cost.py <scratch>/c8 <scratch>/root` printed `error: the ledger names no agent`, `exit 1` |
| Verify 3, paths | DONE | `git diff --name-only` printed `README.md`, `docs/glossary.md`, `skills/plan-orchestration/SKILL.md`, `skills/plan/SKILL.md`, `skills/plan/templates/plan.md`, `skills/repo-setup/templates/plan-terms.md`; the plan_cost.py diff is empty (item 6) |
| Verify 4 | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| Verify 5 | DONE | `git diff -U0 \| grep '^+' \| LC_ALL=C grep -n '[^ -~]'` printed nothing, `grep exit 1` |
| Verify 6 | DONE | the grep and the reading of each hit are under "Carrying the change" |

The checks.sh lines, verbatim:

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

No test was added: the step changes skill text and the glossary only, and `plan_cost.py` is unchanged, so there is no changed script behaviour to prove by a failing test (change standard, rules 1 and 13; the text is fixed by reading, and the report quotes before and after).

## Cases read on the text after the change

Each read on `skills/plan/SKILL.md` Steps 2 lines 86-91 as the closing step would follow them.

1. Agents section holds bullets: the skip condition (line 86) needs "no bullet", so it is false; line 88 runs the script; line 89 writes its output to `agents/reviews/closing.md`; line 91 moves the folder on exit 0.
2. No bullet and no `agents/agent-roles.md`: line 86 holds, so the script is not run; line 87 writes the closing report with the dictated sentence and the folder moves.
3. No bullet in plan.md, `agents/agent-roles.md` holds bullets: the second half of line 86's condition is false (the file exists), so line 88 runs the script as in case 1.
4. Agent named, transcript not found: line 88 runs the script, which exits 1 as run above; line 90 (unchanged) makes it the stop "A red check", and line 91 keeps the folder in place.
5. `agents/agent-roles.md` exists but cannot be read: line 88 says a roles file that exists, read or not, goes to the script, which exits 1 with `error: cannot read <path>: Permission denied` (run above); line 90 is the stop and line 91 keeps the folder.
6. No `## Agents` heading and no roles file: line 86 needs the heading present, so it is false; line 88 sends the plan to the script, which exits 1 with `error: the ledger names no agent` (run above); the stop and the folder staying follow lines 90 and 91.
7. Agents section holds only its sentence, bullets under a later `## ` heading: line 86 reads the section "up to the next `## ` heading", so those bullets are not in it; with no roles file the case is as case 2.
8. Case 8's command: unchanged by this step, prints `error: the ledger names no agent`, exit 1 (Verify 2).

## Carrying the change

`grep -rn 'closing step\|closing report\|runs the cost script\|the script exits 0' skills docs README.md`, each hit read after the change:

- `skills/plan/SKILL.md:86-89, 91`: rewritten by this step (items 1); line 90, the "A red check" stop, is unchanged and applies to a ledger that runs the script.
- `skills/plan/SKILL.md:80, 92, 93, 100, 114`: mention the closing step or "the closing step `/plan` writes itself"; true after the change.
- `skills/plan/templates/plan.md:21`: changed (item 2).
- `skills/plan-orchestration/SKILL.md:131, 133, 136, 316`: line 136, "After the closing step, it also names the path of the closing report", holds because a closing report exists for every closed plan that reaches the move; the others do not mention the script.
- `skills/plan-orchestration/SKILL.md:289`: changed (item 3).
- `skills/plan-orchestration/references/self-rule.md:49, 51, 52, 54`, outside this step's paths: line 52, "after the closing step has written the closing report and moved the ledger folder", holds for both closings; named here, not changed.
- `skills/roadmap/SKILL.md:19`: "the closing step of a plan uses it" (`/roadmap done`); unaffected, outside the paths.
- `skills/repo-setup/templates/plan-terms.md:22-23` and `docs/glossary.md:27-28`: changed (item 4), the glossary by the sync.
- `README.md:151`: changed (item 5); the rest of the paragraph (the body folder, the transcripts, the lower bound) describes the script and holds for a plan that runs it.

Statements about the changed files as a whole: `skills/plan/SKILL.md` line 93 ("the Agents section and the step list with the closing step last") and line 74 ("the `## Agents` section is written with its sentence and no bullet") are unchanged and still hold. The `cost script` glossary entry (`plan-terms.md:27`, `docs/glossary.md:32`) says nothing about when it runs and holds. `plan_cost.py` head comment, line 55, still lists `error: the ledger names no agent`, which the script still prints.

## Files changed, with line counts

- `skills/plan/SKILL.md`: 167 lines (lines 86-91 replace the four bullets that were at 86-89; +4 net lines)
- `skills/plan/templates/plan.md`: 43 lines (line 21)
- `skills/plan-orchestration/SKILL.md`: 365 lines (line 289)
- `skills/repo-setup/templates/plan-terms.md`: 126 lines (lines 22-23)
- `docs/glossary.md`: 143 lines (lines 27-28, by the sync)
- `README.md`: 190 lines (line 151)
- `.scratch/2-e-a-self-rule/agents/reviews/11b-report.md`: this report

## Judgment calls

1. `plan-terms.md` **closing report**: the brief says the report holds the script's output "for a plan whose ledger names an agent, and otherwise the sentence that the plan started no agent". "Otherwise" would be wrong for cases 5 and 6, where the script runs, exits 1 and no closing report is written. The entry reads "holding the cost script's output, or, when the closing step did not run the script because the plan started no agent, the sentence that says so". The condition itself stays in `plan`, Steps 2 only, so it is written once.
2. `plan-terms.md` **closing step**: the sentence "A non-zero exit of the cost script holds the folder where it is" stays, with the clause ", and the closing step skips the script only for a plan that started no agent" added, so the entry no longer implies the script always runs.
3. `skills/plan/SKILL.md` line 88: the brief's text, "a `plan.md` with no `## Agents` heading, which `/plan` always writes (line 74)", reads as if `/plan` writes plans with no heading, and a line number is not a citation form the change standard allows. It is written "(`/plan` always writes the heading)".
4. The four existing bullets were split by the new conditions into six bullets (86-91), one rule each: the skip condition, the skip action, the run rule, the output location, the red-check stop (text unchanged), the move condition. The first of the old two bullets ("Before the folder moves, the closing step runs...") became the "every other case" bullet, with "in every other case" added; the old "The closing step writes the script's output" and "The ledger folder moves only when the script exits 0" became conditional on the script having run, which the brief's item 1 asks for.

## User-visible changes, before and after

`skills/plan/SKILL.md` lines 86-89, before:

```
- Before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.
- The closing step writes the script's output to `agents/reviews/closing.md`, the closing report.
- A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`, and the stop message holds the script's `error:` lines. A model the table lacks is covered by a row copied into the table from the pricing page, committed with the closing.
- The ledger folder moves only when the script exits 0.
```

after (lines 86-91):

```
- The closing step skips the cost script only when `plan.md` has its `## Agents` heading with no bullet under it, up to the next `## ` heading, and the ledger has no `agents/agent-roles.md`.
- A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence "The plan started no agent: `plan.md`'s Agents section holds no agent bullet and the ledger has no `agents/agent-roles.md`, so the closing step did not run the cost script.", and then the ledger folder moves.
- In every other case, before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder: a `plan.md` with no `## Agents` heading (`/plan` always writes the heading) and an `agents/agent-roles.md` that exists, read or not, both go to the script, so the closing step and the script never disagree.
- A closing step that runs the script writes the script's output to `agents/reviews/closing.md`, the closing report.
- A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`, and the stop message holds the script's `error:` lines. A model the table lacks is covered by a row copied into the table from the pricing page, committed with the closing.
- When the closing step has run the script, the ledger folder moves only when the script exits 0.
```

`skills/plan/templates/plan.md:21`, before: `- <last> the closing: the cost script's output written as the closing report, the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)`; after: `- <last> the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)`.

`skills/plan-orchestration/SKILL.md:289`, before: `- The closing report holds the cost script's output, as the `plan` skill's Steps 2 says.`; after: `- The closing report holds the cost script's output, or the sentence that the plan started no agent, as the `plan` skill's Steps 2 says.`

`skills/repo-setup/templates/plan-terms.md:22-23` and `docs/glossary.md:27-28`, before:

```
- **closing report**: the file `agents/reviews/closing.md` the closing step writes, holding the cost script's output for the plan. Stated in: `plan`, Steps 2; `plan-orchestration`, "Usage".
- **closing step**: ... A non-zero exit of the cost script holds the folder where it is. Stated in: `plan`, Steps 2.
```

after:

```
- **closing report**: the file `agents/reviews/closing.md` the closing step writes, holding the cost script's output, or, when the closing step did not run the script because the plan started no agent, the sentence that says so. Stated in: `plan`, Steps 2; `plan-orchestration`, "Usage".
- **closing step**: ... A non-zero exit of the cost script holds the folder where it is, and the closing step skips the script only for a plan that started no agent. Stated in: `plan`, Steps 2.
```

`README.md:151`, before: `The closing step of a plan runs the cost script, which prices the usage of each agent role.`; after: `The closing step of a plan runs the cost script when the plan started an agent, which prices the usage of each agent role.` The rest of the paragraph is unchanged.

## Anything in the brief wrong or impossible

- Nothing in the eight cases is wrong or impossible.
- One input outside the cases: a `plan.md` whose first line is not `# Plan: <entry>`, with an empty `## Agents` section and no `agents/agent-roles.md`. On scratch ledger `c9` (plan.md `not a plan`, then `## Agents`) the unchanged script prints two errors: `<scratch>/c9/plan.md:1: the first line is not "# Plan: <entry>"` and `error: the ledger names no agent`, exit 1. Under the brief's skip condition (heading present, no bullet, no roles file) the closing step skips the script, so a malformed first line would not stop the closing there. The brief's Decision 1 limits the skip to a ledger "as `/plan` writes it", which has the correct first line; the condition as dictated does not test it. This is for the orchestrator to rule on if the first line matters at the closing; the built text follows the brief's condition and adds nothing.
