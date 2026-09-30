# Step 10 brief check (on main at 983754e)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/10.md`. `git rev-parse --short HEAD` printed `983754e`. `git status --short` printed only `?? .scratch/2-e-grill/agents/briefs/10.md`. I changed nothing anywhere.

## 1. Names

- **`plan-help` outside `.scratch`.** `git grep -n -i "plan-help" -- . ':!.scratch'` printed 33 lines in 12 files. Every hit is inside the brief's "Paths this step writes". That includes `skills/plan-help/SKILL.md:86` and `:87` (the Stops rows), which the whole-file path and item 1's "every `/plan-help`" cover.
- **`Plan help` / `plan help`.** `git grep -n -i "plan help" -- . ':!.scratch'` printed:
  - `skills/plan-help/SKILL.md:3` (the trigger);
  - `skills/plan-help/SKILL.md:8:# Plan help`.

  Both are in the paths.
- **Other spellings.** `git grep -n -i "plan_help\|planhelp"` printed nothing (rc=1). `git grep -n -i help -- . ':!.scratch' | grep -v -i plan-help` printed no other reference to the skill.
- **Hidden and tracked config.**
  - `grep -rl -i -E "plan-help|plan help" . --exclude-dir=.git` finds, outside `.scratch`, only the same 12 files.
  - `.claude/` in the repository is an empty, untracked folder (`ls -la .claude`; `git ls-files .claude` printed nothing).
  - `agents/` (the five `ordo-*.md`) and `utils/` have no hit.
  - There is no `CLAUDE.md` at the repository root.
- **Hits under `.scratch`, outside the archive.**
  - `.scratch/2-e-grill/plan.md:42,87,159` and `orchestrator-state.md:86`.
  - `.scratch/2-f-diagnose/plan.md:29,38` and `.scratch/2-h-session-retro/plan.md:35,43`.
  - `.scratch/plan-drafts/2-f-diagnose.md` and `2-h-session-retro.md`.
  - Reviews of steps 3, 7 and 9, and older retros and audits.

  Each one either describes the rename or records past work. The rename makes none of them false. The 2.F and 2.H lines already say "step 2 edits whichever name is on main".
- **Scripts that could read the name.** `git grep -n -E "plan-orchestration|plan-retro|ordo-init" -- 'utils/*' 'skills/*/templates/*.sh' 'skills/*/templates/*.py' 'agents/*' .gitignore` printed nothing. So `pin.sh`, `check_coverage.py`, `sync_rules.py`, `check_config.py`, `land.sh` and `checks.sh` hold no list of skill names.
  - `pin.sh` finds skills by `skills/*/SKILL.md` (`skills_of`, and `tag_skills` via `ls-tree`).
  - `check_coverage.py` reads only the `## <skill>` sections named on its command line. The only hit in `docs/academic-coverage.md` is the reason cell at line 172.
  - There is no `skills-lock.json` in Ordo (`git ls-files | grep -i lock` printed nothing).
- **Anything outside the repository.** The brief names nothing outside the repository that the step would change. It says in two places that `~/.claude`, `~/.local/share/ordo-stable` and the real skill links are not touched. See section 4 for how that is held.

Findings:

1. **README's "Updating" sentence becomes false, and Decision 3's reason is wrong.** README.md, "By copying the folders", ends: "Updating is the same commands again: each skill folder is replaced whole, and the agents are replaced the same way, the old `ordo-*.md` removed first, so a file a newer version removes does not linger."
   - After the rename, running the same commands leaves the old `~/.claude/skills/plan-help` folder installed beside `ordo-help`. Both then trigger on "what do I type next" and "where is the plan".
   - Decision 3 says "an installed Ordo is pinned by `utils/pin.sh`". The README's two install methods ("With the skills CLI", "By copying the folders") do not use `pin.sh`. `pin.sh` is only in "Working on Ordo" (README.md, "## Working on Ordo").
   - The rename makes the sentence's promise false for a user who installed by copying (change standard rule 14; rule 5 for a user-visible surface).
   - The brief should drop Decision 3's reason and choose one of:
     - (a) Add a rule sentence after the loop: "A skill a newer version no longer ships is not removed by the loop; remove its folder from each skill folder." The step's paths then gain `README.md` lines 90-92. This is the recommendation: no history in the text, and the stale-folder case is covered for this rename and any later one.
     - (b) Add `rm -rf "$dir/plan-help"` to the loop. This puts an old name in the text as history, and the step line's grep would then find it.
     - (c) Leave it as it is. This is the lazy option, since the sentence stays false.
2. **The skills CLI update is not checked.** "With the skills CLI" says "Updating is `npx skills update -g`". Whether that command removes a skill renamed upstream cannot be settled by a read (see Declined to judge). The brief should either make the sentence of finding 1 (a) cover both install methods, or name this as an open item.

## 2. The step line

The step line is: "`plan-help` renamed `ordo-help` (ruling H); check: `git grep -n plan-help` finds only the rename's own record, and `pin.sh` links `ordo-help` (1 commit) (approved)".

- **"`plan-help` renamed `ordo-help` (ruling H)".** Served by items 1 and 2.
- **"check: `git grep -n plan-help` finds only the rename's own record".** Served by the first case and Decision 2, but under a reading the brief does not state as a reading (finding 3).
- **"`pin.sh` links `ordo-help`".** Served by the real-run case.
- **"(1 commit)".** This is the landing's, with no item needed.

Findings:

3. **The step line's check fails as written, and the brief does not say it reads it differently.** `git grep -n -i "plan-help" | wc -l` over the whole tracked tree prints `705` today. `git grep -l -i "plan-help" -- .scratch | wc -l` prints `146` files, 117 of them under `.scratch/archive`. All of them stay after the step. So `git grep -n plan-help` will never find "only the rename's own record". The brief runs it restricted to `':!.scratch'`, and Decision 2 counts all of `.scratch` as "the rename's own record". The brief should say that this is a reading. Replace Decision 2 with:

   "2. The step line's check, `git grep -n plan-help`, is run as `git grep --untracked -n -i plan-help -- . ':!.scratch'` printing nothing. The tracked ledgers under `.scratch/` (146 files on main at 983754e, 117 of them under `.scratch/archive`) record what was, this rename's own record among them, and the rules file lets a builder edit nothing under the ledger folder but its report. This reading of the step line is the orchestrator's, booked in the plan's Rulings."

## 3. Premises

- **Ruling H and the step line.** `grep -n` on plan.md printed `42:- 10 ...` and `87:- H (a): ...` (the ruling is line 87 of the file, the 14th line of Rulings). Matches.
- **The twelve files.** `git grep -l -i "plan-help" -- . ':!.scratch'` printed the same twelve files. The line count was `33`. Matches.
- **Line numbers.** Each line number the brief names matches the grep output:
  - plan.yaml:1;
  - README 21, 24, 44, 84, with the loop text as quoted;
  - academic-coverage 172;
  - land 24, plan-orchestration 24, 26 and 40, plan 26, roadmap 29, spec 26, ordo-init 10;
  - plan-terms 41, 50, 73 and 78, and glossary 46, 55, 78 and 83;
  - the skill's lines 2, 3, 8, 10, 15, 16, 31, 34, 39 and 42.
- **`ordo-help` absent.** `git grep -n "ordo-help" -- . ':!.scratch'` printed nothing (rc=1). Matches.
- **`pin.sh`.** The head comment's sentences quoted in the brief are at lines 19-20 and 25-26. Matches. See finding 5 for the line numbers of the removal message.
- **`pin.test.sh`.** `grep -n -E "plan-help|ordo-help" utils/pin.test.sh` rc=1. It builds scratch repositories under `mktemp -d`. Matches.
- **Ledgers.** `grep -rl` shows hits in `.scratch/2-f-diagnose` and `.scratch/2-h-session-retro` and none in `.scratch/2-g-git-guard` (see finding 6).

Findings:

4. **The skill's hit list is incomplete.** The brief's list of the skill's hits omits `skills/plan-help/SKILL.md:86` and `:87`:
   - `| A required key missing | ... | The key added, then `/plan-help` again |`
   - `| No ledger folder | ... | `/plan <entry>`, or `/plan-help` with an entry that has a plan |`

   Without them the list sums to 31, not 33. Change the bullet's end to: "and `/plan-help` in the introduction, Quick start, "What it reads", "Steps" and Stops (lines 10, 15, 16, 31, 34, 39, 42, 86, 87)."
5. **The removal line numbers are wrong.** `grep -n "pin: removed" utils/pin.sh` printed:
   - `419:` skill link removed;
   - `448:` agent link removed;
   - `461:` the `~/.agents/skills` removal.

   The skill-link removal is line 419 only. Change "(the line `pin: removed <link>, which the tag <tag> does not hold`, lines 419 and 448)" to "(the line `pin: removed <link>, which the tag <tag> does not hold`, line 419 for a skill link; line 448 prints the same for an agent link)".
6. **2.G does not name the old skill.** `.scratch/2-g-git-guard` has no hit for `plan-help`. Change "The ledgers of plans 2.F, 2.G and 2.H and the archive name `plan-help`" to "The ledgers of plans 2.E, 2.F and 2.H, the plan drafts, the reviews and the archive under `.scratch/` name `plan-help` (146 tracked files on main at 983754e)".
7. **The case-insensitive grep for `plan help` finds two lines, not one.** The second case says the unchanged tree shows only "the description's trigger". `git grep -n -i "plan help" -- . ':!.scratch'` printed two lines: `skills/plan-help/SKILL.md:3` (the trigger) and `skills/plan-help/SKILL.md:8:# Plan help`. Change the case to: "on the unchanged tree, two lines: the description's trigger (line 3) and the heading `# Plan help` (line 8); nothing after."

## 4. Cases and checks

- **The `plan-help` grep case.** Consistent with rules 13-14 only if it searches untracked files (finding 8).
- **The `plan help` grep case.** Its expected output on the unchanged tree is wrong (finding 7). It has the same untracked-file problem (finding 8).
- **The `ls` case.** Consistent.
- **The `ordo-help` grep case.** It has no number (finding 9) and the untracked-file problem (finding 8).
- **The `sync_rules.py` case.** Consistent. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`, rc=0 today, and the message is at `sync_rules.py:157`.
- **The description-length case.** Consistent. The current length is 386 (python yaml command). The rename keeps the same number of characters.
- **The reading case.** Consistent with skill-layout "Frontmatter".
- **The verify list.** It has 8 commands (state file lines 7-15), so `checks: 8 commands passed` is right.
- **The real `pin.sh` run.** I read all 469 lines of `utils/pin.sh`.
  - `repo` is the parent of the script's own folder. Run as `sh utils/pin.sh` from the scratch clone, the tag lookup (`git -C "$repo" rev-parse ... refs/tags/$tag`) and `git -C "$repo" worktree add` touch only the scratch clone.
  - With `ORDO_SKILL_DIRS` set, `CLAUDE_CONFIG_DIR` is ignored and `outside_dir` returns nothing, so `~/.agents/skills` is not touched. The agent folder is `$run/home/.claude/agents`.
  - `pin old`: the stable path does not exist, so pin.sh runs `git worktree add` in the scratch clone and links `plan-help`.
  - `pin new`: the stable worktree is clean, so it is checked out at `new` and `ordo-help` is linked. The `plan-help` link's target no longer holds `SKILL.md`, so it is removed and line 419 prints.
  - `pin` (check mode): passes.
  - The real repository has no tags `old` or `new` (`git tag -l old new` printed nothing). A run by mistake from the worktree's own `utils/pin.sh` would therefore be refused with "no tag old" before anything changes.
  - `commit.gpgsign` is unset globally and there is no `core.hooksPath`, so the commit in the scratch clone works with the real HOME.

  The case as written still has these defects (findings 10-12).

Findings:

8. **`git grep` does not search the new, untracked skill folder.** The builder moves the folder with `mv` and may not run `git add`, so `skills/ordo-help/SKILL.md` is untracked in the worktree. `git grep` skips untracked files. Shown on main:
   - `git grep -l "plan-help" -- .scratch/2-e-grill/agents/briefs/10.md` printed nothing (rc=1);
   - `git grep --untracked -l "plan-help" -- .scratch/2-e-grill/agents/briefs/10.md` printed the file (rc=0).

   So the `plan-help` grep case passes even if the new `SKILL.md` still says `name: plan-help`, and the `ordo-help` grep case misses all 11 of the skill's lines. Add `--untracked` to every `git grep` in "Cases", in "What is on the tree" where it describes the after state, and in the step line's check (see finding 3's wording). For example: `git grep --untracked -n -i "plan-help" -- . ':!.scratch'`.
9. **The `ordo-help` grep case has no number.** "after, a line at the place of each old hit" should read: "after, `git grep --untracked -n "ordo-help" -- . ':!.scratch'` prints 33 lines in the same twelve files, `skills/ordo-help/SKILL.md` in place of `skills/plan-help/SKILL.md`, each at the line number of the old hit".
10. **The pin run's commands are not written out.** The case describes the pin run instead of giving its commands. The refuter reruns every command the report quotes, and the fixed path `$TMPDIR/pinrun` breaks a second run: `git clone` into an existing folder fails. `$TMPDIR` also ends in `/` here (`TMPDIR=/var/folders/7r/.../T/`), which gives `//` in every printed path. "Copied over" and "the other changed files" leave the copy method open. The env of item 3 is not stated for item 4's two runs; a check-mode run without it reads the real `~/.claude/skills`. Replace items 1-4 with the literal block, as `pin.test.sh` does with `mktemp -d` and `pwd -P`:

    ```sh
    wt=$(pwd -P)
    run=$(mktemp -d "${TMPDIR:-/tmp}/pinrun.XXXXXX") && run=$(CDPATH= cd "$run" && pwd -P)
    git clone -q "$wt" "$run/ordo"
    git -C "$run/ordo" rev-parse --short HEAD        # equals the worktree's base
    git -C "$run/ordo" tag old
    rsync -a --delete --exclude .git "$wt/" "$run/ordo/"
    git -C "$run/ordo" add -A && git -C "$run/ordo" commit -q -m new && git -C "$run/ordo" tag new
    git -C "$run/ordo" ls-tree --name-only new skills/   # ordo-help listed, plan-help not
    mkdir -p "$run/home/.claude/skills"
    cd "$run/ordo"
    env -u CLAUDE_CONFIG_DIR HOME="$run/home" ORDO_STABLE="$run/home/.local/share/ordo-stable" ORDO_SKILL_DIRS="$run/home/.claude/skills" sh utils/pin.sh old; echo "rc=$?"
    ls -l "$run/home/.claude/skills"
    env -u CLAUDE_CONFIG_DIR HOME="$run/home" ORDO_STABLE="$run/home/.local/share/ordo-stable" ORDO_SKILL_DIRS="$run/home/.claude/skills" sh utils/pin.sh new; echo "rc=$?"
    ls -l "$run/home/.claude/skills"
    env -u CLAUDE_CONFIG_DIR HOME="$run/home" ORDO_STABLE="$run/home/.local/share/ordo-stable" ORDO_SKILL_DIRS="$run/home/.claude/skills" sh utils/pin.sh; echo "rc=$?"
    ```

    Add: "Every `pin.sh` command runs from `$run/ordo` with the three variables of the line above; `sh utils/pin.sh` is never run from the worktree or with the real HOME."
11. **The brief does not say why the real pin is not run.** Add to Decisions: "The installed skills are not re-pinned in this step: ruling "Overnight work" 3 holds every tag and pin until 2.E's closing, so the scratch run is the step's proof that `pin.sh` links `ordo-help`." Without this, a reader of the step line ("`pin.sh` links `ordo-help`") may expect the real pin.
12. **No case checks "no other change".** Item 1's "No other word of the skill changes" and item 2's "with no other change to those lines" have no case. `git diff` cannot show the moved file, since the new file is untracked. Add a case that compares texts, which is a fact a machine computes:

    "`git show HEAD:skills/plan-help/SKILL.md | diff - <(sed -e 's/ordo-help/plan-help/g' -e 's/^# Ordo help$/# Plan help/' -e 's/ordo help/plan help/' skills/ordo-help/SKILL.md)` prints nothing. For each other changed file `f`, `git diff -U0 -- f` shows only lines whose sole change is `plan-help` to `ordo-help`, except README.md:84, whose new text is the brief's."

## 5. The question

Could each check pass without the goal being reached (`plan-help` renamed `ordo-help`)?

- **The `plan-help` grep case.** Yes as written: an untracked `skills/ordo-help/SKILL.md` that still says `plan-help` is not searched (finding 8). With `--untracked`, no.
- **The `plan help` grep case.** Yes for the same reason, and its expected output on the unchanged tree is wrong (findings 7 and 8).
- **The `ls` case.** Yes on its own: the folder can exist with the old name inside. The grep cases cover that once they are fixed.
- **The `ordo-help` grep case.** Yes: it has no count and misses the untracked file (findings 8 and 9).
- **The `sync_rules.py` case.** Yes on its own, since it passes on the unchanged tree too. It proves only that the glossary equals the template, which is its job, and the grep cases carry the rename.
- **The description-length case.** Yes, since it passes today. It is a fact check whose job is the length limit, not the rename.
- **The pin run.** Mostly no, because it shows a real link to `ordo-help` and the real removal of `plan-help`. But without a check that tag `new` holds the step's tree (finding 10's `ls-tree` line and the scripted copy), tag `new` could differ from the worktree and still pass.
- **The reading case.** No.
- **The step line's check.** As written it cannot pass at all (finding 3). As the brief runs it, it could pass without the rename because of the untracked file (finding 8).
- **Item 1's check.** Yes: nothing checks "no other word changes" (finding 12).
- **Item 2's check.** Yes, the same (finding 12).

Findings: findings 8, 9, 10 and 12, as above.

## 6. Implied inputs

- This is a text step: a skill folder renamed and names changed in pages. No script or test changes, so it is not a code step.

Findings: none.

## Declined to judge

- **Whether `git clone` of a linked worktree checks out that worktree's branch.** I did not run it, since this check writes nothing anywhere. Finding 10's `rev-parse` line makes the builder's run show it.
- **Whether `npx skills update -g` removes a skill renamed upstream.** A read of this repository cannot settle it. A run of the skills CLI on a scratch HOME, or its documentation, would.
- **Whether dropping the trigger phrases "plan-help, plan help" from the description should keep an old phrase for users who learned it.** That is the user's call under ruling H. The other triggers ("what do I type next", "where is the plan", "how does the plan loop work") still cover the cases.
- **Whether the skill's `metadata.version` should change.** The brief keeps 1.8.3. `git log --oneline -G 'version: "' -- 'skills/*/SKILL.md'` shows no 2.E step bumping a version so far, so keeping it matches this plan's practice.

Agent usage (completion notice): claude-opus-5-5 (41 model lines in its transcript), 119927 tokens, 24 tool uses, 311 s; cost estimate $0.79-2.66.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

1. Decision 3's reason dropped; option (a) taken: item 4 adds a sentence after the copy loop's paragraph (`README.md:93`) on removing a skill a newer version no longer ships; path added. Booked as ruling "Step 10, the README's removal sentences", decided by the orchestrator overnight.
2. Closed by reading the skills CLI's documentation (github.com/vercel-labs/skills): it does not say `update` removes a skill the source no longer holds, and documents `npx skills ls -g` and `npx skills remove --global <skill>`. Item 3 adds a sentence to `README.md:65` naming both; path added; premise recorded.
3. Premise correction: plan.md's step 10 line now reads the check as `git grep --untracked -n -i plan-help -- . ':!.scratch'` printing nothing; Decision 2 replaced; booked as ruling "Step 10, the check's reading", decided by the orchestrator overnight.
4. The skill's hit list now names lines 86 and 87 (33 lines in total).
5. The removal line is given as line 419 for a skill link, line 448 for an agent link.
6. The ledger sentence now names 2.E, 2.F and 2.H, the drafts, the reviews and the archive (146 files).
7. The `plan help` case expects two lines on the unchanged tree.
8. `--untracked` added to every `git grep` of the cases and to the step line's check.
9. The `ordo-help` case expects 33 lines in the same twelve files at the old line numbers.
10. The pin run is the literal block the report proposed, with the rule that `pin.sh` runs only from `$run/ordo` with the three variables.
11. Decision 4 says the installed skills are not re-pinned in this step, under ruling "Overnight work" 3.
12. The "No other change" case added: the moved skill compared against main's copy with the rename undone, and `git diff -U0` of every other changed file.
