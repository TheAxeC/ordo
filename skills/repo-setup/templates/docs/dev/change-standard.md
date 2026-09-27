# The change standard

How a change is made in this tree, whoever makes it: a session working inline, or an agent dispatched under a brief. A brief points here first; nothing in a brief overrides anything here. The coding and prose standards beside this page say what the result looks like; this page says how the work is done and how it is reported.

## Read before changing anything

1. The brief for the step, in full: it is the specification. Where the brief and the tree disagree, stop and report the disagreement with the evidence; do not pick a side and do not invent a substitute.
2. The standards the brief lists, in full: <the standards pages, linked>, and the ADRs the brief names.
3. Every file the brief names, in full, and every caller a grep finds for a name the change moves or renames.

## The rules

1. **A defect fix begins with a test that fails on the tree as it is.** Write the test, run it, see it fail for the reason the brief states, and only then change the code. The report quotes the failing check. A test written after the fix, or one that would have passed before it, is not a test of the defect.
2. **A guard is not a fix.** A null check, an early return, a fallback value or a "cannot happen" comment does not close a defect. For every path that could be reached without the thing it needs, either prove it unreachable by citing the code that makes it so and then assert the invariant, or pass the needed thing down from the caller that has it, changing signatures as far up as needed. A guard that silently skips work is a silent partial result and is forbidden.
3. **A check that goes red is a design fact, never a number to get under.** Find the coupling the check names and remove it by a change the brief would approve, or stop and report the check red with the reason.
4. **The brief's fix text is the specification.** A premise found wrong is reported with the evidence, and the rest of the brief still lands; the substitute is the orchestrator's to write, not the builder's. A shape the brief reserves for the user (a public signature, a config key, a wire format, a vocabulary) is never chosen by the builder. A point that a review or the brief leaves to the orchestrator (a substitute, a moved file, a rewrite of text the brief dictates) stays as the brief has it and is reported as a stop; the report never decides it as a judgment call.
5. **Every user-visible surface changed is documented in the same step**: the header comment, the page under `docs/` where it is shown, and the ADR that owns the decision when the change touches one.
6. **Verification is the whole tree, every suite, every check**, and the report gives the numbers seen, never the numbers expected. A suite total that moved is a defect in the change until it is traced test by test; a new test moving a total upward is fine and the report says by how much. Zero warnings in every configuration; "pre-existing" excuses nothing.
7. **The report states the end state only.** First line: anything NOT DONE, or that everything in the brief is done. Then the state file's open items verbatim. Then a DONE / NOT DONE table, one row per item, each naming the command that proves it and its output. Then every file changed with its line count, every judgment call the brief left open, every user-visible change with the before and after, and anything in the brief that turned out wrong or impossible, with the evidence. No narration of attempts; no measurement stated that was not taken; partial work never presented as complete.
8. **A test is not a user.** A member whose only callers are tests is dead and is deleted with the check that pinned it, or the check asserts the behaviour another way. A public member with no in-tree caller is not dead by this rule: the report states the facts and the user rules.
9. **A test never asserts a known defect, and no check is loosened to pass.** A threshold, tolerance or predicate widened to make a check green is a finding to report, not an edit to make. A green result states, in the same breath, what it does not cover.
10. **No history in code or comments.** A comment says what the code does and why, never when it was written, which step or session wrote it, what bug came before it or what was reverted. No roadmap or step numbers in comments. ASCII only, no em dashes, no double blank lines.
11. **Nothing added on a hypothesis.** No mutable global state; no member, parameter or file whose only user is a test or a hypothetical caller; no dependency the brief did not name.
12. **Nothing inside the brief is left undone.** A miss is fixed before the report is written, or it is a stop with the evidence and the rest still lands. A miss is never reported as a known limit, a gap, a sharp edge or a later item.
13. **A test proves the change by failing without it, and the report quotes the red.** Every new or changed test names the revert that turns it red, and the report carries that revert and the failing output it produced, verbatim. A test that no revert turns red is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the control's red output is quoted beside it. Every branch the change adds or changes, and every rule its head comment states, has a case, and the report lists them in a table: the branch or rule, the case, the revert and the red line it produced.
14. **A change carries to every place that names it.** After changing a name, a construct or a shape, grep it across <the source tree, the tests, the examples and `docs/`>, and carry the change to every hit or say why not; the report quotes that grep. A sentence in a document or a head comment that the change makes false is a defect of the change. A sentence about the changed file as a whole (its introduction, its head comment, a count, an 'every' or an 'only') is reread against the file after the change, and the report lists each one with the line that shows it still holds. A script's head comment or docstring lists every input it reads, every error it prints and every exit status it returns; an error added to the script is added to that list in the same change.
15. **Edges are exercised, not assumed.** For a script, every form of input its own rules name is a case: each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code. Every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one; every concurrent path is exercised in flight, after teardown and superseded by a later one; a value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text.
16. **A write verifies its own result.** A step or a tool that rewrites a file's text re-parses what it wrote and refuses when the reparse is not what was asked. A write that cannot verify itself does not land.
17. **A rewrite keeps the meaning of every rule it carries.** When a change rewrites, moves or splits text that states a rule, the new text states the same rule with the same scope: every condition, exception and limit of the old text is kept and none is added. A change of meaning the brief does not ask for is reported as a stop.
18. **A change leaves no two statements that contradict each other.** Each rule the change writes is grepped by its key terms across the changed files and the pages they name, and a statement that says otherwise is changed in the same step, or reported as a stop when the brief does not cover it.
19. **Nothing is changed that no brief item asks for.** A change outside the brief's items is left out; when an item cannot be met without it, the report lists it under the judgment calls with the item it serves.

## Where the work happens

- In the git worktree the brief names, never in the main checkout. Every path in the brief is relative to that worktree.
- No git command that changes state: no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`. Reading with `git status`, `git diff` and `git show` is fine; a file is moved with `mv`.
- Nothing under the ledger folder is edited except the report the brief names. The plan, the state file and the briefs belong to the orchestrator.
- No sub-agents; no background shells, sleeping or polling, except a capture of a run the runner's command cap would kill, with its whole output written to a file the report names.

## Commands and their filters

Every build, test or check command runs in the foreground with a long timeout, one configuration per command, and its output goes through a filter for its summary lines so raw build output never enters the context:

```
<each verification command from docs/dev/building.md, piped through the grep that keeps its summary lines>
```

A step's verify list runs through the `land` skill's `templates/verify.sh` from the root of the checkout it checks, as `sh <skills>/land/templates/verify.sh <state file>` with `<skills>` the first of the repository's `.agents/skills`, `~/.agents/skills` and `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`) that holds the `land` skill, and the lines it prints are what a report or a booking quotes, never a count.

When a run is red, rerun the one suite or check that failed and read that output, never the whole run's. A claim about behaviour, cost or memory names the command that produced it, or is written as not verified.
