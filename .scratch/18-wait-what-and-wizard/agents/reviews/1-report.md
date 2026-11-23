Everything in the brief is done.

## Open items of the state file

- none

## The cases' first run, on the unchanged tree

1. `bash -n skills/code/wizard/templates/template.sh`: printed `bash: skills/code/wizard/templates/template.sh: No such file or directory`, exit 127. The file did not exist yet.
2. `LC_ALL=C grep -n '[^ -~]' skills/code/wizard/templates/template.sh skills/ordo/wait-what/SKILL.md skills/code/wizard/SKILL.md`: printed one `No such file or directory` warning for each of the three files, exit 2. The files did not exist yet.
3. The diff of 3.4: read. The template did not exist yet. The fetched source had 223 lines, and `LC_ALL=C grep -n '[^ -~]'` on it gave lines 11, 13, 55, 62, 64, 69, 150, 160, 173, 184, 194, 199, 207 and 218, with no tab and no carriage return (`grep -c` of each printed 0).
4. The description-length command: printed 19 lines, one per existing skill, the largest `1023 skills/academic/referee/SKILL.md`, and no line for the two new skills, which did not exist yet.
5. The frontmatter command of `wait-what`: `FileNotFoundError: [Errno 2] No such file or directory: 'skills/ordo/wait-what/SKILL.md'`.
6. Read, the instruction of `wait-what` against the source: the file did not exist yet.
7. Read, `wizard` against the source: the file did not exist yet.
8. Read, against ADR 0045: neither skill existed yet.
9. Read, nothing private named: no file existed yet.
10. `python3 docs/figures/gen_figures.py && git status --short docs/figures`: the script wrote its 22 figures and `git status --short docs/figures` printed nothing, exit 0. The generator reproduces the committed figures on the unchanged tree.

No case showed a rule of the brief giving a wrong result.

## DONE / NOT DONE

| Item | State | Check and output |
|---|---|---|
| 1 `skills/ordo/wait-what/SKILL.md` | DONE | `python3 -c 'import yaml; d=yaml.safe_load(open("skills/ordo/wait-what/SKILL.md").read().split("---")[1]); print(d["name"], d["disable-model-invocation"], d["metadata"]["version"])'` printed `wait-what True 1.0.0`. Read against the fetched source: Steps 1 holds the brief's text of 1.3 word for word, and no other line of the file tells the session how to explain |
| 2 `skills/code/wizard/SKILL.md` | DONE | Read against the fetched source: the four process steps stand in order as Steps 1 and 2 (scope), 3 (map), 4 and 5 (author), 6 and 7 (verify and hand off), each with its "Done when" line. The description holds the three parts of 2.1. Stops holds the two rows of 2.4, Rules the rules of 2.3 and 2.4, "The template" the sentence of 2.5 and the license sentence of ruling 6 |
| 3 `templates/template.sh` | DONE | `bash -n skills/code/wizard/templates/template.sh` printed nothing, exit 0. `stat -f '%Sp %N'` printed `-rw-r--r-- skills/code/wizard/templates/template.sh`. `ls skills/code/wizard/templates` printed `template.sh` alone: the license text stands in the head comment, as ruling 6 of repair round 1 says in place of 3.5. `sed -n '8,28p' skills/code/wizard/templates/template.sh \| sed 's/^# \{0,1\}//' \| diff - <fetched LICENSE>` printed nothing. The diff is quoted whole below |
| 4 `docs/dev/skill-layout.md` | DONE | `git diff --numstat` gives `1 0 docs/dev/skill-layout.md`: one bullet added at line 22, above "The version lives in `metadata.version` only", no other line changed |
| 5.1 to 5.3 `README.md` | DONE | `git diff --numstat` gives `5 3 README.md`: two table rows added (lines 26 and 29), lines 35, 159 and 170 changed |
| 5.4 `docs/dev/scripts.md` | DONE | `1 0 docs/dev/scripts.md`: one row under "User scripts", line 18 |
| 5.5 the figure note | DONE | `python3 docs/figures/gen_figures.py && git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg` and no other line, exit 0 |
| 5.6 the two greps | DONE | Quoted below with each hit's ruling |
| 3.5 ADR 0045, as rulings 1 and 6 of repair round 1 change it | DONE | `sed -n '16,19p'` of the record printed the four items quoted under "Repair round 1" |
| 6 nothing else built | DONE | `git status --short` lists the six changed files below and the two new skill folders, no test, no `openai.yaml`, no figure of its own, no glossary entry |

Verify before you report:

1. The character-set check over the nine files, the brief's command without `template.LICENSE`: printed nothing, exit 0.
2. `bash -n skills/code/wizard/templates/template.sh`: printed nothing, exit 0.
3. The diff of 3.4, `diff <the fetched source> skills/code/wizard/templates/template.sh`, whole (63 lines start with `<` or `>`: 14 pairs and 35 added lines):

```
5a6,40
> # The wizard library is from the repository mattpocock/skills.
> #
> # MIT License
> #
> # Copyright (c) 2026 Matt Pocock
> #
> # Permission is hereby granted, free of charge, to any person obtaining a copy
> # of this software and associated documentation files (the "Software"), to deal
> # in the Software without restriction, including without limitation the rights
> # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> # copies of the Software, and to permit persons to whom the Software is
> # furnished to do so, subject to the following conditions:
> #
> # The above copyright notice and this permission notice shall be included in all
> # copies or substantial portions of the Software.
> #
> # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> # SOFTWARE.
> #
> # Inputs:
> #   - the environment variable ENV_FILE, the file the values are written to (default .env);
> #   - the lines of that file, read for the values already saved;
> #   - the person's answers, read from the terminal.
> # Warnings, each printed when the script cannot do something:
> #   - "couldn't open a browser, so visit it manually: <url>", when no command opens the URL;
> #   - "skipped GitHub secret <name>: gh not ready; set it later", when gh is missing, is not signed in or does not set the secret;
> #   - "skipped GitHub variable <name>, gh not ready; set it later", when gh is missing, is not signed in or does not set the variable;
> #   - "still to do by hand:" in the closing summary, with each skipped secret and variable.
> # Exit status: 0 when the last stage and the closing summary have run; otherwise the status of the first command that fails, as set -e gives it, such as 1 when the input ends before an answer.
> #
11c46
< # <box drawings light horizontal x74>
---
> # --------------------------------------------------------------------------
13c48
< # <box drawings light horizontal x74>
---
> # --------------------------------------------------------------------------
55c90
<   printf '\n%s%s<black right-pointing small triangle> Stage %s/%s <middle dot> %s%s\n' \
---
>   printf '\n%s%s> Stage %s/%s: %s%s\n' \
62c97
< step() { printf '  %s<bullet>%s %s\n' "$BLUE" "$RESET" "$1"; }
---
> step() { printf '  %s-%s %s\n' "$BLUE" "$RESET" "$1"; }
64c99
< warn() { printf '  %s<warning sign> %s%s\n' "$YELLOW" "$1" "$RESET"; }
---
> warn() { printf '  %s! %s%s\n' "$YELLOW" "$1" "$RESET"; }
69c104
<   printf '  %s<north east arrow> opening%s %s\n' "$GREEN" "$RESET" "$url"
---
>   printf '  %s> opening%s %s\n' "$GREEN" "$RESET" "$url"
150c185
<   printf '  %s<check mark> wrote%s %s <rightwards arrow> %s\n' "$GREEN" "$RESET" "$key" "$ENV_FILE"
---
>   printf '  %sok wrote%s %s to %s\n' "$GREEN" "$RESET" "$key" "$ENV_FILE"
160c195
<       printf '  %s<check mark> set%s GitHub secret %s\n' "$GREEN" "$RESET" "$name"
---
>       printf '  %sok set%s GitHub secret %s\n' "$GREEN" "$RESET" "$name"
173c208
<       printf '  %s<check mark> set%s GitHub variable %s\n' "$GREEN" "$RESET" "$name"
---
>       printf '  %sok set%s GitHub variable %s\n' "$GREEN" "$RESET" "$name"
184c219
<   printf '\n%s%s  <check mark> Setup complete%s\n' "$BOLD" "$GREEN" "$RESET"
---
>   printf '\n%s%s  ok Setup complete%s\n' "$BOLD" "$GREEN" "$RESET"
194c229
< # <box drawings light horizontal x74>
---
> # --------------------------------------------------------------------------
199c234
< # <box drawings light horizontal x74>
---
> # --------------------------------------------------------------------------
207c242
< # <box drawings light horizontal x2> Example stage: replace with your real steps <box drawings light horizontal x27>
---
> # -- Example stage: replace with your real steps ---------------------------
218c253
< # <box drawings light horizontal x74>
---
> # --------------------------------------------------------------------------
```

   The 35 added lines stand after the source's line 4, "# Generated by the /wizard skill."; `diff` reports them after line 5 since the source's lines 3 and 5 are both `#`.
4. The description lengths, the lines of the two new skills: `803 skills/code/wizard/SKILL.md` and `208 skills/ordo/wait-what/SKILL.md`. The frontmatter command: `wait-what True 1.0.0`. The figure command: ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg`.
5. No test is new or changed: `git status --short` lists no test file.
6. Each new list item and sentence was read against the layout's rules on list items and the prose standard's sentence length. Departures:
   - `skills/ordo/wait-what/SKILL.md`, Steps 1: 45 words, since it quotes the instruction of 1.3 whole.
   - `skills/code/wizard/SKILL.md`, `description`: sentences above 20 words, since the layout asks for one paragraph that holds what the skill does, when to use it and its phrases.
   - `skills/code/wizard/templates/template.sh`, the three warning lines that name `gh` and the exit-status line of the head comment: each above 20 words, since each quotes a message or states both exits.
   - `skills/code/wizard/SKILL.md`, Steps 3 and the second bullet of "The template": each lists the parts of one thing (a journey, the library) in one sentence.
   - The two README rows and the `scripts.md` row: several sentences in one cell, in the register of the rows beside them.
   - `docs/dev/skill-layout.md`, the new bullet: one sentence of 33 words, the rule with its reason and its other half, kept in one bullet as the brief's 4.1 gives it.

Also run: `LC_ALL=C grep -n '[^ -~]' skills/code/wizard/templates/template.sh skills/ordo/wait-what/SKILL.md skills/code/wizard/SKILL.md` printed nothing (exit 1, no match). `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.

The greps of 5.6:

`git grep -n -i 'nineteen\|twenty\|19 skills' -- skills utils docs README.md`, after the change, four hits:

- `README.md:35`: changed, "twenty-one" and the two skills added.
- `README.md:170`: changed, "twenty-one".
- `docs/adr/0016-...md:7`: "twenty citations", no count of skills, unchanged.
- `skills/academic/paper/templates/calibration_counts.test.sh:68`: "three misses of twenty", no count of skills, unchanged.

`git grep -n 'session-retro' -- skills utils docs README.md ':!skills/ordo/session-retro'`, by file:

- `README.md:7`: the introduction names the skills around the plan loop and does not list every skill (`ordo-help`, `writing` and others are absent), unchanged.
- `README.md:25`: the table row of `session-retro`; the `wait-what` row follows it, changed by 5.1.
- `README.md:35` and `README.md:159`: changed by 5.2 and 5.3.
- `README.md:61` and `skills/ordo/ordo-help/SKILL.md:141`: the command sequence of a plan, which neither new skill belongs to, unchanged.
- `README.md:69` and `docs/figures/pipeline.svg:1`, `:2`, `:88`: the lanes of the pipeline figure, which draws commands that start agents or stop; neither new skill has a lane, unchanged.
- `docs/figures/gen_figures.py:2212`: the lane's label, unchanged. `docs/figures/gen_figures.py:2252` and `docs/figures/pipeline.svg:110`: the note, changed by 5.5 and by ruling 4 of repair round 1.
- `docs/dev/scripts.md:31`: the row of `transcript_window.py`, unchanged.
- `docs/glossary.md` (lines 24, 57, 75, 78, 83, 93, 116, 135, 138) and `skills/ordo/repo-setup/templates/plan-terms.md` (lines 19, 52, 70, 73, 78, 88, 111, 130, 133): entries of terms of `session-retro`, unchanged.
- `skills/ordo/repo-setup/templates/docs/glossary.md:3`: lists the skills that use terms in a sense of their own; neither new skill does, unchanged.
- `docs/roadmap.md:74`: the done entry of `session-retro`, unchanged.
- `skills/orchestration/plan-orchestration/SKILL.md:33`, `plan-retro/SKILL.md:27`, `refute/SKILL.md:28`, `skills/ordo/ordo-help/SKILL.md:30`: Use instead rows, unchanged.

Sentences about a changed file as a whole, reread:

- `docs/dev/scripts.md`, "Every script in this repository outside `.scratch/` is listed here": holds, line 18 lists the new script.
- `README.md:35`, "the twenty-one skills": `ls -d skills/*/*/SKILL.md` counts 19 before and the two new folders make 21, as the description-length command prints 21 lines.
- `docs/dev/skill-layout.md`, "Frontmatter": the block is unchanged and the new bullet names the one optional key.
- ADR 0045, "They differ from the sources only where this repository forces it": the list now holds nine items.

## Repair round 1

1. ADR 0045 lists the two differences of `wizard`. `sed -n '16,19p'` of the record printed:
   - "- the source's license text in the head comment of `template.sh`;"
   - "- the head comment of `template.sh` lists the script's inputs, warnings and exit status, as the change standard asks of every script;"
   - "- the GitHub variable as a destination the scope of `wizard` names, which the template's `set_var` already writes;"
   - "- the three rules on secrets in `wizard` (never asked for in the conversation, never printed, never written into the script), which the roadmap entry's goal asks for;"
2. The script's path is out of the confirmation. `grep -n "path the user confirmed\|script.s path" skills/code/wizard/SKILL.md` printed only line 67, the "Done when" of Steps 7, the message that says how to run the script. `skills/code/wizard/SKILL.md:47` reads "4. Copy `templates/template.sh` to the target path, which Rules gives."
3. `README.md:29`, the `wizard` row, reads "and fills a fixed template with the stages, one focused task per stage." (`grep -n 'one focused task per stage' README.md` printed line 29).
4. `docs/figures/gen_figures.py:2252` holds "/session-retro, /wizard, and /wait-what and /ordo-help, which have no stop." `python3 docs/figures/gen_figures.py && git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg` and no other line. `grep -o 'These start no agent[^<]*' docs/figures/pipeline.svg` printed "These start no agent: /repo-setup, /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro, /wizard, and /wait-what and /ordo-help, which have no stop. A refusal names its".
5. What the stage-list stop shows is stated once. The Stops row reads "The ordered stages, the values each produces, where each is written and whether it is secret", and `skills/code/wizard/SKILL.md:41` reads "2. Show the user the stage list as the Stops row "The stage list" gives it, and wait for the confirmation."
6. The license and the head comment.
   - `ls skills/code/wizard/templates` printed `template.sh` alone, and `grep -rn 'template.LICENSE' skills docs README.md` printed nothing.
   - The head comment holds the origin line, the fetched `LICENSE` whole as comment lines (lines 8 to 28, compared with the fetched file by the `sed` and `diff` command of the table, which printed nothing), and the list of inputs, warnings and exit status (lines 30 to 39). The diff above shows them as the 35 added lines beside the fourteen lines of 3.2.
   - `skills/code/wizard/SKILL.md:73` reads "The library is from the repository mattpocock/skills, under the MIT License, whose text stands in the template's head comment."
   - ADR 0045: the two items quoted under 1.
   - `docs/dev/scripts.md` is unchanged by the round.

## Terms

The diff adds or changes no glossary entry. Terms of `docs/glossary.md` the new text uses, each read against its entry:

- **session, the**: in both skills, the Claude Code session that runs the skill. In sense.
- **refusal**: `wait-what`, "What it reads" 2 and Anti-patterns, a skill's end without a decision for the user. In sense.
- **stop**: only in the two Stops tables and their headings, the sense "any point in a skill's Stops table where it waits on the user". `wizard` names the template's helper `step` in code only.
- **step**: only as "Steps <n>", an item of a skill's Steps. What a person does is an "action", and the script's units are "stages".
- **plan skills**, **plan**: in the Use instead rows, in sense.
- **bar**: not used.

## Files, with line counts (`wc -l`)

- `skills/ordo/wait-what/SKILL.md`: 52, new
- `skills/code/wizard/SKILL.md`: 101, new
- `skills/code/wizard/templates/template.sh`: 258, new
- `docs/dev/skill-layout.md`: 100 (1 added)
- `docs/dev/scripts.md`: 50 (1 added)
- `README.md`: 257 (5 added, 3 removed)
- `docs/figures/gen_figures.py`: 2310 (2 added, 2 removed)
- `docs/figures/pipeline.svg`: 123 (2 added, 2 removed)
- `docs/adr/0045-wait-what-and-wizard-are-copies-of-their-sources-with-the-differences-this-repository-forces.md`: 32 (4 added)

## Judgment calls the brief left open

1. `disable-model-invocation: true` stands after `metadata` in the frontmatter of `wait-what`, so the layout's three keys keep their order.
2. Use instead of `wait-what` has one row, `/ordo-help <entry>`, for "where a plan stands". Use instead of `wizard` has `/repo-setup` and `/ordo-init`, the two skills a request to "set up" could mean.
3. The Anti-patterns row of `wait-what` is the refusal on a missing glossary, from 1.4. It holds no instruction on how to explain.
4. The Quick start of `wizard` is one line, `/wizard <procedure>`; the source names no argument.
5. The source's four process steps are seven items of Steps in `wizard`, since the layout asks for one action per item and for the confirmation to stand before the items that write.
6. Steps 4 of `wizard` names the target path by citing Rules, which holds the rule of 2.3.
7. The further `Triggers on:` phrases of `wizard` are one per use the description names (credentials, CI secrets, a dashboard, a migration, a cutover).
8. `set_var` is named in Steps 5 for a public value CI reads, from ruling D2.
9. The three rules on a secret each carry the behaviour to do instead, as "Writing for an agent" asks of a prohibition.
10. The template's head comment lists its inputs, warnings and exit status as an indented list under three labels, read from the library: `ENV_FILE` (line 61 of the template), `_existing`, `ask`, `ask_secret`, `pause` and `confirm` for the reads, `open_url`, `set_secret`, `set_var` and `finish` for the warnings, `set -euo pipefail` and the last line `run_wizard "$@"; exit` for the exit status.

## User-visible changes, before and after

- Before: no `/wait-what`. After: `/wait-what`, invoked by the user only, makes the session explain again what did not land.
- Before: no `/wizard`. After: `/wizard <procedure>`, invoked by the user or the model, ends with an executable script at the target path, never run by the session.
- `README.md`: the table has 21 rows where it had 19; line 35 and line 170 read "twenty-one" where they read "nineteen"; the copy loop of line 159 copies `ordo/wait-what` and `code/wizard` too.
- `docs/dev/skill-layout.md`, "Frontmatter": a bullet on the optional key `disable-model-invocation: true`.
- `docs/dev/scripts.md`: a row for `skills/code/wizard/templates/template.sh`.
- `pipeline.svg`, the note. Before: "These start no agent: /repo-setup, /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro and /ordo-help, which has no stop." After: "These start no agent: /repo-setup, /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro, /wizard, and /wait-what and /ordo-help, which have no stop."
- The template's printed lines, against the source: `> Stage 1/3: <name>`, `-` before an action, `!` before a warning, `> opening`, `ok wrote KEY to .env`, `ok set`, `ok Setup complete`.
- ADR 0045: four more listed differences: the license text in the head comment, the head comment's list of inputs, warnings and exit status, the GitHub variable, and the three rules on secrets.
- The template's head comment, against the source: the origin line, the MIT License text and the list of inputs, warnings and exit status.

## Wrong or impossible in the brief

- The brief names `CLAUDE.md` to read whole. The worktree holds no `CLAUDE.md` at its root (`ls -a` lists none, and `git ls-files | grep -i claude` prints only `skills/ordo/repo-setup/templates/CLAUDE.md`). Its section "A shipped file names nothing private" was read as the session was given it.
- The brief's premise that the source's `template.sh` has mode 100644 in its repository is not verified by the builder: the URLs the brief allows return file contents only.
- Item 3.5 of the brief is replaced by ruling 6 of repair round 1 where they differ: no `template.LICENSE`, and the license text in the head comment.
- Each fetch folder made with `mktemp -d` is deleted: `ls` on it printed `No such file or directory`.
