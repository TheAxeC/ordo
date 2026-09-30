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
