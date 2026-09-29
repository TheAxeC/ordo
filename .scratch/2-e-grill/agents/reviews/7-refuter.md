# Step 7 refuter report (on .agents/worktrees/2e-7, base d0f912b6cb5a16a949cebcae7bf8532c91593c72)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

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
```
(`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md` from the worktree root; exit 0.)

```
$ git grep -n 'docs/dev/coding-standards\.md' -- ':!.scratch' ':!docs/roadmap.md'
(nothing, exit 1)
$ grep -n 'never invents a coding rule' skills/repo-setup/SKILL.md
(nothing, exit 1)
$ grep -c -F "The rules are Ordo's shipped defaults or the user's; the skill adds no other rule." skills/repo-setup/SKILL.md
1
$ grep -c -F 'A design ruling decides what is built. It never exempts the code: every line is written to the standards pages, so that people can read, use and maintain it.' skills/spec/templates/brief.md
1
$ grep -c -F 'docs/dev/design-principles.md' skills/ordo-init/SKILL.md
1
$ python3 -c 'import glob,yaml; ...'   (description lengths)
726 land, 632 ordo-init, 386 plan-help, 788 plan-orchestration, 616 plan-retro, 477 plan, 951 refute, 776 repo-setup, 997 roadmap, 1022 spec
$ LC_ALL=C grep -n '[^ -~]' <the seven changed files>
(nothing, exit 1)
$ git diff --numstat d0f912b
2 2 README.md / 2 2 docs/glossary.md / 2 1 skills/ordo-init/SKILL.md / 29 13 skills/repo-setup/SKILL.md / 2 1 skills/repo-setup/templates/CLAUDE.md / 2 2 skills/repo-setup/templates/plan-terms.md / 2 0 skills/spec/templates/brief.md
$ git status --short
 M README.md, M docs/glossary.md, M skills/ordo-init/SKILL.md, M skills/repo-setup/SKILL.md, M skills/repo-setup/templates/CLAUDE.md, M skills/repo-setup/templates/plan-terms.md, M skills/spec/templates/brief.md, ?? .scratch/2-e-grill/agents/reviews/7-report.md
```

The first runs on the base, rerun with `git grep <base>` and `git show <base>:<path> | grep`: grep 1 printed `skills/repo-setup/SKILL.md:114` and `skills/repo-setup/templates/CLAUDE.md:17`; grep 2 printed lines 145 and 156; the new-rule count, the brief.md count and the ordo-init count each printed 0. This matches the report.

The worktree's untracked copy of the report is identical to the main checkout's copy (`cmp` printed nothing). `land.sh` stages with the ledger root excluded and ignores it on the cherry-pick (its head comment and the `git add -A -- . ":(exclude,literal)<ledger_root>"` line), so the copy does not reach main.

Real run 1, reproduced in `$TMPDIR/refute7.O3Cz`. It is a git repository (`git ls-files | wc -l` printed 0) holding the untracked files `src/a.cpp`, `src/a.hpp` and `web/b.ts`, with extensions `cpp hpp ts`. I followed the worktree's Steps 1 to 5 with the brief's answers and wrote the four standards pages, the prose standard and `CLAUDE.md`. I did not write the other tree files, which this step does not change. The folder is removed (`ls -d ${TMPDIR}refute7*` printed "no matches found").
```
$ ls docs/dev docs/dev/coding-standards
docs/dev: coding-standards design-principles.md prose-standard.md
docs/dev/coding-standards: common.md cpp.md typescript.md
$ grep -c 'Svelte' docs/dev/coding-standards/typescript.md
0
$ grep -n -o '<[^>]*>' docs/dev/design-principles.md docs/dev/coding-standards/*.md | grep -v -e ':<>$' -e ':<const T>$'
(nothing, exit 1)
CLAUDE.md "Read before you act": the design-principles and coding-standards line, no UI line.
standards drafted by ordo-init Steps 7: [docs/dev/design-principles.md, docs/dev/coding-standards/common.md, docs/dev/coding-standards/cpp.md, docs/dev/coding-standards/typescript.md, docs/dev/prose-standard.md, docs/glossary.md]
```
The page set, the Svelte count, the placeholder grep and the `standards` line match the report. The wording that replaces each check placeholder differs from the builder's in places. Steps 3's rule ("in place of the placeholder's sentence part") does not fix one wording, but both readings state that the check is done by reading. Real runs 2 and 3 were not rerun; see their verdicts below.

## Verdicts

Items of the brief's "What to build":

- 1: holds. Question 6 and the new question 7 are written as the brief gives them, questions 8 and 9 are renumbered and the Stops row reads "The nine questions". "What it reads" 3 has the extension list and leaves out `.git/`. The tree lines, the Steps 3 placeholder and Svelte bullets, the Steps 8 `standards` bullet, the one Rules line and the Anti-patterns cell are in place, and the description is 776 characters. Findings Spec 2, Spec 3, Standards 1 and Standards 2 are gaps or contradictions around this item's text.
- 2: holds. `skills/repo-setup/templates/CLAUDE.md` lines 17 and 18 are the two group lines, in placeholder form.
- 3: holds. `skills/ordo-init/SKILL.md:67` keeps "every standards page the repository has, wherever it is", and its sub-bullet names the three installed paths as examples.
- 4: holds. In `plan-terms.md`, "questions, the" says nine and **standards** names the design principles, the coding-standards pages and the UI standard. `docs/glossary.md` is synced (`sync_rules.py` printed ok).
- 5: holds. `skills/spec/templates/brief.md:5` is a paragraph of its own after line 3, and the count is 1.
- 6: holds. `README.md:13` and `:97` read as the item says.

Cases of the brief's "Cases":

- `git grep` for `docs/dev/coding-standards.md` prints nothing: met.
- The `never invents` grep prints nothing and the new rule counts 1: met.
- The brief.md sentence counts 1: met.
- The ordo-init count is at least 1, and the line names the coding-standards pages and the UI standard: met, by the count and a reading of lines 67 and 68.
- `sync_rules.py` prints ok and **standards** names the new pages: met, by the command and a reading of `docs/glossary.md:83`.
- The description is at most 1,024: met (776).
- Real run 1: partial. The page set, the Svelte count, the placeholder grep, the `CLAUDE.md` lines and the `standards` line hold. The reading part ("no sentence that states nothing") does not: see Spec 1 and Proof 1.
- Real run 2 (`.svelte`, question 7 left at its default): partial. By reading Steps 3 (the Svelte bullets and "The draft shows the answer to question 7 as yes") and the tree, the draft gives yes, installs `ui-standard.md`, keeps the Svelte section, and `standards` gains the UI page. I did not rerun it. `cpp.md` is installed here as well, so Spec 1 applies.
- Real run 3 (SvelteKit named, no files): met, by reading. The kind gives TypeScript, question 3 gives Svelte, so the UI page is installed and the section is kept. No `cpp.md` or `python.md` comes from any source. I did not rerun it.
- The texts of items 1 to 6 read as the items say: met, read against each item (the item verdicts above).
- The unchanged-tree claims: met, reproduced on the base (Verification above).

## 1. Spec

- Spec 1. `skills/repo-setup/SKILL.md`, Steps 3, the placeholder bullets; and the pages the run installs from `templates/docs/dev/coding-standards/cpp.md` lines 16, 21, 26, 45 and 68.
  - Quoted: "Every placeholder of an installed standards page is filled from the answers ...". My run installed:
    - "When the repository builds with `-fno-exceptions` (no), a throwing standard operation stays out of every path that input reaches."
    - "Where the repository uses two-phase setup (no), ... Setup that needs a collaborator lives in `initialize`, which takes `scratch7::Context&`."
    - "Where the repository defines fixed-width aliases (none), declarations and members use them."
    - "When the repository is allocator-aware (no), these rules hold as well: ..."
  - What is wrong: Steps 3 has a rule for the one conditional section it knows about ("Svelte and SvelteKit", left out, heading included). It has none for a conditional rule whose choice placeholder is answered no or none. The installed page therefore keeps rules that the page itself says do not apply.
    - "(none), declarations and members use them" is the kind of sentence the case forbids: its example is a namespace called "none yet".
    - Line 26 also names a context type that does not exist, inside a rule that does not hold.
    - The step's goal is "adapted to its names with nothing left unfilled", and the case reads each page for a sentence that states nothing.
  - The builder raised this as its first point and called the fix "outside this step's paths". That is not so. A Steps 3 sub-bullet in `skills/repo-setup/SKILL.md`, which is in the paths, can say: "a rule or list item whose condition placeholder is answered no or none is left out of the installed page, with the placeholders only it holds", parallel to the Svelte rule. No brief item asks for that bullet, though (rules file, rule 20), so this is the orchestrator's call: add the bullet at landing, or rule on it.
  - Failure scenario: a new C++ repository answers no to exceptions, RTTI, two-phase setup and allocators. Its `cpp.md` then carries five inert rules and a named `scratch7::Context&`. A builder reads "Setup that needs a collaborator lives in `initialize`, which takes `scratch7::Context&`" and creates that type and an `initialize` member the repository never chose.
  - Verdict: real run 1 partial, real run 2 partial.
- Spec 2. `skills/repo-setup/SKILL.md`, "The tree", lines 129 to 131, against question 6.
  - Quoted: "docs/dev/design-principles.md    templates/docs/dev/design-principles.md, its placeholders filled" and "docs/dev/coding-standards/common.md   templates/..., its placeholders filled". Question 6 offers "or pages copied from a sibling repository ..., or pages written from rules the user states".
  - What is wrong: the old tree line ("docs/dev/coding-standards.md only when question 6 gave one") covered a page copied from a sibling or written from the user's rules. The new tree installs the templates unconditionally and has no line for the other two answers of question 6. The rewrite narrows the scope of the rule it carries (rules file, rule 17), and question 6 now contradicts the tree (rule 19). The brief's own item text ("always, from the templates") is the source, so the wording is the orchestrator's to settle.
  - Failure scenario: a user answers question 6 with "copy game-engine's `docs/dev/coding-standards.md`". The tree still writes Ordo's design-principles and common pages from the templates, and gives the sibling's page no path. The agent either writes both sets, which then conflict, or invents a path.
  - Verdict: none (item 1 holds as written).
- Spec 3. `skills/repo-setup/SKILL.md`, question 6, and tree line 131.
  - Quoted: "a language page under `docs/dev/coding-standards/` for each language of question 2" and "templates/docs/dev/coding-standards/<language>.md for each language as question 6 says".
  - What is wrong: question 2 accepts "another the user names", and templates exist only for C++, Python and TypeScript. Nothing says what happens for a kind with no template.
  - Failure scenario: kind `rust`. The defaults promise a Rust page that has no template. The agent either writes a `rust.md` of its own, which breaks "the skill adds no other rule", or skips it silently.
  - Verdict: none.

## 2. Proof

- Proof 1. The builder's report, "Real run 1", fourth bullet.
  - Quoted: "The installed pages and the scratch `CLAUDE.md`'s "Read before you act" lines were read whole. No sentence states nothing."
  - What is wrong: my reading of the page my run installed finds "Where the repository defines fixed-width aliases (none), declarations and members use them.", which states nothing, and the four "(no)" conditionals of Spec 1. The report's own "Points for the orchestrator" quotes the same sentences and still marks the case DONE.
  - The decision that rests on it: whether real run 1, the step's check, is met.
  - Failure scenario: the orchestrator reads DONE, lands the step, and every new C++ repository gets the inert rules.
  - Verdict: real run 1 partial.

## 3. Standards

- Standards 1. `skills/repo-setup/SKILL.md:163`, the Anti-patterns row.
  - Quoted: "| A coding rule the user did not state | The repository then binds builders to something nobody decided | See Rules: the skill adds no other rule |".
  - What is wrong: the new Rules line says the rules are "Ordo's shipped defaults or the user's", and question 6 installs the default pages, whose coding rules the user never states (for example "Members are `m_name`"). The row now forbids what the default does, and the rule it points to allows it: two statements that contradict each other (rules file, rule 19; a sentence the diff makes false, rule 14). The brief changed only the cell "See Rules: ...", but rule 19 binds the step.
  - Small fix at landing: the Anti-pattern cell becomes "A coding rule that is neither in Ordo's shipped pages nor stated by the user".
  - Failure scenario: an agent running `/repo-setup` reads the row and leaves out the default coding pages, or asks the user to state each rule, against question 6's default.
  - Verdict: none.
- Standards 2. `skills/repo-setup/SKILL.md:63`, Steps 8, read with the glossary term **standards** (`docs/glossary.md:83`).
  - Quoted: "The `standards` key it drafts lists every standards page written at Steps 5." The glossary's second sense lists the standard pages `/repo-setup` writes as "the change standard, the prose standard, the design principles, ...".
  - What is wrong: under the glossary's sense (docs/dev/skill-layout.md, "Writing for an agent": a glossary term is used only in a sense it defines), "every standards page written at Steps 5" includes `docs/dev/change-standard.md`. That page is the `rules` key, and the brief's expected `standards` line leaves it out. `ordo-init` Steps 7's list of kinds leaves it out as well, so the two texts disagree.
  - Failure scenario: `/repo-setup` passes `docs/dev/change-standard.md` into `standards`. Every brief then names the rules file twice, once as the rules and once among the standards.
  - Verdict: none.

## 4. Behaviour

- none. The report gives the before and after for question 6, the new question 7, the renumbered questions 8 and 9, the tree, the Rules line, the `ordo-init` line, `CLAUDE.md`, the glossary, `brief.md` and both README lines.

## The two points the report raises for the orchestrator

- The `<yes or no>` choices in `cpp.md`: a defect of the step, as Spec 1 says. The step's Steps 3 text decides how an installed page is adapted, and it leaves inert conditional rules. The fix belongs in `SKILL.md`, which is in the paths, not in the template.
- The `change-standard.md` placeholders filled at Steps 9: not a defect of this step. `git diff --numstat` shows no change to `skills/repo-setup/templates/docs/dev/change-standard.md`, and Steps 9 is unchanged. The order (Steps 5 writes the page, and Steps 9 fills its command block from `docs/dev/building.md`) predates the step. Whether it clashes with Steps 3's "never written as `<...>`" is a different concern from installing the standards pages.

## Declined to judge

- Real runs 2 and 3 were not rerun. Their verdicts rest on reading the skill text, and a rerun of each would settle them.
- The wording used in place of a check placeholder (the builder merged design-principles.md's two closing sentences; my run wrote "A principle is checked by reading at review."). Steps 3's "the placeholder's sentence part" allows both, and whether it should fix one wording is a style call for the orchestrator.
- Whether `check_config.py` accepts the drafted `standards` line in a full scratch `plan.yaml`. I did not run `/ordo-init`'s other steps, as the case excludes them.
- Whether question 7 should be worded as a question when the other items are noun phrases. The brief dictates its text.

Agent usage: (left for the orchestrator)
