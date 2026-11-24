# Step 1 brief check (on main at bf22d07)

The brief can be dispatched once the orchestrator settles the findings below. There are three substantive ones: the cases leave R1, R4 and most placements without a case; R3 can be read as conflicting with the lazy option the decision form names, and no requirement makes the builder grep for that; and the reason for the version raise does not weigh the major criterion. No premise is wrong, and the size line "a full step" is right.

## 1. Names

- **Shared-rules references:** `grep -rn 'shared-rules\.md\|shared rules' skills utils docs README.md CLAUDE.md agents | grep -v '^docs/roadmap.md\|^docs/adr/'`
  - The hits are at skills/ordo/ordo-help/SKILL.md:99, skills/ordo/ordo-init/references/new-repository.md:27, skills/ordo/ordo-init/SKILL.md:3,28,104,272,274,374,468,479, skills/ordo/ordo-init/templates/sync_rules.py:6,8,14,38,39, skills/ordo/ordo-init/templates/sync_rules.test.sh:36, skills/ordo/ordo-init/templates/plan-terms.md:10,47,59,106,116, skills/orchestration/plan-orchestration/references/self-rule.md:15, skills/orchestration/plan-orchestration/SKILL.md:328, docs/glossary.md:15,52,64,111,121, README.md:13,40,177,189, and docs/dev/change-standard.md:96 (inside the step's paths).
  - None of the hits outside the paths states a count of the rules, lists them or cites one by position, so the change makes none of them false.
- **Citations by position and counts:** `grep -rniE 'last rule|first rule|(23|twenty-three) (shared )?rules|shared rules.{0,40}(rule [0-9]+|[0-9]+ rules)' skills utils docs README.md agents`
  - It prints only `docs/dev/change-standard.md:96: ... (`skills/ordo/ordo-init/templates/shared-rules.md`, last rule).`, which is inside the paths.
- **Neighbour labels:** `grep -rnE '(Zero warnings|No question boxes|Filter, then rank|A proposal says what exists now|No silent design decisions|No history in a rule file or a comment)' skills utils docs README.md agents | grep -v templates/shared-rules.md`
  - `skills/ordo/ordo-init/templates/sync_rules.test.sh:85` is outside the paths. It is not made false, since the label "Zero warnings" is left unchanged.
  - The other hits are the two rule 6 lines, which are inside the paths.
- **Version:** `grep -rn '8\.0\.1\|8\.1\.0' skills utils docs README.md agents .agents | grep -v '^docs/roadmap.md'`
  - The hit outside the paths is `skills/orchestration/spec/SKILL.md:5: version: "8.0.1"`. It is the `spec` skill's own version and is not made false.
- **Changed texts:** I grepped each of 'stop message is plain text', 'options inside the written rules', 'An option that breaks a written rule', 'Markdown and YAML', 'A write verifies its own result', 'Zero warnings in every configuration', 're-parses what it wrote', 'rule 16' and 'rule 6' across `skills utils docs README.md agents`, excluding `docs/roadmap.md` and `docs/adr/`.
  - Every hit is inside the paths: plan-orchestration/SKILL.md:479 and :501, coding-standards/common.md:10, template change-standard.md:32 and :47, and docs/dev/change-standard.md:33 and :48. "rule 16" and "rule 6" print nothing.
- **Glossary terms:** "open item" (docs/glossary.md:72) and "stop" (docs/glossary.md:129) stay true under R2, because R2 restricts when an open item is raised and does not change what one is. "effort" in R4 is not the glossary's term "effort agent" (docs/glossary.md:45), so the two do not clash. "target" and "wish" have no glossary entry: `grep -n -iE '^- \*\*(target|wish|option|effort|scope)' docs/glossary.md` prints only the "effort agent" line.

Findings:

- **No grep for contradicting statements.** Item 6 asks only for the greps of rule 14, "A change carries to every place that names it", for counts, lists and citations by position. It does not ask for the grep of rule 19, "A change leaves no two statements that contradict each other", by each new rule's key terms. That grep turns up one place a new rule can be read as contradicting:
  - R3 says "an option that drops [a stated wish] is not offered".
  - The decision form of `grill` names the lazy option, "the option that costs less now and leaves the work undone": skills/orchestration/grill/SKILL.md:356 and skills/ordo/ordo-init/templates/plan-terms.md:30.
  - So does plan-orchestration/references/self-rule.md:37: "with its options, the pros and cons of each, one recommendation and the lazy option named".
  - An option that leaves work undone can be read as dropping a wish. The builder is not told whether that is a clash to stop on or a reading that R3's wording must rule out.
  - R4 ("no duration") meets `skills/academic/paper/references/mode_selection_guide.md:52` ("**Expected Duration**: ...") and nearby lines. Those lines describe modes and do not answer an effort question, so in my judgment they are no contradiction.
- **Fix:** add the rule 19 grep to item 6, and name how R3 relates to the lazy option.

## 2. The step line

Step 1's line in plan.md, under "Steps, in execution order", and the requirement that serves each part:

- "the five rules of the goal stand where ruling D3 puts them":
  - in `shared-rules.md`: item 1, which places R1 to R4;
  - in `plan-orchestration/`: item 2, which places R2 and R3;
  - in the template `change-standard.md`: item 3, which places R1 and R5;
  - in `coding-standards/common.md`: item 4, which places R5;
  - in `docs/dev/change-standard.md`: item 5, which places R1 and R5.
  - The five rules: R1 to R5 under "The five rules".
- "the citation 'last rule' in `docs/dev/change-standard.md` names its rule": item 5, second bullet.
- "check: `sh skills/ordo/ordo-init/templates/sync_rules.test.sh` passes, run from the repository root": Verify 1 and the second case.
- "the user reads each rule in its page": the report part "Each of R1 to R5 quoted as written, with the page and the place it stands on", and decision 3.
- "(1 commit)": landing's part, with no builder requirement, as expected.

Findings:

- **R2 and R5 say more than the goal.** The words of R1, R3 and R4 match the goal. Two rules add to it:
  - R2 adds "where one option costs nothing ... it is taken". The goal says only "raised only for options that each cost something the user would weigh".
  - R5 adds "with a YAML parser" and "a file that does not load is not left as written". The goal says only "loaded after every write".
  - These are plausible consequences of the goal's rules, but no ruling in plan.md, Rulings, gives that wording. D3 rules only where each rule goes.
  - The brief binds the builder to "exactly what its line below says, no more and no less", so the additions would ship unless the orchestrator confirms them or trims them to the goal's words.
- No part of the line lacks a requirement.

## 3. Premises

I reran every command of "What is on the tree" in one call. Each fact against what the brief says:

- **Count of rules:** `grep -c '^- \*\*' .../shared-rules.md` printed 23. Match.
- **Rule lines:** `grep -n '^- \*\*' .../shared-rules.md` printed "A proposal says what exists now" at 7, "Filter, then rank" at 12, "Zero warnings" at 19, "No question boxes" at 23, and "No history in a rule file or a comment" at 27, the last. Match.
- **No sentence already states the five rules:** I read shared-rules.md in full. None of R1 to R5 is stated; the nearest are "Zero warnings" and "Filter, then rank". Match.
- **Sync test label:** `grep -n 'Zero warnings' .../sync_rules.test.sh` printed `85:    sed -i.bak 's/^- \*\*Zero warnings\.\*\*.*/- **Zero warnings.** Mostly./' \`. Match.
- **Template change standard:** `grep -n '^6\. \|^16\. ' skills/ordo/ordo-init/templates/docs/dev/change-standard.md` printed lines 32 and 47 with the quoted labels. Match.
- **This repository's change standard:** the same grep on `docs/dev/change-standard.md` printed lines 33 and 48. Match.
  - "No sync reaches it": `grep -n 'change-standard\|common.md' skills/ordo/ordo-init/templates/*.py skills/orchestration/land/templates/*.sh` printed nothing. Match.
- **"last rule":** `grep -n 'last rule' docs/dev/change-standard.md` printed line 96 with the quoted text. Match.
- **YAML bullet:** `grep -n 'Markdown and YAML' .../coding-standards/common.md` printed `10:- **Markdown and YAML.** Each paragraph and each bullet is one line, as the prose standard's section F sets for source formatting.` Match.
- **plan-orchestration sections:** the grep printed `## Stops` at 457, `## Anti-patterns` at 492 and `## Rules` at 509, the stop-message bullet at 479 and the Anti-patterns row at 501, with the quoted texts. Match.
- **Version:** `grep -n version .../plan-orchestration/SKILL.md` printed `5:  version: "8.0.1"`, plus a table row at 469 that holds the word "version". Match.
- **CLAUDE.md:** `grep -n 'ordo:shared-rules' CLAUDE.md` printed nothing (exit 1). Match.
- **ADRs:** `grep -ln 'shared-rules\|shared rules' docs/adr/*.md` printed nothing (exit 1). The grep part matches. The claim that no record's decision governs the step is examined under check 7.
- **D3:** the brief's paraphrase matches the D3 bullet of plan.md, Rulings.
- **Sync test now:** `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1` printed `PASS: sync_rules.py scratch tests`.

Findings: every premise command printed what the brief says. Only the ADR premise is open, under check 7.

## 4. Cases and checks

Findings:

- **R3 is asked for in two sections of one skill.** Item 2 asks for R3 under "## Stops" and also in "## Anti-patterns", "where an option that fails R3 is a tempting shortcut".
  - `docs/dev/skill-layout.md`, "Where a rule goes", says: "A rule is written once. Another place that needs it names the section it is in." Its Anti-patterns table lists "The same rule written in two sections".
  - The existing row "An option that breaks a written rule, in a stop" already covers an option that fails R3, once R3 is a written rule in the shared rules.
  - The brief should say whether the Anti-patterns row states R3 or only points at the Stops bullet.
- **The YAML bullet's form is open.** Item 4 asks for R5 in the bullet "Markdown and YAML" of `coding-standards/common.md`, worded "in the form of its neighbours".
  - That page's neighbour for a change-standard rule names the rule and does not restate it: line 8, "The change standard's rule 'No history in code or comments' says ...".
  - "What it must do" asks that each rule "stands on each page D3 names".
  - The brief does not settle whether a pointer to rule 16 counts as standing there or whether R5 is restated. Either form adds a second requirement to a bullet about one-line formatting.
- **Item 5 locates its change by line number.** "On line 96" breaks `docs/dev/change-standard.md`, "Where the work happens": "A ledger file cites a page ... by its section, never by a line number". The quoted text "last rule" also locates it, so the harm is small. "Rules this repository already states, the last bullet" would comply.
- **No case for most of the step's work.** The cases cover R3 in the shared rules, R2 in plan-orchestration, R5 in rule 16 of the template change standard, the count, the sync test and the "last rule" grep. Nothing below has a case or a verify line:
  - R1 on any page;
  - R4 on any page;
  - R2 in the shared rules;
  - R3 in plan-orchestration;
  - R5 in `common.md` and in `docs/dev/change-standard.md`;
  - the "same words as in the template" requirement of item 5;
  - "stays the last rule";
  - `8.1.0`;
  - "No other sentence of the skill is changed".
  - The report's quote of R1 to R5 with their places is the only coverage of these.
- **No case asks for a check of a place the step does not change.** The second case runs the unchanged sync test, which the step line names, so it is legitimate.
- **The size line is right.** The glossary's "small text step" (docs/glossary.md:124) is "a step whose brief changes no script, no test and no configuration file, and fewer than 20 lines in all", counted as lines added plus lines removed.
  - The step changes no script, no test and no configuration file; the YAML frontmatter of SKILL.md is not a configuration file.
  - The smallest diff the brief allows is 21 lines:
    - 4 new bullets in the shared rules;
    - 5 in plan-orchestration: the version line 2, the stop-message change at least 2, and a new Anti-patterns row at least 1;
    - 4 in the template change standard, for rules 6 and 16;
    - 2 in `common.md`;
    - 6 in `docs/dev/change-standard.md`, for rules 6, 16 and line 96.
  - 21 is at or above 20, so "a full step" is right. The margin is one line.
- **The version raise is not weighed against the major criterion.** `docs/dev/skill-layout.md`, "Frontmatter", gives the major part "when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed".
  - Under R2 a stop the skill raised before is no longer raised. Under R3 an option it offered before is no longer offered. Both change or remove output of a run that worked before.
  - Decision 2's reason, "held to two more rules", does not weigh this. In my judgment the brief should state why minor holds, or raise to `9.0.0`.
- **The `ordo-init` version raise is not booked.** Decision 2 leaves the version of `ordo-init` to step 3, although step 1 changes three of its templates.
  - Step 3's line does not say it raises the version.
  - `grep -n -i version` over the state file and plan.md prints nothing.
  - So the raise for `ordo-init` is booked nowhere, and step 3's brief could miss it.

## 5. The question

The goal for step 1 is that the five rules stand on their pages. Could each check pass without it?

Findings:

- **First case (27 bullets):** yes. Four bullets with the wrong content, or with R1 in the wrong place, still count 27.
- **Second case (sync test):** yes. The test passes on the unchanged tree now (`PASS: sync_rules.py scratch tests`), and plan.md says the same for step 1.
- **Third case (R3 answers no):** no, it is a reading of R3's bullet. It covers only R3 in the shared rules.
- **Fourth case (costless option taken):** no, for R2 in plan-orchestration. It covers nothing else.
- **Fifth case (rule 16 and `plan.yaml`):** no, for R5 in rule 16 of the template change standard only.
- **Sixth case (`grep 'last rule'` prints nothing):** yes. Deleting the citation, or putting in a wrong label, also passes. `grep -n '"No history in a rule file or a comment")' docs/dev/change-standard.md` printing line 96 would not pass that way.
- **The step line's check:** the sync test alone, yes. With the user's reading of each rule in its page, no.
- **Each item of "What to build":**
  - Item 1: yes. Only the count and the R3 case check it, so R1, R2 and R4 could be missing or misplaced, and "stays the last rule" has no check (`grep '^- \*\*' ... | tail -1` would give one).
  - Item 2: yes for R3 and for the version, since only the R2 case covers this item.
  - Item 3: yes for R1, since only the R5 case covers this item.
  - Item 4: yes, no case.
  - Item 5: yes. Only the weak "last rule" grep covers it, and "the same words as in the template" has no check. A `diff` of rules 6 and 16 between the two change standards would give one.
  - Item 6: yes, no check; the report names the grep.
  - Verify 7 and the report's quote of each rule mean the reviewer and the user read the rules, but no case requires it.

## 6. Implied inputs

Findings: this is a text step. It changes rule pages and a skill's text, and no script, no test and no configuration file. A metadata value of SKILL.md is not a configuration file. It implies no inputs that need cases.

## 7. ADRs

Method:

- `ls docs/adr/` lists 50 `NNNN-*.md` records, 0001 to 0051 with 0015 absent, plus README.md and template.md.
- `grep -q '^## Decision'` finds a Decision section in every record.
- I scanned each Decision section for open item, stop message, an option, change standard, yaml, warning, target, shared rule, metadata.version, coding standard, common.md, wish, effort, duration, self-rule and recommendation.
- I read the Decision sections of 0003 (superseded by 0013), 0004, 0005, 0007 and 0011 in full, and the matching sentences of 0014, 0019, 0030, 0035, 0036, 0040, 0041, 0042, 0045, 0047 and 0048. None of those last eleven governs the shared rules, the change standards, `common.md` or the stop message.

Findings:

- **ADR 0005 touches the step.** `docs/adr/0005-the-choices-of-every-plan-go-to-one-file-at-the-ledger-root.md` is in force (`Status: proposed`). The sentence of its decision the step is under is "Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry."
  - R2 changes which decisions reach an open item, and so which become self-rule choices. It sits next to "No question boxes", whose self-rule sentence writes each such choice to the choices file.
  - The brief does not contradict 0005. It does leave open whether an option R2 takes ("no open item is raised") is written to the choices file under self-rule.
  - "What is on the tree" says "No ADR touches the step" and does not name 0005.
- No other record touches the step, and no other part of the brief contradicts an ADR.

## 8. Dictated text

- `grep -n 'so the citation reads' .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/1.md` prints `55:   - On line 96, "last rule" is replaced by the rule's label, so the citation reads (`skills/ordo/ordo-init/templates/shared-rules.md`, "No history in a rule file or a comment").`
  - Holds against the rules file, `docs/dev/skill-layout.md`, the prose standard and the glossary: it is ASCII, has no dash and names the section by its label.
  - It quotes the label, while its neighbours on lines 93 and 95 of the same section leave theirs unquoted ("first paragraph", "Working on Ordo"). This is a style difference and breaks no rule.
- `grep -n '8\.1\.0' .../briefs/1.md` prints `46:   - `metadata.version` is raised by its minor part, to `8.1.0`.`
  - Holds in form under `docs/dev/skill-layout.md`, "Frontmatter".
  - Which part to raise is open, as check 4 says.
- The five rules R1 to R5 are not dictated. The brief gives what each must say and leaves the words to the builder (decision 3).
- `LC_ALL=C grep -n '[^ -~]'` on the brief prints nothing (exit 1), so the brief is ASCII.

## Declined to judge

- `docs/glossary.md` was read for the entries the step's terms touch (brief check, case, open item, stop, small text step, repair round, effort agent, dispatch entry) and not in full. The full output went to a saved file.
- `skills/orchestration/plan-orchestration/SKILL.md` was read for "Stops", "Anti-patterns" and the first part of "Rules", and not in full.
- ADRs other than the five named in check 7 were judged from their Decision sections by keyword scan and the matching sentences, not read in full.
- The cases were not run on the unchanged tree beyond the sync test. That first run is the builder's task.

## Usage
a84e8e7f2b9dce5b4, claude-opus-5-5, 125805 tokens, 30 tool uses, 5 min 42 s

## Closed

- 1, no grep for contradicting statements: item 6 of "What to build" now asks for the grep of each rule's key terms and says how R3 stands with the lazy option; the lazy option is named under "What is on the tree".
- 2, R2 and R5 say more than the goal: both are cut to the goal's words.
- 4, R3 asked for in two sections: R2 and R3 are each stated once, under "Stops", and no Anti-patterns row is added.
- 4, the YAML bullet's form: item 4 asks for one sentence that states R5 and names the change standard's rule.
- 4, item 5 located by a line number: item 5 names the bullet by its words.
- 4 and 5, no case for most of the work, and checks that could pass without the goal: "Cases" now holds a reading case for each rule on each page, the last-rule check by `tail -1`, and the citation check by a positive grep; "Verify before you report" 5 to 7 follow.
- 4, the version raise: `plan-orchestration` is raised by its major part, to 9.0.0, with the reason in decision 2. The dictated line "`metadata.version` is raised by its major part, to `9.0.0`." holds against `docs/dev/skill-layout.md`, "Frontmatter".
- 4, the raise of `ordo-init` not booked: `plan.md` holds it under "Step 3, Step 0".
- 7, ADR 0005 not named: it is named under "What is on the tree" with the sentence the step is under and why R2 leaves it as it is.
