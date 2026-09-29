# Report: step 1, the writing rules for skill text

NOT DONE: the last clause of item 2's fifth bullet, "`templates/` stays for files copied into a repository", is not written, because its premise is false on the tree: `templates/` also holds scripts that run in place from the skill's folder. Everything else in the brief is done.

Evidence for the false premise (change standard, rule 4: the substitute is the orchestrator's to write):

- `ls skills/*/templates/` lists `land.sh`, `checks.sh`, `land.test.sh`, `checks.test.sh` (land), `check_config.py`, `check_config.test.sh` (ordo-init) and `sync_rules.py`, `sync_rules.test.sh` (repo-setup) beside the copied files.
- `grep -n "templates/" docs/dev/building.md docs/dev/change-standard.md` prints `docs/dev/building.md:27:... a new script under a skill's \`templates/\` or under \`utils/\` adds its test here ...` and `docs/dev/change-standard.md:77:- Each script under a skill's \`templates/\` or under \`utils/\` has a test beside it ...`.
- The state file of this plan runs `sh <the land skill's folder>/templates/land.sh`, from the skill's folder, not from a copy.

Written as the brief has it, the sentence would state something false about eight files and contradict the two lines above (change standard, rule 19). The sentence the brief's intent needs (that reference material goes in `references/` and not in `templates/`) is for the orchestrator to write.

## Open items of the state file, verbatim

None.

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

Frontmatter, four bullets added after the existing `description` bullet:

- `description` is at most 1,024 characters, counted as the length of its YAML value once parsed: `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/SKILL.md"))]'` prints each skill's count.
- The first words of `description` name what the skill does, in the phrase a reader or a model matches a request on.
- `Triggers on:` lists one phrase for each case the skill is for.
- A phrase for a case a neighbouring skill is for goes in that skill's `Triggers on:`, not in this one.

New section, after "Lists and tables":

```markdown
## Writing for an agent

- A rule states the behaviour wanted: a rule written as a prohibition names the behaviour to do instead, in the same bullet or in the Do instead cell of its Anti-patterns row, since a bare prohibition draws attention to what it forbids.
- One meaning has one place, as "Where a rule goes" says for a rule.
- A sentence stays only when it changes what the reader does from what they would do without it; a sentence that restates a default, praises, or explains what the reader already knows is cut.
- Each item of Steps ends on its completion criterion: what is true, or what exists, when the step is done.
- Material a step needs only in some runs (a long format, a table of cases, a protocol) goes in a file `references/<name>.md` beside `SKILL.md`, named by its path from the step that reads it.
- A reference section of row 6 of "Sections, in order" holds only material every run reads.
- The rules of this section apply to a skill's text when it is written or rewritten; roadmap entry 23, the pruning pass, applies them to every existing skill.
```

"Paths and names", one bullet added after the `templates/<file>` bullet:

- A file of this skill's `references/` is named `references/<file>`, as a file of its `templates/` is named `templates/<file>`.

Each new rule against the ruled list (`.scratch/comparison-2026-09-28/rulings.md` line 54), by reading:

| Ruled rule | Where it is stated |
|---|---|
| A description is a trigger: front-load the leading word | Frontmatter, "The first words of `description` name what the skill does ..." |
| One trigger per case | Frontmatter, "`Triggers on:` lists one phrase for each case the skill is for." and the neighbouring-skill bullet |
| State the target behaviour rather than a prohibition | Writing for an agent, first bullet |
| One source of truth per meaning | Writing for an agent, second bullet, citing "Where a rule goes" |
| Delete every sentence that does not change behaviour | Writing for an agent, third bullet |
| Each step ends on a completion criterion | Writing for an agent, fourth bullet |
| Push reference material out of the main file | Writing for an agent, fifth and sixth bullets; "Paths and names", new bullet |

Each rule is stated once: `grep -n "prohibition\|completion criterion\|references/\|1,024\|one phrase" docs/dev/skill-layout.md` prints lines 18, 20, 58, 61, 62 and 69, each key term on one rule's line only, and line 69 is the naming rule of "Paths and names", not a second statement of line 62.

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
| 2. "Writing for an agent" after "Lists and tables" | DONE except the `templates/` clause | `grep -n '^## ' docs/dev/skill-layout.md` prints `47:## Lists and tables`, `56:## Writing for an agent`, `66:## Paths and names`; the `templates/` clause is NOT DONE, see the first line |
| 3. "Paths and names" bullet for `references/<file>` | DONE | `sed -n 69p docs/dev/skill-layout.md` prints the bullet quoted above |
| 4. spec description at most 1,024, version 1.6.1 | DONE | the gate's length command prints `999 skills/spec/SKILL.md`; `git diff --numstat` prints `2 2 skills/spec/SKILL.md`, lines 3 and 5 only |

Verify list, from the worktree root, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md`, exit 0:

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

The gate's length command after the change, exit 0:

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

- `docs/dev/skill-layout.md`: 15 lines added, 0 removed (72 to 87 lines).
- `skills/spec/SKILL.md`: 2 lines changed (lines 3 and 5), 237 lines.
- This report.

## Judgment calls

- The scope bullet says "The rules of this section", where the brief wrote "This page's rules". Written as "this page", it would put the page's existing layout rules, which every skill already follows (line 3: "Every `skills/<name>/SKILL.md` follows this layout"), under the pruning pass too, a change of meaning (change standard, rule 17). Roadmap entry 23's goal names "the writing-for-agents rules of `docs/dev/skill-layout.md`" (`sed -n 201,205p docs/roadmap.md`). The brief's "and is not this step" is read as the builder's scope, not page text, since a standards page names no plan step (change standard, rule 10).
- "One phrase for each case" is read as every case having a phrase, not as one synonym only: item 4 keeps all four phrases of spec's single case (`spec <entry> <step>`, `brief <step>`, `prepare step <n>`, `write the brief`).
- The brief's single bullets for the trigger rule and for the reference-material rule are split in two, each part breakable while the other holds ("Lists and tables", first bullet). The Anti-patterns clause of the prohibition rule is kept in the same bullet as a qualifier of where the "do instead" is named.
- The descriptions of the other nine skills were read against the new Frontmatter rules: each opens with the verb phrase of what it does, and no trigger phrase appears in two skills' `Triggers on:` (a split of each `Triggers on:` list on commas and semicolons, counted across the ten skills, finds no phrase in two of them). Whether a phrase belongs to a neighbour's case is a judgment by reading.

## User-visible changes

- `docs/dev/skill-layout.md`: before, no length limit and no trigger rules for `description`, no "Writing for an agent" section, no `references/` naming. After, the text quoted above.
- `skills/spec/SKILL.md` description: before 1031 characters, after 999, text quoted above; version 1.6.0 to 1.6.1.

## Doc text

None found. `grep -rn "Writing for an agent\|references/\|1,024\|Triggers on:" README.md docs/dev skills/*/SKILL.md skills/*/templates` prints only the new lines of `docs/dev/skill-layout.md`, the template line 10 and the existing `description` bullet line 17, both still true. The two lines that name scripts under `templates/`, `docs/dev/building.md:27` and `docs/dev/change-standard.md:77`, are true as they are, and are the evidence for the NOT DONE clause above.
