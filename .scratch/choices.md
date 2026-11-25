# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C149

# Entry 2.I Several plans in one session

## C40. How a step in /spec is recorded (2026-10-12)

A user-visible choice: a value of the dispatch entry, a term of the glossary. Step 3's line has a step count toward the limit on steps in flight, and have its paths compared, from the start of its `/spec`. Ruling D17 and ADR 0011 make the dispatch blocks of every open plan the one record the skills count and compare over, and `/spec` writes a step's dispatch entry only at its Steps 9, after the worktree. The glossary's dispatch entry gives `landing` the values `not-started`, `cherry-picking` and `backed-out`.
  - Option (a), recommended: `/spec` writes the step's dispatch entry at the end of its preflight, holding the step and `landing: preparing`; the entry counts toward the limit, its brief is compared once written, Steps 9 fills the entry and sets `landing: not-started`, a stop or a wait removes it, and on resumption an entry at `landing: preparing` is an interrupted `/spec`. Pro: the dispatch blocks stay the one record, as D17 and ADR 0011 say, and a session or a new orchestrator sees the step. Con: a fourth value of `landing`, in the glossary and the state-file template.
  - Option (b): a separate list of the steps in `/spec`, beside the dispatch block in the state file. Pro: the dispatch entry keeps its shape. Con: a second record to count and compare over, against D17 and ADR 0011.
  - Option (c): a step counts from the moment its brief is on disk. Pro: no new value. Con: the window from the preflight to the brief stays unseen, which is run finding 9's defect left in part.
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/archive/2-i-several-plans-in-one-session/plan.md:92` (Open item Step 3, how a step in /spec is recorded)
Builds on it: step 3

# Entry 2.K The skill-text fixes from the retro and the real run

## C41. No breakage testing (2026-10-13)

The goal part "no breakage testing, in docs/dev/change-standard.md, the repo-setup change-standard template and the shared-rules template". What exists now: none of the three files names breakage testing (`grep -n -i breakage` prints nothing in each). The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`, "Approved proposals".
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:30` (D1 no breakage testing)
Builds on it: step 1

## C42. The character-set check reads only files on disk (2026-10-13)

The goal part "the character-set check of docs/dev/building.md and docs/dev/change-standard.md reads only files that exist on disk". What exists now: both pages feed `git ls-files -coz --exclude-standard` straight to `perl`, which fails on a file deleted from the working tree. The part's text is the computation the user approved, `.scratch/retros/sessions-2026-10-12.md`, "Approved proposals".
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:31` (D2 the character-set check reads only files on disk)
Builds on it: step 1

## C43. Land never settles a clash of two rulings (2026-10-13)

The goal part "land never settles a clash between two of the user's rulings at landing". What exists now: `land` Steps 6 fixes a small finding inside the brief at landing and says nothing of a clash. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:32` (D3 land never settles a clash of two rulings)
Builds on it: step 1

## C44. Land carries out a ruling only on what it names (2026-10-13)

The goal part "land carries out a ruling only on what it names". What exists now: `land` Steps 6 has no such bullet. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:33` (D4 land carries out a ruling only on what it names)
Builds on it: step 1

## C45. A ruling given outside a plan is written down (2026-10-13)

The goal part "the shared rules write a ruling given outside a plan into the repository in the same turn". What exists now: `skills/repo-setup/templates/shared-rules.md` has no such rule. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: Nygard's ADR post keeps every decision written: "If a decision is reversed, we will keep the old one around, but mark it as superseded" (https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:34` (D5 a ruling given outside a plan is written down)
Builds on it: step 1

## C46. A proposal says what exists now (2026-10-13)

The goal part "the shared rules have a proposal say what exists now, what changes, what it replaces and why". What exists now: `skills/repo-setup/templates/shared-rules.md` has no such rule. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:35` (D6 a proposal says what exists now)
Builds on it: step 1

## C47. The builder's prompt says a shortcut is a finding (2026-10-13)

The goal part "the builder's prompt says a shortcut is a finding". What exists now: `plan-orchestration` Steps 4, "The prompt", lists seven things and not this one. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:36` (D7 the builder's prompt says a shortcut is a finding)
Builds on it: step 1

## C48. Roadmap compares the written file with the draft (2026-10-13)

The goal part "roadmap compares the written file with the approved draft before the commit". What exists now: `roadmap` Steps 4 writes the change and Steps 5 commits it, with no compare between. The part's text is the user's approved sentence, `.scratch/retros/sessions-2026-10-12.md`.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:37` (D8 roadmap compares the written file with the draft)
Builds on it: step 1

## C49. A dictated sentence about a script is run first (2026-10-13)

The goal part "a sentence a brief or a round dictates about how a script behaves is run on the script before it is written". What exists now: `plan-orchestration` Steps 8, "Dictated text", holds dictated text against the rules and not against the script. The part's text is the user's two approved sentences, `.scratch/retros/sessions-2026-10-12.md`, merged into one when entry 2.K was written.
  - Option (a), recommended: keep the part as the entry writes it, in `plan-orchestration` Steps 4, "The prompt", for the builder, and Steps 8, "Dictated text", for the orchestrator, the run quoted in the round's brief. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: Python's doctest "searches for pieces of text that look like interactive Python sessions, and then executes those sessions to verify that they work exactly as shown" (https://docs.python.org/3/library/doctest.html).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:38` (D9 a dictated sentence about a script is run first)
Builds on it: step 1

## C50. The reviewer's git commands (2026-10-13)

The goal part "refute's reviewer runs no git command other than git diff <base>, git status --short and git show <base>:<path>". What exists now: `refute` "What it reads" 5 allows `git diff <base>` and `git status --short`, and run finding 8 of the first run shows a reviewer needing `git show <base>:<path>` to read the unchanged tree. The part's text is the user's approved sentence with `git show <base>:<path>` added when entry 2.K was written.
  - Option (a), recommended: keep the part as the entry writes it, in `refute` Rules, with "What it reads" 5 naming the same three commands. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations).
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:39` (D10 the reviewer's git commands)
Builds on it: step 1

## C51. How a verify command that starts with git reaches a builder (2026-10-13)

The goal part "a verify command that starts with git reaches a builder in a form that runs no git". What exists now: `spec` Steps 4 puts the character-set check of the verify list among a brief's checks, and the verify list feeds it from `git ls-files`; the first scratch run's briefs carried that form, a builder replaced it with `printf` on its own, and later briefs gave `printf '%s\0' <files> |` (run finding 1 of the first run).
  - Option (a), recommended: `spec` Steps 4 writes such a check in the brief with its file list given as `printf '%s\0' <the files the step changes> |` in place of the git command, the rest of the command as the verify list has it. Pro: the builder runs the check with no git, and the reviewer reruns the same line. Con: the brief's line differs from the verify list's, which the brief says.
  - Option (b): the builder may run `git ls-files`. Pro: the brief copies the list's line. Con: a fourth reading command beside the rules file's three, and the builder's rule grows.
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations).
  - Recommendation: (a): it keeps the builder inside the rules file's reading commands and is the form the second run's briefs used. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:40` (D11 how a verify command that starts with git reaches a builder)
Builds on it: step 1

## C52. A builder's saved report passes the character-set check (2026-10-13)

The goal part "a builder's report saved into the ledger passes the character-set check". What exists now: `plan-orchestration` Steps 6 saves the report as the builder wrote it, and a report that quotes output with a tab fails the check on main (run finding 3 of the first run).
  - Option (a), recommended: the builder's prompt and the brief's report shape say the report is written in the rules file's character set, a character outside it in quoted output written by name, such as `<tab>` or `<em dash>`; the session runs the character-set check on the report it saves and fixes a hit in place by the same naming, without changing what the report says. Pro: the check holds whoever slips. Con: two sentences in two places.
  - Option (b): the session fixes the saved report alone. Pro: one sentence. Con: every report is fixed after the fact, and the builder's own quotes still carry the character.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a): the report is right when written and the save is checked. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:41` (D12 a builder's saved report passes the character-set check)
Builds on it: step 1

## C53. A repair round's brief reaches the builder in its worktree (2026-10-13)

The goal part "a repair round's brief reaches the builder in its worktree". What exists now: `plan-orchestration` Steps 8 commits the round's brief on main after the worktree was made, so the worktree holds no copy, and a builder read it from the main checkout (run finding 7 of the first run).
  - Option (a), recommended: before the resume the orchestrator copies the committed round's brief, and a cases ruling, into the worktree's copy of the ledger at the same path, and the message names that path. Pro: the worktree stays the builder's only place. Con: a copy step per round.
  - Option (b): the resume message carries the round's brief whole. Pro: no copy. Con: a long brief in a message, and the brief and the message can drift.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the worktree is the builder's only place to work. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:43` (D14 a repair round's brief reaches the builder in its worktree)
Builds on it: step 1

## C54. A reviewer's saved report passes the character-set check (2026-10-13)

The goal part "a reviewer's report saved into the ledger passes the character-set check". What exists now: `refute` Steps 7 saves the report as the reviewer wrote it, and a report that quoted an em dash failed the check on main (run finding 2 of the second run).
  - Option (a), recommended: `refute` Steps 6 has the reviewer write in the rules file's character set, a character outside it in a quote written by name, as D12 says for the builder; Steps 7 has the session check the saved report and fix a hit in place the same way. Pro: one rule for both reports. Con: two sentences.
  - Option (b): the session fixes the saved report alone. Pro: one sentence. Con: as D12 (b).
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), the same rule as D12. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:44` (D15 a reviewer's saved report passes the character-set check)
Builds on it: step 1

## C55. Who writes a reviewer's usage line (2026-10-13)

The goal part "the session writes a reviewer's usage line from the reviewer's completion notice, and the reviewer does not". What exists now: `refute` Steps 6 has the reviewer write its own usage line, and five of six reviewers of the second run wrote figures that differ from their notices (run finding 3 of the second run); `spec` "Steps / The brief check" 3 has the session fill the same line.
  - Option (a), recommended: `refute` Steps 6 drops the usage line from what the reviewer writes, and Steps 7 has the session fill the template's usage line from the completion notice, as `spec` does for the brief check. Pro: the figures are the runner's. Con: none.
  - Option (b): drop the part. Con: the wrong figures stay.
  - Industry: the Agent SDK's Agent tool result carries `totalToolUseCount`, `totalDurationMs` and `totalTokens`, and "Claude Code fills `usage` and `totalTokens` from the subagent's final API request" (https://code.claude.com/docs/en/agent-sdk/typescript), so the runner, not the model, holds the figures.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:45` (D16 who writes a reviewer's usage line)
Builds on it: step 1

## C56. How a closing step runs beside the other steps (2026-10-13)

The goal part "plan-orchestration says whether a closing step goes through /spec and takes a slot". What exists now: neither `plan-orchestration` nor `spec` says; both scratch runs ran their closings without `/spec` or a dispatch entry (run finding 5 of the second run).
  - Option (a), recommended: a closing step runs without `/spec` and without a dispatch entry, takes no slot of `workers_at_once`, starts only when every other step of its plan has landed, and makes its commits outside any landing. Pro: it states what both runs did, and a closing has no brief or worktree for `/spec` to make. Con: a closing does not show in the count of steps in flight.
  - Option (b): the closing goes through `/spec` and takes a slot. Pro: one path for every step. Con: `/spec` would write a brief and a worktree a closing does not use.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is none: both options are a sentence.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:46` (D17 how a closing step runs beside the other steps)
Builds on it: step 1

## C57. The builder's git rule (2026-10-13)

The goal part "the builder's git rule reads the same in plan-orchestration and in skills/repo-setup/templates/docs/dev/change-standard.md". What exists now: `plan-orchestration` Steps 4 says "The builder. It never runs a git command."; the template's "Where the work happens", and Ordo's own `docs/dev/change-standard.md`, allow reading with `git status`, `git diff` and `git show` (run finding 7 of the second run).
  - Option (a), recommended: `plan-orchestration` Steps 4 states the rules file's rule: the builder runs no git command that changes state, and reads only with `git status`, `git diff` and `git show`. Pro: the skill follows the rules file the user owns, and the three reading commands let a builder see its own diff. Con: none.
  - Option (b): both change standards say no git at all. Pro: the narrowest rule. Con: a change to the user's rules file and standards page, which only the user rules (kind 3).
  - Industry: GitHub's Copilot cloud agent "cannot directly run `git push` or other Git commands" (https://docs.github.com/en/copilot/concepts/agents/cloud-agent/risks-and-mitigations); the page says nothing of reading commands.
  - Recommendation: (a): the rules file ranks it, since a brief and a skill never override the rules file. The lazy option is none.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:47` (D18 the builder's git rule)
Builds on it: step 1

## C59. Each changed skill's version raised (2026-10-13)

The goal part "each changed skill's version is raised as docs/dev/skill-layout.md says". What exists now: `docs/dev/skill-layout.md` "Frontmatter" sets one raise per plan. The part's text is the entry's own.
  - Option (a), recommended: keep the part as the entry writes it. Pro: the sentence the user approved goes in the files it names. Con: none beyond the edit.
  - Option (b): drop the part. Pro: a smaller entry. Con: the defect the user approved a fix for stays in the text.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a), since the user approved the fix and the defect is on the tree. The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:49` (D20 each changed skill's version raised)
Builds on it: step 1

## C60. The gate's grep and fresh reviewer (2026-10-13)

The gate part "each fix's sentence is found in its file by grep -n -F of its text and read in place by a fresh reviewer agent against the proposal or finding it answers". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:50` (D21 the gate's grep and fresh reviewer)
Builds on it: step 1

## C61. The gate's deleted-file worktree run (2026-10-13)

The gate part "the character-set check of docs/dev/building.md, run in a worktree in which a tracked file was deleted, exits 0". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:52` (D23 the gate's deleted-file worktree run)
Builds on it: step 1

## C62. The gate's version check (2026-10-13)

The gate part "each changed skill's version read against docs/dev/skill-layout.md". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:53` (D24 the gate's version check)
Builds on it: step 1

## C63. The gate's checks.sh run (2026-10-13)

The gate part "sh skills/land/templates/checks.sh passes". What exists now: the entry's gate holds it.
  - Option (a), recommended: keep the part. Pro: it checks a part of the goal the other parts do not. Con: none.
  - Option (b): drop the part. Con: that part of the goal goes unchecked.
  - Industry: no source read in this session bears on this rule; the option rests on the source the decision names.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:54` (D25 the gate's checks.sh run)
Builds on it: step 1

## C64. The gate's land.test.sh case (2026-10-13)

The gate part "`sh skills/land/templates/land.test.sh 2>&1 | tail -1` prints a PASS: line, with a case in which a step adds a command to the verification page and that command's `$ <command>` line is in its landing's checks output". What exists now: the entry's gate holds it, and D13 (a) settles that the session brings the new command into the verify list before `land.sh` runs.
  - Option (a), recommended: keep the part, the case a step that adds a test script and its command to the page, whose landing output holds the command's `$ <command>` line. Pro: it checks the D13 part of the goal at the script the landing runs. Con: the case also passes on the unchanged script, since D13 (a) changes no script.
  - Option (b): drop the part. Con: the D13 part of the goal goes unchecked by any run.
  - Rule: the entry's gate, `docs/roadmap.md:25`.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:51` (D22 the gate's land.test.sh case)
Builds on it: step 1

## C65. The roadmap diff of entry 2.K (2026-10-13)

No answer of the interview changes the entry's goal, its gate or what it waits on; each settles how a part of the goal is done.
  - Option (a), recommended: no change to the entry. Pro: the entry stays the text the user approved. Con: none.
  - Option (b): write the decisions' detail into the goal. Con: the `roadmap` skill's Rules keep the entry to the goal, the gate and the dependencies, and the detail lives in the rulings.
  - Rule: the `roadmap` skill's Rules.
  - Recommendation: (a). The lazy option: none, since (a) leaves no work undone.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:55` (D26 the roadmap diff of entry 2.K)
Builds on it: the roadmap diff of entry 2.K, step 1

## C66. Record as ADR? (2026-10-13)

D13 refines ADR 0010's Consequences sentence; the other decisions are skill text.
  - Option (a), recommended: no new record; ADR 0010 is edited in place by the step that does D13. Pro: the ADR folder's README says a refinement that keeps the decision edits the ADR with no dated note. Con: none.
  - Option (b): a new record superseding ADR 0010. Con: the decision does not change, so a superseding record misstates it.
  - Rule: `docs/adr/README.md:5`.
  - Recommendation: (a). The lazy option: none, since the ADR edit is done in either case.

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:56` (D27 record as ADR?)
Builds on it: step 1

## C67. The step list of plan 2.K as drafted (2026-10-13)

`/plan 2.K --self-rule` drafted two steps: step 1, every skill-text fix of the goal with the gate's checks as its check, and step 2, the closing. No fix needs another fix's landed result, and the content of each is known in advance from the rulings D1 to D27, so `/plan` Steps 2 makes them one step. Every answer of "## Gate" is no, no design decision is left unsettled after `/grill 2.K --self-rule`, and no line of the rulings file was left to place.
  - Option (a), recommended: open the plan with the list as drafted. Pro: the plan opens and step 1 can be prepared at once; one builder holds every fix, so the shared files (`plan-orchestration`, `land`, the change standards) are changed once and each skill's version is raised once. Con: one large step for one builder and one review.
  - Option (b): keep the draft for the user. Pro: the user sees the list before the plan opens. Con: the plan does not open, and nothing in the written rules needs the user's call here.
  - Rule: the `plan` skill's Steps 2 and 3.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/plan.md:57` (Open item A)
Builds on it: step 1, step 2

## C68. Which register rules the agents of /writing get (2026-10-15)

The brief of step 4 of plan 3 gave the finding agents the register rules "of the draft's register", and also said the session that runs `/writing` judges nothing of the draft. The builder gave the agents the rules of all four registers, since picking the register is a judgment about the draft. The reviewer (Spec 2 of `.scratch/3-the-writing-base/agents/reviews/4-refuter.md`) found that the checking agent had no bullet that limits register findings to the draft's register.
  - Option (a), recommended: keep the four registers in the finding agents' lists, which each apply the register of the draft's discipline, and give the checking agent the bullet that keeps a register finding only under that register. Pro: the agents, which read the draft, decide its discipline, and the session judges nothing; the four registers cost about 700 tokens more per agent. Con: three registers in each prompt do not apply to the draft.
  - Option (b): the session picks the draft's register and puts only that one in the prompts. Pro: shorter prompts. Con: the session then judges the draft, against the skill's rule that it judges nothing, and a wrong pick removes the right register's rules.
  - Rule: `skills/writing/SKILL.md`, "Rules" and "Finding agent prompt"; ADR 0013, "only its own rules": the register rules are in the sentence and section agents' own lists.
  - Recommendation: (a). The lazy option is (b), which needs no checking-agent bullet.

Taken: (a)
Booked: `.scratch/3-the-writing-base/plan.md:74` (Step 4, the register rules)
Builds on it: step 4

# Entry 4 code-comments

## C71. Step 1b reaches session-retro (2026-10-17)

The user ruled the `$0` defect of `code-comments` fixed (open item E). `grep -n '\$[0-9]' skills/*/SKILL.md` finds the same construct in `skills/session-retro/SKILL.md` lines 47, 80 and 118, three `awk` commands that test `$0`, in a skill called as `/session-retro <entry>`, so the runner serves them with the entry in place of `$0`.
  - Option (a), recommended: step 1b fixes both skills. Pro: the defect's cause ends in every skill that has it. Con: step 1b writes a skill outside entry 4's goal.
  - Option (b): a roadmap entry for `session-retro` alone. Pro: entry 4 stays inside its goal. Con: `session-retro` stays broken until that entry runs, for the same cause step 1b ends.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/4-code-comments/plan.md:74` (Step 1b reaches `session-retro`)
Builds on it: step 1b

# Entry 5 paper

## C102. The drafted step list of plan 5 (2026-10-19)

The stop "The drafted step list" of `/plan 5 --self-rule`: four steps, the scripts with their tests, the skill with a record for each of the 43 `rebuild: paper` rows, the gate's runs (the release-candidate pin, the three blind comparisons, the resolve check, the four single-mode runs and the `/writing` findings applied), and the closing. Every answer of "## Gate" is no, no design decision is left unsettled (D1 to D41, ADR 0017 to 0021), and the four lines under D37 (its sub-bullet and the fenced gate line) are copied below D37 as they stand.
  - Option (a), recommended: open the plan with the list as drafted. Pro: each step is a part of the goal with its check, in dependency order, and the loop starts at step 1. Con: step 2 is one large step, the whole skill text and 43 records, which the rule that parts known in advance are one step requires.
  - Option (b): keep the draft for the user. Pro: the user reads the list first. Con: the plan stays unopened while nothing in the list is left for the user to rank.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:78` (Open item A)
Builds on it: step 1, step 2, step 3, step 4

## C103. The command forms of lookup.py's key check, check-urls and quote-check (2026-10-19)

step 1, raised by `/spec 5 1` before the brief: rulings D15 and D17 fix what `lookup.py` computes, and no ruling fixes the command form of the new `\cite` key check or of `check-urls` and `quote-check` once they read a manuscript. These are the commands the skill's text and its user run. On the tree, `lookup.py` at 0074728 reads `references.bib` in a report's folder (`git show 0074728:skills/literature/templates/lookup.py`, its head comment, check-urls and quote-check), and the hub's manuscripts name their `.bib` by `\bibliography{refs}` (23 files), `{main}` (16), `{references}` (3) and `{References}` (2), cite with `\cite` (2348), `\citep` (114) and `\citet` (28), and `\input` files with and without `.tex` (`grep -rhoE` over `research-hub/projects/**/*.tex`).
  - (a) The `.bib` named on the command line: `lookup.py cite-keys <main.tex> <file.bib>` prints `missing: <key>` for each cited key the `.bib` lacks and `unused: <key>` for each entry no `\cite` uses, and exits 1 when it prints either; `lookup.py check-urls <main.tex> <file.bib>` prints, for each cited key, the status of its doi, else its eprint, else its url, as now, and for a key with a doi the title ratio of the entry's title to the title the doi resolves to, the first record found in the order Crossref, OpenAlex, Semantic Scholar, with `DOI_MISMATCH` below 0.70; `lookup.py quote-check <integrity record> <file.bib> <folder>` checks the record's passage lines as now. One function reads the cited keys for all three: every command whose name begins with `cite`, its optional `[...]` arguments skipped, in the main file and in every file it `\input`s or `\include`s, a name without an extension read as `.tex`, relative to the main file's folder, with the text after an unescaped `%` left out. Pro: a `.bib` anywhere works, and the three commands share one key reader. Con: one argument more on each call.
  - (b) The `.bib` read from the `.tex`'s `\bibliography{...}` line, with the same commands taking only `<main.tex>`. Pro: one argument fewer. Con: a second thing to parse, a line naming several files, and a manuscript without the line fails.
  - Recommendation: (a), since the file the check reads is then the one named, and `lookup.py` parses only the cited keys. No option is the lazy one; (b) costs more to build.
  - The lazy option: none; (b) costs more to build.

Taken: (a)
Booked: `.scratch/5-paper/plan.md:79` (Open item B)
Builds on it: step 1

## C104. What each mode of paper leaves in the manuscript's files (2026-10-19)

step 2, raised by `/spec 5 2` before the brief: the rulings fix the arguments of each mode (D26), that full mode writes `.tex` and revision edits through anchorize, patch and apply (D25), and where a run keeps its records (D27, ADR 0020), but no ruling fixes what each mode leaves in the manuscript's files, how a mode given only the main `.tex` finds its `.bib`, or how a patch reaches the manuscript. These are what the user gets from each run. On the tree: `apply_tex_patch.py` exits 2 with kind `output` when `--output` is the base and never writes the base (its head comment; case P6 of step 1); `anchorize_tex.py` writes `<tex>.block-manifest.json` beside the file it reads and has no option for another place; on a scratch copy of dongho-ecg-clustering's `manuscript/refs.bib`, `anchorize_tex.py refs.bib --print-blocks` prints `21 blocks`, one per entry (`grep -c '^@'` prints 21); the hub's manuscripts stand in `<project>/manuscript/main.tex` beside `refs.bib` or `main.bib` and name it by one `\bibliography{...}` line (C103's count; `ls` of the three gate projects' `manuscript/` folders).
  - (a) Every change to a manuscript file, the `.tex`, a file it inputs and its `.bib`, is a patch: the file is anchorized, its manifest moved into the run folder, the patch checked with `--check-only`, applied with `--manifest` and `--output <run folder>/<file name>.patched`, and the patched file copied over the file, one patch per file, the run folder keeping each manifest, patch and apply report. Full mode writes `<project>/manuscript/main.tex` and `<project>/manuscript/refs.bib`, refused when `main.tex` exists, the first draft whole and every later change as a patch. A mode given a main `.tex` finds its `.bib` by the one `\bibliography{...}` or `\addbibresource{...}` of the main file or a file it inputs, resolved against the main file's folder with `.bib` added to a name without it; none, or more than one file, is a refusal that names the lines. outline-only writes `outline.md`, the approved outline with its evidence map, into the run folder and changes no manuscript file; abstract-only writes the abstract and keywords into the `.tex` as a patch; citation-check writes `citation-report.md` into the run folder and applies its format corrections as patches; disclosure writes its statements into the `.tex` as a patch at the place the venue's policy gives, and `disclosure.md` in the run folder names the policy and the place; lit-review without a `.tex` writes `review.md` and `refs.bib` into `paper-runs/lit-review-<YYYY-MM-DD>/` of the folder the session runs in, and with a `.tex` writes `review.md` into the run folder beside the manuscript's folder and adds its entries to the `.bib` as a patch. Pro: the manuscript holds each change and every change leaves its manifest, patch and apply report, as row 23 and ADR 0020 ask, and each mode is called with D26's arguments alone. Con: the session copies each patched file over the manuscript file, a write the scripts do not make.
  - (b) The same, except that the patched file stays in the run folder and the manuscript is left as it was, for the user to copy over. Pro: the skill never writes a manuscript file. Con: D40 and ADR 0021 say the accepted findings are applied to the manuscript, and the user then does by hand, after every run, what the run could do.
  - (c) The same as (a), with a `--bib <path>` argument on every mode in place of reading the `\bibliography` line. Pro: no line of the `.tex` is read for it. Con: an argument D26 does not give, which changes a ruling.
  - Recommendation: (a), since it applies what the run changes, keeps the trail ADR 0020 names and needs no argument beyond D26. The lazy option is (b).
  - The lazy option: (b).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:80` (Open item C)
Builds on it: step 2

## C105. The numbers of the /writing findings the user accepts and the names of a run's patch files (2026-10-19)

step 2, raised by the brief check of `/spec 5 2` (`agents/reviews/2-brief-check.md`, ADRs 4 and Names 1), two choices the user would see. First, D40 and ADR 0021 have the user accept `/writing` findings in one line such as `all but 3, 7`, but the `/writing` report numbers no finding: `skills/writing/SKILL.md:247` to `:255` give the report two parts, groups by rule and findings in document order, and no number, so `3` names nothing. Second, open item C (a) applies each patch with `--output <run folder>/<file name>.patched` and moves the manifest into the run folder under the name `anchorize_tex.py` gives it, while the run folder is to keep each manifest, patch and apply report; full mode patches `main.tex` several times in one run (the draft review rounds, the citation compliance patch, the abstract patch, the `/writing` fixes), and on a scratch copy a second anchorize and move left one `main.tex.block-manifest.json`, one `main.tex.patched` and one apply report, the first trail replaced without warning; the hub's own dongho revision kept one file per round (`admin/reviews/patches/trail/main.rev1.tex` to `main.rev4.tex`).
  - (a) `/writing` numbers its findings 1, 2, 3 in the order its report gives them, across both parts, each finding's number before its first line, a finding that lists several places keeping one number; `paper` reads the user's line against those numbers, `skills/writing/SKILL.md` gaining the rule with its version raised and step 2's paths widened to it. And each patch of a run gets the next number of the run, two digits from 01, and its files are named by it in the run folder's `patches/` folder: `<nn>-<file name>.block-manifest.json`, `<nn>-<file name>.patch.json`, `<nn>-<file name>.patched` and `<nn>-<file name>.patched.apply-report.json`, the file anchorized again before each patch. Pro: the user's line names what the report shows, every later `/writing` report has the numbers for any reader, and the run folder keeps every patch's trail as ADR 0020 says. Con: a change to a second skill in this step.
  - (b) `paper` numbers the findings itself when it shows the `/writing` report, and the patch files are named as in (a). Pro: `/writing` is unchanged. Con: the report the user reads is no longer the one `/writing` printed, so a session that writes no part of a report edits one, and a separate `/writing` run given to `/paper revision` has no numbers.
  - (c) The user names accepted findings by quoting each finding's passage, and the patch files keep C (a)'s names. Pro: no change to either skill. Con: the one-line answer D40 rules becomes many lines, and every patch after a file's first replaces the trail ADR 0020 keeps.
  - Recommendation: (a), since it carries D40's one-line answer as ruled and keeps the trail ADR 0020 and open item C name. The lazy option is (c).
  - The lazy option: (c).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:81` (Open item D)
Builds on it: step 2

## C106. How the /writing findings reach /paper on the current dongho manuscript (2026-10-19)

step 3, raised by the brief check of `/spec 5 3` (`agents/reviews/3-brief-check.md`, ADRs F7.1), a choice the user would see. The brief as drafted had the orchestrator write `accepted-findings.md` from Axel's one-line answer to a separate `/writing` report and give that file to `/paper revision`. `skills/paper/SKILL.md` "### revision" item 1 reads a comments file that is a `/writing` report as items `W<k>`, and only Steps 12's stop "The findings to apply" reads the user's one-line answer, so that route runs neither route of D40 and ADR 0021: `paper` never reads the line, and the comments file is no `/writing` report, against ADR 0021's last sentence.
  - (a) On the copy of research-hub's current revised dongho-ecg-clustering manuscript, after the four single-mode runs, `/writing manuscript/main.tex` runs and its report is saved whole; `/paper revision manuscript/main.tex <that report>` takes it as its comments file, each item `W<k>` changed or named as left unchanged with its reason, and its closing `/writing` review raises "The findings to apply", where Axel answers in one line and the accepted `F<k>` are applied; Axel reads both sets of applied fixes, the diff and the apply reports. Pro: both routes of D40 and ADR 0021 run as the skill builds them, and `paper` reads Axel's line. Con: Axel does not pick among the first report's findings, since every one becomes an item as D40's second route rules, and the run is longer.
  - (b) The brief as drafted: the orchestrator writes the findings Axel accepts to a file of its own and gives it to `/paper revision`. Pro: Axel picks among the first report's findings. Con: neither route of ADR 0021 runs, and the comments file is not the `/writing` report its last sentence names, a contradiction of an ADR in force.
  - (c) Only the closing `/writing` review of the new side's revision comparison counts for D37. Pro: no further run. Con: D37 names the current revised manuscript, which that comparison does not use (it runs on f8c5e7176), so a clause of the step's line goes undone.
  - Recommendation: (a), since it runs D40 and ADR 0021 as ruled and recorded on the manuscript D37 and D39 name. The lazy option is (c).
  - The lazy option: (c).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:78` (Open item E)
Builds on it: step 3

## C107. The ended academic-paper revision run's three closing decisions (2026-10-20)

step 3, raised by the review over round 1 (`agents/reviews/3-refuter.md`, "Repair round 1, refuted", Spec 2). The side's final message ended its run and closed with three "Decisions for you": rerun both foundation models with their authors' preprocessing ("I recommend yes"), run the remaining experiments once running code is allowed ("I recommend running them"), and the deadline, 2026-10-02, with no recommendation. The ruling "The same lines to every side" gives a side the standing lines "at its next stop" and sends a later stop to the user "only when it holds no recommendation".
  - (a) None of the three is relayed: the run had ended, so there is no next stop to answer; decisions 1 and 2 run code, which Axel's answer to Q2 forbids; decision 3 is answered in research-hub's `projects/manuscripts/dongho-ecg-clustering/README.md`: "the revision is complete and independently verified, due 2026-10-02". C5 is met with that reason in the record. Pro: the side's output stays the output of the run as it ended, as the ruling "Keep the academic-paper results" keeps it, and Axel is asked nothing he has already written. Con: the deadline question gets its answer from the README, not from Axel.
  - (b) Decision 3 goes to Axel as an open item. Pro: Axel answers it himself. Con: it asks him a fact his README states, about a round the comparison's input predates.
  - (c) The side is resumed with the standing lines. Pro: the ruling's lines reach the side. Con: the side would take recommendations 1 and 2 and run code against Q2, and change the kept output.
  - Recommendation: (a), since the run had ended and the README answers the one question without a recommendation.
  - The lazy option: none; (a) leaves no work undone, since the question's answer is written.

Taken: (a)
Booked: `.scratch/5-paper/plan.md`, step 3's Step 0
Builds on it: step 3

## C108. Five choices of step 4's brief check (2026-10-20)

step 4, raised by the brief check of `/spec 5 4` (`agents/reviews/4-brief-check.md`, "2. The step line" findings 2, 3, 7, 8 and 10), five choices the user would see.
  - Part 1, the figures of the other skills that launch agents. The ruling "The figures of skills that launch agents" says `docs/figures/` gains a figure of `paper` "and of every other skill that launches agents, once plan 5's fix is done"; step 4's line names `paper`'s figure only, and no step or roadmap entry holds the others (`grep -n -i figure docs/roadmap.md` prints nothing). `README.md:79` names the plan skills, `grill`, `writing`, `code-comments` and `paper` as the skills that launch agents; `docs/figures/pipeline.svg` and `plan-loop.svg` draw the plan skills. `docs/dev/building.md:35` says `gen_figures.py` writes every figure under `docs/figures/`.
    - (a) Step 4 also adds to `docs/figures/gen_figures.py` a figure each of `grill`, `writing` and `code-comments`, drawn as `paper`'s is (its agents in order, its stops with their marks), each shown in `README.md`, and `docs/dev/building.md`'s sentence on the figures says that every skill that launches agents has its figure there and names both scripts. Pro: the ruling is carried out with the fix it names, in the step that already changes `gen_figures.py` and the README's figures. Con: the step grows by three figures, about 30 min of build.
    - (b) A new step between 4 and 5 for the three figures. Pro: step 4 stays as drafted. Con: a second step rewrites the same script and the same README lines right after step 4.
    - (c) Left to a later entry. Pro: no work now. Con: the ruling's sentence goes undone in the plan it names.
    - Recommendation: (a). The lazy option is (c).
  - Part 2, where a failure of the reference checks goes in full, revision and lit-review. Today a `missing:` line of `lookup.py cite-keys` or a failed line of `check-urls` goes to the citation compliance agent (`skills/paper/SKILL.md`, Steps 11), which D43, D48 and D49 remove from those modes.
    - (a) After the last writer pass the session runs both checks; a failure starts the draft writer once with the failing keys and lines, its patch is applied, the checks run again, and a failure left after that is named in the final message with the line as printed. The pass is driven by a script's output, so it is not one of ADR 0022's "at most three writer passes driven by other agents' issues". Pro: the references resolve without a stop and without the user's hands. Con: one more writer start when a check fails.
    - (b) The failures are named in the final message only. Pro: no extra start. Con: the user fixes by hand what the run could fix.
    - (c) A failure is a stop. Con: a stop outside the mode's list, against "The stops of paper".
    - Recommendation: (a). The lazy option is (b).
  - Part 3, the model identifier the AI disclosure names (D47). The configured `reviewer` is the alias `claude:opus` (`.agents/plan.yaml:10`), and `refute`'s Stops define the configured model as the newest model that alias names in the runner's model list.
    - (a) The session gives the draft writer the identifier the alias names in the runner's model list at the run's start, such as `claude-opus-5-5`, the disclosure writes that identifier, and the stop "A model other than the configured one" compares each served model with it. Pro: the disclosure names a model version, and the stop and the disclosure use one value. Con: none found.
    - (b) The alias as written. Con: a disclosure that names `claude:opus`, which is no model's name.
    - Recommendation: (a). No option is the lazy one.
  - Part 4, the statements whose trigger is the ethics check: the responsible-use statement, written when the ethics check rates dual use Moderate or above (`skills/paper/references/statements.md:173`); the reproducibility statement's second trigger, a gap the ethics check marks (`:182`); and a missing approval number, consent or de-identification, which the ethics check lists (`:169`).
    - (a) The responsible-use statement is written when the venue asks for one or the user asks for one at intake, recorded in the Notes; the reproducibility statement when the venue or the user asks for one; a missing approval number, consent or de-identification is named in the draft writer's report and in the final message as a gap for the user to fill; the rating of dual use is left to `researcher`'s ethics check (entry 13). Pro: each trigger is something the rebuilt run has, and no part of the ethics check is done in `paper`. Con: until `researcher` exists a dual-use statement depends on the venue's or the user's ask.
    - (b) The draft writer rates dual use itself from the materials. Pro: the statement is written without an ask. Con: a part of the ethics check comes back into `paper`, against D42 and ADR 0022.
    - Recommendation: (a). No option is the lazy one.
  - Part 5, intake's DOI checking question (`skills/paper/references/intake.md`, "DOI checking"), asked in full, revision, citation-check and lit-review: its Strict answer stops the run at "A reference that cannot be confirmed", which D43, D48 and D49 remove from full, lit-review and revision, and its mark-only answer marks the integrity record, which the rebuilt skill does not write.
    - (a) Asked in citation-check mode only, mark-only marking the entry in `citation-report.md`; in the other modes a failed DOI is an issue of draft review round 1 or reading 1 (D44) and goes as part 2 says. Pro: no answer leads to a stop outside a mode's list. Con: full, revision and lit-review no longer offer the choice.
    - (b) Asked in every mode, Strict sending a failed DOI to the draft writer. Con: the answer then changes nothing part 2 does not already do.
    - Recommendation: (a). No option is the lazy one.
  - Recommendation: (a) for each part, since each carries out a ruling or an ADR in force on the part the step builds.

Taken: (a) for each part
Booked: `.scratch/5-paper/plan.md:221` (Open item I, step 4's Step 0)
Builds on it: step 4

## C109. The judge command of step 5's comparisons (2026-11-15)

step 5, raised by C14 on the lit-review judges (`.scratch/5-paper/agents/reviews/5-blind-comparison.md`, lit-review): the brief's judge command runs under `--restricted`, which loads no global instructions, and C14 and `docs/dev/blind-comparison.md` item 4 require the judge to load them.
  - (a) Every judge of step 5 runs without `--restricted`, keeping `--tools Read Glob Grep --disable-slash-commands --strict-mcp-config`; C13 reads each judge's tool calls for a path outside its copy. Pro: the judge loads the global instructions and still has only the three reading tools, no skill and no MCP server (test run in an empty folder). Con: the file tools are not confined to the working folder by the runner, so the confinement rests on the prompt and on C13's check.
  - (b) Keep the restricted judgments and name the missing instructions. Pro: no rerun. Con: the verdicts come from judges that never read the user's instructions, which the page counts as part of what the user needs. This is the lazy option.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:207` (Open item BC, step 5's judges run without `--restricted`)
Builds on it: step 5

## C110. Item 8's pick of the closing `/writing` findings (2026-11-15)

step 5, raised by `.scratch/5-paper/agents/reviews/5-refuter.md` Spec 2 as open item BE: item 8's revision run took the autonomous writer pass, so D40's one-line pick applied by the draft writer was not run; the user answered that the reply is the orchestrator's under "Step 5's stops answered by the orchestrator".
  - (a) Run item 8's revision process again on a fresh copy with the same `writing-report.md`, its intake answer saying not to stop except at the reply to the closing `/writing` report, which the orchestrator gives in one line; the draft writer applies each accepted finding or lists it as not applied with its reason. Pro: D40's route is run by the gate. Con: one more revision run.
  - (b) Record the autonomous pass as item 8's result and the pick route as not checked. Pro: no run. Con: the route a user takes when they answer stays untested before the closing. This is the lazy option.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/plan.md:214` (Open item BE)
Builds on it: step 5

## C111. What the cache of step 5.B holds (2026-11-16)

step 5.B, raised by the user's question on ruling "The lookups of lookup.py": whether the reply cache holds lookups by DOI only, or every metadata reply of the indexes.
  - (a) Every HTTP 200 reply of an index's metadata interface: a record by DOI or arXiv ID, a title or topic search, references and cited-by; never `check-urls` (a URL's liveness is what it checks) nor `fetch` (ADR 0029 has each citation check fetch its sources again); never a reply other than 200. Pro: the repeated title searches, refs and cited-by calls, where most of the 429s of 2026-11-15 came from, cost one request each. Con: a record an index corrects within 30 days is read from the cache until then.
  - (b) Lookups by DOI only. Pro: the smallest cache. Con: the title searches, refs and cited-by calls stay uncached. This is the lazy option.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/plan.md` step 5.B, (3)
Builds on it: step 5.B

## C112. The earlier papers in step 5.E (2026-11-16)

step 5.E, raised at the brief of step 5.E: the citation compliance agent compares the manuscript with the authors' earlier papers only when `lookup.py fetch` gets their text (`references/citation-compliance.md:382`-`:386`), the route the ruling The fourth repair of paper replaces for cited sources.
  - (a) The comparison reads an earlier paper the same way as a cited source, in step 5.E. Pro: an earlier paper on Europe PMC, PMC, its DOI page or its venue page is compared. Con: a few more saved pages per run.
  - (b) The comparison stays on `lookup.py fetch` alone. Pro: no change. Con: an open earlier paper is listed "not compared". This is the lazy option.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/plan.md` (ruling The earlier papers in step 5.E)
Builds on it: step 5.E

## C113. Where the citation compliance agent gets a source's PMCID (2026-11-16)

step 5.E, raised by `.scratch/5-paper/agents/reviews/5.E-brief-check.md` check 7: a Europe PMC search by DOI run with `curl` is a reference lookup outside `lookup.py`, against ADR 0017 and the plan's Goal.
  - (a) `lookup.py resolve` prints a `pmcid:` line from OpenAlex's record, and the agent saves the PMC and Europe PMC pages at addresses built from it. Pro: every lookup stays in `lookup.py`; ADR 0017 and the Goal hold. Con: a source OpenAlex holds no PMCID for skips PMC and goes on to the DOI's page.
  - (b) The agent queries Europe PMC's search with `curl -G --data-urlencode`. Pro: finds a PMCID OpenAlex lacks. Con: a lookup outside `lookup.py`, needing ADR 0017 superseded and the Goal reworded. This is the lazy option, since it moves the lookup out of the script instead of adding it there.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.E.md` "Decisions taken in this brief" 4
Builds on it: step 5.E

## C114. The effort of a role on the default agent (2026-11-16)

step 5.E, raised by `.scratch/5-paper/agents/reviews/5.E-brief-check.md` "Declined to judge": under ruling Open item BN a role runs on the default agent, and the run must name the effort it ran at.
  - (a) Start the role with the Agent tool's `effort` set to `medium`, and name `medium` (or `CLAUDE_CODE_EFFORT_LEVEL`'s value when set). Pro: the roles run at the effort `ordo-medium` gives, and the run names a value it knows. Con: none found.
  - (b) Start it with no `effort`, and name "the session's effort". Pro: no argument. Con: the run names a value it never reads, and the effort follows whatever the session runs at. This is the lazy option.
  - Recommendation: (a).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.E.md` "Decisions taken in this brief" 7; `docs/adr/0035-*.md`
Builds on it: step 5.E

## C115. The OpenAlex field list and test U1 in step 5.E (2026-11-16)

step 5.E, handed back by its builder at the first run: case T11 says the existing tests pass unchanged, and item 3 adds `ids` to `OPENALEX_FIELDS`, which changes the OpenAlex URLs test U1 pins.
  - (a) Add `ids` to `OPENALEX_FIELDS` and to U1's URLs. Pro: one field list for every OpenAlex request; the PMCID is read for a DOI, an arXiv ID and a title alike. Con: the cached OpenAlex replies are asked once more under their new URLs.
  - (b) A second field list for `resolve` alone. Pro: fewer cache keys change. Con: a second code path for one field, and a title `resolve` shares its search with `search`.
  - Recommendation: (a). The lazy option was dropping the `pmcid:` line, which leaves R1 and R17 unmet.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.E-cases.md` 1
Builds on it: step 5.E


## C116. The fix caps in step 5.F (2026-11-16)

step 5.F, brief check finding 17: the ruling Open item BR keeps "the one-try caps on fix attempts that end at a stop", and three of the four caps end in the final message, not at a stop.
  - (a) Keep all four as they are. Pro: they bound a fix, never how often an agent may start, which is what the ruling removes; each failure left is still named. Con: a compile or citation failure after one fix reaches the final message without a further try.
  - (b) Turn each into a stop that offers another try. Pro: the user decides each time. Con: more stops in a run that the ruling did not ask for.
  - Recommendation: (a). The lazy option was neither; (b) adds stops the ruling did not name.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F.md` "Decisions taken in this brief" 4
Builds on it: step 5.F

## C117. The count of the currency passes in step 5.F (2026-11-16)

step 5.F, brief check finding 22: "until the share is met or a pass adds nothing" is a repeat with no count, which `docs/dev/skill-layout.md` "Writing for an agent" forbids.
  - (a) At most 3 passes over the last 3 years. Pro: a count, and three passes cover each database and index again. Con: a share still short after three is reported as not met.
  - (b) At most 1. Pro: cheapest. Con: the rc.6 run's 45 percent would likely stay short.
  - Recommendation: (a). The lazy option was (b).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F.md` "Decisions taken in this brief" 5
Builds on it: step 5.F

## C118. The parts of the research question in step 5.F (2026-11-16)

step 5.F, brief check under "The question": the search concepts of the strategist's page are terms of a search string, not the parts of the question the judges meant.
  - (a) The strategist writes the question's sub-questions in `review.md`, each searched and each a part of the synthesis. Pro: matches the judges' "three parts of the research question". Con: one more record in `review.md`.
  - (b) Use the search concepts as the parts. Pro: no new record. Con: a synthesis by search terms misses the judges' point.
  - Recommendation: (a). The lazy option was (b).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F.md` "Decisions taken in this brief" 6
Builds on it: step 5.F

## C119. A character with no ASCII form in step 5.F (2026-11-16)

step 5.F, brief check findings 32 to 45: exit 2 with nothing printed left the caller no entry to finish, and broke `lookup.py`'s exit scheme.
  - (a) Print the entry with `{?}` for the character, a warning line, exit 0; the caller writes that one character. Pro: the entry still comes from the script; the exit scheme holds. Con: the caller must act on a warning.
  - (b) Exit 2 with nothing printed. Pro: nothing unchecked is printed. Con: the source loses its entry or is typed from memory.
  - Recommendation: (a). The lazy option was (b).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F.md` "Decisions taken in this brief" 7
Builds on it: step 5.F

## C120. The change written again in full in step 5.F (2026-11-16)

step 5.F, brief check findings 29, 30 and 52: a one-section patch rarely exits 3, so "confirmed at the stop A structural patch" was unreachable, and AP's full re-emission is of the whole draft.
  - (a) The whole file written again as one patch over every block; choosing it at the stop is the confirmation; applied with `--acknowledge-structural`. Pro: AP's full re-emission; reachable. Con: the largest patch a run can write.
  - (b) One section rewritten. Pro: smaller. Con: not AP's escalation, and the confirmation stop is not reached.
  - Recommendation: (a). The lazy option was (b).

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F.md` "Decisions taken in this brief" 3
Builds on it: step 5.F

## C121. The form of a with a ring in step 5.F (2026-11-16)

step 5.F, handed back by its builder at the first run: item 5 gives U+00E5 two forms, `{\r{a}}` by the ring rule and `{\aa}` in its list of letters.
  - (a) The ring rule, `{\r{a}}` and `{\r{A}}`; `{\aa}` and `{\AA}` leave the table. Pro: one rule per character; case T11 stands. Con: none for compiling, both forms print the same letter.
  - (b) `{\aa}` first. Pro: the conventional form. Con: two rules reach one character.
  - Recommendation: (a). The lazy option was none: both cost the same.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F-cases.md` 1
Builds on it: step 5.F

## C122. The stop after draft review round 2 in step 5.F (2026-11-16)

step 5.F, review finding S1 and S2: the builder made every Major Revision or Reject verdict after round 2 a stop, which removes academic-paper's branch "Overall Score < 6.5 BUT all Critical resolved -> Accept with remaining issues" (`agents/peer_reviewer_agent.md:427`), since every score below 6.5 carries one of those verdicts.
  - (a) Keep the branch: below 6.5 with every Critical issue resolved goes on; the stop comes only with a Critical issue unresolved and offers the answers of both of academic-paper's lists once. Pro: every branch of academic-paper's text is reachable; an unattended run is not halted where academic-paper goes on. Con: the root-cause stop needs a Critical issue open.
  - (b) The verdict rule as built. Pro: none that academic-paper's text supports. Con: the explicit branch at :427 becomes dead.
  - Recommendation: (a). The lazy option was (b), keeping what was built.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.F-cases.md` 3
Builds on it: step 5.F

## C123. The source-count target of a theme run in step 5.G (2026-11-16)

step 5.G, brief check, judged point on decision 2: the brief gave each theme run the paper type's whole minimum (30 for a Literature Review) as its own target; academic-paper's session gave each theme a range of its own (12 to 25, 18 to 30, 12 to 25, 15 to 28) and held the 30 to the merged report (`search/theme_A_tensor.md:134` of step 5's academic-paper run).
  - (a) The session sets each theme's range in `config.md` "Decisions" from the theme's breadth; the paper type's minimum applies to the merged set at the merge run's gate; each theme run's search ends by the page's pass rule. Pro: the run the ruling copies; a narrow theme is not padded with marginal sources to reach 30, which the judges read as off-topic; the depth comes from the pass rule, which runs passes while they add sources. Con: a theme's floor is lower than (b)'s.
  - (b) The paper type's whole minimum per theme. Pro: a higher floor for each theme. Con: four themes force about 120 sources, with marginal sources in narrow themes, and a departure from the run the ruling copies with no evidence that it covers more.
  - Recommendation: (a). The lazy option was neither on cost alone: (a) costs less, and it is taken for the padding and for following the copied run, not for the cost.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.G.md` "Decisions taken in this brief" 2
Builds on it: step 5.G

## C124. The branch of the ruling The rule-by-rule check (2026-11-18)

plan 5, before step 5.H's brief: the check (`.scratch/5-paper/agents/reviews/5.H-rule-check.md`) counted 384 rules, 40 dropped by at least one agent, 67 drops; drops as a share of followed plus dropped: session 2.5 percent, theme runs 5.7 to 12.2 percent, merge run 11.3 percent. Dropping does not grow toward the end of the strategist page or late in the run; it clusters in the page's search and reading sections (lines 102 to 304). The ruling says that when the check shows rules dropped, 5.H cuts what one agent loads at once, and when it shows few dropped, 5.H stays as the ruling BS says.
  - (a) The branch for rules dropped: a theme run and the merge run each load only the sections of the strategist page they use (each theme run met about 65 rules of the page it never reached), and each dropped rule of the check's section 4 is a case of 5.H, rewritten so the agent meets it where it applies it, or reworded to what the run is to do where following it does not change the review. Pro: the ruling's condition is met; it removes from each agent's load the sections it never uses, at no cost to the review; it treats the 40 dropped rules, several of which the judges counted (the synthesis naming no empty search, LS:356; the full text not tried, LS:195 and LS:205). Con: the check does not show that length by position causes the drops, so the cut is not proven to help; it adds a step of structure to keep.
  - (b) The branch for few dropped: 5.H as the ruling BS says, the dropped rules left as they are. Pro: the check shows no growth of dropping with page position or run time. Con: 40 rules stay dropped, the judged ones among them; reads the ruling's condition against its words.
  - Recommendation: (a). The lazy option was (b), which costs less and leaves the 40 dropped rules as they are.

Taken: (a)
Booked: `.scratch/5-paper/plan.md` Rulings, Open item BT
Builds on it: step 5.H

## C125. Where the run's process records go in step 5.H (2026-11-18)

step 5.H, the ruling BS item (2) says tool names and run records stay in the run record and out of the review. The rc.8 judges counted against `paper` the commands and process notes in `review.md` (judges 1 and 2: "`the lookup script search`", "node 4 of the screening tree", "Read from: the abstract `lookup.py fetch` wrote"). A new file of the run folder is a user-visible shape.
  - (a) `review.md`'s search record keeps per search the database, the string, the filters, the date, the count and the records taken, which make the search reproducible; the commands, script names, request addresses, reply statuses, lookup notes and file names go to `search-log.md` in the run folder (a theme run: `search-log-theme-<k>.md`), named once in `review.md` and listed in the final message; "Read from" gives the address of the text. Pro: the review reads as a review and stays reproducible; nothing of the record is lost. Con: one more file in the run folder.
  - (b) Everything in `review.md`, as now. Pro: one file. Con: the judged defect stays.
  - (c) The process records in `config.md`, the run record intake writes. Pro: no new file. Con: `config.md` holds the intake answers and decisions that a continued run reads; hundreds of log lines bury them.
  - Recommendation: (a). The lazy option was (b), which changes nothing.

Taken: (a)
Booked: `.scratch/5-paper/plan.md` Rulings, Open item BU
Builds on it: step 5.H

## C126. A renamed later version that no index links to its preprint, in step 5.I (2026-11-18)

step 5.I, item (2) of the ruling The examples, the renamed versions and the gap chaining asks that a published version under a new title be accepted when an index links it to the preprint, so that rc.8's Thual TMLR version is cited as published. No index links the two: `curl` of Semantic Scholar's `paper/ARXIV:2312.06467` printed the preprint's title and the venue arXiv.org; its search on the TMLR title printed a separate record (3fdb5ff93c2afc62736f3f93b8ef986fd64b1a92) with no arXiv ID; OpenAlex's search found no TMLR record. The TMLR page lists nine authors against the preprint's seven.
  - (a) A later version no index links to the preprint is a work of its own: confirmed by `lookup.py resolve` on its title, cited with the entry `lookup.py bibtex --page <url>` builds from its venue's page (accepted when an index's record found by the page's `citation_title` has a title ratio of 0.70 or more and the page's year), the preprint named as its earlier version in the annotation. A version an index links keeps the existing route. Pro: the review cites the published work, which the judges asked for, and every entry still rests on an index record. Con: a change to `lookup.py` with its tests.
  - (b) Only the index-linked route the ruling names. Pro: no script change. Con: Thual stays a preprint, the judged defect stays.
  - (c) Accept the venue page against the preprint's title at a lower ratio. Pro: small change. Con: a ratio of 0.42 accepts unrelated papers, and the entry would claim the preprint's eprint for a paper with other authors.
  - Recommendation: (a). The lazy option was (b).

Taken: (a), replaced by C127
Booked: `.scratch/5-paper/plan.md` Rulings, Open item BV
Builds on it: nothing; C127 replaces it

## C127. The renamed later version cited from the record resolve prints, in step 5.I (2026-11-18), replacing C126

The brief check of step 5.I (`.scratch/5-paper/agents/reviews/5.I-brief-check.md`, "7. ADRs") found that C126's new `lookup.py bibtex --page <url>` form, with no arXiv ID, contradicts ADR 0032, whose decision says "an entry for a source with neither identifier is written from the record `resolve` prints". The TMLR version of Thual et al. has neither identifier (Semantic Scholar record 3fdb5ff93c2afc62736f3f93b8ef986fd64b1a92 holds only DBLP and CorpusId), and rc.8 found it by forward tracking (`review-theme-4.md:192` of the rc.8 run).
  - (a) C126 as taken, with a new ADR superseding that clause of ADR 0032. Pro: the entry carries the venue page's fields. Con: a rule clash with an ADR, which waits for the user, and a new script form with about a dozen untested inputs the check listed.
  - (b) The later version is a work of its own, included when `resolve` on its title prints a matching record, its entry written from that record as `literature-strategist.md` already says for a source with neither identifier, confirmed by `resolve --entry`, its Type naming the preprint as its earlier version; no script change. Pro: follows ADR 0032, cites the published work, and every entry rests on an index record. Con: the entry has no page range from the venue page (TMLR gives none).
  - (c) Keep the preprint. Con: the defect the judges named stays.
  - Recommendation: (b). The lazy option was (c).

Taken: (b)
Booked: `.scratch/5-paper/plan.md` Rulings, Open item BW
Builds on it: step 5.I

## C128. The record an entry is written from, in step 5.J (2026-11-18)

The brief check of step 5.J (`.scratch/5-paper/agents/reviews/5.J-brief-check.md`, "3. Premises") found that `lookup.py resolve` prints three authors and "et al." and no volume, number or pages (`skills/paper/templates/lookup.py:656-657`), while item (4) of ruling Open item BX has the strategist write each entry from the record it confirmed.
  - (a) `resolve` prints every author and the volume, the issue and the pages the index gives; `search`, `refs` and `cited-by` keep three authors. Pro: the record holds the fields an entry needs, at no extra request, since the indexes already return them for a field list one word longer. Con: a change to `lookup.py` and its tests in this step.
  - (b) The strategist reads each work's own page for its authors, volume and pages. Pro: no script change. Con: one more fetch per source, the cost ruling BX removes, and a page that cannot be read leaves the entry short.
  - (c) Entries keep three authors and no pages. Con: an entry with "and others" for every work with more than three authors, a defect all four rc.9 judges marked.
  - Recommendation: (a). The lazy option was (c).

Taken: (a)
Booked: `.scratch/5-paper/plan.md` Rulings, Open item BY
Builds on it: step 5.J

## C129. Three choices of the brief of step 5.M (2026-11-19)

The brief check of step 5.M (`.scratch/5-paper/agents/reviews/5.M-brief-check.md`, Names 3, The question 5 and 7, The step line 3, ADRs 2 and 5) found three choices ruling CA does not settle.

- (1) The entries the merge run adds: (a) the session's identifier check runs again on them before the patch (`skills/paper/SKILL.md:529`, `docs/academic-coverage.md` row 124). Pro: every entry the lit-review run writes is resolved, as `:512` and the plan's gate ask, for the 30 to 40 sources an academic-paper-sized merge adds. Con: one `resolve` per added entry. (b) No check. Con: added entries reach the patch unchecked.
- (2) The scope rule: (a) "the methods that stand in its place or build on it for the same question". Pro: it reaches lesion-symptom mapping, the registration-based counterpart academic-paper step 5's theme D named, and follows the research question's "remove or build on". Con: wider than CA's words. (b) CA's "the methods that stand in its place". Con: the line the rule exists for is missed.
- (3) The record of ADR 0037's change: (a) its status line, in the form plan 5 uses for rulings, saying the part is in force in CA's form and naming what of 0037's form stays superseded. Pro: the reader of 0037 sees what holds; the form every ruling of plan 5 uses. Con: `docs/adr/README.md` asks for a new ADR for a changed decision. (b) A new ADR. Con: a record of a decision the plan's rulings already hold, with no change to the skill.
- Recommendation: (1)(a), (2)(a), (3)(a). The lazy options were (1)(b) and (2)(b).

Taken: (1)(a), (2)(a), (3)(a)
Booked: `.scratch/5-paper/agents/briefs/5.M.md`, Decisions 4, 5 and 6
Builds on it: step 5.M

## C130. Findings S2 and S3 of the review of step 5.M, taken into repair round 1 (2026-11-19)

The review of step 5.M (`.scratch/5-paper/agents/reviews/5.M-refuter.md`, 1. Spec, S2 and S3) found two rules outside the brief's items that the merge run as ruling CA wants it depends on.

- (1) S2: the merge run's list gains the theme run's rules on recording every query it runs with the count the tool returned, and on writing each entry it adds from the record it confirmed. They trace to academic-paper step 5's merge prompt (HONESTY: "every query you run is recorded with tool, date and the count the tool actually returned; never estimate a count"; "its identifier is copied from that record") and to ADR 0040's part in force.
- (2) S3: the theme run's list gains a rule that its report names each source it left out with its reason, a source left out to hold its target among them, and each lead it names for the merge run. It traces to academic-paper step 5's theme prompt ("a list of excluded-at-full-text sources with reasons"; FINAL REPLY "anything you could not do and why").
- Options: (a) both taken into repair round 1. Pro: without them the merge run's additions carry estimated counts and entries written from memory, and a theme run that hands nothing on leaves the merge run nothing to assess, as at rc.12. Con: the step's text grows past its brief's items. (b) Booked as a later step. Con: rc.13 would test a merge run whose inputs and records are not academic-paper's.
- Recommendation: (a). The lazy option was (b).

Taken: (a)
Booked: `.scratch/5-paper/agents/reviews/5.M-refuter.md` (to be closed under "Closed" after the round)
Builds on it: step 5.M, repair round 1

## C131. The name of the response letter's own mode, in the brief of step 5.Q (2026-11-20)

Ruling Open item 5.Q-letter-place gives the response letter a mode of its own for a revision already made, and names no mode.

- Options: (a) `response-letter`, the name of what the mode writes, as academic-paper names `revision-coach` and `rebuttal-audit` by what they do. Pro: a reader finds the mode by the thing they want. Con: none found. (b) `rebuttal`, the name of roadmap entry 7's skill. Pro: the word users type. Con: it names a skill entry 7 had, which 5.Q's landing drops, and it reads as the audit mode's neighbour.
- Recommendation: (a). No option was the lazy one; both cost the same.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.Q.md`, "Decisions taken in this brief" 2
Builds on it: step 5.Q

## C132. Step 5.Q built by one builder, in three ordered parts (2026-11-20)

The brief check of step 5.Q (`.scratch/5-paper/agents/reviews/5.Q-brief-check.md`, 4 Cases and checks) judged the step not reliably buildable by one builder (52 source files, 106,563 words, and `paper`'s present text of 97,063 words) and proposed a split by mode group.

- Options: (a) one step and one builder, the work done in the order role pages and copies, then `SKILL.md` with the modes, then the ADR, the glossary, the coverage page and the figures, the report written part by part. Pro: every mode uses the shared role pages and `SKILL.md`, so a split would have each later part change files an earlier part landed, and a mode's structure can be read against academic-paper only once `SKILL.md` is whole, which is what one review of the whole skill reads. Con: one long build, which relies on the builder's context compaction and its part-by-part report. (b) Three steps, each with its own brief check, review and landing. Pro: each part reviewed alone. Con: the parts share their files, so a later part reopens an earlier landing, and no review reads a whole mode until the last.
- Recommendation: (a). The lazy option: neither is cheaper in the work it leaves undone; (b) costs more agent runs, (a) asks more of one builder.

Taken: (a)
Booked: `.scratch/5-paper/agents/briefs/5.Q.md`, "Decisions taken in this brief" 7
Builds on it: step 5.Q

## C133. A folder and a project name share the place in front of the entry, in the brief of step 3 of plan 5.A (2026-11-22)

The ruling "The folder in a call" puts the folder that holds `plan.yaml` in front of the entry, where a project name of the `projects:` form goes today, and does not say how the two are told apart.

- Options: (a) the longest leading part that is a folder holding a `plan.yaml` is the folder, and what is left before the entry names a project of that file: `/plan apps/web/12` reads `apps/web/plan.yaml`, `/plan tools/a/12` reads `tools/plan.yaml`, project `a`, and `/plan x/12` with no folder `x/plan.yaml` reads the root file's project `x`. Pro: every call that works today reads as before, and a nested file may use the `projects:` form. Con: a project named like a folder that holds a `plan.yaml` is read as the folder. (b) the part in front of the entry is always a folder, and the `projects:` form goes. Pro: one reading. Con: it removes a form the goal keeps.
- Recommendation: (a). The lazy option: (b), which has less to state.

Taken: (a)
Booked: `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/3.md`, "Decisions taken in this brief" 1 and 2
Builds on it: step 3

## C134. A new configuration is written to `docs/plan.yaml`, in the brief of step 3 of plan 5.A (2026-11-22)

The goal reads every path of a `plan.yaml` from the file's folder and moves Ordo's file to `docs/plan.yaml`. The example files and `ordo-init` write a new file to `.agents/plan.yaml` with paths from the repository root, which the goal makes wrong. The brief check raised it (`agents/reviews/3-brief-check.md`, 2).

- Options: (a) `ordo-init`, `repo-setup` and the example files write `docs/plan.yaml`, with values read from `docs/` (`roadmap: roadmap.md`, `ledger_root: ../.scratch`); the README says what the owner of an existing `.agents/plan.yaml` does. Pro: a new repository is set up as Ordo is, and no text tells a reader the configuration is at `.agents/plan.yaml`, which the gate's reading of each line asks. Con: more text changes. (b) they keep writing `.agents/plan.yaml`, with values such as `../docs/roadmap.md`. Pro: fewer changes. Con: every path of a new file starts with `../`, and the place Ordo left stays the documented one.
- Recommendation: (a). The lazy option: (b).

Taken: (a)
Booked: `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/3.md`, "What to build" 8 and "Decisions taken in this brief" 3
Builds on it: step 3

## C135. How the two scripts are given the configuration, in the brief of step 3 of plan 5.A (2026-11-22)

The goal has `land.sh` and `check_config.py` given the path of the file found, and the gate asks `check_config.test.sh` for a case per place of the search order.

- Options: (a) `check_config.py <path of plan.yaml>` checks that file, `check_config.py --find <repository root> [<folder>]` prints the first file of the order, and `land.sh` takes the path as a required fourth argument. Pro: the order has one executable form the gate's cases run, and each script opens only the file it is given. Con: a second form of `check_config.py`. (b) no `--find`; the test builds the order itself. Pro: one form. Con: the gate's cases would then test the test.
- Recommendation: (a). The lazy option: (b).

Taken: (a)
Booked: `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/3.md`, "What to build" 5 and 6 and "Decisions taken in this brief" 4 and 5
Builds on it: step 3

# Entry 13 researcher

## C144. The source's files no ruling names (2026-11-25)

Step 1 copies academic-pipeline's files, and the gate lets the comparison print only differences the plan's Rulings name. What the tree shows: the source holds 30 files (`find . -type f` in the source folder). Rulings D16 and D17 and ADR 0052 settle the claim audit, the cross-model check, the patch scripts, the collaboration observer, the research stage, the finalizing stage and the process summary. No ruling names what happens to four other files: `references/adapters/overview.md` with `references/adapters/.gitkeep`, `references/literature_corpus_consumers.md`, `references/passport_as_reset_boundary.md` and `references/changelog.md`.
  - Option (a), recommended: those files are left out, and every other file of the source is copied. `references/adapters/` and `references/literature_corpus_consumers.md` state how the agents of the source's research stage and its literature strategist read a literature corpus produced by adapter scripts under upstream's `scripts/adapters/` and checked by JSON schemas under `shared/contracts/passport/`; the research stage is not copied, and no file under `skills/` names `literature_corpus` (`grep -rl literature_corpus skills` prints nothing). `references/passport_as_reset_boundary.md` applies only when the environment variable `ARS_PASSPORT_RESET=1` is set (source `agents/pipeline_orchestrator_agent.md:179`), rests on a schema file that is not taken, and ruling D6 already keeps a run's state in files of the run folder. `references/changelog.md` is history, which `docs/dev/change-standard.md` keeps out of shipped text. The parts of the copied files that name these four are removed with them. Pro: the copy holds no page whose reader or whose files do not exist here, by the same line ruling D16 draws for the documents a default run needs. Con: a later wish for a literature corpus or for the reset boundary has to take those pages then.
  - Option (b): the three pages are copied too, with the schema files and the adapter scripts they rest on taken from upstream. Pro: nothing of the source is left out beyond what the user ruled. Con: the copy gains Python scripts and JSON schemas that nothing in this repository runs or tests, for agents that are not copied, and a script needs its test in the verify list, a change to the configuration that is the user's.
  - Recommendation: (a), since the pages' readers and files are absent from the copy and ruling D16 leaves out what a default run does not need. The lazy option is (a) as well, the one that costs less; it is taken for the reason given and not for its cost.

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:82` (Open item A)
Builds on it: step 1

## C145. Three differences of the copy no ruling names (2026-11-25)

The brief check of step 1 (`.scratch/13-researcher/agents/reviews/1-brief-check.md`, "The step line" 1 and "ADRs" 1 and 3) found three differences of the copy that no ruling names, while the gate lets the comparison print only differences the Rulings name. First, where the six upstream documents stand: the step line said "each under its source's folder and name", upstream keeps them in `shared/`, and `docs/dev/skill-layout.md` gives a skill the folders `agents/`, `references/`, `examples/` and `templates/`. Second, how far the prose standard reaches into copied text: ADR 0052 says "ASCII and the prose standard applied to the skill text", and the copy is word for word. Third, what happens to a pointer to a file that is not taken, such as `shared/references/firm_rules.md`, `scripts/slr_lineage.py` and the `docs/design/` lines of `agents/pipeline_orchestrator_agent.md`.
  - Option (a), recommended: (1) `shared/agents/compliance_agent.md` stands at `agents/compliance_agent.md` and the other five documents at `references/<the same name>`, as the layout places a role page and reference material. (2) Copied text follows the prose standard's section 0 (no character outside ASCII, the check mark included; no dash used as an aside in any form, a spaced hyphen and a double hyphen included; an arrow outside code written as a word) and section F on hard wraps; a sentence kept from the source otherwise keeps its words; a sentence the builder writes follows the whole standard. (3) A pointer to a file that is not taken is removed with the sentence or the row that exists only for it; a line that names a design document as the specification of a rule is removed as history; a pointer to a file of `paper` or `paper-review-panel` names that skill and its file. Pro: the copy fits the layout, stays a copy of the source's words, and names no file a reader cannot open. Con: the six documents are not at upstream's paths, so the comparison pairs them file by file.
  - Option (b): the six documents in a folder `shared/` as upstream has them, every sentence rewritten to the whole prose standard, and the pointers kept. Pro: upstream's paths. Con: a folder the layout does not give a skill; rewriting every sentence ends the copy that ADR 0052 decides; a kept pointer names a file that does not exist here.
  - Recommendation: (a), since the layout and ADR 0052's word "copy" rank the options. Of the two, (a) is also the smaller amount of rewriting; it is taken for the reasons given.

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:87` (Open item B)
Builds on it: step 1

## C146. The full example's integrity stages and how the integrity agent picks its claims (2026-11-25)

The review of step 1 (`.scratch/13-researcher/agents/reviews/1-refuter.md`, Spec 2 and Behaviour 1) and the builder's two hand-backs (`agents/reviews/1-report.md`, H1 and H2) show two places where the copy cannot keep the source's text and no ruling says what stands there. First, the source's worked example of a whole run, `examples/full_pipeline_example.md`, has no integrity stage: it goes from writing to review and ends without a final check, while the state machine forbids both and every other copied page runs both checks. Second, the integrity agent picks the claims it checks against the record of the experiments through a field of the draft writer's claim list, `planned_experiment_ids`, and the draft writer of `paper` writes no such field (`grep -rn planned_experiment_ids skills/academic/paper` prints nothing), so in a `researcher` run the check picks no claim and a claim that contradicts a recorded result passes.
  - Option (a), recommended: (1) the full example gains a Stage 2.5 scene and a Stage 4.5 scene in the form `examples/mid_entry_example.md` has them, so the example agrees with the state machine. (2) The integrity agent picks the claims by reading the manuscript: each sentence that reports an outcome of the author's own experiments is a claim of the check and is matched to the entry of the record it reports; the field `planned_experiment_ids` is named nowhere in the copy. Pro: both stay inside `researcher`; the example no longer shows a run the state machine forbids; the check on a claim that contradicts a recorded result, which ruling D20 keeps, can fail a manuscript. Con: the example and the check differ from the source in these two places, and matching a sentence to an entry is a reading where the source had a declared link.
  - Option (b): the example as the source has it, and the field added to the claim list of `paper`'s draft writer. Pro: the source's words in `researcher`. Con: an example that contradicts the state machine; a change to `paper`, which is a copy of academic-paper and was closed with its own gate.
  - Recommendation: (a), since ADR 0052 makes `researcher` the copy that is adapted and the brief's rule that no two pages disagree ranks the example. (a) is also the smaller change; it is taken for the reasons given.

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:92` (Open item C)
Builds on it: step 1

## C147. The command lines of `integrity` and `manuscript` (2026-11-25)

Step 2 writes the Quick start of `researcher`, and the plan fixes the command lines of the `integrity` mode only (ruling D2: `/researcher integrity` and `/researcher integrity pre-review`). What each command takes as its argument, and how `manuscript` is told that a draft already exists, is a public shape no ruling gives. The source takes a sentence in plain words and detects the stage; `paper` takes `/paper full <project folder>` and `/paper revision <main.tex> <comments file>`.
  - Option (a), recommended: `/researcher integrity <main.tex>`, `/researcher integrity pre-review <main.tex>`, `/researcher manuscript <project folder>` for a paper written from the project's materials, and `/researcher manuscript <main.tex>` for a draft that exists, which enters at the first integrity check as ruling D4 says, and `/researcher manuscript <main.tex> <comments file>` for a draft with review comments in hand, which runs the first integrity check and then the revision, as the copied state machine's entry at Stage 4 has it. Pro: the arguments of `paper`, which `manuscript` runs, so a user types the same thing to both; the midway entry is told by what the argument is, with no extra word. Con: none found.
  - Option (b): the source's plain sentence, with the stage detected from it. Pro: the source's form. Con: `/ordo-help` prints a skill's command lines from its Quick start, and a plain sentence gives it no line per mode; every other skill of this repository names its mode as a word.
  - Recommendation: (a), since `docs/dev/skill-layout.md` asks the Quick start for every invocation, one per line. Neither option is the cheaper one.

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:100` (Open item D)
Builds on it: step 2

## C148. The Stage 3 scores the deltas start from (2026-11-25)

The Stage 3 scores that the score deltas start from are not in the full mode's Editorial Decision. My text of Open item E said the editorial synthesizer gives the scores "as in the full mode"; that was wrong. In the full mode each of the five reviewers scores the seven dimensions in its own report, and the editorial synthesizer builds a scoring matrix from them (`skills/academic/paper-review-panel/agents/editorial_synthesizer_agent.md` line 50) and writes none of it into the Editorial Decision (`grep -n -i '0-100\|dimension score\|weighted average' skills/academic/paper-review-panel/templates/editorial_decision_template.md` prints nothing). The user's ruling on E gives the re-review its scores; the baseline they are compared with still has to stand somewhere.
  - Option (a), recommended: the full mode's editorial synthesizer also writes the seven dimension scores and the Weighted Average into the Editorial Decision, in the form the re-review now gives them. Pro: the baseline and the re-review are scored by the same role on the same rubric, which is what ruling E set out to get. Con: one more addition to `paper-review-panel`'s output.
  - Option (b): `researcher` aggregates the baseline from the five reviewers' tables. Con: it needs an aggregation rule that the rubric page does not give.
  - Option (c): the re-review's scores are compared with each reviewer's own scores. Con: five deltas per dimension, where the copied page defines one.
  - Recommendation: (a). The cheaper option is (b).

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:111` (Open item F)
Builds on it: step 2

## C149. The command lines of `novelty` and `idea`, and where a novelty page is written (2026-11-25)

Step 3 writes the Quick start lines of `novelty` and `idea` and names the file each leaves, and no ruling gives either. Ruling D9 gives a project a `notes/` folder "for other material" and makes `README.md` the entry file; ruling D29 opens the README with the question and claims.
  - Option (a), recommended: `/researcher novelty <idea> [<project folder>]`, the idea a sentence in quotes or the path of a file that holds it, the page written to `notes/novelty-<YYYY-MM-DD>.md` in the project folder (the folder the session runs in when none is given), with `-2`, `-3` for a further page of the same day; `/researcher idea <project folder> [<sketch file>]`, the sketch taken from the file or asked in the first round, the questions and claims written into the section of `<project folder>/README.md` that D29 opens the README with, and each novelty page of a round written to `notes/` as above. Pro: the layout the user ruled, and the argument forms of `paper`. Con: none found.
  - Option (b): the novelty page beside the idea file, or in a run folder `researcher-runs/novelty-<date>/`. Con: D9 puts such material in `notes/`, and a run folder holds a run's state, which `novelty` does not have.
  - Recommendation: (a). Neither option is the cheaper one.

Taken: (a)
Booked: `.scratch/13-researcher/plan.md:119` (Open item G)
Builds on it: step 3
