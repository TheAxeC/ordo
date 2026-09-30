# Step 1, round 0: the ruling on the cases the brief got wrong

The builder's first run found two cases of "Cases" that pass on the unchanged tree: the one-project example as shipped with `lacks_line` for the three not-set notes (`three-keys`), and the projects example as shipped with `lacks_line` for tool-a and tool-b (`projects-three`). On the unchanged tree `check_config.py` does not know the three keys and prints no not-set note, so neither can fail there.

Ruling (b), inside the step's scope:

1. `three-keys` and `projects-three` stay as written, each marked in its comment as a guard that passes before and after the change: after the change it is red when the shipped example drops one of the three keys. The report quotes its run on the unchanged tree and after the change, as a (preserved)-form case.
2. The proof that the shipped examples hold the three keys is a new case per key and per form: append the key once to the shipped example (`self_rule: off`, `next_entry: off`, `repair_reviewer: claude:opus`; in the projects form, to tool-a and to tool-b) and expect the one error line `error: key written twice: <key>` (with the project prefix in the projects form). On the unchanged tree each fails with `unknown key`, which the report quotes.
3. No code is added to `check_config.py` for these cases.
4. The head comment of `check_config.test.sh` lists the guards and the probes with the other new cases.
