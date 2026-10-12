# Plan: 3. The guide's usage line and its FAQ

Execution ledger for entry 3 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run. `docs/faq.md` holds two questions about the guide.

## Gate

`sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (the usage sentence is the sentence right after the install sentence, in the opening paragraph); `head -1 docs/faq.md` prints `# FAQ`; `grep -c '^## .*?$' docs/faq.md` prints 2; each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it.

- The gate: could this pass without the goal being reached? no, the `sed` and `grep -c` read only line 3, the opening paragraph, and match the usage sentence only as the sentence right after the install sentence; `# FAQ` and the count of `## ` headings ending in `?` fix the FAQ's form, and the reading of each question in place checks that it is about the guide and answered.
- Step 1: could this pass without the goal being reached? no, the pattern on line 3 matches only a sentence naming `sh run.sh <name>` that follows the sentence naming `sh install.sh` in the opening paragraph.
- Step 2: could this pass without the goal being reached? no, the title line and the two question headings are counted, and the reading in place checks that each question is about the guide and followed by its answer.

## Steps, in execution order

- ✅ 1 The usage sentence: the opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (1 commit) (approved)
- ✅ 2 The FAQ: `docs/faq.md` with the title line `# FAQ` and two questions about the guide, each a `## ` heading followed by its answer; check: `head -1 docs/faq.md` prints `# FAQ`, `grep -c '^## .*?$' docs/faq.md` prints 2, and each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it (1 commit) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 3`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `.agents/plan.yaml`'s `workers_at_once` allows more.

- 1 with 2.

## Rulings (2026-10-12)

- Open item A (2026-10-12): the step list below opens the plan, 3 steps, approved by the user in the rulings "Open item Step 2, what the scratch run needs approved" and "Open item Step 2, the scratch gates that could pass without their goals" of 2026-10-12, booked in Ordo's `.scratch/2-i-several-plans-in-one-session/plan.md`, Rulings (the user).
  - 1 The usage sentence: the opening paragraph of `docs/guide.md` gains, right after the install sentence, a sentence naming `sh run.sh <name>` as the command to run once `sh install.sh` has run; check: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` prints 1 (1 commit) (approved)
  - 2 The FAQ: `docs/faq.md` with the title line `# FAQ` and two questions about the guide, each a `## ` heading followed by its answer; check: `head -1 docs/faq.md` prints `# FAQ`, `grep -c '^## .*?$' docs/faq.md` prints 2, and each of the two questions, read in place, is about the guide and is followed by a paragraph that answers it (1 commit) (approved)
  - 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 3`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)
  - Could run in parallel: 1 with 2.

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.
- ab5877438987b60c0: builder of step 2, claude-sonnet-5-5
- a1f38991e8921cbad: reviewer of step 2, claude-sonnet-5-5
- a46806818cc0e299c: builder of step 1, claude-sonnet-5-5
- a0dfcb46f7a99aa64: reviewer of step 1, claude-sonnet-5-5

## Blocked, and by what

- 3, the closing: blocked by Open item Step 3, the roadmap diff of `/roadmap done 3`, the user's ruling (kind 4).

### Step 2, the FAQ (landed 2026-10-12)

- Landed: the new `docs/faq.md`, 9 lines: the title `# FAQ` and two questions about the guide, each answered by one paragraph (`git diff --cached --stat`: 1 file changed, 9 insertions).
- Premise corrections: none.
- Findings outside the brief: none.
- Verification on main, `sh <land skill>/templates/checks.sh .scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md` from the repository root, after the fixes at landing:

  ```
  $ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
  checks: 1 commands passed
  ```

- Fixes at landing, 2, findings of the review of a small text step, each small and inside the brief:
  - Refuter 3.2: the answer under "Where does the guide say what the project is?" opened with a fragment; it is now one full sentence.
  - Refuter 4.1: the answer under "What does the guide cover?" listed the opening paragraph's sentences and so left out each sentence added after the base; it now says what the guide covers without listing them.
- Refuter 3.1, tabs in this step's saved report, was closed before this landing, at the landing of plan 5's step 1.
- The verify list equalled the page's command at Steps 2; no change.
- A/B: none (`bench: []`). Look: none (`look:` is empty).
- Usage: builder ab5877438987b60c0 (claude-sonnet-5-5), 61095 tokens, 10 tool uses, 52 s; reviewer a1f38991e8921cbad (claude-sonnet-5-5), 74167 tokens, 11 tool uses, 81 s; brief check: none, a small text step.
- The builder's first report passed its bar: every item and case held at the review; 2 fixes at landing.

### Step 1, the usage sentence (landed 2026-10-12)

- Landed: line 3 of `docs/guide.md`, the opening paragraph, gains "Once the install has run, start it with `sh run.sh <name>`." right after the install sentence (1 file changed, 1 insertion, 1 deletion; `land.sh`'s diff stat). The step's check, `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'`, prints `1` on main.
- Premise corrections: none.
- Findings outside the brief: none.
- The verify list was rewritten at Steps 2 from `docs/dev/building.md`, which gained the command `sh tests/guide.test.sh 2>&1 | tail -1` with step 2 of plan 5 (9374825); the list now holds the character-set check and that command.
- Verification on main, `sh <land skill>/templates/checks.sh .scratch/3-the-guide-s-usage-line-and-its-faq/orchestrator-state.md` from the repository root, run by `land.sh`:

  ```
  $ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
  $ sh tests/guide.test.sh 2>&1 | tail -1
  PASS: docs/guide.md
  checks: 2 commands passed
  ```

- Fixes at landing: none. The review's two Spec findings were closed with no change, as the refuter report's Closed heading says.
- A/B: none (`bench: []`). Look: none (`look:` is empty).
- Usage: builder a46806818cc0e299c (claude-sonnet-5-5), 62499 tokens, 10 tool uses, 59 s; reviewer a0dfcb46f7a99aa64 (claude-sonnet-5-5), 74501 tokens, 12 tool uses, 81 s; brief check: none, a small text step.
- The builder's first report passed its bar: every item and case held at the review.
