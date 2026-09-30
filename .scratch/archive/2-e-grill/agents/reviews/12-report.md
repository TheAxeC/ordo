Everything in the brief is done. The check of the step is Axel's reading of `skills/grill/SKILL.md` against `docs/dev/skill-layout.md`, which is pending.

## Open items of the state file, verbatim

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", and its text in those four skills; step 12 went ahead of this ruling overnight, so under (a) 9a runs after step 12 and also names `grill`'s roadmap-diff decision among the stops it covers. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- The old skill name in other repositories (2026-09-30, raised at step 10's review): after the next pin `/plan-help` no longer exists, and these files still name it (`grep -rIl -i plan-help`, `.git` and `.scratch` left out): `game-engine/.agents/plan.yaml:1` and `cathedra/.agents/plan.yaml:1` (the comment listing the plan skills); `research-hub/.agents/plan.yaml:1`, `research-hub/CLAUDE.md:33` (read by every session there), `research-hub/docs/AGENT-APPROACH.md`, `research-hub/tools/figures/gen_figures.py` and `plan-loop.svg`. research-hub is read only, and changing another repository waits for Axel under ruling "Overnight work" 5. Options: (a) step 15, which already edits game-engine's and cathedra's `.agents/plan.yaml` and leaves the edit for Axel to commit, also changes their line 1 to `/ordo-help`; Axel changes research-hub's files himself, or rules that a step of a later plan does. Pros: the pin at 2.E's closing leaves no repository pointing at a missing skill; no extra commit in each repository. Cons: step 15 grows by one line per repository. Approving (a) also approves adding "and line 1's `/plan-help` becomes `/ordo-help`" to step 15's line in plan.md. (b) leave them: the lazy option, since a session in research-hub reads CLAUDE.md's list and types a skill that no longer exists. Recommendation: (a).
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## The cases' first run, on the unchanged tree

- `ls skills/grill/SKILL.md skills/grill/references/decision-form.md`: `ls: skills/grill/references/decision-form.md: No such file or directory` and `ls: skills/grill/SKILL.md: No such file or directory`. Both fail, as the case expects.
- The description length command: printed ten lines (`726 skills/land/SKILL.md`, `386 skills/ordo-help/SKILL.md`, `632 skills/ordo-init/SKILL.md`, `788 skills/plan-orchestration/SKILL.md`, `616 skills/plan-retro/SKILL.md`, `477 skills/plan/SKILL.md`, `951 skills/refute/SKILL.md`, `776 skills/repo-setup/SKILL.md`, `997 skills/roadmap/SKILL.md`, `1022 skills/spec/SKILL.md`), none for `skills/grill/SKILL.md`.
- `git grep --untracked -n "/grill" -- skills README.md docs`: one line, `skills/plan/SKILL.md:63:   - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.`
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.
- `git grep -n -w grill -- README.md`: printed nothing.
- The readings (skill against layout, against item 1, decision-form.md against item 1, terms against the glossary) and the dry run have no first run, since the skill does not exist on the unchanged tree.
- No case of the brief is one its rules get wrong.

## DONE / NOT DONE

| Item | Command or reading that proves it | Output |
|---|---|---|
| 1. `skills/grill/SKILL.md` | `ls`, description length, readings below | present; `748 skills/grill/SKILL.md` in the length command's output |
| 2. `skills/grill/references/decision-form.md` | `ls`, reading below | present, 74 lines |
| 3. glossary terms and sync | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`, then without `--write` | `written: the plan-terms block now equals the template`, then `ok: the plan-terms block equals the template` |
| 4. neighbours | `git grep --untracked -n "/grill" -- skills README.md docs`, `git grep -n -w grill -- README.md` | listed under "Cases after the change" |
| Verify 1, the plan's verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "rc=$?"` | the lines below |
| Verify 3, non-ASCII | `LC_ALL=C grep -n '[^ -~]'` over `skills/grill/SKILL.md`, `skills/grill/references/decision-form.md`, `README.md`, `docs/glossary.md`, `skills/ordo-help/SKILL.md`, `skills/plan/SKILL.md`, `skills/roadmap/SKILL.md`, `skills/repo-setup/templates/plan-terms.md`, `skills/repo-setup/templates/docs/glossary.md` | printed nothing |
| Verify 4 | the step adds and changes no test | this item of the template does not apply |
| The user's reading of the skill against `docs/dev/skill-layout.md` | Axel's reading | NOT DONE, pending as ruling "Overnight work" 2 says; the step is not ticked |

Verify 1, the lines the runner printed:

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

## Cases after the change

- `ls skills/grill/SKILL.md skills/grill/references/decision-form.md` prints both paths.
- The description length command prints `748 skills/grill/SKILL.md`, at most 1024. The other nine counts are as before.
- `git grep --untracked -n "/grill" -- skills README.md docs` prints: `README.md:32` (sequence line), `skills/grill/SKILL.md:10`, `:15`, `:16`, `:17` (introduction and Quick start), `skills/grill/SKILL.md:206` to `:209` (the refusal rows of Stops), `skills/ordo-help/SKILL.md:52` (sequence line), `skills/plan/SKILL.md:25` (the new Use instead row) and `:64` (the existing line), and `skills/roadmap/SKILL.md:28` (the new Use instead row).
- `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.
- `git grep -n -w grill -- README.md` prints `README.md:7` (introduction), `README.md:16` (table row), `README.md:32` (sequence line) and `README.md:86` (`for skill in grill land ordo-help ...`).

## Reading: `skills/grill/SKILL.md` against `docs/dev/skill-layout.md`

- Frontmatter: `name: grill` equals the folder; the description is one paragraph, starts "Settle a roadmap entry's design decisions", ends with `Triggers on:` and six phrases, names no neighbouring skill (it names `ADR` and `Rulings`, which are not skills), is 748 characters; `metadata.version: "1.0.0"`; the text carries no version, date or history. Holds.
- Sections in order: `#` title and one paragraph (lines 8-10), Quick start (12), Use instead (20), What it reads (29), Steps (52), reference sections `## The decision form` (175) and `## The design bar` (189), Stops (197), Anti-patterns (211), Rules (221). Holds. The `###` headings are under Steps only. No other `##` heading.
- Quick start: a code block with three invocations, each with a comment; the first is the one to type first. Holds.
- Use instead: a table with When and Use, four rows. Holds.
- What it reads: a numbered list, one input per item; each input whose absence is a refusal says so (items 1 and 2). Holds.
- Steps: a numbered list in execution order; refusals (Steps 1) and the round stop (Steps 6) come before Steps 8, which writes. Each step and each subsection item ends on its completion criterion ("The step is done when ..."). Holds.
- Reference sections: both hold material every run reads. Holds.
- Stops: table with Stop, When, What it shows, What resumes it; the sentence under it separates the stops from the refusals. Anti-patterns: table with the three columns. Rules: bulleted, one rule per bullet. Holds.
- "Where a rule goes": a rule at one point is in that step's item; the forbidden shortcuts are in Anti-patterns with their reason; the rules that hold throughout are in Rules; the design bar's content is written once in "The design bar" and Steps 1 names it. Holds.
- "Writing for an agent": prohibitions carry the behaviour to do instead (Anti-patterns "Do instead"); `question` is mentioned once, at Steps 3, to say it is not used; each glossary term is used in the sense the glossary defines (below).
- "Paths and names": `references/decision-form.md` is named from Steps 5; other skills' files are named with their skill (the `repo-setup` skill's `templates/docs/adr/README.md`, the `spec` skill's "What it reads" 5); keys are in code; skills are named `/plan` and `plan`. Holds.
- One rule per bullet: read bullet by bullet; each qualifier is a condition of the rule in its bullet.

## Reading: the skill against each requirement of item 1

- Invocations: lines 15-17, `/grill <entry>`, `/grill <entry> --bar <industry|state-of-the-art|novel>`, `/grill <project>/<entry>`; line 39, "an entry under "Not yet specified" is an entry".
- Use instead: lines 24-27, `/ordo-init`, `/roadmap add <goal>`, `/plan <entry>`, `/ordo-help <entry>`.
- What it reads: items 1 to 8, lines 31-50; the keys and defaults at lines 32-33; the refusals at lines 35-37 and 40; "the entry, whole" at line 38; the rules file and standards at 41; the ADRs at 42; the glossary at 43-45; the Rulings or rulings file at 46-48; the sources at 49.
- Words: line 63, "A decision is a node of the design tree, and the skill names what it asks a decision, never a question, since the glossary's **question, the** is another thing."; line 64, "The roadmap diff and "record as ADR?" ... are decisions of their own, numbered like the rest."
- Design tree and frontier: lines 62 and 65, 69; "including the roadmap diff and "record as ADR?" decisions" at 69.
- Resuming: lines 66-67.
- Facts looked up: "Steps / Looking up a fact", lines 108-119, with the effort agent, the model, the served-model check and the stop; the downstream-only wait at line 70.
- A round: line 81, "the whole frontier in one message"; line 71, a dependent decision waits; line 85, the round ends the turn.
- The decision form: "The decision form", lines 175-187, with the numbering at Steps 6 (lines 82-83), the reference line "always present" and labelled (line 181), the source read in this session (line 185), the recommendation for being the better design (line 182), the lazy option or "none" with the reason (line 183).
- The design bar: lines 189-195, the four bars, the labels and `design_references`.
- What is offered: Steps 5, lines 74-79, and the sentence verbatim at Rules, line 226.
- Answers: Steps 6 line 84 (the form, "Agree", the range) and Steps 7 lines 88-90.
- Terms and claims: lines 121-127.
- An answer that contradicts: lines 129-136.
- A plan already open: lines 138-142.
- Written as each settles: lines 144-173 (the ruling, the glossary term, the roadmap entry with the diff as a decision, the ADR), and Steps 8, line 93, "in the same turn as the answer and before the next round is drawn up".
- The end: Steps 10, lines 98-106.
- Stops and refusals: lines 197-209.
- Anti-patterns: lines 213-219, the five the brief names.
- Rules: lines 223-226, the three the brief names, plus the rule that a decision is the user's.

## Reading: `references/decision-form.md` against item 1's decision form and write rules

- Heading: `## D4. The format of the settings file` and `## D5. What counts as a word`, numbered after `D1` to `D3` of the Rulings, as Steps 6 says.
- Options with pros and cons: `- **A. TOML.** *Pro:* ... *Con:* ...` for every option.
- Reference line, labelled by the bar: `**Industry:**`, each claim with a URL that was fetched in the session that wrote the file (PEP 518, TOML v1.0.0, POSIX `wc`, Unicode UAX 29, Nygard's article).
- Recommendation and the lazy option: `**Recommend A.**` with its reason and `Lazy option: none.` with its reason, `Lazy option: C.` with its reason.
- The answers: `D4 Agree` and `D5 => B`, the two forms of the answer.
- The lines written: the two Rulings bullets in the form `- D<n> <phrase> (<date>): <answer> (the user).`, the glossary line `- **word**: ...`, and the next round's `## D6. Record D5 as an ADR`, with the record's contents.
- The example names no repository of the user's.

## Reading: every term of the skill against `docs/glossary.md`

ADR, ruling (the new sense), rulings file, roadmap entry, gate, goal, `Not yet specified`, stop, refusal, standards, rules file, plan, plan-terms block, effort agent, runner and lazy option are used in the senses the glossary gives. `question, the` is named once to say the skill does not use it. Bare "bar" is not used; "design bar" is. Bare "round" is used in the interview sense, which the new term **round, of an interview** defines. "Decision" is defined by **design tree** (each node a decision).

## Dry run on paper: roadmap entry 3, `docs/roadmap.md:49-54`

Nothing was asked and nothing was written to disk.

Steps 1: `.agents/plan.yaml` exists; `design_bar` is absent, so the bar is `industry`; `libraries` is `avoid`; `design_references` is `[]`; `reviewer_effort` is absent, so `high`. The entry is "3. The writing base". Steps 2: the rules file, the three `standards` pages (`docs/dev/skill-layout.md`, the prose standard, `docs/glossary.md`) and the entry are read; `ls .scratch/rulings` fails and no folder of `.scratch` holds `# Plan: 3. The writing base`, so the Rulings are empty; `docs/adr/` holds `README.md` and `template.md` only, so no ADR is in force. The entry's sources are the prose standard, `docs/academic-coverage.md` rows marked `rebuild: writing` (lines 76, 100, 101) and the removed `/writing`.

Design tree (Steps 3):
- D1 where the writing base's files live and how the other skills reach the prose standard: no prerequisite.
- D2 which of the four checks are scripts: no prerequisite.
- D3 what a check prints: waits on D2.
- D4 which `rebuild: writing` rows each file carries: waits on D1.
- The roadmap diff and "record as ADR?" decisions: they wait on the answers.

Frontier (Steps 4): D1 and D2. Both need only facts the session read itself, so no lookup agent starts.

The round (Steps 5 and 6), as sent:

```
## D1. Where the writing base's files live

- **A. A new copy of the prose standard in `skills/writing/references/`.** *Pro:* the skill folder is self-contained. *Con:* two copies of the prose standard, which drift.
- **B. `skills/writing/` holds the anti-pattern table and the checks and names the `repo-setup` skill's `templates/docs/dev/prose-standard.md`.** *Pro:* the prose standard has one copy. *Con:* the skill reads a file of another skill.
- **C. The prose standard moves into `skills/writing/`.** *Pro:* one copy, in the skill that uses it. *Con:* `repo-setup` installs that page into every repository from its own `templates/`, so the move changes another skill.

**Industry:** Anthropic's skill guidance says to keep the `SKILL.md` body under 500 lines and to split further content into separate files the skill points to (https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices , fetched in this session); this repository's layout page says "A rule is written once. Another place that needs it names the section it is in." (`docs/dev/skill-layout.md:45`) and "A file of another skill is named with its skill" (`docs/dev/skill-layout.md:71`).

**Recommend B.** It keeps one copy of the prose standard and uses the naming `docs/dev/skill-layout.md:71` gives for a file of another skill.

Lazy option: A. It costs less now and leaves two copies of one rule.

## D2. Which of the four checks are scripts

- **A. All four list their literal matches for the reader, and none prints a verdict.** The checks are non-ASCII characters, dash characters and spaced hyphens, a fixed list of history words, and word counts per section. *Pro:* it builds every check the entry's gate names, each computing a fact. *Con:* whether a listed dash is an aside, or a listed word is history, is still read by a person.
- **B. Scripts for non-ASCII and word counts only; the reviewer reads for dash asides and history words from the anti-pattern table.** *Pro:* two scripts fewer to keep. *Con:* the entry's gate names a check for each of the four.

**Industry:** Vale "is a command-line tool that brings code-like linting to prose" and enforces rules the organisation defines (https://docs.vale.sh/ , fetched in this session); this repository's rules file says "A script does only what has one correct answer that a machine computes exactly" and "No script output stands in for that judgment, gates it, or is shown to the user as a finding" (`docs/dev/change-standard.md:15` and `:17`).

**Recommend A.** Each match is a fact a machine computes exactly, the entry's gate asks for all four, and no output stands in for the reader's judgment.

Lazy option: B. It costs less now and leaves two of the gate's four checks unbuilt.

Answer as `D<n> => <letter or text>`, one line per decision; `D<n> Agree` takes the recommendation; `D<a>-<b> Agree` takes it for a range.
```

An option "all four print pass or fail" was not offered, since it breaks `docs/dev/change-standard.md:17` (Steps 5, line 75).

One round further, with the hypothetical answer `D1-D2 Agree`. Steps 7 reads both as the recommendations. Steps 8 writes, in the same turn, to `.scratch/rulings/3-the-writing-base.md`, created with the heading line `# Rulings: 3. The writing base`:

```
- D1 Where the writing base's files live (2026-09-30): `skills/writing/` holds the anti-pattern table and the checks and names the `repo-setup` skill's `templates/docs/dev/prose-standard.md` (the user).
- D2 Which of the four checks are scripts (2026-09-30): all four list their literal matches for the reader, and none prints a verdict (the user).
```

Glossary lines: none. Neither answer settles a term, and the words the entry uses ("dash asides", "history words") are the entry's, not the user's answer, so Steps 7's "Terms and claims" does not fire on them.

Roadmap diff (Steps 8, "Writing what settled" 3): D1 B makes the entry's goal, "the prose standard", inexact, so the diff is drafted and becomes a decision of round 2. D2 A leaves the gate as it is, so no gate question is asked.

Round 2's frontier: D3 (what a check prints) and D4 (the rows), whose prerequisites D2 and D1 are settled, the roadmap diff, and "record as ADR?" for D1 and for D2, since each is not obvious from the code, binds the entries that use the base (entry 4 waits on 3 "for the checks", `docs/roadmap.md:60`) and has rejected alternatives. Numbered after D2: D3 and D4 the tree decisions, then:

```
## D5. The change to entry 3's goal

The diff of `docs/roadmap.md:52`:
- Goal: A `writing` skill folder the writing skills share: the prose standard, the anti-pattern table, and the checks for non-ASCII, dash asides, history words and word counts per section.
+ Goal: A `writing` skill folder the writing skills share: the anti-pattern table and the checks for non-ASCII, dash asides, history words and word counts per section, naming the `repo-setup` skill's prose standard.

- **A. Write the diff as shown.** *Pro:* the goal states what the folder holds after D1. *Con:* none found.
- **B. Leave the entry as it is.** *Pro:* no change to the roadmap. *Con:* the goal asks for a copy of the prose standard that D1 rejected, and `/plan` copies the goal into the plan.

**Industry:** the `roadmap` skill's Rules say "Entry text states the goal, the gate and the dependencies" (`skills/roadmap/SKILL.md:157`).

**Recommend A.** The entry then matches the ruling D1, and `/plan` copies a goal that is true.

Lazy option: B. It costs no edit now and leaves the entry asking for work D1 ruled out.

## D6. Record D1 as an ADR

- **A. Record it.** *Pro:* entries 4 and 5 find the rule that the prose standard has one copy, with the copy rejected. *Con:* one more record to keep current.
- **B. Keep it a Rulings line.** *Pro:* no new file. *Con:* the ledger is archived when the plan closes, and the reason goes with it.

**Industry:** an architecture decision record holds the context, the decision, its status and its consequences of a decision that affects "the structure, non-functional characteristics, dependencies, interfaces, or construction techniques" (https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions , fetched in this session); `docs/adr/README.md:3` keeps a record "per decision that is not obvious from the code and binds work after its plan closes".

**Recommend A.** The decision binds entries 4 and 5 and is not visible in the code.

Lazy option: B. It costs no file now and leaves the reason unrecorded.

## D7. Record D2 as an ADR

The same parts: A. Record it (*Pro:* the rule that the checks list matches and print no verdict is findable by the entries that call them; *Con:* one more record). B. Keep it a Rulings line (*Pro:* no new file; *Con:* the reason goes with the archived ledger). Industry: the same two sources as D6. Recommend A, since entries 4 and later read these checks. Lazy option: B.
```

With `D5-D7 Agree` (and D3, D4 answered): the diff is written to `docs/roadmap.md:52`; the two records are written in the same turn as `docs/adr/0001-...md` and `0002-...md`, status `proposed`, from `docs/adr/template.md`, with the index rows in `docs/adr/README.md`. Nothing of this was written to disk.

Where the skill's text left a choice open:
- The order of decisions inside one round (Steps 6 says the whole frontier, numbered, and not in what order); I put the tree decisions before the roadmap diff and the ADR decisions.
- Whether a round says that an option was not offered because it breaks a rule (Steps 5 says it is not offered).
- Whether a term the entry uses and the glossary lacks is sharpened when the user has not used it (Steps 7 and "Terms and claims" say "a term the user uses").
- The heading line of a rulings file created by `grill`: `# Rulings: <entry>` is the choice of the text.

## New files, whole

### skills/grill/SKILL.md

---
name: grill
description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
metadata:
  version: "1.0.0"
---

# Settle an entry's design decisions

`/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.

## Quick start

```
/grill <entry>                                                  interview about the entry, by number or title, including one under "Not yet specified"
/grill <entry> --bar <industry|state-of-the-art|novel>          the same, with this design bar in place of the configured one, for this interview only
/grill <project>/<entry>                                        the same, in a repository whose plan.yaml lists several projects
```

## Use instead

| When | Use |
|---|---|
| The repository has no `.agents/plan.yaml` | `/ordo-init` |
| The roadmap has no entry for the work yet | `/roadmap add <goal>` |
| The design is settled and the plan is to be opened | `/plan <entry>` |
| Where an open plan stands | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml` at the repository root.
   - The required keys are `roadmap`, `ledger_root`, `rules`, `libraries` and `reviewer`.
   - The optional keys are `standards` (default `[]`), `adr` (default `docs/adr`), `design_bar` (default `industry`), `design_references` (default `[]`) and `reviewer_effort` (default `high`), and a key left out takes its default.
   - In the `projects:` form, the named project's keys.
   - No file is a refusal that names `/ordo-init` ("Stops").
   - A required key missing is a refusal that names the key ("Stops").
   - A `design_bar` value or a `--bar` value other than `industry`, `state-of-the-art` and `novel` is a refusal that names the three ("Stops").
2. The roadmap file `roadmap` names: its introduction and status legend, for the format a change to the entry is written in, and the entry `<entry>` names, whole.
   - `<entry>` is matched against the entries by number or title, and an entry under "Not yet specified" is an entry.
   - No match is a refusal that names `/roadmap add <goal>` ("Stops").
3. The rules file `rules` names, and every page `standards` lists, each in full.
4. The ADRs in force in the folder `adr` names, as the `spec` skill's "What it reads" 5 says: which records are in force, and what each record's decision is.
5. `docs/glossary.md`, whole.
   - A repository without it gets it at the first term written, created from the `repo-setup` skill's `templates/docs/glossary.md`.
   - A glossary without the plan-terms block gets its terms after the opening paragraph.
6. The Rulings of the open plan, when a folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>`, and otherwise the rulings file `<ledger_root>/rulings/<slug>.md` when it exists.
   - The slug is derived as the `plan` skill's Steps 1 derives it.
   - The Rulings are the `## Rulings` section of `plan.md`.
7. The entry's sources: each file, page or repository the entry and the answers name.
8. The `repo-setup` skill's `templates/docs/adr/README.md`, `templates/docs/adr/template.md` and `templates/docs/glossary.md`, only when Steps 8 must create the ADR folder's files or the glossary.

## Steps

1. Resolve the configuration, the design bar and the entry.
   - The design bar is the one "The design bar" names.
   - Every refusal of "What it reads" 1 and 2 is made here, before anything is written.
   - The step is done when the keys, the design bar and the entry are resolved, or the skill has refused.
2. Read what "What it reads" 3 to 7 lists.
   - Each is read in full in this session, and none is taken from memory.
   - The step is done when each has been read.
3. Draw the design tree.
   - List every decision the entry's goal and gate need, each with the decisions it waits on.
   - A decision is a node of the design tree, and the skill names what it asks a decision, never a question, since the glossary's term "question, the" is another thing.
   - The roadmap diff and "record as ADR?" ("Steps / Writing what settled") are decisions of their own, numbered like the rest.
   - A decision that a line of the Rulings or the rulings file settles, or an ADR in force settles, is marked settled and is not asked again.
   - An interview started again, in a new session or after a compaction, draws the tree afresh from what is written: the Rulings or the rulings file, the entry, the glossary and the ADRs.
   - A decision shown before and not answered is asked again under a new number.
   - After such a restart, an answer to a number shown before is not read (Steps 7).
   - The step is done when every decision is marked settled or open, each open one with the decisions it waits on named.
4. Compute the frontier: every decision whose prerequisites are settled, the roadmap diff and "record as ADR?" decisions included.
   - A decision that needs a fact has that fact looked up ("Steps / Looking up a fact"), and a decision waiting on a running lookup is in the frontier and not yet asked.
   - A decision that depends on another decision still open waits for a later round.
   - The step is done when each decision of the frontier is in the round, or waits on a named lookup.
5. Draw each decision of the round in the decision form ("The decision form"), its worked example in `references/decision-form.md`.
   - Hold each option against the rules file, every standards page and every ADR in force before the options are written.
   - An option that breaks the rules file, a standards page or an ADR in force is not offered.
   - An option that needs an ADR in force changed is offered as reopening that ADR, naming it and the superseding record it would need.
   - Under `libraries: avoid`, no option adds a dependency.
   - Under `libraries: check`, each library candidate is an option with the facts the `spec` skill's Steps 3 records: version, license, maintainer, last release, compatibility with the project's dependencies, what it replaces and what stays hand-written.
   - No option exempts code from the standards pages ("Rules").
   - The step is done when every decision of the round has every part of the decision form.
6. Ask the round: the whole frontier in one message, numbered `D<n>`.
   - The numbers continue after the highest `D<n>` that opens a bullet of the Rulings or the rulings file, and after every number shown in this interview.
   - Only a `D<n>` that opens a bullet counts, since a `D<n>` inside a line can cite a decision of another interview or plan.
   - The message ends with the answer form: `D<n> => <letter or text>` one line per decision, `D<n> Agree` to take the recommendation, and `D<a>-<b> Agree` to take it for each decision of a range.
   - The round ends the turn and waits for the answers ("Stops").
   - The step is done when the message is sent and the turn has ended.
7. Read the answers.
   - The user may answer part of a round, and the decisions left open stay in the frontier.
   - An answer the skill cannot read as one of the options is asked again in the next round, under a new number.
   - An answer read as one of the options, with the user's text beside it, is written as given.
   - An answer that names a number this session has not shown is not read: the skill says so and shows its current round again.
   - Check the answers for terms and claims as "Steps / Terms and claims" says, and for a contradiction as "Steps / An answer that contradicts" says.
   - The step is done when each answer is settled, or asked again in the next round.
8. Write each settled answer as "Steps / Writing what settled" says, at the time "Rules" gives.
   - A plan already open changes what is listed at the end ("Steps / A plan already open").
   - The step is done when every answer of the round has its lines written and read back.
9. Go back to Steps 3, until the frontier is empty and the roadmap diff and "record as ADR?" decisions are answered.
   - The step is done when a pass of Steps 3 to 4 finds no open decision.
10. Close the interview.
    - List every decision settled in the interview with where each was written: the Rulings line, the entry, the glossary line, the ADR.
    - List each change owed to an open plan ("Steps / A plan already open"): a step whose text an answer changed, and the lines of `plan.md`'s "## Goal" or "## Gate" an answer changed.
    - List each clash with a term of the plan-terms block as a change for the user to make in the Ordo repository's `skills/repo-setup/templates/plan-terms.md`.
    - Name `/roadmap add <entry>` when the interview settled the gate of an entry under "Not yet specified", since `grill` does not move that entry, and print the gate's text whole beside it, for the user to give that command.
    - Ask, in the same message, whether the user confirms a shared understanding and whether the skill may commit.
    - On a yes to both, commit the files written by explicit path list in one commit, its subject naming the entry and that its design decisions are settled.
    - Without a yes to committing, list the files written with `git status --short`.
    - Without a confirmation of the shared understanding, go back to Steps 3 with the user's correction.
    - The step is done when the user has answered the confirmation and the commit question, and the files are committed or listed.

### Looking up a fact

1. Before the first lookup agent starts, check as the `spec` skill's Steps 1 does that the runner lists the effort agent `ordo-<reviewer_effort>` and that `CLAUDE_CODE_EFFORT_LEVEL` is unset (`printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1).
   - Either check failing does not end the interview: the lookups are made by the session's own reads, and the next round says so with the cause, the missing agent or the variable's value.
   - The item is done when both checks passed, or the next round is set to give the cause.
2. Start each lookup agent as the `spec` skill's brief-check agent is launched: the effort agent `ordo-<reviewer_effort>`, on the model `reviewer` names.
   - It is read-only and changes nothing.
   - It invokes no skill and starts no agent.
   - It returns each fact with its source, a `path:line` or a URL it fetched.
   - The item is done when the agent is running.
3. Right after the start, read the model the runner served the agent, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
   - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it found is used.
   - The item is done when the served model is the configured one, or the stop is raised.
4. A lookup that finishes joins the next round: the decisions that waited on it are asked.
   - The item is done when each fact a decision needs is in hand with its source.

### Terms and claims

1. A term the user uses that the glossary lacks, or uses in more than one sense, is sharpened by a decision of its own, and a relationship between terms is tested in that decision with a concrete scenario.
   - The item is done when the term is a decision of the next round.
2. A claim the user makes about the code is checked against the code by a lookup before a decision rests on it.
   - A mismatch is shown in the next round with its `path:line`, as a decision of its own that asks which holds, the claim or the code.
   - The item is done when the claim is checked, and a mismatch is a decision of the next round.

### An answer that contradicts

1. An answer that contradicts an earlier ruling or an ADR in force is shown in the next round as a rule clash, a decision of its own.
   - The item is done when the clash is a decision of the next round with its options.
2. The options of the clash are these.
   - Reopen the earlier ruling, by a new Rulings bullet that names the one it replaces.
   - Reopen the ADR, by a superseding record as the ADR folder's `README.md` says: the new record, status `proposed`, its decision the ruled option, the old record marked superseded in the words the folder uses, and the new record's row added to the folder's index, as the `spec` skill's "Steps / A ruling" writes it.
   - Keep the earlier one.
   - The item is done when the chosen option is written as "Steps / Writing what settled" says.

### A plan already open

1. An answer that changes the text of an approved step of the open plan is written as its Rulings bullet, and the step's change is listed at the end (Steps 10) with the step's line and the changed text, for the user to rule on as the `spec` skill's "Steps / A ruling" handles a ruling.
   - The item is done when the end's list holds the change.
2. An answer that changes the entry's goal or gate is listed at the end with the lines of `plan.md`'s "## Goal" or "## Gate" it changes, for the user to rule on.
   - The item is done when the end's list holds the change.

### Writing what settled

1. Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included.
   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file, created with the heading line `# Rulings: <entry>` when it is absent.
   - It is one bullet: `- D<n> <the decision, as a phrase> (<date>): <the answer in one line> (the user).`
   - The phrase makes a step's `(ruling <name>)` tag name the decision as `D<n> <the decision, as a phrase>`.
   - A library pick names the capability in the phrase.
   - The item is done when the file, read back, holds the bullet whole.
2. Write the glossary term.
   - A term the interview settles is written into `docs/glossary.md` below the plan-terms block, in the file's form `- **<term>**: <definition>`, at once.
   - A term that clashes with the glossary's existing definition is put to the user as a decision.
   - A term the plan-terms block defines is never written into the block, since `/repo-setup sync` undoes it, and no copy of the `repo-setup` skill's `templates/plan-terms.md` is changed by this skill.
   - A clash with such a term is put to the user as a decision, its answer is written as a Rulings bullet, and the end lists it as a change for the user to make in the Ordo repository (Steps 10).
   - The item is done when the glossary, read back, holds the term whole.
3. Draft the change to the roadmap entry.
   - An answer that changes the goal, gate or text of an entry with a gate is drafted into the entry in the file's own format and under the `roadmap` skill's Rules: the goal, the gate and the dependencies only, nothing the user did not ask for, no history, another repository only as a path.
   - A changed gate is asked "could this pass without the goal being reached?", as the `roadmap` skill's "Steps / add" 3 says, and the answer with its reason goes in the diff and never in the entry.
   - The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.
   - An entry under "Not yet specified" is not moved and has no gate drafted into it: the settled gate is its Rulings bullet of item 1, and the end prints it (Steps 10).
   - The item is done when the diff is a decision of the next round, or, after the yes, the entry read back holds the change.
4. Ask whether to record an ADR.
   - An answer that is not obvious from the code, binds work after the plan that made it closes, and has alternatives rejected becomes the decision "record as ADR?" in the next round.
   - On the user's yes, write the record in the same turn.
   - Write it in the folder `adr` names, from its `template.md`, or from the form of the folder's latest record when it has no `template.md`.
   - A missing folder, or one with neither `template.md` nor a record, is created or filled first from the `repo-setup` skill's `templates/docs/adr/README.md` and `template.md`.
   - The record is numbered after the folder's highest, and its status is `proposed`.
   - Its decision is the ruled option, its context the facts the decision gave, its alternatives rejected the other options with their cons, and its consequences what the decision said follows.
   - The context, the alternatives rejected and the consequences are argued from this repository's goals, as the ADR folder's `README.md` says, and what other projects ship is evidence for them and never the reason by itself.
   - Its row goes into the folder's index when there is one.
   - A record that changes a decision of an ADR in force supersedes it as the ADR folder's `README.md` says.
   - A refinement of an ADR in force edits that record to its current state, with no dated note.
   - The item is done when the decision is in the next round, or, after the yes, the record read back holds the decision and its status.

## The decision form

Every decision of a round has these parts, in this order, and `references/decision-form.md` shows a round of two.

- **Heading.** `## D<n>. <the decision, as a phrase>`.
- **Options.** Each is lettered, with its pros and its cons.
- **Reference line.** It is always present, is labelled by the design bar for a design decision, and cites for the options what "The design bar" sets.
- **Recommendation.** `Recommend <letter>.` with its reason, argued from this repository's goals and chosen because it is the better design.
- **Lazy option.** The option that costs less now and leaves the work undone, or "none" with the reason when no option is.

- Each claim of the reference line has its source read in this session: a `path:line`, or a URL fetched in the session.
- A reference line is never written from memory.
- The reference line is the evidence the options are weighed with, and never the reason for the recommendation by itself.
- The roadmap diff, "record as ADR?", rule-clash and term decisions are about this repository's own pages: they have every part, their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry) read in this session, and the design bar and `design_references` do not apply to them.

## The design bar

- The design bar applies to design decisions only, as "The decision form" says.
- The design bar is `design_bar`, or the `--bar` value for this interview.
- Under `industry`, the reference line is labelled "Industry:" and cites what production projects in the field ship.
- Under `state-of-the-art`, it is labelled "State of the art:" and cites the best published work.
- Under `novel`, it is labelled "Novel:" and cites both, and each option goes beyond them and says what would show it works.
- `design_references` are the published standards every option is held to, and each option names the clause of each one that bears on it.

## Stops

The first three rows are stops, which wait on the user. The rest are refusals, which name their cause and change nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |
| The end | Steps 10 | The decisions settled with where each was written, the step changes owed, and the question of the shared understanding and the commit | The user's confirmation and answer on the commit |
| A lookup agent served another model | The runner served a lookup agent a model that is not the configured one ("Steps / Looking up a fact") | The configured value of `reviewer` and the served model | The user's instruction, then the lookup started again |
| No configuration | `.agents/plan.yaml` is missing | A refusal that names `/ordo-init` | `/ordo-init`, then `/grill` again |
| No such entry | `<entry>` matches no roadmap entry | A refusal that names `/roadmap add <goal>` | `/grill` with an entry that exists |
| A required key missing | A required key is not in `.agents/plan.yaml` | The key | The key added, then `/grill` again |
| An unknown bar | `design_bar` or `--bar` is not `industry`, `state-of-the-art` or `novel` | The three values | A value of the three, then `/grill` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Asking the user for a fact the skill can look up | The user's answer is a recollection, and it costs the user's time | Look the fact up and ask only the decision that rests on it ("Steps / Looking up a fact") |
| A decision asked while a decision it waits on is open | The user answers without the answer it depends on | Hold it for a later round (Steps 4) |
| An option chosen or recommended for costing less | The work it leaves undone comes back as a later item | Recommend the better design and name the cheaper option as the lazy option ("The decision form") |
| A reference line from memory | Its claim cannot be checked | Read the source in this session and cite its `path:line` or the URL fetched ("The decision form") |
| Batching the writes to the end | A compaction loses the answers, and the next round is drawn from state that is not written | Write each answer in the turn it settles ("Steps / Writing what settled") |

## Rules

- A fact is looked up, never asked.
- A decision is the user's: nothing is written as settled without the user's answer.
- Every answer is written in the turn it settles, before the next round is drawn up.
- No option exempts code from the standards pages: A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it.

### skills/grill/references/decision-form.md

# A round in the decision form

The example is a roadmap entry for a command-line tool `tally`, which counts the words of text files. The Rulings of its plan already hold bullets `D1` to `D3`, `libraries` is `avoid` and the design bar is `industry`, so this round is numbered `D4` and `D5`. The goals of `tally` are counts a user can check against `wc -w`, settings a person edits by hand, and one meaning for each setting. The decision about the ADR is about the example repository's own pages, so its reference line is labelled "Rule:" and cites a file of that repository, whose lines are the example's.

## The round, as the user reads it

```
## D4. The format of the settings file

- **A. TOML.** *Pro:* a small specification with obvious semantics, and Python's `pyproject.toml` is one. *Con:* deeply nested settings are verbose.
- **B. YAML.** *Pro:* nesting is compact. *Con:* one value can parse to more than one type, so a setting can change meaning between readers.
- **C. JSON.** *Pro:* every language reads it. *Con:* it has no comments, and a settings file needs them.

**Industry:** Python packaging lets any tool keep its configuration in the `[tool]` table of `pyproject.toml`, a file "written in the TOML format" (https://peps.python.org/pep-0518/ , fetched in this session); the TOML specification calls itself "a minimal configuration file format that's easy to read due to obvious semantics" (https://toml.io/en/v1.0.0 , fetched in this session).

**Recommend A.** The goals ask for settings a person edits by hand with one meaning each: TOML allows comments, and each of its values has one type, where YAML's can change type between readers. The reference line is the evidence for that, not the reason.

Lazy option: none. A, B and C cost the same to build.

## D5. What counts as a word

- **A. A run of characters delimited by white space.** *Pro:* one rule, the same result as `wc -w`, so a user can compare the two. *Con:* text in a script that does not separate words by spaces counts as one word per line.
- **B. Unicode word boundaries.** *Pro:* counts words in every script. *Con:* the rules are long, and a hyphenated compound counts as two words.
- **C. A now, boundaries for other scripts later.** *Pro:* it ships the count sooner. *Con:* the count is wrong for those scripts until the later work is done.

**Industry:** POSIX defines a word for `wc` as "a non-zero-length string of characters delimited by white space" (https://pubs.opengroup.org/onlinepubs/9699919799/utilities/wc.html , fetched in this session); Unicode's text segmentation standard defines word boundaries for selection, cursor movement and whole-word search, and lets an implementation tailor them (https://unicode.org/reports/tr29/ , fetched in this session).

**Recommend A.** The goals ask for counts a user can check against `wc -w`, and A gives the same count. The reference line is the evidence for that, not the reason. B would count a hyphenated compound as two words and differ from `wc -w`.

Lazy option: C. It costs less now and leaves the count wrong for texts A does not cover.

Answer as `D<n> => <letter or text>`, one line per decision; `D<n> Agree` takes the recommendation; `D<a>-<b> Agree` takes it for a range.
```

## The answers

```
D4 Agree
D5 => B
```

`D4 Agree` takes A. `D5 => B` takes B against the recommendation, which the user may do for a reason of their own, and the word "word" is now used in a sense the glossary lacks.

## What the answers write

The Rulings, or the rulings file when no plan is open, gain two bullets, in the same turn as the answers:

```
- D4 The format of the settings file (2026-09-30): TOML (the user).
- D5 What counts as a word (2026-09-30): Unicode word boundaries (the user).
```

The glossary, below the plan-terms block, gains the term the answer settled:

```
- **word**: a run of characters between two Unicode word boundaries.
```

D5 has alternatives rejected and binds the tool's later work, so the next round opens with this decision, numbered after the highest number shown:

```
## D6. Record D5 as an ADR

- **A. Record it.** *Pro:* the count's rule and the rejected alternatives stay findable after the plan closes. *Con:* one more record to keep current.
- **B. Keep it a Rulings line.** *Pro:* no new file. *Con:* the plan's ledger is archived when the plan closes, and the reason for the count goes with it.

**Rule:** `docs/adr/README.md:3` of the example repository keeps a record "per decision that is not obvious from the code and binds work after its plan closes".

**Recommend A.** The count decides what `tally` reports for every later feature, and a reader of the code cannot see why it was chosen.

Lazy option: B. It costs no file now and leaves the reason unrecorded.
```

On `D6 Agree`, the Rulings gain the bullet of the answer, in the same turn:

```
- D6 Record D5 as an ADR (2026-09-30): record it (the user).
```

The record is then written in the same turn in the folder `adr` names, from its `template.md`: numbered after its highest record, status `proposed`, its decision "Unicode word boundaries", its context the facts D5 gave, its alternatives rejected argued from the goals of `tally` (A counts text in a script without spaces as one word per line, and C leaves that count wrong until later work), its consequences that `tally` counts a hyphenated compound as two words and so differs from `wc -w` on it, that the boundaries are written by hand since `libraries` is `avoid`, and that a later change of the count supersedes the record; and its row in the folder's index.

## Changed lines of the other files, before and after

```
-Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, and `plan-retro` turns what the reviewers keep finding into rules.
+Around that loop, `repo-setup` and `ordo-init` set a repository up for it. `roadmap` keeps the entries the plans open, `grill` settles an entry's design decisions before its plan opens, and `plan-retro` turns what the reviewers keep finding into rules.
+| `grill` | Interviews the user about one roadmap entry, in rounds. Each round asks every decision whose prerequisites are settled, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, while agents look up the facts. It writes each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry and the glossary, and on the user's yes a proposed ADR |
+/grill <entry>                optional: an interview in rounds that settles the entry's design decisions, written as they settle
-    for skill in land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
+    for skill in grill land ordo-help ordo-init plan plan-orchestration plan-retro refute repo-setup roadmap spec; do
+/grill <entry>                optional: an interview in rounds that settles the entry's design decisions, written as they settle
+| The entry's design decisions are not settled | `/grill <entry>` |
-This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
+This page defines each term this project uses in a sense of its own. The terms the plan skills, `roadmap`, `grill`, `plan-retro`, `repo-setup` and `ordo-init` use in a sense of their own stand in the block below, which `/repo-setup sync` keeps equal to the `repo-setup` skill's template, so a change to one of them is made in that template only. The project's own terms follow the block, and each is used only in the sense defined here.
+- **decision form**: the parts every decision of a round has, in this order: a heading `D<n>. <the decision, as a phrase>`, the lettered options with their pros and cons, the reference line, `Recommend <letter>.` with its reason, and the lazy option named or "none" with the reason. Stated in: `grill`, "The decision form".
+- **design bar**: the standard a `grill` interview holds its options to and its reference line cites, `industry`, `state-of-the-art` or `novel`, set by `.agents/plan.yaml`'s `design_bar` and overridden for one interview by `--bar`. Stated in: `grill`, "The design bar".
+- **design tree**: the decisions a roadmap entry's goal and gate need, each with the decisions it waits on, each node a decision. Stated in: `grill`, Steps 3.
+- **frontier**: every decision of the design tree whose prerequisites are settled, all asked in one round. Stated in: `grill`, Steps 4.
+- **lazy option**: the option that costs less now and leaves the work undone, such as a booking instead of a fix, a later step instead of this one, a sentence in a report instead of a change in the code, or a narrower reading of the request than the request. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option"; `grill`, "The decision form".
+- **reference line**: the line of a decision that cites, for the options, what the design bar sets, labelled "Industry:", "State of the art:" or "Novel:", each claim with its source read in the session. Stated in: `grill`, "The decision form" and "The design bar".
+- **round, of an interview**: one message in which `grill` asks the whole frontier, ending the turn to wait for the answers; the bare "round" is a repair round. Stated in: `grill`, Steps 6.
-- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8.
-- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops.
+- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
+| An entry's design decisions are to be settled before its plan | `/grill <entry>` |
```

`docs/glossary.md` holds the same plan-terms lines as `skills/repo-setup/templates/plan-terms.md`, written by `python3 skills/repo-setup/templates/sync_rules.py . --only glossary --write`; `git diff --stat -- docs/glossary.md` follows.

```
 docs/glossary.md | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
```

## Repair round 1

Every point of `.scratch/2-e-grill/agents/briefs/12-round-1.md` is carried out. The whole current text of `skills/grill/SKILL.md` and `skills/grill/references/decision-form.md` is the file on disk; the changes are listed per point, old beside new.

1. Effort checks. New "Steps / Looking up a fact" 1: "Before the first lookup agent starts, check as the `spec` skill's Steps 1 does that the runner lists the effort agent `ordo-<reviewer_effort>` and that `CLAUDE_CODE_EFFORT_LEVEL` is unset (`printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1)." Either failing does not end the interview: the lookups are made by the session's own reads and the next round says so with the cause. No Stops row, since nothing waits on the user. Old: the item began "A lookup is made by the session's own reads, or by an agent the skill starts" with no check.
2. Plan-terms clash. Old: "a clash with one is put to the user as a decision whose change is made in the `repo-setup` skill's `templates/plan-terms.md`." New, "Writing what settled" 2: "no copy of the `repo-setup` skill's `templates/plan-terms.md` is changed by this skill" and "A clash with such a term is put to the user as a decision, its answer is written as a Rulings bullet, and the end lists it as a change for the user to make in the Ordo repository (Steps 10)". Steps 10 gains "List each clash with a term of the plan-terms block as a change for the user to make in the Ordo repository's `skills/repo-setup/templates/plan-terms.md`."
3. Repository-page decisions. Old (`SKILL.md` "The decision form"): "The roadmap diff and "record as ADR?" decisions have every part, their reference line citing the page that governs them." New: "The roadmap diff, "record as ADR?", rule-clash and term decisions are about this repository's own pages: they have every part, their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry) read in this session, and the design bar and `design_references` do not apply to them." "The design bar" gains its first bullet "The design bar applies to design decisions only, as "The decision form" says." and the Reference line bullet reads "labelled by the design bar for a design decision". The example's D6 carries `**Rule:**`.
4. Not yet specified. "Writing what settled" 3, old: "An entry under "Not yet specified" whose gate the interview settles is not moved, and the gate is recorded in the ruling of item 1." New: "An entry under "Not yet specified" is not moved and has no gate drafted into it: the settled gate is its Rulings bullet of item 1, and the end prints it (Steps 10)." The first bullet of that item now reads "the goal, gate or text of an entry with a gate". Steps 10: "Name `/roadmap add <entry>` ... and print the gate's text whole beside it, for the user to give that command."
5. Open plan and the entry. "A plan already open" 2 (new): an answer that changes the entry's goal or gate is listed at the end with the lines of `plan.md`'s "## Goal" or "## Gate" it changes; Steps 10 lists "the lines of `plan.md`'s "## Goal" or "## Gate" an answer changed".
6. Resuming. Steps 7 gains "An answer that names a number this session has not shown is not read: the skill says so and shows its current round again."; Steps 3's Resuming bullets gain "After such a restart, an answer to a number shown before is not read (Steps 7)."
7. This report gains "Judgment calls" and "The host-visible effect of the plan-terms change" below.
8. Completion criteria. Each item of "Looking up a fact", "Terms and claims", "An answer that contradicts" and "A plan already open" ends "The item is done when ...", and the separate last items are gone. Reading: a script over `SKILL.md` lists every numbered item between Steps and "The decision form" (24 items) and every one holds "done when"; the earlier reading's claim that the subsections held is replaced by this. The layout reading otherwise stands: sections in order (`## Quick start`, `## Use instead`, `## What it reads`, `## Steps`, `## The decision form`, `## The design bar`, `## Stops`, `## Anti-patterns`, `## Rules`), no other `##` heading, description 748.
9. Old: "...ending the turn to wait for the answers; the bare "round" is a repair round." New: "...ending the turn to wait for the answers. Inside `grill` the bare "round" means this; elsewhere it is a repair round. Stated in: `grill`, Steps 6." Sync written. `grep -n -w -o round skills/grill/SKILL.md | wc -l` printed 31, every one a round of an interview, which the entry now says the bare word means inside `grill`.
10. "ruling E (b)" removed at both places. Old: "as ruling E (b) says". New: "as the ADR folder's `README.md` says" ("An answer that contradicts" 2 and "Writing what settled" 4).
11. Old: "since a Rulings line of another plan holds `D1 (a)` inside its text." New: "since a `D<n>` inside a line can cite a decision of another interview or plan."
12. Old: "since the glossary's **question, the** is another thing." New: "since the glossary's term "question, the" is another thing." A grep for `**` finds bold only as list item labels and inside a code span.
13. Old Steps 8: "in the same turn as the answer and before the next round is drawn up." New: "at the time "Rules" gives." The old "Looking up a fact" 1 (restating "A fact is looked up, never asked") is removed; Rules holds it.
14. "Writing what settled" 1: "Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included." `references/decision-form.md` gains, on `D6 Agree`, the bullet `- D6 Record D5 as an ADR (2026-09-30): record it (the user).` before the record is written, and the record's consequences are concrete: a hyphenated compound counts as two words and so differs from `wc -w`; the boundaries are written by hand since `libraries` is `avoid`; a later change of the count supersedes the record.
15. Decision form, Recommendation, old: "with its reason, chosen because it is the better design." New: "with its reason, argued from this repository's goals and chosen because it is the better design." New bullet: "The reference line is the evidence the options are weighed with, and never the reason for the recommendation by itself." "Writing what settled" 4 gains "The context, the alternatives rejected and the consequences are argued from this repository's goals, as the ADR folder's `README.md` says, and what other projects ship is evidence for them and never the reason by itself." The example now states the goals of `tally` and its recommendations and the record's alternatives rejected follow them.
16. Comments now: `skills/plan/templates/plan.yaml:12` "# required. claude:<model> /refute, the brief check and the lookups of /grill run on."; `:27` "The effort a reviewer, a brief-check agent and a lookup agent of /grill run at:"; `skills/plan/templates/orchestrator-state.md:14` "# the model /refute, the brief check and the lookups of /grill run on:"; `:27` "# the effort a reviewer, a brief-check agent and a lookup agent of /grill run at:"; `.agents/plan.yaml:10` "# claude:<model> /refute, the brief check and the lookups of /grill run on." The glossary entries **effort agent** and **reviewer** name the lookup agent and point at `grill`, "Steps / Looking up a fact". `git grep -n -i "runs on\|brief-check agent run" -- skills/ordo-init/templates skills/land/templates utils` printed nothing and `grep -n -i comment skills/ordo-init/templates/check_config.py` printed nothing, so `check_config.py` and its test read no comment text.
17. **frontier**, old: "every decision of the design tree whose prerequisites are settled, all asked in one round." New: "every decision of the design tree whose prerequisites are settled, a decision waiting on a running lookup included and not yet asked; the round asks the rest in one message." Steps 4 says the same: "a decision waiting on a running lookup is in the frontier and not yet asked."

### Commands rerun

```
$ git grep -n "ruling E" -- skills; echo "rc=$?"
rc=1
$ grep -n -w -o round skills/grill/SKILL.md | wc -l
      31
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ python3 -c 'import glob,yaml; ...' (the length command, grill line)
748 skills/grill/SKILL.md
$ ls skills/grill/SKILL.md skills/grill/references/decision-form.md
skills/grill/references/decision-form.md
skills/grill/SKILL.md
$ git grep --untracked -n "/grill" -- skills README.md docs
README.md:32, skills/grill/SKILL.md:10, :15, :16, :17, :218 to :221, skills/ordo-help/SKILL.md:52, skills/plan/SKILL.md:25, :64, skills/plan/templates/orchestrator-state.md:14, :27, skills/plan/templates/plan.yaml:12, :27, skills/roadmap/SKILL.md:28
$ git grep --untracked -n -w grill -- README.md
README.md:7, README.md:16, README.md:32, README.md:86
$ LC_ALL=C grep -n '[^ -~]' over every changed and new file except the ledger
(nothing)
```

Verify list, verbatim:

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

### Judgment calls

- Required and optional keys (`SKILL.md`, "What it reads" 1): the brief lists ten keys with their defaults; I took the required and optional split from `skills/plan/templates/plan.yaml` (`roadmap`, `ledger_root`, `rules`, `libraries`, `reviewer` required; `standards`, `adr`, `design_bar`, `design_references`, `reviewer_effort` optional with the defaults the brief gives), since that file is where a key's requirement is stated.
- The heading line `# Rulings: <entry>` of a rulings file `grill` creates: the brief says "created with a heading line" and names none; `plan` Steps 2 copies only bullet lines, so any heading is safe, and this one names the entry.
- The extra Use instead row `| The repository has no `.agents/plan.yaml` | `/ordo-init` |`: the brief asks for "at least" three rows; the refusal for no configuration names `/ordo-init`, so the row states where to go.
- "What it reads" 8, the `repo-setup` skill's ADR and glossary templates: read only when a file must be created, since Steps 8 names them and an input the skill reads is listed in "What it reads".
- The Rules bullet "A decision is the user's": the brief lists "facts are looked up, decisions are the user's" as one rule; it is two bullets since either can be broken while the other holds.
- An answer the skill cannot read is asked again under a new number (the brief says "asked again in the next round"), so a written number never repeats.
- Numbers continue after the highest `D<n>` that opens a bullet and after every number shown in this interview, since the brief's rule alone would reuse a number shown and not answered.
- "What it reads" 2 also reads the roadmap file's introduction and status legend, since the entry diff is written in the file's own format.
- New in this round: the effort check has no Stops row (point 1) and its failure is shown in the next round; a plan-terms clash is a Rulings bullet and an end-list item for the Ordo repository (point 2); the "Rule:" label for decisions about the repository's own pages (point 3); the example's stated goals of `tally` and the wording of its D6 record (points 14 and 15).

### The host-visible effect of the plan-terms change

The next `/repo-setup sync` in every repository with the plan-terms block (game-engine, cathedra) rewrites its `docs/glossary.md` block to the template, so its glossary gains the entries below and changes the two entries after them and the two of point 16, and names `grill` in skills that repository may not have installed. Before, in game-engine and cathedra: none of the new entries; **ruling** and **rulings file** end as the base text ends. After, the lines the sync writes are the diff of `skills/repo-setup/templates/plan-terms.md` against the base:

```
+- **decision form**: the parts every decision of a round has, in this order: a heading `D<n>. <the decision, as a phrase>`, the lettered options with their pros and cons, the reference line, `Recommend <letter>.` with its reason, and the lazy option named or "none" with the reason. Stated in: `grill`, "The decision form".
+- **design bar**: the standard a `grill` interview holds its options to and its reference line cites, `industry`, `state-of-the-art` or `novel`, set by `.agents/plan.yaml`'s `design_bar` and overridden for one interview by `--bar`. Stated in: `grill`, "The design bar".
+- **design tree**: the decisions a roadmap entry's goal and gate need, each with the decisions it waits on, each node a decision. Stated in: `grill`, Steps 3.
-- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer and a brief-check agent as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check".
+- **effort agent**: one of the agent definitions `ordo-low`, `ordo-medium`, `ordo-high`, `ordo-xhigh` and `ordo-max`, installed with the plan skills, each setting the effort an agent runs at and no model; a builder is launched as `ordo-<worker_effort>`, a reviewer, a brief-check agent and a lookup agent of `grill` as `ordo-<reviewer_effort>`. Stated in: `plan-orchestration`, "Launching a builder"; `refute`, Steps 1; `spec`, "Steps / The brief check"; `grill`, "Steps / Looking up a fact".
+- **frontier**: every decision of the design tree whose prerequisites are settled, a decision waiting on a running lookup included and not yet asked; the round asks the rest in one message. Stated in: `grill`, Steps 4.
+- **lazy option**: the option that costs less now and leaves the work undone, such as a booking instead of a fix, a later step instead of this one, a sentence in a report instead of a change in the code, or a narrower reading of the request than the request. Stated in: `repo-setup`, `templates/shared-rules.md`, "Never take the lazy option"; `grill`, "The decision form".
+- **reference line**: the line of a decision that cites, for the options, what the design bar sets, labelled "Industry:", "State of the art:" or "Novel:", each claim with its source read in the session. Stated in: `grill`, "The decision form" and "The design bar".
-- **reviewer**: the fresh session or agent that refutes a built step without changing anything, on the model the configuration block's `reviewer:` names, which the brief-check agent also runs on. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction.
+- **reviewer**: the fresh session or agent that refutes a built step without changing anything, on the model the configuration block's `reviewer:` names, which the brief-check agent and the lookup agents of `grill` also run on. It is also called the refuter. Stated in: `refute`, Steps 1 and Rules; `plan-orchestration`, "The two tiers, and the models"; `plan-retro`, the introduction; `grill`, "Steps / Looking up a fact".
+- **round, of an interview**: one message in which `grill` asks the whole frontier, ending the turn to wait for the answers. Inside `grill` the bare "round" means this; elsewhere it is a repair round. Stated in: `grill`, Steps 6.
-- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8.
-- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops.
+- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
```
