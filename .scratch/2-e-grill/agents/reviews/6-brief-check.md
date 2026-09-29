# Step 6 brief check (on main at db9bbec)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/6.md`. `git log --oneline -1` printed `db9bbec Land step 3 of plan 2.E, the effort agents`.

## 1. Names

- `ui-standard.md` (new file): `git grep -n -i -E 'ui-standard|ui standard|UI page' -- . ':!.scratch'` printed one hit, `docs/roadmap.md:24` ("... coding-standard pages (common, C++, Python, TypeScript) and a UI standard, which `repo-setup` installs ..."). The new page makes it more true, not false.
- `svelte/no-restricted-html-elements` / the shared-controls rule: `git grep -n 'no-restricted-html-elements'` printed `skills/repo-setup/templates/docs/dev/coding-standards/typescript.md:48` (in the paths) and hits only under `.scratch/2-e-grill/agents/` (briefs/5.md:14 and 52, reviews/5-report.md:68). Those are ledger records of step 5, and the change does not make them false.
- `design_references`: `git grep -n 'design_references' -- skills docs README.md` gives the default as `[]` everywhere: `skills/plan/templates/plan.yaml:25` (`design_references: []  # optional, default [].`), `skills/plan/templates/plan.projects.yaml:27,51`, `skills/plan/templates/orchestrator-state.md:25`, and `skills/ordo-init/SKILL.md:71` ("`design_bar`, `design_references`, ... are left out unless the user gives a value"). The page's opening, as item 1 dictates it ("listed under `design_references` in `.agents/plan.yaml`, <WCAG 2.2 AA> by default"), contradicts these texts. That is finding N1.
- The Svelte section of `typescript.md` is installed for any TypeScript repository. `ui-standard.md` is installed only "when Axel says the repository has a UI" (step 7's line). After item 2, line 48 cites `docs/dev/ui-standard.md`, and that page is missing in a repository installed without the UI page. That is finding N2.

Findings:
- N1. The page's phrase "<WCAG 2.2 AA> by default" is false against the configuration's default: `design_references` defaults to `[]` in `plan.yaml:25`, both `plan.projects.yaml` entries and `orchestrator-state.md:25`, and `/ordo-init` leaves the key out unless given. No step of the plan writes `WCAG 2.2 AA` into a repository's `design_references`: step 7's line names the pages and `standards`, not this key. The change standard's rule 19 ("A change leaves no two statements that contradict each other") is broken. There is a second problem. The page cites WCAG success criteria by number, so a repository that fills the placeholder `<WCAG 2.2 AA>` with another standard keeps rules whose numbers point at WCAG. Suggested close: the opening states that the rules are the concrete form of WCAG 2.2 AA, with no placeholder, and that `design_references` lists the published standards a design is further held to, where a stricter one holds. Having step 7 write the key instead would widen step 7's scope and would be a stop.
- N2. Item 2 makes `typescript.md:48` depend on a page that step 7 may not install. The brief should either say that the dependency is carried to step 7, which then installs the UI page wherever the Svelte section applies, or word line 48 so it stands without the UI page. Right now neither the brief nor step 7's line records it.

## 2. The step line

The step line is "6 `ui-standard.md`, as 'The default standards pages' below says; check: read and approved by Axel (1 commit) (approved)".

- `ui-standard.md` under `skills/repo-setup/templates/docs/dev/` is served by item 1.
- "Written generically": served by the "What to build" preamble (no project, library or framework name) and by the project-name case.
- "States each rule in the concrete form it takes in code": served by item 1's bullets.
- "Names the tool that enforces it where the language has one": served by item 2, which keeps the Svelte lint on `typescript.md` and cites the page from there, and by the placeholders `<the ... check>`.
- Colours only from tokens: served by item 1, "Colour tokens".
- Contrast of at least 4.5:1 (WCAG 2.2 AA): served by item 1, "Contrast".
- Shared controls instead of raw elements in views: served by item 1, "Shared controls", and by item 2.
- Keyboard reachability: served by item 1, "Keyboard".
- "It works with `design_references` (ruling G4)": served by item 1's opening paragraph. Its wording is finding N1.
- "Check: read and approved by Axel": served by the reading cases. "1 commit" is not an item.

Findings: none.

## 3. Premises

- The folder contents: `ls skills/repo-setup/templates/docs/dev/ skills/repo-setup/templates/docs/dev/coding-standards/` printed `change-standard.md coding-standards design-principles.md prose-standard.md` and `common.md cpp.md python.md typescript.md`. This matches the brief.
- No `ui-standard.md`: `ls skills/repo-setup/templates/docs/dev/ui-standard.md` printed "No such file or directory" with rc=1. This matches.
- `typescript.md:48`: `grep -n` shows `48:- A view draws its controls with the repository's shared components. Under <the views folder>, \`svelte/no-restricted-html-elements\` fails a raw \`button\`, \`input\`, \`select\` or \`textarea\`.` It sits under `## Svelte and SvelteKit` (line 38). This matches.
- No colour, contrast, keyboard or catalog rule on the landed pages: `grep -n -i -E 'token|colou?r|contrast|keyboard|focus|catalog' .../coding-standards/*.md .../design-principles.md` printed nothing, rc=1. This matches.
- `plan.yaml:25`: `design_references: []  # optional, default []. Published standards a design is held to, such as WCAG 2.2 AA; grill cites them per option.` This matches. `check_config.py:160-162` validates the key as a list of text. This matches.
- `skills/repo-setup/templates/CLAUDE.md:17`: `<- \`docs/dev/coding-standards.md\`: how code is written.>`. It exists and is left to step 7. This matches.
- oculus `eslint.config.js` 106-121: the block with `files: ['src/lib/views/**/*.svelte']`, `svelte/no-restricted-html-elements` and elements `button, input, select, textarea`. Its comment reads "which is what gives it the theme's look, its focus ring and its keys". This matches.
- oculus `tests/checks/look/contrast.test.ts` 1-12: "Every text-on-background pair the tokens declare, under every theme, at 4.5:1 or better", and "It is never fixed by loosening the threshold or by editing a colour here: a colour is an authored value in tokens.css or themes.css". This matches.
- oculus `DESIGN.md:214`: "fifteen theme blocks that override tokens and nothing else", "The contrast test walks every text-on-background pair ... fails below 4.5:1", "--scroll-thumb ... until it clears 3:1", "a raw hex in a component is a test failure". This matches.
- oculus `DESIGN.md:246`: "Glyphs come from `catalogs/glyphs.yml`, strings from the catalogs under `config/text/`, colours from `tokens.css`." This matches.
- oculus `DESIGN.md:263`: "Docking: ... all with keyboard equivalents." This matches.
- oculus `DESIGN.md:295`: "Tab moves the focus ... so the keyboard is never held there". This matches, and it is the source of the no-trap sentence.
- oculus `tests/checks/source/keys.test.ts` 1-4: "Every literal reader names a catalog key, and every catalog key is reached by a literal, registration metadata, or one documented computed lookup." This matches the brief's paraphrase. The check governs literals passed to the catalog reader. It does not govern a bare literal string in markup (see Q6).
- oculus `tests/checks/tree/allow-styling.ts` 1-8: "The `:global(...)` rules in a view or a shell component that style a class a primitive declares as its own ... a coupling to undo by giving the primitive the prop or the token it is missing." This matches. The source also has a DELIBERATE allowance, which the brief leaves out. That is consistent with its decision 4 in spirit, though decision 4 does not name it.

Findings: none. Every premise reproduced.

## 4. Cases and checks

- Case "every rule item 1 lists, each ... with its check named as a placeholder". This is inconsistent with item 1 itself: the bullet "Colour is never the only carrier ... (1.4.1)" names no check, so a page written exactly to item 1 fails this case. The same applies in part to the sentence "A theme overrides token values and nothing else" in "Colour tokens", which names no check of its own. `design-principles.md`'s last line gives the form for such a rule: "A principle without a check is checked by reading at review." That is finding C1.
- Case "WCAG numbers" (`grep -o -E '[0-9]\.[0-9]\.[0-9]+' ... | sort -u`): I ran it on a scratch file holding the eight numbers together with `4.5:1`, `3:1` and `WCAG 2.2 AA`. It printed exactly `1.4.1 1.4.11 1.4.3 2.1.1 2.1.2 2.4.11 2.4.3 2.4.7`, one per line, so `4.5:1` and `2.2` are not caught. On a missing file it prints nothing to stdout, so the case fails on the unchanged tree. This is consistent.
- Case "project names": on a scratch line "the reactive cordon border value" the grep printed line 3 with rc=0. The substring pattern hits the ordinary words "reactive", "reaction" (on `react`) and "cordon" (on `ordo`), which a UI page could use. A false hit makes the builder reword the text rather than let a violation through, so this is noted and is not a finding. This is consistent.
- Case "ASCII": consistent with the prose standard, section B, and the change standard's rule 10.
- Case "dash aside": `[^ ] - ` does not match a top-level bullet's leading `- `, and `--` would also match a CSS custom property such as `--accent` if the builder wrote one. That is a wrong hit, not a miss. This is consistent.
- Case "no hard wrapping, no semicolon run": consistent with the prose standard, sections B and F.
- Case "`typescript.md` cites the page": on the unchanged tree `grep -n 'ui-standard.md' typescript.md` printed nothing (rc=1) and `grep -c -i 'shared components'` printed `1`, so the case fails there. Item 2's new text contains "shared-controls rule", not "shared components", so it prints 0 after the change. There is a problem with item 2's text. It gives the new line as "Under <the views folder>, ..." without the list marker `- `, which every other line of that section carries (lines 42-49). A builder copying it verbatim turns a bullet into a lazy continuation of line 47's bullet. That is finding C2.
- Case "`typescript.md` changes on line 48 only" (`git diff --stat`): on the unchanged tree it printed nothing with rc=0. The case then fails by its stated output, not by exit code. This is consistent.
- Case "no rule of the design principles or common coding standards restated": I read each rule of item 1 against `design-principles.md` and `common.md`. None is a restatement:
  - "Colour tokens" is the UI form of "Do not repeat yourself" (a value written once), specific to colours and themes.
  - "Styling a shared component" is the UI form of "Single responsibility" ("A member reaches another subject's state through that subject's interface") and "Open for extension". It is a concrete form, not a copy.
  - "Text from the catalog" has no counterpart. `common.md`'s "Names" and "Character set" govern different things.
  - Contrast, 1.4.1, Shared controls and Keyboard have no counterpart.
  - The opening's "this page adds to them" matches the form of `typescript.md:3`.
  This is consistent.
- Case "on the unchanged tree every case fails": confirmed for the grep cases above. The reading cases fail because the file is missing.
- Verify item 1 expects `checks: 8 commands passed`. The state file's `verify:` holds 8 commands (counted in `.scratch/2-e-grill/orchestrator-state.md`). This is consistent.

Findings:
- C1. The first case requires a check placeholder in every rule, but item 1's 1.4.1 rule names none, so the case and the item cannot both hold. Close it by giving the 1.4.1 bullet "checked by reading at review" (the design-principles form), or by naming a check, and by rewording the case to "its check named as a placeholder, or checked by reading where no check can enforce it".
- C2. Item 2 should give the full new line with its list marker: "- Under <the views folder>, `svelte/no-restricted-html-elements` fails a raw `button`, `input`, `select` or `textarea`, the check of the shared-controls rule in `docs/dev/ui-standard.md`."

## 5. The question

The goal part here is a UI standard that `repo-setup` installs and that grill and every brief hold a design and its code to, stating the colour, contrast, control, keyboard and text rules in a form a reviewer can check and a check can enforce.

- The step line's check (Axel reads and approves the page): no, it could not pass without the goal. Axel's reading judges the text itself.
- Case 1 (every rule present by reading): no, on its own terms, but see C1.
- Case 2 (opening names `design_references`): yes, it could pass without the goal being reached. A page whose opening says "<WCAG 2.2 AA> by default" passes the case while stating a default the configuration does not have (N1).
- Case 3 (WCAG numbers): yes, it could. The grep checks that the numbers appear, not that each number is attached to the rule it implements or that the rule's wording matches the criterion. Reading covers that only if the reviewer checks each wording against WCAG 2.2. Items Q1 to Q3 show that item 1's own wordings drift from the criteria.
- Cases 4 to 7 (names, ASCII, dashes, wrapping): no. They are form checks, and none claims the goal.
- Cases 8 and 9 (`typescript.md`): no, apart from C2.
- Case 10 (no restatement): no.
- Item 1, "Contrast": yes, it could. "3:1 for large text" leaves "large text" undefined, so a contrast check cannot decide which pairs get 3:1 and the rule is not in a form a check can enforce. WCAG 2.2 defines large-scale text as "at least 18 point or 14 point bold". The rule also says a control's boundary always needs 3:1. 1.4.11 requires 3:1 only for "visual information required to identify user interface components and states" and exempts inactive components. The citation therefore attaches a stricter rule to 1.4.11. The rule also leaves out 1.4.3's exemptions (inactive components, decoration, logotypes). It is not stated whether `<the contrast check>` also computes the 3:1 non-text pairs.
- Item 1, "Keyboard": yes, it could. "The focused control is never hidden behind other content (2.4.11)" is the wording of 2.4.12 (AAA, "no part of the component is hidden"). 2.4.11 at AA reads "not entirely hidden due to author-created content". Also, "<the keyboard tests> press the keys of each action" covers 2.1.1 only. Nothing checks no-trap, focus order, focus visible or focus not obscured, and the bullet does not say those are checked by reading. "Every action a pointer reaches is reachable from the keyboard" drops 2.1.1's exception for path-dependent input.
- Item 1, "Text from the catalog": yes, it could. The rule is "never a literal in a component". The named check fails only "a key a component names that the catalog lacks and a catalog key nothing reaches" (the source's `keys.test.ts`), and a bare literal string in markup passes it. The rule's main prohibition therefore has no check and no "checked by reading".
- Item 1, "Shared controls": yes, it could, in part. "The language page names the lint that implements it" is false for a repository whose interface is in C++ or Python. `grep -n -i -E 'lint|element|raw'` over `cpp.md` and `python.md` found only `python.md:8` (ruff), and neither page names an element lint.
- Item 1, "Colour tokens", "Colour is never the only carrier" (apart from C1), "Styling a shared component": no. Each states a concrete rule a reviewer can check a diff against.
- Item 2: no, apart from C2 and N2.

Findings:
- Q1 (Contrast). Define large text as WCAG 2.2 does ("at least 18 point, or 14 point bold"). Reword the 1.4.11 sentence to "the visual information that identifies a control and its state, a graphic that carries meaning, and the focus indicator", or keep "a control's boundary" and stop attributing that strictness to 1.4.11. Say whether `<the contrast check>` computes the 3:1 pairs.
- Q2 (Keyboard). Change "never hidden" to "never entirely hidden by the page's own content (2.4.11)", or cite 2.4.12 if the stricter rule is meant, in which case the WCAG-number case changes too. Say that no-trap, focus order, focus visible and focus not obscured are checked by reading, or name a check for them.
- Q3 (Text from the catalog). Name a check that fails a literal string a reader sees in a component, or say that this part is checked by reading.
- Q4 (Shared controls). Change "The language page names the lint that implements it" to a form that holds for every language, for example "Where a language page names a lint for it, that lint is <the element check>."
- Q5. Case 2 and case 3 are only as good as the reading against WCAG 2.2. Add to the reading case that each cited number's wording is checked against the criterion's text and level.

## 6. Implied inputs

Not a code step. The step writes a Markdown template and changes one line of another.

Findings: none.

## Declined to judge

- Whether the three rules added beyond the four the O2 section lists (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds belong on the page. The brief's decision 3 leaves this to Axel's reading, and it is his call.
- Whether the WCAG 2.2 AA criteria the page does not cite should be on the page. These include 2.5.8 Target Size (Minimum), 1.4.4 Resize Text, 1.4.10 Reflow and 4.1.2 Name, Role, Value, which bears on shared controls. The opening's "where a listed standard is stricter, the standard holds" covers them only once N1 is fixed. Which ones to state is Axel's call.
- The WCAG facts I relied on: the text of WCAG 2.2 at https://www.w3.org/TR/WCAG22/, fetched in this session, for the levels and normative text of 1.4.1 (A), 1.4.3 (AA, 4.5:1, 3:1 for large-scale text, exemptions), 1.4.11 (AA, 3:1), 2.1.1 (A), 2.1.2 (A), 2.4.3 (A), 2.4.7 (AA), 2.4.11 (AA, "not entirely hidden"), 2.4.12 (AAA) and 2.4.13 (AAA), and the definition of large-scale text. The numbers and thresholds the brief cites match that text. The wording issues are Q1 and Q2. That the focus indicator's 3:1 contrast falls under 1.4.11 comes from W3C's "Understanding SC 1.4.11" document, which I did not fetch. It is not verified in this session.
- Whether the brief's "at most five short sentences" per rule can hold once Q1 to Q3 add text. That depends on the builder's wording.

Agent usage: claude-opus-5-5 (Claude Code 2.1.285, read from the agent transcript), 112737 tokens, 21 tool uses, 3.8 minutes (226354 ms).

## Closed

Each finding is closed in `agents/briefs/6.md` by the orchestrator before the preparation commit.

- N1. Item 1's opening now says the rules are the concrete form of WCAG 2.2 AA, which holds in full wherever it asks more, and that `design_references` lists further standards, a stricter one holding. The placeholder `<WCAG 2.2 AA>` is gone and no default is stated. Decision 2 and the second reading case say the same.
- N2. Item 2 says the new line cites a page installed only with a user interface, and `plan.md`'s "Carried to step 7" gains the sentence: step 7 installs the Svelte section of `typescript.md` only in a repository that also gets the UI page.
- C1. The 1.4.1 bullet and the theme sentence of "Colour tokens" end with "checked by reading at review"; the first case accepts those words where item 1 gives them.
- C2. Item 2 gives the full new line with its list marker, in a code block.
- Q1. Contrast defines large text as WCAG 2.2 does, words the 1.4.11 sentence as the criterion does, names the exemptions, and says the contrast check computes the text pairs and the non-text pairs.
- Q2. Keyboard keeps 2.1.1 with its path exception and the keyboard tests, and says no-trap, focus order, focus visible and focus not obscured are checked by reading at review; 2.4.11 now reads "never entirely hidden by the page's own content".
- Q3. Text from the catalog says a literal string in a component is checked by reading at review.
- Q4. Shared controls now reads "Where a language page names a lint for this rule, that lint is <the element check>."
- Q5. A reading case checks each cited criterion's wording and level against WCAG 2.2.
- Declined to judge, the criteria not cited: decision 3 names 1.4.4, 1.4.10, 2.5.8 and 4.1.2, bound by the opening, and leaves to Axel's reading whether any gets its own rule.
- The sentence limit per rule goes from five to six, since Q1 to Q3 add a sentence to three rules.
