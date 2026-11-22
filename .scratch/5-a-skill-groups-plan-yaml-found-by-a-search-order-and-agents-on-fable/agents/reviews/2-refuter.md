# Review of step 2 of plan 5.A

Worktree: `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable-2`, base `06dacd6`. Nothing in the worktree was changed. Three findings need a change before landing: Behaviour 1 (check mode of `pin.sh` passes on a skill folder missing on disk), Standards 1 (four sentences of `docs/academic-coverage.md` made false) and, for the orchestrator's ruling, Standards 2 (eleven rewritten paths that name no file).

## 1. Verification

Run from the worktree's root with `CLAUDE_CONFIG_DIR`, `ORDO_SKILL_DIRS` and `ORDO_STABLE` unset.

The ten tests, each through `2>&1 | tail -1`:

```
skills/code/code-comments/templates/strip_comments.test.sh: PASS: strip_comments.py scratch tests
skills/orchestration/land/templates/land.test.sh: PASS: land.sh scratch tests
skills/ordo/ordo-init/templates/check_config.test.sh: PASS: check_config.py scratch tests
skills/academic/paper/templates/anchorize_tex.test.sh: PASS: anchorize_tex.py leaves the .tex byte-identical, makes one block of a paragraph run and of an environment with a blank line inside, makes separate blocks of the paragraphs inside a document environment, and writes a manifest whose blocks and separators hold the whole file
skills/academic/paper/templates/apply_tex_patch.test.sh: PASS: apply_tex_patch.py replaces, inserts after and deletes only the blocks a patch names with the manifest's hashes and writes the apply report, rejects a wrong hash, a stale manifest, two ops on a block, a stale op among good ones and an output equal to the patched .tex with exit 2 and nothing written, answers a heading change, a deleted section and more than 0.6 of the blocks with exit 3 and nothing written unless acknowledged, and writes nothing with --check-only
skills/academic/paper/templates/calibration_counts.test.sh: PASS: calibration_counts.py counts misses and false alarms per label, exits 0 below the limits 0.15 and 0.10, exits 1 at or above one, and exits 2 for a label outside the three
skills/academic/paper/templates/lookup.test.sh: PASS: lookup.py parses recorded bodies, matches titles, merges records, reads passage lines, finds passages, rebuilds abstracts, writes arXiv and OpenAlex queries, paces every arXiv request across processes, requests only http and https URLs, leaves out an index whose body does not parse, prints not found, names files, URLs and credentials safely, reads BibTeX and HTML, fetches a source by an OpenAlex ID or a Semantic Scholar ID through the record of that ID's index, reads the keys a .tex cites with the commands of natbib and biblatex and the files it inputs and prints the keys the .bib lacks and the entries no key cites, compares the title of a key with a doi with the record the doi resolves to and names an index that was left out, reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, refuses the one-argument check-urls and the two-argument quote-check, prints the retraction and expression-of-concern notices of a Crossref record and none for a correction, an erratum or a work without a notice, prefers the candidate of the year given for a title, gives the published version of an arXiv ID the entry doi.org gives for its published DOI or the line that names its venue, builds and refuses the entry of a venue's page, fetches the PDF a venue's page names, writes every bibtex entry in ASCII and compares a converted title as the original, keeps the URLs of the other commands, paces every API host across processes, waits out a 429 by its Retry-After, leaves a 429 that names more than 60 seconds out at once with its reason, names the host of a redirect hop that met it, and writes the skip file of the host, caches the index replies of resolve and search on disk for 30 days, prints the PMCID an OpenAlex record names, prints every author and the volume, the issue and the pages of a record of resolve and three authors of a record of search, writes with text the text of a saved HTML, XML or PDF file as <stem>.txt, or with text --abstract as <stem>.abstract.txt, and refuses to replace one, lists with refs and cited-by the works an input cites and the works that cite it from OpenAlex, Semantic Scholar and Europe PMC, resolves several inputs in batches, writes with index-abstract the abstract of the first index that gives one, finds a title's records in DBLP by its exact forms first and names a cut at 1000 rows, adds PubMed to search, and paces E-utilities, Europe PMC and DBLP
skills/academic/paper/templates/reference_docx.test.sh: PASS: reference_docx.py writes the layout defaults into the styles and the section properties, lets each profile field override its default, escapes a font name, leaves every other part as pandoc wrote it, refuses a file that is not a .docx and a value outside a field's form, and writes a document pandoc takes as its reference document
skills/ordo/repo-setup/templates/sync_rules.test.sh: PASS: sync_rules.py scratch tests
utils/pin.test.sh: PASS: pin.sh scratch tests
```

`python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`:

```
ok: the plan-terms block equals the template
```
Exit 0.

The character-set check of `docs/dev/change-standard.md`, fed the 41 files `git status --short` marks ` M` and every file under `skills/`: printed nothing.

C1, `sh utils/pin.test.sh 2>&1 | grep '^ok:\|^PASS'`:

```
ok: a grouped tag is pinned
ok: a grouped tag pinned over a flat pin
ok: one skill name in two groups is refused
ok: one skill name in the flat and the grouped place is refused
ok: a flat tag pinned over a grouped pin
ok: check mode names a link at the flat place on a grouped pin
ok: a grouped tag that drops a skill removes its link
ok: a SKILL.md inside a ledger folder is no skill
PASS: pin.sh scratch tests
```

C2, the README's loop taken with `sed -n '/^for dir in ~\/.claude\/skills; do$/,/^done$/p'`, `/tmp/ordo` replaced by the worktree's root and `~/.claude/skills` by `<scratch>/skills`: under `sh`, exit 0, `ls <scratch>/skills | wc -l` printed `16`, `ls <scratch>/skills/*/SKILL.md | wc -l` printed `16`, and `<scratch>/agents` held the five `ordo-*.md`. Under `zsh`: `16`. From a copy of `skills/` and `agents/` with `skills/orchestration/spec` removed:

```
no skill at <scratch>/copy/skills/orchestration/spec; the copy stopped before spec
```
Exit 0; the target held `grill`, `plan`, `roadmap`.

C3, the gate's `perl` line fed `find . -type f` outside `.git`, `.scratch` and `.agents/worktrees`: printed nothing.

C4: `ls skills` printed `academic code orchestration ordo`; `find skills -name SKILL.md | wc -l` printed `16`; `ls skills/*` printed `academic: paper writing`, `code: code-comments diagnose`, `orchestration: grill land plan plan-orchestration plan-retro refute roadmap spec`, `ordo: ordo-help ordo-init repo-setup session-retro`. All sixteen `SKILL.md` stand four path parts deep.

C8, the Steps of `/ordo-help skills` by hand: on a scratch folder of sixteen links into the worktree, `cd <scratch>/inst/ordo-help && pwd -P` gave `<worktree>/skills/ordo/ordo-help`, whose parent stands directly in a folder named `skills`; `ls -d <worktree>/skills/*/*/SKILL.md | wc -l` printed `16`. On a flat copy the parent's parent is not named `skills`, and `ls -d <copy>/*/SKILL.md | wc -l` printed `16`.

C9:
```
--- from the worktree's root
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists     (exit 0)
--- <scratch>/flat/ordo-init with <scratch>/flat/plan
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists     (exit 0)
--- through the link <scratch>/links/ordo-init
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists     (exit 0)
--- <scratch>/only/skills/ordo-init alone
error: the plan skill's templates/plan.yaml is in neither <scratch>/only/skills/plan nor <scratch>/only/*/plan     (exit 1)
```
`check_config.test.sh` run from the flat copy printed `PASS: check_config.py scratch tests`; run with `plan` in neither place it printed its `FAIL: no templates/plan.yaml of the plan skill beside ...` line.

The builder's evidence, rerun: 127 files under `skills/`, 4 differ from `git show 06dacd6:<old path>` (`grill/SKILL.md`, `ordo-help/SKILL.md`, `check_config.py`, `check_config.test.sh`), 123 byte-equal; `git diff 06dacd6 --numstat` gives the report's numbers (`pin.sh` 54/28, `pin.test.sh` 141/3, `README.md` 16/12, 29 ADR files 48/48); `grep -rn 'skill_root\|skills_of'` outside `.scratch`, `.git` and `.agents` prints nothing. These match the report.

## 2. Verdicts

Items of "What to build":

1. Holds.
2. Holds. Behaviour 2 is a side effect of the fallback the brief dictates.
3. Violated in one respect: Behaviour 1. The rest holds.
4. Holds.
5. Holds.
6. Violated: Standards 1. Standards 2 is for the orchestrator's ruling.
7. Holds: the diffs of the four edited files under `skills/` hold no `version` line.

Cases:

- C1: met. The run after reproduces. The first-run lines on the unchanged `pin.sh` were not rerun (see "Declined to judge").
- C2: met.
- C3: met, with `find` in place of `git ls-files`.
- C4: met.
- C5: not verifiable; `npx` was not run.
- C6: met (case "one skill name in two groups is refused").
- C7: met (case "a grouped tag pinned over a flat pin").
- C8: met.
- C9: met.

## 3. Spec

1. No case covers what Behaviour 1 describes. `docs/dev/change-standard.md`, "Scripts compute facts", keeps a test for "a broken installation"; check mode reporting a broken link as sound is that cost, and the plan's gate rests on it ("`utils/pin.sh` with no tag then reports every link resolving to a folder that holds `SKILL.md`"). The fix is a script defect, so rule 1 asks for its test first.

No decision reserved for the user was taken, and no ADR governs where a skill folder stands, how `pin.sh` reads a tag, or how `check_config.py` finds the `plan` skill (`grep -lE 'pin\.sh|ordo-help skills|check_config' docs/adr/*.md` prints nothing).

## 4. Proof

1. For four of the eight new cases the failing line quoted from the unchanged `pin.sh` is the setup pin, not the case's own assertion: "a flat tag pinned over a grouped pin", "check mode names a link at the flat place on a grouped pin", "a grouped tag that drops a skill removes its link" and "a SKILL.md inside a ledger folder is no skill" all fail with `pin: tag g1 holds no skill` (or `g1-ledger`). The unchanged script cannot reach a grouped pin, so the run shows only that a grouped tag did not pin. What each case proves rests on reading, given below. Failure scenario: a reader of the report's table takes the quoted line as proof of the one-line check, the removal and the ledger rule, which it is not.

The new cases, read against `pin.sh`. Each would fail with its behaviour taken out:

- A grouped tag is pinned: `expect_links` compares each link with `$ORDO_STABLE/skills/one/beta` and `.../two/gamma`, and the skills line with `2 skills`. Without the grouped `sed` expression the tag holds no skill.
- A grouped tag over a flat pin: `expect_links` on the group paths fails if the link stays at the flat place. The `case "$(links_state)"` block after it cannot fail once `expect_links` has passed; it is redundant, not wrong.
- One name in two groups, and one in the flat and the grouped place: `expect_refused v4` checks exit 1, the worktree's tag and both link listings, and `expect_line` checks the whole message. Without the `doubled` lines the pin exits 0.
- A flat tag over a grouped pin: `expect_links` on the flat paths, then check mode exit 0.
- Check mode, link at the flat place: exit 1, the whole "does not link to" line, and `grep -c -F` equal to 1 over the lines naming `$d1/beta`. Without `in_list "$stable_skills"` in the second loop of `check_links`, the "which the pinned tag does not have" line is printed too and the count is 2.
- A grouped tag that drops a skill: `[ -L "$dir/gamma" ]`, the removal line for both folders, and `expect_links beta`. With the removal loop still testing `<root>/<name>/SKILL.md`, the link of `beta` would be removed as well and `expect_links` fails.
- A `SKILL.md` in a ledger folder: the fixture file is named `beta` under `.scratch/archive/done/briefs/skills/beta/`. Without the `^` anchor it gives a second `beta` and the pin is refused; the case also checks `2 skills` and that `$d1` holds `beta gamma` only.

No test asserts over a constant or over source text.

## 5. Standards

1. `docs/academic-coverage.md:230`, `:234`, `:248`, `:266`. Rule 14 ("A sentence in a document ... that the change makes false is a defect of the change") and item 6 of the brief ("unless the sentence is false in the grouped layout, in which case it is corrected").
   ```
   230: Commit `f9a00ab` holds the researcher's integrity page as `skills/academic/paper/references/integrity-verification.md`.
   234: Commit `f9a00ab` holds that page as `skills/academic/paper/references/integrity-verification.md`.
   248: Commit `f9a00ab` holds that page as `skills/academic/paper/references/integrity-verification.md`.
   266: Commit `f9a00ab` holds that page as `skills/academic/paper/references/ethics.md`.
   ```
   At the base each read `skills/paper/references/...`, the path the file has in commit `f9a00ab`. The file exists at neither path in the worktree. The builder corrected the same statement in eight table rows of the same page (lines 227, 231, 238, 241, 262, 269, 294, 295: "holds as the `paper` skill's `references/...`") and its judgment 6 says so, but these four sentences were swept mechanically. Failure scenario: a reader runs `git show f9a00ab:skills/academic/paper/references/ethics.md` to read the page the researcher entry is to be built from, and git answers that the path does not exist in that commit.

2. Eleven rewritten paths name a place that does not exist. Each was absent at the base under its old name too (`git show 06dacd6:<old path>` fails for all eleven), so the sweep moved a path that already named no file:
   - `docs/roadmap.md:107`: `skills/orchestration/plan-orchestration/templates/launch.sh`, `.../launch.test.sh`
   - `docs/roadmap.md:108`: `skills/orchestration/land/templates/verify.sh`
   - `docs/roadmap.md:112`: `skills/orchestration/plan-orchestration/templates/plan_cost.test.sh`
   - `docs/adr/0035`, `docs/adr/0038`: `skills/academic/paper/references/ai-disclosure.md`
   - `docs/adr/0037:25`, `docs/adr/0039:42`: `skills/academic/paper/references/literature-strategist-theme-run.md`
   - `docs/adr/0039:17`: `.../literature-strategist-synthesis.md`
   - `docs/adr/0039:42`, `docs/adr/0040:10`: `.../literature-strategist-merge-run.md`
   - `docs/adr/0042`: `skills/academic/paper/references/modes.md`
   - `docs/academic-coverage.md`: the two files of finding 1
   The roadmap lines are records of a done entry: "`sh skills/orchestration/land/templates/verify.sh` on the plan's state file printed `PASS: ...`". No command of that spelling ever ran. Decision 3 of the brief has the done entries and the ADRs rewritten because the gate's line reads them, so this is the brief's choice and not the builder's; the builder's judgment 8 keeps one such record unrewritten (`docs/roadmap.md:120`) because the gate does not match it. Failure scenario: a reader checking the gate output of entry 2.B searches the history for `skills/orchestration/land/templates/verify.sh` and finds no commit that held it. The orchestrator rules whether records of past runs keep the rewritten path or name the skill without a path, as the builder did in the eight rows of finding 1.

3. `utils/pin.sh:34`, head comment, a new line of 117 characters in a comment the file wraps at 100:
   ```
   # directory, and a link to anywhere outside Ordo; each is left as it is. It replaces a link into the live clone for a
   ```
   The brief asks for "the style of the file". Three other head-comment lines were already long at the base (41, 59, 61 now). No reader is misled; it is a style break only.

No non-ASCII, no history in a comment, no leftover `skill_root` or `skills_of`. The sample of the mechanical sweep: all 115 distinct `skills/<group>/...` paths the diff adds in `docs/`, `README.md`, `.agents/plan.yaml` and `utils/` were tested with `[ -e ]`; 104 exist, the 11 of finding 2 do not. Named sample of 23 that exist: `docs/academic-coverage.md` (`skills/academic/paper/agents/abstract_bilingual_agent.md`, `.../argument_builder_agent.md`, `.../citation_compliance_agent.md`), `docs/roadmap.md` (`skills/academic/paper/`, `.../SKILL.md`, `.../templates/`), `docs/glossary.md` (`skills/academic/paper/agents/citation_compliance_agent.md`, `.../draft_writer_agent.md`, `.../intake_agent.md`), ADR 0001 (`skills/academic/writing/`, `.../references/`), ADR 0012 (`skills/orchestration/land/SKILL.md`, `skills/orchestration/plan-orchestration/SKILL.md`), ADR 0017 (`skills/academic/paper/templates/lookup.py`), ADR 0030 (`skills/academic/paper/SKILL.md`, `skills/academic/writing/SKILL.md`), ADR 0043 (`skills/academic/paper/`, `.../agents/`, `.../SKILL.md`), `docs/dev/scripts.md` (`skills/academic/paper/templates/anchorize_tex.py`, `.../anchorize_tex.test.sh`, `.../apply_tex_patch.py`), `gen_comparison.py` (`skills/academic/paper`). A script that normalises each removed line by the sixteen renames and compares it with the added line found every hunk in the swept files mechanical except: the eight coverage rows and the ADR 0038 line of judgment 6, `docs/roadmap.md` "Waits on: 5.A, which moves `paper` to `skills/academic/paper/`", the realigned comments of `docs/dev/building.md`, and the `*/*` and `<group>/<name>` forms in `change-standard.md` and `skill-layout.md`.

## 6. Behaviour

1. `utils/pin.sh:243-249` and `:268`, check mode and the check after linking. Regression against the base, not stated in the report.
   ```
   stable_paths=$(stable_skill_paths)            # git -C "$stable" ls-tree -r --name-only HEAD
   ...
   [ "$target" = "$stable/$path" ] && continue
   ...
   [ -f "$target/SKILL.md" ] || in_list "$stable_skills" "${link##*/}" || {
   ```
   The skills of the pinned worktree are now read from its commit, and a link is accepted when its text equals `<pinned worktree>/<path in the commit>`. Nothing tests that the folder is on disk: the second loop's `-f "$target/SKILL.md"` test is skipped for every name that is a skill of the commit. At the base the list came from the folders on disk (`skills_of`), and a link whose target held no `SKILL.md` was reported. Input and wrong result: the pinned worktree is at a tag that holds `plan`, and `skills/orchestration/plan` is missing on disk (deleted by hand, or a sparse checkout). `utils/pin.sh` with no tag prints `pinned: <tag>, 16 skills linked in: ...` and exits 0, while `~/.claude/skills/plan` is a dangling link and `/plan` does not load. The base printed `pin: <link> links to <target>, which the pinned tag does not have` and exited 1. The report's "User-visible changes" states the change of source ("from the commit it is checked out at; before, from the folders on disk") without this consequence. This is by reading; `pin.sh` was not run outside its test. A test in the first loop that `$stable/$path/SKILL.md` is a file would restore the base's answer.

2. `skills/ordo/ordo-init/templates/check_config.py:101-106`.
   ```
   grouped = os.path.join(os.path.dirname(parent), "*", "plan")
   for folder in [beside] + sorted(glob.glob(grouped)):
   ```
   In a flat installation with no `plan` skill beside `ordo-init`, the script now reads `plan/templates/plan.yaml` from any sibling folder of the skills folder. Reproduced: `<scratch>/alone/ordo-init/templates/check_config.py .` with `<scratch>/flat/plan` present printed the `ok:` line and exited 0, with no word that the template came from another folder. Input and wrong result: `~/.claude/skills/plan` is missing and `~/.claude/skills-backup/plan` holds an older template; `check_config.py` checks the configuration against the older key list and prints `ok:` or a false unknown-key error. The brief's item 2 dictates the fallback ("in a sibling group folder"), so the shape is the brief's; the report does not state the effect in an installation. A second point in the same lines: `glob.glob` reads `[` in the path of the clone as a character class, so a clone under a folder such as `/work/[ordo]/` finds no group and prints the `error:` line in the repository. No such path is known to exist.

3. `utils/pin.sh` inputs asked for, each read:
   - Top-level tag (v1.0.0): `skill_paths` falls back to `<name>` only when `skills/` gives no skill; links go to `<pinned worktree>/<name>`; check mode compares the same path. Correct, and the existing top-level case passes.
   - Flat tag, grouped tag: correct, covered by cases.
   - Mixed tag with distinct names: both `sed` expressions apply to one list, so both kinds are linked. Correct by reading; the only mixed fixture is the doubled one.
   - A `SKILL.md` deeper than two levels under `skills/`: no skill. Correct.
   - A `SKILL.md` one level inside a flat skill, `skills/x/templates/SKILL.md`: read as the grouped skill `templates` and linked as `<skill folder>/templates`. See judgment 1.
   - A skill or group folder name with a space: `for path in $tag_paths` splits it into two words, two wrong links are made and the pin ends with `the links do not match the pin after linking`, after the links changed. The base split `$tag_skills` the same way; the diff does not add this.
   - Removal of a link whose skill the tag lacks: now by `tag_holds <name>`; same result as the base on a flat tag, and correct on a grouped one (case 7).
   - A link into the live clone: matched by `"$repo"/*` at any depth, so a link to `<clone>/skills/<group>/<name>` is refused, replaced or reported as before.
   - Check mode on each layout: correct except finding 1.

## 7. The builder's judgments 1, 3, 4 and 8

- Judgment 1 (every `skills/<a>/<b>/SKILL.md` is a grouped skill): holds. The brief allows a tag to mix the flat and the grouped layout, so the two readings cannot be told apart by path alone, and rule "A script handles a case only when that case has happened or when a wrong answer on it costs something" applies: a grouped tag puts such a file three levels down, where it is no skill, and the tags before this change are fixed. The claim that no existing tag holds such a file was not rerun.
- Judgment 3 (`ordo-help`'s description keeps "every skill in the folder that holds this skill"): holds. The sentence is as true as at the base: under a pin it already meant the worktree's folder and not `~/.claude/skills`, and `README.md:23` names no folder. Step 1 edits the same line.
- Judgment 4 (a group folder is a parent standing directly in a folder named `skills`): holds. The rule gives 16 in both runs of C8, and the CLI route resolves to `~/.agents/skills/ordo-help`, whose parent's parent is `.agents`. One input reads wrong: a flat copy into a folder that itself stands in a folder named `skills`, such as `/x/skills/mine/ordo-help`, is taken for a grouped checkout and the skill lists the folders of every folder of `/x/skills`. No default folder has that shape.
- Judgment 8 (`docs/roadmap.md:120` keeps `ls skills/*/SKILL.md` and `ls -1 skills/`): holds. The line quotes a run at 07fd590, names no skill folder, and the gate's line does not match it. It is the opposite choice to the one Standards 2 describes for lines 107, 108 and 112 of the same file, which the brief's decision 3 forces.

## 8. Declined to judge

- C5 and the README's sentence "The CLI finds each skill in its group folder": `npx` was not run.
- The first-run failing lines of the new `pin.test.sh` cases on the unchanged `pin.sh`: not rerun. Running the new test against the base script after the change is a revert run, which rule 22 excludes; the cases were judged by reading.
- The builder's claim that no tag holds a `SKILL.md` one level inside a flat skill (`git ls-tree -r --name-only` over every tag): needs a git command outside the three allowed.
- The contents of commits `f9a00ab` and `b8819b0` at the old paths: `git show <other commit>:<path>` is outside the allowed commands. Standards 1 rests on the base text of the four lines and on the path's absence in the worktree.
- Behaviour 1 was not run: `pin.sh` may be run only through `utils/pin.test.sh`, which has no such case.
- Whether Claude Code states a linked skill's base directory by the link or by its resolved path. The texts of `paper`, `writing`, `code-comments`, `repo-setup` and `ordo-init` reach another skill as "the folder beside this skill's folder", unchanged by the brief's decision 1. If the runner states the resolved path, that folder under a grouped pin is `<pinned worktree>/skills/academic/repo-setup`, which does not exist, and `paper` refuses for a missing prose standard. Step 4's run on the pinned skills is where this shows.
- The plan's whole verify list, and the state file's `verify:` and `standards:` values the builder hands back: the ledger is the orchestrator's.

Agent usage: a0017d39ad43dafa5, claude-fable-5-2, USAGE.
