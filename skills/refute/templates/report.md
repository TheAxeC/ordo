# Step <step> refuter report (on <worktree>, base <commit>)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

## Verification (rerun by the reviewer)

```
<each command of the brief's verification list, and its summary line, verbatim>
<each command the report quotes as evidence, and what it printed>
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- <n>: holds, <the evidence>; or violated, <the finding, as heading and number>; or not applicable, <the reason>.

Cases of the brief's "Cases":

- <the case>: met, <the test or the reading that gives the expected result>; or partial, <the missing part>, <the finding>; or unmet, <the finding>; or not verifiable, <what would settle it>.

## 1. Spec

- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <what is there>, <what the brief asked for>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 2. Proof

- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the claim>, <what the rerun showed>; for a count, a path or a measurement, <the decision that rests on it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 3. Standards

- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the rule broken, with the standard's file and rule>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## 4. Behaviour

- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <what a host or a user sees change>, <where the report should have stated it>; failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

## Declined to judge

- <a point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.

Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.

## Repair round <n>, refuted (one section per run after a round, when the configuration block says refute_after_repair: yes)

```
<each verification command rerun over the repaired tree, and its summary line, verbatim>
<each command the round's report quotes as evidence, and what it printed>
```

### Verdicts

- <n>, and <the case>: the verdicts again for the whole diff since the base, in the form of "Verdicts" above.

### Findings

- <file:line, or page and section>: "<the quoted hunk>"; what is wrong: <the closure claimed and what the rerun or the read showed, or what is there against what the brief or the standard asks>; under the heading it belongs to (spec, proof, standards, behaviour); failure scenario: <the input or state and the wrong result it gives, or the reader and what the text leads them to do wrong>; verdict: <the item or case it makes violated, partial or unmet, when there is one>. Or: none.

### Declined to judge

- <a point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.

Reviewer usage: <agent id>, <served model>, <tokens>, <tool uses>, <minutes>.

## Closed (the orchestrator's disposition of every finding above, appended before /land)

- <finding>: closed in the round, <file:line, or page and section, and the check that shows it>; or fixed at landing, <what and where>; or raised to the user as an open item, <the item as the state file holds it>.
