# Step 2a brief check (on main at fcdfa8f)

The brief checked is `/Users/axelfaes/workspace/ordo/.scratch/2-f-diagnose/agents/briefs/2a.md`. Nothing was written in the repository; `git status --short` at the end prints only `?? .scratch/2-f-diagnose/agents/briefs/2a.md`. One scratch folder was made under `$TMPDIR` for the shell probes quoted below and removed.

## 1. Names

- Every name the step adds or changes, grepped over the whole repository with the brief left out: `git grep -n -i 'person-driven\|person driven\|actions file\|observations file\|a person drives\|person drives' -- . ':!.scratch/2-f-diagnose/agents/briefs/2a.md'`. Hits outside the ledger: `skills/diagnose/SKILL.md:198` (item 11) and `skills/diagnose/SKILL.md:208` (the Stops row). Both are in "Paths this step writes". "actions file" and "observations file" have no hit anywhere.
- Hits in the ledger, none made false by the change, since each is a record of an earlier state or names the step itself: `.scratch/2-f-diagnose/plan.md:23`, `:45`, `:78`; `.scratch/2-f-diagnose/orchestrator-state.md:54`; `agents/briefs/1.md:39`, `1-round-1.md:41`, `2.md:96`; `agents/reviews/1-brief-check.md:210`, `:212`, `1-landing.md:8`, `:24`, `1-refuter.md:483`, `:509`, `1-report.md:104`, `:374`, `:384`, `1-round-0.diff:252`, `:262`, `2-brief-check.md:52`, `:169`, `2-landing.md:8`, `2-report.md:9`.
- The heading "The person-driven script": no `##` heading of that name exists (`grep -n '^## ' skills/diagnose/SKILL.md` shows Quick start, Use instead, What it reads, Steps, Ways to build a red command, Stops, Anti-patterns, Rules).
- Places that list every test: `git grep -n -l 'git_guard.test.sh'` prints, outside the ledger, `docs/dev/building.md` and `docs/dev/change-standard.md` (both in the brief's item 5), and the state files of four plans not archived: `.scratch/2-e-grill/orchestrator-state.md`, `.scratch/2-f-diagnose/orchestrator-state.md`, `.scratch/2-g-git-guard/orchestrator-state.md`, `.scratch/2-h-session-retro/orchestrator-state.md`. The brief leaves those verify lists to the orchestrator at landing; all four become incomplete until then.
- Places that list a skill's templates or reference sections: `git grep -n 'templates/diagnosis.md\|diagnose/templates' -- skills docs README.md utils .agents` prints `docs/glossary.md:34`, `skills/repo-setup/templates/plan-terms.md:29`, `skills/diagnose/SKILL.md:56` and `:57`. None lists the templates folder's files, so none becomes incomplete.
- `README.md`: `grep -n '\.sh\|\.py\|templates/' README.md` shows no list of every script or test (the tests named at `README.md:155` are the two of `land`, in prose about `land`). `grep -n -i 'diagnos' README.md` shows the skill table row, Quick start and the figure alt texts; none names a stop or a script of `diagnose`.
- `skills/ordo-help/SKILL.md`: `grep -n 'diagnos'` prints its description, "Use instead" row and sequence lines; none names the stop.
- `docs/figures/gen_figures.py`: `grep -n -i 'diagnos\|person\|red command'` prints only the `/diagnose` box and two sentences on a cause not known; no label names the stop "A red command a person drives", so the rule of `docs/dev/building.md` (its paragraph on the figures) asks for no new run of the script.
- `utils/check_coverage.py`: its only coverage list is `docs/academic-coverage.md` (`git grep -n 'check_coverage.py' -- docs README.md skills utils`), which covers the academic skills, not `skills/diagnose`.
- The glossary: `docs/glossary.md`, "Plan terms", **red command** reads "the one command of a diagnosis that drives the code path of the symptom and goes red on the exact symptom, run and its output quoted before any hypothesis. Stated in: `diagnose`, Steps 4."

Findings:
1. The brief adds two names it requires to be "used every time" (Conventions, last bullet) and a new statement of what red is for a red command a person drives ("What to build" 3, second bullet: "red is the observation that shows the symptom"), while the script itself exits 0 and judges nothing (Decisions 7). `docs/dev/skill-layout.md`, "Writing for an agent", third bullet, has a skill that needs a new term, or a term in a new sense, change `skills/repo-setup/templates/plan-terms.md` first, with `docs/glossary.md` synced. Neither file is in "Paths this step writes", and the glossary's **red command** entry ("goes red", "Stated in: `diagnose`, Steps 4") would no longer name the place that states the sense. The brief should either add both files to the paths with the entry's new text (and entries for "actions file" and "observations file" if they are terms), or say in "Decisions" that the two names are descriptions defined in the section and that the **red command** entry stands, with the reason.
2. "What to build" closes with "The verify list of each open plan's state file is the orchestrator's", without naming them. The brief should name the four files above, so the landing carries the command to each.

## 2. The step line

The step line (`.scratch/2-f-diagnose/plan.md:23`): "2a The person-driven red command's script `skills/diagnose/templates/person-driven.sh` and its test, as the ruling of that name says; `diagnose` points at it; check: the test, each case failing on the unchanged tree, and the changed text read in place (1 commit) (ruling A script for the person-driven red command)".

- "the script `skills/diagnose/templates/person-driven.sh`": "What to build" 1 and "What it must do".
- "and its test": "What to build" 2 and "Cases" C1 to C12.
- "as the ruling of that name says": "What is on the tree", eighth bullet, quotes the ruling word for word (compared with `plan.md:45`); "What it must do" 4, 7 serve "prints each action", "reads the user's line of observation after each", "writes the actions and observations into a file".
- "`diagnose` points at it": "What to build" 3 and 4.
- "check: the test": "Verify before you report" 2.
- "each case failing on the unchanged tree": the paragraph after R4 and "Verify" 7.
- "the changed text read in place": "Verify" 5 and 6, and R1 to R4.
- "(1 commit)": no item; the builder makes no commit under the rules file's "Where the work happens", so none is needed.
- "What to build" 5 (`docs/dev/building.md` and the rules file's command block) serves no part of the step line; it serves the last paragraph of `docs/dev/building.md` and the rules file's rule 5.

Findings:
1. "What it must do" holds behaviour the ruling's sentence does not name: the count `<m>`, blank lines skipped, an empty observation asked again, four refusals, the line count at the end, the closing message. Each is a count or a comparison, so each is inside "a script computes facts", but the ruling says the script "computes only this". Decisions 3, 4, 5 and 7 cover four of them. The brief should add the line count of "What it must do" 8 and the skipping of blank lines to "Decisions", so that nothing beyond the ruling is silent.
2. Decisions 1, 2 and 6 take the command line (a public shape), the format of the observations file (a file format) and the exit statuses. `skills/spec/SKILL.md:115` says "A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken", and `skills/spec/SKILL.md:270` makes it a stop with an open item. `grep -n '2a' .scratch/2-f-diagnose/plan.md .scratch/2-f-diagnose/orchestrator-state.md` shows no ruling and no booking for these choices. The brief should either carry them to the user as an open item, or name the ruling under which the orchestrator takes them (the plan's "Overnight work applies to this plan" asks for such a decision to be booked in the plan's Rulings, and it is not).

## 3. Premises

- `ls skills/diagnose/templates` prints `diagnosis.md`. Matches.
- `wc -l skills/diagnose/SKILL.md` prints 237. Matches.
- `grep -n 'person can trigger' skills/diagnose/SKILL.md` prints line 198, item 11, with the quoted sentence. Matches.
- `grep -n 'A red command a person drives' skills/diagnose/SKILL.md` prints lines 198 and 208; the row at 208 has the three cells the brief quotes. Matches.
- `grep -rn 'A red command a person drives\|person can trigger' skills docs README.md` prints `skills/diagnose/SKILL.md:198` and `:208` only. Matches.
- `docs/dev/building.md`: `sed -n '5p;16p'` prints the two fence lines, and lines 6 to 15 are ten commands. Its last paragraph says what the brief says. Matches.
- The rules file's block: `sed -n '66p;77p' docs/dev/change-standard.md` prints the two fence lines; lines 67 to 76 are ten commands. A `diff` of the two blocks with the comments and the `2>&1 | tail -1` filter removed prints nothing. Matches, and both line ranges under "Paths this step writes" are the fenced blocks.
- `wc -l` over every `*.test.sh`: `checks.test.sh` 77, `land.test.sh` 156, `check_coverage.test.sh` 190, `check_config.test.sh` 354, `sync_rules.test.sh` 422, `git_guard.test.sh` 507, `transcript_window.test.sh` 618, `pin.test.sh` 642. The shortest is 77 lines. `skills/land/templates/checks.test.sh:8` is `set -u`, `:10-13` the `fail` function, `:26-27` the `mktemp -d` and the `trap`, `:28-29` the script found from the test's folder, `:77` `PASS: checks.sh scratch tests`. Matches.
- The ruling, `plan.md:45`: the quoted sentence is there word for word. Matches.
- `ls docs/adr` prints `README.md` and `template.md`. Matches.
- Decisions 6: `skills/land/templates/land.sh:55-84` gives 64 for "a refusal of its arguments or configuration" and 1 for "a failed check or a stop". Matches.
- "Verify" 1 expects `checks: 10 commands passed`: `sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` on main printed nine passing lines and `checks: 10 commands passed`, exit 0.
- "Verify" 6: the `python3 -c` command prints 905.

Findings:
1. "What is on the tree", fifth bullet, says `diagnosis.md`'s "Red command" has "a code block for the one command and a code block for three runs". `grep -n '^## \|^```\|^Runs' skills/diagnose/templates/diagnosis.md` shows three code blocks under "Red command" (the command, the three runs, "Runs after the tightening"), and between the second and the third there is already one placeholder line, for a symptom seen only sometimes, a slow symptom and a defect in text. "What to build" 4 says "after the block of the three runs, one placeholder line", which does not say whether the new text joins that line, goes before it or after it. The brief should name the existing placeholder line and say where the new one goes.

## 4. Cases and checks

Each case and each item of "Verify before you report" was read against the rules file ("Scripts compute facts; judgment is read", rules 13 to 16), `docs/dev/skill-layout.md` and the prose standard. Shell behaviour was probed in a scratch folder; the outputs are quoted in the findings.

Findings:
1. C3 contradicts "What it must do". C3 says an action and an observation are each "written byte for byte in the observations file and on standard output". "What it must do" 4, 7 and 8 print to standard output only the `Action <n> of <m>: <text>` line, the prompt and the closing message; the observation is never printed. With standard input from a file, standard output holds no observation. C3 should say: the action and the observation byte for byte in the observations file, the action byte for byte on standard output.
2. C3's "byte for byte" contradicts "What it must do" 4, "reads one line from standard input with `read -r`". `printf '  lead and trail  \n' | { read -r a; printf '[%s]\n' "$a"; }` prints `[lead and trail]`; with `IFS= read -r` it prints `[  lead and trail  ]`. The brief should say `IFS= read -r` for both the actions file and the observation, or say the spaces at both ends are removed and drop "byte for byte" for them.
3. "What it must do" 2 contradicts itself. Its four refusals happen "before it prints an action or creates a file", and the fourth is "an observations file it cannot create", which a shell can only learn by creating it. The brief does not say when the file is created. If it is created at the refusal checks, an input that ends before the first observation (section 6, item 1) leaves an empty observations file, and the next run with the same command is refused with `exists; name a new file`. The brief should say: the fourth check tests the folder (it exists and is writable), the file is created by the first append, and a failed append prints `person-driven: cannot write the observations file <path>` and exits 1 at once.
4. "What it must do" 8 dictates an error (`<path> holds <c> lines, expected <2m>`, exit 1) that no case reaches. An observation cannot hold a newline, so with standard input from a file the count is always twice `<m>`. Rule 13's fourth bullet calls a test over "a path the suite never executes" an audit, and the brief's own sentence "no case passes with its behaviour taken out" cannot be shown for this branch. The brief should either give the case (the observations file changed from outside between two observations, with standard input from a named pipe) or drop the end count and state how rule 16 is met (each append's exit status checked, as finding 3 says).
5. C2 and the script need a tab, and a literal tab fails the checks. `printf 'a\tb\n' >t.sh; LC_ALL=C grep -c '[^ -~]' t.sh` prints 1, so "Verify" 3 and the ASCII check of the verify list both report a literal tab in `person-driven.sh` or `person-driven.test.sh`. "Conventions" should say: no literal tab in either file; the tab is made with `printf '\t'`.
6. C11 is a test of a behaviour whose failure the brief gives no cost for. The rules file's "Scripts compute facts; judgment is read" allows a test "only for behaviour whose failure costs something: lost work, a broken installation, a wrong configuration accepted". With one argument and no count check, `set -u` stops the script; with three, the third is unused. The brief should name the cost or drop C11. C2 and C9 have a cost that can be named (a person asked to observe after an empty action; an empty file quoted as a run), and the brief should say so beside them.
7. "Verify" 7 and the sentence after C12 ask the report to name, per case, "the one line of the script whose removal or change turns that case red" and the `FAIL:` line "with it, the script restored after each". The rules file's rule 13 says "The report quotes each run verbatim beside the test's name and names no revert", and rule 7 says "No narration of attempts". A mutation of the new script is a revert of part of the change, named in the report. This is for the orchestrator to rule: either the brief says the mutation runs are the proof rule 13's fourth bullet asks for and that the report lists them in rule 13's table (behaviour, case, failing line) with no word on restoring, or it drops them. No page under `skills/` or `docs/` has the word "mutation" (`git grep -n -i 'mutation' -- skills docs README.md` prints nothing), so the brief template gives no form for it.
8. "Verify" 6 says "no sentence over 30 words" and "What to build" 3, fourth bullet, restates the prose standard in its own words. The prose standard, "E. Sentence shapes", says "under roughly 20 words unless the mechanism needs more". The brief should cite the standard's section and give no number of its own.
9. "What to build" 3, second bullet, puts the material in a reference section `## The person-driven script` of `SKILL.md`. `docs/dev/skill-layout.md`, "Writing for an agent", says "Material a step needs only in some runs (a long format, a table of cases, a protocol) goes in a file `references/<name>.md` beside `SKILL.md`, named by its path from the step that reads it" and "A reference section of row 6 of 'Sections, in order' holds only material every run reads". The section is read only in a run whose symptom only a person can trigger. `ls -d skills/*/references` prints `skills/grill/references`, the existing use of that form. The brief should put the text in `skills/diagnose/references/person-driven.md`, named from item 11 and from the Stops row, and add that path to "Paths this step writes"; or state as a decision why a reference section is right here.
10. "Read" 1 says "Steps 4, 'Ways to build a red command' and 'Stops' are the places changed", and "What to build" has no item for Steps 4. Steps 4 of `skills/diagnose/SKILL.md` ends "Done when the command has been run and its output quoted in the record, with the same result on three runs in a row", and Steps 6, 12 and 19 run the red command again. With Decisions 4, each further run needs a new observations file, and the brief says nothing about how many times the person runs the script, how the files are named, or whether three runs are asked of a person. The brief should either add the item for Steps 4 (what "three runs in a row" means for a red command a person drives, and that each run takes a new observations file), or remove Steps 4 from "Read" 1 and put that rule in the new text.
11. "What to build" 4 asks for "one placeholder line" that holds "the observations file quoted whole". A file of several lines quoted whole needs a code block (`docs/dev/skill-layout.md`, "Lists and tables": "A code block holds commands, file formats and printed output"). The brief should say: one placeholder line and a code block under it.
12. "Verify" 5 expects `grep -n 'person-driven' skills/diagnose/SKILL.md` to show the Stops row, but "What to build" 3, third bullet, gives the row's cells as "the actions file and the command for the user to run" and "the user's word that the script has ended, then the observations file read by the skill", which need not hold the string. The brief should say the "What it shows" cell names the place that holds the command (the section or the reference file), or change the check.
13. "Conventions" adds a run under `dash` "in one test case" without saying which case, and C8 and the `dash` run each print a note when skipped. `docs/dev/building.md` says a passing test's last line starts with `PASS:` and the filter keeps the last line. The brief should name the case (C1 fits) and say each note is printed before the last line.

## 5. The question

"Could this pass without the goal being reached?", the goal being a script a person can really drive a red command with, and a `diagnose` skill that really points at it.

- C1: no, when the six lines are compared whole and in order, as the case says.
- C2: no.
- C3: yes. Its text has no space at either end, so the trimming of `read -r` is not exercised, and its claim about the observation on standard output cannot hold (section 4, findings 1 and 2).
- C4: no.
- C5: no.
- C6: no for an empty line. A line of spaces only is not exercised (section 6).
- C7: yes. "What it must do" 2 refuses an observations file that exists "as a file, a folder or a link", and C7 runs the file only. `ln -s "$d/nowhere" "$d/link"; [ -e "$d/link" ]` is false, and `printf 'x\n' >>"$d/link"` then created `nowhere`: a script that tests `-e` alone passes C7 and writes through a link.
- C8: no.
- C9: no.
- C10: no for the missing folder. It shows "nothing read from standard input" only by the absence of an `Action` line, which is enough.
- C11: no.
- C12: no.
- R1 to R4: yes. Each states the unchanged tree, which section 3 confirms, and says nothing of the tree after the change; the text after the change is judged by the reading of "Verify" 6.
- The check on the step's line, "the test, each case failing on the unchanged tree": yes. On the unchanged tree the script is absent, so every case fails whatever it asserts, as the brief says itself. The mutation per case is what closes this, subject to section 4, finding 7.
- The check of "What to build" 1 ("Verify" 2 and 7): yes. Every case feeds standard input from a file. A person at a terminal meets four things no case or sentence covers:
  - A pasted observation of several lines. The first line answers the current action and each further line is taken as the answer to the next actions, before the person has done them. The script reads lines and cannot tell.
  - A long observation. `getconf MAX_CANON /dev/tty` prints 1024 on this machine, the limit of one typed or pasted line at a terminal.
  - A run that ends early (input ended, or Ctrl-C). It leaves an observations file that looks like a complete one with fewer pairs.
  - A path given relative. The person's terminal need not be in the session's folder.
- The check of "What to build" 2 ("Verify" 2 and 7): no, with the mutation per case.
- The check of "What to build" 3 ("Verify" 5 and 6): yes. The grep shows three hits whatever they say. The reading holds the text to the prose standard and the layout, and the brief's list of what the section states lacks what the skill's session needs in order to really point at the script: see findings 1 to 4.
- The check of "What to build" 4: it has no command; "Verify" 6 reads it. No, once section 4, finding 11 is closed.
- The check of "What to build" 5 ("Verify" 4): yes. `grep -c` prints 1 for a line anywhere in the file, with or without the filter. The brief should use `grep -n 'person-driven.test.sh' docs/dev/building.md docs/dev/change-standard.md` and state the line each must follow and the filter on the second.

Findings:
1. The session that runs the skill has no terminal on standard input. `sh -c 'read -r a; echo "status=$?"' </dev/null` prints `status=1`: if the session runs the script itself, it prints action 1 and the prompt and exits 1 with `the input ended after 0 of <m> observations`. "What to build" 3 says "the user runs the command in their own terminal", which states who runs it but not that the session never does, and not what the session shows. The brief should have the text say: the session never runs the script; it shows the whole command, with both paths absolute, for the user to paste into a terminal of their own.
2. The brief does not say where the actions file and the observations file live. Steps 22 of `skills/diagnose/SKILL.md` removes "every throwaway file", and Steps 3 makes `$tmp` by `mktemp -d`. The brief should have the text name the folder (the diagnosis's `$tmp`, or beside the record), and say the observations file is quoted in the record before the cleanup.
3. The Stops row resumes on "the user's word that the script has ended, then the observations file read by the skill". A run that ended early leaves a file with fewer pairs than actions. The brief should have the text say: the skill counts the pairs against the actions file, and a file with fewer pairs is an unfinished run, run again with a new observations file.
4. The brief should have the prompt or the text tell the person that an observation is one line, and where a longer output goes (a file the observation names). The script's prompt `What did you observe? ` says neither.

## 6. Implied inputs

Each form the brief template names, and the forms the script's own use implies:

- A missing or unreadable actions file, or a folder in its place: listed, C8.
- An empty actions file, or blank lines only: listed, C9 and C2.
- A path with a space: listed, C4.
- A text that reaches a command (`%s`, a backslash, `$HOME`, a backquote, `*`): listed, C3.
- An empty observation: listed, C6.
- The observations file already there: listed, C7, for a regular file.
- The same path given for both files: not listed. "What it must do" 2 refuses it as the third refusal, since the actions file exists; C7's behaviour covers it, and no further case is needed.
- An empty string as an argument: not listed. It is refused by the first or the fourth refusal; a wrong answer costs nothing.
- A carriage return at a line's end of the actions file: not listed. The skill writes the file, so it does not arise; not kept.
- An output closed early: not listed. The pairs already appended stay; a wrong answer costs nothing; not kept.

Missing, and kept because a wrong answer costs something:

1. Input that ends before the first observation (standard input from `/dev/null`, the case of a session running the script). Expected: exit 1, `person-driven: the input ended after 0 of <m> observations`, and no observations file left, so the same command can be run again. Cost: the person's run of the command the skill showed is refused.
2. An observations path that is a symbolic link with no target, or a folder. Expected: exit 64, `exists; name a new file`, and the link's target not created. Cost: a write outside the named file (rule 15's last sentence). The probe is quoted under C7 in section 5.
3. An observation of spaces or tabs only. Expected: asked again, as an empty one (Decisions 5 gives the reason: it cannot show red or green). `printf '   \n' | { read -r a; printf 'spaces-only:[%s]\n' "$a"; }` prints `spaces-only:[]`, and under `IFS= read -r` the same line is not empty, so the brief must say which.
4. A last line of input with no newline at its end. `printf 'partial' | { read -r a; printf 'status=%s value=[%s]\n' "$?" "$a"; }` prints `status=1 value=[partial]`, in `sh` and in `dash`. Expected: the line is the observation for that action and is written. Cost: the last thing the person typed is lost. C12 covers this for the actions file only.
5. An append that fails during the run (the folder made unwritable, a full disk). Expected: exit 1 at that append with a `cannot write` line. Cost: the person goes on through every action and learns at the end, or never, that nothing was kept.
6. A signal during the run (Ctrl-C at a prompt). Expected: every pair already read is in the file, and no pair is half written (both lines of a pair appended in one write). Cost: the same as C5's. The brief should state it in "What it must do" 7 even if no case is written for it.
7. A path that starts with a dash. `sh -c 'wc -l "$1"' s -n` prints `wc: illegal option -- n`, while `sh -c 'wc -l <"$1"' s -n` prints 1. Expected: the path is taken as a file name. Cost: low, a false failure of the end count after the person has done every action. The brief can close it with one sentence (each path reaches only a redirection or a `[` test) instead of a case.
8. A relative path for either file. Expected: taken from the folder the script is started in. Cost: the file is written where the skill does not look. Closed by section 5, finding 1 (absolute paths in the command shown), with no case.

Findings:
1. "Cases" lacks items 1 to 5 above, each with the expected result given; the brief should add them as cases. Items 6 to 8 should be stated in "What it must do".

## 7. ADRs

- `ls docs/adr` prints `README.md` and `template.md`. No file of the form `NNNN-*.md` exists.

no record

Findings: none

## 8. Dictated text

Each text the brief gives word for word, read against the prose standard, `docs/dev/skill-layout.md` and the glossary.

- `person-driven: cannot read the actions file <path>`: no breach.
- `person-driven: type what you observed`: no breach.
- `person-driven: the input ended after <k> of <m> observations`: see finding 3.
- `Action <n> of <m>: <text>`, `Action <n>: <text>`, `Observed: <line>`: no breach.
- `PASS: person-driven.sh scratch tests`: the form of `skills/land/templates/checks.test.sh:77`. No breach.
- The heading "The person-driven script": a noun-phrase label, as the layout's row 6 asks. No breach (its place is section 4, finding 9).
- `<path> exists; name a new file`: one semicolon, inside the limit of the prose standard's "B. Punctuation". No breach on that count.

Findings:
1. The usage line `usage: person-driven.sh <actions file> <observations file>` is not the command of Decisions 1, `sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`, and a person who types it as printed gets "command not found". It is also the only message without the `person-driven: ` prefix. `skills/land/templates/checks.sh:28` prints `checks: usage: sh <the land skill folder>/templates/checks.sh <state file>`. The brief should dictate `person-driven: usage: sh <the diagnose skill's folder>/templates/person-driven.sh <actions file> <observations file>`.
2. "Conventions" says the words "actions file" and "observations file" are "the two names, used every time", and three dictated messages name a path without them: `<path> holds no action`, `<path> exists; name a new file`, `cannot write <path>`. A reader of `<path> exists` cannot tell which of the two files is meant. The brief should dictate `the actions file <path> holds no action`, `the observations file <path> exists; name a new file`, `cannot write the observations file <path>`.
3. With one action the messages read `the input ended after 0 of 1 observations` and `wrote 1 actions and observations to <path>`. The second is also ambiguous about what `<m>` counts. The brief should dictate a form that holds for one, for example `wrote <m> of <m> actions, each with its observation, to <path>`, and `the input ended after observation <k> of <m>`.
4. `<path> holds <c> lines, expected <2m>`: `<2m>` is not a placeholder the brief defines. If the message stays (section 4, finding 4), the brief should write "`<e>`, twice `<m>`".
5. C1 says standard output "holds each `Action <n> of 3: <text>` line". The prompt ends with no newline, so with standard input from a file the second and third are not at the start of a line (`What did you observe? Action 2 of 3: ...`), and the closing message follows a prompt on the same line. C1 should say "holds the text `Action <n> of 3: <text>` for each action, in order".
6. The prompt `What did you observe? ` does not say that one line is read (section 5, finding 4). The brief should dictate a prompt that does, for example `What did you observe? (one line) `.
7. "actions file" and "observations file" are in no glossary entry (section 1, finding 1).

## Declined to judge

- Whether the script should be a `references/` file or a reference section, whether the mutation runs may be named in the report, and whether Decisions 1, 2 and 6 go to the user: each is reported as a finding with the rule, and the ruling is the orchestrator's or the user's.
- Whether a typed or pasted line over the terminal's limit is cut, refused or held: `getconf MAX_CANON /dev/tty` printed 1024, and no terminal is attached to this session, so the behaviour at a real terminal was not run.
- The hyphen in `person-driven.sh`, where every other script under `skills/*/templates` and `utils` is one word or uses an underscore (`ls` of those folders): the ruling names the file, so the name is the user's.
- Whether the step should change `metadata.version` of `skills/diagnose/SKILL.md`: `git grep -n -i 'metadata.version\|bump' -- docs README.md skills/*/SKILL.md` shows only the layout's rule on where the version lives, and no rule on when it changes.
- The 120-line limit of "What to build" 1: whether the script with its head comment fits was not tried, since nothing is written in this check.

Agent usage: claude-opus-5-5, 170502 tokens, 19 tool uses, 8.2 minutes ($0.92 to $3.78).

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1.1, glossary: "Decisions" 9 says the two names are descriptions defined in the reference file and that the **red command** entry stands, with the reason.
- 1.2, the state files: "What to build", the paragraph after item 6, names the four state files.
- 2.1, behaviour beyond the ruling's sentence: "Decisions" 2 to 7 name each one; the end count is dropped (4.4).
- 2.2, the user-visible shapes: booked in `plan.md`'s Rulings as "Step 2a, the script's shapes", decided by the orchestrator and named to Axel in the turn's message as his to overrule; "Decisions" 1 points at it.
- 3.1, the record's placeholder: "What is on the tree" names the three code blocks and the existing placeholder line; "What to build" 5 places the new line after it and before "Runs after the tightening".
- 4.1 and 4.2, C3: the observation is compared in the observations file only, the action on standard output too; "What it must do" 4 reads every line with `IFS= read -r`, and C3 holds spaces at both ends.
- 4.3, the fourth refusal: "What it must do" 2 tests the folder; the file is created by the first append ("Decisions" 2); a failed append exits 1 ("What it must do" 7).
- 4.4, the end count: dropped; "Decisions" 6 says how rule 16 is met; C13 exercises the failed append.
- 4.5, the tab: "Conventions" forbids a literal tab and names `printf '\t'`; the premise is under "What is on the tree".
- 4.6, costs: the argument-count case is dropped with the reason; every case names its cost.
- 4.7, mutations: "Cases" says the mutation runs are the proof of rule 13's fourth bullet and gives the table's four columns; nothing is said of restoring. The form rests on Axel's ruling "Recurring findings" of plan 2.H, proposal 5 (one mutation per code case).
- 4.8, the word limit: "What to build" and "Verify" 6 cite the prose standard's "E. Sentence shapes" and give no number.
- 4.9, the place of the text: `skills/diagnose/references/person-driven.md` ("What to build" 3, "Paths this step writes", "Decisions" 8).
- 4.10, Steps 4: "Read" 1 names two places; the reference file says each run the steps ask for is one run of the script with a new observations file ("Decisions" 10).
- 4.11, the code block: "What to build" 5 asks for the placeholder line and a code block under it.
- 4.12, the grep: "Verify" 5 expects two lines, each naming `references/person-driven.md`.
- 4.13, `dash` and the notes: C1 runs under `dash`; "Conventions" puts each note before the last line.
- 5, C7's link: C9 runs a regular file, a folder and a link with no target; "What it must do" 2 tests `-e` or `-L`.
- 5, the check of item 5 of the first brief: "Verify" 4 is a `grep -n -A1` that shows the place and the filter.
- 5.1 to 5.4, a person at a terminal: "What to build" 3 states that the session never runs the script, the command with absolute paths, where the files live, the count of `Observed:` lines, the unfinished run, and the one-line rule; the prompt says `(one line)`.
- 6.1, the missing cases: C6 (input ended before the first observation), C9 (link and folder), C7 (spaces only), C8 (no newline at the end of the input), C13 (a failed append); items 6 to 8 are in "What it must do" 7 and 9 and "Decisions" 2.
- 8.1 to 8.6, the dictated text: the usage line carries the prefix and the whole command; each message names its file; the two count messages hold for one; `<2m>` is gone with the end count; C1 says "holds the text"; the prompt says one line.
- 8.7: closed with 1.1.
