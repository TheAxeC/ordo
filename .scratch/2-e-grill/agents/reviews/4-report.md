# Report: step 4, the default design-principles page and the common coding-standards page

Everything in the brief and in repair round 1 is done.

## Open items of the state file, verbatim

None.

## Cases, first run on the unchanged tree

Run from the worktree root at base 2381288, before any file was written. `ls skills/repo-setup/templates/docs/dev/` printed `change-standard.md` and `prose-standard.md`.

| Case | First run |
|---|---|
| Each page holds every item of item 1 or item 2, in a concrete form | Fails: both files missing (read by `ls`, below). |
| `design-principles.md` opens with the ruling O2 sentence verbatim | Fails: file missing. |
| Project-name command | Exit 1: `ls: skills/repo-setup/templates/docs/dev/coding-standards/common.md: No such file or directory` and `ls: skills/repo-setup/templates/docs/dev/design-principles.md: No such file or directory`. |
| No language-specific rule | Fails: files missing. |
| ASCII command | Exit 1, the same two `ls` lines. |
| Dash-aside command | Exit 1, the same two `ls` lines. |
| No hard wrapping, no semicolon run in a bullet | Fails: files missing. |
| Comment rule in `common.md` only, cited from `design-principles.md` | Fails: files missing. |
| On the unchanged tree every case fails | Holds: every case above fails. |

No case is one the brief's rules get wrong, so there was no hand-back.

## DONE / NOT DONE

Every output below is from the run after repair round 1.

| Item | State | Command and output |
|---|---|---|
| 1. `design-principles.md`: title, O2 sentence verbatim at the head, the slogan sentence, ten principles, closing paragraph on checks | DONE | `grep -c -F '<the O2 sentence>' .scratch/2-e-grill/plan.md skills/repo-setup/templates/docs/dev/design-principles.md` printed `.scratch/2-e-grill/plan.md:1` and `skills/repo-setup/templates/docs/dev/design-principles.md:1`. `sed -n 3p <page> \| grep -c '^A design ruling decides ...'` printed `1`. The ten principles and the closing paragraph checked by reading. |
| 2. `coding-standards/common.md`: title, opening sentence, nine conventions | DONE | Checked by reading: file size, folder size, formatting, comments, character set, Markdown and YAML, names, errors, tests. |
| Verify 1: the runner | DONE | Output below, exit 0. |
| Verify 2: project-name command | DONE | Printed the two paths from `ls` and nothing else, `exit 0`. |
| Verify 3: ASCII and dash-aside commands | DONE | Each printed the two paths from `ls` and nothing else, `exit 0`. |
| Verify 4: `wc -l` under 60 and under 40 | DONE | `16 skills/repo-setup/templates/docs/dev/design-principles.md`, `13 skills/repo-setup/templates/docs/dev/coding-standards/common.md`. |
| Verify 5: no test added | DONE | `git status --short` printed `?? .scratch/2-e-grill/agents/reviews/4-report.md`, `?? skills/repo-setup/templates/docs/dev/coding-standards/` and `?? skills/repo-setup/templates/docs/dev/design-principles.md`. |
| No semicolon run in a bullet | DONE | `sed 's/"[^"]*"//g' <both pages> \| grep -c ';'` printed `0`. The one semicolon on the pages is inside the quoted section name "Scripts compute facts; judgment is read". |
| Comment rule stated once | DONE | Under round 1's ruling 4 the comment rule is the change standard's rule "No history in code or comments". `common.md:8` and `design-principles.md:12` both cite it by page and name, and neither restates it (lines quoted under "Repair round 1"). |
| No hard wrapping | DONE | Read: each paragraph and bullet is one line. |
| No language-specific rule | DONE | Read: no header, tool or construct of one language. `getInstance()` is in the brief's own text of the No globals principle and names a pattern. |

Runner output, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md`, exit 0:

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

What the green result does not cover: whether each principle's wording is right and complete is judged by reading, by the reviewer and by Axel (the step's check in `plan.md` is "read and approved by Axel").

## Files

| File | Lines |
|---|---|
| `skills/repo-setup/templates/docs/dev/design-principles.md` (new) | 16 |
| `skills/repo-setup/templates/docs/dev/coding-standards/common.md` (new) | 13 |
| `.scratch/2-e-grill/agents/reviews/4-report.md` (new, this report) | not counted |

## Judgment calls

- **Checks named in `common.md`.** Where a convention has a check (file size, folder size, formatting, character set), the rule's sentence names it by a placeholder: <the size check>, <the folder check>, <the format check>, <the ASCII check>. Each of the four sentences is worded differently, so the check is not a repeated trailing construction.
- **Checks named in `design-principles.md`.** The brief's list for item 1 gives no check per principle and ends with one paragraph on checks, so the principles name no check and the closing paragraph carries <the checks>.
- **"Keep it simple".** The prose standard's section A bans "simple" as filler. The word is kept as part of the principle's name, which the brief dictates, and not as a softener.
- **Tests and Errors bullets under the round's opening rule.** Repair round 1 opens with "A rule one of them already states is cited from these pages by its page and rule or section, never restated in other words." Its numbered rulings name the Comments, Character set, Markdown and YAML, and Names bullets. The Tests bullet restated the change standard's section "Scripts compute facts; judgment is read" and its rule "A test proves the change by failing without it, and the report quotes the red", so it now cites both. The Errors bullet states what a failure report carries, which neither standard states (the change standard's rule "A guard is not a fix" is about guards), so it keeps its own wording.
- **Character set exception.** The brief's item 2 gives "except where a file's format requires otherwise", which section B of the prose standard does not state. The bullet keeps it as its own sentence beside the citation, so the rule keeps the brief's scope.
- **Wording by source**, each principle's concrete form taken from the brief's item 1 as round 1 changed it:
  - Single responsibility: game-engine (one module owns one subject, a class keeps one invariant, a file holds one subject) and cathedra (state reached through the subject's accessor).
  - Separation of concerns: cathedra and game-engine (layers see only lower layers, the forwarder rule), game-engine (a module reaches only its declared dependencies), oculus `DESIGN.md` "The three layers" (the layers as a repository fills them in).
  - Open for extension: oculus spec ("extends by registration, never by editing consumers") and cathedra and game-engine (extension through the points the code exposes).
  - Substitutability: cathedra (no member defaulted to a no-op, a failure through the error mechanism rather than a bool that means two things) and game-engine (the whole contract).
  - Interface segregation: cathedra and game-engine (one small interface per subject, a caller depends on what it uses, no member without a first-party caller on an interface).
  - Dependency inversion: game-engine (the interface a lower layer declares, `Context&` passed explicitly, generalised as the plan section says) and oculus spec (a context object, a constructor argument, a function parameter).
  - No globals: game-engine "No globals" (no singleton, no global logger, no `getInstance()`, no static mutable state, an exception is the owner's call and sets no precedent) and oculus spec (no module-level mutable state).
  - Do not repeat yourself: cathedra and game-engine (one body per rule, a derivable table is generated, a prose rule stated once and cited).
  - Keep it simple: cathedra and game-engine (the plain shape first, a mechanism justified from the repository's own goals).
  - You are not going to need it: cathedra and game-engine (nothing for a caller that does not exist, a test-only member deleted with its test, a public member documented where its caller reads, a future need as a roadmap entry).
  - `common.md`: oculus `DESIGN.md` "Conventions" (file size checked at 900 of 1000, ten items per folder, one pinned formatter), and citations of Ordo's change-standard template and prose standard for comments, the character set, Markdown and YAML, names and tests. The file-size rule says "split by subject" to use the page's one term for what a file holds, where oculus says "by concern".

## Wrong or impossible in the brief

Nothing. Each premise read held: `ls skills/repo-setup/templates/docs/dev/` printed the two pages the brief names, the source line ranges hold the sections the brief names, and the O2 sentence is in `plan.md` once (the `grep -c -F` above).

## Repair round 1

Each ruling of `agents/briefs/4-round-1.md`, with the text before and after.

1. **Placeholders bare.** Every `<...>` is written bare. Before: `` `<the layers, top down>` ``, `` `<1000>` `` and the rest in backticks. After: <the layers, top down>, <the goals>, <the checks>, <1000>, <900>, <ten>, <the size check>, <the folder check>, <the format check>, <the ASCII check>. `grep -c '`<' <both pages>` printed `design-principles.md:0` and `common.md:0`.
2. **One formatter per language.** `common.md:7`, before: "The repository has one formatter, and its configuration is pinned in the repository. The verify list runs it as `<the format check>`. A failing format check is fixed by running the formatter, never by hand." After: "Each language has one formatter, with its configuration pinned in the repository. The verify list runs each formatter as <the format check>. A failing format check is fixed by running the formatter."
3. **Language-specific terms.** In `design-principles.md`, "A public interface names no third-party type." is removed. "what its build declaration grants it" became "A module reaches only the modules it declares as dependencies." "a function over a template" became "a plain function over a generic one". "no module-level or static mutable state" became "no mutable state at module or class level".
4. **Comments cite the change standard.** `common.md:8`, before: "A comment says why, never what the code already says. Code and comments carry no history: no date, no step or item number, no "was" and no "used to"." After: "Comments follow the change standard's rule "No history in code or comments" (`docs/dev/change-standard.md`), which says what a comment carries and what it never carries." `design-principles.md:12`, before: "The comment rule, for one, is stated in `coding-standards/common.md`." After: "The comment rule, for one, is the change standard's rule "No history in code or comments" (`docs/dev/change-standard.md`)." The rule's name is verified in the template: `grep -n -o -E '\*\*(No history in code or comments|A test proves the change by failing without it)[^*]*\*\*|^## Scripts compute facts; judgment is read' skills/repo-setup/templates/docs/dev/change-standard.md` printed `11:## Scripts compute facts; judgment is read`, `36:**No history in code or comments.**` and `39:**A test proves the change by failing without it, and the report quotes the red.**`.
5. **Standards 2.** Closed by ruling 4.
6. **The size check.** `common.md:5`, before: "`<the size check>` flags it at `<900>`". After: "<the size check> fails the verify list at <900>".
7. **Prose standard cited by section.** The section names were verified by `grep -n -E 'ASCII throughout|Source formatting|No synonym cycling|^## [BDF]\.' skills/repo-setup/templates/docs/dev/prose-standard.md`, which printed `30:## B. Punctuation`, `35:- ASCII throughout: ...`, `45:## D. Structure`, `50:- **No synonym cycling.** ...`, `66:## F. Emphasis and formatting` and `71:- Source formatting: ...`.
   - Character set, before: "Every authored file is ASCII only, except where the file's format requires otherwise. The verify list refuses a non-ASCII character through `<the ASCII check>`." After: "Every authored file, source code included, follows the rule "ASCII throughout" of section B of the prose standard (`docs/dev/prose-standard.md`). The exception is a file whose format requires another character set. <the ASCII check> enforces the rule."
   - Markdown and YAML, before: "Each paragraph and each bullet is one continuous line, with no hard wrapping." After: "Markdown and YAML files follow the source formatting that section F of the prose standard (`docs/dev/prose-standard.md`) sets."
   - Names, before: "A name says what the thing is in the repository's vocabulary, which `docs/glossary.md` defines where the repository has one. One thing has one name everywhere." After: "A name says what the thing is in the repository's vocabulary, whose terms `docs/glossary.md` holds. Names follow the rule "No synonym cycling" of section D of the prose standard (`docs/dev/prose-standard.md`)."
8. **Plan terms.** "A new case (a view, a backend, a key, a command) is added by registering it at an extension point the code exposes, such as a registry or an interface. The code that consumes the case is never edited to add it." became "A new kind of view, backend, key or command is registered at an extension point, such as a registry or an interface. The code that consumes it is left unchanged." "A refusal goes through the error type" became "A failure is reported through the language's error mechanism".
9. **One name per concept.** "the language's error mechanism" is on both pages (`design-principles.md:8`, `common.md:12`). "an ADR the maintainer rules on" became "an ADR the user rules on". `grep -n -i -w -E 'case|cases|refusal|maintainer|template|static|build declaration|third-party|error type' <both pages>` printed nothing and exited 1.
10. **At most two contrasts per page.** `grep -c -E ', never|, not ' <both pages>` printed `design-principles.md:2` and `common.md:1`. The contrasts left are `design-principles.md:8` ", never through a flag that means two things", `design-principles.md:13` ", never from what another project does" and `common.md:5` ", never by line count". Stated positively instead: Single responsibility ("A member reaches another subject's state through that subject's interface."), Open for extension ("The code that consumes it is left unchanged."), Interface segregation ("An interface holds only members that a production caller uses."), Dependency inversion ("A module depends on interfaces that the layers below it declare, and names no concrete type of a layer above it."), No globals ("it sets no precedent for another"), You are not going to need it ("A future need is recorded as a roadmap entry, and no code is written for it.").
11. **Paths from the repository root.** `common.md:3` now reads "The language pages in `docs/dev/coding-standards/` add to this page and never repeat it." Every other path on the pages is `docs/dev/change-standard.md`, `docs/dev/prose-standard.md` or `docs/glossary.md`.
12. **No sentence past 25 words.** A Python word count per sentence, with the bold labels removed, printed "design-principles.md longest sentence: 23 words" and "common.md longest sentence: 25 words". The Keep it simple sentence is split into "The plain shape comes first: a value type over a builder, and a plain function over a generic one." and "A direct call is preferred over an indirect one where the callee is known." The Open for extension sentence is the ruling 8 wording above.

Beyond the numbered rulings, the round's opening rule, that a rule one of the standards states is cited and never restated, was applied to the Tests bullet. The Judgment calls section above explains why. Before: "A test proves behaviour whose failure costs something. It fails on the tree without the change it proves." After: "Tests follow the section "Scripts compute facts; judgment is read" of the change standard (`docs/dev/change-standard.md`). A test also follows its rule "A test proves the change by failing without it, and the report quotes the red"."

Checks after the round:
- The brief's command cases, run from the worktree root: the project-name, ASCII and dash-aside commands each printed the two paths from `ls` and nothing else, then `exit 0`.
- `wc -l`: `16 skills/repo-setup/templates/docs/dev/design-principles.md`, `13 skills/repo-setup/templates/docs/dev/coding-standards/common.md`.
- The runner printed the eight commands and their `PASS` and `ok` lines quoted under "DONE / NOT DONE", then `checks: 8 commands passed`, exit 0.
