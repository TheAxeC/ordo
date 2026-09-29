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
