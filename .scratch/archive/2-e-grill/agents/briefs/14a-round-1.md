# Repair round 1 of step 14a

The review is `.scratch/2-e-grill/agents/reviews/14a-refuter.md`. Items 1 to 11 hold; R1 to R17 are met and R18 is partial. Four findings are sent back, each with its ruling. Work in the same worktree under the same brief, the rules file and the standards; change nothing else. Each text below is written exactly as given, with the indent its place states. Line numbers are those of the worktree now.

1. Standards 1, `skills/grill/SKILL.md:33` and `:34`: `archive_root` is a required key everywhere else (`skills/plan/templates/plan.yaml:9`, `README.md:139`, `check_config.py`), and grill now needs it.
   - Line 33 becomes `   - The required keys are `roadmap`, `ledger_root`, `archive_root`, `rules`, `libraries` and `reviewer`.`
   - Line 34 goes back to its text at the base: `   - The optional keys are `standards` (default `[]`), `adr` (default `docs/adr`), `design_bar` (default `industry`), `design_references` (default `[]`) and `reviewer_effort` (default `high`), and a key left out takes its default.`

2. Standards 2, bullets that join two rules, against `docs/dev/skill-layout.md`, "Lists and tables":
   - Line 91 becomes two lines at five spaces:

     ```
          - A carried ruling that settles part of a decision leaves the rest of that decision open.
          - A decision a carried ruling settles in part quotes the carried ruling beside its options.
     ```

   - Line 94 becomes two lines at five spaces:

     ```
          - A carried ruling that a later ruling names as the one it replaces settles nothing.
          - Of a ruling and the later ruling that names it as the one it replaces, the later ruling is the one carried.
     ```

   - Line 122 becomes three lines at five spaces:

     ```
          - Without such a lookup, the round names the ones found.
          - Without such a lookup, the round says that the list may not be whole.
          - Without such a lookup, the round states no total.
     ```

3. Standards 3, the write stated without its limit:
   - Line 53 becomes `     - A carried ruling is written into the entry's Rulings or rulings file for each decision it settles that the entry's Rulings or rulings file does not already settle ("Steps / Writing what settled" 1).`
   - The term, item 4 below, carries the same limit.

4. Behaviour 1, R18 partial: the bullets of an archived plan's own Rulings seldom name their entry, and since `/plan` removes the rulings file, the archived `plan.md` is the only place the entry's rulings stand.
   - After line 51 (`     - Such a bullet is a carried ruling.`), one line at five spaces:

     ```
          - In an archived `plan.md` that opens with `# Plan: <entry>`, every bullet of a section whose heading begins `## Rulings` and whose first line ends with "(the user)", with or without a full stop after it, is a carried ruling, whether or not it names the entry.
     ```

   - `skills/repo-setup/templates/plan-terms.md`, the **carried ruling** line becomes: `- **carried ruling**: a bullet whose first line ends with "(the user)", of another plan's Rulings or of another rulings file under the ledger root, that names the entry `grill` interviews on, or of the Rulings of an archived plan of that entry; the decisions it settles are not asked again, and each one the entry's Rulings or rulings file does not already settle is written there with its source. Stated in: `grill`, "What it reads" 6, Steps 3 and "Steps / Writing what settled" 1.`
   - `docs/glossary.md`: the same line in the plan-terms block, so the block equals the template.

## Checks

Run from the worktree's root and quote each with its output. You run no git command.

1. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` ends `checks: 10 commands passed`, exit 0.
2. Each new or changed line above is in its file once (`grep -c -F -f` over a scratch file holding the line under `$TMPDIR`), and the base text of line 34 is in the file once.
3. `diff -U2 /Users/axelfaes/workspace/ordo/<file> <file>` for each of the three files shows each new line at its indent and each completion line still last in its item.
4. `LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing.
5. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
6. The walk again, on the changed text, of R4, R11, R13 and R18, each step with the line it follows as `grep -n` prints it; R18 reads every bullet of `.scratch/archive/2-d-the-plan-skills-take-the-comparisons-process-changes/plan.md`'s Rulings sections and says which are carried.

## Report

Append a section "Repair round 1" to `.scratch/2-e-grill/agents/reviews/14a-report.md` in the worktree: per ruling, the change made with its before and after, then each check with its command and output verbatim, then anything not done.
