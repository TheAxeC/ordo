# Step 14, the blind comparison of `grill` against `grill-with-docs` on entry 3

As `docs/dev/blind-comparison.md` says.

## The input

- Roadmap entry 3 of `docs/roadmap.md`, "The writing base", with the request to be interviewed until its design decisions are settled, in a clone of this repository at 833e2e8, the commit before step 13's interview.

## The key

- The input: roadmap entry 3 of `docs/roadmap.md`, in two identical clones of this repository at 833e2e8 (the commit before step 13's interview), origin removed, in the session's scratch folder `bc14/side-1` and `bc14/side-2`.
- side-1 is the new skill: `grill`, from `skills/grill/` of the clone, invoked as `/grill 3`.
- side-2 is the skill compared against: mattpocock's `grill-with-docs` (github.com/mattpocock/skills at d81f3a1, `skills/engineering/grill-with-docs/` with `skills/productivity/grilling/` and `skills/engineering/domain-modeling/`), invoked as `/grill-with-docs roadmap entry 3 of docs/roadmap.md`.
- Each side ran as a fresh agent on claude:opus with only its clone and its skill; the user was not available, so each side ends at its first message to the user and is judged on it, as `docs/dev/blind-comparison.md` item 1 says.
- Marks removed before judging: the agent name `ordo-high` in side-1's sentence on its lookup agents ("three lookup agents, `ordo-high` on opus;" became "three lookup agents on opus;"); each side's closing line on the files it wrote replaced by the same line, "Files written: none (`git status --short` printed nothing)."; side-1's report to the orchestrator around its message left out, the message itself kept whole.

## The order

- `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'` printed `new is A`.
- Judge 1: A is side-1 (`grill`), B is side-2 (`grill-with-docs`).
- Judge 2, the order swapped: A is side-2 (`grill-with-docs`), B is side-1 (`grill`).
- Each judge was a fresh agent on claude-opus-5-5 (from its transcript), given only a clean clone of the input at 833e2e8 and the two outputs.

## The outputs as judged

Each character outside ASCII in the outputs and verdicts is written as `<U+XXXX>`, its code point, since the repository keeps its files ASCII.

### side-1

````
Round 1 of the interview on roadmap entry 3, "The writing base". I read the entry, the rules file, the three standards pages, the glossary, the ADR folder (no records in force), the draft `.scratch/plan-drafts/3-the-writing-base.md`, the three `rebuild: writing` source files in `research-hub`, and the rulings of plan 2.E. The repository's goals are taken from `README.md:3-5`, since `docs/dev/design-principles.md` does not exist: the skills carry no project name and no path, everything specific to a repository comes from its `.agents/plan.yaml`, and the same skills run a code repository or a research project.

The facts the decisions rest on were looked up by three lookup agents on opus; the runner served each of them opus:
- which of your drafts are in `research-hub`, and in which fields;
- what production prose-review tools ship;
- what published style guides say.

D1 and D2 are the two decisions you ruled in plan 2.E (`.scratch/2-e-grill/plan.md:125`). They are asked again because entry 3 has no rulings file yet, and `/plan 3` carries into the plan only the rulings in that file. The rulings of plan 2.E are not carried. For D1 the recommendation is your earlier ruling. For D2 it differs from your earlier ruling in one clause, and D2 says why.

These decisions wait for a later round, because each depends on D3:
- where the prose standard's text lives;
- which prose standard a run holds a draft to;
- what a finding carries and who applies the change;
- which draft formats the review reads, and how it finds sections;
- the entry's gate;
- the diff of the roadmap entry;
- whether to record an ADR;
- the glossary term "writing base", which the roadmap uses at lines 75, 82, 89 and 103 and the glossary lacks.

## D1. Whether the writing base ships a counting script

- **A. A script `skills/writing/templates/counts.py` that computes only counts.** It would count non-ASCII characters by line, dashes and spaced hyphens by line, semicolons per 1000 words, words per sentence, and runs of five or more sentences of near-equal length. The counts would be shown beside the review as an indication and never as a finding, and your answer here would be the approval of what the script computes (`docs/dev/change-standard.md:19`). *Pro:* the counts are exact, and they point the reading at the lines where a count is high. *Con:* one more script and its test to maintain, and a count shown beside a finding is likely to be read as a verdict.
- **B. No script.** The review reads the draft, and the ASCII rule is checked with `LC_ALL=C grep -n '[^ -~]'`, as the prose standard's "How it is applied" already says (`skills/repo-setup/templates/docs/dev/prose-standard.md:75`). *Pro:* nothing to maintain, and every judgment stays a reading, as `docs/dev/change-standard.md:16-17` requires. *Con:* in a long draft, a run of sentences of the same length is found only by reading.

**Industry:** Vale "doesn't offer any of its own advice. Instead, it offers a framework for creating and enforcing custom rules" (https://docs.vale.sh/topics/readme.md, fetched in this session), and among its check types is readability, which scores "a block's prose" and reports "when the grade is too high" (https://docs.vale.sh/topics/styles.md, fetched in this session). vercel-labs/writing-guidelines ships no linter code. It ships a rules document and a review prompt that "reads files and outputs findings in a terse `file:line` format" (https://raw.githubusercontent.com/vercel-labs/writing-guidelines/main/README.md line 136, fetched in this session).

**Recommend B.** The prose standard is judged "per instance" and "nothing here is a target or a ratio" (`prose-standard.md:3`). Whether a sentence is filler or a run of sentences is monotonous is a judgment, and under `docs/dev/change-standard.md:16-17` a judgment is made by reading. The one fact check the rules need is already named at `prose-standard.md:75`.

Lazy option: none. B costs more reading on every run, and A costs a script and its test.

## D2. When entry 4, `code-comments`, is redrafted

- **A. After entry 3's redraft is approved, with entry 4 left as it is until then.** *Pro:* entry 4 is redrafted from its own sources, once, with entry 3 settled. *Con:* entry 4's "Waits on: 3, for the checks" (`docs/roadmap.md:68`) stays false until then, because under D1 B entry 3 has no checks.
- **B. Now, in this interview, alongside entry 3.** *Pro:* both entries are consistent at once. *Con:* entry 4 would be designed in an interview about entry 3, without its sources read.
- **C. After entry 3's redraft is approved, as in A, but this interview's roadmap diff changes the reason on entry 4's "Waits on" line to what entry 3 then provides, such as "for the prose rules".** *Pro:* the roadmap holds no false statement in the meantime, and entry 4 is still redrafted from its sources later. *Con:* one clause of entry 4 changes in the diff of an interview about entry 3.

**Rule:** the `roadmap` skill writes "the goal, the gate and the dependencies" and nothing the user did not ask for (`skills/roadmap/SKILL.md:156-157`), and "A change leaves no two statements that contradict each other" (`docs/dev/change-standard.md:50`).

**Recommend C.** It keeps your earlier ruling, which redrafts entry 4 later from its own sources, and it removes the one sentence that entry 3's redraft makes false, as `docs/dev/change-standard.md:50` requires. The earlier ruling was A. C differs from it only in that clause of line 68.

Lazy option: A. It costs no edit now and leaves a false dependency in the roadmap.

## D3. What the `writing` skill is

- **A. A folder of references only (`skills/writing/references/`), which the writing skills read and which has no command of its own.** *Pro:* the smallest skill, with one place for the rules. *Con:* each of `literature`, `paper`, `paper-review` and `grant` builds its own review of prose against those rules, and the entry's gate has nothing to run on a draft.
- **B. A folder of references plus a `/writing <file>` review, which reads a draft against the rules section by section and reports each violation with its line quoted and its rule named, the user deciding on each.** *Pro:* the review is built once and the later skills call it, and the gate can review a real run. *Con:* a skill to maintain, with Steps, Stops and Rules, where A has only references.
- **C. No `writing` skill: the academic rules added to the prose standard in `repo-setup`'s templates.** *Pro:* one page, with no new skill. *Con:* `repo-setup` installs that page into every repository it sets up, code repositories included (`README.md:113`), where tense per section of a paper has no use. It also contradicts the approved coverage list, whose rows 76, 100 and 101 name the `writing` skill.

**Industry:* Vale keeps its engine separate from its rule sets, which it installs as packages: "A package is a style, a configuration file, or both" (https://docs.vale.sh/keys/packages.md, fetched in this session), with Google and Microsoft among them. vercel-labs/writing-guidelines ships both a rules document, applied "so agents apply these guidelines during generation" (its `README.md` line 140), and a separate review prompt (its `README.md` line 136, fetched in this session). Vale's Claude Code plugin ships its review as skills (`fix`, `triage`), and `fix` "Fixes errors only; leaves warnings and suggestions for a person" (https://raw.githubusercontent.com/vale-cli/agent-tools/main/skills/fix/SKILL.md line 3, fetched in this session).

**Recommend B.** Entries 5, 6, 8 and 9 wait on entry 3 "for the writing base" (`docs/roadmap.md:75, 82, 89, 103`). B builds the review once for all four. A gate for a judgment is "a review: the user's, or a blind comparison" (`docs/dev/change-standard.md:21`), and only B gives that review a run to judge.

Lazy option: A. It costs less now and leaves the review to be built by each later skill.

## D4. How the prose standard and the academic sources combine where they differ

The rules differ in three places:
- **Em dashes.** The prose standard allows zero (`prose-standard.md:13`). The academic source allows at most three per paper and keeps quotations' punctuation (`research-hub/.agents/skills/academic-paper/references/writing_quality_check.md:60,63`).
- **Section outlines.** The prose standard bans describing what the page is about to do (`prose-standard.md:41`). The source keeps an introduction's section outline (`writing_quality_check.md:103`).
- **Quoted violations.** The prose standard fixes a quoted violation "at its source" (`prose-standard.md:75`), which a paper cannot do to a work it quotes.

Your drafts: every `.tex` draft in `research-hub` has zero U+2014 characters, and `---` is used as a prose em dash only in `projects/manuscripts/bttn-incident-af/manuscript/main.tex` (2 uses). The `.docx` draft `projects/manuscripts/erp-signatures/manuscript/main.docx` has 2 em dashes (lookup, `grep -c` per file).

- **A. The prose standard holds wherever it is stricter, with two exceptions for a manuscript: a direct quotation keeps its source's punctuation, and an introduction may close with a section outline.** *Pro:* one register for all of your prose, and the two exceptions are the places where a manuscript cannot follow the stricter rule. *Con:* two exceptions to state and to keep in the writing base.
- **B. The prose standard holds whole, with no exceptions.** *Pro:* no exceptions. *Con:* a quotation cannot be reproduced as its source prints it, and the section outline that readers in technical fields expect is cut.
- **C. The academic sources' limits hold for manuscripts (at most three em dashes per paper, and the outline exception), and the prose standard holds elsewhere.** *Pro:* it matches the source files. *Con:* two registers, and em dashes return to your papers.

**Industry:** the Google developer style guide uses the em dash "To indicate a break in the flow of a sentence" (https://developers.google.com/style/dashes, fetched in this session), and Microsoft's style guide allows it but says "don't overuse them" (https://learn.microsoft.com/en-us/style-guide/punctuation/dashes-hyphens/emes, fetched in this session). APA lists the few changes a quotation may undergo, and "Any other changes ... must be explicitly indicated" (https://web.archive.org/web/2024id_/https://apastyle.apa.org/style-grammar-guidelines/citations/quotations/changes, fetched in this session). ThinkSCIENCE says a section overview at the end of the introduction "is particularly common in technology, but less so in medicine" (https://thinkscience.co.jp/en/articles/effective-introductions-to-original-research, fetched in this session). The USC writing guide says "Always End with a Roadmap" (https://libguides.usc.edu/writingguide/introduction, fetched in this session).

**Recommend A.** The prose standard binds "Every prose surface in this tree" (`prose-standard.md:3`), and A keeps that register for your papers too. The two exceptions cover what a manuscript cannot do otherwise: it cannot change a quoted source, and a reader in a technical field expects the outline.

Lazy option: none. A, B and C cost the same to write.

## D5. Which disciplines the writing base's register and voice rules cover

The two coverage rows disagree:
- **Row 76** keeps, "Of six discipline registers", Engineering and CS only (`docs/academic-coverage.md:76`).
- **Row 100** keeps "each discipline's trusted voice", all five of its table (`docs/academic-coverage.md:100`; `writing_judgment_framework.md:28-34`).

Your drafts: of 24 manuscript and grant drafts, 11 are at biomedical or clinical venues and 2 in statistics, among them *Artificial Intelligence in Medicine*, *Biomedical Signal Processing and Control*, *Medical Image Analysis* and *Statistics in Medicine* (for example `projects/manuscripts/bttn-incident-af/manuscript/main.tex:23`, `projects/manuscripts/meseret-cirrhosis/manuscript/main.tex:1`). 7 are in machine learning theory and methods. The field of each draft is the lookup agent's reading of its venue and title lines.

- **A. Engineering and CS only, in both the register and the voice rules; row 100's reason is rewritten to say so.** *Pro:* the smallest set, and it matches row 76. *Con:* the drafts at clinical venues are held to a register their venues do not use.
- **B. Engineering and CS, and Medicine and Health, in both; the other registers are dropped, and rows 76 and 100 are rewritten to say so.** *Pro:* it covers the two fields your drafts are in. *Con:* two registers to keep, and two coverage rows to rewrite.
- **C. Every discipline of both sources.** *Pro:* nothing is dropped. *Con:* registers for humanities and education that none of your drafts use, and more to keep current.

**Industry:** Nature says "Using the active voice ('we performed the experiment...') typically helps readers better understand concepts and results described in a paper" (https://www.nature.com/nature-portfolio/for-authors/write, fetched in this session). The same ThinkSCIENCE page shows conventions that differ between technology and medicine (URL above). The source file itself gives Medicine and Health its own register: "evidence-hierarchy conscious", "Passive for methods, active for findings", with statistical reporting (`academic_writing_style.md:71-73`).

**Recommend B.** The writing base exists for your drafts, and they are in two fields, engineering and CS and medicine and health. B covers both and drops the registers none of your drafts use. It also ends the disagreement between rows 76 and 100.

Lazy option: A. It costs no row rewrite and leaves more than half of your drafts held to the wrong register.

Answer as `D<n> => <letter or text>`, one line per decision; `D<n> Agree` takes the recommendation; `D<a>-<b> Agree` takes it for a range.

Files written: none (`git status --short` printed nothing).
````

### side-2

````
Roadmap entry 3, The writing base: round 1

What I read before this round:
- the entry, `docs/roadmap.md` lines 56-61;
- the three `rebuild: writing` rows of `docs/academic-coverage.md` (lines 76, 100 and 101) and their source files in research-hub's `academic-paper/references/`;
- the prose standard, `skills/repo-setup/templates/docs/dev/prose-standard.md`;
- the section "Scripts compute facts; judgment is read" of `docs/dev/change-standard.md`, and `docs/dev/skill-layout.md`;
- the removed `/writing` skill as it stood before commit 6c41c02, with its 817-line `check_prose.py`;
- the redraft `.scratch/plan-drafts/3-the-writing-base.md`.

Two decisions are already settled in that redraft under "Axel's rulings (2026-09-30)", so I do not ask them again:
- D1 (b): there is no counting script. The review reads the draft, and `LC_ALL=C grep -n '[^ -~]'` is named for the ASCII rule.
- D2 (a): entry 4 is redrafted after entry 3 is approved.

This round asks every decision that depends on nothing still open.

---

<U+2753> **Q1** - **What entry 3 delivers, and what "writing base" names**: The goal as written asks for "a `writing` skill folder the writing skills share", holding the prose standard, the anti-pattern table and four checks. D1 already rules out a script for those checks, so the goal has to be rewritten. There are three shapes:

- (a) Reference pages only: `skills/writing/references/`, which `paper`, `literature`, `paper-review` and `grant` read, with no command of its own. Pro: it is the smallest thing that matches "the writing skills share", and entries 5, 6, 8 and 9 wait on it for exactly that. Con: `docs/dev/skill-layout.md` has no form for a skill without a description and `Triggers on:` (every section, Quick start included, is required), so this needs either an exception in the layout or a folder that is not a skill. It also leaves you with no way to review a draft on its own until entry 5.
- (b) Reference pages plus a `/writing <file>` review. The review reads a draft section by section against those pages and reports each violation with the line quoted and the rule named. You decide on each one. This is the redraft's proposal. Pro: it follows the layout as it stands, it can be used the day it lands, and the gate can be a real run on a real draft. Con: more to build, and the review has to be judged by reading (under D1, no script backs it).
- (c) The review only, with the rules inside its `SKILL.md`. Pro: one file. Con: the other writing skills would then read another skill's `SKILL.md` for their rules, which the layout's split between `SKILL.md` and `references/` is meant to prevent.

On terms: the glossary has no entry for "writing base". The roadmap uses it for the folder (entries 5, 6, 8 and 9 "wait on 3, for the writing base"), and entry 12 uses "the writing base's prose standard". I propose that **writing base** names the rules the writing skills share, and that **`/writing`** names the review, if there is one.

<U+27A1><U+FE0F> (b). It is the only shape that fits the layout without an exception, and it gives the entry a gate you judge on a real draft rather than a script's output. The lazy option is (a): it leaves out the review and pushes the layout question onto whoever builds entry 5.

---

<U+2753> **Q2** - **Where the prose standard lives**: The standard is now `skills/repo-setup/templates/docs/dev/prose-standard.md`. `repo-setup` copies it into every repository as `docs/dev/prose-standard.md`. `.agents/plan.yaml`'s `standards` names it, and `docs/dev/skill-layout.md` line 3 points at it. Plan 3 once moved it into `skills/writing/references/prose-standard.md`, and plan 2.C put it back ("the prose standard is back where it was at v2.0.0"). The options:

- (a) It stays where it is, and the writing base's pages point at it by path. Pro: one copy, with no second place to keep in step; the 2.C ruling stands. Con: a writing skill reads a file of the `repo-setup` skill, and it reads the repository's installed copy, which a project may have edited.
- (b) It moves into `skills/writing/references/`, and `repo-setup` copies it from there. Pro: the writing rules sit together. Con: this reverses 2.C's restoration, and every pointer changes (plan.yaml, the layout page, the shared rules, `common.md`, `CLAUDE.md` template).
- (c) Two copies, kept equal by a comparison like `sync_rules.py`. Pro: each skill is self-contained. Con: a second copy, plus a script and its test to keep them equal.

<U+27A1><U+FE0F> (a). The writing base adds only what the standard lacks, and it names the standard by path. The lazy option is none. (c) looks thorough, but it adds upkeep and no rule.

---

<U+2753> **Q3** - **Which rule wins where the academic sources and the prose standard disagree**: They disagree in at least three places:

- **Passive voice.** Prose standard section E, line 63: "rewrite unless the actor is irrelevant". `academic_writing_style.md` line 56, Engineering/CS: "Passive common for methods, active for contributions".
- **Paragraph length.** Prose standard line 48: "under roughly four sentences". `writing_quality_check.md` line 115 treats 150-200-word paragraphs as normal and flags only when they are all that length.
- **Em dash.** Prose standard: zero. `writing_quality_check.md`: at most 3 per paper.

A concrete case: a methods paragraph reads "Samples were centrifuged at 4000 g for 10 minutes, and the supernatant was discarded." Under the prose standard this is a finding unless "the actor is irrelevant". Under the Engineering/CS register it is the expected form.

- (a) The prose standard wins everywhere, and the academic pages add only rules it lacks. Pro: one standard, with no per-document switch. Con: some findings will contradict the conventions of the venue you submit to.
- (b) For an academic text, the academic register wins on the points where they disagree, and those points are listed by name in the writing base. Everywhere else the prose standard holds. Pro: the rules match reviewers' expectations. Con: two answers to one question, and the review has to know which kind of text it is reading.
- (c) Rule by rule, as you rule now, one line per point of disagreement.

<U+27A1><U+FE0F> (c), with the three points above settled now. My proposals: passive allowed in methods where the actor is the experimenter (which the standard's own "actor is irrelevant" already covers); paragraph length kept at the standard's four sentences; em dash kept at zero. On (a) and (b): (a) decides by default, and (b) makes the text's type a switch that every later skill must detect. The lazy option is (a): it avoids listing the points of disagreement and leaves them to show up as wrong findings on your first manuscript.

---

<U+2753> **Q4** - **Which prose the writing base covers**: The three sources are academic. The prose standard covers "every comment, page and message" (shared rules, line 23). Entry 12 (`project-docs`) says its READMEs follow "the writing base's prose standard". The options:

- (a) Academic prose only: manuscripts, grant sections, literature reviews. The prose standard alone stays the rule for Ordo's own pages, READMEs and messages. Pro: the academic rules (hedging, tense per section, "so what" per section) are never applied to a README. Con: `/writing` could not review a README, and entry 12 would read the standard directly.
- (b) All prose, with the academic pages applied only to academic text. Pro: one review for everything you write. Con: the review has to decide what kind of text it has, which ties back to Q3.

<U+27A1><U+FE0F> (a). The entries that wait on 3 (5, 6, 8 and 9) are all academic, and entry 12's phrase becomes "follows the prose standard", which is where that rule already lives. The lazy option is none. Both options cost about the same; (b) widens the scope without a consumer that needs it.

---

<U+2753> **Q5** - **The "history words" and "word counts per section" in the current goal**: Neither is in the three sources or the prose standard:
- The history rule is `docs/dev/change-standard.md` rule 10, about code, comments and rule files.
- Section word limits come from venues and funders: abstract limits and grant page limits. Entry 8 has "per-funder config: required sections, page limits", and entry 13 has "venue files in `venues/`".

The options, for each:

- History words: (a) dropped from entry 3; it stays a rule of the change standard and the shared rules, and entry 4 (`code-comments`) takes it for comments; (b) kept as a rule the `/writing` review reads for.
- Word counts per section: (a) the limit lives in the venue or funder file (entries 8 and 13), and `/writing` reports a section over a limit given to it, the count taken with a named command such as `wc -w` on the section (a count, which D1 allows as a command and not as a script); (b) dropped from entry 3 entirely and left to `paper` and `grant`.

<U+27A1><U+FE0F> History (a): a manuscript has no "history" in the change standard's sense, so reviewing it for that would only produce false findings. Word counts (a): the limit is a fact about the venue, the count is a fact a command computes, and whether to cut, and where, is the reading. The lazy option for word counts is (b): it moves a check you need on every grant onto two later entries without saying which of them builds it.

---

Next rounds, once these are answered: who reads in the `/writing` review (the session itself, or one fresh read-only agent); which file types it takes (`.md`, `.tex` with its `\input` files, and whether `.docx` grant text is in scope); the shape of its report; whether a separate anti-pattern table remains after Q2 and Q3; the new gate and its answer to "could this pass without the goal being reached?"; the "Waits on" wording of entries 5, 6, 8, 9 and 12; and which of the decisions qualify for an ADR. Nothing has been written to the glossary, the roadmap or `docs/adr/` yet, since no term or decision in this round is settled.

Files written: none (`git status --short` printed nothing).
````

## The verdicts

### Judge 1 (A is side-1)

````
Judgment of output A against output B: the first round of `/grill` on roadmap entry 3, "The writing base"

The standard I judged by: the entry text (`docs/roadmap.md:56-61`), the redraft that is the interview's input (`.scratch/plan-drafts/3-the-writing-base.md`), the ruling "Entry 3 and step 13" (`.scratch/2-e-grill/plan.md:125`), and the repository's own `grill` skill, which sets the form of a round (`skills/grill/SKILL.md` and `references/decision-form.md`). That form requires, for every decision: its options, their pros and cons, a reference line that is always present, one recommendation, and the lazy option named. Decisions are numbered `D<n>`, and the message ends with the answer form. `.agents/plan.yaml` sets no `design_bar`, so the default applies: `industry`.

What I checked, in the input repository and in research-hub:
- A's citations hold. That covers `prose-standard.md:3, 13, 41, 75`, `change-standard.md:16-17, 19, 21, 50`, `roadmap.md:68, 75, 82, 89, 103`, `skills/roadmap/SKILL.md:156-157`, `academic-coverage.md:76, 100, 101` and `README.md:3-5, 113`.
- A's research-hub lines hold: `writing_quality_check.md:60, 63, 103` and `academic_writing_style.md:71-73`.
- A's facts about the user's drafts held on spot checks. `bttn-incident-af/main.tex:23` is `\journal{Artificial Intelligence in Medicine}`, and `meseret-cirrhosis/main.tex:1` names Statistics in Medicine. `grep -c '<U+2014>'` prints 0 for the `.tex` drafts, and `---` is used as a prose dash at `bttn-incident-af/main.tex:217`.
- B's citations hold: `prose-standard.md:48, 63`, `academic_writing_style.md:56`, `writing_quality_check.md:115`, change-standard rule 10 (line 36), the 2.C phrase "back where it was at v2.0.0" (in the archived 2.C `plan.md:7`), and entry 12's "the writing base's prose standard" (`roadmap.md:122`).

Not checked:
- The external URLs in A. I fetched none of them.
- A's statement that its lookup agents were served opus.
- A's count "11 of 24 drafts at biomedical or clinical venues". Only the two spot checks above were made.
- B's "shared rules, line 23". The phrase "every comment, page and message" does exist in the repository's diffs of the shared rules.

**Critical failures of A**

1. D2 misstates the user's earlier ruling. Line 8 says: "For D2 it differs from your earlier ruling in one clause". Line 39 says: "The earlier ruling was A. C differs from it only in that clause of line 68."
   - The ruling at `.scratch/2-e-grill/plan.md:125` already reads "D2 (a), entry 4 is redrafted after entry 3 is approved, waiting on 3 for the prose rules only". The redraft's option (a), line 28, says the same.
   - So A's recommended option C is what the user already ruled, and the input contradicts A's claim that C departs from it.
   - The practical harm is small: agreeing to C yields what he ruled. But the user is told he is being asked to change a ruling he is not changing.

A also asks D1 and D2 again, although the user ruled them settled. I do not count this as a critical failure. A gives the reason: `/plan 3` carries only the entry's rulings file. The skill supports that reason. `SKILL.md:46` and `:68` count a decision as settled only by the entry's own plan Rulings or rulings file, and `skills/plan/SKILL.md:40, 52` copy only that file. A says plainly that it is re-asking and recommends the earlier ruling for D1. There is one cosmetic defect: "**Industry:*" at line 49 is missing an asterisk.

**Critical failures of B**

1. No decision has a reference line. Q1 to Q5 (lines 19-75) each go straight from their options to "<U+27A1><U+FE0F>" with no "Industry:" line and no "Rule:" line.
   - The skill's form requires a reference line always (`SKILL.md:202`), and entry 2.E's own goal describes each question with it.
   - Q2 and Q4 are design decisions, which need "Industry:" evidence read in this session.
   - Q3 is a rule clash, which needs a "Rule:" line.
   - So the round leaves out a part the input requires. It also offers no outside evidence for the questions of register and dashes, where the user's choice depends on it.
2. The round is not in the answer form the skill defines.
   - Decisions are numbered Q1 to Q5 rather than continuing `D<n>` after D1 and D2 (`SKILL.md:86`).
   - The message has no closing line of the form `D<n> => <letter or text>` / `D<n> Agree` (`SKILL.md:6`, step 6).
3. The message has non-ASCII emoji ("<U+2753>", "<U+27A1><U+FE0F>") in every decision (lines 19, 27, 31, 37 and on).
   - The prose standard binds "shipped diagnostics and messages" and requires a scan for non-ASCII (`prose-standard.md:3, 75`).
   - This is the standard the interview is about, so the message breaks the rule it asks the user to settle.
4. Q3 (lines 41-53) is incoherent as a decision.
   - It recommends (c), "rule by rule", and then folds three unasked sub-rulings into the recommendation, with no options or pros and cons for any of them.
   - Its worked example ("Samples were centrifuged...") is labelled the Engineering/CS register, but it is a wet-lab methods sentence.
   - B then says the prose standard's "actor is irrelevant" clause already covers the example. That dissolves the clash the example was chosen to show.

Minor points in B:
- It treats D1 and D2 as settled. The input supports this (redraft lines 30-33, `plan.md:125`). But B does not note that nothing carries those rulings into `/plan 3`.
- Its summary of D2 drops "waiting on 3 for the prose rules only".
- It looks up no facts about the user's drafts, and none of its decisions rests on them.

**Verdict: A**

1. A's round is complete in the form the input sets. Every decision (D1-D5) has options, pros and cons, a reference line, a recommendation and the lazy option, and the message ends with the answer form (line 92). B has neither the reference lines nor the answer form. The missing reference lines are the largest gap between the two outputs.
2. A grounds its decisions in facts it checked, and my checks held.
   - D4 (lines 55-72) finds the three real clashes and shows how the user's own drafts use em dashes.
   - D5 (lines 74-90) finds the disagreement between coverage rows 76 and 100, and decides register coverage from the venues of the user's drafts. The source files support this: `academic_writing_style.md:71-73` gives Medicine and Health its own register.
   - B raises some of the same clashes (Q3) but with no evidence, and it leaves register coverage out.
3. A orders the round by dependency, as the skill requires. It asks what the skill is (D3) first and lists, at lines 10-18, the eight decisions that wait on it. The glossary gap for "writing base" is among them.
   - B raises some useful points A lacks: Q2 on where the prose standard lives, and Q5 on history words and word counts.
   - But B asks Q2 and Q4 alongside Q1, although both depend on it.
4. A's one critical failure is the misstated D2 ruling. It is a false statement about the user's history, but the option recommended is the one he ruled. B's failures are structural and affect every decision in the round.
````

### Judge 2 (A is side-2)

````
Judgment of output A against output B: the first round of `/grill` on roadmap entry 3.

What I checked: the input repository at `.../scratchpad/judge/input`. That covers `docs/roadmap.md`, `skills/grill/SKILL.md` (the standard for what a round must contain), `.agents/plan.yaml`, the prose standard, `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, `docs/academic-coverage.md`, `.scratch/plan-drafts/3-the-writing-base.md`, `.scratch/2-e-grill/plan.md` and `skills/roadmap/SKILL.md`. I also checked the research-hub source files the outputs cite, which are reachable at `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/references/`.

**The standard used**
`plan.yaml` sets no `design_bar`, so the default applies: `industry`. Under `skills/grill/SKILL.md`, "The decision form" (lines 196-209) and Steps 6 (lines 85-90), every decision of a round must have:
- a `## D<n>.` heading;
- lettered options with pros and cons;
- a reference line that is "always present". For a design decision it is labelled "Industry:". It cites a `path:line` or a URL fetched in the session, and is "never written from memory";
- `Recommend <letter>.`;
- the lazy option.

The message must also end with the answer form (`D<n> => ...`, `D<n> Agree`).

**Critical failures of A**

1. No reference line in any decision. Q1 to Q5 each go from options straight to "<U+27A1><U+FE0F>" and a recommendation. None has an "Industry:" or "Rule:" line, and nothing cites what production projects ship. The skill calls this part "always present" and "the evidence the options are weighed with". This removes a required part of every decision in the round.
2. The answer form is missing. A ends at "Files written: none (`git status --short` printed nothing)." (line 81). It has no `D<n> => <letter or text>` / `D<n> Agree` instruction, which Steps 6 requires.
3. The decisions are not in the decision form. Its headings are "<U+2753> **Q1** - ..." and so on, not `## D<n>.`, and each recommendation is "<U+27A1><U+FE0F> (b)." rather than "Recommend B.". The emoji break the repository's ASCII rule (prose standard, section B). Numbering the decisions as questions also goes against Steps 3, which says a decision is never called a question.

A's factual claims hold where I checked them:
- the entry is at roadmap lines 56-61;
- the coverage rows are 76, 100 and 101;
- `academic_writing_style.md:56` is the Engineering/CS voice line;
- `writing_quality_check.md:115` is the 150-200-word pattern;
- the prose standard's lines 48 and 63 say what A quotes;
- the shared rules' line 23 says "every comment, page and message";
- 2.C's "back where it was at v2.0.0" is at `.scratch/archive/2-c-.../plan.md:7`;
- the skill-layout table marks every section required;
- the D1/D2 rulings are quoted correctly from redraft line 33.

**Critical failures of B**

1. B misstates your earlier D2 ruling (section D2, lines 33-39). It says "The earlier ruling was A. C differs from it only in that clause of line 68." In B, option A is "with entry 4 left as it is until then", and option C changes entry 4's "Waits on" to "for the prose rules". The input contradicts this. The redraft's option (a) (`.scratch/plan-drafts/3-the-writing-base.md:28`) and the booked ruling (`.scratch/2-e-grill/plan.md:125`) both already read "waiting on 3 for the prose rules only". Your ruling already is B's option C, so B presents a settled decision as needing a change to your ruling. The harm is limited because B recommends what you ruled, but the claim about your ruling is false.

Non-critical points in B:
- **Re-asking D1 and D2.** B does this deliberately and gives the reason. The skill's Steps 3 and "What it reads" 6 count a decision as settled only by the entry's own plan Rulings or its rulings file, and `.scratch/rulings/` does not exist. The re-asking is therefore consistent with the skill, though it asks you again for rulings you gave.
- **The em-dash claim in D4, line 62.** B says "every `.tex` draft in `research-hub` has zero U+2014 characters". That is too broad: `projects/archive/.../fbttr-strategies/.../main.tex` (4), the phd-thesis chapter 3 (5) and the dries-bttr-ecg thesis notes all contain U+2014. It holds only if "draft" means current manuscript drafts. No recommendation rests on it alone.
- **A formatting slip.** D3 has "**Industry:*" with a missing asterisk.
- **History words and word counts per section.** The current goal names both, and B neither asks about them nor lists them among the decisions left for a later round. A does ask (its Q5).

B's other citations hold where I checked them:
- `prose-standard.md:3, 13, 41, 75`;
- `change-standard.md:16-17, 19, 21, 50`;
- `skills/roadmap/SKILL.md:156-157`;
- roadmap lines 68, 75, 82, 89 and 103;
- `writing_quality_check.md:60, 63, 103`;
- `academic_writing_style.md:71-73`;
- `writing_judgment_framework.md:28-34`;
- `bttn-incident-af/manuscript/main.tex:23` ("Artificial Intelligence in Medicine") and the 2 uses of `---` at its line 217;
- `meseret-cirrhosis/manuscript/main.tex:1` ("Statistics in Medicine").

Not checked:
- B's web citations (Vale docs, vercel-labs README, the Google and Microsoft style guides, APA, ThinkSCIENCE, USC, Nature, the Vale agent-tools skill);
- the claim that the runner served each lookup agent opus;
- the count of 24 drafts by field (11 biomedical or clinical, 2 statistics, 7 ML).

**Verdict: B**

1. B produces the round the skill defines and A does not. B has D-numbered headings, lettered options with pros and cons, a reference line on every decision ("Industry:" for D1, D3, D4 and D5, and "Rule:" for D2, which concerns the roadmap page), "Recommend X.", the lazy option, and the answer form at line 92. A has no reference line in any decision and no answer form (A's critical failures 1 and 2). Those are required parts of every round, not matters of style.
2. B grounds its decisions in evidence the skill asks for, and A does not:
   - the discipline split in your own drafts, which is behind D5's recommendation of Engineering/CS plus Medicine/Health;
   - the quotation and section-outline exceptions in D4, from `writing_quality_check.md:63, 103`;
   - outside practice in the reference lines.

   A's recommendations are argued only from the repository's pages.
3. B's one critical failure is serious but narrow. It misreports your D2 ruling, yet what it recommends matches that ruling. A's failures affect every decision in the round.
4. A is better on some content:
   - its Q5 covers history words and per-section word counts, which B drops;
   - its Q1 option (a) notes that a references-only folder does not fit the skill layout;
   - its facts are all accurate;
   - it treats your D1 and D2 rulings as settled, which respects them but does not follow the skill's rule on where a settled ruling must be written.

   These do not outweigh the missing reference lines and answer form. A fixed version of A would need those parts added throughout, while a fixed version of B needs one sentence of D2 corrected and one decision added.
````

## The user's call

- Not yet made.
