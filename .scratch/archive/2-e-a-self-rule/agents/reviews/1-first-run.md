NOT DONE: stopped at the first run, before any change to code or text. Two cases of the brief's "Cases" pass on the unchanged tree, although the brief says every case except the (preserved) ones fails there. Items 1 to 11 of "What to build" are not started; the only file changed is `skills/ordo-init/templates/check_config.test.sh` (the new cases, 354 lines before, 540 now; its head comment is not yet updated).

## Open items

None.

## The case the brief's rules get wrong

Two cases, one rule.

- Case 1 of "Cases": "The one-project example as shipped passes, and `lacks_line` shows none of the three keys' not-set notes (the `five-keys` pattern)". Test: `three-keys`.
- Case 2 of "Cases": "The projects example passes, and `lacks_line` shows none of the three keys' not-set notes for tool-a or tool-b". Test: `projects-three`. Its control (`projects-three-control`, the removal from tool-b) fails on the unchanged tree as required.
- Rule: "Cases" says every case except the (preserved) ones fails on the unchanged tree; the change standard's rule 13 says a test of a behaviour the change adds fails on the unchanged tree, and that a test which would still pass with the behaviour taken out is an audit, not a proof.
- Result: both pass on the unchanged tree. `check_config.py` does not know the three keys there, so it prints no not-set note for them, and `lacks_line` is satisfied whether or not the example holds the keys. Each test is red only after the code learns the keys and while the example still lacks them, which is the order the brief gives the work in, so on the unchanged tree neither can fail.
- What would settle it (the orchestrator's to rule, not chosen here): either (a) the two cases are marked as passing before and after and the proof that the example holds the three keys is carried by another case, for example a probe that appends `self_rule: off`, `next_entry: off` or `repair_reviewer: claude:opus` to the shipped example and expects `key written twice: <key>`, which fails on the unchanged tree because the example lacks the key (the error there is `unknown key`); or (b) the two cases are kept as written with that probe added beside them. The probe uses the duplicate check as the means of finding that the key is in the example; it adds no code to `check_config.py`.

## The cases' first run on the unchanged tree

Command: the test file as written, run with `fail` changed to print and go on, so each case's result shows (`/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/firstrun.sh`, output in `firstrun.out` beside it; the copy differs from the test file only in `fail` not exiting and `script_dir` being set to the worktree). Run as `sh firstrun.sh`, 27 distinct cases print FAIL lines (40 FAIL lines in all, since a case can fail more than one assertion). The real test file, `sh skills/ordo-init/templates/check_config.test.sh 2>&1`, stops at its first failing case and exits 1:

```
FAIL: projects-three-control: missing the line [note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies] in: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it
note: tool-b: adr folder docs/adr does not exist yet; repo-setup or grill creates it
ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists
```

Every case of "Cases", in the brief's order, with the test that holds it and its result on the unchanged tree:

| Case | Test | Result on the unchanged tree |
|---|---|---|
| one-project example as shipped, no not-set notes | `three-keys` | PASSES (the case above) |
| projects example as shipped, no not-set notes | `projects-three` | PASSES (the case above) |
| projects control, tool-b without repair_reviewer, has the note | `projects-three-control` | FAILS: missing the line `note: tool-b: repair_reviewer not set, the reviewer's value 'claude:opus' applies` |
| the three keys removed, the three notes | `three-keys-removed` | FAILS: missing `note: self_rule not set, default off applies`, `note: next_entry not set, default off applies` and `note: repair_reviewer not set, the reviewer's value 'claude:opus' applies` |
| `reviewer: claude:haiku`, repair_reviewer removed | `repair-default-haiku` | FAILS: missing `note: repair_reviewer not set, the reviewer's value 'claude:haiku' applies` |
| reviewer removed, repair_reviewer removed | `repair-default-no-reviewer` | FAILS: the error line is present; missing `note: repair_reviewer not set, the reviewer's value applies` |
| `reviewer: opus`, repair_reviewer removed | `repair-default-bad-reviewer` | FAILS: the error line is present; missing `note: repair_reviewer not set, the reviewer's value applies` |
| reviewer removed, `repair_reviewer: claude:sonnet`, one error line | `repair-set-no-reviewer` | FAILS: 2 error lines (`required key missing: reviewer`, `unknown key: repair_reviewer`) |
| `self_rule: on`, `next_entry: on` pass, no note naming next_entry | `self-rule-on` | FAILS: `error: unknown key: self_rule`, `error: unknown key: next_entry` |
| `self_rule: yes`, `true`, `On` pass | `self-rule-yes`, `self-rule-true`, `self-rule-On` | each FAILS: `error: unknown key: self_rule` |
| `self_rule: maybe` | `self-rule-maybe` | FAILS: got `error: unknown key: self_rule` |
| `self_rule: "on"` | `self-rule-quoted` | FAILS: got `error: unknown key: self_rule` |
| `self_rule:` nothing | `self-rule-empty` | FAILS: got `error: unknown key: self_rule` |
| `next_entry: 1` | `next-entry-number` | FAILS: got `error: unknown key: next_entry` |
| `next_entry:` nothing | `next-entry-empty` | FAILS: got `error: unknown key: next_entry` |
| `next_entry: on`, `self_rule: off` passes with the note | `next-entry-self-off` | FAILS: `error: unknown key: next_entry`, note missing |
| `next_entry: on`, `self_rule` removed, the two notes | `next-entry-self-absent` | FAILS: `error: unknown key: next_entry`, both notes missing |
| `next_entry: on`, `self_rule: maybe`, one error line, no next_entry note | `next-entry-self-bad` | FAILS: 2 error lines (`unknown key` for each), text `next_entry` present |
| projects, tool-b `next_entry: on`, `self_rule: off` | `projects-next-entry` | FAILS: `error: tool-b: unknown key: self_rule`, `error: tool-b: unknown key: next_entry` |
| `repair_reviewer: opus` | `repair-opus` | FAILS: got `error: unknown key: repair_reviewer` |
| `repair_reviewer: [claude:opus]` | `repair-list` | FAILS: got `error: unknown key: repair_reviewer` |
| `repair_reviewer: 5` | `repair-number` | FAILS: got `error: unknown key: repair_reviewer` |
| `repair_reviewer:` nothing | `repair-empty` | FAILS: got `error: unknown key: repair_reviewer` |
| `repair_reviewer: claude:sonnet` passes | `repair-sonnet` | FAILS: `error: unknown key: repair_reviewer` |
| projects, tool-a `repair_reviewer: opus` | `projects-repair` | FAILS: got `error: tool-a: unknown key: repair_reviewer` |
| `worker:` nothing | `worker-empty` | FAILS: expected an error, got a pass (note and `ok:` lines only) |
| `reviewer:` nothing | `reviewer-empty` | FAILS: expected an error, got a pass (note and `ok:` lines only) |
| (preserved) each of the three keys written twice | `twice-self_rule`, `twice-next_entry`, `twice-repair_reviewer` | PASS each |
| (preserved) `repair_reviewer: claude:sonnet` beside `projects:` | `projects-beside` | PASSES |

The existing cases of the file pass on the unchanged tree: no FAIL line in the first run names one of them.

## Not reported yet

The DONE / NOT DONE table, the verification runs (`checks.sh` and the brief's checks 1 to 7), the before and after of each text item and the judgment calls follow once the orchestrator rules on the two cases and resumes the builder.
