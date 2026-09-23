# Building and checking Ordo

Ordo has no build step. The green check is every test below passing, each run from the repository root. Each test builds scratch repositories under `$TMPDIR` and removes them; none touches the installed skills.

```sh
sh skills/land/templates/land.test.sh                  # the landing script and usage.py; the example plan.yaml files against the state template
sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh utils/pin.test.sh
sh utils/check_skill_layout.test.sh             # the layout check on complete and broken SKILL.md files
sh utils/check_rule_inventory.test.sh           # the rule inventory check on complete and broken inventories
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
```

A test passes when it exits 0 and its last line starts with `PASS:`; a failure prints a line starting with `FAIL:` and exits 1. The filter that keeps the summary line is `2>&1 | tail -1`.

The last command is the ASCII check over every tracked file and every untracked file git does not ignore: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing. The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.

The tests come from the README's Tests section; a new script under a skill's `templates/` or under `utils/` adds its test to both.
