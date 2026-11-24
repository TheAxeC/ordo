Brief check: step 4 of roadmap entry 25, `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/4.md`

I read everything at ed4e961. During the check, main moved to 1a99aed ("Land step 1 of roadmap entry 25: the project rules"). `git diff --stat ed4e961 1a99aed` lists only ledger files, `docs/dev/change-standard.md`, `skills/orchestration/plan-orchestration/SKILL.md` and three templates of `skills/ordo/ordo-init/`. None of them is a path this step writes or a premise it rests on.

## 1. Names

Commands, run from the repository root, with `.scratch` excluded:
`git grep -n -I -- "<p>" -- . ':!.scratch'` for each of `twenty-one`, `21 skills`, `twenty one`, `submit\.svg`, `skills/academic/submit`, `academic/submit`, `You submit`, `You resubmit`, `four group folders`, `academic/referee`, `referee\.svg`; `git grep -n -I -w 'referee' -- utils agents skills/ordo docs/dev docs/figures/gen_figures.py docs/glossary.md docs/plan.yaml skills/orchestration skills/code`; `git grep -c -I -w 'submit' -- utils agents docs/dev skills/ordo skills/orchestration skills/code README.md docs/glossary.md`; `grep -rln --include='*.py' --include='*.sh' -E 'SKILL\.md|skills/' utils skills docs`.

Output:
- `twenty-one`: README.md:35 and README.md:171. `21 skills`, `twenty one`, `submit\.svg`, `skills/academic/submit`, `academic/submit`: no hits.
- `You submit` and `You resubmit`: README.md:118 (the alt text of the lifecycle figure), docs/figures/gen_figures.py:1730 and :1748, docs/figures/paper/lifecycle.svg:1, :2, :45 and :72, docs/adr/0049 (line 18) and docs/roadmap.md:34.
- `four group folders`: README.md:35.
- `academic/referee`: README.md:160, docs/glossary.md:161 and :164, docs/roadmap.md:78.
- `referee` across utils, agents, skills/ordo, docs/dev: only docs/dev/building.md:40 and docs/dev/scripts.md:9.
- `-w submit` outside docs/adr and docs/roadmap.md: README.md:1 count, line 32 ("submitted").
- Scripts that read skill folders: only `utils/pin.sh`, `utils/pin.test.sh` and `docs/figures/gen_figures.py`.

Hits outside the brief's "Paths this step writes":
- docs/figures/paper/lifecycle.svg lines 1, 2, 45 and 72: generated, and the brief lists the file. Not false after the regeneration.
- docs/adr/0049 and docs/roadmap.md:34, :78: the brief says to leave them. They are not made false.
- docs/glossary.md:161 and :164: the referee entries. Not made false.
- utils/pin.sh and utils/pin.test.sh: `pin.sh` finds skills by a SKILL.md in a folder (pin.sh lines 21 to 25) and holds no skill list or count. The test builds scratch skills alpha, beta and gamma. Neither is made false.
- skills/ordo/ordo-help/SKILL.md lines 3, 10, 19 and 42: `/ordo-help skills` reads "the SKILL.md of each skill folder" when it runs. It holds no list or count and is not made false.
- agents/: no hit.

Hits inside the listed paths that the brief's items do not name:
- README.md:133 is a list of skills that start agents: "`writing`, `code-comments`, `codebase-design`, `paper`, `paper-review-panel`, `referee` and `grant` start every agent on the runner's default agent with the runner's defaults." `submit` starts the sheet agent, so this list becomes incomplete. Item 5 does not name the line. Item 6's grep for "`referee` as a list member" may find it, but the brief never says which agent, model or effort the sheet agent runs on (see 4), so the builder cannot tell whether `submit` belongs in that sentence.
- README.md:118 is the alt text of the lifecycle figure: "... | You submit: Write the highlights; Describe a graphical abstract | ... | You resubmit: A response you wrote yourself ...". The change to the labels makes it false. Item 5 does not name it, though item 6's grep for `You submit` across README.md does reach it.
- docs/figures/gen_figures.py lines 1 to 40, the module docstring, list every figure the script writes ("- referee.svg: the agents and stops ..."). Without a `submit.svg` line it becomes false. Item 4 does not name the docstring, and change-standard rule 14 requires it.
- README.md: both lines 35 and 171 hold "twenty-one". The premise names only the line "below" the install block. Item 5's "the count raised by one" and verify 5 (`grep -n 'twenty-one' README.md` prints nothing) cover both lines.

Every place that lists every skill or counts them, and whether the brief names it:
- The README table: named (item 5).
- The README group sentence on line 35: named.
- The README install loop on line 160: named.
- The README count on lines 35 and 171: named.
- The README sentence on line 74 about skills with a figure: named.
- The README sentence on line 133 about skills that start agents: not named.
- docs/dev/building.md:40 and docs/dev/scripts.md:9, which list the figures: named.
- The docstring of gen_figures.py: not named.
- utils/pin.sh and skills/ordo/ordo-help: they hold no list or count, and need none.
- No test counts skills.

Shared path: step 5 also changes README.md lines 35 and 171 (the count, and "four group folders" once `skills/explain/` exists). "Raised by one" is right only against this step's own base. The plan's "Could run in parallel" section leaves this to the orchestrator at dispatch.

## 2. The step line

Each part of plan.md's step 4 line, and the requirement that serves it:
- "`skills/academic/submit/` holds the skill of rulings D6, D10 and D16 and ADR 0049": item 1.
- "the page of the agent that writes the submission sheet": item 2, and item 1's sheet step.
- "the user's approval of the sheet": item 1, the approval step.
- "the walk the session makes through the browser extension": item 1, the walk step.
- "what the walk never does": item 1's bullet of that name, and its Rules bullet.
- "the stop before the final submit": item 1's bullet of that name, and its Stops row.
- "with its figure under `docs/figures/`": item 4.
- "its row and its place in the group sentence of `README.md`": item 5.
- "`/submit` named at 'You submit' and 'You resubmit' of lifecycle.svg": item 4.
- The check "`python3 docs/figures/gen_figures.py` runs": verify 1, and the case of that command.
- The check "the user reads lifecycle.svg": the user does this at landing, so the brief cannot assign it. That is correct.
- The check "the skill's text is read against ADR 0049 item by item": verify 6.

Every part of the step line has a requirement. Requirements the line does not ask for are items 3, 5 (beyond the row and the group sentence) and 6. Each of them carries the change to other places (rule 14). None of them goes beyond the line.

## 3. Premises

Commands, rerun at ed4e961 with the outputs as printed above where not quoted:
- `ls skills/academic` printed `grant paper paper-review-panel referee writing`. Holds.
- `ls skills/academic/referee skills/academic/referee/agents` printed `agents references SKILL.md templates` and `new_issue_agent.md referee_agent.md rule_check_agent.md`. Holds.
- `grep -n 'referee\|twenty-one\|four group folders' README.md` hit lines 32, 35, 74, 82, 94, 118, 133, 160 and 171. The premise holds, with two corrections:
  - "twenty-one skills" is on line 35 as well as on line 171.
  - The hits include line 133 and line 118, which the premise does not mention (see 1).
- `grep -n 'You submit\|You resubmit\|referee' docs/figures/gen_figures.py` hit lines 14, 1431, 1730, 1742, 1748, 1922 to 1978 and 2310 (`("referee.svg", referee()),`). Holds. Line 14 is the docstring entry the brief does not name.
- `grep -n 'referee.svg' docs/dev/building.md docs/dev/scripts.md` hit building.md:40 and scripts.md:9. Holds.
- `grep -n -i 'submission guide\|run folder' skills/academic/paper/SKILL.md | head` hit lines 87, 164, 166, 168, 171, 174, 182, 209, 212 and 235, all about the run folder. None mentions a submission guide, so the premise about "its journal submission guide" is not shown by its own command.
  - `grep -rn -i 'submission guide' skills/academic/paper` finds `skills/academic/paper/references/journal_submission_guide.md`, a reference page of the `paper` skill: a pre-submission checklist, a cover letter template, CRediT, data statements and AI disclosure templates.
  - That page lives in the skill's folder. It never lives in the user's folder. "When they are there", in the brief and in the ADR, treats it as part of a folder's material, and the brief does not say whether the sheet agent reads `paper`'s reference page or what it reads it for.
  - Line 166 says "The run folder is `paper-runs/<mode>-<date>/` in the parent of the manuscript's folder". A folder can therefore hold several run folders, and the brief does not say which one is read (for example, the latest format-convert run).
- `grep -n 'grant-fields.md\|funder config' skills/academic/grant/SKILL.md | head` hit lines 3, 10, 15, 17, 19, 38, 44, 46, 67 and 68. Holds. The places are: the funder config is "the one `.md` file in `grant-config/` in the application's folder" (line 38), and `grant-fields.md` is "beside the main `.tex`" (line 44). The brief gives neither place.
- ADR 0049: `cat docs/adr/0049-*.md`. The brief's account of the decision and its six bullets matches the record.
- ADR 0005: wrong. `cat docs/adr/0005-*.md` shows the title "The choices of every plan go to one file at the ledger root". Its decision is about `<ledger_root>/choices.md`. "A rule is written once, on the page that holds its kind" is not ADR 0005. `grep -ln -i 'written once\|page that holds its kind' docs/adr/*.md docs/dev/*.md ...` finds only `docs/dev/skill-layout.md`, whose section "Where a rule goes" says "A rule is written once."
- Rulings D6, D10 and D16: `cat` of plan.md. The texts and the user's quoted words match.
- The "Read first" line points to "the Python coding standard under `docs/dev/coding-standards/`". `ls docs/dev/ docs/dev/coding-standards` printed "ls: docs/dev/coding-standards: No such file or directory". The page is `skills/ordo/ordo-init/templates/docs/dev/coding-standards/python.md`, and `docs/plan.yaml` line 15's `standards` does not list it.

## 4. Cases and checks

Cases inconsistent with the rules file or the standards:
- "`python3 docs/figures/gen_figures.py` ... `git status --short docs/figures` lists `submit.svg` and `paper/lifecycle.svg` only". The expected result is wrong. Item 4 changes `docs/figures/gen_figures.py`, so the status also lists it. Verify 1 itself expects "`submit.svg`, `paper/lifecycle.svg` and `gen_figures.py` only". The case and verify 1 contradict each other. Under the brief's own hand-back clause, a builder applying the case as written stops on it.
- "The same with the extension not connected: ... the run stops with that reason". Item 1's Stops bullet files "the extension not connected" under "the refusals". docs/glossary.md:101 defines a refusal as "a skill's end without a decision for the user. It names its cause and leaves nothing". This run leaves the sheet, so it is not a refusal in the glossary's sense. skill-layout "Writing for an agent" allows a glossary term only in a sense the glossary defines.
- "A declaration of no conflict of interest that the folder does not settle: proposed in the sheet with what it rests on, or left as a question". Item 1 holds two rules that collide here: "A value the folder does not hold is left empty and listed as a question" and "A declaration is always proposed". The case accepts either result, so it cannot fail, and the brief does not say which rule wins.
- Change-standard rule 15 ("Each place where a supplied value reaches a command, a path or generated text is a case") has no case for:
  - the URL the user gives, which reaches the browser and the agent's reads: a non-web scheme, or a link from an instruction page that leaves the portal's site;
  - text on a portal page that the sheet agent or the session reads as instructions instead of data.
  The two refusal cases cover only a missing URL and a missing folder.
- Item 1 says "reads each filled page back against the sheet", and the closing message lists "each difference the read-back found". No case or requirement says what the session does on a difference. If it fills the field again, that is a repeat with no count, which skill-layout "Writing for an agent" forbids. If it only reports the difference, the brief should say so.
- ADR 0049's Consequences say "A portal that needs a file the folder lacks, such as a PDF of a Word document, gets it from the user, since the skills export no Word document". There is no case and no requirement for a file to upload that the folder lacks, or for a Word-to-PDF conversion. The empty-value rule of item 1 speaks of values, not files.

Cases that ask the builder to check or explain a place the step does not change: none. Every reading case is about the new skill, and both commands are about files the step writes.

The two command cases, rerun on the unchanged tree. To keep the main checkout unchanged, I copied `docs/figures` into the scratchpad and ran the script there:
- `cp -R docs/figures <scratch>/docs/; cd <scratch> && python3 -I docs/figures/gen_figures.py; echo "exit $?"` printed 23 lines from "wrote docs/figures/pipeline.svg (21941 bytes)" to "wrote docs/figures/paper/run-folder.svg (21112 bytes)", then `exit 0`.
- `diff -rq <repo>/docs/figures <scratch>/docs/figures` printed nothing (exit 0), so the script reproduces the committed figures byte for byte.
- `git status --short docs/figures` printed nothing.
- `grep -c '/submit' docs/figures/paper/lifecycle.svg` printed `0`, exit 1.

## 5. The question

The goal is the part of the plan's goal step 4 delivers: `/submit <url> [<folder>]` writes a sheet, the user approves it, the session fills the forms through the extension and stops before the final submit, and lifecycle.svg names the skill.

- Every reading case (the paper folder, no extension, a missing field, sign-in, copyright, payment, the final submit, the declaration, the funder portal, the registration form, the refusals): yes, each could pass without the goal being reached. Reading shows only that the text says it, not that a walk works on a portal. Step 6's runs settle that, as plan.md already answers for step 4.
- The case of the figure script: yes. Exit 0 and the status list hold with any content in `submit.svg` and any label in lifecycle.svg. Whether the figure is right is decided by reading.
- `grep -c '/submit' ... lifecycle.svg` 2 or more: yes, and it passes even if half of its own requirement is missing.
  - `grep -c` counts lines, and lines 1 (aria-label) and 2 (`<title>`) each hold the whole label of the figure.
  - `grep -c 'You submit' docs/figures/paper/lifecycle.svg` prints `3` today.
  - So one mention of `/submit`, at "You submit" alone, gives 3 or more, and the case passes with "You resubmit" not naming the skill.
- The check on the step's line (the script runs, the user reads lifecycle.svg, the text read against ADR 0049): yes, for the reason plan.md gives. It is text and a figure, and step 6 is the proof.
- Verify 1: yes, as for the figure case.
- Verify 2, the character set: yes. It is a fact only.
- Verify 3, the frontmatter: yes. It checks the name, the length and the version only.
- Verify 4, `utils/pin.test.sh`: yes. The test pins scratch skills alpha, beta and gamma (pin.test.sh lines 108 to 140) and never reads the new skill, so it shows nothing about this step.
- Verify 5: yes. It passes when only the install loop names `academic/submit`, and with a wrong count in place of "twenty-one".
- Verify 6 and 7: yes. They are readings of text.
- Item 1, SKILL.md: yes, text only, and step 6 is the proof.
- Item 2, the agent page: yes, for the same reason.
- Item 3, the template: yes, for the same reason.
- Item 4, the figure: yes. It is drawn, and read by the user.
- Item 5, the README and the dev pages: yes. It is text.
- Item 6, the greps: yes. It is a search, and it leaves README:133 open (see 1).

## 6. ADRs

I read every `docs/adr/NNNN-*.md` for its part in force: `docs/adr/0*.md` with each Decision section extracted to the scratchpad and read.

ADRs the step touches, with the sentence of the decision the step is under:
- 0049, governing: "`submit` is one skill, `/submit <url> [<folder>]`, and neither `paper` nor `grant` has a mode for it." and its six bullets. The brief names it.
- 0044: "it is saved beside the application, named by funder, programme and call year. Every other mode reads the config from there." This governs where `submit` finds the funder config. The brief does not name it and gives no place (grant SKILL.md:38 says `grant-config/` in the application's folder).
- 0020: "A `paper` run writes its records to `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder". This governs where `submit` finds `paper`'s run folder. The brief does not name it.
- 0005 is named by the brief for a sentence it does not hold (see 3). It does not touch the step.
- 0043 ("paper stays at twelve modes") is upheld by item 6's "paper and grant get no mode". The step changes no file of `paper`, so 0043 is not touched.

The brief held against ADR 0049, bullet by bullet:
- **The decision line.** It holds. The brief adds "the folder defaulting to the current one", which is consistent with `[<folder>]`.
- **Bullet 1**, the sheet agent: "A fresh agent writes the submission sheet: every field the portal asks for ... It reads the portal's forms for what is asked". The brief's decision 1 narrows this to "only what the portal shows without signing in, the page at the URL and the instruction pages it links", and moves the forms behind a sign-in to the walk as "a field the sheet lacks".
  - The forms of most journal and funder portals stand behind a sign-in. For those portals the sheet approved before the walk holds only the fields of the public pages, and "every field the portal asks for" is not met at the approval.
  - The two ADR sentences are in tension for any portal with a sign-in. Reading the forms needs a browser session, and "The user approves the sheet before the browser is touched" forbids one before the approval.
  - The brief resolves the tension itself, as a "reversible" decision of the brief. `docs/adr/README.md` says "A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on." A narrowing of bullet 1 is the user's ruling to make, not the brief's.
  - Decision 1 also leaves open the tool the sheet agent reads the portal with. Through the browser extension, the browser is touched before the approval, which contradicts bullet 2. Through a web fetch, a portal that renders with scripts may return little, and the brief does not say which tool to use.
  - The brief also does not say which agent, model or effort the sheet agent starts on. `referee` SKILL.md:252 states this ("starts fresh on the runner's general-purpose agent, with the runner's defaults"), and README:133 depends on it.
- **Bullet 2**, "The user approves the sheet before the browser is touched." It holds as written ("Nothing is typed into the portal before the approval"). The brief adds that a field found during the walk is answered "as a change to the sheet". That is consistent with bullet 3.
- **Bullet 3**, the session fills what the sheet holds, and a missing field becomes a question. It holds. The brief adds the read-back of each page. It is consistent with the bullet, but it has no action or count on a difference (see 4).
- **Bullet 4**, never a password, a licence, a copyright transfer, a payment or the final submit. It holds. The brief adds "or any other credential", and "a page that ... cannot be passed without it is a stop". Both widen the bullet and are consistent with it.
- **Bullet 5**, "Without the extension connected, the skill writes the sheet and stops." It holds in item 1 ("writes the sheet, shows it, says that the extension is not connected and stops"). The Stops bullet then names it a refusal, against the glossary (see 4).
- **Bullet 6**, lifecycle.svg. It holds in item 4.
- **The Consequences sentence** on a file the folder lacks, "such as a PDF of a Word document, gets it from the user": the brief does not carry it (see 4).

Against the rulings:
- D6: the brief matches it, except that bullet 1 is narrowed as above. D6 and the ADR say the same.
- D10: "which reads the portal's forms for what is asked and the folder for the material". The brief's decision 1 narrows this in the same way as bullet 1.
- D16 (`skills/academic/submit/`): it holds.

Additions the brief makes that no ADR or ruling holds:
- Decision 2, the run folder `submit/` under the folder named. Its name is fixed, so a second run in the same folder overwrites the first run's `submission-sheet.md` and `walk.md`. A second run is expected, since the lifecycle names `/submit` at "You resubmit". The brief does not say what happens when `submit/` already exists. The other skills name their run folders `<skill>-runs/` (`paper-runs/<mode>-<date>/`, `grant-runs/<mode>-<date>/`, `referee-runs/`).
- Decision 3, the read-back, which is consistent with the ADR.

ADRs the step touches that the brief does not name: 0044 and 0020, for where the material is found.

## 7. Dictated text

The brief dictates no prose word for word for a file. The only exact strings it gives are:
- the invocation `/submit <url> [<folder>]`: it holds (ADR 0049);
- `version 1.0.0`: it holds; `skills/academic/referee/SKILL.md` frontmatter shows `version: "1.0.0"` for a new skill;
- the file names `SKILL.md`, `agents/sheet_agent.md`, `templates/submission-sheet.md`, `submission-sheet.md` and `walk.md`, and the run folder `submit/`: they hold against skill-layout "Paths and names". `submit/` is open on its own grounds (see 6).
- the labels "You submit" and "You resubmit": these are existing labels, and the brief does not dictate their new words.

## 8. The layout

Command: `cat docs/dev/skill-layout.md`, with `grep -n 'disable-model-invocation' skills/*/*/SKILL.md` printing only `skills/ordo/wait-what/SKILL.md:6:disable-model-invocation: true`.

What a new skill must hold that the brief does not ask for:
- Sections: "Sections, in order" requires `# <Title>` with one paragraph, `## Quick start`, `## Use instead`, `## What it reads`, `## Steps`, `## Stops`, `## Anti-patterns` and `## Rules`. The brief says "in the layout of `docs/dev/skill-layout.md`" and names Stops and Rules. It does not name Use instead (the neighbours `paper` format-convert, `grant` and `wizard`), What it reads or Anti-patterns. They are covered only through the general pointer.
- Steps form: "one action per item", and each item "ends on its completion criterion". Item 1 lists "What the walk never does" among "Its steps", but it is a prohibition, not an action. Item 1 also states "the sheet as approved is the only source of what is typed" both in the approval step and in Rules. "Where a rule goes" says "A rule is written once. Another place that needs it names the section it is in."
- Frontmatter: `disable-model-invocation: true` is optional, carried "when only the user may invoke it, since only the user knows when the skill is due". The brief does not decide it for a skill that fills portals in the user's name.
- Rule inventory: skill-layout has none for a new skill. Its section "A rewrite of a skill" applies only to a rewrite.
- Glossary: "A skill that needs a new term, or a term in a new sense, adds or changes its entry". The skill brings new terms: "submission sheet", "the walk", and possibly "declaration". `docs/glossary.md` is not in "Paths this step writes", and its own-terms part already holds skill terms such as "funder config" (line 154). The brief's report asks only to list terms.
- Repeat counts ("Writing for an agent"): the read-back of item 1 has no stated action or count (see 4).
- Check scripts that read skill folders: none needs a change. `grep -rln --include='*.py' --include='*.sh' -E 'SKILL\.md|skills/' utils skills docs` lists only `utils/pin.sh`, `utils/pin.test.sh` and `docs/figures/gen_figures.py`. pin.sh finds skills when it runs, and gen_figures is in the paths. The description-length command of skill-layout line 18 globs `skills/*/*/SKILL.md` when run and needs no change.

## Declined to judge

- Whether decision 1 of the brief, the public pages only before the approval, is the right reading of ADR 0049. It narrows bullet 1 and resolves its tension with bullet 2, so it is the user's ruling as a rule clash. I state the conflict and do not choose.
- Whether the sheet agent can use the browser extension's tools at all. I did not verify it, and the brief's choice of tool depends on it.
- Whether `submit` should carry `disable-model-invocation: true`. It is the user's call under the frontmatter rule.
- I did not run `sh utils/pin.test.sh` (verify 4). The task asked for the premises and the two command cases only, and the test does not read the new skill.
- The fit of each of the 13 cases to the final skill text, which does not exist yet.

Agent usage: af32ec4714532fb10, claude-opus-5-5, 162843 tokens, 37 tool uses, 6 min 58 s.

## Closed

- Names, the README sentence on the skills that start agents, the lifecycle figure's alt text, the docstring of `gen_figures.py`, the count on both lines: each is named in items 4 and 5, with the counts as they stand after step 5 landed.
- Premises, the journal submission guide: corrected; the material of a manuscript is its files and the latest `paper-runs/` folder, and of a grant application the file in `grant-config/` and `grant-fields.md`; ADRs 0020 and 0044 are named.
- Premises, ADR 0005 and the coding-standards path: replaced by the layout's "Where a rule goes"; the path is taken out.
- Cases, the figure case against verify 1: the case lists `gen_figures.py` too.
- Cases, the extension not connected as a refusal: it is a stop that leaves the sheet.
- Cases, a declaration the folder does not settle: it is a question; a declaration the folder settles is proposed with its passage; one case each.
- Cases, the URL and the text of a portal page: cases added for a URL that is no web address, a link that leaves the portal's site and a page whose text reads as an instruction.
- Cases, a difference at the read-back: it is reported in the closing message and the field is not filled again.
- Cases, a file the folder lacks: a question in the sheet; the skill converts no file.
- The question, `grep -c` on the lifecycle figure: replaced by a grep of the two labels in the figure script.
- ADRs, bullet 1 against bullet 2 of ADR 0049: ruled by the user, ruling C, option 1: the sheet from the public pages and the folder, the rest as questions during the walk, the browser not opened before the approval. The agent reads with the fetch tool and starts on the runner's general-purpose agent.
- Additions, the run folder: `submit-runs/<YYYY-MM-DD>/`, and a folder of that date that exists is a stop.
- The layout: the sections are named in item 1; what the session never does stands once, in Rules; `disable-model-invocation: true` is a decision of the brief; the terms **submission sheet** and **walk** enter the glossary.
