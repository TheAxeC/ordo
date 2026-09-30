# Step 12 refuter report (on .agents/worktrees/2e-12, base 37b0d80444953d83f44e76716f048fa1998f9b5d)

A page this report cites (the rules file, a standard, a skill's text) is named with its section. A finding in the diff keeps its `file:line` in the worktree.

## Verification (rerun by the reviewer)

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

Commands the report quotes, rerun:

```
$ ls skills/grill/SKILL.md skills/grill/references/decision-form.md
skills/grill/references/decision-form.md
skills/grill/SKILL.md
$ git ls-tree -r --name-only 37b0d80 -- skills/grill
(nothing: no skills/grill at the base)
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
748 skills/grill/SKILL.md
726 skills/land/SKILL.md
386 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
776 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1022 skills/spec/SKILL.md
$ git grep --untracked -n "/grill" -- skills README.md docs
README.md:32, skills/grill/SKILL.md:10, :15, :16, :17, :206, :207, :208, :209, skills/ordo-help/SKILL.md:52, skills/plan/SKILL.md:25, skills/plan/SKILL.md:64, skills/roadmap/SKILL.md:28
$ git grep -n "/grill" 37b0d80 -- skills README.md docs
37b0d80...:skills/plan/SKILL.md:63:   - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.
$ git grep -n -w grill -- README.md
README.md:7, README.md:16, README.md:32, README.md:86 (for skill in grill land ordo-help ...)
$ git grep -n -w grill 37b0d80 -- README.md; echo rc=$?
rc=1
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ LC_ALL=C grep -n '[^ -~]' <the nine changed and new files>; echo rc=$?
rc=1 (no output)
$ git status --short
 M README.md
 M docs/glossary.md
 M skills/ordo-help/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/templates/docs/glossary.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
?? .scratch/2-e-grill/agents/reviews/12-report.md
?? skills/grill/
```

## Verdicts

Items of the brief's "What to build":

- 1: violated, Spec 1 (no effort preflight for the lookup agent), Spec 2 (a plan-terms clash is changed in the installed `repo-setup` copy), Standards 1 (subsection items without completion criteria), Standards 3 (the skill cites "ruling E (b)" of Ordo's ledger). The rest of item 1 is present: every requirement of the brief has a place in `skills/grill/SKILL.md` (read line by line against the item), the step-7 sentence is verbatim at line 226 (`grep -F` finds it in `skills/grill/SKILL.md:226`, `skills/spec/templates/brief.md:5`, `design-principles.md:3`), `metadata.version: "1.0.0"`, description 748.
- 2: holds, `skills/grill/references/decision-form.md` has a round of two decisions (D4, D5), the answers, two Rulings bullets, a glossary line and the next round's `## D6. Record D5 as an ADR`, on a neutral `tally` example; `SKILL.md:73` names it by path from Steps 5. Its D6 answer writes no Rulings bullet, Standards 7, which makes case 9 partial.
- 3: holds, the nine new or changed entries are in `plan-terms.md` in alphabetical place, `sync_rules.py --only glossary` prints `ok`; the wording of **round, of an interview** conflicts with the skill's use, Standards 2, which makes case 10 partial.
- 4: holds, the README intro (line 7), table row (16), sequence line (32) and install loop (86), `ordo-help:52`, `plan:25`, `roadmap:28`, and `templates/docs/glossary.md:3` are as the brief gives them.

Cases of the brief's "Cases":

- `ls` of the two new files: met, both absent at the base (`git ls-tree` prints nothing), both present now.
- Description length: met, `748 skills/grill/SKILL.md`.
- `git grep --untracked -n "/grill"`: met, base prints only `skills/plan/SKILL.md:63`; now the Quick start lines, README sequence, ordo-help sequence, plan and roadmap Use instead rows, plus the intro line and four Stops rows.
- `sync_rules.py --only glossary` prints ok: met.
- Reading, the skill against `docs/dev/skill-layout.md`: partial, the subsection items of Steps do not end on completion criteria and a separate "done" item is not an action (Standards 1); bold used outside a label (Standards 5); two rules written twice (Standards 6).
- Reading, the skill against each requirement of item 1: partial, the lookup agent is not launched "as the `spec` skill's brief-check agent is" in its effort checks (Spec 1), and the plan-terms clash is routed to the installed copy where the brief says Ordo's `plan-terms.md` (Spec 2).
- `git grep -n -w grill -- README.md`: met, lines 7, 16, 32, 86.
- Reading, the dry run on entry 3: partial, the builder's dry run exists and follows the skill's text, but it did not name the open choices the text leaves for the roadmap-diff and "record as ADR?" decisions' reference line under a bar (Spec 3, visible in its own D5, whose "Industry:" line cites `skills/roadmap/SKILL.md:157`), nor whether those decisions write a Rulings bullet (Standards 7).
- Reading, `references/decision-form.md` against item 1: partial, D6's answer writes the ADR but no Rulings bullet, which Steps 8 and "Steps / Writing what settled" 1 require of every settled answer (Standards 7).
- Reading, every term against `docs/glossary.md`: partial, bare "round" is used 28 times in the interview sense while the entry the step added says "the bare "round" is a repair round" (Standards 2).

## 1. Spec

1. `skills/grill/SKILL.md:111-117` ("Looking up a fact" 2 and 3): "A lookup is made by the session's own reads, or by an agent the skill starts, launched as the `spec` skill's brief-check agent is. - It is the effort agent `ordo-<reviewer_effort>`, on the model `reviewer` names." What is wrong: every other skill that starts an effort agent first checks that the runner lists `ordo-<level>` and that `CLAUDE_CODE_EFFORT_LEVEL` is unset, and refuses with "The configured effort cannot apply" (`spec` Steps 1 and Stops, `refute` Steps 1 and Stops, `plan-orchestration` Steps 1 and Stops; `git grep -n CLAUDE_CODE_EFFORT_LEVEL -- skills` finds it in those three and `ordo-help`, never in `grill`). `grill` has neither the check nor the refusal row. Failure scenario: a user with `CLAUDE_CODE_EFFORT_LEVEL=low` in the environment runs `/grill 3`; the lookup agents run at low effort although `reviewer_effort` is `high`, and the reference lines of the round rest on those facts with nothing shown; with no `ordo-high` installed, the launch fails and the skill has no stop or refusal to name it. Verdict: item 1 violated; case "the skill against each requirement of item 1" partial.

2. `skills/grill/SKILL.md:155`: "a clash with one is put to the user as a decision whose change is made in the `repo-setup` skill's `templates/plan-terms.md`." What is wrong: the brief says the change "is made in Ordo's `plan-terms.md`". In any repository other than Ordo, "the `repo-setup` skill's `templates/plan-terms.md`" is the installed copy, which under `utils/pin.sh` is a link into `~/.local/share/ordo-stable`, and the change standard's "Rules this repository already states" says the pinned worktree is never edited. Failure scenario: `/grill` in cathedra settles a clash with **frontier** by changing the plan term; the agent edits `~/.claude/skills/repo-setup/templates/plan-terms.md`, writing into the pinned worktree; the next pin discards it and every other repository's sync is changed meanwhile. The text should route the change to the Ordo repository (for example, listed at the end for the user to carry to Ordo), which is the orchestrator's wording to choose. Verdict: item 1 violated; case "the skill against each requirement of item 1" partial.

3. `skills/grill/SKILL.md:187` against `:191-195`: "The roadmap diff and "record as ADR?" decisions have every part, their reference line citing the page that governs them." against "Under `novel`, it is labelled "Novel:" and cites both, and each option goes beyond them and says what would show it works" and "each option names the clause of each one [design_references] that bears on it". What is wrong: the two rules contradict for these decisions. Under `industry` the label "Industry:" promises what production projects ship, while the line cites a page of this repository; under `novel` no option of "write this diff" or "record it" can go beyond the state of the art. The builder's own dry run shows it: its D5 reads "**Industry:** the `roadmap` skill's Rules say ... (`skills/roadmap/SKILL.md:157`)". Failure scenario: under `--bar novel`, the agent drawing "Record D5 as an ADR" either labels a citation of `docs/adr/README.md` "Novel:" or invents options that "go beyond" to satisfy "The design bar", and cites a WCAG clause for a roadmap diff when `design_references` lists WCAG. Verdict: case "the dry run" partial (the dry run did not name this open choice).

4. `skills/grill/SKILL.md:158-161` and `:101`: "An answer that changes the entry's goal, gate or text is drafted into the entry ..." and "An entry under "Not yet specified" whose gate the interview settles is not moved, and the gate is recorded in the ruling of item 1." with "Name `/roadmap add <entry>` ...". What is wrong: the first bullet drafts a changed gate into the entry, while the `roadmap` skill's Rules say an entry under "Not yet specified" states its goal and what must be known, not a gate; and the hand-off loses the gate: `roadmap` "Steps / add" 1-3 drafts the gate itself and its "What it reads" does not read the rulings file. Failure scenario: `/grill 7` settles entry 7's gate as D3; the user types `/roadmap add 7` as told; `roadmap` drafts a different gate, the user approves it; `/plan 7` then copies the roadmap's gate into "## Gate" and the D3 bullet with the other gate into Rulings. The brief dictated "the end names `/roadmap add <entry>`", so this is the design's gap; the end could print the settled gate for the user to give `/roadmap add`, which is the orchestrator's to decide. No verdict.

5. `skills/grill/SKILL.md:138-142` ("A plan already open") with `:157-162`: only a change to a step's text is listed at the end. What is wrong: when a plan is open, an answer that changes the entry's goal or gate is written into the roadmap on the user's yes, but `plan.md`'s "## Goal" and "## Gate", which `plan` Steps 2 copied from the entry, are neither changed nor listed. Failure scenario: an interview on an open plan narrows the gate; the roadmap holds the new gate, the plan's closing step runs `/roadmap done` with the output of the old gate from `plan.md`. The brief is silent on this; the orchestrator decides whether the end lists it. No verdict.

6. `skills/grill/SKILL.md:66-67` and `:82`: "A decision shown before and not answered is asked again under a new number." and "The numbers continue ... after every number shown in this interview." What is wrong: Steps 8 writes only settled answers, so after a new session or a compaction nothing written records which numbers were shown; the recomputed round restarts after the highest Rulings bullet and reuses numbers the user has on screen for other decisions. Failure scenario: round 2 showed D7 to D9; the session compacts; the user answers "D8 => B"; the new session has redrawn D7 to D9 as other decisions and writes B against the wrong one. The requirement is the brief's and the skill meets its letter; a written record of the shown round (or a rule that a resumed interview discards answers to numbers it did not show in this session) would close it. No verdict.

7. `.scratch/2-e-grill/agents/reviews/12-report.md` (whole): the report has no section of "every judgment call the brief left open" (change standard, rule 7). The builder's choices appear nowhere as choices: the split into required and optional keys (`SKILL.md:32-33`), the heading line `# Rulings: <entry>` (`:147`, mentioned only among the dry run's open choices), the extra Use instead row `/ordo-init` (`:24`), "What it reads" 8 (`:50`), and the Rules bullet "A decision is the user's" (`:224`). Failure scenario: the orchestrator and Axel, reading the report, take these for the brief's text and do not weigh them. No verdict.

## 2. Proof

1. Report, "Reading: `skills/grill/SKILL.md` against `docs/dev/skill-layout.md`", Steps: "Each step and each subsection item ends on its completion criterion ("The step is done when ...")." What the read shows: "Looking up a fact" items 1-4 (`SKILL.md:110-118`), "Terms and claims" 1-3 (`:123-126`), "An answer that contradicts" 1-2 (`:131-135`) and "A plan already open" 1-2 (`:140-141`) do not; each subsection has a separate last item that states the criterion. The case's result and Axel's reading of the skill against the layout rest on this claim. Failure scenario: Axel, reading the report's "Holds", does not look for the defect Standards 1 names. Verdict: case "the skill against `docs/dev/skill-layout.md`" partial.

2. Report, "Reading: every term of the skill against `docs/glossary.md`": "Bare "round" is used in the interview sense, which the new term **round, of an interview** defines." What the read shows: that entry (`skills/repo-setup/templates/plan-terms.md`, `docs/glossary.md:81`) ends "the bare "round" is a repair round". The case rests on this claim. Verdict: case "every term against `docs/glossary.md`" partial, Standards 2.

## 3. Standards

1. `skills/grill/SKILL.md:108-142`: the four subsections of Steps other than "Writing what settled" end each list with an item such as "5. The step is done when each fact a decision needs is in hand ..." What is wrong: `docs/dev/skill-layout.md` "Writing for an agent": "Each item of Steps ends on its completion criterion"; "Sections, in order" row 5: "one action per item", and a criterion is not an action. "Steps / Writing what settled" (`:146-173`) does it right, each item ending "The item is done when". Failure scenario: an agent running "Looking up a fact" reads item 3 (served-model check) as done without a criterion and goes on to item 4 while the check has not been made. Verdict: item 1 violated; case "the skill against `docs/dev/skill-layout.md`" partial.

2. `skills/repo-setup/templates/plan-terms.md` (**round, of an interview**) and `docs/glossary.md:81`: "one message in which `grill` asks the whole frontier, ending the turn to wait for the answers; the bare "round" is a repair round." against `skills/grill/SKILL.md`, 28 bare uses (`grep -n -w -o round | wc -l`), such as `:71` "waits for a later round" and `:89` "asked again in the next round". What is wrong: `docs/dev/skill-layout.md` "Writing for an agent": a term the glossary defines is used only in a sense it defines there; the entry says the bare word is a repair round. Failure scenario: a reviewer or `/plan-retro` holding `grill` to the glossary, as the layout tells them, reads "the next round" in "Terms and claims" as a repair round, or files a finding for each bare use. Either the entry says that inside `grill` the bare word is a round of an interview, or the skill qualifies it; the wording is the orchestrator's. Verdict: case "every term against `docs/glossary.md`" partial.

3. `skills/grill/SKILL.md:134` "Reopen the ADR, by a superseding record as ruling E (b) says" and `:171` "A record that changes a decision of an ADR in force supersedes it as ruling E (b) says." What is wrong: "ruling E (b)" is a line of Ordo's plan 2.E ledger (`.scratch/2-e-grill/plan.md` Rulings), which no repository `grill` runs in holds and which is archived when 2.E closes; `README.md` first paragraph and the change standard's "Rules this repository already states": the skills carry no project name and no path; `docs/dev/skill-layout.md` "History in the skill". No other skill cites a plan ruling (`git grep -n -E "ruling [A-Z]( \(|\b)" -- skills` finds only `grill`). The rule is stated in the ADR folder's `README.md` ("A decision that changes gets a new ADR that supersedes ...", `skills/repo-setup/templates/docs/adr/README.md:5`), which the text could name. Failure scenario: `/grill` in cathedra looks for "ruling E (b)" in cathedra's own Rulings, finds cathedra's unrelated "E (b)" or nothing, and either follows the wrong line or stops. Verdict: item 1 violated.

4. `skills/grill/SKILL.md:83`: "Only a `D<n>` that opens a bullet counts, since a Rulings line of another plan holds `D1 (a)` inside its text." What is wrong: the reason names a fact of Ordo's own ledger (`.scratch/2-f-diagnose/plan.md:34`, which does hold "D1 (a)" inside a line, reproduced), an incident rather than the general reason (a `D<n>` inside a line can cite a decision of another session). `docs/dev/skill-layout.md` "History in the skill"; `README.md` first paragraph. Failure scenario: a reader in another repository looks for "another plan" holding `D1 (a)` and finds none, and cannot tell whether the rule applies. No verdict.

5. `skills/grill/SKILL.md:63`: "since the glossary's **question, the** is another thing." What is wrong: `docs/dev/skill-layout.md` "Lists and tables": "Bold marks a list item's label (`- **Label.** ...`) and nothing else." Failure scenario: none beyond the rule; a later pruning pass (roadmap entry 23) flags it. No verdict.

6. `skills/grill/SKILL.md:223` "A fact is looked up, never asked." with `:110` "A fact from the repository, another repository or a published source is looked up, and the user is asked for decisions only."; `:225` "Every answer is written in the turn it settles, before the next round is drawn up." with `:93` "in the same turn as the answer and before the next round is drawn up". What is wrong: `docs/dev/skill-layout.md` "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in." The brief asked for both the step content and the Rules bullets, so the step item could name "Rules" instead of restating. Failure scenario: a later edit changes one copy, and the agent cannot tell which holds. No verdict.

7. `skills/grill/references/decision-form.md:74`: "On `D6 Agree`, the record is written in the same turn in the folder `adr` names ..." with no Rulings bullet for D6, against `skills/grill/SKILL.md:93` "Write each settled answer, as "Steps / Writing what settled" says" and `:146-148` (every settled answer is one bullet `- D<n> ...`). What is wrong: the change standard, rule 19, "A change leaves no two statements that contradict each other"; the worked example and the steps disagree on whether a "record as ADR?" (and a roadmap-diff) answer writes a Rulings bullet. Failure scenario: an agent following the example writes no bullet for D6; after a compaction the redrawn tree finds D6 unsettled (for a "B, keep it a Rulings line" answer nothing records it) and asks it again, and the next interview may reuse the number D6. Verdict: case "`references/decision-form.md` against item 1" partial; case "the dry run" partial.

8. `skills/grill/SKILL.md:169` "its alternatives rejected the other options with their cons" and `:182` "`Recommend <letter>.` with its reason, chosen because it is the better design." against `docs/adr/README.md:3` / `skills/repo-setup/templates/docs/adr/README.md:3` "A choice is justified from this repository's goals, never from what another project does.", `templates/docs/adr/template.md` "- <Alternative>: <why, from this repository's goals>." and `templates/docs/dev/design-principles.md:13` "A mechanism is justified from the repository's own goals (<the goals>), never from what another project does." What is wrong: under `industry` the reference line cites what other projects ship, and neither the recommendation's reason nor the record's "alternatives rejected" is told to come from the repository's goals, so the record `grill` writes can break the folder's own README and a standards page. Failure scenario: an interview recommends A "since Vale and every production linter ship it", the record's alternatives rejected carry that con, and the next `/spec` ADR check or reviewer reads a record that the folder's README forbids. How ruling G2's reference line and this sentence fit is partly the user's (see "Declined to judge"). No verdict.

9. `skills/plan/templates/plan.yaml:12` and `:27` ("claude:<model> /refute runs on."; "The effort a reviewer and a brief-check agent run at"), and the glossary entries **effort agent** ("a reviewer and a brief-check agent as `ordo-<reviewer_effort>`") and **reviewer**. What is wrong: `grill`'s lookup agent now also runs on `reviewer` and `reviewer_effort`; the change standard, rule 14, "A change carries to every place that names it". `ordo-init` shows these comments as what the key is (`ordo-init` "What it reads" 1). These paths are outside the brief's list, so this is for the orchestrator (a fix at landing or a Doc text). Failure scenario: a user lowers `reviewer_effort` to cut `/refute`'s cost and does not know `grill`'s lookups follow. No verdict.

10. `skills/repo-setup/templates/plan-terms.md` (**frontier**): "every decision of the design tree whose prerequisites are settled, all asked in one round." against `skills/grill/SKILL.md:70-72`: a frontier decision that waits on a running lookup is not in the round. What is wrong: the definition states a rule the skill does not follow (skill-layout "Writing for an agent", terms). Failure scenario: an agent following the glossary asks a decision whose fact is still being looked up. No verdict.

## 4. Behaviour

1. `skills/repo-setup/templates/plan-terms.md` (seven entries added, **ruling** and **rulings file** changed): what a host sees change is that the next `/repo-setup sync` in every repository with the plan-terms block (game-engine, cathedra) writes these nine lines into its glossary. The report gives the changed lines but not this effect, with no before and after for the other repositories. Failure scenario: the user runs `/repo-setup sync` in game-engine after the next pin and meets an unannounced glossary diff naming a skill he may not have installed there. No verdict.

## Declined to judge

- The URLs in `references/decision-form.md` and in the dry run (peps.python.org, toml.io, pubs.opengroup.org, unicode.org, cognitect.com, docs.vale.sh, platform.claude.com) and their quoted text: not fetched in this review, which has no web access in its brief; not verifiable here.
- How ruling G2's mandatory reference line fits the ADR README's "never from what another project does" (Standards 8): which one gives way is the user's call.
- Whether the Resuming requirement (Spec 6) and the "Not yet specified" hand-off (Spec 4) should change: both follow the brief's own text; the fix is the orchestrator's or the user's.
- `sync_rules.py --only glossary` on the unchanged tree (the report's first run says ok): not rerun at the base, since the base is not checked out here.
- The skill as Axel reads it against `docs/dev/skill-layout.md`: the step's own check, his.

Reviewer usage: claude-opus-5-5 (served model, from its transcript); 193419 tokens, 42 tool uses, 526 s (completion notice); $1.78-5.38 at Opus rates.


## Repair round 1, refuted

Reviewed in /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-12 against base 37b0d80444953d83f44e76716f048fa1998f9b5d. The round's delta is the diff since the base compared with `.scratch/2-e-grill/agents/reviews/12-round-0.diff`. `git status --short` lists `.agents/plan.yaml`, `README.md`, `docs/glossary.md`, `skills/ordo-help/SKILL.md`, `skills/plan/SKILL.md`, `skills/plan/templates/orchestrator-state.md`, `skills/plan/templates/plan.yaml`, `skills/repo-setup/templates/docs/glossary.md`, `skills/repo-setup/templates/plan-terms.md` and `skills/roadmap/SKILL.md` as modified, and `.scratch/2-e-grill/agents/reviews/12-report.md` and `skills/grill/` as untracked. Every path is in the brief's list or in the list the round widened it to.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
rc=0
```

The commands the round's report section quotes, and the brief's cases, rerun:

```
$ git grep -n "ruling E" -- skills; echo "rc=$?"
rc=1
$ grep -n -w -o round skills/grill/SKILL.md | wc -l
      31
$ ls skills/grill/SKILL.md skills/grill/references/decision-form.md
skills/grill/references/decision-form.md
skills/grill/SKILL.md
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
748 skills/grill/SKILL.md
(the other ten counts: land 726, ordo-help 386, ordo-init 632, plan-orchestration 788, plan-retro 616, plan 477, refute 951, repo-setup 776, roadmap 997, spec 1022)
$ git grep --untracked -n "/grill" -- skills README.md docs
README.md:32, skills/grill/SKILL.md:10, :15, :16, :17, :218, :219, :220, :221, skills/ordo-help/SKILL.md:52, skills/plan/SKILL.md:25, :64, skills/plan/templates/orchestrator-state.md:14, :27, skills/plan/templates/plan.yaml:12, :27, skills/roadmap/SKILL.md:28
$ git grep -n -w grill -- README.md   (also run with --untracked, same output)
README.md:7, README.md:16, README.md:32, README.md:86 (for skill in grill land ordo-help ...)
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ LC_ALL=C grep -n '[^ -~]' <the twelve changed and new files and 12-report.md>; echo "rc=$?"
rc=1 (no output)
$ grep -n -i comment skills/ordo-init/templates/check_config.py
(nothing)
$ grep -n "#" skills/ordo-init/templates/check_config.py   (relevant line)
92:        m = re.match(r"^([a-z_]+):\s*(.*?)\s+#\s*(required\.|optional, default (.*?)\.\s)", line)
$ awk over SKILL.md: every numbered item between "## Steps" and "## The decision form", checking each for "done when"
24 items, each "ok"
$ grep -rl "ordo:plan-terms" /Users/axelfaes/workspace/{game-engine,cathedra,research-hub} --include='*.md' (build, .git, node_modules excluded)
(nothing for any of the three)
$ ls /Users/axelfaes/workspace/game-engine/docs/glossary.md /Users/axelfaes/workspace/cathedra/docs/glossary.md
No such file or directory (both)
```

### Per-point closures (round brief `12-round-1.md`)

1. Effort checks: closed as the point says. "Steps / Looking up a fact" 1 (`SKILL.md:113-115`) holds both checks, and a failing check means the session makes the lookups with its own reads and the next round gives the cause. There is no Stops row, which is correct because nothing waits on the user. The rewrite of old item 2 goes beyond the point (Spec 1).
2. Plan-terms clash: closed. `SKILL.md:163-164` says no copy of `templates/plan-terms.md` is changed, the answer is written as a Rulings bullet, and Steps 10 (`:103`) lists the change for the Ordo repository.
3. Repository-page decisions: closed in `SKILL.md`. `:191`, `:198` and `:202` say it, and the example's D6 carries `**Rule:**`. The glossary entry **reference line** was not carried (Standards 1), and the label departs from a plan ruling (Spec 4).
4. Not yet specified: closed for the gate (`SKILL.md:167`, `:170`, `:104`). The narrowing to "an entry with a gate" also stops goal and text changes on such an entry (Spec 2).
5. Open plan, goal and gate: closed (`SKILL.md:149-150`, `:102`).
6. Resuming: closed as the point words it (`SKILL.md:68`, `:92`). The residual case is Spec 3.
7. Report sections: present ("Judgment calls", and "The host-visible effect of the plan-terms change"). The host-visible section's premise does not reproduce (Proof 2).
8. Completion criteria: closed. The awk rerun shows all 24 items carry "done when", and the separate "The step is done when" items are gone. The fix merged two pairs of items into one each (Standards 3).
9. **round, of an interview**: closed. The entry text is as given, the sync prints ok, `Stated in: grill, Steps 6` points at "Ask the round", and there are 31 bare uses. The new wording makes README and `ordo-help` uses false (Standards 4) and conflicts with point 17 (Standards 2).
10. "ruling E (b)": closed. `git grep -n "ruling E" -- skills` gives rc=1. Both places name the ADR folder's `README.md`, whose second paragraph states the supersede rule (read in `skills/repo-setup/templates/docs/adr/README.md`). That README is not in "What it reads" (Standards 5).
11. The reason at Steps 6: closed (`SKILL.md:84`).
12. Bold: closed. `grep -n '\*\*' skills/grill/SKILL.md` finds only the five list labels (`:189-193`) and a code span (`:161`).
13. Restated rules: closed. Steps 8 (`:95`) names "Rules", and old "Looking up a fact" 1 is gone.
14. Every answer writes its bullet: closed (`SKILL.md:154`, and `decision-form.md:74-78` gives D6's bullet before the record). The consequences are concrete (`decision-form.md:80`). The example's alternatives rejected do not follow the goals it states (Standards 6).
15. Reasons from the repository's goals: closed in the text (`SKILL.md:179`, `:192`, `:197`). Nothing the skill reads names where the goals are stated (Standards 5), and the example breaks the rule (Standards 6).
16. Comments and glossary entries: the text is closed at all seven places. The report's claim that `check_config.py` reads no comment text is false (Proof 1).
17. **frontier**: the entry and Steps 4 (`SKILL.md:71`) agree. Not closed across the skill: Steps 6 and the **round, of an interview** entry still say a round asks "the whole frontier" (Standards 2).

### Verdicts (whole diff since the base)

Items of "What to build":

- 1: violated. Spec 1: the session's own reads were dropped as a normal way to look up a fact. Spec 2: a goal change to an entry under "Not yet specified" is written nowhere. Standards 2: Steps 6 contradicts Steps 4 on the frontier. Standards 5: inputs the steps rely on are missing from "What it reads". Standards 3: merged items. Every other requirement of item 1 has its place in `skills/grill/SKILL.md`, read line by line. The step-7 sentence is verbatim at `:238`, `metadata.version: "1.0.0"` is set, and the description is 748 characters.
- 2: holds. `skills/grill/references/decision-form.md` has a round of two (D4, D5), the answers, three Rulings bullets (D4, D5, D6), a glossary line and the next round's D6 with a "Rule:" line. The example is neutral (`tally`), and `SKILL.md:74` names the file by path. Standards 6 and Standards 7 are text defects inside it and give no verdict.
- 3: violated, Standards 1. **reference line** does not define the "Rule:" sense the skill uses. The other entries are in alphabetical place and the sync prints ok.
- 4: holds. README lines 7, 16, 32 and 86, `ordo-help:52`, `plan:25`, `roadmap:28` and `templates/docs/glossary.md:3` are as the brief gives them. The comments of point 16 are at `plan.yaml:12` and `:27`, `orchestrator-state.md:14` and `:27`, and `.agents/plan.yaml:10`.

Cases:

- `ls` of the two new files: met. Both are present now, and the report's first run shows both failing.
- Description length: met, `748 skills/grill/SKILL.md`.
- `git grep --untracked -n "/grill"`: met. Every expected hit is listed. The extra hits are the intro line, the refusal rows, and the four template comment lines.
- `sync_rules.py --only glossary` prints ok: met.
- Reading, the skill against `docs/dev/skill-layout.md`: partial, Standards 3 (two items that each carry two actions).
- Reading, the skill against each requirement of item 1: partial, Spec 1, Spec 2 and Standards 2. The report's reading was not redone for this round (Proof 3).
- `git grep -n -w grill -- README.md`: met, lines 7, 16, 32 and 86.
- Reading, the dry run on entry 3: partial, Proof 3. The report's dry run follows the round-0 text. Its D5 to D7 carry "Industry:" where the text now requires "Rule:", and its answers to D5 to D7 write no Rulings bullets, which `SKILL.md:154` now requires.
- Reading, `references/decision-form.md` against item 1: met. Heading, options, reference line, recommendation, lazy option, both answer forms, the bullets, the glossary line and the "record as ADR?" decision are each present.
- Reading, every term against `docs/glossary.md`: partial. Standards 1 (reference line), Standards 2 (frontier and round) and Standards 4 (the bare "round" outside `grill`).

### 1. Spec

1. `skills/grill/SKILL.md:116`: "2. Start each lookup agent as the `spec` skill's brief-check agent is launched: the effort agent `ordo-<reviewer_effort>`, on the model `reviewer` names." Round 0 read "A lookup is made by the session's own reads, or by an agent the skill starts". What is wrong: the rewrite for point 1 dropped the session's own reads as a normal way to look up a fact. They now appear only when an effort check fails (`:114`). Item 2 is also unconditional, so it does not say to skip the agent when item 1's checks failed. The brief's item 1 reads "has it looked up by an agent the skill starts ... or by the session's own reads". This is a fix that reaches beyond its point. Failure scenario: a decision needs one line of a file the session read at Steps 2. The agent following item 2 starts a lookup agent for it and holds the decision out of the round until the agent finishes. Alternatively, after a failed check, the agent reaches item 2 and starts the agent anyway. Verdict: item 1 violated; case "the skill against each requirement of item 1" partial.

2. `skills/grill/SKILL.md:167`: "An answer that changes the goal, gate or text of an entry with a gate is drafted into the entry ..." with `:170`: "An entry under "Not yet specified" is not moved and has no gate drafted into it". What is wrong: round point 4 excluded only the gate. The words "of an entry with a gate" also exclude a changed goal, and a changed "what must be known", of an entry under "Not yet specified". Such an answer is then written only as a Rulings bullet. Steps 10 prints only the gate. The brief's item 1 requires the entry's goal to be drafted. The `roadmap` skill's "Steps / add" takes "the title and the goal" of such an entry from the entry itself (`skills/roadmap/SKILL.md:61`). Failure scenario: `/grill 7` narrows entry 7's goal. The user types `/roadmap add 7` as the end says, `roadmap` drafts the gate against the old goal, and `/plan 7` copies the old goal into "## Goal". Verdict: item 1 violated; case "the skill against each requirement of item 1" partial.

3. `skills/grill/SKILL.md:67-68` and `:83`: "A decision shown before and not answered is asked again under a new number." and "The numbers continue ... after every number shown in this interview." What is wrong: this is the residual of first-round Spec 6. Nothing written records which numbers were shown, so after a new session or a compaction the skill cannot follow either sentence. The new rule at `:92` rejects only numbers this session has not shown. Failure scenario: round 2 showed D7 to D9, and the session compacts. The new session redraws and shows D7 to D9 for other decisions. The user then types "D8 => B", meant for the old D8. The number was shown in this session, so the answer is read against the new D8 and written. Point 6 is closed as worded, so the remaining gap is the orchestrator's to take up. No verdict.

4. `skills/grill/SKILL.md:198`: "their reference line is labelled "Rule:" ... and the design bar and `design_references` do not apply to them." It is set against `.scratch/2-e-grill/plan.md` Rulings. "Step 12, the reference line's label" reads "the reference line of `grill`'s decision form is labelled by the bar, "Industry:", "State of the art:" or "Novel:"". Ruling G2, the user's, reads "the reference line is always there, and the bar sets what it cites". What is wrong: the round brief carved out four kinds of decision from both rulings, and neither ruling was amended. The round brief asked for this, so the builder followed it. The orchestrator either amends its own ruling "Step 12, the reference line's label" or takes G2's scope to Axel. Failure scenario: a reader of plan.md's Rulings, Axel at his reading included, holds the skill to "labelled by the bar" and finds "Rule:" unexplained. No verdict.

### 2. Proof

1. Report, "Repair round 1", point 16: "`grep -n -i comment skills/ordo-init/templates/check_config.py` printed nothing, so `check_config.py` and its test read no comment text." What the rerun shows: the grep does print nothing, but the conclusion is false. `skills/ordo-init/templates/check_config.py:92` parses the comment of every key in `skills/plan/templates/plan.yaml`, using `#\s*(required\.|optional, default (.*?)\.\s)` to learn which keys are required and their defaults. The decision that rests on it is whether the comment edits of point 16 can change what `check_config.py` accepts. The edits keep the `required.` and `optional, default high.` prefixes, and `check_config.test.sh` passes, so the change itself is safe. Failure scenario: an orchestrator or a later builder trusts the report's sentence and rewords a comment's prefix, and `check_config.py` then stops treating that key as required or loses its default. No verdict.

2. Report, "The host-visible effect of the plan-terms change": "The next `/repo-setup sync` in every repository with the plan-terms block (game-engine, cathedra) rewrites its `docs/glossary.md` block ...". The same premise is in round brief point 7. What the rerun shows: neither `/Users/axelfaes/workspace/game-engine/docs/glossary.md` nor `/Users/axelfaes/workspace/cathedra/docs/glossary.md` exists, and `grep -rl "ordo:plan-terms"` finds no file with the block in game-engine, cathedra or research-hub. The decision that rests on it is the disposition of first-round Behaviour 1, meaning which repositories see a glossary diff after the next pin. The only glossary with the block found is Ordo's own `docs/glossary.md`, which this step syncs. Failure scenario: the orchestrator books or tells Axel that game-engine's and cathedra's glossaries change at the next sync, when they have no block to change. No verdict.

3. Report, "Reading: the skill against each requirement of item 1" and "Dry run on paper": both still describe the round-0 text, and the round brief asked for the brief's cases to be rerun. The item-1 reading cites round-0 line numbers ("Facts looked up: ... lines 108-119") and quotes a line that no longer exists ("since the glossary's **question, the** is another thing"). The dry run's D5 to D7 carry "**Industry:**" and write no Rulings bullets. The round section redoes only the layout reading (point 8). Failure scenario: Axel, reading the report for his check, takes the dry run as the skill's output and sees an "Industry:" line for a roadmap diff that the skill now forbids. Verdict: case "the dry run" partial; case "the skill against each requirement of item 1" partial.

### 3. Standards

1. `skills/repo-setup/templates/plan-terms.md:67` (and `docs/glossary.md`, synced): "**reference line**: the line of a decision that cites, for the options, what the design bar sets, labelled "Industry:", "State of the art:" or "Novel:" ...". It is set against `skills/grill/SKILL.md:198`, where the roadmap diff, "record as ADR?", rule-clash and term decisions have a reference line labelled "Rule:" that the design bar does not govern. What is wrong: point 3 made the entry false. `docs/dev/skill-layout.md` "Writing for an agent" says a term is used only in a sense the glossary defines, and a term in a new sense changes its entry first. Change standard rule 14 applies as well. Failure scenario: an agent drawing D6 "Record D5 as an ADR" follows the glossary and labels its line "Industry:", as the round-0 dry run did. Verdict: item 3 violated; case "every term against `docs/glossary.md`" partial.

2. `skills/grill/SKILL.md:82`: "6. Ask the round: the whole frontier in one message". Also `plan-terms.md:76`: "**round, of an interview**: one message in which `grill` asks the whole frontier". Both are set against `SKILL.md:71` and `plan-terms.md:34`: "a decision waiting on a running lookup is in the frontier and not yet asked". What is wrong: point 17 widened the frontier to include decisions that are not asked, and the two statements that a round asks the whole frontier were left unchanged. Change standard rule 19 applies. Failure scenario: an agent at Steps 6 puts into the round a decision whose fact is still being looked up, because Steps 6 says the whole frontier. Verdict: item 1 violated; case "every term against `docs/glossary.md`" partial.

3. `skills/grill/SKILL.md:129-130` reads "1. A term the user uses ... is sharpened by a decision of its own, and a relationship between terms is tested in that decision with a concrete scenario. - The item is done when the term is a decision of the next round." `SKILL.md:147-148` reads "1. An answer that changes the text of an approved step ... is written as its Rulings bullet, and the step's change is listed at the end ... - The item is done when the end's list holds the change." What is wrong: to give each item one criterion, point 8 merged items that round 0 kept separate. `docs/dev/skill-layout.md` "Sections, in order" row 5 asks for one action per item, and "Lists and tables" asks for one rule per bullet. Each merged item now has a completion criterion that covers only one of its two actions. `SKILL.md:164` also joins three requirements in one bullet (put to the user, written as a bullet, listed at the end). Failure scenario: an agent marks item 1 of "A plan already open" done when the end's list holds the step change, without having written the Rulings bullet. Or it marks the term item done with no concrete scenario in the decision. Verdict: case "the skill against `docs/dev/skill-layout.md`" partial.

4. `README.md:16`: "Interviews the user about one roadmap entry, in rounds. Each round asks every decision ...". Also `README.md:32` and `skills/ordo-help/SKILL.md:52`: "an interview in rounds". These are set against the entry at `plan-terms.md:76`: "Inside `grill` the bare "round" means this; elsewhere it is a repair round." What is wrong: the glossary covers the README and the skills (`docs/glossary.md:3`), and these three places use the bare word in the interview sense outside `grill`. Change standard rule 14 applies (a sentence made false). Failure scenario: a reviewer holding README and `ordo-help` to the glossary reads "Each round asks every decision" as a repair round and files a finding, or the reader is left unsure which sense applies. No verdict.

5. `skills/grill/SKILL.md:29-50` ("What it reads"), set against `:141`, `:179`, `:181`, `:192` and `:198`. These name "the ADR folder's `README.md`" as the governing text for superseding, for the goals and for the "Rule:" line, and require reasons "argued from this repository's goals". What is wrong: "What it reads" lists neither the ADR folder's own `README.md` (item 8 reads only the `repo-setup` template, and only when creating files) nor any page that states the repository's goals. Round brief point 15 names "the design-principles page" as a source, and that page is read only if `standards` happens to list it. `docs/dev/skill-layout.md` row 4 asks for one input per item. Failure scenario: in a repository whose `standards` omits `docs/dev/design-principles.md`, the agent writes "argued from this repository's goals" with goals of its own making. Verdict: item 1 violated.

6. `skills/grill/references/decision-form.md:80`: "its alternatives rejected argued from the goals of `tally` (A counts text in a script without spaces as one word per line, and C leaves that count wrong until later work)". It is set against `:3`: "The goals of `tally` are counts a user can check against `wc -w`, settings a person edits by hand, and one meaning for each setting". What is wrong: neither reason comes from a stated goal. The first goal argues for A, as D5's own recommendation says (`:28`). The worked example therefore labels as goal-argued a rejection that is not. This contradicts `SKILL.md:179` (change standard rule 19). Failure scenario: an agent copying the example writes a record whose "alternatives rejected" cite a reason that is not among the repository's goals, and calls it goal-argued, which the ADR folder's README forbids. No verdict.

7. `skills/grill/references/decision-form.md:16` and `:28`: "The reference line is the evidence for that, not the reason." is the same sentence in both recommendations. What is wrong: the prose standard, "0. Hard rules", says "No repeated construction", and "D. Structure" caps "not X, Y" at twice per page. The sentence also states a rule of the skill (`SKILL.md:197`) inside the user-facing round. Failure scenario: an agent copying the example appends this sentence to every recommendation it writes. No verdict.

### 4. Behaviour

1. Report, "Repair round 1", point 16: "Comments now: `skills/plan/templates/plan.yaml:12` ...; `:27` ...". Only the new comment text is given. What is wrong: `ordo-init` shows these comments as what each key means, so the comments of `reviewer` and `reviewer_effort` in `plan.yaml` and `orchestrator-state.md` change what a user sees. The round brief asked for old beside new, and the report gives no before. The host-visible section also names the wrong repositories (Proof 2). Failure scenario: Axel, reading the report, cannot see from it that `/ordo-init`'s description of `reviewer_effort` changes in every repository after the pin. No verdict.

### Declined to judge

- The URLs in `references/decision-form.md` (peps.python.org, toml.io, pubs.opengroup.org, unicode.org) and in the report's dry run, with their quoted text: not verified here, because this review fetched no web page.
- The `sync_rules.py --only glossary` result on the unchanged tree: not rerun, because the base is not checked out and this review runs no git command beyond those its brief allows and those the report quotes.
- What `/repo-setup sync` does to a glossary that has no plan-terms block (whether it adds the block): not verified. It decides whether any repository besides Ordo sees the new entries.
- The main checkout's state file configuration block still carries the old comments for `reviewer` and `reviewer_effort`: that file is the orchestrator's, so it is not a finding against the step.
- Whether G2 covers the "Rule:" carve-out (Spec 4): the user's call.
- The skill as Axel reads it against `docs/dev/skill-layout.md`: that is the step's own check, and it is his.

Reviewer usage: claude-opus-5-5 (served model, from its transcript); 178724 tokens, 34 tool uses, 375 s (completion notice); $1.54-4.85 at Opus rates.
