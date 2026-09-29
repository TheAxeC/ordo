# Step <step> refuter report (on <worktree>, base <commit>)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
<each command of the brief's verification list, and its summary line, verbatim>
<each command the report quotes as evidence, and what it printed>
```

## 1. Spec

- <file:line, or page and section>: <what is there>, <what the brief asked for>. Or: none.

## 2. Proof

- <file:line, or page and section>: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>. Or: none.

## 3. Standards

- <file:line, or page and section>: <the rule broken, with the standard's file and rule>. Or: none.

## 4. Behaviour

- <what a host or a user sees change>, <where the report should have stated it>. Or: none.

## Not checked

- <a point the time box left, named>. Or: nothing.

Reviewer usage: <tokens>, <tool uses>, <minutes>.

## Repair round <n>, refuted (one section per run after a round, when the configuration block says refute_after_repair: yes)

```
<each verification command rerun over the repaired tree, and its summary line, verbatim>
```

- <file:line, or page and section>: <the closure claimed>, <what the rerun or the read showed>; under the heading it belongs to (spec, proof, standards, behaviour). Or: none.

Reviewer usage: <tokens>, <tool uses>, <minutes>.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- <finding>: closed in the round, <file:line, or page and section, and the check that shows it>; or fixed at landing, <what and where>; or raised to the user as an open item, <the item as the state file holds it>.
