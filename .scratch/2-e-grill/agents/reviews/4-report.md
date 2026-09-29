# Report: step 4, the default design-principles page and the common coding-standards page

Everything in the brief is done.

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

| Item | State | Command and output |
|---|---|---|
| 1. `design-principles.md`, title, O2 sentence verbatim at the head, the slogan sentence, ten principles, closing paragraph on checks | DONE | `grep -c -F '<the O2 sentence>' .scratch/2-e-grill/plan.md skills/repo-setup/templates/docs/dev/design-principles.md` printed `.scratch/2-e-grill/plan.md:1` and `skills/repo-setup/templates/docs/dev/design-principles.md:1`. `sed -n 3p <page> \| grep -c '^A design ruling decides ...'` printed `1` (the sentence opens the first paragraph). The ten principles and the closing paragraph checked by reading. |
| 2. `coding-standards/common.md`, title, opening sentence, nine conventions | DONE | Checked by reading: file size, folder size, formatting, comments, character set, Markdown and YAML, names, errors, tests. |
| Verify 1: the runner | DONE | Output below, exit 0. |
| Verify 2: project-name command | DONE | Printed the two paths from `ls` and nothing else, `exit 0`. |
| Verify 3: ASCII and dash-aside commands | DONE | Each printed the two paths from `ls` and nothing else, `exit 0`. |
| Verify 4: `wc -l` under 60 and under 40 | DONE | `16 skills/repo-setup/templates/docs/dev/design-principles.md`, `13 skills/repo-setup/templates/docs/dev/coding-standards/common.md`. |
| Verify 5: no test added | DONE | `git status --short` printed `?? skills/repo-setup/templates/docs/dev/coding-standards/` and `?? skills/repo-setup/templates/docs/dev/design-principles.md` before this report was written. |
| No semicolon run in a bullet | DONE | `grep -c ';'` printed `0` for each page. |
| Comment rule stated in `common.md` only, cited from `design-principles.md` | DONE | `grep -n -i 'comment'` over both pages: `common.md:8` states it ("A comment says why, never what the code already says. Code and comments carry no history: ..."), and `design-principles.md:12` cites it ("The comment rule, for one, is stated in `coding-standards/common.md`."). |
| No hard wrapping | DONE | Read: each paragraph and bullet is one line (16 and 13 lines hold the title, blank lines, one opening paragraph, the bullets and, in `design-principles.md`, the closing paragraph). |
| No language-specific rule | DONE | Read: no header, tool or construct of one language. `getInstance()` is in the brief's own text of the No globals principle and names a pattern, not a language rule. |

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

- **Placeholder markup.** Each `<...>` placeholder is written inside backticks, as the brief writes each one (`<the layers, top down>`, `<the goals>`, `<the checks>`, `<1000>`, `<900>`, `<ten>`). `templates/CLAUDE.md` writes its placeholders bare. The backticks keep a placeholder such as `<ten>` visible when the page is rendered, where a bare one would be read as an HTML tag, so a reader sees the default as decision 3 intends. Step 7, which fills them, decides whether the backticks stay around the filled value.
- **Checks named in `common.md`.** Where a convention has a check (file size, folder size, formatting, character set), the rule's sentence names it by a placeholder: `<the size check>`, `<the folder check>`, `<the format check>`, `<the ASCII check>`. The four sentences are worded differently ("flags it at", "counted by", "The verify list runs it as", "refuses ... through") so the check is not a repeated trailing construction.
- **Checks named in `design-principles.md`.** The brief's list for item 1 gives no check per principle and ends with one paragraph on checks, so the principles name no check and the closing paragraph carries `<the checks>`.
- **"Keep it simple".** The prose standard's section A bans "simple" as filler. The word is kept here as part of the principle's name, which the brief dictates, and not as a softener.
- **"never" clauses.** Several principles state the wanted behaviour with its forbidden alternative ("through that subject's interface, never through a copy of that state"). These are read as the rule's own qualifier, as the brief's text writes each one, and not as the rhetorical binary contrast section D of the prose standard limits.
- **Wording by source**, each principle's concrete form taken from the brief's item 1, which draws on these:
  - Single responsibility: game-engine (one module owns one subject, a class keeps one invariant, a file holds one subject) and cathedra (state reached through the subject's accessor, never a copy).
  - Separation of concerns: cathedra and game-engine (layers see only lower layers, the forwarder rule), game-engine (the build declaration grants the reach, no third-party type in a public header), oculus `DESIGN.md` "The three layers" (the layers as a repository fills them in).
  - Open for extension: oculus spec ("extends by registration, never by editing consumers") and cathedra and game-engine (extension through the points the code exposes).
  - Substitutability: cathedra (no member defaulted to a no-op, a refusal through the error type, never a bool that means two things) and game-engine (the whole contract).
  - Interface segregation: cathedra and game-engine (one small interface per subject, a caller depends on what it uses, no member without a first-party caller on an interface).
  - Dependency inversion: game-engine (the interface a lower layer declares, `Context&` passed explicitly, generalised as the plan section says) and oculus spec (a context object, a constructor argument, a function parameter).
  - No globals: game-engine "No globals" (no singleton, no global logger, no `getInstance()`, no static mutable state, an exception is the maintainer's call and never a precedent) and oculus spec (no module-level mutable state).
  - Do not repeat yourself: cathedra and game-engine (one body per rule, a derivable table is generated, a prose rule stated once and cited).
  - Keep it simple: cathedra and game-engine (the plain shape first, a mechanism justified from the repository's own goals, never from another project).
  - You are not going to need it: cathedra and game-engine (nothing for a caller that does not exist, a test-only member deleted with its test, a public member documented where its caller reads, a future need as a roadmap entry).
  - `common.md`: oculus `DESIGN.md` "Conventions" (file size checked at 900 of 1000, split by concern, ten items per folder, one pinned formatter and never a hand-formatted fix, ASCII, no hard wrapping, a comment says why), Ordo's change standard rule 10 (no history in code or comments), the prose standard section D (one term per concept, for names), the change standard rule 2 (no silent skip, for errors) and its "Scripts compute facts" section and rule 1 (a test for behaviour whose failure costs something, failing on the tree as it is, for tests). The file-size rule says "split by subject" to use the page's one term for what a file holds, where oculus says "by concern".

## Wrong or impossible in the brief

Nothing. Each premise read held: `ls skills/repo-setup/templates/docs/dev/` printed the two pages the brief names, the source line ranges hold the sections the brief names, and the O2 sentence is in `plan.md` once (the `grep -c -F` above).
