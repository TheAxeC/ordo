# Step 13 report: repo-setup restyled

Everything in the brief is done.

Open items of the state file: none.

| # | Check | Result | Output |
|---|---|---|---|
| 1 | `python3 utils/check_skill_layout.py skills/repo-setup` | DONE | `ok: skills/repo-setup/SKILL.md` |
| 2 | From the worktree, since the check resolves the new file against the inventory's own repository: `mkdir -p .scratch/tmpcheck && cp /Users/axelfaes/workspace/ordo/.scratch/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/tmpcheck/ && python3 utils/check_rule_inventory.py .scratch/tmpcheck/repo-setup.md; rm -rf .scratch/tmpcheck` | DONE | `ok: .scratch/tmpcheck/repo-setup.md` |
| 3 | the verify list | DONE | `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_skill_layout.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`; the ASCII check prints nothing, exit 0 |

Files, as they land: `skills/repo-setup/SKILL.md`, 92 lines before, 145 after (`git diff --stat 276b9ea`: `1 file changed, 95 insertions(+), 42 deletions(-)`); the inventory, 78 lines, 71 body rows.

Sections before: the invocation block; What it asks; The tree; Order of work; sync; Rules. After: Quick start; Use instead (two); What it reads (four); Steps (thirteen, one action each: git init, ask, draft, show, write, symlink, install the project skills, list them, /ordo-init, fill the Build section and command block, run the checks, show their output, commit), with `### sync` (eight); The questions (eight, numbers kept, since The tree cites questions 3 and 6); The tree (unchanged block); Stops (six stops, one refusal); Anti-patterns (four); Rules (seven).

The grep for the removed section names and the cited question numbers over skills, utils, docs and README.md, and its output (nothing):

```
$ grep -rn -E "What it asks|Order of work|question [36]" skills utils docs README.md | grep -v '^skills/repo-setup/'

```

What a user reads differently, before and after:

- The flow: before, seven numbered items, several with two or three actions each; after, thirteen steps with one action each, and the check commands tagged `sh`.
- The title paragraph: before, the paragraph after the invocation block said where everything comes from and that the tree is shown before writing; after, a paragraph says what the skill does and leaves behind (the approved tree in one commit, or the synced block), and the sources and the no-write rule are Rules bullets.
- What it reads: before, no such section; the sources were named in the opening paragraph and the steps. After, four items: the templates, the answers, the ordo-init skill (with `check_config.py`) and the roadmap template, and for sync the repository's `CLAUDE.md` and `AGENTS.md`.
- Anti-patterns: before, none; after, four rows (a build file nobody named, a coding rule nobody stated, the plan skills per project, a `<...>` placeholder written), each Why it fails cell new text, each Do instead cell naming the rule or step.
- The commit stop: before, "the skill stops with the files changed and the command that shows them (`git status --short`)"; after, the same as a Stops row, resumed by "The user's commit".
- The refusal's resume: before, not stated; after, "One of those, or a folder with no tracked file", the condition Quick start states.
- The questions: before, a numbered list the skill asked from; after, the same list, and asking it is a stop that waits on the answers.
- sync: before, a paragraph and three exit-status bullets; after, eight numbered steps under Steps, each exit status its own step, the exit-2 draft's four parts as sub-bullets.
- Stops: new as a table. The draft, the per-hunk ruling, the drafted exit-2 change, an `AGENTS.md` difference and the commit rule are stops; a folder with tracked files is the one refusal, as before naming `/repo-setup sync` and `/ordo-init`.
- Rules: three rules that sat inside the questions (build files only for what the user names, no invented coding rule, the plan skills per user) and two from the opening paragraph and Order of work (the sources; after git init, nothing written before approval) are now Rules bullets.
- sync steps 5 to 7 carry "Exit 2:", as the old exit-2 bullet held them; step 8 follows exit 1 or exit 2, as the old closing paragraph did.
- Use instead: new, naming `/ordo-init` for an existing repository and `/roadmap add` for an entry.

Judgment calls:

- The question numbers are kept as a reference section's numbered list, because the tree block cites question 3 and question 6.
- The Anti-patterns' Do instead cells name the rule or step they would otherwise restate, per the plan's ruling.

## Repair round 1

Every finding of `13-refuter.md` is closed; none is booked. After the round: `ok: skills/repo-setup/SKILL.md`, the inventory check `ok: .scratch/tmpcheck/repo-setup.md` (command as in row 2), and the seven `PASS:` lines with a clean ASCII check.

| Finding | Closure |
|---|---|
| Spec 1 | Stops row "The questions" added, Steps 2 marked ("Stops"), the bullet says "The first six rows are stops" |
| Spec 2 | Rules: "After Steps 1, nothing is written until the user approves or corrects the draft." |
| Spec 3, Spec 10 | Steps 13: "Commit the setup in one commit, by explicit path list, ..."; the inventory rows for old line 70 point at Steps 13 |
| Spec 4, Behaviour 1 | sync steps 5 to 7 open with "Exit 2:"; step 8 opens with "After exit 1 or exit 2:" |
| Spec 5 | Rules: "The skill never invents a coding rule."; the Anti-patterns cell names it |
| Spec 6 | Steps 11 runs the checks and Steps 12 shows their output; sync step 1 runs the check and says steps 2 to 8 follow its exit status; the inventory row for old line 60 split in two |
| Spec 7, Behaviour 3 | The refusal's resume cell: "One of those, or a folder with no tracked file" |
| Spec 8 | The row for old line 84 split: the replacement to Steps / sync 4, the ruling on a difference to Stops 5 |
| Spec 9 | The rows for old lines 3 and 15 split: showing to Steps 4, writing nothing before it to Rules |
| Spec 11 | What it reads 3 names `check_config.py`; item 4 adds the rules of `CLAUDE.md` for the exit-2 draft |
| Proof 1 | The figure quotes `git diff --stat 276b9ea` with its output line |
| Proof 2 | Row 2 quotes the copy, the check and the removal as run |
| Standards 1, Behaviour 2 | The before-and-after list names the title paragraph, What it reads, Anti-patterns, the commit stop, the refusal's resume, the questions stop and the sync exit conditions; the no-write rule's before and after is in the Rules line |

