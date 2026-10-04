# Step 1 brief check (on main at 9fc91dc)

This is the brief-check report for `agents/briefs/1.md`, written by the fresh agent that "Steps / The brief check" of the `spec` skill starts. Pages are cited by section. Code and grep hits are cited by `file:line`. Nothing in the repository was written. `git status --short` prints only `?? .scratch/2-e-a-self-rule/agents/briefs/1.md`, and `git log -1 --format=%h` prints `9fc91dc`.

## 1. Names

- **The three keys.** `git grep -n -E 'self_rule|next_entry|repair_reviewer' -- . ':!.scratch'` gives these hits outside the paths:
  - `docs/adr/0005-...md:7` and `:11`
  - `docs/adr/0007-...md:11`
  - `docs/roadmap.md:24` and `:25`
  
  Each of them describes the keys as the step builds them. The change makes none of them false.
- **Other lists of the plan.yaml keys and the configuration block keys.** Commands: `git grep -n -E 'reviewer_effort|worker_effort' -- . ':!.scratch'` and `git grep -n -i -E 'optional key|every key|the keys|configuration block' -- README.md docs/dev skills/*/SKILL.md skills/*/templates`. The hits outside the paths:
  - `skills/grill/SKILL.md:34` ("The optional keys are `standards` ..., `adr` ..., `design_bar` ..., `design_references` ... and `reviewer_effort` ..."). This lists the keys grill reads, and grill does not read the new keys until step 7. Not made false.
  - `README.md:139` ("Nine are required: ..."). Still true.
  - `README.md:141` ("A key left out takes the default written beside it in the example `plan.yaml`."). It is made misleading for `repair_reviewer`. The value written beside that key is `claude:opus`, but a missing key takes the configured `reviewer`. Read as "the comment's default", the sentence holds. Read as "the value", it is false. `README.md` is not in the paths.
  - `skills/plan/SKILL.md:34` ("An optional key missing takes the default the example file gives it."). Holds, because the default is read from the comment.
  - `skills/plan/templates/plan.projects.yaml:2` ("with the same required keys and the same defaults"). Holds.
  - `skills/ordo-init/SKILL.md:29` and `:86`. Hold.
- **Sentences inside the paths that the change makes false and that no item names.**
  - `skills/plan/templates/plan.yaml:3` reads "An optional key that is missing takes the value written here." After item 1, the value written for `repair_reviewer` is `claude:opus`, but a missing `repair_reviewer` takes the `reviewer` value. The file is in the paths, but "What to build" item 1 does not ask for line 3 to change.
  - `skills/ordo-init/templates/check_config.py:6` reads "The keys, which of them are required and each optional key's default come from the plan skill's templates/plan.yaml". For `repair_reviewer` the default comes from the configured `reviewer`, not from the template.
  - `skills/ordo-init/templates/check_config.py:19` reads "For adr, design_bar, design_references, worker_effort and reviewer_effort the value check above replaces the kind check". Once `self_rule` and `next_entry` join `VALUE_CHECKED`, this list is incomplete.
  - Item 3's last bullet names only "the module docstring's lists of errors and notes". Neither sentence above is in those lists.
- **The terms used in item 1's comment text and item 5's state-file text.**
  - `git grep -n -i 'six kinds\|choices.md\|self-rule' -- skills docs/glossary.md` prints nothing.
  - `git grep -n -i 'kinds' skills/plan-orchestration/SKILL.md` prints `skills/plan-orchestration/SKILL.md:283:The table holds seven kinds of stop, ...`.
  - Item 1's `self_rule` comment says "closes an open item outside the six kinds of plan-orchestration's Stops ... writes it to <ledger_root>/choices.md". When step 1 lands, it points at a section that holds seven kinds of stop and no six kinds, and at a file no skill yet names.
  - It also uses **open item** in a sense the glossary does not define yet. `docs/glossary.md:62` says an open item is "closed by the user's ruling". The D24 amendment comes in step 8.
  - This conflicts with the brief's "Conventions" ("Terms as `docs/glossary.md` defines them") and with `docs/dev/skill-layout.md`, "Writing for an agent".
- **The configuration block term.** `sed -n 23p skills/repo-setup/templates/plan-terms.md | diff - <(sed -n 28p docs/glossary.md)` prints nothing (the two lines are identical). Both files are in the paths.

Findings:
- (a) `skills/plan/templates/plan.yaml:3` becomes false for `repair_reviewer`, and no item asks for it to change.
- (b) `README.md:141` becomes ambiguous or false for `repair_reviewer` and is outside the paths. The brief should either add it to the paths or say why the sentence holds.
- (c) `check_config.py:6` and `:19` become false or incomplete, and item 3 names only the docstring's lists of errors and notes.
- (d) Item 1's and item 5's texts cite "the six kinds of plan-orchestration's Stops", which do not exist on the tree (the section holds seven kinds of stop). They name `<ledger_root>/choices.md`, which no skill yet names. They use "open item" in a sense the glossary does not yet define. All of this stays so until steps 6 and 8 land.

## 2. The step line

- "The keys `self_rule` and `next_entry` (`on` or `off`, default `off`; D1)": items 1, 2 and 3.
- "`repair_reviewer` (`claude:<model>`, default the `reviewer` value; D22)": items 1, 2 and 3.
- "in both `plan.yaml` templates": items 1 and 2.
- "`check_config.py` with `check_config.test.sh`": items 3 and 4.
- "the state file template's block": item 5.
- "`/plan`'s Steps 4 key list": item 6. `awk` over `skills/plan/SKILL.md` shows Steps 4 starting at line 98, so line 99 is inside Steps 4.
- "`repair_reviewer: claude:sonnet` in Ordo's `.agents/plan.yaml`": item 9.
- The check "`check_config.test.sh` passes with new cases for a bad value and for each default, and `check_config.py` passes on Ordo": covered by "Cases" and "Verify before you report" 2 and 3.

Findings: none.

## 3. Premises

- `sed -n 87,95p` shows `example_keys` at lines 87-95. Matches.
- `grep -n VALUE_CHECKED` prints line 33 (the definition) and line 147 (the skip). Line 150 is the kind-check error. Matches.
- "`worker` and `reviewer` are checked against `^claude:\S+$` (lines 145-148)". `sed -n 141,150p` shows the `worker`/`reviewer` loop at `check_config.py:141-144`, with the match at `:143` and `MODEL` defined at `:29`. Lines 145-148 are the kind-check loop. **Does not match.**
- The PyYAML probe prints `{'a': True} {'a': False}`. Matches. `plan.yaml:17` writes `refute_after_repair: yes`. Matches.
- `wc -l` gives `skills/plan/templates/plan.yaml` 27 lines. `sed -n 26,27p` shows `worker_effort` and `reviewer_effort`. Matches.
- `wc -l` gives `plan.projects.yaml` 53 lines. `grep -n effort` prints 28, 29, 52 and 53. Matches.
- `orchestrator-state.md` has `worker:` at 13, `reviewer:` at 14, `worker_effort:` at 26 and `reviewer_effort:` at 27. Matches.
- `skills/plan/SKILL.md:99` ends "`worker_effort`, `reviewer_effort`." Matches.
- `skills/ordo-init/SKILL.md:98` is the "left out unless the user gives a value" bullet. `:132` is the errors list and `:133` the notes. Matches.
- `plan-terms.md:23` and `glossary.md:28` are identical and end "`worker_effort` and `reviewer_effort`". `sync_rules.py . --only glossary` prints `ok: the plan-terms block equals the template` with exit 0. Matches.
- `check_config.test.sh` has 354 lines. Matches.
- `.agents/plan.yaml` has 13 lines, and `grep -c repair_reviewer` prints 0. Matches.
- The ADR 0007 quote matches `docs/adr/0007-...md:11`. The brief leaves out that line's third sentence, "The served-model check applies to it as to every agent." That sentence belongs to step 3.

Findings: the line numbers of the `worker`/`reviewer` model check are wrong. The brief says 145-148; the tree has `check_config.py:141-144`.

## 4. Cases and checks

- **One-project example passes.** Consistent. See check 5 for what it proves.
- **`self_rule: on` and `next_entry: on` pass, with no note about `next_entry`.** Consistent. Its control is the `next_entry: on`/`self_rule: off` case (change standard, "The rules" 13, third bullet).
- **`self_rule: maybe`, `next_entry: 1`, `self_rule:` (empty), `repair_reviewer: opus`, `repair_reviewer: claude:sonnet`.** Consistent.
- **The three keys removed.**
  - The case asserts `self_rule not set, default False applies` and `next_entry not set, default False applies`.
  - The change standard, "Scripts compute facts; judgment is read", says: "What a skill or tool gives the user is written for a person to read, never in a machine's format."
  - The key's own documentation says `default off` (item 1), and the error the brief dictates says "neither on nor off" (decision 1: "The error names `on` and `off`, the words the skills use").
  - So the note names the default as the Python literal `False`, a word the key's template, state block and error never use. That `refute_after_repair` prints `default True` today is precedent, not a reason.
- **`next_entry: on` with `self_rule: off`.** Consistent.
- **Projects example with `repair_reviewer: opus` in one project.** The expected result is left open ("(or the project the builder edits)"). A case states its expected result. The `spec` skill's cases are "an input with its expected result" (glossary, **case**).
- **`repair_reviewer` written twice.**
  - I ran the unchanged `UniqueKeyLoader` in memory on the template with `repair_reviewer` written twice. It prints `error: key written twice: repair_reviewer`, so this case already passes on the unchanged tree.
  - "Verify before you report" 4 and the change standard, "The rules" 13, first bullet, require each new test of a behaviour the change adds to fail on the unchanged tree. The brief does not say that this case is a test of preserved behaviour, so a builder following verify 4 will find the case at odds with it.
- **`check_config.py .` on Ordo.** "Cases" opens with "Each case is a test in `check_config.test.sh`, on a scratch repository from `make_repo`". This last case runs on Ordo's tree, not on a scratch repository, and cannot be a test in the suite.

Findings:
- (a) The generic notes `default False applies` for `self_rule` and `next_entry` are in a machine's format and contradict the brief's own on/off wording.
- (b) The projects case's expected project is left open.
- (c) The duplicate-key case passes on the unchanged tree, and the brief does not label it as preserved behaviour, which contradicts "Verify before you report" 4.
- (d) The Ordo case contradicts "Cases"' own lead sentence. It is a verification command (verify 2), not a test in the suite.

## 5. The question

- **Case "one-project example passes".** Yes. It passes on the unchanged tree and after a template missing any of the three keys, since a missing key gives only a note. The existing `five-keys` case (`check_config.test.sh:170-176`) adds `lacks_line` for each not-set note. This case has no such assertion.
- **Case "`self_rule: on` and `next_entry: on` pass".** No. On the unchanged tree both keys are unknown and give errors.
- **Cases `self_rule: maybe`, `next_entry: 1`, `self_rule:` (empty), `repair_reviewer: opus`, `repair_reviewer: claude:sonnet`.** No. Each gives "unknown key" on the unchanged tree, and `expect_refusal` requires the exact line and one error.
- **Case "three keys removed".**
  - The `repair_reviewer` note: yes, partly. The scratch repository's `reviewer` is `claude:opus`, which is also the template's `repair_reviewer` example value. A note printing a fixed `'claude:opus'`, or the template value, passes. A case with `reviewer: claude:haiku` (or any value other than `claude:opus`) and `repair_reviewer` removed, expecting `repair_reviewer not set, the reviewer's value 'claude:haiku' applies`, would prove that the note names the configured `reviewer`.
  - The generic notes: the brief already calls them an audit of item 1.
- **Case "`next_entry: on` with `self_rule: off`".** No.
- **Case "projects example passes, `repair_reviewer: opus` in one project errors".** The error part: no. The pass part: yes. `set_project_key` (`check_config.test.sh:155-161`) inserts the key whether or not the template has it, and a project missing the three keys still passes with notes. Item 2 (the keys in both projects) can therefore pass undone. `projects-five` (`check_config.test.sh:184-196`) shows the pattern that proves it: `lacks_line` of each project's not-set note, with a control that removes one key from tool-b.
- **Case "`repair_reviewer` written twice".** Yes. It passes on the unchanged tree (see check 4).
- **Case "Ordo passes".** Yes for item 9: it passes whether or not `repair_reviewer: claude:sonnet` is written into `.agents/plan.yaml`. No check reads the line (for example `grep -n '^repair_reviewer: claude:sonnet' .agents/plan.yaml`).
- **The step line's check.** Yes for the part of the goal "written into every plan's state block". The test and the Ordo run do not touch items 5, 6, 7 or 8, so the check passes with the state file template and `/plan`'s Steps 4 unchanged. The plan's answer for step 1 ("the test's cases for a bad value and for each default fail on the unchanged tree") covers only `check_config.py`. The brief does not say how items 5 to 8 are proven. They could be read in place with the text before and after quoted, as the change standard, "The rules" 1, says for text.
- **Item 1.** No, through the cases above, except for the example-passes case.
- **Item 2.** Yes, as above.
- **Item 3.** No for errors. Yes, partly, for the note naming `reviewer` (above).
- **Item 4.** No for the tests. The head comment is judged by reading.
- **Items 5 and 6.** Yes. No case or check reaches them (above).
- **Item 7.** Yes. It is judged only by reading, and the brief does not say so.
- **Item 8.** Yes. `sync_rules.py --only glossary` passes whether both lines change or neither does.
- **Item 9.** Yes (above).
- **Item 10.** No check is named. `git diff` of the frontmatter would show it.

Findings:
- (a) The example-passes case has no `lacks_line` for the three not-set notes.
- (b) The repair_reviewer note case uses a `reviewer` equal to the template's example value.
- (c) Nothing proves item 2 in both projects.
- (d) The duplicate case passes on the unchanged tree.
- (e) Nothing proves item 9's line.
- (f) The step line's check and the brief name no proof for items 5 to 8 (the state block and `/plan`'s key list, which are the "written into every plan's state block" part of the goal).

## 6. Implied inputs

This is a code step. I probed the unchanged `check_config.py` in memory, with `check_project` given the keys the new template would give (`self_rule: False`, `next_entry: False`, `repair_reviewer: 'the reviewer value'`, taken from the regex on item 1's lines). It printed `list ["repair_reviewer is a list, its default is a str: ['claude:opus']"]`, `int [...is a int...]`, `bool [...is a bool...]`, `empty []`, `worker-empty []` and `self_rule quoted on ["self_rule is a str, its default is a bool: 'on'"]`.

- **`repair_reviewer: [claude:opus]`, `repair_reviewer: 5` or `repair_reviewer: yes`.** Missing. Item 3 checks the key against `MODEL` but does not add it to `VALUE_CHECKED`. Its default `'the reviewer value'` is a `str`, so the kind check at `check_config.py:145-150` also fires, and the result is two error lines. The expected result is one line, `error: repair_reviewer is not claude:<model>: ['claude:opus']`, which needs `repair_reviewer` in `VALUE_CHECKED`.
- **`repair_reviewer:` (empty).** Missing. Copied from the `worker`/`reviewer` loop (`check_config.py:143`, `value is not None`), it passes with no error and no note: the key is present, so no not-set note is printed. The expected result is `error: repair_reviewer is not claude:<model>: None`. The same probe shows that `worker:` empty passes silently today. That is the same line of code the item extends.
- **`self_rule: yes` and `self_rule: true`.** Missing. Decision 1 says they pass. Expected: pass.
- **`self_rule: "on"` (quoted).** Missing. Under item 3 it gives `self_rule is neither on nor off: 'on'`, a line that contradicts itself for a reader. The expected result, and whether the error text should say it is quoted text, should be stated.
- **`self_rule: On` or `ON`.** Missing. YAML 1.1 reads them as `True`, so they pass, unlike `design_bar: Industry`, which is refused. Expected: pass, stated.
- **`next_entry:` (empty).** Missing. Expected: `error: next_entry is neither on nor off: None`.
- **`next_entry: on` with `self_rule` left out.** Missing. Item 3 names this input. Expected: pass, with `note: self_rule not set, default ... applies` and `note: next_entry is on while self_rule is off; it acts only under self-rule`.
- **`next_entry: on` with `self_rule: maybe`.** Missing. Expected: the one error line for `self_rule`. Whether the `next_entry` note is also printed is not stated.
- **`repair_reviewer` left out with `reviewer` missing.** Missing, although item 3 states it. Expected: `error: required key missing: reviewer` and `note: repair_reviewer not set, the reviewer's value applies`.
- **`repair_reviewer` left out with `reviewer: opus` (invalid).** Missing. Whether the note names `'opus'` is not stated.
- **`repair_reviewer: claude:sonnet` with `reviewer` missing.** Missing. Expected: the one error line `required key missing: reviewer`.
- **The `projects:` form with the three keys left out of one project.** Missing. Expected: notes prefixed `tool-b: `, the `repair_reviewer` note naming tool-b's own `reviewer`. The same form with `next_entry: on` and `self_rule: off` in one project should give the `next_entry` note with its project prefix, which item 3's note text does not show.
- **`self_rule` or `next_entry` written twice.** Missing. The change standard, "The rules" 15, exercises every key a change introduces "duplicated". Only `repair_reviewer` has a case.
- **A new key colliding with a reserved position.** Missing. For example, `repair_reviewer: claude:sonnet` beside `projects:`. Expected: `error: keys beside projects: ['repair_reviewer']`. The change standard, "The rules" 15, names "colliding with a reserved one".
- **The `projects:` form with the merge key.** `make_merge_repo` gives tool-b tool-a's keys through `<<: *base`, so the existing `merge-key` case covers this once the template carries the keys. Listed.

Findings: every item above marked missing, each with the expected result stated in its bullet. The most costly are the list, number or boolean `repair_reviewer`, which gives two error lines, and the empty `repair_reviewer`, which is accepted silently. A wrong configuration accepted is the cost the change standard, "Scripts compute facts; judgment is read", names.

## 7. ADRs

Command: `ls docs/adr`, then every `docs/adr/[0-9]*.md` read in full. All eight have `Status: proposed`, and none is superseded.

- **0001, 0002, 0003.** They do not touch the step. 0003 names `reviewer` and `reviewer_effort` for `/writing`, which is unchanged.
- **0004** ("A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)"."). Item 1's `self_rule` comment says the orchestrator "books it". There is no contradiction. The comment states behaviour under this decision, and the brief does not name the record.
- **0005** ("Every choice taken under self-rule, by the loop or by `/grill` under `next_entry`, is written to `<ledger_root>/choices.md`, grouped by roadmap entry."). Item 1's `self_rule` comment writes that name and rule ("writes it to <ledger_root>/choices.md"). By the glossary's **ADR** definition ("A record touches a step when its decision governs a file, a name, a rule or a behaviour the step changes"), it touches the step. There is no contradiction. The brief says 0001 to 0006 "do not govern a file this step changes".
- **0006, 0008.** They do not touch the step.
- **0007** ("The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`. Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`."). It touches the step, the brief names it, and there is no contradiction.

Findings: 0005, and arguably 0004, touch the text item 1 dictates (and item 5's state-file comment for `self_rule`). The brief does not name them under "What is on the tree", and it states that they do not govern a file the step changes.

## Declined to judge

- Whether the `self_rule` and `next_entry` comments should wait for steps 6 and 8, or be written now in words that stand without them. That is the orchestrator's call. The fact is reported under check 1 (d).
- Whether `worker:` and `reviewer:` left empty should also be refused. The probe shows they pass silently today. That is pre-existing behaviour of the same loop the step extends, and whether it is in this step's scope is the orchestrator's call.
- Whether Ordo's new `repair_reviewer` line should name its reason in the comment. `skills/ordo-init/SKILL.md`, Steps 7, second bullet, says "A key that is written names that reason in its comment", while item 9 follows Steps 8 only. Ordo's existing written optional keys (`standards`, `workers_at_once`) give no reason either. It is left to the orchestrator.
- The prose quality of item 1's dictated comment texts against the prose standard. I did not judge them line by line beyond the term use reported under check 1.

Agent usage: ordo-high, claude-opus-5-5, agent a392a12ca146ff975, 153352 tokens, 25 tool uses, 4.7 minutes.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- 1 (a) `plan.yaml:3` false for `repair_reviewer`: "What to build" 1 rewrites line 3 to "the default its comment gives"; the fact is added under "What is on the tree".
- 1 (b) `README.md:141`: widened into the paths as `README.md` lines 141-141, and "What to build" 10 rewrites the sentence.
- 1 (c) `check_config.py:6` and `:19`: "What to build" 3's last bullet names both lines and what each says after the change.
- 1 (d) comments citing the six kinds, `choices.md` and "open item" before steps 6 and 8: the comments of items 1 and 5 now name self-rule and its on/off switch only; item 1 says why.
- 3 the `worker`/`reviewer` check's lines: corrected to 141-144 with `MODEL` at 29, the kind check at 145-150.
- 4 (a) `default False` notes: `self_rule` and `next_entry` get the note `default off applies` (item 3), and the case expects it.
- 4 (b) the open project: the case names tool-a.
- 4 (c) the duplicate case: marked (preserved), with `self_rule` and `next_entry` written twice added, and the rule for preserved cases stated at the head of "Cases".
- 4 (d) the Ordo case: moved out of "Cases"; "Verify before you report" 2 keeps the run and 4 adds the `grep` of item 9's line.
- 5 (a) the example-passes case gains `lacks_line` for the three not-set notes.
- 5 (b) a case with `reviewer: claude:haiku` proves the note names the configured value.
- 5 (c) the projects case gains the `projects-five` pattern with a control on tool-b.
- 5 (d) the duplicate case: as 4 (c).
- 5 (e) item 9's line: "Verify before you report" 4.
- 5 (f) items 5 to 8: "Verify before you report" 5 has the report quote each changed line before and after, with the glossary sync; 6 checks no version line changed.
- 6 implied inputs: each is a case now, with its expected result: `repair_reviewer` as a list, a number, empty, set with `reviewer` missing, left out with `reviewer` missing or invalid; `self_rule` as `yes`, `true`, `On`, quoted `"on"`, empty; `next_entry` empty, on with `self_rule` left out, on with `self_rule` invalid, and in a project with its prefix; each new key written twice; `repair_reviewer` beside `projects:`. `repair_reviewer` joins `VALUE_CHECKED` so each gives one line.
- Declined 2, `worker:` and `reviewer:` empty accepted today: a wrong configuration accepted in the loop this step extends, fixed in item 3 with a case.
- Declined 3, the reason in Ordo's comment: item 9 writes the reason, as `skills/ordo-init/SKILL.md` Steps 7 asks.
- 7 ADRs 0004 and 0005: "What is on the tree" names both and says why the comments, which no longer state their behaviour, are not under them.
