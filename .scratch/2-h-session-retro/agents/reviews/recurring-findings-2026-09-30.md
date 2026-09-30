# Recurring-findings pass, 2026-09-30

The pass `plan-orchestration` runs at a pause, over the refuter reports written since the last pass (none is recorded in any plan's ledger; the last retro is `.scratch/retros/2026-09-26.md`): the 22 reports of plans 2.E (steps 1 to 12a, with 3s and 3s55), 2.F (1, 2), 2.G (1, 2) and 2.H (1, 2, 3), first runs and runs over repair round 1. The top-level findings were listed with an `awk` over the Spec, Proof, Standards, Behaviour and round headings of each report and read by the orchestrator. A kind is recurring when it appears in three or more steps.

## Recurring kinds

### 1. Text the brief dictates word for word that breaks a standard or is false

- 2.H 3: first run Standards 1 and 2, round 1 findings 1 to 3 (glossary entries and README sentences the brief and the round brief gave word for word), and the builder's two hand-backs (an alphabetical place, a box height).
- 2.F 2: Standards, `skills/land/SKILL.md:93`, "the text the brief dictated for item 3".
- 2.E 10: Standards, `README.md:93`, "the brief's dictated sentence".
- 2.H 1: Spec, the brief's premise "Where a message typed by the user is".
- 2.F 2: Spec, the brief's premise on `gen_figures.py`.
- Steps: 5 in 3 plans. Where the rule is: the prose standard, `docs/dev/skill-layout.md` and the glossary apply to every text; the `spec` skill's brief check (Steps "The brief check" 2) checks names, the step line, premises, cases, the question and implied inputs, and never reads the text a brief gives word for word against the standards.

### 2. The builder's report leaves out or paraphrases evidence the brief asks for verbatim

- 2.E 3s: Proof 3 (a quoted output the command never printed) and Proof 4 (the verify lines not verbatim).
- 2.E 3s55: Spec (the first-run table lists only the code cases).
- 2.E 6: Proof 1 (the runner's lines abbreviated) and Proof 2 (no row for the reading cases).
- 2.E 8: Proof 2 (the ASCII check's line paraphrased, its exit status not captured).
- 2.E 12: Spec 7 (no section of judgment calls) and round Proof 3 (the report still describes the round-0 text).
- 2.E 12a: Proof 1 ("Everything in the brief is done" with an item not done).
- 2.F 2: Spec (the first reading compares one figure of two).
- 2.G 2: Spec (the first run lists C1, C2, C3, C5 and C6 only).
- 2.H 2: round Proof 8 (the round's report leaves out the ASCII command's line).
- Steps: 9 in 4 plans. Where the rule is: `spec`'s `templates/brief.md` "Report" asks for "each case of "Cases" with its result on the unchanged tree" and "the checks above and their output verbatim"; the rule is written where every brief points and is still broken.

### 3. A term used outside the sense the glossary gives it, or a glossary entry the change makes false

- 2.E 1: Standards (a "ruling" outside the glossary's sense).
- 2.E 3: round Standards 2 (**dispatch entry**).
- 2.E 4: Standards 4 and 5, round Standards 1 ("kind").
- 2.E 5: Standards 5 ("case").
- 2.E 7: Standards 2 (**standards**).
- 2.E 9: round finding 1 (a "Stated in" that does not hold the term).
- 2.E 11: Standards (a "Stated in" at a section that does not state the term).
- 2.E 12: Standards 2 and 10, round Standards 1, 2 and 4 (**round, of an interview**, **frontier**, **reference line**).
- 2.F 1: Standards 4 and 5, round Standards 1 (stale "Stated in" places).
- 2.H 3: round finding 1 (**reader, the** makes nine uses of "the reader" false).
- Steps: 11 in 3 plans. Where the rule is: `docs/dev/skill-layout.md`, "Writing for an agent" (a term the glossary defines is used only in that sense; a term used in a sense of its own has an entry); rule 14 of the change standard. Written where the briefs point, and still broken.

### 4. A sentence, bullet or step that breaks the prose standard's form: more than one rule or action, a long sentence, a repeated construction, a binary contrast past the limit

- 2.E 4: Standards 3 and 6, round Standards 2 and 3.
- 2.E 5: Standards 2 and 6.
- 2.E 8: Standards 1.
- 2.E 10: round finding 2.
- 2.E 12: Standards 1, round Standards 7.
- 2.E 12a: round Standards 1 and 2.
- 2.F 1: Standards 2, round Standards 2.
- 2.H 2: Standards 1, round finding 6.
- 2.H 3: Standards 2.
- Steps: 9 in 3 plans. Where the rule is: the prose standard (sections 0, D and E) and `docs/dev/skill-layout.md` "Lists and tables" and "Sections, in order". Written where the briefs point, and still broken.

### 5. A test that stays green with the behaviour it names reverted or mutated

- 2.E 2: Proof (the default `docs/adr` existing as a file: revert R8 leaves the suite green).
- 2.E 3s: Proof 1 and 2 (refused control runs only; no successful pin while the files exist).
- 2.G 1: Proof 1 (the depth case never mixes `${` with `$(`).
- 2.H 1: Proof 1 to 3 (order by time, order of blocks, redaction before the first line: each mutation stays green).
- Steps: 4 in 3 plans. Where the rule is: change-standard rule 13 (each new test fails on the unchanged tree) and `refute`'s Proof heading. A test that fails on the unchanged tree because the whole script is absent passes rule 13 and can still check nothing of the behaviour it names.

### 6. An error path of a script that ends in a traceback, or fails silently

- 2.E 2: Behaviour (a YAML merge key ends in `ConstructorError`).
- 2.G 1: Behaviour 1 (unbounded recursion outside the one error caught).
- 2.H 1: Standards 1 to 3 (`PermissionError` traceback, `BrokenPipeError`, an unreadable folder skipped silently).
- Steps: 3 in 3 plans. Where the rule is: `spec` Steps 4 asks for "the inputs the step's text implies but never states", and `templates/brief.md` "Cases" names them in general terms; none of the three briefs listed an unreadable input or an output closed early.

## Other kinds (below the threshold, no proposal)

- Facts of one repository written into a shipped skill (2.E 9 Standards 1, 2.E 12 Standards 3 and 4): 2 steps, 1 plan.
- A figure or box that contradicts a skill's Stops table (2.E 12a Spec 2 to 5, round Spec 3): 1 step.
- A shell form the script does not read (2.G 1 Behaviour 2, round Spec 1 to 9): 1 step.
- A report claim about a host-visible change that is wrong or missing (2.E 3 Behaviour, 2.E 8 Behaviour 1, 2.E 12 Behaviour 1): 3 steps, 1 plan; recurring by count, and each is the report form of kind 2, so it is counted there.
