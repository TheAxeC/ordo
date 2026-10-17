# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C101

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

# Entry 9 literature

## C72. The four indexes of the goal (2026-10-17)

The goal names "search through Crossref, OpenAlex, Semantic Scholar and arXiv". All four answer without a key: Crossref needs "no signup or registration", OpenAlex allows "basic queries with no key at all" within $0.10 of usage a day, Semantic Scholar shares an unauthenticated pool, and arXiv asks for one request every three seconds.
  - Option (a), recommended: keep the four. Pro: each covers what the others miss (arXiv preprints, Crossref publisher DOIs, OpenAlex and Semantic Scholar references, citing works and open-access links), and coverage rows 209, 212, 213 and 214 take a protocol for each. Con: four clients in the lookup script.
  - Option (b): Semantic Scholar alone. Pro: one client. Con: drops the DOI cross-check against the publisher's record and the arXiv lookups the coverage rows take.
  - Industry: PaperQA2 ships Crossref and Semantic Scholar by default with OpenAlex optional (https://raw.githubusercontent.com/Future-House/paper-qa/main/src/paperqa/clients/__init__.py, `DEFAULT_CLIENTS`); Ai2 Scholar QA and OpenScholar search Semantic Scholar only (https://arxiv.org/html/2504.10861, https://www.nature.com/articles/s41586-025-10072-4).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:53` (D2 The four indexes of the goal)
Builds on it: none

## C73. Source verification in the goal (2026-10-17)

The goal names "source verification". Coverage row 196 takes the verifier: a title-similarity match, a DOI pointing at another title flagged, a fabricated reference removed.
  - Option (a), recommended: keep it. Pro: a plain model fabricates many references (OpenScholar's Table 3: 78.7 percent of GPT-4o's cited papers in computer science do not exist, https://arxiv.org/html/2411.14199), so each cited source is looked up. Con: one lookup per source.
  - Option (b): drop it and rely on the search results. Pro: fewer requests. Con: a reference the writer adds outside the search is never checked.
  - Industry: Ai2 Scholar QA deletes every citation key that matches no extracted quote (https://raw.githubusercontent.com/allenai/ai2-scholarqa-lib/main/api/scholarqa/postprocess/json_output_utils.py); OpenScholar's evaluation checks each cited title against the Semantic Scholar API (Nature article above).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:54` (D3 Source verification in the goal)
Builds on it: none

## C74. Synthesis in the goal (2026-10-17)

The goal names "synthesis". Coverage rows 197 and 231 take the source-by-theme matrix and the explanation of each contradiction.
  - Option (a), recommended: keep it. Pro: a report that integrates sources by theme is what the user needs for a paper's related work. Con: none beyond the work.
  - Option (b): an annotated list of sources. Pro: simpler. Con: the coverage rows that take the matrix go unbuilt, and deep-research's synthesis would win the comparison.
  - Industry: Ai2 Scholar QA clusters quotes into sections before writing (https://arxiv.org/html/2504.10861); STORM writes from an outline (https://raw.githubusercontent.com/stanford-oval/storm/main/README.md).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:55` (D4 Synthesis in the goal)
Builds on it: none

## C75. The `.bib` in the goal (2026-10-17)

The goal names "the `.bib`". The hub's manuscripts cite from a `.bib` beside them (coverage row 158).
  - Option (a), recommended: keep it. Pro: `paper` and LaTeX use the run's sources directly. Con: one BibTeX entry to build per source.
  - Option (b): a reference list in the report only. Pro: no BibTeX. Con: the user copies every entry by hand into the manuscript.
  - Industry: clibib resolves BibTeX through the Zotero Translation Server and reports that only 50.9 percent of entries written by search-enabled frontier models are fully correct (https://arxiv.org/html/2604.03159).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:56` (D5 The `.bib` in the goal)
Builds on it: none

## C76. The gate's check that every cited source resolves (2026-10-17)

The gate says "every source it cites resolves".
  - Option (a), recommended: keep it, for every DOI and every URL the report cites. Pro: a citation that does not resolve is a critical failure in the blind comparison (`docs/dev/blind-comparison.md` item 5). Con: none.
  - Option (b): check DOIs only. Pro: fewer requests. Con: an arXiv or web source that does not resolve passes.
  - Industry: OpenScholar counts a citation fabricated when its title is not in Semantic Scholar (Nature article above); HALLMARK evaluates a DOI-lookup baseline (https://export.arxiv.org/abs/2607.18360).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:57` (D6 The gate's check that every cited source resolves)
Builds on it: none

## C77. The gate's reading of twenty citations drawn at random (2026-10-17)

The gate says "for a sample of twenty citations drawn at random, the cited passage is read and supports the claim it is cited for". Who reads them is a decision for the user (D12).
  - Option (a), recommended: keep it. Pro: a source that exists can still not support its claim; STORM's own measure finds about 15 percent of sentences unsupported by their citations (https://arxiv.org/html/2402.14207), and the resolve check does not see that. Con: twenty full-text readings.
  - Option (b): read only that the source exists. Pro: cheaper. Con: the failure STORM and PaperQA2 measure goes unchecked.
  - Industry: PaperQA2's WikiCrow evaluation counts "cited and unsupported" statements (13.5 percent against 24.9 percent for Wikipedia, https://arxiv.org/html/2409.13740).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:58` (D7 The gate's reading of twenty citations drawn at random)
Builds on it: none

## C78. The gate's check that a source that cannot be accessed is reported (2026-10-17)

The gate says "a source that cannot be accessed is reported, not written around".
  - Option (a), recommended: keep it. Pro: a claim written from a source nobody read is the failure the gate exists to stop. Con: none.
  - Option (b): drop it. Pro: none. Con: the skill could cite from an abstract or memory without saying so.
  - Industry: Ai2 Scholar QA labels text from the model's own knowledge "[LLM MEMORY | 2024]" (https://raw.githubusercontent.com/allenai/ai2-scholarqa-lib/main/api/scholarqa/llms/prompts.py).
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:59` (D8 The gate's check that a source that cannot be accessed is reported)
Builds on it: none

## C79. The gate's blind comparison against deep-research (2026-10-17)

The gate says "a side-by-side run against deep-research on a real topic, compared blind as `docs/dev/blind-comparison.md` says, wins or ties".
  - Option (a), recommended: keep it. Pro: the skill replaces deep-research for the hub, so it must do at least as well on a hub topic. Con: two full runs and two judges.
  - Option (b): drop it. Pro: cheaper. Con: nothing shows the new skill is not worse than the one it replaces.
  - Rule: `docs/dev/blind-comparison.md` items 1 to 7.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:60` (D9 The gate's blind comparison against deep-research)
Builds on it: none

## C80. The gate's coverage records (2026-10-17)

The gate asks for a record per `rebuild: literature` row. `grep -c 'rebuild: literature' docs/academic-coverage.md` counts the rows.
  - Option (a), recommended: keep it. Pro: each source file's behaviour the coverage approved is checked as built. Con: one reading per row.
  - Option (b): one record for the whole skill. Pro: shorter. Con: a row left unbuilt is not seen.
  - Rule: `docs/academic-coverage.md`, its introduction.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:61` (D10 The gate's coverage records)
Builds on it: none

## C81. The agents of a literature run (2026-10-17)

Coverage rows 185 to 197 take the bibliography, verification, synthesis, report, editor and devil's advocate roles of deep-research; rows 186 and 187 make the editor and the devil's advocate drive a two-loop revision.
  - Option (a), recommended: fresh agents in turn: search, verification, one reading agent per source, synthesis and report, then a fresh editor and a fresh devil's advocate, each revision by a fresh writer. Pro: a reviewer that did not write the draft finds what the writer missed (ADR 0013 for `/writing`); a reading agent per source keeps each source's text out of the others' context; clibib measured lower regression when search is separated from revision (0.8 against 4.8 percent, https://arxiv.org/html/2604.03159). Con: more agent runs per report.
  - Option (b): one agent with tools does every stage, as PaperQA2 does. Pro: fewer runs. Con: the agent reviews its own draft, and every source's text shares one context.
  - Option (c): the session does the work inline. Pro: no agent launches. Con: the session's context fills with full texts, and nothing reviews the draft fresh.
  - Industry: PaperQA2 runs one agent over its tools (https://arxiv.org/html/2409.13740); Ai2 Scholar QA reads "each paper's content independently" before writing (https://arxiv.org/html/2504.10861); none of the four systems found has a separate critic.
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:62` (D14 The agents of a literature run)
Builds on it: none

## C83. A source that cannot be accessed, and a reference that cannot be confirmed (2026-10-17)

The gate wants such a source "reported, not written around"; coverage row 196 sends an unconfirmed reference to the user and row 184 keeps unconfirmed references out. A stop that asks the user mid-run is judged in the blind comparison on what was produced (`docs/dev/blind-comparison.md` item 1).
  - Option (a), recommended: cite neither; list each in the report's sections "Sources not accessed" (with every URL tried and what it returned) and "References not confirmed" (with the lookups made); a claim that needed one becomes a marked gap; no stop. Pro: the user gets every one in the report, and the run finishes. Con: the report has two more sections.
  - Option (b): stop and ask the user about each. Pro: the user can supply a PDF. Con: the run stops, and in the comparison the missing parts count as critical failures.
  - Industry: Ai2 Scholar QA removes a citation it cannot match and logs it (json_output_utils.py, above).
  - Recommendation: (a). The lazy option is none, since both do the work; (b) costs a stop.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:64` (D16 A source that cannot be accessed, and a reference that cannot be confirmed)
Builds on it: none

## C84. The report's form (2026-10-17)

The report goes to the user and to `paper`, whose manuscripts are LaTeX with a `.bib`.
  - Option (a), recommended: Markdown with Pandoc citation keys `[@key, <locator>]` matching the `.bib`, the lit-review sections, a method section with the criteria and searches. Pro: readable as it stands, and each key goes into `\cite` unchanged. Con: none.
  - Option (b): LaTeX. Pro: drops into a manuscript. Con: harder to read as a report, and most of it is not manuscript text.
  - Option (c): Markdown with numbered references. Pro: familiar. Con: the numbers do not match the `.bib` keys.
  - Industry: PaperQA2 cites keys of the form "(Qian2011Neural pages 1-2)" (README above).
  - Recommendation: (a). The lazy option is (c).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:65` (D17 The report's form)
Builds on it: none

## C86. A stop for the user before searching (2026-10-17)

deep-research's full mode makes phase 1 interactive (`research-hub/.claude/skills/deep-research/SKILL.md:140`). Coverage row 59 runs searches "under preset criteria".
  - Option (a), recommended: no stop; the criteria and searches are written into the method section before the first search. Pro: the criteria are fixed before results are seen, which row 59 asks, and the run finishes for the comparison. Con: the user cannot correct the criteria before the search.
  - Option (b): stop for the user's approval of the criteria. Pro: the user steers. Con: in the blind comparison the run stops and is judged on nothing.
  - Rule: `docs/dev/blind-comparison.md` item 1.
  - Recommendation: (a). The lazy option is none; (b) costs the comparison.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:67` (D19 A stop for the user before searching)
Builds on it: none

## C87. The prose check of the report (2026-10-17)

Coverage row 184 sends the writing check to `writing`; entry 3's ruling D30 says the skill that owns the text writes the fix, and `/writing` applies nothing.
  - Option (a), recommended: invoke `/writing` on the report after the revision, show its findings, apply the picked ones on `apply <numbers>` with a fresh writer agent. Pro: the report meets the prose standard ADR 0002 holds for writing skills. Con: one more review per run.
  - Option (b): the writer follows the prose standard, with no `/writing` run. Pro: cheaper. Con: nothing checks the prose.
  - Rule: ADR 0002; coverage row 184.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:68` (D20 The prose check of the report)
Builds on it: none

## C88. Where a run writes (2026-10-17)

A run produces a report, a `.bib` and a record of what was fetched. The user wants no backups.
  - Option (a), recommended: a folder the call names, by default `literature/<topic slug>/`, with `report.md`, `references.bib` and `sources.md`; full texts in a temporary folder removed at the end. Pro: the record shows what was read and when, and no copy of a paper stays on disk. Con: a later reader fetches a source again.
  - Option (b): keep the full texts in the folder. Pro: the gate's reader has them. Con: copies of papers in the repository.
  - Industry: PaperQA2 caches parsed PDFs in an index (README above).
  - Recommendation: (a). The lazy option is none; both cost the same.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:69` (D21 Where a run writes)
Builds on it: none

## C89. The optional second-model critique (2026-10-17)

Coverage row 186 keeps "the optional second-model critique, sent only with the user's consent". deep-research reads `ARS_CROSS_MODEL` and points at `shared/cross_model_verification.md`, which `find research-hub/.claude/skills -name cross_model_verification.md` does not find. `codex` is installed on this machine (`which codex`).
  - Option (a), recommended: `LITERATURE_SECOND_MODEL` names a command; the skill asks at the start of the run, naming the command and the material, and sends the report without the devil's advocate's findings only on a yes. Pro: any CLI the user has works, and the question comes before the work, so an unset variable means no stop. Con: one environment variable.
  - Option (b): a fixed provider's HTTP API with its key. Pro: no CLI needed. Con: a key and a client in the skill for one provider.
  - Rule: coverage row 186.
  - Recommendation: (a). The lazy option is to leave the critique out, which row 186 does not allow.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:70` (D22 The optional second-model critique)
Builds on it: none

## C91. Record the agents of a literature run as an ADR (2026-10-17)

D14 is not obvious from the code, binds `paper` and `paper-review`, which reuse the roles, and has alternatives rejected.
  - Option (a), recommended: record it, status proposed. Pro: the reason for fresh agents stays with the decision. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: a later plan can merge the agents without seeing why they were split.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:72` (D25 Record the agents of a literature run (D14) as an ADR)
Builds on it: the record `docs/adr/0015-a-literature-run-is-done-by-fresh-agents-in-turn-and-reviewed-by-a-fresh-editor-and-devil-s-advocate.md`

## C92. Record the tie between a citation and its source as an ADR (2026-10-17)

D15 binds `paper`, which cites through the same lookups (D1), and rejects WebFetch and abstracts.
  - Option (a), recommended: record it, status proposed. Pro: a later skill does not fall back to WebFetch without seeing why. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: the reason is lost when the plan is archived.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:73` (D26 Record the tie between a citation and its source (D15) as an ADR)
Builds on it: the record `docs/adr/0016-a-cited-claim-rests-on-a-verbatim-passage-read-from-the-source-in-the-same-run.md`

## C93. The roadmap diff of entry 9 (2026-10-17)

The user ruled D12: a fresh reviewer agent reads the twenty sampled citations and the user reads its table. The gate says only "the cited passage is read". Asked of the changed gate, "could this pass without the goal being reached?": no, since each of the twenty rows quotes the passage as it stands in the source, and a report without supported citations fails it; "is this checked once, on the finished work?": yes, on the report of the gate's run.
  - Option (a), recommended: the sample clause reads "for a sample of twenty citations drawn at random, a fresh reviewer agent reads each cited passage in its source and finds that it supports the claim it is cited for, in a table the user reads". Pro: the gate `/plan` copies says who reads, as the change standard asks a ruling to settle for the entry. Con: a longer gate.
  - Option (b): no change, the ruling D12 alone. Pro: the entry stays as it is. Con: a reader of the roadmap takes the reading to be the user's.
  - Rule: the `roadmap` skill's Rules (the entry states the goal, the gate and the dependencies); `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read".
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:76` (D28 The roadmap diff of entry 9)
Builds on it: the roadmap diff of entry 9

## C94. Record the lookup script as an ADR (2026-10-17)

The user ruled D11. The decision binds `paper`, which reuses the lookups (D1), and rejects the agents' own lookups that deep-research uses.
  - Option (a), recommended: record it, status proposed. Pro: a later plan does not move the lookups back into agents' text without seeing why. Con: one file.
  - Option (b): the ruling only. Pro: shorter. Con: the reason is lost from view once the rulings file is used.
  - Rule: `docs/adr/README.md`, first paragraph.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:77` (D29 Record the lookup script (D11) as an ADR)
Builds on it: the record `docs/adr/0017-one-standard-library-script-makes-every-reference-lookup-of-the-literature-skill.md`

## C96. The model and effort of a literature run's agents (2026-10-17)

The user ruled that `code-comments`' rewrite agent runs on `reviewer` at `reviewer_effort`, in place of the recommended `worker` (E2, `.scratch/archive/4-code-comments/plan.md:67`). `.agents/plan.yaml:10` lists who runs on `reviewer`, and `agents/ordo-high.md:3` lists the work its agents are launched for.
  - Option (a), recommended: every agent of a run on `reviewer` at `reviewer_effort`, the comments and descriptions naming the literature agents, no value changed. Pro: the report's reading and synthesis get the model the user picked for writing work, and one rule covers every agent. Con: a run with many sources costs more than on `worker`.
  - Option (b): the search and reading agents on `worker`, the synthesis, editor and devil's advocate on `reviewer`. Pro: cheaper reading. Con: the passages every claim rests on are extracted by the weaker model, against the user's choice in E2.
  - Option (c): every agent on `worker`. Pro: cheapest. Con: the same, for the whole report.
  - Industry: PaperQA2 maps one model across every chunk for its evidence step (https://arxiv.org/html/2409.13740); none of the four systems fetched names a per-stage model split.
  - Recommendation: (a). The lazy option is none, since each option costs the same to build; (c) costs least to run.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:80` (D31 The model and effort of a literature run's agents)
Builds on it: none

## C97. The gate's topic and mode, replacing D23 (2026-10-17)

D23 compared the full report against deep-research's `lit-review` mode, which runs bibliography, verification and synthesis only, with no editor or devil's advocate (deep-research's "Operational Modes" table). The report D14 rules matches deep-research's `full` mode, whose phase 1 is interactive (`deep-research/SKILL.md:140`); a side that stops to ask is judged on what it produced (`docs/dev/blind-comparison.md` item 1).
  - Option (a), recommended: `/literature <topic>` with `--bib research-hub/projects/active/linfoot-estimator/manuscript/main.bib` against deep-research's `full` mode on the same input. Pro: the two sides run the same stages, so the comparison measures the skill and not the mode. Con: deep-research's `full` run is the longer one.
  - Option (b): keep D23, the full report against `lit-review`. Pro: a shorter old side. Con: the new side would win on stages the old side never ran, which shows nothing.
  - Rule: `docs/dev/blind-comparison.md` item 1.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:81` (D32 The gate's topic and mode, replacing D23)
Builds on it: none

## C98. The roadmap diff of entry 9 for D30 to D32 (2026-10-17)

The gate names "a side-by-side run against deep-research on a real topic"; D30 to D32 change the skill's calls, its agents' model and the mode of that run.
  - Option (a), recommended: no change to the entry. Pro: the entry states the goal, the gate and the dependencies, and the mode and topic are rulings `/plan` copies. Con: none.
  - Option (b): name the topic and the mode in the gate. Pro: the roadmap shows them. Con: a run's detail in the entry, which the `roadmap` skill's Rules keep to the goal, the gate and the dependencies.
  - Rule: the `roadmap` skill's Rules.
  - Recommendation: (a). The lazy option is none; (a) does the work the rules ask.

Taken: (a)
Booked: `.scratch/9-literature/plan.md:82` (D33 The roadmap diff of entry 9 for D30 to D32)
Builds on it: none

## C99. The step list of plan 9 as drafted (2026-10-17)

`/plan 9 --self-rule` drafted three steps: step 1, the skill, its lookup script with the script's test, its wiring and the coverage records, with the gate's coverage check as part of its check; step 2, the gate run, which needs step 1 landed, tagged and pinned and is run by the orchestrator with the user's reading of the table; step 3, the closing. The script and the skill are one step, since both contents are known in advance from D11 and D30 and the skill only names the script's commands. Every answer of "## Gate" is no, no design decision is left unsettled after the two `/grill 9 --self-rule` runs, and no line of the rulings file was left to place.
  - Option (a), recommended: open the plan with the list as drafted. Pro: the plan opens and step 1 can be prepared at once; one builder writes the skill and the script together, so the commands the skill names are the ones the script has. Con: one large step for one builder and one review.
  - Option (b): keep the draft for the user. Pro: the user sees the list before the plan opens. Con: the plan does not open, and nothing in the written rules needs the user's call here.
  - Rule: the `plan` skill's Steps 2 and 3.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:83` (Open item A)
Builds on it: step 1, step 2, step 3

## C101. The `projects:` form of `.agents/plan.yaml` in the literature skill (2026-10-18)

The builder of step 1 refused the `projects:` form of `.agents/plan.yaml` (its report, judgment call 12), reading a project name as part of the topic. research-hub's `.agents/plan.yaml` has that form, with the one project `oculus`, so the gate run of step 2 stops there at "No plan configuration", and Steps 17 hands `/writing` no project, which `/writing` refuses as "Unknown project". The reviewer (`.scratch/9-literature/agents/reviews/1-refuter.md`, Spec, the first finding) found it; D30 gives the three call forms and says nothing on the form.
  - Option (a), recommended: in the `projects:` form the first argument of the call names the project whose keys are read, before the mode and the topic, as `/writing` and `/code-comments` read it; a name no project has is the refusal "Unknown project", which lists the projects; Steps 17 passes the project to `/writing`. Pro: the skill runs in research-hub, and the call reads as every other Ordo skill's call does in that form. Con: one more argument in that form.
  - Option (b): keep the refusal, and run the gate in ordo with an absolute `--bib` and an `--out` outside research-hub. Pro: no change to the call forms. Con: the skill cannot run in the repository it is for.
  - Rule: `skills/writing/SKILL.md` and `skills/code-comments/SKILL.md`, "What it reads" 1.
  - Recommendation: (a). The lazy option is (b).

Taken: (a)
Booked: `.scratch/9-literature/plan.md:97` (The `projects:` form in `/literature`)
Builds on it: step 1, step 2
