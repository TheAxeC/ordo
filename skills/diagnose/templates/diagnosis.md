# Diagnosis: <the symptom in a few words>

Every quoted command output carries `<REDACTED>` in place of the value of a secret in it, as the rules file's rule on secrets in quoted command output says. A diagnosis of the same step later is appended below under its own heading at the level of the title above, `# Diagnosis: <the symptom in a few words>`, which names its finding or quotes its part.

Diagnosis agent: <the agent's id, its served model, its tokens, tool uses and time from its completion notice, filled by the session, or "none, run by a person">

## Symptom

<the symptom, quoted exactly: the user's words, or the failure scenario of the finding in the report that holds it, with the report's path and the finding's name; for `premise`, what the step's text says happens, with the part quoted and the path of `plan.md`>

## Where the probes run

<the checkout or worktree, or the scratch copy's path with its commit and what was applied to it>. The paths redirected under `$TMPDIR`: <HOME, ORDO_STABLE, ORDO_SKILL_DIRS, or none>.

For a finding of a reviewer's report, taken before the copy was made, from inside the step's worktree:

```
<the output of git status --short>
<the output of git diff --binary <base> | shasum>
```

## Red command

```
<the one command>
```

Runs, with the output of each quoted:

```
<run 1: the command and its output>
<run 2: the command and its output>
<run 3: the command and its output>
```

<for a symptom seen only sometimes: the failure rate and the number of runs it was measured over; for a slow symptom: the baseline with its mean and spread, and the threshold red is defined as; for a defect in text: the quoted text beside the line of the run or transcript that shows the wrong behaviour it led to>

<for a red command a person drives: each run's actions with the user's observation after each, quoted whole, and which observation is the red>

```
<the actions of each run with the user's observation after each, quoted whole>
```

Runs after the tightening, with the output of each quoted:

```
<the command and its output>
```

## No red command

<written only when no red command could be built: each way tried from "Ways to build a red command", with what it gave, and why the scratch copy could not reproduce the symptom when that is so; otherwise "not applicable">

## Shrunk case

| Cut | Result of the red command after it | Kept or put back |
|---|---|---|
| <the part of the case cut: an input, a caller, a configuration value, a piece of data, a stage of the run> | <the result, red or green, and the line that shows it> | <cut, or put back because it turned the red command green> |

The shrunk case, as it stands: <each part left, each one needed for the red>.

## Hypotheses

1. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
2. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.
3. If <cause>, then <change> turns the red command green. Falsified by: <the result that would falsify it>.

The reply to the hypotheses, or "none, no person present": <what the user ranked, dropped or added>.

The second list, when every hypothesis was falsified, in the same form: <the hypotheses, or "not needed">.

## Probes

| Hypothesis rank | The one change, as a diff | The run | Result |
|---|---|---|---|
| <the rank> | <the one change, with the tag `DIAG-<4 hex digits>` on any logging it adds> | <the red command's output after the change> | <falsified, or still standing, with each other input its change broke> |

## Cause

<the cause at the operation that goes wrong, with its place and the rule it breaks, beside the probe that shows it: the red command green with the change and red without it, and each other input written as not fixed, or "none"; or "cause not found", with every probe above, or every way tried under "No red command", and the condition that makes it not found>

## Operation and other inputs

The operation that goes wrong: <the comparison, lookup, write or parse that gives the wrong result, with its place (the file and line, or the section of a text) and the rule it breaks; or "cause not found">.

| Other input | Why it reaches the operation | Right result | Result on the tree without the fix | Result with the change of the probe that shows the cause | Class | Result after the fix |
|---|---|---|---|---|---|---|
| <the input, in place of the reported one> | <where the code that feeds the operation admits it> | <this input's right result> | <right or wrong, with the red command's output with this input and the line that shows it> | <the same, with the change of the probe> | <part of the defect, not part of the defect, or another defect> | <its right result; or what it gave without the fix; or left out, for another defect; or not fixed, with its result> |

<when the code that feeds the operation admits no input but the reported one: "none", with the reason; for a defect in text: each other situation the instruction governs, read against the text, in place of a run>

## Fix and test

Test, run on the tree without the fix:

```
<the test's command and its failing output for each test case, showing the symptom>
```

Fix:

```
<the change, as a diff>
```

For `premise`, the test's source as written, since `/spec` carries it into the brief after the scratch copy is removed:

```
<the test's source>
```

Runs after the fix:

```
<the test's command and its passing output>
<the red command and its output>
<the original, unshrunk case and its output>
<the red command on each other input, in place of the reported one, and its output>
```

<for a defect in text: the text before and the text after, with each other situation read against both and no test>

No test reaches it: <the reason no test can reach the defect as it occurs, or "not applicable">. No test is written: <"the failure costs nothing", or "not applicable">.

## Cleanup

```
<the grep of the tag over the tree the probes ran in, and its empty output>
```

<the scratch copy and each throwaway file removed, a credential or .env file copied into `$TMPDIR` among them; the red command run again on the original case and its output, or "carried by the round as its check", or for `premise` "carried by the brief as its check">
