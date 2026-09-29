# Step 3s refuter report (on .agents/worktrees/2e-3s, base 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
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
(exit 0)

Verify 2: env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests

Verify 3: wc -l utils/pin.sh
     443 utils/pin.sh

Verify 4, as the cases ruling gives it: git grep -n -E 'general-purpose|links every skill from it|installed skills change only' -- ':!.scratch'
(no output, exit 1)
(Without the pathspec it hits only files under .scratch/: briefs/3.md, reviews/3-brief-check.md and archived reports.)

Verify 5: reverts reproduced on scratch copies under $TMPDIR (each copies the worktree's utils/pin.test.sh beside a changed utils/pin.sh and runs it with env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE):
- base pin.sh (git show 44caaf6:utils/pin.sh), the builder's first run:
  FAIL: /private/var/folders/.../pin-test.siNkBr/my home/.claude/agents/ordo-a.md does not link into the pin
- A, pin.sh:419 `"$stable"/*)` changed to `*)` in the agent removal loop (pin mode removes any link whose name the tag lacks, wherever it points): PASS: pin.sh scratch tests
- B, the "is not a folder" refusal (pin.sh:336) moved into the linking loop, after the checkout and the skill links: PASS: pin.sh scratch tests
- C, the agent live-clone refusal (pin.sh:352-361) moved into the linking loop, after the checkout: PASS: pin.sh scratch tests
- F, the whole agent refusal block (pin.sh:328-364) moved after the checkout: PASS: pin.sh scratch tests
- D, the dedup of coinciding agent folders removed (pin.sh:116 `continue` dropped): FAIL: the shared agent folder was linked and named more than once
- E, pin.sh:403 made unconditional `mkdir -p "$dir"` (the brief's item 2 text): FAIL: the default agent pin touched /private/var/folders/.../pin-test.vyUIvL/my home/.agents/agents

Verify 6: ls -la ~/.claude/agents
ls: /Users/axelfaes/.claude/agents: No such file or directory
ls -la ~/.claude/skills: every link dated Sep 29 17:38 and pointing into /Users/axelfaes/.local/share/ordo-stable/skills/<name>; ~/.local/share/ordo-stable/agents does not exist; /Users/axelfaes/workspace/ordo/.git/worktrees holds only 2e-3, 2e-3s, ordo-stable.

Verify 7: not run (the orchestrator's at landing).

Cases ruling 1: git grep -h -i -E 'ordo|pin\.sh|README' -- skills | sed -E 's/ordo-(<worker_effort>|<reviewer_effort>|<level>|low|medium|high|xhigh|max)//g' | grep -i -E 'ordo|pin\.sh|README' | sort, against git grep -h -i -E 'ordo|pin\.sh|README' 44caaf6 -- skills | sed 's/^44caaf6...://' | sort
diff exit=0; 48 lines each.

Agent files: each agents/ordo-<level>.md compared byte for byte (cmp) with the text of item 1 printed by printf for its level:
ordo-low identical / ordo-medium identical / ordo-high identical / ordo-xhigh identical / ordo-max identical

Commands the report quotes:
- grep -n "model:\|tools:" agents/*.md  -> no output, exit 1 (the report quotes "none found (good)" as its output)
- git show cb92d65; git diff --stat cb92d65 44caaf6 -- utils skills README.md docs agents -> no output (cb92d65 and the base are identical on these paths, so the report's "unchanged tree at cb92d65" is the base)
- sed -n '65,73p' skills/plan-help/SKILL.md -> every command line's description starts at column 31, the new /refute refuses line included
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary -> ok: the plan-terms block equals the template
- git status --short -> M README.md, M docs/dev/change-standard.md, M docs/glossary.md, M skills/plan-help/SKILL.md, M skills/plan-orchestration/SKILL.md, M skills/refute/SKILL.md, M skills/repo-setup/templates/plan-terms.md, M skills/spec/SKILL.md, M utils/pin.sh, M utils/pin.test.sh, ?? .scratch/2-e-grill/agents/reviews/3s-report.md, ?? agents/

Probe (a case appended to a scratch copy of pin.test.sh, under its scratch HOME): ORDO_SKILL_DIRS="$d1<newline>$d1_agents/" (the agents folder spelled with a trailing slash), pin vag1 from vag2:
PROBE status=1 before=vag2 after=vag1
PROBE err: pin: /private$TMPDIR/pin-test.GneCbI/my home/.claude/agents//beta does not link to /private$TMPDIR/pin-test.GneCbI/my home/.local/share/ordo-stable/skills/beta
PROBE d1_agents: ordo-a.md ordo-b.md
```

## Verdicts

Items of the brief's "What to build":

- 1: holds. All five files are byte-identical to the item's text (cmp above), with no `model` and no `tools` key.
- 2: violated. See Spec 1 (the folder is created only when the tag holds an agent), Behaviour 1 (the "both a skill folder and an agent folder" refusal is bypassed by a trailing slash, and the worktree moves and skill links are removed) and Standards 2 (the usage line in the head comment still says only skills are linked). Everything else in the item is in pin.sh: the folders (111-123), agents_of (138-143), the refusals (328-364), link/replace/remove (402-427), check mode (206-243) and the second line (265-266, 442-443).
- 3: violated. See Proof 1: the header comment and the report both say the refusals happen "before anything changes", and the tests do not prove it (reverts B, C and F stay green). See also Proof 2 (pin mode never completes a run with mine.md/other.md present; revert A stays green). Every case has a test block, run_pin reads the two lines separately, and every existing case passes.
- 4: holds. "Launching a builder" names `subagent_type: ordo-<worker_effort>` with `ordo-high` as the default and "This is the one place". The Builder, Reviewer and Brief-check agent bullets carry the added phrases. Steps 1 has the check before any dispatch. The Stops preamble and the new row are as the item says.
- 5: holds. Steps 1 has the check followed by the dispatch "as the effort agent `ordo-<reviewer_effort>` ... `ordo-high` when the block has no such key". The Stops row is resumed "`/refute` again in a new session".
- 6: violated. See Spec 2: the preflight check, the brief check's item 1 and the Stops row are all present, but neither place states the default when `reviewer_effort` is absent.
- 6a: violated. See Spec 3: the "new session" remedy is attached to every cause, not only the effort cause.
- 6b: holds. The term matches the brief's text, sits in alphabetical place between "Doc text" and "executor", and the glossary block is synced (sync_rules.py ok).
- 7: holds against the brief's text. The Install paragraph, the CLI commands, the copy loop and the updating sentence are there, and the "Working on Ordo" opening, code comment, folders paragraph and check/pin paragraph cover agents. See Behaviour 2, a defect in the commands the brief itself dictates.
- 8: holds. The glossary term **pin** reads "the installed skills and agents held at a tag ... links every skill and every agent from it".
- 9: holds. The change-standard bullet reads "the installed skills and agents change only through `utils/pin.sh <tag>`".

Cases of the brief's "Cases":

- First pin links ordo-a/ordo-b, creates the folder, prints `pinned: 2 agents linked in: <folder>`: met (pin.test.sh:416-424; red on base).
- CLAUDE_CONFIG_DIR set: both folders linked: met (433-442).
- ORDO_SKILL_DIRS two folders: the sibling of each linked: met (448-456).
- Later tag without ordo-b: removed with `pin: removed ...`, ordo-a kept: met (460-467).
- Tag with no agents/: `pinned: 0 agents linked in: ...`, links removed: met (471-476).
- Live-clone link for a held agent: replaced with `pin: replaced ...`: met (495-501).
- ordo-z.md into the live clone, tag lacks it: refused, exit 1, the worktree and every link unchanged: partial. The refusal and message are tested (505-515). The worktree assertion runs vag2 onto a worktree already at vag2, so it cannot fail (revert C green). Only ordo-z's own link is compared, and exit is tested as non-zero, not 1. See Proof 1.
- ordo-a.md a real file: refused, exit 1, nothing changed, file kept: partial. The refusal and the kept file are tested; "nothing changed" is not (revert F green). See Proof 1.
- ordo-a.md a link outside Ordo: refused, exit 1, nothing changed: partial, the same missing part (revert F green). See Proof 1.
- mine.md and other.md left alone by pin mode and unreported by check mode, with controls: partial. The check-mode silence and the controls are tested. Pin mode runs only the two refused control runs while mine.md and other.md exist, so a pin mode that removes other.md stays green (revert A). The report does not quote the control's red output beside it. See Proof 2.
- Unwritable agent folder: the check after linking fails with both lines, exit 1: met (582-595).
- Agent folder path a regular file, and an entry ordo-a.md a directory: each refused before the worktree or a link changes: partial. The refusals are tested; "before the worktree or a link changes" is not (revert B green, and the directory case runs vag1 onto vag1 with no worktree assertion). See Proof 1.
- Two skill folders under one parent: one agents folder, linked once and named once: met (632-643; revert D red). The test uses the newline form, not "the existing space-separated case" the case names. The dedup runs after parsing (pin.sh:113-121), so the form does not change what is tested.
- ORDO_SKILL_DIRS naming another skill folder's agents folder: refused before anything changes: partial. The exact spelling is refused (648-656), but the worktree assertion runs vag1 onto vag1, and the same folder spelled with a trailing slash is not refused (probe). See Behaviour 1 and Proof 1.
- agents/notes.txt and agents/sub/x.md neither linked nor counted: met (426-427 with `pinned: 2 agents`).
- Check mode passes on a fresh pin and prints the agents line: met (661-666).
- Check mode fails naming a missing ordo-a.md: met (670-675).
- Check mode fails naming a live-clone link: met (679-686).
- Check mode fails naming a link to an agent the pinned tag lacks: met (691-698).
- No agent folder and a tag without agents: passes with `pinned: 0 agents ...`, folder not created: met (481-490).
- The five files, their level in name, description and effort, with no model and no tools: met (cmp).
- Each changed text says what its item says, and the git grep with `:!.scratch` hits nothing: partial. The grep prints nothing; the 6a text differs, see Spec 3.
- No skill text names Ordo or a path of Ordo: met under the cases ruling (diff exit 0, 48 lines each).
- A block without worker_effort or reviewer_effort: items 4 to 6 say `ordo-high`: partial. plan-orchestration "Launching a builder" and refute Steps 1 say it; spec does not. See Spec 2.

## 1. Spec

1. utils/pin.sh:403 and the head comment at pin.sh:37-39: `[ -z "$tag_agents" ] || mkdir -p "$dir"` and "is created by pin mode when the tag holds at least one agent". What is wrong: item 2 says "An agent folder that does not exist is created", and the brief's decision 1 foresees `<HOME>/.agents/agents` being created in the test ("harmless in the test"). The builder changed the script's rule to keep an existing test assertion (`rmdir "$HOME/.agents"`, pin.test.sh:319) green, when the change was to the test. Revert E shows the unconditional form fails only on the test's own `[ ! -e "$d2_agents" ]` (pin.test.sh:429). Under the rules file's rule 4 this is a stop, not a judgment call. Failure scenario: a reader of the brief and of the README ("links the agents into the `agents` folder beside each skill folder") expects the folder after any pin. After a pin of a tag with no agents it is absent, and the brief's rule and the script now disagree. Verdict: item 2 violated.
2. skills/spec/SKILL.md, Steps 1 preflight bullet and "Steps / The brief check" item 1: "Check that the runner lists the effort agent `ordo-<reviewer_effort>` ..." and "Start one fresh agent as the effort agent `ordo-<reviewer_effort>`, on the model ...". What is wrong: neither states `ordo-high` when the configuration block has no `reviewer_effort`, which the reading case requires of items 4 to 6 (refute's Steps 1 and plan-orchestration's "Launching a builder" do state it). Failure scenario: `/spec` on a plan whose state file was written before step 2 added the keys finds no `reviewer_effort`. The text gives it `ordo-`, a name no runner lists, so the preflight refuses a step it should prepare, or the session guesses the default. Verdict: item 6 violated; reading case "A configuration block without ..." partial.
3. skills/plan-help/SKILL.md, under "when a command stops", the `/spec refuses` and `/refute refuses` lines: "rule on the step, install the effort agents as the plan skills are, or unset the variable, then /spec again in a new session" and "supply the report, install the effort agents as the plan skills are, or unset the variable, then /refute again in a new session". What is wrong: item 6a asks for the new cause's remedy to end in a new session. The text puts "in a new session" on every remedy, including ruling on the step and supplying the report, which the Stops tables of spec and refute resume with "/spec again" and "/refute again" in the same session. Failure scenario: a user whose `/spec` refused for lack of `(approved)` rules on the step and, as plan-help tells them, quits and starts a new session, losing the session for nothing. Verdict: item 6a violated; reading case "Each changed text ..." partial.

## 2. Proof

1. utils/pin.test.sh:505-515, 518-541, 597-628 and 646-656, and the header comment line 10 ("refuses, before anything changes, a real file or a directory in place of an agent, an agent link outside Ordo or into the live clone for an agent the tag lacks, an agent folder path that exists and is not a folder, and a folder that is both a skill folder and an agent folder"). What is wrong: each refusal case pins the tag the pinned worktree already holds (vag2 onto vag2, or vag1 onto vag1). So `describe --tags --exact-match` is the same whether or not the worktree was checked out, and the directory, real-file and outside-link cases compare no worktree or other link at all. With every agent refusal moved after the checkout (revert F), or the not-a-folder refusal moved after the skill links (revert B), or the live-clone refusal moved after the checkout (revert C), the suite prints `PASS: pin.sh scratch tests`. The report's Verify 5 row says each case is proven by reverting all of pin.sh and that "None is an audit". That whole-file revert turns red only the refusal messages, never the "before anything changes" half. The skill counterpart at pin.test.sh:162-170 pins v1 from v2 for exactly this reason. Failure scenario: a later edit moves an agent check below the `git checkout`. The pinned worktree then moves to the new tag, and skill links are rewritten, before the refusal, leaving the installed skills at a tag the user refused, and the suite stays green. Verdict: item 3 violated; the ordo-z, real-file, outside-link, regular-file/directory and both-folders cases partial.
2. utils/pin.test.sh:543-578: the mine.md/other.md case. What is wrong: the two pin-mode runs with mine.md and other.md present are the refused control runs, which exit before any link is made or removed. No successful pin runs while they exist, so revert A (the agent removal loop removes every link whose name the tag lacks, wherever it points) prints `PASS: pin.sh scratch tests`. Rule 13 of the rules file also asks for the control's red output to be quoted beside the silent case, and the report quotes none. Failure scenario: a change that removes a user's own `~/.claude/agents/other.md` link on every pin passes the suite. Verdict: case "A user's own agent file ..." partial.
3. .scratch/2-e-grill/agents/reviews/3s-report.md, DONE / NOT DONE row 1: "`grep` for `model:`/`tools:` prints **"none found (good)"**". What is wrong: that command prints nothing and exits 1. The quoted "verbatim" output is text the command never printed. No decision rests on it, since the files are correct (cmp above). Failure scenario: a reader treats the Output column as verbatim and trusts other rows that are paraphrased in the same way. Verdict: none.
4. 3s-report.md, Verify row 1: "Prints all 8 `$ <command>` / output pairs, each passing, ending `checks: 8 commands passed`, exit 0 (full transcript run in this session; last lines: ...)". What is wrong: the brief's Verify 1 and the rules file ("Commands and their filters": "the report quotes the lines the runner printed, never a count") ask for the printed lines. The report gives a description and a count. The reviewer's rerun above shows the lines, so the landing decision does not rest on the gap. Failure scenario: an orchestrator reading only the report cannot see which command printed what. Verdict: none.

## 3. Standards

1. utils/pin.test.sh:47-48, 393-396, 413-415, 431-432 and every other new comment in the added block: for example "# Runs pin.sh with the given arguments and sets out, err and status from the run. The skills line / # and the agents line must each name only folders ...". What is wrong: the prose standard, F "Source formatting: one paragraph or bullet per source line, no hard wrapping", and the brief's Conventions ("each paragraph and each bullet one line"). The test file's existing comments are one line each (pin.test.sh:2-9, 86, 162), and this diff rewraps the one-line run_pin comment into three lines. Failure scenario: a reader or a grep for a comment's sentence finds it split across lines, and later edits rewrap it again. Verdict: none.
2. utils/pin.sh:2 and :4: "# Pin the installed Ordo skills to a tag of this repository, or check the pin." and "# Usage: utils/pin.sh <tag>    check the pinned worktree out at <tag> and link every skill from it". What is wrong: rule 14 of the rules file (a sentence about the file as a whole, its introduction, is reread after the change). Pin mode now links every agent as well, and the usage line still says it links every skill. The README code-block comment and the glossary were changed to "every skill and every agent" for this reason. The brief check listed `utils/pin.sh:4` among the lines to carry. Failure scenario: a reader of `pin.sh`'s usage line, the first thing its head comment gives, concludes it installs no agents and copies the agents by hand, then check mode fails on their real files. Verdict: item 2 violated.

## 4. Behaviour

1. utils/pin.sh:328-334: `case "$nl$agent_dirs$nl" in *"$nl$dir$nl"*) fail "$dir is both a skill folder and an agent folder" ;;`. What is wrong: the comparison is by string. A skill folder spelled `<parent>/agents/` (trailing slash), or through a symbolic link, passes the refusal. The run then checks the worktree out at the new tag. The agent removal loop, which runs over the same folder, removes the skill links there whose name is not an agent file (pin.sh:415-424), and the check after linking fails. The probe shows `status=1 before=vag2 after=vag1`, the skill link `beta` gone and the message `.../agents//beta does not link to ...`. The report states the string comparison as judgment call 3 and gives no before and after for this state. Failure scenario: a user with `ORDO_SKILL_DIRS="/opt/x/skills /opt/x/agents/"` runs `utils/pin.sh v2.6.0`. The pinned worktree moves, the skill links in `/opt/x/agents/` are removed, and pin exits 1, where the brief asks for a refusal before anything changes. Verdict: item 2 violated; case "ORDO_SKILL_DIRS naming a folder that is also another skill folder's agents folder" partial.
2. README.md, "Install", "With the skills CLI": "rm -f ~/.claude/agents/ordo-*.md / cp /tmp/ordo/agents/*.md ~/.claude/agents/", after "For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set". What is wrong: the CLI links the skills into `$CLAUDE_CONFIG_DIR/skills` when that variable is set, and the new paragraph above says Claude Code then reads agents from `$CLAUDE_CONFIG_DIR/agents`. The commands always copy into `~/.claude/agents`. The commands are the ones item 7 dictates, so the defect is in the brief's text. The builder's report does not list it under "Anything in the brief that was wrong or impossible". Failure scenario: a user on a second account (`CLAUDE_CONFIG_DIR=~/.claude-work`) follows the section. The agents land in `~/.claude/agents`, that account's session lists no `ordo-high`, and every `/spec`, `/refute` and plan-orchestration run refuses with "The configured effort cannot apply". Verdict: none (item 7 holds against its text); for the orchestrator to rule on or fix at landing.

## Declined to judge

- The report's "51 assertion failures across all 20 cases" and its per-case first-run table come from a soft-fail copy of the test that the report does not keep. I reproduced the real first run (the base pin.sh fails at `.../.claude/agents/ordo-a.md does not link into the pin`), not the soft-fail pass. No decision rests on the count.
- The report says some runs used "an explicit `export HOME=.../dbg/home` scratch override", outside pin.test.sh. That is not the form Verify 6 names, and those runs cannot be reproduced. The real `~/.claude/skills` links are dated 17:38, before the build was launched at 22:00. `~/.claude/agents` and `~/.local/share/ordo-stable/agents` do not exist, and the repository has no stray worktree registration. So no residue was found.
- Verify 7 (the real launch through `ordo-high`) and whether a definition without `tools` gets the Agent tool: the orchestrator's at landing.
- Whether Sonnet's build or the Opus build lands: Axel's ruling under "Sonnet trial".

Reviewer usage: 175588 tokens, 37 tool uses, 526 s (from its completion notice).
