# Review of step 3 of plan 5.A

Worktree: `/Users/axelfaes/workspace/ordo/.agents/worktrees/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable-3`, base `0c93942`. Nothing in the worktree or the repository was changed. Scratch repositories are under `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/review3.50hkUn`.

## 1. Verification

Run from the worktree's root with `CLAUDE_CONFIG_DIR`, `ORDO_SKILL_DIRS` and `ORDO_STABLE` unset in the shell (`unset`, the same effect as the `env -u` prefix).

```
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
exit 0
$ LC_ALL=C grep -n '[^ -~]' skills/ordo-init/templates/check_config.py
(nothing) exit 1
```

Check 5, the character-set check of `docs/dev/change-standard.md` fed with the 39 files `git diff 0c93942 --name-only --diff-filter=d` lists plus `docs/plan.yaml`: printed nothing, exit 0.

C15:

```
$ python3 skills/ordo-init/templates/check_config.py docs/plan.yaml
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
exit 0
$ python3 skills/ordo-init/templates/check_config.py --find .
docs/plan.yaml
exit 0
```

C14, with `ls` in place of `git ls-files`: `docs/plan.yaml` exists, `ls: .agents/plan.yaml: No such file or directory`. `git status --short` shows ` D .agents/plan.yaml` and `?? docs/plan.yaml`.

C16, `grep -rn -F '.agents/plan.yaml'` over the worktree outside `.scratch`, `.git` and `.agents/worktrees`: 19 lines, the same 19 the report quotes: `README.md:194`, `docs/roadmap.md:26` and `:27`, `docs/adr/0007-...md:11`, `skills/land/templates/land.test.sh:17, 222, 225, 239, 248, 249`, `skills/ordo-init/templates/check_config.test.sh:4, 158, 161, 162, 163, 239, 240, 244, 317`.

My own runs of C1 to C13a on scratch repositories with the worktree's scripts (note lines left out):

```
C1   --find <root> apps/web -> apps/web/plan.yaml, exit 0; check -> ok: apps/web/plan.yaml carries ..., exit 0
C2   .scratch/plan.yaml, exit 0
C3   docs/plan.yaml, exit 0
C4   .agents/plan.yaml, exit 0
C5   docs/plan.yaml; then .scratch/plan.yaml; then apps/web/plan.yaml with the folder named, exit 0
C6   ok: apps/web/plan.yaml carries ..., exit 0; then
     error: apps/web/plan.yaml: verification names a file that does not exist: apps/web/dev/building.md, exit 1
C7   error: no plan.yaml in .scratch, docs, .agents of <root>, exit 1
     error: no plan.yaml in apps/web, .scratch, docs, .agents of <root>, exit 1
     with docs/plan.yaml added: --find <root> apps/web -> docs/plan.yaml, exit 0
C8   error: docs/plan.yaml: ledger_root is not a path under the repository root: '../../elsewhere', exit 1
C9   note: docs/plan.yaml: worktree_root not set, default '.agents/worktrees' at the repository root applies; ok, exit 0
     error: docs/plan.yaml: worktree_root is not ignored by git: .agents/worktrees, exit 1
C10  error: give the path of one plan.yaml: check_config.py <path of plan.yaml>, or check_config.py --find <repository root> [<folder>], exit 1
     error: not a file: <root>, exit 1
     error: in no git repository: norepo/plan.yaml, exit 1
C10a note: docs/plan.yaml: adr not set, default 'docs/adr' at the repository root applies; no line holds docs/docs/; exit 0
C10b ok: .scratch/plan.yaml carries ..., exit 0
C10c apps/web/plan.yaml, exit 0; error: the folder ../outside is outside the repository <root>, exit 1
C10d through a link: docs/plan.yaml; the check's output through the link and through the real path compare equal (cmp)
C11  exit 0; staged on main: apps/web/change.txt; the worktree's apps/web/ledger/plan/agents/report.md is not on main
C12  Usage: sh <the land skill's folder>/templates/land.sh <state file> <step> <base> <plan.yaml>, exit 64; git status --short empty, no <step>-land, the step's branch unmoved
C13  exit 0; staged on main: apps/web/change.txt; the ledger file not on main
C13a configuration failed: ledger_root in docs/plan.yaml must be a folder inside the repository and not its root: ../..   exit 64
     configuration failed: ledger_root in docs/plan.yaml must be a folder inside the repository and not its root: ..      exit 64
     configuration failed: worktree_root in docs/plan.yaml must be a folder inside the repository and not its root: ../.. exit 64
     configuration failed: worktree_root in docs/plan.yaml must be a folder inside the repository and not its root: ..    exit 64
     each: git status --short empty, branches main and the step only
```

Each matches the brief's expected result and the report's "run after".

Further inputs run (results that are not findings): a path that leaves and re-enters the repository (`roadmap: ../../e2/docs/roadmap.md`, `--find <root> ../e2/docs`) passes and prints `docs/plan.yaml`; `plan.yaml` itself a symbolic link passes under the link's folder; `worktree_root: ..` in `docs/plan.yaml` gives `error: docs/plan.yaml: worktree_root is the repository root: '..'`; a `projects:` file at `tools/plan.yaml` names each project's missing page from the repository root (`tools/b/dev/missing.md`) and takes the default worktree root per project; a `plan.yaml` at the repository root is found with `--find <root> .` as `plan.yaml`, passes, and `ledger_root: .` in it is refused as the repository root; folders and files with spaces pass in both scripts; `land.sh` with an absolute state file and an absolute fourth argument, on `.scratch/plan.yaml` with `ledger_root: .`, lands with exit 0 and keeps the worktree's ledger file off main; a state file under no ledger root gives `configuration failed: the state file other/plan/orchestrator-state.md is not under the ledger_root ledger of docs/plan.yaml`, exit 64; a fourth argument that is a folder or absent file gives `configuration failed: the plan.yaml is not a file: <path>`, exit 64. A value that is not a string (`ledger_root: 5`, `ledger_root:` with no value, `standards: [5]`) passes `check_config.py` or ends in a `TypeError` traceback in both scripts; the scripts at the base do the same on the same inputs (run from a copy of `git show 0c93942:`), so the step did not introduce it.

## 2. Verdicts

Items of "What to build":

1. The search order: holds.
2. The folder in a call: holds (Spec 2 names a gap outside the item's wording).
3. Paths in a `plan.yaml`: holds (Standards 3 on the Stops rows).
4. `worktree_root`: holds.
5. `check_config.py`: holds (Standards 1 on the docstring; Spec 1 on a link at one of the three places).
6. `land.sh`: holds.
7. Ordo's configuration: holds. `docs/plan.yaml` differs from `git show 0c93942:.agents/plan.yaml` in the head comment's second line, the six path lines and `standards` only.
8. A new configuration: holds.
9. Every place that names `.agents/plan.yaml`: holds; `docs/adr/0007-...md:11` still says "Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`", left as the brief says for step 1.
10. Versions: holds as the brief writes it (`land` 5.1.0, `ordo-init` 2.1.0, `repo-setup` 5.4.0, `roadmap` 2.1.0, `plan-retro` 1.3.0, `session-retro` 2.2.0; no version hunk in the other eight). Standards 2 sets the brief's choice of part against `docs/dev/skill-layout.md`.

Cases:

- C1 met. C2 met. C3 met. C4 met. C5 met. C6 met. C7 met. C8 met. C9 met.
- C10 met by my run; the test's third part is Proof 2.
- C10a met by my run; Proof 4.
- C10b met.
- C10c partial: the run is as the brief says, and the test of the `../outside` half would pass without the refusal (Proof 1).
- C10d met.
- C11 met. C12 met (Proof 3: no failing run quoted for the case as built). C13 met. C13a met.
- C14 not verifiable in the worktree: nothing is staged, and `git ls-files` is outside the commands allowed to me. The files are as the case needs: `docs/plan.yaml` present, `.agents/plan.yaml` absent.
- C15 met.
- C16 partial: 18 lines state the fourth place or build it in a test; `docs/adr/0007-...md:11` tells a reader Ordo's configuration is at `.agents/plan.yaml`, and the brief leaves it to step 1.
- C17 met: `skills/plan/SKILL.md`, "What it reads" 1, states the order; the five calls of decision 1 resolve as the brief gives them from that item's first four sub-bullets; `spec`, `refute`, `land`, `grill`, `roadmap`, `plan-retro`, `session-retro`, `ordo-help`, `diagnose`, `plan-orchestration`, `code-comments` and `ordo-init` each point at it.

## 3. Spec

1. `skills/ordo-init/templates/check_config.py:266-270`, `find()`:

   ```
   places.extend(place for place in SEARCH_PLACES if place not in places)
   for place in places:
       if os.path.isfile(os.path.join(root, place, "plan.yaml")):
           print(os.path.normpath(os.path.join(place, "plan.yaml")))
   ```

   A folder named in the call is resolved and refused when outside the repository (lines 261-264); the three places at the root are not resolved. Input: a repository whose `docs` is a symbolic link to a folder outside it that holds a `plan.yaml`. Result: `--find <root>` prints `docs/plan.yaml`, exit 0; the check of that path then prints `error: in no git repository: e3b/docs/plan.yaml`, or, when the link's target is inside another git repository, checks the file against that other repository's root. With `docs` linked to a folder inside the repository (`documentation`), `--find` prints `docs/plan.yaml` and every line of the check names `documentation/plan.yaml`, while `skills/ordo-init/SKILL.md` Steps 13 says "The path printed is `docs/plan.yaml`" and "Checking an existing file" 1 says each line names the file by its path from the repository root. The brief's item 5 asks the refusal only for the named folder, and the change standard's section "Scripts compute facts" adds a case only when it has happened or a wrong answer costs something, so whether this is handled is the orchestrator's call.

2. `skills/session-retro/SKILL.md`, Quick start and "What it reads" 1:

   ```
   /session-retro <folder>/<entry>        the same, from the plan.yaml in <folder>, a path from the repository root
   /session-retro session <session id>    review one Claude Code session with its subagents
   /session-retro <start> <end>           review any window, ...
   ```

   The plan configuration is read by all three forms (the report goes to the ledger's retros folder), and only the `<entry>` form can name a folder. Reader: the user of a repository whose only `plan.yaml` is `apps/web/plan.yaml` types `/session-retro session <id>` and gets the refusal "No configuration", with no call that reads their file. The brief's item 2 covers "every other call that takes an entry or a project", so the diff follows the brief; the gap is in the brief's wording and is the orchestrator's to rule on.

## 4. Proof

1. `skills/ordo-init/templates/check_config.test.sh:257`:

   ```
   expect_not_found find-none "../outside" ../outside
   ```

   `expect_not_found` asserts exit 1 and a line `error: ...` that holds `../outside`. With the refusal of lines 262-264 of `check_config.py` taken out, by reading: `places` becomes `["../outside", ".scratch", "docs", ".agents"]`, no file is found, and line 271 prints `error: no plan.yaml in ../outside, .scratch, docs, .agents of <root>`, exit 1, which the assertion accepts. The case is an audit under rule 13, fourth bullet. Scenario it does not catch: `--find <root> ../other-repo` printing `../other-repo/plan.yaml` when that folder holds a file. The case proves the refusal once a `plan.yaml` stands in `$test_root/outside`.

2. `skills/ordo-init/templates/check_config.test.sh:322-324`:

   ```
   write_config "$test_root/no-repository/plan.yaml" "" ""
   output=$(python3 "$check" "$test_root/no-repository/plan.yaml")
   expect_argument_error "a file in no git repository" "$?" "$output"
   ```

   `expect_argument_error` asserts exit 1 and output that starts with `error: `. The fixture holds no page, so with lines 286-288 of `check_config.py` taken out the check goes on and its first line is still an `error:` line (a page outside the repository root or missing), exit 1. The case would pass without the refusal it is written for. An assertion on `in no git repository` in the line closes it.

3. `skills/land/templates/land.test.sh:222-237`, the case `three`. The report's table row for C12 reads "The unchanged script takes three arguments and reads `.agents/plan.yaml`; the test's first failing line is `FAIL: conflict exited 64, expected 2`". The first run it quotes for C12 was on a repository with `docs/plan.yaml` only and gave exit 64 (`configuration failed: .agents/plan.yaml not found`), the status the case expects; no run of the unchanged script on the fixture the test builds is quoted. My run of `git show 0c93942:skills/land/templates/land.sh` (with the base's `checks.sh` beside it) on that fixture in a scratch repository: `exit 0`, `change.txt` staged on main, branch `three-land` created. The case does fail on the unchanged script; the report lacks the quoted line rule 13 asks for.

4. `skills/ordo-init/templates/check_config.test.sh:300-302`:

   ```
   case "$output" in
       *"docs/docs/"*) fail "no-adr: the default is read from the file's folder: $output" ;;
   esac
   ```

   With `adr` left out, `check_config.py` builds no path from the default (`check_adr` runs only under `if "adr" in config`, line 231); the only output is the note, whose text is the template's default inside a fixed sentence. No change to how a default is resolved can make this assertion fail. The second assertion (lines 303-306) pins the note's wording. The brief's C10a dictates the case in these terms, so its disposition is the orchestrator's.

## 5. Standards

1. `docs/dev/change-standard.md`, rule 14 ("A script's head comment or docstring lists ... every error it prints"). `skills/ordo-init/templates/check_config.py:28`:

   ```
   It exits 1 with one error line when the repository root is not a folder, when the folder resolves outside the repository, which names the folder, and when no place holds a plan.yaml, which names the places looked in.
   ```

   Lines 252-254 print a fourth error, `error: --find takes a repository root and at most one folder`, which the docstring does not list. Reader: someone who calls `--find` with three arguments or none and looks the line up in the head comment finds it absent.

2. `docs/dev/skill-layout.md`, "Frontmatter": "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed." The step raises the minor part of `land`, `ordo-init`, `repo-setup`, `roadmap`, `plan-retro` and `session-retro`, as the brief's item 10 dictates. Runs that worked at the base and are refused after the step: `land.sh <state file> <step> <base>` (my run of the base script on the `three` fixture: exit 0; the changed script: exit 64); `check_config.py <repository root>` (the report's first run of C10: exit 0; now `error: not a file`, exit 1); and every skill on a repository whose `.agents/plan.yaml` holds paths written from the repository root, which are now read from `.agents/` (`README.md:194` says so). By the page's rule these are the major part. The builder followed the brief; the change standard says "nothing in a brief overrides anything here" and the page is one of the brief's standards, so the part to raise is the orchestrator's ruling, not a builder's defect.

3. `docs/dev/skill-layout.md`, "Sections, in order", row 7 (Stops: one row per stop, with what it shows and what resumes it). `skills/plan/SKILL.md`, "What it reads" 1:

   ```
        - A path may lead out of the file's folder through `..`, and is refused when it resolves outside the repository.
        - A `ledger_root` or a `worktree_root` that resolves to the repository root is refused, and `ledger_root: .` in `.scratch/plan.yaml` is the folder `.scratch`.
   ```

   Two refusals are stated here and no row of the skill's Stops table names either; the table's configuration rows are "No configuration" and "A required key missing" only, and the eleven skills that point at this item have none either. Reader: an agent running `/plan apps/web/12` on a file with `ledger_root: ../../../elsewhere` is told the path "is refused" and finds no row saying what the refusal shows or what resumes it, so it either goes on or invents the message.

## 6. Behaviour

1. The report's "User-visible changes, before and after" lists the two scripts, the example files and the folder in a call. It does not state these, each visible to a user:
   - A repository with an existing `.agents/plan.yaml` whose paths are written from the repository root: before, every skill and `check_config.py` read them from the root; after, the file is found in the fourth place and its paths are read from `.agents/`, so its pages are reported missing until the paths get `../` in front. Stated in `README.md:194`, absent from the report's list.
   - `ordo-init` and `repo-setup`: before, a new configuration at `.agents/plan.yaml` with `.agents/*` and `!.agents/plan.yaml` drafted into `.gitignore`; after, `docs/plan.yaml`, no negation line, and `worktree_root` left out of the draft. The DONE table names the places changed, with no before and after.
   - `plan-orchestration`, "Two steps in flight", and the glossary's **in flight**: before, the limit counted over every open plan; after, over the open plans of the `plan.yaml` the call found.
   - `plan-orchestration` gains the refusal "No configuration", and `session-retro` no longer refuses a file without `worktree_root`. Both appear only under "Judgments taken" (5 and 11).

## 7. The builder's judgments 2, 3, 4, 5, 6 and 10

- 2 (an absolute `adr` stays refused; an absolute value of another path key inside the repository is accepted): holds. Item 5 keeps every check made today, and item 3 refuses only a path that resolves outside the repository. My run: `ledger_root: <absolute path inside the repository>` passes, `ledger_root: /tmp` gives `ledger_root is not a path under the repository root: '/tmp'`.
- 3 (`land.sh` keeps refusing an empty value, one starting with `/` and one with a newline): holds; the head comment states it. Taken with judgment 2 it leaves one mismatch that the base already had: an absolute `ledger_root` inside the repository passes `check_config.py` and is refused by `land.sh` with exit 64 at the landing.
- 4 (`/ordo-init` takes no folder): holds. Item 2 names calls that take an entry or a project, and item 8 has `ordo-init` check the file the search finds. Consequence a reader should know: on a repository whose only `plan.yaml` is in a project folder, `/ordo-init` drafts a new `docs/plan.yaml`.
- 5 (`plan-orchestration` gains the Stops row "No configuration"): holds as the smallest way to meet item 2 in a skill that had no configuration row, and the sentence above the table was corrected to "two refusals, the last two rows". It is a new refusal in a skill whose version this step leaves alone, so the orchestrator should confirm it; `spec`, `refute`, `land`, `ordo-help` and `plan-retro` met the same item through their existing row "A required key missing" without a new one.
- 6 (the sentence that `<ledger_root>`, `<archive_root>` and `<worktree_root>` stand for the folder as it reads from the repository root): holds. It serves item 3: without it `<ledger_root>/<slug>/` and `<worktree_root>/<slug>-<step>` in eleven skills would be read with the raw value `../.scratch`.
- 10 (`ordo-init` Steps 5 leaves `worktree_root` out of a draft): holds. Item 4 makes the key optional and has each skill's text follow, and the skill's own Steps 7 leaves each optional key out unless the repository gives a reason. It is a change of what a drafted file holds and belongs in the report's before-and-after list (Behaviour 1).

## 8. Declined to judge

- C14 as the brief writes it (`git ls-files docs/plan.yaml .agents/plan.yaml`): the command is outside the git commands allowed in the worktree, and nothing is staged there. It holds only once the landing stages the move.
- The plan's whole verify list: not run, as instructed.
- Whether the step merges with steps 1 and 2 (the grouped skill folders, `example_keys()`'s path `../../plan/templates/plan.yaml` in `check_config.py:103`, the `standards` path in `docs/plan.yaml`, ADR 0007 line 11): those steps are in other worktrees I did not read.
- The skills' text as run by a model: no skill was invoked, so the reading of the five calls of decision 1 and of the folder in a call is by reading the text only.
- The ledgers of plans already open, whose state files carry the three-argument `land.sh` line from the old template: under `.scratch`, outside the step's paths.
- Whether the brief's decision 2 (the count of steps in flight over the plans of the file found) agrees with ADR 0011's "the dispatch blocks of every open plan": the brief names the ADR and takes the decision, so the reading of the ADR is the orchestrator's or the user's.
- Sentence-level style nits in the changed skill text (two rules joined by "and" in one bullet of `skills/plan/SKILL.md`, "What it reads" 1): a careful reader could go either way, and none changes what a reader does.

Agent usage: a5a88f7bf8c87a8df, claude-fable-5-2, 288132 tokens, 29 tool uses, 10.1 minutes.
