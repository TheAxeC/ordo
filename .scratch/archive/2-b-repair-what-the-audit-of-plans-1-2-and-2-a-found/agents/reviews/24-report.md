Everything in the brief is done.

## Open items of the state file, verbatim

- Open item GG (step 17, the skills against the sharpened one-rule-per-bullet rule): step 17 made `docs/dev/skill-layout.md` line 45 say that two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets. `skill-layout.md` line 3 says every `SKILL.md` follows the layout, and the review found three Rules bullets that do not (`skills/land/SKILL.md:165` and `:166`, `skills/spec/SKILL.md:191`); a heuristic count gives 161 of the 692 list items of the ten skills as candidates, an upper bound. No brief item asks for the sweep. (a) A new step after 17 goes through every list item of the ten `SKILL.md` files and splits each that holds two independent requirements, keeping every rule's meaning (rule 17). Pro: the page and the skills agree. Con: a sweep over all ten skills, reviewed item by item. (b) Split only the three bullets the review named, at step 17's landing. Con: the rest stay out of line, and line 3 stays false; this is the lazy option. (c) Leave the skills as they are and let the rule apply to new text only, saying so on line 3. Con: the page then describes two standards. Recommendation: (a), run after step 24.

## The cases, first run on the unchanged tree

The sentence count is a one-off Perl script in the session scratchpad (`sentlen.pl`, not in the tree). It reads the prose outside code fences and headings, splits table rows on `|`, strips list markers, splits sentences after `.`, `!` or `?` followed by whitespace, and prints each sentence over N words.

| Case | Command | Output on the unchanged tree |
|---|---|---|
| No Tests section | `grep -n '^## Tests' README.md` | `101:## Tests` (exit 0) |
| No citation of the README's Tests | `grep -n "README's Tests\|README.md\`, Tests" docs/dev/building.md docs/dev/change-standard.md` | `docs/dev/change-standard.md:62: ... (\`README.md\`, Tests).` and `docs/dev/building.md:27:The tests come from the README's Tests section; ...` (exit 0) |
| Code-block commands unchanged | the blocks extracted with `awk '/^```/{inb=!inb; print; next} inb'` | Base copy saved to the scratchpad as `README.before.md` and `blocks.before`, for the diff after the change |
| Facts findable | `grep -c` per term over `README.md` | python3 6, PyYAML 4, bash 5, `` `ps` `` 4, landing_worktree_root 1, landing_tool_path 2, landing_ledger_root 2, The `ADAPT` block 1, model names 1, ORDO_SKILL_DIRS 3, ORDO_STABLE 1, roadmap 9, verification 1, `` `rules` `` 1, ledger_root 3, archive_root 1, `` `worktree_root` `` 3, `` `worker` `` 1, `` `reviewer` `` 1 |
| Pointers name a holder | read by hand | The unchanged README has two pointers (`/plan-help` line 39, `plan.yaml` line 97); the new pointers do not exist yet |
| No sentence over 40 words | `perl sentlen.pl 40 README.md` | `sentences: 194, over 40: 16` (lines 3, 11, 76, 114 x3, 115 x6, 117 x2, 121, 129) |
| ASCII check | the check of `docs/dev/change-standard.md` | no output, exit 0 |

No case gives a result the brief's own rules get wrong, so no stop was needed.

## The cases after the change

- `grep -n '^## Tests' README.md`: no output, exit 1.
- `grep -n "README's Tests\|README.md\`, Tests" docs/dev/building.md docs/dev/change-standard.md`: no output, exit 1.
- `diff blocks.before blocks.after` (the README's fenced lines before and after):

```
40,47d39
< sh skills/land/templates/land.test.sh
< sh skills/land/templates/verify.test.sh
< sh skills/ordo-init/templates/check_config.test.sh
< sh skills/repo-setup/templates/sync_rules.test.sh
< sh utils/pin.test.sh
< sh utils/check_coverage.test.sh
< ```
< ```sh
50c42
< utils/pin.sh v1.0.0      # the worktree ~/.local/share/ordo-stable at v1.0.0, every skill linked from it
---
> utils/pin.sh v1.1.0      # the worktree ~/.local/share/ordo-stable at v1.1.0, every skill linked from it
```

  The only differences are the Tests section's command block, removed with the section (the same six commands stay in `docs/dev/building.md` lines 6 to 11), and the example tag. The order-of-use block, the skills CLI install, the copy install loop, the `sync_rules.py`, `check_config.py` and `cp` examples and the rest of the `git clone` / `pin.sh` block are byte-identical.
- `grep -n` per fact over the new `README.md` (line numbers):
  - `verify.sh` requirements: python3 47, 111; PyYAML 47, 111; bash 47, 111; `ps` 47, 111.
  - `ADAPT` settings: landing_worktree_root 119; landing_tool_path 120, 125; landing_ledger_root 121, 125; The `ADAPT` block 122; model names 123.
  - `pin.sh` variables: ORDO_SKILL_DIRS 138, 144; ORDO_STABLE 138.
  - The eight required keys: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worktree_root`, `worker`, `reviewer` all on 105.
- `perl sentlen.pl 40 README.md`: `sentences: 124, over 40: 0`. With 25 as the bound it prints nine sentences of 26 to 33 words: lines 113, 117 and 144 (each a sentence ending in a list after a colon), 125, 140 (two), and 129 and 142, which are old lines 151 and 164, kept as they were because the brief says "kept".
- ASCII check: printed nothing inside the verify run below.

### Each pointer and the line of the target that holds it

| README line | Pointer | Target line that holds it |
|---|---|---|
| 43 | `/plan-help` prints the full sequence | unchanged from the base (old line 39) |
| 105, 107 | the example `plan.yaml` describes every key and its default | `skills/plan/templates/plan.yaml` line 3: "An optional key that is missing takes the value written here."; line 19: `look: ""  # optional, default "". ... "" means no look step.` |
| 113 | head comment of `skills/land/templates/verify.sh`: the pipe rule in full, what the runner prints, how each command is started, the signals, the exit statuses | lines 7 to 14 (the pipe rule, "A command whose text after its last single pipe (not \|\|) is a tail stage ..."), lines 13 to 17 (what is printed, "The first red command prints RED: <command>, its exit status and its whole output"), lines 19 to 20 ("Each command runs in a session of its own with standard input from /dev/null"), lines 20 to 22 (INT, HUP, QUIT, TERM), lines 27 to 35 ("Exit status:" 0, 1, 64, 69, 128+n) |
| 125 | the land skill's section "The landing script" in `skills/land/SKILL.md`: the check on `main`, the refusals, what `land.test.sh` proves | `skills/land/SKILL.md` line 105 ("Its check on main (Steps 6) is the ledger's verify list ..."), line 103 ("`/land` refuses a ledger without it") and line 106 ("... is refused before main is touched, with the places named"), line 115 ("`templates/land.test.sh` proves it on scratch repositories ...") |
| 144 | head comment of `utils/pin.sh`: the format of `ORDO_SKILL_DIRS`, folders whose path holds a space, the refusals, the rules for `~/.agents/skills`, the lines each mode prints | lines 12 to 14 ("$ORDO_SKILL_DIRS is split on spaces and tabs, or read one folder per line when it holds a newline"), lines 15 to 16 ("a home folder holding a space needs nothing"), lines 14, 16 to 17 and 22 to 24 (the refusals), lines 27 to 33 (`~/.agents/skills`), lines 17 to 18 and 25 to 26 and 31 to 32 (the summary line and "prints a line for each") |
| 146 | `docs/dev/building.md` lists the tests and checks | `docs/dev/building.md` lines 5 to 13 (the command block) and line 27 ("This page is the list of tests and checks; ...") |

### Grep for citations of the README (change standard rule 14)

`git grep -n "README" -- ':!.scratch' ':!README.md'`, less the hits in `skills/` and `docs/roadmap.md` that name a README in general, prints `docs/dev/change-standard.md:61` (the README's first paragraph) and `:63` (the README's Working on Ordo). Line 61 still holds: the new README's first paragraph (line 3) says "The skills carry no project name and no path. Everything specific to a repository comes from that repository's `.agents/plan.yaml`." Line 63 still holds: README line 142 keeps "The pinned worktree is never edited" and the move by `utils/pin.sh <tag>`. `git grep -n -i "Configuring a repository\|Working on Ordo" -- ':!.scratch'` finds only the README's headings and `change-standard.md:63`.

## Verify

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
```

`git status --short` and `git diff --stat`:

```
 M README.md
 M docs/dev/building.md
 M docs/dev/change-standard.md
 README.md                   | 84 +++++++++++++++++----------------------------
 docs/dev/building.md        |  6 ++--
 docs/dev/change-standard.md |  2 +-
 3 files changed, 35 insertions(+), 57 deletions(-)
```

`LC_ALL=C grep -n '[^ -~]' README.md docs/dev/building.md` prints nothing.

## DONE / NOT DONE

| Item | State | Proof |
|---|---|---|
| 1. Introduction: same content, short sentences, first sentence says what Ordo is | DONE | `sed -n 1,8p README.md`: line 3 opens "Ordo is a set of agent skills for Claude Code that run a multi-step change as a plan."; the old line 3 is now three paragraphs of four, four and two sentences; `sentlen.pl 25` lists no sentence of lines 1 to 8 |
| 1. "The skills", "Requirements", "Install": kept, long sentences split, table and blocks keep content | DONE | `sentlen.pl 25` lists no sentence of lines 10 to 76; the blocks diff above shows the order-of-use and both install blocks unchanged |
| 1. "Configuring a repository": same content, line 76 split | DONE | old line 76 is now README line 80, five sentences; `sentlen.pl 25` lists no sentence of lines 78 to 111 |
| 1. "Tests" removed, verify paragraph after the `plan.yaml` text | DONE | `grep -n '^## Tests' README.md` prints nothing; README lines 111 and 113 carry the verify list, the command, the requirements, the pass rules, the stop at the first failing command and the pointer to the head comment of `skills/land/templates/verify.sh` |
| 1. "The landing script": what `land.sh` is, the copies, the `ADAPT` list as now, where it finds `verify.sh` and `usage.py` (one sentence), the ledger file (one sentence), the pointer | DONE | `sed -n 115,125p README.md`; the five `ADAPT` bullets (lines 119 to 123) are byte-identical to old lines 137 to 141 (`diff <(sed -n 137,141p README.before.md) <(sed -n 119,123p README.md)` prints nothing) |
| 1. "Working on Ordo": line 151 kept, tag `v1.1.0`, folders paragraph, check and pin mode in three sentences, line 164 kept, the `~/.agents/skills` sentence, the pointer, the `docs/dev/building.md` sentence | DONE | `sed -n 127,146p README.md`; README line 129 equals old line 151 and line 142 equals old line 164 (`diff <(sed -n 151p README.before.md) <(sed -n 129p README.md)` and the same for 164/142 print nothing) |
| 1. "License": kept | DONE | README lines 148 to 150 equal old lines 170 to 172 |
| 2. `docs/dev/building.md` line 27 in the brief's words | DONE | `sed -n 27p docs/dev/building.md`: "This page is the list of tests and checks; a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block of `docs/dev/change-standard.md`." |
| 2. Comments for `sync_rules.test.sh` and `pin.test.sh` | DONE | `sed -n 9,10p docs/dev/building.md`: `# sync_rules.py on matching and drifted shared-rules blocks, its --write repair and its refusals` and `# pin.sh in pin and check mode under a scratch HOME, its refusals included`, both starting at column 56 like lines 6 to 8 |
| 3. `docs/dev/change-standard.md` line 62 | DONE | `sed -n 62p docs/dev/change-standard.md` ends "(`docs/dev/building.md`)." |

## Files

| File | Lines now | Lines changed (`git diff --numstat`) |
|---|---|---|
| `README.md` | 150 | +31 -53 |
| `docs/dev/building.md` | 27 | +3 -3 (lines 9, 10, 27) |
| `docs/dev/change-standard.md` | 64 | +1 -1 (line 62) |

`README.md` before: 172 lines, 4251 words. After: 150 lines, 1951 words (`wc -l -w`).

## What was cut from each section of the README, and where the reader finds it

| Section | Cut | Where it is stated now |
|---|---|---|
| Introduction | nothing; one paragraph became three, the plan.yaml sentences kept in the first so that `change-standard.md` line 61 stays true | README lines 3 to 7 |
| The skills | nothing; long cells split into sentences | README lines 12 to 23 |
| Requirements | nothing; the verify runner is named by its path here, which the old line 121 gave | README lines 47 to 50 |
| Install | nothing | README lines 52 to 76 |
| Configuring a repository | nothing | README lines 78 to 109 |
| Tests: the six commands | moved | `docs/dev/building.md` lines 6 to 11 |
| Tests: the bullets listing each test's cases | cut | each test file's head comment and body (`skills/land/templates/land.test.sh`, `skills/land/templates/verify.test.sh`, `skills/ordo-init/templates/check_config.test.sh`, `skills/repo-setup/templates/sync_rules.test.sh`, `utils/pin.test.sh`, `utils/check_coverage.test.sh`), with a one-line summary per test in `docs/dev/building.md` lines 6 to 11 |
| Tests: the verify runner's rules | cut to the pass rule and the stop | README lines 111 and 113; the rest in the head comment of `skills/land/templates/verify.sh` lines 2 to 35 and in `docs/dev/building.md` lines 17 to 23 |
| Tests: the runner's exit statuses | cut | head comment of `skills/land/templates/verify.sh` lines 27 to 35; `docs/dev/building.md` lines 19 to 23 |
| The landing script: the check on `main`, `land.test.sh`'s proof, the refusal of a missing state file or `verify.sh`, the ledger copies finding their files beside themselves | cut | `skills/land/SKILL.md` "The landing script", lines 103, 105, 106, 115 and 116 |
| The landing script: where `land.sh` finds its files (said twice before) | kept once | README line 125 |
| Working on Ordo: "This section is for changing Ordo itself. To use the skills, install them as above." | cut | a sentence describing the page, which the prose standard section C bans; the heading says the same |
| Working on Ordo: space in a home folder, the absolute-path refusal, the summary line's format, the splitting of `ORDO_SKILL_DIRS`, the `~/.agents/skills` comparison and check-mode rules, pin mode's refusals of a real directory or a foreign link | cut | head comment of `utils/pin.sh` lines 12 to 33 |

## Judgment calls

- The README keeps one sentence the brief's item list does not name: "`land.test.sh` reads `landing_tool_path` and `landing_ledger_root` from the `land.sh` beside it." (line 125). The old line 143 stated it, and no pointer target holds it: `skills/land/SKILL.md` does not say it, and `skills/land/templates/land.test.sh` shows it only in code (lines 50 to 58). Cutting it would lose a fact a reader editing the `ADAPT` settings needs. It serves item 1's "nothing a reader needs is lost".
- The landing section's first paragraph names what the booking data is ("the diff stat, the usage rows (the tokens, tool uses and time of each agent) and the staged paths"), from `skills/land/SKILL.md` line 114 and `land.sh` lines 426 to 440, so that "booking data" is not left as shorthand.
- The `python3`, PyYAML, `bash` and `ps` requirement of the verify runner stands in two places, Requirements (line 47) and the verify paragraph (line 111). The brief keeps Requirements and dictates the requirement in the verify paragraph.
- `docs/dev/change-standard.md` line 62 now cites `docs/dev/building.md` for "Each script under a skill's `templates/` or under `utils/` has a test beside it that runs on scratch repositories". `building.md` states that a new script adds its test (line 27) and that each test builds scratch repositories (line 3); "beside it" is shown by the paths of the command block (lines 6 to 11), not said in words. The brief dictates both lines, so neither was reworded.
