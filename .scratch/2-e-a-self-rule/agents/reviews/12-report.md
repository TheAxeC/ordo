Everything in the brief is done. Items 0, 1, 2, 3 and 4 are complete, every command of "Verify before you report" passes, and the coordinator's ruling on the hand-back (Open item N (a)) is carried below. One observation about the text of `roadmap` is handed back unfixed under "Anything in the brief wrong or impossible", because its fix would change what `/roadmap add` accepts.

## Open items of the state file

The section `## Open items` of `.scratch/2-e-a-self-rule/orchestrator-state.md` holds no open item; it holds only its explanatory paragraph. Read with:

```
$ sed -n 61,66p /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md | cut -c1-200
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report un

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by a ruling of the user or, under `self_rule: on`, a choice `plan-


## Closed items (the log of what was raised and how it ended; no report carries it)
```

## The coordinator's ruling carried by this report

Open item N (a), closed under self-rule as C4, ruled on the hand-back of round 0 (`agents/briefs/12-cases.md`):

- Finding A holds. A ledger with no `## Agents` heading went to the cost script, which exits 1 with `error: the ledger names no agent`, so a ledger written before the plan stopped at its closing. Item 4 is added: the five sub-bullets of the closing step in `skills/plan/SKILL.md` Steps 2 are rewritten to the dictated text, and the bullets after them stay.
- Cases 13 to 17 are added. Cases 1 and 3 keep `plan-orchestration` 2.11.0 and `plan` 1.11.0, with item 4 as the reason for case 3.
- Finding B does not hold. `spec`'s `templates/brief.md` line 5 at 9fc91dc already forbids a dictated line that breaks a standards page, so the stop on such a line refuses a value the text already called an error, which by the fifth bullet of the version rule is no run that worked before. `spec` stays 1.8.0.

## The cases, first run

The first run is on the tree as the step started (commit 3659816). Versions are read with `git show HEAD:skills/<name>/SKILL.md | grep -m1 'version:'`, and the raise a diff gives is read from `git diff 9fc91dc HEAD -- skills/<name>` under the rule of item 0.

| Case | Skill | Version read at the start | What the diff since 9fc91dc shows | Value under the rule | First-run result |
|---|---|---|---|---|---|
| 1 | plan-orchestration | 2.10.1 | `references/self-rule.md` named 0 times at 9fc91dc and 17 times in `SKILL.md` at the start; next-entry mode, the cost script's use and the Dictated text hold are new behaviour | 2.11.0 (minor) | handed back in round 0: the closing step ran the cost script on a ledger with no `## Agents` heading, which refuses a ledger written before the plan. With item 4 the ledger closes as before, and the value stands |
| 2 | grill | 1.2.0 | `grep -c -e '--self-rule'` prints 0 at 9fc91dc and 25 at the start | 1.3.0 (minor) | as the case says |
| 3 | plan | 1.10.1 | `--self-rule` 0 at 9fc91dc, 9 at the start; keys `self_rule`, `next_entry`, `repair_reviewer`, the Agents section and the closing report are new | 1.11.0 (minor) | handed back in round 0 for the same closing defect; with item 4 a ledger the skills wrote at 9fc91dc names no agent and closes as before with the closing report added (output added), and a missing transcript or a model missing from the price table stops only a ledger that names an agent, an input the skill did not accept before. The value stands |
| 4 | roadmap | 1.2.0 | `grep -c -e '(self-rule)'` prints 0 at 9fc91dc and 3 at the start: `add` accepts a quoted ruling ending "(self-rule)" it refused before | 1.3.0 (minor) | as the case says |
| 5 | refute | 1.7.1 | `repair_reviewer` 0 at 9fc91dc, 1 at the start | 1.8.0 (minor) | as the case says |
| 6 | spec | 1.7.0 | `Dictated text` 0 at 9fc91dc, 2 at the start; `(self-rule)` 0 and 5 | 1.8.0 (minor) | handed back in round 0 on the stop for a dictated line a ruling fixes; ruled: finding B does not hold, the value stands |
| 7 | land | 1.8.2 | `Agents section` 0 and 1; `skills/land/templates/checks.sh` names `commands failed` 0 and 2 times: output added, every line printed before still printed | 1.9.0 (minor) | as the case says |
| 8 | ordo-help | 1.8.3 | `Choices awaiting review` 0 and 2; `Agree` 0 and 1: new output | 1.9.0 (minor) | as the case says |
| 9 | ordo-init | 1.1.1 | `skills/ordo-init/templates/check_config.py` names `self_rule` 0 and 7 times; its refusal of a `worker:` or `reviewer:` with no value refuses a value its text already called an error | 1.2.0 (minor) | as the case says |
| 10 | repo-setup | 1.2.1 | `git diff 9fc91dc HEAD --stat -- skills/repo-setup/templates` shows `plan-terms.md` and `shared-rules.md` changed, which a sync writes into a user's repository | 1.3.0 (minor) | as the case says |
| 11 | diagnose | 1.0.0 | `self_rule` 0 and 1: the Stops row now also resumes on a choice booked under `self_rule: on` | 1.1.0 (minor) | as the case says |
| 12 | plan-retro, session-retro | 1.2.1, 1.0.0 | no change since 9fc91dc | unchanged | as the case says |

Cases 13 to 17 of item 4, first run. The closing step's text at the start is `git show HEAD:skills/plan/SKILL.md | sed -n 86,88p`: the skip applies only when `plan.md` has its `## Agents` heading with no bullet under it and the ledger has no `agents/agent-roles.md`, and "in every other case" the script runs, a `plan.md` with no `## Agents` heading and an existing `agents/agent-roles.md` both going to it. Each scratch ledger is under `SCR/c/<n>`, and the script is `python3 skills/plan-orchestration/templates/plan_cost.py <ledger> <empty transcript root>`.

| Case | Ledger | Start text | Script | Result |
|---|---|---|---|---|
| 13 | `plan.md` holds only `# Plan: old` and `## Rulings`, no `agents/agent-roles.md` | no `## Agents` heading, so "every other case": the script runs | `error: the ledger names no agent`, exit 1 | the closing stops on a ledger that names no agent: the defect |
| 14 | `plan.md` with its `## Agents` heading and only its sentence, no roles file | heading, no bullet, no roles file: skip | same error | skip agrees with the script |
| 15 | no `## Agents` heading, empty `agents/agent-roles.md` | roles file exists: the script runs | same error | the closing stops: the defect |
| 16 | `## Agents` section with one agent bullet | script runs | `error: no transcript of agent abc123 under ...` (a different error), exit 1 | the script runs and does not print the no-agent error |
| 17 | no heading, `agents/agent-roles.md` with one agent bullet | script runs | the same different error, exit 1 | the script runs and does not print the no-agent error |

Cases 13 to 17 on the changed text (`skills/plan/SKILL.md` lines 92 to 101). "Bullet line" as the closing step reads it is a line that starts with `-`, `*` or `+` after any spaces and then a space or the line's end, which is `_BULLET` in `plan_cost.py`; each case is read against the five dictated bullets and run through the script.

| Case | Closing step reads | Script (run now) | Agree |
|---|---|---|---|
| 13 | no `## Agents` heading and no roles file hold no bullet line: skip | `error: the ledger names no agent` | yes |
| 14 | heading with only a sentence under it, no roles file: skip | same error | yes |
| 15 | no heading, empty roles file: skip | same error | yes |
| 16 | one bullet line under `## Agents`: the script runs | `error: no transcript of agent abc123 ...`, not the no-agent error | yes |
| 17 | one bullet line in `agents/agent-roles.md`: the script runs | the same transcript error, not the no-agent error | yes |
| 13b (added) | a `plan.md` whose bullet lines all stand under `## Rulings`, none under `## Agents`: skip, since only a bullet under `## Agents` counts | `error: the ledger names no agent` | yes |

```
$ for n in 13 14 15 16 17 13b; do echo "case $n"; python3 skills/plan-orchestration/templates/plan_cost.py /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2ea-12-builder/c/$n /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2ea-12-builder/tr/empty 2>&1 | cut -c1-60; done
case 13
error: the ledger names no agent
case 14
error: the ledger names no agent
case 15
error: the ledger names no agent
case 16
error: no transcript of agent abc123 under /private/tmp/clau
case 17
error: no transcript of agent abc123 under /private/tmp/clau
case 13b
error: the ledger names no agent
```

The texts that state the closing and are not changed, each read after item 4 and still true:

- `skills/plan/templates/plan.md` line 21: "the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive". It names the two outcomes of the closing report and no skip test.
- `skills/plan-orchestration/SKILL.md` line 308 (line 289 before this step's edits): "The closing report holds the cost script's output, or the sentence that the plan started no agent, as the `plan` skill's Steps 2 says."
- Glossary entry "closing report" (`plan-terms.md` and `docs/glossary.md`): "holding the cost script's output, or, when the closing step did not run the script because the plan started no agent, the sentence that says so".
- Glossary entry "closing step": "the closing step skips the script only for a plan that started no agent".

```
$ sed -n 21p skills/plan/templates/plan.md; sed -n 308p skills/plan-orchestration/SKILL.md; grep -n '^- \*\*closing' docs/glossary.md | cut -c1-260
- <last> the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)
- The closing report holds the cost script's output, or the sentence that the plan started no agent, as the `plan` skill's Steps 2 says.
27:- **closing report**: the file `agents/reviews/closing.md` the closing step writes, holding the cost script's output, or, when the closing step did not run the script because the plan started no agent, the sentence that says so. Stated in: `plan`, Steps 2; 
28:- **closing step**: the last step of every plan, which `/plan` writes itself: the closing report written before the folder moves, the roadmap entry ticked with the gate's output through `/roadmap done`, and the ledger folder moved to `<archive_root>/`. A no
```

No text needed a fix for item 4, so none was added to the files list.

## Per skill: the layout page and the prose standard

Method. Every skill was read in full against each section of `docs/dev/skill-layout.md` and against the prose standard. "Writing for an agent" was applied to the text the plan wrote or rewrote (`git diff 9fc91dc HEAD -- skills/<name>`, plus the item 4 text of `plan`), and every other section and the prose standard to the whole skill. Facts were computed by command (outputs below); judgments were read. Each fix is listed with its place, before and after, in the appendix (`git diff -U0 HEAD -- <path>`, the hunk counts below include the version line).

Checks that back the verdicts "holds" for Frontmatter, Sections in order, tables and prose:

```
$ python3 - <<'EOF'
import re,yaml
for s in 'diagnose grill land ordo-help ordo-init plan plan-orchestration refute repo-setup roadmap spec'.split():
    t=open(f'skills/{s}/SKILL.md').read()
    fm=yaml.safe_load(t.split('---')[1]); d=fm['description']
    heads=re.findall(r'^## (.+)$',t,re.M)
    print(s, 'name=folder', fm['name']==s, '| Triggers on: last', 'Triggers on:' in d and d.rstrip().endswith('.'), '| first four', heads[:4]==['Quick start','Use instead','What it reads','Steps'], '| last three', heads[-3:]==['Stops','Anti-patterns','Rules'], '| description chars', len(d))
EOF
diagnose name=folder True | Triggers on: last True | first four True | last three True | description chars 905
grill name=folder True | Triggers on: last True | first four True | last three True | description chars 877
land name=folder True | Triggers on: last True | first four True | last three True | description chars 726
ordo-help name=folder True | Triggers on: last True | first four True | last three True | description chars 503
ordo-init name=folder True | Triggers on: last True | first four True | last three True | description chars 632
plan name=folder True | Triggers on: last True | first four True | last three True | description chars 477
plan-orchestration name=folder True | Triggers on: last True | first four True | last three True | description chars 961
refute name=folder True | Triggers on: last True | first four True | last three True | description chars 951
repo-setup name=folder True | Triggers on: last True | first four True | last three True | description chars 861
roadmap name=folder True | Triggers on: last True | first four True | last three True | description chars 1022
spec name=folder True | Triggers on: last True | first four True | last three True | description chars 987
```

```
$ bash -c 'python3 /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/2ea-12-builder/dash.py skills/*/SKILL.md skills/plan-orchestration/references/self-rule.md docs/dev/skill-layout.md | grep -v -E " [0-9]+ (---|[|]---)"; echo exit-of-the-scan-pipeline-done'
exit-of-the-scan-pipeline-done
```

The scan strips list markers and backticked code, then reports a spaced hyphen, a double hyphen, an em or en dash and any non-ASCII character. Without the `grep -v` it prints only the `---` of each front-matter fence and the `|---|` of each table separator, which the `grep -v` removes, so the scan reports nothing. The scan covers all thirteen skills' `SKILL.md`, which includes `plan-retro` and `session-retro`.

Bold marks only a list item's label in all eleven skills and `self-rule.md` (a scan for `**` outside `- **Label.**` prints one line, `skills/grill/SKILL.md` line 285, which shows the glossary's entry form inside backticks). The vocabulary scan finds the word `simple` only as the orchestrator's criterion for merging two briefs' shared file, and `just` only as "just closed" (temporal); see the judgment calls.

Intro paragraph, sentence count (row 1 asks for one to three), after the fixes: diagnose 2, grill 2, land 3, ordo-help 1, ordo-init 2, plan 2, plan-orchestration 3, refute 3, repo-setup 2, roadmap 2, spec 3.

### diagnose

Files: `skills/diagnose/SKILL.md`; 17 hunks in SKILL.md.

- Frontmatter: holds (905 characters).
- Sections in order: holds; the reference section "Ways to build a red command" sits in the row 6 place.
- Where a rule goes: fixed. The Stops row "No dispatch entry" held, in its What-resumes cell, four conditions of what to run next; they are four bullets under Rules and the cell points at "Rules".
- Lists and tables: fixed. Bullets that held two requirements are split (Steps 3 four places, Steps 8, 11, 12, 14, 15, 20, 21, two Rules bullets), and the Stops cell above. The Quick start comment of `/diagnose <entry> <step> <finding>` is cut to one phrase (row 2 asks for a short comment); the two forms of the finding's name it carried stand in "What it reads" 5.
- Writing for an agent (changed text): the Rules bullet "The skill never runs against the user's real home..." is split into a positive bullet (runs against them only with the user's leave) and a bullet for the redirected red command.
- Paths and names: holds. A rewrite of a skill: holds, the fixes restate rules and keep every one. Anti-patterns: holds. Prose standard: holds.

### grill

Files: `skills/grill/SKILL.md`; 22 hunks in SKILL.md.

- Frontmatter: holds (877 characters).
- Sections in order: holds; "The decision form" and "The design bar" are reference sections of row 6.
- Where a rule goes: fixed in changed text. The rewrite of the old bullet's ending to "(self-rule, replaced by D<n>)." stood in the carried-ruling bullet (Steps 3), in the user's-answer bullet ("An answer that contradicts" 1) and in `references/self-rule.md`; the two bullets now say "as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says" and the rule stands in that file.
- Lists and tables: fixed. Bullets that held two requirements are split: What it reads 6 and 9, Steps 3 (four places), Steps 4, Steps 6, Steps 7, Steps 10, "Looking up a fact" 4, "Writing what settled" 2, 3 and 4, "The decision form", "The design bar" and Rules. The Steps 10 gate-text bullet is a sibling of the `/roadmap add` bullet it follows. The Quick start comment of `/grill <entry> --self-rule` is cut to one phrase.
- Writing for an agent (changed text): the term "kind" in "the six kinds" and "kind 3" is used in a sense the glossary did not define; the new entry "kind, of an open item" in `plan-terms.md` defines it (see the judgment calls). The other changed text holds.
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### land

Files: `skills/land/SKILL.md`; 10 hunks in SKILL.md.

- Frontmatter: holds (726 characters).
- Sections in order: fixed. The introduction paragraph held five sentences where row 1 asks for one to three; it is three: "It leaves behind the step on main in one commit with its booking and its landing report, the rewritten state file, and the step's worktree and branches removed. After a red line no fix inside the brief closes, it leaves the step out of main instead, with the worktree and branches kept for `/spec` and the failure recorded in the step's Step 0 in `plan.md`." The reference sections "The look", "The landing script" and "Removing a step's worktree" sit in the row 6 place.
- Where a rule goes: fixed. Two Stops cells held a rule (what the stop leaves, and what the rerun does); each is a bullet under the table and the cell points at it.
- Lists and tables: fixed. The Stops rows "A lock held" and "A worktree that cannot be removed" (cells of more than a phrase or a sentence), the Steps 6 agents bullet and the Rules revert bullet are split.
- Writing for an agent (changed text): completion criteria added to Steps 6 ("Done when every verification command has run on main and each red line is fixed on main, or the step is taken back out of main.") and Steps 9 ("Done when the booking is in `plan.md` and the Agents section, read back, holds each agent of the step once."). The Rules sentence on reverting a landed step cites "kind 3" in the new glossary sense.
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### ordo-help

Files: `skills/ordo-help/SKILL.md`; 4 hunks in SKILL.md.

- Frontmatter: holds (503 characters). The parenthesis "(open, spec, build, refute, diagnose, close, land, ...)" names the stages of the sequence the skill prints, which is its own content; see the judgment calls.
- Sections in order: holds; "The sequence, printed verbatim" is a reference section every run reads.
- Where a rule goes: holds.
- Lists and tables: fixed. The bullet "An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`" (Steps 4) is two bullets.
- Writing for an agent (changed text): completion criteria added to Steps 3 and Steps 4 ("The step is done when the position is printed.", "The step is done when the line is printed.").
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### ordo-init

Files: `skills/ordo-init/SKILL.md`; 8 hunks in SKILL.md.

- Frontmatter: holds (632 characters).
- Sections in order: holds.
- Where a rule goes: holds.
- Lists and tables: fixed. "With no ruling, the skill says which of these it found, and every stop stands" (What it reads 5) is two bullets. Steps 10 held a five-part order in one sentence with semicolons; it is a numbered list of five. In "Checking an existing file", item 2 (the conditions it reports, one sentence) is a list of each reported condition with the wrong-kind values as sub-bullets, item 3 is two bullets, and the "and the stop stands" tails of Steps 11 and of that section's item 4 are separate bullets.
- Writing for an agent (changed text): completion criteria added to Steps 7 ("The step is done when each optional key is left out or written with its reason in its comment.") and to items 2 and 3 of "Checking an existing file".
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### plan

Files: `skills/plan/SKILL.md`; 14 hunks in SKILL.md.

- Frontmatter: holds (477 characters).
- Sections in order: holds.
- Where a rule goes: fixed. The Stops row "The plan exists" held in its cell the rule that the entry's rulings file's Agents bullets are named and copied; the rule is the last Rules bullet and the cell says "as the last Rules bullet says".
- Lists and tables: fixed. "With no ruling..." (What it reads 6) is two bullets. Steps 2 bullets that held several requirements are split: the rulings-file copy (four bullets), the copied gate (two), the answer and the step-line shape (two), the check after the second redraft (two). Steps 3 option bullets (four), Steps 6 (the removal of the rulings file, four bullets) and the Rules bullet on a step line's authority (four bullets) are split.
- Item 4 (the coordinator's ruling): the three sub-bullets of the closing step at base lines 86 to 88 are replaced by the five dictated bullets (lines 93 to 97), the bullets after them stay, and the non-zero-exit bullet is three bullets (lines 99 to 101).
- Writing for an agent (changed text, item 4 text included): completion criterion added to Steps 4 ("The step is done when the state file holds the configuration block with every key written out, the empty dispatch block, no open item and the position."). Each dictated bullet is one rule and states the behaviour.
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### plan-orchestration

Files: `skills/plan-orchestration/SKILL.md and references/self-rule.md`; 18 hunks in SKILL.md. `self-rule.md`: 21 hunks.

- Frontmatter: holds (961 characters).
- Sections in order: holds. The skill's "Self-rule" section points at `references/self-rule.md`, which holds the material only a self-rule run reads.
- Where a rule goes: fixed in `self-rule.md`. The sentence "so a choice has one bullet" ("Closing an open item" 3) restated "one Rulings bullet" and is cut; the mapping from a bullet to the tag's name was written in "The choices file" twice and now both places say "as the `spec` skill's "What it reads" 4 reads it", where the mapping stands once. In `SKILL.md`, the tail of a "Resuming" bullet that repeated the `builders_before:` bullet of "Launching a builder" is cut.
- Lists and tables: fixed. `SKILL.md`: the prompt bullet of Steps 4 (seven items in one sentence with semicolons) is a list of seven; the `builders_before:` bullet, the repair-round bullet in "The review, earned", the "Scope" bullet, the Usage bullet, the Stops approvals bullet, the Rules round-cap bullet and the Steps 10 choices bullet are split. `self-rule.md`: the paragraph that says an open item waits and names its kind is two paragraphs; kind 5 is two sub-bullets; the approval-stop bullets, the next-entry bullets (the keys, the closing, the three ends of a run, a refusal, a stop's draft, a taking-over rulings file), the choices-file bullets (the file's making, the heading and number, the `/grill` run, the later `/spec`, the file's archive rule, the replaced-bullet bullets) and the review's bullets (finding the bullet, the step's tag, the replaced bullet's Closed-items line) are split into one rule each.
- Writing for an agent (changed text): completion criteria added to Steps 3, 6, 7, 8, 9 and 10; the two bold citations of "Dictated text" are written as quoted names; `self-rule.md` "The counts" says the stops "stay open for the user" in place of "are never closed"; the bullet "Neither `Agree` nor `C<n> =>` writes a Closed-items line" carries what is written in its place (the commit message naming the choice) and the section says "two ways". The term "kind" is the new glossary entry.
- Paths and names: holds (`references/self-rule.md` is named from the skill's folder; files of other skills are named with their skill). A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds (the scans cover `self-rule.md`).

### refute

Files: `skills/refute/SKILL.md`; 8 hunks in SKILL.md.

- Frontmatter: holds (951 characters).
- Sections in order: fixed. The introduction held four sentences; its last two are one sentence joined by a semicolon, so it is three. The reference sections "The four headings", "The verdicts" and "Finding dispositions" are every run's reading.
- Where a rule goes: holds.
- Lists and tables: fixed. The served-model bullet and the sentence that says which model is the configured one (Steps 1) are two bullets.
- Writing for an agent (changed text): completion criteria added to Steps 1, 6 and 7 and to Steps 1 and 6 of "Over a repair round".
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### repo-setup

Files: `skills/repo-setup/SKILL.md`; 10 hunks in SKILL.md.

- Frontmatter: holds (861 characters).
- Sections in order: holds; "The questions" and "The tree" are reference sections of row 6.
- Where a rule goes: holds.
- Lists and tables: fixed. "With no ruling..." (What it reads 6) is two bullets. The choice-placeholder rule (Steps 3) is a bullet with two sub-bullets and a second bullet; Steps 11's criterion is two bullets; in "Steps / sync" items 1, 3, 5, 7 and 9 are split or reworded without the semicolon; the Rules bullet on a drafted file (three rules) is three bullets.
- Writing for an agent (changed text): the plan's sync text holds; its criteria are present.
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### roadmap

Files: `skills/roadmap/SKILL.md`; 7 hunks in SKILL.md.

- Frontmatter: holds (1,022 characters, under the 1,024 limit).
- Sections in order: fixed. The reference heading "The format is the file's" was a sentence; it is "The file's format", with its four citations in the skill and the four in the glossary entries `insertion form`, `Not yet specified`, `roadmap entry` and `step` updated (plan-terms first, then the sync).
- Where a rule goes: fixed. The Anti-patterns row "Adding anything the user did not ask for and no quoted ruling ending "(self-rule)" names as a finding of a running plan" restated Rules 1; it is "Adding anything Rules 1 does not allow".
- Lists and tables: fixed. "With no ruling, the skill says which of these it found, and every stop stands" and "A check that fails leaves no ruling, and the skill says which check failed" (What it reads 6) are two bullets each; the bullet in Steps / add 2 that puts the entry under "Not yet specified" and sends the draft to add 6 is a bullet with a sub-bullet.
- Writing for an agent (changed text): the plan's text under "What it reads" 6, the introduction, the Anti-patterns row and Rules 1 hold after the fixes above; "finding", "quoted ruling" and "self-rule" are used in their glossary senses (the `quoted ruling` entry names `roadmap`'s `add` of work a finding of a running plan names).
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: fixed (above). Prose standard: holds.

### spec

Files: `skills/spec/SKILL.md`; 36 hunks in SKILL.md.

- Frontmatter: holds (987 characters).
- Sections in order: holds.
- Where a rule goes: holds in changed text. The mapping of a tag to a Rulings line stands in "What it reads" 4 and again in "Steps / A ruling" 2; both are base text (see "For roadmap entry 23").
- Lists and tables: fixed. Bold used to cite a heading ("item 2's **Dictated text**", "the **ADRs** check" twice) is a quoted name. Bullets that held two requirements are split: What it reads 2 and 5 (the ADR bullet is a bullet with three sub-bullets), Steps 1 (three places), Steps 2, 3, 4 (two places), 5 (two places), 7 (three places), 8 and 9 (three places), "A stop" 1 (two places), "A ruling" 2 and 3, "The brief check" 1, 2 (the Dictated text bullets, the ADRs check), 4 (three places) and Stops.
- Writing for an agent (changed text): completion criteria added to Steps 1 and 6, to "A ruling" 1 and 2, and to "The brief check" 1, 3 and 5; the refusal for a step without authority and the agent record for a brief-check agent stopped for another model are split into rules of their own.
- Paths and names: holds. A rewrite of a skill: holds. Anti-patterns: holds. Prose standard: holds.

### The layout page and the glossary

- `docs/dev/skill-layout.md`: item 0, five bullets after line 22, nothing else changed (`git diff --stat` shows 5 insertions and no deletion).
- `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: one new entry, "kind, of an open item", placed after "kind", and the four citations of the renamed `roadmap` heading. The plan-written entries of the diff 9fc91dc..HEAD (`booking`, `brief check`, `Closed`, `closing report`, `closing step`, `configuration block`, `cost script`, `dispatch entry`, `next-entry mode`, `open item`, `quoted ruling`, `resume point`, `reviewer`, `ruling`, `rulings file`, `self-rule`, `stop`, `choices file`, `Agents section`) were read against "Writing for an agent" and follow the glossary's entry form; none used a term outside its sense after the new entry.
- The shared-rules sentence (`skills/repo-setup/templates/shared-rules.md` line 20) is the wording of ruling H and is not edited.

## For roadmap entry 23

Breaks of "Writing for an agent" in text this plan did not write, found while reading and by the two searches named below. This is not a census of the base text: bare prohibitions and explaining sentences in base text were not searched for, and the entry's pass covers them.

Rule "Each item of Steps ends on its completion criterion". Search: the items of `## Steps` (and of its `###` subsections) whose block holds none of the phrases "done when", "is done", "ends when", "complete when", then read at the place for the last line. Base-text items without a criterion:

- land: 1 (L46), 2 (L50), 3 (L51), 4 (L57), 5 (L61), 7 (L89), 8 (L90), 10 (L110), 11 (L112), 12 (L120), 13 (L130)
- ordo-help: 1 (L41)
- ordo-init: 3 (L72), 4 (L79), 5 (L83), 8 (L101), 9 (L102), 12 (L124), Checking an existing file 1 (L138), Checking an existing file 5 (L170)
- plan: 1 (L65), 5 (L148)
- plan-orchestration: 1 (L46), 2 (L51), 4 (L62), 5 (L88)
- refute: 2 (L60), 3 (L61), 4 (L64), 5 (L67), 8 (L79), Over a repair round 2 (L88), Over a repair round 3 (L89), Over a repair round 4 (L90), Over a repair round 5 (L94), Over a repair round 7 (L98), Over a repair round 8 (L100)
- repo-setup: 1 (L55), 5 (L94), 6 (L96), 7 (L98), 9 (L106), sync 1 (L134), sync 2 (L136), sync 4 (L143), sync 6 (L156), sync 7 (L157), sync 8 (L161)
- roadmap: 1 (L67), 3 (L78), Show 1 (L90), Show 2 (L91), add 1 (L96), add 2 (L100), add 4 (L112), add 5 (L114), add 6 (L116), move 1 (L120), move 2 (L121), move 3 (L122), done 1 (L126), done 2 (L129), done 3 (L130), drop 1 (L134), drop 2 (L135)
- spec: 2 (L87), 3 (L97), 4 (L109), 7 (L164), 8 (L178), 9 (L181), A step taken back out of main 1 (L200), A step taken back out of main 2 (L203), A step taken back out of main 3 (L205), A step taken back out of main 4 (L210), A step taken back out of main 5 (L213), A step taken back out of main 6 (L215), A stop 2 (L234), A stop 3 (L235)

Rule "Every repeat a skill asks for states its count and what happens when the count is reached", base text without a count:

- `skills/spec/SKILL.md` Steps 7: the apply "is run again with `--exclude=<path>` for each such file, until the rest applies".
- `skills/diagnose/SKILL.md` Steps 8: a symptom seen only sometimes gets a rate "raised by more runs, parallel runs or narrower timing until it is high enough to probe against".

Rule "A reference section of row 6 holds only material every run reads", base sections read only in some runs:

- `skills/roadmap/SKILL.md` "A capability map beside the ordered file" (only a roadmap with a capability map).
- `skills/plan-orchestration/SKILL.md` "Two steps in flight" (only with `workers_at_once` above 1), "The review, earned" (only under `review: earned`), "Resuming, and handing the plan over" (only on a resumption), "The pace when a deadline is set" (only with a deadline), "What earns a step of its own" (only when a step is added).
- `skills/land/SKILL.md` "The look" (only when `look:` names a place and the step changes a view).

Rule "One meaning has one place", base text: `skills/spec/SKILL.md` "What it reads" 4 and "Steps / A ruling" 2 both state how a step's tag names a Rulings line (`<L>` for a line `- Open item <L> (<date>): ...`, and the text before its first ` (` for any other line).

## DONE / NOT DONE

| # | Requirement | Status | Check |
|---|---|---|---|
| 0 | Five version bullets, after line 22 of `docs/dev/skill-layout.md`, nothing else changed | DONE | verify 7; `git diff --stat docs/dev/skill-layout.md` prints 5 insertions |
| 1 | Eleven skills and `self-rule.md` read against each layout section and the prose standard | DONE | the per-skill section above |
| 2 | Every break the page or the standard decides is fixed by the smallest change; unchanged-text breaks of "Writing for an agent" listed; no fix changes a rule | DONE | the appendix; verify 1 |
| 3 | The eleven `version:` lines raised, no other change on them | DONE | verify 2 |
| 4 | The closing step's sub-bullets rewritten to the five dictated bullets; cases 13 to 17 run on the unchanged and the changed text | DONE | the cases section; `sed -n 92,101p skills/plan/SKILL.md` |
| 5 | A term added by a fix goes to `plan-terms.md` first and is synced | DONE | verify 6 |

Verify before you report, from the root of the worktree, output verbatim.

1. The plan's verify list through `checks.sh`:

```
$ sh /Users/axelfaes/workspace/ordo/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit $?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
exit 0
```

2. The versions:

```
$ for s in diagnose grill land ordo-help ordo-init plan plan-orchestration refute repo-setup roadmap spec plan-retro session-retro; do printf '%s ' $s; grep -m1 'version:' skills/$s/SKILL.md; done
diagnose   version: "1.1.0"
grill   version: "1.3.0"
land   version: "1.9.0"
ordo-help   version: "1.9.0"
ordo-init   version: "1.2.0"
plan   version: "1.11.0"
plan-orchestration   version: "2.11.0"
refute   version: "1.8.0"
repo-setup   version: "1.3.0"
roadmap   version: "1.3.0"
spec   version: "1.8.0"
plan-retro   version: "1.2.1"
session-retro   version: "1.0.0"
```

3. The paths:

```
$ git diff --name-only; git status --short --untracked-files=all
docs/dev/skill-layout.md
docs/glossary.md
skills/diagnose/SKILL.md
skills/grill/SKILL.md
skills/land/SKILL.md
skills/ordo-help/SKILL.md
skills/ordo-init/SKILL.md
skills/plan-orchestration/SKILL.md
skills/plan-orchestration/references/self-rule.md
skills/plan/SKILL.md
skills/refute/SKILL.md
skills/repo-setup/SKILL.md
skills/repo-setup/templates/plan-terms.md
skills/roadmap/SKILL.md
skills/spec/SKILL.md
 M docs/dev/skill-layout.md
 M docs/glossary.md
 M skills/diagnose/SKILL.md
 M skills/grill/SKILL.md
 M skills/land/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/references/self-rule.md
 M skills/plan/SKILL.md
 M skills/refute/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
?? .scratch/2-e-a-self-rule/agents/reviews/12-report.md
```

4. The description lengths:

```
$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'
905 skills/diagnose/SKILL.md
877 skills/grill/SKILL.md
726 skills/land/SKILL.md
503 skills/ordo-help/SKILL.md
632 skills/ordo-init/SKILL.md
961 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
861 skills/repo-setup/SKILL.md
1022 skills/roadmap/SKILL.md
779 skills/session-retro/SKILL.md
987 skills/spec/SKILL.md
```

5. Non-ASCII in the added lines (prints nothing):

```
$ git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]'; echo "exit $?"
exit 1
```

6. The glossary block:

```
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
```

7. The layout page lines 22 to 28:

```
$ sed -n 22,28p docs/dev/skill-layout.md
- The version lives in `metadata.version` only. The text of the skill carries no version, date or change history.
- A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0.
- The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed.
- The minor part when the skill does something it did not do, accepts an input it did not accept, or adds to its output, and every run that worked before still works.
- The patch part when only the wording changes and every run behaves as before.
- A refusal of a value the skill's text already called an error is no run that worked before.
```

The step's writes outside the report (item 3 of verify) are all in "Paths this step writes"; the report is the sixteenth path and shows as untracked.

## Files with line counts

```
$ wc -l docs/dev/skill-layout.md skills/diagnose/SKILL.md skills/grill/SKILL.md skills/land/SKILL.md skills/ordo-help/SKILL.md skills/ordo-init/SKILL.md skills/plan/SKILL.md skills/plan-orchestration/SKILL.md skills/plan-orchestration/references/self-rule.md skills/refute/SKILL.md skills/repo-setup/SKILL.md skills/roadmap/SKILL.md skills/spec/SKILL.md skills/repo-setup/templates/plan-terms.md docs/glossary.md
      97 docs/dev/skill-layout.md
     257 skills/diagnose/SKILL.md
     388 skills/grill/SKILL.md
     229 skills/land/SKILL.md
     117 skills/ordo-help/SKILL.md
     203 skills/ordo-init/SKILL.md
     189 skills/plan/SKILL.md
     388 skills/plan-orchestration/SKILL.md
     164 skills/plan-orchestration/references/self-rule.md
     193 skills/refute/SKILL.md
     248 skills/repo-setup/SKILL.md
     203 skills/roadmap/SKILL.md
     379 skills/spec/SKILL.md
     127 skills/repo-setup/templates/plan-terms.md
     144 docs/glossary.md
    3326 total
```

The report is `.scratch/2-e-a-self-rule/agents/reviews/12-report.md`.

## Judgment calls

- A new entry "kind, of an open item" and not a change to the existing "kind" (the `plan-retro` sense, a sentence stating a defect). The changed text of `plan-orchestration`, `grill`, `plan`, `land` and `self-rule.md` uses "kind 3" and "the six kinds" for the six numbered cases of `references/self-rule.md`, which is a second sense of the word, so it is defined as the glossary defines `mark, of a figure` and `window, of the transcripts`: a second entry named with its sense. The entry is placed after "kind" in the block's alphabetical order and cites where the sense is used.
- The `roadmap` reference heading is renamed "The file's format" because row 6 of "Sections, in order" asks for a noun-phrase label and "The format is the file's" was a sentence. Its four citations in `roadmap` and the citations in four glossary entries are changed with it, plan-terms first.
- In `self-rule.md` the commit-message bullet of "A choice booked in a rulings file" is placed under the bullet that says no Closed-items line is written, and the section says "two ways" in place of "three", so the prohibition names what is written in its place (a prohibition names the behaviour to do instead, in the same bullet).
- The mapping of a bullet to a tag's name is stated in `self-rule.md` by pointing at the `spec` skill's "What it reads" 4, where it already stands, so the rule has one place.
- A cell of a Stops table that held a rule (`diagnose` "No dispatch entry", `land` "A lock held" and "A worktree that cannot be removed", `plan` "The plan exists") has the rule moved into a bullet (Rules, or under the table) and the cell points at it; the wording of each rule is kept.
- `ordo-help`'s description names the stages "spec, refute, diagnose, land" of the sequence it prints. The layout page says a description names no neighbouring skill, which is the Use instead section's job. The names here are the content the skill prints, so they are kept.
- The word "simple" in "merge judged simple" (`spec` Steps 5 and 9, `ordo-help`, `plan-orchestration` "Two steps in flight") is the orchestrator's stated criterion for letting two briefs share a file, not a softener, so the prose standard's ban on filler does not apply to it. It is kept.
- The whole-skill rule "one rule per bullet" is applied to base text as well as changed text (the brief reads every layout section except "Writing for an agent" against the whole skill). Bullets that join two requirements by "and", "then", a semicolon or a second sentence are split. A bullet that is one requirement with its qualifier, a refusal with its stated effect ("... is a refusal that names it, and nothing is removed"), or a check that is run and reported (the labelled checks of the brief check) is left whole.
- No "Done when" sentence was added to a base item the plan did not touch; those items are listed under "For roadmap entry 23".

## User-visible changes

| Place | Before | After |
|---|---|---|
| `docs/dev/skill-layout.md` Frontmatter | the version bullet only | five bullets of the version rule after it |
| The closing step of `/plan` | the cost script ran for any ledger with no `## Agents` heading or with an `agents/agent-roles.md`, and a ledger written before the plan stopped at its closing | the closing step skips the script when no bullet line stands under `## Agents` and none in `agents/agent-roles.md`, writes the closing report with the dictated sentence, and otherwise runs the script; the skip's test is the script's own |
| `metadata.version` of eleven skills | the versions of the first table | plan-orchestration 2.11.0, grill 1.3.0, plan 1.11.0, roadmap 1.3.0, refute 1.8.0, spec 1.8.0, land 1.9.0, ordo-help 1.9.0, ordo-init 1.2.0, repo-setup 1.3.0, diagnose 1.1.0 |
| `roadmap` skill heading | "The format is the file's" | "The file's format" |
| Glossary | no entry for the six cases of `self-rule.md` | the entry "kind, of an open item" |
| Structure of the skills' text | multi-rule bullets, five Stops cells that held rules, a five-sentence `land` introduction | one rule per bullet, the cell rules in bullets, a three-sentence introduction; no rule changed |

## Anything in the brief wrong or impossible

- `skills/roadmap/SKILL.md` "What it reads" 6, the sub-bullet "Such a bullet names its finding by the path of its report under the plan's `agents/reviews/` (a refuter report, a brief-check report, a landing report or a diagnosis record), the heading the finding stands under and its number there." A diagnosis record (`skills/diagnose/templates/diagnosis.md`) has the headings Symptom, Where the probes run, Red command, Shrunk case, Hypotheses, Probes, Cause, Fix and test and Cleanup; the finding it is about is quoted in its Symptom section, and a later diagnosis is appended "under its own heading, which names its finding" (`diagnose` Steps 2). The text does not say which heading and number name a finding in such a record. Not verified: whether a diagnosis record's heading can carry a number the way a refuter report's findings do. The fix would change what `/roadmap add` accepts as a ruling (it would name, for a diagnosis record, the heading that names the finding), so it is not made. Proposed fix: say for a diagnosis record "the heading that names the finding" with no number, or drop the diagnosis record from the list.
- Nothing else in the brief was wrong or impossible.

## Appendix: every change with its place, before and after

`git diff -U0 HEAD` (the commit the step started from, 3659816) for each path of the step, in order. A hunk header `@@ -a,b +c,d @@` gives the place: lines a onward before, lines c onward after.

### docs/dev/skill-layout.md

````diff
@@ -22,0 +23,5 @@ metadata:
+- A plan that changes a skill raises one part of its `metadata.version` once, and sets the parts after it to 0.
+- The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed.
+- The minor part when the skill does something it did not do, accepts an input it did not accept, or adds to its output, and every run that worked before still works.
+- The patch part when only the wording changes and every run behaves as before.
+- A refusal of a value the skill's text already called an error is no run that worked before.
````

### skills/diagnose/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.0.0"
+  version: "1.1.0"
@@ -16 +16 @@ metadata:
-/diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, written as the refuter report names it: Spec 1 for the first run, round 1 Spec 1 for the run over repair round 1
+/diagnose <entry> <step> <finding>         find the cause of a finding of a plan's step, written as the refuter report names it
@@ -62 +62,2 @@ metadata:
-3. Choose where the probes run, and write into the record's "Where the probes run" section what it names.
+3. Choose where the probes run.
+   - Write into the record's "Where the probes run" section what the choice names.
@@ -64 +65,3 @@ metadata:
-   - Outside a plan, a defect that is not on the checkout (an older commit, with or without a patch) gets a scratch copy built as the next bullets say, run by a person too: `<commit>` is that commit, and the patch, read from where the user names it, is applied with the last line of the block.
+   - Outside a plan, a defect that is not on the checkout (an older commit, with or without a patch) gets a scratch copy built as the next bullets say, run by a person too.
+     - `<commit>` is that commit.
+     - The patch, read from where the user names it, is applied with the last line of the block.
@@ -66 +69,2 @@ metadata:
-   - `$tmp` is made by `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`, and the copy is a detached worktree made from the main checkout.
+   - `$tmp` is made by `mktemp -d "${TMPDIR:-/tmp}/diagnose.XXXXXX"`.
+   - The copy is a detached worktree made from the main checkout.
@@ -78 +82,4 @@ metadata:
-   - For a finding of a reviewer's report, `<commit>` is the dispatch entry's base, the step's diff is taken from inside the step's worktree, and each file listed with `??` is copied to the same path in the copy.
+   - For a finding of a reviewer's report:
+     - `<commit>` is the dispatch entry's base.
+     - The step's diff is taken from inside the step's worktree.
+     - Each file listed with `??` is copied to the same path in the copy.
@@ -115 +122,2 @@ metadata:
-   - With no person present, the skill writes the hypotheses into the record and goes on to Steps 11, and Steps 9 and 10 are not run.
+   - With no person present, the skill writes the hypotheses into the record and goes on to Steps 11.
+   - With no person present, Steps 9 and 10 are not run.
@@ -122 +130,2 @@ metadata:
-    - Two changes in one probe, and a probe tied to no hypothesis, are Anti-patterns rows.
+    - Two changes in one probe is an Anti-patterns row.
+    - A probe tied to no hypothesis is an Anti-patterns row.
@@ -127 +136,2 @@ metadata:
-    - Logging without that tag, and logging everything to search afterwards, are Anti-patterns rows.
+    - Logging without that tag is an Anti-patterns row.
+    - Logging everything to search afterwards is an Anti-patterns row.
@@ -130,2 +140,2 @@ metadata:
-12. Run the red command after the probe, and record the probe.
-    - The record's Probes section holds the hypothesis's rank, the one change as a diff, the run and the result, falsified or still standing.
+12. Run the red command after the probe.
+    - Record the probe: the record's Probes section holds the hypothesis's rank, the one change as a diff, the run and the result, falsified or still standing.
@@ -135 +145,2 @@ metadata:
-14. When every hypothesis is falsified, form a second list from what the probes showed, and show it as Steps 8 says.
+14. When every hypothesis is falsified, form a second list from what the probes showed.
+    - Show the second list as Steps 8 says.
@@ -145 +156,2 @@ metadata:
-    - After a cause not found the skill goes to Steps 21 and 22, then inside a plan to Steps 23; outside a plan Steps 23 and 24 are not run, so the record stays in `$TMPDIR` and its path is shown.
+    - After a cause not found the skill goes to Steps 21 and 22, then inside a plan to Steps 23.
+    - After a cause not found outside a plan, Steps 23 and 24 are not run, so the record stays in `$TMPDIR` and its path is shown.
@@ -163 +175,2 @@ metadata:
-20. Inside a plan, hand the fix over by where the defect was found, and leave the step's worktree unchanged as "Rules" says.
+20. Inside a plan, hand the fix over by where the defect was found.
+    - The step's worktree is left unchanged, as "Rules" says.
@@ -173 +186,2 @@ metadata:
-    - With no person present outside a plan, the record's path is named in the session's final message instead, and Steps 24 is not run, so the record stays for whoever reads the run.
+    - With no person present outside a plan, the record's path is named in the session's final message instead.
+    - With no person present outside a plan, Steps 24 is not run, so the record stays for whoever reads the run.
@@ -212 +226 @@ The first five rows are stops. The cause not found, inside a plan, is a decision
-| No dispatch entry | Inside a plan, for a finding of a reviewer's report or a red line, the state file has no dispatch entry for the step, or for a red line one that does not read `landing: backed-out` | A refusal that names the step and its landing state | For a finding, the step prepared with `/spec`, then `/diagnose` again; for a red line, `/diagnose` again once `/land` has taken the step back out of main, before `/spec` prepares it again, and after that `/diagnose <symptom>` with the failure in the step's Step 0 as the symptom; for a step already landed, `/diagnose <symptom>` with the finding's failure scenario as the symptom |
+| No dispatch entry | Inside a plan, for a finding of a reviewer's report or a red line, the state file has no dispatch entry for the step, or for a red line one that does not read `landing: backed-out` | A refusal that names the step and its landing state | What "Rules" gives for the kind of input: a finding, a red line or a step already landed |
@@ -233 +247,2 @@ The first five rows are stops. The cause not found, inside a plan, is a decision
-- The skill never runs against the user's real home, the installed skills or the pinned checkout without the user's leave, and a red command that would touch them runs with those paths redirected, as Steps 3 says.
+- The skill runs against the user's real home, the installed skills or the pinned checkout only with the user's leave.
+- A red command that would touch the user's real home, the installed skills or the pinned checkout runs with those paths redirected, as Steps 3 says.
@@ -237 +252,6 @@ The first five rows are stops. The cause not found, inside a plan, is a decision
-- With no rules file, a guard is not a fix: a null check, an early return or a fallback does not close a defect, and the fix reaches the code that lacks the thing it needs.
+- With no rules file, a guard is not a fix: a null check, an early return or a fallback does not close a defect.
+- With no rules file, the fix reaches the code that lacks the thing it needs.
+- After the refusal "No dispatch entry" for a finding of a reviewer's report, the step is prepared with `/spec`, then `/diagnose` runs again.
+- After the refusal "No dispatch entry" for a red line, `/diagnose` runs again once `/land` has taken the step back out of main and before `/spec` prepares it again.
+- After `/spec` has prepared a red line's step again, `/diagnose <symptom>` runs with the failure in the step's Step 0 as the symptom.
+- After the refusal "No dispatch entry" for a step already landed, `/diagnose <symptom>` runs with the finding's failure scenario as the symptom.
````

### skills/grill/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.2.0"
+  version: "1.3.0"
@@ -19 +19 @@ metadata:
-/grill <entry> --self-rule                                      the same, run by plan-orchestration in next-entry mode: each decision outside the six kinds answered with its recommendation, as the orchestrator's choice
+/grill <entry> --self-rule                                      the same, run by plan-orchestration in next-entry mode: each decision outside the six kinds takes its recommendation
@@ -55 +55,2 @@ metadata:
-       - Such a bullet settles no decision, and replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
+       - Such a bullet settles no decision.
+       - Such a bullet replaces no ruling except a ruling that sets its own plan aside, which it replaces as any later ruling does.
@@ -69 +70,2 @@ metadata:
-   - A repository that states no goals in either is shown so in the first round, and its goals are asked as a decision of their own.
+   - A repository that states no goals in either is shown so in the first round.
+   - The goals of such a repository are asked as a decision of their own.
@@ -101 +103,2 @@ metadata:
-   - A decision is a node of the design tree, and the skill names what it asks a decision, never a question, since the glossary's term "question, the" is another thing.
+   - A decision is a node of the design tree.
+   - The skill names what it asks a decision, never a question, since the glossary's term "question, the" is another thing.
@@ -119 +122 @@ metadata:
-       - A carried ruling dated after a bullet ending "(self-rule)" that it contradicts replaces that bullet, with no rule clash: the carried bullet written for it names the old bullet as the one it replaces, and the old bullet's ending is rewritten to "(self-rule, replaced by <the carried bullet's name>)." Its choice leaves the choices file, and the Closed items of its plan gain their line, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says.
+       - A carried ruling dated after a bullet ending "(self-rule)" that it contradicts replaces that bullet, with no rule clash: the carried bullet written for it names the old bullet as the one it replaces, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says for the old bullet's ending, its choice and its plan's Closed items.
@@ -127 +130,3 @@ metadata:
-   - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is marked settled, since the quoted ruling is its answer ("Rules"): it is made at the first write of Steps 8, and a draft that "Steps / Writing what settled" 3 shows as the decision is asked in the next round.
+   - A roadmap diff a quoted ruling states ("Steps / Writing what settled" 3) is marked settled, since the quoted ruling is its answer ("Rules").
+     - It is made at the first write of Steps 8.
+     - A draft that "Steps / Writing what settled" 3 shows as the decision is asked in the next round.
@@ -130 +135,2 @@ metadata:
-   - After such a restart, an answer to a number shown before is not read (Steps 7), and the redrawn round opens by saying that answers to an earlier round are to be given again against this one.
+   - After such a restart, an answer to a number shown before is not read (Steps 7).
+   - After such a restart, the redrawn round opens by saying that answers to an earlier round are to be given again against this one.
@@ -133 +139,2 @@ metadata:
-   - A decision that needs a fact has that fact looked up ("Steps / Looking up a fact"), and a decision waiting on a running lookup is in the frontier and not yet asked.
+   - A decision that needs a fact has that fact looked up ("Steps / Looking up a fact").
+   - A decision waiting on a running lookup is in the frontier and not yet asked.
@@ -157,2 +164,4 @@ metadata:
-   - Under `--self-rule`, the decisions of those six kinds alone are sent to the user as a round, the stop "A round", and the turn ends.
-   - The user's answers to such a round are written as the user's, and the interview goes on under `--self-rule`.
+   - Under `--self-rule`, the decisions of those six kinds alone are sent to the user as a round, the stop "A round".
+   - Under `--self-rule`, the turn ends after a round of the six kinds.
+   - The user's answers to such a round are written as the user's.
+   - The interview goes on under `--self-rule` after the user's answers.
@@ -172 +181,2 @@ metadata:
-   - An answer is read against the last round shown; one that names a number this session has not shown is not read: the skill says so and shows its current round again.
+   - An answer is read against the last round shown.
+   - An answer that names a number this session has not shown is not read: the skill says so and shows its current round again.
@@ -189 +199,2 @@ metadata:
-    - Name `/roadmap add <entry>` when the interview settled the gate of an entry under "Not yet specified", since `grill` does not move that entry, and print the gate's text whole beside it, for the user to give that command.
+    - Name `/roadmap add <entry>` when the interview settled the gate of an entry under "Not yet specified", since `grill` does not move that entry.
+    - Print that gate's text whole beside the command, for the user to give it.
@@ -211 +222,2 @@ metadata:
-4. Right after the start, read the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says, and write the agent as one bullet `- <agent id>: grill lookup, <served model>` to the `## Agents` section of the file the interview writes its rulings to.
+4. Right after the start, read the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
+   - Write the agent as one bullet `- <agent id>: grill lookup, <served model>` to the `## Agents` section of the file the interview writes its rulings to.
@@ -213,2 +225,4 @@ metadata:
-   - A `plan.md` without the section gets it before `## Blocked, and by what`, and a rulings file without it gets it at its end.
-   - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, nothing it found is used, and its bullet is written all the same, since it ran.
+   - A `plan.md` without the section gets it before `## Blocked, and by what`.
+   - A rulings file without the section gets it at its end.
+   - A served model that is not the configured one is the stop "A lookup agent served another model" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it found is used.
+   - The bullet of a stopped agent is written all the same, since it ran.
@@ -232 +246 @@ metadata:
-   - The user's answer that contradicts a bullet ending "(self-rule)" replaces it, with no rule clash: the new bullet names the old one as the one it replaces, and the old one's ending is rewritten to "(self-rule, replaced by D<n>)." Its choice leaves the choices file, and the Closed items of its plan gain their line, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says.
+   - The user's answer that contradicts a bullet ending "(self-rule)" replaces it, with no rule clash: the new bullet names the old one as the one it replaces, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says for the old bullet's ending, its choice and its plan's Closed items.
@@ -273 +287,2 @@ metadata:
-   - A term the plan-terms block defines is never written into the block, since `/repo-setup sync` undoes it, and no copy of the `repo-setup` skill's `templates/plan-terms.md` is changed by this skill.
+   - A term the plan-terms block defines is never written into the block, since `/repo-setup sync` undoes it.
+   - No copy of the `repo-setup` skill's `templates/plan-terms.md` is changed by this skill.
@@ -280,2 +295,4 @@ metadata:
-   - A changed gate is asked "could this pass without the goal being reached?", as the `roadmap` skill's "Steps / add" 3 says, and the answer with its reason goes in the diff and never in the entry.
-   - The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.
+   - A changed gate is asked "could this pass without the goal being reached?", as the `roadmap` skill's "Steps / add" 3 says.
+   - The answer with its reason goes in the diff and never in the entry.
+   - The draft is shown as a diff in the next round, as a decision of its own.
+   - The draft is written on the user's yes.
@@ -289 +306,3 @@ metadata:
-   - An entry under "Not yet specified" is not moved and has no gate drafted into it, since such an entry states its goal and what must be known and no gate: a changed goal or "what must be known" is drafted into it as above, and the settled gate is its Rulings bullet of item 1, which the end prints (Steps 10).
+   - An entry under "Not yet specified" is not moved and has no gate drafted into it, since such an entry states its goal and what must be known and no gate.
+     - A changed goal or "what must be known" is drafted into it as above.
+     - The settled gate is its Rulings bullet of item 1, which the end prints (Steps 10).
@@ -297 +316,2 @@ metadata:
-   - The record is numbered after the folder's highest, and its status is `proposed`.
+   - The record is numbered after the folder's highest.
+   - The record's status is `proposed`.
@@ -318 +338,4 @@ Every decision of a round has these parts, in this order, and `references/decisi
-- The roadmap diff, "record as ADR?", rule-clash and term decisions are about this repository's own pages: they have every part, their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry) read in this session, and the design bar and `design_references` do not apply to them.
+- The roadmap diff, "record as ADR?", rule-clash and term decisions are about this repository's own pages.
+  - They have every part of the decision form.
+  - Their reference line is labelled "Rule:" and cites the page that governs them (the `roadmap` skill's Rules, the ADR folder's `README.md`, the glossary entry) read in this session.
+  - The design bar and `design_references` do not apply to them.
@@ -326 +349,2 @@ Every decision of a round has these parts, in this order, and `references/decisi
-- Under `novel`, it is labelled "Novel:" and cites both, and each option goes beyond them and says what would show it works.
+- Under `novel`, it is labelled "Novel:" and cites both.
+- Under `novel`, each option goes beyond what the reference line cites and says what would show it works.
@@ -359 +383,2 @@ The first three rows are stops, which wait on the user. The rest are refusals, w
-  - A quoted ruling that holds the entry's changed text is the answer to the roadmap diff: the user's answer when its bullet ends "(the user)", and the orchestrator's choice when it ends "(self-rule)", which the user reviews in the choices file as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says.
+  - A quoted ruling that holds the entry's changed text is the answer to the roadmap diff: the user's answer when its bullet ends "(the user)", and the orchestrator's choice when it ends "(self-rule)".
+  - The user reviews the orchestrator's choice in the choices file, as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says.
````

### skills/land/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.8.2"
+  version: "1.9.0"
@@ -10 +10 @@ metadata:
-`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report. The state file is rewritten, and the step's worktree and branches are removed. After a red line no fix inside the brief closes, it leaves the step out of main instead. The worktree and branches are then kept for `/spec`, and the failure is recorded in the step's Step 0 in `plan.md`.
+`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report, the rewritten state file, and the step's worktree and branches removed. After a red line no fix inside the brief closes, it leaves the step out of main instead, with the worktree and branches kept for `/spec` and the failure recorded in the step's Step 0 in `plan.md`.
@@ -82 +82,3 @@ metadata:
-   - The step's agents are booked in `plan.md`'s Agents section by the rules of Steps 9, written and read back before that commit, since `/spec` later removes the step's dispatch entry; the agents of its later landing are appended when it lands, those already in the section skipped.
+   - The step's agents are booked in `plan.md`'s Agents section by the rules of Steps 9, since `/spec` later removes the step's dispatch entry.
+     - The booking is written and read back before the commit below.
+     - The agents of its later landing are appended when it lands, those already in the section skipped.
@@ -85,0 +88 @@ metadata:
+   - Done when every verification command has run on main and each red line is fixed on main, or the step is taken back out of main.
@@ -105,0 +109 @@ metadata:
+   - Done when the booking is in `plan.md` and the Agents section, read back, holds each agent of the step once.
@@ -188 +192 @@ metadata:
-| A lock held | An `index.lock`, the worktree's or main's, still there after 60 s of waiting at Steps 3 or 4 | The lock's path, and what the stop leaves: main untouched; under `templates/land.sh`, the worktree on `<step>` or, after the script's checkout of `<step>-land`, on that branch, and the script exits 1 | The lock removed once no git command uses it, then `/land` again; `templates/land.sh`, run again on a main with nothing staged, returns the worktree to `<step>`, deletes `<step>-land` and lands from the start |
+| A lock held | An `index.lock`, the worktree's or main's, still there after 60 s of waiting at Steps 3 or 4 | The lock's path, and what the stop leaves, as the bullet below says | The lock removed once no git command uses it, then `/land` again, as the bullet below says |
@@ -196 +200 @@ metadata:
-| A worktree that cannot be removed | At Steps 13, the worktree holds a path outside the ledger root, or a removal command fails ("Removing a step's worktree") | The open item, booked in the state file's open items and committed by path as a resume point: the worktree path and both branches, as Steps 10 read them, and what stopped the removal (each path outside the ledger root, or the command and what it printed) | The cause put right, such as the path moved out of the worktree or removed by the user, then "Removing a step's worktree" run on the worktree and branches the open item names; the open item is then closed |
+| A worktree that cannot be removed | At Steps 13, the worktree holds a path outside the ledger root, or a removal command fails ("Removing a step's worktree") | The open item, with the worktree path and both branches, as Steps 10 read them, and what stopped the removal (each path outside the ledger root, or the command and what it printed) | The cause put right, such as the path moved out of the worktree or removed by the user, then "Removing a step's worktree" run on the worktree and branches the open item names |
@@ -199,0 +204,2 @@ metadata:
+  - Under `templates/land.sh`, the stop leaves the worktree on `<step>` or, after the script's checkout of `<step>-land`, on that branch, and the script exits 1.
+  - `templates/land.sh`, run again on a main with nothing staged, returns the worktree to `<step>`, deletes `<step>-land` and lands from the start.
@@ -201,0 +208 @@ metadata:
+  - The open item is booked in the state file's open items and committed by path as a resume point.
@@ -218 +225,2 @@ metadata:
-- A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`, on a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books when the step's authority is a bullet ending "(self-rule)" alone; the revert of a step the user approved, or one a ruling of the user added, is kind 3.
+- A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`, on a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books when the step's authority is a bullet ending "(self-rule)" alone.
+  - The revert of a step the user approved, or one a ruling of the user added, is kind 3 of `plan-orchestration`'s `references/self-rule.md`, "The six kinds left open".
````

### skills/ordo-help/SKILL.md

````diff
@@ -3 +3 @@ name: ordo-help
-description: "Print the command sequence for running a plan step by step (open, spec, build, refute, diagnose, close, land, and the loop inside a step) with the choices awaiting review that the orchestrator took under self-rule, and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
+description: "Print the command sequence for running a plan step by step (open, spec, build, refute, diagnose, close, land, and the loop inside a step) with the choices awaiting review that the orchestrator took under self-rule, and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work, which choices await my review."
@@ -5 +5 @@ metadata:
-  version: "1.8.3"
+  version: "1.9.0"
@@ -48,0 +49 @@ metadata:
+   - The step is done when the position is printed.
@@ -50 +51,3 @@ metadata:
-   - An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.
+   - An open item that waits on a ruling is printed with it.
+   - The line after an open item that waits on a ruling is `Ruled: ...`.
+   - The step is done when the line is printed.
````

### skills/ordo-init/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.1.1"
+  version: "1.2.0"
@@ -49 +49,2 @@ metadata:
-   - With no ruling, the skill says which of these it found, and every stop stands.
+   - With no ruling, the skill says which of these it found.
+   - With no ruling, every stop stands.
@@ -98,0 +100 @@ Run from the repository root.
+   - The step is done when each optional key is left out or written with its reason in its comment.
@@ -105 +107,6 @@ Run from the repository root.
-10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 5 says; and, when the skill runs alone, the question whether it may commit.
+10. Show, in this order:
+    1. The form and why.
+    2. The draft `.agents/plan.yaml` in full.
+    3. Each page it would create, in full, with the commands' results for a verification page.
+    4. The `.gitignore` changes, as Rules 5 says.
+    5. When the skill runs alone, the question whether it may commit.
@@ -114 +121,2 @@ Run from the repository root.
-    - A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.
+    - A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named.
+    - The stop then stands with nothing written.
@@ -132,2 +140,23 @@ Run from the repository root.
-2. It reports: a key written twice; a key beside `projects:` in the `projects:` form; a required key missing; an unknown key; a value of the wrong kind (`worker` or `reviewer` not `claude:<model>` or written with no value, `repair_reviewer` not `claude:<model>`, `self_rule` or `next_entry` neither `on` nor `off`, `review` neither `every` nor `earned`, `libraries` neither `check` nor `avoid`, `adr` not naming a folder under the repository root, `design_bar` outside `industry`, `state-of-the-art` and `novel`, `design_references` not a list of text, `worker_effort` or `reviewer_effort` outside `low`, `medium`, `high`, `xhigh` and `max`, a value whose kind differs from its default's); a page named by `roadmap`, `verification`, `rules` or `standards` that does not exist; a `worktree_paths` entry that does not exist; a worktree root git does not ignore; a configuration file git ignores.
-3. Optional keys left out are listed as notes with the default that applies, which for `repair_reviewer` is the `reviewer` value, as is the default ADR folder `docs/adr` when `adr` names it and the folder does not exist yet.
+2. It reports each of these.
+   - A key written twice.
+   - A key beside `projects:` in the `projects:` form.
+   - A required key missing.
+   - An unknown key.
+   - A value of the wrong kind.
+     - `worker` or `reviewer` not `claude:<model>` or written with no value.
+     - `repair_reviewer` not `claude:<model>`.
+     - `self_rule` or `next_entry` neither `on` nor `off`.
+     - `review` neither `every` nor `earned`.
+     - `libraries` neither `check` nor `avoid`.
+     - `adr` not naming a folder under the repository root.
+     - `design_bar` outside `industry`, `state-of-the-art` and `novel`.
+     - `design_references` not a list of text.
+     - `worker_effort` or `reviewer_effort` outside `low`, `medium`, `high`, `xhigh` and `max`.
+     - A value whose kind differs from its default's.
+   - A page named by `roadmap`, `verification`, `rules` or `standards` that does not exist.
+   - A `worktree_paths` entry that does not exist.
+   - A worktree root git does not ignore.
+   - A configuration file git ignores.
+   - The item is done when each of these that holds is reported.
+3. Optional keys left out are listed as notes with the default that applies, which for `repair_reviewer` is the `reviewer` value.
+   - The default ADR folder `docs/adr` is also listed as a note when `adr` names it and the folder does not exist yet.
@@ -134,0 +164 @@ Run from the repository root.
+   - The item is done when each optional key left out, and the default ADR folder where it applies, has its note.
@@ -137 +167,2 @@ Run from the repository root.
-   - A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands.
+   - A fix the skill proposes that differs from the ruled fix is shown with the difference.
+   - The stop then stands.
````

### skills/plan/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.10.1"
+  version: "1.11.0"
@@ -58 +58,2 @@ metadata:
-   - With no ruling, the skill says which of these it found, and every stop stands.
+   - With no ruling, the skill says which of these it found.
+   - With no ruling, every stop stands.
@@ -71 +72,4 @@ metadata:
-   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
+   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line.
+   - The file's other lines, such as a heading or a blank line, are not copied.
+   - Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3, for the user to place.
+   - A line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
@@ -76 +80,2 @@ metadata:
-   - A copied gate that could pass without the goal is kept as the roadmap has it, and its answer and reason go to the user at Steps 3, since the gate is the roadmap's and the user's.
+   - A copied gate that could pass without the goal is kept as the roadmap has it, since the gate is the roadmap's and the user's.
+   - The answer and reason for such a gate go to the user at Steps 3.
@@ -82 +87,2 @@ metadata:
-   - The answer stands only in "## Gate", and each step line keeps the shape the template gives it.
+   - The answer stands only in "## Gate".
+   - Each step line keeps the shape the template gives it.
@@ -84 +90,2 @@ metadata:
-   - A check that could still pass after the second redraft is kept as drafted, and its answer and reason go to the user at Steps 3.
+   - A check that could still pass after the second redraft is kept as drafted.
+   - The answer and reason for such a check go to the user at Steps 3.
@@ -86,3 +93,5 @@ metadata:
-     - The closing step skips the cost script only when `plan.md` has its `## Agents` heading with no bullet under it, up to the next `## ` heading, and the ledger has no `agents/agent-roles.md`.
-     - A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence "The plan started no agent: `plan.md`'s Agents section holds no agent bullet and the ledger has no `agents/agent-roles.md`, so the closing step did not run the cost script."
-     - In every other case, before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder: a `plan.md` with no `## Agents` heading (`/plan` always writes the heading) and an `agents/agent-roles.md` that exists, read or not, both go to the script, so the closing step and the script never disagree.
+     - The closing step skips the cost script only when the ledger names no agent: no bullet line stands under a `## Agents` heading of `plan.md`, up to the next `## ` heading, and none stands in `agents/agent-roles.md`.
+     - A `plan.md` with no `## Agents` heading, and a ledger with no `agents/agent-roles.md`, hold no such bullet line.
+     - A closing step that skips the script writes the closing report, `agents/reviews/closing.md`, with the sentence "The plan started no agent: neither `plan.md`'s Agents section nor `agents/agent-roles.md` holds an agent bullet, so the closing step did not run the cost script."
+     - In every other case, before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.
+     - The skip's test is the test under which the script prints `error: the ledger names no agent`, so the closing step and the script never disagree.
@@ -90 +99,3 @@ metadata:
-     - A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`, and the stop message holds the script's `error:` lines. A model the table lacks is covered by a row copied into the table from the pricing page, committed with the closing.
+     - A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`.
+     - The stop message holds the script's `error:` lines.
+     - A model the table lacks is covered by a row copied into the table from the pricing page, committed with the closing.
@@ -108,2 +119,4 @@ metadata:
-     - The first option is the recommendation, and the second, which leaves the plan unopened, is named as the lazy option.
-     - A line of the rulings file left to place does not keep the stop: it is copied as Steps 2 says for a line the user leaves unplaced, and Open item A names it.
+     - The first option is the recommendation.
+     - The second option, which leaves the plan unopened, is named as the lazy option.
+     - A line of the rulings file left to place does not keep the stop.
+     - Such a line is copied as Steps 2 says for a line the user leaves unplaced, and Open item A names it.
@@ -133,0 +147 @@ metadata:
+   - The step is done when the state file holds the configuration block with every key written out, the empty dispatch block, no open item and the position.
@@ -140 +154,4 @@ metadata:
-   - The commit also removes the rulings file copied at Steps 2: when the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), `git rm -q -f -- <path>`, and its path named in the commit with the others; otherwise, `git rm -q -f --cached -- <path>` when git lists it as staged, and the file deleted before the commit, its path not named. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
+   - The commit also removes the rulings file copied at Steps 2.
+     - When the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), the removal is `git rm -q -f -- <path>`, and its path is named in the commit with the others.
+     - Otherwise the removal is `git rm -q -f --cached -- <path>` when git lists the file as staged, and the file is deleted before the commit, its path not named.
+     - The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
@@ -153 +170 @@ metadata:
-| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove, with its Agents bullets named when it holds any, to be copied into the open plan's Agents section before the file is removed | Nothing |
+| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove, as the last Rules bullet says | Nothing |
@@ -165 +182,4 @@ metadata:
-- Every step line of `plan.md` ends with its authority: `(approved)` for a step of the list the user approved, or `(ruling <name>)` for a step a ruling added, after the approval or under a quoted ruling ending "(self-rule)", the ruling being the user's or one booked under self-rule, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says, or `(ruling A)` for a step of a list taken under `--self-rule`, naming that run's Open item A.
+- Every step line of `plan.md` ends with its authority.
+  - `(approved)` for a step of the list the user approved.
+  - `(ruling <name>)` for a step a ruling added, after the approval or under a quoted ruling ending "(self-rule)", the ruling being the user's or one booked under self-rule, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says.
+  - `(ruling A)` for a step of a list taken under `--self-rule`, naming that run's Open item A.
@@ -168,0 +189 @@ metadata:
+- When the stop "The plan exists" finds the entry's rulings file still there, the Agents bullets it holds are named, and are copied into the open plan's Agents section before the user removes the file.
````

### skills/plan-orchestration/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "2.10.1"
+  version: "2.11.0"
@@ -60,0 +61 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
+   - Done when `/spec` has written the brief and the dispatch block and the brief check's report is read, or the step has stopped.
@@ -70 +71,8 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards, the ADRs the brief names); every requirement the step is judged on; that the step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes; the report path and shape.
+   - **The prompt.** It states, in its own words:
+     - The worktree, and that it is the only place to work.
+     - The no-git rule.
+     - What is never touched: the ledger beyond the builder's report, the main checkout, the user's data.
+     - The reading order: the rules file, the brief, the standards, the ADRs the brief names.
+     - Every requirement the step is judged on.
+     - That the step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes.
+     - The report path and shape.
@@ -93 +101 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-     - Hold the text the ruling gives the builder word for word as Steps 8's **Dictated text** says, before it is committed.
+     - Hold the text the ruling gives the builder word for word as Steps 8's "Dictated text" says, before it is committed.
@@ -97,0 +106 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
+   - Done when the report is saved at the `report` path, `builder_usage` is written and the whole diff is read.
@@ -101,0 +111 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
+   - Done when the refuter report is saved and its record is under `reviewer_report`.
@@ -104 +114 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-   - **Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round's brief or the ruling is committed, as the `spec` skill's "Steps / The brief check" 2 **Dictated text** holds a brief's, since the brief check never reads those files.
+   - **Dictated text.** Text a round's brief or a cases ruling gives the builder word for word is held line by line before the round's brief or the ruling is committed, as the `spec` skill's "Steps / The brief check" 2 "Dictated text" holds a brief's, since the brief check never reads those files.
@@ -118,0 +129 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
+   - Done when each finding is closed in a round, left to landing or raised as a stop.
@@ -128,0 +140 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
+   - Done when the step is on main with its booking, or is taken back out of main.
@@ -133 +145 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-    - After the closing step, the orchestrator's run ends at an end `references/self-rule.md`, "Next-entry mode", names.
+    - Under `self_rule: on` and `next_entry: on`, the run after the closing step ends in one of the cases `references/self-rule.md`, "Next-entry mode", lists.
@@ -137 +149,3 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
-      - Under `self_rule: on`, it also lists the choices taken since the loop began, by `C<n>` and heading, and says they are reviewed in `<ledger_root>/choices.md` with `C<n> Agree` or `C<n> => <ruling>`.
+      - Under `self_rule: on`, it also lists the choices taken since the loop began, by `C<n>` and heading.
+      - Under `self_rule: on`, it also says the choices are reviewed in `<ledger_root>/choices.md` with `C<n> Agree` or `C<n> => <ruling>`.
+    - Done when the final message is written, or the loop is at step 2.
@@ -196 +210 @@ On resumption with a dispatch block present:
-- The dead builder's record moves to `builders_before:` as "Launching a builder" says, and `session_id` takes the continuation builder.
+- The dead builder's record moves to `builders_before:` as "Launching a builder" says.
@@ -211 +225,2 @@ On every resumption, with a dispatch block or without one:
-- The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran.
+- The runs over the repair rounds follow `refute_after_repair`.
+- Under `earned`, the runs over the repair rounds run only on a step whose first review ran.
@@ -229 +244,2 @@ On every resumption, with a dispatch block or without one:
-- **Scope.** The section applies under `self_rule: on` in the configuration block, and to next-entry mode and to `/grill` and `/plan` run with `--self-rule`, where `.agents/plan.yaml` holds the keys, as `references/self-rule.md`, "Next-entry mode", says; otherwise, with `self_rule: off`, or the key absent, every open item waits for the user, as "Stops" says.
+- **Scope.** The section applies under `self_rule: on` in the configuration block, and to next-entry mode and to `/grill` and `/plan` run with `--self-rule`, where `.agents/plan.yaml` holds the keys, as `references/self-rule.md`, "Next-entry mode", says.
+  - Otherwise, with `self_rule: off` or the key absent, every open item waits for the user, as "Stops" says.
@@ -258 +274,4 @@ With `workers_at_once` above 1 the orchestrator, still one, may have that many s
-- A builder that is replaced keeps its record: its agent id and served model move to the dispatch entry's `builders_before:` key, `<agent id> (<served model>, stopped)` for a builder stopped for another model and `<agent id> (<served model>, dead)` for a dead builder, one after another, and `session_id` takes the new builder.
+- A builder that is replaced keeps its record: its agent id and served model move to the dispatch entry's `builders_before:` key, one after another.
+  - A builder stopped for another model is recorded as `<agent id> (<served model>, stopped)`.
+  - A dead builder is recorded as `<agent id> (<served model>, dead)`.
+  - `session_id` takes the new builder.
@@ -291 +310,2 @@ With `workers_at_once` above 1 the orchestrator, still one, may have that many s
-- The script finds the response bodies in the folder `OTEL_LOG_RAW_API_BODIES` names, from its environment or else from the `env` key of Claude Code's settings files, as its head comment says. With no folder, it prices from the transcripts and marks every cost as a lower bound.
+- The script finds the response bodies in the folder `OTEL_LOG_RAW_API_BODIES` names, from its environment or else from the `env` key of Claude Code's settings files, as its head comment says.
+- With no such folder, the script prices from the transcripts and marks every cost as a lower bound.
@@ -328 +348,2 @@ The table holds seven kinds of stop, each for a decision for the user, and one r
-  - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling on the item then approves them too, with no second stop.
+  - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list.
+  - The user's ruling on the item then approves those approvals too, with no second stop.
@@ -357 +378,3 @@ The table holds seven kinds of stop, each for a decision for the user, and one r
-- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large for landing. A new finding of a review never earns that round, and the user's yes never extends the cap.
+- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large for landing.
+  - A new finding of a review never earns that round.
+  - The user's yes never extends the cap.
````

### skills/plan-orchestration/references/self-rule.md

````diff
@@ -9 +9,3 @@ The scope is the first bullet of `SKILL.md`'s section "Self-rule".
-An open item of one of these kinds waits for the user, and the open item names its kind by its number:
+An open item of one of these kinds waits for the user.
+
+The open item names its kind by its number:
@@ -18 +20,3 @@ An open item of one of these kinds waits for the user, and the open item names i
-5. The user's reading of a page a step writes: the reading stays an open item and blocks no step.
+5. The user's reading of a page a step writes.
+   - The reading stays an open item.
+   - The steps go on while the reading is open.
@@ -23 +27,2 @@ An open item of one of these kinds waits for the user, and the open item names i
-- An option that runs `/roadmap move`, `drop` or `done`, `/roadmap add` of work no finding names, `/ordo-init` or `/repo-setup` under a quoted ruling meets that skill's approval stop, since those commands take only a bullet ending "(the user)" as a quoted ruling, and the item stays open for the user.
+- An option that runs `/roadmap move`, `drop` or `done`, `/roadmap add` of work no finding names, `/ordo-init` or `/repo-setup` under a quoted ruling meets that skill's approval stop, since those commands take only a bullet ending "(the user)" as a quoted ruling.
+  - The item stays open for the user.
@@ -25 +30,2 @@ An open item of one of these kinds waits for the user, and the open item names i
-  - After `/roadmap add` commits the entry, the orchestrator adds `the roadmap entry <n>` to the choice's `Builds on it:` line and commits the choices file by path, a resume point.
+  - After `/roadmap add` commits the entry, the orchestrator adds `the roadmap entry <n>` to the choice's `Builds on it:` line.
+  - The orchestrator then commits the choices file by path, a resume point.
@@ -34 +40 @@ An open item that "The six kinds left open" and "A skill with its own approval s
-   - That bullet is the line "Steps / A ruling" 2 names for a ruling that adds or splits a step or runs a skill, so a choice has one bullet.
+   - That bullet is the line "Steps / A ruling" 2 names for a ruling that adds or splits a step or runs a skill.
@@ -42 +48 @@ An open item that "The six kinds left open" and "A skill with its own approval s
-- The stops a count of "Rules" raises, "A step that does not converge" and the second failure of a step's landing (the `land` skill's Steps 6), are never closed under self-rule, since each ends a step the unattended loop has not brought to an end, and closing it would let the loop run without bound.
+- The stops a count of "Rules" raises, "A step that does not converge" and the second failure of a step's landing (the `land` skill's Steps 6), stay open for the user under self-rule, since each ends a step the unattended loop has not brought to an end, and closing it would let the loop run without bound.
@@ -50 +56,2 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - The orchestrator reads the file itself, since no plan is open then, and `/grill` and `/plan` check the same two keys.
+  - The orchestrator reads the file itself, since no plan is open then.
+  - `/grill` and `/plan` check the same two keys.
@@ -54 +61,2 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - The user's approval resumes the closing step, after which the run goes on in the same turn.
+  - The user's approval resumes the closing step.
+  - The run then goes on in the same turn.
@@ -56,3 +64,6 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - With no entry in the open order and none under "Not yet specified", the run ends, and the final message says no open entry is left.
-  - With no entry in the open order and one or more under "Not yet specified", the run ends at the first of them, and the final message names it with `/roadmap add <entry>`, which names its gate.
-  - An entry that waits on an entry neither done nor dropped, other than one the run has just closed, ends the run there, and the final message names the entry it waits on.
+  - With no entry in the open order and none under "Not yet specified", the run ends.
+    - The final message says no open entry is left.
+  - With no entry in the open order and one or more under "Not yet specified", the run ends at the first of them.
+    - The final message names it with `/roadmap add <entry>`, which names its gate.
+  - An entry that waits on an entry neither done nor dropped, other than one the run has just closed, ends the run there.
+    - The final message names the entry it waits on.
@@ -70 +81,2 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - A stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule` shows its draft and writes nothing.
+  - A stop that the `plan` skill's Steps 3 keeps with the user under `--self-rule` shows its draft.
+    - No file is written at the stop.
@@ -73 +85,2 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - A refusal changes nothing, and the final message names it.
+  - A refusal changes nothing.
+  - The final message names the refusal.
@@ -79 +92,3 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-  - A rulings file that holds the user's own bullets is read the same way: its settled decisions stand, and its open decisions are answered as `/grill --self-rule` answers them.
+  - A rulings file that holds the user's own bullets is read the same way.
+    - Its settled decisions stand.
+    - Its open decisions are answered as `/grill --self-rule` answers them.
@@ -83 +98,3 @@ Next-entry mode runs the next open roadmap entry after a plan's closing, under s
-The file `<ledger_root>/choices.md` is made from this skill's `templates/choices.md` at the first choice, by copying its head and its `Last number` line, and the lines below them show the form of an entry and a choice.
+The file `<ledger_root>/choices.md` is made from this skill's `templates/choices.md` at the first choice, by copying its head and its `Last number` line.
+
+The lines of that template below those two show the form of an entry and a choice.
@@ -86 +103,2 @@ The file `<ledger_root>/choices.md` is made from this skill's `templates/choices
-- Under it, each choice has one heading, `## C<n>. <the decision, as a phrase> (<date>)`, where `<n>` is one more than the file's line `Last number: C<m>`, which is then rewritten to `C<n>`, so no number is used twice.
+- Under it, each choice has one heading, `## C<n>. <the decision, as a phrase> (<date>)`, where `<n>` is one more than the file's line `Last number: C<m>`.
+- The line `Last number: C<m>` is then rewritten to `Last number: C<n>`, so no number is used twice.
@@ -91 +109 @@ The file `<ledger_root>/choices.md` is made from this skill's `templates/choices
-  - A step's tag names the bullet as the `spec` skill's "What it reads" 4 reads it: `<L>` for a bullet "Closing an open item" books, and `D<n> <the decision, as a phrase>` for a bullet `/grill --self-rule` writes.
+  - A step's tag names the bullet as the `spec` skill's "What it reads" 4 reads it.
@@ -97,3 +115,6 @@ The file `<ledger_root>/choices.md` is made from this skill's `templates/choices
-- A `/grill` run that writes a roadmap diff under a quoted ruling ending "(self-rule)" adds `the roadmap diff of entry <entry number>` to that bullet's choice's `Builds on it:` line, and the files the run commits include it.
-- A later `/spec` whose brief rests on the choice (its step's tag names the bullet, or the brief names the bullet) adds its step to the `Builds on it:` line, and its preparation commit carries the file, as the `spec` skill's Steps 6 says.
-- The file is never archived, and a closed plan's choices stay in it until the user reviews them.
+- A `/grill` run that writes a roadmap diff under a quoted ruling ending "(self-rule)" adds `the roadmap diff of entry <entry number>` to that bullet's choice's `Builds on it:` line.
+  - The files the run commits include the choices file.
+- A later `/spec` whose brief rests on the choice (its step's tag names the bullet, or the brief names the bullet) adds its step to the `Builds on it:` line.
+  - Its preparation commit carries the choices file, as the `spec` skill's Steps 6 says.
+- The file stays at `<ledger_root>/choices.md` when a plan is archived.
+- A closed plan's choices stay in it until the user reviews them.
@@ -101,2 +122,5 @@ The file `<ledger_root>/choices.md` is made from this skill's `templates/choices
-  - The replaced bullet's ending is rewritten to "(self-rule, replaced by <the new bullet's name>).", its choice is removed from the file, its entry heading with it when no choice is left under it, and `- <date>: C<n>: replaced by <the new bullet's name>.` is added to the Closed items of its plan.
-  - The steps that rest on the replaced bullet, those whose tag or Step 0 names it, are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`, with the new bullet's name in each tag. The name is read as the `spec` skill's "What it reads" 4 reads it: `<L>` for a `Ruled:` reply's bullet `Open item <L>`, and the text before its first ` (` for a bullet `/grill` writes.
+  - The replaced bullet's ending is rewritten to "(self-rule, replaced by <the new bullet's name>).".
+  - Its choice is removed from the file, its entry heading with it when no choice is left under it.
+  - `- <date>: C<n>: replaced by <the new bullet's name>.` is added to the Closed items of its plan.
+  - The steps that rest on the replaced bullet, those whose tag or Step 0 names it, are treated as "The review of a choice" treats the steps of `Builds on it:` under `C<n> =>`, with the new bullet's name in each tag.
+  - The name is read as the `spec` skill's "What it reads" 4 reads it.
@@ -113 +137,2 @@ C<n> => <the user's ruling, one clause per question the open item asked>
-- The session finds the choice's bullet by the opening words its `Booked:` line gives, in the file that line names: the Rulings section of a plan's `plan.md` (for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`) or the entry's rulings file `<ledger_root>/rulings/<slug>.md`, and the line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking.
+- The session finds the choice's bullet by the opening words its `Booked:` line gives, in the file that line names: the Rulings section of a plan's `plan.md` (for a closed plan, of the archived `plan.md` whose folder has the same slug under `<archive_root>/`) or the entry's rulings file `<ledger_root>/rulings/<slug>.md`.
+  - The line number of `Booked:` is the place it looks first, since lines above the bullet may have been added or removed since the booking.
@@ -121 +146,2 @@ C<n> => <the user's ruling, one clause per question the open item asked>
-  - A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling, and its tag too, to `(ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, when its tag names the old bullet.
+  - A step of `Builds on it:` not yet prepared has its text rewritten to the new ruling.
+    - Its tag is rewritten to `(ruling <the new bullet's name>)`, here `(ruling C<n> <the decision, as a phrase>)`, when its tag names the old bullet.
@@ -131,2 +157,3 @@ C<n> => <the user's ruling, one clause per question the open item asked>
-  - The choice then leaves the choices file, as under `Agree`, and `- <date>: C<n>, <the decision>: replaced by the user's ruling C<n>.` is added to the Closed items, except as the bullet "A choice booked in a rulings file" says.
-- **A choice booked in a rulings file.** When `Booked:` names the entry's rulings file, the review differs in three ways.
+  - The choice then leaves the choices file, as under `Agree`.
+  - `- <date>: C<n>, <the decision>: replaced by the user's ruling C<n>.` is added to the Closed items, except as the bullet "A choice booked in a rulings file" says.
+- **A choice booked in a rulings file.** When `Booked:` names the entry's rulings file, the review differs in two ways.
@@ -134 +161 @@ C<n> => <the user's ruling, one clause per question the open item asked>
-  - The review's commit message names the choice and the decision.
+    - The review's commit message names the choice and the decision in its place.
````

### skills/refute/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.7.1"
+  version: "1.8.0"
@@ -10 +10 @@ metadata:
-`/refute <entry> <step>` dispatches one reviewer, who changes nothing. The reviewer does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`: a verdict per item of the brief and per case, and a list of findings each with its place (a file and a line in code, a page and its section in a page) and its failure scenario, or "none" under a heading. The orchestrator or the session saves it, and the next resume point commits it.
+`/refute <entry> <step>` dispatches one reviewer, who changes nothing. The reviewer does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`: a verdict per item of the brief and per case, and a list of findings each with its place (a file and a line in code, a page and its section in a page) and its failure scenario, or "none" under a heading; the orchestrator or the session saves it, and the next resume point commits it.
@@ -53 +53,2 @@ metadata:
-   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used. The configured one is the model the configuration block's `reviewer:` names for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
+   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used.
+   - The configured model is the model the configuration block's `reviewer:` names for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
@@ -57,0 +59 @@ metadata:
+   - Done when the reviewer is dispatched and its agent id and served model are read, or the refusal or the stop is raised.
@@ -71,0 +74 @@ metadata:
+   - Done when the report holds the verification lines, a verdict for each item and case, the four headings, "Declined to judge" and the usage line.
@@ -74,0 +78 @@ metadata:
+   - Done when the report is saved and its record is under `reviewer_report`.
@@ -82,0 +87 @@ metadata:
+   - Done when the reviewer of the run is dispatched on the model this item gives.
@@ -91,0 +97 @@ metadata:
+   - Done when the run's section is appended and its record is in `reviewer_report`.
````

### skills/repo-setup/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.2.1"
+  version: "1.3.0"
@@ -50 +50,2 @@ metadata:
-   - With no ruling, the skill says which of these it found, and every stop stands.
+   - With no ruling, the skill says which of these it found.
+   - With no ruling, every stop stands.
@@ -70 +71,4 @@ metadata:
-     - A rule whose condition is a choice placeholder (`<yes or no>`, or a value `or none`) is kept when the answer is yes or a value, with the parenthesis removed when the answer is yes and holding the value when the answer is a value, and is left out of the installed page, with its sub-list and the placeholders only it holds, when the answer is no or none.
+     - A rule whose condition is a choice placeholder (`<yes or no>`, or a value `or none`) is kept when the answer is yes or a value.
+       - With the answer yes, the parenthesis is removed.
+       - With a value as the answer, the rule holds the value.
+     - Such a rule is left out of the installed page, with its sub-list and the placeholders only it holds, when the answer is no or none.
@@ -116 +120,2 @@ metadata:
-    - The step is done when the outputs and, when the answer to question 10 is yes, the settings text are shown; the setup goes on to Steps 12 without waiting for the text to be added.
+    - The step is done when the outputs and, when the answer to question 10 is yes, the settings text are shown.
+    - The setup goes on to Steps 12 without waiting for the text to be added.
@@ -129 +134,2 @@ metadata:
-1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`, which checks the shared-rules block of `CLAUDE.md` and then the plan-terms block of `docs/glossary.md`; steps 2 to 9 follow its exit status and, on exit 2, its `error:` lines.
+1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`, which checks the shared-rules block of `CLAUDE.md` and then the plan-terms block of `docs/glossary.md`.
+   - Steps 2 to 9 follow its exit status and, on exit 2, its `error:` lines.
@@ -131 +137 @@ metadata:
-3. Exit 1: a block differs; show the diff of each block that differs, for the user's ruling per hunk ("Stops").
+3. Exit 1, when a block differs: show the diff of each block that differs, for the user's ruling per hunk ("Stops").
@@ -147 +153,2 @@ metadata:
-   - A draft that differs from it is shown whole with each difference named, and the stop stands.
+   - A draft that differs from it is shown whole with each difference named.
+   - The stop then stands.
@@ -150 +157,2 @@ metadata:
-7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names. A no-single-block line of the same run is still drafted, as step 4 says.
+7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names.
+   - A no-single-block line of the same run is still drafted, as step 4 says.
@@ -155 +163 @@ metadata:
-9. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it; otherwise stop ("Stops").
+9. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it, and otherwise stop ("Stops").
@@ -238 +246,3 @@ utils/                           scripts the build and the checks run
-- Every file it drafts is ASCII with one paragraph per source line, as the prose standard says, and carries no history, as the shared rules say; the copied git guard hook is copied byte for byte.
+- Every file it drafts is ASCII with one paragraph per source line, as the prose standard says.
+- Every file it drafts carries no history, as the shared rules say.
+- The copied git guard hook is copied byte for byte.
````

### skills/repo-setup/templates/plan-terms.md

````diff
@@ -50 +50 @@
-- **insertion form**: the roadmap file's numbering for an entry placed between two others, such as `37.A` or `12.5`. Stated in: `roadmap`, "The format is the file's".
+- **insertion form**: the roadmap file's numbering for an entry placed between two others, such as `37.A` or `12.5`. Stated in: `roadmap`, "The file's format".
@@ -52,0 +53 @@
+- **kind, of an open item**: one of the six numbered cases that `plan-orchestration`'s `references/self-rule.md` lists under "The six kinds left open", each a decision that waits for the user under self-rule. An open item names its kind by its number. Stated in: `plan-orchestration`, `references/self-rule.md`, "The six kinds left open", and "Stops"; `grill`, Steps 6; `plan`, Steps 3; `land`, Rules.
@@ -61 +62 @@
-- **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first. Stated in: `roadmap`, "The format is the file's"; `plan`, "What it reads" 2.
+- **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first. Stated in: `roadmap`, "The file's format"; `plan`, "What it reads" 2.
@@ -94 +95 @@
-- **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number. `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The format is the file's".
+- **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number. `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The file's format".
@@ -111 +112 @@
-- **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The format is the file's".
+- **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".
````

### docs/glossary.md

````diff
@@ -55 +55 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **insertion form**: the roadmap file's numbering for an entry placed between two others, such as `37.A` or `12.5`. Stated in: `roadmap`, "The format is the file's".
+- **insertion form**: the roadmap file's numbering for an entry placed between two others, such as `37.A` or `12.5`. Stated in: `roadmap`, "The file's format".
@@ -57,0 +58 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
+- **kind, of an open item**: one of the six numbered cases that `plan-orchestration`'s `references/self-rule.md` lists under "The six kinds left open", each a decision that waits for the user under self-rule. An open item names its kind by its number. Stated in: `plan-orchestration`, `references/self-rule.md`, "The six kinds left open", and "Stops"; `grill`, Steps 6; `plan`, Steps 3; `land`, Rules.
@@ -66 +67 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first. Stated in: `roadmap`, "The format is the file's"; `plan`, "What it reads" 2.
+- **Not yet specified**: the roadmap section for work whose gate cannot yet be named, each entry with its goal and what must be known first. Stated in: `roadmap`, "The file's format"; `plan`, "What it reads" 2.
@@ -99 +100 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number. `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The format is the file's".
+- **roadmap entry**: one piece of work in the roadmap, with its goal, its gate and what it waits on, placed in dependency order under a number. `/plan` opens it as a plan. Stated in: `roadmap`, "Steps / add" and "The file's format".
@@ -116 +117 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The format is the file's".
+- **step**: a plan step, one deliverable and one dispatch of its executor with the command that proves it, a line of `plan.md`'s step list ending with its authority. The orchestrator does the bookkeeping steps itself. Stated in: `plan`, Rules. Also an item of a skill's Steps, cited as "Steps <n>". Stated in: each skill's Steps. Also an entry under a phase, in a roadmap whose entries stand at two levels. Stated in: `roadmap`, "The file's format".
````

### skills/roadmap/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.2.0"
+  version: "1.3.0"
@@ -60,2 +60,4 @@ metadata:
-       - A check that fails leaves no ruling, and the skill says which check failed.
-   - With no ruling, the skill says which of these it found, and every stop stands.
+       - A check that fails leaves no ruling.
+       - The skill says which check failed.
+   - With no ruling, the skill says which of these it found.
+   - With no ruling, every stop stands.
@@ -65 +67 @@ metadata:
-1. Read the file's format, as "The format is the file's" says, and whether a capability map sits beside it ("A capability map beside the ordered file").
+1. Read the file's format, as "The file's format" says, and whether a capability map sits beside it ("A capability map beside the ordered file").
@@ -97 +99 @@ metadata:
-   - The entry keeps its number ("The format is the file's", bullet "Numbering under Not yet specified").
+   - The entry keeps its number ("The file's format", bullet "Numbering under Not yet specified").
@@ -100 +102,2 @@ metadata:
-   - At that stop the user may put the entry under "Not yet specified": it is drafted in the form of "The format is the file's", bullet "Not yet specified", and the draft goes to Steps / add 6 without Steps / add 3 to 5.
+   - At that stop the user may put the entry under "Not yet specified": it is drafted in the form of "The file's format", bullet "Not yet specified".
+     - The draft goes to Steps / add 6 without Steps / add 3 to 5.
@@ -134 +137 @@ metadata:
-## The format is the file's
+## The file's format
@@ -187,2 +190,2 @@ When the roadmap's introduction links an index as the map of what the product is
-| Renumbering an existing entry | Entry numbers are referenced from ledgers, ADRs and commits, which then point at the wrong entry | "The format is the file's", Numbering |
-| Adding anything the user did not ask for and no quoted ruling ending "(self-rule)" names as a finding of a running plan | The roadmap then holds work nobody decided | Rules 1 |
+| Renumbering an existing entry | Entry numbers are referenced from ledgers, ADRs and commits, which then point at the wrong entry | "The file's format", Numbering |
+| Adding anything Rules 1 does not allow | The roadmap then holds work nobody decided | Rules 1 |
````

### skills/spec/SKILL.md

````diff
@@ -5 +5 @@ metadata:
-  version: "1.7.0"
+  version: "1.8.0"
@@ -33 +33,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
+   - `/plan` names a new folder by the entry's slug.
+   - An older plan keeps whatever folder it has.
@@ -51 +52,4 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force. A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses. Its decision is its Decision section, or, in a record without one, the text that states what was decided. A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
+   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force.
+     - A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses.
+     - Its decision is its Decision section, or, in a record without one, the text that states what was decided.
+     - A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
@@ -60 +64 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A change the session itself made since the last resume-point commit is one of its own records. Such a change is a ruling it booked, or a report or a reviewer it recorded.
+   - A change the session itself made since the last resume-point commit is one of its own records: a ruling it booked, or a report or a reviewer it recorded.
@@ -64 +68 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path. Steps 2 and 9 write those files.
+   - An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path, since Steps 2 and 9 write those files.
@@ -76 +80,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A step without it is a refusal ("Stops") that names the step and the authority it lacks, and says a ruling is needed.
+   - A step without it is a refusal ("Stops") that names the step and the authority it lacks.
+     - The refusal says a ruling is needed.
@@ -80,0 +86 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
+   - Steps 1 is done when the preflight and the authority check have passed, or a refusal has named its cause and written nothing.
@@ -86,2 +92,5 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - Read the ADRs the step touches, as "What it reads" 5 says. The brief names each under "What is on the tree", with its number, its title and the sentence of its decision the step is under, or says that no ADR touches the step.
-   - A step's text that contradicts the part in force of an ADR is a rule clash, a stop ("Stops"). The open item names the ADR and quotes the step's words that contradict it. Its options are the step changed to follow the ADR, or a new ADR that supersedes it, as the ADR folder's `README.md` says.
+   - Read the ADRs the step touches, as "What it reads" 5 says.
+     - The brief names each under "What is on the tree", with its number, its title and the sentence of its decision the step is under, or says that no ADR touches the step.
+   - A step's text that contradicts the part in force of an ADR is a rule clash, a stop ("Stops").
+     - The open item names the ADR and quotes the step's words that contradict it.
+     - Its options are the step changed to follow the ADR, or a new ADR that supersedes it, as the ADR folder's `README.md` says.
@@ -92 +101,4 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A candidate the user has already ruled on for the capability the step builds, named with that capability by a line of `plan.md`'s Rulings section, is settled: the brief records that ruling under "Libraries checked", and the candidate does not stop `/spec` again. A ruling on the same candidate for another capability settles nothing.
+   - A candidate the user has already ruled on for the capability the step builds, named with that capability by a line of `plan.md`'s Rulings section, is settled.
+     - The brief records that ruling under "Libraries checked".
+     - `/spec` goes on past the candidate without a stop.
+   - A ruling on the same candidate for another capability settles nothing.
@@ -104 +116,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result, and the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a code step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
+   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result.
+     - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a code step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
@@ -119 +132,3 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - The ledger may hold the step's patch `agents/reviews/<step>-backed-out.patch` ("Steps / A step taken back out of main"). The brief then names its path and says Steps 7 applies it with `git apply --3way`.
+   - The ledger may hold the step's patch `agents/reviews/<step>-backed-out.patch` ("Steps / A step taken back out of main").
+     - The brief then names its path.
+     - The brief says Steps 7 applies it with `git apply --3way`.
@@ -124,2 +139,4 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A shared path is a file both briefs name, whatever lines each names. It is not a refusal.
-     - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.
+   - A shared path is a file both briefs name, whatever lines each names.
+     - It is not a refusal.
+     - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says.
+     - Run by hand, the session judges.
@@ -129,2 +146,3 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-     - This run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
-   - `plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made.
+     - This run leaves nothing: the brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
+   - `plan.md` is put back from the copy Steps 1 saved.
+   - No commit, worktree or dispatch entry is made.
@@ -144,0 +163 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
+   - Steps 6 is done when the commit holds those paths and its hash is recorded as the base.
@@ -147 +166,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
+   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`.
+     - The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
@@ -149 +169,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A file named in an `error:` line, such as one main deleted or renamed, makes the whole apply fail. The apply is run again with `--exclude=<path>` for each such file, until the rest applies.
+   - A file named in an `error:` line, such as one main deleted or renamed, makes the whole apply fail.
+     - The apply is run again with `--exclude=<path>` for each such file, until the rest applies.
@@ -154 +175 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-     - It lists the binary files given the patch's copy, which the builder checks against main's change to them. That change is the commits `git log --oneline <old base>..main -- <path>` lists, the old base being the `base` of the removed entry.
+     - It lists the binary files given the patch's copy, which the builder checks against main's change to them, the commits `git log --oneline <old base>..main -- <path>` lists, the old base being the `base` of the removed entry.
@@ -158 +179,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - The configuration block's `bench:` line names them; none named, none staged.
+   - The configuration block's `bench:` line names them.
+   - With none named, none is staged.
@@ -160 +182,3 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives: one entry, `dispatch:` followed by its keys, when `workers_at_once` is 1; appended to the list of entries when it is above 1.
+   - The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives.
+     - With `workers_at_once` 1, one entry, `dispatch:` followed by its keys.
+     - With `workers_at_once` above 1, the entry is appended to the list of entries.
@@ -162 +186,2 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
-   - A step whose brief shares a file with a step in flight, judged simple to merge at Steps 5, gets `shared_paths:` in its entry: each shared file and why the merge is simple. With no shared file the key is left out.
+   - A step whose brief shares a file with a step in flight, judged simple to merge at Steps 5, gets `shared_paths:` in its entry: each shared file and why the merge is simple.
+   - With no shared file the key is left out.
@@ -199 +224 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
-   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.
+   - The open item in the state file, holding the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.
@@ -201 +226,2 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
-     - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling then approves them too.
+     - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list.
+     - The user's ruling on such an option approves each of those approvals too.
@@ -222,0 +249,2 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
+   The item is done when the message holds the ruling.
+
@@ -226 +254,2 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
-   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;
+   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`;
+   - that step gets its own Step 0, its carried premises with it;
@@ -236,5 +265,11 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
-     - the old record is marked superseded in the words the folder uses (`superseded by NNNN` under the template), and the new record gets its row in the folder's index when there is one;
-     - the session shows the user the new record and commits these files by path at once, a resume point, so that `/spec` or `/land` in any session reads them;
-   - a ruling that replaces a bullet ending "(self-rule)" always writes a Rulings bullet of its own that names the bullet it replaces, and is booked as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says;
-   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6).
-3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.
+     - the old record is marked superseded in the words the folder uses (`superseded by NNNN` under the template);
+     - the new record gets its row in the folder's index when there is one;
+     - the session shows the user the new record;
+     - the session commits these files by path at once, a resume point, so that `/spec` or `/land` in any session reads them;
+   - a ruling that replaces a bullet ending "(self-rule)" always writes a Rulings bullet of its own that names the bullet it replaces;
+   - that ruling is booked as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says;
+   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6);
+   - the item is done when the ruling's changes are in the ledger files.
+3. Then `/spec <entry> <step>` is typed again.
+   - It rechecks every premise against the tree, the ruled text included.
+   - It writes the brief.
@@ -256,2 +291,6 @@ Steps 5 says when this runs.
-   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it wrote is used.
-   - A brief-check agent stopped for another model has no dispatch entry to be recorded in, since "Steps / A stop" 2 leaves none, so the session writes its bullet `- <agent id>: brief check of step <n>, <served model>` straight into `plan.md`'s Agents section, creating the section before `## Blocked, and by what` when `plan.md` has none, and reads the section back.
+   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops").
+     - The agent is stopped through the runner's stop tool.
+     - Nothing it wrote is used.
+   - A brief-check agent stopped for another model has no dispatch entry to be recorded in, since "Steps / A stop" 2 leaves none, so the session writes its bullet `- <agent id>: brief check of step <n>, <served model>` straight into `plan.md`'s Agents section.
+     - A `plan.md` with no Agents section gets it, created before `## Blocked, and by what`.
+     - The session reads the section back.
@@ -258,0 +298 @@ Steps 5 says when this runs.
+   - Item 1 is done when the agent's id and served model are read and the model is the configured one, or the stop is raised.
@@ -266 +306,4 @@ Steps 5 says when this runs.
-   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says. Each one the step touches is named with the sentence of its decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
+   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says.
+     - Each one the step touches is named with the sentence of its decision the step is under.
+     - A part of the brief that contradicts one is named.
+     - An ADR the step touches that the brief's "What is on the tree" does not name is named.
@@ -268 +311,2 @@ Steps 5 says when this runs.
-     - What is dictated is text whose words the brief gives for a file, whether quoted, in a fenced block, or given after a colon as the words of a named sentence, line, heading, comment, table row or term. A requirement that says what a sentence must say without giving its words is not dictated, and stays the builder's to word.
+     - What is dictated is text whose words the brief gives for a file, whether quoted, in a fenced block, or given after a colon as the words of a named sentence, line, heading, comment, table row or term.
+     - A requirement that says what a sentence must say without giving its words is not dictated, so the builder words it.
@@ -270 +314,2 @@ Steps 5 says when this runs.
-     - A code line (a key with its comment, a command, a placeholder line) is read whole, and its comment and any words in it are read as prose.
+     - A code line (a key with its comment, a command, a placeholder line) is read whole.
+     - The comment of a code line, and any words in it, are read as prose.
@@ -276,0 +322 @@ Steps 5 says when this runs.
+   - Item 3 is done when the report stands at that path with its usage line filled.
@@ -280 +326,2 @@ Steps 5 says when this runs.
-   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's **Dictated text** says before the preparation commit, and is named under "Closed".
+   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's "Dictated text" says, before the preparation commit.
+   - That line is named under "Closed".
@@ -282 +329,3 @@ Steps 5 says when this runs.
-   - The check runs once per step: the brief as changed goes to the builder without a second run, and a `/spec` run after a stop or a ruling does not check the step again.
+   - The check runs once per step.
+     - The brief as changed goes to the builder without a second run.
+     - A `/spec` run after a stop or a ruling does not check the step again.
@@ -286 +335,2 @@ Steps 5 says when this runs.
-   - A contradiction the **ADRs** check finds in the step's text is the stop "A rule clash with an ADR", as Steps 2 says. One found only in the brief's own wording is closed by a change to the brief that follows the ADR.
+   - A contradiction the "ADRs" check finds in the step's text is the stop "A rule clash with an ADR", as Steps 2 says.
+   - A contradiction found only in the brief's own wording is closed by a change to the brief that follows the ADR.
@@ -291,0 +342 @@ Steps 5 says when this runs.
+   - Item 5 is done when the dispatch entry holds that form.
@@ -300 +351 @@ The first six rows are stops, which leave an open item as "Steps / A stop" says.
-| A rule clash with an ADR | The step's text contradicts the part in force of an ADR the step touches (Steps 2, or the **ADRs** check of "Steps / The brief check") | The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it | A ruling |
+| A rule clash with an ADR | The step's text contradicts the part in force of an ADR the step touches (Steps 2, or the "ADRs" check of "Steps / The brief check") | The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it | A ruling |
````

