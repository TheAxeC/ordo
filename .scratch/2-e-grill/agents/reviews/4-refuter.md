# Step 4 refuter report (on .agents/worktrees/2e-4, base 2381288820ce3015bbbd68fd2987b7e786065e04)

A page this report cites is named with its section, never with a line number. A finding in the new pages keeps its `file:line`. Saved by the orchestrator from the reviewer's final message, condensed where it repeats passing output.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
PASS: land.sh scratch tests
PASS: checks.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
checks: 8 commands passed
exit 0

Project-name, ASCII and dash-aside commands of Cases: exit 0 each
wc -l: 16 design-principles.md; 13 coding-standards/common.md
git status --short --untracked-files=all: the report and the two new pages only
Report evidence rerun (the O2 sentence count, line 3, semicolons 0 and 0, the comment lines): matches
```

## Verdicts

- Item 1 (`design-principles.md`): holds; Spec 1, Spec 3 and Standards 1 to 6 concern its wording.
- Item 2 (`common.md`): violated, Spec 2.
- Cases: all met except "no language-specific rule", partial (Spec 3, Standards 1).

## 1. Spec

- Spec 1. Every placeholder is written inside backticks, where the brief names `templates/CLAUDE.md`'s form, which is bare; a backticked `<REDACTED>` in the change standard is a literal. Failure scenario: step 7 reads a backticked `<ten>` as a literal and installs it unfilled, or fills it in code font.
- Spec 2. common.md:7: "The repository has one formatter". The plan gives clang-format to `cpp.md` and Prettier to `typescript.md`, and step 7's check installs both in one repository. Failure scenario: a reviewer refuses `.clang-format` beside `.prettierrc`. Verdict: item 2 violated.
- Spec 3. design-principles.md:6: "A public interface names no third-party type." is the C++ header wall, which the plan assigns to `cpp.md`; no decision names the move. Failure scenario: a Python reviewer refuses a public function taking a DataFrame. Verdict: case "no language-specific rule" partial.
- Spec 4. common.md:8: "no "was" and no "used to"" turns the change standard's rule on history into a word list. Failure scenario: "returns None when the key was not found" is refused while real history passes.
- Spec 5. common.md:5: "flags it at `<900>`" reads as a warning where the source's check fails the verify list at 900. Failure scenario: a 950-line file lands and the verify list goes red.

## 2. Proof

none

## 3. Standards

- Standards 1. design-principles.md:13, :6, :11: "a function over a template", "what its build declaration grants it", "static mutable state" are one language family's terms on a language-independent page. Verdict: case "no language-specific rule" partial.
- Standards 2. common.md:8 "A comment says why, never what the code already says" contradicts the change-standard template's rule "No history in code or comments" ("A comment says what the code does and why, never ..."), installed in the same repository (change standard rule 19); design-principles.md:12's citation then names one of two homes.
- Standards 3. common.md:9's ASCII exception differs from the prose standard's section B ("Accented letters in names stay"); common.md:10 and :11 restate the prose standard's sections F and D in other words.
- Standards 4. design-principles.md:7 "A new case" and :8 "A refusal" use two plan terms outside their glossary sense; the plan-terms block is copied into every installed glossary.
- Standards 5. "the error type" (design-principles.md:8) against "the language's error mechanism" (common.md:12), and "the maintainer" (design-principles.md:11) where the repository's rules say "the user": synonym cycling (prose standard D).
- Standards 6. Five ", never ..." contrasts in design-principles.md and three in common.md, against the prose standard's section D (binary contrast at most twice per page) and section 0 (repeated construction).
- Standards 7. design-principles.md:12 gives `coding-standards/common.md` relative to its folder, common.md:11 gives `docs/glossary.md` from the root.

## 4. Behaviour

none; no skill installs the pages yet.

## Declined to judge

- Whether each principle's wording is the right default: Axel's reading.
- "A principle without a concrete form is a slogan" is not a checkable rule; the brief dictates it.
- design-principles.md:7 (about 30 words) and :13 (about 27) run past the prose standard's roughly 20.
- Where each finding traced to the brief's wording is repaired: the orchestrator's ruling.

Reviewer usage: 122792 tokens, 20 tool uses, 5.4 minutes (323 s), claude:opus, a fresh agent (from its completion notice).

## Repair round 1, refuted

Reviewer: a fresh agent, read-only, over the two pages as they stand against the round-0 text quoted above, read against the whole step. Saved by the orchestrator from the reviewer's final message, condensed.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md
... every line PASS or ok ...
checks: 8 commands passed
exit 0
Project-name, ASCII and dash-aside commands of Cases: exit 0 each
wc -l: 16 design-principles.md, 13 coding-standards/common.md
grep -c -E ', never|, not ': design-principles.md:2, common.md:1
grep -c '`<': 0 and 0; ten bare placeholders
grep -n -i -w -E 'case|cases|refusal|maintainer|template|static|build declaration|third-party|error type': no output
Longest sentence: 22 words (design-principles.md), 24 (common.md)
The cited rule and sections exist in the change-standard and prose-standard templates: "No history in code or comments", "Scripts compute facts; judgment is read", "A test proves the change by failing without it, ...", B "ASCII throughout", D "No synonym cycling", F "Source formatting"
```

Every closure of round 0 reproduces. The three changes beyond the numbered rulings (the Tests bullet cited, the Errors bullet kept, the character-set exception kept) hold.

### Verdicts

- Items 1 and 2: hold. Cases: all met.

### Findings

- Spec 1, common.md:8: "Comments follow the change standard's rule "No history in code or comments" ...". The closure dropped the brief's "a comment says why, never what the code already says"; the cited rule says "A comment says what the code does and why". Failure scenario: a reviewer refusing a comment that restates the code has no page to point at.
- Spec 2, `.scratch/2-e-grill/agents/briefs/5.md` "What is on the tree": the list of what step 4's pages state names the third-party rule, "the error type", "static" and "comments say why", which the round removed or changed; step 5's `cpp.md:27` cites the removed rule and the language pages use relative paths.
- Standards 1, design-principles.md:7: "A new kind of view, backend, key or command": "kind" is a plan term (the glossary's retro grouping sense).
- Standards 2, design-principles.md:8 and common.md:12: the same rule, "A failure is reported through the language's error mechanism", opens a sentence on both pages, against the DRY bullet.
- Standards 3, common.md:8, :9, :10, :11, :13: five bullets share the shape "<subject> follow(s) the <rule> of <section> of the <standard> (`<path>`)", the prose standard's repeated construction.

### Declined to judge

- Whether design-principles.md:10 and :14 count as contrasts (read as two conjoined rules).
- The size pair in common.md:5 (a limit and an earlier check).
- Which comment rule an installed repository carries (Spec 1): Axel's decision.

Reviewer usage over round 1: 113579 tokens, 19 tool uses, 4.7 minutes (283 s), claude:opus, a fresh agent (from its completion notice).

## Closed

- Round 0, Spec 1 to 5 and Standards 1 to 7: closed in repair round 1 by rulings 1 to 12 of `agents/briefs/4-round-1.md`; the run over the round reproduced each closure.
- Round 1, Spec 1, the "why, never what" comment rule dropped: no change. The pages cite the change standard's rule "No history in code or comments", "A comment says what the code does and why", which is the user's own rule in every project; the oculus wording contradicted it, and the round-0 finding was that contradiction.
- Round 1, Spec 2, step 5's brief lists wording step 4's round changed: closed by step 5's repair round 1, whose rulings 1 and 8 drop `cpp.md`'s citation of the removed rule and write every path from the repository root; step 5's run over its round reads its pages against step 4's pages as they stand.
- Round 1, Standards 1, "A new kind of view": fixed in the step's worktree by the orchestrator before the landing, "A new view, backend, key or command is registered at an extension point" (`design-principles.md:7`); `grep -n -i -w -E 'case|cases|refusal|kind|maintainer|template|static'` over both pages prints nothing.
- Round 1, Standards 2, the error rule on both pages: fixed in the step's worktree by the orchestrator before the landing; `design-principles.md:8` now reads "A failure is reported as `docs/dev/coding-standards/common.md` says, never through a flag that means two things."
- Round 1, Standards 3, five bullets of one shape: fixed in the step's worktree by the orchestrator before the landing; `common.md`'s opening paragraph names the change standard and the prose standard with their paths once, and the Comments, Character set, Markdown and YAML, Names and Tests bullets state their rule and cite the section in varied forms.
