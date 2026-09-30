# Step 8 brief check (on main at b5d2af6)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/8.md` (uncommitted in main's working tree, as expected). I changed nothing and ran no git command that changes state. The brief has eight findings. Four of them block the brief as written:
- the step check and Case 1 cannot pass on any tree (3.1, 4.1);
- the dictated rule 13 contradicts itself on silent cases (4.3);
- two premises are wrong (3.1, 3.2);
- file counts are wrong in Case 5 and Verify 3 (4.2).

## 1. Names

- **"names the revert".** Command: `git grep -n "names the revert"` over the whole repository (20 files, 25 lines). Outside the brief's paths the hits are:
  - `.scratch/2-e-grill/plan.md:40` (the step line itself);
  - `.scratch/2-e-grill/agents/briefs/3.md:167`;
  - brief 8 itself (lines 10, 17, 47);
  - 17 files under `.scratch/archive/...`.
  - All of these are ledger or history, and the change does not make them false. No hit under `skills docs README.md utils` outside the paths.
- **"turns (it )?red", "revert that", "change reverted", "failing without it", "quotes the red", "red line it produced", "red output", "no revert", "the revert".** Command: `git grep -n -i -E "<each>" -- . ':!.scratch/archive' ':!.agents/worktrees'`.
  - In `skills docs README.md utils` the hits are only the six paths the brief writes, plus the lines below.
  - `skills/land/SKILL.md:200,202` (a landed commit reverted on a ruling) and rule 10 of both change-standard copies (line 36, "what was reverted"): not about the revert rule; not made false.
  - `skills/repo-setup/templates/shared-rules.md:24` ("Dates, incidents and what was reverted belong in a ledger"): not about the revert rule; not made false. The brief's premise list omits it (see 3.2).
  - Ledger hits (`briefs/2.md:114,125`, `briefs/3.md:167`, `2-round-1.md:5,9`, `3-report.md`, `3s-report.md`, `retros/2026-09-26.md:99,105,106`, `comparison-2026-09-28/findings-by-cause.md`, and others): history, not made false.
- **"Red when" test comments.** Command: `grep -c "Red when" skills/ordo-init/templates/check_config.test.sh utils/pin.test.sh skills/repo-setup/templates/sync_rules.test.sh` printed 24, 31 and 2.
  - These comments name, per test, the mutation that turns it red, which is the old convention. They stay true descriptions and no standard requires them: `git grep -n -i -E "red when|test comment"` over the skill texts, the templates, `docs`, `README.md` and `CLAUDE.md` printed nothing.
  - The only place the convention is stated is the ledger brief `briefs/2.md:114`. Not made false.
- **"rule 13".** Command: `git grep -n -i "rule 13" -- skills docs README.md utils CLAUDE.md .agents` printed nothing.
- **"audit, not a proof", "near-miss", "control's".** Command: `git grep -n -i -E "<each>" -- skills docs README.md utils CLAUDE.md .agents`. Hits only in the paths.
- **"seen failing".** `skills/refute/SKILL.md:100`. Not made false, but it now overlaps the first new bullet (see 4.5).
- **"unchanged tree" (a term the new text introduces).** Command: same grep.
  - Hits: `docs/glossary.md:18`, `skills/repo-setup/templates/plan-terms.md:13`, `skills/refute/SKILL.md:98`, `skills/spec/SKILL.md:99`, `skills/spec/templates/brief.md:20` and `:66`.
  - All use it as "before any change" and none is made false. It is not a glossary term, and it was already in use in skills before this step, so the skill layout requires no new entry in `plan-terms.md`.
- **"cannot fail" (new).** Command: same grep; no hit today.
- **"red line".** The glossary's **red line** is "a verification line that fails on main after the cherry-pick" (`docs/glossary.md:65`, `plan-terms.md:60`). The old rule 13's "the red line it produced" used the term in another sense; the new text removes that clash. Not made false.
- **`skills/refute/templates/report.md`, section 2 Proof.** Its slot "<the claim>, <what the rerun showed>" fits a finding found by reading loosely, but it is not made false.

Findings: none. The two hits the brief adds under rule 14 (`common.md:13` and `plan-retro/SKILL.md:67`) are the only shipped texts the change makes false beyond the step line's four.

## 2. The step line

The step line is `plan.md:40`, with the line numbers corrected in the working tree to 62 and 107 (`git diff .scratch/2-e-grill/plan.md` shows the edit).

| Part of the step line | Item of "What to build" |
|---|---|
| Rewritten in `docs/dev/change-standard.md:39` | Item 1 |
| Its `repo-setup` template copy | Item 1 |
| `skills/spec/templates/brief.md:62` | Item 2 |
| `skills/refute/SKILL.md:107` | Item 3 |
| A new or changed test is run once on the unchanged tree and fails there | Items 1 and 2; item 3, first bullet |
| The report quotes that failure | Items 1 and 2; item 3, first bullet |
| No revert is named per test | Item 1 ("No revert is named per test."); items 2 and 3 remove the revert wording |
| `/refute` finds by reading a test that cannot fail | Item 3, second bullet; item 1 ("The reviewer finds such a test by reading it.") |
| Check: `git grep -n "names the revert"` prints nothing | Case 1 |
| Check: the four texts are read | Cases 6 to 9 |

Findings: none. Every part has an item. The check's grep is defective as written; see 4.1 and 5.

## 3. Premises

Each command of "What is on the tree", rerun on main at b5d2af6:

- **Line 39 identical in both copies.** `diff <(sed -n 39p docs/dev/change-standard.md) <(sed -n 39p skills/repo-setup/templates/docs/dev/change-standard.md)` printed nothing, rc 0. The quoted text matches `cat -n docs/dev/change-standard.md` line 39. Matches.
- **`brief.md:62`.** `grep -n "names the revert" skills/spec/templates/brief.md` printed `62:4. Each new or changed test names the revert that turns it red. ...`. Matches.
- **`refute/SKILL.md:107`.** `grep -n "change reverted" skills/refute/SKILL.md` printed `107:  - a test that stays green with the change reverted, ...`. Line 99 is `- **Proof.** ...`, so lines 99-107 are the Proof list, and line 100 is the "seen failing first" bullet. Matches.
- **The two further texts.** `git grep -n -i -E "revert that|turns (it )?red|reverted|failing without it" -- skills docs README.md utils` printed 11 lines. `common.md:13` and `plan-retro/SKILL.md:67` match as quoted.
- **The "other hits" line (brief line 15). Does not match.**
  - The same grep prints no `skills/land/templates/land.sh:71` and no `utils/pin.test.sh:242`: `git grep -n -i revert -- skills/land/templates/land.sh utils/pin.test.sh` printed nothing, rc 1.
  - It does print `skills/repo-setup/templates/shared-rules.md:24`, which the brief does not list.
- **Texts that already speak of the unchanged tree (brief line 16).**
  - Rule 1, line 27, in both copies ("script" in docs, "code" in the template): matches.
  - `brief.md:20`: matches.
  - `refute/SKILL.md:98,100`: matches.
  - `diff <(sed -n 18p docs/glossary.md) <(sed -n 13p skills/repo-setup/templates/plan-terms.md)` printed nothing, rc 0: matches.
- **The three-line count (brief line 17). Does not match.** `git grep -n "names the revert"` prints 25 lines in 20 files (`git grep -l ... | wc -l` printed 20). Only three are in `docs/` and `skills/`. The others are `.scratch/2-e-grill/plan.md:40`, `.scratch/2-e-grill/agents/briefs/3.md:167` and 17 files under `.scratch/archive/`.
- **The user rules (brief line 18).** `grep -rn "turns it red\|revert that" ~/.claude/rules ~/.claude/CLAUDE.md` printed nothing, rc 1. Matches.

Findings:
- **3.1, brief line 17.** Replace it with: "`git grep -n "names the revert" -- skills docs README.md utils` prints three lines on the unchanged tree: `docs/dev/change-standard.md:39`, `skills/repo-setup/templates/docs/dev/change-standard.md:39`, `skills/spec/templates/brief.md:62`. Unscoped, it also prints the ledger (`plan.md:40`, `briefs/3.md:167`, this brief) and `.scratch/archive/`, which stay."
- **3.2, brief line 15.** Replace the list with: "rule 10 of both change-standard copies (line 36, "what was reverted", about comments), `skills/land/SKILL.md:200-202` (a landed commit reverted on the user's ruling), `skills/repo-setup/templates/shared-rules.md:24` ("what was reverted belong in a ledger")". Drop `land.sh:71` and `pin.test.sh:242`.

## 4. Cases and checks

**Case 1.** `git grep -n "names the revert"` "prints nothing after".
- This breaks the check that change-standard rule 6 requires to verify a fact. Unscoped, the grep cannot print nothing:
  - `.scratch/2-e-grill/plan.md:40` (the step line) and brief 8 itself are in the worktree, since the preparation commit carries them.
  - So are `briefs/3.md:167` and 17 archived files.
- **Finding 4.1.** Change Case 1 to: "`git grep -n "names the revert" -- skills docs README.md utils`: three lines on the unchanged tree; prints nothing after." The plan's step-line check has the same defect. The orchestrator should correct `plan.md:40` in the same way ("`git grep -n "names the revert" -- skills docs README.md utils` prints nothing") before the preparation commit, as it did for the line numbers.

**Case 2.** Consistent with the rules file.

**Case 3.** Consistent, but see 4.3 on the text it pins.

**Case 4.** Consistent.

**Case 5.** Says "the five files of 'Paths this step writes'", but the paths list six files outside the ledger. Verify item 3 also says "over the five changed files". Its base is also named as `b5d2af6`, while the step's base is the preparation commit.
- **Finding 4.2.** Case 5 becomes: "`git diff --stat <base> -- . ':!.scratch'` after the change: exactly the six files of 'Paths this step writes' outside the ledger, one line changed in each and, in `skills/refute/SKILL.md`, one line removed and two added: 6 files changed, 7 insertions(+), 6 deletions(-)."
- Verify item 3 becomes: "`LC_ALL=C grep -n '[^ -~]'` over the six changed files prints nothing."

**Cases 6 to 9 (reading).** Consistent in form. The dictated texts they read have the defects below.

**Dictated texts, items 1 to 5, against rules 13, 14, 17 and 19, the skill layout and the prose standard.**

- **4.3, internal contradiction and a sentence false on the tree (rules 17 and 19).**
  - Item 1 says "Every new or changed test is run once on the unchanged tree ... and fails there". The same rule then says "A case asserting that a rule stays silent passes on the unchanged tree, so it carries a control". A silent case is a new test that, by the rule's own sentence, does not fail there. The two sentences contradict.
  - Item 2 (`brief.md:62`) and item 3's first bullet ("a new or changed test whose failure on the unchanged tree the report does not quote") then make every silent case a Proof finding, even when its control's failure is quoted. Failure scenario: a reviewer reads a report that quotes a silent case's control and files the silent case under Proof.
  - "passes on the unchanged tree" is also not true in general. When a change fixes a false positive (the rule reports on the unchanged tree and the change makes it silent), the silent case fails on the unchanged tree and its control passes there. That is also an added limit, which rule 17 forbids ("none is added").
  - Replace in item 1 the second sentence with: "Every new or changed test is run once on the unchanged tree, the tree before the change (for a plan step, the tree at its base), and fails there, except a case asserting that a rule stays silent. The report quotes that failing output verbatim beside the test's name."
  - Replace the silent-case sentence with: "A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the report quotes, beside it, the failure on the unchanged tree of the case or of its control, whichever fails there."
  - Replace the table columns with: "the behaviour, the case and the failing line that the case, or for a silent case its control, printed on the unchanged tree".
  - Item 2 becomes: "4. Each new or changed test is run once on the unchanged tree and fails there, or, for a case asserting that a rule stays silent, the case or its control does, and the report quotes that failure. A test that cannot fail, whatever the code under it does, is an audit, not a proof, and this brief says which it is."
  - Item 3's first bullet becomes: "  - a new or changed test whose failure on the unchanged tree the report does not quote, or, for a case asserting that a rule stays silent, neither its own failure there nor its control's;"
  - Update Case 3 and Decision 3's wording to the new text.
- **4.4, a changed test for behaviour the change preserves (a refactor).**
  - Such a test, for example one split or restructured without a renamed name, passes on the unchanged tree. "Every new or changed test ... fails there" then asks a refactor step for the impossible.
  - Where the refactor renames a name, the changed test fails on the unchanged tree only because the name is missing, which satisfies the text and proves nothing.
  - The old text had the same gap: no revert turns such a test red. So this is not a rule the rewrite drops, but the brief takes no position on it.
  - The ruling's words are "a new or changed test", so narrowing them is the user's call. Either raise it as an open item, or record in "Decisions" the reading the builder and reviewer apply.
  - Proposed wording, if the user rules it: "Every new test, and every test changed for a behaviour the change adds or changes, is run once on the unchanged tree ... A test changed only for a behaviour the change preserves is run on the unchanged tree and after the change, passes on both, and the report quotes both runs."
- **4.5, a new script.**
  - Every test of a new script fails on the unchanged tree only because the script is missing (`sh: ...: No such file or directory`). Each row of the table would then quote the same missing-file line.
  - The text is satisfied, and the only remaining guard is the reviewer's reading for a test that cannot fail.
  - A test asserting only a non-zero exit passes on the unchanged tree, because a missing script exits 127. The new rule catches that case correctly, as Decision 3's fourth case says.
  - The brief should say, in "Decisions", that for a new script the missing-script failure is the quoted failure. The per-behaviour proof then rests on `/refute`'s reading, which is what the ruling chose. Stating this closes a point both a builder and a reviewer will otherwise decide differently.
- **4.6, `/refute` line 100 against the first new bullet (skill layout: "One meaning has one place").**
  - Decision 4 says line 100 covers "a claim whose quote is missing" and the new bullet covers "a test with no claim at all". The new bullet's text covers any new or changed test whose failure is not quoted, with or without a claim. That includes rule 1's defect test, which is what "seen failing first" refers to.
  - Either remove line 100 (widen the paths to `skills/refute/SKILL.md lines 100-107`), or keep it and rewrite Decision 4's reason to one that is true. A true reason would be: "line 100 stays for a 'seen failing first' claim about a check that is not a new or changed test, such as a verification command".
- **4.7, "the tree at the step's base before any change" in the `repo-setup` template copy.**
  - In another repository, "step" and "base" are defined by the synced plan-terms block (`plan-terms.md`, **base**), so the phrase reads correctly for a plan step. "Before any change" is redundant once "at the base" is said.
  - The change standard's first line binds "a session working inline" as well, and such a session outside a plan has no step and no base. In that repository the unchanged tree is then undefined.
  - Use "the tree before the change (for a plan step, the tree at its base)" in both copies, as in the rewrite under 4.3.
- **4.8, prose standard, section E (sentence length).**
  - The dictated sentence "Every new or changed test is run once on the unchanged tree, the tree at the step's base before any change, and fails there, and the report quotes that failing output verbatim beside the test's name" is 37 words chained by three "and"s. Split it as in 4.3.
  - Item 1 as written in the brief (line 26) carries `\"Scripts compute facts; judgment is read\"` with backslash escapes. Case 3 compares line 39 with "the text of item 1 exactly", and the old line 39 has plain quotes (`grep -c -F '\"' docs/dev/change-standard.md` printed 0).
  - Write the dictated text with plain `"` so that neither the builder nor the case reads the backslashes as part of the text.
- **4.9, "run once" and repair rounds.** A test changed again in a repair round is a changed test. "Run once" can be read as already done. Add to "Decisions": "A test changed in a repair round is run on the unchanged tree again, and the round's report quotes that failure."
- **4.10, brief line 3.** "its rules govern this step unchanged, except its rule 13, which this step rewrites" makes the brief override the rules file, which the rules file forbids ("nothing in a brief overrides anything here"). The step adds no test, so the exception has no effect. Write: "its rules govern this step unchanged; its rule 13 is the text this step rewrites."
- **Rules of the old text (rule 17).** Every rule of the old rule 13 other than the per-test revert is carried:
  - the audit examples;
  - the control for a silent case;
  - the table per behaviour whose failure costs something;
  - the table's limit to those behaviours;
  - the verbatim quote.
  - The old "a test that no revert turns red" also covered a test that can fail but not because of this change. The new text covers that through the first sentence (it must fail on the unchanged tree), so no scope is lost. The one addition is "passes on the unchanged tree" (4.3).
- **Items 4 and 5.** Consistent. Item 4's new title matches item 1's title verbatim.

Findings: 4.1 to 4.10 above.

## 5. The question

"The goal" here is the ruled revert rule: a new or changed test runs once on the unchanged tree and fails there, the report quotes that failure, no revert is named per test, and `/refute` finds by reading a test that cannot fail.

**Step-line check** (`git grep -n "names the revert"` prints nothing, and the four texts are read).
- As written, the grep can never pass (4.1).
- Once scoped, the grep alone could pass by deleting the phrase with any replacement. The goal rests on the reading, and that holds only if the reading includes each text's consistency with itself (4.3).

**Case 1.** Yes, it could pass without the goal: deleting the phrase passes it. It proves removal only.

**Case 2.** Yes, for the same reason.

**Case 3.** Yes. It pins the dictated text exactly, and the dictated text contradicts itself on silent cases (4.3). With 4.3 closed: no.

**Case 4.** Yes. It checks the title only.

**Case 5.** Yes. It checks shape only.

**Case 6** (reading against the ruling). No, since it reads each point of the ruling. But it does not ask that the text be free of statements beyond the ruling.

**Case 7** (rule 17). It could pass while an added limit stands, because it checks only that old rules are kept. Add: "and the new text adds no condition or limit the ruling does not state (rule 17: 'none is added')."

**Case 8** (rule 19). Yes, it could pass: the list of statements it reads omits the new rule 13's own sentences read against each other, and `refute/SKILL.md:100` against the first new bullet. Add both: "the new rule 13's sentences read against each other; `skills/refute/SKILL.md:100` against the first new bullet".

**Case 9.** No, for what it checks.

**Item 1.** Yes. The text is written exactly as dictated, and it contradicts itself (4.3).

**Item 2.** Yes. The same silent-case defect applies.

**Item 3.** Yes. The first bullet files every silent case as a finding (4.3). The second bullet reaches the goal.

**Item 4.** No.

**Item 5.** No, but no case checks the new text is there. Add a case: "`grep -n -F '"a test that cannot fail"' skills/plan-retro/SKILL.md` prints line 67 after the change."

Findings: the step-line check and Case 1 (4.1); Cases 7 and 8 (add the two readings above); items 1 to 3 (4.3); item 5 (add the grep case).

## 6. Implied inputs

This is a text step. All six files it writes are Markdown pages or skill texts (`.md`), and no script or test is added or changed; the brief's Verify item 4 says so.

Findings: none.

## Declined to judge

- Whether the ruling's "a new or changed test" should be narrowed for behaviour-preserving test changes (4.4). That changes the ruling's words and is the user's call.
- Whether line 100 of `/refute` should be removed or kept (4.6). Both are defensible; which one is the orchestrator's choice.
- The builder's and reviewer's runtime: nothing was run in a worktree, since none exists yet.

Agent usage: claude-opus-5-5. Tokens, tool uses and minutes are not visible to this agent; they are in the runner's completion notice.

Usage (from the completion notice; model from the transcript): claude-opus-5-5, 133639 tokens, 25 tool uses, 313 s; $0.93 to $3.05.

## Closed

- 3.1 and 4.1: the grep scoped to `-- skills docs README.md utils` in the premise, in the first case and in the step line's check in `plan.md:40` (a premise correction).
- 3.2: the list of other hits corrected: `land.sh:71` and `pin.test.sh:242` dropped (they matched "red with" inside other words), `shared-rules.md:24` added.
- 4.2: the diff-stat case names the six files, the base from the dispatch entry, and `6 files changed, 7 insertions(+), 6 deletions(-)`; Verify 3 says six files.
- 4.3: rule 13 excepts the silent case from "fails there" and quotes the failure of the case or its control, whichever fails there; the table's column, item 2 and item 3's first bullet say the same; Decisions 2 and 3 updated.
- 4.4: decision 6, decided by the orchestrator overnight: a test changed only for a behaviour the change preserves passes before and after, and the report quotes both runs; written into rule 13, item 2 and item 3's first bullet.
- 4.5: decision 7, the missing-script failure of a new script's tests.
- 4.6: decision 4's reason rewritten to a true one; line 100 stays.
- 4.7: "the tree before the change; for a plan step it is the tree at the step's base" in rule 13; decision 5.
- 4.8: the long sentence split; the dictated text carries plain quotes.
- 4.9: decision 8, a test changed in a repair round.
- 4.10: the brief's first line no longer excepts rule 13.
- Question findings: case 7 adds "no condition or limit beyond the ruling and this brief's decisions"; case 8 adds the new rule's sentences against each other and `/refute` line 100 against the first new bullet; a grep case added for item 5.
