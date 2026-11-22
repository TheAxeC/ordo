# 0014. A finding agent and a checking agent review a diff's comments, and a rewrite is kept only when the comment-stripped files compare equal

Status: proposed

## Context

Roadmap entry 4 asks for a skill that checks and rewrites the comments of a diff: what the code does and why, no history, no step numbers, ASCII only (the entry's rulings, D1 to D7). Ordo's skills carry no project name and no path (`README.md`, first paragraph), so the skill reads a git diff of any repository. A comment is judged against the code it stands above, which only reading can do. Under the change standard's section "Scripts compute facts; judgment is read", only non-ASCII and the comparison of two texts are facts a script computes. The change standard's rule 16 says a write verifies its own result. The `/writing` review showed that a checking agent which keeps only the findings that hold turned a noisy report into one the user found useful (ADR 0013). Cathedra's comment sweep proved a comments-only rewrite by comparing the comment-stripped forms of the files before and after (`cathedra/utils/scripts/plan/strip_comments.py`, its head comment).

## Decision

`/code-comments` reads no `.agents/plan.yaml`. It starts its finding agent, its checking agent and its rewrite agent on the runner's default agent with the runner's defaults, and their prompts set no model and no effort. The prose standard it holds a comment's prose to is `docs/dev/prose-standard.md` of the repository the session is in when it has one, and otherwise the `repo-setup` skill's `templates/docs/dev/prose-standard.md`. It reads a git diff, by default the uncommitted changes against `HEAD`, otherwise a range `<base>..<head>`, and judges only the comments the diff adds or changes, each with the code around it. Non-ASCII on the added lines is found by `LC_ALL=C grep -n '[^ -~]'`. The session writes a prompt file with shell commands. It holds the diff, the rules and each changed file, whole or, when the file is over 256 KB, as its diff hunks with 40 lines on either side. A fresh agent that changes nothing reads that file and reports findings; a fresh checking agent keeps a finding only where its quote stands at its place, the rule's words describe it and applying it would not make the comment worse. The report puts the false comments first. The user says which findings to apply; a fresh agent rewrites those comments in the working tree and commits nothing. `templates/strip_comments.py --compare <before> <after>` compares each rewritten C, C++ or CMake file with its version before the rewrite, and a file that compares `differ` is put back as it was and named in the report. A file in another language gets its findings and no rewrite.

## Alternatives rejected

- Report only: the entry asks for the rewrite, and the user would rewrite every comment by hand.
- Rewrite at once, then report: whether a comment is right is a judgment, and a wrong rewrite would land before the user sees it.
- One agent with no checking agent: nothing removes the findings that do not hold, which made the first `/writing` reports noise.
- No comparison script, the user reading the rewrite's diff: a code change inside a long rewrite is missed by reading, and rule 16 asks the write to verify itself.
- The comparison for Python, shell and TypeScript as well: no rewrite in those languages has been needed, and a file in an uncovered language is simply not rewritten.

## Consequences

`/code-comments` runs in a repository that has no plan configuration, and its agents run on the session's model at the session's effort. Each review costs two agent runs, and each rewrite one more. A language added to the rewrite needs its lexer in `strip_comments.py` and its case in the script's test. The script is listed on `docs/dev/scripts.md` as a user script.
