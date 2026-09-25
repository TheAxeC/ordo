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
