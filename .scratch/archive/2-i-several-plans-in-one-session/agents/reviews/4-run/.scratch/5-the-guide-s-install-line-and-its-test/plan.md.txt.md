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

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- afc9aa3f92bc74bf1: builder of step 1, claude-sonnet-5-5
- a5daed14247e301df: reviewer of step 1, claude-sonnet-5-5
- a3a6121993983092e: brief check of step 2, claude-sonnet-5-5
- a7ac8220a5207dd70: builder of step 2, claude-sonnet-5-5
- affe0b4b29ffefabd: reviewer of step 2, claude-sonnet-5-5
- a3df69c2e3d5202dc: reviewer of step 2 over round 1, claude-sonnet-5-5

## Blocked, and by what

- none.

## Booking of step 1, the install sentence

- Landed on main: `docs/guide.md` line 3 gains the sentence "The command `sh install.sh` installs the project." (1 insertion, 1 deletion), from the range 4bfa048..5-the-guide-s-install-line-and-its-test-1.
- Premise corrections: none. The verify list equals `docs/dev/building.md` and was not rewritten.
- Findings: P1, a word count of 8 in the builder's report where the sentence has 7, no decision resting on it; B1, the guide names `sh install.sh` while no `install.sh` exists, which the step's line and entry 5's goal do not ask to build. Both closed with no change under `agents/reviews/1-refuter.md`, "Closed". No open item.
- Verification on main, `templates/checks.sh`:
  - `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`
  - `checks: 1 commands passed`
- A/B: none, `bench` is empty. Look: none, `look` is empty.
- Agents: builder afc9aa3f92bc74bf1 (claude-sonnet-5-5), 57420 tokens, 10 tool uses, 36 s; reviewer a5daed14247e301df (claude-sonnet-5-5), 69714 tokens, 8 tool uses, 52 s; no brief check, a small text step.
- The builder's first report passed its bar. Fixes at landing: none.

## Booking of step 2, the guide's test

- Landed on main: `tests/guide.test.sh`, a new script of 41 lines that checks a guide's form (first line a title, no line holding a tab) and prints one `PASS:` or `FAIL:` line, and `docs/dev/building.md` line 7, `sh tests/guide.test.sh 2>&1 | tail -1`, in the command block, from the range 52682d0..5-the-guide-s-install-line-and-its-test-2 (2 files, 42 insertions).
- The verify list: `docs/dev/building.md` as the cherry-pick brings it holds two commands, and the plan's verify list held the character-set check alone; the list in `orchestrator-state.md` was rewritten to both commands, `sh tests/guide.test.sh 2>&1 | tail -1` added, before `land.sh` ran it.
- Premise corrections: none.
- Findings of the first review (`agents/reviews/2-refuter.md`): S1, the head comment hard-wrapped and passive against `docs/dev/prose-standard.md` sections F and E, sent in repair round 1 and fixed there; B1 (a NUL byte in a guide) and B2 (the locale of the tab search) closed with no change, as its "Closed" heading says.
- Findings of the run over round 1: S2, two sentences of the head comment over the length of section E and two reason sentences on one shape. Fixed at landing on main, inside the brief: line 3 split into one sentence per rule, line 13 recast. No open item.
- Verification on main, `templates/checks.sh`, after the fix at landing:
  - `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`
  - `$ sh tests/guide.test.sh 2>&1 | tail -1`
  - `PASS: docs/guide.md`
  - `checks: 2 commands passed`
- A/B: none, `bench` is empty. Look: none, `look` is empty.
- Agents: brief check a3a6121993983092e (claude-sonnet-5-5), 105687 tokens, 16 tool uses, 4 min 6 s; builder a7ac8220a5207dd70 (claude-sonnet-5-5), 75911 tokens, 14 tool uses, 108 s, and in round 1 92734 tokens, 9 tool uses, 70 s; reviewer affe0b4b29ffefabd (claude-sonnet-5-5), 116555 tokens, 16 tool uses, 3 min 31 s; reviewer over round 1 a3df69c2e3d5202dc (claude-sonnet-5-5), 102153 tokens, 16 tool uses, 1 min 48 s.
- The builder's first report did not pass its bar: it said the head comment departed from nothing in the prose standard, which S1 refuted. Fixes at landing: 1, S2 in the head comment of `tests/guide.test.sh`.
