# Step 4 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-4, base e4e0198)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' <the ten changed files and agents/reviews/4-report.md> | xargs -0 perl -CSD -ne '<the brief's program>'; echo "exit=$?"
exit=0
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit=$?"
ok: the plan-terms block equals the template
exit=0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml; echo "exit=$?"
note: docs/plan.yaml: worktree_paths not set, default [] applies
note: docs/plan.yaml: review not set, default 'every' applies
note: docs/plan.yaml: refute_after_repair not set, default True applies
note: docs/plan.yaml: repair_rounds not set, default 1 applies
note: docs/plan.yaml: review_minutes not set, default 0 applies
note: docs/plan.yaml: look not set, default '' applies
note: docs/plan.yaml: bench not set, default [] applies
note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies
note: docs/plan.yaml: design_bar not set, default 'industry' applies
note: docs/plan.yaml: design_references not set, default [] applies
ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
exit=0
$ git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'; echo "exit=$?"
exit=1
$ git grep -n 'rulings/<slug>' -- skills docs utils README.md; echo "exit=$?"
docs/roadmap.md:27:- Gate: you read the rewritten `README.md` and approve it; [...the whole gate line of entry 27, as printed, ending...] `git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing; the verify list of `docs/dev/building.md` passes on main.
exit=0
$ git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'; echo "exit=$?"     (D33's check as the user ruled it, Open item C)
exit=1
$ git grep -n 'rulings/<number>.md' -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration/references/self-rule.md skills/ordo/ordo-init/templates/plan-terms.md
skills/orchestration/grill/SKILL.md:49: [What it reads 6]
skills/orchestration/grill/SKILL.md:167: [Steps 6, the not-read files]
skills/orchestration/grill/SKILL.md:285: [Writing what settled 1]
skills/orchestration/plan-orchestration/references/self-rule.md:115: [Booked: before a plan is open]
skills/orchestration/plan-orchestration/references/self-rule.md:142: [the review of a choice]
skills/orchestration/plan/SKILL.md:63: [What it reads 4]
skills/orchestration/plan/SKILL.md:68: [What it reads 4, the not-read files]
skills/ordo/ordo-init/templates/plan-terms.md:110: [rulings file]
```

(The roadmap line and the eight `<number>` lines were printed in full and match the builder's quotes character for character; they are shortened here only in this block's brackets, and the full lines stand in the builder's report.)

Commands the builder's report quotes as evidence, rerun:

```
# The new test on the unchanged script: a scratch layout holding `git show e4e0198:` of check_config.py, plan/templates/plan.yaml and plan/templates/plan.projects.yaml, with the new check_config.test.sh beside them.
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <scratch>/refute4base/skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | grep 'FAIL\|PASS'
FAIL: projects-one-ledger: expected an error, got a pass: note: docs/plan.yaml: tool-a: adr folder docs/adr does not exist yet; ordo-init or grill creates it

# Case 4b: projects a and b, ledger_root .scratch and ./.scratch, in a scratch repository's docs/plan.yaml.
$ python3 <worktree>/skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml | grep -v '^note'
error: docs/plan.yaml: the projects a and b have one ledger_root: docs/.scratch
(exit 1)
$ python3 <scratch>/refute4base/.../check_config.py docs/plan.yaml | grep -v '^note'     (the unchanged script)
ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists

# The control, run by the reviewer on both scripts, since the report has no run of it on the unchanged script: b's ledger_root ./.scratch/b.
$ python3 <base script> docs/plan.yaml        -> ok: ... ; base exit=0
$ python3 <worktree script> docs/plan.yaml    -> ok: ... ; new exit=0

# Three projects, a and c on .scratch, b on ./.scratch/b:
error: docs/plan.yaml: the projects a and c have one ledger_root: docs/.scratch

$ git diff e4e0198 --numstat
1 1 docs/adr/0059-...md; 1 1 docs/glossary.md; 11 7 skills/orchestration/grill/SKILL.md; 1 1 skills/orchestration/plan-orchestration/SKILL.md; 2 2 .../references/self-rule.md; 12 4 skills/orchestration/plan/SKILL.md; 2 1 skills/ordo/ordo-init/SKILL.md; 10 1 .../check_config.py; 14 4 .../check_config.test.sh; 1 1 .../plan-terms.md
$ wc -l <the ten files>      -> 21, 190, 415, 530, 175, 252, 587, 357, 355, 138 (total 3020), as the report's table gives
$ git diff e4e0198 | grep '^+' | LC_ALL=C grep -n '[^ -~]'   -> nothing, exit 1
$ git status --short
 M the ten files above; ?? agents/briefs/4-cases.md; ?? agents/reviews/4-report.md
```

The `docs/glossary.md` hunk is the one hunk `@@ -112,7 +112,7 @@` and equals the `plan-terms.md` line, and `plan` Steps 1 has no hunk in the diff, as the report says.

## Verdicts

Items of the brief's "What to build", in its numbering, as the cases ruling amends them:

- 1: holds. `grill` "What it reads" 6 names `<ledger_root>/rulings/<number>.md` and the number by `plan` "What it reads" 4. "Writing what settled" 1 writes the heading `# Rulings: <entry>` with the number and title after the round's roadmap diff at every write (ruling 1). See Behaviour 1 for the file at that path that belongs to another entry.
- 2: holds. `plan` "What it reads" 4 gives the path, the one statement of the number rule and the worked examples `2.E.A. self-rule` and `web/12`. Steps 1 is unchanged.
- 3: holds. `self-rule.md` lines 115 and 142.
- 4: holds. `plan-terms.md` line 110, synced; the sync check exits 0.
- 5: holds. The grep without the exclusion prints only `docs/roadmap.md:27`. Roadmap line 50 and ADR 0018 are not in the diff. ADR 0059 line 7 names the old file in words.
- 6: holds. `grill` 3.0.0, `plan` 7.0.0, `plan-orchestration` 9.0.1, `ordo-init` 6.0.0 (ruling 6).
- 7, first bullet as ruling 2 replaces it: holds. `plan` "What it reads" 4 compares the number only; another entry's file is shown at Steps 3 and is neither copied nor removed.
- 7, second bullet: holds for headings that name the entry by number, which is the brief's sense of "names the entry". See Behaviour 2 and 3 for the files this leaves out.
- 8: not applicable. It is the user's reading at landing, an open item of kind 5.
- Ruling 3 (check_config error, head comment, two test cases, `plan` "What it reads" 1): holds. Proof 1 covers the runs of the unchanged script.
- Ruling 7 (paths widened, two verify lines): holds. Both lines pass as quoted above.

Cases of the brief's "Cases", as the ruling amends them:

- Case 1, the greps: met. With the exclusion it prints nothing; without it, only `docs/roadmap.md:27`. The `<number>` grep prints a line in each of the four. D33's check as the user ruled it prints nothing.
- Case 2, the number rule: met, by reading `plan` "What it reads" 4. `27` and `27.` give `27.md`; `3.A` gives `3-a.md`; `7.A` gives `7-a.md`; `2.E` gives `2-e.md`; `2.E.A.` gives `2-e-a.md`; `5` gives `5.md`; `13` gives `13.md`; `web/12` gives `12.md` under `web`'s `ledger_root`. `grill` names the rule and does not restate it.
- Case 3, a title changed by `grill`'s own diff: met. The path is by number. The heading is rewritten after the diff at every write.
- Case 4a, `rulings/12.md` headed `# Rulings: 13. Another entry` while the plan opened is for entry 12: met for `plan` ("What it reads" 4, Steps 3). `grill` has no such check; see Behaviour 1.
- Case 4b, `check_config.py` with `.scratch` and `./.scratch`: met. It exits 1 with `error: docs/plan.yaml: the projects a and b have one ledger_root: docs/.scratch`, rerun above.
- Case 5, `rulings/12-old-title.md` headed `# Rulings: 12`: met. `plan` "What it reads" 4 and Steps 3 name it as not read, with `rulings/12.md`. So do `grill` "What it reads" 6, Steps 6 and Steps 10.
- Case 6, the sync: met. It exits 0, which shows the block stays in sync, not the change.

## 1. Spec

- None.

## 2. Proof

- `skills/ordo/ordo-init/templates/check_config.test.sh`, the cases `projects-two-ledgers` and `merge-key`.
  - The hunks: `make_projects_repo projects-two-ledgers` ... `expect_pass projects-two-ledgers`, and the `merge-key` fixture's added `ledger_root: ../tools/tool-b/.scratch` and `archive_root: ../tools/tool-b/.scratch/archive`.
  - What is wrong: both are new or changed tests of behaviour the change preserves. The change standard, rule 13, second bullet, says such a test runs on the unchanged tree before the change, where it can run there, and passes. The report says neither has a run on the unchanged script, because the suite stops at its first FAIL. Both could have been run there by hand.
  - The reviewer ran the control by hand on the unchanged script (`.scratch` and `./.scratch/b`). It passes, exit 0, so the control holds. The `merge-key` fixture still has no run on the unchanged script.
  - Failure scenario: a reader of the report cannot tell, from the report, whether the changed `merge-key` fixture still passes on the old script, that is whether the fixture change alone keeps it passing. The risk is low, since the fixture only adds two keys the old script already accepts.
  - Verdict: none; ruling 3 holds.

## 3. Standards

- `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md`, Decision and Consequences.
  - What is wrong: the change adds two decisions that follow from ADR 0059 and that the ADR does not state. First, `plan` reads the file at the number path only when the number in its heading equals the entry's. Second, two projects of one `projects:` form may not share a ledger root, and `check_config.py` refuses them.
  - The change standard, rule 5, says the ADR that owns the decision is documented in the same step. The brief's paths list ADR 0059 line 7 only, so widening them is the orchestrator's call.
  - Failure scenario: a reader of ADR 0059 who keeps two projects on one ledger root finds no record that the decision forbids it, and meets the refusal of `/ordo-init` with no ADR to read it in.
- `skills/orchestration/grill/SKILL.md:51`: "A file under `<ledger_root>/rulings/` at another path whose heading line holds the entry's number, written by that rule, is not read, and the first round names it (Steps 6)."
  - What is wrong: two requirements are joined by "and" in one bullet. They are "is not read" and "the first round names it", and each can be broken while the other holds. `docs/dev/skill-layout.md`, "Lists and tables", first bullet, makes them two bullets.
  - `skills/orchestration/plan/SKILL.md:67`, "is another entry's file: Steps 3 shows it with the draft, and it is neither copied nor removed", joins three such requirements the same way.
  - Failure scenario: a reviewer checking a later edit cannot tell where one rule ends, and a rewrite that keeps "not read" can drop the naming.

## 4. Behaviour

- **1. `grill` treats another entry's file at the number path as its own.**
  - Place: `skills/orchestration/grill/SKILL.md:49`, "and otherwise the rulings file `<ledger_root>/rulings/<number>.md` when it exists", and `:286`, "At every write of the rulings file, its first line is written as the heading line `# Rulings: <entry>`".
  - What is wrong: `grill` reads the file at the number path with no check of its heading, and at its first write it rewrites that heading to the current entry. `plan` "What it reads" 4 calls the same file another entry's file and leaves it alone. The change standard, rule 19, says a change leaves no two statements that contradict each other.
  - `check_config.py` runs only under `/ordo-init`. `grill` and `plan` do not run it, so a repository whose projects already share a ledger root still reaches this state, as does a file placed by hand.
  - Failure scenario: projects `api` and `web` share `.scratch`. `rulings/12.md` holds `# Rulings: 12. Api thing` from `/grill api/12`. `/grill web/12` reads it as `web/12`'s Rulings, so api's decisions are marked settled and not asked ("Steps", item 3). It writes web's answers into the file and rewrites the heading to `# Rulings: 12. <web's title>`. `/plan web/12` then finds number 12 and copies both entries' rulings into web's plan.
  - Fix: `grill` reads the file only when its heading names the entry as `plan` "What it reads" 4 says, and otherwise names it in the first round as another entry's file. Where `grill` then writes is a design point for the orchestrator, for example a stop.
  - Verdict: none on the brief's letter, since item 7 binds `plan` only. Case 4a is met for `plan`, and `grill` has no case.
- **2. `grill` stops reading carried rulings from files whose heading holds no number.**
  - Place: `skills/orchestration/grill/SKILL.md:53`, "and every other rulings file under `<ledger_root>/rulings/` whose heading line holds another number, is read for the bullets that name the entry".
  - What is wrong: the qualifier is wider than its purpose. The purpose (report, judgment call 3) is to stop reading this entry's own file when it stands at another path. "Holds another number" also drops every rulings file whose heading holds no number at all.
  - On the base, `grill` wrote `# Rulings: <entry>` with `<entry>` as typed, and `<entry>` "is matched against the entries by number or title" (`git show e4e0198:skills/orchestration/grill/SKILL.md`, lines 42 and 282). Title-only headings therefore exist in files the old skill wrote.
  - The glossary entry **carried ruling** still says "of another rulings file under the ledger root", which is now false for those files. This is a change of meaning the brief does not ask for (the change standard, rules 17 and 14).
  - Failure scenario: `rulings/one-object-per-file.md`, headed `# Rulings: One object per file`, holds a bullet naming entry 30 and ending "(the user)". `/grill 30` no longer carries that ruling and asks the decision again.
  - Fix: "whose heading line does not hold the entry's number".
  - Verdict: none on the brief's letter. It is a defect of the change by the change standard, rule 14 (a sentence the change makes false).
- **3. A rulings file whose heading names the entry by title only is neither read nor named.**
  - Place: `skills/orchestration/plan/SKILL.md:68` and `skills/orchestration/grill/SKILL.md:51`, "A file under `<ledger_root>/rulings/` at another path whose heading line holds the entry's number is not read".
  - What is wrong: the naming of files that are not read exists for files at an old path. A file written by the base `grill` under `/grill <title>` has a heading with no number, so it is neither read at the number path nor named.
  - Failure scenario: `rulings/12-one-object-per-file.md` holds `# Rulings: One object per file`. After the upgrade, `/plan 12` neither copies nor names it, and the entry's rulings are lost without a word. That is the failure ADR 0059's Context describes.
  - The brief's own sense of "names the entry" was "by number or by number and title", so this lies beyond the brief's letter.
  - Fix: also name, as not read, a file whose heading holds no number and whose title equals the entry's title.
  - Verdict: none on the brief's letter.
- **4. Two configuration files can share one ledger root unchecked.**
  - Place: `skills/orchestration/plan/SKILL.md:51`, "In the `projects:` form each project has a ledger root of its own, since a rulings file is named by the entry's number alone".
  - What is wrong: `plan` "What it reads" 1 also allows a `plan.yaml` in a project folder (`/plan apps/web/12`). Two such files whose `ledger_root` values resolve to one folder give two roadmaps' entries one `rulings/` folder. `check_config.py` checks one file, and the new sentence covers only the `projects:` form.
  - Failure scenario: `apps/web/plan.yaml` and `docs/plan.yaml` both name the root `.scratch`. Entry 12 of each roadmap writes and reads `.scratch/rulings/12.md`, and Behaviour 1 then applies.
  - The ruling chose the `projects:` form, so whether this case is worth a sentence or a check is the orchestrator's call.
  - Verdict: none.

On the six changes the report lists beyond the brief's literal text:

- **The `ordo-init/SKILL.md` line 359 edit.** It is justified. The configured-repository step lists every error the configuration check reports, and the change standard, rules 5 and 14, requires the new error there. It serves ruling 3.
- **The `merge-key` fixture.** It is justified. Without its own `ledger_root`, `tool-b` merges `tool-a`'s, and the new error would refuse a case that tests something else. The comment names the overridden keys, and the case's purpose is kept. Proof 1 covers its missing run on the unchanged script.
- **The error's shape.** `the projects a and b have one ledger_root: docs/.scratch` names the folder from the repository root and the projects, as ruling 3 asks. With three projects sharing one root it joins all their names with "and", and the head comment says "every project that names it". A project whose `ledger_root` already has an error is left out of the comparison, which is right, since it has no folder to compare.
- **`grill`'s carried rulings skipping files.** A narrowing is needed, but the one written is too wide; see Behaviour 2.
- **The "not read" files under `--self-rule`.** These are `plan` Open item A, the "The drafted step list" row and `grill` Steps 10. They are sound: without them, item 7 goes unmet when no round is sent.
- **`archive_root` not compared.** This is right. Ruling 3 names `ledger_root`, and rulings files stand only under `<ledger_root>/rulings/`.

Other checks:

- **The new test.** `projects-one-ledger` runs the script on a scratch repository whose two strings resolve to one folder, and it asserts the error text. It reads the behaviour it is written for. Its failing run on the unchanged script is quoted in the report and was reproduced above.
- **The number rule.** It is stated once, in `plan` "What it reads" 4. `grill` "What it reads" 6, `self-rule.md:115` and `plan-terms.md:110` name it without restating it.
- **Sentences the diff makes false.** The greps of `rulings/` and `rulings file` over `skills`, `docs`, `utils` and `README.md` find no other place that states the old path. The glossary **carried ruling** entry is the one false sentence (Behaviour 2). The **slug** entry still holds. No page states the versions outside `metadata.version`.
- **History and characters.** There is no history in any comment or docstring of `check_config.py` or `check_config.test.sh`, and no non-ASCII character in an added line.

## Declined to judge

- The builder's evidence `git show 082b363 -M -- .scratch/rulings | grep -n '^[-+]# Rulings'` for the heading that changed with the title. It is outside the git commands allowed here. The cases ruling already rests on it, and `git show 082b363 -M -- .scratch/rulings` would settle it.
- Whether a step of this plan that landed on main after e4e0198 already raised the version of `grill`, `plan`, `plan-orchestration` or `ordo-init`. The skill layout, "Frontmatter", allows one raise per plan. `git log --oneline e4e0198..main -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration skills/ordo/ordo-init` would settle it.
- The counts of the builder's first-run greps on the unchanged tree (seven lines with the exclusion, eight without). No decision rests on them, and `git grep -n 'rulings/<slug>' e4e0198 -- skills docs` would settle them.
- Whether `grill` and `plan` read right to the user on the rulings file ("What to build" 8). That is the user's reading at landing.
- Whether Behaviour 1, 3 and 4 are worth handling under the change standard's rule that a case is handled only when it has happened or a wrong answer costs something. That is the orchestrator's call; the cost of each is stated with it.

Reviewer usage: a8b65453be25f0c4e, claude-opus-5-5, 169524 tokens, 29 tool uses, 6.5 minutes.

## Repair round 1, refuted

```
$ printf '%s\0' <the ten changed files and agents/reviews/4-report.md> | xargs -0 perl -CSD -ne '<the brief's program>'; echo "exit=$?"
exit=0
$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit=$?"
ok: the plan-terms block equals the template
exit=0
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ python3 skills/ordo/ordo-init/templates/check_config.py docs/plan.yaml | tail -1      (exit status of the script itself: 0, as in the builder's report; my pipe hid it)
ok: docs/plan.yaml carries every required key, no unknown key, and every page it names exists
$ git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'; echo "exit=$?"      (D33's check as the user ruled it)
exit=1
$ git grep -n 'rulings/<slug>' -- skills docs utils README.md ':!docs/roadmap.md'; echo "exit=$?"
exit=1
$ git grep -n 'rulings/<slug>' -- skills docs utils README.md
docs/roadmap.md:27:- Gate: you read the rewritten `README.md` and approve it; [...rest of entry 27's gate line...]
$ git grep -n 'rulings/<number>.md' -- skills/orchestration/grill skills/orchestration/plan skills/orchestration/plan-orchestration/references/self-rule.md skills/ordo/ordo-init/templates/plan-terms.md
grill/SKILL.md:49, :173, :291, :394; self-rule.md:115, :142; plan/SKILL.md:66, :77; plan-terms.md:110   (a line in each of the four; 9 lines, as the report prints them)
$ git status --short | grep -v scratch | wc -l
10
$ git diff e4e0198 --numstat   -> 3/1, 1/1, 20/9, 1/1, 2/2, 22/4, 2/1, 10/1, 14/4, 1/1; wc -l -> 23, 190, 422, 530, 175, 262, 587, 357, 355, 138 (the report's table)
$ git grep -n "Another entry" skills/orchestration/grill/SKILL.md   -> lines 52, 107, 394 (as the report says)
$ git diff e4e0198 -- grill plan | grep '^+' | LC_ALL=C grep -c '[^ -~]'   -> 0
$ git diff e4e0198 --stat -- docs/roadmap.md docs/adr/0018*   -> nothing
```

Commands the report quotes, rerun:

```
# The fixtures on the unchanged script. Scratch layout in the scratchpad (rr1): `git show e4e0198:` of check_config.py, plan.yaml and plan.projects.yaml, with a copy of the new check_config.test.sh from which the single line `expect_error projects-one-ledger` was left out, so the suite runs on to the other cases.
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <rr1>/skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | grep 'FAIL\|PASS'
PASS: check_config.py scratch tests
```

That pass includes `expect_pass projects-two-ledgers` and `expect_pass merge-key` with the changed fixture, on the unchanged script. The report's claim for `merge-key` and `projects-two-ledgers` is reproduced. The first round's refuter reproduced the FAIL of `projects-one-ledger` on the unchanged script; the report's quote of it is unchanged by this round.

### Verdicts

Items of the brief's "What to build", as the cases ruling and the round amend them:

- 1: holds. `grill` "What it reads" 6 names `<ledger_root>/rulings/<number>.md` and the number by `plan` "What it reads" 4, reads the file only when its heading's number equals the entry's, and raises the stop "Another entry's rulings file" at Steps 2 otherwise (round ruling 1). "Writing what settled" 1 writes `# Rulings: <number>. <title>` at every write. See Findings 1 and 2 for edges of the stop and of the title-only files.
- 2: holds. `plan` "What it reads" 4 gives the path, the number rule and two worked examples; Steps 1 has no hunk. See Finding 4 on the number-rule bullet's form.
- 3: holds. `self-rule.md` lines 115 and 142.
- 4: holds. `plan-terms.md:110` and `docs/glossary.md:115` are one hunk each and the sync exits 0 (it passed on the base too, so it shows the block stays in sync, not the change).
- 5: holds. The grill without the exclusion prints only `docs/roadmap.md:27`. Roadmap line 50 and ADR 0018 are not in the diff.
- 6: holds. `grill` 3.0.0, `plan` 7.0.0, `plan-orchestration` 9.0.1, `ordo-init` 6.0.0 (round ruling 8; `git diff` of each `SKILL.md` line 5).
- 7, first bullet as cases ruling 2 replaces it: holds. `plan` compares the number only; another entry's file is shown at Steps 3 and neither copied nor removed.
- 7, second bullet, as round ruling 3 widens it: partial. A title-only file whose title equals the entry's is named as not read, but the path it gives to "read it at" does not make it read. See Finding 1.
- 8: not applicable. It is the user's reading at landing.
- Cases ruling 3 (check_config error, head comment, two test cases, `plan` "What it reads" 1) and ruling 7 (paths, two verify lines): hold; both verify lines pass.
- Round ruling 4 (no new check; the sentence in `plan` "What it reads" 1): holds as ruled.
- Round ruling 5 (ADR 0059 Consequences): holds on its letter. See Finding 5.

Cases of the brief's "Cases", as the rulings amend them:

- Case 1, the greps: met. With the exclusion, nothing; without it, only `docs/roadmap.md:27`; the `<number>` grep prints a line in each of the four; D33's check as the user ruled it prints nothing.
- Case 2, the number rule: met, by reading `plan` "What it reads" 4: `27` and `27.` give `27.md`, `3.A` gives `3-a.md`, `7.A` gives `7-a.md`, `2.E` gives `2-e.md`, `2.E.A.` gives `2-e-a.md`, `5` gives `5.md`, `13` gives `13.md`, `web/12` gives `12.md` under `web`'s `ledger_root`.
- Case 3, a title changed by `grill`'s own diff: met. Same path by number; the heading takes the new title at the write.
- Case 4a, `rulings/12.md` headed `# Rulings: 13. Another entry`: met for `plan` (shown at Steps 3, not copied or removed) and for `grill` (the stop, nothing read or written), apart from the open-plan case of Finding 2.
- Case 4b, `check_config.py` with `.scratch` and `./.scratch`: met, by the test `projects-one-ledger`, which passes after the change (the suite's tail line above); its FAIL on the unchanged script was reproduced in the first run.
- Case 5, `rulings/12-old-title.md` headed `# Rulings: 12`: met. `plan` "What it reads" 4 and Steps 3, and `grill` "What it reads" 6, Steps 6 and Steps 10, name it as not read with `rulings/12.md`.
- Case 6, the sync: met.
- Round case, `grill` on `rulings/12.md` headed `# Rulings: 13. Another entry`, entry 12: met by reading (stop at Steps 2, before any write).
- Round case, `plan` on `rulings/12-one-object-per-file.md` headed `# Rulings: One object per file`, entry `12. One object per file`: partial. It is named as not read with `rulings/12.md`, as the case says, but see Finding 1 on what that path then does.
- Round case, `rulings/one-object-per-file.md` (title-only heading, another title) holding a bullet that names entry 30: met. It is not excluded by the qualifier, so `/grill 30` carries the bullet.

### Findings

Closure of the first report's findings, each judged on my own rerun or read:

- Behaviour 1 (grill reading another entry's file): closed. No check was removed; the stop, its Stops row, the opening "first four rows" and Steps 2 are in the diff. Edges are Findings 2 and 3.
- Behaviour 2 (carried-rulings qualifier): closed. The qualifier is "does not hold the entry's number"; the glossary **carried ruling** entry ("of another rulings file under the ledger root") is read against it and holds.
- Behaviour 3 (title-only headings): closed on its letter, with the defect of Finding 1.
- Behaviour 4 (two `plan.yaml` files, one root): closed as ruled, with a sentence and no check; the sentence is in `plan` "What it reads" 1 and the ADR.
- Standards 1 (ADR): closed on its letter; Finding 5 on where the text stands.
- Standards 2 (joined bullets): closed for `grill` old line 51 and `plan` old line 67, which are now several bullets; open for the number-rule bullet, Finding 4.
- Proof 1 (fixtures on the unchanged script): closed; reproduced above.
- Builder's added sub-bullet in `grill` "What it reads" 6, "A file this item names as not read is not read for carried rulings either.": judged sound. Without it, a title-only file of the entry itself (round ruling 3) holds no number, so ruling 2's qualifier would read it for carried rulings while the first round says it is not read; that is a contradiction by the change standard, rule 19. It reaches only files the item names as not read: another entry's file is a stop, and a title-only file of another title is still read (round case above). No finding.

New findings:

- **1. Behaviour, `skills/orchestration/grill/SKILL.md:54` and `skills/orchestration/plan/SKILL.md:76-77`, and `grill:173`.**
  - Hunk: "A file under `<ledger_root>/rulings/` whose heading line holds no number, its text after `# Rulings: ` being the entry's title, is not read." and "saying that it is not read and giving the path `<ledger_root>/rulings/<number>.md` it would be read at."
  - What is wrong: for a title-only file the path is not the missing condition. A file is read at `<number>.md` only when its heading's number equals the entry's, so a title-only file renamed to `12.md` is still not read, not another entry's file, and not named by any rule except this same one, which then gives its own path as the path it would be read at. The round brief's case asks for exactly this text for the title-only file, and the text it asks for does not hold for that file.
  - Failure scenario: `rulings/12-one-object-per-file.md` headed `# Rulings: One object per file`. `/plan 12` names it with "would be read at `rulings/12.md`". The user renames it. `/plan 12` neither reads nor copies it, and names it again with its own path. Also `/grill 12` finds `rulings/12.md` present, so "created when it is absent" does not apply; it writes into it and rewrites the heading to hold the number, and the bullets the file held unread become the entry's rulings without the user having been told.
  - Fix, for the orchestrator to word: for a title-only file the naming says that the heading has to be changed to hold the entry's number as well as the path; and a file at the number path whose heading holds no number is neither read nor written by `grill` until then (or is another stop).
  - Verdict: item 7 second bullet and the round case on `12-one-object-per-file.md` partial.
- **2. Spec, `skills/orchestration/grill/SKILL.md:52` and the Stops row at `:394`.**
  - Hunk: "A file at that path whose heading line holds another number is the stop "Another entry's rulings file" ("Stops"), raised at Steps 2." and the row's "The file at `<ledger_root>/rulings/<number>.md` has a heading line that holds another number".
  - What is wrong: the bullet sits under item 6, whose rulings file is read "otherwise", that is only when no plan is open for the entry; the row has no such condition. With a plan open, `grill` reads and writes the plan's `## Rulings` and never the rulings file.
  - Failure scenario: a plan is open for entry 12 and another entry's `rulings/12.md` stands at the shared root. `/grill 12 --ruling ...` or a re-run stops on a file it does not read or write, until the user moves it.
  - Fix: say in the bullet and the row that the stop is raised only when no plan is open for the entry.
- **3. Behaviour, `skills/orchestration/plan-orchestration/references/self-rule.md:80`.**
  - Hunk (unchanged by the round): "The taking of the next entry stops ... at a stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule`, and at a refusal of `/grill` or `/plan`."
  - What is wrong: the new stop is a stop of `grill`, not a round of the six kinds and not a refusal, so the line that says where an unattended run stops does not name it (the stop "A lookup agent served another model" is not named either).
  - Failure scenario: `/grill <entry> --self-rule` run by the loop meets another entry's file; the page says nothing about what the loop does, and a session may take the entry as a refusal or go on.
  - Whether to word it here is the orchestrator's call, since the lookup-model stop already stands in the same gap.
- **4. Standards, `skills/orchestration/plan/SKILL.md:67`.**
  - Hunk: "`<number>` is the entry's number as the roadmap writes it before the title, a full stop that ends it dropped and a project prefix dropped as Steps 1 drops it, written in lower case with each run of characters other than letters and digits as a single `-`."
  - What is wrong: three transformations joined by "and" and a comma in one bullet (drop the full stop, drop the project prefix, lower-case with `-` runs), each of which can be broken while the others hold. `docs/dev/skill-layout.md`, "Lists and tables", first bullet; round ruling 6 asked for every new or changed bullet of the diff to be checked. The report keeps it whole as "one rule with its qualifiers"; the three are separate transformations, not qualifiers.
  - Failure scenario: a later edit changes the prefix handling and keeps the rest; a reviewer cannot tell which transformation the bullet's checks refer to.
  - The same reading applies to `grill:51` ("read only when ... as the `plan` skill's ... says: the number in the heading equals the entry's"), which is one rule with its condition and which I leave.
- **5. Standards, `docs/adr/0059-a-rulings-file-is-named-by-its-entry-s-number.md`, Decision against Consequences.**
  - Hunk: Decision is two bullets; the added paragraph under Consequences states "`plan` copies the file at the number path only when the number in its heading equals the entry's, and `grill` stops on another entry's file there ... each `plan.yaml`, has a ledger root of its own".
  - What is wrong: `docs/adr/template.md` says the Decision is "stated so a change can be checked against it" and Consequences hold what becomes easier, harder and what needs doing. The heading rule, the stop and the one-ledger-root-per-file rule are decisions, and a change checked against the Decision does not see them.
  - Failure scenario: a later change that makes `plan` read a file whatever its heading holds passes a check against the Decision section.
  - Fix: the heading rule and the ledger-root rule move into Decision as bullets, Consequences keep the effects (the refusal of `check_config.py`).

### Declined to judge

- The user's reading of `grill` and `plan` on the rulings file ("What to build" 8), since it is the user's check at landing.
- Whether Findings 3 and 4 are worth acting on under the change standard's rule that a case is handled only when it has happened or a wrong answer costs something, which is the orchestrator's call; the cost of each is stated with it.
- Whether a plan step landed on main after e4e0198 already raised the version of `grill`, `plan`, `plan-orchestration` or `ordo-init` (the skill layout allows one raise per plan); `git log --oneline e4e0198..main -- <the four skill folders>` would settle it, and it is outside the git commands allowed here.
- The builder's `git show 082b363 -M -- .scratch/rulings | grep '^[-+]# Rulings'`, since it is outside the git commands allowed here; cases ruling 1 already rests on it.

Reviewer usage: a17fd6fa34a365aba, claude-sonnet-5-5, 135553 tokens, 18 tool uses, 3.2 minutes.

## Closed

Each finding of the run over repair round 1, fixed on main at landing:

- 1 (a title-only file named with a path that does not make it read): `grill` "Steps 6" and `plan` "What it reads" 4 now say the file is read once it stands at `<ledger_root>/rulings/<number>.md` with a heading line `# Rulings: <number>. <title>` that holds the entry's number; a file at that path whose heading holds no number is now the stop "Another entry's rulings file" in `grill` and another entry's file in `plan`, so `grill` neither reads nor writes it.
- 2 (the stop raised with a plan open): `grill` "What it reads" 6, Steps 2 and the Stops row raise the stop only when no plan is open for the entry; the row's "What resumes it" adds writing the entry's number into the heading line.
- 3 (the unattended loop's stops): `references/self-rule.md` line 80 names a stop of `/grill` other than a round, such as "Another entry's rulings file".
- 4 (the number rule in one bullet): `plan` "What it reads" 4 gives the three changes as three sub-bullets.
- 5 (rules in Consequences): ADR 0059's Decision gains the heading rule and the one ledger root per `plan.yaml` and per project; Consequences keep the effects.
- The user's reading of `grill` and `plan` (brief item 8): raised as Open item E.
