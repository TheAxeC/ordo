# Step 5 brief check (on main at 678a5a7)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/5.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets.

## 1. Names

- The tag `v8.4.0-rc.2`: `grep -rn -F 'v8.4.0' skills docs README.md utils` printed nothing; `grep -rn -F 'v8.4.0-rc.2' --exclude-dir=.git .` hits only `.scratch/5-paper/agents/briefs/5.md` (lines 15, 34, 71, 74, 99, 139). No hit outside the paths.
- The step line's "with steps 4 and 4.A" (premise correction, already in the working tree: `git diff .scratch/5-paper/plan.md` shows `-... with step 4, pinned` / `+... with steps 4 and 4.A, pinned`): `grep -rn -E 'with step 4[,;]' .scratch/5-paper docs README.md` printed nothing. No hit outside the paths.
- The record names `5-blind-comparison*`: `grep -rn -F '5-blind-comparison' --exclude-dir=.git .` hits only archived plans of other entries (`.scratch/archive/2-f-diagnose/...`), each its own plan's record. The change makes none false.

Findings: none.

## 2. The step line

- "a release-candidate tag of main with steps 4 and 4.A, pinned with `utils/pin.sh <tag>`": item 1.
- "the academic-paper full side on bttn-incident-af's `code/`, `RESULTS.md` and `notes/` with `manuscript/` and `present/` removed": items 2 and 3 (Full), Decision 4.
- "and lit-review side on the topic of the Related work section of raw-pls's `manuscript/main.tex`, neither given its `.bib`": item 3 (Lit-review), Decision 1.
- "each on its own copy outside research-hub, run to its end and kept": items 2, 4 and 9.
- "the `paper` side of each of the three comparisons on the same input as its academic-paper side": item 3. For revision, see finding 2.1 below.
- "its stops answered by you, your earlier words reused where a question matches (D38)": item 4, Decision 2.
- "the two judges of each comparison against the kept output, the order set by `random.choice`": item 5.
- "`lookup.py resolve` on each entry the lit-review run writes to its `.bib`": item 6.
- "outline-only, abstract-only, citation-check and disclosure each run once on a copy of research-hub's current revised dongho-ecg-clustering manuscript (D39)": item 7.
- "`/writing` run on that copy and the findings you accept applied to it by `/paper` (D37, D40, ruling E)": item 8.
- The check, "your call on each comparison is a win or a tie": no requirement. "What to build" ends with "The step is done when each comparison has its two verdicts and Axel's call with his reasons in the record". Neither that sentence, item 5 nor any case says that the call must be a win or a tie, or what follows from a loss.
- The check, "each `paper` side stops only at the stops its mode lists and asks nothing whose recommendation follows from the run's goal": C9, partly (see 4 and 5).
- The check, "each written entry's resolve result is quoted": item 6, C8.
- The check, "you read each of the four single-mode outputs and the applied findings": items 7 and 8, C10.
- "(1 commit; orchestrator, no agent)": the brief's opening paragraph and "Paths this step writes".

Findings:
- 2.1 The check "your call on each comparison is a win or a tie" has no requirement and no case. A loss would still leave the step "done" by the brief's own sentence. The brief needs a requirement and a case that the call is a win or a tie for each comparison. It also needs to say that a loss or a missing call is raised to Axel as an open item, and that the step is not done while one stands.

## 3. Premises

Each command of "What is on the tree" was rerun on main at 678a5a7:
- `sed -n 1,31p skills/paper/SKILL.md`: `version: "2.1.0"`, nine modes, the calls draft-review and figures. `ls skills/paper/references | wc -l`: `14`. `grep -n version skills/writing/SKILL.md`: `5:  version: "1.2.0"`. Matches.
- `skills/paper/SKILL.md` "Stops", second paragraph: "A run stops only at the stops its mode lists under its heading in "Steps". Any other choice ... is taken with the option that follows from the run's goal and written to `config.md`". Steps 13 invokes `/writing` through the Skill tool. Matches.
- `git tag --sort=-creatordate | head -1`: `v8.4.0-rc.1`. `git -C ~/.local/share/ordo-stable describe --tags`: `v8.4.0-rc.1`. `git tag --list 'v8.4.0-rc.2'`: nothing. `git log --oneline -3`: `678a5a7 Land step 4.A ...`, `1201453 ...`, `5274b8d ...`. Matches.
- `sed -n 1,25p utils/pin.sh`: usage `utils/pin.sh <tag>` / `utils/pin.sh`. `echo "$CLAUDE_CONFIG_DIR"`: empty. `ls -la ~/.claude/skills`: `paper -> /Users/axelfaes/.local/share/ordo-stable/skills/paper`, with no `academic-paper`. Matches, but the premise is incomplete (finding 3.1).
- `git -C ../research-hub log -1 --format=%h`: `4416e4236`. Matches.
- bttn-incident-af: `ls-tree --name-only` lists `AGENTS.md CLAUDE.md README.md RESULTS.md admin code manuscript notes present project.yml`. `ls-tree -r ... code notes | wc -l`: `97`. The grep prints only `RESULTS.md:144:Rerun the whole table on **gold ICD labels + age/sex**, add **external validation**, then draft via the `academic-paper` skill. No write-up of provisional-only or of any dead end.` Matches.
- raw-pls: `159:\section{Related work}\label{sec:related}`, `233:\section{Method}\label{sec:method}`. `grep -c '^@'` on `refs.bib`: `72`. Matches as stated, but see finding 3.3 for how item 5 uses it.
- dongho archive: `git log -3 --format='%h %s' -- .../manuscript` prints `0c2e5d9d7 Add ECG clustering manuscript files to the published archive` and `01393bc27 Move the ECG representation clustering paper to archive/published`. The two `ls-tree` lists match the brief: `figures/` holds `fig1_ari_heatmap.pdf`, `fig2_silhouette_trap.pdf`, `fig3_sep_vs_clust.pdf` and `fig4_federated.pdf`. No `dongho` remains under `projects/manuscripts/` at 4416e4236. Also, `git diff --stat 322c53c80:projects/manuscripts/dongho-ecg-clustering/manuscript 4416e4236:projects/archive/published/2026/dongho-ecg-clustering/manuscript` shows only `main-clean.pdf` and `main.pdf` added. So the archived text is the revised manuscript of `322c53c80 Verify the BSPC revision and write the response to reviewers`. Matches.
- Step 4.A beside step 4 and the plan line "with steps 4 and 4.A": `git diff .scratch/5-paper/plan.md` shows it. Matches.
- The kept academic-paper side: `ls .scratch/5-paper/agents/reviews/3-blind-comparison/revision/academic-paper-output` lists `admin final-message-turn1.md final-message-turn2.md manuscript manuscript.diff`. `ls` of the scratchpad lists no `gate*` entry. Matches.
- `grep -n version ../research-hub/.agents/skills/academic-paper/SKILL.md`: `5:  version: "3.2.0"`. `git log -1 --format='%h %ad' --date=short -- .agents/skills/academic-paper`: `79b4ee03d 2026-06-23`. Matches.
- The rulings list and the quoted text of "The same lines to every side": the quote equals `plan.md` Rulings. The list is incomplete (finding 3.2).
- `docs/dev/blind-comparison.md` items 1 to 9, item 4 the judge's copy and process: matches.
- `claude --help` (now `2.1.325 (Claude Code)`) lists `-r, --resume`, `--disable-slash-commands`, `--tools`, `--strict-mcp-config` and `--restricted`. Matches. The source the brief names, "step 3's record", is not the record: `grep -rn -- '--restricted' .scratch/5-paper` hits `agents/briefs/3.md:25` and no line of `3-blind-comparison.md`.
- `docs/dev/building.md` lines 6 to 17 hold the 12 commands, equal to the state file's `verify:` list. Matches.
- ADRs: `Status: proposed` for 0001, 0017, 0020, 0023, 0024, 0026 and 0027. Matches (see 7 for 0013).

Findings:
- 3.1 The `claude -p` processes do not load skills from `~/.claude/skills` alone. The step-3 `paper` transcript (`~/.claude/projects/-private-tmp-claude-502--Users-axelfaes-workspace-ordo-3998c800-...-scratchpad-gate-revision-1/c7a6066e-....jsonl`) prints `Base directory for this skill: /Users/axelfaes/.claude-backup/skills/paper`. Its instructions attachment names `"path":"/Users/axelfaes/.claude-backup/CLAUDE.md"`. `ls -la ~/.claude-backup/skills/paper` gives `-> /Users/axelfaes/.local/share/ordo-stable/skills/paper`, and `ls -d ~/.claude-*/skills` lists `~/.claude-backup/skills` and `~/.claude-work/skills`. The premise names only `~/.claude/skills`, and C4 checks only that link (see 4.3).
- 3.2 The rulings list omits "The revision comparison's first stops", which the plan's step 3 line names: "both sides get the one answer "The code and materials are in code/. DO NOT RUN ANYTHING: no code, no downloads, no experiments; read the code only.", and the revision input is widened by `code/` ... copied into both copies before either is resumed; the judges' task statement adds that the user told both sides not to run any code". Item 4 sends the revision `paper` side Axel's step-3 words only "where a question matches". If the paper side's first stop holds no question that matches Q2, the line never reaches it. The judges' statement "the user told both sides not to run any code" would then be false. A paper-side question about running `code/experiments/figures.py` matches nothing the academic-paper side asked, so it goes to Axel, as it did in step 3's stopped run ("2. You can run code/experiments/figures.py"). That answer would contradict the ruling. Item 4 needs to say that the revision `paper` side's reply at its first stop carries that line, whatever the questions are.
- 3.3 Item 5 says Axel reads "the Related work section of raw-pls (`main.tex:159` to `:232` at 4416e4236) and its 72 references". 72 is the count of the whole `refs.bib`. The section cites 60 distinct keys: `git show 4416e4236:.../main.tex | sed -n 159,232p | grep -o -E '\\cite[a-zA-Z]*\{[^}]*\}' | ... | sort -u | wc -l` prints `60`, and no cite in that range takes an optional argument (`grep -c -E '\\cite[a-zA-Z]*\['` prints `0`). The whole `main.tex` cites 70. The known outcome needs to be stated as the 60 entries the section cites, or as all 72 entries with that said.
- 3.4 The full-mode input Decision 4 chooses states its own pre-manuscript gate. `RESULTS.md:3`: "All numbers below are on PROVISIONAL ECG-report labels ... Nothing here is a manuscript claim until rerun on gold + external validation." `RESULTS.md:144`: "No write-up of provisional-only". The file that says that gate was met is left out: `README.md:63`, "The gold ICD-10 rerun is done, folded into the manuscript ... (all via `academic-paper`, 2026-07-04)". `code/results/` does hold `cohort_icd_*.csv` and `multihorizon_icd_spectral.csv`. Decision 4 therefore changes what the input says about whether a paper may be written, beyond the skill name it gives as the reason. A side may refuse, or write only from the ICD result files. The judges' task "a user asked for a paper to be written from these materials" then meets an input that forbids it. This affects the full comparison's verdict and is Axel's choice under open item P. The brief should name it under its Decisions and raise it.

## 4. Cases and checks

- C1: consistent with the rules file, Rules 6 and 21.
- C2: consistent.
- C3: consistent for what it covers. It runs "before the side starts", so for revision it does not cover `code/`, which is added after the first turn. Step 3 checked `code/` separately (`3-blind-comparison.md`, "The input": "the archive of `code/` against the copy's `code/`, `diff -r -x .git`, printed nothing").
- C4: as worded, it checks a link the process may not use (finding 3.1). "its transcript reads `SKILL.md` from there" is not what a stdin `/paper` produces: step 3's run shows the skill as the injected `Base directory for this skill:` line, and the record says "No turn made a Skill call".
- C5: consistent.
- C6: inconsistent with `docs/dev/blind-comparison.md` item 2 ("removes from each output every mark of which side made it"). The fixed pattern misses marks that stand in the kept academic-paper output. `grep -o -i -E 'ars_[a-z_]+|[a-z_]+_agent|revision-round[0-9]'` over `final-message-turn1.md` and `final-message-turn2.md` hits `peer_reviewer_agent`, `draft_writer_agent`, `citation_compliance_agent`, `ars_anchorize_draft`, `ars_apply_revision_patch` and `revision-round1`. The pattern also misses `paper`'s own trail ids and names (`W<k>`, `F<k>`, `D1-<m>`, `C<m>`, `config.md`, `items.md`, `block-manifest` is caught but `.patched` and `checks.md` are not). It misses the setup file `.agents/plan.yaml` (`reviewer: claude:opus`), if that file goes into the judge's copy as part of "the input as the sides received it". It also misses the replacement words "the writing skill" (see 8).
- C7: consistent with the page, item 7.
- C8: "a quoted `lookup.py resolve` line that resolves it" does not say what output resolves an entry. `lookup.py`'s head comment says `resolve` prints one line per index and exits 0 when the command ran ("Exit status: 0 when the command ran and found nothing to fail"). For a DOI input, "the first record found ... is the reference", and the entry's own title is never compared. An entry whose DOI names another work would print a record and pass. "Scripts compute facts" (rules file) allows the computed fact: a title input with `--year` gives a `ratio <r>` line at 0.70 or more, or a DOI resolve whose printed title is compared with the entry's title. The case needs to name which.
- C9: consistent in kind, but see 5.
- C10: consistent, but it checks only that output exists and that Axel's reading is recorded. Steps 13's done criterion ("each finding a reply names is applied or listed as not applied") is not checked.
- C11, C12, C13: consistent.
- No case asks the orchestrator to check a place the step does not change.

Findings:
- 4.1 C3 does not cover the revision copy's `code/`, and the output definition (item 5) does not exclude it. In step 3, `code/` stayed untracked in the copy ("`code/` is the input"). Step 3's `paper` run also edited `code/experiments/figures.py`. Under item 2's "`git status --porcelain --untracked-files=all` ... against that commit", all of `code/` shows as new output, and a side's real change to it cannot be told from the input. The fix is a second commit of `code/` in the copy before the resume (`git add code && git commit -q -m code`), checked by `diff -r` against a fresh archive like C3, with the output read against that commit.
- 4.2 C6's pattern misses the marks listed above, so the case can pass while marks remain. The pattern needs to name each trail name and id of both skills that item 5 says is rewritten, academic-paper's agent names and `ars_` script names among them.
- 4.3 C4 needs to read the base directory each `paper` process's transcript names and `readlink` that path. `pin.sh` with no argument covers every `~/.claude-*/skills` folder, but C4's own `readlink` names one of them.
- 4.4 C8 needs to say what resolves an entry, as above.
- 4.5 No case checks that each judge loaded the user's global instructions, which item 4 of the page requires ("The judge's process loads the user's global instructions"). `claude --help` says of `--restricted`: "ignores user, project and local settings files". Whether that leaves `CLAUDE.md` and `~/.claude/rules/*.md` loaded is not shown by any run of this command. A case would be that each judge's `instructions` attachment lists the global `CLAUDE.md` and the rules files a side's attachment lists.

## 5. The question

- C1, C2, C5, C7, C11, C13: no, each checks a fact its part of the goal needs.
- C3: yes for revision. `code/` is unchecked, so the side could run on a different `code/` (4.1).
- C4: yes. It can pass while a process loads `paper` from a folder the check does not read (3.1).
- C6: yes. It passes with `peer_reviewer_agent`, `ars_anchorize_draft` and `revision-round1` in output A or B (4.2).
- C8: yes. An entry with a wrong DOI that points to another work passes (4.4).
- C9: yes, on two counts. First, its method names each stop against the mode's list but does not ask whether a listed stop held a question whose recommendation follows from the run's goal, the gate's second half. Step 4's check run judged both ("asked nothing whose recommendation follows from the goal"). Second, under item 4 each `paper` side's first reply ends with "From here on, do not stop for a choice whose recommendation you would take", so later stops are suppressed by the instruction and not by the skill's "Stops" rule. The gate clause can pass with the skill not meeting it. C9 also does not say that a stop outside the list fails the gate clause and is raised to Axel.
- C10: yes. It passes when a finding Axel accepted was neither applied nor listed as not applied.
- C12: yes, for the step's check. The record holds a call that is a loss (2.1).
- The step line's check: yes, the win or tie clause has no case (2.1).
- Item 4: yes, on three points.
  - Revision parity. The academic-paper revision side never got the two lines: `3-blind-comparison.md`, "Questions and answers": "They were neither sent to Axel nor answered with the lines of the ruling "The same lines to every side" ... the run had ended". Its first stop was answered with `Q1 (a)` / `Q2 The code and materials are in code/. DO NOT RUN ANYTHING: ...` / `Q3 (a)` alone. The brief appends the lines to the `paper` side's first reply, so the two sides of the judged revision comparison get different replies to their first stops. D38 says "the same answer on both sides where the questions match". "The same lines to every side" says "the `paper` sides of step 5 included, gets at its next stop". Both readings are open: (a) the brief's, the lines at the paper side's first stop; (b) the lines at its second stop, matching when the academic-paper side would have received them, since its first stop was answered before the ruling existed. The choice changes one side's input to a judged comparison and is Axel's. The brief does not list it under its Decisions.
  - "The orchestrator answers no question itself" conflicts with answering a stop that holds a recommendation with the two lines, since the orchestrator decides that the stop holds one. The record needs to name each stop answered that way with the recommendation it held, so Axel can check the classification.
  - The end-of-run `/writing` reply. `paper`'s full and revision final message invites a one-line reply that starts a findings pass (Steps 13). Under item 4 that is a choice with no recommendation and goes to Axel. Answering it gives the `paper` side a writer pass that the academic-paper side's ended run did not get, since its closing decisions were not answered. The brief needs to say how each side's end-of-run message is treated, the same way on both sides.
- Item 7: yes, against the gate's "each run once on the revised dongho-ecg-clustering manuscript". Decision 8 runs the four modes in turn on one copy. Abstract-only's patch then changes the manuscript that citation-check and disclosure read. `skills/paper/SKILL.md` "What it reads" 7 offers each earlier run's `config.md` at the next run's intake. Steps 5 raises "An unfinished run" for a run left without `final.md`. Disclosure intake "reads the `paper-runs/` records of earlier runs" (AD10) and so reports the gate's own runs as AI use. Three of the four runs therefore do not run on the revised manuscript as research-hub holds it. A fresh copy per run, with item 8 on its own copy, would meet the gate. The choice is visible to Axel.
- Item 3: yes, a known failure is left open. Step 3's stopped `paper` run had its background peer reviewer killed by the runner (`3-refuter.md`: "Background tasks still running 10m after the last turn ... Set CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS=0 to wait indefinitely."). Steps 4 and 4.A's check runs used `env CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS=0 claude -p ...` (`4-check-run.md`, `4.A-check-run.md`). The brief's side and run commands omit it, so a side could end with no whole output for a reason of the runner, and item 4 would then judge it "on what it produced". The variable needs to be on every side's and run's command, both skills', from the first turn.
- Items 1, 2, 5, 6, 8 and 9: no, apart from the cases named above.

Findings: C3, C4, C6, C8, C9, C10, C12, the step line's check, item 4 (three points), item 7 and item 3, as above.

## 6. Implied inputs

- Not a code step: the step builds no script and changes no product code.

Findings: none.

## 7. ADRs

- Records in force (`grep -n Status docs/adr/[0-9]*.md`): 0001, 0002 (superseded by 0026 in part), 0004 to 0014, 0017, 0020, 0023, 0024, 0026 and 0027.
- 0001 (the prose standard read where it is): touched, since `paper` and `writing` with `standards: []` read the `repo-setup` template. Named.
- 0013 ("`/writing` first runs a script, `templates/prose_facts.py` ... It then starts four fresh agents that change nothing"): touched by item 8's `/writing` process and by the closing `/writing` of full and revision. Not named under "What is on the tree".
- 0017 ("`skills/paper/templates/lookup.py` ... makes every lookup of the skill"): touched by item 6. Named.
- 0020 ("A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder"): touched. Named.
- 0023 ("Full mode and revision mode invoke `/writing` ... `/paper revision <main.tex> <report>` also takes a `/writing` report"): touched by items 3 and 8. Named.
- 0024 (citation-check's claims rest on a passage read in the run): touched by item 7's citation-check run. Named.
- 0026 (manuscript prose standard): touched by item 8. Named.
- 0027 (eight roles): touched by every `paper` run. Named.
- 0002 in its remaining part (texts other than a manuscript), and 0004 to 0012 and 0014: not touched. The step writes ledger records and runs skills, and its single commit is made by `/land` under 0012.
- No part of the brief contradicts an ADR.

Findings:
- 7.1 ADR 0013 is touched by item 8 and is not named under "What is on the tree".

## 8. Dictated text

- `.agents/plan.yaml` keys `reviewer: claude:opus`, `reviewer_effort: high`, `standards: []` (`grep -n -F 'reviewer: claude:opus' 5.md`, line 38): holds.
- `git add -A && git commit -q -m input` (line 39) and `git add -A && git commit -q -m <mode>` (line 58): hold.
- The requests `/paper revision manuscript/main.tex admin/reviews/reviewer-comments.md`, `/paper full .`, `Run the skill in full mode: write the paper from this project's materials.`, `/paper lit-review "<topic>"` and `Run the skill in lit-review mode: review the literature on <topic>.` (lines 45 to 47): hold.
- The order command `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'` (line 52): holds; equal to `docs/dev/blind-comparison.md` item 3.
- The replacement for `RESULTS.md:144`, "the `academic-paper` skill" becomes "the writing skill" (`grep -n -F 'the writing skill' 5.md`, line 53): breaks `docs/dev/blind-comparison.md` item 4 ("no skill name"). "the writing skill" names this repository's `writing` skill, which the `paper` side invokes at the end of full mode and whose report and finding ids reach that side's output. A judge that sees a numbered findings pass in one output could read the line as pointing at it. Words that name no skill keep the rest of the line, such as "..., add **external validation**, then draft the paper. No write-up of ...".
- The judges' task statements (line 55): "a user asked for this manuscript to be revised for these referee comments; the user told both sides not to run any code, so new results the comments ask for could not be produced", "a user asked for a paper to be written from these materials", "a user asked for a review of the literature on <topic>". They hold against the prose standard and the page's item 4. The first holds as a fact only once finding 3.2 is closed.
- The topic of Decision 1 (line 108): holds against the prose standard. Read against the section at 4416e4236, it covers the three subsections ("Tensor PLS and unaligned tensors", "Optimal transport, fused-GW, and learnable templates", "Registration-free OT fusion in imaging and set encoders") and names none of the section's specific methods or papers (N-PLS, HOPLS, TFGW, CMOT-Fusion, AGDL, DeepSets). The brief's own sentence that it names "no ... method name" is inaccurate as worded, since the topic names method families (partial least squares, Gromov-Wasserstein, fused Gromov-Wasserstein); "no specific method of the section" is what holds.
- The C6 grep and the character-set command (lines 76 and 138): read whole. The character-set command equals the verify list's `perl` part. C6 is incomplete (4.2).
- The two lines of "The same lines to every side" (line 24): words fixed by the ruling; they hold.

Findings:
- 8.1 "the writing skill" in the `RESULTS.md:144` rewrite names a skill, against item 4 of the page.
- 8.2 Decision 1's "naming no paper, author, method name or key of it" misstates what the topic does. It names method families and no specific method of the section.

## Declined to judge

- Whether the full-mode comparison should run on an input whose `RESULTS.md` forbids a write-up of its own numbers (3.4): Axel's call under open item P.
- Which reading of "The same lines to every side" against D38 governs the revision `paper` side's first reply (item 4, first point): Axel's call between two rulings.
- Whether the four single-mode runs go on one copy or fresh copies (item 7): a choice Axel would see.
- Whether `--restricted` keeps `~/.claude/CLAUDE.md` and `~/.claude/rules/*.md` loaded for a judge: not settled by `claude --help`'s text, only by a judge run's `instructions` attachment, which this check could not start.
- The global `CLAUDE.md` that every side and judge loads names "the `academic-paper` or `paper` skill". `docs/dev/blind-comparison.md` item 4 asks both that the judge load the user's global instructions and that it receive "no skill name". The brief follows the page, and the page's two requirements meet here. Whether to change the page is outside this step.
- A binary output stays in the temporary scratchpad and is named by `shasum -a 256` (item 9) because the verify list's character-set check runs over every tracked file. Whether that meets the page's item 9 ("the two outputs as judged") is left to the reading of the page.

Agent usage: a988d4d9e4f90bf1e, claude-opus-5-5, 234954 tokens, 61 tool uses, 12.4 min.

## Closed

Each finding is closed by a change to the brief `agents/briefs/5.md`, made before the preparation commit.

- 2.1 and 5 (C12, the step line's check): "What to build" makes a win or a tie part of done, raises a loss, a missing call, an entry that does not resolve and a stop outside the list to Axel as open items, and says the step is not done while one stands; case C15 checks the call.
- 3.1 and 4.3: "What is on the tree" names the three skill folders and that step 3's process loaded `paper` from `~/.claude-backup/skills/paper`; C4 reads the `Base directory for this skill:` line of each transcript and `readlink`s that folder.
- 3.2: the rulings list names "The revision comparison's first stops" with its words; item 4 sends the revision `paper` side that line at its first stop whatever its questions are; Decision 6 says so.
- 3.3: item 5 names the 60 entries the section cites, of the 72 of `refs.bib`, and "What is on the tree" gives the count's command.
- 3.4: "What is on the tree" states `RESULTS.md:3`, the ICD result files and `README.md:63`; Decision 4 keeps the input as open item P rules it, since a change would replace that ruling, and says both sides and the judges meet the same text.
- 4.1 and C3: item 3 commits `code/` as the revision copy's second commit before the resume, and C3 checks `code/` against a fresh archive.
- 4.2 and C6: C6's pattern also names `writing skill`, `revision-round<n>`, `.patched`, `checks.md`, `config.md`, `items.md`, `ars_` names, `<name>_agent`, `plan.yaml`, `W<k>`, `F<k>` and `D<n>-<m>`; item 5 leaves the setup files `.agents/plan.yaml` and `.claude/` out of the judge's copy.
- 4.4 and C8: item 6 resolves each entry by its title with `--year`, and an entry resolves at a `ratio` of 0.70 or more with the entry's DOI where it has one; C8 says the same.
- 4.5: case C14 checks each judge's `instructions` attachment, and a judge without the global instructions is raised to Axel before its verdict is used.
- 5, C9: C9 reads each question for whether its recommendation follows from the run's goal, covers the turns before the two lines reached the side, and raises a stop outside the list or such a question to Axel.
- 5, C10: C10 checks that each accepted finding is applied or listed as not applied, and item 8 says the same.
- 5, item 4, revision parity: Decision 6 takes reading (a), since the ruling names the `paper` sides of step 5 and their next stop, and the record says that the academic-paper revision side never got the lines because its run had ended.
- 5, item 4, the orchestrator's classification: item 4 has the record name each stop answered with the two lines and the recommendation it held.
- 5, item 4, the end-of-run reply: item 4 and Decision 7 end each run at its final message on both sides, with no reply to an offer, as step 3's academic-paper side; the findings are applied only in item 8.
- 5, item 7: item 7 runs each single-mode run on its own fresh copy, item 8 on a fifth, and Decision 9 says why.
- 5, item 3: item 3 prefixes every side and run command with `env CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS=0`, and "What is on the tree" says why.
- 7.1: "What is on the tree" names ADR 0013.
- 8.1: the `RESULTS.md:144` clause becomes ", then draft the paper.", which names no skill; held: it breaks no rule of the prose standard or of `docs/dev/blind-comparison.md` item 4.
- 8.2: Decision 1 says the topic names method families and no paper, author, key or specific method of the section.
- 3, the `claude --help` source: the premise names `claude --help` (2.1.325) itself.
- Dictated lines added after the check, each held: `git add code && git commit -q -m code` (a command, holds); the prefix `env CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS=0` (holds); C6's pattern (read whole, holds); `python3 skills/paper/templates/lookup.py resolve '<the entry's title>' --year <its year>` (holds, the form of `lookup.py`'s head comment).
