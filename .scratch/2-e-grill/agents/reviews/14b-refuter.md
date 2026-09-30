# Step 14b refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14b, base 50e3844336505b61fd71fb645979f2d7a25abf18)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
$ cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14b && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "exit=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 10 commands passed
exit=0

Verify 2: each added line (from `git diff <base> -- docs/dev/blind-comparison.md | grep '^+ '`, 10 lines) written as the one line of a scratch file, then `grep -c -F -x -f <file> docs/dev/blind-comparison.md`:
1: 1 ... 10: 1   (all ten print 1)
The ten added lines compared with the brief's two code blocks (indent stripped): `diff` printed nothing, "added lines equal the brief's dictated lines, in order".

Verify 3: `diff /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md docs/dev/blind-comparison.md | grep '^<'` printed nothing (no line removed or changed); `diff -U2 ... | grep -c '^[-+][^-+]'` printed 10. `git status --short` in the worktree: ` M docs/dev/blind-comparison.md` and `?? .scratch/2-e-grill/agents/reviews/14b-report.md`.

Verify 4: `LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md` printed nothing, exit 1.

Commands the report quotes, rerun:
- `git show 50e3844:docs/dev/blind-comparison.md` against main's copy: `diff -q` printed nothing; `wc -l` 19 before, 29 after.
- `grep -n -i "remov\|copy\|plan.md\|standard\|listed\|loadable\|process\|served\|model"` on the base page: lines 5 and 6 only. Reproduced.
- `grep -n -i "none"` on the base page: nothing, exit 1. Reproduced.
- `grep -n -i "cite\|resolve\|nothing else\|URL"` on the base page: lines 3, 8 and 9 (the report says line 9; no decision rests on it).
- `grep -n "wins or ties" .scratch/2-e-grill/plan.md`: lines 11 and 51. Reproduced.
- `grep -n "^[1-9]\. " docs/dev/blind-comparison.md`: lines 5 to 8 and 17 to 21. Reproduced.
- `grep -rn -i -e "judge's input" -e "judge receives" -e "judge gets" -e "blind-comparison" skills utils docs README.md`: see Proof 2.
- Open items: `grep -n -A3 "^## Open items" .scratch/2-e-grill/orchestrator-state.md` prints `- None.` Reproduced.

Probes, each from a folder under the scratch directory, never the repository (P = /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/r14b):
- A: `cd $P/judge-a && claude -p --disable-slash-commands --model opus --output-format json "Answer in numbered lines ... (1) the names of every skill available to you, or NONE; (2) the path of every CLAUDE.md, rules file or memory file whose contents are in your context ... (4) whether the word grill appears anywhere in your context outside this message"` printed "1. Skills: NONE. My context lists agent types (claude, Explore, general-purpose, ordo-high, ordo-low, ordo-medium, ordo-xhigh, ordo-max, Plan, statusline-setup) and tools, but no skills." / "2. ... /Users/axelfaes/.claude/CLAUDE.md, /Users/axelfaes/.claude/rules/no-claim-without-a-command.md, .../never-take-the-lazy-option.md, .../no-quick-answers.md, .../scripts-compute-facts.md, .../answers-reach-axel-in-full.md. No memory file's contents are in my context." / "4. No." ; modelUsage keys: ['claude-opus-5-5']; permission_denials: [].
- B: `cd $P/judge-b && claude -p --disable-slash-commands --model opus --output-format json "... (1) the Read tool on $P/judge-b/input.txt; (2) the Read tool on /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md; (3) the Bash tool running: sed -n 1p /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md; (4) the WebFetch tool on https://vale.sh/docs ..."` printed: (1) succeeded; (2) "refused. It returned: `Claude requested permissions to read from /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md, but you haven't granted it yet.`"; (3) "refused ... `For security, Claude Code may only edit files in the allowed working directories for this session: '.../r14b/judge-b'.`"; (4) "refused. It returned: `Claude requested permissions to use WebFetch, but you haven't granted it yet.`"; exit 0; permission_denials lists Read, Bash and WebFetch.
- C: `cd $P/judge-c && claude -p --disable-slash-commands --model opus --output-format json "Start exactly one subagent with the Agent tool, subagent_type Explore ... list the names of every skill listed as available to you in your context, or NONE ..."` printed `NONE`; the JSON's `subagent_stats` holds `'spawned': 1 ... 'completed': 1 ... 'by_type': {'Explore': 1}`.
- D: `cd $P/judge-d && claude -p --disable-slash-commands --model opus --output-format json "... (1) the Read tool on /Users/axelfaes/.claude/skills/grill/SKILL.md; (2) the Bash tool running: sed -n 1p input.txt ..."` printed "(1) ... refused. It returned: \"Claude requested permissions to read from /Users/axelfaes/.claude/skills/grill/SKILL.md, but you haven't granted it yet.\"" and "(2) ... succeeded"; it also reported "This session has no Grep tool".
- E: `cd $P/judge-e && claude -p "Use the WebFetch tool once on https://docs.vale.sh/topics/styles.md ..." --disable-slash-commands --model opus --output-format json --allowedTools WebFetch` printed `The page's first heading is "Styles" ...`; modelUsage keys: ['claude-opus-5-5', 'claude-haiku-4-5-20251001']; permission_denials: [].
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. The eight sub-bullets are lines 9 to 16 of `docs/dev/blind-comparison.md`, at three spaces, equal to the brief's text in order (diff of the added lines against the brief's code block printed nothing), each once (Verify 2), line 8 unchanged. Findings on the dictated text itself are under Spec 1 to 5 and Standards 1; they concern what the brief dictated, not a departure from it.
- 2: holds. Lines 23 and 24 follow line 22 `   - the input, or its path;`, as dictated, each once.

Cases of the brief's "Cases":

- C1: met, as the case reads. `grep -n` of the changed page: line 10 removes `skills/grill/` and lists it, line 23 records it, line 14 gives the instruction on the standard, nothing removes `plan.md`, and line 12's process lists and loads no skill (probes A, C and D: no skill listed to the process or to its subagent; the installed `SKILL.md` refused). The goal behind the case is not fully reached on the tree at 833e2e8: Spec 3 and Spec 4.
- C2: met. Line 10 removes nothing from a record with no skill file and line 23 then records "none"; line 14 and line 12 hold for any input.
- C3: met. Line 11 copies the sources into the judge's copy and removes both skills' files there; line 16 and probe B keep the judge off the sources in place (a read outside its folder is refused). `find` in research-hub for `*grill*`, `*grilling*` and `domain-modeling` printed nothing, so on step 14's input nothing is removed from its copy. The cost of that copy is Behaviour 1.
- C4: met. Probe A: "Skills: NONE"; probe C: a subagent the judge starts is shown no skill either; probe D: a Read of `~/.claude/skills/grill/SKILL.md` is refused.
- C5: partial. The page allows the judge to open a cited URL or file (line 15), and a cited file of either skill is outside the copy or removed from it. The process line 12 names cannot use that permission: probe B refused WebFetch and a read outside the folder. Spec 1.
- C6: met. The diff adds lines only (no `<` line in `diff`), items 1 to 3 and 5 to 8 are unchanged, and item 2 (line 6) removes marks from outputs while line 10 removes files from the judge's copy.

## 1. Spec

1. `docs/dev/blind-comparison.md:12` and `:15`: "such as `claude -p --disable-slash-commands --model opus --output-format json`" and "The judge may open a file or a URL an output cites, to check that it resolves and says what the output claims, except a file of either skill."; what is wrong: the process line 12 names refuses every WebFetch and every read outside its own folder (probe B: `Claude requested permissions to use WebFetch, but you haven't granted it yet.` and `Claude requested permissions to read from /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md, but you haven't granted it yet.`). It never waits on a prompt: it exits 0 and lists the refusals under `permission_denials`. So the permission of line 15 cannot be used for a URL, or for a cited file that is not in the judge's copy. Probe E shows `--allowedTools WebFetch` lets a fetch through. The brief's C5 expects the judge to open the cited URL. Answer to the builder's note 2: a cited file opened in place is refused by the process, so C3 holds; the price is this finding. Failure scenario: step 14 run again under the page. Side-1's output cites 11 URLs (`sed -n 24,212p 14-blind-comparison.md | grep -o 'https\?://...' | sort -u` printed 11, among them `https://docs.vale.sh/topics/styles.md`). The judge's fetches are refused, and it either counts working citations as "a citation that does not resolve", a false critical failure under item 5, or leaves them unchecked, as judge 3 did ("I did not fetch any of A's web URLs"). Verdict: C5 partial.
2. `docs/dev/blind-comparison.md:13`: "The orchestrator reads the judge's served model from that process's output, the `modelUsage` of its JSON."; what is wrong: the brief's premise ("`modelUsage` holds one key, `claude-opus-5-5`, the served model") holds only for a run that fetches nothing. Once a fetch runs, which line 15 allows and Spec 1 needs, probe E printed `modelUsage keys: ['claude-opus-5-5', 'claude-haiku-4-5-20251001']`. The line does not say which key is the judge's served model. Failure scenario: the orchestrator records "claude-opus-5-5, claude-haiku-4-5-20251001" as a judge's served model in item 9's record, or takes haiku as a model other than the configured one and stops the comparison. Verdict: none (the item holds as dictated).
3. `docs/dev/blind-comparison.md:8` against C1's kept `plan.md` (the builder's note 1): line 8 reads "no skill name, no gate, no statement of which output is expected to win". The judge's copy at 833e2e8 keeps `.scratch/2-e-grill/plan.md` (C1), and `git show 833e2e8:.scratch/2-e-grill/plan.md` holds all three at lines 11, 48 and 83:
   - line 11: "a blind comparison ... against mattpocock's `grill-with-docs` on the same entry, wins or ties";
   - line 48: "14 The blind comparison against mattpocock's `grill-with-docs` ... check: `grill` wins or ties";
   - line 83: "G: the decision form is game-engine's Dn form: options with pros and cons, a verified reference line with its source read in the session, a recommendation with the lazy option named, answers as \"Dn => ...\"".

   Side-1's output uses `## D1.` to `## D5.` headings (record lines 50 to 104). The roadmap in the copy repeats the gate at line 25. Line 14's instruction covers the standard a judge applies. It does not cover which output the judge can tell is `grill`, or the statement that `grill` is expected to win or tie. What is wrong: on step 14's real input, item 2 (unlabelled) and line 8's "no statement of which output is expected to win" are not reached, and the page does not say whether line 8 binds what the orchestrator adds or what the copy holds. Failure scenario: a judge reads `plan.md` for the ruling D1 and D2 are checked against (as judges 3 and 4 did), matches ruling G's "Dn form" to side-1's headings, and knows which output is the new skill and that the gate expects it to win or tie. Judge 4 read ruling G's text from `plan.md` in step 14 (brief check, "5. The question", its transcript line 31). Verdict: none. Removing `plan.md` breaks item 5, so which of the two gives way is the user's call.
4. `docs/dev/blind-comparison.md:9` and `:10`: "The judge receives no file of either skill being compared." and "The orchestrator removes the files of both skills from the judge's copy of the input"; what is wrong: the goal as the step's prompt states it (a judge never held to, or shown, the text of either skill) is reached for "held to" by line 14. It is not reached for "shown". With `skills/grill/` removed, the copy at 833e2e8 still holds the whole skill:
   - `git show 833e2e8:.scratch/2-e-grill/agents/reviews/12-round-0.diff | grep -n -A1 '^+++ b/skills/grill'` printed `+++ b/skills/grill/SKILL.md` / `@@ -0,0 +1,226 @@` and `+++ b/skills/grill/references/decision-form.md` / `@@ -0,0 +1,74 @@`, the whole of both files as added lines;
   - `git grep -l -F "Settle a roadmap entry's design decisions before its plan opens" 833e2e8` also printed `12-report.md` and `9a-report.md`;
   - `git grep -l -i "grill-with-docs\|grilling" 833e2e8` printed 7 files, `.scratch/comparison-2026-09-28/rulings.md` among them, with a summary of `grilling` and `grill-with-docs`.

   The page does not say whether a file that holds a skill's whole text (a diff that adds it, a copy under another name) is "a file of either skill". Under the literal reading it stays in the copy. Failure scenario: the orchestrator removes `skills/grill/` only, records it, and the judge, looking for the ruling history in `.scratch/2-e-grill/agents/reviews/`, opens `12-round-0.diff` and reads `grill`'s SKILL.md whole. Verdict: none. Ruling (a) chose the instruction for quoted text. Whether a whole copy of the text is removed as "a file of the skill" is the orchestrator's or the user's to rule.
5. `docs/dev/blind-comparison.md:8` and `:12` (the builder's note 3): line 8 reads "The judge receives the two outputs with only the input, and nothing else". The process line 12 names loads the user's global instructions (probe A: `/Users/axelfaes/.claude/CLAUDE.md` and five files under `~/.claude/rules/`). These carry no text of either skill: `grep -c -i grill` printed 0 for `~/.claude/CLAUDE.md` and each file under `~/.claude/rules/`, and probe A answered "4. No." to whether "grill" appears in its context. The input's own instruction files are not loaded at launch: 833e2e8 and the base have no root `CLAUDE.md` (`git ls-tree -r --name-only 50e3844 | grep -i CLAUDE.md` printed only `skills/repo-setup/templates/CLAUDE.md`). `~/.claude/CLAUDE.md` does state a form for the user's decisions that shares four parts with `grill`'s decision form: "an open item with its options, their pros and cons, and one recommendation" and "every ruling says which option was the lazy one". What is wrong: the process receives something besides the input, which line 8 excludes, and the page does not say whether the user's global instructions belong to "what the input and its user need" (line 14). Failure scenario: a judge holds side-2 to the user's global decision form, for example counting the missing lazy option against it, from instructions item 4 says it does not receive, and the record (item 9) does not show that this happened. `claude --help` gives `--bare` as the flag that skips "CLAUDE.md auto-discovery", with authentication "strictly ANTHROPIC_API_KEY or apiKeyHelper". Verdict: none; the user's call.

## 2. Proof

1. The builder's report, "The first read of the cases", point 3: "Whether a process started with `--disable-slash-commands` from the copy also reads the copy's `CLAUDE.md` (the Ordo tree's lists project skills by name)". What is wrong: the Ordo tree has no root `CLAUDE.md` at 833e2e8 or at the base (`git ls-tree -r --name-only 833e2e8 | grep -i CLAUDE.md` and the same at 50e3844 printed only `skills/repo-setup/templates/CLAUDE.md`, whose skill list is the placeholder `<- \`<skill>\`: <its description, one line>.>`). `ls /Users/axelfaes/workspace/ordo/CLAUDE.md` printed "No such file or directory". The decision that rests on it is the ruling the note asks for; probe A and Spec 5 settle it. Failure scenario: the orchestrator rules to strip a project `CLAUDE.md` from the judge's copy that does not exist, and leaves the loaded global files unaddressed. Verdict: none.
2. The builder's report, "Sentences about the page as a whole, reread": "`grep -rn -i -e \"judge's input\" -e \"judge receives\" -e \"judge gets\" -e \"blind-comparison\" skills utils docs README.md` prints only `docs/roadmap.md:208` ..., the glossary's entries at lines 130, 133 and 137 ..., `docs/dev/change-standard.md:21` ... and this page". What is wrong: the rerun also prints `docs/roadmap.md` lines 25, 26, 32, 33, 74, 81, 88, 95, 109, 165, 179, 186, 200, 201 and 207, the gates that run under this page. The report's conclusion holds: none restates item 4, and each stays true. But rule 14 of `docs/dev/change-standard.md` asks for the grep to be quoted, and the quote is not what it printed. The decision resting on it is "Nothing else is changed". Failure scenario: a reader of the report believes only five places depend on the page, and misses that every roadmap gate "compared blind" now runs its judges as line 12 says (Spec 1 then applies to each of them). Verdict: none.

## 3. Standards

1. `docs/dev/blind-comparison.md:10`, `:11`, `:12` and `:14`: each is one bullet that joins requirements which can each be broken while the other holds:
   - line 10: "removes the files of both skills ... and lists each path it removes";
   - line 11: "copies into the judge's copy each source ... and removes the files of both skills from those copies too";
   - line 12: four requirements: its own process, started from its copy, lists and loads no skill, on the reviewer model;
   - line 14: two instructions, plus a second sentence.

   Line 10's listing is also stated again at line 23 (the record). The rule broken is `docs/dev/skill-layout.md`, "Lists and tables", first bullet, which the brief made this step's rule under "Read" item 3, and "Where a rule goes" ("A rule is written once"). The brief's "Closed" item 4 says the brief check's "Cases and checks 1" (two rules in one sub-bullet, the second stated again by item 9) is closed by "Each rule is its own sub-bullet (item 1)". Line 10 is that same shape. The builder wrote the text as dictated, as rule 4 of `docs/dev/change-standard.md` requires, so this is a defect of the brief's text for the orchestrator. Failure scenario: a reviewer of a later comparison finds a judge started from the orchestrator's own checkout on the right model. Line 12 then counts as met by one reading, since the judge ran as its own process that listed no skill, and as broken by another. The removal list is kept in two places that can drift. Verdict: none (item 1 holds as dictated).
2. `docs/dev/blind-comparison.md:19`: "A fresh agent makes each judgment, so the second judge has no memory of the first."; what is wrong: item 4 now makes the judge "its own process" (line 12), a `claude -p` session. The glossary keeps the two apart: **runner** is "the program that runs the sessions and agents, Claude Code, with its agent tool", and **reviewer** is "the fresh session or agent". Item 7 still reads as an agent the runner starts, and an agent the runner starts is shown every installed skill (the brief's premise: 35 names, `grill` among them). This breaks rule 19 of `docs/dev/change-standard.md` ("A change leaves no two statements that contradict each other"). The step line's "every page that restates item 4 changed with it" does not reach a sentence on the same page. The glossary's **blind comparison** ("by two fresh judges") and **verdict, of a blind comparison** stay true. Failure scenario: an orchestrator follows item 7 and starts the judges through the runner's agent tool, as step 14 did, so the route item 4 closes is open again. Verdict: none.

## 4. Behaviour

1. The builder's report, "User-visible change, before and after", gives the text before and after only. What is wrong: it does not state what changes for the host when step 14 runs again under the page.
   - The judges leave the runner. They become `claude -p` processes with no agent record, their served model read from the JSON.
   - Each process refuses reads outside its folder and every WebFetch (probe B).
   - Line 11 has the orchestrator copy each source the input names into each judge's copy. Step 14's input names `research-hub` as its sources' repository (`git show 833e2e8:.scratch/plan-drafts/3-the-writing-base.md`, line 14; `docs/academic-coverage.md`), and `du -sh /Users/axelfaes/workspace/research-hub` printed `26G`, about 52G for the two judges. `df -h` printed 125Gi free. The page leaves open whether a named source means the whole repository (its example is "another repository an entry reads") or the files named. A copy of the named files only would leave out what the outputs cite elsewhere in it, such as `research-hub/projects/manuscripts/bttn-incident-af/main.tex`, which judge 3 checked, and the process then refuses the in-place read (Spec 1).

   The report should have stated this under "every user-visible change with its before and after" (rule 7). Failure scenario: the orchestrator starts step 14's rerun expecting judges like the last ones, copies 26G twice or copies too little, and gets verdicts in which cited files and URLs went unchecked. Verdict: none.

## Declined to judge

- Which remedy Spec 1 to 5 call for is not judged here: a permission flag or `--add-dir` for cited files and URLs, which `modelUsage` key is recorded, what happens to `plan.md`'s gate and skill names, whether a whole copy of a skill's text is removed, whether the global instructions are part of the judge's input. Each is a change to the protocol beyond the ruling's words or a choice the brief reserved, so it is the orchestrator's or the user's.
- Whether step 14's runner-agent judges also loaded `~/.claude/CLAUDE.md`: not checked; their transcripts were not read for it.
- The sentence length of lines 12 (36 words) and 14 (45 words, two sentences) against the prose standard's "under roughly 20 words unless the mechanism needs more": whether the mechanism needs it is a reading call, and it is left to the fix of Standards 1.
- The time and disk actually taken to copy research-hub: not measured. Only `du -sh` (26G) and `df -h` (125Gi free) were run.
- Step 14 run again under the page: not run. It is the orchestrator's run after landing, as the brief says.
- Whether `--bare` can run under the user's authentication: not probed. Only its help text is quoted.

Reviewer usage: tokens not visible from inside this agent; about 50 tool uses, 5 of them `claude -p` probes on opus (probe C's JSON gives `total_cost_usd` 0.1725286; the others' costs were not read); minutes not visible.

## Repair round 1, refuted

Reviewed on /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14b, base 50e3844336505b61fd71fb645979f2d7a25abf18. The round's delta is the whole of `git diff <base>` read against `.scratch/2-e-grill/agents/reviews/14b-round-0.diff`. `git status --short` shows ` M docs/dev/blind-comparison.md` and `?? .scratch/2-e-grill/agents/reviews/14b-report.md` and nothing else.

```
$ cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2e-14b && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md; echo "exit=$?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
exit=0

The dictated text against the page. The round brief's code blocks were extracted with the three-space indent of the markdown list stripped (22 lines and 3 lines):
sed -n '9,30p' <page> | diff <ruling 1 block> -   -> printed nothing, "item4 block equals dictated"
sed -n '37,39p' <page> | diff <ruling 3 block> -  -> printed nothing, "record block equals dictated"
base line 11 with "A fresh agent makes" replaced by "A fresh judge process (item 4) makes", diffed against page line 33 -> printed nothing
git show 50e3844:docs/dev/blind-comparison.md, diffed against main's copy -> printed nothing (main equals base)

Round check 2: each of the 26 new or changed lines (22 + 3 + item 7's line) as the one line of a scratch file, then grep -c -F -x -f <file> docs/dev/blind-comparison.md
1: 1 ... 26: 1   (all 26 print 1)
The 10 lines round 0 added (from 14b-round-0.diff, lines starting '+   - '), same command:
old 1: 1 (the kept "The judge receives no file of either skill being compared.")   old 2 to old 10: 0
grep -c "A fresh agent makes" docs/dev/blind-comparison.md -> 0

Round check 3: diff -U2 /Users/axelfaes/workspace/ordo/docs/dev/blind-comparison.md docs/dev/blind-comparison.md -> exit 1, one hunk "@@ -7,10 +7,35 @@", 26 '+' lines, 1 '-' line (item 7). Its body, from the third line on, compared with the body of the builder's quoted Check 3 -> "report's diff body equals rerun".

Round check 4: LC_ALL=C grep -n '[^ -~]' docs/dev/blind-comparison.md -> nothing, exit 1. wc -l -> 44.

The builder's other-pages grep, rerun: grep -rn -i -e "fresh agent" -e "fresh judge" -e "judge's copy" -e "judge process" skills utils docs README.md (outside the page) prints hits in ordo-help, spec, brief-check.md, pin.test.sh, glossary.md:130, roadmap.md:59, adr/0003, plan-loop.svg, README.md:38 and gen_figures.py:584. None is about the judge of a blind comparison. glossary.md:130 ("two fresh judges") stays true. Reproduced.
grep -rn -i "blind" skills utils README.md docs (outside the page): no page restates item 4. Reproduced.

Probes. Each ran from P=/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/14b-probe/a, which holds one file, input.txt ("probe input line one"). CLI: claude 2.1.286.

(a) cd $P/a && claude -p --disable-slash-commands --allowedTools WebFetch --model opus --output-format json "Do these in order ... (1) List the names of every skill available to you, or NONE. (2) Use the WebFetch tool on https://example.com and give its first heading. (3) Use the Read tool on /Users/axelfaes/workspace/ordo/README.md and give its first line. (4) Use the Write tool to create the file out.txt in the current folder holding the word hi. (5) Use the Read tool on input.txt and give its first line."
exit=0
1. NONE. No skills are listed anywhere in this session's context.
2. ... The first heading is **Example Domain**.
3. The Read tool failed ... `Claude requested permissions to read from /Users/axelfaes/workspace/ordo/README.md, but you haven't granted it yet.`
4. The Write tool failed ... `Claude requested permissions to write to .../14b-probe/a/out.txt, but you haven't granted it yet.` The file was not created.
5. The Read tool on input.txt succeeded. Its first line is `probe input line one`.
permission_denials: Read (/Users/axelfaes/workspace/ordo/README.md), Write (.../a/out.txt)
modelUsage claude-opus-5-5 out 966 in 10
modelUsage claude-haiku-4-5-20251001 out 14 in 214
ls $P/a -> input.txt

(a, more) Same command. The prompt asked for Bash `ls ~/.claude/skills`, Bash `echo hi > out2.txt`, Bash `curl ... https://example.com`, Glob in /Users/axelfaes/workspace/ordo, and WebSearch.
1. `ls ~/.claude/skills` was blocked: "ls in '/Users/axelfaes/.claude/skills' was blocked. For security, Claude Code may only list files in the allowed working directories for this session: '.../14b-probe/a'."
2. ... "Output redirection to '.../a/out2.txt' needs approval ..."
3. The `curl` command did not run ...: "This command requires approval"
4. ... this session has no Glob tool ...
5. ... "Claude requested permissions to use WebSearch, but you haven't granted it yet."
denied tools: Bash x3, WebSearch; ls $P/a -> input.txt

(a, MCP) Same command, asking for PubMed search_articles and bioRxiv get_categories:
"Claude requested permissions to use mcp__claude_ai_PubMed__search_articles, but you haven't granted it yet." and the same for mcp__claude_ai_bioRxiv__get_categories.

(b) Same command, "Reply with the word ok." -> RESULT: ok; modelUsage claude-opus-5-5 {'inputTokens': 2, 'outputTokens': 4} (one key only)
(b) Same command, "Use the WebFetch tool three times, once on each of https://docs.vale.sh/topics/styles.md, https://developers.google.com/style/dashes and https://learn.microsoft.com/en-us/style-guide/punctuation/dashes-hyphens/emes, each time with the prompt: Return the full text of the page verbatim, every paragraph. Then reply with only the word done."
RESULT: done turns 5 denials 0
modelUsage claude-opus-5-5 {'inputTokens': 6, 'outputTokens': 412}
modelUsage claude-haiku-4-5-20251001 {'inputTokens': 7605, 'outputTokens': 4284}
(The key with the most output tokens is haiku here. In probe (a), with one fetch, it is opus: 966 against 14.)

(c) Same flags with --output-format stream-json --verbose, "Reply with the word ok."
system/init keys: agents, analytics_disabled, apiKeySource, capabilities, claude_code_version, cwd, fast_mode_disabled_reason, fast_mode_state, mcp_servers, memory_paths, messaging_socket_path, model, output_style, per_turn_effort_active, permissionMode, plugins, product_feedback_disabled, session_id, skills, slash_commands, subtype, tools, type, uuid, view_mode
  model : "claude-opus-5-5"
  skills : []
  memory_paths : {"auto": "/Users/axelfaes/.claude/projects/-private-tmp-claude-502--Users-...-14b-probe-a/memory/"}
  (no key names ~/.claude/CLAUDE.md or ~/.claude/rules/)
(c) Same flags with --output-format json --debug-file $P/c3.debug.txt, "Reply with the word ok." -> 265 debug lines. grep -E 'CLAUDE|rules' shows only
  "$.fs.ancestors (cc-plugin-agents-md): CLAUDE.md, .claude/CLAUDE.md, CLAUDE.local.md found 0 of 8 directories"
  and no line naming ~/.claude/CLAUDE.md or a rules file. The JSON result's keys: api_error_status, duration_api_ms, duration_ms, ..., modelUsage, num_turns, permission_denials, result, ..., session_id, ..., usage, uuid (no model key, no instruction files).
(c) The run's session transcript, ~/.claude/projects/-private-tmp-claude-502--Users-axelfaes-workspace-ordo-3998c800-...-scratchpad-14b-probe-a/6d046895-1029-4c15-9074-c6bc2aa644ee.jsonl, line 11, attachment type "instructions", files[].path:
  /Users/axelfaes/.claude/CLAUDE.md (type User)
  /Users/axelfaes/.claude/rules/no-claim-without-a-command.md
  /Users/axelfaes/.claude/rules/never-take-the-lazy-option.md
  /Users/axelfaes/.claude/rules/no-quick-answers.md
  /Users/axelfaes/.claude/rules/scripts-compute-facts.md
  /Users/axelfaes/.claude/rules/answers-reach-axel-in-full.md
  grep -c -i grill <that transcript> -> 0 (no skill text in the process's context. The debug log's line 40 "Loaded 22 unique skills (... user: 13 ...)" is the program reading the folders, and the init message lists "skills": [] and no Skill tool.)

Inputs of the cases, read at 833e2e8:
git grep -n '^+++ b/skills/grill\|^diff --git a/skills/grill' 833e2e8 -- .scratch -> only .scratch/2-e-grill/agents/reviews/12-round-0.diff and 9a-round-0.diff
git log --format='%h %s' 833e2e8 -- skills/grill -> 1 commit, ff656b6 "Land step 12 of plan 2.E, the grill skill"
Rulings of .scratch/2-e-grill/plan.md at 833e2e8 naming entry 3: one bullet, "Entry 3 and step 13 (2026-09-30): Axel ruled (a). Step 13 runs `/grill` on roadmap entry 3 with Axel ..."
git show 833e2e8:.scratch/plan-drafts/3-the-writing-base.md line 14 names research-hub paths ("`academic-paper/references/academic_writing_style.md` ... `writing_judgment_framework.md` ..."), not the repository alone.
grep of URLs in 14-blind-comparison.md: 11 distinct, among them https://raw.githubusercontent.com/vale-cli/agent-tools/main/skills/fix/SKILL.md
```

### Verdicts

Items of the brief's "What to build", as the round's rulings rewrote them:

- 1 (item 4's sub-bullets, round ruling 1): holds. Lines 9 to 30 equal the dictated block ("item4 block equals dictated"), each line once, line 8 unchanged. Spec 1, Spec 2, Proof 1 and Standards 1 are findings on the dictated text, not departures from it.
- 2 (item 9's record, round ruling 3): holds. Lines 37 to 39 equal the dictated block and follow line 36 `   - the input, or its path;`.
- Round ruling 2 (item 7): holds. Line 33 differs from the base only in "A fresh judge process (item 4) makes".

Cases (C1 and C5 as the round restates them, and C7 to C9 from the round):

- C1: met. `skills/grill/` is removed by line 11. `12-round-0.diff` is a file of the skill by line 10, and it goes with the ledger `.scratch/2-e-grill/` (line 12), which is the only ledger whose diffs change `grill` at 833e2e8 (git grep above). The one Rulings bullet naming entry 3, "Entry 3 and step 13", is kept by line 13. Roadmap line 25, the gate of 2.E, is removed by line 14. The record holds all of it (line 37). The brief's first C1 ("plan.md stays in the copy") is replaced by this ruling.
- C2: met. Lines 11 and 12 remove nothing from a record, line 37 then gives "none", and lines 21, 26 and 27 hold for any input.
- C3: met. Line 15 copies the named sources, line 18 removes both skills' files from them, and line 30 keeps the judge off the sources in place. Probe (a) shows that a read of /Users/axelfaes/workspace/ordo/README.md is refused.
- C4: met. Probe (a): "1. NONE."; `ls ~/.claude/skills` blocked; the init message's `"skills": []`.
- C5: partial. A cited URL is fetched: probe (b) fetched docs.vale.sh/topics/styles.md with 0 denials. A cited file outside the copy is copied (line 17). The missing part: an output that cites a file of either skill by its URL is open to the judge. That is Spec 1.
- C6: met. Items 1 to 3, 5, 6 and 8 are unchanged, and item 7 changes by ruling 2 only. Item 2 removes marks from outputs, and lines 11 to 14 remove files and lines from the judge's copy.
- C7: met. The draft's line 14 names paths inside research-hub, so line 16 does not make the orchestrator copy the whole repository.
- C8: partial. Line 39 records every key, which is met. The rule in line 24 picked haiku in probe (b) (4284 against 412 output tokens). That is Proof 1.
- C9: met. The process loads the six files (the transcript's `instructions` attachment), line 25 states it, and line 39 records them. How the orchestrator gets them is Spec 2.

### Findings

#### Spec

1. `docs/dev/blind-comparison.md:29`, item 4: "The judge may fetch a URL an output cites, to check that it resolves and says what the output claims.", with line 22 "The judge's process may fetch a URL, and has no other permission beyond reading its copy."
   - What is wrong: the ruling "Step 14b, what keeps a judge off the text of the skills compared" (plan.md Rulings) keeps "cited files and URLs open to the judge except the skills' files". The brief's C5 asks that "an output that cites a file of either skill: the judge does not open it". Round 0's line carried "except a file of either skill" for both files and URLs. Round 1 keeps the exception only for copied files (line 17). Line 29 lets the judge fetch any cited URL, and line 22 lets the process fetch any URL at all.
   - The judge is told only lines 26 and 27, so it never learns line 9's rule. Nothing the orchestrator removes can reach a web page. This is a finding closed by removing a check rather than fixing what it guarded: Spec 1 of the first report needed fetches let through, and the exception went with the rewrite.
   - Outputs do cite a skill's SKILL.md by URL: step 14's side 1 cites `https://raw.githubusercontent.com/vale-cli/agent-tools/main/skills/fix/SKILL.md`.
   - Failure scenario: in a comparison against a skill published on GitHub (2.F against mattpocock's `diagnosing-bugs`, or 22.A's against `code-review`), an output cites the compared skill's SKILL.md by its github URL. The judge fetches it under line 29, as the probes show the command allows, and reads the text line 9 keeps from it.
   - Verdict: C5 partial.
2. `docs/dev/blind-comparison.md:39`, item 9: "each judge's command, every key of its `modelUsage`, and the global instruction files it loaded (item 4);"
   - What is wrong: item 4 names where the model comes from (`modelUsage`, line 24) but names no source for the instruction files. Probe (c) shows that nothing the process prints gives them:
     - the JSON result has no such key;
     - the stream-json init message has only `memory_paths` with the auto-memory folder;
     - the `--debug-file` log names only the project search ("found 0 of 8 directories").
   - The one machine source is the run's session transcript, `~/.claude/projects/<the judge's copy path with / and . written as ->/<session_id>.jsonl`, whose attachment of type `instructions` lists `files[].path`. The `session_id` is in the JSON result.
   - Failure scenario: the orchestrator fills the line by asking the judge's process, either in the judging run, which puts the question into the judgment, or in a second run. It then records a model's account of its own context. Or it lists `~/.claude/rules/`, which records what exists rather than what loaded. Either way the record line looks verified and no command stands behind it.
   - Verdict: none (C9 met).

#### Proof

1. `docs/dev/blind-comparison.md:24`, item 4: "The judge's served model is the key of the process's `modelUsage` with the most output tokens."
   - The builder's round-1 C8 walk says this line "gives the reviewer model as the served model when a helper model's key is also present" and marks C8 met.
   - What is wrong: the rerun does not reproduce that. Probe (b), three fetches of long pages followed by a one-word reply, printed `claude-opus-5-5` outputTokens 412 and `claude-haiku-4-5-20251001` outputTokens 4284. The rule picks haiku. In probe (a), with one fetch, it picks opus (966 against 14), and with no fetch there is one key.
   - The served model is given exactly elsewhere: the stream-json init message's `"model": "claude-opus-5-5"`, which the JSON result lacks.
   - The decision that rests on it: which model item 9's record names as the judge's, and whether the orchestrator takes a judge as run on a model other than the configured one (line 23).
   - Failure scenario: a judge that checks many citations by fetching their text (item 5's "says what the output claims") and writes a short verdict gets haiku recorded as its model. The orchestrator then either discards a valid verdict or keeps a record that says the judge ran on haiku. How often a real judgment tips this way is not measured (Declined to judge).
   - Verdict: C8 partial.

#### Standards

1. `docs/dev/blind-comparison.md:15` and `:16`: "The orchestrator copies into the judge's copy each file or folder the input names as a source." / "A repository is copied whole only when the input names the repository and no path inside it." Also `:12` and `:13`: "... removes from the judge's copy the ledger of each plan that builds or changes either skill." / "... keeps, in a file of its own in that ledger's place, the bullets of its Rulings that name the input's entry."
   - What is wrong: line 16 is a limit of line 15's rule, and line 13 an exception to line 12's. Each stands in a bullet of its own. `docs/dev/skill-layout.md`, "Lists and tables", first bullet, says "a qualifier that changes the rule (an exception, a limit, a condition) stays in the same bullet as the rule". The brief made that its rule under "Read" item 3.
   - The builder wrote the text as dictated, so the defect is in the round brief's text.
   - Failure scenario: an orchestrator who takes the rule from line 15 or line 12 alone, as a grep hit gives it, copies the whole 26G research-hub, or removes the plan ledger together with the Rulings bullet "Entry 3 and step 13" that the outputs are checked against.
   - Verdict: none.

#### Behaviour

None.

### Declined to judge

- Whether a subagent that the judge's process starts through its Task tool is held to the same permissions: not probed in this run. The first report's probe C showed only that such a subagent lists no skill.
- The Google Drive, Gmail, Calendar and Claude Docs tools connected to the judge's process (all in the init message's `mcp_servers`): not called, so that no private data of the user was read. PubMed and bioRxiv, which have the same permission status, were refused.
- How often a real judgment gets more helper output tokens than judge output tokens: not measured. Probe (b) is a constructed prompt. A judge run over step 14's two outputs would settle it.
- Whether the judge may be able to tell which output is `grill`: at 833e2e8 the copy keeps the glossary's "decision form" (`docs/glossary.md:29`: "a heading `D<n>. <the decision, as a phrase>` ... Stated in: `gr[ill]`") and entry 2.E's goal line, and side 1 uses `## D<n>.` headings. Line 14 removes the gate, so the judge is not told which output is expected to win. Ruling (a) chose the instruction of lines 26 and 27 for text the input quotes, so whether this is acceptable is the user's call.
- The input of step 14's run again: at 833e2e8 it holds no output of step 13 (`git merge-base --is-ancestor 7e984dd 833e2e8` is false). Which tree the rerun uses is step 14's decision and outside this step.
- Step 14 run again under the page: not run. It is the orchestrator's run after landing.

Reviewer usage: tokens not visible from inside this agent; about 40 tool uses, 8 of them `claude -p` probes on opus (costs from their JSON: 0.1747, 0.1532, 0.1431, 0.1054, 0.2229, 0.0062, 0.0062 USD; one run exited at argument parsing before any request); minutes not visible.
