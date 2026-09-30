# Step 14a refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14a, base 16c5f3702eabb6a35bd6a182ef2e94c595563d81)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (from the worktree root)
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 10 commands passed
rc=0

Brief verify 2 (each '>' line of `diff <main file> <file>` as the one line of a scratch file, `grep -c -F -f`):
skills/grill/SKILL.md: 34 new or changed lines, 0 not equal to 1
skills/repo-setup/templates/plan-terms.md: 2 new or changed lines, 0 not equal to 1
docs/glossary.md: 2 new or changed lines, 0 not equal to 1
(the main checkout's three files equal the base: `git diff --stat <base> HEAD` lists only .scratch/2-e-grill/orchestrator-state.md)

Brief verify 3 (leading spaces of the 34 new or changed lines of skills/grill/SKILL.md, in order):
2 3 0 3 5 5 5 3 5 5 5 5 5 5 5 5 3 5 5 5 5 5 3 3 5 5 3 6 3 5 5 0 2 2
Completion lines still last in their items: SKILL.md:108 (Steps 3), :123 (Steps 5), :131 (Steps 6), :156 (Steps 10), :216 ("Steps / Writing what settled" 1), read with the Read tool.

Brief verify 4:
$ LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md   -> no output, rc1=1
$ LC_ALL=C grep -n '[^ -~]' docs/glossary.md   -> no output, rc2=1
$ LC_ALL=C grep -c '[^ -~]' /Users/axelfaes/workspace/ordo/docs/glossary.md   -> 0

Brief verify 5: `ok: the plan-terms block equals the template` (in the checks.sh run above).

Brief verify 6: the walk of R1 to R18 is under "Verdicts".

Commands the builder's report quotes, rerun:
$ git diff --numstat <base>   -> 2 1 docs/glossary.md / 34 5 skills/grill/SKILL.md / 2 1 skills/repo-setup/templates/plan-terms.md
$ wc -l (worktree, then main)  -> SKILL.md 306 / 277; plan-terms.md 120 / 119; glossary.md 137 / 136
$ grep -n 'Entry 3 and step 13' .scratch/2-e-grill/plan.md   -> 127:
$ grep -n ... plan-drafts-3-the-writing-base.md   -> 28: "- D2, entry 4 (`code-comments`), ..." (option (a) holds the clause); 33: "- D2 (a): entry 4 is redrafted after entry 3 is approved."
$ sed -n 77p .scratch/2-e-grill/plan.md   -> "## Rulings (2026-09-29)"; line 79 opens "- A: the ADR test is "a record per decision ..."
$ grep -n D5/D11 .scratch/rulings/3-the-writing-base.md   -> 7: D5, 13: "D11 ... replacing D5"
$ grep -n -A3 '^## 2.I' docs/roadmap.md; sed -n 53p   -> the gate with five checks after its colon
$ grep -n archive_root skills/ordo-init/templates/check_config.py   -> no output (reproduced; see Proof 1 for what it leaves out)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. SKILL.md:34, :47 and :50 to :53 are the dictated text, each line once (verify 2), at 3 and 5 spaces (verify 3). The item's text is itself the subject of Standards 1 (`archive_root` optional) and Standards 3 (line 53 unqualified), and its change to line 47 causes Behaviour 1 (R18).
- 2: holds. SKILL.md:89 to :103 follow line 88, and :105 is the changed line 86, all exact. Lines 91 and 94 join two rules each (Standards 2).
- 3: holds. SKILL.md:120 to :122 stand before the completion line :123. Line 122 joins three requirements (Standards 2).
- 4: holds, SKILL.md:128 at three spaces after the answer form (:127).
- 5: holds, SKILL.md:146 at six spaces under :145.
- 6: holds. SKILL.md:212 to :214 follow :211, and :212 holds the double-backtick code span as dictated. A double quote inside the quoted words leaves the bullet readable. `/plan` copies bullet lines as they stand, `/spec` reads the "(the user)" ending, and no skill parses the quotes, so I report no finding.
- 7: holds, SKILL.md:280 cell "The frontier as decisions in the decision form, the answer form, and in the first round the decisions carried rulings settle".
- 8: holds, SKILL.md:303 and :305 at two spaces under :302 and :304.
- 9: holds. plan-terms.md:14 **carried ruling** stands between **capability map** and **case** (alphabetical), and :29 **design tree** is as dictated. Standards 3 applies to the term's unqualified "it is written into".
- 10: holds. glossary.md:19 and :34 match, and sync_rules prints ok.
- 11: holds, SKILL.md:5 `version: "1.1.0"`.

Cases of the brief's "Cases" (walked on the changed text, line numbers as `grep -n` prints them in the worktree):

- R1: met. At 833e2e8, `ledger-files.txt` shows no `# Plan: 3` folder and no rulings file, so :47 reads nothing. By :50 the 2.E plan's `## Rulings (2026-09-29)` is read. The bullet at input :125 names "roadmap entry 3", and its first line ends "(the user).", so by :51 it is a carried ruling. By :52 and :89 the counting-script and entry-4 decisions are settled and not asked. By :90 and :128 round 1 lists them unnumbered, after the answer form, quoted, with `path:line`. By :212, :208 and :305 the two carried bullets go to `.scratch/rulings/3-the-writing-base.md` at the first write of Steps 8.
- R2: met. By :98 to :101 there is one decision per part of the goal (input roadmap :59). The plural "the checks for non-ASCII, dash asides, history words and word counts per section" reads as four things delivered, which gives seven goal decisions. The gate (:60) gives one decision per thing checked. :99 quotes each part, and Steps 4 asks each once its prerequisites are settled.
- R3: met. By :50 only a first line ending "(the user)" is read. The real near-miss bullets `.scratch/2-f-diagnose/plan.md:38`, :39, :40, :42 and :44 end otherwise (awk of their endings). Only :88, :89 and ADRs settle a decision, so nothing from such a bullet is settled.
- R4: met. The 2.C bullet "The review of Ordo" names "roadmap entry 3" and ends "(the user).", so it is carried and read. It settles no decision of the tree, and :212 gives "one bullet for each decision it settles", which is none. Line :53 and the glossary term state the write without that limit (Standards 3).
- R5: met. By :95 two carried rulings that contradict each other, neither naming the other, are a rule clash. "An answer that contradicts" 1 and 2 show it as a decision with its options, and Steps 4 and 6 put it in round 1.
- R6: met. The carried ruling settles D2 whole (input :125, "D2 (a), entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only"), so D2 has no options or recommendation. :92 limits what a round says the ruling states to its quoted words. :93 bars the redraft's :33 wording ("D2 (a): entry 4 is redrafted after entry 3 is approved.") from being shown as the ruling. The brief's premise is partly wrong: the redraft's :28 option (a) holds the clause, and only :33 lacks it. The case result does not depend on this.
- R7: met. An entry under "Not yet specified" has a goal (:98, :100). :101 applies only to an entry with a gate, and :102 gives the what-must-be-known parts.
- R8: met, by :98 to :101. :85 still lists the decisions the goal and gate need, so the design's new parts are decisions as before.
- R9: met. By :120 to :122, a two-passage lookup gives the places found, a note that the list may not be whole, and no total. A whole lookup gives the count with the list beside it.
- R10: met. :47 takes the open plan outside `archive_root`, :49 takes its Rulings, and :208 and :212 write carried bullets there.
- R11: met. By :50 the other rulings files are read. A bullet naming the entry only as a dependency is judged by reading (:52) to settle nothing, and :212 writes none. Standards 3 applies here as for R4.
- R12: met. `ok: the plan-terms block equals the template`.
- R13: met. On main, :47 reads `.scratch/rulings/3-the-writing-base.md`, whose D1 (file :3) and D2 (file :4) settle both decisions by :88. The carried ruling at `.scratch/2-e-grill/plan.md:127` is not written again (:96 and :97). A restart draws the tree afresh (:105), and :96 covers "a bullet carried in an earlier session". The brief gives :126, which is not the line at the base (Spec 1).
- R14: met. :94 applies: D11 (file :13) names D5 (file :7) as replaced, so D5 settles nothing and D11 is the one carried.
- R15: met. By :95 this is a rule clash in round 1.
- R16: met. :101 "a part being each thing the gate checks" applied to `docs/roadmap.md:53` gives the five checks after its colon.
- R17: met. By :213, the "A:" to "O6" bullets (`plan.md:79` onward, which end "(the user)") take `2026-09-29` from `## Rulings (2026-09-29)` (:77).
- R18: partial. By :47, `.scratch/archive/2-d-.../plan.md` ("# Plan: 2.D The plan skills take the comparison's process changes") is not the open plan, and answers go to the rulings file. The rest of the expected result, "its Rulings are read as carried rulings", is reached for one bullet of eight. Behaviour 1 has the details.

## 1. Spec

- Brief, "What is on the tree" and R13: "(now `.scratch/2-e-grill/plan.md:126`)". What is wrong: `git show 16c5f37:.scratch/2-e-grill/plan.md | grep -n 'Entry 3 and step 13'` prints `127:`, and so does the main checkout. At e18de58 it printed `125:`. No changed file cites the line, and the builder's walk used 127. Failure scenario: a reader of the brief who checks R13 against `:126` finds a different bullet. No verdict rests on it.

## 2. Proof

- Builder's report, "In the brief, with the evidence": "`skills/ordo-init/templates/check_config.py` has no mention of it (`grep -n archive_root` printed nothing)". What is wrong: the grep reproduces, but the sentence implies that the configuration check does not require the key. `check_config.py` takes its required keys from `skills/plan/templates/plan.yaml` (`example_keys()`, the regex on "# required."). Line 9 of that file reads "archive_root: .agents/... # required.": "archive_root: .scratch/archive            # required. Where a closed plan's folder moves." A scratch repository whose `.agents/plan.yaml` lacks `archive_root` gets `error: required key missing: archive_root`, rc=1 (run in the scratchpad). The orchestrator's ruling on Standards 1 rests on this. Failure scenario: the orchestrator reads the check as silent on the key and keeps grill's "optional" wording, which disagrees with the check that `/ordo-init` runs.

## 3. Standards

- `skills/grill/SKILL.md:34`: "`reviewer_effort` (default `high`) and `archive_root` (default none, which leaves no folder out), and a key left out takes its default."
  - What is wrong: `archive_root` is a required key everywhere else, so this breaks the change standard, rules 14 and 19. `skills/plan/templates/plan.yaml:9` marks it "# required.", and `README.md:139` says "Nine are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker`, `reviewer` and `libraries`. A skill that needs a missing required key stops and names it." `check_config.py` errors without it (Proof 1), and `/roadmap`, `/plan-retro` and `/session-retro` read it as `/plan` states it, as required.
  - grill now needs the key, but gives it a default that no valid configuration can reach, so README.md:139's second sentence becomes false for grill.
  - The brief asked for this (decision 5). The choice is the orchestrator's.
  - Fix at landing: move `archive_root` into :33's required keys and drop it from :34. Keeping it optional is the lazy option, since it leaves two statements that contradict each other.
  - Failure scenario: a reader of README.md expects `/grill` to refuse a configuration without `archive_root`. Instead it runs, "leaves no folder out", and takes an archived plan of the entry as the open plan, writing answers into it: the defect :47 was changed to end.
- `skills/grill/SKILL.md:91`, :94 and :122: "A carried ruling that settles part of a decision leaves the rest of that decision open, and the decision quotes the carried ruling beside its options.", "... settles nothing, and the later ruling is the one carried.", "Without such a lookup, the round names the ones found, says that the list may not be whole, and states no total."
  - What is wrong: each bullet joins requirements that can each be broken while the others hold. This breaks `docs/dev/skill-layout.md`, "Lists and tables", "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets".
  - The brief's Closed 10 says items 1 to 3 give one rule per bullet. These three do not.
  - The text is dictated, so the fix is the orchestrator's at landing: split each into sub-bullets.
  - Failure scenario: a round states "three places" after naming the places found and noting the list may be partial. A reviewer checking line 122 as one rule marks it followed on its first two clauses.
- `skills/grill/SKILL.md:53`: "A carried ruling is written into the entry's Rulings or rulings file ("Steps / Writing what settled" 1)." The same holds for the term in `plan-terms.md:14` and `docs/glossary.md:19`: "... and it is written into the entry's Rulings or rulings file with its source."
  - What is wrong: :51 makes every bullet that names the entry and ends "(the user)" a carried ruling, including ones that settle nothing. The limits of the write are elsewhere: :212's "one bullet for each decision it settles" and :96's "is not written again".
  - This breaks `docs/dev/skill-layout.md`, "Lists and tables" ("a qualifier that changes the rule ... stays in the same bullet as the rule"), and rule 19 of the change standard. Line :53 and :96 state opposite things for R13's input.
  - Failure scenario: `/grill 3` on main reads `.scratch/archive/2-b-.../plan.md:98`, "The way back on track is option C: ... then entry 3; no restart (the user).". That bullet is a carried ruling that settles nothing. A session that follows :53 and the glossary term invents a decision phrase to fill the :212 form, and writes a D25 into `.scratch/rulings/3-the-writing-base.md`.
  - Fix at landing: qualify :53 and the term, for example "A carried ruling is written ... for each decision it settles that the entry's Rulings or rulings file does not already settle".
  - Verdict: R4, R11 and R13 are met by reading :212 and :96, and this finding is the risk to them.

## 4. Behaviour

- `skills/grill/SKILL.md:47`: "... when a folder under `<ledger_root>/`, outside the folder `archive_root` names, holds a `plan.md` ...", with :50: "... is read for the bullets that name the entry by its number or its title ...".
  - What changes for the user: for an entry whose plan is archived, the entry's own rulings are no longer read.
  - `/plan` removes the rulings file when it opens the plan (`skills/plan/SKILL.md:111`, and the glossary's **rulings file**: "`/plan` copies its bullet lines into the new plan's Rulings and removes it"). After the closing, the entry's rulings live only in the archived `plan.md`.
  - The bullets of a plan's own Rulings seldom name their entry. Of the eight bullets under `## Rulings (2026-09-29)` of `.scratch/archive/2-d-.../plan.md`, only :39 contains "2.D" ("the protocol of 2.D"), and it is about other entries' gates. Lines 35 to 38 and 40 to 42 name no entry.
  - Before the change, :47 took that plan as the open plan and read all eight. Now none of the other seven is read as the entry's Rulings or as a carried ruling.
  - The builder's report states the before and after only as "An archived plan whose heading names the entry is no longer taken as the open plan", with nothing on the rulings no longer read.
  - Failure scenario: `/grill 2.D` asks again "Open item A", "B", "C", "E", "F" and the step-list decisions, which the user ruled in that plan. This is the first fault the step exists to end.
  - The fix needs the orchestrator's text, which is why it is not a landing fix. One option is a sub-bullet under :50: every bullet ending "(the user)" of an archived `plan.md` that opens with `# Plan: <entry>` is a carried ruling whether or not it names the entry.
  - Verdict: R18 partial.

## Declined to judge

- Whether the per-part decisions on an entry's existing goal should be design decisions with a design-bar reference line (:103, brief decision 7), rather than "Rule:" decisions about the repository's own page. That is the brief's decision, and the step 14 rerun and the user's reading will show whether it reads well.
- Whether quoting only "the words of the carried ruling that settle it" (:212), rather than the whole bullet, meets the ruling's "quotes each one exactly as written". The words quoted are exact and the `path:line` locates the whole bullet. The reading of the ruling is the orchestrator's.
- Whether the step 14 rerun passes. That is step 14's, and it is outside this brief.
- A carried ruling with no date anywhere (the builder's note). No input exists on the tree: all 23 bullets of `.scratch/rulings/3-the-writing-base.md` carry a date, and every `## Rulings` heading under `.scratch` does. grill's own form at :209 writes a date, so I report no finding.

Reviewer usage: tokens not visible from inside the agent (from the completion notice), about 35 tool uses, minutes not visible.
