# The change standard

How a change is made in this tree, whoever makes it: a session working inline, or an agent dispatched under a brief. A brief points here first; nothing in a brief overrides anything here. This page says how the work is done and how it is reported.

## Read before changing anything

1. The brief for the step, in full: it is the specification. Where the brief and the tree disagree, stop and report the disagreement with the evidence; do not pick a side and do not invent a substitute.
2. The standards the brief lists, in full. `docs/dev/skill-layout.md` is the standard for every `skills/*/SKILL.md`.
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
10. **No history in code or comments.** A comment says what the code does and why, never when it was written, which step or session wrote it, what bug came before it or what was reverted. No roadmap or step numbers in comments. ASCII only and no em dashes. Prose and comments have no double blank lines; Python code keeps two blank lines between top-level definitions, as PEP 8 lays it out.
11. **Nothing added on a hypothesis.** No mutable global state; no member, parameter or file whose only user is a test or a hypothetical caller; no dependency the brief did not name.
12. **Nothing inside the brief is left undone.** A miss is fixed before the report is written, or it is a stop with the evidence and the rest still lands. A miss is never reported as a known limit, a gap, a sharp edge or a later item.
13. **A test proves the change by failing without it, and the report quotes the red.** Every new or changed test names the revert that turns it red, and the report carries that revert and the failing output it produced, verbatim. A test that no revert turns red is an audit, not a proof: an assertion over source text, over a name alone, over a constant, or over a path the suite never executes. A case asserting that a rule stays silent carries a control, the near-miss the same rule must report, and the control's red output is quoted beside it. Every branch the change adds or changes, and every rule its head comment states, has a case, and the report lists them in a table: the branch or rule, the case, the revert and the red line it produced.
14. **A change carries to every place that names it.** After changing a name, a construct or a shape, grep it across `skills/`, `utils/`, `docs/` and `README.md`, and carry the change to every hit or say why not; the report quotes that grep. A sentence in a document or a head comment that the change makes false is a defect of the change. A sentence about the changed file as a whole (its introduction, its head comment, a count, an 'every' or an 'only') is reread against the file after the change, and the report lists each one with the line that shows it still holds. A script's head comment or docstring lists every input it reads, every error it prints and every exit status it returns; an error added to the script is added to that list in the same change.
15. **Edges are exercised, not assumed.** For a script, every form of input its own rules name is a case: each heading level, list marker and fence form the rules cover, a relative and an absolute path, a directory where a file is expected, an empty value, and text inside fenced code. Every id or key a change introduces is exercised empty, duplicated and colliding with a reserved one; every concurrent path is exercised in flight, after teardown and superseded by a later one; a value a user, a file or a script supplies is untrusted where it reaches a command, a path or generated text.
16. **A write verifies its own result.** A step or a tool that rewrites a file's text re-parses what it wrote and refuses when the reparse is not what was asked. A write that cannot verify itself does not land.
17. **A rewrite keeps the meaning of every rule it carries.** When a change rewrites, moves or splits text that states a rule, the new text states the same rule with the same scope: every condition, exception and limit of the old text is kept and none is added. A change of meaning the brief does not ask for is reported as a stop.
18. **A map from old text to new places names one rule per row and a place that states it.** In the coverage list, each row covers one rule of the old text, and the place the row names states that rule whole, with its qualifiers; the report quotes, for each row, the line of the named place that states it.
19. **A change leaves no two statements that contradict each other.** Each rule the change writes is grepped by its key terms across the changed files and the pages they name, and a statement that says otherwise is changed in the same step, or reported as a stop when the brief does not cover it.
20. **Nothing is changed that no brief item asks for.** A change outside the brief's items is left out; when an item cannot be met without it, the report lists it under the judgment calls with the item it serves.

## Where the work happens

- In the git worktree the brief names, never in the main checkout. Every path in the brief is relative to that worktree.
- No git command that changes state: no `add`, `commit`, `stash`, `checkout`, `mv`, `restore`. Reading with `git status`, `git diff` and `git show` is fine; a file is moved with `mv`.
- Nothing under the ledger folder is edited except the report the brief names. The plan, the state file and the briefs belong to the orchestrator.
- No sub-agents; no background shells, sleeping or polling, except a capture of a run the runner's command cap would kill, with its whole output written to a file the report names.

## Commands and their filters

Every build, test or check command runs in the foreground with a long timeout, one configuration per command, and each test's output goes through a filter for its summary lines so raw build output never enters the context; the ASCII check takes no filter:

```
sh skills/land/templates/land.test.sh 2>&1 | tail -1
sh skills/land/templates/verify.test.sh 2>&1 | tail -1
sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
sh utils/pin.test.sh 2>&1 | tail -1
sh utils/check_coverage.test.sh 2>&1 | tail -1
git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
```

A step's verification runs through `sh skills/land/templates/verify.sh <state file>`, and the report quotes the lines the runner printed, never a count.

When a test is red, rerun that test without the filter and read its output. The ASCII check prints the offending lines themselves; empty output is the pass. A claim about behaviour, cost or memory names the command that produced it, or is written as not verified.

## Rules this repository already states

- The skills carry no project name and no path; everything specific to a repository comes from its `.agents/plan.yaml` (`README.md`, first paragraph).
- Each script under a skill's `templates/` or under `utils/` has a test beside it that runs on scratch repositories (`docs/dev/building.md`).
- The pinned worktree `~/.local/share/ordo-stable` is never edited; the installed skills change only through `utils/pin.sh <tag>` (`README.md`, Working on Ordo).
- A skill's rules state the rule; no dates, incidents or history (`skills/repo-setup/templates/shared-rules.md`, last rule).
