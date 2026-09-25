# Step 1a refuter report (on .agents/worktrees/2b-1a, base 9dee31d)

## Verification (rerun by the reviewer)

```
cp <main ledger>/orchestrator-state.md $S/state.md; line 13 replaced by "- sh skills/land/templates/verify.test.sh 2>&1 | tail -1" -> $S/state-1a.md
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh "$S/state-1a.md"
  exit=0; ten PASS: lines (grep -c '^PASS:' = 10), ten ok: lines (grep -c '^ok:' = 10),
  "Can't open utils/verify.sh: No such file or directory at -e line 1."
  "Can't open utils/verify.test.sh: No such file or directory at -e line 1."
  verify: 12 commands passed
sh skills/land/templates/verify.test.sh 2>&1 | tail -1
  PASS: verify.sh scratch tests (runner under sh dash)
sh skills/land/templates/verify.sh
  verify: usage: sh <skills>/land/templates/verify.sh <state file>   exit=64
grep -rn 'utils/verify' README.md docs skills utils
  (no output) grep exit=1
ls utils/verify.sh utils/verify.test.sh
  ls: utils/verify.sh: No such file or directory
  ls: utils/verify.test.sh: No such file or directory   ls exit=1
diff <(git show 9dee31d:utils/verify.sh) skills/land/templates/verify.sh
  25c25,26 (usage line; added "#   <skills> is the folder the skills are installed in."), 40c41 (usage printf); nothing else
diff <(git show 9dee31d:utils/verify.test.sh) skills/land/templates/verify.test.sh
  499c499 (usage assertion); nothing else
wc -lc: old 244/9460 and 510/19384; new 245/9552 and 510/19402
Planted fault (copy under $TMPDIR, verify.sh:41 back to utils/verify.sh): sh verify.test.sh exit=1
  FAIL: no argument: no usage line: verify: usage: sh utils/verify.sh <state file> (runner under sh)
Reverse plant (copy, verify.test.sh:499 back to utils/verify.sh, runner new): exit=1
  FAIL: no argument: no usage line: verify: usage: sh <skills>/land/templates/verify.sh <state file> (runner under sh)
ASCII check on the file list with the two deleted paths removed (what main's index lists after the cherry-pick): ascii exit=0, no output
LC_ALL=C grep -n '[^ -~]' over the eleven changed or added files: grep exit=1
awk 'length > 100' over the two scripts: no output
wc -l of the nine changed files: 175, 34, 65, 132, 130, 41, 271, 70, 47 (matches the report)
ls /Users/axelfaes/.claude-work/skills/land/templates/: land.sh land.test.sh usage.py
```

## 1. Spec
- skills/land/templates/verify.sh:26: the added line `#   <skills> is the folder the skills are installed in.` is outside the letter of item 1 ("content unchanged except the usage path and any head-comment line that names the old place"); it restates the definition item 2 gives `<skills>`, so it carries item 2's meaning into the file. It is outside the brief's text, low weight; the report names it as a judgment call.
- README.md:106 and :118, docs/dev/change-standard.md:43: the test line and the `verify.test.sh` bullet moved to follow `land.test.sh`. The brief asks folder order only for `building.md`, and asks the README bullet "kept as it is apart from any path it names". The bullet's text is byte-identical and the list and bullets keep the order `building.md` now has (building.md:34 says the README's Tests section and building.md carry the same tests), so this carries item 3's ordering rather than substituting for anything. It is outside the brief's letter; the report states it as a judgment call.
- Otherwise every DONE item reproduces: the move (only the named lines differ), the usage and its assertion, the pages, the six skill texts at the places named, and the Doc text.

## 2. Proof
- none. Every quoted command reproduced; the usage assertion turns red in both directions (runner at the old text, test at the old text).

## 3. Standards
- skills/land/SKILL.md:99: "with the runner started under `sh`" uses "the runner" for `verify.sh`, while the same file's :40 and :42 use "the runner" for the agent harness ("the runner's stop tool", "the runner's agent listing"). One term now names two things in one skill (prose standard D, "One term per concept, repeated"). Naming it `templates/verify.sh` there removes the collision.
- skills/spec/templates/brief.md:34: the placeholder "prints <a line per command and `verify: <n> commands passed`>" is false for the runner as README.md:136 describes it ("Any other command ... the runner prints its whole output"): in this repository's own list, `check_skill_layout.py` prints ten lines and the ASCII check prints none. A /spec filling the template from this text writes a wrong expected output.
- No non-ASCII, no history in comments, no line over 100 characters in the scripts, layout check ok on all ten SKILL.md files. The grep of `utils/`, `verify.sh`, `verify.test.sh` and `utils/verify` across skills, utils, docs and README.md finds no sentence the move made false: README.md:102 and change-standard.md:63 ("each script under a skill's `templates/` or under `utils/` has a test beside it") stay true since both scripts keep their test beside them under `skills/land/templates/`; README.md:43 ("the verify runner also needs `bash` and `ps`") stays true; skills/repo-setup/SKILL.md:114 describes a new repository's `utils/`.

## 4. Behaviour
- The report's "the pinned skills install them with the land skill" is not true now: `ls /Users/axelfaes/.claude-work/skills/land/templates/` prints `land.sh land.test.sh usage.py` (the link goes to ordo-stable, pinned at v1.0.0). Until a tag holding the runner is pinned (which needs the user's permission), `<skills>/land/templates/verify.sh` does not exist in the installed skill folders. The report should say this, with before and after.
- skills/repo-setup/templates/docs/dev/change-standard.md:45: `repo-setup` now writes into every new repository's change standard the sentence "A step's verify list runs through the `land` skill's `templates/verify.sh <state file>` ...". Before: no sentence about a runner. After: the sentence, with no runnable path. Neither this template, nor `spec/SKILL.md`, nor the brief template's `sh <skills>/land/templates/verify.sh` says how `<skills>` is resolved in that repository (compare README.md:150, which gives `land.sh` a lookup order for `usage.py`: `.agents/skills`, `~/.agents/skills`, `$CLAUDE_CONFIG_DIR/skills`). So another repository can run the command as written only after someone substitutes the folder by hand, and today (see the first item) the file is not there. The report lists the new sentence but not this consequence.
- skills/land/SKILL.md:55 against :96-100: Steps 6 now says the verify list runs through `templates/verify.sh`, while :100 says a ledger's `land.sh`, "when the ledger holds it, its zero exit passes the checks on main (Steps 6)", and `templates/land.sh:306` runs its own ADAPT commands, not `verify.sh`. The two statements of how Steps 6 is passed now disagree for a ledger that holds `land.sh`. `land.sh` is outside the brief's path list, so this is for the orchestrator to rule: reconcile at landing in `land/SKILL.md` (say the ADAPT block runs `verify.sh`) or book it.
- Builder's note on the ASCII check: sound. In the worktree, `git ls-files -c` still lists the two deleted paths from the index, perl prints "Can't open" and does not set its failure flag; `-o` lists the two new files, so they are checked (grep of the list counts 2). Run on the list without the two deleted paths, as main's index holds it after the cherry-pick stages the deletion, it prints nothing and exits 0. The "Can't open" lines are expected in the worktree only.
- Builder's note on `orchestrator-state.md:50` (worktree copy; line 62 on main now): the booked item "Step 1a (ruling H): the move of `utils/verify.sh` ..." names the old path as the source of the move and stays true; it is the step's own booking and is cleared when the orchestrator books step 1a. Not a defect of the step. The Doc text's line numbers (13 and 84) are the worktree copy's; on main the second is line 96 ("from step 2 on through `utils/verify.sh`").

## Not checked
- The ASCII check on main after the actual cherry-pick (reproduced on the equivalent file list only, since no git write was allowed).
- Whether the ledger's verify list should also take the new position after `land.test.sh` (the Doc text replaces line 13 in place, so the ledger's order differs from building.md's; the ledger is the orchestrator's).

Reviewer usage: 100,494 tokens, 20 tool uses, 490 s (the runner's completion notification; reviewer claude:opus, agent aa22f1e348d4449da).

## Repair round 1, refuted

```
cp <main ledger>/orchestrator-state.md $TMPDIR/state-1a.md; line 13 -> "- sh skills/land/templates/verify.test.sh 2>&1 | tail -1" ($TMPDIR/state-1a2.md)
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh "$TMPDIR/state-1a2.md"
  exit=0; grep -c '^PASS:' = 10; grep -c '^ok:' = 10; no "Can't open" lines
  verify: 12 commands passed
sh skills/land/templates/land.test.sh 2>&1 | tail -1
  PASS: land.sh and usage.py scratch tests   (exit 0; the new lines: red list, lookup, not found, no state file, all printed)
sh skills/land/templates/verify.test.sh 2>&1 | tail -1
  PASS: verify.sh scratch tests (runner under sh dash)
python3 utils/check_skill_layout.py
  ten ok: lines, exit 0
sh skills/land/templates/verify.sh            -> verify: usage: sh <skills>/land/templates/verify.sh <state file>, exit=64
grep -rn 'utils/verify' README.md docs skills utils   -> no output, exit 1
ls utils/verify.sh utils/verify.test.sh       -> No such file or directory (both)
sh -n land.sh && sh -n land.test.sh            -> syntax-ok
wc -l: land.sh 549 (549 at 6a85413), land.test.sh 749 (632), land/SKILL.md 135, README.md 175
ls ~/.claude-work/skills/land/templates ~/.claude/skills/land/templates ~/.agents/skills/land/templates
  each: land.sh land.test.sh usage.py
The seven reverts, each on a copy of skills/land/templates under $TMPDIR/rv/<n>, land.test.sh run from there:
  1 verify list not run:            exit=1 FAIL: the verify list on main: missing [PASS: green list
  2 run before main's cherry-pick:  exit=1 FAIL: clean landing exited 1, expected 0
  3 exit ignored (sh -c '... || true'): exit=1 FAIL: red list: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made
  4 find_template beside script only: exit=1 FAIL: lookup: exit 1, expected 0: preflight failed: verify.sh not found beside this script or in the land skill's templates: <scratch>/lookup-ledger
  5 no verify.sh refusal:           exit=1 FAIL: not found: exit 127, expected 1: worktree git commit: nothing staged, no wip commit made
  6 refusal without the places:     exit=1 FAIL: not found message: missing [preflight failed: verify.sh not found beside this script or in the land skill's templates: <scratch>/nofind-ledger, ...
  7 no state-file check:            exit=1 FAIL: no state file: exit 64, expected 1: worktree git commit: nothing staged, no wip commit made
Probe (copy, nostate case writing a state file with no yaml block instead of removing it):
  exit=1 FAIL: no state file: exit 64, expected 1 ... then main's cherry-pick ran, source line counts printed,
  "verify: <scratch>/nostate-ledger/orchestrator-state.md has no yaml block", "verify list failed"
awk 'length > 100' on lines the round added to the scripts: land.test.sh:160, 142 characters (140 at 6a85413)
LC_ALL=C grep '[^ -~]' over every added line of git diff 9dee31d: no output, exit 1
ls research-hub/package.json: No such file; research-hub/tools/oculus/package.json exists
```

### Spec
- skills/land/templates/land.sh:151-154: the preflight refusal of a missing state file is not in ruling 5, which asks only that `land.sh` run `sh <verify.sh> <the ledger's orchestrator-state.md>` and fail on a nonzero exit. The report states it as a judgment call and it carries a test with its revert (revert 7 reproduces). It is a small addition in the ruling's direction, but only a partial one (see Behaviour 2).
- On the three questions in the brief for this review: (a) the old template's `npm test -- --reporter=dot`, `npm run check`, `build`, `format:check`, `lint` and the ASCII check over `src tests bin config` (excluding `glyphs.yml`) are not named anywhere now. The ADAPT block at land.sh:348-349 gives only the generic place ("any check beyond the verify list with its pass rule"), which is the wording ruling 5 asked for, so this is not a spec defect. What a ledger loses is under Behaviour 1. (b) Reading `orchestrator-state.md` from the script's own folder holds for every placement the texts give: land/SKILL.md:96 ("A ledger may hold `land.sh`") and README.md:148 ("A plan copies it into its ledger folder"). A grep of `land.sh` and "landing script" across skills and docs finds no other placement, and plan-orchestration names none. (c) All other rulings (2, 3, 4, 5, 6) do what they say. The brief template's expected output at brief.md:34 matches README.md:136 and the head comment of verify.sh.

### Proof
- The report's "Repair round 1", ASCII/syntax row: "which was 142 characters before and 144 after" is wrong. `awk '{print length}'` gives 140 at 6a85413 and 142 now for land.test.sh:160.
- Otherwise none. All seven reverts turn `land.test.sh` red with the quoted first `FAIL:` line (the table above). The npm stub scripts removed from `write_tool_stub` were never asserted at 6a85413 (`grep stub` over the old test), so no check was loosened.

### Standards
- skills/land/templates/land.sh:9 ("fails the landing with the runner's output printed") uses "the runner" for `verify.sh`, while land.sh:493-494, :508 and :517 use "the runner" for the agent harness ("the runner's Agent tool", "the runner's result"). That breaks prose-standard D ("No synonym cycling. One term per concept"), the same collision ruling 2 removed from land/SKILL.md. land.test.sh:9, :492, :494 and :555 also call `verify.sh` "the runner".
- skills/land/templates/land.test.sh:160: a line the round changed is 142 characters. The brief's conventions say "lines of about 100 characters at most in scripts".
- skills/land/templates/land.test.sh:15-16 ("the stub package.json scripts and the expected rows follow the ADAPT edits made there"): after the round the stub holds only `test:browser`, which runs outside the ADAPT region (land.sh:379). No ADAPT edit names a package.json script any more, so the half of the sentence about the stub scripts no longer describes anything (change-standard rule 14). Low weight.
- No non-ASCII, no em dash and no history in comments in the added lines. The layout check is ok on all ten SKILL.md files. The other sentences in the grep of `land.sh`, `verify.sh`, `ADAPT`, `find_template`, `npm` and the lookup places across skills, utils, docs and README.md stay true: README.md:44, :117, :148, :150; land/SKILL.md:55, :96-104; land.sh:1-13; building.md:6.

### Behaviour
- A ledger that copies the new land.sh changes where its checks run. Before: they ran in the tool directory (`cd "$landing_tool" && npm test ...`, `npm run check/build/format:check/lint`, the ASCII check over `src tests bin config`). After: the ledger's verify list runs from the repository root (land.sh:359). The only existing copy, the research-hub ledger `tools/oculus/.scratch/migration` (read only), has a verify list commented "from tools/oculus", beginning `npm test`. The repository root has no package.json (`ls research-hub/package.json`: No such file), so that ledger, on the new template, would fail its landing at the first command. Its list also holds `npm run test:browser`, which would run inside the list and again at land.sh:379, before the port check. Its ASCII line covers only `src tests`, so the old check over `bin` and `config` is lost. The report names the removed commands but not this before and after (change-standard rule 7).
- The preflight refuses a missing state file but not an unusable one. The probe above, with a state file that has no yaml block, passed the preflight, ran main's cherry-pick, then failed with `verify.sh`'s exit 64 and main staged. So the report's reason, "so that a ledger without its state file never leaves main staged", holds only for an absent file. Exit 64 after main is touched also collides with land.sh's own 64, which its head comment (land.sh:22) and its argument checks use for refusals made before anything is touched. The same applies, by reading, to `verify.sh`'s exit 69 (python3, PyYAML, bash or ps missing), which the preflight does not check (not run).
- What `repo-setup` writes into another repository (change-standard.md:45) and what `/spec` writes (brief.md:34) are stated with before and after in the report and match the diff. The installed skills' before (`land.sh land.test.sh usage.py` in all three skill folders) is confirmed by the `ls` above.

### Not checked
- land.test.sh under `dash`, and the landing with the browser check on (every case runs `--no-browser`).
- Whether main's cherry-pick can overwrite the ledger's `orchestrator-state.md` before land.sh reads it. That would need a step range that touches the state file, which the briefs forbid.
- The exit-69 path of `verify.sh` under land.sh (argued by reading, not run).

Reviewer usage: 134,695 tokens, 34 tool uses, 833 s (the runner's completion notification; reviewer claude:opus, agent acd04c243d444d8b3).

## Closed

- First review, Spec 1 and 2 (the head-comment line defining `<skills>`; README's test line and bullet order): kept as built, ruling 1 of `agents/briefs/1a-round-1.md`.
- First review, Standards 1 (`skills/land/SKILL.md:99`, "the runner"): closed in the round; the line names `templates/verify.sh`.
- First review, Standards 2 (the brief template's expected output): closed in the round; `skills/spec/templates/brief.md:34` states what `verify.sh` prints.
- First review, Behaviour 1 (the installed skills): closed in the round; the report states the pin is needed.
- First review, Behaviour 2 (`<skills>` with no resolution): closed in the round; the brief template and the change-standard template give the lookup order.
- First review, Behaviour 3 (`land.sh` against Steps 6): closed in the round; `land.sh` runs the verify list through `verify.sh`, with cases for green, red, the lookup, not found and no state file.
- Round, Spec (the preflight refusal of a missing state file beyond the ruling): kept; it has its case and revert.
- Round, Proof (142 and 144 characters): fixed at landing; the report gives 140 before, and the call is split.
- Round, Standards 1 ("the runner" for `verify.sh` in `land.sh:9` and `land.test.sh`): fixed at landing; each names `verify.sh`.
- Round, Standards 2 (`land.test.sh:160` over 100 characters): fixed at landing; split in two lines.
- Round, Standards 3 (`land.test.sh:15-16`, stub package.json scripts): fixed at landing; the sentence names only the expected rows.
- Round, Behaviour 1 (a ledger copying the new template): fixed at landing; the report and the booking state the before and after, and that a ledger's verify list runs from the repository root, as `plan` requires of every ledger command.
- Round, Behaviour 2 (an unusable state file passing the preflight and giving exit 64 after main is touched): fixed at landing; `land.sh` fails the verify list with exit 1, and the case "unusable state file" in `land.test.sh`, with the status passed on, prints `FAIL: unusable state file: exit 64, expected 1`.
