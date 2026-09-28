# Step 6 refuter report

Reviewer: claude:opus, a fresh agent. Worktree `.agents/worktrees/2c-6`, base `ceb39fd`.

## Verification lines

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md` from the worktree root, exit 0: `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests`, the ASCII check with no output, `checks: 7 commands passed`. Each of the four tests run on its own: exit 0 and its `PASS:` line. `git status --short`: the four test files ` M`, the report `??`.

## Spec

1. `skills/repo-setup/templates/sync_rules.test.sh`: the removed not-UTF-8 CLAUDE.md case (`printf 'a\n%s\n\377\n%s\n' "$begin" "$end" >"$test_root/not-utf8/CLAUDE.md"`, `expect_refusal "CLAUDE.md not UTF-8"`) guards lost work. With `read()` reverted to `open(path, encoding="utf-8", errors="replace", newline="")`, the new test stays green (`PASS: sync_rules.py scratch tests`) and the base test goes red (`FAIL: ... not-utf8: exit 1, expected 2`). Failure scenario: a Latin-1 CLAUDE.md (`Caf\351 notes`) with a drifted block; under the revert `--write` printed `written: the shared-rules block now equals the template`, exit 0, and the bytes outside the block went from `43 61 66 e9` to `43 61 66 ef bf bd`.
2. Two kept cases prove only a message or an exit status as fixtured, while the builder removed other cases under that same rule. `utils/pin.test.sh` lines 201-214 (not-a-worktree): the revert turns only the message red; built in scratch with `ORDO_STABLE` an empty plain folder inside the live clone and the refusal reverted, pin printed `pinned: v1 (23729e1), 0 skills linked in: ...`, exit 0, and the live clone went from `main` to `DETACHED at v1`. `utils/check_coverage.test.sh` lines 178-185 (find-fails): the revert turns only 1-versus-2 red; with a `## locked` section listing `SKILL.md` and `sub/guide.md` in an unreadable folder, the reverted check printed `ok: .../list.md`, exit 0. Strengthening a kept case's fixture adds no case and loosens nothing, on a path of the step: inside the step.
3. `utils/pin.sh` line 69 (`[ "$dir" = "$outside" ] && return 0`) has no observable effect in any state the tests build: pin mode runs `mkdir -p "$dir"` (line 247) before `outside_dir` (line 272), so line 71's resolved comparison matches first; removing line 69 leaves the new and the base tests green. Outside this step's "No script changes".

## Proof

1. `utils/pin.test.sh` line 4 says pin mode refuses "before the worktree or a link changes" a pinned worktree with local changes and a link to a folder outside Ordo; those cases (lines 183-189, 191-199) assert only the exit status and the message.
2. Sampled reverts reproduced the report: kept (pin C12, C7, C16 plan, C21, C25 whitespace; cov find-fails, wrong-section, usage-no-skill; sr two-blocks, reversed; cc libraries-boolean) and removed (pin real directory, names no folder, leading whitespace, unknown tag, path comparison only; sr two-ends, not-utf8, template CRLF, read-only; cov option, linked-empty, unclosed fence, plain path, separator, row after table, holds no table, no New skills, missing folder).
3. The real inputs: `find -H` over the four research-hub skill folders, 190 entries, 0 non-ASCII, 0 outside NFC, no links, 169 files; the real coverage run `ok: docs/academic-coverage.md`, exit 0.

## Standards

1. `docs/dev/change-standard.md` line 27 and its `repo-setup` copy (rule 15: "For a script, every form of input its own rules name is a case ...") is contradicted by the removals of the fenced-rows, long-fence, backtick-info, closing-hashes, dotdot/absolute and fence-form cases and pin's leading-whitespace forms; step 5's line does not name rule 15; the report says no line elsewhere is made false.
2. Hard-wrapped comments remain: `utils/pin.test.sh` 22-23, 46-47, 144-145, 216-217; `check_config.test.sh` 113-114; `sync_rules.test.sh` 23-24.

## Behaviour

None beyond Spec 1 and 2.

## Verdicts

- Keep only cases whose failure costs something: not met (Spec 1, Spec 2). A kept case keeps its assertions: met. Fixtures of removed cases removed: met. Head comments rewritten: done, with Proof 1. No script change, no case added: met.
- Cases: each test PASS before and after: met (after rerun). Each kept case red under its revert: met formally; pin not-a-worktree and cov find-fails red only through a message or status (Spec 2). A revert per file quoted: met.

## Declined to judge / not checked

- Not every revert of the report's tables rerun (sample under Proof 2); the report's original line numbers not verified; the first run not rerun.
- The pass controls kept on an assumption (check_config complete, projects, agents-star, libraries-avoid; pin's fresh-pin check; cov complete): the user's ruling.
- The CRLF shared-rules.md removal: considered and not a finding, since it loses nothing outside the block; whether a Windows install is in scope is not settled.
- The reviewer's scratch folders under `$TMPDIR` were left in place.
