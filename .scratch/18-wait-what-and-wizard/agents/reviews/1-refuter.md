# Refuter report: step 1

Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/18-wait-what-and-wizard-1`, base `12aa826`. Nothing in the worktree was written, edited or deleted. The fetched sources were held in a `mktemp -d` folder that is deleted (`ls` on it printed `No such file or directory`).

## Verification (the lines each check printed, verbatim)

1. The character-set check of "Verify before you report" 1, over the ten files: printed nothing, `exit=0`.
2. `bash -n skills/code/wizard/templates/template.sh`: printed nothing, `exit=0`.
3. `diff <fetched template.sh> skills/code/wizard/templates/template.sh` (exit 1), whole, non-ASCII written by name:

```
5a6,8
> # The wizard library is from the repository mattpocock/skills, Copyright (c) 2026 Matt Pocock.
> # It is used under the MIT License, whose text stands in template.LICENSE beside the template in the wizard skill.
> #
11c14
< # <box-drawing x74>
---
> # --------------------------------------------------------------------------
13c16
< # <box-drawing x74>
---
> # --------------------------------------------------------------------------
55c58
<   printf '\n%s%s<small right triangle> Stage %s/%s <middle dot> %s%s\n' \
---
>   printf '\n%s%s> Stage %s/%s: %s%s\n' \
62c65
< step() { printf '  %s<bullet>%s %s\n' "$BLUE" "$RESET" "$1"; }
---
> step() { printf '  %s-%s %s\n' "$BLUE" "$RESET" "$1"; }
64c67
< warn() { printf '  %s<warning sign> %s%s\n' "$YELLOW" "$1" "$RESET"; }
---
> warn() { printf '  %s! %s%s\n' "$YELLOW" "$1" "$RESET"; }
69c72
<   printf '  %s<north-east arrow> opening%s %s\n' "$GREEN" "$RESET" "$url"
---
>   printf '  %s> opening%s %s\n' "$GREEN" "$RESET" "$url"
150c153
<   printf '  %s<check mark> wrote%s %s <right arrow> %s\n' "$GREEN" "$RESET" "$key" "$ENV_FILE"
---
>   printf '  %sok wrote%s %s to %s\n' "$GREEN" "$RESET" "$key" "$ENV_FILE"
160c163
<       printf '  %s<check mark> set%s GitHub secret %s\n' "$GREEN" "$RESET" "$name"
---
>       printf '  %sok set%s GitHub secret %s\n' "$GREEN" "$RESET" "$name"
173c176
<       printf '  %s<check mark> set%s GitHub variable %s\n' "$GREEN" "$RESET" "$name"
---
>       printf '  %sok set%s GitHub variable %s\n' "$GREEN" "$RESET" "$name"
184c187
<   printf '\n%s%s  <check mark> Setup complete%s\n' "$BOLD" "$GREEN" "$RESET"
---
>   printf '\n%s%s  ok Setup complete%s\n' "$BOLD" "$GREEN" "$RESET"
194c197
< # <box-drawing x74>
---
> # --------------------------------------------------------------------------
199c202
< # <box-drawing x74>
---
> # --------------------------------------------------------------------------
207c210
< # <box-drawing x2> Example stage: replace with your real steps <box-drawing x27>
---
> # -- Example stage: replace with your real steps ---------------------------
218c221
< # <box-drawing x74>
---
> # --------------------------------------------------------------------------
```

   `cmp <fetched LICENSE> skills/code/wizard/templates/template.LICENSE`: printed nothing, exit 0.
4. The description-length command printed 21 lines, among them `803 skills/code/wizard/SKILL.md` and `208 skills/ordo/wait-what/SKILL.md` (largest of all: `1023 skills/academic/referee/SKILL.md`). The frontmatter command printed `wait-what True 1.0.0`. The figure command was not run in its form, since it writes into the worktree: `gen_figures.py` was copied to the temporary folder and run there (`gen rc=0`, 22 `.svg` files), each of the 22 compared with `cmp -s` against the worktree's file of the same path, no `DIFFERS` line printed. `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg` and no other line.
5. `git status --short` lists no test file: ` M README.md`, ` M docs/adr/0045-...md`, ` M docs/dev/scripts.md`, ` M docs/dev/skill-layout.md`, ` M docs/figures/gen_figures.py`, ` M docs/figures/pipeline.svg`, `?? .scratch/18-wait-what-and-wizard/agents/reviews/1-report.md`, `?? skills/code/wizard/`, `?? skills/ordo/wait-what/`.
6. Read; results are in the findings.

Also run: `LC_ALL=C grep -n '[^ -~]'` over the template and the two `SKILL.md` files printed nothing (exit 1). `stat -f '%Sp %N'` printed `-rw-r--r--` for `template.sh` and `template.LICENSE`. `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. `grep -c` of a tab and of a carriage return in the template printed `0` and `0`; the file ends `run_wizard "$@"; exit\n`. `find skills -name openai.yaml` printed nothing. The source's mode: the GitHub tree API for the commit printed `"path": "skills/engineering/wizard/template.sh", "mode": "100644"`. The fetched source has 223 lines and non-ASCII on lines 11 13 55 62 64 69 150 160 173 184 194 199 207 218.

## Verdicts

### Items

- 1.1 holds. Frontmatter parses to `wait-what True 1.0.0`; the description says the message did not land and is re-pitched; `Triggers on: /wait-what, wait what`.
- 1.2 holds. Nine sections in the layout's order, 52 lines.
- 1.3 holds. `skills/ordo/wait-what/SKILL.md:33` holds the brief's text word for word, presented as what the user says by typing the skill. No other line tells the session how to explain.
- 1.4 holds. Lines 27 to 29; the `plan` skill's "What it reads" 1 does state how the glossary is found (its lines 46 to 49).
- 1.5 holds. Lines 40 and 50 to 52.
- 2.1 holds. No `disable-model-invocation`; the description has the three parts; 803 characters.
- 2.2 holds, with Spec 2 (the path added to the stage list) and Standards 3. Each requirement of the source's four process steps and "Done when" lines was found: scope (What it reads 2 and 3, Steps 1 and 2), map (Steps 3, Anti-patterns row 2), author (Steps 4 and 5, Rules line 95), verify and hand off (Steps 6 and 7).
- 2.3 holds. Rules lines 99 to 101.
- 2.4 holds. Two Stops rows (lines 80, 81); Rules lines 94 to 98.
- 2.5 holds. Line 74.
- 2.6 holds. `grep -n -i -w` for bar, step, stop and the other glossary terms: "step" appears only as "Steps <n>" and as the helper `step` in code, "stop" only in the Stops tables and `("Stops")`, "bar" nowhere.
- 3.1 holds. The diff above; mode `-rw-r--r--`; shebang, last line and final newline kept.
- 3.2 holds. Fourteen changed lines, each with the replacement 3.2 gives; ruled lines keep their width.
- 3.3 holds. No `%` or backslash added in any changed `printf` line.
- 3.4 holds. The diff shows only the fourteen lines and the three added lines.
- 3.5 holds. `cmp` exit 0; template lines 5 to 8; `SKILL.md:73`; ADR 0045 line 16.
- 4.1 holds. `docs/dev/skill-layout.md:22`, one bullet with the brief's meaning; the block is unchanged.
- 4.2 holds. The diff of that file is one added line.
- 5.1 violated in one sentence: Standards 1. Places and the "only you invoke it" sentence are as asked (rows at README lines 26 and 29).
- 5.2 holds. README line 35.
- 5.3 holds. README lines 159 and 170.
- 5.4 holds. `docs/dev/scripts.md:18`.
- 5.5 holds as dictated, with Standards 2 on the sentence the brief kept in its form.
- 5.6 holds for the count grep (plain `grep -rn -i 'nineteen\|twenty\|19 skills\|21 skills' skills utils docs README.md` printed four hits: README 35 and 170 changed, ADR 0016 line 7 and `calibration_counts.test.sh:68` no count of skills). The `git grep` form and the full `session-retro` hit list are under "Declined to judge".
- 6 holds. No test, no `openai.yaml`, no figure of its own, no glossary change (`find`, `git status --short`, the sync check).

### Cases

- `bash -n`: met.
- The `LC_ALL=C grep`: met.
- The diff of 3.4: met. No function differs from the source outside the characters a `printf` format prints.
- Description lengths: met (803 and 208).
- Frontmatter command: met.
- Read, `wait-what` against the source: met.
- Read, `wizard` against the source: met for the requirements, description, 2.3 and 2.4; additions are Spec 2.
- Read, against ADR 0045: partial. Spec 1.
- Read, nothing private named: met. The template and both skills name mattpocock/skills, "Matt Pocock" as the public LICENSE gives it, and Stripe's public dashboard URL; no path outside the repository.
- Figure command: met by the copy run stated under Verification 4; not run in the brief's form.

## Spec

1. `docs/adr/0045-...md`, Decision: "They differ from the sources only where this repository forces it:" followed by six items. `skills/code/wizard/SKILL.md` differs from the source in two things the list does not hold: the GitHub variable as a destination in scoping (line 38, "`.env`, a GitHub secret, a GitHub variable, several of these, or nowhere"; the source's "Done when" reads "`.env`, a GitHub secret, both, or nowhere") and the three secret rules (lines 96 to 98), which the source `SKILL.md` does not state. The brief asked for both (2.2 with ruling D2, and 2.4). Failure scenario: a later reader checks `wizard` against ADR 0045, as the record's Consequences tell them to, finds rules the source lacks and the list does not allow, and either removes them or needs a superseding record for text the plan's goal requires.
2. `skills/code/wizard/SKILL.md:41` "and the path the script goes to", line 47 "the path the user confirmed", line 80 "and the script's path". No brief item and no source sentence puts the script's path into the confirmation of the stage list; the report lists it as judgment call 6. The brief's 2.2 gives the confirmation as "the ordered list of stages and the values each produces". Failure scenario: a user reviewing the copy against the source at the gate finds a confirmation content the source does not have and the ADR's list does not cover.

## Proof

none. Each command of the report that was run reproduced: the counts 803 and 208, `wait-what True 1.0.0`, the `wc -l` counts (52, 101, 226, 21, 100, 50, 257, 2310, 123, 29), the line numbers (README 26, 29, 35, 159, 170; scripts.md 18; skill-layout 22; gen_figures 2252; pipeline.svg 110), the README table at 21 rows against 19 at the base, `ls CLAUDE.md` printing `No such file or directory` in the worktree, and the sync check. The report's one unverified premise, the source's mode, is 100644 by the tree API.

## Standards

1. `README.md:29`, the `wizard` row: "and fills a fixed template with one stage per action." The skill says otherwise: `skills/code/wizard/SKILL.md:36` "Order the actions into stages" and line 57 "Keep a stage to one focused task", and the template's example stage holds one URL opened, two actions and two values. The same row names "opening a dashboard, copying a key and pasting it" as actions. Change standard rule 19 (no two statements that contradict). Failure scenario: a reader of the README expects a script that clears the screen after every click, or reports the skill as wrong when one stage holds several actions.
2. `docs/figures/gen_figures.py:2251` to 2253 and `docs/figures/pipeline.svg:110`: "/session-retro, /wait-what, /wizard and /ordo-help, which has no stop." `skills/ordo/wait-what/SKILL.md:40` reads "No stop | The skill never stops". The clause singles out `/ordo-help` as the one without a stop in a list that now holds a second skill without one. The brief's 5.5 dictated "the sentence kept in its form", so the wording is the orchestrator's to change. Failure scenario: a reader of the figure concludes `/wait-what` has a stop where the user is asked something.
3. `skills/code/wizard/SKILL.md:41` against line 80. Steps 2 says to show "the ordered list of stages, the values each produces and the path"; the Stops row says the stop shows "the values each produces with where each is written and whether it is secret". `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once." Failure scenario: a session following Steps 2 shows the values without their destinations and secret flags, and the user confirms a list that hides a secret headed for a GitHub variable.
4. `skills/code/wizard/templates/template.sh:1` to 10, the head comment, against change standard rule 14: "A script's head comment or docstring lists every input it reads, every error it prints and every exit status it returns." The head comment lists none of them (`ENV_FILE` is read from the environment at line 29). The brief's 3.1 and ADR 0045 require the source's comment unchanged, so this is a clash between rule 14 and the brief, not a builder's miss. Failure scenario: a later review holds the listed script to rule 14 and edits the library's head, against the ADR.

## Behaviour

none. The report states the two new invocations, the README, the layout bullet, the scripts row, the figure note with before and after, and the template's printed lines against the source.

## Declined to judge

- The report's `git diff --numstat` lines: not run, a git command outside the three allowed. `git diff 12aa826 --stat` printed README 8 lines changed, the ADR 1, scripts.md 1, skill-layout 1, gen_figures 4, pipeline.svg 4, which agrees with them.
- The two `git grep` commands of 5.6 and `git ls-files | grep -i claude`: not run. The count grep was run as plain `grep -rn` (above). The `session-retro` hit list was not reread hit by hit; `git grep -n 'session-retro' -- skills utils docs README.md ':!skills/ordo/session-retro'` would settle it. Of its hits, README lines 35, 61, 69, 75, 159, `ordo-help` lines 30 and 141 and scripts.md line 31 were read and need no change; README line 7, the glossary and `plan-terms.md` entries, `docs/roadmap.md:74` and the Use instead rows of the three orchestration skills were not read.
- Whether two comment lines in a generated script, pointing at a `template.LICENSE` that stays in the skill's folder and is not copied beside the script, meet the MIT License's condition that the permission notice go with copies: a legal judgment, the user's.
- Whether a re-explanation by `wait-what` is clear and whether a `wizard` script works: step 2's gate.
- That the builder's own fetch folder is deleted: its path is not in the report.
- The report's first run on the unchanged tree: the runs are quoted there; they were not rerun, since the unchanged tree is not checked out.
- `shellcheck` on the template: not a check of the brief, not run.

Usage: acb5ec6652074faf9, claude-fable-5-2, 158072 tokens, 15 tool uses, 4.0 minutes

## Repair round 1, refuted

### Verification (the lines each check printed, verbatim)

1. Character-set check of the brief's "Verify before you report" 1, with `template.LICENSE` left out of the file list (nine files): printed nothing; `charset exit=0`.
2. `bash -n skills/code/wizard/templates/template.sh`: printed nothing; `bash -n exit=0`.
3. `diff <fetched template.sh at abeeaf95> skills/code/wizard/templates/template.sh` (exit 1). Added lines `5a6,40` are the 35 head-comment lines (template lines 6 to 40). The other differences are exactly the fourteen lines of 3.2, each as 3.2 gives it:
   - lines 11, 13, 194, 199, 218: box-drawing line becomes 74 `-`; line 207 becomes `# -- Example stage: replace with your real steps ---------------------------`
   - 55: `printf '\n%s%s> Stage %s/%s: %s%s\n' \`
   - 62: `step() { printf '  %s-%s %s\n' "$BLUE" "$RESET" "$1"; }`
   - 64: `warn() { printf '  %s! %s%s\n' "$YELLOW" "$1" "$RESET"; }`
   - 69: `printf '  %s> opening%s %s\n' "$GREEN" "$RESET" "$url"`
   - 150: `printf '  %sok wrote%s %s to %s\n' ...`
   - 160 and 173: `ok set`
   - 184: `ok  Setup complete` as `  ok Setup complete`
   
   No `%` or backslash was added in a changed `printf`.
4. License text: template lines 8 to 28, with the `# ` prefix stripped (`#` alone for an empty line), against the fetched `LICENSE`: `diff` printed nothing, `lic diff exit 0`; both have 21 lines; no trailing whitespace in either (`grep -c '[[:space:]]$'` printed 0 and 0).
5. `python3 -c` description lengths, the two new lines: `803 skills/code/wizard/SKILL.md` and `208 skills/ordo/wait-what/SKILL.md`. Frontmatter command: `wait-what True 1.0.0`.
6. `LC_ALL=C grep -n '[^ -~]'` over the template and both `SKILL.md`: printed nothing, `grep exit=1`. `stat -f '%Sp %N'`: `-rw-r--r-- skills/code/wizard/templates/template.sh`. A tab count in the template: `0`. `find skills -name openai.yaml`: printed nothing. `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`: `ok: the plan-terms block equals the template`.
7. Figure: `gen_figures.py` copied to a `mktemp -d` folder outside the worktree and run there (`python3 -I gen_figures.py`, `gen rc=0`, 22 `wrote` lines). `cmp` of its `pipeline.svg` with the worktree's: no output, `cmp pipeline exit=0`. The 8 top-level svg files all compared equal (`same=8`, no `DIFFERS` line). `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg`. The temp folder is deleted (`ls` on it: `No such file or directory`).
8. `ls skills/code/wizard/templates` printed `template.sh`. `grep -rn 'template.LICENSE' skills docs README.md` printed nothing (exit 1).
9. The report's Repair round 1 commands, rerun: `grep -n 'one focused task per stage' README.md` printed line 29; `grep -n "path the user confirmed\|script.s path" skills/code/wizard/SKILL.md` printed only line 67 (`   - Done when the message names the script's path and the command that runs it.`); `sed -n '16,19p'` of ADR 0045 printed the four items the report quotes; the license and head-comment checks are items 3 and 4 above.
10. Plain `grep -rn -i 'nineteen\|twenty\|19 skills' skills utils docs README.md` printed four hits (`calibration_counts.test.sh:68`, ADR 0016 line 7, `README.md:35`, `README.md:170`); the first two are not counts of skills, the last two read "twenty-one". Plain `grep -rn 'session-retro'` hits (outside `session-retro/`, glossary and `plan-terms.md`) are unchanged lists of Use instead rows, the figure, `scripts.md:31`, `roadmap.md:74` and README lines 7, 25, 35, 61, 69, 159.

### The rulings

1. Carried out as ruled: ADR 0045 lines 16 to 19 hold the license item, the head-comment item, the GitHub variable item and the three-secret-rules item.
2. Carried out as ruled: `skills/code/wizard/SKILL.md:41` and the Stops row no longer name the script's path; line 47 reads "Copy `templates/template.sh` to the target path, which Rules gives." and Rules lines 99 to 101 give the path.
3. Carried out as ruled: README line 29, "fills a fixed template with the stages, one focused task per stage."
4. Carried out as ruled: `gen_figures.py` and `pipeline.svg` line 110 read "/session-retro, /wizard, and /wait-what and /ordo-help, which have no stop."; only `pipeline.svg` changed among figures (checked above).
5. Carried out as ruled: the Stops row (line 80) states "The ordered stages, the values each produces, where each is written and whether it is secret"; Steps 2 (line 41) points to the row and lists nothing.
6. Carried out as ruled for the removal of `template.LICENSE`, the whole license text as comment lines (compared word for word), the origin line, the `SKILL.md` sentence (line 73) and the two ADR items. The inputs, warnings and exit-status block is carried out but is inexact in places: see Standards 1.

No finding was closed by removing a check, no fix reaches beyond its ruling (the snapshot-to-now diff touches only README line 29, ADR list, `SKILL.md` lines 41, 47, 73, 80, the template head comment, the figure note and `pipeline.svg` line 110, and deletes `template.LICENSE`), and every claim of closure reproduced.

### Verdicts

#### Items
- 1.1 holds. 1.2 holds. 1.3 holds (`wait-what/SKILL.md:33`, unchanged by the round). 1.4 holds. 1.5 holds.
- 2.1 holds. 2.2 holds (the path is out of Steps 2 and the Stops row; Steps 4 cites Rules). 2.3 holds (Rules 99 to 101). 2.4 holds (Stops rows lines 80 and 81; Rules 94 to 98). 2.5 holds (line 74). 2.6 holds (`step` only as "Steps <n>", `stop` only in Stops tables, `bar` absent).
- 3.1 holds. 3.2 holds. 3.3 holds. 3.4 holds with the 35 added lines of ruling 6. 3.5 as ruling 6 replaces it: holds for the removal, the license text, the origin line and the `SKILL.md` and ADR sentences; the inputs/warnings/exit block is under Standards 1.
- 4.1 holds (`skill-layout.md:22`). 4.2 holds.
- 5.1 holds (README lines 26 and 29, order as asked, "one focused task per stage"). 5.2 holds (line 35). 5.3 holds (lines 159 and 170). 5.4 holds (`scripts.md:18`). 5.5 holds as ruled in ruling 4. 5.6 holds by the plain greps of item 10; the two `git grep` forms are under "Declined to judge".
- Section 6 holds (no test, no `openai.yaml`, no own figure, no glossary change; sync check ok).

#### Cases
- `bash -n`: met. `LC_ALL=C grep`: met. Diff of 3.4: met (fourteen lines plus the 35 added lines of ruling 6; no function differs except in printed characters). Description lengths: met (803, 208). Frontmatter command: met (`wait-what True 1.0.0`). Figure command: met by the copy run (top-level svg files and `pipeline.svg` equal; `docs/figures/paper/*.svg` not compared, see below).
- Read, `wait-what` against the source: met (file unchanged by the round).
- Read, `wizard` against the source: not verifiable this round (the wizard `SKILL.md` source was not among the sources to fetch); requirements, stops and rules read against the brief's 2.2 to 2.4: met.
- Read, against ADR 0045: met. Each difference I found between `wizard`'s text and the brief (GitHub variable, three secret rules, license, head-comment block) is on the list.
- Read, nothing private named: met. `grep -n -i '/Users\|axel\|\.scratch\|~/\|/tmp'` over the two skills and the template printed nothing; the template names mattpocock/skills and "Matt Pocock" as the public `LICENSE` prints them, and Stripe's public URL.

### Spec
none.

### Proof
none. Each command the "Repair round 1" section quotes reproduced.

### Standards
1. `skills/code/wizard/templates/template.sh:30` to `39`, the head comment's block, against change standard rule 14 ("lists every input it reads, every error it prints and every exit status it returns") and the brief's ruling 6 ("state these exactly; state nothing the code does not do"):
   - Line 33: "the person's answers, read from the terminal." The code reads standard input (`read -r _` in `pause` and `confirm`, `read -e -r -p` in `ask`, `read -rs` in `ask_secret`), not the terminal. Scenario: a person runs `printf 'x\n' | ./setup.sh` or redirects a file; the comment says terminal and the script reads the pipe.
   - Lines 30 to 33 omit inputs the library reads: `TERM` through `tput` and whether standard output is a terminal (`[[ -t 1 ]]` at line 50 decides colours and `_clear`), the current directory (a relative `ENV_FILE` and the repository `gh secret set` and `gh variable set` write to), and `gh`'s sign-in state (`gh auth status`, lines 192 and 206). Scenario: a person runs the script from a folder that is not the target repository, and the comment never says the GitHub secret goes to the repository of that folder.
   - Line 39 omits the status when the person stops the script with Ctrl-C, which `banner` (line 80) invites: the script ends on the signal and the shell reports 130, not 0 and not "the status of the first command that fails". Scenario: a caller testing the status after an interrupted run finds a value the comment does not state.

### Behaviour
none. The warning strings, their conditions and the success status 0 (`finish` ends on `printf '\n'`, `run_wizard "$@"; exit` returns that status) match the code; line 6 and lines 8 to 28 are the public origin and license.

### Declined to judge
- The report's `git diff --numstat` lines and the two `git grep` forms of 5.6: not run (git commands outside the three allowed); the plain `grep -rn` equivalents were run (item 10 above).
- `docs/figures/paper/*.svg` (14 files the generator also writes): not compared with the worktree's.
- `wizard/SKILL.md` against its source `SKILL.md`: not fetched or compared this round.
- Whether the MIT License's condition is met for a script copied out of the skill: a legal judgment; the text of the license now stands in the script's head comment, so the copy carries it.
- Whether a generated script works, and whether the output of `/wait-what` is clear: the step's gate.
- `shellcheck` on the template: not a check of the brief, not run.

Usage: a0d93dacde474d366, claude-sonnet-5-5 with one recorded call on claude-opus-5-5, 131492 tokens, 16 tool uses, 2.4 minutes

## Closed

- First run, Spec 1 and 2 and Standards 1 to 4: closed in repair round 1, each as the round's brief `agents/briefs/1-round-1.md` rules it; the run over the round found each ruling carried out.
- Round 1, Standards 1 (the head comment's block of inputs and exit status is inexact): fixed at landing. The block says the answers are read from standard input, names the further inputs (whether standard output is a terminal and `TERM`, the current folder, the sign-in state of `gh`), and gives the status after Ctrl-C.
