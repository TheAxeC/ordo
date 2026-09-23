# Building and checking Ordo

Ordo has no build step. The green check is every test below passing, each run from the repository root. Each test builds scratch repositories under `$TMPDIR` and removes them; none touches the installed skills.

```sh
sh skills/land/templates/land.test.sh                  # the landing script and usage.py; the example plan.yaml files against the state template
sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh utils/pin.test.sh
! LC_ALL=C grep -rnI --exclude-dir=.git --exclude-dir=.agents '[^ -~]' .
```

A test passes when it exits 0 and its last line starts with `PASS:`; a failure prints a line starting with `FAIL:` and exits 1. The filter that keeps the summary line is `2>&1 | tail -1`.

The last command is the ASCII check over every tracked and untracked text file outside `.git/` and `.agents/`: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing.

The tests come from the README's Tests section; a new script under a skill's `templates/` or under `utils/` adds its test to both.
