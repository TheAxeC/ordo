# Step 12c brief check (on main at fcf0b07)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/12c.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

- "one deliverable and one dispatch", "drafted from the gate", "verifiable piece", "bookkeeping", "one dispatch": `git grep -n -I -e '<phrase>' -- . ':!.scratch'`. The hits are `skills/plan/SKILL.md:82` and `:186`, `skills/plan/templates/plan.md:3`, `skills/repo-setup/templates/plan-terms.md:112` and `docs/glossary.md:117`. All of them are inside the paths, so there is no hit outside the paths.
- "becomes a test of the step", "test of the step", "prototype script", "no test of the step checks": the hits are `skills/spec/templates/brief.md:21` and `skills/refute/SKILL.md:115`. No hit outside the paths.
- "whose content is known", "not a pointer", "file by file": the hits are `skills/spec/SKILL.md:125` and `:113`, and `skills/spec/templates/brief.md:14`. No hit outside the paths.
- "fix text" (item 2 reads it as "the requirements"): `git grep -n -I -i -e 'fix text' -- . ':!.scratch'` has two hits outside the paths.
  - `docs/dev/change-standard.md:30` reads "4. **The brief's fix text is the specification.** ...".
  - `skills/repo-setup/templates/docs/dev/change-standard.md:30` holds the same sentence.
  - Inside the paths, `skills/refute/SKILL.md:107` reads "an item the report marks DONE whose diff does not do what the brief's fix text says".
  - These sentences stay true only if `spec` keeps "fix text" as the name of what the brief states. If `spec` drops the phrase for "requirements", rule 4 of the rules file and refute's Spec item name something no skill defines any more. The brief does not say whether the phrase stays.
- "becomes a step" / "added to the plan only by" (item 5): `git grep -n -I -i -e 'becomes a step' -- . ':!.scratch'` has one hit outside the paths.
  - `skills/plan/templates/orchestrator-state.md:39`: "A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice ... books".
  - This is the same rule item 5 rewrites at `plan-orchestration` "Reports" (`skills/plan-orchestration/SKILL.md:310`) and in `refute` "Finding dispositions" (`skills/refute/SKILL.md:159`).
  - Under the ruling, such a finding can also become a new roadmap entry, or a repair round when it lies inside the part. The template line then states only one destination, and it restates the rule that item 5 says lives in "What earns a step of its own". The change makes it false by omission.
  - The file is the `plan` skill's template, and `plan` is already raised in this step.
- Places inside the paths that item 5 and the premise list do not name, though they state the rule item 5 rewrites:
  - `skills/plan-orchestration/SKILL.md:62`: "since a step is added to the plan only by a ruling of the user or ... a choice ... books".
  - `skills/plan-orchestration/SKILL.md:118`: "a ruling per finding that stays inside the brief and the written rules".
  - `skills/plan-orchestration/SKILL.md:373`: "Handing a miss inside a brief back as a gap in a report".
  - `skills/spec/SKILL.md:225` ("Steps / A stop"): "An option adds a step to the plan only when the work fits no step already in the list." It has no `/roadmap add` destination for work outside the entry's goal.
  - `skills/spec/SKILL.md:91`, `:332`, `:350`, `:353` and `skills/ordo-help/SKILL.md:82` all use "would change the step's scope". Item 5 says "A step's scope is its part" for `plan-orchestration` only.
- The Stops row "A finding that is the user's" (item 5 rewrites the row): `git grep -n -I "finding that is the user's" -- . ':!.scratch'` has hits outside the paths at `skills/diagnose/SKILL.md:153`, `docs/figures/gen_figures.py:705` and `docs/figures/plan-loop.svg:153`.
  - These stay true only if the row keeps its name. The brief rewrites the row and does not say whether its name is kept.
- "small and inside the brief" (landing fixes): there is a hit outside the paths at `skills/diagnose/SKILL.md:181`. The change does not make it false, since the brief states the part.
- `orchestrator, no agent`: the hits are `skills/plan/templates/plan.md:19` and `:21`. No hit outside the paths, and item 1 keeps the mark.
- The term **step** and the new **part, of an entry**: the glossary entries outside the changed one were read, and none is made false.
  - **goal** reads "the part of it the step delivers", which agrees with the new sense.
  - **ruling** reads "A ruling that adds or splits a step", which stays possible.
  - **acceptance item** reads "a requirement of the brief's "What to build"", which agrees with item 2.
- pin.sh's folder list: `git grep -n -I -e 'CLAUDE_CONFIG_DIR' -e 'pin\.sh' -- . ':!.scratch'`. The hits outside the paths are `docs/dev/building.md:14`, `docs/dev/change-standard.md:88` and the **pin** entry `docs/glossary.md:143` (which is inside the paths). None names the folder list, so none is made false.
  - `README.md:73`, `:75`, `:83`, `:94` and `:111` are inside the paths. They describe Claude Code's own folders, the skills-CLI install and the copy loop, none of which runs `pin.sh`, so the change to `pin.sh` makes none of them false. See check 2.

Findings:
- `skills/plan/templates/orchestrator-state.md:39`, outside the paths, restates the rule item 5 rewrites and becomes false by omission. It needs to be added to the paths and to item 5.
- `docs/dev/change-standard.md:30`, `skills/repo-setup/templates/docs/dev/change-standard.md:30` and `skills/refute/SKILL.md:107` use "fix text". The brief should say whether `spec` keeps that phrase. If it does not, the two rules files are pages the user owns (self-rule kind 3), so the change is a stop.
- The row "A finding that is the user's" is named in `skills/diagnose/SKILL.md:153`, `docs/figures/gen_figures.py:705` and `docs/figures/plan-loop.svg:153`, all outside the paths. The brief should either keep the row's name or add these files.
- Item 5 and the premise list leave out `skills/plan-orchestration/SKILL.md:62`, `:118` and `:373`, and `skills/spec/SKILL.md:225`. All are in the paths and state the rule the item rewrites.

## 2. The step line

- "`skills/plan/SKILL.md` and `templates/plan.md` draft the step list from the entry's goal as its parts": item 1.
- "`spec` SKILL, `templates/brief.md` and `templates/brief-check.md` let a brief state a part by its requirements, constraints and cases, dictating text only where the wording is the requirement, and "A brief carries every requirement the work is judged on" kept": item 2. The kept rule is the Do instead cell of the `spec` Anti-patterns row "A brief that tells the builder where to look", and item 2's third bullet keeps it.
- "`plan-orchestration`, `references/self-rule.md`, `refute` and `land` sort new work by its reason": item 5.
- "`ordo-help` and the terms in `plan-terms.md`, synced into `docs/glossary.md`, read with them": items 5 (its last bullet) and 6.
- "plan 2.H's step 3a, the six changes, ... the mutation of a code case only for a case kept as a test": item 4.
- "research-hub's three test sentences": item 3.
- "`utils/pin.sh` and `utils/pin.test.sh` linking ... into `~/.claude` and every `~/.claude-*` folder that holds a `skills` folder, each entry a link into the pinned worktree and the folders never linked to each other, with the README's install text": item 7.
  - "The README's install text" has an item but no requirement.
  - Item 7 says only "the install text where it names `$CLAUDE_CONFIG_DIR` as the way to reach a second account" says so.
  - That text (`README.md:73`, `:83`, `:94`, `:111`, under "Install") describes the skills CLI and the copy loop, which do not run `pin.sh`. The brief does not say what those sentences should read after the change. The builder would have to choose user-visible README text.
- "each changed skill's `metadata.version` set by the version rule ... the major part for `plan`, `spec`, `refute` and `plan-orchestration`": item 8 and Decision 2.
- The check part "each changed text read in place": the cases T1 to T13.
- The check part "`pin.test.sh` with a second config folder failing on the unchanged script": P1 and Verify 6.
- The check part "`sync_rules.py ... --only glossary` exits 0": Verify 2.
- The check part "step 9's two scratch plans drafted by the new rule": this is step 9's run, which comes after this step. The brief has no item for it, which is correct for a later step.

Findings: the part "with the README's install text" is served by item 7 in name only. The item states no requirement for the install sentences (`README.md:73`, `:83`, `:94`, `:111`), so the wording is left to the builder.

## 3. Premises

- `grep -n 'drafted from the gate' skills/plan/SKILL.md` printed `82:   - The step list is drafted from the gate, ...`. Matches.
- `grep -n 'one deliverable and one dispatch' skills/plan/SKILL.md` printed `186:- A step is one deliverable and one dispatch of its executor ...`. Matches.
- `sed -n 3p skills/plan/templates/plan.md` and `grep -n 'orchestrator, no agent' skills/plan/templates/plan.md`: the line 3 sentence is as quoted, and the placeholders are at `19` and `21`. Matches.
- The three `grep -n` runs in `skills/spec/SKILL.md` printed `113: - The fix text, in the brief's own words, not a pointer.`, `125: - Every item of "What to build" is a change whose content is known.` and line 117 holding "a case of a code step as a test and a case of a text or judgment step by reading". Matches.
- `grep -n` in `skills/spec/templates/brief.md` printed `14:<the deliverable, in the brief's own words, file by file, ...>` and line 21 holding the quoted sentence. Matches.
- `grep -n '^## ' skills/spec/templates/brief-check.md` printed eight numbered checks, the eighth `47:## 8. Dictated text`. Matches.
- `grep -n` in `skills/refute/SKILL.md` printed `115:  - a case of a code step in the brief's "Cases" that no test of the step checks;` and `159:  - It becomes a step only by a ruling ...`. Matches.
- `grep -n` in `skills/land/SKILL.md` printed `225:  - The step that finishes it ... enters the plan only by a ruling ...`. Matches.
- `grep -n` in `skills/plan-orchestration/SKILL.md` printed lines 104, 110, 130, 294, 310, 345, 372, 374 and 397, each as quoted. Lines 393 to 397 hold the Rules bullets named.
  - `sed -n '/^## What earns/,/^## Reports/p' ... | grep -c '^ *- '` printed `7` (six bullets and one sub-bullet). Matches "seven bullets".
- `grep -n 'adding a step, are no reversal' skills/plan-orchestration/references/self-rule.md` printed `16:`. Lines 149 to 156 hold the fix-step bullets of "The review of a choice". Matches.
- `sed -n 77p skills/ordo-help/SKILL.md` printed the "read the delta" row as quoted. Matches.
- `grep -n '^- \*\*step\*\*'` printed `plan-terms.md:112` and `docs/glossary.md:117`.
  - `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`, exit 0. Matches.
- `git -C ~/.local/share/ordo-stable describe --tags` printed `v2.7.0`.
  - `git -C ~/.local/share/ordo-stable diff` shows three one-line changes, in `skills/refute/SKILL.md`, `skills/spec/SKILL.md` and `skills/spec/templates/brief.md`, whose new lines are word for word the three sentences item 3 quotes. Matches.
- `grep -n 'A test exists only for a script' docs/dev/change-standard.md` printed `20:- A test exists only for a script, and only for behaviour whose failure costs something: ...`. Matches.
- `git show f8b51cf:.scratch/2-h-session-retro/orchestrator-state.md` holds at line 48 the bullet "Recurring findings (2026-09-30)" with six "Kind" sub-bullets (lines 49 to 54). Matches.
  - Main's `skills/spec/templates/brief.md` (`cat -n`) holds none of kinds 2 to 6.
  - Main's `brief-check.md` holds "8. Dictated text", which is kind 1.
- `cat -n utils/pin.sh`: the head comment at lines 11 to 18 states the folder list, which matches.
  - The default-folder code runs from line 70 (comment) to 83 (`fi`), not "lines 69 to 81". Line 69 is the closing quote of `nl`.
  - The agent-folder code is at lines 111 to 113 (`# The agent folders, one per line ...` and the `awk`), not "lines 108 to 111". Lines 108 to 110 are `EOF`, the comment on the summary folders and `shown_dirs`.
- `sed -n 175,185p README.md`: line 180 is the `pin.sh` folder sentence. Matches.
- `ls -d ~/.claude-*` printed `/Users/axelfaes/.claude-science` and `/Users/axelfaes/.claude-work`.
  - `ls -la ~/.claude-work/skills` lists links into the pinned worktree for land, ordo-init, plan, plan-help, plan-orchestration, plan-retro, refute, repo-setup, roadmap and spec, plus the real folder `synced`.
  - `ls -la ~/.claude-work/agents` printed "No such file or directory".
  - `ls ~/.claude-science` shows no `skills` entry.
  - `git -C ~/.local/share/ordo-stable ls-tree --name-only HEAD skills/` lists diagnose, grill, ordo-help and session-retro, which `~/.claude-work/skills` lacks. Matches.
- The versions loop `git show 9fc91dc:skills/$s/SKILL.md | grep -m1 version:` against main printed:
  - plan 1.10.1 to 1.11.0
  - spec 1.7.0 to 1.8.0
  - refute 1.7.1 to 1.8.0
  - plan-orchestration 2.10.1 to 2.11.0
  - land 1.8.2 to 1.9.0
  - ordo-help 1.8.3 to 1.9.0
  - repo-setup 1.2.1 to 1.3.0

  This matches.
- `ls docs/adr` lists 0001 to 0009, `README.md` and `template.md`. Matches the ADR premise (see check 7).
- The verify list in the state file (`sed -n '/^verify:/,...'`) holds 11 commands, which matches Verify 1's `checks: 11 commands passed`.

Findings: the `utils/pin.sh` line ranges are off.
- The brief says "lines 69 to 81"; the folder-list code is at lines 70 to 83.
- The brief says "lines 108 to 111"; the agent-folder code is at lines 111 to 113.
- Every other premise matches.

## 4. Cases and checks

- T1, T3, T5, T7, T8, T9, T11 and T13: consistent with the rules file and the standards.
- T2 (2.F: one build step, one step for the real run and the blind comparison, and the closing): inconsistent with the brief's own rule, item 1's second bullet. That rule reads "A check that is the user's reading of a real run, or the user's decision, ends the step whose result it needs, and is a step of its own only when the parts after it wait on it."
  - In 2.F, nothing after the real run waits on it except the closing.
  - Decision 1's fifth example (2.E.A's cost figures) uses the same fact, that only the closing waits, to put the run inside the script's step.
  - T2 and Decision 1's fifth example therefore get opposite answers from the same text. The brief does not state the fact that separates them, for instance that the 2.F run needs the landed skill run by the user in a fresh session, which no builder can do inside a step.
  - Plan 2.F's own list, rewritten under the ruling (`.scratch/2-f-diagnose/plan.md:24`), keeps the run as step 3, so T2's result is the one the user applied.
- T4: consistent with item 5 and the ruling. "Changes ... a requirement" leaves the stop criterion, which the ruling's last bullet allows.
- T6: consistent. ADR 0004 governs the "(self-rule)" ending.
- T10 ("that step's brief takes it; the step list does not change"), together with item 5's bullet "A ruling on a part not yet built changes that step's brief, not the step list": inconsistent with three texts the brief keeps.
  - `references/self-rule.md` "The review of a choice": "A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling. Its tag is rewritten to `(ruling <the new bullet's name>)`". Item 5 says this "stays possible everywhere it is possible now".
  - `references/self-rule.md` "Closing an open item" 6 commits "the step text the ruling rewrote".
  - `spec` "What it reads" 4 and the glossary's **authority** take a ruling the step rests on from a `(ruling <name>)` tag on the step's line.
  - The ruling itself says only "a ruling on a part not yet built changes that step's brief". The words "not the step list" are the brief's addition.
  - The plan's own practice tags not-yet-built step lines with the ruling: `.scratch/2-g-git-guard/plan.md:22` and 2.E.A step 9, both "(ruling Steps by part)".
  - This breaks the rules file, rule 19 ("A change leaves no two statements that contradict each other") and rule 17 (a rewrite keeps the meaning of every rule it carries).
- T12: consistent with the rules file's test rule ("Scripts compute facts; judgment is read") and with rule 1 read under that section.
- P1, P5 and P8: consistent. Each tests a behaviour the change adds and fails on the unchanged script.
- P2, P3, P4, P6, P7 and P9, together with Verify 6 ("Each new or changed case of `pin.test.sh` fails on the unchanged `pin.sh`"): inconsistent with the rules file, rule 13.
  - P2 (`.claude-science` untouched), P4 (`.claude-x` a file), P6 (one folder named once), P7 (`ORDO_SKILL_DIRS` only) and P3 (`CLAUDE_CONFIG_DIR`'s folder linked once and named once) all pass on the unchanged script, which never reads `~/.claude-*` and already adds `$CLAUDE_CONFIG_DIR/skills` once.
  - Rule 13 says a new test of a behaviour the change preserves passes on the unchanged tree.
  - Rule 13 also says a case asserting that a rule stays silent carries a control. The control is the near-miss the same rule must report, such as P1's `.claude-work/skills` linked beside P2's and P4's ignored folders, and P1 beside P7.
  - As written, Verify 6 cannot hold for these cases, and the brief does not pair each silent case with its control.

Findings:
- T2 against item 1's second bullet and Decision 1's fifth example: the brief needs the fact that makes 2.F's run a step and 2.E.A's cost figures not.
- T10 and item 5's "not the step list" contradict `references/self-rule.md` "The review of a choice" and "Closing an open item" 6, and the `(ruling <name>)` authority, which the brief keeps (rules file, rules 17 and 19).
- Verify 6 asks every new `pin.test.sh` case to fail on the unchanged script. P2, P3, P4, P6 and P7 pass there by design, which goes against rule 13's second and third bullets. The silent cases have no named control.

## 5. The question

The goal the step delivers: "A plan's step list is drafted from the entry's goal as its parts, a step being a part that must exist and work before another part is built on it or a point where the user reads or decides, and new work becomes a repair round, a new step or a new roadmap entry by its reason; `utils/pin.sh` pins every Claude config folder". Items 3 and 4 add the user's ruled changes.

- The step line's check:
  - "step 9's two scratch plans drafted by the new rule": yes. If step 9's two scratch entries each have a gate of one piece and no user reading, the old text ("one step per verifiable piece of [the gate]") gives the same one-step-plus-closing list. Axel would then read the same lists under either text.
  - "each changed text read in place": yes for the sorting of new work. The reading cases T4 to T10 are read against the places item 5 rewrites, and the places check 1 names outside item 5 keep the old rule.
  - The `pin.test.sh` part: no. P1 fails on the unchanged script.
  - The `sync_rules` part: yes, alone. It prints `ok` on the unchanged tree too.
- T1, T2, T3: no for T1 and T3, since the unchanged text gives a step per gate piece, a different list. T2: yes. The builder can only meet T2 by reading T2's answer into a rule that, as written (check 4), gives the opposite.
- T4 to T9: no. Each needs text that reaches a destination different from the unchanged text's stop.
- T10: yes. It can be met only by contradicting texts the brief keeps (check 4), so a "met" verdict does not show the ruling written consistently.
- T11: no. The unchanged template asks for "the deliverable ... file by file".
- T12: no. The unchanged `refute` Spec heading raises "no test" for every code case.
- T13: no. It is read over every changed sentence.
- P1, P5, P8: no. Each fails on the unchanged script.
- P2, P3, P4, P6, P7, P9: yes, alone. Each passes on the unchanged script by design. They are guards of preserved behaviour and prove nothing of the goal without P1 beside them.
- Item 1 (T1 to T3, step 9): no, through T1, T3 and step 9's run, given scratch entries whose gates have several pieces.
- Item 2 (T11): no.
- Item 3 (T12, Verify 5): Verify 5's grep alone, yes. It passes once the old phrases are gone, whatever replaces them. T12 is no.
- Item 4: no. It is read against the six kinds' words.
- Item 5 (T4 to T10): yes, as for the step line's reading part, for the places item 5 does not name.
- Item 6 (Verify 2): yes, alone. The terms reading in "Report" is what proves it.
- Item 7 (P1, P5, P8): no.
- Item 8 (Verify 3): yes. Verify 3 checks the versions Decision 2 lists, not `docs/dev/skill-layout.md`'s rule.
  - Decision 2 keeps `repo-setup` at 1.3.0 as "a term's text in the block `repo-setup` copies". The page's major clause in "Frontmatter" reads "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed." This step changes the entry **step** in the block `/repo-setup` writes and syncs, a changed output, not an added one.
  - `ordo-help` prints its sequence, and line 77's meaning changes.
  - The reason Decision 2 gives is step 12's precedent, not the rule's text.

Findings:
- Step 9's check could pass without the drafting rule changing anything unless its scratch entries have a gate of several pieces or a user reading. The brief or the plan's step 9 should name entries whose lists differ under the two texts.
- T2 and T10 could be met only against the brief's own rule or against kept texts (check 4).
- Verify 3 checks Decision 2, not the version rule.
  - For `repo-setup` (a changed **step** entry in the block it writes) and `ordo-help` (a changed meaning in its printed sequence), the rule's major clause reads "its output is changed". Decision 2 does not show why these two are wording only.

## 6. Implied inputs

- A `~/.claude-*` folder with no `skills` folder: P2.
- A `~/.claude-*` entry that is a regular file: P4.
- A path with a space: P5. The HOME holding a space is covered by the existing suite's scratch HOME.
- A `~/.claude-*/skills` link to `~/.claude/skills`: P6.
- `CLAUDE_CONFIG_DIR` equal to a `~/.claude-*` folder: P3.
- No `~/.claude-*` folder, so the glob is left unmatched: P9.
- `ORDO_SKILL_DIRS` set: P7.
- `CLAUDE_CONFIG_DIR` set to `~/.claude` or `~/.claude/` while `~/.claude/skills` does not exist yet (a first pin): missing.
  - The unchanged script skips it by path (`pin.sh:80`).
  - Item 7 drops that condition and merges two entries only "by resolved path, both existing". The folder would then be listed, linked and named twice.
  - Expected: one folder, named once.
- `~/.claude-x/skills` a regular file or a broken link: missing. Expected: not a folder, so ignored as P4 is.
  - Read as a folder, `mkdir -p` or `ln` fails. `ln -sfn ... || continue` (`pin.sh:404`) skips it, and the check after linking fails the run after `~/.claude` has been relinked.
- A `~/.claude-*/skills` folder that holds, for a skill of the tag, a real folder or a link outside Ordo: missing.
  - This is what the README's "By copying the folders" or "With the skills CLI" install leaves in a second account's folder, a real copy or a link into `~/.agents/skills/<skill>`.
  - The refusals at `pin.sh:369` and `:373` would then refuse the whole pin, `~/.claude` included, for a folder the user never named.
  - Expected result to state: refused naming that folder, as now for a named folder, or that folder skipped and named. Either way the brief should say which.
- The real machine's state: no case covers it.
  - After this step lands, `utils/pin.sh` in check mode on this machine reads `~/.claude-work/skills`.
  - By `check_links` (`pin.sh:188` to `:199` and `:209` to `:214`), that folder lacks diagnose, grill, ordo-help and session-retro, holds the stale `plan-help` and has no agents folder. Check mode then exits 1, where it passes today.
  - Plan step 9's check names "`utils/pin.sh` in check mode showing the global pin unchanged", which this changes.
  - Expected: the report names this host-visible change with its before and after, and the step-9 check is read with it.

Findings:
- `CLAUDE_CONFIG_DIR` set to `~/.claude` with no `~/.claude/skills` yet. Expected: one folder, named once.
- A `~/.claude-*/skills` that is a file or a broken link. Expected: ignored.
- A `~/.claude-*/skills` holding a real folder, or a link outside Ordo, for a skill of the tag. Expected: the brief must state whether the whole pin is refused or that folder is skipped.
- Check mode on this machine turns from passing to failing on `~/.claude-work` after the change. The brief should name this as a host-visible change and as an input to step 9's check.

## 7. ADRs

- 0001, 0002 and 0003 (`/writing`): do not touch the step.
- 0004: touches the step. The step is under "A decision taken under self-rule is booked as a bullet whose first line ends "(self-rule)". `/spec`, `/plan` and `/grill` accept it wherever they accept "(the user)"." The brief names it under "What is on the tree", and T6 follows it.
- 0005: "Every choice taken under self-rule ... is written to `<ledger_root>/choices.md` ... An entry leaves it when the user has reviewed it."
  - Item 5 adds no new kind of choice. `/roadmap add` under "(self-rule)" for a finding is already in `references/self-rule.md` "A skill with its own approval stop".
  - Item 5 keeps "The review of a choice", so 0005 does not touch the step as written.
  - The brief names it as not touching, with its subject.
- 0006: agent ids. Not touched, since the step does not change what an agent's record holds.
- 0007: the reviewer model of the run over a repair round. Not touched, since the step changes refute's Spec heading only.
- 0008 and 0009: the cost script. Not touched.
- No part of the brief contradicts the part in force of any record.

Findings: none.

## 8. Dictated text

- "A case of a code step (a script, or a product's code) becomes a test of the step only when the rules file's test rule calls for a test of it, run on the unchanged tree first, and no prototype script stands in for such a test; every other case of a code step is checked by a run the report quotes, and no test is kept for it."
  - Found by `grep -n 'becomes a test of the step only when the rules file' .scratch/2-e-a-self-rule/agents/briefs/12c.md`, which prints `75:`.
  - It breaks the prose standard, "E. Sentence shapes", "Sentence length". It is one sentence of 69 words (`wc -w`), joining two rules with a semicolon.
  - "run on the unchanged tree first" can attach to the test or to the rule.
  - Item 3 asks for it "worded ... as main's text now stands". Unlike item 4, it does not allow the form to be fixed.
- "a case of a code step as a test only where the rules file's test rule calls for one and otherwise as a run the report quotes, a case of a text or judgment step by reading"
  - Found by `grep -n 'a case of a code step as a test only where' ...12c.md`, which prints `76:`.
  - Placed in `spec` Steps 4's sub-bullet as item 3 says, it makes that bullet one sentence of 76 words holding four requirements. That breaks `docs/dev/skill-layout.md` "Lists and tables" ("One rule per bullet or item: two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets") and the brief's own Verify 8.
- "a case of a code step in the brief's "Cases" that the rules file's test rule calls a test for and no test of the step checks;"
  - Found by `grep -n "that the rules file.s test rule calls a test for" ...12c.md`, which prints `77:`.
  - Holds (27 words, one finding item).
- "every requirement the part is judged on is known and written into the brief."
  - Found by `grep -n 'every requirement the part is judged on is known' ...12c.md`, which prints `69:`.
  - Holds. "part" is used in the new sense item 6 defines.
- Item 4's six kinds, dictated by reference to their words at f8b51cf. Found by `grep -n "in the open item.s words at f8b51cf" ...12c.md`, which prints `79:`. Read from `git show f8b51cf:.scratch/2-h-session-retro/orchestrator-state.md` lines 50 to 54:
  - Kind 2 ("... the ASCII command's line and its exit status included; a line shortened with "..." is not verbatim."): holds against the prose standard and skill-layout. It names a check the generic template's repositories hold only when their verify list has one.
  - Kind 3: holds. `docs/glossary.md` is named by other skills too (`git grep -c 'docs/glossary.md' -- skills`: grill 4, diagnose 1, repo-setup 7).
  - Kind 4 ("Each new or changed bullet holds one rule and each Steps item one action; each new sentence past 25 words is named in the report with why the mechanism needs its length."): breaks the rule the rules file states under "Rules this repository already states", "The skills carry no project name and no path; everything specific to a repository comes from its `.agents/plan.yaml`".
    - "One rule per bullet" and "Steps item" are rules of Ordo's own `docs/dev/skill-layout.md`, which `/repo-setup` does not install (`ls skills/repo-setup/templates/docs/dev` lists change-standard, coding-standards, design-principles, prose-standard and ui-standard).
    - In `spec`'s generic `templates/brief.md` they would bind every repository's briefs.
    - The threshold of 25 words is not the prose standard's (which says "under roughly 20 words unless the mechanism needs more").
    - This is a matter of meaning, not form, so item 4's leave to "fix the form" does not cover it.
  - Kind 5: holds.
  - Kind 6 ("each with the exit status and the one error line expected"): holds against the pages. It assumes a script prints one error line, which no standards page states (`grep -rn -i 'error line' skills/repo-setup/templates/docs/dev/ docs/dev/` found none).
- "**part, of an entry**": found by `grep -n 'part, of an entry' ...12c.md`, which prints `93:` and `163:`. It holds as a term name. Placed between **part file** and **part, of an output**, it keeps the file's alphabetical order.

Findings:
- The research-hub `templates/brief.md` sentence (`12c.md:75`) breaks the prose standard "E. Sentence shapes", "Sentence length": 69 words and two rules joined by a semicolon. Item 3 gives no leave to fix its form.
- The research-hub `spec` Steps 4 fragment (`12c.md:76`), placed as dictated, makes the sub-bullet break `docs/dev/skill-layout.md` "Lists and tables" (one rule per bullet).
- Kind 4's words, brought to `spec`'s generic `templates/brief.md`, carry Ordo's own skill-layout rules and a 25-word threshold into every repository's briefs. That breaks the rules file's "Rules this repository already states", "The skills carry no project name and no path ...". The brief should state a generic wording, for example the standards pages' rules on list items and sentence length.

## Declined to judge

- Whether item 1's reading of "built on it" (Decision 1) is the reading the user meant by "Steps by part" is the user's call. Checks 4 and 5 judged only the brief's consistency with itself and with the kept texts.
- Whether `repo-setup` and `ordo-help` take a major or a minor raise is a judgment under the version rule that a read cannot settle against step 12's precedent. Check 5 names the rule's sentence and the change, and the session or the user decides.
- Whether kind 2's "the ASCII command" and kind 6's "one error line" are project specifics the generic template should not carry. The pages do not settle it, and the user's ruling on "Recurring findings" approved those words for `spec`.
- I did not run `utils/pin.sh` in check mode on the real home folder. The change in its result after the step lands (check 6) is read from `pin.sh:188` to `:214` and the `ls` of `~/.claude-work`, not from a run.

Agent usage: aeae5b2d7ddaabf54, claude-opus-5-5, 246593 tokens, 57 tool uses, 10 min 29 s.


## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- Names 1, `skills/plan/templates/orchestrator-state.md:39`: added to "Paths this step writes" and to item 5's file list and its list of places that state the rule; named under "What is on the tree".
- Names 2, "fix text": item 2 keeps the phrase, the fix text being the part's requirements in the brief's own words, so `docs/dev/change-standard.md` rule 4, its template copy and `refute`'s Spec item stay true; named under "What is on the tree".
- Names 3, the row "A finding that is the user's": item 5 keeps the row's name, which `diagnose` and `docs/figures/` cite; named under "What is on the tree".
- Names 4, `plan-orchestration` lines 62, 118 and 373, `spec` "Steps / A stop" line 225 and `spec`'s "would change the step's scope" (lines 91, 332, 350, 353), `ordo-help` line 82: item 5 names each, with `spec` "Steps / A stop" gaining the roadmap-entry destination; named under "What is on the tree".
- The step line, the README's install text: item 7 now states that `README.md`'s pin section says which folders `pin.sh` reads and that its Install section, which describes installs that do not run `pin.sh`, stays as it is.
- Premises, `utils/pin.sh` line ranges: corrected to lines 70 to 83 and 111 to 113.
- Cases 1, T2 against Decision 1's fifth example: the reading of "built on it" and item 1 now name the fact that separates them, a run or a decision only the user, or a session other than the builder, can make on the landed result; Decision 1's fifth example says why 2.F's run differs.
- Cases 2, T10 and item 5's "not the step list": item 5 and T10 now say a ruling on a part not yet built rewrites that step's line and brief with its `(ruling <name>)` tag, as `references/self-rule.md` keeps doing, and adds no step.
- Cases 3, Verify 6 and the silent pin cases: Verify 6 now splits the cases of added behaviour, which fail on the unchanged script, from those of preserved behaviour, which pass before and after with a control; the cases name P1's `.claude-work/skills` as the control beside P2, P3, P4, P6, P7 and P9.
- The question 1, step 9's check could pass without the drafting rule changing: the plan's step 9 line now asks for scratch entries whose gates have several pieces, so the old and the new rule give different lists (premise corrected in `plan.md`).
- The question 2, T2 and T10: closed by Cases 1 and Cases 2 above.
- The question 3, Verify 3 and the versions of `repo-setup` and `ordo-help`: Decision 2 now applies the major clause to both (2.0.0 each, their output changes under the same inputs), keeps `land` at 1.9.0 with its reason, and asks the report to give each version with its clause; the step line in `plan.md` names them.
- Implied inputs 1, `CLAUDE_CONFIG_DIR` set to `~/.claude` before its `skills` exists: item 7 compares folders by path with trailing slashes removed as well as by resolved path; case P10.
- Implied inputs 2, a `~/.claude-*/skills` that is a file or a broken link: item 7 ignores it; case P11.
- Implied inputs 3, a `~/.claude-*/skills` holding a real folder or a link outside Ordo for a skill of the tag: Decision 5 refuses it as a named folder is refused now, naming the folder; case P12.
- Implied inputs 4, check mode on this machine after the step: item 7 asks the report to name the host-visible change; the plan's step 9 line now checks `~/.claude` alone with `ORDO_SKILL_DIRS=$HOME/.claude/skills` (premise corrected in `plan.md`).
- Dictated text 1 and 2, research-hub's two `spec` sentences: item 3 now keeps their meaning and fixes their form to the prose standard and `docs/dev/skill-layout.md` "Lists and tables", each split named in the report.
- Dictated text 3, kind 4's Ordo-specific words in a generic template: item 4 now gives kind 4 in a generic form, read against the standards pages' rules on list items and sentence length, and writes kind 2's "ASCII command" as the character-set check's line when the verify list holds one.
