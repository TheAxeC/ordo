# The blind comparisons of step 5

Step 5, part 5 of the brief: the lit-review, revision and full comparisons of `paper` (the new side) against academic-paper 3.2.0 (the old side), each run as `docs/dev/blind-comparison.md` items 1 to 9 say. "paper" below is the `paper` side and "academic-paper" the academic-paper side; the judges saw neither name.

Every copy, side and judge lives under `gate5/` in the session's scratchpad (`/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/`), outside research-hub and this repository. The facts below come from the transcripts under `gate5/` and the session transcripts under `~/.claude/projects/`, read with `tools/facts.py` and `tools/audit.py` in the scratchpad. These two scripts, and `blind.py`, `mk-rules-full.py`, `to_charset.py`, `resolve_all.py` and `resolve_record.py` there, which did the blinding, the ledger copies' character conversion and the resolve, were written for this step with no approving ruling; they are open item BF in the state file, and the reviewer of step 5 reproduced their results with its own read-only commands (`5-refuter.md`, "Verification").

## Commands

- The `paper` side: `env CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS=0 claude -p --model opus --output-format stream-json --verbose --allowedTools Read Write Edit Bash Glob Grep Agent Skill WebSearch WebFetch --disallowedTools AskUserQuestion`, started in its copy, the request on stdin; the copy holds `.agents/plan.yaml` and loads `/Users/axelfaes/.claude/skills/paper`, the link to `~/.local/share/ordo-stable/skills/paper` at v8.4.0-rc.2.
- The academic-paper side: the same command with `--disable-slash-commands`, `--add-dir .claude/skills/academic-paper` and `--append-system-prompt "Your skill for this task is the file .claude/skills/academic-paper/SKILL.md in this folder. Read it whole first and follow it; the other files it names are in that folder."`, the skill copied from `../research-hub/.agents/skills/academic-paper/` (3.2.0) to `.claude/skills/academic-paper/` in the copy.
- A second turn of either side: the same command with `--resume <session id>` and the answer on stdin.
- Each judge: `claude -p --tools Read Glob Grep --disable-slash-commands --strict-mcp-config --model opus --output-format stream-json --verbose`, started in its copy, the prompt (`5-blind-comparison/<comparison>/judge-prompt.txt`) on stdin. The judges run without `--restricted` (`plan.md` Rulings, self-rule, choice C109), since `--restricted` loads no `instructions` attachment. The instruction files each judge used loaded, read from the `instructions` attachment of its transcript: `~/.claude/CLAUDE.md` and the rules files `invoke-the-skill.md`, `no-claim-without-a-command.md`, `no-breakage-testing.md`, `never-take-the-lazy-option.md`, `no-quick-answers.md`, `scripts-compute-facts.md` and `answers-reach-axel-in-full.md` under `~/.claude/rules/`, the same eight files each side's attachment lists.

## Answers to the sides

Each side ended its first turn at its intake questions. Each was answered once, the same words to both sides where their questions matched, `[GAP]` for a fact the user holds, and each answer ends with "From here on, do not stop for a choice whose recommendation you would take; take it and record it in config.md. I refuse to interact further." The questions and the answer of each side are in `5-blind-comparison/<comparison>/sides/<side>/intake-questions.md` and `intake-answer.md`; the revision academic-paper side's are in `3-blind-comparison.md`. No side stopped a second time. Each tool call of a side that names a path outside its copy is listed in `5-blind-comparison/outside-paths.md`.

## The stops of the `paper` sides (C9)

- Each `paper` side's first turn ended at the intake confirmation, a stop each mode lists in `skills/paper/SKILL.md` "Steps". Its questions are the rows of `references/intake.md`'s table marked for the mode, asked in one message as Steps 6 says; a row with a default or a proposal (lit-review Q1 to Q8; revision Q1, Q2, Q5 to Q8 and Q12 to Q15; full Q1 to Q5, Q10 to Q15, Q20, Q25 and Q27) is a field of that stop, confirmed with the others, and no question was asked outside it.
- The later stops each side reached, each taken under the answer's last sentence and written to its `config.md` under "Decisions", each a stop of its mode's list:
  - lit-review: the sources' review.
  - revision: a structural patch (patches 02 and 15), a claim the run cannot support (C4 to C18), and the reply to the closing `/writing` report, taken as the autonomous writer pass.
  - full: the sources' review, the outline's approval, the citation style to confirm, a structural patch (patches 04 and 07), a claim the run cannot support (C64 to C69), the draft review not passing (four times), and the reply to the closing `/writing` report, taken as the autonomous writer pass.
- The full side's planner took its decision 1, the faithfulness clause of the research question, as option A, which narrows the user's question; no stop of full's list covers it, and step 5.A adds the stop "A research question the materials do not answer" for it.
- The autonomous writer pass, taken by the revision and the full `paper` sides at the reply to the closing `/writing` report, applied the `/writing` findings inside the comparison (revision patch 15, full patch 26), and the judges judged the outputs with those patches; the brief's item 4 has the findings applied only in item 8. This is open item BD in the state file.

## Lit-review

- **Input.** The topic, in these words to both sides and both judges: "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on." No file.
- **Sides.**
  - `paper`: copy `lit-review-1`, request `/paper lit-review "<topic>"`, session 2437b798-7b3a-4983-af40-b118d712c8cf, served model claude-opus-5-5, no Skill call, 1 Agent call, one Monitor call denied, `modelUsage` claude-opus-5-5, 8 instruction files. Outside its copy it read the skill's files and used temporary folders. Output: 84 entries in its `refs.bib`.
  - academic-paper: copy `lit-review-2`, request "Run the skill in lit-review mode: review the literature on <topic>", session 14b8f695-255c-493e-9daf-a4d5c1dfb521, served model claude-opus-5-5, no Skill call, 10 Agent calls, denied a Monitor call and `mcp__claude_ai_PubMed__search_articles`, `modelUsage` claude-haiku-5-5 and claude-opus-5-5, 8 instruction files. It downloaded the Harshman 1970 working paper (`curl ... https://www.psychology.uwo.ca/faculty/harshman/wpppfac0.pdf -o h.pdf` into a temporary folder). Output: 147 entries in `phase7_formatting/references.bib`, an IEEE `.tex` and its PDF.
- **Removed from the judge's copy.** The judge's copy holds no input files. The two outputs were blinded as `5-blind-comparison/lit-review/blinding-log.txt` lists, each change with its rule; the rules are `tools/rules-lit.json`.
- **Copied into the judge's copy.** The page of each of the 65 URLs the outputs cite, under `outputs/pages/`, mapped in `5-blind-comparison/lit-review/pages-index.md`. The academic-paper side's PDF was rebuilt from the blinded `.tex` (pdflatex and bibtex, 0 errors, 72 pages), sha256 4f6a0dc1bc416787955b3106376b2dd38deb2491b8fb9d4dad28d79b6b25fa2c, in place of the side's own PDF, sha256 f603c8b38c30218e0bb189fdeb968d48edcfc5264725d09e0bfb9d7ff871b40e.
- **Outputs as judged.** `5-blind-comparison/lit-review/output-A/` and `output-B/` as the first judge received them, without the PDF, which stays in `gate5/judge-lit-review-1/outputs/output-A/output/`. The ledger copy of the `paper` side's `refs.bib` writes its en dashes as `<en dash>`, and the judges received that copy; the academic-paper side's files were already ASCII.
- **Key and order.** `python3 -c 'import random; print(random.choice(["new is A", "old is A"]))'` printed `old is A`. Judge 1: A is academic-paper, B is `paper`. Judge 2: A is `paper`, B is academic-paper.
- **Judges.**
  - `judge-lit-review-1`: session 4c88bbbe-abfa-44a2-a434-210cccde2f66, served model claude-opus-5-5, tools Glob, Grep and Read, no skill, `modelUsage` claude-opus-5-5, 8 instruction files, no read outside its copy, no denied call.
  - `judge-lit-review-2`: session b87c2685-342a-4295-92ee-c22757f33de0, the same in each of these facts.
  - Two earlier judgments with `--restricted`, kept as `judgment-1-restricted.md` and `judgment-2-restricted.md`, loaded no instruction files and are not used.
- **Verdicts.** `5-blind-comparison/lit-review/judgment-1.md`, "Verdict: A.", and `judgment-2.md`, "Verdict: B.". Read through the key, both chose academic-paper.
- Judge 1 counted the `<en dash>` names in the `paper` side's `refs.bib` against it; they come from the ledger copy, not from the side.

## Revision

- **Input.** dongho-ecg-clustering at research-hub f8c5e7176 (D18): `manuscript/` and `admin/reviews/`, and `code/` of research-hub f8c5e7176, which each side received after its first turn, committed in the `paper` side's copy as its second commit 4f6ae49. `diff -rq` of the judge's `manuscript/`, `admin/` and `code/` against the reference copies `ref-rev` and `ref-rev-code` prints nothing.
- **Sides.**
  - `paper`: copy `revision-1`, request `/paper revision manuscript/main.tex admin/reviews/reviewer-comments.md`, session 61d07524-839f-4974-9aa9-0892b1321db7, served model claude-opus-5-5, Skill call `writing` (the closing review), 16 Agent calls, no denied call, `modelUsage` claude-opus-5-5, 8 instruction files. Outside its copy it read the skill's files. `code/` is unchanged.
  - academic-paper: the output of step 3, kept under `agents/reviews/3-blind-comparison/revision/academic-paper-output/`, session 022ad776-b049-48f5-8777-3e8f2d48395e, its record in `3-blind-comparison.md`.
- **Removed from the judge's copy.** The sides' setup files `.agents/plan.yaml` and `.claude/`. The outputs were blinded as `5-blind-comparison/revision/blinding-log.txt` lists; the rules are `tools/rules-rev.json`.
- **Copied into the judge's copy.** The authors' public code repository the output's `code-facts.md` names, at commit 78472d352ac52268d313a686cbc321a960f135a4, under `sources/ecg-representation-clustering/`. `diff -rq` against `git archive` of that commit prints nothing. The page of each of the 77 URLs the outputs cite, under `outputs/pages/`, mapped in `5-blind-comparison/revision/pages-index.md`.
- **Outputs as judged.** `5-blind-comparison/revision/output-A/` and `output-B/`.
- **Key and order.** The order command printed `old is A`. Judge 1: A is academic-paper, B is `paper`. Judge 2: A is `paper`, B is academic-paper.
- **Judges.**
  - `judge-revision-1`: session ed32410c-c3ca-405a-a692-9a1bda34e184, served model claude-opus-5-5, tools Glob, Grep and Read, no skill, `modelUsage` claude-opus-5-5, 8 instruction files, no read outside its copy, no denied call.
  - `judge-revision-2`: session e853cd0b-1221-4c4c-9a51-336b6ab0cf54, the same in each of these facts.
- **Verdicts.** `judgment-1.md`, "Verdict: A.", and `judgment-2.md`, "Verdict: B, by a narrow margin.". Read through the key, both chose academic-paper.
- Judge 1 counts against the `paper` side that it wrote no response letter. The letter is `rebuttal`'s work under D1 and the ruling "The response letter stays in `rebuttal`" (`plan.md` Rulings), and the judges' prompt does not say so.
- The judges disagree on the `paper` side's sentence on model selection: judge 2 calls it invented, judge 1 grounds it in `code/experiments/arm_ecgfounder.py` lines 3 and 4.

## Full

- **Input.** bttn-incident-af at research-hub 4416e4236 (open item P): `code/`, `RESULTS.md` and `notes/`. `diff -rq` of the judge's `code/` and `notes/` against `ref-full` prints nothing.
- **Sides.**
  - `paper`: copy `full-1`, request `/paper full .`, session 92497cd0-9842-4ec3-a1dd-8ad7e3d375d7, served model claude-opus-5-5, Skill call `writing` (the closing review), 32 Agent calls, no denied call, `modelUsage` claude-opus-5-5, 8 instruction files. Outside its copy it read the skill's files, its own session's tool folders and temporary folders. It ran no code of the input; its three figures are copies of committed files under `code/results/` (equal sha256). It left its compile folders `compile-review6` to `compile-review8` in its run folder.
  - academic-paper: copy `full-2`, request "Run the skill in full mode: write the paper from this project's materials.", session dcd45d24-fd9d-43ff-8e84-d9333b731c7f, served model claude-opus-5-5, no Skill call, 12 Agent calls, denied `mcp__claude_ai_PubMed__lookup_article_by_citation` and `mcp__claude_ai_PubMed__search_articles`, `modelUsage` claude-haiku-5-5 and claude-opus-5-5, 8 instruction files. Its run ran `python3` 10 times against the answer's "do not run anything", read from its two transcripts: 2 in its first turn (one-liners reading the cohort files) and 8 in its second (CSV row counts over `cohort_icd_*.csv`, an arithmetic print, scripts rewriting its own records, a Markdown transform of `argument_blueprint.md`, and one start with empty input); its own `config.md` names two of them. It and wrote the folders `figprev/` and `figprev2/` in the session's scratchpad, outside its copy (5 commands). Output: `paper/final/manuscript.tex` with 50 `[GAP ...]` markers (`grep -o '\[GAP[^]]*\]' | wc -l`).
- **Removed from the judge's copy.** The sides' setup files `.agents/plan.yaml` and `.claude/`. `RESULTS.md` line 144: ", then draft via the `academic-paper` skill." became ", then draft the paper.", the rest of the line kept. The `paper` side's compile folders `run/compile-review6/` to `run/compile-review8/`, build copies and logs of the run's compiles that hold absolute paths of the copy; the manuscript files and every other file the side wrote are kept. The outputs were blinded as `5-blind-comparison/full/blinding-log.txt` lists; the rules are `tools/rules-full-p.json` and `tools/rules-full-q.json`, written by `tools/mk-rules-full.py`.
- **Copied into the judge's copy.** The page of each of the 170 URLs the outputs cite, under `outputs/pages/`, mapped in `5-blind-comparison/full/pages-index.md`, each fetch with curl exit 0. Set aside as no citation: 11 strings the URL search found that are API endpoint prefixes or line fragments cut off in block lists (`gate5/full-urls-dropped.txt`).
- **Outputs as judged.** `5-blind-comparison/full/output-A/` and `output-B/` as the first judge received them. The binary files, the `paper` side's three figures (each under `manuscript/figures/` and `run/figures/`), stay in `gate5/judge-full-1/outputs/output-A/`, named with their sha256 in `5-blind-comparison/full/binaries.txt`.
- **Key and order.** The order command printed `new is A`. Judge 1: A is `paper`, B is academic-paper. Judge 2: A is academic-paper, B is `paper`.
- **Judges.**
  - `judge-full-1`: session 5543808c-3499-4e1d-a7c7-e93e3c65c836, served model claude-opus-5-5, tools Glob, Grep and Read, no skill, `modelUsage` claude-opus-5-5, 8 instruction files, no read outside its copy, no denied call.
  - `judge-full-2`: session a78e814c-c670-489a-ab17-f1c770d2ce94, the same in each of these facts.
- **Verdicts.** `judgment-1.md`, "Verdict: A.", and `judgment-2.md`, "Verdict: B.". Read through the key, both chose `paper`.
- Both judges find the academic-paper side's results held at placeholders that need new runs, and both find against the `paper` side: the 819 rows of the one-year cohort with a P-wave duration near 29,600 ms left unreported; judge 2 also finds the clinical Cox comparator labelled as the logistic "clinical model", an unstructured abstract of about 330 words with no highlights, and figure text that contradicts the captions.

- **The first prompt's error, and two new judgments.** The first full prompt summed up the answers as "leave facts only the authors hold (authors, contributions, funding, competing interests, ethics wording) as marked placeholders"; the answers said no such "only", and both first judges read it that way (judge 1: placeholders "which the user had reserved for facts only the authors hold"; judge 2: "The user allowed placeholders only for author-held facts"). Two fresh judges were run on the same blinded outputs (`diff -rq` of each copy's outputs against the blinded outputs printed nothing) with `5-blind-comparison/full/judge-prompt-2.txt`, which quotes answers 1 to 15 and the instruction "Do not run anything ..." in the words both sides received (`diff` of answers 1 to 15 of the two sides' answer files prints nothing; the instruction differs only in its first letter's case and its number).
  - `judge-full-3`, the order of the first: session 5bc1019d-915c-42ec-9b5d-6b221b3c19b6, served model claude-opus-5-5, tools Glob, Grep and Read, no skill, `modelUsage` claude-opus-5-5, 8 instruction files, no read outside its copy, no denied call. `judgment-3.md`: "Verdict: A, by a narrow margin.", which is `paper`. It names what would reverse it: if the user's question with marked gaps was a hard requirement, the academic-paper side wins.
  - `judge-full-4`, the order of the second: session dabc4751-4401-4e4d-bf47-71c52179f2b4, the same in each of these facts. `judgment-4.md`: "Verdict: A", which is academic-paper, for keeping the user's research question that the `paper` side replaced without asking and for disclosing the covariate defect.
  - Read through the key, the two new verdicts differ, which item 7 of the page reads as a tie.

## The C6 hits that are no mark

`grep -rn -i -E '<the C6 pattern of the brief>'` over each judge's copy prints these, none a mark of a side:

- "F1" as the F1 score, in the outputs and the saved pages.
- `/paper` inside URLs and API paths: NeurIPS proceedings (`/paper_files/paper/...`), Semantic Scholar (`/graph/v1/paper/...`), JMLR (`/papers/...`).
- OpenAlex work ids `W<digits>` in the revision and lit-review outputs.
- `code/paper.py`, a file of the full and revision inputs.
- "ordo" inside `tensordot` in the full input's code, inside "Gordon" in saved pages of lit-review (`page-051.html`, `page-058.html`) and revision (`page-009.html`), and inside a base64 run in revision's `page-077.html`; `w0` a variable of `code/core/preprocess.py`; `w170` in the DOI `10.13026/8a4q-w170` (full `page-023.html`, `page-099.html`); `w72`, `w120`, `w144`, `w153` and `w316` in Springer image URLs (full `page-005.html`, `page-006.html`, `page-052.html`, `page-078.html`, `page-079.html`).
- "ars_" in `events__webinars_link_resources_navbar` (revision `page-056.html` to `page-062.html`).
- `# noqa` and `sup_acc_mean`-style names in the revision's `sources/` code.
- Page markup in the saved pages (`xmlns`, `href` and element ids such as `F1` and `F0002`). `grep -rl -i -E 'academic-paper|paper-runs|gate5|claude/skills'` over each copy's `outputs/pages/` prints no file.

## Axel's calls

- Lit-review: a loss (2026-11-15), as recommended; both judges chose academic-paper. Axel's words: "Open item 1: Agreed".
- Revision: a loss (2026-11-15), as recommended; both judges chose academic-paper, judge 2 for reasons other than the missing response letter, which is `rebuttal`'s work. Axel's words: "Open item 1: Agreed".
- Full: a tie (2026-11-15), as recommended; the first two judges chose `paper` under the prompt's error, and the two new judges differ read through the key. Step 5.A runs the full comparison again with the losses (ruling The full call). Axel's words: "(a)".
