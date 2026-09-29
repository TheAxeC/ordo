Everything in the brief is done.

## Open items of the state file (verbatim)

none

## First run of the cases on the unchanged tree

- Page missing: `ls skills/repo-setup/templates/docs/dev/ui-standard.md` printed "No such file or directory", exit 1.
- WCAG numbers grep: no file, warning printed, no numbers.
- Project-name, ASCII and dash-aside commands: each exited 1 at the `ls`.
- `grep -n 'ui-standard.md'` on typescript.md: no output, exit 1. `grep -c -i 'shared components'` printed 1 (line 48 stated the rule itself).
- `git diff --stat` on typescript.md: empty.
- Design-principles and coding-standards grep for token, colour, contrast, keyboard, focus, catalog: no output, exit 1.
- Reading cases (rules held, WCAG wording, opening, no hard wrapping, no restated rule): the page did not exist, so each failed as the brief says.
- No case was found wrong by the brief's own rules. One constraint noted: the project-name grep is case-insensitive without word bounds, so the letters "ordo", "react" and "vue" may not appear inside any word of the page (for example "according", "coordinate").

## DONE / NOT DONE

| Item | Check | Output | State |
|---|---|---|---|
| 1 page, title, opening, seven rules | read | 11 lines, one paragraph or bullet per line | DONE |
| WCAG numbers | `grep -o -E '[0-9]\.[0-9]\.[0-9]+' ...ui-standard.md \| sort -u` | 1.4.1 1.4.11 1.4.3 2.1.1 2.1.2 2.4.11 2.4.3 2.4.7, one per line | DONE |
| No source project, library or framework | the two greps of Cases | ls printed the path, no hit, exit 0 | DONE |
| ASCII | `ls ... && ! LC_ALL=C grep -n '[^ -~]' ...` | path printed, exit 0 | DONE |
| No dash aside | `ls ... && ! grep -n -E '[^ ] - \|--' ...` | path printed, exit 0 | DONE |
| Length | `wc -l` | 11 skills/repo-setup/templates/docs/dev/ui-standard.md | DONE |
| 2 typescript.md line 48 | `grep -n 'ui-standard.md' ...typescript.md` | 48:- Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`, the check of the shared-controls rule in `docs/dev/ui-standard.md`. | DONE |
| Rule stated once | `grep -c -i 'shared components' ...typescript.md` | 0 | DONE |
| Line 48 only | `git diff --stat -- ...typescript.md` | 1 file changed, 1 insertion(+), 1 deletion(-) | DONE |
| Verify list | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh <state file>` | lines below, exit 0 | DONE |

Lines the runner printed:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '... ASCII check ...'
checks: 8 commands passed
```

The ASCII check printed no offending line. Runner exit status: 0.

## Files

- `skills/repo-setup/templates/docs/dev/ui-standard.md`, new, 11 lines.
- `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md`, line 48 only, 1 insertion and 1 deletion, file length unchanged.
- `.scratch/2-e-grill/agents/reviews/6-report.md`, this report.
- No test added.

## Judgment calls

- Each rule's wording follows the brief's item 1 text for that rule. Sources named by the brief: colour tokens (oculus DESIGN.md line 246, contrast.test.ts line 12), contrast (contrast.test.ts lines 1-12, WCAG 1.4.3, 1.4.11), shared controls (eslint.config.js lines 106-121), styling (allow-styling.ts lines 1-8), keyboard (DESIGN.md lines 263 and 295, WCAG 2.1.1, 2.1.2, 2.4.3, 2.4.7, 2.4.11), text catalog (keys.test.ts lines 1-4, DESIGN.md line 246), colour never the only carrier (WCAG 1.4.1).
- The keyboard rule holds six sentences: the brief's four focus criteria were arranged as separate sentences for 2.1.2 and 2.4.3 and one joined sentence for 2.4.7 and 2.4.11, so the rule stays at the brief's limit of six. "The last four" in its final sentence refers to those four criteria.
- The brief's closing sentence of the colour-tokens rule, "which is checked by reading at review", is kept as the brief gives it.

## Wrong or impossible in the brief

Nothing. The state file's open items are "none".
