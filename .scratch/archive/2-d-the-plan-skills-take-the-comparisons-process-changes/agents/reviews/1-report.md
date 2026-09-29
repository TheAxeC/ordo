# Report: step 1, the writing rules for skill text

Everything in the brief is done, with the rulings of repair round 1 applied; the meaning of "one phrase for each case" is open item A, the user's, and was not sent to this round.

## Open items of the state file, verbatim

From the main checkout's `orchestrator-state.md`, section "Open items":

- A (2026-09-29, step 1): what "one trigger per case" means in `docs/dev/skill-layout.md`, Frontmatter. The ruling says "a description is a trigger (front-load the leading word, one trigger per case)". Step 1 wrote "`Triggers on:` lists one phrase for each case the skill is for.", and `/spec`'s description keeps four phrases for its one case (`spec <entry> <step>, brief <step>, prepare step <n>, write the brief`). Options: (a) each case the skill is for has at least one trigger phrase, and several phrasings of one case are allowed; the page sentence says so; pro: every case is covered and a request worded differently still matches; con: longer lists, and the line between a case and a phrasing is judged by reading. (b) exactly one phrase per case; `/spec` keeps one of its four and the other skills are brought in line by roadmap entry 23; pro: short lists; con: a request worded as "write the brief" or "prepare step 3" no longer matches its phrase. Recommendation: (a), since the purpose of the trigger list is that each case is found, and the other phrasings are how a request worded differently is found. (a) is also the cheaper option, since no description changes; it is recommended for the matching, not the cost.

## First run, on the unchanged tree

The gate's length command at base 8bb98e8, before any change:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
386 skills/plan/SKILL.md
775 skills/refute/SKILL.md
626 skills/repo-setup/SKILL.md
630 skills/roadmap/SKILL.md
1031 skills/spec/SKILL.md
```

1031 for spec, above 1,024, as the brief's case expects.

## The new text of `docs/dev/skill-layout.md`

Introduction, line 3, one sentence added after the first:

> Every `skills/<name>/SKILL.md` follows this layout, so a reader finds the same thing in the same place in every skill. The section "Writing for an agent" binds a skill's text as that section's last bullet says. The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`.

Frontmatter, four bullets added after the existing `description` bullet:

- `description` is at most 1,024 characters, counted as the length of its YAML value once parsed: `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'` prints each skill's count.
- The first words of `description` name what the skill does, in the phrase a reader or a model matches a request on.
- `Triggers on:` lists one phrase for each case the skill is for.
- A phrase for a case a neighbouring skill is for goes in that skill's `Triggers on:`, not in this one.

"Sections, in order", row 6, line 33:

> | 6 | Reference sections | no | Any number of `## <label>` sections for material the steps point at that every run reads (a script, a file format, a launch command); material only some runs need goes in `references/`, as "Writing for an agent" says. Each heading is a noun-phrase label. |

New section, after "Lists and tables":

```markdown
## Writing for an agent

- A rule states the behaviour wanted: a rule written as a prohibition names the behaviour to do instead, in the same bullet or in the Do instead cell of its Anti-patterns row, since a bare prohibition draws attention to what it forbids.
- One meaning has one place, as "Where a rule goes" says for a rule.
- A sentence stays only when it changes what the reader does from what they would do without it. A sentence that restates a default, praises, or explains what the reader already knows is cut.
- Each item of Steps ends on its completion criterion: what is true, or what exists, when the step is done.
- Material a step needs only in some runs (a long format, a table of cases, a protocol) goes in a file `references/<name>.md` beside `SKILL.md`, named by its path from the step that reads it. Reference material goes in `references/`, never in `templates/`, which holds the files a skill copies into a repository or runs from its own folder.
- A reference section of row 6 of "Sections, in order" holds only material every run reads.
- The rules of this section apply to a skill's text when it is written or rewritten. Roadmap entry 23, the pruning pass, applies them to every existing skill.
```

"Paths and names", one bullet added after the `templates/<file>` bullet:

- A file of this skill's `references/` is named `references/<file>`, as a file of its `templates/` is named `templates/<file>`.

Each new rule against the ruled list (`.scratch/comparison-2026-09-28/rulings.md` line 54), by reading:

| Ruled rule | Where it is stated |
|---|---|
| A description is a trigger: front-load the leading word | Frontmatter, "The first words of `description` name what the skill does ..." |
| One trigger per case | Frontmatter, "`Triggers on:` lists one phrase for each case the skill is for." and the neighbouring-skill bullet; its meaning is open item A |
| State the target behaviour rather than a prohibition | Writing for an agent, first bullet |
| One source of truth per meaning | Writing for an agent, second bullet, citing "Where a rule goes" |
| Delete every sentence that does not change behaviour | Writing for an agent, third bullet |
| Each step ends on a completion criterion | Writing for an agent, fourth bullet |
| Push reference material out of the main file | Writing for an agent, fifth and sixth bullets; row 6 points at them; "Paths and names", new bullet |

Each rule is stated once: `grep -n "prohibition\|completion criterion\|references/\|1,024\|one phrase" docs/dev/skill-layout.md` prints lines 18, 20, 33, 58, 61, 62 and 69. Line 33 is row 6's pointer to the section, line 69 is the naming rule of "Paths and names", and neither restates line 62.

## The spec description, old and new

Old (1031 characters):

> Prepare one step of an open plan: refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)), check every premise the step's text makes against the tree, look for a library for every capability the step builds when the project's libraries is check, a candidate being the user's choice, write the brief (the checked premises, the fix text, the verification list, the report shape, the pointer to the repository's change standard, the cases, the libraries checked, the paths it writes), compare those paths with the briefs of the steps in flight and hand a shared file to the orchestrator's judgment, create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file; a step a red line took back out of main is prepared again from main's head, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...).

New (999 characters):

> Prepare one step of an open plan: refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)), check every premise the step's text makes against the tree, look for a library for every capability the step builds when the project's libraries is check, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the repository's change standard, cases, libraries checked, paths it writes), compare those paths with the briefs of the steps in flight and hand a shared file to the orchestrator's judgment, create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again from main's head, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...).

The two differences: the seven articles "the" inside the brief's parenthesis are dropped, and the semicolon before the backed-out case is a full stop. Behaviours of item 4, each still named, by reading: the authority refusal ("refuse a step whose line carries no authority"), the premise check ("check every premise"), the library search ("look for a library"), the brief and its eight parts (the parenthesis), the path comparison ("compare those paths"), the worktree ("create the step's worktree at main's head"), the base binaries ("stage the base binaries"), the dispatch record ("record the dispatch in the state file"), the step taken back out of main (the second sentence). The trigger text is unchanged character for character. The first words, "Prepare one step of an open plan", name what the skill does. `metadata.version` is `"1.6.1"`.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. Frontmatter: 1,024 bullet and the trigger rules | DONE | `sed -n 16,22p docs/dev/skill-layout.md` prints the four new bullets quoted above |
| 2. "Writing for an agent" after "Lists and tables" | DONE | `grep -n '^## ' docs/dev/skill-layout.md` prints `47:## Lists and tables`, `56:## Writing for an agent`, `66:## Paths and names`; the section's text is quoted above |
| 3. "Paths and names" bullet for `references/<file>` | DONE | `sed -n 69p docs/dev/skill-layout.md` prints the bullet quoted above |
| 4. spec description at most 1,024, version 1.6.1 | DONE | the gate's length command prints `999 skills/spec/SKILL.md`; `git diff 8bb98e8 --numstat` prints `2 2 skills/spec/SKILL.md`, lines 3 and 5 only |

Verify list, from the worktree root, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`, exit 0, on the tree after repair round 1:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

The gate's length command on the tree after repair round 1, exit 0:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
386 skills/plan/SKILL.md
775 skills/refute/SKILL.md
626 skills/repo-setup/SKILL.md
630 skills/roadmap/SKILL.md
999 skills/spec/SKILL.md
```

`LC_ALL=C grep -n '[^ -~]' docs/dev/skill-layout.md skills/spec/SKILL.md` prints nothing, exit 1.

These checks cover the length and the characters; whether the rules say what the ruling says is judged by reading, above.

## Files changed

- `docs/dev/skill-layout.md`: 17 lines added, 2 removed by `git diff 8bb98e8 --numstat` (72 to 87 lines by `wc -l`).
- `skills/spec/SKILL.md`: 2 lines changed (lines 3 and 5), 237 lines by `wc -l`.
- This report.

## Judgment calls

- The scope bullet says "The rules of this section", where the brief wrote "This page's rules"; the orchestrator's ruling of round 1, item 1, keeps it. "This page" would have put the page's existing layout rules under the pruning pass too. The brief's "and is not this step" is read as the builder's scope, not page text, since a standards page names no plan step (change standard, rule 10).
- "One phrase for each case" is read as every case having a phrase, not as one phrasing only, since item 4 keeps all four phrases of spec's single case. The meaning is open item A.
- The brief's single bullets for the trigger rule and for the reference-material rule are split in two, each part breakable while the other holds ("Lists and tables", first bullet). The Anti-patterns clause of the prohibition rule is kept in the same bullet as a qualifier of where the "do instead" is named; round 1, item 2, keeps it.

## User-visible changes

- `docs/dev/skill-layout.md`: before, no length limit and no trigger rules for `description`, no "Writing for an agent" section, row 6 without a limit, no `references/` naming. After, the text quoted above.
- `skills/spec/SKILL.md` description: before 1031 characters, after 999, text quoted above; version 1.6.0 to 1.6.1.

## Doc text

No sentence outside the path list is made false. `grep -rn "Writing for an agent\|references/\|1,024\|Triggers on:" README.md docs/dev skills/*/SKILL.md skills/*/templates` prints the lines of `docs/dev/skill-layout.md` quoted above, its template line 10 and its `description` bullet line 17, and line 3 of each of the ten `SKILL.md` files (each skill's `description`, which holds `Triggers on:`); none is made false. `docs/dev/building.md:27` and `docs/dev/change-standard.md:77`, which name scripts under `templates/`, agree with the new clause of the fifth bullet.

Two descriptions outside the path list name a neighbouring skill, against the Frontmatter's existing rule "It names no neighbouring skill"; the rule is older than this step and the lines are for the orchestrator:

- `skills/roadmap/SKILL.md:3`: "Keep the roadmap that /plan opens entries from: ...".
- `skills/repo-setup/SKILL.md:3`: "... and .agents/plan.yaml through /ordo-init. ...".

## Repair round 1

The rulings of `agents/briefs/1-round-1.md`, items 1 to 7; item 3 was not sent.

### Item 1: the ten descriptions against the Frontmatter rules

The scope bullet stands as built. Each description against the Frontmatter rules, by `python3 -c 'import glob,yaml ...'` printing each description's length and its text up to the first colon:

```
land 726 | Bring a refuted step from its worktree onto main and book it
ordo-init 632 | Set a repository up for the plan skills
plan-help 386 | Print the command sequence for running a plan step by step (open, spec, build, refute, clo
plan-orchestration 788 | Run an open plan unattended, step by step, from its ledger folder
plan-retro 616 | Read every refuter report of a repository's plans, open and archived, group the findings b
plan 386 | Open a plan for one roadmap entry
refute 775 | Review a built step without changing anything
repo-setup 626 | Set up a new repository in the shape the plan skills expect
roadmap 630 | Keep the roadmap that /plan opens entries from
spec 999 | Prepare one step of an open plan
```

| Skill | Length (at most 1,024) | First words name what it does, by reading | A neighbouring skill's phrase in `Triggers on:` |
|---|---|---|---|
| land | 726 | yes: "Bring a refuted step from its worktree onto main and book it" | none |
| ordo-init | 632 | yes: "Set a repository up for the plan skills" | none |
| plan-help | 386 | yes: "Print the command sequence for running a plan step by step" | none |
| plan-orchestration | 788 | yes: "Run an open plan unattended, step by step" | none |
| plan-retro | 616 | yes: "Read every refuter report of a repository's plans" | none |
| plan | 386 | yes: "Open a plan for one roadmap entry" | none |
| refute | 775 | yes: "Review a built step without changing anything" | none |
| repo-setup | 626 | yes: "Set up a new repository in the shape the plan skills expect" | none |
| roadmap | 630 | yes: "Keep the roadmap that /plan opens entries from" | none |
| spec | 999 | yes: "Prepare one step of an open plan" | none |

The last column: a split of each `Triggers on:` list on commas and semicolons, counted across the ten skills, prints `[]` (no phrase in two skills), and reading each phrase finds none that asks for a neighbour's case. The rule "one phrase for each case" is not judged here; its meaning is open item A. The existing rule "It names no neighbouring skill" is not met by roadmap and repo-setup, as "Doc text" says.

### Item 2

No change; the first bullet of "Writing for an agent" stands.

### Item 4: the `templates/` clause

`sed -n 62p docs/dev/skill-layout.md`:

```
- Material a step needs only in some runs (a long format, a table of cases, a protocol) goes in a file `references/<name>.md` beside `SKILL.md`, named by its path from the step that reads it. Reference material goes in `references/`, never in `templates/`, which holds the files a skill copies into a repository or runs from its own folder.
```

### Item 5: row 6

`sed -n 33p docs/dev/skill-layout.md`:

```
| 6 | Reference sections | no | Any number of `## <label>` sections for material the steps point at that every run reads (a script, a file format, a launch command); material only some runs need goes in `references/`, as "Writing for an agent" says. Each heading is a noun-phrase label. |
```

### Item 6: the introduction

`sed -n 3p docs/dev/skill-layout.md`:

```
Every `skills/<name>/SKILL.md` follows this layout, so a reader finds the same thing in the same place in every skill. The section "Writing for an agent" binds a skill's text as that section's last bullet says. The prose inside follows `skills/repo-setup/templates/docs/dev/prose-standard.md`.
```

The reread of change standard, rule 14, for the sentences about the page as a whole:

- The introduction, line 3 (above): it holds, since its second sentence states the one condition, and line 64, `- The rules of this section apply to a skill's text when it is written or rewritten. Roadmap entry 23, the pruning pass, applies them to every existing skill.`, is the bullet it names.
- `No other \`##\` heading appears outside the place row 6 gives it.` (line 38): it speaks of a skill's `SKILL.md`, and a `references/` file is not one; it holds.

### Item 7: semicolons

`sed -n '60p;64p' docs/dev/skill-layout.md`:

```
- A sentence stays only when it changes what the reader does from what they would do without it. A sentence that restates a default, praises, or explains what the reader already knows is cut.
- The rules of this section apply to a skill's text when it is written or rewritten. Roadmap entry 23, the pruning pass, applies them to every existing skill.
```

The count of semicolons in running prose (every line outside code fences, tables and headings, with inline code removed), before and after, by a count in the session's scratch folder run as `git show 8bb98e8:docs/dev/skill-layout.md | python3 semi.py` and `python3 semi.py < docs/dev/skill-layout.md`:

```
semicolons 2, words 429
semicolons 2, words 753
```

2 in 753 words after, within the prose standard's 2 per 1000 words. The two are lines 17 and 52, both on the page before this step.

### Reruns

`checks.sh`, the length command and the ASCII grep, on the tree after this round, are quoted under "DONE / NOT DONE" above: `checks: 7 commands passed`, exit 0; `999 skills/spec/SKILL.md` and no length above 1,024; the ASCII grep prints nothing, exit 1.

### Line counts

`git diff 8bb98e8 --numstat`, its tabs written as spaces so the report passes the ASCII check:

```
17 2 docs/dev/skill-layout.md
2 2 skills/spec/SKILL.md
```

`wc -l`: `87 docs/dev/skill-layout.md`, `237 skills/spec/SKILL.md`.
