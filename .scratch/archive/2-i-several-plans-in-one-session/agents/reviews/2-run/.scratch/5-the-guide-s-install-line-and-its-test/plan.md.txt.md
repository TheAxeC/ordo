# Plan: 5. The guide's install line and its test

Execution ledger for entry 5 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`. A test `tests/guide.test.sh` checks the guide's form, and its command is in `docs/dev/building.md`.

## Gate

`sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (line 3 is the opening paragraph); `sh tests/guide.test.sh` prints `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1.

- The gate: could this pass without the goal being reached? no, the `sed` and `grep -c` read only line 3, the opening paragraph, for the install command; the test must print `PASS` on the guide and a `FAIL:` line on a file without a title and on a file with a tab, the two rules of the guide's form; and the `grep -c -F` finds the test's command with its filter on the verification page.
- Step 1: could this pass without the goal being reached? no, the pattern is matched on line 3 alone, so a sentence outside the opening paragraph does not count.
- Step 2: could this pass without the goal being reached? no, the three runs fix both rules the test computes and its pass on the guide, and the `grep -c -F` finds the exact command line on the verification page.

## Steps, in execution order

- ✅ 1 The install sentence: the opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (1 commit) (approved)
- ✅ 2 The guide's test: `tests/guide.test.sh` and its command `sh tests/guide.test.sh 2>&1 | tail -1` added to the command block of `docs/dev/building.md`; given a file path, `docs/guide.md` when none is given, the script prints `PASS: <file>` and exits 0 when the file's first line starts with `# ` and no line holds a tab, and otherwise prints `FAIL: <file>: <reason>` and exits 1; check: `sh tests/guide.test.sh` prints `PASS: docs/guide.md`, `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line, and `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1 (1 commit) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 5`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `.agents/plan.yaml`'s `workers_at_once` allows more.

- none; step 2 follows step 1.

## Rulings (2026-10-12)

- Open item A (2026-10-12): the step list below opens the plan, 3 steps, approved by the user in the rulings "Open item Step 2, what the scratch run needs approved" and "Open item Step 2, the scratch gates that could pass without their goals" of 2026-10-12, booked in Ordo's `.scratch/2-i-several-plans-in-one-session/plan.md`, Rulings (the user).
  - 1 The install sentence: the opening paragraph of `docs/guide.md` gains a sentence naming the install command `sh install.sh`; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` prints 1 (1 commit) (approved)
  - 2 The guide's test: `tests/guide.test.sh` and its command `sh tests/guide.test.sh 2>&1 | tail -1` added to the command block of `docs/dev/building.md`; given a file path, `docs/guide.md` when none is given, the script prints `PASS: <file>` and exits 0 when the file's first line starts with `# ` and no line holds a tab, and otherwise prints `FAIL: <file>: <reason>` and exits 1; check: `sh tests/guide.test.sh` prints `PASS: docs/guide.md`, `sh tests/guide.test.sh <a file whose first line is not a title>` and `sh tests/guide.test.sh <a file with a title line and a tab>` each print a `FAIL:` line, and `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` prints 1 (1 commit) (approved)
  - 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 5`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)
  - Could run in parallel: none; step 2 follows step 1.

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.
- a5398469161450042: builder of step 1, claude-sonnet-5-5
- a0406117ec1eed592: reviewer of step 1, claude-sonnet-5-5
- a9c4b36b1a7ccc304: builder of step 2, claude-sonnet-5-5
- ab9154be194d9c2f8: brief check of step 2, claude-sonnet-5-5
- a99b21923806479bc: reviewer of step 2, claude-sonnet-5-5
- a23e65e6307fe3c6a: reviewer of step 2 over round 1, claude-sonnet-5-5

## Blocked, and by what

- 3, the closing: blocked by Open item Step 3, the roadmap diff of `/roadmap done 5`, the user's ruling (kind 4).

### Step 1, the install sentence (landed 2026-10-12)

- Landed: `docs/guide.md` line 3 gains "Install it with `sh install.sh`." at the end of the opening paragraph (1 file changed, 1 insertion, 1 deletion; `git diff --cached --stat`).
- Premise corrections: none.
- Findings outside the brief: none. The refuter report has no finding under the four headings; its Closed heading records the two notes it gave.
- Verification on main, `sh <land skill>/templates/checks.sh .scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md` from the repository root:

  ```
  $ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
  checks: 1 commands passed
  ```

- Fix at landing, 1: the first run of the verify list in `land.sh` failed, `checks: 1 of 1 commands failed`, on 9 lines of `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md`, plan 3's step 2 report saved on disk in main by the orchestrator, whose quoted `cat -n` output held tab characters. The cause is that record, not this step's diff: the character-set check reads untracked files. The tabs were replaced by four spaces in that record, and the run above passed.
- The verify list equalled the page's command at Steps 2; no change.
- A/B: none (`bench: []`). Look: none (`look:` is empty).
- Usage: builder a5398469161450042 (claude-sonnet-5-5), 60952 tokens, 10 tool uses, 42 s; reviewer a0406117ec1eed592 (claude-sonnet-5-5), 68249 tokens, 7 tool uses, 57 s; brief check: none, a small text step.
- The builder's first report passed its bar: every item and case held at the review.

### Step 2, the guide's test (landed 2026-10-12)

- Landed: the new `tests/guide.test.sh`, 49 lines, a POSIX `sh` script that prints `PASS: <file>` and exits 0 when the file's first line starts with `# ` and no line holds a tab, and otherwise prints one `FAIL: <file>: <reason>` line and exits 1; and the line `sh tests/guide.test.sh 2>&1 | tail -1` as line 7 of the `sh` block of `docs/dev/building.md` (2 files changed, 50 insertions; `land.sh`'s diff stat).
- Premise corrections: none.
- Findings outside the brief: none.
- Verification on main, `sh <land skill>/templates/checks.sh .scratch/5-the-guide-s-install-line-and-its-test/orchestrator-state.md` from the repository root, after the fixes at landing:

  ```
  $ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
  checks: 1 commands passed
  ```

- The page's new command, run on main the way `checks.sh` runs a command, `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'`, printed `PASS: docs/guide.md` and exited 0. It is not in this plan's verify list: at Steps 2 the list equalled main's page, which gains the command with this landing. The list is rewritten from the page at this plan's next `/spec` or `/land`, and plan 3's at its next one.
- Fixes at landing, 3, findings of the run over repair round 1, each small and inside the brief:
  - `tests/guide.test.sh` line 10: the `Output` list's lead ended with a full stop; it now ends with a colon, as the prose standard's section D asks.
  - The saved report's V5: it called every list colon-introduced and the `Output` list a description plus four lines; with the fix above the first holds, and it now counts the list as its four items.
  - The saved report's "Repair round 1": a sentence on what the report no longer says is removed; the facts after it stand.
- Repair rounds: 1, on three findings of the first review (the head comment's four facts as a list; the report's account of the page line under `pipefail`; a line range). The run over the round closed all three.
- The verify list equalled the page's command at Steps 2; no change.
- A/B: none (`bench: []`). Look: none (`look:` is empty).
- Usage: builder a9c4b36b1a7ccc304 (claude-sonnet-5-5), 106234 tokens, 24 tool uses, 4 min 1 s, and over round 1 133212 tokens, 8 tool uses, 66 s; brief check ab9154be194d9c2f8 (claude-sonnet-5-5), 109673 tokens, 20 tool uses, 4 min 52 s; reviewer a99b21923806479bc (claude-sonnet-5-5), 103397 tokens, 16 tool uses, 2 min 15 s; reviewer over round 1 a23e65e6307fe3c6a (claude-sonnet-5-5), 93640 tokens, 13 tool uses, 1 min 54 s.
- The builder's first report did not pass its bar: the review sent three findings back in repair round 1, and three more were fixed at landing.
