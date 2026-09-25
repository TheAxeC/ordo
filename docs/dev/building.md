# Building and checking Ordo

Ordo has no build step. The green check is every command below passing, each run from the repository root. Each test builds scratch repositories under `$TMPDIR` and removes them; none touches the installed skills.

```sh
sh skills/land/templates/land.test.sh                  # the landing script and usage.py; the example plan.yaml files against the state template
sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
sh skills/plan-retro/templates/collect_findings.test.sh
sh skills/repo-setup/templates/sync_rules.test.sh
sh skills/plan-orchestration/templates/launch.test.sh  # launch.sh with stub builders and a stub launch-note command
sh utils/pin.test.sh
sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify lists
sh utils/check_skill_layout.test.sh             # the layout check on complete and broken SKILL.md files
sh utils/check_rule_inventory.test.sh           # the rule inventory check on complete and broken inventories
sh utils/check_coverage.test.sh                 # the coverage check on complete and broken coverage lists
python3 utils/check_skill_layout.py             # every skills/*/SKILL.md against docs/dev/skill-layout.md
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
```

A test passes when it exits 0 and its last line starts with `PASS:`; a failure prints a line starting with `FAIL:` and exits 1. The filter that keeps the summary line is `2>&1 | tail -1`.

`sh utils/verify.sh <state file>` runs a plan's verify list and needs `python3` with PyYAML, `bash` and `ps`. It runs each command as written through `bash -o pipefail -c`, so a test that exits non-zero in a pipeline into `tail` makes the pipeline fail, and the runner judges the status the whole command returns (a command that consumes a pipeline's status with `!`, `if`, `while`, `||` or `&` passes or fails on what it returns). A command whose text after its last single pipe is `tail` and its options passes only when it also prints a last line starting with `PASS:`. A landing books the lines the runner prints. The runner's exit status:

- `0`: every command passed.
- `1`: a command is red, or the scratch folder cannot be created under `$TMPDIR` (default `/tmp`).
- `64`: no single argument; a state file that cannot be read or is not UTF-8; no `yaml` block, or a first one that is never closed or is not valid YAML; no `verify:` key, a `verify:` key that is not a list, or an empty list; a command that is not a string, is empty or holds a NUL character.
- `69`: `python3`, PyYAML, `bash` or `ps` is missing.
- `128` plus the signal number: INT, HUP, QUIT or TERM stopped the run.

The layout check runs over every `skills/*/SKILL.md` and takes no filter: it prints one `ok: <path>` line per skill that follows `docs/dev/skill-layout.md`, and `<path>:<line>: <what is wrong>` for each error, and passes when it exits 0.

The last command is the ASCII check over every tracked file and every untracked file git does not ignore: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing. The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.

The tests come from the README's Tests section; a new script under a skill's `templates/` or under `utils/` adds its test to both.
