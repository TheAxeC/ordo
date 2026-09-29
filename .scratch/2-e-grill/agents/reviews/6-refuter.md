# Step 6 refuter report (on .agents/worktrees/2e-6, base 425af4f88e863f227b63280b45ae1083d4aa4087)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in a template page keeps its `file:line`, since the page is the step's output.

## Verification (rerun by the reviewer)

From the worktree root, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md`, exit 0:

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

The brief's case commands and "Verify before you report", rerun in the worktree (F = skills/repo-setup/templates/docs/dev/ui-standard.md):

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
skills/repo-setup/templates/docs/dev/ui-standard.md        (rc=0)
$ ls F && ! LC_ALL=C grep -n '[^ -~]' F
skills/repo-setup/templates/docs/dev/ui-standard.md        (rc=0)
$ ls F && ! grep -n -E '[^ ] - |--' F
skills/repo-setup/templates/docs/dev/ui-standard.md        (rc=0)
$ grep -n 'ui-standard.md' skills/repo-setup/templates/docs/dev/coding-standards/typescript.md
48:- Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`, the check of the shared-controls rule in `docs/dev/ui-standard.md`.
$ grep -c -i 'shared components' skills/repo-setup/templates/docs/dev/coding-standards/typescript.md
0
$ git diff --stat -- skills/repo-setup/templates/docs/dev/coding-standards/typescript.md
 skills/repo-setup/templates/docs/dev/coding-standards/typescript.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ wc -l F
      11 skills/repo-setup/templates/docs/dev/ui-standard.md
$ grep -c ';' F
0
$ LC_ALL=C grep -n '[^ -~]' F skills/repo-setup/templates/docs/dev/coding-standards/typescript.md
(no output, rc=1)
$ git status --short
 M skills/repo-setup/templates/docs/dev/coding-standards/typescript.md
?? .scratch/2-e-grill/agents/reviews/6-report.md
?? skills/repo-setup/templates/docs/dev/ui-standard.md
```

On the unchanged tree (base 425af4f): `git show 425af4f...:skills/repo-setup/templates/docs/dev/ui-standard.md` printed "fatal: path ... exists on disk, but not in '425af4f...'"; on the base `typescript.md`, `grep -n 'ui-standard.md'` printed nothing (rc=1) and `grep -c -i 'shared components'` printed `1`. This reproduces the report's first run.

The builder's report and its worktree copy are identical (`diff` rc=0). Every command the report quotes as evidence gives the output the report states, except the quoted form of the ASCII command (Proof 1).

WCAG 2.2: fetched `https://www.w3.org/TR/WCAG22/` with curl and read the normative text of every cited criterion and the definition "large scale (text)". Also fetched W3C's Understanding documents for 1.4.11 and 2.4.3.

## Verdicts

Items of the brief's "What to build":

- 1: violated, in the Keyboard bullet only (Spec 1). The title, the opening paragraph and the Colour tokens, Contrast, Colour-is-never-the-only-carrier, Shared controls, Styling and Text-from-the-catalog bullets carry item 1's text word for word, read against the brief. Each placeholder check is inside its rule's sentence. The page is 11 lines, no rule has more than six sentences, and there are no semicolons.
- 2: holds. `typescript.md:48` is the brief's line exactly, and the diff stat shows 1 insertion and 1 deletion.

Cases of the brief's "Cases":

- Every rule of item 1 present, each with a placeholder check or "checked by reading at review": met, by reading lines 5 to 11.
- Each cited criterion's wording and level match WCAG 2.2: partial. All eight criteria are level A or AA (1.4.1 A, 1.4.3 AA, 1.4.11 AA, 2.1.1 A, 2.1.2 A, 2.4.3 A, 2.4.7 AA, 2.4.11 AA, from the fetched text). Five wordings attribute more or less to a criterion than the criterion asks: Spec 2 to Spec 6.
- The opening names WCAG 2.2 AA, `design_references` and the stricter-standard rule, and states no default: met, line 3.
- WCAG numbers grep: met.
- No source project, library or framework: met.
- ASCII: met.
- No dash aside: met.
- No hard wrapping and no semicolon run: met. The page has 11 lines, each paragraph or bullet is one line, and `grep -c ';'` prints 0.
- `typescript.md` cites the page and does not state the rule: met.
- `typescript.md` changes on line 48 only: met.
- No rule of `design-principles.md` or `coding-standards/common.md` restated: met, by reading both pages whole against every sentence of the UI page. "Colour tokens" is a colour-specific form of "Do not repeat yourself", and "Styling a shared component" is a UI form of "Single responsibility". Neither copies their text. `common.md` holds nothing on colour, contrast, controls, keys or text catalogs.
- On the unchanged tree every case fails: met (the base commands above).

## 1. Spec

1. `ui-standard.md:10`, Keyboard: "Focus is never trapped (2.1.2). Focus moves in reading order (2.4.3). The focused control shows a visible focus indicator (2.4.7) and is never entirely hidden by the page's own content (2.4.11). The last four are checked by reading at review."
   - What is wrong: item 1 gives the four focus criteria in one sentence followed by "These four are checked by reading at review." The builder split them into three sentences and wrote "The last four". The last four sentences of the bullet are "<the keyboard tests> press the keys of each action", the 2.1.2 sentence, the 2.4.3 sentence and the joined 2.4.7/2.4.11 sentence. Read that way, "The last four" puts the keyboard-tests sentence under reading and leaves one of the four criteria uncovered. The report admits the words refer to criteria and not sentences ("'The last four' in its final sentence refers to those four criteria"), but the page does not say so.
   - Failure scenario: a reviewer holding a diff to the page counts the last four sentences, takes the 2.1.1 key-pressing tests as checked by reading, and accepts a view whose action has no keyboard test.
   - Suggested wording: "These four criteria are checked by reading at review."
   - Verdict: item 1 violated.

2. `ui-standard.md:6`, Contrast: "An inactive control and pure decoration are exempt, as WCAG says."
   - What is wrong: WCAG's exemptions are wider than these two. 1.4.3 also exempts text "not visible to anyone", text "part of a picture that contains significant other visual content", and "Logotypes: Text that is part of a logo or brand name has no contrast requirement". 1.4.11 also exempts components "where the appearance of the component is determined by the user agent and not modified by the author", and graphics "when a particular presentation of graphics is essential". Writing "as WCAG says" presents this two-item list as WCAG's list, which attributes to 1.4.3 and 1.4.11 more than they ask.
   - Failure scenario: a repository's contrast check, written to the page, fails a brand logotype's colour pair. The next sentence ("fixed in the token's value, never by lowering the threshold") then makes the author change the brand colour, which WCAG does not require.
   - The sentence is item 1's dictated text, so closing it changes the brief's wording, for example "The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype."
   - Verdict: WCAG-wording case partial.

3. `ui-standard.md:10`, Keyboard: "Focus moves in reading order (2.4.3)."
   - What is wrong: 2.4.3 reads "If a web page can be navigated sequentially and the navigation sequences affect meaning or operation, focusable components receive focus in an order that preserves meaning and operability." W3C's Understanding 2.4.3 says "the focus order may not be identical to the programmatically determined reading order ... as long as the user can still understand and operate the web page". "Reading order" therefore asks more than 2.4.3 and drops its condition.
   - Failure scenario: a reviewer rejects a dialog or a toolbar whose focus order preserves meaning but differs from reading order, citing 2.4.3, which permits it.
   - This is the brief's dictated text. The fix is "Focus moves in an order that preserves meaning and operation (2.4.3)."
   - Verdict: WCAG-wording case partial.

4. `ui-standard.md:10`, Keyboard: "The focused control shows a visible focus indicator (2.4.7)".
   - What is wrong: 2.4.7 reads "Any keyboard operable user interface has a mode of operation where the keyboard focus indicator is visible." The page requires an indicator on every focused control in every mode. That includes focus set by a pointer, which 2.4.7 does not cover.
   - Failure scenario: a reviewer rejects a shared control that shows its ring on keyboard focus only (the common focus-visible pattern) as a 2.4.7 violation, although it meets 2.4.7.
   - This is the brief's dictated text. The fix is "Keyboard focus shows a visible focus indicator (2.4.7)."
   - Verdict: WCAG-wording case partial.

5. `ui-standard.md:7`, "A state or a difference shown by colour is also shown by text, a shape or an icon (1.4.1)."
   - What is wrong: 1.4.1 reads "Color is not used as the only visual means of conveying information, indicating an action, prompting a response, or distinguishing a visual element." Any other visual means satisfies it, including an underline, a pattern, position, or a difference in lightness. The page's closed list of three attributes a narrower rule to 1.4.1.
   - Failure scenario: a reviewer rejects a chart whose series differ by colour and line pattern, or a link marked by colour and underline, because neither a pattern nor an underline is "text, a shape or an icon".
   - This is the brief's dictated text. The fix is "is also shown by another visual means, such as text, a shape, a pattern or an icon (1.4.1)."
   - Verdict: WCAG-wording case partial.

6. `ui-standard.md:10`, Keyboard: "Every action a pointer reaches is reachable from the keyboard, unless the action depends on the path the pointer draws (2.1.1)."
   - What is wrong: 2.1.1 reads "All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes". The page drops the timing requirement, so it attributes less to 2.1.1 than 2.1.1 asks. The opening's sentence that WCAG 2.2 AA holds in full binds the timing requirement, but the rule citing 2.1.1 reads as the whole of it. "Reachable" is also weaker than WCAG's "operable": an action can be reached and still not be performed.
   - Failure scenario: a reviewer accepts a control that works only with a timed key chord, since the rule citing 2.1.1 says nothing about timing.
   - This is the brief's dictated text. The fix is "Every action a pointer performs can be performed from the keyboard, with no keystroke timed, unless ...".
   - Verdict: WCAG-wording case partial.

The findings a reviewer is asked to look for that the diff does not show:
- No change outside the brief's items.
- No dependency added.
- No decision reserved for the user taken.
- Every premise of "What is on the tree" was checked. `ls` of the dev folder, the `typescript.md:48` text, the `design_references` lines in `plan.yaml:25`, `check_config.py:160-162` and `ordo-init/SKILL.md:71` each reproduce, by grep. The oculus source lines were not reread (Declined to judge).

## 2. Proof

1. `.scratch/2-e-grill/agents/reviews/6-report.md`, "DONE / NOT DONE", the runner's lines: "$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '... ASCII check ...'".
   - What is wrong: the report says these are the "Lines the runner printed", but this line is abbreviated. The runner prints the full perl command. The change standard's "Commands and their filters" says the report "quotes the lines the runner printed". No decision rests on it: my rerun shows the same 8 passes.
   - Failure scenario: a reader of the booking cannot confirm from the quote that the ASCII check which ran is the one in the verify list.

2. The report, "DONE / NOT DONE": the reading cases have no row or evidence.
   - What is wrong: the report gives no evidence for the WCAG-wording case (no fetch of WCAG 2.2, no criterion text quoted), nor for the no-restatement and opening cases. Its table has one row for item 1, "read". Its first line says "Everything in the brief is done". My reading of WCAG 2.2 finds that case partial (Spec 2 to 6).
   - Failure scenario: the orchestrator reads "done" and lands the page as meeting the WCAG-wording case, and Axel reads rules that misstate four criteria.

## 3. Standards

1. `ui-standard.md:6`, Contrast: "Every pair of a text colour and the background it can be painted on, under every theme, has a contrast ratio of at least 4.5:1, and 3:1 for large text, which is text of at least 18 point, or 14 point bold (success criterion 1.4.3)."
   - What is wrong: this is one sentence of about 45 words holding three ideas: the pairs, the two thresholds and the definition of large text. The prose standard, section E "Sentence length", asks for under roughly 20 words unless the mechanism needs more. The wording is the brief's.
   - Failure scenario: a reader filling in the contrast check misreads which pairs get 3:1. Two sentences would remove that risk: one for the 4.5:1 and 3:1 thresholds, and one saying large text is at least 18 point, or 14 point bold.

2. `ui-standard.md:9`, Styling: "<the styling check> fails a rule that reaches into a component."
   - What is wrong: on this page "rule" names the page's own rules ("a rule here", line 3). Here it means a style rule. The prose standard, section D, asks for one term per concept.
   - Failure scenario: a reader takes "a rule that reaches into a component" as one of the page's rules and cannot tell what the styling check fails. "a style rule" closes it. The wording is the brief's.

The standards findings a reviewer is asked to look for that the diff does not show:
- No non-ASCII in the touched files.
- No history in the new text.
- No hard wraps, no dash asides and no semicolons.
- No secret appears in any quoted line.
- No sentence elsewhere is made false: `git grep -n -i -E 'ui-standard|ui standard|UI page'` and `git grep -n 'shared.controls\|no-restricted-html-elements'` outside `.scratch` hit only `docs/roadmap.md:24` (which the page makes true) and `typescript.md:48`.
- The page says nothing false against the tree. `design_references` is a key of `.agents/plan.yaml` (`skills/plan/templates/plan.yaml:25`, `plan.projects.yaml:27,51`, `check_config.py:160-162`). The page states no default for it. The language pages it refers to exist under `docs/dev/coding-standards/`, and `typescript.md:48` names the lint.

## 4. Behaviour

1. `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md:48`, the report's "Files": "line 48 only, 1 insertion and 1 deletion".
   - What is wrong: the line is text that installed repositories read. The report does not give the before and after, as the change standard's rule 7 asks for every user-visible change.
   - Before: "A view draws its controls with the repository's shared components. Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw ..."
   - After: "Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw ..., the check of the shared-controls rule in `docs/dev/ui-standard.md`."
   - Failure scenario: a reader of the booking does not see that the TypeScript page no longer states the rule itself and now depends on the UI page being installed. That dependency is carried to step 7 in `plan.md`.

## Declined to judge

- Whether the page's three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog), and its added thresholds, belong on the page. The brief's decision 3 leaves this to Axel's reading.
- Whether the uncited AA criteria (1.4.4, 1.4.10, 2.5.8, 4.1.2) should get rules of their own. This is Axel's call per decision 3.
- Whether "every pair of a text colour and the background it can be painted on" is the strictness Axel wants beyond 1.4.3's "visual presentation of text". It is a design choice, not a misattribution, so it is his reading.
- The oculus source lines the brief cites (`eslint.config.js`, `contrast.test.ts`, `keys.test.ts`, `allow-styling.ts`, `DESIGN.md`) were not reread in this review. The brief check reproduced them and the page names no source, so no claim of the diff rests on them.
- That a focus indicator's 3:1 falls under 1.4.11 is taken from W3C's Understanding 1.4.11 ("the visual focus indicator for a component must have sufficient contrast against the adjacent background"), fetched through WebFetch's summary and not from the raw page.
- Spec 2 to 6 and Standards 1 and 2 are in text item 1 of the brief dictated word for word. Whether they are closed in a repair round or at landing, as a change to the brief's wording, is the orchestrator's call.

Agent usage: (left for the orchestrator)

## Repair round 1, refuted

Worktree `.agents/worktrees/2e-6`, base `425af4f88e863f227b63280b45ae1083d4aa4087`. The round's delta was computed against `6-round-0.diff`. `diff` of the round-0 page against the current page prints `6,7c6,7` and `9,10c9,10`. The `typescript.md` hunk is byte-identical to round 0 (`TS_SAME`). `git status --short` shows ` M ...typescript.md`, `?? .scratch/2-e-grill/agents/reviews/6-report.md` and `?? ...ui-standard.md`. The main-checkout copy of the report and the worktree copy are identical (`diff` printed nothing, `SAME`).

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
exit=0
```

The brief's grep cases and the commands the report quotes, rerun from the worktree root (F = `skills/repo-setup/templates/docs/dev/ui-standard.md`, T = `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md`):

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
$ ls F && ! grep -n -i -E 'cathedra|...|tailwind' F && ! grep -n -i -w -E 'rite|curia|monastery|missal' F
skills/repo-setup/templates/docs/dev/ui-standard.md
rc=0
$ ls F && ! LC_ALL=C grep -n '[^ -~]' F
skills/repo-setup/templates/docs/dev/ui-standard.md
rc=0
$ ls F && ! grep -n -E '[^ ] - |--' F
skills/repo-setup/templates/docs/dev/ui-standard.md
rc=0
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
$ LC_ALL=C grep -n '[^ -~]' F T
nonascii rc=1
$ git rev-parse HEAD; git show HEAD:T | sed -n 48p
425af4f88e863f227b63280b45ae1083d4aa4087
- A view draws its controls with the repository's shared components. Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`.
$ git show 425af4f...:F     (unchanged tree)
fatal: path 'skills/repo-setup/templates/docs/dev/ui-standard.md' exists on disk, but not in '425af4f88e863f227b63280b45ae1083d4aa4087'
$ git show 425af4f...:T | grep -c -i 'shared components'
1
$ grep -n -i -E 'token|colou?r|contrast|keyboard|focus|catalog' .../coding-standards/*.md .../design-principles.md
rc=1
$ git grep -n -i -E 'ui-standard|shared.controls|no-restricted-html-elements' -- ':!.scratch'
skills/repo-setup/templates/docs/dev/coding-standards/typescript.md:48:... (the line above)
```

(The project-name command ran in full as the brief writes it. It is shortened here only.)

The brief's premises reproduce. `ls` of the dev folder and the coding-standards folder lists the pages the brief names. `plan.yaml:25` reads `design_references: []  # optional, default []. Published standards a design is held to, such as WCAG 2.2 AA; ...`, and `check_config.py:160-162` validates the key as a list of text.

WCAG 2.2 was fetched with `curl -sL https://www.w3.org/TR/WCAG22/` (512457 bytes) and the text of each cited criterion extracted:
- 1.4.1 is Level A. 1.4.3 is Level AA. 1.4.11 is Level AA. 2.1.1 is Level A. 2.1.2 is Level A. 2.4.3 is Level A. 2.4.7 is Level AA. 2.4.11 is Level AA.
- Every WCAG sentence the report quotes in its Point 10 table matches the fetched normative text word for word. The large-scale definition fragment "at least 18 point or 14 point bold" is accurate; it omits the CJK clause.
- The page states: "Introductory material, appendices, sections marked as "non-normative", diagrams, examples, and notes are informative (non-normative)."

Also fetched with curl: W3C's Understanding pages for 1.4.11, 2.4.7 and 2.1.1.
- Understanding 1.4.11: "the visual focus indicator for a component must have sufficient contrast against the adjacent background when the component is focused". This confirms the page's 1.4.11 attribution of the focus indicator.
- Understanding 2.1.1: "Examples of "specific timings for individual keystrokes" include situations where a user would be required to repeat or execute multiple keystrokes within a short period of time or where a key must be held down for an extended period before the keystroke is registered."
- Understanding 2.4.7: "In most cases there is only one mode of operation so this success criterion applies."

### Closures claimed, checked against the first report and the round's rulings

- Spec 1: closed. Line 10 ends with "These four criteria are checked by reading at review.", the ruling's wording.
- Spec 2: the ruling's sentence is in place, but the finding's failure scenario is still reachable. See Spec 2 below.
- Spec 3: closed. "Focus moves in an order that preserves meaning and operation (2.4.3)." matches the normative text.
- Spec 4: closed with the ruling's wording. See Declined to judge for the "mode of operation" clause.
- Spec 5: closed. The ruling's wording is in place and matches 1.4.1's "only visual means".
- Spec 6: partial. "Reachable" became "performed", and the ruling's timing clause was added verbatim, but that clause is narrower than 2.1.1. See Spec 1 below.
- Standards 1: closed. The sentence is split into two, as ruled.
- Standards 2: closed. The text now reads "fails a style rule".
- Proof 1: closed. The report's runner quote now equals my runner output line for line, the full perl command included.
- Proof 2: rows added, and every WCAG quote verified. The 2.1.1 row's "met" is not reproduced; see Proof 1 below.
- Behaviour 1: closed. The before line is reproduced by `git show HEAD:T | sed -n 48p` with HEAD at the base, and the after line by `grep -n`.
- No closure removed a check. The delta touches lines 6, 7, 9 and 10 only, and each change maps to a round point. There is no change beyond the rulings.
- The Contrast bullet and the Keyboard bullet have six sentences each, counted by reading.

### Verdicts (whole diff since the base)

Items of the brief's "What to build", with item 1's dictated text as replaced by the round's rulings:
- 1: holds. By reading, the title, the opening and all seven bullets carry the text of item 1 and of rulings 1 to 8 word for word. Each check placeholder sits inside its rule's sentence. The page is 11 lines (`wc -l`), has 0 semicolons, and no bullet has more than six sentences. The defects in the dictated wording are recorded against the cases (Spec 1 and Spec 2).
- 2: holds. `grep -n` prints the brief's line at 48. `git diff --stat` shows 1 insertion and 1 deletion. `grep -c -i 'shared components'` prints 0.

Cases of the brief's "Cases":
- Every rule of item 1 present, each with its check as a placeholder or "checked by reading at review": met, by reading lines 5 to 11.
- Each cited criterion's wording and level match WCAG 2.2: partial. All eight criteria are level A or AA per the fetched text. Six of them (1.4.1, 1.4.11, 2.1.2, 2.4.3, 2.4.7, 2.4.11) are worded within their criterion. Two are not:
  - 2.1.1 attributes less than the criterion asks (Spec 1).
  - The contrast check's sentence still fails exempt pairs under 1.4.3 and 1.4.11 (Spec 2).
- The opening names WCAG 2.2 AA and `design_references` and says a stricter listed standard holds, with no default stated: met, by reading line 3.
- WCAG numbers grep: met. It prints the eight numbers and nothing else.
- No source project, library or framework: met (rc=0).
- ASCII: met (rc=0).
- No dash aside: met (rc=0).
- No hard wrapping and no semicolon run: met. 11 lines, one paragraph or bullet per line, `grep -c ';'` prints 0.
- The shared-controls rule is stated on the UI page only, and `typescript.md:48` cites the page: met.
- `typescript.md` changes on line 48 only: met.
- No rule of `design-principles.md` or `coding-standards/common.md` restated: met. By reading, the four sentences changed in this round state WCAG thresholds and focus rules, and neither page holds anything on those. The first run's reading of the unchanged lines stands, and my grep over both pages for token, colour, contrast, keyboard, focus and catalog returns rc=1.
- On the unchanged tree every case fails: met. `git show` of F at the base fails, and the base `typescript.md` gives `shared components` count 1 and no `ui-standard.md` hit.

## 1. Spec

1. `ui-standard.md:10`, Keyboard: "Every action a pointer performs can be performed from the keyboard, with no timing required between keystrokes, unless the action depends on the path the pointer draws (2.1.1)."
   - What is wrong: 2.1.1 reads "without requiring specific timings for individual keystrokes". Understanding 2.1.1 gives two examples of such timing: keystrokes within a short period, and "a key must be held down for an extended period before the keystroke is registered". "Between keystrokes" covers only the first. So the rule that cites 2.1.1 asks less than 2.1.1 asks.
   - This is the round ruling's point 6 wording, which the builder applied verbatim. It closes the first report's Spec 6 only in part.
   - Failure scenario: a reviewer holding a diff to the page accepts a control that activates only when Space is held for two seconds. No timing "between keystrokes" is involved, so the rule as written passes it, and 2.1.1 fails it.
   - Fix: "with no specific timing required for any keystroke" (or "no keystroke timed, held or repeated").
   - Verdict: the WCAG-wording case is partial.

2. `ui-standard.md:6`, Contrast: "The exemptions of 1.4.3 and 1.4.11 hold, such as an inactive control, pure decoration and a logotype. <the contrast check> computes each text pair and each non-text pair from the tokens and fails one below its threshold. A failure is fixed in the token's value, never by lowering the threshold."
   - What is wrong: the ruled exemption sentence now stands, but the next two sentences are unchanged. The check still computes every text pair and fails any pair below its threshold, and the only permitted repair is the token's value.
   - The first report's failure scenario for its Spec 2 is therefore still reachable: a logotype pair fails the check, and the page tells the author to change the brand colour. The page now states the exemption and, one sentence later, a check that does not honour it.
   - Failure scenario: a repository whose brand token pair is 2.8:1 writes its contrast check to the page, the check fails the logotype pair, and the author either changes the brand colour, which 1.4.3 does not require, or cannot tell which of the two sentences governs.
   - Fix: "<the contrast check> computes each text pair and each non-text pair from the tokens, leaving out the pairs an exemption covers, and fails one below its threshold."
   - Verdict: the WCAG-wording case is partial.

The other Spec findings a reviewer looks for are not in the diff. The delta changes only the four lines the rulings name. No dependency is added. No decision reserved for Axel is taken.

## 2. Proof

1. `6-report.md`, "Repair round 1", "Point 10, the reading cases", the row "2.1.1, level A ... met".
   - What is wrong: the row quotes 2.1.1 correctly and then marks "met" the page sentence "with no timing required between keystrokes". My reading against the normative text and Understanding 2.1.1 does not reproduce "met" (Spec 1).
   - The decision that rests on it is whether the WCAG-wording case counts as met at landing.
   - Failure scenario: the orchestrator reads the table as all met and lands the page with the 2.1.1 narrowing, and Axel reads a rule that states less than the criterion it cites.
   - Verdict: the WCAG-wording case is partial.

Every other quoted command reproduces its stated output: the runner's lines, the grep cases, `wc -l`, `grep -c ';'`, and the before and after of line 48.

## 3. Standards

1. `ui-standard.md:3`, the opening: "Further published standards a design is held to are listed under `design_references` in `.agents/plan.yaml`, and where one of them is stricter than a rule here, it holds."
   - Also on line 3: "The rules below are the concrete form of WCAG 2.2 level AA in this repository, and WCAG 2.2 AA holds in full wherever it asks more than a rule here." (30 words).
   - Also `ui-standard.md:9`: "A difference the view needs is a property or a token of the component, and <the styling check> fails a style rule that reaches into a component." (27 words).
   - What is wrong: each of these sentences joins two independent ideas with ", and" and runs 27 to 30 words. The prose standard's section E "Sentence length" asks for under roughly 20 words unless the mechanism needs more, and here only the conjunction makes them long.
   - In the first sentence, "it holds" has two candidate antecedents, "one of them" and the nearer "a rule here".
   - This text is from round 0 and was dictated by the brief. The first report did not raise it.
   - Failure scenario: a reader resolves "it" to the nearer noun and takes the page's own rule to hold over a stricter listed standard, the reverse of the intent.
   - Fix: split each sentence at ", and", and write "that standard holds" in place of "it holds".
   - Verdict: none. The item and cases do not cover sentence length.

The other Standards findings a reviewer looks for are not in the diff:
- Non-ASCII: `rc=1` on F and T.
- History in the new text: none.
- Dash asides: `rc=0`.
- Secrets in quoted lines: none.
- A sentence elsewhere made false: the `git grep` above hits only `typescript.md:48`.

## 4. Behaviour

none. The round changes only the text of the new page, which no skill installs yet (step 7). The report's "Changes, old beside new" table gives each changed sentence before and after, and "Point 11" gives line 48 before and after.

## Declined to judge

- 2.4.7: the page's "Keyboard focus shows a visible focus indicator" leaves out the criterion's "has a mode of operation where". The page's sentence is stricter only on a platform that offers a second mode. Understanding 2.4.7 says "In most cases there is only one mode of operation", so I do not raise it. Whether the page should keep the stricter form is Axel's reading.
- 2.4.11: the page's sentence matches the normative text. Notes 1 and 2 (user-movable content, content opened by the user) are informative per the fetched page, so their absence is not a misattribution.
- 1.4.3 large text: the page omits the CJK clause of "large scale (text)". This narrows the definition for CJK scripts only. Whether the template needs the clause is Axel's reading.
- The page's other sentences over 20 words (line 5 at 28, line 6 at 33 and 28, line 7 at 26, line 8 at 34, line 10 at 28 and 22) each carry a list or a threshold that the mechanism needs. They are the brief's or the rulings' wording, and I judged them within the rule's "unless the mechanism needs more".
- "These four criteria" sits in a bullet that cites five criteria. By reading, it refers to the four named after the keyboard-tests sentence. I judged it clear, but Axel's reading settles it.
- The additions beyond the plan's four rules, and the uncited AA criteria (1.4.4, 1.4.10, 2.5.8, 4.1.2), are Axel's reading per the brief's decision 3.
- The oculus source lines were not reread. The page names no source, and no claim of this round rests on them.
- Spec 1, Spec 2 and Standards 1 are all in text the brief or the round's rulings dictated. Whether they are fixed at landing (each is a one-sentence change inside the brief) or raised to Axel is the orchestrator's call.

Agent usage: claude-opus-5-5 (from its transcript), 123555 tokens, 20 tool uses, 271 s.
## Closed

The findings of the run over the last round are not sent to the builder. Each is small and inside the brief, and is fixed on main at landing by the orchestrator:

- Spec 1 (2.1.1 timing). "with no timing required between keystrokes" becomes "with no specific timing required for any keystroke", which covers a held key as Understanding 2.1.1 does.
- Spec 2 (the contrast check and the exemptions). The check's sentence becomes "<the contrast check> computes each text pair and each non-text pair from the tokens, leaving out the pairs an exemption covers, and fails one below its threshold."
- Proof 1 (the report's 2.1.1 row marked met). Closed by the fix of Spec 1; the landing report says the report's row was not reproduced.
- Standards 1 (three sentences joined by ", and", and "it holds"). Each is split at ", and", and "it holds" becomes "that standard holds".
- Declined to judge, the 2.4.7 mode clause, the CJK clause and "These four criteria": left to Axel's reading of the page, named in the landing report.
