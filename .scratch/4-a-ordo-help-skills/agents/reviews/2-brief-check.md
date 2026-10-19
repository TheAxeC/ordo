# Step 2 brief check (on main at a6c643f)

Brief read: /Users/axelfaes/workspace/ordo/.scratch/4-a-ordo-help-skills/agents/briefs/2.md (uncommitted, on disk). `git rev-parse --short HEAD` printed `a6c643f`; `git status --short` printed ` M .scratch/4-a-ordo-help-skills/orchestrator-state.md` and `?? .scratch/4-a-ordo-help-skills/agents/briefs/2.md`.

## 1. Names

Command: `grep -rln --exclude-dir=.git -F "<name>" .` for each name, then the hits outside `.scratch/archive/` and outside the brief listed by `grep -rn`.

- `v8.3.0-rc.1`: hits outside the brief, all in an archived ledger:
  - `.scratch/archive/9-literature/plan.md:126`: "... Commit c613bd2 removed step 1 from main, the pin went back to v8.2.0 and the tag v8.3.0-rc.1 was deleted, on the user's approval. ..."
  - `.scratch/archive/9-literature/orchestrator-state.md:84`: "... the pin back to v8.2.0, the tag v8.3.0-rc.1 deleted."
  - `.scratch/archive/9-literature/agents/reviews/1-landing.md:3` and `:32`: "The tag `v8.3.0-rc.1` on the landing commit and `utils/pin.sh v8.3.0-rc.1`, then `/spec 9 2`, the gate run ..."
  - The step does not make these false, because they record a tag that existed and was deleted. After the step, though, the name `v8.3.0-rc.1` points to a6c643f, while `1-landing.md:32` uses it for plan 9's landing commit. A reader of the archive who resolves that name gets a different commit. The brief's "What is on the tree" says only "no `v8.3.0*` tag exists" (`git tag -l 'v8.3.0*'` printed nothing). It does not say the name was used and deleted before. `git ls-remote --tags origin` printed 0 lines, so no remote tag clashes with it.
- `2-run.txt`: no hit outside the brief. `grep -rn -E '<step>-run|-run\.txt|<step>-report\.md' skills docs README.md utils` finds no convention for a run record. Earlier gate runs kept a folder `agents/reviews/2-run/` (for example `.scratch/archive/2-i-several-plans-in-one-session/agents/reviews/2-run/git-log.txt`). No finding.
- `2-report.md`: 104 files under `.scratch/archive/` (`grep -rln -F '2-report.md' .scratch/archive | wc -l` printed `104`). Each one names another plan's `agents/reviews/2-report.md`, for example `.scratch/archive/2-f-diagnose/agents/briefs/2.md:84`. `grep -rn -F '4-a-ordo-help-skills' .` outside this plan's folder printed nothing. The name follows the template at `skills/land/SKILL.md:38` and `skills/spec/templates/brief.md:44` and `:95`. None of these hits is made false.

Findings: 1. The premise on tags leaves out that `v8.3.0-rc.1` was plan 9's release-candidate tag and was deleted (`.scratch/archive/9-literature/plan.md:126`). Decision 1 should state that the name is reused knowingly, or should name another tag.

## 2. The step line

The step line (plan.md, "Steps, in execution order", step 2), mapped part by part:

- "The gate's run" is served by the title and the opening paragraph of "What to build".
- "a release-candidate tag of main with step 1" is served by item 1 (the tag on a6c643f) and decision 1.
- "pinned with `utils/pin.sh <tag>`" is served by item 2.
- "only after you allow it" is served by the premise "The user allowed the tag and the pin without asking again". It sits under "What is on the tree", not "What to build", and plan.md Rulings, "The pin of step 2", holds it: "step 2 may tag a release candidate of main with step 1 and pin it with `utils/pin.sh <tag>` without asking again (the user)". This is enough.
- "`/ordo-help skills` run once through the Skill tool" is served by item 3.
- "on main" is served by decision 3 ("The run is made from the main checkout on main's head a6c643f"). See checks 3 and 4: once `/spec` makes its preparation commit, main's head is no longer a6c643f, and running from the main checkout contradicts the rules file.
- "its blocks counted against `ls skills/*/SKILL.md | wc -l`" is served by item 4.
- "each compared with `diff` against the Quick start block of its `SKILL.md`" is served by item 5.
- "(1 commit" has no requirement. The brief does not say which commit carries `2-run.txt` and `2-report.md`, who makes it, or how `/land` handles a step whose only changed paths are under the ledger root. `/land`'s wip leaves the ledger root out (glossary, **wip**), so the step's range holds nothing to cherry-pick.
- "orchestrator, no agent)" is served by the executor `inline`, named in the opening of "What to build".
- Items 6 and 7 serve no part of the line. Item 6 serves ruling D2 and the Rules of `skills/ordo-help/SKILL.md`. Item 7 is the report.

Findings: 2.
1. The part "(1 commit" has no requirement. Name the commit (the landing commit of `/land`, or a commit of the session) and its paths. ADR 0012 binds it: `git commit -m <message> -- <path> ...`.
2. The part "on main" is served by a decision that is false at run time and that conflicts with the rules file (check 3, finding 4; check 4, finding 2).

## 3. Premises

Each command of "What is on the tree", rerun:

- `git log --oneline -1` printed `a6c643f Land step 1 of plan 4.A: /ordo-help skills`. Holds now. `grep -n '^### skills\|version:' skills/ordo-help/SKILL.md` printed `5:  version: "3.2.0"` and `76:### skills`. Holds.
- `git -C ~/.local/share/ordo-stable describe --tags` printed `v8.2.0`. Holds. Also `grep -c '^### skills' ~/.local/share/ordo-stable/skills/ordo-help/SKILL.md` printed `0`, and its `version:` line is `5:  version: "3.1.0"`, so "no `skills` mode yet" holds.
- `git cat-file -t v8.2.0-rc.1` printed `commit`. Holds. `grep -n 'v8.2.0-rc.1' .scratch/archive/4-code-comments/plan.md` printed line 70: "- The tag and the pin for step 2 (2026-10-17): (a) tag `v8.2.0-rc.1` on `4e2788e` and run `utils/pin.sh v8.2.0-rc.1`, the final `v8.2.0` left to the closing; ...". The brief's quote is a part of it and holds. Lines 72 and 75 call 7481267 and 436760d "the landing commit of step 1a/1b", so "on a landing commit" holds. `git tag --sort=-creatordate | head -1` printed `v8.2.0`. Holds. `git tag -l 'v8.3.0*'` printed nothing. Holds, but see check 1 for the earlier use of the name.
- `utils/pin.sh` head comment, Usage lines: "utils/pin.sh <tag>    check the pinned worktree out at <tag> and link every skill and every agent from it" and "utils/pin.sh          check that every link points into the pinned worktree; change nothing". Holds.
- `readlink ~/.claude/skills/ordo-help ~/.claude-backup/skills/ordo-help` printed `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help` twice. Holds, but the list is incomplete. `readlink ~/.claude-work/skills/ordo-help` printed the same path. `utils/pin.sh; echo "exit=$?"` printed:
  - `pinned: v8.2.0, 15 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills`
  - `pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents`
  - `exit=0`
- `ls ~/.local/share/ordo-stable/skills/` printed 16 names: the 15 skills and `literature`. `find ~/.local/share/ordo-stable/skills/literature` printed only `templates`, `templates/__pycache__` and `templates/__pycache__/lookup.cpython-313.pyc`. `git -C ~/.local/share/ordo-stable status --porcelain --ignored` printed `!! skills/literature/`. Holds.
- `ls skills/*/SKILL.md | wc -l` printed `      15` (six leading spaces), not `15` as the brief writes. The content holds. "each with one code block under `## Quick start`" holds: an awk over each file's Quick start section counted `fences=2` for all 15 files, and each fence line is exactly three backticks.
- plan.md Rulings, "The pin of step 2": holds, as quoted in check 2.
- `grep -ln 'pin\.sh\|ordo-help\|rc\.' docs/adr/*.md` printed nothing. Holds.
- The verify list in `orchestrator-state.md` against `docs/dev/building.md` lines 6 to 12, read side by side: 7 commands, the 5 test scripts and the pin test carrying the filter `2>&1 | tail -1` from `docs/dev/change-standard.md`, "Commands and their filters". Holds.

Findings: 4.
1. The installed-links premise names two links. `~/.claude-work/skills/ordo-help` is a third, and `utils/pin.sh` check mode names three skill folders and three agent folders, all of which the pin rewrites.
2. "`ls skills/*/SKILL.md | wc -l` printed `15`" is not verbatim. The command printed `      15`.
3. The tag premise leaves out the name's earlier use (check 1).
4. Item 1 ("on a6c643f, main's head with step 1") and decision 3 ("on main's head a6c643f") will be false when the step runs. `/spec` Steps 6 makes the preparation commit before the step, and its hash becomes the base, so main's head moves past a6c643f. The fact the run depends on is that `skills/` at the run's head equals the tag's. `git diff --quiet a6c643f HEAD -- skills; echo $?` printed `0` today. The brief should require that command at run time in place of the claim about the head.

## 4. Cases and checks

Each case read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, the prose standard, the glossary, and the skills the brief runs under:

- Case 1 (describe before and after the pin): consistent. It checks the pinned worktree, which the step changes through the pin.
- Case 2 (base directory by `pwd -P`; the loaded text holds `### skills`): consistent. It checks the Skill tool's printed text, which is an input of the run, not a place the step changes.
- Case 3 (the skills folder read is the pinned one; `literature` has no name line): it checks `literature` in the pinned worktree, a place the step does not change (an ignored folder the checkout leaves alone). It is an input of the run, so the case is legitimate, but no command in the brief shows which folder the run read (check 5).
- Case 4 (15 name lines in order): the order matches `LC_ALL=C ls -1 skills/`, whose output is code-comments, diagnose, grill, land, ordo-help, ordo-init, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, session-retro, spec, writing. Consistent.
- Case 5 (15 empty diffs): consistent.
- Case 6 (no sequence line, no `Choices awaiting review` line, no position line): consistent, but the brief names no command for it. `comm -12` of the sorted Quick start lines and the sorted lines of "The sequence, printed verbatim" printed nothing, so a grep for a sequence line can tell the two apart. 25 sequence lines start with `/`.

Rules the cases or checks conflict with:

- The paragraph "The builder's first task, before any change, is the first run of every case above on the unchanged tree" cannot be followed together with item 3. Cases 2 to 6 need the skill's run and `2-run.txt`. Running them before the pin needs a second `/ordo-help skills` invocation, which breaks item 3 and the Gate ("run once"). Without the run they have nothing to read. The bullets after it name a code step and a text or judgment step, and this step is neither. The brief should state that the first run is case 1's "before" half (and the premise reads), and that cases 2 to 6 are checked once, on the run.
- Decision 3 ("The run is made from the main checkout") contradicts `docs/dev/change-standard.md`, "Where the work happens" ("In the git worktree the brief names, never in the main checkout"). It also contradicts `plan-orchestration` Steps 4, `inline` ("It then builds the step itself in the worktree under the brief and the rules file"), and `spec` Steps 7, which creates the step's worktree. The brief names no worktree. The Skill tool loads the installed skill whatever the working folder is, so "on main" in the step line does not need the main checkout. `utils/pin.sh` must still run from the main checkout, as item 2 says (see check 6).
- Item 6 ("`grep -v` of those shapes over the file prints nothing") cannot be both empty and meaningful. A line of a fenced block can be any text, and 46 Quick start lines start with `/`, as the 25 sequence lines do. `Ruled: <the choice>` is a block line of `spec`. A `grep -v` that removes block lines also removes stray sequence lines (for example `/plan-orchestration           instead of the lines above: ...`), and one that keeps them prints the block lines. The check has to know whether a line is inside a fence: an `awk` that prints every line outside a fence that is not a name line, a `no Quick start block` line or a single blank line between skills. Lines inside a block are already covered by item 5's diffs.
- Item 6 cites "(ruling D2)" for the blank lines between skills. D2 says only "(a), no, only the blocks". The blank line comes from `skills/ordo-help/SKILL.md`, "Steps / skills" 3, and its Rules. `docs/dev/change-standard.md`, "Where the work happens", says a ledger file cites a page by its section, so the citation should name that section.

Findings: 4.
1. The first-run paragraph conflicts with "invoked once".
2. Decision 3 conflicts with the rules file's "Where the work happens" and with `plan-orchestration` Steps 4 `inline`.
3. Item 6's `grep -v` cannot do its job and needs a fence-aware `awk`.
4. Item 6 cites D2 for a rule D2 does not state.

## 5. The question

The question is "could this pass without the goal being reached?", with the goal as plan.md's Goal and Gate.

- Item 1, the tag: yes. It is a precondition and proves nothing about the output, which is acceptable for a precondition.
- Item 2, the pin: yes, for the same reason. Together with case 2 it shows that the installed text has the `skills` mode.
- Item 3, the run: yes. `2-run.txt` is written by the session that ran the skill ("copied byte for byte" from its own message), and no check ties the file to what the run printed. A session could write `2-run.txt` from the `SKILL.md` files, for example with the same `awk` item 5 uses, and items 4, 5 and 6 would all pass while the skill printed something else or nothing. The runner keeps the session's transcript (`ls /Users/axelfaes/.claude-backup/projects/-Users-axelfaes-workspace-ordo/*.jsonl | wc -l` printed `7`). The earlier gate run was booked from transcripts (`.scratch/archive/4-code-comments/plan.md`, "Step 2, the gate run": "Transcripts: the finding agent made 40 Reads ..."). Fix: take `2-run.txt` from the transcript by a typed command (the text of the assistant message that follows the Skill tool's result), name the transcript file and the message's id in the report, and have the reviewer extract it again and `diff` it against `2-run.txt`.
- Item 4, the count: yes, in two ways. First, as above, through a file not taken from the run. Second, the run could read the wrong folder and print the same text. If the run read main's `skills/` (the working folder), or the parent of the stated base directory (`~/.claude-backup/skills`, which holds the 15 links, `synced` with no `SKILL.md` at depth 1, and the hidden `.trash`), the output would be byte for byte the same, because `git diff --quiet a6c643f HEAD -- skills` exits 0 and the pinned `literature` has no `SKILL.md`. Nothing in the output can tell these folders apart. Only the run's own tool calls can: the `cd <base> && pwd -P`, the listing of the resolved parent, and the 15 `SKILL.md` paths read after the invocation. The report should quote these from the transcript. The same evidence shows that the blocks were copied from files read in the run and not from memory (`skills/ordo-help/SKILL.md`, Anti-patterns, second row), which matters because this session read the `SKILL.md` files during `/spec`.
- Item 5, the diffs: yes, for the same two reasons as item 4.
- Item 6, nothing else: yes. As written, a pattern loose enough to print nothing also passes stray sequence lines (check 4). A fence-aware `awk` closes this.
- Item 7, the report: yes, as it is only a carrier.
- The check on the step line ("No, since it is the gate's run on the installed skill, with the count and the diff of every block"): yes, it could pass, by the same routes as items 3 to 5. The plan's answer assumes that the record is the run's output and that the folder read is the right one.
- Case 1: yes. It shows only the pin.
- Case 2: no for the loaded text. A loaded text without `### skills` fails it. It could pass with a stated base directory that resolves correctly while the run then reads another folder, which is item 4's gap.
- Case 3: yes. `literature` has no name line whichever folder the run reads, so the case passes when the run reads main's `skills/` or `~/.claude-backup/skills`.
- Case 4: yes, as item 4.
- Case 5: yes, as item 5.
- Case 6: yes, when `2-run.txt` is not the run's output. Otherwise no, given a grep for sequence-only text.

Findings: 3.
1. `2-run.txt` has no independent tie to the run's output. Take it from the transcript by a typed command and have the reviewer re-extract it and diff it.
2. Nothing shows which folder the run read, or that it read the files. Quote the run's own tool calls from the transcript (the `pwd -P`, the listing of `/Users/axelfaes/.local/share/ordo-stable/skills`, and the 15 `SKILL.md` reads under that path), and make that quote case 3's check.
3. Item 6 needs the fence-aware `awk` (as in check 4).

## 6. Implied inputs

The inputs the step implies:

- **Name lines and block lines that start with `/`.** Missing from "Cases". 46 Quick start lines start with `/`. In 12 blocks the last line starts with `/` and stands right before the closing fence. That fence is the same bare three-backtick line as an opening fence: an awk over the Quick start sections printed "lines starting with / right before a bare fence line: 12". A rule that does not track whether a fence opens or closes counts 27. The pattern `^/[a-z][a-z-]*$` matches 0 block lines (`grep -c` printed `0`). Expected result: a name line is a line matching `^/[a-z][a-z-]*$` outside a fence, and the count is 15. The wrong answer gives a false red or, worse, a definition rewritten during the run.
- **A block whose own lines begin with a fence-like line.** This has not happened. Each of the 15 Quick start sections has exactly 2 fence lines, both exactly three backticks, and a wrong cut would give a false red, not a false pass. Under `docs/dev/change-standard.md`, "Scripts compute facts; judgment is read" (a case only when it has happened or a wrong answer costs something), no case is needed.
- **The trailing blank line, and leading or double blank lines.** Missing. Item 6 allows "blank lines between skills" but no command checks where the blank lines are. Expected result: no line before the first name line, exactly one blank line between a closing fence and the next name line, no blank line after the last closing fence, and a final newline. The fence-aware `awk` of item 6 should report any other blank line.
- **The folder `literature`.** Present as case 3, but its check passes whatever folder is read (check 5).
- **The pin's effect on `~/.agents/skills`.** Missing. `ls -la ~/.agents/skills` shows only a real folder `find-skills`. Expected result: unchanged, and the pin prints no `pin: removed ..., in a folder pin.sh no longer links into` line.
- **The pin's effect on the agents folders.** Missing, and a wrong answer costs something, because the step's reviewer runs as `ordo-high`. `git diff --stat v8.2.0 a6c643f -- agents skills utils` lists only 3 skill files, and `git ls-tree --name-only v8.2.0 agents/` equals `ls agents` (5 files). Expected result: the 5 links in each of `~/.claude/agents`, `~/.claude-backup/agents` and `~/.claude-work/agents` unchanged, the line `pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents`, and no `pin: replaced` or `pin: removed` line.
- **The pin's whole expected output.** Missing. Expected result: `pinned: v8.3.0-rc.1 (a6c643f), 15 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills`, then the agents line above, and exit 0.
- **The pin failing half-way.** Missing. In `utils/pin.sh`, every refusal comes before any change. After `git checkout -q --detach "$tag"` succeeds, a failed final `check_links` exits 1 with "pin: the links do not match the pin after linking". At that point the worktree is already at the tag, and because the link paths do not change, every installed skill already serves the rc's text. Expected result: the step stops with the `pin: ` line quoted and no Skill run, and an open item is raised. Going back with `utils/pin.sh v8.2.0` needs the user's allowance, because the ruling "The pin of step 2" covers only the rc's pin, and the standing demands say "never run `utils/pin.sh <tag>` without asking".
- **The Skill tool serving text loaded before the pin.** Missing as a handled result. Case 2 detects it, because the loaded text would lack `### skills`. Expected result: the step stops before writing `2-run.txt`. The run is made in a session started after the pin, still once.
- **The folder the pin is run from.** Stated by item 2 ("run from the repository root"). It matters: `utils/pin.sh` sets `repo=$(CDPATH= cd "$(dirname "$0")/.." && pwd -P)`, so a pin run as `utils/pin.sh` from the step's worktree would treat the worktree as the live clone. No finding.
- **The message's own wrapping** (a preamble, an outer fence, a closing remark). This is the case `skills/ordo-help/SKILL.md` Rules forbid. It is covered once item 6 is fence-aware.

Findings: 6. Missing from "Cases" with their expected results:
1. Name lines and block lines that start with `/`.
2. Blank lines at the start, between skills and at the end.
3. `~/.agents/skills`.
4. The agents folders.
5. The pin's full output.
6. The pin failing half-way.

The Skill tool serving the old text needs an expected handling added to case 2.

## 7. ADRs

Command: `for f in docs/adr/00*.md; do grep -m1 '^Status' "$f"; awk '/^## Decision/{p=1;next} /^## /{p=0} p' "$f"; done`. I read each record's status and decision. 0003 and 0016 are `superseded by 0013` and `superseded by 0018`. The rest are `proposed`.

- 0001, 0002, 0013 (writing), 0014 (code-comments), 0017 to 0020 (paper): they govern no file, name, rule or behaviour the step changes.
- 0004 and 0005 (self-rule, choices file): the step changes neither.
- 0006, "Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model": the step itself starts no agent (executor `inline`). The brief-check agent is `/spec`'s, recorded under `brief_check`. Not touched.
- 0007, 0008, 0009 (reviewer model, cost script): not touched.
- 0010, "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands": the brief's last premise records that comparison. The step does not change the list. Not touched.
- 0011 (dispatch blocks): not touched.
- 0012, "Every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`": the step changes no commit behaviour, so by the glossary's **ADR** entry ("A record touches a step when its decision governs a file, a name, a rule or a behaviour the step changes") it does not touch the step. It does bind the step line's "1 commit", which the brief does not mention (check 2).

The brief's "No ADR touches this step" holds on this reading. Its evidence, a grep for `pin\.sh`, `ordo-help` and `rc\.`, is narrower than the reading but agrees with it. No part of the brief contradicts an ADR.

Findings: none.

## 8. Dictated text

The brief writes nothing dictated into a repository file. `2-run.txt` is the skill's output, and `2-report.md` has a shape, not words. What it gives word for word is the tag, the file names, the commands and their outputs. Each is found by `grep -nF '<text>' .scratch/4-a-ordo-help-skills/agents/briefs/2.md`. `LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing (exit 1). `grep -n ' - \| -- '` found only list markers at lines 96, 97 and 112.

- `v8.3.0-rc.1` (lines 25, 26, 37, 66, 98): holds against the convention the archive shows (`v<next release>-rc.<n>`, lightweight). The minor part follows `docs/dev/skill-layout.md`, "Frontmatter", for ordo-help's change. The earlier use is noted in check 1.
- `.scratch/4-a-ordo-help-skills/agents/reviews/2-run.txt` (line 57) and `.scratch/4-a-ordo-help-skills/agents/reviews/2-report.md` (lines 58, 106): hold. The report path follows `skills/spec/templates/brief.md`, "Report".
- `utils/pin.sh v8.3.0-rc.1` (line 26): holds (head comment, Usage).
- `git -C ~/.local/share/ordo-stable rev-parse HEAD` and `git rev-parse 'v8.3.0-rc.1^{commit}'` (lines 26, 98): hold.
- `utils/pin.sh; echo "exit=$?"` with output `exit=0` (line 98): holds.
- `git -C ~/.local/share/ordo-stable describe --tags` with `v8.2.0` and then `v8.3.0-rc.1` (lines 12, 37): holds. `--tags` reports a lightweight tag.
- `ls skills/*/SKILL.md | wc -l` (lines 16, 28, 99), "printed `15`" at line 16: breaks `docs/dev/change-standard.md`, "Where the work happens" (a quoted line is quoted as the command printed it), and the brief's own "Report" rule ("A line shortened with "..." is not verbatim"). The output is `      15`.
- `LC_ALL=C ls -1` (lines 28, 99): holds.
- `no Quick start block` (lines 28, 30): holds, as `skills/ordo-help/SKILL.md`, "Steps / skills" 3, words it.
- The character-set check at line 95: holds. Its `perl` part equals the verify list's last command in `docs/dev/change-standard.md`, "Commands and their filters". The `exit=$?` it prints is `xargs`'s, which is non-zero when `perl` fails.
- `git log --oneline -1` with `a6c643f Land step 1 of plan 4.A: /ordo-help skills` (line 11): holds today, and is false at run time (check 3, finding 4).
- `grep -n '^### skills\|version:' skills/ordo-help/SKILL.md` (line 11): holds.
- `git cat-file -t v8.2.0-rc.1` with `commit`, and `git tag --sort=-creatordate | head -1` (line 13): hold.
- The archive quote "tag `v8.2.0-rc.1` on `4e2788e` and run `utils/pin.sh v8.2.0-rc.1`" (line 13): holds as a part of `.scratch/archive/4-code-comments/plan.md`, Rulings, "The tag and the pin for step 2".
- `grep -ln 'pin\.sh\|ordo-help\|rc\.' docs/adr/*.md` printed nothing (line 18): holds.
- `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help` (lines 15, 38): holds (`readlink`).
- `Choices awaiting review` (line 42): holds, as "Steps / The sequence and the plans" 2 words it.
- "(ruling D2)" at line 30: the wording holds, but the citation is wrong (check 4, finding 4).

Findings: 1. The output of `ls skills/*/SKILL.md | wc -l` is quoted as `15` and not as printed (`      15`).

## Declined to judge

- Whether Claude Code's Skill tool serves a `SKILL.md` read when the skill is invoked or one cached when the session started. A read-only check cannot settle this without invoking a skill, which this agent may not do. Case 2 detects the cached case, and check 6 names the handling it lacks.
- Whether reusing the deleted name `v8.3.0-rc.1` or taking another name is preferable. That is the user's or the orchestrator's choice. Check 1 gives only the facts.
- Where the final `v8.3.0` tag and its pin are made. Decision 1 puts them outside step 2, and step 3's line does not name them. They are outside this step.
- How `/land` books a step whose only changed paths are under the ledger root. This belongs to the `land` skill, so the check names only the missing requirement (check 2).

Agent usage: a53a068ce215da323, claude-opus-5-5, 187645 tokens, 46 tool uses, 8.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1. Names, `v8.3.0-rc.1` was plan 9's deleted tag: the tag is now `v8.3.0-rc.2` (decision 1, "What to build" 1 and 2, cases 1 and 7, the verify checks), and a premise line records the earlier name and its deletion.
- 2. The step line, "(1 commit": "Paths this step writes" says the two ledger files are saved into the main ledger and carried by `/land`'s landing commit, named by path in the form of ADR 0012, its cherry-pick having no commit to copy.
- 2. The step line, "on main" served by a false decision: decision 3 now says the diffs read the worktree's `skills/`, equal to the tag's, and "What to build" says the session works in the step's worktree.
- 3. Premises, the third link folder: the premise quotes `utils/pin.sh`'s output naming `~/.claude-work` among the three skill folders and three agent folders.
- 3. Premises, `wc -l` not verbatim: the line now quotes `      15`.
- 3. Premises, the head moving past a6c643f: the premise says the preparation commit changes only ledger files, and "What to build" 3 runs `git diff --quiet v8.3.0-rc.2 HEAD -- skills; echo $?` at run time.
- 4. Cases and checks, the first-run paragraph against "invoked once": "Cases" now says the first run is the premise reads and case 1's "before" half, and cases 2 to 9 are checked once on the one run; the code and text bullets are cut to the two that apply.
- 4. Cases and checks, decision 3 against "Where the work happens": the session works in the worktree; only `utils/pin.sh` runs from the main checkout, as its own path requires (premise and "What to build").
- 4. Cases and checks, item 6's `grep -v`: "What to build" 7 is now a fence-aware `awk` that prints every line outside a block that is not a name line, a `no Quick start block` line or the one blank line between skills, and every leading or trailing blank line.
- 4. Cases and checks, D2 cited for the blank line: item 7 now cites `skills/ordo-help/SKILL.md`, "Steps / skills" 3 and its Rules bullet, with D2.
- 5. The question, `2-run.txt` not tied to the run: "What to build" 4 takes it from the transcript by a typed `jq` command, names the transcript and the message's `uuid`, and case 9 diffs the file against the extraction.
- 5. The question, the folder read not shown: "What to build" 4 and case 3 quote the run's own tool calls from the transcript, the `pwd -P`, the listing of the resolved parent and the 15 `SKILL.md` reads under `/Users/axelfaes/.local/share/ordo-stable/skills/`.
- 5. The question, item 6: closed with the fence-aware `awk` above.
- 6. Implied inputs, name lines and block lines starting with `/`: "What to build" 5 defines a name line as `^/[a-z][a-z-]*$` outside a block, and case 4 says the 12 block lines before a closing fence are not counted.
- 6. Implied inputs, blank lines: item 7 and case 6 cover leading, doubled and trailing blank lines.
- 6. Implied inputs, `~/.agents/skills`: case 8.
- 6. Implied inputs, the agents folders and the pin's full output: "What to build" 2 and case 7.
- 6. Implied inputs, the pin failing half-way, and the Skill tool serving the old text: "What to build" 2 and 3, case 2 and decision 4 stop the step with an open item, going back to `v8.2.0` left to the user.
- 8. Dictated text, `15` not as printed: closed with the premise above.
- Dictated line added after the check, `v8.3.0-rc.2`: holds; the archive's `v<next release>-rc.<n>` form, the minor part for ordo-help's change (`docs/dev/skill-layout.md`, "Frontmatter").
- Dictated line added after the check, `^/[a-z][a-z-]*$`: holds; `grep -c` of it over the 15 Quick start blocks printed `0` in the check's run.
- Dictated line added after the check, `git diff --quiet v8.3.0-rc.2 HEAD -- skills; echo $?`: holds; the check's run of the same command on a6c643f printed `0`.
- Declined to judge, where the final `v8.3.0` tag and its pin are made: outside step 2; the closing raises it.
