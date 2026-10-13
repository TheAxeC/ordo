# Step 3 brief check (on main at bff5029)

This is the report of the fresh agent of the `spec` skill's "Steps / The brief check", run on `agents/briefs/3.md`. A page this report cites (the rules file, a standard, a skill's text) is named by its section, never by a line number. A line of code or a grep hit keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets.

Every command ran from `/Users/axelfaes/workspace/ordo` on main at bff5029 (`git log --oneline -1` printed `bff5029 Stop step 3 of plan 3 on Open item F, the rerun needs a pin`). The brief, `plan.md` and the state file are uncommitted on disk, as `git status --short` showed: ` M .../orchestrator-state.md`, ` M .../plan.md`, `?? .../agents/briefs/3.md`. I edited no file, started no agent and invoked no skill.

## 1. Names

The step changes the text of three files: `skills/writing/SKILL.md`, `references/rules.md` and `references/registers.md`. Inside them it changes the prompt's "What you read", "What you run", "A finding" and "How you group them", Steps 3 and 5, and the rules.md sections that kind 2 names. It renames no heading, key or term.

- **The three paths.** `git grep -n -e "skills/writing" -e "references/rules.md" -e "references/registers.md" -- . ':!.scratch'` hits outside the paths:
  - `docs/academic-coverage.md:76`, `:100`, `:101`: these say the two pages hold the source's rules and the flagged-term replacements. Kind 2 narrows scopes and removes no rule, so the hits stay true.
  - `docs/adr/0001-...md:11`, `:15`, `:16`: "`skills/writing/` holds no copy of it". These stay true only if the restatements named under section 7 (F16) are not carried into the files.
  - `docs/dev/scripts.md:23`: the docx script, which the step does not change.
  - `docs/roadmap.md:25`: the gate. `docs/roadmap.md:200`: entry 2.C, already done.
- **The sections and steps.** `git grep -n -e "writing\`, \"" -e "writing\`'s" -e "writing\`, Steps" -e "\"A finding\"" -e "How you group them" -e "What you run" -e "What you read" -- . ':!.scratch'` hits:
  - `docs/glossary.md:44` and `skills/repo-setup/templates/plan-terms.md:39` ("`writing`, Steps 5").
  - `docs/glossary.md:122` and `plan-terms.md:117` ("`writing`, "What it reads" 2").
  - These stay true, since the brief adds to Steps 3 and 5 and renumbers nothing.
- **The rule sections of kind 2.** `git grep -n -e "Evidence for claims" -e "Most specific term" -e "Clear antecedents" -e "Terms defined at first use" -e "Paragraph point" -e "Reader's question per section" -- . ':!.scratch' ':!skills/writing'` printed nothing, exit 1.
- **The term finding.**
  - `plan-terms.md:41` and `docs/glossary.md:46` read "a passage of a draft that `/writing` reports as a break of a named rule, with its place, the quoted passage and a proposed replacement".
  - `README.md:26` reads "Each finding gives its place, the quoted passage, the rule and a proposed replacement".
  - Kind 5 keeps a place, a passage and a replacement in every finding, so both stay true.
- **The agent definitions.** `agents/ordo-*.md:3` and `:6` name "the review agent of `writing`". They stay unchanged.

Findings: none.

## 2. The step line

Step 3's line is `plan.md` line 23. Each part and the requirement that serves it:

- "each finding of step 2 not marked right by both reviewers ... fixed in `skills/writing/references/` or `skills/writing/SKILL.md`": the opening paragraph of "What to build" and kinds 1 to 6.
- "each failure of a gate condition on the runs that step 2's report names": kind 5 (conditions 1 and 4), kind 7 (condition 2) and kind 8 (condition 3).
- "the way the session invokes the runs included": kind 9, which covers only the first bullet of `2-report.md` "Deviations from the brief".
- "after the landing, main's head tagged `v7.1.0-rc.2` and pinned": "What is on the tree", bullet 4. It is the orchestrator's work after landing, and the brief rightly gives the builder no requirement for it.
- "check: the refuter reads each fix against the finding or failure it closes": the Report's table ("one row per finding and per failure ... the sentence that now prevents it") and cases C1 to C9.
- "and the skill against `docs/dev/skill-layout.md`": Read item 6, Conventions bullet 4 and Verify 5.
- "`sh skills/land/templates/checks.sh ...` passes": Verify 1, "The plan's whole verify list runs once, at landing on main".
- The rulings:
  - Ruling E is served by kinds 5, 7, 8 and 9.
  - Ruling F is served by "What is on the tree" bullet 4.
  - Plan 2.1 ruling C (real runs only) is served by the 52 findings as the source.

Findings:

- **F1.** One deviation from `SKILL.md` Steps 7 has no kind. It is in `2-report.md:110`, "Deviations from the brief", bullet 2: "`SKILL.md` Steps 7 (...) was not followed for the grant run on its notice". The turn that received the grant agent's notice ended with a status line, and both reports came in a third turn.
  - This is the session breaking `/writing`'s Steps 7 during the runs, which the step line's "the way the session invokes the runs included" covers. No kind of "What to build" names it.
  - The brief should do one of two things: assign a fix in Steps 7, or state that the cause is step 2's two-runs-in-one-turn protocol, which belongs to step 4's brief, and give the reason.
  - Bullet 3 of the same section (the markers' prompts named a file) concerns the markers, not `/writing`, and is outside the step.

## 3. Premises

- **The file sizes.**
  - Command: `wc -l skills/writing/SKILL.md skills/writing/references/*.md skills/writing/templates/*`.
  - Output: `139 SKILL.md`, `52 registers.md`, `190 rules.md`, `159 docx_paragraphs.py`. `head -8 skills/writing/SKILL.md` shows `version: "1.0.0"`.
  - This matches the brief.
- **No change since e00f6bd.**
  - Command: `git log --oneline e00f6bd..HEAD -- docs/dev/building.md skills/writing`.
  - Output: nothing, exit 0. This matches.
- **The version rule.** `docs/dev/skill-layout.md:23` reads "A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0". `/writing` was created at 1.0.0 in this plan's step 1, so it stays at 1.0.0. This matches.
- **The step 2 record.**
  - `grep -n "^## \|^### " 2-marks.md` printed `205:## Findings not marked right by both (the work of step 3)`, `207:### The manuscript run (36)` and `246:### The grant run (16)`.
  - `sed -n '205,263p' 2-marks.md | grep -c '^- '` printed 52. The same range split by run gave 36 manuscript and 16 grant.
  - `ls 2-run/*-marks-*.md` listed the four marks files.
  - This matches the brief.
- **The installed pin.** `git -C ~/.local/share/ordo-stable describe --tags` printed `v7.1.0-rc.1`. This matches.
- **The term and README lines.** `sed -n 41p skills/repo-setup/templates/plan-terms.md` and `sed -n 26p README.md` show the quoted text. This matches.
- **The ADR quotes.** I read ADRs 0001, 0002 and 0003 whole. Each sentence the brief quotes stands in the record's Decision section; the quote from 0003 elides "on the model ... at `reviewer_effort`,". This matches.
- **ADRs 0004 to 0012.** I read each Decision section (titles below). None governs a file, name or behaviour the step changes. This matches.

Findings: none.

## 4. Cases and checks

- C1 to C9 are text cases, checked by reading, with a first read on the unchanged tree and the before-and-after sentence named. This is consistent with `docs/dev/change-standard.md`, "The rules" 1: a defect in text is fixed by reading, with the text quoted before and after. Each case reads the step 2 record only to name the finding it closes. None asks the builder to explain a place the step leaves unchanged.
- C10 is consistent in kind, but its expected result conflicts with "What to build" (F2).
- I ran "Verify before you report" from the repository root on main:
  1. The perl character-set check over the three files printed nothing, exit 0.
  2. `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0.
  3. `grep -n -e ' - ' -e ' -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md` printed 64 lines (`| wc -l` gives `64`), exit 0. Every line is a nested list marker, such as `skills/writing/SKILL.md:30:   - In the \`projects:\` form, the keys of the named project.` and `skills/writing/references/rules.md:29:  - a result that needs replication;`.
  4. `git diff --stat e00f6bd -- skills/writing` printed nothing, exit 0.
  5. Verify 5 is a reading, not a command.

Findings:

- **F2. C10's expected result fails by design for at least five of its ten findings.** C10 expects "each still a finding the changed text allows, with no sentence it breaks". All ten are marked right by both, as the prompt asked me to check:
  - `2-marks.md` rows: ms 5, 30, 33, 57 and 103 are `right / right`.
  - Grant 2, 3, 16, 18 and 44 are `right / right`.

  These conflict with the brief's own fixes:
  - Ms 103 ("Split before "We employ the same cosine decay"") falls in kind 5's own failure list ("manuscript 95 to 110"), so its form breaks kind 5 and Decision 1.
  - Ms 57's replacement ("this study employs a simple binary ..." becomes "we used a binary ...") drops "simple" and changes the tense, which the Voice rule does not cover. Kind 1's "keeps every claim, clause, qualifier, number and term of the passage that the named rule does not break" forbids it.
  - Grant 18's replacement ("computer-extracted image features ... predict" becomes "radiomic features ... predicted") changes a term and a tense. Kind 1 forbids it.
  - Ms 5 ("Replacement: add the evidence, [for example ...]", `manuscript-report.md:14`) and grant 44 ("Replacement: add "The matching in C2 ..."", `grant-report.md:159`) are in the "add ..." form. Kind 5's "never an instruction" and Decision 1's absence form ("that sentence followed by the added text") may forbid that form (F11).

  C10 should state its expected result for the finding itself: the same place, passage and rule, and a replacement that keeps what both markers judged right, in the new form. Or C10 should use findings whose form survives the change.

- **F3. Kind 8 conflicts with ruling D1 and with the prose standard's "How it is applied".**
  - Kind 8 says "the agent runs no shell command at all for such a draft".
  - D1 (`plan.md` line 35, the user's) reads "the review reads, and `LC_ALL=C grep -n '[^ -~]'` is named for the ASCII rule".
  - The prose standard's "How it is applied", which the review agent reads whole, says to "scan for non-ASCII (`LC_ALL=C grep -n '[^ -~]' <file>`)".
  - Reading cannot find an invisible non-ASCII character, such as a non-breaking space.
  - The manuscript agent's commands 5 and 6 (`2-report.md:85-86`) were this grep, together with counts that D1 rules out.
  - The brief should allow exactly that grep per draft file, with its output never written to a file, or raise the choice as a stop. D1 is the user's ruling.
- **F4. Kind 8 names the `Read` tool.**
  - No skill names a runner's tool by its tool name: `git grep -n -E '\`(Read|Bash|Edit|Write|Agent)\`' -- skills` printed only the two non-matching lines shown in my run.
  - The skills write "the runner's stop tool" in 9 places and "the runner's message tool" in 2 (`git grep -n -o "the runner's [a-z ]*tool"`).
  - The `spec` skill's Anti-patterns row "A runner or a vendor named in the brief" gives the reason.
  - The prompt should say "the runner's file-reading tool", or the brief should say why the tool name is needed.
- **F14. Verify 3 matches every nested list marker.** On main it prints 64 lines, all list markers, and the brief asks the builder to name "each line it prints ... with why it stays". `grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md` skips list markers and printed nothing on main, exit 1.

## 5. The question

"The goal" here is the part of the plan's goal this step delivers: a `/writing` whose review agent reports only right findings in the required form, run by a session that writes nothing.

- **C1 to C9: yes.** Each checks that the builder can name a sentence, by reading. A sentence can cover a finding by its words while the agent still makes the finding; step 2's agent broke several sentences that already stood (F5). The plan's own line for step 3 answers "Yes, alone", and step 4's rerun is the proof.
- **C10: yes.** For the same reason, and see F2.
- **The step line's check: yes.** As the plan's Gate section says for step 3. Step 4's rerun closes it.
- **Kinds 1 to 9: yes, each, for the reason given for C1 to C9.** Kinds 1, 2, 3, 4 and 5 also have the gaps F6 to F13 below.

Findings:

- **F5. C5's place part, C8 and C9 can be met by sentences already on main, which step 2 broke.**
  - The places are covered by `skills/writing/SKILL.md:103` ("for a file the main file includes, `file:line` with the file's path from the main file's folder").
  - The commands are covered by `SKILL.md:95` ("The one command you run for the draft is the one the prompt gives for a `.docx`").
  - The session's writes are covered by `SKILL.md:84` ("The session writes no file and adds no finding of its own").
  - Each case should expect a sentence the diff adds or changes, and say what it adds that the old sentence lacked: the act it names to do instead, or the cause of the break.
- **F6. The "Evidence for claims" scope words do not cover ms 1 or ms 4 as both markers describe them.** The bullet reads "a claim that cites its source or the draft's own table or figure is not reported under it; a claim the draft's own data hold only in part is reported under "Limitations ...".
  - Ms 1's claim (`abstract.tex:3`, "We additionally find that an exploratory naive fusion ...") cites no table. Both markers say "tables/results_fusion.tex is the evidence for this claim".
  - Ms 4's evidence is in running text, not a table or figure: `c_variants.tex:10`, "comprising 12.4, 22.0, 45.9, and 72.4 million parameters". Its ratio is contradicted, not "held only in part".
  - The words should name the draft's own data wherever they stand (its text, a table, a figure, cited or not). They should also say what happens with a claim those data contradict.
- **F7. Kind 1 does not answer the reasons for ms 20 and ms 25.**
  - Ms 20, marker 2: "The replacement asserts that higher AUPRC/AUROC goes with lower calibration error across groups, which tables/results_reliability.tex contradicts".
  - Ms 25, marker 1: "the finding's limit "holds at HCCNet-Pico only" is false ...".
  - Kind 1 covers dropped content and the numbers a replacement gives. It says nothing on a relation or a limit the replacement states that the draft's own data contradict.
- **F8. Kind 3 answers only half of grant 4's reason.** Both markers also give that the replacement "moves "detection limit" to 35, before its first explanation in 41" (marker 1), or "puts "detection limit" at 35, before any definition of that term" (marker 2). Kind 3 does not say that a replacement introduces no term before the place the draft defines it.
- **F9. Kind 1's list forbids replacements both markers marked right, and conflicts with kind 6.** The list is "keeps every claim, clause, qualifier, number and term of the passage that the named rule does not break".
  - Grant 18 changes a term ("computer-extracted image features" to "radiomic features").
  - Grant 63 changes "organ map", "image point" and "table" to "liver mask", "voxel" and "tensor".
  - Grants 64 and 65 change "the readout" and "the readout's sensitivity".
  - Ms 55 changes the tense. Ms 57 drops "simple".
  - All are `right / right` in `2-marks.md`. Each takes over a change another finding on the same passage proposes, as kind 6 asks ("a passage that breaks two rules gets one replacement that ends both breaks").
  - The markers' standard in every wrong mark of kind 1's list is "changes what the passage claims" (a dropped clause, a changed scope or strength, a new number). Kind 1 should state that standard, and allow a change that another finding on the same passage proposes.
- **F10. Kind 4's list of where "delete" is allowed forbids ms 61 and leaves out section A.**
  - Ms 61 (`discussion.tex:16`, "Despite these successes, several challenges and limitations were identified.", "Replacement: delete", prose standard section 0) is `right / right`, and section 0 is not in kind 4's list.
  - The list also omits section A, which says "cut or replace with the concrete fact".
  - Either the general rule alone ("where the named rule says to cut or delete") or a complete list is needed. F16 covers the restatement.
- **F11. Kind 5 does not say whether an "add [fact]" replacement stands.**
  - `2-report.md:89` (condition 4) allowed "add [citations]". Findings in that form are marked right by both: ms 9, 10 and 11 ("add [citation...]"), ms 5 and grant 44.
  - Kind 5's "never an instruction" and Decision 1's absence form ("that sentence followed by the added text") read as forbidding it.
  - The brief should name the form, so the builder does not choose it and step 4's markers do not judge it differently.
- **F12. Decision 1's absence form collides with kind 6 in real case 4.** The anchor sentence `a_data.tex:1`, "We evaluate HCCNet on data that is retrospectively collected ...", is also ms 35's passage (Tense per section, `right / right`, replacement "We evaluated HCCNet on data collected retrospectively"). Real case 4's replacement repeats the present-tense sentence, so the two findings cannot both be applied, which kind 6 requires. The form should give the anchor sentence as another finding on it changes it, or say how the two combine.
- **F13. Two bullets of kind 2 do not name the markers' reasons; only kind 2's general sentence covers them.**
  - Ms 52, marker 1: ""registered" is not a general word standing in for a more specific term". The "Most specific term" bullet adds only "a missing number or threshold is not reported under it".
  - Ms 29, marker 2: "the sentence states a different exclusion than the one meant, not an undefined technical term". The "Terms defined at first use" bullet adds only "value, selection rule or person". Marker 1 marked ms 29 right.
- **F15. Decision 1's hard-wrap form and real case 3 differ.** The form says a hard-wrapped paragraph "quotes the lines as they stand". Real case 3 quotes the end of line 2 from "\textit{CHARISMA" and the start of line 3 ending "...". The copy's line 2 begins "This research was performed within the project entitled". One of the two should change.

Each of the 52 findings and each gate failure is assigned to a kind.
- **Manuscript:**
  - Kind 1: 24 findings.
  - Kind 2 adds 1, 13, 28, 34, 49, 52 and 92.
  - Kind 4 adds 119 and 120.
  - Kind 5 adds 27, 108 and 117.
  - Total 36.
- **Grant:**
  - Kind 1: 41, 45 and 62.
  - Kind 2: 8, 9, 33, 37, 38, 42 and 43.
  - Kind 3: 1, 4, 5 and 12.
  - Kind 5: 51 and 54.
  - Total 16.
- **Gate failures:**
  - Condition 1 (ms 2, 24, 27, 64, 65, 75; grant 51) and condition 4 (every finding `2-report.md:90-91` lists) are in kind 5.
  - Condition 2's 17 groups are in kind 7: ms 14, 16 and 17 plus five grant groups with no line, and ms 8, 11, 12 and 13 plus five grant groups whose line does not say why.
  - Condition 3 is in kind 8.
  - Deviation 1 is in kind 9.
- **Left out:** only F1. The reasons not answered by their kind are F6 to F13.

I checked the five real cases of "Decisions taken in this brief" 1 against the copies:

1. **Conclusion paragraph.** `sed -n 1p .../conclusion.tex` split into sentences printed 8 sentences: 3 ends "which we leave to future work.", 4 begins "The methodology is versatile", 7 begins "In the future, we therefore plan to validate". Splitting before 4 and before 7 leaves parts of 3, 3 and 2. This holds.
2. **Grant paragraph 31.** `grep "^31: " 3-2-grant-paras.txt` split into sentences printed 8 sentences: 3 is "The applicant's standing appointment covers the remaining time.", 4 is "Computing is provided by the host institution at no cost, so none is requested.", 7 begins "The longitudinal MRI cohort is already available". The parts are 3, 3 and 2. This holds.
3. **Acknowledgment lines.** `cat -n .../ack.tex`: line 2 ends "\textit{CHARISMA: Predictie van hepatocellulair carcinoom op basis van MRI-radiomics" and line 3 begins "Primair leverkanker (hepatocellulair carcinoma, HCC)}, which is funded by". This holds, with F15 on the quoting.
4. **Data section.** `a_data.tex:1` begins "We evaluate HCCNet on data that is retrospectively collected from a cohort of liver cirrhosis patients". `grep -rniE "TRIPOD|STARD|CONSORT|reporting guideline" <copy> --include='*.tex'` printed nothing. This holds, with F12.
5. **Grant paragraph 46.** Sentence 3 of paragraph 46 is "Overlapping work packages: WP1 (mo 1-4) aligns the scans ...; WP2 (mo 3-8, primary) ...; WP3 (mo 7-11) ...; WP4 (mo 8-12) releases the atlas (...)". This holds.

## 6. Implied inputs

Not a code step. It is a text step that changes the skill's prose and the review agent's prompt.

Findings: none.

## 7. ADRs

- **0001, "The writing base reads the prose standard where it is".** The step is under "`skills/writing/` holds no copy of it", and the brief names it. Four requirements would write prose-standard rules into `skills/writing/` (F16).
- **0002, "The prose standard holds over the academic sources".** The step is under "No rule that contradicts the prose standard is carried", and the brief names it. The repeated-construction bullet risks a contradiction (F17).
- **0003, "A fresh read-only agent reviews a draft".** The step is under "`/writing` starts one fresh agent that changes nothing ... which reads the whole draft ... The session shows its report to the user and changes nothing", and the brief names it. Kinds 8 and 9 agree with it.
- **0004 to 0012:**
  - 0004: self-rule.
  - 0005: the choices file.
  - 0006: agent ids in the ledger.
  - 0007: the repair-round reviewer model.
  - 0008 and 0009: the cost script.
  - 0010: the verify list kept equal to the verification page.
  - 0011: dispatch blocks.
  - 0012: commit paths.
  - None governs what the step changes. 0010 governs `/spec`'s preflight; the brief carries its effect ("the plan's verify list stays equal to the verification page") and the step does not change the list.

Findings:

- **F16. Four requirements would restate prose-standard rules in `skills/writing/`.** This goes against ADR 0001, the brief's Conventions ("a rule of the prose standard is named by its section, never restated") and `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once"):
  - Kind 2's prompt sentence on "the uses its section A names as staying, and standard domain terminology". Section A states the domain-terminology exemption, and `references/rules.md:177`, "Replacements for flagged terms", states it again.
  - Kind 4's list of the prose-standard sections that say to cut.
  - Kind 2's statement of what section 0's "No repeated construction" covers.
  - Kind 1's "a vague qualifier is replaced by the number or claim", which repeats section A ("Vague qualifiers are replaced with the number or the specific claim").
  - Each should name the section, and add only what the section lacks, such as "never cut so that a usual case becomes a universal one".
- **F17. Kind 2's repeated-construction bullet narrows a prose-standard rule.** The bullet reads "A claim that two sections of a grant or paper each need is not a repeated construction".
  - Section 0 reads "A sentence shape that recurs across entries or sections is a template and is rewritten once noticed". A sentence repeated word for word across sections is such a recurrence.
  - Grant 37 is one: paragraph 42 repeats paragraph 35's sentence, and marker 1 marked it right.
  - Carried into the prompt, this sentence contradicts the prose standard (ADR 0002), and Decision 2 places a rule's scope in "that rule's section", which for a prose-standard rule is outside `skills/writing/`.
  - The general kind-2 sentence ("reported under a rule only when the rule's own words describe the break") already covers grant 38.

## 8. Dictated text

- "Everything in the brief is done" (the report's first line): `grep -n 'Everything in the brief is done' .scratch/3-the-writing-base/agents/briefs/3.md` finds line 137. Holds.
- "this variation" and "such summaries" (the general example of a determiner with its noun): `grep -n 'this variation\|such summaries' .scratch/3-the-writing-base/agents/briefs/3.md` finds lines 31 and 112. Holds: ASCII, general words that name no draft.
- `metadata.version` "1.0.0": `grep -n '"1.0.0"' .scratch/3-the-writing-base/agents/briefs/3.md` finds lines 11 and 92. This is the file's current text, unchanged. Holds.
- Every other requirement says what a sentence must say without giving its words: kinds 1 to 9 and Decision 1's forms. The builder words them.

Findings: none.

## Declined to judge

- Whether any fix changes what the review agent does. Reading cannot settle this; step 4's rerun does.
- Whether real case 2's second split (3 and 2 sentences of costs) meets "one idea" as well as the sentence count. This is a judgment of the decision's author.
- Whether the runner's file-reading tool cuts lines over 2000 characters, which kind 8's "nothing left out" depends on. Not verified. The longest manuscript line is 1852 characters (`a_data.tex:3`, found with `awk 'length($0)>1500'`); grant paragraph 42 is 2376 characters but arrives through the docx command.
- Whether a number or claim the draft's own data contradict (ms 4, ms 1) should be reported under any rule at all. That is a choice for the brief's author or the user (F6).
- F3, whether to allow the named ASCII grep or to forbid every command. Ruling D1 is the user's, so this may be a stop rather than a change to the brief.

Agent usage: ac0b534b48b96acce, claude-opus-5-5, 247327 tokens, 53 tool uses, 11.4 minutes.

## Closed

- F1: the brief's "What to build" ends with a paragraph that gives the second deviation to step 4 (each run in its own turn, since `SKILL.md` Steps 7 holds for one run) and puts the third outside `/writing`; `plan.md` holds "Step 4, the repeated runs: Step 0" with the carried premise.
- F2: C10 expects each finding to keep its place, passage and rule and the replacement what both markers judged right, gives the findings whose form changes (manuscript 103, 5, 35 with the absence, grant 44), and adds manuscript 35, 55, 61 and grant 63 (all right by both in `2-marks.md`).
- F3: kind 8 allows `LC_ALL=C grep -n '[^ -~]' <file>` on each text draft file, and through a pipe on the `.docx` command's output, as ruling D1 names it, with no output redirected to a file.
- F4: kind 8 says "the runner's file-reading tool"; the brief names no tool.
- F5: C5, C7, C8 and C9 expect a sentence the diff adds or changes; kinds 8 and 9 say what the new text adds that the old sentence lacked (the act to do instead, the step where the write happened).
- F6: kind 2's "Evidence for claims" bullet names the draft's own evidence wherever it stands, cited or not, and says a number or claim the draft's own data contradict is a question of content no rule covers.
- F7: kind 1 says a relation or a limit the replacement states holds in the draft's own data.
- F8: kind 3 says a replacement introduces no term before the place the draft defines it, and C3 names grant 4's "detection limit".
- F9: kind 1 states the markers' standard (no dropped claim or clause, no changed scope or strength, no added number) in place of the list with "term", and carries a change of wording another finding on the same passage proposes.
- F10: kind 4 gives the general rule only and names no list.
- F11: kind 5 names the form of an addition (the anchor sentence followed by the added text) and lists "add [citations]" among the instructions; C10 gives manuscript 5 and grant 44 in that form.
- F12: kind 5 and Decision 1 give the anchor sentence as it reads after every other finding on it; real case 4 shows `a_data.tex:1` with manuscript 35's tense change applied.
- F13: kind 2's "Most specific term" bullet adds a word that is the right term for what it names; its "Terms defined at first use" bullet adds a sentence that states a criterion other than the one the author meant.
- F14: Verify 3 is `grep -n -E '[^[:space:]] - | -- ' ...`, which prints nothing on main.
- F15: Decision 1's hard-wrap form quotes the end of the first line and the start of the next with "..." for the rest, and real case 3 follows it.
- F16: the brief's "What to build" opens with "A rule of the prose standard is named by its section and never restated (ADR 0001)"; kind 2 names section A without restating it, kind 4 names no list, kind 1 keeps only what section A lacks (a vague qualifier is never cut so that a usual case becomes a universal one), and the repeated-construction bullet is gone.
- F17: the repeated-construction bullet is removed; grant 37 is covered by kinds 4 and 6, grant 38 by kinds 5 and 6.
- Dictated text added after the check: the command `LC_ALL=C grep -n '[^ -~]' <file>` in kind 8 (`grep -n "LC_ALL=C grep" .scratch/3-the-writing-base/agents/briefs/3.md`), a code line, ASCII, the command ruling D1 names: holds. The examples of Decision 1 are not text for a file.
