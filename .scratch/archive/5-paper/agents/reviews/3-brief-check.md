# Step 3 brief check (on main at d5282e3)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## 1. Names

- The tag `v8.4.0-rc.1`: `git tag --list 'v8.4*'` prints nothing, so the name is free. `grep -rn -E 'v8\.(3|4)\.0' README.md docs skills utils .agents/plan.yaml .scratch/5-paper` has two hits outside the brief. `docs/roadmap.md:197` is 4.A's closing record and stays true. `.scratch/5-paper/orchestrator-state.md:79` reads "The installed skills are pinned at v8.3.0", which the pin makes false. The state file belongs to the orchestrator, and its header says it is rewritten before every step commit, so this is no defect of the brief.
- The pin (`~/.local/share/ordo-stable` and its links): `grep -rn -i ordo-stable README.md docs/dev` hits `README.md:180` (a generic `utils/pin.sh v1.1.0` example) and `docs/dev/change-standard.md`, "Rules this repository already states". Neither is made false.
- `.agents/gate/5-paper-3/`: `grep -rn '\.agents/gate' .` hits only the brief (lines 32, 45 and 81).

Findings: none.

## 2. The step line

- "a release-candidate tag of main with step 2, pinned with `utils/pin.sh <tag>`": item 1.
- "the three blind comparisons against academic-paper of `docs/dev/blind-comparison.md`": items 3 and 5. Parts of the page's item 4 have no requirement (section 4 of this report).
- "revision on dongho-ecg-clustering's BSPC round at research-hub commit f8c5e7176 with `admin/reviews/reviewer-comments.md` (D18)": item 3, Revision, and Decisions 3 and 4.
- "full mode on linfoot-estimator's `code/`, `results/` and `correspondence/` with `manuscript/` removed (D19)": item 3, Full, and Decision 4.
- "lit-review on the topic of ward-bttr-crosssubject's Related Work section, neither side given its `.bib` (D20, D28)": item 3, Lit-review (an empty folder), and Decision 1. D28's clause "its 55 references the known outcome the user reads the outputs against" has no requirement.
- "each side on its own copy outside research-hub": item 2.
- "its stops answered by you in its own session, the same answer on both sides where the questions match (D38)": item 4 and Decision 2.
- "recorded in `agents/reviews/3-blind-comparison.md`": item 9.
- "`lookup.py resolve` on each entry the lit-review run writes to its `.bib`": item 6.
- "outline-only, abstract-only, citation-check and disclosure each run once on a copy of research-hub's current revised dongho-ecg-clustering manuscript (D39)": item 7.
- "`/writing` run on that copy and the findings you accept applied to it by `/paper` (D37, D40)": item 8. Item 8 uses "a fifth copy", while the line says "that copy".
- "the check: your call on each comparison is a win or a tie, each written entry's resolve result is quoted, and you read each of the four single-mode outputs and the applied findings": the done criterion under item 10.
- "(1 commit; orchestrator, no agent)": the executor paragraph and "Size: a full step". The commit itself is the landing's, which is outside the brief.

Decisions read against the rulings and against the six kinds that self-rule leaves open:

- Decision 1 (the topic): no ruling sets other words, since D28 fixes only that the input is the topic the section covers. It is none of the six kinds. Its premise is wrong (section 3, F3.5).
- Decision 2 (stops relayed through `--resume`): it agrees with D38 (a), since the answer reaches each side's own session as Axel wrote it. It is none of the six kinds.
- Decision 3 (inputs from commits): it agrees with D18, D19 and D39. D39's "current revised manuscript" equals HEAD, because `git -C ../research-hub status --short -- projects/manuscripts/dongho-ecg-clustering` prints nothing. It is none of the six kinds.
- Decision 4 (paths left out): for revision, no ruling is contradicted. For full, the `notes/` it leaves out does not exist at 5c93ca21b (F3.2), so the exclusion changes nothing. The input does keep `README.md` and `project.yml`, while D19 and the gate name only `code/`, `results/` and `correspondence/`. This is one reading of D19, and the brief should state it as a decision.
- Decision 5 (the old side gets academic-paper alone, and every pinned Ordo skill stays installed for both sides): this contradicts `docs/dev/blind-comparison.md` item 1, "with only that input and its own skill". After `utils/pin.sh v8.4.0-rc.1`, `paper` and `writing` are linked into `~/.claude-backup/skills` (the `CLAUDE_CONFIG_DIR` the side processes inherit) and into `~/.claude/skills`, so the old side can invoke the new skill. Both sides also get the synced skills under `~/.claude-backup/skills/synced/.../` (`deep-research`, `docs`, `pdf`, `xlsx`, `import-memory`, `morning`). The earlier record took a different setup (section 3, F3.6). The session can close this with a clear recommendation: limit each side's skills, as section 4 says.
- Decision 6 (what a judge gets): it agrees with item 2 of the page. Its gaps are in section 4.
- Decision 7 (the `/writing` part): it may contradict ADR 0021's last sentence (section 7, F7.1). That is kind 3, contradicting an ADR, and the choice is one the user would see.
- Choices the brief takes without listing them under its Decisions: the copies live inside this repository rather than in a folder outside it, as plan 9 did (`ls ~/.claude/projects | grep gate` shows plan 9's sides ran in this session's scratchpad under `/private/tmp/`); five separate dongho copies are used for items 7 and 8; and the old side's request wording is the brief's own.

Findings:

- F2.1 D28's "its 55 references the known outcome the user reads the outputs against" has no requirement. Item 5 has Axel read "the input, both outputs and both verdicts", and for lit-review the input is an empty folder and the topic. `projects/manuscripts/ward-bttr-crosssubject/manuscript/refs.bib` (55 entries) and the section `body.tex:160-259` are never put before him.
- F2.2 "`/writing` run on that copy" against item 8's "a fifth copy": the brief takes a reading of the line without listing it under Decisions.
- F2.3 Decision 5 contradicts `docs/dev/blind-comparison.md` item 1, as stated above.
- F2.4 The undeclared choices named above (where the copies live, the five copies, the old side's request wording, and Decision 4's keeping of `README.md` and `project.yml`) belong under "Decisions taken in this brief", since that heading says "none silent".

## 3. Premises

- paper 1.0.0 with seven modes, 14 pages, writing 1.1.0: `sed -n 1,30p skills/paper/SKILL.md` prints `version: "1.0.0"` and the seven modes. `ls skills/paper/references | wc -l` prints 14. `grep -n version skills/writing/SKILL.md` prints `5:  version: "1.1.0"`. Matches.
- Newest tag `v8.3.0`, pinned there: `git tag --sort=-creatordate | head -1` prints `v8.3.0`, and `git -C ~/.local/share/ordo-stable describe --tags` prints `v8.3.0`. Matches.
- Plan 4 took `v8.2.0-rc.1` to `v8.2.0-rc.3`: `git for-each-ref refs/tags --sort=-creatordate` lists `v8.2.0-rc.1`, `-rc.2` and `-rc.3` on 2026-10-17, and `git log -1 v8.2.0-rc.1` prints `4e2788e Add the code-comments skill ...`. Matches.
- Plan 9 took `v8.3.0-rc.1`, citing its closing line: does not match (F3.1).
- `utils/pin.sh` usage: `sed -n 1,10p utils/pin.sh` prints the two usage lines as the brief states them. Matches.
- research-hub HEAD 5c93ca21b: `git -C ../research-hub log -1 --format=%h` prints `5c93ca21b`. Matches.
- linfoot uncommitted changes: `git -C ../research-hub status --short -- projects/active/linfoot-estimator` prints ` M .../README.md` plus the eight untracked entries the brief lists. "Among them" covers the modified README. Matches.
- dongho at f8c5e7176: `git -C ../research-hub ls-tree -r --name-only f8c5e7176 projects/manuscripts/dongho-ecg-clustering` prints the files the brief names, and also `CLAUDE.md`, `PRESENT.md`, `README.md`, `project.yml`, `admin/original-submission/*` (5 files), `admin/reviews/BSPC-D-26-11935-reviews.pdf`, `manuscript/highlights.txt`, `manuscript/submitted-2026-06-30/*` (8 files), `code/`, `notes/` and `present/`. The brief's sentence is true but leaves out files that items 3 and 5 depend on (F3.4).
- linfoot folders "at HEAD": `ls ../research-hub/projects/active/linfoot-estimator` prints `code correspondence manuscript notes project.yml README.md results`, which is the working tree. It does not match "at HEAD" (F3.2).
- ward-bttr Related Work: `grep -n '\\section' body.tex` prints `160:\section{Related Work}` and `260:\section{Methods}`, which is 100 lines. `grep -c '^@' refs.bib` prints 55. `sed -n 49,50p main.tex` prints the title over two lines, 49 and 50. Matches, except that the title runs on to `main.tex:50`.
- dongho current manuscript: `git -C ../research-hub log -1 -- projects/manuscripts/dongho-ecg-clustering/manuscript` prints `322c53c80 2026-09-10 Verify the BSPC revision and write the response to reviewers`, and `status --short` of the folder prints nothing. Matches.
- research-hub `.agents/plan.yaml`: `grep -v '^ *#' ../research-hub/.agents/plan.yaml` prints `projects:` with the one project `oculus`. The "What it reads" 1 of `skills/paper/SKILL.md` and of `skills/writing/SKILL.md` each name `reviewer`, `reviewer_effort` and `standards`. Matches.
- academic-paper: `grep -n version` prints `5:  version: "3.2.0"`. `sed -n 266,273p SKILL.md` shows `full` on 268, `revision` on 270 and `lit-review` on 272. `ls -la ../research-hub/.claude/skills` shows `academic-paper -> ../../.agents/skills/academic-paper`. `ls ../research-hub/.agents/skills | grep -c shared` prints 0, and `SKILL.md:24` and `:163` name `shared/` paths. Matches.
- `docs/dev/blind-comparison.md` items 1 to 9: read whole. The brief's summary matches.
- The earlier record "The two sides": `.scratch/archive/2-f-diagnose/agents/reviews/3-blind-comparison.md`, "The two sides", shows each side as its own `claude -p`. It matches, but the brief leaves out how that run isolated each side (F3.6).
- Plan 9's ruling G: `.scratch/archive/9-literature/plan.md:111` reads "(a), the orchestrator starts ... each as its own `claude -p --model opus` process in a scratch folder outside research-hub, with Read, Write, Edit, Bash, Agent, Skill, WebSearch and WebFetch allowed". Matches.
- `claude --help` (2.1.303): `claude --version` prints `2.1.303 (Claude Code)`. Help lists `-r, --resume [value]  Resume a conversation by session ID` and `--session-id <uuid>`. The spelling `--resume <session-id>` appears only under `--bg`, and "for a print session" is not in the help. It matches in substance.
- `docs/dev/building.md` holds 10 commands equal to the state file's verify list: read both, 10 each, equal apart from the filters of `docs/dev/change-standard.md`, "Commands and their filters". Matches.
- ADRs 0017 to 0021 proposed: `grep -n -m3 -i status docs/adr/0*.md` prints `Status: proposed` for each. The quote from 0017 is in its Decision. Matches.
- "Libraries checked": `grep -v '^ *#' .agents/plan.yaml` prints `libraries: avoid`, and the state file holds `libraries: avoid`. The brief says `check` (F3.3).

Findings:

- F3.1 The brief says "plan 9 took `v8.3.0-rc.1` (`.scratch/archive/9-literature/plan.md`, its closing line)". `git tag --list v8.3.0-rc.1` prints nothing, because the tag was deleted when plan 9 was dropped (`9-literature/plan.md:126`, "the tag v8.3.0-rc.1 was deleted"). `v8.3.0-rc.2` (a6c643f) and `v8.3.0` (38215f8) are plan 4.A's (`.scratch/archive/4-a-ordo-help-skills/plan.md:34`, `:68` and `:70`). The conclusion `v8.4.0-rc.1` still holds.
- F3.2 "`projects/active/linfoot-estimator/` holds `code/`, `correspondence/`, `manuscript/`, `notes/`, ... at HEAD" is wrong for `notes/`. `git -C ../research-hub ls-tree -r --name-only 5c93ca21b projects/active/linfoot-estimator/notes` prints nothing, and `status --short` shows `?? .../notes/`. `notes/` is untracked, so Decision 4's reason for leaving it out ("holds the author's working notes on the draft") describes a folder the committed input does not have.
- F3.3 "Libraries checked" says "the project's `libraries` is `check`", but `.agents/plan.yaml` and the state file both say `libraries: avoid`.
- F3.4 The f8c5e7176 premise leaves out the input's `CLAUDE.md`, `README.md` and `project.yml`. A `claude -p` session started in a copy loads its `CLAUDE.md`, and these files name the compared skill. `git -C ../research-hub grep -n -i academic-paper f8c5e7176 -- <dongho minus code, notes, present>` hits `CLAUDE.md:6` ("Manuscript work via the `academic-paper` skill; reviews via `academic-paper-reviewer`") and `README.md:69`, `:99` and `:106`. The same grep at 5c93ca21b over linfoot hits `README.md:243` ("carried into the manuscript through the `academic-paper` skill in three patch rounds").
- F3.5 Decision 1 says "The section's six paragraphs give these six parts in its order". `sed -n 160,259p body.tex` shows seven prose paragraphs and a table. The first paragraph holds two of the parts (transfer and domain adaptation, then heterogeneous domain adaptation). The paragraphs at 199-202 and 227-236 set the paper's own method against the precedents. The last paragraph (250-259) covers decoders more widely than "decoders of finger movement from ECoG": linear and ridge spectral models, Kalman, intracortical speech and handwriting, FingerFlex, TCN and U-Net, compact EEG and ECoG networks, and tensor decoders.
- F3.6 The earlier record's "The two sides" shows each side launched as `claude -p --disable-slash-commands ... --add-dir <its skill folder> --append-system-prompt "Your skill for this task is the file <its skill folder>/SKILL.md ..."`, so each side had only its own skill. The brief cites the record only for the separate process and does not name this setup, which Decision 5 departs from.

## 4. Cases and checks

- C1: consistent with the rules file and the Rulings bullet "The pins of plan 5".
- C2: consistent with plan-orchestration's stop "A model other than the configured one" and with the page's item 4, which reads the served model from `init`.
- C3: inconsistent with item 2 of the brief (F4.1).
- C4: consistent. Its expected text may not match the run (F4.6).
- C5: consistent with D38.
- C6: partly inconsistent with the page's item 2 (F4.2).
- C7: consistent with the page's item 7.
- C8: consistent with the rules file, but weaker than the gate (section 5).
- C9: consistent with ADR 0020.
- C10: consistent with item 10. It is weak (section 5).
- C11: consistent with the rules file's character-set rule.
- No case asks the builder to check, quote or explain a place the step does not change, apart from C10, which checks that research-hub is unchanged and so serves item 10.

`docs/dev/blind-comparison.md` items 1 to 9 against the brief:

- Item 1, same input with identical copies: item 2, C3. A fresh session per side: item 3. "Only that input and its own skill": not met (Decision 5, F2.3). Judged on what it produced: item 4.
- Item 2, marks removed and the key in its own file: Decision 6, C6, and item 9's key file. Marks inside the judge's copy of the input are not covered (F4.2).
- Item 3, the order set by a command: item 5. The command and its output are kept in the key file under item 9.
- Item 4 bullets:
  - "Receives no file of either skill": the outputs are covered by Decision 6. Nothing says the old side's `.claude/skills/academic-paper/` and the new side's `.agents/plan.yaml` are committed with the input before the side starts. If they are not, they show up as files the side "wrote" and reach the judge (F4.3).
  - "Ledger of each plan that builds or changes either skill removed": the input holds no ledger. This plan's ledger, the key file and `skills/paper/` sit above the judge's copy in this repository, and the judge's command allows reading them (F4.4).
  - "Every other line that states the gate, names the comparison": no requirement for the input's own lines naming academic-paper (F3.4, F4.2).
  - "Copies in each file or folder the input names as a source": no requirement. For example, the dongho `README.md:21` names `code/results/*.csv` as the numbers' source of truth, and Decision 4 leaves `code/` out.
  - "Copies in each file an output cites outside the copy": no requirement.
  - "Saves the page of each URL an output cites": no requirement, and the step's command list has no way to fetch a page (F4.5).
  - "Own process, starts in its copy": item 5.
  - "Lists and loads no skill": `--disable-slash-commands` (help: "Disable all skills"). No case reads the judge's `init` message to confirm it.
  - "Fetches nothing, no permission beyond reading its copy": not met. `--allowedTools Read Glob Grep` is unscoped and grants reading every path, and `Agent` and the MCP tools are not removed (F4.4).
  - "Model `reviewer` names, served model from `init`": item 5 and C2.
  - "Loads the global instructions, files read from the transcript": item 5.
  - The two instructions to the judge: item 5. "Neither instruction names a skill or says which output is expected to win" is not stated. The judge also needs a statement of each task, and the requests name `/paper` and `/academic-paper`, so they cannot be given verbatim. The brief does not say what the judge is told the task was (F4.7).
  - "The judge checks each URL against its saved page": not in the judge's prompt (F4.5).
  - "The judge opens no file outside its copy": no requirement and no check (F4.4).
- Items 5 and 6, critical failures with their places before the verdict: item 5.
- Item 7, twice with the order swapped, fresh processes, read through the key: item 5 and C7.
- Item 8, Axel's call: item 5 and the done criterion.
- Item 9, the record: item 9 names "every part of item 9". The outputs as judged go to the folder `3-blind-comparison/<mode>/`, and the record has to point there.

Whether a session in `.agents/gate/5-paper-3/` can pick up anything of this repository, from the files on disk:

- CLAUDE.md: `ls -la` of `/Users/axelfaes/workspace/ordo`, `/Users/axelfaes/workspace` and `/Users/axelfaes` finds no `CLAUDE.md` or `CLAUDE.local.md`, so the upward search reaches none of this repository's files. Each copy carries the input's own `CLAUDE.md`: dongho's at f8c5e7176 names academic-paper, and its `../CLAUDE.md` reference resolves to the gate folder, which holds none. The global `~/.claude-backup/CLAUDE.md`, a link to `~/.claude/CLAUDE.md`, loads in every side and judge. Its line 26 reads "All manuscript and grant-application content ... goes through the `academic-paper` skill" (F4.8).
- `.agents/plan.yaml`: paper and writing read "`.agents/plan.yaml` of the repository the session is in" (each skill's "What it reads" 1). `git init` in each copy makes that repository the copy, so this repository's `.agents/plan.yaml` (with its `standards` naming this repository's pages) is not read. Without `git init` it would be.
- `.claude/`: this repository's `.claude/` holds `settings.local.json`, with 85 allow and 2 ask rules, among them `Read(//Users/axelfaes/**)`, `WebSearch` and five `WebFetch(domain:...)` rules, and `scheduled_tasks.lock`. It holds no skills, agents or CLAUDE.md. Whether a session whose cwd is a nested git repository applies a parent's `.claude/settings.local.json` is under "Declined to judge". Even if it does not, the judge's own `--allowedTools Read` already grants reading everywhere.
- Skills and agents: no `.claude/skills` or `.claude/agents` exists in this repository or in `/Users/axelfaes/workspace`. The user-level `~/.claude-backup/skills` (inherited through `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-backup`) holds the 15 Ordo links (plus `paper` after the pin) and the synced skills. The judge disables them with `--disable-slash-commands`. The sides do not.
- Auto-memory: `ls ~/.claude/projects | grep -i 'gate\|5-paper'` shows only plan 9's scratchpad folders. A copy's own git root gives it its own project folder, so this repository's memory folder `-Users-axelfaes-workspace-ordo/memory/` should not load. Only a run confirms this.
- A judge's copy: it sits inside this repository, five levels below `.scratch/5-paper/agents/reviews/3-blind-comparison-key.md`, the ledger and `skills/paper/`. With `--allowedTools Read Glob Grep` unscoped, nothing on disk stops it reading them (F4.4).

Findings:

- F4.1 C3 says "`diff -r` of the two sides' copies before they start prints nothing". Item 2 makes the copies differ on purpose: the new side has `.agents/plan.yaml`, the old side has `.claude/skills/academic-paper/`, and each has its own `.git`. As written, C3 fails, or it holds only once those paths are excluded. The case should name the exclusions and also compare each copy with the `git archive` of the named commit.
- F4.2 C6 lets a hit stay when "each hit is named in the record with why it stays". The page's item 2 says "every mark of which side made it" is removed, so a kept mark breaks it, and the clause should be limited to false hits (a word that is no mark). C6 greps only `outputs/`. The judge's copy of the input keeps `CLAUDE.md:6` and `README.md:69`, `:99` and `:106` (revision), and `README.md:243` (full), all naming academic-paper, which the judge auto-loads or reads. Item 4 says "no skill name", and its record (item 9) lists "each line removed from a file of it".
- F4.3 Item 2 does not say whether each side's setup files (the new side's `.agents/plan.yaml`, the old side's `.claude/skills/academic-paper/`) go into the copy's one commit. Item 5 takes "the files it wrote or changed, against the input". If they are uncommitted, the old side's output carries academic-paper's whole folder to the judge (the page's item 4, "receives no file of either skill"), and the new side's carries an Ordo configuration (a mark under item 2).
- F4.4 The judge's command `--allowedTools Read Glob Grep --disallowedTools Bash Edit Write WebFetch WebSearch` grants reading every path and leaves `Agent` and the MCP tools in place. The page's item 4 says "has no permission beyond reading its copy" and "opens no file outside its copy of the input". With the copies under this repository, the key file `.scratch/5-paper/agents/reviews/3-blind-comparison-key.md`, the ledger and `skills/paper/` are readable. No case reads the judge's transcript for a tool call on a path outside its copy, or its `init` message for its tools and skills. A brief change closes this: limit the tool set (`--tools Read,Glob,Grep`, which `claude --help` lists) or scope the read rule to the copy, then add a case reading each judge's `init` tools and skills and every path in its tool calls. Moving the judges' copies out of this repository is the other way, but work outside the repository is kind 1.
- F4.5 The page's item 4 bullets on sources named by the input, files cited by an output, URL pages saved into the judge's copy, and the judge checking each URL against its saved page have no requirement in item 5. The step's command list ("Each command of this step is typed whole: `git`, `claude -p`, `python3 skills/paper/templates/lookup.py`, `python3 -c` ..., `grep`, `diff`, `shasum`, `cp`, `mkdir`") has no way to save a page. Every lit-review entry carries a DOI or URL, so the lit-review judge cannot do what item 4 asks.
- F4.6 C4 expects the transcript to show the skill "loaded from `~/.local/share/ordo-stable/skills/paper/`". The side inherits `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-backup`, whose `skills/paper` will be a link into the pinned worktree, so the transcript may show the link's path. The expected result should accept a path whose link (`readlink`) points into the pinned worktree at the tag.
- F4.7 The judges' prompt as item 5 describes it does not state the page's "Neither instruction names a skill or says which output is expected to win". Nor does item 5 say what statement of each task the judge gets in place of the requests, which name the skills. For lit-review, the topic has to reach the judge.
- F4.8 The sides load the global instructions, whose line 26 tells every session that manuscript content goes through `academic-paper`. The new side has no academic-paper installed and runs `paper`, so this instruction bears on its run, and the brief does not address it. Whether a side loads Axel's global instructions is his call, since the page's item 4 rules on it only for the judge. It is a choice with no clear recommendation (kind 6), to raise rather than decide.
- F4.9 Item 9 keeps the outputs "as the first judge received it", and also "each in the rules file's character set, a character outside it in an output written by its name in angle brackets". The verify list's repository-wide character-set check also runs over these ledger files at landing. An output holding a character outside the set cannot satisfy both. The inputs already hold such characters: `LC_ALL=C grep -c '[^ -~]'` prints 2 for dongho `admin/reviews/reviewer-comments.md`, 5 for linfoot `README.md`, 2 for `correspondence/mist-note.md` and 2 for `project.yml`. The brief should say which copy carries the names, and the record should say so.
- F4.10 The step's command list leaves out `tar`, which turning `git -C ../research-hub archive` into a folder needs; `mv`, which Decision 6's rename of a run folder to `run/` needs; and `perl`, which verify item 1 runs. The list reads as complete, so it should name these or say "such as".
- F4.11 Item 1, "Tag main at the landing commit of step 2 or later, with nothing of step 3 on it", is ambiguous once step 3's preparation commit is on main. Every later commit is then "of step 3", so the only commit that fits is d5282e3, and the item should name it.

## 5. The question

- C1: no. The tag's commit holding step 2's landing and the pinned worktree at the tag are what the runs need.
- C2: no for the side and judge processes. The role agents inside a `paper` side are checked by `paper` itself.
- C3: yes. As written it cannot hold (F4.1), and it never compares a judge's copy with the input.
- C4: yes for the comparison's validity. It shows the new side ran the pinned `paper`, but not that the old side ran only academic-paper 3.2.0 from its copy, or that neither side invoked another skill (`paper`, `writing`, the synced `deep-research`). No case reads each side's `init` skill list or the Skill tool calls in its transcript.
- C5: no for questions a side ends a turn with. Yes for a question a side asks with a tool call in the middle of a turn: in print mode such a call is denied or answered with nothing, and the side goes on with its own answer, which item 4 ("ends a turn with a question") does not catch. No case reads the transcripts for such calls.
- C6: yes (F4.2). A mark can stay with a reason, the grep's word list misses structural marks (the `patches/<nn>-<file>.patch.json` and `.block-manifest.json` names, the `W<k>`, `R<n>-<m>` and `F<k>` ids, `config.md`, `integrity.md`), and the input copy's own lines naming academic-paper are outside its scope.
- C7: no.
- C8: yes. A quoted `lookup.py resolve` line that prints "not found" at every index passes C8, but the gate says "each entry the lit-review run writes to its `.bib` resolves through `lookup.py resolve`". The step line's own check has the same weakness ("each written entry's resolve result is quoted"). The case should require each entry to resolve, with an entry that does not raised to Axel as a gate failure.
- C9: no. It rests on Axel's recorded reading.
- C10: yes. A further write to a file already modified (` M projects/active/linfoot-estimator/README.md`), or to a path git ignores, leaves `status --short` the same. Taking `git -C ../research-hub diff HEAD | shasum -a 256` before and after as well would catch the first.
- C11: no.
- The step line's check "your call on each comparison is a win or a tie": yes. Axel's call can be a win on a comparison that was not blind as the page says, for example a judge that could read the key file above its copy (F4.4) or an old side with `paper` installed (F2.3). No case shows the judge's isolation or each side's skill set.
- "each written entry's resolve result is quoted": yes, as for C8.
- "you read each of the four single-mode outputs and the applied findings": no for the four runs. Partly yes for the applied findings: with item 8's `accepted-findings.md`, the orchestrator picks the subset, so `paper` never reads Axel's one-line answer there. The one-line route of D40 and ADR 0021 runs only at the closing `/writing` of the new side's revision comparison, and the brief has Axel read no record of those applied `F<k>` fixes (F7.1).
- Item 1: no.
- Item 2: yes for the judges, since copies inside this repository leave the key and the ledger within reach (F4.4). For the sides, `git init` keeps this repository's `.agents/plan.yaml` out, from the files on disk.
- Item 3: yes (Decision 5, F2.3, F4.8).
- Item 4: yes for a question asked by a tool call in the middle of a turn, as for C5.
- Item 5: yes (F4.2 to F4.5, F4.7).
- Item 6: yes, as for C8.
- Item 7: no.
- Item 8: partly yes (F7.1).
- Item 9: it cannot hold as written for an output with a character outside the set (F4.9).
- Item 10: yes for research-hub, as for C10.

Findings: C3, C4, C5, C6, C8 and C10, the step line's first two checks, and items 2 to 6, 8 and 10, each with how it could pass, as stated above.

## 6. Implied inputs

- Not a code step. The step builds no script and changes no product code, and its cases are runs and readings.

Findings: none.

## 7. ADRs

- 0001 (the writing base reads the prose standard where it is), proposed: it bears on the step. Item 2 writes `standards: []` into each copy, so the runs' `/writing` and `paper` read `templates/docs/dev/prose-standard.md` of the `repo-setup` skill, which is the Decision's third place. The brief does not name it. No contradiction.
- 0002 (the prose standard holds over the academic sources): does not touch the step. The step changes no rule of the writing skills.
- 0003: superseded by 0013. Not in force.
- 0004 (a decision under self-rule ends self-rule): does not touch the step, which makes no such decision.
- 0005 (the choices file): does not touch the step.
- 0006 (every agent recorded with its id): does not touch the step. It starts no agent through the runner, since the sides and judges are `claude -p` processes.
- 0007 (the run over a repair round on its own model): does not touch the step.
- 0008 and 0009 (the cost script): do not touch the step. They belong to the closing.
- 0010 (the verify list equal to the verification page): it governs `/spec`. The brief states the list is unchanged, and section 3 confirms it.
- 0011 (the dispatch block): does not touch the step.
- 0012 (every commit names its paths): governs the step's one commit, which the landing makes. No contradiction.
- 0013 (a script and four agents review a draft): item 8 runs `/writing` under it unchanged. No contradiction.
- 0014 (code-comments): does not touch the step.
- 0016: superseded by 0018. Not in force.
- 0017: named by the brief. Item 6 runs `lookup.py resolve` under it. No contradiction.
- 0018: named. The runs follow it.
- 0019: named. The intake and the four stops are relayed through item 4.
- 0020: named. C9 reads it. Decision 6 renames the run folder only in the judged copy.
- 0021: named. Its Decision ends "`/paper revision <main.tex> <report>` also takes a `/writing` report made separately as its comments file". Item 8 passes `accepted-findings.md`, which the orchestrator writes from Axel's line, in place of the report.

Findings:

- F7.1 Decision 7 and item 8 pass a file the orchestrator writes, not the `/writing` report that ADR 0021's last sentence names. `skills/paper/SKILL.md`, "### revision" item 1, says "A comments file that is a `/writing` report gives items `W<k>`", and revision has no step that takes the user's one-line answer for a report given as its comments file. The one-line answer belongs to Steps 12's stop "The findings to apply". As written, the `/writing` run of item 8 tests neither route of ADR 0021: `paper` reading Axel's line, or the report itself as the comments file. This is a possible ADR contradiction and a choice the user would see. One option is to keep item 8 and record that the subset was formed outside `paper`. Another is to give the report whole as the comments file and have Axel read the applied `W<k>` fixes. A third is to have Axel read, in addition, the `F<k>` fixes that the new revision side's closing `/writing` stop applied.
- F7.2 ADR 0001 bears on the `standards: []` that item 2 dictates, and the brief does not name it under "What is on the tree". Low weight: no contradiction.

## 8. Dictated text

- `/paper revision manuscript/main.tex admin/reviews/reviewer-comments.md`, found by `grep -n -F '/paper revision manuscript/main.tex admin' .scratch/5-paper/agents/briefs/3.md` (line 34): holds. It matches D26's arguments.
- `/academic-paper revision: revise manuscript/main.tex for the referee comments in admin/reviews/reviewer-comments.md` (line 34): holds.
- `/paper full .`, found by `grep -n -F '/paper full .'` (line 35): holds.
- `/academic-paper full: write the paper from this project's materials in code/, results/ and correspondence/` (line 35): holds against the prose standard. It tells the old side to use three folders, while `/paper full .` points the new side at the whole copy, which also holds `README.md` and `project.yml`. Item 1 of the comparison page gives both sides the same input, and the two requests send them to different parts of it (F8.1).
- `/paper lit-review "<topic>"` and `/academic-paper lit-review: review the literature on <topic>`, found by `grep -n -F '/paper lit-review "<topic>"'` (line 36): hold.
- The topic of Decision 1, found by `grep -n -F 'cross-subject neural decoding when'` (line 89): holds against `skills/repo-setup/templates/docs/dev/prose-standard.md`, sections 0, A, B and D. It is ASCII (`LC_ALL=C grep -n '[^ -~]'` over the brief prints nothing), has no dash used as an aside, and its count of parts follows the section. "Decoders of finger movement from ECoG" covers only part of the section's last paragraph (F3.5). Whether the topic states the section fairly is D28's ground and Axel's to read.
- `reviewer: claude:opus`, `reviewer_effort: high` and `standards: []`, found by `grep -n -F 'reviewer: claude:opus'` (line 32): hold. The keys are spelled as `skills/plan/templates/plan.yaml` lines 12, 14 and 27 spell them, and the values pass the checks `check_config.py` lists for those keys. They carry no comment, which no rule requires in a scratch file outside the tracked tree.
- The side command `claude -p --model opus --output-format stream-json --verbose --allowedTools Read Write Edit Bash Glob Grep Agent Skill WebSearch WebFetch`, found by `grep -n -F 'claude -p --model opus --output-format'` (line 33): holds as a command. It matches plan 9's ruling G.
- The judge command `claude -p --disable-slash-commands --model opus --output-format stream-json --verbose --allowedTools Read Glob Grep --disallowedTools Bash Edit Write WebFetch WebSearch`, found by `grep -n -F 'claude -p --disable-slash-commands'` (line 38): breaks `docs/dev/blind-comparison.md` item 4, "has no permission beyond reading its copy" (F4.4).
- The order command `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'`, found by `grep -n -F 'random.choice'` (lines 23 and 38): holds. It is the page's item 3 command.
- Verify item 1, `printf '%s\0' .scratch/5-paper/agents/reviews/3-*.md $(find .scratch/5-paper/agents/reviews/3-blind-comparison -type f) | xargs -0 perl ...`: holds, except that the unquoted `$(find ...)` splits a path that holds a space, and an output file of a side may be named with one. Low weight.
- "Libraries checked", found by `grep -n -F 'Libraries checked'` (line 97) and line 99: its statement "the project's `libraries` is `check`" is false (F3.3).

Findings:

- F8.1 The two full-mode requests point the sides at different parts of the same copy, as stated above. Either the old side's request should not name the folders, or both requests should name the same material.
- F8.2 The judge command breaks the page's item 4 (F4.4).
- F8.3 Line 99 states a false configuration value (F3.3).

## Declined to judge

- Whether Claude Code applies this repository's `.claude/settings.local.json` (its `Read(//Users/axelfaes/**)` and `WebFetch` rules) to a `claude -p` session whose cwd is a nested git repository under `.agents/gate/`. Only a run's `init` message or a denied call shows it.
- Whether auto-memory, project settings and transcripts of a session in a copy are keyed by the copy's git root rather than by a parent folder. The files on disk point to the copy, and only a run shows it.
- Whether the environment the side and judge processes inherit (`CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-backup`, `CLAUDE_CODE_CHILD_SESSION=1`, the orchestrator's `CLAUDE_CODE_SESSION_ID`) changes their behaviour or where they write their transcripts. `~/.claude-backup/projects` links to `~/.claude/projects`, so the page's transcript path holds on disk.
- Whether academic-paper asks its intake confirmation ("IRON RULE: User must confirm Paper Configuration Record", `SKILL.md:135`) as text that ends the turn or through a tool call in print mode. Only a run shows it.
- Whether a judge in print mode is offered the claude.ai connector tools (MCP) or the Agent tool and has them denied. Only a run's `init` message shows it.
- Whether the global instructions' line on academic-paper should load in the sides (F4.8). That is Axel's call.
- How long the runs take. Plan 9's gate was dropped after 77 minutes at 8 of 39 sources (`9-literature/plan.md:126`). The brief sets no time and none was asked for, so this is Axel's to weigh.
- Whether Decision 1's topic is a fair statement of the section, and whether Decision 4's keeping of `README.md` and `project.yml` in the full input is the intended reading of D19. Both are rulings for Axel to read.

Agent usage: a4c187208c83cba26, claude-opus-5-5, 239241 tokens, 58 tool uses, 15.6 min.

## Closed

- F2.1 (D28's 55 references): "What to build" 5, last bullet: Axel reads the Related Work section and its 55 references with the lit-review outputs, and no judge receives them.
- F2.2 ("that copy" against "a fifth copy"): "What to build" 7 and 8 run on one copy in turn, each run's output read from its commit; Decision 7.
- F2.3 and F3.6 (only its own skill): "What to build" 3 runs the academic-paper side with `--disable-slash-commands`, `--add-dir` and the system prompt naming its `SKILL.md`, the earlier comparison's setup, and C4 checks each side's `init` skills and `Skill` calls; Decision 5. "What is on the tree" names the earlier setup.
- F2.4 (silent choices): Decisions 4, 7 and 9 state the inputs, the one copy and the place of the copies; the old side's requests are written in "What to build" 3.
- F3.1 (plan 9's tag): "What is on the tree" names plan 4.A's tags and plan 9's deleted `v8.3.0-rc.1`.
- F3.2 (`notes/` at HEAD): "What is on the tree" says `notes/` is untracked; Decision 4 no longer names it.
- F3.3 and F8.3 (`libraries`): "Libraries checked" and "What is on the tree" say `libraries: avoid`.
- F3.4 (the input's project files name academic-paper): Decision 4 narrows each input to what its ruling names, leaving out dongho's `CLAUDE.md`, `README.md` and `project.yml` and linfoot's `README.md` and `project.yml`; "What to build" 5 removes from a judge's copy each line that names either skill.
- F3.5 (the topic): Decision 1 is rewritten to the section's prose paragraphs, its last part naming the decoder lineage the last paragraph covers, with the paragraphs on the paper's own method left out and why.
- F4.1 (C3): C3 compares each copy with a fresh `git archive`, `.git`, `.agents/` and `.claude/` left out.
- F4.2 (C6 and the judge's copy): C6 greps the whole judge's copy with the run-trail names added, and keeps only a hit that is no mark; "What to build" 5 removes the marks and the input lines that name either skill.
- F4.3 (setup files): "What to build" 2 commits the input and the side's setup files as the copy's one commit, and an output is the change after it.
- F4.4 and F8.2 (the judge's reach): every copy moves to the session's scratchpad (Decision 9), and the judge runs with `--restricted --tools Read Glob Grep --disable-slash-commands --strict-mcp-config`, confined to its folder; C12 reads each judge's tool-call paths and "What to build" 5 its `init` tools and skills.
- F4.5 (sources, cited files, URL pages): "What to build" 5 copies the sources and cited files in, saves each cited URL's page with `curl -sL --max-time 30`, and the judges' prompt has them check each URL against its saved page.
- F4.6 (C4's path): C4 reads the link under `~/.claude-backup/skills/paper` and its `readlink` into the pinned worktree.
- F4.7 (the judge's task statement): "What to build" 5 gives the three task statements, which name no skill, and states that the prompt names no skill and says nothing of which output is expected to win.
- F4.8 (the global instructions' line 26): raised as open item F, kind 3, Axel's; it does not block the step; Decision 6 keeps both sides on Axel's global instructions alike.
- F4.9 (the character set of the outputs): "What to build" 9 writes the ledger copy with characters named in angle brackets, and the judges receive that same copy.
- F4.10 (the command list): the list says "such as" and names `tar`, `curl`, `perl`, `readlink` and `mv`.
- F4.11 (the tag's commit): "What to build" 1 and C1 name d5282e3.
- Section 5, C5 (a question asked by a tool call): `AskUserQuestion` is disallowed in each process (Decision 2), and "What to build" 4 reads each transcript for denied calls, which C5 counts.
- Section 5, C8 and the step line's resolve clause: C8 and "What to build" 6 require each entry to resolve, an entry that does not raised to Axel.
- Section 5, C10: C10 adds `git -C ../research-hub diff HEAD | shasum -a 256`.
- Section 5, item 8: open item E, closed under self-rule with (a), C106: the report whole as revision's comments file, and Axel's one-line answer at the closing review, both sets of fixes read by Axel ("What to build" 8).
- F7.1 (ADR 0021's route): open item E, as above.
- F7.2 (ADR 0001): "What is on the tree" names it.
- F8.1 (the full requests point at different parts): Decision 4 makes the input `code/`, `results/` and `correspondence/` alone, and both requests name "this project's materials".
- Verify item 1's unquoted `$(find ...)`: rewritten as `find ... -print0 | xargs -0`.
- Dictated lines added after the check, each read against `docs/dev/change-standard.md` and `skills/repo-setup/templates/docs/dev/prose-standard.md`: the old side's three requests in "What to build" 3, the system prompt of the academic-paper side, the three judge task statements in "What to build" 5, and Decision 1's rewritten topic: each holds, plain ASCII with no dash used as an aside, each naming no skill where the page's item 4 forbids one.
