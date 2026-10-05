# Step 3b brief check (on main at 01aa901)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3b.md`. It was read from disk in `/Users/axelfaes/workspace/ordo/.scratch/2-h-session-retro/agents/briefs/3b.md`, which is untracked. At 01aa901 the step line `- 3b` and the ruling "No breakage testing (2026-10-05)" exist only as uncommitted additions to `plan.md`: `git diff .scratch/2-h-session-retro/plan.md` shows both lines added. Nothing was changed anywhere. The after-change results below are simulations piped through `sed`, with no file written.

## 1. Names

- The two bullets' wording (`small change to the code`, `with that change made`, `mutation`, `breakage`). Command: `git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils`. It prints only `skills/spec/templates/brief.md:34` and `:35`, which are inside the step's paths. Outside the step line's folders, the command `git grep -n -i -E 'mutation|...|removed in a|turns? the test red|red without|without the fix|...' -- . ':!.scratch' ':!skills' ':!docs/dev' ':!README.md' ':!utils'` printed these lines:
  - `docs/roadmap.md:32`: "each block removed in a scratch copy turns the test red". The change does not make this sentence false. It does ask for code to be removed so a test goes red. The ruling sends it through `/roadmap`, and the brief does not mention it.
  - `docs/roadmap.md:24`: "the fix with a test that is red without it". This is a test run on the tree before the fix, so it is not breakage testing. See 3 below.
- The same wording in the open ledgers. Command: `git grep -n -i -E 'mutation|small change to the code|with that change made|removed in a scratch copy|turns the test red|breakage' -- .scratch ':!.scratch/archive'`. The change makes none of these hits false, but each one is a live instruction to do breakage testing:
  - `.scratch/2-g-git-guard/agents/briefs/2a.md:158` repeats the two bullets almost word for word, adding "on a scratch copy run through `GIT_GUARD`".
  - `.scratch/2-g-git-guard/agents/briefs/2a.md:233` reads "The mutations: for each case kept as a test, the one-line change and the failing line it gives."
  - `.scratch/2-g-git-guard/agents/briefs/2a-round-1.md:23` reads "the mutation of each new case kept as a test and its failing line".
  - `.scratch/2-g-git-guard/plan.md:11` (the Gate) and `:14` (Step 1's question) read "each block removed in a scratch copy turns the test red".
  - Step 2a of plan 2.G is in flight. `.scratch/2-g-git-guard/orchestrator-state.md` holds a dispatch block with `step: 2a` and `round: 1`, and the most recent commits are "Send repair round 1 of step 2a of plan 2.G" and "Send the cases ruling of step 2a of plan 2.G". That builder is working right now under a brief and a round brief that ask for mutations.
  - The other hits are records of finished work: the 2.F and 2.H step 1 reviews and reports, the 2.G step 1 refuter and brief check, `.scratch/plan-drafts/2-g-git-guard.md`, and the audit and comparison files. They instruct nobody.
- `version` of `skills/spec/SKILL.md`. Command: `git grep -n -F '2.1.0' -- . ':!.scratch'`. It prints line 5 of `ordo-help`, `plan`, `repo-setup` and `spec`, each that skill's own version. No text refers to the version of `spec`, and the repository has no `skills-lock.json`.
- `kept as a test`, `failing line`. Command: `git grep -n -i -E "kept as a test|failing line|small change" -- . ':!.scratch'`. Outside the paths it prints `docs/dev/change-standard.md:44` and its template copy at `:44`, which ask for "the failing line quoted for it" on the unchanged tree. The change does not make this false.

Findings:
- N1. The brief does not mention `docs/roadmap.md:32`. The ruling sends that clause through `/roadmap`. The builder's rule-14 grep "across `skills/`, `utils/`, `docs/` and `README.md`" can reach it, and rule 20 forbids editing it. The brief should say that this place is outside the step and that `/roadmap` handles it, as the ruling says.
- N2. The 2.G ledger texts listed above ask for breakage testing, and the in-flight builder of 2.G step 2a is doing mutations under them. This step cannot close that, because a builder never edits another plan's ledger. The ruling assigns `/roadmap` only for the roadmap gate. For the 2.G gate copy in `plan.md`, its Step 1 question, and the in-flight brief and round brief, the ruling assigns nothing. This is for the session to settle as orchestrator of 2.G: a round ruling to 2.G's builder, and an edit of 2.G's `plan.md` gate. The 3b brief should name these places as outside its paths.

## 2. The step line

- "`skills/spec/templates/brief.md` 'Cases' loses its two bullets that ask, for each case kept as a test, for one small change to the code under test and the failing line with that change made" is served by What to build item 1 (lines 34 and 35 deleted) and checked by C1 and C3.
- "and no other text of `skills/`, `docs/dev/`, `README.md` or `utils/` asks for code to be broken deliberately to see a test fail" is served by What to build item 3 (no other file changes) together with the premise in "What is on the tree" that no such text exists, and checked by C2. No requirement asks the builder to read past a literal grep. See 5.
- "the `spec` skill's version is raised" is served by item 2 (`2.1.0` to `3.0.0`) and Decisions 1, and checked by C4.
- "check: `git grep -n -i -e mutation -e "small change to the code" -e "with that change made" -- skills docs/dev README.md utils` prints nothing" is served by C2, which adds `-e breakage` and so covers more, and by Verify 2.
- "and each changed text read in place" is served by C3 (the Cases section of `brief.md`) and by C4 (the version line).
- "(1 commit)" belongs to the orchestrator and needs no requirement.

Findings: none.

## 3. Premises

- The quoted ruling matches `plan.md` Rulings "No breakage testing (2026-10-05)" on disk, read with `sed -n 1,80p .scratch/2-h-session-retro/plan.md`. It is uncommitted at 01aa901 (`git diff` shows it added).
- `skills/spec/templates/brief.md` lines 34 and 35. Command: `grep -n -i -e 'small change to the code' -e 'with that change made' skills/spec/templates/brief.md`. It prints `34:- For each case kept as a test, the report names one small change to the code under test that the case must catch.` and `35:- The report quotes the test's failing line with that change made.`, and exits 0. This matches the brief.
- The premise grep `git grep -n -i -e mutation -e 'small change to the code' -e 'with that change made' -e breakage -- skills docs/dev README.md utils` prints only lines 34 and 35 and exits 0. This matches the brief.
- The brief says that no other text in the step's folders asks for code to be broken, "whatever words it uses". I tested that with wider greps: `git grep -n -i -E 'revert|scratch copy|taken out|removed in|turns? (the test )?red|goes red|red without|fails? without|without the fix|without it|broken|deliberately|...' -- skills docs/dev README.md utils`, plus `git grep -n -i -E "catch|one-line change|copy of the (script|test|code|guard)|goes? red (under|with)|probe|..."` and `git grep -n -i -E "unchanged tree|tree without|without the (fix|change)|before the change|at the base"` over the skills. Each hit was read in place. None asks for code that works to be broken to see a test fail. The places that could be read that way, with my reading of each:
  - `skills/diagnose/SKILL.md:149` (Steps 11) is the probe "so that Steps 15 has the red command green with it and red without it". `:160` (Steps 13) is "Undo the change of the probe, the one that turned the red command green included". `:166` (Steps 15) is "the red command green with the change and red without it". `:188` (Steps 17) is "Run the test on the tree without the fix and quote its failure". `:273` is the Anti-patterns row "run it red on the tree without the fix". My reading: the change being made and undone is the candidate fix. Undoing it returns the tree to its state before any change, which still holds the defect, and Steps 16 to 18 write the test before the fix is made again. That is rule 13's "unchanged tree", so no working code is broken. The pair Steps 13 and 17 is still the nearest thing in the tree to "a revert to watch a test go red".
  - `skills/diagnose/templates/diagnosis.md:80` and `:84`, and `README.md:20` ("probes on a scratch copy"), follow the same reading.
  - `skills/ordo-init/templates/check_config.test.sh:381` and `:388`: "red when the example drops one of the keys" describes a test input (a configuration file without a key). No code is removed.
  - `docs/dev/change-standard.md` rule 13 and its template copy, line 39 in each, are as the brief says.
- `skills/spec/SKILL.md` line 5. `grep -n 'version' skills/spec/SKILL.md | head -3` prints `5:  version: "2.1.0"`, which matches. `git log --format='%h %ad %s' --date=short -8 -- skills/spec/SKILL.md` puts fa32d9d (2.F step 2a) and 4c5ec5a, b1af081, dbe7692, da3683b, 50fa8bf (2.E.A) as the latest changes, which matches. `git log --grep='2\.H' -- skills/spec/SKILL.md ...` lists 4c5ec5a and 8595fad, and `git show 8595fad -- skills/spec/SKILL.md | grep version` prints nothing. So no 2.H step has raised the version, which matches the brief.
- The `docs/dev/skill-layout.md` "Frontmatter" quote matches line 20 of the section's text, read with `sed -n '/^## Frontmatter/,/^## Sections/p' ... | grep -n 'The major part'`.
- ADRs: `ls docs/adr` lists 0001 to 0012, plus `README.md` and `template.md`. This matches the brief's count of twelve.

Findings:
- P1. The brief misquotes `skills/spec/templates/brief.md` line 82. It groups line 82 with three places that it says find the test "by reading it". Line 82 reads `- A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof, and this brief says which it is.` That line does not say "by reading it". `docs/dev/change-standard.md:43`, its template copy, and `skills/refute/SKILL.md:127` do say it. Read alone, line 82 leaves a brief writer or a builder to settle "which it is", and the only way to settle it other than reading is to take the behaviour out and run the test, which is breakage testing. Two ways to close it:
  - (a) widen the step to line 82 and add that this is judged by reading the test, as rule 13 says;
  - (b) correct the premise and state why line 82 stands as it is.
  
  (a) ends the cause. (b) is the lazy option.
- P2. The brief's list of "sentences that stay" leaves out the diagnose places named above (`skills/diagnose/SKILL.md` Steps 11, 13, 15 and 17 and the Anti-patterns row, `templates/diagnosis.md:80` and `:84`). Its evidence for "no other text" is a grep for four literal words, which cannot show that no text asks for breakage in other words. The places and the reason each one stays should be named in the premise, so the reviewer can re-read them.
- P3. The heading reads "What is on the tree (read on main at the base)". The template asks for the commit, and earlier briefs name it, for example `.scratch/archive/2-e-grill/agents/briefs/9.md:7` "(read on main at 619552b)". The facts above were read at 01aa901, with the step line and the ruling not yet committed.

## 4. Cases and checks

- C1 (a grep of `brief.md`, lines 34 and 35 before, nothing and exit 1 after) checks a fact by a command and the text by C3. It is consistent with the change standard "Scripts compute facts; judgment is read" and rule 1 (a text defect is fixed by reading, with the text quoted before and after). Simulated with `sed '34,35d' skills/spec/templates/brief.md | grep -n -i -e ... ; echo "exit $?"`, it prints `exit 1`.
- C2 (`git grep`, nothing and exit 1 after) is consistent. On the unchanged tree it now prints lines 34 and 35 and exits 0. The brief gives no expected result for the unchanged tree. That breaks no rule, since the first run is noted.
- C3 (reading Cases after the change) is consistent with rule 1 and with the template's "A case of a text or judgment step is checked by reading". The simulated Cases section after deleting 34 and 35 keeps the bullets on tests, runs and text cases in their order.
- C4 (`grep -n 'version' skills/spec/SKILL.md | head -1` prints `5:  version: "3.0.0"`) is consistent. The simulation `sed '5s/"2.1.0"/"3.0.0"/' ... | grep -n 'version' | head -1` prints `5:  version: "3.0.0"`, and no line before 5 holds "version".
- Verify 3: `git diff --stat` shows two files. The report file is untracked in the worktree, so `git diff` does not list it, and the expectation holds.

Findings: none.

## 5. The question

- C1: yes, alone. A rewording of the two bullets (for example "names one edit the case must catch") passes C1 without the goal being met. C3's reading closes that, so C1 and C3 together answer no.
- C2: yes. It is a grep for four literal words, so text that asks for breakage in other words passes it.
- C3: no. Reading the Cases section shows whether any bullet still asks for a change to the code.
- C4: no. `docs/dev/skill-layout.md` "Frontmatter" makes a changed output a major raise, and the line is either 3.0.0 or not.
- The step line's check (the grep, and each changed text read in place): yes, for the part "no other text ... asks". The grep matches literal words only, and "each changed text read in place" reads only the changed files. That part of the goal holds only if the brief's premise is true. My read in 3 found it true except for line 82 (P1). Nothing in the builder's checks or the reviewer's would find a place that uses other words.
- What to build item 1: no, through C1 and C3. Item 2: no, through C4. Item 3 ("No other file changes"): yes. It passes trivially and depends wholly on the premise.

Findings:
- Q1. C2, the step line's check and item 3 could pass without the goal being reached when text asks for breakage in other words. A text case would close this: for example a C5 that reads, after the change, each place named in P2, line 82 and rule 13 with its template copy, and states for each why it asks for no breakage. With that case the reviewer re-reads the places rather than relying on the grep.

## 6. Implied inputs

- This is not a code step. It deletes two lines of a template and changes one frontmatter value, and runs no script.

Findings: none.

## 7. ADRs

- 0001 to 0003 (the writing base, the prose standard, the fresh agent that reviews a draft): do not touch the step.
- 0004 (the "(self-rule)" ending) and 0005 (the choices file): do not touch the step. The step's authority is a ruling that ends "(the user)".
- 0006 (agent ids with roles) and 0007 (the repair-round reviewer model): govern the session's records and the review. They do not touch the step's content.
- 0008 and 0009 (the cost script): do not touch the step.
- 0010 (the verify list kept equal to the verification page): governs `/spec`'s preflight. It does not touch the brief template's "Cases".
- 0011 (dispatch blocks) and 0012 (commit paths): govern the session and the landing. They do not touch the step.
- The brief says that no ADR touches the step. That holds. Every record above was read in full with `for f in docs/adr/0*.md; do cat "$f"; done`.

Findings: none.

## 8. Dictated text

- `version: "3.0.0"` is found by `grep -n 'version: "3.0.0"' .scratch/2-h-session-retro/agents/briefs/3b.md`, which prints lines 23 and 33 (line 33 as C4's `5:  version: "3.0.0"`). It holds. The shape matches `docs/dev/skill-layout.md` "Frontmatter" (`version: "<major.minor.patch>"`). The major part is raised once and the parts after it are set to 0, as that section says, and the line is ASCII as rule 10 of the change standard asks. The line keeps the two-space indent it has in the file.
- Item 1 deletes lines 34 and 35 and dictates no new text.

Findings: none.

## Declined to judge

- Whether the ruling's "any other text of Ordo" covers another plan's ledger (2.G's gate copy, its Step 1 question, the in-flight brief 2a and round brief 2a-round-1). The step line names `skills/`, `docs/dev/`, `README.md` and `utils/` only, and the ruling assigns only the roadmap gate. This is for the user, or for the orchestrator under self-rule (N2).
- The pinned install. `/Users/axelfaes/.claude-work/skills/spec` links to `/Users/axelfaes/.local/share/ordo-stable/skills/spec`, whose `templates/brief.md` still holds the two bullets at lines 34 and 35 (`grep -n -i -e 'small change to the code' -e 'with that change made' /Users/axelfaes/.claude-work/skills/spec/templates/brief.md`). Every `/spec` run writes them into briefs until `utils/pin.sh <tag>` moves to a tag that holds 3b. That move is the user's, outside the step.
- The brief's "Report" section leaves out two parts of the template, "The terms" and "A line shortened with '...' is not verbatim". This diff adds no term. These are not among the eight checks.
- The verify list (`sh skills/land/templates/checks.sh .scratch/2-h-session-retro/orchestrator-state.md`) was not run. It is not a premise of the brief, and its result on main says nothing about the change.

Agent usage: a5985b153ef87c248, claude-opus-5-5, 151177 tokens, 37 tool uses, 6.3 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- N1: "What is on the tree" names `docs/roadmap.md` line 32 as outside the step, handled through `/roadmap` as the ruling says; the builder edits it not.
- N2: "What is on the tree" names the 2.G ledger places (`plan.md` lines 11 and 14, `agents/briefs/2a.md`, `agents/briefs/2a-round-1.md`) as outside the step, handled by the orchestrator. Step 2a of plan 2.G has no builder running: its worktree and branch were removed on 2026-10-05.
- P1: closed by (a): What to build item 2 makes `skills/spec/templates/brief.md` line 82 say the test is found by reading it; the dictated line `   - A test that would still pass with the behaviour it is written for taken out of the code is an audit, not a proof; it is found by reading the test, and this brief says which it is.` holds against the prose standard (one rule, 33 words, the existing wording kept with the reading clause added) and is listed under Paths as lines 82-82.
- P2: "What is on the tree" lists the diagnose places and the check_config test lines with the reason each stays.
- P3: the heading names 01aa901.
- Q1: case C5 added: each place that stays, and the new line, read after the change with the reason quoted.
