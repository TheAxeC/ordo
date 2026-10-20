# Step 4 brief check (on main at f9a00ab)

The brief-check report on `.scratch/5-paper/agents/briefs/4.md`, the uncommitted copy on disk in the main checkout. Pages are cited by section. Grep hits keep their `file:line`. I wrote nothing: `git status --short` shows the same three entries as at the start, and I checked the figure outputs in memory (`PYTHONDONTWRITEBYTECODE=1 python3 -B -c ...`), with `ls docs/figures` unchanged before and after.

## 1. Names

- Removed pages (`integrity-verification.md`, `ethics.md`, `abstract.md`, `structure-architect.md`, `argument-builder.md`): `git grep -n -I -E 'integrity-verification|ethics\.md|references/abstract\.md|abstract\.md|structure-architect|argument-builder' -- ':!.scratch' ':!skills/paper' ':!docs/academic-coverage.md'` printed one hit: `docs/adr/0022-...md:22` ("... `references/integrity-verification.md` and `references/ethics.md` leave `skills/paper/` ..."). This is an ADR record, and the change makes it true. `git grep -c` over `.scratch` (archive excluded) also hits `briefs/2-round-1.md`, `briefs/2.md`, `reviews/2-brief-check.md`, `2-landing.md`, `2-refuter.md`, `2-report.md` and `plan.md`. These are ledger records and stay as they are.
- Removed role names ("integrity verification agent", "abstract agent", "structure architect", "argument builder", "integrity agent"): `git grep -n -I -i -F "<name>" -- ':!.scratch' ':!skills/paper' ':!docs/academic-coverage.md' ':!docs/adr'` printed nothing for any of them. Over `docs/adr`, hits are only in `0019-...md:7`, `:11` (superseded) and `0022-...md:7`, `:17`, `:18` (Context and Alternatives). All are records.
- Removed stops ("The findings to apply", "The ethics stop"): the same grep printed nothing outside the paths. In `docs/adr`, `0019-...md:11` (superseded) and `0014-...md:11` (`/code-comments`, a different sense) are records. In the ledger, `plan.md` holds them as records.
- The concept the step removes, "integrity record": `git grep -n -I -i -F 'integrity record' -- docs/adr skills/paper/templates docs/dev` printed:
  - `skills/paper/templates/lookup.py:14` (`lookup.py quote-check <integrity record> <file.bib> <folder>`), `:30`, `:32`, `:53`, `:68`, `:524`, `:528`, `:553`, `:611` ("the integrity record cites no key"), `:1233`;
  - `skills/paper/templates/lookup.test.sh:135`, `:476`, `:488`;
  - `docs/adr/0017-...md:11`, `docs/adr/0018-...md:11`, `:21`, `docs/adr/0020-...md:7`, `:11`.

  After the step, `paper` keeps no integrity record and `quote-check` reads only `citation-report.md`. The usage line, head comment and error text of `lookup.py` then name an input the skill no longer has. The brief puts the templates out of scope ("do not change"). 0018 is superseded. 0017 and 0020 are in force (see 7).
- "integrity check" and "ethics check": `git grep -n -I -i -F 'ethics check'` (and `'integrity check'`) outside the paths hits `docs/roadmap.md:87`, `:88`, entry 13. Both lines describe `researcher` and stay true.
- The figure script's scope (it gains a third figure, and a second script writes under `docs/figures/`): `git grep -n -I -i 'two figures\|two SVG\|gen_figures\|figures/' -- ':!.scratch'` hits:
  - `docs/dev/building.md:35`, outside the paths: "The figures under `docs/figures/` are written by `python3 docs/figures/gen_figures.py` and committed. A change to a skill's Stops table, to the sequence or to a skill name changes the labels in that script, which is then run again". The change makes both sentences false: `gen_comparison.py` writes the SVGs under `docs/figures/academic-paper-comparison/`, and a change to `paper`'s Stops table then changes labels in two scripts.
  - `docs/figures/gen_figures.py:700`, "in these two figures", is a label of `plan-loop.svg`. C13 keeps that file byte-equal, and the sentence stays true of the two loop figures.
  - `docs/dev/scripts.md:9` is in the paths.
- The description trigger "check the references and claims of a draft" and the claim "every claim rests on a passage read in the run": `git grep -n -I -F` hits only `skills/paper/SKILL.md:3`, `:10` and `README.md:28`, all in the paths.
- `planner.md`, `paper.svg`, `gen_comparison.py`, `academic-paper-comparison/`: `git grep -n -I -i planner -- ':!.scratch'` hits only `docs/adr/0022-...md:11`, a record that the change makes true. No hit for the others.
- The version moves from 1.0.0 to 2.0.0: `git grep -n -I -F '1.0.0' -- ':!.scratch'` has no hit that names `paper`.
- Role agents of `paper`: `agents/ordo-*.md:3`, `:6`, `.agents/plan.yaml:10`, `skills/plan/templates/plan.yaml:12`, `:27` and `orchestrator-state.md:14`, `:26` say "role agents of /paper". All stay true.

Findings:
1. `docs/dev/building.md:35` becomes false: its two sentences name `gen_figures.py` as the writer of every figure under `docs/figures/`. The file is not in "Paths this step writes", so a builder following the brief leaves it false, which breaks the rules file's rule 14.
2. `skills/paper/templates/lookup.py` (`:14`, `:30`, `:32`, `:53`, `:68`, `:611`, `:1233`) and `lookup.test.sh:488` name `quote-check`'s first argument and error text "integrity record", a record the rebuilt skill no longer writes. The brief declares the templates unchanged without checking them against D42 to D52, while the step line says "every file of the folder checked against them". A builder leaves the script's usage text naming an input `paper` does not have. The orchestrator decides between two fixes:
   - (a) a sentence in the brief that `citation-report.md` is the record `quote-check` takes;
   - (b) `lookup.py` and its test widened into the paths, which is a wording change of an error line that test L6 checks.
3. `docs/adr/0017-...md:11` and `docs/adr/0020-...md:11` name "the integrity record" in their Decisions, which are in force. See 7.

## 2. The step line

- "`skills/paper/` rebuilt to D42 to D52, every file of the folder checked against them": items 1 to 12 serve `SKILL.md` and `references/`. The `templates/` folder is excluded by the premise "The three scripts and their tests ... do not change", and no item checks it against the rulings (Names 2).
- "`SKILL.md` 2.0.0 with full, revision, lit-review, citation-check and disclosure as D43 to D50 rule": item 1.
- "outline-only done by the planner and abstract-only by the draft writer": item 1, the outline-only and abstract-only bullets.
- "'The stops of paper' kept": item 1 ("Decisions a run takes itself", the stops lists) and item 4.
- "a planner page in place of `references/structure-architect.md` and `references/argument-builder.md`": item 2.
- "`references/draft-writer.md` writing the abstract and the statements": item 3.
- "`references/peer-reviewer.md`": item 5.
- "`references/citation-compliance.md` holding the reading rules": item 6.
- "`references/ai-disclosure.md` without the model loop": item 7.
- "`references/intake.md` and `references/literature-strategist.md` changed as the rulings reach them": items 4 and 8.
- "`abstract.md`, `integrity-verification.md` and `ethics.md` removed": item 11.
- "the rows of `docs/academic-coverage.md` re-marked as D51 and D52 say": item 13.
- "ADRs 0022 to 0024 followed": "What is on the tree", "ADRs the step is under", and the ADR references in item 1. Two parts contradict them (see 7).
- "paper's own figure added to `docs/figures/gen_figures.py`": item 14.
- "the comparison figures drawn by `gen_comparison.py` as D54 says, showing the role difference of D43 and the revision difference of D49": item 15.
- "the `README.md` row of `paper`": item 17.
- "every page the change reaches": items 16, 18 and 19. `docs/dev/building.md:35` is not reached (Names 1).
- "checked by reading the folder against D42 to D52": Cases C1 to C12.
- "a fresh revision run of the rebuilt skill, run by the orchestrator from the step's worktree after the builder's report ...": the paragraph "The check run".
- Rulings carried. The brief carries D42 to D54, "The stops of paper" and G, including Axel's additions:
  - D43's and D49's "must show this difference" (item 15);
  - D46's autonomous writer pass (items 1 and 3);
  - D44's issue for a missing key or a broken DOI (items 1 and 5);
  - D51's commit (item 13);
  - D52's grep (item 12);
  - D53's 3.2.0 (item 15).

Findings:
1. D43, "the literature strategist only when no `.bib` is held", is contradicted. Item 1's full bullet says "only when no `.bib` is held or the user asked for a search", and the outline-only bullet repeats it ("the strategist as in full"). ADR 0022's Decision has the same "only when" (7). A builder writes a condition that neither the ruling nor the ADR gives.
2. The ruling "The figures of skills that launch agents" says that `docs/figures/` gains a figure of `paper` "and of every other skill that launches agents, once plan 5's fix is done". The brief carries only `paper`'s figure, and the step line does not cite this ruling. `grep -n -i figure docs/roadmap.md .scratch/5-paper/orchestrator-state.md` finds no booking of the other skills' figures (`grill`, `writing`, `code-comments`, the plan skills, which `README.md:79` names as launching agents). This sentence of Axel's ruling is neither in step 4 nor booked anywhere. The orchestrator rules which.
3. Item 1, "Steps 11", says which commands run in which mode but not where a failure goes. Today's Steps 11 sends a `missing:` line, or a failed `check-urls` line, to the citation compliance agent, which no longer runs in full, revision or lit-review. A builder must invent the route: a writer pass, the final message, or a stop. Under "The stops of paper" this is a choice the brief should fix.
4. Item 1, "Steps 11", says "the lit-review run's `refs.bib` checked with `cite-keys` against no `.tex` when none is given". That cannot be built. `lookup.py:11` gives `cite-keys <main.tex> <file.bib>`, `lookup.py:1233` refuses a wrong argument count, and the scripts do not change. The clause "or as the step's output for a `.bib`, as the strategist's page says" names no rule of `literature-strategist.md`: its grep for `cite-keys`, `check-urls` and `quote-check` prints nothing.
5. Item 1, "Steps 11", runs "`cite-keys` and `check-urls` in every mode that holds a `.tex`", which takes in abstract-only and disclosure. `SKILL.md` "What it reads" 5 has those two modes read no `.bib`, and the brief's abstract-only and disclosure bullets list no reference check. A builder gets two contradicting instructions.
6. Item 1, "Steps 7", makes the temporary folder only in citation-check mode, and in lit-review and revision when a role fetches. The full bullet keeps "the compile, today's item 15", which copies the manuscript "to `compile/` in the temporary folder" (`SKILL.md:216`), and revision compiles "as full mode's". Both modes then compile in a folder that Steps 7 never makes. The D46 reply ("starts the draft writer ... and the compile again") also arrives after Steps 13 has removed the folder. The brief does not say where that second compile runs, or what the run shows after it.
7. D47 has the draft writer's first prompt give "the configured model (`reviewer`)", and `.agents/plan.yaml:10` holds the alias `claude:opus`. The `refute` skill's "Stops" defines the configured one as an alias against the runner's model list. The brief does not say which identifier the AI disclosure writes, so a builder would write the alias or pick a form. Item 3 does not name `references/draft-writer.md:177` ("When the session gives the served model in the prompt, the agent writes that identifier"), which also needs D47's change.
8. Item 4 does not reach the "DOI checking" row (`intake.md:31`, `:108` to `:114`). The row is asked in full, revision, citation-check and lit-review. Its Strict answer "stops the run at the stop 'A reference that cannot be confirmed'", a stop the brief removes from full, revision and lit-review. Its mark-only answer marks "the integrity record". A builder following item 4 leaves a path to a stop outside those modes' lists, against "The stops of paper", and the check run would fail if Strict were answered.
9. Full mode now starts the visualization agent beside the draft writer whenever the materials hold data, which drops the Notes flag "figures in parallel". The lines that read that flag are named by no item:
   - `intake.md:106`;
   - `draft-writer.md:139`;
   - `visualization.md:11`.

   A builder following items 3, 4 and 9 leaves a flag that no step reads, which breaks rule 19.
10. Kept pages hold rules triggered by the removed checks, and item 10 ("every reference ... rewritten") does not say what replaces each trigger:
    - `statements.md:169`, `:173` ("A responsible-use statement is written when the ethics check of `references/ethics.md` rates dual use Moderate or above") and `:182`;
    - `visualization.md:11`, `:636`, `:658`;
    - `peer-reviewer.md:269`;
    - `ai-disclosure.md:84` ("The integrity record holds the checks the run made.");
    - `intake.md:110`.

    Under rule 17, a builder either stops or changes these rules' meaning by guess.
11. The full bullet says "At most three writer passes are driven by other agents' issues (the figure patch is the writer's own, round 1, round 2 or the second pass after round 2)". Under the score rule it keeps, round 2 sends no issues except through "the second pass after round 2", so the parenthesis names at most two passes. It also does not say whether the compile-fix pass and the `/writing` pass count. A builder cannot write a count that agrees with the steps. ADR 0022's Consequences carry the same "at most three".

## 3. Premises

- `sed -n 1,6p skills/paper/SKILL.md`: version `"1.0.0"`, and a description that names nine roles and seven modes. `wc -l skills/paper/SKILL.md skills/paper/references/*`: 404, abstract 111, ai-disclosure 151, argument-builder 146, citation-compliance 157, draft-writer 187, ethics 145, intake 142, integrity-verification 486, literature-strategist 272, patch-file 37, peer-reviewer 276, statements 187, structure-architect 232, visualization 671. Matches.
- Full mode's order: `SKILL.md` "### full", items 1 to 16, read. Matches.
- Revision mode, its items 1 to 7 and its stops line (`SKILL.md:254`): matches.
- Lit-review (items 1 to 5) and disclosure (item 1, the comparison and the second start): match.
- `grep -n -i 'permission\|new reference\|computed\|figure' skills/paper/references/intake.md` prints one line, `106:- When the materials hold data and the user wants the figures drawn ...`, a bullet and not a row of the table. The brief's "prints no such row" holds.
- `grep -n -i 'self-scor\|criteria first\|criteria-first' skills/paper/references/*.md` prints nothing, exit 1. Matches.
- `grep -n -i null skills/paper/references/*.md skills/paper/SKILL.md`: `integrity-verification.md:288`, `:292`, `:293`, and R code at `visualization.md:426`, `:461`, `:491`, `:508`, `:529`. Matches.
- `git grep -l -E 'integrity-verification|ethics\.md|abstract\.md|structure-architect|argument-builder' -- ':!.scratch/archive'`: seven ledger files, `docs/academic-coverage.md`, `docs/adr/0022-...md`, and `skills/paper/` files. `grep -o 'references/[a-z-]*\.md' docs/academic-coverage.md | sort | uniq -c` gives `12 integrity-verification`, `8 ethics`, `6 abstract`, `4 structure-architect`, `1 argument-builder`. Matches. The only ADR hit is 0022.
- `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0. `grep -c 'rebuild: paper'` gives 62, and `grep -c 'rebuild: researcher'` gives 7. `docs/academic-coverage.md:43` reads `| researcher | 13 |`. Matches.
- `grep -n 'paper\|figures/' README.md`: `:28` is the `paper` row with the quoted phrases, `:62` and `:66` are the two figures, `:79` is the list of skills that launch agents. Matches.
- `wc -l docs/figures/gen_figures.py` gives 759. Its head comment says what the brief says. `ls docs/figures` gives `gen_figures.py pipeline.svg plan-loop.svg`, with no comparison folder. `docs/dev/scripts.md:9` lists the script. Matches. Also, `pipeline_svg()` and `plan_loop_svg()` equal the committed files (`True`, `True`, computed in memory), so C13's `cmp` premise holds.
- `docs/glossary.md:148`, **draft review**: "sends it back to the draft writer at most twice", "Stated in: `paper`, "Steps / full" 12". Matches.
- `skills/writing/SKILL.md:23`: `| The findings of a manuscript are to be applied | `paper` |`. Matches.
- academic-paper (`sed -n 1,8p`, version "3.2.0"): the phases are at lines 117 to 128 (heading at 117, `Phase 7: FORMAT` at 128). Matches.
- academic-paper's modes are not all at lines 268 to 276. `grep -n` shows the table running from `268` (full) to `278`. `277` is `disclosure` ("9 only") and `278` is `rebuttal-audit` ("12 only (parse-only)"). The brief's range and list leave out both.
- academic-pipeline: version "3.13.0", and its stages table at 100 to 111 lists research, write, integrity 2.5, review, revise, re-review, re-revise, final integrity 4.5, finalize, process summary. Matches.
- The verify list in `.scratch/5-paper/orchestrator-state.md` equals the 10 commands of `docs/dev/building.md` with the filters of `docs/dev/change-standard.md`. Matches.
- ADR quotes (0022, 0023, 0024, 0020, 0017), read in full: each quoted sentence is in its Decision. 0019, 0021 and 0018 open with "Status: superseded by" 0022, 0023 and 0024. Matches.
- Premise corrections in `plan.md`: `git diff .scratch/5-paper/plan.md` shows step 4's line with "outline-only done by the planner and abstract-only by the draft writer" and "a fresh revision run of the rebuilt skill, run by the orchestrator from the step's worktree after the builder's report". Matches.

Findings:
1. Premise 25 says academic-paper lists its modes "at lines 268 to 276". The table runs to line 278, and lines 277 (`disclosure`, "9 only") and 278 (`rebuttal-audit`) fall outside it. "Read" item 7 sends the builder to "266 to 276" only. Following it, a builder draws disclosure as "a mode paper has alone" (item 15), when academic-paper has it with agent 9. It also leaves out `rebuttal-audit` from the modes academic-paper has alone, so the figures misstate academic-paper 3.2.0.

## 4. Cases and checks

- C1: consistent with `docs/dev/skill-layout.md` "Frontmatter" (the description limit, version in `metadata.version`). A major bump holds: runs that worked before change their output.
- C2, C3, C9, C11, C12: grep and `ls` runs over files the step writes. Consistent.
- C4 to C8 and C10: readings of `SKILL.md` and pages the step writes. Consistent.
- C13: consistent. It runs the changed script, checks its output is ASCII, and compares `pipeline.svg` and `plan-loop.svg` with `cmp`. Those two files are not in "Paths this step writes", but the changed script rewrites them, so the check is needed.
- C14: consistent with D54 and "Scripts compute facts; judgment is read" (the figures are read).
- C15: consistent with the rules file's rule 22 and the user's ban on breakage testing ("checked by reading the check in the code (no test, and no change made to watch it fail)"). No case or check asks for breakage testing.
- C16: reading. Consistent.
- The rules after the cases (a case becomes a test only under the test rule, first runs on the unchanged tree, the hand-back) match `change-standard.md` rules 1 and 13. Each new script is a development script, with no test required, since a figure's failure is judged by reading.
- Item 1's new section "Decisions a run takes itself": `docs/dev/skill-layout.md` "Where a rule goes" says "A rule that holds throughout the skill goes in Rules". "Sections, in order" row 6 allows reference sections "for material the steps point at", and "No other `##` heading appears outside the place row 6 gives it".

Findings:
1. Item 1 offers a new `##` section, "Decisions a run takes itself", as its first choice for a rule that holds throughout every run. `docs/dev/skill-layout.md` "Where a rule goes" puts such a rule in `## Rules`, one rule per bullet, and the stop part (a run stops only at its mode's stops) belongs with the Stops table's lead. A builder taking the first choice adds a section the layout does not allow for a rule.
2. C13 compares `docs/figures/pipeline.svg` and `docs/figures/plan-loop.svg`, which the step does not change but which its changed script rewrites. "Paths this step writes" names neither. It says "The step writes these paths and nothing else", while `python3 docs/figures/gen_figures.py` writes both files (byte-equal). The paths list should name them as rewritten byte-equal, or the case should say so.

## 5. The question

- C1: yes. It checks the version, the roles named and the length. It does not check that "every claim rests on a passage read in the run" is limited to citation-check mode, or that the trigger "check the references and claims of a draft" became "check the citations and their claims against the sources".
- C2: no for its part, the file list.
- C3: yes. Its pattern misses the stale references the step must remove: "integrity record", "integrity check", "ethics check" and `I<m>`. `grep -n -i integrity` over the kept pages shows `draft-writer.md:12`, `:162`, `patch-file.md:36` (`I<m>`), `peer-reviewer.md:8` (`integrity-1.md`), `:269`, `intake.md:110`, `ai-disclosure.md:84`, `visualization.md:11`, `statements.md:182` ("the ethics check marks"). The pattern also leaves out `templates/`, where `lookup.py` names "integrity record".
- C4: yes. A full mode whose compile runs in a folder Steps 7 never makes passes it (2.6), and so does one whose strategist condition contradicts D43 (2.1).
- C5: yes. A revision mode whose intake still asks "DOI checking", with Strict reaching "A reference that cannot be confirmed", passes it (2.8).
- C6: yes. It does not read lit-review's reference checks, which item 1 makes impossible without a `.tex` (2.4).
- C7: no.
- C8: yes. It passes with an AI disclosure that names the alias `claude:opus` (2.7).
- C9: yes. It reads the final message's sentences but not how the reply is handled after Steps 13, which removed the temporary folder (2.6).
- C10: yes. Text can state "stops only at its mode's stops" while the intake page keeps the Strict DOI path (2.8) and the ethics-triggered rules (2.10).
- C11: no. It is the grep D52 names, and a wider grep (`grep -n -i 'negative\|not significant\|non-significant\|insignificant\|did not \(beat\|improve\|outperform\)\|no effect\|failed experiment\|unsuccessful'` over every page, the three merged pages included) finds only a colour name at `visualization.md:114`.
- C12: yes. The counts and greps hold with rows pointed wrongly. Item 13's first bullet makes every row whose destination is `integrity-verification.md` `rebuild: researcher`, while its fourth bullet sends rows whose rule moves (the reading rules) to their new place. Rows whose content citation-check mode keeps meet both bullets, and the brief gives no rule between them:
  - `docs/academic-coverage.md:65` ("The paper skill's citation check takes it");
  - `:152` (the source-text judgment, the paywall and outage distinction);
  - `:195` (resolve with a title threshold, the DOI mismatch).
- C13: yes for the new figure. `paper.svg`'s boxes, roles and stops are never read against `SKILL.md` 2.0.0. C13 checks only exit, files, `cmp` and ASCII.
- C14: yes. It reads only `full` and `revision`. Outline-only, abstract-only, lit-review and citation-check, and the one-sided modes (wrong per 3.1), are not read.
- C15 and C16: no for their parts. C16 reads only the alt text, not the figure (see C13).
- The check on the step's line (the check run): yes for two parts of the goal.
  - It judges stops and questions only. If intake's new permission rows are answered no, the run never starts the strategist or the visualization agent, and the run still passes ("The stops of paper": "revision mode gets the literature search and the visualization agent whenever the comments call for them").
  - It ends at the final message with no reply sent, so D46's reply path and the autonomous pass never run.
  - The answers to reuse also conflict. In step 3, Axel answered intake Q5 with "DO NOT RUN ANYTHING: no code, no downloads, no experiments", then later "2. You can run code/experiments/figures.py" and "OBVIOSULY A" for new references (`agents/reviews/3-blind-comparison.md`, "The stopped `paper` revision run"). The new permission questions match both answers, so the result depends on which the orchestrator picks.
- Item 1: yes, through C1, C4, C5, C8 and C9 above.
- Item 2: no. The report's coverage list (rule 18) checks every rule of the two pages.
- Item 3: yes. No case reads `draft-writer.md` for the autonomous writer pass, the dropped `I<m>` and integrity inputs, or D47's line `:177`. C9 reads only `SKILL.md`.
- Item 4: yes, as C10.
- Item 5: yes. No case reads `peer-reviewer.md` for the two script outputs given to round 1 and reading 1, or for the dropped `integrity-1.md` input (`peer-reviewer.md:8`).
- Item 6: no, through C7.
- Item 7: yes, as C8.
- Item 8: yes. No case reads `literature-strategist.md`, for example `:3` "A start that gives only the manifest and a finished `refs.bib` asks for the patch alone", which D48's one start removes.
- Item 9: yes. No case reads `visualization.md`.
- Item 10: yes. C3's pattern misses `statements.md:182` and `patch-file.md:36`.
- Items 11 and 12: no, through C2 and C11.
- Item 13: yes, as C12.
- Items 14 and 15: yes, as C13 and C14.
- Items 16 to 18: no, through C16 and item 18's `grep -n`.
- Item 19: yes. No case greps the other skills. C3 covers only `skills/paper`.

Findings:
1. C1 can pass with the description still claiming "every claim rests on a passage read in the run" for every mode, and with the old trigger.
2. C3 can pass with `integrity record`, `integrity check`, `ethics check` and `I<m>` still in `draft-writer.md:12`, `:162`, `patch-file.md:36`, `peer-reviewer.md:8`, `:269`, `intake.md:110`, `ai-disclosure.md:84`, `visualization.md:11` and `statements.md:182`.
3. C4 and C9 can pass with full and revision compiling in a temporary folder that is never made, and with the reply after the end having no folder to compile in.
4. C5 and C10 can pass with intake's Strict DOI row stopping revision at a stop its list does not hold.
5. C8 can pass with the disclosure naming `claude:opus`.
6. C12 can pass with rows 65, 152 and 195 marked `rebuild: researcher` while citation-check mode keeps their content, or the reverse. Item 13 gives two bullets for such rows.
7. C13 and C16 can pass with `paper.svg`'s boxes disagreeing with `SKILL.md` 2.0.0.
8. C14 can pass with five of the comparison figures unread and disclosure drawn on `paper`'s side only.
9. The check run can pass with revision mode's strategist and visualization never started, and with D46's reply path never exercised. Its answer mapping is open between Axel's "DO NOT RUN ANYTHING" and his later "You can run code/experiments/figures.py".
10. Items 3, 5, 8, 9 and 19 have no case that reads the pages they change.

## 6. Implied inputs

- `gen_figures.py` with `paper.svg`:
  - A label that does not fit: listed (C15), with exit 1 and no file written.
  - The two existing figures unchanged: listed (C13).
  - A non-ASCII body: covered by the existing `write_figures` check, and C13 checks `paper.svg`.
  - A run from a directory other than the root, which the head comment promises ("it also runs from any other directory when given the path to the script"): missing. Expected: exit 0 and the three files written beside the script, none in the working directory.
- `gen_comparison.py`:
  - A label that does not fit: listed (C15).
  - A run from the root, and from another directory, while it imports `gen_figures.py` from the parent folder: missing. The brief allows the import ("It may import from `gen_figures.py`"). Expected: exit 0 from any directory, the import found from the script's own location.
  - Where the files go when it reuses `gen_figures.write_figures`, which writes to `gen_figures.HERE` (`docs/figures/`, `gen_figures.py:729`, `path = HERE / name`): missing. Expected: every comparison SVG in `docs/figures/academic-paper-comparison/`, none added to `docs/figures/`, and the printed paths naming that folder.
  - A mode on one side only: missing. Expected: disclosure drawn on both sides (academic-paper's agent 9), and format-convert, plan, revision-coach and rebuttal-audit on academic-paper's side only (3.1).
  - The `researcher` figure: C14 lists "unbuilt boxes dashed", but which boxes are built has no stated source. `researcher` has no skill file (`ls skills`), and roadmap entry 13 lists no stages matching academic-pipeline's. Expected: the boxes and their built or unbuilt state named in the brief from a stated source, such as entry 13's goal and D56, and `paper` for the write and revise stages.
  - The SVG file names and the links to them from `docs/academic-coverage.md`: missing. The brief gives no names. Expected: every SVG the script writes is linked from the new section, and every link names a file the script writes.

Findings:
1. `gen_figures.py` run from another directory is missing from "Cases".
2. `gen_comparison.py` run from another directory, with its import of `gen_figures.py`, is missing.
3. The folder `gen_comparison.py` writes to, given the allowed reuse of `write_figures`, is missing. Expected: only `docs/figures/academic-paper-comparison/`.
4. The one-sided modes are missing, and item 15 states them wrongly (3.1).
5. The source and the built or unbuilt state of `researcher`'s boxes are not stated. A builder invents them, against D54's "every box ... written in the script from the skill files".
6. The SVG names, and the check that the coverage page links each one, are missing.

## 7. ADRs

- 0001 and 0002: in force (proposed). They touch the step through `SKILL.md` "What it reads" 2 (the prose standard read where it is). The brief names them, and its items keep "What it reads" 2.
- 0003: superseded by 0013. Not followed.
- 0004 to 0012: plan-skill records. They do not touch the step. 0010 (verify list equal to the verification page) is not touched, since `building.md:35` holds no command.
- 0013 (`/writing`'s design): in force. The step invokes `/writing` and does not change it. Not touched.
- 0014: `code-comments`. Not touched.
- 0016, 0018, 0019, 0021: superseded (0016 by 0018, the others by 0024, 0022 and 0023). Not followed.
- 0017: in force, and touches the step. The step is under "`skills/paper/templates/lookup.py` ... makes every lookup of the skill", and the brief names that sentence. Its Decision also says "`quote-check` reads the passage lines of the run's integrity record". After the step there is no integrity record, and `quote-check` runs only on `citation-report.md` (item 1, Steps 11). No later record supersedes that sentence: 0024 moves the passage lines into `citation-report.md` but does not name 0017.
- 0020: in force, and touches the step. The brief names its folder sentence. Its Decision lists the records "the manifests, the patches, the apply reports, the integrity record and the approved outline". After the step no run writes an integrity record, and no later record supersedes this part.
- 0022: in force, and touches the step. The step is under "A full run is done by five roles ...: the literature strategist, only when no `.bib` is held; ...". The brief contradicts that sentence (2.1). The Consequences' "at most three writer passes" is carried in words the steps do not match (2.11).
- 0023: in force, and touches the step. The brief carries "after the compile", the numbered report, the one-line reply, "the compile again" and the autonomous pass. No contradiction, but the reply after the run's end is unspecified (2.6).
- 0024: in force, and touches the step. The step is under "The full text is fetched by `lookup.py fetch` into a temporary folder, removed at the run's end ...", and the brief names it. Its Consequences say "Full, revision and lit-review runs fetch no full text." The brief's "Steps 7" says the temporary folder is made "in lit-review and revision when a role fetches a full text", which contradicts that sentence.

Findings:
1. The brief contradicts ADR 0022's Decision ("the literature strategist, only when no `.bib` is held") with "or the user asked for a search", in item 1's full and outline-only bullets.
2. The brief contradicts ADR 0024's Consequences ("Full, revision and lit-review runs fetch no full text.") with item 1's "Steps 7" ("and in lit-review and revision when a role fetches a full text").
3. ADR 0017's Decision sentence "`quote-check` reads the passage lines of the run's integrity record" is touched: the step leaves `paper` with no integrity record. The brief's "What is on the tree" does not name the sentence, and neither the brief nor a later ADR says how it reads after the step.
4. ADR 0020's Decision list "... the apply reports, the integrity record and the approved outline" is touched in the same way, and the brief does not name it.

## 8. Dictated text

- The trigger "check the citations and their claims against the sources": `grep -n -F 'check the citations and their claims against the sources' 4.md` gives `40`. It holds against `docs/dev/skill-layout.md` "Frontmatter" (a phrase for a case of this skill) and the prose standard, "0. Hard rules".
- The version `"2.0.0"`: `grep -n -F '"2.0.0"' 4.md` gives `40`, `87`. It holds against skill-layout "Frontmatter" (the major part for changed output, and one raise in the plan, the skill having been created at 1.0.0).
- The heading "Decisions a run takes itself": `grep -n -F 'Decisions a run takes itself' 4.md` gives `44`. As a label it holds against prose standard "0. Hard rules" ("Headings are labels") and skill-layout "Sections, in order" (noun-phrase label). Its placement as a `##` section breaks skill-layout "Where a rule goes" and the sentence of "Sections, in order" that allows no other `##` heading (4.1).
- The reply forms `all`, `all but 3, 7`, `2, 5`, `none`: `grep -n -F '`all but 3, 7`' 4.md` gives `43`. They hold, and are today's Steps 12 text and D40's examples.
- The patch ids `F<k>` (`grep -n -F '`F<k>`' 4.md` gives `43`), `abstract-only` (`50`) and `lit-review` (`51`): existing ids of `references/patch-file.md`. They hold.
- The marks "every run" and "only when": `grep -n -F '"every run" and "only when"' 4.md` gives `76`. They hold, and are the glossary's **mark, of a figure**.
- The section title "paper against academic-paper" for `docs/academic-coverage.md`: `grep -n -F 'paper against academic-paper' 4.md` gives `77`. It holds against prose standard "0. Hard rules" (a label). `check_coverage.py` reads only "New skills" and the named skill sections (its head comment), so the extra section does not affect the check.
- The file names `references/planner.md` (`grep -n -F '`planner.md`' 4.md` gives `88`) and `docs/figures/paper.svg` (`76`, `99`, `135`): names, and they hold.
- The stop names "The outline's approval", "The draft review does not pass", "A model other than the configured one", "A patch that does not apply", "A reference that cannot be confirmed" and "A claim the run cannot support": quoted existing rows of the Stops table. They hold.
- The kept rule texts "A claim rests on a passage read in the run", "A number the manuscript reports as its own result is traced to a saved run or config of the project" and "Every `/writing` finding applied without asking" (line 57): existing text quoted, not new words. They hold.
- The Use instead row for `researcher` (`grep -n -F 'Use instead' 4.md` gives `58`): gives content, not words, so it is not dictated. Naming a skill not yet built matches the existing rows (`rebuttal`, `referee`, `idea`, absent from `ls skills`).
- `LC_ALL=C grep -n '[^ -~]' 4.md` prints line 176's `<check mark>`, quoted from the rules file's character set. The brief is a `.md`, where the rules file allows it.

Findings:
1. Line 44's dictated section "Decisions a run takes itself" breaks `docs/dev/skill-layout.md` "Where a rule goes" ("A rule that holds throughout the skill goes in Rules") and "Sections, in order" ("No other `##` heading appears outside the place row 6 gives it"), since the rule it holds is not material the steps point at.

## Declined to judge

- Whether the other skills' figures of the ruling "The figures of skills that launch agents" belong to step 4 or to a later entry. That is Axel's or the orchestrator's ruling (2.2).
- Which of Axel's step-3 answers counts as the match for each new intake permission question in the check run. That is the orchestrator's call under D38 (5.9).
- Whether an AI disclosure that names a model family without a version is acceptable under D47. That is Axel's call (2.7).
- How ADRs 0017 and 0020 should read after the step (an edit in place as D23 did for 0017, a new record, or a sentence in the brief). Rule 4 reserves that choice to the orchestrator (7.3, 7.4).
- Whether the visualization agent's added condition "when the materials hold data for a figure" goes beyond ADR 0022's unconditioned "in parallel with the draft writer". I read it as the existing data condition and found no contradiction.
- I did not run either figure script, since the task allows no file to be written. C13's premise was checked by comparing the generated bodies with the committed files in memory.

Agent usage: a40fbd6557bc65701, claude-opus-5-5, 279372 tokens, 62 tool uses, 14.4 min.
