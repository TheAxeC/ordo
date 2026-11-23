# Step 3 brief check (on main at 4d63a7f)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. `git log --oneline -1` printed `4d63a7f Rule the command stages of wizard`; `git status --short` printed ` M .scratch/18-wait-what-and-wizard/orchestrator-state.md` and `?? .scratch/18-wait-what-and-wizard/agents/briefs/3.md`. Nothing was written, no skill invoked, no agent started.

## 1. Names

- `run_cmd`: `git grep -n 'run_cmd' -- . ':!.scratch'` printed nothing. No hit outside the paths.
- `template.test.sh`: `git grep -n 'template\.test\.sh' -- . ':!.scratch'` printed nothing. No hit outside the paths.
- `have`: `git grep -n -w 'have' -- skills/code/wizard` printed one hit, `skills/code/wizard/templates/template.sh:18:# Exit status: 0 when the last stage and the closing summary have run; ...`, inside the paths (the prose word). ``git grep -n '`have`\|have()\|if have \|! have ' -- skills utils docs README.md`` printed nothing. No hit outside the paths.
- `OS`: `git grep -n -w 'OS' -- skills utils docs README.md` printed `skills/ordo/repo-setup/templates/gitignore/common.gitignore:5:# OS and editors`. Outside the paths; a comment about another thing, not made false.
- `SKIPPED` and "still to do by hand": `git grep -n 'still to do by hand\|SKIPPED' -- skills utils docs README.md`. The hits outside the wizard folder are `skills/academic/paper/agents/visualization_agent.md:362`, `skills/academic/paper/references/vlm_figure_verification.md:72` and `:73`, `skills/academic/paper/templates/lookup.py:271`, `:1300`, `:1306`: other things of the same name, not made false. Inside the paths, two lines the change makes false that no item of "What to build" names:
  - `skills/code/wizard/templates/template.sh:17:#   - "still to do by hand:" in the closing summary, with each skipped secret and variable.` False once a declined command is listed there too. 1.5 says the head comment "gains" two warnings; it does not say this line changes.
  - `skills/code/wizard/templates/template.sh:43:SKIPPED=()        # things we couldn't do (e.g. gh missing)`. False once the array also holds commands the person declined. 1.1 fixes the functions byte for byte and says nothing of this comment.
- The sentences on scope ("only a person can take", "a person must take", "agent can perform itself", "session can take itself"): `git grep -n 'only a person can take\|a person must take\|agent can perform itself\|session can take itself' -- skills utils docs README.md`. Hits outside the paths:
  - `docs/adr/0046-...md:7` (Context, describing ADR 0045's copy) and `docs/adr/0046-...md:11` (the Decision the step is under): not made false.
  - Inside the paths: `README.md:29`, `docs/dev/scripts.md:18`, `skills/code/wizard/SKILL.md:3`, `:27`, `:86`. `SKILL.md:27` ("the action it met that only a person can take", "What it reads" item 1) is named by no item: 3.2 covers item 2 only.
- `wizard` as a whole: `git grep -n -i wizard -- . ':!skills/code/wizard' ':!.scratch'`. Hits outside the paths: `README.md:35` and `README.md:159` (lists of skill names, not made false); `docs/figures/gen_figures.py:2252` and `docs/figures/pipeline.svg:110` ("These start no agent: ... /wizard ...", still true; the brief names the `.py` line and not the `.svg` line, which holds the same text); `docs/adr/0045-...md` lines 1, 3, 7, 11, 17, 18, 22, 27 and `docs/adr/README.md:54`, `:55` (records, not made false); `docs/roadmap.md:23`, `:26`, `:27`, `:90` (the goal at `:26` already reads "running the commands a stage needs, each shown and confirmed first"; not made false).
- The tools the checks need: `sed -n '116,127p' README.md` printed `- git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/orchestration/land/templates/checks.sh`, also needs `bash`.` Outside the brief's README range (line 29 only). The new test starts `bash`; the sentence stays true, since it already lists `bash` for the checks.
- The verify list: `grep -n 'verify' -A22 .scratch/18-wait-what-and-wizard/orchestrator-state.md` printed 14 commands, lines 7 to 21, equal to `docs/dev/building.md`. Outside the paths; 4.3 makes it unequal to the page until the session rewrites it (see check 7, ADR 0010). `ls .scratch` printed `18-wait-what-and-wizard archive choices.md retros`: no other open plan holds a list.

Findings:
- 1a. `template.sh:17` and `template.sh:43` become false and no item names them. 1.5 should say that line 17 names the declined commands too, and 1.1 or 1.5 that the comment of `SKIPPED` is rewritten.
- 1b. `SKILL.md:27` is in the paths, is covered by the read case "no sentence of `SKILL.md` ... still says the script is only for actions a person must take", and has no item under 3. The change standard, "The rules" 20, leaves out a change no item asks for.
- 1c. A judgment, not a grep result: `OS` is an environment variable Windows sets (`Windows_NT`) and Git Bash and MSYS export. A script that assigns `OS=windows` there changes what every command started by `run_cmd` sees, and build files that test `OS` for `Windows_NT` take the other branch. Decision 1 of the brief chose the name; a name of the script's own would not collide.

## 2. The step line

- "`template.sh` with the source's helpers unchanged": 1.1, 1.6.
- "a check whether a tool is installed": 1.3.
- "a helper that shows one command, asks for a yes, runs it only on a yes and ends the script with the command's status when it fails": 1.4.
- "the operating system the script runs on": 1.2.
- "`SKILL.md` with a stage's commands in its scope": 3.1, 3.9.
- "its stage list": 3.3, 3.8.
- "its steps": 3.3, 3.4, 3.5, 3.6.
- "the rule that no command runs without being shown and confirmed": 3.10, first sentence.
- "the rule that the skill is not for an action the session can take itself, now, on the machine it runs on": 3.10, second sentence.
- "a test of the added helpers beside the template": 2.
- "with its command on `docs/dev/building.md`": 4.3.
- "the skill's rows in `README.md` and `docs/dev/scripts.md`": 4.1, 4.2.
- "`bash -n` on the template exits 0": "Verify before you report" 3 and the case "run: `bash -n`".
- "the ASCII check prints nothing": "Verify before you report" 1.
- "the test passes": "Verify before you report" 2.
- "a reviewer reads the skill and the library against ADR 0046": no requirement of "What to build"; it is the reviewer's, and the brief names ADR 0046 with its Decision under "What is on the tree".
- "(1 commit)": the landing's.

Findings: none. (The brief also asks for 1.5, 3.2, 3.7 and the command in `docs/dev/change-standard.md`, which the step line does not name; the change standard, "The rules" 14, and the last paragraph of `docs/dev/building.md` ask for them.)

## 3. Premises

- 100 and 237 lines: `wc -l skills/code/wizard/SKILL.md skills/code/wizard/templates/template.sh` printed `100` and `237`. Matches.
- Library to the `# STAGES:` block, then `run_wizard() {`: `grep -n 'STAGES:\|^run_wizard' ...template.sh` printed `209:# STAGES: author this section. ...`, `215:run_wizard() {`, `237:run_wizard "$@"; exit`. Matches.
- The functions: `grep -n '^[a-z_]*()' ...template.sh` printed `_clear` 47, `banner` 54, `stage` 66, `say` 74, `step` 76, `note` 77, `warn` 78, `open_url` 81, `pause` 93, `confirm` 99, `_existing` 108, `ask` 123, `ask_secret` 136, `write_env` 154, `set_secret` 169, `set_var` 183, `finish` 196, `run_wizard` 215. Matches (the brief leaves `run_wizard` out as not part of the library).
- "`grep -n 'have\b\|run_cmd\|\bOS\b' skills/code/wizard/templates/template.sh` prints nothing": it printed `18:# Exit status: 0 when the last stage and the closing summary have run; otherwise the status of the first command that fails, as set -e gives it, such as 1 when the input ends before an answer. Ctrl-C ends the script on the signal, which a shell reports as 130.` and exited 0. Does not match. The fact the premise is for (no `have` function, no `run_cmd`, no `OS`) holds: the function list above has none of them.
- `confirm` and `finish`: `sed -n '/^confirm()/,/^}/p;/^finish()/,/^}/p' ...template.sh` printed `confirm` with `printf '  %s? %s [y/N] ' ...`, `read -r reply || true`, `[[ "$reply" =~ ^[Yy] ]]`, and `finish` with `warn "still to do by hand:"` and `for s in "${SKIPPED[@]}"; do note "  - $s"; done`. Matches.
- Head comment, lines 6 to 18: `cat -n` of the template shows `Inputs:` at 6, `Warnings` at 13, `Exit status` at 18. Matches.
- `templates/` holds `template.sh` alone: `ls skills/code/wizard/templates` printed `template.sh`. Matches.
- `wizard` in `README.md` 29, 35, 159, `docs/dev/scripts.md` 18, `docs/figures/gen_figures.py` 2252: `grep -n wizard README.md docs/dev/scripts.md docs/figures/gen_figures.py` printed those five lines. Matches.
- `docs/dev/building.md`, 14 commands, the last test line `sh utils/pin.test.sh`, then the character-set check: `cat -n docs/dev/building.md` shows the block at lines 6 to 19, `sh utils/pin.test.sh` at 18, the check at 19. Matches. `docs/dev/change-standard.md`'s block starts at line 70 with `sh utils/pin.test.sh 2>&1 | tail -1` at 82. Matches. `docs/dev/scripts.md:50` is `| `utils/pin.test.sh` | `utils/pin.sh` |`. Matches.
- The description's length: the brief's `python3 -c ...` printed `803`. Matches.
- ADR 0046's Decision as quoted: `cat docs/adr/0046-*.md` shows the same sentences, with one sentence before them the brief leaves out ("`wizard` also writes stages that run commands."). Matches.
- ADR 0045's status: its line reads "proposed; superseded by 0046 in the library of `wizard`'s template, which gains helpers for commands, in the scope of `wizard`, which now holds the commands a stage needs, and in its sentence that the library has no test". Matches.

Findings:
- 3a. The premise "`grep -n 'have\b\|run_cmd\|\bOS\b'` ... prints nothing" is false as written: the command prints line 18 of the template. A command that shows the fact is `grep -n '^have()\|^run_cmd()\|^OS=' skills/code/wizard/templates/template.sh`.

## 4. Cases and checks

- test, a yes: consistent.
- test, a no: consistent.
- test, the end of input: inconsistent with the change standard, "The rules" 13, first bullet, and with the brief's own "none of the test cases above is an audit". On the unchanged tree `run_cmd` is not defined, so the file does not exist and nothing hangs: the case as written passes there. "Does not hang" has no assertion a POSIX `sh` test can make; a hang shows only as the test never ending.
- test, a failing command: consistent.
- test, one word stays one word: consistent, and it is the case the change standard, "The rules" 15, asks for at the place the words reach a command.
- test, `have`: consistent.
- test, `OS`: consistent with the rules; see checks 5 and 6 for what it leaves out.
- run, `bash -n`: consistent.
- run, the functions unchanged: consistent. `say`, `step`, `note` and `warn` are one line each, so "from its name to its closing `}`" is that one line for them; a range that runs to the next line starting `}` would take in the function after.
- read, `SKILL.md` against 3.1 to 3.10, each item present once: inconsistent with `docs/dev/skill-layout.md` in three places, named in the findings below.
- read, no sentence still says the script is only for actions a person must take: at odds with 4.1 and 4.2, which only add ("it also says", "also names"). `README.md:29` and `docs/dev/scripts.md:18` both hold "the actions only a person can take"; the case can be read to require a rewrite the items do not ask for.
- read, a shipped file names nothing private: consistent with the repository's rule on shipped files.
- The brief makes no builder write a file, folder, document, project or person of the author's own, and no path outside the repository, into a shipped file.

Findings:
- 4a. The end-of-input case passes on the unchanged tree. With the result 1.4 gives for it (the script exits 0 and the output of `finish` lists the command under "still to do by hand:") it fails there.
- 4b. 3.1 adds a use (an install of a tool) and asks for no trigger phrase. `docs/dev/skill-layout.md`, "Frontmatter": "`Triggers on:` lists at least one phrase for each case the skill is for".
- 4c. 3.9's new row ("a command run outside `run_cmd`"), 3.5 ("one `run_cmd` per command"), 3.6 ("no command outside one") and the first sentence of 3.10 state one rule in Anti-patterns, Steps and Rules. `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in", and "Anti-patterns", row "The same rule written in two sections". The second sentence of 3.10 and the first Anti-patterns row are the same pair.
- 4d. 3.5, "no secret is ever a word of a command", is a prohibition with no behaviour to do instead: a stage whose command needs a secret (a token given to a tool's login) is left with no way stated. `docs/dev/skill-layout.md`, "Writing for an agent", first bullet.
- 4e. 3.3 asks for "the check that shows the stage is already done" for a stage that reaches a state, and the library gains only `have`, which checks a tool. A check of a state is itself a command (does a folder exist, is a service running), and 3.6 and 3.10 say no command stands outside `run_cmd`. The brief does not say what such a check may be. `docs/dev/change-standard.md`, "The rules" 19.
- 4f. 3.6 changes what Steps 6 traces and does not name its "Done when", which today reads "the trace finds every value". `docs/dev/skill-layout.md`, "Writing for an agent": "Each item of Steps ends on its completion criterion". 3.3 names the "Done when" of Steps 1; 3.6 does not.
- 4g. The read case on "only for actions a person must take" and items 4.1 and 4.2 disagree on whether `README.md:29` and `docs/dev/scripts.md:18` keep "the actions only a person can take".
- 4h. No case asks the builder to check, quote or explain a place the step does not change.

## 5. The question

The goal: a script whose stages run the commands a stage needs, each shown and confirmed first.

- test, a yes: yes. "The output holds the command" passes when the command is printed after it ran, or after the question.
- test, a no: yes for "shown". It asks for the command in the list of `finish`, not for the command printed before the question; a `run_cmd` that asks "Run it?" without showing the command passes.
- test, the end of input: yes. It passes on the unchanged tree (4a).
- test, a failing command: no. A script that went on, or ended with another status, fails it.
- test, one word stays one word: no for the run. It does not read the printed line (see 6a).
- test, `have`: no.
- test, `OS`: yes. Run on one machine, it reads one of the four values; a wrong `linux`, `windows` or `unknown` branch passes.
- run, `bash -n`: yes, it shows syntax only; it is a fact check and is not offered as more.
- run, the functions unchanged: no for what it is for (1.1).
- read, `SKILL.md` against 3.1 to 3.10: no, a reviewer reads each item.
- read, no sentence still says only a person's actions: no.
- read, nothing private: no.
- The check on the step's line (`bash -n`, the ASCII check, the test, a reviewer reading the skill and the library against ADR 0046): no as a whole, since the reviewer reads `run_cmd` against "shows the command, asks the person for a yes, runs it only on a yes". The test alone: yes, by the three cases above.
- 1.1: the run case; no.
- 1.2: the `OS` case; yes, as above.
- 1.3: the `have` case; no.
- 1.4: the five `run_cmd` cases; yes for "shown first" and for the end of input, no for the rest.
- 1.5 and 1.6: no case reads the head comment or the lines from `run_wizard() {` to the end; they are checked only by the reviewer's reading. Yes, in that no check of the brief names them.
- 2: "Verify before you report" 2 and 5; no, given the cases are changed as above.
- 3.1 to 3.10: the read case; no.
- 4.1 to 4.3: the read case covers the scope sentence of two rows; the new rows and lines for `template.test.sh` have no case. The brief's character-set command, run now with the missing test file in its list, printed `Can't open skills/code/wizard/templates/template.test.sh: No such file or directory.` and exited 0, so it does not show the file exists; "Verify before you report" 2 does.

Findings:
- 5a. "Shown first" is tested by no case. The no case should also hold: the output holds the command's line before the question, though the command did not run.
- 5b. The end-of-input case (4a).
- 5c. The `OS` case reads one branch (6b).
- 5d. 1.5 and 1.6 have no case: a read case for the head comment (each input, warning and exit status the additions bring), and a run that shows the lines from `run_wizard() {` to the end equal the base.

## 6. Implied inputs

- A word of a command that holds a space, a semicolon or a quote, where it reaches the printed line: missing. The case "one word stays one word" checks what runs, not what is shown. A line printed unquoted reads `touch <scratch>/a b; touch <scratch>/c`, which is two commands, while one runs: the person confirms a command other than the one shown. The change standard, "The rules" 15, makes the printed line a case. Expected result: the printed line holds the word as one quoted word, the form `printf '%q'` gives; `bash -c 'printf "%q " touch "/x/a b; touch /x/c"; echo'` printed `touch /x/a\ b\;\ touch\ /x/c` under the machine's `bash` (`GNU bash, version 3.2.57`).
- `uname -s` giving `Linux`, a name starting `MINGW`, `MSYS` or `CYGWIN`, another name, and `uname` missing: missing. Decision 5 of the brief says a wrong answer runs the command of another system. Expected results: `linux`, `windows`, `windows`, `windows`, `unknown`, `unknown`, each from a scratch `uname` first on `PATH`, and a `PATH` without `uname`. For the missing `uname`: `bash -euo pipefail -c 'x=$(nosuch_uname -s 2>/dev/null); echo reached'` printed nothing and exited 127, so under the library's `set -e` an unguarded assignment ends the script before the first stage; the expected result is `unknown` and a script that goes on.
- `have` as a bare statement under the library's `set -e`: missing. `bash -euo pipefail -c 'have(){ command -v "$1" >/dev/null 2>&1; }; have nosuchtool_zz; echo reached'` printed nothing and exited 1: a stage that calls `have TOOL` outside a condition ends the script silently when the tool is missing, which is the run the stage exists for. Expected: 3.5 says `have` stands in the condition of an `if`, and the `have` case runs it that way inside a scratch script (`if ! have <missing>; then run_cmd ...; fi` reaches `run_cmd`).
- `run_cmd` under `set -e` with a failing command: listed (the failing-command case). It also covers a tool that is not installed (status 127).
- The end of input: listed, with the wrong expected result (4a).
- The command's standard input: missing from 1.4, which states only where the output goes. An installer that asks for a password reads the person's terminal; in the test the standard input is the answers, and a command that reads it takes the answers of later stages. Expected: 1.4 says the command reads the script's standard input, and the test's commands (`touch`, `sh -c 'exit 7'`) read none, as they do now.
- The answers `banner` reads: `banner` calls `pause`, which reads one line. A scratch script whose stages call `banner` gives its `y` or `n` to `pause`. Not a case; the test section should say whether its stages call `banner`.
- `run_cmd` with no word: `bash -uc 'f(){ "$@"; echo "rc=$?"; }; f'` printed `rc=0`. It runs nothing; the session writes the stages and Steps 6 traces them. Not a case: it has not happened and a wrong answer costs nothing.
- A secret as a word of a command: stated in 3.5 as a rule, read by the reviewer; no case needed beyond 4d.

Findings:
- 6a. The printed line for a word with a space and a semicolon.
- 6b. The values of `OS` for `Linux`, `MINGW`, `MSYS`, `CYGWIN`, another name and a missing `uname`.
- 6c. `have` outside a condition under `set -e`.
- 6d. The command's standard input, unstated in 1.4.

## 7. ADRs

Read: the Status line and the Decision of each of the 46 records `docs/adr/0001` to `0046` (no `0015`), by `for f in docs/adr/0*.md; do sed -n 3p "$f"; awk '/^## Decision/{p=1;next} /^## /{p=0} p' "$f"; done`; 0010, 0045 and 0046 whole.

- 0046, proposed: touches. The step is under its whole Decision, which the brief quotes. Named under "What is on the tree".
- 0045, proposed, superseded by 0046 in the library, the scope and the sentence on the test: touches in its part in force: "`template.sh` in ASCII, and listed on `docs/dev/scripts.md`", "the head comment of `template.sh` lists the script's inputs, warnings and exit status", "the three rules on secrets in `wizard`", "the prose standard applied to the skill text". Named.
- 0010, proposed: touches. 4.3 changes the verification page, `docs/dev/building.md`. Its sentence: "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ... On a difference, the session rewrites the list in the state file and names the change in the brief or the booking." Not named under "What is on the tree". The brief does not contradict it: the state file is outside the builder's paths and the rewrite is the session's at landing.
- 0001 to 0009, 0011 to 0014, 0016 to 0044: do not touch. They govern the writing base, self-rule, the ledger's agents, the cost script, the dispatch blocks, the commits on main, `/writing`, `code-comments`, `paper`, and `grant`; the step changes none of their files, names, rules or behaviours. 0003, 0016, 0018, 0019, 0021, 0022, 0025, 0028, 0037 and 0041 are superseded whole.

Findings:
- 7a. ADR 0010 touches the step and the brief does not name it. The line the brief needs: the new command joins the state file's `verify:` list at landing, written by the session.
- No part of the brief contradicts an ADR in force.

## 8. Dictated text

- "No command runs without being shown to the person and confirmed with a yes: every command of a stage goes through `run_cmd`.": `grep -n 'No command runs without being shown to the person' .scratch/18-wait-what-and-wizard/agents/briefs/3.md` printed line 74. Holds against the change standard, the prose standard (no banned word, one colon, ASCII) and the glossary (no defined term used in another sense). Against `docs/dev/skill-layout.md`: the prohibition names the behaviour after its colon, which "Writing for an agent" asks for; "Where a rule goes" is broken only through 3.9's new row, which states it a second time (4c).
- "The skill is not for an action the session can take itself, now, on the machine it runs on.": `grep -n 'The skill is not for an action the session can take itself, now' ...` printed lines 19 (the ADR's quote) and 75. Holds: it is ADR 0046's sentence word for word; "the session" is used as the glossary's "session, the" defines it; the behaviour to do instead stands in the Do instead cell of the first Anti-patterns row, which `docs/dev/skill-layout.md`, "Writing for an agent", allows.
- "`sh skills/code/wizard/templates/template.test.sh`" (the line for `docs/dev/building.md`): `grep -n 'sh skills/code/wizard/templates/template.test.sh`' ...` printed line 83. Holds: the form of the lines of that block, and with `2>&1 | tail -1` the form of the block of the change standard, "Commands and their filters".
- The values "`macos`", "`linux`", "`windows`", "`unknown`": `grep -n 'Its value is `macos`' ...` printed line 30. Hold; values of a variable, no prose rule applies.
- "`PASS: <what it proved>`" and "`FAIL: <what failed>`": `grep -n 'PASS: <what it proved>' ...` printed line 49. Hold: `docs/dev/building.md` says a passing test "prints a last line starting with `PASS:` and exits 0; a failure prints a line starting with `FAIL:` and exits 1".
- "still to do by hand:": `grep -n 'still to do by hand' ...` printed lines 13, 40 and 88. Existing text of `template.sh:202`, quoted, not new.

Findings: none for the lines themselves.

## Declined to judge

- Whether the names `have` and `run_cmd`, and going on after a declined command (decisions 1 and 2), are the right design: the brief marks them as decisions, and the user or the orchestrator rules on them. 1c gives a judgment on `OS` only.
- Whether `metadata.version` stays `1.0.0` (decision 6): `docs/dev/skill-layout.md`, "Frontmatter", says a plan raises one part once; whether creation at `1.0.0` in step 1 counts as that raise, with two release candidates already pinned at that version, is the orchestrator's reading.
- Whether the description stays under 1,024 characters and the opening paragraph within the three sentences `docs/dev/skill-layout.md`, "Sections, in order", row 1 allows, once 3.1 is written: only the built text shows it. The description has 221 characters left.
- `shellcheck skills/code/wizard/templates/template.sh` printed `SC1087 (error)` at line 128 and `SC2329 (info)` at lines 183 and others, and exited 0. The lines are the source's and outside the step; whether Steps 6's `shellcheck` run on a written script should be clean was not judged.
- The glossary's body past its term list: the term list and the entries `case`, `session, the`, `stop` and `ADR` were read; the other entries were not read word for word, on the ground that the brief's dictated text uses none of them.
- The ADR records' Context, Alternatives and Consequences sections, other than those of 0010, 0045 and 0046, were not read.

Agent usage: a232eee9f9b9e14d4, claude-fable-5-2, 147945 tokens, 16 tool uses, 4.9 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1a: 1.1 has the comment of `SKIPPED` rewritten, and 1.5 has the head comment's line on "still to do by hand:" name the declined commands.
- 1b: 3.2 now covers "What it reads" 1.
- 1c: the variable is named `WIZARD_OS`, and decision 1 says why.
- 3a: the premise's command is `grep -n '^have()\|^run_cmd()\|WIZARD_OS'`, which prints nothing.
- 4a, 5b: the end-of-input case expects exit 0 and the command under "still to do by hand:".
- 4b: 3.1 asks for a trigger phrase for an install.
- 4c: 3.9 has each rule of 3.10 written once, in Rules, with no new Anti-patterns row; 3.6 no longer restates it.
- 4d: 3.5 says how a command takes a secret: from an environment variable the stage exports, or by asking itself.
- 4e: 3.3 and 3.5 say a check is `have` or a bash test that changes nothing, stands in an `if`, and is not a command of the stage.
- 4f: 3.6 names the "Done when" of Steps 6.
- 4g: 4.1 and 4.2 keep "the actions only a person can take" beside the commands, and the read case forbids only a sentence that says the script holds nothing else.
- 5a: the yes and the no case expect the command's line before the question.
- 5c, 6b: the `WIZARD_OS` case runs with a scratch `uname` for six names and with none.
- 5d: a run case for the lines from `run_wizard() {` to the end, and a read case for the head comment.
- 6a: 1.4 quotes each word as `printf '%q'` does, and the one-word case reads the printed line.
- 6c: 1.3 and the `have` case put `have` in the condition of an `if`.
- 6d: 1.4 says the command reads the script's standard input; the test's stages call no `banner`.
- 7a: ADR 0010 is named under "What is on the tree".
- Dictated lines added after the check: the trigger phrase "walk me through installing the dependencies" is given as an example and not dictated; no other line was added.
