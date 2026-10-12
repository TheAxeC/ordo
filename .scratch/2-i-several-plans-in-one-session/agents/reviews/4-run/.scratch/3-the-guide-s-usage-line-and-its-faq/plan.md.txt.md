# Plan: 3. The guide's usage line and its FAQ

Execution ledger for entry 3 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run. `docs/faq.md` holds two questions about the guide. `docs/faq.md` names the test command of entry 5.

## Gate

`sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (the usage sentence is the sentence right after the install sentence, in the opening paragraph); `head -1 docs/faq.md` prints `# FAQ`; `grep -c '^## .*?$' docs/faq.md` prints 2; each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it; `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1.

- The gate: could this pass without the goal being reached? no, the `sed` and `grep -c` read line 3 alone and require the usage sentence right after the install sentence; the FAQ's title, its two question headings and their answers are read in place; and the `grep -c -F` finds the exact test command in `docs/faq.md`.
- Step 1: could this pass without the goal being reached? no, the pattern is matched on line 3 alone and requires the `sh run.sh <name>` sentence to follow the install sentence.
- Step 2: could this pass without the goal being reached? no, the title line, the two question headings and the reading in place of each question and its answer cover the whole part.
- Step 3: could this pass without the goal being reached? no, the part is to name the test command in `docs/faq.md`, and the `grep -c -F` finds that exact command there, while the `## ` count shows no question was added.

## Steps, in execution order

- ✅ 1 The usage sentence: the opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (1 commit) (approved)
- ✅ 2 The FAQ: `docs/faq.md` with the title line `# FAQ` and two questions about the guide, each a `## ` heading followed by its answer; check: `head -1 docs/faq.md` prints `# FAQ`, `grep -c '^## .*?$' docs/faq.md` prints 2, and each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it (1 commit) (approved)
- ✅ 3 The FAQ's test command: names in `docs/faq.md` the test command plan 5's step 2 adds; check: `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1, and `grep -c '^## .*?$' docs/faq.md` still prints 2 (1 commit) (approved)
- 4 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 3`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `.agents/plan.yaml`'s `workers_at_once` allows more.

- 1 with 2.

## Rulings (2026-10-12)

- Open item A (2026-10-12): the step list below opens the plan, 4 steps, approved by the user in the rulings "Open item Step 2, what the scratch run needs approved" and "Open item Step 2, the scratch gates that could pass without their goals" and "Open item Step 2, condition 7 shown only through a hold" of 2026-10-12, booked in Ordo's `.scratch/2-i-several-plans-in-one-session/plan.md`, Rulings; step 3's check and entry 3's FAQ sentence and its gate part are the orchestrator's words under the last of these rulings (the user).
  - 1 The usage sentence: the opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (1 commit) (approved)
  - 2 The FAQ: `docs/faq.md` with the title line `# FAQ` and two questions about the guide, each a `## ` heading followed by its answer; check: `head -1 docs/faq.md` prints `# FAQ`, `grep -c '^## .*?$' docs/faq.md` prints 2, and each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it (1 commit) (approved)
  - 3 The FAQ's test command: names in `docs/faq.md` the test command plan 5's step 2 adds; check: `grep -c -F 'sh tests/guide.test.sh' docs/faq.md` prints 1, and `grep -c '^## .*?$' docs/faq.md` still prints 2 (1 commit) (approved)
  - 4 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 3`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)
  - Could run in parallel: 1 with 2.

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- aa0e9d44326c1ae87: builder of step 2, claude-sonnet-5-5
- a9ee783bdb416bde3: reviewer of step 2, claude-sonnet-5-5
- a115b0da88ae3351b: builder of step 1, claude-sonnet-5-5
- a8a41fe99a8b7fb42: reviewer of step 1, claude-sonnet-5-5
- a762551a7c79dd83a: builder of step 3, claude-sonnet-5-5
- ab949a5723e4a311d: reviewer of step 3, claude-sonnet-5-5

## Blocked, and by what

- none.

## Booking of step 2, the FAQ

- Landed on main: `docs/faq.md`, a new file of 9 lines with the title `# FAQ` and the questions "What does the guide cover?" and "What does the guide say this project is?", each with its answer, from the range 23e472f..3-the-guide-s-usage-line-and-its-faq-2.
- Premise corrections: none. The verify list equals `docs/dev/building.md` and was not rewritten.
- Findings: S1, the sentence "The guide lists no commands." in the first answer, which the guide's install sentence of entry 5 and this plan's usage sentence make false; fixed at landing by removing it. The reviewer's Proof note needs no change. Both under `agents/reviews/2-refuter.md`, "Closed". No open item.
- Verification on main after the fix, `templates/checks.sh`:
  - `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`
  - `checks: 1 commands passed`
  - The step's check after the fix: `head -1 docs/faq.md` printed `# FAQ`; `grep -c '^## .*?$' docs/faq.md` printed `2`.
- A/B: none, `bench` is empty. Look: none, `look` is empty.
- Agents: builder aa0e9d44326c1ae87 (claude-sonnet-5-5), 58137 tokens, 9 tool uses, 43 s; reviewer a9ee783bdb416bde3 (claude-sonnet-5-5), 69786 tokens, 9 tool uses, 62 s; no brief check, a small text step.
- The builder's first report did not pass its bar: finding S1. Fixes at landing: 1, S1, a sentence the plan's other steps make false, removed from `docs/faq.md` line 5.

## Booking of step 1, the usage sentence

- Landed on main: `docs/guide.md` line 3 gains, right after the install sentence, "Once the install has run, the command `sh run.sh <name>` runs the project." (1 insertion, 1 deletion), from the range b7d8bd2..3-the-guide-s-usage-line-and-its-faq-1. The step's check, `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'`, prints 1 on main.
- Premise corrections: none. The verify list equals `docs/dev/building.md` and was not rewritten.
- Findings: none under the four headings; the reviewer's point on the two sentences of one shape needs no change, as `agents/reviews/1-refuter.md`, "Closed", says. No open item.
- Red line and fix at landing: the first run of `templates/checks.sh` on main failed on `agents/reviews/1-refuter.md` line 10, where the reviewer's quoted `grep -n -E` pattern held an em dash and an en dash; the record writes them as `<em dash>` and `<en dash>`, and the rerun passed:
  - `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`
  - `checks: 1 commands passed`
- A/B: none, `bench` is empty. Look: none, `look` is empty.
- Agents: builder a115b0da88ae3351b (claude-sonnet-5-5), 59625 tokens, 13 tool uses, 61 s; reviewer a8a41fe99a8b7fb42 (claude-sonnet-5-5), 68370 tokens, 9 tool uses, 50 s; no brief check, a small text step.
- The builder's first report passed its bar. Fixes at landing: 1, the character set of the refuter report.

## Booking of step 3, the FAQ's test command

- Landed on main: `docs/faq.md` line 5, the answer to "What does the guide cover?", gains the sentence "Run from the repository root, the command `sh tests/guide.test.sh` checks that the first line of the guide is a title and that no line of it holds a tab." (1 insertion, 1 deletion), from the range c1b3023..3-the-guide-s-usage-line-and-its-faq-3.
- The verify list: rewritten at this step's `/spec` preflight from the character-set check alone to the two commands of `docs/dev/building.md`, the second being `sh tests/guide.test.sh 2>&1 | tail -1`, which plan 5's step 2 added; `/land` found it equal to the page.
- Premise corrections: none.
- Findings (`agents/reviews/3-refuter.md`): P1, the report's "No departure" beside a 24-word sentence, and S1, the test sentence in the answer on what the guide covers, closed with no change; B1, the sentence did not say where the command runs, fixed at landing. All under its "Closed" heading. No open item.
- Verification on main, `templates/checks.sh`, after the fix at landing:
  - `$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'`
  - `$ sh tests/guide.test.sh 2>&1 | tail -1`
  - `PASS: docs/guide.md`
  - `checks: 2 commands passed`
- A/B: none, `bench` is empty. Look: none, `look` is empty.
- Agents: builder a762551a7c79dd83a (claude-sonnet-5-5), 61279 tokens, 10 tool uses, 45 s; reviewer ab949a5723e4a311d (claude-sonnet-5-5), 75510 tokens, 10 tool uses, 2 min 56 s; no brief check, a small text step.
- The builder's first report passed its bar. Fixes at landing: 1, B1 in `docs/faq.md` line 5.
