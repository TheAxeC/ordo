# Step 2 landing report

Roadmap entry 3 (The writing base). Plan step 2 of 6: the prose checking script. Next: step 3, the reference pages.

## Open items

- Open item C (step 2, raised 2026-09-28): the review over step 2's last repair round left work that is not small enough to fix at landing, and the round cap allows no further round. (1) Twelve branches of `check_prose.py` have no test case, so removing any of them leaves the test green: among them the floor at 0 of the LaTeX list and table depth (a stray `\end{itemize}` would make every later line a list item), the guard for a stray `\end{abstract}` (without it the script would crash), the `\item` label read as text, and inline `$...$` not spanning a blank line (also missing from the head docstring). (2) LaTeX data rows reach beyond data: a line that is one command with its arguments, such as `\footnote{...}` or `\emph{...}`, and the brace groups after a lone command such as `{\small ...}` after `\noindent`, are left out of the semicolon count; the reviewer's probe hid ten semicolons. (3) The contrast window runs across a removed Markdown code span, which gives a false contrast in `skills/plan-retro/SKILL.md` line 41. (a) A new step 2a, before step 4: a builder gives each of the twelve branches a case, or removes the branch where no input reaches it; narrows the LaTeX data row to a line of one command whose argument text holds no sentence and drops the argument-line reading except for lines that continue that command; and makes a removed code span end the contrast window; with its own review. Step 4 runs this script, so it waits for 2a. Pro: `/writing` is built on a script whose every rule is proven. Con: one more build and review. (b) Land step 2 as it is and leave the three points. This is the lazy option: the script keeps untested branches and hides semicolons in footnotes. Recommendation: (a).

## The check of Steps 1

The runner's agent listing (ListAgents) showed no subagent of this session: the builder and both reviewers had finished. Only the peer session research-hub-44 was listed, which is not an agent of this step.

## NOT DONE

- The three points of open item C, which wait on the user's ruling.

## What landed

- `skills/writing/templates/check_prose.py` and `skills/writing/templates/check_prose.test.sh`: twelve checks of the prose standard over Markdown, LaTeX and plain text, reported per line, changing no file.
- The test in `docs/dev/building.md`, the command block of `docs/dev/change-standard.md` and this plan's verify list.
- Rule 10 of `docs/dev/change-standard.md` and of `skills/repo-setup/templates/docs/dev/change-standard.md`, reworded by open item B's ruling.
- Verification on main: seven `PASS:` lines, `verify: 8 commands passed`, exit 0.

## What was found

- The cases ruling (round 0): the table separator row and four neighbouring cases of the dash rule.
- The first review: 3 Spec, 4 Proof, 1 Standards and 6 Behaviour findings and 4 items for the orchestrator, closed in repair round 1 and by open item B.
- The review over round 1: 4 findings fixed at landing, 2 added rules accepted, 3 raised as open item C. Each disposition is under the Closed heading of `2-refuter.md`.

## What is next

- Step 3, the reference pages. Step 4 waits on step 3 and on open item C.
