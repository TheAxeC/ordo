# Step 3 brief check (on main at 50fa8bf)

This is the report of the fresh agent run under the `spec` skill's "Steps / The brief check", on `agents/briefs/3.md`. Pages are cited by their section. Grep hits keep their `file:line`.

## 1. Names

- `repair_reviewer`: `grep -rn 'repair_reviewer' skills docs README.md utils agents`. Hits outside the paths: `skills/plan/templates/plan.yaml:30`, `skills/plan/templates/plan.projects.yaml:32,59`, `skills/plan/templates/orchestrator-state.md:30`, `skills/plan/SKILL.md:101-102`, `skills/ordo-init/SKILL.md:98,132,133`, `skills/ordo-init/templates/check_config.py:6,18,21,37,129-136,171`, `skills/ordo-init/templates/check_config.test.sh` (cases at 3-4, 376-568), `docs/adr/0007-...md:11`, `docs/roadmap.md:24-25`. Each says what the key is, its default or how it is checked, and stays true. No hit in `utils/`, `agents/` or `README.md`.
- "reviewer" / `reviewer:` (the sentences that name the reviewer's model): `grep -rn "reviewer:\|reviewer's model\|reviewer\` names\|the reviewer value\|\`reviewer\`" skills docs README.md utils agents`.
  - `skills/plan/templates/plan.yaml:12` reads `reviewer: claude:opus  # required. claude:<model> /refute, the brief check and the lookups of /grill run on.` The change makes this false. After the step, /refute's run over a repair round runs on `repair_reviewer`, so "/refute runs on reviewer" no longer holds for every run. It is the same kind of sentence as the **reviewer** term that was carried to this step from step 1's review (Standards 2, rule 19).
  - `skills/plan/templates/orchestrator-state.md:14` reads `the model /refute, the brief check and the lookups of /grill run on: claude:opus by default; ...`. The change makes it false for the same reason.
  - `.agents/plan.yaml:10` reads `claude:<model> /refute, the brief check and the lookups of /grill run on.`. The change makes it false for the same reason. Line 24 of this plan's state block (`.scratch/2-e-a-self-rule/orchestrator-state.md`) also goes false, and that line is the orchestrator's to change.
  - `skills/plan-orchestration/SKILL.md:139` reads `**Brief-check agent.** ... on the reviewer's model`. It is inside the paths, but no item changes it. Once the reviewer has two models, "the reviewer's model" can be read as either one. The `## 1.` rule of "What it must do" asks for it to be changed in this step.
  - The **brief check** term (`plan-terms.md:12`, `glossary.md:17`) reads "on the reviewer's model". It is in the paths. Item 5 adds a clause to the term but leaves this ambiguity in place.
  - These stay true: `skills/grill/SKILL.md:189` and `:312` (lookups on `reviewer`, which case 5 keeps); `skills/spec/SKILL.md:244` (in the paths, unchanged on purpose); `docs/adr/0003-...md:11`, `docs/dev/blind-comparison.md:24` (their agents run on `reviewer`); `skills/ordo-init/SKILL.md:86,132,133,150`, `skills/repo-setup/SKILL.md:83`, `README.md:139` (key lists); `skills/plan-orchestration/SKILL.md:132` ("Default. ... every agent run on Claude Opus", a default); `:295` and `skills/ordo-help/SKILL.md:79` ("the configured value", which holds read per key).
- "brief check": `grep -rn -i "brief check\|brief-check" skills docs README.md utils agents` (spec and the glossary excluded).
  - `README.md:38`, `skills/ordo-help/SKILL.md:59` and the `spec` description (`skills/spec/SKILL.md:3`, 1022 characters by the skill-layout length command) say the agent checks the brief "against the tree". After the change that description is incomplete but not false. The description has 2 characters to spare.
  - The other hits stay true: `land:93,96,100`, `diagnose:18,42,47,81,170`, `plan-orchestration:28,52,53,131,136,295,335`, the `agents/ordo-*.md` lines 3 and 6, `docs/figures/gen_figures.py:592`, `plan-loop.svg:20`, `docs/adr/0006`, and the plan templates' `reviewer_effort` and dispatch comments.
- "the run over a repair round": `grep -rn -i "over a repair round\|over each repair round\|over the round\|over each round" skills docs README.md utils agents`. Hits: `plan.yaml:17,30`, `orchestrator-state.md:17,30`, `diagnose:167`, the **delta**, **dispatch entry**, **refuter report** and **repair round** terms, `README.md:60`, the figures, ADR 0007, `docs/adr/README.md:17`. None names a model, so none goes false.
- The heading numbers of `brief-check.md`: `grep -rn -e "7\. ADRs" -e "6\. Implied" -e "seven checks" -e "one heading per check" -e "## [0-9]\. " skills docs README.md utils agents`. The only reference is `skills/spec/SKILL.md:263`, which is in the paths. Nothing outside the paths numbers the headings.
- "dictated" / "Dictated text": `grep -rn -i "dictat" skills docs README.md`. The hits are `docs/dev/change-standard.md:30` and `skills/repo-setup/templates/docs/dev/change-standard.md:30` (rule 4, both copies) and `docs/roadmap.md:24-25`. These agree with the change.

Findings:
- 1. `skills/plan/templates/plan.yaml:12`, `skills/plan/templates/orchestrator-state.md:14` and `.agents/plan.yaml:10` go false and lie outside the paths. The fix is to widen the paths with those lines and dictate the new comments. `plan.yaml:12` must keep its `# required.` marker, because `check_config.py:96` reads it.
- 2. `plan-orchestration:139` and the **brief check** term keep "the reviewer's model". Name `reviewer:` in both.

## 2. The step line

- "The run of `/refute` over a repair round on `repair_reviewer` (D22, ADR 0007) ... in `refute`": served by item 1.
- "`plan-orchestration` "The two tiers, and the models" and Steps 8": served by item 2.
- "the brief check holding text the orchestrator dictated into a brief to the standards pages line by line (D8) ... `spec`'s `templates/brief-check.md`": served by item 4, with item 3 (`spec/SKILL.md`, Decision 1).
- The part carried under "Blocked, and by what" (the **reviewer** term, `glossary.md:94`, `plan-terms.md:89`): served by item 5.
- "check: step 4's run over its repair round is served claude-sonnet-5-5, read from its transcript": no item, and the brief never mentions it. See section 5.

Findings: the step line's check has no place in the brief.

## 3. Premises

- Step line `plan.md:29`: `awk 'NR==29' plan.md` matches the brief.
- The carried text `plan.md:102` matches. The term now sits at `docs/glossary.md:94` and `plan-terms.md:89`, as `grep -n '^- \*\*reviewer\*\*' ...` prints. Matches.
- D22 `plan.md:73`, D8 `plan.md:59` and the end of `docs/roadmap.md:24`: match.
- ADR 0007's Decision quote: matches `docs/adr/0007-...md:11`.
- `skills/plan/templates/plan.yaml:30`: the text matches, but the brief collapses the file's column spaces (`sed -n 30p` prints `repair_reviewer: claude:opus              # optional, ...`). State template line 30, `plan/SKILL.md:102`, `.agents/plan.yaml:11` and state block line 40: match.
- `grep -rn 'repair_reviewer' skills/*/SKILL.md` prints only `plan/SKILL.md:101,102` and `ordo-init/SKILL.md:98,132,133`. Matches.
- `refute/SKILL.md:48`, `:79`, `:161`, `plan-orchestration/SKILL.md:112`, `:138`, `spec/SKILL.md:244`, `grill/SKILL.md:189`: the quoted text matches at those lines.
- "the served-model check: `refute` Steps 1 (lines 52-58)": does not match exactly. The check is lines 52-53, the stopped-reviewer record is 54-57, and line 58 is Steps 2.
- `spec/SKILL.md:254-262` (checks), `:263` (item 3) and the template headings `## 1. Names` to `## 7. ADRs`: match.
- "`grep -rn 'dictat' skills docs/dev` prints only rule 4 of the change standard": does not match. It prints two lines, `docs/dev/change-standard.md:30` and `skills/repo-setup/templates/docs/dev/change-standard.md:30`. Both are rule 4, so the substance holds.
- The **brief check** term at `plan-terms.md:12` and `glossary.md:17`: matches.
- The five dictated cases. Each exists: `briefs/1.md:26-31` item 1 (three backticked lines), `briefs/1.md:48` item 9 (backticked comment), `briefs/2.md:26` item 1 (sentence and placeholders), `briefs/2-round-1.md:11-12` ruling 2, and `reviews/2-refuter.md:359` with `:80,:88`.
  - The brief says these five "are dictated under this reading" (Decision 2: "quoted or in a fenced block"; "A paraphrase ("a sentence that names every writer") is not dictated"). That is false for case 3 and case 5.
  - Case 3: `briefs/2.md:26` gives "One sentence under the heading: every agent a plan skill started ..." unquoted.
  - Case 5: `briefs/2-round-1.md:12` gives "The sentence under `## Agents` ... names every writer: `/land` at ...", which is unquoted and is almost exactly the paraphrase that Decision 2 excludes. The reviews still called both "dictated" (`2-refuter.md:80`: "the sentence the brief dictates").
- The claim "findings a line-by-line read at the brief check would have met before the build" is false for case 5. That sentence was dictated in a repair round's brief after the build, and the brief check runs once per step (`spec/SKILL.md:269`), so it never sees a round brief.
- Versions: `grep -n 'version:'` prints refute 1.7.1, spec 1.7.0 and plan-orchestration 2.10.1. Matches.
- Verify 2 baseline: `grep -n 'repair_reviewer' skills/refute/SKILL.md skills/plan-orchestration/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md` prints only `plan-terms.md:24` and `glossary.md:29` (the configuration block term). Matches.
- Verify 3 baseline: `grep -n 'Dictated text' skills/spec/SKILL.md skills/spec/templates/brief-check.md` prints nothing and exits 1. Matches.
- Verify 4: `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template`.

Findings:
- 1. Decision 2's definition excludes two of the five cases the brief says it covers (step 2 item 1 and 2-round-1 ruling 2). Under the definition item 3 writes, the new check would not have met the step 2 defects that motivate it.
- 2. The sentence saying the brief check "would have met" these defects is false for the round-1 sentence, which was written after the brief check.
- 3. Minor: "lines 52-58" should be 52-53. The `dictat` grep prints two lines, not one.

## 4. Cases and checks

- Case 1 (Opus first, Sonnet over round 1): consistent.
- Case 2 (no `repair_reviewer`): consistent.
- Case 3 (round run served Opus under `repair_reviewer: claude:sonnet`): consistent with ADR 0007's served-model sentence.
- Case 4 (first run served Sonnet): consistent.
- Case 5 (brief-check and lookup agents on Opus): consistent. Its reading may come out "partial" while `plan-orchestration:139` and the **brief check** term keep "the reviewer's model" (Names finding 2).
- Case 6 (`plan-orchestration` Steps 8 and "The two tiers" read alone): it is inconsistent with `docs/dev/skill-layout.md` "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in") as item 2 builds it. Item 2 has Steps 8 restate the model while "The two tiers" and `refute` state it too, so one rule sits in three places. The case can be met with Steps 8 naming the section "The two tiers, and the models" rather than restating it.
- Case 7 (three dictated lines, one with an em dash): consistent. The em dash rule is in the prose standard's "0. Hard rules" and "B. Punctuation". However, a brief holding an em dash already fails the ASCII command of the verify list (`git ls-files -coz --exclude-standard` covers the ledger). A case on the real kind would test what the check adds: three list items in paragraph form (prose standard "D. Structure"), as in `2-refuter.md:359`.
- Case 8 (no dictated text): consistent.
- Case 9 (preserved records): consistent with ADR 0006.
- Verify 7 greps across `skills/`, `docs/` and `README.md` only. Rule 14 of the rules file names `skills/`, `utils/`, `docs/` and `README.md`. The brief drops `utils/` (no hits there today, but the rule names it).

Findings:
- 1. Case 6 together with item 2 bullet 2 breaks skill-layout "Where a rule goes".
- 2. Verify 7 omits `utils/` from rule 14's list.

## 5. The question

- Case 1: no. It is read in the text, and the text is the goal's first part.
- Case 2: no.
- Case 3: no.
- Case 4: yes, as a preserved case. It passes on the unchanged tree and guards behaviour rather than proving the change. That is acceptable.
- Case 5: yes, as a preserved case, for the same reason.
- Case 6: no.
- Case 7: yes. A check written as item 3 defines it ("quoted in the brief or in a fenced block") meets case 7's quoted lines while it still skips unquoted dictated sentences. Those are the real step 2 cases, so the case can pass without the goal's second part being reached.
- Case 8: no.
- Case 9: yes, as a preserved case.
- The step line's check ("step 4's run over its repair round is served claude-sonnet-5-5"): yes, for three reasons.
  - (a) The installed skills are pinned. `git -C ~/.local/share/ordo-stable describe --tags` prints `v2.7.0`, `ls -la ~/.claude/skills` shows every skill linked into the pinned worktree, and `grep -n 'reviewer:' ~/.local/share/ordo-stable/skills/refute/SKILL.md` prints line 48, "on the model the configuration block's `reviewer:` names". `README.md:159` says the skills stay at a fixed version until the change is done. Step 4's run over a round is therefore dispatched under v2.7.0's `refute`, which says Opus. A Sonnet serving can only come from the orchestrator acting from its own knowledge, and that passes whatever text step 3 built.
  - (b) It checks nothing of the dictated-text half of the step.
  - (c) It cannot be read when step 4 gets no repair round. The rounds happen only when the first refutation finds something (`refute` "Steps / Over a repair round" 1).
- Item 1's check (verify 2 grep, verify 6 before and after): the grep alone passes on any line holding the key. The before/after quotes and the reviewer's reading carry the proof, as the rules file's "Scripts compute facts; judgment is read" says. No.
- Item 2's check: same as item 1. No.
- Item 3's check (verify 3 grep): the grep passes on a heading alone, and the reading of cases 7 and 8 carries the proof. No, except that the definition gap of case 7 lets the reading pass too.
- Item 4's check: same as item 3.
- Item 5's check (verify 4 `sync_rules.py`): this proves only that the two copies are equal. The reading carries the content. No.
- Item 6's check (no version change): this is not a goal item.

Findings:
- 1. Case 7 and items 3 and 4 can pass with unquoted dictated text unchecked. Fix: widen the definition so that text whose words the brief gives for a file counts, whether quoted, fenced, or given after a colon as the words of a named sentence, line, heading, comment or term. A requirement that names what a sentence must say without giving its words stays the builder's.
- 2. The step line's check can pass without the goal (pinned v2.7.0 skills) and covers only half the step. This needs the session's or the user's decision.
  - (a) Pin a tag that holds step 3 before step 4 runs. A tag and a pin reach outside the repository, so that is the user's.
  - (b) Add a check to this step: the step's reviewer reads the changed sentences, and the orchestrator states in step 4's booking the `refute` sentence of main it followed.
  - (c) Add a second check on the dictated-text part: step 4's brief-check report holds `## 8. Dictated text` with each dictated line.
  - Recommend (b) with (c). They need no change outside the repository. (a) is the lazy option only if it is taken in place of (c).

## 6. Implied inputs

This is a text step. These are the situations the described behaviour implies that the brief leaves without an expected result:
- Unquoted dictated text ("One sentence under the heading: ...", "Line 3 becomes: ..."). There is no expected result, and Decision 2 excludes it (Premises finding 1).
- Dictated text in a repair round's brief (`<step>-round-<n>.md`) or a cases ruling (`<step>-cases.md`), written after the brief check.
  - Real instances: `2-round-1.md` ruling 2, and `1-cases.md`'s guard comments, which step 1's review found breaking rule 10 (`1-refuter.md`, Standards 3).
  - The goal and D8 name the brief check, which never sees these files.
  - Expected result: either a decision in the brief that these are outside this step, raised as an open item because extending D8 is the user's, or a sentence in `plan-orchestration` Steps 8 ("Only known fixes") making the orchestrator hold its round-brief text the same way.
- A line rewritten in the brief to close a check-8 finding, or text added by a ruling after a stop. The check runs once (`spec/SKILL.md:269`), so the rewrite is never read again. No expected result is given.
- A dictated line whose words a ruling of the user fixes, such as D24's term words "in the words of round 2" for step 8, when the line breaks a rule. The session cannot rewrite the user's words. The expected result should be the stop "A brief check finding the brief cannot absorb".
- A dictated code line (a YAML key with its comment, a command, a placeholder such as `- <agent id>: grill lookup, <served model>`). The brief does not say which part is read against which page, for example the comment against the prose standard and the code only against ASCII.
- What the report gives as "the command that shows it" for check 8 (item 2's lead requires a command per check). A `grep -n` locating each line in the brief would serve.
- Where "Or: the brief dictates no text." goes in the template: at the end of the bullet, as headings 6 and 7 place their "Or:", or on its own line.
- The run over the extra round of `plan-orchestration`'s exception, and a replacement reviewer over a round after one stopped for another model. Both are implied by "each run over a repair round" (on `repair_reviewer`, recorded after the stopped one), but no case states them.
- `repair_reviewer` set with `refute_after_repair: no`. The key goes unused and the orchestrator's read stands. No case states this.
- An open plan whose state block predates step 1 (2.F, 2.G, 2.H). This is covered by case 2. The **reviewer** term as item 5 words it states no default, so for those blocks it names nothing.

Findings:
- 1. Unquoted dictated text.
- 2. Round briefs and cases rulings.
- 3. Rewrites that close findings.
- 4. Ruled words that break a rule.
- 5. Code lines.
- 6. Check 8's evidence.
- 7. The placement of the "Or:" in the template.

## 7. ADRs

- `ls docs/adr` lists 0001-0008, plus `README.md` and `template.md`, which are not records. Each record was read whole, and all are `Status: proposed`.
- 0001 (the writing base reads the prose standard where it is): governs `/writing`, which is not in `skills/` (`ls skills`). Does not touch the step.
- 0002 (the prose standard holds over the academic sources): writing skills only. Does not touch the step.
- 0003 (a fresh read-only agent reviews a draft): `/writing`'s agent on `reviewer`. That skill does not exist, so the record does not touch the step. Once it does exist, the **reviewer** term's list of agents on `reviewer:` will need it.
- 0004 and 0005 (self-rule, the choices file): do not touch the step.
- 0006 (the ledger records every agent's id with its role): touches the step through the over-round record. The step is under "each reviewer in `reviewer_report`". The brief names it, and case 9 keeps it.
- 0007 (the run over a repair round runs on its own reviewer model): touches the step, which is under "The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`. ... The served-model check applies to it as to every agent." The brief names it. Items 1 and 2 follow it, and case 3 covers the served-model sentence.
- 0008 (the cost script's price table): does not touch the step.

Findings: none.

## 8. Dictated text

Under the brief's own definition (quoted or fenced), most of the text below is not dictated. It is given unquoted after a colon, which is the form Premises finding 1 shows. Each passage the builder is to carry into a file is read below.

- Item 3 label "**Dictated text.**": holds. It is a noun-phrase label, and bold marks a list-item label (skill-layout "Lists and tables").
- Item 3, "Each passage the brief dictates (text the builder is to put into a file word for word, quoted in the brief or in a fenced block, a comment, a sentence, a table row or a placeholder line included) is read line by line against the rules file and each standards page the configuration names.": breaks prose-standard "E. Sentence shapes", sentence length (about 50 words; the parenthetical definition can be its own sentence). The comma list after "fenced block" reads as more places rather than kinds of text. Its content is Premises finding 1.
- Item 3, the three sentences in one bullet (the read, the report form, the no-text case): breaks skill-layout "Lists and tables", one rule per bullet. They should be sub-bullets, as the `spec` text uses elsewhere.
- Item 3, "For each line the report gives the line, then either "holds" or each rule it breaks, named with its page and section.": holds.
- Item 3, "A brief that dictates no text is reported as such.": holds. The passive matches the sibling checks, whose actor item 2's lead names.
- Item 4 heading `## 8. Dictated text`: holds.
- Item 4 bullet `<the line, quoted>`: holds, or the rule it breaks with its page and section: breaks the rules file's rule 19. It says "the rule" where item 3 says "each rule it breaks", and a line that breaks two rules gets one.
- Item 4 `Findings: <each line that breaks a rule>. Or: none.`: holds.
- Item 4 `Or: the brief dictates no text.`: the words hold. Its place in the template is not stated (Implied inputs 7).
- Item 5, **reviewer** clause "the first run on the model `reviewer:` names; the run over a repair round on the model `repair_reviewer:` names; the brief-check agent and the lookup agents of `grill` on `reviewer:`.": breaks prose-standard "B. Punctuation" (two semicolons in one clause of running prose) and "D. Structure" ("Three or more list-shaped items in paragraph form become a list"). It also omits the default that item 1 states. A suggested rewrite: "on the model the configuration block's `reviewer:` names, and for the run over a repair round the model `repair_reviewer:` names, the `reviewer:` value when the block has none. The brief-check agent and the lookup agents of `grill` run on `reviewer:`."
- Item 5, "Stated in" addition `refute`, "Steps / Over a repair round" 1: holds, in the form the other terms cite.
- Item 5, **brief check** clause "it also holds the text the brief dictates to the rules file and the standards pages, line by line.": holds. The term's untouched "on the reviewer's model" is Names finding 2.
- Item 1 bullet 2, "each run over a repair round is dispatched as Steps 1 says, on the model the configuration block's `repair_reviewer:` names, the `reviewer:` value when the block has no such key, at the same `reviewer_effort`.": holds. It is a long sentence, but the mechanism needs it (prose E).
- Item 1 bullet 3, "compares a run over a round with the `repair_reviewer:` value": breaks prose-standard "D. Structure", no synonym cycling, against the brief's own Conventions ("The same thing has one name everywhere: "the run over a repair round"").
- Item 2 bullet 1 (the Reviewer bullet), "the first run on the model `reviewer:` names; each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none; both at the effort `reviewer_effort` names, launched as ...":
  - It breaks prose-standard "B. Punctuation" (two semicolons) and skill-layout "Lists and tables" (two models and an effort in one bullet).
  - Sub-bullets under **Reviewer.** would fix both.
- Item 2 bullet 2 (Steps 8), "the fresh reviewer over the round runs on the model `repair_reviewer:` names, as the `refute` skill's "Steps / Over a repair round" 1 says.": breaks skill-layout "Where a rule goes" ("A rule is written once") and its Anti-patterns row "The same rule written in two sections". Steps 8 can name "The two tiers, and the models" instead.
- Report first line "Everything in the brief is done": holds.

Findings:
- Item 3's first sentence: sentence length.
- Item 3's bullet: three rules in one bullet.
- Item 4's template bullet: "the rule" against item 3's "each rule".
- Item 5's **reviewer** clause: semicolons and a list in paragraph form, and no default.
- Item 1 bullet 3: "a run over a round", a second name.
- Item 2 bullet 1: semicolons and three rules in one bullet.
- Item 2 bullet 2: the same rule written in a second section.

## Declined to judge

- Whether to pin a tag holding step 3 before step 4 runs, which is option (a) under section 5. A tag and a pin reach outside the repository, so this is the user's call.
- Whether round briefs and cases rulings fall inside D8. The ruling names the brief check, and widening it is the user's call. The evidence is under Implied inputs 2.
- Whether the glossary's bullets count as running prose for the semicolon limit. `grep -o ';' skills/repo-setup/templates/plan-terms.md | wc -l` prints 91 against 5945 words (`wc -w`), so the existing block is far above 2 per 1000. That limit is applied above only to the new clause.
- The served model of step 4's run over a round. It does not exist yet.

Agent usage: a844cca8905e3bb9c, claude-opus-5-5 (ordo-high), 204215 tokens, 41 tool uses, 8 min 15 s

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names 1 (three configuration comments go false outside the paths): item 6 added, dictating the three new comments with `# required.` kept on `plan.yaml:12`; the three lines added to "Paths this step writes"; a premise and verify 3 added for them; this plan's state block line 24 changed by the orchestrator in the preparation commit.
- Names 2 ("the reviewer's model" in `plan-orchestration:139` and the **brief check** term): item 2 gains the **Brief-check agent** bullet; item 5's **brief check** clause names `reviewer:`; verify 8 greps "the reviewer's model".
- The step line (its check has no place in the brief) and The question 2 (the check can pass without the goal): Decision 7 added; `plan.md` "Blocked, and by what" gains a bullet for step 4 (the served model, the booking quoting the `refute` sentence of main followed, `## 8. Dictated text` in step 4's brief-check report, and the first later step with a round when step 4 has none). Option (a), a pin, is not taken: it reaches outside the repository and is the user's.
- Premises 1, Cases and checks 1 of section 5, Implied inputs 1 (unquoted dictated text): the definition widened in item 3, Decision 2 and the premise to text given after a colon as the words of a named sentence, line, heading, comment, table row or term; case 7 replaced by an unquoted sentence holding three list items in paragraph form; a paraphrase case added.
- Premises 2 ("would have met" false for the round-1 sentence): the premise now says that sentence was written after the brief check, which never reads a round's brief.
- Premises 3 (lines 52-58; the `dictat` grep): corrected to 52-53 and to the two lines it prints.
- Cases and checks 1 (Steps 8 restating the rule): item 2's Steps 8 bullet now names "The two tiers, and the models" and does not restate the key.
- Cases and checks 2 (verify omits `utils/`): verify 8 greps `skills/`, `utils/`, `docs/` and `README.md`.
- Implied inputs 2 (round briefs and cases rulings): item 2 gains the orchestrator's line-by-line hold of a round's brief and a cases ruling in Steps 8 (and Steps 6), Decision 5, and a case.
- Implied inputs 3 (rewrites never re-read): item 3 adds to "The brief check" 4 that a dictated line rewritten or added after the check is held line by line before the preparation commit; case 9 says so.
- Implied inputs 4 (ruled words that break a rule): item 3 makes it the stop "A brief check finding the brief cannot absorb"; a case added.
- Implied inputs 5 (code lines): item 3 and Decision 3 read a code line whole and its comment as prose; a case added.
- Implied inputs 6 (check 8's evidence): the report gives the `grep -n` that finds each line in the brief (item 3, item 4's template).
- Implied inputs 7 (the place of "Or:"): item 4 dictates the heading in a fenced block, "Or:" at the end of the bullet as headings 6 and 7 place it.
- Implied inputs, the extra round and a replacement reviewer over a round; `repair_reviewer` with `refute_after_repair: no`: item 1 covers both runs; two cases added.
- Implied inputs, open plans whose block predates step 1: item 5's **reviewer** sentence now states the default.
- Dictated text, item 3's first sentence and its three rules in one bullet: item 3 rewritten as sub-bullets, one rule each, its definition its own sub-bullet.
- Dictated text, item 4's "the rule": the template bullet says "each rule it breaks".
- Dictated text, item 5's **reviewer** clause: dictated in a fenced block as three sentences with no semicolons, the default stated.
- Dictated text, item 1 bullet 3's "a run over a round": rewritten as "each run over a repair round".
- Dictated text, item 2 bullet 1: the **Reviewer** bullet is given as sub-bullets, one rule each, worded by the builder.
- Dictated text, item 2 bullet 2: names the section, as Cases and checks 1.
- Each dictated line of the brief as changed (item 4's heading block, item 5's two term texts, item 6's three comments) was held line by line by the session against the rules file, skill-layout and the prose standard: each holds (no semicolons in running prose, no list in paragraph form, one name per thing, ASCII).
