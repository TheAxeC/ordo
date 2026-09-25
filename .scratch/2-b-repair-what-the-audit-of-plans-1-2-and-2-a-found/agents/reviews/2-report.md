# Report: step 2, skill texts part 1

Everything in the brief is done. Three sentences outside this step's paths that the change makes stale or leaves contradicting it are given under "Doc text" for the orchestrator to apply or carry into step 3. A defect in the ASCII check of the verify list, found while running it, is under "Found outside the brief".

## Open items of the state file, verbatim

- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## DONE / NOT DONE

All greps run from the worktree root on the edited tree; `P=skills/plan-orchestration/SKILL.md`.

| # | Item | State | Check and output |
|---|---|---|---|
| 1 | The loop and a stop | DONE | `grep -n 'The loop ends only at a pause\|blocks its own step\|until a pause' $P`, output below (1) |
| 2 | The builder and the ledger | DONE | `grep -n 'in the ledger it writes only its report\|save it into the main ledger\|copies it from there\|beyond the builder' $P`, output below (2) |
| 3 | One meaning for `report`, launch output under `output` | DONE | `grep -n` for `output`, output below (3) |
| 4 | `reviewer_report` in Steps 7 | DONE | `grep -n 'reviewer_report' $P`, output below (4) |
| 5 | The round cap as a rule of its own; "Not sent back" by text | DONE | `grep -n 'The round cap\|round cap allows\|Not sent back' $P`, output below (5) |
| 6 | Models | DONE | `grep -n 'Claude Opus\|GPT Sol\|Fable\|no project name' $P`, output below (6) |
| 7 | `inline` optional, `agent` the default | DONE | `grep -n` for the Choice and `inline` bullets, output below (7) |
| 8 | Skills invoked, never followed from memory | DONE | `grep -n 'invoked through the runner' $P`, output below (8) |
| 9 | Stops: two rows, plain-text stop message | DONE | `grep -n` for the rows and the message, output below (9) |
| 10 | A rule that keeps being broken | DONE | `grep -n 'sharper sentence\|when a command can check it' $P`, output below (10) |
| 11 | Anti-patterns row 3 and the new row | DONE | `grep -n` for both rows, output below (11) |
| 12 | Reports open with a position line | DONE | `grep -n 'position line' $P`, output below (12) |
| 13 | Launching a builder: absolute paths, `--label <entry>/<step>`, transcript folder after `--cwd` | DONE | `grep -n 'is absolute\|<entry>/<step>\|named after the builder' $P`, output below (13) |
| 14 | `launch-note.md`: label, pid, a later `start` field | DONE | `grep -n` on `launch-note.md`, output below (14) |
| 15 | `plan` Rules 1 and 2 | DONE | `grep -n 'one dispatch of its executor\|which are absolute' skills/plan/SKILL.md`, output below (15) |
| 16 | `.gitkeep` in Steps 5, committed in Steps 6 | DONE | `grep -n 'gitkeep' skills/plan/SKILL.md`, output below (16) |
| 17 | State template: open and closed items, `output`, `worker:` | DONE | `grep -n` on the template, output below (17) |
| 18 | Inventories repointed, checked by reading | DONE | `python3 utils/check_rule_inventory.py ...` prints ten `ok:` lines (below); every changed row beside the text at its place under "Inventory rows beside their places" |
| V1 | Verify runner | DONE | `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, output below, exit 0 |
| V2 | Layout check | DONE | `python3 utils/check_skill_layout.py` ten `ok:` lines, exit 0 (below) |
| V3 | `land.test.sh` | DONE | `sh skills/land/templates/land.test.sh 2>&1 \| tail -1` printed `PASS: land.sh and usage.py scratch tests` |
| V4 | ASCII and dash asides in the changed files | DONE | `LC_ALL=C grep -n '[^ -~]'` over the six files: no output, exit 1; `git diff -U0 \| grep '^+[^+]' \| grep -n '[^ ] - \| -- \|->'`: no output, exit 1 |

### Grep output per item

```text
(1)
15:/plan-orchestration <entry>          run the plan's steps unattended until a pause, or until nothing unblocked is left
47:   - A stop it raises goes to the user by "Stops". A stop, here or at any later step, blocks its own step, and the loop moves on to the next unblocked step.
77:    - The loop ends only at a pause or when nothing unblocked is left, and step 3 says what a stop does to the loop.
(2)
51:   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards); every requirement the step is judged on; the report path and shape.
52:   - **The builder.** It never runs a git command, and in the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.
58:6. On the report, save it into the main ledger at the dispatch block's `report` path, then read the whole diff.
59:   - The builder writes its report in the worktree's copy of the ledger, and the orchestrator copies it from there.
(3)
60:   - A shell builder's `output` file (the `claude -p` JSON or the `codex -o` final message) holds its final message, and when the builder wrote no report file the orchestrator takes the report from it into the `report` path.
68:   - **The resume's options.** It keeps the launch's `--cwd`, `--model`, `--effort`, `--network`, `--note`, `--label` and `--parent`. Its prompt (the findings), output, stderr, events, exit, pid and id files are the round's own.
69:   - **Before the resume.** Write `round: n` and the round's paths into the dispatch block, each under its field with the `repair_` prefix (`repair_prompt`, `repair_output` and so on), and commit.
150:    --prompt <prompt file> --report <output file> --stderr <stderr file> --exit <exit file> --pid <pid file> \
158:    --prompt <prompt file> --report <output file> --stderr <stderr file> --exit <exit file> --pid <pid file> \
167:   - Every path the launch takes goes into the dispatch block under its field: `prompt`, `output` (the `--report` path), `stderr`, `events`, `exit`, `pid` and `note_id_file`, with the `repair_` prefix for a repair round.
(4)
65:   - Save its report, and write its path and its usage into the dispatch block under `reviewer_report`.
(5)
70:   - **Not sent back.** A finding that changes the scope, a requirement, a public shape or an established decision is raised as a stop, by "Stops".
72:   - **The end of the rounds.** A refutation that finds nothing, or the last round the round cap allows ("Rules"), ends the rounds, and the loop goes to step 9.
262:- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, are fixed at landing, and everything else the rounds left undone or that lies beyond the brief is booked as its own step in the plan, carried in the state file's booked list and never sent back to the builder.
(6)
83:- **Default.** The orchestrator and every agent run on Claude Opus.
84:- **Orchestrator.** It may also run on Claude Fable, GPT Astra or GPT Sol. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
85:- **Agents.** A builder or a reviewer may also run on GPT Sol, and never runs on Claude Fable or GPT Astra.
260:- The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger, and the models it names are the options the user ruled in "The two tiers, and the harnesses".
(7)
49:   - **Choice.** `academic-paper` for a step whose deliverable is manuscript content, always; otherwise what the invocation named (`/plan-orchestration <entry> inline` runs every code step inline); else the configuration block's `executor:`, which is `agent` by default and `inline` when the plan chose it.
53:   - **`inline`.** The orchestrating session builds the step itself in the worktree under the brief and the rules file, and steps 5 and 8 read "the builder" as itself.
(8)
112:- After a compaction the next skill is invoked through the runner, as "Rules" says, and the compaction's summary of a skill's text never stands in for the skill.
263:- `/spec`, `/refute` and `/land` are invoked through the runner every time, after a compaction too, and are never carried out from remembered text.
(9)
225:A stop is for a decision that is the user's, of one of six kinds:
233:| A finding that is the user's | A finding that changes the scope, a requirement, a public shape or an established decision | The stop message, below | The user's ruling |
234:| The roadmap diff | The closing step's `/roadmap done`, which shows its diff of the roadmap | The diff, in the stop message | The user's approval of the diff |
239:- The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons. It never goes through a question-box or multiple-choice tool.
(10)
127:- For a rule already written that keeps being broken, what is proposed is a check, and a sharper sentence for the rule is proposed only when no command can check it.
251:| Rewriting a rule that keeps being broken when a command can check it | The same words fail the same way | Propose a check for it, which the user rules on, as "The recurring-findings pass" says |
(11)
248:| Handing a miss inside a brief back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or book it as its own step in the booked list |
256:| Offering the user another repair round beyond the cap | The cap is a rule the user's yes does not extend, and the extra round only moves work that belongs in a new step | Land the step with its small fixes and book the rest as steps, as the round cap in "Rules" says |
(12)
198:- Every report opens with a position line: the roadmap entry with its title, the plan step being worked as "step n of m" with its name, and the next step. For example: "Roadmap entry 2.B (repair what the audit found). Plan step 3 of 19: pin.sh. Next: step 4, collect_findings.py."
199:- The state file's open items follow the position line, verbatim.
(13)
151:    [--resume <session id>] [--note <launch_note> --id <id file> --label <entry>/<step> --parent <session id>]
160:    [--note <launch_note> --id <id file> --label <entry>/<step> --parent <session id>]
166:   - Every path given to `templates/launch.sh` is absolute, so it names the same file from the orchestrator's shell, from the builder's `--cwd` and from a later resumption.
169:   - With the configuration block's `launch_note` set, pass the note options: `--id` names the file that receives the note's id, `--label` is `<entry>/<step>` (for example `2.B/4`), and `--parent` is the orchestrating session's id.
176:   - Under the runner's projects folder, in the folder named after the builder's `--cwd`, a `claude -p` builder writes its transcript as `<session id>.jsonl` from the moment it starts. A resumed run writes to the same file.
(14) grep -n 'entry>/<step>\|--pid` is\|stays alive until\|A field added to' skills/plan-orchestration/templates/launch-note.md
11:`<launch_note> start --launcher plan-orchestration --label <entry>/<step> --harness <claude|codex> --model <model> --parent <session id> --cwd <dir> --pid <pid>`
14:- `--label` is `<entry>/<step>`, for example `2.B/4`, `--parent` the orchestrating session's id, and `--cwd` the builder's working directory.
15:- `--pid` is the pid of the process that owns the builder, the one the launch writes to the step's pid file, and that process stays alive until `end`.
16:- A field added to `start` later is optional, and this page names it before `launch.sh` sends it, since a note command may refuse a flag it does not know.
(15)
79:- A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
80:- Every path in the ledger is relative to the repository root, except a path given to the plan-orchestration skill's `templates/launch.sh` and the `launch_note` command, which are absolute.
(16)
10:`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.
57:5. Create `agents/briefs/` and `agents/reviews/`, each with an empty `.gitkeep`, since git does not keep an empty folder.
58:6. Commit `plan.md`, `orchestrator-state.md` and the two `.gitkeep` files by path as the plan's opening commit, with the roadmap entry's number in the subject.
(17) grep -n 'booked here the moment\|<date>: <what was raised>\|output (a shell\|worker: <harness:model>\|^## Open items\|^## Closed items' skills/plan/templates/orchestrator-state.md
13:worker: <harness:model>      # the default worker is claude:opus, and codex:gpt-5.6-sol is the other option; a builder never runs on Fable or Astra.
27:dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), landing, round. The orchestrator adds prompt, output (a shell launch's --report file: the claude -p JSON or the codex -o final message), events, stderr, exit, pid, note_id_file and session_id at the launch, reviewer_report at the review, and the repair_ entries while a fix round is in flight.
30:## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of every report until ruled)
34:- <a stop awaiting the user's ruling, or a proposal of the recurring-findings pass, with its options and one recommendation; or "none">. An item is booked here the moment it is raised; it leaves only when the user has ruled, and then goes to the closed list.
38:## Closed items (the log of what was raised and how it ended; no report carries it)
40:- <date>: <what was raised>: <how it ended>.
```

### Verify runner, layout check and inventory check

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"`:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
exit 0
```

`python3 utils/check_skill_layout.py; echo "exit $?"` printed the same ten `ok:` lines as the runner above and `exit 0`.

`python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo "exit $?"`:

```text
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Inventory rows beside their places

Printed by a scratch script under `$TMPDIR` that resolves each row's "New place" with the checker's own `resolve_place` and item counting (top-level list items and table body rows of the section) and prints the line found there. Each pair below was read. `inv:<n>` is the row's line in the inventory; `new:<n>` the line in the skill. A row whose place is a whole section prints no text line. Every row of both inventories was printed and read the same way; the rows below are the ones this step changed.

`plan-orchestration.md` (33 rows changed, counted from `git diff -U0` of the file: 27 point at a new place, some of them also annotated where the rule changed; 6 keep their place and are annotated where the rule itself was changed by a ruling or by this step's fix):

```text
inv:12: The same skill runs a code tool, a research project or a manuscript on either harness, with either as the worker  =>  [The two tiers, and the harnesses 9]
   new:90: - The same skill runs a code tool, a research project or a manuscript, on either harness, with either as the worker.
inv:20: It carries no project name and no vendor name; those are in .agents/plan.yaml and the ledger; the vendor part replaced by the models ruling of plan 2.B: the models it names are the options the user ruled  =>  [Rules 1]
   new:260: - The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger, and the models it names are the options the user ruled in "The two tiers, and the harnesses".
inv:21: Two tiers of model take part, neither tied to one vendor; the tiers are now the orchestrator and the agents it starts, by the models ruling of plan 2.B  =>  [The two tiers, and the harnesses 1]
   new:82: - Two tiers take part: the orchestrator, and the agents it starts (the builders and the reviewers).
inv:22: The orchestrator runs on a top-tier model (Claude Fable or GPT Astra): reads, decides, invokes, lands, books; by the models ruling of plan 2.B it runs on Claude Opus by default (item 2), with Fable, Astra or Sol as options  =>  [The two tiers, and the harnesses 3]
   new:84: - **Orchestrator.** It may also run on Claude Fable, GPT Astra or GPT Sol. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
inv:23: The orchestrator never writes step code beyond a fix at landing, unless executor is inline  =>  [The two tiers, and the harnesses 3]
   new:84: - **Orchestrator.** It may also run on Claude Fable, GPT Astra or GPT Sol. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
inv:24: The builder runs on the working tier (Claude Opus or GPT Sol), one per step, in the worktree, under the brief and the rules file; its models, Opus by default or Sol and never Fable or Astra, are at items 2 and 4 by the models ruling of plan 2.B  =>  [The two tiers, and the harnesses 5]
   new:86: - **Builder.** One per step, in the step's worktree, under the brief and the rules file, on the model the configuration block's `worker:` names.
inv:25: The reviewer is whatever reviewer: names  =>  [The two tiers, and the harnesses 6]
   new:87: - **Reviewer.** The model the configuration block's `reviewer:` names.
inv:26: Any combination, chosen per step; a new one booked in the rulings with what decides it and measured by its usage row; any allowed combination, by the models ruling of plan 2.B  =>  [The two tiers, and the harnesses 8]
   new:89: - Any allowed combination is chosen per step; a new combination is booked in the rulings with what decides it, and measured by its usage row.
inv:47: The builder never runs git and never writes into the ledger; corrected in plan 2.B: in the ledger it writes only its report, in the worktree's copy  =>  [Steps 4]
   new:48: 4. Choose the step's executor and write it into the dispatch block, then build by that choice.
inv:53: Save the report where the builder could not; corrected in plan 2.B: the orchestrator saves every report into the main ledger  =>  [Steps 6]
   new:58: 6. On the report, save it into the main ledger at the dispatch block's `report` path, then read the whole diff.
inv:63: repair_rounds caps the rounds  =>  [Rules 3]
   new:262: - The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, ar
inv:66: Small things are fixed at landing, the last run's findings included  =>  [Rules 3]
   new:262: - The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, ar
inv:67: The rest is booked as its own step, never sent back  =>  [Rules 3]
   new:262: - The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, ar
inv:68: The one exception: one round beyond the cap for a red verification command or an unbuilt acceptance item too large for landing  =>  [Rules 3]
   new:262: - The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, ar
inv:69: A new finding never earns that round  =>  [Rules 3]
   new:262: - The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large to make at landing. A new finding of a review never earns that round, and the user's yes never extends the cap. After its last round a step lands: the small findings, the last review's included, ar
inv:73: The loop ends at a stop, a pause or nothing unblocked; corrected in plan 2.B to a pause or nothing unblocked, a stop blocking only its own step (Steps 3)  =>  [Steps 10]
   new:75: 10. Continue with step 2.
inv:100: -C is the working root and -s workspace-write confines writes  =>  [Launching a builder 8]
   new:180: - A first Codex run is `codex exec -C <cwd> -s workspace-write`: `-C` is the working root and `-s workspace-write` confines writes to it.
inv:101: The network setting is passed when the verification commands bind a port  =>  [Launching a builder 10]
   new:182: - `--network` is passed whenever the verification commands bind a port.
inv:102: -o writes the final message; --json streams the event log with the usage  =>  [Launching a builder 11]
   new:183: - `-o` writes the final message, and `--json` streams the event log whose last `turn.completed` event carries the usage.
inv:103: Not --ephemeral, so the rollout is the builder's transcript  =>  [Launching a builder 12]
   new:184: - The session is not run with `--ephemeral`, so the rollout under `~/.codex/sessions/` is the builder's transcript.
inv:104: The shell tool caps a command at ten minutes, so the launch is detached and a monitor watches the exit file  =>  [Launching a builder 13]
   new:185: - A runner's shell tool caps a command at ten minutes and a step takes longer, so `templates/launch.sh` detaches the builder and a monitor watches the exit file.
inv:105: Codex settings in the repository's .codex/; the orchestrator never edits a user-level file  =>  [Launching a builder 15]
   new:187: - Codex project settings live in `<repo>/.codex/config.toml` and its command rules in `<repo>/.codex/rules/`; the orchestrator never edits a user-level file.
inv:111: A stop is for a decision that is the user's: an unnamed shape, a wrong premise, a red check, a rule clash; plan 2.B adds a finding that is the user's and the roadmap diff  =>  [Stops]
   new: section ('Stops', None)
inv:112: Fixing a defect in what was asked is never a stop, whatever it makes visible  =>  [Stops 7]
   new:236: - Fixing a defect in what the user asked for is never a stop, whatever the fix makes visible.
inv:115: A stop is booked in the open items at once  =>  [Stops 8]
   new:237: - A stop is booked in the state file's open items the moment it is raised.
inv:116: A stop is repeated in every report until ruled  =>  [Stops 9]
   new:238: - A stop is repeated in every report until the user has ruled.
inv:118: A pause holds until the user lifts it  =>  [Stops 11]
   new:240: - A pause the user asks for holds until they lift it.
inv:119: A stop goes in one message with options inside the rules and one recommendation  =>  [Stops 10]
   new:239: - The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons. It never goes through a question-box or multiple-choice tool.
inv:121: Every report opens with the open items, which now follow the position line (plan 2.B)  =>  [Reports 2]
   new:199: - The state file's open items follow the position line, verbatim.
inv:122: The open items hold only stops and recurring-findings proposals  =>  [Reports 3]
   new:200: - The open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass.
inv:123: A finding that needs no ruling is a step in the booked list; a report names its count and steps  =>  [Reports 4]
   new:201: - A finding that needs no ruling is not an open item; it is a step in the plan, carried in the state file's booked list, and a report names that list's count and the steps on it rather than its lines.
inv:124: The closed list is a log that no report carries  =>  [Reports 5]
   new:202: - A third list, the closed one, is the log of what was raised and how it ended, and no report carries it.
inv:125: NOT DONE first, then the DONE / NOT DONE ledger naming the command per row  =>  [Reports 6]
   new:203: - Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row.
```

`plan.md` (no row's place moved; three rows annotated where the rule changed at the same place):

```text
inv:40: agents/briefs/ and agents/reviews/, empty; corrected in plan 2.B: each holds an empty .gitkeep, committed in Steps 6  =>  [Steps 5]
   new:57: 5. Create `agents/briefs/` and `agents/reviews/`, each with an empty `.gitkeep`, since git does not keep an empty folder.
inv:42: A step is one deliverable and one agent dispatch, with the command that proves it; corrected in plan 2.B: one dispatch of its executor, the orchestrator's bookkeeping steps excepted  =>  [Rules 1]
   new:79: - A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
inv:44: Every path in the ledger is relative to the repository root; corrected in plan 2.B: a path given to launch.sh and launch_note are absolute  =>  [Rules 2]
   new:80: - Every path in the ledger is relative to the repository root, except a path given to the plan-orchestration skill's `templates/launch.sh` and the `launch_note` command, which are absolute.
```

The six rows of "Launching a builder" the audit named (inventory lines 100 to 105) now point at items 8, 10, 11, 12, 13 and 15; the new text in that section (items 1 and 3 of the numbered list) is nested under items 4 and 6 and moved no top-level item.

## Files

`wc -l` on the edited tree:

| File | Lines | Diff (`git diff --stat`) |
|---|---|---|
| `skills/plan-orchestration/SKILL.md` | 263 | 87 lines changed |
| `skills/plan-orchestration/templates/launch-note.md` | 28 | 6 |
| `skills/plan/SKILL.md` | 82 | 10 |
| `skills/plan/templates/orchestrator-state.md` | 69 | 12 |
| `.scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md` | 139 | 66 |
| `.scratch/archive/1-one-layout-for-every-skill/inventories/plan.md` | 48 | 6 |

`git status --short` shows these six files modified and nothing else, before this report was written.

## Judgment calls the brief left open

1. **Where "a stop blocks its step" is written.** Once, in Steps 3's bullet, worded to cover a stop raised at any later step; Steps 10 names step 3. The Quick start line that said the loop runs "until a stop" was the same contradiction and now reads "until a pause, or until nothing unblocked is left".
2. **The round cap in Rules.** One bullet holds the cap, the exception, "a new finding never earns that round", "the user's yes never extends the cap" and what happens after the last round. Steps 8's former bullets "The cap", "Small things", "The rest", "The one exception" and "Never the exception" are replaced by it, and "The end of the rounds" names it. The state template's `repair_rounds:` comment now points at "the round cap in plan-orchestration's Rules".
3. **`output` placeholders.** The launch command blocks keep the script's flag `--report` (the script is step 4's) and name its value `<output file>`. The `repair_` example in Steps 8 is `repair_output`.
4. **The prompt bullet of Steps 4** said the builder never touches "the ledger"; it now says "the ledger beyond the builder's report", to agree with item 2.
5. **Steps 10's final message** now "opens as "Reports" says" instead of listing the open items itself, so the position line and the open items are written once, in Reports.
6. **Models section.** Labels Default, Orchestrator, Agents, Builder, Reviewer, Harnesses; the rule "a builder or a reviewer never runs on Fable or Astra" is written once, under Agents. The heading "The two tiers, and the harnesses" is kept, since other text names it; its first bullet now defines the two tiers as the orchestrator and the agents it starts.
7. **Stop message.** The bullet keeps "options inside the written rules" and adds the pros and cons and the no-question-box rule in the same bullet. The new rows are labelled "A finding that is the user's" and "The roadmap diff".
8. **Open-items placeholder in the state template.** The moved sentence said an item "leaves only when it is done or the user has ruled" and the placeholder offered "a fix owed". Both contradict the paragraph above it ("Nothing here needs a command or a fix"). The placeholder now names a stop or a recurring-findings proposal, and an item leaves when the user has ruled and goes to the closed list. The Open items heading now says "repeated verbatim after the position line of every report".
9. **Inventory annotations.** Where a row's rule was changed at its place by a ruling or by this step (the models, the builder and the ledger, the saved report, the loop's end, the stop kinds, the first Reports row, and plan's three rows), the Rule cell keeps the old rule and adds what it became, in the form row 16 already uses ("(ruling in plan.md)").
10. **No version bump.** `metadata.version` of both skills is unchanged (2.7.0 and 1.7.0); the brief names no version, and step 19 tags the release.

## User-visible changes, before and after

| Place | Before | After |
|---|---|---|
| Quick start, first line | "until a stop, a pause, or nothing unblocked is left" | "until a pause, or until nothing unblocked is left" |
| Steps 10 | the loop ends "at a stop, at a pause, or when nothing unblocked is left" | ends at a pause or when nothing unblocked is left; step 3: a stop blocks its own step and the loop moves on |
| Steps 4 / 6 | builder "never writes into the ledger"; report saved "where the builder could not" | builder writes only its report in the worktree's copy; the orchestrator saves it into the main ledger |
| Dispatch block | `report` held both the builder's report and the launch's `--report` file | `report` is the builder's report; the launch's file is `output` (`repair_output` in a round) |
| Steps 7 | "Save its report and record its usage" | path and usage under `reviewer_report` |
| Round cap | a bullet in Steps 8, exception two bullets later | one rule in Rules; new Anti-patterns row against offering another round |
| Models | orchestrator Fable or Astra, builder Opus or Sol, "any combination" | Opus default for all; orchestrator also Fable, Astra or Sol; agents also Sol, never Fable or Astra |
| Stops | four kinds, "one message to the user" | six kinds; plain text open item with options, pros and cons, one recommendation; no question-box tool |
| Reports | open with the open items | open with the position line, then the open items |
| Launch | paths unspecified, `--label <step>`, transcript folder "named after the worktree's directory" | paths absolute, `--label <entry>/<step>`, folder named after the builder's `--cwd` |
| `launch-note.md` | `--label` the plan step; `--pid` the detached process | `--label <entry>/<step>`; `--pid` the process that owns the builder, alive until `end`; a later `start` field optional and named on the page first |
| `plan` Rules | "one agent dispatch"; every ledger path relative | one dispatch of its executor, bookkeeping steps excepted; launch paths and `launch_note` absolute |
| `plan` Steps 5 / 6 | empty folders; "both files" committed | a `.gitkeep` in each, committed with the two files |
| State template | open-item text under Closed items; `worker:` "or another working-tier model" | placeholder under Open items; closed placeholder `- <date>: <what was raised>: <how it ended>.`; `worker:` claude:opus default, codex:gpt-5.6-sol the other option, never Fable or Astra |

## Doc text: sentences outside this step's paths

Found by `grep -rn "one agent dispatch\|open items first\|Every path is relative\|--label <step>" skills utils docs README.md` on the edited tree. Each is a sentence this step's change makes false or leaves contradicting it; none is in this step's path list.

1. `skills/plan/templates/plan.md:3` (the plan skill, not in the path list): `One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked).` Replacement for that sentence: `One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked).`
2. `skills/plan/templates/plan.yaml:2`: `# Every path is relative to the repository root. A required key ...` and `skills/plan/templates/plan.projects.yaml:3`: `# Every path is relative to the repository root.` Both contradict `plan.yaml` line 23 (`launch_note` is an absolute path) and the new plan Rules 2. Replacement for the first sentence of each: `# Every path is relative to the repository root, except launch_note, which is absolute.` `skills/ordo-init/SKILL.md:109` ("Every path is relative to the repository root.") is the same sentence in step 3's `ordo-init`, whose path exception is already in step 3's list.
3. `skills/land/SKILL.md:70` (step 3): `- It holds the open items first, verbatim, ...`. Under this step's Reports rule the landing report opens with the position line, then the open items. The same holds for the report shape in the `spec` skill's `templates/brief.md` line 40 (step 3), which opens the builder's report with the NOT DONE line and then the open items.
4. `skills/plan-orchestration/templates/launch.sh:20-21` usage text says `--label <step>`; step 4 owns the script and its label form.

## Found outside the brief

- The ASCII check in the verify list (`docs/dev/change-standard.md`, and the state file's last `verify` entry) exits 0 when `perl -CSD` dies on a file that is not valid UTF-8: the `END` block runs with `$bad` unset and `exit(0)` replaces the die status, so `verify.sh` counts the command as passed. Reproduced in a scratch repository under `$TMPDIR` holding one file with the bytes `\xf3\r\r\n`: the command printed `Malformed UTF-8 character (fatal) at -e line 1, <> line 1.` and `echo $?` printed `exit 0`. On the worktree it was reached through a `utils/__pycache__/` folder that the scratch lookup script created by importing `utils/check_rule_inventory.py`; that folder is removed, `git status --short` shows only the six files above, and the ASCII check over the tree then printed nothing and exited 0. The check and `utils/` belong to other steps; this is a defect for the orchestrator to book.
- `utils/__pycache__/` is not in `.gitignore`, so any import of a `utils/` module leaves an untracked folder that `git ls-files -co --exclude-standard` lists.

## Wrong or impossible in the brief

Nothing. Every line number in "What is on the tree" matched the file at base 17cf7ca (`cat -n` of each file before editing).
