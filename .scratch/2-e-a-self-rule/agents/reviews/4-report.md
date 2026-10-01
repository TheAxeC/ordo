# Report: step 4, the cost script, its price table and its test

Everything in the brief is done.

## Open items of the state file (`.scratch/2-e-a-self-rule/orchestrator-state.md`, "Open items", verbatim)

- none.

## The cases' first run, on the unchanged tree

The test `skills/plan-orchestration/templates/plan_cost.test.sh` holds every case of "Cases", 56 runs (the price loop is three), written before the script. On the tree with no `plan_cost.py` and no `prices.txt`, the test, run as it is (`sh <copy of the test beside no script>`), prints and exits 1:

```
FAIL: the hand-computed fixture: exit status 2, expected 0; stderr: /Users/axelfaes/.pyenv/versions/3.13.4/bin/python3: can't open file '/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/final-first/exit/plan_cost.py': [Errno 2] No such file or directory
exit 1
```

To record each case's result, a scratch copy of the test whose `fail` prints and does not exit was run on the same tree (no script). It printed one `FAIL: <case>: ...` line per case for 56 of 56 runs. Each line has the form `FAIL: <case>: <status or stream>; stderr: python3: can't open file '<folder>/plan_cost.py': [Errno 2] No such file or directory`, and the part after the case name is, per case:

| Case | First run on the unchanged tree |
|---|---|
| the hand-computed fixture | exit status 2, expected 0 |
| ag1 listed in agent-roles.md instead of plan.md | exit status 2, expected 0 |
| the default transcript root, one argument | exit status 2, expected 0 |
| a relative ledger path from another working folder | exit status 2, expected 0 |
| a space in the ledger folder and in the transcript root | exit status 2, expected 0 |
| /usr/bin/python3 | exit status 2, expected 0 |
| responses on two models, each priced at its own model | exit status 2, expected 0 |
| responses sharing only a message id or only a request id are counted apart | exit status 2, expected 0 |
| every row of prices.txt priced from 1000000 of each count | exit status 2, expected 0 |
| 0.005 rounds half up to 0.01 | exit status 2, expected 0 |
| two rows of 0.004 sum to 0.008 and print 0.01 in the role row and the total | exit status 2, expected 0 |
| two role rows of 0.004 print 0.00 and the total prints 0.01 | exit status 2, expected 0 |
| the agent table ordered by kind, step as a number and then its letter, round as a number, id | exit status 2, expected 0 |
| plan 2.E's form: no Agents heading, every agent in agent-roles.md, one of them step 14b | exit status 2, expected 0 |
| an agent with only a zero-count entry | exit status 2, expected 0 |
| subagent files of separate sessions and a nested folder | exit status 2, expected 0 |
| standard speed, not_available geo, standard tier and no web search are priced | exit status 2, expected 0 |
| a model the table lacks in three responses | exit status 2, expected 1 |
| two missing models of one agent and the same model of another, one line each | exit status 2, expected 1 |
| an agent with no transcript and one with two | exit status 2, expected 1 |
| the missing model and the missing transcript in one run | exit status 2, expected 1 |
| an id listed in plan.md and in agent-roles.md | exit status 2, expected 1 |
| agent ids a*b, ../x and an empty id | exit status 2, expected 1 |
| a bullet not of the form, a * bullet and a bullet with no model, in the section and in agent-roles.md | exit status 2, expected 1 |
| a role that is not a role kind, and near misses | exit status 2, expected 1 |
| no agent bullet in the ledger | exit status 2, expected 1 |
| a plan.md whose first line is # Notes | exit status 2, expected 1 |
| a plan.md whose first line names no entry | exit status 2, expected 1 |
| a plan.md that is not UTF-8 | exit status 2, expected 1 |
| agent-roles.md that is a directory | exit status 2, expected 1 |
| a line that is not JSON, one that is [] and one that is not UTF-8 | exit status 2, expected 1 |
| a response with no model, a null, a negative, a fractional, a true and a missing count, and a usage, a cache_creation and a server_tool_use that are not objects | exit status 2, expected 1 |
| the zero-count entry with output 5 and an entry with no message.id | exit status 2, expected 1 |
| cache_creation_input_tokens that is not the sum, and above 0 with no cache_creation | exit status 2, expected 1 |
| fast speed, us geo, batch tier and two web searches | exit status 2, expected 1 |
| a folder under the transcript root that cannot be read | exit status 2, expected 1 |
| a transcript file that cannot be read | exit status 2, expected 1 |
| a copy of the table with a blank line and a third comment line | exit status 2, expected 0 |
| a missing table | exit status 2, expected 1 |
| an empty table | exit status 2, expected 1 |
| a table whose first line is a row | exit status 2, expected 1 |
| a row of five fields | exit status 2, expected 1 |
| a row of seven fields | exit status 2, expected 1 |
| a price abc | exit status 2, expected 1 |
| a price NaN | exit status 2, expected 1 |
| a price -4 | exit status 2, expected 1 |
| a model listed twice | exit status 2, expected 1 |
| two bad rows are both reported | exit status 2, expected 1 |
| a price of 0.15 on 100000 tokens is exactly 0.015 and rounds up to 0.02 | exit status 2, expected 0 |
| no argument | stderr differs, got: python3's can't-open-file line (python3 also exits 2 here) |
| three arguments | stderr differs, same |
| a ledger folder that does not exist | stderr differs, same |
| a ledger path that is a file | stderr differs, same |
| a ledger folder with no plan.md | stderr differs, same |
| a transcript root that does not exist | stderr differs, same |
| a transcript root that is a file | stderr differs, same |

No case is one the brief's own rules get wrong. The brief's hand-computed figures were recomputed with exact fractions in a scratch script: 29.02, 4.50, 14.00, 4.20, 2.20, 53.92, the 15.02 the counted-twice response adds (44.04), 0.005 to 0.01 and 0.004 plus 0.004 to 0.01. All agree with the brief.

## DONE / NOT DONE

| Item | State | Command that proves it and its output |
|---|---|---|
| Verify 1, the plan's verify list | DONE | `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, exit 0, output below |
| Verify 2, the test passes | DONE | `sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 \| tail -1` prints `PASS: plan_cost.py scratch tests`, exit 0 (without the filter, exit 0 too); on the unchanged tree it fails, quoted above |
| Verify 3, the pair counted twice fails the test | DONE | a scratch copy of the templates folder with `responses[parsed[0]]` changed to `responses[(number, parsed[0])]`: `FAIL: the hand-computed fixture: stdout differs, got: ...` with `builder  1  1020000  2000000  2000000  100000000  900000  44.04` and `Total  5  1995000  3400000  2625000  118500000  1325000  68.94`, exit 1 |
| Verify 4, the Opus 5.5 cache read at 0.40 fails the test | DONE | a scratch copy with the `claude-opus-5-5` row's cache read changed from 0.20 to 0.40: `FAIL: the hand-computed fixture: stdout differs, got: ...` with `brief check  1  250000  400000  0  2500000  50000  5.00`, `reviewer  1  500000  1000000  0  10000000  250000  16.00` and `Total  5  1985000  3400000  1625000  68500000  1225000  56.62`, exit 1 |
| Verify 5, the script on this plan | DONE | output below, exit 0; its total 24.89 equals 24.893941 computed by an independent scratch script over the same 15 agents |
| Verify 6, the glossary block | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` |
| Verify 7, the greps | DONE | below |
| Item 1, `prices.txt` | DONE | 6 lines, the two comment lines of the brief and four aligned rows; the hand-computed fixture and the case "every row of prices.txt priced from 1000000 of each count" price all four |
| Item 2, `plan_cost.py` | DONE | the test; `/usr/bin/python3` (3.9.6) runs the case "/usr/bin/python3" and the verify 5 command |
| Item 3, `plan_cost.test.sh` | DONE | last line `PASS: plan_cost.py scratch tests`; its head comment lists the cases |
| Item 4, the closing step's action | DONE | `skills/plan/SKILL.md` lines 83-86 and `skills/plan/templates/plan.md` line 21, quoted below |
| Item 5, `plan-orchestration` | DONE | `skills/plan-orchestration/SKILL.md` line 130, and `## Usage` lines 276-277 |
| Item 6, the terms | DONE | `skills/repo-setup/templates/plan-terms.md` lines 21, 22 and 26 and `docs/glossary.md` lines 26, 27 and 31; `sync_rules.py . --only glossary` ok |
| Item 7, the test in the command blocks | DONE | `docs/dev/building.md` line 12 and `docs/dev/change-standard.md` line 73, after `transcript_window.test.sh` |
| Item 8, the README | DONE | `README.md` lines 132-136 |
| Item 9, no version change | DONE | no `metadata.version` touched |

### Verify 1, the lines `checks.sh` printed (verbatim)

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

The new test is not in the verify list yet (the orchestrator adds it at landing). `LC_ALL=C grep -n '[^ -~]'` over the three new files prints nothing, and a grep for a tab in them prints 0 for each.

### Verify 5, `python3 skills/plan-orchestration/templates/plan_cost.py .scratch/2-e-a-self-rule` (exit 0)

```
Plan 2.E.A self-rule: priced usage of its agents
Prices from /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-4/skills/plan-orchestration/templates/prices.txt:
Prices in US dollars per million tokens, copied by hand from https://platform.claude.com/docs/en/about-claude/pricing.

Role                   Agents  Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
builder                     3    288         1356686               0    20752614    3954        7.58
brief check                 3    196          544894               0    12558955    1394        5.26
reviewer                    3    242          551133               0    15647943    2495        5.94
reviewer over a round       3    178          468109               0     9303738    1641        4.23
grill lookup                3    100          251024               0     3019080     819        1.88
Total                      15   1004         3171846               0    61282330   10303       24.89

Agent              Role                             Model              Input  Cache write 5m  Cache write 1h  Cache read  Output  Cost (USD)
a15eaa0740335c7a3  builder of step 1                claude-sonnet-5-5     98          313453               0     5384216     547        1.87
af948d39c18780b67  builder of step 2                claude-sonnet-5-5    104          632159               0     9473075    1911        3.49
aaf2cfc92bfcb1844  builder of step 3                claude-sonnet-5-5     86          411074               0     5895323    1496        2.22
a392a12ca146ff975  brief check of step 1            claude-opus-5-5       44          143943               0     2237294     276        1.17
abe95054772aeb0bc  brief check of step 2            claude-opus-5-5       74          206719               0     5303442     624        2.11
a844cca8905e3bb9c  brief check of step 3            claude-opus-5-5       78          194232               0     5018219     494        1.98
ae9f3748642ce9c1e  reviewer of step 1               claude-opus-5-5       68          169004               0     4142756     362        1.68
aec84f54a17e39016  reviewer of step 2               claude-opus-5-5       84          203783               0     5774576    1494        2.20
afaa4e2644e7b3e6a  reviewer of step 3               claude-opus-5-5       90          178346               0     5730611     639        2.05
a96acd76fe31399ad  reviewer of step 1 over round 1  claude-opus-5-5       40          116680               0     1659065     154        0.92
ae5cc0ca5a0659313  reviewer of step 2 over round 1  claude-opus-5-5       70          161281               0     3558528     883        1.54
af5b739d11c2d60e0  reviewer of step 3 over round 1  claude-opus-5-5       68          190148               0     4086145     604        1.78
a508428b7705f46eb  grill lookup                     claude-opus-5-5       48           91579               0     1560867     389        0.78
aea0212a318abe908  grill lookup                     claude-opus-5-5       22           66447               0      463960     245        0.43
af464f4a770b333a6  grill lookup                     claude-opus-5-5       30           92998               0      994253     185        0.67
```

The agents are the 15 bullets of this plan's `## Agents` section as it stands in the worktree. Step 4's builder, reviewers and brief check, and the orchestrating session, are not in the list.

### Verify 7, the greps across `skills/`, `utils/`, `docs/` and `README.md`

Commands: `grep -rn 'closing step'`, `'closing report'`, `'cost script'`, `'price table'`, `'plan_cost.py'`, `'prices.txt'`, `'## Usage'` and `'"Usage"'`, each over `skills utils docs README.md`. Hits inside the step's paths are the step's own text. Hits outside the paths, each judged:

- `skills/roadmap/SKILL.md:19`, `/roadmap done <entry> ... the closing step of a plan uses it`: still true; the closing step still ticks the entry through `/roadmap done`.
- `docs/roadmap.md:25`, the gate of entry 2.E.A, "the cost script prints each role's priced usage for plan 2.E and for plan 2.E.A and passes its test": still true of the script as built. The plan 2.E output needs step 5's `agents/agent-roles.md`.
- `docs/adr/0006-the-ledger-records-every-agent-s-id-with-its-role.md:11`, "The cost script takes the ids and roles from the plan's ledger only": still true; the script reads `plan.md` and `agents/agent-roles.md` of the ledger folder.
- `docs/adr/0007-the-run-over-a-repair-round-runs-on-its-own-reviewer-model.md:20`, "The cost script of entry 2.E.A measures the difference against plan 2.E": still true.
- `docs/adr/0008-the-cost-script-prices-from-a-table-copied-by-hand.md:1, 7, 11` and `docs/adr/README.md:18`: the script reads a table kept beside it, per model id, with the five prices and the page it was copied from in its first line, updated by hand, and a model the table lacks is an error naming it (`error: model claude-opus-9 of agent ab1 is not in <table>`). The record holds.
- No hit of `plan_cost.py`, `prices.txt` or `## Usage` outside the paths.
- No hit of "price table" outside the paths other than ADR 0008 above; the glossary uses it only as "Its price table".

## Files changed, with line counts (`wc -l`)

| File | Lines |
|---|---|
| `skills/plan-orchestration/templates/plan_cost.py` (new) | 502 |
| `skills/plan-orchestration/templates/prices.txt` (new) | 6 |
| `skills/plan-orchestration/templates/plan_cost.test.sh` (new) | 809 |
| `skills/plan-orchestration/SKILL.md` | 350 |
| `skills/plan/SKILL.md` | 145 |
| `skills/plan/templates/plan.md` | 42 |
| `skills/repo-setup/templates/plan-terms.md` | 123 |
| `docs/glossary.md` | 140 |
| `docs/dev/building.md` | 33 |
| `docs/dev/change-standard.md` | 89 |
| `README.md` | 186 |
| `.scratch/2-e-a-self-rule/agents/reviews/4-report.md` | this file |

No other file was written. No git command was run by the builder (the verify list's last command runs `git ls-files` inside `checks.sh`).

## Rule 13, the behaviours whose failure costs something

Every row's case is in the first-run table above; on the unchanged tree each fails with `exit status 2, expected N` (no script), and the proof that the case tests the behaviour is the scratch run named in the last column, a copy of the script or table changed in one place, each giving `FAIL: <case>: ...` with the case name in the second column.

| Behaviour | Case | Failing line with the behaviour changed in a scratch copy |
|---|---|---|
| Each `message.id` and `requestId` pair counted once, with the last entry's counts | the hand-computed fixture | pairs not counted once: `FAIL: the hand-computed fixture: stdout differs` (ab1 44.04); first entry kept: `FAIL: the hand-computed fixture: stdout differs` |
| A pair is both ids, not one | responses sharing only a message id or only a request id are counted apart | key on the message id alone, and on the request id alone: `FAIL: responses sharing only a message id or only a request id are counted apart: stdout differs` |
| Opus 5.5 cache read at 0.20 | the hand-computed fixture | `FAIL: the hand-computed fixture: stdout differs` (verify 4) |
| Each response priced at its own model, models listed in the order met | responses on two models, each priced at its own model | models sorted: `FAIL: responses on two models, each priced at its own model: stdout differs` |
| Every row of the shipped table | every row of prices.txt priced from 1000000 of each count | a changed price in the `claude-sonnet-5` row (cache write 5m 2.50 to 2.60), in the haiku row (1.25 to 1.30) and in its output price (5 to 6), each: `FAIL: every row of prices.txt priced from 1000000 of each count: stdout differs`; the `claude-sonnet-5-5` row (2.50 to 2.60): `FAIL: the hand-computed fixture: stdout differs` |
| Prices parsed from the table's text, not as floats | a price of 0.15 on 100000 tokens | `Decimal(float(price))`: `FAIL: a price of 0.15 on 100000 tokens is exactly 0.015 and rounds up to 0.02: stdout differs` |
| Half-up rounding of an agent's cost | 0.005 rounds half up to 0.01 | `ROUND_HALF_EVEN`: `FAIL: 0.005 rounds half up to 0.01: stdout differs` |
| A role row and the total from the exact sum | two rows of 0.004 sum to 0.008 ...; two role rows of 0.004 ... | role cost from rounded agent costs: `FAIL: two rows of 0.004 sum to 0.008 and print 0.01 in the role row and the total: stdout differs`; total from rounded role costs: `FAIL: two role rows of 0.004 print 0.00 and the total prints 0.01: stdout differs` |
| Step as a number then its letter, round as a number | the agent table ordered by kind, step ... | step as text and round as text, each: `FAIL: the agent table ordered by kind, step as a number and then its letter, round as a number, id: stdout differs` |
| Only the Agents section of `plan.md` is read | the hand-computed fixture | whole `plan.md` read, and section end not at the next `## `: `FAIL: the hand-computed fixture: exit status 1, expected 0; stderr: error: ...` |
| An assistant entry with no usage and a zero-count entry are passed over | the hand-computed fixture; an agent with only a zero-count entry | no usage check: `FAIL: the hand-computed fixture: exit status 1, expected 0; stderr: Traceback ...`; no zero skip: `FAIL: an agent with only a zero-count entry: exit status 1, expected 0` |
| A model the table lacks, one line per model and agent | a model the table lacks in three responses; two missing models of one agent ... | stop at the first missing model: `FAIL: two missing models of one agent and the same model of another, one line each: stderr differs` |
| Two transcripts of one id, none | an agent with no transcript and one with two | first transcript only: `FAIL: an agent with no transcript and one with two: stderr differs` |
| A bullet not of the form is an error, `*` bullets included | a bullet not of the form, a * bullet ... | only `- ` lines counted as bullets: `FAIL: a bullet not of the form, a * bullet and a bullet with no model, in the section and in agent-roles.md: stderr differs` |
| A cache-write sum that does not match is an error | cache_creation_input_tokens that is not the sum ... | check removed: `FAIL: cache_creation_input_tokens that is not the sum, and above 0 with no cache_creation: stderr differs` |
| A price the table lacks (web search, geo) is an error | fast speed, us geo, batch tier and two web searches | threshold 5, and geo `eu`: `FAIL: fast speed, us geo, batch tier and two web searches: stderr differs` |
| An unreadable transcript is an error line | a transcript file that cannot be read | OSError narrowed to FileNotFoundError: `FAIL: a transcript file that cannot be read: stderr differs, got: Traceback (most recent call last):` |
| Table lines read from the second line, comments and blanks passed over, first line trimmed | a copy of the table with a blank line and a third comment line; the table cases | `#` lines not passed over, and the header text not trimmed: `FAIL: the hand-computed fixture: exit status 1, expected 0` and `FAIL: the hand-computed fixture: stdout differs` |

What the test does not cover: a transcript read while the runner is still writing it (a torn last line is reported as `not valid JSON`); the same pair in two agents' files (counted once per file; none exists among the 22955 pairs of this machine's project transcripts, checked by a scratch script); the output closed early by the reader; a symbolic link under the transcript root; and the two unreadable-file cases when the test runs as root (skipped, as `transcript_window.test.sh` skips its own).

## Rule 14, each sentence about a changed file as a whole

- `skills/plan-orchestration/SKILL.md:10`, "It leaves behind each landed step on main, its landing report in the ledger, and a state file that says where the plan stands": no "only"; holds. `:129`, "The loop ends only at a pause or when nothing unblocked is left": holds, the closing step is a step of the plan. `:347`, "Every skill the loop invokes (...) is invoked through the runner every time": the cost script is not a skill; holds.
- `skills/plan/SKILL.md:10`, "It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`": holds; `closing.md` is written later, inside `agents/reviews/`. `:88`, the step is done when the draft holds ... "the step list with the closing step last": holds.
- `skills/plan/templates/plan.md:3`, "except the bookkeeping steps the orchestrator does itself (marked)": the closing line keeps `(orchestrator, no agent)`; holds.
- `docs/glossary.md:3` and the block: the block equals `plan-terms.md` (`sync_rules.py . --only glossary` ok); each new term is in alphabetical place (`closing report` after `Closed`, before `closing step`; `cost script` after `configuration block`, before `dead builder`).
- `docs/dev/building.md:3`, "Each test builds scratch repositories or scratch files under `$TMPDIR` and removes them; none touches the installed skills": holds for the new test (`mktemp -d "${TMPDIR:-/tmp}/plan-cost-test.XXXXXX"`, removed by a trap). `:33`, a new script adds its test here and to `change-standard.md`'s block: done in both.
- `docs/dev/change-standard.md`, "Commands and their filters": the new line carries `2>&1 | tail -1` like its neighbours; the sentence "the glossary check and the ASCII check take no filter" holds.
- `README.md:117-136`, "The same comparison runs on its own" and "The same check runs on its own": the new paragraph states the cost script's own command in the same form, with `<skills>` as defined at line 117.
- `plan_cost.py`'s docstring, rule 14's list of usage, inputs, errors and exit statuses: every `error:` string in the code is in the docstring list (checked by reading each `errors.append`, `_Problem(...)` and `_usage_error(...)` against it), exit statuses 0, 1 and 2 are listed, and the inputs are the table, `plan.md`, `agents/agent-roles.md`, the transcripts and `$HOME`.

## Before and after of the text changed

`skills/plan/SKILL.md`, Steps 2, after line 82 (the closing bullet, unchanged), four sub-bullets added (lines 83-86):

```
     - Before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.
     - The closing step writes the script's output to `agents/reviews/closing.md`, the closing report.
     - A non-zero exit of the script is the stop "A red check" of `plan-orchestration`, and the stop message holds the script's `error:` lines.
     - The ledger folder moves only when the script exits 0.
```

`skills/plan/templates/plan.md:21`:

- Before: `- <last> the closing: the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)`
- After: `- <last> the closing: the cost script's output written as the closing report, the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)`

`skills/plan-orchestration/SKILL.md`, Steps 10 (line 130, new sub-bullet under "The final message opens as ..."): `- After the closing step, it also names the path of the closing report.` `## Usage` (lines 276-277, after the landing report's bullet): `- The closing report holds the cost script's output, as the `plan` skill's Steps 2 says.` and `- A person runs the cost script by hand on any ledger folder, open or archived, as `python3 <this skill's folder>/templates/plan_cost.py <ledger folder> [<transcript root>]`.`

`skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, the same text in both:

- Before: `- **closing step**: the last step of every plan, which `/plan` writes itself: the roadmap entry ticked with the gate's output through `/roadmap done`, and the ledger folder moved to `<archive_root>/`. Stated in: `plan`, Steps 2.`
- After: `- **closing step**: the last step of every plan, which `/plan` writes itself: the closing report written before the folder moves, the roadmap entry ticked with the gate's output through `/roadmap done`, and the ledger folder moved to `<archive_root>/`. A non-zero exit of the cost script holds the folder where it is. Stated in: `plan`, Steps 2.`
- Added: `- **closing report**: the file `agents/reviews/closing.md` the closing step writes, holding the cost script's output for the plan. Stated in: `plan`, Steps 2; `plan-orchestration`, "Usage".`
- Added: `- **cost script**: the script `templates/plan_cost.py` of `plan-orchestration`, which prices each agent role of a plan from the agents' transcripts, counting each response once. Its price table, `templates/prices.txt`, is copied by hand from the pricing page. Stated in: `plan-orchestration`, "Usage".`

`docs/dev/building.md:12` (after `transcript_window.test.sh`): `sh skills/plan-orchestration/templates/plan_cost.test.sh  # plan_cost.py on scratch ledger folders and transcript roots: the hand-computed costs of every role, a response written as several entries counted once, each price and rounding half up, the order of the agent table, both forms of the agent list, every error line and the usage errors`

`docs/dev/change-standard.md:73`: `sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1`

`README.md:132-136`, after the `check_config.py` block: `The closing step of a plan runs the cost script, which prices the usage of each agent role from the agents' transcripts, and the same script runs on its own on any ledger folder, open or archived, with `<transcript root>` defaulting to `~/.claude/projects`:` and a `sh` block `python3 <skills>/plan-orchestration/templates/plan_cost.py <ledger folder> [<transcript root>]`.

Rule 17: the closing step's old text is kept whole in the new (the tick through `/roadmap done`, the move to `<archive_root>/`, "Stated in" unchanged), with the two additions the brief names.

## Judgment calls the brief left open

1. Output layout: a blank line between the header block and the role table and between the two tables, no titles above the tables, text columns (`Role`, `Agent`, `Model`) left-aligned, numeric columns right-aligned, two spaces between columns, the `Agents` cell of `Total` the number of agents.
2. Error wording: the brief fixes only `error: model <model> of agent <id> is not in <table path>`. Every other line is as the head docstring lists, with `<file>:<line>:` after `error: ` where a file and line apply; the test asserts each one in full.
3. Paths in error lines are as given on the command line joined with the file name (the table's path is absolute), not resolved.
4. A bullet is a line that starts, after any spaces, with `-`, `*` or `+` and a space or the end of the line; a bullet that is not of the agent form is an error, so a `* ab1: ...` line is never silently dropped.
5. A price in the table is digits with an optional fractional part, so `NaN`, `-4`, `1e3` and `.5` are errors naming the table's path and line.
6. Per transcript entry, the first failing check is its one error, in the order the docstring gives; the rest of the file is still read.
7. A usage with no `cache_creation_input_tokens` is an error; a `cache_creation` or `server_tool_use` of `null` counts as absent; one of any other type that is not an object is an error.
8. Error order: table, `plan.md`, `agents/agent-roles.md`, unreadable folders under the transcript root, then each agent in print order (its transcript errors, then its model line).
9. With an error in the table, the model lines are left out (no price can be judged missing); with an unreadable ledger file, "the ledger names no agent" is left out.
10. Pairs are counted once per agent transcript file.
11. Cases beyond the brief's list: responses sharing only one id; every row of `prices.txt`; two role rows rounding to 0.00; the price 0.15; two missing models of one agent; a `*` bullet and an empty id; a bullet with no model; role near misses; a `plan.md` with an empty entry and one that is not UTF-8; `agent-roles.md` as a directory; a line that is not UTF-8 in a transcript; a `true` count, a `usage`, `cache_creation` and `server_tool_use` that are not objects; an assistant entry with no usage; an unreadable folder and an unreadable transcript file; an empty table, a table whose first line is a row, a row of seven fields, the prices `NaN` and `-4`, two bad rows; a transcript root that is a file.
12. Closing step text: four sub-bullets in `plan`'s Steps 2 (run, write, stop, hold), and in the template line "the cost script's output written as the closing report" as the first clause.

## Anything in the brief that was wrong or impossible

Nothing. One difference from the brief's wording: for the usage-error cases the unchanged tree's first run exits 2, as the cases' expected status does, so those seven fail on the stderr text, not on the status.
