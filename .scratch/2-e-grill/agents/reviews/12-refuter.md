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

