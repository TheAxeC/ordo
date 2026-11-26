# Step 7 brief check (on main at d5acc5e)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/7.md`. A page this report cites is named by its section. A line of code or a grep hit keeps its `file:line`. Paths: the brief is `/Users/axelfaes/workspace/ordo/.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/briefs/7.md`; the target is `/Users/axelfaes/workspace/research-hub/README.md`.

## 1. Names

Command (from research-hub, run once per name): `grep -rnF -- "<name>" README.md CLAUDE.md CONTEXT.md .oculus docs .claude`, for each of `what+why`, `Dead-ends (do not retry)`, `What it is and why`, `Method and related work`, `Results and how to reproduce`, `depositignore`, `The private README`, `one private human doc`, `too long to read`, `Project layout and tiers`. I also ran `grep -rnE 'what\+why|results\+reproduce|Method and related work|Dead-ends \(do|depositignore|run_all|One private|one private' docs CONTEXT.md .oculus` and `grep -n 'notes/' README.md`. These are the hits outside the brief's paths (README lines 32, 59-71, 85, 93 and 98):

- `CLAUDE.md:88: A project carries ONE private `README.md` (what+why / results+reproduce / dead-ends / data / method+related-work / next), a lean `project.yml`, and the public `code/README.md` deposit root. The manuscript is the canonical method/results/related-work.` The change makes this false. It is the same six-section list that line 32 holds, and the brief replaces that list with the layout's. Under the standing demands the file cannot be written ("read only, except `research-hub/README.md` in step 7"), and the brief does not name it anywhere. Item 4 asks for a list of "each place where the hub's own text and researcher's layout still differ", but its premises and its line list cover README.md only.
- `README.md:38:   notes/               optional records: history/ (dated memos) | thesis/ (originating thesis) | derivations/ (scratch math)`. After the change this line is incomplete. Item 1.3 writes the layout's rule that a section past 200 lines moves to `notes/<slug>.md`, and this tree comment does not list those files. It is outside the paths.
- `README.md:79: ... A stranger with only `code/` reproduces each result with one documented command.` Once item 3 puts `data/` out of the deposit, a stranger holding only `code/` also has to obtain the raw inputs, so the sentence becomes inaccurate. It is outside the paths.
- `README.md:87`, `:97`, `:109` (`paper.py` as the entry point). Item 4 names these.
- `README.md:71`, the `NOVELTY*.md` loose-document rule ("folded into `README.md`"). This is inside the paths. The layout keeps novelty pages as files under `notes/`: project_layout.md "The tree" says `notes/ ... novelty pages`, and "The README" item 7 says the closest prior work "links the project's novelty pages". If the builder keeps every condition of the paragraph as item 1.2 says, the kept rule contradicts the layout, and item 1.3 does not name this conflict.
- `.oculus/config.yml:41-44`, `deposit: default_ignore: [attic/]` (used when no `.depositignore` exists). The change does not make this false, but it differs from the layout's deposit list and belongs in item 4's list.
- `.oculus/config.yml:57: { file: README.md, heading: "## Data", key: datasets, ... }`. This holds, since the layout keeps `## Data`. The Audit check depends on the README's Data section carrying the registry key, which is the old item 5 rule that "What to build" does not say to keep (see section 5).
- These hold: `CLAUDE.md:94`, `CLAUDE.md:96` (`## Next`), `CLAUDE.md:102`, `README.md:118-119`, `docs/RESEARCH-APPROACH.md:59`.
- These hold, and they contradict the brief's premise (section 3): `README.md:19`, `CLAUDE.md:81`, `CLAUDE.md:84`, `docs/RESEARCH-APPROACH.md:67`, `docs/AGENT-APPROACH.md:84`. All of them name `run_all.sh` as the hub's required entry point beside `paper.py`.

Findings:
- `CLAUDE.md:88` becomes false. The step cannot write it, and the brief does not name it. Change standard, rule 19, requires that a contradiction left behind be reported as a stop when the brief does not cover it. The brief should name the line in item 4's list for the user (or the orchestrator should raise it) instead of leaving it for the builder to discover.
- `README.md:38` and `README.md:79` become incomplete or inaccurate. Both are outside the paths, and the brief names neither.
- The `NOVELTY*.md` rule in line 71 conflicts with the layout's novelty pages under `notes/`. The brief does not name the conflict.

## 2. The step line

The step line: "The README section of `research-hub/README.md` names researcher's layout of ADR 0057, built by an agent in that repository and left uncommitted for the user; check: the user reads the changed section against ADR 0057 and approves (no commit in Ordo)".

- "The README section of research-hub/README.md names researcher's layout of ADR 0057": items 1 and 2 (the README layout), item 3 (the code README and the deposit), item 5 (style).
- "built by an agent in that repository": the brief's "Paths this step writes" and "What is on the tree", first bullet.
- "left uncommitted for the user": items 4 and 6 ("Nothing is committed in research-hub") and the Conventions' git limits.
- "check: the user reads the changed section against ADR 0057 and approves": item 6.
- "(no commit in Ordo)": item 6 and the case `git -C ... status --short`. Only the report is written, in the worktree.

Findings: none. Every part has a requirement.

## 3. Premises

- research-hub `git status --short README.md`: it printed nothing. This matches. `git status --short` lists ` M .oculus/notes/session.md`, the `sandpile-operator` files, `conformal-tensor-factors/project.yml` and its results JSON, and `hccnet-revision/code/hpc/wholecohort_tiny.slurm`. This matches "and others".
- Line 32 (`cat -n README.md`): `  README.md            the one private human doc: what+why | results+reproduce | dead-ends | data | method+related-work | next`. This matches.
- `### The private README.md` at lines 59-71: the heading is at 59, seven numbered sections at 63-69, and the paragraph at 71. This matches.
- Lines 83, 85, 93 and 98: these match the brief's text verbatim.
- `grep -n 'run_all\|paper.py' README.md` printed lines **19**, 87, 97, **98** and 109. Line 19 reads: "Every project's `code/` carries the two artifacts the reproducibility rule in `CLAUDE.md` requires: `run_all.sh` (or `code/hpc/run_all.sh` ...) regenerates the committed results from the raw inputs, and `paper.py` regenerates every figure and table". **This does not match.** The brief says the grep prints "lines 87, 97 and 109 ... and none naming `run_all.sh`". Line 98 also names `paper.py`, and line 98 is inside the paths.
- The ADR 0057 quotes (`cat -n docs/adr/0057-*.md`, Decision bullets 1-5): these match verbatim.
- D1 and D14 (plan.md Rulings): these match. Step 2 landed at d5acc5e (`git log -1 d5acc5e -- skills/academic/researcher/references/project_layout.md docs/adr/0057*`): this matches.
- project_layout.md sections "The README", "The code README", "The deposit" (14 pattern lines at 85-98) and "A README in the old layout": all present. This matches.
- "No ADR of this repository governs research-hub's README.md": `grep -lE 'research-hub|depositignore|run_all|code/README' docs/adr/[0-9]*.md` hits 0001-0044 only for the name `research-hub` as a source, plus 0053 and 0057. None governs the hub's README. This holds, but 0053 governs the code tree; see section 7.
- The verify list equals building.md: both hold 16 commands in the same order (`grep` of `docs/dev/building.md` lines 6-21, against `orchestrator-state.md` lines 7-23). This matches.
- `libraries: avoid`: orchestrator-state.md line 31. This matches.

Findings:
- The premise "none naming `run_all.sh`" is false. `README.md:19` names it as one of "the two artifacts the reproducibility rule in `CLAUDE.md` requires", and `CLAUDE.md:81` and `:84` require it. Decision 2 rests on this premise (see section 7).
- The grep also prints line 98, which the premise omits.

## 4. Cases and checks

- Case 1 (`git status --short README.md` empty, stop otherwise): consistent with change standard, "Read before changing anything" 1.
- Case 2 (the headings are the same after the change): consistent with rule 20.
- Case 3 (the section against ADR 0057 bullets 1-2): consistent.
- Case 4 (the coverage list, rules 17 and 18): consistent.
- Case 5 (lines 85 and 93 against bullet 4): consistent.
- Case 6 (`git diff --stat`, and the other files unchanged): consistent. A concurrent edit by the user to another file would show as a difference that is not the builder's. This is minor.
- Case 7 (`LC_ALL=C grep -n '[^ -~]' README.md`, with nothing added): consistent with the hub's "Writing docs" rules and the change standard's character set. The base prints nothing.
- Case 8 (`git -C /Users/axelfaes/workspace/ordo status --short` prints only the report under the ledger): **inconsistent with "Where the work happens".** The builder writes the report in the worktree's copy of the ledger ("Report"; "The step's worktree of this repository is where the report is written"). `git -C /Users/axelfaes/workspace/ordo` reads the main checkout, which holds no such report. That checkout now prints ` M .../orchestrator-state.md`, `?? .../agents/briefs/3.md` and `?? .../agents/briefs/7.md` (run in this check). The case asks the builder to check a place the step does not change, and it fails whatever the builder does.
- Verify 4 holds a research-hub file to Ordo's standards pages (the list-item and sentence-length rules of the prose standard, "D. Structure" and "E. Sentence shapes"). Item 5 holds the same file to the hub's `CLAUDE.md` "Writing docs". The two mostly agree. Where they differ (the prose standard, "0. Hard rules", allows arrows only in code, while the hub's "Writing docs" allows ASCII `->`), the brief does not say which governs. This is minor.

Findings:
- Case 8 checks the main checkout of Ordo, where the step writes nothing. It should read `git status --short` from the step's worktree root.

## 5. The question

- Case 1: no. It guards the base and does not show the goal; it cannot pass in place of the goal.
- Case 2: yes. It passes on an unchanged file. It is a scope guard and does not show the goal.
- Case 3: no for the README layout, since every section must be named in order. It does not check that the section calls the layout the hub's standard and names researcher as the writer (item 1's first clause).
- Case 4: yes, partly. Item 1.3 lets the builder mark an old rule as "replaced by the layout's rule", and item 1 asks for "what it holds in a short phrase". A builder can therefore drop the hub's per-section rules and call them replaced, and the coverage list still has a row for each. The rules at risk are the private-only status note in the title line (old item 1), the compute a result takes (local or HPC, dependencies, seed; old item 3), the cache recipe and the registry key of each dataset (old item 5, on which the Audit of `.oculus/config.yml:57` relies), and the Next list's paths, script names and open decisions (old item 7). The layout states none of these, so none of them is "replaced"; they are dropped. Item 1.2 lists the kept rules "each one" but leaves these out.
- Case 5: no for `data/`. It does not read line 85 for `figures/`, `attic/` and `results/`, which the base already holds.
- Case 6: yes. It shows only which files changed.
- Case 7: yes. It checks characters only.
- Case 8: not usable (see section 4).
- The step's check (the user reads against ADR 0057 and approves): no. The user's reading is the gate.
- Item 1: no as written, with the gap of case 4. Item 1.2 also lists "written for Axel resuming the project cold" as a kept rule, while the layout writes the README "for a newcomer who reads it from the top" (project_layout.md, "The README"; ADR 0057, Context). Item 1.3 resolves only the two differences it names, so the builder can keep the old audience and still pass, and the section then does not state the layout.
- Item 2: yes. No case reads line 32. Only the user's reading would catch a line 32 left in the old form.
- Item 3: yes for the line 98 bullet. No case reads the code README's sections against ADR 0057 bullet 3.
- Item 1.4 (the `/researcher readme` sentence): yes. No case reads it.
- Item 4: no. It lists differences and does not reach the goal itself.
- Item 5: no. Cases 7 and verify 2 check it.
- Item 6: no. This is the step's check.

Findings:
- Case 4 and item 1 can pass with the hub's per-section rules (registry key, cache recipe, compute, private-only status note, Next's pointers) dropped as "replaced". The brief should say whether these are kept beside the layout's phrase or listed for the user.
- Item 1.2 keeps "for Axel resuming the project cold" against the layout's newcomer audience, and item 1.3 does not name this difference.
- Items 2, 3 (line 98) and 1.4 have no case. Each could be left wrong and still pass the builder's cases.

## 6. Implied inputs

Not a code step. One implied input of the text change has happened, and getting it wrong costs something. The hub's text will tell the reader to run `/researcher readme <project folder>` (item 1.4), but the installed skill lacks that mode. `readlink -f ~/.claude/skills/researcher` gives `/Users/axelfaes/.local/share/ordo-stable/skills/academic/researcher`, and `grep -n 'readme'` over its `SKILL.md` printed nothing. The layout the hub's text names is also not the installed one until step 8 pins its tag. If the user approves and commits the hub's README before step 8, the README names a mode and a layout that the installed researcher does not have.

Findings: the brief does not name this. It belongs in item 4's list or in the open item of item 6, so the user knows to commit after step 8's pin or accepts the gap.

## 7. ADRs

The ADRs are the 59 records under `docs/adr/`, from `ls docs/adr/[0-9]*.md | wc -l`.

- 0057 touches the step and is named. The step is under Decision bullets 1-5, quoted in "What is on the tree", and bullet 4 includes "so that no dead end is published and every result is rebuilt by `run_all.sh`."
- 0053 touches the step and **is not named**. It is in force outside its superseded parts (Status: "superseded by 0056 in ... and by 0057 in the bullet "The project's `README.md` is its entry file" ..."). Its bullet in force reads: "The default layout for a new project is `code/` (with `run_all.sh`, `paper.py`, `core/`, `experiments/`, `hpc/`, `data/`, `results/`, `figures/`, `attic/` for dead ends kept runnable, and `.depositignore`), `manuscript/`, `admin/`, `notes/`, `reviews/` and `logs/`." This is the code tree that `### The code/ folder` restates.
- 0054 (idea mode writes `## Research questions and claims`): the hub's text names that section through 0057. The step is not under any sentence of 0054.
- The other 56 records do not touch the step. The grep hits in 0001-0044 are only the word `research-hub` as a source.

Decision 2 judged against ADR 0057 and the step line: its premise is wrong, and its scope reasoning does not match the brief's own scope.
- Premise: decision 2 says `paper.py` is "the hub's own convention" and that researcher's layout "names `run_all.sh`". In fact the hub's own rules name both. `README.md:19` reads "the two artifacts the reproducibility rule in `CLAUDE.md` requires: `run_all.sh` ... and `paper.py`". `CLAUDE.md:84` reads "Two artifacts, both must actually run clean". The layout also names both (project_layout.md "The tree"; ADR 0053). The difference sits only in the tree and bullets of `### The code/ folder` (lines 87 and 97), which leave out `run_all.sh` and call `paper.py` "the one entry point". Those lines contradict the hub's own CLAUDE.md as much as the layout.
- Scope: decision 2 calls the `code/` layout "outside 'the README section' the step changes", yet items 2 and 3 change lines 85, 93 and 98 of that same `### The code/ folder`. If line 85 carries ADR 0057's reason ("rebuilt by `run_all.sh`"), the tree two lines below still names no `run_all.sh`. That leaves a contradiction inside the file, which change standard, rule 19, forbids.
- My judgment: the better option is to widen the paths to lines 87 and 97 and add the `run_all.sh` line to the tree, which both the hub's CLAUDE.md and the layout require. Listing the difference for the user is the cheaper option and leaves a defect in place that the hub's own rules already settle. Line 109 (a check that runs `paper.py`) can stay as the hub's own deposit check.

Findings:
- The brief does not name ADR 0053, which governs the code tree the step partly changes.
- Decision 2 rests on the false premise of section 3. Keeping line 87 ("the one entry point") while changing lines 85 and 93 leaves `### The code/ folder` contradicting ADR 0057 bullet 4, ADR 0053's default layout and the hub's `CLAUDE.md:84`.

## 8. Dictated text

- "`None yet.`", the words of an empty section: `grep -n 'None yet\.' agents/briefs/7.md` gives line 38 (and 24, a premise quote). It holds: it is ADR 0057 bullet 2 and project_layout.md "The README".
- "`notes/<slug>.md`", the path a long section moves to: `grep -n 'notes/<slug>.md'` gives line 38. It holds.
- "(`data/`, `attic/`, `results/`, `figures/`, caches and secrets)", the words of line 85's exclusions: `grep -n 'caches and secrets'` gives line 41 (and 18 and 26, premise quotes). It holds: it is ADR 0057 bullet 4 and D16, in ASCII.
- "(ADR 0057 of Ordo, `skills/academic/researcher/references/project_layout.md`, "The README")", the citation the section carries: `grep -n '"The README")'` gives line 36. It holds. It cites the page by its section, not by a line ("Where the work happens"). It is written into the user's own repository, so the rule "A shipped file names nothing private" does not apply.

Findings: none.

## Declined to judge

- Which of the hub's per-section rules (registry key, cache recipe, compute, private-only status note) the user wants kept beside the layout: that is the user's call or the orchestrator's under self-rule. Section 5 names only that the brief leaves it open.
- Whether the hub's text should be committed before or after step 8's pin: the user's call.

Agent usage: a9a2fe5d909e6aec9, claude-opus-5-5, 128993 tokens, 25 tool uses, 4 min 22 s.

## Closed

- Names, the hub's `CLAUDE.md` line 88 and `.oculus/config.yml` lines 41-44: the step cannot write them (research-hub is read only except its `README.md`); "What is on the tree" names both, and item 4 has the report list each with the words that would bring it in line, for the user.
- Names, `README.md` lines 38 and 79: added to "Paths this step writes"; item 2 brings line 38's `notes/` comment to the layout, item 3 line 79's sentence to a stranger with `code/` and the raw inputs.
- Names, the `NOVELTY*.md` rule of line 71: item 1's second sub-bullet names it among the rules the layout replaces (novelty pages are files of `notes/` linked from `### The closest prior work`).
- Premises, "none naming `run_all.sh`": the premise now quotes lines 19, 87, 97, 98 and 109 and the hub's `CLAUDE.md` line 84; decision 2 is rewritten, and item 3 brings lines 87 and 97 to name both `run_all.sh` and `paper.py`, paths widened to lines 85-87 and 97-98; line 109 stays (item 4).
- Cases, case 8: it now runs `git status --short` from the step's worktree root.
- Cases, verify 4: it says the hub's "Writing docs" governs where it and Ordo's prose standard differ.
- The question, the hub's per-section details: item 1 gains a sub-bullet keeping the private-only status note, the compute of a result, each dataset's cache recipe and registry key, and the paths, script names and open decisions of `## Next`, beside the layout's phrase; decision 3 records it.
- The question, the reader: item 1 writes the layout's reader, a newcomer reading from the top, with Axel resuming the project cold named among them.
- The question, items 2, 3 and 1.4 without a case: four reading cases added (lines 32 and 38; the bullet `code/README.md`; the tree and the bullet `paper.py`; the `/researcher readme` sentence), and case 5 now reads every exclusion of line 85.
- Implied inputs, the installed researcher without the `readme` mode: "What is on the tree" records it, and item 6's open item says the hub's README is best committed after step 8's pin.
- ADRs, ADR 0053: named under "What is on the tree" with its bullet in force on the code tree.
- ADRs, decision 2: rewritten as in "Premises" above.
- Dictated text: no new dictated line was added; the words of line 85's exclusions and `None yet.` stand as checked.
