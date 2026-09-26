# Step 15: the re-run of every landing and closing commit of plans 1, 2 and 2.A

Each of the 26 commits below was extracted by the orchestrator with `git archive <commit> | tar -x` into `/Users/axelfaes/workspace/ordo/.agents/trees-2b-15/<commit>/`. The script under "The script" below copied each tree into a scratch folder and ran, from the copy's root: the ASCII check of `docs/dev/building.md` over every file of the tree (the same check at all 26 commits), every `*.test.sh` outside `.scratch` with `CLAUDE_CONFIG_DIR`, `ORDO_SKILL_DIRS` and `ORDO_STABLE` unset, `python3 utils/check_skill_layout.py`, and `python3 utils/check_rule_inventory.py` over the tree's inventories where the tree holds the check and inventories. The copy keeps the extracted trees unchanged: a checksum of every file under `.agents/trees-2b-15` (`find . -type f -print0 | xargs -0 md5 -r | sort -k2 | md5 -q`) printed `66c7472a95f6678e59227606711b0bed` before and after the re-run.

The ASCII check ran over `find . -type f` in the extracted tree in place of `git ls-files`, since the tree holds no `.git`; `git archive` writes exactly the commit's tracked files, and no tree holds a `.gitattributes` (`find . -maxdepth 2 -name .gitattributes | wc -l` in `.agents/trees-2b-15` prints 0). The inventory check reads each old file with `git show`, so it ran with `GIT_DIR` naming the repository's object store, read only, and `GIT_WORK_TREE` naming the copied tree.

## Summary

Every test exits 0 with a `PASS:` last line at all 26 commits, and the ASCII check prints nothing and exits 0 at all 26. The layout check exits 1 at the eleven commits before fe1f5e7, where some skills were not yet restyled; it joined plan 1's verify list at bd51f8b. No commit is red.

| plan | step | commit | tests exiting 0 with a `PASS:` last line | layout check | inventory check | ASCII check |
|---|---|---|---|---|---|---|
| 1 | 2 | 84ce1f7 | 6 of 6 | exit 1, 0 `ok:` | not in the tree | exit 0, no output |
| 1 | 3 | 836f5c5 | 7 of 7 | exit 1, 0 `ok:` | no inventory yet | exit 0, no output |
| 1 | 4 | ea8d02d | 7 of 7 | exit 1, 1 `ok:` | exit 0, 1 `ok:` | exit 0, no output |
| 1 | 5 | a682c14 | 7 of 7 | exit 1, 2 `ok:` | exit 0, 2 `ok:` | exit 0, no output |
| 1 | 6 | e4950d0 | 7 of 7 | exit 1, 3 `ok:` | exit 0, 3 `ok:` | exit 0, no output |
| 1 | 7 | e643b34 | 7 of 7 | exit 1, 4 `ok:` | exit 0, 4 `ok:` | exit 0, no output |
| 1 | 8 | 0fa6d65 | 7 of 7 | exit 1, 5 `ok:` | exit 0, 5 `ok:` | exit 0, no output |
| 1 | 9 | aa7cfe2 | 7 of 7 | exit 1, 6 `ok:` | exit 0, 6 `ok:` | exit 0, no output |
| 1 | 10 | e6300be | 7 of 7 | exit 1, 7 `ok:` | exit 0, 7 `ok:` | exit 0, no output |
| 1 | 11 | 9eda91c | 7 of 7 | exit 1, 8 `ok:` | exit 0, 8 `ok:` | exit 0, no output |
| 1 | 12 | 709fcf6 | 7 of 7 | exit 1, 9 `ok:` | exit 0, 9 `ok:` | exit 0, no output |
| 1 | 13 | fe1f5e7 | 7 of 7 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 1 | 14 | bd51f8b | 7 of 7 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 1 | close | a866716 | 7 of 7 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 1 | d44092c | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 2 | 64e50ce | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 3 | b6fadc8 | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 4 | ed16ff2 | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 5 | 7752a76 | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | 6 | c1ff193 | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2 | close | 15703ec | 8 of 8 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2.A | 1 | 5e9ec86 | 9 of 9 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2.A | 2 | c8d673a | 9 of 9 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2.A | 3 | 916a144 | 9 of 9 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2.A | 4 | e94ba04 | 9 of 9 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |
| 2.A | close | 7d1f90e | 9 of 9 | exit 0, 10 `ok:` | exit 0, 10 `ok:` | exit 0, no output |

## The script

Run as `sh rerun.sh <out dir> <commit>...`; it writes `<out dir>/<commit>.md`, and the sections below are those files in the order of the plans' steps.

```sh
#!/bin/sh
# Re-run of every test, the layout check, the inventory check and the ASCII check at each commit
# whose tree was extracted into .agents/trees-2b-15/<commit>/ with `git archive <commit> | tar -x`.
# Usage: sh rerun.sh <out dir> <commit>...
# Each tree is copied to <out dir>/trees/<commit> and every command runs from the copy's root, so the
# extracted trees stay unchanged. Writes one Markdown section per commit to <out dir>/<commit>.md.
TREES=/Users/axelfaes/workspace/ordo/.agents/trees-2b-15
REPO_GIT=/Users/axelfaes/workspace/ordo/.git
out=$1; shift
mkdir -p "$out/trees"
for c in "$@"; do
  w="$out/trees/$c"; rm -rf "$w"; cp -R "$TREES/$c" "$w"
  f="$out/$c.md"
  {
    echo "## Commit $c"
    echo
    echo "ASCII check over every file of the tree (the tree is \`git archive $c\`, so its files are the commit's tracked files), run before any test:"
    echo
    echo '```'
    printf '%s\n' "\$ find . -type f | sed 's|^\./||' | tr '\\n' '\\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'"
    a=$(cd "$w" && find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }' 2>&1); s=$?
    [ -n "$a" ] && printf '%s\n' "$a"
    echo "exit $s"
    echo '```'
    echo
    echo "Tests, each \`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1\` from the tree's root:"
    echo
    echo '```'
    for t in $(cd "$w" && find . -name '*.test.sh' -not -path './.scratch/*' | sed 's|^\./||' | sort); do
      o=$(cd "$w" && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh "$t" 2>&1); s=$?
      printf 'sh %s: exit %s, last line: %s\n' "$t" "$s" "$(printf '%s\n' "$o" | tail -1)"
    done
    echo '```'
    echo
    if [ -f "$w/utils/check_skill_layout.py" ]; then
      echo "Layout check, every line it printed:"
      echo
      echo '```'
      echo '$ python3 utils/check_skill_layout.py'
      (cd "$w" && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE python3 utils/check_skill_layout.py 2>&1); echo "exit $?"
      echo '```'
    else
      echo "Layout check: \`utils/check_skill_layout.py\` is not in this tree."
    fi
    echo
    inv=$(cd "$w" && find .scratch -path '*/inventories/*.md' 2>/dev/null | sort | tr '\n' ' ' | sed 's/ $//')
    if [ -f "$w/utils/check_rule_inventory.py" ] && [ -n "$inv" ]; then
      echo "Inventory check over the tree's inventories. The tree holds no \`.git\`, and the check reads each old file with \`git show\`, so it runs with \`GIT_DIR\` naming the repository's object store (read only) and \`GIT_WORK_TREE\` naming the copied tree:"
      echo
      echo '```'
      echo "\$ GIT_DIR=$REPO_GIT GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py $inv"
      (cd "$w" && env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE GIT_DIR=$REPO_GIT GIT_WORK_TREE="$w" GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py $inv 2>&1); echo "exit $?"
      echo '```'
    elif [ -f "$w/utils/check_rule_inventory.py" ]; then
      echo "Inventory check: the tree holds \`utils/check_rule_inventory.py\` and no inventory."
    else
      echo "Inventory check: \`utils/check_rule_inventory.py\` is not in this tree."
    fi
    echo
  } > "$f"
done
```

## Commit 84ce1f7

Plan 1, step 2.

ASCII check over every file of the tree (the tree is `git archive 84ce1f7`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
skills/plan/SKILL.md:12: section 'Quick start' is missing
skills/plan/SKILL.md:12: section 'Use instead' is missing
skills/plan/SKILL.md:18: section 'What it writes' is outside the place between Steps and Stops
skills/plan/SKILL.md:28: section 'Anti-patterns' is missing
skills/plan/SKILL.md:28: section 'Steps' is missing
skills/plan/SKILL.md:28: section 'Stops' is missing
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
skills/plan-orchestration/SKILL.md:12: section 'The two tiers, and the harnesses' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:16: section 'Handing the plan from one orchestrator to another' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:26: section 'The loop, one step at a time' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:39: section 'The review, earned' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:43: section 'The recurring-findings pass' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:47: section 'Two steps in flight' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:51: section 'Launching a builder' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:55: bold outside a list item's label
skills/plan-orchestration/SKILL.md:57: bold outside a list item's label
skills/plan-orchestration/SKILL.md:65: bold outside a list item's label
skills/plan-orchestration/SKILL.md:76: section 'What earns a step of its own' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:80: Stops holds no table; its header is | Stop | When | What it shows | What resumes it |
skills/plan-orchestration/SKILL.md:80: section 'Quick start' is missing
skills/plan-orchestration/SKILL.md:80: section 'Steps' is missing
skills/plan-orchestration/SKILL.md:80: section 'Use instead' is missing
skills/plan-orchestration/SKILL.md:80: section 'What it reads' is missing
skills/plan-orchestration/SKILL.md:84: section 'Reports' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:88: section 'Usage' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:94: section 'The pace when a deadline is set' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:96: section 'Anti-patterns' is missing
skills/plan-orchestration/SKILL.md:96: section 'Rules' is missing
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
skills/refute/SKILL.md:12: section 'Quick start' is missing
skills/refute/SKILL.md:12: section 'Use instead' is missing
skills/refute/SKILL.md:21: section 'What the reviewer looks for' is outside the place between Steps and Stops
skills/refute/SKILL.md:28: section 'What the reviewer runs' is outside the place between Steps and Stops
skills/refute/SKILL.md:32: section 'The runs over the repair rounds' is outside the place between Steps and Stops
skills/refute/SKILL.md:36: section 'What it writes' is outside the place between Steps and Stops
skills/refute/SKILL.md:40: section 'Anti-patterns' is missing
skills/refute/SKILL.md:40: section 'Steps' is missing
skills/refute/SKILL.md:40: section 'Stops' is missing
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
skills/spec/SKILL.md:12: section 'Quick start' is missing
skills/spec/SKILL.md:12: section 'Use instead' is missing
skills/spec/SKILL.md:19: section 'What it writes' is outside the place between Steps and Stops
skills/spec/SKILL.md:27: section 'Preflight, before any write' is outside the place between Steps and Stops
skills/spec/SKILL.md:31: section 'When it stopped' is outside the place between Steps and Stops
skills/spec/SKILL.md:49: section 'Anti-patterns' is missing
skills/spec/SKILL.md:49: section 'Steps' is missing
skills/spec/SKILL.md:49: section 'Stops' is missing
exit 1
```

Inventory check: `utils/check_rule_inventory.py` is not in this tree.

## Commit 836f5c5

Plan 1, step 3.

ASCII check over every file of the tree (the tree is `git archive 836f5c5`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
skills/plan/SKILL.md:12: section 'Quick start' is missing
skills/plan/SKILL.md:12: section 'Use instead' is missing
skills/plan/SKILL.md:18: section 'What it writes' is outside the place between Steps and Stops
skills/plan/SKILL.md:28: section 'Anti-patterns' is missing
skills/plan/SKILL.md:28: section 'Steps' is missing
skills/plan/SKILL.md:28: section 'Stops' is missing
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
skills/plan-orchestration/SKILL.md:12: section 'The two tiers, and the harnesses' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:16: section 'Handing the plan from one orchestrator to another' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:26: section 'The loop, one step at a time' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:39: section 'The review, earned' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:43: section 'The recurring-findings pass' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:47: section 'Two steps in flight' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:51: section 'Launching a builder' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:55: bold outside a list item's label
skills/plan-orchestration/SKILL.md:57: bold outside a list item's label
skills/plan-orchestration/SKILL.md:65: bold outside a list item's label
skills/plan-orchestration/SKILL.md:76: section 'What earns a step of its own' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:80: Stops holds no table; its header is | Stop | When | What it shows | What resumes it |
skills/plan-orchestration/SKILL.md:80: section 'Quick start' is missing
skills/plan-orchestration/SKILL.md:80: section 'Steps' is missing
skills/plan-orchestration/SKILL.md:80: section 'Use instead' is missing
skills/plan-orchestration/SKILL.md:80: section 'What it reads' is missing
skills/plan-orchestration/SKILL.md:84: section 'Reports' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:88: section 'Usage' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:94: section 'The pace when a deadline is set' is outside the place between Steps and Stops
skills/plan-orchestration/SKILL.md:96: section 'Anti-patterns' is missing
skills/plan-orchestration/SKILL.md:96: section 'Rules' is missing
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
skills/refute/SKILL.md:12: section 'Quick start' is missing
skills/refute/SKILL.md:12: section 'Use instead' is missing
skills/refute/SKILL.md:21: section 'What the reviewer looks for' is outside the place between Steps and Stops
skills/refute/SKILL.md:28: section 'What the reviewer runs' is outside the place between Steps and Stops
skills/refute/SKILL.md:32: section 'The runs over the repair rounds' is outside the place between Steps and Stops
skills/refute/SKILL.md:36: section 'What it writes' is outside the place between Steps and Stops
skills/refute/SKILL.md:40: section 'Anti-patterns' is missing
skills/refute/SKILL.md:40: section 'Steps' is missing
skills/refute/SKILL.md:40: section 'Stops' is missing
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
skills/spec/SKILL.md:12: section 'Quick start' is missing
skills/spec/SKILL.md:12: section 'Use instead' is missing
skills/spec/SKILL.md:19: section 'What it writes' is outside the place between Steps and Stops
skills/spec/SKILL.md:27: section 'Preflight, before any write' is outside the place between Steps and Stops
skills/spec/SKILL.md:31: section 'When it stopped' is outside the place between Steps and Stops
skills/spec/SKILL.md:49: section 'Anti-patterns' is missing
skills/spec/SKILL.md:49: section 'Steps' is missing
skills/spec/SKILL.md:49: section 'Stops' is missing
exit 1
```

Inventory check: the tree holds `utils/check_rule_inventory.py` and no inventory.

## Commit ea8d02d

Plan 1, step 4.

ASCII check over every file of the tree (the tree is `git archive ea8d02d`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
skills/plan/SKILL.md:12: section 'Quick start' is missing
skills/plan/SKILL.md:12: section 'Use instead' is missing
skills/plan/SKILL.md:18: section 'What it writes' is outside the place between Steps and Stops
skills/plan/SKILL.md:28: section 'Anti-patterns' is missing
skills/plan/SKILL.md:28: section 'Steps' is missing
skills/plan/SKILL.md:28: section 'Stops' is missing
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
skills/refute/SKILL.md:12: section 'Quick start' is missing
skills/refute/SKILL.md:12: section 'Use instead' is missing
skills/refute/SKILL.md:21: section 'What the reviewer looks for' is outside the place between Steps and Stops
skills/refute/SKILL.md:28: section 'What the reviewer runs' is outside the place between Steps and Stops
skills/refute/SKILL.md:32: section 'The runs over the repair rounds' is outside the place between Steps and Stops
skills/refute/SKILL.md:36: section 'What it writes' is outside the place between Steps and Stops
skills/refute/SKILL.md:40: section 'Anti-patterns' is missing
skills/refute/SKILL.md:40: section 'Steps' is missing
skills/refute/SKILL.md:40: section 'Stops' is missing
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
skills/spec/SKILL.md:12: section 'Quick start' is missing
skills/spec/SKILL.md:12: section 'Use instead' is missing
skills/spec/SKILL.md:19: section 'What it writes' is outside the place between Steps and Stops
skills/spec/SKILL.md:27: section 'Preflight, before any write' is outside the place between Steps and Stops
skills/spec/SKILL.md:31: section 'When it stopped' is outside the place between Steps and Stops
skills/spec/SKILL.md:49: section 'Anti-patterns' is missing
skills/spec/SKILL.md:49: section 'Steps' is missing
skills/spec/SKILL.md:49: section 'Stops' is missing
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
exit 0
```

## Commit a682c14

Plan 1, step 5.

ASCII check over every file of the tree (the tree is `git archive a682c14`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
ok: skills/plan/SKILL.md
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
skills/refute/SKILL.md:12: section 'Quick start' is missing
skills/refute/SKILL.md:12: section 'Use instead' is missing
skills/refute/SKILL.md:21: section 'What the reviewer looks for' is outside the place between Steps and Stops
skills/refute/SKILL.md:28: section 'What the reviewer runs' is outside the place between Steps and Stops
skills/refute/SKILL.md:32: section 'The runs over the repair rounds' is outside the place between Steps and Stops
skills/refute/SKILL.md:36: section 'What it writes' is outside the place between Steps and Stops
skills/refute/SKILL.md:40: section 'Anti-patterns' is missing
skills/refute/SKILL.md:40: section 'Steps' is missing
skills/refute/SKILL.md:40: section 'Stops' is missing
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
skills/spec/SKILL.md:12: section 'Quick start' is missing
skills/spec/SKILL.md:12: section 'Use instead' is missing
skills/spec/SKILL.md:19: section 'What it writes' is outside the place between Steps and Stops
skills/spec/SKILL.md:27: section 'Preflight, before any write' is outside the place between Steps and Stops
skills/spec/SKILL.md:31: section 'When it stopped' is outside the place between Steps and Stops
skills/spec/SKILL.md:49: section 'Anti-patterns' is missing
skills/spec/SKILL.md:49: section 'Steps' is missing
skills/spec/SKILL.md:49: section 'Stops' is missing
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
exit 0
```

## Commit e4950d0

Plan 1, step 6.

ASCII check over every file of the tree (the tree is `git archive e4950d0`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
ok: skills/plan/SKILL.md
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
skills/refute/SKILL.md:12: section 'Quick start' is missing
skills/refute/SKILL.md:12: section 'Use instead' is missing
skills/refute/SKILL.md:21: section 'What the reviewer looks for' is outside the place between Steps and Stops
skills/refute/SKILL.md:28: section 'What the reviewer runs' is outside the place between Steps and Stops
skills/refute/SKILL.md:32: section 'The runs over the repair rounds' is outside the place between Steps and Stops
skills/refute/SKILL.md:36: section 'What it writes' is outside the place between Steps and Stops
skills/refute/SKILL.md:40: section 'Anti-patterns' is missing
skills/refute/SKILL.md:40: section 'Steps' is missing
skills/refute/SKILL.md:40: section 'Stops' is missing
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit e643b34

Plan 1, step 7.

ASCII check over every file of the tree (the tree is `git archive e643b34`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
skills/land/SKILL.md:12: section 'What it requires' is outside the place between Steps and Stops
skills/land/SKILL.md:18: section 'What it does, in order' is outside the place between Steps and Stops
skills/land/SKILL.md:33: section 'The landing script' is outside the place between Steps and Stops
skills/land/SKILL.md:37: section 'Anti-patterns' is missing
skills/land/SKILL.md:37: section 'Quick start' is missing
skills/land/SKILL.md:37: section 'Steps' is missing
skills/land/SKILL.md:37: section 'Stops' is missing
skills/land/SKILL.md:37: section 'Use instead' is missing
skills/land/SKILL.md:37: section 'What it reads' is missing
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
ok: skills/plan/SKILL.md
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit 0fa6d65

Plan 1, step 8.

ASCII check over every file of the tree (the tree is `git archive 0fa6d65`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
ok: skills/land/SKILL.md
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
ok: skills/plan/SKILL.md
skills/plan-help/SKILL.md:14: section 'The sequence, printed verbatim' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:45: section 'The position, for `<entry>`' is outside the place between Steps and Stops
skills/plan-help/SKILL.md:47: section 'Anti-patterns' is missing
skills/plan-help/SKILL.md:47: section 'Quick start' is missing
skills/plan-help/SKILL.md:47: section 'Rules' is missing
skills/plan-help/SKILL.md:47: section 'Steps' is missing
skills/plan-help/SKILL.md:47: section 'Stops' is missing
skills/plan-help/SKILL.md:47: section 'Use instead' is missing
skills/plan-help/SKILL.md:47: section 'What it reads' is missing
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit aa7cfe2

Plan 1, step 9.

ASCII check over every file of the tree (the tree is `git archive aa7cfe2`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
ok: skills/land/SKILL.md
skills/ordo-init/SKILL.md:12: section 'Quick start' is missing
skills/ordo-init/SKILL.md:12: section 'Use instead' is missing
skills/ordo-init/SKILL.md:18: section 'Drafting the file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:34: section 'Ignore rules' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:39: section 'Approval, then writing' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:49: section 'Checking an existing file' is outside the place between Steps and Stops
skills/ordo-init/SKILL.md:53: section 'Anti-patterns' is missing
skills/ordo-init/SKILL.md:53: section 'Steps' is missing
skills/ordo-init/SKILL.md:53: section 'Stops' is missing
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit e6300be

Plan 1, step 10.

ASCII check over every file of the tree (the tree is `git archive e6300be`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
skills/roadmap/SKILL.md:20: section 'Quick start' is missing
skills/roadmap/SKILL.md:20: section 'Use instead' is missing
skills/roadmap/SKILL.md:27: section 'The format is the file's' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:38: section 'A capability map beside the ordered file' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:46: section 'add' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:50: bold outside a list item's label
skills/roadmap/SKILL.md:57: section 'move, done, drop' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:63: section 'Writing' is outside the place between Steps and Stops
skills/roadmap/SKILL.md:67: section 'Anti-patterns' is missing
skills/roadmap/SKILL.md:67: section 'Steps' is missing
skills/roadmap/SKILL.md:67: section 'Stops' is missing
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit 9eda91c

Plan 1, step 11.

ASCII check over every file of the tree (the tree is `git archive 9eda91c`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
skills/plan-retro/SKILL.md:12: section 'Quick start' is missing
skills/plan-retro/SKILL.md:12: section 'Use instead' is missing
skills/plan-retro/SKILL.md:25: section 'Grouping' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:31: bold outside a list item's label
skills/plan-retro/SKILL.md:33: section 'The proposal for a recurring kind' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:43: section 'What it writes' is outside the place between Steps and Stops
skills/plan-retro/SKILL.md:49: section 'Anti-patterns' is missing
skills/plan-retro/SKILL.md:49: section 'Steps' is missing
skills/plan-retro/SKILL.md:49: section 'Stops' is missing
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit 709fcf6

Plan 1, step 12.

ASCII check over every file of the tree (the tree is `git archive 709fcf6`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
skills/repo-setup/SKILL.md:17: section 'What it asks' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:30: section 'The tree' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:53: section 'Order of work' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:72: section 'sync' is outside the place between Steps and Stops
skills/repo-setup/SKILL.md:88: section 'Anti-patterns' is missing
skills/repo-setup/SKILL.md:88: section 'Quick start' is missing
skills/repo-setup/SKILL.md:88: section 'Steps' is missing
skills/repo-setup/SKILL.md:88: section 'Stops' is missing
skills/repo-setup/SKILL.md:88: section 'Use instead' is missing
skills/repo-setup/SKILL.md:88: section 'What it reads' is missing
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
exit 1
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit fe1f5e7

Plan 1, step 13.

ASCII check over every file of the tree (the tree is `git archive fe1f5e7`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit bd51f8b

Plan 1, step 14.

ASCII check over every file of the tree (the tree is `git archive bd51f8b`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/1-one-layout-for-every-skill/inventories/land.md .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/1-one-layout-for-every-skill/inventories/plan.md .scratch/1-one-layout-for-every-skill/inventories/refute.md .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/1-one-layout-for-every-skill/inventories/spec.md
ok: .scratch/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/1-one-layout-for-every-skill/inventories/spec.md
exit 0
```

## Commit a866716

Plan 1, the closing.

ASCII check over every file of the tree (the tree is `git archive a866716`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit d44092c

Plan 2, step 1.

ASCII check over every file of the tree (the tree is `git archive d44092c`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 64e50ce

Plan 2, step 2.

ASCII check over every file of the tree (the tree is `git archive 64e50ce`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit b6fadc8

Plan 2, step 3.

ASCII check over every file of the tree (the tree is `git archive b6fadc8`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit ed16ff2

Plan 2, step 4.

ASCII check over every file of the tree (the tree is `git archive ed16ff2`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 7752a76

Plan 2, step 5.

ASCII check over every file of the tree (the tree is `git archive 7752a76`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit c1ff193

Plan 2, step 6.

ASCII check over every file of the tree (the tree is `git archive c1ff193`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 15703ec

Plan 2, the closing.

ASCII check over every file of the tree (the tree is `git archive 15703ec`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 5e9ec86

Plan 2.A, step 1.

ASCII check over every file of the tree (the tree is `git archive 5e9ec86`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-orchestration/templates/launch.test.sh: exit 0, last line: PASS: launch.sh scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit c8d673a

Plan 2.A, step 2.

ASCII check over every file of the tree (the tree is `git archive c8d673a`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-orchestration/templates/launch.test.sh: exit 0, last line: PASS: launch.sh scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 916a144

Plan 2.A, step 3.

ASCII check over every file of the tree (the tree is `git archive 916a144`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-orchestration/templates/launch.test.sh: exit 0, last line: PASS: launch.sh scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit e94ba04

Plan 2.A, step 4.

ASCII check over every file of the tree (the tree is `git archive e94ba04`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-orchestration/templates/launch.test.sh: exit 0, last line: PASS: launch.sh scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Commit 7d1f90e

Plan 2.A, the closing.

ASCII check over every file of the tree (the tree is `git archive 7d1f90e`, so its files are the commit's tracked files), run before any test:

```
$ find . -type f | sed 's|^\./||' | tr '\n' '\0' | xargs -0 perl -CSD -ne '<the ASCII check of docs/dev/building.md>'
exit 0
```

Tests, each `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <test> 2>&1` from the tree's root:

```
sh skills/land/templates/land.test.sh: exit 0, last line: PASS: land.sh and usage.py scratch tests
sh skills/ordo-init/templates/check_config.test.sh: exit 0, last line: PASS: check_config.py scratch tests
sh skills/plan-orchestration/templates/launch.test.sh: exit 0, last line: PASS: launch.sh scratch tests
sh skills/plan-retro/templates/collect_findings.test.sh: exit 0, last line: PASS: collect_findings.py scratch tests
sh skills/repo-setup/templates/sync_rules.test.sh: exit 0, last line: PASS: sync_rules.py scratch tests
sh utils/check_coverage.test.sh: exit 0, last line: PASS: check_coverage.py scratch tests
sh utils/check_rule_inventory.test.sh: exit 0, last line: PASS: check_rule_inventory.py scratch tests
sh utils/check_skill_layout.test.sh: exit 0, last line: PASS: check_skill_layout.py scratch tests
sh utils/pin.test.sh: exit 0, last line: PASS: pin.sh scratch tests
```

Layout check, every line it printed:

```
$ python3 utils/check_skill_layout.py
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
exit 0
```

Inventory check over the tree's inventories. The tree holds no `.git`, and the check reads each old file with `git show`, so it runs with `GIT_DIR` naming the repository's object store (read only) and `GIT_WORK_TREE` naming the copied tree:

```
$ GIT_DIR=/Users/axelfaes/workspace/ordo/.git GIT_WORK_TREE=<tree> GIT_OPTIONAL_LOCKS=0 python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/land.md .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
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

## Usage, plan 1

The reviewer figures of plan 1's usage table (`.scratch/archive/1-one-layout-for-every-skill/orchestrator-state.md`, Usage) come from the harness's completion notification of each reviewer agent in the session log `/Users/axelfaes/.claude-work/projects/-Users-axelfaes-workspace-ordo/7bdaf343-8a39-4a02-a88f-004137adaa7f.jsonl`. Each notification carries `<usage><subagent_tokens>...</subagent_tokens><tool_uses>...</tool_uses><duration_ms>...</duration_ms></usage>`; minutes are the milliseconds divided by 60000, to one decimal. The line is the log line where the notification first appears (it is repeated on the next lines as the queue removes it). The extraction was a Python scan of every log line holding `task-notification` and `<usage>`.

| step | run | agent | log line | time | tokens | tool uses | duration_ms | minutes |
|---|---|---|---|---|---|---|---|---|
| 2 | first | `ae2a4dc1fca2b5c41` | 1209 | 2026-09-23 12:24:25Z | 76,850 | 17 | 222613 | 3.7 |
| 2 | round 1 | `aa83348746d535b37` | 1303 | 2026-09-23 12:33:17Z | 86,415 | 19 | 278200 | 4.6 |
| 3 | first | `ae0556afba4b88ed8` | 1458 | 2026-09-23 12:44:10Z | 89,514 | 19 | 279255 | 4.7 |
| 3 | round 1 | `ab39dbbb5779bc96c` | 1556 | 2026-09-23 12:56:20Z | 91,423 | 16 | 342283 | 5.7 |
| 4 | first | `a5ec45113e252ff30` | 1738 | 2026-09-23 13:10:23Z | 92,952 | 15 | 238868 | 4.0 |
| 4 | round 1 | `a35e9b45c550573df` | 1788 | 2026-09-23 13:15:31Z | 94,577 | 14 | 210198 | 3.5 |
| 5 | first | `a49cc697088e6d5c0` | 1888 | 2026-09-23 13:25:42Z | 75,951 | 13 | 232285 | 3.9 |
| 5 | round 1 | `a0cafb86e404df5f5` | 1919 | 2026-09-23 13:29:22Z | 77,584 | 16 | 172732 | 2.9 |
| 6 | first | `ac1c3a53be582222e` | 2003 | 2026-09-23 13:36:18Z | 80,568 | 15 | 189060 | 3.2 |
| 6 | round 1 | `adfcd524781181cd2` | 2042 | 2026-09-23 13:41:14Z | 79,004 | 16 | 214765 | 3.6 |
| 7 | first | `a17fef6940e45046f` | 2148 | 2026-09-23 13:48:27Z | 85,010 | 12 | 178553 | 3.0 |
| 7 | round 1 | `a9cee3c52228556ac` | 2224 | 2026-09-23 13:55:05Z | 89,359 | 16 | 209003 | 3.5 |
| 8 | first | `a61ad12fc51de3f20` | 2308 | 2026-09-23 14:02:15Z | 88,124 | 13 | 192034 | 3.2 |
| 8 | round 1 | `a419c311320960f71` | 2340 | 2026-09-23 14:06:37Z | 84,875 | 18 | 164907 | 2.7 |
| 9 | first | `a84a3ab9bc816de73` | 2412 | 2026-09-23 14:11:38Z | 69,187 | 14 | 116118 | 1.9 |
| 9 | round 1 | `a4503bb74f51b0042` | 2452 | 2026-09-23 14:18:20Z | 86,745 | 23 | 263696 | 4.4 |
| 10 | first | `a7aa868018868de2a` | 2531 | 2026-09-23 14:24:43Z | 85,289 | 14 | 154113 | 2.6 |
| 10 | round 1 | `a0ddd939843f57bc6` | 2566 | 2026-09-23 14:27:44Z | 81,729 | 11 | 134017 | 2.2 |
| 11 | first | `a511ce508ba7e7ad2` | 2652 | 2026-09-23 14:33:44Z | 90,401 | 13 | 162274 | 2.7 |
| 11 | round 1 | `ac11d476e6a8828c2` | 2685 | 2026-09-23 14:36:30Z | 72,089 | 13 | 114556 | 1.9 |
| 12 | first | `aa21e7aebca03fa08` | 2746 | 2026-09-23 14:41:11Z | 82,652 | 13 | 140879 | 2.3 |
| 12 | round 1 | `af0ff1fc1eb83461a` | 2779 | 2026-09-23 14:45:46Z | 74,128 | 19 | 155967 | 2.6 |
| 13 | first | `a07b9e5e236082931` | 2920 | 2026-09-23 14:55:27Z | 104,626 | 19 | 292891 | 4.9 |
| 13 | round 1 | `aaca86e2cb4446614` | 2970 | 2026-09-23 14:59:57Z | 77,668 | 16 | 160096 | 2.7 |
| 14 | first | `a91527dedeb90fb93` | 3094 | 2026-09-23 15:05:35Z | 77,290 | 19 | 148896 | 2.5 |
| 14 | round 1 | `a45d30fd76582dccb` | 3133 | 2026-09-23 15:09:10Z | 62,927 | 15 | 119641 | 2.0 |

The worker column says each step was built by the orchestrating session (`executor: inline`), so the build's usage is inside the orchestrator columns, which `usage.py` measured from the step's base commit to its landing.

The "findings sent back" and "fixes at landing" cells are counts read from each step's `agents/reviews/<step>-refuter.md`. A finding is a top-level item under the Spec, Proof, Standards or Behaviour heading that reports a defect; an item that reports none ("none", "Otherwise none", "Checked, no defect found", "The other closures hold" and the like) is not counted, the Not checked items are not counted, and an item that restates a finding listed under another heading counts once, with that finding: the refuter says so ("See Spec 4", "listed under Spec", "the same as Spec 1"), or the item names the same lines and the same defect. "Findings sent back" counts the first run's findings, all sent to repair round 1. "Fixes at landing" counts the findings of the run over round 1 that the report's Closed section closes at landing.

| step | first run: Spec, Proof, Standards, Behaviour | items counted once, with the finding they restate | sent back | run over round 1 | closed at landing | items not counted |
|---|---|---|---|---|---|---|
| 2 | 10, 8, 3, 2 | none | 23 | 9 | 9: 7 by an edit, 2 by the orchestrator's ruling (`__x__` as bold, the test joining the lists) | Behaviour 3 (the check exits 1 on the skills not yet restyled, as stated) |
| 3 | 6, 9, 5, 2 | none | 22 | 7 | 7 | Proof "Inputs handled correctly" |
| 4 | 13, 1, 2, 3 | 4-refuter.md:71 (Spec :47), :72 (Spec :56), :77 (Spec :44), :78 (Spec :45) | 15 | 9 | 9 | Standards "Other checks, none" |
| 5 | 10, 0, 3, 2 | 5-refuter.md:56 (Spec :39, :40), :57 (Spec :44, :45), :58 (Spec :42), :63 (Spec :41) | 11 | 2 | 2 | Proof "none"; Standards 4 (the six references still hold); round "The other closures hold" |
| 6 | 10, 1, 4, 3 | 6-refuter.md:67 (Spec :42), :68 (Spec :43), :69 (Spec :48) | 15 | 6 | 6 | Proof "Otherwise none"; round "Checked, no defect found" |
| 7 | 13, 0, 2, 4 | 7-refuter.md:69 (Spec :46), :71 (Spec :47), :72 (Spec :44) | 16 | 3 | 3 | Proof "none"; round: the ruling carried to land (the closure holds) and "The other closures claimed ... hold" |
| 8 | 9, 0, 2, 4 | 8-refuter.md:57 (Spec :45, :46, :47), :58 (Spec :42), :62 (Spec :41), :63 (Spec :42), :64 (Spec :43), :65 (Spec :44) | 9 | 5 | 5 | Proof "none"; Behaviour 5 (the order is unchanged: none); round "Checked and holding" |
| 9 | 5, 1, 0, 1 | 9-refuter.md:57 (Spec :41) | 6 | 4 | 4: 2 by an edit, 2 by the orchestrator's ruling (a row may name one heading line) | Standards "none"; round: the item on what the check change does not weaken and the Step 3 closure ("No finding here") |
| 10 | 17, 0, 4, 4 | 10-refuter.md:60 (Spec :39 to :42), :61 (Spec :44 to :46), :62 (Spec :47), :67 (Spec :36), :68 (Spec :38), :70 (Spec :37) | 19 | 6 | 6 | Proof "none" |
| 11 | 11, 0, 2, 2 | 11-refuter.md:63 (Spec :48, :49, :53), :64 (Spec :50, :52), :69 (Spec :51) | 12 | 3 | 3 | Proof "none"; round "Closures checked, all hold" |
| 12 | 8, 2, 1, 1 | 12-refuter.md:63 (Spec :45) | 11 | 2 | 2 | Behaviour 2 ("Nothing else found") |
| 13 | 11, 2, 1, 3 | 13-refuter.md:82 (Spec :60), :83 (Spec :58), :84 (Spec :63); round: :138 (Spec :126) | 14 | 3 | 2 by an edit (Spec 1 with Behaviour 1, Standards 1); Proof 1 needed no fix | Proof 3 and Standards 2 (no defect) |
| 14 | 1, 2, 2, 1 | none | 6 | 0 | 0 | Spec 2, Proof 3, Standards 3 and Behaviour 1 (no defect) |

Plan 1's `plan.md` gives the same counts: its booking of step 2 says 23 findings in the first run, and its booking of step 13 says 14 in the first run and 3 in the run over the round, one needing no fix.
