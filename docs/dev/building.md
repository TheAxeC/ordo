# Building and checking Ordo

Ordo has no build step. The green check is every command below passing, each run from the repository root. Each test builds scratch repositories or scratch files under `$TMPDIR` and removes them; none touches the installed skills.

```sh
sh skills/land/templates/land.test.sh                  # land.sh on a conflict, a ledger file left in the worktree, a failing check and a clean landing
sh skills/land/templates/checks.test.sh                # checks.sh on a failing list, a passing list and a state file with no yaml block
sh skills/ordo-init/templates/check_config.test.sh     # check_config.py on complete and broken configurations
sh skills/repo-setup/templates/sync_rules.test.sh      # sync_rules.py on matching and drifted shared-rules and plan-terms blocks, its --write repair, its --only glossary form and its refusals
python3 skills/repo-setup/templates/sync_rules.py . --only glossary   # Ordo's glossary block equals plan-terms.md
sh utils/pin.test.sh                                   # pin.sh in pin and check mode under a scratch HOME, its refusals included
sh utils/check_coverage.test.sh                 # the coverage check on complete and broken coverage lists
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
```

A test that passes prints a last line starting with `PASS:` and exits 0; a failure prints a line starting with `FAIL:` and exits 1. The filter that keeps the summary line is `2>&1 | tail -1`.

`sh skills/land/templates/checks.sh <state file>`, the land skill's runner, runs a plan's verify list from the root of the checkout it checks and needs `python3` with PyYAML and `bash`. It runs each command in order through `bash -o pipefail -c`, prints `$ <command>` and the command's output, and stops at the first command that exits non-zero. A landing books the lines it prints. Its exit status:

- `0`: every command exited 0, and it printed `checks: <n> commands passed`.
- `1`: a command exited non-zero, and it printed `checks: failed with exit <status>: <command>`.
- `2`: it refused before running anything: no argument or more than one, `python3`, PyYAML or `bash` missing, a state file it cannot read, no usable `yaml` block, or a `verify:` list that is missing, empty or holds an item that is not a command.

Each command in a verify list exits non-zero when it fails, as written. A command with long output uses its tool's quiet mode or a filter under `pipefail`, as the `2>&1 | tail -1` filter above runs, so a test that fails makes its pipeline fail.

The last command is the ASCII check over every tracked file and every untracked file git does not ignore: it prints each line holding a character outside printable ASCII (an em or en dash, a curly quote, an arrow, an emoji, a tab) with its file and line number, and exits 0 only when it prints nothing. A file that is not valid UTF-8 makes it exit non-zero: perl either stops with its `Malformed UTF-8 character (fatal)` error or prints the line. The green checkmark is allowed in Markdown files, where the plan ledgers use it as their status marker, and nowhere else.

The figures under `docs/figures/` are written by `python3 docs/figures/gen_figures.py` and committed. A change to a skill's Stops table, to the sequence or to a skill name changes the labels in that script, which is then run again; the script is not part of the verify list.

This page is the list of tests and checks, and says how the committed figures are made; a new script under a skill's `templates/` or under `utils/` adds its test here and to the command block of `docs/dev/change-standard.md`.
