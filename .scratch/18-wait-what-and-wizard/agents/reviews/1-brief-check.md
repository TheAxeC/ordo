# Brief check: step 1

Brief check of `/Users/axelfaes/workspace/ordo/.scratch/18-wait-what-and-wizard/agents/briefs/1.md`, read against main at 729273b (`git rev-parse --short HEAD` prints `729273b`). Nothing was written or changed. Every command below was run from `/Users/axelfaes/workspace/ordo`.

The findings that most need a change to the brief are: Names 1 and 2, The step line 2 to 4, Cases and checks 1 and 2, The question 3 and 6, Implied inputs 1 and 2, ADRs 2 and 3, Dictated text 2 and 3.

## Names

Commands: `git grep -n -i 'nineteen\|twenty\|19 skills\|21 skills' -- . ':!.scratch'`, `git grep -n -i 'wait-what\|wizard' -- . ':!.scratch'`, `git grep -n 'template\.sh\|disable-model-invocation\|openai' -- . ':!.scratch'`, `git grep -n 'session-retro' -- . ':!.scratch' ':!skills/ordo/session-retro'`, `git grep -n 'metadata' -- '*.py' '*.sh' docs/dev README.md`.

1. `docs/figures/gen_figures.py:2251-2253` and its output `docs/figures/pipeline.svg:110`, outside the brief's paths. The note reads "These start no agent: /repo-setup, /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro and /ordo-help, which has no stop."
   - Today that list is every skill that starts no agent. After the step, `wait-what` and `wizard` start no agent and are missing from it.
   - Whether the note is a list of all such skills or only of the pipeline's commands is a reading the orchestrator must settle; the brief does not mention it.
   - Brief section 6 gives as its reason for no figure that "the README's figures are of the skills that do" start an agent. That sentence is false for `pipeline.svg`, which draws `/repo-setup`, `/ordo-init`, `/roadmap`, `/plan` and `/land`.
2. The grep of brief item 5.5 is narrower than change-standard rule 14, and cannot find what 5.5 asks for.
   - Rule 14 names `skills/`, `utils/`, `docs/` and `README.md`. The brief's grep covers `README.md docs/dev/*.md docs/glossary.md` only.
   - It matches count words only, so it cannot find a sentence that "lists every skill", the second thing 5.5 asks for.
   - The wide grep finds no other count today: `README.md:33` and `README.md:168` (both in the brief's paths), plus `docs/adr/0016-...md:7` ("twenty citations") and `skills/academic/paper/templates/calibration_counts.test.sh:68` ("three misses of twenty"), which are unrelated and stay true.
3. `README.md:7`, the paragraph "Around that loop, `repo-setup` and `ordo-init` set a repository up for it ...". It names some skills, not all (no `writing`, `paper`, `code-comments`). Not made false.
4. `README.md:35-63`, the order-of-use block, and its copy in `skills/ordo/ordo-help/SKILL.md` (line 141 region). They list the plan commands and `/diagnose`, not every skill. Not made false.
5. `README.md:73`, "The skills that launch agents each have a figure of their own". Stays true, since neither new skill starts an agent.
6. `README.md:128`, `README.md:130`, `README.md:138` and `README.md:239-249` (the skills CLI text and the pin text). They name no list or count of skills. Not made false. This is the "pin text" of the step line.
7. `skills/ordo/ordo-help/SKILL.md:10,19,37-42`, the `skills` mode. It reads each skill folder at run time and holds no list. Not made false; `wait-what` and `wizard` will be printed by it.
8. `skills/ordo/repo-setup/templates/docs/glossary.md:3` lists the skills whose terms stand in the plan-terms block. Not made false unless a term of the new skills is added to that block.
9. `docs/adr/0045-...md` (lines 1, 7, 11, 14, 15, 16, 19, 23, 24, 28), `docs/adr/README.md:54`, `docs/roadmap.md:23,26,27,90`. All consistent with the step; none made false.
10. `disable-model-invocation`: no hit outside ADR 0045. `metadata` in scripts: no script reads a skill's frontmatter keys (the only hits are `docs/dev/skill-layout.md:11,22,23,98`), so no script refuses the new key.
11. `template.sh`: no hit outside ADR 0045. `utils/pin.sh` holds no skill names (`grep -n 'grant\|diagnose' utils/pin.sh` exits 1).

## The step line

Mapping of the plan's step-1 line to "What to build":

- "`skills/ordo/wait-what/` with its `SKILL.md` in the skill layout": items 1.1, 1.2, 1.4, 1.5.
- "the source's one-sentence instruction": item 1.3.
- "`disable-model-invocation: true`": item 1.1 and the fifth case.
- "`skills/code/wizard/` with its `SKILL.md` in the skill layout and the source's four steps": items 2.1 to 2.4.
- "`templates/template.sh`, the source's library in ASCII": items 3.1, 3.2, 3.4.
- "`docs/dev/skill-layout.md`, Frontmatter, with `disable-model-invocation` as an optional key": items 4.1, 4.2.
- "listed where the skills are listed (`README.md`, `docs/dev/scripts.md` for the template, the install and pin text)": 5.1 to 5.3 (README and the install loop), 5.4 (scripts page), and the premise that `utils/pin.sh` needs no change.
- "`bash -n ...` exits 0": first case and Verify 2. "the ASCII check prints nothing": second case and Verify 1.
- "a reviewer reads both skills against ADR 0045 and the two source files": sixth and seventh cases, in part (finding 4).
- "the library line by line against the source for any change beyond printed symbols": item 3.4 and the third case.

Findings:

1. A part with no requirement: "the pin text". The brief states only that `utils/pin.sh` needs no change. The README's pin text (lines 228 to 249) is not named. I read it and it lists no skill, so nothing is owed; the brief should say so in "What is on the tree".
2. Item 1.3 says Steps holds "one action" with four parts. The step line and ADR 0045 say "one sentence". Nothing in the brief requires one sentence, so four sentences would meet 1.3.
3. Item 3.3 (remove the word "delightful" from the library's comment) is a requirement no part of the line asks for, and it runs against the line's own check, "the library line by line against the source for any change beyond printed symbols". A comment word is not a printed symbol. See ADRs 2.
4. The line's reviewer reading "against ADR 0045 and the two source files" is narrowed in "Cases". The `wait-what` case reads the file against item 1.3, the brief's paraphrase, and not against the source's sentence. No case reads either skill against ADR 0045's list of five differences.
5. Requirements no part asks for, each served by something else:
   - 2.4, "a secret is never asked for in the conversation, never printed and never written into the script". The brief calls it one "among the source's rules". The source `SKILL.md` states no such rule (fetched, see Premises 9). It serves the plan's Goal ("never printing a secret"), and the brief should say that.
   - 2.2, "a GitHub variable" as a destination. The source `SKILL.md` says "`.env`, a GitHub secret, both, or nowhere". It serves ruling D2.
   - 1.4 and Decision 4, the fallback to `docs/glossary.md` when there is no plan configuration. See ADRs 3.
   - 5.5, served by change-standard rule 14.
   - "What it must do", first bullet, second sentence: "Typed twice in a row, the second explanation is again a full explanation". No item of "What to build" carries it, and a sentence written into `wait-what` to meet it would be an instruction beyond the four parts of 1.3.
6. Left to the builder without being listed as a choice:
   - The `description` of `wait-what` (2.1 gives the content of `wizard`'s; 1.1 gives none).
   - Where the two README table rows go (the table is in neither group order nor alphabetical order).
   - Item 4.1, which says the block "gains" the key and also that it may be "named in a bullet" only. These are two different results.

## Premises

Each command of "What is on the tree" was rerun.

1. `ls skills/ordo skills/code` prints `code-comments diagnose` and `ordo-help ordo-init repo-setup session-retro`. Holds.
2. `grep -n -i 'grant' README.md` prints lines 31, 33, 73, 83, 130, 157. `grep -n '^## The skills\|^| Skill\|^| `repo-setup`\|^| `grant`\|nineteen\|for skill in' README.md` prints 9, 11, 13, 31, 33, 157, 168. Holds: table header at 11, rows 13 to 31, "nineteen" at 33 and 168, the loop at 157.
3. `ls -d skills/*/*/ | wc -l` prints 19, so "nineteen" is true now and "twenty-one" is right after the step.
4. `sed -n '1,49p' docs/dev/scripts.md` shows the three tables, and `wc -l` prints 49. Holds.
5. `sed -n '5,27p' docs/dev/skill-layout.md` shows `name`, `description`, `metadata` only. `grep -rn 'disable-model-invocation' skills` prints nothing (exit 1). Holds.
6. `find skills -name openai.yaml` prints nothing. Holds.
7. `grep -n 'grant\|diagnose' utils/pin.sh` prints nothing (exit 1). Holds.
8. `docs/dev/building.md` "lists test scripts only": inexact. Its block also holds `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary` and the ASCII check. The conclusion, that the step adds nothing there, holds: the page's last line says a new script adds a line "only when it has one" (a test).
9. The five public sources, fetched with `curl -fsSL` to stdout, each exit 0. What the brief says about them:
   - `wait-what/SKILL.md`: frontmatter `name`, `description`, `disable-model-invocation: true`, and a body of one sentence. The four parts of 1.3 match it, except "decides itself how far back to go", which is from the background page `docs/productivity/wait-what.md` and not from the sentence.
   - `wizard/SKILL.md`: the description's three parts match 2.1; the four process steps and their "Done when" lines match 2.2, with the differences of The step line 5.
   - `template.sh`: 223 lines. `curl ... | LC_ALL=C grep -n '[^ -~]'` gives lines 11, 13, 55, 62, 64, 69, 150, 160, 173, 184, 194, 199, 207, 218. Every one is covered by a bullet of 3.2. "delightful" stands once, at line 12. No tab and no carriage return (`grep -c` prints 0 for each). `curl ... | bash -n /dev/stdin` exits 0 under GNU bash 3.2.57.
   - The source folder `skills/engineering/wizard` holds `SKILL.md`, `agents` and `template.sh` (GitHub contents API), which fits "No `agents/openai.yaml`".
10. ADR 0045: status proposed, and the brief's quotes match its Decision section.
11. `docs/plan.yaml:15` reads `standards: [dev/skill-layout.md, ../skills/ordo/repo-setup/templates/docs/dev/prose-standard.md, glossary.md]`, so the glossary is `docs/glossary.md`. Holds.

## Cases and checks

1. The Conventions line "A skill names no neighbouring skill outside its Use instead table" is stricter than the standard and works against item 1.4.
   - `docs/dev/skill-layout.md`, "Frontmatter", limits this to the `description`. "Paths and names" says "A file of another skill is named with its skill".
   - Existing skills name another skill's section in "What it reads": `skills/orchestration/grill/SKILL.md:46` reads "The glossary, whole, found as `/plan`'s "What it reads" 1 says."
   - Under the brief's line, `wait-what` must restate the whole lookup rule of 1.4 in its own text, which lengthens the one skill ADR 0045 keeps short.
2. Item 1.4 states the lookup rule incompletely against `skills/orchestration/plan/SKILL.md:35,46-49`, which it says it follows ("as the plan skills find it"). Missing: paths in `plan.yaml` are read relative to the folder that holds it (`README.md:184`); with more than one `glossary.md` in the list the first is the glossary; the `projects:` form.
3. The case `sh utils/pin.test.sh 2>&1 | tail -1`, and Verify 1 first bullet, check a place the step does not change. The step changes neither `utils/pin.sh` nor its test, and the test builds its own scratch repositories (`utils/pin.test.sh:108-113`), so it reads nothing the step writes.
4. Verify 1 third bullet, `python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary`, checks `docs/glossary.md`, which is not in "Paths this step writes".
5. The fourth case's "every file parses" covers the nineteen unchanged skills. I ran the command: it exits 0 and prints 19 lines, the highest count 1023 (`skills/academic/referee/SKILL.md`). Only the two new lines are the step's.
6. The Read case on private names says "The source's example stage (a Stripe setup) is public material and stays". `CLAUDE.md` says "An example in a skill is built from public material or made up, and says which." The template's comment says only "Example stage: replace with your real steps", and the brief asks no file to say which. Whether the template's example falls under that bullet is the orchestrator's reading.
7. The command cases cannot "print nothing" on the unchanged tree, where the files do not exist (`bash -n` and `grep` print an error). The brief's note on a first run covers only the cases marked "Read". This is an omission in the note, not a case the rules get wrong.
8. No case and no text of the brief asks for breakage testing. The sentence "Ruling D9 settles that this step keeps no test" is consistent with change-standard, "Scripts compute facts; judgment is read".

## The question

"Could this pass without the goal being reached?", the goal being the two skills as text, copies of their sources.

1. `bash -n` case: yes. Any script with valid syntax passes, an empty file included. It proves syntax only.
2. ASCII `grep` case: yes. Any ASCII text passes.
3. The diff case (3.4): no for the library's code, with one gap.
   - Its second clause names `_existing`, `ask`, `ask_secret`, `write_env`, `set_secret`, `set_var`. The first three hold no non-ASCII character in the source, so under the first clause they cannot differ at all.
   - The functions that do change and are not named are `stage`, `step`, `warn`, `open_url` and `finish` (source lines 55, 62, 64, 69, 184). For those, the case does not say that only printed characters may differ.
   - The case also does not check that each replacement is the one 3.2 gives.
4. Description-length case: yes. It proves a length and that YAML parses.
5. Frontmatter case: yes for the goal as a whole; it proves the three values, which is the fact it is for.
6. Read case on `wait-what`: yes.
   - It limits "no instruction beyond them" to Steps. Rules, Anti-patterns and "What it reads" may hold further instructions, and ADR 0045 says "A change that adds an instruction to `wait-what` ... contradicts this record".
   - It reads against 1.3 and not against the source's sentence, so a rewording that loses the source's instruction passes.
7. Read case on `wizard`: yes in part. It covers the four process steps and the three rules of 2.4. It does not cover 2.1 (the description), 2.3 (where the script lives) or the two Stops rows.
8. Read case on private names: no. It is read on every new file, and it is the whole of that requirement.
9. `pin.test.sh` case: yes. It passes whatever the step does.
10. The check on the step's line: no, as the plan answers, provided the reviewer does read both skills against ADR 0045 and the two source files. The brief's cases alone do not make that reading happen (The step line 4).
11. Items of "What to build" with no case, judged only by the reviewer's verdict per item: 1.2 (nine sections), 1.4, 1.5, 2.3, 4.1, 4.2, 5.1 to 5.4. Each could be met in form (a row exists, a bullet exists) with wrong content; reading is the right check for them, and none needs a command.
12. Item 5.5's grep: yes. It prints the two known lines and nothing else whether or not a list of every skill was carried (Names 2).

## Implied inputs

1. Which commit of the source is copied. The brief fetches from `main`, which moves. At my fetch, `https://api.github.com/repos/mattpocock/skills/commits/main` gives sha `abeeaf95660ba9e8b7c753eb38f441ca707a8823`, dated 2026-11-19. Expected: the builder and the reviewer read the same commit. If the source changes between the build and the review, the diff of 3.4 shows lines the builder never touched. The brief names no commit.
2. The source's license. `https://api.github.com/repos/mattpocock/skills/license` gives MIT, whose condition is that the copyright notice goes with copies. The brief copies `template.sh` whole and says "neither skill says where it was copied from". Expected result: not stated anywhere in the brief or in ADR 0045. See Declined to judge.
3. The comma after "delightful". Source line 12 is "# Wizard library: delightful, consistent UX, identical across every wizard." Expected: "# Wizard library: consistent UX, identical across every wizard." The brief says only that the word is removed.
4. The length of the replaced comment rules. Lines 11, 13, 194, 199 and 218 are `# ` and 74 box-drawing characters. Expected: one `-` per character, so the line keeps its width. The brief says "a line of `-` of the same role (`# ----...`)" and gives no length.
5. Line 207, `# -- Example stage: replace with your real steps` followed by 27 box-drawing characters. The brief says the characters "at the ends ... become `--`" and also "nothing else on its line changes". Expected: stated one way, either 2 and 2 hyphens or 2 and 27.
6. A replaced character inside a `printf` format string. Lines 55, 62, 64, 69, 150, 160, 173, 184 are single-quoted formats. Expected: `>`, `:`, `-`, `!`, `->`, `ok`, `to` add no `%` and no backslash, and every format starts with spaces or `\n`, so `printf` reads none as an option. I read each line and this holds.
7. A replaced character inside a prompt whose width the terminal needs. `ask` builds its Readline prompt with `\001..\002` markers (lines 110 to 115) and holds no non-ASCII character, so no replacement changes a prompt's measured width. Expected: `ask`, `ask_secret`, `pause`, `confirm` unchanged, which holds.
8. The stage line with a name that holds a colon. The example's stage is "Stripe: API keys", so the new line prints `> Stage 1/1: Stripe: API keys`. Expected: accepted as is, or another separator chosen; a wrong answer costs only how the line reads.
9. The file's mode. The source is 100644 (GitHub trees API), and every script under `skills/*/*/templates/` is 100644 (`git ls-files -s`). Expected: 100644, the skill's own step running `chmod +x` on the copy.
10. The last line and the final newline. `tail -c 30 | od -c` shows the file ends `run_wizard "$@"; exit\n`. Expected: kept, as 3.1 says.
11. `bash -n` on the machine's bash. The source passes on bash 3.2.57 here. Expected: exit 0 after the change.
12. Values that reach a command inside the library, unchanged by the step: the key in `grep -E "^${1}="` and `grep -vE "^${key}="` (lines 96, 144), the key in `printf -v "$key"` (118, 134, 148), a value with a single quote (handled at 145) and a value with a newline (written to `.env` as two lines). Expected: as the source, since ADR 0045 keeps the library; change-standard rule 15 would make each a case if the step wrote this code.
13. Who deletes the script "after its run" (2.3). The session never runs it and may be over when the user does. Expected: the hand-off message tells the user to delete it; the brief does not say.

## ADRs

All 44 records were read for status and decision (`for f in docs/adr/00*.md; do grep -m1 -i '^Status' "$f"; awk '/^## Decision/{p=1;next} /^## /{p=0} p' "$f"; done`).

1. ADR 0045 is the only record the step touches. The sentences the step is under: "`wait-what` and `wizard` are copies of their sources. The instruction of `wait-what` stays the source's one sentence, and the library of `wizard`'s template stays the source's, above its marker. They differ from the sources only where this repository forces it", its five differences, and "Only the user invokes `wait-what`: its frontmatter holds `disable-model-invocation: true`. The user and the model both invoke `wizard`." The brief names it and quotes it correctly.
2. Item 3.3 contradicts it as written. The record's difference for the template is "`template.sh` in ASCII, and listed on `docs/dev/scripts.md`", and its Consequences say a change that "edits the template's library, contradicts this record". Removing "delightful" from the library's comment at source line 12 is an edit of the library that is not an ASCII change. The difference "the prose standard applied to the skill text" names the skill text, not the template.
3. Decision 4 and item 1.4 (read `docs/glossary.md` when there is no plan configuration) go beyond the record's "the glossary found at the path the plan configuration lists, with `wait-what` still working when a repository has none". It also differs from the rule 1.4 says it follows: `skills/orchestration/plan/SKILL.md:47` reads "A repository whose `standards` list names no such page has no glossary for the skills, whatever file of that name it holds." The brief lists it as a reversible decision, so it is not silent; it is a sixth difference the record does not list.
4. Item 1.3, "one action", against the record's "one sentence": see The step line 2.
5. No record the step touches is missing from "What is on the tree". Records 0001, 0002, 0014 and 0030 govern where `writing`, `code-comments` and `paper` read the prose standard and the plan configuration, and do not govern a file, name or rule the step changes. Record 0012 governs the landing commit, which is the orchestrator's.

## Dictated text

1. `grep -n 'name: wait-what\|name: wizard' ...briefs/1.md` gives lines 34 and 46: `name: wait-what`, `metadata.version: "1.0.0"`, `disable-model-invocation: true`, `name: wizard`. Holds.
2. Line 67, "the north-east arrow in `open_url` becomes `->`", giving the printed line `-> opening <url>`. This breaks the prose standard, section 0, "Arrows (`->`) only inside code and code comments, never as prose punctuation", since the page's first line counts "shipped diagnostics and messages" as prose. The other replacements hold: line 66 `>` and `: ` (`> Stage 1/3: <name>`), line 67 `-`, `!`, `ok`, `to`.
3. Line 65, `# ----...` and `--`. Holds against the prose standard, section 0, since the hyphens are a ruled line and not an aside. The length is unstated (Implied inputs 4 and 5).
4. Line 69, the comment sentence "Generated by the /wizard skill." stays. Holds against change-standard rule 10: it says what the file is, not when or in which step it was written.
5. Lines 83 and 85, "nineteen" becomes "twenty-one", and `ordo/wait-what` after `ordo/session-retro`, `code/wizard` after `code/diagnose`. Holds, and the count is right (Premises 3).
6. Line 87, the job of the `docs/dev/scripts.md` row: "the script the `wizard` skill copies and fills with stages, which then walks a person through manual steps, reads each value, writes it to `.env`, a GitHub secret or a GitHub variable, and asks before an irreversible action". It holds against the page's definition of a user script. One point: "steps" is used for a person's manual steps, and `docs/glossary.md:124` defines **step** as a plan step; the glossary's opening line covers the pages under `docs/dev/`.
7. Line 52 (grep `bar\b`), "hold the source's bar", is the brief's own wording for item 2.2, taken from the source's "Hold the bar the template sets". `docs/glossary.md:13` defines **bar** as "the standard a builder's first report passes when its step lands with at most one fix at landing". A builder who carries the word into `skills/code/wizard/SKILL.md` breaks `docs/dev/skill-layout.md`, "Writing for an agent", third bullet. The brief's section 6 then sends this to a hand-back, which can be avoided by naming the word now.
8. Line 104, the expected output `wait-what True 1.0.0`. Holds.
9. `CLAUDE.md`, "A shipped file names nothing private": nothing the brief dictates for a file under `skills/` or for `README.md` names a file, folder, person or project of the author's own, and every source it sends the builder to is a public URL.

## Declined to judge

- Whether the MIT notice of the source must go with `template.sh`, and where (Implied inputs 2). It is a legal question and the user's call.
- Whether ADR 0045 should gain "the word delightful removed" and "the fallback to `docs/glossary.md`" as differences, or the brief should drop them (ADRs 2 and 3). A change to an ADR is the user's.
- Whether the note of `pipeline.svg` is a list of every skill that starts no agent (Names 1). It is a reading of the figure's purpose.
- Whether the reworded `wait-what` instruction (third person, without the source's leading word "Wait") is still "the source's one sentence". The source's background page says the leading word is what makes the skill work; how close the wording must stay is the user's reading of ADR 0045.
- Whether Claude Code honours `disable-model-invocation: true` and `metadata` in a skill's frontmatter as the brief assumes. I did not check it against Claude Code's documentation in this run; the source skill carries the same key.
- The glossary's plan-terms block (lines 8 to 139) was read by its term list and by the entries **bar**, **case**, **pause**, **refusal**, **session, the**, **step** and **stop**, not entry by entry in full. A clash with another entry is not ruled out.
- The whole verify list and `sh utils/pin.test.sh` were not run: the first is the landing's, and the second changes nothing but takes its own scratch folders, which I left alone.

## Closed

- Names 1: the note of `pipeline.svg` gains the two skills (brief item 5.5); `docs/figures/gen_figures.py` and `docs/figures/pipeline.svg` are in the paths; the reason for no figure is reworded in section 6.
- Names 2 and The question 12: the grep is widened to `skills`, `utils`, `docs` and `README.md`, with a second grep for a list of every skill (item 5.6).
- Names 3 to 11: no change owed.
- The step line 1: "What is on the tree" says the README's CLI and pin text names no list or count of skills.
- The step line 2, ADRs 4 and The question 6: item 1.3 dictates the source's text word for word except the glossary clause, and no other section may add an instruction; the case reads the whole file against the fetched source.
- The step line 3, ADRs 2 and Implied inputs 3: the removal of "delightful" is dropped; the template's comments stay the source's.
- The step line 4 and The question 7 and 10: the Read cases are read against the fetched sources, cover 2.1, 2.3 and the Stops rows, and a case reads both skills against ADR 0045's differences.
- The step line 5: 2.2 names ruling D2 for the GitHub variable; 2.4 names the plan's goal for the secret rule; the fallback to `docs/glossary.md` is dropped (ADRs 3); the "typed twice" sentence is removed from "What it must do".
- The step line 6: 1.1 gives the `wait-what` description's content; 5.1 places the two rows; 4.1 leaves the block as it is and adds one bullet.
- Premises 8: the premise on `docs/dev/building.md` is corrected.
- Cases and checks 1 and 2: `wait-what` cites the `plan` skill's "What it reads" 1 and does not restate the lookup; the Conventions line follows `docs/dev/skill-layout.md`.
- Cases and checks 3, 4 and The question 9: the `pin.test.sh` case and check and the glossary check are removed.
- Cases and checks 5: the case covers the two new skills only.
- Cases and checks 6: item 2.5 has the skill say the template's example is made up.
- Cases and checks 7: the note on the first run covers a command case on a file that does not exist yet.
- The question 3: the diff case names the fourteen lines and holds every function to printed characters only.
- The question 1, 2, 4, 5, 8 and 11: no change; each proves the fact it is for, and the rest is the reviewer's reading.
- Implied inputs 1: every source URL names commit `abeeaf95660ba9e8b7c753eb38f441ca707a8823`.
- Implied inputs 2 and the first point declined: the session's decision, booked in the brief as decision 4 and item 3.5: the source's MIT license text is saved beside the template, the template's head comment gains two lines that name the source and the license, `SKILL.md` says it in one sentence, and ADR 0045 gains the difference.
- Implied inputs 4 and 5: each box-drawing character becomes one `-` (item 3.2).
- Implied inputs 6: item 3.3. Implied inputs 9 and 10: item 3.1. Implied inputs 13: item 2.2, the hand-off message.
- Implied inputs 7, 8, 11 and 12: no change owed.
- Dictated text 2: the north-east arrow becomes `>`.
- Dictated text 6 and 7: the scripts row says "actions"; item 2.6 keeps "bar", "step" and "stop" to the glossary's senses.
- Dictated lines added after the check, each held to the rules file and the standards pages: the fenced instruction of 1.3 (the source's words, kept as the requirement; holds); the replacements of 3.2 (`-`, `>`, `:`, `!`, `ok`, `to`; hold); the names `template.LICENSE` and the paths added (hold).

Usage: a866bbf579774b48d, claude-fable-5-2, 166799 tokens, 20 tool uses, 6.4 minutes
