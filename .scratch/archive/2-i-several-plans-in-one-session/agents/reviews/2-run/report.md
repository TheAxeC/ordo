# The run's report

Roadmap entry 5 (The guide's install line and its test). Plan step 3 of 3: the closing. Next: the closing's roadmap diff, then the entry commit and the move of the folder, after the user's ruling.

- Open item Step 3, the roadmap diff of `/roadmap done 5` (2026-10-12), kind 4 of the six kinds left open: the closing step's `/roadmap done 5` drafted entry 5 removed from the open order and the line `- [x] 5. The guide's install line and its test: ...` added under "Done", with the gate's output as run on main at e0e999e (`1`; `PASS: docs/guide.md`; `FAIL: <that file>: first line is not a title`; `FAIL: <that file>: line 3 holds a tab`; `1`). Options: (a) approve the diff, then the entry commit and the move of this folder to `.scratch/archive/` follow; pro, the plan closes with its gate's output on record; con, none found. (b) correct the diff; pro, a wording the user prefers; con, another round of the closing. Recommendation: (a). The lazy option is leaving the diff unruled, which keeps the plan open with nothing left to build.

Roadmap entry 3 (The guide's usage line and its FAQ). Plan step 3 of 3: the closing. Next: the closing's roadmap diff, then the entry commit and the move of the folder, after the user's ruling.

- Open item Step 3, the roadmap diff of `/roadmap done 3` (2026-10-12), kind 4 of the six kinds left open: the closing step's `/roadmap done 3` drafted entry 3 removed from the open order and the line `- [x] 3. The guide's usage line and its FAQ: ...` added under "Done", with the gate's output as run and read on main at 77bf30f (`1`; `# FAQ`; `2`; both questions read in place are about the guide, each followed by its answer). Options: (a) approve the diff, then the entry commit and the move of this folder to `.scratch/archive/` follow; pro, the plan closes with its gate's output on record; con, none found. (b) correct the diff; pro, a wording the user prefers; con, another round of the closing. Recommendation: (a). The lazy option is leaving the diff unruled, which keeps the plan open with nothing left to build.

## The roadmap diffs

Both are drafted against `docs/roadmap.md` at 9907c22 and neither is written. Each is shown on its own; approved together, the second is applied to the file the first leaves.

```diff
@@ entry 5 @@
-## 5. The guide's install line and its test
-
-- Status: [ ]
-- Goal: ...
-- Gate: ...
-- Waits on: nothing.
-
+- [x] 5. The guide's install line and its test: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh'` printed `1`; `sh tests/guide.test.sh` printed `PASS: docs/guide.md`; `sh tests/guide.test.sh <a file whose first line is Guide>` printed `FAIL: <that file>: first line is not a title`; `sh tests/guide.test.sh <a file whose first line is "# Guide" and whose third line holds a tab>` printed `FAIL: <that file>: line 3 holds a tab`; `grep -c -F 'sh tests/guide.test.sh 2>&1 | tail -1' docs/dev/building.md` printed `1`
```

```diff
@@ entry 3 @@
-## 3. The guide's usage line and its FAQ
-
-- Status: [ ]
-- Goal: ...
-- Gate: ...
-- Waits on: nothing.
-
+- [x] 3. The guide's usage line and its FAQ: `sed -n 3p docs/guide.md | grep -c 'sh install\.sh[^.]*\. [^.]*sh run\.sh <name>'` printed `1`; `head -1 docs/faq.md` printed `# FAQ`; `grep -c '^## .*?$' docs/faq.md` printed `2`; read in place, "What does the guide cover?" and "Where does the guide say what the project is?" are about the guide and each is followed by a paragraph that answers it
```

## Steps landed since the loop began

Plan 5:

- Step 1, the install sentence: 1d789a9, `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/1-landing.md`.
- Step 2, the guide's test: 9374825, `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/2-landing.md`.

Plan 3:

- Step 2, the FAQ: 5c00750, `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-landing.md`.
- Step 1, the usage sentence: cad4c19, `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/1-landing.md`.

The closing reports: `.scratch/5-the-guide-s-install-line-and-its-test/agents/reviews/closing.md` (e0e999e) and `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/closing.md` (77bf30f).

## Choices taken under self-rule since the loop began

None: no open item outside the six kinds was raised in the run, and `.scratch/choices.md` does not exist (`cat .scratch/choices.md` printed "No such file or directory"). The choices are reviewed in `.scratch/choices.md` with `C<n> Agree` or `C<n> => <ruling>`.

## NOT DONE

- The two closings past their roadmap diffs: each waits for the user's ruling, kind 4.

## DONE / NOT DONE

| Row | Status | Command and output |
|---|---|---|
| Every step of both plans built, reviewed and landed | DONE | `git log --oneline` lists the four landing commits 1d789a9, 5c00750, 9374825, cad4c19 |
| No step in flight | DONE | `grep -c '^- step:' .scratch/*/orchestrator-state.md` printed `0` for both state files; `git worktree list \| wc -l` printed `1` |
| The guide's test on main through plan 3's verify list | DONE | `land.sh` for plan 3's step 1 printed `$ sh tests/guide.test.sh 2>&1 \| tail -1`, `PASS: docs/guide.md`, `checks: 2 commands passed` |
| Both closing reports | DONE | `plan_cost.py` exited 0 on each ledger; plan 5: 6 agents, 3.38 USD; plan 3: 4 agents, 1.17 USD |
| Both roadmap diffs | NOT DONE | drafted and shown, unwritten, kind 4 |
