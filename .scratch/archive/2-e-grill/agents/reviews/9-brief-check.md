# Step 9 brief check (on main at 619552b)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/9.md`. It cites pages (the rules file, a standard, a skill's text) by their section. A grep hit keeps its `file:line`. I changed nothing.

## 1. Names

- **"later approval"**: `git grep -n -i "later approval" -- . ':!.scratch'` printed nothing (rc=1). The only hits are in `.scratch/2-e-grill/plan.md:41` and the brief. No hit outside the paths.
- **"one ruling"**: `git grep -n -i "one ruling" -- . ':!.scratch'` printed nothing. No hit outside the paths.
- **"names no project"**: `git grep -n -i "names no project" -- . ':!.scratch'` printed nothing. No hit outside the paths.
- **"project name"**: `git grep -n -i "project name" -- . ':!.scratch'` printed three lines:
  - `README.md:3: ... The skills carry no project name and no path.`
  - `docs/dev/change-standard.md:83:- The skills carry no project name and no path; ...`
  - `skills/plan-orchestration/SKILL.md:318:- The skill carries no project name, since that is in .agents/plan.yaml and the ledger.`
  
  None of the three is made false: they are about skill text, and the new rule is about roadmap entries.
- **"The user approves what it computes"**: `git grep -n -i "The user approves what it computes" -- . ':!.scratch'` printed two lines:
  - `skills/plan-orchestration/SKILL.md:204:  - The user approves what it computes before it is written.` This line is in the paths.
  - `skills/plan-retro/SKILL.md:85:   - The user approves what it computes before it is written.` This line is outside the paths. It is the same sentence, in "The proposal for a recurring kind" item 4, after "It states what the check computes, ...". By the brief's own Decision 2, left as it is it "reads as a second stop". The brief also calls line 204 "the one place a skill names a later approval", which is false.
- **The term open item, and every text describing an open item's shape or a stop message**: `git grep -n -i -E "pros and cons|its options|the options" -- skills docs README.md ':!docs/roadmap.md'` printed five lines. Four are in the paths: glossary 49, `plan-orchestration` 296, state template 38, plan-terms 44. The fifth is `skills/spec/SKILL.md:87` (the library stop). Decision 1 leaves 87 governed by "A stop"; that holds.
  - `git grep -n -i "open item" -- skills/land skills/refute skills/plan skills/roadmap skills/plan-help skills/ordo-init skills/repo-setup skills/plan-retro README.md docs` found no other text that states an open item's shape. `land`, `refute`, `plan-help` and `plan` name open items but not their options. None is made false.
- **Every place that says the user approves something later**: `git grep -n -i approv -- skills README.md docs/dev`. The new sentence says the ruling approves every later approval "and the work goes on without a second stop" (item 1). The following approval stops still wait on the user, and none says that a ruling which stated their content counts as the approval:
  - `skills/roadmap/SKILL.md:48` ("Write the change once the user approves or corrects it") and its Stops row 129 ("The change").
  - `skills/ordo-init/SKILL.md:80`, `:103`, `:107` and `:124`.
  - `skills/repo-setup/SKILL.md:90`, `:99` and `:153` ("The drafted sync change").
  - `skills/plan-retro/SKILL.md:58` and `:85`.
  
  Plan ruling "Open item B" (a roadmap diff "this ruling approves") is exactly this case. When such an option is ruled, `/roadmap` still stops at "The change", so item 1's "without a second stop" is false for it. Change-standard rule 19 requires the contradiction to be removed in this step or raised as a stop.
  - `docs/dev/change-standard.md:19` and `:22` ("A new script needs the user's approval of what it computes before it is written"; "with the user's approval"): not made false, since a ruling is that approval.

Findings:
1. `skills/plan-retro/SKILL.md:85` carries the same sentence as `plan-orchestration:204` and is not in the paths.
   - Add an item 7: `skills/plan-retro/SKILL.md:85` becomes exactly "   - The user's decision on the proposal approves what it computes, before it is written."
     - `plan-retro`'s proposals are decided at its "The proposals" stop, not booked as open items, so "decision", not "ruling".
   - Add `skills/plan-retro/SKILL.md lines 85-85` to "Paths this step writes".
   - Decision 2's "the one place a skill names a later approval" becomes "the two places a skill names a later approval (`plan-orchestration`'s recurring-findings pass and `plan-retro`'s proposal item 4)".
   - Widen the grep case to `git grep -n "The user approves what it computes" -- skills`: `plan-orchestration/SKILL.md:204` and `plan-retro/SKILL.md:85` on the unchanged tree; nothing after.
   - The diff-stat case becomes `7 files changed, 8 insertions(+), 5 deletions(-)`.
2. The approval stops of `roadmap`, `ordo-init` and `repo-setup sync` contradict "the work goes on without a second stop" when an option has stated their content. The orchestrator chooses:
   - (a) Widen the paths: add to each of the three skills' Rules the bullet "- A change whose content the user already approved in full, by a ruling on an open item that stated it, is written without asking again." Keep the Stops rows.
   - (b) Narrow item 1's closing words to "so that the user's one ruling approves them too", dropping "and the work goes on without a second stop". The claim the ruling makes is then only the one the texts in the paths can keep.
   - Recommended: (a). It is what ruling O5 and the memory behind it ask for ("never pause twice for one decision"). (b) is the lazy option: it leaves the second pause in place.

## 2. The step line

- "an open item lists every later approval its option triggers, so one ruling covers them": items 1 and 3, with items 2, 4 and 5 carrying it to the texts that restate the form.
- "(the open-item form of `plan-orchestration` and `spec`)": items 1 (`plan-orchestration` Stops) and 3 (`spec` "Steps / A stop").
- "a roadmap goal names no project": item 6, first sentence.
- "a project name appears only where the entry reads or changes that project": item 6, second sentence.
- "as a path": item 6, "written as a path a reader can find".
- "(the `roadmap` skill's Rules)": item 6.
- "check: each sentence read in place": the Reading cases.
- "(1 commit)": outside "What to build".

Findings: none. Every part has an item.

## 3. Premises

- **Line 9, the text of ruling O5 "as proposed to Axel when he ruled".** On disk, `grep -n "O5" .scratch/2-e-grill/plan.md` prints line 92, whose only words on this are "the one-ruling sentence, step 9 (the user)". I grepped the repository for "open-item form" with `grep -rln "open-item form" .`, excluding the worktrees: it appears only in plan.md:41 (the step line), orchestrator-state.md:85 and the brief. The quoted sentence "The sentence goes into the open-item form of `plan-orchestration` and `spec`" is on no tracked or ledger file. "The practice it states: ..." exists only in the user's memory file `one-question-per-decision.md`, not on the tree.
  - Mismatch. Replace the premise with what is on disk: "Ruling O5 (plan.md Rulings): '... the one-ruling sentence, step 9 (the user).' The step line names where it goes: 'the open-item form of `plan-orchestration` and `spec`'."
  - The practice sentence either cites its source or goes under "Decisions taken in this brief".
- **Line 10, the quote of ruling O6 (a).** `sed -n 93p .scratch/2-e-grill/plan.md` prints "- O6 (a): a project name appears in a roadmap entry only where the entry reads or changes that project, as a path; the rule sentence is step 9 (the user)." The brief's quote ("A goal says what the skill does and names no project. A project name stays only where ...: the source of a migration, the target of a switch-over, or a repository named as the test run in a gate. It is written as a path a reader can find.") is not on disk: `grep -rn "says what the skill does"` finds it only in the brief and in unrelated archive reports.
  - Mismatch. Quote the Rulings line as it stands. Put the brief's extra words (migration source, switch-over target, gate repository) under "Decisions taken in this brief".
- **Line 10, `grep -n -i -E 'research-hub|game-engine|cathedra|oculus' docs/roadmap.md`.** It prints lines 73, 151, 172, 179 and 218, which match the brief. Line 73 is under "## 5. paper" and line 151 under "## 16. Switch over". Line 172 is under "## 19. codebase-design" and line 179 under "## 20. improve-codebase-architecture". Line 218 is under "# Done", entry 2.
  - The brief's description needs correcting. Line 73 is entry 5's Goal ("- Goal: The paper skill: ... moved in from `research-hub/tools/manuscript`."), so a goal on the tree names a project. That bears on items 4.1 and 4.2 below.
  - Lines 151, 172 and 179 name the project as a bare word ("research-hub's `CLAUDE.md`", "removed from research-hub", "one run on Cathedra"), not as a path.
- **Line 11, `git grep -n -i -E "one recommendation|recommendation with" -- skills docs README.md`.** It prints `docs/glossary.md:49`, `skills/plan-orchestration/SKILL.md:296`, `skills/plan/templates/orchestrator-state.md:38`, `skills/repo-setup/templates/plan-terms.md:44`, `skills/spec/SKILL.md:87` and `:192`, each with the text the brief quotes. It also prints `docs/roadmap.md:24` (entry 2.E's goal), which the brief omits. This is a minor mismatch: add it with "the grill entry's goal, not an open-item form".
  - `grep -n "" skills/plan-orchestration/SKILL.md | sed -n 296,297p` matches the brief's lines 296 and 297.
- **Line 17, `plan-orchestration` lines 203 and 204.** `sed -n 203,204p` prints "  - The proposal states what it computes." and "  - The user approves what it computes before it is written.", matching the brief. The implied claim that this is the only such line is false: `skills/plan-retro/SKILL.md:85` is its twin (see Names 1).
- **Line 18, `roadmap` "## Rules" at line 153 and bullets 155-158.** They match: `grep -n "" skills/roadmap/SKILL.md | sed -n 152,159p`, and the file has 158 lines.
  - The claim "`git grep -n -i -E 'names no project|project name' -- skills` prints nothing" is false. It prints `skills/plan-orchestration/SKILL.md:318:- The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger.` Correct it to "prints only `skills/plan-orchestration/SKILL.md:318`, a rule on the skill's own text, which this step does not touch".
- **Line 19, `git grep -n -i "later approval" -- skills docs README.md`.** It prints nothing (rc=1), matching the brief.
- **Read item 4, `skills/repo-setup/templates/sync_rules.py --help`.** The script has no `--help`: running it prints `error: no CLAUDE.md in /Users/axelfaes/workspace/ordo/--help`. Replace it with "the docstring at the head of `skills/repo-setup/templates/sync_rules.py` (Usage, `--write`, the ok and written lines)".
- **`python3 skills/repo-setup/templates/sync_rules.py . --only glossary`.** On the unchanged tree it prints `ok: the plan-terms block equals the template`, rc=0. Consistent with the brief.

Findings: the five mismatches above.
- The O5 quote is not on disk.
- The O6 quote is not on disk.
- Line 73 is a goal that names a project.
- The "prints nothing" claim for `names no project|project name` is false.
- `--help` does not exist.

The roadmap:24 omission is minor.

## 4. Cases and checks

1. **Item 6 is inserted after line 156, which breaks line 156.** Line 156 ends "as the next rule says" and points at line 157 ("Every entry this skill writes has a goal and a gate ... an entry under 'Not yet specified' has a goal and what must be known ..."). Inserting the new bullet after 156 makes "the next rule" point at the project-name bullet, which makes line 156 false. This is change-standard rule 14: "A sentence ... that the change makes false is a defect of the change".
   - Item 6 becomes "after the bullet 'Every entry this skill writes has a goal and a gate, ...' (line 157), a new bullet".
   - The path becomes `skills/roadmap/SKILL.md lines 157-157`.
2. **Item 6's first sentence contradicts the tree and the case that reads it.** "A goal names no project." is broken by entry 5's goal at `docs/roadmap.md:73`, which names `research-hub/tools/manuscript` as the source of a migration. The case "each of them is an entry that reads or changes the project it names, so the sentence makes none of them wrong" is false for line 73.
   - The dictated sentence is also a bare prohibition. Skill layout, "Writing for an agent", first bullet, requires it to name the behaviour to do instead.
   - Replace item 6 with two bullets. Skill layout, "Lists and tables": "written as a path" can be broken while the first rule holds, so it is a second rule.
     - "- A goal says what the work delivers, and names a project only when the entry reads or changes that project, such as the source of a migration, the target of a switch-over or the repository a gate runs on; the gate and the dependencies name a project under the same condition."
     - "- A project an entry names is written as the path of its folder, relative to the folder that holds this repository, such as `research-hub/tools/manuscript`." See 4.3 for the path form, which is the orchestrator's choice.
3. **"written as a path" against the roadmap's other Rules and its existing entries.** Line 158 says "Every path is relative to the repository root." A path into another repository cannot be relative to this repository's root. Entry 5 writes `research-hub/tools/manuscript`, relative to the parent folder. The done record at line 218 writes `/Users/axelfaes/workspace/research-hub/.agents/skills`, an absolute path.
   - The new rule and line 158 contradict each other unless the new bullet names its form as an exception. This is rule 19.
   - Lines 151, 172 and 179 name research-hub and Cathedra as bare words, so the new rule makes them wrong. The case claiming none is made wrong is false.
   - The brief must either:
     - (a) add `docs/roadmap.md` lines 151, 172 and 179 to the paths, rewritten to name the project by path. That is a roadmap change and goes through `/roadmap` with the user's approval, so it cannot be dictated to the builder. Or:
     - (b) have the new bullet govern entries this skill writes from now on, stated in the bullet ("An entry this skill writes names a project it reads or changes by the path of its folder ..."), and correct the case to say that lines 151, 172 and 179 predate it and are brought into line when those entries are next changed.
   - The orchestrator rules this. The lazy option is to leave the case's false claim.
4. **"project" in item 6 collides with the skill's own sense.** In `skills/roadmap/SKILL.md:21` and `:34`, "project" means a project of the `projects:` form, which the glossary defines ("`projects:` form: ... a repository with several projects"). Item 6 uses "project" for another repository and then says "the repository a gate runs on" for the same thing. That is synonym cycling (prose standard D) and a term outside its glossary sense (skill layout, "Writing for an agent", third bullet).
   - Use "repository" throughout: "names another repository only when the entry reads or changes it, ...", "An entry names such a repository by the path of its folder, ...". Keep "project" out of the bullet.
5. **Item 3 names options that `spec`'s open item does not have.** `spec` line 192 defines the open item as "the step, what the tree shows against the step's text, the choice the user owns, and one recommendation with its reasons". It names no options, yet item 3 says "Each option in it lists ...".
   - Either item 3 becomes "     - Each option of the choice states in full every approval it would need later (...), so that the user's one ruling approves them too."
   - Or line 192 is also changed: "... the choice the user owns with its options, the pros and cons of each, and one recommendation with its reasons", which brings `spec` in line with the glossary's open item. That adds one changed line and must be reflected in the paths and the diff-stat.
6. **Items 1 and 3 run past the prose standard's sentence length.** Item 1 is one sentence of 49 words and item 3 one of 42 (`wc -w` on brief lines 25 and 31, whose counts include the leading marker). Prose standard E, "Sentence length", asks for under about 20 words unless the mechanism needs more.
   - "lists in full every later approval" is also imprecise: the option states the content of each approval, it does not list approvals in full.
   - Proposed item 1: "  - Each option states in full every approval it would need later, such as what a new script computes, a change to the configuration or the verification list, or a diff the user must see. The user's ruling on the item then approves them too, and the work goes on with no second stop." This keeps the qualifier in the same bullet, per skill layout, "Lists and tables".
   - Item 3 changes the same way, ending at "approves them too.".
   - The diff-stat is unchanged by this rewording.
7. **Items 4 and 5 make "their" / "of each" ambiguous.** "with its options, each listing every later approval it would trigger, their pros and cons and one recommendation" (item 5) can be read as "their" referring to the approvals.
   - Item 5: "with its options, their pros and cons, what each option would need approved later, and one recommendation,".
   - Item 4 in the same shape: "with its options, the pros and cons of each, what each would need approved later, and one recommendation,".
   - The "later approval" grep case then needs the phrase each text uses, or a grep on "approved later|approval it would need later".
8. **Diff-stat count.** For the brief as written the arithmetic is right: 6 files, 7 insertions, 4 deletions. It breaks down as `plan-orchestration` 2+/1-, `spec` 1+, the state template 1+/1-, plan-terms 1+/1-, the glossary 1+/1- and `roadmap` 1+. It changes with Names finding 1 (7 files, 8 insertions, 5 deletions), with the 4.2 split (one more insertion in `roadmap`), and with 4.5's second option.
9. **Case "Reading, rule 19 of the change standard".** It reads the new sentences only against `spec`'s "Steps / A ruling" and the "The roadmap diff" Stops row. It omits the approval stops of `roadmap`, `ordo-init`, `repo-setup sync` and `plan-retro` (Names finding 2). Widen it to name them.
10. **Case "Reading, the one-ruling sentence against ... the rules file".** Consistent. Change-standard "Scripts compute facts; judgment is read" (the bullet "A new script needs the user's approval of what it computes before it is written") is met by the ruling on an option that states the computation.

Findings: 4.1 to 4.7 and 4.9, each with its fix above.

## 5. The question

"The goal" here is what the step line delivers: open items whose options carry their later approvals, so one ruling suffices, and roadmap entries that name another project only where they read or change it, by path.

- **`git grep "later approval"`, one hit per file:** yes, it could pass without the goal. It tests the phrase's presence, not the rule. The Reading cases are what close it.
- **`git grep "names no project"`:** yes, for the same reason. And as dictated, the sentence that makes it pass is false on the tree (4.2).
- **The sync `ok` line:** yes. It shows only that the glossary equals the template, whatever the template says.
- **`grep "The user approves what it computes"` on `plan-orchestration` only:** yes. It passes with `plan-retro:85` still asking for a second approval (Names 1).
- **The diff-stat:** yes. It counts lines, not content.
- **The skill-layout reading:** it could pass with item 3's sentence naming options its open item lacks (4.5). No case reads that.
- **The one-ruling reading against the recurring-findings pass and the rules file:** it could pass while `roadmap`, `ordo-init` and `repo-setup` still stop a second time (Names 2). The case is limited to one skill.
- **The roadmap-sentence reading:** as written it asserts a false fact (line 73), so a reviewer following it would pass a sentence the tree breaks.
- **The rule 19 reading:** the same gap as 4.9.
- **The step line's check, "each sentence read in place":** yes, partly. Reading only the new sentence in place would not see line 156's "next rule" broken (4.1), `plan-retro`'s twin, or the approval stops elsewhere. Plan.md's own answer ("No, each sentence is read in place") should become: "The sentences read in place, and each text they make false found by grep (`later approval`, `approves what it computes`, the approval stops of the skills that stop for one, the roadmap's project names)".
- **Each item's check:**
  - Items 1 and 3: covered only by reading.
  - Item 2: yes, see the grep above.
  - Items 4 and 5: the grep and the sync.
  - Item 6: yes, see 4.1 and 4.2.

Findings: the grep cases need the reading cases, and the reading cases have the gaps named in 4.1, 4.2, 4.5, 4.9 and Names 1 and 2. Fixing those findings closes these.

## 6. Implied inputs

This is a text step: every item edits prose, and the one script run (`sync_rules.py --write`) already exists and is unchanged. It is not a code step.

Findings: none.

## Declined to judge

- Whether "later approval" (or the reworded "approval it would need later") is a term that needs its own glossary entry under skill layout, "Writing for an agent", third bullet. I read it as plain words explained by its examples; the orchestrator decides.
- The form of a path into another repository: relative to the parent folder, as `docs/roadmap.md:73` has it, or absolute, as line 218 has it. This is the user's vocabulary choice, and ruling O6 does not settle it.
- Whether the approval stops of `roadmap`, `ordo-init` and `repo-setup` are within ruling O5's reach (Names 2, options (a)/(b)). This changes the step's scope, which is the user's call if the orchestrator does not take (a) as inside O5.
- Whether the text of rulings O5 and O6 as spoken to Axel exists in a session transcript. It is not on the tree, and I could not check it.

Agent usage: claude-opus-5-5. Tokens and time are not visible to me (not verified). About 27 tool uses.

Usage (from the completion notice; model from the transcript): claude-opus-5-5, 129625 tokens, 36 tool uses, 313 s.

## Closed

- Names 1: item 6 rewrites `plan-retro/SKILL.md:85` ("decision"); decision 2 names both places; the grep case covers both; the paths and the diff-stat updated.
- Names 2: option (a), decided by the orchestrator overnight (decision 4): item 9 adds the Rules bullet to `roadmap`, `ordo-init` (after its diff-after-approval rule) and `repo-setup`; the rule-19 case reads each approval stop.
- Premises: the O5 and O6 texts quoted as on disk, the proposed wording marked as from the session transcript; line 73 described as a goal naming a path; the "project name" grep's one hit given; `roadmap.md:24` noted; the `--help` read replaced by the docstring.
- 4.1: the roadmap bullets go after line 157, keeping 156's "the next rule".
- 4.2, 4.4: the roadmap bullets rewritten in "repository", naming what to do (a goal names another repository only where the entry reads or changes it), in two bullets.
- 4.3: "as a path" read as the path of a file or folder in another repository from the folder that holds this repository, the exception to line 158 stated in the bullet; line 151 brought under it (item 8, decision 6, decided by the orchestrator overnight); lines 73, 172, 179 and 218 read in a case.
- 4.5: `spec`'s open item gains its options and their pros and cons (item 3).
- 4.6: items 1 and 3 split into short sentences, "states in full every approval it would need later".
- 4.7: items 4 and 5 reworded ("what each would need approved later"), and the grep case follows.
- 4.9 and the question findings: the rule-19 case names every approval stop; the diff-stat is `10 files changed, 14 insertions(+), 7 deletions(-)`.
