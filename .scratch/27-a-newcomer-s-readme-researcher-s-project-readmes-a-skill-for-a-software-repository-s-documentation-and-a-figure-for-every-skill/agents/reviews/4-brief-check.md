# Brief check: step 4

Base: main at ee15921 (`git rev-parse --short HEAD` printed `ee15921`). Brief read: `/Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/briefs/4.md`.

## 1. Names

1. Old path `rulings/<slug>`. `git grep -n 'rulings/<slug>' -- skills docs` prints 8 lines. Six are inside the brief's paths: grill:49, plan:61, self-rule.md:115 and :142, plan-terms.md:110, glossary.md:115. Two are outside them: `docs/roadmap.md:27` (the gate, which quotes the check itself) and `docs/adr/0059-...md:7` (the Context, which states the old path). The change does not make either one false. The gate stays the check, and a Context states the facts before the decision.
2. `rulings/` (`git grep -n 'rulings/' -- ':!.scratch'`). Hits outside the paths:
   - `docs/roadmap.md:26`, the goal. It already names `<ledger_root>/rulings/<number>.md`, so it is true after the change.
   - `docs/roadmap.md:27`, see 1.
   - `docs/roadmap.md:50`, entry 2.E's done line: "D1 to D24 in `.scratch/rulings/3-the-writing-base.md`".
   - `docs/adr/0018-...md:7`: "(`.scratch/rulings/5-paper.md`, D27)". The record is superseded by 0024.
   - `docs/adr/0059-...md:7` (old path) and `:11` (new path).

   The change makes none of these false. roadmap:50 and ADR 0018:7 name particular files as they existed, not the rule. They are still a problem for the brief; see 4.4.
3. "rulings file" (`git grep -c 'rulings file' -- ':!.scratch'`). Files outside the paths:
   - `README.md:15`
   - `docs/adr/0005-...md:20`
   - `docs/adr/README.md:68`
   - `docs/roadmap.md` (3 hits)
   - `skills/orchestration/grill/references/decision-form.md:46`
   - `skills/orchestration/plan/templates/plan.md:36`
   - `skills/orchestration/roadmap/SKILL.md:45,46,55`
   - `skills/ordo/ordo-init/SKILL.md:68,69,78`

   I read each hit. None of them names the path or the slug, so the change makes none false. ADR 0005:20 ends "the plan's slug finds it in the archive". That slug is the ledger folder's slug, which the step keeps.
4. "slug" (`git grep -n -w slug -- ':!.scratch'`). Every hit outside the paths is about the ledger folder, the worktree or the branch:
   - README.md:241
   - ADR 0005:20
   - glossary.md:143 (worktree), inside the synced block
   - plan.yaml:6
   - land:33,71,182-250
   - plan-orchestration SKILL.md:166
   - plan templates orchestrator-state.md and plan.yaml
   - refute:35, spec:34,97,244,245,491, ordo-help:59
   - session-retro:51-73, tutor's learning-record-format.md:3 (unrelated)

   None of them becomes false. The glossary entry **slug** (plan-terms:119, glossary:124) never named the rulings file, so it stays true.
5. `git grep -n -i rulings -- utils README.md` prints only README.md:15, which has no path. The change-standard (rule 14) says to grep `utils/` and `README.md`; the brief's item 5 greps only `skills/` and `docs/`. This finds nothing more on this tree.

## 2. The step line

The plan's step 4 line, part by part, mapped to the brief:

1. "named `<ledger_root>/rulings/<number>.md` as ADR 0059 decides" is served by items 1 and 2, and by Decision 1 (the slug's rule).
2. "in `grill`" is item 1.
3. "`plan`" is item 2.
4. "`plan-orchestration`'s `references/self-rule.md`" is item 3.
5. "`ordo-init`'s `templates/plan-terms.md` and the glossary's block synced from it" is item 4.
6. "each skill's `metadata.version` raised" is item 6. Paths list: plan-orchestration and ordo-init `SKILL.md` line 5.
7. "check: `git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing" is Case 1, but with two exclusions added (see 9).
8. "the sync of the glossary block passes" is Case 4 and Verify 2.
9. "the user reads the text of `grill` and `plan` on the rulings file and approves" has no requirement in the brief. That is expected, since the reading is the user's and not the builder's. The brief does not say it stays open for landing as the user's reading.
10. "(1 commit)" needs no builder requirement.

D33 and the exclusions. D33 reads: "`git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing".
- That literal check cannot pass on any tree that keeps the gate. `docs/roadmap.md:27` holds the pattern itself.
- The exclusion of `docs/roadmap.md` is therefore forced. It keeps what the user meant: no page names the old path as the current one.
- The exclusion of ADR 0059 is a choice, not forced. The Context line could state the old state without the literal pattern (for example "named by its slug"), as a refinement under `docs/adr/README.md`.
- In both cases the brief, not the user, changes how the user's gate check is run. The closing step (9) records the gate's output, and the literal command will print two lines there.
- Recommendation (my judgment): raise the changed check to the user as an open item at landing (a change to a ruling, kind 3 of `references/self-rule.md`), with the forced part and the chosen part named. It should not stand only as brief Decision 2.

D32's "entry 27's file is renamed to `27.md`".
- `ls .scratch/rulings` prints "No such file or directory", exit 1.
- `git log --name-status -- .scratch/rulings` shows the file added at e654136, renamed at 082b363, and deleted (`D`) at ee15921 ("Open the plan of roadmap entry 27").
- Its bullets D1 to D41 stand in `plan.md` Rulings (read).
- So nothing is left to rename, and the brief's handling keeps the ruling. It says so under "What is on the tree", so the point is not dropped silently.

## 3. Premises

1. `git grep -n 'rulings/<slug>' -- skills docs` prints exactly the eight lines the brief names: grill:49, plan:61, self-rule.md:115 and :142, plan-terms.md:110, glossary.md:115, roadmap.md:27, ADR 0059:7. Holds.
2. `sed -n 50p` of grill prints "   - The slug is derived as the `plan` skill's Steps 1 derives it.". plan:61 holds "the slug as Steps 1 derives it". plan:84-87 prints "1. Name the ledger folder `<ledger_root>/<slug>/`, the slug derived from the entry." / "`38.3 One object per file` gives `38-3-one-object-per-file`." / "A project prefix is dropped, ..." / "A folder that already exists is a stop". Holds.
3. `grep -n 'Rulings: <entry>'` of grill prints line 282. Holds.
4. Glossary entries:
   - **rulings file** is at plan-terms.md:110 and glossary.md:115.
   - **slug** is at plan-terms.md:119 and glossary.md:124. The brief gives only the plan-terms line for it, which is correct.
   - The block runs from line 5 to line 144 (`grep -n 'ordo:plan-terms' docs/glossary.md` prints 5 and 144).
   - Holds.
5. Versions (`grep -n version`): grill 2.0.1, plan 6.0.0, plan-orchestration 9.0.0, ordo-init 5.0.1. Holds.
6. `ls .scratch/rulings` prints "ls: .scratch/rulings: No such file or directory", exit 1. `ledger_root` is `../.scratch` in `docs/plan.yaml:6`. Holds.
7. ADR 0059 lines 11 and 12 match the quotes. "No other ADR touches the step" does not hold; see 7.2.
8. D32 and D33 are in the Rulings as described. Holds.
9. Decision 1 says that `27`, `3.A`, `38.3`, `7.A` and `2.E` are "real entry numbers of `docs/roadmap.md` and the archive". This is wrong for `38.3`.
   - `grep -rn -E '(^|[^0-9])38\.3' docs/roadmap.md .scratch/archive/*/plan.md` prints nothing.
   - `git grep -l -E '\b3\.A\b|38\.3' -- docs skills` finds only `skills/orchestration/plan/SKILL.md`, the Steps 1 example.
   - `3.A` is real (roadmap.md:80, dropped). `7.A` and `2.E` are real (`.scratch/archive/7-a-referee`, `2-e-grill`).
   - The error is harmless to the rule.

## 4. Cases and checks

1. Case 1 is consistent with the rules file. Its first run on the tree:
   - `git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md' ':!docs/adr/0059-*'` prints six lines: glossary.md:115, grill:49, self-rule.md:115 and :142, plan:61, plan-terms.md:110.
   - So the exclusions work as written. Its second run (without the exclusions) reads two places the step does not change, as a control. That is legitimate.
2. Case 2 reads the rule only in `plan` "What it reads" 4. Item 1 asks `grill` to state the same rule in its own words ("lower case, each run of characters other than letters and digits a single `-`").
   - The rule would then be written in two skills and in the glossary entry. Item 1 also attributes it to "`plan`'s Steps 1", which states no rule in words, only one example.
   - `docs/dev/skill-layout.md` "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in". `grill` already follows that pattern at line 50.
   - The case does not check that `grill` gives the same five results.
   - Recommendation: state the rule once, in `plan`'s "What it reads" 4, and have `grill` name that item. Otherwise, extend Case 2 to `grill`.
3. The five number cases against `plan`'s Steps 1 as written.
   - Steps 1 states no rule in words. It gives one example, `38.3 One object per file` to `38-3-one-object-per-file`, and the dropped project prefix.
   - `27` to `27.md`, `3.A` to `3-a.md`, `38.3` to `38-3.md`, `7.A` to `7-a.md` and `2.E` to `2-e.md` agree with that example by inference: `.` becomes `-`, and upper case becomes lower case.
   - They also agree with the brief's stated rule, and with the slugs on the tree: `2-e-a-self-rule` from `2.E.A. self-rule`, and this plan's own folder name.
   - Steps 1 does not decide whether a full stop that ends the number (`27.`, `2.E.A.`) is part of it. See 6.1.
   - `web/12` to `12.md` agrees with "A project prefix is dropped".
4. Item 5 contradicts the Paths list and the no-history convention.
   - Item 5 asks that every page under `skills/` and `docs/` that names the rulings file's path names the new one, by `git grep -n 'rulings/'`, excepting "the two records".
   - That grep also hits `docs/roadmap.md:50` (`.scratch/rulings/3-the-writing-base.md`, a done entry's gate output) and `docs/adr/0018-...md:7` (`.scratch/rulings/5-paper.md`, a superseded record).
   - Read literally, item 5 sends the builder to rewrite them. That would write outside "Paths this step writes" and rewrite records of past files to names those files never had.
   - The brief should except them by name, as names of particular files rather than of the rule.
   - `docs/roadmap.md:26` and ADR 0059:11 already hold the new path.
5. Case 3 is a reading of `grill`. It is consistent with "A case of a text or judgment step is checked by reading the unchanged tree".
6. Case 4 already passes on the unchanged tree. Its first run, `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary`, prints "ok: the plan-terms block equals the template", exit 0. It checks a behaviour the step keeps and cannot fail for a missing change. That is legitimate, but it is no evidence of the goal.
7. Verify 2 runs `sync_rules.test.sh`. The test fills its scratch repositories from `plan-terms.md` (`sync_rules.test.sh:37`), so it reads a file the step changes. Legitimate.
8. Item 6's versions, against skill-layout "Frontmatter":
   - `grill` 3.0.0 and `plan` 7.0.0 fit "a run that worked before ... its output is changed", since an old-path file is no longer read.
   - `plan-orchestration` 9.1.0 (minor) fits none of the definitions cleanly. Its review of a choice reads the file `Booked:` names, so it behaves as before, which is a patch. A choice booked earlier at the old path is still found by its `Booked:` line.
   - `ordo-init` 5.1.0: the block it syncs into a repository changes in content. The precedent is 748e19e, where a plan-terms change raised `ordo-init` 5.0.0 to 5.0.1 (`git log -- skills/ordo/ordo-init/templates/plan-terms.md`, versions read with `git show`).
   - My judgment is that both are patches. The brief names this as Decision 4, so it is not silent.
9. No case is inconsistent with the rules file apart from 4.4. No case asks the builder to explain a place the step does not change, apart from the control in 4.1.

## 5. The question

The goal part this step delivers: "The rulings file of an entry is named by the entry's number alone, `<ledger_root>/rulings/<number>.md`, in `grill`, `plan` and every page that names its path."

1. Case 1: yes. The grep proves only that the old pattern is absent. Any wrong new text passes, such as `rulings/<entry>.md` or a number rule that differs between `grill` and `plan`.
2. Case 2: yes for `grill`. It reads only `plan`, so `grill` could state a different rule or keep a slug derivation in other words. For `plan` it is no.
3. Case 3: no for `grill`. A path that does not depend on the title is what the goal asks, but the case says nothing about `plan`.
4. Case 4: yes. It passes on the unchanged tree (4.6).
5. The step line's check: no, taken whole, because the user reads `grill` and `plan`. Without that reading it is yes, for the reasons of 5.1 and 5.4.
6. Item 1: yes, in one way. `grill` can meet it while stating the number rule in words that diverge from `plan`'s (4.2).
7. Item 2: no. It names the path, the rule and an example in `plan`, which is where the file is read.
8. Item 3: no. Those two lines are the only places of the reference that name the path (`git grep` in 1.1).
9. Item 4: no. The entry and the synced block are the only glossary places.
10. Item 5: yes, but harmlessly. There is no further page on this tree, so it passes with nothing done. Read literally, it also asks for wrong edits (4.4).
11. Item 6: yes. Versions are independent of the goal, and that is expected.

## 6. Implied inputs

This is a text step: skill text in `grill`, `plan` and `plan-orchestration`'s reference, and the plan-terms glossary template with its synced block. These are the inputs a run of the changed skills would meet that the brief never decides, where a wrong behaviour costs the user something:

1. Where the number ends.
   - Roadmap heads are `## 27. A newcomer's...` and done lines like `- [x] 2.E.A. self-rule` (`grep -n '^#\|^- \[' docs/roadmap.md`).
   - The roadmap skill also learns forms such as `## Phase 38: Code health` with `38.0`, `38.1` bullets, and `### 5. <status> Asset system` (roadmap SKILL.md:161).
   - Applied to `27.` or `2.E.A.`, the brief's rule gives `27-.md` and `2-e-a-.md`. Applied to `Phase 38`, it gives `phase-38.md` or `38.md`.
   - The brief does not say that the full stop after a number is not part of it (grill:49 already allows it in title matching), nor that a leading or trailing `-` is dropped, nor what the number of a "Phase" heading is.
   - Cost: `grill` writes one name and `plan` reads another, and the rulings are not copied into the plan. That is the defect this step exists to end.
2. A rulings file left at the old path. This covers a repository where an earlier `grill` wrote `<ledger_root>/rulings/<slug>.md` and no plan has opened yet.
   - Decision 3 rules out a fallback read. It does not decide whether the run tells the user.
   - After the change, `plan` neither copies nor removes such a file. `grill` reads it only for carried rulings that name the entry, which bullets like `D1 ...` do not.
   - A choice's `Booked:` line naming the old path is not rewritten by `plan` Steps 3.
   - Cost: settled decisions silently missing from the plan and asked again, and a stale file left behind.
   - D32 shows the user wanted the existing file renamed. For other repositories that run these skills, the brief has no rename and no notice. A stop or notice naming such a file is not a fallback, and ADR 0059's "names one path" does not exclude it.
   - Whether any repository the user runs holds such a file is not verified; I read nothing outside this repository.
3. Two entries with the same number under one `ledger_root`.
   - This happens when two projects of the `projects:` form, or two `plan.yaml` files, share one `ledger_root`.
   - Nothing requires distinct ledger roots. `check_config.py` checks only that `ledger_root` is not the repository root (lines 18, 40-41). The template `plan.projects.yaml` gives each project its own root but does not require it.
   - Both entries would then use `rulings/12.md`. The ledger folders kept the title, so they rarely collided.
   - The brief does not decide whether `plan` checks the heading line `# Rulings: <entry>` against the entry before copying and removing the file. ADR 0059's Consequences make that heading the file's only statement of its entry.
   - Cost: one entry's rulings are copied into another entry's plan and deleted.

## 7. ADRs

1. ADR 0059 touches the step. The step is under "An entry's rulings file is `<ledger_root>/rulings/<number>.md`, the number written as the slug writes it, so that `3.A` gives `3-a.md`." and "`grill` and `plan` read and write it at that path, and every page that names the path names it so." No part of the brief contradicts it.
2. ADR 0005 also touches the step, and the brief's "What is on the tree" does not name it ("No other ADR touches the step").
   - The step changes self-rule.md "The choices file", line 115. That is the `Booked:` path of a choice taken by `/grill` under `next_entry` before a plan is open.
   - The governing sentence is the Decision "Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry.", and the Consequences on the `Booked:` path ("the path is written as it stands when the choice is booked, rewritten by `/plan` to the new `plan.md` when it copies a bullet out of the rulings file").
   - The brief does not contradict it.
3. I checked every record with `grep -c -i -E 'rulings|slug|grill|Booked|plan-terms|glossary|metadata.version|choices file'` over `docs/adr/[0-9]*.md` with each record's Status line, and read each hit.
   - 0004 governs the endings "(self-rule)" and "(the user)". The step does not change them.
   - 0006 records `grill` lookups "where `grill` records it"; the step changes the path, not that rule.
   - 0018's hit is a superseded record of a past file.
   - The others are about `paper`, `wizard`, `tutor`, `codebase-design` or `researcher`.
   - None touches the step.

## 8. Dictated text

The brief dictates no whole line for any file. It dictates two literal tokens:
1. The path `<ledger_root>/rulings/<number>.md`. `grep -n -F '<ledger_root>/rulings/<number>.md'` on the brief prints lines 17, 22, 24 and 25. Holds: ASCII, inline code, as the prose standard F asks for a path.
2. The kept heading `# Rulings: <entry>`. `grep -n -F '# Rulings: <entry>'` prints lines 13 and 22. Holds: existing text, unchanged.

Item 1's "lower case, each run of characters other than letters and digits a single `-`" (`grep -n -F 'lower case, each run'` prints line 22) states content, not words. It is not dictated; its placement is finding 4.2.

## Declined to judge

1. Whether `plan-orchestration` and `ordo-init` take a minor or a patch raise. skill-layout's three definitions do not settle a change to a term's text or to a path that a reader takes from a `Booked:` line. 4.8 gives my judgment and the precedent; the orchestrator rules.
2. Whether any other repository the user runs holds a rulings file at the old path. I did not read outside this repository.

Agent usage: af6924bb5a482c6d5, claude-opus-5-5, 169399 tokens, 37 tool uses, 5.9 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1.1 to 1.4: no change; none is made false.
- 1.5: "What to build" 5 greps `skills/`, `docs/`, `utils/` and `README.md`.
- 2.9: "What to build" ends with the user's reading, left open at landing as an open item of kind 5.
- 2, D33 and the exclusions: ADR 0059 line 7 is edited as a refinement to state the old path in words ("named by the slug of its title") with no literal pattern, and joins the step's paths; only `docs/roadmap.md`, which holds the check itself, is excluded; the gate's wording is raised to the user as Open item C in the state file.
- 2, D32's rename: no change; "What is on the tree" already says nothing is left to rename.
- 3.9: Decisions 1 replaces `38.3` with `5` and `13`, real entry numbers, and keeps `38.3` only as the form of `plan`'s Steps 1 example.
- 4.2 and 5.2, 5.6: "What to build" 2 states the number rule once, in `plan` "What it reads" 4; "What to build" 1 has `grill` name that item; Case 2 reads `grill`'s reference too.
- 4.4: "What to build" 5 excepts `docs/roadmap.md` line 50 and ADR 0018 line 7 by name, as names of particular past files.
- 4.6 and 5.4: no change to the case; the report names it as a check of a behaviour the step keeps.
- 4.8 and Declined 1: "What to build" 6 and Decisions 4 raise `plan-orchestration` to 9.0.1 and `ordo-init` to 5.0.2, the patch part, as the precedent of 748e19e.
- 5.1: Case 1 also greps for the new path in `grill`, `plan`, `self-rule.md` and `plan-terms.md`.
- 6.1: "What to build" 2 defines the number: the entry's number as the roadmap writes it before the title, a full stop that ends it dropped, then written by the slug's rule; two new cases, `27.` and `2.E.A.`.
- 6.2 and Declined 2: "What to build" 7: `plan` at Steps 3 and `grill` in its first round name each file under `<ledger_root>/rulings/` whose heading line names the entry and that stands at another path, saying it is not read and the path it would be read at; a new case.
- 6.3: "What to build" 7: `plan` copies and removes the file at the number path only when its heading line `# Rulings: <entry>` names the entry, and otherwise shows it at Steps 3 as another entry's file; a new case.
- 7.2: "What is on the tree" names ADR 0005 and the sentence the step is under.
- Added after the check, dictated: "named by the slug of its title" (ADR 0059 line 7), read against the prose standard: holds.
