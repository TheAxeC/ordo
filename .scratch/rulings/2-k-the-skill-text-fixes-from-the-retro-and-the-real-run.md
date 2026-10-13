# Rulings: 2.K The skill-text fixes from the retro and the real run

- D1 no breakage testing (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D2 the character-set check reads only files on disk (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D3 land never settles a clash of two rulings (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D4 land carries out a ruling only on what it names (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D5 a ruling given outside a plan is written down (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D6 a proposal says what exists now (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D7 the builder's prompt says a shortcut is a finding (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D8 roadmap compares the written file with the draft (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D9 a dictated sentence about a script is run first (2026-10-13): (a) the part kept as the entry writes it, in `plan-orchestration` Steps 4, "The prompt", for the builder, and Steps 8, "Dictated text", for the orchestrator, the run quoted in the round's brief (self-rule).
- D10 the reviewer's git commands (2026-10-13): (a) the part kept as the entry writes it, in `refute` Rules, with "What it reads" 5 naming the same three commands (self-rule).
- D11 how a verify command that starts with git reaches a builder (2026-10-13): (a) `spec` Steps 4 writes a verify-list check that starts with git with its file list given as `printf '%s\0' <the files the step changes> |`, the rest as the verify list has it (self-rule).
- D12 a builder's saved report passes the character-set check (2026-10-13): (a) the builder writes its report in the rules file's character set, naming a character outside it such as `<tab>`, and the session checks the saved report and fixes a hit in place by the same naming (self-rule).
- D13 how a step that adds a command to the verification page runs it at its own landing (2026-10-13): (a) `land` Steps 2 compares the verify list with the page as the cherry-pick brings it, read from the step's branch when the range changes the page and from main otherwise, before `land.sh` runs, with no script change; ADR 0010's Consequences sentence is edited as a refinement to "A landing is held to the checks main holds once the step is on it."; the lazy option was (c) (the user).
- D14 a repair round's brief reaches the builder in its worktree (2026-10-13): (a) before a resume the orchestrator copies the round's brief, and a cases ruling, into the worktree's copy of the ledger at the same path and names that path in the message (self-rule).
- D15 a reviewer's saved report passes the character-set check (2026-10-13): (a) the reviewer writes its report in the rules file's character set, naming a character outside it, and the session checks the saved report and fixes a hit in place the same way (self-rule).
- D16 who writes a reviewer's usage line (2026-10-13): (a) `refute` Steps 6 drops the reviewer's usage line, and Steps 7 has the session fill it from the completion notice (self-rule).
- D17 how a closing step runs beside the other steps (2026-10-13): (a) a closing step runs without `/spec` or a dispatch entry, takes no slot, starts only when every other step of its plan has landed, and makes its commits outside any landing (self-rule).
- D18 the builder's git rule (2026-10-13): (a) `plan-orchestration` Steps 4 states the rules file's rule: the builder runs no git command that changes state and reads only with `git status`, `git diff` and `git show` (self-rule).
- D19 the report that holds the NOT DONE items (2026-10-13): (a) the orchestrator's report, after the landed steps and the choices, states anything NOT DONE first, then a DONE / NOT DONE ledger, one row per step landed or stopped, naming the landing report or open item that proves it (self-rule).
- D20 each changed skill's version raised (2026-10-13): (a) the part kept as the entry writes it (self-rule).
- D21 the gate's grep and fresh reviewer (2026-10-13): (a) the gate part kept as the entry writes it (self-rule).
- D22 the gate's land.test.sh case (2026-10-13): (a) the gate part kept as the entry writes it, the case a step that adds a test script and its command to the verification page, whose landing output holds the command's `$ <command>` line (self-rule).
- D23 the gate's deleted-file worktree run (2026-10-13): (a) the gate part kept as the entry writes it (self-rule).
- D24 the gate's version check (2026-10-13): (a) the gate part kept as the entry writes it (self-rule).
- D25 the gate's checks.sh run (2026-10-13): (a) the gate part kept as the entry writes it (self-rule).
- D26 the roadmap diff of entry 2.K (2026-10-13): (a) no change to the entry, since every answer settles how a part of the goal is done and none changes the goal, the gate or what it waits on (self-rule).
- D27 record as ADR? (2026-10-13): (a) no new record, since D13 refines ADR 0010 by an edit in place as the ADR folder's README says for a refinement, and the other decisions are skill text that binds through the skills themselves (self-rule).

## Agents

- a4ab88a3280809e54: grill lookup, claude-opus-5-5
