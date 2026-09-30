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

## Repair round 1, refuted

Reviewer: a fresh `ordo-high` agent that changed nothing. Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14a`, base `16c5f3702eabb6a35bd6a182ef2e94c595563d81`.

**How the delta was read.** I diffed `git diff <base>` against `.scratch/2-e-grill/agents/reviews/14a-round-0.diff`. The round changed these places and nothing else:
- `skills/grill/SKILL.md`: lines 33 and 34, 52, 54, 92 and 93, 96 and 97, and 125 to 127.
- The **carried ruling** line in `skills/repo-setup/templates/plan-terms.md:14` and `docs/glossary.md:19`.

`git status --short` shows the three changed files and `?? .scratch/2-e-grill/agents/reviews/14a-report.md`, nothing else.

**One command outside the brief's git limit.** I ran `git diff --stat <base> -- skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` once from the main checkout, not from inside the worktree. It prints nothing, which shows main's copies equal the base. Check 3 compares against those copies. The command is read-only.

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
rc=0

Round check 2 (each dictated line, extracted from 14a-round-1.md into a scratch file, `grep -c -F -x -f`):
l00 skills/grill/SKILL.md 1   "   - The required keys are `roadmap`, `ledger_root`, `archive_root`, ..."
l01 skills/grill/SKILL.md 1   "   - The optional keys are ... (base text of line 34)"
l02 skills/grill/SKILL.md 1   "     - A carried ruling is written into the entry's Rulings or rulings file for each decision ..."
l03 skills/repo-setup/templates/plan-terms.md 1 ; docs/glossary.md 1   "- **carried ruling**: a bullet whose first line ends with ..."
l04 to l10 skills/grill/SKILL.md 1 each   (the seven split lines)
l11 skills/grill/SKILL.md 1   "     - In an archived `plan.md` that opens with `# Plan: <entry>`, ..."
$ diff <(sed -n 34p <main>/skills/grill/SKILL.md) <(sed -n 34p skills/grill/SKILL.md)   -> no output, rc=0

Brief verify 2 over the whole diff (each '+' line of `git diff <base> -- <file>`, whole-line count):
skills/grill/SKILL.md: 39 added lines, 0 not equal to 1
skills/repo-setup/templates/plan-terms.md: 2 added lines, 0 not equal to 1
docs/glossary.md: 2 added lines, 0 not equal to 1

Round check 3: `diff -U2 /Users/axelfaes/workspace/ordo/<file> <file>` for the three files shows lines 33 and 34 at three spaces, the new lines 52, 54, 92, 93, 96, 97 and 125 to 127 at five, and no completion line moved.
$ grep -n 'The step is done when\|The item is done when' skills/grill/SKILL.md (lines 80 to 222)
81 84 111 115 128 136 143 146 148 161 167 169 174 177 179 184 186 189 194 199 204 206 208 221

Round check 4:
$ LC_ALL=C grep -n '[^ -~]' skills/grill/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
(no output) rc=1

Round check 5:
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template

Commands the round's report section quotes, rerun:
$ grep -n 'Entry 3 and step 13' .scratch/2-e-grill/plan.md   (main checkout)
127:- Entry 3 and step 13 (2026-09-30): ...
$ sed -n 7p .agents/plan.yaml
archive_root: .scratch/archive            # Where a closed plan's folder moves.
$ grep -n '^## ' .scratch/archive/2-d-the-plan-skills-take-the-comparisons-process-changes/plan.md
5: ## Goal / 9: ## Gate / 13: ## Steps, in execution order / 26: ## Could run in parallel / 33: ## Rulings (2026-09-29) / 44: ## Blocked, and by what
$ awk over that Rulings section (ending "(the user)", naming "2.D")
35 yes no / 36 yes no / 37 yes no / 38 yes no / 39 yes yes / 40 yes no / 41 yes no / 42 yes no

Greps for sentences the round makes false:
$ grep -rn 'archive_root' README.md docs skills utils
  README.md:139 lists it among the nine required keys. skills/plan/templates/plan.yaml:9 says "# required.".
  plan.projects.yaml:11 and :35 give it per project.
  roadmap:35, plan-retro:29 and session-retro:30 read it. grill:33 now agrees with all of them.
$ grep -rn -i 'carried ruling\|carried from' README.md docs skills
  Hits only in skills/grill/SKILL.md and the two copies of the term.
$ grep -rn 'archived plan\|archived `plan.md`\|an archived' README.md docs skills   (grill excluded)
  Hits only in the term and docs/roadmap.md:32 and :227, which are unrelated.
Read in full with nothing made false: README.md:16 (the grill row), and glossary lines 98 (**ruling**) and 99 (**rulings file**).
```

### Verdicts

**Items of the brief's "What to build", over the whole diff:**
- **1: holds, as the round's ruling 1 amends it.**
  - `SKILL.md:33` makes `archive_root` required, and `:34` is the base text again (diff rc=0).
  - `:47` excludes the folder `archive_root` names.
  - `:50` to `:54` are the dictated lines, each once.
- **2: holds, as ruling 2 amends it.** `:90` to `:106` and the changed `:108`. The split lines are `:92`/`:93` and `:96`/`:97`.
- **3: holds, as ruling 2 amends it.** `:123` to `:127` stand before the completion line `:128`.
- **4: holds.** `:133`, at three spaces after the answer form.
- **5: holds.** `:151`, at six spaces.
- **6: holds.** `:217` to `:219`. Standards 5 below concerns the missing limit at `:217`.
- **7: holds.** The `:285` cell.
- **8: holds.** `:308` and `:310`.
- **9: holds, as ruling 4 amends it.** `plan-terms.md:14` (**carried ruling**) and `:29` (**design tree**).
- **10: holds.** `glossary.md:19` and `:34`, and sync_rules prints ok.
- **11: holds.** `SKILL.md:5` reads `version: "1.1.0"`.

**Cases.** Line numbers are those of the changed `SKILL.md`.
- **R1: met.** At 833e2e8, `ledger-files.txt` has no plan or rulings file of entry 3, and no archived `plan.md` opens with `# Plan: 3`, so `:52` does not apply. By `:50`/`:51`, input `:125` is a carried ruling. By `:90`, `:91` and `:133`, round 1 lists its two decisions as settled and quoted. By `:213` and `:217`, they are written to `.scratch/rulings/3-the-writing-base.md`.
- **R2: met.** `:101` to `:104`.
- **R3: met.** Both `:50` and `:52` require a first line that ends "(the user)".
- **R4: met.** The input is `.scratch/archive/2-c-.../plan.md:30`, which names "roadmap entry 3" and ends "(the user).".
  - By `:50`/`:51` it is carried. `:52` does not apply, since that plan opens `# Plan: 2.C`.
  - It settles no decision (`:53`).
  - `:54` now limits the write to "each decision it settles that the entry's Rulings or rulings file does not already settle", so nothing is written. The term carries the same limit. The first report's Standards 3 is closed.
- **R5: met.** `:98`.
- **R6: met.** `:94` and `:95`.
- **R7: met.** `:101`, `:103` and `:105`. `:104` applies only to an entry with a gate.
- **R8: met.** `:86` and `:101` to `:104`.
- **R9: met.** `:123` to `:127`: one requirement per bullet, so the first report's Standards 2 is closed for `:122`.
- **R10: met.** `:47` and `:213`.
- **R11: met.** Read by `:50`. Settles nothing by reading (`:53`). `:54` and `:217` write nothing.
- **R12: met.** `ok: the plan-terms block equals the template`.
- **R13: met.**
  - `:47`: no open plan of entry 3. The four open plans are 2.E, 2.F, 2.G and 2.H.
  - `:89`: D1 (file `:3`) and D2 (file `:4`) settle both decisions.
  - `.scratch/2-e-grill/plan.md:127` is carried and is not written again (`:99`, `:54`).
  - No archived plan opens `# Plan: 3`, so `:52` does not apply.
  - A restart gives the same result (`:108`).
- **R14: met.** `:96` and `:97` (D11 "replacing D5"). Spec 2 below names an input R14 does not cover.
- **R15: met.** `:98`. See Spec 2.
- **R16: met.** `:104`.
- **R17: met.** `:218`.
- **R18: met.**
  - `:47`: the 2.D plan lies inside `archive_root`, so it is not the open plan, and answers go to the rulings file (`:213`).
  - `:50` and `:52`: all eight bullets, `plan.md:35` to `:42`, end "(the user)", so all eight are carried. Only `:39` names 2.D.
  - The first report's Behaviour 1 is closed on this input.

### Findings

**Behaviour 1: the entry test on line 52 matches another entry's archived plan.**
- **Place:** `skills/grill/SKILL.md:52`.
- **Quote:** "In an archived `plan.md` that opens with `# Plan: <entry>`, every bullet of a section ... is a carried ruling, whether or not it names the entry."
- **What is wrong:** the round dropped the names-the-entry test for these bullets, so "opens with `# Plan: <entry>`" is now the only guard. It is a prefix test, and on this tree `<entry>`=`2` matches five archived headings: "# Plan: 2.A ...", "# Plan: 2.B ...", "# Plan: 2.C ...", "# Plan: 2. Coverage inventory ..." and "# Plan: 2.D ..." (a loop of `case "$h" in "# Plan: $e"*`).
- **Pairs on the open roadmap:** 15 and 15.A (`docs/roadmap.md:140` and `:147`), and 22 and 22.A (`:196` and `:203`).
- **`session-retro` already states the exact test** in its "What it reads" 2: "a title, after `# Plan: `, that equals `<entry>` or starts with `<entry>` and a space, a full stop after a number being allowed".
- **Line 47:** it applies the same prefix test to the open plan. That text was in the base, but this step rewrote the line.
- **Failure scenario:** once 15.A's plan is archived, `/grill 15` carries every "(the user)" bullet of 15.A's Rulings as the user's answer on entry 15. By `:90` it marks the decisions those bullets settle as settled and does not ask them. `/grill 2` does the same with 2.A to 2.D.
- **Fix at landing:** the `session-retro` test on `:52`, and on `:47`.
- **Verdict:** none. No case input has such a pair.

**Spec 2: a ruling that replaces the entry's own bullet does not reach the carried ruling behind it.** This is in the whole diff, in the text of round 0; the first report did not raise it.
- **Place:** `skills/grill/SKILL.md:96` and `:98`, with `:196`.
- **Quotes:**
  - `:96`: "A carried ruling that a later ruling names as the one it replaces settles nothing."
  - `:98`: "A carried ruling that contradicts ... a bullet of the entry's Rulings or rulings file, neither naming the other as the one it replaces, is a rule clash".
  - `:196`: "Reopen the earlier ruling, by a new Rulings bullet that names the one it replaces."
- **What is wrong:** when the user reopens a decision whose bullet in the entry's own file states a carried ruling, the new bullet names that bullet, not the carried ruling's source. That bullet can be D2 of `.scratch/rulings/3-the-writing-base.md`, or a copy written by `:217` "carried from `<path>:<line>`". Nothing then lets the source settle nothing. The new `:52` extends this to every bullet of an archived plan of the entry.
- **Failure scenario, on this tree:**
  1. At a later `/grill 3` the user reopens D2 (`rulings/3...md:4`), and a bullet "... replacing D2 (the user)" is written.
  2. At the next `/grill 3`, `.scratch/2-e-grill/plan.md:127` ("D2 (a), entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only") is a carried ruling again.
  3. `:96` does not apply, because the new bullet names D2, not `:127`.
  4. By `:98`, round 1 shows a rule clash that asks the user again what they just ruled. That is the fault the step exists to end.
- **Fix:** the orchestrator's text, for example a sub-bullet under `:96`: "A later ruling that names as the one it replaces a bullet of the entry's Rulings or rulings file that settles the same decision, a carried copy included, replaces the carried ruling too."
- **Verdict:** none. R14 and R15 are met on their own inputs.

**Behaviour 3: line 52 reads an archived plan the entry has since superseded.** This answers the orchestrator's question on supersession.
- **Place:** `skills/grill/SKILL.md:52`, with `:90` and `:98`.
- **What is wrong:** `:52` has no condition on the entry having an open plan or a rulings file, and no rule for an archived plan the user later set aside as a whole. `skills/plan/SKILL.md:80` moves every closed plan to `<archive_root>/`, so the earlier plan of an entry that is redone is normally archived.
- **Where it is harmless:** an archived bullet already carried into the entry's file is not written again (`:54`, `:99`, judged by reading).
- **Where it is not:**
  - A bullet replaced by the entry's file through its copy gives a clash on every run (Spec 2).
  - A plan set aside wholesale, as in the form of 2.C `plan.md:30` "roadmap entry 3 is redone from its sources", gives this: each of the old plan's "(the user)" bullets becomes a carried ruling.
  - By `:90`, the decisions of the new tree it settles are marked settled and not asked. By `:98`, those that contradict the new rulings file are clashes on every run.
- **Why this tree is not affected:** the user had plan 3's folder deleted rather than archived (2.C `plan.md:32`: "Decision B (2026-09-28): (a), plan 3's ledger folder is deleted from the tree, not archived (the user).").
- **Failure scenario:** an entry whose plan closed and was archived is later redone and grilled. The first round lists the thrown-out plan's rulings as settled answers and asks none of them. The user never rules on them for the new design.
- **Fix:** a design decision, so it is the user's call. Two options:
  - (a) Apply `:52` only when the entry has neither an open plan nor a rulings file. The first `/grill` after the closing carries the rulings, and later runs read the copies. Con: a rulings file written by grill 1.0.0, such as `.scratch/rulings/3-the-writing-base.md`, never gets them.
  - (b) Keep `:52`, and add that a ruling that sets an archived plan of the entry aside makes that plan's bullets settle nothing.
- **Verdict:** none. R18 is met on its input.

**Spec 4: line 52's second "whose" can attach to the section.**
- **Place:** `skills/grill/SKILL.md:52`.
- **Quote:** "every bullet of a section whose heading begins `## Rulings` and whose first line ends with "(the user)"".
- **What is wrong:** the two parallel "whose" clauses read naturally as both describing "a section". A section's first line is its heading, which never ends "(the user)". Round ruling 4 means the bullet's first line.
- **Failure scenario:** a reader takes the literal parse and carries no bullet of the 2.D plan, which loses R18's result.
- **Fix at landing:** word order only, the text dictated: "every bullet whose first line ends with "(the user)", with or without a full stop after it, of a section whose heading begins `## Rulings`, is a carried ruling, whether or not it names the entry."
- **Verdict:** none.

**Standards 5: one limit is written in two places, with different scope, and is missing where the write happens.**
- **Place:** `skills/grill/SKILL.md:54`, `:99` and `:217`.
- **Quotes:**
  - `:54`: "for each decision it settles that the entry's Rulings or rulings file does not already settle ("Steps / Writing what settled" 1)".
  - `:99`: "A carried ruling whose decisions a bullet of the entry's Rulings or rulings file already settles is not written again".
  - `:217`: "as one bullet for each decision it settles".
- **What is wrong:** `docs/dev/skill-layout.md`, "Where a rule goes", says "A rule is written once. Another place that needs it names the section it is in", and its Anti-patterns row reads "The same rule written in two sections". `:54` applies the limit per decision and `:99` per ruling. `:217`, the place `:54` points at, has no limit.
- **Failure scenario:** a carried ruling settles two decisions, and the entry's file already settles one of them. A session at Steps 8 follows `:217` and writes both bullets, one of them a duplicate. `:99` does not stop it, because not all of that ruling's decisions are settled.
- **Fix at landing:** the text is dictated (round ruling 3 and item 2). Put the per-decision limit as a qualifier in `:217`. Have `:54` point there, and drop `:99`'s write clause or make it point there too.
- **Verdict:** none.

### Declined to judge

- **Carrying every bullet of an archived plan of the entry.** Whether that is right at all was the orchestrator's ruling on the first report's Behaviour 1. I judged only its consequences (Behaviour 1, Spec 2 and Behaviour 3 above).
- **The first report's Spec 1 and Proof 1.** They were not sent in this round, and their disposition is the orchestrator's.
  - The builder's report still says, in "In the brief, with the evidence": "`archive_root` is listed as an optional key at line 34" and "`skills/ordo-init/templates/check_config.py` has no mention of it".
  - The first sentence is no longer true (line 34 is the base text again, diff rc=0). The round's own section states the change, and no decision now rests on it.
- **The first report's remaining points.**
  - Brief decision 7 (per-part decisions as design decisions).
  - Quoting only "the words ... that settle it" at `:217`.
  - Whether the step 14 rerun passes.
  - These stand as that report gave them. The round did not touch that text.

Reviewer usage: tokens not visible from inside the agent (see the completion notice); about 35 tool uses; minutes not visible.

## Closed

- First run, Spec 1: the brief's line number corrected to `plan.md:127` in the brief.
- First run, Proof 1: closed by repair round 1, ruling 1 (`archive_root` required).
- First run, Standards 1, 2 and 3 and Behaviour 1: closed by repair round 1, rulings 1 to 4; the run over the round confirms each closure.
- Run over round 1, Behaviour 1: fixed at landing, the exact title test on "What it reads" 6 and its archived-plan line.
- Run over round 1, Spec 2: fixed at landing, a sub-bullet in Steps 3 on a ruling that replaces the entry's own bullet.
- Run over round 1, Spec 4: fixed at landing, the archived-plan line reordered.
- Run over round 1, Standards 5: fixed at landing, the limit moved to one sub-bullet under "Steps / Writing what settled" 1.
- Run over round 1, Behaviour 3: raised to the user as an open item in the state file.
