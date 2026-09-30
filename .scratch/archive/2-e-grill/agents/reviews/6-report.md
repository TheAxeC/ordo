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

## Repair round 1

Everything in the round brief is done. Old text is the page as sent; new text is the page now, all in `skills/repo-setup/templates/docs/dev/ui-standard.md`.

### Changes, old beside new

| Point | Old | New |
|---|---|---|
| 1 Keyboard, last sentence | The last four are checked by reading at review. | These four criteria are checked by reading at review. |
| 2 Contrast, exemptions | An inactive control and pure decoration are exempt, as WCAG says. | The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype. |
| 3 2.4.3 | Focus moves in reading order (2.4.3). | Focus moves in an order that preserves meaning and operation (2.4.3). |
| 4 2.4.7 | The focused control shows a visible focus indicator (2.4.7) and is never entirely hidden by the page's own content (2.4.11). | Keyboard focus shows a visible focus indicator (2.4.7), and the focused control is never entirely hidden by the page's own content (2.4.11). |
| 5 1.4.1 | A state or a difference shown by colour is also shown by text, a shape or an icon (1.4.1). | A state or a difference shown by colour is also shown by another visual means, such as text, a shape, a pattern or an icon (1.4.1). |
| 6 2.1.1 | Every action a pointer reaches is reachable from the keyboard, unless the action depends on the path the pointer draws (2.1.1). | Every action a pointer performs can be performed from the keyboard, with no timing required between keystrokes, unless the action depends on the path the pointer draws (2.1.1). |
| 7 Contrast, long sentence | ...has a contrast ratio of at least 4.5:1, and 3:1 for large text, which is text of at least 18 point, or 14 point bold (success criterion 1.4.3). | ...has a contrast ratio of at least 4.5:1, and 3:1 for large text (success criterion 1.4.3). Large text is at least 18 point, or 14 point bold. |
| 8 Styling | fails a rule that reaches into a component. | fails a style rule that reaches into a component. |

The Contrast bullet now has six sentences and the Keyboard bullet six; no bullet has more.

### The page as it stands

```
# UI standard

This page holds for every part of the repository a reader sees and operates. The rules below are the concrete form of WCAG 2.2 level AA in this repository, and WCAG 2.2 AA holds in full wherever it asks more than a rule here. Further published standards a design is held to are listed under `design_references` in `.agents/plan.yaml`, and where one of them is stricter than a rule here, it holds. The design principles and the coding standards apply to interface code as to any code, and this page adds to them.

- **Colour tokens.** A colour is written once, as a token in <the token files>. A component, a view and a style use a token, never a colour value written in place (a hex code, an `rgb()` or `hsl()` value, a colour name). <the colour check> fails a colour value outside the token files. A theme overrides token values and nothing else, which is checked by reading at review.
- **Contrast.** Every pair of a text colour and the background it can be painted on, under every theme, has a contrast ratio of at least 4.5:1, and 3:1 for large text (success criterion 1.4.3). Large text is at least 18 point, or 14 point bold. The visual information that identifies a control and its state, a graphic that carries meaning, and the focus indicator have at least 3:1 against what surrounds them (1.4.11). The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype. <the contrast check> computes each text pair and each non-text pair from the tokens and fails one below its threshold. A failure is fixed in the token's value, never by lowering the threshold.
- **Colour is never the only carrier.** A state or a difference shown by colour is also shown by another visual means, such as text, a shape, a pattern or an icon (1.4.1). This is checked by reading at review.
- **Shared controls.** A view draws every control a reader presses (a button, a text field, a select, a text area) with the repository's shared components, which carry the theme's look, the focus indicator and the keys. <the element check> fails a raw control element in a view. Where a language page names a lint for this rule, that lint is <the element check>.
- **Styling a shared component.** A view never styles a class a shared component declares as its own. A difference the view needs is a property or a token of the component, and <the styling check> fails a style rule that reaches into a component.
- **Keyboard.** Every action a pointer performs can be performed from the keyboard, with no timing required between keystrokes, unless the action depends on the path the pointer draws (2.1.1). <the keyboard tests> press the keys of each action. Focus is never trapped (2.1.2). Focus moves in an order that preserves meaning and operation (2.4.3). Keyboard focus shows a visible focus indicator (2.4.7), and the focused control is never entirely hidden by the page's own content (2.4.11). These four criteria are checked by reading at review.
- **Text from the catalog.** Every string a reader sees comes from <the text catalog>, never a literal in a component. <the catalog check> fails a key a component names that the catalog lacks and a catalog key nothing reaches. A literal string a reader sees in a component is checked by reading at review.
```

### Point 9, the checks runner, full output

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, exit 0:

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 8 commands passed
```

### Grep cases and length, rerun after the changes (F = skills/repo-setup/templates/docs/dev/ui-standard.md, T = skills/repo-setup/templates/docs/dev/coding-standards/typescript.md)

```
$ grep -o -E '[0-9]\.[0-9]\.[0-9]+' F | sort -u
1.4.1
1.4.11
1.4.3
2.1.1
2.1.2
2.4.11
2.4.3
2.4.7
$ ls F && ! grep -n -i -E 'cathedra|game-engine|oculus|research-hub|ordo|cockpit|svelte|react|vue|eslint|tailwind' F && ! grep -n -i -w -E 'rite|curia|monastery|missal' F
skills/repo-setup/templates/docs/dev/ui-standard.md   (exit 0)
$ ls F && ! LC_ALL=C grep -n '[^ -~]' F
skills/repo-setup/templates/docs/dev/ui-standard.md   (exit 0)
$ ls F && ! grep -n -E '[^ ] - |--' F
skills/repo-setup/templates/docs/dev/ui-standard.md   (exit 0)
$ grep -n 'ui-standard.md' T
48:- Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`, the check of the shared-controls rule in `docs/dev/ui-standard.md`.
$ grep -c -i 'shared components' T
0
$ git diff --stat -- T
 skills/repo-setup/templates/docs/dev/coding-standards/typescript.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ wc -l F
      11 skills/repo-setup/templates/docs/dev/ui-standard.md
$ grep -c ';' F
0
```

### Point 11, `typescript.md` line 48, before and after

Before (`git show HEAD:T | sed -n 48p`):

```
- A view draws its controls with the repository's shared components. Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`.
```

After (`sed -n 48p T`):

```
- Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`, the check of the shared-controls rule in `docs/dev/ui-standard.md`.
```

The TypeScript page no longer states the shared-controls rule itself and depends on the UI page being installed with it; how step 7 installs the two together is carried to step 7 in `plan.md`.

### Point 10, the reading cases

The normative text below was fetched with `curl -sL https://www.w3.org/TR/WCAG22/` and read from the page (the definition of "large-scale" text from its glossary entry).

| Reading case | Evidence | Result |
|---|---|---|
| Every rule of item 1 present, each with a placeholder check or "checked by reading at review" | Read lines 5 to 11 of the page against item 1's seven rules: Colour tokens has <the colour check> and "checked by reading at review" for the theme rule; Contrast <the contrast check>; Colour is never the only carrier "checked by reading at review"; Shared controls <the element check>; Styling <the styling check>; Keyboard <the keyboard tests> and "checked by reading at review"; Text from the catalog <the catalog check> and "checked by reading at review" | met |
| No hard wrapping, no semicolon run | Each paragraph and bullet is one line (`wc -l` 11: title, 3 blank lines, opening, 7 bullets); `grep -c ';'` prints 0 | met |
| Opening | Read line 3 against the brief's opening: names WCAG 2.2 level AA as the form the rules take, WCAG 2.2 AA holds in full wherever it asks more, names `design_references` in `.agents/plan.yaml`, says a stricter listed standard holds, and states no default | met |
| No rule of the design principles or the coding standards restated | Read every sentence of the page against `design-principles.md` (all ten principles) and `coding-standards/common.md` (all nine bullets): the page holds nothing on layers, interfaces, globals, file or folder size, formatters, comments, ASCII, names, errors or tests; "Colour tokens" and "Styling a shared component" are UI forms of "Do not repeat yourself" and "Single responsibility" and copy no sentence of them | met |
| 1.4.1, level A | WCAG: "Color is not used as the only visual means of conveying information, indicating an action, prompting a response, or distinguishing a visual element." Page: "A state or a difference shown by colour is also shown by another visual means, such as text, a shape, a pattern or an icon (1.4.1)." | met |
| 1.4.3, level AA | WCAG: "The visual presentation of text and images of text has a contrast ratio of at least 4.5:1, except for the following: Large Text: Large-scale text and images of large-scale text have a contrast ratio of at least 3:1; Incidental: Text or images of text that are part of an inactive user interface component, that are pure decoration, that are not visible to anyone, or that are part of a picture that contains significant other visual content, have no contrast requirement. Logotypes: Text that is part of a logo or brand name has no contrast requirement." Large-scale: "at least 18 point or 14 point bold". Page: "...4.5:1, and 3:1 for large text (success criterion 1.4.3). Large text is at least 18 point, or 14 point bold." and "The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype." | met |
| 1.4.11, level AA | WCAG: "The visual presentation of the following have a contrast ratio of at least 3:1 against adjacent color(s): User Interface Components: Visual information required to identify user interface components and states, except for inactive components or where the appearance of the component is determined by the user agent and not modified by the author; Graphical Objects: Parts of graphics required to understand the content, except when a particular presentation of graphics is essential to the information being conveyed." Page: "The visual information that identifies a control and its state, a graphic that carries meaning, and the focus indicator have at least 3:1 against what surrounds them (1.4.11)." The focus indicator falls under the states of a component, as the reviewer's report read from W3C's Understanding 1.4.11 | met |
| 2.1.1, level A | WCAG: "All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes, except where the underlying function requires input that depends on the path of the user's movement and not just the endpoints." Page: "Every action a pointer performs can be performed from the keyboard, with no timing required between keystrokes, unless the action depends on the path the pointer draws (2.1.1)." | met |
| 2.1.2, level A | WCAG: "If keyboard focus can be moved to a component of the page using a keyboard interface, then focus can be moved away from that component using only a keyboard interface, and, if it requires more than unmodified arrow or tab keys or other standard exit methods, the user is advised of the method for moving focus away." Page: "Focus is never trapped (2.1.2)." The advice-to-the-user clause is bound by the opening's sentence that WCAG 2.2 AA holds in full | met |
| 2.4.3, level A | WCAG: "If a web page can be navigated sequentially and the navigation sequences affect meaning or operation, focusable components receive focus in an order that preserves meaning and operability." Page: "Focus moves in an order that preserves meaning and operation (2.4.3)." | met |
| 2.4.7, level AA | WCAG: "Any keyboard operable user interface has a mode of operation where the keyboard focus indicator is visible." Page: "Keyboard focus shows a visible focus indicator (2.4.7)" | met |
| 2.4.11, level AA | WCAG: "When a user interface component receives keyboard focus, the component is not entirely hidden due to author-created content." Page: "...the focused control is never entirely hidden by the page's own content (2.4.11)." | met |
